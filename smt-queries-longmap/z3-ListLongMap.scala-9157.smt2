; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109822 () Bool)

(assert start!109822)

(declare-fun b_free!29215 () Bool)

(declare-fun b_next!29215 () Bool)

(assert (=> start!109822 (= b_free!29215 (not b_next!29215))))

(declare-fun tp!102780 () Bool)

(declare-fun b_and!47311 () Bool)

(assert (=> start!109822 (= tp!102780 b_and!47311)))

(declare-fun b!1301152 () Bool)

(declare-fun res!864534 () Bool)

(declare-fun e!742157 () Bool)

(assert (=> b!1301152 (=> (not res!864534) (not e!742157))))

(declare-datatypes ((V!51577 0))(
  ( (V!51578 (val!17502 Int)) )
))
(declare-fun minValue!1387 () V!51577)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16529 0))(
  ( (ValueCellFull!16529 (v!20109 V!51577)) (EmptyCell!16529) )
))
(declare-datatypes ((array!86621 0))(
  ( (array!86622 (arr!41807 (Array (_ BitVec 32) ValueCell!16529)) (size!42359 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86621)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86623 0))(
  ( (array!86624 (arr!41808 (Array (_ BitVec 32) (_ BitVec 64))) (size!42360 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86623)

(declare-fun zeroValue!1387 () V!51577)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22632 0))(
  ( (tuple2!22633 (_1!11327 (_ BitVec 64)) (_2!11327 V!51577)) )
))
(declare-datatypes ((List!29750 0))(
  ( (Nil!29747) (Cons!29746 (h!30955 tuple2!22632) (t!43318 List!29750)) )
))
(declare-datatypes ((ListLongMap!20289 0))(
  ( (ListLongMap!20290 (toList!10160 List!29750)) )
))
(declare-fun contains!8216 (ListLongMap!20289 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5070 (array!86623 array!86621 (_ BitVec 32) (_ BitVec 32) V!51577 V!51577 (_ BitVec 32) Int) ListLongMap!20289)

(assert (=> b!1301152 (= res!864534 (contains!8216 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301153 () Bool)

(declare-fun call!63873 () Bool)

(assert (=> b!1301153 call!63873))

(declare-datatypes ((Unit!42908 0))(
  ( (Unit!42909) )
))
(declare-fun lt!581649 () Unit!42908)

(declare-fun call!63875 () Unit!42908)

(assert (=> b!1301153 (= lt!581649 call!63875)))

(declare-fun lt!581651 () ListLongMap!20289)

(declare-fun call!63874 () ListLongMap!20289)

(assert (=> b!1301153 (= lt!581651 call!63874)))

(declare-fun e!742155 () Unit!42908)

(assert (=> b!1301153 (= e!742155 lt!581649)))

(declare-fun b!1301154 () Bool)

(declare-fun e!742153 () Bool)

(assert (=> b!1301154 (= e!742157 (not e!742153))))

(declare-fun res!864533 () Bool)

(assert (=> b!1301154 (=> res!864533 e!742153)))

(assert (=> b!1301154 (= res!864533 (= k0!1205 (select (arr!41808 _keys!1741) from!2144)))))

(assert (=> b!1301154 (not (contains!8216 (ListLongMap!20290 Nil!29747) k0!1205))))

(declare-fun lt!581648 () Unit!42908)

(declare-fun emptyContainsNothing!198 ((_ BitVec 64)) Unit!42908)

(assert (=> b!1301154 (= lt!581648 (emptyContainsNothing!198 k0!1205))))

(declare-fun lt!581657 () Unit!42908)

(declare-fun e!742158 () Unit!42908)

(assert (=> b!1301154 (= lt!581657 e!742158)))

(declare-fun c!124699 () Bool)

(declare-fun lt!581658 () Bool)

(assert (=> b!1301154 (= c!124699 (and (not lt!581658) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301154 (= lt!581658 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301155 () Bool)

(declare-fun res!864537 () Bool)

(assert (=> b!1301155 (=> (not res!864537) (not e!742157))))

(assert (=> b!1301155 (= res!864537 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42360 _keys!1741))))))

(declare-fun b!1301156 () Bool)

(declare-fun lt!581647 () Unit!42908)

(assert (=> b!1301156 (= e!742158 lt!581647)))

(declare-fun lt!581656 () ListLongMap!20289)

(declare-fun call!63871 () ListLongMap!20289)

(assert (=> b!1301156 (= lt!581656 call!63871)))

(declare-fun lt!581650 () ListLongMap!20289)

(declare-fun +!4498 (ListLongMap!20289 tuple2!22632) ListLongMap!20289)

(assert (=> b!1301156 (= lt!581650 (+!4498 lt!581656 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581659 () Unit!42908)

(declare-fun call!63872 () Unit!42908)

(assert (=> b!1301156 (= lt!581659 call!63872)))

(declare-fun call!63870 () Bool)

(assert (=> b!1301156 call!63870))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!83 ((_ BitVec 64) (_ BitVec 64) V!51577 ListLongMap!20289) Unit!42908)

(assert (=> b!1301156 (= lt!581647 (lemmaInListMapAfterAddingDiffThenInBefore!83 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581656))))

(assert (=> b!1301156 (contains!8216 lt!581656 k0!1205)))

(declare-fun b!1301157 () Bool)

(declare-fun e!742151 () Bool)

(declare-fun e!742150 () Bool)

(declare-fun mapRes!53858 () Bool)

(assert (=> b!1301157 (= e!742151 (and e!742150 mapRes!53858))))

(declare-fun condMapEmpty!53858 () Bool)

(declare-fun mapDefault!53858 () ValueCell!16529)

(assert (=> b!1301157 (= condMapEmpty!53858 (= (arr!41807 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16529)) mapDefault!53858)))))

(declare-fun b!1301158 () Bool)

(declare-fun res!864536 () Bool)

(assert (=> b!1301158 (=> (not res!864536) (not e!742157))))

(declare-datatypes ((List!29751 0))(
  ( (Nil!29748) (Cons!29747 (h!30956 (_ BitVec 64)) (t!43319 List!29751)) )
))
(declare-fun arrayNoDuplicates!0 (array!86623 (_ BitVec 32) List!29751) Bool)

(assert (=> b!1301158 (= res!864536 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29748))))

(declare-fun b!1301159 () Bool)

(declare-fun e!742156 () Unit!42908)

(declare-fun lt!581655 () Unit!42908)

(assert (=> b!1301159 (= e!742156 lt!581655)))

(declare-fun lt!581652 () ListLongMap!20289)

(assert (=> b!1301159 (= lt!581652 call!63874)))

(assert (=> b!1301159 (= lt!581655 call!63875)))

(assert (=> b!1301159 call!63873))

(declare-fun bm!63867 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6131 (array!86623 array!86621 (_ BitVec 32) (_ BitVec 32) V!51577 V!51577 (_ BitVec 32) Int) ListLongMap!20289)

(assert (=> bm!63867 (= call!63871 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301160 () Bool)

(declare-fun res!864535 () Bool)

(assert (=> b!1301160 (=> (not res!864535) (not e!742157))))

(assert (=> b!1301160 (= res!864535 (and (= (size!42359 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42360 _keys!1741) (size!42359 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun c!124697 () Bool)

(declare-fun bm!63868 () Bool)

(assert (=> bm!63868 (= call!63870 (contains!8216 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) k0!1205))))

(declare-fun b!1301161 () Bool)

(declare-fun e!742152 () Bool)

(declare-fun tp_is_empty!34855 () Bool)

(assert (=> b!1301161 (= e!742152 tp_is_empty!34855)))

(declare-fun b!1301162 () Bool)

(declare-fun res!864539 () Bool)

(assert (=> b!1301162 (=> (not res!864539) (not e!742157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86623 (_ BitVec 32)) Bool)

(assert (=> b!1301162 (= res!864539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301163 () Bool)

(declare-fun res!864531 () Bool)

(assert (=> b!1301163 (=> (not res!864531) (not e!742157))))

(assert (=> b!1301163 (= res!864531 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42360 _keys!1741))))))

(declare-fun res!864532 () Bool)

(assert (=> start!109822 (=> (not res!864532) (not e!742157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109822 (= res!864532 (validMask!0 mask!2175))))

(assert (=> start!109822 e!742157))

(assert (=> start!109822 tp_is_empty!34855))

(assert (=> start!109822 true))

(declare-fun array_inv!31803 (array!86621) Bool)

(assert (=> start!109822 (and (array_inv!31803 _values!1445) e!742151)))

(declare-fun array_inv!31804 (array!86623) Bool)

(assert (=> start!109822 (array_inv!31804 _keys!1741)))

(assert (=> start!109822 tp!102780))

(declare-fun mapIsEmpty!53858 () Bool)

(assert (=> mapIsEmpty!53858 mapRes!53858))

(declare-fun b!1301164 () Bool)

(declare-fun c!124698 () Bool)

(assert (=> b!1301164 (= c!124698 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581658))))

(assert (=> b!1301164 (= e!742155 e!742156)))

(declare-fun b!1301165 () Bool)

(assert (=> b!1301165 (= e!742158 e!742155)))

(assert (=> b!1301165 (= c!124697 (and (not lt!581658) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63869 () Bool)

(assert (=> bm!63869 (= call!63874 call!63871)))

(declare-fun bm!63870 () Bool)

(assert (=> bm!63870 (= call!63873 call!63870)))

(declare-fun bm!63871 () Bool)

(assert (=> bm!63871 (= call!63872 (lemmaInListMapAfterAddingDiffThenInBefore!83 k0!1205 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)) (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))))))

(declare-fun b!1301166 () Bool)

(declare-fun Unit!42910 () Unit!42908)

(assert (=> b!1301166 (= e!742156 Unit!42910)))

(declare-fun b!1301167 () Bool)

(assert (=> b!1301167 (= e!742153 false)))

(declare-fun lt!581653 () V!51577)

(assert (=> b!1301167 (not (contains!8216 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) k0!1205))))

(declare-fun lt!581654 () Unit!42908)

(declare-fun addStillNotContains!453 (ListLongMap!20289 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!42908)

(assert (=> b!1301167 (= lt!581654 (addStillNotContains!453 (ListLongMap!20290 Nil!29747) (select (arr!41808 _keys!1741) from!2144) lt!581653 k0!1205))))

(declare-fun get!21134 (ValueCell!16529 V!51577) V!51577)

(declare-fun dynLambda!3445 (Int (_ BitVec 64)) V!51577)

(assert (=> b!1301167 (= lt!581653 (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!63872 () Bool)

(assert (=> bm!63872 (= call!63875 call!63872)))

(declare-fun mapNonEmpty!53858 () Bool)

(declare-fun tp!102779 () Bool)

(assert (=> mapNonEmpty!53858 (= mapRes!53858 (and tp!102779 e!742152))))

(declare-fun mapRest!53858 () (Array (_ BitVec 32) ValueCell!16529))

(declare-fun mapKey!53858 () (_ BitVec 32))

(declare-fun mapValue!53858 () ValueCell!16529)

(assert (=> mapNonEmpty!53858 (= (arr!41807 _values!1445) (store mapRest!53858 mapKey!53858 mapValue!53858))))

(declare-fun b!1301168 () Bool)

(assert (=> b!1301168 (= e!742150 tp_is_empty!34855)))

(declare-fun b!1301169 () Bool)

(declare-fun res!864538 () Bool)

(assert (=> b!1301169 (=> (not res!864538) (not e!742157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301169 (= res!864538 (validKeyInArray!0 (select (arr!41808 _keys!1741) from!2144)))))

(assert (= (and start!109822 res!864532) b!1301160))

(assert (= (and b!1301160 res!864535) b!1301162))

(assert (= (and b!1301162 res!864539) b!1301158))

(assert (= (and b!1301158 res!864536) b!1301163))

(assert (= (and b!1301163 res!864531) b!1301152))

(assert (= (and b!1301152 res!864534) b!1301155))

(assert (= (and b!1301155 res!864537) b!1301169))

(assert (= (and b!1301169 res!864538) b!1301154))

(assert (= (and b!1301154 c!124699) b!1301156))

(assert (= (and b!1301154 (not c!124699)) b!1301165))

(assert (= (and b!1301165 c!124697) b!1301153))

(assert (= (and b!1301165 (not c!124697)) b!1301164))

(assert (= (and b!1301164 c!124698) b!1301159))

(assert (= (and b!1301164 (not c!124698)) b!1301166))

(assert (= (or b!1301153 b!1301159) bm!63869))

(assert (= (or b!1301153 b!1301159) bm!63872))

(assert (= (or b!1301153 b!1301159) bm!63870))

(assert (= (or b!1301156 bm!63869) bm!63867))

(assert (= (or b!1301156 bm!63872) bm!63871))

(assert (= (or b!1301156 bm!63870) bm!63868))

(assert (= (and b!1301154 (not res!864533)) b!1301167))

(assert (= (and b!1301157 condMapEmpty!53858) mapIsEmpty!53858))

(assert (= (and b!1301157 (not condMapEmpty!53858)) mapNonEmpty!53858))

(get-info :version)

(assert (= (and mapNonEmpty!53858 ((_ is ValueCellFull!16529) mapValue!53858)) b!1301161))

(assert (= (and b!1301157 ((_ is ValueCellFull!16529) mapDefault!53858)) b!1301168))

(assert (= start!109822 b!1301157))

(declare-fun b_lambda!23175 () Bool)

(assert (=> (not b_lambda!23175) (not b!1301167)))

(declare-fun t!43317 () Bool)

(declare-fun tb!11371 () Bool)

(assert (=> (and start!109822 (= defaultEntry!1448 defaultEntry!1448) t!43317) tb!11371))

(declare-fun result!23761 () Bool)

(assert (=> tb!11371 (= result!23761 tp_is_empty!34855)))

(assert (=> b!1301167 t!43317))

(declare-fun b_and!47313 () Bool)

(assert (= b_and!47311 (and (=> t!43317 result!23761) b_and!47313)))

(declare-fun m!1191413 () Bool)

(assert (=> mapNonEmpty!53858 m!1191413))

(declare-fun m!1191415 () Bool)

(assert (=> b!1301156 m!1191415))

(declare-fun m!1191417 () Bool)

(assert (=> b!1301156 m!1191417))

(declare-fun m!1191419 () Bool)

(assert (=> b!1301156 m!1191419))

(declare-fun m!1191421 () Bool)

(assert (=> bm!63868 m!1191421))

(declare-fun m!1191423 () Bool)

(assert (=> b!1301154 m!1191423))

(declare-fun m!1191425 () Bool)

(assert (=> b!1301154 m!1191425))

(declare-fun m!1191427 () Bool)

(assert (=> b!1301154 m!1191427))

(declare-fun m!1191429 () Bool)

(assert (=> bm!63867 m!1191429))

(declare-fun m!1191431 () Bool)

(assert (=> b!1301158 m!1191431))

(declare-fun m!1191433 () Bool)

(assert (=> b!1301152 m!1191433))

(assert (=> b!1301152 m!1191433))

(declare-fun m!1191435 () Bool)

(assert (=> b!1301152 m!1191435))

(declare-fun m!1191437 () Bool)

(assert (=> bm!63871 m!1191437))

(declare-fun m!1191439 () Bool)

(assert (=> start!109822 m!1191439))

(declare-fun m!1191441 () Bool)

(assert (=> start!109822 m!1191441))

(declare-fun m!1191443 () Bool)

(assert (=> start!109822 m!1191443))

(declare-fun m!1191445 () Bool)

(assert (=> b!1301167 m!1191445))

(declare-fun m!1191447 () Bool)

(assert (=> b!1301167 m!1191447))

(declare-fun m!1191449 () Bool)

(assert (=> b!1301167 m!1191449))

(declare-fun m!1191451 () Bool)

(assert (=> b!1301167 m!1191451))

(assert (=> b!1301167 m!1191449))

(assert (=> b!1301167 m!1191423))

(declare-fun m!1191453 () Bool)

(assert (=> b!1301167 m!1191453))

(assert (=> b!1301167 m!1191447))

(assert (=> b!1301167 m!1191445))

(declare-fun m!1191455 () Bool)

(assert (=> b!1301167 m!1191455))

(assert (=> b!1301167 m!1191423))

(assert (=> b!1301169 m!1191423))

(assert (=> b!1301169 m!1191423))

(declare-fun m!1191457 () Bool)

(assert (=> b!1301169 m!1191457))

(declare-fun m!1191459 () Bool)

(assert (=> b!1301162 m!1191459))

(check-sat tp_is_empty!34855 (not mapNonEmpty!53858) (not b!1301167) (not bm!63867) (not b!1301156) b_and!47313 (not start!109822) (not b_next!29215) (not b!1301154) (not b_lambda!23175) (not b!1301152) (not bm!63871) (not bm!63868) (not b!1301162) (not b!1301169) (not b!1301158))
(check-sat b_and!47313 (not b_next!29215))
(get-model)

(declare-fun b_lambda!23181 () Bool)

(assert (= b_lambda!23175 (or (and start!109822 b_free!29215) b_lambda!23181)))

(check-sat tp_is_empty!34855 (not b!1301167) (not bm!63867) (not b!1301156) b_and!47313 (not b!1301154) (not start!109822) (not b_next!29215) (not b_lambda!23181) (not mapNonEmpty!53858) (not b!1301152) (not bm!63871) (not bm!63868) (not b!1301162) (not b!1301169) (not b!1301158))
(check-sat b_and!47313 (not b_next!29215))
(get-model)

(declare-fun d!141079 () Bool)

(declare-fun e!742218 () Bool)

(assert (=> d!141079 e!742218))

(declare-fun res!864596 () Bool)

(assert (=> d!141079 (=> res!864596 e!742218)))

(declare-fun lt!581746 () Bool)

(assert (=> d!141079 (= res!864596 (not lt!581746))))

(declare-fun lt!581747 () Bool)

(assert (=> d!141079 (= lt!581746 lt!581747)))

(declare-fun lt!581749 () Unit!42908)

(declare-fun e!742217 () Unit!42908)

(assert (=> d!141079 (= lt!581749 e!742217)))

(declare-fun c!124720 () Bool)

(assert (=> d!141079 (= c!124720 lt!581747)))

(declare-fun containsKey!720 (List!29750 (_ BitVec 64)) Bool)

(assert (=> d!141079 (= lt!581747 (containsKey!720 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141079 (= (contains!8216 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581746)))

(declare-fun b!1301290 () Bool)

(declare-fun lt!581748 () Unit!42908)

(assert (=> b!1301290 (= e!742217 lt!581748)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!467 (List!29750 (_ BitVec 64)) Unit!42908)

(assert (=> b!1301290 (= lt!581748 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!754 0))(
  ( (Some!753 (v!20112 V!51577)) (None!752) )
))
(declare-fun isDefined!510 (Option!754) Bool)

(declare-fun getValueByKey!703 (List!29750 (_ BitVec 64)) Option!754)

(assert (=> b!1301290 (isDefined!510 (getValueByKey!703 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1301291 () Bool)

(declare-fun Unit!42915 () Unit!42908)

(assert (=> b!1301291 (= e!742217 Unit!42915)))

(declare-fun b!1301292 () Bool)

(assert (=> b!1301292 (= e!742218 (isDefined!510 (getValueByKey!703 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141079 c!124720) b!1301290))

(assert (= (and d!141079 (not c!124720)) b!1301291))

(assert (= (and d!141079 (not res!864596)) b!1301292))

(declare-fun m!1191557 () Bool)

(assert (=> d!141079 m!1191557))

(declare-fun m!1191559 () Bool)

(assert (=> b!1301290 m!1191559))

(declare-fun m!1191561 () Bool)

(assert (=> b!1301290 m!1191561))

(assert (=> b!1301290 m!1191561))

(declare-fun m!1191563 () Bool)

(assert (=> b!1301290 m!1191563))

(assert (=> b!1301292 m!1191561))

(assert (=> b!1301292 m!1191561))

(assert (=> b!1301292 m!1191563))

(assert (=> b!1301152 d!141079))

(declare-fun b!1301335 () Bool)

(declare-fun e!742250 () Bool)

(declare-fun e!742246 () Bool)

(assert (=> b!1301335 (= e!742250 e!742246)))

(declare-fun res!864615 () Bool)

(declare-fun call!63931 () Bool)

(assert (=> b!1301335 (= res!864615 call!63931)))

(assert (=> b!1301335 (=> (not res!864615) (not e!742246))))

(declare-fun b!1301336 () Bool)

(assert (=> b!1301336 (= e!742250 (not call!63931))))

(declare-fun d!141081 () Bool)

(declare-fun e!742255 () Bool)

(assert (=> d!141081 e!742255))

(declare-fun res!864623 () Bool)

(assert (=> d!141081 (=> (not res!864623) (not e!742255))))

(assert (=> d!141081 (= res!864623 (or (bvsge from!2144 (size!42360 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42360 _keys!1741)))))))

(declare-fun lt!581812 () ListLongMap!20289)

(declare-fun lt!581813 () ListLongMap!20289)

(assert (=> d!141081 (= lt!581812 lt!581813)))

(declare-fun lt!581810 () Unit!42908)

(declare-fun e!742248 () Unit!42908)

(assert (=> d!141081 (= lt!581810 e!742248)))

(declare-fun c!124738 () Bool)

(declare-fun e!742251 () Bool)

(assert (=> d!141081 (= c!124738 e!742251)))

(declare-fun res!864617 () Bool)

(assert (=> d!141081 (=> (not res!864617) (not e!742251))))

(assert (=> d!141081 (= res!864617 (bvslt from!2144 (size!42360 _keys!1741)))))

(declare-fun e!742249 () ListLongMap!20289)

(assert (=> d!141081 (= lt!581813 e!742249)))

(declare-fun c!124734 () Bool)

(assert (=> d!141081 (= c!124734 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141081 (validMask!0 mask!2175)))

(assert (=> d!141081 (= (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581812)))

(declare-fun bm!63923 () Bool)

(declare-fun call!63930 () ListLongMap!20289)

(declare-fun call!63926 () ListLongMap!20289)

(assert (=> bm!63923 (= call!63930 call!63926)))

(declare-fun bm!63924 () Bool)

(declare-fun call!63927 () ListLongMap!20289)

(declare-fun call!63929 () ListLongMap!20289)

(assert (=> bm!63924 (= call!63927 call!63929)))

(declare-fun b!1301337 () Bool)

(declare-fun e!742257 () Bool)

(declare-fun apply!1010 (ListLongMap!20289 (_ BitVec 64)) V!51577)

(assert (=> b!1301337 (= e!742257 (= (apply!1010 lt!581812 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!63925 () Bool)

(assert (=> bm!63925 (= call!63931 (contains!8216 lt!581812 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301338 () Bool)

(declare-fun lt!581800 () Unit!42908)

(assert (=> b!1301338 (= e!742248 lt!581800)))

(declare-fun lt!581795 () ListLongMap!20289)

(assert (=> b!1301338 (= lt!581795 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581803 () (_ BitVec 64))

(assert (=> b!1301338 (= lt!581803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581811 () (_ BitVec 64))

(assert (=> b!1301338 (= lt!581811 (select (arr!41808 _keys!1741) from!2144))))

(declare-fun lt!581802 () Unit!42908)

(declare-fun addStillContains!1105 (ListLongMap!20289 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!42908)

(assert (=> b!1301338 (= lt!581802 (addStillContains!1105 lt!581795 lt!581803 zeroValue!1387 lt!581811))))

(assert (=> b!1301338 (contains!8216 (+!4498 lt!581795 (tuple2!22633 lt!581803 zeroValue!1387)) lt!581811)))

(declare-fun lt!581799 () Unit!42908)

(assert (=> b!1301338 (= lt!581799 lt!581802)))

(declare-fun lt!581806 () ListLongMap!20289)

(assert (=> b!1301338 (= lt!581806 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581804 () (_ BitVec 64))

(assert (=> b!1301338 (= lt!581804 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581808 () (_ BitVec 64))

(assert (=> b!1301338 (= lt!581808 (select (arr!41808 _keys!1741) from!2144))))

(declare-fun lt!581797 () Unit!42908)

(declare-fun addApplyDifferent!548 (ListLongMap!20289 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!42908)

(assert (=> b!1301338 (= lt!581797 (addApplyDifferent!548 lt!581806 lt!581804 minValue!1387 lt!581808))))

(assert (=> b!1301338 (= (apply!1010 (+!4498 lt!581806 (tuple2!22633 lt!581804 minValue!1387)) lt!581808) (apply!1010 lt!581806 lt!581808))))

(declare-fun lt!581794 () Unit!42908)

(assert (=> b!1301338 (= lt!581794 lt!581797)))

(declare-fun lt!581815 () ListLongMap!20289)

(assert (=> b!1301338 (= lt!581815 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581798 () (_ BitVec 64))

(assert (=> b!1301338 (= lt!581798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581801 () (_ BitVec 64))

(assert (=> b!1301338 (= lt!581801 (select (arr!41808 _keys!1741) from!2144))))

(declare-fun lt!581809 () Unit!42908)

(assert (=> b!1301338 (= lt!581809 (addApplyDifferent!548 lt!581815 lt!581798 zeroValue!1387 lt!581801))))

(assert (=> b!1301338 (= (apply!1010 (+!4498 lt!581815 (tuple2!22633 lt!581798 zeroValue!1387)) lt!581801) (apply!1010 lt!581815 lt!581801))))

(declare-fun lt!581796 () Unit!42908)

(assert (=> b!1301338 (= lt!581796 lt!581809)))

(declare-fun lt!581807 () ListLongMap!20289)

(assert (=> b!1301338 (= lt!581807 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581805 () (_ BitVec 64))

(assert (=> b!1301338 (= lt!581805 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581814 () (_ BitVec 64))

(assert (=> b!1301338 (= lt!581814 (select (arr!41808 _keys!1741) from!2144))))

(assert (=> b!1301338 (= lt!581800 (addApplyDifferent!548 lt!581807 lt!581805 minValue!1387 lt!581814))))

(assert (=> b!1301338 (= (apply!1010 (+!4498 lt!581807 (tuple2!22633 lt!581805 minValue!1387)) lt!581814) (apply!1010 lt!581807 lt!581814))))

(declare-fun b!1301339 () Bool)

(declare-fun e!742245 () ListLongMap!20289)

(assert (=> b!1301339 (= e!742249 e!742245)))

(declare-fun c!124733 () Bool)

(assert (=> b!1301339 (= c!124733 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!742252 () Bool)

(declare-fun b!1301340 () Bool)

(assert (=> b!1301340 (= e!742252 (= (apply!1010 lt!581812 (select (arr!41808 _keys!1741) from!2144)) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301340 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42359 _values!1445)))))

(assert (=> b!1301340 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42360 _keys!1741)))))

(declare-fun bm!63926 () Bool)

(declare-fun call!63928 () ListLongMap!20289)

(assert (=> bm!63926 (= call!63926 call!63928)))

(declare-fun b!1301341 () Bool)

(declare-fun Unit!42916 () Unit!42908)

(assert (=> b!1301341 (= e!742248 Unit!42916)))

(declare-fun b!1301342 () Bool)

(declare-fun e!742247 () Bool)

(assert (=> b!1301342 (= e!742247 (validKeyInArray!0 (select (arr!41808 _keys!1741) from!2144)))))

(declare-fun bm!63927 () Bool)

(assert (=> bm!63927 (= call!63929 (+!4498 (ite c!124734 call!63928 (ite c!124733 call!63926 call!63930)) (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1301343 () Bool)

(assert (=> b!1301343 (= e!742255 e!742250)))

(declare-fun c!124735 () Bool)

(assert (=> b!1301343 (= c!124735 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63928 () Bool)

(declare-fun call!63932 () Bool)

(assert (=> bm!63928 (= call!63932 (contains!8216 lt!581812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301344 () Bool)

(declare-fun e!742253 () Bool)

(assert (=> b!1301344 (= e!742253 e!742252)))

(declare-fun res!864621 () Bool)

(assert (=> b!1301344 (=> (not res!864621) (not e!742252))))

(assert (=> b!1301344 (= res!864621 (contains!8216 lt!581812 (select (arr!41808 _keys!1741) from!2144)))))

(assert (=> b!1301344 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42360 _keys!1741)))))

(declare-fun b!1301345 () Bool)

(declare-fun res!864618 () Bool)

(assert (=> b!1301345 (=> (not res!864618) (not e!742255))))

(declare-fun e!742254 () Bool)

(assert (=> b!1301345 (= res!864618 e!742254)))

(declare-fun c!124736 () Bool)

(assert (=> b!1301345 (= c!124736 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1301346 () Bool)

(assert (=> b!1301346 (= e!742254 (not call!63932))))

(declare-fun b!1301347 () Bool)

(declare-fun e!742256 () ListLongMap!20289)

(assert (=> b!1301347 (= e!742256 call!63930)))

(declare-fun b!1301348 () Bool)

(assert (=> b!1301348 (= e!742245 call!63927)))

(declare-fun b!1301349 () Bool)

(assert (=> b!1301349 (= e!742256 call!63927)))

(declare-fun b!1301350 () Bool)

(assert (=> b!1301350 (= e!742246 (= (apply!1010 lt!581812 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1301351 () Bool)

(declare-fun c!124737 () Bool)

(assert (=> b!1301351 (= c!124737 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1301351 (= e!742245 e!742256)))

(declare-fun b!1301352 () Bool)

(declare-fun res!864622 () Bool)

(assert (=> b!1301352 (=> (not res!864622) (not e!742255))))

(assert (=> b!1301352 (= res!864622 e!742253)))

(declare-fun res!864620 () Bool)

(assert (=> b!1301352 (=> res!864620 e!742253)))

(assert (=> b!1301352 (= res!864620 (not e!742247))))

(declare-fun res!864616 () Bool)

(assert (=> b!1301352 (=> (not res!864616) (not e!742247))))

(assert (=> b!1301352 (= res!864616 (bvslt from!2144 (size!42360 _keys!1741)))))

(declare-fun b!1301353 () Bool)

(assert (=> b!1301353 (= e!742254 e!742257)))

(declare-fun res!864619 () Bool)

(assert (=> b!1301353 (= res!864619 call!63932)))

(assert (=> b!1301353 (=> (not res!864619) (not e!742257))))

(declare-fun b!1301354 () Bool)

(assert (=> b!1301354 (= e!742251 (validKeyInArray!0 (select (arr!41808 _keys!1741) from!2144)))))

(declare-fun bm!63929 () Bool)

(assert (=> bm!63929 (= call!63928 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301355 () Bool)

(assert (=> b!1301355 (= e!742249 (+!4498 call!63929 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141081 c!124734) b!1301355))

(assert (= (and d!141081 (not c!124734)) b!1301339))

(assert (= (and b!1301339 c!124733) b!1301348))

(assert (= (and b!1301339 (not c!124733)) b!1301351))

(assert (= (and b!1301351 c!124737) b!1301349))

(assert (= (and b!1301351 (not c!124737)) b!1301347))

(assert (= (or b!1301349 b!1301347) bm!63923))

(assert (= (or b!1301348 bm!63923) bm!63926))

(assert (= (or b!1301348 b!1301349) bm!63924))

(assert (= (or b!1301355 bm!63926) bm!63929))

(assert (= (or b!1301355 bm!63924) bm!63927))

(assert (= (and d!141081 res!864617) b!1301354))

(assert (= (and d!141081 c!124738) b!1301338))

(assert (= (and d!141081 (not c!124738)) b!1301341))

(assert (= (and d!141081 res!864623) b!1301352))

(assert (= (and b!1301352 res!864616) b!1301342))

(assert (= (and b!1301352 (not res!864620)) b!1301344))

(assert (= (and b!1301344 res!864621) b!1301340))

(assert (= (and b!1301352 res!864622) b!1301345))

(assert (= (and b!1301345 c!124736) b!1301353))

(assert (= (and b!1301345 (not c!124736)) b!1301346))

(assert (= (and b!1301353 res!864619) b!1301337))

(assert (= (or b!1301353 b!1301346) bm!63928))

(assert (= (and b!1301345 res!864618) b!1301343))

(assert (= (and b!1301343 c!124735) b!1301335))

(assert (= (and b!1301343 (not c!124735)) b!1301336))

(assert (= (and b!1301335 res!864615) b!1301350))

(assert (= (or b!1301335 b!1301336) bm!63925))

(declare-fun b_lambda!23183 () Bool)

(assert (=> (not b_lambda!23183) (not b!1301340)))

(assert (=> b!1301340 t!43317))

(declare-fun b_and!47323 () Bool)

(assert (= b_and!47313 (and (=> t!43317 result!23761) b_and!47323)))

(declare-fun m!1191565 () Bool)

(assert (=> bm!63928 m!1191565))

(assert (=> b!1301344 m!1191423))

(assert (=> b!1301344 m!1191423))

(declare-fun m!1191567 () Bool)

(assert (=> b!1301344 m!1191567))

(declare-fun m!1191569 () Bool)

(assert (=> bm!63925 m!1191569))

(declare-fun m!1191571 () Bool)

(assert (=> b!1301338 m!1191571))

(declare-fun m!1191573 () Bool)

(assert (=> b!1301338 m!1191573))

(declare-fun m!1191575 () Bool)

(assert (=> b!1301338 m!1191575))

(declare-fun m!1191577 () Bool)

(assert (=> b!1301338 m!1191577))

(declare-fun m!1191579 () Bool)

(assert (=> b!1301338 m!1191579))

(declare-fun m!1191581 () Bool)

(assert (=> b!1301338 m!1191581))

(assert (=> b!1301338 m!1191423))

(assert (=> b!1301338 m!1191581))

(declare-fun m!1191583 () Bool)

(assert (=> b!1301338 m!1191583))

(declare-fun m!1191585 () Bool)

(assert (=> b!1301338 m!1191585))

(declare-fun m!1191587 () Bool)

(assert (=> b!1301338 m!1191587))

(assert (=> b!1301338 m!1191429))

(declare-fun m!1191589 () Bool)

(assert (=> b!1301338 m!1191589))

(declare-fun m!1191591 () Bool)

(assert (=> b!1301338 m!1191591))

(declare-fun m!1191593 () Bool)

(assert (=> b!1301338 m!1191593))

(declare-fun m!1191595 () Bool)

(assert (=> b!1301338 m!1191595))

(declare-fun m!1191597 () Bool)

(assert (=> b!1301338 m!1191597))

(declare-fun m!1191599 () Bool)

(assert (=> b!1301338 m!1191599))

(assert (=> b!1301338 m!1191593))

(assert (=> b!1301338 m!1191573))

(assert (=> b!1301338 m!1191585))

(assert (=> b!1301340 m!1191445))

(assert (=> b!1301340 m!1191423))

(assert (=> b!1301340 m!1191423))

(declare-fun m!1191601 () Bool)

(assert (=> b!1301340 m!1191601))

(assert (=> b!1301340 m!1191447))

(assert (=> b!1301340 m!1191447))

(assert (=> b!1301340 m!1191445))

(assert (=> b!1301340 m!1191455))

(declare-fun m!1191603 () Bool)

(assert (=> b!1301355 m!1191603))

(declare-fun m!1191605 () Bool)

(assert (=> b!1301337 m!1191605))

(declare-fun m!1191607 () Bool)

(assert (=> bm!63927 m!1191607))

(assert (=> b!1301354 m!1191423))

(assert (=> b!1301354 m!1191423))

(assert (=> b!1301354 m!1191457))

(assert (=> d!141081 m!1191439))

(declare-fun m!1191609 () Bool)

(assert (=> b!1301350 m!1191609))

(assert (=> bm!63929 m!1191429))

(assert (=> b!1301342 m!1191423))

(assert (=> b!1301342 m!1191423))

(assert (=> b!1301342 m!1191457))

(assert (=> b!1301152 d!141081))

(declare-fun d!141083 () Bool)

(declare-fun e!742259 () Bool)

(assert (=> d!141083 e!742259))

(declare-fun res!864624 () Bool)

(assert (=> d!141083 (=> res!864624 e!742259)))

(declare-fun lt!581816 () Bool)

(assert (=> d!141083 (= res!864624 (not lt!581816))))

(declare-fun lt!581817 () Bool)

(assert (=> d!141083 (= lt!581816 lt!581817)))

(declare-fun lt!581819 () Unit!42908)

(declare-fun e!742258 () Unit!42908)

(assert (=> d!141083 (= lt!581819 e!742258)))

(declare-fun c!124739 () Bool)

(assert (=> d!141083 (= c!124739 lt!581817)))

(assert (=> d!141083 (= lt!581817 (containsKey!720 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205))))

(assert (=> d!141083 (= (contains!8216 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) k0!1205) lt!581816)))

(declare-fun b!1301356 () Bool)

(declare-fun lt!581818 () Unit!42908)

(assert (=> b!1301356 (= e!742258 lt!581818)))

(assert (=> b!1301356 (= lt!581818 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205))))

(assert (=> b!1301356 (isDefined!510 (getValueByKey!703 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205))))

(declare-fun b!1301357 () Bool)

(declare-fun Unit!42917 () Unit!42908)

(assert (=> b!1301357 (= e!742258 Unit!42917)))

(declare-fun b!1301358 () Bool)

(assert (=> b!1301358 (= e!742259 (isDefined!510 (getValueByKey!703 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205)))))

(assert (= (and d!141083 c!124739) b!1301356))

(assert (= (and d!141083 (not c!124739)) b!1301357))

(assert (= (and d!141083 (not res!864624)) b!1301358))

(declare-fun m!1191611 () Bool)

(assert (=> d!141083 m!1191611))

(declare-fun m!1191613 () Bool)

(assert (=> b!1301356 m!1191613))

(declare-fun m!1191615 () Bool)

(assert (=> b!1301356 m!1191615))

(assert (=> b!1301356 m!1191615))

(declare-fun m!1191617 () Bool)

(assert (=> b!1301356 m!1191617))

(assert (=> b!1301358 m!1191615))

(assert (=> b!1301358 m!1191615))

(assert (=> b!1301358 m!1191617))

(assert (=> bm!63868 d!141083))

(declare-fun d!141085 () Bool)

(declare-fun e!742261 () Bool)

(assert (=> d!141085 e!742261))

(declare-fun res!864625 () Bool)

(assert (=> d!141085 (=> res!864625 e!742261)))

(declare-fun lt!581820 () Bool)

(assert (=> d!141085 (= res!864625 (not lt!581820))))

(declare-fun lt!581821 () Bool)

(assert (=> d!141085 (= lt!581820 lt!581821)))

(declare-fun lt!581823 () Unit!42908)

(declare-fun e!742260 () Unit!42908)

(assert (=> d!141085 (= lt!581823 e!742260)))

(declare-fun c!124740 () Bool)

(assert (=> d!141085 (= c!124740 lt!581821)))

(assert (=> d!141085 (= lt!581821 (containsKey!720 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205))))

(assert (=> d!141085 (= (contains!8216 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) k0!1205) lt!581820)))

(declare-fun b!1301359 () Bool)

(declare-fun lt!581822 () Unit!42908)

(assert (=> b!1301359 (= e!742260 lt!581822)))

(assert (=> b!1301359 (= lt!581822 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205))))

(assert (=> b!1301359 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205))))

(declare-fun b!1301360 () Bool)

(declare-fun Unit!42918 () Unit!42908)

(assert (=> b!1301360 (= e!742260 Unit!42918)))

(declare-fun b!1301361 () Bool)

(assert (=> b!1301361 (= e!742261 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205)))))

(assert (= (and d!141085 c!124740) b!1301359))

(assert (= (and d!141085 (not c!124740)) b!1301360))

(assert (= (and d!141085 (not res!864625)) b!1301361))

(declare-fun m!1191619 () Bool)

(assert (=> d!141085 m!1191619))

(declare-fun m!1191621 () Bool)

(assert (=> b!1301359 m!1191621))

(declare-fun m!1191623 () Bool)

(assert (=> b!1301359 m!1191623))

(assert (=> b!1301359 m!1191623))

(declare-fun m!1191625 () Bool)

(assert (=> b!1301359 m!1191625))

(assert (=> b!1301361 m!1191623))

(assert (=> b!1301361 m!1191623))

(assert (=> b!1301361 m!1191625))

(assert (=> b!1301167 d!141085))

(declare-fun d!141087 () Bool)

(declare-fun e!742264 () Bool)

(assert (=> d!141087 e!742264))

(declare-fun res!864631 () Bool)

(assert (=> d!141087 (=> (not res!864631) (not e!742264))))

(declare-fun lt!581835 () ListLongMap!20289)

(assert (=> d!141087 (= res!864631 (contains!8216 lt!581835 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun lt!581832 () List!29750)

(assert (=> d!141087 (= lt!581835 (ListLongMap!20290 lt!581832))))

(declare-fun lt!581834 () Unit!42908)

(declare-fun lt!581833 () Unit!42908)

(assert (=> d!141087 (= lt!581834 lt!581833)))

(assert (=> d!141087 (= (getValueByKey!703 lt!581832 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) (Some!753 (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun lemmaContainsTupThenGetReturnValue!347 (List!29750 (_ BitVec 64) V!51577) Unit!42908)

(assert (=> d!141087 (= lt!581833 (lemmaContainsTupThenGetReturnValue!347 lt!581832 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun insertStrictlySorted!476 (List!29750 (_ BitVec 64) V!51577) List!29750)

(assert (=> d!141087 (= lt!581832 (insertStrictlySorted!476 (toList!10160 (ListLongMap!20290 Nil!29747)) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(assert (=> d!141087 (= (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) lt!581835)))

(declare-fun b!1301366 () Bool)

(declare-fun res!864630 () Bool)

(assert (=> b!1301366 (=> (not res!864630) (not e!742264))))

(assert (=> b!1301366 (= res!864630 (= (getValueByKey!703 (toList!10160 lt!581835) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) (Some!753 (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(declare-fun b!1301367 () Bool)

(declare-fun contains!8219 (List!29750 tuple2!22632) Bool)

(assert (=> b!1301367 (= e!742264 (contains!8219 (toList!10160 lt!581835) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))

(assert (= (and d!141087 res!864631) b!1301366))

(assert (= (and b!1301366 res!864630) b!1301367))

(declare-fun m!1191627 () Bool)

(assert (=> d!141087 m!1191627))

(declare-fun m!1191629 () Bool)

(assert (=> d!141087 m!1191629))

(declare-fun m!1191631 () Bool)

(assert (=> d!141087 m!1191631))

(declare-fun m!1191633 () Bool)

(assert (=> d!141087 m!1191633))

(declare-fun m!1191635 () Bool)

(assert (=> b!1301366 m!1191635))

(declare-fun m!1191637 () Bool)

(assert (=> b!1301367 m!1191637))

(assert (=> b!1301167 d!141087))

(declare-fun d!141089 () Bool)

(assert (=> d!141089 (not (contains!8216 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) k0!1205))))

(declare-fun lt!581838 () Unit!42908)

(declare-fun choose!1912 (ListLongMap!20289 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!42908)

(assert (=> d!141089 (= lt!581838 (choose!1912 (ListLongMap!20290 Nil!29747) (select (arr!41808 _keys!1741) from!2144) lt!581653 k0!1205))))

(declare-fun e!742267 () Bool)

(assert (=> d!141089 e!742267))

(declare-fun res!864634 () Bool)

(assert (=> d!141089 (=> (not res!864634) (not e!742267))))

(assert (=> d!141089 (= res!864634 (not (contains!8216 (ListLongMap!20290 Nil!29747) k0!1205)))))

(assert (=> d!141089 (= (addStillNotContains!453 (ListLongMap!20290 Nil!29747) (select (arr!41808 _keys!1741) from!2144) lt!581653 k0!1205) lt!581838)))

(declare-fun b!1301371 () Bool)

(assert (=> b!1301371 (= e!742267 (not (= (select (arr!41808 _keys!1741) from!2144) k0!1205)))))

(assert (= (and d!141089 res!864634) b!1301371))

(assert (=> d!141089 m!1191449))

(assert (=> d!141089 m!1191449))

(assert (=> d!141089 m!1191451))

(assert (=> d!141089 m!1191423))

(declare-fun m!1191639 () Bool)

(assert (=> d!141089 m!1191639))

(assert (=> d!141089 m!1191425))

(assert (=> b!1301167 d!141089))

(declare-fun d!141091 () Bool)

(declare-fun c!124743 () Bool)

(assert (=> d!141091 (= c!124743 ((_ is ValueCellFull!16529) (select (arr!41807 _values!1445) from!2144)))))

(declare-fun e!742270 () V!51577)

(assert (=> d!141091 (= (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!742270)))

(declare-fun b!1301376 () Bool)

(declare-fun get!21137 (ValueCell!16529 V!51577) V!51577)

(assert (=> b!1301376 (= e!742270 (get!21137 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301377 () Bool)

(declare-fun get!21138 (ValueCell!16529 V!51577) V!51577)

(assert (=> b!1301377 (= e!742270 (get!21138 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141091 c!124743) b!1301376))

(assert (= (and d!141091 (not c!124743)) b!1301377))

(assert (=> b!1301376 m!1191447))

(assert (=> b!1301376 m!1191445))

(declare-fun m!1191641 () Bool)

(assert (=> b!1301376 m!1191641))

(assert (=> b!1301377 m!1191447))

(assert (=> b!1301377 m!1191445))

(declare-fun m!1191643 () Bool)

(assert (=> b!1301377 m!1191643))

(assert (=> b!1301167 d!141091))

(declare-fun b!1301402 () Bool)

(declare-fun res!864645 () Bool)

(declare-fun e!742289 () Bool)

(assert (=> b!1301402 (=> (not res!864645) (not e!742289))))

(declare-fun lt!581856 () ListLongMap!20289)

(assert (=> b!1301402 (= res!864645 (not (contains!8216 lt!581856 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301403 () Bool)

(declare-fun e!742287 () Bool)

(assert (=> b!1301403 (= e!742289 e!742287)))

(declare-fun c!124754 () Bool)

(declare-fun e!742285 () Bool)

(assert (=> b!1301403 (= c!124754 e!742285)))

(declare-fun res!864644 () Bool)

(assert (=> b!1301403 (=> (not res!864644) (not e!742285))))

(assert (=> b!1301403 (= res!864644 (bvslt from!2144 (size!42360 _keys!1741)))))

(declare-fun b!1301404 () Bool)

(declare-fun e!742286 () Bool)

(assert (=> b!1301404 (= e!742287 e!742286)))

(declare-fun c!124752 () Bool)

(assert (=> b!1301404 (= c!124752 (bvslt from!2144 (size!42360 _keys!1741)))))

(declare-fun b!1301405 () Bool)

(declare-fun e!742291 () ListLongMap!20289)

(declare-fun call!63935 () ListLongMap!20289)

(assert (=> b!1301405 (= e!742291 call!63935)))

(declare-fun b!1301406 () Bool)

(declare-fun e!742290 () ListLongMap!20289)

(assert (=> b!1301406 (= e!742290 (ListLongMap!20290 Nil!29747))))

(declare-fun b!1301407 () Bool)

(assert (=> b!1301407 (= e!742290 e!742291)))

(declare-fun c!124753 () Bool)

(assert (=> b!1301407 (= c!124753 (validKeyInArray!0 (select (arr!41808 _keys!1741) from!2144)))))

(declare-fun b!1301408 () Bool)

(declare-fun lt!581857 () Unit!42908)

(declare-fun lt!581855 () Unit!42908)

(assert (=> b!1301408 (= lt!581857 lt!581855)))

(declare-fun lt!581854 () (_ BitVec 64))

(declare-fun lt!581858 () ListLongMap!20289)

(declare-fun lt!581853 () (_ BitVec 64))

(declare-fun lt!581859 () V!51577)

(assert (=> b!1301408 (not (contains!8216 (+!4498 lt!581858 (tuple2!22633 lt!581854 lt!581859)) lt!581853))))

(assert (=> b!1301408 (= lt!581855 (addStillNotContains!453 lt!581858 lt!581854 lt!581859 lt!581853))))

(assert (=> b!1301408 (= lt!581853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1301408 (= lt!581859 (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1301408 (= lt!581854 (select (arr!41808 _keys!1741) from!2144))))

(assert (=> b!1301408 (= lt!581858 call!63935)))

(assert (=> b!1301408 (= e!742291 (+!4498 call!63935 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1301409 () Bool)

(assert (=> b!1301409 (= e!742286 (= lt!581856 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun bm!63932 () Bool)

(assert (=> bm!63932 (= call!63935 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1301410 () Bool)

(assert (=> b!1301410 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42360 _keys!1741)))))

(assert (=> b!1301410 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42359 _values!1445)))))

(declare-fun e!742288 () Bool)

(assert (=> b!1301410 (= e!742288 (= (apply!1010 lt!581856 (select (arr!41808 _keys!1741) from!2144)) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!141093 () Bool)

(assert (=> d!141093 e!742289))

(declare-fun res!864643 () Bool)

(assert (=> d!141093 (=> (not res!864643) (not e!742289))))

(assert (=> d!141093 (= res!864643 (not (contains!8216 lt!581856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141093 (= lt!581856 e!742290)))

(declare-fun c!124755 () Bool)

(assert (=> d!141093 (= c!124755 (bvsge from!2144 (size!42360 _keys!1741)))))

(assert (=> d!141093 (validMask!0 mask!2175)))

(assert (=> d!141093 (= (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581856)))

(declare-fun b!1301411 () Bool)

(declare-fun isEmpty!1059 (ListLongMap!20289) Bool)

(assert (=> b!1301411 (= e!742286 (isEmpty!1059 lt!581856))))

(declare-fun b!1301412 () Bool)

(assert (=> b!1301412 (= e!742285 (validKeyInArray!0 (select (arr!41808 _keys!1741) from!2144)))))

(assert (=> b!1301412 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1301413 () Bool)

(assert (=> b!1301413 (= e!742287 e!742288)))

(assert (=> b!1301413 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42360 _keys!1741)))))

(declare-fun res!864646 () Bool)

(assert (=> b!1301413 (= res!864646 (contains!8216 lt!581856 (select (arr!41808 _keys!1741) from!2144)))))

(assert (=> b!1301413 (=> (not res!864646) (not e!742288))))

(assert (= (and d!141093 c!124755) b!1301406))

(assert (= (and d!141093 (not c!124755)) b!1301407))

(assert (= (and b!1301407 c!124753) b!1301408))

(assert (= (and b!1301407 (not c!124753)) b!1301405))

(assert (= (or b!1301408 b!1301405) bm!63932))

(assert (= (and d!141093 res!864643) b!1301402))

(assert (= (and b!1301402 res!864645) b!1301403))

(assert (= (and b!1301403 res!864644) b!1301412))

(assert (= (and b!1301403 c!124754) b!1301413))

(assert (= (and b!1301403 (not c!124754)) b!1301404))

(assert (= (and b!1301413 res!864646) b!1301410))

(assert (= (and b!1301404 c!124752) b!1301409))

(assert (= (and b!1301404 (not c!124752)) b!1301411))

(declare-fun b_lambda!23185 () Bool)

(assert (=> (not b_lambda!23185) (not b!1301408)))

(assert (=> b!1301408 t!43317))

(declare-fun b_and!47325 () Bool)

(assert (= b_and!47323 (and (=> t!43317 result!23761) b_and!47325)))

(declare-fun b_lambda!23187 () Bool)

(assert (=> (not b_lambda!23187) (not b!1301410)))

(assert (=> b!1301410 t!43317))

(declare-fun b_and!47327 () Bool)

(assert (= b_and!47325 (and (=> t!43317 result!23761) b_and!47327)))

(assert (=> b!1301412 m!1191423))

(assert (=> b!1301412 m!1191423))

(assert (=> b!1301412 m!1191457))

(declare-fun m!1191645 () Bool)

(assert (=> b!1301409 m!1191645))

(declare-fun m!1191647 () Bool)

(assert (=> b!1301402 m!1191647))

(assert (=> b!1301408 m!1191447))

(assert (=> b!1301408 m!1191445))

(assert (=> b!1301408 m!1191455))

(assert (=> b!1301408 m!1191445))

(declare-fun m!1191649 () Bool)

(assert (=> b!1301408 m!1191649))

(assert (=> b!1301408 m!1191423))

(assert (=> b!1301408 m!1191649))

(declare-fun m!1191651 () Bool)

(assert (=> b!1301408 m!1191651))

(declare-fun m!1191653 () Bool)

(assert (=> b!1301408 m!1191653))

(declare-fun m!1191655 () Bool)

(assert (=> b!1301408 m!1191655))

(assert (=> b!1301408 m!1191447))

(declare-fun m!1191657 () Bool)

(assert (=> b!1301411 m!1191657))

(assert (=> b!1301413 m!1191423))

(assert (=> b!1301413 m!1191423))

(declare-fun m!1191659 () Bool)

(assert (=> b!1301413 m!1191659))

(assert (=> b!1301407 m!1191423))

(assert (=> b!1301407 m!1191423))

(assert (=> b!1301407 m!1191457))

(declare-fun m!1191661 () Bool)

(assert (=> d!141093 m!1191661))

(assert (=> d!141093 m!1191439))

(assert (=> bm!63932 m!1191645))

(assert (=> b!1301410 m!1191447))

(assert (=> b!1301410 m!1191445))

(assert (=> b!1301410 m!1191455))

(assert (=> b!1301410 m!1191445))

(assert (=> b!1301410 m!1191423))

(assert (=> b!1301410 m!1191423))

(declare-fun m!1191663 () Bool)

(assert (=> b!1301410 m!1191663))

(assert (=> b!1301410 m!1191447))

(assert (=> bm!63867 d!141093))

(declare-fun d!141095 () Bool)

(assert (=> d!141095 (contains!8216 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) k0!1205)))

(declare-fun lt!581862 () Unit!42908)

(declare-fun choose!1913 ((_ BitVec 64) (_ BitVec 64) V!51577 ListLongMap!20289) Unit!42908)

(assert (=> d!141095 (= lt!581862 (choose!1913 k0!1205 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)) (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))))))

(assert (=> d!141095 (contains!8216 (+!4498 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!141095 (= (lemmaInListMapAfterAddingDiffThenInBefore!83 k0!1205 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)) (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) lt!581862)))

(declare-fun bs!37022 () Bool)

(assert (= bs!37022 d!141095))

(assert (=> bs!37022 m!1191421))

(declare-fun m!1191665 () Bool)

(assert (=> bs!37022 m!1191665))

(declare-fun m!1191667 () Bool)

(assert (=> bs!37022 m!1191667))

(assert (=> bs!37022 m!1191667))

(declare-fun m!1191669 () Bool)

(assert (=> bs!37022 m!1191669))

(assert (=> bm!63871 d!141095))

(declare-fun bm!63935 () Bool)

(declare-fun call!63938 () Bool)

(declare-fun c!124758 () Bool)

(assert (=> bm!63935 (= call!63938 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124758 (Cons!29747 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) Nil!29748) Nil!29748)))))

(declare-fun d!141097 () Bool)

(declare-fun res!864655 () Bool)

(declare-fun e!742300 () Bool)

(assert (=> d!141097 (=> res!864655 e!742300)))

(assert (=> d!141097 (= res!864655 (bvsge #b00000000000000000000000000000000 (size!42360 _keys!1741)))))

(assert (=> d!141097 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29748) e!742300)))

(declare-fun b!1301424 () Bool)

(declare-fun e!742301 () Bool)

(assert (=> b!1301424 (= e!742300 e!742301)))

(declare-fun res!864654 () Bool)

(assert (=> b!1301424 (=> (not res!864654) (not e!742301))))

(declare-fun e!742303 () Bool)

(assert (=> b!1301424 (= res!864654 (not e!742303))))

(declare-fun res!864653 () Bool)

(assert (=> b!1301424 (=> (not res!864653) (not e!742303))))

(assert (=> b!1301424 (= res!864653 (validKeyInArray!0 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301425 () Bool)

(declare-fun e!742302 () Bool)

(assert (=> b!1301425 (= e!742302 call!63938)))

(declare-fun b!1301426 () Bool)

(assert (=> b!1301426 (= e!742301 e!742302)))

(assert (=> b!1301426 (= c!124758 (validKeyInArray!0 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301427 () Bool)

(declare-fun contains!8220 (List!29751 (_ BitVec 64)) Bool)

(assert (=> b!1301427 (= e!742303 (contains!8220 Nil!29748 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301428 () Bool)

(assert (=> b!1301428 (= e!742302 call!63938)))

(assert (= (and d!141097 (not res!864655)) b!1301424))

(assert (= (and b!1301424 res!864653) b!1301427))

(assert (= (and b!1301424 res!864654) b!1301426))

(assert (= (and b!1301426 c!124758) b!1301425))

(assert (= (and b!1301426 (not c!124758)) b!1301428))

(assert (= (or b!1301425 b!1301428) bm!63935))

(declare-fun m!1191671 () Bool)

(assert (=> bm!63935 m!1191671))

(declare-fun m!1191673 () Bool)

(assert (=> bm!63935 m!1191673))

(assert (=> b!1301424 m!1191671))

(assert (=> b!1301424 m!1191671))

(declare-fun m!1191675 () Bool)

(assert (=> b!1301424 m!1191675))

(assert (=> b!1301426 m!1191671))

(assert (=> b!1301426 m!1191671))

(assert (=> b!1301426 m!1191675))

(assert (=> b!1301427 m!1191671))

(assert (=> b!1301427 m!1191671))

(declare-fun m!1191677 () Bool)

(assert (=> b!1301427 m!1191677))

(assert (=> b!1301158 d!141097))

(declare-fun d!141099 () Bool)

(declare-fun e!742304 () Bool)

(assert (=> d!141099 e!742304))

(declare-fun res!864657 () Bool)

(assert (=> d!141099 (=> (not res!864657) (not e!742304))))

(declare-fun lt!581866 () ListLongMap!20289)

(assert (=> d!141099 (= res!864657 (contains!8216 lt!581866 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!581863 () List!29750)

(assert (=> d!141099 (= lt!581866 (ListLongMap!20290 lt!581863))))

(declare-fun lt!581865 () Unit!42908)

(declare-fun lt!581864 () Unit!42908)

(assert (=> d!141099 (= lt!581865 lt!581864)))

(assert (=> d!141099 (= (getValueByKey!703 lt!581863 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!753 (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141099 (= lt!581864 (lemmaContainsTupThenGetReturnValue!347 lt!581863 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141099 (= lt!581863 (insertStrictlySorted!476 (toList!10160 lt!581656) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141099 (= (+!4498 lt!581656 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!581866)))

(declare-fun b!1301429 () Bool)

(declare-fun res!864656 () Bool)

(assert (=> b!1301429 (=> (not res!864656) (not e!742304))))

(assert (=> b!1301429 (= res!864656 (= (getValueByKey!703 (toList!10160 lt!581866) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!753 (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1301430 () Bool)

(assert (=> b!1301430 (= e!742304 (contains!8219 (toList!10160 lt!581866) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141099 res!864657) b!1301429))

(assert (= (and b!1301429 res!864656) b!1301430))

(declare-fun m!1191679 () Bool)

(assert (=> d!141099 m!1191679))

(declare-fun m!1191681 () Bool)

(assert (=> d!141099 m!1191681))

(declare-fun m!1191683 () Bool)

(assert (=> d!141099 m!1191683))

(declare-fun m!1191685 () Bool)

(assert (=> d!141099 m!1191685))

(declare-fun m!1191687 () Bool)

(assert (=> b!1301429 m!1191687))

(declare-fun m!1191689 () Bool)

(assert (=> b!1301430 m!1191689))

(assert (=> b!1301156 d!141099))

(declare-fun d!141101 () Bool)

(assert (=> d!141101 (contains!8216 lt!581656 k0!1205)))

(declare-fun lt!581867 () Unit!42908)

(assert (=> d!141101 (= lt!581867 (choose!1913 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581656))))

(assert (=> d!141101 (contains!8216 (+!4498 lt!581656 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!141101 (= (lemmaInListMapAfterAddingDiffThenInBefore!83 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581656) lt!581867)))

(declare-fun bs!37023 () Bool)

(assert (= bs!37023 d!141101))

(assert (=> bs!37023 m!1191419))

(declare-fun m!1191691 () Bool)

(assert (=> bs!37023 m!1191691))

(assert (=> bs!37023 m!1191415))

(assert (=> bs!37023 m!1191415))

(declare-fun m!1191693 () Bool)

(assert (=> bs!37023 m!1191693))

(assert (=> b!1301156 d!141101))

(declare-fun d!141103 () Bool)

(declare-fun e!742306 () Bool)

(assert (=> d!141103 e!742306))

(declare-fun res!864658 () Bool)

(assert (=> d!141103 (=> res!864658 e!742306)))

(declare-fun lt!581868 () Bool)

(assert (=> d!141103 (= res!864658 (not lt!581868))))

(declare-fun lt!581869 () Bool)

(assert (=> d!141103 (= lt!581868 lt!581869)))

(declare-fun lt!581871 () Unit!42908)

(declare-fun e!742305 () Unit!42908)

(assert (=> d!141103 (= lt!581871 e!742305)))

(declare-fun c!124759 () Bool)

(assert (=> d!141103 (= c!124759 lt!581869)))

(assert (=> d!141103 (= lt!581869 (containsKey!720 (toList!10160 lt!581656) k0!1205))))

(assert (=> d!141103 (= (contains!8216 lt!581656 k0!1205) lt!581868)))

(declare-fun b!1301431 () Bool)

(declare-fun lt!581870 () Unit!42908)

(assert (=> b!1301431 (= e!742305 lt!581870)))

(assert (=> b!1301431 (= lt!581870 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581656) k0!1205))))

(assert (=> b!1301431 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581656) k0!1205))))

(declare-fun b!1301432 () Bool)

(declare-fun Unit!42919 () Unit!42908)

(assert (=> b!1301432 (= e!742305 Unit!42919)))

(declare-fun b!1301433 () Bool)

(assert (=> b!1301433 (= e!742306 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581656) k0!1205)))))

(assert (= (and d!141103 c!124759) b!1301431))

(assert (= (and d!141103 (not c!124759)) b!1301432))

(assert (= (and d!141103 (not res!864658)) b!1301433))

(declare-fun m!1191695 () Bool)

(assert (=> d!141103 m!1191695))

(declare-fun m!1191697 () Bool)

(assert (=> b!1301431 m!1191697))

(declare-fun m!1191699 () Bool)

(assert (=> b!1301431 m!1191699))

(assert (=> b!1301431 m!1191699))

(declare-fun m!1191701 () Bool)

(assert (=> b!1301431 m!1191701))

(assert (=> b!1301433 m!1191699))

(assert (=> b!1301433 m!1191699))

(assert (=> b!1301433 m!1191701))

(assert (=> b!1301156 d!141103))

(declare-fun d!141105 () Bool)

(assert (=> d!141105 (= (validKeyInArray!0 (select (arr!41808 _keys!1741) from!2144)) (and (not (= (select (arr!41808 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41808 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301169 d!141105))

(declare-fun d!141107 () Bool)

(declare-fun e!742308 () Bool)

(assert (=> d!141107 e!742308))

(declare-fun res!864659 () Bool)

(assert (=> d!141107 (=> res!864659 e!742308)))

(declare-fun lt!581872 () Bool)

(assert (=> d!141107 (= res!864659 (not lt!581872))))

(declare-fun lt!581873 () Bool)

(assert (=> d!141107 (= lt!581872 lt!581873)))

(declare-fun lt!581875 () Unit!42908)

(declare-fun e!742307 () Unit!42908)

(assert (=> d!141107 (= lt!581875 e!742307)))

(declare-fun c!124760 () Bool)

(assert (=> d!141107 (= c!124760 lt!581873)))

(assert (=> d!141107 (= lt!581873 (containsKey!720 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205))))

(assert (=> d!141107 (= (contains!8216 (ListLongMap!20290 Nil!29747) k0!1205) lt!581872)))

(declare-fun b!1301434 () Bool)

(declare-fun lt!581874 () Unit!42908)

(assert (=> b!1301434 (= e!742307 lt!581874)))

(assert (=> b!1301434 (= lt!581874 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205))))

(assert (=> b!1301434 (isDefined!510 (getValueByKey!703 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205))))

(declare-fun b!1301435 () Bool)

(declare-fun Unit!42920 () Unit!42908)

(assert (=> b!1301435 (= e!742307 Unit!42920)))

(declare-fun b!1301436 () Bool)

(assert (=> b!1301436 (= e!742308 (isDefined!510 (getValueByKey!703 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205)))))

(assert (= (and d!141107 c!124760) b!1301434))

(assert (= (and d!141107 (not c!124760)) b!1301435))

(assert (= (and d!141107 (not res!864659)) b!1301436))

(declare-fun m!1191703 () Bool)

(assert (=> d!141107 m!1191703))

(declare-fun m!1191705 () Bool)

(assert (=> b!1301434 m!1191705))

(declare-fun m!1191707 () Bool)

(assert (=> b!1301434 m!1191707))

(assert (=> b!1301434 m!1191707))

(declare-fun m!1191709 () Bool)

(assert (=> b!1301434 m!1191709))

(assert (=> b!1301436 m!1191707))

(assert (=> b!1301436 m!1191707))

(assert (=> b!1301436 m!1191709))

(assert (=> b!1301154 d!141107))

(declare-fun d!141109 () Bool)

(assert (=> d!141109 (not (contains!8216 (ListLongMap!20290 Nil!29747) k0!1205))))

(declare-fun lt!581878 () Unit!42908)

(declare-fun choose!1914 ((_ BitVec 64)) Unit!42908)

(assert (=> d!141109 (= lt!581878 (choose!1914 k0!1205))))

(assert (=> d!141109 (= (emptyContainsNothing!198 k0!1205) lt!581878)))

(declare-fun bs!37024 () Bool)

(assert (= bs!37024 d!141109))

(assert (=> bs!37024 m!1191425))

(declare-fun m!1191711 () Bool)

(assert (=> bs!37024 m!1191711))

(assert (=> b!1301154 d!141109))

(declare-fun b!1301445 () Bool)

(declare-fun e!742317 () Bool)

(declare-fun call!63941 () Bool)

(assert (=> b!1301445 (= e!742317 call!63941)))

(declare-fun b!1301446 () Bool)

(declare-fun e!742315 () Bool)

(assert (=> b!1301446 (= e!742315 call!63941)))

(declare-fun bm!63938 () Bool)

(assert (=> bm!63938 (= call!63941 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1301447 () Bool)

(declare-fun e!742316 () Bool)

(assert (=> b!1301447 (= e!742316 e!742315)))

(declare-fun c!124763 () Bool)

(assert (=> b!1301447 (= c!124763 (validKeyInArray!0 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141111 () Bool)

(declare-fun res!864665 () Bool)

(assert (=> d!141111 (=> res!864665 e!742316)))

(assert (=> d!141111 (= res!864665 (bvsge #b00000000000000000000000000000000 (size!42360 _keys!1741)))))

(assert (=> d!141111 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742316)))

(declare-fun b!1301448 () Bool)

(assert (=> b!1301448 (= e!742315 e!742317)))

(declare-fun lt!581885 () (_ BitVec 64))

(assert (=> b!1301448 (= lt!581885 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!581886 () Unit!42908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86623 (_ BitVec 64) (_ BitVec 32)) Unit!42908)

(assert (=> b!1301448 (= lt!581886 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581885 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1301448 (arrayContainsKey!0 _keys!1741 lt!581885 #b00000000000000000000000000000000)))

(declare-fun lt!581887 () Unit!42908)

(assert (=> b!1301448 (= lt!581887 lt!581886)))

(declare-fun res!864664 () Bool)

(declare-datatypes ((SeekEntryResult!10019 0))(
  ( (MissingZero!10019 (index!42447 (_ BitVec 32))) (Found!10019 (index!42448 (_ BitVec 32))) (Intermediate!10019 (undefined!10831 Bool) (index!42449 (_ BitVec 32)) (x!115589 (_ BitVec 32))) (Undefined!10019) (MissingVacant!10019 (index!42450 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86623 (_ BitVec 32)) SeekEntryResult!10019)

(assert (=> b!1301448 (= res!864664 (= (seekEntryOrOpen!0 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10019 #b00000000000000000000000000000000)))))

(assert (=> b!1301448 (=> (not res!864664) (not e!742317))))

(assert (= (and d!141111 (not res!864665)) b!1301447))

(assert (= (and b!1301447 c!124763) b!1301448))

(assert (= (and b!1301447 (not c!124763)) b!1301446))

(assert (= (and b!1301448 res!864664) b!1301445))

(assert (= (or b!1301445 b!1301446) bm!63938))

(declare-fun m!1191713 () Bool)

(assert (=> bm!63938 m!1191713))

(assert (=> b!1301447 m!1191671))

(assert (=> b!1301447 m!1191671))

(assert (=> b!1301447 m!1191675))

(assert (=> b!1301448 m!1191671))

(declare-fun m!1191715 () Bool)

(assert (=> b!1301448 m!1191715))

(declare-fun m!1191717 () Bool)

(assert (=> b!1301448 m!1191717))

(assert (=> b!1301448 m!1191671))

(declare-fun m!1191719 () Bool)

(assert (=> b!1301448 m!1191719))

(assert (=> b!1301162 d!141111))

(declare-fun d!141113 () Bool)

(assert (=> d!141113 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109822 d!141113))

(declare-fun d!141115 () Bool)

(assert (=> d!141115 (= (array_inv!31803 _values!1445) (bvsge (size!42359 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109822 d!141115))

(declare-fun d!141117 () Bool)

(assert (=> d!141117 (= (array_inv!31804 _keys!1741) (bvsge (size!42360 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109822 d!141117))

(declare-fun mapIsEmpty!53867 () Bool)

(declare-fun mapRes!53867 () Bool)

(assert (=> mapIsEmpty!53867 mapRes!53867))

(declare-fun b!1301456 () Bool)

(declare-fun e!742322 () Bool)

(assert (=> b!1301456 (= e!742322 tp_is_empty!34855)))

(declare-fun mapNonEmpty!53867 () Bool)

(declare-fun tp!102795 () Bool)

(declare-fun e!742323 () Bool)

(assert (=> mapNonEmpty!53867 (= mapRes!53867 (and tp!102795 e!742323))))

(declare-fun mapKey!53867 () (_ BitVec 32))

(declare-fun mapValue!53867 () ValueCell!16529)

(declare-fun mapRest!53867 () (Array (_ BitVec 32) ValueCell!16529))

(assert (=> mapNonEmpty!53867 (= mapRest!53858 (store mapRest!53867 mapKey!53867 mapValue!53867))))

(declare-fun condMapEmpty!53867 () Bool)

(declare-fun mapDefault!53867 () ValueCell!16529)

(assert (=> mapNonEmpty!53858 (= condMapEmpty!53867 (= mapRest!53858 ((as const (Array (_ BitVec 32) ValueCell!16529)) mapDefault!53867)))))

(assert (=> mapNonEmpty!53858 (= tp!102779 (and e!742322 mapRes!53867))))

(declare-fun b!1301455 () Bool)

(assert (=> b!1301455 (= e!742323 tp_is_empty!34855)))

(assert (= (and mapNonEmpty!53858 condMapEmpty!53867) mapIsEmpty!53867))

(assert (= (and mapNonEmpty!53858 (not condMapEmpty!53867)) mapNonEmpty!53867))

(assert (= (and mapNonEmpty!53867 ((_ is ValueCellFull!16529) mapValue!53867)) b!1301455))

(assert (= (and mapNonEmpty!53858 ((_ is ValueCellFull!16529) mapDefault!53867)) b!1301456))

(declare-fun m!1191721 () Bool)

(assert (=> mapNonEmpty!53867 m!1191721))

(declare-fun b_lambda!23189 () Bool)

(assert (= b_lambda!23183 (or (and start!109822 b_free!29215) b_lambda!23189)))

(declare-fun b_lambda!23191 () Bool)

(assert (= b_lambda!23187 (or (and start!109822 b_free!29215) b_lambda!23191)))

(declare-fun b_lambda!23193 () Bool)

(assert (= b_lambda!23185 (or (and start!109822 b_free!29215) b_lambda!23193)))

(check-sat tp_is_empty!34855 (not b_lambda!23181) (not b!1301434) (not b_lambda!23193) (not b!1301412) (not b!1301409) (not b!1301337) (not b!1301430) b_and!47327 (not d!141079) (not b!1301431) (not bm!63925) (not b!1301413) (not b!1301424) (not bm!63938) (not bm!63927) (not b!1301358) (not d!141081) (not d!141099) (not b!1301361) (not d!141093) (not d!141087) (not b_lambda!23191) (not b!1301410) (not bm!63935) (not b!1301402) (not bm!63929) (not b!1301338) (not b!1301356) (not b!1301426) (not b!1301427) (not b!1301350) (not b!1301344) (not b_lambda!23189) (not b!1301411) (not b!1301355) (not d!141085) (not b!1301366) (not d!141101) (not d!141083) (not d!141109) (not d!141089) (not b!1301342) (not b!1301448) (not b!1301407) (not b!1301377) (not d!141103) (not b!1301367) (not mapNonEmpty!53867) (not b!1301290) (not b!1301340) (not b!1301354) (not b!1301429) (not bm!63928) (not d!141107) (not b!1301359) (not d!141095) (not b_next!29215) (not b!1301376) (not b!1301433) (not b!1301436) (not b!1301292) (not b!1301408) (not bm!63932) (not b!1301447))
(check-sat b_and!47327 (not b_next!29215))
(get-model)

(declare-fun d!141119 () Bool)

(declare-fun lt!581890 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!641 (List!29751) (InoxSet (_ BitVec 64)))

(assert (=> d!141119 (= lt!581890 (select (content!641 Nil!29748) (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!742328 () Bool)

(assert (=> d!141119 (= lt!581890 e!742328)))

(declare-fun res!864671 () Bool)

(assert (=> d!141119 (=> (not res!864671) (not e!742328))))

(assert (=> d!141119 (= res!864671 ((_ is Cons!29747) Nil!29748))))

(assert (=> d!141119 (= (contains!8220 Nil!29748 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)) lt!581890)))

(declare-fun b!1301461 () Bool)

(declare-fun e!742329 () Bool)

(assert (=> b!1301461 (= e!742328 e!742329)))

(declare-fun res!864670 () Bool)

(assert (=> b!1301461 (=> res!864670 e!742329)))

(assert (=> b!1301461 (= res!864670 (= (h!30956 Nil!29748) (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301462 () Bool)

(assert (=> b!1301462 (= e!742329 (contains!8220 (t!43319 Nil!29748) (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141119 res!864671) b!1301461))

(assert (= (and b!1301461 (not res!864670)) b!1301462))

(declare-fun m!1191723 () Bool)

(assert (=> d!141119 m!1191723))

(assert (=> d!141119 m!1191671))

(declare-fun m!1191725 () Bool)

(assert (=> d!141119 m!1191725))

(assert (=> b!1301462 m!1191671))

(declare-fun m!1191727 () Bool)

(assert (=> b!1301462 m!1191727))

(assert (=> b!1301427 d!141119))

(declare-fun d!141121 () Bool)

(assert (=> d!141121 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205))))

(declare-fun lt!581893 () Unit!42908)

(declare-fun choose!1915 (List!29750 (_ BitVec 64)) Unit!42908)

(assert (=> d!141121 (= lt!581893 (choose!1915 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205))))

(declare-fun e!742332 () Bool)

(assert (=> d!141121 e!742332))

(declare-fun res!864674 () Bool)

(assert (=> d!141121 (=> (not res!864674) (not e!742332))))

(declare-fun isStrictlySorted!867 (List!29750) Bool)

(assert (=> d!141121 (= res!864674 (isStrictlySorted!867 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(assert (=> d!141121 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205) lt!581893)))

(declare-fun b!1301465 () Bool)

(assert (=> b!1301465 (= e!742332 (containsKey!720 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205))))

(assert (= (and d!141121 res!864674) b!1301465))

(assert (=> d!141121 m!1191623))

(assert (=> d!141121 m!1191623))

(assert (=> d!141121 m!1191625))

(declare-fun m!1191729 () Bool)

(assert (=> d!141121 m!1191729))

(declare-fun m!1191731 () Bool)

(assert (=> d!141121 m!1191731))

(assert (=> b!1301465 m!1191619))

(assert (=> b!1301359 d!141121))

(declare-fun d!141123 () Bool)

(declare-fun isEmpty!1060 (Option!754) Bool)

(assert (=> d!141123 (= (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205)) (not (isEmpty!1060 (getValueByKey!703 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205))))))

(declare-fun bs!37025 () Bool)

(assert (= bs!37025 d!141123))

(assert (=> bs!37025 m!1191623))

(declare-fun m!1191733 () Bool)

(assert (=> bs!37025 m!1191733))

(assert (=> b!1301359 d!141123))

(declare-fun b!1301474 () Bool)

(declare-fun e!742337 () Option!754)

(assert (=> b!1301474 (= e!742337 (Some!753 (_2!11327 (h!30955 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))))

(declare-fun b!1301475 () Bool)

(declare-fun e!742338 () Option!754)

(assert (=> b!1301475 (= e!742337 e!742338)))

(declare-fun c!124769 () Bool)

(assert (=> b!1301475 (= c!124769 (and ((_ is Cons!29746) (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))) (not (= (_1!11327 (h!30955 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))) k0!1205))))))

(declare-fun b!1301477 () Bool)

(assert (=> b!1301477 (= e!742338 None!752)))

(declare-fun b!1301476 () Bool)

(assert (=> b!1301476 (= e!742338 (getValueByKey!703 (t!43318 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))) k0!1205))))

(declare-fun c!124768 () Bool)

(declare-fun d!141125 () Bool)

(assert (=> d!141125 (= c!124768 (and ((_ is Cons!29746) (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))) (= (_1!11327 (h!30955 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))) k0!1205)))))

(assert (=> d!141125 (= (getValueByKey!703 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205) e!742337)))

(assert (= (and d!141125 c!124768) b!1301474))

(assert (= (and d!141125 (not c!124768)) b!1301475))

(assert (= (and b!1301475 c!124769) b!1301476))

(assert (= (and b!1301475 (not c!124769)) b!1301477))

(declare-fun m!1191735 () Bool)

(assert (=> b!1301476 m!1191735))

(assert (=> b!1301359 d!141125))

(declare-fun d!141127 () Bool)

(declare-fun res!864679 () Bool)

(declare-fun e!742343 () Bool)

(assert (=> d!141127 (=> res!864679 e!742343)))

(assert (=> d!141127 (= res!864679 (and ((_ is Cons!29746) (toList!10160 lt!581656)) (= (_1!11327 (h!30955 (toList!10160 lt!581656))) k0!1205)))))

(assert (=> d!141127 (= (containsKey!720 (toList!10160 lt!581656) k0!1205) e!742343)))

(declare-fun b!1301482 () Bool)

(declare-fun e!742344 () Bool)

(assert (=> b!1301482 (= e!742343 e!742344)))

(declare-fun res!864680 () Bool)

(assert (=> b!1301482 (=> (not res!864680) (not e!742344))))

(assert (=> b!1301482 (= res!864680 (and (or (not ((_ is Cons!29746) (toList!10160 lt!581656))) (bvsle (_1!11327 (h!30955 (toList!10160 lt!581656))) k0!1205)) ((_ is Cons!29746) (toList!10160 lt!581656)) (bvslt (_1!11327 (h!30955 (toList!10160 lt!581656))) k0!1205)))))

(declare-fun b!1301483 () Bool)

(assert (=> b!1301483 (= e!742344 (containsKey!720 (t!43318 (toList!10160 lt!581656)) k0!1205))))

(assert (= (and d!141127 (not res!864679)) b!1301482))

(assert (= (and b!1301482 res!864680) b!1301483))

(declare-fun m!1191737 () Bool)

(assert (=> b!1301483 m!1191737))

(assert (=> d!141103 d!141127))

(declare-fun d!141129 () Bool)

(declare-fun e!742346 () Bool)

(assert (=> d!141129 e!742346))

(declare-fun res!864681 () Bool)

(assert (=> d!141129 (=> res!864681 e!742346)))

(declare-fun lt!581894 () Bool)

(assert (=> d!141129 (= res!864681 (not lt!581894))))

(declare-fun lt!581895 () Bool)

(assert (=> d!141129 (= lt!581894 lt!581895)))

(declare-fun lt!581897 () Unit!42908)

(declare-fun e!742345 () Unit!42908)

(assert (=> d!141129 (= lt!581897 e!742345)))

(declare-fun c!124770 () Bool)

(assert (=> d!141129 (= c!124770 lt!581895)))

(assert (=> d!141129 (= lt!581895 (containsKey!720 (toList!10160 lt!581856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141129 (= (contains!8216 lt!581856 #b1000000000000000000000000000000000000000000000000000000000000000) lt!581894)))

(declare-fun b!1301484 () Bool)

(declare-fun lt!581896 () Unit!42908)

(assert (=> b!1301484 (= e!742345 lt!581896)))

(assert (=> b!1301484 (= lt!581896 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301484 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301485 () Bool)

(declare-fun Unit!42921 () Unit!42908)

(assert (=> b!1301485 (= e!742345 Unit!42921)))

(declare-fun b!1301486 () Bool)

(assert (=> b!1301486 (= e!742346 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581856) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141129 c!124770) b!1301484))

(assert (= (and d!141129 (not c!124770)) b!1301485))

(assert (= (and d!141129 (not res!864681)) b!1301486))

(declare-fun m!1191739 () Bool)

(assert (=> d!141129 m!1191739))

(declare-fun m!1191741 () Bool)

(assert (=> b!1301484 m!1191741))

(declare-fun m!1191743 () Bool)

(assert (=> b!1301484 m!1191743))

(assert (=> b!1301484 m!1191743))

(declare-fun m!1191745 () Bool)

(assert (=> b!1301484 m!1191745))

(assert (=> b!1301486 m!1191743))

(assert (=> b!1301486 m!1191743))

(assert (=> b!1301486 m!1191745))

(assert (=> b!1301402 d!141129))

(declare-fun b!1301487 () Bool)

(declare-fun e!742347 () Option!754)

(assert (=> b!1301487 (= e!742347 (Some!753 (_2!11327 (h!30955 (toList!10160 lt!581866)))))))

(declare-fun b!1301488 () Bool)

(declare-fun e!742348 () Option!754)

(assert (=> b!1301488 (= e!742347 e!742348)))

(declare-fun c!124772 () Bool)

(assert (=> b!1301488 (= c!124772 (and ((_ is Cons!29746) (toList!10160 lt!581866)) (not (= (_1!11327 (h!30955 (toList!10160 lt!581866))) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun b!1301490 () Bool)

(assert (=> b!1301490 (= e!742348 None!752)))

(declare-fun b!1301489 () Bool)

(assert (=> b!1301489 (= e!742348 (getValueByKey!703 (t!43318 (toList!10160 lt!581866)) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun d!141131 () Bool)

(declare-fun c!124771 () Bool)

(assert (=> d!141131 (= c!124771 (and ((_ is Cons!29746) (toList!10160 lt!581866)) (= (_1!11327 (h!30955 (toList!10160 lt!581866))) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (=> d!141131 (= (getValueByKey!703 (toList!10160 lt!581866) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) e!742347)))

(assert (= (and d!141131 c!124771) b!1301487))

(assert (= (and d!141131 (not c!124771)) b!1301488))

(assert (= (and b!1301488 c!124772) b!1301489))

(assert (= (and b!1301488 (not c!124772)) b!1301490))

(declare-fun m!1191747 () Bool)

(assert (=> b!1301489 m!1191747))

(assert (=> b!1301429 d!141131))

(declare-fun d!141133 () Bool)

(declare-fun e!742350 () Bool)

(assert (=> d!141133 e!742350))

(declare-fun res!864682 () Bool)

(assert (=> d!141133 (=> res!864682 e!742350)))

(declare-fun lt!581898 () Bool)

(assert (=> d!141133 (= res!864682 (not lt!581898))))

(declare-fun lt!581899 () Bool)

(assert (=> d!141133 (= lt!581898 lt!581899)))

(declare-fun lt!581901 () Unit!42908)

(declare-fun e!742349 () Unit!42908)

(assert (=> d!141133 (= lt!581901 e!742349)))

(declare-fun c!124773 () Bool)

(assert (=> d!141133 (= c!124773 lt!581899)))

(assert (=> d!141133 (= lt!581899 (containsKey!720 (toList!10160 lt!581856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141133 (= (contains!8216 lt!581856 #b0000000000000000000000000000000000000000000000000000000000000000) lt!581898)))

(declare-fun b!1301491 () Bool)

(declare-fun lt!581900 () Unit!42908)

(assert (=> b!1301491 (= e!742349 lt!581900)))

(assert (=> b!1301491 (= lt!581900 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301491 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301492 () Bool)

(declare-fun Unit!42922 () Unit!42908)

(assert (=> b!1301492 (= e!742349 Unit!42922)))

(declare-fun b!1301493 () Bool)

(assert (=> b!1301493 (= e!742350 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141133 c!124773) b!1301491))

(assert (= (and d!141133 (not c!124773)) b!1301492))

(assert (= (and d!141133 (not res!864682)) b!1301493))

(declare-fun m!1191749 () Bool)

(assert (=> d!141133 m!1191749))

(declare-fun m!1191751 () Bool)

(assert (=> b!1301491 m!1191751))

(declare-fun m!1191753 () Bool)

(assert (=> b!1301491 m!1191753))

(assert (=> b!1301491 m!1191753))

(declare-fun m!1191755 () Bool)

(assert (=> b!1301491 m!1191755))

(assert (=> b!1301493 m!1191753))

(assert (=> b!1301493 m!1191753))

(assert (=> b!1301493 m!1191755))

(assert (=> d!141093 d!141133))

(assert (=> d!141093 d!141113))

(declare-fun d!141135 () Bool)

(declare-fun get!21139 (Option!754) V!51577)

(assert (=> d!141135 (= (apply!1010 lt!581812 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21139 (getValueByKey!703 (toList!10160 lt!581812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37026 () Bool)

(assert (= bs!37026 d!141135))

(declare-fun m!1191757 () Bool)

(assert (=> bs!37026 m!1191757))

(assert (=> bs!37026 m!1191757))

(declare-fun m!1191759 () Bool)

(assert (=> bs!37026 m!1191759))

(assert (=> b!1301350 d!141135))

(declare-fun call!63942 () Bool)

(declare-fun c!124774 () Bool)

(declare-fun bm!63939 () Bool)

(assert (=> bm!63939 (= call!63942 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!124774 (Cons!29747 (select (arr!41808 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!124758 (Cons!29747 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) Nil!29748) Nil!29748)) (ite c!124758 (Cons!29747 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) Nil!29748) Nil!29748))))))

(declare-fun d!141137 () Bool)

(declare-fun res!864685 () Bool)

(declare-fun e!742351 () Bool)

(assert (=> d!141137 (=> res!864685 e!742351)))

(assert (=> d!141137 (= res!864685 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42360 _keys!1741)))))

(assert (=> d!141137 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124758 (Cons!29747 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) Nil!29748) Nil!29748)) e!742351)))

(declare-fun b!1301494 () Bool)

(declare-fun e!742352 () Bool)

(assert (=> b!1301494 (= e!742351 e!742352)))

(declare-fun res!864684 () Bool)

(assert (=> b!1301494 (=> (not res!864684) (not e!742352))))

(declare-fun e!742354 () Bool)

(assert (=> b!1301494 (= res!864684 (not e!742354))))

(declare-fun res!864683 () Bool)

(assert (=> b!1301494 (=> (not res!864683) (not e!742354))))

(assert (=> b!1301494 (= res!864683 (validKeyInArray!0 (select (arr!41808 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1301495 () Bool)

(declare-fun e!742353 () Bool)

(assert (=> b!1301495 (= e!742353 call!63942)))

(declare-fun b!1301496 () Bool)

(assert (=> b!1301496 (= e!742352 e!742353)))

(assert (=> b!1301496 (= c!124774 (validKeyInArray!0 (select (arr!41808 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1301497 () Bool)

(assert (=> b!1301497 (= e!742354 (contains!8220 (ite c!124758 (Cons!29747 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) Nil!29748) Nil!29748) (select (arr!41808 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1301498 () Bool)

(assert (=> b!1301498 (= e!742353 call!63942)))

(assert (= (and d!141137 (not res!864685)) b!1301494))

(assert (= (and b!1301494 res!864683) b!1301497))

(assert (= (and b!1301494 res!864684) b!1301496))

(assert (= (and b!1301496 c!124774) b!1301495))

(assert (= (and b!1301496 (not c!124774)) b!1301498))

(assert (= (or b!1301495 b!1301498) bm!63939))

(declare-fun m!1191761 () Bool)

(assert (=> bm!63939 m!1191761))

(declare-fun m!1191763 () Bool)

(assert (=> bm!63939 m!1191763))

(assert (=> b!1301494 m!1191761))

(assert (=> b!1301494 m!1191761))

(declare-fun m!1191765 () Bool)

(assert (=> b!1301494 m!1191765))

(assert (=> b!1301496 m!1191761))

(assert (=> b!1301496 m!1191761))

(assert (=> b!1301496 m!1191765))

(assert (=> b!1301497 m!1191761))

(assert (=> b!1301497 m!1191761))

(declare-fun m!1191767 () Bool)

(assert (=> b!1301497 m!1191767))

(assert (=> bm!63935 d!141137))

(assert (=> d!141095 d!141083))

(declare-fun d!141139 () Bool)

(assert (=> d!141139 (contains!8216 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) k0!1205)))

(assert (=> d!141139 true))

(declare-fun _$21!120 () Unit!42908)

(assert (=> d!141139 (= (choose!1913 k0!1205 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)) (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) _$21!120)))

(declare-fun bs!37027 () Bool)

(assert (= bs!37027 d!141139))

(assert (=> bs!37027 m!1191421))

(assert (=> d!141095 d!141139))

(declare-fun d!141141 () Bool)

(declare-fun e!742356 () Bool)

(assert (=> d!141141 e!742356))

(declare-fun res!864686 () Bool)

(assert (=> d!141141 (=> res!864686 e!742356)))

(declare-fun lt!581902 () Bool)

(assert (=> d!141141 (= res!864686 (not lt!581902))))

(declare-fun lt!581903 () Bool)

(assert (=> d!141141 (= lt!581902 lt!581903)))

(declare-fun lt!581905 () Unit!42908)

(declare-fun e!742355 () Unit!42908)

(assert (=> d!141141 (= lt!581905 e!742355)))

(declare-fun c!124775 () Bool)

(assert (=> d!141141 (= c!124775 lt!581903)))

(assert (=> d!141141 (= lt!581903 (containsKey!720 (toList!10160 (+!4498 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> d!141141 (= (contains!8216 (+!4498 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)))) k0!1205) lt!581902)))

(declare-fun b!1301499 () Bool)

(declare-fun lt!581904 () Unit!42908)

(assert (=> b!1301499 (= e!742355 lt!581904)))

(assert (=> b!1301499 (= lt!581904 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (+!4498 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> b!1301499 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))) k0!1205))))

(declare-fun b!1301500 () Bool)

(declare-fun Unit!42923 () Unit!42908)

(assert (=> b!1301500 (= e!742355 Unit!42923)))

(declare-fun b!1301501 () Bool)

(assert (=> b!1301501 (= e!742356 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))) k0!1205)))))

(assert (= (and d!141141 c!124775) b!1301499))

(assert (= (and d!141141 (not c!124775)) b!1301500))

(assert (= (and d!141141 (not res!864686)) b!1301501))

(declare-fun m!1191769 () Bool)

(assert (=> d!141141 m!1191769))

(declare-fun m!1191771 () Bool)

(assert (=> b!1301499 m!1191771))

(declare-fun m!1191773 () Bool)

(assert (=> b!1301499 m!1191773))

(assert (=> b!1301499 m!1191773))

(declare-fun m!1191775 () Bool)

(assert (=> b!1301499 m!1191775))

(assert (=> b!1301501 m!1191773))

(assert (=> b!1301501 m!1191773))

(assert (=> b!1301501 m!1191775))

(assert (=> d!141095 d!141141))

(declare-fun d!141143 () Bool)

(declare-fun e!742357 () Bool)

(assert (=> d!141143 e!742357))

(declare-fun res!864688 () Bool)

(assert (=> d!141143 (=> (not res!864688) (not e!742357))))

(declare-fun lt!581909 () ListLongMap!20289)

(assert (=> d!141143 (= res!864688 (contains!8216 lt!581909 (_1!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))))))

(declare-fun lt!581906 () List!29750)

(assert (=> d!141143 (= lt!581909 (ListLongMap!20290 lt!581906))))

(declare-fun lt!581908 () Unit!42908)

(declare-fun lt!581907 () Unit!42908)

(assert (=> d!141143 (= lt!581908 lt!581907)))

(assert (=> d!141143 (= (getValueByKey!703 lt!581906 (_1!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))) (Some!753 (_2!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141143 (= lt!581907 (lemmaContainsTupThenGetReturnValue!347 lt!581906 (_1!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)))) (_2!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141143 (= lt!581906 (insertStrictlySorted!476 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) (_1!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)))) (_2!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141143 (= (+!4498 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)) (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)))) lt!581909)))

(declare-fun b!1301502 () Bool)

(declare-fun res!864687 () Bool)

(assert (=> b!1301502 (=> (not res!864687) (not e!742357))))

(assert (=> b!1301502 (= res!864687 (= (getValueByKey!703 (toList!10160 lt!581909) (_1!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387))))) (Some!753 (_2!11327 (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)))))))))

(declare-fun b!1301503 () Bool)

(assert (=> b!1301503 (= e!742357 (contains!8219 (toList!10160 lt!581909) (tuple2!22633 (ite c!124699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124697 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124699 minValue!1387 (ite c!124697 zeroValue!1387 minValue!1387)))))))

(assert (= (and d!141143 res!864688) b!1301502))

(assert (= (and b!1301502 res!864687) b!1301503))

(declare-fun m!1191777 () Bool)

(assert (=> d!141143 m!1191777))

(declare-fun m!1191779 () Bool)

(assert (=> d!141143 m!1191779))

(declare-fun m!1191781 () Bool)

(assert (=> d!141143 m!1191781))

(declare-fun m!1191783 () Bool)

(assert (=> d!141143 m!1191783))

(declare-fun m!1191785 () Bool)

(assert (=> b!1301502 m!1191785))

(declare-fun m!1191787 () Bool)

(assert (=> b!1301503 m!1191787))

(assert (=> d!141095 d!141143))

(declare-fun b!1301504 () Bool)

(declare-fun res!864691 () Bool)

(declare-fun e!742362 () Bool)

(assert (=> b!1301504 (=> (not res!864691) (not e!742362))))

(declare-fun lt!581913 () ListLongMap!20289)

(assert (=> b!1301504 (= res!864691 (not (contains!8216 lt!581913 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301505 () Bool)

(declare-fun e!742360 () Bool)

(assert (=> b!1301505 (= e!742362 e!742360)))

(declare-fun c!124778 () Bool)

(declare-fun e!742358 () Bool)

(assert (=> b!1301505 (= c!124778 e!742358)))

(declare-fun res!864690 () Bool)

(assert (=> b!1301505 (=> (not res!864690) (not e!742358))))

(assert (=> b!1301505 (= res!864690 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42360 _keys!1741)))))

(declare-fun b!1301506 () Bool)

(declare-fun e!742359 () Bool)

(assert (=> b!1301506 (= e!742360 e!742359)))

(declare-fun c!124776 () Bool)

(assert (=> b!1301506 (= c!124776 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42360 _keys!1741)))))

(declare-fun b!1301507 () Bool)

(declare-fun e!742364 () ListLongMap!20289)

(declare-fun call!63943 () ListLongMap!20289)

(assert (=> b!1301507 (= e!742364 call!63943)))

(declare-fun b!1301508 () Bool)

(declare-fun e!742363 () ListLongMap!20289)

(assert (=> b!1301508 (= e!742363 (ListLongMap!20290 Nil!29747))))

(declare-fun b!1301509 () Bool)

(assert (=> b!1301509 (= e!742363 e!742364)))

(declare-fun c!124777 () Bool)

(assert (=> b!1301509 (= c!124777 (validKeyInArray!0 (select (arr!41808 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1301510 () Bool)

(declare-fun lt!581914 () Unit!42908)

(declare-fun lt!581912 () Unit!42908)

(assert (=> b!1301510 (= lt!581914 lt!581912)))

(declare-fun lt!581910 () (_ BitVec 64))

(declare-fun lt!581915 () ListLongMap!20289)

(declare-fun lt!581916 () V!51577)

(declare-fun lt!581911 () (_ BitVec 64))

(assert (=> b!1301510 (not (contains!8216 (+!4498 lt!581915 (tuple2!22633 lt!581911 lt!581916)) lt!581910))))

(assert (=> b!1301510 (= lt!581912 (addStillNotContains!453 lt!581915 lt!581911 lt!581916 lt!581910))))

(assert (=> b!1301510 (= lt!581910 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1301510 (= lt!581916 (get!21134 (select (arr!41807 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1301510 (= lt!581911 (select (arr!41808 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1301510 (= lt!581915 call!63943)))

(assert (=> b!1301510 (= e!742364 (+!4498 call!63943 (tuple2!22633 (select (arr!41808 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21134 (select (arr!41807 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1301511 () Bool)

(assert (=> b!1301511 (= e!742359 (= lt!581913 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun bm!63940 () Bool)

(assert (=> bm!63940 (= call!63943 (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1301512 () Bool)

(assert (=> b!1301512 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42360 _keys!1741)))))

(assert (=> b!1301512 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42359 _values!1445)))))

(declare-fun e!742361 () Bool)

(assert (=> b!1301512 (= e!742361 (= (apply!1010 lt!581913 (select (arr!41808 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21134 (select (arr!41807 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!141145 () Bool)

(assert (=> d!141145 e!742362))

(declare-fun res!864689 () Bool)

(assert (=> d!141145 (=> (not res!864689) (not e!742362))))

(assert (=> d!141145 (= res!864689 (not (contains!8216 lt!581913 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141145 (= lt!581913 e!742363)))

(declare-fun c!124779 () Bool)

(assert (=> d!141145 (= c!124779 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42360 _keys!1741)))))

(assert (=> d!141145 (validMask!0 mask!2175)))

(assert (=> d!141145 (= (getCurrentListMapNoExtraKeys!6131 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!581913)))

(declare-fun b!1301513 () Bool)

(assert (=> b!1301513 (= e!742359 (isEmpty!1059 lt!581913))))

(declare-fun b!1301514 () Bool)

(assert (=> b!1301514 (= e!742358 (validKeyInArray!0 (select (arr!41808 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1301514 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1301515 () Bool)

(assert (=> b!1301515 (= e!742360 e!742361)))

(assert (=> b!1301515 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42360 _keys!1741)))))

(declare-fun res!864692 () Bool)

(assert (=> b!1301515 (= res!864692 (contains!8216 lt!581913 (select (arr!41808 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1301515 (=> (not res!864692) (not e!742361))))

(assert (= (and d!141145 c!124779) b!1301508))

(assert (= (and d!141145 (not c!124779)) b!1301509))

(assert (= (and b!1301509 c!124777) b!1301510))

(assert (= (and b!1301509 (not c!124777)) b!1301507))

(assert (= (or b!1301510 b!1301507) bm!63940))

(assert (= (and d!141145 res!864689) b!1301504))

(assert (= (and b!1301504 res!864691) b!1301505))

(assert (= (and b!1301505 res!864690) b!1301514))

(assert (= (and b!1301505 c!124778) b!1301515))

(assert (= (and b!1301505 (not c!124778)) b!1301506))

(assert (= (and b!1301515 res!864692) b!1301512))

(assert (= (and b!1301506 c!124776) b!1301511))

(assert (= (and b!1301506 (not c!124776)) b!1301513))

(declare-fun b_lambda!23195 () Bool)

(assert (=> (not b_lambda!23195) (not b!1301510)))

(assert (=> b!1301510 t!43317))

(declare-fun b_and!47329 () Bool)

(assert (= b_and!47327 (and (=> t!43317 result!23761) b_and!47329)))

(declare-fun b_lambda!23197 () Bool)

(assert (=> (not b_lambda!23197) (not b!1301512)))

(assert (=> b!1301512 t!43317))

(declare-fun b_and!47331 () Bool)

(assert (= b_and!47329 (and (=> t!43317 result!23761) b_and!47331)))

(declare-fun m!1191789 () Bool)

(assert (=> b!1301514 m!1191789))

(assert (=> b!1301514 m!1191789))

(declare-fun m!1191791 () Bool)

(assert (=> b!1301514 m!1191791))

(declare-fun m!1191793 () Bool)

(assert (=> b!1301511 m!1191793))

(declare-fun m!1191795 () Bool)

(assert (=> b!1301504 m!1191795))

(declare-fun m!1191797 () Bool)

(assert (=> b!1301510 m!1191797))

(assert (=> b!1301510 m!1191445))

(declare-fun m!1191799 () Bool)

(assert (=> b!1301510 m!1191799))

(assert (=> b!1301510 m!1191445))

(declare-fun m!1191801 () Bool)

(assert (=> b!1301510 m!1191801))

(assert (=> b!1301510 m!1191789))

(assert (=> b!1301510 m!1191801))

(declare-fun m!1191803 () Bool)

(assert (=> b!1301510 m!1191803))

(declare-fun m!1191805 () Bool)

(assert (=> b!1301510 m!1191805))

(declare-fun m!1191807 () Bool)

(assert (=> b!1301510 m!1191807))

(assert (=> b!1301510 m!1191797))

(declare-fun m!1191809 () Bool)

(assert (=> b!1301513 m!1191809))

(assert (=> b!1301515 m!1191789))

(assert (=> b!1301515 m!1191789))

(declare-fun m!1191811 () Bool)

(assert (=> b!1301515 m!1191811))

(assert (=> b!1301509 m!1191789))

(assert (=> b!1301509 m!1191789))

(assert (=> b!1301509 m!1191791))

(declare-fun m!1191813 () Bool)

(assert (=> d!141145 m!1191813))

(assert (=> d!141145 m!1191439))

(assert (=> bm!63940 m!1191793))

(assert (=> b!1301512 m!1191797))

(assert (=> b!1301512 m!1191445))

(assert (=> b!1301512 m!1191799))

(assert (=> b!1301512 m!1191445))

(assert (=> b!1301512 m!1191789))

(assert (=> b!1301512 m!1191789))

(declare-fun m!1191815 () Bool)

(assert (=> b!1301512 m!1191815))

(assert (=> b!1301512 m!1191797))

(assert (=> bm!63932 d!141145))

(declare-fun d!141147 () Bool)

(assert (=> d!141147 (isDefined!510 (getValueByKey!703 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!581917 () Unit!42908)

(assert (=> d!141147 (= lt!581917 (choose!1915 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!742365 () Bool)

(assert (=> d!141147 e!742365))

(declare-fun res!864693 () Bool)

(assert (=> d!141147 (=> (not res!864693) (not e!742365))))

(assert (=> d!141147 (= res!864693 (isStrictlySorted!867 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141147 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!581917)))

(declare-fun b!1301516 () Bool)

(assert (=> b!1301516 (= e!742365 (containsKey!720 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141147 res!864693) b!1301516))

(assert (=> d!141147 m!1191561))

(assert (=> d!141147 m!1191561))

(assert (=> d!141147 m!1191563))

(declare-fun m!1191817 () Bool)

(assert (=> d!141147 m!1191817))

(declare-fun m!1191819 () Bool)

(assert (=> d!141147 m!1191819))

(assert (=> b!1301516 m!1191557))

(assert (=> b!1301290 d!141147))

(declare-fun d!141149 () Bool)

(assert (=> d!141149 (= (isDefined!510 (getValueByKey!703 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1060 (getValueByKey!703 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37028 () Bool)

(assert (= bs!37028 d!141149))

(assert (=> bs!37028 m!1191561))

(declare-fun m!1191821 () Bool)

(assert (=> bs!37028 m!1191821))

(assert (=> b!1301290 d!141149))

(declare-fun e!742366 () Option!754)

(declare-fun b!1301517 () Bool)

(assert (=> b!1301517 (= e!742366 (Some!753 (_2!11327 (h!30955 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1301518 () Bool)

(declare-fun e!742367 () Option!754)

(assert (=> b!1301518 (= e!742366 e!742367)))

(declare-fun c!124781 () Bool)

(assert (=> b!1301518 (= c!124781 (and ((_ is Cons!29746) (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11327 (h!30955 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1301520 () Bool)

(assert (=> b!1301520 (= e!742367 None!752)))

(declare-fun b!1301519 () Bool)

(assert (=> b!1301519 (= e!742367 (getValueByKey!703 (t!43318 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun c!124780 () Bool)

(declare-fun d!141151 () Bool)

(assert (=> d!141151 (= c!124780 (and ((_ is Cons!29746) (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11327 (h!30955 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141151 (= (getValueByKey!703 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742366)))

(assert (= (and d!141151 c!124780) b!1301517))

(assert (= (and d!141151 (not c!124780)) b!1301518))

(assert (= (and b!1301518 c!124781) b!1301519))

(assert (= (and b!1301518 (not c!124781)) b!1301520))

(declare-fun m!1191823 () Bool)

(assert (=> b!1301519 m!1191823))

(assert (=> b!1301290 d!141151))

(declare-fun d!141153 () Bool)

(declare-fun e!742368 () Bool)

(assert (=> d!141153 e!742368))

(declare-fun res!864695 () Bool)

(assert (=> d!141153 (=> (not res!864695) (not e!742368))))

(declare-fun lt!581921 () ListLongMap!20289)

(assert (=> d!141153 (= res!864695 (contains!8216 lt!581921 (_1!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!581918 () List!29750)

(assert (=> d!141153 (= lt!581921 (ListLongMap!20290 lt!581918))))

(declare-fun lt!581920 () Unit!42908)

(declare-fun lt!581919 () Unit!42908)

(assert (=> d!141153 (= lt!581920 lt!581919)))

(assert (=> d!141153 (= (getValueByKey!703 lt!581918 (_1!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!753 (_2!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141153 (= lt!581919 (lemmaContainsTupThenGetReturnValue!347 lt!581918 (_1!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141153 (= lt!581918 (insertStrictlySorted!476 (toList!10160 call!63929) (_1!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141153 (= (+!4498 call!63929 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!581921)))

(declare-fun b!1301521 () Bool)

(declare-fun res!864694 () Bool)

(assert (=> b!1301521 (=> (not res!864694) (not e!742368))))

(assert (=> b!1301521 (= res!864694 (= (getValueByKey!703 (toList!10160 lt!581921) (_1!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!753 (_2!11327 (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1301522 () Bool)

(assert (=> b!1301522 (= e!742368 (contains!8219 (toList!10160 lt!581921) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141153 res!864695) b!1301521))

(assert (= (and b!1301521 res!864694) b!1301522))

(declare-fun m!1191825 () Bool)

(assert (=> d!141153 m!1191825))

(declare-fun m!1191827 () Bool)

(assert (=> d!141153 m!1191827))

(declare-fun m!1191829 () Bool)

(assert (=> d!141153 m!1191829))

(declare-fun m!1191831 () Bool)

(assert (=> d!141153 m!1191831))

(declare-fun m!1191833 () Bool)

(assert (=> b!1301521 m!1191833))

(declare-fun m!1191835 () Bool)

(assert (=> b!1301522 m!1191835))

(assert (=> b!1301355 d!141153))

(declare-fun d!141155 () Bool)

(declare-fun e!742370 () Bool)

(assert (=> d!141155 e!742370))

(declare-fun res!864696 () Bool)

(assert (=> d!141155 (=> res!864696 e!742370)))

(declare-fun lt!581922 () Bool)

(assert (=> d!141155 (= res!864696 (not lt!581922))))

(declare-fun lt!581923 () Bool)

(assert (=> d!141155 (= lt!581922 lt!581923)))

(declare-fun lt!581925 () Unit!42908)

(declare-fun e!742369 () Unit!42908)

(assert (=> d!141155 (= lt!581925 e!742369)))

(declare-fun c!124782 () Bool)

(assert (=> d!141155 (= c!124782 lt!581923)))

(assert (=> d!141155 (= lt!581923 (containsKey!720 (toList!10160 (+!4498 lt!581795 (tuple2!22633 lt!581803 zeroValue!1387))) lt!581811))))

(assert (=> d!141155 (= (contains!8216 (+!4498 lt!581795 (tuple2!22633 lt!581803 zeroValue!1387)) lt!581811) lt!581922)))

(declare-fun b!1301523 () Bool)

(declare-fun lt!581924 () Unit!42908)

(assert (=> b!1301523 (= e!742369 lt!581924)))

(assert (=> b!1301523 (= lt!581924 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (+!4498 lt!581795 (tuple2!22633 lt!581803 zeroValue!1387))) lt!581811))))

(assert (=> b!1301523 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 lt!581795 (tuple2!22633 lt!581803 zeroValue!1387))) lt!581811))))

(declare-fun b!1301524 () Bool)

(declare-fun Unit!42924 () Unit!42908)

(assert (=> b!1301524 (= e!742369 Unit!42924)))

(declare-fun b!1301525 () Bool)

(assert (=> b!1301525 (= e!742370 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 lt!581795 (tuple2!22633 lt!581803 zeroValue!1387))) lt!581811)))))

(assert (= (and d!141155 c!124782) b!1301523))

(assert (= (and d!141155 (not c!124782)) b!1301524))

(assert (= (and d!141155 (not res!864696)) b!1301525))

(declare-fun m!1191837 () Bool)

(assert (=> d!141155 m!1191837))

(declare-fun m!1191839 () Bool)

(assert (=> b!1301523 m!1191839))

(declare-fun m!1191841 () Bool)

(assert (=> b!1301523 m!1191841))

(assert (=> b!1301523 m!1191841))

(declare-fun m!1191843 () Bool)

(assert (=> b!1301523 m!1191843))

(assert (=> b!1301525 m!1191841))

(assert (=> b!1301525 m!1191841))

(assert (=> b!1301525 m!1191843))

(assert (=> b!1301338 d!141155))

(declare-fun d!141157 () Bool)

(assert (=> d!141157 (contains!8216 (+!4498 lt!581795 (tuple2!22633 lt!581803 zeroValue!1387)) lt!581811)))

(declare-fun lt!581928 () Unit!42908)

(declare-fun choose!1916 (ListLongMap!20289 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!42908)

(assert (=> d!141157 (= lt!581928 (choose!1916 lt!581795 lt!581803 zeroValue!1387 lt!581811))))

(assert (=> d!141157 (contains!8216 lt!581795 lt!581811)))

(assert (=> d!141157 (= (addStillContains!1105 lt!581795 lt!581803 zeroValue!1387 lt!581811) lt!581928)))

(declare-fun bs!37029 () Bool)

(assert (= bs!37029 d!141157))

(assert (=> bs!37029 m!1191573))

(assert (=> bs!37029 m!1191573))

(assert (=> bs!37029 m!1191575))

(declare-fun m!1191845 () Bool)

(assert (=> bs!37029 m!1191845))

(declare-fun m!1191847 () Bool)

(assert (=> bs!37029 m!1191847))

(assert (=> b!1301338 d!141157))

(declare-fun d!141159 () Bool)

(assert (=> d!141159 (= (apply!1010 (+!4498 lt!581807 (tuple2!22633 lt!581805 minValue!1387)) lt!581814) (get!21139 (getValueByKey!703 (toList!10160 (+!4498 lt!581807 (tuple2!22633 lt!581805 minValue!1387))) lt!581814)))))

(declare-fun bs!37030 () Bool)

(assert (= bs!37030 d!141159))

(declare-fun m!1191849 () Bool)

(assert (=> bs!37030 m!1191849))

(assert (=> bs!37030 m!1191849))

(declare-fun m!1191851 () Bool)

(assert (=> bs!37030 m!1191851))

(assert (=> b!1301338 d!141159))

(declare-fun d!141161 () Bool)

(declare-fun e!742371 () Bool)

(assert (=> d!141161 e!742371))

(declare-fun res!864698 () Bool)

(assert (=> d!141161 (=> (not res!864698) (not e!742371))))

(declare-fun lt!581932 () ListLongMap!20289)

(assert (=> d!141161 (= res!864698 (contains!8216 lt!581932 (_1!11327 (tuple2!22633 lt!581805 minValue!1387))))))

(declare-fun lt!581929 () List!29750)

(assert (=> d!141161 (= lt!581932 (ListLongMap!20290 lt!581929))))

(declare-fun lt!581931 () Unit!42908)

(declare-fun lt!581930 () Unit!42908)

(assert (=> d!141161 (= lt!581931 lt!581930)))

(assert (=> d!141161 (= (getValueByKey!703 lt!581929 (_1!11327 (tuple2!22633 lt!581805 minValue!1387))) (Some!753 (_2!11327 (tuple2!22633 lt!581805 minValue!1387))))))

(assert (=> d!141161 (= lt!581930 (lemmaContainsTupThenGetReturnValue!347 lt!581929 (_1!11327 (tuple2!22633 lt!581805 minValue!1387)) (_2!11327 (tuple2!22633 lt!581805 minValue!1387))))))

(assert (=> d!141161 (= lt!581929 (insertStrictlySorted!476 (toList!10160 lt!581807) (_1!11327 (tuple2!22633 lt!581805 minValue!1387)) (_2!11327 (tuple2!22633 lt!581805 minValue!1387))))))

(assert (=> d!141161 (= (+!4498 lt!581807 (tuple2!22633 lt!581805 minValue!1387)) lt!581932)))

(declare-fun b!1301527 () Bool)

(declare-fun res!864697 () Bool)

(assert (=> b!1301527 (=> (not res!864697) (not e!742371))))

(assert (=> b!1301527 (= res!864697 (= (getValueByKey!703 (toList!10160 lt!581932) (_1!11327 (tuple2!22633 lt!581805 minValue!1387))) (Some!753 (_2!11327 (tuple2!22633 lt!581805 minValue!1387)))))))

(declare-fun b!1301528 () Bool)

(assert (=> b!1301528 (= e!742371 (contains!8219 (toList!10160 lt!581932) (tuple2!22633 lt!581805 minValue!1387)))))

(assert (= (and d!141161 res!864698) b!1301527))

(assert (= (and b!1301527 res!864697) b!1301528))

(declare-fun m!1191853 () Bool)

(assert (=> d!141161 m!1191853))

(declare-fun m!1191855 () Bool)

(assert (=> d!141161 m!1191855))

(declare-fun m!1191857 () Bool)

(assert (=> d!141161 m!1191857))

(declare-fun m!1191859 () Bool)

(assert (=> d!141161 m!1191859))

(declare-fun m!1191861 () Bool)

(assert (=> b!1301527 m!1191861))

(declare-fun m!1191863 () Bool)

(assert (=> b!1301528 m!1191863))

(assert (=> b!1301338 d!141161))

(declare-fun d!141163 () Bool)

(assert (=> d!141163 (= (apply!1010 lt!581807 lt!581814) (get!21139 (getValueByKey!703 (toList!10160 lt!581807) lt!581814)))))

(declare-fun bs!37031 () Bool)

(assert (= bs!37031 d!141163))

(declare-fun m!1191865 () Bool)

(assert (=> bs!37031 m!1191865))

(assert (=> bs!37031 m!1191865))

(declare-fun m!1191867 () Bool)

(assert (=> bs!37031 m!1191867))

(assert (=> b!1301338 d!141163))

(declare-fun d!141165 () Bool)

(assert (=> d!141165 (= (apply!1010 lt!581806 lt!581808) (get!21139 (getValueByKey!703 (toList!10160 lt!581806) lt!581808)))))

(declare-fun bs!37032 () Bool)

(assert (= bs!37032 d!141165))

(declare-fun m!1191869 () Bool)

(assert (=> bs!37032 m!1191869))

(assert (=> bs!37032 m!1191869))

(declare-fun m!1191871 () Bool)

(assert (=> bs!37032 m!1191871))

(assert (=> b!1301338 d!141165))

(assert (=> b!1301338 d!141093))

(declare-fun d!141167 () Bool)

(assert (=> d!141167 (= (apply!1010 (+!4498 lt!581807 (tuple2!22633 lt!581805 minValue!1387)) lt!581814) (apply!1010 lt!581807 lt!581814))))

(declare-fun lt!581935 () Unit!42908)

(declare-fun choose!1917 (ListLongMap!20289 (_ BitVec 64) V!51577 (_ BitVec 64)) Unit!42908)

(assert (=> d!141167 (= lt!581935 (choose!1917 lt!581807 lt!581805 minValue!1387 lt!581814))))

(declare-fun e!742374 () Bool)

(assert (=> d!141167 e!742374))

(declare-fun res!864701 () Bool)

(assert (=> d!141167 (=> (not res!864701) (not e!742374))))

(assert (=> d!141167 (= res!864701 (contains!8216 lt!581807 lt!581814))))

(assert (=> d!141167 (= (addApplyDifferent!548 lt!581807 lt!581805 minValue!1387 lt!581814) lt!581935)))

(declare-fun b!1301532 () Bool)

(assert (=> b!1301532 (= e!742374 (not (= lt!581814 lt!581805)))))

(assert (= (and d!141167 res!864701) b!1301532))

(declare-fun m!1191873 () Bool)

(assert (=> d!141167 m!1191873))

(assert (=> d!141167 m!1191581))

(assert (=> d!141167 m!1191583))

(declare-fun m!1191875 () Bool)

(assert (=> d!141167 m!1191875))

(assert (=> d!141167 m!1191581))

(assert (=> d!141167 m!1191597))

(assert (=> b!1301338 d!141167))

(declare-fun d!141169 () Bool)

(declare-fun e!742375 () Bool)

(assert (=> d!141169 e!742375))

(declare-fun res!864703 () Bool)

(assert (=> d!141169 (=> (not res!864703) (not e!742375))))

(declare-fun lt!581939 () ListLongMap!20289)

(assert (=> d!141169 (= res!864703 (contains!8216 lt!581939 (_1!11327 (tuple2!22633 lt!581798 zeroValue!1387))))))

(declare-fun lt!581936 () List!29750)

(assert (=> d!141169 (= lt!581939 (ListLongMap!20290 lt!581936))))

(declare-fun lt!581938 () Unit!42908)

(declare-fun lt!581937 () Unit!42908)

(assert (=> d!141169 (= lt!581938 lt!581937)))

(assert (=> d!141169 (= (getValueByKey!703 lt!581936 (_1!11327 (tuple2!22633 lt!581798 zeroValue!1387))) (Some!753 (_2!11327 (tuple2!22633 lt!581798 zeroValue!1387))))))

(assert (=> d!141169 (= lt!581937 (lemmaContainsTupThenGetReturnValue!347 lt!581936 (_1!11327 (tuple2!22633 lt!581798 zeroValue!1387)) (_2!11327 (tuple2!22633 lt!581798 zeroValue!1387))))))

(assert (=> d!141169 (= lt!581936 (insertStrictlySorted!476 (toList!10160 lt!581815) (_1!11327 (tuple2!22633 lt!581798 zeroValue!1387)) (_2!11327 (tuple2!22633 lt!581798 zeroValue!1387))))))

(assert (=> d!141169 (= (+!4498 lt!581815 (tuple2!22633 lt!581798 zeroValue!1387)) lt!581939)))

(declare-fun b!1301533 () Bool)

(declare-fun res!864702 () Bool)

(assert (=> b!1301533 (=> (not res!864702) (not e!742375))))

(assert (=> b!1301533 (= res!864702 (= (getValueByKey!703 (toList!10160 lt!581939) (_1!11327 (tuple2!22633 lt!581798 zeroValue!1387))) (Some!753 (_2!11327 (tuple2!22633 lt!581798 zeroValue!1387)))))))

(declare-fun b!1301534 () Bool)

(assert (=> b!1301534 (= e!742375 (contains!8219 (toList!10160 lt!581939) (tuple2!22633 lt!581798 zeroValue!1387)))))

(assert (= (and d!141169 res!864703) b!1301533))

(assert (= (and b!1301533 res!864702) b!1301534))

(declare-fun m!1191877 () Bool)

(assert (=> d!141169 m!1191877))

(declare-fun m!1191879 () Bool)

(assert (=> d!141169 m!1191879))

(declare-fun m!1191881 () Bool)

(assert (=> d!141169 m!1191881))

(declare-fun m!1191883 () Bool)

(assert (=> d!141169 m!1191883))

(declare-fun m!1191885 () Bool)

(assert (=> b!1301533 m!1191885))

(declare-fun m!1191887 () Bool)

(assert (=> b!1301534 m!1191887))

(assert (=> b!1301338 d!141169))

(declare-fun d!141171 () Bool)

(declare-fun e!742376 () Bool)

(assert (=> d!141171 e!742376))

(declare-fun res!864705 () Bool)

(assert (=> d!141171 (=> (not res!864705) (not e!742376))))

(declare-fun lt!581943 () ListLongMap!20289)

(assert (=> d!141171 (= res!864705 (contains!8216 lt!581943 (_1!11327 (tuple2!22633 lt!581803 zeroValue!1387))))))

(declare-fun lt!581940 () List!29750)

(assert (=> d!141171 (= lt!581943 (ListLongMap!20290 lt!581940))))

(declare-fun lt!581942 () Unit!42908)

(declare-fun lt!581941 () Unit!42908)

(assert (=> d!141171 (= lt!581942 lt!581941)))

(assert (=> d!141171 (= (getValueByKey!703 lt!581940 (_1!11327 (tuple2!22633 lt!581803 zeroValue!1387))) (Some!753 (_2!11327 (tuple2!22633 lt!581803 zeroValue!1387))))))

(assert (=> d!141171 (= lt!581941 (lemmaContainsTupThenGetReturnValue!347 lt!581940 (_1!11327 (tuple2!22633 lt!581803 zeroValue!1387)) (_2!11327 (tuple2!22633 lt!581803 zeroValue!1387))))))

(assert (=> d!141171 (= lt!581940 (insertStrictlySorted!476 (toList!10160 lt!581795) (_1!11327 (tuple2!22633 lt!581803 zeroValue!1387)) (_2!11327 (tuple2!22633 lt!581803 zeroValue!1387))))))

(assert (=> d!141171 (= (+!4498 lt!581795 (tuple2!22633 lt!581803 zeroValue!1387)) lt!581943)))

(declare-fun b!1301535 () Bool)

(declare-fun res!864704 () Bool)

(assert (=> b!1301535 (=> (not res!864704) (not e!742376))))

(assert (=> b!1301535 (= res!864704 (= (getValueByKey!703 (toList!10160 lt!581943) (_1!11327 (tuple2!22633 lt!581803 zeroValue!1387))) (Some!753 (_2!11327 (tuple2!22633 lt!581803 zeroValue!1387)))))))

(declare-fun b!1301536 () Bool)

(assert (=> b!1301536 (= e!742376 (contains!8219 (toList!10160 lt!581943) (tuple2!22633 lt!581803 zeroValue!1387)))))

(assert (= (and d!141171 res!864705) b!1301535))

(assert (= (and b!1301535 res!864704) b!1301536))

(declare-fun m!1191889 () Bool)

(assert (=> d!141171 m!1191889))

(declare-fun m!1191891 () Bool)

(assert (=> d!141171 m!1191891))

(declare-fun m!1191893 () Bool)

(assert (=> d!141171 m!1191893))

(declare-fun m!1191895 () Bool)

(assert (=> d!141171 m!1191895))

(declare-fun m!1191897 () Bool)

(assert (=> b!1301535 m!1191897))

(declare-fun m!1191899 () Bool)

(assert (=> b!1301536 m!1191899))

(assert (=> b!1301338 d!141171))

(declare-fun d!141173 () Bool)

(assert (=> d!141173 (= (apply!1010 (+!4498 lt!581806 (tuple2!22633 lt!581804 minValue!1387)) lt!581808) (get!21139 (getValueByKey!703 (toList!10160 (+!4498 lt!581806 (tuple2!22633 lt!581804 minValue!1387))) lt!581808)))))

(declare-fun bs!37033 () Bool)

(assert (= bs!37033 d!141173))

(declare-fun m!1191901 () Bool)

(assert (=> bs!37033 m!1191901))

(assert (=> bs!37033 m!1191901))

(declare-fun m!1191903 () Bool)

(assert (=> bs!37033 m!1191903))

(assert (=> b!1301338 d!141173))

(declare-fun d!141175 () Bool)

(assert (=> d!141175 (= (apply!1010 (+!4498 lt!581815 (tuple2!22633 lt!581798 zeroValue!1387)) lt!581801) (apply!1010 lt!581815 lt!581801))))

(declare-fun lt!581944 () Unit!42908)

(assert (=> d!141175 (= lt!581944 (choose!1917 lt!581815 lt!581798 zeroValue!1387 lt!581801))))

(declare-fun e!742377 () Bool)

(assert (=> d!141175 e!742377))

(declare-fun res!864706 () Bool)

(assert (=> d!141175 (=> (not res!864706) (not e!742377))))

(assert (=> d!141175 (= res!864706 (contains!8216 lt!581815 lt!581801))))

(assert (=> d!141175 (= (addApplyDifferent!548 lt!581815 lt!581798 zeroValue!1387 lt!581801) lt!581944)))

(declare-fun b!1301537 () Bool)

(assert (=> b!1301537 (= e!742377 (not (= lt!581801 lt!581798)))))

(assert (= (and d!141175 res!864706) b!1301537))

(declare-fun m!1191905 () Bool)

(assert (=> d!141175 m!1191905))

(assert (=> d!141175 m!1191593))

(assert (=> d!141175 m!1191595))

(declare-fun m!1191907 () Bool)

(assert (=> d!141175 m!1191907))

(assert (=> d!141175 m!1191593))

(assert (=> d!141175 m!1191599))

(assert (=> b!1301338 d!141175))

(declare-fun d!141177 () Bool)

(declare-fun e!742378 () Bool)

(assert (=> d!141177 e!742378))

(declare-fun res!864708 () Bool)

(assert (=> d!141177 (=> (not res!864708) (not e!742378))))

(declare-fun lt!581948 () ListLongMap!20289)

(assert (=> d!141177 (= res!864708 (contains!8216 lt!581948 (_1!11327 (tuple2!22633 lt!581804 minValue!1387))))))

(declare-fun lt!581945 () List!29750)

(assert (=> d!141177 (= lt!581948 (ListLongMap!20290 lt!581945))))

(declare-fun lt!581947 () Unit!42908)

(declare-fun lt!581946 () Unit!42908)

(assert (=> d!141177 (= lt!581947 lt!581946)))

(assert (=> d!141177 (= (getValueByKey!703 lt!581945 (_1!11327 (tuple2!22633 lt!581804 minValue!1387))) (Some!753 (_2!11327 (tuple2!22633 lt!581804 minValue!1387))))))

(assert (=> d!141177 (= lt!581946 (lemmaContainsTupThenGetReturnValue!347 lt!581945 (_1!11327 (tuple2!22633 lt!581804 minValue!1387)) (_2!11327 (tuple2!22633 lt!581804 minValue!1387))))))

(assert (=> d!141177 (= lt!581945 (insertStrictlySorted!476 (toList!10160 lt!581806) (_1!11327 (tuple2!22633 lt!581804 minValue!1387)) (_2!11327 (tuple2!22633 lt!581804 minValue!1387))))))

(assert (=> d!141177 (= (+!4498 lt!581806 (tuple2!22633 lt!581804 minValue!1387)) lt!581948)))

(declare-fun b!1301538 () Bool)

(declare-fun res!864707 () Bool)

(assert (=> b!1301538 (=> (not res!864707) (not e!742378))))

(assert (=> b!1301538 (= res!864707 (= (getValueByKey!703 (toList!10160 lt!581948) (_1!11327 (tuple2!22633 lt!581804 minValue!1387))) (Some!753 (_2!11327 (tuple2!22633 lt!581804 minValue!1387)))))))

(declare-fun b!1301539 () Bool)

(assert (=> b!1301539 (= e!742378 (contains!8219 (toList!10160 lt!581948) (tuple2!22633 lt!581804 minValue!1387)))))

(assert (= (and d!141177 res!864708) b!1301538))

(assert (= (and b!1301538 res!864707) b!1301539))

(declare-fun m!1191909 () Bool)

(assert (=> d!141177 m!1191909))

(declare-fun m!1191911 () Bool)

(assert (=> d!141177 m!1191911))

(declare-fun m!1191913 () Bool)

(assert (=> d!141177 m!1191913))

(declare-fun m!1191915 () Bool)

(assert (=> d!141177 m!1191915))

(declare-fun m!1191917 () Bool)

(assert (=> b!1301538 m!1191917))

(declare-fun m!1191919 () Bool)

(assert (=> b!1301539 m!1191919))

(assert (=> b!1301338 d!141177))

(declare-fun d!141179 () Bool)

(assert (=> d!141179 (= (apply!1010 (+!4498 lt!581806 (tuple2!22633 lt!581804 minValue!1387)) lt!581808) (apply!1010 lt!581806 lt!581808))))

(declare-fun lt!581949 () Unit!42908)

(assert (=> d!141179 (= lt!581949 (choose!1917 lt!581806 lt!581804 minValue!1387 lt!581808))))

(declare-fun e!742379 () Bool)

(assert (=> d!141179 e!742379))

(declare-fun res!864709 () Bool)

(assert (=> d!141179 (=> (not res!864709) (not e!742379))))

(assert (=> d!141179 (= res!864709 (contains!8216 lt!581806 lt!581808))))

(assert (=> d!141179 (= (addApplyDifferent!548 lt!581806 lt!581804 minValue!1387 lt!581808) lt!581949)))

(declare-fun b!1301540 () Bool)

(assert (=> b!1301540 (= e!742379 (not (= lt!581808 lt!581804)))))

(assert (= (and d!141179 res!864709) b!1301540))

(declare-fun m!1191921 () Bool)

(assert (=> d!141179 m!1191921))

(assert (=> d!141179 m!1191585))

(assert (=> d!141179 m!1191587))

(declare-fun m!1191923 () Bool)

(assert (=> d!141179 m!1191923))

(assert (=> d!141179 m!1191585))

(assert (=> d!141179 m!1191571))

(assert (=> b!1301338 d!141179))

(declare-fun d!141181 () Bool)

(assert (=> d!141181 (= (apply!1010 lt!581815 lt!581801) (get!21139 (getValueByKey!703 (toList!10160 lt!581815) lt!581801)))))

(declare-fun bs!37034 () Bool)

(assert (= bs!37034 d!141181))

(declare-fun m!1191925 () Bool)

(assert (=> bs!37034 m!1191925))

(assert (=> bs!37034 m!1191925))

(declare-fun m!1191927 () Bool)

(assert (=> bs!37034 m!1191927))

(assert (=> b!1301338 d!141181))

(declare-fun d!141183 () Bool)

(assert (=> d!141183 (= (apply!1010 (+!4498 lt!581815 (tuple2!22633 lt!581798 zeroValue!1387)) lt!581801) (get!21139 (getValueByKey!703 (toList!10160 (+!4498 lt!581815 (tuple2!22633 lt!581798 zeroValue!1387))) lt!581801)))))

(declare-fun bs!37035 () Bool)

(assert (= bs!37035 d!141183))

(declare-fun m!1191929 () Bool)

(assert (=> bs!37035 m!1191929))

(assert (=> bs!37035 m!1191929))

(declare-fun m!1191931 () Bool)

(assert (=> bs!37035 m!1191931))

(assert (=> b!1301338 d!141183))

(assert (=> d!141109 d!141107))

(declare-fun d!141185 () Bool)

(assert (=> d!141185 (not (contains!8216 (ListLongMap!20290 Nil!29747) k0!1205))))

(assert (=> d!141185 true))

(declare-fun _$29!192 () Unit!42908)

(assert (=> d!141185 (= (choose!1914 k0!1205) _$29!192)))

(declare-fun bs!37036 () Bool)

(assert (= bs!37036 d!141185))

(assert (=> bs!37036 m!1191425))

(assert (=> d!141109 d!141185))

(assert (=> b!1301361 d!141123))

(assert (=> b!1301361 d!141125))

(declare-fun d!141187 () Bool)

(assert (=> d!141187 (= (apply!1010 lt!581812 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21139 (getValueByKey!703 (toList!10160 lt!581812) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37037 () Bool)

(assert (= bs!37037 d!141187))

(declare-fun m!1191933 () Bool)

(assert (=> bs!37037 m!1191933))

(assert (=> bs!37037 m!1191933))

(declare-fun m!1191935 () Bool)

(assert (=> bs!37037 m!1191935))

(assert (=> b!1301337 d!141187))

(declare-fun d!141189 () Bool)

(declare-fun e!742380 () Bool)

(assert (=> d!141189 e!742380))

(declare-fun res!864711 () Bool)

(assert (=> d!141189 (=> (not res!864711) (not e!742380))))

(declare-fun lt!581953 () ListLongMap!20289)

(assert (=> d!141189 (= res!864711 (contains!8216 lt!581953 (_1!11327 (tuple2!22633 lt!581854 lt!581859))))))

(declare-fun lt!581950 () List!29750)

(assert (=> d!141189 (= lt!581953 (ListLongMap!20290 lt!581950))))

(declare-fun lt!581952 () Unit!42908)

(declare-fun lt!581951 () Unit!42908)

(assert (=> d!141189 (= lt!581952 lt!581951)))

(assert (=> d!141189 (= (getValueByKey!703 lt!581950 (_1!11327 (tuple2!22633 lt!581854 lt!581859))) (Some!753 (_2!11327 (tuple2!22633 lt!581854 lt!581859))))))

(assert (=> d!141189 (= lt!581951 (lemmaContainsTupThenGetReturnValue!347 lt!581950 (_1!11327 (tuple2!22633 lt!581854 lt!581859)) (_2!11327 (tuple2!22633 lt!581854 lt!581859))))))

(assert (=> d!141189 (= lt!581950 (insertStrictlySorted!476 (toList!10160 lt!581858) (_1!11327 (tuple2!22633 lt!581854 lt!581859)) (_2!11327 (tuple2!22633 lt!581854 lt!581859))))))

(assert (=> d!141189 (= (+!4498 lt!581858 (tuple2!22633 lt!581854 lt!581859)) lt!581953)))

(declare-fun b!1301541 () Bool)

(declare-fun res!864710 () Bool)

(assert (=> b!1301541 (=> (not res!864710) (not e!742380))))

(assert (=> b!1301541 (= res!864710 (= (getValueByKey!703 (toList!10160 lt!581953) (_1!11327 (tuple2!22633 lt!581854 lt!581859))) (Some!753 (_2!11327 (tuple2!22633 lt!581854 lt!581859)))))))

(declare-fun b!1301542 () Bool)

(assert (=> b!1301542 (= e!742380 (contains!8219 (toList!10160 lt!581953) (tuple2!22633 lt!581854 lt!581859)))))

(assert (= (and d!141189 res!864711) b!1301541))

(assert (= (and b!1301541 res!864710) b!1301542))

(declare-fun m!1191937 () Bool)

(assert (=> d!141189 m!1191937))

(declare-fun m!1191939 () Bool)

(assert (=> d!141189 m!1191939))

(declare-fun m!1191941 () Bool)

(assert (=> d!141189 m!1191941))

(declare-fun m!1191943 () Bool)

(assert (=> d!141189 m!1191943))

(declare-fun m!1191945 () Bool)

(assert (=> b!1301541 m!1191945))

(declare-fun m!1191947 () Bool)

(assert (=> b!1301542 m!1191947))

(assert (=> b!1301408 d!141189))

(declare-fun d!141191 () Bool)

(declare-fun e!742382 () Bool)

(assert (=> d!141191 e!742382))

(declare-fun res!864712 () Bool)

(assert (=> d!141191 (=> res!864712 e!742382)))

(declare-fun lt!581954 () Bool)

(assert (=> d!141191 (= res!864712 (not lt!581954))))

(declare-fun lt!581955 () Bool)

(assert (=> d!141191 (= lt!581954 lt!581955)))

(declare-fun lt!581957 () Unit!42908)

(declare-fun e!742381 () Unit!42908)

(assert (=> d!141191 (= lt!581957 e!742381)))

(declare-fun c!124783 () Bool)

(assert (=> d!141191 (= c!124783 lt!581955)))

(assert (=> d!141191 (= lt!581955 (containsKey!720 (toList!10160 (+!4498 lt!581858 (tuple2!22633 lt!581854 lt!581859))) lt!581853))))

(assert (=> d!141191 (= (contains!8216 (+!4498 lt!581858 (tuple2!22633 lt!581854 lt!581859)) lt!581853) lt!581954)))

(declare-fun b!1301543 () Bool)

(declare-fun lt!581956 () Unit!42908)

(assert (=> b!1301543 (= e!742381 lt!581956)))

(assert (=> b!1301543 (= lt!581956 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (+!4498 lt!581858 (tuple2!22633 lt!581854 lt!581859))) lt!581853))))

(assert (=> b!1301543 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 lt!581858 (tuple2!22633 lt!581854 lt!581859))) lt!581853))))

(declare-fun b!1301544 () Bool)

(declare-fun Unit!42925 () Unit!42908)

(assert (=> b!1301544 (= e!742381 Unit!42925)))

(declare-fun b!1301545 () Bool)

(assert (=> b!1301545 (= e!742382 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 lt!581858 (tuple2!22633 lt!581854 lt!581859))) lt!581853)))))

(assert (= (and d!141191 c!124783) b!1301543))

(assert (= (and d!141191 (not c!124783)) b!1301544))

(assert (= (and d!141191 (not res!864712)) b!1301545))

(declare-fun m!1191949 () Bool)

(assert (=> d!141191 m!1191949))

(declare-fun m!1191951 () Bool)

(assert (=> b!1301543 m!1191951))

(declare-fun m!1191953 () Bool)

(assert (=> b!1301543 m!1191953))

(assert (=> b!1301543 m!1191953))

(declare-fun m!1191955 () Bool)

(assert (=> b!1301543 m!1191955))

(assert (=> b!1301545 m!1191953))

(assert (=> b!1301545 m!1191953))

(assert (=> b!1301545 m!1191955))

(assert (=> b!1301408 d!141191))

(declare-fun d!141193 () Bool)

(declare-fun e!742383 () Bool)

(assert (=> d!141193 e!742383))

(declare-fun res!864714 () Bool)

(assert (=> d!141193 (=> (not res!864714) (not e!742383))))

(declare-fun lt!581961 () ListLongMap!20289)

(assert (=> d!141193 (= res!864714 (contains!8216 lt!581961 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!581958 () List!29750)

(assert (=> d!141193 (= lt!581961 (ListLongMap!20290 lt!581958))))

(declare-fun lt!581960 () Unit!42908)

(declare-fun lt!581959 () Unit!42908)

(assert (=> d!141193 (= lt!581960 lt!581959)))

(assert (=> d!141193 (= (getValueByKey!703 lt!581958 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!753 (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141193 (= lt!581959 (lemmaContainsTupThenGetReturnValue!347 lt!581958 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141193 (= lt!581958 (insertStrictlySorted!476 (toList!10160 call!63935) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141193 (= (+!4498 call!63935 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!581961)))

(declare-fun b!1301546 () Bool)

(declare-fun res!864713 () Bool)

(assert (=> b!1301546 (=> (not res!864713) (not e!742383))))

(assert (=> b!1301546 (= res!864713 (= (getValueByKey!703 (toList!10160 lt!581961) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!753 (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1301547 () Bool)

(assert (=> b!1301547 (= e!742383 (contains!8219 (toList!10160 lt!581961) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) (get!21134 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141193 res!864714) b!1301546))

(assert (= (and b!1301546 res!864713) b!1301547))

(declare-fun m!1191957 () Bool)

(assert (=> d!141193 m!1191957))

(declare-fun m!1191959 () Bool)

(assert (=> d!141193 m!1191959))

(declare-fun m!1191961 () Bool)

(assert (=> d!141193 m!1191961))

(declare-fun m!1191963 () Bool)

(assert (=> d!141193 m!1191963))

(declare-fun m!1191965 () Bool)

(assert (=> b!1301546 m!1191965))

(declare-fun m!1191967 () Bool)

(assert (=> b!1301547 m!1191967))

(assert (=> b!1301408 d!141193))

(declare-fun d!141195 () Bool)

(assert (=> d!141195 (not (contains!8216 (+!4498 lt!581858 (tuple2!22633 lt!581854 lt!581859)) lt!581853))))

(declare-fun lt!581962 () Unit!42908)

(assert (=> d!141195 (= lt!581962 (choose!1912 lt!581858 lt!581854 lt!581859 lt!581853))))

(declare-fun e!742384 () Bool)

(assert (=> d!141195 e!742384))

(declare-fun res!864715 () Bool)

(assert (=> d!141195 (=> (not res!864715) (not e!742384))))

(assert (=> d!141195 (= res!864715 (not (contains!8216 lt!581858 lt!581853)))))

(assert (=> d!141195 (= (addStillNotContains!453 lt!581858 lt!581854 lt!581859 lt!581853) lt!581962)))

(declare-fun b!1301548 () Bool)

(assert (=> b!1301548 (= e!742384 (not (= lt!581854 lt!581853)))))

(assert (= (and d!141195 res!864715) b!1301548))

(assert (=> d!141195 m!1191649))

(assert (=> d!141195 m!1191649))

(assert (=> d!141195 m!1191651))

(declare-fun m!1191969 () Bool)

(assert (=> d!141195 m!1191969))

(declare-fun m!1191971 () Bool)

(assert (=> d!141195 m!1191971))

(assert (=> b!1301408 d!141195))

(assert (=> b!1301408 d!141091))

(declare-fun d!141197 () Bool)

(assert (=> d!141197 (= (isDefined!510 (getValueByKey!703 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205)) (not (isEmpty!1060 (getValueByKey!703 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205))))))

(declare-fun bs!37038 () Bool)

(assert (= bs!37038 d!141197))

(assert (=> bs!37038 m!1191615))

(declare-fun m!1191973 () Bool)

(assert (=> bs!37038 m!1191973))

(assert (=> b!1301358 d!141197))

(declare-fun e!742385 () Option!754)

(declare-fun b!1301549 () Bool)

(assert (=> b!1301549 (= e!742385 (Some!753 (_2!11327 (h!30955 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)))))))))

(declare-fun b!1301550 () Bool)

(declare-fun e!742386 () Option!754)

(assert (=> b!1301550 (= e!742385 e!742386)))

(declare-fun c!124785 () Bool)

(assert (=> b!1301550 (= c!124785 (and ((_ is Cons!29746) (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)))) (not (= (_1!11327 (h!30955 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))))) k0!1205))))))

(declare-fun b!1301552 () Bool)

(assert (=> b!1301552 (= e!742386 None!752)))

(declare-fun b!1301551 () Bool)

(assert (=> b!1301551 (= e!742386 (getValueByKey!703 (t!43318 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)))) k0!1205))))

(declare-fun d!141199 () Bool)

(declare-fun c!124784 () Bool)

(assert (=> d!141199 (= c!124784 (and ((_ is Cons!29746) (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)))) (= (_1!11327 (h!30955 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))))) k0!1205)))))

(assert (=> d!141199 (= (getValueByKey!703 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205) e!742385)))

(assert (= (and d!141199 c!124784) b!1301549))

(assert (= (and d!141199 (not c!124784)) b!1301550))

(assert (= (and b!1301550 c!124785) b!1301551))

(assert (= (and b!1301550 (not c!124785)) b!1301552))

(declare-fun m!1191975 () Bool)

(assert (=> b!1301551 m!1191975))

(assert (=> b!1301358 d!141199))

(declare-fun d!141201 () Bool)

(assert (=> d!141201 (= (validKeyInArray!0 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301447 d!141201))

(declare-fun d!141203 () Bool)

(assert (=> d!141203 (isDefined!510 (getValueByKey!703 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205))))

(declare-fun lt!581963 () Unit!42908)

(assert (=> d!141203 (= lt!581963 (choose!1915 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205))))

(declare-fun e!742387 () Bool)

(assert (=> d!141203 e!742387))

(declare-fun res!864716 () Bool)

(assert (=> d!141203 (=> (not res!864716) (not e!742387))))

(assert (=> d!141203 (= res!864716 (isStrictlySorted!867 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)))))))

(assert (=> d!141203 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205) lt!581963)))

(declare-fun b!1301553 () Bool)

(assert (=> b!1301553 (= e!742387 (containsKey!720 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205))))

(assert (= (and d!141203 res!864716) b!1301553))

(assert (=> d!141203 m!1191615))

(assert (=> d!141203 m!1191615))

(assert (=> d!141203 m!1191617))

(declare-fun m!1191977 () Bool)

(assert (=> d!141203 m!1191977))

(declare-fun m!1191979 () Bool)

(assert (=> d!141203 m!1191979))

(assert (=> b!1301553 m!1191611))

(assert (=> b!1301356 d!141203))

(assert (=> b!1301356 d!141197))

(assert (=> b!1301356 d!141199))

(assert (=> b!1301354 d!141105))

(declare-fun lt!581966 () Bool)

(declare-fun d!141205 () Bool)

(declare-fun content!642 (List!29750) (InoxSet tuple2!22632))

(assert (=> d!141205 (= lt!581966 (select (content!642 (toList!10160 lt!581835)) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))

(declare-fun e!742392 () Bool)

(assert (=> d!141205 (= lt!581966 e!742392)))

(declare-fun res!864722 () Bool)

(assert (=> d!141205 (=> (not res!864722) (not e!742392))))

(assert (=> d!141205 (= res!864722 ((_ is Cons!29746) (toList!10160 lt!581835)))))

(assert (=> d!141205 (= (contains!8219 (toList!10160 lt!581835) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) lt!581966)))

(declare-fun b!1301558 () Bool)

(declare-fun e!742393 () Bool)

(assert (=> b!1301558 (= e!742392 e!742393)))

(declare-fun res!864721 () Bool)

(assert (=> b!1301558 (=> res!864721 e!742393)))

(assert (=> b!1301558 (= res!864721 (= (h!30955 (toList!10160 lt!581835)) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))

(declare-fun b!1301559 () Bool)

(assert (=> b!1301559 (= e!742393 (contains!8219 (t!43318 (toList!10160 lt!581835)) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))

(assert (= (and d!141205 res!864722) b!1301558))

(assert (= (and b!1301558 (not res!864721)) b!1301559))

(declare-fun m!1191981 () Bool)

(assert (=> d!141205 m!1191981))

(declare-fun m!1191983 () Bool)

(assert (=> d!141205 m!1191983))

(declare-fun m!1191985 () Bool)

(assert (=> b!1301559 m!1191985))

(assert (=> b!1301367 d!141205))

(declare-fun d!141207 () Bool)

(declare-fun e!742394 () Bool)

(assert (=> d!141207 e!742394))

(declare-fun res!864724 () Bool)

(assert (=> d!141207 (=> (not res!864724) (not e!742394))))

(declare-fun lt!581970 () ListLongMap!20289)

(assert (=> d!141207 (= res!864724 (contains!8216 lt!581970 (_1!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!581967 () List!29750)

(assert (=> d!141207 (= lt!581970 (ListLongMap!20290 lt!581967))))

(declare-fun lt!581969 () Unit!42908)

(declare-fun lt!581968 () Unit!42908)

(assert (=> d!141207 (= lt!581969 lt!581968)))

(assert (=> d!141207 (= (getValueByKey!703 lt!581967 (_1!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!753 (_2!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141207 (= lt!581968 (lemmaContainsTupThenGetReturnValue!347 lt!581967 (_1!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141207 (= lt!581967 (insertStrictlySorted!476 (toList!10160 (ite c!124734 call!63928 (ite c!124733 call!63926 call!63930))) (_1!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141207 (= (+!4498 (ite c!124734 call!63928 (ite c!124733 call!63926 call!63930)) (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!581970)))

(declare-fun b!1301560 () Bool)

(declare-fun res!864723 () Bool)

(assert (=> b!1301560 (=> (not res!864723) (not e!742394))))

(assert (=> b!1301560 (= res!864723 (= (getValueByKey!703 (toList!10160 lt!581970) (_1!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!753 (_2!11327 (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1301561 () Bool)

(assert (=> b!1301561 (= e!742394 (contains!8219 (toList!10160 lt!581970) (ite (or c!124734 c!124733) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22633 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141207 res!864724) b!1301560))

(assert (= (and b!1301560 res!864723) b!1301561))

(declare-fun m!1191987 () Bool)

(assert (=> d!141207 m!1191987))

(declare-fun m!1191989 () Bool)

(assert (=> d!141207 m!1191989))

(declare-fun m!1191991 () Bool)

(assert (=> d!141207 m!1191991))

(declare-fun m!1191993 () Bool)

(assert (=> d!141207 m!1191993))

(declare-fun m!1191995 () Bool)

(assert (=> b!1301560 m!1191995))

(declare-fun m!1191997 () Bool)

(assert (=> b!1301561 m!1191997))

(assert (=> bm!63927 d!141207))

(declare-fun d!141209 () Bool)

(assert (=> d!141209 (= (get!21137 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!20109 (select (arr!41807 _values!1445) from!2144)))))

(assert (=> b!1301376 d!141209))

(declare-fun d!141211 () Bool)

(declare-fun e!742396 () Bool)

(assert (=> d!141211 e!742396))

(declare-fun res!864725 () Bool)

(assert (=> d!141211 (=> res!864725 e!742396)))

(declare-fun lt!581971 () Bool)

(assert (=> d!141211 (= res!864725 (not lt!581971))))

(declare-fun lt!581972 () Bool)

(assert (=> d!141211 (= lt!581971 lt!581972)))

(declare-fun lt!581974 () Unit!42908)

(declare-fun e!742395 () Unit!42908)

(assert (=> d!141211 (= lt!581974 e!742395)))

(declare-fun c!124786 () Bool)

(assert (=> d!141211 (= c!124786 lt!581972)))

(assert (=> d!141211 (= lt!581972 (containsKey!720 (toList!10160 lt!581856) (select (arr!41808 _keys!1741) from!2144)))))

(assert (=> d!141211 (= (contains!8216 lt!581856 (select (arr!41808 _keys!1741) from!2144)) lt!581971)))

(declare-fun b!1301562 () Bool)

(declare-fun lt!581973 () Unit!42908)

(assert (=> b!1301562 (= e!742395 lt!581973)))

(assert (=> b!1301562 (= lt!581973 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581856) (select (arr!41808 _keys!1741) from!2144)))))

(assert (=> b!1301562 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581856) (select (arr!41808 _keys!1741) from!2144)))))

(declare-fun b!1301563 () Bool)

(declare-fun Unit!42926 () Unit!42908)

(assert (=> b!1301563 (= e!742395 Unit!42926)))

(declare-fun b!1301564 () Bool)

(assert (=> b!1301564 (= e!742396 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581856) (select (arr!41808 _keys!1741) from!2144))))))

(assert (= (and d!141211 c!124786) b!1301562))

(assert (= (and d!141211 (not c!124786)) b!1301563))

(assert (= (and d!141211 (not res!864725)) b!1301564))

(assert (=> d!141211 m!1191423))

(declare-fun m!1191999 () Bool)

(assert (=> d!141211 m!1191999))

(assert (=> b!1301562 m!1191423))

(declare-fun m!1192001 () Bool)

(assert (=> b!1301562 m!1192001))

(assert (=> b!1301562 m!1191423))

(declare-fun m!1192003 () Bool)

(assert (=> b!1301562 m!1192003))

(assert (=> b!1301562 m!1192003))

(declare-fun m!1192005 () Bool)

(assert (=> b!1301562 m!1192005))

(assert (=> b!1301564 m!1191423))

(assert (=> b!1301564 m!1192003))

(assert (=> b!1301564 m!1192003))

(assert (=> b!1301564 m!1192005))

(assert (=> b!1301413 d!141211))

(declare-fun d!141213 () Bool)

(assert (=> d!141213 (= (apply!1010 lt!581812 (select (arr!41808 _keys!1741) from!2144)) (get!21139 (getValueByKey!703 (toList!10160 lt!581812) (select (arr!41808 _keys!1741) from!2144))))))

(declare-fun bs!37039 () Bool)

(assert (= bs!37039 d!141213))

(assert (=> bs!37039 m!1191423))

(declare-fun m!1192007 () Bool)

(assert (=> bs!37039 m!1192007))

(assert (=> bs!37039 m!1192007))

(declare-fun m!1192009 () Bool)

(assert (=> bs!37039 m!1192009))

(assert (=> b!1301340 d!141213))

(assert (=> b!1301340 d!141091))

(assert (=> b!1301292 d!141149))

(assert (=> b!1301292 d!141151))

(declare-fun d!141215 () Bool)

(declare-fun isEmpty!1061 (List!29750) Bool)

(assert (=> d!141215 (= (isEmpty!1059 lt!581856) (isEmpty!1061 (toList!10160 lt!581856)))))

(declare-fun bs!37040 () Bool)

(assert (= bs!37040 d!141215))

(declare-fun m!1192011 () Bool)

(assert (=> bs!37040 m!1192011))

(assert (=> b!1301411 d!141215))

(assert (=> d!141081 d!141113))

(assert (=> d!141089 d!141085))

(assert (=> d!141089 d!141087))

(declare-fun d!141217 () Bool)

(assert (=> d!141217 (not (contains!8216 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) k0!1205))))

(assert (=> d!141217 true))

(declare-fun _$36!378 () Unit!42908)

(assert (=> d!141217 (= (choose!1912 (ListLongMap!20290 Nil!29747) (select (arr!41808 _keys!1741) from!2144) lt!581653 k0!1205) _$36!378)))

(declare-fun bs!37041 () Bool)

(assert (= bs!37041 d!141217))

(assert (=> bs!37041 m!1191449))

(assert (=> bs!37041 m!1191449))

(assert (=> bs!37041 m!1191451))

(assert (=> d!141089 d!141217))

(assert (=> d!141089 d!141107))

(declare-fun d!141219 () Bool)

(declare-fun res!864726 () Bool)

(declare-fun e!742397 () Bool)

(assert (=> d!141219 (=> res!864726 e!742397)))

(assert (=> d!141219 (= res!864726 (and ((_ is Cons!29746) (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)))) (= (_1!11327 (h!30955 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))))) k0!1205)))))

(assert (=> d!141219 (= (containsKey!720 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))) k0!1205) e!742397)))

(declare-fun b!1301566 () Bool)

(declare-fun e!742398 () Bool)

(assert (=> b!1301566 (= e!742397 e!742398)))

(declare-fun res!864727 () Bool)

(assert (=> b!1301566 (=> (not res!864727) (not e!742398))))

(assert (=> b!1301566 (= res!864727 (and (or (not ((_ is Cons!29746) (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))))) (bvsle (_1!11327 (h!30955 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))))) k0!1205)) ((_ is Cons!29746) (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)))) (bvslt (_1!11327 (h!30955 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652))))) k0!1205)))))

(declare-fun b!1301567 () Bool)

(assert (=> b!1301567 (= e!742398 (containsKey!720 (t!43318 (toList!10160 (ite c!124699 lt!581650 (ite c!124697 lt!581651 lt!581652)))) k0!1205))))

(assert (= (and d!141219 (not res!864726)) b!1301566))

(assert (= (and b!1301566 res!864727) b!1301567))

(declare-fun m!1192013 () Bool)

(assert (=> b!1301567 m!1192013))

(assert (=> d!141083 d!141219))

(declare-fun d!141221 () Bool)

(declare-fun res!864728 () Bool)

(declare-fun e!742399 () Bool)

(assert (=> d!141221 (=> res!864728 e!742399)))

(assert (=> d!141221 (= res!864728 (and ((_ is Cons!29746) (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))) (= (_1!11327 (h!30955 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))) k0!1205)))))

(assert (=> d!141221 (= (containsKey!720 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) k0!1205) e!742399)))

(declare-fun b!1301568 () Bool)

(declare-fun e!742400 () Bool)

(assert (=> b!1301568 (= e!742399 e!742400)))

(declare-fun res!864729 () Bool)

(assert (=> b!1301568 (=> (not res!864729) (not e!742400))))

(assert (=> b!1301568 (= res!864729 (and (or (not ((_ is Cons!29746) (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))) (bvsle (_1!11327 (h!30955 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))) k0!1205)) ((_ is Cons!29746) (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))) (bvslt (_1!11327 (h!30955 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))) k0!1205)))))

(declare-fun b!1301569 () Bool)

(assert (=> b!1301569 (= e!742400 (containsKey!720 (t!43318 (toList!10160 (+!4498 (ListLongMap!20290 Nil!29747) (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))) k0!1205))))

(assert (= (and d!141221 (not res!864728)) b!1301568))

(assert (= (and b!1301568 res!864729) b!1301569))

(declare-fun m!1192015 () Bool)

(assert (=> b!1301569 m!1192015))

(assert (=> d!141085 d!141221))

(declare-fun d!141223 () Bool)

(declare-fun e!742402 () Bool)

(assert (=> d!141223 e!742402))

(declare-fun res!864730 () Bool)

(assert (=> d!141223 (=> res!864730 e!742402)))

(declare-fun lt!581975 () Bool)

(assert (=> d!141223 (= res!864730 (not lt!581975))))

(declare-fun lt!581976 () Bool)

(assert (=> d!141223 (= lt!581975 lt!581976)))

(declare-fun lt!581978 () Unit!42908)

(declare-fun e!742401 () Unit!42908)

(assert (=> d!141223 (= lt!581978 e!742401)))

(declare-fun c!124787 () Bool)

(assert (=> d!141223 (= c!124787 lt!581976)))

(assert (=> d!141223 (= lt!581976 (containsKey!720 (toList!10160 lt!581835) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(assert (=> d!141223 (= (contains!8216 lt!581835 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) lt!581975)))

(declare-fun b!1301570 () Bool)

(declare-fun lt!581977 () Unit!42908)

(assert (=> b!1301570 (= e!742401 lt!581977)))

(assert (=> b!1301570 (= lt!581977 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581835) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(assert (=> b!1301570 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581835) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun b!1301571 () Bool)

(declare-fun Unit!42927 () Unit!42908)

(assert (=> b!1301571 (= e!742401 Unit!42927)))

(declare-fun b!1301572 () Bool)

(assert (=> b!1301572 (= e!742402 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581835) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(assert (= (and d!141223 c!124787) b!1301570))

(assert (= (and d!141223 (not c!124787)) b!1301571))

(assert (= (and d!141223 (not res!864730)) b!1301572))

(declare-fun m!1192017 () Bool)

(assert (=> d!141223 m!1192017))

(declare-fun m!1192019 () Bool)

(assert (=> b!1301570 m!1192019))

(assert (=> b!1301570 m!1191635))

(assert (=> b!1301570 m!1191635))

(declare-fun m!1192021 () Bool)

(assert (=> b!1301570 m!1192021))

(assert (=> b!1301572 m!1191635))

(assert (=> b!1301572 m!1191635))

(assert (=> b!1301572 m!1192021))

(assert (=> d!141087 d!141223))

(declare-fun b!1301573 () Bool)

(declare-fun e!742403 () Option!754)

(assert (=> b!1301573 (= e!742403 (Some!753 (_2!11327 (h!30955 lt!581832))))))

(declare-fun b!1301574 () Bool)

(declare-fun e!742404 () Option!754)

(assert (=> b!1301574 (= e!742403 e!742404)))

(declare-fun c!124789 () Bool)

(assert (=> b!1301574 (= c!124789 (and ((_ is Cons!29746) lt!581832) (not (= (_1!11327 (h!30955 lt!581832)) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))))

(declare-fun b!1301576 () Bool)

(assert (=> b!1301576 (= e!742404 None!752)))

(declare-fun b!1301575 () Bool)

(assert (=> b!1301575 (= e!742404 (getValueByKey!703 (t!43318 lt!581832) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun d!141225 () Bool)

(declare-fun c!124788 () Bool)

(assert (=> d!141225 (= c!124788 (and ((_ is Cons!29746) lt!581832) (= (_1!11327 (h!30955 lt!581832)) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(assert (=> d!141225 (= (getValueByKey!703 lt!581832 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) e!742403)))

(assert (= (and d!141225 c!124788) b!1301573))

(assert (= (and d!141225 (not c!124788)) b!1301574))

(assert (= (and b!1301574 c!124789) b!1301575))

(assert (= (and b!1301574 (not c!124789)) b!1301576))

(declare-fun m!1192023 () Bool)

(assert (=> b!1301575 m!1192023))

(assert (=> d!141087 d!141225))

(declare-fun d!141227 () Bool)

(assert (=> d!141227 (= (getValueByKey!703 lt!581832 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) (Some!753 (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun lt!581981 () Unit!42908)

(declare-fun choose!1918 (List!29750 (_ BitVec 64) V!51577) Unit!42908)

(assert (=> d!141227 (= lt!581981 (choose!1918 lt!581832 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun e!742407 () Bool)

(assert (=> d!141227 e!742407))

(declare-fun res!864735 () Bool)

(assert (=> d!141227 (=> (not res!864735) (not e!742407))))

(assert (=> d!141227 (= res!864735 (isStrictlySorted!867 lt!581832))))

(assert (=> d!141227 (= (lemmaContainsTupThenGetReturnValue!347 lt!581832 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) lt!581981)))

(declare-fun b!1301581 () Bool)

(declare-fun res!864736 () Bool)

(assert (=> b!1301581 (=> (not res!864736) (not e!742407))))

(assert (=> b!1301581 (= res!864736 (containsKey!720 lt!581832 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun b!1301582 () Bool)

(assert (=> b!1301582 (= e!742407 (contains!8219 lt!581832 (tuple2!22633 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(assert (= (and d!141227 res!864735) b!1301581))

(assert (= (and b!1301581 res!864736) b!1301582))

(assert (=> d!141227 m!1191629))

(declare-fun m!1192025 () Bool)

(assert (=> d!141227 m!1192025))

(declare-fun m!1192027 () Bool)

(assert (=> d!141227 m!1192027))

(declare-fun m!1192029 () Bool)

(assert (=> b!1301581 m!1192029))

(declare-fun m!1192031 () Bool)

(assert (=> b!1301582 m!1192031))

(assert (=> d!141087 d!141227))

(declare-fun b!1301603 () Bool)

(declare-fun res!864741 () Bool)

(declare-fun e!742420 () Bool)

(assert (=> b!1301603 (=> (not res!864741) (not e!742420))))

(declare-fun lt!581984 () List!29750)

(assert (=> b!1301603 (= res!864741 (containsKey!720 lt!581984 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun bm!63947 () Bool)

(declare-fun call!63952 () List!29750)

(declare-fun call!63951 () List!29750)

(assert (=> bm!63947 (= call!63952 call!63951)))

(declare-fun b!1301604 () Bool)

(declare-fun e!742421 () List!29750)

(declare-fun c!124798 () Bool)

(declare-fun c!124800 () Bool)

(assert (=> b!1301604 (= e!742421 (ite c!124798 (t!43318 (toList!10160 (ListLongMap!20290 Nil!29747))) (ite c!124800 (Cons!29746 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747))) (t!43318 (toList!10160 (ListLongMap!20290 Nil!29747)))) Nil!29747)))))

(declare-fun b!1301605 () Bool)

(declare-fun e!742419 () List!29750)

(declare-fun call!63950 () List!29750)

(assert (=> b!1301605 (= e!742419 call!63950)))

(declare-fun b!1301606 () Bool)

(assert (=> b!1301606 (= e!742419 call!63950)))

(declare-fun d!141229 () Bool)

(assert (=> d!141229 e!742420))

(declare-fun res!864742 () Bool)

(assert (=> d!141229 (=> (not res!864742) (not e!742420))))

(assert (=> d!141229 (= res!864742 (isStrictlySorted!867 lt!581984))))

(declare-fun e!742418 () List!29750)

(assert (=> d!141229 (= lt!581984 e!742418)))

(declare-fun c!124801 () Bool)

(assert (=> d!141229 (= c!124801 (and ((_ is Cons!29746) (toList!10160 (ListLongMap!20290 Nil!29747))) (bvslt (_1!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747)))) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(assert (=> d!141229 (isStrictlySorted!867 (toList!10160 (ListLongMap!20290 Nil!29747)))))

(assert (=> d!141229 (= (insertStrictlySorted!476 (toList!10160 (ListLongMap!20290 Nil!29747)) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) lt!581984)))

(declare-fun b!1301607 () Bool)

(assert (=> b!1301607 (= e!742420 (contains!8219 lt!581984 (tuple2!22633 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(declare-fun b!1301608 () Bool)

(assert (=> b!1301608 (= e!742418 call!63951)))

(declare-fun b!1301609 () Bool)

(assert (=> b!1301609 (= c!124800 (and ((_ is Cons!29746) (toList!10160 (ListLongMap!20290 Nil!29747))) (bvsgt (_1!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747)))) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(declare-fun e!742422 () List!29750)

(assert (=> b!1301609 (= e!742422 e!742419)))

(declare-fun bm!63948 () Bool)

(declare-fun $colon$colon!669 (List!29750 tuple2!22632) List!29750)

(assert (=> bm!63948 (= call!63951 ($colon$colon!669 e!742421 (ite c!124801 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747))) (tuple2!22633 (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))))

(declare-fun c!124799 () Bool)

(assert (=> bm!63948 (= c!124799 c!124801)))

(declare-fun b!1301610 () Bool)

(assert (=> b!1301610 (= e!742418 e!742422)))

(assert (=> b!1301610 (= c!124798 (and ((_ is Cons!29746) (toList!10160 (ListLongMap!20290 Nil!29747))) (= (_1!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747)))) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(declare-fun b!1301611 () Bool)

(assert (=> b!1301611 (= e!742422 call!63952)))

(declare-fun bm!63949 () Bool)

(assert (=> bm!63949 (= call!63950 call!63952)))

(declare-fun b!1301612 () Bool)

(assert (=> b!1301612 (= e!742421 (insertStrictlySorted!476 (t!43318 (toList!10160 (ListLongMap!20290 Nil!29747))) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)) (_2!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(assert (= (and d!141229 c!124801) b!1301608))

(assert (= (and d!141229 (not c!124801)) b!1301610))

(assert (= (and b!1301610 c!124798) b!1301611))

(assert (= (and b!1301610 (not c!124798)) b!1301609))

(assert (= (and b!1301609 c!124800) b!1301606))

(assert (= (and b!1301609 (not c!124800)) b!1301605))

(assert (= (or b!1301606 b!1301605) bm!63949))

(assert (= (or b!1301611 bm!63949) bm!63947))

(assert (= (or b!1301608 bm!63947) bm!63948))

(assert (= (and bm!63948 c!124799) b!1301612))

(assert (= (and bm!63948 (not c!124799)) b!1301604))

(assert (= (and d!141229 res!864742) b!1301603))

(assert (= (and b!1301603 res!864741) b!1301607))

(declare-fun m!1192033 () Bool)

(assert (=> b!1301612 m!1192033))

(declare-fun m!1192035 () Bool)

(assert (=> b!1301607 m!1192035))

(declare-fun m!1192037 () Bool)

(assert (=> bm!63948 m!1192037))

(declare-fun m!1192039 () Bool)

(assert (=> d!141229 m!1192039))

(declare-fun m!1192041 () Bool)

(assert (=> d!141229 m!1192041))

(declare-fun m!1192043 () Bool)

(assert (=> b!1301603 m!1192043))

(assert (=> d!141087 d!141229))

(declare-fun d!141231 () Bool)

(declare-fun e!742424 () Bool)

(assert (=> d!141231 e!742424))

(declare-fun res!864743 () Bool)

(assert (=> d!141231 (=> res!864743 e!742424)))

(declare-fun lt!581985 () Bool)

(assert (=> d!141231 (= res!864743 (not lt!581985))))

(declare-fun lt!581986 () Bool)

(assert (=> d!141231 (= lt!581985 lt!581986)))

(declare-fun lt!581988 () Unit!42908)

(declare-fun e!742423 () Unit!42908)

(assert (=> d!141231 (= lt!581988 e!742423)))

(declare-fun c!124802 () Bool)

(assert (=> d!141231 (= c!124802 lt!581986)))

(assert (=> d!141231 (= lt!581986 (containsKey!720 (toList!10160 lt!581812) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141231 (= (contains!8216 lt!581812 #b0000000000000000000000000000000000000000000000000000000000000000) lt!581985)))

(declare-fun b!1301613 () Bool)

(declare-fun lt!581987 () Unit!42908)

(assert (=> b!1301613 (= e!742423 lt!581987)))

(assert (=> b!1301613 (= lt!581987 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581812) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301613 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581812) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301614 () Bool)

(declare-fun Unit!42928 () Unit!42908)

(assert (=> b!1301614 (= e!742423 Unit!42928)))

(declare-fun b!1301615 () Bool)

(assert (=> b!1301615 (= e!742424 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581812) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141231 c!124802) b!1301613))

(assert (= (and d!141231 (not c!124802)) b!1301614))

(assert (= (and d!141231 (not res!864743)) b!1301615))

(declare-fun m!1192045 () Bool)

(assert (=> d!141231 m!1192045))

(declare-fun m!1192047 () Bool)

(assert (=> b!1301613 m!1192047))

(assert (=> b!1301613 m!1191933))

(assert (=> b!1301613 m!1191933))

(declare-fun m!1192049 () Bool)

(assert (=> b!1301613 m!1192049))

(assert (=> b!1301615 m!1191933))

(assert (=> b!1301615 m!1191933))

(assert (=> b!1301615 m!1192049))

(assert (=> bm!63928 d!141231))

(declare-fun b!1301616 () Bool)

(declare-fun e!742427 () Bool)

(declare-fun call!63953 () Bool)

(assert (=> b!1301616 (= e!742427 call!63953)))

(declare-fun b!1301617 () Bool)

(declare-fun e!742425 () Bool)

(assert (=> b!1301617 (= e!742425 call!63953)))

(declare-fun bm!63950 () Bool)

(assert (=> bm!63950 (= call!63953 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1301618 () Bool)

(declare-fun e!742426 () Bool)

(assert (=> b!1301618 (= e!742426 e!742425)))

(declare-fun c!124803 () Bool)

(assert (=> b!1301618 (= c!124803 (validKeyInArray!0 (select (arr!41808 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!141233 () Bool)

(declare-fun res!864745 () Bool)

(assert (=> d!141233 (=> res!864745 e!742426)))

(assert (=> d!141233 (= res!864745 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42360 _keys!1741)))))

(assert (=> d!141233 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!742426)))

(declare-fun b!1301619 () Bool)

(assert (=> b!1301619 (= e!742425 e!742427)))

(declare-fun lt!581989 () (_ BitVec 64))

(assert (=> b!1301619 (= lt!581989 (select (arr!41808 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!581990 () Unit!42908)

(assert (=> b!1301619 (= lt!581990 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581989 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1301619 (arrayContainsKey!0 _keys!1741 lt!581989 #b00000000000000000000000000000000)))

(declare-fun lt!581991 () Unit!42908)

(assert (=> b!1301619 (= lt!581991 lt!581990)))

(declare-fun res!864744 () Bool)

(assert (=> b!1301619 (= res!864744 (= (seekEntryOrOpen!0 (select (arr!41808 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10019 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1301619 (=> (not res!864744) (not e!742427))))

(assert (= (and d!141233 (not res!864745)) b!1301618))

(assert (= (and b!1301618 c!124803) b!1301619))

(assert (= (and b!1301618 (not c!124803)) b!1301617))

(assert (= (and b!1301619 res!864744) b!1301616))

(assert (= (or b!1301616 b!1301617) bm!63950))

(declare-fun m!1192051 () Bool)

(assert (=> bm!63950 m!1192051))

(assert (=> b!1301618 m!1191761))

(assert (=> b!1301618 m!1191761))

(assert (=> b!1301618 m!1191765))

(assert (=> b!1301619 m!1191761))

(declare-fun m!1192053 () Bool)

(assert (=> b!1301619 m!1192053))

(declare-fun m!1192055 () Bool)

(assert (=> b!1301619 m!1192055))

(assert (=> b!1301619 m!1191761))

(declare-fun m!1192057 () Bool)

(assert (=> b!1301619 m!1192057))

(assert (=> bm!63938 d!141233))

(assert (=> b!1301426 d!141201))

(declare-fun d!141235 () Bool)

(declare-fun lt!581992 () Bool)

(assert (=> d!141235 (= lt!581992 (select (content!642 (toList!10160 lt!581866)) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun e!742428 () Bool)

(assert (=> d!141235 (= lt!581992 e!742428)))

(declare-fun res!864747 () Bool)

(assert (=> d!141235 (=> (not res!864747) (not e!742428))))

(assert (=> d!141235 (= res!864747 ((_ is Cons!29746) (toList!10160 lt!581866)))))

(assert (=> d!141235 (= (contains!8219 (toList!10160 lt!581866) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!581992)))

(declare-fun b!1301620 () Bool)

(declare-fun e!742429 () Bool)

(assert (=> b!1301620 (= e!742428 e!742429)))

(declare-fun res!864746 () Bool)

(assert (=> b!1301620 (=> res!864746 e!742429)))

(assert (=> b!1301620 (= res!864746 (= (h!30955 (toList!10160 lt!581866)) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1301621 () Bool)

(assert (=> b!1301621 (= e!742429 (contains!8219 (t!43318 (toList!10160 lt!581866)) (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141235 res!864747) b!1301620))

(assert (= (and b!1301620 (not res!864746)) b!1301621))

(declare-fun m!1192059 () Bool)

(assert (=> d!141235 m!1192059))

(declare-fun m!1192061 () Bool)

(assert (=> d!141235 m!1192061))

(declare-fun m!1192063 () Bool)

(assert (=> b!1301621 m!1192063))

(assert (=> b!1301430 d!141235))

(assert (=> b!1301424 d!141201))

(declare-fun d!141237 () Bool)

(declare-fun res!864748 () Bool)

(declare-fun e!742430 () Bool)

(assert (=> d!141237 (=> res!864748 e!742430)))

(assert (=> d!141237 (= res!864748 (and ((_ is Cons!29746) (toList!10160 (ListLongMap!20290 Nil!29747))) (= (_1!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747)))) k0!1205)))))

(assert (=> d!141237 (= (containsKey!720 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205) e!742430)))

(declare-fun b!1301622 () Bool)

(declare-fun e!742431 () Bool)

(assert (=> b!1301622 (= e!742430 e!742431)))

(declare-fun res!864749 () Bool)

(assert (=> b!1301622 (=> (not res!864749) (not e!742431))))

(assert (=> b!1301622 (= res!864749 (and (or (not ((_ is Cons!29746) (toList!10160 (ListLongMap!20290 Nil!29747)))) (bvsle (_1!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747)))) k0!1205)) ((_ is Cons!29746) (toList!10160 (ListLongMap!20290 Nil!29747))) (bvslt (_1!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747)))) k0!1205)))))

(declare-fun b!1301623 () Bool)

(assert (=> b!1301623 (= e!742431 (containsKey!720 (t!43318 (toList!10160 (ListLongMap!20290 Nil!29747))) k0!1205))))

(assert (= (and d!141237 (not res!864748)) b!1301622))

(assert (= (and b!1301622 res!864749) b!1301623))

(declare-fun m!1192065 () Bool)

(assert (=> b!1301623 m!1192065))

(assert (=> d!141107 d!141237))

(assert (=> b!1301409 d!141145))

(assert (=> b!1301407 d!141105))

(declare-fun d!141239 () Bool)

(assert (=> d!141239 (arrayContainsKey!0 _keys!1741 lt!581885 #b00000000000000000000000000000000)))

(declare-fun lt!581995 () Unit!42908)

(declare-fun choose!13 (array!86623 (_ BitVec 64) (_ BitVec 32)) Unit!42908)

(assert (=> d!141239 (= lt!581995 (choose!13 _keys!1741 lt!581885 #b00000000000000000000000000000000))))

(assert (=> d!141239 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141239 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581885 #b00000000000000000000000000000000) lt!581995)))

(declare-fun bs!37042 () Bool)

(assert (= bs!37042 d!141239))

(assert (=> bs!37042 m!1191717))

(declare-fun m!1192067 () Bool)

(assert (=> bs!37042 m!1192067))

(assert (=> b!1301448 d!141239))

(declare-fun d!141241 () Bool)

(declare-fun res!864754 () Bool)

(declare-fun e!742436 () Bool)

(assert (=> d!141241 (=> res!864754 e!742436)))

(assert (=> d!141241 (= res!864754 (= (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) lt!581885))))

(assert (=> d!141241 (= (arrayContainsKey!0 _keys!1741 lt!581885 #b00000000000000000000000000000000) e!742436)))

(declare-fun b!1301628 () Bool)

(declare-fun e!742437 () Bool)

(assert (=> b!1301628 (= e!742436 e!742437)))

(declare-fun res!864755 () Bool)

(assert (=> b!1301628 (=> (not res!864755) (not e!742437))))

(assert (=> b!1301628 (= res!864755 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42360 _keys!1741)))))

(declare-fun b!1301629 () Bool)

(assert (=> b!1301629 (= e!742437 (arrayContainsKey!0 _keys!1741 lt!581885 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141241 (not res!864754)) b!1301628))

(assert (= (and b!1301628 res!864755) b!1301629))

(assert (=> d!141241 m!1191671))

(declare-fun m!1192069 () Bool)

(assert (=> b!1301629 m!1192069))

(assert (=> b!1301448 d!141241))

(declare-fun b!1301642 () Bool)

(declare-fun e!742445 () SeekEntryResult!10019)

(declare-fun e!742446 () SeekEntryResult!10019)

(assert (=> b!1301642 (= e!742445 e!742446)))

(declare-fun lt!582003 () (_ BitVec 64))

(declare-fun lt!582004 () SeekEntryResult!10019)

(assert (=> b!1301642 (= lt!582003 (select (arr!41808 _keys!1741) (index!42449 lt!582004)))))

(declare-fun c!124812 () Bool)

(assert (=> b!1301642 (= c!124812 (= lt!582003 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141243 () Bool)

(declare-fun lt!582002 () SeekEntryResult!10019)

(assert (=> d!141243 (and (or ((_ is Undefined!10019) lt!582002) (not ((_ is Found!10019) lt!582002)) (and (bvsge (index!42448 lt!582002) #b00000000000000000000000000000000) (bvslt (index!42448 lt!582002) (size!42360 _keys!1741)))) (or ((_ is Undefined!10019) lt!582002) ((_ is Found!10019) lt!582002) (not ((_ is MissingZero!10019) lt!582002)) (and (bvsge (index!42447 lt!582002) #b00000000000000000000000000000000) (bvslt (index!42447 lt!582002) (size!42360 _keys!1741)))) (or ((_ is Undefined!10019) lt!582002) ((_ is Found!10019) lt!582002) ((_ is MissingZero!10019) lt!582002) (not ((_ is MissingVacant!10019) lt!582002)) (and (bvsge (index!42450 lt!582002) #b00000000000000000000000000000000) (bvslt (index!42450 lt!582002) (size!42360 _keys!1741)))) (or ((_ is Undefined!10019) lt!582002) (ite ((_ is Found!10019) lt!582002) (= (select (arr!41808 _keys!1741) (index!42448 lt!582002)) (select (arr!41808 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10019) lt!582002) (= (select (arr!41808 _keys!1741) (index!42447 lt!582002)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10019) lt!582002) (= (select (arr!41808 _keys!1741) (index!42450 lt!582002)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141243 (= lt!582002 e!742445)))

(declare-fun c!124811 () Bool)

(assert (=> d!141243 (= c!124811 (and ((_ is Intermediate!10019) lt!582004) (undefined!10831 lt!582004)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86623 (_ BitVec 32)) SeekEntryResult!10019)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141243 (= lt!582004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141243 (validMask!0 mask!2175)))

(assert (=> d!141243 (= (seekEntryOrOpen!0 (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!582002)))

(declare-fun b!1301643 () Bool)

(assert (=> b!1301643 (= e!742445 Undefined!10019)))

(declare-fun b!1301644 () Bool)

(assert (=> b!1301644 (= e!742446 (Found!10019 (index!42449 lt!582004)))))

(declare-fun b!1301645 () Bool)

(declare-fun e!742444 () SeekEntryResult!10019)

(assert (=> b!1301645 (= e!742444 (MissingZero!10019 (index!42449 lt!582004)))))

(declare-fun b!1301646 () Bool)

(declare-fun c!124810 () Bool)

(assert (=> b!1301646 (= c!124810 (= lt!582003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301646 (= e!742446 e!742444)))

(declare-fun b!1301647 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86623 (_ BitVec 32)) SeekEntryResult!10019)

(assert (=> b!1301647 (= e!742444 (seekKeyOrZeroReturnVacant!0 (x!115589 lt!582004) (index!42449 lt!582004) (index!42449 lt!582004) (select (arr!41808 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (= (and d!141243 c!124811) b!1301643))

(assert (= (and d!141243 (not c!124811)) b!1301642))

(assert (= (and b!1301642 c!124812) b!1301644))

(assert (= (and b!1301642 (not c!124812)) b!1301646))

(assert (= (and b!1301646 c!124810) b!1301645))

(assert (= (and b!1301646 (not c!124810)) b!1301647))

(declare-fun m!1192071 () Bool)

(assert (=> b!1301642 m!1192071))

(assert (=> d!141243 m!1191671))

(declare-fun m!1192073 () Bool)

(assert (=> d!141243 m!1192073))

(declare-fun m!1192075 () Bool)

(assert (=> d!141243 m!1192075))

(declare-fun m!1192077 () Bool)

(assert (=> d!141243 m!1192077))

(assert (=> d!141243 m!1191439))

(assert (=> d!141243 m!1192073))

(assert (=> d!141243 m!1191671))

(declare-fun m!1192079 () Bool)

(assert (=> d!141243 m!1192079))

(declare-fun m!1192081 () Bool)

(assert (=> d!141243 m!1192081))

(assert (=> b!1301647 m!1191671))

(declare-fun m!1192083 () Bool)

(assert (=> b!1301647 m!1192083))

(assert (=> b!1301448 d!141243))

(declare-fun d!141245 () Bool)

(declare-fun e!742448 () Bool)

(assert (=> d!141245 e!742448))

(declare-fun res!864756 () Bool)

(assert (=> d!141245 (=> res!864756 e!742448)))

(declare-fun lt!582005 () Bool)

(assert (=> d!141245 (= res!864756 (not lt!582005))))

(declare-fun lt!582006 () Bool)

(assert (=> d!141245 (= lt!582005 lt!582006)))

(declare-fun lt!582008 () Unit!42908)

(declare-fun e!742447 () Unit!42908)

(assert (=> d!141245 (= lt!582008 e!742447)))

(declare-fun c!124813 () Bool)

(assert (=> d!141245 (= c!124813 lt!582006)))

(assert (=> d!141245 (= lt!582006 (containsKey!720 (toList!10160 lt!581812) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141245 (= (contains!8216 lt!581812 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582005)))

(declare-fun b!1301648 () Bool)

(declare-fun lt!582007 () Unit!42908)

(assert (=> b!1301648 (= e!742447 lt!582007)))

(assert (=> b!1301648 (= lt!582007 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581812) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301648 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581812) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301649 () Bool)

(declare-fun Unit!42929 () Unit!42908)

(assert (=> b!1301649 (= e!742447 Unit!42929)))

(declare-fun b!1301650 () Bool)

(assert (=> b!1301650 (= e!742448 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141245 c!124813) b!1301648))

(assert (= (and d!141245 (not c!124813)) b!1301649))

(assert (= (and d!141245 (not res!864756)) b!1301650))

(declare-fun m!1192085 () Bool)

(assert (=> d!141245 m!1192085))

(declare-fun m!1192087 () Bool)

(assert (=> b!1301648 m!1192087))

(assert (=> b!1301648 m!1191757))

(assert (=> b!1301648 m!1191757))

(declare-fun m!1192089 () Bool)

(assert (=> b!1301648 m!1192089))

(assert (=> b!1301650 m!1191757))

(assert (=> b!1301650 m!1191757))

(assert (=> b!1301650 m!1192089))

(assert (=> bm!63925 d!141245))

(assert (=> bm!63929 d!141093))

(declare-fun b!1301651 () Bool)

(declare-fun e!742449 () Option!754)

(assert (=> b!1301651 (= e!742449 (Some!753 (_2!11327 (h!30955 (toList!10160 lt!581835)))))))

(declare-fun b!1301652 () Bool)

(declare-fun e!742450 () Option!754)

(assert (=> b!1301652 (= e!742449 e!742450)))

(declare-fun c!124815 () Bool)

(assert (=> b!1301652 (= c!124815 (and ((_ is Cons!29746) (toList!10160 lt!581835)) (not (= (_1!11327 (h!30955 (toList!10160 lt!581835))) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))))

(declare-fun b!1301654 () Bool)

(assert (=> b!1301654 (= e!742450 None!752)))

(declare-fun b!1301653 () Bool)

(assert (=> b!1301653 (= e!742450 (getValueByKey!703 (t!43318 (toList!10160 lt!581835)) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))))))

(declare-fun c!124814 () Bool)

(declare-fun d!141247 () Bool)

(assert (=> d!141247 (= c!124814 (and ((_ is Cons!29746) (toList!10160 lt!581835)) (= (_1!11327 (h!30955 (toList!10160 lt!581835))) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653)))))))

(assert (=> d!141247 (= (getValueByKey!703 (toList!10160 lt!581835) (_1!11327 (tuple2!22633 (select (arr!41808 _keys!1741) from!2144) lt!581653))) e!742449)))

(assert (= (and d!141247 c!124814) b!1301651))

(assert (= (and d!141247 (not c!124814)) b!1301652))

(assert (= (and b!1301652 c!124815) b!1301653))

(assert (= (and b!1301652 (not c!124815)) b!1301654))

(declare-fun m!1192091 () Bool)

(assert (=> b!1301653 m!1192091))

(assert (=> b!1301366 d!141247))

(declare-fun d!141249 () Bool)

(declare-fun e!742452 () Bool)

(assert (=> d!141249 e!742452))

(declare-fun res!864757 () Bool)

(assert (=> d!141249 (=> res!864757 e!742452)))

(declare-fun lt!582009 () Bool)

(assert (=> d!141249 (= res!864757 (not lt!582009))))

(declare-fun lt!582010 () Bool)

(assert (=> d!141249 (= lt!582009 lt!582010)))

(declare-fun lt!582012 () Unit!42908)

(declare-fun e!742451 () Unit!42908)

(assert (=> d!141249 (= lt!582012 e!742451)))

(declare-fun c!124816 () Bool)

(assert (=> d!141249 (= c!124816 lt!582010)))

(assert (=> d!141249 (= lt!582010 (containsKey!720 (toList!10160 lt!581866) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141249 (= (contains!8216 lt!581866 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582009)))

(declare-fun b!1301655 () Bool)

(declare-fun lt!582011 () Unit!42908)

(assert (=> b!1301655 (= e!742451 lt!582011)))

(assert (=> b!1301655 (= lt!582011 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581866) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> b!1301655 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581866) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1301656 () Bool)

(declare-fun Unit!42930 () Unit!42908)

(assert (=> b!1301656 (= e!742451 Unit!42930)))

(declare-fun b!1301657 () Bool)

(assert (=> b!1301657 (= e!742452 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581866) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (= (and d!141249 c!124816) b!1301655))

(assert (= (and d!141249 (not c!124816)) b!1301656))

(assert (= (and d!141249 (not res!864757)) b!1301657))

(declare-fun m!1192093 () Bool)

(assert (=> d!141249 m!1192093))

(declare-fun m!1192095 () Bool)

(assert (=> b!1301655 m!1192095))

(assert (=> b!1301655 m!1191687))

(assert (=> b!1301655 m!1191687))

(declare-fun m!1192097 () Bool)

(assert (=> b!1301655 m!1192097))

(assert (=> b!1301657 m!1191687))

(assert (=> b!1301657 m!1191687))

(assert (=> b!1301657 m!1192097))

(assert (=> d!141099 d!141249))

(declare-fun b!1301658 () Bool)

(declare-fun e!742453 () Option!754)

(assert (=> b!1301658 (= e!742453 (Some!753 (_2!11327 (h!30955 lt!581863))))))

(declare-fun b!1301659 () Bool)

(declare-fun e!742454 () Option!754)

(assert (=> b!1301659 (= e!742453 e!742454)))

(declare-fun c!124818 () Bool)

(assert (=> b!1301659 (= c!124818 (and ((_ is Cons!29746) lt!581863) (not (= (_1!11327 (h!30955 lt!581863)) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun b!1301661 () Bool)

(assert (=> b!1301661 (= e!742454 None!752)))

(declare-fun b!1301660 () Bool)

(assert (=> b!1301660 (= e!742454 (getValueByKey!703 (t!43318 lt!581863) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun d!141251 () Bool)

(declare-fun c!124817 () Bool)

(assert (=> d!141251 (= c!124817 (and ((_ is Cons!29746) lt!581863) (= (_1!11327 (h!30955 lt!581863)) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (=> d!141251 (= (getValueByKey!703 lt!581863 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) e!742453)))

(assert (= (and d!141251 c!124817) b!1301658))

(assert (= (and d!141251 (not c!124817)) b!1301659))

(assert (= (and b!1301659 c!124818) b!1301660))

(assert (= (and b!1301659 (not c!124818)) b!1301661))

(declare-fun m!1192099 () Bool)

(assert (=> b!1301660 m!1192099))

(assert (=> d!141099 d!141251))

(declare-fun d!141253 () Bool)

(assert (=> d!141253 (= (getValueByKey!703 lt!581863 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!753 (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582013 () Unit!42908)

(assert (=> d!141253 (= lt!582013 (choose!1918 lt!581863 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun e!742455 () Bool)

(assert (=> d!141253 e!742455))

(declare-fun res!864758 () Bool)

(assert (=> d!141253 (=> (not res!864758) (not e!742455))))

(assert (=> d!141253 (= res!864758 (isStrictlySorted!867 lt!581863))))

(assert (=> d!141253 (= (lemmaContainsTupThenGetReturnValue!347 lt!581863 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582013)))

(declare-fun b!1301662 () Bool)

(declare-fun res!864759 () Bool)

(assert (=> b!1301662 (=> (not res!864759) (not e!742455))))

(assert (=> b!1301662 (= res!864759 (containsKey!720 lt!581863 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1301663 () Bool)

(assert (=> b!1301663 (= e!742455 (contains!8219 lt!581863 (tuple2!22633 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (= (and d!141253 res!864758) b!1301662))

(assert (= (and b!1301662 res!864759) b!1301663))

(assert (=> d!141253 m!1191681))

(declare-fun m!1192101 () Bool)

(assert (=> d!141253 m!1192101))

(declare-fun m!1192103 () Bool)

(assert (=> d!141253 m!1192103))

(declare-fun m!1192105 () Bool)

(assert (=> b!1301662 m!1192105))

(declare-fun m!1192107 () Bool)

(assert (=> b!1301663 m!1192107))

(assert (=> d!141099 d!141253))

(declare-fun b!1301664 () Bool)

(declare-fun res!864760 () Bool)

(declare-fun e!742458 () Bool)

(assert (=> b!1301664 (=> (not res!864760) (not e!742458))))

(declare-fun lt!582014 () List!29750)

(assert (=> b!1301664 (= res!864760 (containsKey!720 lt!582014 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun bm!63951 () Bool)

(declare-fun call!63956 () List!29750)

(declare-fun call!63955 () List!29750)

(assert (=> bm!63951 (= call!63956 call!63955)))

(declare-fun c!124819 () Bool)

(declare-fun c!124821 () Bool)

(declare-fun e!742459 () List!29750)

(declare-fun b!1301665 () Bool)

(assert (=> b!1301665 (= e!742459 (ite c!124819 (t!43318 (toList!10160 lt!581656)) (ite c!124821 (Cons!29746 (h!30955 (toList!10160 lt!581656)) (t!43318 (toList!10160 lt!581656))) Nil!29747)))))

(declare-fun b!1301666 () Bool)

(declare-fun e!742457 () List!29750)

(declare-fun call!63954 () List!29750)

(assert (=> b!1301666 (= e!742457 call!63954)))

(declare-fun b!1301667 () Bool)

(assert (=> b!1301667 (= e!742457 call!63954)))

(declare-fun d!141255 () Bool)

(assert (=> d!141255 e!742458))

(declare-fun res!864761 () Bool)

(assert (=> d!141255 (=> (not res!864761) (not e!742458))))

(assert (=> d!141255 (= res!864761 (isStrictlySorted!867 lt!582014))))

(declare-fun e!742456 () List!29750)

(assert (=> d!141255 (= lt!582014 e!742456)))

(declare-fun c!124822 () Bool)

(assert (=> d!141255 (= c!124822 (and ((_ is Cons!29746) (toList!10160 lt!581656)) (bvslt (_1!11327 (h!30955 (toList!10160 lt!581656))) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (=> d!141255 (isStrictlySorted!867 (toList!10160 lt!581656))))

(assert (=> d!141255 (= (insertStrictlySorted!476 (toList!10160 lt!581656) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582014)))

(declare-fun b!1301668 () Bool)

(assert (=> b!1301668 (= e!742458 (contains!8219 lt!582014 (tuple2!22633 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1301669 () Bool)

(assert (=> b!1301669 (= e!742456 call!63955)))

(declare-fun b!1301670 () Bool)

(assert (=> b!1301670 (= c!124821 (and ((_ is Cons!29746) (toList!10160 lt!581656)) (bvsgt (_1!11327 (h!30955 (toList!10160 lt!581656))) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun e!742460 () List!29750)

(assert (=> b!1301670 (= e!742460 e!742457)))

(declare-fun bm!63952 () Bool)

(assert (=> bm!63952 (= call!63955 ($colon$colon!669 e!742459 (ite c!124822 (h!30955 (toList!10160 lt!581656)) (tuple2!22633 (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun c!124820 () Bool)

(assert (=> bm!63952 (= c!124820 c!124822)))

(declare-fun b!1301671 () Bool)

(assert (=> b!1301671 (= e!742456 e!742460)))

(assert (=> b!1301671 (= c!124819 (and ((_ is Cons!29746) (toList!10160 lt!581656)) (= (_1!11327 (h!30955 (toList!10160 lt!581656))) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1301672 () Bool)

(assert (=> b!1301672 (= e!742460 call!63956)))

(declare-fun bm!63953 () Bool)

(assert (=> bm!63953 (= call!63954 call!63956)))

(declare-fun b!1301673 () Bool)

(assert (=> b!1301673 (= e!742459 (insertStrictlySorted!476 (t!43318 (toList!10160 lt!581656)) (_1!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11327 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (= (and d!141255 c!124822) b!1301669))

(assert (= (and d!141255 (not c!124822)) b!1301671))

(assert (= (and b!1301671 c!124819) b!1301672))

(assert (= (and b!1301671 (not c!124819)) b!1301670))

(assert (= (and b!1301670 c!124821) b!1301667))

(assert (= (and b!1301670 (not c!124821)) b!1301666))

(assert (= (or b!1301667 b!1301666) bm!63953))

(assert (= (or b!1301672 bm!63953) bm!63951))

(assert (= (or b!1301669 bm!63951) bm!63952))

(assert (= (and bm!63952 c!124820) b!1301673))

(assert (= (and bm!63952 (not c!124820)) b!1301665))

(assert (= (and d!141255 res!864761) b!1301664))

(assert (= (and b!1301664 res!864760) b!1301668))

(declare-fun m!1192109 () Bool)

(assert (=> b!1301673 m!1192109))

(declare-fun m!1192111 () Bool)

(assert (=> b!1301668 m!1192111))

(declare-fun m!1192113 () Bool)

(assert (=> bm!63952 m!1192113))

(declare-fun m!1192115 () Bool)

(assert (=> d!141255 m!1192115))

(declare-fun m!1192117 () Bool)

(assert (=> d!141255 m!1192117))

(declare-fun m!1192119 () Bool)

(assert (=> b!1301664 m!1192119))

(assert (=> d!141099 d!141255))

(assert (=> b!1301342 d!141105))

(declare-fun d!141257 () Bool)

(assert (=> d!141257 (= (isDefined!510 (getValueByKey!703 (toList!10160 lt!581656) k0!1205)) (not (isEmpty!1060 (getValueByKey!703 (toList!10160 lt!581656) k0!1205))))))

(declare-fun bs!37043 () Bool)

(assert (= bs!37043 d!141257))

(assert (=> bs!37043 m!1191699))

(declare-fun m!1192121 () Bool)

(assert (=> bs!37043 m!1192121))

(assert (=> b!1301433 d!141257))

(declare-fun b!1301674 () Bool)

(declare-fun e!742461 () Option!754)

(assert (=> b!1301674 (= e!742461 (Some!753 (_2!11327 (h!30955 (toList!10160 lt!581656)))))))

(declare-fun b!1301675 () Bool)

(declare-fun e!742462 () Option!754)

(assert (=> b!1301675 (= e!742461 e!742462)))

(declare-fun c!124824 () Bool)

(assert (=> b!1301675 (= c!124824 (and ((_ is Cons!29746) (toList!10160 lt!581656)) (not (= (_1!11327 (h!30955 (toList!10160 lt!581656))) k0!1205))))))

(declare-fun b!1301677 () Bool)

(assert (=> b!1301677 (= e!742462 None!752)))

(declare-fun b!1301676 () Bool)

(assert (=> b!1301676 (= e!742462 (getValueByKey!703 (t!43318 (toList!10160 lt!581656)) k0!1205))))

(declare-fun d!141259 () Bool)

(declare-fun c!124823 () Bool)

(assert (=> d!141259 (= c!124823 (and ((_ is Cons!29746) (toList!10160 lt!581656)) (= (_1!11327 (h!30955 (toList!10160 lt!581656))) k0!1205)))))

(assert (=> d!141259 (= (getValueByKey!703 (toList!10160 lt!581656) k0!1205) e!742461)))

(assert (= (and d!141259 c!124823) b!1301674))

(assert (= (and d!141259 (not c!124823)) b!1301675))

(assert (= (and b!1301675 c!124824) b!1301676))

(assert (= (and b!1301675 (not c!124824)) b!1301677))

(declare-fun m!1192123 () Bool)

(assert (=> b!1301676 m!1192123))

(assert (=> b!1301433 d!141259))

(declare-fun d!141261 () Bool)

(assert (=> d!141261 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581656) k0!1205))))

(declare-fun lt!582015 () Unit!42908)

(assert (=> d!141261 (= lt!582015 (choose!1915 (toList!10160 lt!581656) k0!1205))))

(declare-fun e!742463 () Bool)

(assert (=> d!141261 e!742463))

(declare-fun res!864762 () Bool)

(assert (=> d!141261 (=> (not res!864762) (not e!742463))))

(assert (=> d!141261 (= res!864762 (isStrictlySorted!867 (toList!10160 lt!581656)))))

(assert (=> d!141261 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581656) k0!1205) lt!582015)))

(declare-fun b!1301678 () Bool)

(assert (=> b!1301678 (= e!742463 (containsKey!720 (toList!10160 lt!581656) k0!1205))))

(assert (= (and d!141261 res!864762) b!1301678))

(assert (=> d!141261 m!1191699))

(assert (=> d!141261 m!1191699))

(assert (=> d!141261 m!1191701))

(declare-fun m!1192125 () Bool)

(assert (=> d!141261 m!1192125))

(assert (=> d!141261 m!1192117))

(assert (=> b!1301678 m!1191695))

(assert (=> b!1301431 d!141261))

(assert (=> b!1301431 d!141257))

(assert (=> b!1301431 d!141259))

(assert (=> b!1301412 d!141105))

(declare-fun d!141263 () Bool)

(assert (=> d!141263 (= (apply!1010 lt!581856 (select (arr!41808 _keys!1741) from!2144)) (get!21139 (getValueByKey!703 (toList!10160 lt!581856) (select (arr!41808 _keys!1741) from!2144))))))

(declare-fun bs!37044 () Bool)

(assert (= bs!37044 d!141263))

(assert (=> bs!37044 m!1191423))

(assert (=> bs!37044 m!1192003))

(assert (=> bs!37044 m!1192003))

(declare-fun m!1192127 () Bool)

(assert (=> bs!37044 m!1192127))

(assert (=> b!1301410 d!141263))

(assert (=> b!1301410 d!141091))

(declare-fun d!141265 () Bool)

(assert (=> d!141265 (= (isDefined!510 (getValueByKey!703 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205)) (not (isEmpty!1060 (getValueByKey!703 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205))))))

(declare-fun bs!37045 () Bool)

(assert (= bs!37045 d!141265))

(assert (=> bs!37045 m!1191707))

(declare-fun m!1192129 () Bool)

(assert (=> bs!37045 m!1192129))

(assert (=> b!1301436 d!141265))

(declare-fun b!1301679 () Bool)

(declare-fun e!742464 () Option!754)

(assert (=> b!1301679 (= e!742464 (Some!753 (_2!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747))))))))

(declare-fun b!1301680 () Bool)

(declare-fun e!742465 () Option!754)

(assert (=> b!1301680 (= e!742464 e!742465)))

(declare-fun c!124826 () Bool)

(assert (=> b!1301680 (= c!124826 (and ((_ is Cons!29746) (toList!10160 (ListLongMap!20290 Nil!29747))) (not (= (_1!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747)))) k0!1205))))))

(declare-fun b!1301682 () Bool)

(assert (=> b!1301682 (= e!742465 None!752)))

(declare-fun b!1301681 () Bool)

(assert (=> b!1301681 (= e!742465 (getValueByKey!703 (t!43318 (toList!10160 (ListLongMap!20290 Nil!29747))) k0!1205))))

(declare-fun d!141267 () Bool)

(declare-fun c!124825 () Bool)

(assert (=> d!141267 (= c!124825 (and ((_ is Cons!29746) (toList!10160 (ListLongMap!20290 Nil!29747))) (= (_1!11327 (h!30955 (toList!10160 (ListLongMap!20290 Nil!29747)))) k0!1205)))))

(assert (=> d!141267 (= (getValueByKey!703 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205) e!742464)))

(assert (= (and d!141267 c!124825) b!1301679))

(assert (= (and d!141267 (not c!124825)) b!1301680))

(assert (= (and b!1301680 c!124826) b!1301681))

(assert (= (and b!1301680 (not c!124826)) b!1301682))

(declare-fun m!1192131 () Bool)

(assert (=> b!1301681 m!1192131))

(assert (=> b!1301436 d!141267))

(declare-fun d!141269 () Bool)

(declare-fun e!742467 () Bool)

(assert (=> d!141269 e!742467))

(declare-fun res!864763 () Bool)

(assert (=> d!141269 (=> res!864763 e!742467)))

(declare-fun lt!582016 () Bool)

(assert (=> d!141269 (= res!864763 (not lt!582016))))

(declare-fun lt!582017 () Bool)

(assert (=> d!141269 (= lt!582016 lt!582017)))

(declare-fun lt!582019 () Unit!42908)

(declare-fun e!742466 () Unit!42908)

(assert (=> d!141269 (= lt!582019 e!742466)))

(declare-fun c!124827 () Bool)

(assert (=> d!141269 (= c!124827 lt!582017)))

(assert (=> d!141269 (= lt!582017 (containsKey!720 (toList!10160 lt!581812) (select (arr!41808 _keys!1741) from!2144)))))

(assert (=> d!141269 (= (contains!8216 lt!581812 (select (arr!41808 _keys!1741) from!2144)) lt!582016)))

(declare-fun b!1301683 () Bool)

(declare-fun lt!582018 () Unit!42908)

(assert (=> b!1301683 (= e!742466 lt!582018)))

(assert (=> b!1301683 (= lt!582018 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 lt!581812) (select (arr!41808 _keys!1741) from!2144)))))

(assert (=> b!1301683 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581812) (select (arr!41808 _keys!1741) from!2144)))))

(declare-fun b!1301684 () Bool)

(declare-fun Unit!42931 () Unit!42908)

(assert (=> b!1301684 (= e!742466 Unit!42931)))

(declare-fun b!1301685 () Bool)

(assert (=> b!1301685 (= e!742467 (isDefined!510 (getValueByKey!703 (toList!10160 lt!581812) (select (arr!41808 _keys!1741) from!2144))))))

(assert (= (and d!141269 c!124827) b!1301683))

(assert (= (and d!141269 (not c!124827)) b!1301684))

(assert (= (and d!141269 (not res!864763)) b!1301685))

(assert (=> d!141269 m!1191423))

(declare-fun m!1192133 () Bool)

(assert (=> d!141269 m!1192133))

(assert (=> b!1301683 m!1191423))

(declare-fun m!1192135 () Bool)

(assert (=> b!1301683 m!1192135))

(assert (=> b!1301683 m!1191423))

(assert (=> b!1301683 m!1192007))

(assert (=> b!1301683 m!1192007))

(declare-fun m!1192137 () Bool)

(assert (=> b!1301683 m!1192137))

(assert (=> b!1301685 m!1191423))

(assert (=> b!1301685 m!1192007))

(assert (=> b!1301685 m!1192007))

(assert (=> b!1301685 m!1192137))

(assert (=> b!1301344 d!141269))

(declare-fun d!141271 () Bool)

(assert (=> d!141271 (isDefined!510 (getValueByKey!703 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205))))

(declare-fun lt!582020 () Unit!42908)

(assert (=> d!141271 (= lt!582020 (choose!1915 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205))))

(declare-fun e!742468 () Bool)

(assert (=> d!141271 e!742468))

(declare-fun res!864764 () Bool)

(assert (=> d!141271 (=> (not res!864764) (not e!742468))))

(assert (=> d!141271 (= res!864764 (isStrictlySorted!867 (toList!10160 (ListLongMap!20290 Nil!29747))))))

(assert (=> d!141271 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205) lt!582020)))

(declare-fun b!1301686 () Bool)

(assert (=> b!1301686 (= e!742468 (containsKey!720 (toList!10160 (ListLongMap!20290 Nil!29747)) k0!1205))))

(assert (= (and d!141271 res!864764) b!1301686))

(assert (=> d!141271 m!1191707))

(assert (=> d!141271 m!1191707))

(assert (=> d!141271 m!1191709))

(declare-fun m!1192139 () Bool)

(assert (=> d!141271 m!1192139))

(assert (=> d!141271 m!1192041))

(assert (=> b!1301686 m!1191703))

(assert (=> b!1301434 d!141271))

(assert (=> b!1301434 d!141265))

(assert (=> b!1301434 d!141267))

(declare-fun d!141273 () Bool)

(declare-fun res!864765 () Bool)

(declare-fun e!742469 () Bool)

(assert (=> d!141273 (=> res!864765 e!742469)))

(assert (=> d!141273 (= res!864765 (and ((_ is Cons!29746) (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11327 (h!30955 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141273 (= (containsKey!720 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742469)))

(declare-fun b!1301687 () Bool)

(declare-fun e!742470 () Bool)

(assert (=> b!1301687 (= e!742469 e!742470)))

(declare-fun res!864766 () Bool)

(assert (=> b!1301687 (=> (not res!864766) (not e!742470))))

(assert (=> b!1301687 (= res!864766 (and (or (not ((_ is Cons!29746) (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11327 (h!30955 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29746) (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11327 (h!30955 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1301688 () Bool)

(assert (=> b!1301688 (= e!742470 (containsKey!720 (t!43318 (toList!10160 (getCurrentListMap!5070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141273 (not res!864765)) b!1301687))

(assert (= (and b!1301687 res!864766) b!1301688))

(declare-fun m!1192141 () Bool)

(assert (=> b!1301688 m!1192141))

(assert (=> d!141079 d!141273))

(declare-fun d!141275 () Bool)

(assert (=> d!141275 (= (get!21138 (select (arr!41807 _values!1445) from!2144) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3445 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301377 d!141275))

(assert (=> d!141101 d!141103))

(declare-fun d!141277 () Bool)

(assert (=> d!141277 (contains!8216 lt!581656 k0!1205)))

(assert (=> d!141277 true))

(declare-fun _$21!121 () Unit!42908)

(assert (=> d!141277 (= (choose!1913 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581656) _$21!121)))

(declare-fun bs!37046 () Bool)

(assert (= bs!37046 d!141277))

(assert (=> bs!37046 m!1191419))

(assert (=> d!141101 d!141277))

(declare-fun d!141279 () Bool)

(declare-fun e!742472 () Bool)

(assert (=> d!141279 e!742472))

(declare-fun res!864767 () Bool)

(assert (=> d!141279 (=> res!864767 e!742472)))

(declare-fun lt!582021 () Bool)

(assert (=> d!141279 (= res!864767 (not lt!582021))))

(declare-fun lt!582022 () Bool)

(assert (=> d!141279 (= lt!582021 lt!582022)))

(declare-fun lt!582024 () Unit!42908)

(declare-fun e!742471 () Unit!42908)

(assert (=> d!141279 (= lt!582024 e!742471)))

(declare-fun c!124828 () Bool)

(assert (=> d!141279 (= c!124828 lt!582022)))

(assert (=> d!141279 (= lt!582022 (containsKey!720 (toList!10160 (+!4498 lt!581656 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141279 (= (contains!8216 (+!4498 lt!581656 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!582021)))

(declare-fun b!1301689 () Bool)

(declare-fun lt!582023 () Unit!42908)

(assert (=> b!1301689 (= e!742471 lt!582023)))

(assert (=> b!1301689 (= lt!582023 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10160 (+!4498 lt!581656 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1301689 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 lt!581656 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1301690 () Bool)

(declare-fun Unit!42932 () Unit!42908)

(assert (=> b!1301690 (= e!742471 Unit!42932)))

(declare-fun b!1301691 () Bool)

(assert (=> b!1301691 (= e!742472 (isDefined!510 (getValueByKey!703 (toList!10160 (+!4498 lt!581656 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141279 c!124828) b!1301689))

(assert (= (and d!141279 (not c!124828)) b!1301690))

(assert (= (and d!141279 (not res!864767)) b!1301691))

(declare-fun m!1192143 () Bool)

(assert (=> d!141279 m!1192143))

(declare-fun m!1192145 () Bool)

(assert (=> b!1301689 m!1192145))

(declare-fun m!1192147 () Bool)

(assert (=> b!1301689 m!1192147))

(assert (=> b!1301689 m!1192147))

(declare-fun m!1192149 () Bool)

(assert (=> b!1301689 m!1192149))

(assert (=> b!1301691 m!1192147))

(assert (=> b!1301691 m!1192147))

(assert (=> b!1301691 m!1192149))

(assert (=> d!141101 d!141279))

(assert (=> d!141101 d!141099))

(declare-fun mapIsEmpty!53868 () Bool)

(declare-fun mapRes!53868 () Bool)

(assert (=> mapIsEmpty!53868 mapRes!53868))

(declare-fun b!1301693 () Bool)

(declare-fun e!742473 () Bool)

(assert (=> b!1301693 (= e!742473 tp_is_empty!34855)))

(declare-fun mapNonEmpty!53868 () Bool)

(declare-fun tp!102796 () Bool)

(declare-fun e!742474 () Bool)

(assert (=> mapNonEmpty!53868 (= mapRes!53868 (and tp!102796 e!742474))))

(declare-fun mapValue!53868 () ValueCell!16529)

(declare-fun mapKey!53868 () (_ BitVec 32))

(declare-fun mapRest!53868 () (Array (_ BitVec 32) ValueCell!16529))

(assert (=> mapNonEmpty!53868 (= mapRest!53867 (store mapRest!53868 mapKey!53868 mapValue!53868))))

(declare-fun condMapEmpty!53868 () Bool)

(declare-fun mapDefault!53868 () ValueCell!16529)

(assert (=> mapNonEmpty!53867 (= condMapEmpty!53868 (= mapRest!53867 ((as const (Array (_ BitVec 32) ValueCell!16529)) mapDefault!53868)))))

(assert (=> mapNonEmpty!53867 (= tp!102795 (and e!742473 mapRes!53868))))

(declare-fun b!1301692 () Bool)

(assert (=> b!1301692 (= e!742474 tp_is_empty!34855)))

(assert (= (and mapNonEmpty!53867 condMapEmpty!53868) mapIsEmpty!53868))

(assert (= (and mapNonEmpty!53867 (not condMapEmpty!53868)) mapNonEmpty!53868))

(assert (= (and mapNonEmpty!53868 ((_ is ValueCellFull!16529) mapValue!53868)) b!1301692))

(assert (= (and mapNonEmpty!53867 ((_ is ValueCellFull!16529) mapDefault!53868)) b!1301693))

(declare-fun m!1192151 () Bool)

(assert (=> mapNonEmpty!53868 m!1192151))

(declare-fun b_lambda!23199 () Bool)

(assert (= b_lambda!23197 (or (and start!109822 b_free!29215) b_lambda!23199)))

(declare-fun b_lambda!23201 () Bool)

(assert (= b_lambda!23195 (or (and start!109822 b_free!29215) b_lambda!23201)))

(check-sat tp_is_empty!34855 (not b!1301527) (not b!1301572) (not b!1301536) (not d!141163) (not bm!63950) (not b!1301551) (not b_lambda!23181) (not b!1301653) (not b!1301603) (not b!1301512) (not b!1301664) (not d!141187) (not d!141217) (not bm!63940) (not b!1301476) (not d!141191) (not b_lambda!23199) (not d!141211) (not d!141263) (not b!1301676) (not b!1301546) (not b!1301515) (not d!141203) (not d!141181) (not b!1301514) (not d!141145) (not b!1301534) (not b!1301519) (not d!141235) (not b!1301525) (not d!141173) (not b!1301545) (not b!1301615) (not b!1301662) (not b!1301528) (not d!141195) (not d!141159) (not d!141141) (not d!141231) (not b!1301623) (not b!1301521) (not d!141227) (not d!141165) (not b!1301564) (not b!1301561) (not bm!63939) (not b!1301502) (not b_lambda!23191) (not d!141213) (not b!1301655) (not d!141223) (not b!1301484) (not b!1301465) (not d!141193) (not b!1301686) (not mapNonEmpty!53868) (not d!141277) (not d!141265) (not d!141243) (not bm!63948) (not b_lambda!23193) (not d!141133) (not d!141229) (not b_lambda!23189) (not b!1301516) (not b!1301562) (not d!141175) (not b!1301683) (not d!141121) (not b!1301559) (not d!141167) (not d!141269) (not d!141119) (not b!1301607) (not b!1301497) (not d!141157) (not b!1301663) (not d!141249) (not b!1301542) (not b!1301570) (not b!1301513) (not b!1301462) (not b!1301582) (not b!1301618) (not d!141177) (not b!1301523) (not b!1301681) (not d!141153) (not b!1301657) (not b!1301511) (not d!141205) (not b!1301688) (not b!1301493) (not d!141155) (not d!141271) (not d!141257) (not d!141207) (not b!1301494) (not b!1301660) (not b!1301560) (not d!141261) (not b!1301673) (not d!141253) (not d!141135) (not bm!63952) (not b!1301499) (not b!1301489) (not d!141197) (not d!141169) (not b!1301504) (not b!1301496) (not b!1301648) (not b!1301647) (not b!1301541) (not d!141245) (not b!1301510) (not b!1301491) (not b!1301613) (not d!141147) (not b!1301581) (not b!1301543) (not b!1301689) (not d!141129) (not d!141171) (not b_lambda!23201) (not b!1301547) (not d!141139) (not b!1301503) (not b!1301685) (not d!141179) (not d!141215) (not b!1301629) (not b!1301509) (not d!141185) (not b!1301691) (not d!141149) (not b!1301486) (not b_next!29215) (not b!1301539) (not b!1301501) (not b!1301567) (not d!141239) (not b!1301668) (not b!1301522) (not b!1301569) (not b!1301650) (not d!141279) (not b!1301538) (not b!1301535) (not b!1301483) (not b!1301678) (not d!141189) (not b!1301619) (not d!141255) (not b!1301575) (not d!141143) (not b!1301533) (not d!141161) (not b!1301553) (not d!141183) (not b!1301612) b_and!47331 (not d!141123) (not b!1301621))
(check-sat b_and!47331 (not b_next!29215))
