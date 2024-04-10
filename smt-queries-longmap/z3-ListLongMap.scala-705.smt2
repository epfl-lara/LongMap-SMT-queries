; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16736 () Bool)

(assert start!16736)

(declare-fun b!168117 () Bool)

(declare-fun b_free!4041 () Bool)

(declare-fun b_next!4041 () Bool)

(assert (=> b!168117 (= b_free!4041 (not b_next!4041))))

(declare-fun tp!14723 () Bool)

(declare-fun b_and!10455 () Bool)

(assert (=> b!168117 (= tp!14723 b_and!10455)))

(declare-fun b!168111 () Bool)

(declare-fun e!110481 () Bool)

(declare-fun tp_is_empty!3843 () Bool)

(assert (=> b!168111 (= e!110481 tp_is_empty!3843)))

(declare-fun b!168112 () Bool)

(declare-fun e!110487 () Bool)

(assert (=> b!168112 (= e!110487 tp_is_empty!3843)))

(declare-fun b!168113 () Bool)

(declare-fun res!80001 () Bool)

(declare-fun e!110485 () Bool)

(assert (=> b!168113 (=> (not res!80001) (not e!110485))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168113 (= res!80001 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168114 () Bool)

(declare-datatypes ((SeekEntryResult!493 0))(
  ( (MissingZero!493 (index!4140 (_ BitVec 32))) (Found!493 (index!4141 (_ BitVec 32))) (Intermediate!493 (undefined!1305 Bool) (index!4142 (_ BitVec 32)) (x!18585 (_ BitVec 32))) (Undefined!493) (MissingVacant!493 (index!4143 (_ BitVec 32))) )
))
(declare-fun lt!84051 () SeekEntryResult!493)

(declare-datatypes ((V!4771 0))(
  ( (V!4772 (val!1966 Int)) )
))
(declare-datatypes ((ValueCell!1578 0))(
  ( (ValueCellFull!1578 (v!3831 V!4771)) (EmptyCell!1578) )
))
(declare-datatypes ((array!6783 0))(
  ( (array!6784 (arr!3227 (Array (_ BitVec 32) (_ BitVec 64))) (size!3515 (_ BitVec 32))) )
))
(declare-datatypes ((array!6785 0))(
  ( (array!6786 (arr!3228 (Array (_ BitVec 32) ValueCell!1578)) (size!3516 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2064 0))(
  ( (LongMapFixedSize!2065 (defaultEntry!3474 Int) (mask!8233 (_ BitVec 32)) (extraKeys!3215 (_ BitVec 32)) (zeroValue!3317 V!4771) (minValue!3317 V!4771) (_size!1081 (_ BitVec 32)) (_keys!5299 array!6783) (_values!3457 array!6785) (_vacant!1081 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2064)

(declare-fun e!110483 () Bool)

(assert (=> b!168114 (= e!110483 (= (select (arr!3227 (_keys!5299 thiss!1248)) (index!4141 lt!84051)) key!828))))

(declare-fun b!168115 () Bool)

(declare-datatypes ((Unit!5163 0))(
  ( (Unit!5164) )
))
(declare-fun e!110480 () Unit!5163)

(declare-fun Unit!5165 () Unit!5163)

(assert (=> b!168115 (= e!110480 Unit!5165)))

(declare-fun lt!84053 () Unit!5163)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!118 (array!6783 array!6785 (_ BitVec 32) (_ BitVec 32) V!4771 V!4771 (_ BitVec 64) Int) Unit!5163)

(assert (=> b!168115 (= lt!84053 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!118 (_keys!5299 thiss!1248) (_values!3457 thiss!1248) (mask!8233 thiss!1248) (extraKeys!3215 thiss!1248) (zeroValue!3317 thiss!1248) (minValue!3317 thiss!1248) key!828 (defaultEntry!3474 thiss!1248)))))

(assert (=> b!168115 false))

(declare-fun b!168116 () Bool)

(declare-fun e!110482 () Bool)

(declare-fun mapRes!6483 () Bool)

(assert (=> b!168116 (= e!110482 (and e!110487 mapRes!6483))))

(declare-fun condMapEmpty!6483 () Bool)

(declare-fun mapDefault!6483 () ValueCell!1578)

(assert (=> b!168116 (= condMapEmpty!6483 (= (arr!3228 (_values!3457 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1578)) mapDefault!6483)))))

(declare-fun e!110489 () Bool)

(declare-fun array_inv!2073 (array!6783) Bool)

(declare-fun array_inv!2074 (array!6785) Bool)

(assert (=> b!168117 (= e!110489 (and tp!14723 tp_is_empty!3843 (array_inv!2073 (_keys!5299 thiss!1248)) (array_inv!2074 (_values!3457 thiss!1248)) e!110482))))

(declare-fun b!168118 () Bool)

(declare-fun res!80002 () Bool)

(declare-fun e!110486 () Bool)

(assert (=> b!168118 (=> res!80002 e!110486)))

(assert (=> b!168118 (= res!80002 (or (not (= (size!3516 (_values!3457 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8233 thiss!1248)))) (not (= (size!3515 (_keys!5299 thiss!1248)) (size!3516 (_values!3457 thiss!1248)))) (bvslt (mask!8233 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3215 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3215 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6483 () Bool)

(declare-fun tp!14724 () Bool)

(assert (=> mapNonEmpty!6483 (= mapRes!6483 (and tp!14724 e!110481))))

(declare-fun mapValue!6483 () ValueCell!1578)

(declare-fun mapRest!6483 () (Array (_ BitVec 32) ValueCell!1578))

(declare-fun mapKey!6483 () (_ BitVec 32))

(assert (=> mapNonEmpty!6483 (= (arr!3228 (_values!3457 thiss!1248)) (store mapRest!6483 mapKey!6483 mapValue!6483))))

(declare-fun b!168119 () Bool)

(declare-fun e!110488 () Bool)

(assert (=> b!168119 (= e!110488 (not e!110486))))

(declare-fun res!80007 () Bool)

(assert (=> b!168119 (=> res!80007 e!110486)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168119 (= res!80007 (not (validMask!0 (mask!8233 thiss!1248))))))

(declare-datatypes ((tuple2!3158 0))(
  ( (tuple2!3159 (_1!1590 (_ BitVec 64)) (_2!1590 V!4771)) )
))
(declare-datatypes ((List!2148 0))(
  ( (Nil!2145) (Cons!2144 (h!2761 tuple2!3158) (t!6950 List!2148)) )
))
(declare-datatypes ((ListLongMap!2113 0))(
  ( (ListLongMap!2114 (toList!1072 List!2148)) )
))
(declare-fun lt!84049 () ListLongMap!2113)

(declare-fun v!309 () V!4771)

(declare-fun +!224 (ListLongMap!2113 tuple2!3158) ListLongMap!2113)

(declare-fun getCurrentListMap!730 (array!6783 array!6785 (_ BitVec 32) (_ BitVec 32) V!4771 V!4771 (_ BitVec 32) Int) ListLongMap!2113)

(assert (=> b!168119 (= (+!224 lt!84049 (tuple2!3159 key!828 v!309)) (getCurrentListMap!730 (_keys!5299 thiss!1248) (array!6786 (store (arr!3228 (_values!3457 thiss!1248)) (index!4141 lt!84051) (ValueCellFull!1578 v!309)) (size!3516 (_values!3457 thiss!1248))) (mask!8233 thiss!1248) (extraKeys!3215 thiss!1248) (zeroValue!3317 thiss!1248) (minValue!3317 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3474 thiss!1248)))))

(declare-fun lt!84054 () Unit!5163)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!79 (array!6783 array!6785 (_ BitVec 32) (_ BitVec 32) V!4771 V!4771 (_ BitVec 32) (_ BitVec 64) V!4771 Int) Unit!5163)

(assert (=> b!168119 (= lt!84054 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!79 (_keys!5299 thiss!1248) (_values!3457 thiss!1248) (mask!8233 thiss!1248) (extraKeys!3215 thiss!1248) (zeroValue!3317 thiss!1248) (minValue!3317 thiss!1248) (index!4141 lt!84051) key!828 v!309 (defaultEntry!3474 thiss!1248)))))

(declare-fun lt!84055 () Unit!5163)

(assert (=> b!168119 (= lt!84055 e!110480)))

(declare-fun c!30343 () Bool)

(declare-fun contains!1114 (ListLongMap!2113 (_ BitVec 64)) Bool)

(assert (=> b!168119 (= c!30343 (contains!1114 lt!84049 key!828))))

(assert (=> b!168119 (= lt!84049 (getCurrentListMap!730 (_keys!5299 thiss!1248) (_values!3457 thiss!1248) (mask!8233 thiss!1248) (extraKeys!3215 thiss!1248) (zeroValue!3317 thiss!1248) (minValue!3317 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3474 thiss!1248)))))

(declare-fun b!168120 () Bool)

(assert (=> b!168120 (= e!110485 e!110488)))

(declare-fun res!80005 () Bool)

(assert (=> b!168120 (=> (not res!80005) (not e!110488))))

(get-info :version)

(assert (=> b!168120 (= res!80005 (and (not ((_ is Undefined!493) lt!84051)) (not ((_ is MissingVacant!493) lt!84051)) (not ((_ is MissingZero!493) lt!84051)) ((_ is Found!493) lt!84051)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6783 (_ BitVec 32)) SeekEntryResult!493)

(assert (=> b!168120 (= lt!84051 (seekEntryOrOpen!0 key!828 (_keys!5299 thiss!1248) (mask!8233 thiss!1248)))))

(declare-fun res!80006 () Bool)

(assert (=> start!16736 (=> (not res!80006) (not e!110485))))

(declare-fun valid!895 (LongMapFixedSize!2064) Bool)

(assert (=> start!16736 (= res!80006 (valid!895 thiss!1248))))

(assert (=> start!16736 e!110485))

(assert (=> start!16736 e!110489))

(assert (=> start!16736 true))

(assert (=> start!16736 tp_is_empty!3843))

(declare-fun b!168121 () Bool)

(declare-fun res!80004 () Bool)

(assert (=> b!168121 (=> res!80004 e!110486)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6783 (_ BitVec 32)) Bool)

(assert (=> b!168121 (= res!80004 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5299 thiss!1248) (mask!8233 thiss!1248))))))

(declare-fun mapIsEmpty!6483 () Bool)

(assert (=> mapIsEmpty!6483 mapRes!6483))

(declare-fun b!168122 () Bool)

(declare-fun lt!84050 () Unit!5163)

(assert (=> b!168122 (= e!110480 lt!84050)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!116 (array!6783 array!6785 (_ BitVec 32) (_ BitVec 32) V!4771 V!4771 (_ BitVec 64) Int) Unit!5163)

(assert (=> b!168122 (= lt!84050 (lemmaInListMapThenSeekEntryOrOpenFindsIt!116 (_keys!5299 thiss!1248) (_values!3457 thiss!1248) (mask!8233 thiss!1248) (extraKeys!3215 thiss!1248) (zeroValue!3317 thiss!1248) (minValue!3317 thiss!1248) key!828 (defaultEntry!3474 thiss!1248)))))

(declare-fun res!80003 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168122 (= res!80003 (inRange!0 (index!4141 lt!84051) (mask!8233 thiss!1248)))))

(assert (=> b!168122 (=> (not res!80003) (not e!110483))))

(assert (=> b!168122 e!110483))

(declare-fun b!168123 () Bool)

(assert (=> b!168123 (= e!110486 true)))

(declare-fun lt!84052 () Bool)

(declare-datatypes ((List!2149 0))(
  ( (Nil!2146) (Cons!2145 (h!2762 (_ BitVec 64)) (t!6951 List!2149)) )
))
(declare-fun arrayNoDuplicates!0 (array!6783 (_ BitVec 32) List!2149) Bool)

(assert (=> b!168123 (= lt!84052 (arrayNoDuplicates!0 (_keys!5299 thiss!1248) #b00000000000000000000000000000000 Nil!2146))))

(assert (= (and start!16736 res!80006) b!168113))

(assert (= (and b!168113 res!80001) b!168120))

(assert (= (and b!168120 res!80005) b!168119))

(assert (= (and b!168119 c!30343) b!168122))

(assert (= (and b!168119 (not c!30343)) b!168115))

(assert (= (and b!168122 res!80003) b!168114))

(assert (= (and b!168119 (not res!80007)) b!168118))

(assert (= (and b!168118 (not res!80002)) b!168121))

(assert (= (and b!168121 (not res!80004)) b!168123))

(assert (= (and b!168116 condMapEmpty!6483) mapIsEmpty!6483))

(assert (= (and b!168116 (not condMapEmpty!6483)) mapNonEmpty!6483))

(assert (= (and mapNonEmpty!6483 ((_ is ValueCellFull!1578) mapValue!6483)) b!168111))

(assert (= (and b!168116 ((_ is ValueCellFull!1578) mapDefault!6483)) b!168112))

(assert (= b!168117 b!168116))

(assert (= start!16736 b!168117))

(declare-fun m!197211 () Bool)

(assert (=> b!168117 m!197211))

(declare-fun m!197213 () Bool)

(assert (=> b!168117 m!197213))

(declare-fun m!197215 () Bool)

(assert (=> b!168122 m!197215))

(declare-fun m!197217 () Bool)

(assert (=> b!168122 m!197217))

(declare-fun m!197219 () Bool)

(assert (=> b!168121 m!197219))

(declare-fun m!197221 () Bool)

(assert (=> mapNonEmpty!6483 m!197221))

(declare-fun m!197223 () Bool)

(assert (=> start!16736 m!197223))

(declare-fun m!197225 () Bool)

(assert (=> b!168123 m!197225))

(declare-fun m!197227 () Bool)

(assert (=> b!168115 m!197227))

(declare-fun m!197229 () Bool)

(assert (=> b!168119 m!197229))

(declare-fun m!197231 () Bool)

(assert (=> b!168119 m!197231))

(declare-fun m!197233 () Bool)

(assert (=> b!168119 m!197233))

(declare-fun m!197235 () Bool)

(assert (=> b!168119 m!197235))

(declare-fun m!197237 () Bool)

(assert (=> b!168119 m!197237))

(declare-fun m!197239 () Bool)

(assert (=> b!168119 m!197239))

(declare-fun m!197241 () Bool)

(assert (=> b!168119 m!197241))

(declare-fun m!197243 () Bool)

(assert (=> b!168114 m!197243))

(declare-fun m!197245 () Bool)

(assert (=> b!168120 m!197245))

(check-sat (not b!168115) (not start!16736) (not b!168122) (not b!168117) b_and!10455 (not b!168123) (not b!168121) (not b!168120) (not b!168119) (not b_next!4041) (not mapNonEmpty!6483) tp_is_empty!3843)
(check-sat b_and!10455 (not b_next!4041))
