; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78774 () Bool)

(assert start!78774)

(declare-fun b_free!16819 () Bool)

(declare-fun b_next!16819 () Bool)

(assert (=> start!78774 (= b_free!16819 (not b_next!16819))))

(declare-fun tp!58899 () Bool)

(declare-fun b_and!27451 () Bool)

(assert (=> start!78774 (= tp!58899 b_and!27451)))

(declare-fun b!917234 () Bool)

(declare-fun res!618093 () Bool)

(declare-fun e!514945 () Bool)

(assert (=> b!917234 (=> (not res!618093) (not e!514945))))

(declare-datatypes ((array!54691 0))(
  ( (array!54692 (arr!26286 (Array (_ BitVec 32) (_ BitVec 64))) (size!26746 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54691)

(declare-datatypes ((List!18397 0))(
  ( (Nil!18394) (Cons!18393 (h!19545 (_ BitVec 64)) (t!26002 List!18397)) )
))
(declare-fun arrayNoDuplicates!0 (array!54691 (_ BitVec 32) List!18397) Bool)

(assert (=> b!917234 (= res!618093 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18394))))

(declare-fun b!917235 () Bool)

(declare-fun res!618091 () Bool)

(assert (=> b!917235 (=> (not res!618091) (not e!514945))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30735 0))(
  ( (V!30736 (val!9714 Int)) )
))
(declare-datatypes ((ValueCell!9182 0))(
  ( (ValueCellFull!9182 (v!12229 V!30735)) (EmptyCell!9182) )
))
(declare-datatypes ((array!54693 0))(
  ( (array!54694 (arr!26287 (Array (_ BitVec 32) ValueCell!9182)) (size!26747 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54693)

(assert (=> b!917235 (= res!618091 (and (= (size!26747 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26746 _keys!1487) (size!26747 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917236 () Bool)

(declare-fun e!514944 () Bool)

(declare-fun e!514948 () Bool)

(declare-fun mapRes!30747 () Bool)

(assert (=> b!917236 (= e!514944 (and e!514948 mapRes!30747))))

(declare-fun condMapEmpty!30747 () Bool)

(declare-fun mapDefault!30747 () ValueCell!9182)

(assert (=> b!917236 (= condMapEmpty!30747 (= (arr!26287 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9182)) mapDefault!30747)))))

(declare-fun b!917237 () Bool)

(declare-fun e!514947 () Bool)

(declare-fun tp_is_empty!19327 () Bool)

(assert (=> b!917237 (= e!514947 tp_is_empty!19327)))

(declare-fun mapIsEmpty!30747 () Bool)

(assert (=> mapIsEmpty!30747 mapRes!30747))

(declare-fun b!917233 () Bool)

(assert (=> b!917233 (= e!514945 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!412133 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30735)

(declare-fun minValue!1173 () V!30735)

(declare-datatypes ((tuple2!12566 0))(
  ( (tuple2!12567 (_1!6294 (_ BitVec 64)) (_2!6294 V!30735)) )
))
(declare-datatypes ((List!18398 0))(
  ( (Nil!18395) (Cons!18394 (h!19546 tuple2!12566) (t!26003 List!18398)) )
))
(declare-datatypes ((ListLongMap!11265 0))(
  ( (ListLongMap!11266 (toList!5648 List!18398)) )
))
(declare-fun contains!4710 (ListLongMap!11265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2907 (array!54691 array!54693 (_ BitVec 32) (_ BitVec 32) V!30735 V!30735 (_ BitVec 32) Int) ListLongMap!11265)

(assert (=> b!917233 (= lt!412133 (contains!4710 (getCurrentListMap!2907 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun res!618090 () Bool)

(assert (=> start!78774 (=> (not res!618090) (not e!514945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78774 (= res!618090 (validMask!0 mask!1881))))

(assert (=> start!78774 e!514945))

(assert (=> start!78774 true))

(declare-fun array_inv!20606 (array!54693) Bool)

(assert (=> start!78774 (and (array_inv!20606 _values!1231) e!514944)))

(assert (=> start!78774 tp!58899))

(declare-fun array_inv!20607 (array!54691) Bool)

(assert (=> start!78774 (array_inv!20607 _keys!1487)))

(assert (=> start!78774 tp_is_empty!19327))

(declare-fun b!917238 () Bool)

(assert (=> b!917238 (= e!514948 tp_is_empty!19327)))

(declare-fun b!917239 () Bool)

(declare-fun res!618089 () Bool)

(assert (=> b!917239 (=> (not res!618089) (not e!514945))))

(assert (=> b!917239 (= res!618089 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26746 _keys!1487))))))

(declare-fun b!917240 () Bool)

(declare-fun res!618092 () Bool)

(assert (=> b!917240 (=> (not res!618092) (not e!514945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54691 (_ BitVec 32)) Bool)

(assert (=> b!917240 (= res!618092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!30747 () Bool)

(declare-fun tp!58898 () Bool)

(assert (=> mapNonEmpty!30747 (= mapRes!30747 (and tp!58898 e!514947))))

(declare-fun mapRest!30747 () (Array (_ BitVec 32) ValueCell!9182))

(declare-fun mapValue!30747 () ValueCell!9182)

(declare-fun mapKey!30747 () (_ BitVec 32))

(assert (=> mapNonEmpty!30747 (= (arr!26287 _values!1231) (store mapRest!30747 mapKey!30747 mapValue!30747))))

(assert (= (and start!78774 res!618090) b!917235))

(assert (= (and b!917235 res!618091) b!917240))

(assert (= (and b!917240 res!618092) b!917234))

(assert (= (and b!917234 res!618093) b!917239))

(assert (= (and b!917239 res!618089) b!917233))

(assert (= (and b!917236 condMapEmpty!30747) mapIsEmpty!30747))

(assert (= (and b!917236 (not condMapEmpty!30747)) mapNonEmpty!30747))

(get-info :version)

(assert (= (and mapNonEmpty!30747 ((_ is ValueCellFull!9182) mapValue!30747)) b!917237))

(assert (= (and b!917236 ((_ is ValueCellFull!9182) mapDefault!30747)) b!917238))

(assert (= start!78774 b!917236))

(declare-fun m!851689 () Bool)

(assert (=> start!78774 m!851689))

(declare-fun m!851691 () Bool)

(assert (=> start!78774 m!851691))

(declare-fun m!851693 () Bool)

(assert (=> start!78774 m!851693))

(declare-fun m!851695 () Bool)

(assert (=> b!917240 m!851695))

(declare-fun m!851697 () Bool)

(assert (=> b!917233 m!851697))

(assert (=> b!917233 m!851697))

(declare-fun m!851699 () Bool)

(assert (=> b!917233 m!851699))

(declare-fun m!851701 () Bool)

(assert (=> mapNonEmpty!30747 m!851701))

(declare-fun m!851703 () Bool)

(assert (=> b!917234 m!851703))

(check-sat (not b!917233) (not start!78774) b_and!27451 (not b_next!16819) (not b!917240) (not mapNonEmpty!30747) (not b!917234) tp_is_empty!19327)
(check-sat b_and!27451 (not b_next!16819))
