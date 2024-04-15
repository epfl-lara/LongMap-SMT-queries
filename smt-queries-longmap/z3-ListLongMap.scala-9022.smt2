; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108892 () Bool)

(assert start!108892)

(declare-fun b_free!28405 () Bool)

(declare-fun b_next!28405 () Bool)

(assert (=> start!108892 (= b_free!28405 (not b_next!28405))))

(declare-fun tp!100331 () Bool)

(declare-fun b_and!46453 () Bool)

(assert (=> start!108892 (= tp!100331 b_and!46453)))

(declare-fun mapIsEmpty!52625 () Bool)

(declare-fun mapRes!52625 () Bool)

(assert (=> mapIsEmpty!52625 mapRes!52625))

(declare-fun b!1286128 () Bool)

(declare-fun e!734605 () Bool)

(declare-fun tp_is_empty!34045 () Bool)

(assert (=> b!1286128 (= e!734605 tp_is_empty!34045)))

(declare-fun b!1286129 () Bool)

(declare-datatypes ((Unit!42361 0))(
  ( (Unit!42362) )
))
(declare-fun e!734603 () Unit!42361)

(declare-fun lt!576919 () Unit!42361)

(assert (=> b!1286129 (= e!734603 lt!576919)))

(declare-datatypes ((V!50497 0))(
  ( (V!50498 (val!17097 Int)) )
))
(declare-datatypes ((tuple2!21986 0))(
  ( (tuple2!21987 (_1!11004 (_ BitVec 64)) (_2!11004 V!50497)) )
))
(declare-datatypes ((List!29162 0))(
  ( (Nil!29159) (Cons!29158 (h!30367 tuple2!21986) (t!42700 List!29162)) )
))
(declare-datatypes ((ListLongMap!19643 0))(
  ( (ListLongMap!19644 (toList!9837 List!29162)) )
))
(declare-fun lt!576922 () ListLongMap!19643)

(declare-fun call!62827 () ListLongMap!19643)

(assert (=> b!1286129 (= lt!576922 call!62827)))

(declare-fun lt!576921 () ListLongMap!19643)

(declare-fun zeroValue!1387 () V!50497)

(declare-fun +!4352 (ListLongMap!19643 tuple2!21986) ListLongMap!19643)

