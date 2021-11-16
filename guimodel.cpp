#include "guimodel.h"

GUIModel::GUIModel()
{

}
void GUIModel::moveMouse(QPoint pos) {
    if(pos == _mousePos)
        return;
    _mousePos = pos;
    emit mouseMoved();
}
void GUIModel::changeAction(int action) {
    if(action == _activeAction)
        return;
    _activeAction = action;
    emit actionChanged();
}
