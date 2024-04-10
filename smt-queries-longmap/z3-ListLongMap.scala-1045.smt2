; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21954 () Bool)

(assert start!21954)

(declare-fun b!224476 () Bool)

(declare-fun b_free!6021 () Bool)

(declare-fun b_next!6021 () Bool)

(assert (=> b!224476 (= b_free!6021 (not b_next!6021))))

(declare-fun tp!21204 () Bool)

(declare-fun b_and!12919 () Bool)

(assert (=> b!224476 (= tp!21204 b_and!12919)))

(declare-fun b!224469 () Bool)

(declare-fun c!37221 () Bool)

(declare-datatypes ((SeekEntryResult!858 0))(
  ( (MissingZero!858 (index!5602 (_ BitVec 32))) (Found!858 (index!5603 (_ BitVec 32))) (Intermediate!858 (undefined!1670 Bool) (index!5604 (_ BitVec 32)) (x!23134 (_ BitVec 32))) (Undefined!858) (MissingVacant!858 (index!5605 (_ BitVec 32))) )
))
(declare-fun lt!113164 () SeekEntryResult!858)

(get-info :version)

(assert (=> b!224469 (= c!37221 ((_ is MissingVacant!858) lt!113164))))

(declare-fun e!145737 () Bool)

(declare-fun e!145739 () Bool)

(assert (=> b!224469 (= e!145737 e!145739)))

(declare-fun b!224470 () Bool)

(declare-fun e!145736 () Bool)

(declare-fun e!145724 () Bool)

(assert (=> b!224470 (= e!145736 e!145724)))

(declare-fun res!110465 () Bool)

