; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23370 () Bool)

(assert start!23370)

(declare-fun b!245523 () Bool)

(declare-fun b_free!6559 () Bool)

(declare-fun b_next!6559 () Bool)

(assert (=> b!245523 (= b_free!6559 (not b_next!6559))))

(declare-fun tp!22911 () Bool)

(declare-fun b_and!13523 () Bool)

(assert (=> b!245523 (= tp!22911 b_and!13523)))

(declare-fun b!245505 () Bool)

(declare-datatypes ((Unit!7576 0))(
  ( (Unit!7577) )
))
(declare-fun e!159271 () Unit!7576)

(declare-fun Unit!7578 () Unit!7576)

(assert (=> b!245505 (= e!159271 Unit!7578)))

(declare-fun lt!122848 () Unit!7576)

(declare-datatypes ((V!8209 0))(
  ( (V!8210 (val!3255 Int)) )
))
(declare-datatypes ((ValueCell!2867 0))(
  ( (ValueCellFull!2867 (v!5302 V!8209)) (EmptyCell!2867) )
))
(declare-datatypes ((array!12133 0))(
  ( (array!12134 (arr!5757 (Array (_ BitVec 32) ValueCell!2867)) (size!6100 (_ BitVec 32))) )
))
(declare-datatypes ((array!12135 0))(
  ( (array!12136 (arr!5758 (Array (_ BitVec 32) (_ BitVec 64))) (size!6101 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3634 0))(
  ( (LongMapFixedSize!3635 (defaultEntry!4546 Int) (mask!10659 (_ BitVec 32)) (extraKeys!4283 (_ BitVec 32)) (zeroValue!4387 V!8209) (minValue!4387 V!8209) (_size!1866 (_ BitVec 32)) (_keys!6660 array!12135) (_values!4529 array!12133) (_vacant!1866 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3634)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!186 (array!12135 array!12133 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) (_ BitVec 32) Int) Unit!7576)

(assert (=> b!245505 (= lt!122848 (lemmaArrayContainsKeyThenInListMap!186 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(assert (=> b!245505 false))

(declare-fun b!245506 () Bool)

(declare-fun Unit!7579 () Unit!7576)

(assert (=> b!245506 (= e!159271 Unit!7579)))

(declare-fun b!245507 () Bool)

(declare-fun res!120389 () Bool)

(declare-fun e!159279 () Bool)

(assert (=> b!245507 (=> (not res!120389) (not e!159279))))

(assert (=> b!245507 (= res!120389 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!245508 () Bool)

(declare-fun e!159278 () Bool)

(declare-datatypes ((SeekEntryResult!1088 0))(
  ( (MissingZero!1088 (index!6522 (_ BitVec 32))) (Found!1088 (index!6523 (_ BitVec 32))) (Intermediate!1088 (undefined!1900 Bool) (index!6524 (_ BitVec 32)) (x!24435 (_ BitVec 32))) (Undefined!1088) (MissingVacant!1088 (index!6525 (_ BitVec 32))) )
))
(declare-fun lt!122853 () SeekEntryResult!1088)

(get-info :version)

(assert (=> b!245508 (= e!159278 ((_ is Undefined!1088) lt!122853))))

(declare-fun res!120394 () Bool)

(assert (=> start!23370 (=> (not res!120394) (not e!159279))))

(declare-fun valid!1432 (LongMapFixedSize!3634) Bool)

(assert (=> start!23370 (= res!120394 (valid!1432 thiss!1504))))

(assert (=> start!23370 e!159279))

(declare-fun e!159269 () Bool)

(assert (=> start!23370 e!159269))

(assert (=> start!23370 true))

(declare-fun mapIsEmpty!10894 () Bool)

(declare-fun mapRes!10894 () Bool)

(assert (=> mapIsEmpty!10894 mapRes!10894))

(declare-fun b!245509 () Bool)

(declare-fun e!159275 () Bool)

(declare-fun tp_is_empty!6421 () Bool)

(assert (=> b!245509 (= e!159275 tp_is_empty!6421)))

(declare-fun b!245510 () Bool)

(declare-fun e!159267 () Bool)

(declare-fun call!22920 () Bool)

(assert (=> b!245510 (= e!159267 (not call!22920))))

(declare-fun b!245511 () Bool)

(declare-fun res!120390 () Bool)

(declare-fun e!159273 () Bool)

(assert (=> b!245511 (=> (not res!120390) (not e!159273))))

(declare-fun call!22921 () Bool)

(assert (=> b!245511 (= res!120390 call!22921)))

(declare-fun e!159266 () Bool)

(assert (=> b!245511 (= e!159266 e!159273)))

(declare-fun b!245512 () Bool)

(declare-fun e!159270 () Bool)

(assert (=> b!245512 (= e!159270 tp_is_empty!6421)))

(declare-fun b!245513 () Bool)

(declare-fun c!41004 () Bool)

(assert (=> b!245513 (= c!41004 ((_ is MissingVacant!1088) lt!122853))))

(assert (=> b!245513 (= e!159266 e!159278)))

(declare-fun mapNonEmpty!10894 () Bool)

(declare-fun tp!22912 () Bool)

(assert (=> mapNonEmpty!10894 (= mapRes!10894 (and tp!22912 e!159270))))

(declare-fun mapValue!10894 () ValueCell!2867)

(declare-fun mapRest!10894 () (Array (_ BitVec 32) ValueCell!2867))

(declare-fun mapKey!10894 () (_ BitVec 32))

(assert (=> mapNonEmpty!10894 (= (arr!5757 (_values!4529 thiss!1504)) (store mapRest!10894 mapKey!10894 mapValue!10894))))

(declare-fun b!245514 () Bool)

(declare-fun e!159276 () Bool)

(assert (=> b!245514 (= e!159276 (= (size!6101 (_keys!6660 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10659 thiss!1504))))))

(declare-fun b!245515 () Bool)

(declare-fun e!159274 () Unit!7576)

(declare-fun lt!122850 () Unit!7576)

(assert (=> b!245515 (= e!159274 lt!122850)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!375 (array!12135 array!12133 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) Int) Unit!7576)

(assert (=> b!245515 (= lt!122850 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!375 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)))))

(declare-fun c!41005 () Bool)

(assert (=> b!245515 (= c!41005 ((_ is MissingZero!1088) lt!122853))))

(assert (=> b!245515 e!159266))

(declare-fun b!245516 () Bool)

(declare-fun e!159272 () Bool)

(assert (=> b!245516 (= e!159272 (and e!159275 mapRes!10894))))

(declare-fun condMapEmpty!10894 () Bool)

(declare-fun mapDefault!10894 () ValueCell!2867)

(assert (=> b!245516 (= condMapEmpty!10894 (= (arr!5757 (_values!4529 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2867)) mapDefault!10894)))))

(declare-fun b!245517 () Bool)

(declare-fun res!120391 () Bool)

(assert (=> b!245517 (=> (not res!120391) (not e!159273))))

(assert (=> b!245517 (= res!120391 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6522 lt!122853)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245518 () Bool)

(assert (=> b!245518 (= e!159273 (not call!22920))))

(declare-fun b!245519 () Bool)

(declare-fun e!159268 () Bool)

(declare-fun e!159277 () Bool)

(assert (=> b!245519 (= e!159268 e!159277)))

(declare-fun res!120387 () Bool)

(assert (=> b!245519 (=> (not res!120387) (not e!159277))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245519 (= res!120387 (inRange!0 index!297 (mask!10659 thiss!1504)))))

(declare-fun lt!122849 () Unit!7576)

(assert (=> b!245519 (= lt!122849 e!159274)))

(declare-fun c!41006 () Bool)

(declare-datatypes ((tuple2!4758 0))(
  ( (tuple2!4759 (_1!2390 (_ BitVec 64)) (_2!2390 V!8209)) )
))
(declare-datatypes ((List!3661 0))(
  ( (Nil!3658) (Cons!3657 (h!4314 tuple2!4758) (t!8667 List!3661)) )
))
(declare-datatypes ((ListLongMap!3661 0))(
  ( (ListLongMap!3662 (toList!1846 List!3661)) )
))
(declare-fun contains!1760 (ListLongMap!3661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1355 (array!12135 array!12133 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 32) Int) ListLongMap!3661)

(assert (=> b!245519 (= c!41006 (contains!1760 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) key!932))))

(declare-fun bm!22917 () Bool)

(assert (=> bm!22917 (= call!22921 (inRange!0 (ite c!41005 (index!6522 lt!122853) (index!6525 lt!122853)) (mask!10659 thiss!1504)))))

(declare-fun b!245520 () Bool)

(declare-fun Unit!7580 () Unit!7576)

(assert (=> b!245520 (= e!159274 Unit!7580)))

(declare-fun lt!122847 () Unit!7576)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (array!12135 array!12133 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) Int) Unit!7576)

(assert (=> b!245520 (= lt!122847 (lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)))))

(assert (=> b!245520 false))

(declare-fun bm!22918 () Bool)

(declare-fun arrayContainsKey!0 (array!12135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22918 (= call!22920 (arrayContainsKey!0 (_keys!6660 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245521 () Bool)

(assert (=> b!245521 (= e!159277 (not e!159276))))

(declare-fun res!120393 () Bool)

(assert (=> b!245521 (=> res!120393 e!159276)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245521 (= res!120393 (not (validMask!0 (mask!10659 thiss!1504))))))

(declare-fun lt!122854 () array!12135)

(declare-fun arrayCountValidKeys!0 (array!12135 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245521 (= (arrayCountValidKeys!0 lt!122854 #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6660 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504)))))))

(declare-fun lt!122852 () Unit!7576)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12135 (_ BitVec 32) (_ BitVec 64)) Unit!7576)

(assert (=> b!245521 (= lt!122852 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6660 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3662 0))(
  ( (Nil!3659) (Cons!3658 (h!4315 (_ BitVec 64)) (t!8668 List!3662)) )
))
(declare-fun arrayNoDuplicates!0 (array!12135 (_ BitVec 32) List!3662) Bool)

(assert (=> b!245521 (arrayNoDuplicates!0 lt!122854 #b00000000000000000000000000000000 Nil!3659)))

(assert (=> b!245521 (= lt!122854 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun lt!122851 () Unit!7576)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12135 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3662) Unit!7576)

(assert (=> b!245521 (= lt!122851 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6660 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3659))))

(declare-fun lt!122855 () Unit!7576)

(assert (=> b!245521 (= lt!122855 e!159271)))

(declare-fun c!41007 () Bool)

(assert (=> b!245521 (= c!41007 (arrayContainsKey!0 (_keys!6660 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245522 () Bool)

(assert (=> b!245522 (= e!159278 e!159267)))

(declare-fun res!120392 () Bool)

(assert (=> b!245522 (= res!120392 call!22921)))

(assert (=> b!245522 (=> (not res!120392) (not e!159267))))

(declare-fun array_inv!3797 (array!12135) Bool)

(declare-fun array_inv!3798 (array!12133) Bool)

(assert (=> b!245523 (= e!159269 (and tp!22911 tp_is_empty!6421 (array_inv!3797 (_keys!6660 thiss!1504)) (array_inv!3798 (_values!4529 thiss!1504)) e!159272))))

(declare-fun b!245524 () Bool)

(assert (=> b!245524 (= e!159279 e!159268)))

(declare-fun res!120388 () Bool)

(assert (=> b!245524 (=> (not res!120388) (not e!159268))))

(assert (=> b!245524 (= res!120388 (or (= lt!122853 (MissingZero!1088 index!297)) (= lt!122853 (MissingVacant!1088 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12135 (_ BitVec 32)) SeekEntryResult!1088)

(assert (=> b!245524 (= lt!122853 (seekEntryOrOpen!0 key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(declare-fun b!245525 () Bool)

(declare-fun res!120386 () Bool)

(assert (=> b!245525 (= res!120386 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6525 lt!122853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245525 (=> (not res!120386) (not e!159267))))

(assert (= (and start!23370 res!120394) b!245507))

(assert (= (and b!245507 res!120389) b!245524))

(assert (= (and b!245524 res!120388) b!245519))

(assert (= (and b!245519 c!41006) b!245520))

(assert (= (and b!245519 (not c!41006)) b!245515))

(assert (= (and b!245515 c!41005) b!245511))

(assert (= (and b!245515 (not c!41005)) b!245513))

(assert (= (and b!245511 res!120390) b!245517))

(assert (= (and b!245517 res!120391) b!245518))

(assert (= (and b!245513 c!41004) b!245522))

(assert (= (and b!245513 (not c!41004)) b!245508))

(assert (= (and b!245522 res!120392) b!245525))

(assert (= (and b!245525 res!120386) b!245510))

(assert (= (or b!245511 b!245522) bm!22917))

(assert (= (or b!245518 b!245510) bm!22918))

(assert (= (and b!245519 res!120387) b!245521))

(assert (= (and b!245521 c!41007) b!245505))

(assert (= (and b!245521 (not c!41007)) b!245506))

(assert (= (and b!245521 (not res!120393)) b!245514))

(assert (= (and b!245516 condMapEmpty!10894) mapIsEmpty!10894))

(assert (= (and b!245516 (not condMapEmpty!10894)) mapNonEmpty!10894))

(assert (= (and mapNonEmpty!10894 ((_ is ValueCellFull!2867) mapValue!10894)) b!245512))

(assert (= (and b!245516 ((_ is ValueCellFull!2867) mapDefault!10894)) b!245509))

(assert (= b!245523 b!245516))

(assert (= start!23370 b!245523))

(declare-fun m!262557 () Bool)

(assert (=> b!245515 m!262557))

(declare-fun m!262559 () Bool)

(assert (=> bm!22917 m!262559))

(declare-fun m!262561 () Bool)

(assert (=> bm!22918 m!262561))

(declare-fun m!262563 () Bool)

(assert (=> b!245524 m!262563))

(declare-fun m!262565 () Bool)

(assert (=> b!245521 m!262565))

(assert (=> b!245521 m!262561))

(declare-fun m!262567 () Bool)

(assert (=> b!245521 m!262567))

(declare-fun m!262569 () Bool)

(assert (=> b!245521 m!262569))

(declare-fun m!262571 () Bool)

(assert (=> b!245521 m!262571))

(declare-fun m!262573 () Bool)

(assert (=> b!245521 m!262573))

(declare-fun m!262575 () Bool)

(assert (=> b!245521 m!262575))

(declare-fun m!262577 () Bool)

(assert (=> b!245521 m!262577))

(declare-fun m!262579 () Bool)

(assert (=> b!245525 m!262579))

(declare-fun m!262581 () Bool)

(assert (=> b!245520 m!262581))

(declare-fun m!262583 () Bool)

(assert (=> b!245517 m!262583))

(declare-fun m!262585 () Bool)

(assert (=> start!23370 m!262585))

(declare-fun m!262587 () Bool)

(assert (=> b!245505 m!262587))

(declare-fun m!262589 () Bool)

(assert (=> mapNonEmpty!10894 m!262589))

(declare-fun m!262591 () Bool)

(assert (=> b!245523 m!262591))

(declare-fun m!262593 () Bool)

(assert (=> b!245523 m!262593))

(declare-fun m!262595 () Bool)

(assert (=> b!245519 m!262595))

(declare-fun m!262597 () Bool)

(assert (=> b!245519 m!262597))

(assert (=> b!245519 m!262597))

(declare-fun m!262599 () Bool)

(assert (=> b!245519 m!262599))

(check-sat (not b_next!6559) b_and!13523 (not b!245523) (not b!245520) (not b!245519) (not mapNonEmpty!10894) (not b!245521) tp_is_empty!6421 (not start!23370) (not b!245505) (not bm!22917) (not b!245515) (not b!245524) (not bm!22918))
(check-sat b_and!13523 (not b_next!6559))
(get-model)

(declare-fun e!159375 () Bool)

(declare-fun b!245663 () Bool)

(assert (=> b!245663 (= e!159375 (= (arrayCountValidKeys!0 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))) #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6660 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!245662 () Bool)

(declare-fun e!159376 () Bool)

(assert (=> b!245662 (= e!159376 (bvslt (size!6101 (_keys!6660 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!245661 () Bool)

(declare-fun res!120457 () Bool)

(assert (=> b!245661 (=> (not res!120457) (not e!159376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!245661 (= res!120457 (validKeyInArray!0 key!932))))

(declare-fun d!60071 () Bool)

(assert (=> d!60071 e!159375))

(declare-fun res!120459 () Bool)

(assert (=> d!60071 (=> (not res!120459) (not e!159375))))

(assert (=> d!60071 (= res!120459 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6101 (_keys!6660 thiss!1504)))))))

(declare-fun lt!122912 () Unit!7576)

(declare-fun choose!1 (array!12135 (_ BitVec 32) (_ BitVec 64)) Unit!7576)

(assert (=> d!60071 (= lt!122912 (choose!1 (_keys!6660 thiss!1504) index!297 key!932))))

(assert (=> d!60071 e!159376))

(declare-fun res!120460 () Bool)

(assert (=> d!60071 (=> (not res!120460) (not e!159376))))

(assert (=> d!60071 (= res!120460 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6101 (_keys!6660 thiss!1504)))))))

(assert (=> d!60071 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6660 thiss!1504) index!297 key!932) lt!122912)))

(declare-fun b!245660 () Bool)

(declare-fun res!120458 () Bool)

(assert (=> b!245660 (=> (not res!120458) (not e!159376))))

(assert (=> b!245660 (= res!120458 (not (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) index!297))))))

(assert (= (and d!60071 res!120460) b!245660))

(assert (= (and b!245660 res!120458) b!245661))

(assert (= (and b!245661 res!120457) b!245662))

(assert (= (and d!60071 res!120459) b!245663))

(assert (=> b!245663 m!262573))

(declare-fun m!262689 () Bool)

(assert (=> b!245663 m!262689))

(assert (=> b!245663 m!262575))

(declare-fun m!262691 () Bool)

(assert (=> b!245661 m!262691))

(declare-fun m!262693 () Bool)

(assert (=> d!60071 m!262693))

(declare-fun m!262695 () Bool)

(assert (=> b!245660 m!262695))

(assert (=> b!245660 m!262695))

(declare-fun m!262697 () Bool)

(assert (=> b!245660 m!262697))

(assert (=> b!245521 d!60071))

(declare-fun d!60073 () Bool)

(declare-fun res!120465 () Bool)

(declare-fun e!159381 () Bool)

(assert (=> d!60073 (=> res!120465 e!159381)))

(assert (=> d!60073 (= res!120465 (= (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60073 (= (arrayContainsKey!0 (_keys!6660 thiss!1504) key!932 #b00000000000000000000000000000000) e!159381)))

(declare-fun b!245668 () Bool)

(declare-fun e!159382 () Bool)

(assert (=> b!245668 (= e!159381 e!159382)))

(declare-fun res!120466 () Bool)

(assert (=> b!245668 (=> (not res!120466) (not e!159382))))

(assert (=> b!245668 (= res!120466 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun b!245669 () Bool)

(assert (=> b!245669 (= e!159382 (arrayContainsKey!0 (_keys!6660 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60073 (not res!120465)) b!245668))

(assert (= (and b!245668 res!120466) b!245669))

(declare-fun m!262699 () Bool)

(assert (=> d!60073 m!262699))

(declare-fun m!262701 () Bool)

(assert (=> b!245669 m!262701))

(assert (=> b!245521 d!60073))

(declare-fun b!245680 () Bool)

(declare-fun e!159394 () Bool)

(declare-fun e!159392 () Bool)

(assert (=> b!245680 (= e!159394 e!159392)))

(declare-fun c!41034 () Bool)

(assert (=> b!245680 (= c!41034 (validKeyInArray!0 (select (arr!5758 lt!122854) #b00000000000000000000000000000000)))))

(declare-fun b!245681 () Bool)

(declare-fun e!159393 () Bool)

(declare-fun contains!1763 (List!3662 (_ BitVec 64)) Bool)

(assert (=> b!245681 (= e!159393 (contains!1763 Nil!3659 (select (arr!5758 lt!122854) #b00000000000000000000000000000000)))))

(declare-fun b!245682 () Bool)

(declare-fun e!159391 () Bool)

(assert (=> b!245682 (= e!159391 e!159394)))

(declare-fun res!120474 () Bool)

(assert (=> b!245682 (=> (not res!120474) (not e!159394))))

(assert (=> b!245682 (= res!120474 (not e!159393))))

(declare-fun res!120475 () Bool)

(assert (=> b!245682 (=> (not res!120475) (not e!159393))))

(assert (=> b!245682 (= res!120475 (validKeyInArray!0 (select (arr!5758 lt!122854) #b00000000000000000000000000000000)))))

(declare-fun bm!22933 () Bool)

(declare-fun call!22936 () Bool)

(assert (=> bm!22933 (= call!22936 (arrayNoDuplicates!0 lt!122854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41034 (Cons!3658 (select (arr!5758 lt!122854) #b00000000000000000000000000000000) Nil!3659) Nil!3659)))))

(declare-fun d!60075 () Bool)

(declare-fun res!120473 () Bool)

(assert (=> d!60075 (=> res!120473 e!159391)))

(assert (=> d!60075 (= res!120473 (bvsge #b00000000000000000000000000000000 (size!6101 lt!122854)))))

(assert (=> d!60075 (= (arrayNoDuplicates!0 lt!122854 #b00000000000000000000000000000000 Nil!3659) e!159391)))

(declare-fun b!245683 () Bool)

(assert (=> b!245683 (= e!159392 call!22936)))

(declare-fun b!245684 () Bool)

(assert (=> b!245684 (= e!159392 call!22936)))

(assert (= (and d!60075 (not res!120473)) b!245682))

(assert (= (and b!245682 res!120475) b!245681))

(assert (= (and b!245682 res!120474) b!245680))

(assert (= (and b!245680 c!41034) b!245683))

(assert (= (and b!245680 (not c!41034)) b!245684))

(assert (= (or b!245683 b!245684) bm!22933))

(declare-fun m!262703 () Bool)

(assert (=> b!245680 m!262703))

(assert (=> b!245680 m!262703))

(declare-fun m!262705 () Bool)

(assert (=> b!245680 m!262705))

(assert (=> b!245681 m!262703))

(assert (=> b!245681 m!262703))

(declare-fun m!262707 () Bool)

(assert (=> b!245681 m!262707))

(assert (=> b!245682 m!262703))

(assert (=> b!245682 m!262703))

(assert (=> b!245682 m!262705))

(assert (=> bm!22933 m!262703))

(declare-fun m!262709 () Bool)

(assert (=> bm!22933 m!262709))

(assert (=> b!245521 d!60075))

(declare-fun bm!22936 () Bool)

(declare-fun call!22939 () (_ BitVec 32))

(assert (=> bm!22936 (= call!22939 (arrayCountValidKeys!0 (_keys!6660 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun d!60077 () Bool)

(declare-fun lt!122915 () (_ BitVec 32))

(assert (=> d!60077 (and (bvsge lt!122915 #b00000000000000000000000000000000) (bvsle lt!122915 (bvsub (size!6101 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!159399 () (_ BitVec 32))

(assert (=> d!60077 (= lt!122915 e!159399)))

(declare-fun c!41039 () Bool)

(assert (=> d!60077 (= c!41039 (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60077 (and (bvsle #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6101 (_keys!6660 thiss!1504)) (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60077 (= (arrayCountValidKeys!0 (_keys!6660 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) lt!122915)))

(declare-fun b!245693 () Bool)

(assert (=> b!245693 (= e!159399 #b00000000000000000000000000000000)))

(declare-fun b!245694 () Bool)

(declare-fun e!159400 () (_ BitVec 32))

(assert (=> b!245694 (= e!159399 e!159400)))

(declare-fun c!41040 () Bool)

(assert (=> b!245694 (= c!41040 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245695 () Bool)

(assert (=> b!245695 (= e!159400 call!22939)))

(declare-fun b!245696 () Bool)

(assert (=> b!245696 (= e!159400 (bvadd #b00000000000000000000000000000001 call!22939))))

(assert (= (and d!60077 c!41039) b!245693))

(assert (= (and d!60077 (not c!41039)) b!245694))

(assert (= (and b!245694 c!41040) b!245696))

(assert (= (and b!245694 (not c!41040)) b!245695))

(assert (= (or b!245696 b!245695) bm!22936))

(declare-fun m!262711 () Bool)

(assert (=> bm!22936 m!262711))

(assert (=> b!245694 m!262699))

(assert (=> b!245694 m!262699))

(declare-fun m!262713 () Bool)

(assert (=> b!245694 m!262713))

(assert (=> b!245521 d!60077))

(declare-fun d!60079 () Bool)

(assert (=> d!60079 (= (validMask!0 (mask!10659 thiss!1504)) (and (or (= (mask!10659 thiss!1504) #b00000000000000000000000000000111) (= (mask!10659 thiss!1504) #b00000000000000000000000000001111) (= (mask!10659 thiss!1504) #b00000000000000000000000000011111) (= (mask!10659 thiss!1504) #b00000000000000000000000000111111) (= (mask!10659 thiss!1504) #b00000000000000000000000001111111) (= (mask!10659 thiss!1504) #b00000000000000000000000011111111) (= (mask!10659 thiss!1504) #b00000000000000000000000111111111) (= (mask!10659 thiss!1504) #b00000000000000000000001111111111) (= (mask!10659 thiss!1504) #b00000000000000000000011111111111) (= (mask!10659 thiss!1504) #b00000000000000000000111111111111) (= (mask!10659 thiss!1504) #b00000000000000000001111111111111) (= (mask!10659 thiss!1504) #b00000000000000000011111111111111) (= (mask!10659 thiss!1504) #b00000000000000000111111111111111) (= (mask!10659 thiss!1504) #b00000000000000001111111111111111) (= (mask!10659 thiss!1504) #b00000000000000011111111111111111) (= (mask!10659 thiss!1504) #b00000000000000111111111111111111) (= (mask!10659 thiss!1504) #b00000000000001111111111111111111) (= (mask!10659 thiss!1504) #b00000000000011111111111111111111) (= (mask!10659 thiss!1504) #b00000000000111111111111111111111) (= (mask!10659 thiss!1504) #b00000000001111111111111111111111) (= (mask!10659 thiss!1504) #b00000000011111111111111111111111) (= (mask!10659 thiss!1504) #b00000000111111111111111111111111) (= (mask!10659 thiss!1504) #b00000001111111111111111111111111) (= (mask!10659 thiss!1504) #b00000011111111111111111111111111) (= (mask!10659 thiss!1504) #b00000111111111111111111111111111) (= (mask!10659 thiss!1504) #b00001111111111111111111111111111) (= (mask!10659 thiss!1504) #b00011111111111111111111111111111) (= (mask!10659 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10659 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!245521 d!60079))

(declare-fun bm!22937 () Bool)

(declare-fun call!22940 () (_ BitVec 32))

(assert (=> bm!22937 (= call!22940 (arrayCountValidKeys!0 lt!122854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun d!60081 () Bool)

(declare-fun lt!122916 () (_ BitVec 32))

(assert (=> d!60081 (and (bvsge lt!122916 #b00000000000000000000000000000000) (bvsle lt!122916 (bvsub (size!6101 lt!122854) #b00000000000000000000000000000000)))))

(declare-fun e!159401 () (_ BitVec 32))

(assert (=> d!60081 (= lt!122916 e!159401)))

(declare-fun c!41041 () Bool)

(assert (=> d!60081 (= c!41041 (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60081 (and (bvsle #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6101 (_keys!6660 thiss!1504)) (size!6101 lt!122854)))))

(assert (=> d!60081 (= (arrayCountValidKeys!0 lt!122854 #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) lt!122916)))

(declare-fun b!245697 () Bool)

(assert (=> b!245697 (= e!159401 #b00000000000000000000000000000000)))

(declare-fun b!245698 () Bool)

(declare-fun e!159402 () (_ BitVec 32))

(assert (=> b!245698 (= e!159401 e!159402)))

(declare-fun c!41042 () Bool)

(assert (=> b!245698 (= c!41042 (validKeyInArray!0 (select (arr!5758 lt!122854) #b00000000000000000000000000000000)))))

(declare-fun b!245699 () Bool)

(assert (=> b!245699 (= e!159402 call!22940)))

(declare-fun b!245700 () Bool)

(assert (=> b!245700 (= e!159402 (bvadd #b00000000000000000000000000000001 call!22940))))

(assert (= (and d!60081 c!41041) b!245697))

(assert (= (and d!60081 (not c!41041)) b!245698))

(assert (= (and b!245698 c!41042) b!245700))

(assert (= (and b!245698 (not c!41042)) b!245699))

(assert (= (or b!245700 b!245699) bm!22937))

(declare-fun m!262715 () Bool)

(assert (=> bm!22937 m!262715))

(assert (=> b!245698 m!262703))

(assert (=> b!245698 m!262703))

(assert (=> b!245698 m!262705))

(assert (=> b!245521 d!60081))

(declare-fun d!60083 () Bool)

(declare-fun e!159405 () Bool)

(assert (=> d!60083 e!159405))

(declare-fun res!120478 () Bool)

(assert (=> d!60083 (=> (not res!120478) (not e!159405))))

(assert (=> d!60083 (= res!120478 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6101 (_keys!6660 thiss!1504)))))))

(declare-fun lt!122919 () Unit!7576)

(declare-fun choose!41 (array!12135 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3662) Unit!7576)

(assert (=> d!60083 (= lt!122919 (choose!41 (_keys!6660 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3659))))

(assert (=> d!60083 (bvslt (size!6101 (_keys!6660 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60083 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6660 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3659) lt!122919)))

(declare-fun b!245703 () Bool)

(assert (=> b!245703 (= e!159405 (arrayNoDuplicates!0 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))) #b00000000000000000000000000000000 Nil!3659))))

(assert (= (and d!60083 res!120478) b!245703))

(declare-fun m!262717 () Bool)

(assert (=> d!60083 m!262717))

(assert (=> b!245703 m!262573))

(declare-fun m!262719 () Bool)

(assert (=> b!245703 m!262719))

(assert (=> b!245521 d!60083))

(declare-fun d!60085 () Bool)

(assert (=> d!60085 (contains!1760 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) key!932)))

(declare-fun lt!122922 () Unit!7576)

(declare-fun choose!1156 (array!12135 array!12133 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) (_ BitVec 32) Int) Unit!7576)

(assert (=> d!60085 (= lt!122922 (choose!1156 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(assert (=> d!60085 (validMask!0 (mask!10659 thiss!1504))))

(assert (=> d!60085 (= (lemmaArrayContainsKeyThenInListMap!186 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) lt!122922)))

(declare-fun bs!8870 () Bool)

(assert (= bs!8870 d!60085))

(assert (=> bs!8870 m!262597))

(assert (=> bs!8870 m!262597))

(assert (=> bs!8870 m!262599))

(declare-fun m!262721 () Bool)

(assert (=> bs!8870 m!262721))

(assert (=> bs!8870 m!262565))

(assert (=> b!245505 d!60085))

(declare-fun d!60087 () Bool)

(assert (=> d!60087 (= (inRange!0 index!297 (mask!10659 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10659 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245519 d!60087))

(declare-fun d!60089 () Bool)

(declare-fun e!159411 () Bool)

(assert (=> d!60089 e!159411))

(declare-fun res!120481 () Bool)

(assert (=> d!60089 (=> res!120481 e!159411)))

(declare-fun lt!122932 () Bool)

(assert (=> d!60089 (= res!120481 (not lt!122932))))

(declare-fun lt!122931 () Bool)

(assert (=> d!60089 (= lt!122932 lt!122931)))

(declare-fun lt!122933 () Unit!7576)

(declare-fun e!159410 () Unit!7576)

(assert (=> d!60089 (= lt!122933 e!159410)))

(declare-fun c!41045 () Bool)

(assert (=> d!60089 (= c!41045 lt!122931)))

(declare-fun containsKey!279 (List!3661 (_ BitVec 64)) Bool)

(assert (=> d!60089 (= lt!122931 (containsKey!279 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(assert (=> d!60089 (= (contains!1760 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) key!932) lt!122932)))

(declare-fun b!245710 () Bool)

(declare-fun lt!122934 () Unit!7576)

(assert (=> b!245710 (= e!159410 lt!122934)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!228 (List!3661 (_ BitVec 64)) Unit!7576)

(assert (=> b!245710 (= lt!122934 (lemmaContainsKeyImpliesGetValueByKeyDefined!228 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(declare-datatypes ((Option!293 0))(
  ( (Some!292 (v!5305 V!8209)) (None!291) )
))
(declare-fun isDefined!229 (Option!293) Bool)

(declare-fun getValueByKey!287 (List!3661 (_ BitVec 64)) Option!293)

(assert (=> b!245710 (isDefined!229 (getValueByKey!287 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(declare-fun b!245711 () Bool)

(declare-fun Unit!7589 () Unit!7576)

(assert (=> b!245711 (= e!159410 Unit!7589)))

(declare-fun b!245712 () Bool)

(assert (=> b!245712 (= e!159411 (isDefined!229 (getValueByKey!287 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932)))))

(assert (= (and d!60089 c!41045) b!245710))

(assert (= (and d!60089 (not c!41045)) b!245711))

(assert (= (and d!60089 (not res!120481)) b!245712))

(declare-fun m!262723 () Bool)

(assert (=> d!60089 m!262723))

(declare-fun m!262725 () Bool)

(assert (=> b!245710 m!262725))

(declare-fun m!262727 () Bool)

(assert (=> b!245710 m!262727))

(assert (=> b!245710 m!262727))

(declare-fun m!262729 () Bool)

(assert (=> b!245710 m!262729))

(assert (=> b!245712 m!262727))

(assert (=> b!245712 m!262727))

(assert (=> b!245712 m!262729))

(assert (=> b!245519 d!60089))

(declare-fun b!245755 () Bool)

(declare-fun e!159438 () Unit!7576)

(declare-fun Unit!7590 () Unit!7576)

(assert (=> b!245755 (= e!159438 Unit!7590)))

(declare-fun b!245756 () Bool)

(declare-fun e!159441 () Bool)

(declare-fun lt!122982 () ListLongMap!3661)

(declare-fun apply!231 (ListLongMap!3661 (_ BitVec 64)) V!8209)

(assert (=> b!245756 (= e!159441 (= (apply!231 lt!122982 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4387 thiss!1504)))))

(declare-fun b!245757 () Bool)

(declare-fun res!120505 () Bool)

(declare-fun e!159445 () Bool)

(assert (=> b!245757 (=> (not res!120505) (not e!159445))))

(declare-fun e!159447 () Bool)

(assert (=> b!245757 (= res!120505 e!159447)))

(declare-fun res!120502 () Bool)

(assert (=> b!245757 (=> res!120502 e!159447)))

(declare-fun e!159446 () Bool)

(assert (=> b!245757 (= res!120502 (not e!159446))))

(declare-fun res!120503 () Bool)

(assert (=> b!245757 (=> (not res!120503) (not e!159446))))

(assert (=> b!245757 (= res!120503 (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun b!245758 () Bool)

(declare-fun e!159443 () Bool)

(assert (=> b!245758 (= e!159443 (= (apply!231 lt!122982 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4387 thiss!1504)))))

(declare-fun b!245759 () Bool)

(declare-fun res!120504 () Bool)

(assert (=> b!245759 (=> (not res!120504) (not e!159445))))

(declare-fun e!159444 () Bool)

(assert (=> b!245759 (= res!120504 e!159444)))

(declare-fun c!41058 () Bool)

(assert (=> b!245759 (= c!41058 (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!245760 () Bool)

(declare-fun e!159449 () ListLongMap!3661)

(declare-fun call!22959 () ListLongMap!3661)

(declare-fun +!664 (ListLongMap!3661 tuple2!4758) ListLongMap!3661)

(assert (=> b!245760 (= e!159449 (+!664 call!22959 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))

(declare-fun b!245761 () Bool)

(declare-fun e!159442 () Bool)

(declare-fun get!2951 (ValueCell!2867 V!8209) V!8209)

(declare-fun dynLambda!565 (Int (_ BitVec 64)) V!8209)

(assert (=> b!245761 (= e!159442 (= (apply!231 lt!122982 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)) (get!2951 (select (arr!5757 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6100 (_values!4529 thiss!1504))))))

(assert (=> b!245761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun b!245762 () Bool)

(declare-fun e!159448 () ListLongMap!3661)

(declare-fun call!22958 () ListLongMap!3661)

(assert (=> b!245762 (= e!159448 call!22958)))

(declare-fun b!245763 () Bool)

(declare-fun e!159440 () ListLongMap!3661)

(declare-fun call!22956 () ListLongMap!3661)

(assert (=> b!245763 (= e!159440 call!22956)))

(declare-fun b!245764 () Bool)

(declare-fun e!159450 () Bool)

(declare-fun call!22955 () Bool)

(assert (=> b!245764 (= e!159450 (not call!22955))))

(declare-fun b!245765 () Bool)

(declare-fun e!159439 () Bool)

(assert (=> b!245765 (= e!159439 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245766 () Bool)

(assert (=> b!245766 (= e!159445 e!159450)))

(declare-fun c!41061 () Bool)

(assert (=> b!245766 (= c!41061 (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245767 () Bool)

(assert (=> b!245767 (= e!159446 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245768 () Bool)

(assert (=> b!245768 (= e!159444 e!159443)))

(declare-fun res!120507 () Bool)

(declare-fun call!22960 () Bool)

(assert (=> b!245768 (= res!120507 call!22960)))

(assert (=> b!245768 (=> (not res!120507) (not e!159443))))

(declare-fun b!245769 () Bool)

(assert (=> b!245769 (= e!159447 e!159442)))

(declare-fun res!120501 () Bool)

(assert (=> b!245769 (=> (not res!120501) (not e!159442))))

(assert (=> b!245769 (= res!120501 (contains!1760 lt!122982 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245769 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun bm!22952 () Bool)

(declare-fun call!22957 () ListLongMap!3661)

(declare-fun call!22961 () ListLongMap!3661)

(assert (=> bm!22952 (= call!22957 call!22961)))

(declare-fun bm!22953 () Bool)

(assert (=> bm!22953 (= call!22956 call!22957)))

(declare-fun b!245770 () Bool)

(assert (=> b!245770 (= e!159449 e!159448)))

(declare-fun c!41063 () Bool)

(assert (=> b!245770 (= c!41063 (and (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245771 () Bool)

(declare-fun c!41059 () Bool)

(assert (=> b!245771 (= c!41059 (and (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!245771 (= e!159448 e!159440)))

(declare-fun bm!22954 () Bool)

(assert (=> bm!22954 (= call!22958 call!22959)))

(declare-fun b!245772 () Bool)

(assert (=> b!245772 (= e!159440 call!22958)))

(declare-fun bm!22955 () Bool)

(assert (=> bm!22955 (= call!22960 (contains!1760 lt!122982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22956 () Bool)

(declare-fun c!41062 () Bool)

(assert (=> bm!22956 (= call!22959 (+!664 (ite c!41062 call!22961 (ite c!41063 call!22957 call!22956)) (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(declare-fun bm!22957 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!547 (array!12135 array!12133 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 32) Int) ListLongMap!3661)

(assert (=> bm!22957 (= call!22961 (getCurrentListMapNoExtraKeys!547 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun b!245773 () Bool)

(assert (=> b!245773 (= e!159444 (not call!22960))))

(declare-fun d!60091 () Bool)

(assert (=> d!60091 e!159445))

(declare-fun res!120500 () Bool)

(assert (=> d!60091 (=> (not res!120500) (not e!159445))))

(assert (=> d!60091 (= res!120500 (or (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))))

(declare-fun lt!122992 () ListLongMap!3661)

(assert (=> d!60091 (= lt!122982 lt!122992)))

(declare-fun lt!122980 () Unit!7576)

(assert (=> d!60091 (= lt!122980 e!159438)))

(declare-fun c!41060 () Bool)

(assert (=> d!60091 (= c!41060 e!159439)))

(declare-fun res!120508 () Bool)

(assert (=> d!60091 (=> (not res!120508) (not e!159439))))

(assert (=> d!60091 (= res!120508 (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60091 (= lt!122992 e!159449)))

(assert (=> d!60091 (= c!41062 (and (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60091 (validMask!0 (mask!10659 thiss!1504))))

(assert (=> d!60091 (= (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) lt!122982)))

(declare-fun bm!22958 () Bool)

(assert (=> bm!22958 (= call!22955 (contains!1760 lt!122982 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245774 () Bool)

(declare-fun lt!122987 () Unit!7576)

(assert (=> b!245774 (= e!159438 lt!122987)))

(declare-fun lt!122993 () ListLongMap!3661)

(assert (=> b!245774 (= lt!122993 (getCurrentListMapNoExtraKeys!547 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun lt!122989 () (_ BitVec 64))

(assert (=> b!245774 (= lt!122989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123000 () (_ BitVec 64))

(assert (=> b!245774 (= lt!123000 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122997 () Unit!7576)

(declare-fun addStillContains!207 (ListLongMap!3661 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7576)

(assert (=> b!245774 (= lt!122997 (addStillContains!207 lt!122993 lt!122989 (zeroValue!4387 thiss!1504) lt!123000))))

(assert (=> b!245774 (contains!1760 (+!664 lt!122993 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504))) lt!123000)))

(declare-fun lt!122984 () Unit!7576)

(assert (=> b!245774 (= lt!122984 lt!122997)))

(declare-fun lt!122994 () ListLongMap!3661)

(assert (=> b!245774 (= lt!122994 (getCurrentListMapNoExtraKeys!547 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun lt!122988 () (_ BitVec 64))

(assert (=> b!245774 (= lt!122988 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122990 () (_ BitVec 64))

(assert (=> b!245774 (= lt!122990 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122998 () Unit!7576)

(declare-fun addApplyDifferent!207 (ListLongMap!3661 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7576)

(assert (=> b!245774 (= lt!122998 (addApplyDifferent!207 lt!122994 lt!122988 (minValue!4387 thiss!1504) lt!122990))))

(assert (=> b!245774 (= (apply!231 (+!664 lt!122994 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504))) lt!122990) (apply!231 lt!122994 lt!122990))))

(declare-fun lt!122999 () Unit!7576)

(assert (=> b!245774 (= lt!122999 lt!122998)))

(declare-fun lt!122986 () ListLongMap!3661)

(assert (=> b!245774 (= lt!122986 (getCurrentListMapNoExtraKeys!547 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun lt!122983 () (_ BitVec 64))

(assert (=> b!245774 (= lt!122983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122995 () (_ BitVec 64))

(assert (=> b!245774 (= lt!122995 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122981 () Unit!7576)

(assert (=> b!245774 (= lt!122981 (addApplyDifferent!207 lt!122986 lt!122983 (zeroValue!4387 thiss!1504) lt!122995))))

(assert (=> b!245774 (= (apply!231 (+!664 lt!122986 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504))) lt!122995) (apply!231 lt!122986 lt!122995))))

(declare-fun lt!122985 () Unit!7576)

(assert (=> b!245774 (= lt!122985 lt!122981)))

(declare-fun lt!122991 () ListLongMap!3661)

(assert (=> b!245774 (= lt!122991 (getCurrentListMapNoExtraKeys!547 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun lt!122996 () (_ BitVec 64))

(assert (=> b!245774 (= lt!122996 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122979 () (_ BitVec 64))

(assert (=> b!245774 (= lt!122979 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245774 (= lt!122987 (addApplyDifferent!207 lt!122991 lt!122996 (minValue!4387 thiss!1504) lt!122979))))

(assert (=> b!245774 (= (apply!231 (+!664 lt!122991 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504))) lt!122979) (apply!231 lt!122991 lt!122979))))

(declare-fun b!245775 () Bool)

(assert (=> b!245775 (= e!159450 e!159441)))

(declare-fun res!120506 () Bool)

(assert (=> b!245775 (= res!120506 call!22955)))

(assert (=> b!245775 (=> (not res!120506) (not e!159441))))

(assert (= (and d!60091 c!41062) b!245760))

(assert (= (and d!60091 (not c!41062)) b!245770))

(assert (= (and b!245770 c!41063) b!245762))

(assert (= (and b!245770 (not c!41063)) b!245771))

(assert (= (and b!245771 c!41059) b!245772))

(assert (= (and b!245771 (not c!41059)) b!245763))

(assert (= (or b!245772 b!245763) bm!22953))

(assert (= (or b!245762 bm!22953) bm!22952))

(assert (= (or b!245762 b!245772) bm!22954))

(assert (= (or b!245760 bm!22952) bm!22957))

(assert (= (or b!245760 bm!22954) bm!22956))

(assert (= (and d!60091 res!120508) b!245765))

(assert (= (and d!60091 c!41060) b!245774))

(assert (= (and d!60091 (not c!41060)) b!245755))

(assert (= (and d!60091 res!120500) b!245757))

(assert (= (and b!245757 res!120503) b!245767))

(assert (= (and b!245757 (not res!120502)) b!245769))

(assert (= (and b!245769 res!120501) b!245761))

(assert (= (and b!245757 res!120505) b!245759))

(assert (= (and b!245759 c!41058) b!245768))

(assert (= (and b!245759 (not c!41058)) b!245773))

(assert (= (and b!245768 res!120507) b!245758))

(assert (= (or b!245768 b!245773) bm!22955))

(assert (= (and b!245759 res!120504) b!245766))

(assert (= (and b!245766 c!41061) b!245775))

(assert (= (and b!245766 (not c!41061)) b!245764))

(assert (= (and b!245775 res!120506) b!245756))

(assert (= (or b!245775 b!245764) bm!22958))

(declare-fun b_lambda!8009 () Bool)

(assert (=> (not b_lambda!8009) (not b!245761)))

(declare-fun t!8674 () Bool)

(declare-fun tb!2967 () Bool)

(assert (=> (and b!245523 (= (defaultEntry!4546 thiss!1504) (defaultEntry!4546 thiss!1504)) t!8674) tb!2967))

(declare-fun result!5239 () Bool)

(assert (=> tb!2967 (= result!5239 tp_is_empty!6421)))

(assert (=> b!245761 t!8674))

(declare-fun b_and!13529 () Bool)

(assert (= b_and!13523 (and (=> t!8674 result!5239) b_and!13529)))

(assert (=> b!245765 m!262699))

(assert (=> b!245765 m!262699))

(assert (=> b!245765 m!262713))

(declare-fun m!262731 () Bool)

(assert (=> bm!22958 m!262731))

(declare-fun m!262733 () Bool)

(assert (=> bm!22956 m!262733))

(declare-fun m!262735 () Bool)

(assert (=> b!245774 m!262735))

(declare-fun m!262737 () Bool)

(assert (=> b!245774 m!262737))

(declare-fun m!262739 () Bool)

(assert (=> b!245774 m!262739))

(declare-fun m!262741 () Bool)

(assert (=> b!245774 m!262741))

(declare-fun m!262743 () Bool)

(assert (=> b!245774 m!262743))

(assert (=> b!245774 m!262699))

(declare-fun m!262745 () Bool)

(assert (=> b!245774 m!262745))

(declare-fun m!262747 () Bool)

(assert (=> b!245774 m!262747))

(declare-fun m!262749 () Bool)

(assert (=> b!245774 m!262749))

(declare-fun m!262751 () Bool)

(assert (=> b!245774 m!262751))

(assert (=> b!245774 m!262747))

(declare-fun m!262753 () Bool)

(assert (=> b!245774 m!262753))

(assert (=> b!245774 m!262745))

(declare-fun m!262755 () Bool)

(assert (=> b!245774 m!262755))

(declare-fun m!262757 () Bool)

(assert (=> b!245774 m!262757))

(declare-fun m!262759 () Bool)

(assert (=> b!245774 m!262759))

(assert (=> b!245774 m!262741))

(declare-fun m!262761 () Bool)

(assert (=> b!245774 m!262761))

(declare-fun m!262763 () Bool)

(assert (=> b!245774 m!262763))

(declare-fun m!262765 () Bool)

(assert (=> b!245774 m!262765))

(assert (=> b!245774 m!262757))

(declare-fun m!262767 () Bool)

(assert (=> bm!22955 m!262767))

(declare-fun m!262769 () Bool)

(assert (=> b!245760 m!262769))

(assert (=> d!60091 m!262565))

(assert (=> b!245769 m!262699))

(assert (=> b!245769 m!262699))

(declare-fun m!262771 () Bool)

(assert (=> b!245769 m!262771))

(assert (=> bm!22957 m!262739))

(declare-fun m!262773 () Bool)

(assert (=> b!245756 m!262773))

(assert (=> b!245767 m!262699))

(assert (=> b!245767 m!262699))

(assert (=> b!245767 m!262713))

(declare-fun m!262775 () Bool)

(assert (=> b!245761 m!262775))

(assert (=> b!245761 m!262699))

(declare-fun m!262777 () Bool)

(assert (=> b!245761 m!262777))

(assert (=> b!245761 m!262777))

(assert (=> b!245761 m!262775))

(declare-fun m!262779 () Bool)

(assert (=> b!245761 m!262779))

(assert (=> b!245761 m!262699))

(declare-fun m!262781 () Bool)

(assert (=> b!245761 m!262781))

(declare-fun m!262783 () Bool)

(assert (=> b!245758 m!262783))

(assert (=> b!245519 d!60091))

(declare-fun d!60093 () Bool)

(assert (=> d!60093 (= (array_inv!3797 (_keys!6660 thiss!1504)) (bvsge (size!6101 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245523 d!60093))

(declare-fun d!60095 () Bool)

(assert (=> d!60095 (= (array_inv!3798 (_values!4529 thiss!1504)) (bvsge (size!6100 (_values!4529 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245523 d!60095))

(declare-fun d!60097 () Bool)

(assert (=> d!60097 (= (inRange!0 (ite c!41005 (index!6522 lt!122853) (index!6525 lt!122853)) (mask!10659 thiss!1504)) (and (bvsge (ite c!41005 (index!6522 lt!122853) (index!6525 lt!122853)) #b00000000000000000000000000000000) (bvslt (ite c!41005 (index!6522 lt!122853) (index!6525 lt!122853)) (bvadd (mask!10659 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22917 d!60097))

(declare-fun b!245794 () Bool)

(declare-fun lt!123005 () SeekEntryResult!1088)

(assert (=> b!245794 (and (bvsge (index!6522 lt!123005) #b00000000000000000000000000000000) (bvslt (index!6522 lt!123005) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun res!120518 () Bool)

(assert (=> b!245794 (= res!120518 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6522 lt!123005)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159461 () Bool)

(assert (=> b!245794 (=> (not res!120518) (not e!159461))))

(declare-fun b!245795 () Bool)

(declare-fun e!159459 () Bool)

(assert (=> b!245795 (= e!159459 ((_ is Undefined!1088) lt!123005))))

(declare-fun b!245796 () Bool)

(declare-fun call!22966 () Bool)

(assert (=> b!245796 (= e!159461 (not call!22966))))

(declare-fun b!245798 () Bool)

(declare-fun e!159460 () Bool)

(assert (=> b!245798 (= e!159460 (not call!22966))))

(declare-fun b!245799 () Bool)

(declare-fun e!159462 () Bool)

(assert (=> b!245799 (= e!159462 e!159459)))

(declare-fun c!41068 () Bool)

(assert (=> b!245799 (= c!41068 ((_ is MissingVacant!1088) lt!123005))))

(declare-fun bm!22963 () Bool)

(assert (=> bm!22963 (= call!22966 (arrayContainsKey!0 (_keys!6660 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun call!22967 () Bool)

(declare-fun c!41069 () Bool)

(declare-fun bm!22964 () Bool)

(assert (=> bm!22964 (= call!22967 (inRange!0 (ite c!41069 (index!6522 lt!123005) (index!6525 lt!123005)) (mask!10659 thiss!1504)))))

(declare-fun b!245797 () Bool)

(assert (=> b!245797 (= e!159462 e!159461)))

(declare-fun res!120519 () Bool)

(assert (=> b!245797 (= res!120519 call!22967)))

(assert (=> b!245797 (=> (not res!120519) (not e!159461))))

(declare-fun d!60099 () Bool)

(assert (=> d!60099 e!159462))

(assert (=> d!60099 (= c!41069 ((_ is MissingZero!1088) lt!123005))))

(assert (=> d!60099 (= lt!123005 (seekEntryOrOpen!0 key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(declare-fun lt!123006 () Unit!7576)

(declare-fun choose!1157 (array!12135 array!12133 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) Int) Unit!7576)

(assert (=> d!60099 (= lt!123006 (choose!1157 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)))))

(assert (=> d!60099 (validMask!0 (mask!10659 thiss!1504))))

(assert (=> d!60099 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!375 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)) lt!123006)))

(declare-fun b!245800 () Bool)

(declare-fun res!120517 () Bool)

(assert (=> b!245800 (=> (not res!120517) (not e!159460))))

(assert (=> b!245800 (= res!120517 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6525 lt!123005)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245800 (and (bvsge (index!6525 lt!123005) #b00000000000000000000000000000000) (bvslt (index!6525 lt!123005) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun b!245801 () Bool)

(declare-fun res!120520 () Bool)

(assert (=> b!245801 (=> (not res!120520) (not e!159460))))

(assert (=> b!245801 (= res!120520 call!22967)))

(assert (=> b!245801 (= e!159459 e!159460)))

(assert (= (and d!60099 c!41069) b!245797))

(assert (= (and d!60099 (not c!41069)) b!245799))

(assert (= (and b!245797 res!120519) b!245794))

(assert (= (and b!245794 res!120518) b!245796))

(assert (= (and b!245799 c!41068) b!245801))

(assert (= (and b!245799 (not c!41068)) b!245795))

(assert (= (and b!245801 res!120520) b!245800))

(assert (= (and b!245800 res!120517) b!245798))

(assert (= (or b!245797 b!245801) bm!22964))

(assert (= (or b!245796 b!245798) bm!22963))

(assert (=> bm!22963 m!262561))

(declare-fun m!262785 () Bool)

(assert (=> bm!22964 m!262785))

(declare-fun m!262787 () Bool)

(assert (=> b!245800 m!262787))

(declare-fun m!262789 () Bool)

(assert (=> b!245794 m!262789))

(assert (=> d!60099 m!262563))

(declare-fun m!262791 () Bool)

(assert (=> d!60099 m!262791))

(assert (=> d!60099 m!262565))

(assert (=> b!245515 d!60099))

(declare-fun b!245814 () Bool)

(declare-fun e!159470 () SeekEntryResult!1088)

(assert (=> b!245814 (= e!159470 Undefined!1088)))

(declare-fun b!245815 () Bool)

(declare-fun e!159469 () SeekEntryResult!1088)

(declare-fun lt!123014 () SeekEntryResult!1088)

(assert (=> b!245815 (= e!159469 (Found!1088 (index!6524 lt!123014)))))

(declare-fun d!60101 () Bool)

(declare-fun lt!123013 () SeekEntryResult!1088)

(assert (=> d!60101 (and (or ((_ is Undefined!1088) lt!123013) (not ((_ is Found!1088) lt!123013)) (and (bvsge (index!6523 lt!123013) #b00000000000000000000000000000000) (bvslt (index!6523 lt!123013) (size!6101 (_keys!6660 thiss!1504))))) (or ((_ is Undefined!1088) lt!123013) ((_ is Found!1088) lt!123013) (not ((_ is MissingZero!1088) lt!123013)) (and (bvsge (index!6522 lt!123013) #b00000000000000000000000000000000) (bvslt (index!6522 lt!123013) (size!6101 (_keys!6660 thiss!1504))))) (or ((_ is Undefined!1088) lt!123013) ((_ is Found!1088) lt!123013) ((_ is MissingZero!1088) lt!123013) (not ((_ is MissingVacant!1088) lt!123013)) (and (bvsge (index!6525 lt!123013) #b00000000000000000000000000000000) (bvslt (index!6525 lt!123013) (size!6101 (_keys!6660 thiss!1504))))) (or ((_ is Undefined!1088) lt!123013) (ite ((_ is Found!1088) lt!123013) (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6523 lt!123013)) key!932) (ite ((_ is MissingZero!1088) lt!123013) (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6522 lt!123013)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1088) lt!123013) (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6525 lt!123013)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60101 (= lt!123013 e!159470)))

(declare-fun c!41078 () Bool)

(assert (=> d!60101 (= c!41078 (and ((_ is Intermediate!1088) lt!123014) (undefined!1900 lt!123014)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12135 (_ BitVec 32)) SeekEntryResult!1088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60101 (= lt!123014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10659 thiss!1504)) key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(assert (=> d!60101 (validMask!0 (mask!10659 thiss!1504))))

(assert (=> d!60101 (= (seekEntryOrOpen!0 key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)) lt!123013)))

(declare-fun b!245816 () Bool)

(declare-fun c!41076 () Bool)

(declare-fun lt!123015 () (_ BitVec 64))

(assert (=> b!245816 (= c!41076 (= lt!123015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159471 () SeekEntryResult!1088)

(assert (=> b!245816 (= e!159469 e!159471)))

(declare-fun b!245817 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12135 (_ BitVec 32)) SeekEntryResult!1088)

(assert (=> b!245817 (= e!159471 (seekKeyOrZeroReturnVacant!0 (x!24435 lt!123014) (index!6524 lt!123014) (index!6524 lt!123014) key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(declare-fun b!245818 () Bool)

(assert (=> b!245818 (= e!159470 e!159469)))

(assert (=> b!245818 (= lt!123015 (select (arr!5758 (_keys!6660 thiss!1504)) (index!6524 lt!123014)))))

(declare-fun c!41077 () Bool)

(assert (=> b!245818 (= c!41077 (= lt!123015 key!932))))

(declare-fun b!245819 () Bool)

(assert (=> b!245819 (= e!159471 (MissingZero!1088 (index!6524 lt!123014)))))

(assert (= (and d!60101 c!41078) b!245814))

(assert (= (and d!60101 (not c!41078)) b!245818))

(assert (= (and b!245818 c!41077) b!245815))

(assert (= (and b!245818 (not c!41077)) b!245816))

(assert (= (and b!245816 c!41076) b!245819))

(assert (= (and b!245816 (not c!41076)) b!245817))

(declare-fun m!262793 () Bool)

(assert (=> d!60101 m!262793))

(declare-fun m!262795 () Bool)

(assert (=> d!60101 m!262795))

(assert (=> d!60101 m!262795))

(declare-fun m!262797 () Bool)

(assert (=> d!60101 m!262797))

(declare-fun m!262799 () Bool)

(assert (=> d!60101 m!262799))

(assert (=> d!60101 m!262565))

(declare-fun m!262801 () Bool)

(assert (=> d!60101 m!262801))

(declare-fun m!262803 () Bool)

(assert (=> b!245817 m!262803))

(declare-fun m!262805 () Bool)

(assert (=> b!245818 m!262805))

(assert (=> b!245524 d!60101))

(declare-fun d!60103 () Bool)

(declare-fun e!159474 () Bool)

(assert (=> d!60103 e!159474))

(declare-fun res!120525 () Bool)

(assert (=> d!60103 (=> (not res!120525) (not e!159474))))

(declare-fun lt!123021 () SeekEntryResult!1088)

(assert (=> d!60103 (= res!120525 ((_ is Found!1088) lt!123021))))

(assert (=> d!60103 (= lt!123021 (seekEntryOrOpen!0 key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(declare-fun lt!123020 () Unit!7576)

(declare-fun choose!1158 (array!12135 array!12133 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) Int) Unit!7576)

(assert (=> d!60103 (= lt!123020 (choose!1158 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)))))

(assert (=> d!60103 (validMask!0 (mask!10659 thiss!1504))))

(assert (=> d!60103 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!377 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)) lt!123020)))

(declare-fun b!245824 () Bool)

(declare-fun res!120526 () Bool)

(assert (=> b!245824 (=> (not res!120526) (not e!159474))))

(assert (=> b!245824 (= res!120526 (inRange!0 (index!6523 lt!123021) (mask!10659 thiss!1504)))))

(declare-fun b!245825 () Bool)

(assert (=> b!245825 (= e!159474 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6523 lt!123021)) key!932))))

(assert (=> b!245825 (and (bvsge (index!6523 lt!123021) #b00000000000000000000000000000000) (bvslt (index!6523 lt!123021) (size!6101 (_keys!6660 thiss!1504))))))

(assert (= (and d!60103 res!120525) b!245824))

(assert (= (and b!245824 res!120526) b!245825))

(assert (=> d!60103 m!262563))

(declare-fun m!262807 () Bool)

(assert (=> d!60103 m!262807))

(assert (=> d!60103 m!262565))

(declare-fun m!262809 () Bool)

(assert (=> b!245824 m!262809))

(declare-fun m!262811 () Bool)

(assert (=> b!245825 m!262811))

(assert (=> b!245520 d!60103))

(assert (=> bm!22918 d!60073))

(declare-fun d!60105 () Bool)

(declare-fun res!120533 () Bool)

(declare-fun e!159477 () Bool)

(assert (=> d!60105 (=> (not res!120533) (not e!159477))))

(declare-fun simpleValid!254 (LongMapFixedSize!3634) Bool)

(assert (=> d!60105 (= res!120533 (simpleValid!254 thiss!1504))))

(assert (=> d!60105 (= (valid!1432 thiss!1504) e!159477)))

(declare-fun b!245832 () Bool)

(declare-fun res!120534 () Bool)

(assert (=> b!245832 (=> (not res!120534) (not e!159477))))

(assert (=> b!245832 (= res!120534 (= (arrayCountValidKeys!0 (_keys!6660 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) (_size!1866 thiss!1504)))))

(declare-fun b!245833 () Bool)

(declare-fun res!120535 () Bool)

(assert (=> b!245833 (=> (not res!120535) (not e!159477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12135 (_ BitVec 32)) Bool)

(assert (=> b!245833 (= res!120535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(declare-fun b!245834 () Bool)

(assert (=> b!245834 (= e!159477 (arrayNoDuplicates!0 (_keys!6660 thiss!1504) #b00000000000000000000000000000000 Nil!3659))))

(assert (= (and d!60105 res!120533) b!245832))

(assert (= (and b!245832 res!120534) b!245833))

(assert (= (and b!245833 res!120535) b!245834))

(declare-fun m!262813 () Bool)

(assert (=> d!60105 m!262813))

(assert (=> b!245832 m!262575))

(declare-fun m!262815 () Bool)

(assert (=> b!245833 m!262815))

(declare-fun m!262817 () Bool)

(assert (=> b!245834 m!262817))

(assert (=> start!23370 d!60105))

(declare-fun mapNonEmpty!10903 () Bool)

(declare-fun mapRes!10903 () Bool)

(declare-fun tp!22927 () Bool)

(declare-fun e!159483 () Bool)

(assert (=> mapNonEmpty!10903 (= mapRes!10903 (and tp!22927 e!159483))))

(declare-fun mapValue!10903 () ValueCell!2867)

(declare-fun mapKey!10903 () (_ BitVec 32))

(declare-fun mapRest!10903 () (Array (_ BitVec 32) ValueCell!2867))

(assert (=> mapNonEmpty!10903 (= mapRest!10894 (store mapRest!10903 mapKey!10903 mapValue!10903))))

(declare-fun condMapEmpty!10903 () Bool)

(declare-fun mapDefault!10903 () ValueCell!2867)

(assert (=> mapNonEmpty!10894 (= condMapEmpty!10903 (= mapRest!10894 ((as const (Array (_ BitVec 32) ValueCell!2867)) mapDefault!10903)))))

(declare-fun e!159482 () Bool)

(assert (=> mapNonEmpty!10894 (= tp!22912 (and e!159482 mapRes!10903))))

(declare-fun mapIsEmpty!10903 () Bool)

(assert (=> mapIsEmpty!10903 mapRes!10903))

(declare-fun b!245841 () Bool)

(assert (=> b!245841 (= e!159483 tp_is_empty!6421)))

(declare-fun b!245842 () Bool)

(assert (=> b!245842 (= e!159482 tp_is_empty!6421)))

(assert (= (and mapNonEmpty!10894 condMapEmpty!10903) mapIsEmpty!10903))

(assert (= (and mapNonEmpty!10894 (not condMapEmpty!10903)) mapNonEmpty!10903))

(assert (= (and mapNonEmpty!10903 ((_ is ValueCellFull!2867) mapValue!10903)) b!245841))

(assert (= (and mapNonEmpty!10894 ((_ is ValueCellFull!2867) mapDefault!10903)) b!245842))

(declare-fun m!262819 () Bool)

(assert (=> mapNonEmpty!10903 m!262819))

(declare-fun b_lambda!8011 () Bool)

(assert (= b_lambda!8009 (or (and b!245523 b_free!6559) b_lambda!8011)))

(check-sat (not bm!22963) (not b!245767) b_and!13529 (not d!60105) (not bm!22936) (not b!245774) (not b!245761) (not bm!22937) (not b!245765) (not d!60089) (not b!245824) (not b!245660) (not b!245758) (not b!245712) (not mapNonEmpty!10903) (not bm!22958) (not bm!22955) (not b!245769) (not b!245661) (not b!245710) (not b_next!6559) (not d!60071) (not d!60091) (not bm!22956) (not b!245669) (not b!245680) (not bm!22957) (not d!60099) (not b!245663) (not d!60103) tp_is_empty!6421 (not d!60083) (not d!60085) (not b!245681) (not b!245698) (not b!245817) (not b!245833) (not b!245703) (not b!245682) (not bm!22933) (not bm!22964) (not d!60101) (not b!245760) (not b!245694) (not b_lambda!8011) (not b!245834) (not b!245756) (not b!245832))
(check-sat b_and!13529 (not b_next!6559))
(get-model)

(declare-fun d!60107 () Bool)

(assert (=> d!60107 (= (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245765 d!60107))

(assert (=> d!60085 d!60089))

(assert (=> d!60085 d!60091))

(declare-fun d!60109 () Bool)

(assert (=> d!60109 (contains!1760 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) key!932)))

(assert (=> d!60109 true))

(declare-fun _$17!68 () Unit!7576)

(assert (=> d!60109 (= (choose!1156 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) _$17!68)))

(declare-fun bs!8871 () Bool)

(assert (= bs!8871 d!60109))

(assert (=> bs!8871 m!262597))

(assert (=> bs!8871 m!262597))

(assert (=> bs!8871 m!262599))

(assert (=> d!60085 d!60109))

(assert (=> d!60085 d!60079))

(declare-fun d!60111 () Bool)

(assert (=> d!60111 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245661 d!60111))

(declare-fun d!60113 () Bool)

(assert (=> d!60113 (= (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) index!297)) (and (not (= (select (arr!5758 (_keys!6660 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5758 (_keys!6660 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245660 d!60113))

(declare-fun d!60115 () Bool)

(declare-fun isEmpty!526 (Option!293) Bool)

(assert (=> d!60115 (= (isDefined!229 (getValueByKey!287 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932)) (not (isEmpty!526 (getValueByKey!287 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))))

(declare-fun bs!8872 () Bool)

(assert (= bs!8872 d!60115))

(assert (=> bs!8872 m!262727))

(declare-fun m!262821 () Bool)

(assert (=> bs!8872 m!262821))

(assert (=> b!245712 d!60115))

(declare-fun b!245852 () Bool)

(declare-fun e!159488 () Option!293)

(declare-fun e!159489 () Option!293)

(assert (=> b!245852 (= e!159488 e!159489)))

(declare-fun c!41084 () Bool)

(assert (=> b!245852 (= c!41084 (and ((_ is Cons!3657) (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) (not (= (_1!2390 (h!4314 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932))))))

(declare-fun b!245853 () Bool)

(assert (=> b!245853 (= e!159489 (getValueByKey!287 (t!8667 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) key!932))))

(declare-fun b!245851 () Bool)

(assert (=> b!245851 (= e!159488 (Some!292 (_2!2390 (h!4314 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))))))

(declare-fun b!245854 () Bool)

(assert (=> b!245854 (= e!159489 None!291)))

(declare-fun d!60117 () Bool)

(declare-fun c!41083 () Bool)

(assert (=> d!60117 (= c!41083 (and ((_ is Cons!3657) (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) (= (_1!2390 (h!4314 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932)))))

(assert (=> d!60117 (= (getValueByKey!287 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932) e!159488)))

(assert (= (and d!60117 c!41083) b!245851))

(assert (= (and d!60117 (not c!41083)) b!245852))

(assert (= (and b!245852 c!41084) b!245853))

(assert (= (and b!245852 (not c!41084)) b!245854))

(declare-fun m!262823 () Bool)

(assert (=> b!245853 m!262823))

(assert (=> b!245712 d!60117))

(declare-fun d!60119 () Bool)

(assert (=> d!60119 (arrayNoDuplicates!0 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))) #b00000000000000000000000000000000 Nil!3659)))

(assert (=> d!60119 true))

(declare-fun _$65!71 () Unit!7576)

(assert (=> d!60119 (= (choose!41 (_keys!6660 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3659) _$65!71)))

(declare-fun bs!8873 () Bool)

(assert (= bs!8873 d!60119))

(assert (=> bs!8873 m!262573))

(assert (=> bs!8873 m!262719))

(assert (=> d!60083 d!60119))

(declare-fun d!60121 () Bool)

(declare-fun get!2952 (Option!293) V!8209)

(assert (=> d!60121 (= (apply!231 lt!122982 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)) (get!2952 (getValueByKey!287 (toList!1846 lt!122982) (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8874 () Bool)

(assert (= bs!8874 d!60121))

(assert (=> bs!8874 m!262699))

(declare-fun m!262825 () Bool)

(assert (=> bs!8874 m!262825))

(assert (=> bs!8874 m!262825))

(declare-fun m!262827 () Bool)

(assert (=> bs!8874 m!262827))

(assert (=> b!245761 d!60121))

(declare-fun d!60123 () Bool)

(declare-fun c!41087 () Bool)

(assert (=> d!60123 (= c!41087 ((_ is ValueCellFull!2867) (select (arr!5757 (_values!4529 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!159492 () V!8209)

(assert (=> d!60123 (= (get!2951 (select (arr!5757 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!159492)))

(declare-fun b!245859 () Bool)

(declare-fun get!2953 (ValueCell!2867 V!8209) V!8209)

(assert (=> b!245859 (= e!159492 (get!2953 (select (arr!5757 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!245860 () Bool)

(declare-fun get!2954 (ValueCell!2867 V!8209) V!8209)

(assert (=> b!245860 (= e!159492 (get!2954 (select (arr!5757 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60123 c!41087) b!245859))

(assert (= (and d!60123 (not c!41087)) b!245860))

(assert (=> b!245859 m!262777))

(assert (=> b!245859 m!262775))

(declare-fun m!262829 () Bool)

(assert (=> b!245859 m!262829))

(assert (=> b!245860 m!262777))

(assert (=> b!245860 m!262775))

(declare-fun m!262831 () Bool)

(assert (=> b!245860 m!262831))

(assert (=> b!245761 d!60123))

(declare-fun d!60125 () Bool)

(assert (=> d!60125 (isDefined!229 (getValueByKey!287 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(declare-fun lt!123024 () Unit!7576)

(declare-fun choose!1159 (List!3661 (_ BitVec 64)) Unit!7576)

(assert (=> d!60125 (= lt!123024 (choose!1159 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(declare-fun e!159495 () Bool)

(assert (=> d!60125 e!159495))

(declare-fun res!120538 () Bool)

(assert (=> d!60125 (=> (not res!120538) (not e!159495))))

(declare-fun isStrictlySorted!363 (List!3661) Bool)

(assert (=> d!60125 (= res!120538 (isStrictlySorted!363 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))))

(assert (=> d!60125 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!228 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932) lt!123024)))

(declare-fun b!245863 () Bool)

(assert (=> b!245863 (= e!159495 (containsKey!279 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(assert (= (and d!60125 res!120538) b!245863))

(assert (=> d!60125 m!262727))

(assert (=> d!60125 m!262727))

(assert (=> d!60125 m!262729))

(declare-fun m!262833 () Bool)

(assert (=> d!60125 m!262833))

(declare-fun m!262835 () Bool)

(assert (=> d!60125 m!262835))

(assert (=> b!245863 m!262723))

(assert (=> b!245710 d!60125))

(assert (=> b!245710 d!60115))

(assert (=> b!245710 d!60117))

(declare-fun d!60127 () Bool)

(declare-fun e!159498 () Bool)

(assert (=> d!60127 e!159498))

(declare-fun res!120544 () Bool)

(assert (=> d!60127 (=> (not res!120544) (not e!159498))))

(declare-fun lt!123034 () ListLongMap!3661)

(assert (=> d!60127 (= res!120544 (contains!1760 lt!123034 (_1!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(declare-fun lt!123035 () List!3661)

(assert (=> d!60127 (= lt!123034 (ListLongMap!3662 lt!123035))))

(declare-fun lt!123036 () Unit!7576)

(declare-fun lt!123033 () Unit!7576)

(assert (=> d!60127 (= lt!123036 lt!123033)))

(assert (=> d!60127 (= (getValueByKey!287 lt!123035 (_1!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!157 (List!3661 (_ BitVec 64) V!8209) Unit!7576)

(assert (=> d!60127 (= lt!123033 (lemmaContainsTupThenGetReturnValue!157 lt!123035 (_1!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(declare-fun insertStrictlySorted!160 (List!3661 (_ BitVec 64) V!8209) List!3661)

(assert (=> d!60127 (= lt!123035 (insertStrictlySorted!160 (toList!1846 call!22959) (_1!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(assert (=> d!60127 (= (+!664 call!22959 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))) lt!123034)))

(declare-fun b!245868 () Bool)

(declare-fun res!120543 () Bool)

(assert (=> b!245868 (=> (not res!120543) (not e!159498))))

(assert (=> b!245868 (= res!120543 (= (getValueByKey!287 (toList!1846 lt!123034) (_1!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(declare-fun b!245869 () Bool)

(declare-fun contains!1764 (List!3661 tuple2!4758) Bool)

(assert (=> b!245869 (= e!159498 (contains!1764 (toList!1846 lt!123034) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))

(assert (= (and d!60127 res!120544) b!245868))

(assert (= (and b!245868 res!120543) b!245869))

(declare-fun m!262837 () Bool)

(assert (=> d!60127 m!262837))

(declare-fun m!262839 () Bool)

(assert (=> d!60127 m!262839))

(declare-fun m!262841 () Bool)

(assert (=> d!60127 m!262841))

(declare-fun m!262843 () Bool)

(assert (=> d!60127 m!262843))

(declare-fun m!262845 () Bool)

(assert (=> b!245868 m!262845))

(declare-fun m!262847 () Bool)

(assert (=> b!245869 m!262847))

(assert (=> b!245760 d!60127))

(declare-fun b!245870 () Bool)

(declare-fun e!159502 () Bool)

(declare-fun e!159500 () Bool)

(assert (=> b!245870 (= e!159502 e!159500)))

(declare-fun c!41088 () Bool)

(assert (=> b!245870 (= c!41088 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245871 () Bool)

(declare-fun e!159501 () Bool)

(assert (=> b!245871 (= e!159501 (contains!1763 Nil!3659 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245872 () Bool)

(declare-fun e!159499 () Bool)

(assert (=> b!245872 (= e!159499 e!159502)))

(declare-fun res!120546 () Bool)

(assert (=> b!245872 (=> (not res!120546) (not e!159502))))

(assert (=> b!245872 (= res!120546 (not e!159501))))

(declare-fun res!120547 () Bool)

(assert (=> b!245872 (=> (not res!120547) (not e!159501))))

(assert (=> b!245872 (= res!120547 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22965 () Bool)

(declare-fun call!22968 () Bool)

(assert (=> bm!22965 (= call!22968 (arrayNoDuplicates!0 (_keys!6660 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41088 (Cons!3658 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000) Nil!3659) Nil!3659)))))

(declare-fun d!60129 () Bool)

(declare-fun res!120545 () Bool)

(assert (=> d!60129 (=> res!120545 e!159499)))

(assert (=> d!60129 (= res!120545 (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60129 (= (arrayNoDuplicates!0 (_keys!6660 thiss!1504) #b00000000000000000000000000000000 Nil!3659) e!159499)))

(declare-fun b!245873 () Bool)

(assert (=> b!245873 (= e!159500 call!22968)))

(declare-fun b!245874 () Bool)

(assert (=> b!245874 (= e!159500 call!22968)))

(assert (= (and d!60129 (not res!120545)) b!245872))

(assert (= (and b!245872 res!120547) b!245871))

(assert (= (and b!245872 res!120546) b!245870))

(assert (= (and b!245870 c!41088) b!245873))

(assert (= (and b!245870 (not c!41088)) b!245874))

(assert (= (or b!245873 b!245874) bm!22965))

(assert (=> b!245870 m!262699))

(assert (=> b!245870 m!262699))

(assert (=> b!245870 m!262713))

(assert (=> b!245871 m!262699))

(assert (=> b!245871 m!262699))

(declare-fun m!262849 () Bool)

(assert (=> b!245871 m!262849))

(assert (=> b!245872 m!262699))

(assert (=> b!245872 m!262699))

(assert (=> b!245872 m!262713))

(assert (=> bm!22965 m!262699))

(declare-fun m!262851 () Bool)

(assert (=> bm!22965 m!262851))

(assert (=> b!245834 d!60129))

(declare-fun d!60131 () Bool)

(assert (=> d!60131 (= (validKeyInArray!0 (select (arr!5758 lt!122854) #b00000000000000000000000000000000)) (and (not (= (select (arr!5758 lt!122854) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5758 lt!122854) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245682 d!60131))

(declare-fun d!60133 () Bool)

(declare-fun e!159504 () Bool)

(assert (=> d!60133 e!159504))

(declare-fun res!120548 () Bool)

(assert (=> d!60133 (=> res!120548 e!159504)))

(declare-fun lt!123038 () Bool)

(assert (=> d!60133 (= res!120548 (not lt!123038))))

(declare-fun lt!123037 () Bool)

(assert (=> d!60133 (= lt!123038 lt!123037)))

(declare-fun lt!123039 () Unit!7576)

(declare-fun e!159503 () Unit!7576)

(assert (=> d!60133 (= lt!123039 e!159503)))

(declare-fun c!41089 () Bool)

(assert (=> d!60133 (= c!41089 lt!123037)))

(assert (=> d!60133 (= lt!123037 (containsKey!279 (toList!1846 lt!122982) (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60133 (= (contains!1760 lt!122982 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)) lt!123038)))

(declare-fun b!245875 () Bool)

(declare-fun lt!123040 () Unit!7576)

(assert (=> b!245875 (= e!159503 lt!123040)))

(assert (=> b!245875 (= lt!123040 (lemmaContainsKeyImpliesGetValueByKeyDefined!228 (toList!1846 lt!122982) (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245875 (isDefined!229 (getValueByKey!287 (toList!1846 lt!122982) (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245876 () Bool)

(declare-fun Unit!7591 () Unit!7576)

(assert (=> b!245876 (= e!159503 Unit!7591)))

(declare-fun b!245877 () Bool)

(assert (=> b!245877 (= e!159504 (isDefined!229 (getValueByKey!287 (toList!1846 lt!122982) (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60133 c!41089) b!245875))

(assert (= (and d!60133 (not c!41089)) b!245876))

(assert (= (and d!60133 (not res!120548)) b!245877))

(assert (=> d!60133 m!262699))

(declare-fun m!262853 () Bool)

(assert (=> d!60133 m!262853))

(assert (=> b!245875 m!262699))

(declare-fun m!262855 () Bool)

(assert (=> b!245875 m!262855))

(assert (=> b!245875 m!262699))

(assert (=> b!245875 m!262825))

(assert (=> b!245875 m!262825))

(declare-fun m!262857 () Bool)

(assert (=> b!245875 m!262857))

(assert (=> b!245877 m!262699))

(assert (=> b!245877 m!262825))

(assert (=> b!245877 m!262825))

(assert (=> b!245877 m!262857))

(assert (=> b!245769 d!60133))

(declare-fun d!60135 () Bool)

(declare-fun res!120553 () Bool)

(declare-fun e!159509 () Bool)

(assert (=> d!60135 (=> res!120553 e!159509)))

(assert (=> d!60135 (= res!120553 (and ((_ is Cons!3657) (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) (= (_1!2390 (h!4314 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932)))))

(assert (=> d!60135 (= (containsKey!279 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932) e!159509)))

(declare-fun b!245882 () Bool)

(declare-fun e!159510 () Bool)

(assert (=> b!245882 (= e!159509 e!159510)))

(declare-fun res!120554 () Bool)

(assert (=> b!245882 (=> (not res!120554) (not e!159510))))

(assert (=> b!245882 (= res!120554 (and (or (not ((_ is Cons!3657) (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) (bvsle (_1!2390 (h!4314 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932)) ((_ is Cons!3657) (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) (bvslt (_1!2390 (h!4314 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932)))))

(declare-fun b!245883 () Bool)

(assert (=> b!245883 (= e!159510 (containsKey!279 (t!8667 (toList!1846 (getCurrentListMap!1355 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) key!932))))

(assert (= (and d!60135 (not res!120553)) b!245882))

(assert (= (and b!245882 res!120554) b!245883))

(declare-fun m!262859 () Bool)

(assert (=> b!245883 m!262859))

(assert (=> d!60089 d!60135))

(declare-fun d!60137 () Bool)

(declare-fun lt!123043 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!163 (List!3662) (InoxSet (_ BitVec 64)))

(assert (=> d!60137 (= lt!123043 (select (content!163 Nil!3659) (select (arr!5758 lt!122854) #b00000000000000000000000000000000)))))

(declare-fun e!159516 () Bool)

(assert (=> d!60137 (= lt!123043 e!159516)))

(declare-fun res!120559 () Bool)

(assert (=> d!60137 (=> (not res!120559) (not e!159516))))

(assert (=> d!60137 (= res!120559 ((_ is Cons!3658) Nil!3659))))

(assert (=> d!60137 (= (contains!1763 Nil!3659 (select (arr!5758 lt!122854) #b00000000000000000000000000000000)) lt!123043)))

(declare-fun b!245888 () Bool)

(declare-fun e!159515 () Bool)

(assert (=> b!245888 (= e!159516 e!159515)))

(declare-fun res!120560 () Bool)

(assert (=> b!245888 (=> res!120560 e!159515)))

(assert (=> b!245888 (= res!120560 (= (h!4315 Nil!3659) (select (arr!5758 lt!122854) #b00000000000000000000000000000000)))))

(declare-fun b!245889 () Bool)

(assert (=> b!245889 (= e!159515 (contains!1763 (t!8668 Nil!3659) (select (arr!5758 lt!122854) #b00000000000000000000000000000000)))))

(assert (= (and d!60137 res!120559) b!245888))

(assert (= (and b!245888 (not res!120560)) b!245889))

(declare-fun m!262861 () Bool)

(assert (=> d!60137 m!262861))

(assert (=> d!60137 m!262703))

(declare-fun m!262863 () Bool)

(assert (=> d!60137 m!262863))

(assert (=> b!245889 m!262703))

(declare-fun m!262865 () Bool)

(assert (=> b!245889 m!262865))

(assert (=> b!245681 d!60137))

(declare-fun b!245898 () Bool)

(declare-fun e!159525 () Bool)

(declare-fun call!22971 () Bool)

(assert (=> b!245898 (= e!159525 call!22971)))

(declare-fun b!245899 () Bool)

(declare-fun e!159523 () Bool)

(assert (=> b!245899 (= e!159523 e!159525)))

(declare-fun c!41092 () Bool)

(assert (=> b!245899 (= c!41092 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22968 () Bool)

(assert (=> bm!22968 (= call!22971 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(declare-fun b!245900 () Bool)

(declare-fun e!159524 () Bool)

(assert (=> b!245900 (= e!159524 call!22971)))

(declare-fun b!245901 () Bool)

(assert (=> b!245901 (= e!159525 e!159524)))

(declare-fun lt!123051 () (_ BitVec 64))

(assert (=> b!245901 (= lt!123051 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123052 () Unit!7576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12135 (_ BitVec 64) (_ BitVec 32)) Unit!7576)

(assert (=> b!245901 (= lt!123052 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6660 thiss!1504) lt!123051 #b00000000000000000000000000000000))))

(assert (=> b!245901 (arrayContainsKey!0 (_keys!6660 thiss!1504) lt!123051 #b00000000000000000000000000000000)))

(declare-fun lt!123050 () Unit!7576)

(assert (=> b!245901 (= lt!123050 lt!123052)))

(declare-fun res!120566 () Bool)

(assert (=> b!245901 (= res!120566 (= (seekEntryOrOpen!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000) (_keys!6660 thiss!1504) (mask!10659 thiss!1504)) (Found!1088 #b00000000000000000000000000000000)))))

(assert (=> b!245901 (=> (not res!120566) (not e!159524))))

(declare-fun d!60139 () Bool)

(declare-fun res!120565 () Bool)

(assert (=> d!60139 (=> res!120565 e!159523)))

(assert (=> d!60139 (= res!120565 (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60139 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)) e!159523)))

(assert (= (and d!60139 (not res!120565)) b!245899))

(assert (= (and b!245899 c!41092) b!245901))

(assert (= (and b!245899 (not c!41092)) b!245898))

(assert (= (and b!245901 res!120566) b!245900))

(assert (= (or b!245900 b!245898) bm!22968))

(assert (=> b!245899 m!262699))

(assert (=> b!245899 m!262699))

(assert (=> b!245899 m!262713))

(declare-fun m!262867 () Bool)

(assert (=> bm!22968 m!262867))

(assert (=> b!245901 m!262699))

(declare-fun m!262869 () Bool)

(assert (=> b!245901 m!262869))

(declare-fun m!262871 () Bool)

(assert (=> b!245901 m!262871))

(assert (=> b!245901 m!262699))

(declare-fun m!262873 () Bool)

(assert (=> b!245901 m!262873))

(assert (=> b!245833 d!60139))

(assert (=> b!245832 d!60077))

(assert (=> b!245680 d!60131))

(declare-fun b!245910 () Bool)

(declare-fun res!120575 () Bool)

(declare-fun e!159528 () Bool)

(assert (=> b!245910 (=> (not res!120575) (not e!159528))))

(assert (=> b!245910 (= res!120575 (and (= (size!6100 (_values!4529 thiss!1504)) (bvadd (mask!10659 thiss!1504) #b00000000000000000000000000000001)) (= (size!6101 (_keys!6660 thiss!1504)) (size!6100 (_values!4529 thiss!1504))) (bvsge (_size!1866 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1866 thiss!1504) (bvadd (mask!10659 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!245913 () Bool)

(assert (=> b!245913 (= e!159528 (and (bvsge (extraKeys!4283 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4283 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1866 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!60141 () Bool)

(declare-fun res!120578 () Bool)

(assert (=> d!60141 (=> (not res!120578) (not e!159528))))

(assert (=> d!60141 (= res!120578 (validMask!0 (mask!10659 thiss!1504)))))

(assert (=> d!60141 (= (simpleValid!254 thiss!1504) e!159528)))

(declare-fun b!245911 () Bool)

(declare-fun res!120576 () Bool)

(assert (=> b!245911 (=> (not res!120576) (not e!159528))))

(declare-fun size!6106 (LongMapFixedSize!3634) (_ BitVec 32))

(assert (=> b!245911 (= res!120576 (bvsge (size!6106 thiss!1504) (_size!1866 thiss!1504)))))

(declare-fun b!245912 () Bool)

(declare-fun res!120577 () Bool)

(assert (=> b!245912 (=> (not res!120577) (not e!159528))))

(assert (=> b!245912 (= res!120577 (= (size!6106 thiss!1504) (bvadd (_size!1866 thiss!1504) (bvsdiv (bvadd (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!60141 res!120578) b!245910))

(assert (= (and b!245910 res!120575) b!245911))

(assert (= (and b!245911 res!120576) b!245912))

(assert (= (and b!245912 res!120577) b!245913))

(assert (=> d!60141 m!262565))

(declare-fun m!262875 () Bool)

(assert (=> b!245911 m!262875))

(assert (=> b!245912 m!262875))

(assert (=> d!60105 d!60141))

(assert (=> b!245767 d!60107))

(declare-fun call!22972 () (_ BitVec 32))

(declare-fun bm!22969 () Bool)

(assert (=> bm!22969 (= call!22972 (arrayCountValidKeys!0 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun d!60143 () Bool)

(declare-fun lt!123053 () (_ BitVec 32))

(assert (=> d!60143 (and (bvsge lt!123053 #b00000000000000000000000000000000) (bvsle lt!123053 (bvsub (size!6101 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!159529 () (_ BitVec 32))

(assert (=> d!60143 (= lt!123053 e!159529)))

(declare-fun c!41093 () Bool)

(assert (=> d!60143 (= c!41093 (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60143 (and (bvsle #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6101 (_keys!6660 thiss!1504)) (size!6101 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))))))))

(assert (=> d!60143 (= (arrayCountValidKeys!0 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))) #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) lt!123053)))

(declare-fun b!245914 () Bool)

(assert (=> b!245914 (= e!159529 #b00000000000000000000000000000000)))

(declare-fun b!245915 () Bool)

(declare-fun e!159530 () (_ BitVec 32))

(assert (=> b!245915 (= e!159529 e!159530)))

(declare-fun c!41094 () Bool)

(assert (=> b!245915 (= c!41094 (validKeyInArray!0 (select (arr!5758 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!245916 () Bool)

(assert (=> b!245916 (= e!159530 call!22972)))

(declare-fun b!245917 () Bool)

(assert (=> b!245917 (= e!159530 (bvadd #b00000000000000000000000000000001 call!22972))))

(assert (= (and d!60143 c!41093) b!245914))

(assert (= (and d!60143 (not c!41093)) b!245915))

(assert (= (and b!245915 c!41094) b!245917))

(assert (= (and b!245915 (not c!41094)) b!245916))

(assert (= (or b!245917 b!245916) bm!22969))

(declare-fun m!262877 () Bool)

(assert (=> bm!22969 m!262877))

(declare-fun m!262879 () Bool)

(assert (=> b!245915 m!262879))

(assert (=> b!245915 m!262879))

(declare-fun m!262881 () Bool)

(assert (=> b!245915 m!262881))

(assert (=> b!245663 d!60143))

(assert (=> b!245663 d!60077))

(declare-fun b!245936 () Bool)

(declare-fun e!159542 () SeekEntryResult!1088)

(assert (=> b!245936 (= e!159542 (Intermediate!1088 false (toIndex!0 key!932 (mask!10659 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!245937 () Bool)

(declare-fun lt!123058 () SeekEntryResult!1088)

(assert (=> b!245937 (and (bvsge (index!6524 lt!123058) #b00000000000000000000000000000000) (bvslt (index!6524 lt!123058) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun e!159544 () Bool)

(assert (=> b!245937 (= e!159544 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6524 lt!123058)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245938 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245938 (= e!159542 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10659 thiss!1504)) #b00000000000000000000000000000000 (mask!10659 thiss!1504)) key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(declare-fun b!245939 () Bool)

(declare-fun e!159545 () SeekEntryResult!1088)

(assert (=> b!245939 (= e!159545 (Intermediate!1088 true (toIndex!0 key!932 (mask!10659 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!245940 () Bool)

(assert (=> b!245940 (= e!159545 e!159542)))

(declare-fun c!41101 () Bool)

(declare-fun lt!123059 () (_ BitVec 64))

(assert (=> b!245940 (= c!41101 (or (= lt!123059 key!932) (= (bvadd lt!123059 lt!123059) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!60145 () Bool)

(declare-fun e!159543 () Bool)

(assert (=> d!60145 e!159543))

(declare-fun c!41102 () Bool)

(assert (=> d!60145 (= c!41102 (and ((_ is Intermediate!1088) lt!123058) (undefined!1900 lt!123058)))))

(assert (=> d!60145 (= lt!123058 e!159545)))

(declare-fun c!41103 () Bool)

(assert (=> d!60145 (= c!41103 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!60145 (= lt!123059 (select (arr!5758 (_keys!6660 thiss!1504)) (toIndex!0 key!932 (mask!10659 thiss!1504))))))

(assert (=> d!60145 (validMask!0 (mask!10659 thiss!1504))))

(assert (=> d!60145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10659 thiss!1504)) key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)) lt!123058)))

(declare-fun b!245941 () Bool)

(declare-fun e!159541 () Bool)

(assert (=> b!245941 (= e!159543 e!159541)))

(declare-fun res!120585 () Bool)

(assert (=> b!245941 (= res!120585 (and ((_ is Intermediate!1088) lt!123058) (not (undefined!1900 lt!123058)) (bvslt (x!24435 lt!123058) #b01111111111111111111111111111110) (bvsge (x!24435 lt!123058) #b00000000000000000000000000000000) (bvsge (x!24435 lt!123058) #b00000000000000000000000000000000)))))

(assert (=> b!245941 (=> (not res!120585) (not e!159541))))

(declare-fun b!245942 () Bool)

(assert (=> b!245942 (= e!159543 (bvsge (x!24435 lt!123058) #b01111111111111111111111111111110))))

(declare-fun b!245943 () Bool)

(assert (=> b!245943 (and (bvsge (index!6524 lt!123058) #b00000000000000000000000000000000) (bvslt (index!6524 lt!123058) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun res!120587 () Bool)

(assert (=> b!245943 (= res!120587 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6524 lt!123058)) key!932))))

(assert (=> b!245943 (=> res!120587 e!159544)))

(assert (=> b!245943 (= e!159541 e!159544)))

(declare-fun b!245944 () Bool)

(assert (=> b!245944 (and (bvsge (index!6524 lt!123058) #b00000000000000000000000000000000) (bvslt (index!6524 lt!123058) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun res!120586 () Bool)

(assert (=> b!245944 (= res!120586 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6524 lt!123058)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245944 (=> res!120586 e!159544)))

(assert (= (and d!60145 c!41103) b!245939))

(assert (= (and d!60145 (not c!41103)) b!245940))

(assert (= (and b!245940 c!41101) b!245936))

(assert (= (and b!245940 (not c!41101)) b!245938))

(assert (= (and d!60145 c!41102) b!245942))

(assert (= (and d!60145 (not c!41102)) b!245941))

(assert (= (and b!245941 res!120585) b!245943))

(assert (= (and b!245943 (not res!120587)) b!245944))

(assert (= (and b!245944 (not res!120586)) b!245937))

(assert (=> d!60145 m!262795))

(declare-fun m!262883 () Bool)

(assert (=> d!60145 m!262883))

(assert (=> d!60145 m!262565))

(assert (=> b!245938 m!262795))

(declare-fun m!262885 () Bool)

(assert (=> b!245938 m!262885))

(assert (=> b!245938 m!262885))

(declare-fun m!262887 () Bool)

(assert (=> b!245938 m!262887))

(declare-fun m!262889 () Bool)

(assert (=> b!245944 m!262889))

(assert (=> b!245943 m!262889))

(assert (=> b!245937 m!262889))

(assert (=> d!60101 d!60145))

(declare-fun d!60147 () Bool)

(declare-fun lt!123065 () (_ BitVec 32))

(declare-fun lt!123064 () (_ BitVec 32))

(assert (=> d!60147 (= lt!123065 (bvmul (bvxor lt!123064 (bvlshr lt!123064 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60147 (= lt!123064 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60147 (and (bvsge (mask!10659 thiss!1504) #b00000000000000000000000000000000) (let ((res!120588 (let ((h!4320 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24453 (bvmul (bvxor h!4320 (bvlshr h!4320 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24453 (bvlshr x!24453 #b00000000000000000000000000001101)) (mask!10659 thiss!1504)))))) (and (bvslt res!120588 (bvadd (mask!10659 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!120588 #b00000000000000000000000000000000))))))

(assert (=> d!60147 (= (toIndex!0 key!932 (mask!10659 thiss!1504)) (bvand (bvxor lt!123065 (bvlshr lt!123065 #b00000000000000000000000000001101)) (mask!10659 thiss!1504)))))

(assert (=> d!60101 d!60147))

(assert (=> d!60101 d!60079))

(declare-fun d!60149 () Bool)

(assert (=> d!60149 (= (inRange!0 (ite c!41069 (index!6522 lt!123005) (index!6525 lt!123005)) (mask!10659 thiss!1504)) (and (bvsge (ite c!41069 (index!6522 lt!123005) (index!6525 lt!123005)) #b00000000000000000000000000000000) (bvslt (ite c!41069 (index!6522 lt!123005) (index!6525 lt!123005)) (bvadd (mask!10659 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22964 d!60149))

(declare-fun bm!22970 () Bool)

(declare-fun call!22973 () (_ BitVec 32))

(assert (=> bm!22970 (= call!22973 (arrayCountValidKeys!0 lt!122854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun d!60151 () Bool)

(declare-fun lt!123066 () (_ BitVec 32))

(assert (=> d!60151 (and (bvsge lt!123066 #b00000000000000000000000000000000) (bvsle lt!123066 (bvsub (size!6101 lt!122854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!159546 () (_ BitVec 32))

(assert (=> d!60151 (= lt!123066 e!159546)))

(declare-fun c!41104 () Bool)

(assert (=> d!60151 (= c!41104 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60151 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6101 (_keys!6660 thiss!1504)) (size!6101 lt!122854)))))

(assert (=> d!60151 (= (arrayCountValidKeys!0 lt!122854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))) lt!123066)))

(declare-fun b!245945 () Bool)

(assert (=> b!245945 (= e!159546 #b00000000000000000000000000000000)))

(declare-fun b!245946 () Bool)

(declare-fun e!159547 () (_ BitVec 32))

(assert (=> b!245946 (= e!159546 e!159547)))

(declare-fun c!41105 () Bool)

(assert (=> b!245946 (= c!41105 (validKeyInArray!0 (select (arr!5758 lt!122854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!245947 () Bool)

(assert (=> b!245947 (= e!159547 call!22973)))

(declare-fun b!245948 () Bool)

(assert (=> b!245948 (= e!159547 (bvadd #b00000000000000000000000000000001 call!22973))))

(assert (= (and d!60151 c!41104) b!245945))

(assert (= (and d!60151 (not c!41104)) b!245946))

(assert (= (and b!245946 c!41105) b!245948))

(assert (= (and b!245946 (not c!41105)) b!245947))

(assert (= (or b!245948 b!245947) bm!22970))

(declare-fun m!262891 () Bool)

(assert (=> bm!22970 m!262891))

(declare-fun m!262893 () Bool)

(assert (=> b!245946 m!262893))

(assert (=> b!245946 m!262893))

(declare-fun m!262895 () Bool)

(assert (=> b!245946 m!262895))

(assert (=> bm!22937 d!60151))

(assert (=> bm!22963 d!60073))

(declare-fun bm!22971 () Bool)

(declare-fun call!22974 () (_ BitVec 32))

(assert (=> bm!22971 (= call!22974 (arrayCountValidKeys!0 (_keys!6660 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun d!60153 () Bool)

(declare-fun lt!123067 () (_ BitVec 32))

(assert (=> d!60153 (and (bvsge lt!123067 #b00000000000000000000000000000000) (bvsle lt!123067 (bvsub (size!6101 (_keys!6660 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!159548 () (_ BitVec 32))

(assert (=> d!60153 (= lt!123067 e!159548)))

(declare-fun c!41106 () Bool)

(assert (=> d!60153 (= c!41106 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60153 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6101 (_keys!6660 thiss!1504)) (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60153 (= (arrayCountValidKeys!0 (_keys!6660 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))) lt!123067)))

(declare-fun b!245949 () Bool)

(assert (=> b!245949 (= e!159548 #b00000000000000000000000000000000)))

(declare-fun b!245950 () Bool)

(declare-fun e!159549 () (_ BitVec 32))

(assert (=> b!245950 (= e!159548 e!159549)))

(declare-fun c!41107 () Bool)

(assert (=> b!245950 (= c!41107 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!245951 () Bool)

(assert (=> b!245951 (= e!159549 call!22974)))

(declare-fun b!245952 () Bool)

(assert (=> b!245952 (= e!159549 (bvadd #b00000000000000000000000000000001 call!22974))))

(assert (= (and d!60153 c!41106) b!245949))

(assert (= (and d!60153 (not c!41106)) b!245950))

(assert (= (and b!245950 c!41107) b!245952))

(assert (= (and b!245950 (not c!41107)) b!245951))

(assert (= (or b!245952 b!245951) bm!22971))

(declare-fun m!262897 () Bool)

(assert (=> bm!22971 m!262897))

(declare-fun m!262899 () Bool)

(assert (=> b!245950 m!262899))

(assert (=> b!245950 m!262899))

(declare-fun m!262901 () Bool)

(assert (=> b!245950 m!262901))

(assert (=> bm!22936 d!60153))

(declare-fun b!245966 () Bool)

(declare-fun e!159558 () SeekEntryResult!1088)

(assert (=> b!245966 (= e!159558 (MissingVacant!1088 (index!6524 lt!123014)))))

(declare-fun b!245967 () Bool)

(declare-fun c!41114 () Bool)

(declare-fun lt!123073 () (_ BitVec 64))

(assert (=> b!245967 (= c!41114 (= lt!123073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159556 () SeekEntryResult!1088)

(assert (=> b!245967 (= e!159556 e!159558)))

(declare-fun b!245968 () Bool)

(declare-fun e!159557 () SeekEntryResult!1088)

(assert (=> b!245968 (= e!159557 Undefined!1088)))

(declare-fun b!245969 () Bool)

(assert (=> b!245969 (= e!159556 (Found!1088 (index!6524 lt!123014)))))

(declare-fun b!245970 () Bool)

(assert (=> b!245970 (= e!159557 e!159556)))

(declare-fun c!41116 () Bool)

(assert (=> b!245970 (= c!41116 (= lt!123073 key!932))))

(declare-fun b!245965 () Bool)

(assert (=> b!245965 (= e!159558 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24435 lt!123014) #b00000000000000000000000000000001) (nextIndex!0 (index!6524 lt!123014) (x!24435 lt!123014) (mask!10659 thiss!1504)) (index!6524 lt!123014) key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(declare-fun d!60155 () Bool)

(declare-fun lt!123072 () SeekEntryResult!1088)

(assert (=> d!60155 (and (or ((_ is Undefined!1088) lt!123072) (not ((_ is Found!1088) lt!123072)) (and (bvsge (index!6523 lt!123072) #b00000000000000000000000000000000) (bvslt (index!6523 lt!123072) (size!6101 (_keys!6660 thiss!1504))))) (or ((_ is Undefined!1088) lt!123072) ((_ is Found!1088) lt!123072) (not ((_ is MissingVacant!1088) lt!123072)) (not (= (index!6525 lt!123072) (index!6524 lt!123014))) (and (bvsge (index!6525 lt!123072) #b00000000000000000000000000000000) (bvslt (index!6525 lt!123072) (size!6101 (_keys!6660 thiss!1504))))) (or ((_ is Undefined!1088) lt!123072) (ite ((_ is Found!1088) lt!123072) (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6523 lt!123072)) key!932) (and ((_ is MissingVacant!1088) lt!123072) (= (index!6525 lt!123072) (index!6524 lt!123014)) (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6525 lt!123072)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!60155 (= lt!123072 e!159557)))

(declare-fun c!41115 () Bool)

(assert (=> d!60155 (= c!41115 (bvsge (x!24435 lt!123014) #b01111111111111111111111111111110))))

(assert (=> d!60155 (= lt!123073 (select (arr!5758 (_keys!6660 thiss!1504)) (index!6524 lt!123014)))))

(assert (=> d!60155 (validMask!0 (mask!10659 thiss!1504))))

(assert (=> d!60155 (= (seekKeyOrZeroReturnVacant!0 (x!24435 lt!123014) (index!6524 lt!123014) (index!6524 lt!123014) key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)) lt!123072)))

(assert (= (and d!60155 c!41115) b!245968))

(assert (= (and d!60155 (not c!41115)) b!245970))

(assert (= (and b!245970 c!41116) b!245969))

(assert (= (and b!245970 (not c!41116)) b!245967))

(assert (= (and b!245967 c!41114) b!245966))

(assert (= (and b!245967 (not c!41114)) b!245965))

(declare-fun m!262903 () Bool)

(assert (=> b!245965 m!262903))

(assert (=> b!245965 m!262903))

(declare-fun m!262905 () Bool)

(assert (=> b!245965 m!262905))

(declare-fun m!262907 () Bool)

(assert (=> d!60155 m!262907))

(declare-fun m!262909 () Bool)

(assert (=> d!60155 m!262909))

(assert (=> d!60155 m!262805))

(assert (=> d!60155 m!262565))

(assert (=> b!245817 d!60155))

(assert (=> d!60091 d!60079))

(declare-fun d!60157 () Bool)

(assert (=> d!60157 (= (arrayCountValidKeys!0 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))) #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6660 thiss!1504) #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60157 true))

(declare-fun _$84!21 () Unit!7576)

(assert (=> d!60157 (= (choose!1 (_keys!6660 thiss!1504) index!297 key!932) _$84!21)))

(declare-fun bs!8875 () Bool)

(assert (= bs!8875 d!60157))

(assert (=> bs!8875 m!262573))

(assert (=> bs!8875 m!262689))

(assert (=> bs!8875 m!262575))

(assert (=> d!60071 d!60157))

(declare-fun b!245971 () Bool)

(declare-fun e!159562 () Bool)

(declare-fun e!159560 () Bool)

(assert (=> b!245971 (= e!159562 e!159560)))

(declare-fun c!41117 () Bool)

(assert (=> b!245971 (= c!41117 (validKeyInArray!0 (select (arr!5758 lt!122854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!245972 () Bool)

(declare-fun e!159561 () Bool)

(assert (=> b!245972 (= e!159561 (contains!1763 (ite c!41034 (Cons!3658 (select (arr!5758 lt!122854) #b00000000000000000000000000000000) Nil!3659) Nil!3659) (select (arr!5758 lt!122854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!245973 () Bool)

(declare-fun e!159559 () Bool)

(assert (=> b!245973 (= e!159559 e!159562)))

(declare-fun res!120590 () Bool)

(assert (=> b!245973 (=> (not res!120590) (not e!159562))))

(assert (=> b!245973 (= res!120590 (not e!159561))))

(declare-fun res!120591 () Bool)

(assert (=> b!245973 (=> (not res!120591) (not e!159561))))

(assert (=> b!245973 (= res!120591 (validKeyInArray!0 (select (arr!5758 lt!122854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!22972 () Bool)

(declare-fun call!22975 () Bool)

(assert (=> bm!22972 (= call!22975 (arrayNoDuplicates!0 lt!122854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!41117 (Cons!3658 (select (arr!5758 lt!122854) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41034 (Cons!3658 (select (arr!5758 lt!122854) #b00000000000000000000000000000000) Nil!3659) Nil!3659)) (ite c!41034 (Cons!3658 (select (arr!5758 lt!122854) #b00000000000000000000000000000000) Nil!3659) Nil!3659))))))

(declare-fun d!60159 () Bool)

(declare-fun res!120589 () Bool)

(assert (=> d!60159 (=> res!120589 e!159559)))

(assert (=> d!60159 (= res!120589 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6101 lt!122854)))))

(assert (=> d!60159 (= (arrayNoDuplicates!0 lt!122854 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41034 (Cons!3658 (select (arr!5758 lt!122854) #b00000000000000000000000000000000) Nil!3659) Nil!3659)) e!159559)))

(declare-fun b!245974 () Bool)

(assert (=> b!245974 (= e!159560 call!22975)))

(declare-fun b!245975 () Bool)

(assert (=> b!245975 (= e!159560 call!22975)))

(assert (= (and d!60159 (not res!120589)) b!245973))

(assert (= (and b!245973 res!120591) b!245972))

(assert (= (and b!245973 res!120590) b!245971))

(assert (= (and b!245971 c!41117) b!245974))

(assert (= (and b!245971 (not c!41117)) b!245975))

(assert (= (or b!245974 b!245975) bm!22972))

(assert (=> b!245971 m!262893))

(assert (=> b!245971 m!262893))

(assert (=> b!245971 m!262895))

(assert (=> b!245972 m!262893))

(assert (=> b!245972 m!262893))

(declare-fun m!262911 () Bool)

(assert (=> b!245972 m!262911))

(assert (=> b!245973 m!262893))

(assert (=> b!245973 m!262893))

(assert (=> b!245973 m!262895))

(assert (=> bm!22972 m!262893))

(declare-fun m!262913 () Bool)

(assert (=> bm!22972 m!262913))

(assert (=> bm!22933 d!60159))

(assert (=> d!60103 d!60101))

(declare-fun d!60161 () Bool)

(declare-fun e!159565 () Bool)

(assert (=> d!60161 e!159565))

(declare-fun res!120596 () Bool)

(assert (=> d!60161 (=> (not res!120596) (not e!159565))))

(declare-fun lt!123076 () SeekEntryResult!1088)

(assert (=> d!60161 (= res!120596 ((_ is Found!1088) lt!123076))))

(assert (=> d!60161 (= lt!123076 (seekEntryOrOpen!0 key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(assert (=> d!60161 true))

(declare-fun _$33!159 () Unit!7576)

(assert (=> d!60161 (= (choose!1158 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)) _$33!159)))

(declare-fun b!245980 () Bool)

(declare-fun res!120597 () Bool)

(assert (=> b!245980 (=> (not res!120597) (not e!159565))))

(assert (=> b!245980 (= res!120597 (inRange!0 (index!6523 lt!123076) (mask!10659 thiss!1504)))))

(declare-fun b!245981 () Bool)

(assert (=> b!245981 (= e!159565 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6523 lt!123076)) key!932))))

(assert (= (and d!60161 res!120596) b!245980))

(assert (= (and b!245980 res!120597) b!245981))

(assert (=> d!60161 m!262563))

(declare-fun m!262915 () Bool)

(assert (=> b!245980 m!262915))

(declare-fun m!262917 () Bool)

(assert (=> b!245981 m!262917))

(assert (=> d!60103 d!60161))

(assert (=> d!60103 d!60079))

(declare-fun d!60163 () Bool)

(assert (=> d!60163 (= (apply!231 (+!664 lt!122986 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504))) lt!122995) (get!2952 (getValueByKey!287 (toList!1846 (+!664 lt!122986 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504)))) lt!122995)))))

(declare-fun bs!8876 () Bool)

(assert (= bs!8876 d!60163))

(declare-fun m!262919 () Bool)

(assert (=> bs!8876 m!262919))

(assert (=> bs!8876 m!262919))

(declare-fun m!262921 () Bool)

(assert (=> bs!8876 m!262921))

(assert (=> b!245774 d!60163))

(declare-fun d!60165 () Bool)

(assert (=> d!60165 (= (apply!231 (+!664 lt!122994 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504))) lt!122990) (get!2952 (getValueByKey!287 (toList!1846 (+!664 lt!122994 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504)))) lt!122990)))))

(declare-fun bs!8877 () Bool)

(assert (= bs!8877 d!60165))

(declare-fun m!262923 () Bool)

(assert (=> bs!8877 m!262923))

(assert (=> bs!8877 m!262923))

(declare-fun m!262925 () Bool)

(assert (=> bs!8877 m!262925))

(assert (=> b!245774 d!60165))

(declare-fun d!60167 () Bool)

(assert (=> d!60167 (= (apply!231 (+!664 lt!122991 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504))) lt!122979) (apply!231 lt!122991 lt!122979))))

(declare-fun lt!123079 () Unit!7576)

(declare-fun choose!1160 (ListLongMap!3661 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7576)

(assert (=> d!60167 (= lt!123079 (choose!1160 lt!122991 lt!122996 (minValue!4387 thiss!1504) lt!122979))))

(declare-fun e!159568 () Bool)

(assert (=> d!60167 e!159568))

(declare-fun res!120600 () Bool)

(assert (=> d!60167 (=> (not res!120600) (not e!159568))))

(assert (=> d!60167 (= res!120600 (contains!1760 lt!122991 lt!122979))))

(assert (=> d!60167 (= (addApplyDifferent!207 lt!122991 lt!122996 (minValue!4387 thiss!1504) lt!122979) lt!123079)))

(declare-fun b!245985 () Bool)

(assert (=> b!245985 (= e!159568 (not (= lt!122979 lt!122996)))))

(assert (= (and d!60167 res!120600) b!245985))

(assert (=> d!60167 m!262747))

(assert (=> d!60167 m!262747))

(assert (=> d!60167 m!262749))

(declare-fun m!262927 () Bool)

(assert (=> d!60167 m!262927))

(declare-fun m!262929 () Bool)

(assert (=> d!60167 m!262929))

(assert (=> d!60167 m!262753))

(assert (=> b!245774 d!60167))

(declare-fun d!60169 () Bool)

(assert (=> d!60169 (= (apply!231 lt!122994 lt!122990) (get!2952 (getValueByKey!287 (toList!1846 lt!122994) lt!122990)))))

(declare-fun bs!8878 () Bool)

(assert (= bs!8878 d!60169))

(declare-fun m!262931 () Bool)

(assert (=> bs!8878 m!262931))

(assert (=> bs!8878 m!262931))

(declare-fun m!262933 () Bool)

(assert (=> bs!8878 m!262933))

(assert (=> b!245774 d!60169))

(declare-fun d!60171 () Bool)

(declare-fun e!159585 () Bool)

(assert (=> d!60171 e!159585))

(declare-fun res!120612 () Bool)

(assert (=> d!60171 (=> (not res!120612) (not e!159585))))

(declare-fun lt!123096 () ListLongMap!3661)

(assert (=> d!60171 (= res!120612 (not (contains!1760 lt!123096 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!159584 () ListLongMap!3661)

(assert (=> d!60171 (= lt!123096 e!159584)))

(declare-fun c!41126 () Bool)

(assert (=> d!60171 (= c!41126 (bvsge #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> d!60171 (validMask!0 (mask!10659 thiss!1504))))

(assert (=> d!60171 (= (getCurrentListMapNoExtraKeys!547 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) lt!123096)))

(declare-fun b!246010 () Bool)

(declare-fun e!159588 () ListLongMap!3661)

(declare-fun call!22978 () ListLongMap!3661)

(assert (=> b!246010 (= e!159588 call!22978)))

(declare-fun b!246011 () Bool)

(declare-fun e!159587 () Bool)

(declare-fun e!159583 () Bool)

(assert (=> b!246011 (= e!159587 e!159583)))

(declare-fun c!41127 () Bool)

(assert (=> b!246011 (= c!41127 (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun b!246012 () Bool)

(assert (=> b!246012 (= e!159585 e!159587)))

(declare-fun c!41129 () Bool)

(declare-fun e!159586 () Bool)

(assert (=> b!246012 (= c!41129 e!159586)))

(declare-fun res!120611 () Bool)

(assert (=> b!246012 (=> (not res!120611) (not e!159586))))

(assert (=> b!246012 (= res!120611 (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun bm!22975 () Bool)

(assert (=> bm!22975 (= call!22978 (getCurrentListMapNoExtraKeys!547 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4546 thiss!1504)))))

(declare-fun b!246013 () Bool)

(assert (=> b!246013 (= e!159584 e!159588)))

(declare-fun c!41128 () Bool)

(assert (=> b!246013 (= c!41128 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246014 () Bool)

(declare-fun res!120610 () Bool)

(assert (=> b!246014 (=> (not res!120610) (not e!159585))))

(assert (=> b!246014 (= res!120610 (not (contains!1760 lt!123096 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!246015 () Bool)

(assert (=> b!246015 (= e!159586 (validKeyInArray!0 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246015 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!246016 () Bool)

(declare-fun e!159589 () Bool)

(assert (=> b!246016 (= e!159587 e!159589)))

(assert (=> b!246016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun res!120609 () Bool)

(assert (=> b!246016 (= res!120609 (contains!1760 lt!123096 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246016 (=> (not res!120609) (not e!159589))))

(declare-fun b!246017 () Bool)

(assert (=> b!246017 (= e!159584 (ListLongMap!3662 Nil!3658))))

(declare-fun b!246018 () Bool)

(declare-fun lt!123098 () Unit!7576)

(declare-fun lt!123097 () Unit!7576)

(assert (=> b!246018 (= lt!123098 lt!123097)))

(declare-fun lt!123099 () V!8209)

(declare-fun lt!123100 () (_ BitVec 64))

(declare-fun lt!123095 () ListLongMap!3661)

(declare-fun lt!123094 () (_ BitVec 64))

(assert (=> b!246018 (not (contains!1760 (+!664 lt!123095 (tuple2!4759 lt!123100 lt!123099)) lt!123094))))

(declare-fun addStillNotContains!121 (ListLongMap!3661 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7576)

(assert (=> b!246018 (= lt!123097 (addStillNotContains!121 lt!123095 lt!123100 lt!123099 lt!123094))))

(assert (=> b!246018 (= lt!123094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!246018 (= lt!123099 (get!2951 (select (arr!5757 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!246018 (= lt!123100 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246018 (= lt!123095 call!22978)))

(assert (=> b!246018 (= e!159588 (+!664 call!22978 (tuple2!4759 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000) (get!2951 (select (arr!5757 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!246019 () Bool)

(assert (=> b!246019 (= e!159583 (= lt!123096 (getCurrentListMapNoExtraKeys!547 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4546 thiss!1504))))))

(declare-fun b!246020 () Bool)

(assert (=> b!246020 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6101 (_keys!6660 thiss!1504))))))

(assert (=> b!246020 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6100 (_values!4529 thiss!1504))))))

(assert (=> b!246020 (= e!159589 (= (apply!231 lt!123096 (select (arr!5758 (_keys!6660 thiss!1504)) #b00000000000000000000000000000000)) (get!2951 (select (arr!5757 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!565 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246021 () Bool)

(declare-fun isEmpty!527 (ListLongMap!3661) Bool)

(assert (=> b!246021 (= e!159583 (isEmpty!527 lt!123096))))

(assert (= (and d!60171 c!41126) b!246017))

(assert (= (and d!60171 (not c!41126)) b!246013))

(assert (= (and b!246013 c!41128) b!246018))

(assert (= (and b!246013 (not c!41128)) b!246010))

(assert (= (or b!246018 b!246010) bm!22975))

(assert (= (and d!60171 res!120612) b!246014))

(assert (= (and b!246014 res!120610) b!246012))

(assert (= (and b!246012 res!120611) b!246015))

(assert (= (and b!246012 c!41129) b!246016))

(assert (= (and b!246012 (not c!41129)) b!246011))

(assert (= (and b!246016 res!120609) b!246020))

(assert (= (and b!246011 c!41127) b!246019))

(assert (= (and b!246011 (not c!41127)) b!246021))

(declare-fun b_lambda!8013 () Bool)

(assert (=> (not b_lambda!8013) (not b!246018)))

(assert (=> b!246018 t!8674))

(declare-fun b_and!13531 () Bool)

(assert (= b_and!13529 (and (=> t!8674 result!5239) b_and!13531)))

(declare-fun b_lambda!8015 () Bool)

(assert (=> (not b_lambda!8015) (not b!246020)))

(assert (=> b!246020 t!8674))

(declare-fun b_and!13533 () Bool)

(assert (= b_and!13531 (and (=> t!8674 result!5239) b_and!13533)))

(assert (=> b!246013 m!262699))

(assert (=> b!246013 m!262699))

(assert (=> b!246013 m!262713))

(declare-fun m!262935 () Bool)

(assert (=> d!60171 m!262935))

(assert (=> d!60171 m!262565))

(assert (=> b!246018 m!262775))

(assert (=> b!246018 m!262777))

(declare-fun m!262937 () Bool)

(assert (=> b!246018 m!262937))

(assert (=> b!246018 m!262777))

(assert (=> b!246018 m!262775))

(assert (=> b!246018 m!262779))

(declare-fun m!262939 () Bool)

(assert (=> b!246018 m!262939))

(declare-fun m!262941 () Bool)

(assert (=> b!246018 m!262941))

(declare-fun m!262943 () Bool)

(assert (=> b!246018 m!262943))

(assert (=> b!246018 m!262699))

(assert (=> b!246018 m!262941))

(declare-fun m!262945 () Bool)

(assert (=> b!246014 m!262945))

(assert (=> b!246016 m!262699))

(assert (=> b!246016 m!262699))

(declare-fun m!262947 () Bool)

(assert (=> b!246016 m!262947))

(assert (=> b!246020 m!262775))

(assert (=> b!246020 m!262777))

(assert (=> b!246020 m!262699))

(declare-fun m!262949 () Bool)

(assert (=> b!246020 m!262949))

(assert (=> b!246020 m!262777))

(assert (=> b!246020 m!262775))

(assert (=> b!246020 m!262779))

(assert (=> b!246020 m!262699))

(declare-fun m!262951 () Bool)

(assert (=> b!246019 m!262951))

(assert (=> bm!22975 m!262951))

(assert (=> b!246015 m!262699))

(assert (=> b!246015 m!262699))

(assert (=> b!246015 m!262713))

(declare-fun m!262953 () Bool)

(assert (=> b!246021 m!262953))

(assert (=> b!245774 d!60171))

(declare-fun d!60173 () Bool)

(assert (=> d!60173 (= (apply!231 lt!122991 lt!122979) (get!2952 (getValueByKey!287 (toList!1846 lt!122991) lt!122979)))))

(declare-fun bs!8879 () Bool)

(assert (= bs!8879 d!60173))

(declare-fun m!262955 () Bool)

(assert (=> bs!8879 m!262955))

(assert (=> bs!8879 m!262955))

(declare-fun m!262957 () Bool)

(assert (=> bs!8879 m!262957))

(assert (=> b!245774 d!60173))

(declare-fun d!60175 () Bool)

(declare-fun e!159590 () Bool)

(assert (=> d!60175 e!159590))

(declare-fun res!120614 () Bool)

(assert (=> d!60175 (=> (not res!120614) (not e!159590))))

(declare-fun lt!123102 () ListLongMap!3661)

(assert (=> d!60175 (= res!120614 (contains!1760 lt!123102 (_1!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))))))

(declare-fun lt!123103 () List!3661)

(assert (=> d!60175 (= lt!123102 (ListLongMap!3662 lt!123103))))

(declare-fun lt!123104 () Unit!7576)

(declare-fun lt!123101 () Unit!7576)

(assert (=> d!60175 (= lt!123104 lt!123101)))

(assert (=> d!60175 (= (getValueByKey!287 lt!123103 (_1!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60175 (= lt!123101 (lemmaContainsTupThenGetReturnValue!157 lt!123103 (_1!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60175 (= lt!123103 (insertStrictlySorted!160 (toList!1846 lt!122993) (_1!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60175 (= (+!664 lt!122993 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504))) lt!123102)))

(declare-fun b!246022 () Bool)

(declare-fun res!120613 () Bool)

(assert (=> b!246022 (=> (not res!120613) (not e!159590))))

(assert (=> b!246022 (= res!120613 (= (getValueByKey!287 (toList!1846 lt!123102) (_1!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504))))))))

(declare-fun b!246023 () Bool)

(assert (=> b!246023 (= e!159590 (contains!1764 (toList!1846 lt!123102) (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504))))))

(assert (= (and d!60175 res!120614) b!246022))

(assert (= (and b!246022 res!120613) b!246023))

(declare-fun m!262959 () Bool)

(assert (=> d!60175 m!262959))

(declare-fun m!262961 () Bool)

(assert (=> d!60175 m!262961))

(declare-fun m!262963 () Bool)

(assert (=> d!60175 m!262963))

(declare-fun m!262965 () Bool)

(assert (=> d!60175 m!262965))

(declare-fun m!262967 () Bool)

(assert (=> b!246022 m!262967))

(declare-fun m!262969 () Bool)

(assert (=> b!246023 m!262969))

(assert (=> b!245774 d!60175))

(declare-fun d!60177 () Bool)

(declare-fun e!159591 () Bool)

(assert (=> d!60177 e!159591))

(declare-fun res!120616 () Bool)

(assert (=> d!60177 (=> (not res!120616) (not e!159591))))

(declare-fun lt!123106 () ListLongMap!3661)

(assert (=> d!60177 (= res!120616 (contains!1760 lt!123106 (_1!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504)))))))

(declare-fun lt!123107 () List!3661)

(assert (=> d!60177 (= lt!123106 (ListLongMap!3662 lt!123107))))

(declare-fun lt!123108 () Unit!7576)

(declare-fun lt!123105 () Unit!7576)

(assert (=> d!60177 (= lt!123108 lt!123105)))

(assert (=> d!60177 (= (getValueByKey!287 lt!123107 (_1!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504)))))))

(assert (=> d!60177 (= lt!123105 (lemmaContainsTupThenGetReturnValue!157 lt!123107 (_1!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504)))))))

(assert (=> d!60177 (= lt!123107 (insertStrictlySorted!160 (toList!1846 lt!122991) (_1!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504)))))))

(assert (=> d!60177 (= (+!664 lt!122991 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504))) lt!123106)))

(declare-fun b!246024 () Bool)

(declare-fun res!120615 () Bool)

(assert (=> b!246024 (=> (not res!120615) (not e!159591))))

(assert (=> b!246024 (= res!120615 (= (getValueByKey!287 (toList!1846 lt!123106) (_1!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504))))))))

(declare-fun b!246025 () Bool)

(assert (=> b!246025 (= e!159591 (contains!1764 (toList!1846 lt!123106) (tuple2!4759 lt!122996 (minValue!4387 thiss!1504))))))

(assert (= (and d!60177 res!120616) b!246024))

(assert (= (and b!246024 res!120615) b!246025))

(declare-fun m!262971 () Bool)

(assert (=> d!60177 m!262971))

(declare-fun m!262973 () Bool)

(assert (=> d!60177 m!262973))

(declare-fun m!262975 () Bool)

(assert (=> d!60177 m!262975))

(declare-fun m!262977 () Bool)

(assert (=> d!60177 m!262977))

(declare-fun m!262979 () Bool)

(assert (=> b!246024 m!262979))

(declare-fun m!262981 () Bool)

(assert (=> b!246025 m!262981))

(assert (=> b!245774 d!60177))

(declare-fun d!60179 () Bool)

(assert (=> d!60179 (= (apply!231 (+!664 lt!122991 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504))) lt!122979) (get!2952 (getValueByKey!287 (toList!1846 (+!664 lt!122991 (tuple2!4759 lt!122996 (minValue!4387 thiss!1504)))) lt!122979)))))

(declare-fun bs!8880 () Bool)

(assert (= bs!8880 d!60179))

(declare-fun m!262983 () Bool)

(assert (=> bs!8880 m!262983))

(assert (=> bs!8880 m!262983))

(declare-fun m!262985 () Bool)

(assert (=> bs!8880 m!262985))

(assert (=> b!245774 d!60179))

(declare-fun d!60181 () Bool)

(assert (=> d!60181 (= (apply!231 (+!664 lt!122986 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504))) lt!122995) (apply!231 lt!122986 lt!122995))))

(declare-fun lt!123109 () Unit!7576)

(assert (=> d!60181 (= lt!123109 (choose!1160 lt!122986 lt!122983 (zeroValue!4387 thiss!1504) lt!122995))))

(declare-fun e!159592 () Bool)

(assert (=> d!60181 e!159592))

(declare-fun res!120617 () Bool)

(assert (=> d!60181 (=> (not res!120617) (not e!159592))))

(assert (=> d!60181 (= res!120617 (contains!1760 lt!122986 lt!122995))))

(assert (=> d!60181 (= (addApplyDifferent!207 lt!122986 lt!122983 (zeroValue!4387 thiss!1504) lt!122995) lt!123109)))

(declare-fun b!246026 () Bool)

(assert (=> b!246026 (= e!159592 (not (= lt!122995 lt!122983)))))

(assert (= (and d!60181 res!120617) b!246026))

(assert (=> d!60181 m!262741))

(assert (=> d!60181 m!262741))

(assert (=> d!60181 m!262761))

(declare-fun m!262987 () Bool)

(assert (=> d!60181 m!262987))

(declare-fun m!262989 () Bool)

(assert (=> d!60181 m!262989))

(assert (=> d!60181 m!262751))

(assert (=> b!245774 d!60181))

(declare-fun d!60183 () Bool)

(declare-fun e!159593 () Bool)

(assert (=> d!60183 e!159593))

(declare-fun res!120619 () Bool)

(assert (=> d!60183 (=> (not res!120619) (not e!159593))))

(declare-fun lt!123111 () ListLongMap!3661)

(assert (=> d!60183 (= res!120619 (contains!1760 lt!123111 (_1!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504)))))))

(declare-fun lt!123112 () List!3661)

(assert (=> d!60183 (= lt!123111 (ListLongMap!3662 lt!123112))))

(declare-fun lt!123113 () Unit!7576)

(declare-fun lt!123110 () Unit!7576)

(assert (=> d!60183 (= lt!123113 lt!123110)))

(assert (=> d!60183 (= (getValueByKey!287 lt!123112 (_1!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60183 (= lt!123110 (lemmaContainsTupThenGetReturnValue!157 lt!123112 (_1!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60183 (= lt!123112 (insertStrictlySorted!160 (toList!1846 lt!122986) (_1!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60183 (= (+!664 lt!122986 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504))) lt!123111)))

(declare-fun b!246027 () Bool)

(declare-fun res!120618 () Bool)

(assert (=> b!246027 (=> (not res!120618) (not e!159593))))

(assert (=> b!246027 (= res!120618 (= (getValueByKey!287 (toList!1846 lt!123111) (_1!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504))))))))

(declare-fun b!246028 () Bool)

(assert (=> b!246028 (= e!159593 (contains!1764 (toList!1846 lt!123111) (tuple2!4759 lt!122983 (zeroValue!4387 thiss!1504))))))

(assert (= (and d!60183 res!120619) b!246027))

(assert (= (and b!246027 res!120618) b!246028))

(declare-fun m!262991 () Bool)

(assert (=> d!60183 m!262991))

(declare-fun m!262993 () Bool)

(assert (=> d!60183 m!262993))

(declare-fun m!262995 () Bool)

(assert (=> d!60183 m!262995))

(declare-fun m!262997 () Bool)

(assert (=> d!60183 m!262997))

(declare-fun m!262999 () Bool)

(assert (=> b!246027 m!262999))

(declare-fun m!263001 () Bool)

(assert (=> b!246028 m!263001))

(assert (=> b!245774 d!60183))

(declare-fun d!60185 () Bool)

(declare-fun e!159595 () Bool)

(assert (=> d!60185 e!159595))

(declare-fun res!120620 () Bool)

(assert (=> d!60185 (=> res!120620 e!159595)))

(declare-fun lt!123115 () Bool)

(assert (=> d!60185 (= res!120620 (not lt!123115))))

(declare-fun lt!123114 () Bool)

(assert (=> d!60185 (= lt!123115 lt!123114)))

(declare-fun lt!123116 () Unit!7576)

(declare-fun e!159594 () Unit!7576)

(assert (=> d!60185 (= lt!123116 e!159594)))

(declare-fun c!41130 () Bool)

(assert (=> d!60185 (= c!41130 lt!123114)))

(assert (=> d!60185 (= lt!123114 (containsKey!279 (toList!1846 (+!664 lt!122993 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))) lt!123000))))

(assert (=> d!60185 (= (contains!1760 (+!664 lt!122993 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504))) lt!123000) lt!123115)))

(declare-fun b!246029 () Bool)

(declare-fun lt!123117 () Unit!7576)

(assert (=> b!246029 (= e!159594 lt!123117)))

(assert (=> b!246029 (= lt!123117 (lemmaContainsKeyImpliesGetValueByKeyDefined!228 (toList!1846 (+!664 lt!122993 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))) lt!123000))))

(assert (=> b!246029 (isDefined!229 (getValueByKey!287 (toList!1846 (+!664 lt!122993 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))) lt!123000))))

(declare-fun b!246030 () Bool)

(declare-fun Unit!7592 () Unit!7576)

(assert (=> b!246030 (= e!159594 Unit!7592)))

(declare-fun b!246031 () Bool)

(assert (=> b!246031 (= e!159595 (isDefined!229 (getValueByKey!287 (toList!1846 (+!664 lt!122993 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504)))) lt!123000)))))

(assert (= (and d!60185 c!41130) b!246029))

(assert (= (and d!60185 (not c!41130)) b!246030))

(assert (= (and d!60185 (not res!120620)) b!246031))

(declare-fun m!263003 () Bool)

(assert (=> d!60185 m!263003))

(declare-fun m!263005 () Bool)

(assert (=> b!246029 m!263005))

(declare-fun m!263007 () Bool)

(assert (=> b!246029 m!263007))

(assert (=> b!246029 m!263007))

(declare-fun m!263009 () Bool)

(assert (=> b!246029 m!263009))

(assert (=> b!246031 m!263007))

(assert (=> b!246031 m!263007))

(assert (=> b!246031 m!263009))

(assert (=> b!245774 d!60185))

(declare-fun d!60187 () Bool)

(assert (=> d!60187 (contains!1760 (+!664 lt!122993 (tuple2!4759 lt!122989 (zeroValue!4387 thiss!1504))) lt!123000)))

(declare-fun lt!123120 () Unit!7576)

(declare-fun choose!1161 (ListLongMap!3661 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7576)

(assert (=> d!60187 (= lt!123120 (choose!1161 lt!122993 lt!122989 (zeroValue!4387 thiss!1504) lt!123000))))

(assert (=> d!60187 (contains!1760 lt!122993 lt!123000)))

(assert (=> d!60187 (= (addStillContains!207 lt!122993 lt!122989 (zeroValue!4387 thiss!1504) lt!123000) lt!123120)))

(declare-fun bs!8881 () Bool)

(assert (= bs!8881 d!60187))

(assert (=> bs!8881 m!262757))

(assert (=> bs!8881 m!262757))

(assert (=> bs!8881 m!262759))

(declare-fun m!263011 () Bool)

(assert (=> bs!8881 m!263011))

(declare-fun m!263013 () Bool)

(assert (=> bs!8881 m!263013))

(assert (=> b!245774 d!60187))

(declare-fun d!60189 () Bool)

(declare-fun e!159596 () Bool)

(assert (=> d!60189 e!159596))

(declare-fun res!120622 () Bool)

(assert (=> d!60189 (=> (not res!120622) (not e!159596))))

(declare-fun lt!123122 () ListLongMap!3661)

(assert (=> d!60189 (= res!120622 (contains!1760 lt!123122 (_1!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504)))))))

(declare-fun lt!123123 () List!3661)

(assert (=> d!60189 (= lt!123122 (ListLongMap!3662 lt!123123))))

(declare-fun lt!123124 () Unit!7576)

(declare-fun lt!123121 () Unit!7576)

(assert (=> d!60189 (= lt!123124 lt!123121)))

(assert (=> d!60189 (= (getValueByKey!287 lt!123123 (_1!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504)))))))

(assert (=> d!60189 (= lt!123121 (lemmaContainsTupThenGetReturnValue!157 lt!123123 (_1!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504)))))))

(assert (=> d!60189 (= lt!123123 (insertStrictlySorted!160 (toList!1846 lt!122994) (_1!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504))) (_2!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504)))))))

(assert (=> d!60189 (= (+!664 lt!122994 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504))) lt!123122)))

(declare-fun b!246033 () Bool)

(declare-fun res!120621 () Bool)

(assert (=> b!246033 (=> (not res!120621) (not e!159596))))

(assert (=> b!246033 (= res!120621 (= (getValueByKey!287 (toList!1846 lt!123122) (_1!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504)))) (Some!292 (_2!2390 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504))))))))

(declare-fun b!246034 () Bool)

(assert (=> b!246034 (= e!159596 (contains!1764 (toList!1846 lt!123122) (tuple2!4759 lt!122988 (minValue!4387 thiss!1504))))))

(assert (= (and d!60189 res!120622) b!246033))

(assert (= (and b!246033 res!120621) b!246034))

(declare-fun m!263015 () Bool)

(assert (=> d!60189 m!263015))

(declare-fun m!263017 () Bool)

(assert (=> d!60189 m!263017))

(declare-fun m!263019 () Bool)

(assert (=> d!60189 m!263019))

(declare-fun m!263021 () Bool)

(assert (=> d!60189 m!263021))

(declare-fun m!263023 () Bool)

(assert (=> b!246033 m!263023))

(declare-fun m!263025 () Bool)

(assert (=> b!246034 m!263025))

(assert (=> b!245774 d!60189))

(declare-fun d!60191 () Bool)

(assert (=> d!60191 (= (apply!231 (+!664 lt!122994 (tuple2!4759 lt!122988 (minValue!4387 thiss!1504))) lt!122990) (apply!231 lt!122994 lt!122990))))

(declare-fun lt!123125 () Unit!7576)

(assert (=> d!60191 (= lt!123125 (choose!1160 lt!122994 lt!122988 (minValue!4387 thiss!1504) lt!122990))))

(declare-fun e!159597 () Bool)

(assert (=> d!60191 e!159597))

(declare-fun res!120623 () Bool)

(assert (=> d!60191 (=> (not res!120623) (not e!159597))))

(assert (=> d!60191 (= res!120623 (contains!1760 lt!122994 lt!122990))))

(assert (=> d!60191 (= (addApplyDifferent!207 lt!122994 lt!122988 (minValue!4387 thiss!1504) lt!122990) lt!123125)))

(declare-fun b!246035 () Bool)

(assert (=> b!246035 (= e!159597 (not (= lt!122990 lt!122988)))))

(assert (= (and d!60191 res!120623) b!246035))

(assert (=> d!60191 m!262745))

(assert (=> d!60191 m!262745))

(assert (=> d!60191 m!262755))

(declare-fun m!263027 () Bool)

(assert (=> d!60191 m!263027))

(declare-fun m!263029 () Bool)

(assert (=> d!60191 m!263029))

(assert (=> d!60191 m!262765))

(assert (=> b!245774 d!60191))

(declare-fun d!60193 () Bool)

(assert (=> d!60193 (= (apply!231 lt!122986 lt!122995) (get!2952 (getValueByKey!287 (toList!1846 lt!122986) lt!122995)))))

(declare-fun bs!8882 () Bool)

(assert (= bs!8882 d!60193))

(declare-fun m!263031 () Bool)

(assert (=> bs!8882 m!263031))

(assert (=> bs!8882 m!263031))

(declare-fun m!263033 () Bool)

(assert (=> bs!8882 m!263033))

(assert (=> b!245774 d!60193))

(assert (=> d!60099 d!60101))

(declare-fun call!22984 () Bool)

(declare-fun c!41136 () Bool)

(declare-fun bm!22980 () Bool)

(declare-fun lt!123128 () SeekEntryResult!1088)

(assert (=> bm!22980 (= call!22984 (inRange!0 (ite c!41136 (index!6522 lt!123128) (index!6525 lt!123128)) (mask!10659 thiss!1504)))))

(declare-fun bm!22981 () Bool)

(declare-fun call!22983 () Bool)

(assert (=> bm!22981 (= call!22983 (arrayContainsKey!0 (_keys!6660 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246052 () Bool)

(declare-fun e!159609 () Bool)

(declare-fun e!159606 () Bool)

(assert (=> b!246052 (= e!159609 e!159606)))

(declare-fun c!41135 () Bool)

(assert (=> b!246052 (= c!41135 ((_ is MissingVacant!1088) lt!123128))))

(declare-fun b!246053 () Bool)

(declare-fun e!159607 () Bool)

(assert (=> b!246053 (= e!159609 e!159607)))

(declare-fun res!120632 () Bool)

(assert (=> b!246053 (= res!120632 call!22984)))

(assert (=> b!246053 (=> (not res!120632) (not e!159607))))

(declare-fun b!246054 () Bool)

(declare-fun res!120635 () Bool)

(declare-fun e!159608 () Bool)

(assert (=> b!246054 (=> (not res!120635) (not e!159608))))

(assert (=> b!246054 (= res!120635 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6525 lt!123128)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246055 () Bool)

(declare-fun res!120634 () Bool)

(assert (=> b!246055 (= res!120634 (= (select (arr!5758 (_keys!6660 thiss!1504)) (index!6522 lt!123128)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246055 (=> (not res!120634) (not e!159607))))

(declare-fun d!60195 () Bool)

(assert (=> d!60195 e!159609))

(assert (=> d!60195 (= c!41136 ((_ is MissingZero!1088) lt!123128))))

(assert (=> d!60195 (= lt!123128 (seekEntryOrOpen!0 key!932 (_keys!6660 thiss!1504) (mask!10659 thiss!1504)))))

(assert (=> d!60195 true))

(declare-fun _$34!1104 () Unit!7576)

(assert (=> d!60195 (= (choose!1157 (_keys!6660 thiss!1504) (_values!4529 thiss!1504) (mask!10659 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)) _$34!1104)))

(declare-fun b!246056 () Bool)

(declare-fun res!120633 () Bool)

(assert (=> b!246056 (=> (not res!120633) (not e!159608))))

(assert (=> b!246056 (= res!120633 call!22984)))

(assert (=> b!246056 (= e!159606 e!159608)))

(declare-fun b!246057 () Bool)

(assert (=> b!246057 (= e!159606 ((_ is Undefined!1088) lt!123128))))

(declare-fun b!246058 () Bool)

(assert (=> b!246058 (= e!159607 (not call!22983))))

(declare-fun b!246059 () Bool)

(assert (=> b!246059 (= e!159608 (not call!22983))))

(assert (= (and d!60195 c!41136) b!246053))

(assert (= (and d!60195 (not c!41136)) b!246052))

(assert (= (and b!246053 res!120632) b!246055))

(assert (= (and b!246055 res!120634) b!246058))

(assert (= (and b!246052 c!41135) b!246056))

(assert (= (and b!246052 (not c!41135)) b!246057))

(assert (= (and b!246056 res!120633) b!246054))

(assert (= (and b!246054 res!120635) b!246059))

(assert (= (or b!246053 b!246056) bm!22980))

(assert (= (or b!246058 b!246059) bm!22981))

(declare-fun m!263035 () Bool)

(assert (=> b!246055 m!263035))

(assert (=> d!60195 m!262563))

(declare-fun m!263037 () Bool)

(assert (=> bm!22980 m!263037))

(declare-fun m!263039 () Bool)

(assert (=> b!246054 m!263039))

(assert (=> bm!22981 m!262561))

(assert (=> d!60099 d!60195))

(assert (=> d!60099 d!60079))

(declare-fun d!60197 () Bool)

(declare-fun res!120636 () Bool)

(declare-fun e!159610 () Bool)

(assert (=> d!60197 (=> res!120636 e!159610)))

(assert (=> d!60197 (= res!120636 (= (select (arr!5758 (_keys!6660 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60197 (= (arrayContainsKey!0 (_keys!6660 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!159610)))

(declare-fun b!246060 () Bool)

(declare-fun e!159611 () Bool)

(assert (=> b!246060 (= e!159610 e!159611)))

(declare-fun res!120637 () Bool)

(assert (=> b!246060 (=> (not res!120637) (not e!159611))))

(assert (=> b!246060 (= res!120637 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6101 (_keys!6660 thiss!1504))))))

(declare-fun b!246061 () Bool)

(assert (=> b!246061 (= e!159611 (arrayContainsKey!0 (_keys!6660 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60197 (not res!120636)) b!246060))

(assert (= (and b!246060 res!120637) b!246061))

(assert (=> d!60197 m!262899))

(declare-fun m!263041 () Bool)

(assert (=> b!246061 m!263041))

(assert (=> b!245669 d!60197))

(declare-fun b!246062 () Bool)

(declare-fun e!159615 () Bool)

(declare-fun e!159613 () Bool)

(assert (=> b!246062 (= e!159615 e!159613)))

(declare-fun c!41137 () Bool)

(assert (=> b!246062 (= c!41137 (validKeyInArray!0 (select (arr!5758 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!246063 () Bool)

(declare-fun e!159614 () Bool)

(assert (=> b!246063 (= e!159614 (contains!1763 Nil!3659 (select (arr!5758 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!246064 () Bool)

(declare-fun e!159612 () Bool)

(assert (=> b!246064 (= e!159612 e!159615)))

(declare-fun res!120639 () Bool)

(assert (=> b!246064 (=> (not res!120639) (not e!159615))))

(assert (=> b!246064 (= res!120639 (not e!159614))))

(declare-fun res!120640 () Bool)

(assert (=> b!246064 (=> (not res!120640) (not e!159614))))

(assert (=> b!246064 (= res!120640 (validKeyInArray!0 (select (arr!5758 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!22982 () Bool)

(declare-fun call!22985 () Bool)

(assert (=> bm!22982 (= call!22985 (arrayNoDuplicates!0 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41137 (Cons!3658 (select (arr!5758 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504)))) #b00000000000000000000000000000000) Nil!3659) Nil!3659)))))

(declare-fun d!60199 () Bool)

(declare-fun res!120638 () Bool)

(assert (=> d!60199 (=> res!120638 e!159612)))

(assert (=> d!60199 (= res!120638 (bvsge #b00000000000000000000000000000000 (size!6101 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))))))))

(assert (=> d!60199 (= (arrayNoDuplicates!0 (array!12136 (store (arr!5758 (_keys!6660 thiss!1504)) index!297 key!932) (size!6101 (_keys!6660 thiss!1504))) #b00000000000000000000000000000000 Nil!3659) e!159612)))

(declare-fun b!246065 () Bool)

(assert (=> b!246065 (= e!159613 call!22985)))

(declare-fun b!246066 () Bool)

(assert (=> b!246066 (= e!159613 call!22985)))

(assert (= (and d!60199 (not res!120638)) b!246064))

(assert (= (and b!246064 res!120640) b!246063))

(assert (= (and b!246064 res!120639) b!246062))

(assert (= (and b!246062 c!41137) b!246065))

(assert (= (and b!246062 (not c!41137)) b!246066))

(assert (= (or b!246065 b!246066) bm!22982))

(assert (=> b!246062 m!262879))

(assert (=> b!246062 m!262879))

(assert (=> b!246062 m!262881))

(assert (=> b!246063 m!262879))

(assert (=> b!246063 m!262879))

(declare-fun m!263043 () Bool)

(assert (=> b!246063 m!263043))

(assert (=> b!246064 m!262879))

(assert (=> b!246064 m!262879))

(assert (=> b!246064 m!262881))

(assert (=> bm!22982 m!262879))

(declare-fun m!263045 () Bool)

(assert (=> bm!22982 m!263045))

(assert (=> b!245703 d!60199))

(declare-fun d!60201 () Bool)

(declare-fun e!159617 () Bool)

(assert (=> d!60201 e!159617))

(declare-fun res!120641 () Bool)

(assert (=> d!60201 (=> res!120641 e!159617)))

(declare-fun lt!123130 () Bool)

(assert (=> d!60201 (= res!120641 (not lt!123130))))

(declare-fun lt!123129 () Bool)

(assert (=> d!60201 (= lt!123130 lt!123129)))

(declare-fun lt!123131 () Unit!7576)

(declare-fun e!159616 () Unit!7576)

(assert (=> d!60201 (= lt!123131 e!159616)))

(declare-fun c!41138 () Bool)

(assert (=> d!60201 (= c!41138 lt!123129)))

(assert (=> d!60201 (= lt!123129 (containsKey!279 (toList!1846 lt!122982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60201 (= (contains!1760 lt!122982 #b1000000000000000000000000000000000000000000000000000000000000000) lt!123130)))

(declare-fun b!246067 () Bool)

(declare-fun lt!123132 () Unit!7576)

(assert (=> b!246067 (= e!159616 lt!123132)))

(assert (=> b!246067 (= lt!123132 (lemmaContainsKeyImpliesGetValueByKeyDefined!228 (toList!1846 lt!122982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246067 (isDefined!229 (getValueByKey!287 (toList!1846 lt!122982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246068 () Bool)

(declare-fun Unit!7593 () Unit!7576)

(assert (=> b!246068 (= e!159616 Unit!7593)))

(declare-fun b!246069 () Bool)

(assert (=> b!246069 (= e!159617 (isDefined!229 (getValueByKey!287 (toList!1846 lt!122982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60201 c!41138) b!246067))

(assert (= (and d!60201 (not c!41138)) b!246068))

(assert (= (and d!60201 (not res!120641)) b!246069))

(declare-fun m!263047 () Bool)

(assert (=> d!60201 m!263047))

(declare-fun m!263049 () Bool)

(assert (=> b!246067 m!263049))

(declare-fun m!263051 () Bool)

(assert (=> b!246067 m!263051))

(assert (=> b!246067 m!263051))

(declare-fun m!263053 () Bool)

(assert (=> b!246067 m!263053))

(assert (=> b!246069 m!263051))

(assert (=> b!246069 m!263051))

(assert (=> b!246069 m!263053))

(assert (=> bm!22958 d!60201))

(declare-fun d!60203 () Bool)

(assert (=> d!60203 (= (apply!231 lt!122982 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2952 (getValueByKey!287 (toList!1846 lt!122982) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8883 () Bool)

(assert (= bs!8883 d!60203))

(declare-fun m!263055 () Bool)

(assert (=> bs!8883 m!263055))

(assert (=> bs!8883 m!263055))

(declare-fun m!263057 () Bool)

(assert (=> bs!8883 m!263057))

(assert (=> b!245758 d!60203))

(declare-fun d!60205 () Bool)

(assert (=> d!60205 (= (inRange!0 (index!6523 lt!123021) (mask!10659 thiss!1504)) (and (bvsge (index!6523 lt!123021) #b00000000000000000000000000000000) (bvslt (index!6523 lt!123021) (bvadd (mask!10659 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245824 d!60205))

(assert (=> bm!22957 d!60171))

(declare-fun d!60207 () Bool)

(assert (=> d!60207 (= (apply!231 lt!122982 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2952 (getValueByKey!287 (toList!1846 lt!122982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8884 () Bool)

(assert (= bs!8884 d!60207))

(assert (=> bs!8884 m!263051))

(assert (=> bs!8884 m!263051))

(declare-fun m!263059 () Bool)

(assert (=> bs!8884 m!263059))

(assert (=> b!245756 d!60207))

(declare-fun d!60209 () Bool)

(declare-fun e!159618 () Bool)

(assert (=> d!60209 e!159618))

(declare-fun res!120643 () Bool)

(assert (=> d!60209 (=> (not res!120643) (not e!159618))))

(declare-fun lt!123134 () ListLongMap!3661)

(assert (=> d!60209 (= res!120643 (contains!1760 lt!123134 (_1!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(declare-fun lt!123135 () List!3661)

(assert (=> d!60209 (= lt!123134 (ListLongMap!3662 lt!123135))))

(declare-fun lt!123136 () Unit!7576)

(declare-fun lt!123133 () Unit!7576)

(assert (=> d!60209 (= lt!123136 lt!123133)))

(assert (=> d!60209 (= (getValueByKey!287 lt!123135 (_1!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))) (Some!292 (_2!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(assert (=> d!60209 (= lt!123133 (lemmaContainsTupThenGetReturnValue!157 lt!123135 (_1!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) (_2!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(assert (=> d!60209 (= lt!123135 (insertStrictlySorted!160 (toList!1846 (ite c!41062 call!22961 (ite c!41063 call!22957 call!22956))) (_1!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) (_2!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(assert (=> d!60209 (= (+!664 (ite c!41062 call!22961 (ite c!41063 call!22957 call!22956)) (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) lt!123134)))

(declare-fun b!246070 () Bool)

(declare-fun res!120642 () Bool)

(assert (=> b!246070 (=> (not res!120642) (not e!159618))))

(assert (=> b!246070 (= res!120642 (= (getValueByKey!287 (toList!1846 lt!123134) (_1!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))) (Some!292 (_2!2390 (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))))

(declare-fun b!246071 () Bool)

(assert (=> b!246071 (= e!159618 (contains!1764 (toList!1846 lt!123134) (ite (or c!41062 c!41063) (tuple2!4759 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4759 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(assert (= (and d!60209 res!120643) b!246070))

(assert (= (and b!246070 res!120642) b!246071))

(declare-fun m!263061 () Bool)

(assert (=> d!60209 m!263061))

(declare-fun m!263063 () Bool)

(assert (=> d!60209 m!263063))

(declare-fun m!263065 () Bool)

(assert (=> d!60209 m!263065))

(declare-fun m!263067 () Bool)

(assert (=> d!60209 m!263067))

(declare-fun m!263069 () Bool)

(assert (=> b!246070 m!263069))

(declare-fun m!263071 () Bool)

(assert (=> b!246071 m!263071))

(assert (=> bm!22956 d!60209))

(assert (=> b!245698 d!60131))

(declare-fun d!60211 () Bool)

(declare-fun e!159620 () Bool)

(assert (=> d!60211 e!159620))

(declare-fun res!120644 () Bool)

(assert (=> d!60211 (=> res!120644 e!159620)))

(declare-fun lt!123138 () Bool)

(assert (=> d!60211 (= res!120644 (not lt!123138))))

(declare-fun lt!123137 () Bool)

(assert (=> d!60211 (= lt!123138 lt!123137)))

(declare-fun lt!123139 () Unit!7576)

(declare-fun e!159619 () Unit!7576)

(assert (=> d!60211 (= lt!123139 e!159619)))

(declare-fun c!41139 () Bool)

(assert (=> d!60211 (= c!41139 lt!123137)))

(assert (=> d!60211 (= lt!123137 (containsKey!279 (toList!1846 lt!122982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60211 (= (contains!1760 lt!122982 #b0000000000000000000000000000000000000000000000000000000000000000) lt!123138)))

(declare-fun b!246072 () Bool)

(declare-fun lt!123140 () Unit!7576)

(assert (=> b!246072 (= e!159619 lt!123140)))

(assert (=> b!246072 (= lt!123140 (lemmaContainsKeyImpliesGetValueByKeyDefined!228 (toList!1846 lt!122982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246072 (isDefined!229 (getValueByKey!287 (toList!1846 lt!122982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246073 () Bool)

(declare-fun Unit!7594 () Unit!7576)

(assert (=> b!246073 (= e!159619 Unit!7594)))

(declare-fun b!246074 () Bool)

(assert (=> b!246074 (= e!159620 (isDefined!229 (getValueByKey!287 (toList!1846 lt!122982) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60211 c!41139) b!246072))

(assert (= (and d!60211 (not c!41139)) b!246073))

(assert (= (and d!60211 (not res!120644)) b!246074))

(declare-fun m!263073 () Bool)

(assert (=> d!60211 m!263073))

(declare-fun m!263075 () Bool)

(assert (=> b!246072 m!263075))

(assert (=> b!246072 m!263055))

(assert (=> b!246072 m!263055))

(declare-fun m!263077 () Bool)

(assert (=> b!246072 m!263077))

(assert (=> b!246074 m!263055))

(assert (=> b!246074 m!263055))

(assert (=> b!246074 m!263077))

(assert (=> bm!22955 d!60211))

(assert (=> b!245694 d!60107))

(declare-fun mapNonEmpty!10904 () Bool)

(declare-fun mapRes!10904 () Bool)

(declare-fun tp!22928 () Bool)

(declare-fun e!159622 () Bool)

(assert (=> mapNonEmpty!10904 (= mapRes!10904 (and tp!22928 e!159622))))

(declare-fun mapKey!10904 () (_ BitVec 32))

(declare-fun mapRest!10904 () (Array (_ BitVec 32) ValueCell!2867))

(declare-fun mapValue!10904 () ValueCell!2867)

(assert (=> mapNonEmpty!10904 (= mapRest!10903 (store mapRest!10904 mapKey!10904 mapValue!10904))))

(declare-fun condMapEmpty!10904 () Bool)

(declare-fun mapDefault!10904 () ValueCell!2867)

(assert (=> mapNonEmpty!10903 (= condMapEmpty!10904 (= mapRest!10903 ((as const (Array (_ BitVec 32) ValueCell!2867)) mapDefault!10904)))))

(declare-fun e!159621 () Bool)

(assert (=> mapNonEmpty!10903 (= tp!22927 (and e!159621 mapRes!10904))))

(declare-fun mapIsEmpty!10904 () Bool)

(assert (=> mapIsEmpty!10904 mapRes!10904))

(declare-fun b!246075 () Bool)

(assert (=> b!246075 (= e!159622 tp_is_empty!6421)))

(declare-fun b!246076 () Bool)

(assert (=> b!246076 (= e!159621 tp_is_empty!6421)))

(assert (= (and mapNonEmpty!10903 condMapEmpty!10904) mapIsEmpty!10904))

(assert (= (and mapNonEmpty!10903 (not condMapEmpty!10904)) mapNonEmpty!10904))

(assert (= (and mapNonEmpty!10904 ((_ is ValueCellFull!2867) mapValue!10904)) b!246075))

(assert (= (and mapNonEmpty!10903 ((_ is ValueCellFull!2867) mapDefault!10904)) b!246076))

(declare-fun m!263079 () Bool)

(assert (=> mapNonEmpty!10904 m!263079))

(declare-fun b_lambda!8017 () Bool)

(assert (= b_lambda!8015 (or (and b!245523 b_free!6559) b_lambda!8017)))

(declare-fun b_lambda!8019 () Bool)

(assert (= b_lambda!8013 (or (and b!245523 b_free!6559) b_lambda!8019)))

(check-sat (not b!246064) (not d!60211) (not b!246074) (not b!246013) (not b!246024) b_and!13533 (not b!245899) (not b!246027) (not b_next!6559) (not b!246019) (not d!60187) (not b!246067) (not d!60181) (not b!245868) (not b!246015) (not bm!22969) (not bm!22971) (not b!246062) (not d!60203) (not b!246028) (not d!60109) (not b!246020) (not b!245950) (not d!60157) (not d!60183) (not d!60125) (not bm!22981) (not d!60189) (not b!245870) (not d!60191) (not mapNonEmpty!10904) (not d!60207) (not d!60119) (not b!245915) (not b!245889) (not d!60201) (not b!245911) (not b!245863) (not bm!22972) (not d!60195) (not b!246016) (not d!60121) (not b!246023) (not b!245877) (not b!246022) (not b!246014) (not bm!22970) tp_is_empty!6421 (not d!60155) (not b!245965) (not d!60127) (not d!60173) (not d!60163) (not b!246071) (not b_lambda!8017) (not d!60115) (not b!245872) (not b!246061) (not b!246031) (not b!246018) (not b!245912) (not b!246069) (not d!60179) (not bm!22975) (not d!60171) (not d!60169) (not b!245946) (not d!60177) (not d!60145) (not b_lambda!8019) (not b!246021) (not d!60133) (not d!60167) (not d!60161) (not b!245980) (not d!60209) (not b!245859) (not b!245875) (not b!246029) (not bm!22965) (not b!245853) (not b!245971) (not d!60185) (not b!245883) (not b!246072) (not b!245938) (not d!60175) (not d!60165) (not bm!22980) (not b!245972) (not b_lambda!8011) (not b!246063) (not bm!22982) (not b!246025) (not d!60137) (not d!60141) (not b!245901) (not b!245973) (not b!246033) (not b!245860) (not d!60193) (not b!245871) (not b!245869) (not b!246070) (not bm!22968) (not b!246034))
(check-sat b_and!13533 (not b_next!6559))
