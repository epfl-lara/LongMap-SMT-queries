; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109266 () Bool)

(assert start!109266)

(declare-fun b_free!28755 () Bool)

(declare-fun b_next!28755 () Bool)

(assert (=> start!109266 (= b_free!28755 (not b_next!28755))))

(declare-fun tp!101384 () Bool)

(declare-fun b_and!46845 () Bool)

(assert (=> start!109266 (= tp!101384 b_and!46845)))

(declare-fun b!1292792 () Bool)

(declare-fun e!737854 () Bool)

(declare-fun e!737855 () Bool)

(assert (=> b!1292792 (= e!737854 (not e!737855))))

(declare-fun res!859012 () Bool)

(assert (=> b!1292792 (=> res!859012 e!737855)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292792 (= res!859012 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50963 0))(
  ( (V!50964 (val!17272 Int)) )
))
(declare-datatypes ((tuple2!22226 0))(
  ( (tuple2!22227 (_1!11124 (_ BitVec 64)) (_2!11124 V!50963)) )
))
(declare-datatypes ((List!29376 0))(
  ( (Nil!29373) (Cons!29372 (h!30581 tuple2!22226) (t!42940 List!29376)) )
))
(declare-datatypes ((ListLongMap!19883 0))(
  ( (ListLongMap!19884 (toList!9957 List!29376)) )
))
(declare-fun contains!8075 (ListLongMap!19883 (_ BitVec 64)) Bool)

(assert (=> b!1292792 (not (contains!8075 (ListLongMap!19884 Nil!29373) k0!1205))))

(declare-datatypes ((Unit!42814 0))(
  ( (Unit!42815) )
))
(declare-fun lt!579387 () Unit!42814)

(declare-fun emptyContainsNothing!129 ((_ BitVec 64)) Unit!42814)

(assert (=> b!1292792 (= lt!579387 (emptyContainsNothing!129 k0!1205))))

(declare-fun b!1292793 () Bool)

(declare-fun e!737852 () Bool)

(declare-fun tp_is_empty!34395 () Bool)

(assert (=> b!1292793 (= e!737852 tp_is_empty!34395)))

(declare-fun b!1292794 () Bool)

(assert (=> b!1292794 (= e!737855 true)))

(declare-fun lt!579389 () ListLongMap!19883)

(declare-fun zeroValue!1387 () V!50963)

(declare-fun +!4393 (ListLongMap!19883 tuple2!22226) ListLongMap!19883)

