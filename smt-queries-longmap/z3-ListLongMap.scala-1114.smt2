; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22932 () Bool)

(assert start!22932)

(declare-fun b!239423 () Bool)

(declare-fun b_free!6435 () Bool)

(declare-fun b_next!6435 () Bool)

(assert (=> b!239423 (= b_free!6435 (not b_next!6435))))

(declare-fun tp!22509 () Bool)

(declare-fun b_and!13401 () Bool)

(assert (=> b!239423 (= tp!22509 b_and!13401)))

(declare-fun b!239420 () Bool)

(declare-fun e!155449 () Bool)

(declare-fun tp_is_empty!6297 () Bool)

(assert (=> b!239420 (= e!155449 tp_is_empty!6297)))

(declare-fun mapNonEmpty!10677 () Bool)

(declare-fun mapRes!10677 () Bool)

(declare-fun tp!22508 () Bool)

(declare-fun e!155454 () Bool)

(assert (=> mapNonEmpty!10677 (= mapRes!10677 (and tp!22508 e!155454))))

(declare-datatypes ((V!8043 0))(
  ( (V!8044 (val!3193 Int)) )
))
(declare-datatypes ((ValueCell!2805 0))(
  ( (ValueCellFull!2805 (v!5231 V!8043)) (EmptyCell!2805) )
))
(declare-fun mapValue!10677 () ValueCell!2805)

(declare-fun mapRest!10677 () (Array (_ BitVec 32) ValueCell!2805))

