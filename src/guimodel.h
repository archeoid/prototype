#ifndef GUIMODEL_H
#define GUIMODEL_H

#include <QObject>
#include <QPoint>
#include <qqml.h>

class GUIModel : public QObject {
    Q_OBJECT
    Q_PROPERTY(Action activeAction READ activeAction WRITE changeAction NOTIFY actionChanged)
    Q_PROPERTY(Projection activeProjection READ activeProjection WRITE changeProjection NOTIFY projectionChanged)
    Q_PROPERTY(QPoint mousePos READ mousePos WRITE moveMouse)
    Q_ENUMS(Action)
    Q_ENUMS(Projection)
public:
    enum Action {
        ACTION_SELECT,
        ACTION_MOVE,
        ACTION_ROTATE,
        ACTION_SCALE,
        ACTION_MIRROR,
        ACTION_GROUND,
        ACTION_GRID_SUPPORT,
    };
    enum Projection {
        PROJECTION_ORTHO,
        PROJECTION_PERSPECTIVE
    };

    explicit GUIModel();
    QPoint mousePos() {return _mousePos; };
    Action activeAction() {return _activeAction; };
    Projection activeProjection() {return _activeProjection; };
private:
    QPoint _mousePos;
    Action _activeAction = ACTION_MOVE;
    Projection _activeProjection = PROJECTION_PERSPECTIVE;
public slots:
    void moveMouse(QPoint pos);
    void changeAction(Action action);
    void changeProjection(Projection proj);
signals:
    void mouseMoved();
    void actionChanged();
    void projectionChanged();
};

#endif // GUIMODEL_H
