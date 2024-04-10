; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24282 () Bool)

(assert start!24282)

(declare-fun b!254303 () Bool)

(declare-fun b_free!6683 () Bool)

(declare-fun b_next!6683 () Bool)

(assert (=> b!254303 (= b_free!6683 (not b_next!6683))))

(declare-fun tp!23337 () Bool)

(declare-fun b_and!13725 () Bool)

(assert (=> b!254303 (= tp!23337 b_and!13725)))

(declare-fun mapNonEmpty!11133 () Bool)

(declare-fun mapRes!11133 () Bool)

(declare-fun tp!23336 () Bool)

(declare-fun e!164841 () Bool)

(assert (=> mapNonEmpty!11133 (= mapRes!11133 (and tp!23336 e!164841))))

(declare-datatypes ((V!8373 0))(
  ( (V!8374 (val!3317 Int)) )
))
(declare-datatypes ((ValueCell!2929 0))(
  ( (ValueCellFull!2929 (v!5391 V!8373)) (EmptyCell!2929) )
))
(declare-fun mapValue!11133 () ValueCell!2929)

(declare-fun mapRest!11133 () (Array (_ BitVec 32) ValueCell!2929))

(declare-fun mapKey!11133 () (_ BitVec 32))

(declare-datatypes ((array!12421 0))(
  ( (array!12422 (arr!5886 (Array (_ BitVec 32) ValueCell!2929)) (size!6233 (_ BitVec 32))) )
))
(declare-datatypes ((array!12423 0))(
  ( (array!12424 (arr!5887 (Array (_ BitVec 32) (_ BitVec 64))) (size!6234 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3758 0))(
  ( (LongMapFixedSize!3759 (defaultEntry!4692 Int) (mask!10936 (_ BitVec 32)) (extraKeys!4429 (_ BitVec 32)) (zeroValue!4533 V!8373) (minValue!4533 V!8373) (_size!1928 (_ BitVec 32)) (_keys!6846 array!12423) (_values!4675 array!12421) (_vacant!1928 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3758)

(assert (=> mapNonEmpty!11133 (= (arr!5886 (_values!4675 thiss!1504)) (store mapRest!11133 mapKey!11133 mapValue!11133))))

(declare-fun b!254294 () Bool)

(declare-fun e!164835 () Bool)

(declare-fun tp_is_empty!6545 () Bool)

(assert (=> b!254294 (= e!164835 tp_is_empty!6545)))

(declare-fun res!124498 () Bool)

(declare-fun e!164840 () Bool)

(assert (=> start!24282 (=> (not res!124498) (not e!164840))))

(declare-fun valid!1470 (LongMapFixedSize!3758) Bool)

(assert (=> start!24282 (= res!124498 (valid!1470 thiss!1504))))

(assert (=> start!24282 e!164840))

(declare-fun e!164833 () Bool)

(assert (=> start!24282 e!164833))

(assert (=> start!24282 true))

(declare-fun b!254295 () Bool)

(declare-fun e!164838 () Bool)

(declare-fun call!23995 () Bool)

(assert (=> b!254295 (= e!164838 (not call!23995))))

(declare-fun b!254296 () Bool)

(declare-fun e!164828 () Bool)

(declare-fun e!164832 () Bool)

(assert (=> b!254296 (= e!164828 e!164832)))

(declare-fun res!124495 () Bool)

(assert (=> b!254296 (=> (not res!124495) (not e!164832))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254296 (= res!124495 (inRange!0 index!297 (mask!10936 thiss!1504)))))

(declare-datatypes ((Unit!7878 0))(
  ( (Unit!7879) )
))
(declare-fun lt!127429 () Unit!7878)

(declare-fun e!164839 () Unit!7878)

(assert (=> b!254296 (= lt!127429 e!164839)))

(declare-fun c!42887 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4884 0))(
  ( (tuple2!4885 (_1!2453 (_ BitVec 64)) (_2!2453 V!8373)) )
))
(declare-datatypes ((List!3765 0))(
  ( (Nil!3762) (Cons!3761 (h!4423 tuple2!4884) (t!8812 List!3765)) )
))
(declare-datatypes ((ListLongMap!3797 0))(
  ( (ListLongMap!3798 (toList!1914 List!3765)) )
))
(declare-fun contains!1844 (ListLongMap!3797 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1442 (array!12423 array!12421 (_ BitVec 32) (_ BitVec 32) V!8373 V!8373 (_ BitVec 32) Int) ListLongMap!3797)

(assert (=> b!254296 (= c!42887 (contains!1844 (getCurrentListMap!1442 (_keys!6846 thiss!1504) (_values!4675 thiss!1504) (mask!10936 thiss!1504) (extraKeys!4429 thiss!1504) (zeroValue!4533 thiss!1504) (minValue!4533 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4692 thiss!1504)) key!932))))

(declare-fun b!254297 () Bool)

(declare-fun e!164830 () Bool)

(assert (=> b!254297 (= e!164830 (not call!23995))))

(declare-fun b!254298 () Bool)

(declare-fun Unit!7880 () Unit!7878)

(assert (=> b!254298 (= e!164839 Unit!7880)))

(declare-fun lt!127425 () Unit!7878)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!416 (array!12423 array!12421 (_ BitVec 32) (_ BitVec 32) V!8373 V!8373 (_ BitVec 64) Int) Unit!7878)

(assert (=> b!254298 (= lt!127425 (lemmaInListMapThenSeekEntryOrOpenFindsIt!416 (_keys!6846 thiss!1504) (_values!4675 thiss!1504) (mask!10936 thiss!1504) (extraKeys!4429 thiss!1504) (zeroValue!4533 thiss!1504) (minValue!4533 thiss!1504) key!932 (defaultEntry!4692 thiss!1504)))))

(assert (=> b!254298 false))

(declare-fun b!254299 () Bool)

(declare-fun res!124493 () Bool)

(declare-fun e!164842 () Bool)

(assert (=> b!254299 (=> res!124493 e!164842)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12423 (_ BitVec 32)) Bool)

(assert (=> b!254299 (= res!124493 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6846 thiss!1504) (mask!10936 thiss!1504))))))

(declare-fun b!254300 () Bool)

(declare-fun res!124496 () Bool)

(assert (=> b!254300 (=> (not res!124496) (not e!164838))))

(declare-fun call!23994 () Bool)

(assert (=> b!254300 (= res!124496 call!23994)))

(declare-fun e!164837 () Bool)

(assert (=> b!254300 (= e!164837 e!164838)))

(declare-fun b!254301 () Bool)

(declare-fun res!124490 () Bool)

(assert (=> b!254301 (=> (not res!124490) (not e!164838))))

(declare-datatypes ((SeekEntryResult!1148 0))(
  ( (MissingZero!1148 (index!6762 (_ BitVec 32))) (Found!1148 (index!6763 (_ BitVec 32))) (Intermediate!1148 (undefined!1960 Bool) (index!6764 (_ BitVec 32)) (x!24856 (_ BitVec 32))) (Undefined!1148) (MissingVacant!1148 (index!6765 (_ BitVec 32))) )
))
(declare-fun lt!127432 () SeekEntryResult!1148)

(assert (=> b!254301 (= res!124490 (= (select (arr!5887 (_keys!6846 thiss!1504)) (index!6762 lt!127432)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254302 () Bool)

(declare-fun res!124494 () Bool)

(assert (=> b!254302 (= res!124494 (= (select (arr!5887 (_keys!6846 thiss!1504)) (index!6765 lt!127432)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254302 (=> (not res!124494) (not e!164830))))

(declare-fun e!164829 () Bool)

(declare-fun array_inv!3893 (array!12423) Bool)

(declare-fun array_inv!3894 (array!12421) Bool)

(assert (=> b!254303 (= e!164833 (and tp!23337 tp_is_empty!6545 (array_inv!3893 (_keys!6846 thiss!1504)) (array_inv!3894 (_values!4675 thiss!1504)) e!164829))))

(declare-fun b!254304 () Bool)

(declare-fun e!164834 () Bool)

(assert (=> b!254304 (= e!164834 e!164830)))

(declare-fun res!124491 () Bool)

(assert (=> b!254304 (= res!124491 call!23994)))

(assert (=> b!254304 (=> (not res!124491) (not e!164830))))

(declare-fun b!254305 () Bool)

(declare-fun e!164831 () Unit!7878)

(declare-fun Unit!7881 () Unit!7878)

(assert (=> b!254305 (= e!164831 Unit!7881)))

(declare-fun b!254306 () Bool)

(assert (=> b!254306 (= e!164832 (not e!164842))))

(declare-fun res!124497 () Bool)

(assert (=> b!254306 (=> res!124497 e!164842)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254306 (= res!124497 (not (validMask!0 (mask!10936 thiss!1504))))))

(declare-fun lt!127428 () array!12423)

(assert (=> b!254306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127428 (mask!10936 thiss!1504))))

(declare-fun lt!127426 () Unit!7878)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12423 (_ BitVec 32) (_ BitVec 32)) Unit!7878)

(assert (=> b!254306 (= lt!127426 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6846 thiss!1504) index!297 (mask!10936 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12423 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254306 (= (arrayCountValidKeys!0 lt!127428 #b00000000000000000000000000000000 (size!6234 (_keys!6846 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6846 thiss!1504) #b00000000000000000000000000000000 (size!6234 (_keys!6846 thiss!1504)))))))

(declare-fun lt!127433 () Unit!7878)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12423 (_ BitVec 32) (_ BitVec 64)) Unit!7878)

(assert (=> b!254306 (= lt!127433 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6846 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3766 0))(
  ( (Nil!3763) (Cons!3762 (h!4424 (_ BitVec 64)) (t!8813 List!3766)) )
))
(declare-fun arrayNoDuplicates!0 (array!12423 (_ BitVec 32) List!3766) Bool)

(assert (=> b!254306 (arrayNoDuplicates!0 lt!127428 #b00000000000000000000000000000000 Nil!3763)))

(assert (=> b!254306 (= lt!127428 (array!12424 (store (arr!5887 (_keys!6846 thiss!1504)) index!297 key!932) (size!6234 (_keys!6846 thiss!1504))))))

(declare-fun lt!127423 () Unit!7878)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12423 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3766) Unit!7878)

(assert (=> b!254306 (= lt!127423 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6846 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3763))))

(declare-fun lt!127431 () Unit!7878)

(assert (=> b!254306 (= lt!127431 e!164831)))

(declare-fun c!42888 () Bool)

(declare-fun arrayContainsKey!0 (array!12423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254306 (= c!42888 (arrayContainsKey!0 (_keys!6846 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254307 () Bool)

(assert (=> b!254307 (= e!164834 (is-Undefined!1148 lt!127432))))

(declare-fun b!254308 () Bool)

(assert (=> b!254308 (= e!164840 e!164828)))

(declare-fun res!124500 () Bool)

(assert (=> b!254308 (=> (not res!124500) (not e!164828))))

(assert (=> b!254308 (= res!124500 (or (= lt!127432 (MissingZero!1148 index!297)) (= lt!127432 (MissingVacant!1148 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12423 (_ BitVec 32)) SeekEntryResult!1148)

(assert (=> b!254308 (= lt!127432 (seekEntryOrOpen!0 key!932 (_keys!6846 thiss!1504) (mask!10936 thiss!1504)))))

(declare-fun b!254309 () Bool)

(declare-fun Unit!7882 () Unit!7878)

(assert (=> b!254309 (= e!164831 Unit!7882)))

(declare-fun lt!127430 () Unit!7878)

(declare-fun lemmaArrayContainsKeyThenInListMap!222 (array!12423 array!12421 (_ BitVec 32) (_ BitVec 32) V!8373 V!8373 (_ BitVec 64) (_ BitVec 32) Int) Unit!7878)

(assert (=> b!254309 (= lt!127430 (lemmaArrayContainsKeyThenInListMap!222 (_keys!6846 thiss!1504) (_values!4675 thiss!1504) (mask!10936 thiss!1504) (extraKeys!4429 thiss!1504) (zeroValue!4533 thiss!1504) (minValue!4533 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4692 thiss!1504)))))

(assert (=> b!254309 false))

(declare-fun b!254310 () Bool)

(declare-fun res!124499 () Bool)

(assert (=> b!254310 (=> res!124499 e!164842)))

(assert (=> b!254310 (= res!124499 (or (not (= (size!6233 (_values!4675 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10936 thiss!1504)))) (not (= (size!6234 (_keys!6846 thiss!1504)) (size!6233 (_values!4675 thiss!1504)))) (bvslt (mask!10936 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4429 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4429 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!254311 () Bool)

(assert (=> b!254311 (= e!164842 true)))

(declare-fun lt!127427 () Bool)

(assert (=> b!254311 (= lt!127427 (arrayNoDuplicates!0 (_keys!6846 thiss!1504) #b00000000000000000000000000000000 Nil!3763))))

(declare-fun b!254312 () Bool)

(declare-fun res!124492 () Bool)

(assert (=> b!254312 (=> (not res!124492) (not e!164840))))

(assert (=> b!254312 (= res!124492 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254313 () Bool)

(assert (=> b!254313 (= e!164841 tp_is_empty!6545)))

(declare-fun mapIsEmpty!11133 () Bool)

(assert (=> mapIsEmpty!11133 mapRes!11133))

(declare-fun b!254314 () Bool)

(declare-fun lt!127424 () Unit!7878)

(assert (=> b!254314 (= e!164839 lt!127424)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!419 (array!12423 array!12421 (_ BitVec 32) (_ BitVec 32) V!8373 V!8373 (_ BitVec 64) Int) Unit!7878)

(assert (=> b!254314 (= lt!127424 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!419 (_keys!6846 thiss!1504) (_values!4675 thiss!1504) (mask!10936 thiss!1504) (extraKeys!4429 thiss!1504) (zeroValue!4533 thiss!1504) (minValue!4533 thiss!1504) key!932 (defaultEntry!4692 thiss!1504)))))

(declare-fun c!42890 () Bool)

(assert (=> b!254314 (= c!42890 (is-MissingZero!1148 lt!127432))))

(assert (=> b!254314 e!164837))

(declare-fun b!254315 () Bool)

(declare-fun c!42889 () Bool)

(assert (=> b!254315 (= c!42889 (is-MissingVacant!1148 lt!127432))))

(assert (=> b!254315 (= e!164837 e!164834)))

(declare-fun bm!23991 () Bool)

(assert (=> bm!23991 (= call!23995 (arrayContainsKey!0 (_keys!6846 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254316 () Bool)

(assert (=> b!254316 (= e!164829 (and e!164835 mapRes!11133))))

(declare-fun condMapEmpty!11133 () Bool)

(declare-fun mapDefault!11133 () ValueCell!2929)