(assert (=> b!1292794 (not (contains!8075 (+!4393 lt!579389 (tuple2!22227 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579388 () Unit!42814)

(declare-fun addStillNotContains!411 (ListLongMap!19883 (_ BitVec 64) V!50963 (_ BitVec 64)) Unit!42814)

(assert (=> b!1292794 (= lt!579388 (addStillNotContains!411 lt!579389 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50963)

(declare-datatypes ((ValueCell!16299 0))(
  ( (ValueCellFull!16299 (v!19875 V!50963)) (EmptyCell!16299) )
))
(declare-datatypes ((array!85822 0))(
  ( (array!85823 (arr!41412 (Array (_ BitVec 32) ValueCell!16299)) (size!41962 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85822)

(declare-datatypes ((array!85824 0))(
  ( (array!85825 (arr!41413 (Array (_ BitVec 32) (_ BitVec 64))) (size!41963 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85824)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6025 (array!85824 array!85822 (_ BitVec 32) (_ BitVec 32) V!50963 V!50963 (_ BitVec 32) Int) ListLongMap!19883)

(assert (=> b!1292794 (= lt!579389 (getCurrentListMapNoExtraKeys!6025 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1292795 () Bool)

(declare-fun e!737853 () Bool)

(declare-fun mapRes!53153 () Bool)

(assert (=> b!1292795 (= e!737853 (and e!737852 mapRes!53153))))

(declare-fun condMapEmpty!53153 () Bool)

(declare-fun mapDefault!53153 () ValueCell!16299)

(assert (=> b!1292795 (= condMapEmpty!53153 (= (arr!41412 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16299)) mapDefault!53153)))))

(declare-fun b!1292796 () Bool)

(declare-fun res!859014 () Bool)

(assert (=> b!1292796 (=> (not res!859014) (not e!737854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85824 (_ BitVec 32)) Bool)

(assert (=> b!1292796 (= res!859014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53153 () Bool)

(assert (=> mapIsEmpty!53153 mapRes!53153))

(declare-fun b!1292797 () Bool)

(declare-fun res!859015 () Bool)

(assert (=> b!1292797 (=> (not res!859015) (not e!737854))))

(declare-fun getCurrentListMap!5001 (array!85824 array!85822 (_ BitVec 32) (_ BitVec 32) V!50963 V!50963 (_ BitVec 32) Int) ListLongMap!19883)

(assert (=> b!1292797 (= res!859015 (contains!8075 (getCurrentListMap!5001 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292798 () Bool)

(declare-fun res!859020 () Bool)

(assert (=> b!1292798 (=> (not res!859020) (not e!737854))))

(assert (=> b!1292798 (= res!859020 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41963 _keys!1741))))))

(declare-fun b!1292799 () Bool)

(declare-fun res!859017 () Bool)

(assert (=> b!1292799 (=> (not res!859017) (not e!737854))))

(assert (=> b!1292799 (= res!859017 (and (= (size!41962 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41963 _keys!1741) (size!41962 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53153 () Bool)

(declare-fun tp!101383 () Bool)

(declare-fun e!737850 () Bool)

(assert (=> mapNonEmpty!53153 (= mapRes!53153 (and tp!101383 e!737850))))

(declare-fun mapRest!53153 () (Array (_ BitVec 32) ValueCell!16299))

(declare-fun mapValue!53153 () ValueCell!16299)

(declare-fun mapKey!53153 () (_ BitVec 32))

(assert (=> mapNonEmpty!53153 (= (arr!41412 _values!1445) (store mapRest!53153 mapKey!53153 mapValue!53153))))

(declare-fun res!859019 () Bool)

(assert (=> start!109266 (=> (not res!859019) (not e!737854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109266 (= res!859019 (validMask!0 mask!2175))))

(assert (=> start!109266 e!737854))

(assert (=> start!109266 tp_is_empty!34395))

(assert (=> start!109266 true))

(declare-fun array_inv!31377 (array!85822) Bool)

(assert (=> start!109266 (and (array_inv!31377 _values!1445) e!737853)))

(declare-fun array_inv!31378 (array!85824) Bool)

(assert (=> start!109266 (array_inv!31378 _keys!1741)))

(assert (=> start!109266 tp!101384))

(declare-fun b!1292800 () Bool)

(assert (=> b!1292800 (= e!737850 tp_is_empty!34395)))

(declare-fun b!1292801 () Bool)

(declare-fun res!859018 () Bool)

(assert (=> b!1292801 (=> (not res!859018) (not e!737854))))

(assert (=> b!1292801 (= res!859018 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41963 _keys!1741))))))

(declare-fun b!1292802 () Bool)

(declare-fun res!859016 () Bool)

(assert (=> b!1292802 (=> (not res!859016) (not e!737854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292802 (= res!859016 (not (validKeyInArray!0 (select (arr!41413 _keys!1741) from!2144))))))

(declare-fun b!1292803 () Bool)

(declare-fun res!859013 () Bool)

(assert (=> b!1292803 (=> (not res!859013) (not e!737854))))

(declare-datatypes ((List!29377 0))(
  ( (Nil!29374) (Cons!29373 (h!30582 (_ BitVec 64)) (t!42941 List!29377)) )
))
(declare-fun arrayNoDuplicates!0 (array!85824 (_ BitVec 32) List!29377) Bool)

(assert (=> b!1292803 (= res!859013 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29374))))

(assert (= (and start!109266 res!859019) b!1292799))

(assert (= (and b!1292799 res!859017) b!1292796))

(assert (= (and b!1292796 res!859014) b!1292803))

(assert (= (and b!1292803 res!859013) b!1292798))

(assert (= (and b!1292798 res!859020) b!1292797))

(assert (= (and b!1292797 res!859015) b!1292801))

(assert (= (and b!1292801 res!859018) b!1292802))

(assert (= (and b!1292802 res!859016) b!1292792))

(assert (= (and b!1292792 (not res!859012)) b!1292794))

(assert (= (and b!1292795 condMapEmpty!53153) mapIsEmpty!53153))

(assert (= (and b!1292795 (not condMapEmpty!53153)) mapNonEmpty!53153))

(get-info :version)

(assert (= (and mapNonEmpty!53153 ((_ is ValueCellFull!16299) mapValue!53153)) b!1292800))

(assert (= (and b!1292795 ((_ is ValueCellFull!16299) mapDefault!53153)) b!1292793))

(assert (= start!109266 b!1292795))

(declare-fun m!1185259 () Bool)

(assert (=> start!109266 m!1185259))

(declare-fun m!1185261 () Bool)

(assert (=> start!109266 m!1185261))

(declare-fun m!1185263 () Bool)

(assert (=> start!109266 m!1185263))

(declare-fun m!1185265 () Bool)

(assert (=> b!1292797 m!1185265))

(assert (=> b!1292797 m!1185265))

(declare-fun m!1185267 () Bool)

(assert (=> b!1292797 m!1185267))

(declare-fun m!1185269 () Bool)

(assert (=> b!1292803 m!1185269))

(declare-fun m!1185271 () Bool)

(assert (=> b!1292802 m!1185271))

(assert (=> b!1292802 m!1185271))

(declare-fun m!1185273 () Bool)

(assert (=> b!1292802 m!1185273))

(declare-fun m!1185275 () Bool)

(assert (=> b!1292794 m!1185275))

(assert (=> b!1292794 m!1185275))

(declare-fun m!1185277 () Bool)

(assert (=> b!1292794 m!1185277))

(declare-fun m!1185279 () Bool)

(assert (=> b!1292794 m!1185279))

(declare-fun m!1185281 () Bool)

(assert (=> b!1292794 m!1185281))

(declare-fun m!1185283 () Bool)

(assert (=> b!1292792 m!1185283))

(declare-fun m!1185285 () Bool)

(assert (=> b!1292792 m!1185285))

(declare-fun m!1185287 () Bool)

(assert (=> b!1292796 m!1185287))

(declare-fun m!1185289 () Bool)

(assert (=> mapNonEmpty!53153 m!1185289))

(check-sat b_and!46845 tp_is_empty!34395 (not b!1292796) (not b!1292797) (not b!1292802) (not mapNonEmpty!53153) (not b!1292794) (not b!1292792) (not b_next!28755) (not start!109266) (not b!1292803))
(check-sat b_and!46845 (not b_next!28755))
