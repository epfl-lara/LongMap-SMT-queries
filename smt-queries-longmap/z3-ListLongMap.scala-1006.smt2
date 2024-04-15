; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21640 () Bool)

(assert start!21640)

(declare-fun b!216820 () Bool)

(declare-fun b_free!5785 () Bool)

(declare-fun b_next!5785 () Bool)

(assert (=> b!216820 (= b_free!5785 (not b_next!5785))))

(declare-fun tp!20489 () Bool)

(declare-fun b_and!12649 () Bool)

(assert (=> b!216820 (= tp!20489 b_and!12649)))

(declare-fun b!216817 () Bool)

(declare-fun res!106072 () Bool)

(declare-fun e!141055 () Bool)

(assert (=> b!216817 (=> (not res!106072) (not e!141055))))

(declare-datatypes ((V!7177 0))(
  ( (V!7178 (val!2868 Int)) )
))
(declare-datatypes ((ValueCell!2480 0))(
  ( (ValueCellFull!2480 (v!4880 V!7177)) (EmptyCell!2480) )
))
(declare-datatypes ((array!10525 0))(
  ( (array!10526 (arr!4983 (Array (_ BitVec 32) ValueCell!2480)) (size!5316 (_ BitVec 32))) )
))
(declare-datatypes ((array!10527 0))(
  ( (array!10528 (arr!4984 (Array (_ BitVec 32) (_ BitVec 64))) (size!5317 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2860 0))(
  ( (LongMapFixedSize!2861 (defaultEntry!4080 Int) (mask!9826 (_ BitVec 32)) (extraKeys!3817 (_ BitVec 32)) (zeroValue!3921 V!7177) (minValue!3921 V!7177) (_size!1479 (_ BitVec 32)) (_keys!6128 array!10527) (_values!4063 array!10525) (_vacant!1479 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2860)

(assert (=> b!216817 (= res!106072 (and (= (size!5316 (_values!4063 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9826 thiss!1504))) (= (size!5317 (_keys!6128 thiss!1504)) (size!5316 (_values!4063 thiss!1504))) (bvsge (mask!9826 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3817 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3817 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!216818 () Bool)

(declare-fun res!106078 () Bool)

(assert (=> b!216818 (=> (not res!106078) (not e!141055))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4226 0))(
  ( (tuple2!4227 (_1!2124 (_ BitVec 64)) (_2!2124 V!7177)) )
))
(declare-datatypes ((List!3151 0))(
  ( (Nil!3148) (Cons!3147 (h!3794 tuple2!4226) (t!8097 List!3151)) )
))
(declare-datatypes ((ListLongMap!3129 0))(
  ( (ListLongMap!3130 (toList!1580 List!3151)) )
))
(declare-fun contains!1421 (ListLongMap!3129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1089 (array!10527 array!10525 (_ BitVec 32) (_ BitVec 32) V!7177 V!7177 (_ BitVec 32) Int) ListLongMap!3129)

(assert (=> b!216818 (= res!106078 (contains!1421 (getCurrentListMap!1089 (_keys!6128 thiss!1504) (_values!4063 thiss!1504) (mask!9826 thiss!1504) (extraKeys!3817 thiss!1504) (zeroValue!3921 thiss!1504) (minValue!3921 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4080 thiss!1504)) key!932))))

(declare-fun b!216819 () Bool)

(declare-fun e!141054 () Bool)

(declare-fun e!141053 () Bool)

(declare-fun mapRes!9633 () Bool)

(assert (=> b!216819 (= e!141054 (and e!141053 mapRes!9633))))

(declare-fun condMapEmpty!9633 () Bool)

(declare-fun mapDefault!9633 () ValueCell!2480)

(assert (=> b!216819 (= condMapEmpty!9633 (= (arr!4983 (_values!4063 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2480)) mapDefault!9633)))))

(declare-fun tp_is_empty!5647 () Bool)

(declare-fun e!141052 () Bool)

(declare-fun array_inv!3279 (array!10527) Bool)

(declare-fun array_inv!3280 (array!10525) Bool)

(assert (=> b!216820 (= e!141052 (and tp!20489 tp_is_empty!5647 (array_inv!3279 (_keys!6128 thiss!1504)) (array_inv!3280 (_values!4063 thiss!1504)) e!141054))))

(declare-fun b!216821 () Bool)

(declare-fun res!106075 () Bool)

(assert (=> b!216821 (=> (not res!106075) (not e!141055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10527 (_ BitVec 32)) Bool)

(assert (=> b!216821 (= res!106075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6128 thiss!1504) (mask!9826 thiss!1504)))))

(declare-fun mapIsEmpty!9633 () Bool)

(assert (=> mapIsEmpty!9633 mapRes!9633))

(declare-fun mapNonEmpty!9633 () Bool)

(declare-fun tp!20490 () Bool)

(declare-fun e!141051 () Bool)

(assert (=> mapNonEmpty!9633 (= mapRes!9633 (and tp!20490 e!141051))))

(declare-fun mapValue!9633 () ValueCell!2480)

(declare-fun mapRest!9633 () (Array (_ BitVec 32) ValueCell!2480))

(declare-fun mapKey!9633 () (_ BitVec 32))

(assert (=> mapNonEmpty!9633 (= (arr!4983 (_values!4063 thiss!1504)) (store mapRest!9633 mapKey!9633 mapValue!9633))))

(declare-fun res!106076 () Bool)

(declare-fun e!141050 () Bool)

(assert (=> start!21640 (=> (not res!106076) (not e!141050))))

(declare-fun valid!1179 (LongMapFixedSize!2860) Bool)

(assert (=> start!21640 (= res!106076 (valid!1179 thiss!1504))))

(assert (=> start!21640 e!141050))

(assert (=> start!21640 e!141052))

(assert (=> start!21640 true))

(declare-fun b!216822 () Bool)

(assert (=> b!216822 (= e!141053 tp_is_empty!5647)))

(declare-fun b!216823 () Bool)

(declare-fun res!106077 () Bool)

(assert (=> b!216823 (=> (not res!106077) (not e!141055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216823 (= res!106077 (validMask!0 (mask!9826 thiss!1504)))))

(declare-fun b!216824 () Bool)

(assert (=> b!216824 (= e!141051 tp_is_empty!5647)))

(declare-fun b!216825 () Bool)

(assert (=> b!216825 (= e!141050 e!141055)))

(declare-fun res!106073 () Bool)

(assert (=> b!216825 (=> (not res!106073) (not e!141055))))

(declare-datatypes ((SeekEntryResult!749 0))(
  ( (MissingZero!749 (index!5166 (_ BitVec 32))) (Found!749 (index!5167 (_ BitVec 32))) (Intermediate!749 (undefined!1561 Bool) (index!5168 (_ BitVec 32)) (x!22684 (_ BitVec 32))) (Undefined!749) (MissingVacant!749 (index!5169 (_ BitVec 32))) )
))
(declare-fun lt!111079 () SeekEntryResult!749)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216825 (= res!106073 (or (= lt!111079 (MissingZero!749 index!297)) (= lt!111079 (MissingVacant!749 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10527 (_ BitVec 32)) SeekEntryResult!749)

(assert (=> b!216825 (= lt!111079 (seekEntryOrOpen!0 key!932 (_keys!6128 thiss!1504) (mask!9826 thiss!1504)))))

(declare-fun b!216826 () Bool)

(assert (=> b!216826 (= e!141055 false)))

(declare-fun lt!111080 () Bool)

(declare-datatypes ((List!3152 0))(
  ( (Nil!3149) (Cons!3148 (h!3795 (_ BitVec 64)) (t!8098 List!3152)) )
))
(declare-fun arrayNoDuplicates!0 (array!10527 (_ BitVec 32) List!3152) Bool)

(assert (=> b!216826 (= lt!111080 (arrayNoDuplicates!0 (_keys!6128 thiss!1504) #b00000000000000000000000000000000 Nil!3149))))

(declare-fun b!216827 () Bool)

(declare-fun res!106074 () Bool)

(assert (=> b!216827 (=> (not res!106074) (not e!141050))))

(assert (=> b!216827 (= res!106074 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!21640 res!106076) b!216827))

(assert (= (and b!216827 res!106074) b!216825))

(assert (= (and b!216825 res!106073) b!216818))

(assert (= (and b!216818 res!106078) b!216823))

(assert (= (and b!216823 res!106077) b!216817))

(assert (= (and b!216817 res!106072) b!216821))

(assert (= (and b!216821 res!106075) b!216826))

(assert (= (and b!216819 condMapEmpty!9633) mapIsEmpty!9633))

(assert (= (and b!216819 (not condMapEmpty!9633)) mapNonEmpty!9633))

(get-info :version)

(assert (= (and mapNonEmpty!9633 ((_ is ValueCellFull!2480) mapValue!9633)) b!216824))

(assert (= (and b!216819 ((_ is ValueCellFull!2480) mapDefault!9633)) b!216822))

(assert (= b!216820 b!216819))

(assert (= start!21640 b!216820))

(declare-fun m!242853 () Bool)

(assert (=> b!216825 m!242853))

(declare-fun m!242855 () Bool)

(assert (=> start!21640 m!242855))

(declare-fun m!242857 () Bool)

(assert (=> b!216818 m!242857))

(assert (=> b!216818 m!242857))

(declare-fun m!242859 () Bool)

(assert (=> b!216818 m!242859))

(declare-fun m!242861 () Bool)

(assert (=> b!216823 m!242861))

(declare-fun m!242863 () Bool)

(assert (=> b!216826 m!242863))

(declare-fun m!242865 () Bool)

(assert (=> b!216821 m!242865))

(declare-fun m!242867 () Bool)

(assert (=> mapNonEmpty!9633 m!242867))

(declare-fun m!242869 () Bool)

(assert (=> b!216820 m!242869))

(declare-fun m!242871 () Bool)

(assert (=> b!216820 m!242871))

(check-sat tp_is_empty!5647 (not b!216820) (not b_next!5785) (not b!216823) (not b!216825) b_and!12649 (not b!216818) (not b!216821) (not mapNonEmpty!9633) (not b!216826) (not start!21640))
(check-sat b_and!12649 (not b_next!5785))