(assert (=> b!1286129 (= lt!576921 (+!4352 lt!576922 (tuple2!21987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!576917 () Unit!42361)

(declare-fun call!62826 () Unit!42361)

(assert (=> b!1286129 (= lt!576917 call!62826)))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7884 (ListLongMap!19643 (_ BitVec 64)) Bool)

(assert (=> b!1286129 (contains!7884 lt!576921 k0!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!30 ((_ BitVec 64) (_ BitVec 64) V!50497 ListLongMap!19643) Unit!42361)

(assert (=> b!1286129 (= lt!576919 (lemmaInListMapAfterAddingDiffThenInBefore!30 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!576922))))

(declare-fun call!62830 () Bool)

(assert (=> b!1286129 call!62830))

(declare-fun b!1286130 () Bool)

(declare-fun call!62829 () Bool)

(assert (=> b!1286130 call!62829))

(declare-fun lt!576923 () Unit!42361)

(declare-fun call!62825 () Unit!42361)

(assert (=> b!1286130 (= lt!576923 call!62825)))

(declare-fun lt!576914 () ListLongMap!19643)

(declare-fun call!62828 () ListLongMap!19643)

(assert (=> b!1286130 (= lt!576914 call!62828)))

(declare-fun e!734608 () Unit!42361)

(assert (=> b!1286130 (= e!734608 lt!576923)))

(declare-fun lt!576915 () ListLongMap!19643)

(declare-fun bm!62822 () Bool)

(declare-fun minValue!1387 () V!50497)

(declare-fun c!124121 () Bool)

(declare-fun c!124120 () Bool)

(assert (=> bm!62822 (= call!62826 (lemmaInListMapAfterAddingDiffThenInBefore!30 k0!1205 (ite c!124121 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124120 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124121 minValue!1387 (ite c!124120 zeroValue!1387 minValue!1387)) (ite c!124121 lt!576921 (ite c!124120 lt!576914 lt!576915))))))

(declare-fun bm!62823 () Bool)

(assert (=> bm!62823 (= call!62829 call!62830)))

(declare-fun bm!62824 () Bool)

(assert (=> bm!62824 (= call!62825 call!62826)))

(declare-fun b!1286131 () Bool)

(assert (=> b!1286131 (= e!734603 e!734608)))

(declare-fun lt!576913 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286131 (= c!124120 (and (not lt!576913) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286132 () Bool)

(declare-fun res!854387 () Bool)

(declare-fun e!734604 () Bool)

(assert (=> b!1286132 (=> (not res!854387) (not e!734604))))

(declare-datatypes ((ValueCell!16124 0))(
  ( (ValueCellFull!16124 (v!19698 V!50497)) (EmptyCell!16124) )
))
(declare-datatypes ((array!85033 0))(
  ( (array!85034 (arr!41019 (Array (_ BitVec 32) ValueCell!16124)) (size!41571 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85033)

(declare-datatypes ((array!85035 0))(
  ( (array!85036 (arr!41020 (Array (_ BitVec 32) (_ BitVec 64))) (size!41572 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85035)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4806 (array!85035 array!85033 (_ BitVec 32) (_ BitVec 32) V!50497 V!50497 (_ BitVec 32) Int) ListLongMap!19643)

(assert (=> b!1286132 (= res!854387 (contains!7884 (getCurrentListMap!4806 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!62825 () Bool)

(assert (=> bm!62825 (= call!62828 call!62827)))

(declare-fun b!1286133 () Bool)

(declare-fun res!854390 () Bool)

(assert (=> b!1286133 (=> (not res!854390) (not e!734604))))

(assert (=> b!1286133 (= res!854390 (and (= (size!41571 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41572 _keys!1741) (size!41571 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1286134 () Bool)

(declare-fun e!734602 () Bool)

(assert (=> b!1286134 (= e!734604 (not e!734602))))

(declare-fun res!854391 () Bool)

(assert (=> b!1286134 (=> res!854391 e!734602)))

(assert (=> b!1286134 (= res!854391 (= k0!1205 (select (arr!41020 _keys!1741) from!2144)))))

(assert (=> b!1286134 (not (contains!7884 (ListLongMap!19644 Nil!29159) k0!1205))))

(declare-fun lt!576918 () Unit!42361)

(declare-fun emptyContainsNothing!3 ((_ BitVec 64)) Unit!42361)

(assert (=> b!1286134 (= lt!576918 (emptyContainsNothing!3 k0!1205))))

(declare-fun lt!576924 () Unit!42361)

(assert (=> b!1286134 (= lt!576924 e!734603)))

(assert (=> b!1286134 (= c!124121 (and (not lt!576913) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286134 (= lt!576913 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286135 () Bool)

(declare-fun res!854389 () Bool)

(assert (=> b!1286135 (=> (not res!854389) (not e!734604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286135 (= res!854389 (validKeyInArray!0 (select (arr!41020 _keys!1741) from!2144)))))

(declare-fun b!1286127 () Bool)

(declare-fun res!854385 () Bool)

(assert (=> b!1286127 (=> (not res!854385) (not e!734604))))

(declare-datatypes ((List!29163 0))(
  ( (Nil!29160) (Cons!29159 (h!30368 (_ BitVec 64)) (t!42701 List!29163)) )
))
(declare-fun arrayNoDuplicates!0 (array!85035 (_ BitVec 32) List!29163) Bool)

(assert (=> b!1286127 (= res!854385 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29160))))

(declare-fun res!854388 () Bool)

(assert (=> start!108892 (=> (not res!854388) (not e!734604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108892 (= res!854388 (validMask!0 mask!2175))))

(assert (=> start!108892 e!734604))

(assert (=> start!108892 tp_is_empty!34045))

(assert (=> start!108892 true))

(declare-fun e!734609 () Bool)

(declare-fun array_inv!31265 (array!85033) Bool)

(assert (=> start!108892 (and (array_inv!31265 _values!1445) e!734609)))

(declare-fun array_inv!31266 (array!85035) Bool)

(assert (=> start!108892 (array_inv!31266 _keys!1741)))

(assert (=> start!108892 tp!100331))

(declare-fun b!1286136 () Bool)

(declare-fun res!854383 () Bool)

(assert (=> b!1286136 (=> (not res!854383) (not e!734604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85035 (_ BitVec 32)) Bool)

(assert (=> b!1286136 (= res!854383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286137 () Bool)

(declare-fun res!854386 () Bool)

(assert (=> b!1286137 (=> (not res!854386) (not e!734604))))

(assert (=> b!1286137 (= res!854386 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41572 _keys!1741))))))

(declare-fun b!1286138 () Bool)

(declare-fun c!124122 () Bool)

(assert (=> b!1286138 (= c!124122 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!576913))))

(declare-fun e!734607 () Unit!42361)

(assert (=> b!1286138 (= e!734608 e!734607)))

(declare-fun b!1286139 () Bool)

(declare-fun lt!576912 () Unit!42361)

(assert (=> b!1286139 (= e!734607 lt!576912)))

(assert (=> b!1286139 (= lt!576915 call!62828)))

(assert (=> b!1286139 (= lt!576912 call!62825)))

(assert (=> b!1286139 call!62829))

(declare-fun bm!62826 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5982 (array!85035 array!85033 (_ BitVec 32) (_ BitVec 32) V!50497 V!50497 (_ BitVec 32) Int) ListLongMap!19643)

(assert (=> bm!62826 (= call!62827 (getCurrentListMapNoExtraKeys!5982 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286140 () Bool)

(assert (=> b!1286140 (= e!734602 true)))

(declare-fun lt!576920 () V!50497)

(assert (=> b!1286140 (not (contains!7884 (+!4352 (ListLongMap!19644 Nil!29159) (tuple2!21987 (select (arr!41020 _keys!1741) from!2144) lt!576920)) k0!1205))))

(declare-fun lt!576916 () Unit!42361)

(declare-fun addStillNotContains!336 (ListLongMap!19643 (_ BitVec 64) V!50497 (_ BitVec 64)) Unit!42361)

(assert (=> b!1286140 (= lt!576916 (addStillNotContains!336 (ListLongMap!19644 Nil!29159) (select (arr!41020 _keys!1741) from!2144) lt!576920 k0!1205))))

(declare-fun get!20853 (ValueCell!16124 V!50497) V!50497)

(declare-fun dynLambda!3434 (Int (_ BitVec 64)) V!50497)

(assert (=> b!1286140 (= lt!576920 (get!20853 (select (arr!41019 _values!1445) from!2144) (dynLambda!3434 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1286141 () Bool)

(declare-fun e!734606 () Bool)

(assert (=> b!1286141 (= e!734606 tp_is_empty!34045)))

(declare-fun bm!62827 () Bool)

(assert (=> bm!62827 (= call!62830 (contains!7884 (ite c!124121 lt!576922 (ite c!124120 lt!576914 lt!576915)) k0!1205))))

(declare-fun b!1286142 () Bool)

(assert (=> b!1286142 (= e!734609 (and e!734605 mapRes!52625))))

(declare-fun condMapEmpty!52625 () Bool)

(declare-fun mapDefault!52625 () ValueCell!16124)

(assert (=> b!1286142 (= condMapEmpty!52625 (= (arr!41019 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16124)) mapDefault!52625)))))

(declare-fun b!1286143 () Bool)

(declare-fun Unit!42363 () Unit!42361)

(assert (=> b!1286143 (= e!734607 Unit!42363)))

(declare-fun mapNonEmpty!52625 () Bool)

(declare-fun tp!100332 () Bool)

(assert (=> mapNonEmpty!52625 (= mapRes!52625 (and tp!100332 e!734606))))

(declare-fun mapValue!52625 () ValueCell!16124)

(declare-fun mapRest!52625 () (Array (_ BitVec 32) ValueCell!16124))

(declare-fun mapKey!52625 () (_ BitVec 32))

(assert (=> mapNonEmpty!52625 (= (arr!41019 _values!1445) (store mapRest!52625 mapKey!52625 mapValue!52625))))

(declare-fun b!1286144 () Bool)

(declare-fun res!854384 () Bool)

(assert (=> b!1286144 (=> (not res!854384) (not e!734604))))

(assert (=> b!1286144 (= res!854384 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41572 _keys!1741))))))

(assert (= (and start!108892 res!854388) b!1286133))

(assert (= (and b!1286133 res!854390) b!1286136))

(assert (= (and b!1286136 res!854383) b!1286127))

(assert (= (and b!1286127 res!854385) b!1286144))

(assert (= (and b!1286144 res!854384) b!1286132))

(assert (= (and b!1286132 res!854387) b!1286137))

(assert (= (and b!1286137 res!854386) b!1286135))

(assert (= (and b!1286135 res!854389) b!1286134))

(assert (= (and b!1286134 c!124121) b!1286129))

(assert (= (and b!1286134 (not c!124121)) b!1286131))

(assert (= (and b!1286131 c!124120) b!1286130))

(assert (= (and b!1286131 (not c!124120)) b!1286138))

(assert (= (and b!1286138 c!124122) b!1286139))

(assert (= (and b!1286138 (not c!124122)) b!1286143))

(assert (= (or b!1286130 b!1286139) bm!62825))

(assert (= (or b!1286130 b!1286139) bm!62824))

(assert (= (or b!1286130 b!1286139) bm!62823))

(assert (= (or b!1286129 bm!62825) bm!62826))

(assert (= (or b!1286129 bm!62824) bm!62822))

(assert (= (or b!1286129 bm!62823) bm!62827))

(assert (= (and b!1286134 (not res!854391)) b!1286140))

(assert (= (and b!1286142 condMapEmpty!52625) mapIsEmpty!52625))

(assert (= (and b!1286142 (not condMapEmpty!52625)) mapNonEmpty!52625))

(get-info :version)

(assert (= (and mapNonEmpty!52625 ((_ is ValueCellFull!16124) mapValue!52625)) b!1286141))

(assert (= (and b!1286142 ((_ is ValueCellFull!16124) mapDefault!52625)) b!1286128))

(assert (= start!108892 b!1286142))

(declare-fun b_lambda!23097 () Bool)

(assert (=> (not b_lambda!23097) (not b!1286140)))

(declare-fun t!42699 () Bool)

(declare-fun tb!11341 () Bool)

(assert (=> (and start!108892 (= defaultEntry!1448 defaultEntry!1448) t!42699) tb!11341))

(declare-fun result!23689 () Bool)

(assert (=> tb!11341 (= result!23689 tp_is_empty!34045)))

(assert (=> b!1286140 t!42699))

(declare-fun b_and!46455 () Bool)

(assert (= b_and!46453 (and (=> t!42699 result!23689) b_and!46455)))

(declare-fun m!1178797 () Bool)

(assert (=> bm!62827 m!1178797))

(declare-fun m!1178799 () Bool)

(assert (=> b!1286127 m!1178799))

(declare-fun m!1178801 () Bool)

(assert (=> bm!62822 m!1178801))

(declare-fun m!1178803 () Bool)

(assert (=> b!1286129 m!1178803))

(declare-fun m!1178805 () Bool)

(assert (=> b!1286129 m!1178805))

(declare-fun m!1178807 () Bool)

(assert (=> b!1286129 m!1178807))

(declare-fun m!1178809 () Bool)

(assert (=> b!1286132 m!1178809))

(assert (=> b!1286132 m!1178809))

(declare-fun m!1178811 () Bool)

(assert (=> b!1286132 m!1178811))

(declare-fun m!1178813 () Bool)

(assert (=> b!1286134 m!1178813))

(declare-fun m!1178815 () Bool)

(assert (=> b!1286134 m!1178815))

(declare-fun m!1178817 () Bool)

(assert (=> b!1286134 m!1178817))

(declare-fun m!1178819 () Bool)

(assert (=> b!1286136 m!1178819))

(declare-fun m!1178821 () Bool)

(assert (=> bm!62826 m!1178821))

(assert (=> b!1286135 m!1178813))

(assert (=> b!1286135 m!1178813))

(declare-fun m!1178823 () Bool)

(assert (=> b!1286135 m!1178823))

(declare-fun m!1178825 () Bool)

(assert (=> start!108892 m!1178825))

(declare-fun m!1178827 () Bool)

(assert (=> start!108892 m!1178827))

(declare-fun m!1178829 () Bool)

(assert (=> start!108892 m!1178829))

(declare-fun m!1178831 () Bool)

(assert (=> b!1286140 m!1178831))

(declare-fun m!1178833 () Bool)

(assert (=> b!1286140 m!1178833))

(declare-fun m!1178835 () Bool)

(assert (=> b!1286140 m!1178835))

(assert (=> b!1286140 m!1178831))

(declare-fun m!1178837 () Bool)

(assert (=> b!1286140 m!1178837))

(assert (=> b!1286140 m!1178833))

(declare-fun m!1178839 () Bool)

(assert (=> b!1286140 m!1178839))

(assert (=> b!1286140 m!1178813))

(assert (=> b!1286140 m!1178835))

(assert (=> b!1286140 m!1178813))

(declare-fun m!1178841 () Bool)

(assert (=> b!1286140 m!1178841))

(declare-fun m!1178843 () Bool)

(assert (=> mapNonEmpty!52625 m!1178843))

(check-sat (not bm!62822) (not bm!62826) (not b!1286129) (not b!1286135) b_and!46455 (not b!1286127) (not mapNonEmpty!52625) (not b!1286134) (not bm!62827) (not b_next!28405) (not b!1286136) (not b!1286140) (not start!108892) tp_is_empty!34045 (not b_lambda!23097) (not b!1286132))
(check-sat b_and!46455 (not b_next!28405))
