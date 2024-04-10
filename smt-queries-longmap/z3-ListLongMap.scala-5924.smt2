; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77124 () Bool)

(assert start!77124)

(declare-fun b!900282 () Bool)

(declare-fun b_free!16047 () Bool)

(declare-fun b_next!16047 () Bool)

(assert (=> b!900282 (= b_free!16047 (not b_next!16047))))

(declare-fun tp!56228 () Bool)

(declare-fun b_and!26367 () Bool)

(assert (=> b!900282 (= tp!56228 b_and!26367)))

(declare-fun b!900278 () Bool)

(declare-fun e!503865 () Bool)

(declare-datatypes ((array!52798 0))(
  ( (array!52799 (arr!25371 (Array (_ BitVec 32) (_ BitVec 64))) (size!25830 (_ BitVec 32))) )
))
(declare-datatypes ((V!29465 0))(
  ( (V!29466 (val!9238 Int)) )
))
(declare-datatypes ((ValueCell!8706 0))(
  ( (ValueCellFull!8706 (v!11734 V!29465)) (EmptyCell!8706) )
))
(declare-datatypes ((array!52800 0))(
  ( (array!52801 (arr!25372 (Array (_ BitVec 32) ValueCell!8706)) (size!25831 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4428 0))(
  ( (LongMapFixedSize!4429 (defaultEntry!5446 Int) (mask!26226 (_ BitVec 32)) (extraKeys!5171 (_ BitVec 32)) (zeroValue!5275 V!29465) (minValue!5275 V!29465) (_size!2269 (_ BitVec 32)) (_keys!10247 array!52798) (_values!5462 array!52800) (_vacant!2269 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4428)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52798 (_ BitVec 32)) Bool)

(assert (=> b!900278 (= e!503865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10247 thiss!1181) (mask!26226 thiss!1181)))))

(declare-fun mapIsEmpty!29236 () Bool)

(declare-fun mapRes!29236 () Bool)

(assert (=> mapIsEmpty!29236 mapRes!29236))

(declare-fun b!900279 () Bool)

(declare-fun e!503857 () Bool)

(declare-datatypes ((SeekEntryResult!8937 0))(
  ( (MissingZero!8937 (index!38119 (_ BitVec 32))) (Found!8937 (index!38120 (_ BitVec 32))) (Intermediate!8937 (undefined!9749 Bool) (index!38121 (_ BitVec 32)) (x!76706 (_ BitVec 32))) (Undefined!8937) (MissingVacant!8937 (index!38122 (_ BitVec 32))) )
))
(declare-fun lt!406748 () SeekEntryResult!8937)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900279 (= e!503857 (inRange!0 (index!38120 lt!406748) (mask!26226 thiss!1181)))))

(declare-fun b!900280 () Bool)

(declare-fun res!608005 () Bool)

(assert (=> b!900280 (=> res!608005 e!503865)))

