; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23052 () Bool)

(assert start!23052)

(declare-fun b!241517 () Bool)

(declare-fun b_free!6489 () Bool)

(declare-fun b_next!6489 () Bool)

(assert (=> b!241517 (= b_free!6489 (not b_next!6489))))

(declare-fun tp!22675 () Bool)

(declare-fun b_and!13461 () Bool)

(assert (=> b!241517 (= tp!22675 b_and!13461)))

(declare-fun bm!22469 () Bool)

(declare-fun call!22473 () Bool)

(declare-datatypes ((V!8115 0))(
  ( (V!8116 (val!3220 Int)) )
))
(declare-datatypes ((ValueCell!2832 0))(
  ( (ValueCellFull!2832 (v!5259 V!8115)) (EmptyCell!2832) )
))
(declare-datatypes ((array!11983 0))(
  ( (array!11984 (arr!5692 (Array (_ BitVec 32) ValueCell!2832)) (size!6034 (_ BitVec 32))) )
))
(declare-datatypes ((array!11985 0))(
  ( (array!11986 (arr!5693 (Array (_ BitVec 32) (_ BitVec 64))) (size!6035 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3564 0))(
  ( (LongMapFixedSize!3565 (defaultEntry!4475 Int) (mask!10546 (_ BitVec 32)) (extraKeys!4212 (_ BitVec 32)) (zeroValue!4316 V!8115) (minValue!4316 V!8115) (_size!1831 (_ BitVec 32)) (_keys!6581 array!11985) (_values!4458 array!11983) (_vacant!1831 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3564)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22469 (= call!22473 (arrayContainsKey!0 (_keys!6581 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241513 () Bool)

(declare-fun e!156742 () Bool)

(declare-fun e!156736 () Bool)

(assert (=> b!241513 (= e!156742 e!156736)))

(declare-fun res!118392 () Bool)

(assert (=> b!241513 (=> (not res!118392) (not e!156736))))

(declare-datatypes ((SeekEntryResult!1056 0))(
  ( (MissingZero!1056 (index!6394 (_ BitVec 32))) (Found!1056 (index!6395 (_ BitVec 32))) (Intermediate!1056 (undefined!1868 Bool) (index!6396 (_ BitVec 32)) (x!24218 (_ BitVec 32))) (Undefined!1056) (MissingVacant!1056 (index!6397 (_ BitVec 32))) )
))
(declare-fun lt!121387 () SeekEntryResult!1056)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!241513 (= res!118392 (or (= lt!121387 (MissingZero!1056 index!297)) (= lt!121387 (MissingVacant!1056 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11985 (_ BitVec 32)) SeekEntryResult!1056)

(assert (=> b!241513 (= lt!121387 (seekEntryOrOpen!0 key!932 (_keys!6581 thiss!1504) (mask!10546 thiss!1504)))))

(declare-fun b!241514 () Bool)

(declare-fun e!156734 () Bool)

(declare-fun e!156743 () Bool)

(assert (=> b!241514 (= e!156734 e!156743)))

(declare-fun res!118385 () Bool)

(declare-fun call!22472 () Bool)

(assert (=> b!241514 (= res!118385 call!22472)))

(assert (=> b!241514 (=> (not res!118385) (not e!156743))))

(declare-fun b!241515 () Bool)

(declare-datatypes ((Unit!7436 0))(
  ( (Unit!7437) )
))
(declare-fun e!156741 () Unit!7436)

(declare-fun Unit!7438 () Unit!7436)

(assert (=> b!241515 (= e!156741 Unit!7438)))

(declare-fun b!241516 () Bool)

(declare-fun res!118391 () Bool)

(assert (=> b!241516 (= res!118391 (= (select (arr!5693 (_keys!6581 thiss!1504)) (index!6397 lt!121387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241516 (=> (not res!118391) (not e!156743))))

(declare-fun tp_is_empty!6351 () Bool)

(declare-fun e!156740 () Bool)

(declare-fun e!156735 () Bool)

(declare-fun array_inv!3767 (array!11985) Bool)

(declare-fun array_inv!3768 (array!11983) Bool)

(assert (=> b!241517 (= e!156735 (and tp!22675 tp_is_empty!6351 (array_inv!3767 (_keys!6581 thiss!1504)) (array_inv!3768 (_values!4458 thiss!1504)) e!156740))))

(declare-fun b!241518 () Bool)

(declare-fun e!156737 () Bool)

(assert (=> b!241518 (= e!156737 tp_is_empty!6351)))

(declare-fun b!241519 () Bool)

(declare-fun e!156744 () Bool)

(declare-fun mapRes!10762 () Bool)

(assert (=> b!241519 (= e!156740 (and e!156744 mapRes!10762))))

(declare-fun condMapEmpty!10762 () Bool)

(declare-fun mapDefault!10762 () ValueCell!2832)

(assert (=> b!241519 (= condMapEmpty!10762 (= (arr!5692 (_values!4458 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2832)) mapDefault!10762)))))

(declare-fun b!241520 () Bool)

(declare-fun c!40266 () Bool)

(get-info :version)

(assert (=> b!241520 (= c!40266 ((_ is MissingVacant!1056) lt!121387))))

(declare-fun e!156732 () Bool)

(assert (=> b!241520 (= e!156732 e!156734)))

(declare-fun mapNonEmpty!10762 () Bool)

(declare-fun tp!22674 () Bool)

(assert (=> mapNonEmpty!10762 (= mapRes!10762 (and tp!22674 e!156737))))

(declare-fun mapValue!10762 () ValueCell!2832)

(declare-fun mapKey!10762 () (_ BitVec 32))

(declare-fun mapRest!10762 () (Array (_ BitVec 32) ValueCell!2832))

(assert (=> mapNonEmpty!10762 (= (arr!5692 (_values!4458 thiss!1504)) (store mapRest!10762 mapKey!10762 mapValue!10762))))

(declare-fun b!241521 () Bool)

(declare-fun e!156745 () Bool)

(assert (=> b!241521 (= e!156745 false)))

(declare-fun lt!121388 () Unit!7436)

(assert (=> b!241521 (= lt!121388 e!156741)))

(declare-fun c!40263 () Bool)

(assert (=> b!241521 (= c!40263 (arrayContainsKey!0 (_keys!6581 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241522 () Bool)

(declare-fun e!156733 () Bool)

(assert (=> b!241522 (= e!156733 (not call!22473))))

(declare-fun b!241523 () Bool)

(assert (=> b!241523 (= e!156744 tp_is_empty!6351)))

(declare-fun b!241512 () Bool)

(declare-fun res!118389 () Bool)

(assert (=> b!241512 (=> (not res!118389) (not e!156733))))

(assert (=> b!241512 (= res!118389 (= (select (arr!5693 (_keys!6581 thiss!1504)) (index!6394 lt!121387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!118390 () Bool)

(assert (=> start!23052 (=> (not res!118390) (not e!156742))))

(declare-fun valid!1401 (LongMapFixedSize!3564) Bool)

(assert (=> start!23052 (= res!118390 (valid!1401 thiss!1504))))

(assert (=> start!23052 e!156742))

(assert (=> start!23052 e!156735))

(assert (=> start!23052 true))

(declare-fun b!241524 () Bool)

(declare-fun e!156739 () Unit!7436)

(declare-fun lt!121383 () Unit!7436)

(assert (=> b!241524 (= e!156739 lt!121383)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!358 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8115 V!8115 (_ BitVec 64) Int) Unit!7436)

(assert (=> b!241524 (= lt!121383 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!358 (_keys!6581 thiss!1504) (_values!4458 thiss!1504) (mask!10546 thiss!1504) (extraKeys!4212 thiss!1504) (zeroValue!4316 thiss!1504) (minValue!4316 thiss!1504) key!932 (defaultEntry!4475 thiss!1504)))))

(declare-fun c!40264 () Bool)

(assert (=> b!241524 (= c!40264 ((_ is MissingZero!1056) lt!121387))))

(assert (=> b!241524 e!156732))

(declare-fun b!241525 () Bool)

(declare-fun res!118386 () Bool)

(assert (=> b!241525 (=> (not res!118386) (not e!156733))))

(assert (=> b!241525 (= res!118386 call!22472)))

(assert (=> b!241525 (= e!156732 e!156733)))

(declare-fun b!241526 () Bool)

(assert (=> b!241526 (= e!156734 ((_ is Undefined!1056) lt!121387))))

(declare-fun b!241527 () Bool)

(assert (=> b!241527 (= e!156743 (not call!22473))))

(declare-fun b!241528 () Bool)

(declare-fun Unit!7439 () Unit!7436)

(assert (=> b!241528 (= e!156741 Unit!7439)))

(declare-fun lt!121385 () Unit!7436)

(declare-fun lemmaArrayContainsKeyThenInListMap!153 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8115 V!8115 (_ BitVec 64) (_ BitVec 32) Int) Unit!7436)

(assert (=> b!241528 (= lt!121385 (lemmaArrayContainsKeyThenInListMap!153 (_keys!6581 thiss!1504) (_values!4458 thiss!1504) (mask!10546 thiss!1504) (extraKeys!4212 thiss!1504) (zeroValue!4316 thiss!1504) (minValue!4316 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4475 thiss!1504)))))

(assert (=> b!241528 false))

(declare-fun bm!22470 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22470 (= call!22472 (inRange!0 (ite c!40264 (index!6394 lt!121387) (index!6397 lt!121387)) (mask!10546 thiss!1504)))))

(declare-fun mapIsEmpty!10762 () Bool)

(assert (=> mapIsEmpty!10762 mapRes!10762))

(declare-fun b!241529 () Bool)

(declare-fun Unit!7440 () Unit!7436)

(assert (=> b!241529 (= e!156739 Unit!7440)))

(declare-fun lt!121386 () Unit!7436)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!348 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8115 V!8115 (_ BitVec 64) Int) Unit!7436)

(assert (=> b!241529 (= lt!121386 (lemmaInListMapThenSeekEntryOrOpenFindsIt!348 (_keys!6581 thiss!1504) (_values!4458 thiss!1504) (mask!10546 thiss!1504) (extraKeys!4212 thiss!1504) (zeroValue!4316 thiss!1504) (minValue!4316 thiss!1504) key!932 (defaultEntry!4475 thiss!1504)))))

(assert (=> b!241529 false))

(declare-fun b!241530 () Bool)

(declare-fun res!118387 () Bool)

(assert (=> b!241530 (=> (not res!118387) (not e!156742))))

(assert (=> b!241530 (= res!118387 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241531 () Bool)

(assert (=> b!241531 (= e!156736 e!156745)))

(declare-fun res!118388 () Bool)

(assert (=> b!241531 (=> (not res!118388) (not e!156745))))

(assert (=> b!241531 (= res!118388 (inRange!0 index!297 (mask!10546 thiss!1504)))))

(declare-fun lt!121384 () Unit!7436)

(assert (=> b!241531 (= lt!121384 e!156739)))

(declare-fun c!40265 () Bool)

(declare-datatypes ((tuple2!4744 0))(
  ( (tuple2!4745 (_1!2383 (_ BitVec 64)) (_2!2383 V!8115)) )
))
(declare-datatypes ((List!3624 0))(
  ( (Nil!3621) (Cons!3620 (h!4277 tuple2!4744) (t!8621 List!3624)) )
))
(declare-datatypes ((ListLongMap!3657 0))(
  ( (ListLongMap!3658 (toList!1844 List!3624)) )
))
(declare-fun contains!1734 (ListLongMap!3657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1372 (array!11985 array!11983 (_ BitVec 32) (_ BitVec 32) V!8115 V!8115 (_ BitVec 32) Int) ListLongMap!3657)

(assert (=> b!241531 (= c!40265 (contains!1734 (getCurrentListMap!1372 (_keys!6581 thiss!1504) (_values!4458 thiss!1504) (mask!10546 thiss!1504) (extraKeys!4212 thiss!1504) (zeroValue!4316 thiss!1504) (minValue!4316 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4475 thiss!1504)) key!932))))

(assert (= (and start!23052 res!118390) b!241530))

(assert (= (and b!241530 res!118387) b!241513))

(assert (= (and b!241513 res!118392) b!241531))

(assert (= (and b!241531 c!40265) b!241529))

(assert (= (and b!241531 (not c!40265)) b!241524))

(assert (= (and b!241524 c!40264) b!241525))

(assert (= (and b!241524 (not c!40264)) b!241520))

(assert (= (and b!241525 res!118386) b!241512))

(assert (= (and b!241512 res!118389) b!241522))

(assert (= (and b!241520 c!40266) b!241514))

(assert (= (and b!241520 (not c!40266)) b!241526))

(assert (= (and b!241514 res!118385) b!241516))

(assert (= (and b!241516 res!118391) b!241527))

(assert (= (or b!241525 b!241514) bm!22470))

(assert (= (or b!241522 b!241527) bm!22469))

(assert (= (and b!241531 res!118388) b!241521))

(assert (= (and b!241521 c!40263) b!241528))

(assert (= (and b!241521 (not c!40263)) b!241515))

(assert (= (and b!241519 condMapEmpty!10762) mapIsEmpty!10762))

(assert (= (and b!241519 (not condMapEmpty!10762)) mapNonEmpty!10762))

(assert (= (and mapNonEmpty!10762 ((_ is ValueCellFull!2832) mapValue!10762)) b!241518))

(assert (= (and b!241519 ((_ is ValueCellFull!2832) mapDefault!10762)) b!241523))

(assert (= b!241517 b!241519))

(assert (= start!23052 b!241517))

(declare-fun m!260717 () Bool)

(assert (=> mapNonEmpty!10762 m!260717))

(declare-fun m!260719 () Bool)

(assert (=> b!241517 m!260719))

(declare-fun m!260721 () Bool)

(assert (=> b!241517 m!260721))

(declare-fun m!260723 () Bool)

(assert (=> start!23052 m!260723))

(declare-fun m!260725 () Bool)

(assert (=> b!241513 m!260725))

(declare-fun m!260727 () Bool)

(assert (=> b!241516 m!260727))

(declare-fun m!260729 () Bool)

(assert (=> b!241531 m!260729))

(declare-fun m!260731 () Bool)

(assert (=> b!241531 m!260731))

(assert (=> b!241531 m!260731))

(declare-fun m!260733 () Bool)

(assert (=> b!241531 m!260733))

(declare-fun m!260735 () Bool)

(assert (=> b!241529 m!260735))

(declare-fun m!260737 () Bool)

(assert (=> b!241528 m!260737))

(declare-fun m!260739 () Bool)

(assert (=> bm!22469 m!260739))

(declare-fun m!260741 () Bool)

(assert (=> bm!22470 m!260741))

(declare-fun m!260743 () Bool)

(assert (=> b!241512 m!260743))

(assert (=> b!241521 m!260739))

(declare-fun m!260745 () Bool)

(assert (=> b!241524 m!260745))

(check-sat (not bm!22470) tp_is_empty!6351 (not b!241524) (not bm!22469) (not b!241529) (not b!241528) (not start!23052) (not b!241521) (not mapNonEmpty!10762) (not b_next!6489) (not b!241531) b_and!13461 (not b!241517) (not b!241513))
(check-sat b_and!13461 (not b_next!6489))
