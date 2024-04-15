; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109934 () Bool)

(assert start!109934)

(declare-fun b_free!29233 () Bool)

(declare-fun b_next!29233 () Bool)

(assert (=> start!109934 (= b_free!29233 (not b_next!29233))))

(declare-fun tp!102841 () Bool)

(declare-fun b_and!47357 () Bool)

(assert (=> start!109934 (= tp!102841 b_and!47357)))

(declare-fun b!1302216 () Bool)

(declare-fun res!865024 () Bool)

(declare-fun e!742761 () Bool)

(assert (=> b!1302216 (=> (not res!865024) (not e!742761))))

(declare-datatypes ((array!86659 0))(
  ( (array!86660 (arr!41824 (Array (_ BitVec 32) (_ BitVec 64))) (size!42376 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86659)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302216 (= res!865024 (not (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144))))))

(declare-fun b!1302217 () Bool)

(declare-fun e!742763 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1302217 (= e!742763 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1302218 () Bool)

(declare-fun e!742762 () Bool)

(declare-fun tp_is_empty!34873 () Bool)

(assert (=> b!1302218 (= e!742762 tp_is_empty!34873)))

(declare-fun b!1302219 () Bool)

(declare-fun e!742760 () Bool)

(assert (=> b!1302219 (= e!742760 tp_is_empty!34873)))

(declare-fun b!1302221 () Bool)

(declare-fun res!865027 () Bool)

(assert (=> b!1302221 (=> (not res!865027) (not e!742761))))

(declare-datatypes ((V!51601 0))(
  ( (V!51602 (val!17511 Int)) )
))
(declare-fun minValue!1387 () V!51601)

(declare-fun zeroValue!1387 () V!51601)

(declare-datatypes ((ValueCell!16538 0))(
  ( (ValueCellFull!16538 (v!20122 V!51601)) (EmptyCell!16538) )
))
(declare-datatypes ((array!86661 0))(
  ( (array!86662 (arr!41825 (Array (_ BitVec 32) ValueCell!16538)) (size!42377 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86661)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22650 0))(
  ( (tuple2!22651 (_1!11336 (_ BitVec 64)) (_2!11336 V!51601)) )
))
(declare-datatypes ((List!29764 0))(
  ( (Nil!29761) (Cons!29760 (h!30969 tuple2!22650) (t!43344 List!29764)) )
))
(declare-datatypes ((ListLongMap!20307 0))(
  ( (ListLongMap!20308 (toList!10169 List!29764)) )
))
(declare-fun contains!8227 (ListLongMap!20307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5076 (array!86659 array!86661 (_ BitVec 32) (_ BitVec 32) V!51601 V!51601 (_ BitVec 32) Int) ListLongMap!20307)

(assert (=> b!1302221 (= res!865027 (contains!8227 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302222 () Bool)

(declare-fun res!865029 () Bool)

(assert (=> b!1302222 (=> (not res!865029) (not e!742761))))

(assert (=> b!1302222 (= res!865029 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42376 _keys!1741))))))

(declare-fun b!1302223 () Bool)

(declare-fun e!742765 () Bool)

(assert (=> b!1302223 (= e!742761 (not e!742765))))

(declare-fun res!865026 () Bool)

(assert (=> b!1302223 (=> res!865026 e!742765)))

(assert (=> b!1302223 (= res!865026 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1302223 (not (contains!8227 (ListLongMap!20308 Nil!29761) k0!1205))))

(declare-datatypes ((Unit!42954 0))(
  ( (Unit!42955) )
))
(declare-fun lt!582382 () Unit!42954)

(declare-fun emptyContainsNothing!202 ((_ BitVec 64)) Unit!42954)

(assert (=> b!1302223 (= lt!582382 (emptyContainsNothing!202 k0!1205))))

(declare-fun b!1302224 () Bool)

(declare-fun res!865022 () Bool)

(assert (=> b!1302224 (=> (not res!865022) (not e!742761))))

(assert (=> b!1302224 (= res!865022 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741))))))

(declare-fun mapNonEmpty!53892 () Bool)

(declare-fun mapRes!53892 () Bool)

(declare-fun tp!102840 () Bool)

(assert (=> mapNonEmpty!53892 (= mapRes!53892 (and tp!102840 e!742762))))

(declare-fun mapValue!53892 () ValueCell!16538)

(declare-fun mapRest!53892 () (Array (_ BitVec 32) ValueCell!16538))

(declare-fun mapKey!53892 () (_ BitVec 32))

(assert (=> mapNonEmpty!53892 (= (arr!41825 _values!1445) (store mapRest!53892 mapKey!53892 mapValue!53892))))

(declare-fun b!1302225 () Bool)

(assert (=> b!1302225 (= e!742765 e!742763)))

(declare-fun res!865025 () Bool)

(assert (=> b!1302225 (=> (not res!865025) (not e!742763))))

(declare-fun getCurrentListMapNoExtraKeys!6137 (array!86659 array!86661 (_ BitVec 32) (_ BitVec 32) V!51601 V!51601 (_ BitVec 32) Int) ListLongMap!20307)

(assert (=> b!1302225 (= res!865025 (not (contains!8227 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1302226 () Bool)

(declare-fun e!742764 () Bool)

(assert (=> b!1302226 (= e!742764 (and e!742760 mapRes!53892))))

(declare-fun condMapEmpty!53892 () Bool)

(declare-fun mapDefault!53892 () ValueCell!16538)

(assert (=> b!1302226 (= condMapEmpty!53892 (= (arr!41825 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16538)) mapDefault!53892)))))

(declare-fun b!1302227 () Bool)

(declare-fun res!865028 () Bool)

(assert (=> b!1302227 (=> (not res!865028) (not e!742761))))

(assert (=> b!1302227 (= res!865028 (and (= (size!42377 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42376 _keys!1741) (size!42377 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!865023 () Bool)

(assert (=> start!109934 (=> (not res!865023) (not e!742761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109934 (= res!865023 (validMask!0 mask!2175))))

(assert (=> start!109934 e!742761))

(assert (=> start!109934 tp_is_empty!34873))

(assert (=> start!109934 true))

(declare-fun array_inv!31813 (array!86661) Bool)

(assert (=> start!109934 (and (array_inv!31813 _values!1445) e!742764)))

(declare-fun array_inv!31814 (array!86659) Bool)

(assert (=> start!109934 (array_inv!31814 _keys!1741)))

(assert (=> start!109934 tp!102841))

(declare-fun b!1302220 () Bool)

(declare-fun res!865030 () Bool)

(assert (=> b!1302220 (=> (not res!865030) (not e!742761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86659 (_ BitVec 32)) Bool)

(assert (=> b!1302220 (= res!865030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302228 () Bool)

(declare-fun res!865031 () Bool)

(assert (=> b!1302228 (=> (not res!865031) (not e!742761))))

(declare-datatypes ((List!29765 0))(
  ( (Nil!29762) (Cons!29761 (h!30970 (_ BitVec 64)) (t!43345 List!29765)) )
))
(declare-fun arrayNoDuplicates!0 (array!86659 (_ BitVec 32) List!29765) Bool)

(assert (=> b!1302228 (= res!865031 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29762))))

(declare-fun mapIsEmpty!53892 () Bool)

(assert (=> mapIsEmpty!53892 mapRes!53892))

(assert (= (and start!109934 res!865023) b!1302227))

(assert (= (and b!1302227 res!865028) b!1302220))

(assert (= (and b!1302220 res!865030) b!1302228))

(assert (= (and b!1302228 res!865031) b!1302224))

(assert (= (and b!1302224 res!865022) b!1302221))

(assert (= (and b!1302221 res!865027) b!1302222))

(assert (= (and b!1302222 res!865029) b!1302216))

(assert (= (and b!1302216 res!865024) b!1302223))

(assert (= (and b!1302223 (not res!865026)) b!1302225))

(assert (= (and b!1302225 res!865025) b!1302217))

(assert (= (and b!1302226 condMapEmpty!53892) mapIsEmpty!53892))

(assert (= (and b!1302226 (not condMapEmpty!53892)) mapNonEmpty!53892))

(get-info :version)

(assert (= (and mapNonEmpty!53892 ((_ is ValueCellFull!16538) mapValue!53892)) b!1302218))

(assert (= (and b!1302226 ((_ is ValueCellFull!16538) mapDefault!53892)) b!1302219))

(assert (= start!109934 b!1302226))

(declare-fun m!1192565 () Bool)

(assert (=> b!1302221 m!1192565))

(assert (=> b!1302221 m!1192565))

(declare-fun m!1192567 () Bool)

(assert (=> b!1302221 m!1192567))

(declare-fun m!1192569 () Bool)

(assert (=> b!1302228 m!1192569))

(declare-fun m!1192571 () Bool)

(assert (=> start!109934 m!1192571))

(declare-fun m!1192573 () Bool)

(assert (=> start!109934 m!1192573))

(declare-fun m!1192575 () Bool)

(assert (=> start!109934 m!1192575))

(declare-fun m!1192577 () Bool)

(assert (=> b!1302220 m!1192577))

(declare-fun m!1192579 () Bool)

(assert (=> b!1302225 m!1192579))

(assert (=> b!1302225 m!1192579))

(declare-fun m!1192581 () Bool)

(assert (=> b!1302225 m!1192581))

(declare-fun m!1192583 () Bool)

(assert (=> b!1302216 m!1192583))

(assert (=> b!1302216 m!1192583))

(declare-fun m!1192585 () Bool)

(assert (=> b!1302216 m!1192585))

(declare-fun m!1192587 () Bool)

(assert (=> b!1302223 m!1192587))

(declare-fun m!1192589 () Bool)

(assert (=> b!1302223 m!1192589))

(declare-fun m!1192591 () Bool)

(assert (=> mapNonEmpty!53892 m!1192591))

(check-sat (not start!109934) (not b!1302225) (not b!1302220) (not b!1302216) (not b!1302228) (not b_next!29233) (not b!1302221) tp_is_empty!34873 (not mapNonEmpty!53892) b_and!47357 (not b!1302223))
(check-sat b_and!47357 (not b_next!29233))
(get-model)

(declare-fun b!1302317 () Bool)

(declare-fun e!742819 () Bool)

(declare-fun call!64097 () Bool)

(assert (=> b!1302317 (= e!742819 call!64097)))

(declare-fun b!1302318 () Bool)

(declare-fun e!742816 () Bool)

(assert (=> b!1302318 (= e!742816 e!742819)))

(declare-fun c!124927 () Bool)

(assert (=> b!1302318 (= c!124927 (validKeyInArray!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302319 () Bool)

(declare-fun e!742817 () Bool)

(assert (=> b!1302319 (= e!742817 e!742816)))

(declare-fun res!865100 () Bool)

(assert (=> b!1302319 (=> (not res!865100) (not e!742816))))

(declare-fun e!742818 () Bool)

(assert (=> b!1302319 (= res!865100 (not e!742818))))

(declare-fun res!865098 () Bool)

(assert (=> b!1302319 (=> (not res!865098) (not e!742818))))

(assert (=> b!1302319 (= res!865098 (validKeyInArray!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141321 () Bool)

(declare-fun res!865099 () Bool)

(assert (=> d!141321 (=> res!865099 e!742817)))

(assert (=> d!141321 (= res!865099 (bvsge #b00000000000000000000000000000000 (size!42376 _keys!1741)))))

(assert (=> d!141321 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29762) e!742817)))

(declare-fun b!1302320 () Bool)

(declare-fun contains!8229 (List!29765 (_ BitVec 64)) Bool)

(assert (=> b!1302320 (= e!742818 (contains!8229 Nil!29762 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64094 () Bool)

(assert (=> bm!64094 (= call!64097 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124927 (Cons!29761 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) Nil!29762) Nil!29762)))))

(declare-fun b!1302321 () Bool)

(assert (=> b!1302321 (= e!742819 call!64097)))

(assert (= (and d!141321 (not res!865099)) b!1302319))

(assert (= (and b!1302319 res!865098) b!1302320))

(assert (= (and b!1302319 res!865100) b!1302318))

(assert (= (and b!1302318 c!124927) b!1302321))

(assert (= (and b!1302318 (not c!124927)) b!1302317))

(assert (= (or b!1302321 b!1302317) bm!64094))

(declare-fun m!1192649 () Bool)

(assert (=> b!1302318 m!1192649))

(assert (=> b!1302318 m!1192649))

(declare-fun m!1192651 () Bool)

(assert (=> b!1302318 m!1192651))

(assert (=> b!1302319 m!1192649))

(assert (=> b!1302319 m!1192649))

(assert (=> b!1302319 m!1192651))

(assert (=> b!1302320 m!1192649))

(assert (=> b!1302320 m!1192649))

(declare-fun m!1192653 () Bool)

(assert (=> b!1302320 m!1192653))

(assert (=> bm!64094 m!1192649))

(declare-fun m!1192655 () Bool)

(assert (=> bm!64094 m!1192655))

(assert (=> b!1302228 d!141321))

(declare-fun bm!64097 () Bool)

(declare-fun call!64100 () Bool)

(assert (=> bm!64097 (= call!64100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!141323 () Bool)

(declare-fun res!865105 () Bool)

(declare-fun e!742826 () Bool)

(assert (=> d!141323 (=> res!865105 e!742826)))

(assert (=> d!141323 (= res!865105 (bvsge #b00000000000000000000000000000000 (size!42376 _keys!1741)))))

(assert (=> d!141323 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742826)))

(declare-fun b!1302330 () Bool)

(declare-fun e!742827 () Bool)

(declare-fun e!742828 () Bool)

(assert (=> b!1302330 (= e!742827 e!742828)))

(declare-fun lt!582395 () (_ BitVec 64))

(assert (=> b!1302330 (= lt!582395 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582396 () Unit!42954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86659 (_ BitVec 64) (_ BitVec 32)) Unit!42954)

(assert (=> b!1302330 (= lt!582396 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582395 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1302330 (arrayContainsKey!0 _keys!1741 lt!582395 #b00000000000000000000000000000000)))

(declare-fun lt!582397 () Unit!42954)

(assert (=> b!1302330 (= lt!582397 lt!582396)))

(declare-fun res!865106 () Bool)

(declare-datatypes ((SeekEntryResult!10021 0))(
  ( (MissingZero!10021 (index!42455 (_ BitVec 32))) (Found!10021 (index!42456 (_ BitVec 32))) (Intermediate!10021 (undefined!10833 Bool) (index!42457 (_ BitVec 32)) (x!115672 (_ BitVec 32))) (Undefined!10021) (MissingVacant!10021 (index!42458 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86659 (_ BitVec 32)) SeekEntryResult!10021)

(assert (=> b!1302330 (= res!865106 (= (seekEntryOrOpen!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10021 #b00000000000000000000000000000000)))))

(assert (=> b!1302330 (=> (not res!865106) (not e!742828))))

(declare-fun b!1302331 () Bool)

(assert (=> b!1302331 (= e!742826 e!742827)))

(declare-fun c!124930 () Bool)

(assert (=> b!1302331 (= c!124930 (validKeyInArray!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302332 () Bool)

(assert (=> b!1302332 (= e!742828 call!64100)))

(declare-fun b!1302333 () Bool)

(assert (=> b!1302333 (= e!742827 call!64100)))

(assert (= (and d!141323 (not res!865105)) b!1302331))

(assert (= (and b!1302331 c!124930) b!1302330))

(assert (= (and b!1302331 (not c!124930)) b!1302333))

(assert (= (and b!1302330 res!865106) b!1302332))

(assert (= (or b!1302332 b!1302333) bm!64097))

(declare-fun m!1192657 () Bool)

(assert (=> bm!64097 m!1192657))

(assert (=> b!1302330 m!1192649))

(declare-fun m!1192659 () Bool)

(assert (=> b!1302330 m!1192659))

(declare-fun m!1192661 () Bool)

(assert (=> b!1302330 m!1192661))

(assert (=> b!1302330 m!1192649))

(declare-fun m!1192663 () Bool)

(assert (=> b!1302330 m!1192663))

(assert (=> b!1302331 m!1192649))

(assert (=> b!1302331 m!1192649))

(assert (=> b!1302331 m!1192651))

(assert (=> b!1302220 d!141323))

(declare-fun d!141325 () Bool)

(declare-fun e!742834 () Bool)

(assert (=> d!141325 e!742834))

(declare-fun res!865109 () Bool)

(assert (=> d!141325 (=> res!865109 e!742834)))

(declare-fun lt!582409 () Bool)

(assert (=> d!141325 (= res!865109 (not lt!582409))))

(declare-fun lt!582408 () Bool)

(assert (=> d!141325 (= lt!582409 lt!582408)))

(declare-fun lt!582406 () Unit!42954)

(declare-fun e!742833 () Unit!42954)

(assert (=> d!141325 (= lt!582406 e!742833)))

(declare-fun c!124933 () Bool)

(assert (=> d!141325 (= c!124933 lt!582408)))

(declare-fun containsKey!722 (List!29764 (_ BitVec 64)) Bool)

(assert (=> d!141325 (= lt!582408 (containsKey!722 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141325 (= (contains!8227 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582409)))

(declare-fun b!1302340 () Bool)

(declare-fun lt!582407 () Unit!42954)

(assert (=> b!1302340 (= e!742833 lt!582407)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!469 (List!29764 (_ BitVec 64)) Unit!42954)

(assert (=> b!1302340 (= lt!582407 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!756 0))(
  ( (Some!755 (v!20125 V!51601)) (None!754) )
))
(declare-fun isDefined!512 (Option!756) Bool)

(declare-fun getValueByKey!705 (List!29764 (_ BitVec 64)) Option!756)

(assert (=> b!1302340 (isDefined!512 (getValueByKey!705 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302341 () Bool)

(declare-fun Unit!42958 () Unit!42954)

(assert (=> b!1302341 (= e!742833 Unit!42958)))

(declare-fun b!1302342 () Bool)

(assert (=> b!1302342 (= e!742834 (isDefined!512 (getValueByKey!705 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141325 c!124933) b!1302340))

(assert (= (and d!141325 (not c!124933)) b!1302341))

(assert (= (and d!141325 (not res!865109)) b!1302342))

(declare-fun m!1192665 () Bool)

(assert (=> d!141325 m!1192665))

(declare-fun m!1192667 () Bool)

(assert (=> b!1302340 m!1192667))

(declare-fun m!1192669 () Bool)

(assert (=> b!1302340 m!1192669))

(assert (=> b!1302340 m!1192669))

(declare-fun m!1192671 () Bool)

(assert (=> b!1302340 m!1192671))

(assert (=> b!1302342 m!1192669))

(assert (=> b!1302342 m!1192669))

(assert (=> b!1302342 m!1192671))

(assert (=> b!1302225 d!141325))

(declare-fun b!1302367 () Bool)

(declare-fun res!865119 () Bool)

(declare-fun e!742854 () Bool)

(assert (=> b!1302367 (=> (not res!865119) (not e!742854))))

(declare-fun lt!582426 () ListLongMap!20307)

(assert (=> b!1302367 (= res!865119 (not (contains!8227 lt!582426 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302368 () Bool)

(declare-fun e!742849 () ListLongMap!20307)

(assert (=> b!1302368 (= e!742849 (ListLongMap!20308 Nil!29761))))

(declare-fun b!1302369 () Bool)

(declare-fun lt!582428 () Unit!42954)

(declare-fun lt!582430 () Unit!42954)

(assert (=> b!1302369 (= lt!582428 lt!582430)))

(declare-fun lt!582425 () V!51601)

(declare-fun lt!582429 () (_ BitVec 64))

(declare-fun lt!582427 () (_ BitVec 64))

(declare-fun lt!582424 () ListLongMap!20307)

(declare-fun +!4505 (ListLongMap!20307 tuple2!22650) ListLongMap!20307)

(assert (=> b!1302369 (not (contains!8227 (+!4505 lt!582424 (tuple2!22651 lt!582427 lt!582425)) lt!582429))))

(declare-fun addStillNotContains!458 (ListLongMap!20307 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!42954)

(assert (=> b!1302369 (= lt!582430 (addStillNotContains!458 lt!582424 lt!582427 lt!582425 lt!582429))))

(assert (=> b!1302369 (= lt!582429 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21148 (ValueCell!16538 V!51601) V!51601)

(declare-fun dynLambda!3450 (Int (_ BitVec 64)) V!51601)

(assert (=> b!1302369 (= lt!582425 (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302369 (= lt!582427 (select (arr!41824 _keys!1741) from!2144))))

(declare-fun call!64103 () ListLongMap!20307)

(assert (=> b!1302369 (= lt!582424 call!64103)))

(declare-fun e!742852 () ListLongMap!20307)

(assert (=> b!1302369 (= e!742852 (+!4505 call!64103 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302370 () Bool)

(assert (=> b!1302370 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))

(assert (=> b!1302370 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42377 _values!1445)))))

(declare-fun e!742850 () Bool)

(declare-fun apply!1012 (ListLongMap!20307 (_ BitVec 64)) V!51601)

(assert (=> b!1302370 (= e!742850 (= (apply!1012 lt!582426 (select (arr!41824 _keys!1741) from!2144)) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1302371 () Bool)

(assert (=> b!1302371 (= e!742852 call!64103)))

(declare-fun b!1302373 () Bool)

(declare-fun e!742853 () Bool)

(declare-fun e!742855 () Bool)

(assert (=> b!1302373 (= e!742853 e!742855)))

(declare-fun c!124942 () Bool)

(assert (=> b!1302373 (= c!124942 (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1302374 () Bool)

(declare-fun isEmpty!1063 (ListLongMap!20307) Bool)

(assert (=> b!1302374 (= e!742855 (isEmpty!1063 lt!582426))))

(declare-fun b!1302375 () Bool)

(assert (=> b!1302375 (= e!742849 e!742852)))

(declare-fun c!124945 () Bool)

(assert (=> b!1302375 (= c!124945 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun bm!64100 () Bool)

(assert (=> bm!64100 (= call!64103 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1302376 () Bool)

(assert (=> b!1302376 (= e!742853 e!742850)))

(assert (=> b!1302376 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun res!865118 () Bool)

(assert (=> b!1302376 (= res!865118 (contains!8227 lt!582426 (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> b!1302376 (=> (not res!865118) (not e!742850))))

(declare-fun b!1302377 () Bool)

(declare-fun e!742851 () Bool)

(assert (=> b!1302377 (= e!742851 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> b!1302377 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1302378 () Bool)

(assert (=> b!1302378 (= e!742854 e!742853)))

(declare-fun c!124943 () Bool)

(assert (=> b!1302378 (= c!124943 e!742851)))

(declare-fun res!865120 () Bool)

(assert (=> b!1302378 (=> (not res!865120) (not e!742851))))

(assert (=> b!1302378 (= res!865120 (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1302372 () Bool)

(assert (=> b!1302372 (= e!742855 (= lt!582426 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun d!141327 () Bool)

(assert (=> d!141327 e!742854))

(declare-fun res!865121 () Bool)

(assert (=> d!141327 (=> (not res!865121) (not e!742854))))

(assert (=> d!141327 (= res!865121 (not (contains!8227 lt!582426 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141327 (= lt!582426 e!742849)))

(declare-fun c!124944 () Bool)

(assert (=> d!141327 (= c!124944 (bvsge from!2144 (size!42376 _keys!1741)))))

(assert (=> d!141327 (validMask!0 mask!2175)))

(assert (=> d!141327 (= (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582426)))

(assert (= (and d!141327 c!124944) b!1302368))

(assert (= (and d!141327 (not c!124944)) b!1302375))

(assert (= (and b!1302375 c!124945) b!1302369))

(assert (= (and b!1302375 (not c!124945)) b!1302371))

(assert (= (or b!1302369 b!1302371) bm!64100))

(assert (= (and d!141327 res!865121) b!1302367))

(assert (= (and b!1302367 res!865119) b!1302378))

(assert (= (and b!1302378 res!865120) b!1302377))

(assert (= (and b!1302378 c!124943) b!1302376))

(assert (= (and b!1302378 (not c!124943)) b!1302373))

(assert (= (and b!1302376 res!865118) b!1302370))

(assert (= (and b!1302373 c!124942) b!1302372))

(assert (= (and b!1302373 (not c!124942)) b!1302374))

(declare-fun b_lambda!23221 () Bool)

(assert (=> (not b_lambda!23221) (not b!1302369)))

(declare-fun t!43348 () Bool)

(declare-fun tb!11385 () Bool)

(assert (=> (and start!109934 (= defaultEntry!1448 defaultEntry!1448) t!43348) tb!11385))

(declare-fun result!23793 () Bool)

(assert (=> tb!11385 (= result!23793 tp_is_empty!34873)))

(assert (=> b!1302369 t!43348))

(declare-fun b_and!47363 () Bool)

(assert (= b_and!47357 (and (=> t!43348 result!23793) b_and!47363)))

(declare-fun b_lambda!23223 () Bool)

(assert (=> (not b_lambda!23223) (not b!1302370)))

(assert (=> b!1302370 t!43348))

(declare-fun b_and!47365 () Bool)

(assert (= b_and!47363 (and (=> t!43348 result!23793) b_and!47365)))

(declare-fun m!1192673 () Bool)

(assert (=> b!1302369 m!1192673))

(declare-fun m!1192675 () Bool)

(assert (=> b!1302369 m!1192675))

(declare-fun m!1192677 () Bool)

(assert (=> b!1302369 m!1192677))

(declare-fun m!1192679 () Bool)

(assert (=> b!1302369 m!1192679))

(declare-fun m!1192681 () Bool)

(assert (=> b!1302369 m!1192681))

(declare-fun m!1192683 () Bool)

(assert (=> b!1302369 m!1192683))

(assert (=> b!1302369 m!1192679))

(assert (=> b!1302369 m!1192675))

(declare-fun m!1192685 () Bool)

(assert (=> b!1302369 m!1192685))

(assert (=> b!1302369 m!1192673))

(assert (=> b!1302369 m!1192583))

(declare-fun m!1192687 () Bool)

(assert (=> b!1302372 m!1192687))

(assert (=> b!1302375 m!1192583))

(assert (=> b!1302375 m!1192583))

(assert (=> b!1302375 m!1192585))

(assert (=> b!1302376 m!1192583))

(assert (=> b!1302376 m!1192583))

(declare-fun m!1192689 () Bool)

(assert (=> b!1302376 m!1192689))

(assert (=> b!1302377 m!1192583))

(assert (=> b!1302377 m!1192583))

(assert (=> b!1302377 m!1192585))

(assert (=> bm!64100 m!1192687))

(declare-fun m!1192691 () Bool)

(assert (=> b!1302367 m!1192691))

(declare-fun m!1192693 () Bool)

(assert (=> d!141327 m!1192693))

(assert (=> d!141327 m!1192571))

(declare-fun m!1192695 () Bool)

(assert (=> b!1302374 m!1192695))

(assert (=> b!1302370 m!1192673))

(assert (=> b!1302370 m!1192675))

(assert (=> b!1302370 m!1192677))

(assert (=> b!1302370 m!1192583))

(declare-fun m!1192697 () Bool)

(assert (=> b!1302370 m!1192697))

(assert (=> b!1302370 m!1192675))

(assert (=> b!1302370 m!1192673))

(assert (=> b!1302370 m!1192583))

(assert (=> b!1302225 d!141327))

(declare-fun d!141329 () Bool)

(declare-fun e!742857 () Bool)

(assert (=> d!141329 e!742857))

(declare-fun res!865122 () Bool)

(assert (=> d!141329 (=> res!865122 e!742857)))

(declare-fun lt!582434 () Bool)

(assert (=> d!141329 (= res!865122 (not lt!582434))))

(declare-fun lt!582433 () Bool)

(assert (=> d!141329 (= lt!582434 lt!582433)))

(declare-fun lt!582431 () Unit!42954)

(declare-fun e!742856 () Unit!42954)

(assert (=> d!141329 (= lt!582431 e!742856)))

(declare-fun c!124946 () Bool)

(assert (=> d!141329 (= c!124946 lt!582433)))

(assert (=> d!141329 (= lt!582433 (containsKey!722 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141329 (= (contains!8227 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582434)))

(declare-fun b!1302381 () Bool)

(declare-fun lt!582432 () Unit!42954)

(assert (=> b!1302381 (= e!742856 lt!582432)))

(assert (=> b!1302381 (= lt!582432 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1302381 (isDefined!512 (getValueByKey!705 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302382 () Bool)

(declare-fun Unit!42959 () Unit!42954)

(assert (=> b!1302382 (= e!742856 Unit!42959)))

(declare-fun b!1302383 () Bool)

(assert (=> b!1302383 (= e!742857 (isDefined!512 (getValueByKey!705 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141329 c!124946) b!1302381))

(assert (= (and d!141329 (not c!124946)) b!1302382))

(assert (= (and d!141329 (not res!865122)) b!1302383))

(declare-fun m!1192699 () Bool)

(assert (=> d!141329 m!1192699))

(declare-fun m!1192701 () Bool)

(assert (=> b!1302381 m!1192701))

(declare-fun m!1192703 () Bool)

(assert (=> b!1302381 m!1192703))

(assert (=> b!1302381 m!1192703))

(declare-fun m!1192705 () Bool)

(assert (=> b!1302381 m!1192705))

(assert (=> b!1302383 m!1192703))

(assert (=> b!1302383 m!1192703))

(assert (=> b!1302383 m!1192705))

(assert (=> b!1302221 d!141329))

(declare-fun b!1302426 () Bool)

(declare-fun lt!582491 () ListLongMap!20307)

(declare-fun e!742887 () Bool)

(assert (=> b!1302426 (= e!742887 (= (apply!1012 lt!582491 (select (arr!41824 _keys!1741) from!2144)) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302426 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42377 _values!1445)))))

(assert (=> b!1302426 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun bm!64115 () Bool)

(declare-fun call!64123 () ListLongMap!20307)

(declare-fun call!64118 () ListLongMap!20307)

(assert (=> bm!64115 (= call!64123 call!64118)))

(declare-fun b!1302427 () Bool)

(declare-fun e!742892 () Unit!42954)

(declare-fun Unit!42960 () Unit!42954)

(assert (=> b!1302427 (= e!742892 Unit!42960)))

(declare-fun bm!64116 () Bool)

(declare-fun call!64124 () Bool)

(assert (=> bm!64116 (= call!64124 (contains!8227 lt!582491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302428 () Bool)

(declare-fun lt!582497 () Unit!42954)

(assert (=> b!1302428 (= e!742892 lt!582497)))

(declare-fun lt!582486 () ListLongMap!20307)

(assert (=> b!1302428 (= lt!582486 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582490 () (_ BitVec 64))

(assert (=> b!1302428 (= lt!582490 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582480 () (_ BitVec 64))

(assert (=> b!1302428 (= lt!582480 (select (arr!41824 _keys!1741) from!2144))))

(declare-fun lt!582496 () Unit!42954)

(declare-fun addStillContains!1107 (ListLongMap!20307 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!42954)

(assert (=> b!1302428 (= lt!582496 (addStillContains!1107 lt!582486 lt!582490 zeroValue!1387 lt!582480))))

(assert (=> b!1302428 (contains!8227 (+!4505 lt!582486 (tuple2!22651 lt!582490 zeroValue!1387)) lt!582480)))

(declare-fun lt!582494 () Unit!42954)

(assert (=> b!1302428 (= lt!582494 lt!582496)))

(declare-fun lt!582493 () ListLongMap!20307)

(assert (=> b!1302428 (= lt!582493 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582485 () (_ BitVec 64))

(assert (=> b!1302428 (= lt!582485 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582488 () (_ BitVec 64))

(assert (=> b!1302428 (= lt!582488 (select (arr!41824 _keys!1741) from!2144))))

(declare-fun lt!582489 () Unit!42954)

(declare-fun addApplyDifferent!550 (ListLongMap!20307 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!42954)

(assert (=> b!1302428 (= lt!582489 (addApplyDifferent!550 lt!582493 lt!582485 minValue!1387 lt!582488))))

(assert (=> b!1302428 (= (apply!1012 (+!4505 lt!582493 (tuple2!22651 lt!582485 minValue!1387)) lt!582488) (apply!1012 lt!582493 lt!582488))))

(declare-fun lt!582481 () Unit!42954)

(assert (=> b!1302428 (= lt!582481 lt!582489)))

(declare-fun lt!582498 () ListLongMap!20307)

(assert (=> b!1302428 (= lt!582498 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582479 () (_ BitVec 64))

(assert (=> b!1302428 (= lt!582479 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582487 () (_ BitVec 64))

(assert (=> b!1302428 (= lt!582487 (select (arr!41824 _keys!1741) from!2144))))

(declare-fun lt!582483 () Unit!42954)

(assert (=> b!1302428 (= lt!582483 (addApplyDifferent!550 lt!582498 lt!582479 zeroValue!1387 lt!582487))))

(assert (=> b!1302428 (= (apply!1012 (+!4505 lt!582498 (tuple2!22651 lt!582479 zeroValue!1387)) lt!582487) (apply!1012 lt!582498 lt!582487))))

(declare-fun lt!582499 () Unit!42954)

(assert (=> b!1302428 (= lt!582499 lt!582483)))

(declare-fun lt!582484 () ListLongMap!20307)

(assert (=> b!1302428 (= lt!582484 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582500 () (_ BitVec 64))

(assert (=> b!1302428 (= lt!582500 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582492 () (_ BitVec 64))

(assert (=> b!1302428 (= lt!582492 (select (arr!41824 _keys!1741) from!2144))))

(assert (=> b!1302428 (= lt!582497 (addApplyDifferent!550 lt!582484 lt!582500 minValue!1387 lt!582492))))

(assert (=> b!1302428 (= (apply!1012 (+!4505 lt!582484 (tuple2!22651 lt!582500 minValue!1387)) lt!582492) (apply!1012 lt!582484 lt!582492))))

(declare-fun b!1302429 () Bool)

(declare-fun e!742888 () Bool)

(assert (=> b!1302429 (= e!742888 (= (apply!1012 lt!582491 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1302430 () Bool)

(declare-fun e!742896 () Bool)

(declare-fun e!742885 () Bool)

(assert (=> b!1302430 (= e!742896 e!742885)))

(declare-fun c!124959 () Bool)

(assert (=> b!1302430 (= c!124959 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302431 () Bool)

(declare-fun e!742889 () Bool)

(assert (=> b!1302431 (= e!742885 e!742889)))

(declare-fun res!865148 () Bool)

(declare-fun call!64119 () Bool)

(assert (=> b!1302431 (= res!865148 call!64119)))

(assert (=> b!1302431 (=> (not res!865148) (not e!742889))))

(declare-fun b!1302432 () Bool)

(declare-fun e!742890 () Bool)

(assert (=> b!1302432 (= e!742890 e!742887)))

(declare-fun res!865142 () Bool)

(assert (=> b!1302432 (=> (not res!865142) (not e!742887))))

(assert (=> b!1302432 (= res!865142 (contains!8227 lt!582491 (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> b!1302432 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1302433 () Bool)

(declare-fun res!865143 () Bool)

(assert (=> b!1302433 (=> (not res!865143) (not e!742896))))

(assert (=> b!1302433 (= res!865143 e!742890)))

(declare-fun res!865147 () Bool)

(assert (=> b!1302433 (=> res!865147 e!742890)))

(declare-fun e!742884 () Bool)

(assert (=> b!1302433 (= res!865147 (not e!742884))))

(declare-fun res!865146 () Bool)

(assert (=> b!1302433 (=> (not res!865146) (not e!742884))))

(assert (=> b!1302433 (= res!865146 (bvslt from!2144 (size!42376 _keys!1741)))))

(declare-fun b!1302434 () Bool)

(declare-fun e!742886 () Bool)

(assert (=> b!1302434 (= e!742886 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun b!1302436 () Bool)

(declare-fun res!865144 () Bool)

(assert (=> b!1302436 (=> (not res!865144) (not e!742896))))

(declare-fun e!742893 () Bool)

(assert (=> b!1302436 (= res!865144 e!742893)))

(declare-fun c!124963 () Bool)

(assert (=> b!1302436 (= c!124963 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64117 () Bool)

(assert (=> bm!64117 (= call!64118 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302437 () Bool)

(assert (=> b!1302437 (= e!742889 (= (apply!1012 lt!582491 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1302438 () Bool)

(assert (=> b!1302438 (= e!742893 e!742888)))

(declare-fun res!865145 () Bool)

(assert (=> b!1302438 (= res!865145 call!64124)))

(assert (=> b!1302438 (=> (not res!865145) (not e!742888))))

(declare-fun b!1302439 () Bool)

(assert (=> b!1302439 (= e!742885 (not call!64119))))

(declare-fun b!1302440 () Bool)

(declare-fun e!742891 () ListLongMap!20307)

(declare-fun call!64121 () ListLongMap!20307)

(assert (=> b!1302440 (= e!742891 call!64121)))

(declare-fun bm!64118 () Bool)

(declare-fun call!64122 () ListLongMap!20307)

(assert (=> bm!64118 (= call!64121 call!64122)))

(declare-fun bm!64119 () Bool)

(declare-fun call!64120 () ListLongMap!20307)

(assert (=> bm!64119 (= call!64120 call!64123)))

(declare-fun b!1302441 () Bool)

(assert (=> b!1302441 (= e!742884 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun b!1302442 () Bool)

(declare-fun e!742895 () ListLongMap!20307)

(assert (=> b!1302442 (= e!742895 call!64120)))

(declare-fun c!124962 () Bool)

(declare-fun bm!64120 () Bool)

(declare-fun c!124961 () Bool)

(assert (=> bm!64120 (= call!64122 (+!4505 (ite c!124961 call!64118 (ite c!124962 call!64123 call!64120)) (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64121 () Bool)

(assert (=> bm!64121 (= call!64119 (contains!8227 lt!582491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302443 () Bool)

(declare-fun e!742894 () ListLongMap!20307)

(assert (=> b!1302443 (= e!742894 (+!4505 call!64122 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1302444 () Bool)

(assert (=> b!1302444 (= e!742893 (not call!64124))))

(declare-fun b!1302445 () Bool)

(declare-fun c!124960 () Bool)

(assert (=> b!1302445 (= c!124960 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1302445 (= e!742891 e!742895)))

(declare-fun b!1302446 () Bool)

(assert (=> b!1302446 (= e!742894 e!742891)))

(assert (=> b!1302446 (= c!124962 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!141331 () Bool)

(assert (=> d!141331 e!742896))

(declare-fun res!865149 () Bool)

(assert (=> d!141331 (=> (not res!865149) (not e!742896))))

(assert (=> d!141331 (= res!865149 (or (bvsge from!2144 (size!42376 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42376 _keys!1741)))))))

(declare-fun lt!582482 () ListLongMap!20307)

(assert (=> d!141331 (= lt!582491 lt!582482)))

(declare-fun lt!582495 () Unit!42954)

(assert (=> d!141331 (= lt!582495 e!742892)))

(declare-fun c!124964 () Bool)

(assert (=> d!141331 (= c!124964 e!742886)))

(declare-fun res!865141 () Bool)

(assert (=> d!141331 (=> (not res!865141) (not e!742886))))

(assert (=> d!141331 (= res!865141 (bvslt from!2144 (size!42376 _keys!1741)))))

(assert (=> d!141331 (= lt!582482 e!742894)))

(assert (=> d!141331 (= c!124961 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141331 (validMask!0 mask!2175)))

(assert (=> d!141331 (= (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582491)))

(declare-fun b!1302435 () Bool)

(assert (=> b!1302435 (= e!742895 call!64121)))

(assert (= (and d!141331 c!124961) b!1302443))

(assert (= (and d!141331 (not c!124961)) b!1302446))

(assert (= (and b!1302446 c!124962) b!1302440))

(assert (= (and b!1302446 (not c!124962)) b!1302445))

(assert (= (and b!1302445 c!124960) b!1302435))

(assert (= (and b!1302445 (not c!124960)) b!1302442))

(assert (= (or b!1302435 b!1302442) bm!64119))

(assert (= (or b!1302440 bm!64119) bm!64115))

(assert (= (or b!1302440 b!1302435) bm!64118))

(assert (= (or b!1302443 bm!64115) bm!64117))

(assert (= (or b!1302443 bm!64118) bm!64120))

(assert (= (and d!141331 res!865141) b!1302434))

(assert (= (and d!141331 c!124964) b!1302428))

(assert (= (and d!141331 (not c!124964)) b!1302427))

(assert (= (and d!141331 res!865149) b!1302433))

(assert (= (and b!1302433 res!865146) b!1302441))

(assert (= (and b!1302433 (not res!865147)) b!1302432))

(assert (= (and b!1302432 res!865142) b!1302426))

(assert (= (and b!1302433 res!865143) b!1302436))

(assert (= (and b!1302436 c!124963) b!1302438))

(assert (= (and b!1302436 (not c!124963)) b!1302444))

(assert (= (and b!1302438 res!865145) b!1302429))

(assert (= (or b!1302438 b!1302444) bm!64116))

(assert (= (and b!1302436 res!865144) b!1302430))

(assert (= (and b!1302430 c!124959) b!1302431))

(assert (= (and b!1302430 (not c!124959)) b!1302439))

(assert (= (and b!1302431 res!865148) b!1302437))

(assert (= (or b!1302431 b!1302439) bm!64121))

(declare-fun b_lambda!23225 () Bool)

(assert (=> (not b_lambda!23225) (not b!1302426)))

(assert (=> b!1302426 t!43348))

(declare-fun b_and!47367 () Bool)

(assert (= b_and!47365 (and (=> t!43348 result!23793) b_and!47367)))

(assert (=> b!1302441 m!1192583))

(assert (=> b!1302441 m!1192583))

(assert (=> b!1302441 m!1192585))

(assert (=> d!141331 m!1192571))

(declare-fun m!1192707 () Bool)

(assert (=> b!1302429 m!1192707))

(declare-fun m!1192709 () Bool)

(assert (=> bm!64116 m!1192709))

(assert (=> bm!64117 m!1192579))

(declare-fun m!1192711 () Bool)

(assert (=> b!1302437 m!1192711))

(assert (=> b!1302432 m!1192583))

(assert (=> b!1302432 m!1192583))

(declare-fun m!1192713 () Bool)

(assert (=> b!1302432 m!1192713))

(declare-fun m!1192715 () Bool)

(assert (=> bm!64121 m!1192715))

(assert (=> b!1302428 m!1192583))

(declare-fun m!1192717 () Bool)

(assert (=> b!1302428 m!1192717))

(declare-fun m!1192719 () Bool)

(assert (=> b!1302428 m!1192719))

(declare-fun m!1192721 () Bool)

(assert (=> b!1302428 m!1192721))

(declare-fun m!1192723 () Bool)

(assert (=> b!1302428 m!1192723))

(declare-fun m!1192725 () Bool)

(assert (=> b!1302428 m!1192725))

(declare-fun m!1192727 () Bool)

(assert (=> b!1302428 m!1192727))

(declare-fun m!1192729 () Bool)

(assert (=> b!1302428 m!1192729))

(declare-fun m!1192731 () Bool)

(assert (=> b!1302428 m!1192731))

(declare-fun m!1192733 () Bool)

(assert (=> b!1302428 m!1192733))

(assert (=> b!1302428 m!1192731))

(declare-fun m!1192735 () Bool)

(assert (=> b!1302428 m!1192735))

(assert (=> b!1302428 m!1192729))

(declare-fun m!1192737 () Bool)

(assert (=> b!1302428 m!1192737))

(assert (=> b!1302428 m!1192717))

(declare-fun m!1192739 () Bool)

(assert (=> b!1302428 m!1192739))

(declare-fun m!1192741 () Bool)

(assert (=> b!1302428 m!1192741))

(declare-fun m!1192743 () Bool)

(assert (=> b!1302428 m!1192743))

(assert (=> b!1302428 m!1192739))

(declare-fun m!1192745 () Bool)

(assert (=> b!1302428 m!1192745))

(assert (=> b!1302428 m!1192579))

(assert (=> b!1302434 m!1192583))

(assert (=> b!1302434 m!1192583))

(assert (=> b!1302434 m!1192585))

(declare-fun m!1192747 () Bool)

(assert (=> bm!64120 m!1192747))

(assert (=> b!1302426 m!1192583))

(assert (=> b!1302426 m!1192673))

(assert (=> b!1302426 m!1192583))

(declare-fun m!1192749 () Bool)

(assert (=> b!1302426 m!1192749))

(assert (=> b!1302426 m!1192673))

(assert (=> b!1302426 m!1192675))

(assert (=> b!1302426 m!1192677))

(assert (=> b!1302426 m!1192675))

(declare-fun m!1192751 () Bool)

(assert (=> b!1302443 m!1192751))

(assert (=> b!1302221 d!141331))

(declare-fun d!141333 () Bool)

(assert (=> d!141333 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109934 d!141333))

(declare-fun d!141335 () Bool)

(assert (=> d!141335 (= (array_inv!31813 _values!1445) (bvsge (size!42377 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109934 d!141335))

(declare-fun d!141337 () Bool)

(assert (=> d!141337 (= (array_inv!31814 _keys!1741) (bvsge (size!42376 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109934 d!141337))

(declare-fun d!141339 () Bool)

(assert (=> d!141339 (= (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)) (and (not (= (select (arr!41824 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41824 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302216 d!141339))

(declare-fun d!141341 () Bool)

(declare-fun e!742898 () Bool)

(assert (=> d!141341 e!742898))

(declare-fun res!865150 () Bool)

(assert (=> d!141341 (=> res!865150 e!742898)))

(declare-fun lt!582504 () Bool)

(assert (=> d!141341 (= res!865150 (not lt!582504))))

(declare-fun lt!582503 () Bool)

(assert (=> d!141341 (= lt!582504 lt!582503)))

(declare-fun lt!582501 () Unit!42954)

(declare-fun e!742897 () Unit!42954)

(assert (=> d!141341 (= lt!582501 e!742897)))

(declare-fun c!124965 () Bool)

(assert (=> d!141341 (= c!124965 lt!582503)))

(assert (=> d!141341 (= lt!582503 (containsKey!722 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205))))

(assert (=> d!141341 (= (contains!8227 (ListLongMap!20308 Nil!29761) k0!1205) lt!582504)))

(declare-fun b!1302447 () Bool)

(declare-fun lt!582502 () Unit!42954)

(assert (=> b!1302447 (= e!742897 lt!582502)))

(assert (=> b!1302447 (= lt!582502 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205))))

(assert (=> b!1302447 (isDefined!512 (getValueByKey!705 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205))))

(declare-fun b!1302448 () Bool)

(declare-fun Unit!42961 () Unit!42954)

(assert (=> b!1302448 (= e!742897 Unit!42961)))

(declare-fun b!1302449 () Bool)

(assert (=> b!1302449 (= e!742898 (isDefined!512 (getValueByKey!705 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205)))))

(assert (= (and d!141341 c!124965) b!1302447))

(assert (= (and d!141341 (not c!124965)) b!1302448))

(assert (= (and d!141341 (not res!865150)) b!1302449))

(declare-fun m!1192753 () Bool)

(assert (=> d!141341 m!1192753))

(declare-fun m!1192755 () Bool)

(assert (=> b!1302447 m!1192755))

(declare-fun m!1192757 () Bool)

(assert (=> b!1302447 m!1192757))

(assert (=> b!1302447 m!1192757))

(declare-fun m!1192759 () Bool)

(assert (=> b!1302447 m!1192759))

(assert (=> b!1302449 m!1192757))

(assert (=> b!1302449 m!1192757))

(assert (=> b!1302449 m!1192759))

(assert (=> b!1302223 d!141341))

(declare-fun d!141343 () Bool)

(assert (=> d!141343 (not (contains!8227 (ListLongMap!20308 Nil!29761) k0!1205))))

(declare-fun lt!582507 () Unit!42954)

(declare-fun choose!1921 ((_ BitVec 64)) Unit!42954)

(assert (=> d!141343 (= lt!582507 (choose!1921 k0!1205))))

(assert (=> d!141343 (= (emptyContainsNothing!202 k0!1205) lt!582507)))

(declare-fun bs!37059 () Bool)

(assert (= bs!37059 d!141343))

(assert (=> bs!37059 m!1192587))

(declare-fun m!1192761 () Bool)

(assert (=> bs!37059 m!1192761))

(assert (=> b!1302223 d!141343))

(declare-fun b!1302456 () Bool)

(declare-fun e!742904 () Bool)

(assert (=> b!1302456 (= e!742904 tp_is_empty!34873)))

(declare-fun condMapEmpty!53901 () Bool)

(declare-fun mapDefault!53901 () ValueCell!16538)

(assert (=> mapNonEmpty!53892 (= condMapEmpty!53901 (= mapRest!53892 ((as const (Array (_ BitVec 32) ValueCell!16538)) mapDefault!53901)))))

(declare-fun e!742903 () Bool)

(declare-fun mapRes!53901 () Bool)

(assert (=> mapNonEmpty!53892 (= tp!102840 (and e!742903 mapRes!53901))))

(declare-fun mapIsEmpty!53901 () Bool)

(assert (=> mapIsEmpty!53901 mapRes!53901))

(declare-fun mapNonEmpty!53901 () Bool)

(declare-fun tp!102856 () Bool)

(assert (=> mapNonEmpty!53901 (= mapRes!53901 (and tp!102856 e!742904))))

(declare-fun mapValue!53901 () ValueCell!16538)

(declare-fun mapRest!53901 () (Array (_ BitVec 32) ValueCell!16538))

(declare-fun mapKey!53901 () (_ BitVec 32))

(assert (=> mapNonEmpty!53901 (= mapRest!53892 (store mapRest!53901 mapKey!53901 mapValue!53901))))

(declare-fun b!1302457 () Bool)

(assert (=> b!1302457 (= e!742903 tp_is_empty!34873)))

(assert (= (and mapNonEmpty!53892 condMapEmpty!53901) mapIsEmpty!53901))

(assert (= (and mapNonEmpty!53892 (not condMapEmpty!53901)) mapNonEmpty!53901))

(assert (= (and mapNonEmpty!53901 ((_ is ValueCellFull!16538) mapValue!53901)) b!1302456))

(assert (= (and mapNonEmpty!53892 ((_ is ValueCellFull!16538) mapDefault!53901)) b!1302457))

(declare-fun m!1192763 () Bool)

(assert (=> mapNonEmpty!53901 m!1192763))

(declare-fun b_lambda!23227 () Bool)

(assert (= b_lambda!23221 (or (and start!109934 b_free!29233) b_lambda!23227)))

(declare-fun b_lambda!23229 () Bool)

(assert (= b_lambda!23223 (or (and start!109934 b_free!29233) b_lambda!23229)))

(declare-fun b_lambda!23231 () Bool)

(assert (= b_lambda!23225 (or (and start!109934 b_free!29233) b_lambda!23231)))

(check-sat (not b!1302319) (not b!1302432) (not bm!64121) (not b_lambda!23231) (not b!1302372) (not b!1302377) (not b!1302369) (not b_lambda!23227) (not d!141325) (not b!1302449) (not d!141341) (not b!1302330) (not b!1302375) (not bm!64117) (not b!1302447) (not b!1302426) (not b!1302318) (not b!1302383) (not b!1302437) (not bm!64094) (not b!1302443) (not b!1302370) (not bm!64120) b_and!47367 (not b!1302374) (not b!1302340) (not d!141331) (not b_next!29233) (not d!141327) (not b!1302367) (not b!1302429) (not b!1302331) (not b_lambda!23229) (not b!1302434) (not b!1302441) (not b!1302376) (not mapNonEmpty!53901) (not b!1302381) (not b!1302428) (not b!1302320) (not bm!64100) (not bm!64116) (not b!1302342) (not d!141329) (not bm!64097) (not d!141343) tp_is_empty!34873)
(check-sat b_and!47367 (not b_next!29233))
(get-model)

(declare-fun b!1302458 () Bool)

(declare-fun res!865152 () Bool)

(declare-fun e!742910 () Bool)

(assert (=> b!1302458 (=> (not res!865152) (not e!742910))))

(declare-fun lt!582510 () ListLongMap!20307)

(assert (=> b!1302458 (= res!865152 (not (contains!8227 lt!582510 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302459 () Bool)

(declare-fun e!742905 () ListLongMap!20307)

(assert (=> b!1302459 (= e!742905 (ListLongMap!20308 Nil!29761))))

(declare-fun b!1302460 () Bool)

(declare-fun lt!582512 () Unit!42954)

(declare-fun lt!582514 () Unit!42954)

(assert (=> b!1302460 (= lt!582512 lt!582514)))

(declare-fun lt!582508 () ListLongMap!20307)

(declare-fun lt!582509 () V!51601)

(declare-fun lt!582511 () (_ BitVec 64))

(declare-fun lt!582513 () (_ BitVec 64))

(assert (=> b!1302460 (not (contains!8227 (+!4505 lt!582508 (tuple2!22651 lt!582511 lt!582509)) lt!582513))))

(assert (=> b!1302460 (= lt!582514 (addStillNotContains!458 lt!582508 lt!582511 lt!582509 lt!582513))))

(assert (=> b!1302460 (= lt!582513 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1302460 (= lt!582509 (get!21148 (select (arr!41825 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302460 (= lt!582511 (select (arr!41824 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(declare-fun call!64125 () ListLongMap!20307)

(assert (=> b!1302460 (= lt!582508 call!64125)))

(declare-fun e!742908 () ListLongMap!20307)

(assert (=> b!1302460 (= e!742908 (+!4505 call!64125 (tuple2!22651 (select (arr!41824 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21148 (select (arr!41825 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302461 () Bool)

(assert (=> b!1302461 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42376 _keys!1741)))))

(assert (=> b!1302461 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42377 _values!1445)))))

(declare-fun e!742906 () Bool)

(assert (=> b!1302461 (= e!742906 (= (apply!1012 lt!582510 (select (arr!41824 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21148 (select (arr!41825 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1302462 () Bool)

(assert (=> b!1302462 (= e!742908 call!64125)))

(declare-fun b!1302464 () Bool)

(declare-fun e!742909 () Bool)

(declare-fun e!742911 () Bool)

(assert (=> b!1302464 (= e!742909 e!742911)))

(declare-fun c!124966 () Bool)

(assert (=> b!1302464 (= c!124966 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42376 _keys!1741)))))

(declare-fun b!1302465 () Bool)

(assert (=> b!1302465 (= e!742911 (isEmpty!1063 lt!582510))))

(declare-fun b!1302466 () Bool)

(assert (=> b!1302466 (= e!742905 e!742908)))

(declare-fun c!124969 () Bool)

(assert (=> b!1302466 (= c!124969 (validKeyInArray!0 (select (arr!41824 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun bm!64122 () Bool)

(assert (=> bm!64122 (= call!64125 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1302467 () Bool)

(assert (=> b!1302467 (= e!742909 e!742906)))

(assert (=> b!1302467 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42376 _keys!1741)))))

(declare-fun res!865151 () Bool)

(assert (=> b!1302467 (= res!865151 (contains!8227 lt!582510 (select (arr!41824 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1302467 (=> (not res!865151) (not e!742906))))

(declare-fun b!1302468 () Bool)

(declare-fun e!742907 () Bool)

(assert (=> b!1302468 (= e!742907 (validKeyInArray!0 (select (arr!41824 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1302468 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1302469 () Bool)

(assert (=> b!1302469 (= e!742910 e!742909)))

(declare-fun c!124967 () Bool)

(assert (=> b!1302469 (= c!124967 e!742907)))

(declare-fun res!865153 () Bool)

(assert (=> b!1302469 (=> (not res!865153) (not e!742907))))

(assert (=> b!1302469 (= res!865153 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42376 _keys!1741)))))

(declare-fun b!1302463 () Bool)

(assert (=> b!1302463 (= e!742911 (= lt!582510 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun d!141345 () Bool)

(assert (=> d!141345 e!742910))

(declare-fun res!865154 () Bool)

(assert (=> d!141345 (=> (not res!865154) (not e!742910))))

(assert (=> d!141345 (= res!865154 (not (contains!8227 lt!582510 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141345 (= lt!582510 e!742905)))

(declare-fun c!124968 () Bool)

(assert (=> d!141345 (= c!124968 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42376 _keys!1741)))))

(assert (=> d!141345 (validMask!0 mask!2175)))

(assert (=> d!141345 (= (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!582510)))

(assert (= (and d!141345 c!124968) b!1302459))

(assert (= (and d!141345 (not c!124968)) b!1302466))

(assert (= (and b!1302466 c!124969) b!1302460))

(assert (= (and b!1302466 (not c!124969)) b!1302462))

(assert (= (or b!1302460 b!1302462) bm!64122))

(assert (= (and d!141345 res!865154) b!1302458))

(assert (= (and b!1302458 res!865152) b!1302469))

(assert (= (and b!1302469 res!865153) b!1302468))

(assert (= (and b!1302469 c!124967) b!1302467))

(assert (= (and b!1302469 (not c!124967)) b!1302464))

(assert (= (and b!1302467 res!865151) b!1302461))

(assert (= (and b!1302464 c!124966) b!1302463))

(assert (= (and b!1302464 (not c!124966)) b!1302465))

(declare-fun b_lambda!23233 () Bool)

(assert (=> (not b_lambda!23233) (not b!1302460)))

(assert (=> b!1302460 t!43348))

(declare-fun b_and!47369 () Bool)

(assert (= b_and!47367 (and (=> t!43348 result!23793) b_and!47369)))

(declare-fun b_lambda!23235 () Bool)

(assert (=> (not b_lambda!23235) (not b!1302461)))

(assert (=> b!1302461 t!43348))

(declare-fun b_and!47371 () Bool)

(assert (= b_and!47369 (and (=> t!43348 result!23793) b_and!47371)))

(declare-fun m!1192765 () Bool)

(assert (=> b!1302460 m!1192765))

(assert (=> b!1302460 m!1192675))

(declare-fun m!1192767 () Bool)

(assert (=> b!1302460 m!1192767))

(declare-fun m!1192769 () Bool)

(assert (=> b!1302460 m!1192769))

(declare-fun m!1192771 () Bool)

(assert (=> b!1302460 m!1192771))

(declare-fun m!1192773 () Bool)

(assert (=> b!1302460 m!1192773))

(assert (=> b!1302460 m!1192769))

(assert (=> b!1302460 m!1192675))

(declare-fun m!1192775 () Bool)

(assert (=> b!1302460 m!1192775))

(assert (=> b!1302460 m!1192765))

(declare-fun m!1192777 () Bool)

(assert (=> b!1302460 m!1192777))

(declare-fun m!1192779 () Bool)

(assert (=> b!1302463 m!1192779))

(assert (=> b!1302466 m!1192777))

(assert (=> b!1302466 m!1192777))

(declare-fun m!1192781 () Bool)

(assert (=> b!1302466 m!1192781))

(assert (=> b!1302467 m!1192777))

(assert (=> b!1302467 m!1192777))

(declare-fun m!1192783 () Bool)

(assert (=> b!1302467 m!1192783))

(assert (=> b!1302468 m!1192777))

(assert (=> b!1302468 m!1192777))

(assert (=> b!1302468 m!1192781))

(assert (=> bm!64122 m!1192779))

(declare-fun m!1192785 () Bool)

(assert (=> b!1302458 m!1192785))

(declare-fun m!1192787 () Bool)

(assert (=> d!141345 m!1192787))

(assert (=> d!141345 m!1192571))

(declare-fun m!1192789 () Bool)

(assert (=> b!1302465 m!1192789))

(assert (=> b!1302461 m!1192765))

(assert (=> b!1302461 m!1192675))

(assert (=> b!1302461 m!1192767))

(assert (=> b!1302461 m!1192777))

(declare-fun m!1192791 () Bool)

(assert (=> b!1302461 m!1192791))

(assert (=> b!1302461 m!1192675))

(assert (=> b!1302461 m!1192765))

(assert (=> b!1302461 m!1192777))

(assert (=> b!1302372 d!141345))

(declare-fun d!141347 () Bool)

(assert (=> d!141347 (isDefined!512 (getValueByKey!705 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!582517 () Unit!42954)

(declare-fun choose!1922 (List!29764 (_ BitVec 64)) Unit!42954)

(assert (=> d!141347 (= lt!582517 (choose!1922 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!742914 () Bool)

(assert (=> d!141347 e!742914))

(declare-fun res!865157 () Bool)

(assert (=> d!141347 (=> (not res!865157) (not e!742914))))

(declare-fun isStrictlySorted!868 (List!29764) Bool)

(assert (=> d!141347 (= res!865157 (isStrictlySorted!868 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141347 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!582517)))

(declare-fun b!1302472 () Bool)

(assert (=> b!1302472 (= e!742914 (containsKey!722 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141347 res!865157) b!1302472))

(assert (=> d!141347 m!1192703))

(assert (=> d!141347 m!1192703))

(assert (=> d!141347 m!1192705))

(declare-fun m!1192793 () Bool)

(assert (=> d!141347 m!1192793))

(declare-fun m!1192795 () Bool)

(assert (=> d!141347 m!1192795))

(assert (=> b!1302472 m!1192699))

(assert (=> b!1302381 d!141347))

(declare-fun d!141349 () Bool)

(declare-fun isEmpty!1064 (Option!756) Bool)

(assert (=> d!141349 (= (isDefined!512 (getValueByKey!705 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1064 (getValueByKey!705 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37060 () Bool)

(assert (= bs!37060 d!141349))

(assert (=> bs!37060 m!1192703))

(declare-fun m!1192797 () Bool)

(assert (=> bs!37060 m!1192797))

(assert (=> b!1302381 d!141349))

(declare-fun e!742919 () Option!756)

(declare-fun b!1302481 () Bool)

(assert (=> b!1302481 (= e!742919 (Some!755 (_2!11336 (h!30969 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1302482 () Bool)

(declare-fun e!742920 () Option!756)

(assert (=> b!1302482 (= e!742919 e!742920)))

(declare-fun c!124975 () Bool)

(assert (=> b!1302482 (= c!124975 (and ((_ is Cons!29760) (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11336 (h!30969 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun d!141351 () Bool)

(declare-fun c!124974 () Bool)

(assert (=> d!141351 (= c!124974 (and ((_ is Cons!29760) (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11336 (h!30969 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141351 (= (getValueByKey!705 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742919)))

(declare-fun b!1302484 () Bool)

(assert (=> b!1302484 (= e!742920 None!754)))

(declare-fun b!1302483 () Bool)

(assert (=> b!1302483 (= e!742920 (getValueByKey!705 (t!43344 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141351 c!124974) b!1302481))

(assert (= (and d!141351 (not c!124974)) b!1302482))

(assert (= (and b!1302482 c!124975) b!1302483))

(assert (= (and b!1302482 (not c!124975)) b!1302484))

(declare-fun m!1192799 () Bool)

(assert (=> b!1302483 m!1192799))

(assert (=> b!1302381 d!141351))

(declare-fun d!141353 () Bool)

(declare-fun get!21149 (Option!756) V!51601)

(assert (=> d!141353 (= (apply!1012 lt!582491 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21149 (getValueByKey!705 (toList!10169 lt!582491) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37061 () Bool)

(assert (= bs!37061 d!141353))

(declare-fun m!1192801 () Bool)

(assert (=> bs!37061 m!1192801))

(assert (=> bs!37061 m!1192801))

(declare-fun m!1192803 () Bool)

(assert (=> bs!37061 m!1192803))

(assert (=> b!1302429 d!141353))

(declare-fun d!141355 () Bool)

(assert (=> d!141355 (= (validKeyInArray!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302318 d!141355))

(declare-fun d!141357 () Bool)

(assert (=> d!141357 (= (isDefined!512 (getValueByKey!705 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205)) (not (isEmpty!1064 (getValueByKey!705 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205))))))

(declare-fun bs!37062 () Bool)

(assert (= bs!37062 d!141357))

(assert (=> bs!37062 m!1192757))

(declare-fun m!1192805 () Bool)

(assert (=> bs!37062 m!1192805))

(assert (=> b!1302449 d!141357))

(declare-fun b!1302485 () Bool)

(declare-fun e!742921 () Option!756)

(assert (=> b!1302485 (= e!742921 (Some!755 (_2!11336 (h!30969 (toList!10169 (ListLongMap!20308 Nil!29761))))))))

(declare-fun b!1302486 () Bool)

(declare-fun e!742922 () Option!756)

(assert (=> b!1302486 (= e!742921 e!742922)))

(declare-fun c!124977 () Bool)

(assert (=> b!1302486 (= c!124977 (and ((_ is Cons!29760) (toList!10169 (ListLongMap!20308 Nil!29761))) (not (= (_1!11336 (h!30969 (toList!10169 (ListLongMap!20308 Nil!29761)))) k0!1205))))))

(declare-fun d!141359 () Bool)

(declare-fun c!124976 () Bool)

(assert (=> d!141359 (= c!124976 (and ((_ is Cons!29760) (toList!10169 (ListLongMap!20308 Nil!29761))) (= (_1!11336 (h!30969 (toList!10169 (ListLongMap!20308 Nil!29761)))) k0!1205)))))

(assert (=> d!141359 (= (getValueByKey!705 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205) e!742921)))

(declare-fun b!1302488 () Bool)

(assert (=> b!1302488 (= e!742922 None!754)))

(declare-fun b!1302487 () Bool)

(assert (=> b!1302487 (= e!742922 (getValueByKey!705 (t!43344 (toList!10169 (ListLongMap!20308 Nil!29761))) k0!1205))))

(assert (= (and d!141359 c!124976) b!1302485))

(assert (= (and d!141359 (not c!124976)) b!1302486))

(assert (= (and b!1302486 c!124977) b!1302487))

(assert (= (and b!1302486 (not c!124977)) b!1302488))

(declare-fun m!1192807 () Bool)

(assert (=> b!1302487 m!1192807))

(assert (=> b!1302449 d!141359))

(declare-fun d!141361 () Bool)

(assert (=> d!141361 (= (apply!1012 lt!582426 (select (arr!41824 _keys!1741) from!2144)) (get!21149 (getValueByKey!705 (toList!10169 lt!582426) (select (arr!41824 _keys!1741) from!2144))))))

(declare-fun bs!37063 () Bool)

(assert (= bs!37063 d!141361))

(assert (=> bs!37063 m!1192583))

(declare-fun m!1192809 () Bool)

(assert (=> bs!37063 m!1192809))

(assert (=> bs!37063 m!1192809))

(declare-fun m!1192811 () Bool)

(assert (=> bs!37063 m!1192811))

(assert (=> b!1302370 d!141361))

(declare-fun d!141363 () Bool)

(declare-fun c!124980 () Bool)

(assert (=> d!141363 (= c!124980 ((_ is ValueCellFull!16538) (select (arr!41825 _values!1445) from!2144)))))

(declare-fun e!742925 () V!51601)

(assert (=> d!141363 (= (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!742925)))

(declare-fun b!1302493 () Bool)

(declare-fun get!21150 (ValueCell!16538 V!51601) V!51601)

(assert (=> b!1302493 (= e!742925 (get!21150 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302494 () Bool)

(declare-fun get!21151 (ValueCell!16538 V!51601) V!51601)

(assert (=> b!1302494 (= e!742925 (get!21151 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141363 c!124980) b!1302493))

(assert (= (and d!141363 (not c!124980)) b!1302494))

(assert (=> b!1302493 m!1192673))

(assert (=> b!1302493 m!1192675))

(declare-fun m!1192813 () Bool)

(assert (=> b!1302493 m!1192813))

(assert (=> b!1302494 m!1192673))

(assert (=> b!1302494 m!1192675))

(declare-fun m!1192815 () Bool)

(assert (=> b!1302494 m!1192815))

(assert (=> b!1302370 d!141363))

(declare-fun d!141365 () Bool)

(assert (=> d!141365 (= (apply!1012 (+!4505 lt!582484 (tuple2!22651 lt!582500 minValue!1387)) lt!582492) (apply!1012 lt!582484 lt!582492))))

(declare-fun lt!582520 () Unit!42954)

(declare-fun choose!1923 (ListLongMap!20307 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!42954)

(assert (=> d!141365 (= lt!582520 (choose!1923 lt!582484 lt!582500 minValue!1387 lt!582492))))

(declare-fun e!742928 () Bool)

(assert (=> d!141365 e!742928))

(declare-fun res!865160 () Bool)

(assert (=> d!141365 (=> (not res!865160) (not e!742928))))

(assert (=> d!141365 (= res!865160 (contains!8227 lt!582484 lt!582492))))

(assert (=> d!141365 (= (addApplyDifferent!550 lt!582484 lt!582500 minValue!1387 lt!582492) lt!582520)))

(declare-fun b!1302498 () Bool)

(assert (=> b!1302498 (= e!742928 (not (= lt!582492 lt!582500)))))

(assert (= (and d!141365 res!865160) b!1302498))

(declare-fun m!1192817 () Bool)

(assert (=> d!141365 m!1192817))

(assert (=> d!141365 m!1192729))

(declare-fun m!1192819 () Bool)

(assert (=> d!141365 m!1192819))

(assert (=> d!141365 m!1192721))

(assert (=> d!141365 m!1192729))

(assert (=> d!141365 m!1192737))

(assert (=> b!1302428 d!141365))

(declare-fun d!141367 () Bool)

(assert (=> d!141367 (= (apply!1012 (+!4505 lt!582498 (tuple2!22651 lt!582479 zeroValue!1387)) lt!582487) (apply!1012 lt!582498 lt!582487))))

(declare-fun lt!582521 () Unit!42954)

(assert (=> d!141367 (= lt!582521 (choose!1923 lt!582498 lt!582479 zeroValue!1387 lt!582487))))

(declare-fun e!742929 () Bool)

(assert (=> d!141367 e!742929))

(declare-fun res!865161 () Bool)

(assert (=> d!141367 (=> (not res!865161) (not e!742929))))

(assert (=> d!141367 (= res!865161 (contains!8227 lt!582498 lt!582487))))

(assert (=> d!141367 (= (addApplyDifferent!550 lt!582498 lt!582479 zeroValue!1387 lt!582487) lt!582521)))

(declare-fun b!1302499 () Bool)

(assert (=> b!1302499 (= e!742929 (not (= lt!582487 lt!582479)))))

(assert (= (and d!141367 res!865161) b!1302499))

(declare-fun m!1192821 () Bool)

(assert (=> d!141367 m!1192821))

(assert (=> d!141367 m!1192739))

(declare-fun m!1192823 () Bool)

(assert (=> d!141367 m!1192823))

(assert (=> d!141367 m!1192735))

(assert (=> d!141367 m!1192739))

(assert (=> d!141367 m!1192741))

(assert (=> b!1302428 d!141367))

(declare-fun d!141369 () Bool)

(assert (=> d!141369 (= (apply!1012 lt!582484 lt!582492) (get!21149 (getValueByKey!705 (toList!10169 lt!582484) lt!582492)))))

(declare-fun bs!37064 () Bool)

(assert (= bs!37064 d!141369))

(declare-fun m!1192825 () Bool)

(assert (=> bs!37064 m!1192825))

(assert (=> bs!37064 m!1192825))

(declare-fun m!1192827 () Bool)

(assert (=> bs!37064 m!1192827))

(assert (=> b!1302428 d!141369))

(declare-fun d!141371 () Bool)

(declare-fun e!742932 () Bool)

(assert (=> d!141371 e!742932))

(declare-fun res!865167 () Bool)

(assert (=> d!141371 (=> (not res!865167) (not e!742932))))

(declare-fun lt!582532 () ListLongMap!20307)

(assert (=> d!141371 (= res!865167 (contains!8227 lt!582532 (_1!11336 (tuple2!22651 lt!582500 minValue!1387))))))

(declare-fun lt!582530 () List!29764)

(assert (=> d!141371 (= lt!582532 (ListLongMap!20308 lt!582530))))

(declare-fun lt!582533 () Unit!42954)

(declare-fun lt!582531 () Unit!42954)

(assert (=> d!141371 (= lt!582533 lt!582531)))

(assert (=> d!141371 (= (getValueByKey!705 lt!582530 (_1!11336 (tuple2!22651 lt!582500 minValue!1387))) (Some!755 (_2!11336 (tuple2!22651 lt!582500 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!349 (List!29764 (_ BitVec 64) V!51601) Unit!42954)

(assert (=> d!141371 (= lt!582531 (lemmaContainsTupThenGetReturnValue!349 lt!582530 (_1!11336 (tuple2!22651 lt!582500 minValue!1387)) (_2!11336 (tuple2!22651 lt!582500 minValue!1387))))))

(declare-fun insertStrictlySorted!478 (List!29764 (_ BitVec 64) V!51601) List!29764)

(assert (=> d!141371 (= lt!582530 (insertStrictlySorted!478 (toList!10169 lt!582484) (_1!11336 (tuple2!22651 lt!582500 minValue!1387)) (_2!11336 (tuple2!22651 lt!582500 minValue!1387))))))

(assert (=> d!141371 (= (+!4505 lt!582484 (tuple2!22651 lt!582500 minValue!1387)) lt!582532)))

(declare-fun b!1302504 () Bool)

(declare-fun res!865166 () Bool)

(assert (=> b!1302504 (=> (not res!865166) (not e!742932))))

(assert (=> b!1302504 (= res!865166 (= (getValueByKey!705 (toList!10169 lt!582532) (_1!11336 (tuple2!22651 lt!582500 minValue!1387))) (Some!755 (_2!11336 (tuple2!22651 lt!582500 minValue!1387)))))))

(declare-fun b!1302505 () Bool)

(declare-fun contains!8230 (List!29764 tuple2!22650) Bool)

(assert (=> b!1302505 (= e!742932 (contains!8230 (toList!10169 lt!582532) (tuple2!22651 lt!582500 minValue!1387)))))

(assert (= (and d!141371 res!865167) b!1302504))

(assert (= (and b!1302504 res!865166) b!1302505))

(declare-fun m!1192829 () Bool)

(assert (=> d!141371 m!1192829))

(declare-fun m!1192831 () Bool)

(assert (=> d!141371 m!1192831))

(declare-fun m!1192833 () Bool)

(assert (=> d!141371 m!1192833))

(declare-fun m!1192835 () Bool)

(assert (=> d!141371 m!1192835))

(declare-fun m!1192837 () Bool)

(assert (=> b!1302504 m!1192837))

(declare-fun m!1192839 () Bool)

(assert (=> b!1302505 m!1192839))

(assert (=> b!1302428 d!141371))

(declare-fun d!141373 () Bool)

(assert (=> d!141373 (= (apply!1012 lt!582493 lt!582488) (get!21149 (getValueByKey!705 (toList!10169 lt!582493) lt!582488)))))

(declare-fun bs!37065 () Bool)

(assert (= bs!37065 d!141373))

(declare-fun m!1192841 () Bool)

(assert (=> bs!37065 m!1192841))

(assert (=> bs!37065 m!1192841))

(declare-fun m!1192843 () Bool)

(assert (=> bs!37065 m!1192843))

(assert (=> b!1302428 d!141373))

(declare-fun d!141375 () Bool)

(declare-fun e!742933 () Bool)

(assert (=> d!141375 e!742933))

(declare-fun res!865169 () Bool)

(assert (=> d!141375 (=> (not res!865169) (not e!742933))))

(declare-fun lt!582536 () ListLongMap!20307)

(assert (=> d!141375 (= res!865169 (contains!8227 lt!582536 (_1!11336 (tuple2!22651 lt!582490 zeroValue!1387))))))

(declare-fun lt!582534 () List!29764)

(assert (=> d!141375 (= lt!582536 (ListLongMap!20308 lt!582534))))

(declare-fun lt!582537 () Unit!42954)

(declare-fun lt!582535 () Unit!42954)

(assert (=> d!141375 (= lt!582537 lt!582535)))

(assert (=> d!141375 (= (getValueByKey!705 lt!582534 (_1!11336 (tuple2!22651 lt!582490 zeroValue!1387))) (Some!755 (_2!11336 (tuple2!22651 lt!582490 zeroValue!1387))))))

(assert (=> d!141375 (= lt!582535 (lemmaContainsTupThenGetReturnValue!349 lt!582534 (_1!11336 (tuple2!22651 lt!582490 zeroValue!1387)) (_2!11336 (tuple2!22651 lt!582490 zeroValue!1387))))))

(assert (=> d!141375 (= lt!582534 (insertStrictlySorted!478 (toList!10169 lt!582486) (_1!11336 (tuple2!22651 lt!582490 zeroValue!1387)) (_2!11336 (tuple2!22651 lt!582490 zeroValue!1387))))))

(assert (=> d!141375 (= (+!4505 lt!582486 (tuple2!22651 lt!582490 zeroValue!1387)) lt!582536)))

(declare-fun b!1302506 () Bool)

(declare-fun res!865168 () Bool)

(assert (=> b!1302506 (=> (not res!865168) (not e!742933))))

(assert (=> b!1302506 (= res!865168 (= (getValueByKey!705 (toList!10169 lt!582536) (_1!11336 (tuple2!22651 lt!582490 zeroValue!1387))) (Some!755 (_2!11336 (tuple2!22651 lt!582490 zeroValue!1387)))))))

(declare-fun b!1302507 () Bool)

(assert (=> b!1302507 (= e!742933 (contains!8230 (toList!10169 lt!582536) (tuple2!22651 lt!582490 zeroValue!1387)))))

(assert (= (and d!141375 res!865169) b!1302506))

(assert (= (and b!1302506 res!865168) b!1302507))

(declare-fun m!1192845 () Bool)

(assert (=> d!141375 m!1192845))

(declare-fun m!1192847 () Bool)

(assert (=> d!141375 m!1192847))

(declare-fun m!1192849 () Bool)

(assert (=> d!141375 m!1192849))

(declare-fun m!1192851 () Bool)

(assert (=> d!141375 m!1192851))

(declare-fun m!1192853 () Bool)

(assert (=> b!1302506 m!1192853))

(declare-fun m!1192855 () Bool)

(assert (=> b!1302507 m!1192855))

(assert (=> b!1302428 d!141375))

(assert (=> b!1302428 d!141327))

(declare-fun d!141377 () Bool)

(declare-fun e!742935 () Bool)

(assert (=> d!141377 e!742935))

(declare-fun res!865170 () Bool)

(assert (=> d!141377 (=> res!865170 e!742935)))

(declare-fun lt!582541 () Bool)

(assert (=> d!141377 (= res!865170 (not lt!582541))))

(declare-fun lt!582540 () Bool)

(assert (=> d!141377 (= lt!582541 lt!582540)))

(declare-fun lt!582538 () Unit!42954)

(declare-fun e!742934 () Unit!42954)

(assert (=> d!141377 (= lt!582538 e!742934)))

(declare-fun c!124981 () Bool)

(assert (=> d!141377 (= c!124981 lt!582540)))

(assert (=> d!141377 (= lt!582540 (containsKey!722 (toList!10169 (+!4505 lt!582486 (tuple2!22651 lt!582490 zeroValue!1387))) lt!582480))))

(assert (=> d!141377 (= (contains!8227 (+!4505 lt!582486 (tuple2!22651 lt!582490 zeroValue!1387)) lt!582480) lt!582541)))

(declare-fun b!1302508 () Bool)

(declare-fun lt!582539 () Unit!42954)

(assert (=> b!1302508 (= e!742934 lt!582539)))

(assert (=> b!1302508 (= lt!582539 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 (+!4505 lt!582486 (tuple2!22651 lt!582490 zeroValue!1387))) lt!582480))))

(assert (=> b!1302508 (isDefined!512 (getValueByKey!705 (toList!10169 (+!4505 lt!582486 (tuple2!22651 lt!582490 zeroValue!1387))) lt!582480))))

(declare-fun b!1302509 () Bool)

(declare-fun Unit!42962 () Unit!42954)

(assert (=> b!1302509 (= e!742934 Unit!42962)))

(declare-fun b!1302510 () Bool)

(assert (=> b!1302510 (= e!742935 (isDefined!512 (getValueByKey!705 (toList!10169 (+!4505 lt!582486 (tuple2!22651 lt!582490 zeroValue!1387))) lt!582480)))))

(assert (= (and d!141377 c!124981) b!1302508))

(assert (= (and d!141377 (not c!124981)) b!1302509))

(assert (= (and d!141377 (not res!865170)) b!1302510))

(declare-fun m!1192857 () Bool)

(assert (=> d!141377 m!1192857))

(declare-fun m!1192859 () Bool)

(assert (=> b!1302508 m!1192859))

(declare-fun m!1192861 () Bool)

(assert (=> b!1302508 m!1192861))

(assert (=> b!1302508 m!1192861))

(declare-fun m!1192863 () Bool)

(assert (=> b!1302508 m!1192863))

(assert (=> b!1302510 m!1192861))

(assert (=> b!1302510 m!1192861))

(assert (=> b!1302510 m!1192863))

(assert (=> b!1302428 d!141377))

(declare-fun d!141379 () Bool)

(assert (=> d!141379 (= (apply!1012 (+!4505 lt!582498 (tuple2!22651 lt!582479 zeroValue!1387)) lt!582487) (get!21149 (getValueByKey!705 (toList!10169 (+!4505 lt!582498 (tuple2!22651 lt!582479 zeroValue!1387))) lt!582487)))))

(declare-fun bs!37066 () Bool)

(assert (= bs!37066 d!141379))

(declare-fun m!1192865 () Bool)

(assert (=> bs!37066 m!1192865))

(assert (=> bs!37066 m!1192865))

(declare-fun m!1192867 () Bool)

(assert (=> bs!37066 m!1192867))

(assert (=> b!1302428 d!141379))

(declare-fun d!141381 () Bool)

(assert (=> d!141381 (= (apply!1012 lt!582498 lt!582487) (get!21149 (getValueByKey!705 (toList!10169 lt!582498) lt!582487)))))

(declare-fun bs!37067 () Bool)

(assert (= bs!37067 d!141381))

(declare-fun m!1192869 () Bool)

(assert (=> bs!37067 m!1192869))

(assert (=> bs!37067 m!1192869))

(declare-fun m!1192871 () Bool)

(assert (=> bs!37067 m!1192871))

(assert (=> b!1302428 d!141381))

(declare-fun d!141383 () Bool)

(assert (=> d!141383 (= (apply!1012 (+!4505 lt!582484 (tuple2!22651 lt!582500 minValue!1387)) lt!582492) (get!21149 (getValueByKey!705 (toList!10169 (+!4505 lt!582484 (tuple2!22651 lt!582500 minValue!1387))) lt!582492)))))

(declare-fun bs!37068 () Bool)

(assert (= bs!37068 d!141383))

(declare-fun m!1192873 () Bool)

(assert (=> bs!37068 m!1192873))

(assert (=> bs!37068 m!1192873))

(declare-fun m!1192875 () Bool)

(assert (=> bs!37068 m!1192875))

(assert (=> b!1302428 d!141383))

(declare-fun d!141385 () Bool)

(assert (=> d!141385 (= (apply!1012 (+!4505 lt!582493 (tuple2!22651 lt!582485 minValue!1387)) lt!582488) (get!21149 (getValueByKey!705 (toList!10169 (+!4505 lt!582493 (tuple2!22651 lt!582485 minValue!1387))) lt!582488)))))

(declare-fun bs!37069 () Bool)

(assert (= bs!37069 d!141385))

(declare-fun m!1192877 () Bool)

(assert (=> bs!37069 m!1192877))

(assert (=> bs!37069 m!1192877))

(declare-fun m!1192879 () Bool)

(assert (=> bs!37069 m!1192879))

(assert (=> b!1302428 d!141385))

(declare-fun d!141387 () Bool)

(assert (=> d!141387 (= (apply!1012 (+!4505 lt!582493 (tuple2!22651 lt!582485 minValue!1387)) lt!582488) (apply!1012 lt!582493 lt!582488))))

(declare-fun lt!582542 () Unit!42954)

(assert (=> d!141387 (= lt!582542 (choose!1923 lt!582493 lt!582485 minValue!1387 lt!582488))))

(declare-fun e!742936 () Bool)

(assert (=> d!141387 e!742936))

(declare-fun res!865171 () Bool)

(assert (=> d!141387 (=> (not res!865171) (not e!742936))))

(assert (=> d!141387 (= res!865171 (contains!8227 lt!582493 lt!582488))))

(assert (=> d!141387 (= (addApplyDifferent!550 lt!582493 lt!582485 minValue!1387 lt!582488) lt!582542)))

(declare-fun b!1302511 () Bool)

(assert (=> b!1302511 (= e!742936 (not (= lt!582488 lt!582485)))))

(assert (= (and d!141387 res!865171) b!1302511))

(declare-fun m!1192881 () Bool)

(assert (=> d!141387 m!1192881))

(assert (=> d!141387 m!1192717))

(declare-fun m!1192883 () Bool)

(assert (=> d!141387 m!1192883))

(assert (=> d!141387 m!1192745))

(assert (=> d!141387 m!1192717))

(assert (=> d!141387 m!1192719))

(assert (=> b!1302428 d!141387))

(declare-fun d!141389 () Bool)

(declare-fun e!742937 () Bool)

(assert (=> d!141389 e!742937))

(declare-fun res!865173 () Bool)

(assert (=> d!141389 (=> (not res!865173) (not e!742937))))

(declare-fun lt!582545 () ListLongMap!20307)

(assert (=> d!141389 (= res!865173 (contains!8227 lt!582545 (_1!11336 (tuple2!22651 lt!582479 zeroValue!1387))))))

(declare-fun lt!582543 () List!29764)

(assert (=> d!141389 (= lt!582545 (ListLongMap!20308 lt!582543))))

(declare-fun lt!582546 () Unit!42954)

(declare-fun lt!582544 () Unit!42954)

(assert (=> d!141389 (= lt!582546 lt!582544)))

(assert (=> d!141389 (= (getValueByKey!705 lt!582543 (_1!11336 (tuple2!22651 lt!582479 zeroValue!1387))) (Some!755 (_2!11336 (tuple2!22651 lt!582479 zeroValue!1387))))))

(assert (=> d!141389 (= lt!582544 (lemmaContainsTupThenGetReturnValue!349 lt!582543 (_1!11336 (tuple2!22651 lt!582479 zeroValue!1387)) (_2!11336 (tuple2!22651 lt!582479 zeroValue!1387))))))

(assert (=> d!141389 (= lt!582543 (insertStrictlySorted!478 (toList!10169 lt!582498) (_1!11336 (tuple2!22651 lt!582479 zeroValue!1387)) (_2!11336 (tuple2!22651 lt!582479 zeroValue!1387))))))

(assert (=> d!141389 (= (+!4505 lt!582498 (tuple2!22651 lt!582479 zeroValue!1387)) lt!582545)))

(declare-fun b!1302512 () Bool)

(declare-fun res!865172 () Bool)

(assert (=> b!1302512 (=> (not res!865172) (not e!742937))))

(assert (=> b!1302512 (= res!865172 (= (getValueByKey!705 (toList!10169 lt!582545) (_1!11336 (tuple2!22651 lt!582479 zeroValue!1387))) (Some!755 (_2!11336 (tuple2!22651 lt!582479 zeroValue!1387)))))))

(declare-fun b!1302513 () Bool)

(assert (=> b!1302513 (= e!742937 (contains!8230 (toList!10169 lt!582545) (tuple2!22651 lt!582479 zeroValue!1387)))))

(assert (= (and d!141389 res!865173) b!1302512))

(assert (= (and b!1302512 res!865172) b!1302513))

(declare-fun m!1192885 () Bool)

(assert (=> d!141389 m!1192885))

(declare-fun m!1192887 () Bool)

(assert (=> d!141389 m!1192887))

(declare-fun m!1192889 () Bool)

(assert (=> d!141389 m!1192889))

(declare-fun m!1192891 () Bool)

(assert (=> d!141389 m!1192891))

(declare-fun m!1192893 () Bool)

(assert (=> b!1302512 m!1192893))

(declare-fun m!1192895 () Bool)

(assert (=> b!1302513 m!1192895))

(assert (=> b!1302428 d!141389))

(declare-fun d!141391 () Bool)

(assert (=> d!141391 (contains!8227 (+!4505 lt!582486 (tuple2!22651 lt!582490 zeroValue!1387)) lt!582480)))

(declare-fun lt!582549 () Unit!42954)

(declare-fun choose!1924 (ListLongMap!20307 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!42954)

(assert (=> d!141391 (= lt!582549 (choose!1924 lt!582486 lt!582490 zeroValue!1387 lt!582480))))

(assert (=> d!141391 (contains!8227 lt!582486 lt!582480)))

(assert (=> d!141391 (= (addStillContains!1107 lt!582486 lt!582490 zeroValue!1387 lt!582480) lt!582549)))

(declare-fun bs!37070 () Bool)

(assert (= bs!37070 d!141391))

(assert (=> bs!37070 m!1192731))

(assert (=> bs!37070 m!1192731))

(assert (=> bs!37070 m!1192733))

(declare-fun m!1192897 () Bool)

(assert (=> bs!37070 m!1192897))

(declare-fun m!1192899 () Bool)

(assert (=> bs!37070 m!1192899))

(assert (=> b!1302428 d!141391))

(declare-fun d!141393 () Bool)

(declare-fun e!742938 () Bool)

(assert (=> d!141393 e!742938))

(declare-fun res!865175 () Bool)

(assert (=> d!141393 (=> (not res!865175) (not e!742938))))

(declare-fun lt!582552 () ListLongMap!20307)

(assert (=> d!141393 (= res!865175 (contains!8227 lt!582552 (_1!11336 (tuple2!22651 lt!582485 minValue!1387))))))

(declare-fun lt!582550 () List!29764)

(assert (=> d!141393 (= lt!582552 (ListLongMap!20308 lt!582550))))

(declare-fun lt!582553 () Unit!42954)

(declare-fun lt!582551 () Unit!42954)

(assert (=> d!141393 (= lt!582553 lt!582551)))

(assert (=> d!141393 (= (getValueByKey!705 lt!582550 (_1!11336 (tuple2!22651 lt!582485 minValue!1387))) (Some!755 (_2!11336 (tuple2!22651 lt!582485 minValue!1387))))))

(assert (=> d!141393 (= lt!582551 (lemmaContainsTupThenGetReturnValue!349 lt!582550 (_1!11336 (tuple2!22651 lt!582485 minValue!1387)) (_2!11336 (tuple2!22651 lt!582485 minValue!1387))))))

(assert (=> d!141393 (= lt!582550 (insertStrictlySorted!478 (toList!10169 lt!582493) (_1!11336 (tuple2!22651 lt!582485 minValue!1387)) (_2!11336 (tuple2!22651 lt!582485 minValue!1387))))))

(assert (=> d!141393 (= (+!4505 lt!582493 (tuple2!22651 lt!582485 minValue!1387)) lt!582552)))

(declare-fun b!1302515 () Bool)

(declare-fun res!865174 () Bool)

(assert (=> b!1302515 (=> (not res!865174) (not e!742938))))

(assert (=> b!1302515 (= res!865174 (= (getValueByKey!705 (toList!10169 lt!582552) (_1!11336 (tuple2!22651 lt!582485 minValue!1387))) (Some!755 (_2!11336 (tuple2!22651 lt!582485 minValue!1387)))))))

(declare-fun b!1302516 () Bool)

(assert (=> b!1302516 (= e!742938 (contains!8230 (toList!10169 lt!582552) (tuple2!22651 lt!582485 minValue!1387)))))

(assert (= (and d!141393 res!865175) b!1302515))

(assert (= (and b!1302515 res!865174) b!1302516))

(declare-fun m!1192901 () Bool)

(assert (=> d!141393 m!1192901))

(declare-fun m!1192903 () Bool)

(assert (=> d!141393 m!1192903))

(declare-fun m!1192905 () Bool)

(assert (=> d!141393 m!1192905))

(declare-fun m!1192907 () Bool)

(assert (=> d!141393 m!1192907))

(declare-fun m!1192909 () Bool)

(assert (=> b!1302515 m!1192909))

(declare-fun m!1192911 () Bool)

(assert (=> b!1302516 m!1192911))

(assert (=> b!1302428 d!141393))

(assert (=> b!1302319 d!141355))

(declare-fun bm!64123 () Bool)

(declare-fun call!64126 () Bool)

(assert (=> bm!64123 (= call!64126 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!141395 () Bool)

(declare-fun res!865176 () Bool)

(declare-fun e!742939 () Bool)

(assert (=> d!141395 (=> res!865176 e!742939)))

(assert (=> d!141395 (= res!865176 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42376 _keys!1741)))))

(assert (=> d!141395 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!742939)))

(declare-fun b!1302517 () Bool)

(declare-fun e!742940 () Bool)

(declare-fun e!742941 () Bool)

(assert (=> b!1302517 (= e!742940 e!742941)))

(declare-fun lt!582554 () (_ BitVec 64))

(assert (=> b!1302517 (= lt!582554 (select (arr!41824 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!582555 () Unit!42954)

(assert (=> b!1302517 (= lt!582555 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582554 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1302517 (arrayContainsKey!0 _keys!1741 lt!582554 #b00000000000000000000000000000000)))

(declare-fun lt!582556 () Unit!42954)

(assert (=> b!1302517 (= lt!582556 lt!582555)))

(declare-fun res!865177 () Bool)

(assert (=> b!1302517 (= res!865177 (= (seekEntryOrOpen!0 (select (arr!41824 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10021 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1302517 (=> (not res!865177) (not e!742941))))

(declare-fun b!1302518 () Bool)

(assert (=> b!1302518 (= e!742939 e!742940)))

(declare-fun c!124982 () Bool)

(assert (=> b!1302518 (= c!124982 (validKeyInArray!0 (select (arr!41824 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1302519 () Bool)

(assert (=> b!1302519 (= e!742941 call!64126)))

(declare-fun b!1302520 () Bool)

(assert (=> b!1302520 (= e!742940 call!64126)))

(assert (= (and d!141395 (not res!865176)) b!1302518))

(assert (= (and b!1302518 c!124982) b!1302517))

(assert (= (and b!1302518 (not c!124982)) b!1302520))

(assert (= (and b!1302517 res!865177) b!1302519))

(assert (= (or b!1302519 b!1302520) bm!64123))

(declare-fun m!1192913 () Bool)

(assert (=> bm!64123 m!1192913))

(declare-fun m!1192915 () Bool)

(assert (=> b!1302517 m!1192915))

(declare-fun m!1192917 () Bool)

(assert (=> b!1302517 m!1192917))

(declare-fun m!1192919 () Bool)

(assert (=> b!1302517 m!1192919))

(assert (=> b!1302517 m!1192915))

(declare-fun m!1192921 () Bool)

(assert (=> b!1302517 m!1192921))

(assert (=> b!1302518 m!1192915))

(assert (=> b!1302518 m!1192915))

(declare-fun m!1192923 () Bool)

(assert (=> b!1302518 m!1192923))

(assert (=> bm!64097 d!141395))

(declare-fun d!141397 () Bool)

(declare-fun isEmpty!1065 (List!29764) Bool)

(assert (=> d!141397 (= (isEmpty!1063 lt!582426) (isEmpty!1065 (toList!10169 lt!582426)))))

(declare-fun bs!37071 () Bool)

(assert (= bs!37071 d!141397))

(declare-fun m!1192925 () Bool)

(assert (=> bs!37071 m!1192925))

(assert (=> b!1302374 d!141397))

(assert (=> b!1302383 d!141349))

(assert (=> b!1302383 d!141351))

(declare-fun d!141399 () Bool)

(declare-fun e!742943 () Bool)

(assert (=> d!141399 e!742943))

(declare-fun res!865178 () Bool)

(assert (=> d!141399 (=> res!865178 e!742943)))

(declare-fun lt!582560 () Bool)

(assert (=> d!141399 (= res!865178 (not lt!582560))))

(declare-fun lt!582559 () Bool)

(assert (=> d!141399 (= lt!582560 lt!582559)))

(declare-fun lt!582557 () Unit!42954)

(declare-fun e!742942 () Unit!42954)

(assert (=> d!141399 (= lt!582557 e!742942)))

(declare-fun c!124983 () Bool)

(assert (=> d!141399 (= c!124983 lt!582559)))

(assert (=> d!141399 (= lt!582559 (containsKey!722 (toList!10169 lt!582491) (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> d!141399 (= (contains!8227 lt!582491 (select (arr!41824 _keys!1741) from!2144)) lt!582560)))

(declare-fun b!1302521 () Bool)

(declare-fun lt!582558 () Unit!42954)

(assert (=> b!1302521 (= e!742942 lt!582558)))

(assert (=> b!1302521 (= lt!582558 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 lt!582491) (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> b!1302521 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582491) (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun b!1302522 () Bool)

(declare-fun Unit!42963 () Unit!42954)

(assert (=> b!1302522 (= e!742942 Unit!42963)))

(declare-fun b!1302523 () Bool)

(assert (=> b!1302523 (= e!742943 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582491) (select (arr!41824 _keys!1741) from!2144))))))

(assert (= (and d!141399 c!124983) b!1302521))

(assert (= (and d!141399 (not c!124983)) b!1302522))

(assert (= (and d!141399 (not res!865178)) b!1302523))

(assert (=> d!141399 m!1192583))

(declare-fun m!1192927 () Bool)

(assert (=> d!141399 m!1192927))

(assert (=> b!1302521 m!1192583))

(declare-fun m!1192929 () Bool)

(assert (=> b!1302521 m!1192929))

(assert (=> b!1302521 m!1192583))

(declare-fun m!1192931 () Bool)

(assert (=> b!1302521 m!1192931))

(assert (=> b!1302521 m!1192931))

(declare-fun m!1192933 () Bool)

(assert (=> b!1302521 m!1192933))

(assert (=> b!1302523 m!1192583))

(assert (=> b!1302523 m!1192931))

(assert (=> b!1302523 m!1192931))

(assert (=> b!1302523 m!1192933))

(assert (=> b!1302432 d!141399))

(declare-fun d!141401 () Bool)

(assert (=> d!141401 (arrayContainsKey!0 _keys!1741 lt!582395 #b00000000000000000000000000000000)))

(declare-fun lt!582563 () Unit!42954)

(declare-fun choose!13 (array!86659 (_ BitVec 64) (_ BitVec 32)) Unit!42954)

(assert (=> d!141401 (= lt!582563 (choose!13 _keys!1741 lt!582395 #b00000000000000000000000000000000))))

(assert (=> d!141401 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141401 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582395 #b00000000000000000000000000000000) lt!582563)))

(declare-fun bs!37072 () Bool)

(assert (= bs!37072 d!141401))

(assert (=> bs!37072 m!1192661))

(declare-fun m!1192935 () Bool)

(assert (=> bs!37072 m!1192935))

(assert (=> b!1302330 d!141401))

(declare-fun d!141403 () Bool)

(declare-fun res!865183 () Bool)

(declare-fun e!742948 () Bool)

(assert (=> d!141403 (=> res!865183 e!742948)))

(assert (=> d!141403 (= res!865183 (= (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) lt!582395))))

(assert (=> d!141403 (= (arrayContainsKey!0 _keys!1741 lt!582395 #b00000000000000000000000000000000) e!742948)))

(declare-fun b!1302528 () Bool)

(declare-fun e!742949 () Bool)

(assert (=> b!1302528 (= e!742948 e!742949)))

(declare-fun res!865184 () Bool)

(assert (=> b!1302528 (=> (not res!865184) (not e!742949))))

(assert (=> b!1302528 (= res!865184 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42376 _keys!1741)))))

(declare-fun b!1302529 () Bool)

(assert (=> b!1302529 (= e!742949 (arrayContainsKey!0 _keys!1741 lt!582395 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141403 (not res!865183)) b!1302528))

(assert (= (and b!1302528 res!865184) b!1302529))

(assert (=> d!141403 m!1192649))

(declare-fun m!1192937 () Bool)

(assert (=> b!1302529 m!1192937))

(assert (=> b!1302330 d!141403))

(declare-fun d!141405 () Bool)

(declare-fun lt!582571 () SeekEntryResult!10021)

(assert (=> d!141405 (and (or ((_ is Undefined!10021) lt!582571) (not ((_ is Found!10021) lt!582571)) (and (bvsge (index!42456 lt!582571) #b00000000000000000000000000000000) (bvslt (index!42456 lt!582571) (size!42376 _keys!1741)))) (or ((_ is Undefined!10021) lt!582571) ((_ is Found!10021) lt!582571) (not ((_ is MissingZero!10021) lt!582571)) (and (bvsge (index!42455 lt!582571) #b00000000000000000000000000000000) (bvslt (index!42455 lt!582571) (size!42376 _keys!1741)))) (or ((_ is Undefined!10021) lt!582571) ((_ is Found!10021) lt!582571) ((_ is MissingZero!10021) lt!582571) (not ((_ is MissingVacant!10021) lt!582571)) (and (bvsge (index!42458 lt!582571) #b00000000000000000000000000000000) (bvslt (index!42458 lt!582571) (size!42376 _keys!1741)))) (or ((_ is Undefined!10021) lt!582571) (ite ((_ is Found!10021) lt!582571) (= (select (arr!41824 _keys!1741) (index!42456 lt!582571)) (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10021) lt!582571) (= (select (arr!41824 _keys!1741) (index!42455 lt!582571)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10021) lt!582571) (= (select (arr!41824 _keys!1741) (index!42458 lt!582571)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!742958 () SeekEntryResult!10021)

(assert (=> d!141405 (= lt!582571 e!742958)))

(declare-fun c!124992 () Bool)

(declare-fun lt!582572 () SeekEntryResult!10021)

(assert (=> d!141405 (= c!124992 (and ((_ is Intermediate!10021) lt!582572) (undefined!10833 lt!582572)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86659 (_ BitVec 32)) SeekEntryResult!10021)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141405 (= lt!582572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141405 (validMask!0 mask!2175)))

(assert (=> d!141405 (= (seekEntryOrOpen!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!582571)))

(declare-fun b!1302542 () Bool)

(declare-fun e!742956 () SeekEntryResult!10021)

(assert (=> b!1302542 (= e!742956 (MissingZero!10021 (index!42457 lt!582572)))))

(declare-fun b!1302543 () Bool)

(declare-fun e!742957 () SeekEntryResult!10021)

(assert (=> b!1302543 (= e!742958 e!742957)))

(declare-fun lt!582570 () (_ BitVec 64))

(assert (=> b!1302543 (= lt!582570 (select (arr!41824 _keys!1741) (index!42457 lt!582572)))))

(declare-fun c!124991 () Bool)

(assert (=> b!1302543 (= c!124991 (= lt!582570 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302544 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86659 (_ BitVec 32)) SeekEntryResult!10021)

(assert (=> b!1302544 (= e!742956 (seekKeyOrZeroReturnVacant!0 (x!115672 lt!582572) (index!42457 lt!582572) (index!42457 lt!582572) (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1302545 () Bool)

(assert (=> b!1302545 (= e!742958 Undefined!10021)))

(declare-fun b!1302546 () Bool)

(declare-fun c!124990 () Bool)

(assert (=> b!1302546 (= c!124990 (= lt!582570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302546 (= e!742957 e!742956)))

(declare-fun b!1302547 () Bool)

(assert (=> b!1302547 (= e!742957 (Found!10021 (index!42457 lt!582572)))))

(assert (= (and d!141405 c!124992) b!1302545))

(assert (= (and d!141405 (not c!124992)) b!1302543))

(assert (= (and b!1302543 c!124991) b!1302547))

(assert (= (and b!1302543 (not c!124991)) b!1302546))

(assert (= (and b!1302546 c!124990) b!1302542))

(assert (= (and b!1302546 (not c!124990)) b!1302544))

(declare-fun m!1192939 () Bool)

(assert (=> d!141405 m!1192939))

(assert (=> d!141405 m!1192571))

(declare-fun m!1192941 () Bool)

(assert (=> d!141405 m!1192941))

(declare-fun m!1192943 () Bool)

(assert (=> d!141405 m!1192943))

(declare-fun m!1192945 () Bool)

(assert (=> d!141405 m!1192945))

(assert (=> d!141405 m!1192649))

(declare-fun m!1192947 () Bool)

(assert (=> d!141405 m!1192947))

(assert (=> d!141405 m!1192649))

(assert (=> d!141405 m!1192945))

(declare-fun m!1192949 () Bool)

(assert (=> b!1302543 m!1192949))

(assert (=> b!1302544 m!1192649))

(declare-fun m!1192951 () Bool)

(assert (=> b!1302544 m!1192951))

(assert (=> b!1302330 d!141405))

(assert (=> b!1302331 d!141355))

(declare-fun d!141407 () Bool)

(assert (=> d!141407 (= (isDefined!512 (getValueByKey!705 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1064 (getValueByKey!705 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37073 () Bool)

(assert (= bs!37073 d!141407))

(assert (=> bs!37073 m!1192669))

(declare-fun m!1192953 () Bool)

(assert (=> bs!37073 m!1192953))

(assert (=> b!1302342 d!141407))

(declare-fun e!742959 () Option!756)

(declare-fun b!1302548 () Bool)

(assert (=> b!1302548 (= e!742959 (Some!755 (_2!11336 (h!30969 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1302549 () Bool)

(declare-fun e!742960 () Option!756)

(assert (=> b!1302549 (= e!742959 e!742960)))

(declare-fun c!124994 () Bool)

(assert (=> b!1302549 (= c!124994 (and ((_ is Cons!29760) (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11336 (h!30969 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun d!141409 () Bool)

(declare-fun c!124993 () Bool)

(assert (=> d!141409 (= c!124993 (and ((_ is Cons!29760) (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11336 (h!30969 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141409 (= (getValueByKey!705 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742959)))

(declare-fun b!1302551 () Bool)

(assert (=> b!1302551 (= e!742960 None!754)))

(declare-fun b!1302550 () Bool)

(assert (=> b!1302550 (= e!742960 (getValueByKey!705 (t!43344 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141409 c!124993) b!1302548))

(assert (= (and d!141409 (not c!124993)) b!1302549))

(assert (= (and b!1302549 c!124994) b!1302550))

(assert (= (and b!1302549 (not c!124994)) b!1302551))

(declare-fun m!1192955 () Bool)

(assert (=> b!1302550 m!1192955))

(assert (=> b!1302342 d!141409))

(declare-fun d!141411 () Bool)

(declare-fun e!742962 () Bool)

(assert (=> d!141411 e!742962))

(declare-fun res!865185 () Bool)

(assert (=> d!141411 (=> res!865185 e!742962)))

(declare-fun lt!582576 () Bool)

(assert (=> d!141411 (= res!865185 (not lt!582576))))

(declare-fun lt!582575 () Bool)

(assert (=> d!141411 (= lt!582576 lt!582575)))

(declare-fun lt!582573 () Unit!42954)

(declare-fun e!742961 () Unit!42954)

(assert (=> d!141411 (= lt!582573 e!742961)))

(declare-fun c!124995 () Bool)

(assert (=> d!141411 (= c!124995 lt!582575)))

(assert (=> d!141411 (= lt!582575 (containsKey!722 (toList!10169 lt!582426) (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> d!141411 (= (contains!8227 lt!582426 (select (arr!41824 _keys!1741) from!2144)) lt!582576)))

(declare-fun b!1302552 () Bool)

(declare-fun lt!582574 () Unit!42954)

(assert (=> b!1302552 (= e!742961 lt!582574)))

(assert (=> b!1302552 (= lt!582574 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 lt!582426) (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> b!1302552 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582426) (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun b!1302553 () Bool)

(declare-fun Unit!42964 () Unit!42954)

(assert (=> b!1302553 (= e!742961 Unit!42964)))

(declare-fun b!1302554 () Bool)

(assert (=> b!1302554 (= e!742962 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582426) (select (arr!41824 _keys!1741) from!2144))))))

(assert (= (and d!141411 c!124995) b!1302552))

(assert (= (and d!141411 (not c!124995)) b!1302553))

(assert (= (and d!141411 (not res!865185)) b!1302554))

(assert (=> d!141411 m!1192583))

(declare-fun m!1192957 () Bool)

(assert (=> d!141411 m!1192957))

(assert (=> b!1302552 m!1192583))

(declare-fun m!1192959 () Bool)

(assert (=> b!1302552 m!1192959))

(assert (=> b!1302552 m!1192583))

(assert (=> b!1302552 m!1192809))

(assert (=> b!1302552 m!1192809))

(declare-fun m!1192961 () Bool)

(assert (=> b!1302552 m!1192961))

(assert (=> b!1302554 m!1192583))

(assert (=> b!1302554 m!1192809))

(assert (=> b!1302554 m!1192809))

(assert (=> b!1302554 m!1192961))

(assert (=> b!1302376 d!141411))

(assert (=> bm!64100 d!141345))

(assert (=> b!1302434 d!141339))

(assert (=> b!1302375 d!141339))

(declare-fun d!141413 () Bool)

(assert (=> d!141413 (= (apply!1012 lt!582491 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21149 (getValueByKey!705 (toList!10169 lt!582491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37074 () Bool)

(assert (= bs!37074 d!141413))

(declare-fun m!1192963 () Bool)

(assert (=> bs!37074 m!1192963))

(assert (=> bs!37074 m!1192963))

(declare-fun m!1192965 () Bool)

(assert (=> bs!37074 m!1192965))

(assert (=> b!1302437 d!141413))

(declare-fun d!141415 () Bool)

(declare-fun res!865190 () Bool)

(declare-fun e!742967 () Bool)

(assert (=> d!141415 (=> res!865190 e!742967)))

(assert (=> d!141415 (= res!865190 (and ((_ is Cons!29760) (toList!10169 (ListLongMap!20308 Nil!29761))) (= (_1!11336 (h!30969 (toList!10169 (ListLongMap!20308 Nil!29761)))) k0!1205)))))

(assert (=> d!141415 (= (containsKey!722 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205) e!742967)))

(declare-fun b!1302559 () Bool)

(declare-fun e!742968 () Bool)

(assert (=> b!1302559 (= e!742967 e!742968)))

(declare-fun res!865191 () Bool)

(assert (=> b!1302559 (=> (not res!865191) (not e!742968))))

(assert (=> b!1302559 (= res!865191 (and (or (not ((_ is Cons!29760) (toList!10169 (ListLongMap!20308 Nil!29761)))) (bvsle (_1!11336 (h!30969 (toList!10169 (ListLongMap!20308 Nil!29761)))) k0!1205)) ((_ is Cons!29760) (toList!10169 (ListLongMap!20308 Nil!29761))) (bvslt (_1!11336 (h!30969 (toList!10169 (ListLongMap!20308 Nil!29761)))) k0!1205)))))

(declare-fun b!1302560 () Bool)

(assert (=> b!1302560 (= e!742968 (containsKey!722 (t!43344 (toList!10169 (ListLongMap!20308 Nil!29761))) k0!1205))))

(assert (= (and d!141415 (not res!865190)) b!1302559))

(assert (= (and b!1302559 res!865191) b!1302560))

(declare-fun m!1192967 () Bool)

(assert (=> b!1302560 m!1192967))

(assert (=> d!141341 d!141415))

(declare-fun d!141417 () Bool)

(declare-fun lt!582579 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!643 (List!29765) (InoxSet (_ BitVec 64)))

(assert (=> d!141417 (= lt!582579 (select (content!643 Nil!29762) (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!742974 () Bool)

(assert (=> d!141417 (= lt!582579 e!742974)))

(declare-fun res!865197 () Bool)

(assert (=> d!141417 (=> (not res!865197) (not e!742974))))

(assert (=> d!141417 (= res!865197 ((_ is Cons!29761) Nil!29762))))

(assert (=> d!141417 (= (contains!8229 Nil!29762 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)) lt!582579)))

(declare-fun b!1302565 () Bool)

(declare-fun e!742973 () Bool)

(assert (=> b!1302565 (= e!742974 e!742973)))

(declare-fun res!865196 () Bool)

(assert (=> b!1302565 (=> res!865196 e!742973)))

(assert (=> b!1302565 (= res!865196 (= (h!30970 Nil!29762) (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302566 () Bool)

(assert (=> b!1302566 (= e!742973 (contains!8229 (t!43345 Nil!29762) (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141417 res!865197) b!1302565))

(assert (= (and b!1302565 (not res!865196)) b!1302566))

(declare-fun m!1192969 () Bool)

(assert (=> d!141417 m!1192969))

(assert (=> d!141417 m!1192649))

(declare-fun m!1192971 () Bool)

(assert (=> d!141417 m!1192971))

(assert (=> b!1302566 m!1192649))

(declare-fun m!1192973 () Bool)

(assert (=> b!1302566 m!1192973))

(assert (=> b!1302320 d!141417))

(declare-fun d!141419 () Bool)

(assert (=> d!141419 (isDefined!512 (getValueByKey!705 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!582580 () Unit!42954)

(assert (=> d!141419 (= lt!582580 (choose!1922 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!742975 () Bool)

(assert (=> d!141419 e!742975))

(declare-fun res!865198 () Bool)

(assert (=> d!141419 (=> (not res!865198) (not e!742975))))

(assert (=> d!141419 (= res!865198 (isStrictlySorted!868 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141419 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!582580)))

(declare-fun b!1302567 () Bool)

(assert (=> b!1302567 (= e!742975 (containsKey!722 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141419 res!865198) b!1302567))

(assert (=> d!141419 m!1192669))

(assert (=> d!141419 m!1192669))

(assert (=> d!141419 m!1192671))

(declare-fun m!1192975 () Bool)

(assert (=> d!141419 m!1192975))

(declare-fun m!1192977 () Bool)

(assert (=> d!141419 m!1192977))

(assert (=> b!1302567 m!1192665))

(assert (=> b!1302340 d!141419))

(assert (=> b!1302340 d!141407))

(assert (=> b!1302340 d!141409))

(assert (=> bm!64117 d!141327))

(declare-fun b!1302568 () Bool)

(declare-fun e!742979 () Bool)

(declare-fun call!64127 () Bool)

(assert (=> b!1302568 (= e!742979 call!64127)))

(declare-fun b!1302569 () Bool)

(declare-fun e!742976 () Bool)

(assert (=> b!1302569 (= e!742976 e!742979)))

(declare-fun c!124996 () Bool)

(assert (=> b!1302569 (= c!124996 (validKeyInArray!0 (select (arr!41824 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1302570 () Bool)

(declare-fun e!742977 () Bool)

(assert (=> b!1302570 (= e!742977 e!742976)))

(declare-fun res!865201 () Bool)

(assert (=> b!1302570 (=> (not res!865201) (not e!742976))))

(declare-fun e!742978 () Bool)

(assert (=> b!1302570 (= res!865201 (not e!742978))))

(declare-fun res!865199 () Bool)

(assert (=> b!1302570 (=> (not res!865199) (not e!742978))))

(assert (=> b!1302570 (= res!865199 (validKeyInArray!0 (select (arr!41824 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!141421 () Bool)

(declare-fun res!865200 () Bool)

(assert (=> d!141421 (=> res!865200 e!742977)))

(assert (=> d!141421 (= res!865200 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42376 _keys!1741)))))

(assert (=> d!141421 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124927 (Cons!29761 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) Nil!29762) Nil!29762)) e!742977)))

(declare-fun b!1302571 () Bool)

(assert (=> b!1302571 (= e!742978 (contains!8229 (ite c!124927 (Cons!29761 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) Nil!29762) Nil!29762) (select (arr!41824 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64124 () Bool)

(assert (=> bm!64124 (= call!64127 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!124996 (Cons!29761 (select (arr!41824 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!124927 (Cons!29761 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) Nil!29762) Nil!29762)) (ite c!124927 (Cons!29761 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) Nil!29762) Nil!29762))))))

(declare-fun b!1302572 () Bool)

(assert (=> b!1302572 (= e!742979 call!64127)))

(assert (= (and d!141421 (not res!865200)) b!1302570))

(assert (= (and b!1302570 res!865199) b!1302571))

(assert (= (and b!1302570 res!865201) b!1302569))

(assert (= (and b!1302569 c!124996) b!1302572))

(assert (= (and b!1302569 (not c!124996)) b!1302568))

(assert (= (or b!1302572 b!1302568) bm!64124))

(assert (=> b!1302569 m!1192915))

(assert (=> b!1302569 m!1192915))

(assert (=> b!1302569 m!1192923))

(assert (=> b!1302570 m!1192915))

(assert (=> b!1302570 m!1192915))

(assert (=> b!1302570 m!1192923))

(assert (=> b!1302571 m!1192915))

(assert (=> b!1302571 m!1192915))

(declare-fun m!1192979 () Bool)

(assert (=> b!1302571 m!1192979))

(assert (=> bm!64124 m!1192915))

(declare-fun m!1192981 () Bool)

(assert (=> bm!64124 m!1192981))

(assert (=> bm!64094 d!141421))

(assert (=> b!1302377 d!141339))

(declare-fun d!141423 () Bool)

(declare-fun res!865202 () Bool)

(declare-fun e!742980 () Bool)

(assert (=> d!141423 (=> res!865202 e!742980)))

(assert (=> d!141423 (= res!865202 (and ((_ is Cons!29760) (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11336 (h!30969 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141423 (= (containsKey!722 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742980)))

(declare-fun b!1302573 () Bool)

(declare-fun e!742981 () Bool)

(assert (=> b!1302573 (= e!742980 e!742981)))

(declare-fun res!865203 () Bool)

(assert (=> b!1302573 (=> (not res!865203) (not e!742981))))

(assert (=> b!1302573 (= res!865203 (and (or (not ((_ is Cons!29760) (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11336 (h!30969 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29760) (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11336 (h!30969 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1302574 () Bool)

(assert (=> b!1302574 (= e!742981 (containsKey!722 (t!43344 (toList!10169 (getCurrentListMapNoExtraKeys!6137 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141423 (not res!865202)) b!1302573))

(assert (= (and b!1302573 res!865203) b!1302574))

(declare-fun m!1192983 () Bool)

(assert (=> b!1302574 m!1192983))

(assert (=> d!141325 d!141423))

(assert (=> d!141343 d!141341))

(declare-fun d!141425 () Bool)

(assert (=> d!141425 (not (contains!8227 (ListLongMap!20308 Nil!29761) k0!1205))))

(assert (=> d!141425 true))

(declare-fun _$29!195 () Unit!42954)

(assert (=> d!141425 (= (choose!1921 k0!1205) _$29!195)))

(declare-fun bs!37075 () Bool)

(assert (= bs!37075 d!141425))

(assert (=> bs!37075 m!1192587))

(assert (=> d!141343 d!141425))

(declare-fun d!141427 () Bool)

(declare-fun res!865204 () Bool)

(declare-fun e!742982 () Bool)

(assert (=> d!141427 (=> res!865204 e!742982)))

(assert (=> d!141427 (= res!865204 (and ((_ is Cons!29760) (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11336 (h!30969 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141427 (= (containsKey!722 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742982)))

(declare-fun b!1302575 () Bool)

(declare-fun e!742983 () Bool)

(assert (=> b!1302575 (= e!742982 e!742983)))

(declare-fun res!865205 () Bool)

(assert (=> b!1302575 (=> (not res!865205) (not e!742983))))

(assert (=> b!1302575 (= res!865205 (and (or (not ((_ is Cons!29760) (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11336 (h!30969 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29760) (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11336 (h!30969 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1302576 () Bool)

(assert (=> b!1302576 (= e!742983 (containsKey!722 (t!43344 (toList!10169 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141427 (not res!865204)) b!1302575))

(assert (= (and b!1302575 res!865205) b!1302576))

(declare-fun m!1192985 () Bool)

(assert (=> b!1302576 m!1192985))

(assert (=> d!141329 d!141427))

(assert (=> d!141331 d!141333))

(declare-fun d!141429 () Bool)

(declare-fun e!742984 () Bool)

(assert (=> d!141429 e!742984))

(declare-fun res!865207 () Bool)

(assert (=> d!141429 (=> (not res!865207) (not e!742984))))

(declare-fun lt!582583 () ListLongMap!20307)

(assert (=> d!141429 (= res!865207 (contains!8227 lt!582583 (_1!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!582581 () List!29764)

(assert (=> d!141429 (= lt!582583 (ListLongMap!20308 lt!582581))))

(declare-fun lt!582584 () Unit!42954)

(declare-fun lt!582582 () Unit!42954)

(assert (=> d!141429 (= lt!582584 lt!582582)))

(assert (=> d!141429 (= (getValueByKey!705 lt!582581 (_1!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!755 (_2!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141429 (= lt!582582 (lemmaContainsTupThenGetReturnValue!349 lt!582581 (_1!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141429 (= lt!582581 (insertStrictlySorted!478 (toList!10169 (ite c!124961 call!64118 (ite c!124962 call!64123 call!64120))) (_1!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141429 (= (+!4505 (ite c!124961 call!64118 (ite c!124962 call!64123 call!64120)) (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!582583)))

(declare-fun b!1302577 () Bool)

(declare-fun res!865206 () Bool)

(assert (=> b!1302577 (=> (not res!865206) (not e!742984))))

(assert (=> b!1302577 (= res!865206 (= (getValueByKey!705 (toList!10169 lt!582583) (_1!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!755 (_2!11336 (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1302578 () Bool)

(assert (=> b!1302578 (= e!742984 (contains!8230 (toList!10169 lt!582583) (ite (or c!124961 c!124962) (tuple2!22651 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141429 res!865207) b!1302577))

(assert (= (and b!1302577 res!865206) b!1302578))

(declare-fun m!1192987 () Bool)

(assert (=> d!141429 m!1192987))

(declare-fun m!1192989 () Bool)

(assert (=> d!141429 m!1192989))

(declare-fun m!1192991 () Bool)

(assert (=> d!141429 m!1192991))

(declare-fun m!1192993 () Bool)

(assert (=> d!141429 m!1192993))

(declare-fun m!1192995 () Bool)

(assert (=> b!1302577 m!1192995))

(declare-fun m!1192997 () Bool)

(assert (=> b!1302578 m!1192997))

(assert (=> bm!64120 d!141429))

(declare-fun d!141431 () Bool)

(assert (=> d!141431 (= (apply!1012 lt!582491 (select (arr!41824 _keys!1741) from!2144)) (get!21149 (getValueByKey!705 (toList!10169 lt!582491) (select (arr!41824 _keys!1741) from!2144))))))

(declare-fun bs!37076 () Bool)

(assert (= bs!37076 d!141431))

(assert (=> bs!37076 m!1192583))

(assert (=> bs!37076 m!1192931))

(assert (=> bs!37076 m!1192931))

(declare-fun m!1192999 () Bool)

(assert (=> bs!37076 m!1192999))

(assert (=> b!1302426 d!141431))

(assert (=> b!1302426 d!141363))

(assert (=> b!1302441 d!141339))

(declare-fun d!141433 () Bool)

(declare-fun e!742985 () Bool)

(assert (=> d!141433 e!742985))

(declare-fun res!865209 () Bool)

(assert (=> d!141433 (=> (not res!865209) (not e!742985))))

(declare-fun lt!582587 () ListLongMap!20307)

(assert (=> d!141433 (= res!865209 (contains!8227 lt!582587 (_1!11336 (tuple2!22651 lt!582427 lt!582425))))))

(declare-fun lt!582585 () List!29764)

(assert (=> d!141433 (= lt!582587 (ListLongMap!20308 lt!582585))))

(declare-fun lt!582588 () Unit!42954)

(declare-fun lt!582586 () Unit!42954)

(assert (=> d!141433 (= lt!582588 lt!582586)))

(assert (=> d!141433 (= (getValueByKey!705 lt!582585 (_1!11336 (tuple2!22651 lt!582427 lt!582425))) (Some!755 (_2!11336 (tuple2!22651 lt!582427 lt!582425))))))

(assert (=> d!141433 (= lt!582586 (lemmaContainsTupThenGetReturnValue!349 lt!582585 (_1!11336 (tuple2!22651 lt!582427 lt!582425)) (_2!11336 (tuple2!22651 lt!582427 lt!582425))))))

(assert (=> d!141433 (= lt!582585 (insertStrictlySorted!478 (toList!10169 lt!582424) (_1!11336 (tuple2!22651 lt!582427 lt!582425)) (_2!11336 (tuple2!22651 lt!582427 lt!582425))))))

(assert (=> d!141433 (= (+!4505 lt!582424 (tuple2!22651 lt!582427 lt!582425)) lt!582587)))

(declare-fun b!1302579 () Bool)

(declare-fun res!865208 () Bool)

(assert (=> b!1302579 (=> (not res!865208) (not e!742985))))

(assert (=> b!1302579 (= res!865208 (= (getValueByKey!705 (toList!10169 lt!582587) (_1!11336 (tuple2!22651 lt!582427 lt!582425))) (Some!755 (_2!11336 (tuple2!22651 lt!582427 lt!582425)))))))

(declare-fun b!1302580 () Bool)

(assert (=> b!1302580 (= e!742985 (contains!8230 (toList!10169 lt!582587) (tuple2!22651 lt!582427 lt!582425)))))

(assert (= (and d!141433 res!865209) b!1302579))

(assert (= (and b!1302579 res!865208) b!1302580))

(declare-fun m!1193001 () Bool)

(assert (=> d!141433 m!1193001))

(declare-fun m!1193003 () Bool)

(assert (=> d!141433 m!1193003))

(declare-fun m!1193005 () Bool)

(assert (=> d!141433 m!1193005))

(declare-fun m!1193007 () Bool)

(assert (=> d!141433 m!1193007))

(declare-fun m!1193009 () Bool)

(assert (=> b!1302579 m!1193009))

(declare-fun m!1193011 () Bool)

(assert (=> b!1302580 m!1193011))

(assert (=> b!1302369 d!141433))

(declare-fun d!141435 () Bool)

(declare-fun e!742986 () Bool)

(assert (=> d!141435 e!742986))

(declare-fun res!865211 () Bool)

(assert (=> d!141435 (=> (not res!865211) (not e!742986))))

(declare-fun lt!582591 () ListLongMap!20307)

(assert (=> d!141435 (= res!865211 (contains!8227 lt!582591 (_1!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!582589 () List!29764)

(assert (=> d!141435 (= lt!582591 (ListLongMap!20308 lt!582589))))

(declare-fun lt!582592 () Unit!42954)

(declare-fun lt!582590 () Unit!42954)

(assert (=> d!141435 (= lt!582592 lt!582590)))

(assert (=> d!141435 (= (getValueByKey!705 lt!582589 (_1!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!755 (_2!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141435 (= lt!582590 (lemmaContainsTupThenGetReturnValue!349 lt!582589 (_1!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141435 (= lt!582589 (insertStrictlySorted!478 (toList!10169 call!64103) (_1!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141435 (= (+!4505 call!64103 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!582591)))

(declare-fun b!1302581 () Bool)

(declare-fun res!865210 () Bool)

(assert (=> b!1302581 (=> (not res!865210) (not e!742986))))

(assert (=> b!1302581 (= res!865210 (= (getValueByKey!705 (toList!10169 lt!582591) (_1!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!755 (_2!11336 (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1302582 () Bool)

(assert (=> b!1302582 (= e!742986 (contains!8230 (toList!10169 lt!582591) (tuple2!22651 (select (arr!41824 _keys!1741) from!2144) (get!21148 (select (arr!41825 _values!1445) from!2144) (dynLambda!3450 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141435 res!865211) b!1302581))

(assert (= (and b!1302581 res!865210) b!1302582))

(declare-fun m!1193013 () Bool)

(assert (=> d!141435 m!1193013))

(declare-fun m!1193015 () Bool)

(assert (=> d!141435 m!1193015))

(declare-fun m!1193017 () Bool)

(assert (=> d!141435 m!1193017))

(declare-fun m!1193019 () Bool)

(assert (=> d!141435 m!1193019))

(declare-fun m!1193021 () Bool)

(assert (=> b!1302581 m!1193021))

(declare-fun m!1193023 () Bool)

(assert (=> b!1302582 m!1193023))

(assert (=> b!1302369 d!141435))

(declare-fun d!141437 () Bool)

(assert (=> d!141437 (not (contains!8227 (+!4505 lt!582424 (tuple2!22651 lt!582427 lt!582425)) lt!582429))))

(declare-fun lt!582595 () Unit!42954)

(declare-fun choose!1925 (ListLongMap!20307 (_ BitVec 64) V!51601 (_ BitVec 64)) Unit!42954)

(assert (=> d!141437 (= lt!582595 (choose!1925 lt!582424 lt!582427 lt!582425 lt!582429))))

(declare-fun e!742989 () Bool)

(assert (=> d!141437 e!742989))

(declare-fun res!865214 () Bool)

(assert (=> d!141437 (=> (not res!865214) (not e!742989))))

(assert (=> d!141437 (= res!865214 (not (contains!8227 lt!582424 lt!582429)))))

(assert (=> d!141437 (= (addStillNotContains!458 lt!582424 lt!582427 lt!582425 lt!582429) lt!582595)))

(declare-fun b!1302586 () Bool)

(assert (=> b!1302586 (= e!742989 (not (= lt!582427 lt!582429)))))

(assert (= (and d!141437 res!865214) b!1302586))

(assert (=> d!141437 m!1192679))

(assert (=> d!141437 m!1192679))

(assert (=> d!141437 m!1192681))

(declare-fun m!1193025 () Bool)

(assert (=> d!141437 m!1193025))

(declare-fun m!1193027 () Bool)

(assert (=> d!141437 m!1193027))

(assert (=> b!1302369 d!141437))

(assert (=> b!1302369 d!141363))

(declare-fun d!141439 () Bool)

(declare-fun e!742991 () Bool)

(assert (=> d!141439 e!742991))

(declare-fun res!865215 () Bool)

(assert (=> d!141439 (=> res!865215 e!742991)))

(declare-fun lt!582599 () Bool)

(assert (=> d!141439 (= res!865215 (not lt!582599))))

(declare-fun lt!582598 () Bool)

(assert (=> d!141439 (= lt!582599 lt!582598)))

(declare-fun lt!582596 () Unit!42954)

(declare-fun e!742990 () Unit!42954)

(assert (=> d!141439 (= lt!582596 e!742990)))

(declare-fun c!124997 () Bool)

(assert (=> d!141439 (= c!124997 lt!582598)))

(assert (=> d!141439 (= lt!582598 (containsKey!722 (toList!10169 (+!4505 lt!582424 (tuple2!22651 lt!582427 lt!582425))) lt!582429))))

(assert (=> d!141439 (= (contains!8227 (+!4505 lt!582424 (tuple2!22651 lt!582427 lt!582425)) lt!582429) lt!582599)))

(declare-fun b!1302587 () Bool)

(declare-fun lt!582597 () Unit!42954)

(assert (=> b!1302587 (= e!742990 lt!582597)))

(assert (=> b!1302587 (= lt!582597 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 (+!4505 lt!582424 (tuple2!22651 lt!582427 lt!582425))) lt!582429))))

(assert (=> b!1302587 (isDefined!512 (getValueByKey!705 (toList!10169 (+!4505 lt!582424 (tuple2!22651 lt!582427 lt!582425))) lt!582429))))

(declare-fun b!1302588 () Bool)

(declare-fun Unit!42965 () Unit!42954)

(assert (=> b!1302588 (= e!742990 Unit!42965)))

(declare-fun b!1302589 () Bool)

(assert (=> b!1302589 (= e!742991 (isDefined!512 (getValueByKey!705 (toList!10169 (+!4505 lt!582424 (tuple2!22651 lt!582427 lt!582425))) lt!582429)))))

(assert (= (and d!141439 c!124997) b!1302587))

(assert (= (and d!141439 (not c!124997)) b!1302588))

(assert (= (and d!141439 (not res!865215)) b!1302589))

(declare-fun m!1193029 () Bool)

(assert (=> d!141439 m!1193029))

(declare-fun m!1193031 () Bool)

(assert (=> b!1302587 m!1193031))

(declare-fun m!1193033 () Bool)

(assert (=> b!1302587 m!1193033))

(assert (=> b!1302587 m!1193033))

(declare-fun m!1193035 () Bool)

(assert (=> b!1302587 m!1193035))

(assert (=> b!1302589 m!1193033))

(assert (=> b!1302589 m!1193033))

(assert (=> b!1302589 m!1193035))

(assert (=> b!1302369 d!141439))

(declare-fun d!141441 () Bool)

(declare-fun e!742993 () Bool)

(assert (=> d!141441 e!742993))

(declare-fun res!865216 () Bool)

(assert (=> d!141441 (=> res!865216 e!742993)))

(declare-fun lt!582603 () Bool)

(assert (=> d!141441 (= res!865216 (not lt!582603))))

(declare-fun lt!582602 () Bool)

(assert (=> d!141441 (= lt!582603 lt!582602)))

(declare-fun lt!582600 () Unit!42954)

(declare-fun e!742992 () Unit!42954)

(assert (=> d!141441 (= lt!582600 e!742992)))

(declare-fun c!124998 () Bool)

(assert (=> d!141441 (= c!124998 lt!582602)))

(assert (=> d!141441 (= lt!582602 (containsKey!722 (toList!10169 lt!582491) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141441 (= (contains!8227 lt!582491 #b0000000000000000000000000000000000000000000000000000000000000000) lt!582603)))

(declare-fun b!1302590 () Bool)

(declare-fun lt!582601 () Unit!42954)

(assert (=> b!1302590 (= e!742992 lt!582601)))

(assert (=> b!1302590 (= lt!582601 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 lt!582491) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302590 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582491) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302591 () Bool)

(declare-fun Unit!42966 () Unit!42954)

(assert (=> b!1302591 (= e!742992 Unit!42966)))

(declare-fun b!1302592 () Bool)

(assert (=> b!1302592 (= e!742993 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582491) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141441 c!124998) b!1302590))

(assert (= (and d!141441 (not c!124998)) b!1302591))

(assert (= (and d!141441 (not res!865216)) b!1302592))

(declare-fun m!1193037 () Bool)

(assert (=> d!141441 m!1193037))

(declare-fun m!1193039 () Bool)

(assert (=> b!1302590 m!1193039))

(assert (=> b!1302590 m!1192801))

(assert (=> b!1302590 m!1192801))

(declare-fun m!1193041 () Bool)

(assert (=> b!1302590 m!1193041))

(assert (=> b!1302592 m!1192801))

(assert (=> b!1302592 m!1192801))

(assert (=> b!1302592 m!1193041))

(assert (=> bm!64116 d!141441))

(declare-fun d!141443 () Bool)

(declare-fun e!742994 () Bool)

(assert (=> d!141443 e!742994))

(declare-fun res!865218 () Bool)

(assert (=> d!141443 (=> (not res!865218) (not e!742994))))

(declare-fun lt!582606 () ListLongMap!20307)

(assert (=> d!141443 (= res!865218 (contains!8227 lt!582606 (_1!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!582604 () List!29764)

(assert (=> d!141443 (= lt!582606 (ListLongMap!20308 lt!582604))))

(declare-fun lt!582607 () Unit!42954)

(declare-fun lt!582605 () Unit!42954)

(assert (=> d!141443 (= lt!582607 lt!582605)))

(assert (=> d!141443 (= (getValueByKey!705 lt!582604 (_1!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!755 (_2!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141443 (= lt!582605 (lemmaContainsTupThenGetReturnValue!349 lt!582604 (_1!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141443 (= lt!582604 (insertStrictlySorted!478 (toList!10169 call!64122) (_1!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141443 (= (+!4505 call!64122 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!582606)))

(declare-fun b!1302593 () Bool)

(declare-fun res!865217 () Bool)

(assert (=> b!1302593 (=> (not res!865217) (not e!742994))))

(assert (=> b!1302593 (= res!865217 (= (getValueByKey!705 (toList!10169 lt!582606) (_1!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!755 (_2!11336 (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1302594 () Bool)

(assert (=> b!1302594 (= e!742994 (contains!8230 (toList!10169 lt!582606) (tuple2!22651 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141443 res!865218) b!1302593))

(assert (= (and b!1302593 res!865217) b!1302594))

(declare-fun m!1193043 () Bool)

(assert (=> d!141443 m!1193043))

(declare-fun m!1193045 () Bool)

(assert (=> d!141443 m!1193045))

(declare-fun m!1193047 () Bool)

(assert (=> d!141443 m!1193047))

(declare-fun m!1193049 () Bool)

(assert (=> d!141443 m!1193049))

(declare-fun m!1193051 () Bool)

(assert (=> b!1302593 m!1193051))

(declare-fun m!1193053 () Bool)

(assert (=> b!1302594 m!1193053))

(assert (=> b!1302443 d!141443))

(declare-fun d!141445 () Bool)

(assert (=> d!141445 (isDefined!512 (getValueByKey!705 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205))))

(declare-fun lt!582608 () Unit!42954)

(assert (=> d!141445 (= lt!582608 (choose!1922 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205))))

(declare-fun e!742995 () Bool)

(assert (=> d!141445 e!742995))

(declare-fun res!865219 () Bool)

(assert (=> d!141445 (=> (not res!865219) (not e!742995))))

(assert (=> d!141445 (= res!865219 (isStrictlySorted!868 (toList!10169 (ListLongMap!20308 Nil!29761))))))

(assert (=> d!141445 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205) lt!582608)))

(declare-fun b!1302595 () Bool)

(assert (=> b!1302595 (= e!742995 (containsKey!722 (toList!10169 (ListLongMap!20308 Nil!29761)) k0!1205))))

(assert (= (and d!141445 res!865219) b!1302595))

(assert (=> d!141445 m!1192757))

(assert (=> d!141445 m!1192757))

(assert (=> d!141445 m!1192759))

(declare-fun m!1193055 () Bool)

(assert (=> d!141445 m!1193055))

(declare-fun m!1193057 () Bool)

(assert (=> d!141445 m!1193057))

(assert (=> b!1302595 m!1192753))

(assert (=> b!1302447 d!141445))

(assert (=> b!1302447 d!141357))

(assert (=> b!1302447 d!141359))

(declare-fun d!141447 () Bool)

(declare-fun e!742997 () Bool)

(assert (=> d!141447 e!742997))

(declare-fun res!865220 () Bool)

(assert (=> d!141447 (=> res!865220 e!742997)))

(declare-fun lt!582612 () Bool)

(assert (=> d!141447 (= res!865220 (not lt!582612))))

(declare-fun lt!582611 () Bool)

(assert (=> d!141447 (= lt!582612 lt!582611)))

(declare-fun lt!582609 () Unit!42954)

(declare-fun e!742996 () Unit!42954)

(assert (=> d!141447 (= lt!582609 e!742996)))

(declare-fun c!124999 () Bool)

(assert (=> d!141447 (= c!124999 lt!582611)))

(assert (=> d!141447 (= lt!582611 (containsKey!722 (toList!10169 lt!582491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141447 (= (contains!8227 lt!582491 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582612)))

(declare-fun b!1302596 () Bool)

(declare-fun lt!582610 () Unit!42954)

(assert (=> b!1302596 (= e!742996 lt!582610)))

(assert (=> b!1302596 (= lt!582610 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 lt!582491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302596 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582491) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302597 () Bool)

(declare-fun Unit!42967 () Unit!42954)

(assert (=> b!1302597 (= e!742996 Unit!42967)))

(declare-fun b!1302598 () Bool)

(assert (=> b!1302598 (= e!742997 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141447 c!124999) b!1302596))

(assert (= (and d!141447 (not c!124999)) b!1302597))

(assert (= (and d!141447 (not res!865220)) b!1302598))

(declare-fun m!1193059 () Bool)

(assert (=> d!141447 m!1193059))

(declare-fun m!1193061 () Bool)

(assert (=> b!1302596 m!1193061))

(assert (=> b!1302596 m!1192963))

(assert (=> b!1302596 m!1192963))

(declare-fun m!1193063 () Bool)

(assert (=> b!1302596 m!1193063))

(assert (=> b!1302598 m!1192963))

(assert (=> b!1302598 m!1192963))

(assert (=> b!1302598 m!1193063))

(assert (=> bm!64121 d!141447))

(declare-fun d!141449 () Bool)

(declare-fun e!742999 () Bool)

(assert (=> d!141449 e!742999))

(declare-fun res!865221 () Bool)

(assert (=> d!141449 (=> res!865221 e!742999)))

(declare-fun lt!582616 () Bool)

(assert (=> d!141449 (= res!865221 (not lt!582616))))

(declare-fun lt!582615 () Bool)

(assert (=> d!141449 (= lt!582616 lt!582615)))

(declare-fun lt!582613 () Unit!42954)

(declare-fun e!742998 () Unit!42954)

(assert (=> d!141449 (= lt!582613 e!742998)))

(declare-fun c!125000 () Bool)

(assert (=> d!141449 (= c!125000 lt!582615)))

(assert (=> d!141449 (= lt!582615 (containsKey!722 (toList!10169 lt!582426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141449 (= (contains!8227 lt!582426 #b0000000000000000000000000000000000000000000000000000000000000000) lt!582616)))

(declare-fun b!1302599 () Bool)

(declare-fun lt!582614 () Unit!42954)

(assert (=> b!1302599 (= e!742998 lt!582614)))

(assert (=> b!1302599 (= lt!582614 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 lt!582426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302599 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582426) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302600 () Bool)

(declare-fun Unit!42968 () Unit!42954)

(assert (=> b!1302600 (= e!742998 Unit!42968)))

(declare-fun b!1302601 () Bool)

(assert (=> b!1302601 (= e!742999 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582426) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141449 c!125000) b!1302599))

(assert (= (and d!141449 (not c!125000)) b!1302600))

(assert (= (and d!141449 (not res!865221)) b!1302601))

(declare-fun m!1193065 () Bool)

(assert (=> d!141449 m!1193065))

(declare-fun m!1193067 () Bool)

(assert (=> b!1302599 m!1193067))

(declare-fun m!1193069 () Bool)

(assert (=> b!1302599 m!1193069))

(assert (=> b!1302599 m!1193069))

(declare-fun m!1193071 () Bool)

(assert (=> b!1302599 m!1193071))

(assert (=> b!1302601 m!1193069))

(assert (=> b!1302601 m!1193069))

(assert (=> b!1302601 m!1193071))

(assert (=> d!141327 d!141449))

(assert (=> d!141327 d!141333))

(declare-fun d!141451 () Bool)

(declare-fun e!743001 () Bool)

(assert (=> d!141451 e!743001))

(declare-fun res!865222 () Bool)

(assert (=> d!141451 (=> res!865222 e!743001)))

(declare-fun lt!582620 () Bool)

(assert (=> d!141451 (= res!865222 (not lt!582620))))

(declare-fun lt!582619 () Bool)

(assert (=> d!141451 (= lt!582620 lt!582619)))

(declare-fun lt!582617 () Unit!42954)

(declare-fun e!743000 () Unit!42954)

(assert (=> d!141451 (= lt!582617 e!743000)))

(declare-fun c!125001 () Bool)

(assert (=> d!141451 (= c!125001 lt!582619)))

(assert (=> d!141451 (= lt!582619 (containsKey!722 (toList!10169 lt!582426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141451 (= (contains!8227 lt!582426 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582620)))

(declare-fun b!1302602 () Bool)

(declare-fun lt!582618 () Unit!42954)

(assert (=> b!1302602 (= e!743000 lt!582618)))

(assert (=> b!1302602 (= lt!582618 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10169 lt!582426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302602 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582426) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302603 () Bool)

(declare-fun Unit!42969 () Unit!42954)

(assert (=> b!1302603 (= e!743000 Unit!42969)))

(declare-fun b!1302604 () Bool)

(assert (=> b!1302604 (= e!743001 (isDefined!512 (getValueByKey!705 (toList!10169 lt!582426) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141451 c!125001) b!1302602))

(assert (= (and d!141451 (not c!125001)) b!1302603))

(assert (= (and d!141451 (not res!865222)) b!1302604))

(declare-fun m!1193073 () Bool)

(assert (=> d!141451 m!1193073))

(declare-fun m!1193075 () Bool)

(assert (=> b!1302602 m!1193075))

(declare-fun m!1193077 () Bool)

(assert (=> b!1302602 m!1193077))

(assert (=> b!1302602 m!1193077))

(declare-fun m!1193079 () Bool)

(assert (=> b!1302602 m!1193079))

(assert (=> b!1302604 m!1193077))

(assert (=> b!1302604 m!1193077))

(assert (=> b!1302604 m!1193079))

(assert (=> b!1302367 d!141451))

(declare-fun b!1302605 () Bool)

(declare-fun e!743003 () Bool)

(assert (=> b!1302605 (= e!743003 tp_is_empty!34873)))

(declare-fun condMapEmpty!53902 () Bool)

(declare-fun mapDefault!53902 () ValueCell!16538)

(assert (=> mapNonEmpty!53901 (= condMapEmpty!53902 (= mapRest!53901 ((as const (Array (_ BitVec 32) ValueCell!16538)) mapDefault!53902)))))

(declare-fun e!743002 () Bool)

(declare-fun mapRes!53902 () Bool)

(assert (=> mapNonEmpty!53901 (= tp!102856 (and e!743002 mapRes!53902))))

(declare-fun mapIsEmpty!53902 () Bool)

(assert (=> mapIsEmpty!53902 mapRes!53902))

(declare-fun mapNonEmpty!53902 () Bool)

(declare-fun tp!102857 () Bool)

(assert (=> mapNonEmpty!53902 (= mapRes!53902 (and tp!102857 e!743003))))

(declare-fun mapRest!53902 () (Array (_ BitVec 32) ValueCell!16538))

(declare-fun mapKey!53902 () (_ BitVec 32))

(declare-fun mapValue!53902 () ValueCell!16538)

(assert (=> mapNonEmpty!53902 (= mapRest!53901 (store mapRest!53902 mapKey!53902 mapValue!53902))))

(declare-fun b!1302606 () Bool)

(assert (=> b!1302606 (= e!743002 tp_is_empty!34873)))

(assert (= (and mapNonEmpty!53901 condMapEmpty!53902) mapIsEmpty!53902))

(assert (= (and mapNonEmpty!53901 (not condMapEmpty!53902)) mapNonEmpty!53902))

(assert (= (and mapNonEmpty!53902 ((_ is ValueCellFull!16538) mapValue!53902)) b!1302605))

(assert (= (and mapNonEmpty!53901 ((_ is ValueCellFull!16538) mapDefault!53902)) b!1302606))

(declare-fun m!1193081 () Bool)

(assert (=> mapNonEmpty!53902 m!1193081))

(declare-fun b_lambda!23237 () Bool)

(assert (= b_lambda!23233 (or (and start!109934 b_free!29233) b_lambda!23237)))

(declare-fun b_lambda!23239 () Bool)

(assert (= b_lambda!23235 (or (and start!109934 b_free!29233) b_lambda!23239)))

(check-sat (not b!1302550) (not d!141387) (not d!141449) (not d!141417) (not b!1302593) (not b!1302594) (not d!141435) (not b!1302554) (not b!1302544) (not b!1302521) (not b!1302578) (not d!141377) (not d!141439) (not b!1302472) (not b!1302560) (not d!141353) (not d!141429) (not d!141389) (not d!141381) (not d!141399) (not b!1302505) (not b!1302581) (not b!1302516) (not b!1302587) (not d!141373) (not b!1302518) (not b!1302574) (not b!1302508) (not b!1302576) (not b!1302507) (not b!1302601) (not mapNonEmpty!53902) (not b!1302569) (not d!141365) (not d!141441) (not d!141405) (not b!1302466) (not b!1302468) (not d!141451) (not d!141367) (not b_next!29233) (not b!1302510) (not d!141445) (not b!1302506) (not b!1302577) (not b!1302580) (not b!1302596) (not d!141383) (not b!1302463) (not b!1302598) (not b!1302458) (not d!141347) (not b_lambda!23229) (not b!1302592) (not d!141369) (not b!1302602) (not b!1302515) (not d!141361) (not d!141397) (not d!141391) (not b!1302517) (not d!141425) (not d!141411) (not b_lambda!23231) (not b!1302460) (not d!141401) (not b_lambda!23237) (not bm!64124) (not b!1302567) (not d!141447) b_and!47371 (not b!1302582) (not d!141407) (not b!1302599) (not b!1302579) (not b!1302504) (not b!1302465) (not b!1302513) tp_is_empty!34873 (not b!1302590) (not b!1302566) (not d!141431) (not b!1302552) (not d!141375) (not d!141413) (not d!141371) (not b!1302487) (not b_lambda!23239) (not b!1302461) (not b!1302494) (not b!1302571) (not d!141443) (not d!141357) (not b!1302589) (not bm!64122) (not b!1302529) (not d!141345) (not d!141379) (not b!1302604) (not b!1302595) (not d!141349) (not d!141433) (not b!1302483) (not b!1302512) (not d!141419) (not d!141385) (not b!1302523) (not b!1302570) (not b!1302493) (not b!1302467) (not d!141437) (not d!141393) (not bm!64123) (not b_lambda!23227))
(check-sat b_and!47371 (not b_next!29233))
