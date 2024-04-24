; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21718 () Bool)

(assert start!21718)

(declare-fun b!218308 () Bool)

(declare-fun b_free!5863 () Bool)

(declare-fun b_next!5863 () Bool)

(assert (=> b!218308 (= b_free!5863 (not b_next!5863))))

(declare-fun tp!20723 () Bool)

(declare-fun b_and!12767 () Bool)

(assert (=> b!218308 (= tp!20723 b_and!12767)))

(declare-fun mapIsEmpty!9750 () Bool)

(declare-fun mapRes!9750 () Bool)

(assert (=> mapIsEmpty!9750 mapRes!9750))

(declare-fun res!107013 () Bool)

(declare-fun e!141999 () Bool)

(assert (=> start!21718 (=> (not res!107013) (not e!141999))))

(declare-datatypes ((V!7281 0))(
  ( (V!7282 (val!2907 Int)) )
))
(declare-datatypes ((ValueCell!2519 0))(
  ( (ValueCellFull!2519 (v!4926 V!7281)) (EmptyCell!2519) )
))
(declare-datatypes ((array!10687 0))(
  ( (array!10688 (arr!5065 (Array (_ BitVec 32) ValueCell!2519)) (size!5397 (_ BitVec 32))) )
))
(declare-datatypes ((array!10689 0))(
  ( (array!10690 (arr!5066 (Array (_ BitVec 32) (_ BitVec 64))) (size!5398 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2938 0))(
  ( (LongMapFixedSize!2939 (defaultEntry!4119 Int) (mask!9892 (_ BitVec 32)) (extraKeys!3856 (_ BitVec 32)) (zeroValue!3960 V!7281) (minValue!3960 V!7281) (_size!1518 (_ BitVec 32)) (_keys!6168 array!10689) (_values!4102 array!10687) (_vacant!1518 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2938)

(declare-fun valid!1204 (LongMapFixedSize!2938) Bool)

(assert (=> start!21718 (= res!107013 (valid!1204 thiss!1504))))

(assert (=> start!21718 e!141999))

(declare-fun e!141995 () Bool)

(assert (=> start!21718 e!141995))

(assert (=> start!21718 true))

(declare-fun b!218298 () Bool)

(declare-fun res!107008 () Bool)

(declare-fun e!141998 () Bool)

(assert (=> b!218298 (=> (not res!107008) (not e!141998))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4242 0))(
  ( (tuple2!4243 (_1!2132 (_ BitVec 64)) (_2!2132 V!7281)) )
))
(declare-datatypes ((List!3141 0))(
  ( (Nil!3138) (Cons!3137 (h!3784 tuple2!4242) (t!8088 List!3141)) )
))
(declare-datatypes ((ListLongMap!3157 0))(
  ( (ListLongMap!3158 (toList!1594 List!3141)) )
))
(declare-fun contains!1449 (ListLongMap!3157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1126 (array!10689 array!10687 (_ BitVec 32) (_ BitVec 32) V!7281 V!7281 (_ BitVec 32) Int) ListLongMap!3157)

(assert (=> b!218298 (= res!107008 (not (contains!1449 (getCurrentListMap!1126 (_keys!6168 thiss!1504) (_values!4102 thiss!1504) (mask!9892 thiss!1504) (extraKeys!3856 thiss!1504) (zeroValue!3960 thiss!1504) (minValue!3960 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4119 thiss!1504)) key!932)))))

(declare-fun b!218299 () Bool)

(declare-fun e!141996 () Bool)

(declare-fun tp_is_empty!5725 () Bool)

(assert (=> b!218299 (= e!141996 tp_is_empty!5725)))

(declare-fun b!218300 () Bool)

(assert (=> b!218300 (= e!141998 false)))

(declare-fun lt!111554 () Bool)

(declare-datatypes ((List!3142 0))(
  ( (Nil!3139) (Cons!3138 (h!3785 (_ BitVec 64)) (t!8089 List!3142)) )
))
(declare-fun arrayNoDuplicates!0 (array!10689 (_ BitVec 32) List!3142) Bool)

(assert (=> b!218300 (= lt!111554 (arrayNoDuplicates!0 (_keys!6168 thiss!1504) #b00000000000000000000000000000000 Nil!3139))))

(declare-fun b!218301 () Bool)

(assert (=> b!218301 (= e!141999 e!141998)))

(declare-fun res!107007 () Bool)

(assert (=> b!218301 (=> (not res!107007) (not e!141998))))

(declare-datatypes ((SeekEntryResult!763 0))(
  ( (MissingZero!763 (index!5222 (_ BitVec 32))) (Found!763 (index!5223 (_ BitVec 32))) (Intermediate!763 (undefined!1575 Bool) (index!5224 (_ BitVec 32)) (x!22803 (_ BitVec 32))) (Undefined!763) (MissingVacant!763 (index!5225 (_ BitVec 32))) )
))
(declare-fun lt!111553 () SeekEntryResult!763)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218301 (= res!107007 (or (= lt!111553 (MissingZero!763 index!297)) (= lt!111553 (MissingVacant!763 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10689 (_ BitVec 32)) SeekEntryResult!763)

(assert (=> b!218301 (= lt!111553 (seekEntryOrOpen!0 key!932 (_keys!6168 thiss!1504) (mask!9892 thiss!1504)))))

(declare-fun b!218302 () Bool)

(declare-fun res!107011 () Bool)

(assert (=> b!218302 (=> (not res!107011) (not e!141999))))

(assert (=> b!218302 (= res!107011 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218303 () Bool)

(declare-fun res!107010 () Bool)

(assert (=> b!218303 (=> (not res!107010) (not e!141998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!218303 (= res!107010 (validMask!0 (mask!9892 thiss!1504)))))

(declare-fun b!218304 () Bool)

(declare-fun e!141997 () Bool)

(declare-fun e!142000 () Bool)

(assert (=> b!218304 (= e!141997 (and e!142000 mapRes!9750))))

(declare-fun condMapEmpty!9750 () Bool)

(declare-fun mapDefault!9750 () ValueCell!2519)

(assert (=> b!218304 (= condMapEmpty!9750 (= (arr!5065 (_values!4102 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2519)) mapDefault!9750)))))

(declare-fun b!218305 () Bool)

(declare-fun res!107012 () Bool)

(assert (=> b!218305 (=> (not res!107012) (not e!141998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10689 (_ BitVec 32)) Bool)

(assert (=> b!218305 (= res!107012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6168 thiss!1504) (mask!9892 thiss!1504)))))

(declare-fun mapNonEmpty!9750 () Bool)

(declare-fun tp!20724 () Bool)

(assert (=> mapNonEmpty!9750 (= mapRes!9750 (and tp!20724 e!141996))))

(declare-fun mapKey!9750 () (_ BitVec 32))

(declare-fun mapRest!9750 () (Array (_ BitVec 32) ValueCell!2519))

(declare-fun mapValue!9750 () ValueCell!2519)

(assert (=> mapNonEmpty!9750 (= (arr!5065 (_values!4102 thiss!1504)) (store mapRest!9750 mapKey!9750 mapValue!9750))))

(declare-fun b!218306 () Bool)

(assert (=> b!218306 (= e!142000 tp_is_empty!5725)))

(declare-fun b!218307 () Bool)

(declare-fun res!107009 () Bool)

(assert (=> b!218307 (=> (not res!107009) (not e!141998))))

(assert (=> b!218307 (= res!107009 (and (= (size!5397 (_values!4102 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9892 thiss!1504))) (= (size!5398 (_keys!6168 thiss!1504)) (size!5397 (_values!4102 thiss!1504))) (bvsge (mask!9892 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3856 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3856 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun array_inv!3329 (array!10689) Bool)

(declare-fun array_inv!3330 (array!10687) Bool)

(assert (=> b!218308 (= e!141995 (and tp!20723 tp_is_empty!5725 (array_inv!3329 (_keys!6168 thiss!1504)) (array_inv!3330 (_values!4102 thiss!1504)) e!141997))))

(assert (= (and start!21718 res!107013) b!218302))

(assert (= (and b!218302 res!107011) b!218301))

(assert (= (and b!218301 res!107007) b!218298))

(assert (= (and b!218298 res!107008) b!218303))

(assert (= (and b!218303 res!107010) b!218307))

(assert (= (and b!218307 res!107009) b!218305))

(assert (= (and b!218305 res!107012) b!218300))

(assert (= (and b!218304 condMapEmpty!9750) mapIsEmpty!9750))

(assert (= (and b!218304 (not condMapEmpty!9750)) mapNonEmpty!9750))

(get-info :version)

(assert (= (and mapNonEmpty!9750 ((_ is ValueCellFull!2519) mapValue!9750)) b!218299))

(assert (= (and b!218304 ((_ is ValueCellFull!2519) mapDefault!9750)) b!218306))

(assert (= b!218308 b!218304))

(assert (= start!21718 b!218308))

(declare-fun m!244431 () Bool)

(assert (=> b!218301 m!244431))

(declare-fun m!244433 () Bool)

(assert (=> mapNonEmpty!9750 m!244433))

(declare-fun m!244435 () Bool)

(assert (=> b!218305 m!244435))

(declare-fun m!244437 () Bool)

(assert (=> start!21718 m!244437))

(declare-fun m!244439 () Bool)

(assert (=> b!218298 m!244439))

(assert (=> b!218298 m!244439))

(declare-fun m!244441 () Bool)

(assert (=> b!218298 m!244441))

(declare-fun m!244443 () Bool)

(assert (=> b!218308 m!244443))

(declare-fun m!244445 () Bool)

(assert (=> b!218308 m!244445))

(declare-fun m!244447 () Bool)

(assert (=> b!218300 m!244447))

(declare-fun m!244449 () Bool)

(assert (=> b!218303 m!244449))

(check-sat (not b_next!5863) (not start!21718) (not b!218298) (not b!218308) (not b!218301) (not mapNonEmpty!9750) tp_is_empty!5725 b_and!12767 (not b!218305) (not b!218303) (not b!218300))
(check-sat b_and!12767 (not b_next!5863))
