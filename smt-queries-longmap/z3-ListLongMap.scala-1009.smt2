; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21656 () Bool)

(assert start!21656)

(declare-fun b!217295 () Bool)

(declare-fun b_free!5805 () Bool)

(declare-fun b_next!5805 () Bool)

(assert (=> b!217295 (= b_free!5805 (not b_next!5805))))

(declare-fun tp!20549 () Bool)

(declare-fun b_and!12695 () Bool)

(assert (=> b!217295 (= tp!20549 b_and!12695)))

(declare-fun b!217294 () Bool)

(declare-fun res!106380 () Bool)

(declare-fun e!141366 () Bool)

(assert (=> b!217294 (=> (not res!106380) (not e!141366))))

(declare-datatypes ((V!7203 0))(
  ( (V!7204 (val!2878 Int)) )
))
(declare-datatypes ((ValueCell!2490 0))(
  ( (ValueCellFull!2490 (v!4896 V!7203)) (EmptyCell!2490) )
))
(declare-datatypes ((array!10573 0))(
  ( (array!10574 (arr!5008 (Array (_ BitVec 32) ValueCell!2490)) (size!5340 (_ BitVec 32))) )
))
(declare-datatypes ((array!10575 0))(
  ( (array!10576 (arr!5009 (Array (_ BitVec 32) (_ BitVec 64))) (size!5341 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2880 0))(
  ( (LongMapFixedSize!2881 (defaultEntry!4090 Int) (mask!9843 (_ BitVec 32)) (extraKeys!3827 (_ BitVec 32)) (zeroValue!3931 V!7203) (minValue!3931 V!7203) (_size!1489 (_ BitVec 32)) (_keys!6139 array!10575) (_values!4073 array!10573) (_vacant!1489 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2880)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4284 0))(
  ( (tuple2!4285 (_1!2153 (_ BitVec 64)) (_2!2153 V!7203)) )
))
(declare-datatypes ((List!3186 0))(
  ( (Nil!3183) (Cons!3182 (h!3829 tuple2!4284) (t!8141 List!3186)) )
))
(declare-datatypes ((ListLongMap!3197 0))(
  ( (ListLongMap!3198 (toList!1614 List!3186)) )
))
(declare-fun contains!1455 (ListLongMap!3197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1142 (array!10575 array!10573 (_ BitVec 32) (_ BitVec 32) V!7203 V!7203 (_ BitVec 32) Int) ListLongMap!3197)

(assert (=> b!217294 (= res!106380 (contains!1455 (getCurrentListMap!1142 (_keys!6139 thiss!1504) (_values!4073 thiss!1504) (mask!9843 thiss!1504) (extraKeys!3827 thiss!1504) (zeroValue!3931 thiss!1504) (minValue!3931 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4090 thiss!1504)) key!932))))

(declare-fun tp_is_empty!5667 () Bool)

(declare-fun e!141365 () Bool)

(declare-fun e!141362 () Bool)

(declare-fun array_inv!3319 (array!10575) Bool)

(declare-fun array_inv!3320 (array!10573) Bool)

(assert (=> b!217295 (= e!141365 (and tp!20549 tp_is_empty!5667 (array_inv!3319 (_keys!6139 thiss!1504)) (array_inv!3320 (_values!4073 thiss!1504)) e!141362))))

(declare-fun mapNonEmpty!9663 () Bool)

(declare-fun mapRes!9663 () Bool)

(declare-fun tp!20550 () Bool)

(declare-fun e!141364 () Bool)

(assert (=> mapNonEmpty!9663 (= mapRes!9663 (and tp!20550 e!141364))))

(declare-fun mapValue!9663 () ValueCell!2490)

(declare-fun mapKey!9663 () (_ BitVec 32))

(declare-fun mapRest!9663 () (Array (_ BitVec 32) ValueCell!2490))

(assert (=> mapNonEmpty!9663 (= (arr!5008 (_values!4073 thiss!1504)) (store mapRest!9663 mapKey!9663 mapValue!9663))))

(declare-fun b!217296 () Bool)

(assert (=> b!217296 (= e!141366 false)))

(declare-fun lt!111320 () Bool)

(declare-datatypes ((List!3187 0))(
  ( (Nil!3184) (Cons!3183 (h!3830 (_ BitVec 64)) (t!8142 List!3187)) )
))
(declare-fun arrayNoDuplicates!0 (array!10575 (_ BitVec 32) List!3187) Bool)

(assert (=> b!217296 (= lt!111320 (arrayNoDuplicates!0 (_keys!6139 thiss!1504) #b00000000000000000000000000000000 Nil!3184))))

(declare-fun b!217297 () Bool)

(declare-fun e!141363 () Bool)

(assert (=> b!217297 (= e!141363 e!141366)))

(declare-fun res!106383 () Bool)

(assert (=> b!217297 (=> (not res!106383) (not e!141366))))

(declare-datatypes ((SeekEntryResult!766 0))(
  ( (MissingZero!766 (index!5234 (_ BitVec 32))) (Found!766 (index!5235 (_ BitVec 32))) (Intermediate!766 (undefined!1578 Bool) (index!5236 (_ BitVec 32)) (x!22726 (_ BitVec 32))) (Undefined!766) (MissingVacant!766 (index!5237 (_ BitVec 32))) )
))
(declare-fun lt!111321 () SeekEntryResult!766)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217297 (= res!106383 (or (= lt!111321 (MissingZero!766 index!297)) (= lt!111321 (MissingVacant!766 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10575 (_ BitVec 32)) SeekEntryResult!766)

(assert (=> b!217297 (= lt!111321 (seekEntryOrOpen!0 key!932 (_keys!6139 thiss!1504) (mask!9843 thiss!1504)))))

(declare-fun res!106381 () Bool)

(assert (=> start!21656 (=> (not res!106381) (not e!141363))))

(declare-fun valid!1171 (LongMapFixedSize!2880) Bool)

(assert (=> start!21656 (= res!106381 (valid!1171 thiss!1504))))

(assert (=> start!21656 e!141363))

(assert (=> start!21656 e!141365))

(assert (=> start!21656 true))

(declare-fun b!217298 () Bool)

(declare-fun res!106377 () Bool)

(assert (=> b!217298 (=> (not res!106377) (not e!141366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217298 (= res!106377 (validMask!0 (mask!9843 thiss!1504)))))

(declare-fun b!217299 () Bool)

(declare-fun res!106378 () Bool)

(assert (=> b!217299 (=> (not res!106378) (not e!141366))))

(assert (=> b!217299 (= res!106378 (and (= (size!5340 (_values!4073 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9843 thiss!1504))) (= (size!5341 (_keys!6139 thiss!1504)) (size!5340 (_values!4073 thiss!1504))) (bvsge (mask!9843 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3827 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3827 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217300 () Bool)

(declare-fun e!141361 () Bool)

(assert (=> b!217300 (= e!141361 tp_is_empty!5667)))

(declare-fun b!217301 () Bool)

(assert (=> b!217301 (= e!141364 tp_is_empty!5667)))

(declare-fun b!217302 () Bool)

(declare-fun res!106379 () Bool)

(assert (=> b!217302 (=> (not res!106379) (not e!141363))))

(assert (=> b!217302 (= res!106379 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!217303 () Bool)

(declare-fun res!106382 () Bool)

(assert (=> b!217303 (=> (not res!106382) (not e!141366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10575 (_ BitVec 32)) Bool)

(assert (=> b!217303 (= res!106382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6139 thiss!1504) (mask!9843 thiss!1504)))))

(declare-fun b!217304 () Bool)

(assert (=> b!217304 (= e!141362 (and e!141361 mapRes!9663))))

(declare-fun condMapEmpty!9663 () Bool)

(declare-fun mapDefault!9663 () ValueCell!2490)

(assert (=> b!217304 (= condMapEmpty!9663 (= (arr!5008 (_values!4073 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2490)) mapDefault!9663)))))

(declare-fun mapIsEmpty!9663 () Bool)

(assert (=> mapIsEmpty!9663 mapRes!9663))

(assert (= (and start!21656 res!106381) b!217302))

(assert (= (and b!217302 res!106379) b!217297))

(assert (= (and b!217297 res!106383) b!217294))

(assert (= (and b!217294 res!106380) b!217298))

(assert (= (and b!217298 res!106377) b!217299))

(assert (= (and b!217299 res!106378) b!217303))

(assert (= (and b!217303 res!106382) b!217296))

(assert (= (and b!217304 condMapEmpty!9663) mapIsEmpty!9663))

(assert (= (and b!217304 (not condMapEmpty!9663)) mapNonEmpty!9663))

(get-info :version)

(assert (= (and mapNonEmpty!9663 ((_ is ValueCellFull!2490) mapValue!9663)) b!217301))

(assert (= (and b!217304 ((_ is ValueCellFull!2490) mapDefault!9663)) b!217300))

(assert (= b!217295 b!217304))

(assert (= start!21656 b!217295))

(declare-fun m!243669 () Bool)

(assert (=> b!217303 m!243669))

(declare-fun m!243671 () Bool)

(assert (=> mapNonEmpty!9663 m!243671))

(declare-fun m!243673 () Bool)

(assert (=> b!217298 m!243673))

(declare-fun m!243675 () Bool)

(assert (=> b!217294 m!243675))

(assert (=> b!217294 m!243675))

(declare-fun m!243677 () Bool)

(assert (=> b!217294 m!243677))

(declare-fun m!243679 () Bool)

(assert (=> b!217296 m!243679))

(declare-fun m!243681 () Bool)

(assert (=> b!217295 m!243681))

(declare-fun m!243683 () Bool)

(assert (=> b!217295 m!243683))

(declare-fun m!243685 () Bool)

(assert (=> start!21656 m!243685))

(declare-fun m!243687 () Bool)

(assert (=> b!217297 m!243687))

(check-sat (not b!217303) (not b_next!5805) (not mapNonEmpty!9663) (not b!217295) (not b!217296) tp_is_empty!5667 (not b!217297) (not b!217298) b_and!12695 (not b!217294) (not start!21656))
(check-sat b_and!12695 (not b_next!5805))
