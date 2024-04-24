; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109686 () Bool)

(assert start!109686)

(declare-fun b_free!28951 () Bool)

(declare-fun b_next!28951 () Bool)

(assert (=> start!109686 (= b_free!28951 (not b_next!28951))))

(declare-fun tp!101972 () Bool)

(declare-fun b_and!47043 () Bool)

(assert (=> start!109686 (= tp!101972 b_and!47043)))

(declare-datatypes ((V!51225 0))(
  ( (V!51226 (val!17370 Int)) )
))
(declare-fun minValue!1387 () V!51225)

(declare-fun bm!63380 () Bool)

(declare-datatypes ((tuple2!22380 0))(
  ( (tuple2!22381 (_1!11201 (_ BitVec 64)) (_2!11201 V!51225)) )
))
(declare-datatypes ((List!29546 0))(
  ( (Nil!29543) (Cons!29542 (h!30760 tuple2!22380) (t!43102 List!29546)) )
))
(declare-datatypes ((ListLongMap!20045 0))(
  ( (ListLongMap!20046 (toList!10038 List!29546)) )
))
(declare-fun lt!580728 () ListLongMap!20045)

(declare-fun lt!580736 () ListLongMap!20045)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!580725 () ListLongMap!20045)

(declare-fun c!124767 () Bool)

(declare-fun zeroValue!1387 () V!51225)

(declare-datatypes ((Unit!42907 0))(
  ( (Unit!42908) )
))
(declare-fun call!63389 () Unit!42907)

(declare-fun c!124768 () Bool)

(declare-fun addStillNotContains!457 (ListLongMap!20045 (_ BitVec 64) V!51225 (_ BitVec 64)) Unit!42907)

