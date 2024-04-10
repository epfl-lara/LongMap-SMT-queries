; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23566 () Bool)

(assert start!23566)

(declare-fun b!247499 () Bool)

(declare-fun b_free!6585 () Bool)

(declare-fun b_next!6585 () Bool)

(assert (=> b!247499 (= b_free!6585 (not b_next!6585))))

(declare-fun tp!23003 () Bool)

(declare-fun b_and!13587 () Bool)

(assert (=> b!247499 (= tp!23003 b_and!13587)))

(declare-fun b!247488 () Bool)

(declare-datatypes ((Unit!7647 0))(
  ( (Unit!7648) )
))
(declare-fun e!160548 () Unit!7647)

(declare-fun Unit!7649 () Unit!7647)

(assert (=> b!247488 (= e!160548 Unit!7649)))

(declare-fun lt!123959 () Unit!7647)

(declare-datatypes ((V!8243 0))(
  ( (V!8244 (val!3268 Int)) )
))
(declare-datatypes ((ValueCell!2880 0))(
  ( (ValueCellFull!2880 (v!5326 V!8243)) (EmptyCell!2880) )
))
(declare-datatypes ((array!12201 0))(
  ( (array!12202 (arr!5788 (Array (_ BitVec 32) ValueCell!2880)) (size!6131 (_ BitVec 32))) )
))
(declare-datatypes ((array!12203 0))(
  ( (array!12204 (arr!5789 (Array (_ BitVec 32) (_ BitVec 64))) (size!6132 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3660 0))(
  ( (LongMapFixedSize!3661 (defaultEntry!4579 Int) (mask!10717 (_ BitVec 32)) (extraKeys!4316 (_ BitVec 32)) (zeroValue!4420 V!8243) (minValue!4420 V!8243) (_size!1879 (_ BitVec 32)) (_keys!6701 array!12203) (_values!4562 array!12201) (_vacant!1879 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3660)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!185 (array!12203 array!12201 (_ BitVec 32) (_ BitVec 32) V!8243 V!8243 (_ BitVec 64) (_ BitVec 32) Int) Unit!7647)

(assert (=> b!247488 (= lt!123959 (lemmaArrayContainsKeyThenInListMap!185 (_keys!6701 thiss!1504) (_values!4562 thiss!1504) (mask!10717 thiss!1504) (extraKeys!4316 thiss!1504) (zeroValue!4420 thiss!1504) (minValue!4420 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4579 thiss!1504)))))

(assert (=> b!247488 false))

(declare-fun b!247489 () Bool)

(declare-fun e!160556 () Bool)

(declare-fun call!23177 () Bool)

(assert (=> b!247489 (= e!160556 (not call!23177))))

(declare-fun b!247490 () Bool)

(declare-fun e!160547 () Bool)

(declare-fun tp_is_empty!6447 () Bool)

(assert (=> b!247490 (= e!160547 tp_is_empty!6447)))

(declare-fun mapIsEmpty!10946 () Bool)

(declare-fun mapRes!10946 () Bool)

(assert (=> mapIsEmpty!10946 mapRes!10946))

(declare-fun b!247492 () Bool)

(declare-fun res!121315 () Bool)

(declare-fun e!160545 () Bool)

(assert (=> b!247492 (=> (not res!121315) (not e!160545))))

(assert (=> b!247492 (= res!121315 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247493 () Bool)

(declare-fun e!160550 () Bool)

(assert (=> b!247493 (= e!160550 (not call!23177))))

(declare-fun b!247494 () Bool)

(declare-fun e!160553 () Unit!7647)

(declare-fun Unit!7650 () Unit!7647)

(assert (=> b!247494 (= e!160553 Unit!7650)))

(declare-fun lt!123951 () Unit!7647)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!382 (array!12203 array!12201 (_ BitVec 32) (_ BitVec 32) V!8243 V!8243 (_ BitVec 64) Int) Unit!7647)

(assert (=> b!247494 (= lt!123951 (lemmaInListMapThenSeekEntryOrOpenFindsIt!382 (_keys!6701 thiss!1504) (_values!4562 thiss!1504) (mask!10717 thiss!1504) (extraKeys!4316 thiss!1504) (zeroValue!4420 thiss!1504) (minValue!4420 thiss!1504) key!932 (defaultEntry!4579 thiss!1504)))))

(assert (=> b!247494 false))

(declare-fun b!247495 () Bool)

(declare-fun lt!123952 () Unit!7647)

(assert (=> b!247495 (= e!160553 lt!123952)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!386 (array!12203 array!12201 (_ BitVec 32) (_ BitVec 32) V!8243 V!8243 (_ BitVec 64) Int) Unit!7647)

(assert (=> b!247495 (= lt!123952 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!386 (_keys!6701 thiss!1504) (_values!4562 thiss!1504) (mask!10717 thiss!1504) (extraKeys!4316 thiss!1504) (zeroValue!4420 thiss!1504) (minValue!4420 thiss!1504) key!932 (defaultEntry!4579 thiss!1504)))))

(declare-fun c!41435 () Bool)

(declare-datatypes ((SeekEntryResult!1101 0))(
  ( (MissingZero!1101 (index!6574 (_ BitVec 32))) (Found!1101 (index!6575 (_ BitVec 32))) (Intermediate!1101 (undefined!1913 Bool) (index!6576 (_ BitVec 32)) (x!24529 (_ BitVec 32))) (Undefined!1101) (MissingVacant!1101 (index!6577 (_ BitVec 32))) )
))
(declare-fun lt!123953 () SeekEntryResult!1101)

(get-info :version)

(assert (=> b!247495 (= c!41435 ((_ is MissingZero!1101) lt!123953))))

(declare-fun e!160551 () Bool)

(assert (=> b!247495 e!160551))

(declare-fun b!247496 () Bool)

(declare-fun e!160555 () Bool)

(declare-fun lt!123957 () Bool)

(assert (=> b!247496 (= e!160555 (not lt!123957))))

(declare-fun b!247497 () Bool)

(declare-fun res!121317 () Bool)

(assert (=> b!247497 (=> res!121317 e!160555)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247497 (= res!121317 (not (validKeyInArray!0 key!932)))))

(declare-fun b!247498 () Bool)

(declare-fun Unit!7651 () Unit!7647)

(assert (=> b!247498 (= e!160548 Unit!7651)))

(declare-fun e!160544 () Bool)

(declare-fun e!160546 () Bool)

(declare-fun array_inv!3823 (array!12203) Bool)

(declare-fun array_inv!3824 (array!12201) Bool)

(assert (=> b!247499 (= e!160546 (and tp!23003 tp_is_empty!6447 (array_inv!3823 (_keys!6701 thiss!1504)) (array_inv!3824 (_values!4562 thiss!1504)) e!160544))))

(declare-fun b!247500 () Bool)

(declare-fun e!160554 () Bool)

(assert (=> b!247500 (= e!160554 tp_is_empty!6447)))

(declare-fun b!247501 () Bool)

(declare-fun c!41437 () Bool)

(assert (=> b!247501 (= c!41437 ((_ is MissingVacant!1101) lt!123953))))

(declare-fun e!160543 () Bool)

(assert (=> b!247501 (= e!160551 e!160543)))

(declare-fun b!247502 () Bool)

(declare-fun e!160549 () Bool)

(assert (=> b!247502 (= e!160545 e!160549)))

(declare-fun res!121313 () Bool)

(assert (=> b!247502 (=> (not res!121313) (not e!160549))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!247502 (= res!121313 (or (= lt!123953 (MissingZero!1101 index!297)) (= lt!123953 (MissingVacant!1101 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12203 (_ BitVec 32)) SeekEntryResult!1101)

(assert (=> b!247502 (= lt!123953 (seekEntryOrOpen!0 key!932 (_keys!6701 thiss!1504) (mask!10717 thiss!1504)))))

(declare-fun b!247503 () Bool)

(assert (=> b!247503 (= e!160543 ((_ is Undefined!1101) lt!123953))))

(declare-fun call!23176 () Bool)

(declare-fun bm!23173 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23173 (= call!23176 (inRange!0 (ite c!41435 (index!6574 lt!123953) (index!6577 lt!123953)) (mask!10717 thiss!1504)))))

(declare-fun b!247504 () Bool)

(declare-fun e!160557 () Bool)

(assert (=> b!247504 (= e!160549 e!160557)))

(declare-fun res!121311 () Bool)

(assert (=> b!247504 (=> (not res!121311) (not e!160557))))

(assert (=> b!247504 (= res!121311 (inRange!0 index!297 (mask!10717 thiss!1504)))))

(declare-fun lt!123955 () Unit!7647)

(assert (=> b!247504 (= lt!123955 e!160553)))

(declare-fun c!41438 () Bool)

(declare-datatypes ((tuple2!4810 0))(
  ( (tuple2!4811 (_1!2416 (_ BitVec 64)) (_2!2416 V!8243)) )
))
(declare-datatypes ((List!3691 0))(
  ( (Nil!3688) (Cons!3687 (h!4345 tuple2!4810) (t!8714 List!3691)) )
))
(declare-datatypes ((ListLongMap!3723 0))(
  ( (ListLongMap!3724 (toList!1877 List!3691)) )
))
(declare-fun contains!1791 (ListLongMap!3723 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1405 (array!12203 array!12201 (_ BitVec 32) (_ BitVec 32) V!8243 V!8243 (_ BitVec 32) Int) ListLongMap!3723)

(assert (=> b!247504 (= c!41438 (contains!1791 (getCurrentListMap!1405 (_keys!6701 thiss!1504) (_values!4562 thiss!1504) (mask!10717 thiss!1504) (extraKeys!4316 thiss!1504) (zeroValue!4420 thiss!1504) (minValue!4420 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4579 thiss!1504)) key!932))))

(declare-fun b!247505 () Bool)

(assert (=> b!247505 (= e!160544 (and e!160554 mapRes!10946))))

(declare-fun condMapEmpty!10946 () Bool)

(declare-fun mapDefault!10946 () ValueCell!2880)

(assert (=> b!247505 (= condMapEmpty!10946 (= (arr!5788 (_values!4562 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2880)) mapDefault!10946)))))

(declare-fun b!247506 () Bool)

(declare-fun res!121308 () Bool)

(assert (=> b!247506 (=> res!121308 e!160555)))

(assert (=> b!247506 (= res!121308 (or (not (= (size!6132 (_keys!6701 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10717 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6132 (_keys!6701 thiss!1504)))))))

(declare-fun b!247507 () Bool)

(declare-fun res!121316 () Bool)

(assert (=> b!247507 (= res!121316 (= (select (arr!5789 (_keys!6701 thiss!1504)) (index!6577 lt!123953)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!247507 (=> (not res!121316) (not e!160550))))

(declare-fun res!121314 () Bool)

(assert (=> start!23566 (=> (not res!121314) (not e!160545))))

(declare-fun valid!1431 (LongMapFixedSize!3660) Bool)

(assert (=> start!23566 (= res!121314 (valid!1431 thiss!1504))))

(assert (=> start!23566 e!160545))

(assert (=> start!23566 e!160546))

(assert (=> start!23566 true))

(declare-fun b!247491 () Bool)

(declare-fun res!121312 () Bool)

(assert (=> b!247491 (=> (not res!121312) (not e!160556))))

(assert (=> b!247491 (= res!121312 (= (select (arr!5789 (_keys!6701 thiss!1504)) (index!6574 lt!123953)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10946 () Bool)

(declare-fun tp!23002 () Bool)

(assert (=> mapNonEmpty!10946 (= mapRes!10946 (and tp!23002 e!160547))))

(declare-fun mapRest!10946 () (Array (_ BitVec 32) ValueCell!2880))

(declare-fun mapKey!10946 () (_ BitVec 32))

(declare-fun mapValue!10946 () ValueCell!2880)

(assert (=> mapNonEmpty!10946 (= (arr!5788 (_values!4562 thiss!1504)) (store mapRest!10946 mapKey!10946 mapValue!10946))))

(declare-fun b!247508 () Bool)

(assert (=> b!247508 (= e!160543 e!160550)))

(declare-fun res!121309 () Bool)

(assert (=> b!247508 (= res!121309 call!23176)))

(assert (=> b!247508 (=> (not res!121309) (not e!160550))))

(declare-fun bm!23174 () Bool)

(declare-fun arrayContainsKey!0 (array!12203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23174 (= call!23177 (arrayContainsKey!0 (_keys!6701 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247509 () Bool)

(assert (=> b!247509 (= e!160557 (not e!160555))))

(declare-fun res!121310 () Bool)

(assert (=> b!247509 (=> res!121310 e!160555)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247509 (= res!121310 (not (validMask!0 (mask!10717 thiss!1504))))))

(declare-fun lt!123958 () array!12203)

(declare-fun arrayCountValidKeys!0 (array!12203 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247509 (= (arrayCountValidKeys!0 lt!123958 #b00000000000000000000000000000000 (size!6132 (_keys!6701 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6701 thiss!1504) #b00000000000000000000000000000000 (size!6132 (_keys!6701 thiss!1504)))))))

(declare-fun lt!123960 () Unit!7647)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12203 (_ BitVec 32) (_ BitVec 64)) Unit!7647)

(assert (=> b!247509 (= lt!123960 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6701 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3692 0))(
  ( (Nil!3689) (Cons!3688 (h!4346 (_ BitVec 64)) (t!8715 List!3692)) )
))
(declare-fun arrayNoDuplicates!0 (array!12203 (_ BitVec 32) List!3692) Bool)

(assert (=> b!247509 (arrayNoDuplicates!0 lt!123958 #b00000000000000000000000000000000 Nil!3689)))

(assert (=> b!247509 (= lt!123958 (array!12204 (store (arr!5789 (_keys!6701 thiss!1504)) index!297 key!932) (size!6132 (_keys!6701 thiss!1504))))))

(declare-fun lt!123956 () Unit!7647)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3692) Unit!7647)

(assert (=> b!247509 (= lt!123956 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6701 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3689))))

(declare-fun lt!123954 () Unit!7647)

(assert (=> b!247509 (= lt!123954 e!160548)))

(declare-fun c!41436 () Bool)

(assert (=> b!247509 (= c!41436 lt!123957)))

(assert (=> b!247509 (= lt!123957 (arrayContainsKey!0 (_keys!6701 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247510 () Bool)

(declare-fun res!121318 () Bool)

(assert (=> b!247510 (=> (not res!121318) (not e!160556))))

(assert (=> b!247510 (= res!121318 call!23176)))

(assert (=> b!247510 (= e!160551 e!160556)))

(assert (= (and start!23566 res!121314) b!247492))

(assert (= (and b!247492 res!121315) b!247502))

(assert (= (and b!247502 res!121313) b!247504))

(assert (= (and b!247504 c!41438) b!247494))

(assert (= (and b!247504 (not c!41438)) b!247495))

(assert (= (and b!247495 c!41435) b!247510))

(assert (= (and b!247495 (not c!41435)) b!247501))

(assert (= (and b!247510 res!121318) b!247491))

(assert (= (and b!247491 res!121312) b!247489))

(assert (= (and b!247501 c!41437) b!247508))

(assert (= (and b!247501 (not c!41437)) b!247503))

(assert (= (and b!247508 res!121309) b!247507))

(assert (= (and b!247507 res!121316) b!247493))

(assert (= (or b!247510 b!247508) bm!23173))

(assert (= (or b!247489 b!247493) bm!23174))

(assert (= (and b!247504 res!121311) b!247509))

(assert (= (and b!247509 c!41436) b!247488))

(assert (= (and b!247509 (not c!41436)) b!247498))

(assert (= (and b!247509 (not res!121310)) b!247506))

(assert (= (and b!247506 (not res!121308)) b!247497))

(assert (= (and b!247497 (not res!121317)) b!247496))

(assert (= (and b!247505 condMapEmpty!10946) mapIsEmpty!10946))

(assert (= (and b!247505 (not condMapEmpty!10946)) mapNonEmpty!10946))

(assert (= (and mapNonEmpty!10946 ((_ is ValueCellFull!2880) mapValue!10946)) b!247490))

(assert (= (and b!247505 ((_ is ValueCellFull!2880) mapDefault!10946)) b!247500))

(assert (= b!247499 b!247505))

(assert (= start!23566 b!247499))

(declare-fun m!264539 () Bool)

(assert (=> b!247507 m!264539))

(declare-fun m!264541 () Bool)

(assert (=> mapNonEmpty!10946 m!264541))

(declare-fun m!264543 () Bool)

(assert (=> bm!23174 m!264543))

(declare-fun m!264545 () Bool)

(assert (=> bm!23173 m!264545))

(declare-fun m!264547 () Bool)

(assert (=> b!247499 m!264547))

(declare-fun m!264549 () Bool)

(assert (=> b!247499 m!264549))

(declare-fun m!264551 () Bool)

(assert (=> b!247497 m!264551))

(declare-fun m!264553 () Bool)

(assert (=> b!247494 m!264553))

(declare-fun m!264555 () Bool)

(assert (=> b!247509 m!264555))

(assert (=> b!247509 m!264543))

(declare-fun m!264557 () Bool)

(assert (=> b!247509 m!264557))

(declare-fun m!264559 () Bool)

(assert (=> b!247509 m!264559))

(declare-fun m!264561 () Bool)

(assert (=> b!247509 m!264561))

(declare-fun m!264563 () Bool)

(assert (=> b!247509 m!264563))

(declare-fun m!264565 () Bool)

(assert (=> b!247509 m!264565))

(declare-fun m!264567 () Bool)

(assert (=> b!247509 m!264567))

(declare-fun m!264569 () Bool)

(assert (=> b!247495 m!264569))

(declare-fun m!264571 () Bool)

(assert (=> b!247488 m!264571))

(declare-fun m!264573 () Bool)

(assert (=> start!23566 m!264573))

(declare-fun m!264575 () Bool)

(assert (=> b!247504 m!264575))

(declare-fun m!264577 () Bool)

(assert (=> b!247504 m!264577))

(assert (=> b!247504 m!264577))

(declare-fun m!264579 () Bool)

(assert (=> b!247504 m!264579))

(declare-fun m!264581 () Bool)

(assert (=> b!247491 m!264581))

(declare-fun m!264583 () Bool)

(assert (=> b!247502 m!264583))

(check-sat (not b!247494) tp_is_empty!6447 (not b!247504) (not b!247499) (not b!247497) (not mapNonEmpty!10946) (not start!23566) (not bm!23173) (not b!247502) (not b!247495) (not b!247488) (not bm!23174) (not b!247509) (not b_next!6585) b_and!13587)
(check-sat b_and!13587 (not b_next!6585))
