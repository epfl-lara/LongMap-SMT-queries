; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11646 () Bool)

(assert start!11646)

(declare-fun b!97302 () Bool)

(declare-fun b_free!2417 () Bool)

(declare-fun b_next!2417 () Bool)

(assert (=> b!97302 (= b_free!2417 (not b_next!2417))))

(declare-fun tp!9533 () Bool)

(declare-fun b_and!5963 () Bool)

(assert (=> b!97302 (= tp!9533 b_and!5963)))

(declare-fun b!97297 () Bool)

(declare-fun b_free!2419 () Bool)

(declare-fun b_next!2419 () Bool)

(assert (=> b!97297 (= b_free!2419 (not b_next!2419))))

(declare-fun tp!9535 () Bool)

(declare-fun b_and!5965 () Bool)

(assert (=> b!97297 (= tp!9535 b_and!5965)))

(declare-fun b!97289 () Bool)

(declare-fun e!63439 () Bool)

(declare-fun e!63430 () Bool)

(assert (=> b!97289 (= e!63439 e!63430)))

(declare-fun b!97290 () Bool)

(declare-fun e!63424 () Bool)

(declare-fun tp_is_empty!2625 () Bool)

(assert (=> b!97290 (= e!63424 tp_is_empty!2625)))

(declare-fun b!97291 () Bool)

(declare-fun e!63429 () Bool)

(assert (=> b!97291 (= e!63429 tp_is_empty!2625)))

(declare-fun b!97292 () Bool)

(declare-fun e!63434 () Bool)

(declare-fun mapRes!3727 () Bool)

(assert (=> b!97292 (= e!63434 (and e!63429 mapRes!3727))))

(declare-fun condMapEmpty!3727 () Bool)

