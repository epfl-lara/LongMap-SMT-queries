; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17862 () Bool)

(assert start!17862)

(declare-fun b!178217 () Bool)

(declare-fun b_free!4401 () Bool)

(declare-fun b_next!4401 () Bool)

(assert (=> b!178217 (= b_free!4401 (not b_next!4401))))

(declare-fun tp!15914 () Bool)

(declare-fun b_and!10915 () Bool)

(assert (=> b!178217 (= tp!15914 b_and!10915)))

(declare-fun b!178214 () Bool)

(declare-fun res!84441 () Bool)

(declare-fun e!117479 () Bool)

(assert (=> b!178214 (=> (not res!84441) (not e!117479))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!178214 (= res!84441 (not (= key!828 (bvneg key!828))))))

(declare-fun b!178215 () Bool)

(declare-fun e!117482 () Bool)

(declare-fun e!117480 () Bool)

(declare-fun mapRes!7133 () Bool)

(assert (=> b!178215 (= e!117482 (and e!117480 mapRes!7133))))

(declare-fun condMapEmpty!7133 () Bool)

(declare-datatypes ((V!5211 0))(
  ( (V!5212 (val!2131 Int)) )
))
(declare-datatypes ((ValueCell!1743 0))(
  ( (ValueCellFull!1743 (v!4014 V!5211)) (EmptyCell!1743) )
))
(declare-datatypes ((array!7503 0))(
  ( (array!7504 (arr!3557 (Array (_ BitVec 32) (_ BitVec 64))) (size!3863 (_ BitVec 32))) )
))
(declare-datatypes ((array!7505 0))(
  ( (array!7506 (arr!3558 (Array (_ BitVec 32) ValueCell!1743)) (size!3864 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2394 0))(
  ( (LongMapFixedSize!2395 (defaultEntry!3665 Int) (mask!8621 (_ BitVec 32)) (extraKeys!3402 (_ BitVec 32)) (zeroValue!3506 V!5211) (minValue!3506 V!5211) (_size!1246 (_ BitVec 32)) (_keys!5541 array!7503) (_values!3648 array!7505) (_vacant!1246 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2394)

(declare-fun mapDefault!7133 () ValueCell!1743)

(assert (=> b!178215 (= condMapEmpty!7133 (= (arr!3558 (_values!3648 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1743)) mapDefault!7133)))))

(declare-fun b!178216 () Bool)

(declare-fun res!84440 () Bool)

(assert (=> b!178216 (=> (not res!84440) (not e!117479))))

(declare-datatypes ((tuple2!3314 0))(
  ( (tuple2!3315 (_1!1668 (_ BitVec 64)) (_2!1668 V!5211)) )
))
(declare-datatypes ((List!2261 0))(
  ( (Nil!2258) (Cons!2257 (h!2880 tuple2!3314) (t!7097 List!2261)) )
))
(declare-datatypes ((ListLongMap!2241 0))(
  ( (ListLongMap!2242 (toList!1136 List!2261)) )
))
(declare-fun contains!1206 (ListLongMap!2241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!788 (array!7503 array!7505 (_ BitVec 32) (_ BitVec 32) V!5211 V!5211 (_ BitVec 32) Int) ListLongMap!2241)

(assert (=> b!178216 (= res!84440 (not (contains!1206 (getCurrentListMap!788 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248)) key!828)))))

(declare-fun res!84443 () Bool)

(assert (=> start!17862 (=> (not res!84443) (not e!117479))))

(declare-fun valid!1003 (LongMapFixedSize!2394) Bool)

(assert (=> start!17862 (= res!84443 (valid!1003 thiss!1248))))

(assert (=> start!17862 e!117479))

(declare-fun e!117481 () Bool)

(assert (=> start!17862 e!117481))

(assert (=> start!17862 true))

(declare-fun tp_is_empty!4173 () Bool)

(declare-fun array_inv!2285 (array!7503) Bool)

(declare-fun array_inv!2286 (array!7505) Bool)

(assert (=> b!178217 (= e!117481 (and tp!15914 tp_is_empty!4173 (array_inv!2285 (_keys!5541 thiss!1248)) (array_inv!2286 (_values!3648 thiss!1248)) e!117482))))

(declare-fun mapIsEmpty!7133 () Bool)

(assert (=> mapIsEmpty!7133 mapRes!7133))

(declare-fun b!178218 () Bool)

(declare-fun e!117483 () Bool)

(assert (=> b!178218 (= e!117483 tp_is_empty!4173)))

(declare-fun mapNonEmpty!7133 () Bool)

(declare-fun tp!15913 () Bool)

(assert (=> mapNonEmpty!7133 (= mapRes!7133 (and tp!15913 e!117483))))

(declare-fun mapKey!7133 () (_ BitVec 32))

(declare-fun mapValue!7133 () ValueCell!1743)

(declare-fun mapRest!7133 () (Array (_ BitVec 32) ValueCell!1743))

(assert (=> mapNonEmpty!7133 (= (arr!3558 (_values!3648 thiss!1248)) (store mapRest!7133 mapKey!7133 mapValue!7133))))

(declare-fun b!178219 () Bool)

(assert (=> b!178219 (= e!117480 tp_is_empty!4173)))

(declare-fun b!178220 () Bool)

(declare-fun res!84444 () Bool)

(assert (=> b!178220 (=> (not res!84444) (not e!117479))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!573 0))(
  ( (MissingZero!573 (index!4460 (_ BitVec 32))) (Found!573 (index!4461 (_ BitVec 32))) (Intermediate!573 (undefined!1385 Bool) (index!4462 (_ BitVec 32)) (x!19523 (_ BitVec 32))) (Undefined!573) (MissingVacant!573 (index!4463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7503 (_ BitVec 32)) SeekEntryResult!573)

(assert (=> b!178220 (= res!84444 ((_ is Undefined!573) (seekEntryOrOpen!0 key!828 (_keys!5541 thiss!1248) (mask!8621 thiss!1248))))))

(declare-fun b!178221 () Bool)

(assert (=> b!178221 (= e!117479 (and (= (size!3864 (_values!3648 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8621 thiss!1248))) (= (size!3863 (_keys!5541 thiss!1248)) (size!3864 (_values!3648 thiss!1248))) (bvslt (mask!8621 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178222 () Bool)

(declare-fun res!84442 () Bool)

(assert (=> b!178222 (=> (not res!84442) (not e!117479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178222 (= res!84442 (validMask!0 (mask!8621 thiss!1248)))))

(assert (= (and start!17862 res!84443) b!178214))

(assert (= (and b!178214 res!84441) b!178220))

(assert (= (and b!178220 res!84444) b!178216))

(assert (= (and b!178216 res!84440) b!178222))

(assert (= (and b!178222 res!84442) b!178221))

(assert (= (and b!178215 condMapEmpty!7133) mapIsEmpty!7133))

(assert (= (and b!178215 (not condMapEmpty!7133)) mapNonEmpty!7133))

(assert (= (and mapNonEmpty!7133 ((_ is ValueCellFull!1743) mapValue!7133)) b!178218))

(assert (= (and b!178215 ((_ is ValueCellFull!1743) mapDefault!7133)) b!178219))

(assert (= b!178217 b!178215))

(assert (= start!17862 b!178217))

(declare-fun m!206659 () Bool)

(assert (=> start!17862 m!206659))

(declare-fun m!206661 () Bool)

(assert (=> b!178216 m!206661))

(assert (=> b!178216 m!206661))

(declare-fun m!206663 () Bool)

(assert (=> b!178216 m!206663))

(declare-fun m!206665 () Bool)

(assert (=> b!178217 m!206665))

(declare-fun m!206667 () Bool)

(assert (=> b!178217 m!206667))

(declare-fun m!206669 () Bool)

(assert (=> b!178222 m!206669))

(declare-fun m!206671 () Bool)

(assert (=> mapNonEmpty!7133 m!206671))

(declare-fun m!206673 () Bool)

(assert (=> b!178220 m!206673))

(check-sat (not b!178216) (not mapNonEmpty!7133) (not start!17862) (not b_next!4401) tp_is_empty!4173 (not b!178222) (not b!178217) (not b!178220) b_and!10915)
(check-sat b_and!10915 (not b_next!4401))
(get-model)

(declare-fun d!53929 () Bool)

(declare-fun e!117506 () Bool)

(assert (=> d!53929 e!117506))

(declare-fun res!84462 () Bool)

(assert (=> d!53929 (=> res!84462 e!117506)))

(declare-fun lt!88075 () Bool)

(assert (=> d!53929 (= res!84462 (not lt!88075))))

(declare-fun lt!88077 () Bool)

(assert (=> d!53929 (= lt!88075 lt!88077)))

(declare-datatypes ((Unit!5440 0))(
  ( (Unit!5441) )
))
(declare-fun lt!88078 () Unit!5440)

(declare-fun e!117507 () Unit!5440)

(assert (=> d!53929 (= lt!88078 e!117507)))

(declare-fun c!31935 () Bool)

(assert (=> d!53929 (= c!31935 lt!88077)))

(declare-fun containsKey!202 (List!2261 (_ BitVec 64)) Bool)

(assert (=> d!53929 (= lt!88077 (containsKey!202 (toList!1136 (getCurrentListMap!788 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248))) key!828))))

(assert (=> d!53929 (= (contains!1206 (getCurrentListMap!788 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248)) key!828) lt!88075)))

(declare-fun b!178256 () Bool)

(declare-fun lt!88076 () Unit!5440)

(assert (=> b!178256 (= e!117507 lt!88076)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!150 (List!2261 (_ BitVec 64)) Unit!5440)

(assert (=> b!178256 (= lt!88076 (lemmaContainsKeyImpliesGetValueByKeyDefined!150 (toList!1136 (getCurrentListMap!788 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248))) key!828))))

(declare-datatypes ((Option!204 0))(
  ( (Some!203 (v!4016 V!5211)) (None!202) )
))
(declare-fun isDefined!151 (Option!204) Bool)

(declare-fun getValueByKey!198 (List!2261 (_ BitVec 64)) Option!204)

(assert (=> b!178256 (isDefined!151 (getValueByKey!198 (toList!1136 (getCurrentListMap!788 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248))) key!828))))

(declare-fun b!178257 () Bool)

(declare-fun Unit!5442 () Unit!5440)

(assert (=> b!178257 (= e!117507 Unit!5442)))

(declare-fun b!178258 () Bool)

(assert (=> b!178258 (= e!117506 (isDefined!151 (getValueByKey!198 (toList!1136 (getCurrentListMap!788 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248))) key!828)))))

(assert (= (and d!53929 c!31935) b!178256))

(assert (= (and d!53929 (not c!31935)) b!178257))

(assert (= (and d!53929 (not res!84462)) b!178258))

(declare-fun m!206691 () Bool)

(assert (=> d!53929 m!206691))

(declare-fun m!206693 () Bool)

(assert (=> b!178256 m!206693))

(declare-fun m!206695 () Bool)

(assert (=> b!178256 m!206695))

(assert (=> b!178256 m!206695))

(declare-fun m!206697 () Bool)

(assert (=> b!178256 m!206697))

(assert (=> b!178258 m!206695))

(assert (=> b!178258 m!206695))

(assert (=> b!178258 m!206697))

(assert (=> b!178216 d!53929))

(declare-fun bm!18022 () Bool)

(declare-fun call!18030 () Bool)

(declare-fun lt!88140 () ListLongMap!2241)

(assert (=> bm!18022 (= call!18030 (contains!1206 lt!88140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178302 () Bool)

(declare-fun e!117540 () Bool)

(declare-fun e!117544 () Bool)

(assert (=> b!178302 (= e!117540 e!117544)))

(declare-fun c!31951 () Bool)

(assert (=> b!178302 (= c!31951 (not (= (bvand (extraKeys!3402 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18023 () Bool)

(declare-fun call!18027 () ListLongMap!2241)

(declare-fun call!18031 () ListLongMap!2241)

(assert (=> bm!18023 (= call!18027 call!18031)))

(declare-fun b!178303 () Bool)

(declare-fun c!31953 () Bool)

(assert (=> b!178303 (= c!31953 (and (not (= (bvand (extraKeys!3402 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3402 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!117541 () ListLongMap!2241)

(declare-fun e!117543 () ListLongMap!2241)

(assert (=> b!178303 (= e!117541 e!117543)))

(declare-fun call!18026 () ListLongMap!2241)

(declare-fun c!31948 () Bool)

(declare-fun call!18028 () ListLongMap!2241)

(declare-fun c!31950 () Bool)

(declare-fun bm!18024 () Bool)

(declare-fun +!260 (ListLongMap!2241 tuple2!3314) ListLongMap!2241)

(assert (=> bm!18024 (= call!18026 (+!260 (ite c!31948 call!18031 (ite c!31950 call!18027 call!18028)) (ite (or c!31948 c!31950) (tuple2!3315 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3506 thiss!1248)) (tuple2!3315 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3506 thiss!1248)))))))

(declare-fun b!178304 () Bool)

(declare-fun e!117535 () Bool)

(declare-fun e!117536 () Bool)

(assert (=> b!178304 (= e!117535 e!117536)))

(declare-fun res!84485 () Bool)

(assert (=> b!178304 (= res!84485 call!18030)))

(assert (=> b!178304 (=> (not res!84485) (not e!117536))))

(declare-fun b!178305 () Bool)

(declare-fun e!117542 () ListLongMap!2241)

(assert (=> b!178305 (= e!117542 e!117541)))

(assert (=> b!178305 (= c!31950 (and (not (= (bvand (extraKeys!3402 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3402 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178306 () Bool)

(declare-fun res!84482 () Bool)

(assert (=> b!178306 (=> (not res!84482) (not e!117540))))

(declare-fun e!117539 () Bool)

(assert (=> b!178306 (= res!84482 e!117539)))

(declare-fun res!84489 () Bool)

(assert (=> b!178306 (=> res!84489 e!117539)))

(declare-fun e!117538 () Bool)

(assert (=> b!178306 (= res!84489 (not e!117538))))

(declare-fun res!84486 () Bool)

(assert (=> b!178306 (=> (not res!84486) (not e!117538))))

(assert (=> b!178306 (= res!84486 (bvslt #b00000000000000000000000000000000 (size!3863 (_keys!5541 thiss!1248))))))

(declare-fun b!178307 () Bool)

(declare-fun e!117534 () Bool)

(assert (=> b!178307 (= e!117539 e!117534)))

(declare-fun res!84487 () Bool)

(assert (=> b!178307 (=> (not res!84487) (not e!117534))))

(assert (=> b!178307 (= res!84487 (contains!1206 lt!88140 (select (arr!3557 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3863 (_keys!5541 thiss!1248))))))

(declare-fun b!178308 () Bool)

(declare-fun e!117537 () Unit!5440)

(declare-fun lt!88124 () Unit!5440)

(assert (=> b!178308 (= e!117537 lt!88124)))

(declare-fun lt!88129 () ListLongMap!2241)

(declare-fun getCurrentListMapNoExtraKeys!176 (array!7503 array!7505 (_ BitVec 32) (_ BitVec 32) V!5211 V!5211 (_ BitVec 32) Int) ListLongMap!2241)

(assert (=> b!178308 (= lt!88129 (getCurrentListMapNoExtraKeys!176 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248)))))

(declare-fun lt!88138 () (_ BitVec 64))

(assert (=> b!178308 (= lt!88138 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88137 () (_ BitVec 64))

(assert (=> b!178308 (= lt!88137 (select (arr!3557 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88126 () Unit!5440)

(declare-fun addStillContains!119 (ListLongMap!2241 (_ BitVec 64) V!5211 (_ BitVec 64)) Unit!5440)

(assert (=> b!178308 (= lt!88126 (addStillContains!119 lt!88129 lt!88138 (zeroValue!3506 thiss!1248) lt!88137))))

(assert (=> b!178308 (contains!1206 (+!260 lt!88129 (tuple2!3315 lt!88138 (zeroValue!3506 thiss!1248))) lt!88137)))

(declare-fun lt!88123 () Unit!5440)

(assert (=> b!178308 (= lt!88123 lt!88126)))

(declare-fun lt!88131 () ListLongMap!2241)

(assert (=> b!178308 (= lt!88131 (getCurrentListMapNoExtraKeys!176 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248)))))

(declare-fun lt!88128 () (_ BitVec 64))

(assert (=> b!178308 (= lt!88128 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88142 () (_ BitVec 64))

(assert (=> b!178308 (= lt!88142 (select (arr!3557 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88141 () Unit!5440)

(declare-fun addApplyDifferent!119 (ListLongMap!2241 (_ BitVec 64) V!5211 (_ BitVec 64)) Unit!5440)

(assert (=> b!178308 (= lt!88141 (addApplyDifferent!119 lt!88131 lt!88128 (minValue!3506 thiss!1248) lt!88142))))

(declare-fun apply!143 (ListLongMap!2241 (_ BitVec 64)) V!5211)

(assert (=> b!178308 (= (apply!143 (+!260 lt!88131 (tuple2!3315 lt!88128 (minValue!3506 thiss!1248))) lt!88142) (apply!143 lt!88131 lt!88142))))

(declare-fun lt!88127 () Unit!5440)

(assert (=> b!178308 (= lt!88127 lt!88141)))

(declare-fun lt!88144 () ListLongMap!2241)

(assert (=> b!178308 (= lt!88144 (getCurrentListMapNoExtraKeys!176 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248)))))

(declare-fun lt!88132 () (_ BitVec 64))

(assert (=> b!178308 (= lt!88132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88139 () (_ BitVec 64))

(assert (=> b!178308 (= lt!88139 (select (arr!3557 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88134 () Unit!5440)

(assert (=> b!178308 (= lt!88134 (addApplyDifferent!119 lt!88144 lt!88132 (zeroValue!3506 thiss!1248) lt!88139))))

(assert (=> b!178308 (= (apply!143 (+!260 lt!88144 (tuple2!3315 lt!88132 (zeroValue!3506 thiss!1248))) lt!88139) (apply!143 lt!88144 lt!88139))))

(declare-fun lt!88133 () Unit!5440)

(assert (=> b!178308 (= lt!88133 lt!88134)))

(declare-fun lt!88143 () ListLongMap!2241)

(assert (=> b!178308 (= lt!88143 (getCurrentListMapNoExtraKeys!176 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248)))))

(declare-fun lt!88130 () (_ BitVec 64))

(assert (=> b!178308 (= lt!88130 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88136 () (_ BitVec 64))

(assert (=> b!178308 (= lt!88136 (select (arr!3557 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178308 (= lt!88124 (addApplyDifferent!119 lt!88143 lt!88130 (minValue!3506 thiss!1248) lt!88136))))

(assert (=> b!178308 (= (apply!143 (+!260 lt!88143 (tuple2!3315 lt!88130 (minValue!3506 thiss!1248))) lt!88136) (apply!143 lt!88143 lt!88136))))

(declare-fun b!178309 () Bool)

(declare-fun call!18025 () ListLongMap!2241)

(assert (=> b!178309 (= e!117543 call!18025)))

(declare-fun bm!18025 () Bool)

(assert (=> bm!18025 (= call!18025 call!18026)))

(declare-fun b!178310 () Bool)

(declare-fun call!18029 () Bool)

(assert (=> b!178310 (= e!117544 (not call!18029))))

(declare-fun bm!18026 () Bool)

(assert (=> bm!18026 (= call!18029 (contains!1206 lt!88140 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!53931 () Bool)

(assert (=> d!53931 e!117540))

(declare-fun res!84483 () Bool)

(assert (=> d!53931 (=> (not res!84483) (not e!117540))))

(assert (=> d!53931 (= res!84483 (or (bvsge #b00000000000000000000000000000000 (size!3863 (_keys!5541 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3863 (_keys!5541 thiss!1248))))))))

(declare-fun lt!88135 () ListLongMap!2241)

(assert (=> d!53931 (= lt!88140 lt!88135)))

(declare-fun lt!88125 () Unit!5440)

(assert (=> d!53931 (= lt!88125 e!117537)))

(declare-fun c!31952 () Bool)

(declare-fun e!117545 () Bool)

(assert (=> d!53931 (= c!31952 e!117545)))

(declare-fun res!84484 () Bool)

(assert (=> d!53931 (=> (not res!84484) (not e!117545))))

(assert (=> d!53931 (= res!84484 (bvslt #b00000000000000000000000000000000 (size!3863 (_keys!5541 thiss!1248))))))

(assert (=> d!53931 (= lt!88135 e!117542)))

(assert (=> d!53931 (= c!31948 (and (not (= (bvand (extraKeys!3402 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3402 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53931 (validMask!0 (mask!8621 thiss!1248))))

(assert (=> d!53931 (= (getCurrentListMap!788 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248)) lt!88140)))

(declare-fun b!178301 () Bool)

(assert (=> b!178301 (= e!117536 (= (apply!143 lt!88140 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3506 thiss!1248)))))

(declare-fun b!178311 () Bool)

(declare-fun Unit!5443 () Unit!5440)

(assert (=> b!178311 (= e!117537 Unit!5443)))

(declare-fun b!178312 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178312 (= e!117538 (validKeyInArray!0 (select (arr!3557 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178313 () Bool)

(assert (=> b!178313 (= e!117543 call!18028)))

(declare-fun b!178314 () Bool)

(assert (=> b!178314 (= e!117541 call!18025)))

(declare-fun b!178315 () Bool)

(declare-fun e!117546 () Bool)

(assert (=> b!178315 (= e!117546 (= (apply!143 lt!88140 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3506 thiss!1248)))))

(declare-fun b!178316 () Bool)

(assert (=> b!178316 (= e!117545 (validKeyInArray!0 (select (arr!3557 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178317 () Bool)

(declare-fun get!2032 (ValueCell!1743 V!5211) V!5211)

(declare-fun dynLambda!486 (Int (_ BitVec 64)) V!5211)

(assert (=> b!178317 (= e!117534 (= (apply!143 lt!88140 (select (arr!3557 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000)) (get!2032 (select (arr!3558 (_values!3648 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!486 (defaultEntry!3665 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3864 (_values!3648 thiss!1248))))))

(assert (=> b!178317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3863 (_keys!5541 thiss!1248))))))

(declare-fun b!178318 () Bool)

(assert (=> b!178318 (= e!117542 (+!260 call!18026 (tuple2!3315 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3506 thiss!1248))))))

(declare-fun bm!18027 () Bool)

(assert (=> bm!18027 (= call!18028 call!18027)))

(declare-fun b!178319 () Bool)

(declare-fun res!84488 () Bool)

(assert (=> b!178319 (=> (not res!84488) (not e!117540))))

(assert (=> b!178319 (= res!84488 e!117535)))

(declare-fun c!31949 () Bool)

(assert (=> b!178319 (= c!31949 (not (= (bvand (extraKeys!3402 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!178320 () Bool)

(assert (=> b!178320 (= e!117544 e!117546)))

(declare-fun res!84481 () Bool)

(assert (=> b!178320 (= res!84481 call!18029)))

(assert (=> b!178320 (=> (not res!84481) (not e!117546))))

(declare-fun bm!18028 () Bool)

(assert (=> bm!18028 (= call!18031 (getCurrentListMapNoExtraKeys!176 (_keys!5541 thiss!1248) (_values!3648 thiss!1248) (mask!8621 thiss!1248) (extraKeys!3402 thiss!1248) (zeroValue!3506 thiss!1248) (minValue!3506 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3665 thiss!1248)))))

(declare-fun b!178321 () Bool)

(assert (=> b!178321 (= e!117535 (not call!18030))))

(assert (= (and d!53931 c!31948) b!178318))

(assert (= (and d!53931 (not c!31948)) b!178305))

(assert (= (and b!178305 c!31950) b!178314))

(assert (= (and b!178305 (not c!31950)) b!178303))

(assert (= (and b!178303 c!31953) b!178309))

(assert (= (and b!178303 (not c!31953)) b!178313))

(assert (= (or b!178309 b!178313) bm!18027))

(assert (= (or b!178314 bm!18027) bm!18023))

(assert (= (or b!178314 b!178309) bm!18025))

(assert (= (or b!178318 bm!18023) bm!18028))

(assert (= (or b!178318 bm!18025) bm!18024))

(assert (= (and d!53931 res!84484) b!178316))

(assert (= (and d!53931 c!31952) b!178308))

(assert (= (and d!53931 (not c!31952)) b!178311))

(assert (= (and d!53931 res!84483) b!178306))

(assert (= (and b!178306 res!84486) b!178312))

(assert (= (and b!178306 (not res!84489)) b!178307))

(assert (= (and b!178307 res!84487) b!178317))

(assert (= (and b!178306 res!84482) b!178319))

(assert (= (and b!178319 c!31949) b!178304))

(assert (= (and b!178319 (not c!31949)) b!178321))

(assert (= (and b!178304 res!84485) b!178301))

(assert (= (or b!178304 b!178321) bm!18022))

(assert (= (and b!178319 res!84488) b!178302))

(assert (= (and b!178302 c!31951) b!178320))

(assert (= (and b!178302 (not c!31951)) b!178310))

(assert (= (and b!178320 res!84481) b!178315))

(assert (= (or b!178320 b!178310) bm!18026))

(declare-fun b_lambda!7079 () Bool)

(assert (=> (not b_lambda!7079) (not b!178317)))

(declare-fun t!7099 () Bool)

(declare-fun tb!2797 () Bool)

(assert (=> (and b!178217 (= (defaultEntry!3665 thiss!1248) (defaultEntry!3665 thiss!1248)) t!7099) tb!2797))

(declare-fun result!4665 () Bool)

(assert (=> tb!2797 (= result!4665 tp_is_empty!4173)))

(assert (=> b!178317 t!7099))

(declare-fun b_and!10919 () Bool)

(assert (= b_and!10915 (and (=> t!7099 result!4665) b_and!10919)))

(declare-fun m!206699 () Bool)

(assert (=> b!178308 m!206699))

(declare-fun m!206701 () Bool)

(assert (=> b!178308 m!206701))

(declare-fun m!206703 () Bool)

(assert (=> b!178308 m!206703))

(declare-fun m!206705 () Bool)

(assert (=> b!178308 m!206705))

(declare-fun m!206707 () Bool)

(assert (=> b!178308 m!206707))

(declare-fun m!206709 () Bool)

(assert (=> b!178308 m!206709))

(assert (=> b!178308 m!206703))

(declare-fun m!206711 () Bool)

(assert (=> b!178308 m!206711))

(declare-fun m!206713 () Bool)

(assert (=> b!178308 m!206713))

(declare-fun m!206715 () Bool)

(assert (=> b!178308 m!206715))

(declare-fun m!206717 () Bool)

(assert (=> b!178308 m!206717))

(declare-fun m!206719 () Bool)

(assert (=> b!178308 m!206719))

(declare-fun m!206721 () Bool)

(assert (=> b!178308 m!206721))

(assert (=> b!178308 m!206699))

(assert (=> b!178308 m!206715))

(declare-fun m!206723 () Bool)

(assert (=> b!178308 m!206723))

(declare-fun m!206725 () Bool)

(assert (=> b!178308 m!206725))

(assert (=> b!178308 m!206717))

(declare-fun m!206727 () Bool)

(assert (=> b!178308 m!206727))

(declare-fun m!206729 () Bool)

(assert (=> b!178308 m!206729))

(declare-fun m!206731 () Bool)

(assert (=> b!178308 m!206731))

(declare-fun m!206733 () Bool)

(assert (=> b!178315 m!206733))

(assert (=> b!178307 m!206719))

(assert (=> b!178307 m!206719))

(declare-fun m!206735 () Bool)

(assert (=> b!178307 m!206735))

(declare-fun m!206737 () Bool)

(assert (=> bm!18026 m!206737))

(declare-fun m!206739 () Bool)

(assert (=> b!178301 m!206739))

(declare-fun m!206741 () Bool)

(assert (=> bm!18022 m!206741))

(assert (=> d!53931 m!206669))

(assert (=> b!178312 m!206719))

(assert (=> b!178312 m!206719))

(declare-fun m!206743 () Bool)

(assert (=> b!178312 m!206743))

(declare-fun m!206745 () Bool)

(assert (=> bm!18024 m!206745))

(declare-fun m!206747 () Bool)

(assert (=> b!178318 m!206747))

(assert (=> bm!18028 m!206729))

(assert (=> b!178316 m!206719))

(assert (=> b!178316 m!206719))

(assert (=> b!178316 m!206743))

(declare-fun m!206749 () Bool)

(assert (=> b!178317 m!206749))

(declare-fun m!206751 () Bool)

(assert (=> b!178317 m!206751))

(assert (=> b!178317 m!206749))

(declare-fun m!206753 () Bool)

(assert (=> b!178317 m!206753))

(assert (=> b!178317 m!206751))

(assert (=> b!178317 m!206719))

(assert (=> b!178317 m!206719))

(declare-fun m!206755 () Bool)

(assert (=> b!178317 m!206755))

(assert (=> b!178216 d!53931))

(declare-fun b!178336 () Bool)

(declare-fun e!117553 () SeekEntryResult!573)

(declare-fun lt!88152 () SeekEntryResult!573)

(assert (=> b!178336 (= e!117553 (MissingZero!573 (index!4462 lt!88152)))))

(declare-fun b!178337 () Bool)

(declare-fun e!117555 () SeekEntryResult!573)

(assert (=> b!178337 (= e!117555 (Found!573 (index!4462 lt!88152)))))

(declare-fun b!178338 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7503 (_ BitVec 32)) SeekEntryResult!573)

(assert (=> b!178338 (= e!117553 (seekKeyOrZeroReturnVacant!0 (x!19523 lt!88152) (index!4462 lt!88152) (index!4462 lt!88152) key!828 (_keys!5541 thiss!1248) (mask!8621 thiss!1248)))))

(declare-fun b!178339 () Bool)

(declare-fun c!31960 () Bool)

(declare-fun lt!88151 () (_ BitVec 64))

(assert (=> b!178339 (= c!31960 (= lt!88151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178339 (= e!117555 e!117553)))

(declare-fun b!178340 () Bool)

(declare-fun e!117554 () SeekEntryResult!573)

(assert (=> b!178340 (= e!117554 e!117555)))

(assert (=> b!178340 (= lt!88151 (select (arr!3557 (_keys!5541 thiss!1248)) (index!4462 lt!88152)))))

(declare-fun c!31961 () Bool)

(assert (=> b!178340 (= c!31961 (= lt!88151 key!828))))

(declare-fun b!178341 () Bool)

(assert (=> b!178341 (= e!117554 Undefined!573)))

(declare-fun d!53933 () Bool)

(declare-fun lt!88153 () SeekEntryResult!573)

(assert (=> d!53933 (and (or ((_ is Undefined!573) lt!88153) (not ((_ is Found!573) lt!88153)) (and (bvsge (index!4461 lt!88153) #b00000000000000000000000000000000) (bvslt (index!4461 lt!88153) (size!3863 (_keys!5541 thiss!1248))))) (or ((_ is Undefined!573) lt!88153) ((_ is Found!573) lt!88153) (not ((_ is MissingZero!573) lt!88153)) (and (bvsge (index!4460 lt!88153) #b00000000000000000000000000000000) (bvslt (index!4460 lt!88153) (size!3863 (_keys!5541 thiss!1248))))) (or ((_ is Undefined!573) lt!88153) ((_ is Found!573) lt!88153) ((_ is MissingZero!573) lt!88153) (not ((_ is MissingVacant!573) lt!88153)) (and (bvsge (index!4463 lt!88153) #b00000000000000000000000000000000) (bvslt (index!4463 lt!88153) (size!3863 (_keys!5541 thiss!1248))))) (or ((_ is Undefined!573) lt!88153) (ite ((_ is Found!573) lt!88153) (= (select (arr!3557 (_keys!5541 thiss!1248)) (index!4461 lt!88153)) key!828) (ite ((_ is MissingZero!573) lt!88153) (= (select (arr!3557 (_keys!5541 thiss!1248)) (index!4460 lt!88153)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!573) lt!88153) (= (select (arr!3557 (_keys!5541 thiss!1248)) (index!4463 lt!88153)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53933 (= lt!88153 e!117554)))

(declare-fun c!31962 () Bool)

(assert (=> d!53933 (= c!31962 (and ((_ is Intermediate!573) lt!88152) (undefined!1385 lt!88152)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7503 (_ BitVec 32)) SeekEntryResult!573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53933 (= lt!88152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8621 thiss!1248)) key!828 (_keys!5541 thiss!1248) (mask!8621 thiss!1248)))))

(assert (=> d!53933 (validMask!0 (mask!8621 thiss!1248))))

(assert (=> d!53933 (= (seekEntryOrOpen!0 key!828 (_keys!5541 thiss!1248) (mask!8621 thiss!1248)) lt!88153)))

(assert (= (and d!53933 c!31962) b!178341))

(assert (= (and d!53933 (not c!31962)) b!178340))

(assert (= (and b!178340 c!31961) b!178337))

(assert (= (and b!178340 (not c!31961)) b!178339))

(assert (= (and b!178339 c!31960) b!178336))

(assert (= (and b!178339 (not c!31960)) b!178338))

(declare-fun m!206757 () Bool)

(assert (=> b!178338 m!206757))

(declare-fun m!206759 () Bool)

(assert (=> b!178340 m!206759))

(declare-fun m!206761 () Bool)

(assert (=> d!53933 m!206761))

(declare-fun m!206763 () Bool)

(assert (=> d!53933 m!206763))

(declare-fun m!206765 () Bool)

(assert (=> d!53933 m!206765))

(declare-fun m!206767 () Bool)

(assert (=> d!53933 m!206767))

(assert (=> d!53933 m!206761))

(declare-fun m!206769 () Bool)

(assert (=> d!53933 m!206769))

(assert (=> d!53933 m!206669))

(assert (=> b!178220 d!53933))

(declare-fun d!53935 () Bool)

(assert (=> d!53935 (= (validMask!0 (mask!8621 thiss!1248)) (and (or (= (mask!8621 thiss!1248) #b00000000000000000000000000000111) (= (mask!8621 thiss!1248) #b00000000000000000000000000001111) (= (mask!8621 thiss!1248) #b00000000000000000000000000011111) (= (mask!8621 thiss!1248) #b00000000000000000000000000111111) (= (mask!8621 thiss!1248) #b00000000000000000000000001111111) (= (mask!8621 thiss!1248) #b00000000000000000000000011111111) (= (mask!8621 thiss!1248) #b00000000000000000000000111111111) (= (mask!8621 thiss!1248) #b00000000000000000000001111111111) (= (mask!8621 thiss!1248) #b00000000000000000000011111111111) (= (mask!8621 thiss!1248) #b00000000000000000000111111111111) (= (mask!8621 thiss!1248) #b00000000000000000001111111111111) (= (mask!8621 thiss!1248) #b00000000000000000011111111111111) (= (mask!8621 thiss!1248) #b00000000000000000111111111111111) (= (mask!8621 thiss!1248) #b00000000000000001111111111111111) (= (mask!8621 thiss!1248) #b00000000000000011111111111111111) (= (mask!8621 thiss!1248) #b00000000000000111111111111111111) (= (mask!8621 thiss!1248) #b00000000000001111111111111111111) (= (mask!8621 thiss!1248) #b00000000000011111111111111111111) (= (mask!8621 thiss!1248) #b00000000000111111111111111111111) (= (mask!8621 thiss!1248) #b00000000001111111111111111111111) (= (mask!8621 thiss!1248) #b00000000011111111111111111111111) (= (mask!8621 thiss!1248) #b00000000111111111111111111111111) (= (mask!8621 thiss!1248) #b00000001111111111111111111111111) (= (mask!8621 thiss!1248) #b00000011111111111111111111111111) (= (mask!8621 thiss!1248) #b00000111111111111111111111111111) (= (mask!8621 thiss!1248) #b00001111111111111111111111111111) (= (mask!8621 thiss!1248) #b00011111111111111111111111111111) (= (mask!8621 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8621 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178222 d!53935))

(declare-fun d!53937 () Bool)

(declare-fun res!84496 () Bool)

(declare-fun e!117558 () Bool)

(assert (=> d!53937 (=> (not res!84496) (not e!117558))))

(declare-fun simpleValid!157 (LongMapFixedSize!2394) Bool)

(assert (=> d!53937 (= res!84496 (simpleValid!157 thiss!1248))))

(assert (=> d!53937 (= (valid!1003 thiss!1248) e!117558)))

(declare-fun b!178348 () Bool)

(declare-fun res!84497 () Bool)

(assert (=> b!178348 (=> (not res!84497) (not e!117558))))

(declare-fun arrayCountValidKeys!0 (array!7503 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178348 (= res!84497 (= (arrayCountValidKeys!0 (_keys!5541 thiss!1248) #b00000000000000000000000000000000 (size!3863 (_keys!5541 thiss!1248))) (_size!1246 thiss!1248)))))

(declare-fun b!178349 () Bool)

(declare-fun res!84498 () Bool)

(assert (=> b!178349 (=> (not res!84498) (not e!117558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7503 (_ BitVec 32)) Bool)

(assert (=> b!178349 (= res!84498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5541 thiss!1248) (mask!8621 thiss!1248)))))

(declare-fun b!178350 () Bool)

(declare-datatypes ((List!2262 0))(
  ( (Nil!2259) (Cons!2258 (h!2881 (_ BitVec 64)) (t!7100 List!2262)) )
))
(declare-fun arrayNoDuplicates!0 (array!7503 (_ BitVec 32) List!2262) Bool)

(assert (=> b!178350 (= e!117558 (arrayNoDuplicates!0 (_keys!5541 thiss!1248) #b00000000000000000000000000000000 Nil!2259))))

(assert (= (and d!53937 res!84496) b!178348))

(assert (= (and b!178348 res!84497) b!178349))

(assert (= (and b!178349 res!84498) b!178350))

(declare-fun m!206771 () Bool)

(assert (=> d!53937 m!206771))

(declare-fun m!206773 () Bool)

(assert (=> b!178348 m!206773))

(declare-fun m!206775 () Bool)

(assert (=> b!178349 m!206775))

(declare-fun m!206777 () Bool)

(assert (=> b!178350 m!206777))

(assert (=> start!17862 d!53937))

(declare-fun d!53939 () Bool)

(assert (=> d!53939 (= (array_inv!2285 (_keys!5541 thiss!1248)) (bvsge (size!3863 (_keys!5541 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178217 d!53939))

(declare-fun d!53941 () Bool)

(assert (=> d!53941 (= (array_inv!2286 (_values!3648 thiss!1248)) (bvsge (size!3864 (_values!3648 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178217 d!53941))

(declare-fun condMapEmpty!7139 () Bool)

(declare-fun mapDefault!7139 () ValueCell!1743)

(assert (=> mapNonEmpty!7133 (= condMapEmpty!7139 (= mapRest!7133 ((as const (Array (_ BitVec 32) ValueCell!1743)) mapDefault!7139)))))

(declare-fun e!117563 () Bool)

(declare-fun mapRes!7139 () Bool)

(assert (=> mapNonEmpty!7133 (= tp!15913 (and e!117563 mapRes!7139))))

(declare-fun mapNonEmpty!7139 () Bool)

(declare-fun tp!15923 () Bool)

(declare-fun e!117564 () Bool)

(assert (=> mapNonEmpty!7139 (= mapRes!7139 (and tp!15923 e!117564))))

(declare-fun mapValue!7139 () ValueCell!1743)

(declare-fun mapKey!7139 () (_ BitVec 32))

(declare-fun mapRest!7139 () (Array (_ BitVec 32) ValueCell!1743))

(assert (=> mapNonEmpty!7139 (= mapRest!7133 (store mapRest!7139 mapKey!7139 mapValue!7139))))

(declare-fun b!178357 () Bool)

(assert (=> b!178357 (= e!117564 tp_is_empty!4173)))

(declare-fun b!178358 () Bool)

(assert (=> b!178358 (= e!117563 tp_is_empty!4173)))

(declare-fun mapIsEmpty!7139 () Bool)

(assert (=> mapIsEmpty!7139 mapRes!7139))

(assert (= (and mapNonEmpty!7133 condMapEmpty!7139) mapIsEmpty!7139))

(assert (= (and mapNonEmpty!7133 (not condMapEmpty!7139)) mapNonEmpty!7139))

(assert (= (and mapNonEmpty!7139 ((_ is ValueCellFull!1743) mapValue!7139)) b!178357))

(assert (= (and mapNonEmpty!7133 ((_ is ValueCellFull!1743) mapDefault!7139)) b!178358))

(declare-fun m!206779 () Bool)

(assert (=> mapNonEmpty!7139 m!206779))

(declare-fun b_lambda!7081 () Bool)

(assert (= b_lambda!7079 (or (and b!178217 b_free!4401) b_lambda!7081)))

(check-sat (not d!53931) (not b!178317) (not d!53929) (not b!178256) (not d!53933) (not bm!18022) (not b!178350) (not b!178307) (not b!178318) (not b!178349) (not d!53937) (not b!178301) (not bm!18028) (not b!178338) (not bm!18024) (not mapNonEmpty!7139) (not b!178308) (not b!178316) (not bm!18026) (not b_next!4401) (not b!178258) (not b!178315) tp_is_empty!4173 b_and!10919 (not b!178312) (not b_lambda!7081) (not b!178348))
(check-sat b_and!10919 (not b_next!4401))