(assert (=> b!900280 (= res!608005 (or (not (= (size!25831 (_values!5462 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26226 thiss!1181)))) (not (= (size!25830 (_keys!10247 thiss!1181)) (size!25831 (_values!5462 thiss!1181)))) (bvslt (mask!26226 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5171 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5171 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!900281 () Bool)

(declare-fun e!503860 () Bool)

(declare-fun tp_is_empty!18375 () Bool)

(assert (=> b!900281 (= e!503860 tp_is_empty!18375)))

(declare-fun e!503861 () Bool)

(declare-fun e!503864 () Bool)

(declare-fun array_inv!19904 (array!52798) Bool)

(declare-fun array_inv!19905 (array!52800) Bool)

(assert (=> b!900282 (= e!503864 (and tp!56228 tp_is_empty!18375 (array_inv!19904 (_keys!10247 thiss!1181)) (array_inv!19905 (_values!5462 thiss!1181)) e!503861))))

(declare-fun b!900283 () Bool)

(declare-fun e!503862 () Bool)

(assert (=> b!900283 (= e!503862 e!503865)))

(declare-fun res!608004 () Bool)

(assert (=> b!900283 (=> res!608004 e!503865)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900283 (= res!608004 (not (validMask!0 (mask!26226 thiss!1181))))))

(declare-datatypes ((tuple2!12050 0))(
  ( (tuple2!12051 (_1!6036 (_ BitVec 64)) (_2!6036 V!29465)) )
))
(declare-datatypes ((List!17853 0))(
  ( (Nil!17850) (Cons!17849 (h!18995 tuple2!12050) (t!25204 List!17853)) )
))
(declare-datatypes ((ListLongMap!10747 0))(
  ( (ListLongMap!10748 (toList!5389 List!17853)) )
))
(declare-fun contains!4426 (ListLongMap!10747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2663 (array!52798 array!52800 (_ BitVec 32) (_ BitVec 32) V!29465 V!29465 (_ BitVec 32) Int) ListLongMap!10747)

(assert (=> b!900283 (contains!4426 (getCurrentListMap!2663 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)) (select (arr!25371 (_keys!10247 thiss!1181)) (index!38120 lt!406748)))))

(declare-datatypes ((Unit!30586 0))(
  ( (Unit!30587) )
))
(declare-fun lt!406749 () Unit!30586)

(declare-fun lemmaValidKeyInArrayIsInListMap!252 (array!52798 array!52800 (_ BitVec 32) (_ BitVec 32) V!29465 V!29465 (_ BitVec 32) Int) Unit!30586)

(assert (=> b!900283 (= lt!406749 (lemmaValidKeyInArrayIsInListMap!252 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) (index!38120 lt!406748) (defaultEntry!5446 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900283 (arrayContainsKey!0 (_keys!10247 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406746 () Unit!30586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52798 (_ BitVec 64) (_ BitVec 32)) Unit!30586)

(assert (=> b!900283 (= lt!406746 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10247 thiss!1181) key!785 (index!38120 lt!406748)))))

(declare-fun b!900284 () Bool)

(declare-fun res!608001 () Bool)

(declare-fun e!503863 () Bool)

(assert (=> b!900284 (=> (not res!608001) (not e!503863))))

(assert (=> b!900284 (= res!608001 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900286 () Bool)

(declare-fun e!503859 () Bool)

(assert (=> b!900286 (= e!503861 (and e!503859 mapRes!29236))))

(declare-fun condMapEmpty!29236 () Bool)

(declare-fun mapDefault!29236 () ValueCell!8706)

(assert (=> b!900286 (= condMapEmpty!29236 (= (arr!25372 (_values!5462 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8706)) mapDefault!29236)))))

(declare-fun mapNonEmpty!29236 () Bool)

(declare-fun tp!56229 () Bool)

(assert (=> mapNonEmpty!29236 (= mapRes!29236 (and tp!56229 e!503860))))

(declare-fun mapKey!29236 () (_ BitVec 32))

(declare-fun mapValue!29236 () ValueCell!8706)

(declare-fun mapRest!29236 () (Array (_ BitVec 32) ValueCell!8706))

(assert (=> mapNonEmpty!29236 (= (arr!25372 (_values!5462 thiss!1181)) (store mapRest!29236 mapKey!29236 mapValue!29236))))

(declare-fun b!900287 () Bool)

(assert (=> b!900287 (= e!503859 tp_is_empty!18375)))

(declare-fun res!608003 () Bool)

(assert (=> start!77124 (=> (not res!608003) (not e!503863))))

(declare-fun valid!1700 (LongMapFixedSize!4428) Bool)

(assert (=> start!77124 (= res!608003 (valid!1700 thiss!1181))))

(assert (=> start!77124 e!503863))

(assert (=> start!77124 e!503864))

(assert (=> start!77124 true))

(declare-fun b!900285 () Bool)

(assert (=> b!900285 (= e!503863 (not e!503862))))

(declare-fun res!608002 () Bool)

(assert (=> b!900285 (=> res!608002 e!503862)))

(get-info :version)

(assert (=> b!900285 (= res!608002 (not ((_ is Found!8937) lt!406748)))))

(assert (=> b!900285 e!503857))

(declare-fun res!608000 () Bool)

(assert (=> b!900285 (=> res!608000 e!503857)))

(assert (=> b!900285 (= res!608000 (not ((_ is Found!8937) lt!406748)))))

(declare-fun lt!406747 () Unit!30586)

(declare-fun lemmaSeekEntryGivesInRangeIndex!101 (array!52798 array!52800 (_ BitVec 32) (_ BitVec 32) V!29465 V!29465 (_ BitVec 64)) Unit!30586)

(assert (=> b!900285 (= lt!406747 (lemmaSeekEntryGivesInRangeIndex!101 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52798 (_ BitVec 32)) SeekEntryResult!8937)

(assert (=> b!900285 (= lt!406748 (seekEntry!0 key!785 (_keys!10247 thiss!1181) (mask!26226 thiss!1181)))))

(assert (= (and start!77124 res!608003) b!900284))

(assert (= (and b!900284 res!608001) b!900285))

(assert (= (and b!900285 (not res!608000)) b!900279))

(assert (= (and b!900285 (not res!608002)) b!900283))

(assert (= (and b!900283 (not res!608004)) b!900280))

(assert (= (and b!900280 (not res!608005)) b!900278))

(assert (= (and b!900286 condMapEmpty!29236) mapIsEmpty!29236))

(assert (= (and b!900286 (not condMapEmpty!29236)) mapNonEmpty!29236))

(assert (= (and mapNonEmpty!29236 ((_ is ValueCellFull!8706) mapValue!29236)) b!900281))

(assert (= (and b!900286 ((_ is ValueCellFull!8706) mapDefault!29236)) b!900287))

(assert (= b!900282 b!900286))

(assert (= start!77124 b!900282))

(declare-fun m!836755 () Bool)

(assert (=> start!77124 m!836755))

(declare-fun m!836757 () Bool)

(assert (=> b!900278 m!836757))

(declare-fun m!836759 () Bool)

(assert (=> mapNonEmpty!29236 m!836759))

(declare-fun m!836761 () Bool)

(assert (=> b!900282 m!836761))

(declare-fun m!836763 () Bool)

(assert (=> b!900282 m!836763))

(declare-fun m!836765 () Bool)

(assert (=> b!900279 m!836765))

(declare-fun m!836767 () Bool)

(assert (=> b!900283 m!836767))

(declare-fun m!836769 () Bool)

(assert (=> b!900283 m!836769))

(assert (=> b!900283 m!836767))

(declare-fun m!836771 () Bool)

(assert (=> b!900283 m!836771))

(declare-fun m!836773 () Bool)

(assert (=> b!900283 m!836773))

(declare-fun m!836775 () Bool)

(assert (=> b!900283 m!836775))

(declare-fun m!836777 () Bool)

(assert (=> b!900283 m!836777))

(assert (=> b!900283 m!836769))

(declare-fun m!836779 () Bool)

(assert (=> b!900283 m!836779))

(declare-fun m!836781 () Bool)

(assert (=> b!900285 m!836781))

(declare-fun m!836783 () Bool)

(assert (=> b!900285 m!836783))

(check-sat (not b!900283) tp_is_empty!18375 (not b!900279) (not start!77124) (not b!900282) (not b!900285) b_and!26367 (not b_next!16047) (not mapNonEmpty!29236) (not b!900278))
(check-sat b_and!26367 (not b_next!16047))
(get-model)

(declare-fun b!900326 () Bool)

(declare-fun e!503899 () Bool)

(declare-fun e!503901 () Bool)

(assert (=> b!900326 (= e!503899 e!503901)))

(declare-fun c!95316 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900326 (= c!95316 (validKeyInArray!0 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111705 () Bool)

(declare-fun res!608029 () Bool)

(assert (=> d!111705 (=> res!608029 e!503899)))

(assert (=> d!111705 (= res!608029 (bvsge #b00000000000000000000000000000000 (size!25830 (_keys!10247 thiss!1181))))))

(assert (=> d!111705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10247 thiss!1181) (mask!26226 thiss!1181)) e!503899)))

(declare-fun bm!40009 () Bool)

(declare-fun call!40012 () Bool)

(assert (=> bm!40009 (= call!40012 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10247 thiss!1181) (mask!26226 thiss!1181)))))

(declare-fun b!900327 () Bool)

(declare-fun e!503900 () Bool)

(assert (=> b!900327 (= e!503901 e!503900)))

(declare-fun lt!406768 () (_ BitVec 64))

(assert (=> b!900327 (= lt!406768 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406769 () Unit!30586)

(assert (=> b!900327 (= lt!406769 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10247 thiss!1181) lt!406768 #b00000000000000000000000000000000))))

(assert (=> b!900327 (arrayContainsKey!0 (_keys!10247 thiss!1181) lt!406768 #b00000000000000000000000000000000)))

(declare-fun lt!406770 () Unit!30586)

(assert (=> b!900327 (= lt!406770 lt!406769)))

(declare-fun res!608028 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52798 (_ BitVec 32)) SeekEntryResult!8937)

(assert (=> b!900327 (= res!608028 (= (seekEntryOrOpen!0 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000) (_keys!10247 thiss!1181) (mask!26226 thiss!1181)) (Found!8937 #b00000000000000000000000000000000)))))

(assert (=> b!900327 (=> (not res!608028) (not e!503900))))

(declare-fun b!900328 () Bool)

(assert (=> b!900328 (= e!503900 call!40012)))

(declare-fun b!900329 () Bool)

(assert (=> b!900329 (= e!503901 call!40012)))

(assert (= (and d!111705 (not res!608029)) b!900326))

(assert (= (and b!900326 c!95316) b!900327))

(assert (= (and b!900326 (not c!95316)) b!900329))

(assert (= (and b!900327 res!608028) b!900328))

(assert (= (or b!900328 b!900329) bm!40009))

(declare-fun m!836815 () Bool)

(assert (=> b!900326 m!836815))

(assert (=> b!900326 m!836815))

(declare-fun m!836817 () Bool)

(assert (=> b!900326 m!836817))

(declare-fun m!836819 () Bool)

(assert (=> bm!40009 m!836819))

(assert (=> b!900327 m!836815))

(declare-fun m!836821 () Bool)

(assert (=> b!900327 m!836821))

(declare-fun m!836823 () Bool)

(assert (=> b!900327 m!836823))

(assert (=> b!900327 m!836815))

(declare-fun m!836825 () Bool)

(assert (=> b!900327 m!836825))

(assert (=> b!900278 d!111705))

(declare-fun d!111707 () Bool)

(assert (=> d!111707 (= (array_inv!19904 (_keys!10247 thiss!1181)) (bvsge (size!25830 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900282 d!111707))

(declare-fun d!111709 () Bool)

(assert (=> d!111709 (= (array_inv!19905 (_values!5462 thiss!1181)) (bvsge (size!25831 (_values!5462 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900282 d!111709))

(declare-fun d!111711 () Bool)

(declare-fun res!608036 () Bool)

(declare-fun e!503904 () Bool)

(assert (=> d!111711 (=> (not res!608036) (not e!503904))))

(declare-fun simpleValid!329 (LongMapFixedSize!4428) Bool)

(assert (=> d!111711 (= res!608036 (simpleValid!329 thiss!1181))))

(assert (=> d!111711 (= (valid!1700 thiss!1181) e!503904)))

(declare-fun b!900336 () Bool)

(declare-fun res!608037 () Bool)

(assert (=> b!900336 (=> (not res!608037) (not e!503904))))

(declare-fun arrayCountValidKeys!0 (array!52798 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900336 (= res!608037 (= (arrayCountValidKeys!0 (_keys!10247 thiss!1181) #b00000000000000000000000000000000 (size!25830 (_keys!10247 thiss!1181))) (_size!2269 thiss!1181)))))

(declare-fun b!900337 () Bool)

(declare-fun res!608038 () Bool)

(assert (=> b!900337 (=> (not res!608038) (not e!503904))))

(assert (=> b!900337 (= res!608038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10247 thiss!1181) (mask!26226 thiss!1181)))))

(declare-fun b!900338 () Bool)

(declare-datatypes ((List!17854 0))(
  ( (Nil!17851) (Cons!17850 (h!18996 (_ BitVec 64)) (t!25207 List!17854)) )
))
(declare-fun arrayNoDuplicates!0 (array!52798 (_ BitVec 32) List!17854) Bool)

(assert (=> b!900338 (= e!503904 (arrayNoDuplicates!0 (_keys!10247 thiss!1181) #b00000000000000000000000000000000 Nil!17851))))

(assert (= (and d!111711 res!608036) b!900336))

(assert (= (and b!900336 res!608037) b!900337))

(assert (= (and b!900337 res!608038) b!900338))

(declare-fun m!836827 () Bool)

(assert (=> d!111711 m!836827))

(declare-fun m!836829 () Bool)

(assert (=> b!900336 m!836829))

(assert (=> b!900337 m!836757))

(declare-fun m!836831 () Bool)

(assert (=> b!900338 m!836831))

(assert (=> start!77124 d!111711))

(declare-fun d!111713 () Bool)

(declare-fun e!503907 () Bool)

(assert (=> d!111713 e!503907))

(declare-fun res!608041 () Bool)

(assert (=> d!111713 (=> res!608041 e!503907)))

(declare-fun lt!406776 () SeekEntryResult!8937)

(assert (=> d!111713 (= res!608041 (not ((_ is Found!8937) lt!406776)))))

(assert (=> d!111713 (= lt!406776 (seekEntry!0 key!785 (_keys!10247 thiss!1181) (mask!26226 thiss!1181)))))

(declare-fun lt!406775 () Unit!30586)

(declare-fun choose!1512 (array!52798 array!52800 (_ BitVec 32) (_ BitVec 32) V!29465 V!29465 (_ BitVec 64)) Unit!30586)

(assert (=> d!111713 (= lt!406775 (choose!1512 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) key!785))))

(assert (=> d!111713 (validMask!0 (mask!26226 thiss!1181))))

(assert (=> d!111713 (= (lemmaSeekEntryGivesInRangeIndex!101 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) key!785) lt!406775)))

(declare-fun b!900341 () Bool)

(assert (=> b!900341 (= e!503907 (inRange!0 (index!38120 lt!406776) (mask!26226 thiss!1181)))))

(assert (= (and d!111713 (not res!608041)) b!900341))

(assert (=> d!111713 m!836783))

(declare-fun m!836833 () Bool)

(assert (=> d!111713 m!836833))

(assert (=> d!111713 m!836777))

(declare-fun m!836835 () Bool)

(assert (=> b!900341 m!836835))

(assert (=> b!900285 d!111713))

(declare-fun b!900354 () Bool)

(declare-fun e!503916 () SeekEntryResult!8937)

(declare-fun lt!406785 () SeekEntryResult!8937)

(assert (=> b!900354 (= e!503916 (ite ((_ is MissingVacant!8937) lt!406785) (MissingZero!8937 (index!38122 lt!406785)) lt!406785))))

(declare-fun lt!406787 () SeekEntryResult!8937)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52798 (_ BitVec 32)) SeekEntryResult!8937)

(assert (=> b!900354 (= lt!406785 (seekKeyOrZeroReturnVacant!0 (x!76706 lt!406787) (index!38121 lt!406787) (index!38121 lt!406787) key!785 (_keys!10247 thiss!1181) (mask!26226 thiss!1181)))))

(declare-fun d!111715 () Bool)

(declare-fun lt!406788 () SeekEntryResult!8937)

(assert (=> d!111715 (and (or ((_ is MissingVacant!8937) lt!406788) (not ((_ is Found!8937) lt!406788)) (and (bvsge (index!38120 lt!406788) #b00000000000000000000000000000000) (bvslt (index!38120 lt!406788) (size!25830 (_keys!10247 thiss!1181))))) (not ((_ is MissingVacant!8937) lt!406788)) (or (not ((_ is Found!8937) lt!406788)) (= (select (arr!25371 (_keys!10247 thiss!1181)) (index!38120 lt!406788)) key!785)))))

(declare-fun e!503915 () SeekEntryResult!8937)

(assert (=> d!111715 (= lt!406788 e!503915)))

(declare-fun c!95324 () Bool)

(assert (=> d!111715 (= c!95324 (and ((_ is Intermediate!8937) lt!406787) (undefined!9749 lt!406787)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52798 (_ BitVec 32)) SeekEntryResult!8937)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111715 (= lt!406787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26226 thiss!1181)) key!785 (_keys!10247 thiss!1181) (mask!26226 thiss!1181)))))

(assert (=> d!111715 (validMask!0 (mask!26226 thiss!1181))))

(assert (=> d!111715 (= (seekEntry!0 key!785 (_keys!10247 thiss!1181) (mask!26226 thiss!1181)) lt!406788)))

(declare-fun b!900355 () Bool)

(declare-fun e!503914 () SeekEntryResult!8937)

(assert (=> b!900355 (= e!503914 (Found!8937 (index!38121 lt!406787)))))

(declare-fun b!900356 () Bool)

(assert (=> b!900356 (= e!503915 e!503914)))

(declare-fun lt!406786 () (_ BitVec 64))

(assert (=> b!900356 (= lt!406786 (select (arr!25371 (_keys!10247 thiss!1181)) (index!38121 lt!406787)))))

(declare-fun c!95325 () Bool)

(assert (=> b!900356 (= c!95325 (= lt!406786 key!785))))

(declare-fun b!900357 () Bool)

(declare-fun c!95323 () Bool)

(assert (=> b!900357 (= c!95323 (= lt!406786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900357 (= e!503914 e!503916)))

(declare-fun b!900358 () Bool)

(assert (=> b!900358 (= e!503915 Undefined!8937)))

(declare-fun b!900359 () Bool)

(assert (=> b!900359 (= e!503916 (MissingZero!8937 (index!38121 lt!406787)))))

(assert (= (and d!111715 c!95324) b!900358))

(assert (= (and d!111715 (not c!95324)) b!900356))

(assert (= (and b!900356 c!95325) b!900355))

(assert (= (and b!900356 (not c!95325)) b!900357))

(assert (= (and b!900357 c!95323) b!900359))

(assert (= (and b!900357 (not c!95323)) b!900354))

(declare-fun m!836837 () Bool)

(assert (=> b!900354 m!836837))

(declare-fun m!836839 () Bool)

(assert (=> d!111715 m!836839))

(declare-fun m!836841 () Bool)

(assert (=> d!111715 m!836841))

(assert (=> d!111715 m!836841))

(declare-fun m!836843 () Bool)

(assert (=> d!111715 m!836843))

(assert (=> d!111715 m!836777))

(declare-fun m!836845 () Bool)

(assert (=> b!900356 m!836845))

(assert (=> b!900285 d!111715))

(declare-fun d!111717 () Bool)

(assert (=> d!111717 (= (inRange!0 (index!38120 lt!406748) (mask!26226 thiss!1181)) (and (bvsge (index!38120 lt!406748) #b00000000000000000000000000000000) (bvslt (index!38120 lt!406748) (bvadd (mask!26226 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900279 d!111717))

(declare-fun d!111719 () Bool)

(assert (=> d!111719 (arrayContainsKey!0 (_keys!10247 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406791 () Unit!30586)

(declare-fun choose!13 (array!52798 (_ BitVec 64) (_ BitVec 32)) Unit!30586)

(assert (=> d!111719 (= lt!406791 (choose!13 (_keys!10247 thiss!1181) key!785 (index!38120 lt!406748)))))

(assert (=> d!111719 (bvsge (index!38120 lt!406748) #b00000000000000000000000000000000)))

(assert (=> d!111719 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10247 thiss!1181) key!785 (index!38120 lt!406748)) lt!406791)))

(declare-fun bs!25286 () Bool)

(assert (= bs!25286 d!111719))

(assert (=> bs!25286 m!836775))

(declare-fun m!836847 () Bool)

(assert (=> bs!25286 m!836847))

(assert (=> b!900283 d!111719))

(declare-fun d!111721 () Bool)

(declare-fun e!503919 () Bool)

(assert (=> d!111721 e!503919))

(declare-fun res!608044 () Bool)

(assert (=> d!111721 (=> (not res!608044) (not e!503919))))

(assert (=> d!111721 (= res!608044 (and (bvsge (index!38120 lt!406748) #b00000000000000000000000000000000) (bvslt (index!38120 lt!406748) (size!25830 (_keys!10247 thiss!1181)))))))

(declare-fun lt!406794 () Unit!30586)

(declare-fun choose!1513 (array!52798 array!52800 (_ BitVec 32) (_ BitVec 32) V!29465 V!29465 (_ BitVec 32) Int) Unit!30586)

(assert (=> d!111721 (= lt!406794 (choose!1513 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) (index!38120 lt!406748) (defaultEntry!5446 thiss!1181)))))

(assert (=> d!111721 (validMask!0 (mask!26226 thiss!1181))))

(assert (=> d!111721 (= (lemmaValidKeyInArrayIsInListMap!252 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) (index!38120 lt!406748) (defaultEntry!5446 thiss!1181)) lt!406794)))

(declare-fun b!900362 () Bool)

(assert (=> b!900362 (= e!503919 (contains!4426 (getCurrentListMap!2663 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)) (select (arr!25371 (_keys!10247 thiss!1181)) (index!38120 lt!406748))))))

(assert (= (and d!111721 res!608044) b!900362))

(declare-fun m!836849 () Bool)

(assert (=> d!111721 m!836849))

(assert (=> d!111721 m!836777))

(assert (=> b!900362 m!836769))

(assert (=> b!900362 m!836767))

(assert (=> b!900362 m!836769))

(assert (=> b!900362 m!836767))

(assert (=> b!900362 m!836771))

(assert (=> b!900283 d!111721))

(declare-fun d!111723 () Bool)

(assert (=> d!111723 (= (validMask!0 (mask!26226 thiss!1181)) (and (or (= (mask!26226 thiss!1181) #b00000000000000000000000000000111) (= (mask!26226 thiss!1181) #b00000000000000000000000000001111) (= (mask!26226 thiss!1181) #b00000000000000000000000000011111) (= (mask!26226 thiss!1181) #b00000000000000000000000000111111) (= (mask!26226 thiss!1181) #b00000000000000000000000001111111) (= (mask!26226 thiss!1181) #b00000000000000000000000011111111) (= (mask!26226 thiss!1181) #b00000000000000000000000111111111) (= (mask!26226 thiss!1181) #b00000000000000000000001111111111) (= (mask!26226 thiss!1181) #b00000000000000000000011111111111) (= (mask!26226 thiss!1181) #b00000000000000000000111111111111) (= (mask!26226 thiss!1181) #b00000000000000000001111111111111) (= (mask!26226 thiss!1181) #b00000000000000000011111111111111) (= (mask!26226 thiss!1181) #b00000000000000000111111111111111) (= (mask!26226 thiss!1181) #b00000000000000001111111111111111) (= (mask!26226 thiss!1181) #b00000000000000011111111111111111) (= (mask!26226 thiss!1181) #b00000000000000111111111111111111) (= (mask!26226 thiss!1181) #b00000000000001111111111111111111) (= (mask!26226 thiss!1181) #b00000000000011111111111111111111) (= (mask!26226 thiss!1181) #b00000000000111111111111111111111) (= (mask!26226 thiss!1181) #b00000000001111111111111111111111) (= (mask!26226 thiss!1181) #b00000000011111111111111111111111) (= (mask!26226 thiss!1181) #b00000000111111111111111111111111) (= (mask!26226 thiss!1181) #b00000001111111111111111111111111) (= (mask!26226 thiss!1181) #b00000011111111111111111111111111) (= (mask!26226 thiss!1181) #b00000111111111111111111111111111) (= (mask!26226 thiss!1181) #b00001111111111111111111111111111) (= (mask!26226 thiss!1181) #b00011111111111111111111111111111) (= (mask!26226 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26226 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900283 d!111723))

(declare-fun d!111725 () Bool)

(declare-fun e!503925 () Bool)

(assert (=> d!111725 e!503925))

(declare-fun res!608047 () Bool)

(assert (=> d!111725 (=> res!608047 e!503925)))

(declare-fun lt!406804 () Bool)

(assert (=> d!111725 (= res!608047 (not lt!406804))))

(declare-fun lt!406806 () Bool)

(assert (=> d!111725 (= lt!406804 lt!406806)))

(declare-fun lt!406803 () Unit!30586)

(declare-fun e!503924 () Unit!30586)

(assert (=> d!111725 (= lt!406803 e!503924)))

(declare-fun c!95328 () Bool)

(assert (=> d!111725 (= c!95328 lt!406806)))

(declare-fun containsKey!430 (List!17853 (_ BitVec 64)) Bool)

(assert (=> d!111725 (= lt!406806 (containsKey!430 (toList!5389 (getCurrentListMap!2663 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181))) (select (arr!25371 (_keys!10247 thiss!1181)) (index!38120 lt!406748))))))

(assert (=> d!111725 (= (contains!4426 (getCurrentListMap!2663 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)) (select (arr!25371 (_keys!10247 thiss!1181)) (index!38120 lt!406748))) lt!406804)))

(declare-fun b!900369 () Bool)

(declare-fun lt!406805 () Unit!30586)

(assert (=> b!900369 (= e!503924 lt!406805)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!326 (List!17853 (_ BitVec 64)) Unit!30586)

(assert (=> b!900369 (= lt!406805 (lemmaContainsKeyImpliesGetValueByKeyDefined!326 (toList!5389 (getCurrentListMap!2663 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181))) (select (arr!25371 (_keys!10247 thiss!1181)) (index!38120 lt!406748))))))

(declare-datatypes ((Option!467 0))(
  ( (Some!466 (v!11736 V!29465)) (None!465) )
))
(declare-fun isDefined!335 (Option!467) Bool)

(declare-fun getValueByKey!461 (List!17853 (_ BitVec 64)) Option!467)

(assert (=> b!900369 (isDefined!335 (getValueByKey!461 (toList!5389 (getCurrentListMap!2663 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181))) (select (arr!25371 (_keys!10247 thiss!1181)) (index!38120 lt!406748))))))

(declare-fun b!900370 () Bool)

(declare-fun Unit!30588 () Unit!30586)

(assert (=> b!900370 (= e!503924 Unit!30588)))

(declare-fun b!900371 () Bool)

(assert (=> b!900371 (= e!503925 (isDefined!335 (getValueByKey!461 (toList!5389 (getCurrentListMap!2663 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181))) (select (arr!25371 (_keys!10247 thiss!1181)) (index!38120 lt!406748)))))))

(assert (= (and d!111725 c!95328) b!900369))

(assert (= (and d!111725 (not c!95328)) b!900370))

(assert (= (and d!111725 (not res!608047)) b!900371))

(assert (=> d!111725 m!836767))

(declare-fun m!836851 () Bool)

(assert (=> d!111725 m!836851))

(assert (=> b!900369 m!836767))

(declare-fun m!836853 () Bool)

(assert (=> b!900369 m!836853))

(assert (=> b!900369 m!836767))

(declare-fun m!836855 () Bool)

(assert (=> b!900369 m!836855))

(assert (=> b!900369 m!836855))

(declare-fun m!836857 () Bool)

(assert (=> b!900369 m!836857))

(assert (=> b!900371 m!836767))

(assert (=> b!900371 m!836855))

(assert (=> b!900371 m!836855))

(assert (=> b!900371 m!836857))

(assert (=> b!900283 d!111725))

(declare-fun d!111727 () Bool)

(declare-fun res!608052 () Bool)

(declare-fun e!503930 () Bool)

(assert (=> d!111727 (=> res!608052 e!503930)))

(assert (=> d!111727 (= res!608052 (= (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111727 (= (arrayContainsKey!0 (_keys!10247 thiss!1181) key!785 #b00000000000000000000000000000000) e!503930)))

(declare-fun b!900376 () Bool)

(declare-fun e!503931 () Bool)

(assert (=> b!900376 (= e!503930 e!503931)))

(declare-fun res!608053 () Bool)

(assert (=> b!900376 (=> (not res!608053) (not e!503931))))

(assert (=> b!900376 (= res!608053 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25830 (_keys!10247 thiss!1181))))))

(declare-fun b!900377 () Bool)

(assert (=> b!900377 (= e!503931 (arrayContainsKey!0 (_keys!10247 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111727 (not res!608052)) b!900376))

(assert (= (and b!900376 res!608053) b!900377))

(assert (=> d!111727 m!836815))

(declare-fun m!836859 () Bool)

(assert (=> b!900377 m!836859))

(assert (=> b!900283 d!111727))

(declare-fun b!900420 () Bool)

(declare-fun e!503965 () Bool)

(declare-fun lt!406871 () ListLongMap!10747)

(declare-fun apply!415 (ListLongMap!10747 (_ BitVec 64)) V!29465)

(assert (=> b!900420 (= e!503965 (= (apply!415 lt!406871 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5275 thiss!1181)))))

(declare-fun b!900421 () Bool)

(declare-fun e!503962 () ListLongMap!10747)

(declare-fun e!503959 () ListLongMap!10747)

(assert (=> b!900421 (= e!503962 e!503959)))

(declare-fun c!95344 () Bool)

(assert (=> b!900421 (= c!95344 (and (not (= (bvand (extraKeys!5171 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5171 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900422 () Bool)

(declare-fun e!503968 () Unit!30586)

(declare-fun Unit!30589 () Unit!30586)

(assert (=> b!900422 (= e!503968 Unit!30589)))

(declare-fun b!900423 () Bool)

(declare-fun lt!406866 () Unit!30586)

(assert (=> b!900423 (= e!503968 lt!406866)))

(declare-fun lt!406854 () ListLongMap!10747)

(declare-fun getCurrentListMapNoExtraKeys!3283 (array!52798 array!52800 (_ BitVec 32) (_ BitVec 32) V!29465 V!29465 (_ BitVec 32) Int) ListLongMap!10747)

(assert (=> b!900423 (= lt!406854 (getCurrentListMapNoExtraKeys!3283 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)))))

(declare-fun lt!406861 () (_ BitVec 64))

(assert (=> b!900423 (= lt!406861 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406858 () (_ BitVec 64))

(assert (=> b!900423 (= lt!406858 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406853 () Unit!30586)

(declare-fun addStillContains!337 (ListLongMap!10747 (_ BitVec 64) V!29465 (_ BitVec 64)) Unit!30586)

(assert (=> b!900423 (= lt!406853 (addStillContains!337 lt!406854 lt!406861 (zeroValue!5275 thiss!1181) lt!406858))))

(declare-fun +!2596 (ListLongMap!10747 tuple2!12050) ListLongMap!10747)

(assert (=> b!900423 (contains!4426 (+!2596 lt!406854 (tuple2!12051 lt!406861 (zeroValue!5275 thiss!1181))) lt!406858)))

(declare-fun lt!406865 () Unit!30586)

(assert (=> b!900423 (= lt!406865 lt!406853)))

(declare-fun lt!406862 () ListLongMap!10747)

(assert (=> b!900423 (= lt!406862 (getCurrentListMapNoExtraKeys!3283 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)))))

(declare-fun lt!406868 () (_ BitVec 64))

(assert (=> b!900423 (= lt!406868 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406863 () (_ BitVec 64))

(assert (=> b!900423 (= lt!406863 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406872 () Unit!30586)

(declare-fun addApplyDifferent!337 (ListLongMap!10747 (_ BitVec 64) V!29465 (_ BitVec 64)) Unit!30586)

(assert (=> b!900423 (= lt!406872 (addApplyDifferent!337 lt!406862 lt!406868 (minValue!5275 thiss!1181) lt!406863))))

(assert (=> b!900423 (= (apply!415 (+!2596 lt!406862 (tuple2!12051 lt!406868 (minValue!5275 thiss!1181))) lt!406863) (apply!415 lt!406862 lt!406863))))

(declare-fun lt!406870 () Unit!30586)

(assert (=> b!900423 (= lt!406870 lt!406872)))

(declare-fun lt!406856 () ListLongMap!10747)

(assert (=> b!900423 (= lt!406856 (getCurrentListMapNoExtraKeys!3283 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)))))

(declare-fun lt!406855 () (_ BitVec 64))

(assert (=> b!900423 (= lt!406855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406852 () (_ BitVec 64))

(assert (=> b!900423 (= lt!406852 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406869 () Unit!30586)

(assert (=> b!900423 (= lt!406869 (addApplyDifferent!337 lt!406856 lt!406855 (zeroValue!5275 thiss!1181) lt!406852))))

(assert (=> b!900423 (= (apply!415 (+!2596 lt!406856 (tuple2!12051 lt!406855 (zeroValue!5275 thiss!1181))) lt!406852) (apply!415 lt!406856 lt!406852))))

(declare-fun lt!406851 () Unit!30586)

(assert (=> b!900423 (= lt!406851 lt!406869)))

(declare-fun lt!406864 () ListLongMap!10747)

(assert (=> b!900423 (= lt!406864 (getCurrentListMapNoExtraKeys!3283 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)))))

(declare-fun lt!406860 () (_ BitVec 64))

(assert (=> b!900423 (= lt!406860 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406857 () (_ BitVec 64))

(assert (=> b!900423 (= lt!406857 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900423 (= lt!406866 (addApplyDifferent!337 lt!406864 lt!406860 (minValue!5275 thiss!1181) lt!406857))))

(assert (=> b!900423 (= (apply!415 (+!2596 lt!406864 (tuple2!12051 lt!406860 (minValue!5275 thiss!1181))) lt!406857) (apply!415 lt!406864 lt!406857))))

(declare-fun d!111729 () Bool)

(declare-fun e!503961 () Bool)

(assert (=> d!111729 e!503961))

(declare-fun res!608073 () Bool)

(assert (=> d!111729 (=> (not res!608073) (not e!503961))))

(assert (=> d!111729 (= res!608073 (or (bvsge #b00000000000000000000000000000000 (size!25830 (_keys!10247 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10247 thiss!1181))))))))

(declare-fun lt!406867 () ListLongMap!10747)

(assert (=> d!111729 (= lt!406871 lt!406867)))

(declare-fun lt!406859 () Unit!30586)

(assert (=> d!111729 (= lt!406859 e!503968)))

(declare-fun c!95345 () Bool)

(declare-fun e!503958 () Bool)

(assert (=> d!111729 (= c!95345 e!503958)))

(declare-fun res!608079 () Bool)

(assert (=> d!111729 (=> (not res!608079) (not e!503958))))

(assert (=> d!111729 (= res!608079 (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10247 thiss!1181))))))

(assert (=> d!111729 (= lt!406867 e!503962)))

(declare-fun c!95346 () Bool)

(assert (=> d!111729 (= c!95346 (and (not (= (bvand (extraKeys!5171 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5171 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111729 (validMask!0 (mask!26226 thiss!1181))))

(assert (=> d!111729 (= (getCurrentListMap!2663 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)) lt!406871)))

(declare-fun bm!40024 () Bool)

(declare-fun call!40027 () ListLongMap!10747)

(declare-fun call!40029 () ListLongMap!10747)

(assert (=> bm!40024 (= call!40027 call!40029)))

(declare-fun b!900424 () Bool)

(assert (=> b!900424 (= e!503959 call!40027)))

(declare-fun bm!40025 () Bool)

(declare-fun call!40032 () ListLongMap!10747)

(declare-fun call!40030 () ListLongMap!10747)

(assert (=> bm!40025 (= call!40032 call!40030)))

(declare-fun bm!40026 () Bool)

(declare-fun call!40031 () Bool)

(assert (=> bm!40026 (= call!40031 (contains!4426 lt!406871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900425 () Bool)

(declare-fun e!503967 () Bool)

(declare-fun call!40028 () Bool)

(assert (=> b!900425 (= e!503967 (not call!40028))))

(declare-fun b!900426 () Bool)

(declare-fun e!503964 () Bool)

(declare-fun e!503960 () Bool)

(assert (=> b!900426 (= e!503964 e!503960)))

(declare-fun res!608080 () Bool)

(assert (=> b!900426 (=> (not res!608080) (not e!503960))))

(assert (=> b!900426 (= res!608080 (contains!4426 lt!406871 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900426 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10247 thiss!1181))))))

(declare-fun b!900427 () Bool)

(declare-fun e!503969 () ListLongMap!10747)

(assert (=> b!900427 (= e!503969 call!40027)))

(declare-fun b!900428 () Bool)

(declare-fun res!608078 () Bool)

(assert (=> b!900428 (=> (not res!608078) (not e!503961))))

(declare-fun e!503966 () Bool)

(assert (=> b!900428 (= res!608078 e!503966)))

(declare-fun c!95342 () Bool)

(assert (=> b!900428 (= c!95342 (not (= (bvand (extraKeys!5171 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!900429 () Bool)

(declare-fun get!13349 (ValueCell!8706 V!29465) V!29465)

(declare-fun dynLambda!1309 (Int (_ BitVec 64)) V!29465)

(assert (=> b!900429 (= e!503960 (= (apply!415 lt!406871 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000)) (get!13349 (select (arr!25372 (_values!5462 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1309 (defaultEntry!5446 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900429 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25831 (_values!5462 thiss!1181))))))

(assert (=> b!900429 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10247 thiss!1181))))))

(declare-fun bm!40027 () Bool)

(assert (=> bm!40027 (= call!40028 (contains!4426 lt!406871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900430 () Bool)

(assert (=> b!900430 (= e!503966 e!503965)))

(declare-fun res!608075 () Bool)

(assert (=> b!900430 (= res!608075 call!40031)))

(assert (=> b!900430 (=> (not res!608075) (not e!503965))))

(declare-fun bm!40028 () Bool)

(assert (=> bm!40028 (= call!40030 (getCurrentListMapNoExtraKeys!3283 (_keys!10247 thiss!1181) (_values!5462 thiss!1181) (mask!26226 thiss!1181) (extraKeys!5171 thiss!1181) (zeroValue!5275 thiss!1181) (minValue!5275 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5446 thiss!1181)))))

(declare-fun b!900431 () Bool)

(declare-fun e!503963 () Bool)

(assert (=> b!900431 (= e!503963 (= (apply!415 lt!406871 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5275 thiss!1181)))))

(declare-fun b!900432 () Bool)

(declare-fun res!608072 () Bool)

(assert (=> b!900432 (=> (not res!608072) (not e!503961))))

(assert (=> b!900432 (= res!608072 e!503964)))

(declare-fun res!608076 () Bool)

(assert (=> b!900432 (=> res!608076 e!503964)))

(declare-fun e!503970 () Bool)

(assert (=> b!900432 (= res!608076 (not e!503970))))

(declare-fun res!608077 () Bool)

(assert (=> b!900432 (=> (not res!608077) (not e!503970))))

(assert (=> b!900432 (= res!608077 (bvslt #b00000000000000000000000000000000 (size!25830 (_keys!10247 thiss!1181))))))

(declare-fun b!900433 () Bool)

(assert (=> b!900433 (= e!503967 e!503963)))

(declare-fun res!608074 () Bool)

(assert (=> b!900433 (= res!608074 call!40028)))

(assert (=> b!900433 (=> (not res!608074) (not e!503963))))

(declare-fun b!900434 () Bool)

(declare-fun c!95343 () Bool)

(assert (=> b!900434 (= c!95343 (and (not (= (bvand (extraKeys!5171 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5171 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!900434 (= e!503959 e!503969)))

(declare-fun b!900435 () Bool)

(assert (=> b!900435 (= e!503966 (not call!40031))))

(declare-fun b!900436 () Bool)

(assert (=> b!900436 (= e!503970 (validKeyInArray!0 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900437 () Bool)

(declare-fun call!40033 () ListLongMap!10747)

(assert (=> b!900437 (= e!503969 call!40033)))

(declare-fun b!900438 () Bool)

(assert (=> b!900438 (= e!503958 (validKeyInArray!0 (select (arr!25371 (_keys!10247 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40029 () Bool)

(assert (=> bm!40029 (= call!40029 (+!2596 (ite c!95346 call!40030 (ite c!95344 call!40032 call!40033)) (ite (or c!95346 c!95344) (tuple2!12051 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5275 thiss!1181)) (tuple2!12051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5275 thiss!1181)))))))

(declare-fun bm!40030 () Bool)

(assert (=> bm!40030 (= call!40033 call!40032)))

(declare-fun b!900439 () Bool)

(assert (=> b!900439 (= e!503961 e!503967)))

(declare-fun c!95341 () Bool)

(assert (=> b!900439 (= c!95341 (not (= (bvand (extraKeys!5171 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900440 () Bool)

(assert (=> b!900440 (= e!503962 (+!2596 call!40029 (tuple2!12051 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5275 thiss!1181))))))

(assert (= (and d!111729 c!95346) b!900440))

(assert (= (and d!111729 (not c!95346)) b!900421))

(assert (= (and b!900421 c!95344) b!900424))

(assert (= (and b!900421 (not c!95344)) b!900434))

(assert (= (and b!900434 c!95343) b!900427))

(assert (= (and b!900434 (not c!95343)) b!900437))

(assert (= (or b!900427 b!900437) bm!40030))

(assert (= (or b!900424 bm!40030) bm!40025))

(assert (= (or b!900424 b!900427) bm!40024))

(assert (= (or b!900440 bm!40025) bm!40028))

(assert (= (or b!900440 bm!40024) bm!40029))

(assert (= (and d!111729 res!608079) b!900438))

(assert (= (and d!111729 c!95345) b!900423))

(assert (= (and d!111729 (not c!95345)) b!900422))

(assert (= (and d!111729 res!608073) b!900432))

(assert (= (and b!900432 res!608077) b!900436))

(assert (= (and b!900432 (not res!608076)) b!900426))

(assert (= (and b!900426 res!608080) b!900429))

(assert (= (and b!900432 res!608072) b!900428))

(assert (= (and b!900428 c!95342) b!900430))

(assert (= (and b!900428 (not c!95342)) b!900435))

(assert (= (and b!900430 res!608075) b!900420))

(assert (= (or b!900430 b!900435) bm!40026))

(assert (= (and b!900428 res!608078) b!900439))

(assert (= (and b!900439 c!95341) b!900433))

(assert (= (and b!900439 (not c!95341)) b!900425))

(assert (= (and b!900433 res!608074) b!900431))

(assert (= (or b!900433 b!900425) bm!40027))

(declare-fun b_lambda!13015 () Bool)

(assert (=> (not b_lambda!13015) (not b!900429)))

(declare-fun t!25206 () Bool)

(declare-fun tb!5203 () Bool)

(assert (=> (and b!900282 (= (defaultEntry!5446 thiss!1181) (defaultEntry!5446 thiss!1181)) t!25206) tb!5203))

(declare-fun result!10181 () Bool)

(assert (=> tb!5203 (= result!10181 tp_is_empty!18375)))

(assert (=> b!900429 t!25206))

(declare-fun b_and!26371 () Bool)

(assert (= b_and!26367 (and (=> t!25206 result!10181) b_and!26371)))

(assert (=> b!900438 m!836815))

(assert (=> b!900438 m!836815))

(assert (=> b!900438 m!836817))

(declare-fun m!836861 () Bool)

(assert (=> b!900440 m!836861))

(declare-fun m!836863 () Bool)

(assert (=> b!900420 m!836863))

(assert (=> b!900426 m!836815))

(assert (=> b!900426 m!836815))

(declare-fun m!836865 () Bool)

(assert (=> b!900426 m!836865))

(declare-fun m!836867 () Bool)

(assert (=> b!900423 m!836867))

(declare-fun m!836869 () Bool)

(assert (=> b!900423 m!836869))

(declare-fun m!836871 () Bool)

(assert (=> b!900423 m!836871))

(declare-fun m!836873 () Bool)

(assert (=> b!900423 m!836873))

(declare-fun m!836875 () Bool)

(assert (=> b!900423 m!836875))

(declare-fun m!836877 () Bool)

(assert (=> b!900423 m!836877))

(declare-fun m!836879 () Bool)

(assert (=> b!900423 m!836879))

(declare-fun m!836881 () Bool)

(assert (=> b!900423 m!836881))

(declare-fun m!836883 () Bool)

(assert (=> b!900423 m!836883))

(declare-fun m!836885 () Bool)

(assert (=> b!900423 m!836885))

(assert (=> b!900423 m!836815))

(assert (=> b!900423 m!836883))

(declare-fun m!836887 () Bool)

(assert (=> b!900423 m!836887))

(declare-fun m!836889 () Bool)

(assert (=> b!900423 m!836889))

(declare-fun m!836891 () Bool)

(assert (=> b!900423 m!836891))

(assert (=> b!900423 m!836875))

(assert (=> b!900423 m!836873))

(declare-fun m!836893 () Bool)

(assert (=> b!900423 m!836893))

(declare-fun m!836895 () Bool)

(assert (=> b!900423 m!836895))

(assert (=> b!900423 m!836879))

(declare-fun m!836897 () Bool)

(assert (=> b!900423 m!836897))

(declare-fun m!836899 () Bool)

(assert (=> bm!40026 m!836899))

(assert (=> bm!40028 m!836867))

(declare-fun m!836901 () Bool)

(assert (=> bm!40027 m!836901))

(declare-fun m!836903 () Bool)

(assert (=> b!900429 m!836903))

(declare-fun m!836905 () Bool)

(assert (=> b!900429 m!836905))

(assert (=> b!900429 m!836903))

(declare-fun m!836907 () Bool)

(assert (=> b!900429 m!836907))

(assert (=> b!900429 m!836905))

(assert (=> b!900429 m!836815))

(assert (=> b!900429 m!836815))

(declare-fun m!836909 () Bool)

(assert (=> b!900429 m!836909))

(declare-fun m!836911 () Bool)

(assert (=> b!900431 m!836911))

(declare-fun m!836913 () Bool)

(assert (=> bm!40029 m!836913))

(assert (=> d!111729 m!836777))

(assert (=> b!900436 m!836815))

(assert (=> b!900436 m!836815))

(assert (=> b!900436 m!836817))

(assert (=> b!900283 d!111729))

(declare-fun condMapEmpty!29242 () Bool)

(declare-fun mapDefault!29242 () ValueCell!8706)

(assert (=> mapNonEmpty!29236 (= condMapEmpty!29242 (= mapRest!29236 ((as const (Array (_ BitVec 32) ValueCell!8706)) mapDefault!29242)))))

(declare-fun e!503976 () Bool)

(declare-fun mapRes!29242 () Bool)

(assert (=> mapNonEmpty!29236 (= tp!56229 (and e!503976 mapRes!29242))))

(declare-fun mapNonEmpty!29242 () Bool)

(declare-fun tp!56238 () Bool)

(declare-fun e!503975 () Bool)

(assert (=> mapNonEmpty!29242 (= mapRes!29242 (and tp!56238 e!503975))))

(declare-fun mapRest!29242 () (Array (_ BitVec 32) ValueCell!8706))

(declare-fun mapKey!29242 () (_ BitVec 32))

(declare-fun mapValue!29242 () ValueCell!8706)

(assert (=> mapNonEmpty!29242 (= mapRest!29236 (store mapRest!29242 mapKey!29242 mapValue!29242))))

(declare-fun b!900449 () Bool)

(assert (=> b!900449 (= e!503975 tp_is_empty!18375)))

(declare-fun mapIsEmpty!29242 () Bool)

(assert (=> mapIsEmpty!29242 mapRes!29242))

(declare-fun b!900450 () Bool)

(assert (=> b!900450 (= e!503976 tp_is_empty!18375)))

(assert (= (and mapNonEmpty!29236 condMapEmpty!29242) mapIsEmpty!29242))

(assert (= (and mapNonEmpty!29236 (not condMapEmpty!29242)) mapNonEmpty!29242))

(assert (= (and mapNonEmpty!29242 ((_ is ValueCellFull!8706) mapValue!29242)) b!900449))

(assert (= (and mapNonEmpty!29236 ((_ is ValueCellFull!8706) mapDefault!29242)) b!900450))

(declare-fun m!836915 () Bool)

(assert (=> mapNonEmpty!29242 m!836915))

(declare-fun b_lambda!13017 () Bool)

(assert (= b_lambda!13015 (or (and b!900282 b_free!16047) b_lambda!13017)))

(check-sat (not b!900420) (not b!900327) (not b!900423) (not d!111721) (not b!900326) (not b!900431) (not b!900354) (not b!900426) (not bm!40009) (not b!900337) (not bm!40026) (not b_lambda!13017) (not b!900336) (not d!111713) (not b!900438) b_and!26371 (not d!111711) (not b_next!16047) (not bm!40027) tp_is_empty!18375 (not b!900429) (not d!111715) (not b!900440) (not b!900436) (not d!111729) (not b!900338) (not d!111725) (not b!900377) (not b!900362) (not b!900341) (not b!900371) (not bm!40028) (not bm!40029) (not mapNonEmpty!29242) (not b!900369) (not d!111719))
(check-sat b_and!26371 (not b_next!16047))