(assert (=> bm!63380 (= call!63389 (addStillNotContains!457 (ite c!124767 lt!580725 (ite c!124768 lt!580736 lt!580728)) (ite (or c!124767 c!124768) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124767 c!124768) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun b!1297600 () Bool)

(declare-fun res!862089 () Bool)

(declare-fun e!740406 () Bool)

(assert (=> b!1297600 (=> (not res!862089) (not e!740406))))

(declare-datatypes ((array!86235 0))(
  ( (array!86236 (arr!41614 (Array (_ BitVec 32) (_ BitVec 64))) (size!42165 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86235)

(declare-datatypes ((List!29547 0))(
  ( (Nil!29544) (Cons!29543 (h!30761 (_ BitVec 64)) (t!43103 List!29547)) )
))
(declare-fun arrayNoDuplicates!0 (array!86235 (_ BitVec 32) List!29547) Bool)

(assert (=> b!1297600 (= res!862089 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29544))))

(declare-fun b!1297601 () Bool)

(declare-fun res!862093 () Bool)

(assert (=> b!1297601 (=> (not res!862093) (not e!740406))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16397 0))(
  ( (ValueCellFull!16397 (v!19968 V!51225)) (EmptyCell!16397) )
))
(declare-datatypes ((array!86237 0))(
  ( (array!86238 (arr!41615 (Array (_ BitVec 32) ValueCell!16397)) (size!42166 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86237)

(declare-fun contains!8169 (ListLongMap!20045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5058 (array!86235 array!86237 (_ BitVec 32) (_ BitVec 32) V!51225 V!51225 (_ BitVec 32) Int) ListLongMap!20045)

(assert (=> b!1297601 (= res!862093 (contains!8169 (getCurrentListMap!5058 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun bm!63381 () Bool)

(declare-fun call!63385 () Bool)

(declare-fun call!63384 () Bool)

(assert (=> bm!63381 (= call!63385 call!63384)))

(declare-fun bm!63382 () Bool)

(declare-fun lt!580737 () ListLongMap!20045)

(declare-fun call!63390 () ListLongMap!20045)

(assert (=> bm!63382 (= call!63384 (contains!8169 (ite c!124767 lt!580737 call!63390) k0!1205))))

(declare-fun b!1297602 () Bool)

(declare-fun e!740403 () Unit!42907)

(declare-fun e!740405 () Unit!42907)

(assert (=> b!1297602 (= e!740403 e!740405)))

(declare-fun lt!580740 () Bool)

(assert (=> b!1297602 (= c!124768 (and (not lt!580740) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1297603 () Bool)

(declare-fun res!862092 () Bool)

(assert (=> b!1297603 (=> (not res!862092) (not e!740406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1297603 (= res!862092 (not (validKeyInArray!0 (select (arr!41614 _keys!1741) from!2144))))))

(declare-fun bm!63383 () Bool)

(declare-fun call!63387 () Unit!42907)

(assert (=> bm!63383 (= call!63387 call!63389)))

(declare-fun bm!63384 () Bool)

(declare-fun call!63391 () ListLongMap!20045)

(declare-fun getCurrentListMapNoExtraKeys!6123 (array!86235 array!86237 (_ BitVec 32) (_ BitVec 32) V!51225 V!51225 (_ BitVec 32) Int) ListLongMap!20045)

(assert (=> bm!63384 (= call!63391 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1297604 () Bool)

(declare-fun e!740408 () Bool)

(declare-fun e!740409 () Bool)

(declare-fun mapRes!53447 () Bool)

(assert (=> b!1297604 (= e!740408 (and e!740409 mapRes!53447))))

(declare-fun condMapEmpty!53447 () Bool)

(declare-fun mapDefault!53447 () ValueCell!16397)

(assert (=> b!1297604 (= condMapEmpty!53447 (= (arr!41615 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16397)) mapDefault!53447)))))

(declare-fun b!1297605 () Bool)

(declare-fun c!124769 () Bool)

(assert (=> b!1297605 (= c!124769 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!580740))))

(declare-fun e!740402 () Unit!42907)

(assert (=> b!1297605 (= e!740405 e!740402)))

(declare-fun b!1297599 () Bool)

(declare-fun lt!580732 () Unit!42907)

(assert (=> b!1297599 (= e!740403 lt!580732)))

(assert (=> b!1297599 (= lt!580725 call!63391)))

(declare-fun lt!580734 () Unit!42907)

(assert (=> b!1297599 (= lt!580734 call!63389)))

(declare-fun +!4481 (ListLongMap!20045 tuple2!22380) ListLongMap!20045)

(assert (=> b!1297599 (= lt!580737 (+!4481 lt!580725 (tuple2!22381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1297599 (not call!63384)))

(declare-fun lt!580727 () Unit!42907)

(assert (=> b!1297599 (= lt!580727 (addStillNotContains!457 lt!580725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun call!63386 () ListLongMap!20045)

(assert (=> b!1297599 (not (contains!8169 call!63386 k0!1205))))

(declare-fun lt!580739 () Unit!42907)

(declare-fun call!63393 () Unit!42907)

(assert (=> b!1297599 (= lt!580739 call!63393)))

(assert (=> b!1297599 false))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!69 ((_ BitVec 64) (_ BitVec 64) V!51225 ListLongMap!20045) Unit!42907)

(assert (=> b!1297599 (= lt!580732 (lemmaInListMapAfterAddingDiffThenInBefore!69 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!580725))))

(declare-fun lt!580735 () Bool)

(declare-fun call!63383 () Bool)

(assert (=> b!1297599 (= lt!580735 call!63383)))

(declare-fun res!862086 () Bool)

(assert (=> start!109686 (=> (not res!862086) (not e!740406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109686 (= res!862086 (validMask!0 mask!2175))))

(assert (=> start!109686 e!740406))

(declare-fun tp_is_empty!34591 () Bool)

(assert (=> start!109686 tp_is_empty!34591))

(assert (=> start!109686 true))

(declare-fun array_inv!31739 (array!86237) Bool)

(assert (=> start!109686 (and (array_inv!31739 _values!1445) e!740408)))

(declare-fun array_inv!31740 (array!86235) Bool)

(assert (=> start!109686 (array_inv!31740 _keys!1741)))

(assert (=> start!109686 tp!101972))

(declare-fun bm!63385 () Bool)

(assert (=> bm!63385 (= call!63383 (contains!8169 (ite c!124767 lt!580725 (ite c!124768 lt!580736 lt!580728)) k0!1205))))

(declare-fun bm!63386 () Bool)

(assert (=> bm!63386 (= call!63386 (+!4481 (ite c!124767 lt!580725 (ite c!124768 lt!580736 lt!580728)) (ite c!124767 (tuple2!22381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!124768 (tuple2!22381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun bm!63387 () Bool)

(assert (=> bm!63387 (= call!63393 (lemmaInListMapAfterAddingDiffThenInBefore!69 k0!1205 (ite c!124767 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124768 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124767 minValue!1387 (ite c!124768 zeroValue!1387 minValue!1387)) (ite c!124767 lt!580737 (ite c!124768 lt!580736 lt!580728))))))

(declare-fun b!1297606 () Bool)

(declare-fun e!740407 () Bool)

(assert (=> b!1297606 (= e!740407 tp_is_empty!34591)))

(declare-fun b!1297607 () Bool)

(declare-fun res!862090 () Bool)

(assert (=> b!1297607 (=> (not res!862090) (not e!740406))))

(assert (=> b!1297607 (= res!862090 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42165 _keys!1741))))))

(declare-fun b!1297608 () Bool)

(declare-fun call!63392 () Bool)

(assert (=> b!1297608 call!63392))

(declare-fun lt!580731 () Unit!42907)

(declare-fun call!63388 () Unit!42907)

(assert (=> b!1297608 (= lt!580731 call!63388)))

(assert (=> b!1297608 (not call!63385)))

(declare-fun lt!580726 () Unit!42907)

(assert (=> b!1297608 (= lt!580726 call!63387)))

(declare-fun call!63394 () ListLongMap!20045)

(assert (=> b!1297608 (= lt!580736 call!63394)))

(assert (=> b!1297608 (= e!740405 lt!580731)))

(declare-fun b!1297609 () Bool)

(declare-fun Unit!42909 () Unit!42907)

(assert (=> b!1297609 (= e!740402 Unit!42909)))

(declare-fun b!1297610 () Bool)

(declare-fun res!862091 () Bool)

(assert (=> b!1297610 (=> (not res!862091) (not e!740406))))

(assert (=> b!1297610 (= res!862091 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42165 _keys!1741))))))

(declare-fun bm!63388 () Bool)

(assert (=> bm!63388 (= call!63388 call!63393)))

(declare-fun b!1297611 () Bool)

(declare-fun lt!580729 () Unit!42907)

(assert (=> b!1297611 (= e!740402 lt!580729)))

(assert (=> b!1297611 (= lt!580728 call!63394)))

(declare-fun lt!580738 () Unit!42907)

(assert (=> b!1297611 (= lt!580738 call!63387)))

(assert (=> b!1297611 (not call!63385)))

(assert (=> b!1297611 (= lt!580729 call!63388)))

(assert (=> b!1297611 call!63392))

(declare-fun bm!63389 () Bool)

(assert (=> bm!63389 (= call!63394 call!63391)))

(declare-fun b!1297612 () Bool)

(assert (=> b!1297612 (= e!740409 tp_is_empty!34591)))

(declare-fun b!1297613 () Bool)

(declare-fun res!862088 () Bool)

(assert (=> b!1297613 (=> (not res!862088) (not e!740406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86235 (_ BitVec 32)) Bool)

(assert (=> b!1297613 (= res!862088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53447 () Bool)

(declare-fun tp!101971 () Bool)

(assert (=> mapNonEmpty!53447 (= mapRes!53447 (and tp!101971 e!740407))))

(declare-fun mapRest!53447 () (Array (_ BitVec 32) ValueCell!16397))

(declare-fun mapKey!53447 () (_ BitVec 32))

(declare-fun mapValue!53447 () ValueCell!16397)

(assert (=> mapNonEmpty!53447 (= (arr!41615 _values!1445) (store mapRest!53447 mapKey!53447 mapValue!53447))))

(declare-fun mapIsEmpty!53447 () Bool)

(assert (=> mapIsEmpty!53447 mapRes!53447))

(declare-fun b!1297614 () Bool)

(assert (=> b!1297614 (= e!740406 (not true))))

(declare-fun lt!580733 () Unit!42907)

(assert (=> b!1297614 (= lt!580733 e!740403)))

(assert (=> b!1297614 (= c!124767 (and (not lt!580740) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1297614 (= lt!580740 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1297614 (not (contains!8169 (ListLongMap!20046 Nil!29543) k0!1205))))

(declare-fun lt!580730 () Unit!42907)

(declare-fun emptyContainsNothing!192 ((_ BitVec 64)) Unit!42907)

(assert (=> b!1297614 (= lt!580730 (emptyContainsNothing!192 k0!1205))))

(declare-fun bm!63390 () Bool)

(assert (=> bm!63390 (= call!63390 call!63386)))

(declare-fun b!1297615 () Bool)

(declare-fun res!862087 () Bool)

(assert (=> b!1297615 (=> (not res!862087) (not e!740406))))

(assert (=> b!1297615 (= res!862087 (and (= (size!42166 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42165 _keys!1741) (size!42166 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!63391 () Bool)

(assert (=> bm!63391 (= call!63392 call!63383)))

(assert (= (and start!109686 res!862086) b!1297615))

(assert (= (and b!1297615 res!862087) b!1297613))

(assert (= (and b!1297613 res!862088) b!1297600))

(assert (= (and b!1297600 res!862089) b!1297610))

(assert (= (and b!1297610 res!862091) b!1297601))

(assert (= (and b!1297601 res!862093) b!1297607))

(assert (= (and b!1297607 res!862090) b!1297603))

(assert (= (and b!1297603 res!862092) b!1297614))

(assert (= (and b!1297614 c!124767) b!1297599))

(assert (= (and b!1297614 (not c!124767)) b!1297602))

(assert (= (and b!1297602 c!124768) b!1297608))

(assert (= (and b!1297602 (not c!124768)) b!1297605))

(assert (= (and b!1297605 c!124769) b!1297611))

(assert (= (and b!1297605 (not c!124769)) b!1297609))

(assert (= (or b!1297608 b!1297611) bm!63390))

(assert (= (or b!1297608 b!1297611) bm!63383))

(assert (= (or b!1297608 b!1297611) bm!63388))

(assert (= (or b!1297608 b!1297611) bm!63391))

(assert (= (or b!1297608 b!1297611) bm!63389))

(assert (= (or b!1297608 b!1297611) bm!63381))

(assert (= (or b!1297599 bm!63383) bm!63380))

(assert (= (or b!1297599 bm!63389) bm!63384))

(assert (= (or b!1297599 bm!63388) bm!63387))

(assert (= (or b!1297599 bm!63390) bm!63386))

(assert (= (or b!1297599 bm!63391) bm!63385))

(assert (= (or b!1297599 bm!63381) bm!63382))

(assert (= (and b!1297604 condMapEmpty!53447) mapIsEmpty!53447))

(assert (= (and b!1297604 (not condMapEmpty!53447)) mapNonEmpty!53447))

(get-info :version)

(assert (= (and mapNonEmpty!53447 ((_ is ValueCellFull!16397) mapValue!53447)) b!1297606))

(assert (= (and b!1297604 ((_ is ValueCellFull!16397) mapDefault!53447)) b!1297612))

(assert (= start!109686 b!1297604))

(declare-fun m!1189821 () Bool)

(assert (=> bm!63380 m!1189821))

(declare-fun m!1189823 () Bool)

(assert (=> b!1297599 m!1189823))

(declare-fun m!1189825 () Bool)

(assert (=> b!1297599 m!1189825))

(declare-fun m!1189827 () Bool)

(assert (=> b!1297599 m!1189827))

(declare-fun m!1189829 () Bool)

(assert (=> b!1297599 m!1189829))

(declare-fun m!1189831 () Bool)

(assert (=> bm!63384 m!1189831))

(declare-fun m!1189833 () Bool)

(assert (=> bm!63385 m!1189833))

(declare-fun m!1189835 () Bool)

(assert (=> b!1297603 m!1189835))

(assert (=> b!1297603 m!1189835))

(declare-fun m!1189837 () Bool)

(assert (=> b!1297603 m!1189837))

(declare-fun m!1189839 () Bool)

(assert (=> bm!63382 m!1189839))

(declare-fun m!1189841 () Bool)

(assert (=> start!109686 m!1189841))

(declare-fun m!1189843 () Bool)

(assert (=> start!109686 m!1189843))

(declare-fun m!1189845 () Bool)

(assert (=> start!109686 m!1189845))

(declare-fun m!1189847 () Bool)

(assert (=> b!1297600 m!1189847))

(declare-fun m!1189849 () Bool)

(assert (=> b!1297613 m!1189849))

(declare-fun m!1189851 () Bool)

(assert (=> b!1297601 m!1189851))

(assert (=> b!1297601 m!1189851))

(declare-fun m!1189853 () Bool)

(assert (=> b!1297601 m!1189853))

(declare-fun m!1189855 () Bool)

(assert (=> bm!63387 m!1189855))

(declare-fun m!1189857 () Bool)

(assert (=> b!1297614 m!1189857))

(declare-fun m!1189859 () Bool)

(assert (=> b!1297614 m!1189859))

(declare-fun m!1189861 () Bool)

(assert (=> mapNonEmpty!53447 m!1189861))

(declare-fun m!1189863 () Bool)

(assert (=> bm!63386 m!1189863))

(check-sat tp_is_empty!34591 (not start!109686) (not bm!63384) (not b_next!28951) (not bm!63380) (not b!1297599) (not b!1297603) (not mapNonEmpty!53447) (not b!1297600) (not bm!63385) b_and!47043 (not b!1297614) (not bm!63382) (not b!1297601) (not b!1297613) (not bm!63386) (not bm!63387))
(check-sat b_and!47043 (not b_next!28951))
