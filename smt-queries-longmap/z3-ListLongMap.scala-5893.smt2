; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76032 () Bool)

(assert start!76032)

(declare-fun b!893877 () Bool)

(declare-fun b_free!15861 () Bool)

(declare-fun b_next!15861 () Bool)

(assert (=> b!893877 (= b_free!15861 (not b_next!15861))))

(declare-fun tp!55562 () Bool)

(declare-fun b_and!26137 () Bool)

(assert (=> b!893877 (= tp!55562 b_and!26137)))

(declare-fun b!893875 () Bool)

(declare-fun e!499231 () Bool)

(declare-fun e!499235 () Bool)

(declare-fun mapRes!28849 () Bool)

(assert (=> b!893875 (= e!499231 (and e!499235 mapRes!28849))))

(declare-fun condMapEmpty!28849 () Bool)

(declare-datatypes ((array!52364 0))(
  ( (array!52365 (arr!25185 (Array (_ BitVec 32) (_ BitVec 64))) (size!25630 (_ BitVec 32))) )
))
(declare-datatypes ((V!29217 0))(
  ( (V!29218 (val!9145 Int)) )
))
(declare-datatypes ((ValueCell!8613 0))(
  ( (ValueCellFull!8613 (v!11630 V!29217)) (EmptyCell!8613) )
))
(declare-datatypes ((array!52366 0))(
  ( (array!52367 (arr!25186 (Array (_ BitVec 32) ValueCell!8613)) (size!25631 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4242 0))(
  ( (LongMapFixedSize!4243 (defaultEntry!5327 Int) (mask!25871 (_ BitVec 32)) (extraKeys!5023 (_ BitVec 32)) (zeroValue!5127 V!29217) (minValue!5127 V!29217) (_size!2176 (_ BitVec 32)) (_keys!10019 array!52364) (_values!5314 array!52366) (_vacant!2176 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4242)

(declare-fun mapDefault!28849 () ValueCell!8613)

(assert (=> b!893875 (= condMapEmpty!28849 (= (arr!25186 (_values!5314 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8613)) mapDefault!28849)))))

(declare-fun b!893876 () Bool)

(declare-fun e!499233 () Bool)

(declare-fun tp_is_empty!18189 () Bool)

(assert (=> b!893876 (= e!499233 tp_is_empty!18189)))

(declare-fun mapNonEmpty!28849 () Bool)

(declare-fun tp!55563 () Bool)

(assert (=> mapNonEmpty!28849 (= mapRes!28849 (and tp!55563 e!499233))))

(declare-fun mapRest!28849 () (Array (_ BitVec 32) ValueCell!8613))

(declare-fun mapKey!28849 () (_ BitVec 32))

(declare-fun mapValue!28849 () ValueCell!8613)

(assert (=> mapNonEmpty!28849 (= (arr!25186 (_values!5314 thiss!1181)) (store mapRest!28849 mapKey!28849 mapValue!28849))))

(declare-fun e!499230 () Bool)

(declare-fun array_inv!19776 (array!52364) Bool)

(declare-fun array_inv!19777 (array!52366) Bool)

(assert (=> b!893877 (= e!499230 (and tp!55562 tp_is_empty!18189 (array_inv!19776 (_keys!10019 thiss!1181)) (array_inv!19777 (_values!5314 thiss!1181)) e!499231))))

(declare-fun b!893878 () Bool)

(declare-fun e!499234 () Bool)

(declare-fun e!499236 () Bool)

(assert (=> b!893878 (= e!499234 e!499236)))

(declare-fun c!94240 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4386 (LongMapFixedSize!4242 (_ BitVec 64)) Bool)

(assert (=> b!893878 (= c!94240 (contains!4386 thiss!1181 key!785))))

(declare-fun res!605157 () Bool)

(assert (=> start!76032 (=> (not res!605157) (not e!499234))))

(declare-fun valid!1638 (LongMapFixedSize!4242) Bool)

(assert (=> start!76032 (= res!605157 (valid!1638 thiss!1181))))

(assert (=> start!76032 e!499234))

(assert (=> start!76032 e!499230))

(assert (=> start!76032 true))

(declare-fun b!893874 () Bool)

(declare-datatypes ((Option!457 0))(
  ( (Some!456 (v!11631 V!29217)) (None!455) )
))
(declare-fun get!13262 (Option!457) V!29217)

(declare-datatypes ((tuple2!12022 0))(
  ( (tuple2!12023 (_1!6022 (_ BitVec 64)) (_2!6022 V!29217)) )
))
(declare-datatypes ((List!17801 0))(
  ( (Nil!17798) (Cons!17797 (h!18929 tuple2!12022) (t!25130 List!17801)) )
))
(declare-fun getValueByKey!451 (List!17801 (_ BitVec 64)) Option!457)

(declare-datatypes ((ListLongMap!10719 0))(
  ( (ListLongMap!10720 (toList!5375 List!17801)) )
))
(declare-fun map!12220 (LongMapFixedSize!4242) ListLongMap!10719)

(assert (=> b!893874 (= e!499236 (not (= (minValue!5127 thiss!1181) (get!13262 (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785)))))))

(declare-fun b!893879 () Bool)

(declare-fun dynLambda!1299 (Int (_ BitVec 64)) V!29217)

(assert (=> b!893879 (= e!499236 (not (= (minValue!5127 thiss!1181) (dynLambda!1299 (defaultEntry!5327 thiss!1181) key!785))))))

(declare-fun b!893880 () Bool)

(declare-fun res!605156 () Bool)

(assert (=> b!893880 (=> (not res!605156) (not e!499234))))

(assert (=> b!893880 (= res!605156 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!893881 () Bool)

(assert (=> b!893881 (= e!499235 tp_is_empty!18189)))

(declare-fun mapIsEmpty!28849 () Bool)

(assert (=> mapIsEmpty!28849 mapRes!28849))

(assert (= (and start!76032 res!605157) b!893880))

(assert (= (and b!893880 res!605156) b!893878))

(assert (= (and b!893878 c!94240) b!893874))

(assert (= (and b!893878 (not c!94240)) b!893879))

(assert (= (and b!893875 condMapEmpty!28849) mapIsEmpty!28849))

(assert (= (and b!893875 (not condMapEmpty!28849)) mapNonEmpty!28849))

(get-info :version)

(assert (= (and mapNonEmpty!28849 ((_ is ValueCellFull!8613) mapValue!28849)) b!893876))

(assert (= (and b!893875 ((_ is ValueCellFull!8613) mapDefault!28849)) b!893881))

(assert (= b!893877 b!893875))

(assert (= start!76032 b!893877))

(declare-fun b_lambda!12933 () Bool)

(assert (=> (not b_lambda!12933) (not b!893879)))

(declare-fun t!25129 () Bool)

(declare-fun tb!5179 () Bool)

(assert (=> (and b!893877 (= (defaultEntry!5327 thiss!1181) (defaultEntry!5327 thiss!1181)) t!25129) tb!5179))

(declare-fun result!10073 () Bool)

(assert (=> tb!5179 (= result!10073 tp_is_empty!18189)))

(assert (=> b!893879 t!25129))

(declare-fun b_and!26139 () Bool)

(assert (= b_and!26137 (and (=> t!25129 result!10073) b_and!26139)))

(declare-fun m!831943 () Bool)

(assert (=> b!893878 m!831943))

(declare-fun m!831945 () Bool)

(assert (=> b!893877 m!831945))

(declare-fun m!831947 () Bool)

(assert (=> b!893877 m!831947))

(declare-fun m!831949 () Bool)

(assert (=> b!893879 m!831949))

(declare-fun m!831951 () Bool)

(assert (=> mapNonEmpty!28849 m!831951))

(declare-fun m!831953 () Bool)

(assert (=> start!76032 m!831953))

(declare-fun m!831955 () Bool)

(assert (=> b!893874 m!831955))

(declare-fun m!831957 () Bool)

(assert (=> b!893874 m!831957))

(assert (=> b!893874 m!831957))

(declare-fun m!831959 () Bool)

(assert (=> b!893874 m!831959))

(check-sat (not b!893874) (not b!893877) b_and!26139 (not b_next!15861) (not start!76032) tp_is_empty!18189 (not b_lambda!12933) (not mapNonEmpty!28849) (not b!893878))
(check-sat b_and!26139 (not b_next!15861))
(get-model)

(declare-fun b_lambda!12937 () Bool)

(assert (= b_lambda!12933 (or (and b!893877 b_free!15861) b_lambda!12937)))

(check-sat (not b_lambda!12937) (not b!893874) (not b!893877) b_and!26139 (not b_next!15861) (not start!76032) tp_is_empty!18189 (not mapNonEmpty!28849) (not b!893878))
(check-sat b_and!26139 (not b_next!15861))
(get-model)

(declare-fun d!110471 () Bool)

(assert (=> d!110471 (= (array_inv!19776 (_keys!10019 thiss!1181)) (bvsge (size!25630 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893877 d!110471))

(declare-fun d!110473 () Bool)

(assert (=> d!110473 (= (array_inv!19777 (_values!5314 thiss!1181)) (bvsge (size!25631 (_values!5314 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893877 d!110473))

(declare-fun d!110475 () Bool)

(declare-fun res!605170 () Bool)

(declare-fun e!499260 () Bool)

(assert (=> d!110475 (=> (not res!605170) (not e!499260))))

(declare-fun simpleValid!298 (LongMapFixedSize!4242) Bool)

(assert (=> d!110475 (= res!605170 (simpleValid!298 thiss!1181))))

(assert (=> d!110475 (= (valid!1638 thiss!1181) e!499260)))

(declare-fun b!893916 () Bool)

(declare-fun res!605171 () Bool)

(assert (=> b!893916 (=> (not res!605171) (not e!499260))))

(declare-fun arrayCountValidKeys!0 (array!52364 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893916 (= res!605171 (= (arrayCountValidKeys!0 (_keys!10019 thiss!1181) #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))) (_size!2176 thiss!1181)))))

(declare-fun b!893917 () Bool)

(declare-fun res!605172 () Bool)

(assert (=> b!893917 (=> (not res!605172) (not e!499260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52364 (_ BitVec 32)) Bool)

(assert (=> b!893917 (= res!605172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!893918 () Bool)

(declare-datatypes ((List!17803 0))(
  ( (Nil!17800) (Cons!17799 (h!18931 (_ BitVec 64)) (t!25134 List!17803)) )
))
(declare-fun arrayNoDuplicates!0 (array!52364 (_ BitVec 32) List!17803) Bool)

(assert (=> b!893918 (= e!499260 (arrayNoDuplicates!0 (_keys!10019 thiss!1181) #b00000000000000000000000000000000 Nil!17800))))

(assert (= (and d!110475 res!605170) b!893916))

(assert (= (and b!893916 res!605171) b!893917))

(assert (= (and b!893917 res!605172) b!893918))

(declare-fun m!831979 () Bool)

(assert (=> d!110475 m!831979))

(declare-fun m!831981 () Bool)

(assert (=> b!893916 m!831981))

(declare-fun m!831983 () Bool)

(assert (=> b!893917 m!831983))

(declare-fun m!831985 () Bool)

(assert (=> b!893918 m!831985))

(assert (=> start!76032 d!110475))

(declare-fun d!110477 () Bool)

(assert (=> d!110477 (= (get!13262 (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785)) (v!11631 (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785)))))

(assert (=> b!893874 d!110477))

(declare-fun d!110479 () Bool)

(declare-fun c!94248 () Bool)

(assert (=> d!110479 (= c!94248 (and ((_ is Cons!17797) (toList!5375 (map!12220 thiss!1181))) (= (_1!6022 (h!18929 (toList!5375 (map!12220 thiss!1181)))) key!785)))))

(declare-fun e!499265 () Option!457)

(assert (=> d!110479 (= (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785) e!499265)))

(declare-fun b!893927 () Bool)

(assert (=> b!893927 (= e!499265 (Some!456 (_2!6022 (h!18929 (toList!5375 (map!12220 thiss!1181))))))))

(declare-fun b!893930 () Bool)

(declare-fun e!499266 () Option!457)

(assert (=> b!893930 (= e!499266 None!455)))

(declare-fun b!893929 () Bool)

(assert (=> b!893929 (= e!499266 (getValueByKey!451 (t!25130 (toList!5375 (map!12220 thiss!1181))) key!785))))

(declare-fun b!893928 () Bool)

(assert (=> b!893928 (= e!499265 e!499266)))

(declare-fun c!94249 () Bool)

(assert (=> b!893928 (= c!94249 (and ((_ is Cons!17797) (toList!5375 (map!12220 thiss!1181))) (not (= (_1!6022 (h!18929 (toList!5375 (map!12220 thiss!1181)))) key!785))))))

(assert (= (and d!110479 c!94248) b!893927))

(assert (= (and d!110479 (not c!94248)) b!893928))

(assert (= (and b!893928 c!94249) b!893929))

(assert (= (and b!893928 (not c!94249)) b!893930))

(declare-fun m!831987 () Bool)

(assert (=> b!893929 m!831987))

(assert (=> b!893874 d!110479))

(declare-fun d!110481 () Bool)

(declare-fun getCurrentListMap!2651 (array!52364 array!52366 (_ BitVec 32) (_ BitVec 32) V!29217 V!29217 (_ BitVec 32) Int) ListLongMap!10719)

(assert (=> d!110481 (= (map!12220 thiss!1181) (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)))))

(declare-fun bs!25098 () Bool)

(assert (= bs!25098 d!110481))

(declare-fun m!831989 () Bool)

(assert (=> bs!25098 m!831989))

(assert (=> b!893874 d!110481))

(declare-fun b!893951 () Bool)

(declare-fun c!94264 () Bool)

(declare-datatypes ((SeekEntryResult!8864 0))(
  ( (MissingZero!8864 (index!37827 (_ BitVec 32))) (Found!8864 (index!37828 (_ BitVec 32))) (Intermediate!8864 (undefined!9676 Bool) (index!37829 (_ BitVec 32)) (x!76000 (_ BitVec 32))) (Undefined!8864) (MissingVacant!8864 (index!37830 (_ BitVec 32))) )
))
(declare-fun lt!403978 () SeekEntryResult!8864)

(assert (=> b!893951 (= c!94264 ((_ is Found!8864) lt!403978))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52364 (_ BitVec 32)) SeekEntryResult!8864)

(assert (=> b!893951 (= lt!403978 (seekEntry!0 key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun e!499277 () Bool)

(declare-fun e!499280 () Bool)

(assert (=> b!893951 (= e!499277 e!499280)))

(declare-fun b!893952 () Bool)

(assert (=> b!893952 (= e!499280 true)))

(declare-datatypes ((Unit!30438 0))(
  ( (Unit!30439) )
))
(declare-fun lt!403970 () Unit!30438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52364 (_ BitVec 64) (_ BitVec 32)) Unit!30438)

(assert (=> b!893952 (= lt!403970 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10019 thiss!1181) key!785 (index!37828 lt!403978)))))

(declare-fun call!39671 () Bool)

(assert (=> b!893952 call!39671))

(declare-fun lt!403974 () Unit!30438)

(assert (=> b!893952 (= lt!403974 lt!403970)))

(declare-fun lt!403971 () Unit!30438)

(declare-fun lemmaValidKeyInArrayIsInListMap!240 (array!52364 array!52366 (_ BitVec 32) (_ BitVec 32) V!29217 V!29217 (_ BitVec 32) Int) Unit!30438)

(assert (=> b!893952 (= lt!403971 (lemmaValidKeyInArrayIsInListMap!240 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) (index!37828 lt!403978) (defaultEntry!5327 thiss!1181)))))

(declare-fun call!39670 () Bool)

(assert (=> b!893952 call!39670))

(declare-fun lt!403968 () Unit!30438)

(assert (=> b!893952 (= lt!403968 lt!403971)))

(declare-fun d!110483 () Bool)

(declare-fun lt!403977 () Bool)

(declare-fun contains!4388 (ListLongMap!10719 (_ BitVec 64)) Bool)

(assert (=> d!110483 (= lt!403977 (contains!4388 (map!12220 thiss!1181) key!785))))

(declare-fun e!499281 () Bool)

(assert (=> d!110483 (= lt!403977 e!499281)))

(declare-fun c!94261 () Bool)

(assert (=> d!110483 (= c!94261 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110483 (valid!1638 thiss!1181)))

(assert (=> d!110483 (= (contains!4386 thiss!1181 key!785) lt!403977)))

(declare-fun b!893953 () Bool)

(assert (=> b!893953 false))

(declare-fun lt!403975 () Unit!30438)

(declare-fun lt!403972 () Unit!30438)

(assert (=> b!893953 (= lt!403975 lt!403972)))

(declare-fun lt!403969 () SeekEntryResult!8864)

(declare-fun lt!403965 () (_ BitVec 32))

(assert (=> b!893953 (and ((_ is Found!8864) lt!403969) (= (index!37828 lt!403969) lt!403965))))

(assert (=> b!893953 (= lt!403969 (seekEntry!0 key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52364 (_ BitVec 32)) Unit!30438)

(assert (=> b!893953 (= lt!403972 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403965 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun lt!403964 () Unit!30438)

(declare-fun lt!403976 () Unit!30438)

(assert (=> b!893953 (= lt!403964 lt!403976)))

(assert (=> b!893953 (arrayForallSeekEntryOrOpenFound!0 lt!403965 (_keys!10019 thiss!1181) (mask!25871 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30438)

(assert (=> b!893953 (= lt!403976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10019 thiss!1181) (mask!25871 thiss!1181) #b00000000000000000000000000000000 lt!403965))))

(declare-fun arrayScanForKey!0 (array!52364 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893953 (= lt!403965 (arrayScanForKey!0 (_keys!10019 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403967 () Unit!30438)

(declare-fun lt!403973 () Unit!30438)

(assert (=> b!893953 (= lt!403967 lt!403973)))

(declare-fun e!499278 () Bool)

(assert (=> b!893953 e!499278))

(declare-fun c!94263 () Bool)

(assert (=> b!893953 (= c!94263 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!163 (array!52364 array!52366 (_ BitVec 32) (_ BitVec 32) V!29217 V!29217 (_ BitVec 64) Int) Unit!30438)

(assert (=> b!893953 (= lt!403973 (lemmaKeyInListMapIsInArray!163 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) key!785 (defaultEntry!5327 thiss!1181)))))

(declare-fun e!499279 () Unit!30438)

(declare-fun Unit!30440 () Unit!30438)

(assert (=> b!893953 (= e!499279 Unit!30440)))

(declare-fun b!893954 () Bool)

(assert (=> b!893954 (= e!499277 (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39666 () Bool)

(declare-fun call!39669 () ListLongMap!10719)

(assert (=> bm!39666 (= call!39669 (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)))))

(declare-fun b!893955 () Bool)

(assert (=> b!893955 (= e!499281 e!499277)))

(declare-fun c!94260 () Bool)

(assert (=> b!893955 (= c!94260 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893956 () Bool)

(assert (=> b!893956 (= e!499280 false)))

(declare-fun c!94262 () Bool)

(assert (=> b!893956 (= c!94262 call!39670)))

(declare-fun lt!403966 () Unit!30438)

(assert (=> b!893956 (= lt!403966 e!499279)))

(declare-fun b!893957 () Bool)

(assert (=> b!893957 (= e!499278 call!39671)))

(declare-fun b!893958 () Bool)

(assert (=> b!893958 (= e!499278 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!893959 () Bool)

(declare-fun Unit!30441 () Unit!30438)

(assert (=> b!893959 (= e!499279 Unit!30441)))

(declare-fun bm!39667 () Bool)

(declare-fun arrayContainsKey!0 (array!52364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39667 (= call!39671 (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!893960 () Bool)

(assert (=> b!893960 (= e!499281 (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39668 () Bool)

(assert (=> bm!39668 (= call!39670 (contains!4388 call!39669 (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(assert (= (and d!110483 c!94261) b!893960))

(assert (= (and d!110483 (not c!94261)) b!893955))

(assert (= (and b!893955 c!94260) b!893954))

(assert (= (and b!893955 (not c!94260)) b!893951))

(assert (= (and b!893951 c!94264) b!893952))

(assert (= (and b!893951 (not c!94264)) b!893956))

(assert (= (and b!893956 c!94262) b!893953))

(assert (= (and b!893956 (not c!94262)) b!893959))

(assert (= (and b!893953 c!94263) b!893957))

(assert (= (and b!893953 (not c!94263)) b!893958))

(assert (= (or b!893952 b!893957) bm!39667))

(assert (= (or b!893952 b!893956) bm!39666))

(assert (= (or b!893952 b!893956) bm!39668))

(declare-fun m!831991 () Bool)

(assert (=> bm!39667 m!831991))

(assert (=> bm!39666 m!831989))

(declare-fun m!831993 () Bool)

(assert (=> b!893952 m!831993))

(declare-fun m!831995 () Bool)

(assert (=> b!893952 m!831995))

(declare-fun m!831997 () Bool)

(assert (=> bm!39668 m!831997))

(declare-fun m!831999 () Bool)

(assert (=> bm!39668 m!831999))

(assert (=> d!110483 m!831955))

(assert (=> d!110483 m!831955))

(declare-fun m!832001 () Bool)

(assert (=> d!110483 m!832001))

(assert (=> d!110483 m!831953))

(declare-fun m!832003 () Bool)

(assert (=> b!893951 m!832003))

(declare-fun m!832005 () Bool)

(assert (=> b!893953 m!832005))

(declare-fun m!832007 () Bool)

(assert (=> b!893953 m!832007))

(declare-fun m!832009 () Bool)

(assert (=> b!893953 m!832009))

(declare-fun m!832011 () Bool)

(assert (=> b!893953 m!832011))

(assert (=> b!893953 m!832003))

(declare-fun m!832013 () Bool)

(assert (=> b!893953 m!832013))

(assert (=> b!893878 d!110483))

(declare-fun b!893968 () Bool)

(declare-fun e!499286 () Bool)

(assert (=> b!893968 (= e!499286 tp_is_empty!18189)))

(declare-fun condMapEmpty!28855 () Bool)

(declare-fun mapDefault!28855 () ValueCell!8613)

(assert (=> mapNonEmpty!28849 (= condMapEmpty!28855 (= mapRest!28849 ((as const (Array (_ BitVec 32) ValueCell!8613)) mapDefault!28855)))))

(declare-fun mapRes!28855 () Bool)

(assert (=> mapNonEmpty!28849 (= tp!55563 (and e!499286 mapRes!28855))))

(declare-fun mapIsEmpty!28855 () Bool)

(assert (=> mapIsEmpty!28855 mapRes!28855))

(declare-fun mapNonEmpty!28855 () Bool)

(declare-fun tp!55572 () Bool)

(declare-fun e!499287 () Bool)

(assert (=> mapNonEmpty!28855 (= mapRes!28855 (and tp!55572 e!499287))))

(declare-fun mapKey!28855 () (_ BitVec 32))

(declare-fun mapRest!28855 () (Array (_ BitVec 32) ValueCell!8613))

(declare-fun mapValue!28855 () ValueCell!8613)

(assert (=> mapNonEmpty!28855 (= mapRest!28849 (store mapRest!28855 mapKey!28855 mapValue!28855))))

(declare-fun b!893967 () Bool)

(assert (=> b!893967 (= e!499287 tp_is_empty!18189)))

(assert (= (and mapNonEmpty!28849 condMapEmpty!28855) mapIsEmpty!28855))

(assert (= (and mapNonEmpty!28849 (not condMapEmpty!28855)) mapNonEmpty!28855))

(assert (= (and mapNonEmpty!28855 ((_ is ValueCellFull!8613) mapValue!28855)) b!893967))

(assert (= (and mapNonEmpty!28849 ((_ is ValueCellFull!8613) mapDefault!28855)) b!893968))

(declare-fun m!832015 () Bool)

(assert (=> mapNonEmpty!28855 m!832015))

(check-sat (not d!110483) (not bm!39668) (not b_lambda!12937) (not d!110475) (not b!893951) (not bm!39666) b_and!26139 (not b!893918) (not b_next!15861) (not b!893917) (not mapNonEmpty!28855) (not b!893916) (not d!110481) (not b!893953) tp_is_empty!18189 (not bm!39667) (not b!893952) (not b!893929))
(check-sat b_and!26139 (not b_next!15861))
(get-model)

(declare-fun b!894011 () Bool)

(declare-fun e!499319 () ListLongMap!10719)

(declare-fun call!39686 () ListLongMap!10719)

(assert (=> b!894011 (= e!499319 call!39686)))

(declare-fun b!894012 () Bool)

(declare-fun e!499325 () Unit!30438)

(declare-fun Unit!30442 () Unit!30438)

(assert (=> b!894012 (= e!499325 Unit!30442)))

(declare-fun b!894013 () Bool)

(declare-fun e!499315 () Bool)

(declare-fun e!499318 () Bool)

(assert (=> b!894013 (= e!499315 e!499318)))

(declare-fun res!605193 () Bool)

(assert (=> b!894013 (=> (not res!605193) (not e!499318))))

(declare-fun lt!404037 () ListLongMap!10719)

(assert (=> b!894013 (= res!605193 (contains!4388 lt!404037 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894013 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894014 () Bool)

(declare-fun e!499316 () Bool)

(declare-fun e!499317 () Bool)

(assert (=> b!894014 (= e!499316 e!499317)))

(declare-fun res!605198 () Bool)

(declare-fun call!39687 () Bool)

(assert (=> b!894014 (= res!605198 call!39687)))

(assert (=> b!894014 (=> (not res!605198) (not e!499317))))

(declare-fun b!894015 () Bool)

(declare-fun e!499314 () Bool)

(declare-fun call!39688 () Bool)

(assert (=> b!894015 (= e!499314 (not call!39688))))

(declare-fun bm!39683 () Bool)

(declare-fun call!39689 () ListLongMap!10719)

(declare-fun call!39691 () ListLongMap!10719)

(assert (=> bm!39683 (= call!39689 call!39691)))

(declare-fun bm!39684 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3276 (array!52364 array!52366 (_ BitVec 32) (_ BitVec 32) V!29217 V!29217 (_ BitVec 32) Int) ListLongMap!10719)

(assert (=> bm!39684 (= call!39691 (getCurrentListMapNoExtraKeys!3276 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)))))

(declare-fun b!894017 () Bool)

(declare-fun e!499326 () ListLongMap!10719)

(assert (=> b!894017 (= e!499326 call!39686)))

(declare-fun b!894018 () Bool)

(declare-fun e!499320 () Bool)

(assert (=> b!894018 (= e!499320 e!499314)))

(declare-fun c!94278 () Bool)

(assert (=> b!894018 (= c!94278 (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39685 () Bool)

(declare-fun call!39692 () ListLongMap!10719)

(assert (=> bm!39685 (= call!39692 call!39689)))

(declare-fun b!894019 () Bool)

(declare-fun e!499324 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!894019 (= e!499324 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894020 () Bool)

(declare-fun e!499321 () ListLongMap!10719)

(declare-fun call!39690 () ListLongMap!10719)

(declare-fun +!2589 (ListLongMap!10719 tuple2!12022) ListLongMap!10719)

(assert (=> b!894020 (= e!499321 (+!2589 call!39690 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))))

(declare-fun bm!39686 () Bool)

(assert (=> bm!39686 (= call!39687 (contains!4388 lt!404037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894021 () Bool)

(declare-fun e!499322 () Bool)

(declare-fun apply!408 (ListLongMap!10719 (_ BitVec 64)) V!29217)

(assert (=> b!894021 (= e!499322 (= (apply!408 lt!404037 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5127 thiss!1181)))))

(declare-fun b!894022 () Bool)

(declare-fun res!605199 () Bool)

(assert (=> b!894022 (=> (not res!605199) (not e!499320))))

(assert (=> b!894022 (= res!605199 e!499315)))

(declare-fun res!605197 () Bool)

(assert (=> b!894022 (=> res!605197 e!499315)))

(declare-fun e!499323 () Bool)

(assert (=> b!894022 (= res!605197 (not e!499323))))

(declare-fun res!605196 () Bool)

(assert (=> b!894022 (=> (not res!605196) (not e!499323))))

(assert (=> b!894022 (= res!605196 (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894023 () Bool)

(assert (=> b!894023 (= e!499323 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39687 () Bool)

(assert (=> bm!39687 (= call!39686 call!39690)))

(declare-fun bm!39688 () Bool)

(declare-fun c!94280 () Bool)

(declare-fun c!94281 () Bool)

(assert (=> bm!39688 (= call!39690 (+!2589 (ite c!94281 call!39691 (ite c!94280 call!39689 call!39692)) (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))))))

(declare-fun bm!39689 () Bool)

(assert (=> bm!39689 (= call!39688 (contains!4388 lt!404037 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894016 () Bool)

(assert (=> b!894016 (= e!499321 e!499326)))

(assert (=> b!894016 (= c!94280 (and (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!110485 () Bool)

(assert (=> d!110485 e!499320))

(declare-fun res!605194 () Bool)

(assert (=> d!110485 (=> (not res!605194) (not e!499320))))

(assert (=> d!110485 (= res!605194 (or (bvsge #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))))

(declare-fun lt!404033 () ListLongMap!10719)

(assert (=> d!110485 (= lt!404037 lt!404033)))

(declare-fun lt!404041 () Unit!30438)

(assert (=> d!110485 (= lt!404041 e!499325)))

(declare-fun c!94282 () Bool)

(assert (=> d!110485 (= c!94282 e!499324)))

(declare-fun res!605192 () Bool)

(assert (=> d!110485 (=> (not res!605192) (not e!499324))))

(assert (=> d!110485 (= res!605192 (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110485 (= lt!404033 e!499321)))

(assert (=> d!110485 (= c!94281 (and (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110485 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110485 (= (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)) lt!404037)))

(declare-fun b!894024 () Bool)

(declare-fun lt!404038 () Unit!30438)

(assert (=> b!894024 (= e!499325 lt!404038)))

(declare-fun lt!404042 () ListLongMap!10719)

(assert (=> b!894024 (= lt!404042 (getCurrentListMapNoExtraKeys!3276 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)))))

(declare-fun lt!404034 () (_ BitVec 64))

(assert (=> b!894024 (= lt!404034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404036 () (_ BitVec 64))

(assert (=> b!894024 (= lt!404036 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404026 () Unit!30438)

(declare-fun addStillContains!330 (ListLongMap!10719 (_ BitVec 64) V!29217 (_ BitVec 64)) Unit!30438)

(assert (=> b!894024 (= lt!404026 (addStillContains!330 lt!404042 lt!404034 (zeroValue!5127 thiss!1181) lt!404036))))

(assert (=> b!894024 (contains!4388 (+!2589 lt!404042 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181))) lt!404036)))

(declare-fun lt!404027 () Unit!30438)

(assert (=> b!894024 (= lt!404027 lt!404026)))

(declare-fun lt!404032 () ListLongMap!10719)

(assert (=> b!894024 (= lt!404032 (getCurrentListMapNoExtraKeys!3276 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)))))

(declare-fun lt!404023 () (_ BitVec 64))

(assert (=> b!894024 (= lt!404023 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404035 () (_ BitVec 64))

(assert (=> b!894024 (= lt!404035 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404040 () Unit!30438)

(declare-fun addApplyDifferent!330 (ListLongMap!10719 (_ BitVec 64) V!29217 (_ BitVec 64)) Unit!30438)

(assert (=> b!894024 (= lt!404040 (addApplyDifferent!330 lt!404032 lt!404023 (minValue!5127 thiss!1181) lt!404035))))

(assert (=> b!894024 (= (apply!408 (+!2589 lt!404032 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181))) lt!404035) (apply!408 lt!404032 lt!404035))))

(declare-fun lt!404031 () Unit!30438)

(assert (=> b!894024 (= lt!404031 lt!404040)))

(declare-fun lt!404025 () ListLongMap!10719)

(assert (=> b!894024 (= lt!404025 (getCurrentListMapNoExtraKeys!3276 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)))))

(declare-fun lt!404028 () (_ BitVec 64))

(assert (=> b!894024 (= lt!404028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404030 () (_ BitVec 64))

(assert (=> b!894024 (= lt!404030 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404029 () Unit!30438)

(assert (=> b!894024 (= lt!404029 (addApplyDifferent!330 lt!404025 lt!404028 (zeroValue!5127 thiss!1181) lt!404030))))

(assert (=> b!894024 (= (apply!408 (+!2589 lt!404025 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181))) lt!404030) (apply!408 lt!404025 lt!404030))))

(declare-fun lt!404043 () Unit!30438)

(assert (=> b!894024 (= lt!404043 lt!404029)))

(declare-fun lt!404044 () ListLongMap!10719)

(assert (=> b!894024 (= lt!404044 (getCurrentListMapNoExtraKeys!3276 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)))))

(declare-fun lt!404039 () (_ BitVec 64))

(assert (=> b!894024 (= lt!404039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!404024 () (_ BitVec 64))

(assert (=> b!894024 (= lt!404024 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894024 (= lt!404038 (addApplyDifferent!330 lt!404044 lt!404039 (minValue!5127 thiss!1181) lt!404024))))

(assert (=> b!894024 (= (apply!408 (+!2589 lt!404044 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181))) lt!404024) (apply!408 lt!404044 lt!404024))))

(declare-fun b!894025 () Bool)

(assert (=> b!894025 (= e!499319 call!39692)))

(declare-fun b!894026 () Bool)

(assert (=> b!894026 (= e!499316 (not call!39687))))

(declare-fun b!894027 () Bool)

(declare-fun c!94277 () Bool)

(assert (=> b!894027 (= c!94277 (and (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!894027 (= e!499326 e!499319)))

(declare-fun b!894028 () Bool)

(declare-fun res!605191 () Bool)

(assert (=> b!894028 (=> (not res!605191) (not e!499320))))

(assert (=> b!894028 (= res!605191 e!499316)))

(declare-fun c!94279 () Bool)

(assert (=> b!894028 (= c!94279 (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!894029 () Bool)

(assert (=> b!894029 (= e!499317 (= (apply!408 lt!404037 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5127 thiss!1181)))))

(declare-fun b!894030 () Bool)

(declare-fun get!13264 (ValueCell!8613 V!29217) V!29217)

(assert (=> b!894030 (= e!499318 (= (apply!408 lt!404037 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)) (get!13264 (select (arr!25186 (_values!5314 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1299 (defaultEntry!5327 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!894030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25631 (_values!5314 thiss!1181))))))

(assert (=> b!894030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894031 () Bool)

(assert (=> b!894031 (= e!499314 e!499322)))

(declare-fun res!605195 () Bool)

(assert (=> b!894031 (= res!605195 call!39688)))

(assert (=> b!894031 (=> (not res!605195) (not e!499322))))

(assert (= (and d!110485 c!94281) b!894020))

(assert (= (and d!110485 (not c!94281)) b!894016))

(assert (= (and b!894016 c!94280) b!894017))

(assert (= (and b!894016 (not c!94280)) b!894027))

(assert (= (and b!894027 c!94277) b!894011))

(assert (= (and b!894027 (not c!94277)) b!894025))

(assert (= (or b!894011 b!894025) bm!39685))

(assert (= (or b!894017 bm!39685) bm!39683))

(assert (= (or b!894017 b!894011) bm!39687))

(assert (= (or b!894020 bm!39683) bm!39684))

(assert (= (or b!894020 bm!39687) bm!39688))

(assert (= (and d!110485 res!605192) b!894019))

(assert (= (and d!110485 c!94282) b!894024))

(assert (= (and d!110485 (not c!94282)) b!894012))

(assert (= (and d!110485 res!605194) b!894022))

(assert (= (and b!894022 res!605196) b!894023))

(assert (= (and b!894022 (not res!605197)) b!894013))

(assert (= (and b!894013 res!605193) b!894030))

(assert (= (and b!894022 res!605199) b!894028))

(assert (= (and b!894028 c!94279) b!894014))

(assert (= (and b!894028 (not c!94279)) b!894026))

(assert (= (and b!894014 res!605198) b!894029))

(assert (= (or b!894014 b!894026) bm!39686))

(assert (= (and b!894028 res!605191) b!894018))

(assert (= (and b!894018 c!94278) b!894031))

(assert (= (and b!894018 (not c!94278)) b!894015))

(assert (= (and b!894031 res!605195) b!894021))

(assert (= (or b!894031 b!894015) bm!39689))

(declare-fun b_lambda!12939 () Bool)

(assert (=> (not b_lambda!12939) (not b!894030)))

(declare-fun t!25136 () Bool)

(declare-fun tb!5183 () Bool)

(assert (=> (and b!893877 (= (defaultEntry!5327 thiss!1181) (defaultEntry!5327 thiss!1181)) t!25136) tb!5183))

(declare-fun result!10083 () Bool)

(assert (=> tb!5183 (= result!10083 tp_is_empty!18189)))

(assert (=> b!894030 t!25136))

(declare-fun b_and!26145 () Bool)

(assert (= b_and!26139 (and (=> t!25136 result!10083) b_and!26145)))

(declare-fun m!832017 () Bool)

(assert (=> b!894024 m!832017))

(declare-fun m!832019 () Bool)

(assert (=> b!894024 m!832019))

(declare-fun m!832021 () Bool)

(assert (=> b!894024 m!832021))

(declare-fun m!832023 () Bool)

(assert (=> b!894024 m!832023))

(declare-fun m!832025 () Bool)

(assert (=> b!894024 m!832025))

(declare-fun m!832027 () Bool)

(assert (=> b!894024 m!832027))

(declare-fun m!832029 () Bool)

(assert (=> b!894024 m!832029))

(declare-fun m!832031 () Bool)

(assert (=> b!894024 m!832031))

(declare-fun m!832033 () Bool)

(assert (=> b!894024 m!832033))

(assert (=> b!894024 m!832027))

(declare-fun m!832035 () Bool)

(assert (=> b!894024 m!832035))

(declare-fun m!832037 () Bool)

(assert (=> b!894024 m!832037))

(declare-fun m!832039 () Bool)

(assert (=> b!894024 m!832039))

(declare-fun m!832041 () Bool)

(assert (=> b!894024 m!832041))

(assert (=> b!894024 m!832031))

(assert (=> b!894024 m!832037))

(declare-fun m!832043 () Bool)

(assert (=> b!894024 m!832043))

(declare-fun m!832045 () Bool)

(assert (=> b!894024 m!832045))

(declare-fun m!832047 () Bool)

(assert (=> b!894024 m!832047))

(assert (=> b!894024 m!832045))

(declare-fun m!832049 () Bool)

(assert (=> b!894024 m!832049))

(declare-fun m!832051 () Bool)

(assert (=> b!894020 m!832051))

(declare-fun m!832053 () Bool)

(assert (=> bm!39686 m!832053))

(declare-fun m!832055 () Bool)

(assert (=> bm!39689 m!832055))

(assert (=> bm!39684 m!832039))

(declare-fun m!832057 () Bool)

(assert (=> d!110485 m!832057))

(declare-fun m!832059 () Bool)

(assert (=> b!894021 m!832059))

(assert (=> b!894019 m!832041))

(assert (=> b!894019 m!832041))

(declare-fun m!832061 () Bool)

(assert (=> b!894019 m!832061))

(assert (=> b!894013 m!832041))

(assert (=> b!894013 m!832041))

(declare-fun m!832063 () Bool)

(assert (=> b!894013 m!832063))

(assert (=> b!894030 m!832041))

(declare-fun m!832065 () Bool)

(assert (=> b!894030 m!832065))

(declare-fun m!832067 () Bool)

(assert (=> b!894030 m!832067))

(declare-fun m!832069 () Bool)

(assert (=> b!894030 m!832069))

(assert (=> b!894030 m!832041))

(declare-fun m!832071 () Bool)

(assert (=> b!894030 m!832071))

(assert (=> b!894030 m!832067))

(assert (=> b!894030 m!832065))

(declare-fun m!832073 () Bool)

(assert (=> b!894029 m!832073))

(assert (=> b!894023 m!832041))

(assert (=> b!894023 m!832041))

(assert (=> b!894023 m!832061))

(declare-fun m!832075 () Bool)

(assert (=> bm!39688 m!832075))

(assert (=> d!110481 d!110485))

(assert (=> bm!39666 d!110485))

(declare-fun d!110487 () Bool)

(declare-fun e!499331 () Bool)

(assert (=> d!110487 e!499331))

(declare-fun res!605202 () Bool)

(assert (=> d!110487 (=> res!605202 e!499331)))

(declare-fun lt!404054 () Bool)

(assert (=> d!110487 (= res!605202 (not lt!404054))))

(declare-fun lt!404055 () Bool)

(assert (=> d!110487 (= lt!404054 lt!404055)))

(declare-fun lt!404056 () Unit!30438)

(declare-fun e!499332 () Unit!30438)

(assert (=> d!110487 (= lt!404056 e!499332)))

(declare-fun c!94285 () Bool)

(assert (=> d!110487 (= c!94285 lt!404055)))

(declare-fun containsKey!423 (List!17801 (_ BitVec 64)) Bool)

(assert (=> d!110487 (= lt!404055 (containsKey!423 (toList!5375 (map!12220 thiss!1181)) key!785))))

(assert (=> d!110487 (= (contains!4388 (map!12220 thiss!1181) key!785) lt!404054)))

(declare-fun b!894038 () Bool)

(declare-fun lt!404053 () Unit!30438)

(assert (=> b!894038 (= e!499332 lt!404053)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!319 (List!17801 (_ BitVec 64)) Unit!30438)

(assert (=> b!894038 (= lt!404053 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 (map!12220 thiss!1181)) key!785))))

(declare-fun isDefined!328 (Option!457) Bool)

(assert (=> b!894038 (isDefined!328 (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785))))

(declare-fun b!894039 () Bool)

(declare-fun Unit!30443 () Unit!30438)

(assert (=> b!894039 (= e!499332 Unit!30443)))

(declare-fun b!894040 () Bool)

(assert (=> b!894040 (= e!499331 (isDefined!328 (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785)))))

(assert (= (and d!110487 c!94285) b!894038))

(assert (= (and d!110487 (not c!94285)) b!894039))

(assert (= (and d!110487 (not res!605202)) b!894040))

(declare-fun m!832077 () Bool)

(assert (=> d!110487 m!832077))

(declare-fun m!832079 () Bool)

(assert (=> b!894038 m!832079))

(assert (=> b!894038 m!831957))

(assert (=> b!894038 m!831957))

(declare-fun m!832081 () Bool)

(assert (=> b!894038 m!832081))

(assert (=> b!894040 m!831957))

(assert (=> b!894040 m!831957))

(assert (=> b!894040 m!832081))

(assert (=> d!110483 d!110487))

(assert (=> d!110483 d!110481))

(assert (=> d!110483 d!110475))

(declare-fun d!110489 () Bool)

(declare-fun e!499335 () Bool)

(assert (=> d!110489 e!499335))

(declare-fun c!94288 () Bool)

(assert (=> d!110489 (= c!94288 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!404059 () Unit!30438)

(declare-fun choose!1469 (array!52364 array!52366 (_ BitVec 32) (_ BitVec 32) V!29217 V!29217 (_ BitVec 64) Int) Unit!30438)

(assert (=> d!110489 (= lt!404059 (choose!1469 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) key!785 (defaultEntry!5327 thiss!1181)))))

(assert (=> d!110489 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110489 (= (lemmaKeyInListMapIsInArray!163 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) key!785 (defaultEntry!5327 thiss!1181)) lt!404059)))

(declare-fun b!894045 () Bool)

(assert (=> b!894045 (= e!499335 (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!894046 () Bool)

(assert (=> b!894046 (= e!499335 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110489 c!94288) b!894045))

(assert (= (and d!110489 (not c!94288)) b!894046))

(declare-fun m!832083 () Bool)

(assert (=> d!110489 m!832083))

(assert (=> d!110489 m!832057))

(assert (=> b!894045 m!831991))

(assert (=> b!893953 d!110489))

(declare-fun b!894055 () Bool)

(declare-fun e!499342 () Bool)

(declare-fun call!39695 () Bool)

(assert (=> b!894055 (= e!499342 call!39695)))

(declare-fun bm!39692 () Bool)

(assert (=> bm!39692 (= call!39695 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403965 #b00000000000000000000000000000001) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!894056 () Bool)

(declare-fun e!499343 () Bool)

(assert (=> b!894056 (= e!499343 e!499342)))

(declare-fun lt!404066 () (_ BitVec 64))

(assert (=> b!894056 (= lt!404066 (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965))))

(declare-fun lt!404067 () Unit!30438)

(assert (=> b!894056 (= lt!404067 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10019 thiss!1181) lt!404066 lt!403965))))

(assert (=> b!894056 (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404066 #b00000000000000000000000000000000)))

(declare-fun lt!404068 () Unit!30438)

(assert (=> b!894056 (= lt!404068 lt!404067)))

(declare-fun res!605207 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52364 (_ BitVec 32)) SeekEntryResult!8864)

(assert (=> b!894056 (= res!605207 (= (seekEntryOrOpen!0 (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) (Found!8864 lt!403965)))))

(assert (=> b!894056 (=> (not res!605207) (not e!499342))))

(declare-fun d!110491 () Bool)

(declare-fun res!605208 () Bool)

(declare-fun e!499344 () Bool)

(assert (=> d!110491 (=> res!605208 e!499344)))

(assert (=> d!110491 (= res!605208 (bvsge lt!403965 (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110491 (= (arrayForallSeekEntryOrOpenFound!0 lt!403965 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) e!499344)))

(declare-fun b!894057 () Bool)

(assert (=> b!894057 (= e!499344 e!499343)))

(declare-fun c!94291 () Bool)

(assert (=> b!894057 (= c!94291 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965)))))

(declare-fun b!894058 () Bool)

(assert (=> b!894058 (= e!499343 call!39695)))

(assert (= (and d!110491 (not res!605208)) b!894057))

(assert (= (and b!894057 c!94291) b!894056))

(assert (= (and b!894057 (not c!94291)) b!894058))

(assert (= (and b!894056 res!605207) b!894055))

(assert (= (or b!894055 b!894058) bm!39692))

(declare-fun m!832085 () Bool)

(assert (=> bm!39692 m!832085))

(declare-fun m!832087 () Bool)

(assert (=> b!894056 m!832087))

(declare-fun m!832089 () Bool)

(assert (=> b!894056 m!832089))

(declare-fun m!832091 () Bool)

(assert (=> b!894056 m!832091))

(assert (=> b!894056 m!832087))

(declare-fun m!832093 () Bool)

(assert (=> b!894056 m!832093))

(assert (=> b!894057 m!832087))

(assert (=> b!894057 m!832087))

(declare-fun m!832095 () Bool)

(assert (=> b!894057 m!832095))

(assert (=> b!893953 d!110491))

(declare-fun b!894071 () Bool)

(declare-fun e!499352 () SeekEntryResult!8864)

(declare-fun lt!404080 () SeekEntryResult!8864)

(assert (=> b!894071 (= e!499352 (MissingZero!8864 (index!37829 lt!404080)))))

(declare-fun b!894073 () Bool)

(declare-fun lt!404079 () SeekEntryResult!8864)

(assert (=> b!894073 (= e!499352 (ite ((_ is MissingVacant!8864) lt!404079) (MissingZero!8864 (index!37830 lt!404079)) lt!404079))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52364 (_ BitVec 32)) SeekEntryResult!8864)

(assert (=> b!894073 (= lt!404079 (seekKeyOrZeroReturnVacant!0 (x!76000 lt!404080) (index!37829 lt!404080) (index!37829 lt!404080) key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!894074 () Bool)

(declare-fun e!499353 () SeekEntryResult!8864)

(assert (=> b!894074 (= e!499353 (Found!8864 (index!37829 lt!404080)))))

(declare-fun b!894075 () Bool)

(declare-fun e!499351 () SeekEntryResult!8864)

(assert (=> b!894075 (= e!499351 e!499353)))

(declare-fun lt!404078 () (_ BitVec 64))

(assert (=> b!894075 (= lt!404078 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37829 lt!404080)))))

(declare-fun c!94298 () Bool)

(assert (=> b!894075 (= c!94298 (= lt!404078 key!785))))

(declare-fun b!894076 () Bool)

(declare-fun c!94299 () Bool)

(assert (=> b!894076 (= c!94299 (= lt!404078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894076 (= e!499353 e!499352)))

(declare-fun d!110493 () Bool)

(declare-fun lt!404077 () SeekEntryResult!8864)

(assert (=> d!110493 (and (or ((_ is MissingVacant!8864) lt!404077) (not ((_ is Found!8864) lt!404077)) (and (bvsge (index!37828 lt!404077) #b00000000000000000000000000000000) (bvslt (index!37828 lt!404077) (size!25630 (_keys!10019 thiss!1181))))) (not ((_ is MissingVacant!8864) lt!404077)) (or (not ((_ is Found!8864) lt!404077)) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!404077)) key!785)))))

(assert (=> d!110493 (= lt!404077 e!499351)))

(declare-fun c!94300 () Bool)

(assert (=> d!110493 (= c!94300 (and ((_ is Intermediate!8864) lt!404080) (undefined!9676 lt!404080)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52364 (_ BitVec 32)) SeekEntryResult!8864)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110493 (= lt!404080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25871 thiss!1181)) key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(assert (=> d!110493 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110493 (= (seekEntry!0 key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) lt!404077)))

(declare-fun b!894072 () Bool)

(assert (=> b!894072 (= e!499351 Undefined!8864)))

(assert (= (and d!110493 c!94300) b!894072))

(assert (= (and d!110493 (not c!94300)) b!894075))

(assert (= (and b!894075 c!94298) b!894074))

(assert (= (and b!894075 (not c!94298)) b!894076))

(assert (= (and b!894076 c!94299) b!894071))

(assert (= (and b!894076 (not c!94299)) b!894073))

(declare-fun m!832097 () Bool)

(assert (=> b!894073 m!832097))

(declare-fun m!832099 () Bool)

(assert (=> b!894075 m!832099))

(declare-fun m!832101 () Bool)

(assert (=> d!110493 m!832101))

(declare-fun m!832103 () Bool)

(assert (=> d!110493 m!832103))

(assert (=> d!110493 m!832103))

(declare-fun m!832105 () Bool)

(assert (=> d!110493 m!832105))

(assert (=> d!110493 m!832057))

(assert (=> b!893953 d!110493))

(declare-fun d!110495 () Bool)

(assert (=> d!110495 (arrayForallSeekEntryOrOpenFound!0 lt!403965 (_keys!10019 thiss!1181) (mask!25871 thiss!1181))))

(declare-fun lt!404083 () Unit!30438)

(declare-fun choose!38 (array!52364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30438)

(assert (=> d!110495 (= lt!404083 (choose!38 (_keys!10019 thiss!1181) (mask!25871 thiss!1181) #b00000000000000000000000000000000 lt!403965))))

(assert (=> d!110495 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110495 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10019 thiss!1181) (mask!25871 thiss!1181) #b00000000000000000000000000000000 lt!403965) lt!404083)))

(declare-fun bs!25099 () Bool)

(assert (= bs!25099 d!110495))

(assert (=> bs!25099 m!832009))

(declare-fun m!832107 () Bool)

(assert (=> bs!25099 m!832107))

(assert (=> bs!25099 m!832057))

(assert (=> b!893953 d!110495))

(declare-fun d!110497 () Bool)

(declare-fun lt!404086 () (_ BitVec 32))

(assert (=> d!110497 (and (or (bvslt lt!404086 #b00000000000000000000000000000000) (bvsge lt!404086 (size!25630 (_keys!10019 thiss!1181))) (and (bvsge lt!404086 #b00000000000000000000000000000000) (bvslt lt!404086 (size!25630 (_keys!10019 thiss!1181))))) (bvsge lt!404086 #b00000000000000000000000000000000) (bvslt lt!404086 (size!25630 (_keys!10019 thiss!1181))) (= (select (arr!25185 (_keys!10019 thiss!1181)) lt!404086) key!785))))

(declare-fun e!499356 () (_ BitVec 32))

(assert (=> d!110497 (= lt!404086 e!499356)))

(declare-fun c!94303 () Bool)

(assert (=> d!110497 (= c!94303 (= (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))) (bvslt (size!25630 (_keys!10019 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110497 (= (arrayScanForKey!0 (_keys!10019 thiss!1181) key!785 #b00000000000000000000000000000000) lt!404086)))

(declare-fun b!894081 () Bool)

(assert (=> b!894081 (= e!499356 #b00000000000000000000000000000000)))

(declare-fun b!894082 () Bool)

(assert (=> b!894082 (= e!499356 (arrayScanForKey!0 (_keys!10019 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110497 c!94303) b!894081))

(assert (= (and d!110497 (not c!94303)) b!894082))

(declare-fun m!832109 () Bool)

(assert (=> d!110497 m!832109))

(assert (=> d!110497 m!832041))

(declare-fun m!832111 () Bool)

(assert (=> b!894082 m!832111))

(assert (=> b!893953 d!110497))

(declare-fun d!110499 () Bool)

(declare-fun lt!404092 () SeekEntryResult!8864)

(assert (=> d!110499 (and ((_ is Found!8864) lt!404092) (= (index!37828 lt!404092) lt!403965))))

(assert (=> d!110499 (= lt!404092 (seekEntry!0 key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun lt!404091 () Unit!30438)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!52364 (_ BitVec 32)) Unit!30438)

(assert (=> d!110499 (= lt!404091 (choose!0 key!785 lt!403965 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(assert (=> d!110499 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110499 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403965 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) lt!404091)))

(declare-fun bs!25100 () Bool)

(assert (= bs!25100 d!110499))

(assert (=> bs!25100 m!832003))

(declare-fun m!832113 () Bool)

(assert (=> bs!25100 m!832113))

(assert (=> bs!25100 m!832057))

(assert (=> b!893953 d!110499))

(declare-fun d!110501 () Bool)

(assert (=> d!110501 (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404095 () Unit!30438)

(declare-fun choose!13 (array!52364 (_ BitVec 64) (_ BitVec 32)) Unit!30438)

(assert (=> d!110501 (= lt!404095 (choose!13 (_keys!10019 thiss!1181) key!785 (index!37828 lt!403978)))))

(assert (=> d!110501 (bvsge (index!37828 lt!403978) #b00000000000000000000000000000000)))

(assert (=> d!110501 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10019 thiss!1181) key!785 (index!37828 lt!403978)) lt!404095)))

(declare-fun bs!25101 () Bool)

(assert (= bs!25101 d!110501))

(assert (=> bs!25101 m!831991))

(declare-fun m!832115 () Bool)

(assert (=> bs!25101 m!832115))

(assert (=> b!893952 d!110501))

(declare-fun d!110503 () Bool)

(declare-fun e!499359 () Bool)

(assert (=> d!110503 e!499359))

(declare-fun res!605211 () Bool)

(assert (=> d!110503 (=> (not res!605211) (not e!499359))))

(assert (=> d!110503 (= res!605211 (and (bvsge (index!37828 lt!403978) #b00000000000000000000000000000000) (bvslt (index!37828 lt!403978) (size!25630 (_keys!10019 thiss!1181)))))))

(declare-fun lt!404098 () Unit!30438)

(declare-fun choose!1470 (array!52364 array!52366 (_ BitVec 32) (_ BitVec 32) V!29217 V!29217 (_ BitVec 32) Int) Unit!30438)

(assert (=> d!110503 (= lt!404098 (choose!1470 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) (index!37828 lt!403978) (defaultEntry!5327 thiss!1181)))))

(assert (=> d!110503 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110503 (= (lemmaValidKeyInArrayIsInListMap!240 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) (index!37828 lt!403978) (defaultEntry!5327 thiss!1181)) lt!404098)))

(declare-fun b!894085 () Bool)

(assert (=> b!894085 (= e!499359 (contains!4388 (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)) (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978))))))

(assert (= (and d!110503 res!605211) b!894085))

(declare-fun m!832117 () Bool)

(assert (=> d!110503 m!832117))

(assert (=> d!110503 m!832057))

(assert (=> b!894085 m!831989))

(assert (=> b!894085 m!831997))

(assert (=> b!894085 m!831989))

(assert (=> b!894085 m!831997))

(declare-fun m!832119 () Bool)

(assert (=> b!894085 m!832119))

(assert (=> b!893952 d!110503))

(declare-fun b!894096 () Bool)

(declare-fun e!499371 () Bool)

(declare-fun e!499368 () Bool)

(assert (=> b!894096 (= e!499371 e!499368)))

(declare-fun res!605220 () Bool)

(assert (=> b!894096 (=> (not res!605220) (not e!499368))))

(declare-fun e!499369 () Bool)

(assert (=> b!894096 (= res!605220 (not e!499369))))

(declare-fun res!605219 () Bool)

(assert (=> b!894096 (=> (not res!605219) (not e!499369))))

(assert (=> b!894096 (= res!605219 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894097 () Bool)

(declare-fun e!499370 () Bool)

(declare-fun call!39698 () Bool)

(assert (=> b!894097 (= e!499370 call!39698)))

(declare-fun bm!39695 () Bool)

(declare-fun c!94306 () Bool)

(assert (=> bm!39695 (= call!39698 (arrayNoDuplicates!0 (_keys!10019 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94306 (Cons!17799 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) Nil!17800) Nil!17800)))))

(declare-fun d!110505 () Bool)

(declare-fun res!605218 () Bool)

(assert (=> d!110505 (=> res!605218 e!499371)))

(assert (=> d!110505 (= res!605218 (bvsge #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110505 (= (arrayNoDuplicates!0 (_keys!10019 thiss!1181) #b00000000000000000000000000000000 Nil!17800) e!499371)))

(declare-fun b!894098 () Bool)

(declare-fun contains!4389 (List!17803 (_ BitVec 64)) Bool)

(assert (=> b!894098 (= e!499369 (contains!4389 Nil!17800 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894099 () Bool)

(assert (=> b!894099 (= e!499368 e!499370)))

(assert (=> b!894099 (= c!94306 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894100 () Bool)

(assert (=> b!894100 (= e!499370 call!39698)))

(assert (= (and d!110505 (not res!605218)) b!894096))

(assert (= (and b!894096 res!605219) b!894098))

(assert (= (and b!894096 res!605220) b!894099))

(assert (= (and b!894099 c!94306) b!894097))

(assert (= (and b!894099 (not c!94306)) b!894100))

(assert (= (or b!894097 b!894100) bm!39695))

(assert (=> b!894096 m!832041))

(assert (=> b!894096 m!832041))

(assert (=> b!894096 m!832061))

(assert (=> bm!39695 m!832041))

(declare-fun m!832121 () Bool)

(assert (=> bm!39695 m!832121))

(assert (=> b!894098 m!832041))

(assert (=> b!894098 m!832041))

(declare-fun m!832123 () Bool)

(assert (=> b!894098 m!832123))

(assert (=> b!894099 m!832041))

(assert (=> b!894099 m!832041))

(assert (=> b!894099 m!832061))

(assert (=> b!893918 d!110505))

(declare-fun d!110507 () Bool)

(declare-fun e!499372 () Bool)

(assert (=> d!110507 e!499372))

(declare-fun res!605221 () Bool)

(assert (=> d!110507 (=> res!605221 e!499372)))

(declare-fun lt!404100 () Bool)

(assert (=> d!110507 (= res!605221 (not lt!404100))))

(declare-fun lt!404101 () Bool)

(assert (=> d!110507 (= lt!404100 lt!404101)))

(declare-fun lt!404102 () Unit!30438)

(declare-fun e!499373 () Unit!30438)

(assert (=> d!110507 (= lt!404102 e!499373)))

(declare-fun c!94307 () Bool)

(assert (=> d!110507 (= c!94307 lt!404101)))

(assert (=> d!110507 (= lt!404101 (containsKey!423 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(assert (=> d!110507 (= (contains!4388 call!39669 (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)) lt!404100)))

(declare-fun b!894101 () Bool)

(declare-fun lt!404099 () Unit!30438)

(assert (=> b!894101 (= e!499373 lt!404099)))

(assert (=> b!894101 (= lt!404099 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(assert (=> b!894101 (isDefined!328 (getValueByKey!451 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(declare-fun b!894102 () Bool)

(declare-fun Unit!30444 () Unit!30438)

(assert (=> b!894102 (= e!499373 Unit!30444)))

(declare-fun b!894103 () Bool)

(assert (=> b!894103 (= e!499372 (isDefined!328 (getValueByKey!451 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785))))))

(assert (= (and d!110507 c!94307) b!894101))

(assert (= (and d!110507 (not c!94307)) b!894102))

(assert (= (and d!110507 (not res!605221)) b!894103))

(declare-fun m!832125 () Bool)

(assert (=> d!110507 m!832125))

(declare-fun m!832127 () Bool)

(assert (=> b!894101 m!832127))

(declare-fun m!832129 () Bool)

(assert (=> b!894101 m!832129))

(assert (=> b!894101 m!832129))

(declare-fun m!832131 () Bool)

(assert (=> b!894101 m!832131))

(assert (=> b!894103 m!832129))

(assert (=> b!894103 m!832129))

(assert (=> b!894103 m!832131))

(assert (=> bm!39668 d!110507))

(declare-fun b!894104 () Bool)

(declare-fun e!499374 () Bool)

(declare-fun call!39699 () Bool)

(assert (=> b!894104 (= e!499374 call!39699)))

(declare-fun bm!39696 () Bool)

(assert (=> bm!39696 (= call!39699 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!894105 () Bool)

(declare-fun e!499375 () Bool)

(assert (=> b!894105 (= e!499375 e!499374)))

(declare-fun lt!404103 () (_ BitVec 64))

(assert (=> b!894105 (= lt!404103 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404104 () Unit!30438)

(assert (=> b!894105 (= lt!404104 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10019 thiss!1181) lt!404103 #b00000000000000000000000000000000))))

(assert (=> b!894105 (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404103 #b00000000000000000000000000000000)))

(declare-fun lt!404105 () Unit!30438)

(assert (=> b!894105 (= lt!404105 lt!404104)))

(declare-fun res!605222 () Bool)

(assert (=> b!894105 (= res!605222 (= (seekEntryOrOpen!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) (Found!8864 #b00000000000000000000000000000000)))))

(assert (=> b!894105 (=> (not res!605222) (not e!499374))))

(declare-fun d!110509 () Bool)

(declare-fun res!605223 () Bool)

(declare-fun e!499376 () Bool)

(assert (=> d!110509 (=> res!605223 e!499376)))

(assert (=> d!110509 (= res!605223 (bvsge #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110509 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) e!499376)))

(declare-fun b!894106 () Bool)

(assert (=> b!894106 (= e!499376 e!499375)))

(declare-fun c!94308 () Bool)

(assert (=> b!894106 (= c!94308 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894107 () Bool)

(assert (=> b!894107 (= e!499375 call!39699)))

(assert (= (and d!110509 (not res!605223)) b!894106))

(assert (= (and b!894106 c!94308) b!894105))

(assert (= (and b!894106 (not c!94308)) b!894107))

(assert (= (and b!894105 res!605222) b!894104))

(assert (= (or b!894104 b!894107) bm!39696))

(declare-fun m!832133 () Bool)

(assert (=> bm!39696 m!832133))

(assert (=> b!894105 m!832041))

(declare-fun m!832135 () Bool)

(assert (=> b!894105 m!832135))

(declare-fun m!832137 () Bool)

(assert (=> b!894105 m!832137))

(assert (=> b!894105 m!832041))

(declare-fun m!832139 () Bool)

(assert (=> b!894105 m!832139))

(assert (=> b!894106 m!832041))

(assert (=> b!894106 m!832041))

(assert (=> b!894106 m!832061))

(assert (=> b!893917 d!110509))

(declare-fun d!110511 () Bool)

(declare-fun res!605228 () Bool)

(declare-fun e!499381 () Bool)

(assert (=> d!110511 (=> res!605228 e!499381)))

(assert (=> d!110511 (= res!605228 (= (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110511 (= (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 #b00000000000000000000000000000000) e!499381)))

(declare-fun b!894112 () Bool)

(declare-fun e!499382 () Bool)

(assert (=> b!894112 (= e!499381 e!499382)))

(declare-fun res!605229 () Bool)

(assert (=> b!894112 (=> (not res!605229) (not e!499382))))

(assert (=> b!894112 (= res!605229 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894113 () Bool)

(assert (=> b!894113 (= e!499382 (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110511 (not res!605228)) b!894112))

(assert (= (and b!894112 res!605229) b!894113))

(assert (=> d!110511 m!832041))

(declare-fun m!832141 () Bool)

(assert (=> b!894113 m!832141))

(assert (=> bm!39667 d!110511))

(assert (=> b!893951 d!110493))

(declare-fun d!110513 () Bool)

(declare-fun c!94309 () Bool)

(assert (=> d!110513 (= c!94309 (and ((_ is Cons!17797) (t!25130 (toList!5375 (map!12220 thiss!1181)))) (= (_1!6022 (h!18929 (t!25130 (toList!5375 (map!12220 thiss!1181))))) key!785)))))

(declare-fun e!499383 () Option!457)

(assert (=> d!110513 (= (getValueByKey!451 (t!25130 (toList!5375 (map!12220 thiss!1181))) key!785) e!499383)))

(declare-fun b!894114 () Bool)

(assert (=> b!894114 (= e!499383 (Some!456 (_2!6022 (h!18929 (t!25130 (toList!5375 (map!12220 thiss!1181)))))))))

(declare-fun b!894117 () Bool)

(declare-fun e!499384 () Option!457)

(assert (=> b!894117 (= e!499384 None!455)))

(declare-fun b!894116 () Bool)

(assert (=> b!894116 (= e!499384 (getValueByKey!451 (t!25130 (t!25130 (toList!5375 (map!12220 thiss!1181)))) key!785))))

(declare-fun b!894115 () Bool)

(assert (=> b!894115 (= e!499383 e!499384)))

(declare-fun c!94310 () Bool)

(assert (=> b!894115 (= c!94310 (and ((_ is Cons!17797) (t!25130 (toList!5375 (map!12220 thiss!1181)))) (not (= (_1!6022 (h!18929 (t!25130 (toList!5375 (map!12220 thiss!1181))))) key!785))))))

(assert (= (and d!110513 c!94309) b!894114))

(assert (= (and d!110513 (not c!94309)) b!894115))

(assert (= (and b!894115 c!94310) b!894116))

(assert (= (and b!894115 (not c!94310)) b!894117))

(declare-fun m!832143 () Bool)

(assert (=> b!894116 m!832143))

(assert (=> b!893929 d!110513))

(declare-fun d!110515 () Bool)

(declare-fun res!605240 () Bool)

(declare-fun e!499387 () Bool)

(assert (=> d!110515 (=> (not res!605240) (not e!499387))))

(assert (=> d!110515 (= res!605240 (validMask!0 (mask!25871 thiss!1181)))))

(assert (=> d!110515 (= (simpleValid!298 thiss!1181) e!499387)))

(declare-fun b!894126 () Bool)

(declare-fun res!605241 () Bool)

(assert (=> b!894126 (=> (not res!605241) (not e!499387))))

(assert (=> b!894126 (= res!605241 (and (= (size!25631 (_values!5314 thiss!1181)) (bvadd (mask!25871 thiss!1181) #b00000000000000000000000000000001)) (= (size!25630 (_keys!10019 thiss!1181)) (size!25631 (_values!5314 thiss!1181))) (bvsge (_size!2176 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2176 thiss!1181) (bvadd (mask!25871 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!894127 () Bool)

(declare-fun res!605238 () Bool)

(assert (=> b!894127 (=> (not res!605238) (not e!499387))))

(declare-fun size!25634 (LongMapFixedSize!4242) (_ BitVec 32))

(assert (=> b!894127 (= res!605238 (bvsge (size!25634 thiss!1181) (_size!2176 thiss!1181)))))

(declare-fun b!894128 () Bool)

(declare-fun res!605239 () Bool)

(assert (=> b!894128 (=> (not res!605239) (not e!499387))))

(assert (=> b!894128 (= res!605239 (= (size!25634 thiss!1181) (bvadd (_size!2176 thiss!1181) (bvsdiv (bvadd (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!894129 () Bool)

(assert (=> b!894129 (= e!499387 (and (bvsge (extraKeys!5023 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5023 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2176 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!110515 res!605240) b!894126))

(assert (= (and b!894126 res!605241) b!894127))

(assert (= (and b!894127 res!605238) b!894128))

(assert (= (and b!894128 res!605239) b!894129))

(assert (=> d!110515 m!832057))

(declare-fun m!832145 () Bool)

(assert (=> b!894127 m!832145))

(assert (=> b!894128 m!832145))

(assert (=> d!110475 d!110515))

(declare-fun b!894138 () Bool)

(declare-fun e!499392 () (_ BitVec 32))

(assert (=> b!894138 (= e!499392 #b00000000000000000000000000000000)))

(declare-fun d!110517 () Bool)

(declare-fun lt!404108 () (_ BitVec 32))

(assert (=> d!110517 (and (bvsge lt!404108 #b00000000000000000000000000000000) (bvsle lt!404108 (bvsub (size!25630 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110517 (= lt!404108 e!499392)))

(declare-fun c!94316 () Bool)

(assert (=> d!110517 (= c!94316 (bvsge #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110517 (and (bvsle #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25630 (_keys!10019 thiss!1181)) (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110517 (= (arrayCountValidKeys!0 (_keys!10019 thiss!1181) #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))) lt!404108)))

(declare-fun bm!39699 () Bool)

(declare-fun call!39702 () (_ BitVec 32))

(assert (=> bm!39699 (= call!39702 (arrayCountValidKeys!0 (_keys!10019 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894139 () Bool)

(declare-fun e!499393 () (_ BitVec 32))

(assert (=> b!894139 (= e!499392 e!499393)))

(declare-fun c!94315 () Bool)

(assert (=> b!894139 (= c!94315 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894140 () Bool)

(assert (=> b!894140 (= e!499393 call!39702)))

(declare-fun b!894141 () Bool)

(assert (=> b!894141 (= e!499393 (bvadd #b00000000000000000000000000000001 call!39702))))

(assert (= (and d!110517 c!94316) b!894138))

(assert (= (and d!110517 (not c!94316)) b!894139))

(assert (= (and b!894139 c!94315) b!894141))

(assert (= (and b!894139 (not c!94315)) b!894140))

(assert (= (or b!894141 b!894140) bm!39699))

(declare-fun m!832147 () Bool)

(assert (=> bm!39699 m!832147))

(assert (=> b!894139 m!832041))

(assert (=> b!894139 m!832041))

(assert (=> b!894139 m!832061))

(assert (=> b!893916 d!110517))

(declare-fun b!894143 () Bool)

(declare-fun e!499394 () Bool)

(assert (=> b!894143 (= e!499394 tp_is_empty!18189)))

(declare-fun condMapEmpty!28856 () Bool)

(declare-fun mapDefault!28856 () ValueCell!8613)

(assert (=> mapNonEmpty!28855 (= condMapEmpty!28856 (= mapRest!28855 ((as const (Array (_ BitVec 32) ValueCell!8613)) mapDefault!28856)))))

(declare-fun mapRes!28856 () Bool)

(assert (=> mapNonEmpty!28855 (= tp!55572 (and e!499394 mapRes!28856))))

(declare-fun mapIsEmpty!28856 () Bool)

(assert (=> mapIsEmpty!28856 mapRes!28856))

(declare-fun mapNonEmpty!28856 () Bool)

(declare-fun tp!55573 () Bool)

(declare-fun e!499395 () Bool)

(assert (=> mapNonEmpty!28856 (= mapRes!28856 (and tp!55573 e!499395))))

(declare-fun mapRest!28856 () (Array (_ BitVec 32) ValueCell!8613))

(declare-fun mapKey!28856 () (_ BitVec 32))

(declare-fun mapValue!28856 () ValueCell!8613)

(assert (=> mapNonEmpty!28856 (= mapRest!28855 (store mapRest!28856 mapKey!28856 mapValue!28856))))

(declare-fun b!894142 () Bool)

(assert (=> b!894142 (= e!499395 tp_is_empty!18189)))

(assert (= (and mapNonEmpty!28855 condMapEmpty!28856) mapIsEmpty!28856))

(assert (= (and mapNonEmpty!28855 (not condMapEmpty!28856)) mapNonEmpty!28856))

(assert (= (and mapNonEmpty!28856 ((_ is ValueCellFull!8613) mapValue!28856)) b!894142))

(assert (= (and mapNonEmpty!28855 ((_ is ValueCellFull!8613) mapDefault!28856)) b!894143))

(declare-fun m!832149 () Bool)

(assert (=> mapNonEmpty!28856 m!832149))

(declare-fun b_lambda!12941 () Bool)

(assert (= b_lambda!12939 (or (and b!893877 b_free!15861) b_lambda!12941)))

(check-sat (not bm!39684) (not b!894139) (not bm!39692) (not b!894105) (not d!110507) (not b!894128) (not bm!39696) tp_is_empty!18189 (not b!894023) (not d!110485) (not b!894045) (not d!110515) (not d!110487) (not b!894099) (not b_lambda!12937) (not d!110499) (not b!894106) (not b_lambda!12941) (not b!894024) (not b!894056) (not b!894085) (not bm!39689) (not b!894021) (not d!110501) (not b!894116) (not b!894038) (not b!894057) (not b!894040) (not b!894029) (not b!894030) (not b!894096) (not bm!39699) (not d!110489) (not mapNonEmpty!28856) (not d!110503) (not bm!39686) (not bm!39688) b_and!26145 (not b!894101) (not bm!39695) (not b!894127) (not b_next!15861) (not b!894082) (not b!894013) (not b!894019) (not d!110493) (not b!894103) (not b!894098) (not b!894113) (not b!894073) (not d!110495) (not b!894020))
(check-sat b_and!26145 (not b_next!15861))
(get-model)

(declare-fun d!110519 () Bool)

(declare-fun e!499398 () Bool)

(assert (=> d!110519 e!499398))

(declare-fun res!605246 () Bool)

(assert (=> d!110519 (=> (not res!605246) (not e!499398))))

(declare-fun lt!404118 () ListLongMap!10719)

(assert (=> d!110519 (= res!605246 (contains!4388 lt!404118 (_1!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))))))

(declare-fun lt!404117 () List!17801)

(assert (=> d!110519 (= lt!404118 (ListLongMap!10720 lt!404117))))

(declare-fun lt!404120 () Unit!30438)

(declare-fun lt!404119 () Unit!30438)

(assert (=> d!110519 (= lt!404120 lt!404119)))

(assert (=> d!110519 (= (getValueByKey!451 lt!404117 (_1!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!247 (List!17801 (_ BitVec 64) V!29217) Unit!30438)

(assert (=> d!110519 (= lt!404119 (lemmaContainsTupThenGetReturnValue!247 lt!404117 (_1!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))))))

(declare-fun insertStrictlySorted!304 (List!17801 (_ BitVec 64) V!29217) List!17801)

(assert (=> d!110519 (= lt!404117 (insertStrictlySorted!304 (toList!5375 call!39690) (_1!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))))))

(assert (=> d!110519 (= (+!2589 call!39690 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))) lt!404118)))

(declare-fun b!894148 () Bool)

(declare-fun res!605247 () Bool)

(assert (=> b!894148 (=> (not res!605247) (not e!499398))))

(assert (=> b!894148 (= res!605247 (= (getValueByKey!451 (toList!5375 lt!404118) (_1!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))))))

(declare-fun b!894149 () Bool)

(declare-fun contains!4390 (List!17801 tuple2!12022) Bool)

(assert (=> b!894149 (= e!499398 (contains!4390 (toList!5375 lt!404118) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))))

(assert (= (and d!110519 res!605246) b!894148))

(assert (= (and b!894148 res!605247) b!894149))

(declare-fun m!832151 () Bool)

(assert (=> d!110519 m!832151))

(declare-fun m!832153 () Bool)

(assert (=> d!110519 m!832153))

(declare-fun m!832155 () Bool)

(assert (=> d!110519 m!832155))

(declare-fun m!832157 () Bool)

(assert (=> d!110519 m!832157))

(declare-fun m!832159 () Bool)

(assert (=> b!894148 m!832159))

(declare-fun m!832161 () Bool)

(assert (=> b!894149 m!832161))

(assert (=> b!894020 d!110519))

(declare-fun d!110521 () Bool)

(declare-fun e!499399 () Bool)

(assert (=> d!110521 e!499399))

(declare-fun res!605248 () Bool)

(assert (=> d!110521 (=> res!605248 e!499399)))

(declare-fun lt!404122 () Bool)

(assert (=> d!110521 (= res!605248 (not lt!404122))))

(declare-fun lt!404123 () Bool)

(assert (=> d!110521 (= lt!404122 lt!404123)))

(declare-fun lt!404124 () Unit!30438)

(declare-fun e!499400 () Unit!30438)

(assert (=> d!110521 (= lt!404124 e!499400)))

(declare-fun c!94317 () Bool)

(assert (=> d!110521 (= c!94317 lt!404123)))

(assert (=> d!110521 (= lt!404123 (containsKey!423 (toList!5375 lt!404037) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110521 (= (contains!4388 lt!404037 #b0000000000000000000000000000000000000000000000000000000000000000) lt!404122)))

(declare-fun b!894150 () Bool)

(declare-fun lt!404121 () Unit!30438)

(assert (=> b!894150 (= e!499400 lt!404121)))

(assert (=> b!894150 (= lt!404121 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 lt!404037) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894150 (isDefined!328 (getValueByKey!451 (toList!5375 lt!404037) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894151 () Bool)

(declare-fun Unit!30445 () Unit!30438)

(assert (=> b!894151 (= e!499400 Unit!30445)))

(declare-fun b!894152 () Bool)

(assert (=> b!894152 (= e!499399 (isDefined!328 (getValueByKey!451 (toList!5375 lt!404037) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110521 c!94317) b!894150))

(assert (= (and d!110521 (not c!94317)) b!894151))

(assert (= (and d!110521 (not res!605248)) b!894152))

(declare-fun m!832163 () Bool)

(assert (=> d!110521 m!832163))

(declare-fun m!832165 () Bool)

(assert (=> b!894150 m!832165))

(declare-fun m!832167 () Bool)

(assert (=> b!894150 m!832167))

(assert (=> b!894150 m!832167))

(declare-fun m!832169 () Bool)

(assert (=> b!894150 m!832169))

(assert (=> b!894152 m!832167))

(assert (=> b!894152 m!832167))

(assert (=> b!894152 m!832169))

(assert (=> bm!39686 d!110521))

(declare-fun b!894165 () Bool)

(declare-fun e!499408 () SeekEntryResult!8864)

(assert (=> b!894165 (= e!499408 (Found!8864 (index!37829 lt!404080)))))

(declare-fun b!894166 () Bool)

(declare-fun e!499409 () SeekEntryResult!8864)

(assert (=> b!894166 (= e!499409 Undefined!8864)))

(declare-fun lt!404130 () SeekEntryResult!8864)

(declare-fun d!110523 () Bool)

(assert (=> d!110523 (and (or ((_ is Undefined!8864) lt!404130) (not ((_ is Found!8864) lt!404130)) (and (bvsge (index!37828 lt!404130) #b00000000000000000000000000000000) (bvslt (index!37828 lt!404130) (size!25630 (_keys!10019 thiss!1181))))) (or ((_ is Undefined!8864) lt!404130) ((_ is Found!8864) lt!404130) (not ((_ is MissingVacant!8864) lt!404130)) (not (= (index!37830 lt!404130) (index!37829 lt!404080))) (and (bvsge (index!37830 lt!404130) #b00000000000000000000000000000000) (bvslt (index!37830 lt!404130) (size!25630 (_keys!10019 thiss!1181))))) (or ((_ is Undefined!8864) lt!404130) (ite ((_ is Found!8864) lt!404130) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!404130)) key!785) (and ((_ is MissingVacant!8864) lt!404130) (= (index!37830 lt!404130) (index!37829 lt!404080)) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37830 lt!404130)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110523 (= lt!404130 e!499409)))

(declare-fun c!94326 () Bool)

(assert (=> d!110523 (= c!94326 (bvsge (x!76000 lt!404080) #b01111111111111111111111111111110))))

(declare-fun lt!404129 () (_ BitVec 64))

(assert (=> d!110523 (= lt!404129 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37829 lt!404080)))))

(assert (=> d!110523 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110523 (= (seekKeyOrZeroReturnVacant!0 (x!76000 lt!404080) (index!37829 lt!404080) (index!37829 lt!404080) key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) lt!404130)))

(declare-fun b!894167 () Bool)

(assert (=> b!894167 (= e!499409 e!499408)))

(declare-fun c!94324 () Bool)

(assert (=> b!894167 (= c!94324 (= lt!404129 key!785))))

(declare-fun b!894168 () Bool)

(declare-fun c!94325 () Bool)

(assert (=> b!894168 (= c!94325 (= lt!404129 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499407 () SeekEntryResult!8864)

(assert (=> b!894168 (= e!499408 e!499407)))

(declare-fun b!894169 () Bool)

(assert (=> b!894169 (= e!499407 (MissingVacant!8864 (index!37829 lt!404080)))))

(declare-fun b!894170 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894170 (= e!499407 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76000 lt!404080) #b00000000000000000000000000000001) (nextIndex!0 (index!37829 lt!404080) (x!76000 lt!404080) (mask!25871 thiss!1181)) (index!37829 lt!404080) key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(assert (= (and d!110523 c!94326) b!894166))

(assert (= (and d!110523 (not c!94326)) b!894167))

(assert (= (and b!894167 c!94324) b!894165))

(assert (= (and b!894167 (not c!94324)) b!894168))

(assert (= (and b!894168 c!94325) b!894169))

(assert (= (and b!894168 (not c!94325)) b!894170))

(declare-fun m!832171 () Bool)

(assert (=> d!110523 m!832171))

(declare-fun m!832173 () Bool)

(assert (=> d!110523 m!832173))

(assert (=> d!110523 m!832099))

(assert (=> d!110523 m!832057))

(declare-fun m!832175 () Bool)

(assert (=> b!894170 m!832175))

(assert (=> b!894170 m!832175))

(declare-fun m!832177 () Bool)

(assert (=> b!894170 m!832177))

(assert (=> b!894073 d!110523))

(declare-fun d!110525 () Bool)

(declare-fun e!499410 () Bool)

(assert (=> d!110525 e!499410))

(declare-fun res!605249 () Bool)

(assert (=> d!110525 (=> res!605249 e!499410)))

(declare-fun lt!404132 () Bool)

(assert (=> d!110525 (= res!605249 (not lt!404132))))

(declare-fun lt!404133 () Bool)

(assert (=> d!110525 (= lt!404132 lt!404133)))

(declare-fun lt!404134 () Unit!30438)

(declare-fun e!499411 () Unit!30438)

(assert (=> d!110525 (= lt!404134 e!499411)))

(declare-fun c!94327 () Bool)

(assert (=> d!110525 (= c!94327 lt!404133)))

(assert (=> d!110525 (= lt!404133 (containsKey!423 (toList!5375 (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181))) (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978))))))

(assert (=> d!110525 (= (contains!4388 (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)) (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978))) lt!404132)))

(declare-fun b!894171 () Bool)

(declare-fun lt!404131 () Unit!30438)

(assert (=> b!894171 (= e!499411 lt!404131)))

(assert (=> b!894171 (= lt!404131 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181))) (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978))))))

(assert (=> b!894171 (isDefined!328 (getValueByKey!451 (toList!5375 (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181))) (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978))))))

(declare-fun b!894172 () Bool)

(declare-fun Unit!30446 () Unit!30438)

(assert (=> b!894172 (= e!499411 Unit!30446)))

(declare-fun b!894173 () Bool)

(assert (=> b!894173 (= e!499410 (isDefined!328 (getValueByKey!451 (toList!5375 (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181))) (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)))))))

(assert (= (and d!110525 c!94327) b!894171))

(assert (= (and d!110525 (not c!94327)) b!894172))

(assert (= (and d!110525 (not res!605249)) b!894173))

(assert (=> d!110525 m!831997))

(declare-fun m!832179 () Bool)

(assert (=> d!110525 m!832179))

(assert (=> b!894171 m!831997))

(declare-fun m!832181 () Bool)

(assert (=> b!894171 m!832181))

(assert (=> b!894171 m!831997))

(declare-fun m!832183 () Bool)

(assert (=> b!894171 m!832183))

(assert (=> b!894171 m!832183))

(declare-fun m!832185 () Bool)

(assert (=> b!894171 m!832185))

(assert (=> b!894173 m!831997))

(assert (=> b!894173 m!832183))

(assert (=> b!894173 m!832183))

(assert (=> b!894173 m!832185))

(assert (=> b!894085 d!110525))

(assert (=> b!894085 d!110485))

(declare-fun d!110527 () Bool)

(assert (=> d!110527 (= (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!894019 d!110527))

(declare-fun d!110529 () Bool)

(assert (=> d!110529 (contains!4388 (getCurrentListMap!2651 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)) (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)))))

(assert (=> d!110529 true))

(declare-fun _$16!175 () Unit!30438)

(assert (=> d!110529 (= (choose!1470 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) (index!37828 lt!403978) (defaultEntry!5327 thiss!1181)) _$16!175)))

(declare-fun bs!25102 () Bool)

(assert (= bs!25102 d!110529))

(assert (=> bs!25102 m!831989))

(assert (=> bs!25102 m!831997))

(assert (=> bs!25102 m!831989))

(assert (=> bs!25102 m!831997))

(assert (=> bs!25102 m!832119))

(assert (=> d!110503 d!110529))

(declare-fun d!110531 () Bool)

(assert (=> d!110531 (= (validMask!0 (mask!25871 thiss!1181)) (and (or (= (mask!25871 thiss!1181) #b00000000000000000000000000000111) (= (mask!25871 thiss!1181) #b00000000000000000000000000001111) (= (mask!25871 thiss!1181) #b00000000000000000000000000011111) (= (mask!25871 thiss!1181) #b00000000000000000000000000111111) (= (mask!25871 thiss!1181) #b00000000000000000000000001111111) (= (mask!25871 thiss!1181) #b00000000000000000000000011111111) (= (mask!25871 thiss!1181) #b00000000000000000000000111111111) (= (mask!25871 thiss!1181) #b00000000000000000000001111111111) (= (mask!25871 thiss!1181) #b00000000000000000000011111111111) (= (mask!25871 thiss!1181) #b00000000000000000000111111111111) (= (mask!25871 thiss!1181) #b00000000000000000001111111111111) (= (mask!25871 thiss!1181) #b00000000000000000011111111111111) (= (mask!25871 thiss!1181) #b00000000000000000111111111111111) (= (mask!25871 thiss!1181) #b00000000000000001111111111111111) (= (mask!25871 thiss!1181) #b00000000000000011111111111111111) (= (mask!25871 thiss!1181) #b00000000000000111111111111111111) (= (mask!25871 thiss!1181) #b00000000000001111111111111111111) (= (mask!25871 thiss!1181) #b00000000000011111111111111111111) (= (mask!25871 thiss!1181) #b00000000000111111111111111111111) (= (mask!25871 thiss!1181) #b00000000001111111111111111111111) (= (mask!25871 thiss!1181) #b00000000011111111111111111111111) (= (mask!25871 thiss!1181) #b00000000111111111111111111111111) (= (mask!25871 thiss!1181) #b00000001111111111111111111111111) (= (mask!25871 thiss!1181) #b00000011111111111111111111111111) (= (mask!25871 thiss!1181) #b00000111111111111111111111111111) (= (mask!25871 thiss!1181) #b00001111111111111111111111111111) (= (mask!25871 thiss!1181) #b00011111111111111111111111111111) (= (mask!25871 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25871 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!110503 d!110531))

(declare-fun d!110533 () Bool)

(declare-fun isEmpty!682 (Option!457) Bool)

(assert (=> d!110533 (= (isDefined!328 (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785)) (not (isEmpty!682 (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785))))))

(declare-fun bs!25103 () Bool)

(assert (= bs!25103 d!110533))

(assert (=> bs!25103 m!831957))

(declare-fun m!832187 () Bool)

(assert (=> bs!25103 m!832187))

(assert (=> b!894040 d!110533))

(assert (=> b!894040 d!110479))

(assert (=> d!110515 d!110531))

(declare-fun d!110535 () Bool)

(assert (=> d!110535 (= (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965)) (and (not (= (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!894057 d!110535))

(declare-fun d!110537 () Bool)

(declare-fun res!605254 () Bool)

(declare-fun e!499416 () Bool)

(assert (=> d!110537 (=> res!605254 e!499416)))

(assert (=> d!110537 (= res!605254 (and ((_ is Cons!17797) (toList!5375 call!39669)) (= (_1!6022 (h!18929 (toList!5375 call!39669))) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785))))))

(assert (=> d!110537 (= (containsKey!423 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)) e!499416)))

(declare-fun b!894178 () Bool)

(declare-fun e!499417 () Bool)

(assert (=> b!894178 (= e!499416 e!499417)))

(declare-fun res!605255 () Bool)

(assert (=> b!894178 (=> (not res!605255) (not e!499417))))

(assert (=> b!894178 (= res!605255 (and (or (not ((_ is Cons!17797) (toList!5375 call!39669))) (bvsle (_1!6022 (h!18929 (toList!5375 call!39669))) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785))) ((_ is Cons!17797) (toList!5375 call!39669)) (bvslt (_1!6022 (h!18929 (toList!5375 call!39669))) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785))))))

(declare-fun b!894179 () Bool)

(assert (=> b!894179 (= e!499417 (containsKey!423 (t!25130 (toList!5375 call!39669)) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(assert (= (and d!110537 (not res!605254)) b!894178))

(assert (= (and b!894178 res!605255) b!894179))

(declare-fun m!832189 () Bool)

(assert (=> b!894179 m!832189))

(assert (=> d!110507 d!110537))

(declare-fun b!894180 () Bool)

(declare-fun e!499418 () Bool)

(declare-fun call!39703 () Bool)

(assert (=> b!894180 (= e!499418 call!39703)))

(declare-fun bm!39700 () Bool)

(assert (=> bm!39700 (= call!39703 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403965 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!894181 () Bool)

(declare-fun e!499419 () Bool)

(assert (=> b!894181 (= e!499419 e!499418)))

(declare-fun lt!404135 () (_ BitVec 64))

(assert (=> b!894181 (= lt!404135 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd lt!403965 #b00000000000000000000000000000001)))))

(declare-fun lt!404136 () Unit!30438)

(assert (=> b!894181 (= lt!404136 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10019 thiss!1181) lt!404135 (bvadd lt!403965 #b00000000000000000000000000000001)))))

(assert (=> b!894181 (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404135 #b00000000000000000000000000000000)))

(declare-fun lt!404137 () Unit!30438)

(assert (=> b!894181 (= lt!404137 lt!404136)))

(declare-fun res!605256 () Bool)

(assert (=> b!894181 (= res!605256 (= (seekEntryOrOpen!0 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd lt!403965 #b00000000000000000000000000000001)) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) (Found!8864 (bvadd lt!403965 #b00000000000000000000000000000001))))))

(assert (=> b!894181 (=> (not res!605256) (not e!499418))))

(declare-fun d!110539 () Bool)

(declare-fun res!605257 () Bool)

(declare-fun e!499420 () Bool)

(assert (=> d!110539 (=> res!605257 e!499420)))

(assert (=> d!110539 (= res!605257 (bvsge (bvadd lt!403965 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110539 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403965 #b00000000000000000000000000000001) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) e!499420)))

(declare-fun b!894182 () Bool)

(assert (=> b!894182 (= e!499420 e!499419)))

(declare-fun c!94328 () Bool)

(assert (=> b!894182 (= c!94328 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd lt!403965 #b00000000000000000000000000000001))))))

(declare-fun b!894183 () Bool)

(assert (=> b!894183 (= e!499419 call!39703)))

(assert (= (and d!110539 (not res!605257)) b!894182))

(assert (= (and b!894182 c!94328) b!894181))

(assert (= (and b!894182 (not c!94328)) b!894183))

(assert (= (and b!894181 res!605256) b!894180))

(assert (= (or b!894180 b!894183) bm!39700))

(declare-fun m!832191 () Bool)

(assert (=> bm!39700 m!832191))

(declare-fun m!832193 () Bool)

(assert (=> b!894181 m!832193))

(declare-fun m!832195 () Bool)

(assert (=> b!894181 m!832195))

(declare-fun m!832197 () Bool)

(assert (=> b!894181 m!832197))

(assert (=> b!894181 m!832193))

(declare-fun m!832199 () Bool)

(assert (=> b!894181 m!832199))

(assert (=> b!894182 m!832193))

(assert (=> b!894182 m!832193))

(declare-fun m!832201 () Bool)

(assert (=> b!894182 m!832201))

(assert (=> bm!39692 d!110539))

(declare-fun d!110541 () Bool)

(assert (=> d!110541 (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404066 #b00000000000000000000000000000000)))

(declare-fun lt!404138 () Unit!30438)

(assert (=> d!110541 (= lt!404138 (choose!13 (_keys!10019 thiss!1181) lt!404066 lt!403965))))

(assert (=> d!110541 (bvsge lt!403965 #b00000000000000000000000000000000)))

(assert (=> d!110541 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10019 thiss!1181) lt!404066 lt!403965) lt!404138)))

(declare-fun bs!25104 () Bool)

(assert (= bs!25104 d!110541))

(assert (=> bs!25104 m!832091))

(declare-fun m!832203 () Bool)

(assert (=> bs!25104 m!832203))

(assert (=> b!894056 d!110541))

(declare-fun d!110543 () Bool)

(declare-fun res!605258 () Bool)

(declare-fun e!499421 () Bool)

(assert (=> d!110543 (=> res!605258 e!499421)))

(assert (=> d!110543 (= res!605258 (= (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) lt!404066))))

(assert (=> d!110543 (= (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404066 #b00000000000000000000000000000000) e!499421)))

(declare-fun b!894184 () Bool)

(declare-fun e!499422 () Bool)

(assert (=> b!894184 (= e!499421 e!499422)))

(declare-fun res!605259 () Bool)

(assert (=> b!894184 (=> (not res!605259) (not e!499422))))

(assert (=> b!894184 (= res!605259 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894185 () Bool)

(assert (=> b!894185 (= e!499422 (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404066 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110543 (not res!605258)) b!894184))

(assert (= (and b!894184 res!605259) b!894185))

(assert (=> d!110543 m!832041))

(declare-fun m!832205 () Bool)

(assert (=> b!894185 m!832205))

(assert (=> b!894056 d!110543))

(declare-fun b!894198 () Bool)

(declare-fun e!499429 () SeekEntryResult!8864)

(assert (=> b!894198 (= e!499429 Undefined!8864)))

(declare-fun lt!404147 () SeekEntryResult!8864)

(declare-fun b!894199 () Bool)

(declare-fun e!499430 () SeekEntryResult!8864)

(assert (=> b!894199 (= e!499430 (seekKeyOrZeroReturnVacant!0 (x!76000 lt!404147) (index!37829 lt!404147) (index!37829 lt!404147) (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!894200 () Bool)

(declare-fun e!499431 () SeekEntryResult!8864)

(assert (=> b!894200 (= e!499431 (Found!8864 (index!37829 lt!404147)))))

(declare-fun b!894201 () Bool)

(assert (=> b!894201 (= e!499429 e!499431)))

(declare-fun lt!404145 () (_ BitVec 64))

(assert (=> b!894201 (= lt!404145 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37829 lt!404147)))))

(declare-fun c!94337 () Bool)

(assert (=> b!894201 (= c!94337 (= lt!404145 (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965)))))

(declare-fun d!110545 () Bool)

(declare-fun lt!404146 () SeekEntryResult!8864)

(assert (=> d!110545 (and (or ((_ is Undefined!8864) lt!404146) (not ((_ is Found!8864) lt!404146)) (and (bvsge (index!37828 lt!404146) #b00000000000000000000000000000000) (bvslt (index!37828 lt!404146) (size!25630 (_keys!10019 thiss!1181))))) (or ((_ is Undefined!8864) lt!404146) ((_ is Found!8864) lt!404146) (not ((_ is MissingZero!8864) lt!404146)) (and (bvsge (index!37827 lt!404146) #b00000000000000000000000000000000) (bvslt (index!37827 lt!404146) (size!25630 (_keys!10019 thiss!1181))))) (or ((_ is Undefined!8864) lt!404146) ((_ is Found!8864) lt!404146) ((_ is MissingZero!8864) lt!404146) (not ((_ is MissingVacant!8864) lt!404146)) (and (bvsge (index!37830 lt!404146) #b00000000000000000000000000000000) (bvslt (index!37830 lt!404146) (size!25630 (_keys!10019 thiss!1181))))) (or ((_ is Undefined!8864) lt!404146) (ite ((_ is Found!8864) lt!404146) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!404146)) (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965)) (ite ((_ is MissingZero!8864) lt!404146) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37827 lt!404146)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8864) lt!404146) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37830 lt!404146)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110545 (= lt!404146 e!499429)))

(declare-fun c!94336 () Bool)

(assert (=> d!110545 (= c!94336 (and ((_ is Intermediate!8864) lt!404147) (undefined!9676 lt!404147)))))

(assert (=> d!110545 (= lt!404147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965) (mask!25871 thiss!1181)) (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(assert (=> d!110545 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110545 (= (seekEntryOrOpen!0 (select (arr!25185 (_keys!10019 thiss!1181)) lt!403965) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) lt!404146)))

(declare-fun b!894202 () Bool)

(declare-fun c!94335 () Bool)

(assert (=> b!894202 (= c!94335 (= lt!404145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894202 (= e!499431 e!499430)))

(declare-fun b!894203 () Bool)

(assert (=> b!894203 (= e!499430 (MissingZero!8864 (index!37829 lt!404147)))))

(assert (= (and d!110545 c!94336) b!894198))

(assert (= (and d!110545 (not c!94336)) b!894201))

(assert (= (and b!894201 c!94337) b!894200))

(assert (= (and b!894201 (not c!94337)) b!894202))

(assert (= (and b!894202 c!94335) b!894203))

(assert (= (and b!894202 (not c!94335)) b!894199))

(assert (=> b!894199 m!832087))

(declare-fun m!832207 () Bool)

(assert (=> b!894199 m!832207))

(declare-fun m!832209 () Bool)

(assert (=> b!894201 m!832209))

(declare-fun m!832211 () Bool)

(assert (=> d!110545 m!832211))

(declare-fun m!832213 () Bool)

(assert (=> d!110545 m!832213))

(declare-fun m!832215 () Bool)

(assert (=> d!110545 m!832215))

(assert (=> d!110545 m!832087))

(declare-fun m!832217 () Bool)

(assert (=> d!110545 m!832217))

(assert (=> d!110545 m!832087))

(assert (=> d!110545 m!832215))

(declare-fun m!832219 () Bool)

(assert (=> d!110545 m!832219))

(assert (=> d!110545 m!832057))

(assert (=> b!894056 d!110545))

(declare-fun d!110547 () Bool)

(assert (=> d!110547 (isDefined!328 (getValueByKey!451 (toList!5375 (map!12220 thiss!1181)) key!785))))

(declare-fun lt!404150 () Unit!30438)

(declare-fun choose!1471 (List!17801 (_ BitVec 64)) Unit!30438)

(assert (=> d!110547 (= lt!404150 (choose!1471 (toList!5375 (map!12220 thiss!1181)) key!785))))

(declare-fun e!499434 () Bool)

(assert (=> d!110547 e!499434))

(declare-fun res!605262 () Bool)

(assert (=> d!110547 (=> (not res!605262) (not e!499434))))

(declare-fun isStrictlySorted!496 (List!17801) Bool)

(assert (=> d!110547 (= res!605262 (isStrictlySorted!496 (toList!5375 (map!12220 thiss!1181))))))

(assert (=> d!110547 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 (map!12220 thiss!1181)) key!785) lt!404150)))

(declare-fun b!894206 () Bool)

(assert (=> b!894206 (= e!499434 (containsKey!423 (toList!5375 (map!12220 thiss!1181)) key!785))))

(assert (= (and d!110547 res!605262) b!894206))

(assert (=> d!110547 m!831957))

(assert (=> d!110547 m!831957))

(assert (=> d!110547 m!832081))

(declare-fun m!832221 () Bool)

(assert (=> d!110547 m!832221))

(declare-fun m!832223 () Bool)

(assert (=> d!110547 m!832223))

(assert (=> b!894206 m!832077))

(assert (=> b!894038 d!110547))

(assert (=> b!894038 d!110533))

(assert (=> b!894038 d!110479))

(declare-fun b!894231 () Bool)

(declare-fun e!499455 () ListLongMap!10719)

(declare-fun call!39706 () ListLongMap!10719)

(assert (=> b!894231 (= e!499455 call!39706)))

(declare-fun b!894232 () Bool)

(declare-fun e!499450 () Bool)

(declare-fun e!499451 () Bool)

(assert (=> b!894232 (= e!499450 e!499451)))

(assert (=> b!894232 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun res!605272 () Bool)

(declare-fun lt!404166 () ListLongMap!10719)

(assert (=> b!894232 (= res!605272 (contains!4388 lt!404166 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894232 (=> (not res!605272) (not e!499451))))

(declare-fun b!894233 () Bool)

(declare-fun res!605274 () Bool)

(declare-fun e!499454 () Bool)

(assert (=> b!894233 (=> (not res!605274) (not e!499454))))

(assert (=> b!894233 (= res!605274 (not (contains!4388 lt!404166 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!894234 () Bool)

(declare-fun e!499452 () Bool)

(assert (=> b!894234 (= e!499452 (= lt!404166 (getCurrentListMapNoExtraKeys!3276 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5327 thiss!1181))))))

(declare-fun b!894235 () Bool)

(assert (=> b!894235 (= e!499454 e!499450)))

(declare-fun c!94346 () Bool)

(declare-fun e!499453 () Bool)

(assert (=> b!894235 (= c!94346 e!499453)))

(declare-fun res!605271 () Bool)

(assert (=> b!894235 (=> (not res!605271) (not e!499453))))

(assert (=> b!894235 (= res!605271 (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun bm!39703 () Bool)

(assert (=> bm!39703 (= call!39706 (getCurrentListMapNoExtraKeys!3276 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5327 thiss!1181)))))

(declare-fun b!894236 () Bool)

(declare-fun isEmpty!683 (ListLongMap!10719) Bool)

(assert (=> b!894236 (= e!499452 (isEmpty!683 lt!404166))))

(declare-fun b!894237 () Bool)

(assert (=> b!894237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> b!894237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25631 (_values!5314 thiss!1181))))))

(assert (=> b!894237 (= e!499451 (= (apply!408 lt!404166 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)) (get!13264 (select (arr!25186 (_values!5314 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1299 (defaultEntry!5327 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!894238 () Bool)

(assert (=> b!894238 (= e!499450 e!499452)))

(declare-fun c!94349 () Bool)

(assert (=> b!894238 (= c!94349 (bvslt #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894239 () Bool)

(declare-fun e!499449 () ListLongMap!10719)

(assert (=> b!894239 (= e!499449 e!499455)))

(declare-fun c!94348 () Bool)

(assert (=> b!894239 (= c!94348 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894240 () Bool)

(assert (=> b!894240 (= e!499453 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894240 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!110549 () Bool)

(assert (=> d!110549 e!499454))

(declare-fun res!605273 () Bool)

(assert (=> d!110549 (=> (not res!605273) (not e!499454))))

(assert (=> d!110549 (= res!605273 (not (contains!4388 lt!404166 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!110549 (= lt!404166 e!499449)))

(declare-fun c!94347 () Bool)

(assert (=> d!110549 (= c!94347 (bvsge #b00000000000000000000000000000000 (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110549 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110549 (= (getCurrentListMapNoExtraKeys!3276 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5327 thiss!1181)) lt!404166)))

(declare-fun b!894241 () Bool)

(declare-fun lt!404170 () Unit!30438)

(declare-fun lt!404167 () Unit!30438)

(assert (=> b!894241 (= lt!404170 lt!404167)))

(declare-fun lt!404171 () V!29217)

(declare-fun lt!404169 () (_ BitVec 64))

(declare-fun lt!404165 () ListLongMap!10719)

(declare-fun lt!404168 () (_ BitVec 64))

(assert (=> b!894241 (not (contains!4388 (+!2589 lt!404165 (tuple2!12023 lt!404168 lt!404171)) lt!404169))))

(declare-fun addStillNotContains!213 (ListLongMap!10719 (_ BitVec 64) V!29217 (_ BitVec 64)) Unit!30438)

(assert (=> b!894241 (= lt!404167 (addStillNotContains!213 lt!404165 lt!404168 lt!404171 lt!404169))))

(assert (=> b!894241 (= lt!404169 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!894241 (= lt!404171 (get!13264 (select (arr!25186 (_values!5314 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1299 (defaultEntry!5327 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!894241 (= lt!404168 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894241 (= lt!404165 call!39706)))

(assert (=> b!894241 (= e!499455 (+!2589 call!39706 (tuple2!12023 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) (get!13264 (select (arr!25186 (_values!5314 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1299 (defaultEntry!5327 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!894242 () Bool)

(assert (=> b!894242 (= e!499449 (ListLongMap!10720 Nil!17798))))

(assert (= (and d!110549 c!94347) b!894242))

(assert (= (and d!110549 (not c!94347)) b!894239))

(assert (= (and b!894239 c!94348) b!894241))

(assert (= (and b!894239 (not c!94348)) b!894231))

(assert (= (or b!894241 b!894231) bm!39703))

(assert (= (and d!110549 res!605273) b!894233))

(assert (= (and b!894233 res!605274) b!894235))

(assert (= (and b!894235 res!605271) b!894240))

(assert (= (and b!894235 c!94346) b!894232))

(assert (= (and b!894235 (not c!94346)) b!894238))

(assert (= (and b!894232 res!605272) b!894237))

(assert (= (and b!894238 c!94349) b!894234))

(assert (= (and b!894238 (not c!94349)) b!894236))

(declare-fun b_lambda!12943 () Bool)

(assert (=> (not b_lambda!12943) (not b!894237)))

(assert (=> b!894237 t!25136))

(declare-fun b_and!26147 () Bool)

(assert (= b_and!26145 (and (=> t!25136 result!10083) b_and!26147)))

(declare-fun b_lambda!12945 () Bool)

(assert (=> (not b_lambda!12945) (not b!894241)))

(assert (=> b!894241 t!25136))

(declare-fun b_and!26149 () Bool)

(assert (= b_and!26147 (and (=> t!25136 result!10083) b_and!26149)))

(assert (=> b!894241 m!832065))

(assert (=> b!894241 m!832067))

(assert (=> b!894241 m!832069))

(declare-fun m!832225 () Bool)

(assert (=> b!894241 m!832225))

(assert (=> b!894241 m!832225))

(declare-fun m!832227 () Bool)

(assert (=> b!894241 m!832227))

(declare-fun m!832229 () Bool)

(assert (=> b!894241 m!832229))

(declare-fun m!832231 () Bool)

(assert (=> b!894241 m!832231))

(assert (=> b!894241 m!832041))

(assert (=> b!894241 m!832067))

(assert (=> b!894241 m!832065))

(declare-fun m!832233 () Bool)

(assert (=> b!894233 m!832233))

(assert (=> b!894237 m!832065))

(assert (=> b!894237 m!832067))

(assert (=> b!894237 m!832069))

(assert (=> b!894237 m!832041))

(declare-fun m!832235 () Bool)

(assert (=> b!894237 m!832235))

(assert (=> b!894237 m!832041))

(assert (=> b!894237 m!832067))

(assert (=> b!894237 m!832065))

(assert (=> b!894240 m!832041))

(assert (=> b!894240 m!832041))

(assert (=> b!894240 m!832061))

(assert (=> b!894239 m!832041))

(assert (=> b!894239 m!832041))

(assert (=> b!894239 m!832061))

(declare-fun m!832237 () Bool)

(assert (=> b!894234 m!832237))

(declare-fun m!832239 () Bool)

(assert (=> d!110549 m!832239))

(assert (=> d!110549 m!832057))

(assert (=> bm!39703 m!832237))

(declare-fun m!832241 () Bool)

(assert (=> b!894236 m!832241))

(assert (=> b!894232 m!832041))

(assert (=> b!894232 m!832041))

(declare-fun m!832243 () Bool)

(assert (=> b!894232 m!832243))

(assert (=> bm!39684 d!110549))

(assert (=> d!110495 d!110491))

(declare-fun d!110551 () Bool)

(assert (=> d!110551 (arrayForallSeekEntryOrOpenFound!0 lt!403965 (_keys!10019 thiss!1181) (mask!25871 thiss!1181))))

(assert (=> d!110551 true))

(declare-fun _$72!122 () Unit!30438)

(assert (=> d!110551 (= (choose!38 (_keys!10019 thiss!1181) (mask!25871 thiss!1181) #b00000000000000000000000000000000 lt!403965) _$72!122)))

(declare-fun bs!25105 () Bool)

(assert (= bs!25105 d!110551))

(assert (=> bs!25105 m!832009))

(assert (=> d!110495 d!110551))

(assert (=> d!110495 d!110531))

(declare-fun d!110553 () Bool)

(assert (=> d!110553 (= (apply!408 lt!404037 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)) (get!13262 (getValueByKey!451 (toList!5375 lt!404037) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25106 () Bool)

(assert (= bs!25106 d!110553))

(assert (=> bs!25106 m!832041))

(declare-fun m!832245 () Bool)

(assert (=> bs!25106 m!832245))

(assert (=> bs!25106 m!832245))

(declare-fun m!832247 () Bool)

(assert (=> bs!25106 m!832247))

(assert (=> b!894030 d!110553))

(declare-fun d!110555 () Bool)

(declare-fun c!94352 () Bool)

(assert (=> d!110555 (= c!94352 ((_ is ValueCellFull!8613) (select (arr!25186 (_values!5314 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499458 () V!29217)

(assert (=> d!110555 (= (get!13264 (select (arr!25186 (_values!5314 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1299 (defaultEntry!5327 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!499458)))

(declare-fun b!894247 () Bool)

(declare-fun get!13265 (ValueCell!8613 V!29217) V!29217)

(assert (=> b!894247 (= e!499458 (get!13265 (select (arr!25186 (_values!5314 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1299 (defaultEntry!5327 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!894248 () Bool)

(declare-fun get!13266 (ValueCell!8613 V!29217) V!29217)

(assert (=> b!894248 (= e!499458 (get!13266 (select (arr!25186 (_values!5314 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1299 (defaultEntry!5327 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110555 c!94352) b!894247))

(assert (= (and d!110555 (not c!94352)) b!894248))

(assert (=> b!894247 m!832065))

(assert (=> b!894247 m!832067))

(declare-fun m!832249 () Bool)

(assert (=> b!894247 m!832249))

(assert (=> b!894248 m!832065))

(assert (=> b!894248 m!832067))

(declare-fun m!832251 () Bool)

(assert (=> b!894248 m!832251))

(assert (=> b!894030 d!110555))

(declare-fun d!110557 () Bool)

(declare-fun c!94353 () Bool)

(assert (=> d!110557 (= c!94353 (and ((_ is Cons!17797) (t!25130 (t!25130 (toList!5375 (map!12220 thiss!1181))))) (= (_1!6022 (h!18929 (t!25130 (t!25130 (toList!5375 (map!12220 thiss!1181)))))) key!785)))))

(declare-fun e!499459 () Option!457)

(assert (=> d!110557 (= (getValueByKey!451 (t!25130 (t!25130 (toList!5375 (map!12220 thiss!1181)))) key!785) e!499459)))

(declare-fun b!894249 () Bool)

(assert (=> b!894249 (= e!499459 (Some!456 (_2!6022 (h!18929 (t!25130 (t!25130 (toList!5375 (map!12220 thiss!1181))))))))))

(declare-fun b!894252 () Bool)

(declare-fun e!499460 () Option!457)

(assert (=> b!894252 (= e!499460 None!455)))

(declare-fun b!894251 () Bool)

(assert (=> b!894251 (= e!499460 (getValueByKey!451 (t!25130 (t!25130 (t!25130 (toList!5375 (map!12220 thiss!1181))))) key!785))))

(declare-fun b!894250 () Bool)

(assert (=> b!894250 (= e!499459 e!499460)))

(declare-fun c!94354 () Bool)

(assert (=> b!894250 (= c!94354 (and ((_ is Cons!17797) (t!25130 (t!25130 (toList!5375 (map!12220 thiss!1181))))) (not (= (_1!6022 (h!18929 (t!25130 (t!25130 (toList!5375 (map!12220 thiss!1181)))))) key!785))))))

(assert (= (and d!110557 c!94353) b!894249))

(assert (= (and d!110557 (not c!94353)) b!894250))

(assert (= (and b!894250 c!94354) b!894251))

(assert (= (and b!894250 (not c!94354)) b!894252))

(declare-fun m!832253 () Bool)

(assert (=> b!894251 m!832253))

(assert (=> b!894116 d!110557))

(declare-fun d!110559 () Bool)

(assert (=> d!110559 (= (apply!408 lt!404037 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13262 (getValueByKey!451 (toList!5375 lt!404037) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25107 () Bool)

(assert (= bs!25107 d!110559))

(assert (=> bs!25107 m!832167))

(assert (=> bs!25107 m!832167))

(declare-fun m!832255 () Bool)

(assert (=> bs!25107 m!832255))

(assert (=> b!894029 d!110559))

(assert (=> b!894106 d!110527))

(assert (=> d!110499 d!110493))

(declare-fun d!110561 () Bool)

(declare-fun lt!404174 () SeekEntryResult!8864)

(assert (=> d!110561 (and ((_ is Found!8864) lt!404174) (= (index!37828 lt!404174) lt!403965))))

(assert (=> d!110561 (= lt!404174 (seekEntry!0 key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(assert (=> d!110561 true))

(declare-fun _$57!22 () Unit!30438)

(assert (=> d!110561 (= (choose!0 key!785 lt!403965 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) _$57!22)))

(declare-fun bs!25108 () Bool)

(assert (= bs!25108 d!110561))

(assert (=> bs!25108 m!832003))

(assert (=> d!110499 d!110561))

(assert (=> d!110499 d!110531))

(assert (=> b!894099 d!110527))

(declare-fun d!110563 () Bool)

(declare-fun e!499461 () Bool)

(assert (=> d!110563 e!499461))

(declare-fun res!605275 () Bool)

(assert (=> d!110563 (=> res!605275 e!499461)))

(declare-fun lt!404176 () Bool)

(assert (=> d!110563 (= res!605275 (not lt!404176))))

(declare-fun lt!404177 () Bool)

(assert (=> d!110563 (= lt!404176 lt!404177)))

(declare-fun lt!404178 () Unit!30438)

(declare-fun e!499462 () Unit!30438)

(assert (=> d!110563 (= lt!404178 e!499462)))

(declare-fun c!94355 () Bool)

(assert (=> d!110563 (= c!94355 lt!404177)))

(assert (=> d!110563 (= lt!404177 (containsKey!423 (toList!5375 lt!404037) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110563 (= (contains!4388 lt!404037 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)) lt!404176)))

(declare-fun b!894253 () Bool)

(declare-fun lt!404175 () Unit!30438)

(assert (=> b!894253 (= e!499462 lt!404175)))

(assert (=> b!894253 (= lt!404175 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 lt!404037) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!894253 (isDefined!328 (getValueByKey!451 (toList!5375 lt!404037) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894254 () Bool)

(declare-fun Unit!30447 () Unit!30438)

(assert (=> b!894254 (= e!499462 Unit!30447)))

(declare-fun b!894255 () Bool)

(assert (=> b!894255 (= e!499461 (isDefined!328 (getValueByKey!451 (toList!5375 lt!404037) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!110563 c!94355) b!894253))

(assert (= (and d!110563 (not c!94355)) b!894254))

(assert (= (and d!110563 (not res!605275)) b!894255))

(assert (=> d!110563 m!832041))

(declare-fun m!832257 () Bool)

(assert (=> d!110563 m!832257))

(assert (=> b!894253 m!832041))

(declare-fun m!832259 () Bool)

(assert (=> b!894253 m!832259))

(assert (=> b!894253 m!832041))

(assert (=> b!894253 m!832245))

(assert (=> b!894253 m!832245))

(declare-fun m!832261 () Bool)

(assert (=> b!894253 m!832261))

(assert (=> b!894255 m!832041))

(assert (=> b!894255 m!832245))

(assert (=> b!894255 m!832245))

(assert (=> b!894255 m!832261))

(assert (=> b!894013 d!110563))

(declare-fun b!894274 () Bool)

(declare-fun e!499475 () SeekEntryResult!8864)

(assert (=> b!894274 (= e!499475 (Intermediate!8864 true (toIndex!0 key!785 (mask!25871 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894275 () Bool)

(declare-fun e!499474 () SeekEntryResult!8864)

(assert (=> b!894275 (= e!499474 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25871 thiss!1181)) #b00000000000000000000000000000000 (mask!25871 thiss!1181)) key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!894276 () Bool)

(declare-fun e!499476 () Bool)

(declare-fun e!499473 () Bool)

(assert (=> b!894276 (= e!499476 e!499473)))

(declare-fun res!605282 () Bool)

(declare-fun lt!404183 () SeekEntryResult!8864)

(assert (=> b!894276 (= res!605282 (and ((_ is Intermediate!8864) lt!404183) (not (undefined!9676 lt!404183)) (bvslt (x!76000 lt!404183) #b01111111111111111111111111111110) (bvsge (x!76000 lt!404183) #b00000000000000000000000000000000) (bvsge (x!76000 lt!404183) #b00000000000000000000000000000000)))))

(assert (=> b!894276 (=> (not res!605282) (not e!499473))))

(declare-fun b!894277 () Bool)

(assert (=> b!894277 (and (bvsge (index!37829 lt!404183) #b00000000000000000000000000000000) (bvslt (index!37829 lt!404183) (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun res!605284 () Bool)

(assert (=> b!894277 (= res!605284 (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37829 lt!404183)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499477 () Bool)

(assert (=> b!894277 (=> res!605284 e!499477)))

(declare-fun d!110565 () Bool)

(assert (=> d!110565 e!499476))

(declare-fun c!94363 () Bool)

(assert (=> d!110565 (= c!94363 (and ((_ is Intermediate!8864) lt!404183) (undefined!9676 lt!404183)))))

(assert (=> d!110565 (= lt!404183 e!499475)))

(declare-fun c!94364 () Bool)

(assert (=> d!110565 (= c!94364 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!404184 () (_ BitVec 64))

(assert (=> d!110565 (= lt!404184 (select (arr!25185 (_keys!10019 thiss!1181)) (toIndex!0 key!785 (mask!25871 thiss!1181))))))

(assert (=> d!110565 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25871 thiss!1181)) key!785 (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) lt!404183)))

(declare-fun b!894278 () Bool)

(assert (=> b!894278 (and (bvsge (index!37829 lt!404183) #b00000000000000000000000000000000) (bvslt (index!37829 lt!404183) (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun res!605283 () Bool)

(assert (=> b!894278 (= res!605283 (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37829 lt!404183)) key!785))))

(assert (=> b!894278 (=> res!605283 e!499477)))

(assert (=> b!894278 (= e!499473 e!499477)))

(declare-fun b!894279 () Bool)

(assert (=> b!894279 (= e!499475 e!499474)))

(declare-fun c!94362 () Bool)

(assert (=> b!894279 (= c!94362 (or (= lt!404184 key!785) (= (bvadd lt!404184 lt!404184) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!894280 () Bool)

(assert (=> b!894280 (= e!499476 (bvsge (x!76000 lt!404183) #b01111111111111111111111111111110))))

(declare-fun b!894281 () Bool)

(assert (=> b!894281 (and (bvsge (index!37829 lt!404183) #b00000000000000000000000000000000) (bvslt (index!37829 lt!404183) (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> b!894281 (= e!499477 (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37829 lt!404183)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894282 () Bool)

(assert (=> b!894282 (= e!499474 (Intermediate!8864 false (toIndex!0 key!785 (mask!25871 thiss!1181)) #b00000000000000000000000000000000))))

(assert (= (and d!110565 c!94364) b!894274))

(assert (= (and d!110565 (not c!94364)) b!894279))

(assert (= (and b!894279 c!94362) b!894282))

(assert (= (and b!894279 (not c!94362)) b!894275))

(assert (= (and d!110565 c!94363) b!894280))

(assert (= (and d!110565 (not c!94363)) b!894276))

(assert (= (and b!894276 res!605282) b!894278))

(assert (= (and b!894278 (not res!605283)) b!894277))

(assert (= (and b!894277 (not res!605284)) b!894281))

(assert (=> d!110565 m!832103))

(declare-fun m!832263 () Bool)

(assert (=> d!110565 m!832263))

(assert (=> d!110565 m!832057))

(assert (=> b!894275 m!832103))

(declare-fun m!832265 () Bool)

(assert (=> b!894275 m!832265))

(assert (=> b!894275 m!832265))

(declare-fun m!832267 () Bool)

(assert (=> b!894275 m!832267))

(declare-fun m!832269 () Bool)

(assert (=> b!894281 m!832269))

(assert (=> b!894278 m!832269))

(assert (=> b!894277 m!832269))

(assert (=> d!110493 d!110565))

(declare-fun d!110567 () Bool)

(declare-fun lt!404190 () (_ BitVec 32))

(declare-fun lt!404189 () (_ BitVec 32))

(assert (=> d!110567 (= lt!404190 (bvmul (bvxor lt!404189 (bvlshr lt!404189 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110567 (= lt!404189 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110567 (and (bvsge (mask!25871 thiss!1181) #b00000000000000000000000000000000) (let ((res!605285 (let ((h!18932 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76012 (bvmul (bvxor h!18932 (bvlshr h!18932 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76012 (bvlshr x!76012 #b00000000000000000000000000001101)) (mask!25871 thiss!1181)))))) (and (bvslt res!605285 (bvadd (mask!25871 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605285 #b00000000000000000000000000000000))))))

(assert (=> d!110567 (= (toIndex!0 key!785 (mask!25871 thiss!1181)) (bvand (bvxor lt!404190 (bvlshr lt!404190 #b00000000000000000000000000001101)) (mask!25871 thiss!1181)))))

(assert (=> d!110493 d!110567))

(assert (=> d!110493 d!110531))

(declare-fun b!894283 () Bool)

(declare-fun e!499481 () Bool)

(declare-fun e!499478 () Bool)

(assert (=> b!894283 (= e!499481 e!499478)))

(declare-fun res!605288 () Bool)

(assert (=> b!894283 (=> (not res!605288) (not e!499478))))

(declare-fun e!499479 () Bool)

(assert (=> b!894283 (= res!605288 (not e!499479))))

(declare-fun res!605287 () Bool)

(assert (=> b!894283 (=> (not res!605287) (not e!499479))))

(assert (=> b!894283 (= res!605287 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894284 () Bool)

(declare-fun e!499480 () Bool)

(declare-fun call!39707 () Bool)

(assert (=> b!894284 (= e!499480 call!39707)))

(declare-fun bm!39704 () Bool)

(declare-fun c!94365 () Bool)

(assert (=> bm!39704 (= call!39707 (arrayNoDuplicates!0 (_keys!10019 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!94365 (Cons!17799 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!94306 (Cons!17799 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) Nil!17800) Nil!17800)) (ite c!94306 (Cons!17799 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) Nil!17800) Nil!17800))))))

(declare-fun d!110569 () Bool)

(declare-fun res!605286 () Bool)

(assert (=> d!110569 (=> res!605286 e!499481)))

(assert (=> d!110569 (= res!605286 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110569 (= (arrayNoDuplicates!0 (_keys!10019 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94306 (Cons!17799 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) Nil!17800) Nil!17800)) e!499481)))

(declare-fun b!894285 () Bool)

(assert (=> b!894285 (= e!499479 (contains!4389 (ite c!94306 (Cons!17799 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) Nil!17800) Nil!17800) (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894286 () Bool)

(assert (=> b!894286 (= e!499478 e!499480)))

(assert (=> b!894286 (= c!94365 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894287 () Bool)

(assert (=> b!894287 (= e!499480 call!39707)))

(assert (= (and d!110569 (not res!605286)) b!894283))

(assert (= (and b!894283 res!605287) b!894285))

(assert (= (and b!894283 res!605288) b!894286))

(assert (= (and b!894286 c!94365) b!894284))

(assert (= (and b!894286 (not c!94365)) b!894287))

(assert (= (or b!894284 b!894287) bm!39704))

(declare-fun m!832271 () Bool)

(assert (=> b!894283 m!832271))

(assert (=> b!894283 m!832271))

(declare-fun m!832273 () Bool)

(assert (=> b!894283 m!832273))

(assert (=> bm!39704 m!832271))

(declare-fun m!832275 () Bool)

(assert (=> bm!39704 m!832275))

(assert (=> b!894285 m!832271))

(assert (=> b!894285 m!832271))

(declare-fun m!832277 () Bool)

(assert (=> b!894285 m!832277))

(assert (=> b!894286 m!832271))

(assert (=> b!894286 m!832271))

(assert (=> b!894286 m!832273))

(assert (=> bm!39695 d!110569))

(declare-fun d!110571 () Bool)

(assert (=> d!110571 (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404103 #b00000000000000000000000000000000)))

(declare-fun lt!404191 () Unit!30438)

(assert (=> d!110571 (= lt!404191 (choose!13 (_keys!10019 thiss!1181) lt!404103 #b00000000000000000000000000000000))))

(assert (=> d!110571 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!110571 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10019 thiss!1181) lt!404103 #b00000000000000000000000000000000) lt!404191)))

(declare-fun bs!25109 () Bool)

(assert (= bs!25109 d!110571))

(assert (=> bs!25109 m!832137))

(declare-fun m!832279 () Bool)

(assert (=> bs!25109 m!832279))

(assert (=> b!894105 d!110571))

(declare-fun d!110573 () Bool)

(declare-fun res!605289 () Bool)

(declare-fun e!499482 () Bool)

(assert (=> d!110573 (=> res!605289 e!499482)))

(assert (=> d!110573 (= res!605289 (= (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) lt!404103))))

(assert (=> d!110573 (= (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404103 #b00000000000000000000000000000000) e!499482)))

(declare-fun b!894288 () Bool)

(declare-fun e!499483 () Bool)

(assert (=> b!894288 (= e!499482 e!499483)))

(declare-fun res!605290 () Bool)

(assert (=> b!894288 (=> (not res!605290) (not e!499483))))

(assert (=> b!894288 (= res!605290 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894289 () Bool)

(assert (=> b!894289 (= e!499483 (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110573 (not res!605289)) b!894288))

(assert (= (and b!894288 res!605290) b!894289))

(assert (=> d!110573 m!832041))

(declare-fun m!832281 () Bool)

(assert (=> b!894289 m!832281))

(assert (=> b!894105 d!110573))

(declare-fun b!894290 () Bool)

(declare-fun e!499484 () SeekEntryResult!8864)

(assert (=> b!894290 (= e!499484 Undefined!8864)))

(declare-fun b!894291 () Bool)

(declare-fun e!499485 () SeekEntryResult!8864)

(declare-fun lt!404194 () SeekEntryResult!8864)

(assert (=> b!894291 (= e!499485 (seekKeyOrZeroReturnVacant!0 (x!76000 lt!404194) (index!37829 lt!404194) (index!37829 lt!404194) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!894292 () Bool)

(declare-fun e!499486 () SeekEntryResult!8864)

(assert (=> b!894292 (= e!499486 (Found!8864 (index!37829 lt!404194)))))

(declare-fun b!894293 () Bool)

(assert (=> b!894293 (= e!499484 e!499486)))

(declare-fun lt!404192 () (_ BitVec 64))

(assert (=> b!894293 (= lt!404192 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37829 lt!404194)))))

(declare-fun c!94368 () Bool)

(assert (=> b!894293 (= c!94368 (= lt!404192 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110575 () Bool)

(declare-fun lt!404193 () SeekEntryResult!8864)

(assert (=> d!110575 (and (or ((_ is Undefined!8864) lt!404193) (not ((_ is Found!8864) lt!404193)) (and (bvsge (index!37828 lt!404193) #b00000000000000000000000000000000) (bvslt (index!37828 lt!404193) (size!25630 (_keys!10019 thiss!1181))))) (or ((_ is Undefined!8864) lt!404193) ((_ is Found!8864) lt!404193) (not ((_ is MissingZero!8864) lt!404193)) (and (bvsge (index!37827 lt!404193) #b00000000000000000000000000000000) (bvslt (index!37827 lt!404193) (size!25630 (_keys!10019 thiss!1181))))) (or ((_ is Undefined!8864) lt!404193) ((_ is Found!8864) lt!404193) ((_ is MissingZero!8864) lt!404193) (not ((_ is MissingVacant!8864) lt!404193)) (and (bvsge (index!37830 lt!404193) #b00000000000000000000000000000000) (bvslt (index!37830 lt!404193) (size!25630 (_keys!10019 thiss!1181))))) (or ((_ is Undefined!8864) lt!404193) (ite ((_ is Found!8864) lt!404193) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!404193)) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8864) lt!404193) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37827 lt!404193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8864) lt!404193) (= (select (arr!25185 (_keys!10019 thiss!1181)) (index!37830 lt!404193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110575 (= lt!404193 e!499484)))

(declare-fun c!94367 () Bool)

(assert (=> d!110575 (= c!94367 (and ((_ is Intermediate!8864) lt!404194) (undefined!9676 lt!404194)))))

(assert (=> d!110575 (= lt!404194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) (mask!25871 thiss!1181)) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(assert (=> d!110575 (validMask!0 (mask!25871 thiss!1181))))

(assert (=> d!110575 (= (seekEntryOrOpen!0 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) lt!404193)))

(declare-fun b!894294 () Bool)

(declare-fun c!94366 () Bool)

(assert (=> b!894294 (= c!94366 (= lt!404192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894294 (= e!499486 e!499485)))

(declare-fun b!894295 () Bool)

(assert (=> b!894295 (= e!499485 (MissingZero!8864 (index!37829 lt!404194)))))

(assert (= (and d!110575 c!94367) b!894290))

(assert (= (and d!110575 (not c!94367)) b!894293))

(assert (= (and b!894293 c!94368) b!894292))

(assert (= (and b!894293 (not c!94368)) b!894294))

(assert (= (and b!894294 c!94366) b!894295))

(assert (= (and b!894294 (not c!94366)) b!894291))

(assert (=> b!894291 m!832041))

(declare-fun m!832283 () Bool)

(assert (=> b!894291 m!832283))

(declare-fun m!832285 () Bool)

(assert (=> b!894293 m!832285))

(declare-fun m!832287 () Bool)

(assert (=> d!110575 m!832287))

(declare-fun m!832289 () Bool)

(assert (=> d!110575 m!832289))

(declare-fun m!832291 () Bool)

(assert (=> d!110575 m!832291))

(assert (=> d!110575 m!832041))

(declare-fun m!832293 () Bool)

(assert (=> d!110575 m!832293))

(assert (=> d!110575 m!832041))

(assert (=> d!110575 m!832291))

(declare-fun m!832295 () Bool)

(assert (=> d!110575 m!832295))

(assert (=> d!110575 m!832057))

(assert (=> b!894105 d!110575))

(declare-fun d!110577 () Bool)

(declare-fun lt!404197 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!401 (List!17803) (InoxSet (_ BitVec 64)))

(assert (=> d!110577 (= lt!404197 (select (content!401 Nil!17800) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499491 () Bool)

(assert (=> d!110577 (= lt!404197 e!499491)))

(declare-fun res!605296 () Bool)

(assert (=> d!110577 (=> (not res!605296) (not e!499491))))

(assert (=> d!110577 (= res!605296 ((_ is Cons!17799) Nil!17800))))

(assert (=> d!110577 (= (contains!4389 Nil!17800 (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)) lt!404197)))

(declare-fun b!894300 () Bool)

(declare-fun e!499492 () Bool)

(assert (=> b!894300 (= e!499491 e!499492)))

(declare-fun res!605295 () Bool)

(assert (=> b!894300 (=> res!605295 e!499492)))

(assert (=> b!894300 (= res!605295 (= (h!18931 Nil!17800) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894301 () Bool)

(assert (=> b!894301 (= e!499492 (contains!4389 (t!25134 Nil!17800) (select (arr!25185 (_keys!10019 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110577 res!605296) b!894300))

(assert (= (and b!894300 (not res!605295)) b!894301))

(declare-fun m!832297 () Bool)

(assert (=> d!110577 m!832297))

(assert (=> d!110577 m!832041))

(declare-fun m!832299 () Bool)

(assert (=> d!110577 m!832299))

(assert (=> b!894301 m!832041))

(declare-fun m!832301 () Bool)

(assert (=> b!894301 m!832301))

(assert (=> b!894098 d!110577))

(declare-fun d!110579 () Bool)

(assert (=> d!110579 (= (isDefined!328 (getValueByKey!451 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785))) (not (isEmpty!682 (getValueByKey!451 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))))

(declare-fun bs!25110 () Bool)

(assert (= bs!25110 d!110579))

(assert (=> bs!25110 m!832129))

(declare-fun m!832303 () Bool)

(assert (=> bs!25110 m!832303))

(assert (=> b!894103 d!110579))

(declare-fun c!94369 () Bool)

(declare-fun d!110581 () Bool)

(assert (=> d!110581 (= c!94369 (and ((_ is Cons!17797) (toList!5375 call!39669)) (= (_1!6022 (h!18929 (toList!5375 call!39669))) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785))))))

(declare-fun e!499493 () Option!457)

(assert (=> d!110581 (= (getValueByKey!451 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)) e!499493)))

(declare-fun b!894302 () Bool)

(assert (=> b!894302 (= e!499493 (Some!456 (_2!6022 (h!18929 (toList!5375 call!39669)))))))

(declare-fun b!894305 () Bool)

(declare-fun e!499494 () Option!457)

(assert (=> b!894305 (= e!499494 None!455)))

(declare-fun b!894304 () Bool)

(assert (=> b!894304 (= e!499494 (getValueByKey!451 (t!25130 (toList!5375 call!39669)) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(declare-fun b!894303 () Bool)

(assert (=> b!894303 (= e!499493 e!499494)))

(declare-fun c!94370 () Bool)

(assert (=> b!894303 (= c!94370 (and ((_ is Cons!17797) (toList!5375 call!39669)) (not (= (_1!6022 (h!18929 (toList!5375 call!39669))) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))))

(assert (= (and d!110581 c!94369) b!894302))

(assert (= (and d!110581 (not c!94369)) b!894303))

(assert (= (and b!894303 c!94370) b!894304))

(assert (= (and b!894303 (not c!94370)) b!894305))

(declare-fun m!832305 () Bool)

(assert (=> b!894304 m!832305))

(assert (=> b!894103 d!110581))

(declare-fun d!110583 () Bool)

(declare-fun e!499495 () Bool)

(assert (=> d!110583 e!499495))

(declare-fun res!605297 () Bool)

(assert (=> d!110583 (=> (not res!605297) (not e!499495))))

(declare-fun lt!404199 () ListLongMap!10719)

(assert (=> d!110583 (= res!605297 (contains!4388 lt!404199 (_1!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181)))))))

(declare-fun lt!404198 () List!17801)

(assert (=> d!110583 (= lt!404199 (ListLongMap!10720 lt!404198))))

(declare-fun lt!404201 () Unit!30438)

(declare-fun lt!404200 () Unit!30438)

(assert (=> d!110583 (= lt!404201 lt!404200)))

(assert (=> d!110583 (= (getValueByKey!451 lt!404198 (_1!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181)))))))

(assert (=> d!110583 (= lt!404200 (lemmaContainsTupThenGetReturnValue!247 lt!404198 (_1!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181)))))))

(assert (=> d!110583 (= lt!404198 (insertStrictlySorted!304 (toList!5375 lt!404044) (_1!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181)))))))

(assert (=> d!110583 (= (+!2589 lt!404044 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181))) lt!404199)))

(declare-fun b!894306 () Bool)

(declare-fun res!605298 () Bool)

(assert (=> b!894306 (=> (not res!605298) (not e!499495))))

(assert (=> b!894306 (= res!605298 (= (getValueByKey!451 (toList!5375 lt!404199) (_1!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181))))))))

(declare-fun b!894307 () Bool)

(assert (=> b!894307 (= e!499495 (contains!4390 (toList!5375 lt!404199) (tuple2!12023 lt!404039 (minValue!5127 thiss!1181))))))

(assert (= (and d!110583 res!605297) b!894306))

(assert (= (and b!894306 res!605298) b!894307))

(declare-fun m!832307 () Bool)

(assert (=> d!110583 m!832307))

(declare-fun m!832309 () Bool)

(assert (=> d!110583 m!832309))

(declare-fun m!832311 () Bool)

(assert (=> d!110583 m!832311))

(declare-fun m!832313 () Bool)

(assert (=> d!110583 m!832313))

(declare-fun m!832315 () Bool)

(assert (=> b!894306 m!832315))

(declare-fun m!832317 () Bool)

(assert (=> b!894307 m!832317))

(assert (=> b!894024 d!110583))

(declare-fun d!110585 () Bool)

(declare-fun e!499496 () Bool)

(assert (=> d!110585 e!499496))

(declare-fun res!605299 () Bool)

(assert (=> d!110585 (=> res!605299 e!499496)))

(declare-fun lt!404203 () Bool)

(assert (=> d!110585 (= res!605299 (not lt!404203))))

(declare-fun lt!404204 () Bool)

(assert (=> d!110585 (= lt!404203 lt!404204)))

(declare-fun lt!404205 () Unit!30438)

(declare-fun e!499497 () Unit!30438)

(assert (=> d!110585 (= lt!404205 e!499497)))

(declare-fun c!94371 () Bool)

(assert (=> d!110585 (= c!94371 lt!404204)))

(assert (=> d!110585 (= lt!404204 (containsKey!423 (toList!5375 (+!2589 lt!404042 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))) lt!404036))))

(assert (=> d!110585 (= (contains!4388 (+!2589 lt!404042 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181))) lt!404036) lt!404203)))

(declare-fun b!894308 () Bool)

(declare-fun lt!404202 () Unit!30438)

(assert (=> b!894308 (= e!499497 lt!404202)))

(assert (=> b!894308 (= lt!404202 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 (+!2589 lt!404042 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))) lt!404036))))

(assert (=> b!894308 (isDefined!328 (getValueByKey!451 (toList!5375 (+!2589 lt!404042 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))) lt!404036))))

(declare-fun b!894309 () Bool)

(declare-fun Unit!30448 () Unit!30438)

(assert (=> b!894309 (= e!499497 Unit!30448)))

(declare-fun b!894310 () Bool)

(assert (=> b!894310 (= e!499496 (isDefined!328 (getValueByKey!451 (toList!5375 (+!2589 lt!404042 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))) lt!404036)))))

(assert (= (and d!110585 c!94371) b!894308))

(assert (= (and d!110585 (not c!94371)) b!894309))

(assert (= (and d!110585 (not res!605299)) b!894310))

(declare-fun m!832319 () Bool)

(assert (=> d!110585 m!832319))

(declare-fun m!832321 () Bool)

(assert (=> b!894308 m!832321))

(declare-fun m!832323 () Bool)

(assert (=> b!894308 m!832323))

(assert (=> b!894308 m!832323))

(declare-fun m!832325 () Bool)

(assert (=> b!894308 m!832325))

(assert (=> b!894310 m!832323))

(assert (=> b!894310 m!832323))

(assert (=> b!894310 m!832325))

(assert (=> b!894024 d!110585))

(declare-fun d!110587 () Bool)

(assert (=> d!110587 (= (apply!408 lt!404044 lt!404024) (get!13262 (getValueByKey!451 (toList!5375 lt!404044) lt!404024)))))

(declare-fun bs!25111 () Bool)

(assert (= bs!25111 d!110587))

(declare-fun m!832327 () Bool)

(assert (=> bs!25111 m!832327))

(assert (=> bs!25111 m!832327))

(declare-fun m!832329 () Bool)

(assert (=> bs!25111 m!832329))

(assert (=> b!894024 d!110587))

(declare-fun d!110589 () Bool)

(assert (=> d!110589 (= (apply!408 (+!2589 lt!404032 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181))) lt!404035) (get!13262 (getValueByKey!451 (toList!5375 (+!2589 lt!404032 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181)))) lt!404035)))))

(declare-fun bs!25112 () Bool)

(assert (= bs!25112 d!110589))

(declare-fun m!832331 () Bool)

(assert (=> bs!25112 m!832331))

(assert (=> bs!25112 m!832331))

(declare-fun m!832333 () Bool)

(assert (=> bs!25112 m!832333))

(assert (=> b!894024 d!110589))

(declare-fun d!110591 () Bool)

(declare-fun e!499498 () Bool)

(assert (=> d!110591 e!499498))

(declare-fun res!605300 () Bool)

(assert (=> d!110591 (=> (not res!605300) (not e!499498))))

(declare-fun lt!404207 () ListLongMap!10719)

(assert (=> d!110591 (= res!605300 (contains!4388 lt!404207 (_1!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))))))

(declare-fun lt!404206 () List!17801)

(assert (=> d!110591 (= lt!404207 (ListLongMap!10720 lt!404206))))

(declare-fun lt!404209 () Unit!30438)

(declare-fun lt!404208 () Unit!30438)

(assert (=> d!110591 (= lt!404209 lt!404208)))

(assert (=> d!110591 (= (getValueByKey!451 lt!404206 (_1!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))))))

(assert (=> d!110591 (= lt!404208 (lemmaContainsTupThenGetReturnValue!247 lt!404206 (_1!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))))))

(assert (=> d!110591 (= lt!404206 (insertStrictlySorted!304 (toList!5375 lt!404042) (_1!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))))))

(assert (=> d!110591 (= (+!2589 lt!404042 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181))) lt!404207)))

(declare-fun b!894311 () Bool)

(declare-fun res!605301 () Bool)

(assert (=> b!894311 (=> (not res!605301) (not e!499498))))

(assert (=> b!894311 (= res!605301 (= (getValueByKey!451 (toList!5375 lt!404207) (_1!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181))))))))

(declare-fun b!894312 () Bool)

(assert (=> b!894312 (= e!499498 (contains!4390 (toList!5375 lt!404207) (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181))))))

(assert (= (and d!110591 res!605300) b!894311))

(assert (= (and b!894311 res!605301) b!894312))

(declare-fun m!832335 () Bool)

(assert (=> d!110591 m!832335))

(declare-fun m!832337 () Bool)

(assert (=> d!110591 m!832337))

(declare-fun m!832339 () Bool)

(assert (=> d!110591 m!832339))

(declare-fun m!832341 () Bool)

(assert (=> d!110591 m!832341))

(declare-fun m!832343 () Bool)

(assert (=> b!894311 m!832343))

(declare-fun m!832345 () Bool)

(assert (=> b!894312 m!832345))

(assert (=> b!894024 d!110591))

(declare-fun d!110593 () Bool)

(assert (=> d!110593 (contains!4388 (+!2589 lt!404042 (tuple2!12023 lt!404034 (zeroValue!5127 thiss!1181))) lt!404036)))

(declare-fun lt!404212 () Unit!30438)

(declare-fun choose!1472 (ListLongMap!10719 (_ BitVec 64) V!29217 (_ BitVec 64)) Unit!30438)

(assert (=> d!110593 (= lt!404212 (choose!1472 lt!404042 lt!404034 (zeroValue!5127 thiss!1181) lt!404036))))

(assert (=> d!110593 (contains!4388 lt!404042 lt!404036)))

(assert (=> d!110593 (= (addStillContains!330 lt!404042 lt!404034 (zeroValue!5127 thiss!1181) lt!404036) lt!404212)))

(declare-fun bs!25113 () Bool)

(assert (= bs!25113 d!110593))

(assert (=> bs!25113 m!832037))

(assert (=> bs!25113 m!832037))

(assert (=> bs!25113 m!832043))

(declare-fun m!832347 () Bool)

(assert (=> bs!25113 m!832347))

(declare-fun m!832349 () Bool)

(assert (=> bs!25113 m!832349))

(assert (=> b!894024 d!110593))

(declare-fun d!110595 () Bool)

(declare-fun e!499499 () Bool)

(assert (=> d!110595 e!499499))

(declare-fun res!605302 () Bool)

(assert (=> d!110595 (=> (not res!605302) (not e!499499))))

(declare-fun lt!404214 () ListLongMap!10719)

(assert (=> d!110595 (= res!605302 (contains!4388 lt!404214 (_1!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181)))))))

(declare-fun lt!404213 () List!17801)

(assert (=> d!110595 (= lt!404214 (ListLongMap!10720 lt!404213))))

(declare-fun lt!404216 () Unit!30438)

(declare-fun lt!404215 () Unit!30438)

(assert (=> d!110595 (= lt!404216 lt!404215)))

(assert (=> d!110595 (= (getValueByKey!451 lt!404213 (_1!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181)))))))

(assert (=> d!110595 (= lt!404215 (lemmaContainsTupThenGetReturnValue!247 lt!404213 (_1!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181)))))))

(assert (=> d!110595 (= lt!404213 (insertStrictlySorted!304 (toList!5375 lt!404032) (_1!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181)))))))

(assert (=> d!110595 (= (+!2589 lt!404032 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181))) lt!404214)))

(declare-fun b!894314 () Bool)

(declare-fun res!605303 () Bool)

(assert (=> b!894314 (=> (not res!605303) (not e!499499))))

(assert (=> b!894314 (= res!605303 (= (getValueByKey!451 (toList!5375 lt!404214) (_1!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181))))))))

(declare-fun b!894315 () Bool)

(assert (=> b!894315 (= e!499499 (contains!4390 (toList!5375 lt!404214) (tuple2!12023 lt!404023 (minValue!5127 thiss!1181))))))

(assert (= (and d!110595 res!605302) b!894314))

(assert (= (and b!894314 res!605303) b!894315))

(declare-fun m!832351 () Bool)

(assert (=> d!110595 m!832351))

(declare-fun m!832353 () Bool)

(assert (=> d!110595 m!832353))

(declare-fun m!832355 () Bool)

(assert (=> d!110595 m!832355))

(declare-fun m!832357 () Bool)

(assert (=> d!110595 m!832357))

(declare-fun m!832359 () Bool)

(assert (=> b!894314 m!832359))

(declare-fun m!832361 () Bool)

(assert (=> b!894315 m!832361))

(assert (=> b!894024 d!110595))

(declare-fun d!110597 () Bool)

(assert (=> d!110597 (= (apply!408 (+!2589 lt!404044 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181))) lt!404024) (get!13262 (getValueByKey!451 (toList!5375 (+!2589 lt!404044 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181)))) lt!404024)))))

(declare-fun bs!25114 () Bool)

(assert (= bs!25114 d!110597))

(declare-fun m!832363 () Bool)

(assert (=> bs!25114 m!832363))

(assert (=> bs!25114 m!832363))

(declare-fun m!832365 () Bool)

(assert (=> bs!25114 m!832365))

(assert (=> b!894024 d!110597))

(declare-fun d!110599 () Bool)

(assert (=> d!110599 (= (apply!408 lt!404025 lt!404030) (get!13262 (getValueByKey!451 (toList!5375 lt!404025) lt!404030)))))

(declare-fun bs!25115 () Bool)

(assert (= bs!25115 d!110599))

(declare-fun m!832367 () Bool)

(assert (=> bs!25115 m!832367))

(assert (=> bs!25115 m!832367))

(declare-fun m!832369 () Bool)

(assert (=> bs!25115 m!832369))

(assert (=> b!894024 d!110599))

(declare-fun d!110601 () Bool)

(assert (=> d!110601 (= (apply!408 lt!404032 lt!404035) (get!13262 (getValueByKey!451 (toList!5375 lt!404032) lt!404035)))))

(declare-fun bs!25116 () Bool)

(assert (= bs!25116 d!110601))

(declare-fun m!832371 () Bool)

(assert (=> bs!25116 m!832371))

(assert (=> bs!25116 m!832371))

(declare-fun m!832373 () Bool)

(assert (=> bs!25116 m!832373))

(assert (=> b!894024 d!110601))

(declare-fun d!110603 () Bool)

(assert (=> d!110603 (= (apply!408 (+!2589 lt!404025 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181))) lt!404030) (get!13262 (getValueByKey!451 (toList!5375 (+!2589 lt!404025 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181)))) lt!404030)))))

(declare-fun bs!25117 () Bool)

(assert (= bs!25117 d!110603))

(declare-fun m!832375 () Bool)

(assert (=> bs!25117 m!832375))

(assert (=> bs!25117 m!832375))

(declare-fun m!832377 () Bool)

(assert (=> bs!25117 m!832377))

(assert (=> b!894024 d!110603))

(assert (=> b!894024 d!110549))

(declare-fun d!110605 () Bool)

(assert (=> d!110605 (= (apply!408 (+!2589 lt!404025 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181))) lt!404030) (apply!408 lt!404025 lt!404030))))

(declare-fun lt!404219 () Unit!30438)

(declare-fun choose!1473 (ListLongMap!10719 (_ BitVec 64) V!29217 (_ BitVec 64)) Unit!30438)

(assert (=> d!110605 (= lt!404219 (choose!1473 lt!404025 lt!404028 (zeroValue!5127 thiss!1181) lt!404030))))

(declare-fun e!499502 () Bool)

(assert (=> d!110605 e!499502))

(declare-fun res!605306 () Bool)

(assert (=> d!110605 (=> (not res!605306) (not e!499502))))

(assert (=> d!110605 (= res!605306 (contains!4388 lt!404025 lt!404030))))

(assert (=> d!110605 (= (addApplyDifferent!330 lt!404025 lt!404028 (zeroValue!5127 thiss!1181) lt!404030) lt!404219)))

(declare-fun b!894319 () Bool)

(assert (=> b!894319 (= e!499502 (not (= lt!404030 lt!404028)))))

(assert (= (and d!110605 res!605306) b!894319))

(declare-fun m!832379 () Bool)

(assert (=> d!110605 m!832379))

(assert (=> d!110605 m!832027))

(assert (=> d!110605 m!832027))

(assert (=> d!110605 m!832035))

(declare-fun m!832381 () Bool)

(assert (=> d!110605 m!832381))

(assert (=> d!110605 m!832021))

(assert (=> b!894024 d!110605))

(declare-fun d!110607 () Bool)

(assert (=> d!110607 (= (apply!408 (+!2589 lt!404032 (tuple2!12023 lt!404023 (minValue!5127 thiss!1181))) lt!404035) (apply!408 lt!404032 lt!404035))))

(declare-fun lt!404220 () Unit!30438)

(assert (=> d!110607 (= lt!404220 (choose!1473 lt!404032 lt!404023 (minValue!5127 thiss!1181) lt!404035))))

(declare-fun e!499503 () Bool)

(assert (=> d!110607 e!499503))

(declare-fun res!605307 () Bool)

(assert (=> d!110607 (=> (not res!605307) (not e!499503))))

(assert (=> d!110607 (= res!605307 (contains!4388 lt!404032 lt!404035))))

(assert (=> d!110607 (= (addApplyDifferent!330 lt!404032 lt!404023 (minValue!5127 thiss!1181) lt!404035) lt!404220)))

(declare-fun b!894320 () Bool)

(assert (=> b!894320 (= e!499503 (not (= lt!404035 lt!404023)))))

(assert (= (and d!110607 res!605307) b!894320))

(declare-fun m!832383 () Bool)

(assert (=> d!110607 m!832383))

(assert (=> d!110607 m!832031))

(assert (=> d!110607 m!832031))

(assert (=> d!110607 m!832033))

(declare-fun m!832385 () Bool)

(assert (=> d!110607 m!832385))

(assert (=> d!110607 m!832047))

(assert (=> b!894024 d!110607))

(declare-fun d!110609 () Bool)

(assert (=> d!110609 (= (apply!408 (+!2589 lt!404044 (tuple2!12023 lt!404039 (minValue!5127 thiss!1181))) lt!404024) (apply!408 lt!404044 lt!404024))))

(declare-fun lt!404221 () Unit!30438)

(assert (=> d!110609 (= lt!404221 (choose!1473 lt!404044 lt!404039 (minValue!5127 thiss!1181) lt!404024))))

(declare-fun e!499504 () Bool)

(assert (=> d!110609 e!499504))

(declare-fun res!605308 () Bool)

(assert (=> d!110609 (=> (not res!605308) (not e!499504))))

(assert (=> d!110609 (= res!605308 (contains!4388 lt!404044 lt!404024))))

(assert (=> d!110609 (= (addApplyDifferent!330 lt!404044 lt!404039 (minValue!5127 thiss!1181) lt!404024) lt!404221)))

(declare-fun b!894321 () Bool)

(assert (=> b!894321 (= e!499504 (not (= lt!404024 lt!404039)))))

(assert (= (and d!110609 res!605308) b!894321))

(declare-fun m!832387 () Bool)

(assert (=> d!110609 m!832387))

(assert (=> d!110609 m!832045))

(assert (=> d!110609 m!832045))

(assert (=> d!110609 m!832049))

(declare-fun m!832389 () Bool)

(assert (=> d!110609 m!832389))

(assert (=> d!110609 m!832019))

(assert (=> b!894024 d!110609))

(declare-fun d!110611 () Bool)

(declare-fun e!499505 () Bool)

(assert (=> d!110611 e!499505))

(declare-fun res!605309 () Bool)

(assert (=> d!110611 (=> (not res!605309) (not e!499505))))

(declare-fun lt!404223 () ListLongMap!10719)

(assert (=> d!110611 (= res!605309 (contains!4388 lt!404223 (_1!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181)))))))

(declare-fun lt!404222 () List!17801)

(assert (=> d!110611 (= lt!404223 (ListLongMap!10720 lt!404222))))

(declare-fun lt!404225 () Unit!30438)

(declare-fun lt!404224 () Unit!30438)

(assert (=> d!110611 (= lt!404225 lt!404224)))

(assert (=> d!110611 (= (getValueByKey!451 lt!404222 (_1!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181)))))))

(assert (=> d!110611 (= lt!404224 (lemmaContainsTupThenGetReturnValue!247 lt!404222 (_1!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181)))))))

(assert (=> d!110611 (= lt!404222 (insertStrictlySorted!304 (toList!5375 lt!404025) (_1!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181))) (_2!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181)))))))

(assert (=> d!110611 (= (+!2589 lt!404025 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181))) lt!404223)))

(declare-fun b!894322 () Bool)

(declare-fun res!605310 () Bool)

(assert (=> b!894322 (=> (not res!605310) (not e!499505))))

(assert (=> b!894322 (= res!605310 (= (getValueByKey!451 (toList!5375 lt!404223) (_1!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181)))) (Some!456 (_2!6022 (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181))))))))

(declare-fun b!894323 () Bool)

(assert (=> b!894323 (= e!499505 (contains!4390 (toList!5375 lt!404223) (tuple2!12023 lt!404028 (zeroValue!5127 thiss!1181))))))

(assert (= (and d!110611 res!605309) b!894322))

(assert (= (and b!894322 res!605310) b!894323))

(declare-fun m!832391 () Bool)

(assert (=> d!110611 m!832391))

(declare-fun m!832393 () Bool)

(assert (=> d!110611 m!832393))

(declare-fun m!832395 () Bool)

(assert (=> d!110611 m!832395))

(declare-fun m!832397 () Bool)

(assert (=> d!110611 m!832397))

(declare-fun m!832399 () Bool)

(assert (=> b!894322 m!832399))

(declare-fun m!832401 () Bool)

(assert (=> b!894323 m!832401))

(assert (=> b!894024 d!110611))

(declare-fun b!894324 () Bool)

(declare-fun e!499506 () Bool)

(declare-fun call!39708 () Bool)

(assert (=> b!894324 (= e!499506 call!39708)))

(declare-fun bm!39705 () Bool)

(assert (=> bm!39705 (= call!39708 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)))))

(declare-fun b!894325 () Bool)

(declare-fun e!499507 () Bool)

(assert (=> b!894325 (= e!499507 e!499506)))

(declare-fun lt!404226 () (_ BitVec 64))

(assert (=> b!894325 (= lt!404226 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!404227 () Unit!30438)

(assert (=> b!894325 (= lt!404227 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10019 thiss!1181) lt!404226 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!894325 (arrayContainsKey!0 (_keys!10019 thiss!1181) lt!404226 #b00000000000000000000000000000000)))

(declare-fun lt!404228 () Unit!30438)

(assert (=> b!894325 (= lt!404228 lt!404227)))

(declare-fun res!605311 () Bool)

(assert (=> b!894325 (= res!605311 (= (seekEntryOrOpen!0 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) (Found!8864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!894325 (=> (not res!605311) (not e!499506))))

(declare-fun d!110613 () Bool)

(declare-fun res!605312 () Bool)

(declare-fun e!499508 () Bool)

(assert (=> d!110613 (=> res!605312 e!499508)))

(assert (=> d!110613 (= res!605312 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110613 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10019 thiss!1181) (mask!25871 thiss!1181)) e!499508)))

(declare-fun b!894326 () Bool)

(assert (=> b!894326 (= e!499508 e!499507)))

(declare-fun c!94372 () Bool)

(assert (=> b!894326 (= c!94372 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894327 () Bool)

(assert (=> b!894327 (= e!499507 call!39708)))

(assert (= (and d!110613 (not res!605312)) b!894326))

(assert (= (and b!894326 c!94372) b!894325))

(assert (= (and b!894326 (not c!94372)) b!894327))

(assert (= (and b!894325 res!605311) b!894324))

(assert (= (or b!894324 b!894327) bm!39705))

(declare-fun m!832403 () Bool)

(assert (=> bm!39705 m!832403))

(assert (=> b!894325 m!832271))

(declare-fun m!832405 () Bool)

(assert (=> b!894325 m!832405))

(declare-fun m!832407 () Bool)

(assert (=> b!894325 m!832407))

(assert (=> b!894325 m!832271))

(declare-fun m!832409 () Bool)

(assert (=> b!894325 m!832409))

(assert (=> b!894326 m!832271))

(assert (=> b!894326 m!832271))

(assert (=> b!894326 m!832273))

(assert (=> bm!39696 d!110613))

(assert (=> d!110501 d!110511))

(declare-fun d!110615 () Bool)

(assert (=> d!110615 (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110615 true))

(declare-fun _$60!403 () Unit!30438)

(assert (=> d!110615 (= (choose!13 (_keys!10019 thiss!1181) key!785 (index!37828 lt!403978)) _$60!403)))

(declare-fun bs!25118 () Bool)

(assert (= bs!25118 d!110615))

(assert (=> bs!25118 m!831991))

(assert (=> d!110501 d!110615))

(assert (=> b!894045 d!110511))

(declare-fun d!110617 () Bool)

(declare-fun e!499509 () Bool)

(assert (=> d!110617 e!499509))

(declare-fun res!605313 () Bool)

(assert (=> d!110617 (=> res!605313 e!499509)))

(declare-fun lt!404230 () Bool)

(assert (=> d!110617 (= res!605313 (not lt!404230))))

(declare-fun lt!404231 () Bool)

(assert (=> d!110617 (= lt!404230 lt!404231)))

(declare-fun lt!404232 () Unit!30438)

(declare-fun e!499510 () Unit!30438)

(assert (=> d!110617 (= lt!404232 e!499510)))

(declare-fun c!94373 () Bool)

(assert (=> d!110617 (= c!94373 lt!404231)))

(assert (=> d!110617 (= lt!404231 (containsKey!423 (toList!5375 lt!404037) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110617 (= (contains!4388 lt!404037 #b1000000000000000000000000000000000000000000000000000000000000000) lt!404230)))

(declare-fun b!894328 () Bool)

(declare-fun lt!404229 () Unit!30438)

(assert (=> b!894328 (= e!499510 lt!404229)))

(assert (=> b!894328 (= lt!404229 (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 lt!404037) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894328 (isDefined!328 (getValueByKey!451 (toList!5375 lt!404037) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894329 () Bool)

(declare-fun Unit!30449 () Unit!30438)

(assert (=> b!894329 (= e!499510 Unit!30449)))

(declare-fun b!894330 () Bool)

(assert (=> b!894330 (= e!499509 (isDefined!328 (getValueByKey!451 (toList!5375 lt!404037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110617 c!94373) b!894328))

(assert (= (and d!110617 (not c!94373)) b!894329))

(assert (= (and d!110617 (not res!605313)) b!894330))

(declare-fun m!832411 () Bool)

(assert (=> d!110617 m!832411))

(declare-fun m!832413 () Bool)

(assert (=> b!894328 m!832413))

(declare-fun m!832415 () Bool)

(assert (=> b!894328 m!832415))

(assert (=> b!894328 m!832415))

(declare-fun m!832417 () Bool)

(assert (=> b!894328 m!832417))

(assert (=> b!894330 m!832415))

(assert (=> b!894330 m!832415))

(assert (=> b!894330 m!832417))

(assert (=> bm!39689 d!110617))

(assert (=> b!894096 d!110527))

(declare-fun d!110619 () Bool)

(assert (=> d!110619 (isDefined!328 (getValueByKey!451 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(declare-fun lt!404233 () Unit!30438)

(assert (=> d!110619 (= lt!404233 (choose!1471 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(declare-fun e!499511 () Bool)

(assert (=> d!110619 e!499511))

(declare-fun res!605314 () Bool)

(assert (=> d!110619 (=> (not res!605314) (not e!499511))))

(assert (=> d!110619 (= res!605314 (isStrictlySorted!496 (toList!5375 call!39669)))))

(assert (=> d!110619 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!319 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)) lt!404233)))

(declare-fun b!894331 () Bool)

(assert (=> b!894331 (= e!499511 (containsKey!423 (toList!5375 call!39669) (ite c!94264 (select (arr!25185 (_keys!10019 thiss!1181)) (index!37828 lt!403978)) key!785)))))

(assert (= (and d!110619 res!605314) b!894331))

(assert (=> d!110619 m!832129))

(assert (=> d!110619 m!832129))

(assert (=> d!110619 m!832131))

(declare-fun m!832419 () Bool)

(assert (=> d!110619 m!832419))

(declare-fun m!832421 () Bool)

(assert (=> d!110619 m!832421))

(assert (=> b!894331 m!832125))

(assert (=> b!894101 d!110619))

(assert (=> b!894101 d!110579))

(assert (=> b!894101 d!110581))

(declare-fun d!110621 () Bool)

(declare-fun e!499512 () Bool)

(assert (=> d!110621 e!499512))

(declare-fun res!605315 () Bool)

(assert (=> d!110621 (=> (not res!605315) (not e!499512))))

(declare-fun lt!404235 () ListLongMap!10719)

(assert (=> d!110621 (= res!605315 (contains!4388 lt!404235 (_1!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))))))

(declare-fun lt!404234 () List!17801)

(assert (=> d!110621 (= lt!404235 (ListLongMap!10720 lt!404234))))

(declare-fun lt!404237 () Unit!30438)

(declare-fun lt!404236 () Unit!30438)

(assert (=> d!110621 (= lt!404237 lt!404236)))

(assert (=> d!110621 (= (getValueByKey!451 lt!404234 (_1!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))) (Some!456 (_2!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))))))

(assert (=> d!110621 (= lt!404236 (lemmaContainsTupThenGetReturnValue!247 lt!404234 (_1!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))) (_2!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))))))

(assert (=> d!110621 (= lt!404234 (insertStrictlySorted!304 (toList!5375 (ite c!94281 call!39691 (ite c!94280 call!39689 call!39692))) (_1!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))) (_2!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))))))

(assert (=> d!110621 (= (+!2589 (ite c!94281 call!39691 (ite c!94280 call!39689 call!39692)) (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))) lt!404235)))

(declare-fun b!894332 () Bool)

(declare-fun res!605316 () Bool)

(assert (=> b!894332 (=> (not res!605316) (not e!499512))))

(assert (=> b!894332 (= res!605316 (= (getValueByKey!451 (toList!5375 lt!404235) (_1!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181))))) (Some!456 (_2!6022 (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))))))))

(declare-fun b!894333 () Bool)

(assert (=> b!894333 (= e!499512 (contains!4390 (toList!5375 lt!404235) (ite (or c!94281 c!94280) (tuple2!12023 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5127 thiss!1181)) (tuple2!12023 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5127 thiss!1181)))))))

(assert (= (and d!110621 res!605315) b!894332))

(assert (= (and b!894332 res!605316) b!894333))

(declare-fun m!832423 () Bool)

(assert (=> d!110621 m!832423))

(declare-fun m!832425 () Bool)

(assert (=> d!110621 m!832425))

(declare-fun m!832427 () Bool)

(assert (=> d!110621 m!832427))

(declare-fun m!832429 () Bool)

(assert (=> d!110621 m!832429))

(declare-fun m!832431 () Bool)

(assert (=> b!894332 m!832431))

(declare-fun m!832433 () Bool)

(assert (=> b!894333 m!832433))

(assert (=> bm!39688 d!110621))

(assert (=> d!110485 d!110531))

(declare-fun d!110623 () Bool)

(declare-fun e!499515 () Bool)

(assert (=> d!110623 e!499515))

(declare-fun c!94376 () Bool)

(assert (=> d!110623 (= c!94376 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!110623 true))

(declare-fun _$15!92 () Unit!30438)

(assert (=> d!110623 (= (choose!1469 (_keys!10019 thiss!1181) (_values!5314 thiss!1181) (mask!25871 thiss!1181) (extraKeys!5023 thiss!1181) (zeroValue!5127 thiss!1181) (minValue!5127 thiss!1181) key!785 (defaultEntry!5327 thiss!1181)) _$15!92)))

(declare-fun b!894338 () Bool)

(assert (=> b!894338 (= e!499515 (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!894339 () Bool)

(assert (=> b!894339 (= e!499515 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5023 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110623 c!94376) b!894338))

(assert (= (and d!110623 (not c!94376)) b!894339))

(assert (=> b!894338 m!831991))

(assert (=> d!110489 d!110623))

(assert (=> d!110489 d!110531))

(assert (=> b!894023 d!110527))

(declare-fun d!110625 () Bool)

(assert (=> d!110625 (= (size!25634 thiss!1181) (bvadd (_size!2176 thiss!1181) (bvsdiv (bvadd (extraKeys!5023 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!894128 d!110625))

(declare-fun d!110627 () Bool)

(declare-fun lt!404238 () (_ BitVec 32))

(assert (=> d!110627 (and (or (bvslt lt!404238 #b00000000000000000000000000000000) (bvsge lt!404238 (size!25630 (_keys!10019 thiss!1181))) (and (bvsge lt!404238 #b00000000000000000000000000000000) (bvslt lt!404238 (size!25630 (_keys!10019 thiss!1181))))) (bvsge lt!404238 #b00000000000000000000000000000000) (bvslt lt!404238 (size!25630 (_keys!10019 thiss!1181))) (= (select (arr!25185 (_keys!10019 thiss!1181)) lt!404238) key!785))))

(declare-fun e!499516 () (_ BitVec 32))

(assert (=> d!110627 (= lt!404238 e!499516)))

(declare-fun c!94377 () Bool)

(assert (=> d!110627 (= c!94377 (= (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110627 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))) (bvslt (size!25630 (_keys!10019 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110627 (= (arrayScanForKey!0 (_keys!10019 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!404238)))

(declare-fun b!894340 () Bool)

(assert (=> b!894340 (= e!499516 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!894341 () Bool)

(assert (=> b!894341 (= e!499516 (arrayScanForKey!0 (_keys!10019 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110627 c!94377) b!894340))

(assert (= (and d!110627 (not c!94377)) b!894341))

(declare-fun m!832435 () Bool)

(assert (=> d!110627 m!832435))

(assert (=> d!110627 m!832271))

(declare-fun m!832437 () Bool)

(assert (=> b!894341 m!832437))

(assert (=> b!894082 d!110627))

(assert (=> b!894139 d!110527))

(assert (=> b!894127 d!110625))

(declare-fun b!894342 () Bool)

(declare-fun e!499517 () (_ BitVec 32))

(assert (=> b!894342 (= e!499517 #b00000000000000000000000000000000)))

(declare-fun d!110629 () Bool)

(declare-fun lt!404239 () (_ BitVec 32))

(assert (=> d!110629 (and (bvsge lt!404239 #b00000000000000000000000000000000) (bvsle lt!404239 (bvsub (size!25630 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!110629 (= lt!404239 e!499517)))

(declare-fun c!94379 () Bool)

(assert (=> d!110629 (= c!94379 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110629 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!25630 (_keys!10019 thiss!1181)) (size!25630 (_keys!10019 thiss!1181))))))

(assert (=> d!110629 (= (arrayCountValidKeys!0 (_keys!10019 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))) lt!404239)))

(declare-fun bm!39706 () Bool)

(declare-fun call!39709 () (_ BitVec 32))

(assert (=> bm!39706 (= call!39709 (arrayCountValidKeys!0 (_keys!10019 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894343 () Bool)

(declare-fun e!499518 () (_ BitVec 32))

(assert (=> b!894343 (= e!499517 e!499518)))

(declare-fun c!94378 () Bool)

(assert (=> b!894343 (= c!94378 (validKeyInArray!0 (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!894344 () Bool)

(assert (=> b!894344 (= e!499518 call!39709)))

(declare-fun b!894345 () Bool)

(assert (=> b!894345 (= e!499518 (bvadd #b00000000000000000000000000000001 call!39709))))

(assert (= (and d!110629 c!94379) b!894342))

(assert (= (and d!110629 (not c!94379)) b!894343))

(assert (= (and b!894343 c!94378) b!894345))

(assert (= (and b!894343 (not c!94378)) b!894344))

(assert (= (or b!894345 b!894344) bm!39706))

(declare-fun m!832439 () Bool)

(assert (=> bm!39706 m!832439))

(assert (=> b!894343 m!832271))

(assert (=> b!894343 m!832271))

(assert (=> b!894343 m!832273))

(assert (=> bm!39699 d!110629))

(declare-fun d!110631 () Bool)

(declare-fun res!605317 () Bool)

(declare-fun e!499519 () Bool)

(assert (=> d!110631 (=> res!605317 e!499519)))

(assert (=> d!110631 (= res!605317 (and ((_ is Cons!17797) (toList!5375 (map!12220 thiss!1181))) (= (_1!6022 (h!18929 (toList!5375 (map!12220 thiss!1181)))) key!785)))))

(assert (=> d!110631 (= (containsKey!423 (toList!5375 (map!12220 thiss!1181)) key!785) e!499519)))

(declare-fun b!894346 () Bool)

(declare-fun e!499520 () Bool)

(assert (=> b!894346 (= e!499519 e!499520)))

(declare-fun res!605318 () Bool)

(assert (=> b!894346 (=> (not res!605318) (not e!499520))))

(assert (=> b!894346 (= res!605318 (and (or (not ((_ is Cons!17797) (toList!5375 (map!12220 thiss!1181)))) (bvsle (_1!6022 (h!18929 (toList!5375 (map!12220 thiss!1181)))) key!785)) ((_ is Cons!17797) (toList!5375 (map!12220 thiss!1181))) (bvslt (_1!6022 (h!18929 (toList!5375 (map!12220 thiss!1181)))) key!785)))))

(declare-fun b!894347 () Bool)

(assert (=> b!894347 (= e!499520 (containsKey!423 (t!25130 (toList!5375 (map!12220 thiss!1181))) key!785))))

(assert (= (and d!110631 (not res!605317)) b!894346))

(assert (= (and b!894346 res!605318) b!894347))

(declare-fun m!832441 () Bool)

(assert (=> b!894347 m!832441))

(assert (=> d!110487 d!110631))

(declare-fun d!110633 () Bool)

(declare-fun res!605319 () Bool)

(declare-fun e!499521 () Bool)

(assert (=> d!110633 (=> res!605319 e!499521)))

(assert (=> d!110633 (= res!605319 (= (select (arr!25185 (_keys!10019 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110633 (= (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!499521)))

(declare-fun b!894348 () Bool)

(declare-fun e!499522 () Bool)

(assert (=> b!894348 (= e!499521 e!499522)))

(declare-fun res!605320 () Bool)

(assert (=> b!894348 (=> (not res!605320) (not e!499522))))

(assert (=> b!894348 (= res!605320 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25630 (_keys!10019 thiss!1181))))))

(declare-fun b!894349 () Bool)

(assert (=> b!894349 (= e!499522 (arrayContainsKey!0 (_keys!10019 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110633 (not res!605319)) b!894348))

(assert (= (and b!894348 res!605320) b!894349))

(assert (=> d!110633 m!832271))

(declare-fun m!832443 () Bool)

(assert (=> b!894349 m!832443))

(assert (=> b!894113 d!110633))

(declare-fun d!110635 () Bool)

(assert (=> d!110635 (= (apply!408 lt!404037 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13262 (getValueByKey!451 (toList!5375 lt!404037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25119 () Bool)

(assert (= bs!25119 d!110635))

(assert (=> bs!25119 m!832415))

(assert (=> bs!25119 m!832415))

(declare-fun m!832445 () Bool)

(assert (=> bs!25119 m!832445))

(assert (=> b!894021 d!110635))

(declare-fun b!894351 () Bool)

(declare-fun e!499523 () Bool)

(assert (=> b!894351 (= e!499523 tp_is_empty!18189)))

(declare-fun condMapEmpty!28857 () Bool)

(declare-fun mapDefault!28857 () ValueCell!8613)

(assert (=> mapNonEmpty!28856 (= condMapEmpty!28857 (= mapRest!28856 ((as const (Array (_ BitVec 32) ValueCell!8613)) mapDefault!28857)))))

(declare-fun mapRes!28857 () Bool)

(assert (=> mapNonEmpty!28856 (= tp!55573 (and e!499523 mapRes!28857))))

(declare-fun mapIsEmpty!28857 () Bool)

(assert (=> mapIsEmpty!28857 mapRes!28857))

(declare-fun mapNonEmpty!28857 () Bool)

(declare-fun tp!55574 () Bool)

(declare-fun e!499524 () Bool)

(assert (=> mapNonEmpty!28857 (= mapRes!28857 (and tp!55574 e!499524))))

(declare-fun mapRest!28857 () (Array (_ BitVec 32) ValueCell!8613))

(declare-fun mapKey!28857 () (_ BitVec 32))

(declare-fun mapValue!28857 () ValueCell!8613)

(assert (=> mapNonEmpty!28857 (= mapRest!28856 (store mapRest!28857 mapKey!28857 mapValue!28857))))

(declare-fun b!894350 () Bool)

(assert (=> b!894350 (= e!499524 tp_is_empty!18189)))

(assert (= (and mapNonEmpty!28856 condMapEmpty!28857) mapIsEmpty!28857))

(assert (= (and mapNonEmpty!28856 (not condMapEmpty!28857)) mapNonEmpty!28857))

(assert (= (and mapNonEmpty!28857 ((_ is ValueCellFull!8613) mapValue!28857)) b!894350))

(assert (= (and mapNonEmpty!28856 ((_ is ValueCellFull!8613) mapDefault!28857)) b!894351))

(declare-fun m!832447 () Bool)

(assert (=> mapNonEmpty!28857 m!832447))

(declare-fun b_lambda!12947 () Bool)

(assert (= b_lambda!12945 (or (and b!893877 b_free!15861) b_lambda!12947)))

(declare-fun b_lambda!12949 () Bool)

(assert (= b_lambda!12943 (or (and b!893877 b_free!15861) b_lambda!12949)))

(check-sat (not b!894332) (not bm!39700) (not b!894239) (not d!110605) (not b!894173) (not bm!39703) (not b!894182) (not b!894149) (not b!894322) (not b!894307) (not d!110591) (not bm!39706) (not b!894308) (not d!110601) (not d!110571) (not d!110609) (not d!110615) (not b!894199) (not b_lambda!12937) (not d!110607) (not b!894338) (not b_lambda!12941) (not b!894206) (not b!894304) (not d!110529) (not b!894240) (not b!894255) (not bm!39705) (not b!894247) (not d!110593) (not b!894286) (not b!894233) (not d!110619) (not b!894289) (not b!894148) (not d!110541) (not d!110559) (not b!894285) (not d!110611) (not d!110563) (not b!894171) (not b!894306) (not d!110587) b_and!26149 (not b!894236) (not b!894349) (not d!110595) (not d!110553) (not d!110579) (not d!110549) (not d!110565) (not d!110533) (not d!110597) (not b_lambda!12949) (not b!894248) (not b!894315) (not b!894333) (not d!110585) (not b!894232) (not b!894330) (not b_lambda!12947) (not mapNonEmpty!28857) (not b_next!15861) (not d!110525) (not d!110603) (not d!110561) (not d!110617) (not b!894347) (not b!894331) (not d!110575) (not b!894237) (not b!894291) (not d!110621) (not d!110577) (not b!894312) (not b!894314) (not b!894275) (not d!110551) (not b!894323) (not b!894181) (not d!110545) (not d!110519) (not b!894150) tp_is_empty!18189 (not b!894283) (not d!110521) (not b!894251) (not d!110599) (not b!894311) (not b!894343) (not b!894325) (not d!110547) (not b!894241) (not b!894234) (not b!894185) (not b!894341) (not d!110589) (not b!894152) (not b!894179) (not b!894310) (not d!110523) (not b!894301) (not b!894170) (not bm!39704) (not b!894328) (not b!894326) (not d!110635) (not d!110583) (not b!894253))
(check-sat b_and!26149 (not b_next!15861))
