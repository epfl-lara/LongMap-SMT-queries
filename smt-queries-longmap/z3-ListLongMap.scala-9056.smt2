; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109122 () Bool)

(assert start!109122)

(declare-fun b_free!28611 () Bool)

(declare-fun b_next!28611 () Bool)

(assert (=> start!109122 (= b_free!28611 (not b_next!28611))))

(declare-fun tp!100951 () Bool)

(declare-fun b_and!46701 () Bool)

(assert (=> start!109122 (= tp!100951 b_and!46701)))

(declare-fun b!1290281 () Bool)

(declare-fun res!857149 () Bool)

(declare-fun e!736637 () Bool)

(assert (=> b!1290281 (=> (not res!857149) (not e!736637))))

(declare-datatypes ((V!50771 0))(
  ( (V!50772 (val!17200 Int)) )
))
(declare-fun minValue!1387 () V!50771)

(declare-fun zeroValue!1387 () V!50771)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16227 0))(
  ( (ValueCellFull!16227 (v!19803 V!50771)) (EmptyCell!16227) )
))
(declare-datatypes ((array!85544 0))(
  ( (array!85545 (arr!41273 (Array (_ BitVec 32) ValueCell!16227)) (size!41823 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85544)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85546 0))(
  ( (array!85547 (arr!41274 (Array (_ BitVec 32) (_ BitVec 64))) (size!41824 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85546)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22100 0))(
  ( (tuple2!22101 (_1!11061 (_ BitVec 64)) (_2!11061 V!50771)) )
))
(declare-datatypes ((List!29267 0))(
  ( (Nil!29264) (Cons!29263 (h!30472 tuple2!22100) (t!42831 List!29267)) )
))
(declare-datatypes ((ListLongMap!19757 0))(
  ( (ListLongMap!19758 (toList!9894 List!29267)) )
))
(declare-fun contains!8012 (ListLongMap!19757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4952 (array!85546 array!85544 (_ BitVec 32) (_ BitVec 32) V!50771 V!50771 (_ BitVec 32) Int) ListLongMap!19757)

(assert (=> b!1290281 (= res!857149 (contains!8012 (getCurrentListMap!4952 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290282 () Bool)

(declare-fun e!736636 () Bool)

(assert (=> b!1290282 (= e!736637 (not e!736636))))

(declare-fun res!857155 () Bool)

(assert (=> b!1290282 (=> res!857155 e!736636)))

(assert (=> b!1290282 (= res!857155 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290282 (not (contains!8012 (ListLongMap!19758 Nil!29264) k0!1205))))

(declare-datatypes ((Unit!42702 0))(
  ( (Unit!42703) )
))
(declare-fun lt!578540 () Unit!42702)

(declare-fun emptyContainsNothing!77 ((_ BitVec 64)) Unit!42702)

(assert (=> b!1290282 (= lt!578540 (emptyContainsNothing!77 k0!1205))))

(declare-fun b!1290283 () Bool)

(declare-fun res!857152 () Bool)

(assert (=> b!1290283 (=> (not res!857152) (not e!736637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290283 (= res!857152 (not (validKeyInArray!0 (select (arr!41274 _keys!1741) from!2144))))))

(declare-fun b!1290284 () Bool)

(declare-fun res!857151 () Bool)

(assert (=> b!1290284 (=> (not res!857151) (not e!736637))))

(assert (=> b!1290284 (= res!857151 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41824 _keys!1741))))))

(declare-fun b!1290285 () Bool)

(declare-fun res!857156 () Bool)

(assert (=> b!1290285 (=> (not res!857156) (not e!736637))))

(assert (=> b!1290285 (= res!857156 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41824 _keys!1741))))))

(declare-fun b!1290287 () Bool)

(assert (=> b!1290287 (= e!736636 (bvsle from!2144 (size!41824 _keys!1741)))))

(declare-fun lt!578539 () ListLongMap!19757)

(declare-fun +!4362 (ListLongMap!19757 tuple2!22100) ListLongMap!19757)

(assert (=> b!1290287 (not (contains!8012 (+!4362 lt!578539 (tuple2!22101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578538 () Unit!42702)

(declare-fun addStillNotContains!380 (ListLongMap!19757 (_ BitVec 64) V!50771 (_ BitVec 64)) Unit!42702)

(assert (=> b!1290287 (= lt!578538 (addStillNotContains!380 lt!578539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290287 (not (contains!8012 (+!4362 lt!578539 (tuple2!22101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578537 () Unit!42702)

(assert (=> b!1290287 (= lt!578537 (addStillNotContains!380 lt!578539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5993 (array!85546 array!85544 (_ BitVec 32) (_ BitVec 32) V!50771 V!50771 (_ BitVec 32) Int) ListLongMap!19757)

(assert (=> b!1290287 (= lt!578539 (getCurrentListMapNoExtraKeys!5993 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290288 () Bool)

(declare-fun e!736639 () Bool)

(declare-fun tp_is_empty!34251 () Bool)

(assert (=> b!1290288 (= e!736639 tp_is_empty!34251)))

(declare-fun b!1290289 () Bool)

(declare-fun res!857153 () Bool)

(assert (=> b!1290289 (=> (not res!857153) (not e!736637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85546 (_ BitVec 32)) Bool)

(assert (=> b!1290289 (= res!857153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52937 () Bool)

(declare-fun mapRes!52937 () Bool)

(declare-fun tp!100952 () Bool)

(declare-fun e!736640 () Bool)

(assert (=> mapNonEmpty!52937 (= mapRes!52937 (and tp!100952 e!736640))))

(declare-fun mapKey!52937 () (_ BitVec 32))

(declare-fun mapValue!52937 () ValueCell!16227)

(declare-fun mapRest!52937 () (Array (_ BitVec 32) ValueCell!16227))

(assert (=> mapNonEmpty!52937 (= (arr!41273 _values!1445) (store mapRest!52937 mapKey!52937 mapValue!52937))))

(declare-fun b!1290290 () Bool)

(assert (=> b!1290290 (= e!736640 tp_is_empty!34251)))

(declare-fun b!1290291 () Bool)

(declare-fun res!857157 () Bool)

(assert (=> b!1290291 (=> (not res!857157) (not e!736637))))

(assert (=> b!1290291 (= res!857157 (and (= (size!41823 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41824 _keys!1741) (size!41823 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290286 () Bool)

(declare-fun e!736638 () Bool)

(assert (=> b!1290286 (= e!736638 (and e!736639 mapRes!52937))))

(declare-fun condMapEmpty!52937 () Bool)

(declare-fun mapDefault!52937 () ValueCell!16227)

(assert (=> b!1290286 (= condMapEmpty!52937 (= (arr!41273 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16227)) mapDefault!52937)))))

(declare-fun res!857154 () Bool)

(assert (=> start!109122 (=> (not res!857154) (not e!736637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109122 (= res!857154 (validMask!0 mask!2175))))

(assert (=> start!109122 e!736637))

(assert (=> start!109122 tp_is_empty!34251))

(assert (=> start!109122 true))

(declare-fun array_inv!31281 (array!85544) Bool)

(assert (=> start!109122 (and (array_inv!31281 _values!1445) e!736638)))

(declare-fun array_inv!31282 (array!85546) Bool)

(assert (=> start!109122 (array_inv!31282 _keys!1741)))

(assert (=> start!109122 tp!100951))

(declare-fun b!1290292 () Bool)

(declare-fun res!857150 () Bool)

(assert (=> b!1290292 (=> (not res!857150) (not e!736637))))

(declare-datatypes ((List!29268 0))(
  ( (Nil!29265) (Cons!29264 (h!30473 (_ BitVec 64)) (t!42832 List!29268)) )
))
(declare-fun arrayNoDuplicates!0 (array!85546 (_ BitVec 32) List!29268) Bool)

(assert (=> b!1290292 (= res!857150 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29265))))

(declare-fun mapIsEmpty!52937 () Bool)

(assert (=> mapIsEmpty!52937 mapRes!52937))

(assert (= (and start!109122 res!857154) b!1290291))

(assert (= (and b!1290291 res!857157) b!1290289))

(assert (= (and b!1290289 res!857153) b!1290292))

(assert (= (and b!1290292 res!857150) b!1290285))

(assert (= (and b!1290285 res!857156) b!1290281))

(assert (= (and b!1290281 res!857149) b!1290284))

(assert (= (and b!1290284 res!857151) b!1290283))

(assert (= (and b!1290283 res!857152) b!1290282))

(assert (= (and b!1290282 (not res!857155)) b!1290287))

(assert (= (and b!1290286 condMapEmpty!52937) mapIsEmpty!52937))

(assert (= (and b!1290286 (not condMapEmpty!52937)) mapNonEmpty!52937))

(get-info :version)

(assert (= (and mapNonEmpty!52937 ((_ is ValueCellFull!16227) mapValue!52937)) b!1290290))

(assert (= (and b!1290286 ((_ is ValueCellFull!16227) mapDefault!52937)) b!1290288))

(assert (= start!109122 b!1290286))

(declare-fun m!1182847 () Bool)

(assert (=> mapNonEmpty!52937 m!1182847))

(declare-fun m!1182849 () Bool)

(assert (=> b!1290283 m!1182849))

(assert (=> b!1290283 m!1182849))

(declare-fun m!1182851 () Bool)

(assert (=> b!1290283 m!1182851))

(declare-fun m!1182853 () Bool)

(assert (=> b!1290289 m!1182853))

(declare-fun m!1182855 () Bool)

(assert (=> start!109122 m!1182855))

(declare-fun m!1182857 () Bool)

(assert (=> start!109122 m!1182857))

(declare-fun m!1182859 () Bool)

(assert (=> start!109122 m!1182859))

(declare-fun m!1182861 () Bool)

(assert (=> b!1290282 m!1182861))

(declare-fun m!1182863 () Bool)

(assert (=> b!1290282 m!1182863))

(declare-fun m!1182865 () Bool)

(assert (=> b!1290287 m!1182865))

(declare-fun m!1182867 () Bool)

(assert (=> b!1290287 m!1182867))

(declare-fun m!1182869 () Bool)

(assert (=> b!1290287 m!1182869))

(declare-fun m!1182871 () Bool)

(assert (=> b!1290287 m!1182871))

(assert (=> b!1290287 m!1182867))

(declare-fun m!1182873 () Bool)

(assert (=> b!1290287 m!1182873))

(declare-fun m!1182875 () Bool)

(assert (=> b!1290287 m!1182875))

(assert (=> b!1290287 m!1182869))

(declare-fun m!1182877 () Bool)

(assert (=> b!1290287 m!1182877))

(declare-fun m!1182879 () Bool)

(assert (=> b!1290281 m!1182879))

(assert (=> b!1290281 m!1182879))

(declare-fun m!1182881 () Bool)

(assert (=> b!1290281 m!1182881))

(declare-fun m!1182883 () Bool)

(assert (=> b!1290292 m!1182883))

(check-sat (not b_next!28611) (not mapNonEmpty!52937) (not b!1290289) (not start!109122) b_and!46701 (not b!1290283) (not b!1290281) (not b!1290292) tp_is_empty!34251 (not b!1290287) (not b!1290282))
(check-sat b_and!46701 (not b_next!28611))
