; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109638 () Bool)

(assert start!109638)

(declare-fun b_free!28903 () Bool)

(declare-fun b_next!28903 () Bool)

(assert (=> start!109638 (= b_free!28903 (not b_next!28903))))

(declare-fun tp!101827 () Bool)

(declare-fun b_and!46995 () Bool)

(assert (=> start!109638 (= tp!101827 b_and!46995)))

(declare-fun b!1296680 () Bool)

(declare-fun e!739952 () Bool)

(declare-fun tp_is_empty!34543 () Bool)

(assert (=> b!1296680 (= e!739952 tp_is_empty!34543)))

(declare-fun b!1296681 () Bool)

(declare-fun res!861451 () Bool)

(declare-fun e!739948 () Bool)

(assert (=> b!1296681 (=> (not res!861451) (not e!739948))))

(declare-datatypes ((array!86139 0))(
  ( (array!86140 (arr!41566 (Array (_ BitVec 32) (_ BitVec 64))) (size!42117 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86139)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296681 (= res!861451 (not (validKeyInArray!0 (select (arr!41566 _keys!1741) from!2144))))))

(declare-fun b!1296682 () Bool)

(declare-fun e!739950 () Bool)

(assert (=> b!1296682 (= e!739950 true)))

(declare-datatypes ((V!51161 0))(
  ( (V!51162 (val!17346 Int)) )
))
(declare-datatypes ((tuple2!22338 0))(
  ( (tuple2!22339 (_1!11180 (_ BitVec 64)) (_2!11180 V!51161)) )
))
(declare-datatypes ((List!29504 0))(
  ( (Nil!29501) (Cons!29500 (h!30718 tuple2!22338) (t!43060 List!29504)) )
))
(declare-datatypes ((ListLongMap!20003 0))(
  ( (ListLongMap!20004 (toList!10017 List!29504)) )
))
(declare-fun lt!580367 () ListLongMap!20003)

(declare-fun minValue!1387 () V!51161)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8148 (ListLongMap!20003 (_ BitVec 64)) Bool)

(declare-fun +!4461 (ListLongMap!20003 tuple2!22338) ListLongMap!20003)

(assert (=> b!1296682 (not (contains!8148 (+!4461 lt!580367 (tuple2!22339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42865 0))(
  ( (Unit!42866) )
))
(declare-fun lt!580368 () Unit!42865)

(declare-fun addStillNotContains!437 (ListLongMap!20003 (_ BitVec 64) V!51161 (_ BitVec 64)) Unit!42865)

(assert (=> b!1296682 (= lt!580368 (addStillNotContains!437 lt!580367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51161)

(declare-datatypes ((ValueCell!16373 0))(
  ( (ValueCellFull!16373 (v!19944 V!51161)) (EmptyCell!16373) )
))
(declare-datatypes ((array!86141 0))(
  ( (array!86142 (arr!41567 (Array (_ BitVec 32) ValueCell!16373)) (size!42118 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86141)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6103 (array!86139 array!86141 (_ BitVec 32) (_ BitVec 32) V!51161 V!51161 (_ BitVec 32) Int) ListLongMap!20003)

(assert (=> b!1296682 (= lt!580367 (getCurrentListMapNoExtraKeys!6103 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296683 () Bool)

(declare-fun res!861456 () Bool)

(assert (=> b!1296683 (=> (not res!861456) (not e!739948))))

(declare-datatypes ((List!29505 0))(
  ( (Nil!29502) (Cons!29501 (h!30719 (_ BitVec 64)) (t!43061 List!29505)) )
))
(declare-fun arrayNoDuplicates!0 (array!86139 (_ BitVec 32) List!29505) Bool)

(assert (=> b!1296683 (= res!861456 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29502))))

(declare-fun b!1296684 () Bool)

(declare-fun res!861449 () Bool)

(assert (=> b!1296684 (=> (not res!861449) (not e!739948))))

(declare-fun getCurrentListMap!5040 (array!86139 array!86141 (_ BitVec 32) (_ BitVec 32) V!51161 V!51161 (_ BitVec 32) Int) ListLongMap!20003)

(assert (=> b!1296684 (= res!861449 (contains!8148 (getCurrentListMap!5040 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53375 () Bool)

(declare-fun mapRes!53375 () Bool)

(assert (=> mapIsEmpty!53375 mapRes!53375))

(declare-fun res!861452 () Bool)

(assert (=> start!109638 (=> (not res!861452) (not e!739948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109638 (= res!861452 (validMask!0 mask!2175))))

(assert (=> start!109638 e!739948))

(assert (=> start!109638 tp_is_empty!34543))

(assert (=> start!109638 true))

(declare-fun e!739951 () Bool)

(declare-fun array_inv!31705 (array!86141) Bool)

(assert (=> start!109638 (and (array_inv!31705 _values!1445) e!739951)))

(declare-fun array_inv!31706 (array!86139) Bool)

(assert (=> start!109638 (array_inv!31706 _keys!1741)))

(assert (=> start!109638 tp!101827))

(declare-fun mapNonEmpty!53375 () Bool)

(declare-fun tp!101828 () Bool)

(assert (=> mapNonEmpty!53375 (= mapRes!53375 (and tp!101828 e!739952))))

(declare-fun mapKey!53375 () (_ BitVec 32))

(declare-fun mapRest!53375 () (Array (_ BitVec 32) ValueCell!16373))

(declare-fun mapValue!53375 () ValueCell!16373)

(assert (=> mapNonEmpty!53375 (= (arr!41567 _values!1445) (store mapRest!53375 mapKey!53375 mapValue!53375))))

(declare-fun b!1296685 () Bool)

(declare-fun e!739949 () Bool)

(assert (=> b!1296685 (= e!739949 tp_is_empty!34543)))

(declare-fun b!1296686 () Bool)

(declare-fun res!861454 () Bool)

(assert (=> b!1296686 (=> (not res!861454) (not e!739948))))

(assert (=> b!1296686 (= res!861454 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42117 _keys!1741))))))

(declare-fun b!1296687 () Bool)

(declare-fun res!861450 () Bool)

(assert (=> b!1296687 (=> (not res!861450) (not e!739948))))

(assert (=> b!1296687 (= res!861450 (and (= (size!42118 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42117 _keys!1741) (size!42118 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296688 () Bool)

(declare-fun res!861455 () Bool)

(assert (=> b!1296688 (=> (not res!861455) (not e!739948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86139 (_ BitVec 32)) Bool)

(assert (=> b!1296688 (= res!861455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296689 () Bool)

(assert (=> b!1296689 (= e!739951 (and e!739949 mapRes!53375))))

(declare-fun condMapEmpty!53375 () Bool)

(declare-fun mapDefault!53375 () ValueCell!16373)

(assert (=> b!1296689 (= condMapEmpty!53375 (= (arr!41567 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16373)) mapDefault!53375)))))

(declare-fun b!1296690 () Bool)

(declare-fun res!861457 () Bool)

(assert (=> b!1296690 (=> (not res!861457) (not e!739948))))

(assert (=> b!1296690 (= res!861457 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42117 _keys!1741))))))

(declare-fun b!1296691 () Bool)

(assert (=> b!1296691 (= e!739948 (not e!739950))))

(declare-fun res!861453 () Bool)

(assert (=> b!1296691 (=> res!861453 e!739950)))

(assert (=> b!1296691 (= res!861453 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296691 (not (contains!8148 (ListLongMap!20004 Nil!29501) k0!1205))))

(declare-fun lt!580366 () Unit!42865)

(declare-fun emptyContainsNothing!175 ((_ BitVec 64)) Unit!42865)

(assert (=> b!1296691 (= lt!580366 (emptyContainsNothing!175 k0!1205))))

(assert (= (and start!109638 res!861452) b!1296687))

(assert (= (and b!1296687 res!861450) b!1296688))

(assert (= (and b!1296688 res!861455) b!1296683))

(assert (= (and b!1296683 res!861456) b!1296686))

(assert (= (and b!1296686 res!861454) b!1296684))

(assert (= (and b!1296684 res!861449) b!1296690))

(assert (= (and b!1296690 res!861457) b!1296681))

(assert (= (and b!1296681 res!861451) b!1296691))

(assert (= (and b!1296691 (not res!861453)) b!1296682))

(assert (= (and b!1296689 condMapEmpty!53375) mapIsEmpty!53375))

(assert (= (and b!1296689 (not condMapEmpty!53375)) mapNonEmpty!53375))

(get-info :version)

(assert (= (and mapNonEmpty!53375 ((_ is ValueCellFull!16373) mapValue!53375)) b!1296680))

(assert (= (and b!1296689 ((_ is ValueCellFull!16373) mapDefault!53375)) b!1296685))

(assert (= start!109638 b!1296689))

(declare-fun m!1189017 () Bool)

(assert (=> b!1296684 m!1189017))

(assert (=> b!1296684 m!1189017))

(declare-fun m!1189019 () Bool)

(assert (=> b!1296684 m!1189019))

(declare-fun m!1189021 () Bool)

(assert (=> b!1296688 m!1189021))

(declare-fun m!1189023 () Bool)

(assert (=> b!1296682 m!1189023))

(assert (=> b!1296682 m!1189023))

(declare-fun m!1189025 () Bool)

(assert (=> b!1296682 m!1189025))

(declare-fun m!1189027 () Bool)

(assert (=> b!1296682 m!1189027))

(declare-fun m!1189029 () Bool)

(assert (=> b!1296682 m!1189029))

(declare-fun m!1189031 () Bool)

(assert (=> b!1296681 m!1189031))

(assert (=> b!1296681 m!1189031))

(declare-fun m!1189033 () Bool)

(assert (=> b!1296681 m!1189033))

(declare-fun m!1189035 () Bool)

(assert (=> mapNonEmpty!53375 m!1189035))

(declare-fun m!1189037 () Bool)

(assert (=> b!1296691 m!1189037))

(declare-fun m!1189039 () Bool)

(assert (=> b!1296691 m!1189039))

(declare-fun m!1189041 () Bool)

(assert (=> start!109638 m!1189041))

(declare-fun m!1189043 () Bool)

(assert (=> start!109638 m!1189043))

(declare-fun m!1189045 () Bool)

(assert (=> start!109638 m!1189045))

(declare-fun m!1189047 () Bool)

(assert (=> b!1296683 m!1189047))

(check-sat (not b!1296681) (not b!1296688) (not start!109638) (not b!1296691) tp_is_empty!34543 (not b!1296682) (not mapNonEmpty!53375) b_and!46995 (not b!1296683) (not b!1296684) (not b_next!28903))
(check-sat b_and!46995 (not b_next!28903))