(declare-datatypes ((array!11873 0))(
  ( (array!11874 (arr!5638 (Array (_ BitVec 32) ValueCell!2805)) (size!5979 (_ BitVec 32))) )
))
(declare-datatypes ((array!11875 0))(
  ( (array!11876 (arr!5639 (Array (_ BitVec 32) (_ BitVec 64))) (size!5980 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3510 0))(
  ( (LongMapFixedSize!3511 (defaultEntry!4440 Int) (mask!10486 (_ BitVec 32)) (extraKeys!4177 (_ BitVec 32)) (zeroValue!4281 V!8043) (minValue!4281 V!8043) (_size!1804 (_ BitVec 32)) (_keys!6542 array!11875) (_values!4423 array!11873) (_vacant!1804 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3510)

(declare-fun mapKey!10677 () (_ BitVec 32))

(assert (=> mapNonEmpty!10677 (= (arr!5638 (_values!4423 thiss!1504)) (store mapRest!10677 mapKey!10677 mapValue!10677))))

(declare-fun mapIsEmpty!10677 () Bool)

(assert (=> mapIsEmpty!10677 mapRes!10677))

(declare-fun b!239421 () Bool)

(declare-fun c!39910 () Bool)

(declare-datatypes ((SeekEntryResult!1032 0))(
  ( (MissingZero!1032 (index!6298 (_ BitVec 32))) (Found!1032 (index!6299 (_ BitVec 32))) (Intermediate!1032 (undefined!1844 Bool) (index!6300 (_ BitVec 32)) (x!24104 (_ BitVec 32))) (Undefined!1032) (MissingVacant!1032 (index!6301 (_ BitVec 32))) )
))
(declare-fun lt!120787 () SeekEntryResult!1032)

(get-info :version)

(assert (=> b!239421 (= c!39910 ((_ is MissingVacant!1032) lt!120787))))

(declare-fun e!155448 () Bool)

(declare-fun e!155458 () Bool)

(assert (=> b!239421 (= e!155448 e!155458)))

(declare-fun bm!22262 () Bool)

(declare-fun call!22265 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22262 (= call!22265 (arrayContainsKey!0 (_keys!6542 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun call!22266 () Bool)

(declare-fun bm!22263 () Bool)

(declare-fun c!39911 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22263 (= call!22266 (inRange!0 (ite c!39911 (index!6298 lt!120787) (index!6301 lt!120787)) (mask!10486 thiss!1504)))))

(declare-fun b!239422 () Bool)

(assert (=> b!239422 (= e!155458 ((_ is Undefined!1032) lt!120787))))

(declare-fun e!155453 () Bool)

(declare-fun e!155451 () Bool)

(declare-fun array_inv!3729 (array!11875) Bool)

(declare-fun array_inv!3730 (array!11873) Bool)

(assert (=> b!239423 (= e!155451 (and tp!22509 tp_is_empty!6297 (array_inv!3729 (_keys!6542 thiss!1504)) (array_inv!3730 (_values!4423 thiss!1504)) e!155453))))

(declare-fun b!239424 () Bool)

(declare-fun e!155457 () Bool)

(assert (=> b!239424 (= e!155457 (and (= (size!5979 (_values!4423 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10486 thiss!1504))) (= (size!5980 (_keys!6542 thiss!1504)) (size!5979 (_values!4423 thiss!1504))) (bvsge (mask!10486 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4177 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!239425 () Bool)

(declare-fun e!155460 () Bool)

(assert (=> b!239425 (= e!155460 (not call!22265))))

(declare-fun res!117340 () Bool)

(declare-fun e!155455 () Bool)

(assert (=> start!22932 (=> (not res!117340) (not e!155455))))

(declare-fun valid!1384 (LongMapFixedSize!3510) Bool)

(assert (=> start!22932 (= res!117340 (valid!1384 thiss!1504))))

(assert (=> start!22932 e!155455))

(assert (=> start!22932 e!155451))

(assert (=> start!22932 true))

(declare-fun b!239426 () Bool)

(declare-fun e!155456 () Bool)

(assert (=> b!239426 (= e!155456 e!155457)))

(declare-fun res!117341 () Bool)

(assert (=> b!239426 (=> (not res!117341) (not e!155457))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239426 (= res!117341 (inRange!0 index!297 (mask!10486 thiss!1504)))))

(declare-datatypes ((Unit!7353 0))(
  ( (Unit!7354) )
))
(declare-fun lt!120786 () Unit!7353)

(declare-fun e!155459 () Unit!7353)

(assert (=> b!239426 (= lt!120786 e!155459)))

(declare-fun c!39909 () Bool)

(declare-datatypes ((tuple2!4704 0))(
  ( (tuple2!4705 (_1!2363 (_ BitVec 64)) (_2!2363 V!8043)) )
))
(declare-datatypes ((List!3594 0))(
  ( (Nil!3591) (Cons!3590 (h!4246 tuple2!4704) (t!8589 List!3594)) )
))
(declare-datatypes ((ListLongMap!3617 0))(
  ( (ListLongMap!3618 (toList!1824 List!3594)) )
))
(declare-fun contains!1712 (ListLongMap!3617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1352 (array!11875 array!11873 (_ BitVec 32) (_ BitVec 32) V!8043 V!8043 (_ BitVec 32) Int) ListLongMap!3617)

(assert (=> b!239426 (= c!39909 (contains!1712 (getCurrentListMap!1352 (_keys!6542 thiss!1504) (_values!4423 thiss!1504) (mask!10486 thiss!1504) (extraKeys!4177 thiss!1504) (zeroValue!4281 thiss!1504) (minValue!4281 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4440 thiss!1504)) key!932))))

(declare-fun b!239427 () Bool)

(declare-fun res!117339 () Bool)

(assert (=> b!239427 (=> (not res!117339) (not e!155457))))

(assert (=> b!239427 (= res!117339 (arrayContainsKey!0 (_keys!6542 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239428 () Bool)

(assert (=> b!239428 (= e!155453 (and e!155449 mapRes!10677))))

(declare-fun condMapEmpty!10677 () Bool)

(declare-fun mapDefault!10677 () ValueCell!2805)

(assert (=> b!239428 (= condMapEmpty!10677 (= (arr!5638 (_values!4423 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2805)) mapDefault!10677)))))

(declare-fun b!239429 () Bool)

(declare-fun res!117338 () Bool)

(assert (=> b!239429 (=> (not res!117338) (not e!155460))))

(assert (=> b!239429 (= res!117338 call!22266)))

(assert (=> b!239429 (= e!155448 e!155460)))

(declare-fun b!239430 () Bool)

(declare-fun res!117343 () Bool)

(assert (=> b!239430 (= res!117343 (= (select (arr!5639 (_keys!6542 thiss!1504)) (index!6301 lt!120787)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155452 () Bool)

(assert (=> b!239430 (=> (not res!117343) (not e!155452))))

(declare-fun b!239431 () Bool)

(declare-fun res!117345 () Bool)

(assert (=> b!239431 (=> (not res!117345) (not e!155460))))

(assert (=> b!239431 (= res!117345 (= (select (arr!5639 (_keys!6542 thiss!1504)) (index!6298 lt!120787)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239432 () Bool)

(assert (=> b!239432 (= e!155455 e!155456)))

(declare-fun res!117344 () Bool)

(assert (=> b!239432 (=> (not res!117344) (not e!155456))))

(assert (=> b!239432 (= res!117344 (or (= lt!120787 (MissingZero!1032 index!297)) (= lt!120787 (MissingVacant!1032 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11875 (_ BitVec 32)) SeekEntryResult!1032)

(assert (=> b!239432 (= lt!120787 (seekEntryOrOpen!0 key!932 (_keys!6542 thiss!1504) (mask!10486 thiss!1504)))))

(declare-fun b!239433 () Bool)

(declare-fun res!117346 () Bool)

(assert (=> b!239433 (=> (not res!117346) (not e!155457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239433 (= res!117346 (validMask!0 (mask!10486 thiss!1504)))))

(declare-fun b!239434 () Bool)

(assert (=> b!239434 (= e!155458 e!155452)))

(declare-fun res!117347 () Bool)

(assert (=> b!239434 (= res!117347 call!22266)))

(assert (=> b!239434 (=> (not res!117347) (not e!155452))))

(declare-fun b!239435 () Bool)

(declare-fun res!117342 () Bool)

(assert (=> b!239435 (=> (not res!117342) (not e!155455))))

(assert (=> b!239435 (= res!117342 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239436 () Bool)

(assert (=> b!239436 (= e!155452 (not call!22265))))

(declare-fun b!239437 () Bool)

(declare-fun Unit!7355 () Unit!7353)

(assert (=> b!239437 (= e!155459 Unit!7355)))

(declare-fun lt!120789 () Unit!7353)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!327 (array!11875 array!11873 (_ BitVec 32) (_ BitVec 32) V!8043 V!8043 (_ BitVec 64) Int) Unit!7353)

(assert (=> b!239437 (= lt!120789 (lemmaInListMapThenSeekEntryOrOpenFindsIt!327 (_keys!6542 thiss!1504) (_values!4423 thiss!1504) (mask!10486 thiss!1504) (extraKeys!4177 thiss!1504) (zeroValue!4281 thiss!1504) (minValue!4281 thiss!1504) key!932 (defaultEntry!4440 thiss!1504)))))

(assert (=> b!239437 false))

(declare-fun b!239438 () Bool)

(declare-fun lt!120788 () Unit!7353)

(assert (=> b!239438 (= e!155459 lt!120788)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!343 (array!11875 array!11873 (_ BitVec 32) (_ BitVec 32) V!8043 V!8043 (_ BitVec 64) Int) Unit!7353)

(assert (=> b!239438 (= lt!120788 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!343 (_keys!6542 thiss!1504) (_values!4423 thiss!1504) (mask!10486 thiss!1504) (extraKeys!4177 thiss!1504) (zeroValue!4281 thiss!1504) (minValue!4281 thiss!1504) key!932 (defaultEntry!4440 thiss!1504)))))

(assert (=> b!239438 (= c!39911 ((_ is MissingZero!1032) lt!120787))))

(assert (=> b!239438 e!155448))

(declare-fun b!239439 () Bool)

(assert (=> b!239439 (= e!155454 tp_is_empty!6297)))

(assert (= (and start!22932 res!117340) b!239435))

(assert (= (and b!239435 res!117342) b!239432))

(assert (= (and b!239432 res!117344) b!239426))

(assert (= (and b!239426 c!39909) b!239437))

(assert (= (and b!239426 (not c!39909)) b!239438))

(assert (= (and b!239438 c!39911) b!239429))

(assert (= (and b!239438 (not c!39911)) b!239421))

(assert (= (and b!239429 res!117338) b!239431))

(assert (= (and b!239431 res!117345) b!239425))

(assert (= (and b!239421 c!39910) b!239434))

(assert (= (and b!239421 (not c!39910)) b!239422))

(assert (= (and b!239434 res!117347) b!239430))

(assert (= (and b!239430 res!117343) b!239436))

(assert (= (or b!239429 b!239434) bm!22263))

(assert (= (or b!239425 b!239436) bm!22262))

(assert (= (and b!239426 res!117341) b!239427))

(assert (= (and b!239427 res!117339) b!239433))

(assert (= (and b!239433 res!117346) b!239424))

(assert (= (and b!239428 condMapEmpty!10677) mapIsEmpty!10677))

(assert (= (and b!239428 (not condMapEmpty!10677)) mapNonEmpty!10677))

(assert (= (and mapNonEmpty!10677 ((_ is ValueCellFull!2805) mapValue!10677)) b!239439))

(assert (= (and b!239428 ((_ is ValueCellFull!2805) mapDefault!10677)) b!239420))

(assert (= b!239423 b!239428))

(assert (= start!22932 b!239423))

(declare-fun m!259499 () Bool)

(assert (=> b!239431 m!259499))

(declare-fun m!259501 () Bool)

(assert (=> bm!22262 m!259501))

(declare-fun m!259503 () Bool)

(assert (=> b!239438 m!259503))

(declare-fun m!259505 () Bool)

(assert (=> b!239433 m!259505))

(declare-fun m!259507 () Bool)

(assert (=> b!239437 m!259507))

(declare-fun m!259509 () Bool)

(assert (=> b!239430 m!259509))

(declare-fun m!259511 () Bool)

(assert (=> start!22932 m!259511))

(declare-fun m!259513 () Bool)

(assert (=> b!239426 m!259513))

(declare-fun m!259515 () Bool)

(assert (=> b!239426 m!259515))

(assert (=> b!239426 m!259515))

(declare-fun m!259517 () Bool)

(assert (=> b!239426 m!259517))

(assert (=> b!239427 m!259501))

(declare-fun m!259519 () Bool)

(assert (=> mapNonEmpty!10677 m!259519))

(declare-fun m!259521 () Bool)

(assert (=> b!239432 m!259521))

(declare-fun m!259523 () Bool)

(assert (=> bm!22263 m!259523))

(declare-fun m!259525 () Bool)

(assert (=> b!239423 m!259525))

(declare-fun m!259527 () Bool)

(assert (=> b!239423 m!259527))

(check-sat (not b!239432) (not b!239423) (not b!239433) (not start!22932) (not bm!22263) (not b!239426) tp_is_empty!6297 b_and!13401 (not b_next!6435) (not b!239438) (not b!239437) (not b!239427) (not mapNonEmpty!10677) (not bm!22262))
(check-sat b_and!13401 (not b_next!6435))
