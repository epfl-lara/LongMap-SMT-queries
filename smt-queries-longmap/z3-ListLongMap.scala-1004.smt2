; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21628 () Bool)

(assert start!21628)

(declare-fun b!216818 () Bool)

(declare-fun b_free!5773 () Bool)

(declare-fun b_next!5773 () Bool)

(assert (=> b!216818 (= b_free!5773 (not b_next!5773))))

(declare-fun tp!20453 () Bool)

(declare-fun b_and!12677 () Bool)

(assert (=> b!216818 (= tp!20453 b_and!12677)))

(declare-fun b!216813 () Bool)

(declare-fun e!141052 () Bool)

(declare-fun tp_is_empty!5635 () Bool)

(assert (=> b!216813 (= e!141052 tp_is_empty!5635)))

(declare-fun mapIsEmpty!9615 () Bool)

(declare-fun mapRes!9615 () Bool)

(assert (=> mapIsEmpty!9615 mapRes!9615))

(declare-fun b!216814 () Bool)

(declare-fun e!141053 () Bool)

(declare-fun e!141049 () Bool)

(assert (=> b!216814 (= e!141053 e!141049)))

(declare-fun res!106065 () Bool)

(assert (=> b!216814 (=> (not res!106065) (not e!141049))))

(declare-datatypes ((SeekEntryResult!735 0))(
  ( (MissingZero!735 (index!5110 (_ BitVec 32))) (Found!735 (index!5111 (_ BitVec 32))) (Intermediate!735 (undefined!1547 Bool) (index!5112 (_ BitVec 32)) (x!22655 (_ BitVec 32))) (Undefined!735) (MissingVacant!735 (index!5113 (_ BitVec 32))) )
))
(declare-fun lt!111284 () SeekEntryResult!735)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216814 (= res!106065 (or (= lt!111284 (MissingZero!735 index!297)) (= lt!111284 (MissingVacant!735 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7161 0))(
  ( (V!7162 (val!2862 Int)) )
))
(declare-datatypes ((ValueCell!2474 0))(
  ( (ValueCellFull!2474 (v!4881 V!7161)) (EmptyCell!2474) )
))
(declare-datatypes ((array!10507 0))(
  ( (array!10508 (arr!4975 (Array (_ BitVec 32) ValueCell!2474)) (size!5307 (_ BitVec 32))) )
))
(declare-datatypes ((array!10509 0))(
  ( (array!10510 (arr!4976 (Array (_ BitVec 32) (_ BitVec 64))) (size!5308 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2848 0))(
  ( (LongMapFixedSize!2849 (defaultEntry!4074 Int) (mask!9817 (_ BitVec 32)) (extraKeys!3811 (_ BitVec 32)) (zeroValue!3915 V!7161) (minValue!3915 V!7161) (_size!1473 (_ BitVec 32)) (_keys!6123 array!10509) (_values!4057 array!10507) (_vacant!1473 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2848)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10509 (_ BitVec 32)) SeekEntryResult!735)

(assert (=> b!216814 (= lt!111284 (seekEntryOrOpen!0 key!932 (_keys!6123 thiss!1504) (mask!9817 thiss!1504)))))

(declare-fun res!106067 () Bool)

(assert (=> start!21628 (=> (not res!106067) (not e!141053))))

(declare-fun valid!1176 (LongMapFixedSize!2848) Bool)

(assert (=> start!21628 (= res!106067 (valid!1176 thiss!1504))))

(assert (=> start!21628 e!141053))

(declare-fun e!141050 () Bool)

(assert (=> start!21628 e!141050))

(assert (=> start!21628 true))

(declare-fun b!216815 () Bool)

(assert (=> b!216815 (= e!141049 false)))

(declare-fun lt!111283 () Bool)

(declare-datatypes ((List!3086 0))(
  ( (Nil!3083) (Cons!3082 (h!3729 (_ BitVec 64)) (t!8033 List!3086)) )
))
(declare-fun arrayNoDuplicates!0 (array!10509 (_ BitVec 32) List!3086) Bool)

(assert (=> b!216815 (= lt!111283 (arrayNoDuplicates!0 (_keys!6123 thiss!1504) #b00000000000000000000000000000000 Nil!3083))))

(declare-fun b!216816 () Bool)

(declare-fun res!106064 () Bool)

(assert (=> b!216816 (=> (not res!106064) (not e!141049))))

(declare-datatypes ((tuple2!4184 0))(
  ( (tuple2!4185 (_1!2103 (_ BitVec 64)) (_2!2103 V!7161)) )
))
(declare-datatypes ((List!3087 0))(
  ( (Nil!3084) (Cons!3083 (h!3730 tuple2!4184) (t!8034 List!3087)) )
))
(declare-datatypes ((ListLongMap!3099 0))(
  ( (ListLongMap!3100 (toList!1565 List!3087)) )
))
(declare-fun contains!1420 (ListLongMap!3099 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1097 (array!10509 array!10507 (_ BitVec 32) (_ BitVec 32) V!7161 V!7161 (_ BitVec 32) Int) ListLongMap!3099)

(assert (=> b!216816 (= res!106064 (contains!1420 (getCurrentListMap!1097 (_keys!6123 thiss!1504) (_values!4057 thiss!1504) (mask!9817 thiss!1504) (extraKeys!3811 thiss!1504) (zeroValue!3915 thiss!1504) (minValue!3915 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4074 thiss!1504)) key!932))))

(declare-fun b!216817 () Bool)

(declare-fun res!106062 () Bool)

(assert (=> b!216817 (=> (not res!106062) (not e!141049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216817 (= res!106062 (validMask!0 (mask!9817 thiss!1504)))))

(declare-fun e!141051 () Bool)

(declare-fun array_inv!3267 (array!10509) Bool)

(declare-fun array_inv!3268 (array!10507) Bool)

(assert (=> b!216818 (= e!141050 (and tp!20453 tp_is_empty!5635 (array_inv!3267 (_keys!6123 thiss!1504)) (array_inv!3268 (_values!4057 thiss!1504)) e!141051))))

(declare-fun b!216819 () Bool)

(declare-fun res!106068 () Bool)

(assert (=> b!216819 (=> (not res!106068) (not e!141049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10509 (_ BitVec 32)) Bool)

(assert (=> b!216819 (= res!106068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6123 thiss!1504) (mask!9817 thiss!1504)))))

(declare-fun mapNonEmpty!9615 () Bool)

(declare-fun tp!20454 () Bool)

(declare-fun e!141054 () Bool)

(assert (=> mapNonEmpty!9615 (= mapRes!9615 (and tp!20454 e!141054))))

(declare-fun mapKey!9615 () (_ BitVec 32))

(declare-fun mapRest!9615 () (Array (_ BitVec 32) ValueCell!2474))

(declare-fun mapValue!9615 () ValueCell!2474)

(assert (=> mapNonEmpty!9615 (= (arr!4975 (_values!4057 thiss!1504)) (store mapRest!9615 mapKey!9615 mapValue!9615))))

(declare-fun b!216820 () Bool)

(declare-fun res!106063 () Bool)

(assert (=> b!216820 (=> (not res!106063) (not e!141053))))

(assert (=> b!216820 (= res!106063 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216821 () Bool)

(assert (=> b!216821 (= e!141054 tp_is_empty!5635)))

(declare-fun b!216822 () Bool)

(assert (=> b!216822 (= e!141051 (and e!141052 mapRes!9615))))

(declare-fun condMapEmpty!9615 () Bool)

(declare-fun mapDefault!9615 () ValueCell!2474)

(assert (=> b!216822 (= condMapEmpty!9615 (= (arr!4975 (_values!4057 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2474)) mapDefault!9615)))))

(declare-fun b!216823 () Bool)

(declare-fun res!106066 () Bool)

(assert (=> b!216823 (=> (not res!106066) (not e!141049))))

(assert (=> b!216823 (= res!106066 (and (= (size!5307 (_values!4057 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9817 thiss!1504))) (= (size!5308 (_keys!6123 thiss!1504)) (size!5307 (_values!4057 thiss!1504))) (bvsge (mask!9817 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3811 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3811 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!21628 res!106067) b!216820))

(assert (= (and b!216820 res!106063) b!216814))

(assert (= (and b!216814 res!106065) b!216816))

(assert (= (and b!216816 res!106064) b!216817))

(assert (= (and b!216817 res!106062) b!216823))

(assert (= (and b!216823 res!106066) b!216819))

(assert (= (and b!216819 res!106068) b!216815))

(assert (= (and b!216822 condMapEmpty!9615) mapIsEmpty!9615))

(assert (= (and b!216822 (not condMapEmpty!9615)) mapNonEmpty!9615))

(get-info :version)

(assert (= (and mapNonEmpty!9615 ((_ is ValueCellFull!2474) mapValue!9615)) b!216821))

(assert (= (and b!216822 ((_ is ValueCellFull!2474) mapDefault!9615)) b!216813))

(assert (= b!216818 b!216822))

(assert (= start!21628 b!216818))

(declare-fun m!243531 () Bool)

(assert (=> b!216816 m!243531))

(assert (=> b!216816 m!243531))

(declare-fun m!243533 () Bool)

(assert (=> b!216816 m!243533))

(declare-fun m!243535 () Bool)

(assert (=> b!216815 m!243535))

(declare-fun m!243537 () Bool)

(assert (=> mapNonEmpty!9615 m!243537))

(declare-fun m!243539 () Bool)

(assert (=> b!216818 m!243539))

(declare-fun m!243541 () Bool)

(assert (=> b!216818 m!243541))

(declare-fun m!243543 () Bool)

(assert (=> b!216819 m!243543))

(declare-fun m!243545 () Bool)

(assert (=> b!216814 m!243545))

(declare-fun m!243547 () Bool)

(assert (=> b!216817 m!243547))

(declare-fun m!243549 () Bool)

(assert (=> start!21628 m!243549))

(check-sat tp_is_empty!5635 (not b!216817) (not b!216819) (not b!216816) (not b!216818) (not b!216815) (not b!216814) (not b_next!5773) b_and!12677 (not mapNonEmpty!9615) (not start!21628))
(check-sat b_and!12677 (not b_next!5773))
