; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21712 () Bool)

(assert start!21712)

(declare-fun b!218205 () Bool)

(declare-fun b_free!5857 () Bool)

(declare-fun b_next!5857 () Bool)

(assert (=> b!218205 (= b_free!5857 (not b_next!5857))))

(declare-fun tp!20705 () Bool)

(declare-fun b_and!12761 () Bool)

(assert (=> b!218205 (= tp!20705 b_and!12761)))

(declare-fun b!218199 () Bool)

(declare-fun e!141936 () Bool)

(declare-fun tp_is_empty!5719 () Bool)

(assert (=> b!218199 (= e!141936 tp_is_empty!5719)))

(declare-fun b!218200 () Bool)

(declare-fun e!141931 () Bool)

(declare-fun mapRes!9741 () Bool)

(assert (=> b!218200 (= e!141931 (and e!141936 mapRes!9741))))

(declare-fun condMapEmpty!9741 () Bool)

(declare-datatypes ((V!7273 0))(
  ( (V!7274 (val!2904 Int)) )
))
(declare-datatypes ((ValueCell!2516 0))(
  ( (ValueCellFull!2516 (v!4923 V!7273)) (EmptyCell!2516) )
))
(declare-datatypes ((array!10675 0))(
  ( (array!10676 (arr!5059 (Array (_ BitVec 32) ValueCell!2516)) (size!5391 (_ BitVec 32))) )
))
(declare-datatypes ((array!10677 0))(
  ( (array!10678 (arr!5060 (Array (_ BitVec 32) (_ BitVec 64))) (size!5392 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2932 0))(
  ( (LongMapFixedSize!2933 (defaultEntry!4116 Int) (mask!9887 (_ BitVec 32)) (extraKeys!3853 (_ BitVec 32)) (zeroValue!3957 V!7273) (minValue!3957 V!7273) (_size!1515 (_ BitVec 32)) (_keys!6165 array!10677) (_values!4099 array!10675) (_vacant!1515 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2932)

(declare-fun mapDefault!9741 () ValueCell!2516)

(assert (=> b!218200 (= condMapEmpty!9741 (= (arr!5059 (_values!4099 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2516)) mapDefault!9741)))))

(declare-fun b!218202 () Bool)

(declare-fun e!141935 () Bool)

(assert (=> b!218202 (= e!141935 false)))

(declare-fun lt!111536 () Bool)

(declare-datatypes ((List!3138 0))(
  ( (Nil!3135) (Cons!3134 (h!3781 (_ BitVec 64)) (t!8085 List!3138)) )
))
(declare-fun arrayNoDuplicates!0 (array!10677 (_ BitVec 32) List!3138) Bool)

(assert (=> b!218202 (= lt!111536 (arrayNoDuplicates!0 (_keys!6165 thiss!1504) #b00000000000000000000000000000000 Nil!3135))))

(declare-fun b!218203 () Bool)

(declare-fun res!106945 () Bool)

(declare-fun e!141932 () Bool)

(assert (=> b!218203 (=> (not res!106945) (not e!141932))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218203 (= res!106945 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218204 () Bool)

(declare-fun res!106948 () Bool)

(assert (=> b!218204 (=> (not res!106948) (not e!141935))))

(assert (=> b!218204 (= res!106948 (and (= (size!5391 (_values!4099 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9887 thiss!1504))) (= (size!5392 (_keys!6165 thiss!1504)) (size!5391 (_values!4099 thiss!1504))) (bvsge (mask!9887 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3853 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3853 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!141934 () Bool)

(declare-fun array_inv!3325 (array!10677) Bool)

(declare-fun array_inv!3326 (array!10675) Bool)

(assert (=> b!218205 (= e!141934 (and tp!20705 tp_is_empty!5719 (array_inv!3325 (_keys!6165 thiss!1504)) (array_inv!3326 (_values!4099 thiss!1504)) e!141931))))

(declare-fun mapIsEmpty!9741 () Bool)

(assert (=> mapIsEmpty!9741 mapRes!9741))

(declare-fun b!218206 () Bool)

(declare-fun res!106950 () Bool)

(assert (=> b!218206 (=> (not res!106950) (not e!141935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218206 (= res!106950 (validMask!0 (mask!9887 thiss!1504)))))

(declare-fun mapNonEmpty!9741 () Bool)

(declare-fun tp!20706 () Bool)

(declare-fun e!141937 () Bool)

(assert (=> mapNonEmpty!9741 (= mapRes!9741 (and tp!20706 e!141937))))

(declare-fun mapKey!9741 () (_ BitVec 32))

(declare-fun mapValue!9741 () ValueCell!2516)

(declare-fun mapRest!9741 () (Array (_ BitVec 32) ValueCell!2516))

(assert (=> mapNonEmpty!9741 (= (arr!5059 (_values!4099 thiss!1504)) (store mapRest!9741 mapKey!9741 mapValue!9741))))

(declare-fun b!218207 () Bool)

(declare-fun res!106947 () Bool)

(assert (=> b!218207 (=> (not res!106947) (not e!141935))))

(declare-datatypes ((tuple2!4238 0))(
  ( (tuple2!4239 (_1!2130 (_ BitVec 64)) (_2!2130 V!7273)) )
))
(declare-datatypes ((List!3139 0))(
  ( (Nil!3136) (Cons!3135 (h!3782 tuple2!4238) (t!8086 List!3139)) )
))
(declare-datatypes ((ListLongMap!3153 0))(
  ( (ListLongMap!3154 (toList!1592 List!3139)) )
))
(declare-fun contains!1447 (ListLongMap!3153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1124 (array!10677 array!10675 (_ BitVec 32) (_ BitVec 32) V!7273 V!7273 (_ BitVec 32) Int) ListLongMap!3153)

(assert (=> b!218207 (= res!106947 (not (contains!1447 (getCurrentListMap!1124 (_keys!6165 thiss!1504) (_values!4099 thiss!1504) (mask!9887 thiss!1504) (extraKeys!3853 thiss!1504) (zeroValue!3957 thiss!1504) (minValue!3957 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4116 thiss!1504)) key!932)))))

(declare-fun b!218201 () Bool)

(assert (=> b!218201 (= e!141932 e!141935)))

(declare-fun res!106944 () Bool)

(assert (=> b!218201 (=> (not res!106944) (not e!141935))))

(declare-datatypes ((SeekEntryResult!761 0))(
  ( (MissingZero!761 (index!5214 (_ BitVec 32))) (Found!761 (index!5215 (_ BitVec 32))) (Intermediate!761 (undefined!1573 Bool) (index!5216 (_ BitVec 32)) (x!22793 (_ BitVec 32))) (Undefined!761) (MissingVacant!761 (index!5217 (_ BitVec 32))) )
))
(declare-fun lt!111535 () SeekEntryResult!761)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218201 (= res!106944 (or (= lt!111535 (MissingZero!761 index!297)) (= lt!111535 (MissingVacant!761 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10677 (_ BitVec 32)) SeekEntryResult!761)

(assert (=> b!218201 (= lt!111535 (seekEntryOrOpen!0 key!932 (_keys!6165 thiss!1504) (mask!9887 thiss!1504)))))

(declare-fun res!106949 () Bool)

(assert (=> start!21712 (=> (not res!106949) (not e!141932))))

(declare-fun valid!1202 (LongMapFixedSize!2932) Bool)

(assert (=> start!21712 (= res!106949 (valid!1202 thiss!1504))))

(assert (=> start!21712 e!141932))

(assert (=> start!21712 e!141934))

(assert (=> start!21712 true))

(declare-fun b!218208 () Bool)

(assert (=> b!218208 (= e!141937 tp_is_empty!5719)))

(declare-fun b!218209 () Bool)

(declare-fun res!106946 () Bool)

(assert (=> b!218209 (=> (not res!106946) (not e!141935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10677 (_ BitVec 32)) Bool)

(assert (=> b!218209 (= res!106946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6165 thiss!1504) (mask!9887 thiss!1504)))))

(assert (= (and start!21712 res!106949) b!218203))

(assert (= (and b!218203 res!106945) b!218201))

(assert (= (and b!218201 res!106944) b!218207))

(assert (= (and b!218207 res!106947) b!218206))

(assert (= (and b!218206 res!106950) b!218204))

(assert (= (and b!218204 res!106948) b!218209))

(assert (= (and b!218209 res!106946) b!218202))

(assert (= (and b!218200 condMapEmpty!9741) mapIsEmpty!9741))

(assert (= (and b!218200 (not condMapEmpty!9741)) mapNonEmpty!9741))

(get-info :version)

(assert (= (and mapNonEmpty!9741 ((_ is ValueCellFull!2516) mapValue!9741)) b!218208))

(assert (= (and b!218200 ((_ is ValueCellFull!2516) mapDefault!9741)) b!218199))

(assert (= b!218205 b!218200))

(assert (= start!21712 b!218205))

(declare-fun m!244371 () Bool)

(assert (=> b!218207 m!244371))

(assert (=> b!218207 m!244371))

(declare-fun m!244373 () Bool)

(assert (=> b!218207 m!244373))

(declare-fun m!244375 () Bool)

(assert (=> b!218202 m!244375))

(declare-fun m!244377 () Bool)

(assert (=> b!218201 m!244377))

(declare-fun m!244379 () Bool)

(assert (=> b!218206 m!244379))

(declare-fun m!244381 () Bool)

(assert (=> b!218205 m!244381))

(declare-fun m!244383 () Bool)

(assert (=> b!218205 m!244383))

(declare-fun m!244385 () Bool)

(assert (=> start!21712 m!244385))

(declare-fun m!244387 () Bool)

(assert (=> b!218209 m!244387))

(declare-fun m!244389 () Bool)

(assert (=> mapNonEmpty!9741 m!244389))

(check-sat (not b!218201) (not b!218202) b_and!12761 (not b!218206) (not b_next!5857) (not b!218207) (not start!21712) (not b!218209) (not mapNonEmpty!9741) (not b!218205) tp_is_empty!5719)
(check-sat b_and!12761 (not b_next!5857))