(assert (=> b!224470 (=> (not res!110465) (not e!145724))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!224470 (= res!110465 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!224471 () Bool)

(declare-fun res!110452 () Bool)

(declare-fun e!145734 () Bool)

(assert (=> b!224471 (=> (not res!110452) (not e!145734))))

(declare-fun lt!113158 () Bool)

(assert (=> b!224471 (= res!110452 (not lt!113158))))

(declare-fun b!224472 () Bool)

(declare-fun res!110457 () Bool)

(assert (=> b!224472 (=> (not res!110457) (not e!145734))))

(declare-datatypes ((V!7491 0))(
  ( (V!7492 (val!2986 Int)) )
))
(declare-datatypes ((ValueCell!2598 0))(
  ( (ValueCellFull!2598 (v!5006 V!7491)) (EmptyCell!2598) )
))
(declare-datatypes ((array!11009 0))(
  ( (array!11010 (arr!5224 (Array (_ BitVec 32) ValueCell!2598)) (size!5557 (_ BitVec 32))) )
))
(declare-datatypes ((array!11011 0))(
  ( (array!11012 (arr!5225 (Array (_ BitVec 32) (_ BitVec 64))) (size!5558 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3096 0))(
  ( (LongMapFixedSize!3097 (defaultEntry!4207 Int) (mask!10041 (_ BitVec 32)) (extraKeys!3944 (_ BitVec 32)) (zeroValue!4048 V!7491) (minValue!4048 V!7491) (_size!1597 (_ BitVec 32)) (_keys!6261 array!11011) (_values!4190 array!11009) (_vacant!1597 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3096)

(declare-datatypes ((List!3336 0))(
  ( (Nil!3333) (Cons!3332 (h!3980 (_ BitVec 64)) (t!8295 List!3336)) )
))
(declare-fun arrayNoDuplicates!0 (array!11011 (_ BitVec 32) List!3336) Bool)

(assert (=> b!224472 (= res!110457 (arrayNoDuplicates!0 (_keys!6261 thiss!1504) #b00000000000000000000000000000000 Nil!3333))))

(declare-fun b!224473 () Bool)

(declare-fun e!145735 () Bool)

(declare-fun tp_is_empty!5883 () Bool)

(assert (=> b!224473 (= e!145735 tp_is_empty!5883)))

(declare-fun b!224474 () Bool)

(declare-fun e!145723 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1556 (List!3336 (_ BitVec 64)) Bool)

(assert (=> b!224474 (= e!145723 (contains!1556 Nil!3333 key!932))))

(declare-fun b!224475 () Bool)

(declare-fun res!110455 () Bool)

(assert (=> b!224475 (= res!110455 (= (select (arr!5225 (_keys!6261 thiss!1504)) (index!5605 lt!113164)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!145727 () Bool)

(assert (=> b!224475 (=> (not res!110455) (not e!145727))))

(declare-fun e!145733 () Bool)

(declare-fun e!145732 () Bool)

(declare-fun array_inv!3457 (array!11011) Bool)

(declare-fun array_inv!3458 (array!11009) Bool)

(assert (=> b!224476 (= e!145733 (and tp!21204 tp_is_empty!5883 (array_inv!3457 (_keys!6261 thiss!1504)) (array_inv!3458 (_values!4190 thiss!1504)) e!145732))))

(declare-fun b!224477 () Bool)

(assert (=> b!224477 (= e!145739 ((_ is Undefined!858) lt!113164))))

(declare-fun b!224478 () Bool)

(declare-datatypes ((Unit!6750 0))(
  ( (Unit!6751) )
))
(declare-fun e!145725 () Unit!6750)

(declare-fun Unit!6752 () Unit!6750)

(assert (=> b!224478 (= e!145725 Unit!6752)))

(declare-fun lt!113159 () Unit!6750)

(declare-fun lemmaArrayContainsKeyThenInListMap!78 (array!11011 array!11009 (_ BitVec 32) (_ BitVec 32) V!7491 V!7491 (_ BitVec 64) (_ BitVec 32) Int) Unit!6750)

(assert (=> b!224478 (= lt!113159 (lemmaArrayContainsKeyThenInListMap!78 (_keys!6261 thiss!1504) (_values!4190 thiss!1504) (mask!10041 thiss!1504) (extraKeys!3944 thiss!1504) (zeroValue!4048 thiss!1504) (minValue!4048 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4207 thiss!1504)))))

(assert (=> b!224478 false))

(declare-fun b!224480 () Bool)

(declare-fun res!110464 () Bool)

(assert (=> b!224480 (=> (not res!110464) (not e!145734))))

(assert (=> b!224480 (= res!110464 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5558 (_keys!6261 thiss!1504)))))))

(declare-fun b!224481 () Bool)

(declare-fun res!110454 () Bool)

(assert (=> b!224481 (=> (not res!110454) (not e!145734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!224481 (= res!110454 (validKeyInArray!0 key!932))))

(declare-fun mapNonEmpty!9994 () Bool)

(declare-fun mapRes!9994 () Bool)

(declare-fun tp!21205 () Bool)

(assert (=> mapNonEmpty!9994 (= mapRes!9994 (and tp!21205 e!145735))))

(declare-fun mapKey!9994 () (_ BitVec 32))

(declare-fun mapRest!9994 () (Array (_ BitVec 32) ValueCell!2598))

(declare-fun mapValue!9994 () ValueCell!2598)

(assert (=> mapNonEmpty!9994 (= (arr!5224 (_values!4190 thiss!1504)) (store mapRest!9994 mapKey!9994 mapValue!9994))))

(declare-fun b!224482 () Bool)

(declare-fun e!145722 () Bool)

(declare-fun call!20897 () Bool)

(assert (=> b!224482 (= e!145722 (not call!20897))))

(declare-fun b!224483 () Bool)

(declare-fun e!145731 () Bool)

(assert (=> b!224483 (= e!145731 e!145734)))

(declare-fun res!110468 () Bool)

(assert (=> b!224483 (=> (not res!110468) (not e!145734))))

(assert (=> b!224483 (= res!110468 (and (bvslt (size!5558 (_keys!6261 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5558 (_keys!6261 thiss!1504)))))))

(declare-fun lt!113161 () Unit!6750)

(assert (=> b!224483 (= lt!113161 e!145725)))

(declare-fun c!37224 () Bool)

(assert (=> b!224483 (= c!37224 lt!113158)))

(declare-fun arrayContainsKey!0 (array!11011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!224483 (= lt!113158 (arrayContainsKey!0 (_keys!6261 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!224484 () Bool)

(declare-fun e!145730 () Bool)

(assert (=> b!224484 (= e!145730 tp_is_empty!5883)))

(declare-fun b!224485 () Bool)

(declare-fun res!110461 () Bool)

(assert (=> b!224485 (=> (not res!110461) (not e!145722))))

(declare-fun call!20898 () Bool)

(assert (=> b!224485 (= res!110461 call!20898)))

(assert (=> b!224485 (= e!145737 e!145722)))

(declare-fun b!224486 () Bool)

(assert (=> b!224486 (= e!145734 false)))

(declare-fun lt!113160 () Bool)

(assert (=> b!224486 (= lt!113160 (contains!1556 Nil!3333 key!932))))

(declare-fun c!37223 () Bool)

(declare-fun bm!20894 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20894 (= call!20898 (inRange!0 (ite c!37223 (index!5602 lt!113164) (index!5605 lt!113164)) (mask!10041 thiss!1504)))))

(declare-fun b!224487 () Bool)

(declare-fun e!145738 () Bool)

(declare-fun e!145726 () Bool)

(assert (=> b!224487 (= e!145738 e!145726)))

(declare-fun res!110467 () Bool)

(assert (=> b!224487 (=> (not res!110467) (not e!145726))))

(assert (=> b!224487 (= res!110467 (or (= lt!113164 (MissingZero!858 index!297)) (= lt!113164 (MissingVacant!858 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11011 (_ BitVec 32)) SeekEntryResult!858)

(assert (=> b!224487 (= lt!113164 (seekEntryOrOpen!0 key!932 (_keys!6261 thiss!1504) (mask!10041 thiss!1504)))))

(declare-fun b!224488 () Bool)

(declare-fun e!145728 () Unit!6750)

(declare-fun lt!113165 () Unit!6750)

(assert (=> b!224488 (= e!145728 lt!113165)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!250 (array!11011 array!11009 (_ BitVec 32) (_ BitVec 32) V!7491 V!7491 (_ BitVec 64) Int) Unit!6750)

(assert (=> b!224488 (= lt!113165 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!250 (_keys!6261 thiss!1504) (_values!4190 thiss!1504) (mask!10041 thiss!1504) (extraKeys!3944 thiss!1504) (zeroValue!4048 thiss!1504) (minValue!4048 thiss!1504) key!932 (defaultEntry!4207 thiss!1504)))))

(assert (=> b!224488 (= c!37223 ((_ is MissingZero!858) lt!113164))))

(assert (=> b!224488 e!145737))

(declare-fun b!224489 () Bool)

(assert (=> b!224489 (= e!145732 (and e!145730 mapRes!9994))))

(declare-fun condMapEmpty!9994 () Bool)

(declare-fun mapDefault!9994 () ValueCell!2598)

(assert (=> b!224489 (= condMapEmpty!9994 (= (arr!5224 (_values!4190 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2598)) mapDefault!9994)))))

(declare-fun b!224490 () Bool)

(declare-fun res!110453 () Bool)

(assert (=> b!224490 (=> (not res!110453) (not e!145734))))

(declare-fun noDuplicate!85 (List!3336) Bool)

(assert (=> b!224490 (= res!110453 (noDuplicate!85 Nil!3333))))

(declare-fun b!224491 () Bool)

(declare-fun res!110459 () Bool)

(assert (=> b!224491 (=> (not res!110459) (not e!145722))))

(assert (=> b!224491 (= res!110459 (= (select (arr!5225 (_keys!6261 thiss!1504)) (index!5602 lt!113164)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!224492 () Bool)

(declare-fun res!110470 () Bool)

(assert (=> b!224492 (=> (not res!110470) (not e!145738))))

(assert (=> b!224492 (= res!110470 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20895 () Bool)

(assert (=> bm!20895 (= call!20897 (arrayContainsKey!0 (_keys!6261 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!110458 () Bool)

(assert (=> start!21954 (=> (not res!110458) (not e!145738))))

(declare-fun valid!1248 (LongMapFixedSize!3096) Bool)

(assert (=> start!21954 (= res!110458 (valid!1248 thiss!1504))))

(assert (=> start!21954 e!145738))

(assert (=> start!21954 e!145733))

(assert (=> start!21954 true))

(declare-fun b!224479 () Bool)

(declare-fun Unit!6753 () Unit!6750)

(assert (=> b!224479 (= e!145728 Unit!6753)))

(declare-fun lt!113163 () Unit!6750)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!239 (array!11011 array!11009 (_ BitVec 32) (_ BitVec 32) V!7491 V!7491 (_ BitVec 64) Int) Unit!6750)

(assert (=> b!224479 (= lt!113163 (lemmaInListMapThenSeekEntryOrOpenFindsIt!239 (_keys!6261 thiss!1504) (_values!4190 thiss!1504) (mask!10041 thiss!1504) (extraKeys!3944 thiss!1504) (zeroValue!4048 thiss!1504) (minValue!4048 thiss!1504) key!932 (defaultEntry!4207 thiss!1504)))))

(assert (=> b!224479 false))

(declare-fun mapIsEmpty!9994 () Bool)

(assert (=> mapIsEmpty!9994 mapRes!9994))

(declare-fun b!224493 () Bool)

(assert (=> b!224493 (= e!145724 (not (contains!1556 Nil!3333 key!932)))))

(declare-fun b!224494 () Bool)

(assert (=> b!224494 (= e!145739 e!145727)))

(declare-fun res!110466 () Bool)

(assert (=> b!224494 (= res!110466 call!20898)))

(assert (=> b!224494 (=> (not res!110466) (not e!145727))))

(declare-fun b!224495 () Bool)

(declare-fun res!110451 () Bool)

(assert (=> b!224495 (=> (not res!110451) (not e!145734))))

(assert (=> b!224495 (= res!110451 (not (contains!1556 Nil!3333 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224496 () Bool)

(declare-fun Unit!6754 () Unit!6750)

(assert (=> b!224496 (= e!145725 Unit!6754)))

(declare-fun b!224497 () Bool)

(declare-fun res!110463 () Bool)

(assert (=> b!224497 (=> (not res!110463) (not e!145734))))

(assert (=> b!224497 (= res!110463 (not (contains!1556 Nil!3333 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!224498 () Bool)

(assert (=> b!224498 (= e!145727 (not call!20897))))

(declare-fun b!224499 () Bool)

(declare-fun res!110460 () Bool)

(assert (=> b!224499 (=> (not res!110460) (not e!145734))))

(assert (=> b!224499 (= res!110460 e!145736)))

(declare-fun res!110456 () Bool)

(assert (=> b!224499 (=> res!110456 e!145736)))

(assert (=> b!224499 (= res!110456 e!145723)))

(declare-fun res!110469 () Bool)

(assert (=> b!224499 (=> (not res!110469) (not e!145723))))

(assert (=> b!224499 (= res!110469 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!224500 () Bool)

(assert (=> b!224500 (= e!145726 e!145731)))

(declare-fun res!110462 () Bool)

(assert (=> b!224500 (=> (not res!110462) (not e!145731))))

(assert (=> b!224500 (= res!110462 (inRange!0 index!297 (mask!10041 thiss!1504)))))

(declare-fun lt!113162 () Unit!6750)

(assert (=> b!224500 (= lt!113162 e!145728)))

(declare-fun c!37222 () Bool)

(declare-datatypes ((tuple2!4424 0))(
  ( (tuple2!4425 (_1!2223 (_ BitVec 64)) (_2!2223 V!7491)) )
))
(declare-datatypes ((List!3337 0))(
  ( (Nil!3334) (Cons!3333 (h!3981 tuple2!4424) (t!8296 List!3337)) )
))
(declare-datatypes ((ListLongMap!3337 0))(
  ( (ListLongMap!3338 (toList!1684 List!3337)) )
))
(declare-fun contains!1557 (ListLongMap!3337 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1212 (array!11011 array!11009 (_ BitVec 32) (_ BitVec 32) V!7491 V!7491 (_ BitVec 32) Int) ListLongMap!3337)

(assert (=> b!224500 (= c!37222 (contains!1557 (getCurrentListMap!1212 (_keys!6261 thiss!1504) (_values!4190 thiss!1504) (mask!10041 thiss!1504) (extraKeys!3944 thiss!1504) (zeroValue!4048 thiss!1504) (minValue!4048 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4207 thiss!1504)) key!932))))

(assert (= (and start!21954 res!110458) b!224492))

(assert (= (and b!224492 res!110470) b!224487))

(assert (= (and b!224487 res!110467) b!224500))

(assert (= (and b!224500 c!37222) b!224479))

(assert (= (and b!224500 (not c!37222)) b!224488))

(assert (= (and b!224488 c!37223) b!224485))

(assert (= (and b!224488 (not c!37223)) b!224469))

(assert (= (and b!224485 res!110461) b!224491))

(assert (= (and b!224491 res!110459) b!224482))

(assert (= (and b!224469 c!37221) b!224494))

(assert (= (and b!224469 (not c!37221)) b!224477))

(assert (= (and b!224494 res!110466) b!224475))

(assert (= (and b!224475 res!110455) b!224498))

(assert (= (or b!224485 b!224494) bm!20894))

(assert (= (or b!224482 b!224498) bm!20895))

(assert (= (and b!224500 res!110462) b!224483))

(assert (= (and b!224483 c!37224) b!224478))

(assert (= (and b!224483 (not c!37224)) b!224496))

(assert (= (and b!224483 res!110468) b!224490))

(assert (= (and b!224490 res!110453) b!224497))

(assert (= (and b!224497 res!110463) b!224495))

(assert (= (and b!224495 res!110451) b!224499))

(assert (= (and b!224499 res!110469) b!224474))

(assert (= (and b!224499 (not res!110456)) b!224470))

(assert (= (and b!224470 res!110465) b!224493))

(assert (= (and b!224499 res!110460) b!224472))

(assert (= (and b!224472 res!110457) b!224480))

(assert (= (and b!224480 res!110464) b!224481))

(assert (= (and b!224481 res!110454) b!224471))

(assert (= (and b!224471 res!110452) b!224486))

(assert (= (and b!224489 condMapEmpty!9994) mapIsEmpty!9994))

(assert (= (and b!224489 (not condMapEmpty!9994)) mapNonEmpty!9994))

(assert (= (and mapNonEmpty!9994 ((_ is ValueCellFull!2598) mapValue!9994)) b!224473))

(assert (= (and b!224489 ((_ is ValueCellFull!2598) mapDefault!9994)) b!224484))

(assert (= b!224476 b!224489))

(assert (= start!21954 b!224476))

(declare-fun m!247457 () Bool)

(assert (=> b!224487 m!247457))

(declare-fun m!247459 () Bool)

(assert (=> mapNonEmpty!9994 m!247459))

(declare-fun m!247461 () Bool)

(assert (=> b!224481 m!247461))

(declare-fun m!247463 () Bool)

(assert (=> bm!20894 m!247463))

(declare-fun m!247465 () Bool)

(assert (=> b!224479 m!247465))

(declare-fun m!247467 () Bool)

(assert (=> b!224472 m!247467))

(declare-fun m!247469 () Bool)

(assert (=> b!224488 m!247469))

(declare-fun m!247471 () Bool)

(assert (=> b!224476 m!247471))

(declare-fun m!247473 () Bool)

(assert (=> b!224476 m!247473))

(declare-fun m!247475 () Bool)

(assert (=> b!224491 m!247475))

(declare-fun m!247477 () Bool)

(assert (=> b!224486 m!247477))

(declare-fun m!247479 () Bool)

(assert (=> b!224483 m!247479))

(declare-fun m!247481 () Bool)

(assert (=> b!224478 m!247481))

(declare-fun m!247483 () Bool)

(assert (=> b!224495 m!247483))

(declare-fun m!247485 () Bool)

(assert (=> start!21954 m!247485))

(assert (=> b!224493 m!247477))

(assert (=> bm!20895 m!247479))

(declare-fun m!247487 () Bool)

(assert (=> b!224490 m!247487))

(declare-fun m!247489 () Bool)

(assert (=> b!224497 m!247489))

(declare-fun m!247491 () Bool)

(assert (=> b!224475 m!247491))

(assert (=> b!224474 m!247477))

(declare-fun m!247493 () Bool)

(assert (=> b!224500 m!247493))

(declare-fun m!247495 () Bool)

(assert (=> b!224500 m!247495))

(assert (=> b!224500 m!247495))

(declare-fun m!247497 () Bool)

(assert (=> b!224500 m!247497))

(check-sat (not bm!20895) (not b!224497) (not b!224483) (not b!224476) (not b!224479) (not b!224472) (not b!224474) (not b!224487) tp_is_empty!5883 (not mapNonEmpty!9994) (not b!224495) (not b!224486) (not b_next!6021) (not b!224478) (not b!224500) (not bm!20894) (not b!224488) (not b!224490) (not b!224481) (not b!224493) b_and!12919 (not start!21954))
(check-sat b_and!12919 (not b_next!6021))
