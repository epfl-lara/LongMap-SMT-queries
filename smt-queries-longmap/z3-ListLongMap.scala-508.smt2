; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12144 () Bool)

(assert start!12144)

(declare-fun b!102298 () Bool)

(declare-fun b_free!2485 () Bool)

(declare-fun b_next!2485 () Bool)

(assert (=> b!102298 (= b_free!2485 (not b_next!2485))))

(declare-fun tp!9766 () Bool)

(declare-fun b_and!6293 () Bool)

(assert (=> b!102298 (= tp!9766 b_and!6293)))

(declare-fun b!102294 () Bool)

(declare-fun b_free!2487 () Bool)

(declare-fun b_next!2487 () Bool)

(assert (=> b!102294 (= b_free!2487 (not b_next!2487))))

(declare-fun tp!9768 () Bool)

(declare-fun b_and!6295 () Bool)

(assert (=> b!102294 (= tp!9768 b_and!6295)))

(declare-fun res!51190 () Bool)

(declare-fun e!66594 () Bool)

(assert (=> start!12144 (=> (not res!51190) (not e!66594))))

(declare-datatypes ((V!3193 0))(
  ( (V!3194 (val!1374 Int)) )
))
(declare-datatypes ((array!4285 0))(
  ( (array!4286 (arr!2032 (Array (_ BitVec 32) (_ BitVec 64))) (size!2287 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!986 0))(
  ( (ValueCellFull!986 (v!2852 V!3193)) (EmptyCell!986) )
))
(declare-datatypes ((array!4287 0))(
  ( (array!4288 (arr!2033 (Array (_ BitVec 32) ValueCell!986)) (size!2288 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!880 0))(
  ( (LongMapFixedSize!881 (defaultEntry!2551 Int) (mask!6681 (_ BitVec 32)) (extraKeys!2360 (_ BitVec 32)) (zeroValue!2428 V!3193) (minValue!2428 V!3193) (_size!489 (_ BitVec 32)) (_keys!4252 array!4285) (_values!2534 array!4287) (_vacant!489 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!670 0))(
  ( (Cell!671 (v!2853 LongMapFixedSize!880)) )
))
(declare-datatypes ((LongMap!670 0))(
  ( (LongMap!671 (underlying!346 Cell!670)) )
))
(declare-fun thiss!992 () LongMap!670)

(declare-fun valid!411 (LongMap!670) Bool)

(assert (=> start!12144 (= res!51190 (valid!411 thiss!992))))

(assert (=> start!12144 e!66594))

(declare-fun e!66588 () Bool)

(assert (=> start!12144 e!66588))

(assert (=> start!12144 true))

(declare-fun e!66586 () Bool)

(assert (=> start!12144 e!66586))

(declare-fun b!102291 () Bool)

(declare-fun e!66601 () Bool)

(declare-fun tp_is_empty!2659 () Bool)

(assert (=> b!102291 (= e!66601 tp_is_empty!2659)))

(declare-fun b!102292 () Bool)

(declare-fun e!66590 () Bool)

(declare-fun e!66593 () Bool)

(assert (=> b!102292 (= e!66590 e!66593)))

(declare-fun res!51188 () Bool)

(assert (=> b!102292 (=> (not res!51188) (not e!66593))))

(declare-datatypes ((tuple2!2360 0))(
  ( (tuple2!2361 (_1!1191 Bool) (_2!1191 LongMapFixedSize!880)) )
))
(declare-fun lt!51922 () tuple2!2360)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!102292 (= res!51188 (and (_1!1191 lt!51922) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3120 0))(
  ( (Unit!3121) )
))
(declare-fun lt!51926 () Unit!3120)

(declare-fun e!66592 () Unit!3120)

(assert (=> b!102292 (= lt!51926 e!66592)))

(declare-datatypes ((tuple2!2362 0))(
  ( (tuple2!2363 (_1!1192 (_ BitVec 64)) (_2!1192 V!3193)) )
))
(declare-datatypes ((List!1605 0))(
  ( (Nil!1602) (Cons!1601 (h!2197 tuple2!2362) (t!5634 List!1605)) )
))
(declare-datatypes ((ListLongMap!1531 0))(
  ( (ListLongMap!1532 (toList!781 List!1605)) )
))
(declare-fun lt!51927 () ListLongMap!1531)

(declare-fun c!17598 () Bool)

(declare-fun contains!812 (ListLongMap!1531 (_ BitVec 64)) Bool)

(assert (=> b!102292 (= c!17598 (contains!812 lt!51927 (select (arr!2032 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!880)

(declare-fun update!155 (LongMapFixedSize!880 (_ BitVec 64) V!3193) tuple2!2360)

(declare-fun get!1315 (ValueCell!986 V!3193) V!3193)

(declare-fun dynLambda!378 (Int (_ BitVec 64)) V!3193)

(assert (=> b!102292 (= lt!51922 (update!155 newMap!16 (select (arr!2032 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) from!355) (get!1315 (select (arr!2033 (_values!2534 (v!2853 (underlying!346 thiss!992)))) from!355) (dynLambda!378 (defaultEntry!2551 (v!2853 (underlying!346 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!3857 () Bool)

(declare-fun mapRes!3858 () Bool)

(declare-fun tp!9765 () Bool)

(declare-fun e!66596 () Bool)

(assert (=> mapNonEmpty!3857 (= mapRes!3858 (and tp!9765 e!66596))))

(declare-fun mapKey!3857 () (_ BitVec 32))

(declare-fun mapValue!3858 () ValueCell!986)

(declare-fun mapRest!3857 () (Array (_ BitVec 32) ValueCell!986))

(assert (=> mapNonEmpty!3857 (= (arr!2033 (_values!2534 (v!2853 (underlying!346 thiss!992)))) (store mapRest!3857 mapKey!3857 mapValue!3858))))

(declare-fun b!102293 () Bool)

(assert (=> b!102293 (= e!66593 false)))

(declare-fun lt!51920 () ListLongMap!1531)

(declare-fun getCurrentListMapNoExtraKeys!96 (array!4285 array!4287 (_ BitVec 32) (_ BitVec 32) V!3193 V!3193 (_ BitVec 32) Int) ListLongMap!1531)

(assert (=> b!102293 (= lt!51920 (getCurrentListMapNoExtraKeys!96 (_keys!4252 (v!2853 (underlying!346 thiss!992))) (_values!2534 (v!2853 (underlying!346 thiss!992))) (mask!6681 (v!2853 (underlying!346 thiss!992))) (extraKeys!2360 (v!2853 (underlying!346 thiss!992))) (zeroValue!2428 (v!2853 (underlying!346 thiss!992))) (minValue!2428 (v!2853 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2551 (v!2853 (underlying!346 thiss!992)))))))

(declare-fun e!66595 () Bool)

(declare-fun array_inv!1277 (array!4285) Bool)

(declare-fun array_inv!1278 (array!4287) Bool)

(assert (=> b!102294 (= e!66586 (and tp!9768 tp_is_empty!2659 (array_inv!1277 (_keys!4252 newMap!16)) (array_inv!1278 (_values!2534 newMap!16)) e!66595))))

(declare-fun b!102295 () Bool)

(declare-fun e!66587 () Bool)

(assert (=> b!102295 (= e!66588 e!66587)))

(declare-fun b!102296 () Bool)

(declare-fun e!66597 () Bool)

(assert (=> b!102296 (= e!66587 e!66597)))

(declare-fun b!102297 () Bool)

(declare-fun res!51189 () Bool)

(assert (=> b!102297 (=> (not res!51189) (not e!66594))))

(declare-fun valid!412 (LongMapFixedSize!880) Bool)

(assert (=> b!102297 (= res!51189 (valid!412 newMap!16))))

(declare-fun e!66600 () Bool)

(assert (=> b!102298 (= e!66597 (and tp!9766 tp_is_empty!2659 (array_inv!1277 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) (array_inv!1278 (_values!2534 (v!2853 (underlying!346 thiss!992)))) e!66600))))

(declare-fun b!102299 () Bool)

(declare-fun res!51187 () Bool)

(assert (=> b!102299 (=> (not res!51187) (not e!66594))))

(assert (=> b!102299 (= res!51187 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6681 newMap!16)) (_size!489 (v!2853 (underlying!346 thiss!992)))))))

(declare-fun b!102300 () Bool)

(declare-fun e!66598 () Bool)

(assert (=> b!102300 (= e!66598 tp_is_empty!2659)))

(declare-fun b!102301 () Bool)

(declare-fun e!66591 () Bool)

(assert (=> b!102301 (= e!66600 (and e!66591 mapRes!3858))))

(declare-fun condMapEmpty!3858 () Bool)

(declare-fun mapDefault!3858 () ValueCell!986)

(assert (=> b!102301 (= condMapEmpty!3858 (= (arr!2033 (_values!2534 (v!2853 (underlying!346 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!986)) mapDefault!3858)))))

(declare-fun b!102302 () Bool)

(declare-fun Unit!3122 () Unit!3120)

(assert (=> b!102302 (= e!66592 Unit!3122)))

(declare-fun mapIsEmpty!3857 () Bool)

(declare-fun mapRes!3857 () Bool)

(assert (=> mapIsEmpty!3857 mapRes!3857))

(declare-fun b!102303 () Bool)

(assert (=> b!102303 (= e!66595 (and e!66598 mapRes!3857))))

(declare-fun condMapEmpty!3857 () Bool)

(declare-fun mapDefault!3857 () ValueCell!986)

(assert (=> b!102303 (= condMapEmpty!3857 (= (arr!2033 (_values!2534 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!986)) mapDefault!3857)))))

(declare-fun mapIsEmpty!3858 () Bool)

(assert (=> mapIsEmpty!3858 mapRes!3858))

(declare-fun b!102304 () Bool)

(assert (=> b!102304 (= e!66594 e!66590)))

(declare-fun res!51186 () Bool)

(assert (=> b!102304 (=> (not res!51186) (not e!66590))))

(declare-fun lt!51924 () ListLongMap!1531)

(assert (=> b!102304 (= res!51186 (and (= lt!51924 lt!51927) (not (= (select (arr!2032 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2032 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1259 (LongMapFixedSize!880) ListLongMap!1531)

(assert (=> b!102304 (= lt!51927 (map!1259 newMap!16))))

(declare-fun getCurrentListMap!459 (array!4285 array!4287 (_ BitVec 32) (_ BitVec 32) V!3193 V!3193 (_ BitVec 32) Int) ListLongMap!1531)

(assert (=> b!102304 (= lt!51924 (getCurrentListMap!459 (_keys!4252 (v!2853 (underlying!346 thiss!992))) (_values!2534 (v!2853 (underlying!346 thiss!992))) (mask!6681 (v!2853 (underlying!346 thiss!992))) (extraKeys!2360 (v!2853 (underlying!346 thiss!992))) (zeroValue!2428 (v!2853 (underlying!346 thiss!992))) (minValue!2428 (v!2853 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2551 (v!2853 (underlying!346 thiss!992)))))))

(declare-fun b!102305 () Bool)

(declare-fun res!51185 () Bool)

(assert (=> b!102305 (=> (not res!51185) (not e!66594))))

(assert (=> b!102305 (= res!51185 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2287 (_keys!4252 (v!2853 (underlying!346 thiss!992)))))))))

(declare-fun b!102306 () Bool)

(assert (=> b!102306 (= e!66596 tp_is_empty!2659)))

(declare-fun b!102307 () Bool)

(assert (=> b!102307 (= e!66591 tp_is_empty!2659)))

(declare-fun b!102308 () Bool)

(declare-fun Unit!3123 () Unit!3120)

(assert (=> b!102308 (= e!66592 Unit!3123)))

(declare-fun lt!51923 () Unit!3120)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!105 (array!4285 array!4287 (_ BitVec 32) (_ BitVec 32) V!3193 V!3193 (_ BitVec 64) (_ BitVec 32) Int) Unit!3120)

(assert (=> b!102308 (= lt!51923 (lemmaListMapContainsThenArrayContainsFrom!105 (_keys!4252 (v!2853 (underlying!346 thiss!992))) (_values!2534 (v!2853 (underlying!346 thiss!992))) (mask!6681 (v!2853 (underlying!346 thiss!992))) (extraKeys!2360 (v!2853 (underlying!346 thiss!992))) (zeroValue!2428 (v!2853 (underlying!346 thiss!992))) (minValue!2428 (v!2853 (underlying!346 thiss!992))) (select (arr!2032 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2551 (v!2853 (underlying!346 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!102308 (arrayContainsKey!0 (_keys!4252 (v!2853 (underlying!346 thiss!992))) (select (arr!2032 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!51921 () Unit!3120)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4285 (_ BitVec 32) (_ BitVec 32)) Unit!3120)

(assert (=> b!102308 (= lt!51921 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4252 (v!2853 (underlying!346 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1606 0))(
  ( (Nil!1603) (Cons!1602 (h!2198 (_ BitVec 64)) (t!5635 List!1606)) )
))
(declare-fun arrayNoDuplicates!0 (array!4285 (_ BitVec 32) List!1606) Bool)

(assert (=> b!102308 (arrayNoDuplicates!0 (_keys!4252 (v!2853 (underlying!346 thiss!992))) from!355 Nil!1603)))

(declare-fun lt!51925 () Unit!3120)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4285 (_ BitVec 32) (_ BitVec 64) List!1606) Unit!3120)

(assert (=> b!102308 (= lt!51925 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4252 (v!2853 (underlying!346 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2032 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) from!355) (Cons!1602 (select (arr!2032 (_keys!4252 (v!2853 (underlying!346 thiss!992)))) from!355) Nil!1603)))))

(assert (=> b!102308 false))

(declare-fun mapNonEmpty!3858 () Bool)

(declare-fun tp!9767 () Bool)

(assert (=> mapNonEmpty!3858 (= mapRes!3857 (and tp!9767 e!66601))))

(declare-fun mapRest!3858 () (Array (_ BitVec 32) ValueCell!986))

(declare-fun mapValue!3857 () ValueCell!986)

(declare-fun mapKey!3858 () (_ BitVec 32))

(assert (=> mapNonEmpty!3858 (= (arr!2033 (_values!2534 newMap!16)) (store mapRest!3858 mapKey!3858 mapValue!3857))))

(assert (= (and start!12144 res!51190) b!102305))

(assert (= (and b!102305 res!51185) b!102297))

(assert (= (and b!102297 res!51189) b!102299))

(assert (= (and b!102299 res!51187) b!102304))

(assert (= (and b!102304 res!51186) b!102292))

(assert (= (and b!102292 c!17598) b!102308))

(assert (= (and b!102292 (not c!17598)) b!102302))

(assert (= (and b!102292 res!51188) b!102293))

(assert (= (and b!102301 condMapEmpty!3858) mapIsEmpty!3858))

(assert (= (and b!102301 (not condMapEmpty!3858)) mapNonEmpty!3857))

(get-info :version)

(assert (= (and mapNonEmpty!3857 ((_ is ValueCellFull!986) mapValue!3858)) b!102306))

(assert (= (and b!102301 ((_ is ValueCellFull!986) mapDefault!3858)) b!102307))

(assert (= b!102298 b!102301))

(assert (= b!102296 b!102298))

(assert (= b!102295 b!102296))

(assert (= start!12144 b!102295))

(assert (= (and b!102303 condMapEmpty!3857) mapIsEmpty!3857))

(assert (= (and b!102303 (not condMapEmpty!3857)) mapNonEmpty!3858))

(assert (= (and mapNonEmpty!3858 ((_ is ValueCellFull!986) mapValue!3857)) b!102291))

(assert (= (and b!102303 ((_ is ValueCellFull!986) mapDefault!3857)) b!102300))

(assert (= b!102294 b!102303))

(assert (= start!12144 b!102294))

(declare-fun b_lambda!4567 () Bool)

(assert (=> (not b_lambda!4567) (not b!102292)))

(declare-fun t!5631 () Bool)

(declare-fun tb!1997 () Bool)

(assert (=> (and b!102298 (= (defaultEntry!2551 (v!2853 (underlying!346 thiss!992))) (defaultEntry!2551 (v!2853 (underlying!346 thiss!992)))) t!5631) tb!1997))

(declare-fun result!3373 () Bool)

(assert (=> tb!1997 (= result!3373 tp_is_empty!2659)))

(assert (=> b!102292 t!5631))

(declare-fun b_and!6297 () Bool)

(assert (= b_and!6293 (and (=> t!5631 result!3373) b_and!6297)))

(declare-fun tb!1999 () Bool)

(declare-fun t!5633 () Bool)

(assert (=> (and b!102294 (= (defaultEntry!2551 newMap!16) (defaultEntry!2551 (v!2853 (underlying!346 thiss!992)))) t!5633) tb!1999))

(declare-fun result!3377 () Bool)

(assert (= result!3377 result!3373))

(assert (=> b!102292 t!5633))

(declare-fun b_and!6299 () Bool)

(assert (= b_and!6295 (and (=> t!5633 result!3377) b_and!6299)))

(declare-fun m!113007 () Bool)

(assert (=> b!102293 m!113007))

(declare-fun m!113009 () Bool)

(assert (=> b!102297 m!113009))

(declare-fun m!113011 () Bool)

(assert (=> b!102294 m!113011))

(declare-fun m!113013 () Bool)

(assert (=> b!102294 m!113013))

(declare-fun m!113015 () Bool)

(assert (=> b!102308 m!113015))

(declare-fun m!113017 () Bool)

(assert (=> b!102308 m!113017))

(declare-fun m!113019 () Bool)

(assert (=> b!102308 m!113019))

(declare-fun m!113021 () Bool)

(assert (=> b!102308 m!113021))

(assert (=> b!102308 m!113019))

(assert (=> b!102308 m!113019))

(declare-fun m!113023 () Bool)

(assert (=> b!102308 m!113023))

(assert (=> b!102308 m!113019))

(declare-fun m!113025 () Bool)

(assert (=> b!102308 m!113025))

(declare-fun m!113027 () Bool)

(assert (=> b!102298 m!113027))

(declare-fun m!113029 () Bool)

(assert (=> b!102298 m!113029))

(assert (=> b!102304 m!113019))

(declare-fun m!113031 () Bool)

(assert (=> b!102304 m!113031))

(declare-fun m!113033 () Bool)

(assert (=> b!102304 m!113033))

(declare-fun m!113035 () Bool)

(assert (=> mapNonEmpty!3858 m!113035))

(declare-fun m!113037 () Bool)

(assert (=> start!12144 m!113037))

(declare-fun m!113039 () Bool)

(assert (=> b!102292 m!113039))

(declare-fun m!113041 () Bool)

(assert (=> b!102292 m!113041))

(declare-fun m!113043 () Bool)

(assert (=> b!102292 m!113043))

(assert (=> b!102292 m!113019))

(declare-fun m!113045 () Bool)

(assert (=> b!102292 m!113045))

(assert (=> b!102292 m!113019))

(assert (=> b!102292 m!113041))

(assert (=> b!102292 m!113019))

(assert (=> b!102292 m!113043))

(declare-fun m!113047 () Bool)

(assert (=> b!102292 m!113047))

(assert (=> b!102292 m!113039))

(declare-fun m!113049 () Bool)

(assert (=> mapNonEmpty!3857 m!113049))

(check-sat (not mapNonEmpty!3858) b_and!6299 (not b!102308) tp_is_empty!2659 (not b!102292) (not b!102294) (not mapNonEmpty!3857) (not b_next!2487) (not b_lambda!4567) (not b!102304) b_and!6297 (not b!102298) (not b!102297) (not start!12144) (not b!102293) (not b_next!2485))
(check-sat b_and!6297 b_and!6299 (not b_next!2485) (not b_next!2487))
