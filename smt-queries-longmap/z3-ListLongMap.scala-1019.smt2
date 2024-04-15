; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21718 () Bool)

(assert start!21718)

(declare-fun b!218113 () Bool)

(declare-fun b_free!5863 () Bool)

(declare-fun b_next!5863 () Bool)

(assert (=> b!218113 (= b_free!5863 (not b_next!5863))))

(declare-fun tp!20723 () Bool)

(declare-fun b_and!12727 () Bool)

(assert (=> b!218113 (= tp!20723 b_and!12727)))

(declare-fun b!218104 () Bool)

(declare-fun e!141874 () Bool)

(declare-fun tp_is_empty!5725 () Bool)

(assert (=> b!218104 (= e!141874 tp_is_empty!5725)))

(declare-fun b!218105 () Bool)

(declare-fun e!141873 () Bool)

(assert (=> b!218105 (= e!141873 false)))

(declare-fun lt!111313 () Bool)

(declare-datatypes ((V!7281 0))(
  ( (V!7282 (val!2907 Int)) )
))
(declare-datatypes ((ValueCell!2519 0))(
  ( (ValueCellFull!2519 (v!4919 V!7281)) (EmptyCell!2519) )
))
(declare-datatypes ((array!10681 0))(
  ( (array!10682 (arr!5061 (Array (_ BitVec 32) ValueCell!2519)) (size!5394 (_ BitVec 32))) )
))
(declare-datatypes ((array!10683 0))(
  ( (array!10684 (arr!5062 (Array (_ BitVec 32) (_ BitVec 64))) (size!5395 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2938 0))(
  ( (LongMapFixedSize!2939 (defaultEntry!4119 Int) (mask!9891 (_ BitVec 32)) (extraKeys!3856 (_ BitVec 32)) (zeroValue!3960 V!7281) (minValue!3960 V!7281) (_size!1518 (_ BitVec 32)) (_keys!6167 array!10683) (_values!4102 array!10681) (_vacant!1518 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2938)

(declare-datatypes ((List!3206 0))(
  ( (Nil!3203) (Cons!3202 (h!3849 (_ BitVec 64)) (t!8152 List!3206)) )
))
(declare-fun arrayNoDuplicates!0 (array!10683 (_ BitVec 32) List!3206) Bool)

(assert (=> b!218105 (= lt!111313 (arrayNoDuplicates!0 (_keys!6167 thiss!1504) #b00000000000000000000000000000000 Nil!3203))))

(declare-fun b!218106 () Bool)

(declare-fun e!141870 () Bool)

(assert (=> b!218106 (= e!141870 e!141873)))

(declare-fun res!106891 () Bool)

(assert (=> b!218106 (=> (not res!106891) (not e!141873))))

(declare-datatypes ((SeekEntryResult!781 0))(
  ( (MissingZero!781 (index!5294 (_ BitVec 32))) (Found!781 (index!5295 (_ BitVec 32))) (Intermediate!781 (undefined!1593 Bool) (index!5296 (_ BitVec 32)) (x!22820 (_ BitVec 32))) (Undefined!781) (MissingVacant!781 (index!5297 (_ BitVec 32))) )
))
(declare-fun lt!111314 () SeekEntryResult!781)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218106 (= res!106891 (or (= lt!111314 (MissingZero!781 index!297)) (= lt!111314 (MissingVacant!781 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10683 (_ BitVec 32)) SeekEntryResult!781)

(assert (=> b!218106 (= lt!111314 (seekEntryOrOpen!0 key!932 (_keys!6167 thiss!1504) (mask!9891 thiss!1504)))))

(declare-fun b!218107 () Bool)

(declare-fun res!106896 () Bool)

(assert (=> b!218107 (=> (not res!106896) (not e!141873))))

(assert (=> b!218107 (= res!106896 (and (= (size!5394 (_values!4102 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9891 thiss!1504))) (= (size!5395 (_keys!6167 thiss!1504)) (size!5394 (_values!4102 thiss!1504))) (bvsge (mask!9891 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3856 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3856 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!106892 () Bool)

(assert (=> start!21718 (=> (not res!106892) (not e!141870))))

(declare-fun valid!1207 (LongMapFixedSize!2938) Bool)

(assert (=> start!21718 (= res!106892 (valid!1207 thiss!1504))))

(assert (=> start!21718 e!141870))

(declare-fun e!141871 () Bool)

(assert (=> start!21718 e!141871))

(assert (=> start!21718 true))

(declare-fun b!218108 () Bool)

(declare-fun res!106895 () Bool)

(assert (=> b!218108 (=> (not res!106895) (not e!141873))))

(declare-datatypes ((tuple2!4284 0))(
  ( (tuple2!4285 (_1!2153 (_ BitVec 64)) (_2!2153 V!7281)) )
))
(declare-datatypes ((List!3207 0))(
  ( (Nil!3204) (Cons!3203 (h!3850 tuple2!4284) (t!8153 List!3207)) )
))
(declare-datatypes ((ListLongMap!3187 0))(
  ( (ListLongMap!3188 (toList!1609 List!3207)) )
))
(declare-fun contains!1450 (ListLongMap!3187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1118 (array!10683 array!10681 (_ BitVec 32) (_ BitVec 32) V!7281 V!7281 (_ BitVec 32) Int) ListLongMap!3187)

(assert (=> b!218108 (= res!106895 (not (contains!1450 (getCurrentListMap!1118 (_keys!6167 thiss!1504) (_values!4102 thiss!1504) (mask!9891 thiss!1504) (extraKeys!3856 thiss!1504) (zeroValue!3960 thiss!1504) (minValue!3960 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4119 thiss!1504)) key!932)))))

(declare-fun b!218109 () Bool)

(declare-fun res!106894 () Bool)

(assert (=> b!218109 (=> (not res!106894) (not e!141873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10683 (_ BitVec 32)) Bool)

(assert (=> b!218109 (= res!106894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6167 thiss!1504) (mask!9891 thiss!1504)))))

(declare-fun b!218110 () Bool)

(declare-fun res!106893 () Bool)

(assert (=> b!218110 (=> (not res!106893) (not e!141870))))

(assert (=> b!218110 (= res!106893 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9750 () Bool)

(declare-fun mapRes!9750 () Bool)

(assert (=> mapIsEmpty!9750 mapRes!9750))

(declare-fun b!218111 () Bool)

(declare-fun res!106897 () Bool)

(assert (=> b!218111 (=> (not res!106897) (not e!141873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218111 (= res!106897 (validMask!0 (mask!9891 thiss!1504)))))

(declare-fun mapNonEmpty!9750 () Bool)

(declare-fun tp!20724 () Bool)

(declare-fun e!141875 () Bool)

(assert (=> mapNonEmpty!9750 (= mapRes!9750 (and tp!20724 e!141875))))

(declare-fun mapRest!9750 () (Array (_ BitVec 32) ValueCell!2519))

(declare-fun mapValue!9750 () ValueCell!2519)

(declare-fun mapKey!9750 () (_ BitVec 32))

(assert (=> mapNonEmpty!9750 (= (arr!5061 (_values!4102 thiss!1504)) (store mapRest!9750 mapKey!9750 mapValue!9750))))

(declare-fun b!218112 () Bool)

(declare-fun e!141869 () Bool)

(assert (=> b!218112 (= e!141869 (and e!141874 mapRes!9750))))

(declare-fun condMapEmpty!9750 () Bool)

(declare-fun mapDefault!9750 () ValueCell!2519)

(assert (=> b!218112 (= condMapEmpty!9750 (= (arr!5061 (_values!4102 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2519)) mapDefault!9750)))))

(declare-fun array_inv!3335 (array!10683) Bool)

(declare-fun array_inv!3336 (array!10681) Bool)

(assert (=> b!218113 (= e!141871 (and tp!20723 tp_is_empty!5725 (array_inv!3335 (_keys!6167 thiss!1504)) (array_inv!3336 (_values!4102 thiss!1504)) e!141869))))

(declare-fun b!218114 () Bool)

(assert (=> b!218114 (= e!141875 tp_is_empty!5725)))

(assert (= (and start!21718 res!106892) b!218110))

(assert (= (and b!218110 res!106893) b!218106))

(assert (= (and b!218106 res!106891) b!218108))

(assert (= (and b!218108 res!106895) b!218111))

(assert (= (and b!218111 res!106897) b!218107))

(assert (= (and b!218107 res!106896) b!218109))

(assert (= (and b!218109 res!106894) b!218105))

(assert (= (and b!218112 condMapEmpty!9750) mapIsEmpty!9750))

(assert (= (and b!218112 (not condMapEmpty!9750)) mapNonEmpty!9750))

(get-info :version)

(assert (= (and mapNonEmpty!9750 ((_ is ValueCellFull!2519) mapValue!9750)) b!218114))

(assert (= (and b!218112 ((_ is ValueCellFull!2519) mapDefault!9750)) b!218104))

(assert (= b!218113 b!218112))

(assert (= start!21718 b!218113))

(declare-fun m!243633 () Bool)

(assert (=> b!218108 m!243633))

(assert (=> b!218108 m!243633))

(declare-fun m!243635 () Bool)

(assert (=> b!218108 m!243635))

(declare-fun m!243637 () Bool)

(assert (=> mapNonEmpty!9750 m!243637))

(declare-fun m!243639 () Bool)

(assert (=> start!21718 m!243639))

(declare-fun m!243641 () Bool)

(assert (=> b!218113 m!243641))

(declare-fun m!243643 () Bool)

(assert (=> b!218113 m!243643))

(declare-fun m!243645 () Bool)

(assert (=> b!218106 m!243645))

(declare-fun m!243647 () Bool)

(assert (=> b!218105 m!243647))

(declare-fun m!243649 () Bool)

(assert (=> b!218111 m!243649))

(declare-fun m!243651 () Bool)

(assert (=> b!218109 m!243651))

(check-sat tp_is_empty!5725 (not start!21718) (not b!218106) (not b!218108) b_and!12727 (not b_next!5863) (not b!218113) (not b!218105) (not b!218109) (not b!218111) (not mapNonEmpty!9750))
(check-sat b_and!12727 (not b_next!5863))
