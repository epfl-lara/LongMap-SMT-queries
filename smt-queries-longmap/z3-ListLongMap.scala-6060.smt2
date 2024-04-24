; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78592 () Bool)

(assert start!78592)

(declare-fun mapNonEmpty!30525 () Bool)

(declare-fun mapRes!30525 () Bool)

(declare-fun tp!58593 () Bool)

(declare-fun e!513817 () Bool)

(assert (=> mapNonEmpty!30525 (= mapRes!30525 (and tp!58593 e!513817))))

(declare-fun mapKey!30525 () (_ BitVec 32))

(declare-datatypes ((V!30551 0))(
  ( (V!30552 (val!9645 Int)) )
))
(declare-datatypes ((ValueCell!9113 0))(
  ( (ValueCellFull!9113 (v!12159 V!30551)) (EmptyCell!9113) )
))
(declare-fun mapValue!30525 () ValueCell!9113)

(declare-datatypes ((array!54433 0))(
  ( (array!54434 (arr!26162 (Array (_ BitVec 32) ValueCell!9113)) (size!26622 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54433)

(declare-fun mapRest!30525 () (Array (_ BitVec 32) ValueCell!9113))

(assert (=> mapNonEmpty!30525 (= (arr!26162 _values!1231) (store mapRest!30525 mapKey!30525 mapValue!30525))))

(declare-fun res!617218 () Bool)

(declare-fun e!513818 () Bool)

(assert (=> start!78592 (=> (not res!617218) (not e!513818))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78592 (= res!617218 (validMask!0 mask!1881))))

(assert (=> start!78592 e!513818))

(assert (=> start!78592 true))

(declare-fun e!513814 () Bool)

(declare-fun array_inv!20520 (array!54433) Bool)

(assert (=> start!78592 (and (array_inv!20520 _values!1231) e!513814)))

(declare-datatypes ((array!54435 0))(
  ( (array!54436 (arr!26163 (Array (_ BitVec 32) (_ BitVec 64))) (size!26623 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54435)

(declare-fun array_inv!20521 (array!54435) Bool)

(assert (=> start!78592 (array_inv!20521 _keys!1487)))

(declare-fun b!915677 () Bool)

(declare-fun e!513815 () Bool)

(declare-fun tp_is_empty!19189 () Bool)

(assert (=> b!915677 (= e!513815 tp_is_empty!19189)))

(declare-fun b!915678 () Bool)

(assert (=> b!915678 (= e!513817 tp_is_empty!19189)))

(declare-fun b!915679 () Bool)

(assert (=> b!915679 (= e!513814 (and e!513815 mapRes!30525))))

(declare-fun condMapEmpty!30525 () Bool)

(declare-fun mapDefault!30525 () ValueCell!9113)

(assert (=> b!915679 (= condMapEmpty!30525 (= (arr!26162 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9113)) mapDefault!30525)))))

(declare-fun b!915680 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915680 (= e!513818 (and (= (size!26622 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26623 _keys!1487) (size!26622 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011) (= (size!26623 _keys!1487) (bvadd #b00000000000000000000000000000001 mask!1881)) (bvsgt #b00000000000000000000000000000000 (size!26623 _keys!1487))))))

(declare-fun mapIsEmpty!30525 () Bool)

(assert (=> mapIsEmpty!30525 mapRes!30525))

(assert (= (and start!78592 res!617218) b!915680))

(assert (= (and b!915679 condMapEmpty!30525) mapIsEmpty!30525))

(assert (= (and b!915679 (not condMapEmpty!30525)) mapNonEmpty!30525))

(get-info :version)

(assert (= (and mapNonEmpty!30525 ((_ is ValueCellFull!9113) mapValue!30525)) b!915678))

(assert (= (and b!915679 ((_ is ValueCellFull!9113) mapDefault!30525)) b!915677))

(assert (= start!78592 b!915679))

(declare-fun m!850689 () Bool)

(assert (=> mapNonEmpty!30525 m!850689))

(declare-fun m!850691 () Bool)

(assert (=> start!78592 m!850691))

(declare-fun m!850693 () Bool)

(assert (=> start!78592 m!850693))

(declare-fun m!850695 () Bool)

(assert (=> start!78592 m!850695))

(check-sat (not start!78592) (not mapNonEmpty!30525) tp_is_empty!19189)
(check-sat)
(get-model)

(declare-fun d!113019 () Bool)

(assert (=> d!113019 (= (validMask!0 mask!1881) (and (or (= mask!1881 #b00000000000000000000000000000111) (= mask!1881 #b00000000000000000000000000001111) (= mask!1881 #b00000000000000000000000000011111) (= mask!1881 #b00000000000000000000000000111111) (= mask!1881 #b00000000000000000000000001111111) (= mask!1881 #b00000000000000000000000011111111) (= mask!1881 #b00000000000000000000000111111111) (= mask!1881 #b00000000000000000000001111111111) (= mask!1881 #b00000000000000000000011111111111) (= mask!1881 #b00000000000000000000111111111111) (= mask!1881 #b00000000000000000001111111111111) (= mask!1881 #b00000000000000000011111111111111) (= mask!1881 #b00000000000000000111111111111111) (= mask!1881 #b00000000000000001111111111111111) (= mask!1881 #b00000000000000011111111111111111) (= mask!1881 #b00000000000000111111111111111111) (= mask!1881 #b00000000000001111111111111111111) (= mask!1881 #b00000000000011111111111111111111) (= mask!1881 #b00000000000111111111111111111111) (= mask!1881 #b00000000001111111111111111111111) (= mask!1881 #b00000000011111111111111111111111) (= mask!1881 #b00000000111111111111111111111111) (= mask!1881 #b00000001111111111111111111111111) (= mask!1881 #b00000011111111111111111111111111) (= mask!1881 #b00000111111111111111111111111111) (= mask!1881 #b00001111111111111111111111111111) (= mask!1881 #b00011111111111111111111111111111) (= mask!1881 #b00111111111111111111111111111111)) (bvsle mask!1881 #b00111111111111111111111111111111)))))

(assert (=> start!78592 d!113019))

(declare-fun d!113021 () Bool)

(assert (=> d!113021 (= (array_inv!20520 _values!1231) (bvsge (size!26622 _values!1231) #b00000000000000000000000000000000))))

(assert (=> start!78592 d!113021))

(declare-fun d!113023 () Bool)

(assert (=> d!113023 (= (array_inv!20521 _keys!1487) (bvsge (size!26623 _keys!1487) #b00000000000000000000000000000000))))

(assert (=> start!78592 d!113023))

(declare-fun condMapEmpty!30534 () Bool)

(declare-fun mapDefault!30534 () ValueCell!9113)

(assert (=> mapNonEmpty!30525 (= condMapEmpty!30534 (= mapRest!30525 ((as const (Array (_ BitVec 32) ValueCell!9113)) mapDefault!30534)))))

(declare-fun e!513854 () Bool)

(declare-fun mapRes!30534 () Bool)

(assert (=> mapNonEmpty!30525 (= tp!58593 (and e!513854 mapRes!30534))))

(declare-fun b!915711 () Bool)

(declare-fun e!513853 () Bool)

(assert (=> b!915711 (= e!513853 tp_is_empty!19189)))

(declare-fun mapIsEmpty!30534 () Bool)

(assert (=> mapIsEmpty!30534 mapRes!30534))

(declare-fun mapNonEmpty!30534 () Bool)

(declare-fun tp!58602 () Bool)

(assert (=> mapNonEmpty!30534 (= mapRes!30534 (and tp!58602 e!513853))))

(declare-fun mapKey!30534 () (_ BitVec 32))

(declare-fun mapValue!30534 () ValueCell!9113)

(declare-fun mapRest!30534 () (Array (_ BitVec 32) ValueCell!9113))

(assert (=> mapNonEmpty!30534 (= mapRest!30525 (store mapRest!30534 mapKey!30534 mapValue!30534))))

(declare-fun b!915712 () Bool)

(assert (=> b!915712 (= e!513854 tp_is_empty!19189)))

(assert (= (and mapNonEmpty!30525 condMapEmpty!30534) mapIsEmpty!30534))

(assert (= (and mapNonEmpty!30525 (not condMapEmpty!30534)) mapNonEmpty!30534))

(assert (= (and mapNonEmpty!30534 ((_ is ValueCellFull!9113) mapValue!30534)) b!915711))

(assert (= (and mapNonEmpty!30525 ((_ is ValueCellFull!9113) mapDefault!30534)) b!915712))

(declare-fun m!850713 () Bool)

(assert (=> mapNonEmpty!30534 m!850713))

(check-sat (not mapNonEmpty!30534) tp_is_empty!19189)
(check-sat)
