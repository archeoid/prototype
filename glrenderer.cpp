#include "glrenderer.h"
#include <iostream>

GLRenderer::GLRenderer(QQuickItem *parent) : QQuickItem(parent)
{
    connect(this, &GLRenderer::windowChanged, this, &GLRenderer::handleWindowChanged, Qt::DirectConnection);
}

void GLRenderer::setGUIModel(GUIModel *guiModel) {
    _guiModel = guiModel;
}


void GLRenderer::handleWindowChanged(QQuickWindow *win)
{
    if (win) {
        connect(win, &QQuickWindow::beforeSynchronizing, this, &GLRenderer::sync, Qt::DirectConnection);
        connect(win, &QQuickWindow::frameSwapped, win, &QQuickWindow::update, Qt::DirectConnection);
        connect(win, &QQuickWindow::afterRendering, this, &GLRenderer::updateFPS, Qt::DirectConnection);
        connect(window(), &QQuickWindow::beforeRendering, this, &GLRenderer::init, Qt::DirectConnection);
        connect(window(), &QQuickWindow::beforeRenderPassRecording, this, &GLRenderer::paint, Qt::DirectConnection);
    }
}

void GLRenderer::sync()
{
    viewportSize = window()->size() * window()->devicePixelRatio();
}
void GLRenderer::init()
{

    if (!program) {
        initializeOpenGLFunctions();

        program = new QOpenGLShaderProgram();
        program->addCacheableShaderFromSourceCode(QOpenGLShader::Vertex,
                                                   "attribute highp vec4 vertices;"
                                                    "varying highp vec2 coords;"
                                                    "void main() {"
                                                    "    gl_Position = vertices;"
                                                    "    coords = vertices.xy;"
                                                    "}");
        program->addCacheableShaderFromSourceCode(QOpenGLShader::Fragment,
                                                    "varying highp vec2 coords;"
                                                    "void main() {"
                                                    "    gl_FragColor = vec4(1,0,1,1);"
                                                    "}");

        program->bindAttributeLocation("vertices", 0);
        if (!program->link()) std::cerr << "LINK FAILED\n";

    }
}

void GLRenderer::updateFPS() {
    static auto time = std::chrono::high_resolution_clock::now();
    static short count = 0;
    auto now = std::chrono::high_resolution_clock::now();
    ms_per_frame = std::chrono::duration_cast<std::chrono::milliseconds>(now-time).count();
    if(count++%10==0)
        emit fpsChanged();
    time = now;
}

void GLRenderer::paint()
{
    if(!GUI())
        return;

    window()->beginExternalCommands();
    program->bind();
    program->enableAttributeArray(0);

    float r = viewportSize.width()/(float)viewportSize.height();
    float x = 2*GUI()->mousePos().x()/(float)viewportSize.width() - 1;
    float y = -(2*GUI()->mousePos().y()/(float)viewportSize.height() - 1);
    float d = 0.1;

    auto i = (GUI()->mousePos().x() / (viewportSize.width()/4));
    if(i >= 1)
        GUI()->changeAction(i);


    float values[] = {
        x-d, y-d*r,
        x+d, y-d*r,
        x-d, y+d*r,
        x+d, y+d*r
    };
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    program->setAttributeArray(0, GL_FLOAT, values, 2);

    glClearColor(0,0,0,1);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glViewport(0, 0, viewportSize.width(), viewportSize.height());
    glDisable(GL_DEPTH_TEST);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE);

    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

    program->disableAttributeArray(0);
    program->release();
    window()->resetOpenGLState();
    window()->endExternalCommands();
}
