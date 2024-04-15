; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77136 () Bool)

(assert start!77136)

(declare-fun b!900235 () Bool)

(declare-fun b_free!16051 () Bool)

(declare-fun b_next!16051 () Bool)

(assert (=> b!900235 (= b_free!16051 (not b_next!16051))))

(declare-fun tp!56245 () Bool)

(declare-fun b_and!26347 () Bool)

(assert (=> b!900235 (= tp!56245 b_and!26347)))

(declare-fun mapIsEmpty!29245 () Bool)

(declare-fun mapRes!29245 () Bool)

(assert (=> mapIsEmpty!29245 mapRes!29245))

(declare-fun b!900234 () Bool)

(declare-fun e!503855 () Bool)

(declare-fun tp_is_empty!18379 () Bool)

(assert (=> b!900234 (= e!503855 tp_is_empty!18379)))

(declare-datatypes ((array!52791 0))(
  ( (array!52792 (arr!25367 (Array (_ BitVec 32) (_ BitVec 64))) (size!25828 (_ BitVec 32))) )
))
(declare-datatypes ((V!29471 0))(
  ( (V!29472 (val!9240 Int)) )
))
(declare-datatypes ((ValueCell!8708 0))(
  ( (ValueCellFull!8708 (v!11734 V!29471)) (EmptyCell!8708) )
))
(declare-datatypes ((array!52793 0))(
  ( (array!52794 (arr!25368 (Array (_ BitVec 32) ValueCell!8708)) (size!25829 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4432 0))(
  ( (LongMapFixedSize!4433 (defaultEntry!5450 Int) (mask!26230 (_ BitVec 32)) (extraKeys!5176 (_ BitVec 32)) (zeroValue!5280 V!29471) (minValue!5280 V!29471) (_size!2271 (_ BitVec 32)) (_keys!10249 array!52791) (_values!5467 array!52793) (_vacant!2271 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4432)

(declare-fun e!503852 () Bool)

(declare-fun e!503850 () Bool)

(declare-fun array_inv!19952 (array!52791) Bool)

(declare-fun array_inv!19953 (array!52793) Bool)

(assert (=> b!900235 (= e!503852 (and tp!56245 tp_is_empty!18379 (array_inv!19952 (_keys!10249 thiss!1181)) (array_inv!19953 (_values!5467 thiss!1181)) e!503850))))

(declare-fun b!900236 () Bool)

(declare-fun e!503849 () Bool)

(declare-datatypes ((SeekEntryResult!8940 0))(
  ( (MissingZero!8940 (index!38131 (_ BitVec 32))) (Found!8940 (index!38132 (_ BitVec 32))) (Intermediate!8940 (undefined!9752 Bool) (index!38133 (_ BitVec 32)) (x!76722 (_ BitVec 32))) (Undefined!8940) (MissingVacant!8940 (index!38134 (_ BitVec 32))) )
))
(declare-fun lt!406648 () SeekEntryResult!8940)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900236 (= e!503849 (inRange!0 (index!38132 lt!406648) (mask!26230 thiss!1181)))))

(declare-fun b!900237 () Bool)

(assert (=> b!900237 (= e!503850 (and e!503855 mapRes!29245))))

(declare-fun condMapEmpty!29245 () Bool)

(declare-fun mapDefault!29245 () ValueCell!8708)

(assert (=> b!900237 (= condMapEmpty!29245 (= (arr!25368 (_values!5467 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8708)) mapDefault!29245)))))

(declare-fun b!900238 () Bool)

(declare-fun e!503853 () Bool)

(declare-datatypes ((List!17866 0))(
  ( (Nil!17863) (Cons!17862 (h!19008 (_ BitVec 64)) (t!25210 List!17866)) )
))
(declare-fun arrayNoDuplicates!0 (array!52791 (_ BitVec 32) List!17866) Bool)

(assert (=> b!900238 (= e!503853 (arrayNoDuplicates!0 (_keys!10249 thiss!1181) #b00000000000000000000000000000000 Nil!17863))))

(declare-fun b!900239 () Bool)

(declare-fun res!607987 () Bool)

(declare-fun e!503851 () Bool)

(assert (=> b!900239 (=> (not res!607987) (not e!503851))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!900239 (= res!607987 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900240 () Bool)

(declare-fun e!503848 () Bool)

(assert (=> b!900240 (= e!503848 e!503853)))

(declare-fun res!607991 () Bool)

(assert (=> b!900240 (=> res!607991 e!503853)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900240 (= res!607991 (not (validMask!0 (mask!26230 thiss!1181))))))

(declare-datatypes ((tuple2!12078 0))(
  ( (tuple2!12079 (_1!6050 (_ BitVec 64)) (_2!6050 V!29471)) )
))
(declare-datatypes ((List!17867 0))(
  ( (Nil!17864) (Cons!17863 (h!19009 tuple2!12078) (t!25211 List!17867)) )
))
(declare-datatypes ((ListLongMap!10765 0))(
  ( (ListLongMap!10766 (toList!5398 List!17867)) )
))
(declare-fun contains!4401 (ListLongMap!10765 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2617 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 32) Int) ListLongMap!10765)

(assert (=> b!900240 (contains!4401 (getCurrentListMap!2617 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)) (select (arr!25367 (_keys!10249 thiss!1181)) (index!38132 lt!406648)))))

(declare-datatypes ((Unit!30530 0))(
  ( (Unit!30531) )
))
(declare-fun lt!406647 () Unit!30530)

(declare-fun lemmaValidKeyInArrayIsInListMap!253 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 32) Int) Unit!30530)

(assert (=> b!900240 (= lt!406647 (lemmaValidKeyInArrayIsInListMap!253 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) (index!38132 lt!406648) (defaultEntry!5450 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900240 (arrayContainsKey!0 (_keys!10249 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406646 () Unit!30530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52791 (_ BitVec 64) (_ BitVec 32)) Unit!30530)

(assert (=> b!900240 (= lt!406646 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10249 thiss!1181) key!785 (index!38132 lt!406648)))))

(declare-fun b!900241 () Bool)

(declare-fun res!607985 () Bool)

(assert (=> b!900241 (=> res!607985 e!503853)))

(assert (=> b!900241 (= res!607985 (or (not (= (size!25829 (_values!5467 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26230 thiss!1181)))) (not (= (size!25828 (_keys!10249 thiss!1181)) (size!25829 (_values!5467 thiss!1181)))) (bvslt (mask!26230 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5176 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5176 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!900242 () Bool)

(declare-fun res!607989 () Bool)

(assert (=> b!900242 (=> res!607989 e!503853)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52791 (_ BitVec 32)) Bool)

(assert (=> b!900242 (= res!607989 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10249 thiss!1181) (mask!26230 thiss!1181))))))

(declare-fun mapNonEmpty!29245 () Bool)

(declare-fun tp!56244 () Bool)

(declare-fun e!503854 () Bool)

(assert (=> mapNonEmpty!29245 (= mapRes!29245 (and tp!56244 e!503854))))

(declare-fun mapKey!29245 () (_ BitVec 32))

(declare-fun mapRest!29245 () (Array (_ BitVec 32) ValueCell!8708))

(declare-fun mapValue!29245 () ValueCell!8708)

(assert (=> mapNonEmpty!29245 (= (arr!25368 (_values!5467 thiss!1181)) (store mapRest!29245 mapKey!29245 mapValue!29245))))

(declare-fun res!607988 () Bool)

(assert (=> start!77136 (=> (not res!607988) (not e!503851))))

(declare-fun valid!1711 (LongMapFixedSize!4432) Bool)

(assert (=> start!77136 (= res!607988 (valid!1711 thiss!1181))))

(assert (=> start!77136 e!503851))

(assert (=> start!77136 e!503852))

(assert (=> start!77136 true))

(declare-fun b!900243 () Bool)

(assert (=> b!900243 (= e!503854 tp_is_empty!18379)))

(declare-fun b!900244 () Bool)

(assert (=> b!900244 (= e!503851 (not e!503848))))

(declare-fun res!607986 () Bool)

(assert (=> b!900244 (=> res!607986 e!503848)))

(get-info :version)

(assert (=> b!900244 (= res!607986 (not ((_ is Found!8940) lt!406648)))))

(assert (=> b!900244 e!503849))

(declare-fun res!607990 () Bool)

(assert (=> b!900244 (=> res!607990 e!503849)))

(assert (=> b!900244 (= res!607990 (not ((_ is Found!8940) lt!406648)))))

(declare-fun lt!406645 () Unit!30530)

(declare-fun lemmaSeekEntryGivesInRangeIndex!103 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 64)) Unit!30530)

(assert (=> b!900244 (= lt!406645 (lemmaSeekEntryGivesInRangeIndex!103 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52791 (_ BitVec 32)) SeekEntryResult!8940)

(assert (=> b!900244 (= lt!406648 (seekEntry!0 key!785 (_keys!10249 thiss!1181) (mask!26230 thiss!1181)))))

(assert (= (and start!77136 res!607988) b!900239))

(assert (= (and b!900239 res!607987) b!900244))

(assert (= (and b!900244 (not res!607990)) b!900236))

(assert (= (and b!900244 (not res!607986)) b!900240))

(assert (= (and b!900240 (not res!607991)) b!900241))

(assert (= (and b!900241 (not res!607985)) b!900242))

(assert (= (and b!900242 (not res!607989)) b!900238))

(assert (= (and b!900237 condMapEmpty!29245) mapIsEmpty!29245))

(assert (= (and b!900237 (not condMapEmpty!29245)) mapNonEmpty!29245))

(assert (= (and mapNonEmpty!29245 ((_ is ValueCellFull!8708) mapValue!29245)) b!900243))

(assert (= (and b!900237 ((_ is ValueCellFull!8708) mapDefault!29245)) b!900234))

(assert (= b!900235 b!900237))

(assert (= start!77136 b!900235))

(declare-fun m!836159 () Bool)

(assert (=> mapNonEmpty!29245 m!836159))

(declare-fun m!836161 () Bool)

(assert (=> start!77136 m!836161))

(declare-fun m!836163 () Bool)

(assert (=> b!900244 m!836163))

(declare-fun m!836165 () Bool)

(assert (=> b!900244 m!836165))

(declare-fun m!836167 () Bool)

(assert (=> b!900242 m!836167))

(declare-fun m!836169 () Bool)

(assert (=> b!900236 m!836169))

(declare-fun m!836171 () Bool)

(assert (=> b!900238 m!836171))

(declare-fun m!836173 () Bool)

(assert (=> b!900240 m!836173))

(declare-fun m!836175 () Bool)

(assert (=> b!900240 m!836175))

(declare-fun m!836177 () Bool)

(assert (=> b!900240 m!836177))

(declare-fun m!836179 () Bool)

(assert (=> b!900240 m!836179))

(declare-fun m!836181 () Bool)

(assert (=> b!900240 m!836181))

(assert (=> b!900240 m!836177))

(declare-fun m!836183 () Bool)

(assert (=> b!900240 m!836183))

(assert (=> b!900240 m!836181))

(declare-fun m!836185 () Bool)

(assert (=> b!900240 m!836185))

(declare-fun m!836187 () Bool)

(assert (=> b!900235 m!836187))

(declare-fun m!836189 () Bool)

(assert (=> b!900235 m!836189))

(check-sat (not b!900238) (not b!900236) (not b!900242) tp_is_empty!18379 b_and!26347 (not mapNonEmpty!29245) (not b!900235) (not b!900244) (not start!77136) (not b!900240) (not b_next!16051))
(check-sat b_and!26347 (not b_next!16051))
(get-model)

(declare-fun b!900321 () Bool)

(declare-fun e!503920 () Bool)

(declare-fun call!40010 () Bool)

(assert (=> b!900321 (= e!503920 call!40010)))

(declare-fun b!900322 () Bool)

(declare-fun e!503919 () Bool)

(declare-fun contains!4403 (List!17866 (_ BitVec 64)) Bool)

(assert (=> b!900322 (= e!503919 (contains!4403 Nil!17863 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900323 () Bool)

(declare-fun e!503918 () Bool)

(declare-fun e!503921 () Bool)

(assert (=> b!900323 (= e!503918 e!503921)))

(declare-fun res!608040 () Bool)

(assert (=> b!900323 (=> (not res!608040) (not e!503921))))

(assert (=> b!900323 (= res!608040 (not e!503919))))

(declare-fun res!608041 () Bool)

(assert (=> b!900323 (=> (not res!608041) (not e!503919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900323 (= res!608041 (validKeyInArray!0 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900324 () Bool)

(assert (=> b!900324 (= e!503921 e!503920)))

(declare-fun c!95284 () Bool)

(assert (=> b!900324 (= c!95284 (validKeyInArray!0 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900325 () Bool)

(assert (=> b!900325 (= e!503920 call!40010)))

(declare-fun bm!40007 () Bool)

(assert (=> bm!40007 (= call!40010 (arrayNoDuplicates!0 (_keys!10249 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95284 (Cons!17862 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000) Nil!17863) Nil!17863)))))

(declare-fun d!111535 () Bool)

(declare-fun res!608042 () Bool)

(assert (=> d!111535 (=> res!608042 e!503918)))

(assert (=> d!111535 (= res!608042 (bvsge #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))))))

(assert (=> d!111535 (= (arrayNoDuplicates!0 (_keys!10249 thiss!1181) #b00000000000000000000000000000000 Nil!17863) e!503918)))

(assert (= (and d!111535 (not res!608042)) b!900323))

(assert (= (and b!900323 res!608041) b!900322))

(assert (= (and b!900323 res!608040) b!900324))

(assert (= (and b!900324 c!95284) b!900325))

(assert (= (and b!900324 (not c!95284)) b!900321))

(assert (= (or b!900325 b!900321) bm!40007))

(declare-fun m!836255 () Bool)

(assert (=> b!900322 m!836255))

(assert (=> b!900322 m!836255))

(declare-fun m!836257 () Bool)

(assert (=> b!900322 m!836257))

(assert (=> b!900323 m!836255))

(assert (=> b!900323 m!836255))

(declare-fun m!836259 () Bool)

(assert (=> b!900323 m!836259))

(assert (=> b!900324 m!836255))

(assert (=> b!900324 m!836255))

(assert (=> b!900324 m!836259))

(assert (=> bm!40007 m!836255))

(declare-fun m!836261 () Bool)

(assert (=> bm!40007 m!836261))

(assert (=> b!900238 d!111535))

(declare-fun d!111537 () Bool)

(declare-fun res!608047 () Bool)

(declare-fun e!503930 () Bool)

(assert (=> d!111537 (=> res!608047 e!503930)))

(assert (=> d!111537 (= res!608047 (bvsge #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))))))

(assert (=> d!111537 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10249 thiss!1181) (mask!26230 thiss!1181)) e!503930)))

(declare-fun b!900334 () Bool)

(declare-fun e!503928 () Bool)

(declare-fun e!503929 () Bool)

(assert (=> b!900334 (= e!503928 e!503929)))

(declare-fun lt!406681 () (_ BitVec 64))

(assert (=> b!900334 (= lt!406681 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406679 () Unit!30530)

(assert (=> b!900334 (= lt!406679 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10249 thiss!1181) lt!406681 #b00000000000000000000000000000000))))

(assert (=> b!900334 (arrayContainsKey!0 (_keys!10249 thiss!1181) lt!406681 #b00000000000000000000000000000000)))

(declare-fun lt!406680 () Unit!30530)

(assert (=> b!900334 (= lt!406680 lt!406679)))

(declare-fun res!608048 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52791 (_ BitVec 32)) SeekEntryResult!8940)

(assert (=> b!900334 (= res!608048 (= (seekEntryOrOpen!0 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000) (_keys!10249 thiss!1181) (mask!26230 thiss!1181)) (Found!8940 #b00000000000000000000000000000000)))))

(assert (=> b!900334 (=> (not res!608048) (not e!503929))))

(declare-fun bm!40010 () Bool)

(declare-fun call!40013 () Bool)

(assert (=> bm!40010 (= call!40013 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10249 thiss!1181) (mask!26230 thiss!1181)))))

(declare-fun b!900335 () Bool)

(assert (=> b!900335 (= e!503930 e!503928)))

(declare-fun c!95287 () Bool)

(assert (=> b!900335 (= c!95287 (validKeyInArray!0 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900336 () Bool)

(assert (=> b!900336 (= e!503929 call!40013)))

(declare-fun b!900337 () Bool)

(assert (=> b!900337 (= e!503928 call!40013)))

(assert (= (and d!111537 (not res!608047)) b!900335))

(assert (= (and b!900335 c!95287) b!900334))

(assert (= (and b!900335 (not c!95287)) b!900337))

(assert (= (and b!900334 res!608048) b!900336))

(assert (= (or b!900336 b!900337) bm!40010))

(assert (=> b!900334 m!836255))

(declare-fun m!836263 () Bool)

(assert (=> b!900334 m!836263))

(declare-fun m!836265 () Bool)

(assert (=> b!900334 m!836265))

(assert (=> b!900334 m!836255))

(declare-fun m!836267 () Bool)

(assert (=> b!900334 m!836267))

(declare-fun m!836269 () Bool)

(assert (=> bm!40010 m!836269))

(assert (=> b!900335 m!836255))

(assert (=> b!900335 m!836255))

(assert (=> b!900335 m!836259))

(assert (=> b!900242 d!111537))

(declare-fun d!111539 () Bool)

(declare-fun res!608055 () Bool)

(declare-fun e!503933 () Bool)

(assert (=> d!111539 (=> (not res!608055) (not e!503933))))

(declare-fun simpleValid!330 (LongMapFixedSize!4432) Bool)

(assert (=> d!111539 (= res!608055 (simpleValid!330 thiss!1181))))

(assert (=> d!111539 (= (valid!1711 thiss!1181) e!503933)))

(declare-fun b!900344 () Bool)

(declare-fun res!608056 () Bool)

(assert (=> b!900344 (=> (not res!608056) (not e!503933))))

(declare-fun arrayCountValidKeys!0 (array!52791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900344 (= res!608056 (= (arrayCountValidKeys!0 (_keys!10249 thiss!1181) #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))) (_size!2271 thiss!1181)))))

(declare-fun b!900345 () Bool)

(declare-fun res!608057 () Bool)

(assert (=> b!900345 (=> (not res!608057) (not e!503933))))

(assert (=> b!900345 (= res!608057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10249 thiss!1181) (mask!26230 thiss!1181)))))

(declare-fun b!900346 () Bool)

(assert (=> b!900346 (= e!503933 (arrayNoDuplicates!0 (_keys!10249 thiss!1181) #b00000000000000000000000000000000 Nil!17863))))

(assert (= (and d!111539 res!608055) b!900344))

(assert (= (and b!900344 res!608056) b!900345))

(assert (= (and b!900345 res!608057) b!900346))

(declare-fun m!836271 () Bool)

(assert (=> d!111539 m!836271))

(declare-fun m!836273 () Bool)

(assert (=> b!900344 m!836273))

(assert (=> b!900345 m!836167))

(assert (=> b!900346 m!836171))

(assert (=> start!77136 d!111539))

(declare-fun d!111541 () Bool)

(assert (=> d!111541 (= (inRange!0 (index!38132 lt!406648) (mask!26230 thiss!1181)) (and (bvsge (index!38132 lt!406648) #b00000000000000000000000000000000) (bvslt (index!38132 lt!406648) (bvadd (mask!26230 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900236 d!111541))

(declare-fun d!111543 () Bool)

(assert (=> d!111543 (arrayContainsKey!0 (_keys!10249 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406684 () Unit!30530)

(declare-fun choose!13 (array!52791 (_ BitVec 64) (_ BitVec 32)) Unit!30530)

(assert (=> d!111543 (= lt!406684 (choose!13 (_keys!10249 thiss!1181) key!785 (index!38132 lt!406648)))))

(assert (=> d!111543 (bvsge (index!38132 lt!406648) #b00000000000000000000000000000000)))

(assert (=> d!111543 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10249 thiss!1181) key!785 (index!38132 lt!406648)) lt!406684)))

(declare-fun bs!25257 () Bool)

(assert (= bs!25257 d!111543))

(assert (=> bs!25257 m!836175))

(declare-fun m!836275 () Bool)

(assert (=> bs!25257 m!836275))

(assert (=> b!900240 d!111543))

(declare-fun d!111545 () Bool)

(declare-fun e!503936 () Bool)

(assert (=> d!111545 e!503936))

(declare-fun res!608060 () Bool)

(assert (=> d!111545 (=> (not res!608060) (not e!503936))))

(assert (=> d!111545 (= res!608060 (and (bvsge (index!38132 lt!406648) #b00000000000000000000000000000000) (bvslt (index!38132 lt!406648) (size!25828 (_keys!10249 thiss!1181)))))))

(declare-fun lt!406687 () Unit!30530)

(declare-fun choose!1523 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 32) Int) Unit!30530)

(assert (=> d!111545 (= lt!406687 (choose!1523 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) (index!38132 lt!406648) (defaultEntry!5450 thiss!1181)))))

(assert (=> d!111545 (validMask!0 (mask!26230 thiss!1181))))

(assert (=> d!111545 (= (lemmaValidKeyInArrayIsInListMap!253 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) (index!38132 lt!406648) (defaultEntry!5450 thiss!1181)) lt!406687)))

(declare-fun b!900349 () Bool)

(assert (=> b!900349 (= e!503936 (contains!4401 (getCurrentListMap!2617 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)) (select (arr!25367 (_keys!10249 thiss!1181)) (index!38132 lt!406648))))))

(assert (= (and d!111545 res!608060) b!900349))

(declare-fun m!836277 () Bool)

(assert (=> d!111545 m!836277))

(assert (=> d!111545 m!836179))

(assert (=> b!900349 m!836181))

(assert (=> b!900349 m!836177))

(assert (=> b!900349 m!836181))

(assert (=> b!900349 m!836177))

(assert (=> b!900349 m!836183))

(assert (=> b!900240 d!111545))

(declare-fun d!111547 () Bool)

(assert (=> d!111547 (= (validMask!0 (mask!26230 thiss!1181)) (and (or (= (mask!26230 thiss!1181) #b00000000000000000000000000000111) (= (mask!26230 thiss!1181) #b00000000000000000000000000001111) (= (mask!26230 thiss!1181) #b00000000000000000000000000011111) (= (mask!26230 thiss!1181) #b00000000000000000000000000111111) (= (mask!26230 thiss!1181) #b00000000000000000000000001111111) (= (mask!26230 thiss!1181) #b00000000000000000000000011111111) (= (mask!26230 thiss!1181) #b00000000000000000000000111111111) (= (mask!26230 thiss!1181) #b00000000000000000000001111111111) (= (mask!26230 thiss!1181) #b00000000000000000000011111111111) (= (mask!26230 thiss!1181) #b00000000000000000000111111111111) (= (mask!26230 thiss!1181) #b00000000000000000001111111111111) (= (mask!26230 thiss!1181) #b00000000000000000011111111111111) (= (mask!26230 thiss!1181) #b00000000000000000111111111111111) (= (mask!26230 thiss!1181) #b00000000000000001111111111111111) (= (mask!26230 thiss!1181) #b00000000000000011111111111111111) (= (mask!26230 thiss!1181) #b00000000000000111111111111111111) (= (mask!26230 thiss!1181) #b00000000000001111111111111111111) (= (mask!26230 thiss!1181) #b00000000000011111111111111111111) (= (mask!26230 thiss!1181) #b00000000000111111111111111111111) (= (mask!26230 thiss!1181) #b00000000001111111111111111111111) (= (mask!26230 thiss!1181) #b00000000011111111111111111111111) (= (mask!26230 thiss!1181) #b00000000111111111111111111111111) (= (mask!26230 thiss!1181) #b00000001111111111111111111111111) (= (mask!26230 thiss!1181) #b00000011111111111111111111111111) (= (mask!26230 thiss!1181) #b00000111111111111111111111111111) (= (mask!26230 thiss!1181) #b00001111111111111111111111111111) (= (mask!26230 thiss!1181) #b00011111111111111111111111111111) (= (mask!26230 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26230 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900240 d!111547))

(declare-fun d!111549 () Bool)

(declare-fun res!608065 () Bool)

(declare-fun e!503941 () Bool)

(assert (=> d!111549 (=> res!608065 e!503941)))

(assert (=> d!111549 (= res!608065 (= (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111549 (= (arrayContainsKey!0 (_keys!10249 thiss!1181) key!785 #b00000000000000000000000000000000) e!503941)))

(declare-fun b!900354 () Bool)

(declare-fun e!503942 () Bool)

(assert (=> b!900354 (= e!503941 e!503942)))

(declare-fun res!608066 () Bool)

(assert (=> b!900354 (=> (not res!608066) (not e!503942))))

(assert (=> b!900354 (= res!608066 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25828 (_keys!10249 thiss!1181))))))

(declare-fun b!900355 () Bool)

(assert (=> b!900355 (= e!503942 (arrayContainsKey!0 (_keys!10249 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111549 (not res!608065)) b!900354))

(assert (= (and b!900354 res!608066) b!900355))

(assert (=> d!111549 m!836255))

(declare-fun m!836279 () Bool)

(assert (=> b!900355 m!836279))

(assert (=> b!900240 d!111549))

(declare-fun d!111551 () Bool)

(declare-fun e!503948 () Bool)

(assert (=> d!111551 e!503948))

(declare-fun res!608069 () Bool)

(assert (=> d!111551 (=> res!608069 e!503948)))

(declare-fun lt!406696 () Bool)

(assert (=> d!111551 (= res!608069 (not lt!406696))))

(declare-fun lt!406698 () Bool)

(assert (=> d!111551 (= lt!406696 lt!406698)))

(declare-fun lt!406699 () Unit!30530)

(declare-fun e!503947 () Unit!30530)

(assert (=> d!111551 (= lt!406699 e!503947)))

(declare-fun c!95290 () Bool)

(assert (=> d!111551 (= c!95290 lt!406698)))

(declare-fun containsKey!431 (List!17867 (_ BitVec 64)) Bool)

(assert (=> d!111551 (= lt!406698 (containsKey!431 (toList!5398 (getCurrentListMap!2617 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181))) (select (arr!25367 (_keys!10249 thiss!1181)) (index!38132 lt!406648))))))

(assert (=> d!111551 (= (contains!4401 (getCurrentListMap!2617 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)) (select (arr!25367 (_keys!10249 thiss!1181)) (index!38132 lt!406648))) lt!406696)))

(declare-fun b!900362 () Bool)

(declare-fun lt!406697 () Unit!30530)

(assert (=> b!900362 (= e!503947 lt!406697)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!326 (List!17867 (_ BitVec 64)) Unit!30530)

(assert (=> b!900362 (= lt!406697 (lemmaContainsKeyImpliesGetValueByKeyDefined!326 (toList!5398 (getCurrentListMap!2617 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181))) (select (arr!25367 (_keys!10249 thiss!1181)) (index!38132 lt!406648))))))

(declare-datatypes ((Option!469 0))(
  ( (Some!468 (v!11737 V!29471)) (None!467) )
))
(declare-fun isDefined!339 (Option!469) Bool)

(declare-fun getValueByKey!463 (List!17867 (_ BitVec 64)) Option!469)

(assert (=> b!900362 (isDefined!339 (getValueByKey!463 (toList!5398 (getCurrentListMap!2617 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181))) (select (arr!25367 (_keys!10249 thiss!1181)) (index!38132 lt!406648))))))

(declare-fun b!900363 () Bool)

(declare-fun Unit!30534 () Unit!30530)

(assert (=> b!900363 (= e!503947 Unit!30534)))

(declare-fun b!900364 () Bool)

(assert (=> b!900364 (= e!503948 (isDefined!339 (getValueByKey!463 (toList!5398 (getCurrentListMap!2617 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181))) (select (arr!25367 (_keys!10249 thiss!1181)) (index!38132 lt!406648)))))))

(assert (= (and d!111551 c!95290) b!900362))

(assert (= (and d!111551 (not c!95290)) b!900363))

(assert (= (and d!111551 (not res!608069)) b!900364))

(assert (=> d!111551 m!836177))

(declare-fun m!836281 () Bool)

(assert (=> d!111551 m!836281))

(assert (=> b!900362 m!836177))

(declare-fun m!836283 () Bool)

(assert (=> b!900362 m!836283))

(assert (=> b!900362 m!836177))

(declare-fun m!836285 () Bool)

(assert (=> b!900362 m!836285))

(assert (=> b!900362 m!836285))

(declare-fun m!836287 () Bool)

(assert (=> b!900362 m!836287))

(assert (=> b!900364 m!836177))

(assert (=> b!900364 m!836285))

(assert (=> b!900364 m!836285))

(assert (=> b!900364 m!836287))

(assert (=> b!900240 d!111551))

(declare-fun b!900407 () Bool)

(declare-fun e!503978 () Bool)

(declare-fun call!40031 () Bool)

(assert (=> b!900407 (= e!503978 (not call!40031))))

(declare-fun b!900408 () Bool)

(declare-fun c!95303 () Bool)

(assert (=> b!900408 (= c!95303 (and (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!503983 () ListLongMap!10765)

(declare-fun e!503981 () ListLongMap!10765)

(assert (=> b!900408 (= e!503983 e!503981)))

(declare-fun b!900409 () Bool)

(declare-fun res!608093 () Bool)

(declare-fun e!503985 () Bool)

(assert (=> b!900409 (=> (not res!608093) (not e!503985))))

(declare-fun e!503984 () Bool)

(assert (=> b!900409 (= res!608093 e!503984)))

(declare-fun res!608089 () Bool)

(assert (=> b!900409 (=> res!608089 e!503984)))

(declare-fun e!503987 () Bool)

(assert (=> b!900409 (= res!608089 (not e!503987))))

(declare-fun res!608094 () Bool)

(assert (=> b!900409 (=> (not res!608094) (not e!503987))))

(assert (=> b!900409 (= res!608094 (bvslt #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))))))

(declare-fun b!900410 () Bool)

(declare-fun e!503986 () Bool)

(assert (=> b!900410 (= e!503985 e!503986)))

(declare-fun c!95307 () Bool)

(assert (=> b!900410 (= c!95307 (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900411 () Bool)

(declare-fun e!503982 () Bool)

(assert (=> b!900411 (= e!503986 e!503982)))

(declare-fun res!608095 () Bool)

(declare-fun call!40030 () Bool)

(assert (=> b!900411 (= res!608095 call!40030)))

(assert (=> b!900411 (=> (not res!608095) (not e!503982))))

(declare-fun call!40034 () ListLongMap!10765)

(declare-fun c!95305 () Bool)

(declare-fun c!95306 () Bool)

(declare-fun call!40033 () ListLongMap!10765)

(declare-fun call!40032 () ListLongMap!10765)

(declare-fun bm!40026 () Bool)

(declare-fun call!40029 () ListLongMap!10765)

(declare-fun +!2623 (ListLongMap!10765 tuple2!12078) ListLongMap!10765)

(assert (=> bm!40026 (= call!40029 (+!2623 (ite c!95306 call!40033 (ite c!95305 call!40032 call!40034)) (ite (or c!95306 c!95305) (tuple2!12079 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5280 thiss!1181)) (tuple2!12079 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5280 thiss!1181)))))))

(declare-fun b!900412 () Bool)

(declare-fun call!40028 () ListLongMap!10765)

(assert (=> b!900412 (= e!503983 call!40028)))

(declare-fun bm!40027 () Bool)

(assert (=> bm!40027 (= call!40028 call!40029)))

(declare-fun bm!40028 () Bool)

(assert (=> bm!40028 (= call!40034 call!40032)))

(declare-fun b!900413 () Bool)

(declare-fun lt!406753 () ListLongMap!10765)

(declare-fun apply!412 (ListLongMap!10765 (_ BitVec 64)) V!29471)

(assert (=> b!900413 (= e!503982 (= (apply!412 lt!406753 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5280 thiss!1181)))))

(declare-fun b!900414 () Bool)

(declare-fun e!503977 () Bool)

(assert (=> b!900414 (= e!503978 e!503977)))

(declare-fun res!608090 () Bool)

(assert (=> b!900414 (= res!608090 call!40031)))

(assert (=> b!900414 (=> (not res!608090) (not e!503977))))

(declare-fun b!900415 () Bool)

(declare-fun e!503980 () Bool)

(declare-fun get!13351 (ValueCell!8708 V!29471) V!29471)

(declare-fun dynLambda!1306 (Int (_ BitVec 64)) V!29471)

(assert (=> b!900415 (= e!503980 (= (apply!412 lt!406753 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000)) (get!13351 (select (arr!25368 (_values!5467 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1306 (defaultEntry!5450 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25829 (_values!5467 thiss!1181))))))

(assert (=> b!900415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))))))

(declare-fun d!111553 () Bool)

(assert (=> d!111553 e!503985))

(declare-fun res!608092 () Bool)

(assert (=> d!111553 (=> (not res!608092) (not e!503985))))

(assert (=> d!111553 (= res!608092 (or (bvsge #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))))))))

(declare-fun lt!406762 () ListLongMap!10765)

(assert (=> d!111553 (= lt!406753 lt!406762)))

(declare-fun lt!406746 () Unit!30530)

(declare-fun e!503979 () Unit!30530)

(assert (=> d!111553 (= lt!406746 e!503979)))

(declare-fun c!95308 () Bool)

(declare-fun e!503976 () Bool)

(assert (=> d!111553 (= c!95308 e!503976)))

(declare-fun res!608096 () Bool)

(assert (=> d!111553 (=> (not res!608096) (not e!503976))))

(assert (=> d!111553 (= res!608096 (bvslt #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))))))

(declare-fun e!503975 () ListLongMap!10765)

(assert (=> d!111553 (= lt!406762 e!503975)))

(assert (=> d!111553 (= c!95306 (and (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111553 (validMask!0 (mask!26230 thiss!1181))))

(assert (=> d!111553 (= (getCurrentListMap!2617 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)) lt!406753)))

(declare-fun bm!40025 () Bool)

(assert (=> bm!40025 (= call!40032 call!40033)))

(declare-fun bm!40029 () Bool)

(assert (=> bm!40029 (= call!40030 (contains!4401 lt!406753 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900416 () Bool)

(assert (=> b!900416 (= e!503986 (not call!40030))))

(declare-fun b!900417 () Bool)

(declare-fun lt!406763 () Unit!30530)

(assert (=> b!900417 (= e!503979 lt!406763)))

(declare-fun lt!406759 () ListLongMap!10765)

(declare-fun getCurrentListMapNoExtraKeys!3320 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 32) Int) ListLongMap!10765)

(assert (=> b!900417 (= lt!406759 (getCurrentListMapNoExtraKeys!3320 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun lt!406748 () (_ BitVec 64))

(assert (=> b!900417 (= lt!406748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406744 () (_ BitVec 64))

(assert (=> b!900417 (= lt!406744 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406749 () Unit!30530)

(declare-fun addStillContains!338 (ListLongMap!10765 (_ BitVec 64) V!29471 (_ BitVec 64)) Unit!30530)

(assert (=> b!900417 (= lt!406749 (addStillContains!338 lt!406759 lt!406748 (zeroValue!5280 thiss!1181) lt!406744))))

(assert (=> b!900417 (contains!4401 (+!2623 lt!406759 (tuple2!12079 lt!406748 (zeroValue!5280 thiss!1181))) lt!406744)))

(declare-fun lt!406756 () Unit!30530)

(assert (=> b!900417 (= lt!406756 lt!406749)))

(declare-fun lt!406754 () ListLongMap!10765)

(assert (=> b!900417 (= lt!406754 (getCurrentListMapNoExtraKeys!3320 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun lt!406765 () (_ BitVec 64))

(assert (=> b!900417 (= lt!406765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406751 () (_ BitVec 64))

(assert (=> b!900417 (= lt!406751 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406758 () Unit!30530)

(declare-fun addApplyDifferent!338 (ListLongMap!10765 (_ BitVec 64) V!29471 (_ BitVec 64)) Unit!30530)

(assert (=> b!900417 (= lt!406758 (addApplyDifferent!338 lt!406754 lt!406765 (minValue!5280 thiss!1181) lt!406751))))

(assert (=> b!900417 (= (apply!412 (+!2623 lt!406754 (tuple2!12079 lt!406765 (minValue!5280 thiss!1181))) lt!406751) (apply!412 lt!406754 lt!406751))))

(declare-fun lt!406761 () Unit!30530)

(assert (=> b!900417 (= lt!406761 lt!406758)))

(declare-fun lt!406757 () ListLongMap!10765)

(assert (=> b!900417 (= lt!406757 (getCurrentListMapNoExtraKeys!3320 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun lt!406764 () (_ BitVec 64))

(assert (=> b!900417 (= lt!406764 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406752 () (_ BitVec 64))

(assert (=> b!900417 (= lt!406752 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406747 () Unit!30530)

(assert (=> b!900417 (= lt!406747 (addApplyDifferent!338 lt!406757 lt!406764 (zeroValue!5280 thiss!1181) lt!406752))))

(assert (=> b!900417 (= (apply!412 (+!2623 lt!406757 (tuple2!12079 lt!406764 (zeroValue!5280 thiss!1181))) lt!406752) (apply!412 lt!406757 lt!406752))))

(declare-fun lt!406750 () Unit!30530)

(assert (=> b!900417 (= lt!406750 lt!406747)))

(declare-fun lt!406760 () ListLongMap!10765)

(assert (=> b!900417 (= lt!406760 (getCurrentListMapNoExtraKeys!3320 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun lt!406755 () (_ BitVec 64))

(assert (=> b!900417 (= lt!406755 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406745 () (_ BitVec 64))

(assert (=> b!900417 (= lt!406745 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900417 (= lt!406763 (addApplyDifferent!338 lt!406760 lt!406755 (minValue!5280 thiss!1181) lt!406745))))

(assert (=> b!900417 (= (apply!412 (+!2623 lt!406760 (tuple2!12079 lt!406755 (minValue!5280 thiss!1181))) lt!406745) (apply!412 lt!406760 lt!406745))))

(declare-fun b!900418 () Bool)

(declare-fun res!608088 () Bool)

(assert (=> b!900418 (=> (not res!608088) (not e!503985))))

(assert (=> b!900418 (= res!608088 e!503978)))

(declare-fun c!95304 () Bool)

(assert (=> b!900418 (= c!95304 (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!900419 () Bool)

(assert (=> b!900419 (= e!503981 call!40028)))

(declare-fun b!900420 () Bool)

(assert (=> b!900420 (= e!503977 (= (apply!412 lt!406753 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5280 thiss!1181)))))

(declare-fun b!900421 () Bool)

(assert (=> b!900421 (= e!503976 (validKeyInArray!0 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900422 () Bool)

(assert (=> b!900422 (= e!503984 e!503980)))

(declare-fun res!608091 () Bool)

(assert (=> b!900422 (=> (not res!608091) (not e!503980))))

(assert (=> b!900422 (= res!608091 (contains!4401 lt!406753 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900422 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25828 (_keys!10249 thiss!1181))))))

(declare-fun b!900423 () Bool)

(assert (=> b!900423 (= e!503975 e!503983)))

(assert (=> b!900423 (= c!95305 (and (not (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5176 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900424 () Bool)

(assert (=> b!900424 (= e!503987 (validKeyInArray!0 (select (arr!25367 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900425 () Bool)

(declare-fun Unit!30535 () Unit!30530)

(assert (=> b!900425 (= e!503979 Unit!30535)))

(declare-fun bm!40030 () Bool)

(assert (=> bm!40030 (= call!40031 (contains!4401 lt!406753 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!40031 () Bool)

(assert (=> bm!40031 (= call!40033 (getCurrentListMapNoExtraKeys!3320 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5450 thiss!1181)))))

(declare-fun b!900426 () Bool)

(assert (=> b!900426 (= e!503975 (+!2623 call!40029 (tuple2!12079 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5280 thiss!1181))))))

(declare-fun b!900427 () Bool)

(assert (=> b!900427 (= e!503981 call!40034)))

(assert (= (and d!111553 c!95306) b!900426))

(assert (= (and d!111553 (not c!95306)) b!900423))

(assert (= (and b!900423 c!95305) b!900412))

(assert (= (and b!900423 (not c!95305)) b!900408))

(assert (= (and b!900408 c!95303) b!900419))

(assert (= (and b!900408 (not c!95303)) b!900427))

(assert (= (or b!900419 b!900427) bm!40028))

(assert (= (or b!900412 bm!40028) bm!40025))

(assert (= (or b!900412 b!900419) bm!40027))

(assert (= (or b!900426 bm!40025) bm!40031))

(assert (= (or b!900426 bm!40027) bm!40026))

(assert (= (and d!111553 res!608096) b!900421))

(assert (= (and d!111553 c!95308) b!900417))

(assert (= (and d!111553 (not c!95308)) b!900425))

(assert (= (and d!111553 res!608092) b!900409))

(assert (= (and b!900409 res!608094) b!900424))

(assert (= (and b!900409 (not res!608089)) b!900422))

(assert (= (and b!900422 res!608091) b!900415))

(assert (= (and b!900409 res!608093) b!900418))

(assert (= (and b!900418 c!95304) b!900414))

(assert (= (and b!900418 (not c!95304)) b!900407))

(assert (= (and b!900414 res!608090) b!900420))

(assert (= (or b!900414 b!900407) bm!40030))

(assert (= (and b!900418 res!608088) b!900410))

(assert (= (and b!900410 c!95307) b!900411))

(assert (= (and b!900410 (not c!95307)) b!900416))

(assert (= (and b!900411 res!608095) b!900413))

(assert (= (or b!900411 b!900416) bm!40029))

(declare-fun b_lambda!13001 () Bool)

(assert (=> (not b_lambda!13001) (not b!900415)))

(declare-fun t!25215 () Bool)

(declare-fun tb!5197 () Bool)

(assert (=> (and b!900235 (= (defaultEntry!5450 thiss!1181) (defaultEntry!5450 thiss!1181)) t!25215) tb!5197))

(declare-fun result!10179 () Bool)

(assert (=> tb!5197 (= result!10179 tp_is_empty!18379)))

(assert (=> b!900415 t!25215))

(declare-fun b_and!26353 () Bool)

(assert (= b_and!26347 (and (=> t!25215 result!10179) b_and!26353)))

(declare-fun m!836289 () Bool)

(assert (=> bm!40030 m!836289))

(declare-fun m!836291 () Bool)

(assert (=> b!900413 m!836291))

(declare-fun m!836293 () Bool)

(assert (=> bm!40031 m!836293))

(declare-fun m!836295 () Bool)

(assert (=> bm!40026 m!836295))

(declare-fun m!836297 () Bool)

(assert (=> bm!40029 m!836297))

(declare-fun m!836299 () Bool)

(assert (=> b!900420 m!836299))

(assert (=> d!111553 m!836179))

(assert (=> b!900424 m!836255))

(assert (=> b!900424 m!836255))

(assert (=> b!900424 m!836259))

(assert (=> b!900421 m!836255))

(assert (=> b!900421 m!836255))

(assert (=> b!900421 m!836259))

(assert (=> b!900422 m!836255))

(assert (=> b!900422 m!836255))

(declare-fun m!836301 () Bool)

(assert (=> b!900422 m!836301))

(declare-fun m!836303 () Bool)

(assert (=> b!900417 m!836303))

(declare-fun m!836305 () Bool)

(assert (=> b!900417 m!836305))

(declare-fun m!836307 () Bool)

(assert (=> b!900417 m!836307))

(declare-fun m!836309 () Bool)

(assert (=> b!900417 m!836309))

(declare-fun m!836311 () Bool)

(assert (=> b!900417 m!836311))

(assert (=> b!900417 m!836303))

(declare-fun m!836313 () Bool)

(assert (=> b!900417 m!836313))

(declare-fun m!836315 () Bool)

(assert (=> b!900417 m!836315))

(assert (=> b!900417 m!836293))

(assert (=> b!900417 m!836307))

(declare-fun m!836317 () Bool)

(assert (=> b!900417 m!836317))

(declare-fun m!836319 () Bool)

(assert (=> b!900417 m!836319))

(declare-fun m!836321 () Bool)

(assert (=> b!900417 m!836321))

(declare-fun m!836323 () Bool)

(assert (=> b!900417 m!836323))

(assert (=> b!900417 m!836317))

(declare-fun m!836325 () Bool)

(assert (=> b!900417 m!836325))

(assert (=> b!900417 m!836255))

(assert (=> b!900417 m!836321))

(declare-fun m!836327 () Bool)

(assert (=> b!900417 m!836327))

(declare-fun m!836329 () Bool)

(assert (=> b!900417 m!836329))

(declare-fun m!836331 () Bool)

(assert (=> b!900417 m!836331))

(declare-fun m!836333 () Bool)

(assert (=> b!900415 m!836333))

(assert (=> b!900415 m!836255))

(declare-fun m!836335 () Bool)

(assert (=> b!900415 m!836335))

(assert (=> b!900415 m!836333))

(declare-fun m!836337 () Bool)

(assert (=> b!900415 m!836337))

(declare-fun m!836339 () Bool)

(assert (=> b!900415 m!836339))

(assert (=> b!900415 m!836255))

(assert (=> b!900415 m!836337))

(declare-fun m!836341 () Bool)

(assert (=> b!900426 m!836341))

(assert (=> b!900240 d!111553))

(declare-fun d!111555 () Bool)

(assert (=> d!111555 (= (array_inv!19952 (_keys!10249 thiss!1181)) (bvsge (size!25828 (_keys!10249 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900235 d!111555))

(declare-fun d!111557 () Bool)

(assert (=> d!111557 (= (array_inv!19953 (_values!5467 thiss!1181)) (bvsge (size!25829 (_values!5467 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900235 d!111557))

(declare-fun d!111559 () Bool)

(declare-fun e!503990 () Bool)

(assert (=> d!111559 e!503990))

(declare-fun res!608099 () Bool)

(assert (=> d!111559 (=> res!608099 e!503990)))

(declare-fun lt!406771 () SeekEntryResult!8940)

(assert (=> d!111559 (= res!608099 (not ((_ is Found!8940) lt!406771)))))

(assert (=> d!111559 (= lt!406771 (seekEntry!0 key!785 (_keys!10249 thiss!1181) (mask!26230 thiss!1181)))))

(declare-fun lt!406770 () Unit!30530)

(declare-fun choose!1524 (array!52791 array!52793 (_ BitVec 32) (_ BitVec 32) V!29471 V!29471 (_ BitVec 64)) Unit!30530)

(assert (=> d!111559 (= lt!406770 (choose!1524 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) key!785))))

(assert (=> d!111559 (validMask!0 (mask!26230 thiss!1181))))

(assert (=> d!111559 (= (lemmaSeekEntryGivesInRangeIndex!103 (_keys!10249 thiss!1181) (_values!5467 thiss!1181) (mask!26230 thiss!1181) (extraKeys!5176 thiss!1181) (zeroValue!5280 thiss!1181) (minValue!5280 thiss!1181) key!785) lt!406770)))

(declare-fun b!900432 () Bool)

(assert (=> b!900432 (= e!503990 (inRange!0 (index!38132 lt!406771) (mask!26230 thiss!1181)))))

(assert (= (and d!111559 (not res!608099)) b!900432))

(assert (=> d!111559 m!836165))

(declare-fun m!836343 () Bool)

(assert (=> d!111559 m!836343))

(assert (=> d!111559 m!836179))

(declare-fun m!836345 () Bool)

(assert (=> b!900432 m!836345))

(assert (=> b!900244 d!111559))

(declare-fun d!111561 () Bool)

(declare-fun lt!406782 () SeekEntryResult!8940)

(assert (=> d!111561 (and (or ((_ is MissingVacant!8940) lt!406782) (not ((_ is Found!8940) lt!406782)) (and (bvsge (index!38132 lt!406782) #b00000000000000000000000000000000) (bvslt (index!38132 lt!406782) (size!25828 (_keys!10249 thiss!1181))))) (not ((_ is MissingVacant!8940) lt!406782)) (or (not ((_ is Found!8940) lt!406782)) (= (select (arr!25367 (_keys!10249 thiss!1181)) (index!38132 lt!406782)) key!785)))))

(declare-fun e!503997 () SeekEntryResult!8940)

(assert (=> d!111561 (= lt!406782 e!503997)))

(declare-fun c!95315 () Bool)

(declare-fun lt!406781 () SeekEntryResult!8940)

(assert (=> d!111561 (= c!95315 (and ((_ is Intermediate!8940) lt!406781) (undefined!9752 lt!406781)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52791 (_ BitVec 32)) SeekEntryResult!8940)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111561 (= lt!406781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26230 thiss!1181)) key!785 (_keys!10249 thiss!1181) (mask!26230 thiss!1181)))))

(assert (=> d!111561 (validMask!0 (mask!26230 thiss!1181))))

(assert (=> d!111561 (= (seekEntry!0 key!785 (_keys!10249 thiss!1181) (mask!26230 thiss!1181)) lt!406782)))

(declare-fun b!900445 () Bool)

(declare-fun e!503998 () SeekEntryResult!8940)

(assert (=> b!900445 (= e!503997 e!503998)))

(declare-fun lt!406780 () (_ BitVec 64))

(assert (=> b!900445 (= lt!406780 (select (arr!25367 (_keys!10249 thiss!1181)) (index!38133 lt!406781)))))

(declare-fun c!95317 () Bool)

(assert (=> b!900445 (= c!95317 (= lt!406780 key!785))))

(declare-fun b!900446 () Bool)

(declare-fun c!95316 () Bool)

(assert (=> b!900446 (= c!95316 (= lt!406780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!503999 () SeekEntryResult!8940)

(assert (=> b!900446 (= e!503998 e!503999)))

(declare-fun b!900447 () Bool)

(assert (=> b!900447 (= e!503997 Undefined!8940)))

(declare-fun b!900448 () Bool)

(declare-fun lt!406783 () SeekEntryResult!8940)

(assert (=> b!900448 (= e!503999 (ite ((_ is MissingVacant!8940) lt!406783) (MissingZero!8940 (index!38134 lt!406783)) lt!406783))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52791 (_ BitVec 32)) SeekEntryResult!8940)

(assert (=> b!900448 (= lt!406783 (seekKeyOrZeroReturnVacant!0 (x!76722 lt!406781) (index!38133 lt!406781) (index!38133 lt!406781) key!785 (_keys!10249 thiss!1181) (mask!26230 thiss!1181)))))

(declare-fun b!900449 () Bool)

(assert (=> b!900449 (= e!503999 (MissingZero!8940 (index!38133 lt!406781)))))

(declare-fun b!900450 () Bool)

(assert (=> b!900450 (= e!503998 (Found!8940 (index!38133 lt!406781)))))

(assert (= (and d!111561 c!95315) b!900447))

(assert (= (and d!111561 (not c!95315)) b!900445))

(assert (= (and b!900445 c!95317) b!900450))

(assert (= (and b!900445 (not c!95317)) b!900446))

(assert (= (and b!900446 c!95316) b!900449))

(assert (= (and b!900446 (not c!95316)) b!900448))

(declare-fun m!836347 () Bool)

(assert (=> d!111561 m!836347))

(declare-fun m!836349 () Bool)

(assert (=> d!111561 m!836349))

(assert (=> d!111561 m!836349))

(declare-fun m!836351 () Bool)

(assert (=> d!111561 m!836351))

(assert (=> d!111561 m!836179))

(declare-fun m!836353 () Bool)

(assert (=> b!900445 m!836353))

(declare-fun m!836355 () Bool)

(assert (=> b!900448 m!836355))

(assert (=> b!900244 d!111561))

(declare-fun condMapEmpty!29254 () Bool)

(declare-fun mapDefault!29254 () ValueCell!8708)

(assert (=> mapNonEmpty!29245 (= condMapEmpty!29254 (= mapRest!29245 ((as const (Array (_ BitVec 32) ValueCell!8708)) mapDefault!29254)))))

(declare-fun e!504004 () Bool)

(declare-fun mapRes!29254 () Bool)

(assert (=> mapNonEmpty!29245 (= tp!56244 (and e!504004 mapRes!29254))))

(declare-fun b!900458 () Bool)

(assert (=> b!900458 (= e!504004 tp_is_empty!18379)))

(declare-fun b!900457 () Bool)

(declare-fun e!504005 () Bool)

(assert (=> b!900457 (= e!504005 tp_is_empty!18379)))

(declare-fun mapIsEmpty!29254 () Bool)

(assert (=> mapIsEmpty!29254 mapRes!29254))

(declare-fun mapNonEmpty!29254 () Bool)

(declare-fun tp!56260 () Bool)

(assert (=> mapNonEmpty!29254 (= mapRes!29254 (and tp!56260 e!504005))))

(declare-fun mapRest!29254 () (Array (_ BitVec 32) ValueCell!8708))

(declare-fun mapKey!29254 () (_ BitVec 32))

(declare-fun mapValue!29254 () ValueCell!8708)

(assert (=> mapNonEmpty!29254 (= mapRest!29245 (store mapRest!29254 mapKey!29254 mapValue!29254))))

(assert (= (and mapNonEmpty!29245 condMapEmpty!29254) mapIsEmpty!29254))

(assert (= (and mapNonEmpty!29245 (not condMapEmpty!29254)) mapNonEmpty!29254))

(assert (= (and mapNonEmpty!29254 ((_ is ValueCellFull!8708) mapValue!29254)) b!900457))

(assert (= (and mapNonEmpty!29245 ((_ is ValueCellFull!8708) mapDefault!29254)) b!900458))

(declare-fun m!836357 () Bool)

(assert (=> mapNonEmpty!29254 m!836357))

(declare-fun b_lambda!13003 () Bool)

(assert (= b_lambda!13001 (or (and b!900235 b_free!16051) b_lambda!13003)))

(check-sat (not b_next!16051) (not d!111561) (not b!900335) (not b!900422) b_and!26353 (not b!900334) (not bm!40007) (not b!900349) (not b!900448) (not b!900362) (not b!900323) (not mapNonEmpty!29254) (not b!900415) (not b!900322) (not b!900355) (not bm!40026) (not d!111539) (not bm!40029) (not b_lambda!13003) (not bm!40030) (not b!900421) (not d!111545) tp_is_empty!18379 (not d!111553) (not b!900344) (not bm!40031) (not b!900324) (not b!900424) (not b!900432) (not b!900346) (not d!111543) (not b!900420) (not b!900413) (not b!900364) (not b!900345) (not d!111559) (not d!111551) (not bm!40010) (not b!900426) (not b!900417))
(check-sat b_and!26353 (not b_next!16051))
