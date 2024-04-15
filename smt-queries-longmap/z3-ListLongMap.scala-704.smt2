; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16732 () Bool)

(assert start!16732)

(declare-fun b!167816 () Bool)

(declare-fun b_free!4033 () Bool)

(declare-fun b_next!4033 () Bool)

(assert (=> b!167816 (= b_free!4033 (not b_next!4033))))

(declare-fun tp!14699 () Bool)

(declare-fun b_and!10421 () Bool)

(assert (=> b!167816 (= tp!14699 b_and!10421)))

(declare-fun b!167808 () Bool)

(declare-fun e!110268 () Bool)

(declare-fun e!110265 () Bool)

(declare-fun mapRes!6471 () Bool)

(assert (=> b!167808 (= e!110268 (and e!110265 mapRes!6471))))

(declare-fun condMapEmpty!6471 () Bool)

(declare-datatypes ((V!4761 0))(
  ( (V!4762 (val!1962 Int)) )
))
(declare-datatypes ((ValueCell!1574 0))(
  ( (ValueCellFull!1574 (v!3821 V!4761)) (EmptyCell!1574) )
))
(declare-datatypes ((array!6747 0))(
  ( (array!6748 (arr!3208 (Array (_ BitVec 32) (_ BitVec 64))) (size!3497 (_ BitVec 32))) )
))
(declare-datatypes ((array!6749 0))(
  ( (array!6750 (arr!3209 (Array (_ BitVec 32) ValueCell!1574)) (size!3498 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2056 0))(
  ( (LongMapFixedSize!2057 (defaultEntry!3470 Int) (mask!8226 (_ BitVec 32)) (extraKeys!3211 (_ BitVec 32)) (zeroValue!3313 V!4761) (minValue!3313 V!4761) (_size!1077 (_ BitVec 32)) (_keys!5294 array!6747) (_values!3453 array!6749) (_vacant!1077 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2056)

(declare-fun mapDefault!6471 () ValueCell!1574)

(assert (=> b!167808 (= condMapEmpty!6471 (= (arr!3209 (_values!3453 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1574)) mapDefault!6471)))))

(declare-fun b!167809 () Bool)

(declare-datatypes ((Unit!5130 0))(
  ( (Unit!5131) )
))
(declare-fun e!110264 () Unit!5130)

(declare-fun lt!83788 () Unit!5130)

(assert (=> b!167809 (= e!110264 lt!83788)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!111 (array!6747 array!6749 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 64) Int) Unit!5130)

(assert (=> b!167809 (= lt!83788 (lemmaInListMapThenSeekEntryOrOpenFindsIt!111 (_keys!5294 thiss!1248) (_values!3453 thiss!1248) (mask!8226 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) key!828 (defaultEntry!3470 thiss!1248)))))

(declare-fun res!79828 () Bool)

(declare-datatypes ((SeekEntryResult!500 0))(
  ( (MissingZero!500 (index!4168 (_ BitVec 32))) (Found!500 (index!4169 (_ BitVec 32))) (Intermediate!500 (undefined!1312 Bool) (index!4170 (_ BitVec 32)) (x!18583 (_ BitVec 32))) (Undefined!500) (MissingVacant!500 (index!4171 (_ BitVec 32))) )
))
(declare-fun lt!83785 () SeekEntryResult!500)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167809 (= res!79828 (inRange!0 (index!4169 lt!83785) (mask!8226 thiss!1248)))))

(declare-fun e!110267 () Bool)

(assert (=> b!167809 (=> (not res!79828) (not e!110267))))

(assert (=> b!167809 e!110267))

(declare-fun b!167810 () Bool)

(assert (=> b!167810 (= e!110267 (= (select (arr!3208 (_keys!5294 thiss!1248)) (index!4169 lt!83785)) key!828))))

(declare-fun b!167811 () Bool)

(declare-fun res!79822 () Bool)

(declare-fun e!110263 () Bool)

(assert (=> b!167811 (=> (not res!79822) (not e!110263))))

(assert (=> b!167811 (= res!79822 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167812 () Bool)

(declare-fun e!110261 () Bool)

(declare-fun tp_is_empty!3835 () Bool)

(assert (=> b!167812 (= e!110261 tp_is_empty!3835)))

(declare-fun b!167813 () Bool)

(declare-fun e!110262 () Bool)

(declare-fun e!110266 () Bool)

(assert (=> b!167813 (= e!110262 (not e!110266))))

(declare-fun res!79823 () Bool)

(assert (=> b!167813 (=> res!79823 e!110266)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167813 (= res!79823 (not (validMask!0 (mask!8226 thiss!1248))))))

(declare-datatypes ((tuple2!3148 0))(
  ( (tuple2!3149 (_1!1585 (_ BitVec 64)) (_2!1585 V!4761)) )
))
(declare-datatypes ((List!2150 0))(
  ( (Nil!2147) (Cons!2146 (h!2763 tuple2!3148) (t!6943 List!2150)) )
))
(declare-datatypes ((ListLongMap!2091 0))(
  ( (ListLongMap!2092 (toList!1061 List!2150)) )
))
(declare-fun lt!83786 () ListLongMap!2091)

(declare-fun v!309 () V!4761)

(declare-fun +!212 (ListLongMap!2091 tuple2!3148) ListLongMap!2091)

(declare-fun getCurrentListMap!703 (array!6747 array!6749 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 32) Int) ListLongMap!2091)

(assert (=> b!167813 (= (+!212 lt!83786 (tuple2!3149 key!828 v!309)) (getCurrentListMap!703 (_keys!5294 thiss!1248) (array!6750 (store (arr!3209 (_values!3453 thiss!1248)) (index!4169 lt!83785) (ValueCellFull!1574 v!309)) (size!3498 (_values!3453 thiss!1248))) (mask!8226 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3470 thiss!1248)))))

(declare-fun lt!83790 () Unit!5130)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!84 (array!6747 array!6749 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 32) (_ BitVec 64) V!4761 Int) Unit!5130)

(assert (=> b!167813 (= lt!83790 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!84 (_keys!5294 thiss!1248) (_values!3453 thiss!1248) (mask!8226 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) (index!4169 lt!83785) key!828 v!309 (defaultEntry!3470 thiss!1248)))))

(declare-fun lt!83784 () Unit!5130)

(assert (=> b!167813 (= lt!83784 e!110264)))

(declare-fun c!30305 () Bool)

(declare-fun contains!1106 (ListLongMap!2091 (_ BitVec 64)) Bool)

(assert (=> b!167813 (= c!30305 (contains!1106 lt!83786 key!828))))

(assert (=> b!167813 (= lt!83786 (getCurrentListMap!703 (_keys!5294 thiss!1248) (_values!3453 thiss!1248) (mask!8226 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3470 thiss!1248)))))

(declare-fun b!167814 () Bool)

(declare-fun res!79824 () Bool)

(assert (=> b!167814 (=> res!79824 e!110266)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6747 (_ BitVec 32)) Bool)

(assert (=> b!167814 (= res!79824 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5294 thiss!1248) (mask!8226 thiss!1248))))))

