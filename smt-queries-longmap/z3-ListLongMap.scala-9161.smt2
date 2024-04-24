; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110216 () Bool)

(assert start!110216)

(declare-fun b_free!29239 () Bool)

(declare-fun b_next!29239 () Bool)

(assert (=> start!110216 (= b_free!29239 (not b_next!29239))))

(declare-fun tp!102862 () Bool)

(declare-fun b_and!47393 () Bool)

(assert (=> start!110216 (= tp!102862 b_and!47393)))

(declare-fun b!1304002 () Bool)

(declare-fun e!743894 () Bool)

(declare-fun tp_is_empty!34879 () Bool)

(assert (=> b!1304002 (= e!743894 tp_is_empty!34879)))

(declare-fun b!1304003 () Bool)

(declare-fun e!743897 () Bool)

(assert (=> b!1304003 (= e!743897 tp_is_empty!34879)))

(declare-fun mapIsEmpty!53905 () Bool)

(declare-fun mapRes!53905 () Bool)

(assert (=> mapIsEmpty!53905 mapRes!53905))

(declare-fun b!1304005 () Bool)

(declare-fun e!743895 () Bool)

(declare-fun e!743900 () Bool)

(assert (=> b!1304005 (= e!743895 e!743900)))

(declare-fun res!865799 () Bool)

(assert (=> b!1304005 (=> (not res!865799) (not e!743900))))

(declare-datatypes ((V!51609 0))(
  ( (V!51610 (val!17514 Int)) )
))
(declare-datatypes ((tuple2!22618 0))(
  ( (tuple2!22619 (_1!11320 (_ BitVec 64)) (_2!11320 V!51609)) )
))
(declare-datatypes ((List!29768 0))(
  ( (Nil!29765) (Cons!29764 (h!30982 tuple2!22618) (t!43350 List!29768)) )
))
(declare-datatypes ((ListLongMap!20283 0))(
  ( (ListLongMap!20284 (toList!10157 List!29768)) )
))
(declare-fun lt!583289 () ListLongMap!20283)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8301 (ListLongMap!20283 (_ BitVec 64)) Bool)

(assert (=> b!1304005 (= res!865799 (not (contains!8301 lt!583289 k0!1205)))))

(declare-fun zeroValue!1387 () V!51609)

(declare-fun +!4521 (ListLongMap!20283 tuple2!22618) ListLongMap!20283)

