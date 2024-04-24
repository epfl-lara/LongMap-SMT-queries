; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109128 () Bool)

(assert start!109128)

(declare-fun b_free!28417 () Bool)

(declare-fun b_next!28417 () Bool)

(assert (=> start!109128 (= b_free!28417 (not b_next!28417))))

(declare-fun tp!100367 () Bool)

(declare-fun b_and!46497 () Bool)

(assert (=> start!109128 (= tp!100367 b_and!46497)))

(declare-fun b!1287832 () Bool)

(declare-datatypes ((Unit!42492 0))(
  ( (Unit!42493) )
))
(declare-fun e!735641 () Unit!42492)

(declare-fun Unit!42494 () Unit!42492)

(assert (=> b!1287832 (= e!735641 Unit!42494)))

(declare-fun b!1287833 () Bool)

(declare-fun lt!577811 () Unit!42492)

(assert (=> b!1287833 (= e!735641 lt!577811)))

(declare-datatypes ((V!50513 0))(
  ( (V!50514 (val!17103 Int)) )
))
(declare-datatypes ((tuple2!21952 0))(
  ( (tuple2!21953 (_1!10987 (_ BitVec 64)) (_2!10987 V!50513)) )
))
(declare-datatypes ((List!29148 0))(
  ( (Nil!29145) (Cons!29144 (h!30362 tuple2!21952) (t!42698 List!29148)) )
))
(declare-datatypes ((ListLongMap!19617 0))(
  ( (ListLongMap!19618 (toList!9824 List!29148)) )
))
(declare-fun lt!577810 () ListLongMap!19617)

(declare-fun call!63019 () ListLongMap!19617)

(assert (=> b!1287833 (= lt!577810 call!63019)))

(declare-fun call!63020 () Unit!42492)

(assert (=> b!1287833 (= lt!577811 call!63020)))

(declare-fun call!63017 () Bool)

(assert (=> b!1287833 call!63017))

(declare-fun bm!63014 () Bool)

(declare-fun call!63021 () Bool)

(assert (=> bm!63014 (= call!63017 call!63021)))

(declare-fun b!1287834 () Bool)

(declare-fun e!735646 () Unit!42492)

(declare-fun e!735640 () Unit!42492)

(assert (=> b!1287834 (= e!735646 e!735640)))

(declare-fun c!124592 () Bool)

