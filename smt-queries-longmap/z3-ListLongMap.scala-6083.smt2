; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78588 () Bool)

(assert start!78588)

(declare-fun b_free!16819 () Bool)

(declare-fun b_next!16819 () Bool)

(assert (=> start!78588 (= b_free!16819 (not b_next!16819))))

(declare-fun tp!58898 () Bool)

(declare-fun b_and!27415 () Bool)

(assert (=> start!78588 (= tp!58898 b_and!27415)))

(declare-fun b!916091 () Bool)

(declare-fun res!617639 () Bool)

(declare-fun e!514216 () Bool)

(assert (=> b!916091 (=> (not res!617639) (not e!514216))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54631 0))(
  ( (array!54632 (arr!26261 (Array (_ BitVec 32) (_ BitVec 64))) (size!26722 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54631)

(assert (=> b!916091 (= res!617639 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26722 _keys!1487))))))

(declare-fun mapNonEmpty!30747 () Bool)

(declare-fun mapRes!30747 () Bool)

(declare-fun tp!58899 () Bool)

(declare-fun e!514214 () Bool)

(assert (=> mapNonEmpty!30747 (= mapRes!30747 (and tp!58899 e!514214))))

(declare-datatypes ((V!30735 0))(
  ( (V!30736 (val!9714 Int)) )
))
(declare-datatypes ((ValueCell!9182 0))(
  ( (ValueCellFull!9182 (v!12231 V!30735)) (EmptyCell!9182) )
))
(declare-fun mapRest!30747 () (Array (_ BitVec 32) ValueCell!9182))

(declare-fun mapValue!30747 () ValueCell!9182)

(declare-fun mapKey!30747 () (_ BitVec 32))

(declare-datatypes ((array!54633 0))(
  ( (array!54634 (arr!26262 (Array (_ BitVec 32) ValueCell!9182)) (size!26723 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54633)

(assert (=> mapNonEmpty!30747 (= (arr!26262 _values!1231) (store mapRest!30747 mapKey!30747 mapValue!30747))))

(declare-fun b!916092 () Bool)

(declare-fun tp_is_empty!19327 () Bool)

(assert (=> b!916092 (= e!514214 tp_is_empty!19327)))

(declare-fun b!916093 () Bool)

(declare-fun e!514218 () Bool)

(declare-fun e!514217 () Bool)

(assert (=> b!916093 (= e!514218 (and e!514217 mapRes!30747))))

(declare-fun condMapEmpty!30747 () Bool)

(declare-fun mapDefault!30747 () ValueCell!9182)

(assert (=> b!916093 (= condMapEmpty!30747 (= (arr!26262 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9182)) mapDefault!30747)))))

(declare-fun b!916095 () Bool)

(assert (=> b!916095 (= e!514216 false)))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!411536 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30735)

(declare-fun minValue!1173 () V!30735)

(declare-datatypes ((tuple2!12648 0))(
  ( (tuple2!12649 (_1!6335 (_ BitVec 64)) (_2!6335 V!30735)) )
))
(declare-datatypes ((List!18446 0))(
  ( (Nil!18443) (Cons!18442 (h!19588 tuple2!12648) (t!26050 List!18446)) )
))
(declare-datatypes ((ListLongMap!11335 0))(
  ( (ListLongMap!11336 (toList!5683 List!18446)) )
))
(declare-fun contains!4693 (ListLongMap!11335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2882 (array!54631 array!54633 (_ BitVec 32) (_ BitVec 32) V!30735 V!30735 (_ BitVec 32) Int) ListLongMap!11335)

(assert (=> b!916095 (= lt!411536 (contains!4693 (getCurrentListMap!2882 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!916096 () Bool)

(declare-fun res!617635 () Bool)

(assert (=> b!916096 (=> (not res!617635) (not e!514216))))

(assert (=> b!916096 (= res!617635 (and (= (size!26723 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26722 _keys!1487) (size!26723 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!617636 () Bool)

(assert (=> start!78588 (=> (not res!617636) (not e!514216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78588 (= res!617636 (validMask!0 mask!1881))))

(assert (=> start!78588 e!514216))

(assert (=> start!78588 true))

(declare-fun array_inv!20568 (array!54633) Bool)

(assert (=> start!78588 (and (array_inv!20568 _values!1231) e!514218)))

(assert (=> start!78588 tp!58898))

(declare-fun array_inv!20569 (array!54631) Bool)

(assert (=> start!78588 (array_inv!20569 _keys!1487)))

(assert (=> start!78588 tp_is_empty!19327))

(declare-fun b!916094 () Bool)

(declare-fun res!617638 () Bool)

(assert (=> b!916094 (=> (not res!617638) (not e!514216))))

(declare-datatypes ((List!18447 0))(
  ( (Nil!18444) (Cons!18443 (h!19589 (_ BitVec 64)) (t!26051 List!18447)) )
))
(declare-fun arrayNoDuplicates!0 (array!54631 (_ BitVec 32) List!18447) Bool)

(assert (=> b!916094 (= res!617638 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18444))))

(declare-fun mapIsEmpty!30747 () Bool)

(assert (=> mapIsEmpty!30747 mapRes!30747))

(declare-fun b!916097 () Bool)

(assert (=> b!916097 (= e!514217 tp_is_empty!19327)))

(declare-fun b!916098 () Bool)

(declare-fun res!617637 () Bool)

(assert (=> b!916098 (=> (not res!617637) (not e!514216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54631 (_ BitVec 32)) Bool)

(assert (=> b!916098 (= res!617637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78588 res!617636) b!916096))

(assert (= (and b!916096 res!617635) b!916098))

(assert (= (and b!916098 res!617637) b!916094))

(assert (= (and b!916094 res!617638) b!916091))

(assert (= (and b!916091 res!617639) b!916095))

(assert (= (and b!916093 condMapEmpty!30747) mapIsEmpty!30747))

(assert (= (and b!916093 (not condMapEmpty!30747)) mapNonEmpty!30747))

(get-info :version)

(assert (= (and mapNonEmpty!30747 ((_ is ValueCellFull!9182) mapValue!30747)) b!916092))

(assert (= (and b!916093 ((_ is ValueCellFull!9182) mapDefault!30747)) b!916097))

(assert (= start!78588 b!916093))

(declare-fun m!849637 () Bool)

(assert (=> b!916098 m!849637))

(declare-fun m!849639 () Bool)

(assert (=> b!916094 m!849639))

(declare-fun m!849641 () Bool)

(assert (=> b!916095 m!849641))

(assert (=> b!916095 m!849641))

(declare-fun m!849643 () Bool)

(assert (=> b!916095 m!849643))

(declare-fun m!849645 () Bool)

(assert (=> mapNonEmpty!30747 m!849645))

(declare-fun m!849647 () Bool)

(assert (=> start!78588 m!849647))

(declare-fun m!849649 () Bool)

(assert (=> start!78588 m!849649))

(declare-fun m!849651 () Bool)

(assert (=> start!78588 m!849651))

(check-sat tp_is_empty!19327 (not mapNonEmpty!30747) (not b!916095) (not b_next!16819) (not b!916098) (not start!78588) (not b!916094) b_and!27415)
(check-sat b_and!27415 (not b_next!16819))
