#ifndef GUIMODEL_H
#define GUIMODEL_H

#include <QObject>
#include <QPoint>
#include <qqml.h>

class GUIModel : public QObject {
    Q_OBJECT
    Q_PROPERTY(int activeAction READ activeAction WRITE changeAction NOTIFY actionChanged)
    Q_PROPERTY(QPoint mousePos READ mousePos WRITE moveMouse)
public:
    explicit GUIModel();
    QPoint mousePos() {return _mousePos; };
    int activeAction() {return _activeAction; };
private:
    QPoint _mousePos;
    int _activeAction;
public slots:
    void moveMouse(QPoint pos);
    void changeAction(int action);
signals:
    void mouseMoved();
    void actionChanged();
};

#endif // GUIMODEL_H
