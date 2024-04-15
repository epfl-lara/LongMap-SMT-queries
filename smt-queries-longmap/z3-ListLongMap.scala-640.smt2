; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16192 () Bool)

(assert start!16192)

(declare-fun b!161310 () Bool)

(declare-fun b_free!3649 () Bool)

(declare-fun b_next!3649 () Bool)

(assert (=> b!161310 (= b_free!3649 (not b_next!3649))))

(declare-fun tp!13517 () Bool)

(declare-fun b_and!10037 () Bool)

(assert (=> b!161310 (= tp!13517 b_and!10037)))

(declare-fun b!161303 () Bool)

(declare-datatypes ((Unit!4993 0))(
  ( (Unit!4994) )
))
(declare-fun e!105421 () Unit!4993)

(declare-datatypes ((V!4249 0))(
  ( (V!4250 (val!1770 Int)) )
))
(declare-datatypes ((ValueCell!1382 0))(
  ( (ValueCellFull!1382 (v!3629 V!4249)) (EmptyCell!1382) )
))
(declare-datatypes ((array!5961 0))(
  ( (array!5962 (arr!2824 (Array (_ BitVec 32) (_ BitVec 64))) (size!3109 (_ BitVec 32))) )
))
(declare-datatypes ((array!5963 0))(
  ( (array!5964 (arr!2825 (Array (_ BitVec 32) ValueCell!1382)) (size!3110 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1672 0))(
  ( (LongMapFixedSize!1673 (defaultEntry!3278 Int) (mask!7869 (_ BitVec 32)) (extraKeys!3019 (_ BitVec 32)) (zeroValue!3121 V!4249) (minValue!3121 V!4249) (_size!885 (_ BitVec 32)) (_keys!5078 array!5961) (_values!3261 array!5963) (_vacant!885 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1672)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!76 (array!5961 array!5963 (_ BitVec 32) (_ BitVec 32) V!4249 V!4249 (_ BitVec 64) Int) Unit!4993)

(assert (=> b!161303 (= e!105421 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!76 (_keys!5078 thiss!1248) (_values!3261 thiss!1248) (mask!7869 thiss!1248) (extraKeys!3019 thiss!1248) (zeroValue!3121 thiss!1248) (minValue!3121 thiss!1248) key!828 (defaultEntry!3278 thiss!1248)))))

(declare-fun b!161304 () Bool)

(declare-fun Unit!4995 () Unit!4993)

(assert (=> b!161304 (= e!105421 Unit!4995)))

(declare-fun lt!82034 () Unit!4993)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!77 (array!5961 array!5963 (_ BitVec 32) (_ BitVec 32) V!4249 V!4249 (_ BitVec 64) Int) Unit!4993)

(assert (=> b!161304 (= lt!82034 (lemmaInListMapThenSeekEntryOrOpenFindsIt!77 (_keys!5078 thiss!1248) (_values!3261 thiss!1248) (mask!7869 thiss!1248) (extraKeys!3019 thiss!1248) (zeroValue!3121 thiss!1248) (minValue!3121 thiss!1248) key!828 (defaultEntry!3278 thiss!1248)))))

(assert (=> b!161304 false))

(declare-fun b!161305 () Bool)

(declare-fun e!105416 () Bool)

(assert (=> b!161305 (= e!105416 false)))

(declare-fun lt!82035 () Unit!4993)

(assert (=> b!161305 (= lt!82035 e!105421)))

(declare-fun c!29936 () Bool)

(declare-datatypes ((tuple2!2936 0))(
  ( (tuple2!2937 (_1!1479 (_ BitVec 64)) (_2!1479 V!4249)) )
))
(declare-datatypes ((List!1981 0))(
  ( (Nil!1978) (Cons!1977 (h!2590 tuple2!2936) (t!6774 List!1981)) )
))
(declare-datatypes ((ListLongMap!1923 0))(
  ( (ListLongMap!1924 (toList!977 List!1981)) )
))
(declare-fun contains!1016 (ListLongMap!1923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!627 (array!5961 array!5963 (_ BitVec 32) (_ BitVec 32) V!4249 V!4249 (_ BitVec 32) Int) ListLongMap!1923)

(assert (=> b!161305 (= c!29936 (contains!1016 (getCurrentListMap!627 (_keys!5078 thiss!1248) (_values!3261 thiss!1248) (mask!7869 thiss!1248) (extraKeys!3019 thiss!1248) (zeroValue!3121 thiss!1248) (minValue!3121 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3278 thiss!1248)) key!828))))

(declare-fun b!161306 () Bool)

(declare-fun res!76436 () Bool)

(assert (=> b!161306 (=> (not res!76436) (not e!105416))))

(assert (=> b!161306 (= res!76436 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161307 () Bool)

(declare-fun e!105419 () Bool)

(declare-fun tp_is_empty!3451 () Bool)

(assert (=> b!161307 (= e!105419 tp_is_empty!3451)))

(declare-fun b!161308 () Bool)

(declare-fun e!105417 () Bool)

(declare-fun mapRes!5864 () Bool)

(assert (=> b!161308 (= e!105417 (and e!105419 mapRes!5864))))

(declare-fun condMapEmpty!5864 () Bool)

(declare-fun mapDefault!5864 () ValueCell!1382)

(assert (=> b!161308 (= condMapEmpty!5864 (= (arr!2825 (_values!3261 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1382)) mapDefault!5864)))))

(declare-fun e!105415 () Bool)

(declare-fun array_inv!1821 (array!5961) Bool)

(declare-fun array_inv!1822 (array!5963) Bool)

(assert (=> b!161310 (= e!105415 (and tp!13517 tp_is_empty!3451 (array_inv!1821 (_keys!5078 thiss!1248)) (array_inv!1822 (_values!3261 thiss!1248)) e!105417))))

(declare-fun b!161311 () Bool)

(declare-fun res!76435 () Bool)

(assert (=> b!161311 (=> (not res!76435) (not e!105416))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!359 0))(
  ( (MissingZero!359 (index!3604 (_ BitVec 32))) (Found!359 (index!3605 (_ BitVec 32))) (Intermediate!359 (undefined!1171 Bool) (index!3606 (_ BitVec 32)) (x!17822 (_ BitVec 32))) (Undefined!359) (MissingVacant!359 (index!3607 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5961 (_ BitVec 32)) SeekEntryResult!359)

(assert (=> b!161311 (= res!76435 ((_ is Undefined!359) (seekEntryOrOpen!0 key!828 (_keys!5078 thiss!1248) (mask!7869 thiss!1248))))))

(declare-fun res!76437 () Bool)

(assert (=> start!16192 (=> (not res!76437) (not e!105416))))

(declare-fun valid!766 (LongMapFixedSize!1672) Bool)

(assert (=> start!16192 (= res!76437 (valid!766 thiss!1248))))

(assert (=> start!16192 e!105416))

(assert (=> start!16192 e!105415))

(assert (=> start!16192 true))

(declare-fun b!161309 () Bool)

(declare-fun e!105420 () Bool)

(assert (=> b!161309 (= e!105420 tp_is_empty!3451)))

(declare-fun mapIsEmpty!5864 () Bool)

(assert (=> mapIsEmpty!5864 mapRes!5864))

(declare-fun mapNonEmpty!5864 () Bool)

(declare-fun tp!13516 () Bool)

(assert (=> mapNonEmpty!5864 (= mapRes!5864 (and tp!13516 e!105420))))

(declare-fun mapRest!5864 () (Array (_ BitVec 32) ValueCell!1382))

(declare-fun mapValue!5864 () ValueCell!1382)

(declare-fun mapKey!5864 () (_ BitVec 32))

(assert (=> mapNonEmpty!5864 (= (arr!2825 (_values!3261 thiss!1248)) (store mapRest!5864 mapKey!5864 mapValue!5864))))

(assert (= (and start!16192 res!76437) b!161306))

(assert (= (and b!161306 res!76436) b!161311))

(assert (= (and b!161311 res!76435) b!161305))

(assert (= (and b!161305 c!29936) b!161304))

(assert (= (and b!161305 (not c!29936)) b!161303))

(assert (= (and b!161308 condMapEmpty!5864) mapIsEmpty!5864))

(assert (= (and b!161308 (not condMapEmpty!5864)) mapNonEmpty!5864))

(assert (= (and mapNonEmpty!5864 ((_ is ValueCellFull!1382) mapValue!5864)) b!161309))

(assert (= (and b!161308 ((_ is ValueCellFull!1382) mapDefault!5864)) b!161307))

(assert (= b!161310 b!161308))

(assert (= start!16192 b!161310))

(declare-fun m!192319 () Bool)

(assert (=> mapNonEmpty!5864 m!192319))

(declare-fun m!192321 () Bool)

(assert (=> b!161303 m!192321))

(declare-fun m!192323 () Bool)

(assert (=> start!16192 m!192323))

(declare-fun m!192325 () Bool)

(assert (=> b!161305 m!192325))

(assert (=> b!161305 m!192325))

(declare-fun m!192327 () Bool)

(assert (=> b!161305 m!192327))

(declare-fun m!192329 () Bool)

(assert (=> b!161311 m!192329))

(declare-fun m!192331 () Bool)

(assert (=> b!161310 m!192331))

(declare-fun m!192333 () Bool)

(assert (=> b!161310 m!192333))

(declare-fun m!192335 () Bool)

(assert (=> b!161304 m!192335))

(check-sat (not b!161304) (not mapNonEmpty!5864) tp_is_empty!3451 (not start!16192) b_and!10037 (not b!161305) (not b_next!3649) (not b!161311) (not b!161303) (not b!161310))
(check-sat b_and!10037 (not b_next!3649))
