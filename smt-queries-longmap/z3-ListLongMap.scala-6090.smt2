; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78650 () Bool)

(assert start!78650)

(declare-fun b_free!16863 () Bool)

(declare-fun b_next!16863 () Bool)

(assert (=> start!78650 (= b_free!16863 (not b_next!16863))))

(declare-fun tp!59030 () Bool)

(declare-fun b_and!27485 () Bool)

(assert (=> start!78650 (= tp!59030 b_and!27485)))

(declare-fun b!916917 () Bool)

(declare-fun e!514756 () Bool)

(declare-fun e!514755 () Bool)

(assert (=> b!916917 (= e!514756 e!514755)))

(declare-fun res!618137 () Bool)

(assert (=> b!916917 (=> (not res!618137) (not e!514755))))

(declare-datatypes ((V!30793 0))(
  ( (V!30794 (val!9736 Int)) )
))
(declare-datatypes ((tuple2!12636 0))(
  ( (tuple2!12637 (_1!6329 (_ BitVec 64)) (_2!6329 V!30793)) )
))
(declare-datatypes ((List!18447 0))(
  ( (Nil!18444) (Cons!18443 (h!19589 tuple2!12636) (t!26060 List!18447)) )
))
(declare-datatypes ((ListLongMap!11333 0))(
  ( (ListLongMap!11334 (toList!5682 List!18447)) )
))
(declare-fun lt!411898 () ListLongMap!11333)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4734 (ListLongMap!11333 (_ BitVec 64)) Bool)

(assert (=> b!916917 (= res!618137 (contains!4734 lt!411898 k0!1099))))

