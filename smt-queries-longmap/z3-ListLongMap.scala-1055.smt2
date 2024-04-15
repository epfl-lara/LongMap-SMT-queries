; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22016 () Bool)

(assert start!22016)

(declare-fun b!226480 () Bool)

(declare-fun b_free!6079 () Bool)

(declare-fun b_next!6079 () Bool)

(assert (=> b!226480 (= b_free!6079 (not b_next!6079))))

(declare-fun tp!21379 () Bool)

(declare-fun b_and!12951 () Bool)

(assert (=> b!226480 (= tp!21379 b_and!12951)))

(declare-fun tp_is_empty!5941 () Bool)

(declare-fun e!146937 () Bool)

(declare-datatypes ((V!7569 0))(
  ( (V!7570 (val!3015 Int)) )
))
(declare-datatypes ((ValueCell!2627 0))(
  ( (ValueCellFull!2627 (v!5029 V!7569)) (EmptyCell!2627) )
))
(declare-datatypes ((array!11117 0))(
  ( (array!11118 (arr!5277 (Array (_ BitVec 32) ValueCell!2627)) (size!5611 (_ BitVec 32))) )
))
(declare-datatypes ((array!11119 0))(
  ( (array!11120 (arr!5278 (Array (_ BitVec 32) (_ BitVec 64))) (size!5612 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3154 0))(
  ( (LongMapFixedSize!3155 (defaultEntry!4236 Int) (mask!10089 (_ BitVec 32)) (extraKeys!3973 (_ BitVec 32)) (zeroValue!4077 V!7569) (minValue!4077 V!7569) (_size!1626 (_ BitVec 32)) (_keys!6289 array!11119) (_values!4219 array!11117) (_vacant!1626 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3154)

(declare-fun e!146929 () Bool)

(declare-fun array_inv!3481 (array!11119) Bool)

(declare-fun array_inv!3482 (array!11117) Bool)

(assert (=> b!226480 (= e!146929 (and tp!21379 tp_is_empty!5941 (array_inv!3481 (_keys!6289 thiss!1504)) (array_inv!3482 (_values!4219 thiss!1504)) e!146937))))

(declare-fun b!226481 () Bool)

(declare-fun res!111478 () Bool)

(declare-fun e!146932 () Bool)

(assert (=> b!226481 (=> (not res!111478) (not e!146932))))

(declare-datatypes ((SeekEntryResult!883 0))(
  ( (MissingZero!883 (index!5702 (_ BitVec 32))) (Found!883 (index!5703 (_ BitVec 32))) (Intermediate!883 (undefined!1695 Bool) (index!5704 (_ BitVec 32)) (x!23238 (_ BitVec 32))) (Undefined!883) (MissingVacant!883 (index!5705 (_ BitVec 32))) )
))
(declare-fun lt!113896 () SeekEntryResult!883)

(assert (=> b!226481 (= res!111478 (= (select (arr!5278 (_keys!6289 thiss!1504)) (index!5702 lt!113896)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226482 () Bool)

(declare-fun e!146938 () Bool)

(assert (=> b!226482 (= e!146938 tp_is_empty!5941)))

(declare-fun res!111470 () Bool)

(declare-fun e!146943 () Bool)

(assert (=> start!22016 (=> (not res!111470) (not e!146943))))

(declare-fun valid!1278 (LongMapFixedSize!3154) Bool)

(assert (=> start!22016 (= res!111470 (valid!1278 thiss!1504))))

(assert (=> start!22016 e!146943))

(assert (=> start!22016 e!146929))

(assert (=> start!22016 true))

(declare-fun mapIsEmpty!10081 () Bool)

(declare-fun mapRes!10081 () Bool)

(assert (=> mapIsEmpty!10081 mapRes!10081))

(declare-fun b!226483 () Bool)

(declare-fun call!21047 () Bool)

(assert (=> b!226483 (= e!146932 (not call!21047))))

(declare-fun b!226484 () Bool)

(declare-fun res!111479 () Bool)

(declare-fun e!146931 () Bool)

(assert (=> b!226484 (=> res!111479 e!146931)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226484 (= res!111479 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226485 () Bool)

(declare-fun e!146942 () Bool)

(declare-fun e!146941 () Bool)

(assert (=> b!226485 (= e!146942 e!146941)))

(declare-fun res!111472 () Bool)

(assert (=> b!226485 (=> (not res!111472) (not e!146941))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226485 (= res!111472 (inRange!0 index!297 (mask!10089 thiss!1504)))))

(declare-datatypes ((Unit!6808 0))(
  ( (Unit!6809) )
))
(declare-fun lt!113891 () Unit!6808)

(declare-fun e!146940 () Unit!6808)

(assert (=> b!226485 (= lt!113891 e!146940)))

(declare-fun c!37545 () Bool)

(declare-datatypes ((tuple2!4432 0))(
  ( (tuple2!4433 (_1!2227 (_ BitVec 64)) (_2!2227 V!7569)) )
))
(declare-datatypes ((List!3362 0))(
  ( (Nil!3359) (Cons!3358 (h!4006 tuple2!4432) (t!8312 List!3362)) )
))
(declare-datatypes ((ListLongMap!3335 0))(
  ( (ListLongMap!3336 (toList!1683 List!3362)) )
))
(declare-fun contains!1558 (ListLongMap!3335 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1192 (array!11119 array!11117 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 32) Int) ListLongMap!3335)

(assert (=> b!226485 (= c!37545 (contains!1558 (getCurrentListMap!1192 (_keys!6289 thiss!1504) (_values!4219 thiss!1504) (mask!10089 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4236 thiss!1504)) key!932))))

(declare-fun b!226486 () Bool)

(declare-fun e!146930 () Bool)

(assert (=> b!226486 (= e!146930 tp_is_empty!5941)))

(declare-fun b!226487 () Bool)

(declare-fun lt!113887 () Unit!6808)

(assert (=> b!226487 (= e!146940 lt!113887)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!250 (array!11119 array!11117 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 64) Int) Unit!6808)

(assert (=> b!226487 (= lt!113887 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!250 (_keys!6289 thiss!1504) (_values!4219 thiss!1504) (mask!10089 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) key!932 (defaultEntry!4236 thiss!1504)))))

(declare-fun c!37544 () Bool)

(get-info :version)

(assert (=> b!226487 (= c!37544 ((_ is MissingZero!883) lt!113896))))

(declare-fun e!146936 () Bool)

(assert (=> b!226487 e!146936))

(declare-fun b!226488 () Bool)

(declare-fun c!37546 () Bool)

(assert (=> b!226488 (= c!37546 ((_ is MissingVacant!883) lt!113896))))

(declare-fun e!146934 () Bool)

(assert (=> b!226488 (= e!146936 e!146934)))

(declare-fun b!226489 () Bool)

(declare-fun e!146939 () Bool)

(assert (=> b!226489 (= e!146939 (not call!21047))))

(declare-fun b!226490 () Bool)

(assert (=> b!226490 (= e!146934 ((_ is Undefined!883) lt!113896))))

(declare-fun mapNonEmpty!10081 () Bool)

(declare-fun tp!21378 () Bool)

(assert (=> mapNonEmpty!10081 (= mapRes!10081 (and tp!21378 e!146938))))

(declare-fun mapRest!10081 () (Array (_ BitVec 32) ValueCell!2627))

(declare-fun mapKey!10081 () (_ BitVec 32))

(declare-fun mapValue!10081 () ValueCell!2627)

(assert (=> mapNonEmpty!10081 (= (arr!5277 (_values!4219 thiss!1504)) (store mapRest!10081 mapKey!10081 mapValue!10081))))

(declare-fun bm!21044 () Bool)

(declare-fun call!21048 () Bool)

(assert (=> bm!21044 (= call!21048 (inRange!0 (ite c!37544 (index!5702 lt!113896) (index!5705 lt!113896)) (mask!10089 thiss!1504)))))

(declare-fun bm!21045 () Bool)

(declare-fun arrayContainsKey!0 (array!11119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21045 (= call!21047 (arrayContainsKey!0 (_keys!6289 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226491 () Bool)

(assert (=> b!226491 (= e!146943 e!146942)))

(declare-fun res!111471 () Bool)

(assert (=> b!226491 (=> (not res!111471) (not e!146942))))

(assert (=> b!226491 (= res!111471 (or (= lt!113896 (MissingZero!883 index!297)) (= lt!113896 (MissingVacant!883 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11119 (_ BitVec 32)) SeekEntryResult!883)

(assert (=> b!226491 (= lt!113896 (seekEntryOrOpen!0 key!932 (_keys!6289 thiss!1504) (mask!10089 thiss!1504)))))

(declare-fun b!226492 () Bool)

(declare-fun Unit!6810 () Unit!6808)

(assert (=> b!226492 (= e!146940 Unit!6810)))

(declare-fun lt!113889 () Unit!6808)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!254 (array!11119 array!11117 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 64) Int) Unit!6808)

(assert (=> b!226492 (= lt!113889 (lemmaInListMapThenSeekEntryOrOpenFindsIt!254 (_keys!6289 thiss!1504) (_values!4219 thiss!1504) (mask!10089 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) key!932 (defaultEntry!4236 thiss!1504)))))

(assert (=> b!226492 false))

(declare-fun b!226493 () Bool)

(assert (=> b!226493 (= e!146941 (not e!146931))))

(declare-fun res!111476 () Bool)

(assert (=> b!226493 (=> res!111476 e!146931)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226493 (= res!111476 (not (validMask!0 (mask!10089 thiss!1504))))))

(declare-fun lt!113888 () array!11119)

(declare-fun arrayCountValidKeys!0 (array!11119 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226493 (= (arrayCountValidKeys!0 lt!113888 #b00000000000000000000000000000000 (size!5612 (_keys!6289 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6289 thiss!1504) #b00000000000000000000000000000000 (size!5612 (_keys!6289 thiss!1504)))))))

(declare-fun lt!113895 () Unit!6808)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11119 (_ BitVec 32) (_ BitVec 64)) Unit!6808)

(assert (=> b!226493 (= lt!113895 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6289 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3363 0))(
  ( (Nil!3360) (Cons!3359 (h!4007 (_ BitVec 64)) (t!8313 List!3363)) )
))
(declare-fun arrayNoDuplicates!0 (array!11119 (_ BitVec 32) List!3363) Bool)

(assert (=> b!226493 (arrayNoDuplicates!0 lt!113888 #b00000000000000000000000000000000 Nil!3360)))

(assert (=> b!226493 (= lt!113888 (array!11120 (store (arr!5278 (_keys!6289 thiss!1504)) index!297 key!932) (size!5612 (_keys!6289 thiss!1504))))))

(declare-fun lt!113893 () Unit!6808)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3363) Unit!6808)

(assert (=> b!226493 (= lt!113893 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6289 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3360))))

(declare-fun lt!113886 () Unit!6808)

(declare-fun e!146933 () Unit!6808)

(assert (=> b!226493 (= lt!113886 e!146933)))

(declare-fun c!37543 () Bool)

(declare-fun lt!113890 () Bool)

(assert (=> b!226493 (= c!37543 lt!113890)))

(assert (=> b!226493 (= lt!113890 (arrayContainsKey!0 (_keys!6289 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226494 () Bool)

(declare-fun res!111475 () Bool)

(assert (=> b!226494 (= res!111475 (= (select (arr!5278 (_keys!6289 thiss!1504)) (index!5705 lt!113896)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226494 (=> (not res!111475) (not e!146939))))

(declare-fun b!226495 () Bool)

(declare-fun res!111477 () Bool)

(assert (=> b!226495 (=> res!111477 e!146931)))

(assert (=> b!226495 (= res!111477 (or (not (= (size!5612 (_keys!6289 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10089 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5612 (_keys!6289 thiss!1504)))))))

(declare-fun b!226496 () Bool)

(assert (=> b!226496 (= e!146934 e!146939)))

(declare-fun res!111474 () Bool)

(assert (=> b!226496 (= res!111474 call!21048)))

(assert (=> b!226496 (=> (not res!111474) (not e!146939))))

(declare-fun b!226497 () Bool)

(assert (=> b!226497 (= e!146931 true)))

(declare-fun lt!113892 () Bool)

(assert (=> b!226497 (= lt!113892 (arrayNoDuplicates!0 (_keys!6289 thiss!1504) #b00000000000000000000000000000000 Nil!3360))))

(declare-fun b!226498 () Bool)

(assert (=> b!226498 (= e!146937 (and e!146930 mapRes!10081))))

(declare-fun condMapEmpty!10081 () Bool)

(declare-fun mapDefault!10081 () ValueCell!2627)

(assert (=> b!226498 (= condMapEmpty!10081 (= (arr!5277 (_values!4219 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2627)) mapDefault!10081)))))

(declare-fun b!226499 () Bool)

(declare-fun res!111481 () Bool)

(assert (=> b!226499 (=> (not res!111481) (not e!146932))))

(assert (=> b!226499 (= res!111481 call!21048)))

(assert (=> b!226499 (= e!146936 e!146932)))

(declare-fun b!226500 () Bool)

(declare-fun res!111473 () Bool)

(assert (=> b!226500 (=> res!111473 e!146931)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11119 (_ BitVec 32)) Bool)

(assert (=> b!226500 (= res!111473 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6289 thiss!1504) (mask!10089 thiss!1504))))))

(declare-fun b!226501 () Bool)

(declare-fun Unit!6811 () Unit!6808)

(assert (=> b!226501 (= e!146933 Unit!6811)))

(declare-fun lt!113894 () Unit!6808)

(declare-fun lemmaArrayContainsKeyThenInListMap!93 (array!11119 array!11117 (_ BitVec 32) (_ BitVec 32) V!7569 V!7569 (_ BitVec 64) (_ BitVec 32) Int) Unit!6808)

(assert (=> b!226501 (= lt!113894 (lemmaArrayContainsKeyThenInListMap!93 (_keys!6289 thiss!1504) (_values!4219 thiss!1504) (mask!10089 thiss!1504) (extraKeys!3973 thiss!1504) (zeroValue!4077 thiss!1504) (minValue!4077 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4236 thiss!1504)))))

(assert (=> b!226501 false))

(declare-fun b!226502 () Bool)

(declare-fun Unit!6812 () Unit!6808)

(assert (=> b!226502 (= e!146933 Unit!6812)))

(declare-fun b!226503 () Bool)

(declare-fun res!111482 () Bool)

(assert (=> b!226503 (=> res!111482 e!146931)))

(assert (=> b!226503 (= res!111482 lt!113890)))

(declare-fun b!226504 () Bool)

(declare-fun res!111480 () Bool)

(assert (=> b!226504 (=> (not res!111480) (not e!146943))))

(assert (=> b!226504 (= res!111480 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22016 res!111470) b!226504))

(assert (= (and b!226504 res!111480) b!226491))

(assert (= (and b!226491 res!111471) b!226485))

(assert (= (and b!226485 c!37545) b!226492))

(assert (= (and b!226485 (not c!37545)) b!226487))

(assert (= (and b!226487 c!37544) b!226499))

(assert (= (and b!226487 (not c!37544)) b!226488))

(assert (= (and b!226499 res!111481) b!226481))

(assert (= (and b!226481 res!111478) b!226483))

(assert (= (and b!226488 c!37546) b!226496))

(assert (= (and b!226488 (not c!37546)) b!226490))

(assert (= (and b!226496 res!111474) b!226494))

(assert (= (and b!226494 res!111475) b!226489))

(assert (= (or b!226499 b!226496) bm!21044))

(assert (= (or b!226483 b!226489) bm!21045))

(assert (= (and b!226485 res!111472) b!226493))

(assert (= (and b!226493 c!37543) b!226501))

(assert (= (and b!226493 (not c!37543)) b!226502))

(assert (= (and b!226493 (not res!111476)) b!226495))

(assert (= (and b!226495 (not res!111477)) b!226484))

(assert (= (and b!226484 (not res!111479)) b!226503))

(assert (= (and b!226503 (not res!111482)) b!226500))

(assert (= (and b!226500 (not res!111473)) b!226497))

(assert (= (and b!226498 condMapEmpty!10081) mapIsEmpty!10081))

(assert (= (and b!226498 (not condMapEmpty!10081)) mapNonEmpty!10081))

(assert (= (and mapNonEmpty!10081 ((_ is ValueCellFull!2627) mapValue!10081)) b!226482))

(assert (= (and b!226498 ((_ is ValueCellFull!2627) mapDefault!10081)) b!226486))

(assert (= b!226480 b!226498))

(assert (= start!22016 b!226480))

(declare-fun m!248233 () Bool)

(assert (=> b!226487 m!248233))

(declare-fun m!248235 () Bool)

(assert (=> b!226484 m!248235))

(declare-fun m!248237 () Bool)

(assert (=> b!226497 m!248237))

(declare-fun m!248239 () Bool)

(assert (=> start!22016 m!248239))

(declare-fun m!248241 () Bool)

(assert (=> b!226493 m!248241))

(declare-fun m!248243 () Bool)

(assert (=> b!226493 m!248243))

(declare-fun m!248245 () Bool)

(assert (=> b!226493 m!248245))

(declare-fun m!248247 () Bool)

(assert (=> b!226493 m!248247))

(declare-fun m!248249 () Bool)

(assert (=> b!226493 m!248249))

(declare-fun m!248251 () Bool)

(assert (=> b!226493 m!248251))

(declare-fun m!248253 () Bool)

(assert (=> b!226493 m!248253))

(declare-fun m!248255 () Bool)

(assert (=> b!226493 m!248255))

(declare-fun m!248257 () Bool)

(assert (=> b!226481 m!248257))

(declare-fun m!248259 () Bool)

(assert (=> b!226492 m!248259))

(declare-fun m!248261 () Bool)

(assert (=> b!226485 m!248261))

(declare-fun m!248263 () Bool)

(assert (=> b!226485 m!248263))

(assert (=> b!226485 m!248263))

(declare-fun m!248265 () Bool)

(assert (=> b!226485 m!248265))

(declare-fun m!248267 () Bool)

(assert (=> bm!21044 m!248267))

(declare-fun m!248269 () Bool)

(assert (=> b!226491 m!248269))

(declare-fun m!248271 () Bool)

(assert (=> b!226501 m!248271))

(declare-fun m!248273 () Bool)

(assert (=> mapNonEmpty!10081 m!248273))

(declare-fun m!248275 () Bool)

(assert (=> b!226480 m!248275))

(declare-fun m!248277 () Bool)

(assert (=> b!226480 m!248277))

(declare-fun m!248279 () Bool)

(assert (=> b!226494 m!248279))

(declare-fun m!248281 () Bool)

(assert (=> b!226500 m!248281))

(assert (=> bm!21045 m!248243))

(check-sat tp_is_empty!5941 (not b!226484) (not b!226493) (not b!226487) (not bm!21045) (not b!226501) (not b_next!6079) (not start!22016) (not bm!21044) (not b!226492) (not b!226491) (not b!226497) (not mapNonEmpty!10081) b_and!12951 (not b!226485) (not b!226500) (not b!226480))
(check-sat b_and!12951 (not b_next!6079))
