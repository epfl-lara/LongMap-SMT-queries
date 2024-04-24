; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18618 () Bool)

(assert start!18618)

(declare-fun b!184320 () Bool)

(declare-fun b_free!4543 () Bool)

(declare-fun b_next!4543 () Bool)

(assert (=> b!184320 (= b_free!4543 (not b_next!4543))))

(declare-fun tp!16411 () Bool)

(declare-fun b_and!11141 () Bool)

(assert (=> b!184320 (= tp!16411 b_and!11141)))

(declare-fun mapNonEmpty!7417 () Bool)

(declare-fun mapRes!7417 () Bool)

(declare-fun tp!16410 () Bool)

(declare-fun e!121320 () Bool)

(assert (=> mapNonEmpty!7417 (= mapRes!7417 (and tp!16410 e!121320))))

(declare-datatypes ((V!5401 0))(
  ( (V!5402 (val!2202 Int)) )
))
(declare-datatypes ((ValueCell!1814 0))(
  ( (ValueCellFull!1814 (v!4109 V!5401)) (EmptyCell!1814) )
))
(declare-fun mapRest!7417 () (Array (_ BitVec 32) ValueCell!1814))

(declare-fun mapKey!7417 () (_ BitVec 32))

(declare-datatypes ((array!7815 0))(
  ( (array!7816 (arr!3692 (Array (_ BitVec 32) (_ BitVec 64))) (size!4006 (_ BitVec 32))) )
))
(declare-datatypes ((array!7817 0))(
  ( (array!7818 (arr!3693 (Array (_ BitVec 32) ValueCell!1814)) (size!4007 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2536 0))(
  ( (LongMapFixedSize!2537 (defaultEntry!3763 Int) (mask!8845 (_ BitVec 32)) (extraKeys!3500 (_ BitVec 32)) (zeroValue!3604 V!5401) (minValue!3604 V!5401) (_size!1317 (_ BitVec 32)) (_keys!5690 array!7815) (_values!3746 array!7817) (_vacant!1317 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2536)

(declare-fun mapValue!7417 () ValueCell!1814)

(assert (=> mapNonEmpty!7417 (= (arr!3693 (_values!3746 thiss!1248)) (store mapRest!7417 mapKey!7417 mapValue!7417))))

(declare-fun mapIsEmpty!7417 () Bool)

(assert (=> mapIsEmpty!7417 mapRes!7417))

(declare-fun b!184319 () Bool)

(declare-fun e!121325 () Bool)

(assert (=> b!184319 (= e!121325 (and (= (size!4007 (_values!3746 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8845 thiss!1248))) (= (size!4006 (_keys!5690 thiss!1248)) (size!4007 (_values!3746 thiss!1248))) (bvsge (mask!8845 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3500 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184321 () Bool)

(declare-fun e!121323 () Bool)

(declare-fun e!121324 () Bool)

(assert (=> b!184321 (= e!121323 (and e!121324 mapRes!7417))))

(declare-fun condMapEmpty!7417 () Bool)

(declare-fun mapDefault!7417 () ValueCell!1814)

(assert (=> b!184321 (= condMapEmpty!7417 (= (arr!3693 (_values!3746 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1814)) mapDefault!7417)))))

(declare-fun b!184322 () Bool)

(declare-fun tp_is_empty!4315 () Bool)

(assert (=> b!184322 (= e!121324 tp_is_empty!4315)))

(declare-fun b!184323 () Bool)

(declare-fun res!87208 () Bool)

(declare-fun e!121321 () Bool)

(assert (=> b!184323 (=> (not res!87208) (not e!121321))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!184323 (= res!87208 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184324 () Bool)

(assert (=> b!184324 (= e!121320 tp_is_empty!4315)))

(declare-fun b!184325 () Bool)

(assert (=> b!184325 (= e!121321 e!121325)))

(declare-fun res!87209 () Bool)

(assert (=> b!184325 (=> (not res!87209) (not e!121325))))

(declare-datatypes ((SeekEntryResult!615 0))(
  ( (MissingZero!615 (index!4630 (_ BitVec 32))) (Found!615 (index!4631 (_ BitVec 32))) (Intermediate!615 (undefined!1427 Bool) (index!4632 (_ BitVec 32)) (x!20039 (_ BitVec 32))) (Undefined!615) (MissingVacant!615 (index!4633 (_ BitVec 32))) )
))
(declare-fun lt!91186 () SeekEntryResult!615)

(get-info :version)

(assert (=> b!184325 (= res!87209 (and (not ((_ is Undefined!615) lt!91186)) (not ((_ is MissingVacant!615) lt!91186)) (not ((_ is MissingZero!615) lt!91186)) ((_ is Found!615) lt!91186)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7815 (_ BitVec 32)) SeekEntryResult!615)

(assert (=> b!184325 (= lt!91186 (seekEntryOrOpen!0 key!828 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)))))

(declare-fun res!87207 () Bool)

(assert (=> start!18618 (=> (not res!87207) (not e!121321))))

(declare-fun valid!1071 (LongMapFixedSize!2536) Bool)

(assert (=> start!18618 (= res!87207 (valid!1071 thiss!1248))))

(assert (=> start!18618 e!121321))

(declare-fun e!121322 () Bool)

(assert (=> start!18618 e!121322))

(assert (=> start!18618 true))

(declare-fun array_inv!2383 (array!7815) Bool)

(declare-fun array_inv!2384 (array!7817) Bool)

(assert (=> b!184320 (= e!121322 (and tp!16411 tp_is_empty!4315 (array_inv!2383 (_keys!5690 thiss!1248)) (array_inv!2384 (_values!3746 thiss!1248)) e!121323))))

(declare-fun b!184326 () Bool)

(declare-fun res!87210 () Bool)

(assert (=> b!184326 (=> (not res!87210) (not e!121325))))

(declare-datatypes ((tuple2!3374 0))(
  ( (tuple2!3375 (_1!1698 (_ BitVec 64)) (_2!1698 V!5401)) )
))
(declare-datatypes ((List!2310 0))(
  ( (Nil!2307) (Cons!2306 (h!2937 tuple2!3374) (t!7176 List!2310)) )
))
(declare-datatypes ((ListLongMap!2295 0))(
  ( (ListLongMap!2296 (toList!1163 List!2310)) )
))
(declare-fun contains!1265 (ListLongMap!2295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!815 (array!7815 array!7817 (_ BitVec 32) (_ BitVec 32) V!5401 V!5401 (_ BitVec 32) Int) ListLongMap!2295)

(assert (=> b!184326 (= res!87210 (not (contains!1265 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)) key!828)))))

(declare-fun b!184327 () Bool)

(declare-fun res!87211 () Bool)

(assert (=> b!184327 (=> (not res!87211) (not e!121325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184327 (= res!87211 (validMask!0 (mask!8845 thiss!1248)))))

(assert (= (and start!18618 res!87207) b!184323))

(assert (= (and b!184323 res!87208) b!184325))

(assert (= (and b!184325 res!87209) b!184326))

(assert (= (and b!184326 res!87210) b!184327))

(assert (= (and b!184327 res!87211) b!184319))

(assert (= (and b!184321 condMapEmpty!7417) mapIsEmpty!7417))

(assert (= (and b!184321 (not condMapEmpty!7417)) mapNonEmpty!7417))

(assert (= (and mapNonEmpty!7417 ((_ is ValueCellFull!1814) mapValue!7417)) b!184324))

(assert (= (and b!184321 ((_ is ValueCellFull!1814) mapDefault!7417)) b!184322))

(assert (= b!184320 b!184321))

(assert (= start!18618 b!184320))

(declare-fun m!211863 () Bool)

(assert (=> b!184325 m!211863))

(declare-fun m!211865 () Bool)

(assert (=> b!184326 m!211865))

(assert (=> b!184326 m!211865))

(declare-fun m!211867 () Bool)

(assert (=> b!184326 m!211867))

(declare-fun m!211869 () Bool)

(assert (=> b!184320 m!211869))

(declare-fun m!211871 () Bool)

(assert (=> b!184320 m!211871))

(declare-fun m!211873 () Bool)

(assert (=> mapNonEmpty!7417 m!211873))

(declare-fun m!211875 () Bool)

(assert (=> start!18618 m!211875))

(declare-fun m!211877 () Bool)

(assert (=> b!184327 m!211877))

(check-sat (not b_next!4543) (not mapNonEmpty!7417) b_and!11141 (not b!184326) (not b!184325) (not b!184327) (not start!18618) (not b!184320) tp_is_empty!4315)
(check-sat b_and!11141 (not b_next!4543))
(get-model)

(declare-fun d!54973 () Bool)

(assert (=> d!54973 (= (validMask!0 (mask!8845 thiss!1248)) (and (or (= (mask!8845 thiss!1248) #b00000000000000000000000000000111) (= (mask!8845 thiss!1248) #b00000000000000000000000000001111) (= (mask!8845 thiss!1248) #b00000000000000000000000000011111) (= (mask!8845 thiss!1248) #b00000000000000000000000000111111) (= (mask!8845 thiss!1248) #b00000000000000000000000001111111) (= (mask!8845 thiss!1248) #b00000000000000000000000011111111) (= (mask!8845 thiss!1248) #b00000000000000000000000111111111) (= (mask!8845 thiss!1248) #b00000000000000000000001111111111) (= (mask!8845 thiss!1248) #b00000000000000000000011111111111) (= (mask!8845 thiss!1248) #b00000000000000000000111111111111) (= (mask!8845 thiss!1248) #b00000000000000000001111111111111) (= (mask!8845 thiss!1248) #b00000000000000000011111111111111) (= (mask!8845 thiss!1248) #b00000000000000000111111111111111) (= (mask!8845 thiss!1248) #b00000000000000001111111111111111) (= (mask!8845 thiss!1248) #b00000000000000011111111111111111) (= (mask!8845 thiss!1248) #b00000000000000111111111111111111) (= (mask!8845 thiss!1248) #b00000000000001111111111111111111) (= (mask!8845 thiss!1248) #b00000000000011111111111111111111) (= (mask!8845 thiss!1248) #b00000000000111111111111111111111) (= (mask!8845 thiss!1248) #b00000000001111111111111111111111) (= (mask!8845 thiss!1248) #b00000000011111111111111111111111) (= (mask!8845 thiss!1248) #b00000000111111111111111111111111) (= (mask!8845 thiss!1248) #b00000001111111111111111111111111) (= (mask!8845 thiss!1248) #b00000011111111111111111111111111) (= (mask!8845 thiss!1248) #b00000111111111111111111111111111) (= (mask!8845 thiss!1248) #b00001111111111111111111111111111) (= (mask!8845 thiss!1248) #b00011111111111111111111111111111) (= (mask!8845 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8845 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184327 d!54973))

(declare-fun d!54975 () Bool)

(declare-fun e!121374 () Bool)

(assert (=> d!54975 e!121374))

(declare-fun res!87244 () Bool)

(assert (=> d!54975 (=> res!87244 e!121374)))

(declare-fun lt!91203 () Bool)

(assert (=> d!54975 (= res!87244 (not lt!91203))))

(declare-fun lt!91202 () Bool)

(assert (=> d!54975 (= lt!91203 lt!91202)))

(declare-datatypes ((Unit!5568 0))(
  ( (Unit!5569) )
))
(declare-fun lt!91204 () Unit!5568)

(declare-fun e!121373 () Unit!5568)

(assert (=> d!54975 (= lt!91204 e!121373)))

(declare-fun c!33063 () Bool)

(assert (=> d!54975 (= c!33063 lt!91202)))

(declare-fun containsKey!223 (List!2310 (_ BitVec 64)) Bool)

(assert (=> d!54975 (= lt!91202 (containsKey!223 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(assert (=> d!54975 (= (contains!1265 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)) key!828) lt!91203)))

(declare-fun b!184388 () Bool)

(declare-fun lt!91201 () Unit!5568)

(assert (=> b!184388 (= e!121373 lt!91201)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!171 (List!2310 (_ BitVec 64)) Unit!5568)

(assert (=> b!184388 (= lt!91201 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(declare-datatypes ((Option!226 0))(
  ( (Some!225 (v!4112 V!5401)) (None!224) )
))
(declare-fun isDefined!172 (Option!226) Bool)

(declare-fun getValueByKey!220 (List!2310 (_ BitVec 64)) Option!226)

(assert (=> b!184388 (isDefined!172 (getValueByKey!220 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(declare-fun b!184389 () Bool)

(declare-fun Unit!5570 () Unit!5568)

(assert (=> b!184389 (= e!121373 Unit!5570)))

(declare-fun b!184390 () Bool)

(assert (=> b!184390 (= e!121374 (isDefined!172 (getValueByKey!220 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828)))))

(assert (= (and d!54975 c!33063) b!184388))

(assert (= (and d!54975 (not c!33063)) b!184389))

(assert (= (and d!54975 (not res!87244)) b!184390))

(declare-fun m!211911 () Bool)

(assert (=> d!54975 m!211911))

(declare-fun m!211913 () Bool)

(assert (=> b!184388 m!211913))

(declare-fun m!211915 () Bool)

(assert (=> b!184388 m!211915))

(assert (=> b!184388 m!211915))

(declare-fun m!211917 () Bool)

(assert (=> b!184388 m!211917))

(assert (=> b!184390 m!211915))

(assert (=> b!184390 m!211915))

(assert (=> b!184390 m!211917))

(assert (=> b!184326 d!54975))

(declare-fun b!184433 () Bool)

(declare-fun e!121406 () Unit!5568)

(declare-fun lt!91257 () Unit!5568)

(assert (=> b!184433 (= e!121406 lt!91257)))

(declare-fun lt!91268 () ListLongMap!2295)

(declare-fun getCurrentListMapNoExtraKeys!193 (array!7815 array!7817 (_ BitVec 32) (_ BitVec 32) V!5401 V!5401 (_ BitVec 32) Int) ListLongMap!2295)

(assert (=> b!184433 (= lt!91268 (getCurrentListMapNoExtraKeys!193 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun lt!91261 () (_ BitVec 64))

(assert (=> b!184433 (= lt!91261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91267 () (_ BitVec 64))

(assert (=> b!184433 (= lt!91267 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91256 () Unit!5568)

(declare-fun addStillContains!138 (ListLongMap!2295 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5568)

(assert (=> b!184433 (= lt!91256 (addStillContains!138 lt!91268 lt!91261 (zeroValue!3604 thiss!1248) lt!91267))))

(declare-fun +!282 (ListLongMap!2295 tuple2!3374) ListLongMap!2295)

(assert (=> b!184433 (contains!1265 (+!282 lt!91268 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248))) lt!91267)))

(declare-fun lt!91266 () Unit!5568)

(assert (=> b!184433 (= lt!91266 lt!91256)))

(declare-fun lt!91252 () ListLongMap!2295)

(assert (=> b!184433 (= lt!91252 (getCurrentListMapNoExtraKeys!193 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun lt!91265 () (_ BitVec 64))

(assert (=> b!184433 (= lt!91265 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91253 () (_ BitVec 64))

(assert (=> b!184433 (= lt!91253 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91263 () Unit!5568)

(declare-fun addApplyDifferent!138 (ListLongMap!2295 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5568)

(assert (=> b!184433 (= lt!91263 (addApplyDifferent!138 lt!91252 lt!91265 (minValue!3604 thiss!1248) lt!91253))))

(declare-fun apply!162 (ListLongMap!2295 (_ BitVec 64)) V!5401)

(assert (=> b!184433 (= (apply!162 (+!282 lt!91252 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248))) lt!91253) (apply!162 lt!91252 lt!91253))))

(declare-fun lt!91262 () Unit!5568)

(assert (=> b!184433 (= lt!91262 lt!91263)))

(declare-fun lt!91254 () ListLongMap!2295)

(assert (=> b!184433 (= lt!91254 (getCurrentListMapNoExtraKeys!193 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun lt!91255 () (_ BitVec 64))

(assert (=> b!184433 (= lt!91255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91250 () (_ BitVec 64))

(assert (=> b!184433 (= lt!91250 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91260 () Unit!5568)

(assert (=> b!184433 (= lt!91260 (addApplyDifferent!138 lt!91254 lt!91255 (zeroValue!3604 thiss!1248) lt!91250))))

(assert (=> b!184433 (= (apply!162 (+!282 lt!91254 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248))) lt!91250) (apply!162 lt!91254 lt!91250))))

(declare-fun lt!91264 () Unit!5568)

(assert (=> b!184433 (= lt!91264 lt!91260)))

(declare-fun lt!91270 () ListLongMap!2295)

(assert (=> b!184433 (= lt!91270 (getCurrentListMapNoExtraKeys!193 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun lt!91258 () (_ BitVec 64))

(assert (=> b!184433 (= lt!91258 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91251 () (_ BitVec 64))

(assert (=> b!184433 (= lt!91251 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184433 (= lt!91257 (addApplyDifferent!138 lt!91270 lt!91258 (minValue!3604 thiss!1248) lt!91251))))

(assert (=> b!184433 (= (apply!162 (+!282 lt!91270 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248))) lt!91251) (apply!162 lt!91270 lt!91251))))

(declare-fun d!54977 () Bool)

(declare-fun e!121409 () Bool)

(assert (=> d!54977 e!121409))

(declare-fun res!87271 () Bool)

(assert (=> d!54977 (=> (not res!87271) (not e!121409))))

(assert (=> d!54977 (= res!87271 (or (bvsge #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))))

(declare-fun lt!91259 () ListLongMap!2295)

(declare-fun lt!91249 () ListLongMap!2295)

(assert (=> d!54977 (= lt!91259 lt!91249)))

(declare-fun lt!91269 () Unit!5568)

(assert (=> d!54977 (= lt!91269 e!121406)))

(declare-fun c!33078 () Bool)

(declare-fun e!121412 () Bool)

(assert (=> d!54977 (= c!33078 e!121412)))

(declare-fun res!87267 () Bool)

(assert (=> d!54977 (=> (not res!87267) (not e!121412))))

(assert (=> d!54977 (= res!87267 (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun e!121404 () ListLongMap!2295)

(assert (=> d!54977 (= lt!91249 e!121404)))

(declare-fun c!33081 () Bool)

(assert (=> d!54977 (= c!33081 (and (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54977 (validMask!0 (mask!8845 thiss!1248))))

(assert (=> d!54977 (= (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)) lt!91259)))

(declare-fun b!184434 () Bool)

(declare-fun e!121407 () ListLongMap!2295)

(declare-fun call!18602 () ListLongMap!2295)

(assert (=> b!184434 (= e!121407 call!18602)))

(declare-fun b!184435 () Bool)

(declare-fun e!121405 () Bool)

(assert (=> b!184435 (= e!121409 e!121405)))

(declare-fun c!33079 () Bool)

(assert (=> b!184435 (= c!33079 (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184436 () Bool)

(declare-fun Unit!5571 () Unit!5568)

(assert (=> b!184436 (= e!121406 Unit!5571)))

(declare-fun b!184437 () Bool)

(declare-fun e!121411 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184437 (= e!121411 (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184438 () Bool)

(declare-fun c!33077 () Bool)

(assert (=> b!184438 (= c!33077 (and (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!121408 () ListLongMap!2295)

(assert (=> b!184438 (= e!121408 e!121407)))

(declare-fun b!184439 () Bool)

(declare-fun e!121403 () Bool)

(assert (=> b!184439 (= e!121403 (= (apply!162 lt!91259 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3604 thiss!1248)))))

(declare-fun b!184440 () Bool)

(declare-fun call!18599 () ListLongMap!2295)

(assert (=> b!184440 (= e!121404 (+!282 call!18599 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))

(declare-fun b!184441 () Bool)

(declare-fun call!18598 () Bool)

(assert (=> b!184441 (= e!121405 (not call!18598))))

(declare-fun bm!18595 () Bool)

(assert (=> bm!18595 (= call!18598 (contains!1265 lt!91259 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18596 () Bool)

(declare-fun call!18603 () ListLongMap!2295)

(assert (=> bm!18596 (= call!18603 (getCurrentListMapNoExtraKeys!193 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))

(declare-fun b!184442 () Bool)

(assert (=> b!184442 (= e!121404 e!121408)))

(declare-fun c!33076 () Bool)

(assert (=> b!184442 (= c!33076 (and (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184443 () Bool)

(declare-fun e!121402 () Bool)

(assert (=> b!184443 (= e!121402 (= (apply!162 lt!91259 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3604 thiss!1248)))))

(declare-fun bm!18597 () Bool)

(declare-fun call!18601 () ListLongMap!2295)

(declare-fun call!18604 () ListLongMap!2295)

(assert (=> bm!18597 (= call!18601 call!18604)))

(declare-fun bm!18598 () Bool)

(assert (=> bm!18598 (= call!18599 (+!282 (ite c!33081 call!18603 (ite c!33076 call!18604 call!18601)) (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(declare-fun bm!18599 () Bool)

(assert (=> bm!18599 (= call!18602 call!18599)))

(declare-fun b!184444 () Bool)

(assert (=> b!184444 (= e!121408 call!18602)))

(declare-fun b!184445 () Bool)

(declare-fun res!87268 () Bool)

(assert (=> b!184445 (=> (not res!87268) (not e!121409))))

(declare-fun e!121410 () Bool)

(assert (=> b!184445 (= res!87268 e!121410)))

(declare-fun c!33080 () Bool)

(assert (=> b!184445 (= c!33080 (not (= (bvand (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18600 () Bool)

(declare-fun call!18600 () Bool)

(assert (=> bm!18600 (= call!18600 (contains!1265 lt!91259 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184446 () Bool)

(declare-fun e!121413 () Bool)

(declare-fun e!121401 () Bool)

(assert (=> b!184446 (= e!121413 e!121401)))

(declare-fun res!87266 () Bool)

(assert (=> b!184446 (=> (not res!87266) (not e!121401))))

(assert (=> b!184446 (= res!87266 (contains!1265 lt!91259 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184446 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun b!184447 () Bool)

(assert (=> b!184447 (= e!121405 e!121403)))

(declare-fun res!87265 () Bool)

(assert (=> b!184447 (= res!87265 call!18598)))

(assert (=> b!184447 (=> (not res!87265) (not e!121403))))

(declare-fun b!184448 () Bool)

(declare-fun res!87264 () Bool)

(assert (=> b!184448 (=> (not res!87264) (not e!121409))))

(assert (=> b!184448 (= res!87264 e!121413)))

(declare-fun res!87270 () Bool)

(assert (=> b!184448 (=> res!87270 e!121413)))

(assert (=> b!184448 (= res!87270 (not e!121411))))

(declare-fun res!87263 () Bool)

(assert (=> b!184448 (=> (not res!87263) (not e!121411))))

(assert (=> b!184448 (= res!87263 (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun b!184449 () Bool)

(declare-fun get!2129 (ValueCell!1814 V!5401) V!5401)

(declare-fun dynLambda!505 (Int (_ BitVec 64)) V!5401)

(assert (=> b!184449 (= e!121401 (= (apply!162 lt!91259 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)) (get!2129 (select (arr!3693 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4007 (_values!3746 thiss!1248))))))

(assert (=> b!184449 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun b!184450 () Bool)

(assert (=> b!184450 (= e!121410 (not call!18600))))

(declare-fun b!184451 () Bool)

(assert (=> b!184451 (= e!121407 call!18601)))

(declare-fun b!184452 () Bool)

(assert (=> b!184452 (= e!121412 (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184453 () Bool)

(assert (=> b!184453 (= e!121410 e!121402)))

(declare-fun res!87269 () Bool)

(assert (=> b!184453 (= res!87269 call!18600)))

(assert (=> b!184453 (=> (not res!87269) (not e!121402))))

(declare-fun bm!18601 () Bool)

(assert (=> bm!18601 (= call!18604 call!18603)))

(assert (= (and d!54977 c!33081) b!184440))

(assert (= (and d!54977 (not c!33081)) b!184442))

(assert (= (and b!184442 c!33076) b!184444))

(assert (= (and b!184442 (not c!33076)) b!184438))

(assert (= (and b!184438 c!33077) b!184434))

(assert (= (and b!184438 (not c!33077)) b!184451))

(assert (= (or b!184434 b!184451) bm!18597))

(assert (= (or b!184444 bm!18597) bm!18601))

(assert (= (or b!184444 b!184434) bm!18599))

(assert (= (or b!184440 bm!18601) bm!18596))

(assert (= (or b!184440 bm!18599) bm!18598))

(assert (= (and d!54977 res!87267) b!184452))

(assert (= (and d!54977 c!33078) b!184433))

(assert (= (and d!54977 (not c!33078)) b!184436))

(assert (= (and d!54977 res!87271) b!184448))

(assert (= (and b!184448 res!87263) b!184437))

(assert (= (and b!184448 (not res!87270)) b!184446))

(assert (= (and b!184446 res!87266) b!184449))

(assert (= (and b!184448 res!87264) b!184445))

(assert (= (and b!184445 c!33080) b!184453))

(assert (= (and b!184445 (not c!33080)) b!184450))

(assert (= (and b!184453 res!87269) b!184443))

(assert (= (or b!184453 b!184450) bm!18600))

(assert (= (and b!184445 res!87268) b!184435))

(assert (= (and b!184435 c!33079) b!184447))

(assert (= (and b!184435 (not c!33079)) b!184441))

(assert (= (and b!184447 res!87265) b!184439))

(assert (= (or b!184447 b!184441) bm!18595))

(declare-fun b_lambda!7241 () Bool)

(assert (=> (not b_lambda!7241) (not b!184449)))

(declare-fun t!7178 () Bool)

(declare-fun tb!2827 () Bool)

(assert (=> (and b!184320 (= (defaultEntry!3763 thiss!1248) (defaultEntry!3763 thiss!1248)) t!7178) tb!2827))

(declare-fun result!4775 () Bool)

(assert (=> tb!2827 (= result!4775 tp_is_empty!4315)))

(assert (=> b!184449 t!7178))

(declare-fun b_and!11147 () Bool)

(assert (= b_and!11141 (and (=> t!7178 result!4775) b_and!11147)))

(declare-fun m!211919 () Bool)

(assert (=> bm!18596 m!211919))

(declare-fun m!211921 () Bool)

(assert (=> b!184449 m!211921))

(declare-fun m!211923 () Bool)

(assert (=> b!184449 m!211923))

(assert (=> b!184449 m!211923))

(declare-fun m!211925 () Bool)

(assert (=> b!184449 m!211925))

(assert (=> b!184449 m!211921))

(declare-fun m!211927 () Bool)

(assert (=> b!184449 m!211927))

(declare-fun m!211929 () Bool)

(assert (=> b!184449 m!211929))

(assert (=> b!184449 m!211927))

(declare-fun m!211931 () Bool)

(assert (=> bm!18600 m!211931))

(assert (=> d!54977 m!211877))

(assert (=> b!184452 m!211923))

(assert (=> b!184452 m!211923))

(declare-fun m!211933 () Bool)

(assert (=> b!184452 m!211933))

(declare-fun m!211935 () Bool)

(assert (=> bm!18595 m!211935))

(assert (=> b!184446 m!211923))

(assert (=> b!184446 m!211923))

(declare-fun m!211937 () Bool)

(assert (=> b!184446 m!211937))

(declare-fun m!211939 () Bool)

(assert (=> b!184439 m!211939))

(declare-fun m!211941 () Bool)

(assert (=> bm!18598 m!211941))

(declare-fun m!211943 () Bool)

(assert (=> b!184433 m!211943))

(assert (=> b!184433 m!211923))

(declare-fun m!211945 () Bool)

(assert (=> b!184433 m!211945))

(declare-fun m!211947 () Bool)

(assert (=> b!184433 m!211947))

(declare-fun m!211949 () Bool)

(assert (=> b!184433 m!211949))

(declare-fun m!211951 () Bool)

(assert (=> b!184433 m!211951))

(declare-fun m!211953 () Bool)

(assert (=> b!184433 m!211953))

(declare-fun m!211955 () Bool)

(assert (=> b!184433 m!211955))

(assert (=> b!184433 m!211947))

(assert (=> b!184433 m!211919))

(declare-fun m!211957 () Bool)

(assert (=> b!184433 m!211957))

(declare-fun m!211959 () Bool)

(assert (=> b!184433 m!211959))

(declare-fun m!211961 () Bool)

(assert (=> b!184433 m!211961))

(declare-fun m!211963 () Bool)

(assert (=> b!184433 m!211963))

(declare-fun m!211965 () Bool)

(assert (=> b!184433 m!211965))

(assert (=> b!184433 m!211963))

(declare-fun m!211967 () Bool)

(assert (=> b!184433 m!211967))

(assert (=> b!184433 m!211953))

(assert (=> b!184433 m!211961))

(declare-fun m!211969 () Bool)

(assert (=> b!184433 m!211969))

(declare-fun m!211971 () Bool)

(assert (=> b!184433 m!211971))

(declare-fun m!211973 () Bool)

(assert (=> b!184440 m!211973))

(declare-fun m!211975 () Bool)

(assert (=> b!184443 m!211975))

(assert (=> b!184437 m!211923))

(assert (=> b!184437 m!211923))

(assert (=> b!184437 m!211933))

(assert (=> b!184326 d!54977))

(declare-fun d!54979 () Bool)

(assert (=> d!54979 (= (array_inv!2383 (_keys!5690 thiss!1248)) (bvsge (size!4006 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184320 d!54979))

(declare-fun d!54981 () Bool)

(assert (=> d!54981 (= (array_inv!2384 (_values!3746 thiss!1248)) (bvsge (size!4007 (_values!3746 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184320 d!54981))

(declare-fun b!184468 () Bool)

(declare-fun e!121422 () SeekEntryResult!615)

(assert (=> b!184468 (= e!121422 Undefined!615)))

(declare-fun b!184469 () Bool)

(declare-fun e!121420 () SeekEntryResult!615)

(declare-fun lt!91279 () SeekEntryResult!615)

(assert (=> b!184469 (= e!121420 (MissingZero!615 (index!4632 lt!91279)))))

(declare-fun b!184470 () Bool)

(declare-fun c!33089 () Bool)

(declare-fun lt!91278 () (_ BitVec 64))

(assert (=> b!184470 (= c!33089 (= lt!91278 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121421 () SeekEntryResult!615)

(assert (=> b!184470 (= e!121421 e!121420)))

(declare-fun b!184471 () Bool)

(assert (=> b!184471 (= e!121422 e!121421)))

(assert (=> b!184471 (= lt!91278 (select (arr!3692 (_keys!5690 thiss!1248)) (index!4632 lt!91279)))))

(declare-fun c!33090 () Bool)

(assert (=> b!184471 (= c!33090 (= lt!91278 key!828))))

(declare-fun b!184472 () Bool)

(assert (=> b!184472 (= e!121421 (Found!615 (index!4632 lt!91279)))))

(declare-fun d!54983 () Bool)

(declare-fun lt!91277 () SeekEntryResult!615)

(assert (=> d!54983 (and (or ((_ is Undefined!615) lt!91277) (not ((_ is Found!615) lt!91277)) (and (bvsge (index!4631 lt!91277) #b00000000000000000000000000000000) (bvslt (index!4631 lt!91277) (size!4006 (_keys!5690 thiss!1248))))) (or ((_ is Undefined!615) lt!91277) ((_ is Found!615) lt!91277) (not ((_ is MissingZero!615) lt!91277)) (and (bvsge (index!4630 lt!91277) #b00000000000000000000000000000000) (bvslt (index!4630 lt!91277) (size!4006 (_keys!5690 thiss!1248))))) (or ((_ is Undefined!615) lt!91277) ((_ is Found!615) lt!91277) ((_ is MissingZero!615) lt!91277) (not ((_ is MissingVacant!615) lt!91277)) (and (bvsge (index!4633 lt!91277) #b00000000000000000000000000000000) (bvslt (index!4633 lt!91277) (size!4006 (_keys!5690 thiss!1248))))) (or ((_ is Undefined!615) lt!91277) (ite ((_ is Found!615) lt!91277) (= (select (arr!3692 (_keys!5690 thiss!1248)) (index!4631 lt!91277)) key!828) (ite ((_ is MissingZero!615) lt!91277) (= (select (arr!3692 (_keys!5690 thiss!1248)) (index!4630 lt!91277)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!615) lt!91277) (= (select (arr!3692 (_keys!5690 thiss!1248)) (index!4633 lt!91277)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54983 (= lt!91277 e!121422)))

(declare-fun c!33088 () Bool)

(assert (=> d!54983 (= c!33088 (and ((_ is Intermediate!615) lt!91279) (undefined!1427 lt!91279)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7815 (_ BitVec 32)) SeekEntryResult!615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54983 (= lt!91279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8845 thiss!1248)) key!828 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)))))

(assert (=> d!54983 (validMask!0 (mask!8845 thiss!1248))))

(assert (=> d!54983 (= (seekEntryOrOpen!0 key!828 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)) lt!91277)))

(declare-fun b!184473 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7815 (_ BitVec 32)) SeekEntryResult!615)

(assert (=> b!184473 (= e!121420 (seekKeyOrZeroReturnVacant!0 (x!20039 lt!91279) (index!4632 lt!91279) (index!4632 lt!91279) key!828 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)))))

(assert (= (and d!54983 c!33088) b!184468))

(assert (= (and d!54983 (not c!33088)) b!184471))

(assert (= (and b!184471 c!33090) b!184472))

(assert (= (and b!184471 (not c!33090)) b!184470))

(assert (= (and b!184470 c!33089) b!184469))

(assert (= (and b!184470 (not c!33089)) b!184473))

(declare-fun m!211977 () Bool)

(assert (=> b!184471 m!211977))

(assert (=> d!54983 m!211877))

(declare-fun m!211979 () Bool)

(assert (=> d!54983 m!211979))

(declare-fun m!211981 () Bool)

(assert (=> d!54983 m!211981))

(declare-fun m!211983 () Bool)

(assert (=> d!54983 m!211983))

(assert (=> d!54983 m!211979))

(declare-fun m!211985 () Bool)

(assert (=> d!54983 m!211985))

(declare-fun m!211987 () Bool)

(assert (=> d!54983 m!211987))

(declare-fun m!211989 () Bool)

(assert (=> b!184473 m!211989))

(assert (=> b!184325 d!54983))

(declare-fun d!54985 () Bool)

(declare-fun res!87278 () Bool)

(declare-fun e!121425 () Bool)

(assert (=> d!54985 (=> (not res!87278) (not e!121425))))

(declare-fun simpleValid!178 (LongMapFixedSize!2536) Bool)

(assert (=> d!54985 (= res!87278 (simpleValid!178 thiss!1248))))

(assert (=> d!54985 (= (valid!1071 thiss!1248) e!121425)))

(declare-fun b!184480 () Bool)

(declare-fun res!87279 () Bool)

(assert (=> b!184480 (=> (not res!87279) (not e!121425))))

(declare-fun arrayCountValidKeys!0 (array!7815 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184480 (= res!87279 (= (arrayCountValidKeys!0 (_keys!5690 thiss!1248) #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))) (_size!1317 thiss!1248)))))

(declare-fun b!184481 () Bool)

(declare-fun res!87280 () Bool)

(assert (=> b!184481 (=> (not res!87280) (not e!121425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7815 (_ BitVec 32)) Bool)

(assert (=> b!184481 (= res!87280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)))))

(declare-fun b!184482 () Bool)

(declare-datatypes ((List!2311 0))(
  ( (Nil!2308) (Cons!2307 (h!2938 (_ BitVec 64)) (t!7179 List!2311)) )
))
(declare-fun arrayNoDuplicates!0 (array!7815 (_ BitVec 32) List!2311) Bool)

(assert (=> b!184482 (= e!121425 (arrayNoDuplicates!0 (_keys!5690 thiss!1248) #b00000000000000000000000000000000 Nil!2308))))

(assert (= (and d!54985 res!87278) b!184480))

(assert (= (and b!184480 res!87279) b!184481))

(assert (= (and b!184481 res!87280) b!184482))

(declare-fun m!211991 () Bool)

(assert (=> d!54985 m!211991))

(declare-fun m!211993 () Bool)

(assert (=> b!184480 m!211993))

(declare-fun m!211995 () Bool)

(assert (=> b!184481 m!211995))

(declare-fun m!211997 () Bool)

(assert (=> b!184482 m!211997))

(assert (=> start!18618 d!54985))

(declare-fun mapIsEmpty!7426 () Bool)

(declare-fun mapRes!7426 () Bool)

(assert (=> mapIsEmpty!7426 mapRes!7426))

(declare-fun mapNonEmpty!7426 () Bool)

(declare-fun tp!16426 () Bool)

(declare-fun e!121430 () Bool)

(assert (=> mapNonEmpty!7426 (= mapRes!7426 (and tp!16426 e!121430))))

(declare-fun mapRest!7426 () (Array (_ BitVec 32) ValueCell!1814))

(declare-fun mapValue!7426 () ValueCell!1814)

(declare-fun mapKey!7426 () (_ BitVec 32))

(assert (=> mapNonEmpty!7426 (= mapRest!7417 (store mapRest!7426 mapKey!7426 mapValue!7426))))

(declare-fun condMapEmpty!7426 () Bool)

(declare-fun mapDefault!7426 () ValueCell!1814)

(assert (=> mapNonEmpty!7417 (= condMapEmpty!7426 (= mapRest!7417 ((as const (Array (_ BitVec 32) ValueCell!1814)) mapDefault!7426)))))

(declare-fun e!121431 () Bool)

(assert (=> mapNonEmpty!7417 (= tp!16410 (and e!121431 mapRes!7426))))

(declare-fun b!184490 () Bool)

(assert (=> b!184490 (= e!121431 tp_is_empty!4315)))

(declare-fun b!184489 () Bool)

(assert (=> b!184489 (= e!121430 tp_is_empty!4315)))

(assert (= (and mapNonEmpty!7417 condMapEmpty!7426) mapIsEmpty!7426))

(assert (= (and mapNonEmpty!7417 (not condMapEmpty!7426)) mapNonEmpty!7426))

(assert (= (and mapNonEmpty!7426 ((_ is ValueCellFull!1814) mapValue!7426)) b!184489))

(assert (= (and mapNonEmpty!7417 ((_ is ValueCellFull!1814) mapDefault!7426)) b!184490))

(declare-fun m!211999 () Bool)

(assert (=> mapNonEmpty!7426 m!211999))

(declare-fun b_lambda!7243 () Bool)

(assert (= b_lambda!7241 (or (and b!184320 b_free!4543) b_lambda!7243)))

(check-sat (not b!184449) (not b!184446) (not b!184443) (not d!54975) (not bm!18598) (not bm!18596) (not b!184482) (not bm!18600) (not b!184481) tp_is_empty!4315 (not b_next!4543) (not b!184390) b_and!11147 (not b!184439) (not b!184440) (not d!54983) (not b!184433) (not b!184437) (not mapNonEmpty!7426) (not b!184388) (not bm!18595) (not b!184452) (not b!184480) (not d!54977) (not b_lambda!7243) (not b!184473) (not d!54985))
(check-sat b_and!11147 (not b_next!4543))
(get-model)

(declare-fun d!54987 () Bool)

(assert (=> d!54987 (= (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184452 d!54987))

(assert (=> b!184437 d!54987))

(declare-fun b!184503 () Bool)

(declare-fun e!121439 () SeekEntryResult!615)

(assert (=> b!184503 (= e!121439 (MissingVacant!615 (index!4632 lt!91279)))))

(declare-fun d!54989 () Bool)

(declare-fun lt!91284 () SeekEntryResult!615)

(assert (=> d!54989 (and (or ((_ is Undefined!615) lt!91284) (not ((_ is Found!615) lt!91284)) (and (bvsge (index!4631 lt!91284) #b00000000000000000000000000000000) (bvslt (index!4631 lt!91284) (size!4006 (_keys!5690 thiss!1248))))) (or ((_ is Undefined!615) lt!91284) ((_ is Found!615) lt!91284) (not ((_ is MissingVacant!615) lt!91284)) (not (= (index!4633 lt!91284) (index!4632 lt!91279))) (and (bvsge (index!4633 lt!91284) #b00000000000000000000000000000000) (bvslt (index!4633 lt!91284) (size!4006 (_keys!5690 thiss!1248))))) (or ((_ is Undefined!615) lt!91284) (ite ((_ is Found!615) lt!91284) (= (select (arr!3692 (_keys!5690 thiss!1248)) (index!4631 lt!91284)) key!828) (and ((_ is MissingVacant!615) lt!91284) (= (index!4633 lt!91284) (index!4632 lt!91279)) (= (select (arr!3692 (_keys!5690 thiss!1248)) (index!4633 lt!91284)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!121440 () SeekEntryResult!615)

(assert (=> d!54989 (= lt!91284 e!121440)))

(declare-fun c!33099 () Bool)

(assert (=> d!54989 (= c!33099 (bvsge (x!20039 lt!91279) #b01111111111111111111111111111110))))

(declare-fun lt!91285 () (_ BitVec 64))

(assert (=> d!54989 (= lt!91285 (select (arr!3692 (_keys!5690 thiss!1248)) (index!4632 lt!91279)))))

(assert (=> d!54989 (validMask!0 (mask!8845 thiss!1248))))

(assert (=> d!54989 (= (seekKeyOrZeroReturnVacant!0 (x!20039 lt!91279) (index!4632 lt!91279) (index!4632 lt!91279) key!828 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)) lt!91284)))

(declare-fun b!184504 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184504 (= e!121439 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20039 lt!91279) #b00000000000000000000000000000001) (nextIndex!0 (index!4632 lt!91279) (bvadd (x!20039 lt!91279) #b00000000000000000000000000000001) (mask!8845 thiss!1248)) (index!4632 lt!91279) key!828 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)))))

(declare-fun b!184505 () Bool)

(assert (=> b!184505 (= e!121440 Undefined!615)))

(declare-fun b!184506 () Bool)

(declare-fun e!121438 () SeekEntryResult!615)

(assert (=> b!184506 (= e!121440 e!121438)))

(declare-fun c!33098 () Bool)

(assert (=> b!184506 (= c!33098 (= lt!91285 key!828))))

(declare-fun b!184507 () Bool)

(declare-fun c!33097 () Bool)

(assert (=> b!184507 (= c!33097 (= lt!91285 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184507 (= e!121438 e!121439)))

(declare-fun b!184508 () Bool)

(assert (=> b!184508 (= e!121438 (Found!615 (index!4632 lt!91279)))))

(assert (= (and d!54989 c!33099) b!184505))

(assert (= (and d!54989 (not c!33099)) b!184506))

(assert (= (and b!184506 c!33098) b!184508))

(assert (= (and b!184506 (not c!33098)) b!184507))

(assert (= (and b!184507 c!33097) b!184503))

(assert (= (and b!184507 (not c!33097)) b!184504))

(declare-fun m!212001 () Bool)

(assert (=> d!54989 m!212001))

(declare-fun m!212003 () Bool)

(assert (=> d!54989 m!212003))

(assert (=> d!54989 m!211977))

(assert (=> d!54989 m!211877))

(declare-fun m!212005 () Bool)

(assert (=> b!184504 m!212005))

(assert (=> b!184504 m!212005))

(declare-fun m!212007 () Bool)

(assert (=> b!184504 m!212007))

(assert (=> b!184473 d!54989))

(declare-fun d!54991 () Bool)

(declare-fun get!2130 (Option!226) V!5401)

(assert (=> d!54991 (= (apply!162 lt!91259 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2130 (getValueByKey!220 (toList!1163 lt!91259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7504 () Bool)

(assert (= bs!7504 d!54991))

(declare-fun m!212009 () Bool)

(assert (=> bs!7504 m!212009))

(assert (=> bs!7504 m!212009))

(declare-fun m!212011 () Bool)

(assert (=> bs!7504 m!212011))

(assert (=> b!184439 d!54991))

(declare-fun d!54993 () Bool)

(assert (=> d!54993 (isDefined!172 (getValueByKey!220 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(declare-fun lt!91288 () Unit!5568)

(declare-fun choose!983 (List!2310 (_ BitVec 64)) Unit!5568)

(assert (=> d!54993 (= lt!91288 (choose!983 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(declare-fun e!121443 () Bool)

(assert (=> d!54993 e!121443))

(declare-fun res!87283 () Bool)

(assert (=> d!54993 (=> (not res!87283) (not e!121443))))

(declare-fun isStrictlySorted!334 (List!2310) Bool)

(assert (=> d!54993 (= res!87283 (isStrictlySorted!334 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))))

(assert (=> d!54993 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828) lt!91288)))

(declare-fun b!184511 () Bool)

(assert (=> b!184511 (= e!121443 (containsKey!223 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))

(assert (= (and d!54993 res!87283) b!184511))

(assert (=> d!54993 m!211915))

(assert (=> d!54993 m!211915))

(assert (=> d!54993 m!211917))

(declare-fun m!212013 () Bool)

(assert (=> d!54993 m!212013))

(declare-fun m!212015 () Bool)

(assert (=> d!54993 m!212015))

(assert (=> b!184511 m!211911))

(assert (=> b!184388 d!54993))

(declare-fun d!54995 () Bool)

(declare-fun isEmpty!473 (Option!226) Bool)

(assert (=> d!54995 (= (isDefined!172 (getValueByKey!220 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828)) (not (isEmpty!473 (getValueByKey!220 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828))))))

(declare-fun bs!7505 () Bool)

(assert (= bs!7505 d!54995))

(assert (=> bs!7505 m!211915))

(declare-fun m!212017 () Bool)

(assert (=> bs!7505 m!212017))

(assert (=> b!184388 d!54995))

(declare-fun b!184523 () Bool)

(declare-fun e!121449 () Option!226)

(assert (=> b!184523 (= e!121449 None!224)))

(declare-fun d!54997 () Bool)

(declare-fun c!33104 () Bool)

(assert (=> d!54997 (= c!33104 (and ((_ is Cons!2306) (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) (= (_1!1698 (h!2937 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828)))))

(declare-fun e!121448 () Option!226)

(assert (=> d!54997 (= (getValueByKey!220 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828) e!121448)))

(declare-fun b!184521 () Bool)

(assert (=> b!184521 (= e!121448 e!121449)))

(declare-fun c!33105 () Bool)

(assert (=> b!184521 (= c!33105 (and ((_ is Cons!2306) (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) (not (= (_1!1698 (h!2937 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828))))))

(declare-fun b!184522 () Bool)

(assert (=> b!184522 (= e!121449 (getValueByKey!220 (t!7176 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) key!828))))

(declare-fun b!184520 () Bool)

(assert (=> b!184520 (= e!121448 (Some!225 (_2!1698 (h!2937 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))))))))

(assert (= (and d!54997 c!33104) b!184520))

(assert (= (and d!54997 (not c!33104)) b!184521))

(assert (= (and b!184521 c!33105) b!184522))

(assert (= (and b!184521 (not c!33105)) b!184523))

(declare-fun m!212019 () Bool)

(assert (=> b!184522 m!212019))

(assert (=> b!184388 d!54997))

(declare-fun b!184532 () Bool)

(declare-fun e!121455 () (_ BitVec 32))

(declare-fun call!18607 () (_ BitVec 32))

(assert (=> b!184532 (= e!121455 call!18607)))

(declare-fun bm!18604 () Bool)

(assert (=> bm!18604 (= call!18607 (arrayCountValidKeys!0 (_keys!5690 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun b!184533 () Bool)

(declare-fun e!121454 () (_ BitVec 32))

(assert (=> b!184533 (= e!121454 e!121455)))

(declare-fun c!33110 () Bool)

(assert (=> b!184533 (= c!33110 (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54999 () Bool)

(declare-fun lt!91291 () (_ BitVec 32))

(assert (=> d!54999 (and (bvsge lt!91291 #b00000000000000000000000000000000) (bvsle lt!91291 (bvsub (size!4006 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54999 (= lt!91291 e!121454)))

(declare-fun c!33111 () Bool)

(assert (=> d!54999 (= c!33111 (bvsge #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(assert (=> d!54999 (and (bvsle #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4006 (_keys!5690 thiss!1248)) (size!4006 (_keys!5690 thiss!1248))))))

(assert (=> d!54999 (= (arrayCountValidKeys!0 (_keys!5690 thiss!1248) #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))) lt!91291)))

(declare-fun b!184534 () Bool)

(assert (=> b!184534 (= e!121454 #b00000000000000000000000000000000)))

(declare-fun b!184535 () Bool)

(assert (=> b!184535 (= e!121455 (bvadd #b00000000000000000000000000000001 call!18607))))

(assert (= (and d!54999 c!33111) b!184534))

(assert (= (and d!54999 (not c!33111)) b!184533))

(assert (= (and b!184533 c!33110) b!184535))

(assert (= (and b!184533 (not c!33110)) b!184532))

(assert (= (or b!184535 b!184532) bm!18604))

(declare-fun m!212021 () Bool)

(assert (=> bm!18604 m!212021))

(assert (=> b!184533 m!211923))

(assert (=> b!184533 m!211923))

(assert (=> b!184533 m!211933))

(assert (=> b!184480 d!54999))

(declare-fun d!55001 () Bool)

(assert (=> d!55001 (= (apply!162 lt!91259 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2130 (getValueByKey!220 (toList!1163 lt!91259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7506 () Bool)

(assert (= bs!7506 d!55001))

(declare-fun m!212023 () Bool)

(assert (=> bs!7506 m!212023))

(assert (=> bs!7506 m!212023))

(declare-fun m!212025 () Bool)

(assert (=> bs!7506 m!212025))

(assert (=> b!184443 d!55001))

(declare-fun d!55003 () Bool)

(declare-fun res!87288 () Bool)

(declare-fun e!121460 () Bool)

(assert (=> d!55003 (=> res!87288 e!121460)))

(assert (=> d!55003 (= res!87288 (and ((_ is Cons!2306) (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) (= (_1!1698 (h!2937 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828)))))

(assert (=> d!55003 (= (containsKey!223 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))) key!828) e!121460)))

(declare-fun b!184540 () Bool)

(declare-fun e!121461 () Bool)

(assert (=> b!184540 (= e!121460 e!121461)))

(declare-fun res!87289 () Bool)

(assert (=> b!184540 (=> (not res!87289) (not e!121461))))

(assert (=> b!184540 (= res!87289 (and (or (not ((_ is Cons!2306) (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) (bvsle (_1!1698 (h!2937 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828)) ((_ is Cons!2306) (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) (bvslt (_1!1698 (h!2937 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248))))) key!828)))))

(declare-fun b!184541 () Bool)

(assert (=> b!184541 (= e!121461 (containsKey!223 (t!7176 (toList!1163 (getCurrentListMap!815 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)))) key!828))))

(assert (= (and d!55003 (not res!87288)) b!184540))

(assert (= (and b!184540 res!87289) b!184541))

(declare-fun m!212027 () Bool)

(assert (=> b!184541 m!212027))

(assert (=> d!54975 d!55003))

(declare-fun b!184552 () Bool)

(declare-fun e!121471 () Bool)

(declare-fun e!121473 () Bool)

(assert (=> b!184552 (= e!121471 e!121473)))

(declare-fun c!33114 () Bool)

(assert (=> b!184552 (= c!33114 (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184553 () Bool)

(declare-fun e!121470 () Bool)

(assert (=> b!184553 (= e!121470 e!121471)))

(declare-fun res!87297 () Bool)

(assert (=> b!184553 (=> (not res!87297) (not e!121471))))

(declare-fun e!121472 () Bool)

(assert (=> b!184553 (= res!87297 (not e!121472))))

(declare-fun res!87298 () Bool)

(assert (=> b!184553 (=> (not res!87298) (not e!121472))))

(assert (=> b!184553 (= res!87298 (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18607 () Bool)

(declare-fun call!18610 () Bool)

(assert (=> bm!18607 (= call!18610 (arrayNoDuplicates!0 (_keys!5690 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33114 (Cons!2307 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000) Nil!2308) Nil!2308)))))

(declare-fun d!55005 () Bool)

(declare-fun res!87296 () Bool)

(assert (=> d!55005 (=> res!87296 e!121470)))

(assert (=> d!55005 (= res!87296 (bvsge #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(assert (=> d!55005 (= (arrayNoDuplicates!0 (_keys!5690 thiss!1248) #b00000000000000000000000000000000 Nil!2308) e!121470)))

(declare-fun b!184554 () Bool)

(assert (=> b!184554 (= e!121473 call!18610)))

(declare-fun b!184555 () Bool)

(assert (=> b!184555 (= e!121473 call!18610)))

(declare-fun b!184556 () Bool)

(declare-fun contains!1266 (List!2311 (_ BitVec 64)) Bool)

(assert (=> b!184556 (= e!121472 (contains!1266 Nil!2308 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55005 (not res!87296)) b!184553))

(assert (= (and b!184553 res!87298) b!184556))

(assert (= (and b!184553 res!87297) b!184552))

(assert (= (and b!184552 c!33114) b!184554))

(assert (= (and b!184552 (not c!33114)) b!184555))

(assert (= (or b!184554 b!184555) bm!18607))

(assert (=> b!184552 m!211923))

(assert (=> b!184552 m!211923))

(assert (=> b!184552 m!211933))

(assert (=> b!184553 m!211923))

(assert (=> b!184553 m!211923))

(assert (=> b!184553 m!211933))

(assert (=> bm!18607 m!211923))

(declare-fun m!212029 () Bool)

(assert (=> bm!18607 m!212029))

(assert (=> b!184556 m!211923))

(assert (=> b!184556 m!211923))

(declare-fun m!212031 () Bool)

(assert (=> b!184556 m!212031))

(assert (=> b!184482 d!55005))

(declare-fun d!55007 () Bool)

(declare-fun e!121476 () Bool)

(assert (=> d!55007 e!121476))

(declare-fun res!87304 () Bool)

(assert (=> d!55007 (=> (not res!87304) (not e!121476))))

(declare-fun lt!91303 () ListLongMap!2295)

(assert (=> d!55007 (= res!87304 (contains!1265 lt!91303 (_1!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(declare-fun lt!91302 () List!2310)

(assert (=> d!55007 (= lt!91303 (ListLongMap!2296 lt!91302))))

(declare-fun lt!91300 () Unit!5568)

(declare-fun lt!91301 () Unit!5568)

(assert (=> d!55007 (= lt!91300 lt!91301)))

(assert (=> d!55007 (= (getValueByKey!220 lt!91302 (_1!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))) (Some!225 (_2!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!116 (List!2310 (_ BitVec 64) V!5401) Unit!5568)

(assert (=> d!55007 (= lt!91301 (lemmaContainsTupThenGetReturnValue!116 lt!91302 (_1!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) (_2!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(declare-fun insertStrictlySorted!119 (List!2310 (_ BitVec 64) V!5401) List!2310)

(assert (=> d!55007 (= lt!91302 (insertStrictlySorted!119 (toList!1163 (ite c!33081 call!18603 (ite c!33076 call!18604 call!18601))) (_1!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) (_2!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(assert (=> d!55007 (= (+!282 (ite c!33081 call!18603 (ite c!33076 call!18604 call!18601)) (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) lt!91303)))

(declare-fun b!184561 () Bool)

(declare-fun res!87303 () Bool)

(assert (=> b!184561 (=> (not res!87303) (not e!121476))))

(assert (=> b!184561 (= res!87303 (= (getValueByKey!220 (toList!1163 lt!91303) (_1!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))) (Some!225 (_2!1698 (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))))

(declare-fun b!184562 () Bool)

(declare-fun contains!1267 (List!2310 tuple2!3374) Bool)

(assert (=> b!184562 (= e!121476 (contains!1267 (toList!1163 lt!91303) (ite (or c!33081 c!33076) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3604 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(assert (= (and d!55007 res!87304) b!184561))

(assert (= (and b!184561 res!87303) b!184562))

(declare-fun m!212033 () Bool)

(assert (=> d!55007 m!212033))

(declare-fun m!212035 () Bool)

(assert (=> d!55007 m!212035))

(declare-fun m!212037 () Bool)

(assert (=> d!55007 m!212037))

(declare-fun m!212039 () Bool)

(assert (=> d!55007 m!212039))

(declare-fun m!212041 () Bool)

(assert (=> b!184561 m!212041))

(declare-fun m!212043 () Bool)

(assert (=> b!184562 m!212043))

(assert (=> bm!18598 d!55007))

(declare-fun b!184571 () Bool)

(declare-fun e!121484 () Bool)

(declare-fun call!18613 () Bool)

(assert (=> b!184571 (= e!121484 call!18613)))

(declare-fun d!55009 () Bool)

(declare-fun res!87309 () Bool)

(declare-fun e!121483 () Bool)

(assert (=> d!55009 (=> res!87309 e!121483)))

(assert (=> d!55009 (= res!87309 (bvsge #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(assert (=> d!55009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)) e!121483)))

(declare-fun bm!18610 () Bool)

(assert (=> bm!18610 (= call!18613 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5690 thiss!1248) (mask!8845 thiss!1248)))))

(declare-fun b!184572 () Bool)

(assert (=> b!184572 (= e!121483 e!121484)))

(declare-fun c!33117 () Bool)

(assert (=> b!184572 (= c!33117 (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184573 () Bool)

(declare-fun e!121485 () Bool)

(assert (=> b!184573 (= e!121485 call!18613)))

(declare-fun b!184574 () Bool)

(assert (=> b!184574 (= e!121484 e!121485)))

(declare-fun lt!91311 () (_ BitVec 64))

(assert (=> b!184574 (= lt!91311 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91310 () Unit!5568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7815 (_ BitVec 64) (_ BitVec 32)) Unit!5568)

(assert (=> b!184574 (= lt!91310 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5690 thiss!1248) lt!91311 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!184574 (arrayContainsKey!0 (_keys!5690 thiss!1248) lt!91311 #b00000000000000000000000000000000)))

(declare-fun lt!91312 () Unit!5568)

(assert (=> b!184574 (= lt!91312 lt!91310)))

(declare-fun res!87310 () Bool)

(assert (=> b!184574 (= res!87310 (= (seekEntryOrOpen!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000) (_keys!5690 thiss!1248) (mask!8845 thiss!1248)) (Found!615 #b00000000000000000000000000000000)))))

(assert (=> b!184574 (=> (not res!87310) (not e!121485))))

(assert (= (and d!55009 (not res!87309)) b!184572))

(assert (= (and b!184572 c!33117) b!184574))

(assert (= (and b!184572 (not c!33117)) b!184571))

(assert (= (and b!184574 res!87310) b!184573))

(assert (= (or b!184573 b!184571) bm!18610))

(declare-fun m!212045 () Bool)

(assert (=> bm!18610 m!212045))

(assert (=> b!184572 m!211923))

(assert (=> b!184572 m!211923))

(assert (=> b!184572 m!211933))

(assert (=> b!184574 m!211923))

(declare-fun m!212047 () Bool)

(assert (=> b!184574 m!212047))

(declare-fun m!212049 () Bool)

(assert (=> b!184574 m!212049))

(assert (=> b!184574 m!211923))

(declare-fun m!212051 () Bool)

(assert (=> b!184574 m!212051))

(assert (=> b!184481 d!55009))

(declare-fun b!184599 () Bool)

(declare-fun e!121505 () Bool)

(assert (=> b!184599 (= e!121505 (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184599 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!184600 () Bool)

(declare-fun e!121504 () Bool)

(declare-fun e!121502 () Bool)

(assert (=> b!184600 (= e!121504 e!121502)))

(declare-fun c!33129 () Bool)

(assert (=> b!184600 (= c!33129 e!121505)))

(declare-fun res!87321 () Bool)

(assert (=> b!184600 (=> (not res!87321) (not e!121505))))

(assert (=> b!184600 (= res!87321 (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun b!184601 () Bool)

(declare-fun e!121503 () ListLongMap!2295)

(declare-fun e!121506 () ListLongMap!2295)

(assert (=> b!184601 (= e!121503 e!121506)))

(declare-fun c!33126 () Bool)

(assert (=> b!184601 (= c!33126 (validKeyInArray!0 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184602 () Bool)

(declare-fun e!121501 () Bool)

(assert (=> b!184602 (= e!121502 e!121501)))

(assert (=> b!184602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun res!87320 () Bool)

(declare-fun lt!91333 () ListLongMap!2295)

(assert (=> b!184602 (= res!87320 (contains!1265 lt!91333 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184602 (=> (not res!87320) (not e!121501))))

(declare-fun d!55011 () Bool)

(assert (=> d!55011 e!121504))

(declare-fun res!87322 () Bool)

(assert (=> d!55011 (=> (not res!87322) (not e!121504))))

(assert (=> d!55011 (= res!87322 (not (contains!1265 lt!91333 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55011 (= lt!91333 e!121503)))

(declare-fun c!33127 () Bool)

(assert (=> d!55011 (= c!33127 (bvsge #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(assert (=> d!55011 (validMask!0 (mask!8845 thiss!1248))))

(assert (=> d!55011 (= (getCurrentListMapNoExtraKeys!193 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3763 thiss!1248)) lt!91333)))

(declare-fun b!184603 () Bool)

(declare-fun res!87319 () Bool)

(assert (=> b!184603 (=> (not res!87319) (not e!121504))))

(assert (=> b!184603 (= res!87319 (not (contains!1265 lt!91333 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!18613 () Bool)

(declare-fun call!18616 () ListLongMap!2295)

(assert (=> bm!18613 (= call!18616 (getCurrentListMapNoExtraKeys!193 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3763 thiss!1248)))))

(declare-fun b!184604 () Bool)

(declare-fun e!121500 () Bool)

(declare-fun isEmpty!474 (ListLongMap!2295) Bool)

(assert (=> b!184604 (= e!121500 (isEmpty!474 lt!91333))))

(declare-fun b!184605 () Bool)

(assert (=> b!184605 (= e!121503 (ListLongMap!2296 Nil!2307))))

(declare-fun b!184606 () Bool)

(assert (=> b!184606 (= e!121506 call!18616)))

(declare-fun b!184607 () Bool)

(declare-fun lt!91327 () Unit!5568)

(declare-fun lt!91329 () Unit!5568)

(assert (=> b!184607 (= lt!91327 lt!91329)))

(declare-fun lt!91330 () V!5401)

(declare-fun lt!91331 () (_ BitVec 64))

(declare-fun lt!91332 () (_ BitVec 64))

(declare-fun lt!91328 () ListLongMap!2295)

(assert (=> b!184607 (not (contains!1265 (+!282 lt!91328 (tuple2!3375 lt!91332 lt!91330)) lt!91331))))

(declare-fun addStillNotContains!89 (ListLongMap!2295 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5568)

(assert (=> b!184607 (= lt!91329 (addStillNotContains!89 lt!91328 lt!91332 lt!91330 lt!91331))))

(assert (=> b!184607 (= lt!91331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!184607 (= lt!91330 (get!2129 (select (arr!3693 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184607 (= lt!91332 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184607 (= lt!91328 call!18616)))

(assert (=> b!184607 (= e!121506 (+!282 call!18616 (tuple2!3375 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000) (get!2129 (select (arr!3693 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!184608 () Bool)

(assert (=> b!184608 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(assert (=> b!184608 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4007 (_values!3746 thiss!1248))))))

(assert (=> b!184608 (= e!121501 (= (apply!162 lt!91333 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)) (get!2129 (select (arr!3693 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!184609 () Bool)

(assert (=> b!184609 (= e!121500 (= lt!91333 (getCurrentListMapNoExtraKeys!193 (_keys!5690 thiss!1248) (_values!3746 thiss!1248) (mask!8845 thiss!1248) (extraKeys!3500 thiss!1248) (zeroValue!3604 thiss!1248) (minValue!3604 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3763 thiss!1248))))))

(declare-fun b!184610 () Bool)

(assert (=> b!184610 (= e!121502 e!121500)))

(declare-fun c!33128 () Bool)

(assert (=> b!184610 (= c!33128 (bvslt #b00000000000000000000000000000000 (size!4006 (_keys!5690 thiss!1248))))))

(assert (= (and d!55011 c!33127) b!184605))

(assert (= (and d!55011 (not c!33127)) b!184601))

(assert (= (and b!184601 c!33126) b!184607))

(assert (= (and b!184601 (not c!33126)) b!184606))

(assert (= (or b!184607 b!184606) bm!18613))

(assert (= (and d!55011 res!87322) b!184603))

(assert (= (and b!184603 res!87319) b!184600))

(assert (= (and b!184600 res!87321) b!184599))

(assert (= (and b!184600 c!33129) b!184602))

(assert (= (and b!184600 (not c!33129)) b!184610))

(assert (= (and b!184602 res!87320) b!184608))

(assert (= (and b!184610 c!33128) b!184609))

(assert (= (and b!184610 (not c!33128)) b!184604))

(declare-fun b_lambda!7245 () Bool)

(assert (=> (not b_lambda!7245) (not b!184607)))

(assert (=> b!184607 t!7178))

(declare-fun b_and!11149 () Bool)

(assert (= b_and!11147 (and (=> t!7178 result!4775) b_and!11149)))

(declare-fun b_lambda!7247 () Bool)

(assert (=> (not b_lambda!7247) (not b!184608)))

(assert (=> b!184608 t!7178))

(declare-fun b_and!11151 () Bool)

(assert (= b_and!11149 (and (=> t!7178 result!4775) b_and!11151)))

(assert (=> b!184601 m!211923))

(assert (=> b!184601 m!211923))

(assert (=> b!184601 m!211933))

(declare-fun m!212053 () Bool)

(assert (=> b!184607 m!212053))

(assert (=> b!184607 m!211921))

(assert (=> b!184607 m!211923))

(declare-fun m!212055 () Bool)

(assert (=> b!184607 m!212055))

(declare-fun m!212057 () Bool)

(assert (=> b!184607 m!212057))

(assert (=> b!184607 m!211927))

(assert (=> b!184607 m!211921))

(assert (=> b!184607 m!211927))

(assert (=> b!184607 m!211929))

(assert (=> b!184607 m!212055))

(declare-fun m!212059 () Bool)

(assert (=> b!184607 m!212059))

(declare-fun m!212061 () Bool)

(assert (=> b!184609 m!212061))

(assert (=> bm!18613 m!212061))

(assert (=> b!184599 m!211923))

(assert (=> b!184599 m!211923))

(assert (=> b!184599 m!211933))

(declare-fun m!212063 () Bool)

(assert (=> d!55011 m!212063))

(assert (=> d!55011 m!211877))

(declare-fun m!212065 () Bool)

(assert (=> b!184604 m!212065))

(assert (=> b!184602 m!211923))

(assert (=> b!184602 m!211923))

(declare-fun m!212067 () Bool)

(assert (=> b!184602 m!212067))

(assert (=> b!184608 m!211923))

(declare-fun m!212069 () Bool)

(assert (=> b!184608 m!212069))

(assert (=> b!184608 m!211921))

(assert (=> b!184608 m!211923))

(assert (=> b!184608 m!211927))

(assert (=> b!184608 m!211921))

(assert (=> b!184608 m!211927))

(assert (=> b!184608 m!211929))

(declare-fun m!212071 () Bool)

(assert (=> b!184603 m!212071))

(assert (=> bm!18596 d!55011))

(declare-fun d!55013 () Bool)

(declare-fun e!121508 () Bool)

(assert (=> d!55013 e!121508))

(declare-fun res!87323 () Bool)

(assert (=> d!55013 (=> res!87323 e!121508)))

(declare-fun lt!91336 () Bool)

(assert (=> d!55013 (= res!87323 (not lt!91336))))

(declare-fun lt!91335 () Bool)

(assert (=> d!55013 (= lt!91336 lt!91335)))

(declare-fun lt!91337 () Unit!5568)

(declare-fun e!121507 () Unit!5568)

(assert (=> d!55013 (= lt!91337 e!121507)))

(declare-fun c!33130 () Bool)

(assert (=> d!55013 (= c!33130 lt!91335)))

(assert (=> d!55013 (= lt!91335 (containsKey!223 (toList!1163 lt!91259) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55013 (= (contains!1265 lt!91259 #b1000000000000000000000000000000000000000000000000000000000000000) lt!91336)))

(declare-fun b!184611 () Bool)

(declare-fun lt!91334 () Unit!5568)

(assert (=> b!184611 (= e!121507 lt!91334)))

(assert (=> b!184611 (= lt!91334 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1163 lt!91259) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184611 (isDefined!172 (getValueByKey!220 (toList!1163 lt!91259) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184612 () Bool)

(declare-fun Unit!5572 () Unit!5568)

(assert (=> b!184612 (= e!121507 Unit!5572)))

(declare-fun b!184613 () Bool)

(assert (=> b!184613 (= e!121508 (isDefined!172 (getValueByKey!220 (toList!1163 lt!91259) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55013 c!33130) b!184611))

(assert (= (and d!55013 (not c!33130)) b!184612))

(assert (= (and d!55013 (not res!87323)) b!184613))

(declare-fun m!212073 () Bool)

(assert (=> d!55013 m!212073))

(declare-fun m!212075 () Bool)

(assert (=> b!184611 m!212075))

(assert (=> b!184611 m!212009))

(assert (=> b!184611 m!212009))

(declare-fun m!212077 () Bool)

(assert (=> b!184611 m!212077))

(assert (=> b!184613 m!212009))

(assert (=> b!184613 m!212009))

(assert (=> b!184613 m!212077))

(assert (=> bm!18595 d!55013))

(declare-fun b!184625 () Bool)

(declare-fun e!121511 () Bool)

(assert (=> b!184625 (= e!121511 (and (bvsge (extraKeys!3500 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3500 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1317 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184623 () Bool)

(declare-fun res!87335 () Bool)

(assert (=> b!184623 (=> (not res!87335) (not e!121511))))

(declare-fun size!4012 (LongMapFixedSize!2536) (_ BitVec 32))

(assert (=> b!184623 (= res!87335 (bvsge (size!4012 thiss!1248) (_size!1317 thiss!1248)))))

(declare-fun b!184624 () Bool)

(declare-fun res!87332 () Bool)

(assert (=> b!184624 (=> (not res!87332) (not e!121511))))

(assert (=> b!184624 (= res!87332 (= (size!4012 thiss!1248) (bvadd (_size!1317 thiss!1248) (bvsdiv (bvadd (extraKeys!3500 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!55015 () Bool)

(declare-fun res!87334 () Bool)

(assert (=> d!55015 (=> (not res!87334) (not e!121511))))

(assert (=> d!55015 (= res!87334 (validMask!0 (mask!8845 thiss!1248)))))

(assert (=> d!55015 (= (simpleValid!178 thiss!1248) e!121511)))

(declare-fun b!184622 () Bool)

(declare-fun res!87333 () Bool)

(assert (=> b!184622 (=> (not res!87333) (not e!121511))))

(assert (=> b!184622 (= res!87333 (and (= (size!4007 (_values!3746 thiss!1248)) (bvadd (mask!8845 thiss!1248) #b00000000000000000000000000000001)) (= (size!4006 (_keys!5690 thiss!1248)) (size!4007 (_values!3746 thiss!1248))) (bvsge (_size!1317 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1317 thiss!1248) (bvadd (mask!8845 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!55015 res!87334) b!184622))

(assert (= (and b!184622 res!87333) b!184623))

(assert (= (and b!184623 res!87335) b!184624))

(assert (= (and b!184624 res!87332) b!184625))

(declare-fun m!212079 () Bool)

(assert (=> b!184623 m!212079))

(assert (=> b!184624 m!212079))

(assert (=> d!55015 m!211877))

(assert (=> d!54985 d!55015))

(declare-fun d!55017 () Bool)

(assert (=> d!55017 (= (apply!162 lt!91259 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)) (get!2130 (getValueByKey!220 (toList!1163 lt!91259) (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7507 () Bool)

(assert (= bs!7507 d!55017))

(assert (=> bs!7507 m!211923))

(declare-fun m!212081 () Bool)

(assert (=> bs!7507 m!212081))

(assert (=> bs!7507 m!212081))

(declare-fun m!212083 () Bool)

(assert (=> bs!7507 m!212083))

(assert (=> b!184449 d!55017))

(declare-fun d!55019 () Bool)

(declare-fun c!33133 () Bool)

(assert (=> d!55019 (= c!33133 ((_ is ValueCellFull!1814) (select (arr!3693 (_values!3746 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121514 () V!5401)

(assert (=> d!55019 (= (get!2129 (select (arr!3693 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!121514)))

(declare-fun b!184630 () Bool)

(declare-fun get!2131 (ValueCell!1814 V!5401) V!5401)

(assert (=> b!184630 (= e!121514 (get!2131 (select (arr!3693 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184631 () Bool)

(declare-fun get!2132 (ValueCell!1814 V!5401) V!5401)

(assert (=> b!184631 (= e!121514 (get!2132 (select (arr!3693 (_values!3746 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3763 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55019 c!33133) b!184630))

(assert (= (and d!55019 (not c!33133)) b!184631))

(assert (=> b!184630 m!211921))

(assert (=> b!184630 m!211927))

(declare-fun m!212085 () Bool)

(assert (=> b!184630 m!212085))

(assert (=> b!184631 m!211921))

(assert (=> b!184631 m!211927))

(declare-fun m!212087 () Bool)

(assert (=> b!184631 m!212087))

(assert (=> b!184449 d!55019))

(declare-fun d!55021 () Bool)

(assert (=> d!55021 (= (apply!162 lt!91252 lt!91253) (get!2130 (getValueByKey!220 (toList!1163 lt!91252) lt!91253)))))

(declare-fun bs!7508 () Bool)

(assert (= bs!7508 d!55021))

(declare-fun m!212089 () Bool)

(assert (=> bs!7508 m!212089))

(assert (=> bs!7508 m!212089))

(declare-fun m!212091 () Bool)

(assert (=> bs!7508 m!212091))

(assert (=> b!184433 d!55021))

(declare-fun d!55023 () Bool)

(assert (=> d!55023 (contains!1265 (+!282 lt!91268 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248))) lt!91267)))

(declare-fun lt!91340 () Unit!5568)

(declare-fun choose!984 (ListLongMap!2295 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5568)

(assert (=> d!55023 (= lt!91340 (choose!984 lt!91268 lt!91261 (zeroValue!3604 thiss!1248) lt!91267))))

(assert (=> d!55023 (contains!1265 lt!91268 lt!91267)))

(assert (=> d!55023 (= (addStillContains!138 lt!91268 lt!91261 (zeroValue!3604 thiss!1248) lt!91267) lt!91340)))

(declare-fun bs!7509 () Bool)

(assert (= bs!7509 d!55023))

(assert (=> bs!7509 m!211961))

(assert (=> bs!7509 m!211961))

(assert (=> bs!7509 m!211969))

(declare-fun m!212093 () Bool)

(assert (=> bs!7509 m!212093))

(declare-fun m!212095 () Bool)

(assert (=> bs!7509 m!212095))

(assert (=> b!184433 d!55023))

(declare-fun d!55025 () Bool)

(assert (=> d!55025 (= (apply!162 (+!282 lt!91270 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248))) lt!91251) (get!2130 (getValueByKey!220 (toList!1163 (+!282 lt!91270 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248)))) lt!91251)))))

(declare-fun bs!7510 () Bool)

(assert (= bs!7510 d!55025))

(declare-fun m!212097 () Bool)

(assert (=> bs!7510 m!212097))

(assert (=> bs!7510 m!212097))

(declare-fun m!212099 () Bool)

(assert (=> bs!7510 m!212099))

(assert (=> b!184433 d!55025))

(declare-fun d!55027 () Bool)

(assert (=> d!55027 (= (apply!162 (+!282 lt!91254 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248))) lt!91250) (get!2130 (getValueByKey!220 (toList!1163 (+!282 lt!91254 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248)))) lt!91250)))))

(declare-fun bs!7511 () Bool)

(assert (= bs!7511 d!55027))

(declare-fun m!212101 () Bool)

(assert (=> bs!7511 m!212101))

(assert (=> bs!7511 m!212101))

(declare-fun m!212103 () Bool)

(assert (=> bs!7511 m!212103))

(assert (=> b!184433 d!55027))

(declare-fun d!55029 () Bool)

(declare-fun e!121515 () Bool)

(assert (=> d!55029 e!121515))

(declare-fun res!87337 () Bool)

(assert (=> d!55029 (=> (not res!87337) (not e!121515))))

(declare-fun lt!91344 () ListLongMap!2295)

(assert (=> d!55029 (= res!87337 (contains!1265 lt!91344 (_1!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248)))))))

(declare-fun lt!91343 () List!2310)

(assert (=> d!55029 (= lt!91344 (ListLongMap!2296 lt!91343))))

(declare-fun lt!91341 () Unit!5568)

(declare-fun lt!91342 () Unit!5568)

(assert (=> d!55029 (= lt!91341 lt!91342)))

(assert (=> d!55029 (= (getValueByKey!220 lt!91343 (_1!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248)))))))

(assert (=> d!55029 (= lt!91342 (lemmaContainsTupThenGetReturnValue!116 lt!91343 (_1!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248)))))))

(assert (=> d!55029 (= lt!91343 (insertStrictlySorted!119 (toList!1163 lt!91252) (_1!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248)))))))

(assert (=> d!55029 (= (+!282 lt!91252 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248))) lt!91344)))

(declare-fun b!184633 () Bool)

(declare-fun res!87336 () Bool)

(assert (=> b!184633 (=> (not res!87336) (not e!121515))))

(assert (=> b!184633 (= res!87336 (= (getValueByKey!220 (toList!1163 lt!91344) (_1!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248))))))))

(declare-fun b!184634 () Bool)

(assert (=> b!184634 (= e!121515 (contains!1267 (toList!1163 lt!91344) (tuple2!3375 lt!91265 (minValue!3604 thiss!1248))))))

(assert (= (and d!55029 res!87337) b!184633))

(assert (= (and b!184633 res!87336) b!184634))

(declare-fun m!212105 () Bool)

(assert (=> d!55029 m!212105))

(declare-fun m!212107 () Bool)

(assert (=> d!55029 m!212107))

(declare-fun m!212109 () Bool)

(assert (=> d!55029 m!212109))

(declare-fun m!212111 () Bool)

(assert (=> d!55029 m!212111))

(declare-fun m!212113 () Bool)

(assert (=> b!184633 m!212113))

(declare-fun m!212115 () Bool)

(assert (=> b!184634 m!212115))

(assert (=> b!184433 d!55029))

(declare-fun d!55031 () Bool)

(declare-fun e!121517 () Bool)

(assert (=> d!55031 e!121517))

(declare-fun res!87338 () Bool)

(assert (=> d!55031 (=> res!87338 e!121517)))

(declare-fun lt!91347 () Bool)

(assert (=> d!55031 (= res!87338 (not lt!91347))))

(declare-fun lt!91346 () Bool)

(assert (=> d!55031 (= lt!91347 lt!91346)))

(declare-fun lt!91348 () Unit!5568)

(declare-fun e!121516 () Unit!5568)

(assert (=> d!55031 (= lt!91348 e!121516)))

(declare-fun c!33134 () Bool)

(assert (=> d!55031 (= c!33134 lt!91346)))

(assert (=> d!55031 (= lt!91346 (containsKey!223 (toList!1163 (+!282 lt!91268 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))) lt!91267))))

(assert (=> d!55031 (= (contains!1265 (+!282 lt!91268 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248))) lt!91267) lt!91347)))

(declare-fun b!184635 () Bool)

(declare-fun lt!91345 () Unit!5568)

(assert (=> b!184635 (= e!121516 lt!91345)))

(assert (=> b!184635 (= lt!91345 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1163 (+!282 lt!91268 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))) lt!91267))))

(assert (=> b!184635 (isDefined!172 (getValueByKey!220 (toList!1163 (+!282 lt!91268 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))) lt!91267))))

(declare-fun b!184636 () Bool)

(declare-fun Unit!5573 () Unit!5568)

(assert (=> b!184636 (= e!121516 Unit!5573)))

(declare-fun b!184637 () Bool)

(assert (=> b!184637 (= e!121517 (isDefined!172 (getValueByKey!220 (toList!1163 (+!282 lt!91268 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))) lt!91267)))))

(assert (= (and d!55031 c!33134) b!184635))

(assert (= (and d!55031 (not c!33134)) b!184636))

(assert (= (and d!55031 (not res!87338)) b!184637))

(declare-fun m!212117 () Bool)

(assert (=> d!55031 m!212117))

(declare-fun m!212119 () Bool)

(assert (=> b!184635 m!212119))

(declare-fun m!212121 () Bool)

(assert (=> b!184635 m!212121))

(assert (=> b!184635 m!212121))

(declare-fun m!212123 () Bool)

(assert (=> b!184635 m!212123))

(assert (=> b!184637 m!212121))

(assert (=> b!184637 m!212121))

(assert (=> b!184637 m!212123))

(assert (=> b!184433 d!55031))

(declare-fun d!55033 () Bool)

(assert (=> d!55033 (= (apply!162 (+!282 lt!91270 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248))) lt!91251) (apply!162 lt!91270 lt!91251))))

(declare-fun lt!91351 () Unit!5568)

(declare-fun choose!985 (ListLongMap!2295 (_ BitVec 64) V!5401 (_ BitVec 64)) Unit!5568)

(assert (=> d!55033 (= lt!91351 (choose!985 lt!91270 lt!91258 (minValue!3604 thiss!1248) lt!91251))))

(declare-fun e!121520 () Bool)

(assert (=> d!55033 e!121520))

(declare-fun res!87341 () Bool)

(assert (=> d!55033 (=> (not res!87341) (not e!121520))))

(assert (=> d!55033 (= res!87341 (contains!1265 lt!91270 lt!91251))))

(assert (=> d!55033 (= (addApplyDifferent!138 lt!91270 lt!91258 (minValue!3604 thiss!1248) lt!91251) lt!91351)))

(declare-fun b!184641 () Bool)

(assert (=> b!184641 (= e!121520 (not (= lt!91251 lt!91258)))))

(assert (= (and d!55033 res!87341) b!184641))

(assert (=> d!55033 m!211953))

(assert (=> d!55033 m!211951))

(declare-fun m!212125 () Bool)

(assert (=> d!55033 m!212125))

(declare-fun m!212127 () Bool)

(assert (=> d!55033 m!212127))

(assert (=> d!55033 m!211953))

(assert (=> d!55033 m!211955))

(assert (=> b!184433 d!55033))

(declare-fun d!55035 () Bool)

(assert (=> d!55035 (= (apply!162 (+!282 lt!91252 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248))) lt!91253) (apply!162 lt!91252 lt!91253))))

(declare-fun lt!91352 () Unit!5568)

(assert (=> d!55035 (= lt!91352 (choose!985 lt!91252 lt!91265 (minValue!3604 thiss!1248) lt!91253))))

(declare-fun e!121521 () Bool)

(assert (=> d!55035 e!121521))

(declare-fun res!87342 () Bool)

(assert (=> d!55035 (=> (not res!87342) (not e!121521))))

(assert (=> d!55035 (= res!87342 (contains!1265 lt!91252 lt!91253))))

(assert (=> d!55035 (= (addApplyDifferent!138 lt!91252 lt!91265 (minValue!3604 thiss!1248) lt!91253) lt!91352)))

(declare-fun b!184642 () Bool)

(assert (=> b!184642 (= e!121521 (not (= lt!91253 lt!91265)))))

(assert (= (and d!55035 res!87342) b!184642))

(assert (=> d!55035 m!211963))

(assert (=> d!55035 m!211957))

(declare-fun m!212129 () Bool)

(assert (=> d!55035 m!212129))

(declare-fun m!212131 () Bool)

(assert (=> d!55035 m!212131))

(assert (=> d!55035 m!211963))

(assert (=> d!55035 m!211967))

(assert (=> b!184433 d!55035))

(declare-fun d!55037 () Bool)

(assert (=> d!55037 (= (apply!162 (+!282 lt!91252 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248))) lt!91253) (get!2130 (getValueByKey!220 (toList!1163 (+!282 lt!91252 (tuple2!3375 lt!91265 (minValue!3604 thiss!1248)))) lt!91253)))))

(declare-fun bs!7512 () Bool)

(assert (= bs!7512 d!55037))

(declare-fun m!212133 () Bool)

(assert (=> bs!7512 m!212133))

(assert (=> bs!7512 m!212133))

(declare-fun m!212135 () Bool)

(assert (=> bs!7512 m!212135))

(assert (=> b!184433 d!55037))

(declare-fun d!55039 () Bool)

(assert (=> d!55039 (= (apply!162 lt!91254 lt!91250) (get!2130 (getValueByKey!220 (toList!1163 lt!91254) lt!91250)))))

(declare-fun bs!7513 () Bool)

(assert (= bs!7513 d!55039))

(declare-fun m!212137 () Bool)

(assert (=> bs!7513 m!212137))

(assert (=> bs!7513 m!212137))

(declare-fun m!212139 () Bool)

(assert (=> bs!7513 m!212139))

(assert (=> b!184433 d!55039))

(assert (=> b!184433 d!55011))

(declare-fun d!55041 () Bool)

(assert (=> d!55041 (= (apply!162 lt!91270 lt!91251) (get!2130 (getValueByKey!220 (toList!1163 lt!91270) lt!91251)))))

(declare-fun bs!7514 () Bool)

(assert (= bs!7514 d!55041))

(declare-fun m!212141 () Bool)

(assert (=> bs!7514 m!212141))

(assert (=> bs!7514 m!212141))

(declare-fun m!212143 () Bool)

(assert (=> bs!7514 m!212143))

(assert (=> b!184433 d!55041))

(declare-fun d!55043 () Bool)

(declare-fun e!121522 () Bool)

(assert (=> d!55043 e!121522))

(declare-fun res!87344 () Bool)

(assert (=> d!55043 (=> (not res!87344) (not e!121522))))

(declare-fun lt!91356 () ListLongMap!2295)

(assert (=> d!55043 (= res!87344 (contains!1265 lt!91356 (_1!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248)))))))

(declare-fun lt!91355 () List!2310)

(assert (=> d!55043 (= lt!91356 (ListLongMap!2296 lt!91355))))

(declare-fun lt!91353 () Unit!5568)

(declare-fun lt!91354 () Unit!5568)

(assert (=> d!55043 (= lt!91353 lt!91354)))

(assert (=> d!55043 (= (getValueByKey!220 lt!91355 (_1!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248)))))))

(assert (=> d!55043 (= lt!91354 (lemmaContainsTupThenGetReturnValue!116 lt!91355 (_1!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248)))))))

(assert (=> d!55043 (= lt!91355 (insertStrictlySorted!119 (toList!1163 lt!91270) (_1!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248)))))))

(assert (=> d!55043 (= (+!282 lt!91270 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248))) lt!91356)))

(declare-fun b!184643 () Bool)

(declare-fun res!87343 () Bool)

(assert (=> b!184643 (=> (not res!87343) (not e!121522))))

(assert (=> b!184643 (= res!87343 (= (getValueByKey!220 (toList!1163 lt!91356) (_1!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 lt!91258 (minValue!3604 thiss!1248))))))))

(declare-fun b!184644 () Bool)

(assert (=> b!184644 (= e!121522 (contains!1267 (toList!1163 lt!91356) (tuple2!3375 lt!91258 (minValue!3604 thiss!1248))))))

(assert (= (and d!55043 res!87344) b!184643))

(assert (= (and b!184643 res!87343) b!184644))

(declare-fun m!212145 () Bool)

(assert (=> d!55043 m!212145))

(declare-fun m!212147 () Bool)

(assert (=> d!55043 m!212147))

(declare-fun m!212149 () Bool)

(assert (=> d!55043 m!212149))

(declare-fun m!212151 () Bool)

(assert (=> d!55043 m!212151))

(declare-fun m!212153 () Bool)

(assert (=> b!184643 m!212153))

(declare-fun m!212155 () Bool)

(assert (=> b!184644 m!212155))

(assert (=> b!184433 d!55043))

(declare-fun d!55045 () Bool)

(declare-fun e!121523 () Bool)

(assert (=> d!55045 e!121523))

(declare-fun res!87346 () Bool)

(assert (=> d!55045 (=> (not res!87346) (not e!121523))))

(declare-fun lt!91360 () ListLongMap!2295)

(assert (=> d!55045 (= res!87346 (contains!1265 lt!91360 (_1!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248)))))))

(declare-fun lt!91359 () List!2310)

(assert (=> d!55045 (= lt!91360 (ListLongMap!2296 lt!91359))))

(declare-fun lt!91357 () Unit!5568)

(declare-fun lt!91358 () Unit!5568)

(assert (=> d!55045 (= lt!91357 lt!91358)))

(assert (=> d!55045 (= (getValueByKey!220 lt!91359 (_1!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!55045 (= lt!91358 (lemmaContainsTupThenGetReturnValue!116 lt!91359 (_1!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!55045 (= lt!91359 (insertStrictlySorted!119 (toList!1163 lt!91254) (_1!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!55045 (= (+!282 lt!91254 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248))) lt!91360)))

(declare-fun b!184645 () Bool)

(declare-fun res!87345 () Bool)

(assert (=> b!184645 (=> (not res!87345) (not e!121523))))

(assert (=> b!184645 (= res!87345 (= (getValueByKey!220 (toList!1163 lt!91360) (_1!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248))))))))

(declare-fun b!184646 () Bool)

(assert (=> b!184646 (= e!121523 (contains!1267 (toList!1163 lt!91360) (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248))))))

(assert (= (and d!55045 res!87346) b!184645))

(assert (= (and b!184645 res!87345) b!184646))

(declare-fun m!212157 () Bool)

(assert (=> d!55045 m!212157))

(declare-fun m!212159 () Bool)

(assert (=> d!55045 m!212159))

(declare-fun m!212161 () Bool)

(assert (=> d!55045 m!212161))

(declare-fun m!212163 () Bool)

(assert (=> d!55045 m!212163))

(declare-fun m!212165 () Bool)

(assert (=> b!184645 m!212165))

(declare-fun m!212167 () Bool)

(assert (=> b!184646 m!212167))

(assert (=> b!184433 d!55045))

(declare-fun d!55047 () Bool)

(assert (=> d!55047 (= (apply!162 (+!282 lt!91254 (tuple2!3375 lt!91255 (zeroValue!3604 thiss!1248))) lt!91250) (apply!162 lt!91254 lt!91250))))

(declare-fun lt!91361 () Unit!5568)

(assert (=> d!55047 (= lt!91361 (choose!985 lt!91254 lt!91255 (zeroValue!3604 thiss!1248) lt!91250))))

(declare-fun e!121524 () Bool)

(assert (=> d!55047 e!121524))

(declare-fun res!87347 () Bool)

(assert (=> d!55047 (=> (not res!87347) (not e!121524))))

(assert (=> d!55047 (= res!87347 (contains!1265 lt!91254 lt!91250))))

(assert (=> d!55047 (= (addApplyDifferent!138 lt!91254 lt!91255 (zeroValue!3604 thiss!1248) lt!91250) lt!91361)))

(declare-fun b!184647 () Bool)

(assert (=> b!184647 (= e!121524 (not (= lt!91250 lt!91255)))))

(assert (= (and d!55047 res!87347) b!184647))

(assert (=> d!55047 m!211947))

(assert (=> d!55047 m!211945))

(declare-fun m!212169 () Bool)

(assert (=> d!55047 m!212169))

(declare-fun m!212171 () Bool)

(assert (=> d!55047 m!212171))

(assert (=> d!55047 m!211947))

(assert (=> d!55047 m!211949))

(assert (=> b!184433 d!55047))

(declare-fun d!55049 () Bool)

(declare-fun e!121525 () Bool)

(assert (=> d!55049 e!121525))

(declare-fun res!87349 () Bool)

(assert (=> d!55049 (=> (not res!87349) (not e!121525))))

(declare-fun lt!91365 () ListLongMap!2295)

(assert (=> d!55049 (= res!87349 (contains!1265 lt!91365 (_1!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))))))

(declare-fun lt!91364 () List!2310)

(assert (=> d!55049 (= lt!91365 (ListLongMap!2296 lt!91364))))

(declare-fun lt!91362 () Unit!5568)

(declare-fun lt!91363 () Unit!5568)

(assert (=> d!55049 (= lt!91362 lt!91363)))

(assert (=> d!55049 (= (getValueByKey!220 lt!91364 (_1!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!55049 (= lt!91363 (lemmaContainsTupThenGetReturnValue!116 lt!91364 (_1!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!55049 (= lt!91364 (insertStrictlySorted!119 (toList!1163 lt!91268) (_1!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))))))

(assert (=> d!55049 (= (+!282 lt!91268 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248))) lt!91365)))

(declare-fun b!184648 () Bool)

(declare-fun res!87348 () Bool)

(assert (=> b!184648 (=> (not res!87348) (not e!121525))))

(assert (=> b!184648 (= res!87348 (= (getValueByKey!220 (toList!1163 lt!91365) (_1!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248))))))))

(declare-fun b!184649 () Bool)

(assert (=> b!184649 (= e!121525 (contains!1267 (toList!1163 lt!91365) (tuple2!3375 lt!91261 (zeroValue!3604 thiss!1248))))))

(assert (= (and d!55049 res!87349) b!184648))

(assert (= (and b!184648 res!87348) b!184649))

(declare-fun m!212173 () Bool)

(assert (=> d!55049 m!212173))

(declare-fun m!212175 () Bool)

(assert (=> d!55049 m!212175))

(declare-fun m!212177 () Bool)

(assert (=> d!55049 m!212177))

(declare-fun m!212179 () Bool)

(assert (=> d!55049 m!212179))

(declare-fun m!212181 () Bool)

(assert (=> b!184648 m!212181))

(declare-fun m!212183 () Bool)

(assert (=> b!184649 m!212183))

(assert (=> b!184433 d!55049))

(declare-fun d!55051 () Bool)

(declare-fun e!121526 () Bool)

(assert (=> d!55051 e!121526))

(declare-fun res!87351 () Bool)

(assert (=> d!55051 (=> (not res!87351) (not e!121526))))

(declare-fun lt!91369 () ListLongMap!2295)

(assert (=> d!55051 (= res!87351 (contains!1265 lt!91369 (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(declare-fun lt!91368 () List!2310)

(assert (=> d!55051 (= lt!91369 (ListLongMap!2296 lt!91368))))

(declare-fun lt!91366 () Unit!5568)

(declare-fun lt!91367 () Unit!5568)

(assert (=> d!55051 (= lt!91366 lt!91367)))

(assert (=> d!55051 (= (getValueByKey!220 lt!91368 (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(assert (=> d!55051 (= lt!91367 (lemmaContainsTupThenGetReturnValue!116 lt!91368 (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(assert (=> d!55051 (= lt!91368 (insertStrictlySorted!119 (toList!1163 call!18599) (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))) (_2!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))))))

(assert (=> d!55051 (= (+!282 call!18599 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))) lt!91369)))

(declare-fun b!184650 () Bool)

(declare-fun res!87350 () Bool)

(assert (=> b!184650 (=> (not res!87350) (not e!121526))))

(assert (=> b!184650 (= res!87350 (= (getValueByKey!220 (toList!1163 lt!91369) (_1!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248)))) (Some!225 (_2!1698 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))))

(declare-fun b!184651 () Bool)

(assert (=> b!184651 (= e!121526 (contains!1267 (toList!1163 lt!91369) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3604 thiss!1248))))))

(assert (= (and d!55051 res!87351) b!184650))

(assert (= (and b!184650 res!87350) b!184651))

(declare-fun m!212185 () Bool)

(assert (=> d!55051 m!212185))

(declare-fun m!212187 () Bool)

(assert (=> d!55051 m!212187))

(declare-fun m!212189 () Bool)

(assert (=> d!55051 m!212189))

(declare-fun m!212191 () Bool)

(assert (=> d!55051 m!212191))

(declare-fun m!212193 () Bool)

(assert (=> b!184650 m!212193))

(declare-fun m!212195 () Bool)

(assert (=> b!184651 m!212195))

(assert (=> b!184440 d!55051))

(declare-fun d!55053 () Bool)

(declare-fun e!121528 () Bool)

(assert (=> d!55053 e!121528))

(declare-fun res!87352 () Bool)

(assert (=> d!55053 (=> res!87352 e!121528)))

(declare-fun lt!91372 () Bool)

(assert (=> d!55053 (= res!87352 (not lt!91372))))

(declare-fun lt!91371 () Bool)

(assert (=> d!55053 (= lt!91372 lt!91371)))

(declare-fun lt!91373 () Unit!5568)

(declare-fun e!121527 () Unit!5568)

(assert (=> d!55053 (= lt!91373 e!121527)))

(declare-fun c!33135 () Bool)

(assert (=> d!55053 (= c!33135 lt!91371)))

(assert (=> d!55053 (= lt!91371 (containsKey!223 (toList!1163 lt!91259) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55053 (= (contains!1265 lt!91259 #b0000000000000000000000000000000000000000000000000000000000000000) lt!91372)))

(declare-fun b!184652 () Bool)

(declare-fun lt!91370 () Unit!5568)

(assert (=> b!184652 (= e!121527 lt!91370)))

(assert (=> b!184652 (= lt!91370 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1163 lt!91259) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184652 (isDefined!172 (getValueByKey!220 (toList!1163 lt!91259) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184653 () Bool)

(declare-fun Unit!5574 () Unit!5568)

(assert (=> b!184653 (= e!121527 Unit!5574)))

(declare-fun b!184654 () Bool)

(assert (=> b!184654 (= e!121528 (isDefined!172 (getValueByKey!220 (toList!1163 lt!91259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55053 c!33135) b!184652))

(assert (= (and d!55053 (not c!33135)) b!184653))

(assert (= (and d!55053 (not res!87352)) b!184654))

(declare-fun m!212197 () Bool)

(assert (=> d!55053 m!212197))

(declare-fun m!212199 () Bool)

(assert (=> b!184652 m!212199))

(assert (=> b!184652 m!212023))

(assert (=> b!184652 m!212023))

(declare-fun m!212201 () Bool)

(assert (=> b!184652 m!212201))

(assert (=> b!184654 m!212023))

(assert (=> b!184654 m!212023))

(assert (=> b!184654 m!212201))

(assert (=> bm!18600 d!55053))

(assert (=> d!54977 d!54973))

(declare-fun b!184674 () Bool)

(declare-fun lt!91379 () SeekEntryResult!615)

(assert (=> b!184674 (and (bvsge (index!4632 lt!91379) #b00000000000000000000000000000000) (bvslt (index!4632 lt!91379) (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun res!87361 () Bool)

(assert (=> b!184674 (= res!87361 (= (select (arr!3692 (_keys!5690 thiss!1248)) (index!4632 lt!91379)) key!828))))

(declare-fun e!121540 () Bool)

(assert (=> b!184674 (=> res!87361 e!121540)))

(declare-fun e!121539 () Bool)

(assert (=> b!184674 (= e!121539 e!121540)))

(declare-fun b!184675 () Bool)

(assert (=> b!184675 (and (bvsge (index!4632 lt!91379) #b00000000000000000000000000000000) (bvslt (index!4632 lt!91379) (size!4006 (_keys!5690 thiss!1248))))))

(assert (=> b!184675 (= e!121540 (= (select (arr!3692 (_keys!5690 thiss!1248)) (index!4632 lt!91379)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184676 () Bool)

(declare-fun e!121542 () Bool)

(assert (=> b!184676 (= e!121542 (bvsge (x!20039 lt!91379) #b01111111111111111111111111111110))))

(declare-fun b!184677 () Bool)

(declare-fun e!121541 () SeekEntryResult!615)

(declare-fun e!121543 () SeekEntryResult!615)

(assert (=> b!184677 (= e!121541 e!121543)))

(declare-fun c!33142 () Bool)

(declare-fun lt!91378 () (_ BitVec 64))

(assert (=> b!184677 (= c!33142 (or (= lt!91378 key!828) (= (bvadd lt!91378 lt!91378) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184678 () Bool)

(assert (=> b!184678 (= e!121543 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8845 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8845 thiss!1248)) key!828 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)))))

(declare-fun b!184679 () Bool)

(assert (=> b!184679 (and (bvsge (index!4632 lt!91379) #b00000000000000000000000000000000) (bvslt (index!4632 lt!91379) (size!4006 (_keys!5690 thiss!1248))))))

(declare-fun res!87359 () Bool)

(assert (=> b!184679 (= res!87359 (= (select (arr!3692 (_keys!5690 thiss!1248)) (index!4632 lt!91379)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184679 (=> res!87359 e!121540)))

(declare-fun b!184673 () Bool)

(assert (=> b!184673 (= e!121543 (Intermediate!615 false (toIndex!0 key!828 (mask!8845 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!55055 () Bool)

(assert (=> d!55055 e!121542))

(declare-fun c!33144 () Bool)

(assert (=> d!55055 (= c!33144 (and ((_ is Intermediate!615) lt!91379) (undefined!1427 lt!91379)))))

(assert (=> d!55055 (= lt!91379 e!121541)))

(declare-fun c!33143 () Bool)

(assert (=> d!55055 (= c!33143 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!55055 (= lt!91378 (select (arr!3692 (_keys!5690 thiss!1248)) (toIndex!0 key!828 (mask!8845 thiss!1248))))))

(assert (=> d!55055 (validMask!0 (mask!8845 thiss!1248))))

(assert (=> d!55055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8845 thiss!1248)) key!828 (_keys!5690 thiss!1248) (mask!8845 thiss!1248)) lt!91379)))

(declare-fun b!184680 () Bool)

(assert (=> b!184680 (= e!121541 (Intermediate!615 true (toIndex!0 key!828 (mask!8845 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184681 () Bool)

(assert (=> b!184681 (= e!121542 e!121539)))

(declare-fun res!87360 () Bool)

(assert (=> b!184681 (= res!87360 (and ((_ is Intermediate!615) lt!91379) (not (undefined!1427 lt!91379)) (bvslt (x!20039 lt!91379) #b01111111111111111111111111111110) (bvsge (x!20039 lt!91379) #b00000000000000000000000000000000) (bvsge (x!20039 lt!91379) #b00000000000000000000000000000000)))))

(assert (=> b!184681 (=> (not res!87360) (not e!121539))))

(assert (= (and d!55055 c!33143) b!184680))

(assert (= (and d!55055 (not c!33143)) b!184677))

(assert (= (and b!184677 c!33142) b!184673))

(assert (= (and b!184677 (not c!33142)) b!184678))

(assert (= (and d!55055 c!33144) b!184676))

(assert (= (and d!55055 (not c!33144)) b!184681))

(assert (= (and b!184681 res!87360) b!184674))

(assert (= (and b!184674 (not res!87361)) b!184679))

(assert (= (and b!184679 (not res!87359)) b!184675))

(declare-fun m!212203 () Bool)

(assert (=> b!184674 m!212203))

(assert (=> b!184675 m!212203))

(assert (=> d!55055 m!211979))

(declare-fun m!212205 () Bool)

(assert (=> d!55055 m!212205))

(assert (=> d!55055 m!211877))

(assert (=> b!184678 m!211979))

(declare-fun m!212207 () Bool)

(assert (=> b!184678 m!212207))

(assert (=> b!184678 m!212207))

(declare-fun m!212209 () Bool)

(assert (=> b!184678 m!212209))

(assert (=> b!184679 m!212203))

(assert (=> d!54983 d!55055))

(declare-fun d!55057 () Bool)

(declare-fun lt!91385 () (_ BitVec 32))

(declare-fun lt!91384 () (_ BitVec 32))

(assert (=> d!55057 (= lt!91385 (bvmul (bvxor lt!91384 (bvlshr lt!91384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55057 (= lt!91384 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55057 (and (bvsge (mask!8845 thiss!1248) #b00000000000000000000000000000000) (let ((res!87362 (let ((h!2939 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20057 (bvmul (bvxor h!2939 (bvlshr h!2939 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20057 (bvlshr x!20057 #b00000000000000000000000000001101)) (mask!8845 thiss!1248)))))) (and (bvslt res!87362 (bvadd (mask!8845 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!87362 #b00000000000000000000000000000000))))))

(assert (=> d!55057 (= (toIndex!0 key!828 (mask!8845 thiss!1248)) (bvand (bvxor lt!91385 (bvlshr lt!91385 #b00000000000000000000000000001101)) (mask!8845 thiss!1248)))))

(assert (=> d!54983 d!55057))

(assert (=> d!54983 d!54973))

(declare-fun d!55059 () Bool)

(declare-fun e!121545 () Bool)

(assert (=> d!55059 e!121545))

(declare-fun res!87363 () Bool)

(assert (=> d!55059 (=> res!87363 e!121545)))

(declare-fun lt!91388 () Bool)

(assert (=> d!55059 (= res!87363 (not lt!91388))))

(declare-fun lt!91387 () Bool)

(assert (=> d!55059 (= lt!91388 lt!91387)))

(declare-fun lt!91389 () Unit!5568)

(declare-fun e!121544 () Unit!5568)

(assert (=> d!55059 (= lt!91389 e!121544)))

(declare-fun c!33145 () Bool)

(assert (=> d!55059 (= c!33145 lt!91387)))

(assert (=> d!55059 (= lt!91387 (containsKey!223 (toList!1163 lt!91259) (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55059 (= (contains!1265 lt!91259 (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)) lt!91388)))

(declare-fun b!184682 () Bool)

(declare-fun lt!91386 () Unit!5568)

(assert (=> b!184682 (= e!121544 lt!91386)))

(assert (=> b!184682 (= lt!91386 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1163 lt!91259) (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184682 (isDefined!172 (getValueByKey!220 (toList!1163 lt!91259) (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184683 () Bool)

(declare-fun Unit!5575 () Unit!5568)

(assert (=> b!184683 (= e!121544 Unit!5575)))

(declare-fun b!184684 () Bool)

(assert (=> b!184684 (= e!121545 (isDefined!172 (getValueByKey!220 (toList!1163 lt!91259) (select (arr!3692 (_keys!5690 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55059 c!33145) b!184682))

(assert (= (and d!55059 (not c!33145)) b!184683))

(assert (= (and d!55059 (not res!87363)) b!184684))

(assert (=> d!55059 m!211923))

(declare-fun m!212211 () Bool)

(assert (=> d!55059 m!212211))

(assert (=> b!184682 m!211923))

(declare-fun m!212213 () Bool)

(assert (=> b!184682 m!212213))

(assert (=> b!184682 m!211923))

(assert (=> b!184682 m!212081))

(assert (=> b!184682 m!212081))

(declare-fun m!212215 () Bool)

(assert (=> b!184682 m!212215))

(assert (=> b!184684 m!211923))

(assert (=> b!184684 m!212081))

(assert (=> b!184684 m!212081))

(assert (=> b!184684 m!212215))

(assert (=> b!184446 d!55059))

(assert (=> b!184390 d!54995))

(assert (=> b!184390 d!54997))

(declare-fun mapIsEmpty!7427 () Bool)

(declare-fun mapRes!7427 () Bool)

(assert (=> mapIsEmpty!7427 mapRes!7427))

(declare-fun mapNonEmpty!7427 () Bool)

(declare-fun tp!16427 () Bool)

(declare-fun e!121546 () Bool)

(assert (=> mapNonEmpty!7427 (= mapRes!7427 (and tp!16427 e!121546))))

(declare-fun mapKey!7427 () (_ BitVec 32))

(declare-fun mapRest!7427 () (Array (_ BitVec 32) ValueCell!1814))

(declare-fun mapValue!7427 () ValueCell!1814)

(assert (=> mapNonEmpty!7427 (= mapRest!7426 (store mapRest!7427 mapKey!7427 mapValue!7427))))

(declare-fun condMapEmpty!7427 () Bool)

(declare-fun mapDefault!7427 () ValueCell!1814)

(assert (=> mapNonEmpty!7426 (= condMapEmpty!7427 (= mapRest!7426 ((as const (Array (_ BitVec 32) ValueCell!1814)) mapDefault!7427)))))

(declare-fun e!121547 () Bool)

(assert (=> mapNonEmpty!7426 (= tp!16426 (and e!121547 mapRes!7427))))

(declare-fun b!184686 () Bool)

(assert (=> b!184686 (= e!121547 tp_is_empty!4315)))

(declare-fun b!184685 () Bool)

(assert (=> b!184685 (= e!121546 tp_is_empty!4315)))

(assert (= (and mapNonEmpty!7426 condMapEmpty!7427) mapIsEmpty!7427))

(assert (= (and mapNonEmpty!7426 (not condMapEmpty!7427)) mapNonEmpty!7427))

(assert (= (and mapNonEmpty!7427 ((_ is ValueCellFull!1814) mapValue!7427)) b!184685))

(assert (= (and mapNonEmpty!7426 ((_ is ValueCellFull!1814) mapDefault!7427)) b!184686))

(declare-fun m!212217 () Bool)

(assert (=> mapNonEmpty!7427 m!212217))

(declare-fun b_lambda!7249 () Bool)

(assert (= b_lambda!7247 (or (and b!184320 b_free!4543) b_lambda!7249)))

(declare-fun b_lambda!7251 () Bool)

(assert (= b_lambda!7245 (or (and b!184320 b_free!4543) b_lambda!7251)))

(check-sat (not b_next!4543) (not b!184644) (not d!55033) (not b!184651) (not d!55001) (not d!55029) (not b_lambda!7251) tp_is_empty!4315 (not b!184648) (not bm!18604) (not b!184603) (not b!184630) (not d!55055) (not d!54991) (not b!184553) (not d!55013) (not d!55049) (not bm!18613) (not b!184556) (not b!184574) (not b!184533) (not b!184504) (not b!184652) (not b!184624) (not d!55017) (not d!55015) (not d!55007) (not b!184607) (not b!184643) (not b!184645) (not b!184650) (not b!184604) (not b_lambda!7249) (not b!184654) (not b!184601) (not d!55023) (not d!55011) (not b!184649) (not b!184602) (not b!184522) (not mapNonEmpty!7427) (not d!55041) (not b!184541) (not b!184684) (not b!184552) (not b!184613) (not b!184511) (not d!55039) (not d!55045) (not b!184623) (not d!54993) (not b!184631) (not d!55047) (not b!184572) (not b!184608) (not b!184599) (not bm!18610) (not b!184637) (not d!55021) (not d!55043) (not d!55053) (not b_lambda!7243) (not d!55037) b_and!11151 (not d!55051) (not b!184633) (not d!54989) (not d!55035) (not b!184646) (not b!184562) (not d!55059) (not b!184634) (not d!54995) (not b!184561) (not b!184609) (not b!184611) (not d!55027) (not b!184635) (not b!184682) (not d!55025) (not bm!18607) (not d!55031) (not b!184678))
(check-sat b_and!11151 (not b_next!4543))
