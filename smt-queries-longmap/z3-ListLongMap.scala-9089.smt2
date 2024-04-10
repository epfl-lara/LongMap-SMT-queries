; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109320 () Bool)

(assert start!109320)

(declare-fun b_free!28809 () Bool)

(declare-fun b_next!28809 () Bool)

(assert (=> start!109320 (= b_free!28809 (not b_next!28809))))

(declare-fun tp!101546 () Bool)

(declare-fun b_and!46899 () Bool)

(assert (=> start!109320 (= tp!101546 b_and!46899)))

(declare-fun b!1293764 () Bool)

(declare-fun e!738337 () Bool)

(declare-fun tp_is_empty!34449 () Bool)

(assert (=> b!1293764 (= e!738337 tp_is_empty!34449)))

(declare-fun b!1293765 () Bool)

(declare-fun e!738341 () Bool)

(declare-fun e!738336 () Bool)

(declare-fun mapRes!53234 () Bool)

(assert (=> b!1293765 (= e!738341 (and e!738336 mapRes!53234))))

(declare-fun condMapEmpty!53234 () Bool)

(declare-datatypes ((V!51035 0))(
  ( (V!51036 (val!17299 Int)) )
))
(declare-datatypes ((ValueCell!16326 0))(
  ( (ValueCellFull!16326 (v!19902 V!51035)) (EmptyCell!16326) )
))
(declare-datatypes ((array!85924 0))(
  ( (array!85925 (arr!41463 (Array (_ BitVec 32) ValueCell!16326)) (size!42013 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85924)

(declare-fun mapDefault!53234 () ValueCell!16326)

(assert (=> b!1293765 (= condMapEmpty!53234 (= (arr!41463 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16326)) mapDefault!53234)))))

(declare-fun b!1293766 () Bool)

(declare-fun res!859741 () Bool)

(declare-fun e!738340 () Bool)

(assert (=> b!1293766 (=> (not res!859741) (not e!738340))))

(declare-datatypes ((array!85926 0))(
  ( (array!85927 (arr!41464 (Array (_ BitVec 32) (_ BitVec 64))) (size!42014 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85926)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85926 (_ BitVec 32)) Bool)

(assert (=> b!1293766 (= res!859741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293767 () Bool)

(declare-fun res!859745 () Bool)

(assert (=> b!1293767 (=> (not res!859745) (not e!738340))))

(declare-fun minValue!1387 () V!51035)

(declare-fun zeroValue!1387 () V!51035)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22264 0))(
  ( (tuple2!22265 (_1!11143 (_ BitVec 64)) (_2!11143 V!51035)) )
))
(declare-datatypes ((List!29411 0))(
  ( (Nil!29408) (Cons!29407 (h!30616 tuple2!22264) (t!42975 List!29411)) )
))
(declare-datatypes ((ListLongMap!19921 0))(
  ( (ListLongMap!19922 (toList!9976 List!29411)) )
))
(declare-fun contains!8094 (ListLongMap!19921 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5017 (array!85926 array!85924 (_ BitVec 32) (_ BitVec 32) V!51035 V!51035 (_ BitVec 32) Int) ListLongMap!19921)

(assert (=> b!1293767 (= res!859745 (contains!8094 (getCurrentListMap!5017 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293768 () Bool)

(assert (=> b!1293768 (= e!738336 tp_is_empty!34449)))

(declare-fun b!1293770 () Bool)

(declare-fun e!738338 () Bool)

(assert (=> b!1293770 (= e!738338 true)))

(declare-fun lt!579630 () ListLongMap!19921)

(declare-fun +!4405 (ListLongMap!19921 tuple2!22264) ListLongMap!19921)

(assert (=> b!1293770 (not (contains!8094 (+!4405 lt!579630 (tuple2!22265 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42846 0))(
  ( (Unit!42847) )
))
(declare-fun lt!579632 () Unit!42846)

(declare-fun addStillNotContains!423 (ListLongMap!19921 (_ BitVec 64) V!51035 (_ BitVec 64)) Unit!42846)

(assert (=> b!1293770 (= lt!579632 (addStillNotContains!423 lt!579630 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6037 (array!85926 array!85924 (_ BitVec 32) (_ BitVec 32) V!51035 V!51035 (_ BitVec 32) Int) ListLongMap!19921)

(assert (=> b!1293770 (= lt!579630 (getCurrentListMapNoExtraKeys!6037 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293771 () Bool)

(declare-fun res!859749 () Bool)

(assert (=> b!1293771 (=> (not res!859749) (not e!738340))))

(assert (=> b!1293771 (= res!859749 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42014 _keys!1741))))))

(declare-fun b!1293772 () Bool)

(declare-fun res!859748 () Bool)

(assert (=> b!1293772 (=> (not res!859748) (not e!738340))))

(assert (=> b!1293772 (= res!859748 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42014 _keys!1741))))))

(declare-fun mapIsEmpty!53234 () Bool)

(assert (=> mapIsEmpty!53234 mapRes!53234))

(declare-fun mapNonEmpty!53234 () Bool)

(declare-fun tp!101545 () Bool)

(assert (=> mapNonEmpty!53234 (= mapRes!53234 (and tp!101545 e!738337))))

(declare-fun mapKey!53234 () (_ BitVec 32))

(declare-fun mapValue!53234 () ValueCell!16326)

(declare-fun mapRest!53234 () (Array (_ BitVec 32) ValueCell!16326))

(assert (=> mapNonEmpty!53234 (= (arr!41463 _values!1445) (store mapRest!53234 mapKey!53234 mapValue!53234))))

(declare-fun b!1293773 () Bool)

(declare-fun res!859747 () Bool)

(assert (=> b!1293773 (=> (not res!859747) (not e!738340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293773 (= res!859747 (not (validKeyInArray!0 (select (arr!41464 _keys!1741) from!2144))))))

(declare-fun b!1293769 () Bool)

(declare-fun res!859742 () Bool)

(assert (=> b!1293769 (=> (not res!859742) (not e!738340))))

(declare-datatypes ((List!29412 0))(
  ( (Nil!29409) (Cons!29408 (h!30617 (_ BitVec 64)) (t!42976 List!29412)) )
))
(declare-fun arrayNoDuplicates!0 (array!85926 (_ BitVec 32) List!29412) Bool)

(assert (=> b!1293769 (= res!859742 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29409))))

(declare-fun res!859746 () Bool)

(assert (=> start!109320 (=> (not res!859746) (not e!738340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109320 (= res!859746 (validMask!0 mask!2175))))

(assert (=> start!109320 e!738340))

(assert (=> start!109320 tp_is_empty!34449))

(assert (=> start!109320 true))

(declare-fun array_inv!31405 (array!85924) Bool)

(assert (=> start!109320 (and (array_inv!31405 _values!1445) e!738341)))

(declare-fun array_inv!31406 (array!85926) Bool)

(assert (=> start!109320 (array_inv!31406 _keys!1741)))

(assert (=> start!109320 tp!101546))

(declare-fun b!1293774 () Bool)

(assert (=> b!1293774 (= e!738340 (not e!738338))))

(declare-fun res!859744 () Bool)

(assert (=> b!1293774 (=> res!859744 e!738338)))

(assert (=> b!1293774 (= res!859744 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293774 (not (contains!8094 (ListLongMap!19922 Nil!29408) k0!1205))))

(declare-fun lt!579631 () Unit!42846)

(declare-fun emptyContainsNothing!144 ((_ BitVec 64)) Unit!42846)

(assert (=> b!1293774 (= lt!579631 (emptyContainsNothing!144 k0!1205))))

(declare-fun b!1293775 () Bool)

(declare-fun res!859743 () Bool)

(assert (=> b!1293775 (=> (not res!859743) (not e!738340))))

(assert (=> b!1293775 (= res!859743 (and (= (size!42013 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42014 _keys!1741) (size!42013 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109320 res!859746) b!1293775))

(assert (= (and b!1293775 res!859743) b!1293766))

(assert (= (and b!1293766 res!859741) b!1293769))

(assert (= (and b!1293769 res!859742) b!1293771))

(assert (= (and b!1293771 res!859749) b!1293767))

(assert (= (and b!1293767 res!859745) b!1293772))

(assert (= (and b!1293772 res!859748) b!1293773))

(assert (= (and b!1293773 res!859747) b!1293774))

(assert (= (and b!1293774 (not res!859744)) b!1293770))

(assert (= (and b!1293765 condMapEmpty!53234) mapIsEmpty!53234))

(assert (= (and b!1293765 (not condMapEmpty!53234)) mapNonEmpty!53234))

(get-info :version)

(assert (= (and mapNonEmpty!53234 ((_ is ValueCellFull!16326) mapValue!53234)) b!1293764))

(assert (= (and b!1293765 ((_ is ValueCellFull!16326) mapDefault!53234)) b!1293768))

(assert (= start!109320 b!1293765))

(declare-fun m!1186123 () Bool)

(assert (=> mapNonEmpty!53234 m!1186123))

(declare-fun m!1186125 () Bool)

(assert (=> b!1293773 m!1186125))

(assert (=> b!1293773 m!1186125))

(declare-fun m!1186127 () Bool)

(assert (=> b!1293773 m!1186127))

(declare-fun m!1186129 () Bool)

(assert (=> b!1293769 m!1186129))

(declare-fun m!1186131 () Bool)

(assert (=> b!1293774 m!1186131))

(declare-fun m!1186133 () Bool)

(assert (=> b!1293774 m!1186133))

(declare-fun m!1186135 () Bool)

(assert (=> b!1293770 m!1186135))

(assert (=> b!1293770 m!1186135))

(declare-fun m!1186137 () Bool)

(assert (=> b!1293770 m!1186137))

(declare-fun m!1186139 () Bool)

(assert (=> b!1293770 m!1186139))

(declare-fun m!1186141 () Bool)

(assert (=> b!1293770 m!1186141))

(declare-fun m!1186143 () Bool)

(assert (=> b!1293767 m!1186143))

(assert (=> b!1293767 m!1186143))

(declare-fun m!1186145 () Bool)

(assert (=> b!1293767 m!1186145))

(declare-fun m!1186147 () Bool)

(assert (=> b!1293766 m!1186147))

(declare-fun m!1186149 () Bool)

(assert (=> start!109320 m!1186149))

(declare-fun m!1186151 () Bool)

(assert (=> start!109320 m!1186151))

(declare-fun m!1186153 () Bool)

(assert (=> start!109320 m!1186153))

(check-sat b_and!46899 tp_is_empty!34449 (not b!1293769) (not b!1293767) (not start!109320) (not b!1293773) (not b!1293770) (not b_next!28809) (not b!1293774) (not mapNonEmpty!53234) (not b!1293766))
(check-sat b_and!46899 (not b_next!28809))
