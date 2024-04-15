; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17864 () Bool)

(assert start!17864)

(declare-fun b!178046 () Bool)

(declare-fun b_free!4399 () Bool)

(declare-fun b_next!4399 () Bool)

(assert (=> b!178046 (= b_free!4399 (not b_next!4399))))

(declare-fun tp!15907 () Bool)

(declare-fun b_and!10887 () Bool)

(assert (=> b!178046 (= tp!15907 b_and!10887)))

(declare-fun b!178040 () Bool)

(declare-fun e!117359 () Bool)

(declare-fun tp_is_empty!4171 () Bool)

(assert (=> b!178040 (= e!117359 tp_is_empty!4171)))

(declare-fun mapIsEmpty!7130 () Bool)

(declare-fun mapRes!7130 () Bool)

(assert (=> mapIsEmpty!7130 mapRes!7130))

(declare-fun b!178041 () Bool)

(declare-fun e!117363 () Bool)

(declare-datatypes ((V!5209 0))(
  ( (V!5210 (val!2130 Int)) )
))
(declare-datatypes ((ValueCell!1742 0))(
  ( (ValueCellFull!1742 (v!4007 V!5209)) (EmptyCell!1742) )
))
(declare-datatypes ((array!7479 0))(
  ( (array!7480 (arr!3544 (Array (_ BitVec 32) (_ BitVec 64))) (size!3851 (_ BitVec 32))) )
))
(declare-datatypes ((array!7481 0))(
  ( (array!7482 (arr!3545 (Array (_ BitVec 32) ValueCell!1742)) (size!3852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2392 0))(
  ( (LongMapFixedSize!2393 (defaultEntry!3664 Int) (mask!8619 (_ BitVec 32)) (extraKeys!3401 (_ BitVec 32)) (zeroValue!3505 V!5209) (minValue!3505 V!5209) (_size!1245 (_ BitVec 32)) (_keys!5539 array!7479) (_values!3647 array!7481) (_vacant!1245 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2392)

(assert (=> b!178041 (= e!117363 (and (= (size!3852 (_values!3647 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8619 thiss!1248))) (= (size!3851 (_keys!5539 thiss!1248)) (size!3852 (_values!3647 thiss!1248))) (bvslt (mask!8619 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!178042 () Bool)

(declare-fun res!84334 () Bool)

(assert (=> b!178042 (=> (not res!84334) (not e!117363))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!582 0))(
  ( (MissingZero!582 (index!4496 (_ BitVec 32))) (Found!582 (index!4497 (_ BitVec 32))) (Intermediate!582 (undefined!1394 Bool) (index!4498 (_ BitVec 32)) (x!19531 (_ BitVec 32))) (Undefined!582) (MissingVacant!582 (index!4499 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7479 (_ BitVec 32)) SeekEntryResult!582)

(assert (=> b!178042 (= res!84334 ((_ is Undefined!582) (seekEntryOrOpen!0 key!828 (_keys!5539 thiss!1248) (mask!8619 thiss!1248))))))

(declare-fun b!178043 () Bool)

(declare-fun res!84333 () Bool)

(assert (=> b!178043 (=> (not res!84333) (not e!117363))))

(declare-datatypes ((tuple2!3294 0))(
  ( (tuple2!3295 (_1!1658 (_ BitVec 64)) (_2!1658 V!5209)) )
))
(declare-datatypes ((List!2261 0))(
  ( (Nil!2258) (Cons!2257 (h!2880 tuple2!3294) (t!7088 List!2261)) )
))
(declare-datatypes ((ListLongMap!2213 0))(
  ( (ListLongMap!2214 (toList!1122 List!2261)) )
))
(declare-fun contains!1197 (ListLongMap!2213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!758 (array!7479 array!7481 (_ BitVec 32) (_ BitVec 32) V!5209 V!5209 (_ BitVec 32) Int) ListLongMap!2213)

(assert (=> b!178043 (= res!84333 (not (contains!1197 (getCurrentListMap!758 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)) key!828)))))

(declare-fun b!178044 () Bool)

(declare-fun res!84331 () Bool)

(assert (=> b!178044 (=> (not res!84331) (not e!117363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178044 (= res!84331 (validMask!0 (mask!8619 thiss!1248)))))

(declare-fun b!178045 () Bool)

(declare-fun res!84330 () Bool)

(assert (=> b!178045 (=> (not res!84330) (not e!117363))))

(assert (=> b!178045 (= res!84330 (not (= key!828 (bvneg key!828))))))

(declare-fun e!117361 () Bool)

(declare-fun e!117364 () Bool)

(declare-fun array_inv!2285 (array!7479) Bool)

(declare-fun array_inv!2286 (array!7481) Bool)

(assert (=> b!178046 (= e!117364 (and tp!15907 tp_is_empty!4171 (array_inv!2285 (_keys!5539 thiss!1248)) (array_inv!2286 (_values!3647 thiss!1248)) e!117361))))

(declare-fun mapNonEmpty!7130 () Bool)

(declare-fun tp!15908 () Bool)

(declare-fun e!117360 () Bool)

(assert (=> mapNonEmpty!7130 (= mapRes!7130 (and tp!15908 e!117360))))

(declare-fun mapKey!7130 () (_ BitVec 32))

(declare-fun mapValue!7130 () ValueCell!1742)

(declare-fun mapRest!7130 () (Array (_ BitVec 32) ValueCell!1742))

(assert (=> mapNonEmpty!7130 (= (arr!3545 (_values!3647 thiss!1248)) (store mapRest!7130 mapKey!7130 mapValue!7130))))

(declare-fun res!84332 () Bool)

(assert (=> start!17864 (=> (not res!84332) (not e!117363))))

(declare-fun valid!1017 (LongMapFixedSize!2392) Bool)

(assert (=> start!17864 (= res!84332 (valid!1017 thiss!1248))))

(assert (=> start!17864 e!117363))

(assert (=> start!17864 e!117364))

(assert (=> start!17864 true))

(declare-fun b!178047 () Bool)

(assert (=> b!178047 (= e!117361 (and e!117359 mapRes!7130))))

(declare-fun condMapEmpty!7130 () Bool)

(declare-fun mapDefault!7130 () ValueCell!1742)

(assert (=> b!178047 (= condMapEmpty!7130 (= (arr!3545 (_values!3647 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1742)) mapDefault!7130)))))

(declare-fun b!178048 () Bool)

(assert (=> b!178048 (= e!117360 tp_is_empty!4171)))

(assert (= (and start!17864 res!84332) b!178045))

(assert (= (and b!178045 res!84330) b!178042))

(assert (= (and b!178042 res!84334) b!178043))

(assert (= (and b!178043 res!84333) b!178044))

(assert (= (and b!178044 res!84331) b!178041))

(assert (= (and b!178047 condMapEmpty!7130) mapIsEmpty!7130))

(assert (= (and b!178047 (not condMapEmpty!7130)) mapNonEmpty!7130))

(assert (= (and mapNonEmpty!7130 ((_ is ValueCellFull!1742) mapValue!7130)) b!178048))

(assert (= (and b!178047 ((_ is ValueCellFull!1742) mapDefault!7130)) b!178040))

(assert (= b!178046 b!178047))

(assert (= start!17864 b!178046))

(declare-fun m!206023 () Bool)

(assert (=> b!178042 m!206023))

(declare-fun m!206025 () Bool)

(assert (=> b!178043 m!206025))

(assert (=> b!178043 m!206025))

(declare-fun m!206027 () Bool)

(assert (=> b!178043 m!206027))

(declare-fun m!206029 () Bool)

(assert (=> b!178044 m!206029))

(declare-fun m!206031 () Bool)

(assert (=> start!17864 m!206031))

(declare-fun m!206033 () Bool)

(assert (=> mapNonEmpty!7130 m!206033))

(declare-fun m!206035 () Bool)

(assert (=> b!178046 m!206035))

(declare-fun m!206037 () Bool)

(assert (=> b!178046 m!206037))

(check-sat b_and!10887 (not b!178044) (not b!178046) tp_is_empty!4171 (not b!178043) (not b!178042) (not start!17864) (not b_next!4399) (not mapNonEmpty!7130))
(check-sat b_and!10887 (not b_next!4399))
(get-model)

(declare-fun d!53781 () Bool)

(assert (=> d!53781 (= (array_inv!2285 (_keys!5539 thiss!1248)) (bvsge (size!3851 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178046 d!53781))

(declare-fun d!53783 () Bool)

(assert (=> d!53783 (= (array_inv!2286 (_values!3647 thiss!1248)) (bvsge (size!3852 (_values!3647 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178046 d!53783))

(declare-fun d!53785 () Bool)

(assert (=> d!53785 (= (validMask!0 (mask!8619 thiss!1248)) (and (or (= (mask!8619 thiss!1248) #b00000000000000000000000000000111) (= (mask!8619 thiss!1248) #b00000000000000000000000000001111) (= (mask!8619 thiss!1248) #b00000000000000000000000000011111) (= (mask!8619 thiss!1248) #b00000000000000000000000000111111) (= (mask!8619 thiss!1248) #b00000000000000000000000001111111) (= (mask!8619 thiss!1248) #b00000000000000000000000011111111) (= (mask!8619 thiss!1248) #b00000000000000000000000111111111) (= (mask!8619 thiss!1248) #b00000000000000000000001111111111) (= (mask!8619 thiss!1248) #b00000000000000000000011111111111) (= (mask!8619 thiss!1248) #b00000000000000000000111111111111) (= (mask!8619 thiss!1248) #b00000000000000000001111111111111) (= (mask!8619 thiss!1248) #b00000000000000000011111111111111) (= (mask!8619 thiss!1248) #b00000000000000000111111111111111) (= (mask!8619 thiss!1248) #b00000000000000001111111111111111) (= (mask!8619 thiss!1248) #b00000000000000011111111111111111) (= (mask!8619 thiss!1248) #b00000000000000111111111111111111) (= (mask!8619 thiss!1248) #b00000000000001111111111111111111) (= (mask!8619 thiss!1248) #b00000000000011111111111111111111) (= (mask!8619 thiss!1248) #b00000000000111111111111111111111) (= (mask!8619 thiss!1248) #b00000000001111111111111111111111) (= (mask!8619 thiss!1248) #b00000000011111111111111111111111) (= (mask!8619 thiss!1248) #b00000000111111111111111111111111) (= (mask!8619 thiss!1248) #b00000001111111111111111111111111) (= (mask!8619 thiss!1248) #b00000011111111111111111111111111) (= (mask!8619 thiss!1248) #b00000111111111111111111111111111) (= (mask!8619 thiss!1248) #b00001111111111111111111111111111) (= (mask!8619 thiss!1248) #b00011111111111111111111111111111) (= (mask!8619 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8619 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178044 d!53785))

(declare-fun d!53787 () Bool)

(declare-fun e!117406 () Bool)

(assert (=> d!53787 e!117406))

(declare-fun res!84367 () Bool)

(assert (=> d!53787 (=> res!84367 e!117406)))

(declare-fun lt!87896 () Bool)

(assert (=> d!53787 (= res!84367 (not lt!87896))))

(declare-fun lt!87894 () Bool)

(assert (=> d!53787 (= lt!87896 lt!87894)))

(declare-datatypes ((Unit!5413 0))(
  ( (Unit!5414) )
))
(declare-fun lt!87895 () Unit!5413)

(declare-fun e!117405 () Unit!5413)

(assert (=> d!53787 (= lt!87895 e!117405)))

(declare-fun c!31909 () Bool)

(assert (=> d!53787 (= c!31909 lt!87894)))

(declare-fun containsKey!200 (List!2261 (_ BitVec 64)) Bool)

(assert (=> d!53787 (= lt!87894 (containsKey!200 (toList!1122 (getCurrentListMap!758 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248))) key!828))))

(assert (=> d!53787 (= (contains!1197 (getCurrentListMap!758 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)) key!828) lt!87896)))

(declare-fun b!178109 () Bool)

(declare-fun lt!87897 () Unit!5413)

(assert (=> b!178109 (= e!117405 lt!87897)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!149 (List!2261 (_ BitVec 64)) Unit!5413)

(assert (=> b!178109 (= lt!87897 (lemmaContainsKeyImpliesGetValueByKeyDefined!149 (toList!1122 (getCurrentListMap!758 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248))) key!828))))

(declare-datatypes ((Option!202 0))(
  ( (Some!201 (v!4010 V!5209)) (None!200) )
))
(declare-fun isDefined!150 (Option!202) Bool)

(declare-fun getValueByKey!196 (List!2261 (_ BitVec 64)) Option!202)

(assert (=> b!178109 (isDefined!150 (getValueByKey!196 (toList!1122 (getCurrentListMap!758 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248))) key!828))))

(declare-fun b!178110 () Bool)

(declare-fun Unit!5415 () Unit!5413)

(assert (=> b!178110 (= e!117405 Unit!5415)))

(declare-fun b!178111 () Bool)

(assert (=> b!178111 (= e!117406 (isDefined!150 (getValueByKey!196 (toList!1122 (getCurrentListMap!758 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248))) key!828)))))

(assert (= (and d!53787 c!31909) b!178109))

(assert (= (and d!53787 (not c!31909)) b!178110))

(assert (= (and d!53787 (not res!84367)) b!178111))

(declare-fun m!206071 () Bool)

(assert (=> d!53787 m!206071))

(declare-fun m!206073 () Bool)

(assert (=> b!178109 m!206073))

(declare-fun m!206075 () Bool)

(assert (=> b!178109 m!206075))

(assert (=> b!178109 m!206075))

(declare-fun m!206077 () Bool)

(assert (=> b!178109 m!206077))

(assert (=> b!178111 m!206075))

(assert (=> b!178111 m!206075))

(assert (=> b!178111 m!206077))

(assert (=> b!178043 d!53787))

(declare-fun d!53789 () Bool)

(declare-fun e!117444 () Bool)

(assert (=> d!53789 e!117444))

(declare-fun res!84390 () Bool)

(assert (=> d!53789 (=> (not res!84390) (not e!117444))))

(assert (=> d!53789 (= res!84390 (or (bvsge #b00000000000000000000000000000000 (size!3851 (_keys!5539 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3851 (_keys!5539 thiss!1248))))))))

(declare-fun lt!87959 () ListLongMap!2213)

(declare-fun lt!87945 () ListLongMap!2213)

(assert (=> d!53789 (= lt!87959 lt!87945)))

(declare-fun lt!87943 () Unit!5413)

(declare-fun e!117441 () Unit!5413)

(assert (=> d!53789 (= lt!87943 e!117441)))

(declare-fun c!31923 () Bool)

(declare-fun e!117439 () Bool)

(assert (=> d!53789 (= c!31923 e!117439)))

(declare-fun res!84392 () Bool)

(assert (=> d!53789 (=> (not res!84392) (not e!117439))))

(assert (=> d!53789 (= res!84392 (bvslt #b00000000000000000000000000000000 (size!3851 (_keys!5539 thiss!1248))))))

(declare-fun e!117443 () ListLongMap!2213)

(assert (=> d!53789 (= lt!87945 e!117443)))

(declare-fun c!31927 () Bool)

(assert (=> d!53789 (= c!31927 (and (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53789 (validMask!0 (mask!8619 thiss!1248))))

(assert (=> d!53789 (= (getCurrentListMap!758 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)) lt!87959)))

(declare-fun bm!17998 () Bool)

(declare-fun call!18001 () ListLongMap!2213)

(declare-fun getCurrentListMapNoExtraKeys!164 (array!7479 array!7481 (_ BitVec 32) (_ BitVec 32) V!5209 V!5209 (_ BitVec 32) Int) ListLongMap!2213)

(assert (=> bm!17998 (= call!18001 (getCurrentListMapNoExtraKeys!164 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun bm!17999 () Bool)

(declare-fun call!18007 () Bool)

(assert (=> bm!17999 (= call!18007 (contains!1197 lt!87959 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178154 () Bool)

(declare-fun e!117442 () Bool)

(declare-fun apply!143 (ListLongMap!2213 (_ BitVec 64)) V!5209)

(assert (=> b!178154 (= e!117442 (= (apply!143 lt!87959 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3505 thiss!1248)))))

(declare-fun b!178155 () Bool)

(declare-fun e!117436 () Bool)

(assert (=> b!178155 (= e!117436 (not call!18007))))

(declare-fun b!178156 () Bool)

(declare-fun Unit!5416 () Unit!5413)

(assert (=> b!178156 (= e!117441 Unit!5416)))

(declare-fun b!178157 () Bool)

(declare-fun e!117440 () Bool)

(assert (=> b!178157 (= e!117436 e!117440)))

(declare-fun res!84389 () Bool)

(assert (=> b!178157 (= res!84389 call!18007)))

(assert (=> b!178157 (=> (not res!84389) (not e!117440))))

(declare-fun b!178158 () Bool)

(declare-fun lt!87947 () Unit!5413)

(assert (=> b!178158 (= e!117441 lt!87947)))

(declare-fun lt!87942 () ListLongMap!2213)

(assert (=> b!178158 (= lt!87942 (getCurrentListMapNoExtraKeys!164 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun lt!87956 () (_ BitVec 64))

(assert (=> b!178158 (= lt!87956 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87954 () (_ BitVec 64))

(assert (=> b!178158 (= lt!87954 (select (arr!3544 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87949 () Unit!5413)

(declare-fun addStillContains!119 (ListLongMap!2213 (_ BitVec 64) V!5209 (_ BitVec 64)) Unit!5413)

(assert (=> b!178158 (= lt!87949 (addStillContains!119 lt!87942 lt!87956 (zeroValue!3505 thiss!1248) lt!87954))))

(declare-fun +!255 (ListLongMap!2213 tuple2!3294) ListLongMap!2213)

(assert (=> b!178158 (contains!1197 (+!255 lt!87942 (tuple2!3295 lt!87956 (zeroValue!3505 thiss!1248))) lt!87954)))

(declare-fun lt!87950 () Unit!5413)

(assert (=> b!178158 (= lt!87950 lt!87949)))

(declare-fun lt!87958 () ListLongMap!2213)

(assert (=> b!178158 (= lt!87958 (getCurrentListMapNoExtraKeys!164 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun lt!87951 () (_ BitVec 64))

(assert (=> b!178158 (= lt!87951 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87961 () (_ BitVec 64))

(assert (=> b!178158 (= lt!87961 (select (arr!3544 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87953 () Unit!5413)

(declare-fun addApplyDifferent!119 (ListLongMap!2213 (_ BitVec 64) V!5209 (_ BitVec 64)) Unit!5413)

(assert (=> b!178158 (= lt!87953 (addApplyDifferent!119 lt!87958 lt!87951 (minValue!3505 thiss!1248) lt!87961))))

(assert (=> b!178158 (= (apply!143 (+!255 lt!87958 (tuple2!3295 lt!87951 (minValue!3505 thiss!1248))) lt!87961) (apply!143 lt!87958 lt!87961))))

(declare-fun lt!87957 () Unit!5413)

(assert (=> b!178158 (= lt!87957 lt!87953)))

(declare-fun lt!87955 () ListLongMap!2213)

(assert (=> b!178158 (= lt!87955 (getCurrentListMapNoExtraKeys!164 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun lt!87948 () (_ BitVec 64))

(assert (=> b!178158 (= lt!87948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87960 () (_ BitVec 64))

(assert (=> b!178158 (= lt!87960 (select (arr!3544 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87963 () Unit!5413)

(assert (=> b!178158 (= lt!87963 (addApplyDifferent!119 lt!87955 lt!87948 (zeroValue!3505 thiss!1248) lt!87960))))

(assert (=> b!178158 (= (apply!143 (+!255 lt!87955 (tuple2!3295 lt!87948 (zeroValue!3505 thiss!1248))) lt!87960) (apply!143 lt!87955 lt!87960))))

(declare-fun lt!87946 () Unit!5413)

(assert (=> b!178158 (= lt!87946 lt!87963)))

(declare-fun lt!87952 () ListLongMap!2213)

(assert (=> b!178158 (= lt!87952 (getCurrentListMapNoExtraKeys!164 (_keys!5539 thiss!1248) (_values!3647 thiss!1248) (mask!8619 thiss!1248) (extraKeys!3401 thiss!1248) (zeroValue!3505 thiss!1248) (minValue!3505 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3664 thiss!1248)))))

(declare-fun lt!87944 () (_ BitVec 64))

(assert (=> b!178158 (= lt!87944 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87962 () (_ BitVec 64))

(assert (=> b!178158 (= lt!87962 (select (arr!3544 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178158 (= lt!87947 (addApplyDifferent!119 lt!87952 lt!87944 (minValue!3505 thiss!1248) lt!87962))))

(assert (=> b!178158 (= (apply!143 (+!255 lt!87952 (tuple2!3295 lt!87944 (minValue!3505 thiss!1248))) lt!87962) (apply!143 lt!87952 lt!87962))))

(declare-fun b!178159 () Bool)

(declare-fun e!117438 () ListLongMap!2213)

(declare-fun call!18005 () ListLongMap!2213)

(assert (=> b!178159 (= e!117438 call!18005)))

(declare-fun b!178160 () Bool)

(assert (=> b!178160 (= e!117440 (= (apply!143 lt!87959 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3505 thiss!1248)))))

(declare-fun b!178161 () Bool)

(declare-fun e!117433 () Bool)

(assert (=> b!178161 (= e!117433 e!117442)))

(declare-fun res!84386 () Bool)

(declare-fun call!18002 () Bool)

(assert (=> b!178161 (= res!84386 call!18002)))

(assert (=> b!178161 (=> (not res!84386) (not e!117442))))

(declare-fun bm!18000 () Bool)

(declare-fun call!18003 () ListLongMap!2213)

(assert (=> bm!18000 (= call!18003 call!18001)))

(declare-fun b!178162 () Bool)

(declare-fun e!117445 () ListLongMap!2213)

(assert (=> b!178162 (= e!117443 e!117445)))

(declare-fun c!31924 () Bool)

(assert (=> b!178162 (= c!31924 (and (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18001 () Bool)

(assert (=> bm!18001 (= call!18002 (contains!1197 lt!87959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178163 () Bool)

(declare-fun res!84391 () Bool)

(assert (=> b!178163 (=> (not res!84391) (not e!117444))))

(declare-fun e!117437 () Bool)

(assert (=> b!178163 (= res!84391 e!117437)))

(declare-fun res!84394 () Bool)

(assert (=> b!178163 (=> res!84394 e!117437)))

(declare-fun e!117435 () Bool)

(assert (=> b!178163 (= res!84394 (not e!117435))))

(declare-fun res!84387 () Bool)

(assert (=> b!178163 (=> (not res!84387) (not e!117435))))

(assert (=> b!178163 (= res!84387 (bvslt #b00000000000000000000000000000000 (size!3851 (_keys!5539 thiss!1248))))))

(declare-fun b!178164 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178164 (= e!117435 (validKeyInArray!0 (select (arr!3544 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18002 () Bool)

(declare-fun call!18004 () ListLongMap!2213)

(declare-fun call!18006 () ListLongMap!2213)

(assert (=> bm!18002 (= call!18006 (+!255 (ite c!31927 call!18001 (ite c!31924 call!18003 call!18004)) (ite (or c!31927 c!31924) (tuple2!3295 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3505 thiss!1248)) (tuple2!3295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3505 thiss!1248)))))))

(declare-fun b!178165 () Bool)

(assert (=> b!178165 (= e!117445 call!18005)))

(declare-fun b!178166 () Bool)

(declare-fun e!117434 () Bool)

(declare-fun get!2026 (ValueCell!1742 V!5209) V!5209)

(declare-fun dynLambda!477 (Int (_ BitVec 64)) V!5209)

(assert (=> b!178166 (= e!117434 (= (apply!143 lt!87959 (select (arr!3544 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000)) (get!2026 (select (arr!3545 (_values!3647 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!477 (defaultEntry!3664 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178166 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3852 (_values!3647 thiss!1248))))))

(assert (=> b!178166 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3851 (_keys!5539 thiss!1248))))))

(declare-fun b!178167 () Bool)

(assert (=> b!178167 (= e!117438 call!18004)))

(declare-fun bm!18003 () Bool)

(assert (=> bm!18003 (= call!18005 call!18006)))

(declare-fun bm!18004 () Bool)

(assert (=> bm!18004 (= call!18004 call!18003)))

(declare-fun b!178168 () Bool)

(assert (=> b!178168 (= e!117437 e!117434)))

(declare-fun res!84393 () Bool)

(assert (=> b!178168 (=> (not res!84393) (not e!117434))))

(assert (=> b!178168 (= res!84393 (contains!1197 lt!87959 (select (arr!3544 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3851 (_keys!5539 thiss!1248))))))

(declare-fun b!178169 () Bool)

(assert (=> b!178169 (= e!117444 e!117436)))

(declare-fun c!31925 () Bool)

(assert (=> b!178169 (= c!31925 (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178170 () Bool)

(assert (=> b!178170 (= e!117439 (validKeyInArray!0 (select (arr!3544 (_keys!5539 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178171 () Bool)

(declare-fun res!84388 () Bool)

(assert (=> b!178171 (=> (not res!84388) (not e!117444))))

(assert (=> b!178171 (= res!84388 e!117433)))

(declare-fun c!31922 () Bool)

(assert (=> b!178171 (= c!31922 (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!178172 () Bool)

(assert (=> b!178172 (= e!117443 (+!255 call!18006 (tuple2!3295 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3505 thiss!1248))))))

(declare-fun b!178173 () Bool)

(assert (=> b!178173 (= e!117433 (not call!18002))))

(declare-fun b!178174 () Bool)

(declare-fun c!31926 () Bool)

(assert (=> b!178174 (= c!31926 (and (not (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3401 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!178174 (= e!117445 e!117438)))

(assert (= (and d!53789 c!31927) b!178172))

(assert (= (and d!53789 (not c!31927)) b!178162))

(assert (= (and b!178162 c!31924) b!178165))

(assert (= (and b!178162 (not c!31924)) b!178174))

(assert (= (and b!178174 c!31926) b!178159))

(assert (= (and b!178174 (not c!31926)) b!178167))

(assert (= (or b!178159 b!178167) bm!18004))

(assert (= (or b!178165 bm!18004) bm!18000))

(assert (= (or b!178165 b!178159) bm!18003))

(assert (= (or b!178172 bm!18000) bm!17998))

(assert (= (or b!178172 bm!18003) bm!18002))

(assert (= (and d!53789 res!84392) b!178170))

(assert (= (and d!53789 c!31923) b!178158))

(assert (= (and d!53789 (not c!31923)) b!178156))

(assert (= (and d!53789 res!84390) b!178163))

(assert (= (and b!178163 res!84387) b!178164))

(assert (= (and b!178163 (not res!84394)) b!178168))

(assert (= (and b!178168 res!84393) b!178166))

(assert (= (and b!178163 res!84391) b!178171))

(assert (= (and b!178171 c!31922) b!178161))

(assert (= (and b!178171 (not c!31922)) b!178173))

(assert (= (and b!178161 res!84386) b!178154))

(assert (= (or b!178161 b!178173) bm!18001))

(assert (= (and b!178171 res!84388) b!178169))

(assert (= (and b!178169 c!31925) b!178157))

(assert (= (and b!178169 (not c!31925)) b!178155))

(assert (= (and b!178157 res!84389) b!178160))

(assert (= (or b!178157 b!178155) bm!17999))

(declare-fun b_lambda!7061 () Bool)

(assert (=> (not b_lambda!7061) (not b!178166)))

(declare-fun t!7091 () Bool)

(declare-fun tb!2789 () Bool)

(assert (=> (and b!178046 (= (defaultEntry!3664 thiss!1248) (defaultEntry!3664 thiss!1248)) t!7091) tb!2789))

(declare-fun result!4657 () Bool)

(assert (=> tb!2789 (= result!4657 tp_is_empty!4171)))

(assert (=> b!178166 t!7091))

(declare-fun b_and!10893 () Bool)

(assert (= b_and!10887 (and (=> t!7091 result!4657) b_and!10893)))

(declare-fun m!206079 () Bool)

(assert (=> b!178154 m!206079))

(declare-fun m!206081 () Bool)

(assert (=> bm!18002 m!206081))

(declare-fun m!206083 () Bool)

(assert (=> b!178164 m!206083))

(assert (=> b!178164 m!206083))

(declare-fun m!206085 () Bool)

(assert (=> b!178164 m!206085))

(declare-fun m!206087 () Bool)

(assert (=> b!178160 m!206087))

(declare-fun m!206089 () Bool)

(assert (=> bm!17998 m!206089))

(assert (=> b!178166 m!206083))

(declare-fun m!206091 () Bool)

(assert (=> b!178166 m!206091))

(declare-fun m!206093 () Bool)

(assert (=> b!178166 m!206093))

(assert (=> b!178166 m!206083))

(declare-fun m!206095 () Bool)

(assert (=> b!178166 m!206095))

(assert (=> b!178166 m!206093))

(assert (=> b!178166 m!206095))

(declare-fun m!206097 () Bool)

(assert (=> b!178166 m!206097))

(assert (=> b!178170 m!206083))

(assert (=> b!178170 m!206083))

(assert (=> b!178170 m!206085))

(declare-fun m!206099 () Bool)

(assert (=> bm!18001 m!206099))

(assert (=> b!178168 m!206083))

(assert (=> b!178168 m!206083))

(declare-fun m!206101 () Bool)

(assert (=> b!178168 m!206101))

(declare-fun m!206103 () Bool)

(assert (=> bm!17999 m!206103))

(declare-fun m!206105 () Bool)

(assert (=> b!178172 m!206105))

(assert (=> d!53789 m!206029))

(assert (=> b!178158 m!206089))

(declare-fun m!206107 () Bool)

(assert (=> b!178158 m!206107))

(assert (=> b!178158 m!206107))

(declare-fun m!206109 () Bool)

(assert (=> b!178158 m!206109))

(declare-fun m!206111 () Bool)

(assert (=> b!178158 m!206111))

(declare-fun m!206113 () Bool)

(assert (=> b!178158 m!206113))

(declare-fun m!206115 () Bool)

(assert (=> b!178158 m!206115))

(declare-fun m!206117 () Bool)

(assert (=> b!178158 m!206117))

(declare-fun m!206119 () Bool)

(assert (=> b!178158 m!206119))

(assert (=> b!178158 m!206083))

(declare-fun m!206121 () Bool)

(assert (=> b!178158 m!206121))

(declare-fun m!206123 () Bool)

(assert (=> b!178158 m!206123))

(declare-fun m!206125 () Bool)

(assert (=> b!178158 m!206125))

(assert (=> b!178158 m!206111))

(declare-fun m!206127 () Bool)

(assert (=> b!178158 m!206127))

(declare-fun m!206129 () Bool)

(assert (=> b!178158 m!206129))

(declare-fun m!206131 () Bool)

(assert (=> b!178158 m!206131))

(assert (=> b!178158 m!206123))

(declare-fun m!206133 () Bool)

(assert (=> b!178158 m!206133))

(declare-fun m!206135 () Bool)

(assert (=> b!178158 m!206135))

(assert (=> b!178158 m!206129))

(assert (=> b!178043 d!53789))

(declare-fun d!53791 () Bool)

(declare-fun res!84401 () Bool)

(declare-fun e!117448 () Bool)

(assert (=> d!53791 (=> (not res!84401) (not e!117448))))

(declare-fun simpleValid!157 (LongMapFixedSize!2392) Bool)

(assert (=> d!53791 (= res!84401 (simpleValid!157 thiss!1248))))

(assert (=> d!53791 (= (valid!1017 thiss!1248) e!117448)))

(declare-fun b!178183 () Bool)

(declare-fun res!84402 () Bool)

(assert (=> b!178183 (=> (not res!84402) (not e!117448))))

(declare-fun arrayCountValidKeys!0 (array!7479 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178183 (= res!84402 (= (arrayCountValidKeys!0 (_keys!5539 thiss!1248) #b00000000000000000000000000000000 (size!3851 (_keys!5539 thiss!1248))) (_size!1245 thiss!1248)))))

(declare-fun b!178184 () Bool)

(declare-fun res!84403 () Bool)

(assert (=> b!178184 (=> (not res!84403) (not e!117448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7479 (_ BitVec 32)) Bool)

(assert (=> b!178184 (= res!84403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5539 thiss!1248) (mask!8619 thiss!1248)))))

(declare-fun b!178185 () Bool)

(declare-datatypes ((List!2263 0))(
  ( (Nil!2260) (Cons!2259 (h!2882 (_ BitVec 64)) (t!7092 List!2263)) )
))
(declare-fun arrayNoDuplicates!0 (array!7479 (_ BitVec 32) List!2263) Bool)

(assert (=> b!178185 (= e!117448 (arrayNoDuplicates!0 (_keys!5539 thiss!1248) #b00000000000000000000000000000000 Nil!2260))))

(assert (= (and d!53791 res!84401) b!178183))

(assert (= (and b!178183 res!84402) b!178184))

(assert (= (and b!178184 res!84403) b!178185))

(declare-fun m!206137 () Bool)

(assert (=> d!53791 m!206137))

(declare-fun m!206139 () Bool)

(assert (=> b!178183 m!206139))

(declare-fun m!206141 () Bool)

(assert (=> b!178184 m!206141))

(declare-fun m!206143 () Bool)

(assert (=> b!178185 m!206143))

(assert (=> start!17864 d!53791))

(declare-fun b!178198 () Bool)

(declare-fun e!117455 () SeekEntryResult!582)

(declare-fun lt!87970 () SeekEntryResult!582)

(assert (=> b!178198 (= e!117455 (MissingZero!582 (index!4498 lt!87970)))))

(declare-fun b!178199 () Bool)

(declare-fun e!117457 () SeekEntryResult!582)

(declare-fun e!117456 () SeekEntryResult!582)

(assert (=> b!178199 (= e!117457 e!117456)))

(declare-fun lt!87971 () (_ BitVec 64))

(assert (=> b!178199 (= lt!87971 (select (arr!3544 (_keys!5539 thiss!1248)) (index!4498 lt!87970)))))

(declare-fun c!31934 () Bool)

(assert (=> b!178199 (= c!31934 (= lt!87971 key!828))))

(declare-fun b!178200 () Bool)

(assert (=> b!178200 (= e!117457 Undefined!582)))

(declare-fun d!53793 () Bool)

(declare-fun lt!87972 () SeekEntryResult!582)

(assert (=> d!53793 (and (or ((_ is Undefined!582) lt!87972) (not ((_ is Found!582) lt!87972)) (and (bvsge (index!4497 lt!87972) #b00000000000000000000000000000000) (bvslt (index!4497 lt!87972) (size!3851 (_keys!5539 thiss!1248))))) (or ((_ is Undefined!582) lt!87972) ((_ is Found!582) lt!87972) (not ((_ is MissingZero!582) lt!87972)) (and (bvsge (index!4496 lt!87972) #b00000000000000000000000000000000) (bvslt (index!4496 lt!87972) (size!3851 (_keys!5539 thiss!1248))))) (or ((_ is Undefined!582) lt!87972) ((_ is Found!582) lt!87972) ((_ is MissingZero!582) lt!87972) (not ((_ is MissingVacant!582) lt!87972)) (and (bvsge (index!4499 lt!87972) #b00000000000000000000000000000000) (bvslt (index!4499 lt!87972) (size!3851 (_keys!5539 thiss!1248))))) (or ((_ is Undefined!582) lt!87972) (ite ((_ is Found!582) lt!87972) (= (select (arr!3544 (_keys!5539 thiss!1248)) (index!4497 lt!87972)) key!828) (ite ((_ is MissingZero!582) lt!87972) (= (select (arr!3544 (_keys!5539 thiss!1248)) (index!4496 lt!87972)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!582) lt!87972) (= (select (arr!3544 (_keys!5539 thiss!1248)) (index!4499 lt!87972)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53793 (= lt!87972 e!117457)))

(declare-fun c!31936 () Bool)

(assert (=> d!53793 (= c!31936 (and ((_ is Intermediate!582) lt!87970) (undefined!1394 lt!87970)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7479 (_ BitVec 32)) SeekEntryResult!582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53793 (= lt!87970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8619 thiss!1248)) key!828 (_keys!5539 thiss!1248) (mask!8619 thiss!1248)))))

(assert (=> d!53793 (validMask!0 (mask!8619 thiss!1248))))

(assert (=> d!53793 (= (seekEntryOrOpen!0 key!828 (_keys!5539 thiss!1248) (mask!8619 thiss!1248)) lt!87972)))

(declare-fun b!178201 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7479 (_ BitVec 32)) SeekEntryResult!582)

(assert (=> b!178201 (= e!117455 (seekKeyOrZeroReturnVacant!0 (x!19531 lt!87970) (index!4498 lt!87970) (index!4498 lt!87970) key!828 (_keys!5539 thiss!1248) (mask!8619 thiss!1248)))))

(declare-fun b!178202 () Bool)

(declare-fun c!31935 () Bool)

(assert (=> b!178202 (= c!31935 (= lt!87971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178202 (= e!117456 e!117455)))

(declare-fun b!178203 () Bool)

(assert (=> b!178203 (= e!117456 (Found!582 (index!4498 lt!87970)))))

(assert (= (and d!53793 c!31936) b!178200))

(assert (= (and d!53793 (not c!31936)) b!178199))

(assert (= (and b!178199 c!31934) b!178203))

(assert (= (and b!178199 (not c!31934)) b!178202))

(assert (= (and b!178202 c!31935) b!178198))

(assert (= (and b!178202 (not c!31935)) b!178201))

(declare-fun m!206145 () Bool)

(assert (=> b!178199 m!206145))

(assert (=> d!53793 m!206029))

(declare-fun m!206147 () Bool)

(assert (=> d!53793 m!206147))

(declare-fun m!206149 () Bool)

(assert (=> d!53793 m!206149))

(declare-fun m!206151 () Bool)

(assert (=> d!53793 m!206151))

(assert (=> d!53793 m!206149))

(declare-fun m!206153 () Bool)

(assert (=> d!53793 m!206153))

(declare-fun m!206155 () Bool)

(assert (=> d!53793 m!206155))

(declare-fun m!206157 () Bool)

(assert (=> b!178201 m!206157))

(assert (=> b!178042 d!53793))

(declare-fun condMapEmpty!7139 () Bool)

(declare-fun mapDefault!7139 () ValueCell!1742)

(assert (=> mapNonEmpty!7130 (= condMapEmpty!7139 (= mapRest!7130 ((as const (Array (_ BitVec 32) ValueCell!1742)) mapDefault!7139)))))

(declare-fun e!117462 () Bool)

(declare-fun mapRes!7139 () Bool)

(assert (=> mapNonEmpty!7130 (= tp!15908 (and e!117462 mapRes!7139))))

(declare-fun b!178211 () Bool)

(assert (=> b!178211 (= e!117462 tp_is_empty!4171)))

(declare-fun mapIsEmpty!7139 () Bool)

(assert (=> mapIsEmpty!7139 mapRes!7139))

(declare-fun mapNonEmpty!7139 () Bool)

(declare-fun tp!15923 () Bool)

(declare-fun e!117463 () Bool)

(assert (=> mapNonEmpty!7139 (= mapRes!7139 (and tp!15923 e!117463))))

(declare-fun mapValue!7139 () ValueCell!1742)

(declare-fun mapRest!7139 () (Array (_ BitVec 32) ValueCell!1742))

(declare-fun mapKey!7139 () (_ BitVec 32))

(assert (=> mapNonEmpty!7139 (= mapRest!7130 (store mapRest!7139 mapKey!7139 mapValue!7139))))

(declare-fun b!178210 () Bool)

(assert (=> b!178210 (= e!117463 tp_is_empty!4171)))

(assert (= (and mapNonEmpty!7130 condMapEmpty!7139) mapIsEmpty!7139))

(assert (= (and mapNonEmpty!7130 (not condMapEmpty!7139)) mapNonEmpty!7139))

(assert (= (and mapNonEmpty!7139 ((_ is ValueCellFull!1742) mapValue!7139)) b!178210))

(assert (= (and mapNonEmpty!7130 ((_ is ValueCellFull!1742) mapDefault!7139)) b!178211))

(declare-fun m!206159 () Bool)

(assert (=> mapNonEmpty!7139 m!206159))

(declare-fun b_lambda!7063 () Bool)

(assert (= b_lambda!7061 (or (and b!178046 b_free!4399) b_lambda!7063)))

(check-sat (not b!178185) (not mapNonEmpty!7139) (not bm!17999) (not b!178184) b_and!10893 (not b!178111) (not d!53789) (not b!178166) (not b!178170) (not bm!18002) (not b!178154) (not b!178109) (not b!178160) (not b_next!4399) (not b!178158) (not b!178183) (not b!178172) (not b!178164) (not b!178168) (not d!53793) (not d!53787) (not bm!18001) tp_is_empty!4171 (not b!178201) (not bm!17998) (not d!53791) (not b_lambda!7063))
(check-sat b_and!10893 (not b_next!4399))
