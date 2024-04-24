; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16732 () Bool)

(assert start!16732)

(declare-fun b!168006 () Bool)

(declare-fun b_free!4033 () Bool)

(declare-fun b_next!4033 () Bool)

(assert (=> b!168006 (= b_free!4033 (not b_next!4033))))

(declare-fun tp!14699 () Bool)

(declare-fun b_and!10461 () Bool)

(assert (=> b!168006 (= tp!14699 b_and!10461)))

(declare-fun b!168002 () Bool)

(declare-fun e!110386 () Bool)

(declare-fun e!110385 () Bool)

(assert (=> b!168002 (= e!110386 (not e!110385))))

(declare-fun res!79940 () Bool)

(assert (=> b!168002 (=> res!79940 e!110385)))

(declare-datatypes ((V!4761 0))(
  ( (V!4762 (val!1962 Int)) )
))
(declare-datatypes ((ValueCell!1574 0))(
  ( (ValueCellFull!1574 (v!3828 V!4761)) (EmptyCell!1574) )
))
(declare-datatypes ((array!6753 0))(
  ( (array!6754 (arr!3212 (Array (_ BitVec 32) (_ BitVec 64))) (size!3500 (_ BitVec 32))) )
))
(declare-datatypes ((array!6755 0))(
  ( (array!6756 (arr!3213 (Array (_ BitVec 32) ValueCell!1574)) (size!3501 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2056 0))(
  ( (LongMapFixedSize!2057 (defaultEntry!3470 Int) (mask!8227 (_ BitVec 32)) (extraKeys!3211 (_ BitVec 32)) (zeroValue!3313 V!4761) (minValue!3313 V!4761) (_size!1077 (_ BitVec 32)) (_keys!5295 array!6753) (_values!3453 array!6755) (_vacant!1077 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2056)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168002 (= res!79940 (not (validMask!0 (mask!8227 thiss!1248))))))

(declare-datatypes ((tuple2!3114 0))(
  ( (tuple2!3115 (_1!1568 (_ BitVec 64)) (_2!1568 V!4761)) )
))
(declare-datatypes ((List!2129 0))(
  ( (Nil!2126) (Cons!2125 (h!2742 tuple2!3114) (t!6923 List!2129)) )
))
(declare-datatypes ((ListLongMap!2075 0))(
  ( (ListLongMap!2076 (toList!1053 List!2129)) )
))
(declare-fun lt!84025 () ListLongMap!2075)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4761)

(declare-datatypes ((SeekEntryResult!483 0))(
  ( (MissingZero!483 (index!4100 (_ BitVec 32))) (Found!483 (index!4101 (_ BitVec 32))) (Intermediate!483 (undefined!1295 Bool) (index!4102 (_ BitVec 32)) (x!18567 (_ BitVec 32))) (Undefined!483) (MissingVacant!483 (index!4103 (_ BitVec 32))) )
))
(declare-fun lt!84027 () SeekEntryResult!483)

(declare-fun +!221 (ListLongMap!2075 tuple2!3114) ListLongMap!2075)

(declare-fun getCurrentListMap!715 (array!6753 array!6755 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 32) Int) ListLongMap!2075)

(assert (=> b!168002 (= (+!221 lt!84025 (tuple2!3115 key!828 v!309)) (getCurrentListMap!715 (_keys!5295 thiss!1248) (array!6756 (store (arr!3213 (_values!3453 thiss!1248)) (index!4101 lt!84027) (ValueCellFull!1574 v!309)) (size!3501 (_values!3453 thiss!1248))) (mask!8227 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3470 thiss!1248)))))

(declare-datatypes ((Unit!5162 0))(
  ( (Unit!5163) )
))
(declare-fun lt!84024 () Unit!5162)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!79 (array!6753 array!6755 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 32) (_ BitVec 64) V!4761 Int) Unit!5162)

(assert (=> b!168002 (= lt!84024 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!79 (_keys!5295 thiss!1248) (_values!3453 thiss!1248) (mask!8227 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) (index!4101 lt!84027) key!828 v!309 (defaultEntry!3470 thiss!1248)))))

(declare-fun lt!84029 () Unit!5162)

(declare-fun e!110384 () Unit!5162)

(assert (=> b!168002 (= lt!84029 e!110384)))

(declare-fun c!30344 () Bool)

(declare-fun contains!1105 (ListLongMap!2075 (_ BitVec 64)) Bool)

(assert (=> b!168002 (= c!30344 (contains!1105 lt!84025 key!828))))

(assert (=> b!168002 (= lt!84025 (getCurrentListMap!715 (_keys!5295 thiss!1248) (_values!3453 thiss!1248) (mask!8227 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3470 thiss!1248)))))

(declare-fun b!168003 () Bool)

