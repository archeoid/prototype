#ifndef GLRENDERER_H
#define GLRENDERER_H

#include <QObject>
#include <qqml.h>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickPaintedItem>
#include <QtGui/QOpenGLShaderProgram>
#include <QtGui/QOpenGLFunctions>
#include <QtQuick/qquickwindow.h>
#include "guimodel.h"

class GLRenderer : public QQuickItem, protected QOpenGLFunctions
{
    Q_OBJECT
    Q_PROPERTY(GUIModel* guiModel READ GUI WRITE setGUIModel)
    Q_PROPERTY(int fps READ FPS NOTIFY fpsChanged)
    QML_ELEMENT
public:
    GLRenderer(QQuickItem *parent = 0);
    GUIModel* GUI() {return _guiModel;}
    void setGUIModel(GUIModel* guiModel);
    int FPS() { return ms_per_frame>0 ? 1000/ms_per_frame : -1; }
private:
    int ms_per_frame = 0;
    GUIModel* _guiModel = nullptr;
    QSize viewportSize;
    QOpenGLShaderProgram *program = nullptr;
public slots:
    void sync();
    void init();
    void paint();
private slots:
    void handleWindowChanged(QQuickWindow *win);
    void updateFPS();
signals:
    void fpsChanged();
};

#endif // GLRENDERER_H
