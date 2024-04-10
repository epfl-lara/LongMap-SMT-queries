; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109056 () Bool)

(assert start!109056)

(declare-fun b_free!28545 () Bool)

(declare-fun b_next!28545 () Bool)

(assert (=> start!109056 (= b_free!28545 (not b_next!28545))))

(declare-fun tp!100753 () Bool)

(declare-fun b_and!46635 () Bool)

(assert (=> start!109056 (= tp!100753 b_and!46635)))

(declare-fun b!1289093 () Bool)

(declare-fun res!856263 () Bool)

(declare-fun e!736045 () Bool)

(assert (=> b!1289093 (=> (not res!856263) (not e!736045))))

(declare-datatypes ((array!85412 0))(
  ( (array!85413 (arr!41207 (Array (_ BitVec 32) (_ BitVec 64))) (size!41757 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85412)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289093 (= res!856263 (not (validKeyInArray!0 (select (arr!41207 _keys!1741) from!2144))))))

(declare-fun b!1289094 () Bool)

(declare-fun res!856259 () Bool)

(assert (=> b!1289094 (=> (not res!856259) (not e!736045))))

(declare-datatypes ((V!50683 0))(
  ( (V!50684 (val!17167 Int)) )
))
(declare-fun minValue!1387 () V!50683)

(declare-fun zeroValue!1387 () V!50683)

(declare-datatypes ((ValueCell!16194 0))(
  ( (ValueCellFull!16194 (v!19770 V!50683)) (EmptyCell!16194) )
))
(declare-datatypes ((array!85414 0))(
  ( (array!85415 (arr!41208 (Array (_ BitVec 32) ValueCell!16194)) (size!41758 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85414)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22046 0))(
  ( (tuple2!22047 (_1!11034 (_ BitVec 64)) (_2!11034 V!50683)) )
))
(declare-datatypes ((List!29216 0))(
  ( (Nil!29213) (Cons!29212 (h!30421 tuple2!22046) (t!42780 List!29216)) )
))
(declare-datatypes ((ListLongMap!19703 0))(
  ( (ListLongMap!19704 (toList!9867 List!29216)) )
))
(declare-fun contains!7985 (ListLongMap!19703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4928 (array!85412 array!85414 (_ BitVec 32) (_ BitVec 32) V!50683 V!50683 (_ BitVec 32) Int) ListLongMap!19703)

(assert (=> b!1289094 (= res!856259 (contains!7985 (getCurrentListMap!4928 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289095 () Bool)

(declare-fun e!736042 () Bool)

(assert (=> b!1289095 (= e!736045 (not e!736042))))

(declare-fun res!856260 () Bool)

(assert (=> b!1289095 (=> res!856260 e!736042)))

(assert (=> b!1289095 (= res!856260 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289095 (not (contains!7985 (ListLongMap!19704 Nil!29213) k0!1205))))

(declare-datatypes ((Unit!42652 0))(
  ( (Unit!42653) )
))
(declare-fun lt!578155 () Unit!42652)

(declare-fun emptyContainsNothing!54 ((_ BitVec 64)) Unit!42652)

(assert (=> b!1289095 (= lt!578155 (emptyContainsNothing!54 k0!1205))))

(declare-fun b!1289096 () Bool)

(declare-fun e!736046 () Bool)

(declare-fun e!736044 () Bool)

(declare-fun mapRes!52838 () Bool)

(assert (=> b!1289096 (= e!736046 (and e!736044 mapRes!52838))))

(declare-fun condMapEmpty!52838 () Bool)

(declare-fun mapDefault!52838 () ValueCell!16194)

(assert (=> b!1289096 (= condMapEmpty!52838 (= (arr!41208 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16194)) mapDefault!52838)))))

(declare-fun b!1289097 () Bool)

(assert (=> b!1289097 (= e!736042 true)))

(declare-fun lt!578154 () ListLongMap!19703)

(declare-fun +!4339 (ListLongMap!19703 tuple2!22046) ListLongMap!19703)

(assert (=> b!1289097 (not (contains!7985 (+!4339 lt!578154 (tuple2!22047 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578156 () Unit!42652)

(declare-fun addStillNotContains!357 (ListLongMap!19703 (_ BitVec 64) V!50683 (_ BitVec 64)) Unit!42652)

(assert (=> b!1289097 (= lt!578156 (addStillNotContains!357 lt!578154 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5970 (array!85412 array!85414 (_ BitVec 32) (_ BitVec 32) V!50683 V!50683 (_ BitVec 32) Int) ListLongMap!19703)

(assert (=> b!1289097 (= lt!578154 (getCurrentListMapNoExtraKeys!5970 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289098 () Bool)

(declare-fun res!856266 () Bool)

(assert (=> b!1289098 (=> (not res!856266) (not e!736045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85412 (_ BitVec 32)) Bool)

(assert (=> b!1289098 (= res!856266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289099 () Bool)

(declare-fun res!856261 () Bool)

(assert (=> b!1289099 (=> (not res!856261) (not e!736045))))

(declare-datatypes ((List!29217 0))(
  ( (Nil!29214) (Cons!29213 (h!30422 (_ BitVec 64)) (t!42781 List!29217)) )
))
(declare-fun arrayNoDuplicates!0 (array!85412 (_ BitVec 32) List!29217) Bool)

(assert (=> b!1289099 (= res!856261 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29214))))

(declare-fun b!1289100 () Bool)

(declare-fun e!736041 () Bool)

(declare-fun tp_is_empty!34185 () Bool)

(assert (=> b!1289100 (= e!736041 tp_is_empty!34185)))

(declare-fun res!856264 () Bool)

(assert (=> start!109056 (=> (not res!856264) (not e!736045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109056 (= res!856264 (validMask!0 mask!2175))))

(assert (=> start!109056 e!736045))

(assert (=> start!109056 tp_is_empty!34185))

(assert (=> start!109056 true))

(declare-fun array_inv!31239 (array!85414) Bool)

(assert (=> start!109056 (and (array_inv!31239 _values!1445) e!736046)))

(declare-fun array_inv!31240 (array!85412) Bool)

(assert (=> start!109056 (array_inv!31240 _keys!1741)))

(assert (=> start!109056 tp!100753))

(declare-fun b!1289101 () Bool)

(declare-fun res!856258 () Bool)

(assert (=> b!1289101 (=> (not res!856258) (not e!736045))))

(assert (=> b!1289101 (= res!856258 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41757 _keys!1741))))))

(declare-fun b!1289102 () Bool)

(declare-fun res!856262 () Bool)

(assert (=> b!1289102 (=> (not res!856262) (not e!736045))))

(assert (=> b!1289102 (= res!856262 (and (= (size!41758 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41757 _keys!1741) (size!41758 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52838 () Bool)

(assert (=> mapIsEmpty!52838 mapRes!52838))

(declare-fun mapNonEmpty!52838 () Bool)

(declare-fun tp!100754 () Bool)

(assert (=> mapNonEmpty!52838 (= mapRes!52838 (and tp!100754 e!736041))))

(declare-fun mapValue!52838 () ValueCell!16194)

(declare-fun mapRest!52838 () (Array (_ BitVec 32) ValueCell!16194))

(declare-fun mapKey!52838 () (_ BitVec 32))

(assert (=> mapNonEmpty!52838 (= (arr!41208 _values!1445) (store mapRest!52838 mapKey!52838 mapValue!52838))))

(declare-fun b!1289103 () Bool)

(assert (=> b!1289103 (= e!736044 tp_is_empty!34185)))

(declare-fun b!1289104 () Bool)

(declare-fun res!856265 () Bool)

(assert (=> b!1289104 (=> (not res!856265) (not e!736045))))

(assert (=> b!1289104 (= res!856265 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41757 _keys!1741))))))

(assert (= (and start!109056 res!856264) b!1289102))

(assert (= (and b!1289102 res!856262) b!1289098))

(assert (= (and b!1289098 res!856266) b!1289099))

(assert (= (and b!1289099 res!856261) b!1289101))

(assert (= (and b!1289101 res!856258) b!1289094))

(assert (= (and b!1289094 res!856259) b!1289104))

(assert (= (and b!1289104 res!856265) b!1289093))

(assert (= (and b!1289093 res!856263) b!1289095))

(assert (= (and b!1289095 (not res!856260)) b!1289097))

(assert (= (and b!1289096 condMapEmpty!52838) mapIsEmpty!52838))

(assert (= (and b!1289096 (not condMapEmpty!52838)) mapNonEmpty!52838))

(get-info :version)

(assert (= (and mapNonEmpty!52838 ((_ is ValueCellFull!16194) mapValue!52838)) b!1289100))

(assert (= (and b!1289096 ((_ is ValueCellFull!16194) mapDefault!52838)) b!1289103))

(assert (= start!109056 b!1289096))

(declare-fun m!1181635 () Bool)

(assert (=> start!109056 m!1181635))

(declare-fun m!1181637 () Bool)

(assert (=> start!109056 m!1181637))

(declare-fun m!1181639 () Bool)

(assert (=> start!109056 m!1181639))

(declare-fun m!1181641 () Bool)

(assert (=> mapNonEmpty!52838 m!1181641))

(declare-fun m!1181643 () Bool)

(assert (=> b!1289095 m!1181643))

(declare-fun m!1181645 () Bool)

(assert (=> b!1289095 m!1181645))

(declare-fun m!1181647 () Bool)

(assert (=> b!1289097 m!1181647))

(assert (=> b!1289097 m!1181647))

(declare-fun m!1181649 () Bool)

(assert (=> b!1289097 m!1181649))

(declare-fun m!1181651 () Bool)

(assert (=> b!1289097 m!1181651))

(declare-fun m!1181653 () Bool)

(assert (=> b!1289097 m!1181653))

(declare-fun m!1181655 () Bool)

(assert (=> b!1289094 m!1181655))

(assert (=> b!1289094 m!1181655))

(declare-fun m!1181657 () Bool)

(assert (=> b!1289094 m!1181657))

(declare-fun m!1181659 () Bool)

(assert (=> b!1289098 m!1181659))

(declare-fun m!1181661 () Bool)

(assert (=> b!1289099 m!1181661))

(declare-fun m!1181663 () Bool)

(assert (=> b!1289093 m!1181663))

(assert (=> b!1289093 m!1181663))

(declare-fun m!1181665 () Bool)

(assert (=> b!1289093 m!1181665))

(check-sat (not b!1289098) (not mapNonEmpty!52838) (not start!109056) (not b!1289094) (not b!1289097) (not b_next!28545) b_and!46635 tp_is_empty!34185 (not b!1289093) (not b!1289099) (not b!1289095))
(check-sat b_and!46635 (not b_next!28545))
