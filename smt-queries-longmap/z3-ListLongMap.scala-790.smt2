; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18806 () Bool)

(assert start!18806)

(declare-fun b!185857 () Bool)

(declare-fun b_free!4581 () Bool)

(declare-fun b_next!4581 () Bool)

(assert (=> b!185857 (= b_free!4581 (not b_next!4581))))

(declare-fun tp!16542 () Bool)

(declare-fun b_and!11183 () Bool)

(assert (=> b!185857 (= tp!16542 b_and!11183)))

(declare-fun b!185855 () Bool)

(declare-fun e!122294 () Bool)

(declare-fun tp_is_empty!4353 () Bool)

(assert (=> b!185855 (= e!122294 tp_is_empty!4353)))

(declare-fun b!185856 () Bool)

(declare-fun e!122298 () Bool)

(assert (=> b!185856 (= e!122298 tp_is_empty!4353)))

(declare-fun e!122299 () Bool)

(declare-datatypes ((V!5451 0))(
  ( (V!5452 (val!2221 Int)) )
))
(declare-datatypes ((ValueCell!1833 0))(
  ( (ValueCellFull!1833 (v!4132 V!5451)) (EmptyCell!1833) )
))
(declare-datatypes ((array!7915 0))(
  ( (array!7916 (arr!3737 (Array (_ BitVec 32) (_ BitVec 64))) (size!4053 (_ BitVec 32))) )
))
(declare-datatypes ((array!7917 0))(
  ( (array!7918 (arr!3738 (Array (_ BitVec 32) ValueCell!1833)) (size!4054 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2574 0))(
  ( (LongMapFixedSize!2575 (defaultEntry!3789 Int) (mask!8904 (_ BitVec 32)) (extraKeys!3526 (_ BitVec 32)) (zeroValue!3630 V!5451) (minValue!3630 V!5451) (_size!1336 (_ BitVec 32)) (_keys!5730 array!7915) (_values!3772 array!7917) (_vacant!1336 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2574)

(declare-fun e!122297 () Bool)

(declare-fun array_inv!2417 (array!7915) Bool)

(declare-fun array_inv!2418 (array!7917) Bool)

(assert (=> b!185857 (= e!122297 (and tp!16542 tp_is_empty!4353 (array_inv!2417 (_keys!5730 thiss!1248)) (array_inv!2418 (_values!3772 thiss!1248)) e!122299))))

(declare-fun mapNonEmpty!7491 () Bool)

(declare-fun mapRes!7491 () Bool)

(declare-fun tp!16541 () Bool)

(assert (=> mapNonEmpty!7491 (= mapRes!7491 (and tp!16541 e!122294))))

(declare-fun mapKey!7491 () (_ BitVec 32))

(declare-fun mapRest!7491 () (Array (_ BitVec 32) ValueCell!1833))

(declare-fun mapValue!7491 () ValueCell!1833)

(assert (=> mapNonEmpty!7491 (= (arr!3738 (_values!3772 thiss!1248)) (store mapRest!7491 mapKey!7491 mapValue!7491))))

(declare-fun res!87935 () Bool)

(declare-fun e!122293 () Bool)

(assert (=> start!18806 (=> (not res!87935) (not e!122293))))

(declare-fun valid!1061 (LongMapFixedSize!2574) Bool)

(assert (=> start!18806 (= res!87935 (valid!1061 thiss!1248))))

(assert (=> start!18806 e!122293))

(assert (=> start!18806 e!122297))

(assert (=> start!18806 true))

(declare-fun b!185858 () Bool)

(declare-fun res!87937 () Bool)

(declare-fun e!122295 () Bool)

(assert (=> b!185858 (=> (not res!87937) (not e!122295))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3460 0))(
  ( (tuple2!3461 (_1!1741 (_ BitVec 64)) (_2!1741 V!5451)) )
))
(declare-datatypes ((List!2369 0))(
  ( (Nil!2366) (Cons!2365 (h!2998 tuple2!3460) (t!7253 List!2369)) )
))
(declare-datatypes ((ListLongMap!2377 0))(
  ( (ListLongMap!2378 (toList!1204 List!2369)) )
))
(declare-fun contains!1300 (ListLongMap!2377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!852 (array!7915 array!7917 (_ BitVec 32) (_ BitVec 32) V!5451 V!5451 (_ BitVec 32) Int) ListLongMap!2377)

(assert (=> b!185858 (= res!87937 (not (contains!1300 (getCurrentListMap!852 (_keys!5730 thiss!1248) (_values!3772 thiss!1248) (mask!8904 thiss!1248) (extraKeys!3526 thiss!1248) (zeroValue!3630 thiss!1248) (minValue!3630 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3789 thiss!1248)) key!828)))))

(declare-fun b!185859 () Bool)

(declare-fun res!87938 () Bool)

(assert (=> b!185859 (=> (not res!87938) (not e!122293))))

(assert (=> b!185859 (= res!87938 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7491 () Bool)

(assert (=> mapIsEmpty!7491 mapRes!7491))

(declare-fun b!185860 () Bool)

(assert (=> b!185860 (= e!122295 (not true))))

(assert (=> b!185860 false))

(declare-datatypes ((Unit!5598 0))(
  ( (Unit!5599) )
))
(declare-fun lt!91881 () Unit!5598)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!144 (array!7915 array!7917 (_ BitVec 32) (_ BitVec 32) V!5451 V!5451 (_ BitVec 64) Int) Unit!5598)

(assert (=> b!185860 (= lt!91881 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!144 (_keys!5730 thiss!1248) (_values!3772 thiss!1248) (mask!8904 thiss!1248) (extraKeys!3526 thiss!1248) (zeroValue!3630 thiss!1248) (minValue!3630 thiss!1248) key!828 (defaultEntry!3789 thiss!1248)))))

(declare-fun b!185861 () Bool)

(assert (=> b!185861 (= e!122293 e!122295)))

(declare-fun res!87936 () Bool)

(assert (=> b!185861 (=> (not res!87936) (not e!122295))))

(declare-datatypes ((SeekEntryResult!638 0))(
  ( (MissingZero!638 (index!4722 (_ BitVec 32))) (Found!638 (index!4723 (_ BitVec 32))) (Intermediate!638 (undefined!1450 Bool) (index!4724 (_ BitVec 32)) (x!20176 (_ BitVec 32))) (Undefined!638) (MissingVacant!638 (index!4725 (_ BitVec 32))) )
))
(declare-fun lt!91880 () SeekEntryResult!638)

(get-info :version)

(assert (=> b!185861 (= res!87936 (and (not ((_ is Undefined!638) lt!91880)) (not ((_ is MissingVacant!638) lt!91880)) (not ((_ is MissingZero!638) lt!91880)) ((_ is Found!638) lt!91880)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7915 (_ BitVec 32)) SeekEntryResult!638)

(assert (=> b!185861 (= lt!91880 (seekEntryOrOpen!0 key!828 (_keys!5730 thiss!1248) (mask!8904 thiss!1248)))))

(declare-fun b!185862 () Bool)

(assert (=> b!185862 (= e!122299 (and e!122298 mapRes!7491))))

(declare-fun condMapEmpty!7491 () Bool)

(declare-fun mapDefault!7491 () ValueCell!1833)

(assert (=> b!185862 (= condMapEmpty!7491 (= (arr!3738 (_values!3772 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1833)) mapDefault!7491)))))

(assert (= (and start!18806 res!87935) b!185859))

(assert (= (and b!185859 res!87938) b!185861))

(assert (= (and b!185861 res!87936) b!185858))

(assert (= (and b!185858 res!87937) b!185860))

(assert (= (and b!185862 condMapEmpty!7491) mapIsEmpty!7491))

(assert (= (and b!185862 (not condMapEmpty!7491)) mapNonEmpty!7491))

(assert (= (and mapNonEmpty!7491 ((_ is ValueCellFull!1833) mapValue!7491)) b!185855))

(assert (= (and b!185862 ((_ is ValueCellFull!1833) mapDefault!7491)) b!185856))

(assert (= b!185857 b!185862))

(assert (= start!18806 b!185857))

(declare-fun m!212941 () Bool)

(assert (=> b!185860 m!212941))

(declare-fun m!212943 () Bool)

(assert (=> start!18806 m!212943))

(declare-fun m!212945 () Bool)

(assert (=> b!185858 m!212945))

(assert (=> b!185858 m!212945))

(declare-fun m!212947 () Bool)

(assert (=> b!185858 m!212947))

(declare-fun m!212949 () Bool)

(assert (=> b!185857 m!212949))

(declare-fun m!212951 () Bool)

(assert (=> b!185857 m!212951))

(declare-fun m!212953 () Bool)

(assert (=> b!185861 m!212953))

(declare-fun m!212955 () Bool)

(assert (=> mapNonEmpty!7491 m!212955))

(check-sat (not b!185861) (not b!185860) (not mapNonEmpty!7491) (not b_next!4581) (not b!185858) tp_is_empty!4353 b_and!11183 (not start!18806) (not b!185857))
(check-sat b_and!11183 (not b_next!4581))
