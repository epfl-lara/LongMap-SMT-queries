; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22904 () Bool)

(assert start!22904)

(declare-fun b!238583 () Bool)

(declare-fun b_free!6403 () Bool)

(declare-fun b_next!6403 () Bool)

(assert (=> b!238583 (= b_free!6403 (not b_next!6403))))

(declare-fun tp!22412 () Bool)

(declare-fun b_and!13383 () Bool)

(assert (=> b!238583 (= tp!22412 b_and!13383)))

(declare-fun b!238579 () Bool)

(declare-fun e!154892 () Bool)

(declare-fun e!154894 () Bool)

(assert (=> b!238579 (= e!154892 e!154894)))

(declare-fun res!116914 () Bool)

(assert (=> b!238579 (=> (not res!116914) (not e!154894))))

(declare-datatypes ((SeekEntryResult!988 0))(
  ( (MissingZero!988 (index!6122 (_ BitVec 32))) (Found!988 (index!6123 (_ BitVec 32))) (Intermediate!988 (undefined!1800 Bool) (index!6124 (_ BitVec 32)) (x!24020 (_ BitVec 32))) (Undefined!988) (MissingVacant!988 (index!6125 (_ BitVec 32))) )
))
(declare-fun lt!120668 () SeekEntryResult!988)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238579 (= res!116914 (or (= lt!120668 (MissingZero!988 index!297)) (= lt!120668 (MissingVacant!988 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8001 0))(
  ( (V!8002 (val!3177 Int)) )
))
(declare-datatypes ((ValueCell!2789 0))(
  ( (ValueCellFull!2789 (v!5216 V!8001)) (EmptyCell!2789) )
))
(declare-datatypes ((array!11807 0))(
  ( (array!11808 (arr!5605 (Array (_ BitVec 32) ValueCell!2789)) (size!5946 (_ BitVec 32))) )
))
(declare-datatypes ((array!11809 0))(
  ( (array!11810 (arr!5606 (Array (_ BitVec 32) (_ BitVec 64))) (size!5947 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3478 0))(
  ( (LongMapFixedSize!3479 (defaultEntry!4424 Int) (mask!10460 (_ BitVec 32)) (extraKeys!4161 (_ BitVec 32)) (zeroValue!4265 V!8001) (minValue!4265 V!8001) (_size!1788 (_ BitVec 32)) (_keys!6526 array!11809) (_values!4407 array!11807) (_vacant!1788 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3478)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11809 (_ BitVec 32)) SeekEntryResult!988)

(assert (=> b!238579 (= lt!120668 (seekEntryOrOpen!0 key!932 (_keys!6526 thiss!1504) (mask!10460 thiss!1504)))))

(declare-fun mapNonEmpty!10629 () Bool)

(declare-fun mapRes!10629 () Bool)

(declare-fun tp!22413 () Bool)

(declare-fun e!154895 () Bool)

(assert (=> mapNonEmpty!10629 (= mapRes!10629 (and tp!22413 e!154895))))

(declare-fun mapRest!10629 () (Array (_ BitVec 32) ValueCell!2789))

(declare-fun mapKey!10629 () (_ BitVec 32))

(declare-fun mapValue!10629 () ValueCell!2789)

(assert (=> mapNonEmpty!10629 (= (arr!5605 (_values!4407 thiss!1504)) (store mapRest!10629 mapKey!10629 mapValue!10629))))

(declare-fun mapIsEmpty!10629 () Bool)

(assert (=> mapIsEmpty!10629 mapRes!10629))

(declare-fun b!238580 () Bool)

(declare-fun res!116909 () Bool)

(assert (=> b!238580 (=> (not res!116909) (not e!154894))))

(declare-datatypes ((tuple2!4610 0))(
  ( (tuple2!4611 (_1!2316 (_ BitVec 64)) (_2!2316 V!8001)) )
))
(declare-datatypes ((List!3500 0))(
  ( (Nil!3497) (Cons!3496 (h!4152 tuple2!4610) (t!8487 List!3500)) )
))
(declare-datatypes ((ListLongMap!3525 0))(
  ( (ListLongMap!3526 (toList!1778 List!3500)) )
))
(declare-fun contains!1680 (ListLongMap!3525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1310 (array!11809 array!11807 (_ BitVec 32) (_ BitVec 32) V!8001 V!8001 (_ BitVec 32) Int) ListLongMap!3525)

(assert (=> b!238580 (= res!116909 (not (contains!1680 (getCurrentListMap!1310 (_keys!6526 thiss!1504) (_values!4407 thiss!1504) (mask!10460 thiss!1504) (extraKeys!4161 thiss!1504) (zeroValue!4265 thiss!1504) (minValue!4265 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4424 thiss!1504)) key!932)))))

(declare-fun b!238581 () Bool)

(declare-fun e!154890 () Bool)

(declare-fun e!154891 () Bool)

(assert (=> b!238581 (= e!154890 (and e!154891 mapRes!10629))))

(declare-fun condMapEmpty!10629 () Bool)

(declare-fun mapDefault!10629 () ValueCell!2789)

(assert (=> b!238581 (= condMapEmpty!10629 (= (arr!5605 (_values!4407 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2789)) mapDefault!10629)))))

(declare-fun b!238582 () Bool)

(declare-fun res!116915 () Bool)

(assert (=> b!238582 (=> (not res!116915) (not e!154894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11809 (_ BitVec 32)) Bool)

(assert (=> b!238582 (= res!116915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6526 thiss!1504) (mask!10460 thiss!1504)))))

(declare-fun e!154893 () Bool)

(declare-fun tp_is_empty!6265 () Bool)

(declare-fun array_inv!3683 (array!11809) Bool)

(declare-fun array_inv!3684 (array!11807) Bool)

(assert (=> b!238583 (= e!154893 (and tp!22412 tp_is_empty!6265 (array_inv!3683 (_keys!6526 thiss!1504)) (array_inv!3684 (_values!4407 thiss!1504)) e!154890))))

(declare-fun b!238584 () Bool)

(assert (=> b!238584 (= e!154895 tp_is_empty!6265)))

(declare-fun b!238585 () Bool)

(assert (=> b!238585 (= e!154894 false)))

(declare-fun lt!120667 () Bool)

(declare-datatypes ((List!3501 0))(
  ( (Nil!3498) (Cons!3497 (h!4153 (_ BitVec 64)) (t!8488 List!3501)) )
))
(declare-fun arrayNoDuplicates!0 (array!11809 (_ BitVec 32) List!3501) Bool)

(assert (=> b!238585 (= lt!120667 (arrayNoDuplicates!0 (_keys!6526 thiss!1504) #b00000000000000000000000000000000 Nil!3498))))

(declare-fun res!116910 () Bool)

(assert (=> start!22904 (=> (not res!116910) (not e!154892))))

(declare-fun valid!1385 (LongMapFixedSize!3478) Bool)

(assert (=> start!22904 (= res!116910 (valid!1385 thiss!1504))))

(assert (=> start!22904 e!154892))

(assert (=> start!22904 e!154893))

(assert (=> start!22904 true))

(declare-fun b!238586 () Bool)

(declare-fun res!116911 () Bool)

(assert (=> b!238586 (=> (not res!116911) (not e!154894))))

(assert (=> b!238586 (= res!116911 (and (= (size!5946 (_values!4407 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10460 thiss!1504))) (= (size!5947 (_keys!6526 thiss!1504)) (size!5946 (_values!4407 thiss!1504))) (bvsge (mask!10460 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4161 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4161 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238587 () Bool)

(assert (=> b!238587 (= e!154891 tp_is_empty!6265)))

(declare-fun b!238588 () Bool)

(declare-fun res!116913 () Bool)

(assert (=> b!238588 (=> (not res!116913) (not e!154894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238588 (= res!116913 (validMask!0 (mask!10460 thiss!1504)))))

(declare-fun b!238589 () Bool)

(declare-fun res!116912 () Bool)

(assert (=> b!238589 (=> (not res!116912) (not e!154892))))

(assert (=> b!238589 (= res!116912 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22904 res!116910) b!238589))

(assert (= (and b!238589 res!116912) b!238579))

(assert (= (and b!238579 res!116914) b!238580))

(assert (= (and b!238580 res!116909) b!238588))

(assert (= (and b!238588 res!116913) b!238586))

(assert (= (and b!238586 res!116911) b!238582))

(assert (= (and b!238582 res!116915) b!238585))

(assert (= (and b!238581 condMapEmpty!10629) mapIsEmpty!10629))

(assert (= (and b!238581 (not condMapEmpty!10629)) mapNonEmpty!10629))

(get-info :version)

(assert (= (and mapNonEmpty!10629 ((_ is ValueCellFull!2789) mapValue!10629)) b!238584))

(assert (= (and b!238581 ((_ is ValueCellFull!2789) mapDefault!10629)) b!238587))

(assert (= b!238583 b!238581))

(assert (= start!22904 b!238583))

(declare-fun m!259231 () Bool)

(assert (=> b!238582 m!259231))

(declare-fun m!259233 () Bool)

(assert (=> b!238580 m!259233))

(assert (=> b!238580 m!259233))

(declare-fun m!259235 () Bool)

(assert (=> b!238580 m!259235))

(declare-fun m!259237 () Bool)

(assert (=> mapNonEmpty!10629 m!259237))

(declare-fun m!259239 () Bool)

(assert (=> b!238583 m!259239))

(declare-fun m!259241 () Bool)

(assert (=> b!238583 m!259241))

(declare-fun m!259243 () Bool)

(assert (=> b!238585 m!259243))

(declare-fun m!259245 () Bool)

(assert (=> b!238588 m!259245))

(declare-fun m!259247 () Bool)

(assert (=> b!238579 m!259247))

(declare-fun m!259249 () Bool)

(assert (=> start!22904 m!259249))

(check-sat (not start!22904) (not b!238579) (not b!238583) (not mapNonEmpty!10629) (not b_next!6403) (not b!238580) (not b!238582) tp_is_empty!6265 b_and!13383 (not b!238588) (not b!238585))
(check-sat b_and!13383 (not b_next!6403))
