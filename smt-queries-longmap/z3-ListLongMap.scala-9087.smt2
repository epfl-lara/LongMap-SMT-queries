; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109530 () Bool)

(assert start!109530)

(declare-fun b_free!28795 () Bool)

(declare-fun b_next!28795 () Bool)

(assert (=> start!109530 (= b_free!28795 (not b_next!28795))))

(declare-fun tp!101503 () Bool)

(declare-fun b_and!46887 () Bool)

(assert (=> start!109530 (= tp!101503 b_and!46887)))

(declare-fun b!1294817 () Bool)

(declare-fun res!860074 () Bool)

(declare-fun e!739058 () Bool)

(assert (=> b!1294817 (=> (not res!860074) (not e!739058))))

(declare-datatypes ((array!85929 0))(
  ( (array!85930 (arr!41461 (Array (_ BitVec 32) (_ BitVec 64))) (size!42012 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85929)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294817 (= res!860074 (not (validKeyInArray!0 (select (arr!41461 _keys!1741) from!2144))))))

(declare-fun b!1294818 () Bool)

(declare-fun e!739061 () Bool)

(assert (=> b!1294818 (= e!739061 true)))

(declare-datatypes ((V!51017 0))(
  ( (V!51018 (val!17292 Int)) )
))
(declare-datatypes ((tuple2!22262 0))(
  ( (tuple2!22263 (_1!11142 (_ BitVec 64)) (_2!11142 V!51017)) )
))
(declare-datatypes ((List!29429 0))(
  ( (Nil!29426) (Cons!29425 (h!30643 tuple2!22262) (t!42985 List!29429)) )
))
(declare-datatypes ((ListLongMap!19927 0))(
  ( (ListLongMap!19928 (toList!9979 List!29429)) )
))
(declare-fun lt!580052 () ListLongMap!19927)

(declare-fun zeroValue!1387 () V!51017)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8110 (ListLongMap!19927 (_ BitVec 64)) Bool)

(declare-fun +!4448 (ListLongMap!19927 tuple2!22262) ListLongMap!19927)

(assert (=> b!1294818 (not (contains!8110 (+!4448 lt!580052 (tuple2!22263 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42795 0))(
  ( (Unit!42796) )
))
(declare-fun lt!580051 () Unit!42795)

(declare-fun addStillNotContains!424 (ListLongMap!19927 (_ BitVec 64) V!51017 (_ BitVec 64)) Unit!42795)

(assert (=> b!1294818 (= lt!580051 (addStillNotContains!424 lt!580052 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51017)

(declare-datatypes ((ValueCell!16319 0))(
  ( (ValueCellFull!16319 (v!19890 V!51017)) (EmptyCell!16319) )
))
(declare-datatypes ((array!85931 0))(
  ( (array!85932 (arr!41462 (Array (_ BitVec 32) ValueCell!16319)) (size!42013 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85931)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6088 (array!85929 array!85931 (_ BitVec 32) (_ BitVec 32) V!51017 V!51017 (_ BitVec 32) Int) ListLongMap!19927)

(assert (=> b!1294818 (= lt!580052 (getCurrentListMapNoExtraKeys!6088 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53213 () Bool)

(declare-fun mapRes!53213 () Bool)

(assert (=> mapIsEmpty!53213 mapRes!53213))

(declare-fun b!1294819 () Bool)

(declare-fun res!860078 () Bool)

(assert (=> b!1294819 (=> (not res!860078) (not e!739058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85929 (_ BitVec 32)) Bool)

(assert (=> b!1294819 (= res!860078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294820 () Bool)

(declare-fun e!739060 () Bool)

(declare-fun tp_is_empty!34435 () Bool)

(assert (=> b!1294820 (= e!739060 tp_is_empty!34435)))

(declare-fun b!1294821 () Bool)

(declare-fun res!860072 () Bool)

(assert (=> b!1294821 (=> (not res!860072) (not e!739058))))

(assert (=> b!1294821 (= res!860072 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42012 _keys!1741))))))

(declare-fun res!860075 () Bool)

(assert (=> start!109530 (=> (not res!860075) (not e!739058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109530 (= res!860075 (validMask!0 mask!2175))))

(assert (=> start!109530 e!739058))

(assert (=> start!109530 tp_is_empty!34435))

(assert (=> start!109530 true))

(declare-fun e!739062 () Bool)

(declare-fun array_inv!31637 (array!85931) Bool)

(assert (=> start!109530 (and (array_inv!31637 _values!1445) e!739062)))

(declare-fun array_inv!31638 (array!85929) Bool)

(assert (=> start!109530 (array_inv!31638 _keys!1741)))

(assert (=> start!109530 tp!101503))

(declare-fun b!1294822 () Bool)

(declare-fun res!860077 () Bool)

(assert (=> b!1294822 (=> (not res!860077) (not e!739058))))

(assert (=> b!1294822 (= res!860077 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42012 _keys!1741))))))

(declare-fun b!1294823 () Bool)

(assert (=> b!1294823 (= e!739058 (not e!739061))))

(declare-fun res!860076 () Bool)

(assert (=> b!1294823 (=> res!860076 e!739061)))

(assert (=> b!1294823 (= res!860076 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1294823 (not (contains!8110 (ListLongMap!19928 Nil!29426) k0!1205))))

(declare-fun lt!580053 () Unit!42795)

(declare-fun emptyContainsNothing!140 ((_ BitVec 64)) Unit!42795)

(assert (=> b!1294823 (= lt!580053 (emptyContainsNothing!140 k0!1205))))

(declare-fun b!1294824 () Bool)

(declare-fun res!860080 () Bool)

(assert (=> b!1294824 (=> (not res!860080) (not e!739058))))

(declare-fun getCurrentListMap!5009 (array!85929 array!85931 (_ BitVec 32) (_ BitVec 32) V!51017 V!51017 (_ BitVec 32) Int) ListLongMap!19927)

(assert (=> b!1294824 (= res!860080 (contains!8110 (getCurrentListMap!5009 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53213 () Bool)

(declare-fun tp!101504 () Bool)

(assert (=> mapNonEmpty!53213 (= mapRes!53213 (and tp!101504 e!739060))))

(declare-fun mapValue!53213 () ValueCell!16319)

(declare-fun mapKey!53213 () (_ BitVec 32))

(declare-fun mapRest!53213 () (Array (_ BitVec 32) ValueCell!16319))

(assert (=> mapNonEmpty!53213 (= (arr!41462 _values!1445) (store mapRest!53213 mapKey!53213 mapValue!53213))))

(declare-fun b!1294825 () Bool)

(declare-fun res!860073 () Bool)

(assert (=> b!1294825 (=> (not res!860073) (not e!739058))))

(assert (=> b!1294825 (= res!860073 (and (= (size!42013 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42012 _keys!1741) (size!42013 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294826 () Bool)

(declare-fun e!739057 () Bool)

(assert (=> b!1294826 (= e!739062 (and e!739057 mapRes!53213))))

(declare-fun condMapEmpty!53213 () Bool)

(declare-fun mapDefault!53213 () ValueCell!16319)

(assert (=> b!1294826 (= condMapEmpty!53213 (= (arr!41462 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16319)) mapDefault!53213)))))

(declare-fun b!1294827 () Bool)

(declare-fun res!860079 () Bool)

(assert (=> b!1294827 (=> (not res!860079) (not e!739058))))

(declare-datatypes ((List!29430 0))(
  ( (Nil!29427) (Cons!29426 (h!30644 (_ BitVec 64)) (t!42986 List!29430)) )
))
(declare-fun arrayNoDuplicates!0 (array!85929 (_ BitVec 32) List!29430) Bool)

(assert (=> b!1294827 (= res!860079 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29427))))

(declare-fun b!1294828 () Bool)

(assert (=> b!1294828 (= e!739057 tp_is_empty!34435)))

(assert (= (and start!109530 res!860075) b!1294825))

(assert (= (and b!1294825 res!860073) b!1294819))

(assert (= (and b!1294819 res!860078) b!1294827))

(assert (= (and b!1294827 res!860079) b!1294821))

(assert (= (and b!1294821 res!860072) b!1294824))

(assert (= (and b!1294824 res!860080) b!1294822))

(assert (= (and b!1294822 res!860077) b!1294817))

(assert (= (and b!1294817 res!860074) b!1294823))

(assert (= (and b!1294823 (not res!860076)) b!1294818))

(assert (= (and b!1294826 condMapEmpty!53213) mapIsEmpty!53213))

(assert (= (and b!1294826 (not condMapEmpty!53213)) mapNonEmpty!53213))

(get-info :version)

(assert (= (and mapNonEmpty!53213 ((_ is ValueCellFull!16319) mapValue!53213)) b!1294820))

(assert (= (and b!1294826 ((_ is ValueCellFull!16319) mapDefault!53213)) b!1294828))

(assert (= start!109530 b!1294826))

(declare-fun m!1187517 () Bool)

(assert (=> b!1294823 m!1187517))

(declare-fun m!1187519 () Bool)

(assert (=> b!1294823 m!1187519))

(declare-fun m!1187521 () Bool)

(assert (=> b!1294827 m!1187521))

(declare-fun m!1187523 () Bool)

(assert (=> b!1294819 m!1187523))

(declare-fun m!1187525 () Bool)

(assert (=> start!109530 m!1187525))

(declare-fun m!1187527 () Bool)

(assert (=> start!109530 m!1187527))

(declare-fun m!1187529 () Bool)

(assert (=> start!109530 m!1187529))

(declare-fun m!1187531 () Bool)

(assert (=> mapNonEmpty!53213 m!1187531))

(declare-fun m!1187533 () Bool)

(assert (=> b!1294817 m!1187533))

(assert (=> b!1294817 m!1187533))

(declare-fun m!1187535 () Bool)

(assert (=> b!1294817 m!1187535))

(declare-fun m!1187537 () Bool)

(assert (=> b!1294818 m!1187537))

(assert (=> b!1294818 m!1187537))

(declare-fun m!1187539 () Bool)

(assert (=> b!1294818 m!1187539))

(declare-fun m!1187541 () Bool)

(assert (=> b!1294818 m!1187541))

(declare-fun m!1187543 () Bool)

(assert (=> b!1294818 m!1187543))

(declare-fun m!1187545 () Bool)

(assert (=> b!1294824 m!1187545))

(assert (=> b!1294824 m!1187545))

(declare-fun m!1187547 () Bool)

(assert (=> b!1294824 m!1187547))

(check-sat (not b!1294824) (not b!1294818) b_and!46887 (not b_next!28795) (not b!1294817) (not b!1294819) (not b!1294827) (not b!1294823) (not start!109530) tp_is_empty!34435 (not mapNonEmpty!53213))
(check-sat b_and!46887 (not b_next!28795))
