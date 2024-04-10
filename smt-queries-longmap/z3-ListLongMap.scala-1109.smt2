; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22902 () Bool)

(assert start!22902)

(declare-fun b!238571 () Bool)

(declare-fun b_free!6405 () Bool)

(declare-fun b_next!6405 () Bool)

(assert (=> b!238571 (= b_free!6405 (not b_next!6405))))

(declare-fun tp!22418 () Bool)

(declare-fun b_and!13371 () Bool)

(assert (=> b!238571 (= tp!22418 b_and!13371)))

(declare-fun b!238565 () Bool)

(declare-fun res!116914 () Bool)

(declare-fun e!154893 () Bool)

(assert (=> b!238565 (=> (not res!116914) (not e!154893))))

(declare-datatypes ((V!8003 0))(
  ( (V!8004 (val!3178 Int)) )
))
(declare-datatypes ((ValueCell!2790 0))(
  ( (ValueCellFull!2790 (v!5216 V!8003)) (EmptyCell!2790) )
))
(declare-datatypes ((array!11813 0))(
  ( (array!11814 (arr!5608 (Array (_ BitVec 32) ValueCell!2790)) (size!5949 (_ BitVec 32))) )
))
(declare-datatypes ((array!11815 0))(
  ( (array!11816 (arr!5609 (Array (_ BitVec 32) (_ BitVec 64))) (size!5950 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3480 0))(
  ( (LongMapFixedSize!3481 (defaultEntry!4425 Int) (mask!10461 (_ BitVec 32)) (extraKeys!4162 (_ BitVec 32)) (zeroValue!4266 V!8003) (minValue!4266 V!8003) (_size!1789 (_ BitVec 32)) (_keys!6527 array!11815) (_values!4408 array!11813) (_vacant!1789 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3480)

(assert (=> b!238565 (= res!116914 (and (= (size!5949 (_values!4408 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10461 thiss!1504))) (= (size!5950 (_keys!6527 thiss!1504)) (size!5949 (_values!4408 thiss!1504))) (bvsge (mask!10461 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4162 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4162 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238566 () Bool)

(assert (=> b!238566 (= e!154893 false)))

(declare-fun lt!120614 () Bool)

(declare-datatypes ((List!3583 0))(
  ( (Nil!3580) (Cons!3579 (h!4235 (_ BitVec 64)) (t!8578 List!3583)) )
))
(declare-fun arrayNoDuplicates!0 (array!11815 (_ BitVec 32) List!3583) Bool)

(assert (=> b!238566 (= lt!120614 (arrayNoDuplicates!0 (_keys!6527 thiss!1504) #b00000000000000000000000000000000 Nil!3580))))

(declare-fun b!238567 () Bool)

(declare-fun e!154887 () Bool)

(declare-fun tp_is_empty!6267 () Bool)

(assert (=> b!238567 (= e!154887 tp_is_empty!6267)))

(declare-fun res!116909 () Bool)

(declare-fun e!154889 () Bool)

(assert (=> start!22902 (=> (not res!116909) (not e!154889))))

(declare-fun valid!1374 (LongMapFixedSize!3480) Bool)

(assert (=> start!22902 (= res!116909 (valid!1374 thiss!1504))))

(assert (=> start!22902 e!154889))

(declare-fun e!154890 () Bool)

(assert (=> start!22902 e!154890))

(assert (=> start!22902 true))

(declare-fun b!238568 () Bool)

(declare-fun res!116911 () Bool)

(assert (=> b!238568 (=> (not res!116911) (not e!154893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11815 (_ BitVec 32)) Bool)

(assert (=> b!238568 (= res!116911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6527 thiss!1504) (mask!10461 thiss!1504)))))

(declare-fun b!238569 () Bool)

(assert (=> b!238569 (= e!154889 e!154893)))

(declare-fun res!116910 () Bool)

(assert (=> b!238569 (=> (not res!116910) (not e!154893))))

(declare-datatypes ((SeekEntryResult!1019 0))(
  ( (MissingZero!1019 (index!6246 (_ BitVec 32))) (Found!1019 (index!6247 (_ BitVec 32))) (Intermediate!1019 (undefined!1831 Bool) (index!6248 (_ BitVec 32)) (x!24051 (_ BitVec 32))) (Undefined!1019) (MissingVacant!1019 (index!6249 (_ BitVec 32))) )
))
(declare-fun lt!120615 () SeekEntryResult!1019)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238569 (= res!116910 (or (= lt!120615 (MissingZero!1019 index!297)) (= lt!120615 (MissingVacant!1019 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11815 (_ BitVec 32)) SeekEntryResult!1019)

(assert (=> b!238569 (= lt!120615 (seekEntryOrOpen!0 key!932 (_keys!6527 thiss!1504) (mask!10461 thiss!1504)))))

(declare-fun mapIsEmpty!10632 () Bool)

(declare-fun mapRes!10632 () Bool)

(assert (=> mapIsEmpty!10632 mapRes!10632))

(declare-fun b!238570 () Bool)

(declare-fun res!116913 () Bool)

(assert (=> b!238570 (=> (not res!116913) (not e!154893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238570 (= res!116913 (validMask!0 (mask!10461 thiss!1504)))))

(declare-fun e!154892 () Bool)

(declare-fun array_inv!3709 (array!11815) Bool)

(declare-fun array_inv!3710 (array!11813) Bool)

(assert (=> b!238571 (= e!154890 (and tp!22418 tp_is_empty!6267 (array_inv!3709 (_keys!6527 thiss!1504)) (array_inv!3710 (_values!4408 thiss!1504)) e!154892))))

(declare-fun b!238572 () Bool)

(declare-fun e!154888 () Bool)

(assert (=> b!238572 (= e!154888 tp_is_empty!6267)))

(declare-fun b!238573 () Bool)

(declare-fun res!116915 () Bool)

(assert (=> b!238573 (=> (not res!116915) (not e!154893))))

(declare-datatypes ((tuple2!4686 0))(
  ( (tuple2!4687 (_1!2354 (_ BitVec 64)) (_2!2354 V!8003)) )
))
(declare-datatypes ((List!3584 0))(
  ( (Nil!3581) (Cons!3580 (h!4236 tuple2!4686) (t!8579 List!3584)) )
))
(declare-datatypes ((ListLongMap!3599 0))(
  ( (ListLongMap!3600 (toList!1815 List!3584)) )
))
(declare-fun contains!1703 (ListLongMap!3599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1343 (array!11815 array!11813 (_ BitVec 32) (_ BitVec 32) V!8003 V!8003 (_ BitVec 32) Int) ListLongMap!3599)

(assert (=> b!238573 (= res!116915 (not (contains!1703 (getCurrentListMap!1343 (_keys!6527 thiss!1504) (_values!4408 thiss!1504) (mask!10461 thiss!1504) (extraKeys!4162 thiss!1504) (zeroValue!4266 thiss!1504) (minValue!4266 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4425 thiss!1504)) key!932)))))

(declare-fun b!238574 () Bool)

(assert (=> b!238574 (= e!154892 (and e!154888 mapRes!10632))))

(declare-fun condMapEmpty!10632 () Bool)

(declare-fun mapDefault!10632 () ValueCell!2790)

(assert (=> b!238574 (= condMapEmpty!10632 (= (arr!5608 (_values!4408 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2790)) mapDefault!10632)))))

(declare-fun mapNonEmpty!10632 () Bool)

(declare-fun tp!22419 () Bool)

(assert (=> mapNonEmpty!10632 (= mapRes!10632 (and tp!22419 e!154887))))

(declare-fun mapRest!10632 () (Array (_ BitVec 32) ValueCell!2790))

(declare-fun mapKey!10632 () (_ BitVec 32))

(declare-fun mapValue!10632 () ValueCell!2790)

(assert (=> mapNonEmpty!10632 (= (arr!5608 (_values!4408 thiss!1504)) (store mapRest!10632 mapKey!10632 mapValue!10632))))

(declare-fun b!238575 () Bool)

(declare-fun res!116912 () Bool)

(assert (=> b!238575 (=> (not res!116912) (not e!154889))))

(assert (=> b!238575 (= res!116912 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22902 res!116909) b!238575))

(assert (= (and b!238575 res!116912) b!238569))

(assert (= (and b!238569 res!116910) b!238573))

(assert (= (and b!238573 res!116915) b!238570))

(assert (= (and b!238570 res!116913) b!238565))

(assert (= (and b!238565 res!116914) b!238568))

(assert (= (and b!238568 res!116911) b!238566))

(assert (= (and b!238574 condMapEmpty!10632) mapIsEmpty!10632))

(assert (= (and b!238574 (not condMapEmpty!10632)) mapNonEmpty!10632))

(get-info :version)

(assert (= (and mapNonEmpty!10632 ((_ is ValueCellFull!2790) mapValue!10632)) b!238567))

(assert (= (and b!238574 ((_ is ValueCellFull!2790) mapDefault!10632)) b!238572))

(assert (= b!238571 b!238574))

(assert (= start!22902 b!238571))

(declare-fun m!259069 () Bool)

(assert (=> mapNonEmpty!10632 m!259069))

(declare-fun m!259071 () Bool)

(assert (=> b!238566 m!259071))

(declare-fun m!259073 () Bool)

(assert (=> b!238571 m!259073))

(declare-fun m!259075 () Bool)

(assert (=> b!238571 m!259075))

(declare-fun m!259077 () Bool)

(assert (=> b!238569 m!259077))

(declare-fun m!259079 () Bool)

(assert (=> b!238573 m!259079))

(assert (=> b!238573 m!259079))

(declare-fun m!259081 () Bool)

(assert (=> b!238573 m!259081))

(declare-fun m!259083 () Bool)

(assert (=> b!238568 m!259083))

(declare-fun m!259085 () Bool)

(assert (=> start!22902 m!259085))

(declare-fun m!259087 () Bool)

(assert (=> b!238570 m!259087))

(check-sat (not start!22902) b_and!13371 (not mapNonEmpty!10632) tp_is_empty!6267 (not b!238566) (not b!238571) (not b!238568) (not b!238573) (not b!238569) (not b!238570) (not b_next!6405))
(check-sat b_and!13371 (not b_next!6405))
