; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22530 () Bool)

(assert start!22530)

(declare-fun b!235548 () Bool)

(declare-fun b_free!6331 () Bool)

(declare-fun b_next!6331 () Bool)

(assert (=> b!235548 (= b_free!6331 (not b_next!6331))))

(declare-fun tp!22162 () Bool)

(declare-fun b_and!13275 () Bool)

(assert (=> b!235548 (= tp!22162 b_and!13275)))

(declare-fun mapIsEmpty!10487 () Bool)

(declare-fun mapRes!10487 () Bool)

(assert (=> mapIsEmpty!10487 mapRes!10487))

(declare-fun b!235541 () Bool)

(declare-fun e!152963 () Bool)

(declare-fun e!152962 () Bool)

(assert (=> b!235541 (= e!152963 e!152962)))

(declare-fun res!115499 () Bool)

(assert (=> b!235541 (=> (not res!115499) (not e!152962))))

(declare-datatypes ((SeekEntryResult!961 0))(
  ( (MissingZero!961 (index!6014 (_ BitVec 32))) (Found!961 (index!6015 (_ BitVec 32))) (Intermediate!961 (undefined!1773 Bool) (index!6016 (_ BitVec 32)) (x!23765 (_ BitVec 32))) (Undefined!961) (MissingVacant!961 (index!6017 (_ BitVec 32))) )
))
(declare-fun lt!119195 () SeekEntryResult!961)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235541 (= res!115499 (or (= lt!119195 (MissingZero!961 index!297)) (= lt!119195 (MissingVacant!961 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7905 0))(
  ( (V!7906 (val!3141 Int)) )
))
(declare-datatypes ((ValueCell!2753 0))(
  ( (ValueCellFull!2753 (v!5170 V!7905)) (EmptyCell!2753) )
))
(declare-datatypes ((array!11643 0))(
  ( (array!11644 (arr!5533 (Array (_ BitVec 32) ValueCell!2753)) (size!5870 (_ BitVec 32))) )
))
(declare-datatypes ((array!11645 0))(
  ( (array!11646 (arr!5534 (Array (_ BitVec 32) (_ BitVec 64))) (size!5871 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3406 0))(
  ( (LongMapFixedSize!3407 (defaultEntry!4374 Int) (mask!10346 (_ BitVec 32)) (extraKeys!4111 (_ BitVec 32)) (zeroValue!4215 V!7905) (minValue!4215 V!7905) (_size!1752 (_ BitVec 32)) (_keys!6450 array!11645) (_values!4357 array!11643) (_vacant!1752 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3406)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11645 (_ BitVec 32)) SeekEntryResult!961)

(assert (=> b!235541 (= lt!119195 (seekEntryOrOpen!0 key!932 (_keys!6450 thiss!1504) (mask!10346 thiss!1504)))))

(declare-fun b!235542 () Bool)

(declare-fun res!115503 () Bool)

(assert (=> b!235542 (=> (not res!115503) (not e!152962))))

(assert (=> b!235542 (= res!115503 (and (= (size!5870 (_values!4357 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10346 thiss!1504))) (= (size!5871 (_keys!6450 thiss!1504)) (size!5870 (_values!4357 thiss!1504))) (bvsge (mask!10346 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4111 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4111 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235543 () Bool)

(declare-fun e!152961 () Bool)

(declare-fun tp_is_empty!6193 () Bool)

(assert (=> b!235543 (= e!152961 tp_is_empty!6193)))

(declare-fun b!235544 () Bool)

(declare-fun e!152964 () Bool)

(assert (=> b!235544 (= e!152964 (and e!152961 mapRes!10487))))

(declare-fun condMapEmpty!10487 () Bool)

(declare-fun mapDefault!10487 () ValueCell!2753)

(assert (=> b!235544 (= condMapEmpty!10487 (= (arr!5533 (_values!4357 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2753)) mapDefault!10487)))))

(declare-fun mapNonEmpty!10487 () Bool)

(declare-fun tp!22163 () Bool)

(declare-fun e!152959 () Bool)

(assert (=> mapNonEmpty!10487 (= mapRes!10487 (and tp!22163 e!152959))))

(declare-fun mapValue!10487 () ValueCell!2753)

(declare-fun mapRest!10487 () (Array (_ BitVec 32) ValueCell!2753))

(declare-fun mapKey!10487 () (_ BitVec 32))

(assert (=> mapNonEmpty!10487 (= (arr!5533 (_values!4357 thiss!1504)) (store mapRest!10487 mapKey!10487 mapValue!10487))))

(declare-fun b!235545 () Bool)

(declare-fun res!115498 () Bool)

(assert (=> b!235545 (=> (not res!115498) (not e!152962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235545 (= res!115498 (validMask!0 (mask!10346 thiss!1504)))))

(declare-fun b!235546 () Bool)

(declare-fun res!115497 () Bool)

(assert (=> b!235546 (=> (not res!115497) (not e!152962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11645 (_ BitVec 32)) Bool)

(assert (=> b!235546 (= res!115497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6450 thiss!1504) (mask!10346 thiss!1504)))))

(declare-fun b!235547 () Bool)

(assert (=> b!235547 (= e!152959 tp_is_empty!6193)))

(declare-fun e!152960 () Bool)

(declare-fun array_inv!3635 (array!11645) Bool)

(declare-fun array_inv!3636 (array!11643) Bool)

(assert (=> b!235548 (= e!152960 (and tp!22162 tp_is_empty!6193 (array_inv!3635 (_keys!6450 thiss!1504)) (array_inv!3636 (_values!4357 thiss!1504)) e!152964))))

(declare-fun b!235549 () Bool)

(declare-fun res!115502 () Bool)

(assert (=> b!235549 (=> (not res!115502) (not e!152963))))

(assert (=> b!235549 (= res!115502 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!115500 () Bool)

(assert (=> start!22530 (=> (not res!115500) (not e!152963))))

(declare-fun valid!1358 (LongMapFixedSize!3406) Bool)

(assert (=> start!22530 (= res!115500 (valid!1358 thiss!1504))))

(assert (=> start!22530 e!152963))

(assert (=> start!22530 e!152960))

(assert (=> start!22530 true))

(declare-fun b!235550 () Bool)

(declare-fun res!115501 () Bool)

(assert (=> b!235550 (=> (not res!115501) (not e!152962))))

(declare-datatypes ((tuple2!4562 0))(
  ( (tuple2!4563 (_1!2292 (_ BitVec 64)) (_2!2292 V!7905)) )
))
(declare-datatypes ((List!3461 0))(
  ( (Nil!3458) (Cons!3457 (h!4109 tuple2!4562) (t!8428 List!3461)) )
))
(declare-datatypes ((ListLongMap!3477 0))(
  ( (ListLongMap!3478 (toList!1754 List!3461)) )
))
(declare-fun contains!1645 (ListLongMap!3477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1286 (array!11645 array!11643 (_ BitVec 32) (_ BitVec 32) V!7905 V!7905 (_ BitVec 32) Int) ListLongMap!3477)

(assert (=> b!235550 (= res!115501 (contains!1645 (getCurrentListMap!1286 (_keys!6450 thiss!1504) (_values!4357 thiss!1504) (mask!10346 thiss!1504) (extraKeys!4111 thiss!1504) (zeroValue!4215 thiss!1504) (minValue!4215 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4374 thiss!1504)) key!932))))

(declare-fun b!235551 () Bool)

(assert (=> b!235551 (= e!152962 false)))

(declare-fun lt!119196 () Bool)

(declare-datatypes ((List!3462 0))(
  ( (Nil!3459) (Cons!3458 (h!4110 (_ BitVec 64)) (t!8429 List!3462)) )
))
(declare-fun arrayNoDuplicates!0 (array!11645 (_ BitVec 32) List!3462) Bool)

(assert (=> b!235551 (= lt!119196 (arrayNoDuplicates!0 (_keys!6450 thiss!1504) #b00000000000000000000000000000000 Nil!3459))))

(assert (= (and start!22530 res!115500) b!235549))

(assert (= (and b!235549 res!115502) b!235541))

(assert (= (and b!235541 res!115499) b!235550))

(assert (= (and b!235550 res!115501) b!235545))

(assert (= (and b!235545 res!115498) b!235542))

(assert (= (and b!235542 res!115503) b!235546))

(assert (= (and b!235546 res!115497) b!235551))

(assert (= (and b!235544 condMapEmpty!10487) mapIsEmpty!10487))

(assert (= (and b!235544 (not condMapEmpty!10487)) mapNonEmpty!10487))

(get-info :version)

(assert (= (and mapNonEmpty!10487 ((_ is ValueCellFull!2753) mapValue!10487)) b!235547))

(assert (= (and b!235544 ((_ is ValueCellFull!2753) mapDefault!10487)) b!235543))

(assert (= b!235548 b!235544))

(assert (= start!22530 b!235548))

(declare-fun m!256775 () Bool)

(assert (=> b!235550 m!256775))

(assert (=> b!235550 m!256775))

(declare-fun m!256777 () Bool)

(assert (=> b!235550 m!256777))

(declare-fun m!256779 () Bool)

(assert (=> b!235551 m!256779))

(declare-fun m!256781 () Bool)

(assert (=> b!235546 m!256781))

(declare-fun m!256783 () Bool)

(assert (=> mapNonEmpty!10487 m!256783))

(declare-fun m!256785 () Bool)

(assert (=> b!235548 m!256785))

(declare-fun m!256787 () Bool)

(assert (=> b!235548 m!256787))

(declare-fun m!256789 () Bool)

(assert (=> b!235541 m!256789))

(declare-fun m!256791 () Bool)

(assert (=> b!235545 m!256791))

(declare-fun m!256793 () Bool)

(assert (=> start!22530 m!256793))

(check-sat tp_is_empty!6193 (not b!235550) (not b!235545) b_and!13275 (not b!235546) (not mapNonEmpty!10487) (not b!235548) (not start!22530) (not b!235541) (not b!235551) (not b_next!6331))
(check-sat b_and!13275 (not b_next!6331))
