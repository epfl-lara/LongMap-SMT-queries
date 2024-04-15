; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13550 () Bool)

(assert start!13550)

(declare-fun b!124442 () Bool)

(declare-fun b_free!2833 () Bool)

(declare-fun b_next!2833 () Bool)

(assert (=> b!124442 (= b_free!2833 (not b_next!2833))))

(declare-fun tp!10900 () Bool)

(declare-fun b_and!7629 () Bool)

(assert (=> b!124442 (= tp!10900 b_and!7629)))

(declare-fun b!124445 () Bool)

(declare-fun b_free!2835 () Bool)

(declare-fun b_next!2835 () Bool)

(assert (=> b!124445 (= b_free!2835 (not b_next!2835))))

(declare-fun tp!10899 () Bool)

(declare-fun b_and!7631 () Bool)

(assert (=> b!124445 (= tp!10899 b_and!7631)))

(declare-fun b!124441 () Bool)

(declare-fun e!81337 () Bool)

(declare-datatypes ((V!3425 0))(
  ( (V!3426 (val!1461 Int)) )
))
(declare-datatypes ((array!4661 0))(
  ( (array!4662 (arr!2206 (Array (_ BitVec 32) (_ BitVec 64))) (size!2470 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1073 0))(
  ( (ValueCellFull!1073 (v!3100 V!3425)) (EmptyCell!1073) )
))
(declare-datatypes ((array!4663 0))(
  ( (array!4664 (arr!2207 (Array (_ BitVec 32) ValueCell!1073)) (size!2471 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1054 0))(
  ( (LongMapFixedSize!1055 (defaultEntry!2763 Int) (mask!7008 (_ BitVec 32)) (extraKeys!2548 (_ BitVec 32)) (zeroValue!2628 V!3425) (minValue!2628 V!3425) (_size!576 (_ BitVec 32)) (_keys!4491 array!4661) (_values!2746 array!4663) (_vacant!576 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!842 0))(
  ( (Cell!843 (v!3101 LongMapFixedSize!1054)) )
))
(declare-datatypes ((LongMap!842 0))(
  ( (LongMap!843 (underlying!432 Cell!842)) )
))
(declare-fun thiss!992 () LongMap!842)

(assert (=> b!124441 (= e!81337 (not (= (size!2471 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7008 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun e!81340 () Bool)

(declare-fun tp_is_empty!2833 () Bool)

(declare-fun e!81334 () Bool)

(declare-fun array_inv!1403 (array!4661) Bool)

(declare-fun array_inv!1404 (array!4663) Bool)

(assert (=> b!124442 (= e!81340 (and tp!10900 tp_is_empty!2833 (array_inv!1403 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (array_inv!1404 (_values!2746 (v!3101 (underlying!432 thiss!992)))) e!81334))))

(declare-fun mapIsEmpty!4467 () Bool)

(declare-fun mapRes!4468 () Bool)

(assert (=> mapIsEmpty!4467 mapRes!4468))

(declare-fun b!124443 () Bool)

(declare-fun e!81333 () Bool)

(assert (=> b!124443 (= e!81333 tp_is_empty!2833)))

(declare-fun b!124444 () Bool)

(declare-fun e!81328 () Bool)

(assert (=> b!124444 (= e!81328 e!81340)))

(declare-fun e!81341 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1054)

(declare-fun e!81335 () Bool)

(assert (=> b!124445 (= e!81335 (and tp!10899 tp_is_empty!2833 (array_inv!1403 (_keys!4491 newMap!16)) (array_inv!1404 (_values!2746 newMap!16)) e!81341))))

(declare-fun res!60281 () Bool)

(declare-fun e!81338 () Bool)

(assert (=> start!13550 (=> (not res!60281) (not e!81338))))

(declare-fun valid!505 (LongMap!842) Bool)

(assert (=> start!13550 (= res!60281 (valid!505 thiss!992))))

(assert (=> start!13550 e!81338))

(declare-fun e!81339 () Bool)

(assert (=> start!13550 e!81339))

(assert (=> start!13550 true))

(assert (=> start!13550 e!81335))

(declare-fun b!124446 () Bool)

(declare-fun e!81330 () Bool)

(assert (=> b!124446 (= e!81338 e!81330)))

(declare-fun res!60280 () Bool)

(assert (=> b!124446 (=> (not res!60280) (not e!81330))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2534 0))(
  ( (tuple2!2535 (_1!1278 (_ BitVec 64)) (_2!1278 V!3425)) )
))
(declare-datatypes ((List!1689 0))(
  ( (Nil!1686) (Cons!1685 (h!2286 tuple2!2534) (t!6007 List!1689)) )
))
(declare-datatypes ((ListLongMap!1643 0))(
  ( (ListLongMap!1644 (toList!837 List!1689)) )
))
(declare-fun lt!63927 () ListLongMap!1643)

(declare-fun lt!63929 () ListLongMap!1643)

(assert (=> b!124446 (= res!60280 (and (= lt!63927 lt!63929) (not (= (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1365 (LongMapFixedSize!1054) ListLongMap!1643)

(assert (=> b!124446 (= lt!63929 (map!1365 newMap!16))))

(declare-fun getCurrentListMap!507 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) Int) ListLongMap!1643)

(assert (=> b!124446 (= lt!63927 (getCurrentListMap!507 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!124447 () Bool)

(declare-fun e!81329 () Bool)

(assert (=> b!124447 (= e!81329 tp_is_empty!2833)))

(declare-fun mapIsEmpty!4468 () Bool)

(declare-fun mapRes!4467 () Bool)

(assert (=> mapIsEmpty!4468 mapRes!4467))

(declare-fun b!124448 () Bool)

(declare-fun res!60279 () Bool)

(assert (=> b!124448 (=> (not res!60279) (not e!81338))))

(assert (=> b!124448 (= res!60279 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!124449 () Bool)

(assert (=> b!124449 (= e!81339 e!81328)))

(declare-fun b!124450 () Bool)

(declare-fun e!81336 () Bool)

(assert (=> b!124450 (= e!81336 tp_is_empty!2833)))

(declare-fun b!124451 () Bool)

(declare-fun e!81332 () Bool)

(assert (=> b!124451 (= e!81334 (and e!81332 mapRes!4468))))

(declare-fun condMapEmpty!4467 () Bool)

(declare-fun mapDefault!4467 () ValueCell!1073)

(assert (=> b!124451 (= condMapEmpty!4467 (= (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4467)))))

(declare-fun mapNonEmpty!4467 () Bool)

(declare-fun tp!10898 () Bool)

(assert (=> mapNonEmpty!4467 (= mapRes!4467 (and tp!10898 e!81329))))

(declare-fun mapRest!4468 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapValue!4467 () ValueCell!1073)

(declare-fun mapKey!4467 () (_ BitVec 32))

(assert (=> mapNonEmpty!4467 (= (arr!2207 (_values!2746 newMap!16)) (store mapRest!4468 mapKey!4467 mapValue!4467))))

(declare-fun b!124452 () Bool)

(assert (=> b!124452 (= e!81341 (and e!81333 mapRes!4467))))

(declare-fun condMapEmpty!4468 () Bool)

(declare-fun mapDefault!4468 () ValueCell!1073)

(assert (=> b!124452 (= condMapEmpty!4468 (= (arr!2207 (_values!2746 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4468)))))

(declare-fun b!124453 () Bool)

(assert (=> b!124453 (= e!81332 tp_is_empty!2833)))

(declare-fun b!124454 () Bool)

(assert (=> b!124454 (= e!81330 e!81337)))

(declare-fun res!60285 () Bool)

(assert (=> b!124454 (=> (not res!60285) (not e!81337))))

(declare-fun contains!863 (ListLongMap!1643 (_ BitVec 64)) Bool)

(assert (=> b!124454 (= res!60285 (contains!863 lt!63929 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2536 0))(
  ( (tuple2!2537 (_1!1279 Bool) (_2!1279 LongMapFixedSize!1054)) )
))
(declare-fun lt!63928 () tuple2!2536)

(declare-fun update!181 (LongMapFixedSize!1054 (_ BitVec 64) V!3425) tuple2!2536)

(declare-fun get!1435 (ValueCell!1073 V!3425) V!3425)

(declare-fun dynLambda!407 (Int (_ BitVec 64)) V!3425)

(assert (=> b!124454 (= lt!63928 (update!181 newMap!16 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!124455 () Bool)

(declare-fun res!60282 () Bool)

(assert (=> b!124455 (=> (not res!60282) (not e!81338))))

(declare-fun valid!506 (LongMapFixedSize!1054) Bool)

(assert (=> b!124455 (= res!60282 (valid!506 newMap!16))))

(declare-fun mapNonEmpty!4468 () Bool)

(declare-fun tp!10897 () Bool)

(assert (=> mapNonEmpty!4468 (= mapRes!4468 (and tp!10897 e!81336))))

(declare-fun mapKey!4468 () (_ BitVec 32))

(declare-fun mapRest!4467 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapValue!4468 () ValueCell!1073)

(assert (=> mapNonEmpty!4468 (= (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (store mapRest!4467 mapKey!4468 mapValue!4468))))

(declare-fun b!124456 () Bool)

(declare-fun res!60284 () Bool)

(assert (=> b!124456 (=> (not res!60284) (not e!81338))))

(assert (=> b!124456 (= res!60284 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7008 newMap!16)) (_size!576 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!124457 () Bool)

(declare-fun res!60283 () Bool)

(assert (=> b!124457 (=> (not res!60283) (not e!81337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!124457 (= res!60283 (validMask!0 (mask!7008 (v!3101 (underlying!432 thiss!992)))))))

(assert (= (and start!13550 res!60281) b!124448))

(assert (= (and b!124448 res!60279) b!124455))

(assert (= (and b!124455 res!60282) b!124456))

(assert (= (and b!124456 res!60284) b!124446))

(assert (= (and b!124446 res!60280) b!124454))

(assert (= (and b!124454 res!60285) b!124457))

(assert (= (and b!124457 res!60283) b!124441))

(assert (= (and b!124451 condMapEmpty!4467) mapIsEmpty!4467))

(assert (= (and b!124451 (not condMapEmpty!4467)) mapNonEmpty!4468))

(get-info :version)

(assert (= (and mapNonEmpty!4468 ((_ is ValueCellFull!1073) mapValue!4468)) b!124450))

(assert (= (and b!124451 ((_ is ValueCellFull!1073) mapDefault!4467)) b!124453))

(assert (= b!124442 b!124451))

(assert (= b!124444 b!124442))

(assert (= b!124449 b!124444))

(assert (= start!13550 b!124449))

(assert (= (and b!124452 condMapEmpty!4468) mapIsEmpty!4468))

(assert (= (and b!124452 (not condMapEmpty!4468)) mapNonEmpty!4467))

(assert (= (and mapNonEmpty!4467 ((_ is ValueCellFull!1073) mapValue!4467)) b!124447))

(assert (= (and b!124452 ((_ is ValueCellFull!1073) mapDefault!4468)) b!124443))

(assert (= b!124445 b!124452))

(assert (= start!13550 b!124445))

(declare-fun b_lambda!5455 () Bool)

(assert (=> (not b_lambda!5455) (not b!124454)))

(declare-fun t!6004 () Bool)

(declare-fun tb!2281 () Bool)

(assert (=> (and b!124442 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))) t!6004) tb!2281))

(declare-fun result!3795 () Bool)

(assert (=> tb!2281 (= result!3795 tp_is_empty!2833)))

(assert (=> b!124454 t!6004))

(declare-fun b_and!7633 () Bool)

(assert (= b_and!7629 (and (=> t!6004 result!3795) b_and!7633)))

(declare-fun t!6006 () Bool)

(declare-fun tb!2283 () Bool)

(assert (=> (and b!124445 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))) t!6006) tb!2283))

(declare-fun result!3799 () Bool)

(assert (= result!3799 result!3795))

(assert (=> b!124454 t!6006))

(declare-fun b_and!7635 () Bool)

(assert (= b_and!7631 (and (=> t!6006 result!3799) b_and!7635)))

(declare-fun m!144399 () Bool)

(assert (=> b!124442 m!144399))

(declare-fun m!144401 () Bool)

(assert (=> b!124442 m!144401))

(declare-fun m!144403 () Bool)

(assert (=> b!124445 m!144403))

(declare-fun m!144405 () Bool)

(assert (=> b!124445 m!144405))

(declare-fun m!144407 () Bool)

(assert (=> b!124446 m!144407))

(declare-fun m!144409 () Bool)

(assert (=> b!124446 m!144409))

(declare-fun m!144411 () Bool)

(assert (=> b!124446 m!144411))

(declare-fun m!144413 () Bool)

(assert (=> b!124455 m!144413))

(declare-fun m!144415 () Bool)

(assert (=> b!124454 m!144415))

(declare-fun m!144417 () Bool)

(assert (=> b!124454 m!144417))

(declare-fun m!144419 () Bool)

(assert (=> b!124454 m!144419))

(assert (=> b!124454 m!144407))

(assert (=> b!124454 m!144407))

(declare-fun m!144421 () Bool)

(assert (=> b!124454 m!144421))

(assert (=> b!124454 m!144417))

(assert (=> b!124454 m!144407))

(assert (=> b!124454 m!144419))

(declare-fun m!144423 () Bool)

(assert (=> b!124454 m!144423))

(assert (=> b!124454 m!144415))

(declare-fun m!144425 () Bool)

(assert (=> mapNonEmpty!4467 m!144425))

(declare-fun m!144427 () Bool)

(assert (=> start!13550 m!144427))

(declare-fun m!144429 () Bool)

(assert (=> mapNonEmpty!4468 m!144429))

(declare-fun m!144431 () Bool)

(assert (=> b!124457 m!144431))

(check-sat (not b!124445) (not b!124454) (not b!124457) (not b_next!2833) (not b!124442) tp_is_empty!2833 b_and!7635 (not mapNonEmpty!4468) (not b_lambda!5455) b_and!7633 (not b_next!2835) (not start!13550) (not b!124446) (not b!124455) (not mapNonEmpty!4467))
(check-sat b_and!7633 b_and!7635 (not b_next!2833) (not b_next!2835))
(get-model)

(declare-fun b_lambda!5461 () Bool)

(assert (= b_lambda!5455 (or (and b!124442 b_free!2833) (and b!124445 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))))) b_lambda!5461)))

(check-sat (not b!124445) (not b!124454) (not b!124457) (not b_next!2833) (not b!124442) tp_is_empty!2833 b_and!7635 (not mapNonEmpty!4468) b_and!7633 (not b_next!2835) (not b_lambda!5461) (not start!13550) (not b!124446) (not b!124455) (not mapNonEmpty!4467))
(check-sat b_and!7633 b_and!7635 (not b_next!2833) (not b_next!2835))
(get-model)

(declare-fun d!37381 () Bool)

(assert (=> d!37381 (= (array_inv!1403 (_keys!4491 newMap!16)) (bvsge (size!2470 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124445 d!37381))

(declare-fun d!37383 () Bool)

(assert (=> d!37383 (= (array_inv!1404 (_values!2746 newMap!16)) (bvsge (size!2471 (_values!2746 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124445 d!37383))

(declare-fun d!37385 () Bool)

(declare-fun e!81436 () Bool)

(assert (=> d!37385 e!81436))

(declare-fun res!60330 () Bool)

(assert (=> d!37385 (=> res!60330 e!81436)))

(declare-fun lt!63956 () Bool)

(assert (=> d!37385 (= res!60330 (not lt!63956))))

(declare-fun lt!63959 () Bool)

(assert (=> d!37385 (= lt!63956 lt!63959)))

(declare-datatypes ((Unit!3865 0))(
  ( (Unit!3866) )
))
(declare-fun lt!63958 () Unit!3865)

(declare-fun e!81437 () Unit!3865)

(assert (=> d!37385 (= lt!63958 e!81437)))

(declare-fun c!22647 () Bool)

(assert (=> d!37385 (= c!22647 lt!63959)))

(declare-fun containsKey!168 (List!1689 (_ BitVec 64)) Bool)

(assert (=> d!37385 (= lt!63959 (containsKey!168 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!37385 (= (contains!863 lt!63929 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) lt!63956)))

(declare-fun b!124572 () Bool)

(declare-fun lt!63957 () Unit!3865)

(assert (=> b!124572 (= e!81437 lt!63957)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!117 (List!1689 (_ BitVec 64)) Unit!3865)

(assert (=> b!124572 (= lt!63957 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-datatypes ((Option!170 0))(
  ( (Some!169 (v!3107 V!3425)) (None!168) )
))
(declare-fun isDefined!118 (Option!170) Bool)

(declare-fun getValueByKey!164 (List!1689 (_ BitVec 64)) Option!170)

(assert (=> b!124572 (isDefined!118 (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun b!124573 () Bool)

(declare-fun Unit!3867 () Unit!3865)

(assert (=> b!124573 (= e!81437 Unit!3867)))

(declare-fun b!124574 () Bool)

(assert (=> b!124574 (= e!81436 (isDefined!118 (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (= (and d!37385 c!22647) b!124572))

(assert (= (and d!37385 (not c!22647)) b!124573))

(assert (= (and d!37385 (not res!60330)) b!124574))

(assert (=> d!37385 m!144407))

(declare-fun m!144501 () Bool)

(assert (=> d!37385 m!144501))

(assert (=> b!124572 m!144407))

(declare-fun m!144503 () Bool)

(assert (=> b!124572 m!144503))

(assert (=> b!124572 m!144407))

(declare-fun m!144505 () Bool)

(assert (=> b!124572 m!144505))

(assert (=> b!124572 m!144505))

(declare-fun m!144507 () Bool)

(assert (=> b!124572 m!144507))

(assert (=> b!124574 m!144407))

(assert (=> b!124574 m!144505))

(assert (=> b!124574 m!144505))

(assert (=> b!124574 m!144507))

(assert (=> b!124454 d!37385))

(declare-fun bm!13296 () Bool)

(declare-datatypes ((SeekEntryResult!272 0))(
  ( (MissingZero!272 (index!3242 (_ BitVec 32))) (Found!272 (index!3243 (_ BitVec 32))) (Intermediate!272 (undefined!1084 Bool) (index!3244 (_ BitVec 32)) (x!14820 (_ BitVec 32))) (Undefined!272) (MissingVacant!272 (index!3245 (_ BitVec 32))) )
))
(declare-fun call!13302 () SeekEntryResult!272)

(declare-fun call!13315 () SeekEntryResult!272)

(assert (=> bm!13296 (= call!13302 call!13315)))

(declare-fun b!124655 () Bool)

(declare-fun e!81492 () Bool)

(declare-fun call!13307 () Bool)

(assert (=> b!124655 (= e!81492 (not call!13307))))

(declare-fun bm!13297 () Bool)

(declare-fun call!13321 () SeekEntryResult!272)

(assert (=> bm!13297 (= call!13321 call!13315)))

(declare-fun bm!13298 () Bool)

(declare-fun call!13320 () ListLongMap!1643)

(assert (=> bm!13298 (= call!13320 (map!1365 newMap!16))))

(declare-fun b!124656 () Bool)

(declare-fun e!81497 () Bool)

(declare-fun lt!64020 () SeekEntryResult!272)

(assert (=> b!124656 (= e!81497 ((_ is Undefined!272) lt!64020))))

(declare-fun b!124658 () Bool)

(declare-fun lt!64015 () tuple2!2536)

(declare-fun call!13303 () tuple2!2536)

(assert (=> b!124658 (= lt!64015 call!13303)))

(declare-fun e!81490 () tuple2!2536)

(assert (=> b!124658 (= e!81490 (tuple2!2537 (_1!1279 lt!64015) (_2!1279 lt!64015)))))

(declare-fun b!124659 () Bool)

(declare-fun e!81487 () Bool)

(declare-fun e!81484 () Bool)

(assert (=> b!124659 (= e!81487 e!81484)))

(declare-fun call!13306 () ListLongMap!1643)

(declare-fun res!60360 () Bool)

(assert (=> b!124659 (= res!60360 (contains!863 call!13306 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> b!124659 (=> (not res!60360) (not e!81484))))

(declare-fun b!124660 () Bool)

(declare-fun e!81500 () Bool)

(declare-fun call!13305 () Bool)

(assert (=> b!124660 (= e!81500 (not call!13305))))

(declare-fun b!124661 () Bool)

(declare-fun c!22680 () Bool)

(declare-fun lt!64034 () SeekEntryResult!272)

(assert (=> b!124661 (= c!22680 ((_ is MissingVacant!272) lt!64034))))

(declare-fun e!81482 () Bool)

(declare-fun e!81499 () Bool)

(assert (=> b!124661 (= e!81482 e!81499)))

(declare-fun b!124662 () Bool)

(declare-fun e!81496 () Bool)

(assert (=> b!124662 (= e!81496 e!81487)))

(declare-fun c!22676 () Bool)

(declare-fun lt!64023 () tuple2!2536)

(assert (=> b!124662 (= c!22676 (_1!1279 lt!64023))))

(declare-fun b!124663 () Bool)

(declare-fun e!81495 () tuple2!2536)

(declare-fun e!81485 () tuple2!2536)

(assert (=> b!124663 (= e!81495 e!81485)))

(declare-fun c!22684 () Bool)

(assert (=> b!124663 (= c!22684 (= (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13299 () Bool)

(declare-fun call!13304 () Unit!3865)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) Int) Unit!3865)

(assert (=> bm!13299 (= call!13304 (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(declare-fun b!124664 () Bool)

(declare-fun res!60366 () Bool)

(declare-fun call!13310 () Bool)

(assert (=> b!124664 (= res!60366 call!13310)))

(declare-fun e!81493 () Bool)

(assert (=> b!124664 (=> (not res!60366) (not e!81493))))

(declare-fun bm!13300 () Bool)

(assert (=> bm!13300 (= call!13306 (map!1365 (_2!1279 lt!64023)))))

(declare-fun b!124665 () Bool)

(declare-fun res!60364 () Bool)

(declare-fun e!81483 () Bool)

(assert (=> b!124665 (=> (not res!60364) (not e!81483))))

(assert (=> b!124665 (= res!60364 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3242 lt!64020)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13301 () Bool)

(declare-fun call!13313 () Bool)

(assert (=> bm!13301 (= call!13310 call!13313)))

(declare-fun b!124666 () Bool)

(declare-fun res!60365 () Bool)

(assert (=> b!124666 (=> (not res!60365) (not e!81500))))

(assert (=> b!124666 (= res!60365 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3242 lt!64034)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124667 () Bool)

(declare-fun +!157 (ListLongMap!1643 tuple2!2534) ListLongMap!1643)

(assert (=> b!124667 (= e!81484 (= call!13306 (+!157 call!13320 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!124668 () Bool)

(declare-fun res!60372 () Bool)

(declare-fun call!13318 () Bool)

(assert (=> b!124668 (= res!60372 call!13318)))

(declare-fun e!81491 () Bool)

(assert (=> b!124668 (=> (not res!60372) (not e!81491))))

(declare-fun b!124669 () Bool)

(declare-fun res!60363 () Bool)

(assert (=> b!124669 (= res!60363 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3245 lt!64020)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124669 (=> (not res!60363) (not e!81492))))

(declare-fun b!124670 () Bool)

(declare-fun res!60367 () Bool)

(assert (=> b!124670 (=> (not res!60367) (not e!81500))))

(declare-fun call!13300 () Bool)

(assert (=> b!124670 (= res!60367 call!13300)))

(assert (=> b!124670 (= e!81482 e!81500)))

(declare-fun b!124671 () Bool)

(declare-fun res!60370 () Bool)

(assert (=> b!124671 (=> (not res!60370) (not e!81483))))

(declare-fun call!13301 () Bool)

(assert (=> b!124671 (= res!60370 call!13301)))

(declare-fun e!81480 () Bool)

(assert (=> b!124671 (= e!81480 e!81483)))

(declare-fun b!124672 () Bool)

(declare-fun e!81498 () tuple2!2536)

(assert (=> b!124672 (= e!81495 e!81498)))

(declare-fun lt!64028 () SeekEntryResult!272)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4661 (_ BitVec 32)) SeekEntryResult!272)

(assert (=> b!124672 (= lt!64028 (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun c!22682 () Bool)

(assert (=> b!124672 (= c!22682 ((_ is Undefined!272) lt!64028))))

(declare-fun b!124673 () Bool)

(assert (=> b!124673 (= e!81497 e!81492)))

(declare-fun res!60369 () Bool)

(assert (=> b!124673 (= res!60369 call!13301)))

(assert (=> b!124673 (=> (not res!60369) (not e!81492))))

(declare-fun bm!13302 () Bool)

(assert (=> bm!13302 (= call!13318 call!13313)))

(declare-fun b!124674 () Bool)

(declare-fun e!81486 () ListLongMap!1643)

(declare-fun call!13311 () ListLongMap!1643)

(assert (=> b!124674 (= e!81486 call!13311)))

(declare-fun lt!64029 () SeekEntryResult!272)

(declare-fun c!22675 () Bool)

(declare-fun lt!64036 () SeekEntryResult!272)

(declare-fun bm!13303 () Bool)

(declare-fun c!22683 () Bool)

(declare-fun c!22674 () Bool)

(declare-fun c!22679 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13303 (= call!13313 (inRange!0 (ite c!22682 (ite c!22674 (index!3243 lt!64029) (ite c!22683 (index!3242 lt!64034) (index!3245 lt!64034))) (ite c!22679 (index!3243 lt!64036) (ite c!22675 (index!3242 lt!64020) (index!3245 lt!64020)))) (mask!7008 newMap!16)))))

(declare-fun b!124675 () Bool)

(declare-fun res!60362 () Bool)

(assert (=> b!124675 (= res!60362 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3245 lt!64034)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81489 () Bool)

(assert (=> b!124675 (=> (not res!60362) (not e!81489))))

(declare-fun b!124676 () Bool)

(declare-fun lt!64027 () Unit!3865)

(declare-fun lt!64039 () Unit!3865)

(assert (=> b!124676 (= lt!64027 lt!64039)))

(declare-fun call!13316 () Bool)

(assert (=> b!124676 call!13316))

(declare-fun lt!64032 () array!4663)

(declare-fun lemmaValidKeyInArrayIsInListMap!114 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) Int) Unit!3865)

(assert (=> b!124676 (= lt!64039 (lemmaValidKeyInArrayIsInListMap!114 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3243 lt!64028) (defaultEntry!2763 newMap!16)))))

(assert (=> b!124676 (= lt!64032 (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))))

(declare-fun lt!64037 () Unit!3865)

(declare-fun lt!64025 () Unit!3865)

(assert (=> b!124676 (= lt!64037 lt!64025)))

(declare-fun call!13317 () ListLongMap!1643)

(declare-fun call!13314 () ListLongMap!1643)

(assert (=> b!124676 (= call!13317 call!13314)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) (_ BitVec 64) V!3425 Int) Unit!3865)

(assert (=> b!124676 (= lt!64025 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3243 lt!64028) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64031 () Unit!3865)

(declare-fun e!81494 () Unit!3865)

(assert (=> b!124676 (= lt!64031 e!81494)))

(assert (=> b!124676 (= c!22679 (contains!863 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> b!124676 (= e!81490 (tuple2!2537 true (LongMapFixedSize!1055 (defaultEntry!2763 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (_size!576 newMap!16) (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (_vacant!576 newMap!16))))))

(declare-fun b!124677 () Bool)

(declare-fun lt!64021 () Unit!3865)

(declare-fun lt!64033 () Unit!3865)

(assert (=> b!124677 (= lt!64021 lt!64033)))

(declare-fun call!13299 () ListLongMap!1643)

(declare-fun call!13308 () ListLongMap!1643)

(assert (=> b!124677 (= call!13299 call!13308)))

(declare-fun lt!64040 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 V!3425 Int) Unit!3865)

(assert (=> b!124677 (= lt!64033 (lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(assert (=> b!124677 (= lt!64040 (bvor (extraKeys!2548 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!124677 (= e!81485 (tuple2!2537 true (LongMapFixedSize!1055 (defaultEntry!2763 newMap!16) (mask!7008 newMap!16) (bvor (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!576 newMap!16) (_keys!4491 newMap!16) (_values!2746 newMap!16) (_vacant!576 newMap!16))))))

(declare-fun bm!13304 () Bool)

(declare-fun call!13309 () Bool)

(assert (=> bm!13304 (= call!13305 call!13309)))

(declare-fun bm!13305 () Bool)

(assert (=> bm!13305 (= call!13301 call!13310)))

(declare-fun b!124678 () Bool)

(assert (=> b!124678 (= e!81489 (not call!13305))))

(declare-fun b!124679 () Bool)

(declare-fun lt!64022 () Unit!3865)

(declare-fun lt!64030 () Unit!3865)

(assert (=> b!124679 (= lt!64022 lt!64030)))

(assert (=> b!124679 (= call!13299 call!13308)))

(declare-fun lt!64018 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!55 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 V!3425 Int) Unit!3865)

(assert (=> b!124679 (= lt!64030 (lemmaChangeZeroKeyThenAddPairToListMap!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) lt!64018 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (defaultEntry!2763 newMap!16)))))

(assert (=> b!124679 (= lt!64018 (bvor (extraKeys!2548 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!124679 (= e!81485 (tuple2!2537 true (LongMapFixedSize!1055 (defaultEntry!2763 newMap!16) (mask!7008 newMap!16) (bvor (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (_size!576 newMap!16) (_keys!4491 newMap!16) (_values!2746 newMap!16) (_vacant!576 newMap!16))))))

(declare-fun b!124680 () Bool)

(assert (=> b!124680 (= e!81486 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!124681 () Bool)

(declare-fun e!81488 () Unit!3865)

(declare-fun lt!64026 () Unit!3865)

(assert (=> b!124681 (= e!81488 lt!64026)))

(declare-fun call!13312 () Unit!3865)

(assert (=> b!124681 (= lt!64026 call!13312)))

(assert (=> b!124681 (= lt!64034 call!13302)))

(assert (=> b!124681 (= c!22683 ((_ is MissingZero!272) lt!64034))))

(assert (=> b!124681 e!81482))

(declare-fun c!22681 () Bool)

(declare-fun bm!13306 () Bool)

(assert (=> bm!13306 (= call!13317 (+!157 e!81486 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!22686 () Bool)

(assert (=> bm!13306 (= c!22686 c!22681)))

(declare-fun bm!13307 () Bool)

(declare-fun call!13322 () ListLongMap!1643)

(assert (=> bm!13307 (= call!13322 (getCurrentListMap!507 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!124682 () Bool)

(declare-fun e!81481 () tuple2!2536)

(declare-fun lt!64019 () tuple2!2536)

(assert (=> b!124682 (= e!81481 (tuple2!2537 (_1!1279 lt!64019) (_2!1279 lt!64019)))))

(assert (=> b!124682 (= lt!64019 call!13303)))

(declare-fun b!124683 () Bool)

(declare-fun lt!64017 () Unit!3865)

(assert (=> b!124683 (= e!81494 lt!64017)))

(assert (=> b!124683 (= lt!64017 call!13304)))

(assert (=> b!124683 (= lt!64036 call!13321)))

(declare-fun res!60359 () Bool)

(assert (=> b!124683 (= res!60359 ((_ is Found!272) lt!64036))))

(assert (=> b!124683 (=> (not res!60359) (not e!81493))))

(assert (=> b!124683 e!81493))

(declare-fun bm!13308 () Bool)

(assert (=> bm!13308 (= call!13311 call!13322)))

(declare-fun b!124684 () Bool)

(assert (=> b!124684 (= e!81487 (= call!13306 call!13320))))

(declare-fun b!124685 () Bool)

(assert (=> b!124685 (= e!81491 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64029)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun b!124686 () Bool)

(declare-fun lt!64038 () Unit!3865)

(assert (=> b!124686 (= lt!64038 e!81488)))

(assert (=> b!124686 (= c!22674 call!13316)))

(assert (=> b!124686 (= e!81498 (tuple2!2537 false newMap!16))))

(declare-fun bm!13309 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) Int) Unit!3865)

(assert (=> bm!13309 (= call!13312 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(declare-fun bm!13310 () Bool)

(declare-fun arrayContainsKey!0 (array!4661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13310 (= call!13309 (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!13311 () Bool)

(assert (=> bm!13311 (= call!13300 call!13318)))

(declare-fun b!124687 () Bool)

(assert (=> b!124687 (= e!81499 ((_ is Undefined!272) lt!64034))))

(declare-fun b!124688 () Bool)

(assert (=> b!124688 (= e!81499 e!81489)))

(declare-fun res!60361 () Bool)

(assert (=> b!124688 (= res!60361 call!13300)))

(assert (=> b!124688 (=> (not res!60361) (not e!81489))))

(declare-fun b!124689 () Bool)

(assert (=> b!124689 (= e!81481 e!81490)))

(declare-fun c!22678 () Bool)

(assert (=> b!124689 (= c!22678 ((_ is MissingZero!272) lt!64028))))

(declare-fun bm!13312 () Bool)

(assert (=> bm!13312 (= call!13314 (getCurrentListMap!507 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun c!22685 () Bool)

(declare-fun bm!13313 () Bool)

(declare-fun updateHelperNewKey!55 (LongMapFixedSize!1054 (_ BitVec 64) V!3425 (_ BitVec 32)) tuple2!2536)

(assert (=> bm!13313 (= call!13303 (updateHelperNewKey!55 newMap!16 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))))))

(declare-fun b!124690 () Bool)

(declare-fun Unit!3868 () Unit!3865)

(assert (=> b!124690 (= e!81488 Unit!3868)))

(declare-fun lt!64024 () Unit!3865)

(assert (=> b!124690 (= lt!64024 call!13304)))

(assert (=> b!124690 (= lt!64029 call!13302)))

(declare-fun res!60368 () Bool)

(assert (=> b!124690 (= res!60368 ((_ is Found!272) lt!64029))))

(assert (=> b!124690 (=> (not res!60368) (not e!81491))))

(assert (=> b!124690 e!81491))

(declare-fun lt!64016 () Unit!3865)

(assert (=> b!124690 (= lt!64016 lt!64024)))

(assert (=> b!124690 false))

(declare-fun b!124691 () Bool)

(declare-fun c!22677 () Bool)

(assert (=> b!124691 (= c!22677 ((_ is MissingVacant!272) lt!64020))))

(assert (=> b!124691 (= e!81480 e!81497)))

(declare-fun bm!13314 () Bool)

(assert (=> bm!13314 (= call!13307 call!13309)))

(declare-fun bm!13315 () Bool)

(assert (=> bm!13315 (= call!13299 call!13317)))

(declare-fun bm!13316 () Bool)

(declare-fun call!13319 () ListLongMap!1643)

(assert (=> bm!13316 (= call!13316 (contains!863 call!13319 (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(declare-fun b!124692 () Bool)

(assert (=> b!124692 (= e!81493 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64036)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun d!37387 () Bool)

(assert (=> d!37387 e!81496))

(declare-fun res!60371 () Bool)

(assert (=> d!37387 (=> (not res!60371) (not e!81496))))

(assert (=> d!37387 (= res!60371 (valid!506 (_2!1279 lt!64023)))))

(assert (=> d!37387 (= lt!64023 e!81495)))

(assert (=> d!37387 (= c!22681 (= (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (bvneg (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (=> d!37387 (valid!506 newMap!16)))

(assert (=> d!37387 (= (update!181 newMap!16 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!64023)))

(declare-fun b!124657 () Bool)

(declare-fun Unit!3869 () Unit!3865)

(assert (=> b!124657 (= e!81494 Unit!3869)))

(declare-fun lt!64014 () Unit!3865)

(assert (=> b!124657 (= lt!64014 call!13312)))

(assert (=> b!124657 (= lt!64020 call!13321)))

(assert (=> b!124657 (= c!22675 ((_ is MissingZero!272) lt!64020))))

(assert (=> b!124657 e!81480))

(declare-fun lt!64035 () Unit!3865)

(assert (=> b!124657 (= lt!64035 lt!64014)))

(assert (=> b!124657 false))

(declare-fun bm!13317 () Bool)

(assert (=> bm!13317 (= call!13315 (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun b!124693 () Bool)

(assert (=> b!124693 (= e!81483 (not call!13307))))

(declare-fun b!124694 () Bool)

(assert (=> b!124694 (= c!22685 ((_ is MissingVacant!272) lt!64028))))

(assert (=> b!124694 (= e!81498 e!81481)))

(declare-fun bm!13318 () Bool)

(assert (=> bm!13318 (= call!13308 call!13314)))

(declare-fun bm!13319 () Bool)

(assert (=> bm!13319 (= call!13319 call!13322)))

(assert (= (and d!37387 c!22681) b!124663))

(assert (= (and d!37387 (not c!22681)) b!124672))

(assert (= (and b!124663 c!22684) b!124679))

(assert (= (and b!124663 (not c!22684)) b!124677))

(assert (= (or b!124679 b!124677) bm!13308))

(assert (= (or b!124679 b!124677) bm!13318))

(assert (= (or b!124679 b!124677) bm!13315))

(assert (= (and b!124672 c!22682) b!124686))

(assert (= (and b!124672 (not c!22682)) b!124694))

(assert (= (and b!124686 c!22674) b!124690))

(assert (= (and b!124686 (not c!22674)) b!124681))

(assert (= (and b!124690 res!60368) b!124668))

(assert (= (and b!124668 res!60372) b!124685))

(assert (= (and b!124681 c!22683) b!124670))

(assert (= (and b!124681 (not c!22683)) b!124661))

(assert (= (and b!124670 res!60367) b!124666))

(assert (= (and b!124666 res!60365) b!124660))

(assert (= (and b!124661 c!22680) b!124688))

(assert (= (and b!124661 (not c!22680)) b!124687))

(assert (= (and b!124688 res!60361) b!124675))

(assert (= (and b!124675 res!60362) b!124678))

(assert (= (or b!124670 b!124688) bm!13311))

(assert (= (or b!124660 b!124678) bm!13304))

(assert (= (or b!124668 bm!13311) bm!13302))

(assert (= (or b!124690 b!124681) bm!13296))

(assert (= (and b!124694 c!22685) b!124682))

(assert (= (and b!124694 (not c!22685)) b!124689))

(assert (= (and b!124689 c!22678) b!124658))

(assert (= (and b!124689 (not c!22678)) b!124676))

(assert (= (and b!124676 c!22679) b!124683))

(assert (= (and b!124676 (not c!22679)) b!124657))

(assert (= (and b!124683 res!60359) b!124664))

(assert (= (and b!124664 res!60366) b!124692))

(assert (= (and b!124657 c!22675) b!124671))

(assert (= (and b!124657 (not c!22675)) b!124691))

(assert (= (and b!124671 res!60370) b!124665))

(assert (= (and b!124665 res!60364) b!124693))

(assert (= (and b!124691 c!22677) b!124673))

(assert (= (and b!124691 (not c!22677)) b!124656))

(assert (= (and b!124673 res!60369) b!124669))

(assert (= (and b!124669 res!60363) b!124655))

(assert (= (or b!124671 b!124673) bm!13305))

(assert (= (or b!124693 b!124655) bm!13314))

(assert (= (or b!124664 bm!13305) bm!13301))

(assert (= (or b!124683 b!124657) bm!13297))

(assert (= (or b!124682 b!124658) bm!13313))

(assert (= (or bm!13304 bm!13314) bm!13310))

(assert (= (or b!124681 b!124657) bm!13309))

(assert (= (or b!124690 b!124683) bm!13299))

(assert (= (or b!124686 b!124676) bm!13319))

(assert (= (or bm!13296 bm!13297) bm!13317))

(assert (= (or bm!13302 bm!13301) bm!13303))

(assert (= (or b!124686 b!124676) bm!13316))

(assert (= (or bm!13308 bm!13319) bm!13307))

(assert (= (or bm!13318 b!124676) bm!13312))

(assert (= (or bm!13315 b!124676) bm!13306))

(assert (= (and bm!13306 c!22686) b!124674))

(assert (= (and bm!13306 (not c!22686)) b!124680))

(assert (= (and d!37387 res!60371) b!124662))

(assert (= (and b!124662 c!22676) b!124659))

(assert (= (and b!124662 (not c!22676)) b!124684))

(assert (= (and b!124659 res!60360) b!124667))

(assert (= (or b!124659 b!124667 b!124684) bm!13300))

(assert (= (or b!124667 b!124684) bm!13298))

(assert (=> b!124672 m!144407))

(declare-fun m!144509 () Bool)

(assert (=> b!124672 m!144509))

(declare-fun m!144511 () Bool)

(assert (=> b!124685 m!144511))

(declare-fun m!144513 () Bool)

(assert (=> b!124666 m!144513))

(declare-fun m!144515 () Bool)

(assert (=> b!124667 m!144515))

(assert (=> bm!13310 m!144407))

(declare-fun m!144517 () Bool)

(assert (=> bm!13310 m!144517))

(assert (=> bm!13298 m!144409))

(assert (=> bm!13313 m!144407))

(assert (=> bm!13313 m!144419))

(declare-fun m!144519 () Bool)

(assert (=> bm!13313 m!144519))

(declare-fun m!144521 () Bool)

(assert (=> bm!13312 m!144521))

(declare-fun m!144523 () Bool)

(assert (=> bm!13312 m!144523))

(declare-fun m!144525 () Bool)

(assert (=> bm!13300 m!144525))

(declare-fun m!144527 () Bool)

(assert (=> b!124680 m!144527))

(assert (=> b!124677 m!144419))

(declare-fun m!144529 () Bool)

(assert (=> b!124677 m!144529))

(declare-fun m!144531 () Bool)

(assert (=> b!124692 m!144531))

(declare-fun m!144533 () Bool)

(assert (=> b!124675 m!144533))

(declare-fun m!144535 () Bool)

(assert (=> b!124669 m!144535))

(assert (=> b!124659 m!144407))

(declare-fun m!144537 () Bool)

(assert (=> b!124659 m!144537))

(assert (=> bm!13317 m!144407))

(assert (=> bm!13317 m!144509))

(assert (=> b!124676 m!144527))

(assert (=> b!124676 m!144407))

(declare-fun m!144539 () Bool)

(assert (=> b!124676 m!144539))

(assert (=> b!124676 m!144521))

(assert (=> b!124676 m!144527))

(declare-fun m!144541 () Bool)

(assert (=> b!124676 m!144541))

(assert (=> b!124676 m!144407))

(assert (=> b!124676 m!144419))

(declare-fun m!144543 () Bool)

(assert (=> b!124676 m!144543))

(declare-fun m!144545 () Bool)

(assert (=> bm!13306 m!144545))

(declare-fun m!144547 () Bool)

(assert (=> bm!13307 m!144547))

(assert (=> bm!13299 m!144407))

(declare-fun m!144549 () Bool)

(assert (=> bm!13299 m!144549))

(declare-fun m!144551 () Bool)

(assert (=> d!37387 m!144551))

(assert (=> d!37387 m!144413))

(declare-fun m!144553 () Bool)

(assert (=> bm!13303 m!144553))

(assert (=> bm!13309 m!144407))

(declare-fun m!144555 () Bool)

(assert (=> bm!13309 m!144555))

(declare-fun m!144557 () Bool)

(assert (=> b!124665 m!144557))

(declare-fun m!144559 () Bool)

(assert (=> bm!13316 m!144559))

(declare-fun m!144561 () Bool)

(assert (=> bm!13316 m!144561))

(assert (=> b!124679 m!144419))

(declare-fun m!144563 () Bool)

(assert (=> b!124679 m!144563))

(assert (=> b!124454 d!37387))

(declare-fun d!37389 () Bool)

(declare-fun c!22689 () Bool)

(assert (=> d!37389 (= c!22689 ((_ is ValueCellFull!1073) (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun e!81503 () V!3425)

(assert (=> d!37389 (= (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81503)))

(declare-fun b!124699 () Bool)

(declare-fun get!1437 (ValueCell!1073 V!3425) V!3425)

(assert (=> b!124699 (= e!81503 (get!1437 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124700 () Bool)

(declare-fun get!1438 (ValueCell!1073 V!3425) V!3425)

(assert (=> b!124700 (= e!81503 (get!1438 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37389 c!22689) b!124699))

(assert (= (and d!37389 (not c!22689)) b!124700))

(assert (=> b!124699 m!144415))

(assert (=> b!124699 m!144417))

(declare-fun m!144565 () Bool)

(assert (=> b!124699 m!144565))

(assert (=> b!124700 m!144415))

(assert (=> b!124700 m!144417))

(declare-fun m!144567 () Bool)

(assert (=> b!124700 m!144567))

(assert (=> b!124454 d!37389))

(declare-fun d!37391 () Bool)

(assert (=> d!37391 (= (validMask!0 (mask!7008 (v!3101 (underlying!432 thiss!992)))) (and (or (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000001111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000011111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000001111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000011111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000001111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000011111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000001111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000011111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000001111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000011111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000001111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000011111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000001111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000011111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000111111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000001111111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000011111111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000111111111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00001111111111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00011111111111111111111111111111) (= (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!124457 d!37391))

(declare-fun d!37393 () Bool)

(assert (=> d!37393 (= (valid!505 thiss!992) (valid!506 (v!3101 (underlying!432 thiss!992))))))

(declare-fun bs!5145 () Bool)

(assert (= bs!5145 d!37393))

(declare-fun m!144569 () Bool)

(assert (=> bs!5145 m!144569))

(assert (=> start!13550 d!37393))

(declare-fun d!37395 () Bool)

(assert (=> d!37395 (= (array_inv!1403 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvsge (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124442 d!37395))

(declare-fun d!37397 () Bool)

(assert (=> d!37397 (= (array_inv!1404 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvsge (size!2471 (_values!2746 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!124442 d!37397))

(declare-fun d!37399 () Bool)

(declare-fun res!60379 () Bool)

(declare-fun e!81506 () Bool)

(assert (=> d!37399 (=> (not res!60379) (not e!81506))))

(declare-fun simpleValid!86 (LongMapFixedSize!1054) Bool)

(assert (=> d!37399 (= res!60379 (simpleValid!86 newMap!16))))

(assert (=> d!37399 (= (valid!506 newMap!16) e!81506)))

(declare-fun b!124707 () Bool)

(declare-fun res!60380 () Bool)

(assert (=> b!124707 (=> (not res!60380) (not e!81506))))

(declare-fun arrayCountValidKeys!0 (array!4661 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!124707 (= res!60380 (= (arrayCountValidKeys!0 (_keys!4491 newMap!16) #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (_size!576 newMap!16)))))

(declare-fun b!124708 () Bool)

(declare-fun res!60381 () Bool)

(assert (=> b!124708 (=> (not res!60381) (not e!81506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4661 (_ BitVec 32)) Bool)

(assert (=> b!124708 (= res!60381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun b!124709 () Bool)

(declare-datatypes ((List!1691 0))(
  ( (Nil!1688) (Cons!1687 (h!2288 (_ BitVec 64)) (t!6017 List!1691)) )
))
(declare-fun arrayNoDuplicates!0 (array!4661 (_ BitVec 32) List!1691) Bool)

(assert (=> b!124709 (= e!81506 (arrayNoDuplicates!0 (_keys!4491 newMap!16) #b00000000000000000000000000000000 Nil!1688))))

(assert (= (and d!37399 res!60379) b!124707))

(assert (= (and b!124707 res!60380) b!124708))

(assert (= (and b!124708 res!60381) b!124709))

(declare-fun m!144571 () Bool)

(assert (=> d!37399 m!144571))

(declare-fun m!144573 () Bool)

(assert (=> b!124707 m!144573))

(declare-fun m!144575 () Bool)

(assert (=> b!124708 m!144575))

(declare-fun m!144577 () Bool)

(assert (=> b!124709 m!144577))

(assert (=> b!124455 d!37399))

(declare-fun d!37401 () Bool)

(assert (=> d!37401 (= (map!1365 newMap!16) (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun bs!5146 () Bool)

(assert (= bs!5146 d!37401))

(assert (=> bs!5146 m!144527))

(assert (=> b!124446 d!37401))

(declare-fun bm!13334 () Bool)

(declare-fun call!13343 () ListLongMap!1643)

(declare-fun call!13341 () ListLongMap!1643)

(assert (=> bm!13334 (= call!13343 call!13341)))

(declare-fun b!124752 () Bool)

(declare-fun e!81536 () Bool)

(declare-fun lt!64097 () ListLongMap!1643)

(declare-fun apply!110 (ListLongMap!1643 (_ BitVec 64)) V!3425)

(assert (=> b!124752 (= e!81536 (= (apply!110 lt!64097 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!124753 () Bool)

(declare-fun e!81538 () ListLongMap!1643)

(declare-fun call!13338 () ListLongMap!1643)

(assert (=> b!124753 (= e!81538 call!13338)))

(declare-fun bm!13335 () Bool)

(declare-fun call!13337 () ListLongMap!1643)

(assert (=> bm!13335 (= call!13338 call!13337)))

(declare-fun b!124754 () Bool)

(declare-fun e!81543 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!124754 (= e!81543 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124755 () Bool)

(declare-fun e!81545 () Bool)

(assert (=> b!124755 (= e!81545 (= (apply!110 lt!64097 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!124756 () Bool)

(declare-fun e!81540 () Bool)

(assert (=> b!124756 (= e!81540 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!37403 () Bool)

(declare-fun e!81535 () Bool)

(assert (=> d!37403 e!81535))

(declare-fun res!60402 () Bool)

(assert (=> d!37403 (=> (not res!60402) (not e!81535))))

(assert (=> d!37403 (= res!60402 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun lt!64103 () ListLongMap!1643)

(assert (=> d!37403 (= lt!64097 lt!64103)))

(declare-fun lt!64094 () Unit!3865)

(declare-fun e!81539 () Unit!3865)

(assert (=> d!37403 (= lt!64094 e!81539)))

(declare-fun c!22702 () Bool)

(assert (=> d!37403 (= c!22702 e!81543)))

(declare-fun res!60404 () Bool)

(assert (=> d!37403 (=> (not res!60404) (not e!81543))))

(assert (=> d!37403 (= res!60404 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun e!81541 () ListLongMap!1643)

(assert (=> d!37403 (= lt!64103 e!81541)))

(declare-fun c!22704 () Bool)

(assert (=> d!37403 (= c!22704 (and (not (= (bvand (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37403 (validMask!0 (mask!7008 (v!3101 (underlying!432 thiss!992))))))

(assert (=> d!37403 (= (getCurrentListMap!507 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))) lt!64097)))

(declare-fun b!124757 () Bool)

(declare-fun e!81534 () Bool)

(assert (=> b!124757 (= e!81534 (= (apply!110 lt!64097 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124757 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2471 (_values!2746 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> b!124757 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun bm!13336 () Bool)

(declare-fun c!22707 () Bool)

(declare-fun call!13340 () ListLongMap!1643)

(assert (=> bm!13336 (= call!13337 (+!157 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)) (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun bm!13337 () Bool)

(assert (=> bm!13337 (= call!13340 call!13343)))

(declare-fun b!124758 () Bool)

(declare-fun e!81537 () ListLongMap!1643)

(assert (=> b!124758 (= e!81541 e!81537)))

(assert (=> b!124758 (= c!22707 (and (not (= (bvand (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124759 () Bool)

(declare-fun Unit!3870 () Unit!3865)

(assert (=> b!124759 (= e!81539 Unit!3870)))

(declare-fun b!124760 () Bool)

(declare-fun res!60403 () Bool)

(assert (=> b!124760 (=> (not res!60403) (not e!81535))))

(declare-fun e!81542 () Bool)

(assert (=> b!124760 (= res!60403 e!81542)))

(declare-fun res!60400 () Bool)

(assert (=> b!124760 (=> res!60400 e!81542)))

(assert (=> b!124760 (= res!60400 (not e!81540))))

(declare-fun res!60408 () Bool)

(assert (=> b!124760 (=> (not res!60408) (not e!81540))))

(assert (=> b!124760 (= res!60408 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!124761 () Bool)

(declare-fun e!81533 () Bool)

(assert (=> b!124761 (= e!81533 e!81536)))

(declare-fun res!60407 () Bool)

(declare-fun call!13342 () Bool)

(assert (=> b!124761 (= res!60407 call!13342)))

(assert (=> b!124761 (=> (not res!60407) (not e!81536))))

(declare-fun bm!13338 () Bool)

(declare-fun call!13339 () Bool)

(assert (=> bm!13338 (= call!13339 (contains!863 lt!64097 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124762 () Bool)

(assert (=> b!124762 (= e!81537 call!13338)))

(declare-fun bm!13339 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!122 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) Int) ListLongMap!1643)

(assert (=> bm!13339 (= call!13341 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!124763 () Bool)

(declare-fun res!60406 () Bool)

(assert (=> b!124763 (=> (not res!60406) (not e!81535))))

(assert (=> b!124763 (= res!60406 e!81533)))

(declare-fun c!22705 () Bool)

(assert (=> b!124763 (= c!22705 (not (= (bvand (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124764 () Bool)

(declare-fun e!81544 () Bool)

(assert (=> b!124764 (= e!81544 (not call!13339))))

(declare-fun b!124765 () Bool)

(assert (=> b!124765 (= e!81535 e!81544)))

(declare-fun c!22706 () Bool)

(assert (=> b!124765 (= c!22706 (not (= (bvand (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124766 () Bool)

(assert (=> b!124766 (= e!81538 call!13340)))

(declare-fun b!124767 () Bool)

(assert (=> b!124767 (= e!81541 (+!157 call!13337 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!124768 () Bool)

(assert (=> b!124768 (= e!81544 e!81545)))

(declare-fun res!60405 () Bool)

(assert (=> b!124768 (= res!60405 call!13339)))

(assert (=> b!124768 (=> (not res!60405) (not e!81545))))

(declare-fun b!124769 () Bool)

(declare-fun lt!64099 () Unit!3865)

(assert (=> b!124769 (= e!81539 lt!64099)))

(declare-fun lt!64100 () ListLongMap!1643)

(assert (=> b!124769 (= lt!64100 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun lt!64102 () (_ BitVec 64))

(assert (=> b!124769 (= lt!64102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64087 () (_ BitVec 64))

(assert (=> b!124769 (= lt!64087 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!64086 () Unit!3865)

(declare-fun addStillContains!86 (ListLongMap!1643 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3865)

(assert (=> b!124769 (= lt!64086 (addStillContains!86 lt!64100 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64087))))

(assert (=> b!124769 (contains!863 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64087)))

(declare-fun lt!64096 () Unit!3865)

(assert (=> b!124769 (= lt!64096 lt!64086)))

(declare-fun lt!64093 () ListLongMap!1643)

(assert (=> b!124769 (= lt!64093 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun lt!64085 () (_ BitVec 64))

(assert (=> b!124769 (= lt!64085 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64105 () (_ BitVec 64))

(assert (=> b!124769 (= lt!64105 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!64088 () Unit!3865)

(declare-fun addApplyDifferent!86 (ListLongMap!1643 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3865)

(assert (=> b!124769 (= lt!64088 (addApplyDifferent!86 lt!64093 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64105))))

(assert (=> b!124769 (= (apply!110 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64105) (apply!110 lt!64093 lt!64105))))

(declare-fun lt!64090 () Unit!3865)

(assert (=> b!124769 (= lt!64090 lt!64088)))

(declare-fun lt!64106 () ListLongMap!1643)

(assert (=> b!124769 (= lt!64106 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun lt!64089 () (_ BitVec 64))

(assert (=> b!124769 (= lt!64089 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64104 () (_ BitVec 64))

(assert (=> b!124769 (= lt!64104 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!64098 () Unit!3865)

(assert (=> b!124769 (= lt!64098 (addApplyDifferent!86 lt!64106 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64104))))

(assert (=> b!124769 (= (apply!110 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64104) (apply!110 lt!64106 lt!64104))))

(declare-fun lt!64095 () Unit!3865)

(assert (=> b!124769 (= lt!64095 lt!64098)))

(declare-fun lt!64091 () ListLongMap!1643)

(assert (=> b!124769 (= lt!64091 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun lt!64101 () (_ BitVec 64))

(assert (=> b!124769 (= lt!64101 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64092 () (_ BitVec 64))

(assert (=> b!124769 (= lt!64092 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!124769 (= lt!64099 (addApplyDifferent!86 lt!64091 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64092))))

(assert (=> b!124769 (= (apply!110 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64092) (apply!110 lt!64091 lt!64092))))

(declare-fun b!124770 () Bool)

(assert (=> b!124770 (= e!81533 (not call!13342))))

(declare-fun bm!13340 () Bool)

(assert (=> bm!13340 (= call!13342 (contains!863 lt!64097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124771 () Bool)

(assert (=> b!124771 (= e!81542 e!81534)))

(declare-fun res!60401 () Bool)

(assert (=> b!124771 (=> (not res!60401) (not e!81534))))

(assert (=> b!124771 (= res!60401 (contains!863 lt!64097 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124771 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!124772 () Bool)

(declare-fun c!22703 () Bool)

(assert (=> b!124772 (= c!22703 (and (not (= (bvand (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124772 (= e!81537 e!81538)))

(assert (= (and d!37403 c!22704) b!124767))

(assert (= (and d!37403 (not c!22704)) b!124758))

(assert (= (and b!124758 c!22707) b!124762))

(assert (= (and b!124758 (not c!22707)) b!124772))

(assert (= (and b!124772 c!22703) b!124753))

(assert (= (and b!124772 (not c!22703)) b!124766))

(assert (= (or b!124753 b!124766) bm!13337))

(assert (= (or b!124762 bm!13337) bm!13334))

(assert (= (or b!124762 b!124753) bm!13335))

(assert (= (or b!124767 bm!13334) bm!13339))

(assert (= (or b!124767 bm!13335) bm!13336))

(assert (= (and d!37403 res!60404) b!124754))

(assert (= (and d!37403 c!22702) b!124769))

(assert (= (and d!37403 (not c!22702)) b!124759))

(assert (= (and d!37403 res!60402) b!124760))

(assert (= (and b!124760 res!60408) b!124756))

(assert (= (and b!124760 (not res!60400)) b!124771))

(assert (= (and b!124771 res!60401) b!124757))

(assert (= (and b!124760 res!60403) b!124763))

(assert (= (and b!124763 c!22705) b!124761))

(assert (= (and b!124763 (not c!22705)) b!124770))

(assert (= (and b!124761 res!60407) b!124752))

(assert (= (or b!124761 b!124770) bm!13340))

(assert (= (and b!124763 res!60406) b!124765))

(assert (= (and b!124765 c!22706) b!124768))

(assert (= (and b!124765 (not c!22706)) b!124764))

(assert (= (and b!124768 res!60405) b!124755))

(assert (= (or b!124768 b!124764) bm!13338))

(declare-fun b_lambda!5463 () Bool)

(assert (=> (not b_lambda!5463) (not b!124757)))

(assert (=> b!124757 t!6004))

(declare-fun b_and!7653 () Bool)

(assert (= b_and!7633 (and (=> t!6004 result!3795) b_and!7653)))

(assert (=> b!124757 t!6006))

(declare-fun b_and!7655 () Bool)

(assert (= b_and!7635 (and (=> t!6006 result!3799) b_and!7655)))

(declare-fun m!144579 () Bool)

(assert (=> b!124771 m!144579))

(assert (=> b!124771 m!144579))

(declare-fun m!144581 () Bool)

(assert (=> b!124771 m!144581))

(declare-fun m!144583 () Bool)

(assert (=> b!124752 m!144583))

(declare-fun m!144585 () Bool)

(assert (=> b!124755 m!144585))

(assert (=> b!124756 m!144579))

(assert (=> b!124756 m!144579))

(declare-fun m!144587 () Bool)

(assert (=> b!124756 m!144587))

(declare-fun m!144589 () Bool)

(assert (=> bm!13338 m!144589))

(declare-fun m!144591 () Bool)

(assert (=> bm!13336 m!144591))

(assert (=> b!124757 m!144417))

(declare-fun m!144593 () Bool)

(assert (=> b!124757 m!144593))

(assert (=> b!124757 m!144417))

(declare-fun m!144595 () Bool)

(assert (=> b!124757 m!144595))

(assert (=> b!124757 m!144579))

(assert (=> b!124757 m!144593))

(assert (=> b!124757 m!144579))

(declare-fun m!144597 () Bool)

(assert (=> b!124757 m!144597))

(declare-fun m!144599 () Bool)

(assert (=> bm!13340 m!144599))

(assert (=> b!124754 m!144579))

(assert (=> b!124754 m!144579))

(assert (=> b!124754 m!144587))

(declare-fun m!144601 () Bool)

(assert (=> b!124767 m!144601))

(declare-fun m!144603 () Bool)

(assert (=> bm!13339 m!144603))

(declare-fun m!144605 () Bool)

(assert (=> b!124769 m!144605))

(declare-fun m!144607 () Bool)

(assert (=> b!124769 m!144607))

(declare-fun m!144609 () Bool)

(assert (=> b!124769 m!144609))

(declare-fun m!144611 () Bool)

(assert (=> b!124769 m!144611))

(assert (=> b!124769 m!144603))

(assert (=> b!124769 m!144607))

(declare-fun m!144613 () Bool)

(assert (=> b!124769 m!144613))

(declare-fun m!144615 () Bool)

(assert (=> b!124769 m!144615))

(declare-fun m!144617 () Bool)

(assert (=> b!124769 m!144617))

(declare-fun m!144619 () Bool)

(assert (=> b!124769 m!144619))

(declare-fun m!144621 () Bool)

(assert (=> b!124769 m!144621))

(assert (=> b!124769 m!144579))

(declare-fun m!144623 () Bool)

(assert (=> b!124769 m!144623))

(declare-fun m!144625 () Bool)

(assert (=> b!124769 m!144625))

(declare-fun m!144627 () Bool)

(assert (=> b!124769 m!144627))

(declare-fun m!144629 () Bool)

(assert (=> b!124769 m!144629))

(assert (=> b!124769 m!144627))

(assert (=> b!124769 m!144615))

(declare-fun m!144631 () Bool)

(assert (=> b!124769 m!144631))

(assert (=> b!124769 m!144619))

(declare-fun m!144633 () Bool)

(assert (=> b!124769 m!144633))

(assert (=> d!37403 m!144431))

(assert (=> b!124446 d!37403))

(declare-fun b!124779 () Bool)

(declare-fun e!81550 () Bool)

(assert (=> b!124779 (= e!81550 tp_is_empty!2833)))

(declare-fun b!124780 () Bool)

(declare-fun e!81551 () Bool)

(assert (=> b!124780 (= e!81551 tp_is_empty!2833)))

(declare-fun condMapEmpty!4483 () Bool)

(declare-fun mapDefault!4483 () ValueCell!1073)

(assert (=> mapNonEmpty!4467 (= condMapEmpty!4483 (= mapRest!4468 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4483)))))

(declare-fun mapRes!4483 () Bool)

(assert (=> mapNonEmpty!4467 (= tp!10898 (and e!81551 mapRes!4483))))

(declare-fun mapNonEmpty!4483 () Bool)

(declare-fun tp!10927 () Bool)

(assert (=> mapNonEmpty!4483 (= mapRes!4483 (and tp!10927 e!81550))))

(declare-fun mapValue!4483 () ValueCell!1073)

(declare-fun mapKey!4483 () (_ BitVec 32))

(declare-fun mapRest!4483 () (Array (_ BitVec 32) ValueCell!1073))

(assert (=> mapNonEmpty!4483 (= mapRest!4468 (store mapRest!4483 mapKey!4483 mapValue!4483))))

(declare-fun mapIsEmpty!4483 () Bool)

(assert (=> mapIsEmpty!4483 mapRes!4483))

(assert (= (and mapNonEmpty!4467 condMapEmpty!4483) mapIsEmpty!4483))

(assert (= (and mapNonEmpty!4467 (not condMapEmpty!4483)) mapNonEmpty!4483))

(assert (= (and mapNonEmpty!4483 ((_ is ValueCellFull!1073) mapValue!4483)) b!124779))

(assert (= (and mapNonEmpty!4467 ((_ is ValueCellFull!1073) mapDefault!4483)) b!124780))

(declare-fun m!144635 () Bool)

(assert (=> mapNonEmpty!4483 m!144635))

(declare-fun b!124781 () Bool)

(declare-fun e!81552 () Bool)

(assert (=> b!124781 (= e!81552 tp_is_empty!2833)))

(declare-fun b!124782 () Bool)

(declare-fun e!81553 () Bool)

(assert (=> b!124782 (= e!81553 tp_is_empty!2833)))

(declare-fun condMapEmpty!4484 () Bool)

(declare-fun mapDefault!4484 () ValueCell!1073)

(assert (=> mapNonEmpty!4468 (= condMapEmpty!4484 (= mapRest!4467 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4484)))))

(declare-fun mapRes!4484 () Bool)

(assert (=> mapNonEmpty!4468 (= tp!10897 (and e!81553 mapRes!4484))))

(declare-fun mapNonEmpty!4484 () Bool)

(declare-fun tp!10928 () Bool)

(assert (=> mapNonEmpty!4484 (= mapRes!4484 (and tp!10928 e!81552))))

(declare-fun mapValue!4484 () ValueCell!1073)

(declare-fun mapKey!4484 () (_ BitVec 32))

(declare-fun mapRest!4484 () (Array (_ BitVec 32) ValueCell!1073))

(assert (=> mapNonEmpty!4484 (= mapRest!4467 (store mapRest!4484 mapKey!4484 mapValue!4484))))

(declare-fun mapIsEmpty!4484 () Bool)

(assert (=> mapIsEmpty!4484 mapRes!4484))

(assert (= (and mapNonEmpty!4468 condMapEmpty!4484) mapIsEmpty!4484))

(assert (= (and mapNonEmpty!4468 (not condMapEmpty!4484)) mapNonEmpty!4484))

(assert (= (and mapNonEmpty!4484 ((_ is ValueCellFull!1073) mapValue!4484)) b!124781))

(assert (= (and mapNonEmpty!4468 ((_ is ValueCellFull!1073) mapDefault!4484)) b!124782))

(declare-fun m!144637 () Bool)

(assert (=> mapNonEmpty!4484 m!144637))

(declare-fun b_lambda!5465 () Bool)

(assert (= b_lambda!5463 (or (and b!124442 b_free!2833) (and b!124445 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))))) b_lambda!5465)))

(check-sat (not bm!13340) (not b!124659) (not bm!13300) (not b!124709) tp_is_empty!2833 b_and!7653 (not b!124667) (not b_lambda!5465) (not bm!13309) (not b!124677) (not b!124672) (not bm!13338) (not b!124767) (not bm!13310) (not b!124756) (not d!37403) (not b!124707) (not bm!13307) (not bm!13299) (not mapNonEmpty!4484) (not bm!13298) (not b!124699) (not bm!13306) (not b!124700) (not b!124676) (not b_next!2833) (not b!124680) (not d!37387) (not b!124755) (not b!124679) (not b!124574) (not d!37385) (not b!124754) (not bm!13303) (not b!124757) (not mapNonEmpty!4483) (not d!37393) (not b!124771) (not bm!13317) (not d!37401) (not b!124752) (not b!124769) (not bm!13316) (not d!37399) (not bm!13339) (not bm!13336) (not b_next!2835) (not b_lambda!5461) (not bm!13313) (not b!124708) b_and!7655 (not bm!13312) (not b!124572))
(check-sat b_and!7653 b_and!7655 (not b_next!2833) (not b_next!2835))
(get-model)

(declare-fun d!37405 () Bool)

(declare-fun e!81556 () Bool)

(assert (=> d!37405 e!81556))

(declare-fun res!60414 () Bool)

(assert (=> d!37405 (=> (not res!60414) (not e!81556))))

(declare-fun lt!64118 () ListLongMap!1643)

(assert (=> d!37405 (= res!60414 (contains!863 lt!64118 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64116 () List!1689)

(assert (=> d!37405 (= lt!64118 (ListLongMap!1644 lt!64116))))

(declare-fun lt!64117 () Unit!3865)

(declare-fun lt!64115 () Unit!3865)

(assert (=> d!37405 (= lt!64117 lt!64115)))

(assert (=> d!37405 (= (getValueByKey!164 lt!64116 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!82 (List!1689 (_ BitVec 64) V!3425) Unit!3865)

(assert (=> d!37405 (= lt!64115 (lemmaContainsTupThenGetReturnValue!82 lt!64116 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!85 (List!1689 (_ BitVec 64) V!3425) List!1689)

(assert (=> d!37405 (= lt!64116 (insertStrictlySorted!85 (toList!837 call!13320) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37405 (= (+!157 call!13320 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64118)))

(declare-fun b!124787 () Bool)

(declare-fun res!60413 () Bool)

(assert (=> b!124787 (=> (not res!60413) (not e!81556))))

(assert (=> b!124787 (= res!60413 (= (getValueByKey!164 (toList!837 lt!64118) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!124788 () Bool)

(declare-fun contains!865 (List!1689 tuple2!2534) Bool)

(assert (=> b!124788 (= e!81556 (contains!865 (toList!837 lt!64118) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37405 res!60414) b!124787))

(assert (= (and b!124787 res!60413) b!124788))

(declare-fun m!144639 () Bool)

(assert (=> d!37405 m!144639))

(declare-fun m!144641 () Bool)

(assert (=> d!37405 m!144641))

(declare-fun m!144643 () Bool)

(assert (=> d!37405 m!144643))

(declare-fun m!144645 () Bool)

(assert (=> d!37405 m!144645))

(declare-fun m!144647 () Bool)

(assert (=> b!124787 m!144647))

(declare-fun m!144649 () Bool)

(assert (=> b!124788 m!144649))

(assert (=> b!124667 d!37405))

(declare-fun d!37407 () Bool)

(assert (=> d!37407 (= (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124756 d!37407))

(declare-fun bm!13341 () Bool)

(declare-fun call!13350 () ListLongMap!1643)

(declare-fun call!13348 () ListLongMap!1643)

(assert (=> bm!13341 (= call!13350 call!13348)))

(declare-fun b!124789 () Bool)

(declare-fun e!81560 () Bool)

(declare-fun lt!64131 () ListLongMap!1643)

(assert (=> b!124789 (= e!81560 (= (apply!110 lt!64131 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!124790 () Bool)

(declare-fun e!81562 () ListLongMap!1643)

(declare-fun call!13345 () ListLongMap!1643)

(assert (=> b!124790 (= e!81562 call!13345)))

(declare-fun bm!13342 () Bool)

(declare-fun call!13344 () ListLongMap!1643)

(assert (=> bm!13342 (= call!13345 call!13344)))

(declare-fun b!124791 () Bool)

(declare-fun e!81567 () Bool)

(assert (=> b!124791 (= e!81567 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124792 () Bool)

(declare-fun e!81569 () Bool)

(assert (=> b!124792 (= e!81569 (= (apply!110 lt!64131 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!124793 () Bool)

(declare-fun e!81564 () Bool)

(assert (=> b!124793 (= e!81564 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37409 () Bool)

(declare-fun e!81559 () Bool)

(assert (=> d!37409 e!81559))

(declare-fun res!60417 () Bool)

(assert (=> d!37409 (=> (not res!60417) (not e!81559))))

(assert (=> d!37409 (= res!60417 (or (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun lt!64137 () ListLongMap!1643)

(assert (=> d!37409 (= lt!64131 lt!64137)))

(declare-fun lt!64128 () Unit!3865)

(declare-fun e!81563 () Unit!3865)

(assert (=> d!37409 (= lt!64128 e!81563)))

(declare-fun c!22708 () Bool)

(assert (=> d!37409 (= c!22708 e!81567)))

(declare-fun res!60419 () Bool)

(assert (=> d!37409 (=> (not res!60419) (not e!81567))))

(assert (=> d!37409 (= res!60419 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun e!81565 () ListLongMap!1643)

(assert (=> d!37409 (= lt!64137 e!81565)))

(declare-fun c!22710 () Bool)

(assert (=> d!37409 (= c!22710 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37409 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37409 (= (getCurrentListMap!507 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64131)))

(declare-fun e!81558 () Bool)

(declare-fun b!124794 () Bool)

(assert (=> b!124794 (= e!81558 (= (apply!110 lt!64131 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032))))))

(assert (=> b!124794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun c!22713 () Bool)

(declare-fun bm!13343 () Bool)

(declare-fun call!13347 () ListLongMap!1643)

(assert (=> bm!13343 (= call!13344 (+!157 (ite c!22710 call!13348 (ite c!22713 call!13350 call!13347)) (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun bm!13344 () Bool)

(assert (=> bm!13344 (= call!13347 call!13350)))

(declare-fun b!124795 () Bool)

(declare-fun e!81561 () ListLongMap!1643)

(assert (=> b!124795 (= e!81565 e!81561)))

(assert (=> b!124795 (= c!22713 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124796 () Bool)

(declare-fun Unit!3871 () Unit!3865)

(assert (=> b!124796 (= e!81563 Unit!3871)))

(declare-fun b!124797 () Bool)

(declare-fun res!60418 () Bool)

(assert (=> b!124797 (=> (not res!60418) (not e!81559))))

(declare-fun e!81566 () Bool)

(assert (=> b!124797 (= res!60418 e!81566)))

(declare-fun res!60415 () Bool)

(assert (=> b!124797 (=> res!60415 e!81566)))

(assert (=> b!124797 (= res!60415 (not e!81564))))

(declare-fun res!60423 () Bool)

(assert (=> b!124797 (=> (not res!60423) (not e!81564))))

(assert (=> b!124797 (= res!60423 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!124798 () Bool)

(declare-fun e!81557 () Bool)

(assert (=> b!124798 (= e!81557 e!81560)))

(declare-fun res!60422 () Bool)

(declare-fun call!13349 () Bool)

(assert (=> b!124798 (= res!60422 call!13349)))

(assert (=> b!124798 (=> (not res!60422) (not e!81560))))

(declare-fun bm!13345 () Bool)

(declare-fun call!13346 () Bool)

(assert (=> bm!13345 (= call!13346 (contains!863 lt!64131 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124799 () Bool)

(assert (=> b!124799 (= e!81561 call!13345)))

(declare-fun bm!13346 () Bool)

(assert (=> bm!13346 (= call!13348 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!124800 () Bool)

(declare-fun res!60421 () Bool)

(assert (=> b!124800 (=> (not res!60421) (not e!81559))))

(assert (=> b!124800 (= res!60421 e!81557)))

(declare-fun c!22711 () Bool)

(assert (=> b!124800 (= c!22711 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124801 () Bool)

(declare-fun e!81568 () Bool)

(assert (=> b!124801 (= e!81568 (not call!13346))))

(declare-fun b!124802 () Bool)

(assert (=> b!124802 (= e!81559 e!81568)))

(declare-fun c!22712 () Bool)

(assert (=> b!124802 (= c!22712 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124803 () Bool)

(assert (=> b!124803 (= e!81562 call!13347)))

(declare-fun b!124804 () Bool)

(assert (=> b!124804 (= e!81565 (+!157 call!13344 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!124805 () Bool)

(assert (=> b!124805 (= e!81568 e!81569)))

(declare-fun res!60420 () Bool)

(assert (=> b!124805 (= res!60420 call!13346)))

(assert (=> b!124805 (=> (not res!60420) (not e!81569))))

(declare-fun b!124806 () Bool)

(declare-fun lt!64133 () Unit!3865)

(assert (=> b!124806 (= e!81563 lt!64133)))

(declare-fun lt!64134 () ListLongMap!1643)

(assert (=> b!124806 (= lt!64134 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64136 () (_ BitVec 64))

(assert (=> b!124806 (= lt!64136 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64121 () (_ BitVec 64))

(assert (=> b!124806 (= lt!64121 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64120 () Unit!3865)

(assert (=> b!124806 (= lt!64120 (addStillContains!86 lt!64134 lt!64136 (zeroValue!2628 newMap!16) lt!64121))))

(assert (=> b!124806 (contains!863 (+!157 lt!64134 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16))) lt!64121)))

(declare-fun lt!64130 () Unit!3865)

(assert (=> b!124806 (= lt!64130 lt!64120)))

(declare-fun lt!64127 () ListLongMap!1643)

(assert (=> b!124806 (= lt!64127 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64119 () (_ BitVec 64))

(assert (=> b!124806 (= lt!64119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64139 () (_ BitVec 64))

(assert (=> b!124806 (= lt!64139 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64122 () Unit!3865)

(assert (=> b!124806 (= lt!64122 (addApplyDifferent!86 lt!64127 lt!64119 (minValue!2628 newMap!16) lt!64139))))

(assert (=> b!124806 (= (apply!110 (+!157 lt!64127 (tuple2!2535 lt!64119 (minValue!2628 newMap!16))) lt!64139) (apply!110 lt!64127 lt!64139))))

(declare-fun lt!64124 () Unit!3865)

(assert (=> b!124806 (= lt!64124 lt!64122)))

(declare-fun lt!64140 () ListLongMap!1643)

(assert (=> b!124806 (= lt!64140 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64123 () (_ BitVec 64))

(assert (=> b!124806 (= lt!64123 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64138 () (_ BitVec 64))

(assert (=> b!124806 (= lt!64138 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64132 () Unit!3865)

(assert (=> b!124806 (= lt!64132 (addApplyDifferent!86 lt!64140 lt!64123 (zeroValue!2628 newMap!16) lt!64138))))

(assert (=> b!124806 (= (apply!110 (+!157 lt!64140 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16))) lt!64138) (apply!110 lt!64140 lt!64138))))

(declare-fun lt!64129 () Unit!3865)

(assert (=> b!124806 (= lt!64129 lt!64132)))

(declare-fun lt!64125 () ListLongMap!1643)

(assert (=> b!124806 (= lt!64125 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64135 () (_ BitVec 64))

(assert (=> b!124806 (= lt!64135 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64126 () (_ BitVec 64))

(assert (=> b!124806 (= lt!64126 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124806 (= lt!64133 (addApplyDifferent!86 lt!64125 lt!64135 (minValue!2628 newMap!16) lt!64126))))

(assert (=> b!124806 (= (apply!110 (+!157 lt!64125 (tuple2!2535 lt!64135 (minValue!2628 newMap!16))) lt!64126) (apply!110 lt!64125 lt!64126))))

(declare-fun b!124807 () Bool)

(assert (=> b!124807 (= e!81557 (not call!13349))))

(declare-fun bm!13347 () Bool)

(assert (=> bm!13347 (= call!13349 (contains!863 lt!64131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124808 () Bool)

(assert (=> b!124808 (= e!81566 e!81558)))

(declare-fun res!60416 () Bool)

(assert (=> b!124808 (=> (not res!60416) (not e!81558))))

(assert (=> b!124808 (= res!60416 (contains!863 lt!64131 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!124808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!124809 () Bool)

(declare-fun c!22709 () Bool)

(assert (=> b!124809 (= c!22709 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124809 (= e!81561 e!81562)))

(assert (= (and d!37409 c!22710) b!124804))

(assert (= (and d!37409 (not c!22710)) b!124795))

(assert (= (and b!124795 c!22713) b!124799))

(assert (= (and b!124795 (not c!22713)) b!124809))

(assert (= (and b!124809 c!22709) b!124790))

(assert (= (and b!124809 (not c!22709)) b!124803))

(assert (= (or b!124790 b!124803) bm!13344))

(assert (= (or b!124799 bm!13344) bm!13341))

(assert (= (or b!124799 b!124790) bm!13342))

(assert (= (or b!124804 bm!13341) bm!13346))

(assert (= (or b!124804 bm!13342) bm!13343))

(assert (= (and d!37409 res!60419) b!124791))

(assert (= (and d!37409 c!22708) b!124806))

(assert (= (and d!37409 (not c!22708)) b!124796))

(assert (= (and d!37409 res!60417) b!124797))

(assert (= (and b!124797 res!60423) b!124793))

(assert (= (and b!124797 (not res!60415)) b!124808))

(assert (= (and b!124808 res!60416) b!124794))

(assert (= (and b!124797 res!60418) b!124800))

(assert (= (and b!124800 c!22711) b!124798))

(assert (= (and b!124800 (not c!22711)) b!124807))

(assert (= (and b!124798 res!60422) b!124789))

(assert (= (or b!124798 b!124807) bm!13347))

(assert (= (and b!124800 res!60421) b!124802))

(assert (= (and b!124802 c!22712) b!124805))

(assert (= (and b!124802 (not c!22712)) b!124801))

(assert (= (and b!124805 res!60420) b!124792))

(assert (= (or b!124805 b!124801) bm!13345))

(declare-fun b_lambda!5467 () Bool)

(assert (=> (not b_lambda!5467) (not b!124794)))

(declare-fun t!6019 () Bool)

(declare-fun tb!2293 () Bool)

(assert (=> (and b!124442 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16)) t!6019) tb!2293))

(declare-fun result!3815 () Bool)

(assert (=> tb!2293 (= result!3815 tp_is_empty!2833)))

(assert (=> b!124794 t!6019))

(declare-fun b_and!7657 () Bool)

(assert (= b_and!7653 (and (=> t!6019 result!3815) b_and!7657)))

(declare-fun t!6021 () Bool)

(declare-fun tb!2295 () Bool)

(assert (=> (and b!124445 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 newMap!16)) t!6021) tb!2295))

(declare-fun result!3817 () Bool)

(assert (= result!3817 result!3815))

(assert (=> b!124794 t!6021))

(declare-fun b_and!7659 () Bool)

(assert (= b_and!7655 (and (=> t!6021 result!3817) b_and!7659)))

(declare-fun m!144651 () Bool)

(assert (=> b!124808 m!144651))

(assert (=> b!124808 m!144651))

(declare-fun m!144653 () Bool)

(assert (=> b!124808 m!144653))

(declare-fun m!144655 () Bool)

(assert (=> b!124789 m!144655))

(declare-fun m!144657 () Bool)

(assert (=> b!124792 m!144657))

(assert (=> b!124793 m!144651))

(assert (=> b!124793 m!144651))

(declare-fun m!144659 () Bool)

(assert (=> b!124793 m!144659))

(declare-fun m!144661 () Bool)

(assert (=> bm!13345 m!144661))

(declare-fun m!144663 () Bool)

(assert (=> bm!13343 m!144663))

(declare-fun m!144665 () Bool)

(assert (=> b!124794 m!144665))

(declare-fun m!144667 () Bool)

(assert (=> b!124794 m!144667))

(assert (=> b!124794 m!144665))

(declare-fun m!144669 () Bool)

(assert (=> b!124794 m!144669))

(assert (=> b!124794 m!144651))

(assert (=> b!124794 m!144667))

(assert (=> b!124794 m!144651))

(declare-fun m!144671 () Bool)

(assert (=> b!124794 m!144671))

(declare-fun m!144673 () Bool)

(assert (=> bm!13347 m!144673))

(assert (=> b!124791 m!144651))

(assert (=> b!124791 m!144651))

(assert (=> b!124791 m!144659))

(declare-fun m!144675 () Bool)

(assert (=> b!124804 m!144675))

(declare-fun m!144677 () Bool)

(assert (=> bm!13346 m!144677))

(declare-fun m!144679 () Bool)

(assert (=> b!124806 m!144679))

(declare-fun m!144681 () Bool)

(assert (=> b!124806 m!144681))

(declare-fun m!144683 () Bool)

(assert (=> b!124806 m!144683))

(declare-fun m!144685 () Bool)

(assert (=> b!124806 m!144685))

(assert (=> b!124806 m!144677))

(assert (=> b!124806 m!144681))

(declare-fun m!144687 () Bool)

(assert (=> b!124806 m!144687))

(declare-fun m!144689 () Bool)

(assert (=> b!124806 m!144689))

(declare-fun m!144691 () Bool)

(assert (=> b!124806 m!144691))

(declare-fun m!144693 () Bool)

(assert (=> b!124806 m!144693))

(declare-fun m!144695 () Bool)

(assert (=> b!124806 m!144695))

(assert (=> b!124806 m!144651))

(declare-fun m!144697 () Bool)

(assert (=> b!124806 m!144697))

(declare-fun m!144699 () Bool)

(assert (=> b!124806 m!144699))

(declare-fun m!144701 () Bool)

(assert (=> b!124806 m!144701))

(declare-fun m!144703 () Bool)

(assert (=> b!124806 m!144703))

(assert (=> b!124806 m!144701))

(assert (=> b!124806 m!144689))

(declare-fun m!144705 () Bool)

(assert (=> b!124806 m!144705))

(assert (=> b!124806 m!144693))

(declare-fun m!144707 () Bool)

(assert (=> b!124806 m!144707))

(declare-fun m!144709 () Bool)

(assert (=> d!37409 m!144709))

(assert (=> bm!13307 d!37409))

(declare-fun d!37411 () Bool)

(declare-fun res!60424 () Bool)

(declare-fun e!81570 () Bool)

(assert (=> d!37411 (=> (not res!60424) (not e!81570))))

(assert (=> d!37411 (= res!60424 (simpleValid!86 (_2!1279 lt!64023)))))

(assert (=> d!37411 (= (valid!506 (_2!1279 lt!64023)) e!81570)))

(declare-fun b!124810 () Bool)

(declare-fun res!60425 () Bool)

(assert (=> b!124810 (=> (not res!60425) (not e!81570))))

(assert (=> b!124810 (= res!60425 (= (arrayCountValidKeys!0 (_keys!4491 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))) (_size!576 (_2!1279 lt!64023))))))

(declare-fun b!124811 () Bool)

(declare-fun res!60426 () Bool)

(assert (=> b!124811 (=> (not res!60426) (not e!81570))))

(assert (=> b!124811 (= res!60426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4491 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023))))))

(declare-fun b!124812 () Bool)

(assert (=> b!124812 (= e!81570 (arrayNoDuplicates!0 (_keys!4491 (_2!1279 lt!64023)) #b00000000000000000000000000000000 Nil!1688))))

(assert (= (and d!37411 res!60424) b!124810))

(assert (= (and b!124810 res!60425) b!124811))

(assert (= (and b!124811 res!60426) b!124812))

(declare-fun m!144711 () Bool)

(assert (=> d!37411 m!144711))

(declare-fun m!144713 () Bool)

(assert (=> b!124810 m!144713))

(declare-fun m!144715 () Bool)

(assert (=> b!124811 m!144715))

(declare-fun m!144717 () Bool)

(assert (=> b!124812 m!144717))

(assert (=> d!37387 d!37411))

(assert (=> d!37387 d!37399))

(declare-fun d!37413 () Bool)

(declare-fun get!1439 (Option!170) V!3425)

(assert (=> d!37413 (= (apply!110 lt!64097 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1439 (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5147 () Bool)

(assert (= bs!5147 d!37413))

(assert (=> bs!5147 m!144579))

(declare-fun m!144719 () Bool)

(assert (=> bs!5147 m!144719))

(assert (=> bs!5147 m!144719))

(declare-fun m!144721 () Bool)

(assert (=> bs!5147 m!144721))

(assert (=> b!124757 d!37413))

(declare-fun d!37415 () Bool)

(declare-fun c!22714 () Bool)

(assert (=> d!37415 (= c!22714 ((_ is ValueCellFull!1073) (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!81571 () V!3425)

(assert (=> d!37415 (= (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!81571)))

(declare-fun b!124813 () Bool)

(assert (=> b!124813 (= e!81571 (get!1437 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124814 () Bool)

(assert (=> b!124814 (= e!81571 (get!1438 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37415 c!22714) b!124813))

(assert (= (and d!37415 (not c!22714)) b!124814))

(assert (=> b!124813 m!144593))

(assert (=> b!124813 m!144417))

(declare-fun m!144723 () Bool)

(assert (=> b!124813 m!144723))

(assert (=> b!124814 m!144593))

(assert (=> b!124814 m!144417))

(declare-fun m!144725 () Bool)

(assert (=> b!124814 m!144725))

(assert (=> b!124757 d!37415))

(declare-fun d!37417 () Bool)

(declare-fun e!81572 () Bool)

(assert (=> d!37417 e!81572))

(declare-fun res!60428 () Bool)

(assert (=> d!37417 (=> (not res!60428) (not e!81572))))

(declare-fun lt!64144 () ListLongMap!1643)

(assert (=> d!37417 (= res!60428 (contains!863 lt!64144 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun lt!64142 () List!1689)

(assert (=> d!37417 (= lt!64144 (ListLongMap!1644 lt!64142))))

(declare-fun lt!64143 () Unit!3865)

(declare-fun lt!64141 () Unit!3865)

(assert (=> d!37417 (= lt!64143 lt!64141)))

(assert (=> d!37417 (= (getValueByKey!164 lt!64142 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) (Some!169 (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37417 (= lt!64141 (lemmaContainsTupThenGetReturnValue!82 lt!64142 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37417 (= lt!64142 (insertStrictlySorted!85 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340))) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37417 (= (+!157 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)) (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64144)))

(declare-fun b!124815 () Bool)

(declare-fun res!60427 () Bool)

(assert (=> b!124815 (=> (not res!60427) (not e!81572))))

(assert (=> b!124815 (= res!60427 (= (getValueByKey!164 (toList!837 lt!64144) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) (Some!169 (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!124816 () Bool)

(assert (=> b!124816 (= e!81572 (contains!865 (toList!837 lt!64144) (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (= (and d!37417 res!60428) b!124815))

(assert (= (and b!124815 res!60427) b!124816))

(declare-fun m!144727 () Bool)

(assert (=> d!37417 m!144727))

(declare-fun m!144729 () Bool)

(assert (=> d!37417 m!144729))

(declare-fun m!144731 () Bool)

(assert (=> d!37417 m!144731))

(declare-fun m!144733 () Bool)

(assert (=> d!37417 m!144733))

(declare-fun m!144735 () Bool)

(assert (=> b!124815 m!144735))

(declare-fun m!144737 () Bool)

(assert (=> b!124816 m!144737))

(assert (=> bm!13336 d!37417))

(declare-fun d!37419 () Bool)

(declare-fun res!60429 () Bool)

(declare-fun e!81573 () Bool)

(assert (=> d!37419 (=> (not res!60429) (not e!81573))))

(assert (=> d!37419 (= res!60429 (simpleValid!86 (v!3101 (underlying!432 thiss!992))))))

(assert (=> d!37419 (= (valid!506 (v!3101 (underlying!432 thiss!992))) e!81573)))

(declare-fun b!124817 () Bool)

(declare-fun res!60430 () Bool)

(assert (=> b!124817 (=> (not res!60430) (not e!81573))))

(assert (=> b!124817 (= res!60430 (= (arrayCountValidKeys!0 (_keys!4491 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000000 (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))) (_size!576 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!124818 () Bool)

(declare-fun res!60431 () Bool)

(assert (=> b!124818 (=> (not res!60431) (not e!81573))))

(assert (=> b!124818 (= res!60431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!124819 () Bool)

(assert (=> b!124819 (= e!81573 (arrayNoDuplicates!0 (_keys!4491 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000000 Nil!1688))))

(assert (= (and d!37419 res!60429) b!124817))

(assert (= (and b!124817 res!60430) b!124818))

(assert (= (and b!124818 res!60431) b!124819))

(declare-fun m!144739 () Bool)

(assert (=> d!37419 m!144739))

(declare-fun m!144741 () Bool)

(assert (=> b!124817 m!144741))

(declare-fun m!144743 () Bool)

(assert (=> b!124818 m!144743))

(declare-fun m!144745 () Bool)

(assert (=> b!124819 m!144745))

(assert (=> d!37393 d!37419))

(declare-fun bm!13348 () Bool)

(declare-fun call!13357 () ListLongMap!1643)

(declare-fun call!13355 () ListLongMap!1643)

(assert (=> bm!13348 (= call!13357 call!13355)))

(declare-fun b!124820 () Bool)

(declare-fun e!81577 () Bool)

(declare-fun lt!64157 () ListLongMap!1643)

(assert (=> b!124820 (= e!81577 (= (apply!110 lt!64157 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!124821 () Bool)

(declare-fun e!81579 () ListLongMap!1643)

(declare-fun call!13352 () ListLongMap!1643)

(assert (=> b!124821 (= e!81579 call!13352)))

(declare-fun bm!13349 () Bool)

(declare-fun call!13351 () ListLongMap!1643)

(assert (=> bm!13349 (= call!13352 call!13351)))

(declare-fun b!124822 () Bool)

(declare-fun e!81584 () Bool)

(assert (=> b!124822 (= e!81584 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!124823 () Bool)

(declare-fun e!81586 () Bool)

(assert (=> b!124823 (= e!81586 (= (apply!110 lt!64157 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!124824 () Bool)

(declare-fun e!81581 () Bool)

(assert (=> b!124824 (= e!81581 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37421 () Bool)

(declare-fun e!81576 () Bool)

(assert (=> d!37421 e!81576))

(declare-fun res!60434 () Bool)

(assert (=> d!37421 (=> (not res!60434) (not e!81576))))

(assert (=> d!37421 (= res!60434 (or (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun lt!64163 () ListLongMap!1643)

(assert (=> d!37421 (= lt!64157 lt!64163)))

(declare-fun lt!64154 () Unit!3865)

(declare-fun e!81580 () Unit!3865)

(assert (=> d!37421 (= lt!64154 e!81580)))

(declare-fun c!22715 () Bool)

(assert (=> d!37421 (= c!22715 e!81584)))

(declare-fun res!60436 () Bool)

(assert (=> d!37421 (=> (not res!60436) (not e!81584))))

(assert (=> d!37421 (= res!60436 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun e!81582 () ListLongMap!1643)

(assert (=> d!37421 (= lt!64163 e!81582)))

(declare-fun c!22717 () Bool)

(assert (=> d!37421 (= c!22717 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37421 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37421 (= (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64157)))

(declare-fun b!124825 () Bool)

(declare-fun e!81575 () Bool)

(assert (=> b!124825 (= e!81575 (= (apply!110 lt!64157 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (_values!2746 newMap!16))))))

(assert (=> b!124825 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun c!22720 () Bool)

(declare-fun call!13354 () ListLongMap!1643)

(declare-fun bm!13350 () Bool)

(assert (=> bm!13350 (= call!13351 (+!157 (ite c!22717 call!13355 (ite c!22720 call!13357 call!13354)) (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun bm!13351 () Bool)

(assert (=> bm!13351 (= call!13354 call!13357)))

(declare-fun b!124826 () Bool)

(declare-fun e!81578 () ListLongMap!1643)

(assert (=> b!124826 (= e!81582 e!81578)))

(assert (=> b!124826 (= c!22720 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124827 () Bool)

(declare-fun Unit!3872 () Unit!3865)

(assert (=> b!124827 (= e!81580 Unit!3872)))

(declare-fun b!124828 () Bool)

(declare-fun res!60435 () Bool)

(assert (=> b!124828 (=> (not res!60435) (not e!81576))))

(declare-fun e!81583 () Bool)

(assert (=> b!124828 (= res!60435 e!81583)))

(declare-fun res!60432 () Bool)

(assert (=> b!124828 (=> res!60432 e!81583)))

(assert (=> b!124828 (= res!60432 (not e!81581))))

(declare-fun res!60440 () Bool)

(assert (=> b!124828 (=> (not res!60440) (not e!81581))))

(assert (=> b!124828 (= res!60440 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!124829 () Bool)

(declare-fun e!81574 () Bool)

(assert (=> b!124829 (= e!81574 e!81577)))

(declare-fun res!60439 () Bool)

(declare-fun call!13356 () Bool)

(assert (=> b!124829 (= res!60439 call!13356)))

(assert (=> b!124829 (=> (not res!60439) (not e!81577))))

(declare-fun bm!13352 () Bool)

(declare-fun call!13353 () Bool)

(assert (=> bm!13352 (= call!13353 (contains!863 lt!64157 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124830 () Bool)

(assert (=> b!124830 (= e!81578 call!13352)))

(declare-fun bm!13353 () Bool)

(assert (=> bm!13353 (= call!13355 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!124831 () Bool)

(declare-fun res!60438 () Bool)

(assert (=> b!124831 (=> (not res!60438) (not e!81576))))

(assert (=> b!124831 (= res!60438 e!81574)))

(declare-fun c!22718 () Bool)

(assert (=> b!124831 (= c!22718 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124832 () Bool)

(declare-fun e!81585 () Bool)

(assert (=> b!124832 (= e!81585 (not call!13353))))

(declare-fun b!124833 () Bool)

(assert (=> b!124833 (= e!81576 e!81585)))

(declare-fun c!22719 () Bool)

(assert (=> b!124833 (= c!22719 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124834 () Bool)

(assert (=> b!124834 (= e!81579 call!13354)))

(declare-fun b!124835 () Bool)

(assert (=> b!124835 (= e!81582 (+!157 call!13351 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!124836 () Bool)

(assert (=> b!124836 (= e!81585 e!81586)))

(declare-fun res!60437 () Bool)

(assert (=> b!124836 (= res!60437 call!13353)))

(assert (=> b!124836 (=> (not res!60437) (not e!81586))))

(declare-fun b!124837 () Bool)

(declare-fun lt!64159 () Unit!3865)

(assert (=> b!124837 (= e!81580 lt!64159)))

(declare-fun lt!64160 () ListLongMap!1643)

(assert (=> b!124837 (= lt!64160 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64162 () (_ BitVec 64))

(assert (=> b!124837 (= lt!64162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64147 () (_ BitVec 64))

(assert (=> b!124837 (= lt!64147 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64146 () Unit!3865)

(assert (=> b!124837 (= lt!64146 (addStillContains!86 lt!64160 lt!64162 (zeroValue!2628 newMap!16) lt!64147))))

(assert (=> b!124837 (contains!863 (+!157 lt!64160 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16))) lt!64147)))

(declare-fun lt!64156 () Unit!3865)

(assert (=> b!124837 (= lt!64156 lt!64146)))

(declare-fun lt!64153 () ListLongMap!1643)

(assert (=> b!124837 (= lt!64153 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64145 () (_ BitVec 64))

(assert (=> b!124837 (= lt!64145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64165 () (_ BitVec 64))

(assert (=> b!124837 (= lt!64165 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64148 () Unit!3865)

(assert (=> b!124837 (= lt!64148 (addApplyDifferent!86 lt!64153 lt!64145 (minValue!2628 newMap!16) lt!64165))))

(assert (=> b!124837 (= (apply!110 (+!157 lt!64153 (tuple2!2535 lt!64145 (minValue!2628 newMap!16))) lt!64165) (apply!110 lt!64153 lt!64165))))

(declare-fun lt!64150 () Unit!3865)

(assert (=> b!124837 (= lt!64150 lt!64148)))

(declare-fun lt!64166 () ListLongMap!1643)

(assert (=> b!124837 (= lt!64166 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64149 () (_ BitVec 64))

(assert (=> b!124837 (= lt!64149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64164 () (_ BitVec 64))

(assert (=> b!124837 (= lt!64164 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64158 () Unit!3865)

(assert (=> b!124837 (= lt!64158 (addApplyDifferent!86 lt!64166 lt!64149 (zeroValue!2628 newMap!16) lt!64164))))

(assert (=> b!124837 (= (apply!110 (+!157 lt!64166 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16))) lt!64164) (apply!110 lt!64166 lt!64164))))

(declare-fun lt!64155 () Unit!3865)

(assert (=> b!124837 (= lt!64155 lt!64158)))

(declare-fun lt!64151 () ListLongMap!1643)

(assert (=> b!124837 (= lt!64151 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64161 () (_ BitVec 64))

(assert (=> b!124837 (= lt!64161 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64152 () (_ BitVec 64))

(assert (=> b!124837 (= lt!64152 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124837 (= lt!64159 (addApplyDifferent!86 lt!64151 lt!64161 (minValue!2628 newMap!16) lt!64152))))

(assert (=> b!124837 (= (apply!110 (+!157 lt!64151 (tuple2!2535 lt!64161 (minValue!2628 newMap!16))) lt!64152) (apply!110 lt!64151 lt!64152))))

(declare-fun b!124838 () Bool)

(assert (=> b!124838 (= e!81574 (not call!13356))))

(declare-fun bm!13354 () Bool)

(assert (=> bm!13354 (= call!13356 (contains!863 lt!64157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124839 () Bool)

(assert (=> b!124839 (= e!81583 e!81575)))

(declare-fun res!60433 () Bool)

(assert (=> b!124839 (=> (not res!60433) (not e!81575))))

(assert (=> b!124839 (= res!60433 (contains!863 lt!64157 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!124839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!124840 () Bool)

(declare-fun c!22716 () Bool)

(assert (=> b!124840 (= c!22716 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124840 (= e!81578 e!81579)))

(assert (= (and d!37421 c!22717) b!124835))

(assert (= (and d!37421 (not c!22717)) b!124826))

(assert (= (and b!124826 c!22720) b!124830))

(assert (= (and b!124826 (not c!22720)) b!124840))

(assert (= (and b!124840 c!22716) b!124821))

(assert (= (and b!124840 (not c!22716)) b!124834))

(assert (= (or b!124821 b!124834) bm!13351))

(assert (= (or b!124830 bm!13351) bm!13348))

(assert (= (or b!124830 b!124821) bm!13349))

(assert (= (or b!124835 bm!13348) bm!13353))

(assert (= (or b!124835 bm!13349) bm!13350))

(assert (= (and d!37421 res!60436) b!124822))

(assert (= (and d!37421 c!22715) b!124837))

(assert (= (and d!37421 (not c!22715)) b!124827))

(assert (= (and d!37421 res!60434) b!124828))

(assert (= (and b!124828 res!60440) b!124824))

(assert (= (and b!124828 (not res!60432)) b!124839))

(assert (= (and b!124839 res!60433) b!124825))

(assert (= (and b!124828 res!60435) b!124831))

(assert (= (and b!124831 c!22718) b!124829))

(assert (= (and b!124831 (not c!22718)) b!124838))

(assert (= (and b!124829 res!60439) b!124820))

(assert (= (or b!124829 b!124838) bm!13354))

(assert (= (and b!124831 res!60438) b!124833))

(assert (= (and b!124833 c!22719) b!124836))

(assert (= (and b!124833 (not c!22719)) b!124832))

(assert (= (and b!124836 res!60437) b!124823))

(assert (= (or b!124836 b!124832) bm!13352))

(declare-fun b_lambda!5469 () Bool)

(assert (=> (not b_lambda!5469) (not b!124825)))

(assert (=> b!124825 t!6019))

(declare-fun b_and!7661 () Bool)

(assert (= b_and!7657 (and (=> t!6019 result!3815) b_and!7661)))

(assert (=> b!124825 t!6021))

(declare-fun b_and!7663 () Bool)

(assert (= b_and!7659 (and (=> t!6021 result!3817) b_and!7663)))

(assert (=> b!124839 m!144651))

(assert (=> b!124839 m!144651))

(declare-fun m!144747 () Bool)

(assert (=> b!124839 m!144747))

(declare-fun m!144749 () Bool)

(assert (=> b!124820 m!144749))

(declare-fun m!144751 () Bool)

(assert (=> b!124823 m!144751))

(assert (=> b!124824 m!144651))

(assert (=> b!124824 m!144651))

(assert (=> b!124824 m!144659))

(declare-fun m!144753 () Bool)

(assert (=> bm!13352 m!144753))

(declare-fun m!144755 () Bool)

(assert (=> bm!13350 m!144755))

(assert (=> b!124825 m!144665))

(declare-fun m!144757 () Bool)

(assert (=> b!124825 m!144757))

(assert (=> b!124825 m!144665))

(declare-fun m!144759 () Bool)

(assert (=> b!124825 m!144759))

(assert (=> b!124825 m!144651))

(assert (=> b!124825 m!144757))

(assert (=> b!124825 m!144651))

(declare-fun m!144761 () Bool)

(assert (=> b!124825 m!144761))

(declare-fun m!144763 () Bool)

(assert (=> bm!13354 m!144763))

(assert (=> b!124822 m!144651))

(assert (=> b!124822 m!144651))

(assert (=> b!124822 m!144659))

(declare-fun m!144765 () Bool)

(assert (=> b!124835 m!144765))

(declare-fun m!144767 () Bool)

(assert (=> bm!13353 m!144767))

(declare-fun m!144769 () Bool)

(assert (=> b!124837 m!144769))

(declare-fun m!144771 () Bool)

(assert (=> b!124837 m!144771))

(declare-fun m!144773 () Bool)

(assert (=> b!124837 m!144773))

(declare-fun m!144775 () Bool)

(assert (=> b!124837 m!144775))

(assert (=> b!124837 m!144767))

(assert (=> b!124837 m!144771))

(declare-fun m!144777 () Bool)

(assert (=> b!124837 m!144777))

(declare-fun m!144779 () Bool)

(assert (=> b!124837 m!144779))

(declare-fun m!144781 () Bool)

(assert (=> b!124837 m!144781))

(declare-fun m!144783 () Bool)

(assert (=> b!124837 m!144783))

(declare-fun m!144785 () Bool)

(assert (=> b!124837 m!144785))

(assert (=> b!124837 m!144651))

(declare-fun m!144787 () Bool)

(assert (=> b!124837 m!144787))

(declare-fun m!144789 () Bool)

(assert (=> b!124837 m!144789))

(declare-fun m!144791 () Bool)

(assert (=> b!124837 m!144791))

(declare-fun m!144793 () Bool)

(assert (=> b!124837 m!144793))

(assert (=> b!124837 m!144791))

(assert (=> b!124837 m!144779))

(declare-fun m!144795 () Bool)

(assert (=> b!124837 m!144795))

(assert (=> b!124837 m!144783))

(declare-fun m!144797 () Bool)

(assert (=> b!124837 m!144797))

(assert (=> d!37421 m!144709))

(assert (=> d!37401 d!37421))

(declare-fun b!124858 () Bool)

(declare-fun e!81596 () Bool)

(declare-fun call!13363 () Bool)

(assert (=> b!124858 (= e!81596 (not call!13363))))

(declare-fun b!124859 () Bool)

(declare-fun res!60452 () Bool)

(assert (=> b!124859 (=> (not res!60452) (not e!81596))))

(declare-fun call!13362 () Bool)

(assert (=> b!124859 (= res!60452 call!13362)))

(declare-fun e!81595 () Bool)

(assert (=> b!124859 (= e!81595 e!81596)))

(declare-fun b!124860 () Bool)

(declare-fun e!81597 () Bool)

(declare-fun e!81598 () Bool)

(assert (=> b!124860 (= e!81597 e!81598)))

(declare-fun res!60451 () Bool)

(assert (=> b!124860 (= res!60451 call!13362)))

(assert (=> b!124860 (=> (not res!60451) (not e!81598))))

(declare-fun b!124861 () Bool)

(declare-fun lt!64172 () SeekEntryResult!272)

(assert (=> b!124861 (and (bvsge (index!3242 lt!64172) #b00000000000000000000000000000000) (bvslt (index!3242 lt!64172) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun res!60449 () Bool)

(assert (=> b!124861 (= res!60449 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3242 lt!64172)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124861 (=> (not res!60449) (not e!81598))))

(declare-fun b!124862 () Bool)

(assert (=> b!124862 (= e!81598 (not call!13363))))

(declare-fun b!124863 () Bool)

(assert (=> b!124863 (= e!81597 e!81595)))

(declare-fun c!22726 () Bool)

(assert (=> b!124863 (= c!22726 ((_ is MissingVacant!272) lt!64172))))

(declare-fun bm!13359 () Bool)

(assert (=> bm!13359 (= call!13363 (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!124864 () Bool)

(declare-fun res!60450 () Bool)

(assert (=> b!124864 (=> (not res!60450) (not e!81596))))

(assert (=> b!124864 (= res!60450 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3245 lt!64172)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124864 (and (bvsge (index!3245 lt!64172) #b00000000000000000000000000000000) (bvslt (index!3245 lt!64172) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun bm!13360 () Bool)

(declare-fun c!22725 () Bool)

(assert (=> bm!13360 (= call!13362 (inRange!0 (ite c!22725 (index!3242 lt!64172) (index!3245 lt!64172)) (mask!7008 newMap!16)))))

(declare-fun d!37423 () Bool)

(assert (=> d!37423 e!81597))

(assert (=> d!37423 (= c!22725 ((_ is MissingZero!272) lt!64172))))

(assert (=> d!37423 (= lt!64172 (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun lt!64171 () Unit!3865)

(declare-fun choose!754 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) Int) Unit!3865)

(assert (=> d!37423 (= lt!64171 (choose!754 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37423 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37423 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)) lt!64171)))

(declare-fun b!124857 () Bool)

(assert (=> b!124857 (= e!81595 ((_ is Undefined!272) lt!64172))))

(assert (= (and d!37423 c!22725) b!124860))

(assert (= (and d!37423 (not c!22725)) b!124863))

(assert (= (and b!124860 res!60451) b!124861))

(assert (= (and b!124861 res!60449) b!124862))

(assert (= (and b!124863 c!22726) b!124859))

(assert (= (and b!124863 (not c!22726)) b!124857))

(assert (= (and b!124859 res!60452) b!124864))

(assert (= (and b!124864 res!60450) b!124858))

(assert (= (or b!124860 b!124859) bm!13360))

(assert (= (or b!124862 b!124858) bm!13359))

(assert (=> bm!13359 m!144407))

(assert (=> bm!13359 m!144517))

(declare-fun m!144799 () Bool)

(assert (=> bm!13360 m!144799))

(assert (=> d!37423 m!144407))

(assert (=> d!37423 m!144509))

(assert (=> d!37423 m!144407))

(declare-fun m!144801 () Bool)

(assert (=> d!37423 m!144801))

(assert (=> d!37423 m!144709))

(declare-fun m!144803 () Bool)

(assert (=> b!124861 m!144803))

(declare-fun m!144805 () Bool)

(assert (=> b!124864 m!144805))

(assert (=> bm!13309 d!37423))

(assert (=> bm!13298 d!37401))

(declare-fun b!124877 () Bool)

(declare-fun e!81607 () SeekEntryResult!272)

(assert (=> b!124877 (= e!81607 Undefined!272)))

(declare-fun b!124878 () Bool)

(declare-fun c!22734 () Bool)

(declare-fun lt!64180 () (_ BitVec 64))

(assert (=> b!124878 (= c!22734 (= lt!64180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81606 () SeekEntryResult!272)

(declare-fun e!81605 () SeekEntryResult!272)

(assert (=> b!124878 (= e!81606 e!81605)))

(declare-fun b!124879 () Bool)

(declare-fun lt!64181 () SeekEntryResult!272)

(assert (=> b!124879 (= e!81606 (Found!272 (index!3244 lt!64181)))))

(declare-fun b!124880 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4661 (_ BitVec 32)) SeekEntryResult!272)

(assert (=> b!124880 (= e!81605 (seekKeyOrZeroReturnVacant!0 (x!14820 lt!64181) (index!3244 lt!64181) (index!3244 lt!64181) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun lt!64179 () SeekEntryResult!272)

(declare-fun d!37425 () Bool)

(assert (=> d!37425 (and (or ((_ is Undefined!272) lt!64179) (not ((_ is Found!272) lt!64179)) (and (bvsge (index!3243 lt!64179) #b00000000000000000000000000000000) (bvslt (index!3243 lt!64179) (size!2470 (_keys!4491 newMap!16))))) (or ((_ is Undefined!272) lt!64179) ((_ is Found!272) lt!64179) (not ((_ is MissingZero!272) lt!64179)) (and (bvsge (index!3242 lt!64179) #b00000000000000000000000000000000) (bvslt (index!3242 lt!64179) (size!2470 (_keys!4491 newMap!16))))) (or ((_ is Undefined!272) lt!64179) ((_ is Found!272) lt!64179) ((_ is MissingZero!272) lt!64179) (not ((_ is MissingVacant!272) lt!64179)) (and (bvsge (index!3245 lt!64179) #b00000000000000000000000000000000) (bvslt (index!3245 lt!64179) (size!2470 (_keys!4491 newMap!16))))) (or ((_ is Undefined!272) lt!64179) (ite ((_ is Found!272) lt!64179) (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64179)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (ite ((_ is MissingZero!272) lt!64179) (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3242 lt!64179)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!272) lt!64179) (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3245 lt!64179)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37425 (= lt!64179 e!81607)))

(declare-fun c!22733 () Bool)

(assert (=> d!37425 (= c!22733 (and ((_ is Intermediate!272) lt!64181) (undefined!1084 lt!64181)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4661 (_ BitVec 32)) SeekEntryResult!272)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!37425 (= lt!64181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (mask!7008 newMap!16)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(assert (=> d!37425 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37425 (= (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)) lt!64179)))

(declare-fun b!124881 () Bool)

(assert (=> b!124881 (= e!81605 (MissingZero!272 (index!3244 lt!64181)))))

(declare-fun b!124882 () Bool)

(assert (=> b!124882 (= e!81607 e!81606)))

(assert (=> b!124882 (= lt!64180 (select (arr!2206 (_keys!4491 newMap!16)) (index!3244 lt!64181)))))

(declare-fun c!22735 () Bool)

(assert (=> b!124882 (= c!22735 (= lt!64180 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37425 c!22733) b!124877))

(assert (= (and d!37425 (not c!22733)) b!124882))

(assert (= (and b!124882 c!22735) b!124879))

(assert (= (and b!124882 (not c!22735)) b!124878))

(assert (= (and b!124878 c!22734) b!124881))

(assert (= (and b!124878 (not c!22734)) b!124880))

(assert (=> b!124880 m!144407))

(declare-fun m!144807 () Bool)

(assert (=> b!124880 m!144807))

(declare-fun m!144809 () Bool)

(assert (=> d!37425 m!144809))

(assert (=> d!37425 m!144407))

(declare-fun m!144811 () Bool)

(assert (=> d!37425 m!144811))

(assert (=> d!37425 m!144811))

(assert (=> d!37425 m!144407))

(declare-fun m!144813 () Bool)

(assert (=> d!37425 m!144813))

(declare-fun m!144815 () Bool)

(assert (=> d!37425 m!144815))

(declare-fun m!144817 () Bool)

(assert (=> d!37425 m!144817))

(assert (=> d!37425 m!144709))

(declare-fun m!144819 () Bool)

(assert (=> b!124882 m!144819))

(assert (=> b!124672 d!37425))

(declare-fun d!37427 () Bool)

(assert (=> d!37427 (isDefined!118 (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun lt!64184 () Unit!3865)

(declare-fun choose!755 (List!1689 (_ BitVec 64)) Unit!3865)

(assert (=> d!37427 (= lt!64184 (choose!755 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun e!81610 () Bool)

(assert (=> d!37427 e!81610))

(declare-fun res!60455 () Bool)

(assert (=> d!37427 (=> (not res!60455) (not e!81610))))

(declare-fun isStrictlySorted!311 (List!1689) Bool)

(assert (=> d!37427 (= res!60455 (isStrictlySorted!311 (toList!837 lt!63929)))))

(assert (=> d!37427 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) lt!64184)))

(declare-fun b!124885 () Bool)

(assert (=> b!124885 (= e!81610 (containsKey!168 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37427 res!60455) b!124885))

(assert (=> d!37427 m!144407))

(assert (=> d!37427 m!144505))

(assert (=> d!37427 m!144505))

(assert (=> d!37427 m!144507))

(assert (=> d!37427 m!144407))

(declare-fun m!144821 () Bool)

(assert (=> d!37427 m!144821))

(declare-fun m!144823 () Bool)

(assert (=> d!37427 m!144823))

(assert (=> b!124885 m!144407))

(assert (=> b!124885 m!144501))

(assert (=> b!124572 d!37427))

(declare-fun d!37429 () Bool)

(declare-fun isEmpty!397 (Option!170) Bool)

(assert (=> d!37429 (= (isDefined!118 (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))) (not (isEmpty!397 (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))))

(declare-fun bs!5148 () Bool)

(assert (= bs!5148 d!37429))

(assert (=> bs!5148 m!144505))

(declare-fun m!144825 () Bool)

(assert (=> bs!5148 m!144825))

(assert (=> b!124572 d!37429))

(declare-fun e!81616 () Option!170)

(declare-fun b!124896 () Bool)

(assert (=> b!124896 (= e!81616 (getValueByKey!164 (t!6007 (toList!837 lt!63929)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun c!22740 () Bool)

(declare-fun d!37431 () Bool)

(assert (=> d!37431 (= c!22740 (and ((_ is Cons!1685) (toList!837 lt!63929)) (= (_1!1278 (h!2286 (toList!837 lt!63929))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(declare-fun e!81615 () Option!170)

(assert (=> d!37431 (= (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) e!81615)))

(declare-fun b!124897 () Bool)

(assert (=> b!124897 (= e!81616 None!168)))

(declare-fun b!124895 () Bool)

(assert (=> b!124895 (= e!81615 e!81616)))

(declare-fun c!22741 () Bool)

(assert (=> b!124895 (= c!22741 (and ((_ is Cons!1685) (toList!837 lt!63929)) (not (= (_1!1278 (h!2286 (toList!837 lt!63929))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))))

(declare-fun b!124894 () Bool)

(assert (=> b!124894 (= e!81615 (Some!169 (_2!1278 (h!2286 (toList!837 lt!63929)))))))

(assert (= (and d!37431 c!22740) b!124894))

(assert (= (and d!37431 (not c!22740)) b!124895))

(assert (= (and b!124895 c!22741) b!124896))

(assert (= (and b!124895 (not c!22741)) b!124897))

(assert (=> b!124896 m!144407))

(declare-fun m!144827 () Bool)

(assert (=> b!124896 m!144827))

(assert (=> b!124572 d!37431))

(declare-fun d!37433 () Bool)

(declare-fun e!81617 () Bool)

(assert (=> d!37433 e!81617))

(declare-fun res!60456 () Bool)

(assert (=> d!37433 (=> res!60456 e!81617)))

(declare-fun lt!64185 () Bool)

(assert (=> d!37433 (= res!60456 (not lt!64185))))

(declare-fun lt!64188 () Bool)

(assert (=> d!37433 (= lt!64185 lt!64188)))

(declare-fun lt!64187 () Unit!3865)

(declare-fun e!81618 () Unit!3865)

(assert (=> d!37433 (= lt!64187 e!81618)))

(declare-fun c!22742 () Bool)

(assert (=> d!37433 (= c!22742 lt!64188)))

(assert (=> d!37433 (= lt!64188 (containsKey!168 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37433 (= (contains!863 lt!64097 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64185)))

(declare-fun b!124898 () Bool)

(declare-fun lt!64186 () Unit!3865)

(assert (=> b!124898 (= e!81618 lt!64186)))

(assert (=> b!124898 (= lt!64186 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124898 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124899 () Bool)

(declare-fun Unit!3873 () Unit!3865)

(assert (=> b!124899 (= e!81618 Unit!3873)))

(declare-fun b!124900 () Bool)

(assert (=> b!124900 (= e!81617 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37433 c!22742) b!124898))

(assert (= (and d!37433 (not c!22742)) b!124899))

(assert (= (and d!37433 (not res!60456)) b!124900))

(declare-fun m!144829 () Bool)

(assert (=> d!37433 m!144829))

(declare-fun m!144831 () Bool)

(assert (=> b!124898 m!144831))

(declare-fun m!144833 () Bool)

(assert (=> b!124898 m!144833))

(assert (=> b!124898 m!144833))

(declare-fun m!144835 () Bool)

(assert (=> b!124898 m!144835))

(assert (=> b!124900 m!144833))

(assert (=> b!124900 m!144833))

(assert (=> b!124900 m!144835))

(assert (=> bm!13338 d!37433))

(declare-fun d!37435 () Bool)

(assert (=> d!37435 (= (inRange!0 (ite c!22682 (ite c!22674 (index!3243 lt!64029) (ite c!22683 (index!3242 lt!64034) (index!3245 lt!64034))) (ite c!22679 (index!3243 lt!64036) (ite c!22675 (index!3242 lt!64020) (index!3245 lt!64020)))) (mask!7008 newMap!16)) (and (bvsge (ite c!22682 (ite c!22674 (index!3243 lt!64029) (ite c!22683 (index!3242 lt!64034) (index!3245 lt!64034))) (ite c!22679 (index!3243 lt!64036) (ite c!22675 (index!3242 lt!64020) (index!3245 lt!64020)))) #b00000000000000000000000000000000) (bvslt (ite c!22682 (ite c!22674 (index!3243 lt!64029) (ite c!22683 (index!3242 lt!64034) (index!3245 lt!64034))) (ite c!22679 (index!3243 lt!64036) (ite c!22675 (index!3242 lt!64020) (index!3245 lt!64020)))) (bvadd (mask!7008 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13303 d!37435))

(declare-fun d!37437 () Bool)

(declare-fun res!60461 () Bool)

(declare-fun e!81623 () Bool)

(assert (=> d!37437 (=> res!60461 e!81623)))

(assert (=> d!37437 (= res!60461 (= (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!37437 (= (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000) e!81623)))

(declare-fun b!124905 () Bool)

(declare-fun e!81624 () Bool)

(assert (=> b!124905 (= e!81623 e!81624)))

(declare-fun res!60462 () Bool)

(assert (=> b!124905 (=> (not res!60462) (not e!81624))))

(assert (=> b!124905 (= res!60462 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!124906 () Bool)

(assert (=> b!124906 (= e!81624 (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37437 (not res!60461)) b!124905))

(assert (= (and b!124905 res!60462) b!124906))

(assert (=> d!37437 m!144651))

(assert (=> b!124906 m!144407))

(declare-fun m!144837 () Bool)

(assert (=> b!124906 m!144837))

(assert (=> bm!13310 d!37437))

(declare-fun d!37439 () Bool)

(declare-fun e!81627 () Bool)

(assert (=> d!37439 e!81627))

(declare-fun res!60465 () Bool)

(assert (=> d!37439 (=> (not res!60465) (not e!81627))))

(assert (=> d!37439 (= res!60465 (and (bvsge (index!3243 lt!64028) #b00000000000000000000000000000000) (bvslt (index!3243 lt!64028) (size!2470 (_keys!4491 newMap!16)))))))

(declare-fun lt!64191 () Unit!3865)

(declare-fun choose!756 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) Int) Unit!3865)

(assert (=> d!37439 (= lt!64191 (choose!756 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3243 lt!64028) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37439 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37439 (= (lemmaValidKeyInArrayIsInListMap!114 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3243 lt!64028) (defaultEntry!2763 newMap!16)) lt!64191)))

(declare-fun b!124909 () Bool)

(assert (=> b!124909 (= e!81627 (contains!863 (getCurrentListMap!507 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))))

(assert (= (and d!37439 res!60465) b!124909))

(declare-fun m!144839 () Bool)

(assert (=> d!37439 m!144839))

(assert (=> d!37439 m!144709))

(declare-fun m!144841 () Bool)

(assert (=> b!124909 m!144841))

(assert (=> b!124909 m!144559))

(assert (=> b!124909 m!144841))

(assert (=> b!124909 m!144559))

(declare-fun m!144843 () Bool)

(assert (=> b!124909 m!144843))

(assert (=> b!124676 d!37439))

(declare-fun d!37441 () Bool)

(declare-fun e!81630 () Bool)

(assert (=> d!37441 e!81630))

(declare-fun res!60468 () Bool)

(assert (=> d!37441 (=> (not res!60468) (not e!81630))))

(assert (=> d!37441 (= res!60468 (and (bvsge (index!3243 lt!64028) #b00000000000000000000000000000000) (bvslt (index!3243 lt!64028) (size!2471 (_values!2746 newMap!16)))))))

(declare-fun lt!64194 () Unit!3865)

(declare-fun choose!757 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) (_ BitVec 64) V!3425 Int) Unit!3865)

(assert (=> d!37441 (= lt!64194 (choose!757 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3243 lt!64028) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37441 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37441 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3243 lt!64028) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) lt!64194)))

(declare-fun b!124912 () Bool)

(assert (=> b!124912 (= e!81630 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!507 (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))))

(assert (= (and d!37441 res!60468) b!124912))

(assert (=> d!37441 m!144407))

(assert (=> d!37441 m!144419))

(declare-fun m!144845 () Bool)

(assert (=> d!37441 m!144845))

(assert (=> d!37441 m!144709))

(assert (=> b!124912 m!144527))

(assert (=> b!124912 m!144527))

(declare-fun m!144847 () Bool)

(assert (=> b!124912 m!144847))

(assert (=> b!124912 m!144521))

(declare-fun m!144849 () Bool)

(assert (=> b!124912 m!144849))

(assert (=> b!124676 d!37441))

(declare-fun d!37443 () Bool)

(declare-fun e!81631 () Bool)

(assert (=> d!37443 e!81631))

(declare-fun res!60469 () Bool)

(assert (=> d!37443 (=> res!60469 e!81631)))

(declare-fun lt!64195 () Bool)

(assert (=> d!37443 (= res!60469 (not lt!64195))))

(declare-fun lt!64198 () Bool)

(assert (=> d!37443 (= lt!64195 lt!64198)))

(declare-fun lt!64197 () Unit!3865)

(declare-fun e!81632 () Unit!3865)

(assert (=> d!37443 (= lt!64197 e!81632)))

(declare-fun c!22743 () Bool)

(assert (=> d!37443 (= c!22743 lt!64198)))

(assert (=> d!37443 (= lt!64198 (containsKey!168 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!37443 (= (contains!863 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) lt!64195)))

(declare-fun b!124913 () Bool)

(declare-fun lt!64196 () Unit!3865)

(assert (=> b!124913 (= e!81632 lt!64196)))

(assert (=> b!124913 (= lt!64196 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> b!124913 (isDefined!118 (getValueByKey!164 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun b!124914 () Bool)

(declare-fun Unit!3874 () Unit!3865)

(assert (=> b!124914 (= e!81632 Unit!3874)))

(declare-fun b!124915 () Bool)

(assert (=> b!124915 (= e!81631 (isDefined!118 (getValueByKey!164 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (= (and d!37443 c!22743) b!124913))

(assert (= (and d!37443 (not c!22743)) b!124914))

(assert (= (and d!37443 (not res!60469)) b!124915))

(assert (=> d!37443 m!144407))

(declare-fun m!144851 () Bool)

(assert (=> d!37443 m!144851))

(assert (=> b!124913 m!144407))

(declare-fun m!144853 () Bool)

(assert (=> b!124913 m!144853))

(assert (=> b!124913 m!144407))

(declare-fun m!144855 () Bool)

(assert (=> b!124913 m!144855))

(assert (=> b!124913 m!144855))

(declare-fun m!144857 () Bool)

(assert (=> b!124913 m!144857))

(assert (=> b!124915 m!144407))

(assert (=> b!124915 m!144855))

(assert (=> b!124915 m!144855))

(assert (=> b!124915 m!144857))

(assert (=> b!124676 d!37443))

(assert (=> b!124676 d!37421))

(declare-fun d!37445 () Bool)

(assert (=> d!37445 (= (get!1437 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3100 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> b!124699 d!37445))

(assert (=> d!37403 d!37391))

(declare-fun bm!13361 () Bool)

(declare-fun call!13370 () ListLongMap!1643)

(declare-fun call!13368 () ListLongMap!1643)

(assert (=> bm!13361 (= call!13370 call!13368)))

(declare-fun e!81636 () Bool)

(declare-fun b!124916 () Bool)

(declare-fun lt!64211 () ListLongMap!1643)

(assert (=> b!124916 (= e!81636 (= (apply!110 lt!64211 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))

(declare-fun b!124917 () Bool)

(declare-fun e!81638 () ListLongMap!1643)

(declare-fun call!13365 () ListLongMap!1643)

(assert (=> b!124917 (= e!81638 call!13365)))

(declare-fun bm!13362 () Bool)

(declare-fun call!13364 () ListLongMap!1643)

(assert (=> bm!13362 (= call!13365 call!13364)))

(declare-fun b!124918 () Bool)

(declare-fun e!81643 () Bool)

(assert (=> b!124918 (= e!81643 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!81645 () Bool)

(declare-fun b!124919 () Bool)

(assert (=> b!124919 (= e!81645 (= (apply!110 lt!64211 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))

(declare-fun b!124920 () Bool)

(declare-fun e!81640 () Bool)

(assert (=> b!124920 (= e!81640 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37447 () Bool)

(declare-fun e!81635 () Bool)

(assert (=> d!37447 e!81635))

(declare-fun res!60472 () Bool)

(assert (=> d!37447 (=> (not res!60472) (not e!81635))))

(assert (=> d!37447 (= res!60472 (or (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun lt!64217 () ListLongMap!1643)

(assert (=> d!37447 (= lt!64211 lt!64217)))

(declare-fun lt!64208 () Unit!3865)

(declare-fun e!81639 () Unit!3865)

(assert (=> d!37447 (= lt!64208 e!81639)))

(declare-fun c!22744 () Bool)

(assert (=> d!37447 (= c!22744 e!81643)))

(declare-fun res!60474 () Bool)

(assert (=> d!37447 (=> (not res!60474) (not e!81643))))

(assert (=> d!37447 (= res!60474 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun e!81641 () ListLongMap!1643)

(assert (=> d!37447 (= lt!64217 e!81641)))

(declare-fun c!22746 () Bool)

(assert (=> d!37447 (= c!22746 (and (not (= (bvand (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37447 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37447 (= (getCurrentListMap!507 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64211)))

(declare-fun e!81634 () Bool)

(declare-fun b!124921 () Bool)

(assert (=> b!124921 (= e!81634 (= (apply!110 lt!64211 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!124921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))))))))

(assert (=> b!124921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun call!13367 () ListLongMap!1643)

(declare-fun bm!13363 () Bool)

(declare-fun c!22749 () Bool)

(assert (=> bm!13363 (= call!13364 (+!157 (ite c!22746 call!13368 (ite c!22749 call!13370 call!13367)) (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(declare-fun bm!13364 () Bool)

(assert (=> bm!13364 (= call!13367 call!13370)))

(declare-fun b!124922 () Bool)

(declare-fun e!81637 () ListLongMap!1643)

(assert (=> b!124922 (= e!81641 e!81637)))

(assert (=> b!124922 (= c!22749 (and (not (= (bvand (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124923 () Bool)

(declare-fun Unit!3875 () Unit!3865)

(assert (=> b!124923 (= e!81639 Unit!3875)))

(declare-fun b!124924 () Bool)

(declare-fun res!60473 () Bool)

(assert (=> b!124924 (=> (not res!60473) (not e!81635))))

(declare-fun e!81642 () Bool)

(assert (=> b!124924 (= res!60473 e!81642)))

(declare-fun res!60470 () Bool)

(assert (=> b!124924 (=> res!60470 e!81642)))

(assert (=> b!124924 (= res!60470 (not e!81640))))

(declare-fun res!60478 () Bool)

(assert (=> b!124924 (=> (not res!60478) (not e!81640))))

(assert (=> b!124924 (= res!60478 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!124925 () Bool)

(declare-fun e!81633 () Bool)

(assert (=> b!124925 (= e!81633 e!81636)))

(declare-fun res!60477 () Bool)

(declare-fun call!13369 () Bool)

(assert (=> b!124925 (= res!60477 call!13369)))

(assert (=> b!124925 (=> (not res!60477) (not e!81636))))

(declare-fun bm!13365 () Bool)

(declare-fun call!13366 () Bool)

(assert (=> bm!13365 (= call!13366 (contains!863 lt!64211 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124926 () Bool)

(assert (=> b!124926 (= e!81637 call!13365)))

(declare-fun bm!13366 () Bool)

(assert (=> bm!13366 (= call!13368 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!124927 () Bool)

(declare-fun res!60476 () Bool)

(assert (=> b!124927 (=> (not res!60476) (not e!81635))))

(assert (=> b!124927 (= res!60476 e!81633)))

(declare-fun c!22747 () Bool)

(assert (=> b!124927 (= c!22747 (not (= (bvand (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!124928 () Bool)

(declare-fun e!81644 () Bool)

(assert (=> b!124928 (= e!81644 (not call!13366))))

(declare-fun b!124929 () Bool)

(assert (=> b!124929 (= e!81635 e!81644)))

(declare-fun c!22748 () Bool)

(assert (=> b!124929 (= c!22748 (not (= (bvand (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!124930 () Bool)

(assert (=> b!124930 (= e!81638 call!13367)))

(declare-fun b!124931 () Bool)

(assert (=> b!124931 (= e!81641 (+!157 call!13364 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))

(declare-fun b!124932 () Bool)

(assert (=> b!124932 (= e!81644 e!81645)))

(declare-fun res!60475 () Bool)

(assert (=> b!124932 (= res!60475 call!13366)))

(assert (=> b!124932 (=> (not res!60475) (not e!81645))))

(declare-fun b!124933 () Bool)

(declare-fun lt!64213 () Unit!3865)

(assert (=> b!124933 (= e!81639 lt!64213)))

(declare-fun lt!64214 () ListLongMap!1643)

(assert (=> b!124933 (= lt!64214 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64216 () (_ BitVec 64))

(assert (=> b!124933 (= lt!64216 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64201 () (_ BitVec 64))

(assert (=> b!124933 (= lt!64201 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64200 () Unit!3865)

(assert (=> b!124933 (= lt!64200 (addStillContains!86 lt!64214 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64201))))

(assert (=> b!124933 (contains!863 (+!157 lt!64214 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64201)))

(declare-fun lt!64210 () Unit!3865)

(assert (=> b!124933 (= lt!64210 lt!64200)))

(declare-fun lt!64207 () ListLongMap!1643)

(assert (=> b!124933 (= lt!64207 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64199 () (_ BitVec 64))

(assert (=> b!124933 (= lt!64199 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64219 () (_ BitVec 64))

(assert (=> b!124933 (= lt!64219 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64202 () Unit!3865)

(assert (=> b!124933 (= lt!64202 (addApplyDifferent!86 lt!64207 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64219))))

(assert (=> b!124933 (= (apply!110 (+!157 lt!64207 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64219) (apply!110 lt!64207 lt!64219))))

(declare-fun lt!64204 () Unit!3865)

(assert (=> b!124933 (= lt!64204 lt!64202)))

(declare-fun lt!64220 () ListLongMap!1643)

(assert (=> b!124933 (= lt!64220 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64203 () (_ BitVec 64))

(assert (=> b!124933 (= lt!64203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64218 () (_ BitVec 64))

(assert (=> b!124933 (= lt!64218 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64212 () Unit!3865)

(assert (=> b!124933 (= lt!64212 (addApplyDifferent!86 lt!64220 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64218))))

(assert (=> b!124933 (= (apply!110 (+!157 lt!64220 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64218) (apply!110 lt!64220 lt!64218))))

(declare-fun lt!64209 () Unit!3865)

(assert (=> b!124933 (= lt!64209 lt!64212)))

(declare-fun lt!64205 () ListLongMap!1643)

(assert (=> b!124933 (= lt!64205 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64215 () (_ BitVec 64))

(assert (=> b!124933 (= lt!64215 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64206 () (_ BitVec 64))

(assert (=> b!124933 (= lt!64206 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!124933 (= lt!64213 (addApplyDifferent!86 lt!64205 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64206))))

(assert (=> b!124933 (= (apply!110 (+!157 lt!64205 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64206) (apply!110 lt!64205 lt!64206))))

(declare-fun b!124934 () Bool)

(assert (=> b!124934 (= e!81633 (not call!13369))))

(declare-fun bm!13367 () Bool)

(assert (=> bm!13367 (= call!13369 (contains!863 lt!64211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!124935 () Bool)

(assert (=> b!124935 (= e!81642 e!81634)))

(declare-fun res!60471 () Bool)

(assert (=> b!124935 (=> (not res!60471) (not e!81634))))

(assert (=> b!124935 (= res!60471 (contains!863 lt!64211 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!124935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun c!22745 () Bool)

(declare-fun b!124936 () Bool)

(assert (=> b!124936 (= c!22745 (and (not (= (bvand (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!124936 (= e!81637 e!81638)))

(assert (= (and d!37447 c!22746) b!124931))

(assert (= (and d!37447 (not c!22746)) b!124922))

(assert (= (and b!124922 c!22749) b!124926))

(assert (= (and b!124922 (not c!22749)) b!124936))

(assert (= (and b!124936 c!22745) b!124917))

(assert (= (and b!124936 (not c!22745)) b!124930))

(assert (= (or b!124917 b!124930) bm!13364))

(assert (= (or b!124926 bm!13364) bm!13361))

(assert (= (or b!124926 b!124917) bm!13362))

(assert (= (or b!124931 bm!13361) bm!13366))

(assert (= (or b!124931 bm!13362) bm!13363))

(assert (= (and d!37447 res!60474) b!124918))

(assert (= (and d!37447 c!22744) b!124933))

(assert (= (and d!37447 (not c!22744)) b!124923))

(assert (= (and d!37447 res!60472) b!124924))

(assert (= (and b!124924 res!60478) b!124920))

(assert (= (and b!124924 (not res!60470)) b!124935))

(assert (= (and b!124935 res!60471) b!124921))

(assert (= (and b!124924 res!60473) b!124927))

(assert (= (and b!124927 c!22747) b!124925))

(assert (= (and b!124927 (not c!22747)) b!124934))

(assert (= (and b!124925 res!60477) b!124916))

(assert (= (or b!124925 b!124934) bm!13367))

(assert (= (and b!124927 res!60476) b!124929))

(assert (= (and b!124929 c!22748) b!124932))

(assert (= (and b!124929 (not c!22748)) b!124928))

(assert (= (and b!124932 res!60475) b!124919))

(assert (= (or b!124932 b!124928) bm!13365))

(declare-fun b_lambda!5471 () Bool)

(assert (=> (not b_lambda!5471) (not b!124921)))

(assert (=> b!124921 t!6019))

(declare-fun b_and!7665 () Bool)

(assert (= b_and!7661 (and (=> t!6019 result!3815) b_and!7665)))

(assert (=> b!124921 t!6021))

(declare-fun b_and!7667 () Bool)

(assert (= b_and!7663 (and (=> t!6021 result!3817) b_and!7667)))

(assert (=> b!124935 m!144651))

(assert (=> b!124935 m!144651))

(declare-fun m!144859 () Bool)

(assert (=> b!124935 m!144859))

(declare-fun m!144861 () Bool)

(assert (=> b!124916 m!144861))

(declare-fun m!144863 () Bool)

(assert (=> b!124919 m!144863))

(assert (=> b!124920 m!144651))

(assert (=> b!124920 m!144651))

(assert (=> b!124920 m!144659))

(declare-fun m!144865 () Bool)

(assert (=> bm!13365 m!144865))

(declare-fun m!144867 () Bool)

(assert (=> bm!13363 m!144867))

(assert (=> b!124921 m!144665))

(declare-fun m!144869 () Bool)

(assert (=> b!124921 m!144869))

(assert (=> b!124921 m!144665))

(declare-fun m!144871 () Bool)

(assert (=> b!124921 m!144871))

(assert (=> b!124921 m!144651))

(assert (=> b!124921 m!144869))

(assert (=> b!124921 m!144651))

(declare-fun m!144873 () Bool)

(assert (=> b!124921 m!144873))

(declare-fun m!144875 () Bool)

(assert (=> bm!13367 m!144875))

(assert (=> b!124918 m!144651))

(assert (=> b!124918 m!144651))

(assert (=> b!124918 m!144659))

(declare-fun m!144877 () Bool)

(assert (=> b!124931 m!144877))

(declare-fun m!144879 () Bool)

(assert (=> bm!13366 m!144879))

(declare-fun m!144881 () Bool)

(assert (=> b!124933 m!144881))

(declare-fun m!144883 () Bool)

(assert (=> b!124933 m!144883))

(declare-fun m!144885 () Bool)

(assert (=> b!124933 m!144885))

(declare-fun m!144887 () Bool)

(assert (=> b!124933 m!144887))

(assert (=> b!124933 m!144879))

(assert (=> b!124933 m!144883))

(declare-fun m!144889 () Bool)

(assert (=> b!124933 m!144889))

(declare-fun m!144891 () Bool)

(assert (=> b!124933 m!144891))

(declare-fun m!144893 () Bool)

(assert (=> b!124933 m!144893))

(declare-fun m!144895 () Bool)

(assert (=> b!124933 m!144895))

(declare-fun m!144897 () Bool)

(assert (=> b!124933 m!144897))

(assert (=> b!124933 m!144651))

(declare-fun m!144899 () Bool)

(assert (=> b!124933 m!144899))

(declare-fun m!144901 () Bool)

(assert (=> b!124933 m!144901))

(declare-fun m!144903 () Bool)

(assert (=> b!124933 m!144903))

(declare-fun m!144905 () Bool)

(assert (=> b!124933 m!144905))

(assert (=> b!124933 m!144903))

(assert (=> b!124933 m!144891))

(declare-fun m!144907 () Bool)

(assert (=> b!124933 m!144907))

(assert (=> b!124933 m!144895))

(declare-fun m!144909 () Bool)

(assert (=> b!124933 m!144909))

(assert (=> d!37447 m!144709))

(assert (=> bm!13312 d!37447))

(declare-fun b!124961 () Bool)

(declare-fun e!81663 () Bool)

(assert (=> b!124961 (= e!81663 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124961 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!124962 () Bool)

(declare-fun lt!64240 () Unit!3865)

(declare-fun lt!64239 () Unit!3865)

(assert (=> b!124962 (= lt!64240 lt!64239)))

(declare-fun lt!64241 () (_ BitVec 64))

(declare-fun lt!64235 () ListLongMap!1643)

(declare-fun lt!64238 () V!3425)

(declare-fun lt!64237 () (_ BitVec 64))

(assert (=> b!124962 (not (contains!863 (+!157 lt!64235 (tuple2!2535 lt!64241 lt!64238)) lt!64237))))

(declare-fun addStillNotContains!56 (ListLongMap!1643 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3865)

(assert (=> b!124962 (= lt!64239 (addStillNotContains!56 lt!64235 lt!64241 lt!64238 lt!64237))))

(assert (=> b!124962 (= lt!64237 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!124962 (= lt!64238 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!124962 (= lt!64241 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!13373 () ListLongMap!1643)

(assert (=> b!124962 (= lt!64235 call!13373)))

(declare-fun e!81666 () ListLongMap!1643)

(assert (=> b!124962 (= e!81666 (+!157 call!13373 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!37449 () Bool)

(declare-fun e!81665 () Bool)

(assert (=> d!37449 e!81665))

(declare-fun res!60488 () Bool)

(assert (=> d!37449 (=> (not res!60488) (not e!81665))))

(declare-fun lt!64236 () ListLongMap!1643)

(assert (=> d!37449 (= res!60488 (not (contains!863 lt!64236 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81664 () ListLongMap!1643)

(assert (=> d!37449 (= lt!64236 e!81664)))

(declare-fun c!22759 () Bool)

(assert (=> d!37449 (= c!22759 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> d!37449 (validMask!0 (mask!7008 (v!3101 (underlying!432 thiss!992))))))

(assert (=> d!37449 (= (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))) lt!64236)))

(declare-fun b!124963 () Bool)

(assert (=> b!124963 (= e!81666 call!13373)))

(declare-fun bm!13370 () Bool)

(assert (=> bm!13370 (= call!13373 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!124964 () Bool)

(declare-fun e!81660 () Bool)

(assert (=> b!124964 (= e!81665 e!81660)))

(declare-fun c!22758 () Bool)

(assert (=> b!124964 (= c!22758 e!81663)))

(declare-fun res!60490 () Bool)

(assert (=> b!124964 (=> (not res!60490) (not e!81663))))

(assert (=> b!124964 (= res!60490 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!124965 () Bool)

(assert (=> b!124965 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> b!124965 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2471 (_values!2746 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun e!81661 () Bool)

(assert (=> b!124965 (= e!81661 (= (apply!110 lt!64236 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!81662 () Bool)

(declare-fun b!124966 () Bool)

(assert (=> b!124966 (= e!81662 (= lt!64236 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!124967 () Bool)

(assert (=> b!124967 (= e!81660 e!81661)))

(assert (=> b!124967 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun res!60489 () Bool)

(assert (=> b!124967 (= res!60489 (contains!863 lt!64236 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124967 (=> (not res!60489) (not e!81661))))

(declare-fun b!124968 () Bool)

(declare-fun res!60487 () Bool)

(assert (=> b!124968 (=> (not res!60487) (not e!81665))))

(assert (=> b!124968 (= res!60487 (not (contains!863 lt!64236 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!124969 () Bool)

(assert (=> b!124969 (= e!81660 e!81662)))

(declare-fun c!22761 () Bool)

(assert (=> b!124969 (= c!22761 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!124970 () Bool)

(assert (=> b!124970 (= e!81664 e!81666)))

(declare-fun c!22760 () Bool)

(assert (=> b!124970 (= c!22760 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!124971 () Bool)

(declare-fun isEmpty!398 (ListLongMap!1643) Bool)

(assert (=> b!124971 (= e!81662 (isEmpty!398 lt!64236))))

(declare-fun b!124972 () Bool)

(assert (=> b!124972 (= e!81664 (ListLongMap!1644 Nil!1686))))

(assert (= (and d!37449 c!22759) b!124972))

(assert (= (and d!37449 (not c!22759)) b!124970))

(assert (= (and b!124970 c!22760) b!124962))

(assert (= (and b!124970 (not c!22760)) b!124963))

(assert (= (or b!124962 b!124963) bm!13370))

(assert (= (and d!37449 res!60488) b!124968))

(assert (= (and b!124968 res!60487) b!124964))

(assert (= (and b!124964 res!60490) b!124961))

(assert (= (and b!124964 c!22758) b!124967))

(assert (= (and b!124964 (not c!22758)) b!124969))

(assert (= (and b!124967 res!60489) b!124965))

(assert (= (and b!124969 c!22761) b!124966))

(assert (= (and b!124969 (not c!22761)) b!124971))

(declare-fun b_lambda!5473 () Bool)

(assert (=> (not b_lambda!5473) (not b!124962)))

(assert (=> b!124962 t!6004))

(declare-fun b_and!7669 () Bool)

(assert (= b_and!7665 (and (=> t!6004 result!3795) b_and!7669)))

(assert (=> b!124962 t!6006))

(declare-fun b_and!7671 () Bool)

(assert (= b_and!7667 (and (=> t!6006 result!3799) b_and!7671)))

(declare-fun b_lambda!5475 () Bool)

(assert (=> (not b_lambda!5475) (not b!124965)))

(assert (=> b!124965 t!6004))

(declare-fun b_and!7673 () Bool)

(assert (= b_and!7669 (and (=> t!6004 result!3795) b_and!7673)))

(assert (=> b!124965 t!6006))

(declare-fun b_and!7675 () Bool)

(assert (= b_and!7671 (and (=> t!6006 result!3799) b_and!7675)))

(declare-fun m!144911 () Bool)

(assert (=> b!124968 m!144911))

(declare-fun m!144913 () Bool)

(assert (=> b!124971 m!144913))

(declare-fun m!144915 () Bool)

(assert (=> b!124962 m!144915))

(declare-fun m!144917 () Bool)

(assert (=> b!124962 m!144917))

(declare-fun m!144919 () Bool)

(assert (=> b!124962 m!144919))

(assert (=> b!124962 m!144593))

(assert (=> b!124962 m!144417))

(assert (=> b!124962 m!144595))

(assert (=> b!124962 m!144915))

(assert (=> b!124962 m!144593))

(assert (=> b!124962 m!144417))

(assert (=> b!124962 m!144579))

(declare-fun m!144921 () Bool)

(assert (=> b!124962 m!144921))

(declare-fun m!144923 () Bool)

(assert (=> bm!13370 m!144923))

(assert (=> b!124967 m!144579))

(assert (=> b!124967 m!144579))

(declare-fun m!144925 () Bool)

(assert (=> b!124967 m!144925))

(assert (=> b!124965 m!144579))

(declare-fun m!144927 () Bool)

(assert (=> b!124965 m!144927))

(assert (=> b!124965 m!144593))

(assert (=> b!124965 m!144417))

(assert (=> b!124965 m!144595))

(assert (=> b!124965 m!144593))

(assert (=> b!124965 m!144417))

(assert (=> b!124965 m!144579))

(declare-fun m!144929 () Bool)

(assert (=> d!37449 m!144929))

(assert (=> d!37449 m!144431))

(assert (=> b!124961 m!144579))

(assert (=> b!124961 m!144579))

(assert (=> b!124961 m!144587))

(assert (=> b!124966 m!144923))

(assert (=> b!124970 m!144579))

(assert (=> b!124970 m!144579))

(assert (=> b!124970 m!144587))

(assert (=> bm!13339 d!37449))

(declare-fun d!37451 () Bool)

(declare-fun e!81667 () Bool)

(assert (=> d!37451 e!81667))

(declare-fun res!60491 () Bool)

(assert (=> d!37451 (=> res!60491 e!81667)))

(declare-fun lt!64242 () Bool)

(assert (=> d!37451 (= res!60491 (not lt!64242))))

(declare-fun lt!64245 () Bool)

(assert (=> d!37451 (= lt!64242 lt!64245)))

(declare-fun lt!64244 () Unit!3865)

(declare-fun e!81668 () Unit!3865)

(assert (=> d!37451 (= lt!64244 e!81668)))

(declare-fun c!22762 () Bool)

(assert (=> d!37451 (= c!22762 lt!64245)))

(assert (=> d!37451 (= lt!64245 (containsKey!168 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!37451 (= (contains!863 call!13306 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) lt!64242)))

(declare-fun b!124973 () Bool)

(declare-fun lt!64243 () Unit!3865)

(assert (=> b!124973 (= e!81668 lt!64243)))

(assert (=> b!124973 (= lt!64243 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> b!124973 (isDefined!118 (getValueByKey!164 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun b!124974 () Bool)

(declare-fun Unit!3876 () Unit!3865)

(assert (=> b!124974 (= e!81668 Unit!3876)))

(declare-fun b!124975 () Bool)

(assert (=> b!124975 (= e!81667 (isDefined!118 (getValueByKey!164 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (= (and d!37451 c!22762) b!124973))

(assert (= (and d!37451 (not c!22762)) b!124974))

(assert (= (and d!37451 (not res!60491)) b!124975))

(assert (=> d!37451 m!144407))

(declare-fun m!144931 () Bool)

(assert (=> d!37451 m!144931))

(assert (=> b!124973 m!144407))

(declare-fun m!144933 () Bool)

(assert (=> b!124973 m!144933))

(assert (=> b!124973 m!144407))

(declare-fun m!144935 () Bool)

(assert (=> b!124973 m!144935))

(assert (=> b!124973 m!144935))

(declare-fun m!144937 () Bool)

(assert (=> b!124973 m!144937))

(assert (=> b!124975 m!144407))

(assert (=> b!124975 m!144935))

(assert (=> b!124975 m!144935))

(assert (=> b!124975 m!144937))

(assert (=> b!124659 d!37451))

(assert (=> b!124574 d!37429))

(assert (=> b!124574 d!37431))

(declare-fun d!37453 () Bool)

(declare-fun res!60503 () Bool)

(declare-fun e!81671 () Bool)

(assert (=> d!37453 (=> (not res!60503) (not e!81671))))

(assert (=> d!37453 (= res!60503 (validMask!0 (mask!7008 newMap!16)))))

(assert (=> d!37453 (= (simpleValid!86 newMap!16) e!81671)))

(declare-fun b!124984 () Bool)

(declare-fun res!60501 () Bool)

(assert (=> b!124984 (=> (not res!60501) (not e!81671))))

(assert (=> b!124984 (= res!60501 (and (= (size!2471 (_values!2746 newMap!16)) (bvadd (mask!7008 newMap!16) #b00000000000000000000000000000001)) (= (size!2470 (_keys!4491 newMap!16)) (size!2471 (_values!2746 newMap!16))) (bvsge (_size!576 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!576 newMap!16) (bvadd (mask!7008 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!124986 () Bool)

(declare-fun res!60500 () Bool)

(assert (=> b!124986 (=> (not res!60500) (not e!81671))))

(declare-fun size!2476 (LongMapFixedSize!1054) (_ BitVec 32))

(assert (=> b!124986 (= res!60500 (= (size!2476 newMap!16) (bvadd (_size!576 newMap!16) (bvsdiv (bvadd (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!124985 () Bool)

(declare-fun res!60502 () Bool)

(assert (=> b!124985 (=> (not res!60502) (not e!81671))))

(assert (=> b!124985 (= res!60502 (bvsge (size!2476 newMap!16) (_size!576 newMap!16)))))

(declare-fun b!124987 () Bool)

(assert (=> b!124987 (= e!81671 (and (bvsge (extraKeys!2548 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2548 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!576 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!37453 res!60503) b!124984))

(assert (= (and b!124984 res!60501) b!124985))

(assert (= (and b!124985 res!60502) b!124986))

(assert (= (and b!124986 res!60500) b!124987))

(assert (=> d!37453 m!144709))

(declare-fun m!144939 () Bool)

(assert (=> b!124986 m!144939))

(assert (=> b!124985 m!144939))

(assert (=> d!37399 d!37453))

(declare-fun d!37455 () Bool)

(assert (=> d!37455 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64248 () Unit!3865)

(declare-fun choose!758 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 V!3425 Int) Unit!3865)

(assert (=> d!37455 (= lt!64248 (choose!758 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37455 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37455 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) lt!64248)))

(declare-fun bs!5149 () Bool)

(assert (= bs!5149 d!37455))

(assert (=> bs!5149 m!144527))

(assert (=> bs!5149 m!144527))

(declare-fun m!144941 () Bool)

(assert (=> bs!5149 m!144941))

(assert (=> bs!5149 m!144419))

(declare-fun m!144943 () Bool)

(assert (=> bs!5149 m!144943))

(assert (=> bs!5149 m!144709))

(assert (=> bs!5149 m!144419))

(declare-fun m!144945 () Bool)

(assert (=> bs!5149 m!144945))

(assert (=> b!124677 d!37455))

(declare-fun d!37457 () Bool)

(declare-fun e!81672 () Bool)

(assert (=> d!37457 e!81672))

(declare-fun res!60505 () Bool)

(assert (=> d!37457 (=> (not res!60505) (not e!81672))))

(declare-fun lt!64252 () ListLongMap!1643)

(assert (=> d!37457 (= res!60505 (contains!863 lt!64252 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64250 () List!1689)

(assert (=> d!37457 (= lt!64252 (ListLongMap!1644 lt!64250))))

(declare-fun lt!64251 () Unit!3865)

(declare-fun lt!64249 () Unit!3865)

(assert (=> d!37457 (= lt!64251 lt!64249)))

(assert (=> d!37457 (= (getValueByKey!164 lt!64250 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37457 (= lt!64249 (lemmaContainsTupThenGetReturnValue!82 lt!64250 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37457 (= lt!64250 (insertStrictlySorted!85 (toList!837 call!13337) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37457 (= (+!157 call!13337 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64252)))

(declare-fun b!124988 () Bool)

(declare-fun res!60504 () Bool)

(assert (=> b!124988 (=> (not res!60504) (not e!81672))))

(assert (=> b!124988 (= res!60504 (= (getValueByKey!164 (toList!837 lt!64252) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!124989 () Bool)

(assert (=> b!124989 (= e!81672 (contains!865 (toList!837 lt!64252) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37457 res!60505) b!124988))

(assert (= (and b!124988 res!60504) b!124989))

(declare-fun m!144947 () Bool)

(assert (=> d!37457 m!144947))

(declare-fun m!144949 () Bool)

(assert (=> d!37457 m!144949))

(declare-fun m!144951 () Bool)

(assert (=> d!37457 m!144951))

(declare-fun m!144953 () Bool)

(assert (=> d!37457 m!144953))

(declare-fun m!144955 () Bool)

(assert (=> b!124988 m!144955))

(declare-fun m!144957 () Bool)

(assert (=> b!124989 m!144957))

(assert (=> b!124767 d!37457))

(declare-fun d!37459 () Bool)

(assert (=> d!37459 (= (get!1438 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124700 d!37459))

(declare-fun b!125024 () Bool)

(declare-fun e!81689 () Bool)

(declare-fun e!81690 () Bool)

(assert (=> b!125024 (= e!81689 e!81690)))

(declare-fun res!60527 () Bool)

(declare-fun call!13382 () Bool)

(assert (=> b!125024 (= res!60527 call!13382)))

(assert (=> b!125024 (=> (not res!60527) (not e!81690))))

(declare-fun call!13384 () Bool)

(declare-fun c!22772 () Bool)

(declare-fun bm!13379 () Bool)

(declare-fun c!22773 () Bool)

(declare-fun lt!64331 () SeekEntryResult!272)

(declare-fun lt!64330 () SeekEntryResult!272)

(assert (=> bm!13379 (= call!13384 (inRange!0 (ite c!22772 (index!3243 lt!64331) (ite c!22773 (index!3242 lt!64330) (index!3245 lt!64330))) (mask!7008 newMap!16)))))

(declare-fun b!125025 () Bool)

(declare-fun e!81696 () Unit!3865)

(declare-fun Unit!3877 () Unit!3865)

(assert (=> b!125025 (= e!81696 Unit!3877)))

(declare-fun lt!64334 () Unit!3865)

(declare-fun lemmaArrayContainsKeyThenInListMap!36 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) (_ BitVec 32) Int) Unit!3865)

(assert (=> b!125025 (= lt!64334 (lemmaArrayContainsKeyThenInListMap!36 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> b!125025 (contains!863 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))

(declare-fun lt!64341 () Unit!3865)

(assert (=> b!125025 (= lt!64341 lt!64334)))

(assert (=> b!125025 false))

(declare-fun bm!13380 () Bool)

(declare-fun call!13385 () SeekEntryResult!272)

(assert (=> bm!13380 (= call!13385 (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun b!125026 () Bool)

(declare-fun res!60529 () Bool)

(declare-fun e!81693 () Bool)

(assert (=> b!125026 (=> (not res!60529) (not e!81693))))

(assert (=> b!125026 (= res!60529 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3242 lt!64330)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125027 () Bool)

(declare-fun call!13383 () Bool)

(assert (=> b!125027 (= e!81690 (not call!13383))))

(declare-fun b!125028 () Bool)

(declare-fun e!81691 () Bool)

(declare-fun lt!64322 () tuple2!2536)

(assert (=> b!125028 (= e!81691 (= (map!1365 (_2!1279 lt!64322)) (+!157 (map!1365 newMap!16) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125029 () Bool)

(declare-fun res!60525 () Bool)

(assert (=> b!125029 (= res!60525 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3245 lt!64330)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125029 (=> (not res!60525) (not e!81690))))

(declare-fun b!125030 () Bool)

(declare-fun res!60530 () Bool)

(assert (=> b!125030 (=> (not res!60530) (not e!81693))))

(assert (=> b!125030 (= res!60530 call!13382)))

(declare-fun e!81692 () Bool)

(assert (=> b!125030 (= e!81692 e!81693)))

(declare-fun b!125031 () Bool)

(declare-fun e!81695 () Bool)

(assert (=> b!125031 (= e!81695 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64331)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun b!125032 () Bool)

(declare-fun res!60531 () Bool)

(assert (=> b!125032 (=> (not res!60531) (not e!81691))))

(assert (=> b!125032 (= res!60531 (valid!506 (_2!1279 lt!64322)))))

(declare-fun b!125033 () Bool)

(declare-fun e!81694 () Unit!3865)

(declare-fun lt!64325 () Unit!3865)

(assert (=> b!125033 (= e!81694 lt!64325)))

(assert (=> b!125033 (= lt!64325 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(assert (=> b!125033 (= lt!64330 call!13385)))

(assert (=> b!125033 (= c!22773 ((_ is MissingZero!272) lt!64330))))

(assert (=> b!125033 e!81692))

(declare-fun b!125034 () Bool)

(assert (=> b!125034 (= e!81693 (not call!13383))))

(declare-fun d!37461 () Bool)

(assert (=> d!37461 e!81691))

(declare-fun res!60528 () Bool)

(assert (=> d!37461 (=> (not res!60528) (not e!81691))))

(assert (=> d!37461 (= res!60528 (_1!1279 lt!64322))))

(assert (=> d!37461 (= lt!64322 (tuple2!2537 true (LongMapFixedSize!1055 (defaultEntry!2763 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd (_size!576 newMap!16) #b00000000000000000000000000000001) (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (_vacant!576 newMap!16))))))

(declare-fun lt!64340 () Unit!3865)

(declare-fun lt!64328 () Unit!3865)

(assert (=> d!37461 (= lt!64340 lt!64328)))

(declare-fun lt!64324 () array!4661)

(declare-fun lt!64317 () array!4663)

(assert (=> d!37461 (contains!863 (getCurrentListMap!507 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))))))

(assert (=> d!37461 (= lt!64328 (lemmaValidKeyInArrayIsInListMap!114 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37461 (= lt!64317 (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))))

(assert (=> d!37461 (= lt!64324 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun lt!64316 () Unit!3865)

(declare-fun lt!64313 () Unit!3865)

(assert (=> d!37461 (= lt!64316 lt!64313)))

(declare-fun lt!64332 () array!4661)

(assert (=> d!37461 (= (arrayCountValidKeys!0 lt!64332 (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (bvadd (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4661 (_ BitVec 32)) Unit!3865)

(assert (=> d!37461 (= lt!64313 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!64332 (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))))))

(assert (=> d!37461 (= lt!64332 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun lt!64318 () Unit!3865)

(declare-fun lt!64338 () Unit!3865)

(assert (=> d!37461 (= lt!64318 lt!64338)))

(declare-fun lt!64323 () array!4661)

(assert (=> d!37461 (arrayContainsKey!0 lt!64323 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4661 (_ BitVec 64) (_ BitVec 32)) Unit!3865)

(assert (=> d!37461 (= lt!64338 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!64323 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))))))

(assert (=> d!37461 (= lt!64323 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun lt!64320 () Unit!3865)

(declare-fun lt!64336 () Unit!3865)

(assert (=> d!37461 (= lt!64320 lt!64336)))

(assert (=> d!37461 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!507 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!36 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) (_ BitVec 64) V!3425 Int) Unit!3865)

(assert (=> d!37461 (= lt!64336 (lemmaAddValidKeyToArrayThenAddPairToListMap!36 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64319 () Unit!3865)

(declare-fun lt!64329 () Unit!3865)

(assert (=> d!37461 (= lt!64319 lt!64329)))

(assert (=> d!37461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (mask!7008 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4661 (_ BitVec 32) (_ BitVec 32)) Unit!3865)

(assert (=> d!37461 (= lt!64329 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (mask!7008 newMap!16)))))

(declare-fun lt!64333 () Unit!3865)

(declare-fun lt!64314 () Unit!3865)

(assert (=> d!37461 (= lt!64333 lt!64314)))

(assert (=> d!37461 (= (arrayCountValidKeys!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4491 newMap!16) #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4661 (_ BitVec 32) (_ BitVec 64)) Unit!3865)

(assert (=> d!37461 (= lt!64314 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4491 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun lt!64327 () Unit!3865)

(declare-fun lt!64335 () Unit!3865)

(assert (=> d!37461 (= lt!64327 lt!64335)))

(declare-fun lt!64337 () (_ BitVec 32))

(declare-fun lt!64326 () List!1691)

(assert (=> d!37461 (arrayNoDuplicates!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) lt!64337 lt!64326)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4661 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1691) Unit!3865)

(assert (=> d!37461 (= lt!64335 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) lt!64337 lt!64326))))

(assert (=> d!37461 (= lt!64326 Nil!1688)))

(assert (=> d!37461 (= lt!64337 #b00000000000000000000000000000000)))

(declare-fun lt!64339 () Unit!3865)

(assert (=> d!37461 (= lt!64339 e!81696)))

(declare-fun c!22774 () Bool)

(assert (=> d!37461 (= c!22774 (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!64315 () Unit!3865)

(assert (=> d!37461 (= lt!64315 e!81694)))

(assert (=> d!37461 (= c!22772 (contains!863 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!37461 (valid!506 newMap!16)))

(assert (=> d!37461 (= (updateHelperNewKey!55 newMap!16 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))) lt!64322)))

(declare-fun b!125035 () Bool)

(declare-fun res!60524 () Bool)

(assert (=> b!125035 (=> (not res!60524) (not e!81691))))

(assert (=> b!125035 (= res!60524 (contains!863 (map!1365 (_2!1279 lt!64322)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun b!125036 () Bool)

(declare-fun c!22771 () Bool)

(assert (=> b!125036 (= c!22771 ((_ is MissingVacant!272) lt!64330))))

(assert (=> b!125036 (= e!81692 e!81689)))

(declare-fun b!125037 () Bool)

(declare-fun res!60532 () Bool)

(assert (=> b!125037 (= res!60532 call!13384)))

(assert (=> b!125037 (=> (not res!60532) (not e!81695))))

(declare-fun b!125038 () Bool)

(declare-fun Unit!3878 () Unit!3865)

(assert (=> b!125038 (= e!81694 Unit!3878)))

(declare-fun lt!64321 () Unit!3865)

(assert (=> b!125038 (= lt!64321 (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(assert (=> b!125038 (= lt!64331 call!13385)))

(declare-fun res!60526 () Bool)

(assert (=> b!125038 (= res!60526 ((_ is Found!272) lt!64331))))

(assert (=> b!125038 (=> (not res!60526) (not e!81695))))

(assert (=> b!125038 e!81695))

(declare-fun lt!64342 () Unit!3865)

(assert (=> b!125038 (= lt!64342 lt!64321)))

(assert (=> b!125038 false))

(declare-fun b!125039 () Bool)

(declare-fun Unit!3879 () Unit!3865)

(assert (=> b!125039 (= e!81696 Unit!3879)))

(declare-fun bm!13381 () Bool)

(assert (=> bm!13381 (= call!13382 call!13384)))

(declare-fun bm!13382 () Bool)

(assert (=> bm!13382 (= call!13383 (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!125040 () Bool)

(assert (=> b!125040 (= e!81689 ((_ is Undefined!272) lt!64330))))

(assert (= (and d!37461 c!22772) b!125038))

(assert (= (and d!37461 (not c!22772)) b!125033))

(assert (= (and b!125038 res!60526) b!125037))

(assert (= (and b!125037 res!60532) b!125031))

(assert (= (and b!125033 c!22773) b!125030))

(assert (= (and b!125033 (not c!22773)) b!125036))

(assert (= (and b!125030 res!60530) b!125026))

(assert (= (and b!125026 res!60529) b!125034))

(assert (= (and b!125036 c!22771) b!125024))

(assert (= (and b!125036 (not c!22771)) b!125040))

(assert (= (and b!125024 res!60527) b!125029))

(assert (= (and b!125029 res!60525) b!125027))

(assert (= (or b!125030 b!125024) bm!13381))

(assert (= (or b!125034 b!125027) bm!13382))

(assert (= (or b!125037 bm!13381) bm!13379))

(assert (= (or b!125038 b!125033) bm!13380))

(assert (= (and d!37461 c!22774) b!125025))

(assert (= (and d!37461 (not c!22774)) b!125039))

(assert (= (and d!37461 res!60528) b!125032))

(assert (= (and b!125032 res!60531) b!125035))

(assert (= (and b!125035 res!60524) b!125028))

(assert (=> b!125033 m!144407))

(assert (=> b!125033 m!144555))

(assert (=> bm!13382 m!144407))

(assert (=> bm!13382 m!144517))

(assert (=> bm!13380 m!144407))

(assert (=> bm!13380 m!144509))

(declare-fun m!144959 () Bool)

(assert (=> b!125031 m!144959))

(assert (=> b!125038 m!144407))

(assert (=> b!125038 m!144549))

(declare-fun m!144961 () Bool)

(assert (=> b!125028 m!144961))

(assert (=> b!125028 m!144409))

(assert (=> b!125028 m!144409))

(declare-fun m!144963 () Bool)

(assert (=> b!125028 m!144963))

(declare-fun m!144965 () Bool)

(assert (=> b!125032 m!144965))

(declare-fun m!144967 () Bool)

(assert (=> b!125026 m!144967))

(declare-fun m!144969 () Bool)

(assert (=> d!37461 m!144969))

(declare-fun m!144971 () Bool)

(assert (=> d!37461 m!144971))

(assert (=> d!37461 m!144407))

(declare-fun m!144973 () Bool)

(assert (=> d!37461 m!144973))

(declare-fun m!144975 () Bool)

(assert (=> d!37461 m!144975))

(declare-fun m!144977 () Bool)

(assert (=> d!37461 m!144977))

(assert (=> d!37461 m!144413))

(declare-fun m!144979 () Bool)

(assert (=> d!37461 m!144979))

(declare-fun m!144981 () Bool)

(assert (=> d!37461 m!144981))

(assert (=> d!37461 m!144573))

(declare-fun m!144983 () Bool)

(assert (=> d!37461 m!144983))

(assert (=> d!37461 m!144407))

(assert (=> d!37461 m!144419))

(declare-fun m!144985 () Bool)

(assert (=> d!37461 m!144985))

(assert (=> d!37461 m!144407))

(declare-fun m!144987 () Bool)

(assert (=> d!37461 m!144987))

(assert (=> d!37461 m!144407))

(declare-fun m!144989 () Bool)

(assert (=> d!37461 m!144989))

(declare-fun m!144991 () Bool)

(assert (=> d!37461 m!144991))

(declare-fun m!144993 () Bool)

(assert (=> d!37461 m!144993))

(assert (=> d!37461 m!144527))

(assert (=> d!37461 m!144847))

(assert (=> d!37461 m!144407))

(declare-fun m!144995 () Bool)

(assert (=> d!37461 m!144995))

(assert (=> d!37461 m!144527))

(assert (=> d!37461 m!144407))

(assert (=> d!37461 m!144517))

(assert (=> d!37461 m!144407))

(declare-fun m!144997 () Bool)

(assert (=> d!37461 m!144997))

(declare-fun m!144999 () Bool)

(assert (=> d!37461 m!144999))

(declare-fun m!145001 () Bool)

(assert (=> d!37461 m!145001))

(assert (=> d!37461 m!144983))

(assert (=> d!37461 m!144969))

(declare-fun m!145003 () Bool)

(assert (=> d!37461 m!145003))

(assert (=> d!37461 m!144527))

(assert (=> d!37461 m!144407))

(assert (=> d!37461 m!144539))

(assert (=> b!125035 m!144961))

(assert (=> b!125035 m!144961))

(assert (=> b!125035 m!144407))

(declare-fun m!145005 () Bool)

(assert (=> b!125035 m!145005))

(declare-fun m!145007 () Bool)

(assert (=> b!125029 m!145007))

(assert (=> b!125025 m!144407))

(declare-fun m!145009 () Bool)

(assert (=> b!125025 m!145009))

(assert (=> b!125025 m!144527))

(assert (=> b!125025 m!144527))

(assert (=> b!125025 m!144407))

(assert (=> b!125025 m!144539))

(declare-fun m!145011 () Bool)

(assert (=> bm!13379 m!145011))

(assert (=> bm!13313 d!37461))

(declare-fun d!37463 () Bool)

(assert (=> d!37463 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64018 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64345 () Unit!3865)

(declare-fun choose!759 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 V!3425 Int) Unit!3865)

(assert (=> d!37463 (= lt!64345 (choose!759 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) lt!64018 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37463 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37463 (= (lemmaChangeZeroKeyThenAddPairToListMap!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) lt!64018 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (defaultEntry!2763 newMap!16)) lt!64345)))

(declare-fun bs!5150 () Bool)

(assert (= bs!5150 d!37463))

(assert (=> bs!5150 m!144419))

(declare-fun m!145013 () Bool)

(assert (=> bs!5150 m!145013))

(assert (=> bs!5150 m!144527))

(declare-fun m!145015 () Bool)

(assert (=> bs!5150 m!145015))

(assert (=> bs!5150 m!144709))

(assert (=> bs!5150 m!144527))

(assert (=> bs!5150 m!144419))

(declare-fun m!145017 () Bool)

(assert (=> bs!5150 m!145017))

(assert (=> b!124679 d!37463))

(declare-fun d!37465 () Bool)

(declare-fun res!60537 () Bool)

(declare-fun e!81701 () Bool)

(assert (=> d!37465 (=> res!60537 e!81701)))

(assert (=> d!37465 (= res!60537 (and ((_ is Cons!1685) (toList!837 lt!63929)) (= (_1!1278 (h!2286 (toList!837 lt!63929))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (=> d!37465 (= (containsKey!168 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) e!81701)))

(declare-fun b!125045 () Bool)

(declare-fun e!81702 () Bool)

(assert (=> b!125045 (= e!81701 e!81702)))

(declare-fun res!60538 () Bool)

(assert (=> b!125045 (=> (not res!60538) (not e!81702))))

(assert (=> b!125045 (= res!60538 (and (or (not ((_ is Cons!1685) (toList!837 lt!63929))) (bvsle (_1!1278 (h!2286 (toList!837 lt!63929))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))) ((_ is Cons!1685) (toList!837 lt!63929)) (bvslt (_1!1278 (h!2286 (toList!837 lt!63929))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(declare-fun b!125046 () Bool)

(assert (=> b!125046 (= e!81702 (containsKey!168 (t!6007 (toList!837 lt!63929)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37465 (not res!60537)) b!125045))

(assert (= (and b!125045 res!60538) b!125046))

(assert (=> b!125046 m!144407))

(declare-fun m!145019 () Bool)

(assert (=> b!125046 m!145019))

(assert (=> d!37385 d!37465))

(declare-fun d!37467 () Bool)

(assert (=> d!37467 (= (apply!110 lt!64097 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5151 () Bool)

(assert (= bs!5151 d!37467))

(declare-fun m!145021 () Bool)

(assert (=> bs!5151 m!145021))

(assert (=> bs!5151 m!145021))

(declare-fun m!145023 () Bool)

(assert (=> bs!5151 m!145023))

(assert (=> b!124752 d!37467))

(declare-fun b!125057 () Bool)

(declare-fun e!81714 () Bool)

(declare-fun e!81713 () Bool)

(assert (=> b!125057 (= e!81714 e!81713)))

(declare-fun c!22777 () Bool)

(assert (=> b!125057 (= c!22777 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125058 () Bool)

(declare-fun e!81711 () Bool)

(assert (=> b!125058 (= e!81711 e!81714)))

(declare-fun res!60547 () Bool)

(assert (=> b!125058 (=> (not res!60547) (not e!81714))))

(declare-fun e!81712 () Bool)

(assert (=> b!125058 (= res!60547 (not e!81712))))

(declare-fun res!60546 () Bool)

(assert (=> b!125058 (=> (not res!60546) (not e!81712))))

(assert (=> b!125058 (= res!60546 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125059 () Bool)

(declare-fun call!13388 () Bool)

(assert (=> b!125059 (= e!81713 call!13388)))

(declare-fun d!37469 () Bool)

(declare-fun res!60545 () Bool)

(assert (=> d!37469 (=> res!60545 e!81711)))

(assert (=> d!37469 (= res!60545 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37469 (= (arrayNoDuplicates!0 (_keys!4491 newMap!16) #b00000000000000000000000000000000 Nil!1688) e!81711)))

(declare-fun b!125060 () Bool)

(assert (=> b!125060 (= e!81713 call!13388)))

(declare-fun bm!13385 () Bool)

(assert (=> bm!13385 (= call!13388 (arrayNoDuplicates!0 (_keys!4491 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22777 (Cons!1687 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) Nil!1688) Nil!1688)))))

(declare-fun b!125061 () Bool)

(declare-fun contains!866 (List!1691 (_ BitVec 64)) Bool)

(assert (=> b!125061 (= e!81712 (contains!866 Nil!1688 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37469 (not res!60545)) b!125058))

(assert (= (and b!125058 res!60546) b!125061))

(assert (= (and b!125058 res!60547) b!125057))

(assert (= (and b!125057 c!22777) b!125059))

(assert (= (and b!125057 (not c!22777)) b!125060))

(assert (= (or b!125059 b!125060) bm!13385))

(assert (=> b!125057 m!144651))

(assert (=> b!125057 m!144651))

(assert (=> b!125057 m!144659))

(assert (=> b!125058 m!144651))

(assert (=> b!125058 m!144651))

(assert (=> b!125058 m!144659))

(assert (=> bm!13385 m!144651))

(declare-fun m!145025 () Bool)

(assert (=> bm!13385 m!145025))

(assert (=> b!125061 m!144651))

(assert (=> b!125061 m!144651))

(declare-fun m!145027 () Bool)

(assert (=> b!125061 m!145027))

(assert (=> b!124709 d!37469))

(assert (=> b!124680 d!37421))

(declare-fun b!125070 () Bool)

(declare-fun e!81720 () (_ BitVec 32))

(declare-fun e!81719 () (_ BitVec 32))

(assert (=> b!125070 (= e!81720 e!81719)))

(declare-fun c!22782 () Bool)

(assert (=> b!125070 (= c!22782 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37471 () Bool)

(declare-fun lt!64348 () (_ BitVec 32))

(assert (=> d!37471 (and (bvsge lt!64348 #b00000000000000000000000000000000) (bvsle lt!64348 (bvsub (size!2470 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37471 (= lt!64348 e!81720)))

(declare-fun c!22783 () Bool)

(assert (=> d!37471 (= c!22783 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37471 (and (bvsle #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2470 (_keys!4491 newMap!16)) (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37471 (= (arrayCountValidKeys!0 (_keys!4491 newMap!16) #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) lt!64348)))

(declare-fun b!125071 () Bool)

(assert (=> b!125071 (= e!81720 #b00000000000000000000000000000000)))

(declare-fun bm!13388 () Bool)

(declare-fun call!13391 () (_ BitVec 32))

(assert (=> bm!13388 (= call!13391 (arrayCountValidKeys!0 (_keys!4491 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125072 () Bool)

(assert (=> b!125072 (= e!81719 call!13391)))

(declare-fun b!125073 () Bool)

(assert (=> b!125073 (= e!81719 (bvadd #b00000000000000000000000000000001 call!13391))))

(assert (= (and d!37471 c!22783) b!125071))

(assert (= (and d!37471 (not c!22783)) b!125070))

(assert (= (and b!125070 c!22782) b!125073))

(assert (= (and b!125070 (not c!22782)) b!125072))

(assert (= (or b!125073 b!125072) bm!13388))

(assert (=> b!125070 m!144651))

(assert (=> b!125070 m!144651))

(assert (=> b!125070 m!144659))

(declare-fun m!145029 () Bool)

(assert (=> bm!13388 m!145029))

(assert (=> b!124707 d!37471))

(declare-fun d!37473 () Bool)

(declare-fun e!81723 () Bool)

(assert (=> d!37473 e!81723))

(declare-fun res!60553 () Bool)

(assert (=> d!37473 (=> (not res!60553) (not e!81723))))

(declare-fun lt!64353 () SeekEntryResult!272)

(assert (=> d!37473 (= res!60553 ((_ is Found!272) lt!64353))))

(assert (=> d!37473 (= lt!64353 (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun lt!64354 () Unit!3865)

(declare-fun choose!760 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) Int) Unit!3865)

(assert (=> d!37473 (= lt!64354 (choose!760 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37473 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37473 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!55 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)) lt!64354)))

(declare-fun b!125078 () Bool)

(declare-fun res!60552 () Bool)

(assert (=> b!125078 (=> (not res!60552) (not e!81723))))

(assert (=> b!125078 (= res!60552 (inRange!0 (index!3243 lt!64353) (mask!7008 newMap!16)))))

(declare-fun b!125079 () Bool)

(assert (=> b!125079 (= e!81723 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64353)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> b!125079 (and (bvsge (index!3243 lt!64353) #b00000000000000000000000000000000) (bvslt (index!3243 lt!64353) (size!2470 (_keys!4491 newMap!16))))))

(assert (= (and d!37473 res!60553) b!125078))

(assert (= (and b!125078 res!60552) b!125079))

(assert (=> d!37473 m!144407))

(assert (=> d!37473 m!144509))

(assert (=> d!37473 m!144407))

(declare-fun m!145031 () Bool)

(assert (=> d!37473 m!145031))

(assert (=> d!37473 m!144709))

(declare-fun m!145033 () Bool)

(assert (=> b!125078 m!145033))

(declare-fun m!145035 () Bool)

(assert (=> b!125079 m!145035))

(assert (=> bm!13299 d!37473))

(declare-fun d!37475 () Bool)

(assert (=> d!37475 (= (apply!110 lt!64106 lt!64104) (get!1439 (getValueByKey!164 (toList!837 lt!64106) lt!64104)))))

(declare-fun bs!5152 () Bool)

(assert (= bs!5152 d!37475))

(declare-fun m!145037 () Bool)

(assert (=> bs!5152 m!145037))

(assert (=> bs!5152 m!145037))

(declare-fun m!145039 () Bool)

(assert (=> bs!5152 m!145039))

(assert (=> b!124769 d!37475))

(declare-fun d!37477 () Bool)

(declare-fun e!81724 () Bool)

(assert (=> d!37477 e!81724))

(declare-fun res!60555 () Bool)

(assert (=> d!37477 (=> (not res!60555) (not e!81724))))

(declare-fun lt!64358 () ListLongMap!1643)

(assert (=> d!37477 (= res!60555 (contains!863 lt!64358 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64356 () List!1689)

(assert (=> d!37477 (= lt!64358 (ListLongMap!1644 lt!64356))))

(declare-fun lt!64357 () Unit!3865)

(declare-fun lt!64355 () Unit!3865)

(assert (=> d!37477 (= lt!64357 lt!64355)))

(assert (=> d!37477 (= (getValueByKey!164 lt!64356 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37477 (= lt!64355 (lemmaContainsTupThenGetReturnValue!82 lt!64356 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37477 (= lt!64356 (insertStrictlySorted!85 (toList!837 lt!64091) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37477 (= (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64358)))

(declare-fun b!125080 () Bool)

(declare-fun res!60554 () Bool)

(assert (=> b!125080 (=> (not res!60554) (not e!81724))))

(assert (=> b!125080 (= res!60554 (= (getValueByKey!164 (toList!837 lt!64358) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125081 () Bool)

(assert (=> b!125081 (= e!81724 (contains!865 (toList!837 lt!64358) (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37477 res!60555) b!125080))

(assert (= (and b!125080 res!60554) b!125081))

(declare-fun m!145041 () Bool)

(assert (=> d!37477 m!145041))

(declare-fun m!145043 () Bool)

(assert (=> d!37477 m!145043))

(declare-fun m!145045 () Bool)

(assert (=> d!37477 m!145045))

(declare-fun m!145047 () Bool)

(assert (=> d!37477 m!145047))

(declare-fun m!145049 () Bool)

(assert (=> b!125080 m!145049))

(declare-fun m!145051 () Bool)

(assert (=> b!125081 m!145051))

(assert (=> b!124769 d!37477))

(declare-fun d!37479 () Bool)

(assert (=> d!37479 (= (apply!110 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64092) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64092)))))

(declare-fun bs!5153 () Bool)

(assert (= bs!5153 d!37479))

(declare-fun m!145053 () Bool)

(assert (=> bs!5153 m!145053))

(assert (=> bs!5153 m!145053))

(declare-fun m!145055 () Bool)

(assert (=> bs!5153 m!145055))

(assert (=> b!124769 d!37479))

(assert (=> b!124769 d!37449))

(declare-fun d!37481 () Bool)

(assert (=> d!37481 (= (apply!110 lt!64091 lt!64092) (get!1439 (getValueByKey!164 (toList!837 lt!64091) lt!64092)))))

(declare-fun bs!5154 () Bool)

(assert (= bs!5154 d!37481))

(declare-fun m!145057 () Bool)

(assert (=> bs!5154 m!145057))

(assert (=> bs!5154 m!145057))

(declare-fun m!145059 () Bool)

(assert (=> bs!5154 m!145059))

(assert (=> b!124769 d!37481))

(declare-fun d!37483 () Bool)

(assert (=> d!37483 (= (apply!110 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64104) (apply!110 lt!64106 lt!64104))))

(declare-fun lt!64361 () Unit!3865)

(declare-fun choose!761 (ListLongMap!1643 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3865)

(assert (=> d!37483 (= lt!64361 (choose!761 lt!64106 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64104))))

(declare-fun e!81727 () Bool)

(assert (=> d!37483 e!81727))

(declare-fun res!60558 () Bool)

(assert (=> d!37483 (=> (not res!60558) (not e!81727))))

(assert (=> d!37483 (= res!60558 (contains!863 lt!64106 lt!64104))))

(assert (=> d!37483 (= (addApplyDifferent!86 lt!64106 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64104) lt!64361)))

(declare-fun b!125085 () Bool)

(assert (=> b!125085 (= e!81727 (not (= lt!64104 lt!64089)))))

(assert (= (and d!37483 res!60558) b!125085))

(declare-fun m!145061 () Bool)

(assert (=> d!37483 m!145061))

(assert (=> d!37483 m!144627))

(assert (=> d!37483 m!144629))

(declare-fun m!145063 () Bool)

(assert (=> d!37483 m!145063))

(assert (=> d!37483 m!144627))

(assert (=> d!37483 m!144613))

(assert (=> b!124769 d!37483))

(declare-fun d!37485 () Bool)

(assert (=> d!37485 (= (apply!110 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64104) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64104)))))

(declare-fun bs!5155 () Bool)

(assert (= bs!5155 d!37485))

(declare-fun m!145065 () Bool)

(assert (=> bs!5155 m!145065))

(assert (=> bs!5155 m!145065))

(declare-fun m!145067 () Bool)

(assert (=> bs!5155 m!145067))

(assert (=> b!124769 d!37485))

(declare-fun d!37487 () Bool)

(assert (=> d!37487 (= (apply!110 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64092) (apply!110 lt!64091 lt!64092))))

(declare-fun lt!64362 () Unit!3865)

(assert (=> d!37487 (= lt!64362 (choose!761 lt!64091 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64092))))

(declare-fun e!81728 () Bool)

(assert (=> d!37487 e!81728))

(declare-fun res!60559 () Bool)

(assert (=> d!37487 (=> (not res!60559) (not e!81728))))

(assert (=> d!37487 (= res!60559 (contains!863 lt!64091 lt!64092))))

(assert (=> d!37487 (= (addApplyDifferent!86 lt!64091 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64092) lt!64362)))

(declare-fun b!125086 () Bool)

(assert (=> b!125086 (= e!81728 (not (= lt!64092 lt!64101)))))

(assert (= (and d!37487 res!60559) b!125086))

(declare-fun m!145069 () Bool)

(assert (=> d!37487 m!145069))

(assert (=> d!37487 m!144607))

(assert (=> d!37487 m!144609))

(declare-fun m!145071 () Bool)

(assert (=> d!37487 m!145071))

(assert (=> d!37487 m!144607))

(assert (=> d!37487 m!144605))

(assert (=> b!124769 d!37487))

(declare-fun d!37489 () Bool)

(declare-fun e!81729 () Bool)

(assert (=> d!37489 e!81729))

(declare-fun res!60560 () Bool)

(assert (=> d!37489 (=> res!60560 e!81729)))

(declare-fun lt!64363 () Bool)

(assert (=> d!37489 (= res!60560 (not lt!64363))))

(declare-fun lt!64366 () Bool)

(assert (=> d!37489 (= lt!64363 lt!64366)))

(declare-fun lt!64365 () Unit!3865)

(declare-fun e!81730 () Unit!3865)

(assert (=> d!37489 (= lt!64365 e!81730)))

(declare-fun c!22784 () Bool)

(assert (=> d!37489 (= c!22784 lt!64366)))

(assert (=> d!37489 (= lt!64366 (containsKey!168 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087))))

(assert (=> d!37489 (= (contains!863 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64087) lt!64363)))

(declare-fun b!125087 () Bool)

(declare-fun lt!64364 () Unit!3865)

(assert (=> b!125087 (= e!81730 lt!64364)))

(assert (=> b!125087 (= lt!64364 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087))))

(assert (=> b!125087 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087))))

(declare-fun b!125088 () Bool)

(declare-fun Unit!3880 () Unit!3865)

(assert (=> b!125088 (= e!81730 Unit!3880)))

(declare-fun b!125089 () Bool)

(assert (=> b!125089 (= e!81729 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087)))))

(assert (= (and d!37489 c!22784) b!125087))

(assert (= (and d!37489 (not c!22784)) b!125088))

(assert (= (and d!37489 (not res!60560)) b!125089))

(declare-fun m!145073 () Bool)

(assert (=> d!37489 m!145073))

(declare-fun m!145075 () Bool)

(assert (=> b!125087 m!145075))

(declare-fun m!145077 () Bool)

(assert (=> b!125087 m!145077))

(assert (=> b!125087 m!145077))

(declare-fun m!145079 () Bool)

(assert (=> b!125087 m!145079))

(assert (=> b!125089 m!145077))

(assert (=> b!125089 m!145077))

(assert (=> b!125089 m!145079))

(assert (=> b!124769 d!37489))

(declare-fun d!37491 () Bool)

(declare-fun e!81731 () Bool)

(assert (=> d!37491 e!81731))

(declare-fun res!60562 () Bool)

(assert (=> d!37491 (=> (not res!60562) (not e!81731))))

(declare-fun lt!64370 () ListLongMap!1643)

(assert (=> d!37491 (= res!60562 (contains!863 lt!64370 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64368 () List!1689)

(assert (=> d!37491 (= lt!64370 (ListLongMap!1644 lt!64368))))

(declare-fun lt!64369 () Unit!3865)

(declare-fun lt!64367 () Unit!3865)

(assert (=> d!37491 (= lt!64369 lt!64367)))

(assert (=> d!37491 (= (getValueByKey!164 lt!64368 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37491 (= lt!64367 (lemmaContainsTupThenGetReturnValue!82 lt!64368 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37491 (= lt!64368 (insertStrictlySorted!85 (toList!837 lt!64106) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37491 (= (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64370)))

(declare-fun b!125090 () Bool)

(declare-fun res!60561 () Bool)

(assert (=> b!125090 (=> (not res!60561) (not e!81731))))

(assert (=> b!125090 (= res!60561 (= (getValueByKey!164 (toList!837 lt!64370) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125091 () Bool)

(assert (=> b!125091 (= e!81731 (contains!865 (toList!837 lt!64370) (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37491 res!60562) b!125090))

(assert (= (and b!125090 res!60561) b!125091))

(declare-fun m!145081 () Bool)

(assert (=> d!37491 m!145081))

(declare-fun m!145083 () Bool)

(assert (=> d!37491 m!145083))

(declare-fun m!145085 () Bool)

(assert (=> d!37491 m!145085))

(declare-fun m!145087 () Bool)

(assert (=> d!37491 m!145087))

(declare-fun m!145089 () Bool)

(assert (=> b!125090 m!145089))

(declare-fun m!145091 () Bool)

(assert (=> b!125091 m!145091))

(assert (=> b!124769 d!37491))

(declare-fun d!37493 () Bool)

(assert (=> d!37493 (contains!863 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64087)))

(declare-fun lt!64373 () Unit!3865)

(declare-fun choose!762 (ListLongMap!1643 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3865)

(assert (=> d!37493 (= lt!64373 (choose!762 lt!64100 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64087))))

(assert (=> d!37493 (contains!863 lt!64100 lt!64087)))

(assert (=> d!37493 (= (addStillContains!86 lt!64100 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64087) lt!64373)))

(declare-fun bs!5156 () Bool)

(assert (= bs!5156 d!37493))

(assert (=> bs!5156 m!144615))

(assert (=> bs!5156 m!144615))

(assert (=> bs!5156 m!144631))

(declare-fun m!145093 () Bool)

(assert (=> bs!5156 m!145093))

(declare-fun m!145095 () Bool)

(assert (=> bs!5156 m!145095))

(assert (=> b!124769 d!37493))

(declare-fun d!37495 () Bool)

(declare-fun e!81732 () Bool)

(assert (=> d!37495 e!81732))

(declare-fun res!60564 () Bool)

(assert (=> d!37495 (=> (not res!60564) (not e!81732))))

(declare-fun lt!64377 () ListLongMap!1643)

(assert (=> d!37495 (= res!60564 (contains!863 lt!64377 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64375 () List!1689)

(assert (=> d!37495 (= lt!64377 (ListLongMap!1644 lt!64375))))

(declare-fun lt!64376 () Unit!3865)

(declare-fun lt!64374 () Unit!3865)

(assert (=> d!37495 (= lt!64376 lt!64374)))

(assert (=> d!37495 (= (getValueByKey!164 lt!64375 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37495 (= lt!64374 (lemmaContainsTupThenGetReturnValue!82 lt!64375 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37495 (= lt!64375 (insertStrictlySorted!85 (toList!837 lt!64093) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37495 (= (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64377)))

(declare-fun b!125093 () Bool)

(declare-fun res!60563 () Bool)

(assert (=> b!125093 (=> (not res!60563) (not e!81732))))

(assert (=> b!125093 (= res!60563 (= (getValueByKey!164 (toList!837 lt!64377) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125094 () Bool)

(assert (=> b!125094 (= e!81732 (contains!865 (toList!837 lt!64377) (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37495 res!60564) b!125093))

(assert (= (and b!125093 res!60563) b!125094))

(declare-fun m!145097 () Bool)

(assert (=> d!37495 m!145097))

(declare-fun m!145099 () Bool)

(assert (=> d!37495 m!145099))

(declare-fun m!145101 () Bool)

(assert (=> d!37495 m!145101))

(declare-fun m!145103 () Bool)

(assert (=> d!37495 m!145103))

(declare-fun m!145105 () Bool)

(assert (=> b!125093 m!145105))

(declare-fun m!145107 () Bool)

(assert (=> b!125094 m!145107))

(assert (=> b!124769 d!37495))

(declare-fun d!37497 () Bool)

(assert (=> d!37497 (= (apply!110 lt!64093 lt!64105) (get!1439 (getValueByKey!164 (toList!837 lt!64093) lt!64105)))))

(declare-fun bs!5157 () Bool)

(assert (= bs!5157 d!37497))

(declare-fun m!145109 () Bool)

(assert (=> bs!5157 m!145109))

(assert (=> bs!5157 m!145109))

(declare-fun m!145111 () Bool)

(assert (=> bs!5157 m!145111))

(assert (=> b!124769 d!37497))

(declare-fun d!37499 () Bool)

(assert (=> d!37499 (= (apply!110 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64105) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64105)))))

(declare-fun bs!5158 () Bool)

(assert (= bs!5158 d!37499))

(declare-fun m!145113 () Bool)

(assert (=> bs!5158 m!145113))

(assert (=> bs!5158 m!145113))

(declare-fun m!145115 () Bool)

(assert (=> bs!5158 m!145115))

(assert (=> b!124769 d!37499))

(declare-fun d!37501 () Bool)

(declare-fun e!81733 () Bool)

(assert (=> d!37501 e!81733))

(declare-fun res!60566 () Bool)

(assert (=> d!37501 (=> (not res!60566) (not e!81733))))

(declare-fun lt!64381 () ListLongMap!1643)

(assert (=> d!37501 (= res!60566 (contains!863 lt!64381 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64379 () List!1689)

(assert (=> d!37501 (= lt!64381 (ListLongMap!1644 lt!64379))))

(declare-fun lt!64380 () Unit!3865)

(declare-fun lt!64378 () Unit!3865)

(assert (=> d!37501 (= lt!64380 lt!64378)))

(assert (=> d!37501 (= (getValueByKey!164 lt!64379 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37501 (= lt!64378 (lemmaContainsTupThenGetReturnValue!82 lt!64379 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37501 (= lt!64379 (insertStrictlySorted!85 (toList!837 lt!64100) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37501 (= (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64381)))

(declare-fun b!125095 () Bool)

(declare-fun res!60565 () Bool)

(assert (=> b!125095 (=> (not res!60565) (not e!81733))))

(assert (=> b!125095 (= res!60565 (= (getValueByKey!164 (toList!837 lt!64381) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125096 () Bool)

(assert (=> b!125096 (= e!81733 (contains!865 (toList!837 lt!64381) (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37501 res!60566) b!125095))

(assert (= (and b!125095 res!60565) b!125096))

(declare-fun m!145117 () Bool)

(assert (=> d!37501 m!145117))

(declare-fun m!145119 () Bool)

(assert (=> d!37501 m!145119))

(declare-fun m!145121 () Bool)

(assert (=> d!37501 m!145121))

(declare-fun m!145123 () Bool)

(assert (=> d!37501 m!145123))

(declare-fun m!145125 () Bool)

(assert (=> b!125095 m!145125))

(declare-fun m!145127 () Bool)

(assert (=> b!125096 m!145127))

(assert (=> b!124769 d!37501))

(declare-fun d!37503 () Bool)

(assert (=> d!37503 (= (apply!110 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64105) (apply!110 lt!64093 lt!64105))))

(declare-fun lt!64382 () Unit!3865)

(assert (=> d!37503 (= lt!64382 (choose!761 lt!64093 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64105))))

(declare-fun e!81734 () Bool)

(assert (=> d!37503 e!81734))

(declare-fun res!60567 () Bool)

(assert (=> d!37503 (=> (not res!60567) (not e!81734))))

(assert (=> d!37503 (= res!60567 (contains!863 lt!64093 lt!64105))))

(assert (=> d!37503 (= (addApplyDifferent!86 lt!64093 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64105) lt!64382)))

(declare-fun b!125097 () Bool)

(assert (=> b!125097 (= e!81734 (not (= lt!64105 lt!64085)))))

(assert (= (and d!37503 res!60567) b!125097))

(declare-fun m!145129 () Bool)

(assert (=> d!37503 m!145129))

(assert (=> d!37503 m!144619))

(assert (=> d!37503 m!144633))

(declare-fun m!145131 () Bool)

(assert (=> d!37503 m!145131))

(assert (=> d!37503 m!144619))

(assert (=> d!37503 m!144611))

(assert (=> b!124769 d!37503))

(declare-fun b!125106 () Bool)

(declare-fun e!81741 () Bool)

(declare-fun call!13394 () Bool)

(assert (=> b!125106 (= e!81741 call!13394)))

(declare-fun b!125107 () Bool)

(declare-fun e!81743 () Bool)

(assert (=> b!125107 (= e!81743 call!13394)))

(declare-fun d!37505 () Bool)

(declare-fun res!60573 () Bool)

(declare-fun e!81742 () Bool)

(assert (=> d!37505 (=> res!60573 e!81742)))

(assert (=> d!37505 (= res!60573 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4491 newMap!16) (mask!7008 newMap!16)) e!81742)))

(declare-fun b!125108 () Bool)

(assert (=> b!125108 (= e!81742 e!81741)))

(declare-fun c!22787 () Bool)

(assert (=> b!125108 (= c!22787 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125109 () Bool)

(assert (=> b!125109 (= e!81741 e!81743)))

(declare-fun lt!64391 () (_ BitVec 64))

(assert (=> b!125109 (= lt!64391 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64390 () Unit!3865)

(assert (=> b!125109 (= lt!64390 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4491 newMap!16) lt!64391 #b00000000000000000000000000000000))))

(assert (=> b!125109 (arrayContainsKey!0 (_keys!4491 newMap!16) lt!64391 #b00000000000000000000000000000000)))

(declare-fun lt!64389 () Unit!3865)

(assert (=> b!125109 (= lt!64389 lt!64390)))

(declare-fun res!60572 () Bool)

(assert (=> b!125109 (= res!60572 (= (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (_keys!4491 newMap!16) (mask!7008 newMap!16)) (Found!272 #b00000000000000000000000000000000)))))

(assert (=> b!125109 (=> (not res!60572) (not e!81743))))

(declare-fun bm!13391 () Bool)

(assert (=> bm!13391 (= call!13394 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(assert (= (and d!37505 (not res!60573)) b!125108))

(assert (= (and b!125108 c!22787) b!125109))

(assert (= (and b!125108 (not c!22787)) b!125106))

(assert (= (and b!125109 res!60572) b!125107))

(assert (= (or b!125107 b!125106) bm!13391))

(assert (=> b!125108 m!144651))

(assert (=> b!125108 m!144651))

(assert (=> b!125108 m!144659))

(assert (=> b!125109 m!144651))

(declare-fun m!145133 () Bool)

(assert (=> b!125109 m!145133))

(declare-fun m!145135 () Bool)

(assert (=> b!125109 m!145135))

(assert (=> b!125109 m!144651))

(declare-fun m!145137 () Bool)

(assert (=> b!125109 m!145137))

(declare-fun m!145139 () Bool)

(assert (=> bm!13391 m!145139))

(assert (=> b!124708 d!37505))

(declare-fun d!37507 () Bool)

(declare-fun e!81744 () Bool)

(assert (=> d!37507 e!81744))

(declare-fun res!60574 () Bool)

(assert (=> d!37507 (=> res!60574 e!81744)))

(declare-fun lt!64392 () Bool)

(assert (=> d!37507 (= res!60574 (not lt!64392))))

(declare-fun lt!64395 () Bool)

(assert (=> d!37507 (= lt!64392 lt!64395)))

(declare-fun lt!64394 () Unit!3865)

(declare-fun e!81745 () Unit!3865)

(assert (=> d!37507 (= lt!64394 e!81745)))

(declare-fun c!22788 () Bool)

(assert (=> d!37507 (= c!22788 lt!64395)))

(assert (=> d!37507 (= lt!64395 (containsKey!168 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37507 (= (contains!863 lt!64097 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64392)))

(declare-fun b!125110 () Bool)

(declare-fun lt!64393 () Unit!3865)

(assert (=> b!125110 (= e!81745 lt!64393)))

(assert (=> b!125110 (= lt!64393 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125110 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125111 () Bool)

(declare-fun Unit!3881 () Unit!3865)

(assert (=> b!125111 (= e!81745 Unit!3881)))

(declare-fun b!125112 () Bool)

(assert (=> b!125112 (= e!81744 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37507 c!22788) b!125110))

(assert (= (and d!37507 (not c!22788)) b!125111))

(assert (= (and d!37507 (not res!60574)) b!125112))

(declare-fun m!145141 () Bool)

(assert (=> d!37507 m!145141))

(declare-fun m!145143 () Bool)

(assert (=> b!125110 m!145143))

(assert (=> b!125110 m!145021))

(assert (=> b!125110 m!145021))

(declare-fun m!145145 () Bool)

(assert (=> b!125110 m!145145))

(assert (=> b!125112 m!145021))

(assert (=> b!125112 m!145021))

(assert (=> b!125112 m!145145))

(assert (=> bm!13340 d!37507))

(declare-fun d!37509 () Bool)

(declare-fun e!81746 () Bool)

(assert (=> d!37509 e!81746))

(declare-fun res!60576 () Bool)

(assert (=> d!37509 (=> (not res!60576) (not e!81746))))

(declare-fun lt!64399 () ListLongMap!1643)

(assert (=> d!37509 (= res!60576 (contains!863 lt!64399 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!64397 () List!1689)

(assert (=> d!37509 (= lt!64399 (ListLongMap!1644 lt!64397))))

(declare-fun lt!64398 () Unit!3865)

(declare-fun lt!64396 () Unit!3865)

(assert (=> d!37509 (= lt!64398 lt!64396)))

(assert (=> d!37509 (= (getValueByKey!164 lt!64397 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!169 (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37509 (= lt!64396 (lemmaContainsTupThenGetReturnValue!82 lt!64397 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37509 (= lt!64397 (insertStrictlySorted!85 (toList!837 e!81486) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37509 (= (+!157 e!81486 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64399)))

(declare-fun b!125113 () Bool)

(declare-fun res!60575 () Bool)

(assert (=> b!125113 (=> (not res!60575) (not e!81746))))

(assert (=> b!125113 (= res!60575 (= (getValueByKey!164 (toList!837 lt!64399) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!169 (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!125114 () Bool)

(assert (=> b!125114 (= e!81746 (contains!865 (toList!837 lt!64399) (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!37509 res!60576) b!125113))

(assert (= (and b!125113 res!60575) b!125114))

(declare-fun m!145147 () Bool)

(assert (=> d!37509 m!145147))

(declare-fun m!145149 () Bool)

(assert (=> d!37509 m!145149))

(declare-fun m!145151 () Bool)

(assert (=> d!37509 m!145151))

(declare-fun m!145153 () Bool)

(assert (=> d!37509 m!145153))

(declare-fun m!145155 () Bool)

(assert (=> b!125113 m!145155))

(declare-fun m!145157 () Bool)

(assert (=> b!125114 m!145157))

(assert (=> bm!13306 d!37509))

(assert (=> bm!13317 d!37425))

(declare-fun d!37511 () Bool)

(assert (=> d!37511 (= (map!1365 (_2!1279 lt!64023)) (getCurrentListMap!507 (_keys!4491 (_2!1279 lt!64023)) (_values!2746 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023)) (extraKeys!2548 (_2!1279 lt!64023)) (zeroValue!2628 (_2!1279 lt!64023)) (minValue!2628 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1279 lt!64023))))))

(declare-fun bs!5159 () Bool)

(assert (= bs!5159 d!37511))

(declare-fun m!145159 () Bool)

(assert (=> bs!5159 m!145159))

(assert (=> bm!13300 d!37511))

(declare-fun d!37513 () Bool)

(assert (=> d!37513 (= (apply!110 lt!64097 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5160 () Bool)

(assert (= bs!5160 d!37513))

(assert (=> bs!5160 m!144833))

(assert (=> bs!5160 m!144833))

(declare-fun m!145161 () Bool)

(assert (=> bs!5160 m!145161))

(assert (=> b!124755 d!37513))

(declare-fun d!37515 () Bool)

(declare-fun e!81747 () Bool)

(assert (=> d!37515 e!81747))

(declare-fun res!60577 () Bool)

(assert (=> d!37515 (=> res!60577 e!81747)))

(declare-fun lt!64400 () Bool)

(assert (=> d!37515 (= res!60577 (not lt!64400))))

(declare-fun lt!64403 () Bool)

(assert (=> d!37515 (= lt!64400 lt!64403)))

(declare-fun lt!64402 () Unit!3865)

(declare-fun e!81748 () Unit!3865)

(assert (=> d!37515 (= lt!64402 e!81748)))

(declare-fun c!22789 () Bool)

(assert (=> d!37515 (= c!22789 lt!64403)))

(assert (=> d!37515 (= lt!64403 (containsKey!168 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(assert (=> d!37515 (= (contains!863 call!13319 (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))) lt!64400)))

(declare-fun b!125115 () Bool)

(declare-fun lt!64401 () Unit!3865)

(assert (=> b!125115 (= e!81748 lt!64401)))

(assert (=> b!125115 (= lt!64401 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(assert (=> b!125115 (isDefined!118 (getValueByKey!164 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(declare-fun b!125116 () Bool)

(declare-fun Unit!3882 () Unit!3865)

(assert (=> b!125116 (= e!81748 Unit!3882)))

(declare-fun b!125117 () Bool)

(assert (=> b!125117 (= e!81747 (isDefined!118 (getValueByKey!164 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))))))

(assert (= (and d!37515 c!22789) b!125115))

(assert (= (and d!37515 (not c!22789)) b!125116))

(assert (= (and d!37515 (not res!60577)) b!125117))

(declare-fun m!145163 () Bool)

(assert (=> d!37515 m!145163))

(declare-fun m!145165 () Bool)

(assert (=> b!125115 m!145165))

(declare-fun m!145167 () Bool)

(assert (=> b!125115 m!145167))

(assert (=> b!125115 m!145167))

(declare-fun m!145169 () Bool)

(assert (=> b!125115 m!145169))

(assert (=> b!125117 m!145167))

(assert (=> b!125117 m!145167))

(assert (=> b!125117 m!145169))

(assert (=> bm!13316 d!37515))

(declare-fun d!37517 () Bool)

(declare-fun e!81749 () Bool)

(assert (=> d!37517 e!81749))

(declare-fun res!60578 () Bool)

(assert (=> d!37517 (=> res!60578 e!81749)))

(declare-fun lt!64404 () Bool)

(assert (=> d!37517 (= res!60578 (not lt!64404))))

(declare-fun lt!64407 () Bool)

(assert (=> d!37517 (= lt!64404 lt!64407)))

(declare-fun lt!64406 () Unit!3865)

(declare-fun e!81750 () Unit!3865)

(assert (=> d!37517 (= lt!64406 e!81750)))

(declare-fun c!22790 () Bool)

(assert (=> d!37517 (= c!22790 lt!64407)))

(assert (=> d!37517 (= lt!64407 (containsKey!168 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37517 (= (contains!863 lt!64097 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64404)))

(declare-fun b!125118 () Bool)

(declare-fun lt!64405 () Unit!3865)

(assert (=> b!125118 (= e!81750 lt!64405)))

(assert (=> b!125118 (= lt!64405 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!125118 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!125119 () Bool)

(declare-fun Unit!3883 () Unit!3865)

(assert (=> b!125119 (= e!81750 Unit!3883)))

(declare-fun b!125120 () Bool)

(assert (=> b!125120 (= e!81749 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37517 c!22790) b!125118))

(assert (= (and d!37517 (not c!22790)) b!125119))

(assert (= (and d!37517 (not res!60578)) b!125120))

(assert (=> d!37517 m!144579))

(declare-fun m!145171 () Bool)

(assert (=> d!37517 m!145171))

(assert (=> b!125118 m!144579))

(declare-fun m!145173 () Bool)

(assert (=> b!125118 m!145173))

(assert (=> b!125118 m!144579))

(assert (=> b!125118 m!144719))

(assert (=> b!125118 m!144719))

(declare-fun m!145175 () Bool)

(assert (=> b!125118 m!145175))

(assert (=> b!125120 m!144579))

(assert (=> b!125120 m!144719))

(assert (=> b!125120 m!144719))

(assert (=> b!125120 m!145175))

(assert (=> b!124771 d!37517))

(assert (=> b!124754 d!37407))

(declare-fun b!125121 () Bool)

(declare-fun e!81751 () Bool)

(assert (=> b!125121 (= e!81751 tp_is_empty!2833)))

(declare-fun b!125122 () Bool)

(declare-fun e!81752 () Bool)

(assert (=> b!125122 (= e!81752 tp_is_empty!2833)))

(declare-fun condMapEmpty!4485 () Bool)

(declare-fun mapDefault!4485 () ValueCell!1073)

(assert (=> mapNonEmpty!4484 (= condMapEmpty!4485 (= mapRest!4484 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4485)))))

(declare-fun mapRes!4485 () Bool)

(assert (=> mapNonEmpty!4484 (= tp!10928 (and e!81752 mapRes!4485))))

(declare-fun mapNonEmpty!4485 () Bool)

(declare-fun tp!10929 () Bool)

(assert (=> mapNonEmpty!4485 (= mapRes!4485 (and tp!10929 e!81751))))

(declare-fun mapRest!4485 () (Array (_ BitVec 32) ValueCell!1073))

(declare-fun mapKey!4485 () (_ BitVec 32))

(declare-fun mapValue!4485 () ValueCell!1073)

(assert (=> mapNonEmpty!4485 (= mapRest!4484 (store mapRest!4485 mapKey!4485 mapValue!4485))))

(declare-fun mapIsEmpty!4485 () Bool)

(assert (=> mapIsEmpty!4485 mapRes!4485))

(assert (= (and mapNonEmpty!4484 condMapEmpty!4485) mapIsEmpty!4485))

(assert (= (and mapNonEmpty!4484 (not condMapEmpty!4485)) mapNonEmpty!4485))

(assert (= (and mapNonEmpty!4485 ((_ is ValueCellFull!1073) mapValue!4485)) b!125121))

(assert (= (and mapNonEmpty!4484 ((_ is ValueCellFull!1073) mapDefault!4485)) b!125122))

(declare-fun m!145177 () Bool)

(assert (=> mapNonEmpty!4485 m!145177))

(declare-fun b!125123 () Bool)

(declare-fun e!81753 () Bool)

(assert (=> b!125123 (= e!81753 tp_is_empty!2833)))

(declare-fun b!125124 () Bool)

(declare-fun e!81754 () Bool)

(assert (=> b!125124 (= e!81754 tp_is_empty!2833)))

(declare-fun condMapEmpty!4486 () Bool)

(declare-fun mapDefault!4486 () ValueCell!1073)

(assert (=> mapNonEmpty!4483 (= condMapEmpty!4486 (= mapRest!4483 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4486)))))

(declare-fun mapRes!4486 () Bool)

(assert (=> mapNonEmpty!4483 (= tp!10927 (and e!81754 mapRes!4486))))

(declare-fun mapNonEmpty!4486 () Bool)

(declare-fun tp!10930 () Bool)

(assert (=> mapNonEmpty!4486 (= mapRes!4486 (and tp!10930 e!81753))))

(declare-fun mapValue!4486 () ValueCell!1073)

(declare-fun mapKey!4486 () (_ BitVec 32))

(declare-fun mapRest!4486 () (Array (_ BitVec 32) ValueCell!1073))

(assert (=> mapNonEmpty!4486 (= mapRest!4483 (store mapRest!4486 mapKey!4486 mapValue!4486))))

(declare-fun mapIsEmpty!4486 () Bool)

(assert (=> mapIsEmpty!4486 mapRes!4486))

(assert (= (and mapNonEmpty!4483 condMapEmpty!4486) mapIsEmpty!4486))

(assert (= (and mapNonEmpty!4483 (not condMapEmpty!4486)) mapNonEmpty!4486))

(assert (= (and mapNonEmpty!4486 ((_ is ValueCellFull!1073) mapValue!4486)) b!125123))

(assert (= (and mapNonEmpty!4483 ((_ is ValueCellFull!1073) mapDefault!4486)) b!125124))

(declare-fun m!145179 () Bool)

(assert (=> mapNonEmpty!4486 m!145179))

(declare-fun b_lambda!5477 () Bool)

(assert (= b_lambda!5471 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5477)))

(declare-fun b_lambda!5479 () Bool)

(assert (= b_lambda!5469 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5479)))

(declare-fun b_lambda!5481 () Bool)

(assert (= b_lambda!5473 (or (and b!124442 b_free!2833) (and b!124445 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))))) b_lambda!5481)))

(declare-fun b_lambda!5483 () Bool)

(assert (= b_lambda!5475 (or (and b!124442 b_free!2833) (and b!124445 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))))) b_lambda!5483)))

(declare-fun b_lambda!5485 () Bool)

(assert (= b_lambda!5467 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5485)))

(check-sat (not bm!13347) (not b!124933) (not bm!13382) (not d!37483) (not b!124808) (not b!125035) (not b!125114) (not b!124921) (not b!124814) (not d!37427) (not b!124918) (not b!124819) (not b!125112) (not d!37433) (not b!125038) (not d!37439) (not bm!13345) (not b!124880) (not d!37495) (not d!37487) (not bm!13367) (not bm!13354) (not b!124935) (not d!37503) (not b!124968) (not b!124970) (not d!37479) (not b!125109) (not bm!13360) (not d!37501) (not bm!13343) (not b!124898) (not b!125117) (not b!125091) (not d!37441) (not b!125120) (not b!124815) (not b!124971) (not d!37417) (not b_lambda!5485) (not bm!13352) (not bm!13366) (not b!124792) (not b!125094) (not bm!13359) (not b!124793) (not d!37467) (not b!124900) (not d!37509) (not b!124837) (not b!125080) (not d!37463) (not b_lambda!5479) (not b!125070) (not b!125033) (not d!37411) (not b!124835) (not bm!13379) (not b!124973) (not b_next!2833) (not d!37443) (not b!125089) (not b!124966) (not d!37513) (not b!124822) (not b!124813) (not b!124967) (not d!37451) (not b!125110) (not b!124804) (not b!124919) (not b!124787) (not b!124811) (not d!37461) (not bm!13370) (not b!124916) (not d!37455) (not bm!13353) (not b!124896) (not b!124989) (not d!37497) (not b!125113) (not b!125061) b_and!7675 (not bm!13385) (not d!37457) (not b!124913) (not mapNonEmpty!4485) (not b!124791) (not b!124986) (not b!125046) (not b!124825) (not b!125108) (not bm!13350) (not b!125115) (not b!125025) (not d!37429) (not b!125028) (not d!37421) tp_is_empty!2833 (not b!125078) (not b!124820) (not d!37447) (not b!124965) (not b!124816) (not b!125096) (not bm!13363) (not d!37475) (not b!125090) (not b!124806) (not d!37425) (not b!124794) (not b!124912) (not b_lambda!5483) (not d!37499) (not d!37413) (not mapNonEmpty!4486) (not b!125032) (not b!124885) (not b!124906) (not b!124810) b_and!7673 (not b!124823) (not b_lambda!5477) (not d!37511) (not b!125093) (not d!37489) (not b!124920) (not b!124817) (not d!37473) (not b!125058) (not b!124962) (not b!125118) (not b!125095) (not d!37493) (not b_lambda!5481) (not d!37491) (not b!124789) (not bm!13388) (not d!37485) (not d!37409) (not b!124988) (not bm!13346) (not b!124931) (not b!125057) (not b!124818) (not d!37481) (not d!37449) (not bm!13365) (not d!37477) (not d!37517) (not b!124975) (not b_next!2835) (not b!125081) (not b!124915) (not b!124812) (not b_lambda!5465) (not d!37515) (not b!124839) (not b!124961) (not d!37453) (not b!124824) (not d!37405) (not b_lambda!5461) (not b!124909) (not b!124788) (not bm!13380) (not b!124985) (not d!37423) (not b!125087) (not d!37507) (not bm!13391) (not d!37419))
(check-sat b_and!7673 b_and!7675 (not b_next!2833) (not b_next!2835))
(get-model)

(assert (=> d!37483 d!37475))

(assert (=> d!37483 d!37485))

(assert (=> d!37483 d!37491))

(declare-fun d!37519 () Bool)

(declare-fun e!81755 () Bool)

(assert (=> d!37519 e!81755))

(declare-fun res!60579 () Bool)

(assert (=> d!37519 (=> res!60579 e!81755)))

(declare-fun lt!64408 () Bool)

(assert (=> d!37519 (= res!60579 (not lt!64408))))

(declare-fun lt!64411 () Bool)

(assert (=> d!37519 (= lt!64408 lt!64411)))

(declare-fun lt!64410 () Unit!3865)

(declare-fun e!81756 () Unit!3865)

(assert (=> d!37519 (= lt!64410 e!81756)))

(declare-fun c!22791 () Bool)

(assert (=> d!37519 (= c!22791 lt!64411)))

(assert (=> d!37519 (= lt!64411 (containsKey!168 (toList!837 lt!64106) lt!64104))))

(assert (=> d!37519 (= (contains!863 lt!64106 lt!64104) lt!64408)))

(declare-fun b!125125 () Bool)

(declare-fun lt!64409 () Unit!3865)

(assert (=> b!125125 (= e!81756 lt!64409)))

(assert (=> b!125125 (= lt!64409 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64106) lt!64104))))

(assert (=> b!125125 (isDefined!118 (getValueByKey!164 (toList!837 lt!64106) lt!64104))))

(declare-fun b!125126 () Bool)

(declare-fun Unit!3884 () Unit!3865)

(assert (=> b!125126 (= e!81756 Unit!3884)))

(declare-fun b!125127 () Bool)

(assert (=> b!125127 (= e!81755 (isDefined!118 (getValueByKey!164 (toList!837 lt!64106) lt!64104)))))

(assert (= (and d!37519 c!22791) b!125125))

(assert (= (and d!37519 (not c!22791)) b!125126))

(assert (= (and d!37519 (not res!60579)) b!125127))

(declare-fun m!145181 () Bool)

(assert (=> d!37519 m!145181))

(declare-fun m!145183 () Bool)

(assert (=> b!125125 m!145183))

(assert (=> b!125125 m!145037))

(assert (=> b!125125 m!145037))

(declare-fun m!145185 () Bool)

(assert (=> b!125125 m!145185))

(assert (=> b!125127 m!145037))

(assert (=> b!125127 m!145037))

(assert (=> b!125127 m!145185))

(assert (=> d!37483 d!37519))

(declare-fun d!37521 () Bool)

(assert (=> d!37521 (= (apply!110 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64104) (apply!110 lt!64106 lt!64104))))

(assert (=> d!37521 true))

(declare-fun _$34!942 () Unit!3865)

(assert (=> d!37521 (= (choose!761 lt!64106 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64104) _$34!942)))

(declare-fun bs!5161 () Bool)

(assert (= bs!5161 d!37521))

(assert (=> bs!5161 m!144627))

(assert (=> bs!5161 m!144627))

(assert (=> bs!5161 m!144629))

(assert (=> bs!5161 m!144613))

(assert (=> d!37483 d!37521))

(declare-fun b!125129 () Bool)

(declare-fun e!81760 () Bool)

(declare-fun e!81759 () Bool)

(assert (=> b!125129 (= e!81760 e!81759)))

(declare-fun c!22792 () Bool)

(assert (=> b!125129 (= c!22792 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(declare-fun b!125130 () Bool)

(declare-fun e!81757 () Bool)

(assert (=> b!125130 (= e!81757 e!81760)))

(declare-fun res!60582 () Bool)

(assert (=> b!125130 (=> (not res!60582) (not e!81760))))

(declare-fun e!81758 () Bool)

(assert (=> b!125130 (= res!60582 (not e!81758))))

(declare-fun res!60581 () Bool)

(assert (=> b!125130 (=> (not res!60581) (not e!81758))))

(assert (=> b!125130 (= res!60581 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(declare-fun b!125131 () Bool)

(declare-fun call!13395 () Bool)

(assert (=> b!125131 (= e!81759 call!13395)))

(declare-fun d!37523 () Bool)

(declare-fun res!60580 () Bool)

(assert (=> d!37523 (=> res!60580 e!81757)))

(assert (=> d!37523 (= res!60580 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(assert (=> d!37523 (= (arrayNoDuplicates!0 (_keys!4491 (_2!1279 lt!64023)) #b00000000000000000000000000000000 Nil!1688) e!81757)))

(declare-fun b!125132 () Bool)

(assert (=> b!125132 (= e!81759 call!13395)))

(declare-fun bm!13392 () Bool)

(assert (=> bm!13392 (= call!13395 (arrayNoDuplicates!0 (_keys!4491 (_2!1279 lt!64023)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22792 (Cons!1687 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000) Nil!1688) Nil!1688)))))

(declare-fun b!125133 () Bool)

(assert (=> b!125133 (= e!81758 (contains!866 Nil!1688 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(assert (= (and d!37523 (not res!60580)) b!125130))

(assert (= (and b!125130 res!60581) b!125133))

(assert (= (and b!125130 res!60582) b!125129))

(assert (= (and b!125129 c!22792) b!125131))

(assert (= (and b!125129 (not c!22792)) b!125132))

(assert (= (or b!125131 b!125132) bm!13392))

(declare-fun m!145187 () Bool)

(assert (=> b!125129 m!145187))

(assert (=> b!125129 m!145187))

(declare-fun m!145189 () Bool)

(assert (=> b!125129 m!145189))

(assert (=> b!125130 m!145187))

(assert (=> b!125130 m!145187))

(assert (=> b!125130 m!145189))

(assert (=> bm!13392 m!145187))

(declare-fun m!145191 () Bool)

(assert (=> bm!13392 m!145191))

(assert (=> b!125133 m!145187))

(assert (=> b!125133 m!145187))

(declare-fun m!145193 () Bool)

(assert (=> b!125133 m!145193))

(assert (=> b!124812 d!37523))

(declare-fun d!37525 () Bool)

(assert (=> d!37525 (= (apply!110 lt!64211 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!164 (toList!837 lt!64211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5162 () Bool)

(assert (= bs!5162 d!37525))

(declare-fun m!145195 () Bool)

(assert (=> bs!5162 m!145195))

(assert (=> bs!5162 m!145195))

(declare-fun m!145197 () Bool)

(assert (=> bs!5162 m!145197))

(assert (=> b!124916 d!37525))

(declare-fun d!37527 () Bool)

(assert (=> d!37527 (= (apply!110 lt!64157 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!164 (toList!837 lt!64157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5163 () Bool)

(assert (= bs!5163 d!37527))

(declare-fun m!145199 () Bool)

(assert (=> bs!5163 m!145199))

(assert (=> bs!5163 m!145199))

(declare-fun m!145201 () Bool)

(assert (=> bs!5163 m!145201))

(assert (=> b!124820 d!37527))

(declare-fun d!37529 () Bool)

(assert (=> d!37529 (= (get!1438 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!124814 d!37529))

(declare-fun e!81762 () Option!170)

(declare-fun b!125136 () Bool)

(assert (=> b!125136 (= e!81762 (getValueByKey!164 (t!6007 (toList!837 lt!64377)) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun c!22793 () Bool)

(declare-fun d!37531 () Bool)

(assert (=> d!37531 (= c!22793 (and ((_ is Cons!1685) (toList!837 lt!64377)) (= (_1!1278 (h!2286 (toList!837 lt!64377))) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!81761 () Option!170)

(assert (=> d!37531 (= (getValueByKey!164 (toList!837 lt!64377) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!81761)))

(declare-fun b!125137 () Bool)

(assert (=> b!125137 (= e!81762 None!168)))

(declare-fun b!125135 () Bool)

(assert (=> b!125135 (= e!81761 e!81762)))

(declare-fun c!22794 () Bool)

(assert (=> b!125135 (= c!22794 (and ((_ is Cons!1685) (toList!837 lt!64377)) (not (= (_1!1278 (h!2286 (toList!837 lt!64377))) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125134 () Bool)

(assert (=> b!125134 (= e!81761 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64377)))))))

(assert (= (and d!37531 c!22793) b!125134))

(assert (= (and d!37531 (not c!22793)) b!125135))

(assert (= (and b!125135 c!22794) b!125136))

(assert (= (and b!125135 (not c!22794)) b!125137))

(declare-fun m!145203 () Bool)

(assert (=> b!125136 m!145203))

(assert (=> b!125093 d!37531))

(assert (=> b!124961 d!37407))

(assert (=> bm!13382 d!37437))

(declare-fun d!37533 () Bool)

(assert (=> d!37533 (= (validMask!0 (mask!7008 newMap!16)) (and (or (= (mask!7008 newMap!16) #b00000000000000000000000000000111) (= (mask!7008 newMap!16) #b00000000000000000000000000001111) (= (mask!7008 newMap!16) #b00000000000000000000000000011111) (= (mask!7008 newMap!16) #b00000000000000000000000000111111) (= (mask!7008 newMap!16) #b00000000000000000000000001111111) (= (mask!7008 newMap!16) #b00000000000000000000000011111111) (= (mask!7008 newMap!16) #b00000000000000000000000111111111) (= (mask!7008 newMap!16) #b00000000000000000000001111111111) (= (mask!7008 newMap!16) #b00000000000000000000011111111111) (= (mask!7008 newMap!16) #b00000000000000000000111111111111) (= (mask!7008 newMap!16) #b00000000000000000001111111111111) (= (mask!7008 newMap!16) #b00000000000000000011111111111111) (= (mask!7008 newMap!16) #b00000000000000000111111111111111) (= (mask!7008 newMap!16) #b00000000000000001111111111111111) (= (mask!7008 newMap!16) #b00000000000000011111111111111111) (= (mask!7008 newMap!16) #b00000000000000111111111111111111) (= (mask!7008 newMap!16) #b00000000000001111111111111111111) (= (mask!7008 newMap!16) #b00000000000011111111111111111111) (= (mask!7008 newMap!16) #b00000000000111111111111111111111) (= (mask!7008 newMap!16) #b00000000001111111111111111111111) (= (mask!7008 newMap!16) #b00000000011111111111111111111111) (= (mask!7008 newMap!16) #b00000000111111111111111111111111) (= (mask!7008 newMap!16) #b00000001111111111111111111111111) (= (mask!7008 newMap!16) #b00000011111111111111111111111111) (= (mask!7008 newMap!16) #b00000111111111111111111111111111) (= (mask!7008 newMap!16) #b00001111111111111111111111111111) (= (mask!7008 newMap!16) #b00011111111111111111111111111111) (= (mask!7008 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7008 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!37453 d!37533))

(declare-fun d!37535 () Bool)

(assert (=> d!37535 (= (apply!110 lt!64211 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!164 (toList!837 lt!64211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5164 () Bool)

(assert (= bs!5164 d!37535))

(declare-fun m!145205 () Bool)

(assert (=> bs!5164 m!145205))

(assert (=> bs!5164 m!145205))

(declare-fun m!145207 () Bool)

(assert (=> bs!5164 m!145207))

(assert (=> b!124919 d!37535))

(declare-fun d!37537 () Bool)

(assert (=> d!37537 (= (apply!110 lt!64157 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!164 (toList!837 lt!64157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5165 () Bool)

(assert (= bs!5165 d!37537))

(declare-fun m!145209 () Bool)

(assert (=> bs!5165 m!145209))

(assert (=> bs!5165 m!145209))

(declare-fun m!145211 () Bool)

(assert (=> bs!5165 m!145211))

(assert (=> b!124823 d!37537))

(declare-fun d!37539 () Bool)

(declare-fun res!60583 () Bool)

(declare-fun e!81763 () Bool)

(assert (=> d!37539 (=> res!60583 e!81763)))

(assert (=> d!37539 (= res!60583 (and ((_ is Cons!1685) (toList!837 call!13306)) (= (_1!1278 (h!2286 (toList!837 call!13306))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (=> d!37539 (= (containsKey!168 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) e!81763)))

(declare-fun b!125138 () Bool)

(declare-fun e!81764 () Bool)

(assert (=> b!125138 (= e!81763 e!81764)))

(declare-fun res!60584 () Bool)

(assert (=> b!125138 (=> (not res!60584) (not e!81764))))

(assert (=> b!125138 (= res!60584 (and (or (not ((_ is Cons!1685) (toList!837 call!13306))) (bvsle (_1!1278 (h!2286 (toList!837 call!13306))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))) ((_ is Cons!1685) (toList!837 call!13306)) (bvslt (_1!1278 (h!2286 (toList!837 call!13306))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(declare-fun b!125139 () Bool)

(assert (=> b!125139 (= e!81764 (containsKey!168 (t!6007 (toList!837 call!13306)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37539 (not res!60583)) b!125138))

(assert (= (and b!125138 res!60584) b!125139))

(assert (=> b!125139 m!144407))

(declare-fun m!145213 () Bool)

(assert (=> b!125139 m!145213))

(assert (=> d!37451 d!37539))

(declare-fun d!37541 () Bool)

(declare-fun e!81765 () Bool)

(assert (=> d!37541 e!81765))

(declare-fun res!60585 () Bool)

(assert (=> d!37541 (=> res!60585 e!81765)))

(declare-fun lt!64412 () Bool)

(assert (=> d!37541 (= res!60585 (not lt!64412))))

(declare-fun lt!64415 () Bool)

(assert (=> d!37541 (= lt!64412 lt!64415)))

(declare-fun lt!64414 () Unit!3865)

(declare-fun e!81766 () Unit!3865)

(assert (=> d!37541 (= lt!64414 e!81766)))

(declare-fun c!22795 () Bool)

(assert (=> d!37541 (= c!22795 lt!64415)))

(assert (=> d!37541 (= lt!64415 (containsKey!168 (toList!837 lt!64157) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37541 (= (contains!863 lt!64157 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) lt!64412)))

(declare-fun b!125140 () Bool)

(declare-fun lt!64413 () Unit!3865)

(assert (=> b!125140 (= e!81766 lt!64413)))

(assert (=> b!125140 (= lt!64413 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64157) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125140 (isDefined!118 (getValueByKey!164 (toList!837 lt!64157) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125141 () Bool)

(declare-fun Unit!3885 () Unit!3865)

(assert (=> b!125141 (= e!81766 Unit!3885)))

(declare-fun b!125142 () Bool)

(assert (=> b!125142 (= e!81765 (isDefined!118 (getValueByKey!164 (toList!837 lt!64157) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37541 c!22795) b!125140))

(assert (= (and d!37541 (not c!22795)) b!125141))

(assert (= (and d!37541 (not res!60585)) b!125142))

(assert (=> d!37541 m!144651))

(declare-fun m!145215 () Bool)

(assert (=> d!37541 m!145215))

(assert (=> b!125140 m!144651))

(declare-fun m!145217 () Bool)

(assert (=> b!125140 m!145217))

(assert (=> b!125140 m!144651))

(declare-fun m!145219 () Bool)

(assert (=> b!125140 m!145219))

(assert (=> b!125140 m!145219))

(declare-fun m!145221 () Bool)

(assert (=> b!125140 m!145221))

(assert (=> b!125142 m!144651))

(assert (=> b!125142 m!145219))

(assert (=> b!125142 m!145219))

(assert (=> b!125142 m!145221))

(assert (=> b!124839 d!37541))

(declare-fun d!37543 () Bool)

(declare-fun e!81767 () Bool)

(assert (=> d!37543 e!81767))

(declare-fun res!60586 () Bool)

(assert (=> d!37543 (=> res!60586 e!81767)))

(declare-fun lt!64416 () Bool)

(assert (=> d!37543 (= res!60586 (not lt!64416))))

(declare-fun lt!64419 () Bool)

(assert (=> d!37543 (= lt!64416 lt!64419)))

(declare-fun lt!64418 () Unit!3865)

(declare-fun e!81768 () Unit!3865)

(assert (=> d!37543 (= lt!64418 e!81768)))

(declare-fun c!22796 () Bool)

(assert (=> d!37543 (= c!22796 lt!64419)))

(assert (=> d!37543 (= lt!64419 (containsKey!168 (toList!837 lt!64211) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37543 (= (contains!863 lt!64211 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) lt!64416)))

(declare-fun b!125143 () Bool)

(declare-fun lt!64417 () Unit!3865)

(assert (=> b!125143 (= e!81768 lt!64417)))

(assert (=> b!125143 (= lt!64417 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64211) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125143 (isDefined!118 (getValueByKey!164 (toList!837 lt!64211) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125144 () Bool)

(declare-fun Unit!3886 () Unit!3865)

(assert (=> b!125144 (= e!81768 Unit!3886)))

(declare-fun b!125145 () Bool)

(assert (=> b!125145 (= e!81767 (isDefined!118 (getValueByKey!164 (toList!837 lt!64211) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37543 c!22796) b!125143))

(assert (= (and d!37543 (not c!22796)) b!125144))

(assert (= (and d!37543 (not res!60586)) b!125145))

(assert (=> d!37543 m!144651))

(declare-fun m!145223 () Bool)

(assert (=> d!37543 m!145223))

(assert (=> b!125143 m!144651))

(declare-fun m!145225 () Bool)

(assert (=> b!125143 m!145225))

(assert (=> b!125143 m!144651))

(declare-fun m!145227 () Bool)

(assert (=> b!125143 m!145227))

(assert (=> b!125143 m!145227))

(declare-fun m!145229 () Bool)

(assert (=> b!125143 m!145229))

(assert (=> b!125145 m!144651))

(assert (=> b!125145 m!145227))

(assert (=> b!125145 m!145227))

(assert (=> b!125145 m!145229))

(assert (=> b!124935 d!37543))

(assert (=> d!37421 d!37533))

(declare-fun d!37545 () Bool)

(assert (=> d!37545 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087))))

(declare-fun lt!64420 () Unit!3865)

(assert (=> d!37545 (= lt!64420 (choose!755 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087))))

(declare-fun e!81769 () Bool)

(assert (=> d!37545 e!81769))

(declare-fun res!60587 () Bool)

(assert (=> d!37545 (=> (not res!60587) (not e!81769))))

(assert (=> d!37545 (= res!60587 (isStrictlySorted!311 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37545 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087) lt!64420)))

(declare-fun b!125146 () Bool)

(assert (=> b!125146 (= e!81769 (containsKey!168 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087))))

(assert (= (and d!37545 res!60587) b!125146))

(assert (=> d!37545 m!145077))

(assert (=> d!37545 m!145077))

(assert (=> d!37545 m!145079))

(declare-fun m!145231 () Bool)

(assert (=> d!37545 m!145231))

(declare-fun m!145233 () Bool)

(assert (=> d!37545 m!145233))

(assert (=> b!125146 m!145073))

(assert (=> b!125087 d!37545))

(declare-fun d!37547 () Bool)

(assert (=> d!37547 (= (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087)) (not (isEmpty!397 (getValueByKey!164 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087))))))

(declare-fun bs!5166 () Bool)

(assert (= bs!5166 d!37547))

(assert (=> bs!5166 m!145077))

(declare-fun m!145235 () Bool)

(assert (=> bs!5166 m!145235))

(assert (=> b!125087 d!37547))

(declare-fun b!125149 () Bool)

(declare-fun e!81771 () Option!170)

(assert (=> b!125149 (= e!81771 (getValueByKey!164 (t!6007 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) lt!64087))))

(declare-fun d!37549 () Bool)

(declare-fun c!22797 () Bool)

(assert (=> d!37549 (= c!22797 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64087)))))

(declare-fun e!81770 () Option!170)

(assert (=> d!37549 (= (getValueByKey!164 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087) e!81770)))

(declare-fun b!125150 () Bool)

(assert (=> b!125150 (= e!81771 None!168)))

(declare-fun b!125148 () Bool)

(assert (=> b!125148 (= e!81770 e!81771)))

(declare-fun c!22798 () Bool)

(assert (=> b!125148 (= c!22798 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) (not (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64087))))))

(declare-fun b!125147 () Bool)

(assert (=> b!125147 (= e!81770 (Some!169 (_2!1278 (h!2286 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))))

(assert (= (and d!37549 c!22797) b!125147))

(assert (= (and d!37549 (not c!22797)) b!125148))

(assert (= (and b!125148 c!22798) b!125149))

(assert (= (and b!125148 (not c!22798)) b!125150))

(declare-fun m!145237 () Bool)

(assert (=> b!125149 m!145237))

(assert (=> b!125087 d!37549))

(assert (=> d!37447 d!37533))

(declare-fun d!37551 () Bool)

(declare-fun lt!64423 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!123 (List!1689) (InoxSet tuple2!2534))

(assert (=> d!37551 (= lt!64423 (select (content!123 (toList!837 lt!64370)) (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun e!81776 () Bool)

(assert (=> d!37551 (= lt!64423 e!81776)))

(declare-fun res!60593 () Bool)

(assert (=> d!37551 (=> (not res!60593) (not e!81776))))

(assert (=> d!37551 (= res!60593 ((_ is Cons!1685) (toList!837 lt!64370)))))

(assert (=> d!37551 (= (contains!865 (toList!837 lt!64370) (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64423)))

(declare-fun b!125155 () Bool)

(declare-fun e!81777 () Bool)

(assert (=> b!125155 (= e!81776 e!81777)))

(declare-fun res!60592 () Bool)

(assert (=> b!125155 (=> res!60592 e!81777)))

(assert (=> b!125155 (= res!60592 (= (h!2286 (toList!837 lt!64370)) (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125156 () Bool)

(assert (=> b!125156 (= e!81777 (contains!865 (t!6007 (toList!837 lt!64370)) (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37551 res!60593) b!125155))

(assert (= (and b!125155 (not res!60592)) b!125156))

(declare-fun m!145239 () Bool)

(assert (=> d!37551 m!145239))

(declare-fun m!145241 () Bool)

(assert (=> d!37551 m!145241))

(declare-fun m!145243 () Bool)

(assert (=> b!125156 m!145243))

(assert (=> b!125091 d!37551))

(declare-fun d!37553 () Bool)

(assert (=> d!37553 (contains!863 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))

(declare-fun lt!64426 () Unit!3865)

(declare-fun choose!763 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 64) (_ BitVec 32) Int) Unit!3865)

(assert (=> d!37553 (= lt!64426 (choose!763 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> d!37553 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37553 (= (lemmaArrayContainsKeyThenInListMap!36 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64426)))

(declare-fun bs!5167 () Bool)

(assert (= bs!5167 d!37553))

(assert (=> bs!5167 m!144527))

(assert (=> bs!5167 m!144527))

(assert (=> bs!5167 m!144407))

(assert (=> bs!5167 m!144539))

(assert (=> bs!5167 m!144407))

(declare-fun m!145245 () Bool)

(assert (=> bs!5167 m!145245))

(assert (=> bs!5167 m!144709))

(assert (=> b!125025 d!37553))

(assert (=> b!125025 d!37443))

(assert (=> b!125025 d!37421))

(declare-fun d!37555 () Bool)

(declare-fun e!81778 () Bool)

(assert (=> d!37555 e!81778))

(declare-fun res!60594 () Bool)

(assert (=> d!37555 (=> res!60594 e!81778)))

(declare-fun lt!64427 () Bool)

(assert (=> d!37555 (= res!60594 (not lt!64427))))

(declare-fun lt!64430 () Bool)

(assert (=> d!37555 (= lt!64427 lt!64430)))

(declare-fun lt!64429 () Unit!3865)

(declare-fun e!81779 () Unit!3865)

(assert (=> d!37555 (= lt!64429 e!81779)))

(declare-fun c!22799 () Bool)

(assert (=> d!37555 (= c!22799 lt!64430)))

(assert (=> d!37555 (= lt!64430 (containsKey!168 (toList!837 lt!64381) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37555 (= (contains!863 lt!64381 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64427)))

(declare-fun b!125157 () Bool)

(declare-fun lt!64428 () Unit!3865)

(assert (=> b!125157 (= e!81779 lt!64428)))

(assert (=> b!125157 (= lt!64428 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64381) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> b!125157 (isDefined!118 (getValueByKey!164 (toList!837 lt!64381) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125158 () Bool)

(declare-fun Unit!3887 () Unit!3865)

(assert (=> b!125158 (= e!81779 Unit!3887)))

(declare-fun b!125159 () Bool)

(assert (=> b!125159 (= e!81778 (isDefined!118 (getValueByKey!164 (toList!837 lt!64381) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!37555 c!22799) b!125157))

(assert (= (and d!37555 (not c!22799)) b!125158))

(assert (= (and d!37555 (not res!60594)) b!125159))

(declare-fun m!145247 () Bool)

(assert (=> d!37555 m!145247))

(declare-fun m!145249 () Bool)

(assert (=> b!125157 m!145249))

(assert (=> b!125157 m!145125))

(assert (=> b!125157 m!145125))

(declare-fun m!145251 () Bool)

(assert (=> b!125157 m!145251))

(assert (=> b!125159 m!145125))

(assert (=> b!125159 m!145125))

(assert (=> b!125159 m!145251))

(assert (=> d!37501 d!37555))

(declare-fun e!81781 () Option!170)

(declare-fun b!125162 () Bool)

(assert (=> b!125162 (= e!81781 (getValueByKey!164 (t!6007 lt!64379) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun c!22800 () Bool)

(declare-fun d!37557 () Bool)

(assert (=> d!37557 (= c!22800 (and ((_ is Cons!1685) lt!64379) (= (_1!1278 (h!2286 lt!64379)) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!81780 () Option!170)

(assert (=> d!37557 (= (getValueByKey!164 lt!64379 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!81780)))

(declare-fun b!125163 () Bool)

(assert (=> b!125163 (= e!81781 None!168)))

(declare-fun b!125161 () Bool)

(assert (=> b!125161 (= e!81780 e!81781)))

(declare-fun c!22801 () Bool)

(assert (=> b!125161 (= c!22801 (and ((_ is Cons!1685) lt!64379) (not (= (_1!1278 (h!2286 lt!64379)) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125160 () Bool)

(assert (=> b!125160 (= e!81780 (Some!169 (_2!1278 (h!2286 lt!64379))))))

(assert (= (and d!37557 c!22800) b!125160))

(assert (= (and d!37557 (not c!22800)) b!125161))

(assert (= (and b!125161 c!22801) b!125162))

(assert (= (and b!125161 (not c!22801)) b!125163))

(declare-fun m!145253 () Bool)

(assert (=> b!125162 m!145253))

(assert (=> d!37501 d!37557))

(declare-fun d!37559 () Bool)

(assert (=> d!37559 (= (getValueByKey!164 lt!64379 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64433 () Unit!3865)

(declare-fun choose!764 (List!1689 (_ BitVec 64) V!3425) Unit!3865)

(assert (=> d!37559 (= lt!64433 (choose!764 lt!64379 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun e!81784 () Bool)

(assert (=> d!37559 e!81784))

(declare-fun res!60599 () Bool)

(assert (=> d!37559 (=> (not res!60599) (not e!81784))))

(assert (=> d!37559 (= res!60599 (isStrictlySorted!311 lt!64379))))

(assert (=> d!37559 (= (lemmaContainsTupThenGetReturnValue!82 lt!64379 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64433)))

(declare-fun b!125168 () Bool)

(declare-fun res!60600 () Bool)

(assert (=> b!125168 (=> (not res!60600) (not e!81784))))

(assert (=> b!125168 (= res!60600 (containsKey!168 lt!64379 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125169 () Bool)

(assert (=> b!125169 (= e!81784 (contains!865 lt!64379 (tuple2!2535 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!37559 res!60599) b!125168))

(assert (= (and b!125168 res!60600) b!125169))

(assert (=> d!37559 m!145119))

(declare-fun m!145255 () Bool)

(assert (=> d!37559 m!145255))

(declare-fun m!145257 () Bool)

(assert (=> d!37559 m!145257))

(declare-fun m!145259 () Bool)

(assert (=> b!125168 m!145259))

(declare-fun m!145261 () Bool)

(assert (=> b!125169 m!145261))

(assert (=> d!37501 d!37559))

(declare-fun b!125190 () Bool)

(declare-fun e!81797 () List!1689)

(declare-fun call!13404 () List!1689)

(assert (=> b!125190 (= e!81797 call!13404)))

(declare-fun bm!13399 () Bool)

(declare-fun call!13402 () List!1689)

(declare-fun call!13403 () List!1689)

(assert (=> bm!13399 (= call!13402 call!13403)))

(declare-fun b!125191 () Bool)

(declare-fun e!81799 () List!1689)

(assert (=> b!125191 (= e!81799 call!13403)))

(declare-fun d!37561 () Bool)

(declare-fun e!81798 () Bool)

(assert (=> d!37561 e!81798))

(declare-fun res!60606 () Bool)

(assert (=> d!37561 (=> (not res!60606) (not e!81798))))

(declare-fun lt!64436 () List!1689)

(assert (=> d!37561 (= res!60606 (isStrictlySorted!311 lt!64436))))

(assert (=> d!37561 (= lt!64436 e!81799)))

(declare-fun c!22811 () Bool)

(assert (=> d!37561 (= c!22811 (and ((_ is Cons!1685) (toList!837 lt!64100)) (bvslt (_1!1278 (h!2286 (toList!837 lt!64100))) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37561 (isStrictlySorted!311 (toList!837 lt!64100))))

(assert (=> d!37561 (= (insertStrictlySorted!85 (toList!837 lt!64100) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64436)))

(declare-fun b!125192 () Bool)

(assert (=> b!125192 (= e!81797 call!13404)))

(declare-fun bm!13400 () Bool)

(declare-fun e!81796 () List!1689)

(declare-fun $colon$colon!87 (List!1689 tuple2!2534) List!1689)

(assert (=> bm!13400 (= call!13403 ($colon$colon!87 e!81796 (ite c!22811 (h!2286 (toList!837 lt!64100)) (tuple2!2535 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun c!22810 () Bool)

(assert (=> bm!13400 (= c!22810 c!22811)))

(declare-fun b!125193 () Bool)

(declare-fun e!81795 () List!1689)

(assert (=> b!125193 (= e!81799 e!81795)))

(declare-fun c!22812 () Bool)

(assert (=> b!125193 (= c!22812 (and ((_ is Cons!1685) (toList!837 lt!64100)) (= (_1!1278 (h!2286 (toList!837 lt!64100))) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun c!22813 () Bool)

(declare-fun b!125194 () Bool)

(assert (=> b!125194 (= c!22813 (and ((_ is Cons!1685) (toList!837 lt!64100)) (bvsgt (_1!1278 (h!2286 (toList!837 lt!64100))) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> b!125194 (= e!81795 e!81797)))

(declare-fun b!125195 () Bool)

(assert (=> b!125195 (= e!81798 (contains!865 lt!64436 (tuple2!2535 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125196 () Bool)

(assert (=> b!125196 (= e!81796 (insertStrictlySorted!85 (t!6007 (toList!837 lt!64100)) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125197 () Bool)

(assert (=> b!125197 (= e!81795 call!13402)))

(declare-fun bm!13401 () Bool)

(assert (=> bm!13401 (= call!13404 call!13402)))

(declare-fun b!125198 () Bool)

(declare-fun res!60605 () Bool)

(assert (=> b!125198 (=> (not res!60605) (not e!81798))))

(assert (=> b!125198 (= res!60605 (containsKey!168 lt!64436 (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125199 () Bool)

(assert (=> b!125199 (= e!81796 (ite c!22812 (t!6007 (toList!837 lt!64100)) (ite c!22813 (Cons!1685 (h!2286 (toList!837 lt!64100)) (t!6007 (toList!837 lt!64100))) Nil!1686)))))

(assert (= (and d!37561 c!22811) b!125191))

(assert (= (and d!37561 (not c!22811)) b!125193))

(assert (= (and b!125193 c!22812) b!125197))

(assert (= (and b!125193 (not c!22812)) b!125194))

(assert (= (and b!125194 c!22813) b!125192))

(assert (= (and b!125194 (not c!22813)) b!125190))

(assert (= (or b!125192 b!125190) bm!13401))

(assert (= (or b!125197 bm!13401) bm!13399))

(assert (= (or b!125191 bm!13399) bm!13400))

(assert (= (and bm!13400 c!22810) b!125196))

(assert (= (and bm!13400 (not c!22810)) b!125199))

(assert (= (and d!37561 res!60606) b!125198))

(assert (= (and b!125198 res!60605) b!125195))

(declare-fun m!145263 () Bool)

(assert (=> d!37561 m!145263))

(declare-fun m!145265 () Bool)

(assert (=> d!37561 m!145265))

(declare-fun m!145267 () Bool)

(assert (=> b!125198 m!145267))

(declare-fun m!145269 () Bool)

(assert (=> b!125196 m!145269))

(declare-fun m!145271 () Bool)

(assert (=> b!125195 m!145271))

(declare-fun m!145273 () Bool)

(assert (=> bm!13400 m!145273))

(assert (=> d!37501 d!37561))

(declare-fun d!37563 () Bool)

(declare-fun res!60610 () Bool)

(declare-fun e!81800 () Bool)

(assert (=> d!37563 (=> (not res!60610) (not e!81800))))

(assert (=> d!37563 (= res!60610 (validMask!0 (mask!7008 (v!3101 (underlying!432 thiss!992)))))))

(assert (=> d!37563 (= (simpleValid!86 (v!3101 (underlying!432 thiss!992))) e!81800)))

(declare-fun b!125200 () Bool)

(declare-fun res!60608 () Bool)

(assert (=> b!125200 (=> (not res!60608) (not e!81800))))

(assert (=> b!125200 (= res!60608 (and (= (size!2471 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000001)) (= (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (size!2471 (_values!2746 (v!3101 (underlying!432 thiss!992))))) (bvsge (_size!576 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!576 (v!3101 (underlying!432 thiss!992))) (bvadd (mask!7008 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!125202 () Bool)

(declare-fun res!60607 () Bool)

(assert (=> b!125202 (=> (not res!60607) (not e!81800))))

(assert (=> b!125202 (= res!60607 (= (size!2476 (v!3101 (underlying!432 thiss!992))) (bvadd (_size!576 (v!3101 (underlying!432 thiss!992))) (bvsdiv (bvadd (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!125201 () Bool)

(declare-fun res!60609 () Bool)

(assert (=> b!125201 (=> (not res!60609) (not e!81800))))

(assert (=> b!125201 (= res!60609 (bvsge (size!2476 (v!3101 (underlying!432 thiss!992))) (_size!576 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!125203 () Bool)

(assert (=> b!125203 (= e!81800 (and (bvsge (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!576 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!37563 res!60610) b!125200))

(assert (= (and b!125200 res!60608) b!125201))

(assert (= (and b!125201 res!60609) b!125202))

(assert (= (and b!125202 res!60607) b!125203))

(assert (=> d!37563 m!144431))

(declare-fun m!145275 () Bool)

(assert (=> b!125202 m!145275))

(assert (=> b!125201 m!145275))

(assert (=> d!37419 d!37563))

(declare-fun d!37565 () Bool)

(declare-fun e!81801 () Bool)

(assert (=> d!37565 e!81801))

(declare-fun res!60611 () Bool)

(assert (=> d!37565 (=> res!60611 e!81801)))

(declare-fun lt!64437 () Bool)

(assert (=> d!37565 (= res!60611 (not lt!64437))))

(declare-fun lt!64440 () Bool)

(assert (=> d!37565 (= lt!64437 lt!64440)))

(declare-fun lt!64439 () Unit!3865)

(declare-fun e!81802 () Unit!3865)

(assert (=> d!37565 (= lt!64439 e!81802)))

(declare-fun c!22814 () Bool)

(assert (=> d!37565 (= c!22814 lt!64440)))

(assert (=> d!37565 (= lt!64440 (containsKey!168 (toList!837 lt!64236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37565 (= (contains!863 lt!64236 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64437)))

(declare-fun b!125204 () Bool)

(declare-fun lt!64438 () Unit!3865)

(assert (=> b!125204 (= e!81802 lt!64438)))

(assert (=> b!125204 (= lt!64438 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125204 (isDefined!118 (getValueByKey!164 (toList!837 lt!64236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125205 () Bool)

(declare-fun Unit!3888 () Unit!3865)

(assert (=> b!125205 (= e!81802 Unit!3888)))

(declare-fun b!125206 () Bool)

(assert (=> b!125206 (= e!81801 (isDefined!118 (getValueByKey!164 (toList!837 lt!64236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37565 c!22814) b!125204))

(assert (= (and d!37565 (not c!22814)) b!125205))

(assert (= (and d!37565 (not res!60611)) b!125206))

(declare-fun m!145277 () Bool)

(assert (=> d!37565 m!145277))

(declare-fun m!145279 () Bool)

(assert (=> b!125204 m!145279))

(declare-fun m!145281 () Bool)

(assert (=> b!125204 m!145281))

(assert (=> b!125204 m!145281))

(declare-fun m!145283 () Bool)

(assert (=> b!125204 m!145283))

(assert (=> b!125206 m!145281))

(assert (=> b!125206 m!145281))

(assert (=> b!125206 m!145283))

(assert (=> b!124968 d!37565))

(assert (=> d!37427 d!37429))

(assert (=> d!37427 d!37431))

(declare-fun d!37567 () Bool)

(assert (=> d!37567 (isDefined!118 (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!37567 true))

(declare-fun _$12!387 () Unit!3865)

(assert (=> d!37567 (= (choose!755 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) _$12!387)))

(declare-fun bs!5168 () Bool)

(assert (= bs!5168 d!37567))

(assert (=> bs!5168 m!144407))

(assert (=> bs!5168 m!144505))

(assert (=> bs!5168 m!144505))

(assert (=> bs!5168 m!144507))

(assert (=> d!37427 d!37567))

(declare-fun d!37569 () Bool)

(declare-fun res!60616 () Bool)

(declare-fun e!81807 () Bool)

(assert (=> d!37569 (=> res!60616 e!81807)))

(assert (=> d!37569 (= res!60616 (or ((_ is Nil!1686) (toList!837 lt!63929)) ((_ is Nil!1686) (t!6007 (toList!837 lt!63929)))))))

(assert (=> d!37569 (= (isStrictlySorted!311 (toList!837 lt!63929)) e!81807)))

(declare-fun b!125211 () Bool)

(declare-fun e!81808 () Bool)

(assert (=> b!125211 (= e!81807 e!81808)))

(declare-fun res!60617 () Bool)

(assert (=> b!125211 (=> (not res!60617) (not e!81808))))

(assert (=> b!125211 (= res!60617 (bvslt (_1!1278 (h!2286 (toList!837 lt!63929))) (_1!1278 (h!2286 (t!6007 (toList!837 lt!63929))))))))

(declare-fun b!125212 () Bool)

(assert (=> b!125212 (= e!81808 (isStrictlySorted!311 (t!6007 (toList!837 lt!63929))))))

(assert (= (and d!37569 (not res!60616)) b!125211))

(assert (= (and b!125211 res!60617) b!125212))

(declare-fun m!145285 () Bool)

(assert (=> b!125212 m!145285))

(assert (=> d!37427 d!37569))

(declare-fun d!37571 () Bool)

(declare-fun e!81809 () Bool)

(assert (=> d!37571 e!81809))

(declare-fun res!60619 () Bool)

(assert (=> d!37571 (=> (not res!60619) (not e!81809))))

(declare-fun lt!64444 () ListLongMap!1643)

(assert (=> d!37571 (= res!60619 (contains!863 lt!64444 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun lt!64442 () List!1689)

(assert (=> d!37571 (= lt!64444 (ListLongMap!1644 lt!64442))))

(declare-fun lt!64443 () Unit!3865)

(declare-fun lt!64441 () Unit!3865)

(assert (=> d!37571 (= lt!64443 lt!64441)))

(assert (=> d!37571 (= (getValueByKey!164 lt!64442 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37571 (= lt!64441 (lemmaContainsTupThenGetReturnValue!82 lt!64442 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37571 (= lt!64442 (insertStrictlySorted!85 (toList!837 call!13344) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37571 (= (+!157 call!13344 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) lt!64444)))

(declare-fun b!125213 () Bool)

(declare-fun res!60618 () Bool)

(assert (=> b!125213 (=> (not res!60618) (not e!81809))))

(assert (=> b!125213 (= res!60618 (= (getValueByKey!164 (toList!837 lt!64444) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(declare-fun b!125214 () Bool)

(assert (=> b!125214 (= e!81809 (contains!865 (toList!837 lt!64444) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(assert (= (and d!37571 res!60619) b!125213))

(assert (= (and b!125213 res!60618) b!125214))

(declare-fun m!145287 () Bool)

(assert (=> d!37571 m!145287))

(declare-fun m!145289 () Bool)

(assert (=> d!37571 m!145289))

(declare-fun m!145291 () Bool)

(assert (=> d!37571 m!145291))

(declare-fun m!145293 () Bool)

(assert (=> d!37571 m!145293))

(declare-fun m!145295 () Bool)

(assert (=> b!125213 m!145295))

(declare-fun m!145297 () Bool)

(assert (=> b!125214 m!145297))

(assert (=> b!124804 d!37571))

(declare-fun d!37573 () Bool)

(assert (=> d!37573 (= (map!1365 (_2!1279 lt!64322)) (getCurrentListMap!507 (_keys!4491 (_2!1279 lt!64322)) (_values!2746 (_2!1279 lt!64322)) (mask!7008 (_2!1279 lt!64322)) (extraKeys!2548 (_2!1279 lt!64322)) (zeroValue!2628 (_2!1279 lt!64322)) (minValue!2628 (_2!1279 lt!64322)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1279 lt!64322))))))

(declare-fun bs!5169 () Bool)

(assert (= bs!5169 d!37573))

(declare-fun m!145299 () Bool)

(assert (=> bs!5169 m!145299))

(assert (=> b!125028 d!37573))

(declare-fun d!37575 () Bool)

(declare-fun e!81810 () Bool)

(assert (=> d!37575 e!81810))

(declare-fun res!60621 () Bool)

(assert (=> d!37575 (=> (not res!60621) (not e!81810))))

(declare-fun lt!64448 () ListLongMap!1643)

(assert (=> d!37575 (= res!60621 (contains!863 lt!64448 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64446 () List!1689)

(assert (=> d!37575 (= lt!64448 (ListLongMap!1644 lt!64446))))

(declare-fun lt!64447 () Unit!3865)

(declare-fun lt!64445 () Unit!3865)

(assert (=> d!37575 (= lt!64447 lt!64445)))

(assert (=> d!37575 (= (getValueByKey!164 lt!64446 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37575 (= lt!64445 (lemmaContainsTupThenGetReturnValue!82 lt!64446 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37575 (= lt!64446 (insertStrictlySorted!85 (toList!837 (map!1365 newMap!16)) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37575 (= (+!157 (map!1365 newMap!16) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64448)))

(declare-fun b!125215 () Bool)

(declare-fun res!60620 () Bool)

(assert (=> b!125215 (=> (not res!60620) (not e!81810))))

(assert (=> b!125215 (= res!60620 (= (getValueByKey!164 (toList!837 lt!64448) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125216 () Bool)

(assert (=> b!125216 (= e!81810 (contains!865 (toList!837 lt!64448) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37575 res!60621) b!125215))

(assert (= (and b!125215 res!60620) b!125216))

(declare-fun m!145301 () Bool)

(assert (=> d!37575 m!145301))

(declare-fun m!145303 () Bool)

(assert (=> d!37575 m!145303))

(declare-fun m!145305 () Bool)

(assert (=> d!37575 m!145305))

(declare-fun m!145307 () Bool)

(assert (=> d!37575 m!145307))

(declare-fun m!145309 () Bool)

(assert (=> b!125215 m!145309))

(declare-fun m!145311 () Bool)

(assert (=> b!125216 m!145311))

(assert (=> b!125028 d!37575))

(assert (=> b!125028 d!37401))

(declare-fun d!37577 () Bool)

(assert (=> d!37577 (= (size!2476 newMap!16) (bvadd (_size!576 newMap!16) (bvsdiv (bvadd (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!124986 d!37577))

(declare-fun d!37579 () Bool)

(assert (=> d!37579 (= (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125058 d!37579))

(declare-fun b!125217 () Bool)

(declare-fun e!81812 () (_ BitVec 32))

(declare-fun e!81811 () (_ BitVec 32))

(assert (=> b!125217 (= e!81812 e!81811)))

(declare-fun c!22815 () Bool)

(assert (=> b!125217 (= c!22815 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!37581 () Bool)

(declare-fun lt!64449 () (_ BitVec 32))

(assert (=> d!37581 (and (bvsge lt!64449 #b00000000000000000000000000000000) (bvsle lt!64449 (bvsub (size!2470 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!37581 (= lt!64449 e!81812)))

(declare-fun c!22816 () Bool)

(assert (=> d!37581 (= c!22816 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37581 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2470 (_keys!4491 newMap!16)) (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37581 (= (arrayCountValidKeys!0 (_keys!4491 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))) lt!64449)))

(declare-fun b!125218 () Bool)

(assert (=> b!125218 (= e!81812 #b00000000000000000000000000000000)))

(declare-fun bm!13402 () Bool)

(declare-fun call!13405 () (_ BitVec 32))

(assert (=> bm!13402 (= call!13405 (arrayCountValidKeys!0 (_keys!4491 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125219 () Bool)

(assert (=> b!125219 (= e!81811 call!13405)))

(declare-fun b!125220 () Bool)

(assert (=> b!125220 (= e!81811 (bvadd #b00000000000000000000000000000001 call!13405))))

(assert (= (and d!37581 c!22816) b!125218))

(assert (= (and d!37581 (not c!22816)) b!125217))

(assert (= (and b!125217 c!22815) b!125220))

(assert (= (and b!125217 (not c!22815)) b!125219))

(assert (= (or b!125220 b!125219) bm!13402))

(declare-fun m!145313 () Bool)

(assert (=> b!125217 m!145313))

(assert (=> b!125217 m!145313))

(declare-fun m!145315 () Bool)

(assert (=> b!125217 m!145315))

(declare-fun m!145317 () Bool)

(assert (=> bm!13402 m!145317))

(assert (=> bm!13388 d!37581))

(assert (=> b!124791 d!37579))

(declare-fun d!37583 () Bool)

(declare-fun e!81813 () Bool)

(assert (=> d!37583 e!81813))

(declare-fun res!60622 () Bool)

(assert (=> d!37583 (=> res!60622 e!81813)))

(declare-fun lt!64450 () Bool)

(assert (=> d!37583 (= res!60622 (not lt!64450))))

(declare-fun lt!64453 () Bool)

(assert (=> d!37583 (= lt!64450 lt!64453)))

(declare-fun lt!64452 () Unit!3865)

(declare-fun e!81814 () Unit!3865)

(assert (=> d!37583 (= lt!64452 e!81814)))

(declare-fun c!22817 () Bool)

(assert (=> d!37583 (= c!22817 lt!64453)))

(assert (=> d!37583 (= lt!64453 (containsKey!168 (toList!837 lt!64131) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37583 (= (contains!863 lt!64131 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64450)))

(declare-fun b!125221 () Bool)

(declare-fun lt!64451 () Unit!3865)

(assert (=> b!125221 (= e!81814 lt!64451)))

(assert (=> b!125221 (= lt!64451 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64131) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125221 (isDefined!118 (getValueByKey!164 (toList!837 lt!64131) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125222 () Bool)

(declare-fun Unit!3889 () Unit!3865)

(assert (=> b!125222 (= e!81814 Unit!3889)))

(declare-fun b!125223 () Bool)

(assert (=> b!125223 (= e!81813 (isDefined!118 (getValueByKey!164 (toList!837 lt!64131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37583 c!22817) b!125221))

(assert (= (and d!37583 (not c!22817)) b!125222))

(assert (= (and d!37583 (not res!60622)) b!125223))

(declare-fun m!145319 () Bool)

(assert (=> d!37583 m!145319))

(declare-fun m!145321 () Bool)

(assert (=> b!125221 m!145321))

(declare-fun m!145323 () Bool)

(assert (=> b!125221 m!145323))

(assert (=> b!125221 m!145323))

(declare-fun m!145325 () Bool)

(assert (=> b!125221 m!145325))

(assert (=> b!125223 m!145323))

(assert (=> b!125223 m!145323))

(assert (=> b!125223 m!145325))

(assert (=> bm!13347 d!37583))

(declare-fun d!37585 () Bool)

(declare-fun res!60623 () Bool)

(declare-fun e!81815 () Bool)

(assert (=> d!37585 (=> (not res!60623) (not e!81815))))

(assert (=> d!37585 (= res!60623 (simpleValid!86 (_2!1279 lt!64322)))))

(assert (=> d!37585 (= (valid!506 (_2!1279 lt!64322)) e!81815)))

(declare-fun b!125224 () Bool)

(declare-fun res!60624 () Bool)

(assert (=> b!125224 (=> (not res!60624) (not e!81815))))

(assert (=> b!125224 (= res!60624 (= (arrayCountValidKeys!0 (_keys!4491 (_2!1279 lt!64322)) #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64322)))) (_size!576 (_2!1279 lt!64322))))))

(declare-fun b!125225 () Bool)

(declare-fun res!60625 () Bool)

(assert (=> b!125225 (=> (not res!60625) (not e!81815))))

(assert (=> b!125225 (= res!60625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4491 (_2!1279 lt!64322)) (mask!7008 (_2!1279 lt!64322))))))

(declare-fun b!125226 () Bool)

(assert (=> b!125226 (= e!81815 (arrayNoDuplicates!0 (_keys!4491 (_2!1279 lt!64322)) #b00000000000000000000000000000000 Nil!1688))))

(assert (= (and d!37585 res!60623) b!125224))

(assert (= (and b!125224 res!60624) b!125225))

(assert (= (and b!125225 res!60625) b!125226))

(declare-fun m!145327 () Bool)

(assert (=> d!37585 m!145327))

(declare-fun m!145329 () Bool)

(assert (=> b!125224 m!145329))

(declare-fun m!145331 () Bool)

(assert (=> b!125225 m!145331))

(declare-fun m!145333 () Bool)

(assert (=> b!125226 m!145333))

(assert (=> b!125032 d!37585))

(declare-fun b!125229 () Bool)

(declare-fun e!81817 () Option!170)

(assert (=> b!125229 (= e!81817 (getValueByKey!164 (t!6007 (toList!837 lt!64381)) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun c!22818 () Bool)

(declare-fun d!37587 () Bool)

(assert (=> d!37587 (= c!22818 (and ((_ is Cons!1685) (toList!837 lt!64381)) (= (_1!1278 (h!2286 (toList!837 lt!64381))) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!81816 () Option!170)

(assert (=> d!37587 (= (getValueByKey!164 (toList!837 lt!64381) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!81816)))

(declare-fun b!125230 () Bool)

(assert (=> b!125230 (= e!81817 None!168)))

(declare-fun b!125228 () Bool)

(assert (=> b!125228 (= e!81816 e!81817)))

(declare-fun c!22819 () Bool)

(assert (=> b!125228 (= c!22819 (and ((_ is Cons!1685) (toList!837 lt!64381)) (not (= (_1!1278 (h!2286 (toList!837 lt!64381))) (_1!1278 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125227 () Bool)

(assert (=> b!125227 (= e!81816 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64381)))))))

(assert (= (and d!37587 c!22818) b!125227))

(assert (= (and d!37587 (not c!22818)) b!125228))

(assert (= (and b!125228 c!22819) b!125229))

(assert (= (and b!125228 (not c!22819)) b!125230))

(declare-fun m!145335 () Bool)

(assert (=> b!125229 m!145335))

(assert (=> b!125095 d!37587))

(declare-fun d!37589 () Bool)

(declare-fun lt!64456 () Bool)

(declare-fun content!124 (List!1691) (InoxSet (_ BitVec 64)))

(assert (=> d!37589 (= lt!64456 (select (content!124 Nil!1688) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!81823 () Bool)

(assert (=> d!37589 (= lt!64456 e!81823)))

(declare-fun res!60630 () Bool)

(assert (=> d!37589 (=> (not res!60630) (not e!81823))))

(assert (=> d!37589 (= res!60630 ((_ is Cons!1687) Nil!1688))))

(assert (=> d!37589 (= (contains!866 Nil!1688 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) lt!64456)))

(declare-fun b!125235 () Bool)

(declare-fun e!81822 () Bool)

(assert (=> b!125235 (= e!81823 e!81822)))

(declare-fun res!60631 () Bool)

(assert (=> b!125235 (=> res!60631 e!81822)))

(assert (=> b!125235 (= res!60631 (= (h!2288 Nil!1688) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125236 () Bool)

(assert (=> b!125236 (= e!81822 (contains!866 (t!6017 Nil!1688) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37589 res!60630) b!125235))

(assert (= (and b!125235 (not res!60631)) b!125236))

(declare-fun m!145337 () Bool)

(assert (=> d!37589 m!145337))

(assert (=> d!37589 m!144651))

(declare-fun m!145339 () Bool)

(assert (=> d!37589 m!145339))

(assert (=> b!125236 m!144651))

(declare-fun m!145341 () Bool)

(assert (=> b!125236 m!145341))

(assert (=> b!125061 d!37589))

(declare-fun d!37591 () Bool)

(declare-fun e!81824 () Bool)

(assert (=> d!37591 e!81824))

(declare-fun res!60632 () Bool)

(assert (=> d!37591 (=> res!60632 e!81824)))

(declare-fun lt!64457 () Bool)

(assert (=> d!37591 (= res!60632 (not lt!64457))))

(declare-fun lt!64460 () Bool)

(assert (=> d!37591 (= lt!64457 lt!64460)))

(declare-fun lt!64459 () Unit!3865)

(declare-fun e!81825 () Unit!3865)

(assert (=> d!37591 (= lt!64459 e!81825)))

(declare-fun c!22820 () Bool)

(assert (=> d!37591 (= c!22820 lt!64460)))

(assert (=> d!37591 (= lt!64460 (containsKey!168 (toList!837 lt!64370) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37591 (= (contains!863 lt!64370 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64457)))

(declare-fun b!125237 () Bool)

(declare-fun lt!64458 () Unit!3865)

(assert (=> b!125237 (= e!81825 lt!64458)))

(assert (=> b!125237 (= lt!64458 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64370) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> b!125237 (isDefined!118 (getValueByKey!164 (toList!837 lt!64370) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125238 () Bool)

(declare-fun Unit!3890 () Unit!3865)

(assert (=> b!125238 (= e!81825 Unit!3890)))

(declare-fun b!125239 () Bool)

(assert (=> b!125239 (= e!81824 (isDefined!118 (getValueByKey!164 (toList!837 lt!64370) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!37591 c!22820) b!125237))

(assert (= (and d!37591 (not c!22820)) b!125238))

(assert (= (and d!37591 (not res!60632)) b!125239))

(declare-fun m!145343 () Bool)

(assert (=> d!37591 m!145343))

(declare-fun m!145345 () Bool)

(assert (=> b!125237 m!145345))

(assert (=> b!125237 m!145089))

(assert (=> b!125237 m!145089))

(declare-fun m!145347 () Bool)

(assert (=> b!125237 m!145347))

(assert (=> b!125239 m!145089))

(assert (=> b!125239 m!145089))

(assert (=> b!125239 m!145347))

(assert (=> d!37491 d!37591))

(declare-fun e!81827 () Option!170)

(declare-fun b!125242 () Bool)

(assert (=> b!125242 (= e!81827 (getValueByKey!164 (t!6007 lt!64368) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun c!22821 () Bool)

(declare-fun d!37593 () Bool)

(assert (=> d!37593 (= c!22821 (and ((_ is Cons!1685) lt!64368) (= (_1!1278 (h!2286 lt!64368)) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!81826 () Option!170)

(assert (=> d!37593 (= (getValueByKey!164 lt!64368 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!81826)))

(declare-fun b!125243 () Bool)

(assert (=> b!125243 (= e!81827 None!168)))

(declare-fun b!125241 () Bool)

(assert (=> b!125241 (= e!81826 e!81827)))

(declare-fun c!22822 () Bool)

(assert (=> b!125241 (= c!22822 (and ((_ is Cons!1685) lt!64368) (not (= (_1!1278 (h!2286 lt!64368)) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125240 () Bool)

(assert (=> b!125240 (= e!81826 (Some!169 (_2!1278 (h!2286 lt!64368))))))

(assert (= (and d!37593 c!22821) b!125240))

(assert (= (and d!37593 (not c!22821)) b!125241))

(assert (= (and b!125241 c!22822) b!125242))

(assert (= (and b!125241 (not c!22822)) b!125243))

(declare-fun m!145349 () Bool)

(assert (=> b!125242 m!145349))

(assert (=> d!37491 d!37593))

(declare-fun d!37595 () Bool)

(assert (=> d!37595 (= (getValueByKey!164 lt!64368 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64461 () Unit!3865)

(assert (=> d!37595 (= lt!64461 (choose!764 lt!64368 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun e!81828 () Bool)

(assert (=> d!37595 e!81828))

(declare-fun res!60633 () Bool)

(assert (=> d!37595 (=> (not res!60633) (not e!81828))))

(assert (=> d!37595 (= res!60633 (isStrictlySorted!311 lt!64368))))

(assert (=> d!37595 (= (lemmaContainsTupThenGetReturnValue!82 lt!64368 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64461)))

(declare-fun b!125244 () Bool)

(declare-fun res!60634 () Bool)

(assert (=> b!125244 (=> (not res!60634) (not e!81828))))

(assert (=> b!125244 (= res!60634 (containsKey!168 lt!64368 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125245 () Bool)

(assert (=> b!125245 (= e!81828 (contains!865 lt!64368 (tuple2!2535 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!37595 res!60633) b!125244))

(assert (= (and b!125244 res!60634) b!125245))

(assert (=> d!37595 m!145083))

(declare-fun m!145351 () Bool)

(assert (=> d!37595 m!145351))

(declare-fun m!145353 () Bool)

(assert (=> d!37595 m!145353))

(declare-fun m!145355 () Bool)

(assert (=> b!125244 m!145355))

(declare-fun m!145357 () Bool)

(assert (=> b!125245 m!145357))

(assert (=> d!37491 d!37595))

(declare-fun b!125246 () Bool)

(declare-fun e!81831 () List!1689)

(declare-fun call!13408 () List!1689)

(assert (=> b!125246 (= e!81831 call!13408)))

(declare-fun bm!13403 () Bool)

(declare-fun call!13406 () List!1689)

(declare-fun call!13407 () List!1689)

(assert (=> bm!13403 (= call!13406 call!13407)))

(declare-fun b!125247 () Bool)

(declare-fun e!81833 () List!1689)

(assert (=> b!125247 (= e!81833 call!13407)))

(declare-fun d!37597 () Bool)

(declare-fun e!81832 () Bool)

(assert (=> d!37597 e!81832))

(declare-fun res!60636 () Bool)

(assert (=> d!37597 (=> (not res!60636) (not e!81832))))

(declare-fun lt!64462 () List!1689)

(assert (=> d!37597 (= res!60636 (isStrictlySorted!311 lt!64462))))

(assert (=> d!37597 (= lt!64462 e!81833)))

(declare-fun c!22824 () Bool)

(assert (=> d!37597 (= c!22824 (and ((_ is Cons!1685) (toList!837 lt!64106)) (bvslt (_1!1278 (h!2286 (toList!837 lt!64106))) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37597 (isStrictlySorted!311 (toList!837 lt!64106))))

(assert (=> d!37597 (= (insertStrictlySorted!85 (toList!837 lt!64106) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64462)))

(declare-fun b!125248 () Bool)

(assert (=> b!125248 (= e!81831 call!13408)))

(declare-fun bm!13404 () Bool)

(declare-fun e!81830 () List!1689)

(assert (=> bm!13404 (= call!13407 ($colon$colon!87 e!81830 (ite c!22824 (h!2286 (toList!837 lt!64106)) (tuple2!2535 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun c!22823 () Bool)

(assert (=> bm!13404 (= c!22823 c!22824)))

(declare-fun b!125249 () Bool)

(declare-fun e!81829 () List!1689)

(assert (=> b!125249 (= e!81833 e!81829)))

(declare-fun c!22825 () Bool)

(assert (=> b!125249 (= c!22825 (and ((_ is Cons!1685) (toList!837 lt!64106)) (= (_1!1278 (h!2286 (toList!837 lt!64106))) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun c!22826 () Bool)

(declare-fun b!125250 () Bool)

(assert (=> b!125250 (= c!22826 (and ((_ is Cons!1685) (toList!837 lt!64106)) (bvsgt (_1!1278 (h!2286 (toList!837 lt!64106))) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> b!125250 (= e!81829 e!81831)))

(declare-fun b!125251 () Bool)

(assert (=> b!125251 (= e!81832 (contains!865 lt!64462 (tuple2!2535 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125252 () Bool)

(assert (=> b!125252 (= e!81830 (insertStrictlySorted!85 (t!6007 (toList!837 lt!64106)) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125253 () Bool)

(assert (=> b!125253 (= e!81829 call!13406)))

(declare-fun bm!13405 () Bool)

(assert (=> bm!13405 (= call!13408 call!13406)))

(declare-fun b!125254 () Bool)

(declare-fun res!60635 () Bool)

(assert (=> b!125254 (=> (not res!60635) (not e!81832))))

(assert (=> b!125254 (= res!60635 (containsKey!168 lt!64462 (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125255 () Bool)

(assert (=> b!125255 (= e!81830 (ite c!22825 (t!6007 (toList!837 lt!64106)) (ite c!22826 (Cons!1685 (h!2286 (toList!837 lt!64106)) (t!6007 (toList!837 lt!64106))) Nil!1686)))))

(assert (= (and d!37597 c!22824) b!125247))

(assert (= (and d!37597 (not c!22824)) b!125249))

(assert (= (and b!125249 c!22825) b!125253))

(assert (= (and b!125249 (not c!22825)) b!125250))

(assert (= (and b!125250 c!22826) b!125248))

(assert (= (and b!125250 (not c!22826)) b!125246))

(assert (= (or b!125248 b!125246) bm!13405))

(assert (= (or b!125253 bm!13405) bm!13403))

(assert (= (or b!125247 bm!13403) bm!13404))

(assert (= (and bm!13404 c!22823) b!125252))

(assert (= (and bm!13404 (not c!22823)) b!125255))

(assert (= (and d!37597 res!60636) b!125254))

(assert (= (and b!125254 res!60635) b!125251))

(declare-fun m!145359 () Bool)

(assert (=> d!37597 m!145359))

(declare-fun m!145361 () Bool)

(assert (=> d!37597 m!145361))

(declare-fun m!145363 () Bool)

(assert (=> b!125254 m!145363))

(declare-fun m!145365 () Bool)

(assert (=> b!125252 m!145365))

(declare-fun m!145367 () Bool)

(assert (=> b!125251 m!145367))

(declare-fun m!145369 () Bool)

(assert (=> bm!13404 m!145369))

(assert (=> d!37491 d!37597))

(declare-fun d!37599 () Bool)

(declare-fun res!60637 () Bool)

(declare-fun e!81834 () Bool)

(assert (=> d!37599 (=> res!60637 e!81834)))

(assert (=> d!37599 (= res!60637 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64087)))))

(assert (=> d!37599 (= (containsKey!168 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64087) e!81834)))

(declare-fun b!125256 () Bool)

(declare-fun e!81835 () Bool)

(assert (=> b!125256 (= e!81834 e!81835)))

(declare-fun res!60638 () Bool)

(assert (=> b!125256 (=> (not res!60638) (not e!81835))))

(assert (=> b!125256 (= res!60638 (and (or (not ((_ is Cons!1685) (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))) (bvsle (_1!1278 (h!2286 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64087)) ((_ is Cons!1685) (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) (bvslt (_1!1278 (h!2286 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64087)))))

(declare-fun b!125257 () Bool)

(assert (=> b!125257 (= e!81835 (containsKey!168 (t!6007 (toList!837 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) lt!64087))))

(assert (= (and d!37599 (not res!60637)) b!125256))

(assert (= (and b!125256 res!60638) b!125257))

(declare-fun m!145371 () Bool)

(assert (=> b!125257 m!145371))

(assert (=> d!37489 d!37599))

(declare-fun b!125258 () Bool)

(declare-fun e!81836 () Bool)

(declare-fun call!13409 () Bool)

(assert (=> b!125258 (= e!81836 call!13409)))

(declare-fun b!125259 () Bool)

(declare-fun e!81838 () Bool)

(assert (=> b!125259 (= e!81838 call!13409)))

(declare-fun d!37601 () Bool)

(declare-fun res!60640 () Bool)

(declare-fun e!81837 () Bool)

(assert (=> d!37601 (=> res!60640 e!81837)))

(assert (=> d!37601 (= res!60640 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(assert (=> d!37601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4491 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023))) e!81837)))

(declare-fun b!125260 () Bool)

(assert (=> b!125260 (= e!81837 e!81836)))

(declare-fun c!22827 () Bool)

(assert (=> b!125260 (= c!22827 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(declare-fun b!125261 () Bool)

(assert (=> b!125261 (= e!81836 e!81838)))

(declare-fun lt!64465 () (_ BitVec 64))

(assert (=> b!125261 (= lt!64465 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000))))

(declare-fun lt!64464 () Unit!3865)

(assert (=> b!125261 (= lt!64464 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4491 (_2!1279 lt!64023)) lt!64465 #b00000000000000000000000000000000))))

(assert (=> b!125261 (arrayContainsKey!0 (_keys!4491 (_2!1279 lt!64023)) lt!64465 #b00000000000000000000000000000000)))

(declare-fun lt!64463 () Unit!3865)

(assert (=> b!125261 (= lt!64463 lt!64464)))

(declare-fun res!60639 () Bool)

(assert (=> b!125261 (= res!60639 (= (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000) (_keys!4491 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023))) (Found!272 #b00000000000000000000000000000000)))))

(assert (=> b!125261 (=> (not res!60639) (not e!81838))))

(declare-fun bm!13406 () Bool)

(assert (=> bm!13406 (= call!13409 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4491 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023))))))

(assert (= (and d!37601 (not res!60640)) b!125260))

(assert (= (and b!125260 c!22827) b!125261))

(assert (= (and b!125260 (not c!22827)) b!125258))

(assert (= (and b!125261 res!60639) b!125259))

(assert (= (or b!125259 b!125258) bm!13406))

(assert (=> b!125260 m!145187))

(assert (=> b!125260 m!145187))

(assert (=> b!125260 m!145189))

(assert (=> b!125261 m!145187))

(declare-fun m!145373 () Bool)

(assert (=> b!125261 m!145373))

(declare-fun m!145375 () Bool)

(assert (=> b!125261 m!145375))

(assert (=> b!125261 m!145187))

(declare-fun m!145377 () Bool)

(assert (=> b!125261 m!145377))

(declare-fun m!145379 () Bool)

(assert (=> bm!13406 m!145379))

(assert (=> b!124811 d!37601))

(assert (=> d!37493 d!37489))

(assert (=> d!37493 d!37501))

(declare-fun d!37603 () Bool)

(assert (=> d!37603 (contains!863 (+!157 lt!64100 (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64087)))

(assert (=> d!37603 true))

(declare-fun _$35!369 () Unit!3865)

(assert (=> d!37603 (= (choose!762 lt!64100 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64087) _$35!369)))

(declare-fun bs!5170 () Bool)

(assert (= bs!5170 d!37603))

(assert (=> bs!5170 m!144615))

(assert (=> bs!5170 m!144615))

(assert (=> bs!5170 m!144631))

(assert (=> d!37493 d!37603))

(declare-fun d!37605 () Bool)

(declare-fun e!81839 () Bool)

(assert (=> d!37605 e!81839))

(declare-fun res!60641 () Bool)

(assert (=> d!37605 (=> res!60641 e!81839)))

(declare-fun lt!64466 () Bool)

(assert (=> d!37605 (= res!60641 (not lt!64466))))

(declare-fun lt!64469 () Bool)

(assert (=> d!37605 (= lt!64466 lt!64469)))

(declare-fun lt!64468 () Unit!3865)

(declare-fun e!81840 () Unit!3865)

(assert (=> d!37605 (= lt!64468 e!81840)))

(declare-fun c!22828 () Bool)

(assert (=> d!37605 (= c!22828 lt!64469)))

(assert (=> d!37605 (= lt!64469 (containsKey!168 (toList!837 lt!64100) lt!64087))))

(assert (=> d!37605 (= (contains!863 lt!64100 lt!64087) lt!64466)))

(declare-fun b!125263 () Bool)

(declare-fun lt!64467 () Unit!3865)

(assert (=> b!125263 (= e!81840 lt!64467)))

(assert (=> b!125263 (= lt!64467 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64100) lt!64087))))

(assert (=> b!125263 (isDefined!118 (getValueByKey!164 (toList!837 lt!64100) lt!64087))))

(declare-fun b!125264 () Bool)

(declare-fun Unit!3891 () Unit!3865)

(assert (=> b!125264 (= e!81840 Unit!3891)))

(declare-fun b!125265 () Bool)

(assert (=> b!125265 (= e!81839 (isDefined!118 (getValueByKey!164 (toList!837 lt!64100) lt!64087)))))

(assert (= (and d!37605 c!22828) b!125263))

(assert (= (and d!37605 (not c!22828)) b!125264))

(assert (= (and d!37605 (not res!60641)) b!125265))

(declare-fun m!145381 () Bool)

(assert (=> d!37605 m!145381))

(declare-fun m!145383 () Bool)

(assert (=> b!125263 m!145383))

(declare-fun m!145385 () Bool)

(assert (=> b!125263 m!145385))

(assert (=> b!125263 m!145385))

(declare-fun m!145387 () Bool)

(assert (=> b!125263 m!145387))

(assert (=> b!125265 m!145385))

(assert (=> b!125265 m!145385))

(assert (=> b!125265 m!145387))

(assert (=> d!37493 d!37605))

(declare-fun d!37607 () Bool)

(assert (=> d!37607 (= (get!1439 (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3107 (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37513 d!37607))

(declare-fun b!125268 () Bool)

(declare-fun e!81842 () Option!170)

(assert (=> b!125268 (= e!81842 (getValueByKey!164 (t!6007 (toList!837 lt!64097)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!37609 () Bool)

(declare-fun c!22829 () Bool)

(assert (=> d!37609 (= c!22829 (and ((_ is Cons!1685) (toList!837 lt!64097)) (= (_1!1278 (h!2286 (toList!837 lt!64097))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81841 () Option!170)

(assert (=> d!37609 (= (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000) e!81841)))

(declare-fun b!125269 () Bool)

(assert (=> b!125269 (= e!81842 None!168)))

(declare-fun b!125267 () Bool)

(assert (=> b!125267 (= e!81841 e!81842)))

(declare-fun c!22830 () Bool)

(assert (=> b!125267 (= c!22830 (and ((_ is Cons!1685) (toList!837 lt!64097)) (not (= (_1!1278 (h!2286 (toList!837 lt!64097))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125266 () Bool)

(assert (=> b!125266 (= e!81841 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64097)))))))

(assert (= (and d!37609 c!22829) b!125266))

(assert (= (and d!37609 (not c!22829)) b!125267))

(assert (= (and b!125267 c!22830) b!125268))

(assert (= (and b!125267 (not c!22830)) b!125269))

(declare-fun m!145389 () Bool)

(assert (=> b!125268 m!145389))

(assert (=> d!37513 d!37609))

(declare-fun e!81844 () Option!170)

(declare-fun b!125272 () Bool)

(assert (=> b!125272 (= e!81844 (getValueByKey!164 (t!6007 (toList!837 lt!64118)) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!37611 () Bool)

(declare-fun c!22831 () Bool)

(assert (=> d!37611 (= c!22831 (and ((_ is Cons!1685) (toList!837 lt!64118)) (= (_1!1278 (h!2286 (toList!837 lt!64118))) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!81843 () Option!170)

(assert (=> d!37611 (= (getValueByKey!164 (toList!837 lt!64118) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!81843)))

(declare-fun b!125273 () Bool)

(assert (=> b!125273 (= e!81844 None!168)))

(declare-fun b!125271 () Bool)

(assert (=> b!125271 (= e!81843 e!81844)))

(declare-fun c!22832 () Bool)

(assert (=> b!125271 (= c!22832 (and ((_ is Cons!1685) (toList!837 lt!64118)) (not (= (_1!1278 (h!2286 (toList!837 lt!64118))) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!125270 () Bool)

(assert (=> b!125270 (= e!81843 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64118)))))))

(assert (= (and d!37611 c!22831) b!125270))

(assert (= (and d!37611 (not c!22831)) b!125271))

(assert (= (and b!125271 c!22832) b!125272))

(assert (= (and b!125271 (not c!22832)) b!125273))

(declare-fun m!145391 () Bool)

(assert (=> b!125272 m!145391))

(assert (=> b!124787 d!37611))

(declare-fun d!37613 () Bool)

(declare-fun res!60642 () Bool)

(declare-fun e!81845 () Bool)

(assert (=> d!37613 (=> res!60642 e!81845)))

(assert (=> d!37613 (= res!60642 (and ((_ is Cons!1685) (t!6007 (toList!837 lt!63929))) (= (_1!1278 (h!2286 (t!6007 (toList!837 lt!63929)))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (=> d!37613 (= (containsKey!168 (t!6007 (toList!837 lt!63929)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) e!81845)))

(declare-fun b!125274 () Bool)

(declare-fun e!81846 () Bool)

(assert (=> b!125274 (= e!81845 e!81846)))

(declare-fun res!60643 () Bool)

(assert (=> b!125274 (=> (not res!60643) (not e!81846))))

(assert (=> b!125274 (= res!60643 (and (or (not ((_ is Cons!1685) (t!6007 (toList!837 lt!63929)))) (bvsle (_1!1278 (h!2286 (t!6007 (toList!837 lt!63929)))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))) ((_ is Cons!1685) (t!6007 (toList!837 lt!63929))) (bvslt (_1!1278 (h!2286 (t!6007 (toList!837 lt!63929)))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(declare-fun b!125275 () Bool)

(assert (=> b!125275 (= e!81846 (containsKey!168 (t!6007 (t!6007 (toList!837 lt!63929))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37613 (not res!60642)) b!125274))

(assert (= (and b!125274 res!60643) b!125275))

(assert (=> b!125275 m!144407))

(declare-fun m!145393 () Bool)

(assert (=> b!125275 m!145393))

(assert (=> b!125046 d!37613))

(assert (=> b!125038 d!37473))

(declare-fun d!37615 () Bool)

(assert (=> d!37615 (= (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!397 (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5171 () Bool)

(assert (= bs!5171 d!37615))

(assert (=> bs!5171 m!144833))

(declare-fun m!145395 () Bool)

(assert (=> bs!5171 m!145395))

(assert (=> b!124900 d!37615))

(assert (=> b!124900 d!37609))

(assert (=> d!37473 d!37425))

(declare-fun d!37617 () Bool)

(declare-fun e!81849 () Bool)

(assert (=> d!37617 e!81849))

(declare-fun res!60648 () Bool)

(assert (=> d!37617 (=> (not res!60648) (not e!81849))))

(declare-fun lt!64472 () SeekEntryResult!272)

(assert (=> d!37617 (= res!60648 ((_ is Found!272) lt!64472))))

(assert (=> d!37617 (= lt!64472 (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(assert (=> d!37617 true))

(declare-fun _$33!102 () Unit!3865)

(assert (=> d!37617 (= (choose!760 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)) _$33!102)))

(declare-fun b!125280 () Bool)

(declare-fun res!60649 () Bool)

(assert (=> b!125280 (=> (not res!60649) (not e!81849))))

(assert (=> b!125280 (= res!60649 (inRange!0 (index!3243 lt!64472) (mask!7008 newMap!16)))))

(declare-fun b!125281 () Bool)

(assert (=> b!125281 (= e!81849 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64472)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37617 res!60648) b!125280))

(assert (= (and b!125280 res!60649) b!125281))

(assert (=> d!37617 m!144407))

(assert (=> d!37617 m!144509))

(declare-fun m!145397 () Bool)

(assert (=> b!125280 m!145397))

(declare-fun m!145399 () Bool)

(assert (=> b!125281 m!145399))

(assert (=> d!37473 d!37617))

(assert (=> d!37473 d!37533))

(declare-fun d!37619 () Bool)

(declare-fun e!81850 () Bool)

(assert (=> d!37619 e!81850))

(declare-fun res!60651 () Bool)

(assert (=> d!37619 (=> (not res!60651) (not e!81850))))

(declare-fun lt!64476 () ListLongMap!1643)

(assert (=> d!37619 (= res!60651 (contains!863 lt!64476 (_1!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(declare-fun lt!64474 () List!1689)

(assert (=> d!37619 (= lt!64476 (ListLongMap!1644 lt!64474))))

(declare-fun lt!64475 () Unit!3865)

(declare-fun lt!64473 () Unit!3865)

(assert (=> d!37619 (= lt!64475 lt!64473)))

(assert (=> d!37619 (= (getValueByKey!164 lt!64474 (_1!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37619 (= lt!64473 (lemmaContainsTupThenGetReturnValue!82 lt!64474 (_1!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37619 (= lt!64474 (insertStrictlySorted!85 (toList!837 lt!64214) (_1!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37619 (= (+!157 lt!64214 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64476)))

(declare-fun b!125282 () Bool)

(declare-fun res!60650 () Bool)

(assert (=> b!125282 (=> (not res!60650) (not e!81850))))

(assert (=> b!125282 (= res!60650 (= (getValueByKey!164 (toList!837 lt!64476) (_1!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))))))))

(declare-fun b!125283 () Bool)

(assert (=> b!125283 (= e!81850 (contains!865 (toList!837 lt!64476) (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))))))

(assert (= (and d!37619 res!60651) b!125282))

(assert (= (and b!125282 res!60650) b!125283))

(declare-fun m!145401 () Bool)

(assert (=> d!37619 m!145401))

(declare-fun m!145403 () Bool)

(assert (=> d!37619 m!145403))

(declare-fun m!145405 () Bool)

(assert (=> d!37619 m!145405))

(declare-fun m!145407 () Bool)

(assert (=> d!37619 m!145407))

(declare-fun m!145409 () Bool)

(assert (=> b!125282 m!145409))

(declare-fun m!145411 () Bool)

(assert (=> b!125283 m!145411))

(assert (=> b!124933 d!37619))

(declare-fun d!37621 () Bool)

(assert (=> d!37621 (= (apply!110 (+!157 lt!64220 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64218) (apply!110 lt!64220 lt!64218))))

(declare-fun lt!64477 () Unit!3865)

(assert (=> d!37621 (= lt!64477 (choose!761 lt!64220 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64218))))

(declare-fun e!81851 () Bool)

(assert (=> d!37621 e!81851))

(declare-fun res!60652 () Bool)

(assert (=> d!37621 (=> (not res!60652) (not e!81851))))

(assert (=> d!37621 (= res!60652 (contains!863 lt!64220 lt!64218))))

(assert (=> d!37621 (= (addApplyDifferent!86 lt!64220 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64218) lt!64477)))

(declare-fun b!125284 () Bool)

(assert (=> b!125284 (= e!81851 (not (= lt!64218 lt!64203)))))

(assert (= (and d!37621 res!60652) b!125284))

(declare-fun m!145413 () Bool)

(assert (=> d!37621 m!145413))

(assert (=> d!37621 m!144903))

(assert (=> d!37621 m!144905))

(declare-fun m!145415 () Bool)

(assert (=> d!37621 m!145415))

(assert (=> d!37621 m!144903))

(assert (=> d!37621 m!144889))

(assert (=> b!124933 d!37621))

(declare-fun d!37623 () Bool)

(assert (=> d!37623 (= (apply!110 lt!64220 lt!64218) (get!1439 (getValueByKey!164 (toList!837 lt!64220) lt!64218)))))

(declare-fun bs!5172 () Bool)

(assert (= bs!5172 d!37623))

(declare-fun m!145417 () Bool)

(assert (=> bs!5172 m!145417))

(assert (=> bs!5172 m!145417))

(declare-fun m!145419 () Bool)

(assert (=> bs!5172 m!145419))

(assert (=> b!124933 d!37623))

(declare-fun d!37625 () Bool)

(declare-fun e!81852 () Bool)

(assert (=> d!37625 e!81852))

(declare-fun res!60654 () Bool)

(assert (=> d!37625 (=> (not res!60654) (not e!81852))))

(declare-fun lt!64481 () ListLongMap!1643)

(assert (=> d!37625 (= res!60654 (contains!863 lt!64481 (_1!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(declare-fun lt!64479 () List!1689)

(assert (=> d!37625 (= lt!64481 (ListLongMap!1644 lt!64479))))

(declare-fun lt!64480 () Unit!3865)

(declare-fun lt!64478 () Unit!3865)

(assert (=> d!37625 (= lt!64480 lt!64478)))

(assert (=> d!37625 (= (getValueByKey!164 lt!64479 (_1!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37625 (= lt!64478 (lemmaContainsTupThenGetReturnValue!82 lt!64479 (_1!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37625 (= lt!64479 (insertStrictlySorted!85 (toList!837 lt!64220) (_1!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))))))

(assert (=> d!37625 (= (+!157 lt!64220 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64481)))

(declare-fun b!125285 () Bool)

(declare-fun res!60653 () Bool)

(assert (=> b!125285 (=> (not res!60653) (not e!81852))))

(assert (=> b!125285 (= res!60653 (= (getValueByKey!164 (toList!837 lt!64481) (_1!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))))))))

(declare-fun b!125286 () Bool)

(assert (=> b!125286 (= e!81852 (contains!865 (toList!837 lt!64481) (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))))))

(assert (= (and d!37625 res!60654) b!125285))

(assert (= (and b!125285 res!60653) b!125286))

(declare-fun m!145421 () Bool)

(assert (=> d!37625 m!145421))

(declare-fun m!145423 () Bool)

(assert (=> d!37625 m!145423))

(declare-fun m!145425 () Bool)

(assert (=> d!37625 m!145425))

(declare-fun m!145427 () Bool)

(assert (=> d!37625 m!145427))

(declare-fun m!145429 () Bool)

(assert (=> b!125285 m!145429))

(declare-fun m!145431 () Bool)

(assert (=> b!125286 m!145431))

(assert (=> b!124933 d!37625))

(declare-fun d!37627 () Bool)

(declare-fun e!81853 () Bool)

(assert (=> d!37627 e!81853))

(declare-fun res!60656 () Bool)

(assert (=> d!37627 (=> (not res!60656) (not e!81853))))

(declare-fun lt!64485 () ListLongMap!1643)

(assert (=> d!37627 (= res!60656 (contains!863 lt!64485 (_1!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(declare-fun lt!64483 () List!1689)

(assert (=> d!37627 (= lt!64485 (ListLongMap!1644 lt!64483))))

(declare-fun lt!64484 () Unit!3865)

(declare-fun lt!64482 () Unit!3865)

(assert (=> d!37627 (= lt!64484 lt!64482)))

(assert (=> d!37627 (= (getValueByKey!164 lt!64483 (_1!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37627 (= lt!64482 (lemmaContainsTupThenGetReturnValue!82 lt!64483 (_1!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37627 (= lt!64483 (insertStrictlySorted!85 (toList!837 lt!64205) (_1!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37627 (= (+!157 lt!64205 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64485)))

(declare-fun b!125287 () Bool)

(declare-fun res!60655 () Bool)

(assert (=> b!125287 (=> (not res!60655) (not e!81853))))

(assert (=> b!125287 (= res!60655 (= (getValueByKey!164 (toList!837 lt!64485) (_1!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(declare-fun b!125288 () Bool)

(assert (=> b!125288 (= e!81853 (contains!865 (toList!837 lt!64485) (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))

(assert (= (and d!37627 res!60656) b!125287))

(assert (= (and b!125287 res!60655) b!125288))

(declare-fun m!145433 () Bool)

(assert (=> d!37627 m!145433))

(declare-fun m!145435 () Bool)

(assert (=> d!37627 m!145435))

(declare-fun m!145437 () Bool)

(assert (=> d!37627 m!145437))

(declare-fun m!145439 () Bool)

(assert (=> d!37627 m!145439))

(declare-fun m!145441 () Bool)

(assert (=> b!125287 m!145441))

(declare-fun m!145443 () Bool)

(assert (=> b!125288 m!145443))

(assert (=> b!124933 d!37627))

(declare-fun d!37629 () Bool)

(assert (=> d!37629 (= (apply!110 (+!157 lt!64205 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64206) (apply!110 lt!64205 lt!64206))))

(declare-fun lt!64486 () Unit!3865)

(assert (=> d!37629 (= lt!64486 (choose!761 lt!64205 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64206))))

(declare-fun e!81854 () Bool)

(assert (=> d!37629 e!81854))

(declare-fun res!60657 () Bool)

(assert (=> d!37629 (=> (not res!60657) (not e!81854))))

(assert (=> d!37629 (= res!60657 (contains!863 lt!64205 lt!64206))))

(assert (=> d!37629 (= (addApplyDifferent!86 lt!64205 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64206) lt!64486)))

(declare-fun b!125289 () Bool)

(assert (=> b!125289 (= e!81854 (not (= lt!64206 lt!64215)))))

(assert (= (and d!37629 res!60657) b!125289))

(declare-fun m!145445 () Bool)

(assert (=> d!37629 m!145445))

(assert (=> d!37629 m!144883))

(assert (=> d!37629 m!144885))

(declare-fun m!145447 () Bool)

(assert (=> d!37629 m!145447))

(assert (=> d!37629 m!144883))

(assert (=> d!37629 m!144881))

(assert (=> b!124933 d!37629))

(declare-fun d!37631 () Bool)

(assert (=> d!37631 (= (apply!110 lt!64207 lt!64219) (get!1439 (getValueByKey!164 (toList!837 lt!64207) lt!64219)))))

(declare-fun bs!5173 () Bool)

(assert (= bs!5173 d!37631))

(declare-fun m!145449 () Bool)

(assert (=> bs!5173 m!145449))

(assert (=> bs!5173 m!145449))

(declare-fun m!145451 () Bool)

(assert (=> bs!5173 m!145451))

(assert (=> b!124933 d!37631))

(declare-fun b!125290 () Bool)

(declare-fun e!81858 () Bool)

(assert (=> b!125290 (= e!81858 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125290 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125291 () Bool)

(declare-fun lt!64492 () Unit!3865)

(declare-fun lt!64491 () Unit!3865)

(assert (=> b!125291 (= lt!64492 lt!64491)))

(declare-fun lt!64490 () V!3425)

(declare-fun lt!64493 () (_ BitVec 64))

(declare-fun lt!64487 () ListLongMap!1643)

(declare-fun lt!64489 () (_ BitVec 64))

(assert (=> b!125291 (not (contains!863 (+!157 lt!64487 (tuple2!2535 lt!64493 lt!64490)) lt!64489))))

(assert (=> b!125291 (= lt!64491 (addStillNotContains!56 lt!64487 lt!64493 lt!64490 lt!64489))))

(assert (=> b!125291 (= lt!64489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125291 (= lt!64490 (get!1435 (select (arr!2207 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125291 (= lt!64493 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13410 () ListLongMap!1643)

(assert (=> b!125291 (= lt!64487 call!13410)))

(declare-fun e!81861 () ListLongMap!1643)

(assert (=> b!125291 (= e!81861 (+!157 call!13410 (tuple2!2535 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (get!1435 (select (arr!2207 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!37633 () Bool)

(declare-fun e!81860 () Bool)

(assert (=> d!37633 e!81860))

(declare-fun res!60659 () Bool)

(assert (=> d!37633 (=> (not res!60659) (not e!81860))))

(declare-fun lt!64488 () ListLongMap!1643)

(assert (=> d!37633 (= res!60659 (not (contains!863 lt!64488 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81859 () ListLongMap!1643)

(assert (=> d!37633 (= lt!64488 e!81859)))

(declare-fun c!22834 () Bool)

(assert (=> d!37633 (= c!22834 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37633 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37633 (= (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64488)))

(declare-fun b!125292 () Bool)

(assert (=> b!125292 (= e!81861 call!13410)))

(declare-fun bm!13407 () Bool)

(assert (=> bm!13407 (= call!13410 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16)))))

(declare-fun b!125293 () Bool)

(declare-fun e!81855 () Bool)

(assert (=> b!125293 (= e!81860 e!81855)))

(declare-fun c!22833 () Bool)

(assert (=> b!125293 (= c!22833 e!81858)))

(declare-fun res!60661 () Bool)

(assert (=> b!125293 (=> (not res!60661) (not e!81858))))

(assert (=> b!125293 (= res!60661 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125294 () Bool)

(assert (=> b!125294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> b!125294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))))))))

(declare-fun e!81856 () Bool)

(assert (=> b!125294 (= e!81856 (= (apply!110 lt!64488 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!81857 () Bool)

(declare-fun b!125295 () Bool)

(assert (=> b!125295 (= e!81857 (= lt!64488 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) (mask!7008 newMap!16) (ite c!22681 (ite c!22684 lt!64018 lt!64040) (extraKeys!2548 newMap!16)) (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16))))))

(declare-fun b!125296 () Bool)

(assert (=> b!125296 (= e!81855 e!81856)))

(assert (=> b!125296 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun res!60660 () Bool)

(assert (=> b!125296 (= res!60660 (contains!863 lt!64488 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125296 (=> (not res!60660) (not e!81856))))

(declare-fun b!125297 () Bool)

(declare-fun res!60658 () Bool)

(assert (=> b!125297 (=> (not res!60658) (not e!81860))))

(assert (=> b!125297 (= res!60658 (not (contains!863 lt!64488 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125298 () Bool)

(assert (=> b!125298 (= e!81855 e!81857)))

(declare-fun c!22836 () Bool)

(assert (=> b!125298 (= c!22836 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125299 () Bool)

(assert (=> b!125299 (= e!81859 e!81861)))

(declare-fun c!22835 () Bool)

(assert (=> b!125299 (= c!22835 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125300 () Bool)

(assert (=> b!125300 (= e!81857 (isEmpty!398 lt!64488))))

(declare-fun b!125301 () Bool)

(assert (=> b!125301 (= e!81859 (ListLongMap!1644 Nil!1686))))

(assert (= (and d!37633 c!22834) b!125301))

(assert (= (and d!37633 (not c!22834)) b!125299))

(assert (= (and b!125299 c!22835) b!125291))

(assert (= (and b!125299 (not c!22835)) b!125292))

(assert (= (or b!125291 b!125292) bm!13407))

(assert (= (and d!37633 res!60659) b!125297))

(assert (= (and b!125297 res!60658) b!125293))

(assert (= (and b!125293 res!60661) b!125290))

(assert (= (and b!125293 c!22833) b!125296))

(assert (= (and b!125293 (not c!22833)) b!125298))

(assert (= (and b!125296 res!60660) b!125294))

(assert (= (and b!125298 c!22836) b!125295))

(assert (= (and b!125298 (not c!22836)) b!125300))

(declare-fun b_lambda!5487 () Bool)

(assert (=> (not b_lambda!5487) (not b!125291)))

(assert (=> b!125291 t!6019))

(declare-fun b_and!7677 () Bool)

(assert (= b_and!7673 (and (=> t!6019 result!3815) b_and!7677)))

(assert (=> b!125291 t!6021))

(declare-fun b_and!7679 () Bool)

(assert (= b_and!7675 (and (=> t!6021 result!3817) b_and!7679)))

(declare-fun b_lambda!5489 () Bool)

(assert (=> (not b_lambda!5489) (not b!125294)))

(assert (=> b!125294 t!6019))

(declare-fun b_and!7681 () Bool)

(assert (= b_and!7677 (and (=> t!6019 result!3815) b_and!7681)))

(assert (=> b!125294 t!6021))

(declare-fun b_and!7683 () Bool)

(assert (= b_and!7679 (and (=> t!6021 result!3817) b_and!7683)))

(declare-fun m!145453 () Bool)

(assert (=> b!125297 m!145453))

(declare-fun m!145455 () Bool)

(assert (=> b!125300 m!145455))

(declare-fun m!145457 () Bool)

(assert (=> b!125291 m!145457))

(declare-fun m!145459 () Bool)

(assert (=> b!125291 m!145459))

(declare-fun m!145461 () Bool)

(assert (=> b!125291 m!145461))

(assert (=> b!125291 m!144869))

(assert (=> b!125291 m!144665))

(assert (=> b!125291 m!144871))

(assert (=> b!125291 m!145457))

(assert (=> b!125291 m!144869))

(assert (=> b!125291 m!144665))

(assert (=> b!125291 m!144651))

(declare-fun m!145463 () Bool)

(assert (=> b!125291 m!145463))

(declare-fun m!145465 () Bool)

(assert (=> bm!13407 m!145465))

(assert (=> b!125296 m!144651))

(assert (=> b!125296 m!144651))

(declare-fun m!145467 () Bool)

(assert (=> b!125296 m!145467))

(assert (=> b!125294 m!144651))

(declare-fun m!145469 () Bool)

(assert (=> b!125294 m!145469))

(assert (=> b!125294 m!144869))

(assert (=> b!125294 m!144665))

(assert (=> b!125294 m!144871))

(assert (=> b!125294 m!144869))

(assert (=> b!125294 m!144665))

(assert (=> b!125294 m!144651))

(declare-fun m!145471 () Bool)

(assert (=> d!37633 m!145471))

(assert (=> d!37633 m!144709))

(assert (=> b!125290 m!144651))

(assert (=> b!125290 m!144651))

(assert (=> b!125290 m!144659))

(assert (=> b!125295 m!145465))

(assert (=> b!125299 m!144651))

(assert (=> b!125299 m!144651))

(assert (=> b!125299 m!144659))

(assert (=> b!124933 d!37633))

(declare-fun d!37635 () Bool)

(assert (=> d!37635 (= (apply!110 (+!157 lt!64207 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64219) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64207 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) lt!64219)))))

(declare-fun bs!5174 () Bool)

(assert (= bs!5174 d!37635))

(declare-fun m!145473 () Bool)

(assert (=> bs!5174 m!145473))

(assert (=> bs!5174 m!145473))

(declare-fun m!145475 () Bool)

(assert (=> bs!5174 m!145475))

(assert (=> b!124933 d!37635))

(declare-fun d!37637 () Bool)

(assert (=> d!37637 (= (apply!110 lt!64205 lt!64206) (get!1439 (getValueByKey!164 (toList!837 lt!64205) lt!64206)))))

(declare-fun bs!5175 () Bool)

(assert (= bs!5175 d!37637))

(declare-fun m!145477 () Bool)

(assert (=> bs!5175 m!145477))

(assert (=> bs!5175 m!145477))

(declare-fun m!145479 () Bool)

(assert (=> bs!5175 m!145479))

(assert (=> b!124933 d!37637))

(declare-fun d!37639 () Bool)

(assert (=> d!37639 (= (apply!110 (+!157 lt!64205 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64206) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64205 (tuple2!2535 lt!64215 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) lt!64206)))))

(declare-fun bs!5176 () Bool)

(assert (= bs!5176 d!37639))

(declare-fun m!145481 () Bool)

(assert (=> bs!5176 m!145481))

(assert (=> bs!5176 m!145481))

(declare-fun m!145483 () Bool)

(assert (=> bs!5176 m!145483))

(assert (=> b!124933 d!37639))

(declare-fun d!37641 () Bool)

(assert (=> d!37641 (= (apply!110 (+!157 lt!64207 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64219) (apply!110 lt!64207 lt!64219))))

(declare-fun lt!64494 () Unit!3865)

(assert (=> d!37641 (= lt!64494 (choose!761 lt!64207 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64219))))

(declare-fun e!81862 () Bool)

(assert (=> d!37641 e!81862))

(declare-fun res!60662 () Bool)

(assert (=> d!37641 (=> (not res!60662) (not e!81862))))

(assert (=> d!37641 (= res!60662 (contains!863 lt!64207 lt!64219))))

(assert (=> d!37641 (= (addApplyDifferent!86 lt!64207 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)) lt!64219) lt!64494)))

(declare-fun b!125302 () Bool)

(assert (=> b!125302 (= e!81862 (not (= lt!64219 lt!64199)))))

(assert (= (and d!37641 res!60662) b!125302))

(declare-fun m!145485 () Bool)

(assert (=> d!37641 m!145485))

(assert (=> d!37641 m!144895))

(assert (=> d!37641 m!144909))

(declare-fun m!145487 () Bool)

(assert (=> d!37641 m!145487))

(assert (=> d!37641 m!144895))

(assert (=> d!37641 m!144887))

(assert (=> b!124933 d!37641))

(declare-fun d!37643 () Bool)

(declare-fun e!81863 () Bool)

(assert (=> d!37643 e!81863))

(declare-fun res!60663 () Bool)

(assert (=> d!37643 (=> res!60663 e!81863)))

(declare-fun lt!64495 () Bool)

(assert (=> d!37643 (= res!60663 (not lt!64495))))

(declare-fun lt!64498 () Bool)

(assert (=> d!37643 (= lt!64495 lt!64498)))

(declare-fun lt!64497 () Unit!3865)

(declare-fun e!81864 () Unit!3865)

(assert (=> d!37643 (= lt!64497 e!81864)))

(declare-fun c!22837 () Bool)

(assert (=> d!37643 (= c!22837 lt!64498)))

(assert (=> d!37643 (= lt!64498 (containsKey!168 (toList!837 (+!157 lt!64214 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64201))))

(assert (=> d!37643 (= (contains!863 (+!157 lt!64214 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64201) lt!64495)))

(declare-fun b!125303 () Bool)

(declare-fun lt!64496 () Unit!3865)

(assert (=> b!125303 (= e!81864 lt!64496)))

(assert (=> b!125303 (= lt!64496 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (+!157 lt!64214 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64201))))

(assert (=> b!125303 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64214 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64201))))

(declare-fun b!125304 () Bool)

(declare-fun Unit!3892 () Unit!3865)

(assert (=> b!125304 (= e!81864 Unit!3892)))

(declare-fun b!125305 () Bool)

(assert (=> b!125305 (= e!81863 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64214 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64201)))))

(assert (= (and d!37643 c!22837) b!125303))

(assert (= (and d!37643 (not c!22837)) b!125304))

(assert (= (and d!37643 (not res!60663)) b!125305))

(declare-fun m!145489 () Bool)

(assert (=> d!37643 m!145489))

(declare-fun m!145491 () Bool)

(assert (=> b!125303 m!145491))

(declare-fun m!145493 () Bool)

(assert (=> b!125303 m!145493))

(assert (=> b!125303 m!145493))

(declare-fun m!145495 () Bool)

(assert (=> b!125303 m!145495))

(assert (=> b!125305 m!145493))

(assert (=> b!125305 m!145493))

(assert (=> b!125305 m!145495))

(assert (=> b!124933 d!37643))

(declare-fun d!37645 () Bool)

(assert (=> d!37645 (contains!863 (+!157 lt!64214 (tuple2!2535 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64201)))

(declare-fun lt!64499 () Unit!3865)

(assert (=> d!37645 (= lt!64499 (choose!762 lt!64214 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64201))))

(assert (=> d!37645 (contains!863 lt!64214 lt!64201)))

(assert (=> d!37645 (= (addStillContains!86 lt!64214 lt!64216 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)) lt!64201) lt!64499)))

(declare-fun bs!5177 () Bool)

(assert (= bs!5177 d!37645))

(assert (=> bs!5177 m!144891))

(assert (=> bs!5177 m!144891))

(assert (=> bs!5177 m!144907))

(declare-fun m!145497 () Bool)

(assert (=> bs!5177 m!145497))

(declare-fun m!145499 () Bool)

(assert (=> bs!5177 m!145499))

(assert (=> b!124933 d!37645))

(declare-fun d!37647 () Bool)

(declare-fun e!81865 () Bool)

(assert (=> d!37647 e!81865))

(declare-fun res!60665 () Bool)

(assert (=> d!37647 (=> (not res!60665) (not e!81865))))

(declare-fun lt!64503 () ListLongMap!1643)

(assert (=> d!37647 (= res!60665 (contains!863 lt!64503 (_1!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(declare-fun lt!64501 () List!1689)

(assert (=> d!37647 (= lt!64503 (ListLongMap!1644 lt!64501))))

(declare-fun lt!64502 () Unit!3865)

(declare-fun lt!64500 () Unit!3865)

(assert (=> d!37647 (= lt!64502 lt!64500)))

(assert (=> d!37647 (= (getValueByKey!164 lt!64501 (_1!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37647 (= lt!64500 (lemmaContainsTupThenGetReturnValue!82 lt!64501 (_1!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37647 (= lt!64501 (insertStrictlySorted!85 (toList!837 lt!64207) (_1!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37647 (= (+!157 lt!64207 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64503)))

(declare-fun b!125306 () Bool)

(declare-fun res!60664 () Bool)

(assert (=> b!125306 (=> (not res!60664) (not e!81865))))

(assert (=> b!125306 (= res!60664 (= (getValueByKey!164 (toList!837 lt!64503) (_1!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(declare-fun b!125307 () Bool)

(assert (=> b!125307 (= e!81865 (contains!865 (toList!837 lt!64503) (tuple2!2535 lt!64199 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))

(assert (= (and d!37647 res!60665) b!125306))

(assert (= (and b!125306 res!60664) b!125307))

(declare-fun m!145501 () Bool)

(assert (=> d!37647 m!145501))

(declare-fun m!145503 () Bool)

(assert (=> d!37647 m!145503))

(declare-fun m!145505 () Bool)

(assert (=> d!37647 m!145505))

(declare-fun m!145507 () Bool)

(assert (=> d!37647 m!145507))

(declare-fun m!145509 () Bool)

(assert (=> b!125306 m!145509))

(declare-fun m!145511 () Bool)

(assert (=> b!125307 m!145511))

(assert (=> b!124933 d!37647))

(declare-fun d!37649 () Bool)

(assert (=> d!37649 (= (apply!110 (+!157 lt!64220 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16)))) lt!64218) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64220 (tuple2!2535 lt!64203 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))))) lt!64218)))))

(declare-fun bs!5178 () Bool)

(assert (= bs!5178 d!37649))

(declare-fun m!145513 () Bool)

(assert (=> bs!5178 m!145513))

(assert (=> bs!5178 m!145513))

(declare-fun m!145515 () Bool)

(assert (=> bs!5178 m!145515))

(assert (=> b!124933 d!37649))

(declare-fun d!37651 () Bool)

(declare-fun lt!64504 () Bool)

(assert (=> d!37651 (= lt!64504 (select (content!123 (toList!837 lt!64377)) (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun e!81866 () Bool)

(assert (=> d!37651 (= lt!64504 e!81866)))

(declare-fun res!60667 () Bool)

(assert (=> d!37651 (=> (not res!60667) (not e!81866))))

(assert (=> d!37651 (= res!60667 ((_ is Cons!1685) (toList!837 lt!64377)))))

(assert (=> d!37651 (= (contains!865 (toList!837 lt!64377) (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64504)))

(declare-fun b!125308 () Bool)

(declare-fun e!81867 () Bool)

(assert (=> b!125308 (= e!81866 e!81867)))

(declare-fun res!60666 () Bool)

(assert (=> b!125308 (=> res!60666 e!81867)))

(assert (=> b!125308 (= res!60666 (= (h!2286 (toList!837 lt!64377)) (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125309 () Bool)

(assert (=> b!125309 (= e!81867 (contains!865 (t!6007 (toList!837 lt!64377)) (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37651 res!60667) b!125308))

(assert (= (and b!125308 (not res!60666)) b!125309))

(declare-fun m!145517 () Bool)

(assert (=> d!37651 m!145517))

(declare-fun m!145519 () Bool)

(assert (=> d!37651 m!145519))

(declare-fun m!145521 () Bool)

(assert (=> b!125309 m!145521))

(assert (=> b!125094 d!37651))

(declare-fun d!37653 () Bool)

(assert (=> d!37653 (= (apply!110 lt!64153 lt!64165) (get!1439 (getValueByKey!164 (toList!837 lt!64153) lt!64165)))))

(declare-fun bs!5179 () Bool)

(assert (= bs!5179 d!37653))

(declare-fun m!145523 () Bool)

(assert (=> bs!5179 m!145523))

(assert (=> bs!5179 m!145523))

(declare-fun m!145525 () Bool)

(assert (=> bs!5179 m!145525))

(assert (=> b!124837 d!37653))

(declare-fun d!37655 () Bool)

(assert (=> d!37655 (= (apply!110 (+!157 lt!64151 (tuple2!2535 lt!64161 (minValue!2628 newMap!16))) lt!64152) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64151 (tuple2!2535 lt!64161 (minValue!2628 newMap!16)))) lt!64152)))))

(declare-fun bs!5180 () Bool)

(assert (= bs!5180 d!37655))

(declare-fun m!145527 () Bool)

(assert (=> bs!5180 m!145527))

(assert (=> bs!5180 m!145527))

(declare-fun m!145529 () Bool)

(assert (=> bs!5180 m!145529))

(assert (=> b!124837 d!37655))

(declare-fun d!37657 () Bool)

(declare-fun e!81868 () Bool)

(assert (=> d!37657 e!81868))

(declare-fun res!60668 () Bool)

(assert (=> d!37657 (=> res!60668 e!81868)))

(declare-fun lt!64505 () Bool)

(assert (=> d!37657 (= res!60668 (not lt!64505))))

(declare-fun lt!64508 () Bool)

(assert (=> d!37657 (= lt!64505 lt!64508)))

(declare-fun lt!64507 () Unit!3865)

(declare-fun e!81869 () Unit!3865)

(assert (=> d!37657 (= lt!64507 e!81869)))

(declare-fun c!22838 () Bool)

(assert (=> d!37657 (= c!22838 lt!64508)))

(assert (=> d!37657 (= lt!64508 (containsKey!168 (toList!837 (+!157 lt!64160 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))) lt!64147))))

(assert (=> d!37657 (= (contains!863 (+!157 lt!64160 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16))) lt!64147) lt!64505)))

(declare-fun b!125310 () Bool)

(declare-fun lt!64506 () Unit!3865)

(assert (=> b!125310 (= e!81869 lt!64506)))

(assert (=> b!125310 (= lt!64506 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (+!157 lt!64160 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))) lt!64147))))

(assert (=> b!125310 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64160 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))) lt!64147))))

(declare-fun b!125311 () Bool)

(declare-fun Unit!3893 () Unit!3865)

(assert (=> b!125311 (= e!81869 Unit!3893)))

(declare-fun b!125312 () Bool)

(assert (=> b!125312 (= e!81868 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64160 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))) lt!64147)))))

(assert (= (and d!37657 c!22838) b!125310))

(assert (= (and d!37657 (not c!22838)) b!125311))

(assert (= (and d!37657 (not res!60668)) b!125312))

(declare-fun m!145531 () Bool)

(assert (=> d!37657 m!145531))

(declare-fun m!145533 () Bool)

(assert (=> b!125310 m!145533))

(declare-fun m!145535 () Bool)

(assert (=> b!125310 m!145535))

(assert (=> b!125310 m!145535))

(declare-fun m!145537 () Bool)

(assert (=> b!125310 m!145537))

(assert (=> b!125312 m!145535))

(assert (=> b!125312 m!145535))

(assert (=> b!125312 m!145537))

(assert (=> b!124837 d!37657))

(declare-fun d!37659 () Bool)

(assert (=> d!37659 (= (apply!110 lt!64151 lt!64152) (get!1439 (getValueByKey!164 (toList!837 lt!64151) lt!64152)))))

(declare-fun bs!5181 () Bool)

(assert (= bs!5181 d!37659))

(declare-fun m!145539 () Bool)

(assert (=> bs!5181 m!145539))

(assert (=> bs!5181 m!145539))

(declare-fun m!145541 () Bool)

(assert (=> bs!5181 m!145541))

(assert (=> b!124837 d!37659))

(declare-fun d!37661 () Bool)

(assert (=> d!37661 (= (apply!110 (+!157 lt!64166 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16))) lt!64164) (apply!110 lt!64166 lt!64164))))

(declare-fun lt!64509 () Unit!3865)

(assert (=> d!37661 (= lt!64509 (choose!761 lt!64166 lt!64149 (zeroValue!2628 newMap!16) lt!64164))))

(declare-fun e!81870 () Bool)

(assert (=> d!37661 e!81870))

(declare-fun res!60669 () Bool)

(assert (=> d!37661 (=> (not res!60669) (not e!81870))))

(assert (=> d!37661 (= res!60669 (contains!863 lt!64166 lt!64164))))

(assert (=> d!37661 (= (addApplyDifferent!86 lt!64166 lt!64149 (zeroValue!2628 newMap!16) lt!64164) lt!64509)))

(declare-fun b!125313 () Bool)

(assert (=> b!125313 (= e!81870 (not (= lt!64164 lt!64149)))))

(assert (= (and d!37661 res!60669) b!125313))

(declare-fun m!145543 () Bool)

(assert (=> d!37661 m!145543))

(assert (=> d!37661 m!144791))

(assert (=> d!37661 m!144793))

(declare-fun m!145545 () Bool)

(assert (=> d!37661 m!145545))

(assert (=> d!37661 m!144791))

(assert (=> d!37661 m!144777))

(assert (=> b!124837 d!37661))

(declare-fun d!37663 () Bool)

(assert (=> d!37663 (= (apply!110 (+!157 lt!64166 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16))) lt!64164) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64166 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16)))) lt!64164)))))

(declare-fun bs!5182 () Bool)

(assert (= bs!5182 d!37663))

(declare-fun m!145547 () Bool)

(assert (=> bs!5182 m!145547))

(assert (=> bs!5182 m!145547))

(declare-fun m!145549 () Bool)

(assert (=> bs!5182 m!145549))

(assert (=> b!124837 d!37663))

(declare-fun d!37665 () Bool)

(declare-fun e!81871 () Bool)

(assert (=> d!37665 e!81871))

(declare-fun res!60671 () Bool)

(assert (=> d!37665 (=> (not res!60671) (not e!81871))))

(declare-fun lt!64513 () ListLongMap!1643)

(assert (=> d!37665 (= res!60671 (contains!863 lt!64513 (_1!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16)))))))

(declare-fun lt!64511 () List!1689)

(assert (=> d!37665 (= lt!64513 (ListLongMap!1644 lt!64511))))

(declare-fun lt!64512 () Unit!3865)

(declare-fun lt!64510 () Unit!3865)

(assert (=> d!37665 (= lt!64512 lt!64510)))

(assert (=> d!37665 (= (getValueByKey!164 lt!64511 (_1!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16)))))))

(assert (=> d!37665 (= lt!64510 (lemmaContainsTupThenGetReturnValue!82 lt!64511 (_1!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16)))))))

(assert (=> d!37665 (= lt!64511 (insertStrictlySorted!85 (toList!837 lt!64151) (_1!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16)))))))

(assert (=> d!37665 (= (+!157 lt!64151 (tuple2!2535 lt!64161 (minValue!2628 newMap!16))) lt!64513)))

(declare-fun b!125314 () Bool)

(declare-fun res!60670 () Bool)

(assert (=> b!125314 (=> (not res!60670) (not e!81871))))

(assert (=> b!125314 (= res!60670 (= (getValueByKey!164 (toList!837 lt!64513) (_1!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64161 (minValue!2628 newMap!16))))))))

(declare-fun b!125315 () Bool)

(assert (=> b!125315 (= e!81871 (contains!865 (toList!837 lt!64513) (tuple2!2535 lt!64161 (minValue!2628 newMap!16))))))

(assert (= (and d!37665 res!60671) b!125314))

(assert (= (and b!125314 res!60670) b!125315))

(declare-fun m!145551 () Bool)

(assert (=> d!37665 m!145551))

(declare-fun m!145553 () Bool)

(assert (=> d!37665 m!145553))

(declare-fun m!145555 () Bool)

(assert (=> d!37665 m!145555))

(declare-fun m!145557 () Bool)

(assert (=> d!37665 m!145557))

(declare-fun m!145559 () Bool)

(assert (=> b!125314 m!145559))

(declare-fun m!145561 () Bool)

(assert (=> b!125315 m!145561))

(assert (=> b!124837 d!37665))

(declare-fun d!37667 () Bool)

(assert (=> d!37667 (= (apply!110 (+!157 lt!64151 (tuple2!2535 lt!64161 (minValue!2628 newMap!16))) lt!64152) (apply!110 lt!64151 lt!64152))))

(declare-fun lt!64514 () Unit!3865)

(assert (=> d!37667 (= lt!64514 (choose!761 lt!64151 lt!64161 (minValue!2628 newMap!16) lt!64152))))

(declare-fun e!81872 () Bool)

(assert (=> d!37667 e!81872))

(declare-fun res!60672 () Bool)

(assert (=> d!37667 (=> (not res!60672) (not e!81872))))

(assert (=> d!37667 (= res!60672 (contains!863 lt!64151 lt!64152))))

(assert (=> d!37667 (= (addApplyDifferent!86 lt!64151 lt!64161 (minValue!2628 newMap!16) lt!64152) lt!64514)))

(declare-fun b!125316 () Bool)

(assert (=> b!125316 (= e!81872 (not (= lt!64152 lt!64161)))))

(assert (= (and d!37667 res!60672) b!125316))

(declare-fun m!145563 () Bool)

(assert (=> d!37667 m!145563))

(assert (=> d!37667 m!144771))

(assert (=> d!37667 m!144773))

(declare-fun m!145565 () Bool)

(assert (=> d!37667 m!145565))

(assert (=> d!37667 m!144771))

(assert (=> d!37667 m!144769))

(assert (=> b!124837 d!37667))

(declare-fun d!37669 () Bool)

(declare-fun e!81873 () Bool)

(assert (=> d!37669 e!81873))

(declare-fun res!60674 () Bool)

(assert (=> d!37669 (=> (not res!60674) (not e!81873))))

(declare-fun lt!64518 () ListLongMap!1643)

(assert (=> d!37669 (= res!60674 (contains!863 lt!64518 (_1!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16)))))))

(declare-fun lt!64516 () List!1689)

(assert (=> d!37669 (= lt!64518 (ListLongMap!1644 lt!64516))))

(declare-fun lt!64517 () Unit!3865)

(declare-fun lt!64515 () Unit!3865)

(assert (=> d!37669 (= lt!64517 lt!64515)))

(assert (=> d!37669 (= (getValueByKey!164 lt!64516 (_1!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37669 (= lt!64515 (lemmaContainsTupThenGetReturnValue!82 lt!64516 (_1!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37669 (= lt!64516 (insertStrictlySorted!85 (toList!837 lt!64166) (_1!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37669 (= (+!157 lt!64166 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16))) lt!64518)))

(declare-fun b!125317 () Bool)

(declare-fun res!60673 () Bool)

(assert (=> b!125317 (=> (not res!60673) (not e!81873))))

(assert (=> b!125317 (= res!60673 (= (getValueByKey!164 (toList!837 lt!64518) (_1!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16))))))))

(declare-fun b!125318 () Bool)

(assert (=> b!125318 (= e!81873 (contains!865 (toList!837 lt!64518) (tuple2!2535 lt!64149 (zeroValue!2628 newMap!16))))))

(assert (= (and d!37669 res!60674) b!125317))

(assert (= (and b!125317 res!60673) b!125318))

(declare-fun m!145567 () Bool)

(assert (=> d!37669 m!145567))

(declare-fun m!145569 () Bool)

(assert (=> d!37669 m!145569))

(declare-fun m!145571 () Bool)

(assert (=> d!37669 m!145571))

(declare-fun m!145573 () Bool)

(assert (=> d!37669 m!145573))

(declare-fun m!145575 () Bool)

(assert (=> b!125317 m!145575))

(declare-fun m!145577 () Bool)

(assert (=> b!125318 m!145577))

(assert (=> b!124837 d!37669))

(declare-fun d!37671 () Bool)

(declare-fun e!81874 () Bool)

(assert (=> d!37671 e!81874))

(declare-fun res!60676 () Bool)

(assert (=> d!37671 (=> (not res!60676) (not e!81874))))

(declare-fun lt!64522 () ListLongMap!1643)

(assert (=> d!37671 (= res!60676 (contains!863 lt!64522 (_1!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))))))

(declare-fun lt!64520 () List!1689)

(assert (=> d!37671 (= lt!64522 (ListLongMap!1644 lt!64520))))

(declare-fun lt!64521 () Unit!3865)

(declare-fun lt!64519 () Unit!3865)

(assert (=> d!37671 (= lt!64521 lt!64519)))

(assert (=> d!37671 (= (getValueByKey!164 lt!64520 (_1!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37671 (= lt!64519 (lemmaContainsTupThenGetReturnValue!82 lt!64520 (_1!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37671 (= lt!64520 (insertStrictlySorted!85 (toList!837 lt!64160) (_1!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37671 (= (+!157 lt!64160 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16))) lt!64522)))

(declare-fun b!125319 () Bool)

(declare-fun res!60675 () Bool)

(assert (=> b!125319 (=> (not res!60675) (not e!81874))))

(assert (=> b!125319 (= res!60675 (= (getValueByKey!164 (toList!837 lt!64522) (_1!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16))))))))

(declare-fun b!125320 () Bool)

(assert (=> b!125320 (= e!81874 (contains!865 (toList!837 lt!64522) (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16))))))

(assert (= (and d!37671 res!60676) b!125319))

(assert (= (and b!125319 res!60675) b!125320))

(declare-fun m!145579 () Bool)

(assert (=> d!37671 m!145579))

(declare-fun m!145581 () Bool)

(assert (=> d!37671 m!145581))

(declare-fun m!145583 () Bool)

(assert (=> d!37671 m!145583))

(declare-fun m!145585 () Bool)

(assert (=> d!37671 m!145585))

(declare-fun m!145587 () Bool)

(assert (=> b!125319 m!145587))

(declare-fun m!145589 () Bool)

(assert (=> b!125320 m!145589))

(assert (=> b!124837 d!37671))

(declare-fun d!37673 () Bool)

(assert (=> d!37673 (= (apply!110 (+!157 lt!64153 (tuple2!2535 lt!64145 (minValue!2628 newMap!16))) lt!64165) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64153 (tuple2!2535 lt!64145 (minValue!2628 newMap!16)))) lt!64165)))))

(declare-fun bs!5183 () Bool)

(assert (= bs!5183 d!37673))

(declare-fun m!145591 () Bool)

(assert (=> bs!5183 m!145591))

(assert (=> bs!5183 m!145591))

(declare-fun m!145593 () Bool)

(assert (=> bs!5183 m!145593))

(assert (=> b!124837 d!37673))

(declare-fun d!37675 () Bool)

(assert (=> d!37675 (= (apply!110 lt!64166 lt!64164) (get!1439 (getValueByKey!164 (toList!837 lt!64166) lt!64164)))))

(declare-fun bs!5184 () Bool)

(assert (= bs!5184 d!37675))

(declare-fun m!145595 () Bool)

(assert (=> bs!5184 m!145595))

(assert (=> bs!5184 m!145595))

(declare-fun m!145597 () Bool)

(assert (=> bs!5184 m!145597))

(assert (=> b!124837 d!37675))

(declare-fun d!37677 () Bool)

(assert (=> d!37677 (= (apply!110 (+!157 lt!64153 (tuple2!2535 lt!64145 (minValue!2628 newMap!16))) lt!64165) (apply!110 lt!64153 lt!64165))))

(declare-fun lt!64523 () Unit!3865)

(assert (=> d!37677 (= lt!64523 (choose!761 lt!64153 lt!64145 (minValue!2628 newMap!16) lt!64165))))

(declare-fun e!81875 () Bool)

(assert (=> d!37677 e!81875))

(declare-fun res!60677 () Bool)

(assert (=> d!37677 (=> (not res!60677) (not e!81875))))

(assert (=> d!37677 (= res!60677 (contains!863 lt!64153 lt!64165))))

(assert (=> d!37677 (= (addApplyDifferent!86 lt!64153 lt!64145 (minValue!2628 newMap!16) lt!64165) lt!64523)))

(declare-fun b!125321 () Bool)

(assert (=> b!125321 (= e!81875 (not (= lt!64165 lt!64145)))))

(assert (= (and d!37677 res!60677) b!125321))

(declare-fun m!145599 () Bool)

(assert (=> d!37677 m!145599))

(assert (=> d!37677 m!144783))

(assert (=> d!37677 m!144797))

(declare-fun m!145601 () Bool)

(assert (=> d!37677 m!145601))

(assert (=> d!37677 m!144783))

(assert (=> d!37677 m!144775))

(assert (=> b!124837 d!37677))

(declare-fun d!37679 () Bool)

(assert (=> d!37679 (contains!863 (+!157 lt!64160 (tuple2!2535 lt!64162 (zeroValue!2628 newMap!16))) lt!64147)))

(declare-fun lt!64524 () Unit!3865)

(assert (=> d!37679 (= lt!64524 (choose!762 lt!64160 lt!64162 (zeroValue!2628 newMap!16) lt!64147))))

(assert (=> d!37679 (contains!863 lt!64160 lt!64147)))

(assert (=> d!37679 (= (addStillContains!86 lt!64160 lt!64162 (zeroValue!2628 newMap!16) lt!64147) lt!64524)))

(declare-fun bs!5185 () Bool)

(assert (= bs!5185 d!37679))

(assert (=> bs!5185 m!144779))

(assert (=> bs!5185 m!144779))

(assert (=> bs!5185 m!144795))

(declare-fun m!145603 () Bool)

(assert (=> bs!5185 m!145603))

(declare-fun m!145605 () Bool)

(assert (=> bs!5185 m!145605))

(assert (=> b!124837 d!37679))

(declare-fun d!37681 () Bool)

(declare-fun e!81876 () Bool)

(assert (=> d!37681 e!81876))

(declare-fun res!60679 () Bool)

(assert (=> d!37681 (=> (not res!60679) (not e!81876))))

(declare-fun lt!64528 () ListLongMap!1643)

(assert (=> d!37681 (= res!60679 (contains!863 lt!64528 (_1!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16)))))))

(declare-fun lt!64526 () List!1689)

(assert (=> d!37681 (= lt!64528 (ListLongMap!1644 lt!64526))))

(declare-fun lt!64527 () Unit!3865)

(declare-fun lt!64525 () Unit!3865)

(assert (=> d!37681 (= lt!64527 lt!64525)))

(assert (=> d!37681 (= (getValueByKey!164 lt!64526 (_1!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16)))))))

(assert (=> d!37681 (= lt!64525 (lemmaContainsTupThenGetReturnValue!82 lt!64526 (_1!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16)))))))

(assert (=> d!37681 (= lt!64526 (insertStrictlySorted!85 (toList!837 lt!64153) (_1!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16)))))))

(assert (=> d!37681 (= (+!157 lt!64153 (tuple2!2535 lt!64145 (minValue!2628 newMap!16))) lt!64528)))

(declare-fun b!125322 () Bool)

(declare-fun res!60678 () Bool)

(assert (=> b!125322 (=> (not res!60678) (not e!81876))))

(assert (=> b!125322 (= res!60678 (= (getValueByKey!164 (toList!837 lt!64528) (_1!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64145 (minValue!2628 newMap!16))))))))

(declare-fun b!125323 () Bool)

(assert (=> b!125323 (= e!81876 (contains!865 (toList!837 lt!64528) (tuple2!2535 lt!64145 (minValue!2628 newMap!16))))))

(assert (= (and d!37681 res!60679) b!125322))

(assert (= (and b!125322 res!60678) b!125323))

(declare-fun m!145607 () Bool)

(assert (=> d!37681 m!145607))

(declare-fun m!145609 () Bool)

(assert (=> d!37681 m!145609))

(declare-fun m!145611 () Bool)

(assert (=> d!37681 m!145611))

(declare-fun m!145613 () Bool)

(assert (=> d!37681 m!145613))

(declare-fun m!145615 () Bool)

(assert (=> b!125322 m!145615))

(declare-fun m!145617 () Bool)

(assert (=> b!125323 m!145617))

(assert (=> b!124837 d!37681))

(declare-fun b!125324 () Bool)

(declare-fun e!81880 () Bool)

(assert (=> b!125324 (= e!81880 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125324 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125325 () Bool)

(declare-fun lt!64534 () Unit!3865)

(declare-fun lt!64533 () Unit!3865)

(assert (=> b!125325 (= lt!64534 lt!64533)))

(declare-fun lt!64532 () V!3425)

(declare-fun lt!64529 () ListLongMap!1643)

(declare-fun lt!64531 () (_ BitVec 64))

(declare-fun lt!64535 () (_ BitVec 64))

(assert (=> b!125325 (not (contains!863 (+!157 lt!64529 (tuple2!2535 lt!64535 lt!64532)) lt!64531))))

(assert (=> b!125325 (= lt!64533 (addStillNotContains!56 lt!64529 lt!64535 lt!64532 lt!64531))))

(assert (=> b!125325 (= lt!64531 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125325 (= lt!64532 (get!1435 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125325 (= lt!64535 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13411 () ListLongMap!1643)

(assert (=> b!125325 (= lt!64529 call!13411)))

(declare-fun e!81883 () ListLongMap!1643)

(assert (=> b!125325 (= e!81883 (+!157 call!13411 (tuple2!2535 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (get!1435 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!37683 () Bool)

(declare-fun e!81882 () Bool)

(assert (=> d!37683 e!81882))

(declare-fun res!60681 () Bool)

(assert (=> d!37683 (=> (not res!60681) (not e!81882))))

(declare-fun lt!64530 () ListLongMap!1643)

(assert (=> d!37683 (= res!60681 (not (contains!863 lt!64530 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81881 () ListLongMap!1643)

(assert (=> d!37683 (= lt!64530 e!81881)))

(declare-fun c!22840 () Bool)

(assert (=> d!37683 (= c!22840 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37683 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37683 (= (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64530)))

(declare-fun b!125326 () Bool)

(assert (=> b!125326 (= e!81883 call!13411)))

(declare-fun bm!13408 () Bool)

(assert (=> bm!13408 (= call!13411 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16)))))

(declare-fun b!125327 () Bool)

(declare-fun e!81877 () Bool)

(assert (=> b!125327 (= e!81882 e!81877)))

(declare-fun c!22839 () Bool)

(assert (=> b!125327 (= c!22839 e!81880)))

(declare-fun res!60683 () Bool)

(assert (=> b!125327 (=> (not res!60683) (not e!81880))))

(assert (=> b!125327 (= res!60683 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125328 () Bool)

(assert (=> b!125328 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> b!125328 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (_values!2746 newMap!16))))))

(declare-fun e!81878 () Bool)

(assert (=> b!125328 (= e!81878 (= (apply!110 lt!64530 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125329 () Bool)

(declare-fun e!81879 () Bool)

(assert (=> b!125329 (= e!81879 (= lt!64530 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16))))))

(declare-fun b!125330 () Bool)

(assert (=> b!125330 (= e!81877 e!81878)))

(assert (=> b!125330 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun res!60682 () Bool)

(assert (=> b!125330 (= res!60682 (contains!863 lt!64530 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125330 (=> (not res!60682) (not e!81878))))

(declare-fun b!125331 () Bool)

(declare-fun res!60680 () Bool)

(assert (=> b!125331 (=> (not res!60680) (not e!81882))))

(assert (=> b!125331 (= res!60680 (not (contains!863 lt!64530 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125332 () Bool)

(assert (=> b!125332 (= e!81877 e!81879)))

(declare-fun c!22842 () Bool)

(assert (=> b!125332 (= c!22842 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125333 () Bool)

(assert (=> b!125333 (= e!81881 e!81883)))

(declare-fun c!22841 () Bool)

(assert (=> b!125333 (= c!22841 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125334 () Bool)

(assert (=> b!125334 (= e!81879 (isEmpty!398 lt!64530))))

(declare-fun b!125335 () Bool)

(assert (=> b!125335 (= e!81881 (ListLongMap!1644 Nil!1686))))

(assert (= (and d!37683 c!22840) b!125335))

(assert (= (and d!37683 (not c!22840)) b!125333))

(assert (= (and b!125333 c!22841) b!125325))

(assert (= (and b!125333 (not c!22841)) b!125326))

(assert (= (or b!125325 b!125326) bm!13408))

(assert (= (and d!37683 res!60681) b!125331))

(assert (= (and b!125331 res!60680) b!125327))

(assert (= (and b!125327 res!60683) b!125324))

(assert (= (and b!125327 c!22839) b!125330))

(assert (= (and b!125327 (not c!22839)) b!125332))

(assert (= (and b!125330 res!60682) b!125328))

(assert (= (and b!125332 c!22842) b!125329))

(assert (= (and b!125332 (not c!22842)) b!125334))

(declare-fun b_lambda!5491 () Bool)

(assert (=> (not b_lambda!5491) (not b!125325)))

(assert (=> b!125325 t!6019))

(declare-fun b_and!7685 () Bool)

(assert (= b_and!7681 (and (=> t!6019 result!3815) b_and!7685)))

(assert (=> b!125325 t!6021))

(declare-fun b_and!7687 () Bool)

(assert (= b_and!7683 (and (=> t!6021 result!3817) b_and!7687)))

(declare-fun b_lambda!5493 () Bool)

(assert (=> (not b_lambda!5493) (not b!125328)))

(assert (=> b!125328 t!6019))

(declare-fun b_and!7689 () Bool)

(assert (= b_and!7685 (and (=> t!6019 result!3815) b_and!7689)))

(assert (=> b!125328 t!6021))

(declare-fun b_and!7691 () Bool)

(assert (= b_and!7687 (and (=> t!6021 result!3817) b_and!7691)))

(declare-fun m!145619 () Bool)

(assert (=> b!125331 m!145619))

(declare-fun m!145621 () Bool)

(assert (=> b!125334 m!145621))

(declare-fun m!145623 () Bool)

(assert (=> b!125325 m!145623))

(declare-fun m!145625 () Bool)

(assert (=> b!125325 m!145625))

(declare-fun m!145627 () Bool)

(assert (=> b!125325 m!145627))

(assert (=> b!125325 m!144757))

(assert (=> b!125325 m!144665))

(assert (=> b!125325 m!144759))

(assert (=> b!125325 m!145623))

(assert (=> b!125325 m!144757))

(assert (=> b!125325 m!144665))

(assert (=> b!125325 m!144651))

(declare-fun m!145629 () Bool)

(assert (=> b!125325 m!145629))

(declare-fun m!145631 () Bool)

(assert (=> bm!13408 m!145631))

(assert (=> b!125330 m!144651))

(assert (=> b!125330 m!144651))

(declare-fun m!145633 () Bool)

(assert (=> b!125330 m!145633))

(assert (=> b!125328 m!144651))

(declare-fun m!145635 () Bool)

(assert (=> b!125328 m!145635))

(assert (=> b!125328 m!144757))

(assert (=> b!125328 m!144665))

(assert (=> b!125328 m!144759))

(assert (=> b!125328 m!144757))

(assert (=> b!125328 m!144665))

(assert (=> b!125328 m!144651))

(declare-fun m!145637 () Bool)

(assert (=> d!37683 m!145637))

(assert (=> d!37683 m!144709))

(assert (=> b!125324 m!144651))

(assert (=> b!125324 m!144651))

(assert (=> b!125324 m!144659))

(assert (=> b!125329 m!145631))

(assert (=> b!125333 m!144651))

(assert (=> b!125333 m!144651))

(assert (=> b!125333 m!144659))

(assert (=> b!124837 d!37683))

(declare-fun d!37685 () Bool)

(assert (=> d!37685 (= (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64105)) (v!3107 (getValueByKey!164 (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64105)))))

(assert (=> d!37499 d!37685))

(declare-fun b!125338 () Bool)

(declare-fun e!81885 () Option!170)

(assert (=> b!125338 (= e!81885 (getValueByKey!164 (t!6007 (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) lt!64105))))

(declare-fun d!37687 () Bool)

(declare-fun c!22843 () Bool)

(assert (=> d!37687 (= c!22843 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64105)))))

(declare-fun e!81884 () Option!170)

(assert (=> d!37687 (= (getValueByKey!164 (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64105) e!81884)))

(declare-fun b!125339 () Bool)

(assert (=> b!125339 (= e!81885 None!168)))

(declare-fun b!125337 () Bool)

(assert (=> b!125337 (= e!81884 e!81885)))

(declare-fun c!22844 () Bool)

(assert (=> b!125337 (= c!22844 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) (not (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64105))))))

(declare-fun b!125336 () Bool)

(assert (=> b!125336 (= e!81884 (Some!169 (_2!1278 (h!2286 (toList!837 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))))

(assert (= (and d!37687 c!22843) b!125336))

(assert (= (and d!37687 (not c!22843)) b!125337))

(assert (= (and b!125337 c!22844) b!125338))

(assert (= (and b!125337 (not c!22844)) b!125339))

(declare-fun m!145639 () Bool)

(assert (=> b!125338 m!145639))

(assert (=> d!37499 d!37687))

(declare-fun d!37689 () Bool)

(declare-fun e!81886 () Bool)

(assert (=> d!37689 e!81886))

(declare-fun res!60685 () Bool)

(assert (=> d!37689 (=> (not res!60685) (not e!81886))))

(declare-fun lt!64539 () ListLongMap!1643)

(assert (=> d!37689 (= res!60685 (contains!863 lt!64539 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64537 () List!1689)

(assert (=> d!37689 (= lt!64539 (ListLongMap!1644 lt!64537))))

(declare-fun lt!64538 () Unit!3865)

(declare-fun lt!64536 () Unit!3865)

(assert (=> d!37689 (= lt!64538 lt!64536)))

(assert (=> d!37689 (= (getValueByKey!164 lt!64537 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37689 (= lt!64536 (lemmaContainsTupThenGetReturnValue!82 lt!64537 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37689 (= lt!64537 (insertStrictlySorted!85 (toList!837 call!13373) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37689 (= (+!157 call!13373 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64539)))

(declare-fun b!125340 () Bool)

(declare-fun res!60684 () Bool)

(assert (=> b!125340 (=> (not res!60684) (not e!81886))))

(assert (=> b!125340 (= res!60684 (= (getValueByKey!164 (toList!837 lt!64539) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125341 () Bool)

(assert (=> b!125341 (= e!81886 (contains!865 (toList!837 lt!64539) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37689 res!60685) b!125340))

(assert (= (and b!125340 res!60684) b!125341))

(declare-fun m!145641 () Bool)

(assert (=> d!37689 m!145641))

(declare-fun m!145643 () Bool)

(assert (=> d!37689 m!145643))

(declare-fun m!145645 () Bool)

(assert (=> d!37689 m!145645))

(declare-fun m!145647 () Bool)

(assert (=> d!37689 m!145647))

(declare-fun m!145649 () Bool)

(assert (=> b!125340 m!145649))

(declare-fun m!145651 () Bool)

(assert (=> b!125341 m!145651))

(assert (=> b!124962 d!37689))

(declare-fun d!37691 () Bool)

(declare-fun e!81887 () Bool)

(assert (=> d!37691 e!81887))

(declare-fun res!60687 () Bool)

(assert (=> d!37691 (=> (not res!60687) (not e!81887))))

(declare-fun lt!64543 () ListLongMap!1643)

(assert (=> d!37691 (= res!60687 (contains!863 lt!64543 (_1!1278 (tuple2!2535 lt!64241 lt!64238))))))

(declare-fun lt!64541 () List!1689)

(assert (=> d!37691 (= lt!64543 (ListLongMap!1644 lt!64541))))

(declare-fun lt!64542 () Unit!3865)

(declare-fun lt!64540 () Unit!3865)

(assert (=> d!37691 (= lt!64542 lt!64540)))

(assert (=> d!37691 (= (getValueByKey!164 lt!64541 (_1!1278 (tuple2!2535 lt!64241 lt!64238))) (Some!169 (_2!1278 (tuple2!2535 lt!64241 lt!64238))))))

(assert (=> d!37691 (= lt!64540 (lemmaContainsTupThenGetReturnValue!82 lt!64541 (_1!1278 (tuple2!2535 lt!64241 lt!64238)) (_2!1278 (tuple2!2535 lt!64241 lt!64238))))))

(assert (=> d!37691 (= lt!64541 (insertStrictlySorted!85 (toList!837 lt!64235) (_1!1278 (tuple2!2535 lt!64241 lt!64238)) (_2!1278 (tuple2!2535 lt!64241 lt!64238))))))

(assert (=> d!37691 (= (+!157 lt!64235 (tuple2!2535 lt!64241 lt!64238)) lt!64543)))

(declare-fun b!125342 () Bool)

(declare-fun res!60686 () Bool)

(assert (=> b!125342 (=> (not res!60686) (not e!81887))))

(assert (=> b!125342 (= res!60686 (= (getValueByKey!164 (toList!837 lt!64543) (_1!1278 (tuple2!2535 lt!64241 lt!64238))) (Some!169 (_2!1278 (tuple2!2535 lt!64241 lt!64238)))))))

(declare-fun b!125343 () Bool)

(assert (=> b!125343 (= e!81887 (contains!865 (toList!837 lt!64543) (tuple2!2535 lt!64241 lt!64238)))))

(assert (= (and d!37691 res!60687) b!125342))

(assert (= (and b!125342 res!60686) b!125343))

(declare-fun m!145653 () Bool)

(assert (=> d!37691 m!145653))

(declare-fun m!145655 () Bool)

(assert (=> d!37691 m!145655))

(declare-fun m!145657 () Bool)

(assert (=> d!37691 m!145657))

(declare-fun m!145659 () Bool)

(assert (=> d!37691 m!145659))

(declare-fun m!145661 () Bool)

(assert (=> b!125342 m!145661))

(declare-fun m!145663 () Bool)

(assert (=> b!125343 m!145663))

(assert (=> b!124962 d!37691))

(declare-fun d!37693 () Bool)

(assert (=> d!37693 (not (contains!863 (+!157 lt!64235 (tuple2!2535 lt!64241 lt!64238)) lt!64237))))

(declare-fun lt!64546 () Unit!3865)

(declare-fun choose!765 (ListLongMap!1643 (_ BitVec 64) V!3425 (_ BitVec 64)) Unit!3865)

(assert (=> d!37693 (= lt!64546 (choose!765 lt!64235 lt!64241 lt!64238 lt!64237))))

(declare-fun e!81890 () Bool)

(assert (=> d!37693 e!81890))

(declare-fun res!60690 () Bool)

(assert (=> d!37693 (=> (not res!60690) (not e!81890))))

(assert (=> d!37693 (= res!60690 (not (contains!863 lt!64235 lt!64237)))))

(assert (=> d!37693 (= (addStillNotContains!56 lt!64235 lt!64241 lt!64238 lt!64237) lt!64546)))

(declare-fun b!125347 () Bool)

(assert (=> b!125347 (= e!81890 (not (= lt!64241 lt!64237)))))

(assert (= (and d!37693 res!60690) b!125347))

(assert (=> d!37693 m!144915))

(assert (=> d!37693 m!144915))

(assert (=> d!37693 m!144917))

(declare-fun m!145665 () Bool)

(assert (=> d!37693 m!145665))

(declare-fun m!145667 () Bool)

(assert (=> d!37693 m!145667))

(assert (=> b!124962 d!37693))

(assert (=> b!124962 d!37415))

(declare-fun d!37695 () Bool)

(declare-fun e!81891 () Bool)

(assert (=> d!37695 e!81891))

(declare-fun res!60691 () Bool)

(assert (=> d!37695 (=> res!60691 e!81891)))

(declare-fun lt!64547 () Bool)

(assert (=> d!37695 (= res!60691 (not lt!64547))))

(declare-fun lt!64550 () Bool)

(assert (=> d!37695 (= lt!64547 lt!64550)))

(declare-fun lt!64549 () Unit!3865)

(declare-fun e!81892 () Unit!3865)

(assert (=> d!37695 (= lt!64549 e!81892)))

(declare-fun c!22845 () Bool)

(assert (=> d!37695 (= c!22845 lt!64550)))

(assert (=> d!37695 (= lt!64550 (containsKey!168 (toList!837 (+!157 lt!64235 (tuple2!2535 lt!64241 lt!64238))) lt!64237))))

(assert (=> d!37695 (= (contains!863 (+!157 lt!64235 (tuple2!2535 lt!64241 lt!64238)) lt!64237) lt!64547)))

(declare-fun b!125348 () Bool)

(declare-fun lt!64548 () Unit!3865)

(assert (=> b!125348 (= e!81892 lt!64548)))

(assert (=> b!125348 (= lt!64548 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (+!157 lt!64235 (tuple2!2535 lt!64241 lt!64238))) lt!64237))))

(assert (=> b!125348 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64235 (tuple2!2535 lt!64241 lt!64238))) lt!64237))))

(declare-fun b!125349 () Bool)

(declare-fun Unit!3894 () Unit!3865)

(assert (=> b!125349 (= e!81892 Unit!3894)))

(declare-fun b!125350 () Bool)

(assert (=> b!125350 (= e!81891 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64235 (tuple2!2535 lt!64241 lt!64238))) lt!64237)))))

(assert (= (and d!37695 c!22845) b!125348))

(assert (= (and d!37695 (not c!22845)) b!125349))

(assert (= (and d!37695 (not res!60691)) b!125350))

(declare-fun m!145669 () Bool)

(assert (=> d!37695 m!145669))

(declare-fun m!145671 () Bool)

(assert (=> b!125348 m!145671))

(declare-fun m!145673 () Bool)

(assert (=> b!125348 m!145673))

(assert (=> b!125348 m!145673))

(declare-fun m!145675 () Bool)

(assert (=> b!125348 m!145675))

(assert (=> b!125350 m!145673))

(assert (=> b!125350 m!145673))

(assert (=> b!125350 m!145675))

(assert (=> b!124962 d!37695))

(declare-fun d!37697 () Bool)

(assert (=> d!37697 (= (get!1439 (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3107 (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37467 d!37697))

(declare-fun b!125353 () Bool)

(declare-fun e!81894 () Option!170)

(assert (=> b!125353 (= e!81894 (getValueByKey!164 (t!6007 (toList!837 lt!64097)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!37699 () Bool)

(declare-fun c!22846 () Bool)

(assert (=> d!37699 (= c!22846 (and ((_ is Cons!1685) (toList!837 lt!64097)) (= (_1!1278 (h!2286 (toList!837 lt!64097))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!81893 () Option!170)

(assert (=> d!37699 (= (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000) e!81893)))

(declare-fun b!125354 () Bool)

(assert (=> b!125354 (= e!81894 None!168)))

(declare-fun b!125352 () Bool)

(assert (=> b!125352 (= e!81893 e!81894)))

(declare-fun c!22847 () Bool)

(assert (=> b!125352 (= c!22847 (and ((_ is Cons!1685) (toList!837 lt!64097)) (not (= (_1!1278 (h!2286 (toList!837 lt!64097))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125351 () Bool)

(assert (=> b!125351 (= e!81893 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64097)))))))

(assert (= (and d!37699 c!22846) b!125351))

(assert (= (and d!37699 (not c!22846)) b!125352))

(assert (= (and b!125352 c!22847) b!125353))

(assert (= (and b!125352 (not c!22847)) b!125354))

(declare-fun m!145677 () Bool)

(assert (=> b!125353 m!145677))

(assert (=> d!37467 d!37699))

(declare-fun d!37701 () Bool)

(assert (=> d!37701 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!64551 () Unit!3865)

(assert (=> d!37701 (= lt!64551 (choose!755 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!81895 () Bool)

(assert (=> d!37701 e!81895))

(declare-fun res!60692 () Bool)

(assert (=> d!37701 (=> (not res!60692) (not e!81895))))

(assert (=> d!37701 (= res!60692 (isStrictlySorted!311 (toList!837 lt!64097)))))

(assert (=> d!37701 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000) lt!64551)))

(declare-fun b!125355 () Bool)

(assert (=> b!125355 (= e!81895 (containsKey!168 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37701 res!60692) b!125355))

(assert (=> d!37701 m!145021))

(assert (=> d!37701 m!145021))

(assert (=> d!37701 m!145145))

(declare-fun m!145679 () Bool)

(assert (=> d!37701 m!145679))

(declare-fun m!145681 () Bool)

(assert (=> d!37701 m!145681))

(assert (=> b!125355 m!145141))

(assert (=> b!125110 d!37701))

(declare-fun d!37703 () Bool)

(assert (=> d!37703 (= (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!397 (getValueByKey!164 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5186 () Bool)

(assert (= bs!5186 d!37703))

(assert (=> bs!5186 m!145021))

(declare-fun m!145683 () Bool)

(assert (=> bs!5186 m!145683))

(assert (=> b!125110 d!37703))

(assert (=> b!125110 d!37699))

(assert (=> b!125108 d!37579))

(declare-fun d!37705 () Bool)

(declare-fun e!81896 () Bool)

(assert (=> d!37705 e!81896))

(declare-fun res!60693 () Bool)

(assert (=> d!37705 (=> res!60693 e!81896)))

(declare-fun lt!64552 () Bool)

(assert (=> d!37705 (= res!60693 (not lt!64552))))

(declare-fun lt!64555 () Bool)

(assert (=> d!37705 (= lt!64552 lt!64555)))

(declare-fun lt!64554 () Unit!3865)

(declare-fun e!81897 () Unit!3865)

(assert (=> d!37705 (= lt!64554 e!81897)))

(declare-fun c!22848 () Bool)

(assert (=> d!37705 (= c!22848 lt!64555)))

(assert (=> d!37705 (= lt!64555 (containsKey!168 (toList!837 lt!64358) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37705 (= (contains!863 lt!64358 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64552)))

(declare-fun b!125356 () Bool)

(declare-fun lt!64553 () Unit!3865)

(assert (=> b!125356 (= e!81897 lt!64553)))

(assert (=> b!125356 (= lt!64553 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64358) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> b!125356 (isDefined!118 (getValueByKey!164 (toList!837 lt!64358) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125357 () Bool)

(declare-fun Unit!3895 () Unit!3865)

(assert (=> b!125357 (= e!81897 Unit!3895)))

(declare-fun b!125358 () Bool)

(assert (=> b!125358 (= e!81896 (isDefined!118 (getValueByKey!164 (toList!837 lt!64358) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!37705 c!22848) b!125356))

(assert (= (and d!37705 (not c!22848)) b!125357))

(assert (= (and d!37705 (not res!60693)) b!125358))

(declare-fun m!145685 () Bool)

(assert (=> d!37705 m!145685))

(declare-fun m!145687 () Bool)

(assert (=> b!125356 m!145687))

(assert (=> b!125356 m!145049))

(assert (=> b!125356 m!145049))

(declare-fun m!145689 () Bool)

(assert (=> b!125356 m!145689))

(assert (=> b!125358 m!145049))

(assert (=> b!125358 m!145049))

(assert (=> b!125358 m!145689))

(assert (=> d!37477 d!37705))

(declare-fun e!81899 () Option!170)

(declare-fun b!125361 () Bool)

(assert (=> b!125361 (= e!81899 (getValueByKey!164 (t!6007 lt!64356) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun d!37707 () Bool)

(declare-fun c!22849 () Bool)

(assert (=> d!37707 (= c!22849 (and ((_ is Cons!1685) lt!64356) (= (_1!1278 (h!2286 lt!64356)) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!81898 () Option!170)

(assert (=> d!37707 (= (getValueByKey!164 lt!64356 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!81898)))

(declare-fun b!125362 () Bool)

(assert (=> b!125362 (= e!81899 None!168)))

(declare-fun b!125360 () Bool)

(assert (=> b!125360 (= e!81898 e!81899)))

(declare-fun c!22850 () Bool)

(assert (=> b!125360 (= c!22850 (and ((_ is Cons!1685) lt!64356) (not (= (_1!1278 (h!2286 lt!64356)) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125359 () Bool)

(assert (=> b!125359 (= e!81898 (Some!169 (_2!1278 (h!2286 lt!64356))))))

(assert (= (and d!37707 c!22849) b!125359))

(assert (= (and d!37707 (not c!22849)) b!125360))

(assert (= (and b!125360 c!22850) b!125361))

(assert (= (and b!125360 (not c!22850)) b!125362))

(declare-fun m!145691 () Bool)

(assert (=> b!125361 m!145691))

(assert (=> d!37477 d!37707))

(declare-fun d!37709 () Bool)

(assert (=> d!37709 (= (getValueByKey!164 lt!64356 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64556 () Unit!3865)

(assert (=> d!37709 (= lt!64556 (choose!764 lt!64356 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun e!81900 () Bool)

(assert (=> d!37709 e!81900))

(declare-fun res!60694 () Bool)

(assert (=> d!37709 (=> (not res!60694) (not e!81900))))

(assert (=> d!37709 (= res!60694 (isStrictlySorted!311 lt!64356))))

(assert (=> d!37709 (= (lemmaContainsTupThenGetReturnValue!82 lt!64356 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64556)))

(declare-fun b!125363 () Bool)

(declare-fun res!60695 () Bool)

(assert (=> b!125363 (=> (not res!60695) (not e!81900))))

(assert (=> b!125363 (= res!60695 (containsKey!168 lt!64356 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125364 () Bool)

(assert (=> b!125364 (= e!81900 (contains!865 lt!64356 (tuple2!2535 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!37709 res!60694) b!125363))

(assert (= (and b!125363 res!60695) b!125364))

(assert (=> d!37709 m!145043))

(declare-fun m!145693 () Bool)

(assert (=> d!37709 m!145693))

(declare-fun m!145695 () Bool)

(assert (=> d!37709 m!145695))

(declare-fun m!145697 () Bool)

(assert (=> b!125363 m!145697))

(declare-fun m!145699 () Bool)

(assert (=> b!125364 m!145699))

(assert (=> d!37477 d!37709))

(declare-fun b!125365 () Bool)

(declare-fun e!81903 () List!1689)

(declare-fun call!13414 () List!1689)

(assert (=> b!125365 (= e!81903 call!13414)))

(declare-fun bm!13409 () Bool)

(declare-fun call!13412 () List!1689)

(declare-fun call!13413 () List!1689)

(assert (=> bm!13409 (= call!13412 call!13413)))

(declare-fun b!125366 () Bool)

(declare-fun e!81905 () List!1689)

(assert (=> b!125366 (= e!81905 call!13413)))

(declare-fun d!37711 () Bool)

(declare-fun e!81904 () Bool)

(assert (=> d!37711 e!81904))

(declare-fun res!60697 () Bool)

(assert (=> d!37711 (=> (not res!60697) (not e!81904))))

(declare-fun lt!64557 () List!1689)

(assert (=> d!37711 (= res!60697 (isStrictlySorted!311 lt!64557))))

(assert (=> d!37711 (= lt!64557 e!81905)))

(declare-fun c!22852 () Bool)

(assert (=> d!37711 (= c!22852 (and ((_ is Cons!1685) (toList!837 lt!64091)) (bvslt (_1!1278 (h!2286 (toList!837 lt!64091))) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37711 (isStrictlySorted!311 (toList!837 lt!64091))))

(assert (=> d!37711 (= (insertStrictlySorted!85 (toList!837 lt!64091) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64557)))

(declare-fun b!125367 () Bool)

(assert (=> b!125367 (= e!81903 call!13414)))

(declare-fun bm!13410 () Bool)

(declare-fun e!81902 () List!1689)

(assert (=> bm!13410 (= call!13413 ($colon$colon!87 e!81902 (ite c!22852 (h!2286 (toList!837 lt!64091)) (tuple2!2535 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun c!22851 () Bool)

(assert (=> bm!13410 (= c!22851 c!22852)))

(declare-fun b!125368 () Bool)

(declare-fun e!81901 () List!1689)

(assert (=> b!125368 (= e!81905 e!81901)))

(declare-fun c!22853 () Bool)

(assert (=> b!125368 (= c!22853 (and ((_ is Cons!1685) (toList!837 lt!64091)) (= (_1!1278 (h!2286 (toList!837 lt!64091))) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun c!22854 () Bool)

(declare-fun b!125369 () Bool)

(assert (=> b!125369 (= c!22854 (and ((_ is Cons!1685) (toList!837 lt!64091)) (bvsgt (_1!1278 (h!2286 (toList!837 lt!64091))) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> b!125369 (= e!81901 e!81903)))

(declare-fun b!125370 () Bool)

(assert (=> b!125370 (= e!81904 (contains!865 lt!64557 (tuple2!2535 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125371 () Bool)

(assert (=> b!125371 (= e!81902 (insertStrictlySorted!85 (t!6007 (toList!837 lt!64091)) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125372 () Bool)

(assert (=> b!125372 (= e!81901 call!13412)))

(declare-fun bm!13411 () Bool)

(assert (=> bm!13411 (= call!13414 call!13412)))

(declare-fun b!125373 () Bool)

(declare-fun res!60696 () Bool)

(assert (=> b!125373 (=> (not res!60696) (not e!81904))))

(assert (=> b!125373 (= res!60696 (containsKey!168 lt!64557 (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125374 () Bool)

(assert (=> b!125374 (= e!81902 (ite c!22853 (t!6007 (toList!837 lt!64091)) (ite c!22854 (Cons!1685 (h!2286 (toList!837 lt!64091)) (t!6007 (toList!837 lt!64091))) Nil!1686)))))

(assert (= (and d!37711 c!22852) b!125366))

(assert (= (and d!37711 (not c!22852)) b!125368))

(assert (= (and b!125368 c!22853) b!125372))

(assert (= (and b!125368 (not c!22853)) b!125369))

(assert (= (and b!125369 c!22854) b!125367))

(assert (= (and b!125369 (not c!22854)) b!125365))

(assert (= (or b!125367 b!125365) bm!13411))

(assert (= (or b!125372 bm!13411) bm!13409))

(assert (= (or b!125366 bm!13409) bm!13410))

(assert (= (and bm!13410 c!22851) b!125371))

(assert (= (and bm!13410 (not c!22851)) b!125374))

(assert (= (and d!37711 res!60697) b!125373))

(assert (= (and b!125373 res!60696) b!125370))

(declare-fun m!145701 () Bool)

(assert (=> d!37711 m!145701))

(declare-fun m!145703 () Bool)

(assert (=> d!37711 m!145703))

(declare-fun m!145705 () Bool)

(assert (=> b!125373 m!145705))

(declare-fun m!145707 () Bool)

(assert (=> b!125371 m!145707))

(declare-fun m!145709 () Bool)

(assert (=> b!125370 m!145709))

(declare-fun m!145711 () Bool)

(assert (=> bm!13410 m!145711))

(assert (=> d!37477 d!37711))

(assert (=> b!124824 d!37579))

(declare-fun d!37713 () Bool)

(declare-fun e!81906 () Bool)

(assert (=> d!37713 e!81906))

(declare-fun res!60698 () Bool)

(assert (=> d!37713 (=> res!60698 e!81906)))

(declare-fun lt!64558 () Bool)

(assert (=> d!37713 (= res!60698 (not lt!64558))))

(declare-fun lt!64561 () Bool)

(assert (=> d!37713 (= lt!64558 lt!64561)))

(declare-fun lt!64560 () Unit!3865)

(declare-fun e!81907 () Unit!3865)

(assert (=> d!37713 (= lt!64560 e!81907)))

(declare-fun c!22855 () Bool)

(assert (=> d!37713 (= c!22855 lt!64561)))

(assert (=> d!37713 (= lt!64561 (containsKey!168 (toList!837 lt!64131) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37713 (= (contains!863 lt!64131 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64558)))

(declare-fun b!125375 () Bool)

(declare-fun lt!64559 () Unit!3865)

(assert (=> b!125375 (= e!81907 lt!64559)))

(assert (=> b!125375 (= lt!64559 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64131) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125375 (isDefined!118 (getValueByKey!164 (toList!837 lt!64131) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125376 () Bool)

(declare-fun Unit!3896 () Unit!3865)

(assert (=> b!125376 (= e!81907 Unit!3896)))

(declare-fun b!125377 () Bool)

(assert (=> b!125377 (= e!81906 (isDefined!118 (getValueByKey!164 (toList!837 lt!64131) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37713 c!22855) b!125375))

(assert (= (and d!37713 (not c!22855)) b!125376))

(assert (= (and d!37713 (not res!60698)) b!125377))

(declare-fun m!145713 () Bool)

(assert (=> d!37713 m!145713))

(declare-fun m!145715 () Bool)

(assert (=> b!125375 m!145715))

(declare-fun m!145717 () Bool)

(assert (=> b!125375 m!145717))

(assert (=> b!125375 m!145717))

(declare-fun m!145719 () Bool)

(assert (=> b!125375 m!145719))

(assert (=> b!125377 m!145717))

(assert (=> b!125377 m!145717))

(assert (=> b!125377 m!145719))

(assert (=> bm!13345 d!37713))

(assert (=> b!124920 d!37579))

(declare-fun d!37715 () Bool)

(assert (=> d!37715 (= (apply!110 lt!64236 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1439 (getValueByKey!164 (toList!837 lt!64236) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5187 () Bool)

(assert (= bs!5187 d!37715))

(assert (=> bs!5187 m!144579))

(declare-fun m!145721 () Bool)

(assert (=> bs!5187 m!145721))

(assert (=> bs!5187 m!145721))

(declare-fun m!145723 () Bool)

(assert (=> bs!5187 m!145723))

(assert (=> b!124965 d!37715))

(assert (=> b!124965 d!37415))

(assert (=> bm!13380 d!37425))

(declare-fun d!37717 () Bool)

(declare-fun e!81908 () Bool)

(assert (=> d!37717 e!81908))

(declare-fun res!60699 () Bool)

(assert (=> d!37717 (=> res!60699 e!81908)))

(declare-fun lt!64562 () Bool)

(assert (=> d!37717 (= res!60699 (not lt!64562))))

(declare-fun lt!64565 () Bool)

(assert (=> d!37717 (= lt!64562 lt!64565)))

(declare-fun lt!64564 () Unit!3865)

(declare-fun e!81909 () Unit!3865)

(assert (=> d!37717 (= lt!64564 e!81909)))

(declare-fun c!22856 () Bool)

(assert (=> d!37717 (= c!22856 lt!64565)))

(assert (=> d!37717 (= lt!64565 (containsKey!168 (toList!837 lt!64118) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37717 (= (contains!863 lt!64118 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64562)))

(declare-fun b!125378 () Bool)

(declare-fun lt!64563 () Unit!3865)

(assert (=> b!125378 (= e!81909 lt!64563)))

(assert (=> b!125378 (= lt!64563 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64118) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!125378 (isDefined!118 (getValueByKey!164 (toList!837 lt!64118) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125379 () Bool)

(declare-fun Unit!3897 () Unit!3865)

(assert (=> b!125379 (= e!81909 Unit!3897)))

(declare-fun b!125380 () Bool)

(assert (=> b!125380 (= e!81908 (isDefined!118 (getValueByKey!164 (toList!837 lt!64118) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!37717 c!22856) b!125378))

(assert (= (and d!37717 (not c!22856)) b!125379))

(assert (= (and d!37717 (not res!60699)) b!125380))

(declare-fun m!145725 () Bool)

(assert (=> d!37717 m!145725))

(declare-fun m!145727 () Bool)

(assert (=> b!125378 m!145727))

(assert (=> b!125378 m!144647))

(assert (=> b!125378 m!144647))

(declare-fun m!145729 () Bool)

(assert (=> b!125378 m!145729))

(assert (=> b!125380 m!144647))

(assert (=> b!125380 m!144647))

(assert (=> b!125380 m!145729))

(assert (=> d!37405 d!37717))

(declare-fun b!125383 () Bool)

(declare-fun e!81911 () Option!170)

(assert (=> b!125383 (= e!81911 (getValueByKey!164 (t!6007 lt!64116) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!37719 () Bool)

(declare-fun c!22857 () Bool)

(assert (=> d!37719 (= c!22857 (and ((_ is Cons!1685) lt!64116) (= (_1!1278 (h!2286 lt!64116)) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!81910 () Option!170)

(assert (=> d!37719 (= (getValueByKey!164 lt!64116 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!81910)))

(declare-fun b!125384 () Bool)

(assert (=> b!125384 (= e!81911 None!168)))

(declare-fun b!125382 () Bool)

(assert (=> b!125382 (= e!81910 e!81911)))

(declare-fun c!22858 () Bool)

(assert (=> b!125382 (= c!22858 (and ((_ is Cons!1685) lt!64116) (not (= (_1!1278 (h!2286 lt!64116)) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!125381 () Bool)

(assert (=> b!125381 (= e!81910 (Some!169 (_2!1278 (h!2286 lt!64116))))))

(assert (= (and d!37719 c!22857) b!125381))

(assert (= (and d!37719 (not c!22857)) b!125382))

(assert (= (and b!125382 c!22858) b!125383))

(assert (= (and b!125382 (not c!22858)) b!125384))

(declare-fun m!145731 () Bool)

(assert (=> b!125383 m!145731))

(assert (=> d!37405 d!37719))

(declare-fun d!37721 () Bool)

(assert (=> d!37721 (= (getValueByKey!164 lt!64116 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64566 () Unit!3865)

(assert (=> d!37721 (= lt!64566 (choose!764 lt!64116 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!81912 () Bool)

(assert (=> d!37721 e!81912))

(declare-fun res!60700 () Bool)

(assert (=> d!37721 (=> (not res!60700) (not e!81912))))

(assert (=> d!37721 (= res!60700 (isStrictlySorted!311 lt!64116))))

(assert (=> d!37721 (= (lemmaContainsTupThenGetReturnValue!82 lt!64116 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64566)))

(declare-fun b!125385 () Bool)

(declare-fun res!60701 () Bool)

(assert (=> b!125385 (=> (not res!60701) (not e!81912))))

(assert (=> b!125385 (= res!60701 (containsKey!168 lt!64116 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125386 () Bool)

(assert (=> b!125386 (= e!81912 (contains!865 lt!64116 (tuple2!2535 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!37721 res!60700) b!125385))

(assert (= (and b!125385 res!60701) b!125386))

(assert (=> d!37721 m!144641))

(declare-fun m!145733 () Bool)

(assert (=> d!37721 m!145733))

(declare-fun m!145735 () Bool)

(assert (=> d!37721 m!145735))

(declare-fun m!145737 () Bool)

(assert (=> b!125385 m!145737))

(declare-fun m!145739 () Bool)

(assert (=> b!125386 m!145739))

(assert (=> d!37405 d!37721))

(declare-fun b!125387 () Bool)

(declare-fun e!81915 () List!1689)

(declare-fun call!13417 () List!1689)

(assert (=> b!125387 (= e!81915 call!13417)))

(declare-fun bm!13412 () Bool)

(declare-fun call!13415 () List!1689)

(declare-fun call!13416 () List!1689)

(assert (=> bm!13412 (= call!13415 call!13416)))

(declare-fun b!125388 () Bool)

(declare-fun e!81917 () List!1689)

(assert (=> b!125388 (= e!81917 call!13416)))

(declare-fun d!37723 () Bool)

(declare-fun e!81916 () Bool)

(assert (=> d!37723 e!81916))

(declare-fun res!60703 () Bool)

(assert (=> d!37723 (=> (not res!60703) (not e!81916))))

(declare-fun lt!64567 () List!1689)

(assert (=> d!37723 (= res!60703 (isStrictlySorted!311 lt!64567))))

(assert (=> d!37723 (= lt!64567 e!81917)))

(declare-fun c!22860 () Bool)

(assert (=> d!37723 (= c!22860 (and ((_ is Cons!1685) (toList!837 call!13320)) (bvslt (_1!1278 (h!2286 (toList!837 call!13320))) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37723 (isStrictlySorted!311 (toList!837 call!13320))))

(assert (=> d!37723 (= (insertStrictlySorted!85 (toList!837 call!13320) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64567)))

(declare-fun b!125389 () Bool)

(assert (=> b!125389 (= e!81915 call!13417)))

(declare-fun bm!13413 () Bool)

(declare-fun e!81914 () List!1689)

(assert (=> bm!13413 (= call!13416 ($colon$colon!87 e!81914 (ite c!22860 (h!2286 (toList!837 call!13320)) (tuple2!2535 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!22859 () Bool)

(assert (=> bm!13413 (= c!22859 c!22860)))

(declare-fun b!125390 () Bool)

(declare-fun e!81913 () List!1689)

(assert (=> b!125390 (= e!81917 e!81913)))

(declare-fun c!22861 () Bool)

(assert (=> b!125390 (= c!22861 (and ((_ is Cons!1685) (toList!837 call!13320)) (= (_1!1278 (h!2286 (toList!837 call!13320))) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125391 () Bool)

(declare-fun c!22862 () Bool)

(assert (=> b!125391 (= c!22862 (and ((_ is Cons!1685) (toList!837 call!13320)) (bvsgt (_1!1278 (h!2286 (toList!837 call!13320))) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!125391 (= e!81913 e!81915)))

(declare-fun b!125392 () Bool)

(assert (=> b!125392 (= e!81916 (contains!865 lt!64567 (tuple2!2535 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125393 () Bool)

(assert (=> b!125393 (= e!81914 (insertStrictlySorted!85 (t!6007 (toList!837 call!13320)) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125394 () Bool)

(assert (=> b!125394 (= e!81913 call!13415)))

(declare-fun bm!13414 () Bool)

(assert (=> bm!13414 (= call!13417 call!13415)))

(declare-fun b!125395 () Bool)

(declare-fun res!60702 () Bool)

(assert (=> b!125395 (=> (not res!60702) (not e!81916))))

(assert (=> b!125395 (= res!60702 (containsKey!168 lt!64567 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125396 () Bool)

(assert (=> b!125396 (= e!81914 (ite c!22861 (t!6007 (toList!837 call!13320)) (ite c!22862 (Cons!1685 (h!2286 (toList!837 call!13320)) (t!6007 (toList!837 call!13320))) Nil!1686)))))

(assert (= (and d!37723 c!22860) b!125388))

(assert (= (and d!37723 (not c!22860)) b!125390))

(assert (= (and b!125390 c!22861) b!125394))

(assert (= (and b!125390 (not c!22861)) b!125391))

(assert (= (and b!125391 c!22862) b!125389))

(assert (= (and b!125391 (not c!22862)) b!125387))

(assert (= (or b!125389 b!125387) bm!13414))

(assert (= (or b!125394 bm!13414) bm!13412))

(assert (= (or b!125388 bm!13412) bm!13413))

(assert (= (and bm!13413 c!22859) b!125393))

(assert (= (and bm!13413 (not c!22859)) b!125396))

(assert (= (and d!37723 res!60703) b!125395))

(assert (= (and b!125395 res!60702) b!125392))

(declare-fun m!145741 () Bool)

(assert (=> d!37723 m!145741))

(declare-fun m!145743 () Bool)

(assert (=> d!37723 m!145743))

(declare-fun m!145745 () Bool)

(assert (=> b!125395 m!145745))

(declare-fun m!145747 () Bool)

(assert (=> b!125393 m!145747))

(declare-fun m!145749 () Bool)

(assert (=> b!125392 m!145749))

(declare-fun m!145751 () Bool)

(assert (=> bm!13413 m!145751))

(assert (=> d!37405 d!37723))

(declare-fun d!37725 () Bool)

(assert (=> d!37725 (= (isDefined!118 (getValueByKey!164 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))) (not (isEmpty!397 (getValueByKey!164 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))))

(declare-fun bs!5188 () Bool)

(assert (= bs!5188 d!37725))

(assert (=> bs!5188 m!144855))

(declare-fun m!145753 () Bool)

(assert (=> bs!5188 m!145753))

(assert (=> b!124915 d!37725))

(declare-fun b!125399 () Bool)

(declare-fun e!81919 () Option!170)

(assert (=> b!125399 (= e!81919 (getValueByKey!164 (t!6007 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun d!37727 () Bool)

(declare-fun c!22863 () Bool)

(assert (=> d!37727 (= c!22863 (and ((_ is Cons!1685) (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (= (_1!1278 (h!2286 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(declare-fun e!81918 () Option!170)

(assert (=> d!37727 (= (getValueByKey!164 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) e!81918)))

(declare-fun b!125400 () Bool)

(assert (=> b!125400 (= e!81919 None!168)))

(declare-fun b!125398 () Bool)

(assert (=> b!125398 (= e!81918 e!81919)))

(declare-fun c!22864 () Bool)

(assert (=> b!125398 (= c!22864 (and ((_ is Cons!1685) (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (not (= (_1!1278 (h!2286 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))))

(declare-fun b!125397 () Bool)

(assert (=> b!125397 (= e!81918 (Some!169 (_2!1278 (h!2286 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))))))

(assert (= (and d!37727 c!22863) b!125397))

(assert (= (and d!37727 (not c!22863)) b!125398))

(assert (= (and b!125398 c!22864) b!125399))

(assert (= (and b!125398 (not c!22864)) b!125400))

(assert (=> b!125399 m!144407))

(declare-fun m!145755 () Bool)

(assert (=> b!125399 m!145755))

(assert (=> b!124915 d!37727))

(declare-fun b!125403 () Bool)

(declare-fun e!81921 () Option!170)

(assert (=> b!125403 (= e!81921 (getValueByKey!164 (t!6007 (toList!837 lt!64358)) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun c!22865 () Bool)

(declare-fun d!37729 () Bool)

(assert (=> d!37729 (= c!22865 (and ((_ is Cons!1685) (toList!837 lt!64358)) (= (_1!1278 (h!2286 (toList!837 lt!64358))) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!81920 () Option!170)

(assert (=> d!37729 (= (getValueByKey!164 (toList!837 lt!64358) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!81920)))

(declare-fun b!125404 () Bool)

(assert (=> b!125404 (= e!81921 None!168)))

(declare-fun b!125402 () Bool)

(assert (=> b!125402 (= e!81920 e!81921)))

(declare-fun c!22866 () Bool)

(assert (=> b!125402 (= c!22866 (and ((_ is Cons!1685) (toList!837 lt!64358)) (not (= (_1!1278 (h!2286 (toList!837 lt!64358))) (_1!1278 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125401 () Bool)

(assert (=> b!125401 (= e!81920 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64358)))))))

(assert (= (and d!37729 c!22865) b!125401))

(assert (= (and d!37729 (not c!22865)) b!125402))

(assert (= (and b!125402 c!22866) b!125403))

(assert (= (and b!125402 (not c!22866)) b!125404))

(declare-fun m!145757 () Bool)

(assert (=> b!125403 m!145757))

(assert (=> b!125080 d!37729))

(declare-fun d!37731 () Bool)

(assert (=> d!37731 (isDefined!118 (getValueByKey!164 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun lt!64568 () Unit!3865)

(assert (=> d!37731 (= lt!64568 (choose!755 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun e!81922 () Bool)

(assert (=> d!37731 e!81922))

(declare-fun res!60704 () Bool)

(assert (=> d!37731 (=> (not res!60704) (not e!81922))))

(assert (=> d!37731 (= res!60704 (isStrictlySorted!311 (toList!837 call!13306)))))

(assert (=> d!37731 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) lt!64568)))

(declare-fun b!125405 () Bool)

(assert (=> b!125405 (= e!81922 (containsKey!168 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37731 res!60704) b!125405))

(assert (=> d!37731 m!144407))

(assert (=> d!37731 m!144935))

(assert (=> d!37731 m!144935))

(assert (=> d!37731 m!144937))

(assert (=> d!37731 m!144407))

(declare-fun m!145759 () Bool)

(assert (=> d!37731 m!145759))

(declare-fun m!145761 () Bool)

(assert (=> d!37731 m!145761))

(assert (=> b!125405 m!144407))

(assert (=> b!125405 m!144931))

(assert (=> b!124973 d!37731))

(declare-fun d!37733 () Bool)

(assert (=> d!37733 (= (isDefined!118 (getValueByKey!164 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))) (not (isEmpty!397 (getValueByKey!164 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))))

(declare-fun bs!5189 () Bool)

(assert (= bs!5189 d!37733))

(assert (=> bs!5189 m!144935))

(declare-fun m!145763 () Bool)

(assert (=> bs!5189 m!145763))

(assert (=> b!124973 d!37733))

(declare-fun b!125408 () Bool)

(declare-fun e!81924 () Option!170)

(assert (=> b!125408 (= e!81924 (getValueByKey!164 (t!6007 (toList!837 call!13306)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun d!37735 () Bool)

(declare-fun c!22867 () Bool)

(assert (=> d!37735 (= c!22867 (and ((_ is Cons!1685) (toList!837 call!13306)) (= (_1!1278 (h!2286 (toList!837 call!13306))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(declare-fun e!81923 () Option!170)

(assert (=> d!37735 (= (getValueByKey!164 (toList!837 call!13306) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) e!81923)))

(declare-fun b!125409 () Bool)

(assert (=> b!125409 (= e!81924 None!168)))

(declare-fun b!125407 () Bool)

(assert (=> b!125407 (= e!81923 e!81924)))

(declare-fun c!22868 () Bool)

(assert (=> b!125407 (= c!22868 (and ((_ is Cons!1685) (toList!837 call!13306)) (not (= (_1!1278 (h!2286 (toList!837 call!13306))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))))

(declare-fun b!125406 () Bool)

(assert (=> b!125406 (= e!81923 (Some!169 (_2!1278 (h!2286 (toList!837 call!13306)))))))

(assert (= (and d!37735 c!22867) b!125406))

(assert (= (and d!37735 (not c!22867)) b!125407))

(assert (= (and b!125407 c!22868) b!125408))

(assert (= (and b!125407 (not c!22868)) b!125409))

(assert (=> b!125408 m!144407))

(declare-fun m!145765 () Bool)

(assert (=> b!125408 m!145765))

(assert (=> b!124973 d!37735))

(declare-fun d!37737 () Bool)

(declare-fun e!81925 () Bool)

(assert (=> d!37737 e!81925))

(declare-fun res!60705 () Bool)

(assert (=> d!37737 (=> res!60705 e!81925)))

(declare-fun lt!64569 () Bool)

(assert (=> d!37737 (= res!60705 (not lt!64569))))

(declare-fun lt!64572 () Bool)

(assert (=> d!37737 (= lt!64569 lt!64572)))

(declare-fun lt!64571 () Unit!3865)

(declare-fun e!81926 () Unit!3865)

(assert (=> d!37737 (= lt!64571 e!81926)))

(declare-fun c!22869 () Bool)

(assert (=> d!37737 (= c!22869 lt!64572)))

(assert (=> d!37737 (= lt!64572 (containsKey!168 (toList!837 lt!64157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37737 (= (contains!863 lt!64157 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64569)))

(declare-fun b!125410 () Bool)

(declare-fun lt!64570 () Unit!3865)

(assert (=> b!125410 (= e!81926 lt!64570)))

(assert (=> b!125410 (= lt!64570 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125410 (isDefined!118 (getValueByKey!164 (toList!837 lt!64157) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125411 () Bool)

(declare-fun Unit!3898 () Unit!3865)

(assert (=> b!125411 (= e!81926 Unit!3898)))

(declare-fun b!125412 () Bool)

(assert (=> b!125412 (= e!81925 (isDefined!118 (getValueByKey!164 (toList!837 lt!64157) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37737 c!22869) b!125410))

(assert (= (and d!37737 (not c!22869)) b!125411))

(assert (= (and d!37737 (not res!60705)) b!125412))

(declare-fun m!145767 () Bool)

(assert (=> d!37737 m!145767))

(declare-fun m!145769 () Bool)

(assert (=> b!125410 m!145769))

(assert (=> b!125410 m!145209))

(assert (=> b!125410 m!145209))

(declare-fun m!145771 () Bool)

(assert (=> b!125410 m!145771))

(assert (=> b!125412 m!145209))

(assert (=> b!125412 m!145209))

(assert (=> b!125412 m!145771))

(assert (=> bm!13352 d!37737))

(declare-fun d!37739 () Bool)

(assert (=> d!37739 (= (apply!110 lt!64131 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!164 (toList!837 lt!64131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5190 () Bool)

(assert (= bs!5190 d!37739))

(assert (=> bs!5190 m!145323))

(assert (=> bs!5190 m!145323))

(declare-fun m!145773 () Bool)

(assert (=> bs!5190 m!145773))

(assert (=> b!124789 d!37739))

(declare-fun d!37741 () Bool)

(declare-fun e!81927 () Bool)

(assert (=> d!37741 e!81927))

(declare-fun res!60706 () Bool)

(assert (=> d!37741 (=> res!60706 e!81927)))

(declare-fun lt!64573 () Bool)

(assert (=> d!37741 (= res!60706 (not lt!64573))))

(declare-fun lt!64576 () Bool)

(assert (=> d!37741 (= lt!64573 lt!64576)))

(declare-fun lt!64575 () Unit!3865)

(declare-fun e!81928 () Unit!3865)

(assert (=> d!37741 (= lt!64575 e!81928)))

(declare-fun c!22870 () Bool)

(assert (=> d!37741 (= c!22870 lt!64576)))

(assert (=> d!37741 (= lt!64576 (containsKey!168 (toList!837 lt!64211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37741 (= (contains!863 lt!64211 #b1000000000000000000000000000000000000000000000000000000000000000) lt!64573)))

(declare-fun b!125413 () Bool)

(declare-fun lt!64574 () Unit!3865)

(assert (=> b!125413 (= e!81928 lt!64574)))

(assert (=> b!125413 (= lt!64574 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125413 (isDefined!118 (getValueByKey!164 (toList!837 lt!64211) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125414 () Bool)

(declare-fun Unit!3899 () Unit!3865)

(assert (=> b!125414 (= e!81928 Unit!3899)))

(declare-fun b!125415 () Bool)

(assert (=> b!125415 (= e!81927 (isDefined!118 (getValueByKey!164 (toList!837 lt!64211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37741 c!22870) b!125413))

(assert (= (and d!37741 (not c!22870)) b!125414))

(assert (= (and d!37741 (not res!60706)) b!125415))

(declare-fun m!145775 () Bool)

(assert (=> d!37741 m!145775))

(declare-fun m!145777 () Bool)

(assert (=> b!125413 m!145777))

(assert (=> b!125413 m!145205))

(assert (=> b!125413 m!145205))

(declare-fun m!145779 () Bool)

(assert (=> b!125413 m!145779))

(assert (=> b!125415 m!145205))

(assert (=> b!125415 m!145205))

(assert (=> b!125415 m!145779))

(assert (=> bm!13365 d!37741))

(declare-fun d!37743 () Bool)

(assert (=> d!37743 (= (isEmpty!397 (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))) (not ((_ is Some!169) (getValueByKey!164 (toList!837 lt!63929) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))))

(assert (=> d!37429 d!37743))

(declare-fun d!37745 () Bool)

(declare-fun e!81929 () Bool)

(assert (=> d!37745 e!81929))

(declare-fun res!60707 () Bool)

(assert (=> d!37745 (=> res!60707 e!81929)))

(declare-fun lt!64577 () Bool)

(assert (=> d!37745 (= res!60707 (not lt!64577))))

(declare-fun lt!64580 () Bool)

(assert (=> d!37745 (= lt!64577 lt!64580)))

(declare-fun lt!64579 () Unit!3865)

(declare-fun e!81930 () Unit!3865)

(assert (=> d!37745 (= lt!64579 e!81930)))

(declare-fun c!22871 () Bool)

(assert (=> d!37745 (= c!22871 lt!64580)))

(assert (=> d!37745 (= lt!64580 (containsKey!168 (toList!837 lt!64377) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!37745 (= (contains!863 lt!64377 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64577)))

(declare-fun b!125416 () Bool)

(declare-fun lt!64578 () Unit!3865)

(assert (=> b!125416 (= e!81930 lt!64578)))

(assert (=> b!125416 (= lt!64578 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64377) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> b!125416 (isDefined!118 (getValueByKey!164 (toList!837 lt!64377) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125417 () Bool)

(declare-fun Unit!3900 () Unit!3865)

(assert (=> b!125417 (= e!81930 Unit!3900)))

(declare-fun b!125418 () Bool)

(assert (=> b!125418 (= e!81929 (isDefined!118 (getValueByKey!164 (toList!837 lt!64377) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!37745 c!22871) b!125416))

(assert (= (and d!37745 (not c!22871)) b!125417))

(assert (= (and d!37745 (not res!60707)) b!125418))

(declare-fun m!145781 () Bool)

(assert (=> d!37745 m!145781))

(declare-fun m!145783 () Bool)

(assert (=> b!125416 m!145783))

(assert (=> b!125416 m!145105))

(assert (=> b!125416 m!145105))

(declare-fun m!145785 () Bool)

(assert (=> b!125416 m!145785))

(assert (=> b!125418 m!145105))

(assert (=> b!125418 m!145105))

(assert (=> b!125418 m!145785))

(assert (=> d!37495 d!37745))

(declare-fun b!125421 () Bool)

(declare-fun e!81932 () Option!170)

(assert (=> b!125421 (= e!81932 (getValueByKey!164 (t!6007 lt!64375) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun c!22872 () Bool)

(declare-fun d!37747 () Bool)

(assert (=> d!37747 (= c!22872 (and ((_ is Cons!1685) lt!64375) (= (_1!1278 (h!2286 lt!64375)) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!81931 () Option!170)

(assert (=> d!37747 (= (getValueByKey!164 lt!64375 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!81931)))

(declare-fun b!125422 () Bool)

(assert (=> b!125422 (= e!81932 None!168)))

(declare-fun b!125420 () Bool)

(assert (=> b!125420 (= e!81931 e!81932)))

(declare-fun c!22873 () Bool)

(assert (=> b!125420 (= c!22873 (and ((_ is Cons!1685) lt!64375) (not (= (_1!1278 (h!2286 lt!64375)) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125419 () Bool)

(assert (=> b!125419 (= e!81931 (Some!169 (_2!1278 (h!2286 lt!64375))))))

(assert (= (and d!37747 c!22872) b!125419))

(assert (= (and d!37747 (not c!22872)) b!125420))

(assert (= (and b!125420 c!22873) b!125421))

(assert (= (and b!125420 (not c!22873)) b!125422))

(declare-fun m!145787 () Bool)

(assert (=> b!125421 m!145787))

(assert (=> d!37495 d!37747))

(declare-fun d!37749 () Bool)

(assert (=> d!37749 (= (getValueByKey!164 lt!64375 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64581 () Unit!3865)

(assert (=> d!37749 (= lt!64581 (choose!764 lt!64375 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun e!81933 () Bool)

(assert (=> d!37749 e!81933))

(declare-fun res!60708 () Bool)

(assert (=> d!37749 (=> (not res!60708) (not e!81933))))

(assert (=> d!37749 (= res!60708 (isStrictlySorted!311 lt!64375))))

(assert (=> d!37749 (= (lemmaContainsTupThenGetReturnValue!82 lt!64375 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64581)))

(declare-fun b!125423 () Bool)

(declare-fun res!60709 () Bool)

(assert (=> b!125423 (=> (not res!60709) (not e!81933))))

(assert (=> b!125423 (= res!60709 (containsKey!168 lt!64375 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125424 () Bool)

(assert (=> b!125424 (= e!81933 (contains!865 lt!64375 (tuple2!2535 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!37749 res!60708) b!125423))

(assert (= (and b!125423 res!60709) b!125424))

(assert (=> d!37749 m!145099))

(declare-fun m!145789 () Bool)

(assert (=> d!37749 m!145789))

(declare-fun m!145791 () Bool)

(assert (=> d!37749 m!145791))

(declare-fun m!145793 () Bool)

(assert (=> b!125423 m!145793))

(declare-fun m!145795 () Bool)

(assert (=> b!125424 m!145795))

(assert (=> d!37495 d!37749))

(declare-fun b!125425 () Bool)

(declare-fun e!81936 () List!1689)

(declare-fun call!13420 () List!1689)

(assert (=> b!125425 (= e!81936 call!13420)))

(declare-fun bm!13415 () Bool)

(declare-fun call!13418 () List!1689)

(declare-fun call!13419 () List!1689)

(assert (=> bm!13415 (= call!13418 call!13419)))

(declare-fun b!125426 () Bool)

(declare-fun e!81938 () List!1689)

(assert (=> b!125426 (= e!81938 call!13419)))

(declare-fun d!37751 () Bool)

(declare-fun e!81937 () Bool)

(assert (=> d!37751 e!81937))

(declare-fun res!60711 () Bool)

(assert (=> d!37751 (=> (not res!60711) (not e!81937))))

(declare-fun lt!64582 () List!1689)

(assert (=> d!37751 (= res!60711 (isStrictlySorted!311 lt!64582))))

(assert (=> d!37751 (= lt!64582 e!81938)))

(declare-fun c!22875 () Bool)

(assert (=> d!37751 (= c!22875 (and ((_ is Cons!1685) (toList!837 lt!64093)) (bvslt (_1!1278 (h!2286 (toList!837 lt!64093))) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37751 (isStrictlySorted!311 (toList!837 lt!64093))))

(assert (=> d!37751 (= (insertStrictlySorted!85 (toList!837 lt!64093) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64582)))

(declare-fun b!125427 () Bool)

(assert (=> b!125427 (= e!81936 call!13420)))

(declare-fun bm!13416 () Bool)

(declare-fun e!81935 () List!1689)

(assert (=> bm!13416 (= call!13419 ($colon$colon!87 e!81935 (ite c!22875 (h!2286 (toList!837 lt!64093)) (tuple2!2535 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun c!22874 () Bool)

(assert (=> bm!13416 (= c!22874 c!22875)))

(declare-fun b!125428 () Bool)

(declare-fun e!81934 () List!1689)

(assert (=> b!125428 (= e!81938 e!81934)))

(declare-fun c!22876 () Bool)

(assert (=> b!125428 (= c!22876 (and ((_ is Cons!1685) (toList!837 lt!64093)) (= (_1!1278 (h!2286 (toList!837 lt!64093))) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125429 () Bool)

(declare-fun c!22877 () Bool)

(assert (=> b!125429 (= c!22877 (and ((_ is Cons!1685) (toList!837 lt!64093)) (bvsgt (_1!1278 (h!2286 (toList!837 lt!64093))) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> b!125429 (= e!81934 e!81936)))

(declare-fun b!125430 () Bool)

(assert (=> b!125430 (= e!81937 (contains!865 lt!64582 (tuple2!2535 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125431 () Bool)

(assert (=> b!125431 (= e!81935 (insertStrictlySorted!85 (t!6007 (toList!837 lt!64093)) (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125432 () Bool)

(assert (=> b!125432 (= e!81934 call!13418)))

(declare-fun bm!13417 () Bool)

(assert (=> bm!13417 (= call!13420 call!13418)))

(declare-fun b!125433 () Bool)

(declare-fun res!60710 () Bool)

(assert (=> b!125433 (=> (not res!60710) (not e!81937))))

(assert (=> b!125433 (= res!60710 (containsKey!168 lt!64582 (_1!1278 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125434 () Bool)

(assert (=> b!125434 (= e!81935 (ite c!22876 (t!6007 (toList!837 lt!64093)) (ite c!22877 (Cons!1685 (h!2286 (toList!837 lt!64093)) (t!6007 (toList!837 lt!64093))) Nil!1686)))))

(assert (= (and d!37751 c!22875) b!125426))

(assert (= (and d!37751 (not c!22875)) b!125428))

(assert (= (and b!125428 c!22876) b!125432))

(assert (= (and b!125428 (not c!22876)) b!125429))

(assert (= (and b!125429 c!22877) b!125427))

(assert (= (and b!125429 (not c!22877)) b!125425))

(assert (= (or b!125427 b!125425) bm!13417))

(assert (= (or b!125432 bm!13417) bm!13415))

(assert (= (or b!125426 bm!13415) bm!13416))

(assert (= (and bm!13416 c!22874) b!125431))

(assert (= (and bm!13416 (not c!22874)) b!125434))

(assert (= (and d!37751 res!60711) b!125433))

(assert (= (and b!125433 res!60710) b!125430))

(declare-fun m!145797 () Bool)

(assert (=> d!37751 m!145797))

(declare-fun m!145799 () Bool)

(assert (=> d!37751 m!145799))

(declare-fun m!145801 () Bool)

(assert (=> b!125433 m!145801))

(declare-fun m!145803 () Bool)

(assert (=> b!125431 m!145803))

(declare-fun m!145805 () Bool)

(assert (=> b!125430 m!145805))

(declare-fun m!145807 () Bool)

(assert (=> bm!13416 m!145807))

(assert (=> d!37495 d!37751))

(declare-fun b!125435 () Bool)

(declare-fun e!81940 () (_ BitVec 32))

(declare-fun e!81939 () (_ BitVec 32))

(assert (=> b!125435 (= e!81940 e!81939)))

(declare-fun c!22878 () Bool)

(assert (=> b!125435 (= c!22878 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!37753 () Bool)

(declare-fun lt!64583 () (_ BitVec 32))

(assert (=> d!37753 (and (bvsge lt!64583 #b00000000000000000000000000000000) (bvsle lt!64583 (bvsub (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!37753 (= lt!64583 e!81940)))

(declare-fun c!22879 () Bool)

(assert (=> d!37753 (= c!22879 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> d!37753 (and (bvsle #b00000000000000000000000000000000 (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> d!37753 (= (arrayCountValidKeys!0 (_keys!4491 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000000 (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))) lt!64583)))

(declare-fun b!125436 () Bool)

(assert (=> b!125436 (= e!81940 #b00000000000000000000000000000000)))

(declare-fun bm!13418 () Bool)

(declare-fun call!13421 () (_ BitVec 32))

(assert (=> bm!13418 (= call!13421 (arrayCountValidKeys!0 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125437 () Bool)

(assert (=> b!125437 (= e!81939 call!13421)))

(declare-fun b!125438 () Bool)

(assert (=> b!125438 (= e!81939 (bvadd #b00000000000000000000000000000001 call!13421))))

(assert (= (and d!37753 c!22879) b!125436))

(assert (= (and d!37753 (not c!22879)) b!125435))

(assert (= (and b!125435 c!22878) b!125438))

(assert (= (and b!125435 (not c!22878)) b!125437))

(assert (= (or b!125438 b!125437) bm!13418))

(declare-fun m!145809 () Bool)

(assert (=> b!125435 m!145809))

(assert (=> b!125435 m!145809))

(declare-fun m!145811 () Bool)

(assert (=> b!125435 m!145811))

(declare-fun m!145813 () Bool)

(assert (=> bm!13418 m!145813))

(assert (=> b!124817 d!37753))

(declare-fun d!37755 () Bool)

(assert (=> d!37755 (= (isDefined!118 (getValueByKey!164 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))) (not (isEmpty!397 (getValueByKey!164 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))))

(declare-fun bs!5191 () Bool)

(assert (= bs!5191 d!37755))

(assert (=> bs!5191 m!145167))

(declare-fun m!145815 () Bool)

(assert (=> bs!5191 m!145815))

(assert (=> b!125117 d!37755))

(declare-fun e!81942 () Option!170)

(declare-fun b!125441 () Bool)

(assert (=> b!125441 (= e!81942 (getValueByKey!164 (t!6007 (toList!837 call!13319)) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(declare-fun d!37757 () Bool)

(declare-fun c!22880 () Bool)

(assert (=> d!37757 (= c!22880 (and ((_ is Cons!1685) (toList!837 call!13319)) (= (_1!1278 (h!2286 (toList!837 call!13319))) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))))))

(declare-fun e!81941 () Option!170)

(assert (=> d!37757 (= (getValueByKey!164 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))) e!81941)))

(declare-fun b!125442 () Bool)

(assert (=> b!125442 (= e!81942 None!168)))

(declare-fun b!125440 () Bool)

(assert (=> b!125440 (= e!81941 e!81942)))

(declare-fun c!22881 () Bool)

(assert (=> b!125440 (= c!22881 (and ((_ is Cons!1685) (toList!837 call!13319)) (not (= (_1!1278 (h!2286 (toList!837 call!13319))) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))))

(declare-fun b!125439 () Bool)

(assert (=> b!125439 (= e!81941 (Some!169 (_2!1278 (h!2286 (toList!837 call!13319)))))))

(assert (= (and d!37757 c!22880) b!125439))

(assert (= (and d!37757 (not c!22880)) b!125440))

(assert (= (and b!125440 c!22881) b!125441))

(assert (= (and b!125440 (not c!22881)) b!125442))

(declare-fun m!145817 () Bool)

(assert (=> b!125441 m!145817))

(assert (=> b!125117 d!37757))

(declare-fun d!37759 () Bool)

(assert (=> d!37759 (= (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!397 (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5192 () Bool)

(assert (= bs!5192 d!37759))

(assert (=> bs!5192 m!144719))

(declare-fun m!145819 () Bool)

(assert (=> bs!5192 m!145819))

(assert (=> b!125120 d!37759))

(declare-fun b!125445 () Bool)

(declare-fun e!81944 () Option!170)

(assert (=> b!125445 (= e!81944 (getValueByKey!164 (t!6007 (toList!837 lt!64097)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun c!22882 () Bool)

(declare-fun d!37761 () Bool)

(assert (=> d!37761 (= c!22882 (and ((_ is Cons!1685) (toList!837 lt!64097)) (= (_1!1278 (h!2286 (toList!837 lt!64097))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun e!81943 () Option!170)

(assert (=> d!37761 (= (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!81943)))

(declare-fun b!125446 () Bool)

(assert (=> b!125446 (= e!81944 None!168)))

(declare-fun b!125444 () Bool)

(assert (=> b!125444 (= e!81943 e!81944)))

(declare-fun c!22883 () Bool)

(assert (=> b!125444 (= c!22883 (and ((_ is Cons!1685) (toList!837 lt!64097)) (not (= (_1!1278 (h!2286 (toList!837 lt!64097))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!125443 () Bool)

(assert (=> b!125443 (= e!81943 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64097)))))))

(assert (= (and d!37761 c!22882) b!125443))

(assert (= (and d!37761 (not c!22882)) b!125444))

(assert (= (and b!125444 c!22883) b!125445))

(assert (= (and b!125444 (not c!22883)) b!125446))

(assert (=> b!125445 m!144579))

(declare-fun m!145821 () Bool)

(assert (=> b!125445 m!145821))

(assert (=> b!125120 d!37761))

(assert (=> b!125033 d!37423))

(declare-fun bm!13419 () Bool)

(declare-fun call!13428 () ListLongMap!1643)

(declare-fun call!13426 () ListLongMap!1643)

(assert (=> bm!13419 (= call!13428 call!13426)))

(declare-fun b!125447 () Bool)

(declare-fun e!81948 () Bool)

(declare-fun lt!64596 () ListLongMap!1643)

(assert (=> b!125447 (= e!81948 (= (apply!110 lt!64596 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 (_2!1279 lt!64023))))))

(declare-fun b!125448 () Bool)

(declare-fun e!81950 () ListLongMap!1643)

(declare-fun call!13423 () ListLongMap!1643)

(assert (=> b!125448 (= e!81950 call!13423)))

(declare-fun bm!13420 () Bool)

(declare-fun call!13422 () ListLongMap!1643)

(assert (=> bm!13420 (= call!13423 call!13422)))

(declare-fun b!125449 () Bool)

(declare-fun e!81955 () Bool)

(assert (=> b!125449 (= e!81955 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(declare-fun b!125450 () Bool)

(declare-fun e!81957 () Bool)

(assert (=> b!125450 (= e!81957 (= (apply!110 lt!64596 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 (_2!1279 lt!64023))))))

(declare-fun b!125451 () Bool)

(declare-fun e!81952 () Bool)

(assert (=> b!125451 (= e!81952 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(declare-fun d!37763 () Bool)

(declare-fun e!81947 () Bool)

(assert (=> d!37763 e!81947))

(declare-fun res!60714 () Bool)

(assert (=> d!37763 (=> (not res!60714) (not e!81947))))

(assert (=> d!37763 (= res!60714 (or (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))))

(declare-fun lt!64602 () ListLongMap!1643)

(assert (=> d!37763 (= lt!64596 lt!64602)))

(declare-fun lt!64593 () Unit!3865)

(declare-fun e!81951 () Unit!3865)

(assert (=> d!37763 (= lt!64593 e!81951)))

(declare-fun c!22884 () Bool)

(assert (=> d!37763 (= c!22884 e!81955)))

(declare-fun res!60716 () Bool)

(assert (=> d!37763 (=> (not res!60716) (not e!81955))))

(assert (=> d!37763 (= res!60716 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(declare-fun e!81953 () ListLongMap!1643)

(assert (=> d!37763 (= lt!64602 e!81953)))

(declare-fun c!22886 () Bool)

(assert (=> d!37763 (= c!22886 (and (not (= (bvand (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37763 (validMask!0 (mask!7008 (_2!1279 lt!64023)))))

(assert (=> d!37763 (= (getCurrentListMap!507 (_keys!4491 (_2!1279 lt!64023)) (_values!2746 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023)) (extraKeys!2548 (_2!1279 lt!64023)) (zeroValue!2628 (_2!1279 lt!64023)) (minValue!2628 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1279 lt!64023))) lt!64596)))

(declare-fun b!125452 () Bool)

(declare-fun e!81946 () Bool)

(assert (=> b!125452 (= e!81946 (= (apply!110 lt!64596 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (_values!2746 (_2!1279 lt!64023))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 (_2!1279 lt!64023)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (_values!2746 (_2!1279 lt!64023)))))))

(assert (=> b!125452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(declare-fun bm!13421 () Bool)

(declare-fun c!22889 () Bool)

(declare-fun call!13425 () ListLongMap!1643)

(assert (=> bm!13421 (= call!13422 (+!157 (ite c!22886 call!13426 (ite c!22889 call!13428 call!13425)) (ite (or c!22886 c!22889) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (_2!1279 lt!64023))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (_2!1279 lt!64023))))))))

(declare-fun bm!13422 () Bool)

(assert (=> bm!13422 (= call!13425 call!13428)))

(declare-fun b!125453 () Bool)

(declare-fun e!81949 () ListLongMap!1643)

(assert (=> b!125453 (= e!81953 e!81949)))

(assert (=> b!125453 (= c!22889 (and (not (= (bvand (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125454 () Bool)

(declare-fun Unit!3901 () Unit!3865)

(assert (=> b!125454 (= e!81951 Unit!3901)))

(declare-fun b!125455 () Bool)

(declare-fun res!60715 () Bool)

(assert (=> b!125455 (=> (not res!60715) (not e!81947))))

(declare-fun e!81954 () Bool)

(assert (=> b!125455 (= res!60715 e!81954)))

(declare-fun res!60712 () Bool)

(assert (=> b!125455 (=> res!60712 e!81954)))

(assert (=> b!125455 (= res!60712 (not e!81952))))

(declare-fun res!60720 () Bool)

(assert (=> b!125455 (=> (not res!60720) (not e!81952))))

(assert (=> b!125455 (= res!60720 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(declare-fun b!125456 () Bool)

(declare-fun e!81945 () Bool)

(assert (=> b!125456 (= e!81945 e!81948)))

(declare-fun res!60719 () Bool)

(declare-fun call!13427 () Bool)

(assert (=> b!125456 (= res!60719 call!13427)))

(assert (=> b!125456 (=> (not res!60719) (not e!81948))))

(declare-fun bm!13423 () Bool)

(declare-fun call!13424 () Bool)

(assert (=> bm!13423 (= call!13424 (contains!863 lt!64596 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125457 () Bool)

(assert (=> b!125457 (= e!81949 call!13423)))

(declare-fun bm!13424 () Bool)

(assert (=> bm!13424 (= call!13426 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (_2!1279 lt!64023)) (_values!2746 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023)) (extraKeys!2548 (_2!1279 lt!64023)) (zeroValue!2628 (_2!1279 lt!64023)) (minValue!2628 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1279 lt!64023))))))

(declare-fun b!125458 () Bool)

(declare-fun res!60718 () Bool)

(assert (=> b!125458 (=> (not res!60718) (not e!81947))))

(assert (=> b!125458 (= res!60718 e!81945)))

(declare-fun c!22887 () Bool)

(assert (=> b!125458 (= c!22887 (not (= (bvand (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125459 () Bool)

(declare-fun e!81956 () Bool)

(assert (=> b!125459 (= e!81956 (not call!13424))))

(declare-fun b!125460 () Bool)

(assert (=> b!125460 (= e!81947 e!81956)))

(declare-fun c!22888 () Bool)

(assert (=> b!125460 (= c!22888 (not (= (bvand (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125461 () Bool)

(assert (=> b!125461 (= e!81950 call!13425)))

(declare-fun b!125462 () Bool)

(assert (=> b!125462 (= e!81953 (+!157 call!13422 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (_2!1279 lt!64023)))))))

(declare-fun b!125463 () Bool)

(assert (=> b!125463 (= e!81956 e!81957)))

(declare-fun res!60717 () Bool)

(assert (=> b!125463 (= res!60717 call!13424)))

(assert (=> b!125463 (=> (not res!60717) (not e!81957))))

(declare-fun b!125464 () Bool)

(declare-fun lt!64598 () Unit!3865)

(assert (=> b!125464 (= e!81951 lt!64598)))

(declare-fun lt!64599 () ListLongMap!1643)

(assert (=> b!125464 (= lt!64599 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (_2!1279 lt!64023)) (_values!2746 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023)) (extraKeys!2548 (_2!1279 lt!64023)) (zeroValue!2628 (_2!1279 lt!64023)) (minValue!2628 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1279 lt!64023))))))

(declare-fun lt!64601 () (_ BitVec 64))

(assert (=> b!125464 (= lt!64601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64586 () (_ BitVec 64))

(assert (=> b!125464 (= lt!64586 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000))))

(declare-fun lt!64585 () Unit!3865)

(assert (=> b!125464 (= lt!64585 (addStillContains!86 lt!64599 lt!64601 (zeroValue!2628 (_2!1279 lt!64023)) lt!64586))))

(assert (=> b!125464 (contains!863 (+!157 lt!64599 (tuple2!2535 lt!64601 (zeroValue!2628 (_2!1279 lt!64023)))) lt!64586)))

(declare-fun lt!64595 () Unit!3865)

(assert (=> b!125464 (= lt!64595 lt!64585)))

(declare-fun lt!64592 () ListLongMap!1643)

(assert (=> b!125464 (= lt!64592 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (_2!1279 lt!64023)) (_values!2746 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023)) (extraKeys!2548 (_2!1279 lt!64023)) (zeroValue!2628 (_2!1279 lt!64023)) (minValue!2628 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1279 lt!64023))))))

(declare-fun lt!64584 () (_ BitVec 64))

(assert (=> b!125464 (= lt!64584 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64604 () (_ BitVec 64))

(assert (=> b!125464 (= lt!64604 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000))))

(declare-fun lt!64587 () Unit!3865)

(assert (=> b!125464 (= lt!64587 (addApplyDifferent!86 lt!64592 lt!64584 (minValue!2628 (_2!1279 lt!64023)) lt!64604))))

(assert (=> b!125464 (= (apply!110 (+!157 lt!64592 (tuple2!2535 lt!64584 (minValue!2628 (_2!1279 lt!64023)))) lt!64604) (apply!110 lt!64592 lt!64604))))

(declare-fun lt!64589 () Unit!3865)

(assert (=> b!125464 (= lt!64589 lt!64587)))

(declare-fun lt!64605 () ListLongMap!1643)

(assert (=> b!125464 (= lt!64605 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (_2!1279 lt!64023)) (_values!2746 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023)) (extraKeys!2548 (_2!1279 lt!64023)) (zeroValue!2628 (_2!1279 lt!64023)) (minValue!2628 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1279 lt!64023))))))

(declare-fun lt!64588 () (_ BitVec 64))

(assert (=> b!125464 (= lt!64588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64603 () (_ BitVec 64))

(assert (=> b!125464 (= lt!64603 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000))))

(declare-fun lt!64597 () Unit!3865)

(assert (=> b!125464 (= lt!64597 (addApplyDifferent!86 lt!64605 lt!64588 (zeroValue!2628 (_2!1279 lt!64023)) lt!64603))))

(assert (=> b!125464 (= (apply!110 (+!157 lt!64605 (tuple2!2535 lt!64588 (zeroValue!2628 (_2!1279 lt!64023)))) lt!64603) (apply!110 lt!64605 lt!64603))))

(declare-fun lt!64594 () Unit!3865)

(assert (=> b!125464 (= lt!64594 lt!64597)))

(declare-fun lt!64590 () ListLongMap!1643)

(assert (=> b!125464 (= lt!64590 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (_2!1279 lt!64023)) (_values!2746 (_2!1279 lt!64023)) (mask!7008 (_2!1279 lt!64023)) (extraKeys!2548 (_2!1279 lt!64023)) (zeroValue!2628 (_2!1279 lt!64023)) (minValue!2628 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (defaultEntry!2763 (_2!1279 lt!64023))))))

(declare-fun lt!64600 () (_ BitVec 64))

(assert (=> b!125464 (= lt!64600 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64591 () (_ BitVec 64))

(assert (=> b!125464 (= lt!64591 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000))))

(assert (=> b!125464 (= lt!64598 (addApplyDifferent!86 lt!64590 lt!64600 (minValue!2628 (_2!1279 lt!64023)) lt!64591))))

(assert (=> b!125464 (= (apply!110 (+!157 lt!64590 (tuple2!2535 lt!64600 (minValue!2628 (_2!1279 lt!64023)))) lt!64591) (apply!110 lt!64590 lt!64591))))

(declare-fun b!125465 () Bool)

(assert (=> b!125465 (= e!81945 (not call!13427))))

(declare-fun bm!13425 () Bool)

(assert (=> bm!13425 (= call!13427 (contains!863 lt!64596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125466 () Bool)

(assert (=> b!125466 (= e!81954 e!81946)))

(declare-fun res!60713 () Bool)

(assert (=> b!125466 (=> (not res!60713) (not e!81946))))

(assert (=> b!125466 (= res!60713 (contains!863 lt!64596 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(assert (=> b!125466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(declare-fun b!125467 () Bool)

(declare-fun c!22885 () Bool)

(assert (=> b!125467 (= c!22885 (and (not (= (bvand (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125467 (= e!81949 e!81950)))

(assert (= (and d!37763 c!22886) b!125462))

(assert (= (and d!37763 (not c!22886)) b!125453))

(assert (= (and b!125453 c!22889) b!125457))

(assert (= (and b!125453 (not c!22889)) b!125467))

(assert (= (and b!125467 c!22885) b!125448))

(assert (= (and b!125467 (not c!22885)) b!125461))

(assert (= (or b!125448 b!125461) bm!13422))

(assert (= (or b!125457 bm!13422) bm!13419))

(assert (= (or b!125457 b!125448) bm!13420))

(assert (= (or b!125462 bm!13419) bm!13424))

(assert (= (or b!125462 bm!13420) bm!13421))

(assert (= (and d!37763 res!60716) b!125449))

(assert (= (and d!37763 c!22884) b!125464))

(assert (= (and d!37763 (not c!22884)) b!125454))

(assert (= (and d!37763 res!60714) b!125455))

(assert (= (and b!125455 res!60720) b!125451))

(assert (= (and b!125455 (not res!60712)) b!125466))

(assert (= (and b!125466 res!60713) b!125452))

(assert (= (and b!125455 res!60715) b!125458))

(assert (= (and b!125458 c!22887) b!125456))

(assert (= (and b!125458 (not c!22887)) b!125465))

(assert (= (and b!125456 res!60719) b!125447))

(assert (= (or b!125456 b!125465) bm!13425))

(assert (= (and b!125458 res!60718) b!125460))

(assert (= (and b!125460 c!22888) b!125463))

(assert (= (and b!125460 (not c!22888)) b!125459))

(assert (= (and b!125463 res!60717) b!125450))

(assert (= (or b!125463 b!125459) bm!13423))

(declare-fun b_lambda!5495 () Bool)

(assert (=> (not b_lambda!5495) (not b!125452)))

(declare-fun t!6023 () Bool)

(declare-fun tb!2297 () Bool)

(assert (=> (and b!124442 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 (_2!1279 lt!64023))) t!6023) tb!2297))

(declare-fun result!3819 () Bool)

(assert (=> tb!2297 (= result!3819 tp_is_empty!2833)))

(assert (=> b!125452 t!6023))

(declare-fun b_and!7693 () Bool)

(assert (= b_and!7689 (and (=> t!6023 result!3819) b_and!7693)))

(declare-fun tb!2299 () Bool)

(declare-fun t!6025 () Bool)

(assert (=> (and b!124445 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (_2!1279 lt!64023))) t!6025) tb!2299))

(declare-fun result!3821 () Bool)

(assert (= result!3821 result!3819))

(assert (=> b!125452 t!6025))

(declare-fun b_and!7695 () Bool)

(assert (= b_and!7691 (and (=> t!6025 result!3821) b_and!7695)))

(assert (=> b!125466 m!145187))

(assert (=> b!125466 m!145187))

(declare-fun m!145823 () Bool)

(assert (=> b!125466 m!145823))

(declare-fun m!145825 () Bool)

(assert (=> b!125447 m!145825))

(declare-fun m!145827 () Bool)

(assert (=> b!125450 m!145827))

(assert (=> b!125451 m!145187))

(assert (=> b!125451 m!145187))

(assert (=> b!125451 m!145189))

(declare-fun m!145829 () Bool)

(assert (=> bm!13423 m!145829))

(declare-fun m!145831 () Bool)

(assert (=> bm!13421 m!145831))

(declare-fun m!145833 () Bool)

(assert (=> b!125452 m!145833))

(declare-fun m!145835 () Bool)

(assert (=> b!125452 m!145835))

(assert (=> b!125452 m!145833))

(declare-fun m!145837 () Bool)

(assert (=> b!125452 m!145837))

(assert (=> b!125452 m!145187))

(assert (=> b!125452 m!145835))

(assert (=> b!125452 m!145187))

(declare-fun m!145839 () Bool)

(assert (=> b!125452 m!145839))

(declare-fun m!145841 () Bool)

(assert (=> bm!13425 m!145841))

(assert (=> b!125449 m!145187))

(assert (=> b!125449 m!145187))

(assert (=> b!125449 m!145189))

(declare-fun m!145843 () Bool)

(assert (=> b!125462 m!145843))

(declare-fun m!145845 () Bool)

(assert (=> bm!13424 m!145845))

(declare-fun m!145847 () Bool)

(assert (=> b!125464 m!145847))

(declare-fun m!145849 () Bool)

(assert (=> b!125464 m!145849))

(declare-fun m!145851 () Bool)

(assert (=> b!125464 m!145851))

(declare-fun m!145853 () Bool)

(assert (=> b!125464 m!145853))

(assert (=> b!125464 m!145845))

(assert (=> b!125464 m!145849))

(declare-fun m!145855 () Bool)

(assert (=> b!125464 m!145855))

(declare-fun m!145857 () Bool)

(assert (=> b!125464 m!145857))

(declare-fun m!145859 () Bool)

(assert (=> b!125464 m!145859))

(declare-fun m!145861 () Bool)

(assert (=> b!125464 m!145861))

(declare-fun m!145863 () Bool)

(assert (=> b!125464 m!145863))

(assert (=> b!125464 m!145187))

(declare-fun m!145865 () Bool)

(assert (=> b!125464 m!145865))

(declare-fun m!145867 () Bool)

(assert (=> b!125464 m!145867))

(declare-fun m!145869 () Bool)

(assert (=> b!125464 m!145869))

(declare-fun m!145871 () Bool)

(assert (=> b!125464 m!145871))

(assert (=> b!125464 m!145869))

(assert (=> b!125464 m!145857))

(declare-fun m!145873 () Bool)

(assert (=> b!125464 m!145873))

(assert (=> b!125464 m!145861))

(declare-fun m!145875 () Bool)

(assert (=> b!125464 m!145875))

(declare-fun m!145877 () Bool)

(assert (=> d!37763 m!145877))

(assert (=> d!37511 d!37763))

(declare-fun d!37765 () Bool)

(declare-fun res!60721 () Bool)

(declare-fun e!81958 () Bool)

(assert (=> d!37765 (=> res!60721 e!81958)))

(assert (=> d!37765 (= res!60721 (and ((_ is Cons!1685) (toList!837 lt!64097)) (= (_1!1278 (h!2286 (toList!837 lt!64097))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37765 (= (containsKey!168 (toList!837 lt!64097) #b0000000000000000000000000000000000000000000000000000000000000000) e!81958)))

(declare-fun b!125468 () Bool)

(declare-fun e!81959 () Bool)

(assert (=> b!125468 (= e!81958 e!81959)))

(declare-fun res!60722 () Bool)

(assert (=> b!125468 (=> (not res!60722) (not e!81959))))

(assert (=> b!125468 (= res!60722 (and (or (not ((_ is Cons!1685) (toList!837 lt!64097))) (bvsle (_1!1278 (h!2286 (toList!837 lt!64097))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1685) (toList!837 lt!64097)) (bvslt (_1!1278 (h!2286 (toList!837 lt!64097))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125469 () Bool)

(assert (=> b!125469 (= e!81959 (containsKey!168 (t!6007 (toList!837 lt!64097)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37765 (not res!60721)) b!125468))

(assert (= (and b!125468 res!60722) b!125469))

(declare-fun m!145879 () Bool)

(assert (=> b!125469 m!145879))

(assert (=> d!37507 d!37765))

(declare-fun d!37767 () Bool)

(assert (=> d!37767 (= (apply!110 lt!64131 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1439 (getValueByKey!164 (toList!837 lt!64131) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5193 () Bool)

(assert (= bs!5193 d!37767))

(assert (=> bs!5193 m!145717))

(assert (=> bs!5193 m!145717))

(declare-fun m!145881 () Bool)

(assert (=> bs!5193 m!145881))

(assert (=> b!124792 d!37767))

(declare-fun d!37769 () Bool)

(declare-fun e!81960 () Bool)

(assert (=> d!37769 e!81960))

(declare-fun res!60724 () Bool)

(assert (=> d!37769 (=> (not res!60724) (not e!81960))))

(declare-fun lt!64609 () ListLongMap!1643)

(assert (=> d!37769 (= res!60724 (contains!863 lt!64609 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64607 () List!1689)

(assert (=> d!37769 (= lt!64609 (ListLongMap!1644 lt!64607))))

(declare-fun lt!64608 () Unit!3865)

(declare-fun lt!64606 () Unit!3865)

(assert (=> d!37769 (= lt!64608 lt!64606)))

(assert (=> d!37769 (= (getValueByKey!164 lt!64607 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37769 (= lt!64606 (lemmaContainsTupThenGetReturnValue!82 lt!64607 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37769 (= lt!64607 (insertStrictlySorted!85 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37769 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64609)))

(declare-fun b!125470 () Bool)

(declare-fun res!60723 () Bool)

(assert (=> b!125470 (=> (not res!60723) (not e!81960))))

(assert (=> b!125470 (= res!60723 (= (getValueByKey!164 (toList!837 lt!64609) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125471 () Bool)

(assert (=> b!125471 (= e!81960 (contains!865 (toList!837 lt!64609) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37769 res!60724) b!125470))

(assert (= (and b!125470 res!60723) b!125471))

(declare-fun m!145883 () Bool)

(assert (=> d!37769 m!145883))

(declare-fun m!145885 () Bool)

(assert (=> d!37769 m!145885))

(declare-fun m!145887 () Bool)

(assert (=> d!37769 m!145887))

(declare-fun m!145889 () Bool)

(assert (=> d!37769 m!145889))

(declare-fun m!145891 () Bool)

(assert (=> b!125470 m!145891))

(declare-fun m!145893 () Bool)

(assert (=> b!125471 m!145893))

(assert (=> d!37455 d!37769))

(assert (=> d!37455 d!37421))

(declare-fun d!37771 () Bool)

(assert (=> d!37771 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> d!37771 true))

(declare-fun _$8!106 () Unit!3865)

(assert (=> d!37771 (= (choose!758 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) _$8!106)))

(declare-fun bs!5194 () Bool)

(assert (= bs!5194 d!37771))

(assert (=> bs!5194 m!144527))

(assert (=> bs!5194 m!144527))

(assert (=> bs!5194 m!144941))

(assert (=> bs!5194 m!144419))

(assert (=> bs!5194 m!144945))

(assert (=> d!37455 d!37771))

(assert (=> d!37455 d!37533))

(declare-fun bm!13426 () Bool)

(declare-fun call!13435 () ListLongMap!1643)

(declare-fun call!13433 () ListLongMap!1643)

(assert (=> bm!13426 (= call!13435 call!13433)))

(declare-fun b!125472 () Bool)

(declare-fun e!81964 () Bool)

(declare-fun lt!64622 () ListLongMap!1643)

(assert (=> b!125472 (= e!81964 (= (apply!110 lt!64622 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125473 () Bool)

(declare-fun e!81966 () ListLongMap!1643)

(declare-fun call!13430 () ListLongMap!1643)

(assert (=> b!125473 (= e!81966 call!13430)))

(declare-fun bm!13427 () Bool)

(declare-fun call!13429 () ListLongMap!1643)

(assert (=> bm!13427 (= call!13430 call!13429)))

(declare-fun b!125474 () Bool)

(declare-fun e!81971 () Bool)

(assert (=> b!125474 (= e!81971 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125475 () Bool)

(declare-fun e!81973 () Bool)

(assert (=> b!125475 (= e!81973 (= (apply!110 lt!64622 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125476 () Bool)

(declare-fun e!81968 () Bool)

(assert (=> b!125476 (= e!81968 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37773 () Bool)

(declare-fun e!81963 () Bool)

(assert (=> d!37773 e!81963))

(declare-fun res!60727 () Bool)

(assert (=> d!37773 (=> (not res!60727) (not e!81963))))

(assert (=> d!37773 (= res!60727 (or (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun lt!64628 () ListLongMap!1643)

(assert (=> d!37773 (= lt!64622 lt!64628)))

(declare-fun lt!64619 () Unit!3865)

(declare-fun e!81967 () Unit!3865)

(assert (=> d!37773 (= lt!64619 e!81967)))

(declare-fun c!22890 () Bool)

(assert (=> d!37773 (= c!22890 e!81971)))

(declare-fun res!60729 () Bool)

(assert (=> d!37773 (=> (not res!60729) (not e!81971))))

(assert (=> d!37773 (= res!60729 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun e!81969 () ListLongMap!1643)

(assert (=> d!37773 (= lt!64628 e!81969)))

(declare-fun c!22892 () Bool)

(assert (=> d!37773 (= c!22892 (and (not (= (bvand lt!64040 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!64040 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37773 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37773 (= (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64622)))

(declare-fun b!125477 () Bool)

(declare-fun e!81962 () Bool)

(assert (=> b!125477 (= e!81962 (= (apply!110 lt!64622 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (_values!2746 newMap!16))))))

(assert (=> b!125477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun call!13432 () ListLongMap!1643)

(declare-fun bm!13428 () Bool)

(declare-fun c!22895 () Bool)

(assert (=> bm!13428 (= call!13429 (+!157 (ite c!22892 call!13433 (ite c!22895 call!13435 call!13432)) (ite (or c!22892 c!22895) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13429 () Bool)

(assert (=> bm!13429 (= call!13432 call!13435)))

(declare-fun b!125478 () Bool)

(declare-fun e!81965 () ListLongMap!1643)

(assert (=> b!125478 (= e!81969 e!81965)))

(assert (=> b!125478 (= c!22895 (and (not (= (bvand lt!64040 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!64040 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125479 () Bool)

(declare-fun Unit!3902 () Unit!3865)

(assert (=> b!125479 (= e!81967 Unit!3902)))

(declare-fun b!125480 () Bool)

(declare-fun res!60728 () Bool)

(assert (=> b!125480 (=> (not res!60728) (not e!81963))))

(declare-fun e!81970 () Bool)

(assert (=> b!125480 (= res!60728 e!81970)))

(declare-fun res!60725 () Bool)

(assert (=> b!125480 (=> res!60725 e!81970)))

(assert (=> b!125480 (= res!60725 (not e!81968))))

(declare-fun res!60733 () Bool)

(assert (=> b!125480 (=> (not res!60733) (not e!81968))))

(assert (=> b!125480 (= res!60733 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125481 () Bool)

(declare-fun e!81961 () Bool)

(assert (=> b!125481 (= e!81961 e!81964)))

(declare-fun res!60732 () Bool)

(declare-fun call!13434 () Bool)

(assert (=> b!125481 (= res!60732 call!13434)))

(assert (=> b!125481 (=> (not res!60732) (not e!81964))))

(declare-fun bm!13430 () Bool)

(declare-fun call!13431 () Bool)

(assert (=> bm!13430 (= call!13431 (contains!863 lt!64622 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125482 () Bool)

(assert (=> b!125482 (= e!81965 call!13430)))

(declare-fun bm!13431 () Bool)

(assert (=> bm!13431 (= call!13433 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125483 () Bool)

(declare-fun res!60731 () Bool)

(assert (=> b!125483 (=> (not res!60731) (not e!81963))))

(assert (=> b!125483 (= res!60731 e!81961)))

(declare-fun c!22893 () Bool)

(assert (=> b!125483 (= c!22893 (not (= (bvand lt!64040 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125484 () Bool)

(declare-fun e!81972 () Bool)

(assert (=> b!125484 (= e!81972 (not call!13431))))

(declare-fun b!125485 () Bool)

(assert (=> b!125485 (= e!81963 e!81972)))

(declare-fun c!22894 () Bool)

(assert (=> b!125485 (= c!22894 (not (= (bvand lt!64040 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125486 () Bool)

(assert (=> b!125486 (= e!81966 call!13432)))

(declare-fun b!125487 () Bool)

(assert (=> b!125487 (= e!81969 (+!157 call!13429 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125488 () Bool)

(assert (=> b!125488 (= e!81972 e!81973)))

(declare-fun res!60730 () Bool)

(assert (=> b!125488 (= res!60730 call!13431)))

(assert (=> b!125488 (=> (not res!60730) (not e!81973))))

(declare-fun b!125489 () Bool)

(declare-fun lt!64624 () Unit!3865)

(assert (=> b!125489 (= e!81967 lt!64624)))

(declare-fun lt!64625 () ListLongMap!1643)

(assert (=> b!125489 (= lt!64625 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64627 () (_ BitVec 64))

(assert (=> b!125489 (= lt!64627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64612 () (_ BitVec 64))

(assert (=> b!125489 (= lt!64612 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64611 () Unit!3865)

(assert (=> b!125489 (= lt!64611 (addStillContains!86 lt!64625 lt!64627 (zeroValue!2628 newMap!16) lt!64612))))

(assert (=> b!125489 (contains!863 (+!157 lt!64625 (tuple2!2535 lt!64627 (zeroValue!2628 newMap!16))) lt!64612)))

(declare-fun lt!64621 () Unit!3865)

(assert (=> b!125489 (= lt!64621 lt!64611)))

(declare-fun lt!64618 () ListLongMap!1643)

(assert (=> b!125489 (= lt!64618 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64610 () (_ BitVec 64))

(assert (=> b!125489 (= lt!64610 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64630 () (_ BitVec 64))

(assert (=> b!125489 (= lt!64630 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64613 () Unit!3865)

(assert (=> b!125489 (= lt!64613 (addApplyDifferent!86 lt!64618 lt!64610 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64630))))

(assert (=> b!125489 (= (apply!110 (+!157 lt!64618 (tuple2!2535 lt!64610 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64630) (apply!110 lt!64618 lt!64630))))

(declare-fun lt!64615 () Unit!3865)

(assert (=> b!125489 (= lt!64615 lt!64613)))

(declare-fun lt!64631 () ListLongMap!1643)

(assert (=> b!125489 (= lt!64631 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64614 () (_ BitVec 64))

(assert (=> b!125489 (= lt!64614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64629 () (_ BitVec 64))

(assert (=> b!125489 (= lt!64629 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64623 () Unit!3865)

(assert (=> b!125489 (= lt!64623 (addApplyDifferent!86 lt!64631 lt!64614 (zeroValue!2628 newMap!16) lt!64629))))

(assert (=> b!125489 (= (apply!110 (+!157 lt!64631 (tuple2!2535 lt!64614 (zeroValue!2628 newMap!16))) lt!64629) (apply!110 lt!64631 lt!64629))))

(declare-fun lt!64620 () Unit!3865)

(assert (=> b!125489 (= lt!64620 lt!64623)))

(declare-fun lt!64616 () ListLongMap!1643)

(assert (=> b!125489 (= lt!64616 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64040 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64626 () (_ BitVec 64))

(assert (=> b!125489 (= lt!64626 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64617 () (_ BitVec 64))

(assert (=> b!125489 (= lt!64617 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125489 (= lt!64624 (addApplyDifferent!86 lt!64616 lt!64626 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64617))))

(assert (=> b!125489 (= (apply!110 (+!157 lt!64616 (tuple2!2535 lt!64626 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64617) (apply!110 lt!64616 lt!64617))))

(declare-fun b!125490 () Bool)

(assert (=> b!125490 (= e!81961 (not call!13434))))

(declare-fun bm!13432 () Bool)

(assert (=> bm!13432 (= call!13434 (contains!863 lt!64622 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125491 () Bool)

(assert (=> b!125491 (= e!81970 e!81962)))

(declare-fun res!60726 () Bool)

(assert (=> b!125491 (=> (not res!60726) (not e!81962))))

(assert (=> b!125491 (= res!60726 (contains!863 lt!64622 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125492 () Bool)

(declare-fun c!22891 () Bool)

(assert (=> b!125492 (= c!22891 (and (not (= (bvand lt!64040 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!64040 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125492 (= e!81965 e!81966)))

(assert (= (and d!37773 c!22892) b!125487))

(assert (= (and d!37773 (not c!22892)) b!125478))

(assert (= (and b!125478 c!22895) b!125482))

(assert (= (and b!125478 (not c!22895)) b!125492))

(assert (= (and b!125492 c!22891) b!125473))

(assert (= (and b!125492 (not c!22891)) b!125486))

(assert (= (or b!125473 b!125486) bm!13429))

(assert (= (or b!125482 bm!13429) bm!13426))

(assert (= (or b!125482 b!125473) bm!13427))

(assert (= (or b!125487 bm!13426) bm!13431))

(assert (= (or b!125487 bm!13427) bm!13428))

(assert (= (and d!37773 res!60729) b!125474))

(assert (= (and d!37773 c!22890) b!125489))

(assert (= (and d!37773 (not c!22890)) b!125479))

(assert (= (and d!37773 res!60727) b!125480))

(assert (= (and b!125480 res!60733) b!125476))

(assert (= (and b!125480 (not res!60725)) b!125491))

(assert (= (and b!125491 res!60726) b!125477))

(assert (= (and b!125480 res!60728) b!125483))

(assert (= (and b!125483 c!22893) b!125481))

(assert (= (and b!125483 (not c!22893)) b!125490))

(assert (= (and b!125481 res!60732) b!125472))

(assert (= (or b!125481 b!125490) bm!13432))

(assert (= (and b!125483 res!60731) b!125485))

(assert (= (and b!125485 c!22894) b!125488))

(assert (= (and b!125485 (not c!22894)) b!125484))

(assert (= (and b!125488 res!60730) b!125475))

(assert (= (or b!125488 b!125484) bm!13430))

(declare-fun b_lambda!5497 () Bool)

(assert (=> (not b_lambda!5497) (not b!125477)))

(assert (=> b!125477 t!6019))

(declare-fun b_and!7697 () Bool)

(assert (= b_and!7693 (and (=> t!6019 result!3815) b_and!7697)))

(assert (=> b!125477 t!6021))

(declare-fun b_and!7699 () Bool)

(assert (= b_and!7695 (and (=> t!6021 result!3817) b_and!7699)))

(assert (=> b!125491 m!144651))

(assert (=> b!125491 m!144651))

(declare-fun m!145895 () Bool)

(assert (=> b!125491 m!145895))

(declare-fun m!145897 () Bool)

(assert (=> b!125472 m!145897))

(declare-fun m!145899 () Bool)

(assert (=> b!125475 m!145899))

(assert (=> b!125476 m!144651))

(assert (=> b!125476 m!144651))

(assert (=> b!125476 m!144659))

(declare-fun m!145901 () Bool)

(assert (=> bm!13430 m!145901))

(declare-fun m!145903 () Bool)

(assert (=> bm!13428 m!145903))

(assert (=> b!125477 m!144665))

(assert (=> b!125477 m!144757))

(assert (=> b!125477 m!144665))

(assert (=> b!125477 m!144759))

(assert (=> b!125477 m!144651))

(assert (=> b!125477 m!144757))

(assert (=> b!125477 m!144651))

(declare-fun m!145905 () Bool)

(assert (=> b!125477 m!145905))

(declare-fun m!145907 () Bool)

(assert (=> bm!13432 m!145907))

(assert (=> b!125474 m!144651))

(assert (=> b!125474 m!144651))

(assert (=> b!125474 m!144659))

(declare-fun m!145909 () Bool)

(assert (=> b!125487 m!145909))

(assert (=> bm!13431 m!144419))

(declare-fun m!145911 () Bool)

(assert (=> bm!13431 m!145911))

(declare-fun m!145913 () Bool)

(assert (=> b!125489 m!145913))

(declare-fun m!145915 () Bool)

(assert (=> b!125489 m!145915))

(declare-fun m!145917 () Bool)

(assert (=> b!125489 m!145917))

(declare-fun m!145919 () Bool)

(assert (=> b!125489 m!145919))

(assert (=> b!125489 m!144419))

(assert (=> b!125489 m!145911))

(assert (=> b!125489 m!145915))

(declare-fun m!145921 () Bool)

(assert (=> b!125489 m!145921))

(declare-fun m!145923 () Bool)

(assert (=> b!125489 m!145923))

(declare-fun m!145925 () Bool)

(assert (=> b!125489 m!145925))

(declare-fun m!145927 () Bool)

(assert (=> b!125489 m!145927))

(assert (=> b!125489 m!144419))

(declare-fun m!145929 () Bool)

(assert (=> b!125489 m!145929))

(assert (=> b!125489 m!144651))

(assert (=> b!125489 m!144419))

(declare-fun m!145931 () Bool)

(assert (=> b!125489 m!145931))

(declare-fun m!145933 () Bool)

(assert (=> b!125489 m!145933))

(declare-fun m!145935 () Bool)

(assert (=> b!125489 m!145935))

(declare-fun m!145937 () Bool)

(assert (=> b!125489 m!145937))

(assert (=> b!125489 m!145935))

(assert (=> b!125489 m!145923))

(declare-fun m!145939 () Bool)

(assert (=> b!125489 m!145939))

(assert (=> b!125489 m!145927))

(declare-fun m!145941 () Bool)

(assert (=> b!125489 m!145941))

(assert (=> d!37773 m!144709))

(assert (=> d!37455 d!37773))

(declare-fun d!37775 () Bool)

(declare-fun e!81974 () Bool)

(assert (=> d!37775 e!81974))

(declare-fun res!60734 () Bool)

(assert (=> d!37775 (=> res!60734 e!81974)))

(declare-fun lt!64632 () Bool)

(assert (=> d!37775 (= res!60734 (not lt!64632))))

(declare-fun lt!64635 () Bool)

(assert (=> d!37775 (= lt!64632 lt!64635)))

(declare-fun lt!64634 () Unit!3865)

(declare-fun e!81975 () Unit!3865)

(assert (=> d!37775 (= lt!64634 e!81975)))

(declare-fun c!22896 () Bool)

(assert (=> d!37775 (= c!22896 lt!64635)))

(assert (=> d!37775 (= lt!64635 (containsKey!168 (toList!837 lt!64131) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!37775 (= (contains!863 lt!64131 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) lt!64632)))

(declare-fun b!125493 () Bool)

(declare-fun lt!64633 () Unit!3865)

(assert (=> b!125493 (= e!81975 lt!64633)))

(assert (=> b!125493 (= lt!64633 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64131) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125493 (isDefined!118 (getValueByKey!164 (toList!837 lt!64131) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125494 () Bool)

(declare-fun Unit!3903 () Unit!3865)

(assert (=> b!125494 (= e!81975 Unit!3903)))

(declare-fun b!125495 () Bool)

(assert (=> b!125495 (= e!81974 (isDefined!118 (getValueByKey!164 (toList!837 lt!64131) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!37775 c!22896) b!125493))

(assert (= (and d!37775 (not c!22896)) b!125494))

(assert (= (and d!37775 (not res!60734)) b!125495))

(assert (=> d!37775 m!144651))

(declare-fun m!145943 () Bool)

(assert (=> d!37775 m!145943))

(assert (=> b!125493 m!144651))

(declare-fun m!145945 () Bool)

(assert (=> b!125493 m!145945))

(assert (=> b!125493 m!144651))

(declare-fun m!145947 () Bool)

(assert (=> b!125493 m!145947))

(assert (=> b!125493 m!145947))

(declare-fun m!145949 () Bool)

(assert (=> b!125493 m!145949))

(assert (=> b!125495 m!144651))

(assert (=> b!125495 m!145947))

(assert (=> b!125495 m!145947))

(assert (=> b!125495 m!145949))

(assert (=> b!124808 d!37775))

(declare-fun lt!64636 () Bool)

(declare-fun d!37777 () Bool)

(assert (=> d!37777 (= lt!64636 (select (content!123 (toList!837 lt!64381)) (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun e!81976 () Bool)

(assert (=> d!37777 (= lt!64636 e!81976)))

(declare-fun res!60736 () Bool)

(assert (=> d!37777 (=> (not res!60736) (not e!81976))))

(assert (=> d!37777 (= res!60736 ((_ is Cons!1685) (toList!837 lt!64381)))))

(assert (=> d!37777 (= (contains!865 (toList!837 lt!64381) (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64636)))

(declare-fun b!125496 () Bool)

(declare-fun e!81977 () Bool)

(assert (=> b!125496 (= e!81976 e!81977)))

(declare-fun res!60735 () Bool)

(assert (=> b!125496 (=> res!60735 e!81977)))

(assert (=> b!125496 (= res!60735 (= (h!2286 (toList!837 lt!64381)) (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125497 () Bool)

(assert (=> b!125497 (= e!81977 (contains!865 (t!6007 (toList!837 lt!64381)) (tuple2!2535 lt!64102 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37777 res!60736) b!125496))

(assert (= (and b!125496 (not res!60735)) b!125497))

(declare-fun m!145951 () Bool)

(assert (=> d!37777 m!145951))

(declare-fun m!145953 () Bool)

(assert (=> d!37777 m!145953))

(declare-fun m!145955 () Bool)

(assert (=> b!125497 m!145955))

(assert (=> b!125096 d!37777))

(declare-fun d!37779 () Bool)

(assert (=> d!37779 (= (inRange!0 (ite c!22725 (index!3242 lt!64172) (index!3245 lt!64172)) (mask!7008 newMap!16)) (and (bvsge (ite c!22725 (index!3242 lt!64172) (index!3245 lt!64172)) #b00000000000000000000000000000000) (bvslt (ite c!22725 (index!3242 lt!64172) (index!3245 lt!64172)) (bvadd (mask!7008 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13360 d!37779))

(assert (=> d!37409 d!37533))

(declare-fun lt!64637 () Bool)

(declare-fun d!37781 () Bool)

(assert (=> d!37781 (= lt!64637 (select (content!123 (toList!837 lt!64118)) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!81978 () Bool)

(assert (=> d!37781 (= lt!64637 e!81978)))

(declare-fun res!60738 () Bool)

(assert (=> d!37781 (=> (not res!60738) (not e!81978))))

(assert (=> d!37781 (= res!60738 ((_ is Cons!1685) (toList!837 lt!64118)))))

(assert (=> d!37781 (= (contains!865 (toList!837 lt!64118) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64637)))

(declare-fun b!125498 () Bool)

(declare-fun e!81979 () Bool)

(assert (=> b!125498 (= e!81978 e!81979)))

(declare-fun res!60737 () Bool)

(assert (=> b!125498 (=> res!60737 e!81979)))

(assert (=> b!125498 (= res!60737 (= (h!2286 (toList!837 lt!64118)) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!125499 () Bool)

(assert (=> b!125499 (= e!81979 (contains!865 (t!6007 (toList!837 lt!64118)) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37781 res!60738) b!125498))

(assert (= (and b!125498 (not res!60737)) b!125499))

(declare-fun m!145957 () Bool)

(assert (=> d!37781 m!145957))

(declare-fun m!145959 () Bool)

(assert (=> d!37781 m!145959))

(declare-fun m!145961 () Bool)

(assert (=> b!125499 m!145961))

(assert (=> b!124788 d!37781))

(declare-fun d!37783 () Bool)

(assert (=> d!37783 (contains!863 (getCurrentListMap!507 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))

(assert (=> d!37783 true))

(declare-fun _$16!139 () Unit!3865)

(assert (=> d!37783 (= (choose!756 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3243 lt!64028) (defaultEntry!2763 newMap!16)) _$16!139)))

(declare-fun bs!5195 () Bool)

(assert (= bs!5195 d!37783))

(assert (=> bs!5195 m!144841))

(assert (=> bs!5195 m!144559))

(assert (=> bs!5195 m!144841))

(assert (=> bs!5195 m!144559))

(assert (=> bs!5195 m!144843))

(assert (=> d!37439 d!37783))

(assert (=> d!37439 d!37533))

(declare-fun d!37785 () Bool)

(declare-fun res!60739 () Bool)

(declare-fun e!81980 () Bool)

(assert (=> d!37785 (=> res!60739 e!81980)))

(assert (=> d!37785 (= res!60739 (and ((_ is Cons!1685) (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (= (_1!1278 (h!2286 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (=> d!37785 (= (containsKey!168 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) e!81980)))

(declare-fun b!125500 () Bool)

(declare-fun e!81981 () Bool)

(assert (=> b!125500 (= e!81980 e!81981)))

(declare-fun res!60740 () Bool)

(assert (=> b!125500 (=> (not res!60740) (not e!81981))))

(assert (=> b!125500 (= res!60740 (and (or (not ((_ is Cons!1685) (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (bvsle (_1!1278 (h!2286 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))) ((_ is Cons!1685) (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (bvslt (_1!1278 (h!2286 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(declare-fun b!125501 () Bool)

(assert (=> b!125501 (= e!81981 (containsKey!168 (t!6007 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37785 (not res!60739)) b!125500))

(assert (= (and b!125500 res!60740) b!125501))

(assert (=> b!125501 m!144407))

(declare-fun m!145963 () Bool)

(assert (=> b!125501 m!145963))

(assert (=> d!37443 d!37785))

(declare-fun b!125504 () Bool)

(declare-fun e!81983 () Option!170)

(assert (=> b!125504 (= e!81983 (getValueByKey!164 (t!6007 (toList!837 lt!64399)) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!37787 () Bool)

(declare-fun c!22897 () Bool)

(assert (=> d!37787 (= c!22897 (and ((_ is Cons!1685) (toList!837 lt!64399)) (= (_1!1278 (h!2286 (toList!837 lt!64399))) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!81982 () Option!170)

(assert (=> d!37787 (= (getValueByKey!164 (toList!837 lt!64399) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!81982)))

(declare-fun b!125505 () Bool)

(assert (=> b!125505 (= e!81983 None!168)))

(declare-fun b!125503 () Bool)

(assert (=> b!125503 (= e!81982 e!81983)))

(declare-fun c!22898 () Bool)

(assert (=> b!125503 (= c!22898 (and ((_ is Cons!1685) (toList!837 lt!64399)) (not (= (_1!1278 (h!2286 (toList!837 lt!64399))) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!125502 () Bool)

(assert (=> b!125502 (= e!81982 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64399)))))))

(assert (= (and d!37787 c!22897) b!125502))

(assert (= (and d!37787 (not c!22897)) b!125503))

(assert (= (and b!125503 c!22898) b!125504))

(assert (= (and b!125503 (not c!22898)) b!125505))

(declare-fun m!145965 () Bool)

(assert (=> b!125504 m!145965))

(assert (=> b!125113 d!37787))

(declare-fun d!37789 () Bool)

(declare-fun e!81984 () Bool)

(assert (=> d!37789 e!81984))

(declare-fun res!60741 () Bool)

(assert (=> d!37789 (=> res!60741 e!81984)))

(declare-fun lt!64638 () Bool)

(assert (=> d!37789 (= res!60741 (not lt!64638))))

(declare-fun lt!64641 () Bool)

(assert (=> d!37789 (= lt!64638 lt!64641)))

(declare-fun lt!64640 () Unit!3865)

(declare-fun e!81985 () Unit!3865)

(assert (=> d!37789 (= lt!64640 e!81985)))

(declare-fun c!22899 () Bool)

(assert (=> d!37789 (= c!22899 lt!64641)))

(assert (=> d!37789 (= lt!64641 (containsKey!168 (toList!837 lt!64236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37789 (= (contains!863 lt!64236 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64638)))

(declare-fun b!125506 () Bool)

(declare-fun lt!64639 () Unit!3865)

(assert (=> b!125506 (= e!81985 lt!64639)))

(assert (=> b!125506 (= lt!64639 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125506 (isDefined!118 (getValueByKey!164 (toList!837 lt!64236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125507 () Bool)

(declare-fun Unit!3904 () Unit!3865)

(assert (=> b!125507 (= e!81985 Unit!3904)))

(declare-fun b!125508 () Bool)

(assert (=> b!125508 (= e!81984 (isDefined!118 (getValueByKey!164 (toList!837 lt!64236) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37789 c!22899) b!125506))

(assert (= (and d!37789 (not c!22899)) b!125507))

(assert (= (and d!37789 (not res!60741)) b!125508))

(declare-fun m!145967 () Bool)

(assert (=> d!37789 m!145967))

(declare-fun m!145969 () Bool)

(assert (=> b!125506 m!145969))

(declare-fun m!145971 () Bool)

(assert (=> b!125506 m!145971))

(assert (=> b!125506 m!145971))

(declare-fun m!145973 () Bool)

(assert (=> b!125506 m!145973))

(assert (=> b!125508 m!145971))

(assert (=> b!125508 m!145971))

(assert (=> b!125508 m!145973))

(assert (=> d!37449 d!37789))

(assert (=> d!37449 d!37391))

(assert (=> d!37423 d!37425))

(declare-fun b!125525 () Bool)

(declare-fun res!60753 () Bool)

(declare-fun e!81995 () Bool)

(assert (=> b!125525 (=> (not res!60753) (not e!81995))))

(declare-fun call!13441 () Bool)

(assert (=> b!125525 (= res!60753 call!13441)))

(declare-fun e!81994 () Bool)

(assert (=> b!125525 (= e!81994 e!81995)))

(declare-fun b!125526 () Bool)

(declare-fun e!81996 () Bool)

(assert (=> b!125526 (= e!81996 e!81994)))

(declare-fun c!22904 () Bool)

(declare-fun lt!64644 () SeekEntryResult!272)

(assert (=> b!125526 (= c!22904 ((_ is MissingVacant!272) lt!64644))))

(declare-fun b!125527 () Bool)

(declare-fun e!81997 () Bool)

(declare-fun call!13440 () Bool)

(assert (=> b!125527 (= e!81997 (not call!13440))))

(declare-fun bm!13437 () Bool)

(assert (=> bm!13437 (= call!13440 (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!125528 () Bool)

(assert (=> b!125528 (= e!81996 e!81997)))

(declare-fun res!60750 () Bool)

(assert (=> b!125528 (= res!60750 call!13441)))

(assert (=> b!125528 (=> (not res!60750) (not e!81997))))

(declare-fun d!37791 () Bool)

(assert (=> d!37791 e!81996))

(declare-fun c!22905 () Bool)

(assert (=> d!37791 (= c!22905 ((_ is MissingZero!272) lt!64644))))

(assert (=> d!37791 (= lt!64644 (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(assert (=> d!37791 true))

(declare-fun _$34!945 () Unit!3865)

(assert (=> d!37791 (= (choose!754 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (defaultEntry!2763 newMap!16)) _$34!945)))

(declare-fun b!125529 () Bool)

(assert (=> b!125529 (= e!81995 (not call!13440))))

(declare-fun b!125530 () Bool)

(declare-fun res!60752 () Bool)

(assert (=> b!125530 (=> (not res!60752) (not e!81995))))

(assert (=> b!125530 (= res!60752 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3245 lt!64644)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125531 () Bool)

(assert (=> b!125531 (= e!81994 ((_ is Undefined!272) lt!64644))))

(declare-fun b!125532 () Bool)

(declare-fun res!60751 () Bool)

(assert (=> b!125532 (= res!60751 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3242 lt!64644)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125532 (=> (not res!60751) (not e!81997))))

(declare-fun bm!13438 () Bool)

(assert (=> bm!13438 (= call!13441 (inRange!0 (ite c!22905 (index!3242 lt!64644) (index!3245 lt!64644)) (mask!7008 newMap!16)))))

(assert (= (and d!37791 c!22905) b!125528))

(assert (= (and d!37791 (not c!22905)) b!125526))

(assert (= (and b!125528 res!60750) b!125532))

(assert (= (and b!125532 res!60751) b!125527))

(assert (= (and b!125526 c!22904) b!125525))

(assert (= (and b!125526 (not c!22904)) b!125531))

(assert (= (and b!125525 res!60753) b!125530))

(assert (= (and b!125530 res!60752) b!125529))

(assert (= (or b!125528 b!125525) bm!13438))

(assert (= (or b!125527 b!125529) bm!13437))

(assert (=> d!37791 m!144407))

(assert (=> d!37791 m!144509))

(declare-fun m!145975 () Bool)

(assert (=> b!125530 m!145975))

(assert (=> bm!13437 m!144407))

(assert (=> bm!13437 m!144517))

(declare-fun m!145977 () Bool)

(assert (=> bm!13438 m!145977))

(declare-fun m!145979 () Bool)

(assert (=> b!125532 m!145979))

(assert (=> d!37423 d!37791))

(assert (=> d!37423 d!37533))

(declare-fun d!37793 () Bool)

(declare-fun res!60754 () Bool)

(declare-fun e!81998 () Bool)

(assert (=> d!37793 (=> res!60754 e!81998)))

(assert (=> d!37793 (= res!60754 (and ((_ is Cons!1685) (toList!837 lt!64097)) (= (_1!1278 (h!2286 (toList!837 lt!64097))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37793 (= (containsKey!168 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!81998)))

(declare-fun b!125533 () Bool)

(declare-fun e!81999 () Bool)

(assert (=> b!125533 (= e!81998 e!81999)))

(declare-fun res!60755 () Bool)

(assert (=> b!125533 (=> (not res!60755) (not e!81999))))

(assert (=> b!125533 (= res!60755 (and (or (not ((_ is Cons!1685) (toList!837 lt!64097))) (bvsle (_1!1278 (h!2286 (toList!837 lt!64097))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1685) (toList!837 lt!64097)) (bvslt (_1!1278 (h!2286 (toList!837 lt!64097))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!125534 () Bool)

(assert (=> b!125534 (= e!81999 (containsKey!168 (t!6007 (toList!837 lt!64097)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37793 (not res!60754)) b!125533))

(assert (= (and b!125533 res!60755) b!125534))

(assert (=> b!125534 m!144579))

(declare-fun m!145981 () Bool)

(assert (=> b!125534 m!145981))

(assert (=> d!37517 d!37793))

(declare-fun d!37795 () Bool)

(declare-fun res!60756 () Bool)

(declare-fun e!82000 () Bool)

(assert (=> d!37795 (=> res!60756 e!82000)))

(assert (=> d!37795 (= res!60756 (and ((_ is Cons!1685) (toList!837 call!13319)) (= (_1!1278 (h!2286 (toList!837 call!13319))) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))))))

(assert (=> d!37795 (= (containsKey!168 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))) e!82000)))

(declare-fun b!125535 () Bool)

(declare-fun e!82001 () Bool)

(assert (=> b!125535 (= e!82000 e!82001)))

(declare-fun res!60757 () Bool)

(assert (=> b!125535 (=> (not res!60757) (not e!82001))))

(assert (=> b!125535 (= res!60757 (and (or (not ((_ is Cons!1685) (toList!837 call!13319))) (bvsle (_1!1278 (h!2286 (toList!837 call!13319))) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))) ((_ is Cons!1685) (toList!837 call!13319)) (bvslt (_1!1278 (h!2286 (toList!837 call!13319))) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))))))

(declare-fun b!125536 () Bool)

(assert (=> b!125536 (= e!82001 (containsKey!168 (t!6007 (toList!837 call!13319)) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(assert (= (and d!37795 (not res!60756)) b!125535))

(assert (= (and b!125535 res!60757) b!125536))

(declare-fun m!145983 () Bool)

(assert (=> b!125536 m!145983))

(assert (=> d!37515 d!37795))

(declare-fun e!82003 () Option!170)

(declare-fun b!125539 () Bool)

(assert (=> b!125539 (= e!82003 (getValueByKey!164 (t!6007 (t!6007 (toList!837 lt!63929))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun d!37797 () Bool)

(declare-fun c!22906 () Bool)

(assert (=> d!37797 (= c!22906 (and ((_ is Cons!1685) (t!6007 (toList!837 lt!63929))) (= (_1!1278 (h!2286 (t!6007 (toList!837 lt!63929)))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(declare-fun e!82002 () Option!170)

(assert (=> d!37797 (= (getValueByKey!164 (t!6007 (toList!837 lt!63929)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) e!82002)))

(declare-fun b!125540 () Bool)

(assert (=> b!125540 (= e!82003 None!168)))

(declare-fun b!125538 () Bool)

(assert (=> b!125538 (= e!82002 e!82003)))

(declare-fun c!22907 () Bool)

(assert (=> b!125538 (= c!22907 (and ((_ is Cons!1685) (t!6007 (toList!837 lt!63929))) (not (= (_1!1278 (h!2286 (t!6007 (toList!837 lt!63929)))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))))

(declare-fun b!125537 () Bool)

(assert (=> b!125537 (= e!82002 (Some!169 (_2!1278 (h!2286 (t!6007 (toList!837 lt!63929))))))))

(assert (= (and d!37797 c!22906) b!125537))

(assert (= (and d!37797 (not c!22906)) b!125538))

(assert (= (and b!125538 c!22907) b!125539))

(assert (= (and b!125538 (not c!22907)) b!125540))

(assert (=> b!125539 m!144407))

(declare-fun m!145985 () Bool)

(assert (=> b!125539 m!145985))

(assert (=> b!124896 d!37797))

(declare-fun d!37799 () Bool)

(assert (=> d!37799 (arrayContainsKey!0 (_keys!4491 newMap!16) lt!64391 #b00000000000000000000000000000000)))

(declare-fun lt!64647 () Unit!3865)

(declare-fun choose!13 (array!4661 (_ BitVec 64) (_ BitVec 32)) Unit!3865)

(assert (=> d!37799 (= lt!64647 (choose!13 (_keys!4491 newMap!16) lt!64391 #b00000000000000000000000000000000))))

(assert (=> d!37799 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!37799 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4491 newMap!16) lt!64391 #b00000000000000000000000000000000) lt!64647)))

(declare-fun bs!5196 () Bool)

(assert (= bs!5196 d!37799))

(assert (=> bs!5196 m!145135))

(declare-fun m!145987 () Bool)

(assert (=> bs!5196 m!145987))

(assert (=> b!125109 d!37799))

(declare-fun d!37801 () Bool)

(declare-fun res!60758 () Bool)

(declare-fun e!82004 () Bool)

(assert (=> d!37801 (=> res!60758 e!82004)))

(assert (=> d!37801 (= res!60758 (= (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) lt!64391))))

(assert (=> d!37801 (= (arrayContainsKey!0 (_keys!4491 newMap!16) lt!64391 #b00000000000000000000000000000000) e!82004)))

(declare-fun b!125541 () Bool)

(declare-fun e!82005 () Bool)

(assert (=> b!125541 (= e!82004 e!82005)))

(declare-fun res!60759 () Bool)

(assert (=> b!125541 (=> (not res!60759) (not e!82005))))

(assert (=> b!125541 (= res!60759 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125542 () Bool)

(assert (=> b!125542 (= e!82005 (arrayContainsKey!0 (_keys!4491 newMap!16) lt!64391 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37801 (not res!60758)) b!125541))

(assert (= (and b!125541 res!60759) b!125542))

(assert (=> d!37801 m!144651))

(declare-fun m!145989 () Bool)

(assert (=> b!125542 m!145989))

(assert (=> b!125109 d!37801))

(declare-fun b!125543 () Bool)

(declare-fun e!82008 () SeekEntryResult!272)

(assert (=> b!125543 (= e!82008 Undefined!272)))

(declare-fun b!125544 () Bool)

(declare-fun c!22909 () Bool)

(declare-fun lt!64649 () (_ BitVec 64))

(assert (=> b!125544 (= c!22909 (= lt!64649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82007 () SeekEntryResult!272)

(declare-fun e!82006 () SeekEntryResult!272)

(assert (=> b!125544 (= e!82007 e!82006)))

(declare-fun b!125545 () Bool)

(declare-fun lt!64650 () SeekEntryResult!272)

(assert (=> b!125545 (= e!82007 (Found!272 (index!3244 lt!64650)))))

(declare-fun b!125546 () Bool)

(assert (=> b!125546 (= e!82006 (seekKeyOrZeroReturnVacant!0 (x!14820 lt!64650) (index!3244 lt!64650) (index!3244 lt!64650) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun d!37803 () Bool)

(declare-fun lt!64648 () SeekEntryResult!272)

(assert (=> d!37803 (and (or ((_ is Undefined!272) lt!64648) (not ((_ is Found!272) lt!64648)) (and (bvsge (index!3243 lt!64648) #b00000000000000000000000000000000) (bvslt (index!3243 lt!64648) (size!2470 (_keys!4491 newMap!16))))) (or ((_ is Undefined!272) lt!64648) ((_ is Found!272) lt!64648) (not ((_ is MissingZero!272) lt!64648)) (and (bvsge (index!3242 lt!64648) #b00000000000000000000000000000000) (bvslt (index!3242 lt!64648) (size!2470 (_keys!4491 newMap!16))))) (or ((_ is Undefined!272) lt!64648) ((_ is Found!272) lt!64648) ((_ is MissingZero!272) lt!64648) (not ((_ is MissingVacant!272) lt!64648)) (and (bvsge (index!3245 lt!64648) #b00000000000000000000000000000000) (bvslt (index!3245 lt!64648) (size!2470 (_keys!4491 newMap!16))))) (or ((_ is Undefined!272) lt!64648) (ite ((_ is Found!272) lt!64648) (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64648)) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!272) lt!64648) (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3242 lt!64648)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!272) lt!64648) (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3245 lt!64648)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37803 (= lt!64648 e!82008)))

(declare-fun c!22908 () Bool)

(assert (=> d!37803 (= c!22908 (and ((_ is Intermediate!272) lt!64650) (undefined!1084 lt!64650)))))

(assert (=> d!37803 (= lt!64650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (mask!7008 newMap!16)) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(assert (=> d!37803 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37803 (= (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (_keys!4491 newMap!16) (mask!7008 newMap!16)) lt!64648)))

(declare-fun b!125547 () Bool)

(assert (=> b!125547 (= e!82006 (MissingZero!272 (index!3244 lt!64650)))))

(declare-fun b!125548 () Bool)

(assert (=> b!125548 (= e!82008 e!82007)))

(assert (=> b!125548 (= lt!64649 (select (arr!2206 (_keys!4491 newMap!16)) (index!3244 lt!64650)))))

(declare-fun c!22910 () Bool)

(assert (=> b!125548 (= c!22910 (= lt!64649 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37803 c!22908) b!125543))

(assert (= (and d!37803 (not c!22908)) b!125548))

(assert (= (and b!125548 c!22910) b!125545))

(assert (= (and b!125548 (not c!22910)) b!125544))

(assert (= (and b!125544 c!22909) b!125547))

(assert (= (and b!125544 (not c!22909)) b!125546))

(assert (=> b!125546 m!144651))

(declare-fun m!145991 () Bool)

(assert (=> b!125546 m!145991))

(declare-fun m!145993 () Bool)

(assert (=> d!37803 m!145993))

(assert (=> d!37803 m!144651))

(declare-fun m!145995 () Bool)

(assert (=> d!37803 m!145995))

(assert (=> d!37803 m!145995))

(assert (=> d!37803 m!144651))

(declare-fun m!145997 () Bool)

(assert (=> d!37803 m!145997))

(declare-fun m!145999 () Bool)

(assert (=> d!37803 m!145999))

(declare-fun m!146001 () Bool)

(assert (=> d!37803 m!146001))

(assert (=> d!37803 m!144709))

(declare-fun m!146003 () Bool)

(assert (=> b!125548 m!146003))

(assert (=> b!125109 d!37803))

(declare-fun b!125549 () Bool)

(declare-fun e!82010 () (_ BitVec 32))

(declare-fun e!82009 () (_ BitVec 32))

(assert (=> b!125549 (= e!82010 e!82009)))

(declare-fun c!22911 () Bool)

(assert (=> b!125549 (= c!22911 (validKeyInArray!0 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!37805 () Bool)

(declare-fun lt!64651 () (_ BitVec 32))

(assert (=> d!37805 (and (bvsge lt!64651 #b00000000000000000000000000000000) (bvsle lt!64651 (bvsub (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!37805 (= lt!64651 e!82010)))

(declare-fun c!22912 () Bool)

(assert (=> d!37805 (= c!22912 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37805 (and (bvsle #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2470 (_keys!4491 newMap!16)) (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))))

(assert (=> d!37805 (= (arrayCountValidKeys!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) lt!64651)))

(declare-fun b!125550 () Bool)

(assert (=> b!125550 (= e!82010 #b00000000000000000000000000000000)))

(declare-fun call!13442 () (_ BitVec 32))

(declare-fun bm!13439 () Bool)

(assert (=> bm!13439 (= call!13442 (arrayCountValidKeys!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125551 () Bool)

(assert (=> b!125551 (= e!82009 call!13442)))

(declare-fun b!125552 () Bool)

(assert (=> b!125552 (= e!82009 (bvadd #b00000000000000000000000000000001 call!13442))))

(assert (= (and d!37805 c!22912) b!125550))

(assert (= (and d!37805 (not c!22912)) b!125549))

(assert (= (and b!125549 c!22911) b!125552))

(assert (= (and b!125549 (not c!22911)) b!125551))

(assert (= (or b!125552 b!125551) bm!13439))

(declare-fun m!146005 () Bool)

(assert (=> b!125549 m!146005))

(assert (=> b!125549 m!146005))

(declare-fun m!146007 () Bool)

(assert (=> b!125549 m!146007))

(declare-fun m!146009 () Bool)

(assert (=> bm!13439 m!146009))

(assert (=> d!37461 d!37805))

(declare-fun d!37807 () Bool)

(declare-fun res!60760 () Bool)

(declare-fun e!82011 () Bool)

(assert (=> d!37807 (=> res!60760 e!82011)))

(assert (=> d!37807 (= res!60760 (= (select (arr!2206 lt!64323) #b00000000000000000000000000000000) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!37807 (= (arrayContainsKey!0 lt!64323 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000) e!82011)))

(declare-fun b!125553 () Bool)

(declare-fun e!82012 () Bool)

(assert (=> b!125553 (= e!82011 e!82012)))

(declare-fun res!60761 () Bool)

(assert (=> b!125553 (=> (not res!60761) (not e!82012))))

(assert (=> b!125553 (= res!60761 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 lt!64323)))))

(declare-fun b!125554 () Bool)

(assert (=> b!125554 (= e!82012 (arrayContainsKey!0 lt!64323 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!37807 (not res!60760)) b!125553))

(assert (= (and b!125553 res!60761) b!125554))

(declare-fun m!146011 () Bool)

(assert (=> d!37807 m!146011))

(assert (=> b!125554 m!144407))

(declare-fun m!146013 () Bool)

(assert (=> b!125554 m!146013))

(assert (=> d!37461 d!37807))

(declare-fun bm!13440 () Bool)

(declare-fun call!13449 () ListLongMap!1643)

(declare-fun call!13447 () ListLongMap!1643)

(assert (=> bm!13440 (= call!13449 call!13447)))

(declare-fun b!125555 () Bool)

(declare-fun e!82016 () Bool)

(declare-fun lt!64664 () ListLongMap!1643)

(assert (=> b!125555 (= e!82016 (= (apply!110 lt!64664 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125556 () Bool)

(declare-fun e!82018 () ListLongMap!1643)

(declare-fun call!13444 () ListLongMap!1643)

(assert (=> b!125556 (= e!82018 call!13444)))

(declare-fun bm!13441 () Bool)

(declare-fun call!13443 () ListLongMap!1643)

(assert (=> bm!13441 (= call!13444 call!13443)))

(declare-fun b!125557 () Bool)

(declare-fun e!82023 () Bool)

(assert (=> b!125557 (= e!82023 (validKeyInArray!0 (select (arr!2206 lt!64324) #b00000000000000000000000000000000)))))

(declare-fun b!125558 () Bool)

(declare-fun e!82025 () Bool)

(assert (=> b!125558 (= e!82025 (= (apply!110 lt!64664 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125559 () Bool)

(declare-fun e!82020 () Bool)

(assert (=> b!125559 (= e!82020 (validKeyInArray!0 (select (arr!2206 lt!64324) #b00000000000000000000000000000000)))))

(declare-fun d!37809 () Bool)

(declare-fun e!82015 () Bool)

(assert (=> d!37809 e!82015))

(declare-fun res!60764 () Bool)

(assert (=> d!37809 (=> (not res!60764) (not e!82015))))

(assert (=> d!37809 (= res!60764 (or (bvsge #b00000000000000000000000000000000 (size!2470 lt!64324)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 lt!64324)))))))

(declare-fun lt!64670 () ListLongMap!1643)

(assert (=> d!37809 (= lt!64664 lt!64670)))

(declare-fun lt!64661 () Unit!3865)

(declare-fun e!82019 () Unit!3865)

(assert (=> d!37809 (= lt!64661 e!82019)))

(declare-fun c!22913 () Bool)

(assert (=> d!37809 (= c!22913 e!82023)))

(declare-fun res!60766 () Bool)

(assert (=> d!37809 (=> (not res!60766) (not e!82023))))

(assert (=> d!37809 (= res!60766 (bvslt #b00000000000000000000000000000000 (size!2470 lt!64324)))))

(declare-fun e!82021 () ListLongMap!1643)

(assert (=> d!37809 (= lt!64670 e!82021)))

(declare-fun c!22915 () Bool)

(assert (=> d!37809 (= c!22915 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37809 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37809 (= (getCurrentListMap!507 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64664)))

(declare-fun b!125560 () Bool)

(declare-fun e!82014 () Bool)

(assert (=> b!125560 (= e!82014 (= (apply!110 lt!64664 (select (arr!2206 lt!64324) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 lt!64317) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 lt!64317)))))

(assert (=> b!125560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 lt!64324)))))

(declare-fun bm!13442 () Bool)

(declare-fun call!13446 () ListLongMap!1643)

(declare-fun c!22918 () Bool)

(assert (=> bm!13442 (= call!13443 (+!157 (ite c!22915 call!13447 (ite c!22918 call!13449 call!13446)) (ite (or c!22915 c!22918) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun bm!13443 () Bool)

(assert (=> bm!13443 (= call!13446 call!13449)))

(declare-fun b!125561 () Bool)

(declare-fun e!82017 () ListLongMap!1643)

(assert (=> b!125561 (= e!82021 e!82017)))

(assert (=> b!125561 (= c!22918 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125562 () Bool)

(declare-fun Unit!3905 () Unit!3865)

(assert (=> b!125562 (= e!82019 Unit!3905)))

(declare-fun b!125563 () Bool)

(declare-fun res!60765 () Bool)

(assert (=> b!125563 (=> (not res!60765) (not e!82015))))

(declare-fun e!82022 () Bool)

(assert (=> b!125563 (= res!60765 e!82022)))

(declare-fun res!60762 () Bool)

(assert (=> b!125563 (=> res!60762 e!82022)))

(assert (=> b!125563 (= res!60762 (not e!82020))))

(declare-fun res!60770 () Bool)

(assert (=> b!125563 (=> (not res!60770) (not e!82020))))

(assert (=> b!125563 (= res!60770 (bvslt #b00000000000000000000000000000000 (size!2470 lt!64324)))))

(declare-fun b!125564 () Bool)

(declare-fun e!82013 () Bool)

(assert (=> b!125564 (= e!82013 e!82016)))

(declare-fun res!60769 () Bool)

(declare-fun call!13448 () Bool)

(assert (=> b!125564 (= res!60769 call!13448)))

(assert (=> b!125564 (=> (not res!60769) (not e!82016))))

(declare-fun bm!13444 () Bool)

(declare-fun call!13445 () Bool)

(assert (=> bm!13444 (= call!13445 (contains!863 lt!64664 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125565 () Bool)

(assert (=> b!125565 (= e!82017 call!13444)))

(declare-fun bm!13445 () Bool)

(assert (=> bm!13445 (= call!13447 (getCurrentListMapNoExtraKeys!122 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125566 () Bool)

(declare-fun res!60768 () Bool)

(assert (=> b!125566 (=> (not res!60768) (not e!82015))))

(assert (=> b!125566 (= res!60768 e!82013)))

(declare-fun c!22916 () Bool)

(assert (=> b!125566 (= c!22916 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125567 () Bool)

(declare-fun e!82024 () Bool)

(assert (=> b!125567 (= e!82024 (not call!13445))))

(declare-fun b!125568 () Bool)

(assert (=> b!125568 (= e!82015 e!82024)))

(declare-fun c!22917 () Bool)

(assert (=> b!125568 (= c!22917 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125569 () Bool)

(assert (=> b!125569 (= e!82018 call!13446)))

(declare-fun b!125570 () Bool)

(assert (=> b!125570 (= e!82021 (+!157 call!13443 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125571 () Bool)

(assert (=> b!125571 (= e!82024 e!82025)))

(declare-fun res!60767 () Bool)

(assert (=> b!125571 (= res!60767 call!13445)))

(assert (=> b!125571 (=> (not res!60767) (not e!82025))))

(declare-fun b!125572 () Bool)

(declare-fun lt!64666 () Unit!3865)

(assert (=> b!125572 (= e!82019 lt!64666)))

(declare-fun lt!64667 () ListLongMap!1643)

(assert (=> b!125572 (= lt!64667 (getCurrentListMapNoExtraKeys!122 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64669 () (_ BitVec 64))

(assert (=> b!125572 (= lt!64669 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64654 () (_ BitVec 64))

(assert (=> b!125572 (= lt!64654 (select (arr!2206 lt!64324) #b00000000000000000000000000000000))))

(declare-fun lt!64653 () Unit!3865)

(assert (=> b!125572 (= lt!64653 (addStillContains!86 lt!64667 lt!64669 (zeroValue!2628 newMap!16) lt!64654))))

(assert (=> b!125572 (contains!863 (+!157 lt!64667 (tuple2!2535 lt!64669 (zeroValue!2628 newMap!16))) lt!64654)))

(declare-fun lt!64663 () Unit!3865)

(assert (=> b!125572 (= lt!64663 lt!64653)))

(declare-fun lt!64660 () ListLongMap!1643)

(assert (=> b!125572 (= lt!64660 (getCurrentListMapNoExtraKeys!122 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64652 () (_ BitVec 64))

(assert (=> b!125572 (= lt!64652 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64672 () (_ BitVec 64))

(assert (=> b!125572 (= lt!64672 (select (arr!2206 lt!64324) #b00000000000000000000000000000000))))

(declare-fun lt!64655 () Unit!3865)

(assert (=> b!125572 (= lt!64655 (addApplyDifferent!86 lt!64660 lt!64652 (minValue!2628 newMap!16) lt!64672))))

(assert (=> b!125572 (= (apply!110 (+!157 lt!64660 (tuple2!2535 lt!64652 (minValue!2628 newMap!16))) lt!64672) (apply!110 lt!64660 lt!64672))))

(declare-fun lt!64657 () Unit!3865)

(assert (=> b!125572 (= lt!64657 lt!64655)))

(declare-fun lt!64673 () ListLongMap!1643)

(assert (=> b!125572 (= lt!64673 (getCurrentListMapNoExtraKeys!122 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64656 () (_ BitVec 64))

(assert (=> b!125572 (= lt!64656 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64671 () (_ BitVec 64))

(assert (=> b!125572 (= lt!64671 (select (arr!2206 lt!64324) #b00000000000000000000000000000000))))

(declare-fun lt!64665 () Unit!3865)

(assert (=> b!125572 (= lt!64665 (addApplyDifferent!86 lt!64673 lt!64656 (zeroValue!2628 newMap!16) lt!64671))))

(assert (=> b!125572 (= (apply!110 (+!157 lt!64673 (tuple2!2535 lt!64656 (zeroValue!2628 newMap!16))) lt!64671) (apply!110 lt!64673 lt!64671))))

(declare-fun lt!64662 () Unit!3865)

(assert (=> b!125572 (= lt!64662 lt!64665)))

(declare-fun lt!64658 () ListLongMap!1643)

(assert (=> b!125572 (= lt!64658 (getCurrentListMapNoExtraKeys!122 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64668 () (_ BitVec 64))

(assert (=> b!125572 (= lt!64668 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64659 () (_ BitVec 64))

(assert (=> b!125572 (= lt!64659 (select (arr!2206 lt!64324) #b00000000000000000000000000000000))))

(assert (=> b!125572 (= lt!64666 (addApplyDifferent!86 lt!64658 lt!64668 (minValue!2628 newMap!16) lt!64659))))

(assert (=> b!125572 (= (apply!110 (+!157 lt!64658 (tuple2!2535 lt!64668 (minValue!2628 newMap!16))) lt!64659) (apply!110 lt!64658 lt!64659))))

(declare-fun b!125573 () Bool)

(assert (=> b!125573 (= e!82013 (not call!13448))))

(declare-fun bm!13446 () Bool)

(assert (=> bm!13446 (= call!13448 (contains!863 lt!64664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125574 () Bool)

(assert (=> b!125574 (= e!82022 e!82014)))

(declare-fun res!60763 () Bool)

(assert (=> b!125574 (=> (not res!60763) (not e!82014))))

(assert (=> b!125574 (= res!60763 (contains!863 lt!64664 (select (arr!2206 lt!64324) #b00000000000000000000000000000000)))))

(assert (=> b!125574 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 lt!64324)))))

(declare-fun b!125575 () Bool)

(declare-fun c!22914 () Bool)

(assert (=> b!125575 (= c!22914 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125575 (= e!82017 e!82018)))

(assert (= (and d!37809 c!22915) b!125570))

(assert (= (and d!37809 (not c!22915)) b!125561))

(assert (= (and b!125561 c!22918) b!125565))

(assert (= (and b!125561 (not c!22918)) b!125575))

(assert (= (and b!125575 c!22914) b!125556))

(assert (= (and b!125575 (not c!22914)) b!125569))

(assert (= (or b!125556 b!125569) bm!13443))

(assert (= (or b!125565 bm!13443) bm!13440))

(assert (= (or b!125565 b!125556) bm!13441))

(assert (= (or b!125570 bm!13440) bm!13445))

(assert (= (or b!125570 bm!13441) bm!13442))

(assert (= (and d!37809 res!60766) b!125557))

(assert (= (and d!37809 c!22913) b!125572))

(assert (= (and d!37809 (not c!22913)) b!125562))

(assert (= (and d!37809 res!60764) b!125563))

(assert (= (and b!125563 res!60770) b!125559))

(assert (= (and b!125563 (not res!60762)) b!125574))

(assert (= (and b!125574 res!60763) b!125560))

(assert (= (and b!125563 res!60765) b!125566))

(assert (= (and b!125566 c!22916) b!125564))

(assert (= (and b!125566 (not c!22916)) b!125573))

(assert (= (and b!125564 res!60769) b!125555))

(assert (= (or b!125564 b!125573) bm!13446))

(assert (= (and b!125566 res!60768) b!125568))

(assert (= (and b!125568 c!22917) b!125571))

(assert (= (and b!125568 (not c!22917)) b!125567))

(assert (= (and b!125571 res!60767) b!125558))

(assert (= (or b!125571 b!125567) bm!13444))

(declare-fun b_lambda!5499 () Bool)

(assert (=> (not b_lambda!5499) (not b!125560)))

(assert (=> b!125560 t!6019))

(declare-fun b_and!7701 () Bool)

(assert (= b_and!7697 (and (=> t!6019 result!3815) b_and!7701)))

(assert (=> b!125560 t!6021))

(declare-fun b_and!7703 () Bool)

(assert (= b_and!7699 (and (=> t!6021 result!3817) b_and!7703)))

(declare-fun m!146015 () Bool)

(assert (=> b!125574 m!146015))

(assert (=> b!125574 m!146015))

(declare-fun m!146017 () Bool)

(assert (=> b!125574 m!146017))

(declare-fun m!146019 () Bool)

(assert (=> b!125555 m!146019))

(declare-fun m!146021 () Bool)

(assert (=> b!125558 m!146021))

(assert (=> b!125559 m!146015))

(assert (=> b!125559 m!146015))

(declare-fun m!146023 () Bool)

(assert (=> b!125559 m!146023))

(declare-fun m!146025 () Bool)

(assert (=> bm!13444 m!146025))

(declare-fun m!146027 () Bool)

(assert (=> bm!13442 m!146027))

(assert (=> b!125560 m!144665))

(declare-fun m!146029 () Bool)

(assert (=> b!125560 m!146029))

(assert (=> b!125560 m!144665))

(declare-fun m!146031 () Bool)

(assert (=> b!125560 m!146031))

(assert (=> b!125560 m!146015))

(assert (=> b!125560 m!146029))

(assert (=> b!125560 m!146015))

(declare-fun m!146033 () Bool)

(assert (=> b!125560 m!146033))

(declare-fun m!146035 () Bool)

(assert (=> bm!13446 m!146035))

(assert (=> b!125557 m!146015))

(assert (=> b!125557 m!146015))

(assert (=> b!125557 m!146023))

(declare-fun m!146037 () Bool)

(assert (=> b!125570 m!146037))

(declare-fun m!146039 () Bool)

(assert (=> bm!13445 m!146039))

(declare-fun m!146041 () Bool)

(assert (=> b!125572 m!146041))

(declare-fun m!146043 () Bool)

(assert (=> b!125572 m!146043))

(declare-fun m!146045 () Bool)

(assert (=> b!125572 m!146045))

(declare-fun m!146047 () Bool)

(assert (=> b!125572 m!146047))

(assert (=> b!125572 m!146039))

(assert (=> b!125572 m!146043))

(declare-fun m!146049 () Bool)

(assert (=> b!125572 m!146049))

(declare-fun m!146051 () Bool)

(assert (=> b!125572 m!146051))

(declare-fun m!146053 () Bool)

(assert (=> b!125572 m!146053))

(declare-fun m!146055 () Bool)

(assert (=> b!125572 m!146055))

(declare-fun m!146057 () Bool)

(assert (=> b!125572 m!146057))

(assert (=> b!125572 m!146015))

(declare-fun m!146059 () Bool)

(assert (=> b!125572 m!146059))

(declare-fun m!146061 () Bool)

(assert (=> b!125572 m!146061))

(declare-fun m!146063 () Bool)

(assert (=> b!125572 m!146063))

(declare-fun m!146065 () Bool)

(assert (=> b!125572 m!146065))

(assert (=> b!125572 m!146063))

(assert (=> b!125572 m!146051))

(declare-fun m!146067 () Bool)

(assert (=> b!125572 m!146067))

(assert (=> b!125572 m!146055))

(declare-fun m!146069 () Bool)

(assert (=> b!125572 m!146069))

(assert (=> d!37809 m!144709))

(assert (=> d!37461 d!37809))

(assert (=> d!37461 d!37421))

(assert (=> d!37461 d!37399))

(assert (=> d!37461 d!37437))

(declare-fun d!37811 () Bool)

(declare-fun e!82028 () Bool)

(assert (=> d!37811 e!82028))

(declare-fun res!60773 () Bool)

(assert (=> d!37811 (=> (not res!60773) (not e!82028))))

(assert (=> d!37811 (= res!60773 (and (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000) (bvslt (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (size!2470 (_keys!4491 newMap!16))) (bvslt (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (size!2471 (_values!2746 newMap!16)))))))

(declare-fun lt!64676 () Unit!3865)

(declare-fun choose!766 (array!4661 array!4663 (_ BitVec 32) (_ BitVec 32) V!3425 V!3425 (_ BitVec 32) (_ BitVec 64) V!3425 Int) Unit!3865)

(assert (=> d!37811 (= lt!64676 (choose!766 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37811 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37811 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!36 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) lt!64676)))

(declare-fun b!125578 () Bool)

(assert (=> b!125578 (= e!82028 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!507 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))))))

(assert (= (and d!37811 res!60773) b!125578))

(assert (=> d!37811 m!144407))

(assert (=> d!37811 m!144419))

(declare-fun m!146071 () Bool)

(assert (=> d!37811 m!146071))

(assert (=> d!37811 m!144709))

(assert (=> b!125578 m!145001))

(assert (=> b!125578 m!144527))

(assert (=> b!125578 m!144847))

(assert (=> b!125578 m!144527))

(assert (=> b!125578 m!144981))

(assert (=> b!125578 m!144991))

(assert (=> d!37461 d!37811))

(declare-fun b!125579 () Bool)

(declare-fun e!82030 () (_ BitVec 32))

(declare-fun e!82029 () (_ BitVec 32))

(assert (=> b!125579 (= e!82030 e!82029)))

(declare-fun c!22919 () Bool)

(assert (=> b!125579 (= c!22919 (validKeyInArray!0 (select (arr!2206 lt!64332) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)))))))

(declare-fun d!37813 () Bool)

(declare-fun lt!64677 () (_ BitVec 32))

(assert (=> d!37813 (and (bvsge lt!64677 #b00000000000000000000000000000000) (bvsle lt!64677 (bvsub (size!2470 lt!64332) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)))))))

(assert (=> d!37813 (= lt!64677 e!82030)))

(declare-fun c!22920 () Bool)

(assert (=> d!37813 (= c!22920 (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (bvadd (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000001)))))

(assert (=> d!37813 (and (bvsle (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (bvadd (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000001)) (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000001) (size!2470 lt!64332)))))

(assert (=> d!37813 (= (arrayCountValidKeys!0 lt!64332 (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (bvadd (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000001)) lt!64677)))

(declare-fun b!125580 () Bool)

(assert (=> b!125580 (= e!82030 #b00000000000000000000000000000000)))

(declare-fun call!13450 () (_ BitVec 32))

(declare-fun bm!13447 () Bool)

(assert (=> bm!13447 (= call!13450 (arrayCountValidKeys!0 lt!64332 (bvadd (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000001) (bvadd (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000001)))))

(declare-fun b!125581 () Bool)

(assert (=> b!125581 (= e!82029 call!13450)))

(declare-fun b!125582 () Bool)

(assert (=> b!125582 (= e!82029 (bvadd #b00000000000000000000000000000001 call!13450))))

(assert (= (and d!37813 c!22920) b!125580))

(assert (= (and d!37813 (not c!22920)) b!125579))

(assert (= (and b!125579 c!22919) b!125582))

(assert (= (and b!125579 (not c!22919)) b!125581))

(assert (= (or b!125582 b!125581) bm!13447))

(declare-fun m!146073 () Bool)

(assert (=> b!125579 m!146073))

(assert (=> b!125579 m!146073))

(declare-fun m!146075 () Bool)

(assert (=> b!125579 m!146075))

(declare-fun m!146077 () Bool)

(assert (=> bm!13447 m!146077))

(assert (=> d!37461 d!37813))

(declare-fun d!37815 () Bool)

(declare-fun e!82033 () Bool)

(assert (=> d!37815 e!82033))

(declare-fun res!60776 () Bool)

(assert (=> d!37815 (=> (not res!60776) (not e!82033))))

(assert (=> d!37815 (= res!60776 (and (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000) (bvslt (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (size!2470 (_keys!4491 newMap!16)))))))

(declare-fun lt!64680 () Unit!3865)

(declare-fun choose!41 (array!4661 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1691) Unit!3865)

(assert (=> d!37815 (= lt!64680 (choose!41 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) lt!64337 lt!64326))))

(assert (=> d!37815 (bvslt (size!2470 (_keys!4491 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!37815 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) lt!64337 lt!64326) lt!64680)))

(declare-fun b!125585 () Bool)

(assert (=> b!125585 (= e!82033 (arrayNoDuplicates!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) lt!64337 lt!64326))))

(assert (= (and d!37815 res!60776) b!125585))

(assert (=> d!37815 m!144407))

(declare-fun m!146079 () Bool)

(assert (=> d!37815 m!146079))

(assert (=> b!125585 m!144981))

(assert (=> b!125585 m!144993))

(assert (=> d!37461 d!37815))

(declare-fun b!125586 () Bool)

(declare-fun e!82034 () Bool)

(declare-fun call!13451 () Bool)

(assert (=> b!125586 (= e!82034 call!13451)))

(declare-fun b!125587 () Bool)

(declare-fun e!82036 () Bool)

(assert (=> b!125587 (= e!82036 call!13451)))

(declare-fun d!37817 () Bool)

(declare-fun res!60778 () Bool)

(declare-fun e!82035 () Bool)

(assert (=> d!37817 (=> res!60778 e!82035)))

(assert (=> d!37817 (= res!60778 (bvsge #b00000000000000000000000000000000 (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))))

(assert (=> d!37817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (mask!7008 newMap!16)) e!82035)))

(declare-fun b!125588 () Bool)

(assert (=> b!125588 (= e!82035 e!82034)))

(declare-fun c!22921 () Bool)

(assert (=> b!125588 (= c!22921 (validKeyInArray!0 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!125589 () Bool)

(assert (=> b!125589 (= e!82034 e!82036)))

(declare-fun lt!64683 () (_ BitVec 64))

(assert (=> b!125589 (= lt!64683 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64682 () Unit!3865)

(assert (=> b!125589 (= lt!64682 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) lt!64683 #b00000000000000000000000000000000))))

(assert (=> b!125589 (arrayContainsKey!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) lt!64683 #b00000000000000000000000000000000)))

(declare-fun lt!64681 () Unit!3865)

(assert (=> b!125589 (= lt!64681 lt!64682)))

(declare-fun res!60777 () Bool)

(assert (=> b!125589 (= res!60777 (= (seekEntryOrOpen!0 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000) (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (mask!7008 newMap!16)) (Found!272 #b00000000000000000000000000000000)))))

(assert (=> b!125589 (=> (not res!60777) (not e!82036))))

(declare-fun bm!13448 () Bool)

(assert (=> bm!13448 (= call!13451 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (mask!7008 newMap!16)))))

(assert (= (and d!37817 (not res!60778)) b!125588))

(assert (= (and b!125588 c!22921) b!125589))

(assert (= (and b!125588 (not c!22921)) b!125586))

(assert (= (and b!125589 res!60777) b!125587))

(assert (= (or b!125587 b!125586) bm!13448))

(assert (=> b!125588 m!146005))

(assert (=> b!125588 m!146005))

(assert (=> b!125588 m!146007))

(assert (=> b!125589 m!146005))

(declare-fun m!146081 () Bool)

(assert (=> b!125589 m!146081))

(declare-fun m!146083 () Bool)

(assert (=> b!125589 m!146083))

(assert (=> b!125589 m!146005))

(declare-fun m!146085 () Bool)

(assert (=> b!125589 m!146085))

(declare-fun m!146087 () Bool)

(assert (=> bm!13448 m!146087))

(assert (=> d!37461 d!37817))

(declare-fun d!37819 () Bool)

(declare-fun e!82037 () Bool)

(assert (=> d!37819 e!82037))

(declare-fun res!60779 () Bool)

(assert (=> d!37819 (=> res!60779 e!82037)))

(declare-fun lt!64684 () Bool)

(assert (=> d!37819 (= res!60779 (not lt!64684))))

(declare-fun lt!64687 () Bool)

(assert (=> d!37819 (= lt!64684 lt!64687)))

(declare-fun lt!64686 () Unit!3865)

(declare-fun e!82038 () Unit!3865)

(assert (=> d!37819 (= lt!64686 e!82038)))

(declare-fun c!22922 () Bool)

(assert (=> d!37819 (= c!22922 lt!64687)))

(assert (=> d!37819 (= lt!64687 (containsKey!168 (toList!837 (getCurrentListMap!507 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)))))))

(assert (=> d!37819 (= (contains!863 (getCurrentListMap!507 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)))) lt!64684)))

(declare-fun b!125590 () Bool)

(declare-fun lt!64685 () Unit!3865)

(assert (=> b!125590 (= e!82038 lt!64685)))

(assert (=> b!125590 (= lt!64685 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (getCurrentListMap!507 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)))))))

(assert (=> b!125590 (isDefined!118 (getValueByKey!164 (toList!837 (getCurrentListMap!507 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)))))))

(declare-fun b!125591 () Bool)

(declare-fun Unit!3906 () Unit!3865)

(assert (=> b!125591 (= e!82038 Unit!3906)))

(declare-fun b!125592 () Bool)

(assert (=> b!125592 (= e!82037 (isDefined!118 (getValueByKey!164 (toList!837 (getCurrentListMap!507 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))))))))

(assert (= (and d!37819 c!22922) b!125590))

(assert (= (and d!37819 (not c!22922)) b!125591))

(assert (= (and d!37819 (not res!60779)) b!125592))

(assert (=> d!37819 m!144969))

(declare-fun m!146089 () Bool)

(assert (=> d!37819 m!146089))

(assert (=> b!125590 m!144969))

(declare-fun m!146091 () Bool)

(assert (=> b!125590 m!146091))

(assert (=> b!125590 m!144969))

(declare-fun m!146093 () Bool)

(assert (=> b!125590 m!146093))

(assert (=> b!125590 m!146093))

(declare-fun m!146095 () Bool)

(assert (=> b!125590 m!146095))

(assert (=> b!125592 m!144969))

(assert (=> b!125592 m!146093))

(assert (=> b!125592 m!146093))

(assert (=> b!125592 m!146095))

(assert (=> d!37461 d!37819))

(declare-fun d!37821 () Bool)

(assert (=> d!37821 (= (arrayCountValidKeys!0 lt!64332 (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (bvadd (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!64690 () Unit!3865)

(declare-fun choose!2 (array!4661 (_ BitVec 32)) Unit!3865)

(assert (=> d!37821 (= lt!64690 (choose!2 lt!64332 (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))))))

(declare-fun e!82041 () Bool)

(assert (=> d!37821 e!82041))

(declare-fun res!60784 () Bool)

(assert (=> d!37821 (=> (not res!60784) (not e!82041))))

(assert (=> d!37821 (= res!60784 (and (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000) (bvslt (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (size!2470 lt!64332))))))

(assert (=> d!37821 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!64332 (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))) lt!64690)))

(declare-fun b!125597 () Bool)

(declare-fun res!60785 () Bool)

(assert (=> b!125597 (=> (not res!60785) (not e!82041))))

(assert (=> b!125597 (= res!60785 (validKeyInArray!0 (select (arr!2206 lt!64332) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)))))))

(declare-fun b!125598 () Bool)

(assert (=> b!125598 (= e!82041 (bvslt (size!2470 lt!64332) #b01111111111111111111111111111111))))

(assert (= (and d!37821 res!60784) b!125597))

(assert (= (and b!125597 res!60785) b!125598))

(assert (=> d!37821 m!144971))

(declare-fun m!146097 () Bool)

(assert (=> d!37821 m!146097))

(assert (=> b!125597 m!146073))

(assert (=> b!125597 m!146073))

(assert (=> b!125597 m!146075))

(assert (=> d!37461 d!37821))

(declare-fun d!37823 () Bool)

(declare-fun e!82042 () Bool)

(assert (=> d!37823 e!82042))

(declare-fun res!60787 () Bool)

(assert (=> d!37823 (=> (not res!60787) (not e!82042))))

(declare-fun lt!64694 () ListLongMap!1643)

(assert (=> d!37823 (= res!60787 (contains!863 lt!64694 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64692 () List!1689)

(assert (=> d!37823 (= lt!64694 (ListLongMap!1644 lt!64692))))

(declare-fun lt!64693 () Unit!3865)

(declare-fun lt!64691 () Unit!3865)

(assert (=> d!37823 (= lt!64693 lt!64691)))

(assert (=> d!37823 (= (getValueByKey!164 lt!64692 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37823 (= lt!64691 (lemmaContainsTupThenGetReturnValue!82 lt!64692 (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37823 (= lt!64692 (insertStrictlySorted!85 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37823 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64694)))

(declare-fun b!125599 () Bool)

(declare-fun res!60786 () Bool)

(assert (=> b!125599 (=> (not res!60786) (not e!82042))))

(assert (=> b!125599 (= res!60786 (= (getValueByKey!164 (toList!837 lt!64694) (_1!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125600 () Bool)

(assert (=> b!125600 (= e!82042 (contains!865 (toList!837 lt!64694) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37823 res!60787) b!125599))

(assert (= (and b!125599 res!60786) b!125600))

(declare-fun m!146099 () Bool)

(assert (=> d!37823 m!146099))

(declare-fun m!146101 () Bool)

(assert (=> d!37823 m!146101))

(declare-fun m!146103 () Bool)

(assert (=> d!37823 m!146103))

(declare-fun m!146105 () Bool)

(assert (=> d!37823 m!146105))

(declare-fun m!146107 () Bool)

(assert (=> b!125599 m!146107))

(declare-fun m!146109 () Bool)

(assert (=> b!125600 m!146109))

(assert (=> d!37461 d!37823))

(declare-fun d!37825 () Bool)

(declare-fun e!82045 () Bool)

(assert (=> d!37825 e!82045))

(declare-fun res!60790 () Bool)

(assert (=> d!37825 (=> (not res!60790) (not e!82045))))

(assert (=> d!37825 (= res!60790 (and (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000) (bvslt (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (size!2470 (_keys!4491 newMap!16)))))))

(declare-fun lt!64697 () Unit!3865)

(declare-fun choose!102 ((_ BitVec 64) array!4661 (_ BitVec 32) (_ BitVec 32)) Unit!3865)

(assert (=> d!37825 (= lt!64697 (choose!102 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (mask!7008 newMap!16)))))

(assert (=> d!37825 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37825 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (mask!7008 newMap!16)) lt!64697)))

(declare-fun b!125603 () Bool)

(assert (=> b!125603 (= e!82045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (mask!7008 newMap!16)))))

(assert (= (and d!37825 res!60790) b!125603))

(assert (=> d!37825 m!144407))

(declare-fun m!146111 () Bool)

(assert (=> d!37825 m!146111))

(assert (=> d!37825 m!144709))

(assert (=> b!125603 m!144981))

(assert (=> b!125603 m!144975))

(assert (=> d!37461 d!37825))

(declare-fun bm!13449 () Bool)

(declare-fun call!13458 () ListLongMap!1643)

(declare-fun call!13456 () ListLongMap!1643)

(assert (=> bm!13449 (= call!13458 call!13456)))

(declare-fun b!125604 () Bool)

(declare-fun e!82049 () Bool)

(declare-fun lt!64710 () ListLongMap!1643)

(assert (=> b!125604 (= e!82049 (= (apply!110 lt!64710 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125605 () Bool)

(declare-fun e!82051 () ListLongMap!1643)

(declare-fun call!13453 () ListLongMap!1643)

(assert (=> b!125605 (= e!82051 call!13453)))

(declare-fun bm!13450 () Bool)

(declare-fun call!13452 () ListLongMap!1643)

(assert (=> bm!13450 (= call!13453 call!13452)))

(declare-fun e!82056 () Bool)

(declare-fun b!125606 () Bool)

(assert (=> b!125606 (= e!82056 (validKeyInArray!0 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!125607 () Bool)

(declare-fun e!82058 () Bool)

(assert (=> b!125607 (= e!82058 (= (apply!110 lt!64710 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun e!82053 () Bool)

(declare-fun b!125608 () Bool)

(assert (=> b!125608 (= e!82053 (validKeyInArray!0 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun d!37827 () Bool)

(declare-fun e!82048 () Bool)

(assert (=> d!37827 e!82048))

(declare-fun res!60793 () Bool)

(assert (=> d!37827 (=> (not res!60793) (not e!82048))))

(assert (=> d!37827 (= res!60793 (or (bvsge #b00000000000000000000000000000000 (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))))))

(declare-fun lt!64716 () ListLongMap!1643)

(assert (=> d!37827 (= lt!64710 lt!64716)))

(declare-fun lt!64707 () Unit!3865)

(declare-fun e!82052 () Unit!3865)

(assert (=> d!37827 (= lt!64707 e!82052)))

(declare-fun c!22923 () Bool)

(assert (=> d!37827 (= c!22923 e!82056)))

(declare-fun res!60795 () Bool)

(assert (=> d!37827 (=> (not res!60795) (not e!82056))))

(assert (=> d!37827 (= res!60795 (bvslt #b00000000000000000000000000000000 (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun e!82054 () ListLongMap!1643)

(assert (=> d!37827 (= lt!64716 e!82054)))

(declare-fun c!22925 () Bool)

(assert (=> d!37827 (= c!22925 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37827 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37827 (= (getCurrentListMap!507 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64710)))

(declare-fun b!125609 () Bool)

(declare-fun e!82047 () Bool)

(assert (=> b!125609 (= e!82047 (= (apply!110 lt!64710 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))))))

(assert (=> b!125609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun call!13455 () ListLongMap!1643)

(declare-fun c!22928 () Bool)

(declare-fun bm!13451 () Bool)

(assert (=> bm!13451 (= call!13452 (+!157 (ite c!22925 call!13456 (ite c!22928 call!13458 call!13455)) (ite (or c!22925 c!22928) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun bm!13452 () Bool)

(assert (=> bm!13452 (= call!13455 call!13458)))

(declare-fun b!125610 () Bool)

(declare-fun e!82050 () ListLongMap!1643)

(assert (=> b!125610 (= e!82054 e!82050)))

(assert (=> b!125610 (= c!22928 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125611 () Bool)

(declare-fun Unit!3907 () Unit!3865)

(assert (=> b!125611 (= e!82052 Unit!3907)))

(declare-fun b!125612 () Bool)

(declare-fun res!60794 () Bool)

(assert (=> b!125612 (=> (not res!60794) (not e!82048))))

(declare-fun e!82055 () Bool)

(assert (=> b!125612 (= res!60794 e!82055)))

(declare-fun res!60791 () Bool)

(assert (=> b!125612 (=> res!60791 e!82055)))

(assert (=> b!125612 (= res!60791 (not e!82053))))

(declare-fun res!60799 () Bool)

(assert (=> b!125612 (=> (not res!60799) (not e!82053))))

(assert (=> b!125612 (= res!60799 (bvslt #b00000000000000000000000000000000 (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun b!125613 () Bool)

(declare-fun e!82046 () Bool)

(assert (=> b!125613 (= e!82046 e!82049)))

(declare-fun res!60798 () Bool)

(declare-fun call!13457 () Bool)

(assert (=> b!125613 (= res!60798 call!13457)))

(assert (=> b!125613 (=> (not res!60798) (not e!82049))))

(declare-fun bm!13453 () Bool)

(declare-fun call!13454 () Bool)

(assert (=> bm!13453 (= call!13454 (contains!863 lt!64710 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125614 () Bool)

(assert (=> b!125614 (= e!82050 call!13453)))

(declare-fun bm!13454 () Bool)

(assert (=> bm!13454 (= call!13456 (getCurrentListMapNoExtraKeys!122 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125615 () Bool)

(declare-fun res!60797 () Bool)

(assert (=> b!125615 (=> (not res!60797) (not e!82048))))

(assert (=> b!125615 (= res!60797 e!82046)))

(declare-fun c!22926 () Bool)

(assert (=> b!125615 (= c!22926 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125616 () Bool)

(declare-fun e!82057 () Bool)

(assert (=> b!125616 (= e!82057 (not call!13454))))

(declare-fun b!125617 () Bool)

(assert (=> b!125617 (= e!82048 e!82057)))

(declare-fun c!22927 () Bool)

(assert (=> b!125617 (= c!22927 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125618 () Bool)

(assert (=> b!125618 (= e!82051 call!13455)))

(declare-fun b!125619 () Bool)

(assert (=> b!125619 (= e!82054 (+!157 call!13452 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125620 () Bool)

(assert (=> b!125620 (= e!82057 e!82058)))

(declare-fun res!60796 () Bool)

(assert (=> b!125620 (= res!60796 call!13454)))

(assert (=> b!125620 (=> (not res!60796) (not e!82058))))

(declare-fun b!125621 () Bool)

(declare-fun lt!64712 () Unit!3865)

(assert (=> b!125621 (= e!82052 lt!64712)))

(declare-fun lt!64713 () ListLongMap!1643)

(assert (=> b!125621 (= lt!64713 (getCurrentListMapNoExtraKeys!122 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64715 () (_ BitVec 64))

(assert (=> b!125621 (= lt!64715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64700 () (_ BitVec 64))

(assert (=> b!125621 (= lt!64700 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64699 () Unit!3865)

(assert (=> b!125621 (= lt!64699 (addStillContains!86 lt!64713 lt!64715 (zeroValue!2628 newMap!16) lt!64700))))

(assert (=> b!125621 (contains!863 (+!157 lt!64713 (tuple2!2535 lt!64715 (zeroValue!2628 newMap!16))) lt!64700)))

(declare-fun lt!64709 () Unit!3865)

(assert (=> b!125621 (= lt!64709 lt!64699)))

(declare-fun lt!64706 () ListLongMap!1643)

(assert (=> b!125621 (= lt!64706 (getCurrentListMapNoExtraKeys!122 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64698 () (_ BitVec 64))

(assert (=> b!125621 (= lt!64698 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64718 () (_ BitVec 64))

(assert (=> b!125621 (= lt!64718 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64701 () Unit!3865)

(assert (=> b!125621 (= lt!64701 (addApplyDifferent!86 lt!64706 lt!64698 (minValue!2628 newMap!16) lt!64718))))

(assert (=> b!125621 (= (apply!110 (+!157 lt!64706 (tuple2!2535 lt!64698 (minValue!2628 newMap!16))) lt!64718) (apply!110 lt!64706 lt!64718))))

(declare-fun lt!64703 () Unit!3865)

(assert (=> b!125621 (= lt!64703 lt!64701)))

(declare-fun lt!64719 () ListLongMap!1643)

(assert (=> b!125621 (= lt!64719 (getCurrentListMapNoExtraKeys!122 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64702 () (_ BitVec 64))

(assert (=> b!125621 (= lt!64702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64717 () (_ BitVec 64))

(assert (=> b!125621 (= lt!64717 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!64711 () Unit!3865)

(assert (=> b!125621 (= lt!64711 (addApplyDifferent!86 lt!64719 lt!64702 (zeroValue!2628 newMap!16) lt!64717))))

(assert (=> b!125621 (= (apply!110 (+!157 lt!64719 (tuple2!2535 lt!64702 (zeroValue!2628 newMap!16))) lt!64717) (apply!110 lt!64719 lt!64717))))

(declare-fun lt!64708 () Unit!3865)

(assert (=> b!125621 (= lt!64708 lt!64711)))

(declare-fun lt!64704 () ListLongMap!1643)

(assert (=> b!125621 (= lt!64704 (getCurrentListMapNoExtraKeys!122 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64714 () (_ BitVec 64))

(assert (=> b!125621 (= lt!64714 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64705 () (_ BitVec 64))

(assert (=> b!125621 (= lt!64705 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!125621 (= lt!64712 (addApplyDifferent!86 lt!64704 lt!64714 (minValue!2628 newMap!16) lt!64705))))

(assert (=> b!125621 (= (apply!110 (+!157 lt!64704 (tuple2!2535 lt!64714 (minValue!2628 newMap!16))) lt!64705) (apply!110 lt!64704 lt!64705))))

(declare-fun b!125622 () Bool)

(assert (=> b!125622 (= e!82046 (not call!13457))))

(declare-fun bm!13455 () Bool)

(assert (=> bm!13455 (= call!13457 (contains!863 lt!64710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125623 () Bool)

(assert (=> b!125623 (= e!82055 e!82047)))

(declare-fun res!60792 () Bool)

(assert (=> b!125623 (=> (not res!60792) (not e!82047))))

(assert (=> b!125623 (= res!60792 (contains!863 lt!64710 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!125623 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun b!125624 () Bool)

(declare-fun c!22924 () Bool)

(assert (=> b!125624 (= c!22924 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125624 (= e!82050 e!82051)))

(assert (= (and d!37827 c!22925) b!125619))

(assert (= (and d!37827 (not c!22925)) b!125610))

(assert (= (and b!125610 c!22928) b!125614))

(assert (= (and b!125610 (not c!22928)) b!125624))

(assert (= (and b!125624 c!22924) b!125605))

(assert (= (and b!125624 (not c!22924)) b!125618))

(assert (= (or b!125605 b!125618) bm!13452))

(assert (= (or b!125614 bm!13452) bm!13449))

(assert (= (or b!125614 b!125605) bm!13450))

(assert (= (or b!125619 bm!13449) bm!13454))

(assert (= (or b!125619 bm!13450) bm!13451))

(assert (= (and d!37827 res!60795) b!125606))

(assert (= (and d!37827 c!22923) b!125621))

(assert (= (and d!37827 (not c!22923)) b!125611))

(assert (= (and d!37827 res!60793) b!125612))

(assert (= (and b!125612 res!60799) b!125608))

(assert (= (and b!125612 (not res!60791)) b!125623))

(assert (= (and b!125623 res!60792) b!125609))

(assert (= (and b!125612 res!60794) b!125615))

(assert (= (and b!125615 c!22926) b!125613))

(assert (= (and b!125615 (not c!22926)) b!125622))

(assert (= (and b!125613 res!60798) b!125604))

(assert (= (or b!125613 b!125622) bm!13455))

(assert (= (and b!125615 res!60797) b!125617))

(assert (= (and b!125617 c!22927) b!125620))

(assert (= (and b!125617 (not c!22927)) b!125616))

(assert (= (and b!125620 res!60796) b!125607))

(assert (= (or b!125620 b!125616) bm!13453))

(declare-fun b_lambda!5501 () Bool)

(assert (=> (not b_lambda!5501) (not b!125609)))

(assert (=> b!125609 t!6019))

(declare-fun b_and!7705 () Bool)

(assert (= b_and!7701 (and (=> t!6019 result!3815) b_and!7705)))

(assert (=> b!125609 t!6021))

(declare-fun b_and!7707 () Bool)

(assert (= b_and!7703 (and (=> t!6021 result!3817) b_and!7707)))

(assert (=> b!125623 m!146005))

(assert (=> b!125623 m!146005))

(declare-fun m!146113 () Bool)

(assert (=> b!125623 m!146113))

(declare-fun m!146115 () Bool)

(assert (=> b!125604 m!146115))

(declare-fun m!146117 () Bool)

(assert (=> b!125607 m!146117))

(assert (=> b!125608 m!146005))

(assert (=> b!125608 m!146005))

(assert (=> b!125608 m!146007))

(declare-fun m!146119 () Bool)

(assert (=> bm!13453 m!146119))

(declare-fun m!146121 () Bool)

(assert (=> bm!13451 m!146121))

(assert (=> b!125609 m!144665))

(declare-fun m!146123 () Bool)

(assert (=> b!125609 m!146123))

(assert (=> b!125609 m!144665))

(declare-fun m!146125 () Bool)

(assert (=> b!125609 m!146125))

(assert (=> b!125609 m!146005))

(assert (=> b!125609 m!146123))

(assert (=> b!125609 m!146005))

(declare-fun m!146127 () Bool)

(assert (=> b!125609 m!146127))

(declare-fun m!146129 () Bool)

(assert (=> bm!13455 m!146129))

(assert (=> b!125606 m!146005))

(assert (=> b!125606 m!146005))

(assert (=> b!125606 m!146007))

(declare-fun m!146131 () Bool)

(assert (=> b!125619 m!146131))

(declare-fun m!146133 () Bool)

(assert (=> bm!13454 m!146133))

(declare-fun m!146135 () Bool)

(assert (=> b!125621 m!146135))

(declare-fun m!146137 () Bool)

(assert (=> b!125621 m!146137))

(declare-fun m!146139 () Bool)

(assert (=> b!125621 m!146139))

(declare-fun m!146141 () Bool)

(assert (=> b!125621 m!146141))

(assert (=> b!125621 m!146133))

(assert (=> b!125621 m!146137))

(declare-fun m!146143 () Bool)

(assert (=> b!125621 m!146143))

(declare-fun m!146145 () Bool)

(assert (=> b!125621 m!146145))

(declare-fun m!146147 () Bool)

(assert (=> b!125621 m!146147))

(declare-fun m!146149 () Bool)

(assert (=> b!125621 m!146149))

(declare-fun m!146151 () Bool)

(assert (=> b!125621 m!146151))

(assert (=> b!125621 m!146005))

(declare-fun m!146153 () Bool)

(assert (=> b!125621 m!146153))

(declare-fun m!146155 () Bool)

(assert (=> b!125621 m!146155))

(declare-fun m!146157 () Bool)

(assert (=> b!125621 m!146157))

(declare-fun m!146159 () Bool)

(assert (=> b!125621 m!146159))

(assert (=> b!125621 m!146157))

(assert (=> b!125621 m!146145))

(declare-fun m!146161 () Bool)

(assert (=> b!125621 m!146161))

(assert (=> b!125621 m!146149))

(declare-fun m!146163 () Bool)

(assert (=> b!125621 m!146163))

(assert (=> d!37827 m!144709))

(assert (=> d!37461 d!37827))

(declare-fun d!37829 () Bool)

(declare-fun e!82064 () Bool)

(assert (=> d!37829 e!82064))

(declare-fun res!60811 () Bool)

(assert (=> d!37829 (=> (not res!60811) (not e!82064))))

(assert (=> d!37829 (= res!60811 (and (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000) (bvslt (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (size!2470 (_keys!4491 newMap!16)))))))

(declare-fun lt!64722 () Unit!3865)

(declare-fun choose!1 (array!4661 (_ BitVec 32) (_ BitVec 64)) Unit!3865)

(assert (=> d!37829 (= lt!64722 (choose!1 (_keys!4491 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun e!82063 () Bool)

(assert (=> d!37829 e!82063))

(declare-fun res!60808 () Bool)

(assert (=> d!37829 (=> (not res!60808) (not e!82063))))

(assert (=> d!37829 (= res!60808 (and (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000) (bvslt (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (size!2470 (_keys!4491 newMap!16)))))))

(assert (=> d!37829 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4491 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) lt!64722)))

(declare-fun b!125634 () Bool)

(declare-fun res!60810 () Bool)

(assert (=> b!125634 (=> (not res!60810) (not e!82063))))

(assert (=> b!125634 (= res!60810 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun b!125635 () Bool)

(assert (=> b!125635 (= e!82063 (bvslt (size!2470 (_keys!4491 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!125633 () Bool)

(declare-fun res!60809 () Bool)

(assert (=> b!125633 (=> (not res!60809) (not e!82063))))

(assert (=> b!125633 (= res!60809 (not (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))))))))

(declare-fun b!125636 () Bool)

(assert (=> b!125636 (= e!82064 (= (arrayCountValidKeys!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4491 newMap!16) #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) #b00000000000000000000000000000001)))))

(assert (= (and d!37829 res!60808) b!125633))

(assert (= (and b!125633 res!60809) b!125634))

(assert (= (and b!125634 res!60810) b!125635))

(assert (= (and d!37829 res!60811) b!125636))

(assert (=> d!37829 m!144407))

(declare-fun m!146165 () Bool)

(assert (=> d!37829 m!146165))

(assert (=> b!125634 m!144407))

(declare-fun m!146167 () Bool)

(assert (=> b!125634 m!146167))

(declare-fun m!146169 () Bool)

(assert (=> b!125633 m!146169))

(assert (=> b!125633 m!146169))

(declare-fun m!146171 () Bool)

(assert (=> b!125633 m!146171))

(assert (=> b!125636 m!144981))

(assert (=> b!125636 m!144979))

(assert (=> b!125636 m!144573))

(assert (=> d!37461 d!37829))

(declare-fun b!125637 () Bool)

(declare-fun e!82068 () Bool)

(declare-fun e!82067 () Bool)

(assert (=> b!125637 (= e!82068 e!82067)))

(declare-fun c!22929 () Bool)

(assert (=> b!125637 (= c!22929 (validKeyInArray!0 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) lt!64337)))))

(declare-fun b!125638 () Bool)

(declare-fun e!82065 () Bool)

(assert (=> b!125638 (= e!82065 e!82068)))

(declare-fun res!60814 () Bool)

(assert (=> b!125638 (=> (not res!60814) (not e!82068))))

(declare-fun e!82066 () Bool)

(assert (=> b!125638 (= res!60814 (not e!82066))))

(declare-fun res!60813 () Bool)

(assert (=> b!125638 (=> (not res!60813) (not e!82066))))

(assert (=> b!125638 (= res!60813 (validKeyInArray!0 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) lt!64337)))))

(declare-fun b!125639 () Bool)

(declare-fun call!13459 () Bool)

(assert (=> b!125639 (= e!82067 call!13459)))

(declare-fun d!37831 () Bool)

(declare-fun res!60812 () Bool)

(assert (=> d!37831 (=> res!60812 e!82065)))

(assert (=> d!37831 (= res!60812 (bvsge lt!64337 (size!2470 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))))))))

(assert (=> d!37831 (= (arrayNoDuplicates!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) lt!64337 lt!64326) e!82065)))

(declare-fun b!125640 () Bool)

(assert (=> b!125640 (= e!82067 call!13459)))

(declare-fun bm!13456 () Bool)

(assert (=> bm!13456 (= call!13459 (arrayNoDuplicates!0 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16))) (bvadd lt!64337 #b00000000000000000000000000000001) (ite c!22929 (Cons!1687 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) lt!64337) lt!64326) lt!64326)))))

(declare-fun b!125641 () Bool)

(assert (=> b!125641 (= e!82066 (contains!866 lt!64326 (select (arr!2206 (array!4662 (store (arr!2206 (_keys!4491 newMap!16)) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (size!2470 (_keys!4491 newMap!16)))) lt!64337)))))

(assert (= (and d!37831 (not res!60812)) b!125638))

(assert (= (and b!125638 res!60813) b!125641))

(assert (= (and b!125638 res!60814) b!125637))

(assert (= (and b!125637 c!22929) b!125639))

(assert (= (and b!125637 (not c!22929)) b!125640))

(assert (= (or b!125639 b!125640) bm!13456))

(declare-fun m!146173 () Bool)

(assert (=> b!125637 m!146173))

(assert (=> b!125637 m!146173))

(declare-fun m!146175 () Bool)

(assert (=> b!125637 m!146175))

(assert (=> b!125638 m!146173))

(assert (=> b!125638 m!146173))

(assert (=> b!125638 m!146175))

(assert (=> bm!13456 m!146173))

(declare-fun m!146177 () Bool)

(assert (=> bm!13456 m!146177))

(assert (=> b!125641 m!146173))

(assert (=> b!125641 m!146173))

(declare-fun m!146179 () Bool)

(assert (=> b!125641 m!146179))

(assert (=> d!37461 d!37831))

(declare-fun d!37833 () Bool)

(declare-fun e!82069 () Bool)

(assert (=> d!37833 e!82069))

(declare-fun res!60815 () Bool)

(assert (=> d!37833 (=> (not res!60815) (not e!82069))))

(assert (=> d!37833 (= res!60815 (and (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000) (bvslt (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (size!2470 lt!64324))))))

(declare-fun lt!64723 () Unit!3865)

(assert (=> d!37833 (= lt!64723 (choose!756 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (defaultEntry!2763 newMap!16)))))

(assert (=> d!37833 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37833 (= (lemmaValidKeyInArrayIsInListMap!114 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) (defaultEntry!2763 newMap!16)) lt!64723)))

(declare-fun b!125642 () Bool)

(assert (=> b!125642 (= e!82069 (contains!863 (getCurrentListMap!507 lt!64324 lt!64317 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 lt!64324) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)))))))

(assert (= (and d!37833 res!60815) b!125642))

(declare-fun m!146181 () Bool)

(assert (=> d!37833 m!146181))

(assert (=> d!37833 m!144709))

(assert (=> b!125642 m!144983))

(declare-fun m!146183 () Bool)

(assert (=> b!125642 m!146183))

(assert (=> b!125642 m!144983))

(assert (=> b!125642 m!146183))

(declare-fun m!146185 () Bool)

(assert (=> b!125642 m!146185))

(assert (=> d!37461 d!37833))

(assert (=> d!37461 d!37443))

(declare-fun d!37835 () Bool)

(assert (=> d!37835 (arrayContainsKey!0 lt!64323 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!64724 () Unit!3865)

(assert (=> d!37835 (= lt!64724 (choose!13 lt!64323 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))))))

(assert (=> d!37835 (bvsge (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028)) #b00000000000000000000000000000000)))

(assert (=> d!37835 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!64323 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (ite c!22685 (index!3245 lt!64028) (index!3242 lt!64028))) lt!64724)))

(declare-fun bs!5197 () Bool)

(assert (= bs!5197 d!37835))

(assert (=> bs!5197 m!144407))

(assert (=> bs!5197 m!144995))

(assert (=> bs!5197 m!144407))

(declare-fun m!146187 () Bool)

(assert (=> bs!5197 m!146187))

(assert (=> d!37461 d!37835))

(assert (=> d!37461 d!37471))

(declare-fun b!125645 () Bool)

(declare-fun e!82071 () Option!170)

(assert (=> b!125645 (= e!82071 (getValueByKey!164 (t!6007 (toList!837 lt!64252)) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun d!37837 () Bool)

(declare-fun c!22930 () Bool)

(assert (=> d!37837 (= c!22930 (and ((_ is Cons!1685) (toList!837 lt!64252)) (= (_1!1278 (h!2286 (toList!837 lt!64252))) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!82070 () Option!170)

(assert (=> d!37837 (= (getValueByKey!164 (toList!837 lt!64252) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!82070)))

(declare-fun b!125646 () Bool)

(assert (=> b!125646 (= e!82071 None!168)))

(declare-fun b!125644 () Bool)

(assert (=> b!125644 (= e!82070 e!82071)))

(declare-fun c!22931 () Bool)

(assert (=> b!125644 (= c!22931 (and ((_ is Cons!1685) (toList!837 lt!64252)) (not (= (_1!1278 (h!2286 (toList!837 lt!64252))) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125643 () Bool)

(assert (=> b!125643 (= e!82070 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64252)))))))

(assert (= (and d!37837 c!22930) b!125643))

(assert (= (and d!37837 (not c!22930)) b!125644))

(assert (= (and b!125644 c!22931) b!125645))

(assert (= (and b!125644 (not c!22931)) b!125646))

(declare-fun m!146189 () Bool)

(assert (=> b!125645 m!146189))

(assert (=> b!124988 d!37837))

(declare-fun b!125647 () Bool)

(declare-fun e!82075 () Bool)

(assert (=> b!125647 (= e!82075 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!125647 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!125648 () Bool)

(declare-fun lt!64730 () Unit!3865)

(declare-fun lt!64729 () Unit!3865)

(assert (=> b!125648 (= lt!64730 lt!64729)))

(declare-fun lt!64727 () (_ BitVec 64))

(declare-fun lt!64725 () ListLongMap!1643)

(declare-fun lt!64728 () V!3425)

(declare-fun lt!64731 () (_ BitVec 64))

(assert (=> b!125648 (not (contains!863 (+!157 lt!64725 (tuple2!2535 lt!64731 lt!64728)) lt!64727))))

(assert (=> b!125648 (= lt!64729 (addStillNotContains!56 lt!64725 lt!64731 lt!64728 lt!64727))))

(assert (=> b!125648 (= lt!64727 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125648 (= lt!64728 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125648 (= lt!64731 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!13460 () ListLongMap!1643)

(assert (=> b!125648 (= lt!64725 call!13460)))

(declare-fun e!82078 () ListLongMap!1643)

(assert (=> b!125648 (= e!82078 (+!157 call!13460 (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!37839 () Bool)

(declare-fun e!82077 () Bool)

(assert (=> d!37839 e!82077))

(declare-fun res!60817 () Bool)

(assert (=> d!37839 (=> (not res!60817) (not e!82077))))

(declare-fun lt!64726 () ListLongMap!1643)

(assert (=> d!37839 (= res!60817 (not (contains!863 lt!64726 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!82076 () ListLongMap!1643)

(assert (=> d!37839 (= lt!64726 e!82076)))

(declare-fun c!22933 () Bool)

(assert (=> d!37839 (= c!22933 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> d!37839 (validMask!0 (mask!7008 (v!3101 (underlying!432 thiss!992))))))

(assert (=> d!37839 (= (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))) lt!64726)))

(declare-fun b!125649 () Bool)

(assert (=> b!125649 (= e!82078 call!13460)))

(declare-fun bm!13457 () Bool)

(assert (=> bm!13457 (= call!13460 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992)))))))

(declare-fun b!125650 () Bool)

(declare-fun e!82072 () Bool)

(assert (=> b!125650 (= e!82077 e!82072)))

(declare-fun c!22932 () Bool)

(assert (=> b!125650 (= c!22932 e!82075)))

(declare-fun res!60819 () Bool)

(assert (=> b!125650 (=> (not res!60819) (not e!82075))))

(assert (=> b!125650 (= res!60819 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125651 () Bool)

(assert (=> b!125651 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> b!125651 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2471 (_values!2746 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun e!82073 () Bool)

(assert (=> b!125651 (= e!82073 (= (apply!110 lt!64726 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!82074 () Bool)

(declare-fun b!125652 () Bool)

(assert (=> b!125652 (= e!82074 (= lt!64726 (getCurrentListMapNoExtraKeys!122 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (_values!2746 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992))) (extraKeys!2548 (v!3101 (underlying!432 thiss!992))) (zeroValue!2628 (v!3101 (underlying!432 thiss!992))) (minValue!2628 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125653 () Bool)

(assert (=> b!125653 (= e!82072 e!82073)))

(assert (=> b!125653 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun res!60818 () Bool)

(assert (=> b!125653 (= res!60818 (contains!863 lt!64726 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!125653 (=> (not res!60818) (not e!82073))))

(declare-fun b!125654 () Bool)

(declare-fun res!60816 () Bool)

(assert (=> b!125654 (=> (not res!60816) (not e!82077))))

(assert (=> b!125654 (= res!60816 (not (contains!863 lt!64726 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125655 () Bool)

(assert (=> b!125655 (= e!82072 e!82074)))

(declare-fun c!22935 () Bool)

(assert (=> b!125655 (= c!22935 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125656 () Bool)

(assert (=> b!125656 (= e!82076 e!82078)))

(declare-fun c!22934 () Bool)

(assert (=> b!125656 (= c!22934 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!125657 () Bool)

(assert (=> b!125657 (= e!82074 (isEmpty!398 lt!64726))))

(declare-fun b!125658 () Bool)

(assert (=> b!125658 (= e!82076 (ListLongMap!1644 Nil!1686))))

(assert (= (and d!37839 c!22933) b!125658))

(assert (= (and d!37839 (not c!22933)) b!125656))

(assert (= (and b!125656 c!22934) b!125648))

(assert (= (and b!125656 (not c!22934)) b!125649))

(assert (= (or b!125648 b!125649) bm!13457))

(assert (= (and d!37839 res!60817) b!125654))

(assert (= (and b!125654 res!60816) b!125650))

(assert (= (and b!125650 res!60819) b!125647))

(assert (= (and b!125650 c!22932) b!125653))

(assert (= (and b!125650 (not c!22932)) b!125655))

(assert (= (and b!125653 res!60818) b!125651))

(assert (= (and b!125655 c!22935) b!125652))

(assert (= (and b!125655 (not c!22935)) b!125657))

(declare-fun b_lambda!5503 () Bool)

(assert (=> (not b_lambda!5503) (not b!125648)))

(assert (=> b!125648 t!6004))

(declare-fun b_and!7709 () Bool)

(assert (= b_and!7705 (and (=> t!6004 result!3795) b_and!7709)))

(assert (=> b!125648 t!6006))

(declare-fun b_and!7711 () Bool)

(assert (= b_and!7707 (and (=> t!6006 result!3799) b_and!7711)))

(declare-fun b_lambda!5505 () Bool)

(assert (=> (not b_lambda!5505) (not b!125651)))

(assert (=> b!125651 t!6004))

(declare-fun b_and!7713 () Bool)

(assert (= b_and!7709 (and (=> t!6004 result!3795) b_and!7713)))

(assert (=> b!125651 t!6006))

(declare-fun b_and!7715 () Bool)

(assert (= b_and!7711 (and (=> t!6006 result!3799) b_and!7715)))

(declare-fun m!146191 () Bool)

(assert (=> b!125654 m!146191))

(declare-fun m!146193 () Bool)

(assert (=> b!125657 m!146193))

(declare-fun m!146195 () Bool)

(assert (=> b!125648 m!146195))

(declare-fun m!146197 () Bool)

(assert (=> b!125648 m!146197))

(declare-fun m!146199 () Bool)

(assert (=> b!125648 m!146199))

(declare-fun m!146201 () Bool)

(assert (=> b!125648 m!146201))

(assert (=> b!125648 m!144417))

(declare-fun m!146203 () Bool)

(assert (=> b!125648 m!146203))

(assert (=> b!125648 m!146195))

(assert (=> b!125648 m!146201))

(assert (=> b!125648 m!144417))

(declare-fun m!146205 () Bool)

(assert (=> b!125648 m!146205))

(declare-fun m!146207 () Bool)

(assert (=> b!125648 m!146207))

(declare-fun m!146209 () Bool)

(assert (=> bm!13457 m!146209))

(assert (=> b!125653 m!146205))

(assert (=> b!125653 m!146205))

(declare-fun m!146211 () Bool)

(assert (=> b!125653 m!146211))

(assert (=> b!125651 m!146205))

(declare-fun m!146213 () Bool)

(assert (=> b!125651 m!146213))

(assert (=> b!125651 m!146201))

(assert (=> b!125651 m!144417))

(assert (=> b!125651 m!146203))

(assert (=> b!125651 m!146201))

(assert (=> b!125651 m!144417))

(assert (=> b!125651 m!146205))

(declare-fun m!146215 () Bool)

(assert (=> d!37839 m!146215))

(assert (=> d!37839 m!144431))

(assert (=> b!125647 m!146205))

(assert (=> b!125647 m!146205))

(declare-fun m!146217 () Bool)

(assert (=> b!125647 m!146217))

(assert (=> b!125652 m!146209))

(assert (=> b!125656 m!146205))

(assert (=> b!125656 m!146205))

(assert (=> b!125656 m!146217))

(assert (=> b!124966 d!37839))

(declare-fun d!37841 () Bool)

(assert (=> d!37841 (= (apply!110 lt!64211 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1439 (getValueByKey!164 (toList!837 lt!64211) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5198 () Bool)

(assert (= bs!5198 d!37841))

(assert (=> bs!5198 m!144651))

(assert (=> bs!5198 m!145227))

(assert (=> bs!5198 m!145227))

(declare-fun m!146219 () Bool)

(assert (=> bs!5198 m!146219))

(assert (=> b!124921 d!37841))

(declare-fun d!37843 () Bool)

(declare-fun c!22936 () Bool)

(assert (=> d!37843 (= c!22936 ((_ is ValueCellFull!1073) (select (arr!2207 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!82079 () V!3425)

(assert (=> d!37843 (= (get!1435 (select (arr!2207 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82079)))

(declare-fun b!125659 () Bool)

(assert (=> b!125659 (= e!82079 (get!1437 (select (arr!2207 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125660 () Bool)

(assert (=> b!125660 (= e!82079 (get!1438 (select (arr!2207 (ite c!22681 (_values!2746 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37843 c!22936) b!125659))

(assert (= (and d!37843 (not c!22936)) b!125660))

(assert (=> b!125659 m!144869))

(assert (=> b!125659 m!144665))

(declare-fun m!146221 () Bool)

(assert (=> b!125659 m!146221))

(assert (=> b!125660 m!144869))

(assert (=> b!125660 m!144665))

(declare-fun m!146223 () Bool)

(assert (=> b!125660 m!146223))

(assert (=> b!124921 d!37843))

(declare-fun d!37845 () Bool)

(assert (=> d!37845 (= (apply!110 lt!64157 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1439 (getValueByKey!164 (toList!837 lt!64157) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5199 () Bool)

(assert (= bs!5199 d!37845))

(assert (=> bs!5199 m!144651))

(assert (=> bs!5199 m!145219))

(assert (=> bs!5199 m!145219))

(declare-fun m!146225 () Bool)

(assert (=> bs!5199 m!146225))

(assert (=> b!124825 d!37845))

(declare-fun d!37847 () Bool)

(declare-fun c!22937 () Bool)

(assert (=> d!37847 (= c!22937 ((_ is ValueCellFull!1073) (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!82080 () V!3425)

(assert (=> d!37847 (= (get!1435 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82080)))

(declare-fun b!125661 () Bool)

(assert (=> b!125661 (= e!82080 (get!1437 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125662 () Bool)

(assert (=> b!125662 (= e!82080 (get!1438 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37847 c!22937) b!125661))

(assert (= (and d!37847 (not c!22937)) b!125662))

(assert (=> b!125661 m!144757))

(assert (=> b!125661 m!144665))

(declare-fun m!146227 () Bool)

(assert (=> b!125661 m!146227))

(assert (=> b!125662 m!144757))

(assert (=> b!125662 m!144665))

(declare-fun m!146229 () Bool)

(assert (=> b!125662 m!146229))

(assert (=> b!124825 d!37847))

(assert (=> b!125089 d!37547))

(assert (=> b!125089 d!37549))

(declare-fun d!37849 () Bool)

(assert (=> d!37849 (= (get!1439 (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3107 (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37413 d!37849))

(assert (=> d!37413 d!37761))

(declare-fun d!37851 () Bool)

(declare-fun e!82081 () Bool)

(assert (=> d!37851 e!82081))

(declare-fun res!60820 () Bool)

(assert (=> d!37851 (=> res!60820 e!82081)))

(declare-fun lt!64732 () Bool)

(assert (=> d!37851 (= res!60820 (not lt!64732))))

(declare-fun lt!64735 () Bool)

(assert (=> d!37851 (= lt!64732 lt!64735)))

(declare-fun lt!64734 () Unit!3865)

(declare-fun e!82082 () Unit!3865)

(assert (=> d!37851 (= lt!64734 e!82082)))

(declare-fun c!22938 () Bool)

(assert (=> d!37851 (= c!22938 lt!64735)))

(assert (=> d!37851 (= lt!64735 (containsKey!168 (toList!837 lt!64144) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!37851 (= (contains!863 lt!64144 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) lt!64732)))

(declare-fun b!125663 () Bool)

(declare-fun lt!64733 () Unit!3865)

(assert (=> b!125663 (= e!82082 lt!64733)))

(assert (=> b!125663 (= lt!64733 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64144) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> b!125663 (isDefined!118 (getValueByKey!164 (toList!837 lt!64144) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125664 () Bool)

(declare-fun Unit!3908 () Unit!3865)

(assert (=> b!125664 (= e!82082 Unit!3908)))

(declare-fun b!125665 () Bool)

(assert (=> b!125665 (= e!82081 (isDefined!118 (getValueByKey!164 (toList!837 lt!64144) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(assert (= (and d!37851 c!22938) b!125663))

(assert (= (and d!37851 (not c!22938)) b!125664))

(assert (= (and d!37851 (not res!60820)) b!125665))

(declare-fun m!146231 () Bool)

(assert (=> d!37851 m!146231))

(declare-fun m!146233 () Bool)

(assert (=> b!125663 m!146233))

(assert (=> b!125663 m!144735))

(assert (=> b!125663 m!144735))

(declare-fun m!146235 () Bool)

(assert (=> b!125663 m!146235))

(assert (=> b!125665 m!144735))

(assert (=> b!125665 m!144735))

(assert (=> b!125665 m!146235))

(assert (=> d!37417 d!37851))

(declare-fun e!82084 () Option!170)

(declare-fun b!125668 () Bool)

(assert (=> b!125668 (= e!82084 (getValueByKey!164 (t!6007 lt!64142) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun c!22939 () Bool)

(declare-fun d!37853 () Bool)

(assert (=> d!37853 (= c!22939 (and ((_ is Cons!1685) lt!64142) (= (_1!1278 (h!2286 lt!64142)) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun e!82083 () Option!170)

(assert (=> d!37853 (= (getValueByKey!164 lt!64142 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) e!82083)))

(declare-fun b!125669 () Bool)

(assert (=> b!125669 (= e!82084 None!168)))

(declare-fun b!125667 () Bool)

(assert (=> b!125667 (= e!82083 e!82084)))

(declare-fun c!22940 () Bool)

(assert (=> b!125667 (= c!22940 (and ((_ is Cons!1685) lt!64142) (not (= (_1!1278 (h!2286 lt!64142)) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))))

(declare-fun b!125666 () Bool)

(assert (=> b!125666 (= e!82083 (Some!169 (_2!1278 (h!2286 lt!64142))))))

(assert (= (and d!37853 c!22939) b!125666))

(assert (= (and d!37853 (not c!22939)) b!125667))

(assert (= (and b!125667 c!22940) b!125668))

(assert (= (and b!125667 (not c!22940)) b!125669))

(declare-fun m!146237 () Bool)

(assert (=> b!125668 m!146237))

(assert (=> d!37417 d!37853))

(declare-fun d!37855 () Bool)

(assert (=> d!37855 (= (getValueByKey!164 lt!64142 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) (Some!169 (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun lt!64736 () Unit!3865)

(assert (=> d!37855 (= lt!64736 (choose!764 lt!64142 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!82085 () Bool)

(assert (=> d!37855 e!82085))

(declare-fun res!60821 () Bool)

(assert (=> d!37855 (=> (not res!60821) (not e!82085))))

(assert (=> d!37855 (= res!60821 (isStrictlySorted!311 lt!64142))))

(assert (=> d!37855 (= (lemmaContainsTupThenGetReturnValue!82 lt!64142 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) lt!64736)))

(declare-fun b!125670 () Bool)

(declare-fun res!60822 () Bool)

(assert (=> b!125670 (=> (not res!60822) (not e!82085))))

(assert (=> b!125670 (= res!60822 (containsKey!168 lt!64142 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125671 () Bool)

(assert (=> b!125671 (= e!82085 (contains!865 lt!64142 (tuple2!2535 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(assert (= (and d!37855 res!60821) b!125670))

(assert (= (and b!125670 res!60822) b!125671))

(assert (=> d!37855 m!144729))

(declare-fun m!146239 () Bool)

(assert (=> d!37855 m!146239))

(declare-fun m!146241 () Bool)

(assert (=> d!37855 m!146241))

(declare-fun m!146243 () Bool)

(assert (=> b!125670 m!146243))

(declare-fun m!146245 () Bool)

(assert (=> b!125671 m!146245))

(assert (=> d!37417 d!37855))

(declare-fun b!125672 () Bool)

(declare-fun e!82088 () List!1689)

(declare-fun call!13463 () List!1689)

(assert (=> b!125672 (= e!82088 call!13463)))

(declare-fun bm!13458 () Bool)

(declare-fun call!13461 () List!1689)

(declare-fun call!13462 () List!1689)

(assert (=> bm!13458 (= call!13461 call!13462)))

(declare-fun b!125673 () Bool)

(declare-fun e!82090 () List!1689)

(assert (=> b!125673 (= e!82090 call!13462)))

(declare-fun d!37857 () Bool)

(declare-fun e!82089 () Bool)

(assert (=> d!37857 e!82089))

(declare-fun res!60824 () Bool)

(assert (=> d!37857 (=> (not res!60824) (not e!82089))))

(declare-fun lt!64737 () List!1689)

(assert (=> d!37857 (= res!60824 (isStrictlySorted!311 lt!64737))))

(assert (=> d!37857 (= lt!64737 e!82090)))

(declare-fun c!22942 () Bool)

(assert (=> d!37857 (= c!22942 (and ((_ is Cons!1685) (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)))) (bvslt (_1!1278 (h!2286 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340))))) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(assert (=> d!37857 (isStrictlySorted!311 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340))))))

(assert (=> d!37857 (= (insertStrictlySorted!85 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340))) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) lt!64737)))

(declare-fun b!125674 () Bool)

(assert (=> b!125674 (= e!82088 call!13463)))

(declare-fun bm!13459 () Bool)

(declare-fun e!82087 () List!1689)

(assert (=> bm!13459 (= call!13462 ($colon$colon!87 e!82087 (ite c!22942 (h!2286 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)))) (tuple2!2535 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))))

(declare-fun c!22941 () Bool)

(assert (=> bm!13459 (= c!22941 c!22942)))

(declare-fun b!125675 () Bool)

(declare-fun e!82086 () List!1689)

(assert (=> b!125675 (= e!82090 e!82086)))

(declare-fun c!22943 () Bool)

(assert (=> b!125675 (= c!22943 (and ((_ is Cons!1685) (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)))) (= (_1!1278 (h!2286 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340))))) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun c!22944 () Bool)

(declare-fun b!125676 () Bool)

(assert (=> b!125676 (= c!22944 (and ((_ is Cons!1685) (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)))) (bvsgt (_1!1278 (h!2286 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340))))) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(assert (=> b!125676 (= e!82086 e!82088)))

(declare-fun b!125677 () Bool)

(assert (=> b!125677 (= e!82089 (contains!865 lt!64737 (tuple2!2535 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125678 () Bool)

(assert (=> b!125678 (= e!82087 (insertStrictlySorted!85 (t!6007 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)))) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (_2!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125679 () Bool)

(assert (=> b!125679 (= e!82086 call!13461)))

(declare-fun bm!13460 () Bool)

(assert (=> bm!13460 (= call!13463 call!13461)))

(declare-fun b!125680 () Bool)

(declare-fun res!60823 () Bool)

(assert (=> b!125680 (=> (not res!60823) (not e!82089))))

(assert (=> b!125680 (= res!60823 (containsKey!168 lt!64737 (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125681 () Bool)

(assert (=> b!125681 (= e!82087 (ite c!22943 (t!6007 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)))) (ite c!22944 (Cons!1685 (h!2286 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340)))) (t!6007 (toList!837 (ite c!22704 call!13341 (ite c!22707 call!13343 call!13340))))) Nil!1686)))))

(assert (= (and d!37857 c!22942) b!125673))

(assert (= (and d!37857 (not c!22942)) b!125675))

(assert (= (and b!125675 c!22943) b!125679))

(assert (= (and b!125675 (not c!22943)) b!125676))

(assert (= (and b!125676 c!22944) b!125674))

(assert (= (and b!125676 (not c!22944)) b!125672))

(assert (= (or b!125674 b!125672) bm!13460))

(assert (= (or b!125679 bm!13460) bm!13458))

(assert (= (or b!125673 bm!13458) bm!13459))

(assert (= (and bm!13459 c!22941) b!125678))

(assert (= (and bm!13459 (not c!22941)) b!125681))

(assert (= (and d!37857 res!60824) b!125680))

(assert (= (and b!125680 res!60823) b!125677))

(declare-fun m!146247 () Bool)

(assert (=> d!37857 m!146247))

(declare-fun m!146249 () Bool)

(assert (=> d!37857 m!146249))

(declare-fun m!146251 () Bool)

(assert (=> b!125680 m!146251))

(declare-fun m!146253 () Bool)

(assert (=> b!125678 m!146253))

(declare-fun m!146255 () Bool)

(assert (=> b!125677 m!146255))

(declare-fun m!146257 () Bool)

(assert (=> bm!13459 m!146257))

(assert (=> d!37417 d!37857))

(declare-fun e!82102 () SeekEntryResult!272)

(declare-fun b!125700 () Bool)

(assert (=> b!125700 (= e!82102 (Intermediate!272 true (toIndex!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (mask!7008 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!125701 () Bool)

(declare-fun e!82101 () SeekEntryResult!272)

(assert (=> b!125701 (= e!82101 (Intermediate!272 false (toIndex!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (mask!7008 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!125702 () Bool)

(declare-fun e!82105 () Bool)

(declare-fun lt!64742 () SeekEntryResult!272)

(assert (=> b!125702 (= e!82105 (bvsge (x!14820 lt!64742) #b01111111111111111111111111111110))))

(declare-fun b!125703 () Bool)

(assert (=> b!125703 (and (bvsge (index!3244 lt!64742) #b00000000000000000000000000000000) (bvslt (index!3244 lt!64742) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun res!60833 () Bool)

(assert (=> b!125703 (= res!60833 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3244 lt!64742)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82104 () Bool)

(assert (=> b!125703 (=> res!60833 e!82104)))

(declare-fun b!125704 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!125704 (= e!82101 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (mask!7008 newMap!16)) #b00000000000000000000000000000000 (mask!7008 newMap!16)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun b!125705 () Bool)

(declare-fun e!82103 () Bool)

(assert (=> b!125705 (= e!82105 e!82103)))

(declare-fun res!60832 () Bool)

(assert (=> b!125705 (= res!60832 (and ((_ is Intermediate!272) lt!64742) (not (undefined!1084 lt!64742)) (bvslt (x!14820 lt!64742) #b01111111111111111111111111111110) (bvsge (x!14820 lt!64742) #b00000000000000000000000000000000) (bvsge (x!14820 lt!64742) #b00000000000000000000000000000000)))))

(assert (=> b!125705 (=> (not res!60832) (not e!82103))))

(declare-fun d!37859 () Bool)

(assert (=> d!37859 e!82105))

(declare-fun c!22952 () Bool)

(assert (=> d!37859 (= c!22952 (and ((_ is Intermediate!272) lt!64742) (undefined!1084 lt!64742)))))

(assert (=> d!37859 (= lt!64742 e!82102)))

(declare-fun c!22951 () Bool)

(assert (=> d!37859 (= c!22951 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!64743 () (_ BitVec 64))

(assert (=> d!37859 (= lt!64743 (select (arr!2206 (_keys!4491 newMap!16)) (toIndex!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (mask!7008 newMap!16))))))

(assert (=> d!37859 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (mask!7008 newMap!16)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)) lt!64742)))

(declare-fun b!125706 () Bool)

(assert (=> b!125706 (and (bvsge (index!3244 lt!64742) #b00000000000000000000000000000000) (bvslt (index!3244 lt!64742) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun res!60831 () Bool)

(assert (=> b!125706 (= res!60831 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3244 lt!64742)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> b!125706 (=> res!60831 e!82104)))

(assert (=> b!125706 (= e!82103 e!82104)))

(declare-fun b!125707 () Bool)

(assert (=> b!125707 (= e!82102 e!82101)))

(declare-fun c!22953 () Bool)

(assert (=> b!125707 (= c!22953 (or (= lt!64743 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (= (bvadd lt!64743 lt!64743) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125708 () Bool)

(assert (=> b!125708 (and (bvsge (index!3244 lt!64742) #b00000000000000000000000000000000) (bvslt (index!3244 lt!64742) (size!2470 (_keys!4491 newMap!16))))))

(assert (=> b!125708 (= e!82104 (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3244 lt!64742)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37859 c!22951) b!125700))

(assert (= (and d!37859 (not c!22951)) b!125707))

(assert (= (and b!125707 c!22953) b!125701))

(assert (= (and b!125707 (not c!22953)) b!125704))

(assert (= (and d!37859 c!22952) b!125702))

(assert (= (and d!37859 (not c!22952)) b!125705))

(assert (= (and b!125705 res!60832) b!125706))

(assert (= (and b!125706 (not res!60831)) b!125703))

(assert (= (and b!125703 (not res!60833)) b!125708))

(declare-fun m!146259 () Bool)

(assert (=> b!125703 m!146259))

(assert (=> b!125704 m!144811))

(declare-fun m!146261 () Bool)

(assert (=> b!125704 m!146261))

(assert (=> b!125704 m!146261))

(assert (=> b!125704 m!144407))

(declare-fun m!146263 () Bool)

(assert (=> b!125704 m!146263))

(assert (=> d!37859 m!144811))

(declare-fun m!146265 () Bool)

(assert (=> d!37859 m!146265))

(assert (=> d!37859 m!144709))

(assert (=> b!125708 m!146259))

(assert (=> b!125706 m!146259))

(assert (=> d!37425 d!37859))

(declare-fun d!37861 () Bool)

(declare-fun lt!64749 () (_ BitVec 32))

(declare-fun lt!64748 () (_ BitVec 32))

(assert (=> d!37861 (= lt!64749 (bvmul (bvxor lt!64748 (bvlshr lt!64748 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!37861 (= lt!64748 ((_ extract 31 0) (bvand (bvxor (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (bvlshr (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!37861 (and (bvsge (mask!7008 newMap!16) #b00000000000000000000000000000000) (let ((res!60834 (let ((h!2289 ((_ extract 31 0) (bvand (bvxor (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (bvlshr (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!14923 (bvmul (bvxor h!2289 (bvlshr h!2289 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!14923 (bvlshr x!14923 #b00000000000000000000000000001101)) (mask!7008 newMap!16)))))) (and (bvslt res!60834 (bvadd (mask!7008 newMap!16) #b00000000000000000000000000000001)) (bvsge res!60834 #b00000000000000000000000000000000))))))

(assert (=> d!37861 (= (toIndex!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (mask!7008 newMap!16)) (bvand (bvxor lt!64749 (bvlshr lt!64749 #b00000000000000000000000000001101)) (mask!7008 newMap!16)))))

(assert (=> d!37425 d!37861))

(assert (=> d!37425 d!37533))

(declare-fun d!37863 () Bool)

(declare-fun e!82106 () Bool)

(assert (=> d!37863 e!82106))

(declare-fun res!60835 () Bool)

(assert (=> d!37863 (=> res!60835 e!82106)))

(declare-fun lt!64750 () Bool)

(assert (=> d!37863 (= res!60835 (not lt!64750))))

(declare-fun lt!64753 () Bool)

(assert (=> d!37863 (= lt!64750 lt!64753)))

(declare-fun lt!64752 () Unit!3865)

(declare-fun e!82107 () Unit!3865)

(assert (=> d!37863 (= lt!64752 e!82107)))

(declare-fun c!22954 () Bool)

(assert (=> d!37863 (= c!22954 lt!64753)))

(assert (=> d!37863 (= lt!64753 (containsKey!168 (toList!837 lt!64091) lt!64092))))

(assert (=> d!37863 (= (contains!863 lt!64091 lt!64092) lt!64750)))

(declare-fun b!125709 () Bool)

(declare-fun lt!64751 () Unit!3865)

(assert (=> b!125709 (= e!82107 lt!64751)))

(assert (=> b!125709 (= lt!64751 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64091) lt!64092))))

(assert (=> b!125709 (isDefined!118 (getValueByKey!164 (toList!837 lt!64091) lt!64092))))

(declare-fun b!125710 () Bool)

(declare-fun Unit!3909 () Unit!3865)

(assert (=> b!125710 (= e!82107 Unit!3909)))

(declare-fun b!125711 () Bool)

(assert (=> b!125711 (= e!82106 (isDefined!118 (getValueByKey!164 (toList!837 lt!64091) lt!64092)))))

(assert (= (and d!37863 c!22954) b!125709))

(assert (= (and d!37863 (not c!22954)) b!125710))

(assert (= (and d!37863 (not res!60835)) b!125711))

(declare-fun m!146267 () Bool)

(assert (=> d!37863 m!146267))

(declare-fun m!146269 () Bool)

(assert (=> b!125709 m!146269))

(assert (=> b!125709 m!145057))

(assert (=> b!125709 m!145057))

(declare-fun m!146271 () Bool)

(assert (=> b!125709 m!146271))

(assert (=> b!125711 m!145057))

(assert (=> b!125711 m!145057))

(assert (=> b!125711 m!146271))

(assert (=> d!37487 d!37863))

(assert (=> d!37487 d!37477))

(assert (=> d!37487 d!37479))

(assert (=> d!37487 d!37481))

(declare-fun d!37865 () Bool)

(assert (=> d!37865 (= (apply!110 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64092) (apply!110 lt!64091 lt!64092))))

(assert (=> d!37865 true))

(declare-fun _$34!946 () Unit!3865)

(assert (=> d!37865 (= (choose!761 lt!64091 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64092) _$34!946)))

(declare-fun bs!5200 () Bool)

(assert (= bs!5200 d!37865))

(assert (=> bs!5200 m!144607))

(assert (=> bs!5200 m!144607))

(assert (=> bs!5200 m!144609))

(assert (=> bs!5200 m!144605))

(assert (=> d!37487 d!37865))

(declare-fun d!37867 () Bool)

(assert (=> d!37867 (= (inRange!0 (index!3243 lt!64353) (mask!7008 newMap!16)) (and (bvsge (index!3243 lt!64353) #b00000000000000000000000000000000) (bvslt (index!3243 lt!64353) (bvadd (mask!7008 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!125078 d!37867))

(assert (=> b!124970 d!37407))

(declare-fun d!37869 () Bool)

(assert (=> d!37869 (= (apply!110 (+!157 lt!64093 (tuple2!2535 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64105) (apply!110 lt!64093 lt!64105))))

(assert (=> d!37869 true))

(declare-fun _$34!947 () Unit!3865)

(assert (=> d!37869 (= (choose!761 lt!64093 lt!64085 (minValue!2628 (v!3101 (underlying!432 thiss!992))) lt!64105) _$34!947)))

(declare-fun bs!5201 () Bool)

(assert (= bs!5201 d!37869))

(assert (=> bs!5201 m!144619))

(assert (=> bs!5201 m!144619))

(assert (=> bs!5201 m!144633))

(assert (=> bs!5201 m!144611))

(assert (=> d!37503 d!37869))

(assert (=> d!37503 d!37495))

(declare-fun d!37871 () Bool)

(declare-fun e!82108 () Bool)

(assert (=> d!37871 e!82108))

(declare-fun res!60836 () Bool)

(assert (=> d!37871 (=> res!60836 e!82108)))

(declare-fun lt!64754 () Bool)

(assert (=> d!37871 (= res!60836 (not lt!64754))))

(declare-fun lt!64757 () Bool)

(assert (=> d!37871 (= lt!64754 lt!64757)))

(declare-fun lt!64756 () Unit!3865)

(declare-fun e!82109 () Unit!3865)

(assert (=> d!37871 (= lt!64756 e!82109)))

(declare-fun c!22955 () Bool)

(assert (=> d!37871 (= c!22955 lt!64757)))

(assert (=> d!37871 (= lt!64757 (containsKey!168 (toList!837 lt!64093) lt!64105))))

(assert (=> d!37871 (= (contains!863 lt!64093 lt!64105) lt!64754)))

(declare-fun b!125712 () Bool)

(declare-fun lt!64755 () Unit!3865)

(assert (=> b!125712 (= e!82109 lt!64755)))

(assert (=> b!125712 (= lt!64755 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64093) lt!64105))))

(assert (=> b!125712 (isDefined!118 (getValueByKey!164 (toList!837 lt!64093) lt!64105))))

(declare-fun b!125713 () Bool)

(declare-fun Unit!3910 () Unit!3865)

(assert (=> b!125713 (= e!82109 Unit!3910)))

(declare-fun b!125714 () Bool)

(assert (=> b!125714 (= e!82108 (isDefined!118 (getValueByKey!164 (toList!837 lt!64093) lt!64105)))))

(assert (= (and d!37871 c!22955) b!125712))

(assert (= (and d!37871 (not c!22955)) b!125713))

(assert (= (and d!37871 (not res!60836)) b!125714))

(declare-fun m!146273 () Bool)

(assert (=> d!37871 m!146273))

(declare-fun m!146275 () Bool)

(assert (=> b!125712 m!146275))

(assert (=> b!125712 m!145109))

(assert (=> b!125712 m!145109))

(declare-fun m!146277 () Bool)

(assert (=> b!125712 m!146277))

(assert (=> b!125714 m!145109))

(assert (=> b!125714 m!145109))

(assert (=> b!125714 m!146277))

(assert (=> d!37503 d!37871))

(assert (=> d!37503 d!37497))

(assert (=> d!37503 d!37499))

(declare-fun d!37873 () Bool)

(declare-fun res!60840 () Bool)

(declare-fun e!82110 () Bool)

(assert (=> d!37873 (=> (not res!60840) (not e!82110))))

(assert (=> d!37873 (= res!60840 (validMask!0 (mask!7008 (_2!1279 lt!64023))))))

(assert (=> d!37873 (= (simpleValid!86 (_2!1279 lt!64023)) e!82110)))

(declare-fun b!125715 () Bool)

(declare-fun res!60838 () Bool)

(assert (=> b!125715 (=> (not res!60838) (not e!82110))))

(assert (=> b!125715 (= res!60838 (and (= (size!2471 (_values!2746 (_2!1279 lt!64023))) (bvadd (mask!7008 (_2!1279 lt!64023)) #b00000000000000000000000000000001)) (= (size!2470 (_keys!4491 (_2!1279 lt!64023))) (size!2471 (_values!2746 (_2!1279 lt!64023)))) (bvsge (_size!576 (_2!1279 lt!64023)) #b00000000000000000000000000000000) (bvsle (_size!576 (_2!1279 lt!64023)) (bvadd (mask!7008 (_2!1279 lt!64023)) #b00000000000000000000000000000001))))))

(declare-fun b!125717 () Bool)

(declare-fun res!60837 () Bool)

(assert (=> b!125717 (=> (not res!60837) (not e!82110))))

(assert (=> b!125717 (= res!60837 (= (size!2476 (_2!1279 lt!64023)) (bvadd (_size!576 (_2!1279 lt!64023)) (bvsdiv (bvadd (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!125716 () Bool)

(declare-fun res!60839 () Bool)

(assert (=> b!125716 (=> (not res!60839) (not e!82110))))

(assert (=> b!125716 (= res!60839 (bvsge (size!2476 (_2!1279 lt!64023)) (_size!576 (_2!1279 lt!64023))))))

(declare-fun b!125718 () Bool)

(assert (=> b!125718 (= e!82110 (and (bvsge (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000000) (bvsle (extraKeys!2548 (_2!1279 lt!64023)) #b00000000000000000000000000000011) (bvsge (_vacant!576 (_2!1279 lt!64023)) #b00000000000000000000000000000000)))))

(assert (= (and d!37873 res!60840) b!125715))

(assert (= (and b!125715 res!60838) b!125716))

(assert (= (and b!125716 res!60839) b!125717))

(assert (= (and b!125717 res!60837) b!125718))

(assert (=> d!37873 m!145877))

(declare-fun m!146279 () Bool)

(assert (=> b!125717 m!146279))

(assert (=> b!125716 m!146279))

(assert (=> d!37411 d!37873))

(declare-fun b!125719 () Bool)

(declare-fun e!82114 () Bool)

(assert (=> b!125719 (= e!82114 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125719 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!125720 () Bool)

(declare-fun lt!64763 () Unit!3865)

(declare-fun lt!64762 () Unit!3865)

(assert (=> b!125720 (= lt!64763 lt!64762)))

(declare-fun lt!64760 () (_ BitVec 64))

(declare-fun lt!64764 () (_ BitVec 64))

(declare-fun lt!64761 () V!3425)

(declare-fun lt!64758 () ListLongMap!1643)

(assert (=> b!125720 (not (contains!863 (+!157 lt!64758 (tuple2!2535 lt!64764 lt!64761)) lt!64760))))

(assert (=> b!125720 (= lt!64762 (addStillNotContains!56 lt!64758 lt!64764 lt!64761 lt!64760))))

(assert (=> b!125720 (= lt!64760 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!125720 (= lt!64761 (get!1435 (select (arr!2207 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125720 (= lt!64764 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13464 () ListLongMap!1643)

(assert (=> b!125720 (= lt!64758 call!13464)))

(declare-fun e!82117 () ListLongMap!1643)

(assert (=> b!125720 (= e!82117 (+!157 call!13464 (tuple2!2535 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) (get!1435 (select (arr!2207 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!37875 () Bool)

(declare-fun e!82116 () Bool)

(assert (=> d!37875 e!82116))

(declare-fun res!60842 () Bool)

(assert (=> d!37875 (=> (not res!60842) (not e!82116))))

(declare-fun lt!64759 () ListLongMap!1643)

(assert (=> d!37875 (= res!60842 (not (contains!863 lt!64759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!82115 () ListLongMap!1643)

(assert (=> d!37875 (= lt!64759 e!82115)))

(declare-fun c!22957 () Bool)

(assert (=> d!37875 (= c!22957 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37875 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37875 (= (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64759)))

(declare-fun b!125721 () Bool)

(assert (=> b!125721 (= e!82117 call!13464)))

(declare-fun bm!13461 () Bool)

(assert (=> bm!13461 (= call!13464 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16)))))

(declare-fun b!125722 () Bool)

(declare-fun e!82111 () Bool)

(assert (=> b!125722 (= e!82116 e!82111)))

(declare-fun c!22956 () Bool)

(assert (=> b!125722 (= c!22956 e!82114)))

(declare-fun res!60844 () Bool)

(assert (=> b!125722 (=> (not res!60844) (not e!82114))))

(assert (=> b!125722 (= res!60844 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125723 () Bool)

(assert (=> b!125723 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(assert (=> b!125723 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032))))))

(declare-fun e!82112 () Bool)

(assert (=> b!125723 (= e!82112 (= (apply!110 lt!64759 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125724 () Bool)

(declare-fun e!82113 () Bool)

(assert (=> b!125724 (= e!82113 (= lt!64759 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2763 newMap!16))))))

(declare-fun b!125725 () Bool)

(assert (=> b!125725 (= e!82111 e!82112)))

(assert (=> b!125725 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun res!60843 () Bool)

(assert (=> b!125725 (= res!60843 (contains!863 lt!64759 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125725 (=> (not res!60843) (not e!82112))))

(declare-fun b!125726 () Bool)

(declare-fun res!60841 () Bool)

(assert (=> b!125726 (=> (not res!60841) (not e!82116))))

(assert (=> b!125726 (= res!60841 (not (contains!863 lt!64759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125727 () Bool)

(assert (=> b!125727 (= e!82111 e!82113)))

(declare-fun c!22959 () Bool)

(assert (=> b!125727 (= c!22959 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125728 () Bool)

(assert (=> b!125728 (= e!82115 e!82117)))

(declare-fun c!22958 () Bool)

(assert (=> b!125728 (= c!22958 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125729 () Bool)

(assert (=> b!125729 (= e!82113 (isEmpty!398 lt!64759))))

(declare-fun b!125730 () Bool)

(assert (=> b!125730 (= e!82115 (ListLongMap!1644 Nil!1686))))

(assert (= (and d!37875 c!22957) b!125730))

(assert (= (and d!37875 (not c!22957)) b!125728))

(assert (= (and b!125728 c!22958) b!125720))

(assert (= (and b!125728 (not c!22958)) b!125721))

(assert (= (or b!125720 b!125721) bm!13461))

(assert (= (and d!37875 res!60842) b!125726))

(assert (= (and b!125726 res!60841) b!125722))

(assert (= (and b!125722 res!60844) b!125719))

(assert (= (and b!125722 c!22956) b!125725))

(assert (= (and b!125722 (not c!22956)) b!125727))

(assert (= (and b!125725 res!60843) b!125723))

(assert (= (and b!125727 c!22959) b!125724))

(assert (= (and b!125727 (not c!22959)) b!125729))

(declare-fun b_lambda!5507 () Bool)

(assert (=> (not b_lambda!5507) (not b!125720)))

(assert (=> b!125720 t!6019))

(declare-fun b_and!7717 () Bool)

(assert (= b_and!7713 (and (=> t!6019 result!3815) b_and!7717)))

(assert (=> b!125720 t!6021))

(declare-fun b_and!7719 () Bool)

(assert (= b_and!7715 (and (=> t!6021 result!3817) b_and!7719)))

(declare-fun b_lambda!5509 () Bool)

(assert (=> (not b_lambda!5509) (not b!125723)))

(assert (=> b!125723 t!6019))

(declare-fun b_and!7721 () Bool)

(assert (= b_and!7717 (and (=> t!6019 result!3815) b_and!7721)))

(assert (=> b!125723 t!6021))

(declare-fun b_and!7723 () Bool)

(assert (= b_and!7719 (and (=> t!6021 result!3817) b_and!7723)))

(declare-fun m!146281 () Bool)

(assert (=> b!125726 m!146281))

(declare-fun m!146283 () Bool)

(assert (=> b!125729 m!146283))

(declare-fun m!146285 () Bool)

(assert (=> b!125720 m!146285))

(declare-fun m!146287 () Bool)

(assert (=> b!125720 m!146287))

(declare-fun m!146289 () Bool)

(assert (=> b!125720 m!146289))

(assert (=> b!125720 m!144667))

(assert (=> b!125720 m!144665))

(assert (=> b!125720 m!144669))

(assert (=> b!125720 m!146285))

(assert (=> b!125720 m!144667))

(assert (=> b!125720 m!144665))

(assert (=> b!125720 m!144651))

(declare-fun m!146291 () Bool)

(assert (=> b!125720 m!146291))

(declare-fun m!146293 () Bool)

(assert (=> bm!13461 m!146293))

(assert (=> b!125725 m!144651))

(assert (=> b!125725 m!144651))

(declare-fun m!146295 () Bool)

(assert (=> b!125725 m!146295))

(assert (=> b!125723 m!144651))

(declare-fun m!146297 () Bool)

(assert (=> b!125723 m!146297))

(assert (=> b!125723 m!144667))

(assert (=> b!125723 m!144665))

(assert (=> b!125723 m!144669))

(assert (=> b!125723 m!144667))

(assert (=> b!125723 m!144665))

(assert (=> b!125723 m!144651))

(declare-fun m!146299 () Bool)

(assert (=> d!37875 m!146299))

(assert (=> d!37875 m!144709))

(assert (=> b!125719 m!144651))

(assert (=> b!125719 m!144651))

(assert (=> b!125719 m!144659))

(assert (=> b!125724 m!146293))

(assert (=> b!125728 m!144651))

(assert (=> b!125728 m!144651))

(assert (=> b!125728 m!144659))

(assert (=> b!124806 d!37875))

(declare-fun d!37877 () Bool)

(assert (=> d!37877 (contains!863 (+!157 lt!64134 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16))) lt!64121)))

(declare-fun lt!64765 () Unit!3865)

(assert (=> d!37877 (= lt!64765 (choose!762 lt!64134 lt!64136 (zeroValue!2628 newMap!16) lt!64121))))

(assert (=> d!37877 (contains!863 lt!64134 lt!64121)))

(assert (=> d!37877 (= (addStillContains!86 lt!64134 lt!64136 (zeroValue!2628 newMap!16) lt!64121) lt!64765)))

(declare-fun bs!5202 () Bool)

(assert (= bs!5202 d!37877))

(assert (=> bs!5202 m!144689))

(assert (=> bs!5202 m!144689))

(assert (=> bs!5202 m!144705))

(declare-fun m!146301 () Bool)

(assert (=> bs!5202 m!146301))

(declare-fun m!146303 () Bool)

(assert (=> bs!5202 m!146303))

(assert (=> b!124806 d!37877))

(declare-fun d!37879 () Bool)

(assert (=> d!37879 (= (apply!110 (+!157 lt!64127 (tuple2!2535 lt!64119 (minValue!2628 newMap!16))) lt!64139) (apply!110 lt!64127 lt!64139))))

(declare-fun lt!64766 () Unit!3865)

(assert (=> d!37879 (= lt!64766 (choose!761 lt!64127 lt!64119 (minValue!2628 newMap!16) lt!64139))))

(declare-fun e!82118 () Bool)

(assert (=> d!37879 e!82118))

(declare-fun res!60845 () Bool)

(assert (=> d!37879 (=> (not res!60845) (not e!82118))))

(assert (=> d!37879 (= res!60845 (contains!863 lt!64127 lt!64139))))

(assert (=> d!37879 (= (addApplyDifferent!86 lt!64127 lt!64119 (minValue!2628 newMap!16) lt!64139) lt!64766)))

(declare-fun b!125731 () Bool)

(assert (=> b!125731 (= e!82118 (not (= lt!64139 lt!64119)))))

(assert (= (and d!37879 res!60845) b!125731))

(declare-fun m!146305 () Bool)

(assert (=> d!37879 m!146305))

(assert (=> d!37879 m!144693))

(assert (=> d!37879 m!144707))

(declare-fun m!146307 () Bool)

(assert (=> d!37879 m!146307))

(assert (=> d!37879 m!144693))

(assert (=> d!37879 m!144685))

(assert (=> b!124806 d!37879))

(declare-fun d!37881 () Bool)

(declare-fun e!82119 () Bool)

(assert (=> d!37881 e!82119))

(declare-fun res!60847 () Bool)

(assert (=> d!37881 (=> (not res!60847) (not e!82119))))

(declare-fun lt!64770 () ListLongMap!1643)

(assert (=> d!37881 (= res!60847 (contains!863 lt!64770 (_1!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))))))

(declare-fun lt!64768 () List!1689)

(assert (=> d!37881 (= lt!64770 (ListLongMap!1644 lt!64768))))

(declare-fun lt!64769 () Unit!3865)

(declare-fun lt!64767 () Unit!3865)

(assert (=> d!37881 (= lt!64769 lt!64767)))

(assert (=> d!37881 (= (getValueByKey!164 lt!64768 (_1!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37881 (= lt!64767 (lemmaContainsTupThenGetReturnValue!82 lt!64768 (_1!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37881 (= lt!64768 (insertStrictlySorted!85 (toList!837 lt!64134) (_1!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37881 (= (+!157 lt!64134 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16))) lt!64770)))

(declare-fun b!125732 () Bool)

(declare-fun res!60846 () Bool)

(assert (=> b!125732 (=> (not res!60846) (not e!82119))))

(assert (=> b!125732 (= res!60846 (= (getValueByKey!164 (toList!837 lt!64770) (_1!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16))))))))

(declare-fun b!125733 () Bool)

(assert (=> b!125733 (= e!82119 (contains!865 (toList!837 lt!64770) (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16))))))

(assert (= (and d!37881 res!60847) b!125732))

(assert (= (and b!125732 res!60846) b!125733))

(declare-fun m!146309 () Bool)

(assert (=> d!37881 m!146309))

(declare-fun m!146311 () Bool)

(assert (=> d!37881 m!146311))

(declare-fun m!146313 () Bool)

(assert (=> d!37881 m!146313))

(declare-fun m!146315 () Bool)

(assert (=> d!37881 m!146315))

(declare-fun m!146317 () Bool)

(assert (=> b!125732 m!146317))

(declare-fun m!146319 () Bool)

(assert (=> b!125733 m!146319))

(assert (=> b!124806 d!37881))

(declare-fun d!37883 () Bool)

(declare-fun e!82120 () Bool)

(assert (=> d!37883 e!82120))

(declare-fun res!60849 () Bool)

(assert (=> d!37883 (=> (not res!60849) (not e!82120))))

(declare-fun lt!64774 () ListLongMap!1643)

(assert (=> d!37883 (= res!60849 (contains!863 lt!64774 (_1!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16)))))))

(declare-fun lt!64772 () List!1689)

(assert (=> d!37883 (= lt!64774 (ListLongMap!1644 lt!64772))))

(declare-fun lt!64773 () Unit!3865)

(declare-fun lt!64771 () Unit!3865)

(assert (=> d!37883 (= lt!64773 lt!64771)))

(assert (=> d!37883 (= (getValueByKey!164 lt!64772 (_1!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16)))))))

(assert (=> d!37883 (= lt!64771 (lemmaContainsTupThenGetReturnValue!82 lt!64772 (_1!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16)))))))

(assert (=> d!37883 (= lt!64772 (insertStrictlySorted!85 (toList!837 lt!64127) (_1!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16)))))))

(assert (=> d!37883 (= (+!157 lt!64127 (tuple2!2535 lt!64119 (minValue!2628 newMap!16))) lt!64774)))

(declare-fun b!125734 () Bool)

(declare-fun res!60848 () Bool)

(assert (=> b!125734 (=> (not res!60848) (not e!82120))))

(assert (=> b!125734 (= res!60848 (= (getValueByKey!164 (toList!837 lt!64774) (_1!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64119 (minValue!2628 newMap!16))))))))

(declare-fun b!125735 () Bool)

(assert (=> b!125735 (= e!82120 (contains!865 (toList!837 lt!64774) (tuple2!2535 lt!64119 (minValue!2628 newMap!16))))))

(assert (= (and d!37883 res!60849) b!125734))

(assert (= (and b!125734 res!60848) b!125735))

(declare-fun m!146321 () Bool)

(assert (=> d!37883 m!146321))

(declare-fun m!146323 () Bool)

(assert (=> d!37883 m!146323))

(declare-fun m!146325 () Bool)

(assert (=> d!37883 m!146325))

(declare-fun m!146327 () Bool)

(assert (=> d!37883 m!146327))

(declare-fun m!146329 () Bool)

(assert (=> b!125734 m!146329))

(declare-fun m!146331 () Bool)

(assert (=> b!125735 m!146331))

(assert (=> b!124806 d!37883))

(declare-fun d!37885 () Bool)

(assert (=> d!37885 (= (apply!110 (+!157 lt!64140 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16))) lt!64138) (apply!110 lt!64140 lt!64138))))

(declare-fun lt!64775 () Unit!3865)

(assert (=> d!37885 (= lt!64775 (choose!761 lt!64140 lt!64123 (zeroValue!2628 newMap!16) lt!64138))))

(declare-fun e!82121 () Bool)

(assert (=> d!37885 e!82121))

(declare-fun res!60850 () Bool)

(assert (=> d!37885 (=> (not res!60850) (not e!82121))))

(assert (=> d!37885 (= res!60850 (contains!863 lt!64140 lt!64138))))

(assert (=> d!37885 (= (addApplyDifferent!86 lt!64140 lt!64123 (zeroValue!2628 newMap!16) lt!64138) lt!64775)))

(declare-fun b!125736 () Bool)

(assert (=> b!125736 (= e!82121 (not (= lt!64138 lt!64123)))))

(assert (= (and d!37885 res!60850) b!125736))

(declare-fun m!146333 () Bool)

(assert (=> d!37885 m!146333))

(assert (=> d!37885 m!144701))

(assert (=> d!37885 m!144703))

(declare-fun m!146335 () Bool)

(assert (=> d!37885 m!146335))

(assert (=> d!37885 m!144701))

(assert (=> d!37885 m!144687))

(assert (=> b!124806 d!37885))

(declare-fun d!37887 () Bool)

(assert (=> d!37887 (= (apply!110 lt!64140 lt!64138) (get!1439 (getValueByKey!164 (toList!837 lt!64140) lt!64138)))))

(declare-fun bs!5203 () Bool)

(assert (= bs!5203 d!37887))

(declare-fun m!146337 () Bool)

(assert (=> bs!5203 m!146337))

(assert (=> bs!5203 m!146337))

(declare-fun m!146339 () Bool)

(assert (=> bs!5203 m!146339))

(assert (=> b!124806 d!37887))

(declare-fun d!37889 () Bool)

(assert (=> d!37889 (= (apply!110 (+!157 lt!64127 (tuple2!2535 lt!64119 (minValue!2628 newMap!16))) lt!64139) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64127 (tuple2!2535 lt!64119 (minValue!2628 newMap!16)))) lt!64139)))))

(declare-fun bs!5204 () Bool)

(assert (= bs!5204 d!37889))

(declare-fun m!146341 () Bool)

(assert (=> bs!5204 m!146341))

(assert (=> bs!5204 m!146341))

(declare-fun m!146343 () Bool)

(assert (=> bs!5204 m!146343))

(assert (=> b!124806 d!37889))

(declare-fun d!37891 () Bool)

(assert (=> d!37891 (= (apply!110 lt!64127 lt!64139) (get!1439 (getValueByKey!164 (toList!837 lt!64127) lt!64139)))))

(declare-fun bs!5205 () Bool)

(assert (= bs!5205 d!37891))

(declare-fun m!146345 () Bool)

(assert (=> bs!5205 m!146345))

(assert (=> bs!5205 m!146345))

(declare-fun m!146347 () Bool)

(assert (=> bs!5205 m!146347))

(assert (=> b!124806 d!37891))

(declare-fun d!37893 () Bool)

(assert (=> d!37893 (= (apply!110 lt!64125 lt!64126) (get!1439 (getValueByKey!164 (toList!837 lt!64125) lt!64126)))))

(declare-fun bs!5206 () Bool)

(assert (= bs!5206 d!37893))

(declare-fun m!146349 () Bool)

(assert (=> bs!5206 m!146349))

(assert (=> bs!5206 m!146349))

(declare-fun m!146351 () Bool)

(assert (=> bs!5206 m!146351))

(assert (=> b!124806 d!37893))

(declare-fun d!37895 () Bool)

(declare-fun e!82122 () Bool)

(assert (=> d!37895 e!82122))

(declare-fun res!60852 () Bool)

(assert (=> d!37895 (=> (not res!60852) (not e!82122))))

(declare-fun lt!64779 () ListLongMap!1643)

(assert (=> d!37895 (= res!60852 (contains!863 lt!64779 (_1!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16)))))))

(declare-fun lt!64777 () List!1689)

(assert (=> d!37895 (= lt!64779 (ListLongMap!1644 lt!64777))))

(declare-fun lt!64778 () Unit!3865)

(declare-fun lt!64776 () Unit!3865)

(assert (=> d!37895 (= lt!64778 lt!64776)))

(assert (=> d!37895 (= (getValueByKey!164 lt!64777 (_1!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16)))))))

(assert (=> d!37895 (= lt!64776 (lemmaContainsTupThenGetReturnValue!82 lt!64777 (_1!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16)))))))

(assert (=> d!37895 (= lt!64777 (insertStrictlySorted!85 (toList!837 lt!64125) (_1!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16)))))))

(assert (=> d!37895 (= (+!157 lt!64125 (tuple2!2535 lt!64135 (minValue!2628 newMap!16))) lt!64779)))

(declare-fun b!125737 () Bool)

(declare-fun res!60851 () Bool)

(assert (=> b!125737 (=> (not res!60851) (not e!82122))))

(assert (=> b!125737 (= res!60851 (= (getValueByKey!164 (toList!837 lt!64779) (_1!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64135 (minValue!2628 newMap!16))))))))

(declare-fun b!125738 () Bool)

(assert (=> b!125738 (= e!82122 (contains!865 (toList!837 lt!64779) (tuple2!2535 lt!64135 (minValue!2628 newMap!16))))))

(assert (= (and d!37895 res!60852) b!125737))

(assert (= (and b!125737 res!60851) b!125738))

(declare-fun m!146353 () Bool)

(assert (=> d!37895 m!146353))

(declare-fun m!146355 () Bool)

(assert (=> d!37895 m!146355))

(declare-fun m!146357 () Bool)

(assert (=> d!37895 m!146357))

(declare-fun m!146359 () Bool)

(assert (=> d!37895 m!146359))

(declare-fun m!146361 () Bool)

(assert (=> b!125737 m!146361))

(declare-fun m!146363 () Bool)

(assert (=> b!125738 m!146363))

(assert (=> b!124806 d!37895))

(declare-fun d!37897 () Bool)

(assert (=> d!37897 (= (apply!110 (+!157 lt!64125 (tuple2!2535 lt!64135 (minValue!2628 newMap!16))) lt!64126) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64125 (tuple2!2535 lt!64135 (minValue!2628 newMap!16)))) lt!64126)))))

(declare-fun bs!5207 () Bool)

(assert (= bs!5207 d!37897))

(declare-fun m!146365 () Bool)

(assert (=> bs!5207 m!146365))

(assert (=> bs!5207 m!146365))

(declare-fun m!146367 () Bool)

(assert (=> bs!5207 m!146367))

(assert (=> b!124806 d!37897))

(declare-fun d!37899 () Bool)

(declare-fun e!82123 () Bool)

(assert (=> d!37899 e!82123))

(declare-fun res!60853 () Bool)

(assert (=> d!37899 (=> res!60853 e!82123)))

(declare-fun lt!64780 () Bool)

(assert (=> d!37899 (= res!60853 (not lt!64780))))

(declare-fun lt!64783 () Bool)

(assert (=> d!37899 (= lt!64780 lt!64783)))

(declare-fun lt!64782 () Unit!3865)

(declare-fun e!82124 () Unit!3865)

(assert (=> d!37899 (= lt!64782 e!82124)))

(declare-fun c!22960 () Bool)

(assert (=> d!37899 (= c!22960 lt!64783)))

(assert (=> d!37899 (= lt!64783 (containsKey!168 (toList!837 (+!157 lt!64134 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))) lt!64121))))

(assert (=> d!37899 (= (contains!863 (+!157 lt!64134 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16))) lt!64121) lt!64780)))

(declare-fun b!125739 () Bool)

(declare-fun lt!64781 () Unit!3865)

(assert (=> b!125739 (= e!82124 lt!64781)))

(assert (=> b!125739 (= lt!64781 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (+!157 lt!64134 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))) lt!64121))))

(assert (=> b!125739 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64134 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))) lt!64121))))

(declare-fun b!125740 () Bool)

(declare-fun Unit!3911 () Unit!3865)

(assert (=> b!125740 (= e!82124 Unit!3911)))

(declare-fun b!125741 () Bool)

(assert (=> b!125741 (= e!82123 (isDefined!118 (getValueByKey!164 (toList!837 (+!157 lt!64134 (tuple2!2535 lt!64136 (zeroValue!2628 newMap!16)))) lt!64121)))))

(assert (= (and d!37899 c!22960) b!125739))

(assert (= (and d!37899 (not c!22960)) b!125740))

(assert (= (and d!37899 (not res!60853)) b!125741))

(declare-fun m!146369 () Bool)

(assert (=> d!37899 m!146369))

(declare-fun m!146371 () Bool)

(assert (=> b!125739 m!146371))

(declare-fun m!146373 () Bool)

(assert (=> b!125739 m!146373))

(assert (=> b!125739 m!146373))

(declare-fun m!146375 () Bool)

(assert (=> b!125739 m!146375))

(assert (=> b!125741 m!146373))

(assert (=> b!125741 m!146373))

(assert (=> b!125741 m!146375))

(assert (=> b!124806 d!37899))

(declare-fun d!37901 () Bool)

(assert (=> d!37901 (= (apply!110 (+!157 lt!64140 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16))) lt!64138) (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64140 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16)))) lt!64138)))))

(declare-fun bs!5208 () Bool)

(assert (= bs!5208 d!37901))

(declare-fun m!146377 () Bool)

(assert (=> bs!5208 m!146377))

(assert (=> bs!5208 m!146377))

(declare-fun m!146379 () Bool)

(assert (=> bs!5208 m!146379))

(assert (=> b!124806 d!37901))

(declare-fun d!37903 () Bool)

(declare-fun e!82125 () Bool)

(assert (=> d!37903 e!82125))

(declare-fun res!60855 () Bool)

(assert (=> d!37903 (=> (not res!60855) (not e!82125))))

(declare-fun lt!64787 () ListLongMap!1643)

(assert (=> d!37903 (= res!60855 (contains!863 lt!64787 (_1!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16)))))))

(declare-fun lt!64785 () List!1689)

(assert (=> d!37903 (= lt!64787 (ListLongMap!1644 lt!64785))))

(declare-fun lt!64786 () Unit!3865)

(declare-fun lt!64784 () Unit!3865)

(assert (=> d!37903 (= lt!64786 lt!64784)))

(assert (=> d!37903 (= (getValueByKey!164 lt!64785 (_1!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37903 (= lt!64784 (lemmaContainsTupThenGetReturnValue!82 lt!64785 (_1!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37903 (= lt!64785 (insertStrictlySorted!85 (toList!837 lt!64140) (_1!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16))) (_2!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16)))))))

(assert (=> d!37903 (= (+!157 lt!64140 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16))) lt!64787)))

(declare-fun b!125742 () Bool)

(declare-fun res!60854 () Bool)

(assert (=> b!125742 (=> (not res!60854) (not e!82125))))

(assert (=> b!125742 (= res!60854 (= (getValueByKey!164 (toList!837 lt!64787) (_1!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16))))))))

(declare-fun b!125743 () Bool)

(assert (=> b!125743 (= e!82125 (contains!865 (toList!837 lt!64787) (tuple2!2535 lt!64123 (zeroValue!2628 newMap!16))))))

(assert (= (and d!37903 res!60855) b!125742))

(assert (= (and b!125742 res!60854) b!125743))

(declare-fun m!146381 () Bool)

(assert (=> d!37903 m!146381))

(declare-fun m!146383 () Bool)

(assert (=> d!37903 m!146383))

(declare-fun m!146385 () Bool)

(assert (=> d!37903 m!146385))

(declare-fun m!146387 () Bool)

(assert (=> d!37903 m!146387))

(declare-fun m!146389 () Bool)

(assert (=> b!125742 m!146389))

(declare-fun m!146391 () Bool)

(assert (=> b!125743 m!146391))

(assert (=> b!124806 d!37903))

(declare-fun d!37905 () Bool)

(assert (=> d!37905 (= (apply!110 (+!157 lt!64125 (tuple2!2535 lt!64135 (minValue!2628 newMap!16))) lt!64126) (apply!110 lt!64125 lt!64126))))

(declare-fun lt!64788 () Unit!3865)

(assert (=> d!37905 (= lt!64788 (choose!761 lt!64125 lt!64135 (minValue!2628 newMap!16) lt!64126))))

(declare-fun e!82126 () Bool)

(assert (=> d!37905 e!82126))

(declare-fun res!60856 () Bool)

(assert (=> d!37905 (=> (not res!60856) (not e!82126))))

(assert (=> d!37905 (= res!60856 (contains!863 lt!64125 lt!64126))))

(assert (=> d!37905 (= (addApplyDifferent!86 lt!64125 lt!64135 (minValue!2628 newMap!16) lt!64126) lt!64788)))

(declare-fun b!125744 () Bool)

(assert (=> b!125744 (= e!82126 (not (= lt!64126 lt!64135)))))

(assert (= (and d!37905 res!60856) b!125744))

(declare-fun m!146393 () Bool)

(assert (=> d!37905 m!146393))

(assert (=> d!37905 m!144681))

(assert (=> d!37905 m!144683))

(declare-fun m!146395 () Bool)

(assert (=> d!37905 m!146395))

(assert (=> d!37905 m!144681))

(assert (=> d!37905 m!144679))

(assert (=> b!124806 d!37905))

(declare-fun lt!64789 () Bool)

(declare-fun d!37907 () Bool)

(assert (=> d!37907 (= lt!64789 (select (content!123 (toList!837 lt!64358)) (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun e!82127 () Bool)

(assert (=> d!37907 (= lt!64789 e!82127)))

(declare-fun res!60858 () Bool)

(assert (=> d!37907 (=> (not res!60858) (not e!82127))))

(assert (=> d!37907 (= res!60858 ((_ is Cons!1685) (toList!837 lt!64358)))))

(assert (=> d!37907 (= (contains!865 (toList!837 lt!64358) (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64789)))

(declare-fun b!125745 () Bool)

(declare-fun e!82128 () Bool)

(assert (=> b!125745 (= e!82127 e!82128)))

(declare-fun res!60857 () Bool)

(assert (=> b!125745 (=> res!60857 e!82128)))

(assert (=> b!125745 (= res!60857 (= (h!2286 (toList!837 lt!64358)) (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125746 () Bool)

(assert (=> b!125746 (= e!82128 (contains!865 (t!6007 (toList!837 lt!64358)) (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37907 res!60858) b!125745))

(assert (= (and b!125745 (not res!60857)) b!125746))

(declare-fun m!146397 () Bool)

(assert (=> d!37907 m!146397))

(declare-fun m!146399 () Bool)

(assert (=> d!37907 m!146399))

(declare-fun m!146401 () Bool)

(assert (=> b!125746 m!146401))

(assert (=> b!125081 d!37907))

(declare-fun d!37909 () Bool)

(assert (=> d!37909 (= (get!1439 (getValueByKey!164 (toList!837 lt!64091) lt!64092)) (v!3107 (getValueByKey!164 (toList!837 lt!64091) lt!64092)))))

(assert (=> d!37481 d!37909))

(declare-fun b!125749 () Bool)

(declare-fun e!82130 () Option!170)

(assert (=> b!125749 (= e!82130 (getValueByKey!164 (t!6007 (toList!837 lt!64091)) lt!64092))))

(declare-fun d!37911 () Bool)

(declare-fun c!22961 () Bool)

(assert (=> d!37911 (= c!22961 (and ((_ is Cons!1685) (toList!837 lt!64091)) (= (_1!1278 (h!2286 (toList!837 lt!64091))) lt!64092)))))

(declare-fun e!82129 () Option!170)

(assert (=> d!37911 (= (getValueByKey!164 (toList!837 lt!64091) lt!64092) e!82129)))

(declare-fun b!125750 () Bool)

(assert (=> b!125750 (= e!82130 None!168)))

(declare-fun b!125748 () Bool)

(assert (=> b!125748 (= e!82129 e!82130)))

(declare-fun c!22962 () Bool)

(assert (=> b!125748 (= c!22962 (and ((_ is Cons!1685) (toList!837 lt!64091)) (not (= (_1!1278 (h!2286 (toList!837 lt!64091))) lt!64092))))))

(declare-fun b!125747 () Bool)

(assert (=> b!125747 (= e!82129 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64091)))))))

(assert (= (and d!37911 c!22961) b!125747))

(assert (= (and d!37911 (not c!22961)) b!125748))

(assert (= (and b!125748 c!22962) b!125749))

(assert (= (and b!125748 (not c!22962)) b!125750))

(declare-fun m!146403 () Bool)

(assert (=> b!125749 m!146403))

(assert (=> d!37481 d!37911))

(assert (=> b!125070 d!37579))

(declare-fun b!125753 () Bool)

(declare-fun e!82132 () Option!170)

(assert (=> b!125753 (= e!82132 (getValueByKey!164 (t!6007 (toList!837 lt!64144)) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun c!22963 () Bool)

(declare-fun d!37913 () Bool)

(assert (=> d!37913 (= c!22963 (and ((_ is Cons!1685) (toList!837 lt!64144)) (= (_1!1278 (h!2286 (toList!837 lt!64144))) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun e!82131 () Option!170)

(assert (=> d!37913 (= (getValueByKey!164 (toList!837 lt!64144) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) e!82131)))

(declare-fun b!125754 () Bool)

(assert (=> b!125754 (= e!82132 None!168)))

(declare-fun b!125752 () Bool)

(assert (=> b!125752 (= e!82131 e!82132)))

(declare-fun c!22964 () Bool)

(assert (=> b!125752 (= c!22964 (and ((_ is Cons!1685) (toList!837 lt!64144)) (not (= (_1!1278 (h!2286 (toList!837 lt!64144))) (_1!1278 (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))))

(declare-fun b!125751 () Bool)

(assert (=> b!125751 (= e!82131 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64144)))))))

(assert (= (and d!37913 c!22963) b!125751))

(assert (= (and d!37913 (not c!22963)) b!125752))

(assert (= (and b!125752 c!22964) b!125753))

(assert (= (and b!125752 (not c!22964)) b!125754))

(declare-fun m!146405 () Bool)

(assert (=> b!125753 m!146405))

(assert (=> b!124815 d!37913))

(declare-fun b!125755 () Bool)

(declare-fun e!82133 () Bool)

(declare-fun call!13465 () Bool)

(assert (=> b!125755 (= e!82133 call!13465)))

(declare-fun b!125756 () Bool)

(declare-fun e!82135 () Bool)

(assert (=> b!125756 (= e!82135 call!13465)))

(declare-fun d!37915 () Bool)

(declare-fun res!60860 () Bool)

(declare-fun e!82134 () Bool)

(assert (=> d!37915 (=> res!60860 e!82134)))

(assert (=> d!37915 (= res!60860 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> d!37915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992)))) e!82134)))

(declare-fun b!125757 () Bool)

(assert (=> b!125757 (= e!82134 e!82133)))

(declare-fun c!22965 () Bool)

(assert (=> b!125757 (= c!22965 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125758 () Bool)

(assert (=> b!125758 (= e!82133 e!82135)))

(declare-fun lt!64792 () (_ BitVec 64))

(assert (=> b!125758 (= lt!64792 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!64791 () Unit!3865)

(assert (=> b!125758 (= lt!64791 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4491 (v!3101 (underlying!432 thiss!992))) lt!64792 #b00000000000000000000000000000000))))

(assert (=> b!125758 (arrayContainsKey!0 (_keys!4491 (v!3101 (underlying!432 thiss!992))) lt!64792 #b00000000000000000000000000000000)))

(declare-fun lt!64790 () Unit!3865)

(assert (=> b!125758 (= lt!64790 lt!64791)))

(declare-fun res!60859 () Bool)

(assert (=> b!125758 (= res!60859 (= (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000) (_keys!4491 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992)))) (Found!272 #b00000000000000000000000000000000)))))

(assert (=> b!125758 (=> (not res!60859) (not e!82135))))

(declare-fun bm!13462 () Bool)

(assert (=> bm!13462 (= call!13465 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4491 (v!3101 (underlying!432 thiss!992))) (mask!7008 (v!3101 (underlying!432 thiss!992)))))))

(assert (= (and d!37915 (not res!60860)) b!125757))

(assert (= (and b!125757 c!22965) b!125758))

(assert (= (and b!125757 (not c!22965)) b!125755))

(assert (= (and b!125758 res!60859) b!125756))

(assert (= (or b!125756 b!125755) bm!13462))

(assert (=> b!125757 m!145809))

(assert (=> b!125757 m!145809))

(assert (=> b!125757 m!145811))

(assert (=> b!125758 m!145809))

(declare-fun m!146407 () Bool)

(assert (=> b!125758 m!146407))

(declare-fun m!146409 () Bool)

(assert (=> b!125758 m!146409))

(assert (=> b!125758 m!145809))

(declare-fun m!146411 () Bool)

(assert (=> b!125758 m!146411))

(declare-fun m!146413 () Bool)

(assert (=> bm!13462 m!146413))

(assert (=> b!124818 d!37915))

(assert (=> b!124793 d!37579))

(declare-fun d!37917 () Bool)

(declare-fun e!82136 () Bool)

(assert (=> d!37917 e!82136))

(declare-fun res!60862 () Bool)

(assert (=> d!37917 (=> (not res!60862) (not e!82136))))

(declare-fun lt!64796 () ListLongMap!1643)

(assert (=> d!37917 (= res!60862 (contains!863 lt!64796 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(declare-fun lt!64794 () List!1689)

(assert (=> d!37917 (= lt!64796 (ListLongMap!1644 lt!64794))))

(declare-fun lt!64795 () Unit!3865)

(declare-fun lt!64793 () Unit!3865)

(assert (=> d!37917 (= lt!64795 lt!64793)))

(assert (=> d!37917 (= (getValueByKey!164 lt!64794 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37917 (= lt!64793 (lemmaContainsTupThenGetReturnValue!82 lt!64794 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37917 (= lt!64794 (insertStrictlySorted!85 (toList!837 call!13364) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (=> d!37917 (= (+!157 call!13364 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))) lt!64796)))

(declare-fun b!125759 () Bool)

(declare-fun res!60861 () Bool)

(assert (=> b!125759 (=> (not res!60861) (not e!82136))))

(assert (=> b!125759 (= res!60861 (= (getValueByKey!164 (toList!837 lt!64796) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(declare-fun b!125760 () Bool)

(assert (=> b!125760 (= e!82136 (contains!865 (toList!837 lt!64796) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))

(assert (= (and d!37917 res!60862) b!125759))

(assert (= (and b!125759 res!60861) b!125760))

(declare-fun m!146415 () Bool)

(assert (=> d!37917 m!146415))

(declare-fun m!146417 () Bool)

(assert (=> d!37917 m!146417))

(declare-fun m!146419 () Bool)

(assert (=> d!37917 m!146419))

(declare-fun m!146421 () Bool)

(assert (=> d!37917 m!146421))

(declare-fun m!146423 () Bool)

(assert (=> b!125759 m!146423))

(declare-fun m!146425 () Bool)

(assert (=> b!125760 m!146425))

(assert (=> b!124931 d!37917))

(declare-fun d!37919 () Bool)

(declare-fun e!82137 () Bool)

(assert (=> d!37919 e!82137))

(declare-fun res!60864 () Bool)

(assert (=> d!37919 (=> (not res!60864) (not e!82137))))

(declare-fun lt!64800 () ListLongMap!1643)

(assert (=> d!37919 (= res!60864 (contains!863 lt!64800 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun lt!64798 () List!1689)

(assert (=> d!37919 (= lt!64800 (ListLongMap!1644 lt!64798))))

(declare-fun lt!64799 () Unit!3865)

(declare-fun lt!64797 () Unit!3865)

(assert (=> d!37919 (= lt!64799 lt!64797)))

(assert (=> d!37919 (= (getValueByKey!164 lt!64798 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37919 (= lt!64797 (lemmaContainsTupThenGetReturnValue!82 lt!64798 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37919 (= lt!64798 (insertStrictlySorted!85 (toList!837 call!13351) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (=> d!37919 (= (+!157 call!13351 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))) lt!64800)))

(declare-fun b!125761 () Bool)

(declare-fun res!60863 () Bool)

(assert (=> b!125761 (=> (not res!60863) (not e!82137))))

(assert (=> b!125761 (= res!60863 (= (getValueByKey!164 (toList!837 lt!64800) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(declare-fun b!125762 () Bool)

(assert (=> b!125762 (= e!82137 (contains!865 (toList!837 lt!64800) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(assert (= (and d!37919 res!60864) b!125761))

(assert (= (and b!125761 res!60863) b!125762))

(declare-fun m!146427 () Bool)

(assert (=> d!37919 m!146427))

(declare-fun m!146429 () Bool)

(assert (=> d!37919 m!146429))

(declare-fun m!146431 () Bool)

(assert (=> d!37919 m!146431))

(declare-fun m!146433 () Bool)

(assert (=> d!37919 m!146433))

(declare-fun m!146435 () Bool)

(assert (=> b!125761 m!146435))

(declare-fun m!146437 () Bool)

(assert (=> b!125762 m!146437))

(assert (=> b!124835 d!37919))

(declare-fun d!37921 () Bool)

(declare-fun e!82138 () Bool)

(assert (=> d!37921 e!82138))

(declare-fun res!60866 () Bool)

(assert (=> d!37921 (=> (not res!60866) (not e!82138))))

(declare-fun lt!64804 () ListLongMap!1643)

(assert (=> d!37921 (= res!60866 (contains!863 lt!64804 (_1!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(declare-fun lt!64802 () List!1689)

(assert (=> d!37921 (= lt!64804 (ListLongMap!1644 lt!64802))))

(declare-fun lt!64803 () Unit!3865)

(declare-fun lt!64801 () Unit!3865)

(assert (=> d!37921 (= lt!64803 lt!64801)))

(assert (=> d!37921 (= (getValueByKey!164 lt!64802 (_1!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37921 (= lt!64801 (lemmaContainsTupThenGetReturnValue!82 lt!64802 (_1!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (_2!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37921 (= lt!64802 (insertStrictlySorted!85 (toList!837 (ite c!22710 call!13348 (ite c!22713 call!13350 call!13347))) (_1!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (_2!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37921 (= (+!157 (ite c!22710 call!13348 (ite c!22713 call!13350 call!13347)) (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) lt!64804)))

(declare-fun b!125763 () Bool)

(declare-fun res!60865 () Bool)

(assert (=> b!125763 (=> (not res!60865) (not e!82138))))

(assert (=> b!125763 (= res!60865 (= (getValueByKey!164 (toList!837 lt!64804) (_1!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))))

(declare-fun b!125764 () Bool)

(assert (=> b!125764 (= e!82138 (contains!865 (toList!837 lt!64804) (ite (or c!22710 c!22713) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (= (and d!37921 res!60866) b!125763))

(assert (= (and b!125763 res!60865) b!125764))

(declare-fun m!146439 () Bool)

(assert (=> d!37921 m!146439))

(declare-fun m!146441 () Bool)

(assert (=> d!37921 m!146441))

(declare-fun m!146443 () Bool)

(assert (=> d!37921 m!146443))

(declare-fun m!146445 () Bool)

(assert (=> d!37921 m!146445))

(declare-fun m!146447 () Bool)

(assert (=> b!125763 m!146447))

(declare-fun m!146449 () Bool)

(assert (=> b!125764 m!146449))

(assert (=> bm!13343 d!37921))

(declare-fun d!37923 () Bool)

(assert (=> d!37923 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!64805 () Unit!3865)

(assert (=> d!37923 (= lt!64805 (choose!755 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82139 () Bool)

(assert (=> d!37923 e!82139))

(declare-fun res!60867 () Bool)

(assert (=> d!37923 (=> (not res!60867) (not e!82139))))

(assert (=> d!37923 (= res!60867 (isStrictlySorted!311 (toList!837 lt!64097)))))

(assert (=> d!37923 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000) lt!64805)))

(declare-fun b!125765 () Bool)

(assert (=> b!125765 (= e!82139 (containsKey!168 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37923 res!60867) b!125765))

(assert (=> d!37923 m!144833))

(assert (=> d!37923 m!144833))

(assert (=> d!37923 m!144835))

(declare-fun m!146451 () Bool)

(assert (=> d!37923 m!146451))

(assert (=> d!37923 m!145681))

(assert (=> b!125765 m!144829))

(assert (=> b!124898 d!37923))

(assert (=> b!124898 d!37615))

(assert (=> b!124898 d!37609))

(declare-fun d!37925 () Bool)

(assert (=> d!37925 (= (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64104)) (v!3107 (getValueByKey!164 (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64104)))))

(assert (=> d!37485 d!37925))

(declare-fun e!82141 () Option!170)

(declare-fun b!125768 () Bool)

(assert (=> b!125768 (= e!82141 (getValueByKey!164 (t!6007 (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) lt!64104))))

(declare-fun c!22966 () Bool)

(declare-fun d!37927 () Bool)

(assert (=> d!37927 (= c!22966 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64104)))))

(declare-fun e!82140 () Option!170)

(assert (=> d!37927 (= (getValueByKey!164 (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64104) e!82140)))

(declare-fun b!125769 () Bool)

(assert (=> b!125769 (= e!82141 None!168)))

(declare-fun b!125767 () Bool)

(assert (=> b!125767 (= e!82140 e!82141)))

(declare-fun c!22967 () Bool)

(assert (=> b!125767 (= c!22967 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))) (not (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64104))))))

(declare-fun b!125766 () Bool)

(assert (=> b!125766 (= e!82140 (Some!169 (_2!1278 (h!2286 (toList!837 (+!157 lt!64106 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))))

(assert (= (and d!37927 c!22966) b!125766))

(assert (= (and d!37927 (not c!22966)) b!125767))

(assert (= (and b!125767 c!22967) b!125768))

(assert (= (and b!125767 (not c!22967)) b!125769))

(declare-fun m!146453 () Bool)

(assert (=> b!125768 m!146453))

(assert (=> d!37485 d!37927))

(declare-fun d!37929 () Bool)

(assert (=> d!37929 (= (get!1437 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3100 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!124813 d!37929))

(declare-fun d!37931 () Bool)

(declare-fun e!82142 () Bool)

(assert (=> d!37931 e!82142))

(declare-fun res!60868 () Bool)

(assert (=> d!37931 (=> res!60868 e!82142)))

(declare-fun lt!64806 () Bool)

(assert (=> d!37931 (= res!60868 (not lt!64806))))

(declare-fun lt!64809 () Bool)

(assert (=> d!37931 (= lt!64806 lt!64809)))

(declare-fun lt!64808 () Unit!3865)

(declare-fun e!82143 () Unit!3865)

(assert (=> d!37931 (= lt!64808 e!82143)))

(declare-fun c!22968 () Bool)

(assert (=> d!37931 (= c!22968 lt!64809)))

(assert (=> d!37931 (= lt!64809 (containsKey!168 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))))

(assert (=> d!37931 (= (contains!863 (getCurrentListMap!507 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))) lt!64806)))

(declare-fun b!125770 () Bool)

(declare-fun lt!64807 () Unit!3865)

(assert (=> b!125770 (= e!82143 lt!64807)))

(assert (=> b!125770 (= lt!64807 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))))

(assert (=> b!125770 (isDefined!118 (getValueByKey!164 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028))))))

(declare-fun b!125771 () Bool)

(declare-fun Unit!3912 () Unit!3865)

(assert (=> b!125771 (= e!82143 Unit!3912)))

(declare-fun b!125772 () Bool)

(assert (=> b!125772 (= e!82142 (isDefined!118 (getValueByKey!164 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(assert (= (and d!37931 c!22968) b!125770))

(assert (= (and d!37931 (not c!22968)) b!125771))

(assert (= (and d!37931 (not res!60868)) b!125772))

(assert (=> d!37931 m!144559))

(declare-fun m!146455 () Bool)

(assert (=> d!37931 m!146455))

(assert (=> b!125770 m!144559))

(declare-fun m!146457 () Bool)

(assert (=> b!125770 m!146457))

(assert (=> b!125770 m!144559))

(declare-fun m!146459 () Bool)

(assert (=> b!125770 m!146459))

(assert (=> b!125770 m!146459))

(declare-fun m!146461 () Bool)

(assert (=> b!125770 m!146461))

(assert (=> b!125772 m!144559))

(assert (=> b!125772 m!146459))

(assert (=> b!125772 m!146459))

(assert (=> b!125772 m!146461))

(assert (=> b!124909 d!37931))

(declare-fun bm!13463 () Bool)

(declare-fun call!13472 () ListLongMap!1643)

(declare-fun call!13470 () ListLongMap!1643)

(assert (=> bm!13463 (= call!13472 call!13470)))

(declare-fun b!125773 () Bool)

(declare-fun e!82147 () Bool)

(declare-fun lt!64822 () ListLongMap!1643)

(assert (=> b!125773 (= e!82147 (= (apply!110 lt!64822 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125774 () Bool)

(declare-fun e!82149 () ListLongMap!1643)

(declare-fun call!13467 () ListLongMap!1643)

(assert (=> b!125774 (= e!82149 call!13467)))

(declare-fun bm!13464 () Bool)

(declare-fun call!13466 () ListLongMap!1643)

(assert (=> bm!13464 (= call!13467 call!13466)))

(declare-fun b!125775 () Bool)

(declare-fun e!82154 () Bool)

(assert (=> b!125775 (= e!82154 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125776 () Bool)

(declare-fun e!82156 () Bool)

(assert (=> b!125776 (= e!82156 (= (apply!110 lt!64822 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125777 () Bool)

(declare-fun e!82151 () Bool)

(assert (=> b!125777 (= e!82151 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37933 () Bool)

(declare-fun e!82146 () Bool)

(assert (=> d!37933 e!82146))

(declare-fun res!60871 () Bool)

(assert (=> d!37933 (=> (not res!60871) (not e!82146))))

(assert (=> d!37933 (= res!60871 (or (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun lt!64828 () ListLongMap!1643)

(assert (=> d!37933 (= lt!64822 lt!64828)))

(declare-fun lt!64819 () Unit!3865)

(declare-fun e!82150 () Unit!3865)

(assert (=> d!37933 (= lt!64819 e!82150)))

(declare-fun c!22969 () Bool)

(assert (=> d!37933 (= c!22969 e!82154)))

(declare-fun res!60873 () Bool)

(assert (=> d!37933 (=> (not res!60873) (not e!82154))))

(assert (=> d!37933 (= res!60873 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun e!82152 () ListLongMap!1643)

(assert (=> d!37933 (= lt!64828 e!82152)))

(declare-fun c!22971 () Bool)

(assert (=> d!37933 (= c!22971 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37933 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37933 (= (getCurrentListMap!507 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64822)))

(declare-fun e!82145 () Bool)

(declare-fun b!125778 () Bool)

(assert (=> b!125778 (= e!82145 (= (apply!110 lt!64822 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 lt!64032) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 lt!64032)))))

(assert (=> b!125778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun c!22974 () Bool)

(declare-fun call!13469 () ListLongMap!1643)

(declare-fun bm!13465 () Bool)

(assert (=> bm!13465 (= call!13466 (+!157 (ite c!22971 call!13470 (ite c!22974 call!13472 call!13469)) (ite (or c!22971 c!22974) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun bm!13466 () Bool)

(assert (=> bm!13466 (= call!13469 call!13472)))

(declare-fun b!125779 () Bool)

(declare-fun e!82148 () ListLongMap!1643)

(assert (=> b!125779 (= e!82152 e!82148)))

(assert (=> b!125779 (= c!22974 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125780 () Bool)

(declare-fun Unit!3913 () Unit!3865)

(assert (=> b!125780 (= e!82150 Unit!3913)))

(declare-fun b!125781 () Bool)

(declare-fun res!60872 () Bool)

(assert (=> b!125781 (=> (not res!60872) (not e!82146))))

(declare-fun e!82153 () Bool)

(assert (=> b!125781 (= res!60872 e!82153)))

(declare-fun res!60869 () Bool)

(assert (=> b!125781 (=> res!60869 e!82153)))

(assert (=> b!125781 (= res!60869 (not e!82151))))

(declare-fun res!60877 () Bool)

(assert (=> b!125781 (=> (not res!60877) (not e!82151))))

(assert (=> b!125781 (= res!60877 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125782 () Bool)

(declare-fun e!82144 () Bool)

(assert (=> b!125782 (= e!82144 e!82147)))

(declare-fun res!60876 () Bool)

(declare-fun call!13471 () Bool)

(assert (=> b!125782 (= res!60876 call!13471)))

(assert (=> b!125782 (=> (not res!60876) (not e!82147))))

(declare-fun bm!13467 () Bool)

(declare-fun call!13468 () Bool)

(assert (=> bm!13467 (= call!13468 (contains!863 lt!64822 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125783 () Bool)

(assert (=> b!125783 (= e!82148 call!13467)))

(declare-fun bm!13468 () Bool)

(assert (=> bm!13468 (= call!13470 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125784 () Bool)

(declare-fun res!60875 () Bool)

(assert (=> b!125784 (=> (not res!60875) (not e!82146))))

(assert (=> b!125784 (= res!60875 e!82144)))

(declare-fun c!22972 () Bool)

(assert (=> b!125784 (= c!22972 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125785 () Bool)

(declare-fun e!82155 () Bool)

(assert (=> b!125785 (= e!82155 (not call!13468))))

(declare-fun b!125786 () Bool)

(assert (=> b!125786 (= e!82146 e!82155)))

(declare-fun c!22973 () Bool)

(assert (=> b!125786 (= c!22973 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125787 () Bool)

(assert (=> b!125787 (= e!82149 call!13469)))

(declare-fun b!125788 () Bool)

(assert (=> b!125788 (= e!82152 (+!157 call!13466 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125789 () Bool)

(assert (=> b!125789 (= e!82155 e!82156)))

(declare-fun res!60874 () Bool)

(assert (=> b!125789 (= res!60874 call!13468)))

(assert (=> b!125789 (=> (not res!60874) (not e!82156))))

(declare-fun b!125790 () Bool)

(declare-fun lt!64824 () Unit!3865)

(assert (=> b!125790 (= e!82150 lt!64824)))

(declare-fun lt!64825 () ListLongMap!1643)

(assert (=> b!125790 (= lt!64825 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64827 () (_ BitVec 64))

(assert (=> b!125790 (= lt!64827 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64812 () (_ BitVec 64))

(assert (=> b!125790 (= lt!64812 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64811 () Unit!3865)

(assert (=> b!125790 (= lt!64811 (addStillContains!86 lt!64825 lt!64827 (zeroValue!2628 newMap!16) lt!64812))))

(assert (=> b!125790 (contains!863 (+!157 lt!64825 (tuple2!2535 lt!64827 (zeroValue!2628 newMap!16))) lt!64812)))

(declare-fun lt!64821 () Unit!3865)

(assert (=> b!125790 (= lt!64821 lt!64811)))

(declare-fun lt!64818 () ListLongMap!1643)

(assert (=> b!125790 (= lt!64818 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64810 () (_ BitVec 64))

(assert (=> b!125790 (= lt!64810 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64830 () (_ BitVec 64))

(assert (=> b!125790 (= lt!64830 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64813 () Unit!3865)

(assert (=> b!125790 (= lt!64813 (addApplyDifferent!86 lt!64818 lt!64810 (minValue!2628 newMap!16) lt!64830))))

(assert (=> b!125790 (= (apply!110 (+!157 lt!64818 (tuple2!2535 lt!64810 (minValue!2628 newMap!16))) lt!64830) (apply!110 lt!64818 lt!64830))))

(declare-fun lt!64815 () Unit!3865)

(assert (=> b!125790 (= lt!64815 lt!64813)))

(declare-fun lt!64831 () ListLongMap!1643)

(assert (=> b!125790 (= lt!64831 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64814 () (_ BitVec 64))

(assert (=> b!125790 (= lt!64814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64829 () (_ BitVec 64))

(assert (=> b!125790 (= lt!64829 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64823 () Unit!3865)

(assert (=> b!125790 (= lt!64823 (addApplyDifferent!86 lt!64831 lt!64814 (zeroValue!2628 newMap!16) lt!64829))))

(assert (=> b!125790 (= (apply!110 (+!157 lt!64831 (tuple2!2535 lt!64814 (zeroValue!2628 newMap!16))) lt!64829) (apply!110 lt!64831 lt!64829))))

(declare-fun lt!64820 () Unit!3865)

(assert (=> b!125790 (= lt!64820 lt!64823)))

(declare-fun lt!64816 () ListLongMap!1643)

(assert (=> b!125790 (= lt!64816 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) lt!64032 (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64826 () (_ BitVec 64))

(assert (=> b!125790 (= lt!64826 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64817 () (_ BitVec 64))

(assert (=> b!125790 (= lt!64817 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125790 (= lt!64824 (addApplyDifferent!86 lt!64816 lt!64826 (minValue!2628 newMap!16) lt!64817))))

(assert (=> b!125790 (= (apply!110 (+!157 lt!64816 (tuple2!2535 lt!64826 (minValue!2628 newMap!16))) lt!64817) (apply!110 lt!64816 lt!64817))))

(declare-fun b!125791 () Bool)

(assert (=> b!125791 (= e!82144 (not call!13471))))

(declare-fun bm!13469 () Bool)

(assert (=> bm!13469 (= call!13471 (contains!863 lt!64822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125792 () Bool)

(assert (=> b!125792 (= e!82153 e!82145)))

(declare-fun res!60870 () Bool)

(assert (=> b!125792 (=> (not res!60870) (not e!82145))))

(assert (=> b!125792 (= res!60870 (contains!863 lt!64822 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125793 () Bool)

(declare-fun c!22970 () Bool)

(assert (=> b!125793 (= c!22970 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125793 (= e!82148 e!82149)))

(assert (= (and d!37933 c!22971) b!125788))

(assert (= (and d!37933 (not c!22971)) b!125779))

(assert (= (and b!125779 c!22974) b!125783))

(assert (= (and b!125779 (not c!22974)) b!125793))

(assert (= (and b!125793 c!22970) b!125774))

(assert (= (and b!125793 (not c!22970)) b!125787))

(assert (= (or b!125774 b!125787) bm!13466))

(assert (= (or b!125783 bm!13466) bm!13463))

(assert (= (or b!125783 b!125774) bm!13464))

(assert (= (or b!125788 bm!13463) bm!13468))

(assert (= (or b!125788 bm!13464) bm!13465))

(assert (= (and d!37933 res!60873) b!125775))

(assert (= (and d!37933 c!22969) b!125790))

(assert (= (and d!37933 (not c!22969)) b!125780))

(assert (= (and d!37933 res!60871) b!125781))

(assert (= (and b!125781 res!60877) b!125777))

(assert (= (and b!125781 (not res!60869)) b!125792))

(assert (= (and b!125792 res!60870) b!125778))

(assert (= (and b!125781 res!60872) b!125784))

(assert (= (and b!125784 c!22972) b!125782))

(assert (= (and b!125784 (not c!22972)) b!125791))

(assert (= (and b!125782 res!60876) b!125773))

(assert (= (or b!125782 b!125791) bm!13469))

(assert (= (and b!125784 res!60875) b!125786))

(assert (= (and b!125786 c!22973) b!125789))

(assert (= (and b!125786 (not c!22973)) b!125785))

(assert (= (and b!125789 res!60874) b!125776))

(assert (= (or b!125789 b!125785) bm!13467))

(declare-fun b_lambda!5511 () Bool)

(assert (=> (not b_lambda!5511) (not b!125778)))

(assert (=> b!125778 t!6019))

(declare-fun b_and!7725 () Bool)

(assert (= b_and!7721 (and (=> t!6019 result!3815) b_and!7725)))

(assert (=> b!125778 t!6021))

(declare-fun b_and!7727 () Bool)

(assert (= b_and!7723 (and (=> t!6021 result!3817) b_and!7727)))

(assert (=> b!125792 m!144651))

(assert (=> b!125792 m!144651))

(declare-fun m!146463 () Bool)

(assert (=> b!125792 m!146463))

(declare-fun m!146465 () Bool)

(assert (=> b!125773 m!146465))

(declare-fun m!146467 () Bool)

(assert (=> b!125776 m!146467))

(assert (=> b!125777 m!144651))

(assert (=> b!125777 m!144651))

(assert (=> b!125777 m!144659))

(declare-fun m!146469 () Bool)

(assert (=> bm!13467 m!146469))

(declare-fun m!146471 () Bool)

(assert (=> bm!13465 m!146471))

(assert (=> b!125778 m!144665))

(declare-fun m!146473 () Bool)

(assert (=> b!125778 m!146473))

(assert (=> b!125778 m!144665))

(declare-fun m!146475 () Bool)

(assert (=> b!125778 m!146475))

(assert (=> b!125778 m!144651))

(assert (=> b!125778 m!146473))

(assert (=> b!125778 m!144651))

(declare-fun m!146477 () Bool)

(assert (=> b!125778 m!146477))

(declare-fun m!146479 () Bool)

(assert (=> bm!13469 m!146479))

(assert (=> b!125775 m!144651))

(assert (=> b!125775 m!144651))

(assert (=> b!125775 m!144659))

(declare-fun m!146481 () Bool)

(assert (=> b!125788 m!146481))

(declare-fun m!146483 () Bool)

(assert (=> bm!13468 m!146483))

(declare-fun m!146485 () Bool)

(assert (=> b!125790 m!146485))

(declare-fun m!146487 () Bool)

(assert (=> b!125790 m!146487))

(declare-fun m!146489 () Bool)

(assert (=> b!125790 m!146489))

(declare-fun m!146491 () Bool)

(assert (=> b!125790 m!146491))

(assert (=> b!125790 m!146483))

(assert (=> b!125790 m!146487))

(declare-fun m!146493 () Bool)

(assert (=> b!125790 m!146493))

(declare-fun m!146495 () Bool)

(assert (=> b!125790 m!146495))

(declare-fun m!146497 () Bool)

(assert (=> b!125790 m!146497))

(declare-fun m!146499 () Bool)

(assert (=> b!125790 m!146499))

(declare-fun m!146501 () Bool)

(assert (=> b!125790 m!146501))

(assert (=> b!125790 m!144651))

(declare-fun m!146503 () Bool)

(assert (=> b!125790 m!146503))

(declare-fun m!146505 () Bool)

(assert (=> b!125790 m!146505))

(declare-fun m!146507 () Bool)

(assert (=> b!125790 m!146507))

(declare-fun m!146509 () Bool)

(assert (=> b!125790 m!146509))

(assert (=> b!125790 m!146507))

(assert (=> b!125790 m!146495))

(declare-fun m!146511 () Bool)

(assert (=> b!125790 m!146511))

(assert (=> b!125790 m!146499))

(declare-fun m!146513 () Bool)

(assert (=> b!125790 m!146513))

(assert (=> d!37933 m!144709))

(assert (=> b!124909 d!37933))

(declare-fun lt!64832 () Bool)

(declare-fun d!37935 () Bool)

(assert (=> d!37935 (= lt!64832 (select (content!123 (toList!837 lt!64399)) (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82157 () Bool)

(assert (=> d!37935 (= lt!64832 e!82157)))

(declare-fun res!60879 () Bool)

(assert (=> d!37935 (=> (not res!60879) (not e!82157))))

(assert (=> d!37935 (= res!60879 ((_ is Cons!1685) (toList!837 lt!64399)))))

(assert (=> d!37935 (= (contains!865 (toList!837 lt!64399) (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!64832)))

(declare-fun b!125794 () Bool)

(declare-fun e!82158 () Bool)

(assert (=> b!125794 (= e!82157 e!82158)))

(declare-fun res!60878 () Bool)

(assert (=> b!125794 (=> res!60878 e!82158)))

(assert (=> b!125794 (= res!60878 (= (h!2286 (toList!837 lt!64399)) (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!125795 () Bool)

(assert (=> b!125795 (= e!82158 (contains!865 (t!6007 (toList!837 lt!64399)) (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!37935 res!60879) b!125794))

(assert (= (and b!125794 (not res!60878)) b!125795))

(declare-fun m!146515 () Bool)

(assert (=> d!37935 m!146515))

(declare-fun m!146517 () Bool)

(assert (=> d!37935 m!146517))

(declare-fun m!146519 () Bool)

(assert (=> b!125795 m!146519))

(assert (=> b!125114 d!37935))

(assert (=> b!124822 d!37579))

(declare-fun d!37937 () Bool)

(declare-fun e!82159 () Bool)

(assert (=> d!37937 e!82159))

(declare-fun res!60880 () Bool)

(assert (=> d!37937 (=> res!60880 e!82159)))

(declare-fun lt!64833 () Bool)

(assert (=> d!37937 (= res!60880 (not lt!64833))))

(declare-fun lt!64836 () Bool)

(assert (=> d!37937 (= lt!64833 lt!64836)))

(declare-fun lt!64835 () Unit!3865)

(declare-fun e!82160 () Unit!3865)

(assert (=> d!37937 (= lt!64835 e!82160)))

(declare-fun c!22975 () Bool)

(assert (=> d!37937 (= c!22975 lt!64836)))

(assert (=> d!37937 (= lt!64836 (containsKey!168 (toList!837 lt!64211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37937 (= (contains!863 lt!64211 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64833)))

(declare-fun b!125796 () Bool)

(declare-fun lt!64834 () Unit!3865)

(assert (=> b!125796 (= e!82160 lt!64834)))

(assert (=> b!125796 (= lt!64834 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125796 (isDefined!118 (getValueByKey!164 (toList!837 lt!64211) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125797 () Bool)

(declare-fun Unit!3914 () Unit!3865)

(assert (=> b!125797 (= e!82160 Unit!3914)))

(declare-fun b!125798 () Bool)

(assert (=> b!125798 (= e!82159 (isDefined!118 (getValueByKey!164 (toList!837 lt!64211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37937 c!22975) b!125796))

(assert (= (and d!37937 (not c!22975)) b!125797))

(assert (= (and d!37937 (not res!60880)) b!125798))

(declare-fun m!146521 () Bool)

(assert (=> d!37937 m!146521))

(declare-fun m!146523 () Bool)

(assert (=> b!125796 m!146523))

(assert (=> b!125796 m!145195))

(assert (=> b!125796 m!145195))

(declare-fun m!146525 () Bool)

(assert (=> b!125796 m!146525))

(assert (=> b!125798 m!145195))

(assert (=> b!125798 m!145195))

(assert (=> b!125798 m!146525))

(assert (=> bm!13367 d!37937))

(declare-fun d!37939 () Bool)

(declare-fun e!82161 () Bool)

(assert (=> d!37939 e!82161))

(declare-fun res!60881 () Bool)

(assert (=> d!37939 (=> res!60881 e!82161)))

(declare-fun lt!64837 () Bool)

(assert (=> d!37939 (= res!60881 (not lt!64837))))

(declare-fun lt!64840 () Bool)

(assert (=> d!37939 (= lt!64837 lt!64840)))

(declare-fun lt!64839 () Unit!3865)

(declare-fun e!82162 () Unit!3865)

(assert (=> d!37939 (= lt!64839 e!82162)))

(declare-fun c!22976 () Bool)

(assert (=> d!37939 (= c!22976 lt!64840)))

(assert (=> d!37939 (= lt!64840 (containsKey!168 (toList!837 lt!64157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37939 (= (contains!863 lt!64157 #b0000000000000000000000000000000000000000000000000000000000000000) lt!64837)))

(declare-fun b!125799 () Bool)

(declare-fun lt!64838 () Unit!3865)

(assert (=> b!125799 (= e!82162 lt!64838)))

(assert (=> b!125799 (= lt!64838 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!125799 (isDefined!118 (getValueByKey!164 (toList!837 lt!64157) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125800 () Bool)

(declare-fun Unit!3915 () Unit!3865)

(assert (=> b!125800 (= e!82162 Unit!3915)))

(declare-fun b!125801 () Bool)

(assert (=> b!125801 (= e!82161 (isDefined!118 (getValueByKey!164 (toList!837 lt!64157) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37939 c!22976) b!125799))

(assert (= (and d!37939 (not c!22976)) b!125800))

(assert (= (and d!37939 (not res!60881)) b!125801))

(declare-fun m!146527 () Bool)

(assert (=> d!37939 m!146527))

(declare-fun m!146529 () Bool)

(assert (=> b!125799 m!146529))

(assert (=> b!125799 m!145199))

(assert (=> b!125799 m!145199))

(declare-fun m!146531 () Bool)

(assert (=> b!125799 m!146531))

(assert (=> b!125801 m!145199))

(assert (=> b!125801 m!145199))

(assert (=> b!125801 m!146531))

(assert (=> bm!13354 d!37939))

(assert (=> b!124918 d!37579))

(assert (=> bm!13370 d!37839))

(declare-fun e!82164 () Option!170)

(declare-fun b!125804 () Bool)

(assert (=> b!125804 (= e!82164 (getValueByKey!164 (t!6007 (toList!837 lt!64370)) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun d!37941 () Bool)

(declare-fun c!22977 () Bool)

(assert (=> d!37941 (= c!22977 (and ((_ is Cons!1685) (toList!837 lt!64370)) (= (_1!1278 (h!2286 (toList!837 lt!64370))) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!82163 () Option!170)

(assert (=> d!37941 (= (getValueByKey!164 (toList!837 lt!64370) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!82163)))

(declare-fun b!125805 () Bool)

(assert (=> b!125805 (= e!82164 None!168)))

(declare-fun b!125803 () Bool)

(assert (=> b!125803 (= e!82163 e!82164)))

(declare-fun c!22978 () Bool)

(assert (=> b!125803 (= c!22978 (and ((_ is Cons!1685) (toList!837 lt!64370)) (not (= (_1!1278 (h!2286 (toList!837 lt!64370))) (_1!1278 (tuple2!2535 lt!64089 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125802 () Bool)

(assert (=> b!125802 (= e!82163 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64370)))))))

(assert (= (and d!37941 c!22977) b!125802))

(assert (= (and d!37941 (not c!22977)) b!125803))

(assert (= (and b!125803 c!22978) b!125804))

(assert (= (and b!125803 (not c!22978)) b!125805))

(declare-fun m!146533 () Bool)

(assert (=> b!125804 m!146533))

(assert (=> b!125090 d!37941))

(assert (=> b!125112 d!37703))

(assert (=> b!125112 d!37699))

(declare-fun d!37943 () Bool)

(assert (=> d!37943 (= (get!1439 (getValueByKey!164 (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64092)) (v!3107 (getValueByKey!164 (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64092)))))

(assert (=> d!37479 d!37943))

(declare-fun e!82166 () Option!170)

(declare-fun b!125808 () Bool)

(assert (=> b!125808 (= e!82166 (getValueByKey!164 (t!6007 (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) lt!64092))))

(declare-fun c!22979 () Bool)

(declare-fun d!37945 () Bool)

(assert (=> d!37945 (= c!22979 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64092)))))

(declare-fun e!82165 () Option!170)

(assert (=> d!37945 (= (getValueByKey!164 (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64092) e!82165)))

(declare-fun b!125809 () Bool)

(assert (=> b!125809 (= e!82166 None!168)))

(declare-fun b!125807 () Bool)

(assert (=> b!125807 (= e!82165 e!82166)))

(declare-fun c!22980 () Bool)

(assert (=> b!125807 (= c!22980 (and ((_ is Cons!1685) (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))) (not (= (_1!1278 (h!2286 (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))) lt!64092))))))

(declare-fun b!125806 () Bool)

(assert (=> b!125806 (= e!82165 (Some!169 (_2!1278 (h!2286 (toList!837 (+!157 lt!64091 (tuple2!2535 lt!64101 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))))

(assert (= (and d!37945 c!22979) b!125806))

(assert (= (and d!37945 (not c!22979)) b!125807))

(assert (= (and b!125807 c!22980) b!125808))

(assert (= (and b!125807 (not c!22980)) b!125809))

(declare-fun m!146535 () Bool)

(assert (=> b!125808 m!146535))

(assert (=> d!37479 d!37945))

(declare-fun d!37947 () Bool)

(declare-fun e!82167 () Bool)

(assert (=> d!37947 e!82167))

(declare-fun res!60883 () Bool)

(assert (=> d!37947 (=> (not res!60883) (not e!82167))))

(declare-fun lt!64844 () ListLongMap!1643)

(assert (=> d!37947 (= res!60883 (contains!863 lt!64844 (_1!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(declare-fun lt!64842 () List!1689)

(assert (=> d!37947 (= lt!64844 (ListLongMap!1644 lt!64842))))

(declare-fun lt!64843 () Unit!3865)

(declare-fun lt!64841 () Unit!3865)

(assert (=> d!37947 (= lt!64843 lt!64841)))

(assert (=> d!37947 (= (getValueByKey!164 lt!64842 (_1!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37947 (= lt!64841 (lemmaContainsTupThenGetReturnValue!82 lt!64842 (_1!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (_2!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37947 (= lt!64842 (insertStrictlySorted!85 (toList!837 (ite c!22717 call!13355 (ite c!22720 call!13357 call!13354))) (_1!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) (_2!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))))

(assert (=> d!37947 (= (+!157 (ite c!22717 call!13355 (ite c!22720 call!13357 call!13354)) (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))) lt!64844)))

(declare-fun b!125810 () Bool)

(declare-fun res!60882 () Bool)

(assert (=> b!125810 (=> (not res!60882) (not e!82167))))

(assert (=> b!125810 (= res!60882 (= (getValueByKey!164 (toList!837 lt!64844) (_1!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))) (Some!169 (_2!1278 (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))))

(declare-fun b!125811 () Bool)

(assert (=> b!125811 (= e!82167 (contains!865 (toList!837 lt!64844) (ite (or c!22717 c!22720) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(assert (= (and d!37947 res!60883) b!125810))

(assert (= (and b!125810 res!60882) b!125811))

(declare-fun m!146537 () Bool)

(assert (=> d!37947 m!146537))

(declare-fun m!146539 () Bool)

(assert (=> d!37947 m!146539))

(declare-fun m!146541 () Bool)

(assert (=> d!37947 m!146541))

(declare-fun m!146543 () Bool)

(assert (=> d!37947 m!146543))

(declare-fun m!146545 () Bool)

(assert (=> b!125810 m!146545))

(declare-fun m!146547 () Bool)

(assert (=> b!125811 m!146547))

(assert (=> bm!13350 d!37947))

(assert (=> bm!13346 d!37875))

(declare-fun d!37949 () Bool)

(declare-fun e!82168 () Bool)

(assert (=> d!37949 e!82168))

(declare-fun res!60885 () Bool)

(assert (=> d!37949 (=> (not res!60885) (not e!82168))))

(declare-fun lt!64848 () ListLongMap!1643)

(assert (=> d!37949 (= res!60885 (contains!863 lt!64848 (_1!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(declare-fun lt!64846 () List!1689)

(assert (=> d!37949 (= lt!64848 (ListLongMap!1644 lt!64846))))

(declare-fun lt!64847 () Unit!3865)

(declare-fun lt!64845 () Unit!3865)

(assert (=> d!37949 (= lt!64847 lt!64845)))

(assert (=> d!37949 (= (getValueByKey!164 lt!64846 (_1!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))) (Some!169 (_2!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(assert (=> d!37949 (= lt!64845 (lemmaContainsTupThenGetReturnValue!82 lt!64846 (_1!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (_2!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(assert (=> d!37949 (= lt!64846 (insertStrictlySorted!85 (toList!837 (ite c!22746 call!13368 (ite c!22749 call!13370 call!13367))) (_1!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) (_2!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))))))

(assert (=> d!37949 (= (+!157 (ite c!22746 call!13368 (ite c!22749 call!13370 call!13367)) (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))) lt!64848)))

(declare-fun b!125812 () Bool)

(declare-fun res!60884 () Bool)

(assert (=> b!125812 (=> (not res!60884) (not e!82168))))

(assert (=> b!125812 (= res!60884 (= (getValueByKey!164 (toList!837 lt!64848) (_1!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16)))))) (Some!169 (_2!1278 (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))))

(declare-fun b!125813 () Bool)

(assert (=> b!125813 (= e!82168 (contains!865 (toList!837 lt!64848) (ite (or c!22746 c!22749) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!22681 c!22684) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2628 newMap!16))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!22681 (ite c!22684 (minValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2628 newMap!16))))))))

(assert (= (and d!37949 res!60885) b!125812))

(assert (= (and b!125812 res!60884) b!125813))

(declare-fun m!146549 () Bool)

(assert (=> d!37949 m!146549))

(declare-fun m!146551 () Bool)

(assert (=> d!37949 m!146551))

(declare-fun m!146553 () Bool)

(assert (=> d!37949 m!146553))

(declare-fun m!146555 () Bool)

(assert (=> d!37949 m!146555))

(declare-fun m!146557 () Bool)

(assert (=> b!125812 m!146557))

(declare-fun m!146559 () Bool)

(assert (=> b!125813 m!146559))

(assert (=> bm!13363 d!37949))

(assert (=> b!124885 d!37465))

(declare-fun b!125814 () Bool)

(declare-fun e!82169 () Bool)

(declare-fun call!13473 () Bool)

(assert (=> b!125814 (= e!82169 call!13473)))

(declare-fun b!125815 () Bool)

(declare-fun e!82171 () Bool)

(assert (=> b!125815 (= e!82171 call!13473)))

(declare-fun d!37951 () Bool)

(declare-fun res!60887 () Bool)

(declare-fun e!82170 () Bool)

(assert (=> d!37951 (=> res!60887 e!82170)))

(assert (=> d!37951 (= res!60887 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37951 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4491 newMap!16) (mask!7008 newMap!16)) e!82170)))

(declare-fun b!125816 () Bool)

(assert (=> b!125816 (= e!82170 e!82169)))

(declare-fun c!22981 () Bool)

(assert (=> b!125816 (= c!22981 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125817 () Bool)

(assert (=> b!125817 (= e!82169 e!82171)))

(declare-fun lt!64851 () (_ BitVec 64))

(assert (=> b!125817 (= lt!64851 (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!64850 () Unit!3865)

(assert (=> b!125817 (= lt!64850 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4491 newMap!16) lt!64851 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!125817 (arrayContainsKey!0 (_keys!4491 newMap!16) lt!64851 #b00000000000000000000000000000000)))

(declare-fun lt!64849 () Unit!3865)

(assert (=> b!125817 (= lt!64849 lt!64850)))

(declare-fun res!60886 () Bool)

(assert (=> b!125817 (= res!60886 (= (seekEntryOrOpen!0 (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4491 newMap!16) (mask!7008 newMap!16)) (Found!272 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!125817 (=> (not res!60886) (not e!82171))))

(declare-fun bm!13470 () Bool)

(assert (=> bm!13470 (= call!13473 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(assert (= (and d!37951 (not res!60887)) b!125816))

(assert (= (and b!125816 c!22981) b!125817))

(assert (= (and b!125816 (not c!22981)) b!125814))

(assert (= (and b!125817 res!60886) b!125815))

(assert (= (or b!125815 b!125814) bm!13470))

(assert (=> b!125816 m!145313))

(assert (=> b!125816 m!145313))

(assert (=> b!125816 m!145315))

(assert (=> b!125817 m!145313))

(declare-fun m!146561 () Bool)

(assert (=> b!125817 m!146561))

(declare-fun m!146563 () Bool)

(assert (=> b!125817 m!146563))

(assert (=> b!125817 m!145313))

(declare-fun m!146565 () Bool)

(assert (=> b!125817 m!146565))

(declare-fun m!146567 () Bool)

(assert (=> bm!13470 m!146567))

(assert (=> bm!13391 d!37951))

(declare-fun d!37953 () Bool)

(declare-fun lt!64852 () Bool)

(assert (=> d!37953 (= lt!64852 (select (content!123 (toList!837 lt!64252)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun e!82172 () Bool)

(assert (=> d!37953 (= lt!64852 e!82172)))

(declare-fun res!60889 () Bool)

(assert (=> d!37953 (=> (not res!60889) (not e!82172))))

(assert (=> d!37953 (= res!60889 ((_ is Cons!1685) (toList!837 lt!64252)))))

(assert (=> d!37953 (= (contains!865 (toList!837 lt!64252) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) lt!64852)))

(declare-fun b!125818 () Bool)

(declare-fun e!82173 () Bool)

(assert (=> b!125818 (= e!82172 e!82173)))

(declare-fun res!60888 () Bool)

(assert (=> b!125818 (=> res!60888 e!82173)))

(assert (=> b!125818 (= res!60888 (= (h!2286 (toList!837 lt!64252)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(declare-fun b!125819 () Bool)

(assert (=> b!125819 (= e!82173 (contains!865 (t!6007 (toList!837 lt!64252)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))

(assert (= (and d!37953 res!60889) b!125818))

(assert (= (and b!125818 (not res!60888)) b!125819))

(declare-fun m!146569 () Bool)

(assert (=> d!37953 m!146569))

(declare-fun m!146571 () Bool)

(assert (=> d!37953 m!146571))

(declare-fun m!146573 () Bool)

(assert (=> b!125819 m!146573))

(assert (=> b!124989 d!37953))

(declare-fun d!37955 () Bool)

(assert (=> d!37955 (= (inRange!0 (ite c!22772 (index!3243 lt!64331) (ite c!22773 (index!3242 lt!64330) (index!3245 lt!64330))) (mask!7008 newMap!16)) (and (bvsge (ite c!22772 (index!3243 lt!64331) (ite c!22773 (index!3242 lt!64330) (index!3245 lt!64330))) #b00000000000000000000000000000000) (bvslt (ite c!22772 (index!3243 lt!64331) (ite c!22773 (index!3242 lt!64330) (index!3245 lt!64330))) (bvadd (mask!7008 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13379 d!37955))

(declare-fun d!37957 () Bool)

(declare-fun e!82174 () Bool)

(assert (=> d!37957 e!82174))

(declare-fun res!60890 () Bool)

(assert (=> d!37957 (=> res!60890 e!82174)))

(declare-fun lt!64853 () Bool)

(assert (=> d!37957 (= res!60890 (not lt!64853))))

(declare-fun lt!64856 () Bool)

(assert (=> d!37957 (= lt!64853 lt!64856)))

(declare-fun lt!64855 () Unit!3865)

(declare-fun e!82175 () Unit!3865)

(assert (=> d!37957 (= lt!64855 e!82175)))

(declare-fun c!22982 () Bool)

(assert (=> d!37957 (= c!22982 lt!64856)))

(assert (=> d!37957 (= lt!64856 (containsKey!168 (toList!837 lt!64236) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!37957 (= (contains!863 lt!64236 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64853)))

(declare-fun b!125820 () Bool)

(declare-fun lt!64854 () Unit!3865)

(assert (=> b!125820 (= e!82175 lt!64854)))

(assert (=> b!125820 (= lt!64854 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64236) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!125820 (isDefined!118 (getValueByKey!164 (toList!837 lt!64236) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!125821 () Bool)

(declare-fun Unit!3916 () Unit!3865)

(assert (=> b!125821 (= e!82175 Unit!3916)))

(declare-fun b!125822 () Bool)

(assert (=> b!125822 (= e!82174 (isDefined!118 (getValueByKey!164 (toList!837 lt!64236) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!37957 c!22982) b!125820))

(assert (= (and d!37957 (not c!22982)) b!125821))

(assert (= (and d!37957 (not res!60890)) b!125822))

(assert (=> d!37957 m!144579))

(declare-fun m!146575 () Bool)

(assert (=> d!37957 m!146575))

(assert (=> b!125820 m!144579))

(declare-fun m!146577 () Bool)

(assert (=> b!125820 m!146577))

(assert (=> b!125820 m!144579))

(assert (=> b!125820 m!145721))

(assert (=> b!125820 m!145721))

(declare-fun m!146579 () Bool)

(assert (=> b!125820 m!146579))

(assert (=> b!125822 m!144579))

(assert (=> b!125822 m!145721))

(assert (=> b!125822 m!145721))

(assert (=> b!125822 m!146579))

(assert (=> b!124967 d!37957))

(declare-fun d!37959 () Bool)

(assert (=> d!37959 (isDefined!118 (getValueByKey!164 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun lt!64857 () Unit!3865)

(assert (=> d!37959 (= lt!64857 (choose!755 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun e!82176 () Bool)

(assert (=> d!37959 e!82176))

(declare-fun res!60891 () Bool)

(assert (=> d!37959 (=> (not res!60891) (not e!82176))))

(assert (=> d!37959 (= res!60891 (isStrictlySorted!311 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))))

(assert (=> d!37959 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) lt!64857)))

(declare-fun b!125823 () Bool)

(assert (=> b!125823 (= e!82176 (containsKey!168 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37959 res!60891) b!125823))

(assert (=> d!37959 m!144407))

(assert (=> d!37959 m!144855))

(assert (=> d!37959 m!144855))

(assert (=> d!37959 m!144857))

(assert (=> d!37959 m!144407))

(declare-fun m!146581 () Bool)

(assert (=> d!37959 m!146581))

(declare-fun m!146583 () Bool)

(assert (=> d!37959 m!146583))

(assert (=> b!125823 m!144407))

(assert (=> b!125823 m!144851))

(assert (=> b!124913 d!37959))

(assert (=> b!124913 d!37725))

(assert (=> b!124913 d!37727))

(declare-fun d!37961 () Bool)

(assert (=> d!37961 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!507 (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> d!37961 true))

(declare-fun _$5!122 () Unit!3865)

(assert (=> d!37961 (= (choose!757 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) (index!3243 lt!64028) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2763 newMap!16)) _$5!122)))

(declare-fun bs!5209 () Bool)

(assert (= bs!5209 d!37961))

(assert (=> bs!5209 m!144527))

(assert (=> bs!5209 m!144527))

(assert (=> bs!5209 m!144847))

(assert (=> bs!5209 m!144521))

(assert (=> bs!5209 m!144849))

(assert (=> d!37441 d!37961))

(assert (=> d!37441 d!37533))

(assert (=> b!124985 d!37577))

(declare-fun d!37963 () Bool)

(declare-fun res!60892 () Bool)

(declare-fun e!82177 () Bool)

(assert (=> d!37963 (=> res!60892 e!82177)))

(assert (=> d!37963 (= res!60892 (and ((_ is Cons!1685) (toList!837 lt!64097)) (= (_1!1278 (h!2286 (toList!837 lt!64097))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37963 (= (containsKey!168 (toList!837 lt!64097) #b1000000000000000000000000000000000000000000000000000000000000000) e!82177)))

(declare-fun b!125824 () Bool)

(declare-fun e!82178 () Bool)

(assert (=> b!125824 (= e!82177 e!82178)))

(declare-fun res!60893 () Bool)

(assert (=> b!125824 (=> (not res!60893) (not e!82178))))

(assert (=> b!125824 (= res!60893 (and (or (not ((_ is Cons!1685) (toList!837 lt!64097))) (bvsle (_1!1278 (h!2286 (toList!837 lt!64097))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1685) (toList!837 lt!64097)) (bvslt (_1!1278 (h!2286 (toList!837 lt!64097))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125825 () Bool)

(assert (=> b!125825 (= e!82178 (containsKey!168 (t!6007 (toList!837 lt!64097)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!37963 (not res!60892)) b!125824))

(assert (= (and b!125824 res!60893) b!125825))

(declare-fun m!146585 () Bool)

(assert (=> b!125825 m!146585))

(assert (=> d!37433 d!37963))

(declare-fun d!37965 () Bool)

(declare-fun isEmpty!399 (List!1689) Bool)

(assert (=> d!37965 (= (isEmpty!398 lt!64236) (isEmpty!399 (toList!837 lt!64236)))))

(declare-fun bs!5210 () Bool)

(assert (= bs!5210 d!37965))

(declare-fun m!146587 () Bool)

(assert (=> bs!5210 m!146587))

(assert (=> b!124971 d!37965))

(assert (=> b!125057 d!37579))

(declare-fun d!37967 () Bool)

(assert (=> d!37967 (isDefined!118 (getValueByKey!164 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(declare-fun lt!64858 () Unit!3865)

(assert (=> d!37967 (= lt!64858 (choose!755 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(declare-fun e!82179 () Bool)

(assert (=> d!37967 e!82179))

(declare-fun res!60894 () Bool)

(assert (=> d!37967 (=> (not res!60894) (not e!82179))))

(assert (=> d!37967 (= res!60894 (isStrictlySorted!311 (toList!837 call!13319)))))

(assert (=> d!37967 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))) lt!64858)))

(declare-fun b!125826 () Bool)

(assert (=> b!125826 (= e!82179 (containsKey!168 (toList!837 call!13319) (ite c!22682 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64028)))))))

(assert (= (and d!37967 res!60894) b!125826))

(assert (=> d!37967 m!145167))

(assert (=> d!37967 m!145167))

(assert (=> d!37967 m!145169))

(declare-fun m!146589 () Bool)

(assert (=> d!37967 m!146589))

(declare-fun m!146591 () Bool)

(assert (=> d!37967 m!146591))

(assert (=> b!125826 m!145163))

(assert (=> b!125115 d!37967))

(assert (=> b!125115 d!37755))

(assert (=> b!125115 d!37757))

(declare-fun d!37969 () Bool)

(assert (=> d!37969 (isDefined!118 (getValueByKey!164 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!64859 () Unit!3865)

(assert (=> d!37969 (= lt!64859 (choose!755 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!82180 () Bool)

(assert (=> d!37969 e!82180))

(declare-fun res!60895 () Bool)

(assert (=> d!37969 (=> (not res!60895) (not e!82180))))

(assert (=> d!37969 (= res!60895 (isStrictlySorted!311 (toList!837 lt!64097)))))

(assert (=> d!37969 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!64859)))

(declare-fun b!125827 () Bool)

(assert (=> b!125827 (= e!82180 (containsKey!168 (toList!837 lt!64097) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!37969 res!60895) b!125827))

(assert (=> d!37969 m!144579))

(assert (=> d!37969 m!144719))

(assert (=> d!37969 m!144719))

(assert (=> d!37969 m!145175))

(assert (=> d!37969 m!144579))

(declare-fun m!146593 () Bool)

(assert (=> d!37969 m!146593))

(assert (=> d!37969 m!145681))

(assert (=> b!125827 m!144579))

(assert (=> b!125827 m!145171))

(assert (=> b!125118 d!37969))

(assert (=> b!125118 d!37759))

(assert (=> b!125118 d!37761))

(assert (=> b!124912 d!37823))

(assert (=> b!124912 d!37421))

(declare-fun bm!13471 () Bool)

(declare-fun call!13480 () ListLongMap!1643)

(declare-fun call!13478 () ListLongMap!1643)

(assert (=> bm!13471 (= call!13480 call!13478)))

(declare-fun b!125828 () Bool)

(declare-fun e!82184 () Bool)

(declare-fun lt!64872 () ListLongMap!1643)

(assert (=> b!125828 (= e!82184 (= (apply!110 lt!64872 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2628 newMap!16)))))

(declare-fun b!125829 () Bool)

(declare-fun e!82186 () ListLongMap!1643)

(declare-fun call!13475 () ListLongMap!1643)

(assert (=> b!125829 (= e!82186 call!13475)))

(declare-fun bm!13472 () Bool)

(declare-fun call!13474 () ListLongMap!1643)

(assert (=> bm!13472 (= call!13475 call!13474)))

(declare-fun b!125830 () Bool)

(declare-fun e!82191 () Bool)

(assert (=> b!125830 (= e!82191 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125831 () Bool)

(declare-fun e!82193 () Bool)

(assert (=> b!125831 (= e!82193 (= (apply!110 lt!64872 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125832 () Bool)

(declare-fun e!82188 () Bool)

(assert (=> b!125832 (= e!82188 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37971 () Bool)

(declare-fun e!82183 () Bool)

(assert (=> d!37971 e!82183))

(declare-fun res!60898 () Bool)

(assert (=> d!37971 (=> (not res!60898) (not e!82183))))

(assert (=> d!37971 (= res!60898 (or (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun lt!64878 () ListLongMap!1643)

(assert (=> d!37971 (= lt!64872 lt!64878)))

(declare-fun lt!64869 () Unit!3865)

(declare-fun e!82187 () Unit!3865)

(assert (=> d!37971 (= lt!64869 e!82187)))

(declare-fun c!22983 () Bool)

(assert (=> d!37971 (= c!22983 e!82191)))

(declare-fun res!60900 () Bool)

(assert (=> d!37971 (=> (not res!60900) (not e!82191))))

(assert (=> d!37971 (= res!60900 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun e!82189 () ListLongMap!1643)

(assert (=> d!37971 (= lt!64878 e!82189)))

(declare-fun c!22985 () Bool)

(assert (=> d!37971 (= c!22985 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37971 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37971 (= (getCurrentListMap!507 (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64872)))

(declare-fun b!125833 () Bool)

(declare-fun e!82182 () Bool)

(assert (=> b!125833 (= e!82182 (= (apply!110 lt!64872 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))))))))

(assert (=> b!125833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun c!22988 () Bool)

(declare-fun call!13477 () ListLongMap!1643)

(declare-fun bm!13473 () Bool)

(assert (=> bm!13473 (= call!13474 (+!157 (ite c!22985 call!13478 (ite c!22988 call!13480 call!13477)) (ite (or c!22985 c!22988) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 newMap!16)) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun bm!13474 () Bool)

(assert (=> bm!13474 (= call!13477 call!13480)))

(declare-fun b!125834 () Bool)

(declare-fun e!82185 () ListLongMap!1643)

(assert (=> b!125834 (= e!82189 e!82185)))

(assert (=> b!125834 (= c!22988 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125835 () Bool)

(declare-fun Unit!3917 () Unit!3865)

(assert (=> b!125835 (= e!82187 Unit!3917)))

(declare-fun b!125836 () Bool)

(declare-fun res!60899 () Bool)

(assert (=> b!125836 (=> (not res!60899) (not e!82183))))

(declare-fun e!82190 () Bool)

(assert (=> b!125836 (= res!60899 e!82190)))

(declare-fun res!60896 () Bool)

(assert (=> b!125836 (=> res!60896 e!82190)))

(assert (=> b!125836 (= res!60896 (not e!82188))))

(declare-fun res!60904 () Bool)

(assert (=> b!125836 (=> (not res!60904) (not e!82188))))

(assert (=> b!125836 (= res!60904 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125837 () Bool)

(declare-fun e!82181 () Bool)

(assert (=> b!125837 (= e!82181 e!82184)))

(declare-fun res!60903 () Bool)

(declare-fun call!13479 () Bool)

(assert (=> b!125837 (= res!60903 call!13479)))

(assert (=> b!125837 (=> (not res!60903) (not e!82184))))

(declare-fun bm!13475 () Bool)

(declare-fun call!13476 () Bool)

(assert (=> bm!13475 (= call!13476 (contains!863 lt!64872 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125838 () Bool)

(assert (=> b!125838 (= e!82185 call!13475)))

(declare-fun bm!13476 () Bool)

(assert (=> bm!13476 (= call!13478 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125839 () Bool)

(declare-fun res!60902 () Bool)

(assert (=> b!125839 (=> (not res!60902) (not e!82183))))

(assert (=> b!125839 (= res!60902 e!82181)))

(declare-fun c!22986 () Bool)

(assert (=> b!125839 (= c!22986 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125840 () Bool)

(declare-fun e!82192 () Bool)

(assert (=> b!125840 (= e!82192 (not call!13476))))

(declare-fun b!125841 () Bool)

(assert (=> b!125841 (= e!82183 e!82192)))

(declare-fun c!22987 () Bool)

(assert (=> b!125841 (= c!22987 (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125842 () Bool)

(assert (=> b!125842 (= e!82186 call!13477)))

(declare-fun b!125843 () Bool)

(assert (=> b!125843 (= e!82189 (+!157 call!13474 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125844 () Bool)

(assert (=> b!125844 (= e!82192 e!82193)))

(declare-fun res!60901 () Bool)

(assert (=> b!125844 (= res!60901 call!13476)))

(assert (=> b!125844 (=> (not res!60901) (not e!82193))))

(declare-fun b!125845 () Bool)

(declare-fun lt!64874 () Unit!3865)

(assert (=> b!125845 (= e!82187 lt!64874)))

(declare-fun lt!64875 () ListLongMap!1643)

(assert (=> b!125845 (= lt!64875 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64877 () (_ BitVec 64))

(assert (=> b!125845 (= lt!64877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64862 () (_ BitVec 64))

(assert (=> b!125845 (= lt!64862 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64861 () Unit!3865)

(assert (=> b!125845 (= lt!64861 (addStillContains!86 lt!64875 lt!64877 (zeroValue!2628 newMap!16) lt!64862))))

(assert (=> b!125845 (contains!863 (+!157 lt!64875 (tuple2!2535 lt!64877 (zeroValue!2628 newMap!16))) lt!64862)))

(declare-fun lt!64871 () Unit!3865)

(assert (=> b!125845 (= lt!64871 lt!64861)))

(declare-fun lt!64868 () ListLongMap!1643)

(assert (=> b!125845 (= lt!64868 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64860 () (_ BitVec 64))

(assert (=> b!125845 (= lt!64860 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64880 () (_ BitVec 64))

(assert (=> b!125845 (= lt!64880 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64863 () Unit!3865)

(assert (=> b!125845 (= lt!64863 (addApplyDifferent!86 lt!64868 lt!64860 (minValue!2628 newMap!16) lt!64880))))

(assert (=> b!125845 (= (apply!110 (+!157 lt!64868 (tuple2!2535 lt!64860 (minValue!2628 newMap!16))) lt!64880) (apply!110 lt!64868 lt!64880))))

(declare-fun lt!64865 () Unit!3865)

(assert (=> b!125845 (= lt!64865 lt!64863)))

(declare-fun lt!64881 () ListLongMap!1643)

(assert (=> b!125845 (= lt!64881 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64864 () (_ BitVec 64))

(assert (=> b!125845 (= lt!64864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64879 () (_ BitVec 64))

(assert (=> b!125845 (= lt!64879 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64873 () Unit!3865)

(assert (=> b!125845 (= lt!64873 (addApplyDifferent!86 lt!64881 lt!64864 (zeroValue!2628 newMap!16) lt!64879))))

(assert (=> b!125845 (= (apply!110 (+!157 lt!64881 (tuple2!2535 lt!64864 (zeroValue!2628 newMap!16))) lt!64879) (apply!110 lt!64881 lt!64879))))

(declare-fun lt!64870 () Unit!3865)

(assert (=> b!125845 (= lt!64870 lt!64873)))

(declare-fun lt!64866 () ListLongMap!1643)

(assert (=> b!125845 (= lt!64866 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (array!4664 (store (arr!2207 (_values!2746 newMap!16)) (index!3243 lt!64028) (ValueCellFull!1073 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2471 (_values!2746 newMap!16))) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64876 () (_ BitVec 64))

(assert (=> b!125845 (= lt!64876 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64867 () (_ BitVec 64))

(assert (=> b!125845 (= lt!64867 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125845 (= lt!64874 (addApplyDifferent!86 lt!64866 lt!64876 (minValue!2628 newMap!16) lt!64867))))

(assert (=> b!125845 (= (apply!110 (+!157 lt!64866 (tuple2!2535 lt!64876 (minValue!2628 newMap!16))) lt!64867) (apply!110 lt!64866 lt!64867))))

(declare-fun b!125846 () Bool)

(assert (=> b!125846 (= e!82181 (not call!13479))))

(declare-fun bm!13477 () Bool)

(assert (=> bm!13477 (= call!13479 (contains!863 lt!64872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125847 () Bool)

(assert (=> b!125847 (= e!82190 e!82182)))

(declare-fun res!60897 () Bool)

(assert (=> b!125847 (=> (not res!60897) (not e!82182))))

(assert (=> b!125847 (= res!60897 (contains!863 lt!64872 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125847 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125848 () Bool)

(declare-fun c!22984 () Bool)

(assert (=> b!125848 (= c!22984 (and (not (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2548 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125848 (= e!82185 e!82186)))

(assert (= (and d!37971 c!22985) b!125843))

(assert (= (and d!37971 (not c!22985)) b!125834))

(assert (= (and b!125834 c!22988) b!125838))

(assert (= (and b!125834 (not c!22988)) b!125848))

(assert (= (and b!125848 c!22984) b!125829))

(assert (= (and b!125848 (not c!22984)) b!125842))

(assert (= (or b!125829 b!125842) bm!13474))

(assert (= (or b!125838 bm!13474) bm!13471))

(assert (= (or b!125838 b!125829) bm!13472))

(assert (= (or b!125843 bm!13471) bm!13476))

(assert (= (or b!125843 bm!13472) bm!13473))

(assert (= (and d!37971 res!60900) b!125830))

(assert (= (and d!37971 c!22983) b!125845))

(assert (= (and d!37971 (not c!22983)) b!125835))

(assert (= (and d!37971 res!60898) b!125836))

(assert (= (and b!125836 res!60904) b!125832))

(assert (= (and b!125836 (not res!60896)) b!125847))

(assert (= (and b!125847 res!60897) b!125833))

(assert (= (and b!125836 res!60899) b!125839))

(assert (= (and b!125839 c!22986) b!125837))

(assert (= (and b!125839 (not c!22986)) b!125846))

(assert (= (and b!125837 res!60903) b!125828))

(assert (= (or b!125837 b!125846) bm!13477))

(assert (= (and b!125839 res!60902) b!125841))

(assert (= (and b!125841 c!22987) b!125844))

(assert (= (and b!125841 (not c!22987)) b!125840))

(assert (= (and b!125844 res!60901) b!125831))

(assert (= (or b!125844 b!125840) bm!13475))

(declare-fun b_lambda!5513 () Bool)

(assert (=> (not b_lambda!5513) (not b!125833)))

(assert (=> b!125833 t!6019))

(declare-fun b_and!7729 () Bool)

(assert (= b_and!7725 (and (=> t!6019 result!3815) b_and!7729)))

(assert (=> b!125833 t!6021))

(declare-fun b_and!7731 () Bool)

(assert (= b_and!7727 (and (=> t!6021 result!3817) b_and!7731)))

(assert (=> b!125847 m!144651))

(assert (=> b!125847 m!144651))

(declare-fun m!146595 () Bool)

(assert (=> b!125847 m!146595))

(declare-fun m!146597 () Bool)

(assert (=> b!125828 m!146597))

(declare-fun m!146599 () Bool)

(assert (=> b!125831 m!146599))

(assert (=> b!125832 m!144651))

(assert (=> b!125832 m!144651))

(assert (=> b!125832 m!144659))

(declare-fun m!146601 () Bool)

(assert (=> bm!13475 m!146601))

(declare-fun m!146603 () Bool)

(assert (=> bm!13473 m!146603))

(assert (=> b!125833 m!144665))

(declare-fun m!146605 () Bool)

(assert (=> b!125833 m!146605))

(assert (=> b!125833 m!144665))

(declare-fun m!146607 () Bool)

(assert (=> b!125833 m!146607))

(assert (=> b!125833 m!144651))

(assert (=> b!125833 m!146605))

(assert (=> b!125833 m!144651))

(declare-fun m!146609 () Bool)

(assert (=> b!125833 m!146609))

(declare-fun m!146611 () Bool)

(assert (=> bm!13477 m!146611))

(assert (=> b!125830 m!144651))

(assert (=> b!125830 m!144651))

(assert (=> b!125830 m!144659))

(declare-fun m!146613 () Bool)

(assert (=> b!125843 m!146613))

(declare-fun m!146615 () Bool)

(assert (=> bm!13476 m!146615))

(declare-fun m!146617 () Bool)

(assert (=> b!125845 m!146617))

(declare-fun m!146619 () Bool)

(assert (=> b!125845 m!146619))

(declare-fun m!146621 () Bool)

(assert (=> b!125845 m!146621))

(declare-fun m!146623 () Bool)

(assert (=> b!125845 m!146623))

(assert (=> b!125845 m!146615))

(assert (=> b!125845 m!146619))

(declare-fun m!146625 () Bool)

(assert (=> b!125845 m!146625))

(declare-fun m!146627 () Bool)

(assert (=> b!125845 m!146627))

(declare-fun m!146629 () Bool)

(assert (=> b!125845 m!146629))

(declare-fun m!146631 () Bool)

(assert (=> b!125845 m!146631))

(declare-fun m!146633 () Bool)

(assert (=> b!125845 m!146633))

(assert (=> b!125845 m!144651))

(declare-fun m!146635 () Bool)

(assert (=> b!125845 m!146635))

(declare-fun m!146637 () Bool)

(assert (=> b!125845 m!146637))

(declare-fun m!146639 () Bool)

(assert (=> b!125845 m!146639))

(declare-fun m!146641 () Bool)

(assert (=> b!125845 m!146641))

(assert (=> b!125845 m!146639))

(assert (=> b!125845 m!146627))

(declare-fun m!146643 () Bool)

(assert (=> b!125845 m!146643))

(assert (=> b!125845 m!146631))

(declare-fun m!146645 () Bool)

(assert (=> b!125845 m!146645))

(assert (=> d!37971 m!144709))

(assert (=> b!124912 d!37971))

(declare-fun d!37973 () Bool)

(declare-fun e!82194 () Bool)

(assert (=> d!37973 e!82194))

(declare-fun res!60905 () Bool)

(assert (=> d!37973 (=> res!60905 e!82194)))

(declare-fun lt!64882 () Bool)

(assert (=> d!37973 (= res!60905 (not lt!64882))))

(declare-fun lt!64885 () Bool)

(assert (=> d!37973 (= lt!64882 lt!64885)))

(declare-fun lt!64884 () Unit!3865)

(declare-fun e!82195 () Unit!3865)

(assert (=> d!37973 (= lt!64884 e!82195)))

(declare-fun c!22989 () Bool)

(assert (=> d!37973 (= c!22989 lt!64885)))

(assert (=> d!37973 (= lt!64885 (containsKey!168 (toList!837 lt!64399) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37973 (= (contains!863 lt!64399 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64882)))

(declare-fun b!125849 () Bool)

(declare-fun lt!64883 () Unit!3865)

(assert (=> b!125849 (= e!82195 lt!64883)))

(assert (=> b!125849 (= lt!64883 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64399) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!125849 (isDefined!118 (getValueByKey!164 (toList!837 lt!64399) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125850 () Bool)

(declare-fun Unit!3918 () Unit!3865)

(assert (=> b!125850 (= e!82195 Unit!3918)))

(declare-fun b!125851 () Bool)

(assert (=> b!125851 (= e!82194 (isDefined!118 (getValueByKey!164 (toList!837 lt!64399) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!37973 c!22989) b!125849))

(assert (= (and d!37973 (not c!22989)) b!125850))

(assert (= (and d!37973 (not res!60905)) b!125851))

(declare-fun m!146647 () Bool)

(assert (=> d!37973 m!146647))

(declare-fun m!146649 () Bool)

(assert (=> b!125849 m!146649))

(assert (=> b!125849 m!145155))

(assert (=> b!125849 m!145155))

(declare-fun m!146651 () Bool)

(assert (=> b!125849 m!146651))

(assert (=> b!125851 m!145155))

(assert (=> b!125851 m!145155))

(assert (=> b!125851 m!146651))

(assert (=> d!37509 d!37973))

(declare-fun e!82197 () Option!170)

(declare-fun b!125854 () Bool)

(assert (=> b!125854 (= e!82197 (getValueByKey!164 (t!6007 lt!64397) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun c!22990 () Bool)

(declare-fun d!37975 () Bool)

(assert (=> d!37975 (= c!22990 (and ((_ is Cons!1685) lt!64397) (= (_1!1278 (h!2286 lt!64397)) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!82196 () Option!170)

(assert (=> d!37975 (= (getValueByKey!164 lt!64397 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!82196)))

(declare-fun b!125855 () Bool)

(assert (=> b!125855 (= e!82197 None!168)))

(declare-fun b!125853 () Bool)

(assert (=> b!125853 (= e!82196 e!82197)))

(declare-fun c!22991 () Bool)

(assert (=> b!125853 (= c!22991 (and ((_ is Cons!1685) lt!64397) (not (= (_1!1278 (h!2286 lt!64397)) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!125852 () Bool)

(assert (=> b!125852 (= e!82196 (Some!169 (_2!1278 (h!2286 lt!64397))))))

(assert (= (and d!37975 c!22990) b!125852))

(assert (= (and d!37975 (not c!22990)) b!125853))

(assert (= (and b!125853 c!22991) b!125854))

(assert (= (and b!125853 (not c!22991)) b!125855))

(declare-fun m!146653 () Bool)

(assert (=> b!125854 m!146653))

(assert (=> d!37509 d!37975))

(declare-fun d!37977 () Bool)

(assert (=> d!37977 (= (getValueByKey!164 lt!64397 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!169 (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!64886 () Unit!3865)

(assert (=> d!37977 (= lt!64886 (choose!764 lt!64397 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!82198 () Bool)

(assert (=> d!37977 e!82198))

(declare-fun res!60906 () Bool)

(assert (=> d!37977 (=> (not res!60906) (not e!82198))))

(assert (=> d!37977 (= res!60906 (isStrictlySorted!311 lt!64397))))

(assert (=> d!37977 (= (lemmaContainsTupThenGetReturnValue!82 lt!64397 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64886)))

(declare-fun b!125856 () Bool)

(declare-fun res!60907 () Bool)

(assert (=> b!125856 (=> (not res!60907) (not e!82198))))

(assert (=> b!125856 (= res!60907 (containsKey!168 lt!64397 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125857 () Bool)

(assert (=> b!125857 (= e!82198 (contains!865 lt!64397 (tuple2!2535 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!37977 res!60906) b!125856))

(assert (= (and b!125856 res!60907) b!125857))

(assert (=> d!37977 m!145149))

(declare-fun m!146655 () Bool)

(assert (=> d!37977 m!146655))

(declare-fun m!146657 () Bool)

(assert (=> d!37977 m!146657))

(declare-fun m!146659 () Bool)

(assert (=> b!125856 m!146659))

(declare-fun m!146661 () Bool)

(assert (=> b!125857 m!146661))

(assert (=> d!37509 d!37977))

(declare-fun b!125858 () Bool)

(declare-fun e!82201 () List!1689)

(declare-fun call!13483 () List!1689)

(assert (=> b!125858 (= e!82201 call!13483)))

(declare-fun bm!13478 () Bool)

(declare-fun call!13481 () List!1689)

(declare-fun call!13482 () List!1689)

(assert (=> bm!13478 (= call!13481 call!13482)))

(declare-fun b!125859 () Bool)

(declare-fun e!82203 () List!1689)

(assert (=> b!125859 (= e!82203 call!13482)))

(declare-fun d!37979 () Bool)

(declare-fun e!82202 () Bool)

(assert (=> d!37979 e!82202))

(declare-fun res!60909 () Bool)

(assert (=> d!37979 (=> (not res!60909) (not e!82202))))

(declare-fun lt!64887 () List!1689)

(assert (=> d!37979 (= res!60909 (isStrictlySorted!311 lt!64887))))

(assert (=> d!37979 (= lt!64887 e!82203)))

(declare-fun c!22993 () Bool)

(assert (=> d!37979 (= c!22993 (and ((_ is Cons!1685) (toList!837 e!81486)) (bvslt (_1!1278 (h!2286 (toList!837 e!81486))) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!37979 (isStrictlySorted!311 (toList!837 e!81486))))

(assert (=> d!37979 (= (insertStrictlySorted!85 (toList!837 e!81486) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!64887)))

(declare-fun b!125860 () Bool)

(assert (=> b!125860 (= e!82201 call!13483)))

(declare-fun bm!13479 () Bool)

(declare-fun e!82200 () List!1689)

(assert (=> bm!13479 (= call!13482 ($colon$colon!87 e!82200 (ite c!22993 (h!2286 (toList!837 e!81486)) (tuple2!2535 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!22992 () Bool)

(assert (=> bm!13479 (= c!22992 c!22993)))

(declare-fun b!125861 () Bool)

(declare-fun e!82199 () List!1689)

(assert (=> b!125861 (= e!82203 e!82199)))

(declare-fun c!22994 () Bool)

(assert (=> b!125861 (= c!22994 (and ((_ is Cons!1685) (toList!837 e!81486)) (= (_1!1278 (h!2286 (toList!837 e!81486))) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!22995 () Bool)

(declare-fun b!125862 () Bool)

(assert (=> b!125862 (= c!22995 (and ((_ is Cons!1685) (toList!837 e!81486)) (bvsgt (_1!1278 (h!2286 (toList!837 e!81486))) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!125862 (= e!82199 e!82201)))

(declare-fun b!125863 () Bool)

(assert (=> b!125863 (= e!82202 (contains!865 lt!64887 (tuple2!2535 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!125864 () Bool)

(assert (=> b!125864 (= e!82200 (insertStrictlySorted!85 (t!6007 (toList!837 e!81486)) (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125865 () Bool)

(assert (=> b!125865 (= e!82199 call!13481)))

(declare-fun bm!13480 () Bool)

(assert (=> bm!13480 (= call!13483 call!13481)))

(declare-fun b!125866 () Bool)

(declare-fun res!60908 () Bool)

(assert (=> b!125866 (=> (not res!60908) (not e!82202))))

(assert (=> b!125866 (= res!60908 (containsKey!168 lt!64887 (_1!1278 (ite c!22681 (ite c!22684 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2535 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125867 () Bool)

(assert (=> b!125867 (= e!82200 (ite c!22994 (t!6007 (toList!837 e!81486)) (ite c!22995 (Cons!1685 (h!2286 (toList!837 e!81486)) (t!6007 (toList!837 e!81486))) Nil!1686)))))

(assert (= (and d!37979 c!22993) b!125859))

(assert (= (and d!37979 (not c!22993)) b!125861))

(assert (= (and b!125861 c!22994) b!125865))

(assert (= (and b!125861 (not c!22994)) b!125862))

(assert (= (and b!125862 c!22995) b!125860))

(assert (= (and b!125862 (not c!22995)) b!125858))

(assert (= (or b!125860 b!125858) bm!13480))

(assert (= (or b!125865 bm!13480) bm!13478))

(assert (= (or b!125859 bm!13478) bm!13479))

(assert (= (and bm!13479 c!22992) b!125864))

(assert (= (and bm!13479 (not c!22992)) b!125867))

(assert (= (and d!37979 res!60909) b!125866))

(assert (= (and b!125866 res!60908) b!125863))

(declare-fun m!146663 () Bool)

(assert (=> d!37979 m!146663))

(declare-fun m!146665 () Bool)

(assert (=> d!37979 m!146665))

(declare-fun m!146667 () Bool)

(assert (=> b!125866 m!146667))

(declare-fun m!146669 () Bool)

(assert (=> b!125864 m!146669))

(declare-fun m!146671 () Bool)

(assert (=> b!125863 m!146671))

(declare-fun m!146673 () Bool)

(assert (=> bm!13479 m!146673))

(assert (=> d!37509 d!37979))

(assert (=> bm!13353 d!37683))

(assert (=> bm!13366 d!37633))

(declare-fun b!125868 () Bool)

(declare-fun e!82207 () Bool)

(declare-fun e!82206 () Bool)

(assert (=> b!125868 (= e!82207 e!82206)))

(declare-fun c!22996 () Bool)

(assert (=> b!125868 (= c!22996 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125869 () Bool)

(declare-fun e!82204 () Bool)

(assert (=> b!125869 (= e!82204 e!82207)))

(declare-fun res!60912 () Bool)

(assert (=> b!125869 (=> (not res!60912) (not e!82207))))

(declare-fun e!82205 () Bool)

(assert (=> b!125869 (= res!60912 (not e!82205))))

(declare-fun res!60911 () Bool)

(assert (=> b!125869 (=> (not res!60911) (not e!82205))))

(assert (=> b!125869 (= res!60911 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!125870 () Bool)

(declare-fun call!13484 () Bool)

(assert (=> b!125870 (= e!82206 call!13484)))

(declare-fun d!37981 () Bool)

(declare-fun res!60910 () Bool)

(assert (=> d!37981 (=> res!60910 e!82204)))

(assert (=> d!37981 (= res!60910 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 (v!3101 (underlying!432 thiss!992))))))))

(assert (=> d!37981 (= (arrayNoDuplicates!0 (_keys!4491 (v!3101 (underlying!432 thiss!992))) #b00000000000000000000000000000000 Nil!1688) e!82204)))

(declare-fun b!125871 () Bool)

(assert (=> b!125871 (= e!82206 call!13484)))

(declare-fun bm!13481 () Bool)

(assert (=> bm!13481 (= call!13484 (arrayNoDuplicates!0 (_keys!4491 (v!3101 (underlying!432 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22996 (Cons!1687 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000) Nil!1688) Nil!1688)))))

(declare-fun b!125872 () Bool)

(assert (=> b!125872 (= e!82205 (contains!866 Nil!1688 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!37981 (not res!60910)) b!125869))

(assert (= (and b!125869 res!60911) b!125872))

(assert (= (and b!125869 res!60912) b!125868))

(assert (= (and b!125868 c!22996) b!125870))

(assert (= (and b!125868 (not c!22996)) b!125871))

(assert (= (or b!125870 b!125871) bm!13481))

(assert (=> b!125868 m!145809))

(assert (=> b!125868 m!145809))

(assert (=> b!125868 m!145811))

(assert (=> b!125869 m!145809))

(assert (=> b!125869 m!145809))

(assert (=> b!125869 m!145811))

(assert (=> bm!13481 m!145809))

(declare-fun m!146675 () Bool)

(assert (=> bm!13481 m!146675))

(assert (=> b!125872 m!145809))

(assert (=> b!125872 m!145809))

(declare-fun m!146677 () Bool)

(assert (=> b!125872 m!146677))

(assert (=> b!124819 d!37981))

(declare-fun d!37983 () Bool)

(assert (=> d!37983 (= (get!1439 (getValueByKey!164 (toList!837 lt!64093) lt!64105)) (v!3107 (getValueByKey!164 (toList!837 lt!64093) lt!64105)))))

(assert (=> d!37497 d!37983))

(declare-fun b!125875 () Bool)

(declare-fun e!82209 () Option!170)

(assert (=> b!125875 (= e!82209 (getValueByKey!164 (t!6007 (toList!837 lt!64093)) lt!64105))))

(declare-fun d!37985 () Bool)

(declare-fun c!22997 () Bool)

(assert (=> d!37985 (= c!22997 (and ((_ is Cons!1685) (toList!837 lt!64093)) (= (_1!1278 (h!2286 (toList!837 lt!64093))) lt!64105)))))

(declare-fun e!82208 () Option!170)

(assert (=> d!37985 (= (getValueByKey!164 (toList!837 lt!64093) lt!64105) e!82208)))

(declare-fun b!125876 () Bool)

(assert (=> b!125876 (= e!82209 None!168)))

(declare-fun b!125874 () Bool)

(assert (=> b!125874 (= e!82208 e!82209)))

(declare-fun c!22998 () Bool)

(assert (=> b!125874 (= c!22998 (and ((_ is Cons!1685) (toList!837 lt!64093)) (not (= (_1!1278 (h!2286 (toList!837 lt!64093))) lt!64105))))))

(declare-fun b!125873 () Bool)

(assert (=> b!125873 (= e!82208 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64093)))))))

(assert (= (and d!37985 c!22997) b!125873))

(assert (= (and d!37985 (not c!22997)) b!125874))

(assert (= (and b!125874 c!22998) b!125875))

(assert (= (and b!125874 (not c!22998)) b!125876))

(declare-fun m!146679 () Bool)

(assert (=> b!125875 m!146679))

(assert (=> d!37497 d!37985))

(declare-fun b!125889 () Bool)

(declare-fun e!82216 () SeekEntryResult!272)

(assert (=> b!125889 (= e!82216 Undefined!272)))

(declare-fun lt!64893 () SeekEntryResult!272)

(declare-fun d!37987 () Bool)

(assert (=> d!37987 (and (or ((_ is Undefined!272) lt!64893) (not ((_ is Found!272) lt!64893)) (and (bvsge (index!3243 lt!64893) #b00000000000000000000000000000000) (bvslt (index!3243 lt!64893) (size!2470 (_keys!4491 newMap!16))))) (or ((_ is Undefined!272) lt!64893) ((_ is Found!272) lt!64893) (not ((_ is MissingVacant!272) lt!64893)) (not (= (index!3245 lt!64893) (index!3244 lt!64181))) (and (bvsge (index!3245 lt!64893) #b00000000000000000000000000000000) (bvslt (index!3245 lt!64893) (size!2470 (_keys!4491 newMap!16))))) (or ((_ is Undefined!272) lt!64893) (ite ((_ is Found!272) lt!64893) (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3243 lt!64893)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) (and ((_ is MissingVacant!272) lt!64893) (= (index!3245 lt!64893) (index!3244 lt!64181)) (= (select (arr!2206 (_keys!4491 newMap!16)) (index!3245 lt!64893)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!37987 (= lt!64893 e!82216)))

(declare-fun c!23005 () Bool)

(assert (=> d!37987 (= c!23005 (bvsge (x!14820 lt!64181) #b01111111111111111111111111111110))))

(declare-fun lt!64892 () (_ BitVec 64))

(assert (=> d!37987 (= lt!64892 (select (arr!2206 (_keys!4491 newMap!16)) (index!3244 lt!64181)))))

(assert (=> d!37987 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37987 (= (seekKeyOrZeroReturnVacant!0 (x!14820 lt!64181) (index!3244 lt!64181) (index!3244 lt!64181) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)) lt!64893)))

(declare-fun b!125890 () Bool)

(declare-fun e!82217 () SeekEntryResult!272)

(assert (=> b!125890 (= e!82217 (Found!272 (index!3244 lt!64181)))))

(declare-fun b!125891 () Bool)

(declare-fun c!23006 () Bool)

(assert (=> b!125891 (= c!23006 (= lt!64892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82218 () SeekEntryResult!272)

(assert (=> b!125891 (= e!82217 e!82218)))

(declare-fun b!125892 () Bool)

(assert (=> b!125892 (= e!82218 (MissingVacant!272 (index!3244 lt!64181)))))

(declare-fun b!125893 () Bool)

(assert (=> b!125893 (= e!82218 (seekKeyOrZeroReturnVacant!0 (bvadd (x!14820 lt!64181) #b00000000000000000000000000000001) (nextIndex!0 (index!3244 lt!64181) (x!14820 lt!64181) (mask!7008 newMap!16)) (index!3244 lt!64181) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (_keys!4491 newMap!16) (mask!7008 newMap!16)))))

(declare-fun b!125894 () Bool)

(assert (=> b!125894 (= e!82216 e!82217)))

(declare-fun c!23007 () Bool)

(assert (=> b!125894 (= c!23007 (= lt!64892 (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (= (and d!37987 c!23005) b!125889))

(assert (= (and d!37987 (not c!23005)) b!125894))

(assert (= (and b!125894 c!23007) b!125890))

(assert (= (and b!125894 (not c!23007)) b!125891))

(assert (= (and b!125891 c!23006) b!125892))

(assert (= (and b!125891 (not c!23006)) b!125893))

(declare-fun m!146681 () Bool)

(assert (=> d!37987 m!146681))

(declare-fun m!146683 () Bool)

(assert (=> d!37987 m!146683))

(assert (=> d!37987 m!144819))

(assert (=> d!37987 m!144709))

(declare-fun m!146685 () Bool)

(assert (=> b!125893 m!146685))

(assert (=> b!125893 m!146685))

(assert (=> b!125893 m!144407))

(declare-fun m!146687 () Bool)

(assert (=> b!125893 m!146687))

(assert (=> b!124880 d!37987))

(assert (=> b!124975 d!37733))

(assert (=> b!124975 d!37735))

(declare-fun b!125895 () Bool)

(declare-fun e!82222 () Bool)

(declare-fun e!82221 () Bool)

(assert (=> b!125895 (= e!82222 e!82221)))

(declare-fun c!23008 () Bool)

(assert (=> b!125895 (= c!23008 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125896 () Bool)

(declare-fun e!82219 () Bool)

(assert (=> b!125896 (= e!82219 e!82222)))

(declare-fun res!60915 () Bool)

(assert (=> b!125896 (=> (not res!60915) (not e!82222))))

(declare-fun e!82220 () Bool)

(assert (=> b!125896 (= res!60915 (not e!82220))))

(declare-fun res!60914 () Bool)

(assert (=> b!125896 (=> (not res!60914) (not e!82220))))

(assert (=> b!125896 (= res!60914 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!125897 () Bool)

(declare-fun call!13485 () Bool)

(assert (=> b!125897 (= e!82221 call!13485)))

(declare-fun d!37989 () Bool)

(declare-fun res!60913 () Bool)

(assert (=> d!37989 (=> res!60913 e!82219)))

(assert (=> d!37989 (= res!60913 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(assert (=> d!37989 (= (arrayNoDuplicates!0 (_keys!4491 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!22777 (Cons!1687 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) Nil!1688) Nil!1688)) e!82219)))

(declare-fun b!125898 () Bool)

(assert (=> b!125898 (= e!82221 call!13485)))

(declare-fun bm!13482 () Bool)

(assert (=> bm!13482 (= call!13485 (arrayNoDuplicates!0 (_keys!4491 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!23008 (Cons!1687 (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!22777 (Cons!1687 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) Nil!1688) Nil!1688)) (ite c!22777 (Cons!1687 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) Nil!1688) Nil!1688))))))

(declare-fun b!125899 () Bool)

(assert (=> b!125899 (= e!82220 (contains!866 (ite c!22777 (Cons!1687 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000) Nil!1688) Nil!1688) (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!37989 (not res!60913)) b!125896))

(assert (= (and b!125896 res!60914) b!125899))

(assert (= (and b!125896 res!60915) b!125895))

(assert (= (and b!125895 c!23008) b!125897))

(assert (= (and b!125895 (not c!23008)) b!125898))

(assert (= (or b!125897 b!125898) bm!13482))

(assert (=> b!125895 m!145313))

(assert (=> b!125895 m!145313))

(assert (=> b!125895 m!145315))

(assert (=> b!125896 m!145313))

(assert (=> b!125896 m!145313))

(assert (=> b!125896 m!145315))

(assert (=> bm!13482 m!145313))

(declare-fun m!146689 () Bool)

(assert (=> bm!13482 m!146689))

(assert (=> b!125899 m!145313))

(assert (=> b!125899 m!145313))

(declare-fun m!146691 () Bool)

(assert (=> b!125899 m!146691))

(assert (=> bm!13385 d!37989))

(declare-fun d!37991 () Bool)

(declare-fun e!82223 () Bool)

(assert (=> d!37991 e!82223))

(declare-fun res!60917 () Bool)

(assert (=> d!37991 (=> (not res!60917) (not e!82223))))

(declare-fun lt!64897 () ListLongMap!1643)

(assert (=> d!37991 (= res!60917 (contains!863 lt!64897 (_1!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!64895 () List!1689)

(assert (=> d!37991 (= lt!64897 (ListLongMap!1644 lt!64895))))

(declare-fun lt!64896 () Unit!3865)

(declare-fun lt!64894 () Unit!3865)

(assert (=> d!37991 (= lt!64896 lt!64894)))

(assert (=> d!37991 (= (getValueByKey!164 lt!64895 (_1!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37991 (= lt!64894 (lemmaContainsTupThenGetReturnValue!82 lt!64895 (_1!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37991 (= lt!64895 (insertStrictlySorted!85 (toList!837 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16))) (_1!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37991 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64897)))

(declare-fun b!125900 () Bool)

(declare-fun res!60916 () Bool)

(assert (=> b!125900 (=> (not res!60916) (not e!82223))))

(assert (=> b!125900 (= res!60916 (= (getValueByKey!164 (toList!837 lt!64897) (_1!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!169 (_2!1278 (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!125901 () Bool)

(assert (=> b!125901 (= e!82223 (contains!865 (toList!837 lt!64897) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37991 res!60917) b!125900))

(assert (= (and b!125900 res!60916) b!125901))

(declare-fun m!146693 () Bool)

(assert (=> d!37991 m!146693))

(declare-fun m!146695 () Bool)

(assert (=> d!37991 m!146695))

(declare-fun m!146697 () Bool)

(assert (=> d!37991 m!146697))

(declare-fun m!146699 () Bool)

(assert (=> d!37991 m!146699))

(declare-fun m!146701 () Bool)

(assert (=> b!125900 m!146701))

(declare-fun m!146703 () Bool)

(assert (=> b!125901 m!146703))

(assert (=> d!37463 d!37991))

(declare-fun bm!13483 () Bool)

(declare-fun call!13492 () ListLongMap!1643)

(declare-fun call!13490 () ListLongMap!1643)

(assert (=> bm!13483 (= call!13492 call!13490)))

(declare-fun e!82227 () Bool)

(declare-fun lt!64910 () ListLongMap!1643)

(declare-fun b!125902 () Bool)

(assert (=> b!125902 (= e!82227 (= (apply!110 lt!64910 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125903 () Bool)

(declare-fun e!82229 () ListLongMap!1643)

(declare-fun call!13487 () ListLongMap!1643)

(assert (=> b!125903 (= e!82229 call!13487)))

(declare-fun bm!13484 () Bool)

(declare-fun call!13486 () ListLongMap!1643)

(assert (=> bm!13484 (= call!13487 call!13486)))

(declare-fun b!125904 () Bool)

(declare-fun e!82234 () Bool)

(assert (=> b!125904 (= e!82234 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!125905 () Bool)

(declare-fun e!82236 () Bool)

(assert (=> b!125905 (= e!82236 (= (apply!110 lt!64910 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2628 newMap!16)))))

(declare-fun b!125906 () Bool)

(declare-fun e!82231 () Bool)

(assert (=> b!125906 (= e!82231 (validKeyInArray!0 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!37993 () Bool)

(declare-fun e!82226 () Bool)

(assert (=> d!37993 e!82226))

(declare-fun res!60920 () Bool)

(assert (=> d!37993 (=> (not res!60920) (not e!82226))))

(assert (=> d!37993 (= res!60920 (or (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))))

(declare-fun lt!64916 () ListLongMap!1643)

(assert (=> d!37993 (= lt!64910 lt!64916)))

(declare-fun lt!64907 () Unit!3865)

(declare-fun e!82230 () Unit!3865)

(assert (=> d!37993 (= lt!64907 e!82230)))

(declare-fun c!23009 () Bool)

(assert (=> d!37993 (= c!23009 e!82234)))

(declare-fun res!60922 () Bool)

(assert (=> d!37993 (=> (not res!60922) (not e!82234))))

(assert (=> d!37993 (= res!60922 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun e!82232 () ListLongMap!1643)

(assert (=> d!37993 (= lt!64916 e!82232)))

(declare-fun c!23011 () Bool)

(assert (=> d!37993 (= c!23011 (and (not (= (bvand lt!64018 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!64018 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37993 (validMask!0 (mask!7008 newMap!16))))

(assert (=> d!37993 (= (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64018 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) lt!64910)))

(declare-fun b!125907 () Bool)

(declare-fun e!82225 () Bool)

(assert (=> b!125907 (= e!82225 (= (apply!110 lt!64910 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1435 (select (arr!2207 (_values!2746 newMap!16)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!125907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2471 (_values!2746 newMap!16))))))

(assert (=> b!125907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun c!23014 () Bool)

(declare-fun call!13489 () ListLongMap!1643)

(declare-fun bm!13485 () Bool)

(assert (=> bm!13485 (= call!13486 (+!157 (ite c!23011 call!13490 (ite c!23014 call!13492 call!13489)) (ite (or c!23011 c!23014) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16)))))))

(declare-fun bm!13486 () Bool)

(assert (=> bm!13486 (= call!13489 call!13492)))

(declare-fun b!125908 () Bool)

(declare-fun e!82228 () ListLongMap!1643)

(assert (=> b!125908 (= e!82232 e!82228)))

(assert (=> b!125908 (= c!23014 (and (not (= (bvand lt!64018 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!64018 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125909 () Bool)

(declare-fun Unit!3919 () Unit!3865)

(assert (=> b!125909 (= e!82230 Unit!3919)))

(declare-fun b!125910 () Bool)

(declare-fun res!60921 () Bool)

(assert (=> b!125910 (=> (not res!60921) (not e!82226))))

(declare-fun e!82233 () Bool)

(assert (=> b!125910 (= res!60921 e!82233)))

(declare-fun res!60918 () Bool)

(assert (=> b!125910 (=> res!60918 e!82233)))

(assert (=> b!125910 (= res!60918 (not e!82231))))

(declare-fun res!60926 () Bool)

(assert (=> b!125910 (=> (not res!60926) (not e!82231))))

(assert (=> b!125910 (= res!60926 (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125911 () Bool)

(declare-fun e!82224 () Bool)

(assert (=> b!125911 (= e!82224 e!82227)))

(declare-fun res!60925 () Bool)

(declare-fun call!13491 () Bool)

(assert (=> b!125911 (= res!60925 call!13491)))

(assert (=> b!125911 (=> (not res!60925) (not e!82227))))

(declare-fun bm!13487 () Bool)

(declare-fun call!13488 () Bool)

(assert (=> bm!13487 (= call!13488 (contains!863 lt!64910 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125912 () Bool)

(assert (=> b!125912 (= e!82228 call!13487)))

(declare-fun bm!13488 () Bool)

(assert (=> bm!13488 (= call!13490 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64018 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun b!125913 () Bool)

(declare-fun res!60924 () Bool)

(assert (=> b!125913 (=> (not res!60924) (not e!82226))))

(assert (=> b!125913 (= res!60924 e!82224)))

(declare-fun c!23012 () Bool)

(assert (=> b!125913 (= c!23012 (not (= (bvand lt!64018 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!125914 () Bool)

(declare-fun e!82235 () Bool)

(assert (=> b!125914 (= e!82235 (not call!13488))))

(declare-fun b!125915 () Bool)

(assert (=> b!125915 (= e!82226 e!82235)))

(declare-fun c!23013 () Bool)

(assert (=> b!125915 (= c!23013 (not (= (bvand lt!64018 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!125916 () Bool)

(assert (=> b!125916 (= e!82229 call!13489)))

(declare-fun b!125917 () Bool)

(assert (=> b!125917 (= e!82232 (+!157 call!13486 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 newMap!16))))))

(declare-fun b!125918 () Bool)

(assert (=> b!125918 (= e!82235 e!82236)))

(declare-fun res!60923 () Bool)

(assert (=> b!125918 (= res!60923 call!13488)))

(assert (=> b!125918 (=> (not res!60923) (not e!82236))))

(declare-fun b!125919 () Bool)

(declare-fun lt!64912 () Unit!3865)

(assert (=> b!125919 (= e!82230 lt!64912)))

(declare-fun lt!64913 () ListLongMap!1643)

(assert (=> b!125919 (= lt!64913 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64018 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64915 () (_ BitVec 64))

(assert (=> b!125919 (= lt!64915 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64900 () (_ BitVec 64))

(assert (=> b!125919 (= lt!64900 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64899 () Unit!3865)

(assert (=> b!125919 (= lt!64899 (addStillContains!86 lt!64913 lt!64915 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64900))))

(assert (=> b!125919 (contains!863 (+!157 lt!64913 (tuple2!2535 lt!64915 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64900)))

(declare-fun lt!64909 () Unit!3865)

(assert (=> b!125919 (= lt!64909 lt!64899)))

(declare-fun lt!64906 () ListLongMap!1643)

(assert (=> b!125919 (= lt!64906 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64018 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64898 () (_ BitVec 64))

(assert (=> b!125919 (= lt!64898 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64918 () (_ BitVec 64))

(assert (=> b!125919 (= lt!64918 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64901 () Unit!3865)

(assert (=> b!125919 (= lt!64901 (addApplyDifferent!86 lt!64906 lt!64898 (minValue!2628 newMap!16) lt!64918))))

(assert (=> b!125919 (= (apply!110 (+!157 lt!64906 (tuple2!2535 lt!64898 (minValue!2628 newMap!16))) lt!64918) (apply!110 lt!64906 lt!64918))))

(declare-fun lt!64903 () Unit!3865)

(assert (=> b!125919 (= lt!64903 lt!64901)))

(declare-fun lt!64919 () ListLongMap!1643)

(assert (=> b!125919 (= lt!64919 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64018 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64902 () (_ BitVec 64))

(assert (=> b!125919 (= lt!64902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64917 () (_ BitVec 64))

(assert (=> b!125919 (= lt!64917 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!64911 () Unit!3865)

(assert (=> b!125919 (= lt!64911 (addApplyDifferent!86 lt!64919 lt!64902 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!64917))))

(assert (=> b!125919 (= (apply!110 (+!157 lt!64919 (tuple2!2535 lt!64902 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!64917) (apply!110 lt!64919 lt!64917))))

(declare-fun lt!64908 () Unit!3865)

(assert (=> b!125919 (= lt!64908 lt!64911)))

(declare-fun lt!64904 () ListLongMap!1643)

(assert (=> b!125919 (= lt!64904 (getCurrentListMapNoExtraKeys!122 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64018 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(declare-fun lt!64914 () (_ BitVec 64))

(assert (=> b!125919 (= lt!64914 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!64905 () (_ BitVec 64))

(assert (=> b!125919 (= lt!64905 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125919 (= lt!64912 (addApplyDifferent!86 lt!64904 lt!64914 (minValue!2628 newMap!16) lt!64905))))

(assert (=> b!125919 (= (apply!110 (+!157 lt!64904 (tuple2!2535 lt!64914 (minValue!2628 newMap!16))) lt!64905) (apply!110 lt!64904 lt!64905))))

(declare-fun b!125920 () Bool)

(assert (=> b!125920 (= e!82224 (not call!13491))))

(declare-fun bm!13489 () Bool)

(assert (=> bm!13489 (= call!13491 (contains!863 lt!64910 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!125921 () Bool)

(assert (=> b!125921 (= e!82233 e!82225)))

(declare-fun res!60919 () Bool)

(assert (=> b!125921 (=> (not res!60919) (not e!82225))))

(assert (=> b!125921 (= res!60919 (contains!863 lt!64910 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!125921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125922 () Bool)

(declare-fun c!23010 () Bool)

(assert (=> b!125922 (= c!23010 (and (not (= (bvand lt!64018 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!64018 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!125922 (= e!82228 e!82229)))

(assert (= (and d!37993 c!23011) b!125917))

(assert (= (and d!37993 (not c!23011)) b!125908))

(assert (= (and b!125908 c!23014) b!125912))

(assert (= (and b!125908 (not c!23014)) b!125922))

(assert (= (and b!125922 c!23010) b!125903))

(assert (= (and b!125922 (not c!23010)) b!125916))

(assert (= (or b!125903 b!125916) bm!13486))

(assert (= (or b!125912 bm!13486) bm!13483))

(assert (= (or b!125912 b!125903) bm!13484))

(assert (= (or b!125917 bm!13483) bm!13488))

(assert (= (or b!125917 bm!13484) bm!13485))

(assert (= (and d!37993 res!60922) b!125904))

(assert (= (and d!37993 c!23009) b!125919))

(assert (= (and d!37993 (not c!23009)) b!125909))

(assert (= (and d!37993 res!60920) b!125910))

(assert (= (and b!125910 res!60926) b!125906))

(assert (= (and b!125910 (not res!60918)) b!125921))

(assert (= (and b!125921 res!60919) b!125907))

(assert (= (and b!125910 res!60921) b!125913))

(assert (= (and b!125913 c!23012) b!125911))

(assert (= (and b!125913 (not c!23012)) b!125920))

(assert (= (and b!125911 res!60925) b!125902))

(assert (= (or b!125911 b!125920) bm!13489))

(assert (= (and b!125913 res!60924) b!125915))

(assert (= (and b!125915 c!23013) b!125918))

(assert (= (and b!125915 (not c!23013)) b!125914))

(assert (= (and b!125918 res!60923) b!125905))

(assert (= (or b!125918 b!125914) bm!13487))

(declare-fun b_lambda!5515 () Bool)

(assert (=> (not b_lambda!5515) (not b!125907)))

(assert (=> b!125907 t!6019))

(declare-fun b_and!7733 () Bool)

(assert (= b_and!7729 (and (=> t!6019 result!3815) b_and!7733)))

(assert (=> b!125907 t!6021))

(declare-fun b_and!7735 () Bool)

(assert (= b_and!7731 (and (=> t!6021 result!3817) b_and!7735)))

(assert (=> b!125921 m!144651))

(assert (=> b!125921 m!144651))

(declare-fun m!146705 () Bool)

(assert (=> b!125921 m!146705))

(declare-fun m!146707 () Bool)

(assert (=> b!125902 m!146707))

(declare-fun m!146709 () Bool)

(assert (=> b!125905 m!146709))

(assert (=> b!125906 m!144651))

(assert (=> b!125906 m!144651))

(assert (=> b!125906 m!144659))

(declare-fun m!146711 () Bool)

(assert (=> bm!13487 m!146711))

(declare-fun m!146713 () Bool)

(assert (=> bm!13485 m!146713))

(assert (=> b!125907 m!144665))

(assert (=> b!125907 m!144757))

(assert (=> b!125907 m!144665))

(assert (=> b!125907 m!144759))

(assert (=> b!125907 m!144651))

(assert (=> b!125907 m!144757))

(assert (=> b!125907 m!144651))

(declare-fun m!146715 () Bool)

(assert (=> b!125907 m!146715))

(declare-fun m!146717 () Bool)

(assert (=> bm!13489 m!146717))

(assert (=> b!125904 m!144651))

(assert (=> b!125904 m!144651))

(assert (=> b!125904 m!144659))

(declare-fun m!146719 () Bool)

(assert (=> b!125917 m!146719))

(assert (=> bm!13488 m!144419))

(declare-fun m!146721 () Bool)

(assert (=> bm!13488 m!146721))

(declare-fun m!146723 () Bool)

(assert (=> b!125919 m!146723))

(declare-fun m!146725 () Bool)

(assert (=> b!125919 m!146725))

(declare-fun m!146727 () Bool)

(assert (=> b!125919 m!146727))

(declare-fun m!146729 () Bool)

(assert (=> b!125919 m!146729))

(assert (=> b!125919 m!144419))

(assert (=> b!125919 m!146721))

(assert (=> b!125919 m!146725))

(declare-fun m!146731 () Bool)

(assert (=> b!125919 m!146731))

(declare-fun m!146733 () Bool)

(assert (=> b!125919 m!146733))

(assert (=> b!125919 m!144419))

(declare-fun m!146735 () Bool)

(assert (=> b!125919 m!146735))

(declare-fun m!146737 () Bool)

(assert (=> b!125919 m!146737))

(declare-fun m!146739 () Bool)

(assert (=> b!125919 m!146739))

(assert (=> b!125919 m!144651))

(declare-fun m!146741 () Bool)

(assert (=> b!125919 m!146741))

(assert (=> b!125919 m!144419))

(declare-fun m!146743 () Bool)

(assert (=> b!125919 m!146743))

(declare-fun m!146745 () Bool)

(assert (=> b!125919 m!146745))

(declare-fun m!146747 () Bool)

(assert (=> b!125919 m!146747))

(assert (=> b!125919 m!146745))

(assert (=> b!125919 m!146733))

(declare-fun m!146749 () Bool)

(assert (=> b!125919 m!146749))

(assert (=> b!125919 m!146737))

(declare-fun m!146751 () Bool)

(assert (=> b!125919 m!146751))

(assert (=> d!37993 m!144709))

(assert (=> d!37463 d!37993))

(assert (=> d!37463 d!37421))

(declare-fun d!37995 () Bool)

(assert (=> d!37995 (= (+!157 (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) (zeroValue!2628 newMap!16) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!507 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) lt!64018 (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2763 newMap!16)))))

(assert (=> d!37995 true))

(declare-fun _$7!104 () Unit!3865)

(assert (=> d!37995 (= (choose!759 (_keys!4491 newMap!16) (_values!2746 newMap!16) (mask!7008 newMap!16) (extraKeys!2548 newMap!16) lt!64018 (zeroValue!2628 newMap!16) (get!1435 (select (arr!2207 (_values!2746 (v!3101 (underlying!432 thiss!992)))) from!355) (dynLambda!407 (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2628 newMap!16) (defaultEntry!2763 newMap!16)) _$7!104)))

(declare-fun bs!5211 () Bool)

(assert (= bs!5211 d!37995))

(assert (=> bs!5211 m!144527))

(assert (=> bs!5211 m!144527))

(assert (=> bs!5211 m!145015))

(assert (=> bs!5211 m!144419))

(assert (=> bs!5211 m!145013))

(assert (=> d!37463 d!37995))

(assert (=> d!37463 d!37533))

(declare-fun b!125923 () Bool)

(declare-fun e!82238 () (_ BitVec 32))

(declare-fun e!82237 () (_ BitVec 32))

(assert (=> b!125923 (= e!82238 e!82237)))

(declare-fun c!23015 () Bool)

(assert (=> b!125923 (= c!23015 (validKeyInArray!0 (select (arr!2206 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(declare-fun d!37997 () Bool)

(declare-fun lt!64920 () (_ BitVec 32))

(assert (=> d!37997 (and (bvsge lt!64920 #b00000000000000000000000000000000) (bvsle lt!64920 (bvsub (size!2470 (_keys!4491 (_2!1279 lt!64023))) #b00000000000000000000000000000000)))))

(assert (=> d!37997 (= lt!64920 e!82238)))

(declare-fun c!23016 () Bool)

(assert (=> d!37997 (= c!23016 (bvsge #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(assert (=> d!37997 (and (bvsle #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2470 (_keys!4491 (_2!1279 lt!64023))) (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(assert (=> d!37997 (= (arrayCountValidKeys!0 (_keys!4491 (_2!1279 lt!64023)) #b00000000000000000000000000000000 (size!2470 (_keys!4491 (_2!1279 lt!64023)))) lt!64920)))

(declare-fun b!125924 () Bool)

(assert (=> b!125924 (= e!82238 #b00000000000000000000000000000000)))

(declare-fun bm!13490 () Bool)

(declare-fun call!13493 () (_ BitVec 32))

(assert (=> bm!13490 (= call!13493 (arrayCountValidKeys!0 (_keys!4491 (_2!1279 lt!64023)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2470 (_keys!4491 (_2!1279 lt!64023)))))))

(declare-fun b!125925 () Bool)

(assert (=> b!125925 (= e!82237 call!13493)))

(declare-fun b!125926 () Bool)

(assert (=> b!125926 (= e!82237 (bvadd #b00000000000000000000000000000001 call!13493))))

(assert (= (and d!37997 c!23016) b!125924))

(assert (= (and d!37997 (not c!23016)) b!125923))

(assert (= (and b!125923 c!23015) b!125926))

(assert (= (and b!125923 (not c!23015)) b!125925))

(assert (= (or b!125926 b!125925) bm!13490))

(assert (=> b!125923 m!145187))

(assert (=> b!125923 m!145187))

(assert (=> b!125923 m!145189))

(declare-fun m!146753 () Bool)

(assert (=> bm!13490 m!146753))

(assert (=> b!124810 d!37997))

(declare-fun d!37999 () Bool)

(declare-fun res!60927 () Bool)

(declare-fun e!82239 () Bool)

(assert (=> d!37999 (=> res!60927 e!82239)))

(assert (=> d!37999 (= res!60927 (= (select (arr!2206 (_keys!4491 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!37999 (= (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!82239)))

(declare-fun b!125927 () Bool)

(declare-fun e!82240 () Bool)

(assert (=> b!125927 (= e!82239 e!82240)))

(declare-fun res!60928 () Bool)

(assert (=> b!125927 (=> (not res!60928) (not e!82240))))

(assert (=> b!125927 (= res!60928 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2470 (_keys!4491 newMap!16))))))

(declare-fun b!125928 () Bool)

(assert (=> b!125928 (= e!82240 (arrayContainsKey!0 (_keys!4491 newMap!16) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!37999 (not res!60927)) b!125927))

(assert (= (and b!125927 res!60928) b!125928))

(assert (=> d!37999 m!145313))

(assert (=> b!125928 m!144407))

(declare-fun m!146755 () Bool)

(assert (=> b!125928 m!146755))

(assert (=> b!124906 d!37999))

(assert (=> bm!13359 d!37437))

(declare-fun d!38001 () Bool)

(declare-fun lt!64921 () Bool)

(assert (=> d!38001 (= lt!64921 (select (content!123 (toList!837 lt!64144)) (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun e!82241 () Bool)

(assert (=> d!38001 (= lt!64921 e!82241)))

(declare-fun res!60930 () Bool)

(assert (=> d!38001 (=> (not res!60930) (not e!82241))))

(assert (=> d!38001 (= res!60930 ((_ is Cons!1685) (toList!837 lt!64144)))))

(assert (=> d!38001 (= (contains!865 (toList!837 lt!64144) (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64921)))

(declare-fun b!125929 () Bool)

(declare-fun e!82242 () Bool)

(assert (=> b!125929 (= e!82241 e!82242)))

(declare-fun res!60929 () Bool)

(assert (=> b!125929 (=> res!60929 e!82242)))

(assert (=> b!125929 (= res!60929 (= (h!2286 (toList!837 lt!64144)) (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125930 () Bool)

(assert (=> b!125930 (= e!82242 (contains!865 (t!6007 (toList!837 lt!64144)) (ite (or c!22704 c!22707) (tuple2!2535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2628 (v!3101 (underlying!432 thiss!992)))) (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (= (and d!38001 res!60930) b!125929))

(assert (= (and b!125929 (not res!60929)) b!125930))

(declare-fun m!146757 () Bool)

(assert (=> d!38001 m!146757))

(declare-fun m!146759 () Bool)

(assert (=> d!38001 m!146759))

(declare-fun m!146761 () Bool)

(assert (=> b!125930 m!146761))

(assert (=> b!124816 d!38001))

(declare-fun d!38003 () Bool)

(assert (=> d!38003 (= (apply!110 lt!64131 (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000)) (get!1439 (getValueByKey!164 (toList!837 lt!64131) (select (arr!2206 (_keys!4491 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5212 () Bool)

(assert (= bs!5212 d!38003))

(assert (=> bs!5212 m!144651))

(assert (=> bs!5212 m!145947))

(assert (=> bs!5212 m!145947))

(declare-fun m!146763 () Bool)

(assert (=> bs!5212 m!146763))

(assert (=> b!124794 d!38003))

(declare-fun c!23017 () Bool)

(declare-fun d!38005 () Bool)

(assert (=> d!38005 (= c!23017 ((_ is ValueCellFull!1073) (select (arr!2207 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032)) #b00000000000000000000000000000000)))))

(declare-fun e!82243 () V!3425)

(assert (=> d!38005 (= (get!1435 (select (arr!2207 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82243)))

(declare-fun b!125931 () Bool)

(assert (=> b!125931 (= e!82243 (get!1437 (select (arr!2207 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!125932 () Bool)

(assert (=> b!125932 (= e!82243 (get!1438 (select (arr!2207 (ite (or c!22681 c!22682) (_values!2746 newMap!16) lt!64032)) #b00000000000000000000000000000000) (dynLambda!407 (defaultEntry!2763 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38005 c!23017) b!125931))

(assert (= (and d!38005 (not c!23017)) b!125932))

(assert (=> b!125931 m!144667))

(assert (=> b!125931 m!144665))

(declare-fun m!146765 () Bool)

(assert (=> b!125931 m!146765))

(assert (=> b!125932 m!144667))

(assert (=> b!125932 m!144665))

(declare-fun m!146767 () Bool)

(assert (=> b!125932 m!146767))

(assert (=> b!124794 d!38005))

(declare-fun d!38007 () Bool)

(assert (=> d!38007 (= (get!1439 (getValueByKey!164 (toList!837 lt!64106) lt!64104)) (v!3107 (getValueByKey!164 (toList!837 lt!64106) lt!64104)))))

(assert (=> d!37475 d!38007))

(declare-fun b!125935 () Bool)

(declare-fun e!82245 () Option!170)

(assert (=> b!125935 (= e!82245 (getValueByKey!164 (t!6007 (toList!837 lt!64106)) lt!64104))))

(declare-fun d!38009 () Bool)

(declare-fun c!23018 () Bool)

(assert (=> d!38009 (= c!23018 (and ((_ is Cons!1685) (toList!837 lt!64106)) (= (_1!1278 (h!2286 (toList!837 lt!64106))) lt!64104)))))

(declare-fun e!82244 () Option!170)

(assert (=> d!38009 (= (getValueByKey!164 (toList!837 lt!64106) lt!64104) e!82244)))

(declare-fun b!125936 () Bool)

(assert (=> b!125936 (= e!82245 None!168)))

(declare-fun b!125934 () Bool)

(assert (=> b!125934 (= e!82244 e!82245)))

(declare-fun c!23019 () Bool)

(assert (=> b!125934 (= c!23019 (and ((_ is Cons!1685) (toList!837 lt!64106)) (not (= (_1!1278 (h!2286 (toList!837 lt!64106))) lt!64104))))))

(declare-fun b!125933 () Bool)

(assert (=> b!125933 (= e!82244 (Some!169 (_2!1278 (h!2286 (toList!837 lt!64106)))))))

(assert (= (and d!38009 c!23018) b!125933))

(assert (= (and d!38009 (not c!23018)) b!125934))

(assert (= (and b!125934 c!23019) b!125935))

(assert (= (and b!125934 (not c!23019)) b!125936))

(declare-fun m!146769 () Bool)

(assert (=> b!125935 m!146769))

(assert (=> d!37475 d!38009))

(declare-fun d!38011 () Bool)

(declare-fun e!82246 () Bool)

(assert (=> d!38011 e!82246))

(declare-fun res!60931 () Bool)

(assert (=> d!38011 (=> res!60931 e!82246)))

(declare-fun lt!64922 () Bool)

(assert (=> d!38011 (= res!60931 (not lt!64922))))

(declare-fun lt!64925 () Bool)

(assert (=> d!38011 (= lt!64922 lt!64925)))

(declare-fun lt!64924 () Unit!3865)

(declare-fun e!82247 () Unit!3865)

(assert (=> d!38011 (= lt!64924 e!82247)))

(declare-fun c!23020 () Bool)

(assert (=> d!38011 (= c!23020 lt!64925)))

(assert (=> d!38011 (= lt!64925 (containsKey!168 (toList!837 (map!1365 (_2!1279 lt!64322))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> d!38011 (= (contains!863 (map!1365 (_2!1279 lt!64322)) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)) lt!64922)))

(declare-fun b!125937 () Bool)

(declare-fun lt!64923 () Unit!3865)

(assert (=> b!125937 (= e!82247 lt!64923)))

(assert (=> b!125937 (= lt!64923 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 (map!1365 (_2!1279 lt!64322))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(assert (=> b!125937 (isDefined!118 (getValueByKey!164 (toList!837 (map!1365 (_2!1279 lt!64322))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355)))))

(declare-fun b!125938 () Bool)

(declare-fun Unit!3920 () Unit!3865)

(assert (=> b!125938 (= e!82247 Unit!3920)))

(declare-fun b!125939 () Bool)

(assert (=> b!125939 (= e!82246 (isDefined!118 (getValueByKey!164 (toList!837 (map!1365 (_2!1279 lt!64322))) (select (arr!2206 (_keys!4491 (v!3101 (underlying!432 thiss!992)))) from!355))))))

(assert (= (and d!38011 c!23020) b!125937))

(assert (= (and d!38011 (not c!23020)) b!125938))

(assert (= (and d!38011 (not res!60931)) b!125939))

(assert (=> d!38011 m!144407))

(declare-fun m!146771 () Bool)

(assert (=> d!38011 m!146771))

(assert (=> b!125937 m!144407))

(declare-fun m!146773 () Bool)

(assert (=> b!125937 m!146773))

(assert (=> b!125937 m!144407))

(declare-fun m!146775 () Bool)

(assert (=> b!125937 m!146775))

(assert (=> b!125937 m!146775))

(declare-fun m!146777 () Bool)

(assert (=> b!125937 m!146777))

(assert (=> b!125939 m!144407))

(assert (=> b!125939 m!146775))

(assert (=> b!125939 m!146775))

(assert (=> b!125939 m!146777))

(assert (=> b!125035 d!38011))

(assert (=> b!125035 d!37573))

(declare-fun d!38013 () Bool)

(declare-fun e!82248 () Bool)

(assert (=> d!38013 e!82248))

(declare-fun res!60932 () Bool)

(assert (=> d!38013 (=> res!60932 e!82248)))

(declare-fun lt!64926 () Bool)

(assert (=> d!38013 (= res!60932 (not lt!64926))))

(declare-fun lt!64929 () Bool)

(assert (=> d!38013 (= lt!64926 lt!64929)))

(declare-fun lt!64928 () Unit!3865)

(declare-fun e!82249 () Unit!3865)

(assert (=> d!38013 (= lt!64928 e!82249)))

(declare-fun c!23021 () Bool)

(assert (=> d!38013 (= c!23021 lt!64929)))

(assert (=> d!38013 (= lt!64929 (containsKey!168 (toList!837 lt!64252) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> d!38013 (= (contains!863 lt!64252 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64926)))

(declare-fun b!125940 () Bool)

(declare-fun lt!64927 () Unit!3865)

(assert (=> b!125940 (= e!82249 lt!64927)))

(assert (=> b!125940 (= lt!64927 (lemmaContainsKeyImpliesGetValueByKeyDefined!117 (toList!837 lt!64252) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(assert (=> b!125940 (isDefined!118 (getValueByKey!164 (toList!837 lt!64252) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125941 () Bool)

(declare-fun Unit!3921 () Unit!3865)

(assert (=> b!125941 (= e!82249 Unit!3921)))

(declare-fun b!125942 () Bool)

(assert (=> b!125942 (= e!82248 (isDefined!118 (getValueByKey!164 (toList!837 lt!64252) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!38013 c!23021) b!125940))

(assert (= (and d!38013 (not c!23021)) b!125941))

(assert (= (and d!38013 (not res!60932)) b!125942))

(declare-fun m!146779 () Bool)

(assert (=> d!38013 m!146779))

(declare-fun m!146781 () Bool)

(assert (=> b!125940 m!146781))

(assert (=> b!125940 m!144955))

(assert (=> b!125940 m!144955))

(declare-fun m!146783 () Bool)

(assert (=> b!125940 m!146783))

(assert (=> b!125942 m!144955))

(assert (=> b!125942 m!144955))

(assert (=> b!125942 m!146783))

(assert (=> d!37457 d!38013))

(declare-fun b!125945 () Bool)

(declare-fun e!82251 () Option!170)

(assert (=> b!125945 (= e!82251 (getValueByKey!164 (t!6007 lt!64250) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun d!38015 () Bool)

(declare-fun c!23022 () Bool)

(assert (=> d!38015 (= c!23022 (and ((_ is Cons!1685) lt!64250) (= (_1!1278 (h!2286 lt!64250)) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun e!82250 () Option!170)

(assert (=> d!38015 (= (getValueByKey!164 lt!64250 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) e!82250)))

(declare-fun b!125946 () Bool)

(assert (=> b!125946 (= e!82251 None!168)))

(declare-fun b!125944 () Bool)

(assert (=> b!125944 (= e!82250 e!82251)))

(declare-fun c!23023 () Bool)

(assert (=> b!125944 (= c!23023 (and ((_ is Cons!1685) lt!64250) (not (= (_1!1278 (h!2286 lt!64250)) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun b!125943 () Bool)

(assert (=> b!125943 (= e!82250 (Some!169 (_2!1278 (h!2286 lt!64250))))))

(assert (= (and d!38015 c!23022) b!125943))

(assert (= (and d!38015 (not c!23022)) b!125944))

(assert (= (and b!125944 c!23023) b!125945))

(assert (= (and b!125944 (not c!23023)) b!125946))

(declare-fun m!146785 () Bool)

(assert (=> b!125945 m!146785))

(assert (=> d!37457 d!38015))

(declare-fun d!38017 () Bool)

(assert (=> d!38017 (= (getValueByKey!164 lt!64250 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) (Some!169 (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun lt!64930 () Unit!3865)

(assert (=> d!38017 (= lt!64930 (choose!764 lt!64250 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun e!82252 () Bool)

(assert (=> d!38017 e!82252))

(declare-fun res!60933 () Bool)

(assert (=> d!38017 (=> (not res!60933) (not e!82252))))

(assert (=> d!38017 (= res!60933 (isStrictlySorted!311 lt!64250))))

(assert (=> d!38017 (= (lemmaContainsTupThenGetReturnValue!82 lt!64250 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64930)))

(declare-fun b!125947 () Bool)

(declare-fun res!60934 () Bool)

(assert (=> b!125947 (=> (not res!60934) (not e!82252))))

(assert (=> b!125947 (= res!60934 (containsKey!168 lt!64250 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125948 () Bool)

(assert (=> b!125948 (= e!82252 (contains!865 lt!64250 (tuple2!2535 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (= (and d!38017 res!60933) b!125947))

(assert (= (and b!125947 res!60934) b!125948))

(assert (=> d!38017 m!144949))

(declare-fun m!146787 () Bool)

(assert (=> d!38017 m!146787))

(declare-fun m!146789 () Bool)

(assert (=> d!38017 m!146789))

(declare-fun m!146791 () Bool)

(assert (=> b!125947 m!146791))

(declare-fun m!146793 () Bool)

(assert (=> b!125948 m!146793))

(assert (=> d!37457 d!38017))

(declare-fun b!125949 () Bool)

(declare-fun e!82255 () List!1689)

(declare-fun call!13496 () List!1689)

(assert (=> b!125949 (= e!82255 call!13496)))

(declare-fun bm!13491 () Bool)

(declare-fun call!13494 () List!1689)

(declare-fun call!13495 () List!1689)

(assert (=> bm!13491 (= call!13494 call!13495)))

(declare-fun b!125950 () Bool)

(declare-fun e!82257 () List!1689)

(assert (=> b!125950 (= e!82257 call!13495)))

(declare-fun d!38019 () Bool)

(declare-fun e!82256 () Bool)

(assert (=> d!38019 e!82256))

(declare-fun res!60936 () Bool)

(assert (=> d!38019 (=> (not res!60936) (not e!82256))))

(declare-fun lt!64931 () List!1689)

(assert (=> d!38019 (= res!60936 (isStrictlySorted!311 lt!64931))))

(assert (=> d!38019 (= lt!64931 e!82257)))

(declare-fun c!23025 () Bool)

(assert (=> d!38019 (= c!23025 (and ((_ is Cons!1685) (toList!837 call!13337)) (bvslt (_1!1278 (h!2286 (toList!837 call!13337))) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> d!38019 (isStrictlySorted!311 (toList!837 call!13337))))

(assert (=> d!38019 (= (insertStrictlySorted!85 (toList!837 call!13337) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))) lt!64931)))

(declare-fun b!125951 () Bool)

(assert (=> b!125951 (= e!82255 call!13496)))

(declare-fun bm!13492 () Bool)

(declare-fun e!82254 () List!1689)

(assert (=> bm!13492 (= call!13495 ($colon$colon!87 e!82254 (ite c!23025 (h!2286 (toList!837 call!13337)) (tuple2!2535 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))))

(declare-fun c!23024 () Bool)

(assert (=> bm!13492 (= c!23024 c!23025)))

(declare-fun b!125952 () Bool)

(declare-fun e!82253 () List!1689)

(assert (=> b!125952 (= e!82257 e!82253)))

(declare-fun c!23026 () Bool)

(assert (=> b!125952 (= c!23026 (and ((_ is Cons!1685) (toList!837 call!13337)) (= (_1!1278 (h!2286 (toList!837 call!13337))) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125953 () Bool)

(declare-fun c!23027 () Bool)

(assert (=> b!125953 (= c!23027 (and ((_ is Cons!1685) (toList!837 call!13337)) (bvsgt (_1!1278 (h!2286 (toList!837 call!13337))) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(assert (=> b!125953 (= e!82253 e!82255)))

(declare-fun b!125954 () Bool)

(assert (=> b!125954 (= e!82256 (contains!865 lt!64931 (tuple2!2535 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))))))))

(declare-fun b!125955 () Bool)

(assert (=> b!125955 (= e!82254 (insertStrictlySorted!85 (t!6007 (toList!837 call!13337)) (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992))))) (_2!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125956 () Bool)

(assert (=> b!125956 (= e!82253 call!13494)))

(declare-fun bm!13493 () Bool)

(assert (=> bm!13493 (= call!13496 call!13494)))

(declare-fun b!125957 () Bool)

(declare-fun res!60935 () Bool)

(assert (=> b!125957 (=> (not res!60935) (not e!82256))))

(assert (=> b!125957 (= res!60935 (containsKey!168 lt!64931 (_1!1278 (tuple2!2535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2628 (v!3101 (underlying!432 thiss!992)))))))))

(declare-fun b!125958 () Bool)

(assert (=> b!125958 (= e!82254 (ite c!23026 (t!6007 (toList!837 call!13337)) (ite c!23027 (Cons!1685 (h!2286 (toList!837 call!13337)) (t!6007 (toList!837 call!13337))) Nil!1686)))))

(assert (= (and d!38019 c!23025) b!125950))

(assert (= (and d!38019 (not c!23025)) b!125952))

(assert (= (and b!125952 c!23026) b!125956))

(assert (= (and b!125952 (not c!23026)) b!125953))

(assert (= (and b!125953 c!23027) b!125951))

(assert (= (and b!125953 (not c!23027)) b!125949))

(assert (= (or b!125951 b!125949) bm!13493))

(assert (= (or b!125956 bm!13493) bm!13491))

(assert (= (or b!125950 bm!13491) bm!13492))

(assert (= (and bm!13492 c!23024) b!125955))

(assert (= (and bm!13492 (not c!23024)) b!125958))

(assert (= (and d!38019 res!60936) b!125957))

(assert (= (and b!125957 res!60935) b!125954))

(declare-fun m!146795 () Bool)

(assert (=> d!38019 m!146795))

(declare-fun m!146797 () Bool)

(assert (=> d!38019 m!146797))

(declare-fun m!146799 () Bool)

(assert (=> b!125957 m!146799))

(declare-fun m!146801 () Bool)

(assert (=> b!125955 m!146801))

(declare-fun m!146803 () Bool)

(assert (=> b!125954 m!146803))

(declare-fun m!146805 () Bool)

(assert (=> bm!13492 m!146805))

(assert (=> d!37457 d!38019))

(declare-fun b!125959 () Bool)

(declare-fun e!82258 () Bool)

(assert (=> b!125959 (= e!82258 tp_is_empty!2833)))

(declare-fun b!125960 () Bool)

(declare-fun e!82259 () Bool)

(assert (=> b!125960 (= e!82259 tp_is_empty!2833)))

(declare-fun condMapEmpty!4487 () Bool)

(declare-fun mapDefault!4487 () ValueCell!1073)

(assert (=> mapNonEmpty!4486 (= condMapEmpty!4487 (= mapRest!4486 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4487)))))

(declare-fun mapRes!4487 () Bool)

(assert (=> mapNonEmpty!4486 (= tp!10930 (and e!82259 mapRes!4487))))

(declare-fun mapNonEmpty!4487 () Bool)

(declare-fun tp!10931 () Bool)

(assert (=> mapNonEmpty!4487 (= mapRes!4487 (and tp!10931 e!82258))))

(declare-fun mapValue!4487 () ValueCell!1073)

(declare-fun mapKey!4487 () (_ BitVec 32))

(declare-fun mapRest!4487 () (Array (_ BitVec 32) ValueCell!1073))

(assert (=> mapNonEmpty!4487 (= mapRest!4486 (store mapRest!4487 mapKey!4487 mapValue!4487))))

(declare-fun mapIsEmpty!4487 () Bool)

(assert (=> mapIsEmpty!4487 mapRes!4487))

(assert (= (and mapNonEmpty!4486 condMapEmpty!4487) mapIsEmpty!4487))

(assert (= (and mapNonEmpty!4486 (not condMapEmpty!4487)) mapNonEmpty!4487))

(assert (= (and mapNonEmpty!4487 ((_ is ValueCellFull!1073) mapValue!4487)) b!125959))

(assert (= (and mapNonEmpty!4486 ((_ is ValueCellFull!1073) mapDefault!4487)) b!125960))

(declare-fun m!146807 () Bool)

(assert (=> mapNonEmpty!4487 m!146807))

(declare-fun b!125961 () Bool)

(declare-fun e!82260 () Bool)

(assert (=> b!125961 (= e!82260 tp_is_empty!2833)))

(declare-fun b!125962 () Bool)

(declare-fun e!82261 () Bool)

(assert (=> b!125962 (= e!82261 tp_is_empty!2833)))

(declare-fun condMapEmpty!4488 () Bool)

(declare-fun mapDefault!4488 () ValueCell!1073)

(assert (=> mapNonEmpty!4485 (= condMapEmpty!4488 (= mapRest!4485 ((as const (Array (_ BitVec 32) ValueCell!1073)) mapDefault!4488)))))

(declare-fun mapRes!4488 () Bool)

(assert (=> mapNonEmpty!4485 (= tp!10929 (and e!82261 mapRes!4488))))

(declare-fun mapNonEmpty!4488 () Bool)

(declare-fun tp!10932 () Bool)

(assert (=> mapNonEmpty!4488 (= mapRes!4488 (and tp!10932 e!82260))))

(declare-fun mapValue!4488 () ValueCell!1073)

(declare-fun mapKey!4488 () (_ BitVec 32))

(declare-fun mapRest!4488 () (Array (_ BitVec 32) ValueCell!1073))

(assert (=> mapNonEmpty!4488 (= mapRest!4485 (store mapRest!4488 mapKey!4488 mapValue!4488))))

(declare-fun mapIsEmpty!4488 () Bool)

(assert (=> mapIsEmpty!4488 mapRes!4488))

(assert (= (and mapNonEmpty!4485 condMapEmpty!4488) mapIsEmpty!4488))

(assert (= (and mapNonEmpty!4485 (not condMapEmpty!4488)) mapNonEmpty!4488))

(assert (= (and mapNonEmpty!4488 ((_ is ValueCellFull!1073) mapValue!4488)) b!125961))

(assert (= (and mapNonEmpty!4485 ((_ is ValueCellFull!1073) mapDefault!4488)) b!125962))

(declare-fun m!146809 () Bool)

(assert (=> mapNonEmpty!4488 m!146809))

(declare-fun b_lambda!5517 () Bool)

(assert (= b_lambda!5489 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5517)))

(declare-fun b_lambda!5519 () Bool)

(assert (= b_lambda!5497 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5519)))

(declare-fun b_lambda!5521 () Bool)

(assert (= b_lambda!5513 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5521)))

(declare-fun b_lambda!5523 () Bool)

(assert (= b_lambda!5503 (or (and b!124442 b_free!2833) (and b!124445 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))))) b_lambda!5523)))

(declare-fun b_lambda!5525 () Bool)

(assert (= b_lambda!5499 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5525)))

(declare-fun b_lambda!5527 () Bool)

(assert (= b_lambda!5505 (or (and b!124442 b_free!2833) (and b!124445 b_free!2835 (= (defaultEntry!2763 newMap!16) (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))))) b_lambda!5527)))

(declare-fun b_lambda!5529 () Bool)

(assert (= b_lambda!5493 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5529)))

(declare-fun b_lambda!5531 () Bool)

(assert (= b_lambda!5491 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5531)))

(declare-fun b_lambda!5533 () Bool)

(assert (= b_lambda!5501 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5533)))

(declare-fun b_lambda!5535 () Bool)

(assert (= b_lambda!5487 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5535)))

(declare-fun b_lambda!5537 () Bool)

(assert (= b_lambda!5507 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5537)))

(declare-fun b_lambda!5539 () Bool)

(assert (= b_lambda!5511 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5539)))

(declare-fun b_lambda!5541 () Bool)

(assert (= b_lambda!5515 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5541)))

(declare-fun b_lambda!5543 () Bool)

(assert (= b_lambda!5509 (or (and b!124442 b_free!2833 (= (defaultEntry!2763 (v!3101 (underlying!432 thiss!992))) (defaultEntry!2763 newMap!16))) (and b!124445 b_free!2835) b_lambda!5543)))

(check-sat (not d!37905) (not bm!13425) (not bm!13469) (not bm!13456) (not d!37991) (not b!125607) (not d!37771) (not b!125619) (not d!37695) (not d!37965) (not b!125239) (not b!125734) (not bm!13432) (not b!125896) (not b!125854) (not b!125317) (not bm!13467) (not b!125159) (not b_lambda!5523) (not d!38017) (not d!37875) (not d!37669) (not b!125475) (not bm!13489) b_and!7733 (not b!125142) (not d!37651) (not bm!13407) (not b!125665) (not b!125830) (not d!37681) (not b!125350) (not b!125364) (not b!125380) (not b_lambda!5539) (not d!37519) (not bm!13462) (not b!125506) (not d!37907) (not b!125816) (not b!125847) (not d!37591) (not b!125589) (not b_lambda!5527) (not b!125743) (not bm!13482) (not d!37721) (not b!125331) (not b!125287) (not b!125334) (not mapNonEmpty!4487) (not d!37835) (not b!125206) (not b_lambda!5495) (not b!125773) (not d!37589) (not d!37653) (not d!37897) (not bm!13454) (not bm!13479) (not d!37661) (not b!125242) (not b!125603) (not d!37595) (not b!125634) (not d!37759) (not d!37525) (not b!125856) (not b!125764) (not bm!13461) (not b!125399) (not d!37769) (not b!125606) (not d!37845) (not b!125823) (not b!125130) (not b!125145) (not b!125637) (not bm!13477) (not d!37783) (not b!125729) (not b!125149) (not d!37869) (not b!125236) (not b!125893) (not d!37871) (not d!37679) (not b!125928) (not b!125447) (not b!125127) (not b!125733) (not b!125201) (not d!37895) (not bm!13488) (not b!125717) (not b!125585) (not d!37827) (not bm!13446) (not b!125899) (not d!37775) (not d!37635) (not b!125677) (not b!125356) (not b!125905) (not b!125319) (not d!37543) (not d!37979) (not d!37815) (not bm!13444) (not b_lambda!5521) (not b!125746) (not d!37749) (not b!125280) (not d!37655) (not b!125499) (not d!37551) (not b_lambda!5535) (not b!125471) (not b!125504) (not b!125421) (not b!125572) (not b!125709) (not bm!13485) (not b!125169) (not b!125790) (not b!125472) (not b!125214) (not b!125828) (not d!37631) (not b!125812) (not d!37903) (not b_lambda!5537) (not d!37717) (not bm!13455) (not b!125412) (not b!125857) (not b!125796) (not bm!13418) (not d!37711) (not b!125143) (not d!37995) (not b!125546) (not d!37877) (not bm!13431) (not bm!13476) (not b!125330) (not b_lambda!5485) (not b!125759) (not b!125213) (not b!125670) (not b!125300) (not b!125371) (not d!37931) (not b!125464) (not b!125557) (not b!125799) (not d!37819) (not d!37971) (not b!125378) (not d!37799) (not d!37575) (not b!125653) (not b!125198) (not b!125221) (not b!125497) (not d!37627) (not d!37603) (not d!37625) (not d!37829) (not b!125712) (not bm!13442) (not b!125445) (not b!125441) (not b!125254) (not b!125719) (not b!125623) (not d!37887) (not b!125735) (not b!125296) (not b!125737) (not d!37621) (not b!125716) (not bm!13423) (not d!37755) (not b!125714) (not b!125763) (not b!125508) (not b!125868) (not b!125449) (not b!125358) (not d!37973) (not b!125792) (not b!125320) (not b!125738) (not b!125403) (not b!125470) (not b!125742) (not b_lambda!5479) (not b!125282) (not d!37923) (not b!125656) (not b!125597) (not d!37677) (not b!125476) (not b!125817) (not b_next!2833) (not bm!13410) (not d!37535) (not b!125125) (not b!125305) (not d!37559) (not b!125822) (not d!37825) (not b!125554) (not b!125168) (not bm!13413) (not d!37657) (not b!125775) (not b!125385) (not d!37725) (not b_lambda!5519) (not b!125869) (not b!125648) (not d!37639) (not b!125252) (not d!37637) (not b!125906) (not b!125433) (not b!125410) (not d!37751) (not b!125851) (not d!37987) (not b_lambda!5529) (not b!125314) (not b!125728) (not b!125415) (not b!125875) (not bm!13438) (not b!125202) (not b!125663) (not b!125424) (not b!125363) (not d!37597) (not d!37789) (not b!125559) (not d!38019) (not bm!13402) (not b!125778) (not b!125136) (not d!37961) (not b!125810) (not b!125657) (not b!125570) (not b_lambda!5543) (not b!125720) (not b!125329) (not b!125801) (not b!125491) (not b!125762) (not b!125451) (not b!125223) (not b!125659) (not b!125392) (not b!125609) (not b!125539) (not b!125299) (not b!125283) (not b!125795) (not d!38011) (not b_lambda!5517) (not d!37739) (not b!125373) (not b!125487) (not b!125772) (not d!37713) (not b!125265) (not d!37565) (not b!125866) (not d!37893) (not d!37647) (not b!125808) (not d!37703) (not b!125310) (not b!125342) (not d!37821) (not b!125654) (not d!37791) (not b!125749) (not b!125661) (not d!37937) (not d!37839) (not b!125935) (not d!37841) (not mapNonEmpty!4488) (not b!125323) (not b!125328) (not bm!13439) (not d!37571) (not d!37781) (not b!125307) (not b!125741) (not d!37553) (not b!125608) (not b!125353) (not bm!13428) (not d!37767) (not d!37993) (not b!125257) (not b!125845) (not b!125348) (not b!125642) (not d!37891) (not b!125900) (not d!37967) (not b!125788) (not d!37949) (not b!125549) (not d!37709) (not b!125294) (not b!125375) (not b!125162) (not bm!13408) (not bm!13468) (not d!37901) (not b_lambda!5525) (not b!125777) (not b!125140) (not b!125753) (not bm!13492) (not b!125474) (not b!125536) (not b!125325) (not d!37733) (not b!125297) (not b!125825) (not b!125776) (not b!125139) (not bm!13421) tp_is_empty!2833 (not bm!13453) (not b!125723) (not d!37939) (not b!125383) (not d!37777) (not b!125370) (not b!125820) (not b!125798) (not bm!13457) (not d!37683) (not b!125416) (not b!125904) (not b!125423) (not d!37857) (not b!125295) (not d!37585) (not b!125312) (not d!37957) (not b!125638) (not b!125215) (not b!125290) (not b!125819) (not b!125462) (not d!37863) (not d!37605) (not b!125668) (not b!125937) (not b!125948) (not b!125309) (not b!125647) (not b!125599) (not b!125592) (not d!37705) (not d!37919) (not bm!13406) (not bm!13481) (not b!125590) (not b!125418) (not d!37833) (not b!125704) (not d!37851) (not b!125157) (not b_lambda!5483) (not d!37633) (not b!125430) (not b!125405) (not b!125957) (not b!125212) (not b!125555) (not d!37573) (not b!125711) (not d!37641) (not b!125156) (not d!37947) (not b!125229) (not b!125355) (not bm!13473) (not b!125477) (not bm!13470) (not d!37537) (not b!125542) (not b!125435) (not bm!13416) (not d!37667) (not b!125680) (not b!125678) (not b!125662) (not b!125244) (not b!125760) (not b!125251) (not b!125303) (not b!125413) (not b!125833) (not b!125826) (not b_lambda!5477) (not b!125286) (not d!37663) (not b!125579) (not b!125588) (not b!125726) (not b!125315) (not d!37977) (not d!37823) (not d!37723) (not d!37881) (not b!125757) (not b!125939) (not b!125291) (not b!125811) (not d!38013) (not b!125338) (not b!125955) (not b!125902) (not b!125645) (not bm!13490) (not d!37811) (not b!125377) (not b!125578) (not b_lambda!5533) (not b!125558) (not b!125386) (not b!125268) (not b!125318) (not d!38003) (not b!125324) (not b!125395) (not b!125604) (not b!125942) (not d!37883) (not b!125849) (not b_lambda!5481) (not b!125864) (not b!125146) (not d!37953) (not d!37555) (not b!125574) (not b!125534) (not d!37873) (not b!125761) (not d!37617) (not d!37731) (not b!125636) (not d!37671) (not bm!13430) (not b!125306) (not b!125641) (not b!125813) (not b!125919) (not d!37741) (not bm!13447) (not d!37693) (not b!125272) (not d!37645) (not d!37879) (not b!125217) (not d!37889) (not d!37643) (not d!37773) (not d!37541) (not b!125224) (not b!125129) (not d!37563) (not b!125261) (not b!125660) (not d!37921) (not d!37619) (not b!125907) (not b_lambda!5531) (not d!37899) (not bm!13451) (not b!125340) (not b!125621) (not d!37649) (not d!37701) (not d!37567) (not b!125195) (not b!125493) (not bm!13475) (not d!37809) (not d!37545) (not b!125901) (not b!125495) (not d!37885) (not b!125768) (not b!125196) (not d!37715) (not b_next!2835) (not b!125725) (not bm!13437) (not d!37583) (not b!125450) (not b!125651) (not d!37623) (not d!37561) (not d!37521) (not bm!13445) (not b!125923) (not d!37865) (not d!37745) (not b!125732) (not b!125739) (not d!37547) (not b!125770) (not b!125917) (not b!125245) (not d!37691) (not b!125204) (not b_lambda!5465) (not d!37969) (not b!125827) (not b!125237) (not bm!13400) (not d!37615) (not b!125393) (not d!37917) (not b!125921) (not b!125341) (not b!125832) (not bm!13404) (not d!37665) (not b!125226) (not b!125895) (not b!125758) (not b!125600) (not b!125931) (not bm!13465) (not b!125945) (not d!37933) (not d!37675) (not b!125843) (not b_lambda!5461) (not b!125275) (not bm!13424) (not d!37803) (not bm!13448) (not b!125724) (not b!125333) (not b!125260) (not bm!13487) (not b!125466) (not d!37737) (not b!125671) (not b_lambda!5541) (not b!125932) (not bm!13392) (not d!37527) (not b!125343) (not b!125947) (not b!125452) (not b!125285) (not d!38001) (not b!125633) (not b!125322) (not b!125930) (not b!125489) (not d!37689) (not b!125216) (not b!125560) (not b!125652) (not b!125765) (not b!125804) (not d!37659) (not b!125863) (not b!125408) (not b!125225) (not d!37959) b_and!7735 (not b!125940) (not b!125501) (not b!125954) (not b!125133) (not bm!13459) (not b!125469) (not b!125288) (not b!125361) (not b!125263) (not b!125872) (not b!125831) (not b!125431) (not d!37859) (not d!37935) (not d!37629) (not d!37855) (not d!37673) (not d!37763))
(check-sat b_and!7733 b_and!7735 (not b_next!2833) (not b_next!2835))
