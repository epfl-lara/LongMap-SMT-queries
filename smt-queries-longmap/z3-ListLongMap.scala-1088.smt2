; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22214 () Bool)

(assert start!22214)

(declare-fun b!233040 () Bool)

(declare-fun b_free!6277 () Bool)

(declare-fun b_next!6277 () Bool)

(assert (=> b!233040 (= b_free!6277 (not b_next!6277))))

(declare-fun tp!21973 () Bool)

(declare-fun b_and!13189 () Bool)

(assert (=> b!233040 (= tp!21973 b_and!13189)))

(declare-fun b!233039 () Bool)

(declare-fun res!114391 () Bool)

(declare-fun e!151360 () Bool)

(assert (=> b!233039 (=> (not res!114391) (not e!151360))))

(declare-datatypes ((V!7833 0))(
  ( (V!7834 (val!3114 Int)) )
))
(declare-datatypes ((ValueCell!2726 0))(
  ( (ValueCellFull!2726 (v!5135 V!7833)) (EmptyCell!2726) )
))
(declare-datatypes ((array!11519 0))(
  ( (array!11520 (arr!5479 (Array (_ BitVec 32) ValueCell!2726)) (size!5812 (_ BitVec 32))) )
))
(declare-datatypes ((array!11521 0))(
  ( (array!11522 (arr!5480 (Array (_ BitVec 32) (_ BitVec 64))) (size!5813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3352 0))(
  ( (LongMapFixedSize!3353 (defaultEntry!4335 Int) (mask!10255 (_ BitVec 32)) (extraKeys!4072 (_ BitVec 32)) (zeroValue!4176 V!7833) (minValue!4176 V!7833) (_size!1725 (_ BitVec 32)) (_keys!6389 array!11521) (_values!4318 array!11519) (_vacant!1725 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3352)

(declare-datatypes ((SeekEntryResult!940 0))(
  ( (MissingZero!940 (index!5930 (_ BitVec 32))) (Found!940 (index!5931 (_ BitVec 32))) (Intermediate!940 (undefined!1752 Bool) (index!5932 (_ BitVec 32)) (x!23560 (_ BitVec 32))) (Undefined!940) (MissingVacant!940 (index!5933 (_ BitVec 32))) )
))
(declare-fun lt!117938 () SeekEntryResult!940)

(assert (=> b!233039 (= res!114391 (= (select (arr!5480 (_keys!6389 thiss!1504)) (index!5930 lt!117938)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151369 () Bool)

(declare-fun e!151366 () Bool)

(declare-fun tp_is_empty!6139 () Bool)

(declare-fun array_inv!3591 (array!11521) Bool)

(declare-fun array_inv!3592 (array!11519) Bool)

(assert (=> b!233040 (= e!151366 (and tp!21973 tp_is_empty!6139 (array_inv!3591 (_keys!6389 thiss!1504)) (array_inv!3592 (_values!4318 thiss!1504)) e!151369))))

(declare-fun res!114392 () Bool)

(declare-fun e!151365 () Bool)

(assert (=> start!22214 (=> (not res!114392) (not e!151365))))

(declare-fun valid!1340 (LongMapFixedSize!3352) Bool)

(assert (=> start!22214 (= res!114392 (valid!1340 thiss!1504))))

(assert (=> start!22214 e!151365))

(assert (=> start!22214 e!151366))

(assert (=> start!22214 true))

(declare-fun b!233041 () Bool)

(declare-fun c!38769 () Bool)

(get-info :version)

(assert (=> b!233041 (= c!38769 ((_ is MissingVacant!940) lt!117938))))

(declare-fun e!151362 () Bool)

(declare-fun e!151368 () Bool)

(assert (=> b!233041 (= e!151362 e!151368)))

(declare-fun b!233042 () Bool)

(declare-fun call!21654 () Bool)

(assert (=> b!233042 (= e!151360 (not call!21654))))

(declare-fun b!233043 () Bool)

(declare-fun e!151370 () Bool)

(assert (=> b!233043 (= e!151368 e!151370)))

(declare-fun res!114394 () Bool)

(declare-fun call!21653 () Bool)

(assert (=> b!233043 (= res!114394 call!21653)))

(assert (=> b!233043 (=> (not res!114394) (not e!151370))))

(declare-fun b!233044 () Bool)

(declare-datatypes ((Unit!7194 0))(
  ( (Unit!7195) )
))
(declare-fun e!151363 () Unit!7194)

(declare-fun lt!117937 () Unit!7194)

(assert (=> b!233044 (= e!151363 lt!117937)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!314 (array!11521 array!11519 (_ BitVec 32) (_ BitVec 32) V!7833 V!7833 (_ BitVec 64) Int) Unit!7194)

(assert (=> b!233044 (= lt!117937 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!314 (_keys!6389 thiss!1504) (_values!4318 thiss!1504) (mask!10255 thiss!1504) (extraKeys!4072 thiss!1504) (zeroValue!4176 thiss!1504) (minValue!4176 thiss!1504) key!932 (defaultEntry!4335 thiss!1504)))))

(declare-fun c!38770 () Bool)

(assert (=> b!233044 (= c!38770 ((_ is MissingZero!940) lt!117938))))

(assert (=> b!233044 e!151362))

(declare-fun mapNonEmpty!10378 () Bool)

(declare-fun mapRes!10378 () Bool)

(declare-fun tp!21972 () Bool)

(declare-fun e!151367 () Bool)

(assert (=> mapNonEmpty!10378 (= mapRes!10378 (and tp!21972 e!151367))))

(declare-fun mapRest!10378 () (Array (_ BitVec 32) ValueCell!2726))

(declare-fun mapKey!10378 () (_ BitVec 32))

(declare-fun mapValue!10378 () ValueCell!2726)

(assert (=> mapNonEmpty!10378 (= (arr!5479 (_values!4318 thiss!1504)) (store mapRest!10378 mapKey!10378 mapValue!10378))))

(declare-fun b!233045 () Bool)

(declare-fun Unit!7196 () Unit!7194)

(assert (=> b!233045 (= e!151363 Unit!7196)))

(declare-fun lt!117940 () Unit!7194)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!320 (array!11521 array!11519 (_ BitVec 32) (_ BitVec 32) V!7833 V!7833 (_ BitVec 64) Int) Unit!7194)

(assert (=> b!233045 (= lt!117940 (lemmaInListMapThenSeekEntryOrOpenFindsIt!320 (_keys!6389 thiss!1504) (_values!4318 thiss!1504) (mask!10255 thiss!1504) (extraKeys!4072 thiss!1504) (zeroValue!4176 thiss!1504) (minValue!4176 thiss!1504) key!932 (defaultEntry!4335 thiss!1504)))))

(assert (=> b!233045 false))

(declare-fun b!233046 () Bool)

(declare-fun res!114395 () Bool)

(assert (=> b!233046 (=> (not res!114395) (not e!151365))))

(assert (=> b!233046 (= res!114395 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233047 () Bool)

(declare-fun res!114393 () Bool)

(assert (=> b!233047 (=> (not res!114393) (not e!151360))))

(assert (=> b!233047 (= res!114393 call!21653)))

(assert (=> b!233047 (= e!151362 e!151360)))

(declare-fun b!233048 () Bool)

(assert (=> b!233048 (= e!151367 tp_is_empty!6139)))

(declare-fun bm!21650 () Bool)

(declare-fun arrayContainsKey!0 (array!11521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21650 (= call!21654 (arrayContainsKey!0 (_keys!6389 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!233049 () Bool)

(declare-fun e!151361 () Bool)

(assert (=> b!233049 (= e!151365 e!151361)))

(declare-fun res!114396 () Bool)

(assert (=> b!233049 (=> (not res!114396) (not e!151361))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233049 (= res!114396 (or (= lt!117938 (MissingZero!940 index!297)) (= lt!117938 (MissingVacant!940 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11521 (_ BitVec 32)) SeekEntryResult!940)

(assert (=> b!233049 (= lt!117938 (seekEntryOrOpen!0 key!932 (_keys!6389 thiss!1504) (mask!10255 thiss!1504)))))

(declare-fun b!233050 () Bool)

(assert (=> b!233050 (= e!151370 (not call!21654))))

(declare-fun b!233051 () Bool)

(declare-fun e!151359 () Bool)

(assert (=> b!233051 (= e!151359 tp_is_empty!6139)))

(declare-fun b!233052 () Bool)

(declare-fun res!114397 () Bool)

(assert (=> b!233052 (= res!114397 (= (select (arr!5480 (_keys!6389 thiss!1504)) (index!5933 lt!117938)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233052 (=> (not res!114397) (not e!151370))))

(declare-fun b!233053 () Bool)

(assert (=> b!233053 (= e!151368 ((_ is Undefined!940) lt!117938))))

(declare-fun mapIsEmpty!10378 () Bool)

(assert (=> mapIsEmpty!10378 mapRes!10378))

(declare-fun b!233054 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!233054 (= e!151361 (not (inRange!0 index!297 (mask!10255 thiss!1504))))))

(declare-fun lt!117939 () Unit!7194)

(assert (=> b!233054 (= lt!117939 e!151363)))

(declare-fun c!38768 () Bool)

(declare-datatypes ((tuple2!4526 0))(
  ( (tuple2!4527 (_1!2274 (_ BitVec 64)) (_2!2274 V!7833)) )
))
(declare-datatypes ((List!3434 0))(
  ( (Nil!3431) (Cons!3430 (h!4078 tuple2!4526) (t!8385 List!3434)) )
))
(declare-datatypes ((ListLongMap!3441 0))(
  ( (ListLongMap!3442 (toList!1736 List!3434)) )
))
(declare-fun contains!1618 (ListLongMap!3441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1268 (array!11521 array!11519 (_ BitVec 32) (_ BitVec 32) V!7833 V!7833 (_ BitVec 32) Int) ListLongMap!3441)

(assert (=> b!233054 (= c!38768 (contains!1618 (getCurrentListMap!1268 (_keys!6389 thiss!1504) (_values!4318 thiss!1504) (mask!10255 thiss!1504) (extraKeys!4072 thiss!1504) (zeroValue!4176 thiss!1504) (minValue!4176 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4335 thiss!1504)) key!932))))

(declare-fun b!233055 () Bool)

(assert (=> b!233055 (= e!151369 (and e!151359 mapRes!10378))))

(declare-fun condMapEmpty!10378 () Bool)

(declare-fun mapDefault!10378 () ValueCell!2726)

(assert (=> b!233055 (= condMapEmpty!10378 (= (arr!5479 (_values!4318 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2726)) mapDefault!10378)))))

(declare-fun bm!21651 () Bool)

(assert (=> bm!21651 (= call!21653 (inRange!0 (ite c!38770 (index!5930 lt!117938) (index!5933 lt!117938)) (mask!10255 thiss!1504)))))

(assert (= (and start!22214 res!114392) b!233046))

(assert (= (and b!233046 res!114395) b!233049))

(assert (= (and b!233049 res!114396) b!233054))

(assert (= (and b!233054 c!38768) b!233045))

(assert (= (and b!233054 (not c!38768)) b!233044))

(assert (= (and b!233044 c!38770) b!233047))

(assert (= (and b!233044 (not c!38770)) b!233041))

(assert (= (and b!233047 res!114393) b!233039))

(assert (= (and b!233039 res!114391) b!233042))

(assert (= (and b!233041 c!38769) b!233043))

(assert (= (and b!233041 (not c!38769)) b!233053))

(assert (= (and b!233043 res!114394) b!233052))

(assert (= (and b!233052 res!114397) b!233050))

(assert (= (or b!233047 b!233043) bm!21651))

(assert (= (or b!233042 b!233050) bm!21650))

(assert (= (and b!233055 condMapEmpty!10378) mapIsEmpty!10378))

(assert (= (and b!233055 (not condMapEmpty!10378)) mapNonEmpty!10378))

(assert (= (and mapNonEmpty!10378 ((_ is ValueCellFull!2726) mapValue!10378)) b!233048))

(assert (= (and b!233055 ((_ is ValueCellFull!2726) mapDefault!10378)) b!233051))

(assert (= b!233040 b!233055))

(assert (= start!22214 b!233040))

(declare-fun m!254683 () Bool)

(assert (=> start!22214 m!254683))

(declare-fun m!254685 () Bool)

(assert (=> mapNonEmpty!10378 m!254685))

(declare-fun m!254687 () Bool)

(assert (=> b!233045 m!254687))

(declare-fun m!254689 () Bool)

(assert (=> b!233044 m!254689))

(declare-fun m!254691 () Bool)

(assert (=> b!233052 m!254691))

(declare-fun m!254693 () Bool)

(assert (=> bm!21650 m!254693))

(declare-fun m!254695 () Bool)

(assert (=> b!233054 m!254695))

(declare-fun m!254697 () Bool)

(assert (=> b!233054 m!254697))

(assert (=> b!233054 m!254697))

(declare-fun m!254699 () Bool)

(assert (=> b!233054 m!254699))

(declare-fun m!254701 () Bool)

(assert (=> b!233040 m!254701))

(declare-fun m!254703 () Bool)

(assert (=> b!233040 m!254703))

(declare-fun m!254705 () Bool)

(assert (=> bm!21651 m!254705))

(declare-fun m!254707 () Bool)

(assert (=> b!233039 m!254707))

(declare-fun m!254709 () Bool)

(assert (=> b!233049 m!254709))

(check-sat (not bm!21651) b_and!13189 (not b!233045) (not mapNonEmpty!10378) (not b!233054) tp_is_empty!6139 (not b!233049) (not b_next!6277) (not bm!21650) (not start!22214) (not b!233040) (not b!233044))
(check-sat b_and!13189 (not b_next!6277))
