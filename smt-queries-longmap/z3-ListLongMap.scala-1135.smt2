; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23370 () Bool)

(assert start!23370)

(declare-fun b!245709 () Bool)

(declare-fun b_free!6559 () Bool)

(declare-fun b_next!6559 () Bool)

(assert (=> b!245709 (= b_free!6559 (not b_next!6559))))

(declare-fun tp!22911 () Bool)

(declare-fun b_and!13563 () Bool)

(assert (=> b!245709 (= tp!22911 b_and!13563)))

(declare-fun bm!22929 () Bool)

(declare-fun call!22932 () Bool)

(declare-datatypes ((V!8209 0))(
  ( (V!8210 (val!3255 Int)) )
))
(declare-datatypes ((ValueCell!2867 0))(
  ( (ValueCellFull!2867 (v!5309 V!8209)) (EmptyCell!2867) )
))
(declare-datatypes ((array!12139 0))(
  ( (array!12140 (arr!5761 (Array (_ BitVec 32) ValueCell!2867)) (size!6103 (_ BitVec 32))) )
))
(declare-datatypes ((array!12141 0))(
  ( (array!12142 (arr!5762 (Array (_ BitVec 32) (_ BitVec 64))) (size!6104 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3634 0))(
  ( (LongMapFixedSize!3635 (defaultEntry!4546 Int) (mask!10660 (_ BitVec 32)) (extraKeys!4283 (_ BitVec 32)) (zeroValue!4387 V!8209) (minValue!4387 V!8209) (_size!1866 (_ BitVec 32)) (_keys!6661 array!12141) (_values!4529 array!12139) (_vacant!1866 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3634)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22929 (= call!22932 (arrayContainsKey!0 (_keys!6661 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245699 () Bool)

(declare-fun e!159391 () Bool)

(assert (=> b!245699 (= e!159391 (= (size!6104 (_keys!6661 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10660 thiss!1504))))))

(declare-fun b!245700 () Bool)

(declare-fun res!120507 () Bool)

(declare-fun e!159401 () Bool)

(assert (=> b!245700 (=> (not res!120507) (not e!159401))))

(declare-datatypes ((SeekEntryResult!1057 0))(
  ( (MissingZero!1057 (index!6398 (_ BitVec 32))) (Found!1057 (index!6399 (_ BitVec 32))) (Intermediate!1057 (undefined!1869 Bool) (index!6400 (_ BitVec 32)) (x!24405 (_ BitVec 32))) (Undefined!1057) (MissingVacant!1057 (index!6401 (_ BitVec 32))) )
))
(declare-fun lt!123095 () SeekEntryResult!1057)

(assert (=> b!245700 (= res!120507 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6398 lt!123095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245701 () Bool)

(declare-fun res!120510 () Bool)

(assert (=> b!245701 (=> (not res!120510) (not e!159401))))

(declare-fun call!22933 () Bool)

(assert (=> b!245701 (= res!120510 call!22933)))

(declare-fun e!159392 () Bool)

(assert (=> b!245701 (= e!159392 e!159401)))

(declare-fun mapNonEmpty!10894 () Bool)

(declare-fun mapRes!10894 () Bool)

(declare-fun tp!22912 () Bool)

(declare-fun e!159396 () Bool)

(assert (=> mapNonEmpty!10894 (= mapRes!10894 (and tp!22912 e!159396))))

(declare-fun mapKey!10894 () (_ BitVec 32))

(declare-fun mapRest!10894 () (Array (_ BitVec 32) ValueCell!2867))

(declare-fun mapValue!10894 () ValueCell!2867)

(assert (=> mapNonEmpty!10894 (= (arr!5761 (_values!4529 thiss!1504)) (store mapRest!10894 mapKey!10894 mapValue!10894))))

(declare-fun res!120505 () Bool)

(declare-fun e!159398 () Bool)

(assert (=> start!23370 (=> (not res!120505) (not e!159398))))

(declare-fun valid!1435 (LongMapFixedSize!3634) Bool)

(assert (=> start!23370 (= res!120505 (valid!1435 thiss!1504))))

(assert (=> start!23370 e!159398))

(declare-fun e!159397 () Bool)

(assert (=> start!23370 e!159397))

(assert (=> start!23370 true))

(declare-fun b!245702 () Bool)

(assert (=> b!245702 (= e!159401 (not call!22932))))

(declare-fun b!245703 () Bool)

(declare-fun e!159395 () Bool)

(get-info :version)

(assert (=> b!245703 (= e!159395 ((_ is Undefined!1057) lt!123095))))

(declare-fun b!245704 () Bool)

(declare-fun e!159405 () Bool)

(declare-fun e!159400 () Bool)

(assert (=> b!245704 (= e!159405 e!159400)))

(declare-fun res!120508 () Bool)

(assert (=> b!245704 (=> (not res!120508) (not e!159400))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245704 (= res!120508 (inRange!0 index!297 (mask!10660 thiss!1504)))))

(declare-datatypes ((Unit!7572 0))(
  ( (Unit!7573) )
))
(declare-fun lt!123089 () Unit!7572)

(declare-fun e!159402 () Unit!7572)

(assert (=> b!245704 (= lt!123089 e!159402)))

(declare-fun c!41044 () Bool)

(declare-datatypes ((tuple2!4722 0))(
  ( (tuple2!4723 (_1!2372 (_ BitVec 64)) (_2!2372 V!8209)) )
))
(declare-datatypes ((List!3598 0))(
  ( (Nil!3595) (Cons!3594 (h!4251 tuple2!4722) (t!8605 List!3598)) )
))
(declare-datatypes ((ListLongMap!3637 0))(
  ( (ListLongMap!3638 (toList!1834 List!3598)) )
))
(declare-fun contains!1759 (ListLongMap!3637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1366 (array!12141 array!12139 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 32) Int) ListLongMap!3637)

(assert (=> b!245704 (= c!41044 (contains!1759 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) key!932))))

(declare-fun b!245705 () Bool)

(declare-fun res!120509 () Bool)

(assert (=> b!245705 (=> (not res!120509) (not e!159398))))

(assert (=> b!245705 (= res!120509 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!22930 () Bool)

(declare-fun c!41046 () Bool)

(assert (=> bm!22930 (= call!22933 (inRange!0 (ite c!41046 (index!6398 lt!123095) (index!6401 lt!123095)) (mask!10660 thiss!1504)))))

(declare-fun b!245706 () Bool)

(declare-fun c!41043 () Bool)

(assert (=> b!245706 (= c!41043 ((_ is MissingVacant!1057) lt!123095))))

(assert (=> b!245706 (= e!159392 e!159395)))

(declare-fun b!245707 () Bool)

(declare-fun e!159393 () Bool)

(declare-fun tp_is_empty!6421 () Bool)

(assert (=> b!245707 (= e!159393 tp_is_empty!6421)))

(declare-fun b!245708 () Bool)

(declare-fun e!159399 () Bool)

(assert (=> b!245708 (= e!159399 (not call!22932))))

(declare-fun e!159403 () Bool)

(declare-fun array_inv!3789 (array!12141) Bool)

(declare-fun array_inv!3790 (array!12139) Bool)

(assert (=> b!245709 (= e!159397 (and tp!22911 tp_is_empty!6421 (array_inv!3789 (_keys!6661 thiss!1504)) (array_inv!3790 (_values!4529 thiss!1504)) e!159403))))

(declare-fun b!245710 () Bool)

(declare-fun lt!123091 () Unit!7572)

(assert (=> b!245710 (= e!159402 lt!123091)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (array!12141 array!12139 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) Int) Unit!7572)

(assert (=> b!245710 (= lt!123091 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)))))

(assert (=> b!245710 (= c!41046 ((_ is MissingZero!1057) lt!123095))))

(assert (=> b!245710 e!159392))

(declare-fun b!245711 () Bool)

(assert (=> b!245711 (= e!159396 tp_is_empty!6421)))

(declare-fun b!245712 () Bool)

(assert (=> b!245712 (= e!159403 (and e!159393 mapRes!10894))))

(declare-fun condMapEmpty!10894 () Bool)

(declare-fun mapDefault!10894 () ValueCell!2867)

(assert (=> b!245712 (= condMapEmpty!10894 (= (arr!5761 (_values!4529 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2867)) mapDefault!10894)))))

(declare-fun b!245713 () Bool)

(declare-fun Unit!7574 () Unit!7572)

(assert (=> b!245713 (= e!159402 Unit!7574)))

(declare-fun lt!123090 () Unit!7572)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!373 (array!12141 array!12139 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) Int) Unit!7572)

(assert (=> b!245713 (= lt!123090 (lemmaInListMapThenSeekEntryOrOpenFindsIt!373 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)))))

(assert (=> b!245713 false))

(declare-fun b!245714 () Bool)

(declare-fun res!120503 () Bool)

(assert (=> b!245714 (= res!120503 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6401 lt!123095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245714 (=> (not res!120503) (not e!159399))))

(declare-fun b!245715 () Bool)

(assert (=> b!245715 (= e!159400 (not e!159391))))

(declare-fun res!120506 () Bool)

(assert (=> b!245715 (=> res!120506 e!159391)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!245715 (= res!120506 (not (validMask!0 (mask!10660 thiss!1504))))))

(declare-fun lt!123087 () array!12141)

(declare-fun arrayCountValidKeys!0 (array!12141 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245715 (= (arrayCountValidKeys!0 lt!123087 #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6661 thiss!1504) #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504)))))))

(declare-fun lt!123088 () Unit!7572)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12141 (_ BitVec 32) (_ BitVec 64)) Unit!7572)

(assert (=> b!245715 (= lt!123088 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6661 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3599 0))(
  ( (Nil!3596) (Cons!3595 (h!4252 (_ BitVec 64)) (t!8606 List!3599)) )
))
(declare-fun arrayNoDuplicates!0 (array!12141 (_ BitVec 32) List!3599) Bool)

(assert (=> b!245715 (arrayNoDuplicates!0 lt!123087 #b00000000000000000000000000000000 Nil!3596)))

(assert (=> b!245715 (= lt!123087 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun lt!123093 () Unit!7572)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12141 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3599) Unit!7572)

(assert (=> b!245715 (= lt!123093 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6661 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3596))))

(declare-fun lt!123094 () Unit!7572)

(declare-fun e!159394 () Unit!7572)

(assert (=> b!245715 (= lt!123094 e!159394)))

(declare-fun c!41045 () Bool)

(assert (=> b!245715 (= c!41045 (arrayContainsKey!0 (_keys!6661 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10894 () Bool)

(assert (=> mapIsEmpty!10894 mapRes!10894))

(declare-fun b!245716 () Bool)

(assert (=> b!245716 (= e!159398 e!159405)))

(declare-fun res!120504 () Bool)

(assert (=> b!245716 (=> (not res!120504) (not e!159405))))

(assert (=> b!245716 (= res!120504 (or (= lt!123095 (MissingZero!1057 index!297)) (= lt!123095 (MissingVacant!1057 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12141 (_ BitVec 32)) SeekEntryResult!1057)

(assert (=> b!245716 (= lt!123095 (seekEntryOrOpen!0 key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(declare-fun b!245717 () Bool)

(declare-fun Unit!7575 () Unit!7572)

(assert (=> b!245717 (= e!159394 Unit!7575)))

(declare-fun lt!123092 () Unit!7572)

(declare-fun lemmaArrayContainsKeyThenInListMap!189 (array!12141 array!12139 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) (_ BitVec 32) Int) Unit!7572)

(assert (=> b!245717 (= lt!123092 (lemmaArrayContainsKeyThenInListMap!189 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(assert (=> b!245717 false))

(declare-fun b!245718 () Bool)

(declare-fun Unit!7576 () Unit!7572)

(assert (=> b!245718 (= e!159394 Unit!7576)))

(declare-fun b!245719 () Bool)

(assert (=> b!245719 (= e!159395 e!159399)))

(declare-fun res!120502 () Bool)

(assert (=> b!245719 (= res!120502 call!22933)))

(assert (=> b!245719 (=> (not res!120502) (not e!159399))))

(assert (= (and start!23370 res!120505) b!245705))

(assert (= (and b!245705 res!120509) b!245716))

(assert (= (and b!245716 res!120504) b!245704))

(assert (= (and b!245704 c!41044) b!245713))

(assert (= (and b!245704 (not c!41044)) b!245710))

(assert (= (and b!245710 c!41046) b!245701))

(assert (= (and b!245710 (not c!41046)) b!245706))

(assert (= (and b!245701 res!120510) b!245700))

(assert (= (and b!245700 res!120507) b!245702))

(assert (= (and b!245706 c!41043) b!245719))

(assert (= (and b!245706 (not c!41043)) b!245703))

(assert (= (and b!245719 res!120502) b!245714))

(assert (= (and b!245714 res!120503) b!245708))

(assert (= (or b!245701 b!245719) bm!22930))

(assert (= (or b!245702 b!245708) bm!22929))

(assert (= (and b!245704 res!120508) b!245715))

(assert (= (and b!245715 c!41045) b!245717))

(assert (= (and b!245715 (not c!41045)) b!245718))

(assert (= (and b!245715 (not res!120506)) b!245699))

(assert (= (and b!245712 condMapEmpty!10894) mapIsEmpty!10894))

(assert (= (and b!245712 (not condMapEmpty!10894)) mapNonEmpty!10894))

(assert (= (and mapNonEmpty!10894 ((_ is ValueCellFull!2867) mapValue!10894)) b!245711))

(assert (= (and b!245712 ((_ is ValueCellFull!2867) mapDefault!10894)) b!245707))

(assert (= b!245709 b!245712))

(assert (= start!23370 b!245709))

(declare-fun m!263355 () Bool)

(assert (=> mapNonEmpty!10894 m!263355))

(declare-fun m!263357 () Bool)

(assert (=> b!245700 m!263357))

(declare-fun m!263359 () Bool)

(assert (=> bm!22929 m!263359))

(declare-fun m!263361 () Bool)

(assert (=> b!245715 m!263361))

(assert (=> b!245715 m!263359))

(declare-fun m!263363 () Bool)

(assert (=> b!245715 m!263363))

(declare-fun m!263365 () Bool)

(assert (=> b!245715 m!263365))

(declare-fun m!263367 () Bool)

(assert (=> b!245715 m!263367))

(declare-fun m!263369 () Bool)

(assert (=> b!245715 m!263369))

(declare-fun m!263371 () Bool)

(assert (=> b!245715 m!263371))

(declare-fun m!263373 () Bool)

(assert (=> b!245715 m!263373))

(declare-fun m!263375 () Bool)

(assert (=> b!245717 m!263375))

(declare-fun m!263377 () Bool)

(assert (=> b!245713 m!263377))

(declare-fun m!263379 () Bool)

(assert (=> bm!22930 m!263379))

(declare-fun m!263381 () Bool)

(assert (=> b!245714 m!263381))

(declare-fun m!263383 () Bool)

(assert (=> start!23370 m!263383))

(declare-fun m!263385 () Bool)

(assert (=> b!245716 m!263385))

(declare-fun m!263387 () Bool)

(assert (=> b!245710 m!263387))

(declare-fun m!263389 () Bool)

(assert (=> b!245709 m!263389))

(declare-fun m!263391 () Bool)

(assert (=> b!245709 m!263391))

(declare-fun m!263393 () Bool)

(assert (=> b!245704 m!263393))

(declare-fun m!263395 () Bool)

(assert (=> b!245704 m!263395))

(assert (=> b!245704 m!263395))

(declare-fun m!263397 () Bool)

(assert (=> b!245704 m!263397))

(check-sat (not b!245704) (not mapNonEmpty!10894) (not b!245715) (not b!245710) b_and!13563 (not b_next!6559) (not b!245716) (not b!245713) (not bm!22929) (not bm!22930) tp_is_empty!6421 (not b!245717) (not b!245709) (not start!23370))
(check-sat b_and!13563 (not b_next!6559))
(get-model)

(declare-fun d!60293 () Bool)

(declare-fun res!120569 () Bool)

(declare-fun e!159500 () Bool)

(assert (=> d!60293 (=> res!120569 e!159500)))

(assert (=> d!60293 (= res!120569 (= (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60293 (= (arrayContainsKey!0 (_keys!6661 thiss!1504) key!932 #b00000000000000000000000000000000) e!159500)))

(declare-fun b!245850 () Bool)

(declare-fun e!159501 () Bool)

(assert (=> b!245850 (= e!159500 e!159501)))

(declare-fun res!120570 () Bool)

(assert (=> b!245850 (=> (not res!120570) (not e!159501))))

(assert (=> b!245850 (= res!120570 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!245851 () Bool)

(assert (=> b!245851 (= e!159501 (arrayContainsKey!0 (_keys!6661 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60293 (not res!120569)) b!245850))

(assert (= (and b!245850 res!120570) b!245851))

(declare-fun m!263487 () Bool)

(assert (=> d!60293 m!263487))

(declare-fun m!263489 () Bool)

(assert (=> b!245851 m!263489))

(assert (=> bm!22929 d!60293))

(declare-fun d!60295 () Bool)

(declare-fun lt!123158 () SeekEntryResult!1057)

(assert (=> d!60295 (and (or ((_ is Undefined!1057) lt!123158) (not ((_ is Found!1057) lt!123158)) (and (bvsge (index!6399 lt!123158) #b00000000000000000000000000000000) (bvslt (index!6399 lt!123158) (size!6104 (_keys!6661 thiss!1504))))) (or ((_ is Undefined!1057) lt!123158) ((_ is Found!1057) lt!123158) (not ((_ is MissingZero!1057) lt!123158)) (and (bvsge (index!6398 lt!123158) #b00000000000000000000000000000000) (bvslt (index!6398 lt!123158) (size!6104 (_keys!6661 thiss!1504))))) (or ((_ is Undefined!1057) lt!123158) ((_ is Found!1057) lt!123158) ((_ is MissingZero!1057) lt!123158) (not ((_ is MissingVacant!1057) lt!123158)) (and (bvsge (index!6401 lt!123158) #b00000000000000000000000000000000) (bvslt (index!6401 lt!123158) (size!6104 (_keys!6661 thiss!1504))))) (or ((_ is Undefined!1057) lt!123158) (ite ((_ is Found!1057) lt!123158) (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6399 lt!123158)) key!932) (ite ((_ is MissingZero!1057) lt!123158) (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6398 lt!123158)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1057) lt!123158) (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6401 lt!123158)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!159508 () SeekEntryResult!1057)

(assert (=> d!60295 (= lt!123158 e!159508)))

(declare-fun c!41077 () Bool)

(declare-fun lt!123157 () SeekEntryResult!1057)

(assert (=> d!60295 (= c!41077 (and ((_ is Intermediate!1057) lt!123157) (undefined!1869 lt!123157)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12141 (_ BitVec 32)) SeekEntryResult!1057)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60295 (= lt!123157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10660 thiss!1504)) key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(assert (=> d!60295 (validMask!0 (mask!10660 thiss!1504))))

(assert (=> d!60295 (= (seekEntryOrOpen!0 key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)) lt!123158)))

(declare-fun b!245864 () Bool)

(declare-fun e!159509 () SeekEntryResult!1057)

(assert (=> b!245864 (= e!159509 (Found!1057 (index!6400 lt!123157)))))

(declare-fun b!245865 () Bool)

(assert (=> b!245865 (= e!159508 e!159509)))

(declare-fun lt!123156 () (_ BitVec 64))

(assert (=> b!245865 (= lt!123156 (select (arr!5762 (_keys!6661 thiss!1504)) (index!6400 lt!123157)))))

(declare-fun c!41078 () Bool)

(assert (=> b!245865 (= c!41078 (= lt!123156 key!932))))

(declare-fun b!245866 () Bool)

(declare-fun e!159510 () SeekEntryResult!1057)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12141 (_ BitVec 32)) SeekEntryResult!1057)

(assert (=> b!245866 (= e!159510 (seekKeyOrZeroReturnVacant!0 (x!24405 lt!123157) (index!6400 lt!123157) (index!6400 lt!123157) key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(declare-fun b!245867 () Bool)

(declare-fun c!41079 () Bool)

(assert (=> b!245867 (= c!41079 (= lt!123156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245867 (= e!159509 e!159510)))

(declare-fun b!245868 () Bool)

(assert (=> b!245868 (= e!159508 Undefined!1057)))

(declare-fun b!245869 () Bool)

(assert (=> b!245869 (= e!159510 (MissingZero!1057 (index!6400 lt!123157)))))

(assert (= (and d!60295 c!41077) b!245868))

(assert (= (and d!60295 (not c!41077)) b!245865))

(assert (= (and b!245865 c!41078) b!245864))

(assert (= (and b!245865 (not c!41078)) b!245867))

(assert (= (and b!245867 c!41079) b!245869))

(assert (= (and b!245867 (not c!41079)) b!245866))

(declare-fun m!263491 () Bool)

(assert (=> d!60295 m!263491))

(assert (=> d!60295 m!263361))

(declare-fun m!263493 () Bool)

(assert (=> d!60295 m!263493))

(assert (=> d!60295 m!263491))

(declare-fun m!263495 () Bool)

(assert (=> d!60295 m!263495))

(declare-fun m!263497 () Bool)

(assert (=> d!60295 m!263497))

(declare-fun m!263499 () Bool)

(assert (=> d!60295 m!263499))

(declare-fun m!263501 () Bool)

(assert (=> b!245865 m!263501))

(declare-fun m!263503 () Bool)

(assert (=> b!245866 m!263503))

(assert (=> b!245716 d!60295))

(declare-fun d!60297 () Bool)

(assert (=> d!60297 (= (inRange!0 (ite c!41046 (index!6398 lt!123095) (index!6401 lt!123095)) (mask!10660 thiss!1504)) (and (bvsge (ite c!41046 (index!6398 lt!123095) (index!6401 lt!123095)) #b00000000000000000000000000000000) (bvslt (ite c!41046 (index!6398 lt!123095) (index!6401 lt!123095)) (bvadd (mask!10660 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22930 d!60297))

(declare-fun c!41084 () Bool)

(declare-fun bm!22947 () Bool)

(declare-fun call!22950 () Bool)

(declare-fun lt!123164 () SeekEntryResult!1057)

(assert (=> bm!22947 (= call!22950 (inRange!0 (ite c!41084 (index!6398 lt!123164) (index!6401 lt!123164)) (mask!10660 thiss!1504)))))

(declare-fun b!245886 () Bool)

(declare-fun res!120579 () Bool)

(declare-fun e!159520 () Bool)

(assert (=> b!245886 (=> (not res!120579) (not e!159520))))

(assert (=> b!245886 (= res!120579 call!22950)))

(declare-fun e!159521 () Bool)

(assert (=> b!245886 (= e!159521 e!159520)))

(declare-fun b!245887 () Bool)

(assert (=> b!245887 (and (bvsge (index!6398 lt!123164) #b00000000000000000000000000000000) (bvslt (index!6398 lt!123164) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun res!120580 () Bool)

(assert (=> b!245887 (= res!120580 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6398 lt!123164)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159519 () Bool)

(assert (=> b!245887 (=> (not res!120580) (not e!159519))))

(declare-fun b!245888 () Bool)

(declare-fun e!159522 () Bool)

(assert (=> b!245888 (= e!159522 e!159521)))

(declare-fun c!41085 () Bool)

(assert (=> b!245888 (= c!41085 ((_ is MissingVacant!1057) lt!123164))))

(declare-fun bm!22948 () Bool)

(declare-fun call!22951 () Bool)

(assert (=> bm!22948 (= call!22951 (arrayContainsKey!0 (_keys!6661 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245889 () Bool)

(assert (=> b!245889 (= e!159520 (not call!22951))))

(declare-fun d!60299 () Bool)

(assert (=> d!60299 e!159522))

(assert (=> d!60299 (= c!41084 ((_ is MissingZero!1057) lt!123164))))

(assert (=> d!60299 (= lt!123164 (seekEntryOrOpen!0 key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(declare-fun lt!123163 () Unit!7572)

(declare-fun choose!1156 (array!12141 array!12139 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) Int) Unit!7572)

(assert (=> d!60299 (= lt!123163 (choose!1156 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)))))

(assert (=> d!60299 (validMask!0 (mask!10660 thiss!1504))))

(assert (=> d!60299 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!364 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)) lt!123163)))

(declare-fun b!245890 () Bool)

(declare-fun res!120582 () Bool)

(assert (=> b!245890 (=> (not res!120582) (not e!159520))))

(assert (=> b!245890 (= res!120582 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6401 lt!123164)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245890 (and (bvsge (index!6401 lt!123164) #b00000000000000000000000000000000) (bvslt (index!6401 lt!123164) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!245891 () Bool)

(assert (=> b!245891 (= e!159522 e!159519)))

(declare-fun res!120581 () Bool)

(assert (=> b!245891 (= res!120581 call!22950)))

(assert (=> b!245891 (=> (not res!120581) (not e!159519))))

(declare-fun b!245892 () Bool)

(assert (=> b!245892 (= e!159521 ((_ is Undefined!1057) lt!123164))))

(declare-fun b!245893 () Bool)

(assert (=> b!245893 (= e!159519 (not call!22951))))

(assert (= (and d!60299 c!41084) b!245891))

(assert (= (and d!60299 (not c!41084)) b!245888))

(assert (= (and b!245891 res!120581) b!245887))

(assert (= (and b!245887 res!120580) b!245893))

(assert (= (and b!245888 c!41085) b!245886))

(assert (= (and b!245888 (not c!41085)) b!245892))

(assert (= (and b!245886 res!120579) b!245890))

(assert (= (and b!245890 res!120582) b!245889))

(assert (= (or b!245891 b!245886) bm!22947))

(assert (= (or b!245893 b!245889) bm!22948))

(assert (=> d!60299 m!263385))

(declare-fun m!263505 () Bool)

(assert (=> d!60299 m!263505))

(assert (=> d!60299 m!263361))

(declare-fun m!263507 () Bool)

(assert (=> b!245890 m!263507))

(assert (=> bm!22948 m!263359))

(declare-fun m!263509 () Bool)

(assert (=> bm!22947 m!263509))

(declare-fun m!263511 () Bool)

(assert (=> b!245887 m!263511))

(assert (=> b!245710 d!60299))

(declare-fun d!60301 () Bool)

(declare-fun res!120589 () Bool)

(declare-fun e!159525 () Bool)

(assert (=> d!60301 (=> (not res!120589) (not e!159525))))

(declare-fun simpleValid!254 (LongMapFixedSize!3634) Bool)

(assert (=> d!60301 (= res!120589 (simpleValid!254 thiss!1504))))

(assert (=> d!60301 (= (valid!1435 thiss!1504) e!159525)))

(declare-fun b!245900 () Bool)

(declare-fun res!120590 () Bool)

(assert (=> b!245900 (=> (not res!120590) (not e!159525))))

(assert (=> b!245900 (= res!120590 (= (arrayCountValidKeys!0 (_keys!6661 thiss!1504) #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) (_size!1866 thiss!1504)))))

(declare-fun b!245901 () Bool)

(declare-fun res!120591 () Bool)

(assert (=> b!245901 (=> (not res!120591) (not e!159525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12141 (_ BitVec 32)) Bool)

(assert (=> b!245901 (= res!120591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(declare-fun b!245902 () Bool)

(assert (=> b!245902 (= e!159525 (arrayNoDuplicates!0 (_keys!6661 thiss!1504) #b00000000000000000000000000000000 Nil!3596))))

(assert (= (and d!60301 res!120589) b!245900))

(assert (= (and b!245900 res!120590) b!245901))

(assert (= (and b!245901 res!120591) b!245902))

(declare-fun m!263513 () Bool)

(assert (=> d!60301 m!263513))

(assert (=> b!245900 m!263371))

(declare-fun m!263515 () Bool)

(assert (=> b!245901 m!263515))

(declare-fun m!263517 () Bool)

(assert (=> b!245902 m!263517))

(assert (=> start!23370 d!60301))

(declare-fun b!245913 () Bool)

(declare-fun e!159530 () Bool)

(assert (=> b!245913 (= e!159530 (bvslt (size!6104 (_keys!6661 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun e!159531 () Bool)

(declare-fun b!245914 () Bool)

(assert (=> b!245914 (= e!159531 (= (arrayCountValidKeys!0 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))) #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6661 thiss!1504) #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!245911 () Bool)

(declare-fun res!120600 () Bool)

(assert (=> b!245911 (=> (not res!120600) (not e!159530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!245911 (= res!120600 (not (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) index!297))))))

(declare-fun b!245912 () Bool)

(declare-fun res!120601 () Bool)

(assert (=> b!245912 (=> (not res!120601) (not e!159530))))

(assert (=> b!245912 (= res!120601 (validKeyInArray!0 key!932))))

(declare-fun d!60303 () Bool)

(assert (=> d!60303 e!159531))

(declare-fun res!120602 () Bool)

(assert (=> d!60303 (=> (not res!120602) (not e!159531))))

(assert (=> d!60303 (= res!120602 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6104 (_keys!6661 thiss!1504)))))))

(declare-fun lt!123167 () Unit!7572)

(declare-fun choose!1 (array!12141 (_ BitVec 32) (_ BitVec 64)) Unit!7572)

(assert (=> d!60303 (= lt!123167 (choose!1 (_keys!6661 thiss!1504) index!297 key!932))))

(assert (=> d!60303 e!159530))

(declare-fun res!120603 () Bool)

(assert (=> d!60303 (=> (not res!120603) (not e!159530))))

(assert (=> d!60303 (= res!120603 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6104 (_keys!6661 thiss!1504)))))))

(assert (=> d!60303 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6661 thiss!1504) index!297 key!932) lt!123167)))

(assert (= (and d!60303 res!120603) b!245911))

(assert (= (and b!245911 res!120600) b!245912))

(assert (= (and b!245912 res!120601) b!245913))

(assert (= (and d!60303 res!120602) b!245914))

(assert (=> b!245914 m!263369))

(declare-fun m!263519 () Bool)

(assert (=> b!245914 m!263519))

(assert (=> b!245914 m!263371))

(declare-fun m!263521 () Bool)

(assert (=> b!245911 m!263521))

(assert (=> b!245911 m!263521))

(declare-fun m!263523 () Bool)

(assert (=> b!245911 m!263523))

(declare-fun m!263525 () Bool)

(assert (=> b!245912 m!263525))

(declare-fun m!263527 () Bool)

(assert (=> d!60303 m!263527))

(assert (=> b!245715 d!60303))

(declare-fun b!245923 () Bool)

(declare-fun e!159537 () (_ BitVec 32))

(declare-fun call!22954 () (_ BitVec 32))

(assert (=> b!245923 (= e!159537 call!22954)))

(declare-fun b!245924 () Bool)

(declare-fun e!159536 () (_ BitVec 32))

(assert (=> b!245924 (= e!159536 e!159537)))

(declare-fun c!41091 () Bool)

(assert (=> b!245924 (= c!41091 (validKeyInArray!0 (select (arr!5762 lt!123087) #b00000000000000000000000000000000)))))

(declare-fun b!245925 () Bool)

(assert (=> b!245925 (= e!159537 (bvadd #b00000000000000000000000000000001 call!22954))))

(declare-fun d!60305 () Bool)

(declare-fun lt!123170 () (_ BitVec 32))

(assert (=> d!60305 (and (bvsge lt!123170 #b00000000000000000000000000000000) (bvsle lt!123170 (bvsub (size!6104 lt!123087) #b00000000000000000000000000000000)))))

(assert (=> d!60305 (= lt!123170 e!159536)))

(declare-fun c!41090 () Bool)

(assert (=> d!60305 (= c!41090 (bvsge #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60305 (and (bvsle #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6104 (_keys!6661 thiss!1504)) (size!6104 lt!123087)))))

(assert (=> d!60305 (= (arrayCountValidKeys!0 lt!123087 #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) lt!123170)))

(declare-fun bm!22951 () Bool)

(assert (=> bm!22951 (= call!22954 (arrayCountValidKeys!0 lt!123087 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!245926 () Bool)

(assert (=> b!245926 (= e!159536 #b00000000000000000000000000000000)))

(assert (= (and d!60305 c!41090) b!245926))

(assert (= (and d!60305 (not c!41090)) b!245924))

(assert (= (and b!245924 c!41091) b!245925))

(assert (= (and b!245924 (not c!41091)) b!245923))

(assert (= (or b!245925 b!245923) bm!22951))

(declare-fun m!263529 () Bool)

(assert (=> b!245924 m!263529))

(assert (=> b!245924 m!263529))

(declare-fun m!263531 () Bool)

(assert (=> b!245924 m!263531))

(declare-fun m!263533 () Bool)

(assert (=> bm!22951 m!263533))

(assert (=> b!245715 d!60305))

(assert (=> b!245715 d!60293))

(declare-fun b!245927 () Bool)

(declare-fun e!159539 () (_ BitVec 32))

(declare-fun call!22955 () (_ BitVec 32))

(assert (=> b!245927 (= e!159539 call!22955)))

(declare-fun b!245928 () Bool)

(declare-fun e!159538 () (_ BitVec 32))

(assert (=> b!245928 (= e!159538 e!159539)))

(declare-fun c!41093 () Bool)

(assert (=> b!245928 (= c!41093 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245929 () Bool)

(assert (=> b!245929 (= e!159539 (bvadd #b00000000000000000000000000000001 call!22955))))

(declare-fun d!60307 () Bool)

(declare-fun lt!123171 () (_ BitVec 32))

(assert (=> d!60307 (and (bvsge lt!123171 #b00000000000000000000000000000000) (bvsle lt!123171 (bvsub (size!6104 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60307 (= lt!123171 e!159538)))

(declare-fun c!41092 () Bool)

(assert (=> d!60307 (= c!41092 (bvsge #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60307 (and (bvsle #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6104 (_keys!6661 thiss!1504)) (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60307 (= (arrayCountValidKeys!0 (_keys!6661 thiss!1504) #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) lt!123171)))

(declare-fun bm!22952 () Bool)

(assert (=> bm!22952 (= call!22955 (arrayCountValidKeys!0 (_keys!6661 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!245930 () Bool)

(assert (=> b!245930 (= e!159538 #b00000000000000000000000000000000)))

(assert (= (and d!60307 c!41092) b!245930))

(assert (= (and d!60307 (not c!41092)) b!245928))

(assert (= (and b!245928 c!41093) b!245929))

(assert (= (and b!245928 (not c!41093)) b!245927))

(assert (= (or b!245929 b!245927) bm!22952))

(assert (=> b!245928 m!263487))

(assert (=> b!245928 m!263487))

(declare-fun m!263535 () Bool)

(assert (=> b!245928 m!263535))

(declare-fun m!263537 () Bool)

(assert (=> bm!22952 m!263537))

(assert (=> b!245715 d!60307))

(declare-fun d!60309 () Bool)

(assert (=> d!60309 (= (validMask!0 (mask!10660 thiss!1504)) (and (or (= (mask!10660 thiss!1504) #b00000000000000000000000000000111) (= (mask!10660 thiss!1504) #b00000000000000000000000000001111) (= (mask!10660 thiss!1504) #b00000000000000000000000000011111) (= (mask!10660 thiss!1504) #b00000000000000000000000000111111) (= (mask!10660 thiss!1504) #b00000000000000000000000001111111) (= (mask!10660 thiss!1504) #b00000000000000000000000011111111) (= (mask!10660 thiss!1504) #b00000000000000000000000111111111) (= (mask!10660 thiss!1504) #b00000000000000000000001111111111) (= (mask!10660 thiss!1504) #b00000000000000000000011111111111) (= (mask!10660 thiss!1504) #b00000000000000000000111111111111) (= (mask!10660 thiss!1504) #b00000000000000000001111111111111) (= (mask!10660 thiss!1504) #b00000000000000000011111111111111) (= (mask!10660 thiss!1504) #b00000000000000000111111111111111) (= (mask!10660 thiss!1504) #b00000000000000001111111111111111) (= (mask!10660 thiss!1504) #b00000000000000011111111111111111) (= (mask!10660 thiss!1504) #b00000000000000111111111111111111) (= (mask!10660 thiss!1504) #b00000000000001111111111111111111) (= (mask!10660 thiss!1504) #b00000000000011111111111111111111) (= (mask!10660 thiss!1504) #b00000000000111111111111111111111) (= (mask!10660 thiss!1504) #b00000000001111111111111111111111) (= (mask!10660 thiss!1504) #b00000000011111111111111111111111) (= (mask!10660 thiss!1504) #b00000000111111111111111111111111) (= (mask!10660 thiss!1504) #b00000001111111111111111111111111) (= (mask!10660 thiss!1504) #b00000011111111111111111111111111) (= (mask!10660 thiss!1504) #b00000111111111111111111111111111) (= (mask!10660 thiss!1504) #b00001111111111111111111111111111) (= (mask!10660 thiss!1504) #b00011111111111111111111111111111) (= (mask!10660 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10660 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!245715 d!60309))

(declare-fun bm!22955 () Bool)

(declare-fun call!22958 () Bool)

(declare-fun c!41096 () Bool)

(assert (=> bm!22955 (= call!22958 (arrayNoDuplicates!0 lt!123087 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41096 (Cons!3595 (select (arr!5762 lt!123087) #b00000000000000000000000000000000) Nil!3596) Nil!3596)))))

(declare-fun d!60311 () Bool)

(declare-fun res!120612 () Bool)

(declare-fun e!159551 () Bool)

(assert (=> d!60311 (=> res!120612 e!159551)))

(assert (=> d!60311 (= res!120612 (bvsge #b00000000000000000000000000000000 (size!6104 lt!123087)))))

(assert (=> d!60311 (= (arrayNoDuplicates!0 lt!123087 #b00000000000000000000000000000000 Nil!3596) e!159551)))

(declare-fun b!245941 () Bool)

(declare-fun e!159550 () Bool)

(assert (=> b!245941 (= e!159551 e!159550)))

(declare-fun res!120610 () Bool)

(assert (=> b!245941 (=> (not res!120610) (not e!159550))))

(declare-fun e!159548 () Bool)

(assert (=> b!245941 (= res!120610 (not e!159548))))

(declare-fun res!120611 () Bool)

(assert (=> b!245941 (=> (not res!120611) (not e!159548))))

(assert (=> b!245941 (= res!120611 (validKeyInArray!0 (select (arr!5762 lt!123087) #b00000000000000000000000000000000)))))

(declare-fun b!245942 () Bool)

(declare-fun contains!1761 (List!3599 (_ BitVec 64)) Bool)

(assert (=> b!245942 (= e!159548 (contains!1761 Nil!3596 (select (arr!5762 lt!123087) #b00000000000000000000000000000000)))))

(declare-fun b!245943 () Bool)

(declare-fun e!159549 () Bool)

(assert (=> b!245943 (= e!159550 e!159549)))

(assert (=> b!245943 (= c!41096 (validKeyInArray!0 (select (arr!5762 lt!123087) #b00000000000000000000000000000000)))))

(declare-fun b!245944 () Bool)

(assert (=> b!245944 (= e!159549 call!22958)))

(declare-fun b!245945 () Bool)

(assert (=> b!245945 (= e!159549 call!22958)))

(assert (= (and d!60311 (not res!120612)) b!245941))

(assert (= (and b!245941 res!120611) b!245942))

(assert (= (and b!245941 res!120610) b!245943))

(assert (= (and b!245943 c!41096) b!245945))

(assert (= (and b!245943 (not c!41096)) b!245944))

(assert (= (or b!245945 b!245944) bm!22955))

(assert (=> bm!22955 m!263529))

(declare-fun m!263539 () Bool)

(assert (=> bm!22955 m!263539))

(assert (=> b!245941 m!263529))

(assert (=> b!245941 m!263529))

(assert (=> b!245941 m!263531))

(assert (=> b!245942 m!263529))

(assert (=> b!245942 m!263529))

(declare-fun m!263541 () Bool)

(assert (=> b!245942 m!263541))

(assert (=> b!245943 m!263529))

(assert (=> b!245943 m!263529))

(assert (=> b!245943 m!263531))

(assert (=> b!245715 d!60311))

(declare-fun d!60313 () Bool)

(declare-fun e!159554 () Bool)

(assert (=> d!60313 e!159554))

(declare-fun res!120615 () Bool)

(assert (=> d!60313 (=> (not res!120615) (not e!159554))))

(assert (=> d!60313 (= res!120615 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6104 (_keys!6661 thiss!1504)))))))

(declare-fun lt!123174 () Unit!7572)

(declare-fun choose!41 (array!12141 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3599) Unit!7572)

(assert (=> d!60313 (= lt!123174 (choose!41 (_keys!6661 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3596))))

(assert (=> d!60313 (bvslt (size!6104 (_keys!6661 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60313 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6661 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3596) lt!123174)))

(declare-fun b!245948 () Bool)

(assert (=> b!245948 (= e!159554 (arrayNoDuplicates!0 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))) #b00000000000000000000000000000000 Nil!3596))))

(assert (= (and d!60313 res!120615) b!245948))

(declare-fun m!263543 () Bool)

(assert (=> d!60313 m!263543))

(assert (=> b!245948 m!263369))

(declare-fun m!263545 () Bool)

(assert (=> b!245948 m!263545))

(assert (=> b!245715 d!60313))

(declare-fun d!60315 () Bool)

(assert (=> d!60315 (= (array_inv!3789 (_keys!6661 thiss!1504)) (bvsge (size!6104 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245709 d!60315))

(declare-fun d!60317 () Bool)

(assert (=> d!60317 (= (array_inv!3790 (_values!4529 thiss!1504)) (bvsge (size!6103 (_values!4529 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245709 d!60317))

(declare-fun d!60319 () Bool)

(assert (=> d!60319 (= (inRange!0 index!297 (mask!10660 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10660 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245704 d!60319))

(declare-fun d!60321 () Bool)

(declare-fun e!159559 () Bool)

(assert (=> d!60321 e!159559))

(declare-fun res!120618 () Bool)

(assert (=> d!60321 (=> res!120618 e!159559)))

(declare-fun lt!123186 () Bool)

(assert (=> d!60321 (= res!120618 (not lt!123186))))

(declare-fun lt!123184 () Bool)

(assert (=> d!60321 (= lt!123186 lt!123184)))

(declare-fun lt!123183 () Unit!7572)

(declare-fun e!159560 () Unit!7572)

(assert (=> d!60321 (= lt!123183 e!159560)))

(declare-fun c!41099 () Bool)

(assert (=> d!60321 (= c!41099 lt!123184)))

(declare-fun containsKey!281 (List!3598 (_ BitVec 64)) Bool)

(assert (=> d!60321 (= lt!123184 (containsKey!281 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(assert (=> d!60321 (= (contains!1759 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) key!932) lt!123186)))

(declare-fun b!245955 () Bool)

(declare-fun lt!123185 () Unit!7572)

(assert (=> b!245955 (= e!159560 lt!123185)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!229 (List!3598 (_ BitVec 64)) Unit!7572)

(assert (=> b!245955 (= lt!123185 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(declare-datatypes ((Option!296 0))(
  ( (Some!295 (v!5312 V!8209)) (None!294) )
))
(declare-fun isDefined!230 (Option!296) Bool)

(declare-fun getValueByKey!290 (List!3598 (_ BitVec 64)) Option!296)

(assert (=> b!245955 (isDefined!230 (getValueByKey!290 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(declare-fun b!245956 () Bool)

(declare-fun Unit!7581 () Unit!7572)

(assert (=> b!245956 (= e!159560 Unit!7581)))

(declare-fun b!245957 () Bool)

(assert (=> b!245957 (= e!159559 (isDefined!230 (getValueByKey!290 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932)))))

(assert (= (and d!60321 c!41099) b!245955))

(assert (= (and d!60321 (not c!41099)) b!245956))

(assert (= (and d!60321 (not res!120618)) b!245957))

(declare-fun m!263547 () Bool)

(assert (=> d!60321 m!263547))

(declare-fun m!263549 () Bool)

(assert (=> b!245955 m!263549))

(declare-fun m!263551 () Bool)

(assert (=> b!245955 m!263551))

(assert (=> b!245955 m!263551))

(declare-fun m!263553 () Bool)

(assert (=> b!245955 m!263553))

(assert (=> b!245957 m!263551))

(assert (=> b!245957 m!263551))

(assert (=> b!245957 m!263553))

(assert (=> b!245704 d!60321))

(declare-fun b!246000 () Bool)

(declare-fun e!159596 () Bool)

(declare-fun lt!123238 () ListLongMap!3637)

(declare-fun apply!231 (ListLongMap!3637 (_ BitVec 64)) V!8209)

(assert (=> b!246000 (= e!159596 (= (apply!231 lt!123238 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4387 thiss!1504)))))

(declare-fun b!246001 () Bool)

(declare-fun e!159597 () Unit!7572)

(declare-fun lt!123242 () Unit!7572)

(assert (=> b!246001 (= e!159597 lt!123242)))

(declare-fun lt!123245 () ListLongMap!3637)

(declare-fun getCurrentListMapNoExtraKeys!547 (array!12141 array!12139 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 32) Int) ListLongMap!3637)

(assert (=> b!246001 (= lt!123245 (getCurrentListMapNoExtraKeys!547 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun lt!123241 () (_ BitVec 64))

(assert (=> b!246001 (= lt!123241 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123240 () (_ BitVec 64))

(assert (=> b!246001 (= lt!123240 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123235 () Unit!7572)

(declare-fun addStillContains!207 (ListLongMap!3637 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7572)

(assert (=> b!246001 (= lt!123235 (addStillContains!207 lt!123245 lt!123241 (zeroValue!4387 thiss!1504) lt!123240))))

(declare-fun +!658 (ListLongMap!3637 tuple2!4722) ListLongMap!3637)

(assert (=> b!246001 (contains!1759 (+!658 lt!123245 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504))) lt!123240)))

(declare-fun lt!123247 () Unit!7572)

(assert (=> b!246001 (= lt!123247 lt!123235)))

(declare-fun lt!123246 () ListLongMap!3637)

(assert (=> b!246001 (= lt!123246 (getCurrentListMapNoExtraKeys!547 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun lt!123250 () (_ BitVec 64))

(assert (=> b!246001 (= lt!123250 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123234 () (_ BitVec 64))

(assert (=> b!246001 (= lt!123234 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123248 () Unit!7572)

(declare-fun addApplyDifferent!207 (ListLongMap!3637 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7572)

(assert (=> b!246001 (= lt!123248 (addApplyDifferent!207 lt!123246 lt!123250 (minValue!4387 thiss!1504) lt!123234))))

(assert (=> b!246001 (= (apply!231 (+!658 lt!123246 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504))) lt!123234) (apply!231 lt!123246 lt!123234))))

(declare-fun lt!123251 () Unit!7572)

(assert (=> b!246001 (= lt!123251 lt!123248)))

(declare-fun lt!123239 () ListLongMap!3637)

(assert (=> b!246001 (= lt!123239 (getCurrentListMapNoExtraKeys!547 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun lt!123236 () (_ BitVec 64))

(assert (=> b!246001 (= lt!123236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123231 () (_ BitVec 64))

(assert (=> b!246001 (= lt!123231 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123243 () Unit!7572)

(assert (=> b!246001 (= lt!123243 (addApplyDifferent!207 lt!123239 lt!123236 (zeroValue!4387 thiss!1504) lt!123231))))

(assert (=> b!246001 (= (apply!231 (+!658 lt!123239 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504))) lt!123231) (apply!231 lt!123239 lt!123231))))

(declare-fun lt!123252 () Unit!7572)

(assert (=> b!246001 (= lt!123252 lt!123243)))

(declare-fun lt!123237 () ListLongMap!3637)

(assert (=> b!246001 (= lt!123237 (getCurrentListMapNoExtraKeys!547 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun lt!123232 () (_ BitVec 64))

(assert (=> b!246001 (= lt!123232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!123233 () (_ BitVec 64))

(assert (=> b!246001 (= lt!123233 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!246001 (= lt!123242 (addApplyDifferent!207 lt!123237 lt!123232 (minValue!4387 thiss!1504) lt!123233))))

(assert (=> b!246001 (= (apply!231 (+!658 lt!123237 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504))) lt!123233) (apply!231 lt!123237 lt!123233))))

(declare-fun b!246002 () Bool)

(declare-fun e!159599 () ListLongMap!3637)

(declare-fun e!159593 () ListLongMap!3637)

(assert (=> b!246002 (= e!159599 e!159593)))

(declare-fun c!41116 () Bool)

(assert (=> b!246002 (= c!41116 (and (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22970 () Bool)

(declare-fun call!22973 () ListLongMap!3637)

(declare-fun call!22975 () ListLongMap!3637)

(assert (=> bm!22970 (= call!22973 call!22975)))

(declare-fun bm!22971 () Bool)

(declare-fun call!22974 () ListLongMap!3637)

(declare-fun call!22976 () ListLongMap!3637)

(assert (=> bm!22971 (= call!22974 call!22976)))

(declare-fun bm!22972 () Bool)

(declare-fun call!22979 () Bool)

(assert (=> bm!22972 (= call!22979 (contains!1759 lt!123238 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246004 () Bool)

(declare-fun res!120643 () Bool)

(declare-fun e!159589 () Bool)

(assert (=> b!246004 (=> (not res!120643) (not e!159589))))

(declare-fun e!159588 () Bool)

(assert (=> b!246004 (= res!120643 e!159588)))

(declare-fun c!41112 () Bool)

(assert (=> b!246004 (= c!41112 (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!246005 () Bool)

(declare-fun e!159598 () Bool)

(assert (=> b!246005 (= e!159589 e!159598)))

(declare-fun c!41115 () Bool)

(assert (=> b!246005 (= c!41115 (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!246006 () Bool)

(assert (=> b!246006 (= e!159598 (not call!22979))))

(declare-fun bm!22973 () Bool)

(declare-fun call!22977 () ListLongMap!3637)

(declare-fun c!41114 () Bool)

(assert (=> bm!22973 (= call!22975 (+!658 (ite c!41114 call!22976 (ite c!41116 call!22974 call!22977)) (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(declare-fun bm!22974 () Bool)

(assert (=> bm!22974 (= call!22976 (getCurrentListMapNoExtraKeys!547 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(declare-fun b!246007 () Bool)

(assert (=> b!246007 (= e!159599 (+!658 call!22975 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))

(declare-fun bm!22975 () Bool)

(declare-fun call!22978 () Bool)

(assert (=> bm!22975 (= call!22978 (contains!1759 lt!123238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246008 () Bool)

(declare-fun e!159594 () ListLongMap!3637)

(assert (=> b!246008 (= e!159594 call!22977)))

(declare-fun b!246009 () Bool)

(declare-fun e!159590 () Bool)

(assert (=> b!246009 (= e!159590 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246010 () Bool)

(declare-fun res!120637 () Bool)

(assert (=> b!246010 (=> (not res!120637) (not e!159589))))

(declare-fun e!159587 () Bool)

(assert (=> b!246010 (= res!120637 e!159587)))

(declare-fun res!120638 () Bool)

(assert (=> b!246010 (=> res!120638 e!159587)))

(assert (=> b!246010 (= res!120638 (not e!159590))))

(declare-fun res!120645 () Bool)

(assert (=> b!246010 (=> (not res!120645) (not e!159590))))

(assert (=> b!246010 (= res!120645 (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246011 () Bool)

(declare-fun e!159591 () Bool)

(declare-fun get!2963 (ValueCell!2867 V!8209) V!8209)

(declare-fun dynLambda!574 (Int (_ BitVec 64)) V!8209)

(assert (=> b!246011 (= e!159591 (= (apply!231 lt!123238 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)) (get!2963 (select (arr!5761 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6103 (_values!4529 thiss!1504))))))

(assert (=> b!246011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246012 () Bool)

(declare-fun e!159595 () Bool)

(assert (=> b!246012 (= e!159595 (= (apply!231 lt!123238 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4387 thiss!1504)))))

(declare-fun b!246003 () Bool)

(assert (=> b!246003 (= e!159598 e!159596)))

(declare-fun res!120644 () Bool)

(assert (=> b!246003 (= res!120644 call!22979)))

(assert (=> b!246003 (=> (not res!120644) (not e!159596))))

(declare-fun d!60323 () Bool)

(assert (=> d!60323 e!159589))

(declare-fun res!120640 () Bool)

(assert (=> d!60323 (=> (not res!120640) (not e!159589))))

(assert (=> d!60323 (= res!120640 (or (bvsge #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))))

(declare-fun lt!123244 () ListLongMap!3637)

(assert (=> d!60323 (= lt!123238 lt!123244)))

(declare-fun lt!123249 () Unit!7572)

(assert (=> d!60323 (= lt!123249 e!159597)))

(declare-fun c!41113 () Bool)

(declare-fun e!159592 () Bool)

(assert (=> d!60323 (= c!41113 e!159592)))

(declare-fun res!120642 () Bool)

(assert (=> d!60323 (=> (not res!120642) (not e!159592))))

(assert (=> d!60323 (= res!120642 (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60323 (= lt!123244 e!159599)))

(assert (=> d!60323 (= c!41114 (and (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60323 (validMask!0 (mask!10660 thiss!1504))))

(assert (=> d!60323 (= (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) lt!123238)))

(declare-fun b!246013 () Bool)

(assert (=> b!246013 (= e!159587 e!159591)))

(declare-fun res!120641 () Bool)

(assert (=> b!246013 (=> (not res!120641) (not e!159591))))

(assert (=> b!246013 (= res!120641 (contains!1759 lt!123238 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246013 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246014 () Bool)

(assert (=> b!246014 (= e!159592 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246015 () Bool)

(declare-fun c!41117 () Bool)

(assert (=> b!246015 (= c!41117 (and (not (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!246015 (= e!159593 e!159594)))

(declare-fun b!246016 () Bool)

(assert (=> b!246016 (= e!159588 (not call!22978))))

(declare-fun b!246017 () Bool)

(assert (=> b!246017 (= e!159588 e!159595)))

(declare-fun res!120639 () Bool)

(assert (=> b!246017 (= res!120639 call!22978)))

(assert (=> b!246017 (=> (not res!120639) (not e!159595))))

(declare-fun b!246018 () Bool)

(assert (=> b!246018 (= e!159593 call!22973)))

(declare-fun b!246019 () Bool)

(declare-fun Unit!7582 () Unit!7572)

(assert (=> b!246019 (= e!159597 Unit!7582)))

(declare-fun b!246020 () Bool)

(assert (=> b!246020 (= e!159594 call!22973)))

(declare-fun bm!22976 () Bool)

(assert (=> bm!22976 (= call!22977 call!22974)))

(assert (= (and d!60323 c!41114) b!246007))

(assert (= (and d!60323 (not c!41114)) b!246002))

(assert (= (and b!246002 c!41116) b!246018))

(assert (= (and b!246002 (not c!41116)) b!246015))

(assert (= (and b!246015 c!41117) b!246020))

(assert (= (and b!246015 (not c!41117)) b!246008))

(assert (= (or b!246020 b!246008) bm!22976))

(assert (= (or b!246018 bm!22976) bm!22971))

(assert (= (or b!246018 b!246020) bm!22970))

(assert (= (or b!246007 bm!22971) bm!22974))

(assert (= (or b!246007 bm!22970) bm!22973))

(assert (= (and d!60323 res!120642) b!246014))

(assert (= (and d!60323 c!41113) b!246001))

(assert (= (and d!60323 (not c!41113)) b!246019))

(assert (= (and d!60323 res!120640) b!246010))

(assert (= (and b!246010 res!120645) b!246009))

(assert (= (and b!246010 (not res!120638)) b!246013))

(assert (= (and b!246013 res!120641) b!246011))

(assert (= (and b!246010 res!120637) b!246004))

(assert (= (and b!246004 c!41112) b!246017))

(assert (= (and b!246004 (not c!41112)) b!246016))

(assert (= (and b!246017 res!120639) b!246012))

(assert (= (or b!246017 b!246016) bm!22975))

(assert (= (and b!246004 res!120643) b!246005))

(assert (= (and b!246005 c!41115) b!246003))

(assert (= (and b!246005 (not c!41115)) b!246006))

(assert (= (and b!246003 res!120644) b!246000))

(assert (= (or b!246003 b!246006) bm!22972))

(declare-fun b_lambda!8049 () Bool)

(assert (=> (not b_lambda!8049) (not b!246011)))

(declare-fun t!8610 () Bool)

(declare-fun tb!2967 () Bool)

(assert (=> (and b!245709 (= (defaultEntry!4546 thiss!1504) (defaultEntry!4546 thiss!1504)) t!8610) tb!2967))

(declare-fun result!5239 () Bool)

(assert (=> tb!2967 (= result!5239 tp_is_empty!6421)))

(assert (=> b!246011 t!8610))

(declare-fun b_and!13569 () Bool)

(assert (= b_and!13563 (and (=> t!8610 result!5239) b_and!13569)))

(assert (=> b!246013 m!263487))

(assert (=> b!246013 m!263487))

(declare-fun m!263555 () Bool)

(assert (=> b!246013 m!263555))

(declare-fun m!263557 () Bool)

(assert (=> b!246012 m!263557))

(assert (=> b!246014 m!263487))

(assert (=> b!246014 m!263487))

(assert (=> b!246014 m!263535))

(declare-fun m!263559 () Bool)

(assert (=> b!246000 m!263559))

(declare-fun m!263561 () Bool)

(assert (=> b!246007 m!263561))

(declare-fun m!263563 () Bool)

(assert (=> bm!22974 m!263563))

(assert (=> b!246011 m!263487))

(declare-fun m!263565 () Bool)

(assert (=> b!246011 m!263565))

(declare-fun m!263567 () Bool)

(assert (=> b!246011 m!263567))

(declare-fun m!263569 () Bool)

(assert (=> b!246011 m!263569))

(assert (=> b!246011 m!263567))

(declare-fun m!263571 () Bool)

(assert (=> b!246011 m!263571))

(assert (=> b!246011 m!263569))

(assert (=> b!246011 m!263487))

(declare-fun m!263573 () Bool)

(assert (=> bm!22975 m!263573))

(declare-fun m!263575 () Bool)

(assert (=> b!246001 m!263575))

(declare-fun m!263577 () Bool)

(assert (=> b!246001 m!263577))

(declare-fun m!263579 () Bool)

(assert (=> b!246001 m!263579))

(declare-fun m!263581 () Bool)

(assert (=> b!246001 m!263581))

(declare-fun m!263583 () Bool)

(assert (=> b!246001 m!263583))

(declare-fun m!263585 () Bool)

(assert (=> b!246001 m!263585))

(assert (=> b!246001 m!263577))

(declare-fun m!263587 () Bool)

(assert (=> b!246001 m!263587))

(assert (=> b!246001 m!263487))

(assert (=> b!246001 m!263563))

(declare-fun m!263589 () Bool)

(assert (=> b!246001 m!263589))

(declare-fun m!263591 () Bool)

(assert (=> b!246001 m!263591))

(declare-fun m!263593 () Bool)

(assert (=> b!246001 m!263593))

(declare-fun m!263595 () Bool)

(assert (=> b!246001 m!263595))

(declare-fun m!263597 () Bool)

(assert (=> b!246001 m!263597))

(declare-fun m!263599 () Bool)

(assert (=> b!246001 m!263599))

(declare-fun m!263601 () Bool)

(assert (=> b!246001 m!263601))

(declare-fun m!263603 () Bool)

(assert (=> b!246001 m!263603))

(assert (=> b!246001 m!263599))

(assert (=> b!246001 m!263589))

(assert (=> b!246001 m!263583))

(assert (=> b!246009 m!263487))

(assert (=> b!246009 m!263487))

(assert (=> b!246009 m!263535))

(declare-fun m!263605 () Bool)

(assert (=> bm!22973 m!263605))

(assert (=> d!60323 m!263361))

(declare-fun m!263607 () Bool)

(assert (=> bm!22972 m!263607))

(assert (=> b!245704 d!60323))

(declare-fun d!60325 () Bool)

(declare-fun e!159602 () Bool)

(assert (=> d!60325 e!159602))

(declare-fun res!120650 () Bool)

(assert (=> d!60325 (=> (not res!120650) (not e!159602))))

(declare-fun lt!123258 () SeekEntryResult!1057)

(assert (=> d!60325 (= res!120650 ((_ is Found!1057) lt!123258))))

(assert (=> d!60325 (= lt!123258 (seekEntryOrOpen!0 key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(declare-fun lt!123257 () Unit!7572)

(declare-fun choose!1157 (array!12141 array!12139 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) Int) Unit!7572)

(assert (=> d!60325 (= lt!123257 (choose!1157 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)))))

(assert (=> d!60325 (validMask!0 (mask!10660 thiss!1504))))

(assert (=> d!60325 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!373 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)) lt!123257)))

(declare-fun b!246027 () Bool)

(declare-fun res!120651 () Bool)

(assert (=> b!246027 (=> (not res!120651) (not e!159602))))

(assert (=> b!246027 (= res!120651 (inRange!0 (index!6399 lt!123258) (mask!10660 thiss!1504)))))

(declare-fun b!246028 () Bool)

(assert (=> b!246028 (= e!159602 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6399 lt!123258)) key!932))))

(assert (=> b!246028 (and (bvsge (index!6399 lt!123258) #b00000000000000000000000000000000) (bvslt (index!6399 lt!123258) (size!6104 (_keys!6661 thiss!1504))))))

(assert (= (and d!60325 res!120650) b!246027))

(assert (= (and b!246027 res!120651) b!246028))

(assert (=> d!60325 m!263385))

(declare-fun m!263609 () Bool)

(assert (=> d!60325 m!263609))

(assert (=> d!60325 m!263361))

(declare-fun m!263611 () Bool)

(assert (=> b!246027 m!263611))

(declare-fun m!263613 () Bool)

(assert (=> b!246028 m!263613))

(assert (=> b!245713 d!60325))

(declare-fun d!60327 () Bool)

(assert (=> d!60327 (contains!1759 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) key!932)))

(declare-fun lt!123261 () Unit!7572)

(declare-fun choose!1158 (array!12141 array!12139 (_ BitVec 32) (_ BitVec 32) V!8209 V!8209 (_ BitVec 64) (_ BitVec 32) Int) Unit!7572)

(assert (=> d!60327 (= lt!123261 (choose!1158 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))

(assert (=> d!60327 (validMask!0 (mask!10660 thiss!1504))))

(assert (=> d!60327 (= (lemmaArrayContainsKeyThenInListMap!189 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) lt!123261)))

(declare-fun bs!8914 () Bool)

(assert (= bs!8914 d!60327))

(assert (=> bs!8914 m!263395))

(assert (=> bs!8914 m!263395))

(assert (=> bs!8914 m!263397))

(declare-fun m!263615 () Bool)

(assert (=> bs!8914 m!263615))

(assert (=> bs!8914 m!263361))

(assert (=> b!245717 d!60327))

(declare-fun condMapEmpty!10903 () Bool)

(declare-fun mapDefault!10903 () ValueCell!2867)

(assert (=> mapNonEmpty!10894 (= condMapEmpty!10903 (= mapRest!10894 ((as const (Array (_ BitVec 32) ValueCell!2867)) mapDefault!10903)))))

(declare-fun e!159607 () Bool)

(declare-fun mapRes!10903 () Bool)

(assert (=> mapNonEmpty!10894 (= tp!22912 (and e!159607 mapRes!10903))))

(declare-fun mapNonEmpty!10903 () Bool)

(declare-fun tp!22927 () Bool)

(declare-fun e!159608 () Bool)

(assert (=> mapNonEmpty!10903 (= mapRes!10903 (and tp!22927 e!159608))))

(declare-fun mapValue!10903 () ValueCell!2867)

(declare-fun mapRest!10903 () (Array (_ BitVec 32) ValueCell!2867))

(declare-fun mapKey!10903 () (_ BitVec 32))

(assert (=> mapNonEmpty!10903 (= mapRest!10894 (store mapRest!10903 mapKey!10903 mapValue!10903))))

(declare-fun b!246036 () Bool)

(assert (=> b!246036 (= e!159607 tp_is_empty!6421)))

(declare-fun b!246035 () Bool)

(assert (=> b!246035 (= e!159608 tp_is_empty!6421)))

(declare-fun mapIsEmpty!10903 () Bool)

(assert (=> mapIsEmpty!10903 mapRes!10903))

(assert (= (and mapNonEmpty!10894 condMapEmpty!10903) mapIsEmpty!10903))

(assert (= (and mapNonEmpty!10894 (not condMapEmpty!10903)) mapNonEmpty!10903))

(assert (= (and mapNonEmpty!10903 ((_ is ValueCellFull!2867) mapValue!10903)) b!246035))

(assert (= (and mapNonEmpty!10894 ((_ is ValueCellFull!2867) mapDefault!10903)) b!246036))

(declare-fun m!263617 () Bool)

(assert (=> mapNonEmpty!10903 m!263617))

(declare-fun b_lambda!8051 () Bool)

(assert (= b_lambda!8049 (or (and b!245709 b_free!6559) b_lambda!8051)))

(check-sat (not d!60295) (not bm!22974) (not b!245941) (not b!245851) (not b_next!6559) (not b!245942) (not b!245900) (not b!246014) (not b!246007) (not d!60301) (not b!246013) (not bm!22972) tp_is_empty!6421 (not d!60327) (not bm!22975) (not d!60325) (not d!60299) (not bm!22973) b_and!13569 (not b!246009) (not b!245957) (not b!246001) (not b!245948) (not b_lambda!8051) (not d!60313) (not bm!22955) (not b!245955) (not b!245914) (not b!245866) (not b!245924) (not d!60321) (not bm!22948) (not d!60303) (not b!246012) (not bm!22951) (not b!246011) (not b!246027) (not b!245943) (not b!245911) (not b!245928) (not b!246000) (not bm!22947) (not bm!22952) (not b!245902) (not b!245912) (not mapNonEmpty!10903) (not d!60323) (not b!245901))
(check-sat b_and!13569 (not b_next!6559))
(get-model)

(declare-fun d!60329 () Bool)

(declare-fun e!159611 () Bool)

(assert (=> d!60329 e!159611))

(declare-fun res!120657 () Bool)

(assert (=> d!60329 (=> (not res!120657) (not e!159611))))

(declare-fun lt!123271 () ListLongMap!3637)

(assert (=> d!60329 (= res!120657 (contains!1759 lt!123271 (_1!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(declare-fun lt!123273 () List!3598)

(assert (=> d!60329 (= lt!123271 (ListLongMap!3638 lt!123273))))

(declare-fun lt!123272 () Unit!7572)

(declare-fun lt!123270 () Unit!7572)

(assert (=> d!60329 (= lt!123272 lt!123270)))

(assert (=> d!60329 (= (getValueByKey!290 lt!123273 (_1!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!157 (List!3598 (_ BitVec 64) V!8209) Unit!7572)

(assert (=> d!60329 (= lt!123270 (lemmaContainsTupThenGetReturnValue!157 lt!123273 (_1!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(declare-fun insertStrictlySorted!160 (List!3598 (_ BitVec 64) V!8209) List!3598)

(assert (=> d!60329 (= lt!123273 (insertStrictlySorted!160 (toList!1834 call!22975) (_1!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(assert (=> d!60329 (= (+!658 call!22975 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))) lt!123271)))

(declare-fun b!246041 () Bool)

(declare-fun res!120656 () Bool)

(assert (=> b!246041 (=> (not res!120656) (not e!159611))))

(assert (=> b!246041 (= res!120656 (= (getValueByKey!290 (toList!1834 lt!123271) (_1!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(declare-fun b!246042 () Bool)

(declare-fun contains!1762 (List!3598 tuple2!4722) Bool)

(assert (=> b!246042 (= e!159611 (contains!1762 (toList!1834 lt!123271) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))

(assert (= (and d!60329 res!120657) b!246041))

(assert (= (and b!246041 res!120656) b!246042))

(declare-fun m!263619 () Bool)

(assert (=> d!60329 m!263619))

(declare-fun m!263621 () Bool)

(assert (=> d!60329 m!263621))

(declare-fun m!263623 () Bool)

(assert (=> d!60329 m!263623))

(declare-fun m!263625 () Bool)

(assert (=> d!60329 m!263625))

(declare-fun m!263627 () Bool)

(assert (=> b!246041 m!263627))

(declare-fun m!263629 () Bool)

(assert (=> b!246042 m!263629))

(assert (=> b!246007 d!60329))

(declare-fun d!60331 () Bool)

(declare-fun e!159612 () Bool)

(assert (=> d!60331 e!159612))

(declare-fun res!120658 () Bool)

(assert (=> d!60331 (=> res!120658 e!159612)))

(declare-fun lt!123277 () Bool)

(assert (=> d!60331 (= res!120658 (not lt!123277))))

(declare-fun lt!123275 () Bool)

(assert (=> d!60331 (= lt!123277 lt!123275)))

(declare-fun lt!123274 () Unit!7572)

(declare-fun e!159613 () Unit!7572)

(assert (=> d!60331 (= lt!123274 e!159613)))

(declare-fun c!41118 () Bool)

(assert (=> d!60331 (= c!41118 lt!123275)))

(assert (=> d!60331 (= lt!123275 (containsKey!281 (toList!1834 lt!123238) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60331 (= (contains!1759 lt!123238 #b0000000000000000000000000000000000000000000000000000000000000000) lt!123277)))

(declare-fun b!246043 () Bool)

(declare-fun lt!123276 () Unit!7572)

(assert (=> b!246043 (= e!159613 lt!123276)))

(assert (=> b!246043 (= lt!123276 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1834 lt!123238) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246043 (isDefined!230 (getValueByKey!290 (toList!1834 lt!123238) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246044 () Bool)

(declare-fun Unit!7583 () Unit!7572)

(assert (=> b!246044 (= e!159613 Unit!7583)))

(declare-fun b!246045 () Bool)

(assert (=> b!246045 (= e!159612 (isDefined!230 (getValueByKey!290 (toList!1834 lt!123238) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60331 c!41118) b!246043))

(assert (= (and d!60331 (not c!41118)) b!246044))

(assert (= (and d!60331 (not res!120658)) b!246045))

(declare-fun m!263631 () Bool)

(assert (=> d!60331 m!263631))

(declare-fun m!263633 () Bool)

(assert (=> b!246043 m!263633))

(declare-fun m!263635 () Bool)

(assert (=> b!246043 m!263635))

(assert (=> b!246043 m!263635))

(declare-fun m!263637 () Bool)

(assert (=> b!246043 m!263637))

(assert (=> b!246045 m!263635))

(assert (=> b!246045 m!263635))

(assert (=> b!246045 m!263637))

(assert (=> bm!22975 d!60331))

(declare-fun d!60333 () Bool)

(assert (=> d!60333 (= (validKeyInArray!0 (select (arr!5762 lt!123087) #b00000000000000000000000000000000)) (and (not (= (select (arr!5762 lt!123087) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5762 lt!123087) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245943 d!60333))

(declare-fun b!246046 () Bool)

(declare-fun e!159615 () (_ BitVec 32))

(declare-fun call!22980 () (_ BitVec 32))

(assert (=> b!246046 (= e!159615 call!22980)))

(declare-fun b!246047 () Bool)

(declare-fun e!159614 () (_ BitVec 32))

(assert (=> b!246047 (= e!159614 e!159615)))

(declare-fun c!41120 () Bool)

(assert (=> b!246047 (= c!41120 (validKeyInArray!0 (select (arr!5762 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!246048 () Bool)

(assert (=> b!246048 (= e!159615 (bvadd #b00000000000000000000000000000001 call!22980))))

(declare-fun lt!123278 () (_ BitVec 32))

(declare-fun d!60335 () Bool)

(assert (=> d!60335 (and (bvsge lt!123278 #b00000000000000000000000000000000) (bvsle lt!123278 (bvsub (size!6104 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!60335 (= lt!123278 e!159614)))

(declare-fun c!41119 () Bool)

(assert (=> d!60335 (= c!41119 (bvsge #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60335 (and (bvsle #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6104 (_keys!6661 thiss!1504)) (size!6104 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))))))))

(assert (=> d!60335 (= (arrayCountValidKeys!0 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))) #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) lt!123278)))

(declare-fun bm!22977 () Bool)

(assert (=> bm!22977 (= call!22980 (arrayCountValidKeys!0 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246049 () Bool)

(assert (=> b!246049 (= e!159614 #b00000000000000000000000000000000)))

(assert (= (and d!60335 c!41119) b!246049))

(assert (= (and d!60335 (not c!41119)) b!246047))

(assert (= (and b!246047 c!41120) b!246048))

(assert (= (and b!246047 (not c!41120)) b!246046))

(assert (= (or b!246048 b!246046) bm!22977))

(declare-fun m!263639 () Bool)

(assert (=> b!246047 m!263639))

(assert (=> b!246047 m!263639))

(declare-fun m!263641 () Bool)

(assert (=> b!246047 m!263641))

(declare-fun m!263643 () Bool)

(assert (=> bm!22977 m!263643))

(assert (=> b!245914 d!60335))

(assert (=> b!245914 d!60307))

(declare-fun b!246074 () Bool)

(declare-fun e!159633 () Bool)

(declare-fun e!159636 () Bool)

(assert (=> b!246074 (= e!159633 e!159636)))

(assert (=> b!246074 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun res!120670 () Bool)

(declare-fun lt!123294 () ListLongMap!3637)

(assert (=> b!246074 (= res!120670 (contains!1759 lt!123294 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246074 (=> (not res!120670) (not e!159636))))

(declare-fun b!246075 () Bool)

(declare-fun e!159634 () Bool)

(assert (=> b!246075 (= e!159634 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246075 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!246077 () Bool)

(declare-fun e!159631 () Bool)

(declare-fun isEmpty!528 (ListLongMap!3637) Bool)

(assert (=> b!246077 (= e!159631 (isEmpty!528 lt!123294))))

(declare-fun b!246078 () Bool)

(assert (=> b!246078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> b!246078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6103 (_values!4529 thiss!1504))))))

(assert (=> b!246078 (= e!159636 (= (apply!231 lt!123294 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)) (get!2963 (select (arr!5761 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!246079 () Bool)

(declare-fun e!159630 () ListLongMap!3637)

(declare-fun e!159635 () ListLongMap!3637)

(assert (=> b!246079 (= e!159630 e!159635)))

(declare-fun c!41129 () Bool)

(assert (=> b!246079 (= c!41129 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246080 () Bool)

(assert (=> b!246080 (= e!159631 (= lt!123294 (getCurrentListMapNoExtraKeys!547 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4546 thiss!1504))))))

(declare-fun b!246081 () Bool)

(declare-fun e!159632 () Bool)

(assert (=> b!246081 (= e!159632 e!159633)))

(declare-fun c!41131 () Bool)

(assert (=> b!246081 (= c!41131 e!159634)))

(declare-fun res!120668 () Bool)

(assert (=> b!246081 (=> (not res!120668) (not e!159634))))

(assert (=> b!246081 (= res!120668 (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246082 () Bool)

(assert (=> b!246082 (= e!159633 e!159631)))

(declare-fun c!41132 () Bool)

(assert (=> b!246082 (= c!41132 (bvslt #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246083 () Bool)

(declare-fun lt!123297 () Unit!7572)

(declare-fun lt!123296 () Unit!7572)

(assert (=> b!246083 (= lt!123297 lt!123296)))

(declare-fun lt!123295 () (_ BitVec 64))

(declare-fun lt!123299 () (_ BitVec 64))

(declare-fun lt!123293 () V!8209)

(declare-fun lt!123298 () ListLongMap!3637)

(assert (=> b!246083 (not (contains!1759 (+!658 lt!123298 (tuple2!4723 lt!123295 lt!123293)) lt!123299))))

(declare-fun addStillNotContains!122 (ListLongMap!3637 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7572)

(assert (=> b!246083 (= lt!123296 (addStillNotContains!122 lt!123298 lt!123295 lt!123293 lt!123299))))

(assert (=> b!246083 (= lt!123299 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!246083 (= lt!123293 (get!2963 (select (arr!5761 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!246083 (= lt!123295 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!22983 () ListLongMap!3637)

(assert (=> b!246083 (= lt!123298 call!22983)))

(assert (=> b!246083 (= e!159635 (+!658 call!22983 (tuple2!4723 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000) (get!2963 (select (arr!5761 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!22980 () Bool)

(assert (=> bm!22980 (= call!22983 (getCurrentListMapNoExtraKeys!547 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4546 thiss!1504)))))

(declare-fun d!60337 () Bool)

(assert (=> d!60337 e!159632))

(declare-fun res!120667 () Bool)

(assert (=> d!60337 (=> (not res!120667) (not e!159632))))

(assert (=> d!60337 (= res!120667 (not (contains!1759 lt!123294 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60337 (= lt!123294 e!159630)))

(declare-fun c!41130 () Bool)

(assert (=> d!60337 (= c!41130 (bvsge #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60337 (validMask!0 (mask!10660 thiss!1504))))

(assert (=> d!60337 (= (getCurrentListMapNoExtraKeys!547 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) lt!123294)))

(declare-fun b!246076 () Bool)

(assert (=> b!246076 (= e!159635 call!22983)))

(declare-fun b!246084 () Bool)

(assert (=> b!246084 (= e!159630 (ListLongMap!3638 Nil!3595))))

(declare-fun b!246085 () Bool)

(declare-fun res!120669 () Bool)

(assert (=> b!246085 (=> (not res!120669) (not e!159632))))

(assert (=> b!246085 (= res!120669 (not (contains!1759 lt!123294 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60337 c!41130) b!246084))

(assert (= (and d!60337 (not c!41130)) b!246079))

(assert (= (and b!246079 c!41129) b!246083))

(assert (= (and b!246079 (not c!41129)) b!246076))

(assert (= (or b!246083 b!246076) bm!22980))

(assert (= (and d!60337 res!120667) b!246085))

(assert (= (and b!246085 res!120669) b!246081))

(assert (= (and b!246081 res!120668) b!246075))

(assert (= (and b!246081 c!41131) b!246074))

(assert (= (and b!246081 (not c!41131)) b!246082))

(assert (= (and b!246074 res!120670) b!246078))

(assert (= (and b!246082 c!41132) b!246080))

(assert (= (and b!246082 (not c!41132)) b!246077))

(declare-fun b_lambda!8053 () Bool)

(assert (=> (not b_lambda!8053) (not b!246078)))

(assert (=> b!246078 t!8610))

(declare-fun b_and!13571 () Bool)

(assert (= b_and!13569 (and (=> t!8610 result!5239) b_and!13571)))

(declare-fun b_lambda!8055 () Bool)

(assert (=> (not b_lambda!8055) (not b!246083)))

(assert (=> b!246083 t!8610))

(declare-fun b_and!13573 () Bool)

(assert (= b_and!13571 (and (=> t!8610 result!5239) b_and!13573)))

(assert (=> b!246078 m!263487))

(declare-fun m!263645 () Bool)

(assert (=> b!246078 m!263645))

(assert (=> b!246078 m!263569))

(assert (=> b!246078 m!263567))

(assert (=> b!246078 m!263569))

(assert (=> b!246078 m!263567))

(assert (=> b!246078 m!263571))

(assert (=> b!246078 m!263487))

(declare-fun m!263647 () Bool)

(assert (=> bm!22980 m!263647))

(assert (=> b!246075 m!263487))

(assert (=> b!246075 m!263487))

(assert (=> b!246075 m!263535))

(assert (=> b!246080 m!263647))

(assert (=> b!246079 m!263487))

(assert (=> b!246079 m!263487))

(assert (=> b!246079 m!263535))

(declare-fun m!263649 () Bool)

(assert (=> b!246077 m!263649))

(assert (=> b!246083 m!263569))

(assert (=> b!246083 m!263567))

(declare-fun m!263651 () Bool)

(assert (=> b!246083 m!263651))

(declare-fun m!263653 () Bool)

(assert (=> b!246083 m!263653))

(declare-fun m!263655 () Bool)

(assert (=> b!246083 m!263655))

(assert (=> b!246083 m!263569))

(assert (=> b!246083 m!263567))

(assert (=> b!246083 m!263571))

(declare-fun m!263657 () Bool)

(assert (=> b!246083 m!263657))

(assert (=> b!246083 m!263651))

(assert (=> b!246083 m!263487))

(assert (=> b!246074 m!263487))

(assert (=> b!246074 m!263487))

(declare-fun m!263659 () Bool)

(assert (=> b!246074 m!263659))

(declare-fun m!263661 () Bool)

(assert (=> d!60337 m!263661))

(assert (=> d!60337 m!263361))

(declare-fun m!263663 () Bool)

(assert (=> b!246085 m!263663))

(assert (=> bm!22974 d!60337))

(assert (=> bm!22948 d!60293))

(declare-fun d!60339 () Bool)

(declare-fun lt!123302 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!164 (List!3599) (InoxSet (_ BitVec 64)))

(assert (=> d!60339 (= lt!123302 (select (content!164 Nil!3596) (select (arr!5762 lt!123087) #b00000000000000000000000000000000)))))

(declare-fun e!159641 () Bool)

(assert (=> d!60339 (= lt!123302 e!159641)))

(declare-fun res!120675 () Bool)

(assert (=> d!60339 (=> (not res!120675) (not e!159641))))

(assert (=> d!60339 (= res!120675 ((_ is Cons!3595) Nil!3596))))

(assert (=> d!60339 (= (contains!1761 Nil!3596 (select (arr!5762 lt!123087) #b00000000000000000000000000000000)) lt!123302)))

(declare-fun b!246090 () Bool)

(declare-fun e!159642 () Bool)

(assert (=> b!246090 (= e!159641 e!159642)))

(declare-fun res!120676 () Bool)

(assert (=> b!246090 (=> res!120676 e!159642)))

(assert (=> b!246090 (= res!120676 (= (h!4252 Nil!3596) (select (arr!5762 lt!123087) #b00000000000000000000000000000000)))))

(declare-fun b!246091 () Bool)

(assert (=> b!246091 (= e!159642 (contains!1761 (t!8606 Nil!3596) (select (arr!5762 lt!123087) #b00000000000000000000000000000000)))))

(assert (= (and d!60339 res!120675) b!246090))

(assert (= (and b!246090 (not res!120676)) b!246091))

(declare-fun m!263665 () Bool)

(assert (=> d!60339 m!263665))

(assert (=> d!60339 m!263529))

(declare-fun m!263667 () Bool)

(assert (=> d!60339 m!263667))

(assert (=> b!246091 m!263529))

(declare-fun m!263669 () Bool)

(assert (=> b!246091 m!263669))

(assert (=> b!245942 d!60339))

(assert (=> b!245941 d!60333))

(declare-fun d!60341 () Bool)

(assert (=> d!60341 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245912 d!60341))

(assert (=> d!60327 d!60321))

(assert (=> d!60327 d!60323))

(declare-fun d!60343 () Bool)

(assert (=> d!60343 (contains!1759 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) key!932)))

(assert (=> d!60343 true))

(declare-fun _$17!68 () Unit!7572)

(assert (=> d!60343 (= (choose!1158 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)) _$17!68)))

(declare-fun bs!8915 () Bool)

(assert (= bs!8915 d!60343))

(assert (=> bs!8915 m!263395))

(assert (=> bs!8915 m!263395))

(assert (=> bs!8915 m!263397))

(assert (=> d!60327 d!60343))

(assert (=> d!60327 d!60309))

(declare-fun d!60345 () Bool)

(declare-fun e!159643 () Bool)

(assert (=> d!60345 e!159643))

(declare-fun res!120678 () Bool)

(assert (=> d!60345 (=> (not res!120678) (not e!159643))))

(declare-fun lt!123304 () ListLongMap!3637)

(assert (=> d!60345 (= res!120678 (contains!1759 lt!123304 (_1!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(declare-fun lt!123306 () List!3598)

(assert (=> d!60345 (= lt!123304 (ListLongMap!3638 lt!123306))))

(declare-fun lt!123305 () Unit!7572)

(declare-fun lt!123303 () Unit!7572)

(assert (=> d!60345 (= lt!123305 lt!123303)))

(assert (=> d!60345 (= (getValueByKey!290 lt!123306 (_1!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))) (Some!295 (_2!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(assert (=> d!60345 (= lt!123303 (lemmaContainsTupThenGetReturnValue!157 lt!123306 (_1!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) (_2!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(assert (=> d!60345 (= lt!123306 (insertStrictlySorted!160 (toList!1834 (ite c!41114 call!22976 (ite c!41116 call!22974 call!22977))) (_1!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) (_2!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))))))

(assert (=> d!60345 (= (+!658 (ite c!41114 call!22976 (ite c!41116 call!22974 call!22977)) (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))) lt!123304)))

(declare-fun b!246092 () Bool)

(declare-fun res!120677 () Bool)

(assert (=> b!246092 (=> (not res!120677) (not e!159643))))

(assert (=> b!246092 (= res!120677 (= (getValueByKey!290 (toList!1834 lt!123304) (_1!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504))))) (Some!295 (_2!2372 (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))))

(declare-fun b!246093 () Bool)

(assert (=> b!246093 (= e!159643 (contains!1762 (toList!1834 lt!123304) (ite (or c!41114 c!41116) (tuple2!4723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4387 thiss!1504)) (tuple2!4723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4387 thiss!1504)))))))

(assert (= (and d!60345 res!120678) b!246092))

(assert (= (and b!246092 res!120677) b!246093))

(declare-fun m!263671 () Bool)

(assert (=> d!60345 m!263671))

(declare-fun m!263673 () Bool)

(assert (=> d!60345 m!263673))

(declare-fun m!263675 () Bool)

(assert (=> d!60345 m!263675))

(declare-fun m!263677 () Bool)

(assert (=> d!60345 m!263677))

(declare-fun m!263679 () Bool)

(assert (=> b!246092 m!263679))

(declare-fun m!263681 () Bool)

(assert (=> b!246093 m!263681))

(assert (=> bm!22973 d!60345))

(declare-fun b!246112 () Bool)

(declare-fun lt!123312 () SeekEntryResult!1057)

(assert (=> b!246112 (and (bvsge (index!6400 lt!123312) #b00000000000000000000000000000000) (bvslt (index!6400 lt!123312) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun res!120686 () Bool)

(assert (=> b!246112 (= res!120686 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6400 lt!123312)) key!932))))

(declare-fun e!159658 () Bool)

(assert (=> b!246112 (=> res!120686 e!159658)))

(declare-fun e!159657 () Bool)

(assert (=> b!246112 (= e!159657 e!159658)))

(declare-fun b!246113 () Bool)

(declare-fun e!159656 () Bool)

(assert (=> b!246113 (= e!159656 (bvsge (x!24405 lt!123312) #b01111111111111111111111111111110))))

(declare-fun b!246114 () Bool)

(assert (=> b!246114 (and (bvsge (index!6400 lt!123312) #b00000000000000000000000000000000) (bvslt (index!6400 lt!123312) (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> b!246114 (= e!159658 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6400 lt!123312)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246115 () Bool)

(declare-fun e!159655 () SeekEntryResult!1057)

(assert (=> b!246115 (= e!159655 (Intermediate!1057 true (toIndex!0 key!932 (mask!10660 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!246116 () Bool)

(declare-fun e!159654 () SeekEntryResult!1057)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!246116 (= e!159654 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10660 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10660 thiss!1504)) key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(declare-fun b!246117 () Bool)

(assert (=> b!246117 (= e!159654 (Intermediate!1057 false (toIndex!0 key!932 (mask!10660 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!60347 () Bool)

(assert (=> d!60347 e!159656))

(declare-fun c!41140 () Bool)

(assert (=> d!60347 (= c!41140 (and ((_ is Intermediate!1057) lt!123312) (undefined!1869 lt!123312)))))

(assert (=> d!60347 (= lt!123312 e!159655)))

(declare-fun c!41139 () Bool)

(assert (=> d!60347 (= c!41139 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!123311 () (_ BitVec 64))

(assert (=> d!60347 (= lt!123311 (select (arr!5762 (_keys!6661 thiss!1504)) (toIndex!0 key!932 (mask!10660 thiss!1504))))))

(assert (=> d!60347 (validMask!0 (mask!10660 thiss!1504))))

(assert (=> d!60347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10660 thiss!1504)) key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)) lt!123312)))

(declare-fun b!246118 () Bool)

(assert (=> b!246118 (= e!159655 e!159654)))

(declare-fun c!41141 () Bool)

(assert (=> b!246118 (= c!41141 (or (= lt!123311 key!932) (= (bvadd lt!123311 lt!123311) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!246119 () Bool)

(assert (=> b!246119 (= e!159656 e!159657)))

(declare-fun res!120687 () Bool)

(assert (=> b!246119 (= res!120687 (and ((_ is Intermediate!1057) lt!123312) (not (undefined!1869 lt!123312)) (bvslt (x!24405 lt!123312) #b01111111111111111111111111111110) (bvsge (x!24405 lt!123312) #b00000000000000000000000000000000) (bvsge (x!24405 lt!123312) #b00000000000000000000000000000000)))))

(assert (=> b!246119 (=> (not res!120687) (not e!159657))))

(declare-fun b!246120 () Bool)

(assert (=> b!246120 (and (bvsge (index!6400 lt!123312) #b00000000000000000000000000000000) (bvslt (index!6400 lt!123312) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun res!120685 () Bool)

(assert (=> b!246120 (= res!120685 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6400 lt!123312)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246120 (=> res!120685 e!159658)))

(assert (= (and d!60347 c!41139) b!246115))

(assert (= (and d!60347 (not c!41139)) b!246118))

(assert (= (and b!246118 c!41141) b!246117))

(assert (= (and b!246118 (not c!41141)) b!246116))

(assert (= (and d!60347 c!41140) b!246113))

(assert (= (and d!60347 (not c!41140)) b!246119))

(assert (= (and b!246119 res!120687) b!246112))

(assert (= (and b!246112 (not res!120686)) b!246120))

(assert (= (and b!246120 (not res!120685)) b!246114))

(declare-fun m!263683 () Bool)

(assert (=> b!246114 m!263683))

(assert (=> d!60347 m!263491))

(declare-fun m!263685 () Bool)

(assert (=> d!60347 m!263685))

(assert (=> d!60347 m!263361))

(assert (=> b!246112 m!263683))

(assert (=> b!246116 m!263491))

(declare-fun m!263687 () Bool)

(assert (=> b!246116 m!263687))

(assert (=> b!246116 m!263687))

(declare-fun m!263689 () Bool)

(assert (=> b!246116 m!263689))

(assert (=> b!246120 m!263683))

(assert (=> d!60295 d!60347))

(declare-fun d!60349 () Bool)

(declare-fun lt!123318 () (_ BitVec 32))

(declare-fun lt!123317 () (_ BitVec 32))

(assert (=> d!60349 (= lt!123318 (bvmul (bvxor lt!123317 (bvlshr lt!123317 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60349 (= lt!123317 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60349 (and (bvsge (mask!10660 thiss!1504) #b00000000000000000000000000000000) (let ((res!120688 (let ((h!4255 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24424 (bvmul (bvxor h!4255 (bvlshr h!4255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24424 (bvlshr x!24424 #b00000000000000000000000000001101)) (mask!10660 thiss!1504)))))) (and (bvslt res!120688 (bvadd (mask!10660 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!120688 #b00000000000000000000000000000000))))))

(assert (=> d!60349 (= (toIndex!0 key!932 (mask!10660 thiss!1504)) (bvand (bvxor lt!123318 (bvlshr lt!123318 #b00000000000000000000000000001101)) (mask!10660 thiss!1504)))))

(assert (=> d!60295 d!60349))

(assert (=> d!60295 d!60309))

(declare-fun d!60351 () Bool)

(declare-fun isEmpty!529 (Option!296) Bool)

(assert (=> d!60351 (= (isDefined!230 (getValueByKey!290 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932)) (not (isEmpty!529 (getValueByKey!290 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))))

(declare-fun bs!8916 () Bool)

(assert (= bs!8916 d!60351))

(assert (=> bs!8916 m!263551))

(declare-fun m!263691 () Bool)

(assert (=> bs!8916 m!263691))

(assert (=> b!245957 d!60351))

(declare-fun b!246130 () Bool)

(declare-fun e!159663 () Option!296)

(declare-fun e!159664 () Option!296)

(assert (=> b!246130 (= e!159663 e!159664)))

(declare-fun c!41147 () Bool)

(assert (=> b!246130 (= c!41147 (and ((_ is Cons!3594) (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) (not (= (_1!2372 (h!4251 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932))))))

(declare-fun b!246132 () Bool)

(assert (=> b!246132 (= e!159664 None!294)))

(declare-fun b!246131 () Bool)

(assert (=> b!246131 (= e!159664 (getValueByKey!290 (t!8605 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) key!932))))

(declare-fun b!246129 () Bool)

(assert (=> b!246129 (= e!159663 (Some!295 (_2!2372 (h!4251 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))))))

(declare-fun d!60353 () Bool)

(declare-fun c!41146 () Bool)

(assert (=> d!60353 (= c!41146 (and ((_ is Cons!3594) (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) (= (_1!2372 (h!4251 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932)))))

(assert (=> d!60353 (= (getValueByKey!290 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932) e!159663)))

(assert (= (and d!60353 c!41146) b!246129))

(assert (= (and d!60353 (not c!41146)) b!246130))

(assert (= (and b!246130 c!41147) b!246131))

(assert (= (and b!246130 (not c!41147)) b!246132))

(declare-fun m!263693 () Bool)

(assert (=> b!246131 m!263693))

(assert (=> b!245957 d!60353))

(declare-fun bm!22981 () Bool)

(declare-fun call!22984 () Bool)

(declare-fun c!41148 () Bool)

(assert (=> bm!22981 (= call!22984 (arrayNoDuplicates!0 (_keys!6661 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41148 (Cons!3595 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000) Nil!3596) Nil!3596)))))

(declare-fun d!60355 () Bool)

(declare-fun res!120691 () Bool)

(declare-fun e!159668 () Bool)

(assert (=> d!60355 (=> res!120691 e!159668)))

(assert (=> d!60355 (= res!120691 (bvsge #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60355 (= (arrayNoDuplicates!0 (_keys!6661 thiss!1504) #b00000000000000000000000000000000 Nil!3596) e!159668)))

(declare-fun b!246133 () Bool)

(declare-fun e!159667 () Bool)

(assert (=> b!246133 (= e!159668 e!159667)))

(declare-fun res!120689 () Bool)

(assert (=> b!246133 (=> (not res!120689) (not e!159667))))

(declare-fun e!159665 () Bool)

(assert (=> b!246133 (= res!120689 (not e!159665))))

(declare-fun res!120690 () Bool)

(assert (=> b!246133 (=> (not res!120690) (not e!159665))))

(assert (=> b!246133 (= res!120690 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246134 () Bool)

(assert (=> b!246134 (= e!159665 (contains!1761 Nil!3596 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246135 () Bool)

(declare-fun e!159666 () Bool)

(assert (=> b!246135 (= e!159667 e!159666)))

(assert (=> b!246135 (= c!41148 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246136 () Bool)

(assert (=> b!246136 (= e!159666 call!22984)))

(declare-fun b!246137 () Bool)

(assert (=> b!246137 (= e!159666 call!22984)))

(assert (= (and d!60355 (not res!120691)) b!246133))

(assert (= (and b!246133 res!120690) b!246134))

(assert (= (and b!246133 res!120689) b!246135))

(assert (= (and b!246135 c!41148) b!246137))

(assert (= (and b!246135 (not c!41148)) b!246136))

(assert (= (or b!246137 b!246136) bm!22981))

(assert (=> bm!22981 m!263487))

(declare-fun m!263695 () Bool)

(assert (=> bm!22981 m!263695))

(assert (=> b!246133 m!263487))

(assert (=> b!246133 m!263487))

(assert (=> b!246133 m!263535))

(assert (=> b!246134 m!263487))

(assert (=> b!246134 m!263487))

(declare-fun m!263697 () Bool)

(assert (=> b!246134 m!263697))

(assert (=> b!246135 m!263487))

(assert (=> b!246135 m!263487))

(assert (=> b!246135 m!263535))

(assert (=> b!245902 d!60355))

(declare-fun call!22985 () Bool)

(declare-fun c!41149 () Bool)

(declare-fun bm!22982 () Bool)

(assert (=> bm!22982 (= call!22985 (arrayNoDuplicates!0 lt!123087 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!41149 (Cons!3595 (select (arr!5762 lt!123087) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41096 (Cons!3595 (select (arr!5762 lt!123087) #b00000000000000000000000000000000) Nil!3596) Nil!3596)) (ite c!41096 (Cons!3595 (select (arr!5762 lt!123087) #b00000000000000000000000000000000) Nil!3596) Nil!3596))))))

(declare-fun d!60357 () Bool)

(declare-fun res!120694 () Bool)

(declare-fun e!159672 () Bool)

(assert (=> d!60357 (=> res!120694 e!159672)))

(assert (=> d!60357 (= res!120694 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 lt!123087)))))

(assert (=> d!60357 (= (arrayNoDuplicates!0 lt!123087 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41096 (Cons!3595 (select (arr!5762 lt!123087) #b00000000000000000000000000000000) Nil!3596) Nil!3596)) e!159672)))

(declare-fun b!246138 () Bool)

(declare-fun e!159671 () Bool)

(assert (=> b!246138 (= e!159672 e!159671)))

(declare-fun res!120692 () Bool)

(assert (=> b!246138 (=> (not res!120692) (not e!159671))))

(declare-fun e!159669 () Bool)

(assert (=> b!246138 (= res!120692 (not e!159669))))

(declare-fun res!120693 () Bool)

(assert (=> b!246138 (=> (not res!120693) (not e!159669))))

(assert (=> b!246138 (= res!120693 (validKeyInArray!0 (select (arr!5762 lt!123087) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!246139 () Bool)

(assert (=> b!246139 (= e!159669 (contains!1761 (ite c!41096 (Cons!3595 (select (arr!5762 lt!123087) #b00000000000000000000000000000000) Nil!3596) Nil!3596) (select (arr!5762 lt!123087) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!246140 () Bool)

(declare-fun e!159670 () Bool)

(assert (=> b!246140 (= e!159671 e!159670)))

(assert (=> b!246140 (= c!41149 (validKeyInArray!0 (select (arr!5762 lt!123087) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!246141 () Bool)

(assert (=> b!246141 (= e!159670 call!22985)))

(declare-fun b!246142 () Bool)

(assert (=> b!246142 (= e!159670 call!22985)))

(assert (= (and d!60357 (not res!120694)) b!246138))

(assert (= (and b!246138 res!120693) b!246139))

(assert (= (and b!246138 res!120692) b!246140))

(assert (= (and b!246140 c!41149) b!246142))

(assert (= (and b!246140 (not c!41149)) b!246141))

(assert (= (or b!246142 b!246141) bm!22982))

(declare-fun m!263699 () Bool)

(assert (=> bm!22982 m!263699))

(declare-fun m!263701 () Bool)

(assert (=> bm!22982 m!263701))

(assert (=> b!246138 m!263699))

(assert (=> b!246138 m!263699))

(declare-fun m!263703 () Bool)

(assert (=> b!246138 m!263703))

(assert (=> b!246139 m!263699))

(assert (=> b!246139 m!263699))

(declare-fun m!263705 () Bool)

(assert (=> b!246139 m!263705))

(assert (=> b!246140 m!263699))

(assert (=> b!246140 m!263699))

(assert (=> b!246140 m!263703))

(assert (=> bm!22955 d!60357))

(declare-fun d!60359 () Bool)

(assert (=> d!60359 (= (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) index!297)) (and (not (= (select (arr!5762 (_keys!6661 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5762 (_keys!6661 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245911 d!60359))

(assert (=> d!60323 d!60309))

(declare-fun b!246143 () Bool)

(declare-fun e!159674 () (_ BitVec 32))

(declare-fun call!22986 () (_ BitVec 32))

(assert (=> b!246143 (= e!159674 call!22986)))

(declare-fun b!246144 () Bool)

(declare-fun e!159673 () (_ BitVec 32))

(assert (=> b!246144 (= e!159673 e!159674)))

(declare-fun c!41151 () Bool)

(assert (=> b!246144 (= c!41151 (validKeyInArray!0 (select (arr!5762 lt!123087) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!246145 () Bool)

(assert (=> b!246145 (= e!159674 (bvadd #b00000000000000000000000000000001 call!22986))))

(declare-fun d!60361 () Bool)

(declare-fun lt!123319 () (_ BitVec 32))

(assert (=> d!60361 (and (bvsge lt!123319 #b00000000000000000000000000000000) (bvsle lt!123319 (bvsub (size!6104 lt!123087) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60361 (= lt!123319 e!159673)))

(declare-fun c!41150 () Bool)

(assert (=> d!60361 (= c!41150 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60361 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6104 (_keys!6661 thiss!1504)) (size!6104 lt!123087)))))

(assert (=> d!60361 (= (arrayCountValidKeys!0 lt!123087 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))) lt!123319)))

(declare-fun bm!22983 () Bool)

(assert (=> bm!22983 (= call!22986 (arrayCountValidKeys!0 lt!123087 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246146 () Bool)

(assert (=> b!246146 (= e!159673 #b00000000000000000000000000000000)))

(assert (= (and d!60361 c!41150) b!246146))

(assert (= (and d!60361 (not c!41150)) b!246144))

(assert (= (and b!246144 c!41151) b!246145))

(assert (= (and b!246144 (not c!41151)) b!246143))

(assert (= (or b!246145 b!246143) bm!22983))

(assert (=> b!246144 m!263699))

(assert (=> b!246144 m!263699))

(assert (=> b!246144 m!263703))

(declare-fun m!263707 () Bool)

(assert (=> bm!22983 m!263707))

(assert (=> bm!22951 d!60361))

(declare-fun d!60363 () Bool)

(declare-fun get!2964 (Option!296) V!8209)

(assert (=> d!60363 (= (apply!231 lt!123238 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2964 (getValueByKey!290 (toList!1834 lt!123238) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8917 () Bool)

(assert (= bs!8917 d!60363))

(assert (=> bs!8917 m!263635))

(assert (=> bs!8917 m!263635))

(declare-fun m!263709 () Bool)

(assert (=> bs!8917 m!263709))

(assert (=> b!246012 d!60363))

(declare-fun bm!22984 () Bool)

(declare-fun c!41152 () Bool)

(declare-fun call!22987 () Bool)

(assert (=> bm!22984 (= call!22987 (arrayNoDuplicates!0 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41152 (Cons!3595 (select (arr!5762 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504)))) #b00000000000000000000000000000000) Nil!3596) Nil!3596)))))

(declare-fun d!60365 () Bool)

(declare-fun res!120697 () Bool)

(declare-fun e!159678 () Bool)

(assert (=> d!60365 (=> res!120697 e!159678)))

(assert (=> d!60365 (= res!120697 (bvsge #b00000000000000000000000000000000 (size!6104 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))))))))

(assert (=> d!60365 (= (arrayNoDuplicates!0 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))) #b00000000000000000000000000000000 Nil!3596) e!159678)))

(declare-fun b!246147 () Bool)

(declare-fun e!159677 () Bool)

(assert (=> b!246147 (= e!159678 e!159677)))

(declare-fun res!120695 () Bool)

(assert (=> b!246147 (=> (not res!120695) (not e!159677))))

(declare-fun e!159675 () Bool)

(assert (=> b!246147 (= res!120695 (not e!159675))))

(declare-fun res!120696 () Bool)

(assert (=> b!246147 (=> (not res!120696) (not e!159675))))

(assert (=> b!246147 (= res!120696 (validKeyInArray!0 (select (arr!5762 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!246148 () Bool)

(assert (=> b!246148 (= e!159675 (contains!1761 Nil!3596 (select (arr!5762 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!246149 () Bool)

(declare-fun e!159676 () Bool)

(assert (=> b!246149 (= e!159677 e!159676)))

(assert (=> b!246149 (= c!41152 (validKeyInArray!0 (select (arr!5762 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!246150 () Bool)

(assert (=> b!246150 (= e!159676 call!22987)))

(declare-fun b!246151 () Bool)

(assert (=> b!246151 (= e!159676 call!22987)))

(assert (= (and d!60365 (not res!120697)) b!246147))

(assert (= (and b!246147 res!120696) b!246148))

(assert (= (and b!246147 res!120695) b!246149))

(assert (= (and b!246149 c!41152) b!246151))

(assert (= (and b!246149 (not c!41152)) b!246150))

(assert (= (or b!246151 b!246150) bm!22984))

(assert (=> bm!22984 m!263639))

(declare-fun m!263711 () Bool)

(assert (=> bm!22984 m!263711))

(assert (=> b!246147 m!263639))

(assert (=> b!246147 m!263639))

(assert (=> b!246147 m!263641))

(assert (=> b!246148 m!263639))

(assert (=> b!246148 m!263639))

(declare-fun m!263713 () Bool)

(assert (=> b!246148 m!263713))

(assert (=> b!246149 m!263639))

(assert (=> b!246149 m!263639))

(assert (=> b!246149 m!263641))

(assert (=> b!245948 d!60365))

(declare-fun d!60367 () Bool)

(assert (=> d!60367 (= (arrayCountValidKeys!0 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))) #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6661 thiss!1504) #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60367 true))

(declare-fun _$84!21 () Unit!7572)

(assert (=> d!60367 (= (choose!1 (_keys!6661 thiss!1504) index!297 key!932) _$84!21)))

(declare-fun bs!8918 () Bool)

(assert (= bs!8918 d!60367))

(assert (=> bs!8918 m!263369))

(assert (=> bs!8918 m!263519))

(assert (=> bs!8918 m!263371))

(assert (=> d!60303 d!60367))

(declare-fun d!60369 () Bool)

(assert (=> d!60369 (= (apply!231 lt!123238 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)) (get!2964 (getValueByKey!290 (toList!1834 lt!123238) (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8919 () Bool)

(assert (= bs!8919 d!60369))

(assert (=> bs!8919 m!263487))

(declare-fun m!263715 () Bool)

(assert (=> bs!8919 m!263715))

(assert (=> bs!8919 m!263715))

(declare-fun m!263717 () Bool)

(assert (=> bs!8919 m!263717))

(assert (=> b!246011 d!60369))

(declare-fun d!60371 () Bool)

(declare-fun c!41155 () Bool)

(assert (=> d!60371 (= c!41155 ((_ is ValueCellFull!2867) (select (arr!5761 (_values!4529 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!159681 () V!8209)

(assert (=> d!60371 (= (get!2963 (select (arr!5761 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!159681)))

(declare-fun b!246156 () Bool)

(declare-fun get!2965 (ValueCell!2867 V!8209) V!8209)

(assert (=> b!246156 (= e!159681 (get!2965 (select (arr!5761 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!246157 () Bool)

(declare-fun get!2966 (ValueCell!2867 V!8209) V!8209)

(assert (=> b!246157 (= e!159681 (get!2966 (select (arr!5761 (_values!4529 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!574 (defaultEntry!4546 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60371 c!41155) b!246156))

(assert (= (and d!60371 (not c!41155)) b!246157))

(assert (=> b!246156 m!263569))

(assert (=> b!246156 m!263567))

(declare-fun m!263719 () Bool)

(assert (=> b!246156 m!263719))

(assert (=> b!246157 m!263569))

(assert (=> b!246157 m!263567))

(declare-fun m!263721 () Bool)

(assert (=> b!246157 m!263721))

(assert (=> b!246011 d!60371))

(declare-fun b!246170 () Bool)

(declare-fun e!159688 () SeekEntryResult!1057)

(assert (=> b!246170 (= e!159688 (Found!1057 (index!6400 lt!123157)))))

(declare-fun b!246171 () Bool)

(declare-fun e!159689 () SeekEntryResult!1057)

(assert (=> b!246171 (= e!159689 (MissingVacant!1057 (index!6400 lt!123157)))))

(declare-fun b!246172 () Bool)

(declare-fun c!41162 () Bool)

(declare-fun lt!123324 () (_ BitVec 64))

(assert (=> b!246172 (= c!41162 (= lt!123324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246172 (= e!159688 e!159689)))

(declare-fun lt!123325 () SeekEntryResult!1057)

(declare-fun d!60373 () Bool)

(assert (=> d!60373 (and (or ((_ is Undefined!1057) lt!123325) (not ((_ is Found!1057) lt!123325)) (and (bvsge (index!6399 lt!123325) #b00000000000000000000000000000000) (bvslt (index!6399 lt!123325) (size!6104 (_keys!6661 thiss!1504))))) (or ((_ is Undefined!1057) lt!123325) ((_ is Found!1057) lt!123325) (not ((_ is MissingVacant!1057) lt!123325)) (not (= (index!6401 lt!123325) (index!6400 lt!123157))) (and (bvsge (index!6401 lt!123325) #b00000000000000000000000000000000) (bvslt (index!6401 lt!123325) (size!6104 (_keys!6661 thiss!1504))))) (or ((_ is Undefined!1057) lt!123325) (ite ((_ is Found!1057) lt!123325) (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6399 lt!123325)) key!932) (and ((_ is MissingVacant!1057) lt!123325) (= (index!6401 lt!123325) (index!6400 lt!123157)) (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6401 lt!123325)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!159690 () SeekEntryResult!1057)

(assert (=> d!60373 (= lt!123325 e!159690)))

(declare-fun c!41164 () Bool)

(assert (=> d!60373 (= c!41164 (bvsge (x!24405 lt!123157) #b01111111111111111111111111111110))))

(assert (=> d!60373 (= lt!123324 (select (arr!5762 (_keys!6661 thiss!1504)) (index!6400 lt!123157)))))

(assert (=> d!60373 (validMask!0 (mask!10660 thiss!1504))))

(assert (=> d!60373 (= (seekKeyOrZeroReturnVacant!0 (x!24405 lt!123157) (index!6400 lt!123157) (index!6400 lt!123157) key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)) lt!123325)))

(declare-fun b!246173 () Bool)

(assert (=> b!246173 (= e!159690 e!159688)))

(declare-fun c!41163 () Bool)

(assert (=> b!246173 (= c!41163 (= lt!123324 key!932))))

(declare-fun b!246174 () Bool)

(assert (=> b!246174 (= e!159690 Undefined!1057)))

(declare-fun b!246175 () Bool)

(assert (=> b!246175 (= e!159689 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24405 lt!123157) #b00000000000000000000000000000001) (nextIndex!0 (index!6400 lt!123157) (bvadd (x!24405 lt!123157) #b00000000000000000000000000000001) (mask!10660 thiss!1504)) (index!6400 lt!123157) key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(assert (= (and d!60373 c!41164) b!246174))

(assert (= (and d!60373 (not c!41164)) b!246173))

(assert (= (and b!246173 c!41163) b!246170))

(assert (= (and b!246173 (not c!41163)) b!246172))

(assert (= (and b!246172 c!41162) b!246171))

(assert (= (and b!246172 (not c!41162)) b!246175))

(declare-fun m!263723 () Bool)

(assert (=> d!60373 m!263723))

(declare-fun m!263725 () Bool)

(assert (=> d!60373 m!263725))

(assert (=> d!60373 m!263501))

(assert (=> d!60373 m!263361))

(declare-fun m!263727 () Bool)

(assert (=> b!246175 m!263727))

(assert (=> b!246175 m!263727))

(declare-fun m!263729 () Bool)

(assert (=> b!246175 m!263729))

(assert (=> b!245866 d!60373))

(declare-fun b!246176 () Bool)

(declare-fun e!159692 () (_ BitVec 32))

(declare-fun call!22988 () (_ BitVec 32))

(assert (=> b!246176 (= e!159692 call!22988)))

(declare-fun b!246177 () Bool)

(declare-fun e!159691 () (_ BitVec 32))

(assert (=> b!246177 (= e!159691 e!159692)))

(declare-fun c!41166 () Bool)

(assert (=> b!246177 (= c!41166 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!246178 () Bool)

(assert (=> b!246178 (= e!159692 (bvadd #b00000000000000000000000000000001 call!22988))))

(declare-fun d!60375 () Bool)

(declare-fun lt!123326 () (_ BitVec 32))

(assert (=> d!60375 (and (bvsge lt!123326 #b00000000000000000000000000000000) (bvsle lt!123326 (bvsub (size!6104 (_keys!6661 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60375 (= lt!123326 e!159691)))

(declare-fun c!41165 () Bool)

(assert (=> d!60375 (= c!41165 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60375 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6104 (_keys!6661 thiss!1504)) (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60375 (= (arrayCountValidKeys!0 (_keys!6661 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))) lt!123326)))

(declare-fun bm!22985 () Bool)

(assert (=> bm!22985 (= call!22988 (arrayCountValidKeys!0 (_keys!6661 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246179 () Bool)

(assert (=> b!246179 (= e!159691 #b00000000000000000000000000000000)))

(assert (= (and d!60375 c!41165) b!246179))

(assert (= (and d!60375 (not c!41165)) b!246177))

(assert (= (and b!246177 c!41166) b!246178))

(assert (= (and b!246177 (not c!41166)) b!246176))

(assert (= (or b!246178 b!246176) bm!22985))

(declare-fun m!263731 () Bool)

(assert (=> b!246177 m!263731))

(assert (=> b!246177 m!263731))

(declare-fun m!263733 () Bool)

(assert (=> b!246177 m!263733))

(declare-fun m!263735 () Bool)

(assert (=> bm!22985 m!263735))

(assert (=> bm!22952 d!60375))

(declare-fun d!60377 () Bool)

(assert (=> d!60377 (= (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!246009 d!60377))

(assert (=> b!245924 d!60333))

(assert (=> d!60325 d!60295))

(declare-fun d!60379 () Bool)

(declare-fun e!159695 () Bool)

(assert (=> d!60379 e!159695))

(declare-fun res!120702 () Bool)

(assert (=> d!60379 (=> (not res!120702) (not e!159695))))

(declare-fun lt!123329 () SeekEntryResult!1057)

(assert (=> d!60379 (= res!120702 ((_ is Found!1057) lt!123329))))

(assert (=> d!60379 (= lt!123329 (seekEntryOrOpen!0 key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(assert (=> d!60379 true))

(declare-fun _$33!159 () Unit!7572)

(assert (=> d!60379 (= (choose!1157 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)) _$33!159)))

(declare-fun b!246184 () Bool)

(declare-fun res!120703 () Bool)

(assert (=> b!246184 (=> (not res!120703) (not e!159695))))

(assert (=> b!246184 (= res!120703 (inRange!0 (index!6399 lt!123329) (mask!10660 thiss!1504)))))

(declare-fun b!246185 () Bool)

(assert (=> b!246185 (= e!159695 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6399 lt!123329)) key!932))))

(assert (= (and d!60379 res!120702) b!246184))

(assert (= (and b!246184 res!120703) b!246185))

(assert (=> d!60379 m!263385))

(declare-fun m!263737 () Bool)

(assert (=> b!246184 m!263737))

(declare-fun m!263739 () Bool)

(assert (=> b!246185 m!263739))

(assert (=> d!60325 d!60379))

(assert (=> d!60325 d!60309))

(assert (=> b!245928 d!60377))

(declare-fun d!60381 () Bool)

(declare-fun res!120708 () Bool)

(declare-fun e!159700 () Bool)

(assert (=> d!60381 (=> res!120708 e!159700)))

(assert (=> d!60381 (= res!120708 (and ((_ is Cons!3594) (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) (= (_1!2372 (h!4251 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932)))))

(assert (=> d!60381 (= (containsKey!281 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932) e!159700)))

(declare-fun b!246190 () Bool)

(declare-fun e!159701 () Bool)

(assert (=> b!246190 (= e!159700 e!159701)))

(declare-fun res!120709 () Bool)

(assert (=> b!246190 (=> (not res!120709) (not e!159701))))

(assert (=> b!246190 (= res!120709 (and (or (not ((_ is Cons!3594) (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) (bvsle (_1!2372 (h!4251 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932)) ((_ is Cons!3594) (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) (bvslt (_1!2372 (h!4251 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))))) key!932)))))

(declare-fun b!246191 () Bool)

(assert (=> b!246191 (= e!159701 (containsKey!281 (t!8605 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))) key!932))))

(assert (= (and d!60381 (not res!120708)) b!246190))

(assert (= (and b!246190 res!120709) b!246191))

(declare-fun m!263741 () Bool)

(assert (=> b!246191 m!263741))

(assert (=> d!60321 d!60381))

(declare-fun d!60383 () Bool)

(assert (=> d!60383 (= (apply!231 lt!123238 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2964 (getValueByKey!290 (toList!1834 lt!123238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8920 () Bool)

(assert (= bs!8920 d!60383))

(declare-fun m!263743 () Bool)

(assert (=> bs!8920 m!263743))

(assert (=> bs!8920 m!263743))

(declare-fun m!263745 () Bool)

(assert (=> bs!8920 m!263745))

(assert (=> b!246000 d!60383))

(declare-fun d!60385 () Bool)

(assert (=> d!60385 (= (inRange!0 (index!6399 lt!123258) (mask!10660 thiss!1504)) (and (bvsge (index!6399 lt!123258) #b00000000000000000000000000000000) (bvslt (index!6399 lt!123258) (bvadd (mask!10660 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!246027 d!60385))

(declare-fun d!60387 () Bool)

(declare-fun e!159702 () Bool)

(assert (=> d!60387 e!159702))

(declare-fun res!120710 () Bool)

(assert (=> d!60387 (=> res!120710 e!159702)))

(declare-fun lt!123333 () Bool)

(assert (=> d!60387 (= res!120710 (not lt!123333))))

(declare-fun lt!123331 () Bool)

(assert (=> d!60387 (= lt!123333 lt!123331)))

(declare-fun lt!123330 () Unit!7572)

(declare-fun e!159703 () Unit!7572)

(assert (=> d!60387 (= lt!123330 e!159703)))

(declare-fun c!41167 () Bool)

(assert (=> d!60387 (= c!41167 lt!123331)))

(assert (=> d!60387 (= lt!123331 (containsKey!281 (toList!1834 (+!658 lt!123245 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))) lt!123240))))

(assert (=> d!60387 (= (contains!1759 (+!658 lt!123245 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504))) lt!123240) lt!123333)))

(declare-fun b!246192 () Bool)

(declare-fun lt!123332 () Unit!7572)

(assert (=> b!246192 (= e!159703 lt!123332)))

(assert (=> b!246192 (= lt!123332 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1834 (+!658 lt!123245 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))) lt!123240))))

(assert (=> b!246192 (isDefined!230 (getValueByKey!290 (toList!1834 (+!658 lt!123245 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))) lt!123240))))

(declare-fun b!246193 () Bool)

(declare-fun Unit!7584 () Unit!7572)

(assert (=> b!246193 (= e!159703 Unit!7584)))

(declare-fun b!246194 () Bool)

(assert (=> b!246194 (= e!159702 (isDefined!230 (getValueByKey!290 (toList!1834 (+!658 lt!123245 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))) lt!123240)))))

(assert (= (and d!60387 c!41167) b!246192))

(assert (= (and d!60387 (not c!41167)) b!246193))

(assert (= (and d!60387 (not res!120710)) b!246194))

(declare-fun m!263747 () Bool)

(assert (=> d!60387 m!263747))

(declare-fun m!263749 () Bool)

(assert (=> b!246192 m!263749))

(declare-fun m!263751 () Bool)

(assert (=> b!246192 m!263751))

(assert (=> b!246192 m!263751))

(declare-fun m!263753 () Bool)

(assert (=> b!246192 m!263753))

(assert (=> b!246194 m!263751))

(assert (=> b!246194 m!263751))

(assert (=> b!246194 m!263753))

(assert (=> b!246001 d!60387))

(declare-fun d!60389 () Bool)

(declare-fun e!159704 () Bool)

(assert (=> d!60389 e!159704))

(declare-fun res!120712 () Bool)

(assert (=> d!60389 (=> (not res!120712) (not e!159704))))

(declare-fun lt!123335 () ListLongMap!3637)

(assert (=> d!60389 (= res!120712 (contains!1759 lt!123335 (_1!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504)))))))

(declare-fun lt!123337 () List!3598)

(assert (=> d!60389 (= lt!123335 (ListLongMap!3638 lt!123337))))

(declare-fun lt!123336 () Unit!7572)

(declare-fun lt!123334 () Unit!7572)

(assert (=> d!60389 (= lt!123336 lt!123334)))

(assert (=> d!60389 (= (getValueByKey!290 lt!123337 (_1!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60389 (= lt!123334 (lemmaContainsTupThenGetReturnValue!157 lt!123337 (_1!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60389 (= lt!123337 (insertStrictlySorted!160 (toList!1834 lt!123239) (_1!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60389 (= (+!658 lt!123239 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504))) lt!123335)))

(declare-fun b!246195 () Bool)

(declare-fun res!120711 () Bool)

(assert (=> b!246195 (=> (not res!120711) (not e!159704))))

(assert (=> b!246195 (= res!120711 (= (getValueByKey!290 (toList!1834 lt!123335) (_1!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504))))))))

(declare-fun b!246196 () Bool)

(assert (=> b!246196 (= e!159704 (contains!1762 (toList!1834 lt!123335) (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504))))))

(assert (= (and d!60389 res!120712) b!246195))

(assert (= (and b!246195 res!120711) b!246196))

(declare-fun m!263755 () Bool)

(assert (=> d!60389 m!263755))

(declare-fun m!263757 () Bool)

(assert (=> d!60389 m!263757))

(declare-fun m!263759 () Bool)

(assert (=> d!60389 m!263759))

(declare-fun m!263761 () Bool)

(assert (=> d!60389 m!263761))

(declare-fun m!263763 () Bool)

(assert (=> b!246195 m!263763))

(declare-fun m!263765 () Bool)

(assert (=> b!246196 m!263765))

(assert (=> b!246001 d!60389))

(declare-fun d!60391 () Bool)

(assert (=> d!60391 (= (apply!231 lt!123237 lt!123233) (get!2964 (getValueByKey!290 (toList!1834 lt!123237) lt!123233)))))

(declare-fun bs!8921 () Bool)

(assert (= bs!8921 d!60391))

(declare-fun m!263767 () Bool)

(assert (=> bs!8921 m!263767))

(assert (=> bs!8921 m!263767))

(declare-fun m!263769 () Bool)

(assert (=> bs!8921 m!263769))

(assert (=> b!246001 d!60391))

(declare-fun d!60393 () Bool)

(assert (=> d!60393 (= (apply!231 (+!658 lt!123239 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504))) lt!123231) (get!2964 (getValueByKey!290 (toList!1834 (+!658 lt!123239 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504)))) lt!123231)))))

(declare-fun bs!8922 () Bool)

(assert (= bs!8922 d!60393))

(declare-fun m!263771 () Bool)

(assert (=> bs!8922 m!263771))

(assert (=> bs!8922 m!263771))

(declare-fun m!263773 () Bool)

(assert (=> bs!8922 m!263773))

(assert (=> b!246001 d!60393))

(declare-fun d!60395 () Bool)

(assert (=> d!60395 (= (apply!231 (+!658 lt!123246 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504))) lt!123234) (apply!231 lt!123246 lt!123234))))

(declare-fun lt!123340 () Unit!7572)

(declare-fun choose!1159 (ListLongMap!3637 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7572)

(assert (=> d!60395 (= lt!123340 (choose!1159 lt!123246 lt!123250 (minValue!4387 thiss!1504) lt!123234))))

(declare-fun e!159707 () Bool)

(assert (=> d!60395 e!159707))

(declare-fun res!120715 () Bool)

(assert (=> d!60395 (=> (not res!120715) (not e!159707))))

(assert (=> d!60395 (= res!120715 (contains!1759 lt!123246 lt!123234))))

(assert (=> d!60395 (= (addApplyDifferent!207 lt!123246 lt!123250 (minValue!4387 thiss!1504) lt!123234) lt!123340)))

(declare-fun b!246200 () Bool)

(assert (=> b!246200 (= e!159707 (not (= lt!123234 lt!123250)))))

(assert (= (and d!60395 res!120715) b!246200))

(declare-fun m!263775 () Bool)

(assert (=> d!60395 m!263775))

(assert (=> d!60395 m!263595))

(assert (=> d!60395 m!263577))

(assert (=> d!60395 m!263577))

(assert (=> d!60395 m!263587))

(declare-fun m!263777 () Bool)

(assert (=> d!60395 m!263777))

(assert (=> b!246001 d!60395))

(declare-fun d!60397 () Bool)

(declare-fun e!159708 () Bool)

(assert (=> d!60397 e!159708))

(declare-fun res!120717 () Bool)

(assert (=> d!60397 (=> (not res!120717) (not e!159708))))

(declare-fun lt!123342 () ListLongMap!3637)

(assert (=> d!60397 (= res!120717 (contains!1759 lt!123342 (_1!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504)))))))

(declare-fun lt!123344 () List!3598)

(assert (=> d!60397 (= lt!123342 (ListLongMap!3638 lt!123344))))

(declare-fun lt!123343 () Unit!7572)

(declare-fun lt!123341 () Unit!7572)

(assert (=> d!60397 (= lt!123343 lt!123341)))

(assert (=> d!60397 (= (getValueByKey!290 lt!123344 (_1!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504)))))))

(assert (=> d!60397 (= lt!123341 (lemmaContainsTupThenGetReturnValue!157 lt!123344 (_1!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504)))))))

(assert (=> d!60397 (= lt!123344 (insertStrictlySorted!160 (toList!1834 lt!123246) (_1!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504)))))))

(assert (=> d!60397 (= (+!658 lt!123246 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504))) lt!123342)))

(declare-fun b!246201 () Bool)

(declare-fun res!120716 () Bool)

(assert (=> b!246201 (=> (not res!120716) (not e!159708))))

(assert (=> b!246201 (= res!120716 (= (getValueByKey!290 (toList!1834 lt!123342) (_1!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504))))))))

(declare-fun b!246202 () Bool)

(assert (=> b!246202 (= e!159708 (contains!1762 (toList!1834 lt!123342) (tuple2!4723 lt!123250 (minValue!4387 thiss!1504))))))

(assert (= (and d!60397 res!120717) b!246201))

(assert (= (and b!246201 res!120716) b!246202))

(declare-fun m!263779 () Bool)

(assert (=> d!60397 m!263779))

(declare-fun m!263781 () Bool)

(assert (=> d!60397 m!263781))

(declare-fun m!263783 () Bool)

(assert (=> d!60397 m!263783))

(declare-fun m!263785 () Bool)

(assert (=> d!60397 m!263785))

(declare-fun m!263787 () Bool)

(assert (=> b!246201 m!263787))

(declare-fun m!263789 () Bool)

(assert (=> b!246202 m!263789))

(assert (=> b!246001 d!60397))

(declare-fun d!60399 () Bool)

(declare-fun e!159709 () Bool)

(assert (=> d!60399 e!159709))

(declare-fun res!120719 () Bool)

(assert (=> d!60399 (=> (not res!120719) (not e!159709))))

(declare-fun lt!123346 () ListLongMap!3637)

(assert (=> d!60399 (= res!120719 (contains!1759 lt!123346 (_1!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504)))))))

(declare-fun lt!123348 () List!3598)

(assert (=> d!60399 (= lt!123346 (ListLongMap!3638 lt!123348))))

(declare-fun lt!123347 () Unit!7572)

(declare-fun lt!123345 () Unit!7572)

(assert (=> d!60399 (= lt!123347 lt!123345)))

(assert (=> d!60399 (= (getValueByKey!290 lt!123348 (_1!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504)))))))

(assert (=> d!60399 (= lt!123345 (lemmaContainsTupThenGetReturnValue!157 lt!123348 (_1!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504)))))))

(assert (=> d!60399 (= lt!123348 (insertStrictlySorted!160 (toList!1834 lt!123237) (_1!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504)))))))

(assert (=> d!60399 (= (+!658 lt!123237 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504))) lt!123346)))

(declare-fun b!246203 () Bool)

(declare-fun res!120718 () Bool)

(assert (=> b!246203 (=> (not res!120718) (not e!159709))))

(assert (=> b!246203 (= res!120718 (= (getValueByKey!290 (toList!1834 lt!123346) (_1!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504))))))))

(declare-fun b!246204 () Bool)

(assert (=> b!246204 (= e!159709 (contains!1762 (toList!1834 lt!123346) (tuple2!4723 lt!123232 (minValue!4387 thiss!1504))))))

(assert (= (and d!60399 res!120719) b!246203))

(assert (= (and b!246203 res!120718) b!246204))

(declare-fun m!263791 () Bool)

(assert (=> d!60399 m!263791))

(declare-fun m!263793 () Bool)

(assert (=> d!60399 m!263793))

(declare-fun m!263795 () Bool)

(assert (=> d!60399 m!263795))

(declare-fun m!263797 () Bool)

(assert (=> d!60399 m!263797))

(declare-fun m!263799 () Bool)

(assert (=> b!246203 m!263799))

(declare-fun m!263801 () Bool)

(assert (=> b!246204 m!263801))

(assert (=> b!246001 d!60399))

(declare-fun d!60401 () Bool)

(declare-fun e!159710 () Bool)

(assert (=> d!60401 e!159710))

(declare-fun res!120721 () Bool)

(assert (=> d!60401 (=> (not res!120721) (not e!159710))))

(declare-fun lt!123350 () ListLongMap!3637)

(assert (=> d!60401 (= res!120721 (contains!1759 lt!123350 (_1!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))))))

(declare-fun lt!123352 () List!3598)

(assert (=> d!60401 (= lt!123350 (ListLongMap!3638 lt!123352))))

(declare-fun lt!123351 () Unit!7572)

(declare-fun lt!123349 () Unit!7572)

(assert (=> d!60401 (= lt!123351 lt!123349)))

(assert (=> d!60401 (= (getValueByKey!290 lt!123352 (_1!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60401 (= lt!123349 (lemmaContainsTupThenGetReturnValue!157 lt!123352 (_1!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60401 (= lt!123352 (insertStrictlySorted!160 (toList!1834 lt!123245) (_1!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504))) (_2!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))))))

(assert (=> d!60401 (= (+!658 lt!123245 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504))) lt!123350)))

(declare-fun b!246205 () Bool)

(declare-fun res!120720 () Bool)

(assert (=> b!246205 (=> (not res!120720) (not e!159710))))

(assert (=> b!246205 (= res!120720 (= (getValueByKey!290 (toList!1834 lt!123350) (_1!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504)))) (Some!295 (_2!2372 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504))))))))

(declare-fun b!246206 () Bool)

(assert (=> b!246206 (= e!159710 (contains!1762 (toList!1834 lt!123350) (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504))))))

(assert (= (and d!60401 res!120721) b!246205))

(assert (= (and b!246205 res!120720) b!246206))

(declare-fun m!263803 () Bool)

(assert (=> d!60401 m!263803))

(declare-fun m!263805 () Bool)

(assert (=> d!60401 m!263805))

(declare-fun m!263807 () Bool)

(assert (=> d!60401 m!263807))

(declare-fun m!263809 () Bool)

(assert (=> d!60401 m!263809))

(declare-fun m!263811 () Bool)

(assert (=> b!246205 m!263811))

(declare-fun m!263813 () Bool)

(assert (=> b!246206 m!263813))

(assert (=> b!246001 d!60401))

(declare-fun d!60403 () Bool)

(assert (=> d!60403 (= (apply!231 (+!658 lt!123246 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504))) lt!123234) (get!2964 (getValueByKey!290 (toList!1834 (+!658 lt!123246 (tuple2!4723 lt!123250 (minValue!4387 thiss!1504)))) lt!123234)))))

(declare-fun bs!8923 () Bool)

(assert (= bs!8923 d!60403))

(declare-fun m!263815 () Bool)

(assert (=> bs!8923 m!263815))

(assert (=> bs!8923 m!263815))

(declare-fun m!263817 () Bool)

(assert (=> bs!8923 m!263817))

(assert (=> b!246001 d!60403))

(declare-fun d!60405 () Bool)

(assert (=> d!60405 (= (apply!231 (+!658 lt!123239 (tuple2!4723 lt!123236 (zeroValue!4387 thiss!1504))) lt!123231) (apply!231 lt!123239 lt!123231))))

(declare-fun lt!123353 () Unit!7572)

(assert (=> d!60405 (= lt!123353 (choose!1159 lt!123239 lt!123236 (zeroValue!4387 thiss!1504) lt!123231))))

(declare-fun e!159711 () Bool)

(assert (=> d!60405 e!159711))

(declare-fun res!120722 () Bool)

(assert (=> d!60405 (=> (not res!120722) (not e!159711))))

(assert (=> d!60405 (= res!120722 (contains!1759 lt!123239 lt!123231))))

(assert (=> d!60405 (= (addApplyDifferent!207 lt!123239 lt!123236 (zeroValue!4387 thiss!1504) lt!123231) lt!123353)))

(declare-fun b!246207 () Bool)

(assert (=> b!246207 (= e!159711 (not (= lt!123231 lt!123236)))))

(assert (= (and d!60405 res!120722) b!246207))

(declare-fun m!263819 () Bool)

(assert (=> d!60405 m!263819))

(assert (=> d!60405 m!263593))

(assert (=> d!60405 m!263599))

(assert (=> d!60405 m!263599))

(assert (=> d!60405 m!263601))

(declare-fun m!263821 () Bool)

(assert (=> d!60405 m!263821))

(assert (=> b!246001 d!60405))

(declare-fun d!60407 () Bool)

(assert (=> d!60407 (= (apply!231 (+!658 lt!123237 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504))) lt!123233) (apply!231 lt!123237 lt!123233))))

(declare-fun lt!123354 () Unit!7572)

(assert (=> d!60407 (= lt!123354 (choose!1159 lt!123237 lt!123232 (minValue!4387 thiss!1504) lt!123233))))

(declare-fun e!159712 () Bool)

(assert (=> d!60407 e!159712))

(declare-fun res!120723 () Bool)

(assert (=> d!60407 (=> (not res!120723) (not e!159712))))

(assert (=> d!60407 (= res!120723 (contains!1759 lt!123237 lt!123233))))

(assert (=> d!60407 (= (addApplyDifferent!207 lt!123237 lt!123232 (minValue!4387 thiss!1504) lt!123233) lt!123354)))

(declare-fun b!246208 () Bool)

(assert (=> b!246208 (= e!159712 (not (= lt!123233 lt!123232)))))

(assert (= (and d!60407 res!120723) b!246208))

(declare-fun m!263823 () Bool)

(assert (=> d!60407 m!263823))

(assert (=> d!60407 m!263581))

(assert (=> d!60407 m!263583))

(assert (=> d!60407 m!263583))

(assert (=> d!60407 m!263585))

(declare-fun m!263825 () Bool)

(assert (=> d!60407 m!263825))

(assert (=> b!246001 d!60407))

(declare-fun d!60409 () Bool)

(assert (=> d!60409 (= (apply!231 (+!658 lt!123237 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504))) lt!123233) (get!2964 (getValueByKey!290 (toList!1834 (+!658 lt!123237 (tuple2!4723 lt!123232 (minValue!4387 thiss!1504)))) lt!123233)))))

(declare-fun bs!8924 () Bool)

(assert (= bs!8924 d!60409))

(declare-fun m!263827 () Bool)

(assert (=> bs!8924 m!263827))

(assert (=> bs!8924 m!263827))

(declare-fun m!263829 () Bool)

(assert (=> bs!8924 m!263829))

(assert (=> b!246001 d!60409))

(assert (=> b!246001 d!60337))

(declare-fun d!60411 () Bool)

(assert (=> d!60411 (= (apply!231 lt!123246 lt!123234) (get!2964 (getValueByKey!290 (toList!1834 lt!123246) lt!123234)))))

(declare-fun bs!8925 () Bool)

(assert (= bs!8925 d!60411))

(declare-fun m!263831 () Bool)

(assert (=> bs!8925 m!263831))

(assert (=> bs!8925 m!263831))

(declare-fun m!263833 () Bool)

(assert (=> bs!8925 m!263833))

(assert (=> b!246001 d!60411))

(declare-fun d!60413 () Bool)

(assert (=> d!60413 (contains!1759 (+!658 lt!123245 (tuple2!4723 lt!123241 (zeroValue!4387 thiss!1504))) lt!123240)))

(declare-fun lt!123357 () Unit!7572)

(declare-fun choose!1160 (ListLongMap!3637 (_ BitVec 64) V!8209 (_ BitVec 64)) Unit!7572)

(assert (=> d!60413 (= lt!123357 (choose!1160 lt!123245 lt!123241 (zeroValue!4387 thiss!1504) lt!123240))))

(assert (=> d!60413 (contains!1759 lt!123245 lt!123240)))

(assert (=> d!60413 (= (addStillContains!207 lt!123245 lt!123241 (zeroValue!4387 thiss!1504) lt!123240) lt!123357)))

(declare-fun bs!8926 () Bool)

(assert (= bs!8926 d!60413))

(assert (=> bs!8926 m!263589))

(assert (=> bs!8926 m!263589))

(assert (=> bs!8926 m!263591))

(declare-fun m!263835 () Bool)

(assert (=> bs!8926 m!263835))

(declare-fun m!263837 () Bool)

(assert (=> bs!8926 m!263837))

(assert (=> b!246001 d!60413))

(declare-fun d!60415 () Bool)

(assert (=> d!60415 (= (apply!231 lt!123239 lt!123231) (get!2964 (getValueByKey!290 (toList!1834 lt!123239) lt!123231)))))

(declare-fun bs!8927 () Bool)

(assert (= bs!8927 d!60415))

(declare-fun m!263839 () Bool)

(assert (=> bs!8927 m!263839))

(assert (=> bs!8927 m!263839))

(declare-fun m!263841 () Bool)

(assert (=> bs!8927 m!263841))

(assert (=> b!246001 d!60415))

(assert (=> b!246014 d!60377))

(assert (=> d!60299 d!60295))

(declare-fun b!246226 () Bool)

(declare-fun res!120735 () Bool)

(declare-fun e!159724 () Bool)

(assert (=> b!246226 (=> (not res!120735) (not e!159724))))

(declare-fun call!22994 () Bool)

(assert (=> b!246226 (= res!120735 call!22994)))

(declare-fun e!159721 () Bool)

(assert (=> b!246226 (= e!159721 e!159724)))

(declare-fun d!60417 () Bool)

(declare-fun e!159723 () Bool)

(assert (=> d!60417 e!159723))

(declare-fun c!41173 () Bool)

(declare-fun lt!123360 () SeekEntryResult!1057)

(assert (=> d!60417 (= c!41173 ((_ is MissingZero!1057) lt!123360))))

(assert (=> d!60417 (= lt!123360 (seekEntryOrOpen!0 key!932 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(assert (=> d!60417 true))

(declare-fun _$34!1104 () Unit!7572)

(assert (=> d!60417 (= (choose!1156 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) key!932 (defaultEntry!4546 thiss!1504)) _$34!1104)))

(declare-fun b!246227 () Bool)

(declare-fun call!22993 () Bool)

(assert (=> b!246227 (= e!159724 (not call!22993))))

(declare-fun bm!22990 () Bool)

(assert (=> bm!22990 (= call!22994 (inRange!0 (ite c!41173 (index!6398 lt!123360) (index!6401 lt!123360)) (mask!10660 thiss!1504)))))

(declare-fun b!246228 () Bool)

(declare-fun res!120733 () Bool)

(assert (=> b!246228 (=> (not res!120733) (not e!159724))))

(assert (=> b!246228 (= res!120733 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6401 lt!123360)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246229 () Bool)

(assert (=> b!246229 (= e!159723 e!159721)))

(declare-fun c!41172 () Bool)

(assert (=> b!246229 (= c!41172 ((_ is MissingVacant!1057) lt!123360))))

(declare-fun b!246230 () Bool)

(declare-fun e!159722 () Bool)

(assert (=> b!246230 (= e!159723 e!159722)))

(declare-fun res!120734 () Bool)

(assert (=> b!246230 (= res!120734 call!22994)))

(assert (=> b!246230 (=> (not res!120734) (not e!159722))))

(declare-fun bm!22991 () Bool)

(assert (=> bm!22991 (= call!22993 (arrayContainsKey!0 (_keys!6661 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!246231 () Bool)

(assert (=> b!246231 (= e!159721 ((_ is Undefined!1057) lt!123360))))

(declare-fun b!246232 () Bool)

(declare-fun res!120732 () Bool)

(assert (=> b!246232 (= res!120732 (= (select (arr!5762 (_keys!6661 thiss!1504)) (index!6398 lt!123360)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246232 (=> (not res!120732) (not e!159722))))

(declare-fun b!246233 () Bool)

(assert (=> b!246233 (= e!159722 (not call!22993))))

(assert (= (and d!60417 c!41173) b!246230))

(assert (= (and d!60417 (not c!41173)) b!246229))

(assert (= (and b!246230 res!120734) b!246232))

(assert (= (and b!246232 res!120732) b!246233))

(assert (= (and b!246229 c!41172) b!246226))

(assert (= (and b!246229 (not c!41172)) b!246231))

(assert (= (and b!246226 res!120735) b!246228))

(assert (= (and b!246228 res!120733) b!246227))

(assert (= (or b!246230 b!246226) bm!22990))

(assert (= (or b!246233 b!246227) bm!22991))

(assert (=> d!60417 m!263385))

(assert (=> bm!22991 m!263359))

(declare-fun m!263843 () Bool)

(assert (=> b!246228 m!263843))

(declare-fun m!263845 () Bool)

(assert (=> bm!22990 m!263845))

(declare-fun m!263847 () Bool)

(assert (=> b!246232 m!263847))

(assert (=> d!60299 d!60417))

(assert (=> d!60299 d!60309))

(declare-fun d!60419 () Bool)

(assert (=> d!60419 (arrayNoDuplicates!0 (array!12142 (store (arr!5762 (_keys!6661 thiss!1504)) index!297 key!932) (size!6104 (_keys!6661 thiss!1504))) #b00000000000000000000000000000000 Nil!3596)))

(assert (=> d!60419 true))

(declare-fun _$65!71 () Unit!7572)

(assert (=> d!60419 (= (choose!41 (_keys!6661 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3596) _$65!71)))

(declare-fun bs!8928 () Bool)

(assert (= bs!8928 d!60419))

(assert (=> bs!8928 m!263369))

(assert (=> bs!8928 m!263545))

(assert (=> d!60313 d!60419))

(declare-fun d!60421 () Bool)

(declare-fun e!159725 () Bool)

(assert (=> d!60421 e!159725))

(declare-fun res!120736 () Bool)

(assert (=> d!60421 (=> res!120736 e!159725)))

(declare-fun lt!123364 () Bool)

(assert (=> d!60421 (= res!120736 (not lt!123364))))

(declare-fun lt!123362 () Bool)

(assert (=> d!60421 (= lt!123364 lt!123362)))

(declare-fun lt!123361 () Unit!7572)

(declare-fun e!159726 () Unit!7572)

(assert (=> d!60421 (= lt!123361 e!159726)))

(declare-fun c!41174 () Bool)

(assert (=> d!60421 (= c!41174 lt!123362)))

(assert (=> d!60421 (= lt!123362 (containsKey!281 (toList!1834 lt!123238) (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60421 (= (contains!1759 lt!123238 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)) lt!123364)))

(declare-fun b!246234 () Bool)

(declare-fun lt!123363 () Unit!7572)

(assert (=> b!246234 (= e!159726 lt!123363)))

(assert (=> b!246234 (= lt!123363 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1834 lt!123238) (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!246234 (isDefined!230 (getValueByKey!290 (toList!1834 lt!123238) (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246235 () Bool)

(declare-fun Unit!7585 () Unit!7572)

(assert (=> b!246235 (= e!159726 Unit!7585)))

(declare-fun b!246236 () Bool)

(assert (=> b!246236 (= e!159725 (isDefined!230 (getValueByKey!290 (toList!1834 lt!123238) (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60421 c!41174) b!246234))

(assert (= (and d!60421 (not c!41174)) b!246235))

(assert (= (and d!60421 (not res!120736)) b!246236))

(assert (=> d!60421 m!263487))

(declare-fun m!263849 () Bool)

(assert (=> d!60421 m!263849))

(assert (=> b!246234 m!263487))

(declare-fun m!263851 () Bool)

(assert (=> b!246234 m!263851))

(assert (=> b!246234 m!263487))

(assert (=> b!246234 m!263715))

(assert (=> b!246234 m!263715))

(declare-fun m!263853 () Bool)

(assert (=> b!246234 m!263853))

(assert (=> b!246236 m!263487))

(assert (=> b!246236 m!263715))

(assert (=> b!246236 m!263715))

(assert (=> b!246236 m!263853))

(assert (=> b!246013 d!60421))

(declare-fun d!60423 () Bool)

(assert (=> d!60423 (= (inRange!0 (ite c!41084 (index!6398 lt!123164) (index!6401 lt!123164)) (mask!10660 thiss!1504)) (and (bvsge (ite c!41084 (index!6398 lt!123164) (index!6401 lt!123164)) #b00000000000000000000000000000000) (bvslt (ite c!41084 (index!6398 lt!123164) (index!6401 lt!123164)) (bvadd (mask!10660 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22947 d!60423))

(declare-fun bm!22994 () Bool)

(declare-fun call!22997 () Bool)

(assert (=> bm!22994 (= call!22997 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6661 thiss!1504) (mask!10660 thiss!1504)))))

(declare-fun b!246245 () Bool)

(declare-fun e!159733 () Bool)

(assert (=> b!246245 (= e!159733 call!22997)))

(declare-fun b!246246 () Bool)

(declare-fun e!159735 () Bool)

(assert (=> b!246246 (= e!159735 call!22997)))

(declare-fun b!246247 () Bool)

(declare-fun e!159734 () Bool)

(assert (=> b!246247 (= e!159734 e!159733)))

(declare-fun c!41177 () Bool)

(assert (=> b!246247 (= c!41177 (validKeyInArray!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!246248 () Bool)

(assert (=> b!246248 (= e!159733 e!159735)))

(declare-fun lt!123373 () (_ BitVec 64))

(assert (=> b!246248 (= lt!123373 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!123371 () Unit!7572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12141 (_ BitVec 64) (_ BitVec 32)) Unit!7572)

(assert (=> b!246248 (= lt!123371 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6661 thiss!1504) lt!123373 #b00000000000000000000000000000000))))

(assert (=> b!246248 (arrayContainsKey!0 (_keys!6661 thiss!1504) lt!123373 #b00000000000000000000000000000000)))

(declare-fun lt!123372 () Unit!7572)

(assert (=> b!246248 (= lt!123372 lt!123371)))

(declare-fun res!120741 () Bool)

(assert (=> b!246248 (= res!120741 (= (seekEntryOrOpen!0 (select (arr!5762 (_keys!6661 thiss!1504)) #b00000000000000000000000000000000) (_keys!6661 thiss!1504) (mask!10660 thiss!1504)) (Found!1057 #b00000000000000000000000000000000)))))

(assert (=> b!246248 (=> (not res!120741) (not e!159735))))

(declare-fun d!60425 () Bool)

(declare-fun res!120742 () Bool)

(assert (=> d!60425 (=> res!120742 e!159734)))

(assert (=> d!60425 (= res!120742 (bvsge #b00000000000000000000000000000000 (size!6104 (_keys!6661 thiss!1504))))))

(assert (=> d!60425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6661 thiss!1504) (mask!10660 thiss!1504)) e!159734)))

(assert (= (and d!60425 (not res!120742)) b!246247))

(assert (= (and b!246247 c!41177) b!246248))

(assert (= (and b!246247 (not c!41177)) b!246245))

(assert (= (and b!246248 res!120741) b!246246))

(assert (= (or b!246246 b!246245) bm!22994))

(declare-fun m!263855 () Bool)

(assert (=> bm!22994 m!263855))

(assert (=> b!246247 m!263487))

(assert (=> b!246247 m!263487))

(assert (=> b!246247 m!263535))

(assert (=> b!246248 m!263487))

(declare-fun m!263857 () Bool)

(assert (=> b!246248 m!263857))

(declare-fun m!263859 () Bool)

(assert (=> b!246248 m!263859))

(assert (=> b!246248 m!263487))

(declare-fun m!263861 () Bool)

(assert (=> b!246248 m!263861))

(assert (=> b!245901 d!60425))

(declare-fun d!60427 () Bool)

(assert (=> d!60427 (isDefined!230 (getValueByKey!290 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(declare-fun lt!123376 () Unit!7572)

(declare-fun choose!1161 (List!3598 (_ BitVec 64)) Unit!7572)

(assert (=> d!60427 (= lt!123376 (choose!1161 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(declare-fun e!159738 () Bool)

(assert (=> d!60427 e!159738))

(declare-fun res!120745 () Bool)

(assert (=> d!60427 (=> (not res!120745) (not e!159738))))

(declare-fun isStrictlySorted!355 (List!3598) Bool)

(assert (=> d!60427 (= res!120745 (isStrictlySorted!355 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504)))))))

(assert (=> d!60427 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932) lt!123376)))

(declare-fun b!246251 () Bool)

(assert (=> b!246251 (= e!159738 (containsKey!281 (toList!1834 (getCurrentListMap!1366 (_keys!6661 thiss!1504) (_values!4529 thiss!1504) (mask!10660 thiss!1504) (extraKeys!4283 thiss!1504) (zeroValue!4387 thiss!1504) (minValue!4387 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4546 thiss!1504))) key!932))))

(assert (= (and d!60427 res!120745) b!246251))

(assert (=> d!60427 m!263551))

(assert (=> d!60427 m!263551))

(assert (=> d!60427 m!263553))

(declare-fun m!263863 () Bool)

(assert (=> d!60427 m!263863))

(declare-fun m!263865 () Bool)

(assert (=> d!60427 m!263865))

(assert (=> b!246251 m!263547))

(assert (=> b!245955 d!60427))

(assert (=> b!245955 d!60351))

(assert (=> b!245955 d!60353))

(assert (=> b!245900 d!60307))

(declare-fun b!246262 () Bool)

(declare-fun res!120755 () Bool)

(declare-fun e!159741 () Bool)

(assert (=> b!246262 (=> (not res!120755) (not e!159741))))

(declare-fun size!6109 (LongMapFixedSize!3634) (_ BitVec 32))

(assert (=> b!246262 (= res!120755 (= (size!6109 thiss!1504) (bvadd (_size!1866 thiss!1504) (bvsdiv (bvadd (extraKeys!4283 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!60429 () Bool)

(declare-fun res!120756 () Bool)

(assert (=> d!60429 (=> (not res!120756) (not e!159741))))

(assert (=> d!60429 (= res!120756 (validMask!0 (mask!10660 thiss!1504)))))

(assert (=> d!60429 (= (simpleValid!254 thiss!1504) e!159741)))

(declare-fun b!246261 () Bool)

(declare-fun res!120757 () Bool)

(assert (=> b!246261 (=> (not res!120757) (not e!159741))))

(assert (=> b!246261 (= res!120757 (bvsge (size!6109 thiss!1504) (_size!1866 thiss!1504)))))

(declare-fun b!246263 () Bool)

(assert (=> b!246263 (= e!159741 (and (bvsge (extraKeys!4283 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4283 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1866 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!246260 () Bool)

(declare-fun res!120754 () Bool)

(assert (=> b!246260 (=> (not res!120754) (not e!159741))))

(assert (=> b!246260 (= res!120754 (and (= (size!6103 (_values!4529 thiss!1504)) (bvadd (mask!10660 thiss!1504) #b00000000000000000000000000000001)) (= (size!6104 (_keys!6661 thiss!1504)) (size!6103 (_values!4529 thiss!1504))) (bvsge (_size!1866 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1866 thiss!1504) (bvadd (mask!10660 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!60429 res!120756) b!246260))

(assert (= (and b!246260 res!120754) b!246261))

(assert (= (and b!246261 res!120757) b!246262))

(assert (= (and b!246262 res!120755) b!246263))

(declare-fun m!263867 () Bool)

(assert (=> b!246262 m!263867))

(assert (=> d!60429 m!263361))

(assert (=> b!246261 m!263867))

(assert (=> d!60301 d!60429))

(declare-fun d!60431 () Bool)

(declare-fun e!159742 () Bool)

(assert (=> d!60431 e!159742))

(declare-fun res!120758 () Bool)

(assert (=> d!60431 (=> res!120758 e!159742)))

(declare-fun lt!123380 () Bool)

(assert (=> d!60431 (= res!120758 (not lt!123380))))

(declare-fun lt!123378 () Bool)

(assert (=> d!60431 (= lt!123380 lt!123378)))

(declare-fun lt!123377 () Unit!7572)

(declare-fun e!159743 () Unit!7572)

(assert (=> d!60431 (= lt!123377 e!159743)))

(declare-fun c!41178 () Bool)

(assert (=> d!60431 (= c!41178 lt!123378)))

(assert (=> d!60431 (= lt!123378 (containsKey!281 (toList!1834 lt!123238) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60431 (= (contains!1759 lt!123238 #b1000000000000000000000000000000000000000000000000000000000000000) lt!123380)))

(declare-fun b!246264 () Bool)

(declare-fun lt!123379 () Unit!7572)

(assert (=> b!246264 (= e!159743 lt!123379)))

(assert (=> b!246264 (= lt!123379 (lemmaContainsKeyImpliesGetValueByKeyDefined!229 (toList!1834 lt!123238) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!246264 (isDefined!230 (getValueByKey!290 (toList!1834 lt!123238) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!246265 () Bool)

(declare-fun Unit!7586 () Unit!7572)

(assert (=> b!246265 (= e!159743 Unit!7586)))

(declare-fun b!246266 () Bool)

(assert (=> b!246266 (= e!159742 (isDefined!230 (getValueByKey!290 (toList!1834 lt!123238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60431 c!41178) b!246264))

(assert (= (and d!60431 (not c!41178)) b!246265))

(assert (= (and d!60431 (not res!120758)) b!246266))

(declare-fun m!263869 () Bool)

(assert (=> d!60431 m!263869))

(declare-fun m!263871 () Bool)

(assert (=> b!246264 m!263871))

(assert (=> b!246264 m!263743))

(assert (=> b!246264 m!263743))

(declare-fun m!263873 () Bool)

(assert (=> b!246264 m!263873))

(assert (=> b!246266 m!263743))

(assert (=> b!246266 m!263743))

(assert (=> b!246266 m!263873))

(assert (=> bm!22972 d!60431))

(declare-fun d!60433 () Bool)

(declare-fun res!120759 () Bool)

(declare-fun e!159744 () Bool)

(assert (=> d!60433 (=> res!120759 e!159744)))

(assert (=> d!60433 (= res!120759 (= (select (arr!5762 (_keys!6661 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60433 (= (arrayContainsKey!0 (_keys!6661 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!159744)))

(declare-fun b!246267 () Bool)

(declare-fun e!159745 () Bool)

(assert (=> b!246267 (= e!159744 e!159745)))

(declare-fun res!120760 () Bool)

(assert (=> b!246267 (=> (not res!120760) (not e!159745))))

(assert (=> b!246267 (= res!120760 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6104 (_keys!6661 thiss!1504))))))

(declare-fun b!246268 () Bool)

(assert (=> b!246268 (= e!159745 (arrayContainsKey!0 (_keys!6661 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60433 (not res!120759)) b!246267))

(assert (= (and b!246267 res!120760) b!246268))

(assert (=> d!60433 m!263731))

(declare-fun m!263875 () Bool)

(assert (=> b!246268 m!263875))

(assert (=> b!245851 d!60433))

(declare-fun condMapEmpty!10904 () Bool)

(declare-fun mapDefault!10904 () ValueCell!2867)

(assert (=> mapNonEmpty!10903 (= condMapEmpty!10904 (= mapRest!10903 ((as const (Array (_ BitVec 32) ValueCell!2867)) mapDefault!10904)))))

(declare-fun e!159746 () Bool)

(declare-fun mapRes!10904 () Bool)

(assert (=> mapNonEmpty!10903 (= tp!22927 (and e!159746 mapRes!10904))))

(declare-fun mapNonEmpty!10904 () Bool)

(declare-fun tp!22928 () Bool)

(declare-fun e!159747 () Bool)

(assert (=> mapNonEmpty!10904 (= mapRes!10904 (and tp!22928 e!159747))))

(declare-fun mapKey!10904 () (_ BitVec 32))

(declare-fun mapRest!10904 () (Array (_ BitVec 32) ValueCell!2867))

(declare-fun mapValue!10904 () ValueCell!2867)

(assert (=> mapNonEmpty!10904 (= mapRest!10903 (store mapRest!10904 mapKey!10904 mapValue!10904))))

(declare-fun b!246270 () Bool)

(assert (=> b!246270 (= e!159746 tp_is_empty!6421)))

(declare-fun b!246269 () Bool)

(assert (=> b!246269 (= e!159747 tp_is_empty!6421)))

(declare-fun mapIsEmpty!10904 () Bool)

(assert (=> mapIsEmpty!10904 mapRes!10904))

(assert (= (and mapNonEmpty!10903 condMapEmpty!10904) mapIsEmpty!10904))

(assert (= (and mapNonEmpty!10903 (not condMapEmpty!10904)) mapNonEmpty!10904))

(assert (= (and mapNonEmpty!10904 ((_ is ValueCellFull!2867) mapValue!10904)) b!246269))

(assert (= (and mapNonEmpty!10903 ((_ is ValueCellFull!2867) mapDefault!10904)) b!246270))

(declare-fun m!263877 () Bool)

(assert (=> mapNonEmpty!10904 m!263877))

(declare-fun b_lambda!8057 () Bool)

(assert (= b_lambda!8055 (or (and b!245709 b_free!6559) b_lambda!8057)))

(declare-fun b_lambda!8059 () Bool)

(assert (= b_lambda!8053 (or (and b!245709 b_free!6559) b_lambda!8059)))

(check-sat (not b!246135) (not b!246085) (not b!246148) (not d!60379) tp_is_empty!6421 (not d!60389) (not d!60393) (not mapNonEmpty!10904) (not b!246192) (not b_lambda!8057) (not b!246201) (not b!246236) (not d!60383) (not b!246204) (not d!60331) (not d!60397) (not b!246041) (not b!246261) (not bm!22991) (not b_lambda!8051) (not b!246075) (not d!60337) (not b!246177) (not b!246047) (not bm!22982) (not bm!22994) (not b!246092) (not b!246077) (not b!246195) (not d!60347) (not d!60419) (not b!246196) (not d!60339) (not b!246194) (not b!246138) (not bm!22980) (not b!246156) (not d!60369) (not d!60415) (not d!60409) (not d!60391) (not b!246045) (not bm!22985) (not b!246264) (not d!60407) (not d!60411) (not d!60351) (not b!246203) (not d!60401) (not d!60417) (not b!246133) (not d!60399) (not d!60413) (not bm!22984) (not b!246140) (not b!246184) (not b!246042) (not b!246262) (not b!246175) (not d!60429) (not bm!22983) (not d!60431) (not d!60363) (not b_next!6559) (not bm!22981) (not d!60367) (not b!246157) (not d!60395) (not b!246268) (not b!246144) (not b!246074) (not b!246139) (not b!246248) (not b_lambda!8059) (not bm!22977) (not d!60403) (not d!60405) (not d!60387) (not b!246251) (not b!246234) (not b!246205) (not d!60329) (not b!246079) (not b!246147) (not b!246202) (not b!246091) (not b!246078) b_and!13573 (not b!246206) (not d!60343) (not b!246083) (not b!246191) (not b!246043) (not b!246093) (not d!60427) (not d!60373) (not b!246116) (not b!246131) (not bm!22990) (not d!60421) (not b!246266) (not b!246247) (not b!246080) (not b!246149) (not d!60345) (not b!246134))
(check-sat b_and!13573 (not b_next!6559))