(declare-fun lt!577813 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287834 (= c!124592 (and (not lt!577813) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1287835 () Bool)

(declare-fun res!855100 () Bool)

(declare-fun e!735648 () Bool)

(assert (=> b!1287835 (=> (not res!855100) (not e!735648))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85199 0))(
  ( (array!85200 (arr!41097 (Array (_ BitVec 32) (_ BitVec 64))) (size!41648 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85199)

(assert (=> b!1287835 (= res!855100 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41648 _keys!1741))))))

(declare-fun b!1287836 () Bool)

(declare-fun res!855094 () Bool)

(assert (=> b!1287836 (=> (not res!855094) (not e!735648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287836 (= res!855094 (validKeyInArray!0 (select (arr!41097 _keys!1741) from!2144)))))

(declare-fun b!1287837 () Bool)

(declare-fun e!735647 () Bool)

(assert (=> b!1287837 (= e!735647 true)))

(declare-fun lt!577814 () V!50513)

(declare-fun contains!7954 (ListLongMap!19617 (_ BitVec 64)) Bool)

(declare-fun +!4360 (ListLongMap!19617 tuple2!21952) ListLongMap!19617)

(assert (=> b!1287837 (not (contains!7954 (+!4360 (ListLongMap!19618 Nil!29145) (tuple2!21953 (select (arr!41097 _keys!1741) from!2144) lt!577814)) k0!1205))))

(declare-fun lt!577812 () Unit!42492)

(declare-fun addStillNotContains!340 (ListLongMap!19617 (_ BitVec 64) V!50513 (_ BitVec 64)) Unit!42492)

(assert (=> b!1287837 (= lt!577812 (addStillNotContains!340 (ListLongMap!19618 Nil!29145) (select (arr!41097 _keys!1741) from!2144) lt!577814 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((ValueCell!16130 0))(
  ( (ValueCellFull!16130 (v!19700 V!50513)) (EmptyCell!16130) )
))
(declare-datatypes ((array!85201 0))(
  ( (array!85202 (arr!41098 (Array (_ BitVec 32) ValueCell!16130)) (size!41649 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85201)

(declare-fun get!20910 (ValueCell!16130 V!50513) V!50513)

(declare-fun dynLambda!3475 (Int (_ BitVec 64)) V!50513)

(assert (=> b!1287837 (= lt!577814 (get!20910 (select (arr!41098 _values!1445) from!2144) (dynLambda!3475 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1287838 () Bool)

(declare-fun c!124590 () Bool)

(assert (=> b!1287838 (= c!124590 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577813))))

(assert (=> b!1287838 (= e!735640 e!735641)))

(declare-fun mapIsEmpty!52643 () Bool)

(declare-fun mapRes!52643 () Bool)

(assert (=> mapIsEmpty!52643 mapRes!52643))

(declare-fun b!1287839 () Bool)

(declare-fun res!855092 () Bool)

(assert (=> b!1287839 (=> (not res!855092) (not e!735648))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85199 (_ BitVec 32)) Bool)

(assert (=> b!1287839 (= res!855092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun bm!63016 () Bool)

(declare-fun call!63022 () Unit!42492)

(assert (=> bm!63016 (= call!63020 call!63022)))

(declare-fun zeroValue!1387 () V!50513)

(declare-fun bm!63017 () Bool)

(declare-fun lt!577818 () ListLongMap!19617)

(declare-fun c!124591 () Bool)

(declare-fun minValue!1387 () V!50513)

(declare-fun lt!577816 () ListLongMap!19617)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!31 ((_ BitVec 64) (_ BitVec 64) V!50513 ListLongMap!19617) Unit!42492)

(assert (=> bm!63017 (= call!63022 (lemmaInListMapAfterAddingDiffThenInBefore!31 k0!1205 (ite c!124591 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124592 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124591 minValue!1387 (ite c!124592 zeroValue!1387 minValue!1387)) (ite c!124591 lt!577816 (ite c!124592 lt!577818 lt!577810))))))

(declare-fun b!1287840 () Bool)

(declare-fun res!855098 () Bool)

(assert (=> b!1287840 (=> (not res!855098) (not e!735648))))

(assert (=> b!1287840 (= res!855098 (and (= (size!41649 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41648 _keys!1741) (size!41649 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287841 () Bool)

(declare-fun e!735642 () Bool)

(declare-fun e!735643 () Bool)

(assert (=> b!1287841 (= e!735642 (and e!735643 mapRes!52643))))

(declare-fun condMapEmpty!52643 () Bool)

(declare-fun mapDefault!52643 () ValueCell!16130)

(assert (=> b!1287841 (= condMapEmpty!52643 (= (arr!41098 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16130)) mapDefault!52643)))))

(declare-fun bm!63018 () Bool)

(declare-fun call!63018 () ListLongMap!19617)

(assert (=> bm!63018 (= call!63019 call!63018)))

(declare-fun b!1287842 () Bool)

(assert (=> b!1287842 call!63017))

(declare-fun lt!577808 () Unit!42492)

(assert (=> b!1287842 (= lt!577808 call!63020)))

(assert (=> b!1287842 (= lt!577818 call!63019)))

(assert (=> b!1287842 (= e!735640 lt!577808)))

(declare-fun mapNonEmpty!52643 () Bool)

(declare-fun tp!100366 () Bool)

(declare-fun e!735644 () Bool)

(assert (=> mapNonEmpty!52643 (= mapRes!52643 (and tp!100366 e!735644))))

(declare-fun mapRest!52643 () (Array (_ BitVec 32) ValueCell!16130))

(declare-fun mapValue!52643 () ValueCell!16130)

(declare-fun mapKey!52643 () (_ BitVec 32))

(assert (=> mapNonEmpty!52643 (= (arr!41098 _values!1445) (store mapRest!52643 mapKey!52643 mapValue!52643))))

(declare-fun b!1287843 () Bool)

(declare-fun res!855096 () Bool)

(assert (=> b!1287843 (=> (not res!855096) (not e!735648))))

(declare-fun getCurrentListMap!4883 (array!85199 array!85201 (_ BitVec 32) (_ BitVec 32) V!50513 V!50513 (_ BitVec 32) Int) ListLongMap!19617)

(assert (=> b!1287843 (= res!855096 (contains!7954 (getCurrentListMap!4883 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63019 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5994 (array!85199 array!85201 (_ BitVec 32) (_ BitVec 32) V!50513 V!50513 (_ BitVec 32) Int) ListLongMap!19617)

(assert (=> bm!63019 (= call!63018 (getCurrentListMapNoExtraKeys!5994 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!63015 () Bool)

(assert (=> bm!63015 (= call!63021 (contains!7954 (ite c!124591 lt!577816 (ite c!124592 lt!577818 lt!577810)) k0!1205))))

(declare-fun res!855099 () Bool)

(assert (=> start!109128 (=> (not res!855099) (not e!735648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109128 (= res!855099 (validMask!0 mask!2175))))

(assert (=> start!109128 e!735648))

(declare-fun tp_is_empty!34057 () Bool)

(assert (=> start!109128 tp_is_empty!34057))

(assert (=> start!109128 true))

(declare-fun array_inv!31375 (array!85201) Bool)

(assert (=> start!109128 (and (array_inv!31375 _values!1445) e!735642)))

(declare-fun array_inv!31376 (array!85199) Bool)

(assert (=> start!109128 (array_inv!31376 _keys!1741)))

(assert (=> start!109128 tp!100367))

(declare-fun b!1287844 () Bool)

(assert (=> b!1287844 (= e!735644 tp_is_empty!34057)))

(declare-fun b!1287845 () Bool)

(assert (=> b!1287845 (= e!735643 tp_is_empty!34057)))

(declare-fun b!1287846 () Bool)

(assert (=> b!1287846 (= e!735648 (not e!735647))))

(declare-fun res!855095 () Bool)

(assert (=> b!1287846 (=> res!855095 e!735647)))

(assert (=> b!1287846 (= res!855095 (= k0!1205 (select (arr!41097 _keys!1741) from!2144)))))

(assert (=> b!1287846 (not (contains!7954 (ListLongMap!19618 Nil!29145) k0!1205))))

(declare-fun lt!577809 () Unit!42492)

(declare-fun emptyContainsNothing!6 ((_ BitVec 64)) Unit!42492)

(assert (=> b!1287846 (= lt!577809 (emptyContainsNothing!6 k0!1205))))

(declare-fun lt!577819 () Unit!42492)

(assert (=> b!1287846 (= lt!577819 e!735646)))

(assert (=> b!1287846 (= c!124591 (and (not lt!577813) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1287846 (= lt!577813 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1287847 () Bool)

(declare-fun lt!577815 () Unit!42492)

(assert (=> b!1287847 (= e!735646 lt!577815)))

(declare-fun lt!577820 () ListLongMap!19617)

(assert (=> b!1287847 (= lt!577820 call!63018)))

(assert (=> b!1287847 (= lt!577816 (+!4360 lt!577820 (tuple2!21953 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577817 () Unit!42492)

(assert (=> b!1287847 (= lt!577817 call!63022)))

(assert (=> b!1287847 call!63021))

(assert (=> b!1287847 (= lt!577815 (lemmaInListMapAfterAddingDiffThenInBefore!31 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!577820))))

(assert (=> b!1287847 (contains!7954 lt!577820 k0!1205)))

(declare-fun b!1287848 () Bool)

(declare-fun res!855093 () Bool)

(assert (=> b!1287848 (=> (not res!855093) (not e!735648))))

(assert (=> b!1287848 (= res!855093 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41648 _keys!1741))))))

(declare-fun b!1287849 () Bool)

(declare-fun res!855097 () Bool)

(assert (=> b!1287849 (=> (not res!855097) (not e!735648))))

(declare-datatypes ((List!29149 0))(
  ( (Nil!29146) (Cons!29145 (h!30363 (_ BitVec 64)) (t!42699 List!29149)) )
))
(declare-fun arrayNoDuplicates!0 (array!85199 (_ BitVec 32) List!29149) Bool)

(assert (=> b!1287849 (= res!855097 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29146))))

(assert (= (and start!109128 res!855099) b!1287840))

(assert (= (and b!1287840 res!855098) b!1287839))

(assert (= (and b!1287839 res!855092) b!1287849))

(assert (= (and b!1287849 res!855097) b!1287848))

(assert (= (and b!1287848 res!855093) b!1287843))

(assert (= (and b!1287843 res!855096) b!1287835))

(assert (= (and b!1287835 res!855100) b!1287836))

(assert (= (and b!1287836 res!855094) b!1287846))

(assert (= (and b!1287846 c!124591) b!1287847))

(assert (= (and b!1287846 (not c!124591)) b!1287834))

(assert (= (and b!1287834 c!124592) b!1287842))

(assert (= (and b!1287834 (not c!124592)) b!1287838))

(assert (= (and b!1287838 c!124590) b!1287833))

(assert (= (and b!1287838 (not c!124590)) b!1287832))

(assert (= (or b!1287842 b!1287833) bm!63018))

(assert (= (or b!1287842 b!1287833) bm!63016))

(assert (= (or b!1287842 b!1287833) bm!63014))

(assert (= (or b!1287847 bm!63018) bm!63019))

(assert (= (or b!1287847 bm!63016) bm!63017))

(assert (= (or b!1287847 bm!63014) bm!63015))

(assert (= (and b!1287846 (not res!855095)) b!1287837))

(assert (= (and b!1287841 condMapEmpty!52643) mapIsEmpty!52643))

(assert (= (and b!1287841 (not condMapEmpty!52643)) mapNonEmpty!52643))

(get-info :version)

(assert (= (and mapNonEmpty!52643 ((_ is ValueCellFull!16130) mapValue!52643)) b!1287844))

(assert (= (and b!1287841 ((_ is ValueCellFull!16130) mapDefault!52643)) b!1287845))

(assert (= start!109128 b!1287841))

(declare-fun b_lambda!23113 () Bool)

(assert (=> (not b_lambda!23113) (not b!1287837)))

(declare-fun t!42697 () Bool)

(declare-fun tb!11353 () Bool)

(assert (=> (and start!109128 (= defaultEntry!1448 defaultEntry!1448) t!42697) tb!11353))

(declare-fun result!23713 () Bool)

(assert (=> tb!11353 (= result!23713 tp_is_empty!34057)))

(assert (=> b!1287837 t!42697))

(declare-fun b_and!46499 () Bool)

(assert (= b_and!46497 (and (=> t!42697 result!23713) b_and!46499)))

(declare-fun m!1181197 () Bool)

(assert (=> start!109128 m!1181197))

(declare-fun m!1181199 () Bool)

(assert (=> start!109128 m!1181199))

(declare-fun m!1181201 () Bool)

(assert (=> start!109128 m!1181201))

(declare-fun m!1181203 () Bool)

(assert (=> b!1287839 m!1181203))

(declare-fun m!1181205 () Bool)

(assert (=> b!1287847 m!1181205))

(declare-fun m!1181207 () Bool)

(assert (=> b!1287847 m!1181207))

(declare-fun m!1181209 () Bool)

(assert (=> b!1287847 m!1181209))

(declare-fun m!1181211 () Bool)

(assert (=> b!1287836 m!1181211))

(assert (=> b!1287836 m!1181211))

(declare-fun m!1181213 () Bool)

(assert (=> b!1287836 m!1181213))

(declare-fun m!1181215 () Bool)

(assert (=> bm!63017 m!1181215))

(assert (=> b!1287846 m!1181211))

(declare-fun m!1181217 () Bool)

(assert (=> b!1287846 m!1181217))

(declare-fun m!1181219 () Bool)

(assert (=> b!1287846 m!1181219))

(declare-fun m!1181221 () Bool)

(assert (=> bm!63015 m!1181221))

(declare-fun m!1181223 () Bool)

(assert (=> b!1287837 m!1181223))

(declare-fun m!1181225 () Bool)

(assert (=> b!1287837 m!1181225))

(assert (=> b!1287837 m!1181211))

(declare-fun m!1181227 () Bool)

(assert (=> b!1287837 m!1181227))

(declare-fun m!1181229 () Bool)

(assert (=> b!1287837 m!1181229))

(assert (=> b!1287837 m!1181229))

(declare-fun m!1181231 () Bool)

(assert (=> b!1287837 m!1181231))

(assert (=> b!1287837 m!1181225))

(assert (=> b!1287837 m!1181223))

(declare-fun m!1181233 () Bool)

(assert (=> b!1287837 m!1181233))

(assert (=> b!1287837 m!1181211))

(declare-fun m!1181235 () Bool)

(assert (=> b!1287843 m!1181235))

(assert (=> b!1287843 m!1181235))

(declare-fun m!1181237 () Bool)

(assert (=> b!1287843 m!1181237))

(declare-fun m!1181239 () Bool)

(assert (=> mapNonEmpty!52643 m!1181239))

(declare-fun m!1181241 () Bool)

(assert (=> bm!63019 m!1181241))

(declare-fun m!1181243 () Bool)

(assert (=> b!1287849 m!1181243))

(check-sat (not mapNonEmpty!52643) (not bm!63015) (not bm!63017) (not b!1287843) (not b!1287837) (not b!1287849) (not bm!63019) tp_is_empty!34057 (not b_lambda!23113) b_and!46499 (not b!1287847) (not b!1287836) (not b!1287846) (not b!1287839) (not b_next!28417) (not start!109128))
(check-sat b_and!46499 (not b_next!28417))