(assert (=> b!1304005 (not (contains!8301 (+!4521 lt!583289 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!43099 0))(
  ( (Unit!43100) )
))
(declare-fun lt!583290 () Unit!43099)

(declare-fun addStillNotContains!472 (ListLongMap!20283 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!43099)

(assert (=> b!1304005 (= lt!583290 (addStillNotContains!472 lt!583289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!51609)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16541 0))(
  ( (ValueCellFull!16541 (v!20123 V!51609)) (EmptyCell!16541) )
))
(declare-datatypes ((array!86809 0))(
  ( (array!86810 (arr!41893 (Array (_ BitVec 32) ValueCell!16541)) (size!42444 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86809)

(declare-datatypes ((array!86811 0))(
  ( (array!86812 (arr!41894 (Array (_ BitVec 32) (_ BitVec 64))) (size!42445 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86811)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6159 (array!86811 array!86809 (_ BitVec 32) (_ BitVec 32) V!51609 V!51609 (_ BitVec 32) Int) ListLongMap!20283)

(assert (=> b!1304005 (= lt!583289 (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304006 () Bool)

(declare-fun res!865796 () Bool)

(declare-fun e!743898 () Bool)

(assert (=> b!1304006 (=> (not res!865796) (not e!743898))))

(assert (=> b!1304006 (= res!865796 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42445 _keys!1741))))))

(declare-fun b!1304007 () Bool)

(declare-fun res!865790 () Bool)

(assert (=> b!1304007 (=> (not res!865790) (not e!743898))))

(declare-fun getCurrentListMap!5169 (array!86811 array!86809 (_ BitVec 32) (_ BitVec 32) V!51609 V!51609 (_ BitVec 32) Int) ListLongMap!20283)

(assert (=> b!1304007 (= res!865790 (contains!8301 (getCurrentListMap!5169 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1304008 () Bool)

(declare-fun res!865792 () Bool)

(assert (=> b!1304008 (=> (not res!865792) (not e!743898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86811 (_ BitVec 32)) Bool)

(assert (=> b!1304008 (= res!865792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304009 () Bool)

(declare-fun res!865794 () Bool)

(assert (=> b!1304009 (=> (not res!865794) (not e!743898))))

(declare-datatypes ((List!29769 0))(
  ( (Nil!29766) (Cons!29765 (h!30983 (_ BitVec 64)) (t!43351 List!29769)) )
))
(declare-fun arrayNoDuplicates!0 (array!86811 (_ BitVec 32) List!29769) Bool)

(assert (=> b!1304009 (= res!865794 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29766))))

(declare-fun b!1304010 () Bool)

(declare-fun e!743899 () Bool)

(assert (=> b!1304010 (= e!743899 (and e!743897 mapRes!53905))))

(declare-fun condMapEmpty!53905 () Bool)

(declare-fun mapDefault!53905 () ValueCell!16541)

(assert (=> b!1304010 (= condMapEmpty!53905 (= (arr!41893 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16541)) mapDefault!53905)))))

(declare-fun b!1304011 () Bool)

(declare-fun res!865793 () Bool)

(assert (=> b!1304011 (=> (not res!865793) (not e!743898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304011 (= res!865793 (not (validKeyInArray!0 (select (arr!41894 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53905 () Bool)

(declare-fun tp!102861 () Bool)

(assert (=> mapNonEmpty!53905 (= mapRes!53905 (and tp!102861 e!743894))))

(declare-fun mapRest!53905 () (Array (_ BitVec 32) ValueCell!16541))

(declare-fun mapValue!53905 () ValueCell!16541)

(declare-fun mapKey!53905 () (_ BitVec 32))

(assert (=> mapNonEmpty!53905 (= (arr!41893 _values!1445) (store mapRest!53905 mapKey!53905 mapValue!53905))))

(declare-fun b!1304012 () Bool)

(assert (=> b!1304012 (= e!743898 (not e!743895))))

(declare-fun res!865797 () Bool)

(assert (=> b!1304012 (=> res!865797 e!743895)))

(assert (=> b!1304012 (= res!865797 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1304012 (not (contains!8301 (ListLongMap!20284 Nil!29765) k0!1205))))

(declare-fun lt!583291 () Unit!43099)

(declare-fun emptyContainsNothing!213 ((_ BitVec 64)) Unit!43099)

(assert (=> b!1304012 (= lt!583291 (emptyContainsNothing!213 k0!1205))))

(declare-fun res!865791 () Bool)

(assert (=> start!110216 (=> (not res!865791) (not e!743898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110216 (= res!865791 (validMask!0 mask!2175))))

(assert (=> start!110216 e!743898))

(assert (=> start!110216 tp_is_empty!34879))

(assert (=> start!110216 true))

(declare-fun array_inv!31935 (array!86809) Bool)

(assert (=> start!110216 (and (array_inv!31935 _values!1445) e!743899)))

(declare-fun array_inv!31936 (array!86811) Bool)

(assert (=> start!110216 (array_inv!31936 _keys!1741)))

(assert (=> start!110216 tp!102862))

(declare-fun b!1304004 () Bool)

(declare-fun res!865798 () Bool)

(assert (=> b!1304004 (=> (not res!865798) (not e!743898))))

(assert (=> b!1304004 (= res!865798 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42445 _keys!1741))))))

(declare-fun b!1304013 () Bool)

(assert (=> b!1304013 (= e!743900 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1304014 () Bool)

(declare-fun res!865795 () Bool)

(assert (=> b!1304014 (=> (not res!865795) (not e!743898))))

(assert (=> b!1304014 (= res!865795 (and (= (size!42444 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42445 _keys!1741) (size!42444 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!110216 res!865791) b!1304014))

(assert (= (and b!1304014 res!865795) b!1304008))

(assert (= (and b!1304008 res!865792) b!1304009))

(assert (= (and b!1304009 res!865794) b!1304004))

(assert (= (and b!1304004 res!865798) b!1304007))

(assert (= (and b!1304007 res!865790) b!1304006))

(assert (= (and b!1304006 res!865796) b!1304011))

(assert (= (and b!1304011 res!865793) b!1304012))

(assert (= (and b!1304012 (not res!865797)) b!1304005))

(assert (= (and b!1304005 res!865799) b!1304013))

(assert (= (and b!1304010 condMapEmpty!53905) mapIsEmpty!53905))

(assert (= (and b!1304010 (not condMapEmpty!53905)) mapNonEmpty!53905))

(get-info :version)

(assert (= (and mapNonEmpty!53905 ((_ is ValueCellFull!16541) mapValue!53905)) b!1304002))

(assert (= (and b!1304010 ((_ is ValueCellFull!16541) mapDefault!53905)) b!1304003))

(assert (= start!110216 b!1304010))

(declare-fun m!1195197 () Bool)

(assert (=> b!1304008 m!1195197))

(declare-fun m!1195199 () Bool)

(assert (=> start!110216 m!1195199))

(declare-fun m!1195201 () Bool)

(assert (=> start!110216 m!1195201))

(declare-fun m!1195203 () Bool)

(assert (=> start!110216 m!1195203))

(declare-fun m!1195205 () Bool)

(assert (=> b!1304009 m!1195205))

(declare-fun m!1195207 () Bool)

(assert (=> b!1304005 m!1195207))

(declare-fun m!1195209 () Bool)

(assert (=> b!1304005 m!1195209))

(assert (=> b!1304005 m!1195207))

(declare-fun m!1195211 () Bool)

(assert (=> b!1304005 m!1195211))

(declare-fun m!1195213 () Bool)

(assert (=> b!1304005 m!1195213))

(declare-fun m!1195215 () Bool)

(assert (=> b!1304005 m!1195215))

(declare-fun m!1195217 () Bool)

(assert (=> b!1304011 m!1195217))

(assert (=> b!1304011 m!1195217))

(declare-fun m!1195219 () Bool)

(assert (=> b!1304011 m!1195219))

(declare-fun m!1195221 () Bool)

(assert (=> b!1304012 m!1195221))

(declare-fun m!1195223 () Bool)

(assert (=> b!1304012 m!1195223))

(declare-fun m!1195225 () Bool)

(assert (=> mapNonEmpty!53905 m!1195225))

(declare-fun m!1195227 () Bool)

(assert (=> b!1304007 m!1195227))

(assert (=> b!1304007 m!1195227))

(declare-fun m!1195229 () Bool)

(assert (=> b!1304007 m!1195229))

(check-sat (not b!1304009) (not b!1304007) (not start!110216) tp_is_empty!34879 b_and!47393 (not b!1304011) (not mapNonEmpty!53905) (not b!1304008) (not b!1304012) (not b!1304005) (not b_next!29239))
(check-sat b_and!47393 (not b_next!29239))
(get-model)

(declare-fun bm!64211 () Bool)

(declare-fun call!64214 () Bool)

(assert (=> bm!64211 (= call!64214 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1304101 () Bool)

(declare-fun e!743950 () Bool)

(assert (=> b!1304101 (= e!743950 call!64214)))

(declare-fun d!142015 () Bool)

(declare-fun res!865864 () Bool)

(declare-fun e!743951 () Bool)

(assert (=> d!142015 (=> res!865864 e!743951)))

(assert (=> d!142015 (= res!865864 (bvsge #b00000000000000000000000000000000 (size!42445 _keys!1741)))))

(assert (=> d!142015 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!743951)))

(declare-fun b!1304102 () Bool)

(declare-fun e!743949 () Bool)

(assert (=> b!1304102 (= e!743949 call!64214)))

(declare-fun b!1304103 () Bool)

(assert (=> b!1304103 (= e!743950 e!743949)))

(declare-fun lt!583318 () (_ BitVec 64))

(assert (=> b!1304103 (= lt!583318 (select (arr!41894 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583317 () Unit!43099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86811 (_ BitVec 64) (_ BitVec 32)) Unit!43099)

(assert (=> b!1304103 (= lt!583317 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583318 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1304103 (arrayContainsKey!0 _keys!1741 lt!583318 #b00000000000000000000000000000000)))

(declare-fun lt!583316 () Unit!43099)

(assert (=> b!1304103 (= lt!583316 lt!583317)))

(declare-fun res!865865 () Bool)

(declare-datatypes ((SeekEntryResult!9979 0))(
  ( (MissingZero!9979 (index!42287 (_ BitVec 32))) (Found!9979 (index!42288 (_ BitVec 32))) (Intermediate!9979 (undefined!10791 Bool) (index!42289 (_ BitVec 32)) (x!115687 (_ BitVec 32))) (Undefined!9979) (MissingVacant!9979 (index!42290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86811 (_ BitVec 32)) SeekEntryResult!9979)

(assert (=> b!1304103 (= res!865865 (= (seekEntryOrOpen!0 (select (arr!41894 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9979 #b00000000000000000000000000000000)))))

(assert (=> b!1304103 (=> (not res!865865) (not e!743949))))

(declare-fun b!1304104 () Bool)

(assert (=> b!1304104 (= e!743951 e!743950)))

(declare-fun c!125420 () Bool)

(assert (=> b!1304104 (= c!125420 (validKeyInArray!0 (select (arr!41894 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142015 (not res!865864)) b!1304104))

(assert (= (and b!1304104 c!125420) b!1304103))

(assert (= (and b!1304104 (not c!125420)) b!1304101))

(assert (= (and b!1304103 res!865865) b!1304102))

(assert (= (or b!1304102 b!1304101) bm!64211))

(declare-fun m!1195299 () Bool)

(assert (=> bm!64211 m!1195299))

(declare-fun m!1195301 () Bool)

(assert (=> b!1304103 m!1195301))

(declare-fun m!1195303 () Bool)

(assert (=> b!1304103 m!1195303))

(declare-fun m!1195305 () Bool)

(assert (=> b!1304103 m!1195305))

(assert (=> b!1304103 m!1195301))

(declare-fun m!1195307 () Bool)

(assert (=> b!1304103 m!1195307))

(assert (=> b!1304104 m!1195301))

(assert (=> b!1304104 m!1195301))

(declare-fun m!1195309 () Bool)

(assert (=> b!1304104 m!1195309))

(assert (=> b!1304008 d!142015))

(declare-fun d!142017 () Bool)

(declare-fun e!743956 () Bool)

(assert (=> d!142017 e!743956))

(declare-fun res!865868 () Bool)

(assert (=> d!142017 (=> res!865868 e!743956)))

(declare-fun lt!583327 () Bool)

(assert (=> d!142017 (= res!865868 (not lt!583327))))

(declare-fun lt!583329 () Bool)

(assert (=> d!142017 (= lt!583327 lt!583329)))

(declare-fun lt!583330 () Unit!43099)

(declare-fun e!743957 () Unit!43099)

(assert (=> d!142017 (= lt!583330 e!743957)))

(declare-fun c!125423 () Bool)

(assert (=> d!142017 (= c!125423 lt!583329)))

(declare-fun containsKey!725 (List!29768 (_ BitVec 64)) Bool)

(assert (=> d!142017 (= lt!583329 (containsKey!725 (toList!10157 (ListLongMap!20284 Nil!29765)) k0!1205))))

(assert (=> d!142017 (= (contains!8301 (ListLongMap!20284 Nil!29765) k0!1205) lt!583327)))

(declare-fun b!1304111 () Bool)

(declare-fun lt!583328 () Unit!43099)

(assert (=> b!1304111 (= e!743957 lt!583328)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!471 (List!29768 (_ BitVec 64)) Unit!43099)

(assert (=> b!1304111 (= lt!583328 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10157 (ListLongMap!20284 Nil!29765)) k0!1205))))

(declare-datatypes ((Option!750 0))(
  ( (Some!749 (v!20126 V!51609)) (None!748) )
))
(declare-fun isDefined!508 (Option!750) Bool)

(declare-fun getValueByKey!699 (List!29768 (_ BitVec 64)) Option!750)

(assert (=> b!1304111 (isDefined!508 (getValueByKey!699 (toList!10157 (ListLongMap!20284 Nil!29765)) k0!1205))))

(declare-fun b!1304112 () Bool)

(declare-fun Unit!43101 () Unit!43099)

(assert (=> b!1304112 (= e!743957 Unit!43101)))

(declare-fun b!1304113 () Bool)

(assert (=> b!1304113 (= e!743956 (isDefined!508 (getValueByKey!699 (toList!10157 (ListLongMap!20284 Nil!29765)) k0!1205)))))

(assert (= (and d!142017 c!125423) b!1304111))

(assert (= (and d!142017 (not c!125423)) b!1304112))

(assert (= (and d!142017 (not res!865868)) b!1304113))

(declare-fun m!1195311 () Bool)

(assert (=> d!142017 m!1195311))

(declare-fun m!1195313 () Bool)

(assert (=> b!1304111 m!1195313))

(declare-fun m!1195315 () Bool)

(assert (=> b!1304111 m!1195315))

(assert (=> b!1304111 m!1195315))

(declare-fun m!1195317 () Bool)

(assert (=> b!1304111 m!1195317))

(assert (=> b!1304113 m!1195315))

(assert (=> b!1304113 m!1195315))

(assert (=> b!1304113 m!1195317))

(assert (=> b!1304012 d!142017))

(declare-fun d!142019 () Bool)

(assert (=> d!142019 (not (contains!8301 (ListLongMap!20284 Nil!29765) k0!1205))))

(declare-fun lt!583333 () Unit!43099)

(declare-fun choose!1920 ((_ BitVec 64)) Unit!43099)

(assert (=> d!142019 (= lt!583333 (choose!1920 k0!1205))))

(assert (=> d!142019 (= (emptyContainsNothing!213 k0!1205) lt!583333)))

(declare-fun bs!37123 () Bool)

(assert (= bs!37123 d!142019))

(assert (=> bs!37123 m!1195221))

(declare-fun m!1195319 () Bool)

(assert (=> bs!37123 m!1195319))

(assert (=> b!1304012 d!142019))

(declare-fun d!142021 () Bool)

(declare-fun e!743958 () Bool)

(assert (=> d!142021 e!743958))

(declare-fun res!865869 () Bool)

(assert (=> d!142021 (=> res!865869 e!743958)))

(declare-fun lt!583334 () Bool)

(assert (=> d!142021 (= res!865869 (not lt!583334))))

(declare-fun lt!583336 () Bool)

(assert (=> d!142021 (= lt!583334 lt!583336)))

(declare-fun lt!583337 () Unit!43099)

(declare-fun e!743959 () Unit!43099)

(assert (=> d!142021 (= lt!583337 e!743959)))

(declare-fun c!125424 () Bool)

(assert (=> d!142021 (= c!125424 lt!583336)))

(assert (=> d!142021 (= lt!583336 (containsKey!725 (toList!10157 (getCurrentListMap!5169 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!142021 (= (contains!8301 (getCurrentListMap!5169 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583334)))

(declare-fun b!1304114 () Bool)

(declare-fun lt!583335 () Unit!43099)

(assert (=> b!1304114 (= e!743959 lt!583335)))

(assert (=> b!1304114 (= lt!583335 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10157 (getCurrentListMap!5169 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304114 (isDefined!508 (getValueByKey!699 (toList!10157 (getCurrentListMap!5169 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304115 () Bool)

(declare-fun Unit!43102 () Unit!43099)

(assert (=> b!1304115 (= e!743959 Unit!43102)))

(declare-fun b!1304116 () Bool)

(assert (=> b!1304116 (= e!743958 (isDefined!508 (getValueByKey!699 (toList!10157 (getCurrentListMap!5169 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!142021 c!125424) b!1304114))

(assert (= (and d!142021 (not c!125424)) b!1304115))

(assert (= (and d!142021 (not res!865869)) b!1304116))

(declare-fun m!1195321 () Bool)

(assert (=> d!142021 m!1195321))

(declare-fun m!1195323 () Bool)

(assert (=> b!1304114 m!1195323))

(declare-fun m!1195325 () Bool)

(assert (=> b!1304114 m!1195325))

(assert (=> b!1304114 m!1195325))

(declare-fun m!1195327 () Bool)

(assert (=> b!1304114 m!1195327))

(assert (=> b!1304116 m!1195325))

(assert (=> b!1304116 m!1195325))

(assert (=> b!1304116 m!1195327))

(assert (=> b!1304007 d!142021))

(declare-fun call!64233 () ListLongMap!20283)

(declare-fun bm!64226 () Bool)

(assert (=> bm!64226 (= call!64233 (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304159 () Bool)

(declare-fun e!743994 () Unit!43099)

(declare-fun lt!583398 () Unit!43099)

(assert (=> b!1304159 (= e!743994 lt!583398)))

(declare-fun lt!583394 () ListLongMap!20283)

(assert (=> b!1304159 (= lt!583394 (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583392 () (_ BitVec 64))

(assert (=> b!1304159 (= lt!583392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583389 () (_ BitVec 64))

(assert (=> b!1304159 (= lt!583389 (select (arr!41894 _keys!1741) from!2144))))

(declare-fun lt!583403 () Unit!43099)

(declare-fun addStillContains!1116 (ListLongMap!20283 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!43099)

(assert (=> b!1304159 (= lt!583403 (addStillContains!1116 lt!583394 lt!583392 zeroValue!1387 lt!583389))))

(assert (=> b!1304159 (contains!8301 (+!4521 lt!583394 (tuple2!22619 lt!583392 zeroValue!1387)) lt!583389)))

(declare-fun lt!583384 () Unit!43099)

(assert (=> b!1304159 (= lt!583384 lt!583403)))

(declare-fun lt!583388 () ListLongMap!20283)

(assert (=> b!1304159 (= lt!583388 (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583385 () (_ BitVec 64))

(assert (=> b!1304159 (= lt!583385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583396 () (_ BitVec 64))

(assert (=> b!1304159 (= lt!583396 (select (arr!41894 _keys!1741) from!2144))))

(declare-fun lt!583387 () Unit!43099)

(declare-fun addApplyDifferent!558 (ListLongMap!20283 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!43099)

(assert (=> b!1304159 (= lt!583387 (addApplyDifferent!558 lt!583388 lt!583385 minValue!1387 lt!583396))))

(declare-fun apply!1029 (ListLongMap!20283 (_ BitVec 64)) V!51609)

(assert (=> b!1304159 (= (apply!1029 (+!4521 lt!583388 (tuple2!22619 lt!583385 minValue!1387)) lt!583396) (apply!1029 lt!583388 lt!583396))))

(declare-fun lt!583395 () Unit!43099)

(assert (=> b!1304159 (= lt!583395 lt!583387)))

(declare-fun lt!583391 () ListLongMap!20283)

(assert (=> b!1304159 (= lt!583391 (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583393 () (_ BitVec 64))

(assert (=> b!1304159 (= lt!583393 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583390 () (_ BitVec 64))

(assert (=> b!1304159 (= lt!583390 (select (arr!41894 _keys!1741) from!2144))))

(declare-fun lt!583397 () Unit!43099)

(assert (=> b!1304159 (= lt!583397 (addApplyDifferent!558 lt!583391 lt!583393 zeroValue!1387 lt!583390))))

(assert (=> b!1304159 (= (apply!1029 (+!4521 lt!583391 (tuple2!22619 lt!583393 zeroValue!1387)) lt!583390) (apply!1029 lt!583391 lt!583390))))

(declare-fun lt!583402 () Unit!43099)

(assert (=> b!1304159 (= lt!583402 lt!583397)))

(declare-fun lt!583399 () ListLongMap!20283)

(assert (=> b!1304159 (= lt!583399 (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583383 () (_ BitVec 64))

(assert (=> b!1304159 (= lt!583383 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583382 () (_ BitVec 64))

(assert (=> b!1304159 (= lt!583382 (select (arr!41894 _keys!1741) from!2144))))

(assert (=> b!1304159 (= lt!583398 (addApplyDifferent!558 lt!583399 lt!583383 minValue!1387 lt!583382))))

(assert (=> b!1304159 (= (apply!1029 (+!4521 lt!583399 (tuple2!22619 lt!583383 minValue!1387)) lt!583382) (apply!1029 lt!583399 lt!583382))))

(declare-fun b!1304160 () Bool)

(declare-fun res!865890 () Bool)

(declare-fun e!743987 () Bool)

(assert (=> b!1304160 (=> (not res!865890) (not e!743987))))

(declare-fun e!743997 () Bool)

(assert (=> b!1304160 (= res!865890 e!743997)))

(declare-fun res!865888 () Bool)

(assert (=> b!1304160 (=> res!865888 e!743997)))

(declare-fun e!743986 () Bool)

(assert (=> b!1304160 (= res!865888 (not e!743986))))

(declare-fun res!865893 () Bool)

(assert (=> b!1304160 (=> (not res!865893) (not e!743986))))

(assert (=> b!1304160 (= res!865893 (bvslt from!2144 (size!42445 _keys!1741)))))

(declare-fun b!1304161 () Bool)

(declare-fun e!743995 () ListLongMap!20283)

(declare-fun e!743998 () ListLongMap!20283)

(assert (=> b!1304161 (= e!743995 e!743998)))

(declare-fun c!125442 () Bool)

(assert (=> b!1304161 (= c!125442 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1304162 () Bool)

(declare-fun e!743988 () Bool)

(declare-fun lt!583401 () ListLongMap!20283)

(assert (=> b!1304162 (= e!743988 (= (apply!1029 lt!583401 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1304163 () Bool)

(declare-fun call!64231 () ListLongMap!20283)

(assert (=> b!1304163 (= e!743995 (+!4521 call!64231 (tuple2!22619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1304164 () Bool)

(declare-fun c!125441 () Bool)

(assert (=> b!1304164 (= c!125441 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!743992 () ListLongMap!20283)

(assert (=> b!1304164 (= e!743998 e!743992)))

(declare-fun bm!64227 () Bool)

(declare-fun call!64234 () Bool)

(assert (=> bm!64227 (= call!64234 (contains!8301 lt!583401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304165 () Bool)

(declare-fun call!64230 () ListLongMap!20283)

(assert (=> b!1304165 (= e!743992 call!64230)))

(declare-fun b!1304166 () Bool)

(declare-fun e!743996 () Bool)

(assert (=> b!1304166 (= e!743997 e!743996)))

(declare-fun res!865896 () Bool)

(assert (=> b!1304166 (=> (not res!865896) (not e!743996))))

(assert (=> b!1304166 (= res!865896 (contains!8301 lt!583401 (select (arr!41894 _keys!1741) from!2144)))))

(assert (=> b!1304166 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42445 _keys!1741)))))

(declare-fun b!1304168 () Bool)

(declare-fun e!743990 () Bool)

(assert (=> b!1304168 (= e!743990 (= (apply!1029 lt!583401 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1304169 () Bool)

(declare-fun e!743989 () Bool)

(assert (=> b!1304169 (= e!743989 (validKeyInArray!0 (select (arr!41894 _keys!1741) from!2144)))))

(declare-fun bm!64228 () Bool)

(assert (=> bm!64228 (= call!64230 call!64231)))

(declare-fun b!1304170 () Bool)

(declare-fun res!865895 () Bool)

(assert (=> b!1304170 (=> (not res!865895) (not e!743987))))

(declare-fun e!743993 () Bool)

(assert (=> b!1304170 (= res!865895 e!743993)))

(declare-fun c!125438 () Bool)

(assert (=> b!1304170 (= c!125438 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64229 () Bool)

(declare-fun call!64235 () ListLongMap!20283)

(declare-fun call!64229 () ListLongMap!20283)

(assert (=> bm!64229 (= call!64235 call!64229)))

(declare-fun b!1304171 () Bool)

(declare-fun get!21205 (ValueCell!16541 V!51609) V!51609)

(declare-fun dynLambda!3490 (Int (_ BitVec 64)) V!51609)

(assert (=> b!1304171 (= e!743996 (= (apply!1029 lt!583401 (select (arr!41894 _keys!1741) from!2144)) (get!21205 (select (arr!41893 _values!1445) from!2144) (dynLambda!3490 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304171 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42444 _values!1445)))))

(assert (=> b!1304171 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42445 _keys!1741)))))

(declare-fun bm!64230 () Bool)

(declare-fun call!64232 () Bool)

(assert (=> bm!64230 (= call!64232 (contains!8301 lt!583401 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64231 () Bool)

(assert (=> bm!64231 (= call!64229 call!64233)))

(declare-fun b!1304172 () Bool)

(declare-fun e!743991 () Bool)

(assert (=> b!1304172 (= e!743991 (not call!64232))))

(declare-fun bm!64232 () Bool)

(declare-fun c!125437 () Bool)

(assert (=> bm!64232 (= call!64231 (+!4521 (ite c!125437 call!64233 (ite c!125442 call!64229 call!64235)) (ite (or c!125437 c!125442) (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22619 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1304173 () Bool)

(declare-fun Unit!43103 () Unit!43099)

(assert (=> b!1304173 (= e!743994 Unit!43103)))

(declare-fun b!1304174 () Bool)

(assert (=> b!1304174 (= e!743991 e!743988)))

(declare-fun res!865892 () Bool)

(assert (=> b!1304174 (= res!865892 call!64232)))

(assert (=> b!1304174 (=> (not res!865892) (not e!743988))))

(declare-fun b!1304175 () Bool)

(assert (=> b!1304175 (= e!743998 call!64230)))

(declare-fun b!1304176 () Bool)

(assert (=> b!1304176 (= e!743993 (not call!64234))))

(declare-fun b!1304177 () Bool)

(assert (=> b!1304177 (= e!743993 e!743990)))

(declare-fun res!865891 () Bool)

(assert (=> b!1304177 (= res!865891 call!64234)))

(assert (=> b!1304177 (=> (not res!865891) (not e!743990))))

(declare-fun b!1304167 () Bool)

(assert (=> b!1304167 (= e!743992 call!64235)))

(declare-fun d!142023 () Bool)

(assert (=> d!142023 e!743987))

(declare-fun res!865894 () Bool)

(assert (=> d!142023 (=> (not res!865894) (not e!743987))))

(assert (=> d!142023 (= res!865894 (or (bvsge from!2144 (size!42445 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42445 _keys!1741)))))))

(declare-fun lt!583386 () ListLongMap!20283)

(assert (=> d!142023 (= lt!583401 lt!583386)))

(declare-fun lt!583400 () Unit!43099)

(assert (=> d!142023 (= lt!583400 e!743994)))

(declare-fun c!125440 () Bool)

(assert (=> d!142023 (= c!125440 e!743989)))

(declare-fun res!865889 () Bool)

(assert (=> d!142023 (=> (not res!865889) (not e!743989))))

(assert (=> d!142023 (= res!865889 (bvslt from!2144 (size!42445 _keys!1741)))))

(assert (=> d!142023 (= lt!583386 e!743995)))

(assert (=> d!142023 (= c!125437 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142023 (validMask!0 mask!2175)))

(assert (=> d!142023 (= (getCurrentListMap!5169 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583401)))

(declare-fun b!1304178 () Bool)

(assert (=> b!1304178 (= e!743987 e!743991)))

(declare-fun c!125439 () Bool)

(assert (=> b!1304178 (= c!125439 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1304179 () Bool)

(assert (=> b!1304179 (= e!743986 (validKeyInArray!0 (select (arr!41894 _keys!1741) from!2144)))))

(assert (= (and d!142023 c!125437) b!1304163))

(assert (= (and d!142023 (not c!125437)) b!1304161))

(assert (= (and b!1304161 c!125442) b!1304175))

(assert (= (and b!1304161 (not c!125442)) b!1304164))

(assert (= (and b!1304164 c!125441) b!1304165))

(assert (= (and b!1304164 (not c!125441)) b!1304167))

(assert (= (or b!1304165 b!1304167) bm!64229))

(assert (= (or b!1304175 bm!64229) bm!64231))

(assert (= (or b!1304175 b!1304165) bm!64228))

(assert (= (or b!1304163 bm!64231) bm!64226))

(assert (= (or b!1304163 bm!64228) bm!64232))

(assert (= (and d!142023 res!865889) b!1304169))

(assert (= (and d!142023 c!125440) b!1304159))

(assert (= (and d!142023 (not c!125440)) b!1304173))

(assert (= (and d!142023 res!865894) b!1304160))

(assert (= (and b!1304160 res!865893) b!1304179))

(assert (= (and b!1304160 (not res!865888)) b!1304166))

(assert (= (and b!1304166 res!865896) b!1304171))

(assert (= (and b!1304160 res!865890) b!1304170))

(assert (= (and b!1304170 c!125438) b!1304177))

(assert (= (and b!1304170 (not c!125438)) b!1304176))

(assert (= (and b!1304177 res!865891) b!1304168))

(assert (= (or b!1304177 b!1304176) bm!64227))

(assert (= (and b!1304170 res!865895) b!1304178))

(assert (= (and b!1304178 c!125439) b!1304174))

(assert (= (and b!1304178 (not c!125439)) b!1304172))

(assert (= (and b!1304174 res!865892) b!1304162))

(assert (= (or b!1304174 b!1304172) bm!64230))

(declare-fun b_lambda!23245 () Bool)

(assert (=> (not b_lambda!23245) (not b!1304171)))

(declare-fun t!43354 () Bool)

(declare-fun tb!11387 () Bool)

(assert (=> (and start!110216 (= defaultEntry!1448 defaultEntry!1448) t!43354) tb!11387))

(declare-fun result!23799 () Bool)

(assert (=> tb!11387 (= result!23799 tp_is_empty!34879)))

(assert (=> b!1304171 t!43354))

(declare-fun b_and!47399 () Bool)

(assert (= b_and!47393 (and (=> t!43354 result!23799) b_and!47399)))

(declare-fun m!1195329 () Bool)

(assert (=> b!1304159 m!1195329))

(declare-fun m!1195331 () Bool)

(assert (=> b!1304159 m!1195331))

(declare-fun m!1195333 () Bool)

(assert (=> b!1304159 m!1195333))

(declare-fun m!1195335 () Bool)

(assert (=> b!1304159 m!1195335))

(declare-fun m!1195337 () Bool)

(assert (=> b!1304159 m!1195337))

(declare-fun m!1195339 () Bool)

(assert (=> b!1304159 m!1195339))

(declare-fun m!1195341 () Bool)

(assert (=> b!1304159 m!1195341))

(declare-fun m!1195343 () Bool)

(assert (=> b!1304159 m!1195343))

(declare-fun m!1195345 () Bool)

(assert (=> b!1304159 m!1195345))

(assert (=> b!1304159 m!1195217))

(declare-fun m!1195347 () Bool)

(assert (=> b!1304159 m!1195347))

(declare-fun m!1195349 () Bool)

(assert (=> b!1304159 m!1195349))

(declare-fun m!1195351 () Bool)

(assert (=> b!1304159 m!1195351))

(assert (=> b!1304159 m!1195335))

(declare-fun m!1195353 () Bool)

(assert (=> b!1304159 m!1195353))

(declare-fun m!1195355 () Bool)

(assert (=> b!1304159 m!1195355))

(assert (=> b!1304159 m!1195349))

(assert (=> b!1304159 m!1195343))

(declare-fun m!1195357 () Bool)

(assert (=> b!1304159 m!1195357))

(assert (=> b!1304159 m!1195215))

(assert (=> b!1304159 m!1195339))

(declare-fun m!1195359 () Bool)

(assert (=> bm!64227 m!1195359))

(assert (=> b!1304169 m!1195217))

(assert (=> b!1304169 m!1195217))

(assert (=> b!1304169 m!1195219))

(declare-fun m!1195361 () Bool)

(assert (=> b!1304168 m!1195361))

(declare-fun m!1195363 () Bool)

(assert (=> bm!64230 m!1195363))

(declare-fun m!1195365 () Bool)

(assert (=> b!1304171 m!1195365))

(declare-fun m!1195367 () Bool)

(assert (=> b!1304171 m!1195367))

(declare-fun m!1195369 () Bool)

(assert (=> b!1304171 m!1195369))

(assert (=> b!1304171 m!1195217))

(declare-fun m!1195371 () Bool)

(assert (=> b!1304171 m!1195371))

(assert (=> b!1304171 m!1195217))

(assert (=> b!1304171 m!1195367))

(assert (=> b!1304171 m!1195365))

(assert (=> bm!64226 m!1195215))

(assert (=> b!1304166 m!1195217))

(assert (=> b!1304166 m!1195217))

(declare-fun m!1195373 () Bool)

(assert (=> b!1304166 m!1195373))

(assert (=> d!142023 m!1195199))

(declare-fun m!1195375 () Bool)

(assert (=> b!1304163 m!1195375))

(assert (=> b!1304179 m!1195217))

(assert (=> b!1304179 m!1195217))

(assert (=> b!1304179 m!1195219))

(declare-fun m!1195377 () Bool)

(assert (=> bm!64232 m!1195377))

(declare-fun m!1195379 () Bool)

(assert (=> b!1304162 m!1195379))

(assert (=> b!1304007 d!142023))

(declare-fun d!142025 () Bool)

(assert (=> d!142025 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110216 d!142025))

(declare-fun d!142027 () Bool)

(assert (=> d!142027 (= (array_inv!31935 _values!1445) (bvsge (size!42444 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110216 d!142027))

(declare-fun d!142029 () Bool)

(assert (=> d!142029 (= (array_inv!31936 _keys!1741) (bvsge (size!42445 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110216 d!142029))

(declare-fun d!142031 () Bool)

(assert (=> d!142031 (= (validKeyInArray!0 (select (arr!41894 _keys!1741) from!2144)) (and (not (= (select (arr!41894 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41894 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304011 d!142031))

(declare-fun d!142033 () Bool)

(declare-fun e!744001 () Bool)

(assert (=> d!142033 e!744001))

(declare-fun res!865902 () Bool)

(assert (=> d!142033 (=> (not res!865902) (not e!744001))))

(declare-fun lt!583413 () ListLongMap!20283)

(assert (=> d!142033 (= res!865902 (contains!8301 lt!583413 (_1!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!583415 () List!29768)

(assert (=> d!142033 (= lt!583413 (ListLongMap!20284 lt!583415))))

(declare-fun lt!583412 () Unit!43099)

(declare-fun lt!583414 () Unit!43099)

(assert (=> d!142033 (= lt!583412 lt!583414)))

(assert (=> d!142033 (= (getValueByKey!699 lt!583415 (_1!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!749 (_2!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!350 (List!29768 (_ BitVec 64) V!51609) Unit!43099)

(assert (=> d!142033 (= lt!583414 (lemmaContainsTupThenGetReturnValue!350 lt!583415 (_1!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!479 (List!29768 (_ BitVec 64) V!51609) List!29768)

(assert (=> d!142033 (= lt!583415 (insertStrictlySorted!479 (toList!10157 lt!583289) (_1!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!142033 (= (+!4521 lt!583289 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!583413)))

(declare-fun b!1304186 () Bool)

(declare-fun res!865901 () Bool)

(assert (=> b!1304186 (=> (not res!865901) (not e!744001))))

(assert (=> b!1304186 (= res!865901 (= (getValueByKey!699 (toList!10157 lt!583413) (_1!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!749 (_2!11320 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1304187 () Bool)

(declare-fun contains!8303 (List!29768 tuple2!22618) Bool)

(assert (=> b!1304187 (= e!744001 (contains!8303 (toList!10157 lt!583413) (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!142033 res!865902) b!1304186))

(assert (= (and b!1304186 res!865901) b!1304187))

(declare-fun m!1195381 () Bool)

(assert (=> d!142033 m!1195381))

(declare-fun m!1195383 () Bool)

(assert (=> d!142033 m!1195383))

(declare-fun m!1195385 () Bool)

(assert (=> d!142033 m!1195385))

(declare-fun m!1195387 () Bool)

(assert (=> d!142033 m!1195387))

(declare-fun m!1195389 () Bool)

(assert (=> b!1304186 m!1195389))

(declare-fun m!1195391 () Bool)

(assert (=> b!1304187 m!1195391))

(assert (=> b!1304005 d!142033))

(declare-fun d!142035 () Bool)

(declare-fun e!744002 () Bool)

(assert (=> d!142035 e!744002))

(declare-fun res!865903 () Bool)

(assert (=> d!142035 (=> res!865903 e!744002)))

(declare-fun lt!583416 () Bool)

(assert (=> d!142035 (= res!865903 (not lt!583416))))

(declare-fun lt!583418 () Bool)

(assert (=> d!142035 (= lt!583416 lt!583418)))

(declare-fun lt!583419 () Unit!43099)

(declare-fun e!744003 () Unit!43099)

(assert (=> d!142035 (= lt!583419 e!744003)))

(declare-fun c!125443 () Bool)

(assert (=> d!142035 (= c!125443 lt!583418)))

(assert (=> d!142035 (= lt!583418 (containsKey!725 (toList!10157 lt!583289) k0!1205))))

(assert (=> d!142035 (= (contains!8301 lt!583289 k0!1205) lt!583416)))

(declare-fun b!1304188 () Bool)

(declare-fun lt!583417 () Unit!43099)

(assert (=> b!1304188 (= e!744003 lt!583417)))

(assert (=> b!1304188 (= lt!583417 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10157 lt!583289) k0!1205))))

(assert (=> b!1304188 (isDefined!508 (getValueByKey!699 (toList!10157 lt!583289) k0!1205))))

(declare-fun b!1304189 () Bool)

(declare-fun Unit!43104 () Unit!43099)

(assert (=> b!1304189 (= e!744003 Unit!43104)))

(declare-fun b!1304190 () Bool)

(assert (=> b!1304190 (= e!744002 (isDefined!508 (getValueByKey!699 (toList!10157 lt!583289) k0!1205)))))

(assert (= (and d!142035 c!125443) b!1304188))

(assert (= (and d!142035 (not c!125443)) b!1304189))

(assert (= (and d!142035 (not res!865903)) b!1304190))

(declare-fun m!1195393 () Bool)

(assert (=> d!142035 m!1195393))

(declare-fun m!1195395 () Bool)

(assert (=> b!1304188 m!1195395))

(declare-fun m!1195397 () Bool)

(assert (=> b!1304188 m!1195397))

(assert (=> b!1304188 m!1195397))

(declare-fun m!1195399 () Bool)

(assert (=> b!1304188 m!1195399))

(assert (=> b!1304190 m!1195397))

(assert (=> b!1304190 m!1195397))

(assert (=> b!1304190 m!1195399))

(assert (=> b!1304005 d!142035))

(declare-fun d!142037 () Bool)

(declare-fun e!744004 () Bool)

(assert (=> d!142037 e!744004))

(declare-fun res!865904 () Bool)

(assert (=> d!142037 (=> res!865904 e!744004)))

(declare-fun lt!583420 () Bool)

(assert (=> d!142037 (= res!865904 (not lt!583420))))

(declare-fun lt!583422 () Bool)

(assert (=> d!142037 (= lt!583420 lt!583422)))

(declare-fun lt!583423 () Unit!43099)

(declare-fun e!744005 () Unit!43099)

(assert (=> d!142037 (= lt!583423 e!744005)))

(declare-fun c!125444 () Bool)

(assert (=> d!142037 (= c!125444 lt!583422)))

(assert (=> d!142037 (= lt!583422 (containsKey!725 (toList!10157 (+!4521 lt!583289 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!142037 (= (contains!8301 (+!4521 lt!583289 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!583420)))

(declare-fun b!1304191 () Bool)

(declare-fun lt!583421 () Unit!43099)

(assert (=> b!1304191 (= e!744005 lt!583421)))

(assert (=> b!1304191 (= lt!583421 (lemmaContainsKeyImpliesGetValueByKeyDefined!471 (toList!10157 (+!4521 lt!583289 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1304191 (isDefined!508 (getValueByKey!699 (toList!10157 (+!4521 lt!583289 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1304192 () Bool)

(declare-fun Unit!43105 () Unit!43099)

(assert (=> b!1304192 (= e!744005 Unit!43105)))

(declare-fun b!1304193 () Bool)

(assert (=> b!1304193 (= e!744004 (isDefined!508 (getValueByKey!699 (toList!10157 (+!4521 lt!583289 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!142037 c!125444) b!1304191))

(assert (= (and d!142037 (not c!125444)) b!1304192))

(assert (= (and d!142037 (not res!865904)) b!1304193))

(declare-fun m!1195401 () Bool)

(assert (=> d!142037 m!1195401))

(declare-fun m!1195403 () Bool)

(assert (=> b!1304191 m!1195403))

(declare-fun m!1195405 () Bool)

(assert (=> b!1304191 m!1195405))

(assert (=> b!1304191 m!1195405))

(declare-fun m!1195407 () Bool)

(assert (=> b!1304191 m!1195407))

(assert (=> b!1304193 m!1195405))

(assert (=> b!1304193 m!1195405))

(assert (=> b!1304193 m!1195407))

(assert (=> b!1304005 d!142037))

(declare-fun d!142039 () Bool)

(assert (=> d!142039 (not (contains!8301 (+!4521 lt!583289 (tuple2!22619 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!583426 () Unit!43099)

(declare-fun choose!1921 (ListLongMap!20283 (_ BitVec 64) V!51609 (_ BitVec 64)) Unit!43099)

(assert (=> d!142039 (= lt!583426 (choose!1921 lt!583289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun e!744008 () Bool)

(assert (=> d!142039 e!744008))

(declare-fun res!865907 () Bool)

(assert (=> d!142039 (=> (not res!865907) (not e!744008))))

(assert (=> d!142039 (= res!865907 (not (contains!8301 lt!583289 k0!1205)))))

(assert (=> d!142039 (= (addStillNotContains!472 lt!583289 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205) lt!583426)))

(declare-fun b!1304197 () Bool)

(assert (=> b!1304197 (= e!744008 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!142039 res!865907) b!1304197))

(assert (=> d!142039 m!1195207))

(assert (=> d!142039 m!1195207))

(assert (=> d!142039 m!1195211))

(declare-fun m!1195409 () Bool)

(assert (=> d!142039 m!1195409))

(assert (=> d!142039 m!1195213))

(assert (=> b!1304005 d!142039))

(declare-fun b!1304222 () Bool)

(declare-fun res!865916 () Bool)

(declare-fun e!744027 () Bool)

(assert (=> b!1304222 (=> (not res!865916) (not e!744027))))

(declare-fun lt!583445 () ListLongMap!20283)

(assert (=> b!1304222 (= res!865916 (not (contains!8301 lt!583445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304223 () Bool)

(declare-fun lt!583441 () Unit!43099)

(declare-fun lt!583442 () Unit!43099)

(assert (=> b!1304223 (= lt!583441 lt!583442)))

(declare-fun lt!583443 () ListLongMap!20283)

(declare-fun lt!583447 () (_ BitVec 64))

(declare-fun lt!583446 () (_ BitVec 64))

(declare-fun lt!583444 () V!51609)

(assert (=> b!1304223 (not (contains!8301 (+!4521 lt!583443 (tuple2!22619 lt!583446 lt!583444)) lt!583447))))

(assert (=> b!1304223 (= lt!583442 (addStillNotContains!472 lt!583443 lt!583446 lt!583444 lt!583447))))

(assert (=> b!1304223 (= lt!583447 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1304223 (= lt!583444 (get!21205 (select (arr!41893 _values!1445) from!2144) (dynLambda!3490 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304223 (= lt!583446 (select (arr!41894 _keys!1741) from!2144))))

(declare-fun call!64238 () ListLongMap!20283)

(assert (=> b!1304223 (= lt!583443 call!64238)))

(declare-fun e!744028 () ListLongMap!20283)

(assert (=> b!1304223 (= e!744028 (+!4521 call!64238 (tuple2!22619 (select (arr!41894 _keys!1741) from!2144) (get!21205 (select (arr!41893 _values!1445) from!2144) (dynLambda!3490 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1304224 () Bool)

(declare-fun e!744024 () Bool)

(declare-fun isEmpty!1064 (ListLongMap!20283) Bool)

(assert (=> b!1304224 (= e!744024 (isEmpty!1064 lt!583445))))

(declare-fun b!1304226 () Bool)

(declare-fun e!744029 () Bool)

(assert (=> b!1304226 (= e!744029 (validKeyInArray!0 (select (arr!41894 _keys!1741) from!2144)))))

(assert (=> b!1304226 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1304227 () Bool)

(assert (=> b!1304227 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42445 _keys!1741)))))

(assert (=> b!1304227 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42444 _values!1445)))))

(declare-fun e!744026 () Bool)

(assert (=> b!1304227 (= e!744026 (= (apply!1029 lt!583445 (select (arr!41894 _keys!1741) from!2144)) (get!21205 (select (arr!41893 _values!1445) from!2144) (dynLambda!3490 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1304228 () Bool)

(declare-fun e!744025 () Bool)

(assert (=> b!1304228 (= e!744025 e!744026)))

(assert (=> b!1304228 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42445 _keys!1741)))))

(declare-fun res!865917 () Bool)

(assert (=> b!1304228 (= res!865917 (contains!8301 lt!583445 (select (arr!41894 _keys!1741) from!2144)))))

(assert (=> b!1304228 (=> (not res!865917) (not e!744026))))

(declare-fun b!1304229 () Bool)

(assert (=> b!1304229 (= e!744024 (= lt!583445 (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304230 () Bool)

(assert (=> b!1304230 (= e!744027 e!744025)))

(declare-fun c!125454 () Bool)

(assert (=> b!1304230 (= c!125454 e!744029)))

(declare-fun res!865918 () Bool)

(assert (=> b!1304230 (=> (not res!865918) (not e!744029))))

(assert (=> b!1304230 (= res!865918 (bvslt from!2144 (size!42445 _keys!1741)))))

(declare-fun bm!64235 () Bool)

(assert (=> bm!64235 (= call!64238 (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1304231 () Bool)

(declare-fun e!744023 () ListLongMap!20283)

(assert (=> b!1304231 (= e!744023 e!744028)))

(declare-fun c!125455 () Bool)

(assert (=> b!1304231 (= c!125455 (validKeyInArray!0 (select (arr!41894 _keys!1741) from!2144)))))

(declare-fun b!1304225 () Bool)

(assert (=> b!1304225 (= e!744023 (ListLongMap!20284 Nil!29765))))

(declare-fun d!142041 () Bool)

(assert (=> d!142041 e!744027))

(declare-fun res!865919 () Bool)

(assert (=> d!142041 (=> (not res!865919) (not e!744027))))

(assert (=> d!142041 (= res!865919 (not (contains!8301 lt!583445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!142041 (= lt!583445 e!744023)))

(declare-fun c!125456 () Bool)

(assert (=> d!142041 (= c!125456 (bvsge from!2144 (size!42445 _keys!1741)))))

(assert (=> d!142041 (validMask!0 mask!2175)))

(assert (=> d!142041 (= (getCurrentListMapNoExtraKeys!6159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583445)))

(declare-fun b!1304232 () Bool)

(assert (=> b!1304232 (= e!744028 call!64238)))

(declare-fun b!1304233 () Bool)

(assert (=> b!1304233 (= e!744025 e!744024)))

(declare-fun c!125453 () Bool)

(assert (=> b!1304233 (= c!125453 (bvslt from!2144 (size!42445 _keys!1741)))))

(assert (= (and d!142041 c!125456) b!1304225))

(assert (= (and d!142041 (not c!125456)) b!1304231))

(assert (= (and b!1304231 c!125455) b!1304223))

(assert (= (and b!1304231 (not c!125455)) b!1304232))

(assert (= (or b!1304223 b!1304232) bm!64235))

(assert (= (and d!142041 res!865919) b!1304222))

(assert (= (and b!1304222 res!865916) b!1304230))

(assert (= (and b!1304230 res!865918) b!1304226))

(assert (= (and b!1304230 c!125454) b!1304228))

(assert (= (and b!1304230 (not c!125454)) b!1304233))

(assert (= (and b!1304228 res!865917) b!1304227))

(assert (= (and b!1304233 c!125453) b!1304229))

(assert (= (and b!1304233 (not c!125453)) b!1304224))

(declare-fun b_lambda!23247 () Bool)

(assert (=> (not b_lambda!23247) (not b!1304223)))

(assert (=> b!1304223 t!43354))

(declare-fun b_and!47401 () Bool)

(assert (= b_and!47399 (and (=> t!43354 result!23799) b_and!47401)))

(declare-fun b_lambda!23249 () Bool)

(assert (=> (not b_lambda!23249) (not b!1304227)))

(assert (=> b!1304227 t!43354))

(declare-fun b_and!47403 () Bool)

(assert (= b_and!47401 (and (=> t!43354 result!23799) b_and!47403)))

(assert (=> b!1304228 m!1195217))

(assert (=> b!1304228 m!1195217))

(declare-fun m!1195411 () Bool)

(assert (=> b!1304228 m!1195411))

(declare-fun m!1195413 () Bool)

(assert (=> bm!64235 m!1195413))

(assert (=> b!1304229 m!1195413))

(declare-fun m!1195415 () Bool)

(assert (=> b!1304222 m!1195415))

(assert (=> b!1304227 m!1195217))

(assert (=> b!1304227 m!1195365))

(assert (=> b!1304227 m!1195367))

(assert (=> b!1304227 m!1195365))

(assert (=> b!1304227 m!1195367))

(assert (=> b!1304227 m!1195369))

(assert (=> b!1304227 m!1195217))

(declare-fun m!1195417 () Bool)

(assert (=> b!1304227 m!1195417))

(declare-fun m!1195419 () Bool)

(assert (=> b!1304224 m!1195419))

(assert (=> b!1304226 m!1195217))

(assert (=> b!1304226 m!1195217))

(assert (=> b!1304226 m!1195219))

(declare-fun m!1195421 () Bool)

(assert (=> d!142041 m!1195421))

(assert (=> d!142041 m!1195199))

(assert (=> b!1304223 m!1195217))

(declare-fun m!1195423 () Bool)

(assert (=> b!1304223 m!1195423))

(declare-fun m!1195425 () Bool)

(assert (=> b!1304223 m!1195425))

(assert (=> b!1304223 m!1195367))

(declare-fun m!1195427 () Bool)

(assert (=> b!1304223 m!1195427))

(assert (=> b!1304223 m!1195365))

(assert (=> b!1304223 m!1195365))

(assert (=> b!1304223 m!1195367))

(assert (=> b!1304223 m!1195369))

(assert (=> b!1304223 m!1195425))

(declare-fun m!1195429 () Bool)

(assert (=> b!1304223 m!1195429))

(assert (=> b!1304231 m!1195217))

(assert (=> b!1304231 m!1195217))

(assert (=> b!1304231 m!1195219))

(assert (=> b!1304005 d!142041))

(declare-fun bm!64238 () Bool)

(declare-fun call!64241 () Bool)

(declare-fun c!125459 () Bool)

(assert (=> bm!64238 (= call!64241 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125459 (Cons!29765 (select (arr!41894 _keys!1741) #b00000000000000000000000000000000) Nil!29766) Nil!29766)))))

(declare-fun b!1304244 () Bool)

(declare-fun e!744040 () Bool)

(declare-fun e!744039 () Bool)

(assert (=> b!1304244 (= e!744040 e!744039)))

(declare-fun res!865926 () Bool)

(assert (=> b!1304244 (=> (not res!865926) (not e!744039))))

(declare-fun e!744041 () Bool)

(assert (=> b!1304244 (= res!865926 (not e!744041))))

(declare-fun res!865928 () Bool)

(assert (=> b!1304244 (=> (not res!865928) (not e!744041))))

(assert (=> b!1304244 (= res!865928 (validKeyInArray!0 (select (arr!41894 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304245 () Bool)

(declare-fun e!744038 () Bool)

(assert (=> b!1304245 (= e!744038 call!64241)))

(declare-fun b!1304246 () Bool)

(assert (=> b!1304246 (= e!744038 call!64241)))

(declare-fun b!1304247 () Bool)

(assert (=> b!1304247 (= e!744039 e!744038)))

(assert (=> b!1304247 (= c!125459 (validKeyInArray!0 (select (arr!41894 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!142043 () Bool)

(declare-fun res!865927 () Bool)

(assert (=> d!142043 (=> res!865927 e!744040)))

(assert (=> d!142043 (= res!865927 (bvsge #b00000000000000000000000000000000 (size!42445 _keys!1741)))))

(assert (=> d!142043 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29766) e!744040)))

(declare-fun b!1304248 () Bool)

(declare-fun contains!8304 (List!29769 (_ BitVec 64)) Bool)

(assert (=> b!1304248 (= e!744041 (contains!8304 Nil!29766 (select (arr!41894 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!142043 (not res!865927)) b!1304244))

(assert (= (and b!1304244 res!865928) b!1304248))

(assert (= (and b!1304244 res!865926) b!1304247))

(assert (= (and b!1304247 c!125459) b!1304245))

(assert (= (and b!1304247 (not c!125459)) b!1304246))

(assert (= (or b!1304245 b!1304246) bm!64238))

(assert (=> bm!64238 m!1195301))

(declare-fun m!1195431 () Bool)

(assert (=> bm!64238 m!1195431))

(assert (=> b!1304244 m!1195301))

(assert (=> b!1304244 m!1195301))

(assert (=> b!1304244 m!1195309))

(assert (=> b!1304247 m!1195301))

(assert (=> b!1304247 m!1195301))

(assert (=> b!1304247 m!1195309))

(assert (=> b!1304248 m!1195301))

(assert (=> b!1304248 m!1195301))

(declare-fun m!1195433 () Bool)

(assert (=> b!1304248 m!1195433))

(assert (=> b!1304009 d!142043))

(declare-fun mapIsEmpty!53914 () Bool)

(declare-fun mapRes!53914 () Bool)

(assert (=> mapIsEmpty!53914 mapRes!53914))

(declare-fun condMapEmpty!53914 () Bool)

(declare-fun mapDefault!53914 () ValueCell!16541)

(assert (=> mapNonEmpty!53905 (= condMapEmpty!53914 (= mapRest!53905 ((as const (Array (_ BitVec 32) ValueCell!16541)) mapDefault!53914)))))

(declare-fun e!744046 () Bool)

(assert (=> mapNonEmpty!53905 (= tp!102861 (and e!744046 mapRes!53914))))

(declare-fun b!1304255 () Bool)

(declare-fun e!744047 () Bool)

(assert (=> b!1304255 (= e!744047 tp_is_empty!34879)))

(declare-fun b!1304256 () Bool)

(assert (=> b!1304256 (= e!744046 tp_is_empty!34879)))

(declare-fun mapNonEmpty!53914 () Bool)

(declare-fun tp!102877 () Bool)

(assert (=> mapNonEmpty!53914 (= mapRes!53914 (and tp!102877 e!744047))))

(declare-fun mapKey!53914 () (_ BitVec 32))

(declare-fun mapRest!53914 () (Array (_ BitVec 32) ValueCell!16541))

(declare-fun mapValue!53914 () ValueCell!16541)

(assert (=> mapNonEmpty!53914 (= mapRest!53905 (store mapRest!53914 mapKey!53914 mapValue!53914))))

(assert (= (and mapNonEmpty!53905 condMapEmpty!53914) mapIsEmpty!53914))

(assert (= (and mapNonEmpty!53905 (not condMapEmpty!53914)) mapNonEmpty!53914))

(assert (= (and mapNonEmpty!53914 ((_ is ValueCellFull!16541) mapValue!53914)) b!1304255))

(assert (= (and mapNonEmpty!53905 ((_ is ValueCellFull!16541) mapDefault!53914)) b!1304256))

(declare-fun m!1195435 () Bool)

(assert (=> mapNonEmpty!53914 m!1195435))

(declare-fun b_lambda!23251 () Bool)

(assert (= b_lambda!23245 (or (and start!110216 b_free!29239) b_lambda!23251)))

(declare-fun b_lambda!23253 () Bool)

(assert (= b_lambda!23247 (or (and start!110216 b_free!29239) b_lambda!23253)))

(declare-fun b_lambda!23255 () Bool)

(assert (= b_lambda!23249 (or (and start!110216 b_free!29239) b_lambda!23255)))

(check-sat (not d!142041) tp_is_empty!34879 (not d!142033) (not b!1304104) (not d!142023) (not b!1304244) (not b!1304231) (not b!1304224) (not bm!64232) (not b!1304111) (not b!1304162) (not b!1304114) (not b_lambda!23251) (not b_lambda!23253) (not b!1304116) (not bm!64211) (not bm!64227) (not b_lambda!23255) (not b!1304193) (not b!1304222) (not b!1304190) (not b!1304247) (not b!1304227) (not b!1304188) (not b_next!29239) (not bm!64235) (not b!1304248) (not b!1304179) (not b!1304113) (not bm!64226) (not b!1304228) (not b!1304226) (not bm!64230) (not b!1304187) (not b!1304159) b_and!47403 (not d!142017) (not b!1304169) (not d!142039) (not b!1304163) (not b!1304223) (not b!1304229) (not bm!64238) (not b!1304171) (not d!142019) (not d!142037) (not b!1304166) (not mapNonEmpty!53914) (not b!1304191) (not d!142021) (not b!1304186) (not b!1304103) (not d!142035) (not b!1304168))
(check-sat b_and!47403 (not b_next!29239))
