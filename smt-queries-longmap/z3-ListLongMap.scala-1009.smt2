; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21658 () Bool)

(assert start!21658)

(declare-fun b!217310 () Bool)

(declare-fun b_free!5803 () Bool)

(declare-fun b_next!5803 () Bool)

(assert (=> b!217310 (= b_free!5803 (not b_next!5803))))

(declare-fun tp!20544 () Bool)

(declare-fun b_and!12707 () Bool)

(assert (=> b!217310 (= tp!20544 b_and!12707)))

(declare-fun mapIsEmpty!9660 () Bool)

(declare-fun mapRes!9660 () Bool)

(assert (=> mapIsEmpty!9660 mapRes!9660))

(declare-fun b!217308 () Bool)

(declare-fun res!106379 () Bool)

(declare-fun e!141370 () Bool)

(assert (=> b!217308 (=> (not res!106379) (not e!141370))))

(declare-datatypes ((V!7201 0))(
  ( (V!7202 (val!2877 Int)) )
))
(declare-datatypes ((ValueCell!2489 0))(
  ( (ValueCellFull!2489 (v!4896 V!7201)) (EmptyCell!2489) )
))
(declare-datatypes ((array!10567 0))(
  ( (array!10568 (arr!5005 (Array (_ BitVec 32) ValueCell!2489)) (size!5337 (_ BitVec 32))) )
))
(declare-datatypes ((array!10569 0))(
  ( (array!10570 (arr!5006 (Array (_ BitVec 32) (_ BitVec 64))) (size!5338 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2878 0))(
  ( (LongMapFixedSize!2879 (defaultEntry!4089 Int) (mask!9842 (_ BitVec 32)) (extraKeys!3826 (_ BitVec 32)) (zeroValue!3930 V!7201) (minValue!3930 V!7201) (_size!1488 (_ BitVec 32)) (_keys!6138 array!10569) (_values!4072 array!10567) (_vacant!1488 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2878)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10569 (_ BitVec 32)) Bool)

(assert (=> b!217308 (= res!106379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6138 thiss!1504) (mask!9842 thiss!1504)))))

(declare-fun b!217309 () Bool)

(declare-fun e!141365 () Bool)

(assert (=> b!217309 (= e!141365 e!141370)))

(declare-fun res!106378 () Bool)

(assert (=> b!217309 (=> (not res!106378) (not e!141370))))

(declare-datatypes ((SeekEntryResult!745 0))(
  ( (MissingZero!745 (index!5150 (_ BitVec 32))) (Found!745 (index!5151 (_ BitVec 32))) (Intermediate!745 (undefined!1557 Bool) (index!5152 (_ BitVec 32)) (x!22705 (_ BitVec 32))) (Undefined!745) (MissingVacant!745 (index!5153 (_ BitVec 32))) )
))
(declare-fun lt!111374 () SeekEntryResult!745)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217309 (= res!106378 (or (= lt!111374 (MissingZero!745 index!297)) (= lt!111374 (MissingVacant!745 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10569 (_ BitVec 32)) SeekEntryResult!745)

(assert (=> b!217309 (= lt!111374 (seekEntryOrOpen!0 key!932 (_keys!6138 thiss!1504) (mask!9842 thiss!1504)))))

(declare-fun res!106377 () Bool)

(assert (=> start!21658 (=> (not res!106377) (not e!141365))))

(declare-fun valid!1184 (LongMapFixedSize!2878) Bool)

(assert (=> start!21658 (= res!106377 (valid!1184 thiss!1504))))

(assert (=> start!21658 e!141365))

(declare-fun e!141364 () Bool)

(assert (=> start!21658 e!141364))

(assert (=> start!21658 true))

(declare-fun tp_is_empty!5665 () Bool)

(declare-fun e!141369 () Bool)

(declare-fun array_inv!3289 (array!10569) Bool)

(declare-fun array_inv!3290 (array!10567) Bool)

(assert (=> b!217310 (= e!141364 (and tp!20544 tp_is_empty!5665 (array_inv!3289 (_keys!6138 thiss!1504)) (array_inv!3290 (_values!4072 thiss!1504)) e!141369))))

(declare-fun b!217311 () Bool)

(declare-fun e!141367 () Bool)

(assert (=> b!217311 (= e!141367 tp_is_empty!5665)))

(declare-fun b!217312 () Bool)

(declare-fun e!141368 () Bool)

(assert (=> b!217312 (= e!141369 (and e!141368 mapRes!9660))))

(declare-fun condMapEmpty!9660 () Bool)

(declare-fun mapDefault!9660 () ValueCell!2489)

(assert (=> b!217312 (= condMapEmpty!9660 (= (arr!5005 (_values!4072 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2489)) mapDefault!9660)))))

(declare-fun b!217313 () Bool)

(declare-fun res!106381 () Bool)

(assert (=> b!217313 (=> (not res!106381) (not e!141370))))

(declare-datatypes ((tuple2!4200 0))(
  ( (tuple2!4201 (_1!2111 (_ BitVec 64)) (_2!2111 V!7201)) )
))
(declare-datatypes ((List!3102 0))(
  ( (Nil!3099) (Cons!3098 (h!3745 tuple2!4200) (t!8049 List!3102)) )
))
(declare-datatypes ((ListLongMap!3115 0))(
  ( (ListLongMap!3116 (toList!1573 List!3102)) )
))
(declare-fun contains!1428 (ListLongMap!3115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1105 (array!10569 array!10567 (_ BitVec 32) (_ BitVec 32) V!7201 V!7201 (_ BitVec 32) Int) ListLongMap!3115)

(assert (=> b!217313 (= res!106381 (contains!1428 (getCurrentListMap!1105 (_keys!6138 thiss!1504) (_values!4072 thiss!1504) (mask!9842 thiss!1504) (extraKeys!3826 thiss!1504) (zeroValue!3930 thiss!1504) (minValue!3930 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4089 thiss!1504)) key!932))))

(declare-fun b!217314 () Bool)

(declare-fun res!106380 () Bool)

(assert (=> b!217314 (=> (not res!106380) (not e!141365))))

(assert (=> b!217314 (= res!106380 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9660 () Bool)

(declare-fun tp!20543 () Bool)

(assert (=> mapNonEmpty!9660 (= mapRes!9660 (and tp!20543 e!141367))))

(declare-fun mapRest!9660 () (Array (_ BitVec 32) ValueCell!2489))

(declare-fun mapKey!9660 () (_ BitVec 32))

(declare-fun mapValue!9660 () ValueCell!2489)

(assert (=> mapNonEmpty!9660 (= (arr!5005 (_values!4072 thiss!1504)) (store mapRest!9660 mapKey!9660 mapValue!9660))))

(declare-fun b!217315 () Bool)

(declare-fun res!106383 () Bool)

(assert (=> b!217315 (=> (not res!106383) (not e!141370))))

(assert (=> b!217315 (= res!106383 (and (= (size!5337 (_values!4072 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9842 thiss!1504))) (= (size!5338 (_keys!6138 thiss!1504)) (size!5337 (_values!4072 thiss!1504))) (bvsge (mask!9842 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3826 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3826 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217316 () Bool)

(assert (=> b!217316 (= e!141368 tp_is_empty!5665)))

(declare-fun b!217317 () Bool)

(declare-fun res!106382 () Bool)

(assert (=> b!217317 (=> (not res!106382) (not e!141370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217317 (= res!106382 (validMask!0 (mask!9842 thiss!1504)))))

(declare-fun b!217318 () Bool)

(assert (=> b!217318 (= e!141370 false)))

(declare-fun lt!111373 () Bool)

(declare-datatypes ((List!3103 0))(
  ( (Nil!3100) (Cons!3099 (h!3746 (_ BitVec 64)) (t!8050 List!3103)) )
))
(declare-fun arrayNoDuplicates!0 (array!10569 (_ BitVec 32) List!3103) Bool)

(assert (=> b!217318 (= lt!111373 (arrayNoDuplicates!0 (_keys!6138 thiss!1504) #b00000000000000000000000000000000 Nil!3100))))

(assert (= (and start!21658 res!106377) b!217314))

(assert (= (and b!217314 res!106380) b!217309))

(assert (= (and b!217309 res!106378) b!217313))

(assert (= (and b!217313 res!106381) b!217317))

(assert (= (and b!217317 res!106382) b!217315))

(assert (= (and b!217315 res!106383) b!217308))

(assert (= (and b!217308 res!106379) b!217318))

(assert (= (and b!217312 condMapEmpty!9660) mapIsEmpty!9660))

(assert (= (and b!217312 (not condMapEmpty!9660)) mapNonEmpty!9660))

(get-info :version)

(assert (= (and mapNonEmpty!9660 ((_ is ValueCellFull!2489) mapValue!9660)) b!217311))

(assert (= (and b!217312 ((_ is ValueCellFull!2489) mapDefault!9660)) b!217316))

(assert (= b!217310 b!217312))

(assert (= start!21658 b!217310))

(declare-fun m!243831 () Bool)

(assert (=> start!21658 m!243831))

(declare-fun m!243833 () Bool)

(assert (=> b!217317 m!243833))

(declare-fun m!243835 () Bool)

(assert (=> b!217318 m!243835))

(declare-fun m!243837 () Bool)

(assert (=> b!217313 m!243837))

(assert (=> b!217313 m!243837))

(declare-fun m!243839 () Bool)

(assert (=> b!217313 m!243839))

(declare-fun m!243841 () Bool)

(assert (=> b!217308 m!243841))

(declare-fun m!243843 () Bool)

(assert (=> mapNonEmpty!9660 m!243843))

(declare-fun m!243845 () Bool)

(assert (=> b!217309 m!243845))

(declare-fun m!243847 () Bool)

(assert (=> b!217310 m!243847))

(declare-fun m!243849 () Bool)

(assert (=> b!217310 m!243849))

(check-sat (not b!217309) (not b!217310) (not b!217317) (not b!217313) tp_is_empty!5665 (not b!217308) (not b!217318) (not start!21658) (not b_next!5803) b_and!12707 (not mapNonEmpty!9660))
(check-sat b_and!12707 (not b_next!5803))