(declare-fun Unit!5164 () Unit!5162)

(assert (=> b!168003 (= e!110384 Unit!5164)))

(declare-fun lt!84026 () Unit!5162)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!108 (array!6753 array!6755 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 64) Int) Unit!5162)

(assert (=> b!168003 (= lt!84026 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!108 (_keys!5295 thiss!1248) (_values!3453 thiss!1248) (mask!8227 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) key!828 (defaultEntry!3470 thiss!1248)))))

(assert (=> b!168003 false))

(declare-fun b!168004 () Bool)

(declare-fun res!79944 () Bool)

(assert (=> b!168004 (=> res!79944 e!110385)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6753 (_ BitVec 32)) Bool)

(assert (=> b!168004 (= res!79944 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5295 thiss!1248) (mask!8227 thiss!1248))))))

(declare-fun b!168005 () Bool)

(declare-fun res!79938 () Bool)

(declare-fun e!110389 () Bool)

(assert (=> b!168005 (=> (not res!79938) (not e!110389))))

(assert (=> b!168005 (= res!79938 (not (= key!828 (bvneg key!828))))))

(declare-fun e!110387 () Bool)

(declare-fun e!110393 () Bool)

(declare-fun tp_is_empty!3835 () Bool)

(declare-fun array_inv!2057 (array!6753) Bool)

(declare-fun array_inv!2058 (array!6755) Bool)

(assert (=> b!168006 (= e!110387 (and tp!14699 tp_is_empty!3835 (array_inv!2057 (_keys!5295 thiss!1248)) (array_inv!2058 (_values!3453 thiss!1248)) e!110393))))

(declare-fun b!168007 () Bool)

(declare-fun e!110392 () Bool)

(assert (=> b!168007 (= e!110392 tp_is_empty!3835)))

(declare-fun mapNonEmpty!6471 () Bool)

(declare-fun mapRes!6471 () Bool)

(declare-fun tp!14700 () Bool)

(assert (=> mapNonEmpty!6471 (= mapRes!6471 (and tp!14700 e!110392))))

(declare-fun mapRest!6471 () (Array (_ BitVec 32) ValueCell!1574))

(declare-fun mapValue!6471 () ValueCell!1574)

(declare-fun mapKey!6471 () (_ BitVec 32))

(assert (=> mapNonEmpty!6471 (= (arr!3213 (_values!3453 thiss!1248)) (store mapRest!6471 mapKey!6471 mapValue!6471))))

(declare-fun b!168008 () Bool)

(assert (=> b!168008 (= e!110385 true)))

(declare-fun lt!84028 () Bool)

(declare-datatypes ((List!2130 0))(
  ( (Nil!2127) (Cons!2126 (h!2743 (_ BitVec 64)) (t!6924 List!2130)) )
))
(declare-fun arrayNoDuplicates!0 (array!6753 (_ BitVec 32) List!2130) Bool)

