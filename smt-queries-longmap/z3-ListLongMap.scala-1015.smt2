; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21694 () Bool)

(assert start!21694)

(declare-fun b!217715 () Bool)

(declare-fun b_free!5839 () Bool)

(declare-fun b_next!5839 () Bool)

(assert (=> b!217715 (= b_free!5839 (not b_next!5839))))

(declare-fun tp!20651 () Bool)

(declare-fun b_and!12703 () Bool)

(assert (=> b!217715 (= tp!20651 b_and!12703)))

(declare-fun res!106643 () Bool)

(declare-fun e!141622 () Bool)

(assert (=> start!21694 (=> (not res!106643) (not e!141622))))

(declare-datatypes ((V!7249 0))(
  ( (V!7250 (val!2895 Int)) )
))
(declare-datatypes ((ValueCell!2507 0))(
  ( (ValueCellFull!2507 (v!4907 V!7249)) (EmptyCell!2507) )
))
(declare-datatypes ((array!10633 0))(
  ( (array!10634 (arr!5037 (Array (_ BitVec 32) ValueCell!2507)) (size!5370 (_ BitVec 32))) )
))
(declare-datatypes ((array!10635 0))(
  ( (array!10636 (arr!5038 (Array (_ BitVec 32) (_ BitVec 64))) (size!5371 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2914 0))(
  ( (LongMapFixedSize!2915 (defaultEntry!4107 Int) (mask!9871 (_ BitVec 32)) (extraKeys!3844 (_ BitVec 32)) (zeroValue!3948 V!7249) (minValue!3948 V!7249) (_size!1506 (_ BitVec 32)) (_keys!6155 array!10635) (_values!4090 array!10633) (_vacant!1506 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2914)

(declare-fun valid!1197 (LongMapFixedSize!2914) Bool)

(assert (=> start!21694 (= res!106643 (valid!1197 thiss!1504))))

(assert (=> start!21694 e!141622))

(declare-fun e!141617 () Bool)

(assert (=> start!21694 e!141617))

(assert (=> start!21694 true))

(declare-fun b!217708 () Bool)

(declare-fun e!141621 () Bool)

(assert (=> b!217708 (= e!141622 e!141621)))

(declare-fun res!106641 () Bool)

(assert (=> b!217708 (=> (not res!106641) (not e!141621))))

(declare-datatypes ((SeekEntryResult!772 0))(
  ( (MissingZero!772 (index!5258 (_ BitVec 32))) (Found!772 (index!5259 (_ BitVec 32))) (Intermediate!772 (undefined!1584 Bool) (index!5260 (_ BitVec 32)) (x!22779 (_ BitVec 32))) (Undefined!772) (MissingVacant!772 (index!5261 (_ BitVec 32))) )
))
(declare-fun lt!111242 () SeekEntryResult!772)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!217708 (= res!106641 (or (= lt!111242 (MissingZero!772 index!297)) (= lt!111242 (MissingVacant!772 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10635 (_ BitVec 32)) SeekEntryResult!772)

(assert (=> b!217708 (= lt!111242 (seekEntryOrOpen!0 key!932 (_keys!6155 thiss!1504) (mask!9871 thiss!1504)))))

(declare-fun b!217709 () Bool)

(declare-fun res!106642 () Bool)

(assert (=> b!217709 (=> (not res!106642) (not e!141621))))

(assert (=> b!217709 (= res!106642 (and (= (size!5370 (_values!4090 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9871 thiss!1504))) (= (size!5371 (_keys!6155 thiss!1504)) (size!5370 (_values!4090 thiss!1504))) (bvsge (mask!9871 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3844 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3844 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!217710 () Bool)

(declare-fun e!141620 () Bool)

(declare-fun tp_is_empty!5701 () Bool)

(assert (=> b!217710 (= e!141620 tp_is_empty!5701)))

(declare-fun b!217711 () Bool)

(declare-fun res!106639 () Bool)

(assert (=> b!217711 (=> (not res!106639) (not e!141621))))

(declare-datatypes ((tuple2!4268 0))(
  ( (tuple2!4269 (_1!2145 (_ BitVec 64)) (_2!2145 V!7249)) )
))
(declare-datatypes ((List!3191 0))(
  ( (Nil!3188) (Cons!3187 (h!3834 tuple2!4268) (t!8137 List!3191)) )
))
(declare-datatypes ((ListLongMap!3171 0))(
  ( (ListLongMap!3172 (toList!1601 List!3191)) )
))
(declare-fun contains!1442 (ListLongMap!3171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1110 (array!10635 array!10633 (_ BitVec 32) (_ BitVec 32) V!7249 V!7249 (_ BitVec 32) Int) ListLongMap!3171)

(assert (=> b!217711 (= res!106639 (not (contains!1442 (getCurrentListMap!1110 (_keys!6155 thiss!1504) (_values!4090 thiss!1504) (mask!9871 thiss!1504) (extraKeys!3844 thiss!1504) (zeroValue!3948 thiss!1504) (minValue!3948 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4107 thiss!1504)) key!932)))))

(declare-fun b!217712 () Bool)

(declare-fun res!106644 () Bool)

(assert (=> b!217712 (=> (not res!106644) (not e!141621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!217712 (= res!106644 (validMask!0 (mask!9871 thiss!1504)))))

(declare-fun b!217713 () Bool)

(declare-fun res!106640 () Bool)

(assert (=> b!217713 (=> (not res!106640) (not e!141621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10635 (_ BitVec 32)) Bool)

(assert (=> b!217713 (= res!106640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6155 thiss!1504) (mask!9871 thiss!1504)))))

(declare-fun b!217714 () Bool)

(declare-fun res!106645 () Bool)

(assert (=> b!217714 (=> (not res!106645) (not e!141622))))

(assert (=> b!217714 (= res!106645 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9714 () Bool)

(declare-fun mapRes!9714 () Bool)

(assert (=> mapIsEmpty!9714 mapRes!9714))

(declare-fun e!141623 () Bool)

(declare-fun array_inv!3319 (array!10635) Bool)

(declare-fun array_inv!3320 (array!10633) Bool)

(assert (=> b!217715 (= e!141617 (and tp!20651 tp_is_empty!5701 (array_inv!3319 (_keys!6155 thiss!1504)) (array_inv!3320 (_values!4090 thiss!1504)) e!141623))))

(declare-fun mapNonEmpty!9714 () Bool)

(declare-fun tp!20652 () Bool)

(assert (=> mapNonEmpty!9714 (= mapRes!9714 (and tp!20652 e!141620))))

(declare-fun mapRest!9714 () (Array (_ BitVec 32) ValueCell!2507))

(declare-fun mapKey!9714 () (_ BitVec 32))

(declare-fun mapValue!9714 () ValueCell!2507)

(assert (=> mapNonEmpty!9714 (= (arr!5037 (_values!4090 thiss!1504)) (store mapRest!9714 mapKey!9714 mapValue!9714))))

(declare-fun b!217716 () Bool)

(assert (=> b!217716 (= e!141621 false)))

(declare-fun lt!111241 () Bool)

(declare-datatypes ((List!3192 0))(
  ( (Nil!3189) (Cons!3188 (h!3835 (_ BitVec 64)) (t!8138 List!3192)) )
))
(declare-fun arrayNoDuplicates!0 (array!10635 (_ BitVec 32) List!3192) Bool)

(assert (=> b!217716 (= lt!111241 (arrayNoDuplicates!0 (_keys!6155 thiss!1504) #b00000000000000000000000000000000 Nil!3189))))

(declare-fun b!217717 () Bool)

(declare-fun e!141619 () Bool)

(assert (=> b!217717 (= e!141619 tp_is_empty!5701)))

(declare-fun b!217718 () Bool)

(assert (=> b!217718 (= e!141623 (and e!141619 mapRes!9714))))

(declare-fun condMapEmpty!9714 () Bool)

(declare-fun mapDefault!9714 () ValueCell!2507)

(assert (=> b!217718 (= condMapEmpty!9714 (= (arr!5037 (_values!4090 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2507)) mapDefault!9714)))))

(assert (= (and start!21694 res!106643) b!217714))

(assert (= (and b!217714 res!106645) b!217708))

(assert (= (and b!217708 res!106641) b!217711))

(assert (= (and b!217711 res!106639) b!217712))

(assert (= (and b!217712 res!106644) b!217709))

(assert (= (and b!217709 res!106642) b!217713))

(assert (= (and b!217713 res!106640) b!217716))

(assert (= (and b!217718 condMapEmpty!9714) mapIsEmpty!9714))

(assert (= (and b!217718 (not condMapEmpty!9714)) mapNonEmpty!9714))

(get-info :version)

(assert (= (and mapNonEmpty!9714 ((_ is ValueCellFull!2507) mapValue!9714)) b!217710))

(assert (= (and b!217718 ((_ is ValueCellFull!2507) mapDefault!9714)) b!217717))

(assert (= b!217715 b!217718))

(assert (= start!21694 b!217715))

(declare-fun m!243393 () Bool)

(assert (=> mapNonEmpty!9714 m!243393))

(declare-fun m!243395 () Bool)

(assert (=> b!217712 m!243395))

(declare-fun m!243397 () Bool)

(assert (=> b!217716 m!243397))

(declare-fun m!243399 () Bool)

(assert (=> start!21694 m!243399))

(declare-fun m!243401 () Bool)

(assert (=> b!217715 m!243401))

(declare-fun m!243403 () Bool)

(assert (=> b!217715 m!243403))

(declare-fun m!243405 () Bool)

(assert (=> b!217708 m!243405))

(declare-fun m!243407 () Bool)

(assert (=> b!217711 m!243407))

(assert (=> b!217711 m!243407))

(declare-fun m!243409 () Bool)

(assert (=> b!217711 m!243409))

(declare-fun m!243411 () Bool)

(assert (=> b!217713 m!243411))

(check-sat (not b!217713) (not b!217712) b_and!12703 (not b!217715) (not mapNonEmpty!9714) tp_is_empty!5701 (not b!217716) (not b!217711) (not start!21694) (not b!217708) (not b_next!5839))
(check-sat b_and!12703 (not b_next!5839))
