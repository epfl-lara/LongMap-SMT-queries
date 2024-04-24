; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21694 () Bool)

(assert start!21694)

(declare-fun b!217911 () Bool)

(declare-fun b_free!5839 () Bool)

(declare-fun b_next!5839 () Bool)

(assert (=> b!217911 (= b_free!5839 (not b_next!5839))))

(declare-fun tp!20652 () Bool)

(declare-fun b_and!12743 () Bool)

(assert (=> b!217911 (= tp!20652 b_and!12743)))

(declare-fun b!217902 () Bool)

(declare-fun res!106759 () Bool)

(declare-fun e!141742 () Bool)

(assert (=> b!217902 (=> (not res!106759) (not e!141742))))

(declare-datatypes ((V!7249 0))(
  ( (V!7250 (val!2895 Int)) )
))
(declare-datatypes ((ValueCell!2507 0))(
  ( (ValueCellFull!2507 (v!4914 V!7249)) (EmptyCell!2507) )
))
(declare-datatypes ((array!10639 0))(
  ( (array!10640 (arr!5041 (Array (_ BitVec 32) ValueCell!2507)) (size!5373 (_ BitVec 32))) )
))
(declare-datatypes ((array!10641 0))(
  ( (array!10642 (arr!5042 (Array (_ BitVec 32) (_ BitVec 64))) (size!5374 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2914 0))(
  ( (LongMapFixedSize!2915 (defaultEntry!4107 Int) (mask!9872 (_ BitVec 32)) (extraKeys!3844 (_ BitVec 32)) (zeroValue!3948 V!7249) (minValue!3948 V!7249) (_size!1506 (_ BitVec 32)) (_keys!6156 array!10641) (_values!4090 array!10639) (_vacant!1506 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2914)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10641 (_ BitVec 32)) Bool)

(assert (=> b!217902 (= res!106759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6156 thiss!1504) (mask!9872 thiss!1504)))))

(declare-fun mapIsEmpty!9714 () Bool)

(declare-fun mapRes!9714 () Bool)

(assert (=> mapIsEmpty!9714 mapRes!9714))

(declare-fun b!217903 () Bool)

(declare-fun res!106756 () Bool)

(declare-fun e!141748 () Bool)

(assert (=> b!217903 (=> (not res!106756) (not e!141748))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!217903 (= res!106756 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217904 () Bool)

(declare-fun e!141746 () Bool)

(declare-fun tp_is_empty!5701 () Bool)

(assert (=> b!217904 (= e!141746 tp_is_empty!5701)))

(declare-fun b!217905 () Bool)

(declare-fun e!141744 () Bool)

(assert (=> b!217905 (= e!141744 tp_is_empty!5701)))

(declare-fun b!217906 () Bool)

(declare-fun res!106758 () Bool)

(assert (=> b!217906 (=> (not res!106758) (not e!141742))))

(declare-datatypes ((tuple2!4226 0))(
  ( (tuple2!4227 (_1!2124 (_ BitVec 64)) (_2!2124 V!7249)) )
))
(declare-datatypes ((List!3128 0))(
  ( (Nil!3125) (Cons!3124 (h!3771 tuple2!4226) (t!8075 List!3128)) )
))
(declare-datatypes ((ListLongMap!3141 0))(
  ( (ListLongMap!3142 (toList!1586 List!3128)) )
))
(declare-fun contains!1441 (ListLongMap!3141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1118 (array!10641 array!10639 (_ BitVec 32) (_ BitVec 32) V!7249 V!7249 (_ BitVec 32) Int) ListLongMap!3141)

(assert (=> b!217906 (= res!106758 (not (contains!1441 (getCurrentListMap!1118 (_keys!6156 thiss!1504) (_values!4090 thiss!1504) (mask!9872 thiss!1504) (extraKeys!3844 thiss!1504) (zeroValue!3948 thiss!1504) (minValue!3948 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4107 thiss!1504)) key!932)))))

(declare-fun b!217907 () Bool)

(declare-fun e!141745 () Bool)

(assert (=> b!217907 (= e!141745 (and e!141744 mapRes!9714))))

(declare-fun condMapEmpty!9714 () Bool)

(declare-fun mapDefault!9714 () ValueCell!2507)

(assert (=> b!217907 (= condMapEmpty!9714 (= (arr!5041 (_values!4090 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2507)) mapDefault!9714)))))

(declare-fun b!217908 () Bool)

(assert (=> b!217908 (= e!141748 e!141742)))

(declare-fun res!106760 () Bool)

(assert (=> b!217908 (=> (not res!106760) (not e!141742))))

(declare-datatypes ((SeekEntryResult!756 0))(
  ( (MissingZero!756 (index!5194 (_ BitVec 32))) (Found!756 (index!5195 (_ BitVec 32))) (Intermediate!756 (undefined!1568 Bool) (index!5196 (_ BitVec 32)) (x!22764 (_ BitVec 32))) (Undefined!756) (MissingVacant!756 (index!5197 (_ BitVec 32))) )
))
(declare-fun lt!111482 () SeekEntryResult!756)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217908 (= res!106760 (or (= lt!111482 (MissingZero!756 index!297)) (= lt!111482 (MissingVacant!756 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10641 (_ BitVec 32)) SeekEntryResult!756)

(assert (=> b!217908 (= lt!111482 (seekEntryOrOpen!0 key!932 (_keys!6156 thiss!1504) (mask!9872 thiss!1504)))))

(declare-fun b!217909 () Bool)

(assert (=> b!217909 (= e!141742 false)))

(declare-fun lt!111481 () Bool)

(declare-datatypes ((List!3129 0))(
  ( (Nil!3126) (Cons!3125 (h!3772 (_ BitVec 64)) (t!8076 List!3129)) )
))
(declare-fun arrayNoDuplicates!0 (array!10641 (_ BitVec 32) List!3129) Bool)

(assert (=> b!217909 (= lt!111481 (arrayNoDuplicates!0 (_keys!6156 thiss!1504) #b00000000000000000000000000000000 Nil!3126))))

(declare-fun res!106755 () Bool)

(assert (=> start!21694 (=> (not res!106755) (not e!141748))))

(declare-fun valid!1198 (LongMapFixedSize!2914) Bool)

(assert (=> start!21694 (= res!106755 (valid!1198 thiss!1504))))

(assert (=> start!21694 e!141748))

(declare-fun e!141743 () Bool)

(assert (=> start!21694 e!141743))

(assert (=> start!21694 true))

(declare-fun b!217910 () Bool)

(declare-fun res!106761 () Bool)

(assert (=> b!217910 (=> (not res!106761) (not e!141742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217910 (= res!106761 (validMask!0 (mask!9872 thiss!1504)))))

(declare-fun array_inv!3317 (array!10641) Bool)

(declare-fun array_inv!3318 (array!10639) Bool)

(assert (=> b!217911 (= e!141743 (and tp!20652 tp_is_empty!5701 (array_inv!3317 (_keys!6156 thiss!1504)) (array_inv!3318 (_values!4090 thiss!1504)) e!141745))))

(declare-fun mapNonEmpty!9714 () Bool)

(declare-fun tp!20651 () Bool)

(assert (=> mapNonEmpty!9714 (= mapRes!9714 (and tp!20651 e!141746))))

(declare-fun mapKey!9714 () (_ BitVec 32))

(declare-fun mapValue!9714 () ValueCell!2507)

(declare-fun mapRest!9714 () (Array (_ BitVec 32) ValueCell!2507))

(assert (=> mapNonEmpty!9714 (= (arr!5041 (_values!4090 thiss!1504)) (store mapRest!9714 mapKey!9714 mapValue!9714))))

(declare-fun b!217912 () Bool)

(declare-fun res!106757 () Bool)

(assert (=> b!217912 (=> (not res!106757) (not e!141742))))

(assert (=> b!217912 (= res!106757 (and (= (size!5373 (_values!4090 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9872 thiss!1504))) (= (size!5374 (_keys!6156 thiss!1504)) (size!5373 (_values!4090 thiss!1504))) (bvsge (mask!9872 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3844 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3844 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!21694 res!106755) b!217903))

(assert (= (and b!217903 res!106756) b!217908))

(assert (= (and b!217908 res!106760) b!217906))

(assert (= (and b!217906 res!106758) b!217910))

(assert (= (and b!217910 res!106761) b!217912))

(assert (= (and b!217912 res!106757) b!217902))

(assert (= (and b!217902 res!106759) b!217909))

(assert (= (and b!217907 condMapEmpty!9714) mapIsEmpty!9714))

(assert (= (and b!217907 (not condMapEmpty!9714)) mapNonEmpty!9714))

(get-info :version)

(assert (= (and mapNonEmpty!9714 ((_ is ValueCellFull!2507) mapValue!9714)) b!217904))

(assert (= (and b!217907 ((_ is ValueCellFull!2507) mapDefault!9714)) b!217905))

(assert (= b!217911 b!217907))

(assert (= start!21694 b!217911))

(declare-fun m!244191 () Bool)

(assert (=> b!217911 m!244191))

(declare-fun m!244193 () Bool)

(assert (=> b!217911 m!244193))

(declare-fun m!244195 () Bool)

(assert (=> start!21694 m!244195))

(declare-fun m!244197 () Bool)

(assert (=> b!217909 m!244197))

(declare-fun m!244199 () Bool)

(assert (=> b!217902 m!244199))

(declare-fun m!244201 () Bool)

(assert (=> b!217910 m!244201))

(declare-fun m!244203 () Bool)

(assert (=> mapNonEmpty!9714 m!244203))

(declare-fun m!244205 () Bool)

(assert (=> b!217908 m!244205))

(declare-fun m!244207 () Bool)

(assert (=> b!217906 m!244207))

(assert (=> b!217906 m!244207))

(declare-fun m!244209 () Bool)

(assert (=> b!217906 m!244209))

(check-sat (not mapNonEmpty!9714) (not b!217910) (not b!217908) b_and!12743 (not start!21694) (not b_next!5839) (not b!217909) tp_is_empty!5701 (not b!217906) (not b!217911) (not b!217902))
(check-sat b_and!12743 (not b_next!5839))
