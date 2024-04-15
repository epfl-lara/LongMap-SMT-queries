; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21712 () Bool)

(assert start!21712)

(declare-fun b!218010 () Bool)

(declare-fun b_free!5857 () Bool)

(declare-fun b_next!5857 () Bool)

(assert (=> b!218010 (= b_free!5857 (not b_next!5857))))

(declare-fun tp!20705 () Bool)

(declare-fun b_and!12721 () Bool)

(assert (=> b!218010 (= tp!20705 b_and!12721)))

(declare-fun b!218005 () Bool)

(declare-fun res!106831 () Bool)

(declare-fun e!141812 () Bool)

(assert (=> b!218005 (=> (not res!106831) (not e!141812))))

(declare-datatypes ((V!7273 0))(
  ( (V!7274 (val!2904 Int)) )
))
(declare-datatypes ((ValueCell!2516 0))(
  ( (ValueCellFull!2516 (v!4916 V!7273)) (EmptyCell!2516) )
))
(declare-datatypes ((array!10669 0))(
  ( (array!10670 (arr!5055 (Array (_ BitVec 32) ValueCell!2516)) (size!5388 (_ BitVec 32))) )
))
(declare-datatypes ((array!10671 0))(
  ( (array!10672 (arr!5056 (Array (_ BitVec 32) (_ BitVec 64))) (size!5389 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2932 0))(
  ( (LongMapFixedSize!2933 (defaultEntry!4116 Int) (mask!9886 (_ BitVec 32)) (extraKeys!3853 (_ BitVec 32)) (zeroValue!3957 V!7273) (minValue!3957 V!7273) (_size!1515 (_ BitVec 32)) (_keys!6164 array!10671) (_values!4099 array!10669) (_vacant!1515 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2932)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218005 (= res!106831 (validMask!0 (mask!9886 thiss!1504)))))

(declare-fun mapIsEmpty!9741 () Bool)

(declare-fun mapRes!9741 () Bool)

(assert (=> mapIsEmpty!9741 mapRes!9741))

(declare-fun b!218006 () Bool)

(assert (=> b!218006 (= e!141812 false)))

(declare-fun lt!111295 () Bool)

(declare-datatypes ((List!3201 0))(
  ( (Nil!3198) (Cons!3197 (h!3844 (_ BitVec 64)) (t!8147 List!3201)) )
))
(declare-fun arrayNoDuplicates!0 (array!10671 (_ BitVec 32) List!3201) Bool)

(assert (=> b!218006 (= lt!111295 (arrayNoDuplicates!0 (_keys!6164 thiss!1504) #b00000000000000000000000000000000 Nil!3198))))

(declare-fun b!218008 () Bool)

(declare-fun res!106828 () Bool)

(assert (=> b!218008 (=> (not res!106828) (not e!141812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10671 (_ BitVec 32)) Bool)

(assert (=> b!218008 (= res!106828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6164 thiss!1504) (mask!9886 thiss!1504)))))

(declare-fun b!218009 () Bool)

(declare-fun e!141808 () Bool)

(declare-fun e!141811 () Bool)

(assert (=> b!218009 (= e!141808 (and e!141811 mapRes!9741))))

(declare-fun condMapEmpty!9741 () Bool)

(declare-fun mapDefault!9741 () ValueCell!2516)

(assert (=> b!218009 (= condMapEmpty!9741 (= (arr!5055 (_values!4099 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2516)) mapDefault!9741)))))

(declare-fun e!141810 () Bool)

(declare-fun tp_is_empty!5719 () Bool)

(declare-fun array_inv!3331 (array!10671) Bool)

(declare-fun array_inv!3332 (array!10669) Bool)

(assert (=> b!218010 (= e!141810 (and tp!20705 tp_is_empty!5719 (array_inv!3331 (_keys!6164 thiss!1504)) (array_inv!3332 (_values!4099 thiss!1504)) e!141808))))

(declare-fun b!218011 () Bool)

(declare-fun res!106834 () Bool)

(declare-fun e!141809 () Bool)

(assert (=> b!218011 (=> (not res!106834) (not e!141809))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!218011 (= res!106834 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218012 () Bool)

(assert (=> b!218012 (= e!141809 e!141812)))

(declare-fun res!106829 () Bool)

(assert (=> b!218012 (=> (not res!106829) (not e!141812))))

(declare-datatypes ((SeekEntryResult!779 0))(
  ( (MissingZero!779 (index!5286 (_ BitVec 32))) (Found!779 (index!5287 (_ BitVec 32))) (Intermediate!779 (undefined!1591 Bool) (index!5288 (_ BitVec 32)) (x!22810 (_ BitVec 32))) (Undefined!779) (MissingVacant!779 (index!5289 (_ BitVec 32))) )
))
(declare-fun lt!111296 () SeekEntryResult!779)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218012 (= res!106829 (or (= lt!111296 (MissingZero!779 index!297)) (= lt!111296 (MissingVacant!779 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10671 (_ BitVec 32)) SeekEntryResult!779)

(assert (=> b!218012 (= lt!111296 (seekEntryOrOpen!0 key!932 (_keys!6164 thiss!1504) (mask!9886 thiss!1504)))))

(declare-fun b!218013 () Bool)

(declare-fun res!106833 () Bool)

(assert (=> b!218013 (=> (not res!106833) (not e!141812))))

(declare-datatypes ((tuple2!4278 0))(
  ( (tuple2!4279 (_1!2150 (_ BitVec 64)) (_2!2150 V!7273)) )
))
(declare-datatypes ((List!3202 0))(
  ( (Nil!3199) (Cons!3198 (h!3845 tuple2!4278) (t!8148 List!3202)) )
))
(declare-datatypes ((ListLongMap!3181 0))(
  ( (ListLongMap!3182 (toList!1606 List!3202)) )
))
(declare-fun contains!1447 (ListLongMap!3181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1115 (array!10671 array!10669 (_ BitVec 32) (_ BitVec 32) V!7273 V!7273 (_ BitVec 32) Int) ListLongMap!3181)

(assert (=> b!218013 (= res!106833 (not (contains!1447 (getCurrentListMap!1115 (_keys!6164 thiss!1504) (_values!4099 thiss!1504) (mask!9886 thiss!1504) (extraKeys!3853 thiss!1504) (zeroValue!3957 thiss!1504) (minValue!3957 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4116 thiss!1504)) key!932)))))

(declare-fun mapNonEmpty!9741 () Bool)

(declare-fun tp!20706 () Bool)

(declare-fun e!141807 () Bool)

(assert (=> mapNonEmpty!9741 (= mapRes!9741 (and tp!20706 e!141807))))

(declare-fun mapKey!9741 () (_ BitVec 32))

(declare-fun mapRest!9741 () (Array (_ BitVec 32) ValueCell!2516))

(declare-fun mapValue!9741 () ValueCell!2516)

(assert (=> mapNonEmpty!9741 (= (arr!5055 (_values!4099 thiss!1504)) (store mapRest!9741 mapKey!9741 mapValue!9741))))

(declare-fun b!218007 () Bool)

(declare-fun res!106830 () Bool)

(assert (=> b!218007 (=> (not res!106830) (not e!141812))))

(assert (=> b!218007 (= res!106830 (and (= (size!5388 (_values!4099 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9886 thiss!1504))) (= (size!5389 (_keys!6164 thiss!1504)) (size!5388 (_values!4099 thiss!1504))) (bvsge (mask!9886 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3853 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3853 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!106832 () Bool)

(assert (=> start!21712 (=> (not res!106832) (not e!141809))))

(declare-fun valid!1204 (LongMapFixedSize!2932) Bool)

(assert (=> start!21712 (= res!106832 (valid!1204 thiss!1504))))

(assert (=> start!21712 e!141809))

(assert (=> start!21712 e!141810))

(assert (=> start!21712 true))

(declare-fun b!218014 () Bool)

(assert (=> b!218014 (= e!141811 tp_is_empty!5719)))

(declare-fun b!218015 () Bool)

(assert (=> b!218015 (= e!141807 tp_is_empty!5719)))

(assert (= (and start!21712 res!106832) b!218011))

(assert (= (and b!218011 res!106834) b!218012))

(assert (= (and b!218012 res!106829) b!218013))

(assert (= (and b!218013 res!106833) b!218005))

(assert (= (and b!218005 res!106831) b!218007))

(assert (= (and b!218007 res!106830) b!218008))

(assert (= (and b!218008 res!106828) b!218006))

(assert (= (and b!218009 condMapEmpty!9741) mapIsEmpty!9741))

(assert (= (and b!218009 (not condMapEmpty!9741)) mapNonEmpty!9741))

(get-info :version)

(assert (= (and mapNonEmpty!9741 ((_ is ValueCellFull!2516) mapValue!9741)) b!218015))

(assert (= (and b!218009 ((_ is ValueCellFull!2516) mapDefault!9741)) b!218014))

(assert (= b!218010 b!218009))

(assert (= start!21712 b!218010))

(declare-fun m!243573 () Bool)

(assert (=> b!218008 m!243573))

(declare-fun m!243575 () Bool)

(assert (=> b!218012 m!243575))

(declare-fun m!243577 () Bool)

(assert (=> mapNonEmpty!9741 m!243577))

(declare-fun m!243579 () Bool)

(assert (=> start!21712 m!243579))

(declare-fun m!243581 () Bool)

(assert (=> b!218005 m!243581))

(declare-fun m!243583 () Bool)

(assert (=> b!218006 m!243583))

(declare-fun m!243585 () Bool)

(assert (=> b!218013 m!243585))

(assert (=> b!218013 m!243585))

(declare-fun m!243587 () Bool)

(assert (=> b!218013 m!243587))

(declare-fun m!243589 () Bool)

(assert (=> b!218010 m!243589))

(declare-fun m!243591 () Bool)

(assert (=> b!218010 m!243591))

(check-sat (not b!218005) tp_is_empty!5719 (not start!21712) (not b_next!5857) (not b!218010) (not b!218006) b_and!12721 (not mapNonEmpty!9741) (not b!218013) (not b!218012) (not b!218008))
(check-sat b_and!12721 (not b_next!5857))