(declare-fun b!167815 () Bool)

(declare-fun Unit!5132 () Unit!5130)

(assert (=> b!167815 (= e!110264 Unit!5132)))

(declare-fun lt!83789 () Unit!5130)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!112 (array!6747 array!6749 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 64) Int) Unit!5130)

(assert (=> b!167815 (= lt!83789 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!112 (_keys!5294 thiss!1248) (_values!3453 thiss!1248) (mask!8226 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) key!828 (defaultEntry!3470 thiss!1248)))))

(assert (=> b!167815 false))

(declare-fun res!79825 () Bool)

(assert (=> start!16732 (=> (not res!79825) (not e!110263))))

(declare-fun valid!906 (LongMapFixedSize!2056) Bool)

(assert (=> start!16732 (= res!79825 (valid!906 thiss!1248))))

(assert (=> start!16732 e!110263))

(declare-fun e!110260 () Bool)

(assert (=> start!16732 e!110260))

(assert (=> start!16732 true))

(assert (=> start!16732 tp_is_empty!3835))

(declare-fun array_inv!2065 (array!6747) Bool)

(declare-fun array_inv!2066 (array!6749) Bool)

(assert (=> b!167816 (= e!110260 (and tp!14699 tp_is_empty!3835 (array_inv!2065 (_keys!5294 thiss!1248)) (array_inv!2066 (_values!3453 thiss!1248)) e!110268))))

(declare-fun b!167817 () Bool)

(assert (=> b!167817 (= e!110266 true)))

(declare-fun lt!83787 () Bool)

(declare-datatypes ((List!2151 0))(
  ( (Nil!2148) (Cons!2147 (h!2764 (_ BitVec 64)) (t!6944 List!2151)) )
))
(declare-fun arrayNoDuplicates!0 (array!6747 (_ BitVec 32) List!2151) Bool)

