; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22940 () Bool)

(assert start!22940)

(declare-fun b!239675 () Bool)

(declare-fun b_free!6443 () Bool)

(declare-fun b_next!6443 () Bool)

(assert (=> b!239675 (= b_free!6443 (not b_next!6443))))

(declare-fun tp!22532 () Bool)

(declare-fun b_and!13409 () Bool)

(assert (=> b!239675 (= tp!22532 b_and!13409)))

(declare-fun b!239660 () Bool)

(declare-fun res!117459 () Bool)

(declare-fun e!155608 () Bool)

(assert (=> b!239660 (=> (not res!117459) (not e!155608))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!239660 (= res!117459 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239661 () Bool)

(declare-datatypes ((Unit!7362 0))(
  ( (Unit!7363) )
))
(declare-fun e!155613 () Unit!7362)

(declare-fun Unit!7364 () Unit!7362)

(assert (=> b!239661 (= e!155613 Unit!7364)))

(declare-fun lt!120837 () Unit!7362)

(declare-datatypes ((V!8053 0))(
  ( (V!8054 (val!3197 Int)) )
))
(declare-datatypes ((ValueCell!2809 0))(
  ( (ValueCellFull!2809 (v!5235 V!8053)) (EmptyCell!2809) )
))
(declare-datatypes ((array!11889 0))(
  ( (array!11890 (arr!5646 (Array (_ BitVec 32) ValueCell!2809)) (size!5987 (_ BitVec 32))) )
))
(declare-datatypes ((array!11891 0))(
  ( (array!11892 (arr!5647 (Array (_ BitVec 32) (_ BitVec 64))) (size!5988 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3518 0))(
  ( (LongMapFixedSize!3519 (defaultEntry!4444 Int) (mask!10492 (_ BitVec 32)) (extraKeys!4181 (_ BitVec 32)) (zeroValue!4285 V!8053) (minValue!4285 V!8053) (_size!1808 (_ BitVec 32)) (_keys!6546 array!11891) (_values!4427 array!11889) (_vacant!1808 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3518)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!330 (array!11891 array!11889 (_ BitVec 32) (_ BitVec 32) V!8053 V!8053 (_ BitVec 64) Int) Unit!7362)

(assert (=> b!239661 (= lt!120837 (lemmaInListMapThenSeekEntryOrOpenFindsIt!330 (_keys!6546 thiss!1504) (_values!4427 thiss!1504) (mask!10492 thiss!1504) (extraKeys!4181 thiss!1504) (zeroValue!4285 thiss!1504) (minValue!4285 thiss!1504) key!932 (defaultEntry!4444 thiss!1504)))))

(assert (=> b!239661 false))

(declare-fun b!239662 () Bool)

(declare-fun e!155615 () Bool)

(assert (=> b!239662 (= e!155608 e!155615)))

(declare-fun res!117460 () Bool)

(assert (=> b!239662 (=> (not res!117460) (not e!155615))))

(declare-datatypes ((SeekEntryResult!1035 0))(
  ( (MissingZero!1035 (index!6310 (_ BitVec 32))) (Found!1035 (index!6311 (_ BitVec 32))) (Intermediate!1035 (undefined!1847 Bool) (index!6312 (_ BitVec 32)) (x!24115 (_ BitVec 32))) (Undefined!1035) (MissingVacant!1035 (index!6313 (_ BitVec 32))) )
))
(declare-fun lt!120835 () SeekEntryResult!1035)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239662 (= res!117460 (or (= lt!120835 (MissingZero!1035 index!297)) (= lt!120835 (MissingVacant!1035 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11891 (_ BitVec 32)) SeekEntryResult!1035)

(assert (=> b!239662 (= lt!120835 (seekEntryOrOpen!0 key!932 (_keys!6546 thiss!1504) (mask!10492 thiss!1504)))))

(declare-fun b!239663 () Bool)

(declare-fun res!117466 () Bool)

(declare-fun e!155616 () Bool)

(assert (=> b!239663 (=> (not res!117466) (not e!155616))))

(declare-fun arrayContainsKey!0 (array!11891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239663 (= res!117466 (arrayContainsKey!0 (_keys!6546 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!117463 () Bool)

(assert (=> start!22940 (=> (not res!117463) (not e!155608))))

(declare-fun valid!1387 (LongMapFixedSize!3518) Bool)

(assert (=> start!22940 (= res!117463 (valid!1387 thiss!1504))))

(assert (=> start!22940 e!155608))

(declare-fun e!155609 () Bool)

(assert (=> start!22940 e!155609))

(assert (=> start!22940 true))

(declare-fun b!239664 () Bool)

(declare-fun e!155612 () Bool)

(declare-fun call!22289 () Bool)

(assert (=> b!239664 (= e!155612 (not call!22289))))

(declare-fun b!239665 () Bool)

(declare-fun e!155611 () Bool)

(assert (=> b!239665 (= e!155611 (not call!22289))))

(declare-fun mapNonEmpty!10689 () Bool)

(declare-fun mapRes!10689 () Bool)

(declare-fun tp!22533 () Bool)

(declare-fun e!155604 () Bool)

(assert (=> mapNonEmpty!10689 (= mapRes!10689 (and tp!22533 e!155604))))

(declare-fun mapRest!10689 () (Array (_ BitVec 32) ValueCell!2809))

(declare-fun mapKey!10689 () (_ BitVec 32))

(declare-fun mapValue!10689 () ValueCell!2809)

(assert (=> mapNonEmpty!10689 (= (arr!5646 (_values!4427 thiss!1504)) (store mapRest!10689 mapKey!10689 mapValue!10689))))

(declare-fun b!239666 () Bool)

(declare-fun res!117462 () Bool)

(assert (=> b!239666 (=> (not res!117462) (not e!155616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239666 (= res!117462 (validMask!0 (mask!10492 thiss!1504)))))

(declare-fun b!239667 () Bool)

(assert (=> b!239667 (= e!155616 (and (= (size!5987 (_values!4427 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10492 thiss!1504))) (= (size!5988 (_keys!6546 thiss!1504)) (size!5987 (_values!4427 thiss!1504))) (bvsge (mask!10492 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4181 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4181 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!239668 () Bool)

(declare-fun e!155605 () Bool)

(declare-fun tp_is_empty!6305 () Bool)

(assert (=> b!239668 (= e!155605 tp_is_empty!6305)))

(declare-fun b!239669 () Bool)

(declare-fun e!155607 () Bool)

(assert (=> b!239669 (= e!155607 e!155611)))

(declare-fun res!117461 () Bool)

(declare-fun call!22290 () Bool)

(assert (=> b!239669 (= res!117461 call!22290)))

(assert (=> b!239669 (=> (not res!117461) (not e!155611))))

(declare-fun b!239670 () Bool)

(assert (=> b!239670 (= e!155615 e!155616)))

(declare-fun res!117464 () Bool)

(assert (=> b!239670 (=> (not res!117464) (not e!155616))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239670 (= res!117464 (inRange!0 index!297 (mask!10492 thiss!1504)))))

(declare-fun lt!120836 () Unit!7362)

(assert (=> b!239670 (= lt!120836 e!155613)))

(declare-fun c!39946 () Bool)

(declare-datatypes ((tuple2!4710 0))(
  ( (tuple2!4711 (_1!2366 (_ BitVec 64)) (_2!2366 V!8053)) )
))
(declare-datatypes ((List!3597 0))(
  ( (Nil!3594) (Cons!3593 (h!4249 tuple2!4710) (t!8592 List!3597)) )
))
(declare-datatypes ((ListLongMap!3623 0))(
  ( (ListLongMap!3624 (toList!1827 List!3597)) )
))
(declare-fun contains!1715 (ListLongMap!3623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1355 (array!11891 array!11889 (_ BitVec 32) (_ BitVec 32) V!8053 V!8053 (_ BitVec 32) Int) ListLongMap!3623)

(assert (=> b!239670 (= c!39946 (contains!1715 (getCurrentListMap!1355 (_keys!6546 thiss!1504) (_values!4427 thiss!1504) (mask!10492 thiss!1504) (extraKeys!4181 thiss!1504) (zeroValue!4285 thiss!1504) (minValue!4285 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4444 thiss!1504)) key!932))))

(declare-fun b!239671 () Bool)

(declare-fun res!117458 () Bool)

(assert (=> b!239671 (=> (not res!117458) (not e!155612))))

(assert (=> b!239671 (= res!117458 (= (select (arr!5647 (_keys!6546 thiss!1504)) (index!6310 lt!120835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!39947 () Bool)

(declare-fun bm!22286 () Bool)

(assert (=> bm!22286 (= call!22290 (inRange!0 (ite c!39947 (index!6310 lt!120835) (index!6313 lt!120835)) (mask!10492 thiss!1504)))))

(declare-fun b!239672 () Bool)

(declare-fun res!117467 () Bool)

(assert (=> b!239672 (= res!117467 (= (select (arr!5647 (_keys!6546 thiss!1504)) (index!6313 lt!120835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239672 (=> (not res!117467) (not e!155611))))

(declare-fun b!239673 () Bool)

(assert (=> b!239673 (= e!155604 tp_is_empty!6305)))

(declare-fun mapIsEmpty!10689 () Bool)

(assert (=> mapIsEmpty!10689 mapRes!10689))

(declare-fun b!239674 () Bool)

(declare-fun res!117465 () Bool)

(assert (=> b!239674 (=> (not res!117465) (not e!155612))))

(assert (=> b!239674 (= res!117465 call!22290)))

(declare-fun e!155606 () Bool)

(assert (=> b!239674 (= e!155606 e!155612)))

(declare-fun e!155614 () Bool)

(declare-fun array_inv!3735 (array!11891) Bool)

(declare-fun array_inv!3736 (array!11889) Bool)

(assert (=> b!239675 (= e!155609 (and tp!22532 tp_is_empty!6305 (array_inv!3735 (_keys!6546 thiss!1504)) (array_inv!3736 (_values!4427 thiss!1504)) e!155614))))

(declare-fun b!239676 () Bool)

(declare-fun lt!120834 () Unit!7362)

(assert (=> b!239676 (= e!155613 lt!120834)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!346 (array!11891 array!11889 (_ BitVec 32) (_ BitVec 32) V!8053 V!8053 (_ BitVec 64) Int) Unit!7362)

(assert (=> b!239676 (= lt!120834 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!346 (_keys!6546 thiss!1504) (_values!4427 thiss!1504) (mask!10492 thiss!1504) (extraKeys!4181 thiss!1504) (zeroValue!4285 thiss!1504) (minValue!4285 thiss!1504) key!932 (defaultEntry!4444 thiss!1504)))))

(assert (=> b!239676 (= c!39947 (is-MissingZero!1035 lt!120835))))

(assert (=> b!239676 e!155606))

(declare-fun bm!22287 () Bool)

(assert (=> bm!22287 (= call!22289 (arrayContainsKey!0 (_keys!6546 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239677 () Bool)

(declare-fun c!39945 () Bool)

(assert (=> b!239677 (= c!39945 (is-MissingVacant!1035 lt!120835))))

(assert (=> b!239677 (= e!155606 e!155607)))

(declare-fun b!239678 () Bool)

(assert (=> b!239678 (= e!155607 (is-Undefined!1035 lt!120835))))

(declare-fun b!239679 () Bool)

(assert (=> b!239679 (= e!155614 (and e!155605 mapRes!10689))))

(declare-fun condMapEmpty!10689 () Bool)

(declare-fun mapDefault!10689 () ValueCell!2809)

