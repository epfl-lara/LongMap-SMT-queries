; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78406 () Bool)

(assert start!78406)

(declare-fun mapNonEmpty!30525 () Bool)

(declare-fun mapRes!30525 () Bool)

(declare-fun tp!58593 () Bool)

(declare-fun e!513085 () Bool)

(assert (=> mapNonEmpty!30525 (= mapRes!30525 (and tp!58593 e!513085))))

(declare-fun mapKey!30525 () (_ BitVec 32))

(declare-datatypes ((V!30551 0))(
  ( (V!30552 (val!9645 Int)) )
))
(declare-datatypes ((ValueCell!9113 0))(
  ( (ValueCellFull!9113 (v!12161 V!30551)) (EmptyCell!9113) )
))
(declare-datatypes ((array!54373 0))(
  ( (array!54374 (arr!26137 (Array (_ BitVec 32) ValueCell!9113)) (size!26598 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54373)

(declare-fun mapValue!30525 () ValueCell!9113)

(declare-fun mapRest!30525 () (Array (_ BitVec 32) ValueCell!9113))

(assert (=> mapNonEmpty!30525 (= (arr!26137 _values!1231) (store mapRest!30525 mapKey!30525 mapValue!30525))))

(declare-fun b!914535 () Bool)

(declare-fun e!513088 () Bool)

(declare-fun tp_is_empty!19189 () Bool)

(assert (=> b!914535 (= e!513088 tp_is_empty!19189)))

(declare-datatypes ((array!54375 0))(
  ( (array!54376 (arr!26138 (Array (_ BitVec 32) (_ BitVec 64))) (size!26599 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54375)

(declare-fun b!914536 () Bool)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun e!513086 () Bool)

(assert (=> b!914536 (= e!513086 (and (= (size!26598 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26599 _keys!1487) (size!26598 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (= (size!26599 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)) (bvsgt #b00000000000000000000000000000000 (size!26599 _keys!1487))))))

(declare-fun b!914537 () Bool)

(assert (=> b!914537 (= e!513085 tp_is_empty!19189)))

(declare-fun b!914538 () Bool)

(declare-fun e!513084 () Bool)

(assert (=> b!914538 (= e!513084 (and e!513088 mapRes!30525))))

(declare-fun condMapEmpty!30525 () Bool)

(declare-fun mapDefault!30525 () ValueCell!9113)

(assert (=> b!914538 (= condMapEmpty!30525 (= (arr!26137 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9113)) mapDefault!30525)))))

(declare-fun mapIsEmpty!30525 () Bool)

(assert (=> mapIsEmpty!30525 mapRes!30525))

(declare-fun res!616764 () Bool)

(assert (=> start!78406 (=> (not res!616764) (not e!513086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78406 (= res!616764 (validMask!0 mask!1881))))

(assert (=> start!78406 e!513086))

(assert (=> start!78406 true))

(declare-fun array_inv!20492 (array!54373) Bool)

(assert (=> start!78406 (and (array_inv!20492 _values!1231) e!513084)))

(declare-fun array_inv!20493 (array!54375) Bool)

(assert (=> start!78406 (array_inv!20493 _keys!1487)))

(assert (= (and start!78406 res!616764) b!914536))

(assert (= (and b!914538 condMapEmpty!30525) mapIsEmpty!30525))

(assert (= (and b!914538 (not condMapEmpty!30525)) mapNonEmpty!30525))

(get-info :version)

(assert (= (and mapNonEmpty!30525 ((_ is ValueCellFull!9113) mapValue!30525)) b!914537))

(assert (= (and b!914538 ((_ is ValueCellFull!9113) mapDefault!30525)) b!914535))

(assert (= start!78406 b!914538))

(declare-fun m!848637 () Bool)

(assert (=> mapNonEmpty!30525 m!848637))

(declare-fun m!848639 () Bool)

(assert (=> start!78406 m!848639))

(declare-fun m!848641 () Bool)

(assert (=> start!78406 m!848641))

(declare-fun m!848643 () Bool)

(assert (=> start!78406 m!848643))

(check-sat (not start!78406) (not mapNonEmpty!30525) tp_is_empty!19189)
(check-sat)
(get-model)

(declare-fun d!112499 () Bool)

(assert (=> d!112499 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78406 d!112499))

(declare-fun d!112501 () Bool)

(assert (=> d!112501 (= (array_inv!20492 _values!1231) (bvsge (size!26598 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78406 d!112501))

(declare-fun d!112503 () Bool)

(assert (=> d!112503 (= (array_inv!20493 _keys!1487) (bvsge (size!26599 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78406 d!112503))

(declare-fun b!914569 () Bool)

(declare-fun e!513124 () Bool)

(assert (=> b!914569 (= e!513124 tp_is_empty!19189)))

(declare-fun b!914570 () Bool)

(declare-fun e!513123 () Bool)

(assert (=> b!914570 (= e!513123 tp_is_empty!19189)))

(declare-fun mapIsEmpty!30534 () Bool)

(declare-fun mapRes!30534 () Bool)

(assert (=> mapIsEmpty!30534 mapRes!30534))

(declare-fun condMapEmpty!30534 () Bool)

(declare-fun mapDefault!30534 () ValueCell!9113)

(assert (=> mapNonEmpty!30525 (= condMapEmpty!30534 (= mapRest!30525 ((as const (Array (_ BitVec 32) ValueCell!9113)) mapDefault!30534)))))

(assert (=> mapNonEmpty!30525 (= tp!58593 (and e!513123 mapRes!30534))))

(declare-fun mapNonEmpty!30534 () Bool)

(declare-fun tp!58602 () Bool)

(assert (=> mapNonEmpty!30534 (= mapRes!30534 (and tp!58602 e!513124))))

(declare-fun mapValue!30534 () ValueCell!9113)

(declare-fun mapKey!30534 () (_ BitVec 32))

(declare-fun mapRest!30534 () (Array (_ BitVec 32) ValueCell!9113))

(assert (=> mapNonEmpty!30534 (= mapRest!30525 (store mapRest!30534 mapKey!30534 mapValue!30534))))

(assert (= (and mapNonEmpty!30525 condMapEmpty!30534) mapIsEmpty!30534))

(assert (= (and mapNonEmpty!30525 (not condMapEmpty!30534)) mapNonEmpty!30534))

(assert (= (and mapNonEmpty!30534 ((_ is ValueCellFull!9113) mapValue!30534)) b!914569))

(assert (= (and mapNonEmpty!30525 ((_ is ValueCellFull!9113) mapDefault!30534)) b!914570))

(declare-fun m!848661 () Bool)

(assert (=> mapNonEmpty!30534 m!848661))

(check-sat (not mapNonEmpty!30534) tp_is_empty!19189)
(check-sat)