(assert (=> b!167817 (= lt!83787 (arrayNoDuplicates!0 (_keys!5294 thiss!1248) #b00000000000000000000000000000000 Nil!2148))))

(declare-fun mapIsEmpty!6471 () Bool)

(assert (=> mapIsEmpty!6471 mapRes!6471))

(declare-fun mapNonEmpty!6471 () Bool)

(declare-fun tp!14700 () Bool)

(assert (=> mapNonEmpty!6471 (= mapRes!6471 (and tp!14700 e!110261))))

(declare-fun mapValue!6471 () ValueCell!1574)

(declare-fun mapKey!6471 () (_ BitVec 32))

(declare-fun mapRest!6471 () (Array (_ BitVec 32) ValueCell!1574))

(assert (=> mapNonEmpty!6471 (= (arr!3209 (_values!3453 thiss!1248)) (store mapRest!6471 mapKey!6471 mapValue!6471))))

(declare-fun b!167818 () Bool)

(declare-fun res!79826 () Bool)

(assert (=> b!167818 (=> res!79826 e!110266)))

(assert (=> b!167818 (= res!79826 (or (not (= (size!3498 (_values!3453 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8226 thiss!1248)))) (not (= (size!3497 (_keys!5294 thiss!1248)) (size!3498 (_values!3453 thiss!1248)))) (bvslt (mask!8226 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3211 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3211 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167819 () Bool)

(assert (=> b!167819 (= e!110263 e!110262)))

(declare-fun res!79827 () Bool)

(assert (=> b!167819 (=> (not res!79827) (not e!110262))))

(get-info :version)

(assert (=> b!167819 (= res!79827 (and (not ((_ is Undefined!500) lt!83785)) (not ((_ is MissingVacant!500) lt!83785)) (not ((_ is MissingZero!500) lt!83785)) ((_ is Found!500) lt!83785)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6747 (_ BitVec 32)) SeekEntryResult!500)

(assert (=> b!167819 (= lt!83785 (seekEntryOrOpen!0 key!828 (_keys!5294 thiss!1248) (mask!8226 thiss!1248)))))

(declare-fun b!167820 () Bool)

(assert (=> b!167820 (= e!110265 tp_is_empty!3835)))

(assert (= (and start!16732 res!79825) b!167811))

(assert (= (and b!167811 res!79822) b!167819))

(assert (= (and b!167819 res!79827) b!167813))

(assert (= (and b!167813 c!30305) b!167809))

(assert (= (and b!167813 (not c!30305)) b!167815))

(assert (= (and b!167809 res!79828) b!167810))

(assert (= (and b!167813 (not res!79823)) b!167818))

(assert (= (and b!167818 (not res!79826)) b!167814))

(assert (= (and b!167814 (not res!79824)) b!167817))

(assert (= (and b!167808 condMapEmpty!6471) mapIsEmpty!6471))

(assert (= (and b!167808 (not condMapEmpty!6471)) mapNonEmpty!6471))

(assert (= (and mapNonEmpty!6471 ((_ is ValueCellFull!1574) mapValue!6471)) b!167812))

(assert (= (and b!167808 ((_ is ValueCellFull!1574) mapDefault!6471)) b!167820))

(assert (= b!167816 b!167808))

(assert (= start!16732 b!167816))

(declare-fun m!196447 () Bool)

(assert (=> start!16732 m!196447))

(declare-fun m!196449 () Bool)

(assert (=> b!167815 m!196449))

(declare-fun m!196451 () Bool)

(assert (=> b!167813 m!196451))

(declare-fun m!196453 () Bool)

(assert (=> b!167813 m!196453))

(declare-fun m!196455 () Bool)

(assert (=> b!167813 m!196455))

(declare-fun m!196457 () Bool)

(assert (=> b!167813 m!196457))

(declare-fun m!196459 () Bool)

(assert (=> b!167813 m!196459))

(declare-fun m!196461 () Bool)

(assert (=> b!167813 m!196461))

(declare-fun m!196463 () Bool)

(assert (=> b!167813 m!196463))

(declare-fun m!196465 () Bool)

(assert (=> b!167817 m!196465))

(declare-fun m!196467 () Bool)

(assert (=> b!167810 m!196467))

(declare-fun m!196469 () Bool)

(assert (=> b!167809 m!196469))

(declare-fun m!196471 () Bool)

(assert (=> b!167809 m!196471))

(declare-fun m!196473 () Bool)

(assert (=> b!167819 m!196473))

(declare-fun m!196475 () Bool)

(assert (=> mapNonEmpty!6471 m!196475))

(declare-fun m!196477 () Bool)

(assert (=> b!167816 m!196477))

(declare-fun m!196479 () Bool)

(assert (=> b!167816 m!196479))

(declare-fun m!196481 () Bool)

(assert (=> b!167814 m!196481))

(check-sat (not b!167817) (not b!167819) (not b!167813) (not b!167815) b_and!10421 (not b!167816) tp_is_empty!3835 (not mapNonEmpty!6471) (not b!167814) (not start!16732) (not b!167809) (not b_next!4033))
(check-sat b_and!10421 (not b_next!4033))