(assert (=> b!168008 (= lt!84028 (arrayNoDuplicates!0 (_keys!5295 thiss!1248) #b00000000000000000000000000000000 Nil!2127))))

(declare-fun mapIsEmpty!6471 () Bool)

(assert (=> mapIsEmpty!6471 mapRes!6471))

(declare-fun res!79941 () Bool)

(assert (=> start!16732 (=> (not res!79941) (not e!110389))))

(declare-fun valid!904 (LongMapFixedSize!2056) Bool)

(assert (=> start!16732 (= res!79941 (valid!904 thiss!1248))))

(assert (=> start!16732 e!110389))

(assert (=> start!16732 e!110387))

(assert (=> start!16732 true))

(assert (=> start!16732 tp_is_empty!3835))

(declare-fun b!168009 () Bool)

(declare-fun e!110388 () Bool)

(assert (=> b!168009 (= e!110388 (= (select (arr!3212 (_keys!5295 thiss!1248)) (index!4101 lt!84027)) key!828))))

(declare-fun b!168010 () Bool)

(declare-fun e!110391 () Bool)

(assert (=> b!168010 (= e!110393 (and e!110391 mapRes!6471))))

(declare-fun condMapEmpty!6471 () Bool)

(declare-fun mapDefault!6471 () ValueCell!1574)

(assert (=> b!168010 (= condMapEmpty!6471 (= (arr!3213 (_values!3453 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1574)) mapDefault!6471)))))

(declare-fun b!168011 () Bool)

(assert (=> b!168011 (= e!110391 tp_is_empty!3835)))

(declare-fun b!168012 () Bool)

(assert (=> b!168012 (= e!110389 e!110386)))

(declare-fun res!79943 () Bool)

(assert (=> b!168012 (=> (not res!79943) (not e!110386))))

(get-info :version)

(assert (=> b!168012 (= res!79943 (and (not ((_ is Undefined!483) lt!84027)) (not ((_ is MissingVacant!483) lt!84027)) (not ((_ is MissingZero!483) lt!84027)) ((_ is Found!483) lt!84027)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6753 (_ BitVec 32)) SeekEntryResult!483)

(assert (=> b!168012 (= lt!84027 (seekEntryOrOpen!0 key!828 (_keys!5295 thiss!1248) (mask!8227 thiss!1248)))))

(declare-fun b!168013 () Bool)

(declare-fun lt!84030 () Unit!5162)

(assert (=> b!168013 (= e!110384 lt!84030)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!117 (array!6753 array!6755 (_ BitVec 32) (_ BitVec 32) V!4761 V!4761 (_ BitVec 64) Int) Unit!5162)

(assert (=> b!168013 (= lt!84030 (lemmaInListMapThenSeekEntryOrOpenFindsIt!117 (_keys!5295 thiss!1248) (_values!3453 thiss!1248) (mask!8227 thiss!1248) (extraKeys!3211 thiss!1248) (zeroValue!3313 thiss!1248) (minValue!3313 thiss!1248) key!828 (defaultEntry!3470 thiss!1248)))))

(declare-fun res!79942 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168013 (= res!79942 (inRange!0 (index!4101 lt!84027) (mask!8227 thiss!1248)))))

(assert (=> b!168013 (=> (not res!79942) (not e!110388))))

(assert (=> b!168013 e!110388))

(declare-fun b!168014 () Bool)

(declare-fun res!79939 () Bool)

(assert (=> b!168014 (=> res!79939 e!110385)))

(assert (=> b!168014 (= res!79939 (or (not (= (size!3501 (_values!3453 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8227 thiss!1248)))) (not (= (size!3500 (_keys!5295 thiss!1248)) (size!3501 (_values!3453 thiss!1248)))) (bvslt (mask!8227 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3211 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3211 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16732 res!79941) b!168005))

(assert (= (and b!168005 res!79938) b!168012))

(assert (= (and b!168012 res!79943) b!168002))

(assert (= (and b!168002 c!30344) b!168013))

(assert (= (and b!168002 (not c!30344)) b!168003))

(assert (= (and b!168013 res!79942) b!168009))

(assert (= (and b!168002 (not res!79940)) b!168014))

(assert (= (and b!168014 (not res!79939)) b!168004))

(assert (= (and b!168004 (not res!79944)) b!168008))

(assert (= (and b!168010 condMapEmpty!6471) mapIsEmpty!6471))

(assert (= (and b!168010 (not condMapEmpty!6471)) mapNonEmpty!6471))

(assert (= (and mapNonEmpty!6471 ((_ is ValueCellFull!1574) mapValue!6471)) b!168007))

(assert (= (and b!168010 ((_ is ValueCellFull!1574) mapDefault!6471)) b!168011))

(assert (= b!168006 b!168010))

(assert (= start!16732 b!168006))

(declare-fun m!197249 () Bool)

(assert (=> b!168006 m!197249))

(declare-fun m!197251 () Bool)

(assert (=> b!168006 m!197251))

(declare-fun m!197253 () Bool)

(assert (=> b!168002 m!197253))

(declare-fun m!197255 () Bool)

(assert (=> b!168002 m!197255))

(declare-fun m!197257 () Bool)

(assert (=> b!168002 m!197257))

(declare-fun m!197259 () Bool)

(assert (=> b!168002 m!197259))

(declare-fun m!197261 () Bool)

(assert (=> b!168002 m!197261))

(declare-fun m!197263 () Bool)

(assert (=> b!168002 m!197263))

(declare-fun m!197265 () Bool)

(assert (=> b!168002 m!197265))

(declare-fun m!197267 () Bool)

(assert (=> b!168012 m!197267))

(declare-fun m!197269 () Bool)

(assert (=> mapNonEmpty!6471 m!197269))

(declare-fun m!197271 () Bool)

(assert (=> b!168009 m!197271))

(declare-fun m!197273 () Bool)

(assert (=> start!16732 m!197273))

(declare-fun m!197275 () Bool)

(assert (=> b!168008 m!197275))

(declare-fun m!197277 () Bool)

(assert (=> b!168004 m!197277))

(declare-fun m!197279 () Bool)

(assert (=> b!168003 m!197279))

(declare-fun m!197281 () Bool)

(assert (=> b!168013 m!197281))

(declare-fun m!197283 () Bool)

(assert (=> b!168013 m!197283))

(check-sat (not b!168006) (not b!168008) (not mapNonEmpty!6471) tp_is_empty!3835 b_and!10461 (not b!168003) (not b!168013) (not b_next!4033) (not b!168002) (not b!168004) (not b!168012) (not start!16732))
(check-sat b_and!10461 (not b_next!4033))
