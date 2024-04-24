; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18598 () Bool)

(assert start!18598)

(declare-fun b!184136 () Bool)

(declare-fun b_free!4537 () Bool)

(declare-fun b_next!4537 () Bool)

(assert (=> b!184136 (= b_free!4537 (not b_next!4537))))

(declare-fun tp!16390 () Bool)

(declare-fun b_and!11133 () Bool)

(assert (=> b!184136 (= tp!16390 b_and!11133)))

(declare-fun mapIsEmpty!7405 () Bool)

(declare-fun mapRes!7405 () Bool)

(assert (=> mapIsEmpty!7405 mapRes!7405))

(declare-fun b!184129 () Bool)

(declare-fun e!121196 () Bool)

(declare-fun e!121197 () Bool)

(assert (=> b!184129 (= e!121196 e!121197)))

(declare-fun res!87124 () Bool)

(assert (=> b!184129 (=> (not res!87124) (not e!121197))))

(declare-datatypes ((SeekEntryResult!613 0))(
  ( (MissingZero!613 (index!4622 (_ BitVec 32))) (Found!613 (index!4623 (_ BitVec 32))) (Intermediate!613 (undefined!1425 Bool) (index!4624 (_ BitVec 32)) (x!20019 (_ BitVec 32))) (Undefined!613) (MissingVacant!613 (index!4625 (_ BitVec 32))) )
))
(declare-fun lt!91090 () SeekEntryResult!613)

(get-info :version)

