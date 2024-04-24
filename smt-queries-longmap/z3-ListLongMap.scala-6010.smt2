; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78096 () Bool)

(assert start!78096)

(declare-fun b_free!16471 () Bool)

(declare-fun b_next!16471 () Bool)

(assert (=> start!78096 (= b_free!16471 (not b_next!16471))))

(declare-fun tp!57681 () Bool)

(declare-fun b_and!27051 () Bool)

(assert (=> start!78096 (= tp!57681 b_and!27051)))

(declare-fun b!910736 () Bool)

(declare-fun res!614372 () Bool)

(declare-fun e!510627 () Bool)

(assert (=> b!910736 (=> (not res!614372) (not e!510627))))

(declare-datatypes ((V!30151 0))(
  ( (V!30152 (val!9495 Int)) )
))
(declare-datatypes ((ValueCell!8963 0))(
  ( (ValueCellFull!8963 (v!12000 V!30151)) (EmptyCell!8963) )
))
(declare-datatypes ((array!53851 0))(
  ( (array!53852 (arr!25878 (Array (_ BitVec 32) ValueCell!8963)) (size!26338 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53851)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!53853 0))(
  ( (array!53854 (arr!25879 (Array (_ BitVec 32) (_ BitVec 64))) (size!26339 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53853)

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!910736 (= res!614372 (and (= (size!26338 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26339 _keys!1386) (size!26338 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910737 () Bool)

(declare-fun res!614371 () Bool)

(assert (=> b!910737 (=> (not res!614371) (not e!510627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53853 (_ BitVec 32)) Bool)

(assert (=> b!910737 (= res!614371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910738 () Bool)

(declare-fun res!614369 () Bool)

(assert (=> b!910738 (=> (not res!614369) (not e!510627))))

(declare-datatypes ((List!18149 0))(
  ( (Nil!18146) (Cons!18145 (h!19297 (_ BitVec 64)) (t!25724 List!18149)) )
))
(declare-fun arrayNoDuplicates!0 (array!53853 (_ BitVec 32) List!18149) Bool)

(assert (=> b!910738 (= res!614369 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18146))))

(declare-fun mapNonEmpty!30052 () Bool)

(declare-fun mapRes!30052 () Bool)

(declare-fun tp!57682 () Bool)

(declare-fun e!510626 () Bool)

(assert (=> mapNonEmpty!30052 (= mapRes!30052 (and tp!57682 e!510626))))

(declare-fun mapValue!30052 () ValueCell!8963)

(declare-fun mapRest!30052 () (Array (_ BitVec 32) ValueCell!8963))

(declare-fun mapKey!30052 () (_ BitVec 32))

(assert (=> mapNonEmpty!30052 (= (arr!25878 _values!1152) (store mapRest!30052 mapKey!30052 mapValue!30052))))

(declare-fun mapIsEmpty!30052 () Bool)

(assert (=> mapIsEmpty!30052 mapRes!30052))

(declare-fun b!910739 () Bool)

(declare-fun e!510628 () Bool)

(declare-fun tp_is_empty!18889 () Bool)

(assert (=> b!910739 (= e!510628 tp_is_empty!18889)))

(declare-fun b!910740 () Bool)

(assert (=> b!910740 (= e!510627 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30151)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30151)

(declare-fun lt!410472 () Bool)

(declare-datatypes ((tuple2!12330 0))(
  ( (tuple2!12331 (_1!6176 (_ BitVec 64)) (_2!6176 V!30151)) )
))
(declare-datatypes ((List!18150 0))(
  ( (Nil!18147) (Cons!18146 (h!19298 tuple2!12330) (t!25725 List!18150)) )
))
(declare-datatypes ((ListLongMap!11029 0))(
  ( (ListLongMap!11030 (toList!5530 List!18150)) )
))
(declare-fun contains!4582 (ListLongMap!11029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2791 (array!53853 array!53851 (_ BitVec 32) (_ BitVec 32) V!30151 V!30151 (_ BitVec 32) Int) ListLongMap!11029)

(assert (=> b!910740 (= lt!410472 (contains!4582 (getCurrentListMap!2791 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910741 () Bool)

(declare-fun e!510629 () Bool)

(assert (=> b!910741 (= e!510629 (and e!510628 mapRes!30052))))

(declare-fun condMapEmpty!30052 () Bool)

(declare-fun mapDefault!30052 () ValueCell!8963)

(assert (=> b!910741 (= condMapEmpty!30052 (= (arr!25878 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8963)) mapDefault!30052)))))

(declare-fun b!910742 () Bool)

(assert (=> b!910742 (= e!510626 tp_is_empty!18889)))

(declare-fun res!614370 () Bool)

(assert (=> start!78096 (=> (not res!614370) (not e!510627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78096 (= res!614370 (validMask!0 mask!1756))))

(assert (=> start!78096 e!510627))

(declare-fun array_inv!20310 (array!53851) Bool)

(assert (=> start!78096 (and (array_inv!20310 _values!1152) e!510629)))

(assert (=> start!78096 tp!57681))

(assert (=> start!78096 true))

(assert (=> start!78096 tp_is_empty!18889))

(declare-fun array_inv!20311 (array!53853) Bool)

(assert (=> start!78096 (array_inv!20311 _keys!1386)))

(assert (= (and start!78096 res!614370) b!910736))

(assert (= (and b!910736 res!614372) b!910737))

(assert (= (and b!910737 res!614371) b!910738))

(assert (= (and b!910738 res!614369) b!910740))

(assert (= (and b!910741 condMapEmpty!30052) mapIsEmpty!30052))

(assert (= (and b!910741 (not condMapEmpty!30052)) mapNonEmpty!30052))

(get-info :version)

(assert (= (and mapNonEmpty!30052 ((_ is ValueCellFull!8963) mapValue!30052)) b!910742))

(assert (= (and b!910741 ((_ is ValueCellFull!8963) mapDefault!30052)) b!910739))

(assert (= start!78096 b!910741))

(declare-fun m!846275 () Bool)

(assert (=> b!910737 m!846275))

(declare-fun m!846277 () Bool)

(assert (=> b!910738 m!846277))

(declare-fun m!846279 () Bool)

(assert (=> b!910740 m!846279))

(assert (=> b!910740 m!846279))

(declare-fun m!846281 () Bool)

(assert (=> b!910740 m!846281))

(declare-fun m!846283 () Bool)

(assert (=> mapNonEmpty!30052 m!846283))

(declare-fun m!846285 () Bool)

(assert (=> start!78096 m!846285))

(declare-fun m!846287 () Bool)

(assert (=> start!78096 m!846287))

(declare-fun m!846289 () Bool)

(assert (=> start!78096 m!846289))

(check-sat (not b!910737) (not b!910740) (not start!78096) (not mapNonEmpty!30052) tp_is_empty!18889 b_and!27051 (not b_next!16471) (not b!910738))
(check-sat b_and!27051 (not b_next!16471))
