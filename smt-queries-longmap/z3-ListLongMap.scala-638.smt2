; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16180 () Bool)

(assert start!16180)

(declare-fun b!161342 () Bool)

(declare-fun b_free!3637 () Bool)

(declare-fun b_next!3637 () Bool)

(assert (=> b!161342 (= b_free!3637 (not b_next!3637))))

(declare-fun tp!13480 () Bool)

(declare-fun b_and!10065 () Bool)

(assert (=> b!161342 (= tp!13480 b_and!10065)))

(declare-fun b!161335 () Bool)

(declare-datatypes ((Unit!5009 0))(
  ( (Unit!5010) )
))
(declare-fun e!105420 () Unit!5009)

(declare-datatypes ((V!4233 0))(
  ( (V!4234 (val!1764 Int)) )
))
(declare-datatypes ((ValueCell!1376 0))(
  ( (ValueCellFull!1376 (v!3630 V!4233)) (EmptyCell!1376) )
))
(declare-datatypes ((array!5943 0))(
  ( (array!5944 (arr!2816 (Array (_ BitVec 32) (_ BitVec 64))) (size!3100 (_ BitVec 32))) )
))
(declare-datatypes ((array!5945 0))(
  ( (array!5946 (arr!2817 (Array (_ BitVec 32) ValueCell!1376)) (size!3101 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1660 0))(
  ( (LongMapFixedSize!1661 (defaultEntry!3272 Int) (mask!7860 (_ BitVec 32)) (extraKeys!3013 (_ BitVec 32)) (zeroValue!3115 V!4233) (minValue!3115 V!4233) (_size!879 (_ BitVec 32)) (_keys!5073 array!5943) (_values!3255 array!5945) (_vacant!879 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1660)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!73 (array!5943 array!5945 (_ BitVec 32) (_ BitVec 32) V!4233 V!4233 (_ BitVec 64) Int) Unit!5009)

(assert (=> b!161335 (= e!105420 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!73 (_keys!5073 thiss!1248) (_values!3255 thiss!1248) (mask!7860 thiss!1248) (extraKeys!3013 thiss!1248) (zeroValue!3115 thiss!1248) (minValue!3115 thiss!1248) key!828 (defaultEntry!3272 thiss!1248)))))

(declare-fun b!161336 () Bool)

(declare-fun e!105419 () Bool)

(declare-fun e!105418 () Bool)

(declare-fun mapRes!5846 () Bool)

(assert (=> b!161336 (= e!105419 (and e!105418 mapRes!5846))))

(declare-fun condMapEmpty!5846 () Bool)

(declare-fun mapDefault!5846 () ValueCell!1376)

(assert (=> b!161336 (= condMapEmpty!5846 (= (arr!2817 (_values!3255 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1376)) mapDefault!5846)))))

(declare-fun b!161337 () Bool)

(declare-fun e!105415 () Bool)

(declare-fun tp_is_empty!3439 () Bool)

(assert (=> b!161337 (= e!105415 tp_is_empty!3439)))

(declare-fun b!161338 () Bool)

(assert (=> b!161338 (= e!105418 tp_is_empty!3439)))

(declare-fun b!161339 () Bool)

(declare-fun Unit!5011 () Unit!5009)

(assert (=> b!161339 (= e!105420 Unit!5011)))

(declare-fun lt!82238 () Unit!5009)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!74 (array!5943 array!5945 (_ BitVec 32) (_ BitVec 32) V!4233 V!4233 (_ BitVec 64) Int) Unit!5009)

(assert (=> b!161339 (= lt!82238 (lemmaInListMapThenSeekEntryOrOpenFindsIt!74 (_keys!5073 thiss!1248) (_values!3255 thiss!1248) (mask!7860 thiss!1248) (extraKeys!3013 thiss!1248) (zeroValue!3115 thiss!1248) (minValue!3115 thiss!1248) key!828 (defaultEntry!3272 thiss!1248)))))

(assert (=> b!161339 false))

(declare-fun b!161340 () Bool)

(declare-fun e!105417 () Bool)

(assert (=> b!161340 (= e!105417 false)))

(declare-fun lt!82239 () Unit!5009)

(assert (=> b!161340 (= lt!82239 e!105420)))

(declare-fun c!29957 () Bool)

(declare-datatypes ((tuple2!2908 0))(
  ( (tuple2!2909 (_1!1465 (_ BitVec 64)) (_2!1465 V!4233)) )
))
(declare-datatypes ((List!1970 0))(
  ( (Nil!1967) (Cons!1966 (h!2579 tuple2!2908) (t!6764 List!1970)) )
))
(declare-datatypes ((ListLongMap!1907 0))(
  ( (ListLongMap!1908 (toList!969 List!1970)) )
))
(declare-fun contains!1015 (ListLongMap!1907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!636 (array!5943 array!5945 (_ BitVec 32) (_ BitVec 32) V!4233 V!4233 (_ BitVec 32) Int) ListLongMap!1907)

(assert (=> b!161340 (= c!29957 (contains!1015 (getCurrentListMap!636 (_keys!5073 thiss!1248) (_values!3255 thiss!1248) (mask!7860 thiss!1248) (extraKeys!3013 thiss!1248) (zeroValue!3115 thiss!1248) (minValue!3115 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3272 thiss!1248)) key!828))))

(declare-fun b!161341 () Bool)

(declare-fun res!76497 () Bool)

(assert (=> b!161341 (=> (not res!76497) (not e!105417))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!344 0))(
  ( (MissingZero!344 (index!3544 (_ BitVec 32))) (Found!344 (index!3545 (_ BitVec 32))) (Intermediate!344 (undefined!1156 Bool) (index!3546 (_ BitVec 32)) (x!17792 (_ BitVec 32))) (Undefined!344) (MissingVacant!344 (index!3547 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5943 (_ BitVec 32)) SeekEntryResult!344)

(assert (=> b!161341 (= res!76497 ((_ is Undefined!344) (seekEntryOrOpen!0 key!828 (_keys!5073 thiss!1248) (mask!7860 thiss!1248))))))

(declare-fun e!105416 () Bool)

(declare-fun array_inv!1801 (array!5943) Bool)

(declare-fun array_inv!1802 (array!5945) Bool)

(assert (=> b!161342 (= e!105416 (and tp!13480 tp_is_empty!3439 (array_inv!1801 (_keys!5073 thiss!1248)) (array_inv!1802 (_values!3255 thiss!1248)) e!105419))))

(declare-fun b!161343 () Bool)

(declare-fun res!76498 () Bool)

(assert (=> b!161343 (=> (not res!76498) (not e!105417))))

(assert (=> b!161343 (= res!76498 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5846 () Bool)

(declare-fun tp!13481 () Bool)

(assert (=> mapNonEmpty!5846 (= mapRes!5846 (and tp!13481 e!105415))))

(declare-fun mapValue!5846 () ValueCell!1376)

(declare-fun mapKey!5846 () (_ BitVec 32))

(declare-fun mapRest!5846 () (Array (_ BitVec 32) ValueCell!1376))

(assert (=> mapNonEmpty!5846 (= (arr!2817 (_values!3255 thiss!1248)) (store mapRest!5846 mapKey!5846 mapValue!5846))))

(declare-fun res!76499 () Bool)

(assert (=> start!16180 (=> (not res!76499) (not e!105417))))

(declare-fun valid!781 (LongMapFixedSize!1660) Bool)

(assert (=> start!16180 (= res!76499 (valid!781 thiss!1248))))

(assert (=> start!16180 e!105417))

(assert (=> start!16180 e!105416))

(assert (=> start!16180 true))

(declare-fun mapIsEmpty!5846 () Bool)

(assert (=> mapIsEmpty!5846 mapRes!5846))

(assert (= (and start!16180 res!76499) b!161343))

(assert (= (and b!161343 res!76498) b!161341))

(assert (= (and b!161341 res!76497) b!161340))

(assert (= (and b!161340 c!29957) b!161339))

(assert (= (and b!161340 (not c!29957)) b!161335))

(assert (= (and b!161336 condMapEmpty!5846) mapIsEmpty!5846))

(assert (= (and b!161336 (not condMapEmpty!5846)) mapNonEmpty!5846))

(assert (= (and mapNonEmpty!5846 ((_ is ValueCellFull!1376) mapValue!5846)) b!161337))

(assert (= (and b!161336 ((_ is ValueCellFull!1376) mapDefault!5846)) b!161338))

(assert (= b!161342 b!161336))

(assert (= start!16180 b!161342))

(declare-fun m!193013 () Bool)

(assert (=> b!161342 m!193013))

(declare-fun m!193015 () Bool)

(assert (=> b!161342 m!193015))

(declare-fun m!193017 () Bool)

(assert (=> mapNonEmpty!5846 m!193017))

(declare-fun m!193019 () Bool)

(assert (=> b!161341 m!193019))

(declare-fun m!193021 () Bool)

(assert (=> b!161339 m!193021))

(declare-fun m!193023 () Bool)

(assert (=> start!16180 m!193023))

(declare-fun m!193025 () Bool)

(assert (=> b!161335 m!193025))

(declare-fun m!193027 () Bool)

(assert (=> b!161340 m!193027))

(assert (=> b!161340 m!193027))

(declare-fun m!193029 () Bool)

(assert (=> b!161340 m!193029))

(check-sat (not b!161340) (not b!161341) (not b!161342) b_and!10065 (not b!161339) tp_is_empty!3439 (not b!161335) (not b_next!3637) (not mapNonEmpty!5846) (not start!16180))
(check-sat b_and!10065 (not b_next!3637))