(declare-datatypes ((V!3147 0))(
  ( (V!3148 (val!1357 Int)) )
))
(declare-datatypes ((array!4229 0))(
  ( (array!4230 (arr!2009 (Array (_ BitVec 32) (_ BitVec 64))) (size!2259 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!969 0))(
  ( (ValueCellFull!969 (v!2793 V!3147)) (EmptyCell!969) )
))
(declare-datatypes ((array!4231 0))(
  ( (array!4232 (arr!2010 (Array (_ BitVec 32) ValueCell!969)) (size!2260 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!846 0))(
  ( (LongMapFixedSize!847 (defaultEntry!2478 Int) (mask!6573 (_ BitVec 32)) (extraKeys!2299 (_ BitVec 32)) (zeroValue!2361 V!3147) (minValue!2361 V!3147) (_size!472 (_ BitVec 32)) (_keys!4168 array!4229) (_values!2461 array!4231) (_vacant!472 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!846)

(declare-fun mapDefault!3728 () ValueCell!969)

(assert (=> b!97292 (= condMapEmpty!3727 (= (arr!2010 (_values!2461 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!969)) mapDefault!3728)))))

(declare-fun b!97293 () Bool)

(declare-fun res!49049 () Bool)

(declare-fun e!63433 () Bool)

(assert (=> b!97293 (=> (not res!49049) (not e!63433))))

(declare-datatypes ((Cell!646 0))(
  ( (Cell!647 (v!2794 LongMapFixedSize!846)) )
))
(declare-datatypes ((LongMap!646 0))(
  ( (LongMap!647 (underlying!334 Cell!646)) )
))
(declare-fun thiss!992 () LongMap!646)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!97293 (= res!49049 (validMask!0 (mask!6573 (v!2794 (underlying!334 thiss!992)))))))

(declare-fun b!97294 () Bool)

(declare-fun e!63427 () Bool)

(declare-fun e!63438 () Bool)

(declare-fun mapRes!3728 () Bool)

(assert (=> b!97294 (= e!63427 (and e!63438 mapRes!3728))))

(declare-fun condMapEmpty!3728 () Bool)

(declare-fun mapDefault!3727 () ValueCell!969)

(assert (=> b!97294 (= condMapEmpty!3728 (= (arr!2010 (_values!2461 (v!2794 (underlying!334 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!969)) mapDefault!3727)))))

(declare-fun b!97295 () Bool)

(declare-fun res!49048 () Bool)

(declare-fun e!63436 () Bool)

(assert (=> b!97295 (=> (not res!49048) (not e!63436))))

(assert (=> b!97295 (= res!49048 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6573 newMap!16)) (_size!472 (v!2794 (underlying!334 thiss!992)))))))

(declare-fun b!97296 () Bool)

(declare-datatypes ((Unit!2931 0))(
  ( (Unit!2932) )
))
(declare-fun e!63432 () Unit!2931)

(declare-fun Unit!2933 () Unit!2931)

(assert (=> b!97296 (= e!63432 Unit!2933)))

(declare-fun e!63428 () Bool)

(declare-fun array_inv!1253 (array!4229) Bool)

(declare-fun array_inv!1254 (array!4231) Bool)

(assert (=> b!97297 (= e!63428 (and tp!9535 tp_is_empty!2625 (array_inv!1253 (_keys!4168 newMap!16)) (array_inv!1254 (_values!2461 newMap!16)) e!63434))))

(declare-fun b!97298 () Bool)

(declare-fun e!63437 () Bool)

(assert (=> b!97298 (= e!63437 e!63433)))

(declare-fun res!49047 () Bool)

(assert (=> b!97298 (=> (not res!49047) (not e!63433))))

(declare-datatypes ((tuple2!2330 0))(
  ( (tuple2!2331 (_1!1176 Bool) (_2!1176 LongMapFixedSize!846)) )
))
(declare-fun lt!48755 () tuple2!2330)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!97298 (= res!49047 (and (_1!1176 lt!48755) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!48753 () Unit!2931)

(assert (=> b!97298 (= lt!48753 e!63432)))

(declare-fun c!16476 () Bool)

(declare-datatypes ((tuple2!2332 0))(
  ( (tuple2!2333 (_1!1177 (_ BitVec 64)) (_2!1177 V!3147)) )
))
(declare-datatypes ((List!1577 0))(
  ( (Nil!1574) (Cons!1573 (h!2167 tuple2!2332) (t!5519 List!1577)) )
))
(declare-datatypes ((ListLongMap!1531 0))(
  ( (ListLongMap!1532 (toList!781 List!1577)) )
))
(declare-fun lt!48754 () ListLongMap!1531)

(declare-fun contains!798 (ListLongMap!1531 (_ BitVec 64)) Bool)

(assert (=> b!97298 (= c!16476 (contains!798 lt!48754 (select (arr!2009 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) from!355)))))

(declare-fun update!138 (LongMapFixedSize!846 (_ BitVec 64) V!3147) tuple2!2330)

(declare-fun get!1276 (ValueCell!969 V!3147) V!3147)

(declare-fun dynLambda!366 (Int (_ BitVec 64)) V!3147)

(assert (=> b!97298 (= lt!48755 (update!138 newMap!16 (select (arr!2009 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) from!355) (get!1276 (select (arr!2010 (_values!2461 (v!2794 (underlying!334 thiss!992)))) from!355) (dynLambda!366 (defaultEntry!2478 (v!2794 (underlying!334 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!97299 () Bool)

(declare-fun res!49052 () Bool)

(assert (=> b!97299 (=> (not res!49052) (not e!63436))))

(assert (=> b!97299 (= res!49052 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2259 (_keys!4168 (v!2794 (underlying!334 thiss!992)))))))))

(declare-fun mapIsEmpty!3727 () Bool)

(assert (=> mapIsEmpty!3727 mapRes!3727))

(declare-fun mapIsEmpty!3728 () Bool)

(assert (=> mapIsEmpty!3728 mapRes!3728))

(declare-fun b!97300 () Bool)

(assert (=> b!97300 (= e!63433 (and (= (size!2260 (_values!2461 (v!2794 (underlying!334 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6573 (v!2794 (underlying!334 thiss!992))))) (= (size!2259 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) (size!2260 (_values!2461 (v!2794 (underlying!334 thiss!992))))) (bvslt (mask!6573 (v!2794 (underlying!334 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!97301 () Bool)

(declare-fun Unit!2934 () Unit!2931)

(assert (=> b!97301 (= e!63432 Unit!2934)))

(declare-fun lt!48752 () Unit!2931)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!88 (array!4229 array!4231 (_ BitVec 32) (_ BitVec 32) V!3147 V!3147 (_ BitVec 64) (_ BitVec 32) Int) Unit!2931)

(assert (=> b!97301 (= lt!48752 (lemmaListMapContainsThenArrayContainsFrom!88 (_keys!4168 (v!2794 (underlying!334 thiss!992))) (_values!2461 (v!2794 (underlying!334 thiss!992))) (mask!6573 (v!2794 (underlying!334 thiss!992))) (extraKeys!2299 (v!2794 (underlying!334 thiss!992))) (zeroValue!2361 (v!2794 (underlying!334 thiss!992))) (minValue!2361 (v!2794 (underlying!334 thiss!992))) (select (arr!2009 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2478 (v!2794 (underlying!334 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!97301 (arrayContainsKey!0 (_keys!4168 (v!2794 (underlying!334 thiss!992))) (select (arr!2009 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!48758 () Unit!2931)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4229 (_ BitVec 32) (_ BitVec 32)) Unit!2931)

(assert (=> b!97301 (= lt!48758 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4168 (v!2794 (underlying!334 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1578 0))(
  ( (Nil!1575) (Cons!1574 (h!2168 (_ BitVec 64)) (t!5520 List!1578)) )
))
(declare-fun arrayNoDuplicates!0 (array!4229 (_ BitVec 32) List!1578) Bool)

(assert (=> b!97301 (arrayNoDuplicates!0 (_keys!4168 (v!2794 (underlying!334 thiss!992))) from!355 Nil!1575)))

(declare-fun lt!48757 () Unit!2931)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4229 (_ BitVec 32) (_ BitVec 64) List!1578) Unit!2931)

(assert (=> b!97301 (= lt!48757 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4168 (v!2794 (underlying!334 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2009 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) from!355) (Cons!1574 (select (arr!2009 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) from!355) Nil!1575)))))

(assert (=> b!97301 false))

(declare-fun e!63435 () Bool)

(assert (=> b!97302 (= e!63435 (and tp!9533 tp_is_empty!2625 (array_inv!1253 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) (array_inv!1254 (_values!2461 (v!2794 (underlying!334 thiss!992)))) e!63427))))

(declare-fun b!97303 () Bool)

(assert (=> b!97303 (= e!63436 e!63437)))

(declare-fun res!49053 () Bool)

(assert (=> b!97303 (=> (not res!49053) (not e!63437))))

(declare-fun lt!48756 () ListLongMap!1531)

(assert (=> b!97303 (= res!49053 (and (= lt!48756 lt!48754) (not (= (select (arr!2009 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2009 (_keys!4168 (v!2794 (underlying!334 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1251 (LongMapFixedSize!846) ListLongMap!1531)

(assert (=> b!97303 (= lt!48754 (map!1251 newMap!16))))

(declare-fun getCurrentListMap!472 (array!4229 array!4231 (_ BitVec 32) (_ BitVec 32) V!3147 V!3147 (_ BitVec 32) Int) ListLongMap!1531)

(assert (=> b!97303 (= lt!48756 (getCurrentListMap!472 (_keys!4168 (v!2794 (underlying!334 thiss!992))) (_values!2461 (v!2794 (underlying!334 thiss!992))) (mask!6573 (v!2794 (underlying!334 thiss!992))) (extraKeys!2299 (v!2794 (underlying!334 thiss!992))) (zeroValue!2361 (v!2794 (underlying!334 thiss!992))) (minValue!2361 (v!2794 (underlying!334 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2478 (v!2794 (underlying!334 thiss!992)))))))

(declare-fun b!97304 () Bool)

(declare-fun res!49051 () Bool)

(assert (=> b!97304 (=> (not res!49051) (not e!63436))))

(declare-fun valid!381 (LongMapFixedSize!846) Bool)

(assert (=> b!97304 (= res!49051 (valid!381 newMap!16))))

(declare-fun b!97305 () Bool)

(assert (=> b!97305 (= e!63438 tp_is_empty!2625)))

(declare-fun b!97306 () Bool)

(assert (=> b!97306 (= e!63430 e!63435)))

(declare-fun mapNonEmpty!3727 () Bool)

(declare-fun tp!9534 () Bool)

(assert (=> mapNonEmpty!3727 (= mapRes!3728 (and tp!9534 e!63424))))

(declare-fun mapValue!3728 () ValueCell!969)

(declare-fun mapRest!3727 () (Array (_ BitVec 32) ValueCell!969))

(declare-fun mapKey!3728 () (_ BitVec 32))

(assert (=> mapNonEmpty!3727 (= (arr!2010 (_values!2461 (v!2794 (underlying!334 thiss!992)))) (store mapRest!3727 mapKey!3728 mapValue!3728))))

(declare-fun b!97307 () Bool)

(declare-fun e!63426 () Bool)

(assert (=> b!97307 (= e!63426 tp_is_empty!2625)))

(declare-fun mapNonEmpty!3728 () Bool)

(declare-fun tp!9536 () Bool)

(assert (=> mapNonEmpty!3728 (= mapRes!3727 (and tp!9536 e!63426))))

(declare-fun mapRest!3728 () (Array (_ BitVec 32) ValueCell!969))

(declare-fun mapKey!3727 () (_ BitVec 32))

(declare-fun mapValue!3727 () ValueCell!969)

(assert (=> mapNonEmpty!3728 (= (arr!2010 (_values!2461 newMap!16)) (store mapRest!3728 mapKey!3727 mapValue!3727))))

(declare-fun res!49050 () Bool)

(assert (=> start!11646 (=> (not res!49050) (not e!63436))))

(declare-fun valid!382 (LongMap!646) Bool)

(assert (=> start!11646 (= res!49050 (valid!382 thiss!992))))

(assert (=> start!11646 e!63436))

(assert (=> start!11646 e!63439))

(assert (=> start!11646 true))

(assert (=> start!11646 e!63428))

(assert (= (and start!11646 res!49050) b!97299))

(assert (= (and b!97299 res!49052) b!97304))

(assert (= (and b!97304 res!49051) b!97295))

(assert (= (and b!97295 res!49048) b!97303))

(assert (= (and b!97303 res!49053) b!97298))

(assert (= (and b!97298 c!16476) b!97301))

(assert (= (and b!97298 (not c!16476)) b!97296))

(assert (= (and b!97298 res!49047) b!97293))

(assert (= (and b!97293 res!49049) b!97300))

(assert (= (and b!97294 condMapEmpty!3728) mapIsEmpty!3728))

(assert (= (and b!97294 (not condMapEmpty!3728)) mapNonEmpty!3727))

(get-info :version)

(assert (= (and mapNonEmpty!3727 ((_ is ValueCellFull!969) mapValue!3728)) b!97290))

(assert (= (and b!97294 ((_ is ValueCellFull!969) mapDefault!3727)) b!97305))

(assert (= b!97302 b!97294))

(assert (= b!97306 b!97302))

(assert (= b!97289 b!97306))

(assert (= start!11646 b!97289))

(assert (= (and b!97292 condMapEmpty!3727) mapIsEmpty!3727))

(assert (= (and b!97292 (not condMapEmpty!3727)) mapNonEmpty!3728))

(assert (= (and mapNonEmpty!3728 ((_ is ValueCellFull!969) mapValue!3727)) b!97307))

(assert (= (and b!97292 ((_ is ValueCellFull!969) mapDefault!3728)) b!97291))

(assert (= b!97297 b!97292))

(assert (= start!11646 b!97297))

(declare-fun b_lambda!4331 () Bool)

(assert (=> (not b_lambda!4331) (not b!97298)))

(declare-fun t!5516 () Bool)

(declare-fun tb!1909 () Bool)

(assert (=> (and b!97302 (= (defaultEntry!2478 (v!2794 (underlying!334 thiss!992))) (defaultEntry!2478 (v!2794 (underlying!334 thiss!992)))) t!5516) tb!1909))

(declare-fun result!3243 () Bool)

(assert (=> tb!1909 (= result!3243 tp_is_empty!2625)))

(assert (=> b!97298 t!5516))

(declare-fun b_and!5967 () Bool)

(assert (= b_and!5963 (and (=> t!5516 result!3243) b_and!5967)))

(declare-fun t!5518 () Bool)

(declare-fun tb!1911 () Bool)

(assert (=> (and b!97297 (= (defaultEntry!2478 newMap!16) (defaultEntry!2478 (v!2794 (underlying!334 thiss!992)))) t!5518) tb!1911))

(declare-fun result!3247 () Bool)

(assert (= result!3247 result!3243))

(assert (=> b!97298 t!5518))

(declare-fun b_and!5969 () Bool)

(assert (= b_and!5965 (and (=> t!5518 result!3247) b_and!5969)))

(declare-fun m!106515 () Bool)

(assert (=> b!97303 m!106515))

(declare-fun m!106517 () Bool)

(assert (=> b!97303 m!106517))

(declare-fun m!106519 () Bool)

(assert (=> b!97303 m!106519))

(declare-fun m!106521 () Bool)

(assert (=> b!97302 m!106521))

(declare-fun m!106523 () Bool)

(assert (=> b!97302 m!106523))

(declare-fun m!106525 () Bool)

(assert (=> mapNonEmpty!3728 m!106525))

(declare-fun m!106527 () Bool)

(assert (=> b!97304 m!106527))

(declare-fun m!106529 () Bool)

(assert (=> b!97301 m!106529))

(declare-fun m!106531 () Bool)

(assert (=> b!97301 m!106531))

(assert (=> b!97301 m!106515))

(declare-fun m!106533 () Bool)

(assert (=> b!97301 m!106533))

(assert (=> b!97301 m!106515))

(assert (=> b!97301 m!106515))

(declare-fun m!106535 () Bool)

(assert (=> b!97301 m!106535))

(assert (=> b!97301 m!106515))

(declare-fun m!106537 () Bool)

(assert (=> b!97301 m!106537))

(declare-fun m!106539 () Bool)

(assert (=> b!97293 m!106539))

(declare-fun m!106541 () Bool)

(assert (=> b!97298 m!106541))

(declare-fun m!106543 () Bool)

(assert (=> b!97298 m!106543))

(declare-fun m!106545 () Bool)

(assert (=> b!97298 m!106545))

(assert (=> b!97298 m!106515))

(declare-fun m!106547 () Bool)

(assert (=> b!97298 m!106547))

(assert (=> b!97298 m!106515))

(assert (=> b!97298 m!106543))

(assert (=> b!97298 m!106515))

(assert (=> b!97298 m!106545))

(declare-fun m!106549 () Bool)

(assert (=> b!97298 m!106549))

(assert (=> b!97298 m!106541))

(declare-fun m!106551 () Bool)

(assert (=> start!11646 m!106551))

(declare-fun m!106553 () Bool)

(assert (=> mapNonEmpty!3727 m!106553))

(declare-fun m!106555 () Bool)

(assert (=> b!97297 m!106555))

(declare-fun m!106557 () Bool)

(assert (=> b!97297 m!106557))

(check-sat (not b!97304) (not mapNonEmpty!3727) (not b!97301) b_and!5967 (not b!97302) (not b_lambda!4331) (not b!97303) (not b!97298) (not b_next!2417) (not b!97293) b_and!5969 (not start!11646) (not b_next!2419) tp_is_empty!2625 (not mapNonEmpty!3728) (not b!97297))
(check-sat b_and!5967 b_and!5969 (not b_next!2417) (not b_next!2419))
