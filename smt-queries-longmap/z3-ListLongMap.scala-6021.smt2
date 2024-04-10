; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78012 () Bool)

(assert start!78012)

(declare-fun b_free!16539 () Bool)

(declare-fun b_next!16539 () Bool)

(assert (=> start!78012 (= b_free!16539 (not b_next!16539))))

(declare-fun tp!57888 () Bool)

(declare-fun b_and!27111 () Bool)

(assert (=> start!78012 (= tp!57888 b_and!27111)))

(declare-fun mapIsEmpty!30157 () Bool)

(declare-fun mapRes!30157 () Bool)

(assert (=> mapIsEmpty!30157 mapRes!30157))

(declare-fun b!910674 () Bool)

(declare-fun res!614496 () Bool)

(declare-fun e!510628 () Bool)

(assert (=> b!910674 (=> (not res!614496) (not e!510628))))

(declare-datatypes ((array!53930 0))(
  ( (array!53931 (arr!25921 (Array (_ BitVec 32) (_ BitVec 64))) (size!26380 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53930)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53930 (_ BitVec 32)) Bool)

(assert (=> b!910674 (= res!614496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910675 () Bool)

(declare-fun e!510626 () Bool)

(declare-fun tp_is_empty!18957 () Bool)

(assert (=> b!910675 (= e!510626 tp_is_empty!18957)))

(declare-fun b!910676 () Bool)

(assert (=> b!910676 (= e!510628 false)))

(declare-datatypes ((V!30241 0))(
  ( (V!30242 (val!9529 Int)) )
))
(declare-datatypes ((ValueCell!8997 0))(
  ( (ValueCellFull!8997 (v!12038 V!30241)) (EmptyCell!8997) )
))
(declare-datatypes ((array!53932 0))(
  ( (array!53933 (arr!25922 (Array (_ BitVec 32) ValueCell!8997)) (size!26381 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53932)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30241)

(declare-fun lt!410291 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30241)

(declare-datatypes ((tuple2!12416 0))(
  ( (tuple2!12417 (_1!6219 (_ BitVec 64)) (_2!6219 V!30241)) )
))
(declare-datatypes ((List!18207 0))(
  ( (Nil!18204) (Cons!18203 (h!19349 tuple2!12416) (t!25792 List!18207)) )
))
(declare-datatypes ((ListLongMap!11113 0))(
  ( (ListLongMap!11114 (toList!5572 List!18207)) )
))
(declare-fun contains!4616 (ListLongMap!11113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2834 (array!53930 array!53932 (_ BitVec 32) (_ BitVec 32) V!30241 V!30241 (_ BitVec 32) Int) ListLongMap!11113)

(assert (=> b!910676 (= lt!410291 (contains!4616 (getCurrentListMap!2834 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614498 () Bool)

(assert (=> start!78012 (=> (not res!614498) (not e!510628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78012 (= res!614498 (validMask!0 mask!1756))))

(assert (=> start!78012 e!510628))

(declare-fun e!510629 () Bool)

(declare-fun array_inv!20268 (array!53932) Bool)

(assert (=> start!78012 (and (array_inv!20268 _values!1152) e!510629)))

(assert (=> start!78012 tp!57888))

(assert (=> start!78012 true))

(assert (=> start!78012 tp_is_empty!18957))

(declare-fun array_inv!20269 (array!53930) Bool)

(assert (=> start!78012 (array_inv!20269 _keys!1386)))

(declare-fun mapNonEmpty!30157 () Bool)

(declare-fun tp!57887 () Bool)

(assert (=> mapNonEmpty!30157 (= mapRes!30157 (and tp!57887 e!510626))))

(declare-fun mapKey!30157 () (_ BitVec 32))

(declare-fun mapValue!30157 () ValueCell!8997)

(declare-fun mapRest!30157 () (Array (_ BitVec 32) ValueCell!8997))

(assert (=> mapNonEmpty!30157 (= (arr!25922 _values!1152) (store mapRest!30157 mapKey!30157 mapValue!30157))))

(declare-fun b!910677 () Bool)

(declare-fun e!510630 () Bool)

(assert (=> b!910677 (= e!510629 (and e!510630 mapRes!30157))))

(declare-fun condMapEmpty!30157 () Bool)

(declare-fun mapDefault!30157 () ValueCell!8997)

(assert (=> b!910677 (= condMapEmpty!30157 (= (arr!25922 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8997)) mapDefault!30157)))))

(declare-fun b!910678 () Bool)

(assert (=> b!910678 (= e!510630 tp_is_empty!18957)))

(declare-fun b!910679 () Bool)

(declare-fun res!614497 () Bool)

(assert (=> b!910679 (=> (not res!614497) (not e!510628))))

(assert (=> b!910679 (= res!614497 (and (= (size!26381 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26380 _keys!1386) (size!26381 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910680 () Bool)

(declare-fun res!614499 () Bool)

(assert (=> b!910680 (=> (not res!614499) (not e!510628))))

(declare-datatypes ((List!18208 0))(
  ( (Nil!18205) (Cons!18204 (h!19350 (_ BitVec 64)) (t!25793 List!18208)) )
))
(declare-fun arrayNoDuplicates!0 (array!53930 (_ BitVec 32) List!18208) Bool)

(assert (=> b!910680 (= res!614499 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18205))))

(assert (= (and start!78012 res!614498) b!910679))

(assert (= (and b!910679 res!614497) b!910674))

(assert (= (and b!910674 res!614496) b!910680))

(assert (= (and b!910680 res!614499) b!910676))

(assert (= (and b!910677 condMapEmpty!30157) mapIsEmpty!30157))

(assert (= (and b!910677 (not condMapEmpty!30157)) mapNonEmpty!30157))

(get-info :version)

(assert (= (and mapNonEmpty!30157 ((_ is ValueCellFull!8997) mapValue!30157)) b!910675))

(assert (= (and b!910677 ((_ is ValueCellFull!8997) mapDefault!30157)) b!910678))

(assert (= start!78012 b!910677))

(declare-fun m!845617 () Bool)

(assert (=> b!910676 m!845617))

(assert (=> b!910676 m!845617))

(declare-fun m!845619 () Bool)

(assert (=> b!910676 m!845619))

(declare-fun m!845621 () Bool)

(assert (=> b!910674 m!845621))

(declare-fun m!845623 () Bool)

(assert (=> b!910680 m!845623))

(declare-fun m!845625 () Bool)

(assert (=> start!78012 m!845625))

(declare-fun m!845627 () Bool)

(assert (=> start!78012 m!845627))

(declare-fun m!845629 () Bool)

(assert (=> start!78012 m!845629))

(declare-fun m!845631 () Bool)

(assert (=> mapNonEmpty!30157 m!845631))

(check-sat tp_is_empty!18957 b_and!27111 (not b_next!16539) (not mapNonEmpty!30157) (not b!910676) (not start!78012) (not b!910680) (not b!910674))
(check-sat b_and!27111 (not b_next!16539))
