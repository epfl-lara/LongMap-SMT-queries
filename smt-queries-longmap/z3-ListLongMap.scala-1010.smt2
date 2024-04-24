; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21664 () Bool)

(assert start!21664)

(declare-fun b!217415 () Bool)

(declare-fun b_free!5809 () Bool)

(declare-fun b_next!5809 () Bool)

(assert (=> b!217415 (= b_free!5809 (not b_next!5809))))

(declare-fun tp!20562 () Bool)

(declare-fun b_and!12713 () Bool)

(assert (=> b!217415 (= tp!20562 b_and!12713)))

(declare-fun res!106442 () Bool)

(declare-fun e!141427 () Bool)

(assert (=> start!21664 (=> (not res!106442) (not e!141427))))

(declare-datatypes ((V!7209 0))(
  ( (V!7210 (val!2880 Int)) )
))
(declare-datatypes ((ValueCell!2492 0))(
  ( (ValueCellFull!2492 (v!4899 V!7209)) (EmptyCell!2492) )
))
(declare-datatypes ((array!10579 0))(
  ( (array!10580 (arr!5011 (Array (_ BitVec 32) ValueCell!2492)) (size!5343 (_ BitVec 32))) )
))
(declare-datatypes ((array!10581 0))(
  ( (array!10582 (arr!5012 (Array (_ BitVec 32) (_ BitVec 64))) (size!5344 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2884 0))(
  ( (LongMapFixedSize!2885 (defaultEntry!4092 Int) (mask!9847 (_ BitVec 32)) (extraKeys!3829 (_ BitVec 32)) (zeroValue!3933 V!7209) (minValue!3933 V!7209) (_size!1491 (_ BitVec 32)) (_keys!6141 array!10581) (_values!4075 array!10579) (_vacant!1491 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2884)

(declare-fun valid!1186 (LongMapFixedSize!2884) Bool)

(assert (=> start!21664 (= res!106442 (valid!1186 thiss!1504))))

(assert (=> start!21664 e!141427))

(declare-fun e!141431 () Bool)

(assert (=> start!21664 e!141431))

(assert (=> start!21664 true))

(declare-fun b!217407 () Bool)

(declare-fun res!106444 () Bool)

(assert (=> b!217407 (=> (not res!106444) (not e!141427))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217407 (= res!106444 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217408 () Bool)

(declare-fun res!106446 () Bool)

(declare-fun e!141433 () Bool)

(assert (=> b!217408 (=> (not res!106446) (not e!141433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10581 (_ BitVec 32)) Bool)

(assert (=> b!217408 (= res!106446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6141 thiss!1504) (mask!9847 thiss!1504)))))

(declare-fun b!217409 () Bool)

(assert (=> b!217409 (= e!141427 e!141433)))

(declare-fun res!106445 () Bool)

(assert (=> b!217409 (=> (not res!106445) (not e!141433))))

(declare-datatypes ((SeekEntryResult!746 0))(
  ( (MissingZero!746 (index!5154 (_ BitVec 32))) (Found!746 (index!5155 (_ BitVec 32))) (Intermediate!746 (undefined!1558 Bool) (index!5156 (_ BitVec 32)) (x!22714 (_ BitVec 32))) (Undefined!746) (MissingVacant!746 (index!5157 (_ BitVec 32))) )
))
(declare-fun lt!111392 () SeekEntryResult!746)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217409 (= res!106445 (or (= lt!111392 (MissingZero!746 index!297)) (= lt!111392 (MissingVacant!746 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10581 (_ BitVec 32)) SeekEntryResult!746)

(assert (=> b!217409 (= lt!111392 (seekEntryOrOpen!0 key!932 (_keys!6141 thiss!1504) (mask!9847 thiss!1504)))))

(declare-fun b!217410 () Bool)

(declare-fun res!106440 () Bool)

(assert (=> b!217410 (=> (not res!106440) (not e!141433))))

(assert (=> b!217410 (= res!106440 (and (= (size!5343 (_values!4075 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9847 thiss!1504))) (= (size!5344 (_keys!6141 thiss!1504)) (size!5343 (_values!4075 thiss!1504))) (bvsge (mask!9847 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3829 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3829 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217411 () Bool)

(declare-fun res!106443 () Bool)

(assert (=> b!217411 (=> (not res!106443) (not e!141433))))

(declare-datatypes ((tuple2!4204 0))(
  ( (tuple2!4205 (_1!2113 (_ BitVec 64)) (_2!2113 V!7209)) )
))
(declare-datatypes ((List!3106 0))(
  ( (Nil!3103) (Cons!3102 (h!3749 tuple2!4204) (t!8053 List!3106)) )
))
(declare-datatypes ((ListLongMap!3119 0))(
  ( (ListLongMap!3120 (toList!1575 List!3106)) )
))
(declare-fun contains!1430 (ListLongMap!3119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1107 (array!10581 array!10579 (_ BitVec 32) (_ BitVec 32) V!7209 V!7209 (_ BitVec 32) Int) ListLongMap!3119)

(assert (=> b!217411 (= res!106443 (contains!1430 (getCurrentListMap!1107 (_keys!6141 thiss!1504) (_values!4075 thiss!1504) (mask!9847 thiss!1504) (extraKeys!3829 thiss!1504) (zeroValue!3933 thiss!1504) (minValue!3933 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4092 thiss!1504)) key!932))))

(declare-fun b!217412 () Bool)

(declare-fun e!141428 () Bool)

(declare-fun tp_is_empty!5671 () Bool)

(assert (=> b!217412 (= e!141428 tp_is_empty!5671)))

(declare-fun mapIsEmpty!9669 () Bool)

(declare-fun mapRes!9669 () Bool)

(assert (=> mapIsEmpty!9669 mapRes!9669))

(declare-fun b!217413 () Bool)

(declare-fun e!141430 () Bool)

(assert (=> b!217413 (= e!141430 tp_is_empty!5671)))

(declare-fun b!217414 () Bool)

(declare-fun res!106441 () Bool)

(assert (=> b!217414 (=> (not res!106441) (not e!141433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217414 (= res!106441 (validMask!0 (mask!9847 thiss!1504)))))

(declare-fun e!141432 () Bool)

(declare-fun array_inv!3293 (array!10581) Bool)

(declare-fun array_inv!3294 (array!10579) Bool)

(assert (=> b!217415 (= e!141431 (and tp!20562 tp_is_empty!5671 (array_inv!3293 (_keys!6141 thiss!1504)) (array_inv!3294 (_values!4075 thiss!1504)) e!141432))))

(declare-fun b!217416 () Bool)

(assert (=> b!217416 (= e!141433 false)))

(declare-fun lt!111391 () Bool)

(declare-datatypes ((List!3107 0))(
  ( (Nil!3104) (Cons!3103 (h!3750 (_ BitVec 64)) (t!8054 List!3107)) )
))
(declare-fun arrayNoDuplicates!0 (array!10581 (_ BitVec 32) List!3107) Bool)

(assert (=> b!217416 (= lt!111391 (arrayNoDuplicates!0 (_keys!6141 thiss!1504) #b00000000000000000000000000000000 Nil!3104))))

(declare-fun b!217417 () Bool)

(assert (=> b!217417 (= e!141432 (and e!141430 mapRes!9669))))

(declare-fun condMapEmpty!9669 () Bool)

(declare-fun mapDefault!9669 () ValueCell!2492)

(assert (=> b!217417 (= condMapEmpty!9669 (= (arr!5011 (_values!4075 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2492)) mapDefault!9669)))))

(declare-fun mapNonEmpty!9669 () Bool)

(declare-fun tp!20561 () Bool)

(assert (=> mapNonEmpty!9669 (= mapRes!9669 (and tp!20561 e!141428))))

(declare-fun mapValue!9669 () ValueCell!2492)

(declare-fun mapRest!9669 () (Array (_ BitVec 32) ValueCell!2492))

(declare-fun mapKey!9669 () (_ BitVec 32))

(assert (=> mapNonEmpty!9669 (= (arr!5011 (_values!4075 thiss!1504)) (store mapRest!9669 mapKey!9669 mapValue!9669))))

(assert (= (and start!21664 res!106442) b!217407))

(assert (= (and b!217407 res!106444) b!217409))

(assert (= (and b!217409 res!106445) b!217411))

(assert (= (and b!217411 res!106443) b!217414))

(assert (= (and b!217414 res!106441) b!217410))

(assert (= (and b!217410 res!106440) b!217408))

(assert (= (and b!217408 res!106446) b!217416))

(assert (= (and b!217417 condMapEmpty!9669) mapIsEmpty!9669))

(assert (= (and b!217417 (not condMapEmpty!9669)) mapNonEmpty!9669))

(get-info :version)

(assert (= (and mapNonEmpty!9669 ((_ is ValueCellFull!2492) mapValue!9669)) b!217412))

(assert (= (and b!217417 ((_ is ValueCellFull!2492) mapDefault!9669)) b!217413))

(assert (= b!217415 b!217417))

(assert (= start!21664 b!217415))

(declare-fun m!243891 () Bool)

(assert (=> b!217411 m!243891))

(assert (=> b!217411 m!243891))

(declare-fun m!243893 () Bool)

(assert (=> b!217411 m!243893))

(declare-fun m!243895 () Bool)

(assert (=> b!217414 m!243895))

(declare-fun m!243897 () Bool)

(assert (=> b!217408 m!243897))

(declare-fun m!243899 () Bool)

(assert (=> b!217409 m!243899))

(declare-fun m!243901 () Bool)

(assert (=> start!21664 m!243901))

(declare-fun m!243903 () Bool)

(assert (=> b!217415 m!243903))

(declare-fun m!243905 () Bool)

(assert (=> b!217415 m!243905))

(declare-fun m!243907 () Bool)

(assert (=> mapNonEmpty!9669 m!243907))

(declare-fun m!243909 () Bool)

(assert (=> b!217416 m!243909))

(check-sat (not b!217415) (not b!217408) (not b!217414) (not b!217409) (not b_next!5809) tp_is_empty!5671 (not b!217416) (not start!21664) b_and!12713 (not b!217411) (not mapNonEmpty!9669))
(check-sat b_and!12713 (not b_next!5809))
