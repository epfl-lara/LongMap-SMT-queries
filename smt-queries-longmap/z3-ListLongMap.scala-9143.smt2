; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109664 () Bool)

(assert start!109664)

(declare-fun b_free!29133 () Bool)

(declare-fun b_next!29133 () Bool)

(assert (=> start!109664 (= b_free!29133 (not b_next!29133))))

(declare-fun tp!102521 () Bool)

(declare-fun b_and!47227 () Bool)

(assert (=> start!109664 (= tp!102521 b_and!47227)))

(declare-fun b!1299013 () Bool)

(declare-fun e!741075 () Bool)

(declare-fun tp_is_empty!34773 () Bool)

(assert (=> b!1299013 (= e!741075 tp_is_empty!34773)))

(declare-fun b!1299014 () Bool)

(declare-fun res!863289 () Bool)

(declare-fun e!741077 () Bool)

(assert (=> b!1299014 (=> (not res!863289) (not e!741077))))

(declare-datatypes ((V!51467 0))(
  ( (V!51468 (val!17461 Int)) )
))
(declare-fun minValue!1387 () V!51467)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16488 0))(
  ( (ValueCellFull!16488 (v!20065 V!51467)) (EmptyCell!16488) )
))
(declare-datatypes ((array!86552 0))(
  ( (array!86553 (arr!41776 (Array (_ BitVec 32) ValueCell!16488)) (size!42326 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86552)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86554 0))(
  ( (array!86555 (arr!41777 (Array (_ BitVec 32) (_ BitVec 64))) (size!42327 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86554)

(declare-fun zeroValue!1387 () V!51467)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22520 0))(
  ( (tuple2!22521 (_1!11271 (_ BitVec 64)) (_2!11271 V!51467)) )
))
(declare-datatypes ((List!29649 0))(
  ( (Nil!29646) (Cons!29645 (h!30854 tuple2!22520) (t!43215 List!29649)) )
))
(declare-datatypes ((ListLongMap!20177 0))(
  ( (ListLongMap!20178 (toList!10104 List!29649)) )
))
(declare-fun contains!8223 (ListLongMap!20177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5133 (array!86554 array!86552 (_ BitVec 32) (_ BitVec 32) V!51467 V!51467 (_ BitVec 32) Int) ListLongMap!20177)

(assert (=> b!1299014 (= res!863289 (contains!8223 (getCurrentListMap!5133 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1299015 () Bool)

(declare-fun res!863290 () Bool)

(assert (=> b!1299015 (=> (not res!863290) (not e!741077))))

(assert (=> b!1299015 (= res!863290 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42327 _keys!1741))))))

(declare-fun b!1299016 () Bool)

(declare-fun res!863286 () Bool)

(assert (=> b!1299016 (=> (not res!863286) (not e!741077))))

(assert (=> b!1299016 (= res!863286 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42327 _keys!1741)) (= (select (arr!41777 _keys!1741) from!2144) k0!1205)))))

(declare-fun b!1299017 () Bool)

(declare-fun res!863287 () Bool)

(assert (=> b!1299017 (=> (not res!863287) (not e!741077))))

(assert (=> b!1299017 (= res!863287 (and (= (size!42326 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42327 _keys!1741) (size!42326 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53723 () Bool)

(declare-fun mapRes!53723 () Bool)

(declare-fun tp!102520 () Bool)

(declare-fun e!741076 () Bool)

(assert (=> mapNonEmpty!53723 (= mapRes!53723 (and tp!102520 e!741076))))

(declare-fun mapKey!53723 () (_ BitVec 32))

(declare-fun mapValue!53723 () ValueCell!16488)

(declare-fun mapRest!53723 () (Array (_ BitVec 32) ValueCell!16488))

(assert (=> mapNonEmpty!53723 (= (arr!41776 _values!1445) (store mapRest!53723 mapKey!53723 mapValue!53723))))

(declare-fun b!1299018 () Bool)

(declare-fun res!863292 () Bool)

(assert (=> b!1299018 (=> (not res!863292) (not e!741077))))

(declare-datatypes ((List!29650 0))(
  ( (Nil!29647) (Cons!29646 (h!30855 (_ BitVec 64)) (t!43216 List!29650)) )
))
(declare-fun arrayNoDuplicates!0 (array!86554 (_ BitVec 32) List!29650) Bool)

(assert (=> b!1299018 (= res!863292 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29647))))

(declare-fun b!1299019 () Bool)

(declare-fun res!863291 () Bool)

(assert (=> b!1299019 (=> (not res!863291) (not e!741077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86554 (_ BitVec 32)) Bool)

(assert (=> b!1299019 (= res!863291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299020 () Bool)

(declare-fun arrayContainsKey!0 (array!86554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1299020 (= e!741077 (not (arrayContainsKey!0 _keys!1741 k0!1205 from!2144)))))

(declare-fun mapIsEmpty!53723 () Bool)

(assert (=> mapIsEmpty!53723 mapRes!53723))

(declare-fun res!863288 () Bool)

(assert (=> start!109664 (=> (not res!863288) (not e!741077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109664 (= res!863288 (validMask!0 mask!2175))))

(assert (=> start!109664 e!741077))

(assert (=> start!109664 tp_is_empty!34773))

(assert (=> start!109664 true))

(declare-fun e!741078 () Bool)

(declare-fun array_inv!31617 (array!86552) Bool)

(assert (=> start!109664 (and (array_inv!31617 _values!1445) e!741078)))

(declare-fun array_inv!31618 (array!86554) Bool)

(assert (=> start!109664 (array_inv!31618 _keys!1741)))

(assert (=> start!109664 tp!102521))

(declare-fun b!1299021 () Bool)

(assert (=> b!1299021 (= e!741078 (and e!741075 mapRes!53723))))

(declare-fun condMapEmpty!53723 () Bool)

(declare-fun mapDefault!53723 () ValueCell!16488)

(assert (=> b!1299021 (= condMapEmpty!53723 (= (arr!41776 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16488)) mapDefault!53723)))))

(declare-fun b!1299022 () Bool)

(assert (=> b!1299022 (= e!741076 tp_is_empty!34773)))

(assert (= (and start!109664 res!863288) b!1299017))

(assert (= (and b!1299017 res!863287) b!1299019))

(assert (= (and b!1299019 res!863291) b!1299018))

(assert (= (and b!1299018 res!863292) b!1299015))

(assert (= (and b!1299015 res!863290) b!1299014))

(assert (= (and b!1299014 res!863289) b!1299016))

(assert (= (and b!1299016 res!863286) b!1299020))

(assert (= (and b!1299021 condMapEmpty!53723) mapIsEmpty!53723))

(assert (= (and b!1299021 (not condMapEmpty!53723)) mapNonEmpty!53723))

(get-info :version)

(assert (= (and mapNonEmpty!53723 ((_ is ValueCellFull!16488) mapValue!53723)) b!1299022))

(assert (= (and b!1299021 ((_ is ValueCellFull!16488) mapDefault!53723)) b!1299013))

(assert (= start!109664 b!1299021))

(declare-fun m!1190295 () Bool)

(assert (=> start!109664 m!1190295))

(declare-fun m!1190297 () Bool)

(assert (=> start!109664 m!1190297))

(declare-fun m!1190299 () Bool)

(assert (=> start!109664 m!1190299))

(declare-fun m!1190301 () Bool)

(assert (=> b!1299016 m!1190301))

(declare-fun m!1190303 () Bool)

(assert (=> b!1299018 m!1190303))

(declare-fun m!1190305 () Bool)

(assert (=> b!1299020 m!1190305))

(declare-fun m!1190307 () Bool)

(assert (=> mapNonEmpty!53723 m!1190307))

(declare-fun m!1190309 () Bool)

(assert (=> b!1299014 m!1190309))

(assert (=> b!1299014 m!1190309))

(declare-fun m!1190311 () Bool)

(assert (=> b!1299014 m!1190311))

(declare-fun m!1190313 () Bool)

(assert (=> b!1299019 m!1190313))

(check-sat (not b!1299018) (not b_next!29133) (not b!1299019) (not b!1299014) (not start!109664) (not b!1299020) (not mapNonEmpty!53723) b_and!47227 tp_is_empty!34773)
(check-sat b_and!47227 (not b_next!29133))
(get-model)

(declare-fun d!141079 () Bool)

(assert (=> d!141079 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109664 d!141079))

(declare-fun d!141081 () Bool)

(assert (=> d!141081 (= (array_inv!31617 _values!1445) (bvsge (size!42326 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109664 d!141081))

(declare-fun d!141083 () Bool)

(assert (=> d!141083 (= (array_inv!31618 _keys!1741) (bvsge (size!42327 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109664 d!141083))

(declare-fun d!141085 () Bool)

(declare-fun res!863318 () Bool)

(declare-fun e!741099 () Bool)

(assert (=> d!141085 (=> res!863318 e!741099)))

(assert (=> d!141085 (= res!863318 (= (select (arr!41777 _keys!1741) from!2144) k0!1205))))

(assert (=> d!141085 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!741099)))

(declare-fun b!1299057 () Bool)

(declare-fun e!741100 () Bool)

(assert (=> b!1299057 (= e!741099 e!741100)))

(declare-fun res!863319 () Bool)

(assert (=> b!1299057 (=> (not res!863319) (not e!741100))))

(assert (=> b!1299057 (= res!863319 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42327 _keys!1741)))))

(declare-fun b!1299058 () Bool)

(assert (=> b!1299058 (= e!741100 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141085 (not res!863318)) b!1299057))

(assert (= (and b!1299057 res!863319) b!1299058))

(assert (=> d!141085 m!1190301))

(declare-fun m!1190335 () Bool)

(assert (=> b!1299058 m!1190335))

(assert (=> b!1299020 d!141085))

(declare-fun b!1299067 () Bool)

(declare-fun e!741108 () Bool)

(declare-fun call!63546 () Bool)

(assert (=> b!1299067 (= e!741108 call!63546)))

(declare-fun d!141087 () Bool)

(declare-fun res!863324 () Bool)

(declare-fun e!741107 () Bool)

(assert (=> d!141087 (=> res!863324 e!741107)))

(assert (=> d!141087 (= res!863324 (bvsge #b00000000000000000000000000000000 (size!42327 _keys!1741)))))

(assert (=> d!141087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741107)))

(declare-fun b!1299068 () Bool)

(declare-fun e!741109 () Bool)

(assert (=> b!1299068 (= e!741108 e!741109)))

(declare-fun lt!580875 () (_ BitVec 64))

(assert (=> b!1299068 (= lt!580875 (select (arr!41777 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43017 0))(
  ( (Unit!43018) )
))
(declare-fun lt!580876 () Unit!43017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86554 (_ BitVec 64) (_ BitVec 32)) Unit!43017)

(assert (=> b!1299068 (= lt!580876 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!580875 #b00000000000000000000000000000000))))

(assert (=> b!1299068 (arrayContainsKey!0 _keys!1741 lt!580875 #b00000000000000000000000000000000)))

(declare-fun lt!580874 () Unit!43017)

(assert (=> b!1299068 (= lt!580874 lt!580876)))

(declare-fun res!863325 () Bool)

(declare-datatypes ((SeekEntryResult!10016 0))(
  ( (MissingZero!10016 (index!42435 (_ BitVec 32))) (Found!10016 (index!42436 (_ BitVec 32))) (Intermediate!10016 (undefined!10828 Bool) (index!42437 (_ BitVec 32)) (x!115402 (_ BitVec 32))) (Undefined!10016) (MissingVacant!10016 (index!42438 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86554 (_ BitVec 32)) SeekEntryResult!10016)

(assert (=> b!1299068 (= res!863325 (= (seekEntryOrOpen!0 (select (arr!41777 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10016 #b00000000000000000000000000000000)))))

(assert (=> b!1299068 (=> (not res!863325) (not e!741109))))

(declare-fun b!1299069 () Bool)

(assert (=> b!1299069 (= e!741107 e!741108)))

(declare-fun c!124454 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299069 (= c!124454 (validKeyInArray!0 (select (arr!41777 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63543 () Bool)

(assert (=> bm!63543 (= call!63546 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1299070 () Bool)

(assert (=> b!1299070 (= e!741109 call!63546)))

(assert (= (and d!141087 (not res!863324)) b!1299069))

(assert (= (and b!1299069 c!124454) b!1299068))

(assert (= (and b!1299069 (not c!124454)) b!1299067))

(assert (= (and b!1299068 res!863325) b!1299070))

(assert (= (or b!1299070 b!1299067) bm!63543))

(declare-fun m!1190337 () Bool)

(assert (=> b!1299068 m!1190337))

(declare-fun m!1190339 () Bool)

(assert (=> b!1299068 m!1190339))

(declare-fun m!1190341 () Bool)

(assert (=> b!1299068 m!1190341))

(assert (=> b!1299068 m!1190337))

(declare-fun m!1190343 () Bool)

(assert (=> b!1299068 m!1190343))

(assert (=> b!1299069 m!1190337))

(assert (=> b!1299069 m!1190337))

(declare-fun m!1190345 () Bool)

(assert (=> b!1299069 m!1190345))

(declare-fun m!1190347 () Bool)

(assert (=> bm!63543 m!1190347))

(assert (=> b!1299019 d!141087))

(declare-fun b!1299081 () Bool)

(declare-fun e!741120 () Bool)

(declare-fun contains!8224 (List!29650 (_ BitVec 64)) Bool)

(assert (=> b!1299081 (= e!741120 (contains!8224 Nil!29647 (select (arr!41777 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63546 () Bool)

(declare-fun call!63549 () Bool)

(declare-fun c!124457 () Bool)

(assert (=> bm!63546 (= call!63549 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124457 (Cons!29646 (select (arr!41777 _keys!1741) #b00000000000000000000000000000000) Nil!29647) Nil!29647)))))

(declare-fun d!141089 () Bool)

(declare-fun res!863334 () Bool)

(declare-fun e!741121 () Bool)

(assert (=> d!141089 (=> res!863334 e!741121)))

(assert (=> d!141089 (= res!863334 (bvsge #b00000000000000000000000000000000 (size!42327 _keys!1741)))))

(assert (=> d!141089 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29647) e!741121)))

(declare-fun b!1299082 () Bool)

(declare-fun e!741119 () Bool)

(assert (=> b!1299082 (= e!741121 e!741119)))

(declare-fun res!863332 () Bool)

(assert (=> b!1299082 (=> (not res!863332) (not e!741119))))

(assert (=> b!1299082 (= res!863332 (not e!741120))))

(declare-fun res!863333 () Bool)

(assert (=> b!1299082 (=> (not res!863333) (not e!741120))))

(assert (=> b!1299082 (= res!863333 (validKeyInArray!0 (select (arr!41777 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1299083 () Bool)

(declare-fun e!741118 () Bool)

(assert (=> b!1299083 (= e!741118 call!63549)))

(declare-fun b!1299084 () Bool)

(assert (=> b!1299084 (= e!741118 call!63549)))

(declare-fun b!1299085 () Bool)

(assert (=> b!1299085 (= e!741119 e!741118)))

(assert (=> b!1299085 (= c!124457 (validKeyInArray!0 (select (arr!41777 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141089 (not res!863334)) b!1299082))

(assert (= (and b!1299082 res!863333) b!1299081))

(assert (= (and b!1299082 res!863332) b!1299085))

(assert (= (and b!1299085 c!124457) b!1299083))

(assert (= (and b!1299085 (not c!124457)) b!1299084))

(assert (= (or b!1299083 b!1299084) bm!63546))

(assert (=> b!1299081 m!1190337))

(assert (=> b!1299081 m!1190337))

(declare-fun m!1190349 () Bool)

(assert (=> b!1299081 m!1190349))

(assert (=> bm!63546 m!1190337))

(declare-fun m!1190351 () Bool)

(assert (=> bm!63546 m!1190351))

(assert (=> b!1299082 m!1190337))

(assert (=> b!1299082 m!1190337))

(assert (=> b!1299082 m!1190345))

(assert (=> b!1299085 m!1190337))

(assert (=> b!1299085 m!1190337))

(assert (=> b!1299085 m!1190345))

(assert (=> b!1299018 d!141089))

(declare-fun d!141091 () Bool)

(declare-fun e!741127 () Bool)

(assert (=> d!141091 e!741127))

(declare-fun res!863337 () Bool)

(assert (=> d!141091 (=> res!863337 e!741127)))

(declare-fun lt!580887 () Bool)

(assert (=> d!141091 (= res!863337 (not lt!580887))))

(declare-fun lt!580888 () Bool)

(assert (=> d!141091 (= lt!580887 lt!580888)))

(declare-fun lt!580885 () Unit!43017)

(declare-fun e!741126 () Unit!43017)

(assert (=> d!141091 (= lt!580885 e!741126)))

(declare-fun c!124460 () Bool)

(assert (=> d!141091 (= c!124460 lt!580888)))

(declare-fun containsKey!718 (List!29649 (_ BitVec 64)) Bool)

(assert (=> d!141091 (= lt!580888 (containsKey!718 (toList!10104 (getCurrentListMap!5133 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141091 (= (contains!8223 (getCurrentListMap!5133 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!580887)))

(declare-fun b!1299092 () Bool)

(declare-fun lt!580886 () Unit!43017)

(assert (=> b!1299092 (= e!741126 lt!580886)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!464 (List!29649 (_ BitVec 64)) Unit!43017)

(assert (=> b!1299092 (= lt!580886 (lemmaContainsKeyImpliesGetValueByKeyDefined!464 (toList!10104 (getCurrentListMap!5133 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-datatypes ((Option!748 0))(
  ( (Some!747 (v!20067 V!51467)) (None!746) )
))
(declare-fun isDefined!503 (Option!748) Bool)

(declare-fun getValueByKey!696 (List!29649 (_ BitVec 64)) Option!748)

(assert (=> b!1299092 (isDefined!503 (getValueByKey!696 (toList!10104 (getCurrentListMap!5133 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1299093 () Bool)

(declare-fun Unit!43019 () Unit!43017)

(assert (=> b!1299093 (= e!741126 Unit!43019)))

(declare-fun b!1299094 () Bool)

(assert (=> b!1299094 (= e!741127 (isDefined!503 (getValueByKey!696 (toList!10104 (getCurrentListMap!5133 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141091 c!124460) b!1299092))

(assert (= (and d!141091 (not c!124460)) b!1299093))

(assert (= (and d!141091 (not res!863337)) b!1299094))

(declare-fun m!1190353 () Bool)

(assert (=> d!141091 m!1190353))

(declare-fun m!1190355 () Bool)

(assert (=> b!1299092 m!1190355))

(declare-fun m!1190357 () Bool)

(assert (=> b!1299092 m!1190357))

(assert (=> b!1299092 m!1190357))

(declare-fun m!1190359 () Bool)

(assert (=> b!1299092 m!1190359))

(assert (=> b!1299094 m!1190357))

(assert (=> b!1299094 m!1190357))

(assert (=> b!1299094 m!1190359))

(assert (=> b!1299014 d!141091))

(declare-fun b!1299137 () Bool)

(declare-fun e!741166 () Bool)

(declare-fun lt!580953 () ListLongMap!20177)

(declare-fun apply!1013 (ListLongMap!20177 (_ BitVec 64)) V!51467)

(assert (=> b!1299137 (= e!741166 (= (apply!1013 lt!580953 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1299138 () Bool)

(declare-fun e!741154 () Bool)

(assert (=> b!1299138 (= e!741154 e!741166)))

(declare-fun res!863358 () Bool)

(declare-fun call!63570 () Bool)

(assert (=> b!1299138 (= res!863358 call!63570)))

(assert (=> b!1299138 (=> (not res!863358) (not e!741166))))

(declare-fun bm!63561 () Bool)

(declare-fun call!63566 () ListLongMap!20177)

(declare-fun call!63569 () ListLongMap!20177)

(assert (=> bm!63561 (= call!63566 call!63569)))

(declare-fun b!1299139 () Bool)

(declare-fun e!741165 () ListLongMap!20177)

(declare-fun call!63568 () ListLongMap!20177)

(assert (=> b!1299139 (= e!741165 call!63568)))

(declare-fun d!141093 () Bool)

(declare-fun e!741163 () Bool)

(assert (=> d!141093 e!741163))

(declare-fun res!863359 () Bool)

(assert (=> d!141093 (=> (not res!863359) (not e!741163))))

(assert (=> d!141093 (= res!863359 (or (bvsge from!2144 (size!42327 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42327 _keys!1741)))))))

(declare-fun lt!580948 () ListLongMap!20177)

(assert (=> d!141093 (= lt!580953 lt!580948)))

(declare-fun lt!580934 () Unit!43017)

(declare-fun e!741156 () Unit!43017)

(assert (=> d!141093 (= lt!580934 e!741156)))

(declare-fun c!124476 () Bool)

(declare-fun e!741158 () Bool)

(assert (=> d!141093 (= c!124476 e!741158)))

(declare-fun res!863356 () Bool)

(assert (=> d!141093 (=> (not res!863356) (not e!741158))))

(assert (=> d!141093 (= res!863356 (bvslt from!2144 (size!42327 _keys!1741)))))

(declare-fun e!741159 () ListLongMap!20177)

(assert (=> d!141093 (= lt!580948 e!741159)))

(declare-fun c!124478 () Bool)

(assert (=> d!141093 (= c!124478 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141093 (validMask!0 mask!2175)))

(assert (=> d!141093 (= (getCurrentListMap!5133 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!580953)))

(declare-fun b!1299140 () Bool)

(declare-fun e!741157 () Bool)

(declare-fun e!741162 () Bool)

(assert (=> b!1299140 (= e!741157 e!741162)))

(declare-fun res!863357 () Bool)

(declare-fun call!63567 () Bool)

(assert (=> b!1299140 (= res!863357 call!63567)))

(assert (=> b!1299140 (=> (not res!863357) (not e!741162))))

(declare-fun e!741160 () Bool)

(declare-fun b!1299141 () Bool)

(declare-fun get!21102 (ValueCell!16488 V!51467) V!51467)

(declare-fun dynLambda!3417 (Int (_ BitVec 64)) V!51467)

(assert (=> b!1299141 (= e!741160 (= (apply!1013 lt!580953 (select (arr!41777 _keys!1741) from!2144)) (get!21102 (select (arr!41776 _values!1445) from!2144) (dynLambda!3417 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299141 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42326 _values!1445)))))

(assert (=> b!1299141 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42327 _keys!1741)))))

(declare-fun b!1299142 () Bool)

(declare-fun e!741161 () Bool)

(assert (=> b!1299142 (= e!741161 e!741160)))

(declare-fun res!863362 () Bool)

(assert (=> b!1299142 (=> (not res!863362) (not e!741160))))

(assert (=> b!1299142 (= res!863362 (contains!8223 lt!580953 (select (arr!41777 _keys!1741) from!2144)))))

(assert (=> b!1299142 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42327 _keys!1741)))))

(declare-fun b!1299143 () Bool)

(assert (=> b!1299143 (= e!741163 e!741157)))

(declare-fun c!124475 () Bool)

(assert (=> b!1299143 (= c!124475 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63562 () Bool)

(assert (=> bm!63562 (= call!63567 (contains!8223 lt!580953 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1299144 () Bool)

(declare-fun res!863364 () Bool)

(assert (=> b!1299144 (=> (not res!863364) (not e!741163))))

(assert (=> b!1299144 (= res!863364 e!741161)))

(declare-fun res!863363 () Bool)

(assert (=> b!1299144 (=> res!863363 e!741161)))

(declare-fun e!741164 () Bool)

(assert (=> b!1299144 (= res!863363 (not e!741164))))

(declare-fun res!863361 () Bool)

(assert (=> b!1299144 (=> (not res!863361) (not e!741164))))

(assert (=> b!1299144 (= res!863361 (bvslt from!2144 (size!42327 _keys!1741)))))

(declare-fun b!1299145 () Bool)

(declare-fun res!863360 () Bool)

(assert (=> b!1299145 (=> (not res!863360) (not e!741163))))

(assert (=> b!1299145 (= res!863360 e!741154)))

(declare-fun c!124473 () Bool)

(assert (=> b!1299145 (= c!124473 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!63563 () Bool)

(declare-fun call!63565 () ListLongMap!20177)

(declare-fun getCurrentListMapNoExtraKeys!6071 (array!86554 array!86552 (_ BitVec 32) (_ BitVec 32) V!51467 V!51467 (_ BitVec 32) Int) ListLongMap!20177)

(assert (=> bm!63563 (= call!63565 (getCurrentListMapNoExtraKeys!6071 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1299146 () Bool)

(assert (=> b!1299146 (= e!741157 (not call!63567))))

(declare-fun b!1299147 () Bool)

(declare-fun Unit!43020 () Unit!43017)

(assert (=> b!1299147 (= e!741156 Unit!43020)))

(declare-fun bm!63564 () Bool)

(declare-fun call!63564 () ListLongMap!20177)

(assert (=> bm!63564 (= call!63568 call!63564)))

(declare-fun b!1299148 () Bool)

(assert (=> b!1299148 (= e!741165 call!63566)))

(declare-fun bm!63565 () Bool)

(assert (=> bm!63565 (= call!63564 call!63565)))

(declare-fun b!1299149 () Bool)

(assert (=> b!1299149 (= e!741162 (= (apply!1013 lt!580953 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1299150 () Bool)

(declare-fun e!741155 () ListLongMap!20177)

(assert (=> b!1299150 (= e!741155 call!63566)))

(declare-fun bm!63566 () Bool)

(assert (=> bm!63566 (= call!63570 (contains!8223 lt!580953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1299151 () Bool)

(assert (=> b!1299151 (= e!741164 (validKeyInArray!0 (select (arr!41777 _keys!1741) from!2144)))))

(declare-fun b!1299152 () Bool)

(declare-fun lt!580954 () Unit!43017)

(assert (=> b!1299152 (= e!741156 lt!580954)))

(declare-fun lt!580935 () ListLongMap!20177)

(assert (=> b!1299152 (= lt!580935 (getCurrentListMapNoExtraKeys!6071 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580938 () (_ BitVec 64))

(assert (=> b!1299152 (= lt!580938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580949 () (_ BitVec 64))

(assert (=> b!1299152 (= lt!580949 (select (arr!41777 _keys!1741) from!2144))))

(declare-fun lt!580944 () Unit!43017)

(declare-fun addStillContains!1101 (ListLongMap!20177 (_ BitVec 64) V!51467 (_ BitVec 64)) Unit!43017)

(assert (=> b!1299152 (= lt!580944 (addStillContains!1101 lt!580935 lt!580938 zeroValue!1387 lt!580949))))

(declare-fun +!4440 (ListLongMap!20177 tuple2!22520) ListLongMap!20177)

(assert (=> b!1299152 (contains!8223 (+!4440 lt!580935 (tuple2!22521 lt!580938 zeroValue!1387)) lt!580949)))

(declare-fun lt!580939 () Unit!43017)

(assert (=> b!1299152 (= lt!580939 lt!580944)))

(declare-fun lt!580950 () ListLongMap!20177)

(assert (=> b!1299152 (= lt!580950 (getCurrentListMapNoExtraKeys!6071 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580942 () (_ BitVec 64))

(assert (=> b!1299152 (= lt!580942 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580937 () (_ BitVec 64))

(assert (=> b!1299152 (= lt!580937 (select (arr!41777 _keys!1741) from!2144))))

(declare-fun lt!580933 () Unit!43017)

(declare-fun addApplyDifferent!555 (ListLongMap!20177 (_ BitVec 64) V!51467 (_ BitVec 64)) Unit!43017)

(assert (=> b!1299152 (= lt!580933 (addApplyDifferent!555 lt!580950 lt!580942 minValue!1387 lt!580937))))

(assert (=> b!1299152 (= (apply!1013 (+!4440 lt!580950 (tuple2!22521 lt!580942 minValue!1387)) lt!580937) (apply!1013 lt!580950 lt!580937))))

(declare-fun lt!580952 () Unit!43017)

(assert (=> b!1299152 (= lt!580952 lt!580933)))

(declare-fun lt!580943 () ListLongMap!20177)

(assert (=> b!1299152 (= lt!580943 (getCurrentListMapNoExtraKeys!6071 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580941 () (_ BitVec 64))

(assert (=> b!1299152 (= lt!580941 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580946 () (_ BitVec 64))

(assert (=> b!1299152 (= lt!580946 (select (arr!41777 _keys!1741) from!2144))))

(declare-fun lt!580936 () Unit!43017)

(assert (=> b!1299152 (= lt!580936 (addApplyDifferent!555 lt!580943 lt!580941 zeroValue!1387 lt!580946))))

(assert (=> b!1299152 (= (apply!1013 (+!4440 lt!580943 (tuple2!22521 lt!580941 zeroValue!1387)) lt!580946) (apply!1013 lt!580943 lt!580946))))

(declare-fun lt!580945 () Unit!43017)

(assert (=> b!1299152 (= lt!580945 lt!580936)))

(declare-fun lt!580940 () ListLongMap!20177)

(assert (=> b!1299152 (= lt!580940 (getCurrentListMapNoExtraKeys!6071 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!580947 () (_ BitVec 64))

(assert (=> b!1299152 (= lt!580947 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!580951 () (_ BitVec 64))

(assert (=> b!1299152 (= lt!580951 (select (arr!41777 _keys!1741) from!2144))))

(assert (=> b!1299152 (= lt!580954 (addApplyDifferent!555 lt!580940 lt!580947 minValue!1387 lt!580951))))

(assert (=> b!1299152 (= (apply!1013 (+!4440 lt!580940 (tuple2!22521 lt!580947 minValue!1387)) lt!580951) (apply!1013 lt!580940 lt!580951))))

(declare-fun b!1299153 () Bool)

(assert (=> b!1299153 (= e!741158 (validKeyInArray!0 (select (arr!41777 _keys!1741) from!2144)))))

(declare-fun b!1299154 () Bool)

(assert (=> b!1299154 (= e!741154 (not call!63570))))

(declare-fun b!1299155 () Bool)

(assert (=> b!1299155 (= e!741159 e!741155)))

(declare-fun c!124477 () Bool)

(assert (=> b!1299155 (= c!124477 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1299156 () Bool)

(declare-fun c!124474 () Bool)

(assert (=> b!1299156 (= c!124474 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1299156 (= e!741155 e!741165)))

(declare-fun bm!63567 () Bool)

(assert (=> bm!63567 (= call!63569 (+!4440 (ite c!124478 call!63565 (ite c!124477 call!63564 call!63568)) (ite (or c!124478 c!124477) (tuple2!22521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1299157 () Bool)

(assert (=> b!1299157 (= e!741159 (+!4440 call!63569 (tuple2!22521 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141093 c!124478) b!1299157))

(assert (= (and d!141093 (not c!124478)) b!1299155))

(assert (= (and b!1299155 c!124477) b!1299150))

(assert (= (and b!1299155 (not c!124477)) b!1299156))

(assert (= (and b!1299156 c!124474) b!1299148))

(assert (= (and b!1299156 (not c!124474)) b!1299139))

(assert (= (or b!1299148 b!1299139) bm!63564))

(assert (= (or b!1299150 bm!63564) bm!63565))

(assert (= (or b!1299150 b!1299148) bm!63561))

(assert (= (or b!1299157 bm!63565) bm!63563))

(assert (= (or b!1299157 bm!63561) bm!63567))

(assert (= (and d!141093 res!863356) b!1299153))

(assert (= (and d!141093 c!124476) b!1299152))

(assert (= (and d!141093 (not c!124476)) b!1299147))

(assert (= (and d!141093 res!863359) b!1299144))

(assert (= (and b!1299144 res!863361) b!1299151))

(assert (= (and b!1299144 (not res!863363)) b!1299142))

(assert (= (and b!1299142 res!863362) b!1299141))

(assert (= (and b!1299144 res!863364) b!1299145))

(assert (= (and b!1299145 c!124473) b!1299138))

(assert (= (and b!1299145 (not c!124473)) b!1299154))

(assert (= (and b!1299138 res!863358) b!1299137))

(assert (= (or b!1299138 b!1299154) bm!63566))

(assert (= (and b!1299145 res!863360) b!1299143))

(assert (= (and b!1299143 c!124475) b!1299140))

(assert (= (and b!1299143 (not c!124475)) b!1299146))

(assert (= (and b!1299140 res!863357) b!1299149))

(assert (= (or b!1299140 b!1299146) bm!63562))

(declare-fun b_lambda!23145 () Bool)

(assert (=> (not b_lambda!23145) (not b!1299141)))

(declare-fun t!43219 () Bool)

(declare-fun tb!11371 () Bool)

(assert (=> (and start!109664 (= defaultEntry!1448 defaultEntry!1448) t!43219) tb!11371))

(declare-fun result!23745 () Bool)

(assert (=> tb!11371 (= result!23745 tp_is_empty!34773)))

(assert (=> b!1299141 t!43219))

(declare-fun b_and!47231 () Bool)

(assert (= b_and!47227 (and (=> t!43219 result!23745) b_and!47231)))

(assert (=> b!1299151 m!1190301))

(assert (=> b!1299151 m!1190301))

(declare-fun m!1190361 () Bool)

(assert (=> b!1299151 m!1190361))

(declare-fun m!1190363 () Bool)

(assert (=> b!1299149 m!1190363))

(assert (=> b!1299142 m!1190301))

(assert (=> b!1299142 m!1190301))

(declare-fun m!1190365 () Bool)

(assert (=> b!1299142 m!1190365))

(declare-fun m!1190367 () Bool)

(assert (=> b!1299137 m!1190367))

(declare-fun m!1190369 () Bool)

(assert (=> b!1299157 m!1190369))

(declare-fun m!1190371 () Bool)

(assert (=> b!1299152 m!1190371))

(declare-fun m!1190373 () Bool)

(assert (=> b!1299152 m!1190373))

(assert (=> b!1299152 m!1190301))

(declare-fun m!1190375 () Bool)

(assert (=> b!1299152 m!1190375))

(declare-fun m!1190377 () Bool)

(assert (=> b!1299152 m!1190377))

(declare-fun m!1190379 () Bool)

(assert (=> b!1299152 m!1190379))

(declare-fun m!1190381 () Bool)

(assert (=> b!1299152 m!1190381))

(assert (=> b!1299152 m!1190371))

(declare-fun m!1190383 () Bool)

(assert (=> b!1299152 m!1190383))

(assert (=> b!1299152 m!1190379))

(declare-fun m!1190385 () Bool)

(assert (=> b!1299152 m!1190385))

(declare-fun m!1190387 () Bool)

(assert (=> b!1299152 m!1190387))

(declare-fun m!1190389 () Bool)

(assert (=> b!1299152 m!1190389))

(declare-fun m!1190391 () Bool)

(assert (=> b!1299152 m!1190391))

(declare-fun m!1190393 () Bool)

(assert (=> b!1299152 m!1190393))

(assert (=> b!1299152 m!1190375))

(declare-fun m!1190395 () Bool)

(assert (=> b!1299152 m!1190395))

(declare-fun m!1190397 () Bool)

(assert (=> b!1299152 m!1190397))

(declare-fun m!1190399 () Bool)

(assert (=> b!1299152 m!1190399))

(assert (=> b!1299152 m!1190387))

(declare-fun m!1190401 () Bool)

(assert (=> b!1299152 m!1190401))

(declare-fun m!1190403 () Bool)

(assert (=> bm!63566 m!1190403))

(assert (=> b!1299153 m!1190301))

(assert (=> b!1299153 m!1190301))

(assert (=> b!1299153 m!1190361))

(declare-fun m!1190405 () Bool)

(assert (=> bm!63562 m!1190405))

(declare-fun m!1190407 () Bool)

(assert (=> bm!63567 m!1190407))

(assert (=> d!141093 m!1190295))

(assert (=> b!1299141 m!1190301))

(declare-fun m!1190409 () Bool)

(assert (=> b!1299141 m!1190409))

(declare-fun m!1190411 () Bool)

(assert (=> b!1299141 m!1190411))

(declare-fun m!1190413 () Bool)

(assert (=> b!1299141 m!1190413))

(assert (=> b!1299141 m!1190413))

(assert (=> b!1299141 m!1190411))

(declare-fun m!1190415 () Bool)

(assert (=> b!1299141 m!1190415))

(assert (=> b!1299141 m!1190301))

(assert (=> bm!63563 m!1190389))

(assert (=> b!1299014 d!141093))

(declare-fun mapNonEmpty!53729 () Bool)

(declare-fun mapRes!53729 () Bool)

(declare-fun tp!102530 () Bool)

(declare-fun e!741171 () Bool)

(assert (=> mapNonEmpty!53729 (= mapRes!53729 (and tp!102530 e!741171))))

(declare-fun mapKey!53729 () (_ BitVec 32))

(declare-fun mapValue!53729 () ValueCell!16488)

(declare-fun mapRest!53729 () (Array (_ BitVec 32) ValueCell!16488))

(assert (=> mapNonEmpty!53729 (= mapRest!53723 (store mapRest!53729 mapKey!53729 mapValue!53729))))

(declare-fun b!1299167 () Bool)

(declare-fun e!741172 () Bool)

(assert (=> b!1299167 (= e!741172 tp_is_empty!34773)))

(declare-fun condMapEmpty!53729 () Bool)

(declare-fun mapDefault!53729 () ValueCell!16488)

(assert (=> mapNonEmpty!53723 (= condMapEmpty!53729 (= mapRest!53723 ((as const (Array (_ BitVec 32) ValueCell!16488)) mapDefault!53729)))))

(assert (=> mapNonEmpty!53723 (= tp!102520 (and e!741172 mapRes!53729))))

(declare-fun b!1299166 () Bool)

(assert (=> b!1299166 (= e!741171 tp_is_empty!34773)))

(declare-fun mapIsEmpty!53729 () Bool)

(assert (=> mapIsEmpty!53729 mapRes!53729))

(assert (= (and mapNonEmpty!53723 condMapEmpty!53729) mapIsEmpty!53729))

(assert (= (and mapNonEmpty!53723 (not condMapEmpty!53729)) mapNonEmpty!53729))

(assert (= (and mapNonEmpty!53729 ((_ is ValueCellFull!16488) mapValue!53729)) b!1299166))

(assert (= (and mapNonEmpty!53723 ((_ is ValueCellFull!16488) mapDefault!53729)) b!1299167))

(declare-fun m!1190417 () Bool)

(assert (=> mapNonEmpty!53729 m!1190417))

(declare-fun b_lambda!23147 () Bool)

(assert (= b_lambda!23145 (or (and start!109664 b_free!29133) b_lambda!23147)))

(check-sat (not bm!63563) b_and!47231 (not bm!63543) (not b_next!29133) (not bm!63562) (not b!1299151) (not d!141091) (not b!1299149) (not d!141093) (not b!1299142) (not b!1299082) (not b!1299085) (not b!1299081) (not b!1299141) tp_is_empty!34773 (not b!1299092) (not b!1299058) (not b_lambda!23147) (not bm!63566) (not bm!63546) (not b!1299153) (not b!1299137) (not b!1299152) (not bm!63567) (not b!1299068) (not b!1299094) (not b!1299069) (not mapNonEmpty!53729) (not b!1299157))
(check-sat b_and!47231 (not b_next!29133))