(declare-datatypes ((array!54728 0))(
  ( (array!54729 (arr!26309 (Array (_ BitVec 32) (_ BitVec 64))) (size!26768 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54728)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9204 0))(
  ( (ValueCellFull!9204 (v!12254 V!30793)) (EmptyCell!9204) )
))
(declare-datatypes ((array!54730 0))(
  ( (array!54731 (arr!26310 (Array (_ BitVec 32) ValueCell!9204)) (size!26769 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54730)

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30793)

(declare-fun minValue!1173 () V!30793)

(declare-fun getCurrentListMap!2941 (array!54728 array!54730 (_ BitVec 32) (_ BitVec 32) V!30793 V!30793 (_ BitVec 32) Int) ListLongMap!11333)

(assert (=> b!916917 (= lt!411898 (getCurrentListMap!2941 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916918 () Bool)

(declare-fun e!514751 () Bool)

(declare-fun tp_is_empty!19371 () Bool)

(assert (=> b!916918 (= e!514751 tp_is_empty!19371)))

(declare-fun res!618135 () Bool)

(assert (=> start!78650 (=> (not res!618135) (not e!514756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78650 (= res!618135 (validMask!0 mask!1881))))

(assert (=> start!78650 e!514756))

(assert (=> start!78650 true))

(declare-fun e!514752 () Bool)

(declare-fun array_inv!20514 (array!54730) Bool)

(assert (=> start!78650 (and (array_inv!20514 _values!1231) e!514752)))

(assert (=> start!78650 tp!59030))

(declare-fun array_inv!20515 (array!54728) Bool)

(assert (=> start!78650 (array_inv!20515 _keys!1487)))

(assert (=> start!78650 tp_is_empty!19371))

(declare-fun b!916919 () Bool)

(declare-fun res!618136 () Bool)

(assert (=> b!916919 (=> (not res!618136) (not e!514756))))

(declare-datatypes ((List!18448 0))(
  ( (Nil!18445) (Cons!18444 (h!19590 (_ BitVec 64)) (t!26061 List!18448)) )
))
(declare-fun arrayNoDuplicates!0 (array!54728 (_ BitVec 32) List!18448) Bool)

(assert (=> b!916919 (= res!618136 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18445))))

(declare-fun b!916920 () Bool)

(declare-fun e!514754 () Bool)

(assert (=> b!916920 (= e!514754 tp_is_empty!19371)))

(declare-fun b!916921 () Bool)

(declare-fun mapRes!30813 () Bool)

(assert (=> b!916921 (= e!514752 (and e!514751 mapRes!30813))))

(declare-fun condMapEmpty!30813 () Bool)

(declare-fun mapDefault!30813 () ValueCell!9204)

(assert (=> b!916921 (= condMapEmpty!30813 (= (arr!26310 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9204)) mapDefault!30813)))))

(declare-fun b!916922 () Bool)

(declare-fun res!618134 () Bool)

(assert (=> b!916922 (=> (not res!618134) (not e!514756))))

(assert (=> b!916922 (= res!618134 (and (= (size!26769 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26768 _keys!1487) (size!26769 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30813 () Bool)

(declare-fun tp!59029 () Bool)

(assert (=> mapNonEmpty!30813 (= mapRes!30813 (and tp!59029 e!514754))))

(declare-fun mapValue!30813 () ValueCell!9204)

(declare-fun mapRest!30813 () (Array (_ BitVec 32) ValueCell!9204))

(declare-fun mapKey!30813 () (_ BitVec 32))

(assert (=> mapNonEmpty!30813 (= (arr!26310 _values!1231) (store mapRest!30813 mapKey!30813 mapValue!30813))))

(declare-fun b!916923 () Bool)

(declare-fun res!618138 () Bool)

(assert (=> b!916923 (=> (not res!618138) (not e!514756))))

(assert (=> b!916923 (= res!618138 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26768 _keys!1487))))))

(declare-fun b!916924 () Bool)

(assert (=> b!916924 (= e!514755 false)))

(declare-fun lt!411897 () V!30793)

(declare-fun apply!537 (ListLongMap!11333 (_ BitVec 64)) V!30793)

(assert (=> b!916924 (= lt!411897 (apply!537 lt!411898 k0!1099))))

(declare-fun mapIsEmpty!30813 () Bool)

(assert (=> mapIsEmpty!30813 mapRes!30813))

(declare-fun b!916925 () Bool)

(declare-fun res!618139 () Bool)

(assert (=> b!916925 (=> (not res!618139) (not e!514756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54728 (_ BitVec 32)) Bool)

(assert (=> b!916925 (= res!618139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78650 res!618135) b!916922))

(assert (= (and b!916922 res!618134) b!916925))

(assert (= (and b!916925 res!618139) b!916919))

(assert (= (and b!916919 res!618136) b!916923))

(assert (= (and b!916923 res!618138) b!916917))

(assert (= (and b!916917 res!618137) b!916924))

(assert (= (and b!916921 condMapEmpty!30813) mapIsEmpty!30813))

(assert (= (and b!916921 (not condMapEmpty!30813)) mapNonEmpty!30813))

(get-info :version)

(assert (= (and mapNonEmpty!30813 ((_ is ValueCellFull!9204) mapValue!30813)) b!916920))

(assert (= (and b!916921 ((_ is ValueCellFull!9204) mapDefault!30813)) b!916918))

(assert (= start!78650 b!916921))

(declare-fun m!850785 () Bool)

(assert (=> b!916924 m!850785))

(declare-fun m!850787 () Bool)

(assert (=> mapNonEmpty!30813 m!850787))

(declare-fun m!850789 () Bool)

(assert (=> b!916919 m!850789))

(declare-fun m!850791 () Bool)

(assert (=> b!916925 m!850791))

(declare-fun m!850793 () Bool)

(assert (=> start!78650 m!850793))

(declare-fun m!850795 () Bool)

(assert (=> start!78650 m!850795))

(declare-fun m!850797 () Bool)

(assert (=> start!78650 m!850797))

(declare-fun m!850799 () Bool)

(assert (=> b!916917 m!850799))

(declare-fun m!850801 () Bool)

(assert (=> b!916917 m!850801))

(check-sat (not start!78650) (not b!916925) tp_is_empty!19371 (not b!916919) (not b_next!16863) b_and!27485 (not b!916924) (not b!916917) (not mapNonEmpty!30813))
(check-sat b_and!27485 (not b_next!16863))