(assert (=> b!184129 (= res!87124 (and (not ((_ is Undefined!613) lt!91090)) (not ((_ is MissingVacant!613) lt!91090)) (not ((_ is MissingZero!613) lt!91090)) ((_ is Found!613) lt!91090)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5393 0))(
  ( (V!5394 (val!2199 Int)) )
))
(declare-datatypes ((ValueCell!1811 0))(
  ( (ValueCellFull!1811 (v!4105 V!5393)) (EmptyCell!1811) )
))
(declare-datatypes ((array!7801 0))(
  ( (array!7802 (arr!3686 (Array (_ BitVec 32) (_ BitVec 64))) (size!4000 (_ BitVec 32))) )
))
(declare-datatypes ((array!7803 0))(
  ( (array!7804 (arr!3687 (Array (_ BitVec 32) ValueCell!1811)) (size!4001 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2530 0))(
  ( (LongMapFixedSize!2531 (defaultEntry!3759 Int) (mask!8837 (_ BitVec 32)) (extraKeys!3496 (_ BitVec 32)) (zeroValue!3600 V!5393) (minValue!3600 V!5393) (_size!1314 (_ BitVec 32)) (_keys!5685 array!7801) (_values!3742 array!7803) (_vacant!1314 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2530)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7801 (_ BitVec 32)) SeekEntryResult!613)

(assert (=> b!184129 (= lt!91090 (seekEntryOrOpen!0 key!828 (_keys!5685 thiss!1248) (mask!8837 thiss!1248)))))

(declare-fun b!184130 () Bool)

(declare-fun e!121195 () Bool)

(declare-fun tp_is_empty!4309 () Bool)

(assert (=> b!184130 (= e!121195 tp_is_empty!4309)))

(declare-fun mapNonEmpty!7405 () Bool)

(declare-fun tp!16389 () Bool)

(assert (=> mapNonEmpty!7405 (= mapRes!7405 (and tp!16389 e!121195))))

(declare-fun mapRest!7405 () (Array (_ BitVec 32) ValueCell!1811))

(declare-fun mapValue!7405 () ValueCell!1811)

(declare-fun mapKey!7405 () (_ BitVec 32))

(assert (=> mapNonEmpty!7405 (= (arr!3687 (_values!3742 thiss!1248)) (store mapRest!7405 mapKey!7405 mapValue!7405))))

(declare-fun b!184131 () Bool)

(declare-fun res!87125 () Bool)

(assert (=> b!184131 (=> (not res!87125) (not e!121197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184131 (= res!87125 (validMask!0 (mask!8837 thiss!1248)))))

(declare-fun b!184132 () Bool)

(declare-fun res!87127 () Bool)

(assert (=> b!184132 (=> (not res!87127) (not e!121197))))

(declare-datatypes ((tuple2!3372 0))(
  ( (tuple2!3373 (_1!1697 (_ BitVec 64)) (_2!1697 V!5393)) )
))
(declare-datatypes ((List!2308 0))(
  ( (Nil!2305) (Cons!2304 (h!2935 tuple2!3372) (t!7172 List!2308)) )
))
(declare-datatypes ((ListLongMap!2293 0))(
  ( (ListLongMap!2294 (toList!1162 List!2308)) )
))
(declare-fun contains!1264 (ListLongMap!2293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!814 (array!7801 array!7803 (_ BitVec 32) (_ BitVec 32) V!5393 V!5393 (_ BitVec 32) Int) ListLongMap!2293)

(assert (=> b!184132 (= res!87127 (not (contains!1264 (getCurrentListMap!814 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)) key!828)))))

(declare-fun res!87123 () Bool)

(assert (=> start!18598 (=> (not res!87123) (not e!121196))))

(declare-fun valid!1070 (LongMapFixedSize!2530) Bool)

(assert (=> start!18598 (= res!87123 (valid!1070 thiss!1248))))

(assert (=> start!18598 e!121196))

(declare-fun e!121200 () Bool)

(assert (=> start!18598 e!121200))

(assert (=> start!18598 true))

(declare-fun b!184133 () Bool)

(declare-fun e!121198 () Bool)

(declare-fun e!121199 () Bool)

(assert (=> b!184133 (= e!121198 (and e!121199 mapRes!7405))))

(declare-fun condMapEmpty!7405 () Bool)

(declare-fun mapDefault!7405 () ValueCell!1811)

(assert (=> b!184133 (= condMapEmpty!7405 (= (arr!3687 (_values!3742 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1811)) mapDefault!7405)))))

(declare-fun b!184134 () Bool)

(declare-fun res!87126 () Bool)

(assert (=> b!184134 (=> (not res!87126) (not e!121196))))

(assert (=> b!184134 (= res!87126 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184135 () Bool)

(assert (=> b!184135 (= e!121197 (and (= (size!4001 (_values!3742 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8837 thiss!1248))) (= (size!4000 (_keys!5685 thiss!1248)) (size!4001 (_values!3742 thiss!1248))) (bvslt (mask!8837 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun array_inv!2381 (array!7801) Bool)

(declare-fun array_inv!2382 (array!7803) Bool)

(assert (=> b!184136 (= e!121200 (and tp!16390 tp_is_empty!4309 (array_inv!2381 (_keys!5685 thiss!1248)) (array_inv!2382 (_values!3742 thiss!1248)) e!121198))))

(declare-fun b!184137 () Bool)

(assert (=> b!184137 (= e!121199 tp_is_empty!4309)))

(assert (= (and start!18598 res!87123) b!184134))

(assert (= (and b!184134 res!87126) b!184129))

(assert (= (and b!184129 res!87124) b!184132))

(assert (= (and b!184132 res!87127) b!184131))

(assert (= (and b!184131 res!87125) b!184135))

(assert (= (and b!184133 condMapEmpty!7405) mapIsEmpty!7405))

(assert (= (and b!184133 (not condMapEmpty!7405)) mapNonEmpty!7405))

(assert (= (and mapNonEmpty!7405 ((_ is ValueCellFull!1811) mapValue!7405)) b!184130))

(assert (= (and b!184133 ((_ is ValueCellFull!1811) mapDefault!7405)) b!184137))

(assert (= b!184136 b!184133))

(assert (= start!18598 b!184136))

(declare-fun m!211725 () Bool)

(assert (=> b!184129 m!211725))

(declare-fun m!211727 () Bool)

(assert (=> mapNonEmpty!7405 m!211727))

(declare-fun m!211729 () Bool)

(assert (=> start!18598 m!211729))

(declare-fun m!211731 () Bool)

(assert (=> b!184132 m!211731))

(assert (=> b!184132 m!211731))

(declare-fun m!211733 () Bool)

(assert (=> b!184132 m!211733))

(declare-fun m!211735 () Bool)

(assert (=> b!184131 m!211735))

(declare-fun m!211737 () Bool)

(assert (=> b!184136 m!211737))

(declare-fun m!211739 () Bool)

(assert (=> b!184136 m!211739))

(check-sat (not b!184132) (not b_next!4537) (not mapNonEmpty!7405) tp_is_empty!4309 (not b!184136) b_and!11133 (not b!184131) (not b!184129) (not start!18598))
(check-sat b_and!11133 (not b_next!4537))
(get-model)

(declare-fun b!184204 () Bool)

(declare-fun c!33038 () Bool)

(declare-fun lt!91105 () (_ BitVec 64))

(assert (=> b!184204 (= c!33038 (= lt!91105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121250 () SeekEntryResult!613)

(declare-fun e!121249 () SeekEntryResult!613)

(assert (=> b!184204 (= e!121250 e!121249)))

(declare-fun b!184205 () Bool)

(declare-fun lt!91103 () SeekEntryResult!613)

(assert (=> b!184205 (= e!121250 (Found!613 (index!4624 lt!91103)))))

(declare-fun b!184206 () Bool)

(declare-fun e!121251 () SeekEntryResult!613)

(assert (=> b!184206 (= e!121251 Undefined!613)))

(declare-fun b!184207 () Bool)

(assert (=> b!184207 (= e!121251 e!121250)))

(assert (=> b!184207 (= lt!91105 (select (arr!3686 (_keys!5685 thiss!1248)) (index!4624 lt!91103)))))

(declare-fun c!33039 () Bool)

(assert (=> b!184207 (= c!33039 (= lt!91105 key!828))))

(declare-fun b!184208 () Bool)

(assert (=> b!184208 (= e!121249 (MissingZero!613 (index!4624 lt!91103)))))

(declare-fun b!184209 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7801 (_ BitVec 32)) SeekEntryResult!613)

(assert (=> b!184209 (= e!121249 (seekKeyOrZeroReturnVacant!0 (x!20019 lt!91103) (index!4624 lt!91103) (index!4624 lt!91103) key!828 (_keys!5685 thiss!1248) (mask!8837 thiss!1248)))))

(declare-fun d!54957 () Bool)

(declare-fun lt!91104 () SeekEntryResult!613)

(assert (=> d!54957 (and (or ((_ is Undefined!613) lt!91104) (not ((_ is Found!613) lt!91104)) (and (bvsge (index!4623 lt!91104) #b00000000000000000000000000000000) (bvslt (index!4623 lt!91104) (size!4000 (_keys!5685 thiss!1248))))) (or ((_ is Undefined!613) lt!91104) ((_ is Found!613) lt!91104) (not ((_ is MissingZero!613) lt!91104)) (and (bvsge (index!4622 lt!91104) #b00000000000000000000000000000000) (bvslt (index!4622 lt!91104) (size!4000 (_keys!5685 thiss!1248))))) (or ((_ is Undefined!613) lt!91104) ((_ is Found!613) lt!91104) ((_ is MissingZero!613) lt!91104) (not ((_ is MissingVacant!613) lt!91104)) (and (bvsge (index!4625 lt!91104) #b00000000000000000000000000000000) (bvslt (index!4625 lt!91104) (size!4000 (_keys!5685 thiss!1248))))) (or ((_ is Undefined!613) lt!91104) (ite ((_ is Found!613) lt!91104) (= (select (arr!3686 (_keys!5685 thiss!1248)) (index!4623 lt!91104)) key!828) (ite ((_ is MissingZero!613) lt!91104) (= (select (arr!3686 (_keys!5685 thiss!1248)) (index!4622 lt!91104)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!613) lt!91104) (= (select (arr!3686 (_keys!5685 thiss!1248)) (index!4625 lt!91104)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54957 (= lt!91104 e!121251)))

(declare-fun c!33037 () Bool)

(assert (=> d!54957 (= c!33037 (and ((_ is Intermediate!613) lt!91103) (undefined!1425 lt!91103)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7801 (_ BitVec 32)) SeekEntryResult!613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54957 (= lt!91103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8837 thiss!1248)) key!828 (_keys!5685 thiss!1248) (mask!8837 thiss!1248)))))

(assert (=> d!54957 (validMask!0 (mask!8837 thiss!1248))))

(assert (=> d!54957 (= (seekEntryOrOpen!0 key!828 (_keys!5685 thiss!1248) (mask!8837 thiss!1248)) lt!91104)))

(assert (= (and d!54957 c!33037) b!184206))

(assert (= (and d!54957 (not c!33037)) b!184207))

(assert (= (and b!184207 c!33039) b!184205))

(assert (= (and b!184207 (not c!33039)) b!184204))

(assert (= (and b!184204 c!33038) b!184208))

(assert (= (and b!184204 (not c!33038)) b!184209))

(declare-fun m!211773 () Bool)

(assert (=> b!184207 m!211773))

(declare-fun m!211775 () Bool)

(assert (=> b!184209 m!211775))

(declare-fun m!211777 () Bool)

(assert (=> d!54957 m!211777))

(declare-fun m!211779 () Bool)

(assert (=> d!54957 m!211779))

(declare-fun m!211781 () Bool)

(assert (=> d!54957 m!211781))

(declare-fun m!211783 () Bool)

(assert (=> d!54957 m!211783))

(assert (=> d!54957 m!211735))

(assert (=> d!54957 m!211779))

(declare-fun m!211785 () Bool)

(assert (=> d!54957 m!211785))

(assert (=> b!184129 d!54957))

(declare-fun d!54959 () Bool)

(assert (=> d!54959 (= (validMask!0 (mask!8837 thiss!1248)) (and (or (= (mask!8837 thiss!1248) #b00000000000000000000000000000111) (= (mask!8837 thiss!1248) #b00000000000000000000000000001111) (= (mask!8837 thiss!1248) #b00000000000000000000000000011111) (= (mask!8837 thiss!1248) #b00000000000000000000000000111111) (= (mask!8837 thiss!1248) #b00000000000000000000000001111111) (= (mask!8837 thiss!1248) #b00000000000000000000000011111111) (= (mask!8837 thiss!1248) #b00000000000000000000000111111111) (= (mask!8837 thiss!1248) #b00000000000000000000001111111111) (= (mask!8837 thiss!1248) #b00000000000000000000011111111111) (= (mask!8837 thiss!1248) #b00000000000000000000111111111111) (= (mask!8837 thiss!1248) #b00000000000000000001111111111111) (= (mask!8837 thiss!1248) #b00000000000000000011111111111111) (= (mask!8837 thiss!1248) #b00000000000000000111111111111111) (= (mask!8837 thiss!1248) #b00000000000000001111111111111111) (= (mask!8837 thiss!1248) #b00000000000000011111111111111111) (= (mask!8837 thiss!1248) #b00000000000000111111111111111111) (= (mask!8837 thiss!1248) #b00000000000001111111111111111111) (= (mask!8837 thiss!1248) #b00000000000011111111111111111111) (= (mask!8837 thiss!1248) #b00000000000111111111111111111111) (= (mask!8837 thiss!1248) #b00000000001111111111111111111111) (= (mask!8837 thiss!1248) #b00000000011111111111111111111111) (= (mask!8837 thiss!1248) #b00000000111111111111111111111111) (= (mask!8837 thiss!1248) #b00000001111111111111111111111111) (= (mask!8837 thiss!1248) #b00000011111111111111111111111111) (= (mask!8837 thiss!1248) #b00000111111111111111111111111111) (= (mask!8837 thiss!1248) #b00001111111111111111111111111111) (= (mask!8837 thiss!1248) #b00011111111111111111111111111111) (= (mask!8837 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8837 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184131 d!54959))

(declare-fun d!54961 () Bool)

(declare-fun e!121257 () Bool)

(assert (=> d!54961 e!121257))

(declare-fun res!87160 () Bool)

(assert (=> d!54961 (=> res!87160 e!121257)))

(declare-fun lt!91117 () Bool)

(assert (=> d!54961 (= res!87160 (not lt!91117))))

(declare-fun lt!91114 () Bool)

(assert (=> d!54961 (= lt!91117 lt!91114)))

(declare-datatypes ((Unit!5564 0))(
  ( (Unit!5565) )
))
(declare-fun lt!91115 () Unit!5564)

(declare-fun e!121256 () Unit!5564)

(assert (=> d!54961 (= lt!91115 e!121256)))

(declare-fun c!33042 () Bool)

(assert (=> d!54961 (= c!33042 lt!91114)))

(declare-fun containsKey!222 (List!2308 (_ BitVec 64)) Bool)

(assert (=> d!54961 (= lt!91114 (containsKey!222 (toList!1162 (getCurrentListMap!814 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248))) key!828))))

(assert (=> d!54961 (= (contains!1264 (getCurrentListMap!814 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)) key!828) lt!91117)))

(declare-fun b!184216 () Bool)

(declare-fun lt!91116 () Unit!5564)

(assert (=> b!184216 (= e!121256 lt!91116)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!170 (List!2308 (_ BitVec 64)) Unit!5564)

(assert (=> b!184216 (= lt!91116 (lemmaContainsKeyImpliesGetValueByKeyDefined!170 (toList!1162 (getCurrentListMap!814 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248))) key!828))))

(declare-datatypes ((Option!225 0))(
  ( (Some!224 (v!4108 V!5393)) (None!223) )
))
(declare-fun isDefined!171 (Option!225) Bool)

(declare-fun getValueByKey!219 (List!2308 (_ BitVec 64)) Option!225)

(assert (=> b!184216 (isDefined!171 (getValueByKey!219 (toList!1162 (getCurrentListMap!814 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248))) key!828))))

(declare-fun b!184217 () Bool)

(declare-fun Unit!5566 () Unit!5564)

(assert (=> b!184217 (= e!121256 Unit!5566)))

(declare-fun b!184218 () Bool)

(assert (=> b!184218 (= e!121257 (isDefined!171 (getValueByKey!219 (toList!1162 (getCurrentListMap!814 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248))) key!828)))))

(assert (= (and d!54961 c!33042) b!184216))

(assert (= (and d!54961 (not c!33042)) b!184217))

(assert (= (and d!54961 (not res!87160)) b!184218))

(declare-fun m!211787 () Bool)

(assert (=> d!54961 m!211787))

(declare-fun m!211789 () Bool)

(assert (=> b!184216 m!211789))

(declare-fun m!211791 () Bool)

(assert (=> b!184216 m!211791))

(assert (=> b!184216 m!211791))

(declare-fun m!211793 () Bool)

(assert (=> b!184216 m!211793))

(assert (=> b!184218 m!211791))

(assert (=> b!184218 m!211791))

(assert (=> b!184218 m!211793))

(assert (=> b!184132 d!54961))

(declare-fun b!184261 () Bool)

(declare-fun e!121286 () Bool)

(declare-fun e!121292 () Bool)

(assert (=> b!184261 (= e!121286 e!121292)))

(declare-fun res!87180 () Bool)

(assert (=> b!184261 (=> (not res!87180) (not e!121292))))

(declare-fun lt!91162 () ListLongMap!2293)

(assert (=> b!184261 (= res!87180 (contains!1264 lt!91162 (select (arr!3686 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4000 (_keys!5685 thiss!1248))))))

(declare-fun b!184262 () Bool)

(declare-fun e!121291 () ListLongMap!2293)

(declare-fun call!18578 () ListLongMap!2293)

(declare-fun +!281 (ListLongMap!2293 tuple2!3372) ListLongMap!2293)

(assert (=> b!184262 (= e!121291 (+!281 call!18578 (tuple2!3373 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3600 thiss!1248))))))

(declare-fun b!184263 () Bool)

(declare-fun apply!161 (ListLongMap!2293 (_ BitVec 64)) V!5393)

(declare-fun get!2126 (ValueCell!1811 V!5393) V!5393)

(declare-fun dynLambda!504 (Int (_ BitVec 64)) V!5393)

(assert (=> b!184263 (= e!121292 (= (apply!161 lt!91162 (select (arr!3686 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000)) (get!2126 (select (arr!3687 (_values!3742 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!504 (defaultEntry!3759 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4001 (_values!3742 thiss!1248))))))

(assert (=> b!184263 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4000 (_keys!5685 thiss!1248))))))

(declare-fun b!184264 () Bool)

(declare-fun e!121287 () Bool)

(assert (=> b!184264 (= e!121287 (= (apply!161 lt!91162 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3600 thiss!1248)))))

(declare-fun bm!18574 () Bool)

(declare-fun call!18577 () ListLongMap!2293)

(assert (=> bm!18574 (= call!18577 call!18578)))

(declare-fun bm!18575 () Bool)

(declare-fun call!18580 () ListLongMap!2293)

(declare-fun getCurrentListMapNoExtraKeys!192 (array!7801 array!7803 (_ BitVec 32) (_ BitVec 32) V!5393 V!5393 (_ BitVec 32) Int) ListLongMap!2293)

(assert (=> bm!18575 (= call!18580 (getCurrentListMapNoExtraKeys!192 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun b!184265 () Bool)

(declare-fun e!121296 () Unit!5564)

(declare-fun lt!91181 () Unit!5564)

(assert (=> b!184265 (= e!121296 lt!91181)))

(declare-fun lt!91178 () ListLongMap!2293)

(assert (=> b!184265 (= lt!91178 (getCurrentListMapNoExtraKeys!192 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun lt!91175 () (_ BitVec 64))

(assert (=> b!184265 (= lt!91175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91177 () (_ BitVec 64))

(assert (=> b!184265 (= lt!91177 (select (arr!3686 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91176 () Unit!5564)

(declare-fun addStillContains!137 (ListLongMap!2293 (_ BitVec 64) V!5393 (_ BitVec 64)) Unit!5564)

(assert (=> b!184265 (= lt!91176 (addStillContains!137 lt!91178 lt!91175 (zeroValue!3600 thiss!1248) lt!91177))))

(assert (=> b!184265 (contains!1264 (+!281 lt!91178 (tuple2!3373 lt!91175 (zeroValue!3600 thiss!1248))) lt!91177)))

(declare-fun lt!91167 () Unit!5564)

(assert (=> b!184265 (= lt!91167 lt!91176)))

(declare-fun lt!91164 () ListLongMap!2293)

(assert (=> b!184265 (= lt!91164 (getCurrentListMapNoExtraKeys!192 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun lt!91174 () (_ BitVec 64))

(assert (=> b!184265 (= lt!91174 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91166 () (_ BitVec 64))

(assert (=> b!184265 (= lt!91166 (select (arr!3686 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91179 () Unit!5564)

(declare-fun addApplyDifferent!137 (ListLongMap!2293 (_ BitVec 64) V!5393 (_ BitVec 64)) Unit!5564)

(assert (=> b!184265 (= lt!91179 (addApplyDifferent!137 lt!91164 lt!91174 (minValue!3600 thiss!1248) lt!91166))))

(assert (=> b!184265 (= (apply!161 (+!281 lt!91164 (tuple2!3373 lt!91174 (minValue!3600 thiss!1248))) lt!91166) (apply!161 lt!91164 lt!91166))))

(declare-fun lt!91168 () Unit!5564)

(assert (=> b!184265 (= lt!91168 lt!91179)))

(declare-fun lt!91163 () ListLongMap!2293)

(assert (=> b!184265 (= lt!91163 (getCurrentListMapNoExtraKeys!192 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun lt!91165 () (_ BitVec 64))

(assert (=> b!184265 (= lt!91165 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91171 () (_ BitVec 64))

(assert (=> b!184265 (= lt!91171 (select (arr!3686 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91172 () Unit!5564)

(assert (=> b!184265 (= lt!91172 (addApplyDifferent!137 lt!91163 lt!91165 (zeroValue!3600 thiss!1248) lt!91171))))

(assert (=> b!184265 (= (apply!161 (+!281 lt!91163 (tuple2!3373 lt!91165 (zeroValue!3600 thiss!1248))) lt!91171) (apply!161 lt!91163 lt!91171))))

(declare-fun lt!91169 () Unit!5564)

(assert (=> b!184265 (= lt!91169 lt!91172)))

(declare-fun lt!91170 () ListLongMap!2293)

(assert (=> b!184265 (= lt!91170 (getCurrentListMapNoExtraKeys!192 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun lt!91180 () (_ BitVec 64))

(assert (=> b!184265 (= lt!91180 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91173 () (_ BitVec 64))

(assert (=> b!184265 (= lt!91173 (select (arr!3686 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184265 (= lt!91181 (addApplyDifferent!137 lt!91170 lt!91180 (minValue!3600 thiss!1248) lt!91173))))

(assert (=> b!184265 (= (apply!161 (+!281 lt!91170 (tuple2!3373 lt!91180 (minValue!3600 thiss!1248))) lt!91173) (apply!161 lt!91170 lt!91173))))

(declare-fun b!184266 () Bool)

(declare-fun e!121285 () ListLongMap!2293)

(declare-fun call!18582 () ListLongMap!2293)

(assert (=> b!184266 (= e!121285 call!18582)))

(declare-fun bm!18576 () Bool)

(declare-fun call!18581 () Bool)

(assert (=> bm!18576 (= call!18581 (contains!1264 lt!91162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184267 () Bool)

(declare-fun c!33057 () Bool)

(assert (=> b!184267 (= c!33057 (and (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!121290 () ListLongMap!2293)

(assert (=> b!184267 (= e!121290 e!121285)))

(declare-fun b!184268 () Bool)

(declare-fun e!121295 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184268 (= e!121295 (validKeyInArray!0 (select (arr!3686 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18577 () Bool)

(declare-fun call!18579 () ListLongMap!2293)

(declare-fun c!33056 () Bool)

(declare-fun c!33059 () Bool)

(assert (=> bm!18577 (= call!18578 (+!281 (ite c!33056 call!18580 (ite c!33059 call!18579 call!18582)) (ite (or c!33056 c!33059) (tuple2!3373 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3600 thiss!1248)) (tuple2!3373 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3600 thiss!1248)))))))

(declare-fun b!184269 () Bool)

(declare-fun e!121284 () Bool)

(declare-fun e!121293 () Bool)

(assert (=> b!184269 (= e!121284 e!121293)))

(declare-fun c!33055 () Bool)

(assert (=> b!184269 (= c!33055 (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184270 () Bool)

(declare-fun e!121289 () Bool)

(assert (=> b!184270 (= e!121289 (not call!18581))))

(declare-fun b!184271 () Bool)

(declare-fun res!87186 () Bool)

(assert (=> b!184271 (=> (not res!87186) (not e!121284))))

(assert (=> b!184271 (= res!87186 e!121289)))

(declare-fun c!33058 () Bool)

(assert (=> b!184271 (= c!33058 (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!184272 () Bool)

(declare-fun call!18583 () Bool)

(assert (=> b!184272 (= e!121293 (not call!18583))))

(declare-fun b!184273 () Bool)

(assert (=> b!184273 (= e!121289 e!121287)))

(declare-fun res!87187 () Bool)

(assert (=> b!184273 (= res!87187 call!18581)))

(assert (=> b!184273 (=> (not res!87187) (not e!121287))))

(declare-fun d!54963 () Bool)

(assert (=> d!54963 e!121284))

(declare-fun res!87184 () Bool)

(assert (=> d!54963 (=> (not res!87184) (not e!121284))))

(assert (=> d!54963 (= res!87184 (or (bvsge #b00000000000000000000000000000000 (size!4000 (_keys!5685 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4000 (_keys!5685 thiss!1248))))))))

(declare-fun lt!91183 () ListLongMap!2293)

(assert (=> d!54963 (= lt!91162 lt!91183)))

(declare-fun lt!91182 () Unit!5564)

(assert (=> d!54963 (= lt!91182 e!121296)))

(declare-fun c!33060 () Bool)

(declare-fun e!121294 () Bool)

(assert (=> d!54963 (= c!33060 e!121294)))

(declare-fun res!87185 () Bool)

(assert (=> d!54963 (=> (not res!87185) (not e!121294))))

(assert (=> d!54963 (= res!87185 (bvslt #b00000000000000000000000000000000 (size!4000 (_keys!5685 thiss!1248))))))

(assert (=> d!54963 (= lt!91183 e!121291)))

(assert (=> d!54963 (= c!33056 (and (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54963 (validMask!0 (mask!8837 thiss!1248))))

(assert (=> d!54963 (= (getCurrentListMap!814 (_keys!5685 thiss!1248) (_values!3742 thiss!1248) (mask!8837 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)) lt!91162)))

(declare-fun b!184274 () Bool)

(declare-fun Unit!5567 () Unit!5564)

(assert (=> b!184274 (= e!121296 Unit!5567)))

(declare-fun b!184275 () Bool)

(declare-fun e!121288 () Bool)

(assert (=> b!184275 (= e!121288 (= (apply!161 lt!91162 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3600 thiss!1248)))))

(declare-fun bm!18578 () Bool)

(assert (=> bm!18578 (= call!18583 (contains!1264 lt!91162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18579 () Bool)

(assert (=> bm!18579 (= call!18582 call!18579)))

(declare-fun b!184276 () Bool)

(assert (=> b!184276 (= e!121285 call!18577)))

(declare-fun b!184277 () Bool)

(assert (=> b!184277 (= e!121291 e!121290)))

(assert (=> b!184277 (= c!33059 (and (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184278 () Bool)

(assert (=> b!184278 (= e!121293 e!121288)))

(declare-fun res!87181 () Bool)

(assert (=> b!184278 (= res!87181 call!18583)))

(assert (=> b!184278 (=> (not res!87181) (not e!121288))))

(declare-fun b!184279 () Bool)

(assert (=> b!184279 (= e!121294 (validKeyInArray!0 (select (arr!3686 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184280 () Bool)

(declare-fun res!87179 () Bool)

(assert (=> b!184280 (=> (not res!87179) (not e!121284))))

(assert (=> b!184280 (= res!87179 e!121286)))

(declare-fun res!87183 () Bool)

(assert (=> b!184280 (=> res!87183 e!121286)))

(assert (=> b!184280 (= res!87183 (not e!121295))))

(declare-fun res!87182 () Bool)

(assert (=> b!184280 (=> (not res!87182) (not e!121295))))

(assert (=> b!184280 (= res!87182 (bvslt #b00000000000000000000000000000000 (size!4000 (_keys!5685 thiss!1248))))))

(declare-fun bm!18580 () Bool)

(assert (=> bm!18580 (= call!18579 call!18580)))

(declare-fun b!184281 () Bool)

(assert (=> b!184281 (= e!121290 call!18577)))

(assert (= (and d!54963 c!33056) b!184262))

(assert (= (and d!54963 (not c!33056)) b!184277))

(assert (= (and b!184277 c!33059) b!184281))

(assert (= (and b!184277 (not c!33059)) b!184267))

(assert (= (and b!184267 c!33057) b!184276))

(assert (= (and b!184267 (not c!33057)) b!184266))

(assert (= (or b!184276 b!184266) bm!18579))

(assert (= (or b!184281 bm!18579) bm!18580))

(assert (= (or b!184281 b!184276) bm!18574))

(assert (= (or b!184262 bm!18580) bm!18575))

(assert (= (or b!184262 bm!18574) bm!18577))

(assert (= (and d!54963 res!87185) b!184279))

(assert (= (and d!54963 c!33060) b!184265))

(assert (= (and d!54963 (not c!33060)) b!184274))

(assert (= (and d!54963 res!87184) b!184280))

(assert (= (and b!184280 res!87182) b!184268))

(assert (= (and b!184280 (not res!87183)) b!184261))

(assert (= (and b!184261 res!87180) b!184263))

(assert (= (and b!184280 res!87179) b!184271))

(assert (= (and b!184271 c!33058) b!184273))

(assert (= (and b!184271 (not c!33058)) b!184270))

(assert (= (and b!184273 res!87187) b!184264))

(assert (= (or b!184273 b!184270) bm!18576))

(assert (= (and b!184271 res!87186) b!184269))

(assert (= (and b!184269 c!33055) b!184278))

(assert (= (and b!184269 (not c!33055)) b!184272))

(assert (= (and b!184278 res!87181) b!184275))

(assert (= (or b!184278 b!184272) bm!18578))

(declare-fun b_lambda!7237 () Bool)

(assert (=> (not b_lambda!7237) (not b!184263)))

(declare-fun t!7174 () Bool)

(declare-fun tb!2825 () Bool)

(assert (=> (and b!184136 (= (defaultEntry!3759 thiss!1248) (defaultEntry!3759 thiss!1248)) t!7174) tb!2825))

(declare-fun result!4769 () Bool)

(assert (=> tb!2825 (= result!4769 tp_is_empty!4309)))

(assert (=> b!184263 t!7174))

(declare-fun b_and!11139 () Bool)

(assert (= b_and!11133 (and (=> t!7174 result!4769) b_and!11139)))

(declare-fun m!211795 () Bool)

(assert (=> b!184265 m!211795))

(declare-fun m!211797 () Bool)

(assert (=> b!184265 m!211797))

(declare-fun m!211799 () Bool)

(assert (=> b!184265 m!211799))

(declare-fun m!211801 () Bool)

(assert (=> b!184265 m!211801))

(assert (=> b!184265 m!211795))

(declare-fun m!211803 () Bool)

(assert (=> b!184265 m!211803))

(assert (=> b!184265 m!211801))

(declare-fun m!211805 () Bool)

(assert (=> b!184265 m!211805))

(declare-fun m!211807 () Bool)

(assert (=> b!184265 m!211807))

(declare-fun m!211809 () Bool)

(assert (=> b!184265 m!211809))

(assert (=> b!184265 m!211809))

(declare-fun m!211811 () Bool)

(assert (=> b!184265 m!211811))

(declare-fun m!211813 () Bool)

(assert (=> b!184265 m!211813))

(declare-fun m!211815 () Bool)

(assert (=> b!184265 m!211815))

(declare-fun m!211817 () Bool)

(assert (=> b!184265 m!211817))

(declare-fun m!211819 () Bool)

(assert (=> b!184265 m!211819))

(declare-fun m!211821 () Bool)

(assert (=> b!184265 m!211821))

(declare-fun m!211823 () Bool)

(assert (=> b!184265 m!211823))

(declare-fun m!211825 () Bool)

(assert (=> b!184265 m!211825))

(declare-fun m!211827 () Bool)

(assert (=> b!184265 m!211827))

(assert (=> b!184265 m!211813))

(assert (=> b!184263 m!211799))

(declare-fun m!211829 () Bool)

(assert (=> b!184263 m!211829))

(declare-fun m!211831 () Bool)

(assert (=> b!184263 m!211831))

(assert (=> b!184263 m!211831))

(assert (=> b!184263 m!211829))

(declare-fun m!211833 () Bool)

(assert (=> b!184263 m!211833))

(assert (=> b!184263 m!211799))

(declare-fun m!211835 () Bool)

(assert (=> b!184263 m!211835))

(assert (=> b!184279 m!211799))

(assert (=> b!184279 m!211799))

(declare-fun m!211837 () Bool)

(assert (=> b!184279 m!211837))

(declare-fun m!211839 () Bool)

(assert (=> b!184262 m!211839))

(assert (=> b!184268 m!211799))

(assert (=> b!184268 m!211799))

(assert (=> b!184268 m!211837))

(declare-fun m!211841 () Bool)

(assert (=> b!184275 m!211841))

(declare-fun m!211843 () Bool)

(assert (=> b!184264 m!211843))

(declare-fun m!211845 () Bool)

(assert (=> bm!18578 m!211845))

(assert (=> b!184261 m!211799))

(assert (=> b!184261 m!211799))

(declare-fun m!211847 () Bool)

(assert (=> b!184261 m!211847))

(declare-fun m!211849 () Bool)

(assert (=> bm!18576 m!211849))

(assert (=> d!54963 m!211735))

(declare-fun m!211851 () Bool)

(assert (=> bm!18577 m!211851))

(assert (=> bm!18575 m!211825))

(assert (=> b!184132 d!54963))

(declare-fun d!54965 () Bool)

(declare-fun res!87194 () Bool)

(declare-fun e!121299 () Bool)

(assert (=> d!54965 (=> (not res!87194) (not e!121299))))

(declare-fun simpleValid!177 (LongMapFixedSize!2530) Bool)

(assert (=> d!54965 (= res!87194 (simpleValid!177 thiss!1248))))

(assert (=> d!54965 (= (valid!1070 thiss!1248) e!121299)))

(declare-fun b!184290 () Bool)

(declare-fun res!87195 () Bool)

(assert (=> b!184290 (=> (not res!87195) (not e!121299))))

(declare-fun arrayCountValidKeys!0 (array!7801 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184290 (= res!87195 (= (arrayCountValidKeys!0 (_keys!5685 thiss!1248) #b00000000000000000000000000000000 (size!4000 (_keys!5685 thiss!1248))) (_size!1314 thiss!1248)))))

(declare-fun b!184291 () Bool)

(declare-fun res!87196 () Bool)

(assert (=> b!184291 (=> (not res!87196) (not e!121299))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7801 (_ BitVec 32)) Bool)

(assert (=> b!184291 (= res!87196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5685 thiss!1248) (mask!8837 thiss!1248)))))

(declare-fun b!184292 () Bool)

(declare-datatypes ((List!2309 0))(
  ( (Nil!2306) (Cons!2305 (h!2936 (_ BitVec 64)) (t!7175 List!2309)) )
))
(declare-fun arrayNoDuplicates!0 (array!7801 (_ BitVec 32) List!2309) Bool)

(assert (=> b!184292 (= e!121299 (arrayNoDuplicates!0 (_keys!5685 thiss!1248) #b00000000000000000000000000000000 Nil!2306))))

(assert (= (and d!54965 res!87194) b!184290))

(assert (= (and b!184290 res!87195) b!184291))

(assert (= (and b!184291 res!87196) b!184292))

(declare-fun m!211853 () Bool)

(assert (=> d!54965 m!211853))

(declare-fun m!211855 () Bool)

(assert (=> b!184290 m!211855))

(declare-fun m!211857 () Bool)

(assert (=> b!184291 m!211857))

(declare-fun m!211859 () Bool)

(assert (=> b!184292 m!211859))

(assert (=> start!18598 d!54965))

(declare-fun d!54967 () Bool)

(assert (=> d!54967 (= (array_inv!2381 (_keys!5685 thiss!1248)) (bvsge (size!4000 (_keys!5685 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184136 d!54967))

(declare-fun d!54969 () Bool)

(assert (=> d!54969 (= (array_inv!2382 (_values!3742 thiss!1248)) (bvsge (size!4001 (_values!3742 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184136 d!54969))

(declare-fun mapNonEmpty!7414 () Bool)

(declare-fun mapRes!7414 () Bool)

(declare-fun tp!16405 () Bool)

(declare-fun e!121304 () Bool)

(assert (=> mapNonEmpty!7414 (= mapRes!7414 (and tp!16405 e!121304))))

(declare-fun mapRest!7414 () (Array (_ BitVec 32) ValueCell!1811))

(declare-fun mapKey!7414 () (_ BitVec 32))

(declare-fun mapValue!7414 () ValueCell!1811)

(assert (=> mapNonEmpty!7414 (= mapRest!7405 (store mapRest!7414 mapKey!7414 mapValue!7414))))

(declare-fun b!184300 () Bool)

(declare-fun e!121305 () Bool)

(assert (=> b!184300 (= e!121305 tp_is_empty!4309)))

(declare-fun mapIsEmpty!7414 () Bool)

(assert (=> mapIsEmpty!7414 mapRes!7414))

(declare-fun b!184299 () Bool)

(assert (=> b!184299 (= e!121304 tp_is_empty!4309)))

(declare-fun condMapEmpty!7414 () Bool)

(declare-fun mapDefault!7414 () ValueCell!1811)

(assert (=> mapNonEmpty!7405 (= condMapEmpty!7414 (= mapRest!7405 ((as const (Array (_ BitVec 32) ValueCell!1811)) mapDefault!7414)))))

(assert (=> mapNonEmpty!7405 (= tp!16389 (and e!121305 mapRes!7414))))

(assert (= (and mapNonEmpty!7405 condMapEmpty!7414) mapIsEmpty!7414))

(assert (= (and mapNonEmpty!7405 (not condMapEmpty!7414)) mapNonEmpty!7414))

(assert (= (and mapNonEmpty!7414 ((_ is ValueCellFull!1811) mapValue!7414)) b!184299))

(assert (= (and mapNonEmpty!7405 ((_ is ValueCellFull!1811) mapDefault!7414)) b!184300))

(declare-fun m!211861 () Bool)

(assert (=> mapNonEmpty!7414 m!211861))

(declare-fun b_lambda!7239 () Bool)

(assert (= b_lambda!7237 (or (and b!184136 b_free!4537) b_lambda!7239)))

(check-sat (not mapNonEmpty!7414) (not bm!18577) (not b!184290) (not b!184279) (not b!184291) (not d!54963) (not bm!18575) (not b!184292) (not b!184261) (not b!184209) (not b!184275) (not d!54965) (not b!184268) (not bm!18578) (not b_next!4537) (not b_lambda!7239) (not b!184265) (not b!184263) (not b!184216) (not d!54957) tp_is_empty!4309 (not b!184262) b_and!11139 (not b!184218) (not bm!18576) (not b!184264) (not d!54961))
(check-sat b_and!11139 (not b_next!4537))
