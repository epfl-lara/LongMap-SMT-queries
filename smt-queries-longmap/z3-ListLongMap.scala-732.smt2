; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17008 () Bool)

(assert start!17008)

(declare-fun b!170884 () Bool)

(declare-fun b_free!4233 () Bool)

(declare-fun b_next!4233 () Bool)

(assert (=> b!170884 (= b_free!4233 (not b_next!4233))))

(declare-fun tp!15328 () Bool)

(declare-fun b_and!10647 () Bool)

(assert (=> b!170884 (= tp!15328 b_and!10647)))

(declare-fun b!170885 () Bool)

(declare-fun e!112814 () Bool)

(declare-fun e!112815 () Bool)

(assert (=> b!170885 (= e!112814 e!112815)))

(declare-fun res!81241 () Bool)

(assert (=> b!170885 (=> (not res!81241) (not e!112815))))

(declare-datatypes ((V!4987 0))(
  ( (V!4988 (val!2047 Int)) )
))
(declare-datatypes ((tuple2!3234 0))(
  ( (tuple2!3235 (_1!1628 (_ BitVec 64)) (_2!1628 V!4987)) )
))
(declare-datatypes ((List!2193 0))(
  ( (Nil!2190) (Cons!2189 (h!2806 tuple2!3234) (t!6995 List!2193)) )
))
(declare-datatypes ((ListLongMap!2161 0))(
  ( (ListLongMap!2162 (toList!1096 List!2193)) )
))
(declare-fun lt!85043 () ListLongMap!2161)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1144 (ListLongMap!2161 (_ BitVec 64)) Bool)

(assert (=> b!170885 (= res!81241 (contains!1144 lt!85043 key!828))))

(declare-datatypes ((ValueCell!1659 0))(
  ( (ValueCellFull!1659 (v!3912 V!4987)) (EmptyCell!1659) )
))
(declare-datatypes ((array!7123 0))(
  ( (array!7124 (arr!3389 (Array (_ BitVec 32) (_ BitVec 64))) (size!3682 (_ BitVec 32))) )
))
(declare-datatypes ((array!7125 0))(
  ( (array!7126 (arr!3390 (Array (_ BitVec 32) ValueCell!1659)) (size!3683 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2226 0))(
  ( (LongMapFixedSize!2227 (defaultEntry!3555 Int) (mask!8383 (_ BitVec 32)) (extraKeys!3296 (_ BitVec 32)) (zeroValue!3398 V!4987) (minValue!3398 V!4987) (_size!1162 (_ BitVec 32)) (_keys!5387 array!7123) (_values!3538 array!7125) (_vacant!1162 (_ BitVec 32))) )
))
(declare-fun lt!85045 () LongMapFixedSize!2226)

(declare-fun map!1853 (LongMapFixedSize!2226) ListLongMap!2161)

(assert (=> b!170885 (= lt!85043 (map!1853 lt!85045))))

(declare-fun b!170886 () Bool)

(declare-fun e!112812 () Bool)

(declare-fun tp_is_empty!4005 () Bool)

(assert (=> b!170886 (= e!112812 tp_is_empty!4005)))

(declare-fun b!170887 () Bool)

(declare-fun e!112818 () Bool)

(assert (=> b!170887 (= e!112818 tp_is_empty!4005)))

(declare-fun mapNonEmpty!6800 () Bool)

(declare-fun mapRes!6800 () Bool)

(declare-fun tp!15329 () Bool)

(assert (=> mapNonEmpty!6800 (= mapRes!6800 (and tp!15329 e!112812))))

(declare-fun mapKey!6800 () (_ BitVec 32))

(declare-fun mapValue!6800 () ValueCell!1659)

(declare-fun thiss!1248 () LongMapFixedSize!2226)

(declare-fun mapRest!6800 () (Array (_ BitVec 32) ValueCell!1659))

(assert (=> mapNonEmpty!6800 (= (arr!3390 (_values!3538 thiss!1248)) (store mapRest!6800 mapKey!6800 mapValue!6800))))

(declare-fun b!170888 () Bool)

(declare-fun e!112817 () Bool)

(assert (=> b!170888 (= e!112817 (not e!112814))))

(declare-fun res!81242 () Bool)

(assert (=> b!170888 (=> (not res!81242) (not e!112814))))

(declare-fun valid!947 (LongMapFixedSize!2226) Bool)

(assert (=> b!170888 (= res!81242 (valid!947 lt!85045))))

(declare-fun v!309 () V!4987)

(assert (=> b!170888 (= lt!85045 (LongMapFixedSize!2227 (defaultEntry!3555 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) (_size!1162 thiss!1248) (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (_vacant!1162 thiss!1248)))))

(declare-fun +!244 (ListLongMap!2161 tuple2!3234) ListLongMap!2161)

(declare-fun getCurrentListMap!750 (array!7123 array!7125 (_ BitVec 32) (_ BitVec 32) V!4987 V!4987 (_ BitVec 32) Int) ListLongMap!2161)

(assert (=> b!170888 (= (+!244 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-datatypes ((Unit!5252 0))(
  ( (Unit!5253) )
))
(declare-fun lt!85044 () Unit!5252)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!84 (array!7123 array!7125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!4987 V!4987 V!4987 Int) Unit!5252)

(assert (=> b!170888 (= lt!85044 (lemmaChangeZeroKeyThenAddPairToListMap!84 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3398 thiss!1248) v!309 (minValue!3398 thiss!1248) (defaultEntry!3555 thiss!1248)))))

(declare-fun b!170889 () Bool)

(assert (=> b!170889 (= e!112815 (= lt!85043 (+!244 (map!1853 thiss!1248) (tuple2!3235 key!828 v!309))))))

(declare-fun mapIsEmpty!6800 () Bool)

(assert (=> mapIsEmpty!6800 mapRes!6800))

(declare-fun e!112816 () Bool)

(declare-fun e!112813 () Bool)

(declare-fun array_inv!2169 (array!7123) Bool)

(declare-fun array_inv!2170 (array!7125) Bool)

(assert (=> b!170884 (= e!112813 (and tp!15328 tp_is_empty!4005 (array_inv!2169 (_keys!5387 thiss!1248)) (array_inv!2170 (_values!3538 thiss!1248)) e!112816))))

(declare-fun res!81243 () Bool)

(assert (=> start!17008 (=> (not res!81243) (not e!112817))))

(assert (=> start!17008 (= res!81243 (valid!947 thiss!1248))))

(assert (=> start!17008 e!112817))

(assert (=> start!17008 e!112813))

(assert (=> start!17008 true))

(assert (=> start!17008 tp_is_empty!4005))

(declare-fun b!170890 () Bool)

(declare-fun res!81240 () Bool)

(assert (=> b!170890 (=> (not res!81240) (not e!112817))))

(assert (=> b!170890 (= res!81240 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170891 () Bool)

(assert (=> b!170891 (= e!112816 (and e!112818 mapRes!6800))))

(declare-fun condMapEmpty!6800 () Bool)

(declare-fun mapDefault!6800 () ValueCell!1659)

(assert (=> b!170891 (= condMapEmpty!6800 (= (arr!3390 (_values!3538 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1659)) mapDefault!6800)))))

(assert (= (and start!17008 res!81243) b!170890))

(assert (= (and b!170890 res!81240) b!170888))

(assert (= (and b!170888 res!81242) b!170885))

(assert (= (and b!170885 res!81241) b!170889))

(assert (= (and b!170891 condMapEmpty!6800) mapIsEmpty!6800))

(assert (= (and b!170891 (not condMapEmpty!6800)) mapNonEmpty!6800))

(get-info :version)

(assert (= (and mapNonEmpty!6800 ((_ is ValueCellFull!1659) mapValue!6800)) b!170886))

(assert (= (and b!170891 ((_ is ValueCellFull!1659) mapDefault!6800)) b!170887))

(assert (= b!170884 b!170891))

(assert (= start!17008 b!170884))

(declare-fun m!199189 () Bool)

(assert (=> b!170884 m!199189))

(declare-fun m!199191 () Bool)

(assert (=> b!170884 m!199191))

(declare-fun m!199193 () Bool)

(assert (=> b!170888 m!199193))

(declare-fun m!199195 () Bool)

(assert (=> b!170888 m!199195))

(declare-fun m!199197 () Bool)

(assert (=> b!170888 m!199197))

(assert (=> b!170888 m!199193))

(declare-fun m!199199 () Bool)

(assert (=> b!170888 m!199199))

(declare-fun m!199201 () Bool)

(assert (=> b!170888 m!199201))

(declare-fun m!199203 () Bool)

(assert (=> b!170889 m!199203))

(assert (=> b!170889 m!199203))

(declare-fun m!199205 () Bool)

(assert (=> b!170889 m!199205))

(declare-fun m!199207 () Bool)

(assert (=> b!170885 m!199207))

(declare-fun m!199209 () Bool)

(assert (=> b!170885 m!199209))

(declare-fun m!199211 () Bool)

(assert (=> start!17008 m!199211))

(declare-fun m!199213 () Bool)

(assert (=> mapNonEmpty!6800 m!199213))

(check-sat (not b_next!4233) (not b!170888) b_and!10647 (not b!170889) (not b!170885) (not b!170884) (not mapNonEmpty!6800) (not start!17008) tp_is_empty!4005)
(check-sat b_and!10647 (not b_next!4233))
(get-model)

(declare-fun d!51767 () Bool)

(assert (=> d!51767 (= (array_inv!2169 (_keys!5387 thiss!1248)) (bvsge (size!3682 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170884 d!51767))

(declare-fun d!51769 () Bool)

(assert (=> d!51769 (= (array_inv!2170 (_values!3538 thiss!1248)) (bvsge (size!3683 (_values!3538 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170884 d!51769))

(declare-fun b!170958 () Bool)

(declare-fun res!81282 () Bool)

(declare-fun e!112869 () Bool)

(assert (=> b!170958 (=> (not res!81282) (not e!112869))))

(declare-fun e!112881 () Bool)

(assert (=> b!170958 (= res!81282 e!112881)))

(declare-fun res!81280 () Bool)

(assert (=> b!170958 (=> res!81280 e!112881)))

(declare-fun e!112880 () Bool)

(assert (=> b!170958 (= res!81280 (not e!112880))))

(declare-fun res!81279 () Bool)

(assert (=> b!170958 (=> (not res!81279) (not e!112880))))

(assert (=> b!170958 (= res!81279 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun bm!17401 () Bool)

(declare-fun call!17407 () ListLongMap!2161)

(declare-fun call!17408 () ListLongMap!2161)

(assert (=> bm!17401 (= call!17407 call!17408)))

(declare-fun d!51771 () Bool)

(assert (=> d!51771 e!112869))

(declare-fun res!81275 () Bool)

(assert (=> d!51771 (=> (not res!81275) (not e!112869))))

(assert (=> d!51771 (= res!81275 (or (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))))

(declare-fun lt!85105 () ListLongMap!2161)

(declare-fun lt!85114 () ListLongMap!2161)

(assert (=> d!51771 (= lt!85105 lt!85114)))

(declare-fun lt!85117 () Unit!5252)

(declare-fun e!112873 () Unit!5252)

(assert (=> d!51771 (= lt!85117 e!112873)))

(declare-fun c!30514 () Bool)

(declare-fun e!112874 () Bool)

(assert (=> d!51771 (= c!30514 e!112874)))

(declare-fun res!81278 () Bool)

(assert (=> d!51771 (=> (not res!81278) (not e!112874))))

(assert (=> d!51771 (= res!81278 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun e!112872 () ListLongMap!2161)

(assert (=> d!51771 (= lt!85114 e!112872)))

(declare-fun c!30512 () Bool)

(assert (=> d!51771 (= c!30512 (and (not (= (bvand (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!51771 (validMask!0 (mask!8383 thiss!1248))))

(assert (=> d!51771 (= (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)) lt!85105)))

(declare-fun bm!17402 () Bool)

(declare-fun call!17409 () ListLongMap!2161)

(declare-fun call!17406 () ListLongMap!2161)

(assert (=> bm!17402 (= call!17409 call!17406)))

(declare-fun b!170959 () Bool)

(declare-fun e!112871 () Bool)

(declare-fun apply!129 (ListLongMap!2161 (_ BitVec 64)) V!4987)

(assert (=> b!170959 (= e!112871 (= (apply!129 lt!85105 #b0000000000000000000000000000000000000000000000000000000000000000) v!309))))

(declare-fun b!170960 () Bool)

(declare-fun Unit!5254 () Unit!5252)

(assert (=> b!170960 (= e!112873 Unit!5254)))

(declare-fun b!170961 () Bool)

(declare-fun lt!85109 () Unit!5252)

(assert (=> b!170961 (= e!112873 lt!85109)))

(declare-fun lt!85119 () ListLongMap!2161)

(declare-fun getCurrentListMapNoExtraKeys!162 (array!7123 array!7125 (_ BitVec 32) (_ BitVec 32) V!4987 V!4987 (_ BitVec 32) Int) ListLongMap!2161)

(assert (=> b!170961 (= lt!85119 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85104 () (_ BitVec 64))

(assert (=> b!170961 (= lt!85104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85102 () (_ BitVec 64))

(assert (=> b!170961 (= lt!85102 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85118 () Unit!5252)

(declare-fun addStillContains!105 (ListLongMap!2161 (_ BitVec 64) V!4987 (_ BitVec 64)) Unit!5252)

(assert (=> b!170961 (= lt!85118 (addStillContains!105 lt!85119 lt!85104 v!309 lt!85102))))

(assert (=> b!170961 (contains!1144 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)) lt!85102)))

(declare-fun lt!85099 () Unit!5252)

(assert (=> b!170961 (= lt!85099 lt!85118)))

(declare-fun lt!85111 () ListLongMap!2161)

(assert (=> b!170961 (= lt!85111 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85110 () (_ BitVec 64))

(assert (=> b!170961 (= lt!85110 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85103 () (_ BitVec 64))

(assert (=> b!170961 (= lt!85103 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85100 () Unit!5252)

(declare-fun addApplyDifferent!105 (ListLongMap!2161 (_ BitVec 64) V!4987 (_ BitVec 64)) Unit!5252)

(assert (=> b!170961 (= lt!85100 (addApplyDifferent!105 lt!85111 lt!85110 (minValue!3398 thiss!1248) lt!85103))))

(assert (=> b!170961 (= (apply!129 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) lt!85103) (apply!129 lt!85111 lt!85103))))

(declare-fun lt!85108 () Unit!5252)

(assert (=> b!170961 (= lt!85108 lt!85100)))

(declare-fun lt!85101 () ListLongMap!2161)

(assert (=> b!170961 (= lt!85101 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85107 () (_ BitVec 64))

(assert (=> b!170961 (= lt!85107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85116 () (_ BitVec 64))

(assert (=> b!170961 (= lt!85116 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85113 () Unit!5252)

(assert (=> b!170961 (= lt!85113 (addApplyDifferent!105 lt!85101 lt!85107 v!309 lt!85116))))

(assert (=> b!170961 (= (apply!129 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)) lt!85116) (apply!129 lt!85101 lt!85116))))

(declare-fun lt!85120 () Unit!5252)

(assert (=> b!170961 (= lt!85120 lt!85113)))

(declare-fun lt!85115 () ListLongMap!2161)

(assert (=> b!170961 (= lt!85115 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85106 () (_ BitVec 64))

(assert (=> b!170961 (= lt!85106 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85112 () (_ BitVec 64))

(assert (=> b!170961 (= lt!85112 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170961 (= lt!85109 (addApplyDifferent!105 lt!85115 lt!85106 (minValue!3398 thiss!1248) lt!85112))))

(assert (=> b!170961 (= (apply!129 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) lt!85112) (apply!129 lt!85115 lt!85112))))

(declare-fun b!170962 () Bool)

(declare-fun e!112879 () Bool)

(declare-fun call!17405 () Bool)

(assert (=> b!170962 (= e!112879 (not call!17405))))

(declare-fun b!170963 () Bool)

(declare-fun e!112878 () ListLongMap!2161)

(assert (=> b!170963 (= e!112878 call!17407)))

(declare-fun b!170964 () Bool)

(assert (=> b!170964 (= e!112872 (+!244 call!17406 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(declare-fun bm!17403 () Bool)

(declare-fun call!17410 () Bool)

(assert (=> bm!17403 (= call!17410 (contains!1144 lt!85105 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170965 () Bool)

(declare-fun e!112875 () ListLongMap!2161)

(assert (=> b!170965 (= e!112875 call!17409)))

(declare-fun b!170966 () Bool)

(assert (=> b!170966 (= e!112878 call!17409)))

(declare-fun bm!17404 () Bool)

(declare-fun call!17404 () ListLongMap!2161)

(assert (=> bm!17404 (= call!17408 call!17404)))

(declare-fun b!170967 () Bool)

(declare-fun c!30513 () Bool)

(assert (=> b!170967 (= c!30513 (and (not (= (bvand (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!170967 (= e!112875 e!112878)))

(declare-fun bm!17405 () Bool)

(assert (=> bm!17405 (= call!17404 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun b!170968 () Bool)

(declare-fun e!112870 () Bool)

(assert (=> b!170968 (= e!112870 (not call!17410))))

(declare-fun b!170969 () Bool)

(declare-fun e!112876 () Bool)

(assert (=> b!170969 (= e!112881 e!112876)))

(declare-fun res!81274 () Bool)

(assert (=> b!170969 (=> (not res!81274) (not e!112876))))

(assert (=> b!170969 (= res!81274 (contains!1144 lt!85105 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!170969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun c!30510 () Bool)

(declare-fun bm!17406 () Bool)

(assert (=> bm!17406 (= call!17406 (+!244 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)) (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!170970 () Bool)

(assert (=> b!170970 (= e!112869 e!112870)))

(declare-fun c!30509 () Bool)

(assert (=> b!170970 (= c!30509 (not (= (bvand (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!170971 () Bool)

(declare-fun e!112877 () Bool)

(assert (=> b!170971 (= e!112870 e!112877)))

(declare-fun res!81277 () Bool)

(assert (=> b!170971 (= res!81277 call!17410)))

(assert (=> b!170971 (=> (not res!81277) (not e!112877))))

(declare-fun b!170972 () Bool)

(assert (=> b!170972 (= e!112872 e!112875)))

(assert (=> b!170972 (= c!30510 (and (not (= (bvand (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!170973 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170973 (= e!112880 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170974 () Bool)

(assert (=> b!170974 (= e!112877 (= (apply!129 lt!85105 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3398 thiss!1248)))))

(declare-fun b!170975 () Bool)

(declare-fun res!81276 () Bool)

(assert (=> b!170975 (=> (not res!81276) (not e!112869))))

(assert (=> b!170975 (= res!81276 e!112879)))

(declare-fun c!30511 () Bool)

(assert (=> b!170975 (= c!30511 (not (= (bvand (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!170976 () Bool)

(declare-fun get!1938 (ValueCell!1659 V!4987) V!4987)

(declare-fun dynLambda!472 (Int (_ BitVec 64)) V!4987)

(assert (=> b!170976 (= e!112876 (= (apply!129 lt!85105 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!170976 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3683 (_values!3538 thiss!1248))))))

(assert (=> b!170976 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun b!170977 () Bool)

(assert (=> b!170977 (= e!112874 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17407 () Bool)

(assert (=> bm!17407 (= call!17405 (contains!1144 lt!85105 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170978 () Bool)

(assert (=> b!170978 (= e!112879 e!112871)))

(declare-fun res!81281 () Bool)

(assert (=> b!170978 (= res!81281 call!17405)))

(assert (=> b!170978 (=> (not res!81281) (not e!112871))))

(assert (= (and d!51771 c!30512) b!170964))

(assert (= (and d!51771 (not c!30512)) b!170972))

(assert (= (and b!170972 c!30510) b!170965))

(assert (= (and b!170972 (not c!30510)) b!170967))

(assert (= (and b!170967 c!30513) b!170966))

(assert (= (and b!170967 (not c!30513)) b!170963))

(assert (= (or b!170966 b!170963) bm!17401))

(assert (= (or b!170965 bm!17401) bm!17404))

(assert (= (or b!170965 b!170966) bm!17402))

(assert (= (or b!170964 bm!17404) bm!17405))

(assert (= (or b!170964 bm!17402) bm!17406))

(assert (= (and d!51771 res!81278) b!170977))

(assert (= (and d!51771 c!30514) b!170961))

(assert (= (and d!51771 (not c!30514)) b!170960))

(assert (= (and d!51771 res!81275) b!170958))

(assert (= (and b!170958 res!81279) b!170973))

(assert (= (and b!170958 (not res!81280)) b!170969))

(assert (= (and b!170969 res!81274) b!170976))

(assert (= (and b!170958 res!81282) b!170975))

(assert (= (and b!170975 c!30511) b!170978))

(assert (= (and b!170975 (not c!30511)) b!170962))

(assert (= (and b!170978 res!81281) b!170959))

(assert (= (or b!170978 b!170962) bm!17407))

(assert (= (and b!170975 res!81276) b!170970))

(assert (= (and b!170970 c!30509) b!170971))

(assert (= (and b!170970 (not c!30509)) b!170968))

(assert (= (and b!170971 res!81277) b!170974))

(assert (= (or b!170971 b!170968) bm!17403))

(declare-fun b_lambda!6887 () Bool)

(assert (=> (not b_lambda!6887) (not b!170976)))

(declare-fun t!6998 () Bool)

(declare-fun tb!2765 () Bool)

(assert (=> (and b!170884 (= (defaultEntry!3555 thiss!1248) (defaultEntry!3555 thiss!1248)) t!6998) tb!2765))

(declare-fun result!4561 () Bool)

(assert (=> tb!2765 (= result!4561 tp_is_empty!4005)))

(assert (=> b!170976 t!6998))

(declare-fun b_and!10651 () Bool)

(assert (= b_and!10647 (and (=> t!6998 result!4561) b_and!10651)))

(declare-fun m!199241 () Bool)

(assert (=> b!170969 m!199241))

(assert (=> b!170969 m!199241))

(declare-fun m!199243 () Bool)

(assert (=> b!170969 m!199243))

(declare-fun m!199245 () Bool)

(assert (=> bm!17407 m!199245))

(assert (=> b!170973 m!199241))

(assert (=> b!170973 m!199241))

(declare-fun m!199247 () Bool)

(assert (=> b!170973 m!199247))

(declare-fun m!199249 () Bool)

(assert (=> bm!17406 m!199249))

(declare-fun m!199251 () Bool)

(assert (=> bm!17403 m!199251))

(declare-fun m!199253 () Bool)

(assert (=> b!170961 m!199253))

(declare-fun m!199255 () Bool)

(assert (=> b!170961 m!199255))

(declare-fun m!199257 () Bool)

(assert (=> b!170961 m!199257))

(declare-fun m!199259 () Bool)

(assert (=> b!170961 m!199259))

(declare-fun m!199261 () Bool)

(assert (=> b!170961 m!199261))

(assert (=> b!170961 m!199241))

(declare-fun m!199263 () Bool)

(assert (=> b!170961 m!199263))

(declare-fun m!199265 () Bool)

(assert (=> b!170961 m!199265))

(declare-fun m!199267 () Bool)

(assert (=> b!170961 m!199267))

(declare-fun m!199269 () Bool)

(assert (=> b!170961 m!199269))

(declare-fun m!199271 () Bool)

(assert (=> b!170961 m!199271))

(assert (=> b!170961 m!199257))

(declare-fun m!199273 () Bool)

(assert (=> b!170961 m!199273))

(declare-fun m!199275 () Bool)

(assert (=> b!170961 m!199275))

(declare-fun m!199277 () Bool)

(assert (=> b!170961 m!199277))

(assert (=> b!170961 m!199261))

(declare-fun m!199279 () Bool)

(assert (=> b!170961 m!199279))

(assert (=> b!170961 m!199273))

(declare-fun m!199281 () Bool)

(assert (=> b!170961 m!199281))

(declare-fun m!199283 () Bool)

(assert (=> b!170961 m!199283))

(assert (=> b!170961 m!199267))

(declare-fun m!199285 () Bool)

(assert (=> b!170959 m!199285))

(assert (=> b!170977 m!199241))

(assert (=> b!170977 m!199241))

(assert (=> b!170977 m!199247))

(declare-fun m!199287 () Bool)

(assert (=> b!170976 m!199287))

(assert (=> b!170976 m!199241))

(declare-fun m!199289 () Bool)

(assert (=> b!170976 m!199289))

(assert (=> b!170976 m!199241))

(declare-fun m!199291 () Bool)

(assert (=> b!170976 m!199291))

(assert (=> b!170976 m!199287))

(assert (=> b!170976 m!199289))

(declare-fun m!199293 () Bool)

(assert (=> b!170976 m!199293))

(declare-fun m!199295 () Bool)

(assert (=> d!51771 m!199295))

(declare-fun m!199297 () Bool)

(assert (=> b!170964 m!199297))

(assert (=> bm!17405 m!199277))

(declare-fun m!199299 () Bool)

(assert (=> b!170974 m!199299))

(assert (=> b!170888 d!51771))

(declare-fun d!51773 () Bool)

(declare-fun res!81289 () Bool)

(declare-fun e!112884 () Bool)

(assert (=> d!51773 (=> (not res!81289) (not e!112884))))

(declare-fun simpleValid!135 (LongMapFixedSize!2226) Bool)

(assert (=> d!51773 (= res!81289 (simpleValid!135 lt!85045))))

(assert (=> d!51773 (= (valid!947 lt!85045) e!112884)))

(declare-fun b!170987 () Bool)

(declare-fun res!81290 () Bool)

(assert (=> b!170987 (=> (not res!81290) (not e!112884))))

(declare-fun arrayCountValidKeys!0 (array!7123 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170987 (= res!81290 (= (arrayCountValidKeys!0 (_keys!5387 lt!85045) #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))) (_size!1162 lt!85045)))))

(declare-fun b!170988 () Bool)

(declare-fun res!81291 () Bool)

(assert (=> b!170988 (=> (not res!81291) (not e!112884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7123 (_ BitVec 32)) Bool)

(assert (=> b!170988 (= res!81291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5387 lt!85045) (mask!8383 lt!85045)))))

(declare-fun b!170989 () Bool)

(declare-datatypes ((List!2195 0))(
  ( (Nil!2192) (Cons!2191 (h!2808 (_ BitVec 64)) (t!6999 List!2195)) )
))
(declare-fun arrayNoDuplicates!0 (array!7123 (_ BitVec 32) List!2195) Bool)

(assert (=> b!170989 (= e!112884 (arrayNoDuplicates!0 (_keys!5387 lt!85045) #b00000000000000000000000000000000 Nil!2192))))

(assert (= (and d!51773 res!81289) b!170987))

(assert (= (and b!170987 res!81290) b!170988))

(assert (= (and b!170988 res!81291) b!170989))

(declare-fun m!199301 () Bool)

(assert (=> d!51773 m!199301))

(declare-fun m!199303 () Bool)

(assert (=> b!170987 m!199303))

(declare-fun m!199305 () Bool)

(assert (=> b!170988 m!199305))

(declare-fun m!199307 () Bool)

(assert (=> b!170989 m!199307))

(assert (=> b!170888 d!51773))

(declare-fun d!51775 () Bool)

(assert (=> d!51775 (= (+!244 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85123 () Unit!5252)

(declare-fun choose!922 (array!7123 array!7125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!4987 V!4987 V!4987 Int) Unit!5252)

(assert (=> d!51775 (= lt!85123 (choose!922 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3398 thiss!1248) v!309 (minValue!3398 thiss!1248) (defaultEntry!3555 thiss!1248)))))

(assert (=> d!51775 (validMask!0 (mask!8383 thiss!1248))))

(assert (=> d!51775 (= (lemmaChangeZeroKeyThenAddPairToListMap!84 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3398 thiss!1248) v!309 (minValue!3398 thiss!1248) (defaultEntry!3555 thiss!1248)) lt!85123)))

(declare-fun bs!7047 () Bool)

(assert (= bs!7047 d!51775))

(declare-fun m!199309 () Bool)

(assert (=> bs!7047 m!199309))

(assert (=> bs!7047 m!199195))

(assert (=> bs!7047 m!199295))

(assert (=> bs!7047 m!199193))

(assert (=> bs!7047 m!199199))

(assert (=> bs!7047 m!199193))

(assert (=> b!170888 d!51775))

(declare-fun b!170990 () Bool)

(declare-fun res!81300 () Bool)

(declare-fun e!112885 () Bool)

(assert (=> b!170990 (=> (not res!81300) (not e!112885))))

(declare-fun e!112897 () Bool)

(assert (=> b!170990 (= res!81300 e!112897)))

(declare-fun res!81298 () Bool)

(assert (=> b!170990 (=> res!81298 e!112897)))

(declare-fun e!112896 () Bool)

(assert (=> b!170990 (= res!81298 (not e!112896))))

(declare-fun res!81297 () Bool)

(assert (=> b!170990 (=> (not res!81297) (not e!112896))))

(assert (=> b!170990 (= res!81297 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun bm!17408 () Bool)

(declare-fun call!17414 () ListLongMap!2161)

(declare-fun call!17415 () ListLongMap!2161)

(assert (=> bm!17408 (= call!17414 call!17415)))

(declare-fun d!51777 () Bool)

(assert (=> d!51777 e!112885))

(declare-fun res!81293 () Bool)

(assert (=> d!51777 (=> (not res!81293) (not e!112885))))

(assert (=> d!51777 (= res!81293 (or (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))))

(declare-fun lt!85130 () ListLongMap!2161)

(declare-fun lt!85139 () ListLongMap!2161)

(assert (=> d!51777 (= lt!85130 lt!85139)))

(declare-fun lt!85142 () Unit!5252)

(declare-fun e!112889 () Unit!5252)

(assert (=> d!51777 (= lt!85142 e!112889)))

(declare-fun c!30520 () Bool)

(declare-fun e!112890 () Bool)

(assert (=> d!51777 (= c!30520 e!112890)))

(declare-fun res!81296 () Bool)

(assert (=> d!51777 (=> (not res!81296) (not e!112890))))

(assert (=> d!51777 (= res!81296 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun e!112888 () ListLongMap!2161)

(assert (=> d!51777 (= lt!85139 e!112888)))

(declare-fun c!30518 () Bool)

(assert (=> d!51777 (= c!30518 (and (not (= (bvand (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3296 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!51777 (validMask!0 (mask!8383 thiss!1248))))

(assert (=> d!51777 (= (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)) lt!85130)))

(declare-fun bm!17409 () Bool)

(declare-fun call!17416 () ListLongMap!2161)

(declare-fun call!17413 () ListLongMap!2161)

(assert (=> bm!17409 (= call!17416 call!17413)))

(declare-fun b!170991 () Bool)

(declare-fun e!112887 () Bool)

(assert (=> b!170991 (= e!112887 (= (apply!129 lt!85130 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3398 thiss!1248)))))

(declare-fun b!170992 () Bool)

(declare-fun Unit!5255 () Unit!5252)

(assert (=> b!170992 (= e!112889 Unit!5255)))

(declare-fun b!170993 () Bool)

(declare-fun lt!85134 () Unit!5252)

(assert (=> b!170993 (= e!112889 lt!85134)))

(declare-fun lt!85144 () ListLongMap!2161)

(assert (=> b!170993 (= lt!85144 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85129 () (_ BitVec 64))

(assert (=> b!170993 (= lt!85129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85127 () (_ BitVec 64))

(assert (=> b!170993 (= lt!85127 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85143 () Unit!5252)

(assert (=> b!170993 (= lt!85143 (addStillContains!105 lt!85144 lt!85129 (zeroValue!3398 thiss!1248) lt!85127))))

(assert (=> b!170993 (contains!1144 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) lt!85127)))

(declare-fun lt!85124 () Unit!5252)

(assert (=> b!170993 (= lt!85124 lt!85143)))

(declare-fun lt!85136 () ListLongMap!2161)

(assert (=> b!170993 (= lt!85136 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85135 () (_ BitVec 64))

(assert (=> b!170993 (= lt!85135 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85128 () (_ BitVec 64))

(assert (=> b!170993 (= lt!85128 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85125 () Unit!5252)

(assert (=> b!170993 (= lt!85125 (addApplyDifferent!105 lt!85136 lt!85135 (minValue!3398 thiss!1248) lt!85128))))

(assert (=> b!170993 (= (apply!129 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) lt!85128) (apply!129 lt!85136 lt!85128))))

(declare-fun lt!85133 () Unit!5252)

(assert (=> b!170993 (= lt!85133 lt!85125)))

(declare-fun lt!85126 () ListLongMap!2161)

(assert (=> b!170993 (= lt!85126 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85132 () (_ BitVec 64))

(assert (=> b!170993 (= lt!85132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85141 () (_ BitVec 64))

(assert (=> b!170993 (= lt!85141 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85138 () Unit!5252)

(assert (=> b!170993 (= lt!85138 (addApplyDifferent!105 lt!85126 lt!85132 (zeroValue!3398 thiss!1248) lt!85141))))

(assert (=> b!170993 (= (apply!129 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) lt!85141) (apply!129 lt!85126 lt!85141))))

(declare-fun lt!85145 () Unit!5252)

(assert (=> b!170993 (= lt!85145 lt!85138)))

(declare-fun lt!85140 () ListLongMap!2161)

(assert (=> b!170993 (= lt!85140 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun lt!85131 () (_ BitVec 64))

(assert (=> b!170993 (= lt!85131 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85137 () (_ BitVec 64))

(assert (=> b!170993 (= lt!85137 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170993 (= lt!85134 (addApplyDifferent!105 lt!85140 lt!85131 (minValue!3398 thiss!1248) lt!85137))))

(assert (=> b!170993 (= (apply!129 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) lt!85137) (apply!129 lt!85140 lt!85137))))

(declare-fun b!170994 () Bool)

(declare-fun e!112895 () Bool)

(declare-fun call!17412 () Bool)

(assert (=> b!170994 (= e!112895 (not call!17412))))

(declare-fun b!170995 () Bool)

(declare-fun e!112894 () ListLongMap!2161)

(assert (=> b!170995 (= e!112894 call!17414)))

(declare-fun b!170996 () Bool)

(assert (=> b!170996 (= e!112888 (+!244 call!17413 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(declare-fun bm!17410 () Bool)

(declare-fun call!17417 () Bool)

(assert (=> bm!17410 (= call!17417 (contains!1144 lt!85130 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170997 () Bool)

(declare-fun e!112891 () ListLongMap!2161)

(assert (=> b!170997 (= e!112891 call!17416)))

(declare-fun b!170998 () Bool)

(assert (=> b!170998 (= e!112894 call!17416)))

(declare-fun bm!17411 () Bool)

(declare-fun call!17411 () ListLongMap!2161)

(assert (=> bm!17411 (= call!17415 call!17411)))

(declare-fun b!170999 () Bool)

(declare-fun c!30519 () Bool)

(assert (=> b!170999 (= c!30519 (and (not (= (bvand (extraKeys!3296 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!170999 (= e!112891 e!112894)))

(declare-fun bm!17412 () Bool)

(assert (=> bm!17412 (= call!17411 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun b!171000 () Bool)

(declare-fun e!112886 () Bool)

(assert (=> b!171000 (= e!112886 (not call!17417))))

(declare-fun b!171001 () Bool)

(declare-fun e!112892 () Bool)

(assert (=> b!171001 (= e!112897 e!112892)))

(declare-fun res!81292 () Bool)

(assert (=> b!171001 (=> (not res!81292) (not e!112892))))

(assert (=> b!171001 (= res!81292 (contains!1144 lt!85130 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun bm!17413 () Bool)

(declare-fun c!30516 () Bool)

(assert (=> bm!17413 (= call!17413 (+!244 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)) (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171002 () Bool)

(assert (=> b!171002 (= e!112885 e!112886)))

(declare-fun c!30515 () Bool)

(assert (=> b!171002 (= c!30515 (not (= (bvand (extraKeys!3296 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171003 () Bool)

(declare-fun e!112893 () Bool)

(assert (=> b!171003 (= e!112886 e!112893)))

(declare-fun res!81295 () Bool)

(assert (=> b!171003 (= res!81295 call!17417)))

(assert (=> b!171003 (=> (not res!81295) (not e!112893))))

(declare-fun b!171004 () Bool)

(assert (=> b!171004 (= e!112888 e!112891)))

(assert (=> b!171004 (= c!30516 (and (not (= (bvand (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3296 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171005 () Bool)

(assert (=> b!171005 (= e!112896 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171006 () Bool)

(assert (=> b!171006 (= e!112893 (= (apply!129 lt!85130 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3398 thiss!1248)))))

(declare-fun b!171007 () Bool)

(declare-fun res!81294 () Bool)

(assert (=> b!171007 (=> (not res!81294) (not e!112885))))

(assert (=> b!171007 (= res!81294 e!112895)))

(declare-fun c!30517 () Bool)

(assert (=> b!171007 (= c!30517 (not (= (bvand (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!171008 () Bool)

(assert (=> b!171008 (= e!112892 (= (apply!129 lt!85130 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3683 (_values!3538 thiss!1248))))))

(assert (=> b!171008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun b!171009 () Bool)

(assert (=> b!171009 (= e!112890 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17414 () Bool)

(assert (=> bm!17414 (= call!17412 (contains!1144 lt!85130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171010 () Bool)

(assert (=> b!171010 (= e!112895 e!112887)))

(declare-fun res!81299 () Bool)

(assert (=> b!171010 (= res!81299 call!17412)))

(assert (=> b!171010 (=> (not res!81299) (not e!112887))))

(assert (= (and d!51777 c!30518) b!170996))

(assert (= (and d!51777 (not c!30518)) b!171004))

(assert (= (and b!171004 c!30516) b!170997))

(assert (= (and b!171004 (not c!30516)) b!170999))

(assert (= (and b!170999 c!30519) b!170998))

(assert (= (and b!170999 (not c!30519)) b!170995))

(assert (= (or b!170998 b!170995) bm!17408))

(assert (= (or b!170997 bm!17408) bm!17411))

(assert (= (or b!170997 b!170998) bm!17409))

(assert (= (or b!170996 bm!17411) bm!17412))

(assert (= (or b!170996 bm!17409) bm!17413))

(assert (= (and d!51777 res!81296) b!171009))

(assert (= (and d!51777 c!30520) b!170993))

(assert (= (and d!51777 (not c!30520)) b!170992))

(assert (= (and d!51777 res!81293) b!170990))

(assert (= (and b!170990 res!81297) b!171005))

(assert (= (and b!170990 (not res!81298)) b!171001))

(assert (= (and b!171001 res!81292) b!171008))

(assert (= (and b!170990 res!81300) b!171007))

(assert (= (and b!171007 c!30517) b!171010))

(assert (= (and b!171007 (not c!30517)) b!170994))

(assert (= (and b!171010 res!81299) b!170991))

(assert (= (or b!171010 b!170994) bm!17414))

(assert (= (and b!171007 res!81294) b!171002))

(assert (= (and b!171002 c!30515) b!171003))

(assert (= (and b!171002 (not c!30515)) b!171000))

(assert (= (and b!171003 res!81295) b!171006))

(assert (= (or b!171003 b!171000) bm!17410))

(declare-fun b_lambda!6889 () Bool)

(assert (=> (not b_lambda!6889) (not b!171008)))

(assert (=> b!171008 t!6998))

(declare-fun b_and!10653 () Bool)

(assert (= b_and!10651 (and (=> t!6998 result!4561) b_and!10653)))

(assert (=> b!171001 m!199241))

(assert (=> b!171001 m!199241))

(declare-fun m!199311 () Bool)

(assert (=> b!171001 m!199311))

(declare-fun m!199313 () Bool)

(assert (=> bm!17414 m!199313))

(assert (=> b!171005 m!199241))

(assert (=> b!171005 m!199241))

(assert (=> b!171005 m!199247))

(declare-fun m!199315 () Bool)

(assert (=> bm!17413 m!199315))

(declare-fun m!199317 () Bool)

(assert (=> bm!17410 m!199317))

(declare-fun m!199319 () Bool)

(assert (=> b!170993 m!199319))

(declare-fun m!199321 () Bool)

(assert (=> b!170993 m!199321))

(declare-fun m!199323 () Bool)

(assert (=> b!170993 m!199323))

(declare-fun m!199325 () Bool)

(assert (=> b!170993 m!199325))

(declare-fun m!199327 () Bool)

(assert (=> b!170993 m!199327))

(assert (=> b!170993 m!199241))

(declare-fun m!199329 () Bool)

(assert (=> b!170993 m!199329))

(declare-fun m!199331 () Bool)

(assert (=> b!170993 m!199331))

(declare-fun m!199333 () Bool)

(assert (=> b!170993 m!199333))

(declare-fun m!199335 () Bool)

(assert (=> b!170993 m!199335))

(declare-fun m!199337 () Bool)

(assert (=> b!170993 m!199337))

(assert (=> b!170993 m!199323))

(declare-fun m!199339 () Bool)

(assert (=> b!170993 m!199339))

(declare-fun m!199341 () Bool)

(assert (=> b!170993 m!199341))

(declare-fun m!199343 () Bool)

(assert (=> b!170993 m!199343))

(assert (=> b!170993 m!199327))

(declare-fun m!199345 () Bool)

(assert (=> b!170993 m!199345))

(assert (=> b!170993 m!199339))

(declare-fun m!199347 () Bool)

(assert (=> b!170993 m!199347))

(declare-fun m!199349 () Bool)

(assert (=> b!170993 m!199349))

(assert (=> b!170993 m!199333))

(declare-fun m!199351 () Bool)

(assert (=> b!170991 m!199351))

(assert (=> b!171009 m!199241))

(assert (=> b!171009 m!199241))

(assert (=> b!171009 m!199247))

(assert (=> b!171008 m!199287))

(assert (=> b!171008 m!199241))

(assert (=> b!171008 m!199289))

(assert (=> b!171008 m!199241))

(declare-fun m!199353 () Bool)

(assert (=> b!171008 m!199353))

(assert (=> b!171008 m!199287))

(assert (=> b!171008 m!199289))

(assert (=> b!171008 m!199293))

(assert (=> d!51777 m!199295))

(declare-fun m!199355 () Bool)

(assert (=> b!170996 m!199355))

(assert (=> bm!17412 m!199343))

(declare-fun m!199357 () Bool)

(assert (=> b!171006 m!199357))

(assert (=> b!170888 d!51777))

(declare-fun d!51779 () Bool)

(declare-fun e!112900 () Bool)

(assert (=> d!51779 e!112900))

(declare-fun res!81305 () Bool)

(assert (=> d!51779 (=> (not res!81305) (not e!112900))))

(declare-fun lt!85155 () ListLongMap!2161)

(assert (=> d!51779 (= res!81305 (contains!1144 lt!85155 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85156 () List!2193)

(assert (=> d!51779 (= lt!85155 (ListLongMap!2162 lt!85156))))

(declare-fun lt!85157 () Unit!5252)

(declare-fun lt!85154 () Unit!5252)

(assert (=> d!51779 (= lt!85157 lt!85154)))

(declare-datatypes ((Option!190 0))(
  ( (Some!189 (v!3914 V!4987)) (None!188) )
))
(declare-fun getValueByKey!184 (List!2193 (_ BitVec 64)) Option!190)

(assert (=> d!51779 (= (getValueByKey!184 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!189 (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!97 (List!2193 (_ BitVec 64) V!4987) Unit!5252)

(assert (=> d!51779 (= lt!85154 (lemmaContainsTupThenGetReturnValue!97 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun insertStrictlySorted!100 (List!2193 (_ BitVec 64) V!4987) List!2193)

(assert (=> d!51779 (= lt!85156 (insertStrictlySorted!100 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51779 (= (+!244 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85155)))

(declare-fun b!171015 () Bool)

(declare-fun res!81306 () Bool)

(assert (=> b!171015 (=> (not res!81306) (not e!112900))))

(assert (=> b!171015 (= res!81306 (= (getValueByKey!184 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!189 (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171016 () Bool)

(declare-fun contains!1146 (List!2193 tuple2!3234) Bool)

(assert (=> b!171016 (= e!112900 (contains!1146 (toList!1096 lt!85155) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!51779 res!81305) b!171015))

(assert (= (and b!171015 res!81306) b!171016))

(declare-fun m!199359 () Bool)

(assert (=> d!51779 m!199359))

(declare-fun m!199361 () Bool)

(assert (=> d!51779 m!199361))

(declare-fun m!199363 () Bool)

(assert (=> d!51779 m!199363))

(declare-fun m!199365 () Bool)

(assert (=> d!51779 m!199365))

(declare-fun m!199367 () Bool)

(assert (=> b!171015 m!199367))

(declare-fun m!199369 () Bool)

(assert (=> b!171016 m!199369))

(assert (=> b!170888 d!51779))

(declare-fun d!51781 () Bool)

(declare-fun res!81307 () Bool)

(declare-fun e!112901 () Bool)

(assert (=> d!51781 (=> (not res!81307) (not e!112901))))

(assert (=> d!51781 (= res!81307 (simpleValid!135 thiss!1248))))

(assert (=> d!51781 (= (valid!947 thiss!1248) e!112901)))

(declare-fun b!171017 () Bool)

(declare-fun res!81308 () Bool)

(assert (=> b!171017 (=> (not res!81308) (not e!112901))))

(assert (=> b!171017 (= res!81308 (= (arrayCountValidKeys!0 (_keys!5387 thiss!1248) #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))) (_size!1162 thiss!1248)))))

(declare-fun b!171018 () Bool)

(declare-fun res!81309 () Bool)

(assert (=> b!171018 (=> (not res!81309) (not e!112901))))

(assert (=> b!171018 (= res!81309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5387 thiss!1248) (mask!8383 thiss!1248)))))

(declare-fun b!171019 () Bool)

(assert (=> b!171019 (= e!112901 (arrayNoDuplicates!0 (_keys!5387 thiss!1248) #b00000000000000000000000000000000 Nil!2192))))

(assert (= (and d!51781 res!81307) b!171017))

(assert (= (and b!171017 res!81308) b!171018))

(assert (= (and b!171018 res!81309) b!171019))

(declare-fun m!199371 () Bool)

(assert (=> d!51781 m!199371))

(declare-fun m!199373 () Bool)

(assert (=> b!171017 m!199373))

(declare-fun m!199375 () Bool)

(assert (=> b!171018 m!199375))

(declare-fun m!199377 () Bool)

(assert (=> b!171019 m!199377))

(assert (=> start!17008 d!51781))

(declare-fun d!51783 () Bool)

(declare-fun e!112907 () Bool)

(assert (=> d!51783 e!112907))

(declare-fun res!81312 () Bool)

(assert (=> d!51783 (=> res!81312 e!112907)))

(declare-fun lt!85168 () Bool)

(assert (=> d!51783 (= res!81312 (not lt!85168))))

(declare-fun lt!85166 () Bool)

(assert (=> d!51783 (= lt!85168 lt!85166)))

(declare-fun lt!85167 () Unit!5252)

(declare-fun e!112906 () Unit!5252)

(assert (=> d!51783 (= lt!85167 e!112906)))

(declare-fun c!30523 () Bool)

(assert (=> d!51783 (= c!30523 lt!85166)))

(declare-fun containsKey!188 (List!2193 (_ BitVec 64)) Bool)

(assert (=> d!51783 (= lt!85166 (containsKey!188 (toList!1096 lt!85043) key!828))))

(assert (=> d!51783 (= (contains!1144 lt!85043 key!828) lt!85168)))

(declare-fun b!171026 () Bool)

(declare-fun lt!85169 () Unit!5252)

(assert (=> b!171026 (= e!112906 lt!85169)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!136 (List!2193 (_ BitVec 64)) Unit!5252)

(assert (=> b!171026 (= lt!85169 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85043) key!828))))

(declare-fun isDefined!137 (Option!190) Bool)

(assert (=> b!171026 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85043) key!828))))

(declare-fun b!171027 () Bool)

(declare-fun Unit!5256 () Unit!5252)

(assert (=> b!171027 (= e!112906 Unit!5256)))

(declare-fun b!171028 () Bool)

(assert (=> b!171028 (= e!112907 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85043) key!828)))))

(assert (= (and d!51783 c!30523) b!171026))

(assert (= (and d!51783 (not c!30523)) b!171027))

(assert (= (and d!51783 (not res!81312)) b!171028))

(declare-fun m!199379 () Bool)

(assert (=> d!51783 m!199379))

(declare-fun m!199381 () Bool)

(assert (=> b!171026 m!199381))

(declare-fun m!199383 () Bool)

(assert (=> b!171026 m!199383))

(assert (=> b!171026 m!199383))

(declare-fun m!199385 () Bool)

(assert (=> b!171026 m!199385))

(assert (=> b!171028 m!199383))

(assert (=> b!171028 m!199383))

(assert (=> b!171028 m!199385))

(assert (=> b!170885 d!51783))

(declare-fun d!51785 () Bool)

(assert (=> d!51785 (= (map!1853 lt!85045) (getCurrentListMap!750 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) #b00000000000000000000000000000000 (defaultEntry!3555 lt!85045)))))

(declare-fun bs!7048 () Bool)

(assert (= bs!7048 d!51785))

(declare-fun m!199387 () Bool)

(assert (=> bs!7048 m!199387))

(assert (=> b!170885 d!51785))

(declare-fun d!51787 () Bool)

(declare-fun e!112908 () Bool)

(assert (=> d!51787 e!112908))

(declare-fun res!81313 () Bool)

(assert (=> d!51787 (=> (not res!81313) (not e!112908))))

(declare-fun lt!85171 () ListLongMap!2161)

(assert (=> d!51787 (= res!81313 (contains!1144 lt!85171 (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun lt!85172 () List!2193)

(assert (=> d!51787 (= lt!85171 (ListLongMap!2162 lt!85172))))

(declare-fun lt!85173 () Unit!5252)

(declare-fun lt!85170 () Unit!5252)

(assert (=> d!51787 (= lt!85173 lt!85170)))

(assert (=> d!51787 (= (getValueByKey!184 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309))) (Some!189 (_2!1628 (tuple2!3235 key!828 v!309))))))

(assert (=> d!51787 (= lt!85170 (lemmaContainsTupThenGetReturnValue!97 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))))))

(assert (=> d!51787 (= lt!85172 (insertStrictlySorted!100 (toList!1096 (map!1853 thiss!1248)) (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))))))

(assert (=> d!51787 (= (+!244 (map!1853 thiss!1248) (tuple2!3235 key!828 v!309)) lt!85171)))

(declare-fun b!171029 () Bool)

(declare-fun res!81314 () Bool)

(assert (=> b!171029 (=> (not res!81314) (not e!112908))))

(assert (=> b!171029 (= res!81314 (= (getValueByKey!184 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))) (Some!189 (_2!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun b!171030 () Bool)

(assert (=> b!171030 (= e!112908 (contains!1146 (toList!1096 lt!85171) (tuple2!3235 key!828 v!309)))))

(assert (= (and d!51787 res!81313) b!171029))

(assert (= (and b!171029 res!81314) b!171030))

(declare-fun m!199389 () Bool)

(assert (=> d!51787 m!199389))

(declare-fun m!199391 () Bool)

(assert (=> d!51787 m!199391))

(declare-fun m!199393 () Bool)

(assert (=> d!51787 m!199393))

(declare-fun m!199395 () Bool)

(assert (=> d!51787 m!199395))

(declare-fun m!199397 () Bool)

(assert (=> b!171029 m!199397))

(declare-fun m!199399 () Bool)

(assert (=> b!171030 m!199399))

(assert (=> b!170889 d!51787))

(declare-fun d!51789 () Bool)

(assert (=> d!51789 (= (map!1853 thiss!1248) (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(declare-fun bs!7049 () Bool)

(assert (= bs!7049 d!51789))

(assert (=> bs!7049 m!199193))

(assert (=> b!170889 d!51789))

(declare-fun condMapEmpty!6806 () Bool)

(declare-fun mapDefault!6806 () ValueCell!1659)

(assert (=> mapNonEmpty!6800 (= condMapEmpty!6806 (= mapRest!6800 ((as const (Array (_ BitVec 32) ValueCell!1659)) mapDefault!6806)))))

(declare-fun e!112914 () Bool)

(declare-fun mapRes!6806 () Bool)

(assert (=> mapNonEmpty!6800 (= tp!15329 (and e!112914 mapRes!6806))))

(declare-fun b!171038 () Bool)

(assert (=> b!171038 (= e!112914 tp_is_empty!4005)))

(declare-fun b!171037 () Bool)

(declare-fun e!112913 () Bool)

(assert (=> b!171037 (= e!112913 tp_is_empty!4005)))

(declare-fun mapNonEmpty!6806 () Bool)

(declare-fun tp!15338 () Bool)

(assert (=> mapNonEmpty!6806 (= mapRes!6806 (and tp!15338 e!112913))))

(declare-fun mapRest!6806 () (Array (_ BitVec 32) ValueCell!1659))

(declare-fun mapKey!6806 () (_ BitVec 32))

(declare-fun mapValue!6806 () ValueCell!1659)

(assert (=> mapNonEmpty!6806 (= mapRest!6800 (store mapRest!6806 mapKey!6806 mapValue!6806))))

(declare-fun mapIsEmpty!6806 () Bool)

(assert (=> mapIsEmpty!6806 mapRes!6806))

(assert (= (and mapNonEmpty!6800 condMapEmpty!6806) mapIsEmpty!6806))

(assert (= (and mapNonEmpty!6800 (not condMapEmpty!6806)) mapNonEmpty!6806))

(assert (= (and mapNonEmpty!6806 ((_ is ValueCellFull!1659) mapValue!6806)) b!171037))

(assert (= (and mapNonEmpty!6800 ((_ is ValueCellFull!1659) mapDefault!6806)) b!171038))

(declare-fun m!199401 () Bool)

(assert (=> mapNonEmpty!6806 m!199401))

(declare-fun b_lambda!6891 () Bool)

(assert (= b_lambda!6887 (or (and b!170884 b_free!4233) b_lambda!6891)))

(declare-fun b_lambda!6893 () Bool)

(assert (= b_lambda!6889 (or (and b!170884 b_free!4233) b_lambda!6893)))

(check-sat (not b_next!4233) (not b!170977) (not b!170988) (not b!171009) (not b!170989) (not b!171019) (not bm!17413) (not b!171016) (not d!51775) (not b!170973) (not bm!17403) (not d!51773) (not d!51779) (not b!170959) (not b_lambda!6893) (not b!170987) (not b!170961) (not b!171030) (not d!51785) (not b!170969) (not d!51789) (not b!171026) (not b!171017) (not d!51771) (not b!170964) (not b!171005) (not b!171001) (not bm!17407) (not b!171029) (not b!171006) (not d!51781) (not d!51787) (not bm!17410) (not b!171018) (not b!170996) b_and!10653 (not b!171008) (not bm!17412) (not b_lambda!6891) (not d!51777) (not mapNonEmpty!6806) (not b!170991) (not b!171015) (not b!170993) (not bm!17406) (not bm!17414) (not b!171028) (not b!170974) tp_is_empty!4005 (not b!170976) (not bm!17405) (not d!51783))
(check-sat b_and!10653 (not b_next!4233))
(get-model)

(declare-fun d!51791 () Bool)

(declare-fun e!112915 () Bool)

(assert (=> d!51791 e!112915))

(declare-fun res!81315 () Bool)

(assert (=> d!51791 (=> (not res!81315) (not e!112915))))

(declare-fun lt!85175 () ListLongMap!2161)

(assert (=> d!51791 (= res!81315 (contains!1144 lt!85175 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85176 () List!2193)

(assert (=> d!51791 (= lt!85175 (ListLongMap!2162 lt!85176))))

(declare-fun lt!85177 () Unit!5252)

(declare-fun lt!85174 () Unit!5252)

(assert (=> d!51791 (= lt!85177 lt!85174)))

(assert (=> d!51791 (= (getValueByKey!184 lt!85176 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> d!51791 (= lt!85174 (lemmaContainsTupThenGetReturnValue!97 lt!85176 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> d!51791 (= lt!85176 (insertStrictlySorted!100 (toList!1096 call!17413) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> d!51791 (= (+!244 call!17413 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) lt!85175)))

(declare-fun b!171039 () Bool)

(declare-fun res!81316 () Bool)

(assert (=> b!171039 (=> (not res!81316) (not e!112915))))

(assert (=> b!171039 (= res!81316 (= (getValueByKey!184 (toList!1096 lt!85175) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171040 () Bool)

(assert (=> b!171040 (= e!112915 (contains!1146 (toList!1096 lt!85175) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(assert (= (and d!51791 res!81315) b!171039))

(assert (= (and b!171039 res!81316) b!171040))

(declare-fun m!199403 () Bool)

(assert (=> d!51791 m!199403))

(declare-fun m!199405 () Bool)

(assert (=> d!51791 m!199405))

(declare-fun m!199407 () Bool)

(assert (=> d!51791 m!199407))

(declare-fun m!199409 () Bool)

(assert (=> d!51791 m!199409))

(declare-fun m!199411 () Bool)

(assert (=> b!171039 m!199411))

(declare-fun m!199413 () Bool)

(assert (=> b!171040 m!199413))

(assert (=> b!170996 d!51791))

(assert (=> d!51789 d!51777))

(declare-fun d!51793 () Bool)

(assert (=> d!51793 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85043) key!828))))

(declare-fun lt!85180 () Unit!5252)

(declare-fun choose!923 (List!2193 (_ BitVec 64)) Unit!5252)

(assert (=> d!51793 (= lt!85180 (choose!923 (toList!1096 lt!85043) key!828))))

(declare-fun e!112918 () Bool)

(assert (=> d!51793 e!112918))

(declare-fun res!81319 () Bool)

(assert (=> d!51793 (=> (not res!81319) (not e!112918))))

(declare-fun isStrictlySorted!331 (List!2193) Bool)

(assert (=> d!51793 (= res!81319 (isStrictlySorted!331 (toList!1096 lt!85043)))))

(assert (=> d!51793 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85043) key!828) lt!85180)))

(declare-fun b!171043 () Bool)

(assert (=> b!171043 (= e!112918 (containsKey!188 (toList!1096 lt!85043) key!828))))

(assert (= (and d!51793 res!81319) b!171043))

(assert (=> d!51793 m!199383))

(assert (=> d!51793 m!199383))

(assert (=> d!51793 m!199385))

(declare-fun m!199415 () Bool)

(assert (=> d!51793 m!199415))

(declare-fun m!199417 () Bool)

(assert (=> d!51793 m!199417))

(assert (=> b!171043 m!199379))

(assert (=> b!171026 d!51793))

(declare-fun d!51795 () Bool)

(declare-fun isEmpty!433 (Option!190) Bool)

(assert (=> d!51795 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85043) key!828)) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85043) key!828))))))

(declare-fun bs!7050 () Bool)

(assert (= bs!7050 d!51795))

(assert (=> bs!7050 m!199383))

(declare-fun m!199419 () Bool)

(assert (=> bs!7050 m!199419))

(assert (=> b!171026 d!51795))

(declare-fun b!171053 () Bool)

(declare-fun e!112923 () Option!190)

(declare-fun e!112924 () Option!190)

(assert (=> b!171053 (= e!112923 e!112924)))

(declare-fun c!30529 () Bool)

(assert (=> b!171053 (= c!30529 (and ((_ is Cons!2189) (toList!1096 lt!85043)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85043))) key!828))))))

(declare-fun b!171054 () Bool)

(assert (=> b!171054 (= e!112924 (getValueByKey!184 (t!6995 (toList!1096 lt!85043)) key!828))))

(declare-fun d!51797 () Bool)

(declare-fun c!30528 () Bool)

(assert (=> d!51797 (= c!30528 (and ((_ is Cons!2189) (toList!1096 lt!85043)) (= (_1!1628 (h!2806 (toList!1096 lt!85043))) key!828)))))

(assert (=> d!51797 (= (getValueByKey!184 (toList!1096 lt!85043) key!828) e!112923)))

(declare-fun b!171055 () Bool)

(assert (=> b!171055 (= e!112924 None!188)))

(declare-fun b!171052 () Bool)

(assert (=> b!171052 (= e!112923 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85043)))))))

(assert (= (and d!51797 c!30528) b!171052))

(assert (= (and d!51797 (not c!30528)) b!171053))

(assert (= (and b!171053 c!30529) b!171054))

(assert (= (and b!171053 (not c!30529)) b!171055))

(declare-fun m!199421 () Bool)

(assert (=> b!171054 m!199421))

(assert (=> b!171026 d!51797))

(declare-fun d!51799 () Bool)

(declare-fun e!112926 () Bool)

(assert (=> d!51799 e!112926))

(declare-fun res!81320 () Bool)

(assert (=> d!51799 (=> res!81320 e!112926)))

(declare-fun lt!85183 () Bool)

(assert (=> d!51799 (= res!81320 (not lt!85183))))

(declare-fun lt!85181 () Bool)

(assert (=> d!51799 (= lt!85183 lt!85181)))

(declare-fun lt!85182 () Unit!5252)

(declare-fun e!112925 () Unit!5252)

(assert (=> d!51799 (= lt!85182 e!112925)))

(declare-fun c!30530 () Bool)

(assert (=> d!51799 (= c!30530 lt!85181)))

(assert (=> d!51799 (= lt!85181 (containsKey!188 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51799 (= (contains!1144 lt!85105 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85183)))

(declare-fun b!171056 () Bool)

(declare-fun lt!85184 () Unit!5252)

(assert (=> b!171056 (= e!112925 lt!85184)))

(assert (=> b!171056 (= lt!85184 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171056 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171057 () Bool)

(declare-fun Unit!5257 () Unit!5252)

(assert (=> b!171057 (= e!112925 Unit!5257)))

(declare-fun b!171058 () Bool)

(assert (=> b!171058 (= e!112926 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51799 c!30530) b!171056))

(assert (= (and d!51799 (not c!30530)) b!171057))

(assert (= (and d!51799 (not res!81320)) b!171058))

(declare-fun m!199423 () Bool)

(assert (=> d!51799 m!199423))

(declare-fun m!199425 () Bool)

(assert (=> b!171056 m!199425))

(declare-fun m!199427 () Bool)

(assert (=> b!171056 m!199427))

(assert (=> b!171056 m!199427))

(declare-fun m!199429 () Bool)

(assert (=> b!171056 m!199429))

(assert (=> b!171058 m!199427))

(assert (=> b!171058 m!199427))

(assert (=> b!171058 m!199429))

(assert (=> bm!17403 d!51799))

(declare-fun d!51801 () Bool)

(assert (=> d!51801 (= (validMask!0 (mask!8383 thiss!1248)) (and (or (= (mask!8383 thiss!1248) #b00000000000000000000000000000111) (= (mask!8383 thiss!1248) #b00000000000000000000000000001111) (= (mask!8383 thiss!1248) #b00000000000000000000000000011111) (= (mask!8383 thiss!1248) #b00000000000000000000000000111111) (= (mask!8383 thiss!1248) #b00000000000000000000000001111111) (= (mask!8383 thiss!1248) #b00000000000000000000000011111111) (= (mask!8383 thiss!1248) #b00000000000000000000000111111111) (= (mask!8383 thiss!1248) #b00000000000000000000001111111111) (= (mask!8383 thiss!1248) #b00000000000000000000011111111111) (= (mask!8383 thiss!1248) #b00000000000000000000111111111111) (= (mask!8383 thiss!1248) #b00000000000000000001111111111111) (= (mask!8383 thiss!1248) #b00000000000000000011111111111111) (= (mask!8383 thiss!1248) #b00000000000000000111111111111111) (= (mask!8383 thiss!1248) #b00000000000000001111111111111111) (= (mask!8383 thiss!1248) #b00000000000000011111111111111111) (= (mask!8383 thiss!1248) #b00000000000000111111111111111111) (= (mask!8383 thiss!1248) #b00000000000001111111111111111111) (= (mask!8383 thiss!1248) #b00000000000011111111111111111111) (= (mask!8383 thiss!1248) #b00000000000111111111111111111111) (= (mask!8383 thiss!1248) #b00000000001111111111111111111111) (= (mask!8383 thiss!1248) #b00000000011111111111111111111111) (= (mask!8383 thiss!1248) #b00000000111111111111111111111111) (= (mask!8383 thiss!1248) #b00000001111111111111111111111111) (= (mask!8383 thiss!1248) #b00000011111111111111111111111111) (= (mask!8383 thiss!1248) #b00000111111111111111111111111111) (= (mask!8383 thiss!1248) #b00001111111111111111111111111111) (= (mask!8383 thiss!1248) #b00011111111111111111111111111111) (= (mask!8383 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8383 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!51777 d!51801))

(declare-fun d!51803 () Bool)

(declare-fun e!112928 () Bool)

(assert (=> d!51803 e!112928))

(declare-fun res!81321 () Bool)

(assert (=> d!51803 (=> res!81321 e!112928)))

(declare-fun lt!85187 () Bool)

(assert (=> d!51803 (= res!81321 (not lt!85187))))

(declare-fun lt!85185 () Bool)

(assert (=> d!51803 (= lt!85187 lt!85185)))

(declare-fun lt!85186 () Unit!5252)

(declare-fun e!112927 () Unit!5252)

(assert (=> d!51803 (= lt!85186 e!112927)))

(declare-fun c!30531 () Bool)

(assert (=> d!51803 (= c!30531 lt!85185)))

(assert (=> d!51803 (= lt!85185 (containsKey!188 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))))))

(assert (=> d!51803 (= (contains!1144 lt!85171 (_1!1628 (tuple2!3235 key!828 v!309))) lt!85187)))

(declare-fun b!171059 () Bool)

(declare-fun lt!85188 () Unit!5252)

(assert (=> b!171059 (= e!112927 lt!85188)))

(assert (=> b!171059 (= lt!85188 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))))))

(assert (=> b!171059 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun b!171060 () Bool)

(declare-fun Unit!5258 () Unit!5252)

(assert (=> b!171060 (= e!112927 Unit!5258)))

(declare-fun b!171061 () Bool)

(assert (=> b!171061 (= e!112928 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (= (and d!51803 c!30531) b!171059))

(assert (= (and d!51803 (not c!30531)) b!171060))

(assert (= (and d!51803 (not res!81321)) b!171061))

(declare-fun m!199431 () Bool)

(assert (=> d!51803 m!199431))

(declare-fun m!199433 () Bool)

(assert (=> b!171059 m!199433))

(assert (=> b!171059 m!199397))

(assert (=> b!171059 m!199397))

(declare-fun m!199435 () Bool)

(assert (=> b!171059 m!199435))

(assert (=> b!171061 m!199397))

(assert (=> b!171061 m!199397))

(assert (=> b!171061 m!199435))

(assert (=> d!51787 d!51803))

(declare-fun b!171063 () Bool)

(declare-fun e!112929 () Option!190)

(declare-fun e!112930 () Option!190)

(assert (=> b!171063 (= e!112929 e!112930)))

(declare-fun c!30533 () Bool)

(assert (=> b!171063 (= c!30533 (and ((_ is Cons!2189) lt!85172) (not (= (_1!1628 (h!2806 lt!85172)) (_1!1628 (tuple2!3235 key!828 v!309))))))))

(declare-fun b!171064 () Bool)

(assert (=> b!171064 (= e!112930 (getValueByKey!184 (t!6995 lt!85172) (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun c!30532 () Bool)

(declare-fun d!51805 () Bool)

(assert (=> d!51805 (= c!30532 (and ((_ is Cons!2189) lt!85172) (= (_1!1628 (h!2806 lt!85172)) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!51805 (= (getValueByKey!184 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309))) e!112929)))

(declare-fun b!171065 () Bool)

(assert (=> b!171065 (= e!112930 None!188)))

(declare-fun b!171062 () Bool)

(assert (=> b!171062 (= e!112929 (Some!189 (_2!1628 (h!2806 lt!85172))))))

(assert (= (and d!51805 c!30532) b!171062))

(assert (= (and d!51805 (not c!30532)) b!171063))

(assert (= (and b!171063 c!30533) b!171064))

(assert (= (and b!171063 (not c!30533)) b!171065))

(declare-fun m!199437 () Bool)

(assert (=> b!171064 m!199437))

(assert (=> d!51787 d!51805))

(declare-fun d!51807 () Bool)

(assert (=> d!51807 (= (getValueByKey!184 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309))) (Some!189 (_2!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun lt!85191 () Unit!5252)

(declare-fun choose!924 (List!2193 (_ BitVec 64) V!4987) Unit!5252)

(assert (=> d!51807 (= lt!85191 (choose!924 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun e!112933 () Bool)

(assert (=> d!51807 e!112933))

(declare-fun res!81326 () Bool)

(assert (=> d!51807 (=> (not res!81326) (not e!112933))))

(assert (=> d!51807 (= res!81326 (isStrictlySorted!331 lt!85172))))

(assert (=> d!51807 (= (lemmaContainsTupThenGetReturnValue!97 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))) lt!85191)))

(declare-fun b!171070 () Bool)

(declare-fun res!81327 () Bool)

(assert (=> b!171070 (=> (not res!81327) (not e!112933))))

(assert (=> b!171070 (= res!81327 (containsKey!188 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun b!171071 () Bool)

(assert (=> b!171071 (= e!112933 (contains!1146 lt!85172 (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(assert (= (and d!51807 res!81326) b!171070))

(assert (= (and b!171070 res!81327) b!171071))

(assert (=> d!51807 m!199391))

(declare-fun m!199439 () Bool)

(assert (=> d!51807 m!199439))

(declare-fun m!199441 () Bool)

(assert (=> d!51807 m!199441))

(declare-fun m!199443 () Bool)

(assert (=> b!171070 m!199443))

(declare-fun m!199445 () Bool)

(assert (=> b!171071 m!199445))

(assert (=> d!51787 d!51807))

(declare-fun b!171092 () Bool)

(declare-fun e!112944 () List!2193)

(declare-fun call!17425 () List!2193)

(assert (=> b!171092 (= e!112944 call!17425)))

(declare-fun b!171093 () Bool)

(declare-fun res!81333 () Bool)

(declare-fun e!112948 () Bool)

(assert (=> b!171093 (=> (not res!81333) (not e!112948))))

(declare-fun lt!85194 () List!2193)

(assert (=> b!171093 (= res!81333 (containsKey!188 lt!85194 (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun b!171094 () Bool)

(declare-fun e!112947 () List!2193)

(declare-fun e!112945 () List!2193)

(assert (=> b!171094 (= e!112947 e!112945)))

(declare-fun c!30543 () Bool)

(assert (=> b!171094 (= c!30543 (and ((_ is Cons!2189) (toList!1096 (map!1853 thiss!1248))) (= (_1!1628 (h!2806 (toList!1096 (map!1853 thiss!1248)))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun c!30544 () Bool)

(declare-fun b!171095 () Bool)

(declare-fun e!112946 () List!2193)

(assert (=> b!171095 (= e!112946 (ite c!30543 (t!6995 (toList!1096 (map!1853 thiss!1248))) (ite c!30544 (Cons!2189 (h!2806 (toList!1096 (map!1853 thiss!1248))) (t!6995 (toList!1096 (map!1853 thiss!1248)))) Nil!2190)))))

(declare-fun b!171096 () Bool)

(assert (=> b!171096 (= e!112948 (contains!1146 lt!85194 (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun b!171097 () Bool)

(declare-fun call!17424 () List!2193)

(assert (=> b!171097 (= e!112947 call!17424)))

(declare-fun c!30545 () Bool)

(declare-fun bm!17421 () Bool)

(declare-fun $colon$colon!97 (List!2193 tuple2!3234) List!2193)

(assert (=> bm!17421 (= call!17424 ($colon$colon!97 e!112946 (ite c!30545 (h!2806 (toList!1096 (map!1853 thiss!1248))) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))))))))

(declare-fun c!30542 () Bool)

(assert (=> bm!17421 (= c!30542 c!30545)))

(declare-fun bm!17423 () Bool)

(declare-fun call!17426 () List!2193)

(assert (=> bm!17423 (= call!17425 call!17426)))

(declare-fun b!171098 () Bool)

(assert (=> b!171098 (= e!112945 call!17426)))

(declare-fun b!171099 () Bool)

(assert (=> b!171099 (= e!112944 call!17425)))

(declare-fun b!171100 () Bool)

(assert (=> b!171100 (= c!30544 (and ((_ is Cons!2189) (toList!1096 (map!1853 thiss!1248))) (bvsgt (_1!1628 (h!2806 (toList!1096 (map!1853 thiss!1248)))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> b!171100 (= e!112945 e!112944)))

(declare-fun b!171101 () Bool)

(assert (=> b!171101 (= e!112946 (insertStrictlySorted!100 (t!6995 (toList!1096 (map!1853 thiss!1248))) (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun bm!17422 () Bool)

(assert (=> bm!17422 (= call!17426 call!17424)))

(declare-fun d!51809 () Bool)

(assert (=> d!51809 e!112948))

(declare-fun res!81332 () Bool)

(assert (=> d!51809 (=> (not res!81332) (not e!112948))))

(assert (=> d!51809 (= res!81332 (isStrictlySorted!331 lt!85194))))

(assert (=> d!51809 (= lt!85194 e!112947)))

(assert (=> d!51809 (= c!30545 (and ((_ is Cons!2189) (toList!1096 (map!1853 thiss!1248))) (bvslt (_1!1628 (h!2806 (toList!1096 (map!1853 thiss!1248)))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!51809 (isStrictlySorted!331 (toList!1096 (map!1853 thiss!1248)))))

(assert (=> d!51809 (= (insertStrictlySorted!100 (toList!1096 (map!1853 thiss!1248)) (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))) lt!85194)))

(assert (= (and d!51809 c!30545) b!171097))

(assert (= (and d!51809 (not c!30545)) b!171094))

(assert (= (and b!171094 c!30543) b!171098))

(assert (= (and b!171094 (not c!30543)) b!171100))

(assert (= (and b!171100 c!30544) b!171099))

(assert (= (and b!171100 (not c!30544)) b!171092))

(assert (= (or b!171099 b!171092) bm!17423))

(assert (= (or b!171098 bm!17423) bm!17422))

(assert (= (or b!171097 bm!17422) bm!17421))

(assert (= (and bm!17421 c!30542) b!171101))

(assert (= (and bm!17421 (not c!30542)) b!171095))

(assert (= (and d!51809 res!81332) b!171093))

(assert (= (and b!171093 res!81333) b!171096))

(declare-fun m!199447 () Bool)

(assert (=> b!171093 m!199447))

(declare-fun m!199449 () Bool)

(assert (=> d!51809 m!199449))

(declare-fun m!199451 () Bool)

(assert (=> d!51809 m!199451))

(declare-fun m!199453 () Bool)

(assert (=> b!171101 m!199453))

(declare-fun m!199455 () Bool)

(assert (=> b!171096 m!199455))

(declare-fun m!199457 () Bool)

(assert (=> bm!17421 m!199457))

(assert (=> d!51787 d!51809))

(declare-fun d!51811 () Bool)

(declare-fun e!112950 () Bool)

(assert (=> d!51811 e!112950))

(declare-fun res!81334 () Bool)

(assert (=> d!51811 (=> res!81334 e!112950)))

(declare-fun lt!85197 () Bool)

(assert (=> d!51811 (= res!81334 (not lt!85197))))

(declare-fun lt!85195 () Bool)

(assert (=> d!51811 (= lt!85197 lt!85195)))

(declare-fun lt!85196 () Unit!5252)

(declare-fun e!112949 () Unit!5252)

(assert (=> d!51811 (= lt!85196 e!112949)))

(declare-fun c!30546 () Bool)

(assert (=> d!51811 (= c!30546 lt!85195)))

(assert (=> d!51811 (= lt!85195 (containsKey!188 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51811 (= (contains!1144 lt!85130 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85197)))

(declare-fun b!171102 () Bool)

(declare-fun lt!85198 () Unit!5252)

(assert (=> b!171102 (= e!112949 lt!85198)))

(assert (=> b!171102 (= lt!85198 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171102 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171103 () Bool)

(declare-fun Unit!5259 () Unit!5252)

(assert (=> b!171103 (= e!112949 Unit!5259)))

(declare-fun b!171104 () Bool)

(assert (=> b!171104 (= e!112950 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51811 c!30546) b!171102))

(assert (= (and d!51811 (not c!30546)) b!171103))

(assert (= (and d!51811 (not res!81334)) b!171104))

(declare-fun m!199459 () Bool)

(assert (=> d!51811 m!199459))

(declare-fun m!199461 () Bool)

(assert (=> b!171102 m!199461))

(declare-fun m!199463 () Bool)

(assert (=> b!171102 m!199463))

(assert (=> b!171102 m!199463))

(declare-fun m!199465 () Bool)

(assert (=> b!171102 m!199465))

(assert (=> b!171104 m!199463))

(assert (=> b!171104 m!199463))

(assert (=> b!171104 m!199465))

(assert (=> bm!17410 d!51811))

(assert (=> b!171028 d!51795))

(assert (=> b!171028 d!51797))

(assert (=> d!51775 d!51771))

(declare-fun d!51813 () Bool)

(assert (=> d!51813 (= (+!244 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))

(assert (=> d!51813 true))

(declare-fun _$7!128 () Unit!5252)

(assert (=> d!51813 (= (choose!922 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) (zeroValue!3398 thiss!1248) v!309 (minValue!3398 thiss!1248) (defaultEntry!3555 thiss!1248)) _$7!128)))

(declare-fun bs!7051 () Bool)

(assert (= bs!7051 d!51813))

(assert (=> bs!7051 m!199193))

(assert (=> bs!7051 m!199193))

(assert (=> bs!7051 m!199199))

(assert (=> bs!7051 m!199195))

(assert (=> d!51775 d!51813))

(assert (=> d!51775 d!51801))

(assert (=> d!51775 d!51777))

(assert (=> d!51775 d!51779))

(declare-fun d!51815 () Bool)

(declare-fun e!112952 () Bool)

(assert (=> d!51815 e!112952))

(declare-fun res!81335 () Bool)

(assert (=> d!51815 (=> res!81335 e!112952)))

(declare-fun lt!85201 () Bool)

(assert (=> d!51815 (= res!81335 (not lt!85201))))

(declare-fun lt!85199 () Bool)

(assert (=> d!51815 (= lt!85201 lt!85199)))

(declare-fun lt!85200 () Unit!5252)

(declare-fun e!112951 () Unit!5252)

(assert (=> d!51815 (= lt!85200 e!112951)))

(declare-fun c!30547 () Bool)

(assert (=> d!51815 (= c!30547 lt!85199)))

(assert (=> d!51815 (= lt!85199 (containsKey!188 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51815 (= (contains!1144 lt!85105 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) lt!85201)))

(declare-fun b!171105 () Bool)

(declare-fun lt!85202 () Unit!5252)

(assert (=> b!171105 (= e!112951 lt!85202)))

(assert (=> b!171105 (= lt!85202 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171105 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171106 () Bool)

(declare-fun Unit!5260 () Unit!5252)

(assert (=> b!171106 (= e!112951 Unit!5260)))

(declare-fun b!171107 () Bool)

(assert (=> b!171107 (= e!112952 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!51815 c!30547) b!171105))

(assert (= (and d!51815 (not c!30547)) b!171106))

(assert (= (and d!51815 (not res!81335)) b!171107))

(assert (=> d!51815 m!199241))

(declare-fun m!199467 () Bool)

(assert (=> d!51815 m!199467))

(assert (=> b!171105 m!199241))

(declare-fun m!199469 () Bool)

(assert (=> b!171105 m!199469))

(assert (=> b!171105 m!199241))

(declare-fun m!199471 () Bool)

(assert (=> b!171105 m!199471))

(assert (=> b!171105 m!199471))

(declare-fun m!199473 () Bool)

(assert (=> b!171105 m!199473))

(assert (=> b!171107 m!199241))

(assert (=> b!171107 m!199471))

(assert (=> b!171107 m!199471))

(assert (=> b!171107 m!199473))

(assert (=> b!170969 d!51815))

(declare-fun b!171132 () Bool)

(declare-fun e!112971 () Bool)

(declare-fun e!112968 () Bool)

(assert (=> b!171132 (= e!112971 e!112968)))

(declare-fun c!30557 () Bool)

(assert (=> b!171132 (= c!30557 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun b!171134 () Bool)

(declare-fun e!112967 () Bool)

(assert (=> b!171134 (= e!112967 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171134 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!171135 () Bool)

(declare-fun res!81347 () Bool)

(declare-fun e!112970 () Bool)

(assert (=> b!171135 (=> (not res!81347) (not e!112970))))

(declare-fun lt!85221 () ListLongMap!2161)

(assert (=> b!171135 (= res!81347 (not (contains!1144 lt!85221 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171136 () Bool)

(declare-fun e!112973 () ListLongMap!2161)

(assert (=> b!171136 (= e!112973 (ListLongMap!2162 Nil!2190))))

(declare-fun b!171137 () Bool)

(declare-fun e!112969 () Bool)

(assert (=> b!171137 (= e!112971 e!112969)))

(assert (=> b!171137 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun res!81346 () Bool)

(assert (=> b!171137 (= res!81346 (contains!1144 lt!85221 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171137 (=> (not res!81346) (not e!112969))))

(declare-fun b!171138 () Bool)

(assert (=> b!171138 (= e!112970 e!112971)))

(declare-fun c!30559 () Bool)

(assert (=> b!171138 (= c!30559 e!112967)))

(declare-fun res!81345 () Bool)

(assert (=> b!171138 (=> (not res!81345) (not e!112967))))

(assert (=> b!171138 (= res!81345 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun bm!17426 () Bool)

(declare-fun call!17429 () ListLongMap!2161)

(assert (=> bm!17426 (= call!17429 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248)))))

(declare-fun d!51817 () Bool)

(assert (=> d!51817 e!112970))

(declare-fun res!81344 () Bool)

(assert (=> d!51817 (=> (not res!81344) (not e!112970))))

(assert (=> d!51817 (= res!81344 (not (contains!1144 lt!85221 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51817 (= lt!85221 e!112973)))

(declare-fun c!30556 () Bool)

(assert (=> d!51817 (= c!30556 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!51817 (validMask!0 (mask!8383 thiss!1248))))

(assert (=> d!51817 (= (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)) lt!85221)))

(declare-fun b!171133 () Bool)

(declare-fun e!112972 () ListLongMap!2161)

(assert (=> b!171133 (= e!112973 e!112972)))

(declare-fun c!30558 () Bool)

(assert (=> b!171133 (= c!30558 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171139 () Bool)

(assert (=> b!171139 (= e!112968 (= lt!85221 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248))))))

(declare-fun b!171140 () Bool)

(declare-fun isEmpty!434 (ListLongMap!2161) Bool)

(assert (=> b!171140 (= e!112968 (isEmpty!434 lt!85221))))

(declare-fun b!171141 () Bool)

(assert (=> b!171141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> b!171141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3683 (_values!3538 thiss!1248))))))

(assert (=> b!171141 (= e!112969 (= (apply!129 lt!85221 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171142 () Bool)

(assert (=> b!171142 (= e!112972 call!17429)))

(declare-fun b!171143 () Bool)

(declare-fun lt!85220 () Unit!5252)

(declare-fun lt!85217 () Unit!5252)

(assert (=> b!171143 (= lt!85220 lt!85217)))

(declare-fun lt!85219 () (_ BitVec 64))

(declare-fun lt!85222 () (_ BitVec 64))

(declare-fun lt!85218 () ListLongMap!2161)

(declare-fun lt!85223 () V!4987)

(assert (=> b!171143 (not (contains!1144 (+!244 lt!85218 (tuple2!3235 lt!85219 lt!85223)) lt!85222))))

(declare-fun addStillNotContains!71 (ListLongMap!2161 (_ BitVec 64) V!4987 (_ BitVec 64)) Unit!5252)

(assert (=> b!171143 (= lt!85217 (addStillNotContains!71 lt!85218 lt!85219 lt!85223 lt!85222))))

(assert (=> b!171143 (= lt!85222 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171143 (= lt!85223 (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171143 (= lt!85219 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!171143 (= lt!85218 call!17429)))

(assert (=> b!171143 (= e!112972 (+!244 call!17429 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!51817 c!30556) b!171136))

(assert (= (and d!51817 (not c!30556)) b!171133))

(assert (= (and b!171133 c!30558) b!171143))

(assert (= (and b!171133 (not c!30558)) b!171142))

(assert (= (or b!171143 b!171142) bm!17426))

(assert (= (and d!51817 res!81344) b!171135))

(assert (= (and b!171135 res!81347) b!171138))

(assert (= (and b!171138 res!81345) b!171134))

(assert (= (and b!171138 c!30559) b!171137))

(assert (= (and b!171138 (not c!30559)) b!171132))

(assert (= (and b!171137 res!81346) b!171141))

(assert (= (and b!171132 c!30557) b!171139))

(assert (= (and b!171132 (not c!30557)) b!171140))

(declare-fun b_lambda!6895 () Bool)

(assert (=> (not b_lambda!6895) (not b!171141)))

(assert (=> b!171141 t!6998))

(declare-fun b_and!10655 () Bool)

(assert (= b_and!10653 (and (=> t!6998 result!4561) b_and!10655)))

(declare-fun b_lambda!6897 () Bool)

(assert (=> (not b_lambda!6897) (not b!171143)))

(assert (=> b!171143 t!6998))

(declare-fun b_and!10657 () Bool)

(assert (= b_and!10655 (and (=> t!6998 result!4561) b_and!10657)))

(assert (=> b!171133 m!199241))

(assert (=> b!171133 m!199241))

(assert (=> b!171133 m!199247))

(declare-fun m!199475 () Bool)

(assert (=> b!171139 m!199475))

(assert (=> b!171134 m!199241))

(assert (=> b!171134 m!199241))

(assert (=> b!171134 m!199247))

(assert (=> bm!17426 m!199475))

(declare-fun m!199477 () Bool)

(assert (=> d!51817 m!199477))

(assert (=> d!51817 m!199295))

(assert (=> b!171137 m!199241))

(assert (=> b!171137 m!199241))

(declare-fun m!199479 () Bool)

(assert (=> b!171137 m!199479))

(assert (=> b!171143 m!199287))

(assert (=> b!171143 m!199289))

(assert (=> b!171143 m!199293))

(declare-fun m!199481 () Bool)

(assert (=> b!171143 m!199481))

(assert (=> b!171143 m!199287))

(assert (=> b!171143 m!199289))

(declare-fun m!199483 () Bool)

(assert (=> b!171143 m!199483))

(assert (=> b!171143 m!199241))

(declare-fun m!199485 () Bool)

(assert (=> b!171143 m!199485))

(declare-fun m!199487 () Bool)

(assert (=> b!171143 m!199487))

(assert (=> b!171143 m!199485))

(declare-fun m!199489 () Bool)

(assert (=> b!171140 m!199489))

(assert (=> b!171141 m!199287))

(assert (=> b!171141 m!199289))

(assert (=> b!171141 m!199293))

(assert (=> b!171141 m!199241))

(declare-fun m!199491 () Bool)

(assert (=> b!171141 m!199491))

(assert (=> b!171141 m!199287))

(assert (=> b!171141 m!199289))

(assert (=> b!171141 m!199241))

(declare-fun m!199493 () Bool)

(assert (=> b!171135 m!199493))

(assert (=> bm!17405 d!51817))

(declare-fun d!51819 () Bool)

(declare-fun e!112975 () Bool)

(assert (=> d!51819 e!112975))

(declare-fun res!81348 () Bool)

(assert (=> d!51819 (=> res!81348 e!112975)))

(declare-fun lt!85226 () Bool)

(assert (=> d!51819 (= res!81348 (not lt!85226))))

(declare-fun lt!85224 () Bool)

(assert (=> d!51819 (= lt!85226 lt!85224)))

(declare-fun lt!85225 () Unit!5252)

(declare-fun e!112974 () Unit!5252)

(assert (=> d!51819 (= lt!85225 e!112974)))

(declare-fun c!30560 () Bool)

(assert (=> d!51819 (= c!30560 lt!85224)))

(assert (=> d!51819 (= lt!85224 (containsKey!188 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51819 (= (contains!1144 lt!85130 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) lt!85226)))

(declare-fun b!171144 () Bool)

(declare-fun lt!85227 () Unit!5252)

(assert (=> b!171144 (= e!112974 lt!85227)))

(assert (=> b!171144 (= lt!85227 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171144 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171145 () Bool)

(declare-fun Unit!5261 () Unit!5252)

(assert (=> b!171145 (= e!112974 Unit!5261)))

(declare-fun b!171146 () Bool)

(assert (=> b!171146 (= e!112975 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!51819 c!30560) b!171144))

(assert (= (and d!51819 (not c!30560)) b!171145))

(assert (= (and d!51819 (not res!81348)) b!171146))

(assert (=> d!51819 m!199241))

(declare-fun m!199495 () Bool)

(assert (=> d!51819 m!199495))

(assert (=> b!171144 m!199241))

(declare-fun m!199497 () Bool)

(assert (=> b!171144 m!199497))

(assert (=> b!171144 m!199241))

(declare-fun m!199499 () Bool)

(assert (=> b!171144 m!199499))

(assert (=> b!171144 m!199499))

(declare-fun m!199501 () Bool)

(assert (=> b!171144 m!199501))

(assert (=> b!171146 m!199241))

(assert (=> b!171146 m!199499))

(assert (=> b!171146 m!199499))

(assert (=> b!171146 m!199501))

(assert (=> b!171001 d!51819))

(assert (=> d!51771 d!51801))

(declare-fun d!51821 () Bool)

(declare-fun res!81353 () Bool)

(declare-fun e!112980 () Bool)

(assert (=> d!51821 (=> res!81353 e!112980)))

(assert (=> d!51821 (= res!81353 (and ((_ is Cons!2189) (toList!1096 lt!85043)) (= (_1!1628 (h!2806 (toList!1096 lt!85043))) key!828)))))

(assert (=> d!51821 (= (containsKey!188 (toList!1096 lt!85043) key!828) e!112980)))

(declare-fun b!171151 () Bool)

(declare-fun e!112981 () Bool)

(assert (=> b!171151 (= e!112980 e!112981)))

(declare-fun res!81354 () Bool)

(assert (=> b!171151 (=> (not res!81354) (not e!112981))))

(assert (=> b!171151 (= res!81354 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85043))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85043))) key!828)) ((_ is Cons!2189) (toList!1096 lt!85043)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85043))) key!828)))))

(declare-fun b!171152 () Bool)

(assert (=> b!171152 (= e!112981 (containsKey!188 (t!6995 (toList!1096 lt!85043)) key!828))))

(assert (= (and d!51821 (not res!81353)) b!171151))

(assert (= (and b!171151 res!81354) b!171152))

(declare-fun m!199503 () Bool)

(assert (=> b!171152 m!199503))

(assert (=> d!51783 d!51821))

(declare-fun lt!85230 () Bool)

(declare-fun d!51823 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!147 (List!2193) (InoxSet tuple2!3234))

(assert (=> d!51823 (= lt!85230 (select (content!147 (toList!1096 lt!85171)) (tuple2!3235 key!828 v!309)))))

(declare-fun e!112987 () Bool)

(assert (=> d!51823 (= lt!85230 e!112987)))

(declare-fun res!81359 () Bool)

(assert (=> d!51823 (=> (not res!81359) (not e!112987))))

(assert (=> d!51823 (= res!81359 ((_ is Cons!2189) (toList!1096 lt!85171)))))

(assert (=> d!51823 (= (contains!1146 (toList!1096 lt!85171) (tuple2!3235 key!828 v!309)) lt!85230)))

(declare-fun b!171157 () Bool)

(declare-fun e!112986 () Bool)

(assert (=> b!171157 (= e!112987 e!112986)))

(declare-fun res!81360 () Bool)

(assert (=> b!171157 (=> res!81360 e!112986)))

(assert (=> b!171157 (= res!81360 (= (h!2806 (toList!1096 lt!85171)) (tuple2!3235 key!828 v!309)))))

(declare-fun b!171158 () Bool)

(assert (=> b!171158 (= e!112986 (contains!1146 (t!6995 (toList!1096 lt!85171)) (tuple2!3235 key!828 v!309)))))

(assert (= (and d!51823 res!81359) b!171157))

(assert (= (and b!171157 (not res!81360)) b!171158))

(declare-fun m!199505 () Bool)

(assert (=> d!51823 m!199505))

(declare-fun m!199507 () Bool)

(assert (=> d!51823 m!199507))

(declare-fun m!199509 () Bool)

(assert (=> b!171158 m!199509))

(assert (=> b!171030 d!51823))

(declare-fun d!51825 () Bool)

(declare-fun e!112988 () Bool)

(assert (=> d!51825 e!112988))

(declare-fun res!81361 () Bool)

(assert (=> d!51825 (=> (not res!81361) (not e!112988))))

(declare-fun lt!85232 () ListLongMap!2161)

(assert (=> d!51825 (= res!81361 (contains!1144 lt!85232 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun lt!85233 () List!2193)

(assert (=> d!51825 (= lt!85232 (ListLongMap!2162 lt!85233))))

(declare-fun lt!85234 () Unit!5252)

(declare-fun lt!85231 () Unit!5252)

(assert (=> d!51825 (= lt!85234 lt!85231)))

(assert (=> d!51825 (= (getValueByKey!184 lt!85233 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) (Some!189 (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!51825 (= lt!85231 (lemmaContainsTupThenGetReturnValue!97 lt!85233 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!51825 (= lt!85233 (insertStrictlySorted!100 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407))) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!51825 (= (+!244 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)) (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85232)))

(declare-fun b!171159 () Bool)

(declare-fun res!81362 () Bool)

(assert (=> b!171159 (=> (not res!81362) (not e!112988))))

(assert (=> b!171159 (= res!81362 (= (getValueByKey!184 (toList!1096 lt!85232) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) (Some!189 (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171160 () Bool)

(assert (=> b!171160 (= e!112988 (contains!1146 (toList!1096 lt!85232) (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (= (and d!51825 res!81361) b!171159))

(assert (= (and b!171159 res!81362) b!171160))

(declare-fun m!199511 () Bool)

(assert (=> d!51825 m!199511))

(declare-fun m!199513 () Bool)

(assert (=> d!51825 m!199513))

(declare-fun m!199515 () Bool)

(assert (=> d!51825 m!199515))

(declare-fun m!199517 () Bool)

(assert (=> d!51825 m!199517))

(declare-fun m!199519 () Bool)

(assert (=> b!171159 m!199519))

(declare-fun m!199521 () Bool)

(assert (=> b!171160 m!199521))

(assert (=> bm!17406 d!51825))

(declare-fun b!171161 () Bool)

(declare-fun e!112993 () Bool)

(declare-fun e!112990 () Bool)

(assert (=> b!171161 (= e!112993 e!112990)))

(declare-fun c!30562 () Bool)

(assert (=> b!171161 (= c!30562 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun b!171163 () Bool)

(declare-fun e!112989 () Bool)

(assert (=> b!171163 (= e!112989 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171163 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!171164 () Bool)

(declare-fun res!81366 () Bool)

(declare-fun e!112992 () Bool)

(assert (=> b!171164 (=> (not res!81366) (not e!112992))))

(declare-fun lt!85239 () ListLongMap!2161)

(assert (=> b!171164 (= res!81366 (not (contains!1144 lt!85239 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171165 () Bool)

(declare-fun e!112995 () ListLongMap!2161)

(assert (=> b!171165 (= e!112995 (ListLongMap!2162 Nil!2190))))

(declare-fun b!171166 () Bool)

(declare-fun e!112991 () Bool)

(assert (=> b!171166 (= e!112993 e!112991)))

(assert (=> b!171166 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun res!81365 () Bool)

(assert (=> b!171166 (= res!81365 (contains!1144 lt!85239 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171166 (=> (not res!81365) (not e!112991))))

(declare-fun b!171167 () Bool)

(assert (=> b!171167 (= e!112992 e!112993)))

(declare-fun c!30564 () Bool)

(assert (=> b!171167 (= c!30564 e!112989)))

(declare-fun res!81364 () Bool)

(assert (=> b!171167 (=> (not res!81364) (not e!112989))))

(assert (=> b!171167 (= res!81364 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun bm!17427 () Bool)

(declare-fun call!17430 () ListLongMap!2161)

(assert (=> bm!17427 (= call!17430 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248)))))

(declare-fun d!51827 () Bool)

(assert (=> d!51827 e!112992))

(declare-fun res!81363 () Bool)

(assert (=> d!51827 (=> (not res!81363) (not e!112992))))

(assert (=> d!51827 (= res!81363 (not (contains!1144 lt!85239 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51827 (= lt!85239 e!112995)))

(declare-fun c!30561 () Bool)

(assert (=> d!51827 (= c!30561 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!51827 (validMask!0 (mask!8383 thiss!1248))))

(assert (=> d!51827 (= (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)) lt!85239)))

(declare-fun b!171162 () Bool)

(declare-fun e!112994 () ListLongMap!2161)

(assert (=> b!171162 (= e!112995 e!112994)))

(declare-fun c!30563 () Bool)

(assert (=> b!171162 (= c!30563 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171168 () Bool)

(assert (=> b!171168 (= e!112990 (= lt!85239 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248))))))

(declare-fun b!171169 () Bool)

(assert (=> b!171169 (= e!112990 (isEmpty!434 lt!85239))))

(declare-fun b!171170 () Bool)

(assert (=> b!171170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> b!171170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3683 (_values!3538 thiss!1248))))))

(assert (=> b!171170 (= e!112991 (= (apply!129 lt!85239 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171171 () Bool)

(assert (=> b!171171 (= e!112994 call!17430)))

(declare-fun b!171172 () Bool)

(declare-fun lt!85238 () Unit!5252)

(declare-fun lt!85235 () Unit!5252)

(assert (=> b!171172 (= lt!85238 lt!85235)))

(declare-fun lt!85236 () ListLongMap!2161)

(declare-fun lt!85237 () (_ BitVec 64))

(declare-fun lt!85240 () (_ BitVec 64))

(declare-fun lt!85241 () V!4987)

(assert (=> b!171172 (not (contains!1144 (+!244 lt!85236 (tuple2!3235 lt!85237 lt!85241)) lt!85240))))

(assert (=> b!171172 (= lt!85235 (addStillNotContains!71 lt!85236 lt!85237 lt!85241 lt!85240))))

(assert (=> b!171172 (= lt!85240 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171172 (= lt!85241 (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171172 (= lt!85237 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!171172 (= lt!85236 call!17430)))

(assert (=> b!171172 (= e!112994 (+!244 call!17430 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!51827 c!30561) b!171165))

(assert (= (and d!51827 (not c!30561)) b!171162))

(assert (= (and b!171162 c!30563) b!171172))

(assert (= (and b!171162 (not c!30563)) b!171171))

(assert (= (or b!171172 b!171171) bm!17427))

(assert (= (and d!51827 res!81363) b!171164))

(assert (= (and b!171164 res!81366) b!171167))

(assert (= (and b!171167 res!81364) b!171163))

(assert (= (and b!171167 c!30564) b!171166))

(assert (= (and b!171167 (not c!30564)) b!171161))

(assert (= (and b!171166 res!81365) b!171170))

(assert (= (and b!171161 c!30562) b!171168))

(assert (= (and b!171161 (not c!30562)) b!171169))

(declare-fun b_lambda!6899 () Bool)

(assert (=> (not b_lambda!6899) (not b!171170)))

(assert (=> b!171170 t!6998))

(declare-fun b_and!10659 () Bool)

(assert (= b_and!10657 (and (=> t!6998 result!4561) b_and!10659)))

(declare-fun b_lambda!6901 () Bool)

(assert (=> (not b_lambda!6901) (not b!171172)))

(assert (=> b!171172 t!6998))

(declare-fun b_and!10661 () Bool)

(assert (= b_and!10659 (and (=> t!6998 result!4561) b_and!10661)))

(assert (=> b!171162 m!199241))

(assert (=> b!171162 m!199241))

(assert (=> b!171162 m!199247))

(declare-fun m!199523 () Bool)

(assert (=> b!171168 m!199523))

(assert (=> b!171163 m!199241))

(assert (=> b!171163 m!199241))

(assert (=> b!171163 m!199247))

(assert (=> bm!17427 m!199523))

(declare-fun m!199525 () Bool)

(assert (=> d!51827 m!199525))

(assert (=> d!51827 m!199295))

(assert (=> b!171166 m!199241))

(assert (=> b!171166 m!199241))

(declare-fun m!199527 () Bool)

(assert (=> b!171166 m!199527))

(assert (=> b!171172 m!199287))

(assert (=> b!171172 m!199289))

(assert (=> b!171172 m!199293))

(declare-fun m!199529 () Bool)

(assert (=> b!171172 m!199529))

(assert (=> b!171172 m!199287))

(assert (=> b!171172 m!199289))

(declare-fun m!199531 () Bool)

(assert (=> b!171172 m!199531))

(assert (=> b!171172 m!199241))

(declare-fun m!199533 () Bool)

(assert (=> b!171172 m!199533))

(declare-fun m!199535 () Bool)

(assert (=> b!171172 m!199535))

(assert (=> b!171172 m!199533))

(declare-fun m!199537 () Bool)

(assert (=> b!171169 m!199537))

(assert (=> b!171170 m!199287))

(assert (=> b!171170 m!199289))

(assert (=> b!171170 m!199293))

(assert (=> b!171170 m!199241))

(declare-fun m!199539 () Bool)

(assert (=> b!171170 m!199539))

(assert (=> b!171170 m!199287))

(assert (=> b!171170 m!199289))

(assert (=> b!171170 m!199241))

(declare-fun m!199541 () Bool)

(assert (=> b!171164 m!199541))

(assert (=> bm!17412 d!51827))

(declare-fun b!171174 () Bool)

(declare-fun e!112996 () Option!190)

(declare-fun e!112997 () Option!190)

(assert (=> b!171174 (= e!112996 e!112997)))

(declare-fun c!30566 () Bool)

(assert (=> b!171174 (= c!30566 (and ((_ is Cons!2189) (toList!1096 lt!85171)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85171))) (_1!1628 (tuple2!3235 key!828 v!309))))))))

(declare-fun b!171175 () Bool)

(assert (=> b!171175 (= e!112997 (getValueByKey!184 (t!6995 (toList!1096 lt!85171)) (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun d!51829 () Bool)

(declare-fun c!30565 () Bool)

(assert (=> d!51829 (= c!30565 (and ((_ is Cons!2189) (toList!1096 lt!85171)) (= (_1!1628 (h!2806 (toList!1096 lt!85171))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!51829 (= (getValueByKey!184 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))) e!112996)))

(declare-fun b!171176 () Bool)

(assert (=> b!171176 (= e!112997 None!188)))

(declare-fun b!171173 () Bool)

(assert (=> b!171173 (= e!112996 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85171)))))))

(assert (= (and d!51829 c!30565) b!171173))

(assert (= (and d!51829 (not c!30565)) b!171174))

(assert (= (and b!171174 c!30566) b!171175))

(assert (= (and b!171174 (not c!30566)) b!171176))

(declare-fun m!199543 () Bool)

(assert (=> b!171175 m!199543))

(assert (=> b!171029 d!51829))

(declare-fun b!171185 () Bool)

(declare-fun e!113006 () Bool)

(declare-fun e!113004 () Bool)

(assert (=> b!171185 (= e!113006 e!113004)))

(declare-fun c!30569 () Bool)

(assert (=> b!171185 (= c!30569 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun d!51831 () Bool)

(declare-fun res!81372 () Bool)

(assert (=> d!51831 (=> res!81372 e!113006)))

(assert (=> d!51831 (= res!81372 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!51831 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5387 lt!85045) (mask!8383 lt!85045)) e!113006)))

(declare-fun bm!17430 () Bool)

(declare-fun call!17433 () Bool)

(assert (=> bm!17430 (= call!17433 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5387 lt!85045) (mask!8383 lt!85045)))))

(declare-fun b!171186 () Bool)

(assert (=> b!171186 (= e!113004 call!17433)))

(declare-fun b!171187 () Bool)

(declare-fun e!113005 () Bool)

(assert (=> b!171187 (= e!113005 call!17433)))

(declare-fun b!171188 () Bool)

(assert (=> b!171188 (= e!113004 e!113005)))

(declare-fun lt!85250 () (_ BitVec 64))

(assert (=> b!171188 (= lt!85250 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000))))

(declare-fun lt!85248 () Unit!5252)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7123 (_ BitVec 64) (_ BitVec 32)) Unit!5252)

(assert (=> b!171188 (= lt!85248 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5387 lt!85045) lt!85250 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!171188 (arrayContainsKey!0 (_keys!5387 lt!85045) lt!85250 #b00000000000000000000000000000000)))

(declare-fun lt!85249 () Unit!5252)

(assert (=> b!171188 (= lt!85249 lt!85248)))

(declare-fun res!81371 () Bool)

(declare-datatypes ((SeekEntryResult!534 0))(
  ( (MissingZero!534 (index!4304 (_ BitVec 32))) (Found!534 (index!4305 (_ BitVec 32))) (Intermediate!534 (undefined!1346 Bool) (index!4306 (_ BitVec 32)) (x!18959 (_ BitVec 32))) (Undefined!534) (MissingVacant!534 (index!4307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7123 (_ BitVec 32)) SeekEntryResult!534)

(assert (=> b!171188 (= res!81371 (= (seekEntryOrOpen!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) (_keys!5387 lt!85045) (mask!8383 lt!85045)) (Found!534 #b00000000000000000000000000000000)))))

(assert (=> b!171188 (=> (not res!81371) (not e!113005))))

(assert (= (and d!51831 (not res!81372)) b!171185))

(assert (= (and b!171185 c!30569) b!171188))

(assert (= (and b!171185 (not c!30569)) b!171186))

(assert (= (and b!171188 res!81371) b!171187))

(assert (= (or b!171187 b!171186) bm!17430))

(declare-fun m!199545 () Bool)

(assert (=> b!171185 m!199545))

(assert (=> b!171185 m!199545))

(declare-fun m!199547 () Bool)

(assert (=> b!171185 m!199547))

(declare-fun m!199549 () Bool)

(assert (=> bm!17430 m!199549))

(assert (=> b!171188 m!199545))

(declare-fun m!199551 () Bool)

(assert (=> b!171188 m!199551))

(declare-fun m!199553 () Bool)

(assert (=> b!171188 m!199553))

(assert (=> b!171188 m!199545))

(declare-fun m!199555 () Bool)

(assert (=> b!171188 m!199555))

(assert (=> b!170988 d!51831))

(declare-fun d!51833 () Bool)

(assert (=> d!51833 (= (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!170973 d!51833))

(declare-fun b!171197 () Bool)

(declare-fun e!113012 () (_ BitVec 32))

(declare-fun call!17436 () (_ BitVec 32))

(assert (=> b!171197 (= e!113012 call!17436)))

(declare-fun b!171198 () Bool)

(declare-fun e!113011 () (_ BitVec 32))

(assert (=> b!171198 (= e!113011 #b00000000000000000000000000000000)))

(declare-fun b!171199 () Bool)

(assert (=> b!171199 (= e!113011 e!113012)))

(declare-fun c!30575 () Bool)

(assert (=> b!171199 (= c!30575 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun b!171200 () Bool)

(assert (=> b!171200 (= e!113012 (bvadd #b00000000000000000000000000000001 call!17436))))

(declare-fun bm!17433 () Bool)

(assert (=> bm!17433 (= call!17436 (arrayCountValidKeys!0 (_keys!5387 lt!85045) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 lt!85045))))))

(declare-fun d!51835 () Bool)

(declare-fun lt!85253 () (_ BitVec 32))

(assert (=> d!51835 (and (bvsge lt!85253 #b00000000000000000000000000000000) (bvsle lt!85253 (bvsub (size!3682 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(assert (=> d!51835 (= lt!85253 e!113011)))

(declare-fun c!30574 () Bool)

(assert (=> d!51835 (= c!30574 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!51835 (and (bvsle #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3682 (_keys!5387 lt!85045)) (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!51835 (= (arrayCountValidKeys!0 (_keys!5387 lt!85045) #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))) lt!85253)))

(assert (= (and d!51835 c!30574) b!171198))

(assert (= (and d!51835 (not c!30574)) b!171199))

(assert (= (and b!171199 c!30575) b!171200))

(assert (= (and b!171199 (not c!30575)) b!171197))

(assert (= (or b!171200 b!171197) bm!17433))

(assert (=> b!171199 m!199545))

(assert (=> b!171199 m!199545))

(assert (=> b!171199 m!199547))

(declare-fun m!199557 () Bool)

(assert (=> bm!17433 m!199557))

(assert (=> b!170987 d!51835))

(declare-fun d!51837 () Bool)

(declare-fun e!113013 () Bool)

(assert (=> d!51837 e!113013))

(declare-fun res!81373 () Bool)

(assert (=> d!51837 (=> (not res!81373) (not e!113013))))

(declare-fun lt!85255 () ListLongMap!2161)

(assert (=> d!51837 (= res!81373 (contains!1144 lt!85255 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun lt!85256 () List!2193)

(assert (=> d!51837 (= lt!85255 (ListLongMap!2162 lt!85256))))

(declare-fun lt!85257 () Unit!5252)

(declare-fun lt!85254 () Unit!5252)

(assert (=> d!51837 (= lt!85257 lt!85254)))

(assert (=> d!51837 (= (getValueByKey!184 lt!85256 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) (Some!189 (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!51837 (= lt!85254 (lemmaContainsTupThenGetReturnValue!97 lt!85256 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!51837 (= lt!85256 (insertStrictlySorted!100 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414))) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!51837 (= (+!244 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)) (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85255)))

(declare-fun b!171201 () Bool)

(declare-fun res!81374 () Bool)

(assert (=> b!171201 (=> (not res!81374) (not e!113013))))

(assert (=> b!171201 (= res!81374 (= (getValueByKey!184 (toList!1096 lt!85255) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) (Some!189 (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171202 () Bool)

(assert (=> b!171202 (= e!113013 (contains!1146 (toList!1096 lt!85255) (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (= (and d!51837 res!81373) b!171201))

(assert (= (and b!171201 res!81374) b!171202))

(declare-fun m!199559 () Bool)

(assert (=> d!51837 m!199559))

(declare-fun m!199561 () Bool)

(assert (=> d!51837 m!199561))

(declare-fun m!199563 () Bool)

(assert (=> d!51837 m!199563))

(declare-fun m!199565 () Bool)

(assert (=> d!51837 m!199565))

(declare-fun m!199567 () Bool)

(assert (=> b!171201 m!199567))

(declare-fun m!199569 () Bool)

(assert (=> b!171202 m!199569))

(assert (=> bm!17413 d!51837))

(declare-fun d!51839 () Bool)

(declare-fun e!113015 () Bool)

(assert (=> d!51839 e!113015))

(declare-fun res!81375 () Bool)

(assert (=> d!51839 (=> res!81375 e!113015)))

(declare-fun lt!85260 () Bool)

(assert (=> d!51839 (= res!81375 (not lt!85260))))

(declare-fun lt!85258 () Bool)

(assert (=> d!51839 (= lt!85260 lt!85258)))

(declare-fun lt!85259 () Unit!5252)

(declare-fun e!113014 () Unit!5252)

(assert (=> d!51839 (= lt!85259 e!113014)))

(declare-fun c!30576 () Bool)

(assert (=> d!51839 (= c!30576 lt!85258)))

(assert (=> d!51839 (= lt!85258 (containsKey!188 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!51839 (= (contains!1144 lt!85155 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85260)))

(declare-fun b!171203 () Bool)

(declare-fun lt!85261 () Unit!5252)

(assert (=> b!171203 (= e!113014 lt!85261)))

(assert (=> b!171203 (= lt!85261 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!171203 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171204 () Bool)

(declare-fun Unit!5262 () Unit!5252)

(assert (=> b!171204 (= e!113014 Unit!5262)))

(declare-fun b!171205 () Bool)

(assert (=> b!171205 (= e!113015 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51839 c!30576) b!171203))

(assert (= (and d!51839 (not c!30576)) b!171204))

(assert (= (and d!51839 (not res!81375)) b!171205))

(declare-fun m!199571 () Bool)

(assert (=> d!51839 m!199571))

(declare-fun m!199573 () Bool)

(assert (=> b!171203 m!199573))

(assert (=> b!171203 m!199367))

(assert (=> b!171203 m!199367))

(declare-fun m!199575 () Bool)

(assert (=> b!171203 m!199575))

(assert (=> b!171205 m!199367))

(assert (=> b!171205 m!199367))

(assert (=> b!171205 m!199575))

(assert (=> d!51779 d!51839))

(declare-fun b!171207 () Bool)

(declare-fun e!113016 () Option!190)

(declare-fun e!113017 () Option!190)

(assert (=> b!171207 (= e!113016 e!113017)))

(declare-fun c!30578 () Bool)

(assert (=> b!171207 (= c!30578 (and ((_ is Cons!2189) lt!85156) (not (= (_1!1628 (h!2806 lt!85156)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!171208 () Bool)

(assert (=> b!171208 (= e!113017 (getValueByKey!184 (t!6995 lt!85156) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!51841 () Bool)

(declare-fun c!30577 () Bool)

(assert (=> d!51841 (= c!30577 (and ((_ is Cons!2189) lt!85156) (= (_1!1628 (h!2806 lt!85156)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51841 (= (getValueByKey!184 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113016)))

(declare-fun b!171209 () Bool)

(assert (=> b!171209 (= e!113017 None!188)))

(declare-fun b!171206 () Bool)

(assert (=> b!171206 (= e!113016 (Some!189 (_2!1628 (h!2806 lt!85156))))))

(assert (= (and d!51841 c!30577) b!171206))

(assert (= (and d!51841 (not c!30577)) b!171207))

(assert (= (and b!171207 c!30578) b!171208))

(assert (= (and b!171207 (not c!30578)) b!171209))

(declare-fun m!199577 () Bool)

(assert (=> b!171208 m!199577))

(assert (=> d!51779 d!51841))

(declare-fun d!51843 () Bool)

(assert (=> d!51843 (= (getValueByKey!184 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!189 (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85262 () Unit!5252)

(assert (=> d!51843 (= lt!85262 (choose!924 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!113018 () Bool)

(assert (=> d!51843 e!113018))

(declare-fun res!81376 () Bool)

(assert (=> d!51843 (=> (not res!81376) (not e!113018))))

(assert (=> d!51843 (= res!81376 (isStrictlySorted!331 lt!85156))))

(assert (=> d!51843 (= (lemmaContainsTupThenGetReturnValue!97 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85262)))

(declare-fun b!171210 () Bool)

(declare-fun res!81377 () Bool)

(assert (=> b!171210 (=> (not res!81377) (not e!113018))))

(assert (=> b!171210 (= res!81377 (containsKey!188 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171211 () Bool)

(assert (=> b!171211 (= e!113018 (contains!1146 lt!85156 (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!51843 res!81376) b!171210))

(assert (= (and b!171210 res!81377) b!171211))

(assert (=> d!51843 m!199361))

(declare-fun m!199579 () Bool)

(assert (=> d!51843 m!199579))

(declare-fun m!199581 () Bool)

(assert (=> d!51843 m!199581))

(declare-fun m!199583 () Bool)

(assert (=> b!171210 m!199583))

(declare-fun m!199585 () Bool)

(assert (=> b!171211 m!199585))

(assert (=> d!51779 d!51843))

(declare-fun b!171212 () Bool)

(declare-fun e!113019 () List!2193)

(declare-fun call!17438 () List!2193)

(assert (=> b!171212 (= e!113019 call!17438)))

(declare-fun b!171213 () Bool)

(declare-fun res!81379 () Bool)

(declare-fun e!113023 () Bool)

(assert (=> b!171213 (=> (not res!81379) (not e!113023))))

(declare-fun lt!85263 () List!2193)

(assert (=> b!171213 (= res!81379 (containsKey!188 lt!85263 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171214 () Bool)

(declare-fun e!113022 () List!2193)

(declare-fun e!113020 () List!2193)

(assert (=> b!171214 (= e!113022 e!113020)))

(declare-fun c!30580 () Bool)

(assert (=> b!171214 (= c!30580 (and ((_ is Cons!2189) (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (= (_1!1628 (h!2806 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun c!30581 () Bool)

(declare-fun e!113021 () List!2193)

(declare-fun b!171215 () Bool)

(assert (=> b!171215 (= e!113021 (ite c!30580 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (ite c!30581 (Cons!2189 (h!2806 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) Nil!2190)))))

(declare-fun b!171216 () Bool)

(assert (=> b!171216 (= e!113023 (contains!1146 lt!85263 (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171217 () Bool)

(declare-fun call!17437 () List!2193)

(assert (=> b!171217 (= e!113022 call!17437)))

(declare-fun bm!17434 () Bool)

(declare-fun c!30582 () Bool)

(assert (=> bm!17434 (= call!17437 ($colon$colon!97 e!113021 (ite c!30582 (h!2806 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30579 () Bool)

(assert (=> bm!17434 (= c!30579 c!30582)))

(declare-fun bm!17436 () Bool)

(declare-fun call!17439 () List!2193)

(assert (=> bm!17436 (= call!17438 call!17439)))

(declare-fun b!171218 () Bool)

(assert (=> b!171218 (= e!113020 call!17439)))

(declare-fun b!171219 () Bool)

(assert (=> b!171219 (= e!113019 call!17438)))

(declare-fun b!171220 () Bool)

(assert (=> b!171220 (= c!30581 (and ((_ is Cons!2189) (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (bvsgt (_1!1628 (h!2806 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!171220 (= e!113020 e!113019)))

(declare-fun b!171221 () Bool)

(assert (=> b!171221 (= e!113021 (insertStrictlySorted!100 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17435 () Bool)

(assert (=> bm!17435 (= call!17439 call!17437)))

(declare-fun d!51845 () Bool)

(assert (=> d!51845 e!113023))

(declare-fun res!81378 () Bool)

(assert (=> d!51845 (=> (not res!81378) (not e!113023))))

(assert (=> d!51845 (= res!81378 (isStrictlySorted!331 lt!85263))))

(assert (=> d!51845 (= lt!85263 e!113022)))

(assert (=> d!51845 (= c!30582 (and ((_ is Cons!2189) (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (bvslt (_1!1628 (h!2806 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51845 (isStrictlySorted!331 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))))

(assert (=> d!51845 (= (insertStrictlySorted!100 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85263)))

(assert (= (and d!51845 c!30582) b!171217))

(assert (= (and d!51845 (not c!30582)) b!171214))

(assert (= (and b!171214 c!30580) b!171218))

(assert (= (and b!171214 (not c!30580)) b!171220))

(assert (= (and b!171220 c!30581) b!171219))

(assert (= (and b!171220 (not c!30581)) b!171212))

(assert (= (or b!171219 b!171212) bm!17436))

(assert (= (or b!171218 bm!17436) bm!17435))

(assert (= (or b!171217 bm!17435) bm!17434))

(assert (= (and bm!17434 c!30579) b!171221))

(assert (= (and bm!17434 (not c!30579)) b!171215))

(assert (= (and d!51845 res!81378) b!171213))

(assert (= (and b!171213 res!81379) b!171216))

(declare-fun m!199587 () Bool)

(assert (=> b!171213 m!199587))

(declare-fun m!199589 () Bool)

(assert (=> d!51845 m!199589))

(declare-fun m!199591 () Bool)

(assert (=> d!51845 m!199591))

(declare-fun m!199593 () Bool)

(assert (=> b!171221 m!199593))

(declare-fun m!199595 () Bool)

(assert (=> b!171216 m!199595))

(declare-fun m!199597 () Bool)

(assert (=> bm!17434 m!199597))

(assert (=> d!51779 d!51845))

(declare-fun b!171233 () Bool)

(declare-fun e!113026 () Bool)

(assert (=> b!171233 (= e!113026 (and (bvsge (extraKeys!3296 lt!85045) #b00000000000000000000000000000000) (bvsle (extraKeys!3296 lt!85045) #b00000000000000000000000000000011) (bvsge (_vacant!1162 lt!85045) #b00000000000000000000000000000000)))))

(declare-fun b!171230 () Bool)

(declare-fun res!81391 () Bool)

(assert (=> b!171230 (=> (not res!81391) (not e!113026))))

(assert (=> b!171230 (= res!81391 (and (= (size!3683 (_values!3538 lt!85045)) (bvadd (mask!8383 lt!85045) #b00000000000000000000000000000001)) (= (size!3682 (_keys!5387 lt!85045)) (size!3683 (_values!3538 lt!85045))) (bvsge (_size!1162 lt!85045) #b00000000000000000000000000000000) (bvsle (_size!1162 lt!85045) (bvadd (mask!8383 lt!85045) #b00000000000000000000000000000001))))))

(declare-fun b!171232 () Bool)

(declare-fun res!81389 () Bool)

(assert (=> b!171232 (=> (not res!81389) (not e!113026))))

(declare-fun size!3686 (LongMapFixedSize!2226) (_ BitVec 32))

(assert (=> b!171232 (= res!81389 (= (size!3686 lt!85045) (bvadd (_size!1162 lt!85045) (bvsdiv (bvadd (extraKeys!3296 lt!85045) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!51847 () Bool)

(declare-fun res!81388 () Bool)

(assert (=> d!51847 (=> (not res!81388) (not e!113026))))

(assert (=> d!51847 (= res!81388 (validMask!0 (mask!8383 lt!85045)))))

(assert (=> d!51847 (= (simpleValid!135 lt!85045) e!113026)))

(declare-fun b!171231 () Bool)

(declare-fun res!81390 () Bool)

(assert (=> b!171231 (=> (not res!81390) (not e!113026))))

(assert (=> b!171231 (= res!81390 (bvsge (size!3686 lt!85045) (_size!1162 lt!85045)))))

(assert (= (and d!51847 res!81388) b!171230))

(assert (= (and b!171230 res!81391) b!171231))

(assert (= (and b!171231 res!81390) b!171232))

(assert (= (and b!171232 res!81389) b!171233))

(declare-fun m!199599 () Bool)

(assert (=> b!171232 m!199599))

(declare-fun m!199601 () Bool)

(assert (=> d!51847 m!199601))

(assert (=> b!171231 m!199599))

(assert (=> d!51773 d!51847))

(declare-fun d!51849 () Bool)

(declare-fun get!1939 (Option!190) V!4987)

(assert (=> d!51849 (= (apply!129 lt!85105 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (get!1939 (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7052 () Bool)

(assert (= bs!7052 d!51849))

(assert (=> bs!7052 m!199241))

(assert (=> bs!7052 m!199471))

(assert (=> bs!7052 m!199471))

(declare-fun m!199603 () Bool)

(assert (=> bs!7052 m!199603))

(assert (=> b!170976 d!51849))

(declare-fun d!51851 () Bool)

(declare-fun c!30585 () Bool)

(assert (=> d!51851 (= c!30585 ((_ is ValueCellFull!1659) (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113029 () V!4987)

(assert (=> d!51851 (= (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!113029)))

(declare-fun b!171238 () Bool)

(declare-fun get!1940 (ValueCell!1659 V!4987) V!4987)

(assert (=> b!171238 (= e!113029 (get!1940 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171239 () Bool)

(declare-fun get!1941 (ValueCell!1659 V!4987) V!4987)

(assert (=> b!171239 (= e!113029 (get!1941 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51851 c!30585) b!171238))

(assert (= (and d!51851 (not c!30585)) b!171239))

(assert (=> b!171238 m!199287))

(assert (=> b!171238 m!199289))

(declare-fun m!199605 () Bool)

(assert (=> b!171238 m!199605))

(assert (=> b!171239 m!199287))

(assert (=> b!171239 m!199289))

(declare-fun m!199607 () Bool)

(assert (=> b!171239 m!199607))

(assert (=> b!170976 d!51851))

(assert (=> b!171005 d!51833))

(declare-fun bm!17439 () Bool)

(declare-fun call!17442 () Bool)

(declare-fun c!30588 () Bool)

(assert (=> bm!17439 (= call!17442 (arrayNoDuplicates!0 (_keys!5387 lt!85045) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30588 (Cons!2191 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) Nil!2192) Nil!2192)))))

(declare-fun b!171250 () Bool)

(declare-fun e!113041 () Bool)

(assert (=> b!171250 (= e!113041 call!17442)))

(declare-fun b!171251 () Bool)

(declare-fun e!113040 () Bool)

(assert (=> b!171251 (= e!113040 e!113041)))

(assert (=> b!171251 (= c!30588 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun b!171252 () Bool)

(assert (=> b!171252 (= e!113041 call!17442)))

(declare-fun b!171253 () Bool)

(declare-fun e!113038 () Bool)

(declare-fun contains!1147 (List!2195 (_ BitVec 64)) Bool)

(assert (=> b!171253 (= e!113038 (contains!1147 Nil!2192 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun b!171254 () Bool)

(declare-fun e!113039 () Bool)

(assert (=> b!171254 (= e!113039 e!113040)))

(declare-fun res!81398 () Bool)

(assert (=> b!171254 (=> (not res!81398) (not e!113040))))

(assert (=> b!171254 (= res!81398 (not e!113038))))

(declare-fun res!81400 () Bool)

(assert (=> b!171254 (=> (not res!81400) (not e!113038))))

(assert (=> b!171254 (= res!81400 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun d!51853 () Bool)

(declare-fun res!81399 () Bool)

(assert (=> d!51853 (=> res!81399 e!113039)))

(assert (=> d!51853 (= res!81399 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!51853 (= (arrayNoDuplicates!0 (_keys!5387 lt!85045) #b00000000000000000000000000000000 Nil!2192) e!113039)))

(assert (= (and d!51853 (not res!81399)) b!171254))

(assert (= (and b!171254 res!81400) b!171253))

(assert (= (and b!171254 res!81398) b!171251))

(assert (= (and b!171251 c!30588) b!171250))

(assert (= (and b!171251 (not c!30588)) b!171252))

(assert (= (or b!171250 b!171252) bm!17439))

(assert (=> bm!17439 m!199545))

(declare-fun m!199609 () Bool)

(assert (=> bm!17439 m!199609))

(assert (=> b!171251 m!199545))

(assert (=> b!171251 m!199545))

(assert (=> b!171251 m!199547))

(assert (=> b!171253 m!199545))

(assert (=> b!171253 m!199545))

(declare-fun m!199611 () Bool)

(assert (=> b!171253 m!199611))

(assert (=> b!171254 m!199545))

(assert (=> b!171254 m!199545))

(assert (=> b!171254 m!199547))

(assert (=> b!170989 d!51853))

(declare-fun b!171258 () Bool)

(declare-fun e!113042 () Bool)

(assert (=> b!171258 (= e!113042 (and (bvsge (extraKeys!3296 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3296 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1162 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!171255 () Bool)

(declare-fun res!81404 () Bool)

(assert (=> b!171255 (=> (not res!81404) (not e!113042))))

(assert (=> b!171255 (= res!81404 (and (= (size!3683 (_values!3538 thiss!1248)) (bvadd (mask!8383 thiss!1248) #b00000000000000000000000000000001)) (= (size!3682 (_keys!5387 thiss!1248)) (size!3683 (_values!3538 thiss!1248))) (bvsge (_size!1162 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1162 thiss!1248) (bvadd (mask!8383 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!171257 () Bool)

(declare-fun res!81402 () Bool)

(assert (=> b!171257 (=> (not res!81402) (not e!113042))))

(assert (=> b!171257 (= res!81402 (= (size!3686 thiss!1248) (bvadd (_size!1162 thiss!1248) (bvsdiv (bvadd (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!51855 () Bool)

(declare-fun res!81401 () Bool)

(assert (=> d!51855 (=> (not res!81401) (not e!113042))))

(assert (=> d!51855 (= res!81401 (validMask!0 (mask!8383 thiss!1248)))))

(assert (=> d!51855 (= (simpleValid!135 thiss!1248) e!113042)))

(declare-fun b!171256 () Bool)

(declare-fun res!81403 () Bool)

(assert (=> b!171256 (=> (not res!81403) (not e!113042))))

(assert (=> b!171256 (= res!81403 (bvsge (size!3686 thiss!1248) (_size!1162 thiss!1248)))))

(assert (= (and d!51855 res!81401) b!171255))

(assert (= (and b!171255 res!81404) b!171256))

(assert (= (and b!171256 res!81403) b!171257))

(assert (= (and b!171257 res!81402) b!171258))

(declare-fun m!199613 () Bool)

(assert (=> b!171257 m!199613))

(assert (=> d!51855 m!199295))

(assert (=> b!171256 m!199613))

(assert (=> d!51781 d!51855))

(declare-fun d!51857 () Bool)

(assert (=> d!51857 (= (apply!129 lt!85105 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1939 (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7053 () Bool)

(assert (= bs!7053 d!51857))

(assert (=> bs!7053 m!199427))

(assert (=> bs!7053 m!199427))

(declare-fun m!199615 () Bool)

(assert (=> bs!7053 m!199615))

(assert (=> b!170974 d!51857))

(declare-fun b!171259 () Bool)

(declare-fun res!81413 () Bool)

(declare-fun e!113043 () Bool)

(assert (=> b!171259 (=> (not res!81413) (not e!113043))))

(declare-fun e!113055 () Bool)

(assert (=> b!171259 (= res!81413 e!113055)))

(declare-fun res!81411 () Bool)

(assert (=> b!171259 (=> res!81411 e!113055)))

(declare-fun e!113054 () Bool)

(assert (=> b!171259 (= res!81411 (not e!113054))))

(declare-fun res!81410 () Bool)

(assert (=> b!171259 (=> (not res!81410) (not e!113054))))

(assert (=> b!171259 (= res!81410 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(declare-fun bm!17440 () Bool)

(declare-fun call!17446 () ListLongMap!2161)

(declare-fun call!17447 () ListLongMap!2161)

(assert (=> bm!17440 (= call!17446 call!17447)))

(declare-fun d!51859 () Bool)

(assert (=> d!51859 e!113043))

(declare-fun res!81406 () Bool)

(assert (=> d!51859 (=> (not res!81406) (not e!113043))))

(assert (=> d!51859 (= res!81406 (or (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))))

(declare-fun lt!85270 () ListLongMap!2161)

(declare-fun lt!85279 () ListLongMap!2161)

(assert (=> d!51859 (= lt!85270 lt!85279)))

(declare-fun lt!85282 () Unit!5252)

(declare-fun e!113047 () Unit!5252)

(assert (=> d!51859 (= lt!85282 e!113047)))

(declare-fun c!30594 () Bool)

(declare-fun e!113048 () Bool)

(assert (=> d!51859 (= c!30594 e!113048)))

(declare-fun res!81409 () Bool)

(assert (=> d!51859 (=> (not res!81409) (not e!113048))))

(assert (=> d!51859 (= res!81409 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(declare-fun e!113046 () ListLongMap!2161)

(assert (=> d!51859 (= lt!85279 e!113046)))

(declare-fun c!30592 () Bool)

(assert (=> d!51859 (= c!30592 (and (not (= (bvand (extraKeys!3296 lt!85045) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3296 lt!85045) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!51859 (validMask!0 (mask!8383 lt!85045))))

(assert (=> d!51859 (= (getCurrentListMap!750 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) #b00000000000000000000000000000000 (defaultEntry!3555 lt!85045)) lt!85270)))

(declare-fun bm!17441 () Bool)

(declare-fun call!17448 () ListLongMap!2161)

(declare-fun call!17445 () ListLongMap!2161)

(assert (=> bm!17441 (= call!17448 call!17445)))

(declare-fun b!171260 () Bool)

(declare-fun e!113045 () Bool)

(assert (=> b!171260 (= e!113045 (= (apply!129 lt!85270 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3398 lt!85045)))))

(declare-fun b!171261 () Bool)

(declare-fun Unit!5263 () Unit!5252)

(assert (=> b!171261 (= e!113047 Unit!5263)))

(declare-fun b!171262 () Bool)

(declare-fun lt!85274 () Unit!5252)

(assert (=> b!171262 (= e!113047 lt!85274)))

(declare-fun lt!85284 () ListLongMap!2161)

(assert (=> b!171262 (= lt!85284 (getCurrentListMapNoExtraKeys!162 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) #b00000000000000000000000000000000 (defaultEntry!3555 lt!85045)))))

(declare-fun lt!85269 () (_ BitVec 64))

(assert (=> b!171262 (= lt!85269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85267 () (_ BitVec 64))

(assert (=> b!171262 (= lt!85267 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000))))

(declare-fun lt!85283 () Unit!5252)

(assert (=> b!171262 (= lt!85283 (addStillContains!105 lt!85284 lt!85269 (zeroValue!3398 lt!85045) lt!85267))))

(assert (=> b!171262 (contains!1144 (+!244 lt!85284 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045))) lt!85267)))

(declare-fun lt!85264 () Unit!5252)

(assert (=> b!171262 (= lt!85264 lt!85283)))

(declare-fun lt!85276 () ListLongMap!2161)

(assert (=> b!171262 (= lt!85276 (getCurrentListMapNoExtraKeys!162 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) #b00000000000000000000000000000000 (defaultEntry!3555 lt!85045)))))

(declare-fun lt!85275 () (_ BitVec 64))

(assert (=> b!171262 (= lt!85275 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85268 () (_ BitVec 64))

(assert (=> b!171262 (= lt!85268 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000))))

(declare-fun lt!85265 () Unit!5252)

(assert (=> b!171262 (= lt!85265 (addApplyDifferent!105 lt!85276 lt!85275 (minValue!3398 lt!85045) lt!85268))))

(assert (=> b!171262 (= (apply!129 (+!244 lt!85276 (tuple2!3235 lt!85275 (minValue!3398 lt!85045))) lt!85268) (apply!129 lt!85276 lt!85268))))

(declare-fun lt!85273 () Unit!5252)

(assert (=> b!171262 (= lt!85273 lt!85265)))

(declare-fun lt!85266 () ListLongMap!2161)

(assert (=> b!171262 (= lt!85266 (getCurrentListMapNoExtraKeys!162 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) #b00000000000000000000000000000000 (defaultEntry!3555 lt!85045)))))

(declare-fun lt!85272 () (_ BitVec 64))

(assert (=> b!171262 (= lt!85272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85281 () (_ BitVec 64))

(assert (=> b!171262 (= lt!85281 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000))))

(declare-fun lt!85278 () Unit!5252)

(assert (=> b!171262 (= lt!85278 (addApplyDifferent!105 lt!85266 lt!85272 (zeroValue!3398 lt!85045) lt!85281))))

(assert (=> b!171262 (= (apply!129 (+!244 lt!85266 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045))) lt!85281) (apply!129 lt!85266 lt!85281))))

(declare-fun lt!85285 () Unit!5252)

(assert (=> b!171262 (= lt!85285 lt!85278)))

(declare-fun lt!85280 () ListLongMap!2161)

(assert (=> b!171262 (= lt!85280 (getCurrentListMapNoExtraKeys!162 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) #b00000000000000000000000000000000 (defaultEntry!3555 lt!85045)))))

(declare-fun lt!85271 () (_ BitVec 64))

(assert (=> b!171262 (= lt!85271 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85277 () (_ BitVec 64))

(assert (=> b!171262 (= lt!85277 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000))))

(assert (=> b!171262 (= lt!85274 (addApplyDifferent!105 lt!85280 lt!85271 (minValue!3398 lt!85045) lt!85277))))

(assert (=> b!171262 (= (apply!129 (+!244 lt!85280 (tuple2!3235 lt!85271 (minValue!3398 lt!85045))) lt!85277) (apply!129 lt!85280 lt!85277))))

(declare-fun b!171263 () Bool)

(declare-fun e!113053 () Bool)

(declare-fun call!17444 () Bool)

(assert (=> b!171263 (= e!113053 (not call!17444))))

(declare-fun b!171264 () Bool)

(declare-fun e!113052 () ListLongMap!2161)

(assert (=> b!171264 (= e!113052 call!17446)))

(declare-fun b!171265 () Bool)

(assert (=> b!171265 (= e!113046 (+!244 call!17445 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))))

(declare-fun bm!17442 () Bool)

(declare-fun call!17449 () Bool)

(assert (=> bm!17442 (= call!17449 (contains!1144 lt!85270 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171266 () Bool)

(declare-fun e!113049 () ListLongMap!2161)

(assert (=> b!171266 (= e!113049 call!17448)))

(declare-fun b!171267 () Bool)

(assert (=> b!171267 (= e!113052 call!17448)))

(declare-fun bm!17443 () Bool)

(declare-fun call!17443 () ListLongMap!2161)

(assert (=> bm!17443 (= call!17447 call!17443)))

(declare-fun b!171268 () Bool)

(declare-fun c!30593 () Bool)

(assert (=> b!171268 (= c!30593 (and (not (= (bvand (extraKeys!3296 lt!85045) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3296 lt!85045) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!171268 (= e!113049 e!113052)))

(declare-fun bm!17444 () Bool)

(assert (=> bm!17444 (= call!17443 (getCurrentListMapNoExtraKeys!162 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) #b00000000000000000000000000000000 (defaultEntry!3555 lt!85045)))))

(declare-fun b!171269 () Bool)

(declare-fun e!113044 () Bool)

(assert (=> b!171269 (= e!113044 (not call!17449))))

(declare-fun b!171270 () Bool)

(declare-fun e!113050 () Bool)

(assert (=> b!171270 (= e!113055 e!113050)))

(declare-fun res!81405 () Bool)

(assert (=> b!171270 (=> (not res!81405) (not e!113050))))

(assert (=> b!171270 (= res!81405 (contains!1144 lt!85270 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(assert (=> b!171270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(declare-fun bm!17445 () Bool)

(declare-fun c!30590 () Bool)

(assert (=> bm!17445 (= call!17445 (+!244 (ite c!30592 call!17443 (ite c!30590 call!17447 call!17446)) (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))))))

(declare-fun b!171271 () Bool)

(assert (=> b!171271 (= e!113043 e!113044)))

(declare-fun c!30589 () Bool)

(assert (=> b!171271 (= c!30589 (not (= (bvand (extraKeys!3296 lt!85045) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171272 () Bool)

(declare-fun e!113051 () Bool)

(assert (=> b!171272 (= e!113044 e!113051)))

(declare-fun res!81408 () Bool)

(assert (=> b!171272 (= res!81408 call!17449)))

(assert (=> b!171272 (=> (not res!81408) (not e!113051))))

(declare-fun b!171273 () Bool)

(assert (=> b!171273 (= e!113046 e!113049)))

(assert (=> b!171273 (= c!30590 (and (not (= (bvand (extraKeys!3296 lt!85045) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3296 lt!85045) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!171274 () Bool)

(assert (=> b!171274 (= e!113054 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun b!171275 () Bool)

(assert (=> b!171275 (= e!113051 (= (apply!129 lt!85270 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3398 lt!85045)))))

(declare-fun b!171276 () Bool)

(declare-fun res!81407 () Bool)

(assert (=> b!171276 (=> (not res!81407) (not e!113043))))

(assert (=> b!171276 (= res!81407 e!113053)))

(declare-fun c!30591 () Bool)

(assert (=> b!171276 (= c!30591 (not (= (bvand (extraKeys!3296 lt!85045) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!171277 () Bool)

(assert (=> b!171277 (= e!113050 (= (apply!129 lt!85270 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)) (get!1938 (select (arr!3390 (_values!3538 lt!85045)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 lt!85045) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3683 (_values!3538 lt!85045))))))

(assert (=> b!171277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(declare-fun b!171278 () Bool)

(assert (=> b!171278 (= e!113048 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun bm!17446 () Bool)

(assert (=> bm!17446 (= call!17444 (contains!1144 lt!85270 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171279 () Bool)

(assert (=> b!171279 (= e!113053 e!113045)))

(declare-fun res!81412 () Bool)

(assert (=> b!171279 (= res!81412 call!17444)))

(assert (=> b!171279 (=> (not res!81412) (not e!113045))))

(assert (= (and d!51859 c!30592) b!171265))

(assert (= (and d!51859 (not c!30592)) b!171273))

(assert (= (and b!171273 c!30590) b!171266))

(assert (= (and b!171273 (not c!30590)) b!171268))

(assert (= (and b!171268 c!30593) b!171267))

(assert (= (and b!171268 (not c!30593)) b!171264))

(assert (= (or b!171267 b!171264) bm!17440))

(assert (= (or b!171266 bm!17440) bm!17443))

(assert (= (or b!171266 b!171267) bm!17441))

(assert (= (or b!171265 bm!17443) bm!17444))

(assert (= (or b!171265 bm!17441) bm!17445))

(assert (= (and d!51859 res!81409) b!171278))

(assert (= (and d!51859 c!30594) b!171262))

(assert (= (and d!51859 (not c!30594)) b!171261))

(assert (= (and d!51859 res!81406) b!171259))

(assert (= (and b!171259 res!81410) b!171274))

(assert (= (and b!171259 (not res!81411)) b!171270))

(assert (= (and b!171270 res!81405) b!171277))

(assert (= (and b!171259 res!81413) b!171276))

(assert (= (and b!171276 c!30591) b!171279))

(assert (= (and b!171276 (not c!30591)) b!171263))

(assert (= (and b!171279 res!81412) b!171260))

(assert (= (or b!171279 b!171263) bm!17446))

(assert (= (and b!171276 res!81407) b!171271))

(assert (= (and b!171271 c!30589) b!171272))

(assert (= (and b!171271 (not c!30589)) b!171269))

(assert (= (and b!171272 res!81408) b!171275))

(assert (= (or b!171272 b!171269) bm!17442))

(declare-fun b_lambda!6903 () Bool)

(assert (=> (not b_lambda!6903) (not b!171277)))

(declare-fun tb!2767 () Bool)

(declare-fun t!7001 () Bool)

(assert (=> (and b!170884 (= (defaultEntry!3555 thiss!1248) (defaultEntry!3555 lt!85045)) t!7001) tb!2767))

(declare-fun result!4567 () Bool)

(assert (=> tb!2767 (= result!4567 tp_is_empty!4005)))

(assert (=> b!171277 t!7001))

(declare-fun b_and!10663 () Bool)

(assert (= b_and!10661 (and (=> t!7001 result!4567) b_and!10663)))

(assert (=> b!171270 m!199545))

(assert (=> b!171270 m!199545))

(declare-fun m!199617 () Bool)

(assert (=> b!171270 m!199617))

(declare-fun m!199619 () Bool)

(assert (=> bm!17446 m!199619))

(assert (=> b!171274 m!199545))

(assert (=> b!171274 m!199545))

(assert (=> b!171274 m!199547))

(declare-fun m!199621 () Bool)

(assert (=> bm!17445 m!199621))

(declare-fun m!199623 () Bool)

(assert (=> bm!17442 m!199623))

(declare-fun m!199625 () Bool)

(assert (=> b!171262 m!199625))

(declare-fun m!199627 () Bool)

(assert (=> b!171262 m!199627))

(declare-fun m!199629 () Bool)

(assert (=> b!171262 m!199629))

(declare-fun m!199631 () Bool)

(assert (=> b!171262 m!199631))

(declare-fun m!199633 () Bool)

(assert (=> b!171262 m!199633))

(assert (=> b!171262 m!199545))

(declare-fun m!199635 () Bool)

(assert (=> b!171262 m!199635))

(declare-fun m!199637 () Bool)

(assert (=> b!171262 m!199637))

(declare-fun m!199639 () Bool)

(assert (=> b!171262 m!199639))

(declare-fun m!199641 () Bool)

(assert (=> b!171262 m!199641))

(declare-fun m!199643 () Bool)

(assert (=> b!171262 m!199643))

(assert (=> b!171262 m!199629))

(declare-fun m!199645 () Bool)

(assert (=> b!171262 m!199645))

(declare-fun m!199647 () Bool)

(assert (=> b!171262 m!199647))

(declare-fun m!199649 () Bool)

(assert (=> b!171262 m!199649))

(assert (=> b!171262 m!199633))

(declare-fun m!199651 () Bool)

(assert (=> b!171262 m!199651))

(assert (=> b!171262 m!199645))

(declare-fun m!199653 () Bool)

(assert (=> b!171262 m!199653))

(declare-fun m!199655 () Bool)

(assert (=> b!171262 m!199655))

(assert (=> b!171262 m!199639))

(declare-fun m!199657 () Bool)

(assert (=> b!171260 m!199657))

(assert (=> b!171278 m!199545))

(assert (=> b!171278 m!199545))

(assert (=> b!171278 m!199547))

(declare-fun m!199659 () Bool)

(assert (=> b!171277 m!199659))

(assert (=> b!171277 m!199545))

(declare-fun m!199661 () Bool)

(assert (=> b!171277 m!199661))

(assert (=> b!171277 m!199545))

(declare-fun m!199663 () Bool)

(assert (=> b!171277 m!199663))

(assert (=> b!171277 m!199659))

(assert (=> b!171277 m!199661))

(declare-fun m!199665 () Bool)

(assert (=> b!171277 m!199665))

(assert (=> d!51859 m!199601))

(declare-fun m!199667 () Bool)

(assert (=> b!171265 m!199667))

(assert (=> bm!17444 m!199649))

(declare-fun m!199669 () Bool)

(assert (=> b!171275 m!199669))

(assert (=> d!51785 d!51859))

(declare-fun d!51861 () Bool)

(assert (=> d!51861 (= (apply!129 lt!85130 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (get!1939 (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7054 () Bool)

(assert (= bs!7054 d!51861))

(assert (=> bs!7054 m!199241))

(assert (=> bs!7054 m!199499))

(assert (=> bs!7054 m!199499))

(declare-fun m!199671 () Bool)

(assert (=> bs!7054 m!199671))

(assert (=> b!171008 d!51861))

(assert (=> b!171008 d!51851))

(declare-fun d!51863 () Bool)

(declare-fun e!113056 () Bool)

(assert (=> d!51863 e!113056))

(declare-fun res!81414 () Bool)

(assert (=> d!51863 (=> (not res!81414) (not e!113056))))

(declare-fun lt!85287 () ListLongMap!2161)

(assert (=> d!51863 (= res!81414 (contains!1144 lt!85287 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85288 () List!2193)

(assert (=> d!51863 (= lt!85287 (ListLongMap!2162 lt!85288))))

(declare-fun lt!85289 () Unit!5252)

(declare-fun lt!85286 () Unit!5252)

(assert (=> d!51863 (= lt!85289 lt!85286)))

(assert (=> d!51863 (= (getValueByKey!184 lt!85288 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(assert (=> d!51863 (= lt!85286 (lemmaContainsTupThenGetReturnValue!97 lt!85288 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(assert (=> d!51863 (= lt!85288 (insertStrictlySorted!100 (toList!1096 lt!85115) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(assert (=> d!51863 (= (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) lt!85287)))

(declare-fun b!171280 () Bool)

(declare-fun res!81415 () Bool)

(assert (=> b!171280 (=> (not res!81415) (not e!113056))))

(assert (=> b!171280 (= res!81415 (= (getValueByKey!184 (toList!1096 lt!85287) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(declare-fun b!171281 () Bool)

(assert (=> b!171281 (= e!113056 (contains!1146 (toList!1096 lt!85287) (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))

(assert (= (and d!51863 res!81414) b!171280))

(assert (= (and b!171280 res!81415) b!171281))

(declare-fun m!199673 () Bool)

(assert (=> d!51863 m!199673))

(declare-fun m!199675 () Bool)

(assert (=> d!51863 m!199675))

(declare-fun m!199677 () Bool)

(assert (=> d!51863 m!199677))

(declare-fun m!199679 () Bool)

(assert (=> d!51863 m!199679))

(declare-fun m!199681 () Bool)

(assert (=> b!171280 m!199681))

(declare-fun m!199683 () Bool)

(assert (=> b!171281 m!199683))

(assert (=> b!170961 d!51863))

(declare-fun d!51865 () Bool)

(declare-fun e!113057 () Bool)

(assert (=> d!51865 e!113057))

(declare-fun res!81416 () Bool)

(assert (=> d!51865 (=> (not res!81416) (not e!113057))))

(declare-fun lt!85291 () ListLongMap!2161)

(assert (=> d!51865 (= res!81416 (contains!1144 lt!85291 (_1!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun lt!85292 () List!2193)

(assert (=> d!51865 (= lt!85291 (ListLongMap!2162 lt!85292))))

(declare-fun lt!85293 () Unit!5252)

(declare-fun lt!85290 () Unit!5252)

(assert (=> d!51865 (= lt!85293 lt!85290)))

(assert (=> d!51865 (= (getValueByKey!184 lt!85292 (_1!1628 (tuple2!3235 lt!85107 v!309))) (Some!189 (_2!1628 (tuple2!3235 lt!85107 v!309))))))

(assert (=> d!51865 (= lt!85290 (lemmaContainsTupThenGetReturnValue!97 lt!85292 (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309))))))

(assert (=> d!51865 (= lt!85292 (insertStrictlySorted!100 (toList!1096 lt!85101) (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309))))))

(assert (=> d!51865 (= (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)) lt!85291)))

(declare-fun b!171282 () Bool)

(declare-fun res!81417 () Bool)

(assert (=> b!171282 (=> (not res!81417) (not e!113057))))

(assert (=> b!171282 (= res!81417 (= (getValueByKey!184 (toList!1096 lt!85291) (_1!1628 (tuple2!3235 lt!85107 v!309))) (Some!189 (_2!1628 (tuple2!3235 lt!85107 v!309)))))))

(declare-fun b!171283 () Bool)

(assert (=> b!171283 (= e!113057 (contains!1146 (toList!1096 lt!85291) (tuple2!3235 lt!85107 v!309)))))

(assert (= (and d!51865 res!81416) b!171282))

(assert (= (and b!171282 res!81417) b!171283))

(declare-fun m!199685 () Bool)

(assert (=> d!51865 m!199685))

(declare-fun m!199687 () Bool)

(assert (=> d!51865 m!199687))

(declare-fun m!199689 () Bool)

(assert (=> d!51865 m!199689))

(declare-fun m!199691 () Bool)

(assert (=> d!51865 m!199691))

(declare-fun m!199693 () Bool)

(assert (=> b!171282 m!199693))

(declare-fun m!199695 () Bool)

(assert (=> b!171283 m!199695))

(assert (=> b!170961 d!51865))

(declare-fun d!51867 () Bool)

(assert (=> d!51867 (contains!1144 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)) lt!85102)))

(declare-fun lt!85296 () Unit!5252)

(declare-fun choose!925 (ListLongMap!2161 (_ BitVec 64) V!4987 (_ BitVec 64)) Unit!5252)

(assert (=> d!51867 (= lt!85296 (choose!925 lt!85119 lt!85104 v!309 lt!85102))))

(assert (=> d!51867 (contains!1144 lt!85119 lt!85102)))

(assert (=> d!51867 (= (addStillContains!105 lt!85119 lt!85104 v!309 lt!85102) lt!85296)))

(declare-fun bs!7055 () Bool)

(assert (= bs!7055 d!51867))

(assert (=> bs!7055 m!199267))

(assert (=> bs!7055 m!199267))

(assert (=> bs!7055 m!199269))

(declare-fun m!199697 () Bool)

(assert (=> bs!7055 m!199697))

(declare-fun m!199699 () Bool)

(assert (=> bs!7055 m!199699))

(assert (=> b!170961 d!51867))

(assert (=> b!170961 d!51817))

(declare-fun d!51869 () Bool)

(assert (=> d!51869 (= (apply!129 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) lt!85103) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) lt!85103)))))

(declare-fun bs!7056 () Bool)

(assert (= bs!7056 d!51869))

(declare-fun m!199701 () Bool)

(assert (=> bs!7056 m!199701))

(assert (=> bs!7056 m!199701))

(declare-fun m!199703 () Bool)

(assert (=> bs!7056 m!199703))

(assert (=> b!170961 d!51869))

(declare-fun d!51871 () Bool)

(assert (=> d!51871 (= (apply!129 lt!85111 lt!85103) (get!1939 (getValueByKey!184 (toList!1096 lt!85111) lt!85103)))))

(declare-fun bs!7057 () Bool)

(assert (= bs!7057 d!51871))

(declare-fun m!199705 () Bool)

(assert (=> bs!7057 m!199705))

(assert (=> bs!7057 m!199705))

(declare-fun m!199707 () Bool)

(assert (=> bs!7057 m!199707))

(assert (=> b!170961 d!51871))

(declare-fun d!51873 () Bool)

(assert (=> d!51873 (= (apply!129 lt!85101 lt!85116) (get!1939 (getValueByKey!184 (toList!1096 lt!85101) lt!85116)))))

(declare-fun bs!7058 () Bool)

(assert (= bs!7058 d!51873))

(declare-fun m!199709 () Bool)

(assert (=> bs!7058 m!199709))

(assert (=> bs!7058 m!199709))

(declare-fun m!199711 () Bool)

(assert (=> bs!7058 m!199711))

(assert (=> b!170961 d!51873))

(declare-fun d!51875 () Bool)

(declare-fun e!113059 () Bool)

(assert (=> d!51875 e!113059))

(declare-fun res!81418 () Bool)

(assert (=> d!51875 (=> res!81418 e!113059)))

(declare-fun lt!85299 () Bool)

(assert (=> d!51875 (= res!81418 (not lt!85299))))

(declare-fun lt!85297 () Bool)

(assert (=> d!51875 (= lt!85299 lt!85297)))

(declare-fun lt!85298 () Unit!5252)

(declare-fun e!113058 () Unit!5252)

(assert (=> d!51875 (= lt!85298 e!113058)))

(declare-fun c!30595 () Bool)

(assert (=> d!51875 (= c!30595 lt!85297)))

(assert (=> d!51875 (= lt!85297 (containsKey!188 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102))))

(assert (=> d!51875 (= (contains!1144 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)) lt!85102) lt!85299)))

(declare-fun b!171285 () Bool)

(declare-fun lt!85300 () Unit!5252)

(assert (=> b!171285 (= e!113058 lt!85300)))

(assert (=> b!171285 (= lt!85300 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102))))

(assert (=> b!171285 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102))))

(declare-fun b!171286 () Bool)

(declare-fun Unit!5264 () Unit!5252)

(assert (=> b!171286 (= e!113058 Unit!5264)))

(declare-fun b!171287 () Bool)

(assert (=> b!171287 (= e!113059 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102)))))

(assert (= (and d!51875 c!30595) b!171285))

(assert (= (and d!51875 (not c!30595)) b!171286))

(assert (= (and d!51875 (not res!81418)) b!171287))

(declare-fun m!199713 () Bool)

(assert (=> d!51875 m!199713))

(declare-fun m!199715 () Bool)

(assert (=> b!171285 m!199715))

(declare-fun m!199717 () Bool)

(assert (=> b!171285 m!199717))

(assert (=> b!171285 m!199717))

(declare-fun m!199719 () Bool)

(assert (=> b!171285 m!199719))

(assert (=> b!171287 m!199717))

(assert (=> b!171287 m!199717))

(assert (=> b!171287 m!199719))

(assert (=> b!170961 d!51875))

(declare-fun d!51877 () Bool)

(declare-fun e!113060 () Bool)

(assert (=> d!51877 e!113060))

(declare-fun res!81419 () Bool)

(assert (=> d!51877 (=> (not res!81419) (not e!113060))))

(declare-fun lt!85302 () ListLongMap!2161)

(assert (=> d!51877 (= res!81419 (contains!1144 lt!85302 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85303 () List!2193)

(assert (=> d!51877 (= lt!85302 (ListLongMap!2162 lt!85303))))

(declare-fun lt!85304 () Unit!5252)

(declare-fun lt!85301 () Unit!5252)

(assert (=> d!51877 (= lt!85304 lt!85301)))

(assert (=> d!51877 (= (getValueByKey!184 lt!85303 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(assert (=> d!51877 (= lt!85301 (lemmaContainsTupThenGetReturnValue!97 lt!85303 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(assert (=> d!51877 (= lt!85303 (insertStrictlySorted!100 (toList!1096 lt!85111) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(assert (=> d!51877 (= (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) lt!85302)))

(declare-fun b!171288 () Bool)

(declare-fun res!81420 () Bool)

(assert (=> b!171288 (=> (not res!81420) (not e!113060))))

(assert (=> b!171288 (= res!81420 (= (getValueByKey!184 (toList!1096 lt!85302) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(declare-fun b!171289 () Bool)

(assert (=> b!171289 (= e!113060 (contains!1146 (toList!1096 lt!85302) (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))

(assert (= (and d!51877 res!81419) b!171288))

(assert (= (and b!171288 res!81420) b!171289))

(declare-fun m!199721 () Bool)

(assert (=> d!51877 m!199721))

(declare-fun m!199723 () Bool)

(assert (=> d!51877 m!199723))

(declare-fun m!199725 () Bool)

(assert (=> d!51877 m!199725))

(declare-fun m!199727 () Bool)

(assert (=> d!51877 m!199727))

(declare-fun m!199729 () Bool)

(assert (=> b!171288 m!199729))

(declare-fun m!199731 () Bool)

(assert (=> b!171289 m!199731))

(assert (=> b!170961 d!51877))

(declare-fun d!51879 () Bool)

(assert (=> d!51879 (= (apply!129 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) lt!85112) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) lt!85112)))))

(declare-fun bs!7059 () Bool)

(assert (= bs!7059 d!51879))

(declare-fun m!199733 () Bool)

(assert (=> bs!7059 m!199733))

(assert (=> bs!7059 m!199733))

(declare-fun m!199735 () Bool)

(assert (=> bs!7059 m!199735))

(assert (=> b!170961 d!51879))

(declare-fun d!51881 () Bool)

(assert (=> d!51881 (= (apply!129 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)) lt!85116) (apply!129 lt!85101 lt!85116))))

(declare-fun lt!85307 () Unit!5252)

(declare-fun choose!926 (ListLongMap!2161 (_ BitVec 64) V!4987 (_ BitVec 64)) Unit!5252)

(assert (=> d!51881 (= lt!85307 (choose!926 lt!85101 lt!85107 v!309 lt!85116))))

(declare-fun e!113063 () Bool)

(assert (=> d!51881 e!113063))

(declare-fun res!81423 () Bool)

(assert (=> d!51881 (=> (not res!81423) (not e!113063))))

(assert (=> d!51881 (= res!81423 (contains!1144 lt!85101 lt!85116))))

(assert (=> d!51881 (= (addApplyDifferent!105 lt!85101 lt!85107 v!309 lt!85116) lt!85307)))

(declare-fun b!171293 () Bool)

(assert (=> b!171293 (= e!113063 (not (= lt!85116 lt!85107)))))

(assert (= (and d!51881 res!81423) b!171293))

(assert (=> d!51881 m!199255))

(declare-fun m!199737 () Bool)

(assert (=> d!51881 m!199737))

(assert (=> d!51881 m!199257))

(assert (=> d!51881 m!199259))

(declare-fun m!199739 () Bool)

(assert (=> d!51881 m!199739))

(assert (=> d!51881 m!199257))

(assert (=> b!170961 d!51881))

(declare-fun d!51883 () Bool)

(assert (=> d!51883 (= (apply!129 lt!85115 lt!85112) (get!1939 (getValueByKey!184 (toList!1096 lt!85115) lt!85112)))))

(declare-fun bs!7060 () Bool)

(assert (= bs!7060 d!51883))

(declare-fun m!199741 () Bool)

(assert (=> bs!7060 m!199741))

(assert (=> bs!7060 m!199741))

(declare-fun m!199743 () Bool)

(assert (=> bs!7060 m!199743))

(assert (=> b!170961 d!51883))

(declare-fun d!51885 () Bool)

(declare-fun e!113064 () Bool)

(assert (=> d!51885 e!113064))

(declare-fun res!81424 () Bool)

(assert (=> d!51885 (=> (not res!81424) (not e!113064))))

(declare-fun lt!85309 () ListLongMap!2161)

(assert (=> d!51885 (= res!81424 (contains!1144 lt!85309 (_1!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun lt!85310 () List!2193)

(assert (=> d!51885 (= lt!85309 (ListLongMap!2162 lt!85310))))

(declare-fun lt!85311 () Unit!5252)

(declare-fun lt!85308 () Unit!5252)

(assert (=> d!51885 (= lt!85311 lt!85308)))

(assert (=> d!51885 (= (getValueByKey!184 lt!85310 (_1!1628 (tuple2!3235 lt!85104 v!309))) (Some!189 (_2!1628 (tuple2!3235 lt!85104 v!309))))))

(assert (=> d!51885 (= lt!85308 (lemmaContainsTupThenGetReturnValue!97 lt!85310 (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309))))))

(assert (=> d!51885 (= lt!85310 (insertStrictlySorted!100 (toList!1096 lt!85119) (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309))))))

(assert (=> d!51885 (= (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)) lt!85309)))

(declare-fun b!171294 () Bool)

(declare-fun res!81425 () Bool)

(assert (=> b!171294 (=> (not res!81425) (not e!113064))))

(assert (=> b!171294 (= res!81425 (= (getValueByKey!184 (toList!1096 lt!85309) (_1!1628 (tuple2!3235 lt!85104 v!309))) (Some!189 (_2!1628 (tuple2!3235 lt!85104 v!309)))))))

(declare-fun b!171295 () Bool)

(assert (=> b!171295 (= e!113064 (contains!1146 (toList!1096 lt!85309) (tuple2!3235 lt!85104 v!309)))))

(assert (= (and d!51885 res!81424) b!171294))

(assert (= (and b!171294 res!81425) b!171295))

(declare-fun m!199745 () Bool)

(assert (=> d!51885 m!199745))

(declare-fun m!199747 () Bool)

(assert (=> d!51885 m!199747))

(declare-fun m!199749 () Bool)

(assert (=> d!51885 m!199749))

(declare-fun m!199751 () Bool)

(assert (=> d!51885 m!199751))

(declare-fun m!199753 () Bool)

(assert (=> b!171294 m!199753))

(declare-fun m!199755 () Bool)

(assert (=> b!171295 m!199755))

(assert (=> b!170961 d!51885))

(declare-fun d!51887 () Bool)

(assert (=> d!51887 (= (apply!129 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) lt!85112) (apply!129 lt!85115 lt!85112))))

(declare-fun lt!85312 () Unit!5252)

(assert (=> d!51887 (= lt!85312 (choose!926 lt!85115 lt!85106 (minValue!3398 thiss!1248) lt!85112))))

(declare-fun e!113065 () Bool)

(assert (=> d!51887 e!113065))

(declare-fun res!81426 () Bool)

(assert (=> d!51887 (=> (not res!81426) (not e!113065))))

(assert (=> d!51887 (= res!81426 (contains!1144 lt!85115 lt!85112))))

(assert (=> d!51887 (= (addApplyDifferent!105 lt!85115 lt!85106 (minValue!3398 thiss!1248) lt!85112) lt!85312)))

(declare-fun b!171296 () Bool)

(assert (=> b!171296 (= e!113065 (not (= lt!85112 lt!85106)))))

(assert (= (and d!51887 res!81426) b!171296))

(assert (=> d!51887 m!199275))

(declare-fun m!199757 () Bool)

(assert (=> d!51887 m!199757))

(assert (=> d!51887 m!199273))

(assert (=> d!51887 m!199281))

(declare-fun m!199759 () Bool)

(assert (=> d!51887 m!199759))

(assert (=> d!51887 m!199273))

(assert (=> b!170961 d!51887))

(declare-fun d!51889 () Bool)

(assert (=> d!51889 (= (apply!129 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)) lt!85116) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309))) lt!85116)))))

(declare-fun bs!7061 () Bool)

(assert (= bs!7061 d!51889))

(declare-fun m!199761 () Bool)

(assert (=> bs!7061 m!199761))

(assert (=> bs!7061 m!199761))

(declare-fun m!199763 () Bool)

(assert (=> bs!7061 m!199763))

(assert (=> b!170961 d!51889))

(declare-fun d!51891 () Bool)

(assert (=> d!51891 (= (apply!129 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) lt!85103) (apply!129 lt!85111 lt!85103))))

(declare-fun lt!85313 () Unit!5252)

(assert (=> d!51891 (= lt!85313 (choose!926 lt!85111 lt!85110 (minValue!3398 thiss!1248) lt!85103))))

(declare-fun e!113066 () Bool)

(assert (=> d!51891 e!113066))

(declare-fun res!81427 () Bool)

(assert (=> d!51891 (=> (not res!81427) (not e!113066))))

(assert (=> d!51891 (= res!81427 (contains!1144 lt!85111 lt!85103))))

(assert (=> d!51891 (= (addApplyDifferent!105 lt!85111 lt!85110 (minValue!3398 thiss!1248) lt!85103) lt!85313)))

(declare-fun b!171297 () Bool)

(assert (=> b!171297 (= e!113066 (not (= lt!85103 lt!85110)))))

(assert (= (and d!51891 res!81427) b!171297))

(assert (=> d!51891 m!199271))

(declare-fun m!199765 () Bool)

(assert (=> d!51891 m!199765))

(assert (=> d!51891 m!199261))

(assert (=> d!51891 m!199279))

(declare-fun m!199767 () Bool)

(assert (=> d!51891 m!199767))

(assert (=> d!51891 m!199261))

(assert (=> b!170961 d!51891))

(declare-fun d!51893 () Bool)

(declare-fun e!113068 () Bool)

(assert (=> d!51893 e!113068))

(declare-fun res!81428 () Bool)

(assert (=> d!51893 (=> res!81428 e!113068)))

(declare-fun lt!85316 () Bool)

(assert (=> d!51893 (= res!81428 (not lt!85316))))

(declare-fun lt!85314 () Bool)

(assert (=> d!51893 (= lt!85316 lt!85314)))

(declare-fun lt!85315 () Unit!5252)

(declare-fun e!113067 () Unit!5252)

(assert (=> d!51893 (= lt!85315 e!113067)))

(declare-fun c!30596 () Bool)

(assert (=> d!51893 (= c!30596 lt!85314)))

(assert (=> d!51893 (= lt!85314 (containsKey!188 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51893 (= (contains!1144 lt!85105 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85316)))

(declare-fun b!171298 () Bool)

(declare-fun lt!85317 () Unit!5252)

(assert (=> b!171298 (= e!113067 lt!85317)))

(assert (=> b!171298 (= lt!85317 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171298 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171299 () Bool)

(declare-fun Unit!5265 () Unit!5252)

(assert (=> b!171299 (= e!113067 Unit!5265)))

(declare-fun b!171300 () Bool)

(assert (=> b!171300 (= e!113068 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51893 c!30596) b!171298))

(assert (= (and d!51893 (not c!30596)) b!171299))

(assert (= (and d!51893 (not res!81428)) b!171300))

(declare-fun m!199769 () Bool)

(assert (=> d!51893 m!199769))

(declare-fun m!199771 () Bool)

(assert (=> b!171298 m!199771))

(declare-fun m!199773 () Bool)

(assert (=> b!171298 m!199773))

(assert (=> b!171298 m!199773))

(declare-fun m!199775 () Bool)

(assert (=> b!171298 m!199775))

(assert (=> b!171300 m!199773))

(assert (=> b!171300 m!199773))

(assert (=> b!171300 m!199775))

(assert (=> bm!17407 d!51893))

(assert (=> b!170977 d!51833))

(declare-fun d!51895 () Bool)

(assert (=> d!51895 (= (apply!129 lt!85130 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1939 (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7062 () Bool)

(assert (= bs!7062 d!51895))

(assert (=> bs!7062 m!199463))

(assert (=> bs!7062 m!199463))

(declare-fun m!199777 () Bool)

(assert (=> bs!7062 m!199777))

(assert (=> b!171006 d!51895))

(declare-fun d!51897 () Bool)

(assert (=> d!51897 (= (apply!129 lt!85105 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1939 (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7063 () Bool)

(assert (= bs!7063 d!51897))

(assert (=> bs!7063 m!199773))

(assert (=> bs!7063 m!199773))

(declare-fun m!199779 () Bool)

(assert (=> bs!7063 m!199779))

(assert (=> b!170959 d!51897))

(declare-fun d!51899 () Bool)

(declare-fun lt!85318 () Bool)

(assert (=> d!51899 (= lt!85318 (select (content!147 (toList!1096 lt!85155)) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!113070 () Bool)

(assert (=> d!51899 (= lt!85318 e!113070)))

(declare-fun res!81429 () Bool)

(assert (=> d!51899 (=> (not res!81429) (not e!113070))))

(assert (=> d!51899 (= res!81429 ((_ is Cons!2189) (toList!1096 lt!85155)))))

(assert (=> d!51899 (= (contains!1146 (toList!1096 lt!85155) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85318)))

(declare-fun b!171301 () Bool)

(declare-fun e!113069 () Bool)

(assert (=> b!171301 (= e!113070 e!113069)))

(declare-fun res!81430 () Bool)

(assert (=> b!171301 (=> res!81430 e!113069)))

(assert (=> b!171301 (= res!81430 (= (h!2806 (toList!1096 lt!85155)) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!171302 () Bool)

(assert (=> b!171302 (= e!113069 (contains!1146 (t!6995 (toList!1096 lt!85155)) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!51899 res!81429) b!171301))

(assert (= (and b!171301 (not res!81430)) b!171302))

(declare-fun m!199781 () Bool)

(assert (=> d!51899 m!199781))

(declare-fun m!199783 () Bool)

(assert (=> d!51899 m!199783))

(declare-fun m!199785 () Bool)

(assert (=> b!171302 m!199785))

(assert (=> b!171016 d!51899))

(declare-fun d!51901 () Bool)

(declare-fun e!113071 () Bool)

(assert (=> d!51901 e!113071))

(declare-fun res!81431 () Bool)

(assert (=> d!51901 (=> (not res!81431) (not e!113071))))

(declare-fun lt!85320 () ListLongMap!2161)

(assert (=> d!51901 (= res!81431 (contains!1144 lt!85320 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85321 () List!2193)

(assert (=> d!51901 (= lt!85320 (ListLongMap!2162 lt!85321))))

(declare-fun lt!85322 () Unit!5252)

(declare-fun lt!85319 () Unit!5252)

(assert (=> d!51901 (= lt!85322 lt!85319)))

(assert (=> d!51901 (= (getValueByKey!184 lt!85321 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> d!51901 (= lt!85319 (lemmaContainsTupThenGetReturnValue!97 lt!85321 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> d!51901 (= lt!85321 (insertStrictlySorted!100 (toList!1096 call!17406) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> d!51901 (= (+!244 call!17406 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) lt!85320)))

(declare-fun b!171303 () Bool)

(declare-fun res!81432 () Bool)

(assert (=> b!171303 (=> (not res!81432) (not e!113071))))

(assert (=> b!171303 (= res!81432 (= (getValueByKey!184 (toList!1096 lt!85320) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171304 () Bool)

(assert (=> b!171304 (= e!113071 (contains!1146 (toList!1096 lt!85320) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(assert (= (and d!51901 res!81431) b!171303))

(assert (= (and b!171303 res!81432) b!171304))

(declare-fun m!199787 () Bool)

(assert (=> d!51901 m!199787))

(declare-fun m!199789 () Bool)

(assert (=> d!51901 m!199789))

(declare-fun m!199791 () Bool)

(assert (=> d!51901 m!199791))

(declare-fun m!199793 () Bool)

(assert (=> d!51901 m!199793))

(declare-fun m!199795 () Bool)

(assert (=> b!171303 m!199795))

(declare-fun m!199797 () Bool)

(assert (=> b!171304 m!199797))

(assert (=> b!170964 d!51901))

(declare-fun d!51903 () Bool)

(assert (=> d!51903 (contains!1144 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) lt!85127)))

(declare-fun lt!85323 () Unit!5252)

(assert (=> d!51903 (= lt!85323 (choose!925 lt!85144 lt!85129 (zeroValue!3398 thiss!1248) lt!85127))))

(assert (=> d!51903 (contains!1144 lt!85144 lt!85127)))

(assert (=> d!51903 (= (addStillContains!105 lt!85144 lt!85129 (zeroValue!3398 thiss!1248) lt!85127) lt!85323)))

(declare-fun bs!7064 () Bool)

(assert (= bs!7064 d!51903))

(assert (=> bs!7064 m!199333))

(assert (=> bs!7064 m!199333))

(assert (=> bs!7064 m!199335))

(declare-fun m!199799 () Bool)

(assert (=> bs!7064 m!199799))

(declare-fun m!199801 () Bool)

(assert (=> bs!7064 m!199801))

(assert (=> b!170993 d!51903))

(declare-fun d!51905 () Bool)

(assert (=> d!51905 (= (apply!129 lt!85126 lt!85141) (get!1939 (getValueByKey!184 (toList!1096 lt!85126) lt!85141)))))

(declare-fun bs!7065 () Bool)

(assert (= bs!7065 d!51905))

(declare-fun m!199803 () Bool)

(assert (=> bs!7065 m!199803))

(assert (=> bs!7065 m!199803))

(declare-fun m!199805 () Bool)

(assert (=> bs!7065 m!199805))

(assert (=> b!170993 d!51905))

(declare-fun d!51907 () Bool)

(declare-fun e!113073 () Bool)

(assert (=> d!51907 e!113073))

(declare-fun res!81433 () Bool)

(assert (=> d!51907 (=> res!81433 e!113073)))

(declare-fun lt!85326 () Bool)

(assert (=> d!51907 (= res!81433 (not lt!85326))))

(declare-fun lt!85324 () Bool)

(assert (=> d!51907 (= lt!85326 lt!85324)))

(declare-fun lt!85325 () Unit!5252)

(declare-fun e!113072 () Unit!5252)

(assert (=> d!51907 (= lt!85325 e!113072)))

(declare-fun c!30597 () Bool)

(assert (=> d!51907 (= c!30597 lt!85324)))

(assert (=> d!51907 (= lt!85324 (containsKey!188 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127))))

(assert (=> d!51907 (= (contains!1144 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) lt!85127) lt!85326)))

(declare-fun b!171305 () Bool)

(declare-fun lt!85327 () Unit!5252)

(assert (=> b!171305 (= e!113072 lt!85327)))

(assert (=> b!171305 (= lt!85327 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127))))

(assert (=> b!171305 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127))))

(declare-fun b!171306 () Bool)

(declare-fun Unit!5266 () Unit!5252)

(assert (=> b!171306 (= e!113072 Unit!5266)))

(declare-fun b!171307 () Bool)

(assert (=> b!171307 (= e!113073 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127)))))

(assert (= (and d!51907 c!30597) b!171305))

(assert (= (and d!51907 (not c!30597)) b!171306))

(assert (= (and d!51907 (not res!81433)) b!171307))

(declare-fun m!199807 () Bool)

(assert (=> d!51907 m!199807))

(declare-fun m!199809 () Bool)

(assert (=> b!171305 m!199809))

(declare-fun m!199811 () Bool)

(assert (=> b!171305 m!199811))

(assert (=> b!171305 m!199811))

(declare-fun m!199813 () Bool)

(assert (=> b!171305 m!199813))

(assert (=> b!171307 m!199811))

(assert (=> b!171307 m!199811))

(assert (=> b!171307 m!199813))

(assert (=> b!170993 d!51907))

(declare-fun d!51909 () Bool)

(assert (=> d!51909 (= (apply!129 lt!85136 lt!85128) (get!1939 (getValueByKey!184 (toList!1096 lt!85136) lt!85128)))))

(declare-fun bs!7066 () Bool)

(assert (= bs!7066 d!51909))

(declare-fun m!199815 () Bool)

(assert (=> bs!7066 m!199815))

(assert (=> bs!7066 m!199815))

(declare-fun m!199817 () Bool)

(assert (=> bs!7066 m!199817))

(assert (=> b!170993 d!51909))

(declare-fun d!51911 () Bool)

(assert (=> d!51911 (= (apply!129 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) lt!85128) (apply!129 lt!85136 lt!85128))))

(declare-fun lt!85328 () Unit!5252)

(assert (=> d!51911 (= lt!85328 (choose!926 lt!85136 lt!85135 (minValue!3398 thiss!1248) lt!85128))))

(declare-fun e!113074 () Bool)

(assert (=> d!51911 e!113074))

(declare-fun res!81434 () Bool)

(assert (=> d!51911 (=> (not res!81434) (not e!113074))))

(assert (=> d!51911 (= res!81434 (contains!1144 lt!85136 lt!85128))))

(assert (=> d!51911 (= (addApplyDifferent!105 lt!85136 lt!85135 (minValue!3398 thiss!1248) lt!85128) lt!85328)))

(declare-fun b!171308 () Bool)

(assert (=> b!171308 (= e!113074 (not (= lt!85128 lt!85135)))))

(assert (= (and d!51911 res!81434) b!171308))

(assert (=> d!51911 m!199337))

(declare-fun m!199819 () Bool)

(assert (=> d!51911 m!199819))

(assert (=> d!51911 m!199327))

(assert (=> d!51911 m!199345))

(declare-fun m!199821 () Bool)

(assert (=> d!51911 m!199821))

(assert (=> d!51911 m!199327))

(assert (=> b!170993 d!51911))

(declare-fun d!51913 () Bool)

(declare-fun e!113075 () Bool)

(assert (=> d!51913 e!113075))

(declare-fun res!81435 () Bool)

(assert (=> d!51913 (=> (not res!81435) (not e!113075))))

(declare-fun lt!85330 () ListLongMap!2161)

(assert (=> d!51913 (= res!81435 (contains!1144 lt!85330 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85331 () List!2193)

(assert (=> d!51913 (= lt!85330 (ListLongMap!2162 lt!85331))))

(declare-fun lt!85332 () Unit!5252)

(declare-fun lt!85329 () Unit!5252)

(assert (=> d!51913 (= lt!85332 lt!85329)))

(assert (=> d!51913 (= (getValueByKey!184 lt!85331 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(assert (=> d!51913 (= lt!85329 (lemmaContainsTupThenGetReturnValue!97 lt!85331 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(assert (=> d!51913 (= lt!85331 (insertStrictlySorted!100 (toList!1096 lt!85136) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(assert (=> d!51913 (= (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) lt!85330)))

(declare-fun b!171309 () Bool)

(declare-fun res!81436 () Bool)

(assert (=> b!171309 (=> (not res!81436) (not e!113075))))

(assert (=> b!171309 (= res!81436 (= (getValueByKey!184 (toList!1096 lt!85330) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(declare-fun b!171310 () Bool)

(assert (=> b!171310 (= e!113075 (contains!1146 (toList!1096 lt!85330) (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))

(assert (= (and d!51913 res!81435) b!171309))

(assert (= (and b!171309 res!81436) b!171310))

(declare-fun m!199823 () Bool)

(assert (=> d!51913 m!199823))

(declare-fun m!199825 () Bool)

(assert (=> d!51913 m!199825))

(declare-fun m!199827 () Bool)

(assert (=> d!51913 m!199827))

(declare-fun m!199829 () Bool)

(assert (=> d!51913 m!199829))

(declare-fun m!199831 () Bool)

(assert (=> b!171309 m!199831))

(declare-fun m!199833 () Bool)

(assert (=> b!171310 m!199833))

(assert (=> b!170993 d!51913))

(declare-fun d!51915 () Bool)

(assert (=> d!51915 (= (apply!129 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) lt!85137) (apply!129 lt!85140 lt!85137))))

(declare-fun lt!85333 () Unit!5252)

(assert (=> d!51915 (= lt!85333 (choose!926 lt!85140 lt!85131 (minValue!3398 thiss!1248) lt!85137))))

(declare-fun e!113076 () Bool)

(assert (=> d!51915 e!113076))

(declare-fun res!81437 () Bool)

(assert (=> d!51915 (=> (not res!81437) (not e!113076))))

(assert (=> d!51915 (= res!81437 (contains!1144 lt!85140 lt!85137))))

(assert (=> d!51915 (= (addApplyDifferent!105 lt!85140 lt!85131 (minValue!3398 thiss!1248) lt!85137) lt!85333)))

(declare-fun b!171311 () Bool)

(assert (=> b!171311 (= e!113076 (not (= lt!85137 lt!85131)))))

(assert (= (and d!51915 res!81437) b!171311))

(assert (=> d!51915 m!199341))

(declare-fun m!199835 () Bool)

(assert (=> d!51915 m!199835))

(assert (=> d!51915 m!199339))

(assert (=> d!51915 m!199347))

(declare-fun m!199837 () Bool)

(assert (=> d!51915 m!199837))

(assert (=> d!51915 m!199339))

(assert (=> b!170993 d!51915))

(declare-fun d!51917 () Bool)

(assert (=> d!51917 (= (apply!129 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) lt!85137) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) lt!85137)))))

(declare-fun bs!7067 () Bool)

(assert (= bs!7067 d!51917))

(declare-fun m!199839 () Bool)

(assert (=> bs!7067 m!199839))

(assert (=> bs!7067 m!199839))

(declare-fun m!199841 () Bool)

(assert (=> bs!7067 m!199841))

(assert (=> b!170993 d!51917))

(declare-fun d!51919 () Bool)

(declare-fun e!113077 () Bool)

(assert (=> d!51919 e!113077))

(declare-fun res!81438 () Bool)

(assert (=> d!51919 (=> (not res!81438) (not e!113077))))

(declare-fun lt!85335 () ListLongMap!2161)

(assert (=> d!51919 (= res!81438 (contains!1144 lt!85335 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85336 () List!2193)

(assert (=> d!51919 (= lt!85335 (ListLongMap!2162 lt!85336))))

(declare-fun lt!85337 () Unit!5252)

(declare-fun lt!85334 () Unit!5252)

(assert (=> d!51919 (= lt!85337 lt!85334)))

(assert (=> d!51919 (= (getValueByKey!184 lt!85336 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(assert (=> d!51919 (= lt!85334 (lemmaContainsTupThenGetReturnValue!97 lt!85336 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(assert (=> d!51919 (= lt!85336 (insertStrictlySorted!100 (toList!1096 lt!85140) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(assert (=> d!51919 (= (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) lt!85335)))

(declare-fun b!171312 () Bool)

(declare-fun res!81439 () Bool)

(assert (=> b!171312 (=> (not res!81439) (not e!113077))))

(assert (=> b!171312 (= res!81439 (= (getValueByKey!184 (toList!1096 lt!85335) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(declare-fun b!171313 () Bool)

(assert (=> b!171313 (= e!113077 (contains!1146 (toList!1096 lt!85335) (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))

(assert (= (and d!51919 res!81438) b!171312))

(assert (= (and b!171312 res!81439) b!171313))

(declare-fun m!199843 () Bool)

(assert (=> d!51919 m!199843))

(declare-fun m!199845 () Bool)

(assert (=> d!51919 m!199845))

(declare-fun m!199847 () Bool)

(assert (=> d!51919 m!199847))

(declare-fun m!199849 () Bool)

(assert (=> d!51919 m!199849))

(declare-fun m!199851 () Bool)

(assert (=> b!171312 m!199851))

(declare-fun m!199853 () Bool)

(assert (=> b!171313 m!199853))

(assert (=> b!170993 d!51919))

(declare-fun d!51921 () Bool)

(assert (=> d!51921 (= (apply!129 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) lt!85128) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) lt!85128)))))

(declare-fun bs!7068 () Bool)

(assert (= bs!7068 d!51921))

(declare-fun m!199855 () Bool)

(assert (=> bs!7068 m!199855))

(assert (=> bs!7068 m!199855))

(declare-fun m!199857 () Bool)

(assert (=> bs!7068 m!199857))

(assert (=> b!170993 d!51921))

(declare-fun d!51923 () Bool)

(assert (=> d!51923 (= (apply!129 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) lt!85141) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) lt!85141)))))

(declare-fun bs!7069 () Bool)

(assert (= bs!7069 d!51923))

(declare-fun m!199859 () Bool)

(assert (=> bs!7069 m!199859))

(assert (=> bs!7069 m!199859))

(declare-fun m!199861 () Bool)

(assert (=> bs!7069 m!199861))

(assert (=> b!170993 d!51923))

(declare-fun d!51925 () Bool)

(assert (=> d!51925 (= (apply!129 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) lt!85141) (apply!129 lt!85126 lt!85141))))

(declare-fun lt!85338 () Unit!5252)

(assert (=> d!51925 (= lt!85338 (choose!926 lt!85126 lt!85132 (zeroValue!3398 thiss!1248) lt!85141))))

(declare-fun e!113078 () Bool)

(assert (=> d!51925 e!113078))

(declare-fun res!81440 () Bool)

(assert (=> d!51925 (=> (not res!81440) (not e!113078))))

(assert (=> d!51925 (= res!81440 (contains!1144 lt!85126 lt!85141))))

(assert (=> d!51925 (= (addApplyDifferent!105 lt!85126 lt!85132 (zeroValue!3398 thiss!1248) lt!85141) lt!85338)))

(declare-fun b!171314 () Bool)

(assert (=> b!171314 (= e!113078 (not (= lt!85141 lt!85132)))))

(assert (= (and d!51925 res!81440) b!171314))

(assert (=> d!51925 m!199321))

(declare-fun m!199863 () Bool)

(assert (=> d!51925 m!199863))

(assert (=> d!51925 m!199323))

(assert (=> d!51925 m!199325))

(declare-fun m!199865 () Bool)

(assert (=> d!51925 m!199865))

(assert (=> d!51925 m!199323))

(assert (=> b!170993 d!51925))

(declare-fun d!51927 () Bool)

(declare-fun e!113079 () Bool)

(assert (=> d!51927 e!113079))

(declare-fun res!81441 () Bool)

(assert (=> d!51927 (=> (not res!81441) (not e!113079))))

(declare-fun lt!85340 () ListLongMap!2161)

(assert (=> d!51927 (= res!81441 (contains!1144 lt!85340 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun lt!85341 () List!2193)

(assert (=> d!51927 (= lt!85340 (ListLongMap!2162 lt!85341))))

(declare-fun lt!85342 () Unit!5252)

(declare-fun lt!85339 () Unit!5252)

(assert (=> d!51927 (= lt!85342 lt!85339)))

(assert (=> d!51927 (= (getValueByKey!184 lt!85341 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(assert (=> d!51927 (= lt!85339 (lemmaContainsTupThenGetReturnValue!97 lt!85341 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(assert (=> d!51927 (= lt!85341 (insertStrictlySorted!100 (toList!1096 lt!85126) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(assert (=> d!51927 (= (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) lt!85340)))

(declare-fun b!171315 () Bool)

(declare-fun res!81442 () Bool)

(assert (=> b!171315 (=> (not res!81442) (not e!113079))))

(assert (=> b!171315 (= res!81442 (= (getValueByKey!184 (toList!1096 lt!85340) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(declare-fun b!171316 () Bool)

(assert (=> b!171316 (= e!113079 (contains!1146 (toList!1096 lt!85340) (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))

(assert (= (and d!51927 res!81441) b!171315))

(assert (= (and b!171315 res!81442) b!171316))

(declare-fun m!199867 () Bool)

(assert (=> d!51927 m!199867))

(declare-fun m!199869 () Bool)

(assert (=> d!51927 m!199869))

(declare-fun m!199871 () Bool)

(assert (=> d!51927 m!199871))

(declare-fun m!199873 () Bool)

(assert (=> d!51927 m!199873))

(declare-fun m!199875 () Bool)

(assert (=> b!171315 m!199875))

(declare-fun m!199877 () Bool)

(assert (=> b!171316 m!199877))

(assert (=> b!170993 d!51927))

(declare-fun d!51929 () Bool)

(assert (=> d!51929 (= (apply!129 lt!85140 lt!85137) (get!1939 (getValueByKey!184 (toList!1096 lt!85140) lt!85137)))))

(declare-fun bs!7070 () Bool)

(assert (= bs!7070 d!51929))

(declare-fun m!199879 () Bool)

(assert (=> bs!7070 m!199879))

(assert (=> bs!7070 m!199879))

(declare-fun m!199881 () Bool)

(assert (=> bs!7070 m!199881))

(assert (=> b!170993 d!51929))

(declare-fun d!51931 () Bool)

(declare-fun e!113080 () Bool)

(assert (=> d!51931 e!113080))

(declare-fun res!81443 () Bool)

(assert (=> d!51931 (=> (not res!81443) (not e!113080))))

(declare-fun lt!85344 () ListLongMap!2161)

(assert (=> d!51931 (= res!81443 (contains!1144 lt!85344 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun lt!85345 () List!2193)

(assert (=> d!51931 (= lt!85344 (ListLongMap!2162 lt!85345))))

(declare-fun lt!85346 () Unit!5252)

(declare-fun lt!85343 () Unit!5252)

(assert (=> d!51931 (= lt!85346 lt!85343)))

(assert (=> d!51931 (= (getValueByKey!184 lt!85345 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(assert (=> d!51931 (= lt!85343 (lemmaContainsTupThenGetReturnValue!97 lt!85345 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(assert (=> d!51931 (= lt!85345 (insertStrictlySorted!100 (toList!1096 lt!85144) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(assert (=> d!51931 (= (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) lt!85344)))

(declare-fun b!171317 () Bool)

(declare-fun res!81444 () Bool)

(assert (=> b!171317 (=> (not res!81444) (not e!113080))))

(assert (=> b!171317 (= res!81444 (= (getValueByKey!184 (toList!1096 lt!85344) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(declare-fun b!171318 () Bool)

(assert (=> b!171318 (= e!113080 (contains!1146 (toList!1096 lt!85344) (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))

(assert (= (and d!51931 res!81443) b!171317))

(assert (= (and b!171317 res!81444) b!171318))

(declare-fun m!199883 () Bool)

(assert (=> d!51931 m!199883))

(declare-fun m!199885 () Bool)

(assert (=> d!51931 m!199885))

(declare-fun m!199887 () Bool)

(assert (=> d!51931 m!199887))

(declare-fun m!199889 () Bool)

(assert (=> d!51931 m!199889))

(declare-fun m!199891 () Bool)

(assert (=> b!171317 m!199891))

(declare-fun m!199893 () Bool)

(assert (=> b!171318 m!199893))

(assert (=> b!170993 d!51931))

(assert (=> b!170993 d!51827))

(declare-fun bm!17447 () Bool)

(declare-fun call!17450 () Bool)

(declare-fun c!30598 () Bool)

(assert (=> bm!17447 (= call!17450 (arrayNoDuplicates!0 (_keys!5387 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30598 (Cons!2191 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) Nil!2192) Nil!2192)))))

(declare-fun b!171319 () Bool)

(declare-fun e!113084 () Bool)

(assert (=> b!171319 (= e!113084 call!17450)))

(declare-fun b!171320 () Bool)

(declare-fun e!113083 () Bool)

(assert (=> b!171320 (= e!113083 e!113084)))

(assert (=> b!171320 (= c!30598 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171321 () Bool)

(assert (=> b!171321 (= e!113084 call!17450)))

(declare-fun b!171322 () Bool)

(declare-fun e!113081 () Bool)

(assert (=> b!171322 (= e!113081 (contains!1147 Nil!2192 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171323 () Bool)

(declare-fun e!113082 () Bool)

(assert (=> b!171323 (= e!113082 e!113083)))

(declare-fun res!81445 () Bool)

(assert (=> b!171323 (=> (not res!81445) (not e!113083))))

(assert (=> b!171323 (= res!81445 (not e!113081))))

(declare-fun res!81447 () Bool)

(assert (=> b!171323 (=> (not res!81447) (not e!113081))))

(assert (=> b!171323 (= res!81447 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51933 () Bool)

(declare-fun res!81446 () Bool)

(assert (=> d!51933 (=> res!81446 e!113082)))

(assert (=> d!51933 (= res!81446 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!51933 (= (arrayNoDuplicates!0 (_keys!5387 thiss!1248) #b00000000000000000000000000000000 Nil!2192) e!113082)))

(assert (= (and d!51933 (not res!81446)) b!171323))

(assert (= (and b!171323 res!81447) b!171322))

(assert (= (and b!171323 res!81445) b!171320))

(assert (= (and b!171320 c!30598) b!171319))

(assert (= (and b!171320 (not c!30598)) b!171321))

(assert (= (or b!171319 b!171321) bm!17447))

(assert (=> bm!17447 m!199241))

(declare-fun m!199895 () Bool)

(assert (=> bm!17447 m!199895))

(assert (=> b!171320 m!199241))

(assert (=> b!171320 m!199241))

(assert (=> b!171320 m!199247))

(assert (=> b!171322 m!199241))

(assert (=> b!171322 m!199241))

(declare-fun m!199897 () Bool)

(assert (=> b!171322 m!199897))

(assert (=> b!171323 m!199241))

(assert (=> b!171323 m!199241))

(assert (=> b!171323 m!199247))

(assert (=> b!171019 d!51933))

(declare-fun d!51935 () Bool)

(declare-fun e!113086 () Bool)

(assert (=> d!51935 e!113086))

(declare-fun res!81448 () Bool)

(assert (=> d!51935 (=> res!81448 e!113086)))

(declare-fun lt!85349 () Bool)

(assert (=> d!51935 (= res!81448 (not lt!85349))))

(declare-fun lt!85347 () Bool)

(assert (=> d!51935 (= lt!85349 lt!85347)))

(declare-fun lt!85348 () Unit!5252)

(declare-fun e!113085 () Unit!5252)

(assert (=> d!51935 (= lt!85348 e!113085)))

(declare-fun c!30599 () Bool)

(assert (=> d!51935 (= c!30599 lt!85347)))

(assert (=> d!51935 (= lt!85347 (containsKey!188 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!51935 (= (contains!1144 lt!85130 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85349)))

(declare-fun b!171324 () Bool)

(declare-fun lt!85350 () Unit!5252)

(assert (=> b!171324 (= e!113085 lt!85350)))

(assert (=> b!171324 (= lt!85350 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171324 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171325 () Bool)

(declare-fun Unit!5267 () Unit!5252)

(assert (=> b!171325 (= e!113085 Unit!5267)))

(declare-fun b!171326 () Bool)

(assert (=> b!171326 (= e!113086 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!51935 c!30599) b!171324))

(assert (= (and d!51935 (not c!30599)) b!171325))

(assert (= (and d!51935 (not res!81448)) b!171326))

(declare-fun m!199899 () Bool)

(assert (=> d!51935 m!199899))

(declare-fun m!199901 () Bool)

(assert (=> b!171324 m!199901))

(declare-fun m!199903 () Bool)

(assert (=> b!171324 m!199903))

(assert (=> b!171324 m!199903))

(declare-fun m!199905 () Bool)

(assert (=> b!171324 m!199905))

(assert (=> b!171326 m!199903))

(assert (=> b!171326 m!199903))

(assert (=> b!171326 m!199905))

(assert (=> bm!17414 d!51935))

(declare-fun b!171328 () Bool)

(declare-fun e!113087 () Option!190)

(declare-fun e!113088 () Option!190)

(assert (=> b!171328 (= e!113087 e!113088)))

(declare-fun c!30601 () Bool)

(assert (=> b!171328 (= c!30601 (and ((_ is Cons!2189) (toList!1096 lt!85155)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85155))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!171329 () Bool)

(assert (=> b!171329 (= e!113088 (getValueByKey!184 (t!6995 (toList!1096 lt!85155)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!51937 () Bool)

(declare-fun c!30600 () Bool)

(assert (=> d!51937 (= c!30600 (and ((_ is Cons!2189) (toList!1096 lt!85155)) (= (_1!1628 (h!2806 (toList!1096 lt!85155))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51937 (= (getValueByKey!184 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113087)))

(declare-fun b!171330 () Bool)

(assert (=> b!171330 (= e!113088 None!188)))

(declare-fun b!171327 () Bool)

(assert (=> b!171327 (= e!113087 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85155)))))))

(assert (= (and d!51937 c!30600) b!171327))

(assert (= (and d!51937 (not c!30600)) b!171328))

(assert (= (and b!171328 c!30601) b!171329))

(assert (= (and b!171328 (not c!30601)) b!171330))

(declare-fun m!199907 () Bool)

(assert (=> b!171329 m!199907))

(assert (=> b!171015 d!51937))

(declare-fun b!171331 () Bool)

(declare-fun e!113091 () Bool)

(declare-fun e!113089 () Bool)

(assert (=> b!171331 (= e!113091 e!113089)))

(declare-fun c!30602 () Bool)

(assert (=> b!171331 (= c!30602 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51939 () Bool)

(declare-fun res!81450 () Bool)

(assert (=> d!51939 (=> res!81450 e!113091)))

(assert (=> d!51939 (= res!81450 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!51939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5387 thiss!1248) (mask!8383 thiss!1248)) e!113091)))

(declare-fun bm!17448 () Bool)

(declare-fun call!17451 () Bool)

(assert (=> bm!17448 (= call!17451 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5387 thiss!1248) (mask!8383 thiss!1248)))))

(declare-fun b!171332 () Bool)

(assert (=> b!171332 (= e!113089 call!17451)))

(declare-fun b!171333 () Bool)

(declare-fun e!113090 () Bool)

(assert (=> b!171333 (= e!113090 call!17451)))

(declare-fun b!171334 () Bool)

(assert (=> b!171334 (= e!113089 e!113090)))

(declare-fun lt!85353 () (_ BitVec 64))

(assert (=> b!171334 (= lt!85353 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85351 () Unit!5252)

(assert (=> b!171334 (= lt!85351 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5387 thiss!1248) lt!85353 #b00000000000000000000000000000000))))

(assert (=> b!171334 (arrayContainsKey!0 (_keys!5387 thiss!1248) lt!85353 #b00000000000000000000000000000000)))

(declare-fun lt!85352 () Unit!5252)

(assert (=> b!171334 (= lt!85352 lt!85351)))

(declare-fun res!81449 () Bool)

(assert (=> b!171334 (= res!81449 (= (seekEntryOrOpen!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (_keys!5387 thiss!1248) (mask!8383 thiss!1248)) (Found!534 #b00000000000000000000000000000000)))))

(assert (=> b!171334 (=> (not res!81449) (not e!113090))))

(assert (= (and d!51939 (not res!81450)) b!171331))

(assert (= (and b!171331 c!30602) b!171334))

(assert (= (and b!171331 (not c!30602)) b!171332))

(assert (= (and b!171334 res!81449) b!171333))

(assert (= (or b!171333 b!171332) bm!17448))

(assert (=> b!171331 m!199241))

(assert (=> b!171331 m!199241))

(assert (=> b!171331 m!199247))

(declare-fun m!199909 () Bool)

(assert (=> bm!17448 m!199909))

(assert (=> b!171334 m!199241))

(declare-fun m!199911 () Bool)

(assert (=> b!171334 m!199911))

(declare-fun m!199913 () Bool)

(assert (=> b!171334 m!199913))

(assert (=> b!171334 m!199241))

(declare-fun m!199915 () Bool)

(assert (=> b!171334 m!199915))

(assert (=> b!171018 d!51939))

(assert (=> b!171009 d!51833))

(declare-fun b!171335 () Bool)

(declare-fun e!113093 () (_ BitVec 32))

(declare-fun call!17452 () (_ BitVec 32))

(assert (=> b!171335 (= e!113093 call!17452)))

(declare-fun b!171336 () Bool)

(declare-fun e!113092 () (_ BitVec 32))

(assert (=> b!171336 (= e!113092 #b00000000000000000000000000000000)))

(declare-fun b!171337 () Bool)

(assert (=> b!171337 (= e!113092 e!113093)))

(declare-fun c!30604 () Bool)

(assert (=> b!171337 (= c!30604 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171338 () Bool)

(assert (=> b!171338 (= e!113093 (bvadd #b00000000000000000000000000000001 call!17452))))

(declare-fun bm!17449 () Bool)

(assert (=> bm!17449 (= call!17452 (arrayCountValidKeys!0 (_keys!5387 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun d!51941 () Bool)

(declare-fun lt!85354 () (_ BitVec 32))

(assert (=> d!51941 (and (bvsge lt!85354 #b00000000000000000000000000000000) (bvsle lt!85354 (bvsub (size!3682 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51941 (= lt!85354 e!113092)))

(declare-fun c!30603 () Bool)

(assert (=> d!51941 (= c!30603 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!51941 (and (bvsle #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3682 (_keys!5387 thiss!1248)) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!51941 (= (arrayCountValidKeys!0 (_keys!5387 thiss!1248) #b00000000000000000000000000000000 (size!3682 (_keys!5387 thiss!1248))) lt!85354)))

(assert (= (and d!51941 c!30603) b!171336))

(assert (= (and d!51941 (not c!30603)) b!171337))

(assert (= (and b!171337 c!30604) b!171338))

(assert (= (and b!171337 (not c!30604)) b!171335))

(assert (= (or b!171338 b!171335) bm!17449))

(assert (=> b!171337 m!199241))

(assert (=> b!171337 m!199241))

(assert (=> b!171337 m!199247))

(declare-fun m!199917 () Bool)

(assert (=> bm!17449 m!199917))

(assert (=> b!171017 d!51941))

(declare-fun d!51943 () Bool)

(assert (=> d!51943 (= (apply!129 lt!85130 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1939 (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7071 () Bool)

(assert (= bs!7071 d!51943))

(assert (=> bs!7071 m!199903))

(assert (=> bs!7071 m!199903))

(declare-fun m!199919 () Bool)

(assert (=> bs!7071 m!199919))

(assert (=> b!170991 d!51943))

(declare-fun condMapEmpty!6807 () Bool)

(declare-fun mapDefault!6807 () ValueCell!1659)

(assert (=> mapNonEmpty!6806 (= condMapEmpty!6807 (= mapRest!6806 ((as const (Array (_ BitVec 32) ValueCell!1659)) mapDefault!6807)))))

(declare-fun e!113095 () Bool)

(declare-fun mapRes!6807 () Bool)

(assert (=> mapNonEmpty!6806 (= tp!15338 (and e!113095 mapRes!6807))))

(declare-fun b!171340 () Bool)

(assert (=> b!171340 (= e!113095 tp_is_empty!4005)))

(declare-fun b!171339 () Bool)

(declare-fun e!113094 () Bool)

(assert (=> b!171339 (= e!113094 tp_is_empty!4005)))

(declare-fun mapNonEmpty!6807 () Bool)

(declare-fun tp!15339 () Bool)

(assert (=> mapNonEmpty!6807 (= mapRes!6807 (and tp!15339 e!113094))))

(declare-fun mapKey!6807 () (_ BitVec 32))

(declare-fun mapRest!6807 () (Array (_ BitVec 32) ValueCell!1659))

(declare-fun mapValue!6807 () ValueCell!1659)

(assert (=> mapNonEmpty!6807 (= mapRest!6806 (store mapRest!6807 mapKey!6807 mapValue!6807))))

(declare-fun mapIsEmpty!6807 () Bool)

(assert (=> mapIsEmpty!6807 mapRes!6807))

(assert (= (and mapNonEmpty!6806 condMapEmpty!6807) mapIsEmpty!6807))

(assert (= (and mapNonEmpty!6806 (not condMapEmpty!6807)) mapNonEmpty!6807))

(assert (= (and mapNonEmpty!6807 ((_ is ValueCellFull!1659) mapValue!6807)) b!171339))

(assert (= (and mapNonEmpty!6806 ((_ is ValueCellFull!1659) mapDefault!6807)) b!171340))

(declare-fun m!199921 () Bool)

(assert (=> mapNonEmpty!6807 m!199921))

(declare-fun b_lambda!6905 () Bool)

(assert (= b_lambda!6899 (or (and b!170884 b_free!4233) b_lambda!6905)))

(declare-fun b_lambda!6907 () Bool)

(assert (= b_lambda!6901 (or (and b!170884 b_free!4233) b_lambda!6907)))

(declare-fun b_lambda!6909 () Bool)

(assert (= b_lambda!6897 (or (and b!170884 b_free!4233) b_lambda!6909)))

(declare-fun b_lambda!6911 () Bool)

(assert (= b_lambda!6895 (or (and b!170884 b_free!4233) b_lambda!6911)))

(check-sat (not bm!17446) (not d!51897) (not b_next!4233) (not b!171285) (not b!171334) (not b_lambda!6905) (not b!171201) (not b!171295) (not b!171043) (not bm!17444) (not bm!17442) (not b_lambda!6907) (not d!51793) (not d!51813) (not b!171313) (not b!171253) (not b!171316) (not b!171282) (not b!171040) (not d!51845) (not b!171278) (not b!171143) (not bm!17449) (not d!51849) (not b_lambda!6893) (not b!171139) (not d!51863) (not b!171188) (not b!171058) (not d!51861) (not b!171166) (not b!171312) (not b!171231) b_and!10663 (not d!51881) (not b!171102) (not d!51907) (not b!171260) (not b!171093) (not d!51875) (not d!51791) (not b!171056) (not b!171070) (not bm!17421) (not d!51795) (not d!51873) (not b!171144) (not d!51915) (not d!51917) (not d!51925) (not b!171251) (not d!51807) (not d!51859) (not b!171211) (not b!171257) (not d!51865) (not b!171298) (not b!171185) (not d!51895) (not bm!17439) (not b!171160) (not b!171304) (not d!51877) (not d!51889) (not d!51825) (not b!171199) (not bm!17433) (not b!171238) (not d!51799) (not b!171281) (not d!51867) (not d!51893) (not b!171101) (not b!171168) (not b!171287) (not b!171163) (not d!51935) (not b!171141) (not b!171172) (not b!171105) (not b!171221) (not b!171232) (not b!171158) (not b!171061) (not d!51927) (not bm!17448) (not b!171133) (not b!171059) (not b!171140) (not b!171054) (not b!171162) (not bm!17427) (not b!171318) (not d!51913) (not d!51921) (not b!171064) (not b!171305) (not b!171205) (not d!51815) (not b!171135) (not b!171331) (not b!171175) (not b!171071) (not b!171275) (not b_lambda!6909) (not b!171210) (not b!171134) (not b!171164) (not d!51857) (not b!171137) (not b!171265) (not b!171202) (not b!171324) (not b!171107) (not d!51809) (not d!51837) (not d!51823) (not bm!17445) (not d!51911) (not b!171294) (not b!171239) (not d!51817) (not b!171288) (not b_lambda!6903) (not d!51843) (not mapNonEmpty!6807) (not b!171337) (not d!51847) (not bm!17434) (not b!171096) (not b!171309) (not b!171322) (not b!171159) (not d!51931) (not d!51919) (not b!171208) (not b!171317) (not b!171270) (not d!51871) (not b!171283) (not d!51827) (not b!171329) (not b!171326) (not d!51855) (not d!51887) (not d!51879) (not bm!17426) (not d!51839) (not d!51903) (not b!171280) (not b!171254) (not d!51901) (not b!171216) (not d!51811) (not bm!17447) (not bm!17430) (not b!171104) (not b_lambda!6891) (not b!171256) (not b!171170) (not d!51803) (not d!51883) (not b!171213) (not b!171169) (not b!171300) (not b!171289) (not d!51869) (not d!51929) (not b!171274) (not d!51891) (not b!171315) tp_is_empty!4005 (not b!171152) (not b!171146) (not b!171320) (not b!171323) (not b!171307) (not b!171203) (not d!51905) (not b!171277) (not d!51923) (not d!51909) (not d!51819) (not b!171302) (not d!51943) (not d!51885) (not d!51899) (not b!171262) (not b_lambda!6911) (not b!171039) (not b!171303) (not b!171310))
(check-sat b_and!10663 (not b_next!4233))
(get-model)

(declare-fun d!51945 () Bool)

(assert (=> d!51945 (= (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) lt!85112)) (v!3914 (getValueByKey!184 (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) lt!85112)))))

(assert (=> d!51879 d!51945))

(declare-fun b!171342 () Bool)

(declare-fun e!113096 () Option!190)

(declare-fun e!113097 () Option!190)

(assert (=> b!171342 (= e!113096 e!113097)))

(declare-fun c!30606 () Bool)

(assert (=> b!171342 (= c!30606 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))) (not (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))) lt!85112))))))

(declare-fun b!171343 () Bool)

(assert (=> b!171343 (= e!113097 (getValueByKey!184 (t!6995 (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))) lt!85112))))

(declare-fun d!51947 () Bool)

(declare-fun c!30605 () Bool)

(assert (=> d!51947 (= c!30605 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))) lt!85112)))))

(assert (=> d!51947 (= (getValueByKey!184 (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) lt!85112) e!113096)))

(declare-fun b!171344 () Bool)

(assert (=> b!171344 (= e!113097 None!188)))

(declare-fun b!171341 () Bool)

(assert (=> b!171341 (= e!113096 (Some!189 (_2!1628 (h!2806 (toList!1096 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))))

(assert (= (and d!51947 c!30605) b!171341))

(assert (= (and d!51947 (not c!30605)) b!171342))

(assert (= (and b!171342 c!30606) b!171343))

(assert (= (and b!171342 (not c!30606)) b!171344))

(declare-fun m!199923 () Bool)

(assert (=> b!171343 m!199923))

(assert (=> d!51879 d!51947))

(declare-fun d!51949 () Bool)

(declare-fun res!81451 () Bool)

(declare-fun e!113098 () Bool)

(assert (=> d!51949 (=> res!81451 e!113098)))

(assert (=> d!51949 (= res!81451 (and ((_ is Cons!2189) lt!85263) (= (_1!1628 (h!2806 lt!85263)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51949 (= (containsKey!188 lt!85263 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113098)))

(declare-fun b!171345 () Bool)

(declare-fun e!113099 () Bool)

(assert (=> b!171345 (= e!113098 e!113099)))

(declare-fun res!81452 () Bool)

(assert (=> b!171345 (=> (not res!81452) (not e!113099))))

(assert (=> b!171345 (= res!81452 (and (or (not ((_ is Cons!2189) lt!85263)) (bvsle (_1!1628 (h!2806 lt!85263)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2189) lt!85263) (bvslt (_1!1628 (h!2806 lt!85263)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171346 () Bool)

(assert (=> b!171346 (= e!113099 (containsKey!188 (t!6995 lt!85263) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!51949 (not res!81451)) b!171345))

(assert (= (and b!171345 res!81452) b!171346))

(declare-fun m!199925 () Bool)

(assert (=> b!171346 m!199925))

(assert (=> b!171213 d!51949))

(declare-fun d!51951 () Bool)

(assert (=> d!51951 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7072 () Bool)

(assert (= bs!7072 d!51951))

(assert (=> bs!7072 m!199903))

(declare-fun m!199927 () Bool)

(assert (=> bs!7072 m!199927))

(assert (=> b!171326 d!51951))

(declare-fun b!171348 () Bool)

(declare-fun e!113100 () Option!190)

(declare-fun e!113101 () Option!190)

(assert (=> b!171348 (= e!113100 e!113101)))

(declare-fun c!30608 () Bool)

(assert (=> b!171348 (= c!30608 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85130))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171349 () Bool)

(assert (=> b!171349 (= e!113101 (getValueByKey!184 (t!6995 (toList!1096 lt!85130)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!51953 () Bool)

(declare-fun c!30607 () Bool)

(assert (=> d!51953 (= c!30607 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (= (_1!1628 (h!2806 (toList!1096 lt!85130))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51953 (= (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000) e!113100)))

(declare-fun b!171350 () Bool)

(assert (=> b!171350 (= e!113101 None!188)))

(declare-fun b!171347 () Bool)

(assert (=> b!171347 (= e!113100 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85130)))))))

(assert (= (and d!51953 c!30607) b!171347))

(assert (= (and d!51953 (not c!30607)) b!171348))

(assert (= (and b!171348 c!30608) b!171349))

(assert (= (and b!171348 (not c!30608)) b!171350))

(declare-fun m!199929 () Bool)

(assert (=> b!171349 m!199929))

(assert (=> b!171326 d!51953))

(declare-fun d!51955 () Bool)

(declare-fun lt!85355 () Bool)

(assert (=> d!51955 (= lt!85355 (select (content!147 (t!6995 (toList!1096 lt!85155))) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!113103 () Bool)

(assert (=> d!51955 (= lt!85355 e!113103)))

(declare-fun res!81453 () Bool)

(assert (=> d!51955 (=> (not res!81453) (not e!113103))))

(assert (=> d!51955 (= res!81453 ((_ is Cons!2189) (t!6995 (toList!1096 lt!85155))))))

(assert (=> d!51955 (= (contains!1146 (t!6995 (toList!1096 lt!85155)) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85355)))

(declare-fun b!171351 () Bool)

(declare-fun e!113102 () Bool)

(assert (=> b!171351 (= e!113103 e!113102)))

(declare-fun res!81454 () Bool)

(assert (=> b!171351 (=> res!81454 e!113102)))

(assert (=> b!171351 (= res!81454 (= (h!2806 (t!6995 (toList!1096 lt!85155))) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!171352 () Bool)

(assert (=> b!171352 (= e!113102 (contains!1146 (t!6995 (t!6995 (toList!1096 lt!85155))) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!51955 res!81453) b!171351))

(assert (= (and b!171351 (not res!81454)) b!171352))

(declare-fun m!199931 () Bool)

(assert (=> d!51955 m!199931))

(declare-fun m!199933 () Bool)

(assert (=> d!51955 m!199933))

(declare-fun m!199935 () Bool)

(assert (=> b!171352 m!199935))

(assert (=> b!171302 d!51955))

(declare-fun d!51957 () Bool)

(assert (=> d!51957 (= (validMask!0 (mask!8383 lt!85045)) (and (or (= (mask!8383 lt!85045) #b00000000000000000000000000000111) (= (mask!8383 lt!85045) #b00000000000000000000000000001111) (= (mask!8383 lt!85045) #b00000000000000000000000000011111) (= (mask!8383 lt!85045) #b00000000000000000000000000111111) (= (mask!8383 lt!85045) #b00000000000000000000000001111111) (= (mask!8383 lt!85045) #b00000000000000000000000011111111) (= (mask!8383 lt!85045) #b00000000000000000000000111111111) (= (mask!8383 lt!85045) #b00000000000000000000001111111111) (= (mask!8383 lt!85045) #b00000000000000000000011111111111) (= (mask!8383 lt!85045) #b00000000000000000000111111111111) (= (mask!8383 lt!85045) #b00000000000000000001111111111111) (= (mask!8383 lt!85045) #b00000000000000000011111111111111) (= (mask!8383 lt!85045) #b00000000000000000111111111111111) (= (mask!8383 lt!85045) #b00000000000000001111111111111111) (= (mask!8383 lt!85045) #b00000000000000011111111111111111) (= (mask!8383 lt!85045) #b00000000000000111111111111111111) (= (mask!8383 lt!85045) #b00000000000001111111111111111111) (= (mask!8383 lt!85045) #b00000000000011111111111111111111) (= (mask!8383 lt!85045) #b00000000000111111111111111111111) (= (mask!8383 lt!85045) #b00000000001111111111111111111111) (= (mask!8383 lt!85045) #b00000000011111111111111111111111) (= (mask!8383 lt!85045) #b00000000111111111111111111111111) (= (mask!8383 lt!85045) #b00000001111111111111111111111111) (= (mask!8383 lt!85045) #b00000011111111111111111111111111) (= (mask!8383 lt!85045) #b00000111111111111111111111111111) (= (mask!8383 lt!85045) #b00001111111111111111111111111111) (= (mask!8383 lt!85045) #b00011111111111111111111111111111) (= (mask!8383 lt!85045) #b00111111111111111111111111111111)) (bvsle (mask!8383 lt!85045) #b00111111111111111111111111111111)))))

(assert (=> d!51847 d!51957))

(declare-fun d!51959 () Bool)

(assert (=> d!51959 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309)))) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))))))))

(declare-fun bs!7073 () Bool)

(assert (= bs!7073 d!51959))

(assert (=> bs!7073 m!199397))

(declare-fun m!199937 () Bool)

(assert (=> bs!7073 m!199937))

(assert (=> b!171061 d!51959))

(assert (=> b!171061 d!51829))

(assert (=> b!171323 d!51833))

(declare-fun d!51961 () Bool)

(assert (=> d!51961 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3914 (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51895 d!51961))

(declare-fun b!171354 () Bool)

(declare-fun e!113104 () Option!190)

(declare-fun e!113105 () Option!190)

(assert (=> b!171354 (= e!113104 e!113105)))

(declare-fun c!30610 () Bool)

(assert (=> b!171354 (= c!30610 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85130))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171355 () Bool)

(assert (=> b!171355 (= e!113105 (getValueByKey!184 (t!6995 (toList!1096 lt!85130)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!51963 () Bool)

(declare-fun c!30609 () Bool)

(assert (=> d!51963 (= c!30609 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (= (_1!1628 (h!2806 (toList!1096 lt!85130))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51963 (= (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000) e!113104)))

(declare-fun b!171356 () Bool)

(assert (=> b!171356 (= e!113105 None!188)))

(declare-fun b!171353 () Bool)

(assert (=> b!171353 (= e!113104 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85130)))))))

(assert (= (and d!51963 c!30609) b!171353))

(assert (= (and d!51963 (not c!30609)) b!171354))

(assert (= (and b!171354 c!30610) b!171355))

(assert (= (and b!171354 (not c!30610)) b!171356))

(declare-fun m!199939 () Bool)

(assert (=> b!171355 m!199939))

(assert (=> d!51895 d!51963))

(declare-fun d!51965 () Bool)

(declare-fun res!81455 () Bool)

(declare-fun e!113106 () Bool)

(assert (=> d!51965 (=> res!81455 e!113106)))

(assert (=> d!51965 (= res!81455 (and ((_ is Cons!2189) lt!85172) (= (_1!1628 (h!2806 lt!85172)) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!51965 (= (containsKey!188 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309))) e!113106)))

(declare-fun b!171357 () Bool)

(declare-fun e!113107 () Bool)

(assert (=> b!171357 (= e!113106 e!113107)))

(declare-fun res!81456 () Bool)

(assert (=> b!171357 (=> (not res!81456) (not e!113107))))

(assert (=> b!171357 (= res!81456 (and (or (not ((_ is Cons!2189) lt!85172)) (bvsle (_1!1628 (h!2806 lt!85172)) (_1!1628 (tuple2!3235 key!828 v!309)))) ((_ is Cons!2189) lt!85172) (bvslt (_1!1628 (h!2806 lt!85172)) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun b!171358 () Bool)

(assert (=> b!171358 (= e!113107 (containsKey!188 (t!6995 lt!85172) (_1!1628 (tuple2!3235 key!828 v!309))))))

(assert (= (and d!51965 (not res!81455)) b!171357))

(assert (= (and b!171357 res!81456) b!171358))

(declare-fun m!199941 () Bool)

(assert (=> b!171358 m!199941))

(assert (=> b!171070 d!51965))

(declare-fun d!51967 () Bool)

(declare-fun res!81457 () Bool)

(declare-fun e!113108 () Bool)

(assert (=> d!51967 (=> res!81457 e!113108)))

(assert (=> d!51967 (= res!81457 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (= (_1!1628 (h!2806 (toList!1096 lt!85105))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51967 (= (containsKey!188 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000) e!113108)))

(declare-fun b!171359 () Bool)

(declare-fun e!113109 () Bool)

(assert (=> b!171359 (= e!113108 e!113109)))

(declare-fun res!81458 () Bool)

(assert (=> b!171359 (=> (not res!81458) (not e!113109))))

(assert (=> b!171359 (= res!81458 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85105))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85105))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2189) (toList!1096 lt!85105)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85105))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171360 () Bool)

(assert (=> b!171360 (= e!113109 (containsKey!188 (t!6995 (toList!1096 lt!85105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!51967 (not res!81457)) b!171359))

(assert (= (and b!171359 res!81458) b!171360))

(declare-fun m!199943 () Bool)

(assert (=> b!171360 m!199943))

(assert (=> d!51893 d!51967))

(declare-fun d!51969 () Bool)

(assert (=> d!51969 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85136) lt!85128)) (v!3914 (getValueByKey!184 (toList!1096 lt!85136) lt!85128)))))

(assert (=> d!51909 d!51969))

(declare-fun b!171362 () Bool)

(declare-fun e!113110 () Option!190)

(declare-fun e!113111 () Option!190)

(assert (=> b!171362 (= e!113110 e!113111)))

(declare-fun c!30612 () Bool)

(assert (=> b!171362 (= c!30612 (and ((_ is Cons!2189) (toList!1096 lt!85136)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85136))) lt!85128))))))

(declare-fun b!171363 () Bool)

(assert (=> b!171363 (= e!113111 (getValueByKey!184 (t!6995 (toList!1096 lt!85136)) lt!85128))))

(declare-fun d!51971 () Bool)

(declare-fun c!30611 () Bool)

(assert (=> d!51971 (= c!30611 (and ((_ is Cons!2189) (toList!1096 lt!85136)) (= (_1!1628 (h!2806 (toList!1096 lt!85136))) lt!85128)))))

(assert (=> d!51971 (= (getValueByKey!184 (toList!1096 lt!85136) lt!85128) e!113110)))

(declare-fun b!171364 () Bool)

(assert (=> b!171364 (= e!113111 None!188)))

(declare-fun b!171361 () Bool)

(assert (=> b!171361 (= e!113110 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85136)))))))

(assert (= (and d!51971 c!30611) b!171361))

(assert (= (and d!51971 (not c!30611)) b!171362))

(assert (= (and b!171362 c!30612) b!171363))

(assert (= (and b!171362 (not c!30612)) b!171364))

(declare-fun m!199945 () Bool)

(assert (=> b!171363 m!199945))

(assert (=> d!51909 d!51971))

(declare-fun d!51973 () Bool)

(declare-fun res!81459 () Bool)

(declare-fun e!113112 () Bool)

(assert (=> d!51973 (=> res!81459 e!113112)))

(assert (=> d!51973 (= res!81459 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))) lt!85127)))))

(assert (=> d!51973 (= (containsKey!188 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127) e!113112)))

(declare-fun b!171365 () Bool)

(declare-fun e!113113 () Bool)

(assert (=> b!171365 (= e!113112 e!113113)))

(declare-fun res!81460 () Bool)

(assert (=> b!171365 (=> (not res!81460) (not e!113113))))

(assert (=> b!171365 (= res!81460 (and (or (not ((_ is Cons!2189) (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))) (bvsle (_1!1628 (h!2806 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))) lt!85127)) ((_ is Cons!2189) (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))) (bvslt (_1!1628 (h!2806 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))) lt!85127)))))

(declare-fun b!171366 () Bool)

(assert (=> b!171366 (= e!113113 (containsKey!188 (t!6995 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))) lt!85127))))

(assert (= (and d!51973 (not res!81459)) b!171365))

(assert (= (and b!171365 res!81460) b!171366))

(declare-fun m!199947 () Bool)

(assert (=> b!171366 m!199947))

(assert (=> d!51907 d!51973))

(assert (=> b!171133 d!51833))

(declare-fun b!171368 () Bool)

(declare-fun e!113114 () Option!190)

(declare-fun e!113115 () Option!190)

(assert (=> b!171368 (= e!113114 e!113115)))

(declare-fun c!30614 () Bool)

(assert (=> b!171368 (= c!30614 (and ((_ is Cons!2189) (toList!1096 lt!85330)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85330))) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171369 () Bool)

(assert (=> b!171369 (= e!113115 (getValueByKey!184 (t!6995 (toList!1096 lt!85330)) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun d!51975 () Bool)

(declare-fun c!30613 () Bool)

(assert (=> d!51975 (= c!30613 (and ((_ is Cons!2189) (toList!1096 lt!85330)) (= (_1!1628 (h!2806 (toList!1096 lt!85330))) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(assert (=> d!51975 (= (getValueByKey!184 (toList!1096 lt!85330) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) e!113114)))

(declare-fun b!171370 () Bool)

(assert (=> b!171370 (= e!113115 None!188)))

(declare-fun b!171367 () Bool)

(assert (=> b!171367 (= e!113114 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85330)))))))

(assert (= (and d!51975 c!30613) b!171367))

(assert (= (and d!51975 (not c!30613)) b!171368))

(assert (= (and b!171368 c!30614) b!171369))

(assert (= (and b!171368 (not c!30614)) b!171370))

(declare-fun m!199949 () Bool)

(assert (=> b!171369 m!199949))

(assert (=> b!171309 d!51975))

(declare-fun d!51977 () Bool)

(assert (=> d!51977 (= (size!3686 thiss!1248) (bvadd (_size!1162 thiss!1248) (bvsdiv (bvadd (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!171256 d!51977))

(declare-fun d!51979 () Bool)

(declare-fun res!81461 () Bool)

(declare-fun e!113116 () Bool)

(assert (=> d!51979 (=> res!81461 e!113116)))

(assert (=> d!51979 (= res!81461 (and ((_ is Cons!2189) (t!6995 (toList!1096 lt!85043))) (= (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85043)))) key!828)))))

(assert (=> d!51979 (= (containsKey!188 (t!6995 (toList!1096 lt!85043)) key!828) e!113116)))

(declare-fun b!171371 () Bool)

(declare-fun e!113117 () Bool)

(assert (=> b!171371 (= e!113116 e!113117)))

(declare-fun res!81462 () Bool)

(assert (=> b!171371 (=> (not res!81462) (not e!113117))))

(assert (=> b!171371 (= res!81462 (and (or (not ((_ is Cons!2189) (t!6995 (toList!1096 lt!85043)))) (bvsle (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85043)))) key!828)) ((_ is Cons!2189) (t!6995 (toList!1096 lt!85043))) (bvslt (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85043)))) key!828)))))

(declare-fun b!171372 () Bool)

(assert (=> b!171372 (= e!113117 (containsKey!188 (t!6995 (t!6995 (toList!1096 lt!85043))) key!828))))

(assert (= (and d!51979 (not res!81461)) b!171371))

(assert (= (and b!171371 res!81462) b!171372))

(declare-fun m!199951 () Bool)

(assert (=> b!171372 m!199951))

(assert (=> b!171152 d!51979))

(declare-fun b!171374 () Bool)

(declare-fun e!113118 () Option!190)

(declare-fun e!113119 () Option!190)

(assert (=> b!171374 (= e!113118 e!113119)))

(declare-fun c!30616 () Bool)

(assert (=> b!171374 (= c!30616 (and ((_ is Cons!2189) (toList!1096 lt!85309)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85309))) (_1!1628 (tuple2!3235 lt!85104 v!309))))))))

(declare-fun b!171375 () Bool)

(assert (=> b!171375 (= e!113119 (getValueByKey!184 (t!6995 (toList!1096 lt!85309)) (_1!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun c!30615 () Bool)

(declare-fun d!51981 () Bool)

(assert (=> d!51981 (= c!30615 (and ((_ is Cons!2189) (toList!1096 lt!85309)) (= (_1!1628 (h!2806 (toList!1096 lt!85309))) (_1!1628 (tuple2!3235 lt!85104 v!309)))))))

(assert (=> d!51981 (= (getValueByKey!184 (toList!1096 lt!85309) (_1!1628 (tuple2!3235 lt!85104 v!309))) e!113118)))

(declare-fun b!171376 () Bool)

(assert (=> b!171376 (= e!113119 None!188)))

(declare-fun b!171373 () Bool)

(assert (=> b!171373 (= e!113118 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85309)))))))

(assert (= (and d!51981 c!30615) b!171373))

(assert (= (and d!51981 (not c!30615)) b!171374))

(assert (= (and b!171374 c!30616) b!171375))

(assert (= (and b!171374 (not c!30616)) b!171376))

(declare-fun m!199953 () Bool)

(assert (=> b!171375 m!199953))

(assert (=> b!171294 d!51981))

(declare-fun d!51983 () Bool)

(declare-fun res!81467 () Bool)

(declare-fun e!113124 () Bool)

(assert (=> d!51983 (=> res!81467 e!113124)))

(assert (=> d!51983 (= res!81467 (or ((_ is Nil!2190) lt!85263) ((_ is Nil!2190) (t!6995 lt!85263))))))

(assert (=> d!51983 (= (isStrictlySorted!331 lt!85263) e!113124)))

(declare-fun b!171381 () Bool)

(declare-fun e!113125 () Bool)

(assert (=> b!171381 (= e!113124 e!113125)))

(declare-fun res!81468 () Bool)

(assert (=> b!171381 (=> (not res!81468) (not e!113125))))

(assert (=> b!171381 (= res!81468 (bvslt (_1!1628 (h!2806 lt!85263)) (_1!1628 (h!2806 (t!6995 lt!85263)))))))

(declare-fun b!171382 () Bool)

(assert (=> b!171382 (= e!113125 (isStrictlySorted!331 (t!6995 lt!85263)))))

(assert (= (and d!51983 (not res!81467)) b!171381))

(assert (= (and b!171381 res!81468) b!171382))

(declare-fun m!199955 () Bool)

(assert (=> b!171382 m!199955))

(assert (=> d!51845 d!51983))

(declare-fun d!51985 () Bool)

(declare-fun res!81469 () Bool)

(declare-fun e!113126 () Bool)

(assert (=> d!51985 (=> res!81469 e!113126)))

(assert (=> d!51985 (= res!81469 (or ((_ is Nil!2190) (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) ((_ is Nil!2190) (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))))))

(assert (=> d!51985 (= (isStrictlySorted!331 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) e!113126)))

(declare-fun b!171383 () Bool)

(declare-fun e!113127 () Bool)

(assert (=> b!171383 (= e!113126 e!113127)))

(declare-fun res!81470 () Bool)

(assert (=> b!171383 (=> (not res!81470) (not e!113127))))

(assert (=> b!171383 (= res!81470 (bvslt (_1!1628 (h!2806 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (_1!1628 (h!2806 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))))))))

(declare-fun b!171384 () Bool)

(assert (=> b!171384 (= e!113127 (isStrictlySorted!331 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))))))

(assert (= (and d!51985 (not res!81469)) b!171383))

(assert (= (and b!171383 res!81470) b!171384))

(declare-fun m!199957 () Bool)

(assert (=> b!171384 m!199957))

(assert (=> d!51845 d!51985))

(declare-fun b!171386 () Bool)

(declare-fun e!113128 () Option!190)

(declare-fun e!113129 () Option!190)

(assert (=> b!171386 (= e!113128 e!113129)))

(declare-fun c!30618 () Bool)

(assert (=> b!171386 (= c!30618 (and ((_ is Cons!2189) (t!6995 (toList!1096 lt!85043))) (not (= (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85043)))) key!828))))))

(declare-fun b!171387 () Bool)

(assert (=> b!171387 (= e!113129 (getValueByKey!184 (t!6995 (t!6995 (toList!1096 lt!85043))) key!828))))

(declare-fun d!51987 () Bool)

(declare-fun c!30617 () Bool)

(assert (=> d!51987 (= c!30617 (and ((_ is Cons!2189) (t!6995 (toList!1096 lt!85043))) (= (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85043)))) key!828)))))

(assert (=> d!51987 (= (getValueByKey!184 (t!6995 (toList!1096 lt!85043)) key!828) e!113128)))

(declare-fun b!171388 () Bool)

(assert (=> b!171388 (= e!113129 None!188)))

(declare-fun b!171385 () Bool)

(assert (=> b!171385 (= e!113128 (Some!189 (_2!1628 (h!2806 (t!6995 (toList!1096 lt!85043))))))))

(assert (= (and d!51987 c!30617) b!171385))

(assert (= (and d!51987 (not c!30617)) b!171386))

(assert (= (and b!171386 c!30618) b!171387))

(assert (= (and b!171386 (not c!30618)) b!171388))

(declare-fun m!199959 () Bool)

(assert (=> b!171387 m!199959))

(assert (=> b!171054 d!51987))

(declare-fun b!171390 () Bool)

(declare-fun e!113130 () Option!190)

(declare-fun e!113131 () Option!190)

(assert (=> b!171390 (= e!113130 e!113131)))

(declare-fun c!30620 () Bool)

(assert (=> b!171390 (= c!30620 (and ((_ is Cons!2189) (t!6995 lt!85156)) (not (= (_1!1628 (h!2806 (t!6995 lt!85156))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!171391 () Bool)

(assert (=> b!171391 (= e!113131 (getValueByKey!184 (t!6995 (t!6995 lt!85156)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!51989 () Bool)

(declare-fun c!30619 () Bool)

(assert (=> d!51989 (= c!30619 (and ((_ is Cons!2189) (t!6995 lt!85156)) (= (_1!1628 (h!2806 (t!6995 lt!85156))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!51989 (= (getValueByKey!184 (t!6995 lt!85156) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113130)))

(declare-fun b!171392 () Bool)

(assert (=> b!171392 (= e!113131 None!188)))

(declare-fun b!171389 () Bool)

(assert (=> b!171389 (= e!113130 (Some!189 (_2!1628 (h!2806 (t!6995 lt!85156)))))))

(assert (= (and d!51989 c!30619) b!171389))

(assert (= (and d!51989 (not c!30619)) b!171390))

(assert (= (and b!171390 c!30620) b!171391))

(assert (= (and b!171390 (not c!30620)) b!171392))

(declare-fun m!199961 () Bool)

(assert (=> b!171391 m!199961))

(assert (=> b!171208 d!51989))

(declare-fun d!51991 () Bool)

(assert (=> d!51991 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85356 () Unit!5252)

(assert (=> d!51991 (= lt!85356 (choose!923 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!113132 () Bool)

(assert (=> d!51991 e!113132))

(declare-fun res!81471 () Bool)

(assert (=> d!51991 (=> (not res!81471) (not e!113132))))

(assert (=> d!51991 (= res!81471 (isStrictlySorted!331 (toList!1096 lt!85155)))))

(assert (=> d!51991 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85356)))

(declare-fun b!171393 () Bool)

(assert (=> b!171393 (= e!113132 (containsKey!188 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!51991 res!81471) b!171393))

(assert (=> d!51991 m!199367))

(assert (=> d!51991 m!199367))

(assert (=> d!51991 m!199575))

(declare-fun m!199963 () Bool)

(assert (=> d!51991 m!199963))

(declare-fun m!199965 () Bool)

(assert (=> d!51991 m!199965))

(assert (=> b!171393 m!199571))

(assert (=> b!171203 d!51991))

(declare-fun d!51993 () Bool)

(assert (=> d!51993 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun bs!7074 () Bool)

(assert (= bs!7074 d!51993))

(assert (=> bs!7074 m!199367))

(declare-fun m!199967 () Bool)

(assert (=> bs!7074 m!199967))

(assert (=> b!171203 d!51993))

(assert (=> b!171203 d!51937))

(declare-fun d!51995 () Bool)

(declare-fun c!30623 () Bool)

(assert (=> d!51995 (= c!30623 ((_ is Nil!2190) (toList!1096 lt!85171)))))

(declare-fun e!113135 () (InoxSet tuple2!3234))

(assert (=> d!51995 (= (content!147 (toList!1096 lt!85171)) e!113135)))

(declare-fun b!171398 () Bool)

(assert (=> b!171398 (= e!113135 ((as const (Array tuple2!3234 Bool)) false))))

(declare-fun b!171399 () Bool)

(assert (=> b!171399 (= e!113135 ((_ map or) (store ((as const (Array tuple2!3234 Bool)) false) (h!2806 (toList!1096 lt!85171)) true) (content!147 (t!6995 (toList!1096 lt!85171)))))))

(assert (= (and d!51995 c!30623) b!171398))

(assert (= (and d!51995 (not c!30623)) b!171399))

(declare-fun m!199969 () Bool)

(assert (=> b!171399 m!199969))

(declare-fun m!199971 () Bool)

(assert (=> b!171399 m!199971))

(assert (=> d!51823 d!51995))

(declare-fun d!51997 () Bool)

(declare-fun lt!85357 () Bool)

(assert (=> d!51997 (= lt!85357 (select (content!147 (toList!1096 lt!85340)) (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))

(declare-fun e!113137 () Bool)

(assert (=> d!51997 (= lt!85357 e!113137)))

(declare-fun res!81472 () Bool)

(assert (=> d!51997 (=> (not res!81472) (not e!113137))))

(assert (=> d!51997 (= res!81472 ((_ is Cons!2189) (toList!1096 lt!85340)))))

(assert (=> d!51997 (= (contains!1146 (toList!1096 lt!85340) (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) lt!85357)))

(declare-fun b!171400 () Bool)

(declare-fun e!113136 () Bool)

(assert (=> b!171400 (= e!113137 e!113136)))

(declare-fun res!81473 () Bool)

(assert (=> b!171400 (=> res!81473 e!113136)))

(assert (=> b!171400 (= res!81473 (= (h!2806 (toList!1096 lt!85340)) (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))

(declare-fun b!171401 () Bool)

(assert (=> b!171401 (= e!113136 (contains!1146 (t!6995 (toList!1096 lt!85340)) (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))

(assert (= (and d!51997 res!81472) b!171400))

(assert (= (and b!171400 (not res!81473)) b!171401))

(declare-fun m!199973 () Bool)

(assert (=> d!51997 m!199973))

(declare-fun m!199975 () Bool)

(assert (=> d!51997 m!199975))

(declare-fun m!199977 () Bool)

(assert (=> b!171401 m!199977))

(assert (=> b!171316 d!51997))

(declare-fun d!51999 () Bool)

(assert (=> d!51999 (= (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) lt!85137)) (v!3914 (getValueByKey!184 (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) lt!85137)))))

(assert (=> d!51917 d!51999))

(declare-fun b!171403 () Bool)

(declare-fun e!113138 () Option!190)

(declare-fun e!113139 () Option!190)

(assert (=> b!171403 (= e!113138 e!113139)))

(declare-fun c!30625 () Bool)

(assert (=> b!171403 (= c!30625 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))) (not (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))) lt!85137))))))

(declare-fun b!171404 () Bool)

(assert (=> b!171404 (= e!113139 (getValueByKey!184 (t!6995 (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))) lt!85137))))

(declare-fun d!52001 () Bool)

(declare-fun c!30624 () Bool)

(assert (=> d!52001 (= c!30624 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))) lt!85137)))))

(assert (=> d!52001 (= (getValueByKey!184 (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) lt!85137) e!113138)))

(declare-fun b!171405 () Bool)

(assert (=> b!171405 (= e!113139 None!188)))

(declare-fun b!171402 () Bool)

(assert (=> b!171402 (= e!113138 (Some!189 (_2!1628 (h!2806 (toList!1096 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))))

(assert (= (and d!52001 c!30624) b!171402))

(assert (= (and d!52001 (not c!30624)) b!171403))

(assert (= (and b!171403 c!30625) b!171404))

(assert (= (and b!171403 (not c!30625)) b!171405))

(declare-fun m!199979 () Bool)

(assert (=> b!171404 m!199979))

(assert (=> d!51917 d!52001))

(declare-fun d!52003 () Bool)

(declare-fun lt!85358 () Bool)

(assert (=> d!52003 (= lt!85358 (select (content!147 (toList!1096 lt!85232)) (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun e!113141 () Bool)

(assert (=> d!52003 (= lt!85358 e!113141)))

(declare-fun res!81474 () Bool)

(assert (=> d!52003 (=> (not res!81474) (not e!113141))))

(assert (=> d!52003 (= res!81474 ((_ is Cons!2189) (toList!1096 lt!85232)))))

(assert (=> d!52003 (= (contains!1146 (toList!1096 lt!85232) (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85358)))

(declare-fun b!171406 () Bool)

(declare-fun e!113140 () Bool)

(assert (=> b!171406 (= e!113141 e!113140)))

(declare-fun res!81475 () Bool)

(assert (=> b!171406 (=> res!81475 e!113140)))

(assert (=> b!171406 (= res!81475 (= (h!2806 (toList!1096 lt!85232)) (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171407 () Bool)

(assert (=> b!171407 (= e!113140 (contains!1146 (t!6995 (toList!1096 lt!85232)) (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (= (and d!52003 res!81474) b!171406))

(assert (= (and b!171406 (not res!81475)) b!171407))

(declare-fun m!199981 () Bool)

(assert (=> d!52003 m!199981))

(declare-fun m!199983 () Bool)

(assert (=> d!52003 m!199983))

(declare-fun m!199985 () Bool)

(assert (=> b!171407 m!199985))

(assert (=> b!171160 d!52003))

(declare-fun d!52005 () Bool)

(declare-fun e!113143 () Bool)

(assert (=> d!52005 e!113143))

(declare-fun res!81476 () Bool)

(assert (=> d!52005 (=> res!81476 e!113143)))

(declare-fun lt!85361 () Bool)

(assert (=> d!52005 (= res!81476 (not lt!85361))))

(declare-fun lt!85359 () Bool)

(assert (=> d!52005 (= lt!85361 lt!85359)))

(declare-fun lt!85360 () Unit!5252)

(declare-fun e!113142 () Unit!5252)

(assert (=> d!52005 (= lt!85360 e!113142)))

(declare-fun c!30626 () Bool)

(assert (=> d!52005 (= c!30626 lt!85359)))

(assert (=> d!52005 (= lt!85359 (containsKey!188 (toList!1096 lt!85320) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> d!52005 (= (contains!1144 lt!85320 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85361)))

(declare-fun b!171408 () Bool)

(declare-fun lt!85362 () Unit!5252)

(assert (=> b!171408 (= e!113142 lt!85362)))

(assert (=> b!171408 (= lt!85362 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85320) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> b!171408 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85320) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171409 () Bool)

(declare-fun Unit!5268 () Unit!5252)

(assert (=> b!171409 (= e!113142 Unit!5268)))

(declare-fun b!171410 () Bool)

(assert (=> b!171410 (= e!113143 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85320) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52005 c!30626) b!171408))

(assert (= (and d!52005 (not c!30626)) b!171409))

(assert (= (and d!52005 (not res!81476)) b!171410))

(declare-fun m!199987 () Bool)

(assert (=> d!52005 m!199987))

(declare-fun m!199989 () Bool)

(assert (=> b!171408 m!199989))

(assert (=> b!171408 m!199795))

(assert (=> b!171408 m!199795))

(declare-fun m!199991 () Bool)

(assert (=> b!171408 m!199991))

(assert (=> b!171410 m!199795))

(assert (=> b!171410 m!199795))

(assert (=> b!171410 m!199991))

(assert (=> d!51901 d!52005))

(declare-fun b!171412 () Bool)

(declare-fun e!113144 () Option!190)

(declare-fun e!113145 () Option!190)

(assert (=> b!171412 (= e!113144 e!113145)))

(declare-fun c!30628 () Bool)

(assert (=> b!171412 (= c!30628 (and ((_ is Cons!2189) lt!85321) (not (= (_1!1628 (h!2806 lt!85321)) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171413 () Bool)

(assert (=> b!171413 (= e!113145 (getValueByKey!184 (t!6995 lt!85321) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun d!52007 () Bool)

(declare-fun c!30627 () Bool)

(assert (=> d!52007 (= c!30627 (and ((_ is Cons!2189) lt!85321) (= (_1!1628 (h!2806 lt!85321)) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!52007 (= (getValueByKey!184 lt!85321 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) e!113144)))

(declare-fun b!171414 () Bool)

(assert (=> b!171414 (= e!113145 None!188)))

(declare-fun b!171411 () Bool)

(assert (=> b!171411 (= e!113144 (Some!189 (_2!1628 (h!2806 lt!85321))))))

(assert (= (and d!52007 c!30627) b!171411))

(assert (= (and d!52007 (not c!30627)) b!171412))

(assert (= (and b!171412 c!30628) b!171413))

(assert (= (and b!171412 (not c!30628)) b!171414))

(declare-fun m!199993 () Bool)

(assert (=> b!171413 m!199993))

(assert (=> d!51901 d!52007))

(declare-fun d!52009 () Bool)

(assert (=> d!52009 (= (getValueByKey!184 lt!85321 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85363 () Unit!5252)

(assert (=> d!52009 (= lt!85363 (choose!924 lt!85321 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun e!113146 () Bool)

(assert (=> d!52009 e!113146))

(declare-fun res!81477 () Bool)

(assert (=> d!52009 (=> (not res!81477) (not e!113146))))

(assert (=> d!52009 (= res!81477 (isStrictlySorted!331 lt!85321))))

(assert (=> d!52009 (= (lemmaContainsTupThenGetReturnValue!97 lt!85321 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85363)))

(declare-fun b!171415 () Bool)

(declare-fun res!81478 () Bool)

(assert (=> b!171415 (=> (not res!81478) (not e!113146))))

(assert (=> b!171415 (= res!81478 (containsKey!188 lt!85321 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171416 () Bool)

(assert (=> b!171416 (= e!113146 (contains!1146 lt!85321 (tuple2!3235 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52009 res!81477) b!171415))

(assert (= (and b!171415 res!81478) b!171416))

(assert (=> d!52009 m!199789))

(declare-fun m!199995 () Bool)

(assert (=> d!52009 m!199995))

(declare-fun m!199997 () Bool)

(assert (=> d!52009 m!199997))

(declare-fun m!199999 () Bool)

(assert (=> b!171415 m!199999))

(declare-fun m!200001 () Bool)

(assert (=> b!171416 m!200001))

(assert (=> d!51901 d!52009))

(declare-fun b!171417 () Bool)

(declare-fun e!113147 () List!2193)

(declare-fun call!17454 () List!2193)

(assert (=> b!171417 (= e!113147 call!17454)))

(declare-fun b!171418 () Bool)

(declare-fun res!81480 () Bool)

(declare-fun e!113151 () Bool)

(assert (=> b!171418 (=> (not res!81480) (not e!113151))))

(declare-fun lt!85364 () List!2193)

(assert (=> b!171418 (= res!81480 (containsKey!188 lt!85364 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171419 () Bool)

(declare-fun e!113150 () List!2193)

(declare-fun e!113148 () List!2193)

(assert (=> b!171419 (= e!113150 e!113148)))

(declare-fun c!30630 () Bool)

(assert (=> b!171419 (= c!30630 (and ((_ is Cons!2189) (toList!1096 call!17406)) (= (_1!1628 (h!2806 (toList!1096 call!17406))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171420 () Bool)

(declare-fun c!30631 () Bool)

(declare-fun e!113149 () List!2193)

(assert (=> b!171420 (= e!113149 (ite c!30630 (t!6995 (toList!1096 call!17406)) (ite c!30631 (Cons!2189 (h!2806 (toList!1096 call!17406)) (t!6995 (toList!1096 call!17406))) Nil!2190)))))

(declare-fun b!171421 () Bool)

(assert (=> b!171421 (= e!113151 (contains!1146 lt!85364 (tuple2!3235 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171422 () Bool)

(declare-fun call!17453 () List!2193)

(assert (=> b!171422 (= e!113150 call!17453)))

(declare-fun bm!17450 () Bool)

(declare-fun c!30632 () Bool)

(assert (=> bm!17450 (= call!17453 ($colon$colon!97 e!113149 (ite c!30632 (h!2806 (toList!1096 call!17406)) (tuple2!3235 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun c!30629 () Bool)

(assert (=> bm!17450 (= c!30629 c!30632)))

(declare-fun bm!17452 () Bool)

(declare-fun call!17455 () List!2193)

(assert (=> bm!17452 (= call!17454 call!17455)))

(declare-fun b!171423 () Bool)

(assert (=> b!171423 (= e!113148 call!17455)))

(declare-fun b!171424 () Bool)

(assert (=> b!171424 (= e!113147 call!17454)))

(declare-fun b!171425 () Bool)

(assert (=> b!171425 (= c!30631 (and ((_ is Cons!2189) (toList!1096 call!17406)) (bvsgt (_1!1628 (h!2806 (toList!1096 call!17406))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> b!171425 (= e!113148 e!113147)))

(declare-fun b!171426 () Bool)

(assert (=> b!171426 (= e!113149 (insertStrictlySorted!100 (t!6995 (toList!1096 call!17406)) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun bm!17451 () Bool)

(assert (=> bm!17451 (= call!17455 call!17453)))

(declare-fun d!52011 () Bool)

(assert (=> d!52011 e!113151))

(declare-fun res!81479 () Bool)

(assert (=> d!52011 (=> (not res!81479) (not e!113151))))

(assert (=> d!52011 (= res!81479 (isStrictlySorted!331 lt!85364))))

(assert (=> d!52011 (= lt!85364 e!113150)))

(assert (=> d!52011 (= c!30632 (and ((_ is Cons!2189) (toList!1096 call!17406)) (bvslt (_1!1628 (h!2806 (toList!1096 call!17406))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!52011 (isStrictlySorted!331 (toList!1096 call!17406))))

(assert (=> d!52011 (= (insertStrictlySorted!100 (toList!1096 call!17406) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85364)))

(assert (= (and d!52011 c!30632) b!171422))

(assert (= (and d!52011 (not c!30632)) b!171419))

(assert (= (and b!171419 c!30630) b!171423))

(assert (= (and b!171419 (not c!30630)) b!171425))

(assert (= (and b!171425 c!30631) b!171424))

(assert (= (and b!171425 (not c!30631)) b!171417))

(assert (= (or b!171424 b!171417) bm!17452))

(assert (= (or b!171423 bm!17452) bm!17451))

(assert (= (or b!171422 bm!17451) bm!17450))

(assert (= (and bm!17450 c!30629) b!171426))

(assert (= (and bm!17450 (not c!30629)) b!171420))

(assert (= (and d!52011 res!81479) b!171418))

(assert (= (and b!171418 res!81480) b!171421))

(declare-fun m!200003 () Bool)

(assert (=> b!171418 m!200003))

(declare-fun m!200005 () Bool)

(assert (=> d!52011 m!200005))

(declare-fun m!200007 () Bool)

(assert (=> d!52011 m!200007))

(declare-fun m!200009 () Bool)

(assert (=> b!171426 m!200009))

(declare-fun m!200011 () Bool)

(assert (=> b!171421 m!200011))

(declare-fun m!200013 () Bool)

(assert (=> bm!17450 m!200013))

(assert (=> d!51901 d!52011))

(declare-fun d!52013 () Bool)

(declare-fun e!113153 () Bool)

(assert (=> d!52013 e!113153))

(declare-fun res!81481 () Bool)

(assert (=> d!52013 (=> res!81481 e!113153)))

(declare-fun lt!85367 () Bool)

(assert (=> d!52013 (= res!81481 (not lt!85367))))

(declare-fun lt!85365 () Bool)

(assert (=> d!52013 (= lt!85367 lt!85365)))

(declare-fun lt!85366 () Unit!5252)

(declare-fun e!113152 () Unit!5252)

(assert (=> d!52013 (= lt!85366 e!113152)))

(declare-fun c!30633 () Bool)

(assert (=> d!52013 (= c!30633 lt!85365)))

(assert (=> d!52013 (= lt!85365 (containsKey!188 (toList!1096 lt!85344) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(assert (=> d!52013 (= (contains!1144 lt!85344 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85367)))

(declare-fun b!171427 () Bool)

(declare-fun lt!85368 () Unit!5252)

(assert (=> b!171427 (= e!113152 lt!85368)))

(assert (=> b!171427 (= lt!85368 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85344) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(assert (=> b!171427 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85344) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun b!171428 () Bool)

(declare-fun Unit!5269 () Unit!5252)

(assert (=> b!171428 (= e!113152 Unit!5269)))

(declare-fun b!171429 () Bool)

(assert (=> b!171429 (= e!113153 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85344) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(assert (= (and d!52013 c!30633) b!171427))

(assert (= (and d!52013 (not c!30633)) b!171428))

(assert (= (and d!52013 (not res!81481)) b!171429))

(declare-fun m!200015 () Bool)

(assert (=> d!52013 m!200015))

(declare-fun m!200017 () Bool)

(assert (=> b!171427 m!200017))

(assert (=> b!171427 m!199891))

(assert (=> b!171427 m!199891))

(declare-fun m!200019 () Bool)

(assert (=> b!171427 m!200019))

(assert (=> b!171429 m!199891))

(assert (=> b!171429 m!199891))

(assert (=> b!171429 m!200019))

(assert (=> d!51931 d!52013))

(declare-fun b!171431 () Bool)

(declare-fun e!113154 () Option!190)

(declare-fun e!113155 () Option!190)

(assert (=> b!171431 (= e!113154 e!113155)))

(declare-fun c!30635 () Bool)

(assert (=> b!171431 (= c!30635 (and ((_ is Cons!2189) lt!85345) (not (= (_1!1628 (h!2806 lt!85345)) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))))

(declare-fun b!171432 () Bool)

(assert (=> b!171432 (= e!113155 (getValueByKey!184 (t!6995 lt!85345) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun d!52015 () Bool)

(declare-fun c!30634 () Bool)

(assert (=> d!52015 (= c!30634 (and ((_ is Cons!2189) lt!85345) (= (_1!1628 (h!2806 lt!85345)) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(assert (=> d!52015 (= (getValueByKey!184 lt!85345 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) e!113154)))

(declare-fun b!171433 () Bool)

(assert (=> b!171433 (= e!113155 None!188)))

(declare-fun b!171430 () Bool)

(assert (=> b!171430 (= e!113154 (Some!189 (_2!1628 (h!2806 lt!85345))))))

(assert (= (and d!52015 c!30634) b!171430))

(assert (= (and d!52015 (not c!30634)) b!171431))

(assert (= (and b!171431 c!30635) b!171432))

(assert (= (and b!171431 (not c!30635)) b!171433))

(declare-fun m!200021 () Bool)

(assert (=> b!171432 m!200021))

(assert (=> d!51931 d!52015))

(declare-fun d!52017 () Bool)

(assert (=> d!52017 (= (getValueByKey!184 lt!85345 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun lt!85369 () Unit!5252)

(assert (=> d!52017 (= lt!85369 (choose!924 lt!85345 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun e!113156 () Bool)

(assert (=> d!52017 e!113156))

(declare-fun res!81482 () Bool)

(assert (=> d!52017 (=> (not res!81482) (not e!113156))))

(assert (=> d!52017 (= res!81482 (isStrictlySorted!331 lt!85345))))

(assert (=> d!52017 (= (lemmaContainsTupThenGetReturnValue!97 lt!85345 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85369)))

(declare-fun b!171434 () Bool)

(declare-fun res!81483 () Bool)

(assert (=> b!171434 (=> (not res!81483) (not e!113156))))

(assert (=> b!171434 (= res!81483 (containsKey!188 lt!85345 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun b!171435 () Bool)

(assert (=> b!171435 (= e!113156 (contains!1146 lt!85345 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(assert (= (and d!52017 res!81482) b!171434))

(assert (= (and b!171434 res!81483) b!171435))

(assert (=> d!52017 m!199885))

(declare-fun m!200023 () Bool)

(assert (=> d!52017 m!200023))

(declare-fun m!200025 () Bool)

(assert (=> d!52017 m!200025))

(declare-fun m!200027 () Bool)

(assert (=> b!171434 m!200027))

(declare-fun m!200029 () Bool)

(assert (=> b!171435 m!200029))

(assert (=> d!51931 d!52017))

(declare-fun b!171436 () Bool)

(declare-fun e!113157 () List!2193)

(declare-fun call!17457 () List!2193)

(assert (=> b!171436 (= e!113157 call!17457)))

(declare-fun b!171437 () Bool)

(declare-fun res!81485 () Bool)

(declare-fun e!113161 () Bool)

(assert (=> b!171437 (=> (not res!81485) (not e!113161))))

(declare-fun lt!85370 () List!2193)

(assert (=> b!171437 (= res!81485 (containsKey!188 lt!85370 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun b!171438 () Bool)

(declare-fun e!113160 () List!2193)

(declare-fun e!113158 () List!2193)

(assert (=> b!171438 (= e!113160 e!113158)))

(declare-fun c!30637 () Bool)

(assert (=> b!171438 (= c!30637 (and ((_ is Cons!2189) (toList!1096 lt!85144)) (= (_1!1628 (h!2806 (toList!1096 lt!85144))) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(declare-fun b!171439 () Bool)

(declare-fun c!30638 () Bool)

(declare-fun e!113159 () List!2193)

(assert (=> b!171439 (= e!113159 (ite c!30637 (t!6995 (toList!1096 lt!85144)) (ite c!30638 (Cons!2189 (h!2806 (toList!1096 lt!85144)) (t!6995 (toList!1096 lt!85144))) Nil!2190)))))

(declare-fun b!171440 () Bool)

(assert (=> b!171440 (= e!113161 (contains!1146 lt!85370 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(declare-fun b!171441 () Bool)

(declare-fun call!17456 () List!2193)

(assert (=> b!171441 (= e!113160 call!17456)))

(declare-fun bm!17453 () Bool)

(declare-fun c!30639 () Bool)

(assert (=> bm!17453 (= call!17456 ($colon$colon!97 e!113159 (ite c!30639 (h!2806 (toList!1096 lt!85144)) (tuple2!3235 (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))))

(declare-fun c!30636 () Bool)

(assert (=> bm!17453 (= c!30636 c!30639)))

(declare-fun bm!17455 () Bool)

(declare-fun call!17458 () List!2193)

(assert (=> bm!17455 (= call!17457 call!17458)))

(declare-fun b!171442 () Bool)

(assert (=> b!171442 (= e!113158 call!17458)))

(declare-fun b!171443 () Bool)

(assert (=> b!171443 (= e!113157 call!17457)))

(declare-fun b!171444 () Bool)

(assert (=> b!171444 (= c!30638 (and ((_ is Cons!2189) (toList!1096 lt!85144)) (bvsgt (_1!1628 (h!2806 (toList!1096 lt!85144))) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(assert (=> b!171444 (= e!113158 e!113157)))

(declare-fun b!171445 () Bool)

(assert (=> b!171445 (= e!113159 (insertStrictlySorted!100 (t!6995 (toList!1096 lt!85144)) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun bm!17454 () Bool)

(assert (=> bm!17454 (= call!17458 call!17456)))

(declare-fun d!52019 () Bool)

(assert (=> d!52019 e!113161))

(declare-fun res!81484 () Bool)

(assert (=> d!52019 (=> (not res!81484) (not e!113161))))

(assert (=> d!52019 (= res!81484 (isStrictlySorted!331 lt!85370))))

(assert (=> d!52019 (= lt!85370 e!113160)))

(assert (=> d!52019 (= c!30639 (and ((_ is Cons!2189) (toList!1096 lt!85144)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85144))) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(assert (=> d!52019 (isStrictlySorted!331 (toList!1096 lt!85144))))

(assert (=> d!52019 (= (insertStrictlySorted!100 (toList!1096 lt!85144) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85370)))

(assert (= (and d!52019 c!30639) b!171441))

(assert (= (and d!52019 (not c!30639)) b!171438))

(assert (= (and b!171438 c!30637) b!171442))

(assert (= (and b!171438 (not c!30637)) b!171444))

(assert (= (and b!171444 c!30638) b!171443))

(assert (= (and b!171444 (not c!30638)) b!171436))

(assert (= (or b!171443 b!171436) bm!17455))

(assert (= (or b!171442 bm!17455) bm!17454))

(assert (= (or b!171441 bm!17454) bm!17453))

(assert (= (and bm!17453 c!30636) b!171445))

(assert (= (and bm!17453 (not c!30636)) b!171439))

(assert (= (and d!52019 res!81484) b!171437))

(assert (= (and b!171437 res!81485) b!171440))

(declare-fun m!200031 () Bool)

(assert (=> b!171437 m!200031))

(declare-fun m!200033 () Bool)

(assert (=> d!52019 m!200033))

(declare-fun m!200035 () Bool)

(assert (=> d!52019 m!200035))

(declare-fun m!200037 () Bool)

(assert (=> b!171445 m!200037))

(declare-fun m!200039 () Bool)

(assert (=> b!171440 m!200039))

(declare-fun m!200041 () Bool)

(assert (=> bm!17453 m!200041))

(assert (=> d!51931 d!52019))

(declare-fun d!52021 () Bool)

(assert (=> d!52021 (= (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309))) lt!85116)) (v!3914 (getValueByKey!184 (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309))) lt!85116)))))

(assert (=> d!51889 d!52021))

(declare-fun b!171447 () Bool)

(declare-fun e!113162 () Option!190)

(declare-fun e!113163 () Option!190)

(assert (=> b!171447 (= e!113162 e!113163)))

(declare-fun c!30641 () Bool)

(assert (=> b!171447 (= c!30641 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)))) (not (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309))))) lt!85116))))))

(declare-fun b!171448 () Bool)

(assert (=> b!171448 (= e!113163 (getValueByKey!184 (t!6995 (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)))) lt!85116))))

(declare-fun d!52023 () Bool)

(declare-fun c!30640 () Bool)

(assert (=> d!52023 (= c!30640 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309))))) lt!85116)))))

(assert (=> d!52023 (= (getValueByKey!184 (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309))) lt!85116) e!113162)))

(declare-fun b!171449 () Bool)

(assert (=> b!171449 (= e!113163 None!188)))

(declare-fun b!171446 () Bool)

(assert (=> b!171446 (= e!113162 (Some!189 (_2!1628 (h!2806 (toList!1096 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)))))))))

(assert (= (and d!52023 c!30640) b!171446))

(assert (= (and d!52023 (not c!30640)) b!171447))

(assert (= (and b!171447 c!30641) b!171448))

(assert (= (and b!171447 (not c!30641)) b!171449))

(declare-fun m!200043 () Bool)

(assert (=> b!171448 m!200043))

(assert (=> d!51889 d!52023))

(declare-fun d!52025 () Bool)

(assert (=> d!52025 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127))))

(declare-fun lt!85371 () Unit!5252)

(assert (=> d!52025 (= lt!85371 (choose!923 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127))))

(declare-fun e!113164 () Bool)

(assert (=> d!52025 e!113164))

(declare-fun res!81486 () Bool)

(assert (=> d!52025 (=> (not res!81486) (not e!113164))))

(assert (=> d!52025 (= res!81486 (isStrictlySorted!331 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(assert (=> d!52025 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127) lt!85371)))

(declare-fun b!171450 () Bool)

(assert (=> b!171450 (= e!113164 (containsKey!188 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127))))

(assert (= (and d!52025 res!81486) b!171450))

(assert (=> d!52025 m!199811))

(assert (=> d!52025 m!199811))

(assert (=> d!52025 m!199813))

(declare-fun m!200045 () Bool)

(assert (=> d!52025 m!200045))

(declare-fun m!200047 () Bool)

(assert (=> d!52025 m!200047))

(assert (=> b!171450 m!199807))

(assert (=> b!171305 d!52025))

(declare-fun d!52027 () Bool)

(assert (=> d!52027 (= (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127)) (not (isEmpty!433 (getValueByKey!184 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127))))))

(declare-fun bs!7075 () Bool)

(assert (= bs!7075 d!52027))

(assert (=> bs!7075 m!199811))

(declare-fun m!200049 () Bool)

(assert (=> bs!7075 m!200049))

(assert (=> b!171305 d!52027))

(declare-fun b!171452 () Bool)

(declare-fun e!113165 () Option!190)

(declare-fun e!113166 () Option!190)

(assert (=> b!171452 (= e!113165 e!113166)))

(declare-fun c!30643 () Bool)

(assert (=> b!171452 (= c!30643 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))) (not (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))) lt!85127))))))

(declare-fun b!171453 () Bool)

(assert (=> b!171453 (= e!113166 (getValueByKey!184 (t!6995 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))) lt!85127))))

(declare-fun c!30642 () Bool)

(declare-fun d!52029 () Bool)

(assert (=> d!52029 (= c!30642 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))) lt!85127)))))

(assert (=> d!52029 (= (getValueByKey!184 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) lt!85127) e!113165)))

(declare-fun b!171454 () Bool)

(assert (=> b!171454 (= e!113166 None!188)))

(declare-fun b!171451 () Bool)

(assert (=> b!171451 (= e!113165 (Some!189 (_2!1628 (h!2806 (toList!1096 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))))

(assert (= (and d!52029 c!30642) b!171451))

(assert (= (and d!52029 (not c!30642)) b!171452))

(assert (= (and b!171452 c!30643) b!171453))

(assert (= (and b!171452 (not c!30643)) b!171454))

(declare-fun m!200051 () Bool)

(assert (=> b!171453 m!200051))

(assert (=> b!171305 d!52029))

(declare-fun d!52031 () Bool)

(assert (=> d!52031 (= (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!171251 d!52031))

(declare-fun b!171455 () Bool)

(declare-fun e!113169 () Bool)

(declare-fun e!113167 () Bool)

(assert (=> b!171455 (= e!113169 e!113167)))

(declare-fun c!30644 () Bool)

(assert (=> b!171455 (= c!30644 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52033 () Bool)

(declare-fun res!81488 () Bool)

(assert (=> d!52033 (=> res!81488 e!113169)))

(assert (=> d!52033 (= res!81488 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!52033 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5387 thiss!1248) (mask!8383 thiss!1248)) e!113169)))

(declare-fun bm!17456 () Bool)

(declare-fun call!17459 () Bool)

(assert (=> bm!17456 (= call!17459 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5387 thiss!1248) (mask!8383 thiss!1248)))))

(declare-fun b!171456 () Bool)

(assert (=> b!171456 (= e!113167 call!17459)))

(declare-fun b!171457 () Bool)

(declare-fun e!113168 () Bool)

(assert (=> b!171457 (= e!113168 call!17459)))

(declare-fun b!171458 () Bool)

(assert (=> b!171458 (= e!113167 e!113168)))

(declare-fun lt!85374 () (_ BitVec 64))

(assert (=> b!171458 (= lt!85374 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!85372 () Unit!5252)

(assert (=> b!171458 (= lt!85372 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5387 thiss!1248) lt!85374 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171458 (arrayContainsKey!0 (_keys!5387 thiss!1248) lt!85374 #b00000000000000000000000000000000)))

(declare-fun lt!85373 () Unit!5252)

(assert (=> b!171458 (= lt!85373 lt!85372)))

(declare-fun res!81487 () Bool)

(assert (=> b!171458 (= res!81487 (= (seekEntryOrOpen!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5387 thiss!1248) (mask!8383 thiss!1248)) (Found!534 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171458 (=> (not res!81487) (not e!113168))))

(assert (= (and d!52033 (not res!81488)) b!171455))

(assert (= (and b!171455 c!30644) b!171458))

(assert (= (and b!171455 (not c!30644)) b!171456))

(assert (= (and b!171458 res!81487) b!171457))

(assert (= (or b!171457 b!171456) bm!17456))

(declare-fun m!200053 () Bool)

(assert (=> b!171455 m!200053))

(assert (=> b!171455 m!200053))

(declare-fun m!200055 () Bool)

(assert (=> b!171455 m!200055))

(declare-fun m!200057 () Bool)

(assert (=> bm!17456 m!200057))

(assert (=> b!171458 m!200053))

(declare-fun m!200059 () Bool)

(assert (=> b!171458 m!200059))

(declare-fun m!200061 () Bool)

(assert (=> b!171458 m!200061))

(assert (=> b!171458 m!200053))

(declare-fun m!200063 () Bool)

(assert (=> b!171458 m!200063))

(assert (=> bm!17448 d!52033))

(declare-fun b!171460 () Bool)

(declare-fun e!113170 () Option!190)

(declare-fun e!113171 () Option!190)

(assert (=> b!171460 (= e!113170 e!113171)))

(declare-fun c!30646 () Bool)

(assert (=> b!171460 (= c!30646 (and ((_ is Cons!2189) (toList!1096 lt!85291)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85291))) (_1!1628 (tuple2!3235 lt!85107 v!309))))))))

(declare-fun b!171461 () Bool)

(assert (=> b!171461 (= e!113171 (getValueByKey!184 (t!6995 (toList!1096 lt!85291)) (_1!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun c!30645 () Bool)

(declare-fun d!52035 () Bool)

(assert (=> d!52035 (= c!30645 (and ((_ is Cons!2189) (toList!1096 lt!85291)) (= (_1!1628 (h!2806 (toList!1096 lt!85291))) (_1!1628 (tuple2!3235 lt!85107 v!309)))))))

(assert (=> d!52035 (= (getValueByKey!184 (toList!1096 lt!85291) (_1!1628 (tuple2!3235 lt!85107 v!309))) e!113170)))

(declare-fun b!171462 () Bool)

(assert (=> b!171462 (= e!113171 None!188)))

(declare-fun b!171459 () Bool)

(assert (=> b!171459 (= e!113170 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85291)))))))

(assert (= (and d!52035 c!30645) b!171459))

(assert (= (and d!52035 (not c!30645)) b!171460))

(assert (= (and b!171460 c!30646) b!171461))

(assert (= (and b!171460 (not c!30646)) b!171462))

(declare-fun m!200065 () Bool)

(assert (=> b!171461 m!200065))

(assert (=> b!171282 d!52035))

(declare-fun d!52037 () Bool)

(declare-fun res!81489 () Bool)

(declare-fun e!113172 () Bool)

(assert (=> d!52037 (=> res!81489 e!113172)))

(assert (=> d!52037 (= res!81489 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (= (_1!1628 (h!2806 (toList!1096 lt!85130))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52037 (= (containsKey!188 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000) e!113172)))

(declare-fun b!171463 () Bool)

(declare-fun e!113173 () Bool)

(assert (=> b!171463 (= e!113172 e!113173)))

(declare-fun res!81490 () Bool)

(assert (=> b!171463 (=> (not res!81490) (not e!113173))))

(assert (=> b!171463 (= res!81490 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85130))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85130))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2189) (toList!1096 lt!85130)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85130))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171464 () Bool)

(assert (=> b!171464 (= e!113173 (containsKey!188 (t!6995 (toList!1096 lt!85130)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52037 (not res!81489)) b!171463))

(assert (= (and b!171463 res!81490) b!171464))

(declare-fun m!200067 () Bool)

(assert (=> b!171464 m!200067))

(assert (=> d!51811 d!52037))

(assert (=> d!51843 d!51841))

(declare-fun d!52039 () Bool)

(assert (=> d!52039 (= (getValueByKey!184 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!189 (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52039 true))

(declare-fun _$22!531 () Unit!5252)

(assert (=> d!52039 (= (choose!924 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) _$22!531)))

(declare-fun bs!7076 () Bool)

(assert (= bs!7076 d!52039))

(assert (=> bs!7076 m!199361))

(assert (=> d!51843 d!52039))

(declare-fun d!52041 () Bool)

(declare-fun res!81491 () Bool)

(declare-fun e!113174 () Bool)

(assert (=> d!52041 (=> res!81491 e!113174)))

(assert (=> d!52041 (= res!81491 (or ((_ is Nil!2190) lt!85156) ((_ is Nil!2190) (t!6995 lt!85156))))))

(assert (=> d!52041 (= (isStrictlySorted!331 lt!85156) e!113174)))

(declare-fun b!171465 () Bool)

(declare-fun e!113175 () Bool)

(assert (=> b!171465 (= e!113174 e!113175)))

(declare-fun res!81492 () Bool)

(assert (=> b!171465 (=> (not res!81492) (not e!113175))))

(assert (=> b!171465 (= res!81492 (bvslt (_1!1628 (h!2806 lt!85156)) (_1!1628 (h!2806 (t!6995 lt!85156)))))))

(declare-fun b!171466 () Bool)

(assert (=> b!171466 (= e!113175 (isStrictlySorted!331 (t!6995 lt!85156)))))

(assert (= (and d!52041 (not res!81491)) b!171465))

(assert (= (and b!171465 res!81492) b!171466))

(declare-fun m!200069 () Bool)

(assert (=> b!171466 m!200069))

(assert (=> d!51843 d!52041))

(declare-fun d!52043 () Bool)

(assert (=> d!52043 (= (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102)) (not (isEmpty!433 (getValueByKey!184 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102))))))

(declare-fun bs!7077 () Bool)

(assert (= bs!7077 d!52043))

(assert (=> bs!7077 m!199717))

(declare-fun m!200071 () Bool)

(assert (=> bs!7077 m!200071))

(assert (=> b!171287 d!52043))

(declare-fun b!171468 () Bool)

(declare-fun e!113176 () Option!190)

(declare-fun e!113177 () Option!190)

(assert (=> b!171468 (= e!113176 e!113177)))

(declare-fun c!30648 () Bool)

(assert (=> b!171468 (= c!30648 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)))) (not (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))))) lt!85102))))))

(declare-fun b!171469 () Bool)

(assert (=> b!171469 (= e!113177 (getValueByKey!184 (t!6995 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)))) lt!85102))))

(declare-fun c!30647 () Bool)

(declare-fun d!52045 () Bool)

(assert (=> d!52045 (= c!30647 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))))) lt!85102)))))

(assert (=> d!52045 (= (getValueByKey!184 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102) e!113176)))

(declare-fun b!171470 () Bool)

(assert (=> b!171470 (= e!113177 None!188)))

(declare-fun b!171467 () Bool)

(assert (=> b!171467 (= e!113176 (Some!189 (_2!1628 (h!2806 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)))))))))

(assert (= (and d!52045 c!30647) b!171467))

(assert (= (and d!52045 (not c!30647)) b!171468))

(assert (= (and b!171468 c!30648) b!171469))

(assert (= (and b!171468 (not c!30648)) b!171470))

(declare-fun m!200073 () Bool)

(assert (=> b!171469 m!200073))

(assert (=> b!171287 d!52045))

(assert (=> d!51813 d!51779))

(assert (=> d!51813 d!51777))

(assert (=> d!51813 d!51771))

(assert (=> b!171199 d!52031))

(declare-fun d!52047 () Bool)

(assert (=> d!52047 (= (apply!129 lt!85270 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1939 (getValueByKey!184 (toList!1096 lt!85270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7078 () Bool)

(assert (= bs!7078 d!52047))

(declare-fun m!200075 () Bool)

(assert (=> bs!7078 m!200075))

(assert (=> bs!7078 m!200075))

(declare-fun m!200077 () Bool)

(assert (=> bs!7078 m!200077))

(assert (=> b!171260 d!52047))

(declare-fun d!52049 () Bool)

(declare-fun isEmpty!435 (List!2193) Bool)

(assert (=> d!52049 (= (isEmpty!434 lt!85239) (isEmpty!435 (toList!1096 lt!85239)))))

(declare-fun bs!7079 () Bool)

(assert (= bs!7079 d!52049))

(declare-fun m!200079 () Bool)

(assert (=> bs!7079 m!200079))

(assert (=> b!171169 d!52049))

(declare-fun d!52051 () Bool)

(assert (=> d!52051 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85375 () Unit!5252)

(assert (=> d!52051 (= lt!85375 (choose!923 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113178 () Bool)

(assert (=> d!52051 e!113178))

(declare-fun res!81493 () Bool)

(assert (=> d!52051 (=> (not res!81493) (not e!113178))))

(assert (=> d!52051 (= res!81493 (isStrictlySorted!331 (toList!1096 lt!85105)))))

(assert (=> d!52051 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000) lt!85375)))

(declare-fun b!171471 () Bool)

(assert (=> b!171471 (= e!113178 (containsKey!188 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52051 res!81493) b!171471))

(assert (=> d!52051 m!199773))

(assert (=> d!52051 m!199773))

(assert (=> d!52051 m!199775))

(declare-fun m!200081 () Bool)

(assert (=> d!52051 m!200081))

(declare-fun m!200083 () Bool)

(assert (=> d!52051 m!200083))

(assert (=> b!171471 m!199769))

(assert (=> b!171298 d!52051))

(declare-fun d!52053 () Bool)

(assert (=> d!52053 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7080 () Bool)

(assert (= bs!7080 d!52053))

(assert (=> bs!7080 m!199773))

(declare-fun m!200085 () Bool)

(assert (=> bs!7080 m!200085))

(assert (=> b!171298 d!52053))

(declare-fun b!171473 () Bool)

(declare-fun e!113179 () Option!190)

(declare-fun e!113180 () Option!190)

(assert (=> b!171473 (= e!113179 e!113180)))

(declare-fun c!30650 () Bool)

(assert (=> b!171473 (= c!30650 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85105))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171474 () Bool)

(assert (=> b!171474 (= e!113180 (getValueByKey!184 (t!6995 (toList!1096 lt!85105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52055 () Bool)

(declare-fun c!30649 () Bool)

(assert (=> d!52055 (= c!30649 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (= (_1!1628 (h!2806 (toList!1096 lt!85105))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52055 (= (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000) e!113179)))

(declare-fun b!171475 () Bool)

(assert (=> b!171475 (= e!113180 None!188)))

(declare-fun b!171472 () Bool)

(assert (=> b!171472 (= e!113179 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85105)))))))

(assert (= (and d!52055 c!30649) b!171472))

(assert (= (and d!52055 (not c!30649)) b!171473))

(assert (= (and b!171473 c!30650) b!171474))

(assert (= (and b!171473 (not c!30650)) b!171475))

(declare-fun m!200087 () Bool)

(assert (=> b!171474 m!200087))

(assert (=> b!171298 d!52055))

(declare-fun d!52057 () Bool)

(assert (=> d!52057 (= (apply!129 lt!85270 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)) (get!1939 (getValueByKey!184 (toList!1096 lt!85270) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000))))))

(declare-fun bs!7081 () Bool)

(assert (= bs!7081 d!52057))

(assert (=> bs!7081 m!199545))

(declare-fun m!200089 () Bool)

(assert (=> bs!7081 m!200089))

(assert (=> bs!7081 m!200089))

(declare-fun m!200091 () Bool)

(assert (=> bs!7081 m!200091))

(assert (=> b!171277 d!52057))

(declare-fun d!52059 () Bool)

(declare-fun c!30651 () Bool)

(assert (=> d!52059 (= c!30651 ((_ is ValueCellFull!1659) (select (arr!3390 (_values!3538 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun e!113181 () V!4987)

(assert (=> d!52059 (= (get!1938 (select (arr!3390 (_values!3538 lt!85045)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 lt!85045) #b0000000000000000000000000000000000000000000000000000000000000000)) e!113181)))

(declare-fun b!171476 () Bool)

(assert (=> b!171476 (= e!113181 (get!1940 (select (arr!3390 (_values!3538 lt!85045)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 lt!85045) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171477 () Bool)

(assert (=> b!171477 (= e!113181 (get!1941 (select (arr!3390 (_values!3538 lt!85045)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 lt!85045) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52059 c!30651) b!171476))

(assert (= (and d!52059 (not c!30651)) b!171477))

(assert (=> b!171476 m!199659))

(assert (=> b!171476 m!199661))

(declare-fun m!200093 () Bool)

(assert (=> b!171476 m!200093))

(assert (=> b!171477 m!199659))

(assert (=> b!171477 m!199661))

(declare-fun m!200095 () Bool)

(assert (=> b!171477 m!200095))

(assert (=> b!171277 d!52059))

(declare-fun lt!85376 () Bool)

(declare-fun d!52061 () Bool)

(assert (=> d!52061 (= lt!85376 (select (content!147 (toList!1096 lt!85344)) (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))

(declare-fun e!113183 () Bool)

(assert (=> d!52061 (= lt!85376 e!113183)))

(declare-fun res!81494 () Bool)

(assert (=> d!52061 (=> (not res!81494) (not e!113183))))

(assert (=> d!52061 (= res!81494 ((_ is Cons!2189) (toList!1096 lt!85344)))))

(assert (=> d!52061 (= (contains!1146 (toList!1096 lt!85344) (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) lt!85376)))

(declare-fun b!171478 () Bool)

(declare-fun e!113182 () Bool)

(assert (=> b!171478 (= e!113183 e!113182)))

(declare-fun res!81495 () Bool)

(assert (=> b!171478 (=> res!81495 e!113182)))

(assert (=> b!171478 (= res!81495 (= (h!2806 (toList!1096 lt!85344)) (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))

(declare-fun b!171479 () Bool)

(assert (=> b!171479 (= e!113182 (contains!1146 (t!6995 (toList!1096 lt!85344)) (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))

(assert (= (and d!52061 res!81494) b!171478))

(assert (= (and b!171478 (not res!81495)) b!171479))

(declare-fun m!200097 () Bool)

(assert (=> d!52061 m!200097))

(declare-fun m!200099 () Bool)

(assert (=> d!52061 m!200099))

(declare-fun m!200101 () Bool)

(assert (=> b!171479 m!200101))

(assert (=> b!171318 d!52061))

(declare-fun d!52063 () Bool)

(assert (=> d!52063 (= (apply!129 lt!85221 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (get!1939 (getValueByKey!184 (toList!1096 lt!85221) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7082 () Bool)

(assert (= bs!7082 d!52063))

(assert (=> bs!7082 m!199241))

(declare-fun m!200103 () Bool)

(assert (=> bs!7082 m!200103))

(assert (=> bs!7082 m!200103))

(declare-fun m!200105 () Bool)

(assert (=> bs!7082 m!200105))

(assert (=> b!171141 d!52063))

(assert (=> b!171141 d!51851))

(declare-fun b!171481 () Bool)

(declare-fun e!113184 () Option!190)

(declare-fun e!113185 () Option!190)

(assert (=> b!171481 (= e!113184 e!113185)))

(declare-fun c!30653 () Bool)

(assert (=> b!171481 (= c!30653 (and ((_ is Cons!2189) (t!6995 (toList!1096 lt!85155))) (not (= (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85155)))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!171482 () Bool)

(assert (=> b!171482 (= e!113185 (getValueByKey!184 (t!6995 (t!6995 (toList!1096 lt!85155))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!52065 () Bool)

(declare-fun c!30652 () Bool)

(assert (=> d!52065 (= c!30652 (and ((_ is Cons!2189) (t!6995 (toList!1096 lt!85155))) (= (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85155)))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52065 (= (getValueByKey!184 (t!6995 (toList!1096 lt!85155)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113184)))

(declare-fun b!171483 () Bool)

(assert (=> b!171483 (= e!113185 None!188)))

(declare-fun b!171480 () Bool)

(assert (=> b!171480 (= e!113184 (Some!189 (_2!1628 (h!2806 (t!6995 (toList!1096 lt!85155))))))))

(assert (= (and d!52065 c!30652) b!171480))

(assert (= (and d!52065 (not c!30652)) b!171481))

(assert (= (and b!171481 c!30653) b!171482))

(assert (= (and b!171481 (not c!30653)) b!171483))

(declare-fun m!200107 () Bool)

(assert (=> b!171482 m!200107))

(assert (=> b!171329 d!52065))

(declare-fun d!52067 () Bool)

(declare-fun lt!85377 () Bool)

(assert (=> d!52067 (= lt!85377 (select (content!147 (toList!1096 lt!85320)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(declare-fun e!113187 () Bool)

(assert (=> d!52067 (= lt!85377 e!113187)))

(declare-fun res!81496 () Bool)

(assert (=> d!52067 (=> (not res!81496) (not e!113187))))

(assert (=> d!52067 (= res!81496 ((_ is Cons!2189) (toList!1096 lt!85320)))))

(assert (=> d!52067 (= (contains!1146 (toList!1096 lt!85320) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) lt!85377)))

(declare-fun b!171484 () Bool)

(declare-fun e!113186 () Bool)

(assert (=> b!171484 (= e!113187 e!113186)))

(declare-fun res!81497 () Bool)

(assert (=> b!171484 (=> res!81497 e!113186)))

(assert (=> b!171484 (= res!81497 (= (h!2806 (toList!1096 lt!85320)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(declare-fun b!171485 () Bool)

(assert (=> b!171485 (= e!113186 (contains!1146 (t!6995 (toList!1096 lt!85320)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(assert (= (and d!52067 res!81496) b!171484))

(assert (= (and b!171484 (not res!81497)) b!171485))

(declare-fun m!200109 () Bool)

(assert (=> d!52067 m!200109))

(declare-fun m!200111 () Bool)

(assert (=> d!52067 m!200111))

(declare-fun m!200113 () Bool)

(assert (=> b!171485 m!200113))

(assert (=> b!171304 d!52067))

(declare-fun b!171486 () Bool)

(declare-fun e!113190 () Bool)

(declare-fun e!113188 () Bool)

(assert (=> b!171486 (= e!113190 e!113188)))

(declare-fun c!30654 () Bool)

(assert (=> b!171486 (= c!30654 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52069 () Bool)

(declare-fun res!81499 () Bool)

(assert (=> d!52069 (=> res!81499 e!113190)))

(assert (=> d!52069 (= res!81499 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!52069 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5387 lt!85045) (mask!8383 lt!85045)) e!113190)))

(declare-fun bm!17457 () Bool)

(declare-fun call!17460 () Bool)

(assert (=> bm!17457 (= call!17460 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5387 lt!85045) (mask!8383 lt!85045)))))

(declare-fun b!171487 () Bool)

(assert (=> b!171487 (= e!113188 call!17460)))

(declare-fun b!171488 () Bool)

(declare-fun e!113189 () Bool)

(assert (=> b!171488 (= e!113189 call!17460)))

(declare-fun b!171489 () Bool)

(assert (=> b!171489 (= e!113188 e!113189)))

(declare-fun lt!85380 () (_ BitVec 64))

(assert (=> b!171489 (= lt!85380 (select (arr!3389 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!85378 () Unit!5252)

(assert (=> b!171489 (= lt!85378 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5387 lt!85045) lt!85380 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171489 (arrayContainsKey!0 (_keys!5387 lt!85045) lt!85380 #b00000000000000000000000000000000)))

(declare-fun lt!85379 () Unit!5252)

(assert (=> b!171489 (= lt!85379 lt!85378)))

(declare-fun res!81498 () Bool)

(assert (=> b!171489 (= res!81498 (= (seekEntryOrOpen!0 (select (arr!3389 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5387 lt!85045) (mask!8383 lt!85045)) (Found!534 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171489 (=> (not res!81498) (not e!113189))))

(assert (= (and d!52069 (not res!81499)) b!171486))

(assert (= (and b!171486 c!30654) b!171489))

(assert (= (and b!171486 (not c!30654)) b!171487))

(assert (= (and b!171489 res!81498) b!171488))

(assert (= (or b!171488 b!171487) bm!17457))

(declare-fun m!200115 () Bool)

(assert (=> b!171486 m!200115))

(assert (=> b!171486 m!200115))

(declare-fun m!200117 () Bool)

(assert (=> b!171486 m!200117))

(declare-fun m!200119 () Bool)

(assert (=> bm!17457 m!200119))

(assert (=> b!171489 m!200115))

(declare-fun m!200121 () Bool)

(assert (=> b!171489 m!200121))

(declare-fun m!200123 () Bool)

(assert (=> b!171489 m!200123))

(assert (=> b!171489 m!200115))

(declare-fun m!200125 () Bool)

(assert (=> b!171489 m!200125))

(assert (=> bm!17430 d!52069))

(declare-fun d!52071 () Bool)

(declare-fun e!113192 () Bool)

(assert (=> d!52071 e!113192))

(declare-fun res!81500 () Bool)

(assert (=> d!52071 (=> res!81500 e!113192)))

(declare-fun lt!85383 () Bool)

(assert (=> d!52071 (= res!81500 (not lt!85383))))

(declare-fun lt!85381 () Bool)

(assert (=> d!52071 (= lt!85383 lt!85381)))

(declare-fun lt!85382 () Unit!5252)

(declare-fun e!113191 () Unit!5252)

(assert (=> d!52071 (= lt!85382 e!113191)))

(declare-fun c!30655 () Bool)

(assert (=> d!52071 (= c!30655 lt!85381)))

(assert (=> d!52071 (= lt!85381 (containsKey!188 (toList!1096 lt!85330) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(assert (=> d!52071 (= (contains!1144 lt!85330 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) lt!85383)))

(declare-fun b!171490 () Bool)

(declare-fun lt!85384 () Unit!5252)

(assert (=> b!171490 (= e!113191 lt!85384)))

(assert (=> b!171490 (= lt!85384 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85330) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(assert (=> b!171490 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85330) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun b!171491 () Bool)

(declare-fun Unit!5270 () Unit!5252)

(assert (=> b!171491 (= e!113191 Unit!5270)))

(declare-fun b!171492 () Bool)

(assert (=> b!171492 (= e!113192 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85330) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52071 c!30655) b!171490))

(assert (= (and d!52071 (not c!30655)) b!171491))

(assert (= (and d!52071 (not res!81500)) b!171492))

(declare-fun m!200127 () Bool)

(assert (=> d!52071 m!200127))

(declare-fun m!200129 () Bool)

(assert (=> b!171490 m!200129))

(assert (=> b!171490 m!199831))

(assert (=> b!171490 m!199831))

(declare-fun m!200131 () Bool)

(assert (=> b!171490 m!200131))

(assert (=> b!171492 m!199831))

(assert (=> b!171492 m!199831))

(assert (=> b!171492 m!200131))

(assert (=> d!51913 d!52071))

(declare-fun b!171494 () Bool)

(declare-fun e!113193 () Option!190)

(declare-fun e!113194 () Option!190)

(assert (=> b!171494 (= e!113193 e!113194)))

(declare-fun c!30657 () Bool)

(assert (=> b!171494 (= c!30657 (and ((_ is Cons!2189) lt!85331) (not (= (_1!1628 (h!2806 lt!85331)) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171495 () Bool)

(assert (=> b!171495 (= e!113194 (getValueByKey!184 (t!6995 lt!85331) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun c!30656 () Bool)

(declare-fun d!52073 () Bool)

(assert (=> d!52073 (= c!30656 (and ((_ is Cons!2189) lt!85331) (= (_1!1628 (h!2806 lt!85331)) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(assert (=> d!52073 (= (getValueByKey!184 lt!85331 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) e!113193)))

(declare-fun b!171496 () Bool)

(assert (=> b!171496 (= e!113194 None!188)))

(declare-fun b!171493 () Bool)

(assert (=> b!171493 (= e!113193 (Some!189 (_2!1628 (h!2806 lt!85331))))))

(assert (= (and d!52073 c!30656) b!171493))

(assert (= (and d!52073 (not c!30656)) b!171494))

(assert (= (and b!171494 c!30657) b!171495))

(assert (= (and b!171494 (not c!30657)) b!171496))

(declare-fun m!200133 () Bool)

(assert (=> b!171495 m!200133))

(assert (=> d!51913 d!52073))

(declare-fun d!52075 () Bool)

(assert (=> d!52075 (= (getValueByKey!184 lt!85331 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85385 () Unit!5252)

(assert (=> d!52075 (= lt!85385 (choose!924 lt!85331 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun e!113195 () Bool)

(assert (=> d!52075 e!113195))

(declare-fun res!81501 () Bool)

(assert (=> d!52075 (=> (not res!81501) (not e!113195))))

(assert (=> d!52075 (= res!81501 (isStrictlySorted!331 lt!85331))))

(assert (=> d!52075 (= (lemmaContainsTupThenGetReturnValue!97 lt!85331 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) lt!85385)))

(declare-fun b!171497 () Bool)

(declare-fun res!81502 () Bool)

(assert (=> b!171497 (=> (not res!81502) (not e!113195))))

(assert (=> b!171497 (= res!81502 (containsKey!188 lt!85331 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun b!171498 () Bool)

(assert (=> b!171498 (= e!113195 (contains!1146 lt!85331 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52075 res!81501) b!171497))

(assert (= (and b!171497 res!81502) b!171498))

(assert (=> d!52075 m!199825))

(declare-fun m!200135 () Bool)

(assert (=> d!52075 m!200135))

(declare-fun m!200137 () Bool)

(assert (=> d!52075 m!200137))

(declare-fun m!200139 () Bool)

(assert (=> b!171497 m!200139))

(declare-fun m!200141 () Bool)

(assert (=> b!171498 m!200141))

(assert (=> d!51913 d!52075))

(declare-fun b!171499 () Bool)

(declare-fun e!113196 () List!2193)

(declare-fun call!17462 () List!2193)

(assert (=> b!171499 (= e!113196 call!17462)))

(declare-fun b!171500 () Bool)

(declare-fun res!81504 () Bool)

(declare-fun e!113200 () Bool)

(assert (=> b!171500 (=> (not res!81504) (not e!113200))))

(declare-fun lt!85386 () List!2193)

(assert (=> b!171500 (= res!81504 (containsKey!188 lt!85386 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun b!171501 () Bool)

(declare-fun e!113199 () List!2193)

(declare-fun e!113197 () List!2193)

(assert (=> b!171501 (= e!113199 e!113197)))

(declare-fun c!30659 () Bool)

(assert (=> b!171501 (= c!30659 (and ((_ is Cons!2189) (toList!1096 lt!85136)) (= (_1!1628 (h!2806 (toList!1096 lt!85136))) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(declare-fun b!171502 () Bool)

(declare-fun e!113198 () List!2193)

(declare-fun c!30660 () Bool)

(assert (=> b!171502 (= e!113198 (ite c!30659 (t!6995 (toList!1096 lt!85136)) (ite c!30660 (Cons!2189 (h!2806 (toList!1096 lt!85136)) (t!6995 (toList!1096 lt!85136))) Nil!2190)))))

(declare-fun b!171503 () Bool)

(assert (=> b!171503 (= e!113200 (contains!1146 lt!85386 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(declare-fun b!171504 () Bool)

(declare-fun call!17461 () List!2193)

(assert (=> b!171504 (= e!113199 call!17461)))

(declare-fun c!30661 () Bool)

(declare-fun bm!17458 () Bool)

(assert (=> bm!17458 (= call!17461 ($colon$colon!97 e!113198 (ite c!30661 (h!2806 (toList!1096 lt!85136)) (tuple2!3235 (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))))

(declare-fun c!30658 () Bool)

(assert (=> bm!17458 (= c!30658 c!30661)))

(declare-fun bm!17460 () Bool)

(declare-fun call!17463 () List!2193)

(assert (=> bm!17460 (= call!17462 call!17463)))

(declare-fun b!171505 () Bool)

(assert (=> b!171505 (= e!113197 call!17463)))

(declare-fun b!171506 () Bool)

(assert (=> b!171506 (= e!113196 call!17462)))

(declare-fun b!171507 () Bool)

(assert (=> b!171507 (= c!30660 (and ((_ is Cons!2189) (toList!1096 lt!85136)) (bvsgt (_1!1628 (h!2806 (toList!1096 lt!85136))) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(assert (=> b!171507 (= e!113197 e!113196)))

(declare-fun b!171508 () Bool)

(assert (=> b!171508 (= e!113198 (insertStrictlySorted!100 (t!6995 (toList!1096 lt!85136)) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))))

(declare-fun bm!17459 () Bool)

(assert (=> bm!17459 (= call!17463 call!17461)))

(declare-fun d!52077 () Bool)

(assert (=> d!52077 e!113200))

(declare-fun res!81503 () Bool)

(assert (=> d!52077 (=> (not res!81503) (not e!113200))))

(assert (=> d!52077 (= res!81503 (isStrictlySorted!331 lt!85386))))

(assert (=> d!52077 (= lt!85386 e!113199)))

(assert (=> d!52077 (= c!30661 (and ((_ is Cons!2189) (toList!1096 lt!85136)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85136))) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))

(assert (=> d!52077 (isStrictlySorted!331 (toList!1096 lt!85136))))

(assert (=> d!52077 (= (insertStrictlySorted!100 (toList!1096 lt!85136) (_1!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) lt!85386)))

(assert (= (and d!52077 c!30661) b!171504))

(assert (= (and d!52077 (not c!30661)) b!171501))

(assert (= (and b!171501 c!30659) b!171505))

(assert (= (and b!171501 (not c!30659)) b!171507))

(assert (= (and b!171507 c!30660) b!171506))

(assert (= (and b!171507 (not c!30660)) b!171499))

(assert (= (or b!171506 b!171499) bm!17460))

(assert (= (or b!171505 bm!17460) bm!17459))

(assert (= (or b!171504 bm!17459) bm!17458))

(assert (= (and bm!17458 c!30658) b!171508))

(assert (= (and bm!17458 (not c!30658)) b!171502))

(assert (= (and d!52077 res!81503) b!171500))

(assert (= (and b!171500 res!81504) b!171503))

(declare-fun m!200143 () Bool)

(assert (=> b!171500 m!200143))

(declare-fun m!200145 () Bool)

(assert (=> d!52077 m!200145))

(declare-fun m!200147 () Bool)

(assert (=> d!52077 m!200147))

(declare-fun m!200149 () Bool)

(assert (=> b!171508 m!200149))

(declare-fun m!200151 () Bool)

(assert (=> b!171503 m!200151))

(declare-fun m!200153 () Bool)

(assert (=> bm!17458 m!200153))

(assert (=> d!51913 d!52077))

(declare-fun d!52079 () Bool)

(assert (=> d!52079 (= (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) lt!85128)) (v!3914 (getValueByKey!184 (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) lt!85128)))))

(assert (=> d!51921 d!52079))

(declare-fun b!171510 () Bool)

(declare-fun e!113201 () Option!190)

(declare-fun e!113202 () Option!190)

(assert (=> b!171510 (= e!113201 e!113202)))

(declare-fun c!30663 () Bool)

(assert (=> b!171510 (= c!30663 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))) (not (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))) lt!85128))))))

(declare-fun b!171511 () Bool)

(assert (=> b!171511 (= e!113202 (getValueByKey!184 (t!6995 (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))) lt!85128))))

(declare-fun d!52081 () Bool)

(declare-fun c!30662 () Bool)

(assert (=> d!52081 (= c!30662 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))))) lt!85128)))))

(assert (=> d!52081 (= (getValueByKey!184 (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248)))) lt!85128) e!113201)))

(declare-fun b!171512 () Bool)

(assert (=> b!171512 (= e!113202 None!188)))

(declare-fun b!171509 () Bool)

(assert (=> b!171509 (= e!113201 (Some!189 (_2!1628 (h!2806 (toList!1096 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))))))

(assert (= (and d!52081 c!30662) b!171509))

(assert (= (and d!52081 (not c!30662)) b!171510))

(assert (= (and b!171510 c!30663) b!171511))

(assert (= (and b!171510 (not c!30663)) b!171512))

(declare-fun m!200155 () Bool)

(assert (=> b!171511 m!200155))

(assert (=> d!51921 d!52081))

(declare-fun d!52083 () Bool)

(declare-fun lt!85387 () Bool)

(assert (=> d!52083 (= lt!85387 (select (content!147 (toList!1096 lt!85175)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(declare-fun e!113204 () Bool)

(assert (=> d!52083 (= lt!85387 e!113204)))

(declare-fun res!81505 () Bool)

(assert (=> d!52083 (=> (not res!81505) (not e!113204))))

(assert (=> d!52083 (= res!81505 ((_ is Cons!2189) (toList!1096 lt!85175)))))

(assert (=> d!52083 (= (contains!1146 (toList!1096 lt!85175) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) lt!85387)))

(declare-fun b!171513 () Bool)

(declare-fun e!113203 () Bool)

(assert (=> b!171513 (= e!113204 e!113203)))

(declare-fun res!81506 () Bool)

(assert (=> b!171513 (=> res!81506 e!113203)))

(assert (=> b!171513 (= res!81506 (= (h!2806 (toList!1096 lt!85175)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(declare-fun b!171514 () Bool)

(assert (=> b!171514 (= e!113203 (contains!1146 (t!6995 (toList!1096 lt!85175)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))

(assert (= (and d!52083 res!81505) b!171513))

(assert (= (and b!171513 (not res!81506)) b!171514))

(declare-fun m!200157 () Bool)

(assert (=> d!52083 m!200157))

(declare-fun m!200159 () Bool)

(assert (=> d!52083 m!200159))

(declare-fun m!200161 () Bool)

(assert (=> b!171514 m!200161))

(assert (=> b!171040 d!52083))

(declare-fun d!52085 () Bool)

(declare-fun e!113206 () Bool)

(assert (=> d!52085 e!113206))

(declare-fun res!81507 () Bool)

(assert (=> d!52085 (=> res!81507 e!113206)))

(declare-fun lt!85390 () Bool)

(assert (=> d!52085 (= res!81507 (not lt!85390))))

(declare-fun lt!85388 () Bool)

(assert (=> d!52085 (= lt!85390 lt!85388)))

(declare-fun lt!85389 () Unit!5252)

(declare-fun e!113205 () Unit!5252)

(assert (=> d!52085 (= lt!85389 e!113205)))

(declare-fun c!30664 () Bool)

(assert (=> d!52085 (= c!30664 lt!85388)))

(assert (=> d!52085 (= lt!85388 (containsKey!188 (toList!1096 lt!85309) (_1!1628 (tuple2!3235 lt!85104 v!309))))))

(assert (=> d!52085 (= (contains!1144 lt!85309 (_1!1628 (tuple2!3235 lt!85104 v!309))) lt!85390)))

(declare-fun b!171515 () Bool)

(declare-fun lt!85391 () Unit!5252)

(assert (=> b!171515 (= e!113205 lt!85391)))

(assert (=> b!171515 (= lt!85391 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85309) (_1!1628 (tuple2!3235 lt!85104 v!309))))))

(assert (=> b!171515 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85309) (_1!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun b!171516 () Bool)

(declare-fun Unit!5271 () Unit!5252)

(assert (=> b!171516 (= e!113205 Unit!5271)))

(declare-fun b!171517 () Bool)

(assert (=> b!171517 (= e!113206 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85309) (_1!1628 (tuple2!3235 lt!85104 v!309)))))))

(assert (= (and d!52085 c!30664) b!171515))

(assert (= (and d!52085 (not c!30664)) b!171516))

(assert (= (and d!52085 (not res!81507)) b!171517))

(declare-fun m!200163 () Bool)

(assert (=> d!52085 m!200163))

(declare-fun m!200165 () Bool)

(assert (=> b!171515 m!200165))

(assert (=> b!171515 m!199753))

(assert (=> b!171515 m!199753))

(declare-fun m!200167 () Bool)

(assert (=> b!171515 m!200167))

(assert (=> b!171517 m!199753))

(assert (=> b!171517 m!199753))

(assert (=> b!171517 m!200167))

(assert (=> d!51885 d!52085))

(declare-fun b!171519 () Bool)

(declare-fun e!113207 () Option!190)

(declare-fun e!113208 () Option!190)

(assert (=> b!171519 (= e!113207 e!113208)))

(declare-fun c!30666 () Bool)

(assert (=> b!171519 (= c!30666 (and ((_ is Cons!2189) lt!85310) (not (= (_1!1628 (h!2806 lt!85310)) (_1!1628 (tuple2!3235 lt!85104 v!309))))))))

(declare-fun b!171520 () Bool)

(assert (=> b!171520 (= e!113208 (getValueByKey!184 (t!6995 lt!85310) (_1!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun d!52087 () Bool)

(declare-fun c!30665 () Bool)

(assert (=> d!52087 (= c!30665 (and ((_ is Cons!2189) lt!85310) (= (_1!1628 (h!2806 lt!85310)) (_1!1628 (tuple2!3235 lt!85104 v!309)))))))

(assert (=> d!52087 (= (getValueByKey!184 lt!85310 (_1!1628 (tuple2!3235 lt!85104 v!309))) e!113207)))

(declare-fun b!171521 () Bool)

(assert (=> b!171521 (= e!113208 None!188)))

(declare-fun b!171518 () Bool)

(assert (=> b!171518 (= e!113207 (Some!189 (_2!1628 (h!2806 lt!85310))))))

(assert (= (and d!52087 c!30665) b!171518))

(assert (= (and d!52087 (not c!30665)) b!171519))

(assert (= (and b!171519 c!30666) b!171520))

(assert (= (and b!171519 (not c!30666)) b!171521))

(declare-fun m!200169 () Bool)

(assert (=> b!171520 m!200169))

(assert (=> d!51885 d!52087))

(declare-fun d!52089 () Bool)

(assert (=> d!52089 (= (getValueByKey!184 lt!85310 (_1!1628 (tuple2!3235 lt!85104 v!309))) (Some!189 (_2!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun lt!85392 () Unit!5252)

(assert (=> d!52089 (= lt!85392 (choose!924 lt!85310 (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun e!113209 () Bool)

(assert (=> d!52089 e!113209))

(declare-fun res!81508 () Bool)

(assert (=> d!52089 (=> (not res!81508) (not e!113209))))

(assert (=> d!52089 (= res!81508 (isStrictlySorted!331 lt!85310))))

(assert (=> d!52089 (= (lemmaContainsTupThenGetReturnValue!97 lt!85310 (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309))) lt!85392)))

(declare-fun b!171522 () Bool)

(declare-fun res!81509 () Bool)

(assert (=> b!171522 (=> (not res!81509) (not e!113209))))

(assert (=> b!171522 (= res!81509 (containsKey!188 lt!85310 (_1!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun b!171523 () Bool)

(assert (=> b!171523 (= e!113209 (contains!1146 lt!85310 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309)))))))

(assert (= (and d!52089 res!81508) b!171522))

(assert (= (and b!171522 res!81509) b!171523))

(assert (=> d!52089 m!199747))

(declare-fun m!200171 () Bool)

(assert (=> d!52089 m!200171))

(declare-fun m!200173 () Bool)

(assert (=> d!52089 m!200173))

(declare-fun m!200175 () Bool)

(assert (=> b!171522 m!200175))

(declare-fun m!200177 () Bool)

(assert (=> b!171523 m!200177))

(assert (=> d!51885 d!52089))

(declare-fun b!171524 () Bool)

(declare-fun e!113210 () List!2193)

(declare-fun call!17465 () List!2193)

(assert (=> b!171524 (= e!113210 call!17465)))

(declare-fun b!171525 () Bool)

(declare-fun res!81511 () Bool)

(declare-fun e!113214 () Bool)

(assert (=> b!171525 (=> (not res!81511) (not e!113214))))

(declare-fun lt!85393 () List!2193)

(assert (=> b!171525 (= res!81511 (containsKey!188 lt!85393 (_1!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun b!171526 () Bool)

(declare-fun e!113213 () List!2193)

(declare-fun e!113211 () List!2193)

(assert (=> b!171526 (= e!113213 e!113211)))

(declare-fun c!30668 () Bool)

(assert (=> b!171526 (= c!30668 (and ((_ is Cons!2189) (toList!1096 lt!85119)) (= (_1!1628 (h!2806 (toList!1096 lt!85119))) (_1!1628 (tuple2!3235 lt!85104 v!309)))))))

(declare-fun b!171527 () Bool)

(declare-fun c!30669 () Bool)

(declare-fun e!113212 () List!2193)

(assert (=> b!171527 (= e!113212 (ite c!30668 (t!6995 (toList!1096 lt!85119)) (ite c!30669 (Cons!2189 (h!2806 (toList!1096 lt!85119)) (t!6995 (toList!1096 lt!85119))) Nil!2190)))))

(declare-fun b!171528 () Bool)

(assert (=> b!171528 (= e!113214 (contains!1146 lt!85393 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309)))))))

(declare-fun b!171529 () Bool)

(declare-fun call!17464 () List!2193)

(assert (=> b!171529 (= e!113213 call!17464)))

(declare-fun c!30670 () Bool)

(declare-fun bm!17461 () Bool)

(assert (=> bm!17461 (= call!17464 ($colon$colon!97 e!113212 (ite c!30670 (h!2806 (toList!1096 lt!85119)) (tuple2!3235 (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309))))))))

(declare-fun c!30667 () Bool)

(assert (=> bm!17461 (= c!30667 c!30670)))

(declare-fun bm!17463 () Bool)

(declare-fun call!17466 () List!2193)

(assert (=> bm!17463 (= call!17465 call!17466)))

(declare-fun b!171530 () Bool)

(assert (=> b!171530 (= e!113211 call!17466)))

(declare-fun b!171531 () Bool)

(assert (=> b!171531 (= e!113210 call!17465)))

(declare-fun b!171532 () Bool)

(assert (=> b!171532 (= c!30669 (and ((_ is Cons!2189) (toList!1096 lt!85119)) (bvsgt (_1!1628 (h!2806 (toList!1096 lt!85119))) (_1!1628 (tuple2!3235 lt!85104 v!309)))))))

(assert (=> b!171532 (= e!113211 e!113210)))

(declare-fun b!171533 () Bool)

(assert (=> b!171533 (= e!113212 (insertStrictlySorted!100 (t!6995 (toList!1096 lt!85119)) (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309))))))

(declare-fun bm!17462 () Bool)

(assert (=> bm!17462 (= call!17466 call!17464)))

(declare-fun d!52091 () Bool)

(assert (=> d!52091 e!113214))

(declare-fun res!81510 () Bool)

(assert (=> d!52091 (=> (not res!81510) (not e!113214))))

(assert (=> d!52091 (= res!81510 (isStrictlySorted!331 lt!85393))))

(assert (=> d!52091 (= lt!85393 e!113213)))

(assert (=> d!52091 (= c!30670 (and ((_ is Cons!2189) (toList!1096 lt!85119)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85119))) (_1!1628 (tuple2!3235 lt!85104 v!309)))))))

(assert (=> d!52091 (isStrictlySorted!331 (toList!1096 lt!85119))))

(assert (=> d!52091 (= (insertStrictlySorted!100 (toList!1096 lt!85119) (_1!1628 (tuple2!3235 lt!85104 v!309)) (_2!1628 (tuple2!3235 lt!85104 v!309))) lt!85393)))

(assert (= (and d!52091 c!30670) b!171529))

(assert (= (and d!52091 (not c!30670)) b!171526))

(assert (= (and b!171526 c!30668) b!171530))

(assert (= (and b!171526 (not c!30668)) b!171532))

(assert (= (and b!171532 c!30669) b!171531))

(assert (= (and b!171532 (not c!30669)) b!171524))

(assert (= (or b!171531 b!171524) bm!17463))

(assert (= (or b!171530 bm!17463) bm!17462))

(assert (= (or b!171529 bm!17462) bm!17461))

(assert (= (and bm!17461 c!30667) b!171533))

(assert (= (and bm!17461 (not c!30667)) b!171527))

(assert (= (and d!52091 res!81510) b!171525))

(assert (= (and b!171525 res!81511) b!171528))

(declare-fun m!200179 () Bool)

(assert (=> b!171525 m!200179))

(declare-fun m!200181 () Bool)

(assert (=> d!52091 m!200181))

(declare-fun m!200183 () Bool)

(assert (=> d!52091 m!200183))

(declare-fun m!200185 () Bool)

(assert (=> b!171533 m!200185))

(declare-fun m!200187 () Bool)

(assert (=> b!171528 m!200187))

(declare-fun m!200189 () Bool)

(assert (=> bm!17461 m!200189))

(assert (=> d!51885 d!52091))

(declare-fun d!52093 () Bool)

(assert (=> d!52093 (arrayContainsKey!0 (_keys!5387 lt!85045) lt!85250 #b00000000000000000000000000000000)))

(declare-fun lt!85396 () Unit!5252)

(declare-fun choose!13 (array!7123 (_ BitVec 64) (_ BitVec 32)) Unit!5252)

(assert (=> d!52093 (= lt!85396 (choose!13 (_keys!5387 lt!85045) lt!85250 #b00000000000000000000000000000000))))

(assert (=> d!52093 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!52093 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5387 lt!85045) lt!85250 #b00000000000000000000000000000000) lt!85396)))

(declare-fun bs!7083 () Bool)

(assert (= bs!7083 d!52093))

(assert (=> bs!7083 m!199553))

(declare-fun m!200191 () Bool)

(assert (=> bs!7083 m!200191))

(assert (=> b!171188 d!52093))

(declare-fun d!52095 () Bool)

(declare-fun res!81516 () Bool)

(declare-fun e!113219 () Bool)

(assert (=> d!52095 (=> res!81516 e!113219)))

(assert (=> d!52095 (= res!81516 (= (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) lt!85250))))

(assert (=> d!52095 (= (arrayContainsKey!0 (_keys!5387 lt!85045) lt!85250 #b00000000000000000000000000000000) e!113219)))

(declare-fun b!171538 () Bool)

(declare-fun e!113220 () Bool)

(assert (=> b!171538 (= e!113219 e!113220)))

(declare-fun res!81517 () Bool)

(assert (=> b!171538 (=> (not res!81517) (not e!113220))))

(assert (=> b!171538 (= res!81517 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 lt!85045))))))

(declare-fun b!171539 () Bool)

(assert (=> b!171539 (= e!113220 (arrayContainsKey!0 (_keys!5387 lt!85045) lt!85250 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!52095 (not res!81516)) b!171538))

(assert (= (and b!171538 res!81517) b!171539))

(assert (=> d!52095 m!199545))

(declare-fun m!200193 () Bool)

(assert (=> b!171539 m!200193))

(assert (=> b!171188 d!52095))

(declare-fun b!171552 () Bool)

(declare-fun e!113229 () SeekEntryResult!534)

(declare-fun lt!85405 () SeekEntryResult!534)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7123 (_ BitVec 32)) SeekEntryResult!534)

(assert (=> b!171552 (= e!113229 (seekKeyOrZeroReturnVacant!0 (x!18959 lt!85405) (index!4306 lt!85405) (index!4306 lt!85405) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) (_keys!5387 lt!85045) (mask!8383 lt!85045)))))

(declare-fun b!171553 () Bool)

(declare-fun e!113227 () SeekEntryResult!534)

(declare-fun e!113228 () SeekEntryResult!534)

(assert (=> b!171553 (= e!113227 e!113228)))

(declare-fun lt!85403 () (_ BitVec 64))

(assert (=> b!171553 (= lt!85403 (select (arr!3389 (_keys!5387 lt!85045)) (index!4306 lt!85405)))))

(declare-fun c!30678 () Bool)

(assert (=> b!171553 (= c!30678 (= lt!85403 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun b!171554 () Bool)

(assert (=> b!171554 (= e!113229 (MissingZero!534 (index!4306 lt!85405)))))

(declare-fun b!171555 () Bool)

(assert (=> b!171555 (= e!113227 Undefined!534)))

(declare-fun b!171556 () Bool)

(assert (=> b!171556 (= e!113228 (Found!534 (index!4306 lt!85405)))))

(declare-fun d!52097 () Bool)

(declare-fun lt!85404 () SeekEntryResult!534)

(assert (=> d!52097 (and (or ((_ is Undefined!534) lt!85404) (not ((_ is Found!534) lt!85404)) (and (bvsge (index!4305 lt!85404) #b00000000000000000000000000000000) (bvslt (index!4305 lt!85404) (size!3682 (_keys!5387 lt!85045))))) (or ((_ is Undefined!534) lt!85404) ((_ is Found!534) lt!85404) (not ((_ is MissingZero!534) lt!85404)) (and (bvsge (index!4304 lt!85404) #b00000000000000000000000000000000) (bvslt (index!4304 lt!85404) (size!3682 (_keys!5387 lt!85045))))) (or ((_ is Undefined!534) lt!85404) ((_ is Found!534) lt!85404) ((_ is MissingZero!534) lt!85404) (not ((_ is MissingVacant!534) lt!85404)) (and (bvsge (index!4307 lt!85404) #b00000000000000000000000000000000) (bvslt (index!4307 lt!85404) (size!3682 (_keys!5387 lt!85045))))) (or ((_ is Undefined!534) lt!85404) (ite ((_ is Found!534) lt!85404) (= (select (arr!3389 (_keys!5387 lt!85045)) (index!4305 lt!85404)) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!534) lt!85404) (= (select (arr!3389 (_keys!5387 lt!85045)) (index!4304 lt!85404)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!534) lt!85404) (= (select (arr!3389 (_keys!5387 lt!85045)) (index!4307 lt!85404)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52097 (= lt!85404 e!113227)))

(declare-fun c!30677 () Bool)

(assert (=> d!52097 (= c!30677 (and ((_ is Intermediate!534) lt!85405) (undefined!1346 lt!85405)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7123 (_ BitVec 32)) SeekEntryResult!534)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!52097 (= lt!85405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) (mask!8383 lt!85045)) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) (_keys!5387 lt!85045) (mask!8383 lt!85045)))))

(assert (=> d!52097 (validMask!0 (mask!8383 lt!85045))))

(assert (=> d!52097 (= (seekEntryOrOpen!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) (_keys!5387 lt!85045) (mask!8383 lt!85045)) lt!85404)))

(declare-fun b!171557 () Bool)

(declare-fun c!30679 () Bool)

(assert (=> b!171557 (= c!30679 (= lt!85403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171557 (= e!113228 e!113229)))

(assert (= (and d!52097 c!30677) b!171555))

(assert (= (and d!52097 (not c!30677)) b!171553))

(assert (= (and b!171553 c!30678) b!171556))

(assert (= (and b!171553 (not c!30678)) b!171557))

(assert (= (and b!171557 c!30679) b!171554))

(assert (= (and b!171557 (not c!30679)) b!171552))

(assert (=> b!171552 m!199545))

(declare-fun m!200195 () Bool)

(assert (=> b!171552 m!200195))

(declare-fun m!200197 () Bool)

(assert (=> b!171553 m!200197))

(declare-fun m!200199 () Bool)

(assert (=> d!52097 m!200199))

(assert (=> d!52097 m!199545))

(declare-fun m!200201 () Bool)

(assert (=> d!52097 m!200201))

(declare-fun m!200203 () Bool)

(assert (=> d!52097 m!200203))

(declare-fun m!200205 () Bool)

(assert (=> d!52097 m!200205))

(assert (=> d!52097 m!199601))

(declare-fun m!200207 () Bool)

(assert (=> d!52097 m!200207))

(assert (=> d!52097 m!199545))

(assert (=> d!52097 m!200199))

(assert (=> b!171188 d!52097))

(declare-fun d!52099 () Bool)

(declare-fun e!113231 () Bool)

(assert (=> d!52099 e!113231))

(declare-fun res!81518 () Bool)

(assert (=> d!52099 (=> res!81518 e!113231)))

(declare-fun lt!85408 () Bool)

(assert (=> d!52099 (= res!81518 (not lt!85408))))

(declare-fun lt!85406 () Bool)

(assert (=> d!52099 (= lt!85408 lt!85406)))

(declare-fun lt!85407 () Unit!5252)

(declare-fun e!113230 () Unit!5252)

(assert (=> d!52099 (= lt!85407 e!113230)))

(declare-fun c!30680 () Bool)

(assert (=> d!52099 (= c!30680 lt!85406)))

(assert (=> d!52099 (= lt!85406 (containsKey!188 (toList!1096 lt!85232) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!52099 (= (contains!1144 lt!85232 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) lt!85408)))

(declare-fun b!171558 () Bool)

(declare-fun lt!85409 () Unit!5252)

(assert (=> b!171558 (= e!113230 lt!85409)))

(assert (=> b!171558 (= lt!85409 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85232) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> b!171558 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85232) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171559 () Bool)

(declare-fun Unit!5272 () Unit!5252)

(assert (=> b!171559 (= e!113230 Unit!5272)))

(declare-fun b!171560 () Bool)

(assert (=> b!171560 (= e!113231 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85232) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (= (and d!52099 c!30680) b!171558))

(assert (= (and d!52099 (not c!30680)) b!171559))

(assert (= (and d!52099 (not res!81518)) b!171560))

(declare-fun m!200209 () Bool)

(assert (=> d!52099 m!200209))

(declare-fun m!200211 () Bool)

(assert (=> b!171558 m!200211))

(assert (=> b!171558 m!199519))

(assert (=> b!171558 m!199519))

(declare-fun m!200213 () Bool)

(assert (=> b!171558 m!200213))

(assert (=> b!171560 m!199519))

(assert (=> b!171560 m!199519))

(assert (=> b!171560 m!200213))

(assert (=> d!51825 d!52099))

(declare-fun b!171562 () Bool)

(declare-fun e!113232 () Option!190)

(declare-fun e!113233 () Option!190)

(assert (=> b!171562 (= e!113232 e!113233)))

(declare-fun c!30682 () Bool)

(assert (=> b!171562 (= c!30682 (and ((_ is Cons!2189) lt!85233) (not (= (_1!1628 (h!2806 lt!85233)) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))))

(declare-fun b!171563 () Bool)

(assert (=> b!171563 (= e!113233 (getValueByKey!184 (t!6995 lt!85233) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun c!30681 () Bool)

(declare-fun d!52101 () Bool)

(assert (=> d!52101 (= c!30681 (and ((_ is Cons!2189) lt!85233) (= (_1!1628 (h!2806 lt!85233)) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (=> d!52101 (= (getValueByKey!184 lt!85233 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) e!113232)))

(declare-fun b!171564 () Bool)

(assert (=> b!171564 (= e!113233 None!188)))

(declare-fun b!171561 () Bool)

(assert (=> b!171561 (= e!113232 (Some!189 (_2!1628 (h!2806 lt!85233))))))

(assert (= (and d!52101 c!30681) b!171561))

(assert (= (and d!52101 (not c!30681)) b!171562))

(assert (= (and b!171562 c!30682) b!171563))

(assert (= (and b!171562 (not c!30682)) b!171564))

(declare-fun m!200215 () Bool)

(assert (=> b!171563 m!200215))

(assert (=> d!51825 d!52101))

(declare-fun d!52103 () Bool)

(assert (=> d!52103 (= (getValueByKey!184 lt!85233 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) (Some!189 (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun lt!85410 () Unit!5252)

(assert (=> d!52103 (= lt!85410 (choose!924 lt!85233 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun e!113234 () Bool)

(assert (=> d!52103 e!113234))

(declare-fun res!81519 () Bool)

(assert (=> d!52103 (=> (not res!81519) (not e!113234))))

(assert (=> d!52103 (= res!81519 (isStrictlySorted!331 lt!85233))))

(assert (=> d!52103 (= (lemmaContainsTupThenGetReturnValue!97 lt!85233 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) lt!85410)))

(declare-fun b!171565 () Bool)

(declare-fun res!81520 () Bool)

(assert (=> b!171565 (=> (not res!81520) (not e!113234))))

(assert (=> b!171565 (= res!81520 (containsKey!188 lt!85233 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171566 () Bool)

(assert (=> b!171566 (= e!113234 (contains!1146 lt!85233 (tuple2!3235 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (= (and d!52103 res!81519) b!171565))

(assert (= (and b!171565 res!81520) b!171566))

(assert (=> d!52103 m!199513))

(declare-fun m!200217 () Bool)

(assert (=> d!52103 m!200217))

(declare-fun m!200219 () Bool)

(assert (=> d!52103 m!200219))

(declare-fun m!200221 () Bool)

(assert (=> b!171565 m!200221))

(declare-fun m!200223 () Bool)

(assert (=> b!171566 m!200223))

(assert (=> d!51825 d!52103))

(declare-fun b!171567 () Bool)

(declare-fun e!113235 () List!2193)

(declare-fun call!17468 () List!2193)

(assert (=> b!171567 (= e!113235 call!17468)))

(declare-fun b!171568 () Bool)

(declare-fun res!81522 () Bool)

(declare-fun e!113239 () Bool)

(assert (=> b!171568 (=> (not res!81522) (not e!113239))))

(declare-fun lt!85411 () List!2193)

(assert (=> b!171568 (= res!81522 (containsKey!188 lt!85411 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171569 () Bool)

(declare-fun e!113238 () List!2193)

(declare-fun e!113236 () List!2193)

(assert (=> b!171569 (= e!113238 e!113236)))

(declare-fun c!30684 () Bool)

(assert (=> b!171569 (= c!30684 (and ((_ is Cons!2189) (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)))) (= (_1!1628 (h!2806 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407))))) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171570 () Bool)

(declare-fun e!113237 () List!2193)

(declare-fun c!30685 () Bool)

(assert (=> b!171570 (= e!113237 (ite c!30684 (t!6995 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)))) (ite c!30685 (Cons!2189 (h!2806 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)))) (t!6995 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407))))) Nil!2190)))))

(declare-fun b!171571 () Bool)

(assert (=> b!171571 (= e!113239 (contains!1146 lt!85411 (tuple2!3235 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171572 () Bool)

(declare-fun call!17467 () List!2193)

(assert (=> b!171572 (= e!113238 call!17467)))

(declare-fun bm!17464 () Bool)

(declare-fun c!30686 () Bool)

(assert (=> bm!17464 (= call!17467 ($colon$colon!97 e!113237 (ite c!30686 (h!2806 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)))) (tuple2!3235 (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))))

(declare-fun c!30683 () Bool)

(assert (=> bm!17464 (= c!30683 c!30686)))

(declare-fun bm!17466 () Bool)

(declare-fun call!17469 () List!2193)

(assert (=> bm!17466 (= call!17468 call!17469)))

(declare-fun b!171573 () Bool)

(assert (=> b!171573 (= e!113236 call!17469)))

(declare-fun b!171574 () Bool)

(assert (=> b!171574 (= e!113235 call!17468)))

(declare-fun b!171575 () Bool)

(assert (=> b!171575 (= c!30685 (and ((_ is Cons!2189) (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)))) (bvsgt (_1!1628 (h!2806 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407))))) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (=> b!171575 (= e!113236 e!113235)))

(declare-fun b!171576 () Bool)

(assert (=> b!171576 (= e!113237 (insertStrictlySorted!100 (t!6995 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)))) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun bm!17465 () Bool)

(assert (=> bm!17465 (= call!17469 call!17467)))

(declare-fun d!52105 () Bool)

(assert (=> d!52105 e!113239))

(declare-fun res!81521 () Bool)

(assert (=> d!52105 (=> (not res!81521) (not e!113239))))

(assert (=> d!52105 (= res!81521 (isStrictlySorted!331 lt!85411))))

(assert (=> d!52105 (= lt!85411 e!113238)))

(assert (=> d!52105 (= c!30686 (and ((_ is Cons!2189) (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407)))) (bvslt (_1!1628 (h!2806 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407))))) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (=> d!52105 (isStrictlySorted!331 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407))))))

(assert (=> d!52105 (= (insertStrictlySorted!100 (toList!1096 (ite c!30512 call!17404 (ite c!30510 call!17408 call!17407))) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) lt!85411)))

(assert (= (and d!52105 c!30686) b!171572))

(assert (= (and d!52105 (not c!30686)) b!171569))

(assert (= (and b!171569 c!30684) b!171573))

(assert (= (and b!171569 (not c!30684)) b!171575))

(assert (= (and b!171575 c!30685) b!171574))

(assert (= (and b!171575 (not c!30685)) b!171567))

(assert (= (or b!171574 b!171567) bm!17466))

(assert (= (or b!171573 bm!17466) bm!17465))

(assert (= (or b!171572 bm!17465) bm!17464))

(assert (= (and bm!17464 c!30683) b!171576))

(assert (= (and bm!17464 (not c!30683)) b!171570))

(assert (= (and d!52105 res!81521) b!171568))

(assert (= (and b!171568 res!81522) b!171571))

(declare-fun m!200225 () Bool)

(assert (=> b!171568 m!200225))

(declare-fun m!200227 () Bool)

(assert (=> d!52105 m!200227))

(declare-fun m!200229 () Bool)

(assert (=> d!52105 m!200229))

(declare-fun m!200231 () Bool)

(assert (=> b!171576 m!200231))

(declare-fun m!200233 () Bool)

(assert (=> b!171571 m!200233))

(declare-fun m!200235 () Bool)

(assert (=> bm!17464 m!200235))

(assert (=> d!51825 d!52105))

(declare-fun d!52107 () Bool)

(declare-fun e!113241 () Bool)

(assert (=> d!52107 e!113241))

(declare-fun res!81523 () Bool)

(assert (=> d!52107 (=> res!81523 e!113241)))

(declare-fun lt!85414 () Bool)

(assert (=> d!52107 (= res!81523 (not lt!85414))))

(declare-fun lt!85412 () Bool)

(assert (=> d!52107 (= lt!85414 lt!85412)))

(declare-fun lt!85413 () Unit!5252)

(declare-fun e!113240 () Unit!5252)

(assert (=> d!52107 (= lt!85413 e!113240)))

(declare-fun c!30687 () Bool)

(assert (=> d!52107 (= c!30687 lt!85412)))

(assert (=> d!52107 (= lt!85412 (containsKey!188 (toList!1096 lt!85340) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(assert (=> d!52107 (= (contains!1144 lt!85340 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) lt!85414)))

(declare-fun b!171577 () Bool)

(declare-fun lt!85415 () Unit!5252)

(assert (=> b!171577 (= e!113240 lt!85415)))

(assert (=> b!171577 (= lt!85415 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85340) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(assert (=> b!171577 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85340) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun b!171578 () Bool)

(declare-fun Unit!5273 () Unit!5252)

(assert (=> b!171578 (= e!113240 Unit!5273)))

(declare-fun b!171579 () Bool)

(assert (=> b!171579 (= e!113241 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85340) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(assert (= (and d!52107 c!30687) b!171577))

(assert (= (and d!52107 (not c!30687)) b!171578))

(assert (= (and d!52107 (not res!81523)) b!171579))

(declare-fun m!200237 () Bool)

(assert (=> d!52107 m!200237))

(declare-fun m!200239 () Bool)

(assert (=> b!171577 m!200239))

(assert (=> b!171577 m!199875))

(assert (=> b!171577 m!199875))

(declare-fun m!200241 () Bool)

(assert (=> b!171577 m!200241))

(assert (=> b!171579 m!199875))

(assert (=> b!171579 m!199875))

(assert (=> b!171579 m!200241))

(assert (=> d!51927 d!52107))

(declare-fun b!171581 () Bool)

(declare-fun e!113242 () Option!190)

(declare-fun e!113243 () Option!190)

(assert (=> b!171581 (= e!113242 e!113243)))

(declare-fun c!30689 () Bool)

(assert (=> b!171581 (= c!30689 (and ((_ is Cons!2189) lt!85341) (not (= (_1!1628 (h!2806 lt!85341)) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))))

(declare-fun b!171582 () Bool)

(assert (=> b!171582 (= e!113243 (getValueByKey!184 (t!6995 lt!85341) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun d!52109 () Bool)

(declare-fun c!30688 () Bool)

(assert (=> d!52109 (= c!30688 (and ((_ is Cons!2189) lt!85341) (= (_1!1628 (h!2806 lt!85341)) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(assert (=> d!52109 (= (getValueByKey!184 lt!85341 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) e!113242)))

(declare-fun b!171583 () Bool)

(assert (=> b!171583 (= e!113243 None!188)))

(declare-fun b!171580 () Bool)

(assert (=> b!171580 (= e!113242 (Some!189 (_2!1628 (h!2806 lt!85341))))))

(assert (= (and d!52109 c!30688) b!171580))

(assert (= (and d!52109 (not c!30688)) b!171581))

(assert (= (and b!171581 c!30689) b!171582))

(assert (= (and b!171581 (not c!30689)) b!171583))

(declare-fun m!200243 () Bool)

(assert (=> b!171582 m!200243))

(assert (=> d!51927 d!52109))

(declare-fun d!52111 () Bool)

(assert (=> d!52111 (= (getValueByKey!184 lt!85341 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun lt!85416 () Unit!5252)

(assert (=> d!52111 (= lt!85416 (choose!924 lt!85341 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun e!113244 () Bool)

(assert (=> d!52111 e!113244))

(declare-fun res!81524 () Bool)

(assert (=> d!52111 (=> (not res!81524) (not e!113244))))

(assert (=> d!52111 (= res!81524 (isStrictlySorted!331 lt!85341))))

(assert (=> d!52111 (= (lemmaContainsTupThenGetReturnValue!97 lt!85341 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) lt!85416)))

(declare-fun b!171584 () Bool)

(declare-fun res!81525 () Bool)

(assert (=> b!171584 (=> (not res!81525) (not e!113244))))

(assert (=> b!171584 (= res!81525 (containsKey!188 lt!85341 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun b!171585 () Bool)

(assert (=> b!171585 (= e!113244 (contains!1146 lt!85341 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(assert (= (and d!52111 res!81524) b!171584))

(assert (= (and b!171584 res!81525) b!171585))

(assert (=> d!52111 m!199869))

(declare-fun m!200245 () Bool)

(assert (=> d!52111 m!200245))

(declare-fun m!200247 () Bool)

(assert (=> d!52111 m!200247))

(declare-fun m!200249 () Bool)

(assert (=> b!171584 m!200249))

(declare-fun m!200251 () Bool)

(assert (=> b!171585 m!200251))

(assert (=> d!51927 d!52111))

(declare-fun b!171586 () Bool)

(declare-fun e!113245 () List!2193)

(declare-fun call!17471 () List!2193)

(assert (=> b!171586 (= e!113245 call!17471)))

(declare-fun b!171587 () Bool)

(declare-fun res!81527 () Bool)

(declare-fun e!113249 () Bool)

(assert (=> b!171587 (=> (not res!81527) (not e!113249))))

(declare-fun lt!85417 () List!2193)

(assert (=> b!171587 (= res!81527 (containsKey!188 lt!85417 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun b!171588 () Bool)

(declare-fun e!113248 () List!2193)

(declare-fun e!113246 () List!2193)

(assert (=> b!171588 (= e!113248 e!113246)))

(declare-fun c!30691 () Bool)

(assert (=> b!171588 (= c!30691 (and ((_ is Cons!2189) (toList!1096 lt!85126)) (= (_1!1628 (h!2806 (toList!1096 lt!85126))) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(declare-fun b!171589 () Bool)

(declare-fun c!30692 () Bool)

(declare-fun e!113247 () List!2193)

(assert (=> b!171589 (= e!113247 (ite c!30691 (t!6995 (toList!1096 lt!85126)) (ite c!30692 (Cons!2189 (h!2806 (toList!1096 lt!85126)) (t!6995 (toList!1096 lt!85126))) Nil!2190)))))

(declare-fun b!171590 () Bool)

(assert (=> b!171590 (= e!113249 (contains!1146 lt!85417 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(declare-fun b!171591 () Bool)

(declare-fun call!17470 () List!2193)

(assert (=> b!171591 (= e!113248 call!17470)))

(declare-fun c!30693 () Bool)

(declare-fun bm!17467 () Bool)

(assert (=> bm!17467 (= call!17470 ($colon$colon!97 e!113247 (ite c!30693 (h!2806 (toList!1096 lt!85126)) (tuple2!3235 (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))))

(declare-fun c!30690 () Bool)

(assert (=> bm!17467 (= c!30690 c!30693)))

(declare-fun bm!17469 () Bool)

(declare-fun call!17472 () List!2193)

(assert (=> bm!17469 (= call!17471 call!17472)))

(declare-fun b!171592 () Bool)

(assert (=> b!171592 (= e!113246 call!17472)))

(declare-fun b!171593 () Bool)

(assert (=> b!171593 (= e!113245 call!17471)))

(declare-fun b!171594 () Bool)

(assert (=> b!171594 (= c!30692 (and ((_ is Cons!2189) (toList!1096 lt!85126)) (bvsgt (_1!1628 (h!2806 (toList!1096 lt!85126))) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(assert (=> b!171594 (= e!113246 e!113245)))

(declare-fun b!171595 () Bool)

(assert (=> b!171595 (= e!113247 (insertStrictlySorted!100 (t!6995 (toList!1096 lt!85126)) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun bm!17468 () Bool)

(assert (=> bm!17468 (= call!17472 call!17470)))

(declare-fun d!52113 () Bool)

(assert (=> d!52113 e!113249))

(declare-fun res!81526 () Bool)

(assert (=> d!52113 (=> (not res!81526) (not e!113249))))

(assert (=> d!52113 (= res!81526 (isStrictlySorted!331 lt!85417))))

(assert (=> d!52113 (= lt!85417 e!113248)))

(assert (=> d!52113 (= c!30693 (and ((_ is Cons!2189) (toList!1096 lt!85126)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85126))) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(assert (=> d!52113 (isStrictlySorted!331 (toList!1096 lt!85126))))

(assert (=> d!52113 (= (insertStrictlySorted!100 (toList!1096 lt!85126) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) lt!85417)))

(assert (= (and d!52113 c!30693) b!171591))

(assert (= (and d!52113 (not c!30693)) b!171588))

(assert (= (and b!171588 c!30691) b!171592))

(assert (= (and b!171588 (not c!30691)) b!171594))

(assert (= (and b!171594 c!30692) b!171593))

(assert (= (and b!171594 (not c!30692)) b!171586))

(assert (= (or b!171593 b!171586) bm!17469))

(assert (= (or b!171592 bm!17469) bm!17468))

(assert (= (or b!171591 bm!17468) bm!17467))

(assert (= (and bm!17467 c!30690) b!171595))

(assert (= (and bm!17467 (not c!30690)) b!171589))

(assert (= (and d!52113 res!81526) b!171587))

(assert (= (and b!171587 res!81527) b!171590))

(declare-fun m!200253 () Bool)

(assert (=> b!171587 m!200253))

(declare-fun m!200255 () Bool)

(assert (=> d!52113 m!200255))

(declare-fun m!200257 () Bool)

(assert (=> d!52113 m!200257))

(declare-fun m!200259 () Bool)

(assert (=> b!171595 m!200259))

(declare-fun m!200261 () Bool)

(assert (=> b!171590 m!200261))

(declare-fun m!200263 () Bool)

(assert (=> bm!17467 m!200263))

(assert (=> d!51927 d!52113))

(declare-fun d!52115 () Bool)

(declare-fun res!81528 () Bool)

(declare-fun e!113250 () Bool)

(assert (=> d!52115 (=> res!81528 e!113250)))

(assert (=> d!52115 (= res!81528 (and ((_ is Cons!2189) (toList!1096 lt!85155)) (= (_1!1628 (h!2806 (toList!1096 lt!85155))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52115 (= (containsKey!188 (toList!1096 lt!85155) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113250)))

(declare-fun b!171596 () Bool)

(declare-fun e!113251 () Bool)

(assert (=> b!171596 (= e!113250 e!113251)))

(declare-fun res!81529 () Bool)

(assert (=> b!171596 (=> (not res!81529) (not e!113251))))

(assert (=> b!171596 (= res!81529 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85155))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85155))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2189) (toList!1096 lt!85155)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85155))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171597 () Bool)

(assert (=> b!171597 (= e!113251 (containsKey!188 (t!6995 (toList!1096 lt!85155)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52115 (not res!81528)) b!171596))

(assert (= (and b!171596 res!81529) b!171597))

(declare-fun m!200265 () Bool)

(assert (=> b!171597 m!200265))

(assert (=> d!51839 d!52115))

(declare-fun d!52117 () Bool)

(assert (=> d!52117 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7084 () Bool)

(assert (= bs!7084 d!52117))

(assert (=> bs!7084 m!199463))

(declare-fun m!200267 () Bool)

(assert (=> bs!7084 m!200267))

(assert (=> b!171104 d!52117))

(assert (=> b!171104 d!51963))

(declare-fun d!52119 () Bool)

(assert (=> d!52119 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7085 () Bool)

(assert (= bs!7085 d!52119))

(assert (=> bs!7085 m!199427))

(declare-fun m!200269 () Bool)

(assert (=> bs!7085 m!200269))

(assert (=> b!171058 d!52119))

(declare-fun b!171599 () Bool)

(declare-fun e!113252 () Option!190)

(declare-fun e!113253 () Option!190)

(assert (=> b!171599 (= e!113252 e!113253)))

(declare-fun c!30695 () Bool)

(assert (=> b!171599 (= c!30695 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85105))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171600 () Bool)

(assert (=> b!171600 (= e!113253 (getValueByKey!184 (t!6995 (toList!1096 lt!85105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52121 () Bool)

(declare-fun c!30694 () Bool)

(assert (=> d!52121 (= c!30694 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (= (_1!1628 (h!2806 (toList!1096 lt!85105))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52121 (= (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000) e!113252)))

(declare-fun b!171601 () Bool)

(assert (=> b!171601 (= e!113253 None!188)))

(declare-fun b!171598 () Bool)

(assert (=> b!171598 (= e!113252 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85105)))))))

(assert (= (and d!52121 c!30694) b!171598))

(assert (= (and d!52121 (not c!30694)) b!171599))

(assert (= (and b!171599 c!30695) b!171600))

(assert (= (and b!171599 (not c!30695)) b!171601))

(declare-fun m!200271 () Bool)

(assert (=> b!171600 m!200271))

(assert (=> b!171058 d!52121))

(declare-fun b!171602 () Bool)

(declare-fun e!113258 () Bool)

(declare-fun e!113255 () Bool)

(assert (=> b!171602 (= e!113258 e!113255)))

(declare-fun c!30697 () Bool)

(assert (=> b!171602 (= c!30697 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(declare-fun b!171604 () Bool)

(declare-fun e!113254 () Bool)

(assert (=> b!171604 (= e!113254 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(assert (=> b!171604 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!171605 () Bool)

(declare-fun res!81533 () Bool)

(declare-fun e!113257 () Bool)

(assert (=> b!171605 (=> (not res!81533) (not e!113257))))

(declare-fun lt!85422 () ListLongMap!2161)

(assert (=> b!171605 (= res!81533 (not (contains!1144 lt!85422 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171606 () Bool)

(declare-fun e!113260 () ListLongMap!2161)

(assert (=> b!171606 (= e!113260 (ListLongMap!2162 Nil!2190))))

(declare-fun b!171607 () Bool)

(declare-fun e!113256 () Bool)

(assert (=> b!171607 (= e!113258 e!113256)))

(assert (=> b!171607 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(declare-fun res!81532 () Bool)

(assert (=> b!171607 (= res!81532 (contains!1144 lt!85422 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(assert (=> b!171607 (=> (not res!81532) (not e!113256))))

(declare-fun b!171608 () Bool)

(assert (=> b!171608 (= e!113257 e!113258)))

(declare-fun c!30699 () Bool)

(assert (=> b!171608 (= c!30699 e!113254)))

(declare-fun res!81531 () Bool)

(assert (=> b!171608 (=> (not res!81531) (not e!113254))))

(assert (=> b!171608 (= res!81531 (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(declare-fun bm!17470 () Bool)

(declare-fun call!17473 () ListLongMap!2161)

(assert (=> bm!17470 (= call!17473 (getCurrentListMapNoExtraKeys!162 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3555 lt!85045)))))

(declare-fun d!52123 () Bool)

(assert (=> d!52123 e!113257))

(declare-fun res!81530 () Bool)

(assert (=> d!52123 (=> (not res!81530) (not e!113257))))

(assert (=> d!52123 (= res!81530 (not (contains!1144 lt!85422 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52123 (= lt!85422 e!113260)))

(declare-fun c!30696 () Bool)

(assert (=> d!52123 (= c!30696 (bvsge #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!52123 (validMask!0 (mask!8383 lt!85045))))

(assert (=> d!52123 (= (getCurrentListMapNoExtraKeys!162 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) #b00000000000000000000000000000000 (defaultEntry!3555 lt!85045)) lt!85422)))

(declare-fun b!171603 () Bool)

(declare-fun e!113259 () ListLongMap!2161)

(assert (=> b!171603 (= e!113260 e!113259)))

(declare-fun c!30698 () Bool)

(assert (=> b!171603 (= c!30698 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun b!171609 () Bool)

(assert (=> b!171609 (= e!113255 (= lt!85422 (getCurrentListMapNoExtraKeys!162 (_keys!5387 lt!85045) (_values!3538 lt!85045) (mask!8383 lt!85045) (extraKeys!3296 lt!85045) (zeroValue!3398 lt!85045) (minValue!3398 lt!85045) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3555 lt!85045))))))

(declare-fun b!171610 () Bool)

(assert (=> b!171610 (= e!113255 (isEmpty!434 lt!85422))))

(declare-fun b!171611 () Bool)

(assert (=> b!171611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3682 (_keys!5387 lt!85045))))))

(assert (=> b!171611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3683 (_values!3538 lt!85045))))))

(assert (=> b!171611 (= e!113256 (= (apply!129 lt!85422 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)) (get!1938 (select (arr!3390 (_values!3538 lt!85045)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 lt!85045) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171612 () Bool)

(assert (=> b!171612 (= e!113259 call!17473)))

(declare-fun b!171613 () Bool)

(declare-fun lt!85421 () Unit!5252)

(declare-fun lt!85418 () Unit!5252)

(assert (=> b!171613 (= lt!85421 lt!85418)))

(declare-fun lt!85420 () (_ BitVec 64))

(declare-fun lt!85423 () (_ BitVec 64))

(declare-fun lt!85424 () V!4987)

(declare-fun lt!85419 () ListLongMap!2161)

(assert (=> b!171613 (not (contains!1144 (+!244 lt!85419 (tuple2!3235 lt!85420 lt!85424)) lt!85423))))

(assert (=> b!171613 (= lt!85418 (addStillNotContains!71 lt!85419 lt!85420 lt!85424 lt!85423))))

(assert (=> b!171613 (= lt!85423 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171613 (= lt!85424 (get!1938 (select (arr!3390 (_values!3538 lt!85045)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 lt!85045) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171613 (= lt!85420 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000))))

(assert (=> b!171613 (= lt!85419 call!17473)))

(assert (=> b!171613 (= e!113259 (+!244 call!17473 (tuple2!3235 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 lt!85045)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 lt!85045) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52123 c!30696) b!171606))

(assert (= (and d!52123 (not c!30696)) b!171603))

(assert (= (and b!171603 c!30698) b!171613))

(assert (= (and b!171603 (not c!30698)) b!171612))

(assert (= (or b!171613 b!171612) bm!17470))

(assert (= (and d!52123 res!81530) b!171605))

(assert (= (and b!171605 res!81533) b!171608))

(assert (= (and b!171608 res!81531) b!171604))

(assert (= (and b!171608 c!30699) b!171607))

(assert (= (and b!171608 (not c!30699)) b!171602))

(assert (= (and b!171607 res!81532) b!171611))

(assert (= (and b!171602 c!30697) b!171609))

(assert (= (and b!171602 (not c!30697)) b!171610))

(declare-fun b_lambda!6913 () Bool)

(assert (=> (not b_lambda!6913) (not b!171611)))

(assert (=> b!171611 t!7001))

(declare-fun b_and!10665 () Bool)

(assert (= b_and!10663 (and (=> t!7001 result!4567) b_and!10665)))

(declare-fun b_lambda!6915 () Bool)

(assert (=> (not b_lambda!6915) (not b!171613)))

(assert (=> b!171613 t!7001))

(declare-fun b_and!10667 () Bool)

(assert (= b_and!10665 (and (=> t!7001 result!4567) b_and!10667)))

(assert (=> b!171603 m!199545))

(assert (=> b!171603 m!199545))

(assert (=> b!171603 m!199547))

(declare-fun m!200273 () Bool)

(assert (=> b!171609 m!200273))

(assert (=> b!171604 m!199545))

(assert (=> b!171604 m!199545))

(assert (=> b!171604 m!199547))

(assert (=> bm!17470 m!200273))

(declare-fun m!200275 () Bool)

(assert (=> d!52123 m!200275))

(assert (=> d!52123 m!199601))

(assert (=> b!171607 m!199545))

(assert (=> b!171607 m!199545))

(declare-fun m!200277 () Bool)

(assert (=> b!171607 m!200277))

(assert (=> b!171613 m!199659))

(assert (=> b!171613 m!199661))

(assert (=> b!171613 m!199665))

(declare-fun m!200279 () Bool)

(assert (=> b!171613 m!200279))

(assert (=> b!171613 m!199659))

(assert (=> b!171613 m!199661))

(declare-fun m!200281 () Bool)

(assert (=> b!171613 m!200281))

(assert (=> b!171613 m!199545))

(declare-fun m!200283 () Bool)

(assert (=> b!171613 m!200283))

(declare-fun m!200285 () Bool)

(assert (=> b!171613 m!200285))

(assert (=> b!171613 m!200283))

(declare-fun m!200287 () Bool)

(assert (=> b!171610 m!200287))

(assert (=> b!171611 m!199659))

(assert (=> b!171611 m!199661))

(assert (=> b!171611 m!199665))

(assert (=> b!171611 m!199545))

(declare-fun m!200289 () Bool)

(assert (=> b!171611 m!200289))

(assert (=> b!171611 m!199659))

(assert (=> b!171611 m!199661))

(assert (=> b!171611 m!199545))

(declare-fun m!200291 () Bool)

(assert (=> b!171605 m!200291))

(assert (=> bm!17444 d!52123))

(declare-fun d!52125 () Bool)

(declare-fun lt!85425 () Bool)

(assert (=> d!52125 (= lt!85425 (select (content!147 lt!85263) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!113262 () Bool)

(assert (=> d!52125 (= lt!85425 e!113262)))

(declare-fun res!81534 () Bool)

(assert (=> d!52125 (=> (not res!81534) (not e!113262))))

(assert (=> d!52125 (= res!81534 ((_ is Cons!2189) lt!85263))))

(assert (=> d!52125 (= (contains!1146 lt!85263 (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!85425)))

(declare-fun b!171614 () Bool)

(declare-fun e!113261 () Bool)

(assert (=> b!171614 (= e!113262 e!113261)))

(declare-fun res!81535 () Bool)

(assert (=> b!171614 (=> res!81535 e!113261)))

(assert (=> b!171614 (= res!81535 (= (h!2806 lt!85263) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171615 () Bool)

(assert (=> b!171615 (= e!113261 (contains!1146 (t!6995 lt!85263) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52125 res!81534) b!171614))

(assert (= (and b!171614 (not res!81535)) b!171615))

(declare-fun m!200293 () Bool)

(assert (=> d!52125 m!200293))

(declare-fun m!200295 () Bool)

(assert (=> d!52125 m!200295))

(declare-fun m!200297 () Bool)

(assert (=> b!171615 m!200297))

(assert (=> b!171216 d!52125))

(declare-fun d!52127 () Bool)

(declare-fun lt!85426 () Bool)

(assert (=> d!52127 (= lt!85426 (select (content!147 (toList!1096 lt!85335)) (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))

(declare-fun e!113264 () Bool)

(assert (=> d!52127 (= lt!85426 e!113264)))

(declare-fun res!81536 () Bool)

(assert (=> d!52127 (=> (not res!81536) (not e!113264))))

(assert (=> d!52127 (= res!81536 ((_ is Cons!2189) (toList!1096 lt!85335)))))

(assert (=> d!52127 (= (contains!1146 (toList!1096 lt!85335) (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) lt!85426)))

(declare-fun b!171616 () Bool)

(declare-fun e!113263 () Bool)

(assert (=> b!171616 (= e!113264 e!113263)))

(declare-fun res!81537 () Bool)

(assert (=> b!171616 (=> res!81537 e!113263)))

(assert (=> b!171616 (= res!81537 (= (h!2806 (toList!1096 lt!85335)) (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))

(declare-fun b!171617 () Bool)

(assert (=> b!171617 (= e!113263 (contains!1146 (t!6995 (toList!1096 lt!85335)) (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))

(assert (= (and d!52127 res!81536) b!171616))

(assert (= (and b!171616 (not res!81537)) b!171617))

(declare-fun m!200299 () Bool)

(assert (=> d!52127 m!200299))

(declare-fun m!200301 () Bool)

(assert (=> d!52127 m!200301))

(declare-fun m!200303 () Bool)

(assert (=> b!171617 m!200303))

(assert (=> b!171313 d!52127))

(declare-fun d!52129 () Bool)

(assert (=> d!52129 (= (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) lt!85141)) (v!3914 (getValueByKey!184 (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) lt!85141)))))

(assert (=> d!51923 d!52129))

(declare-fun b!171619 () Bool)

(declare-fun e!113265 () Option!190)

(declare-fun e!113266 () Option!190)

(assert (=> b!171619 (= e!113265 e!113266)))

(declare-fun c!30701 () Bool)

(assert (=> b!171619 (= c!30701 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))) (not (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))) lt!85141))))))

(declare-fun b!171620 () Bool)

(assert (=> b!171620 (= e!113266 (getValueByKey!184 (t!6995 (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))) lt!85141))))

(declare-fun d!52131 () Bool)

(declare-fun c!30700 () Bool)

(assert (=> d!52131 (= c!30700 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))) lt!85141)))))

(assert (=> d!52131 (= (getValueByKey!184 (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) lt!85141) e!113265)))

(declare-fun b!171621 () Bool)

(assert (=> b!171621 (= e!113266 None!188)))

(declare-fun b!171618 () Bool)

(assert (=> b!171618 (= e!113265 (Some!189 (_2!1628 (h!2806 (toList!1096 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))))

(assert (= (and d!52131 c!30700) b!171618))

(assert (= (and d!52131 (not c!30700)) b!171619))

(assert (= (and b!171619 c!30701) b!171620))

(assert (= (and b!171619 (not c!30701)) b!171621))

(declare-fun m!200305 () Bool)

(assert (=> b!171620 m!200305))

(assert (=> d!51923 d!52131))

(assert (=> d!51807 d!51805))

(declare-fun d!52133 () Bool)

(assert (=> d!52133 (= (getValueByKey!184 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309))) (Some!189 (_2!1628 (tuple2!3235 key!828 v!309))))))

(assert (=> d!52133 true))

(declare-fun _$22!532 () Unit!5252)

(assert (=> d!52133 (= (choose!924 lt!85172 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))) _$22!532)))

(declare-fun bs!7086 () Bool)

(assert (= bs!7086 d!52133))

(assert (=> bs!7086 m!199391))

(assert (=> d!51807 d!52133))

(declare-fun d!52135 () Bool)

(declare-fun res!81538 () Bool)

(declare-fun e!113267 () Bool)

(assert (=> d!52135 (=> res!81538 e!113267)))

(assert (=> d!52135 (= res!81538 (or ((_ is Nil!2190) lt!85172) ((_ is Nil!2190) (t!6995 lt!85172))))))

(assert (=> d!52135 (= (isStrictlySorted!331 lt!85172) e!113267)))

(declare-fun b!171622 () Bool)

(declare-fun e!113268 () Bool)

(assert (=> b!171622 (= e!113267 e!113268)))

(declare-fun res!81539 () Bool)

(assert (=> b!171622 (=> (not res!81539) (not e!113268))))

(assert (=> b!171622 (= res!81539 (bvslt (_1!1628 (h!2806 lt!85172)) (_1!1628 (h!2806 (t!6995 lt!85172)))))))

(declare-fun b!171623 () Bool)

(assert (=> b!171623 (= e!113268 (isStrictlySorted!331 (t!6995 lt!85172)))))

(assert (= (and d!52135 (not res!81538)) b!171622))

(assert (= (and b!171622 res!81539) b!171623))

(declare-fun m!200307 () Bool)

(assert (=> b!171623 m!200307))

(assert (=> d!51807 d!52135))

(declare-fun d!52137 () Bool)

(declare-fun e!113270 () Bool)

(assert (=> d!52137 e!113270))

(declare-fun res!81540 () Bool)

(assert (=> d!52137 (=> res!81540 e!113270)))

(declare-fun lt!85429 () Bool)

(assert (=> d!52137 (= res!81540 (not lt!85429))))

(declare-fun lt!85427 () Bool)

(assert (=> d!52137 (= lt!85429 lt!85427)))

(declare-fun lt!85428 () Unit!5252)

(declare-fun e!113269 () Unit!5252)

(assert (=> d!52137 (= lt!85428 e!113269)))

(declare-fun c!30702 () Bool)

(assert (=> d!52137 (= c!30702 lt!85427)))

(assert (=> d!52137 (= lt!85427 (containsKey!188 (toList!1096 lt!85287) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(assert (=> d!52137 (= (contains!1144 lt!85287 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) lt!85429)))

(declare-fun b!171624 () Bool)

(declare-fun lt!85430 () Unit!5252)

(assert (=> b!171624 (= e!113269 lt!85430)))

(assert (=> b!171624 (= lt!85430 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85287) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(assert (=> b!171624 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85287) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun b!171625 () Bool)

(declare-fun Unit!5274 () Unit!5252)

(assert (=> b!171625 (= e!113269 Unit!5274)))

(declare-fun b!171626 () Bool)

(assert (=> b!171626 (= e!113270 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85287) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52137 c!30702) b!171624))

(assert (= (and d!52137 (not c!30702)) b!171625))

(assert (= (and d!52137 (not res!81540)) b!171626))

(declare-fun m!200309 () Bool)

(assert (=> d!52137 m!200309))

(declare-fun m!200311 () Bool)

(assert (=> b!171624 m!200311))

(assert (=> b!171624 m!199681))

(assert (=> b!171624 m!199681))

(declare-fun m!200313 () Bool)

(assert (=> b!171624 m!200313))

(assert (=> b!171626 m!199681))

(assert (=> b!171626 m!199681))

(assert (=> b!171626 m!200313))

(assert (=> d!51863 d!52137))

(declare-fun b!171628 () Bool)

(declare-fun e!113271 () Option!190)

(declare-fun e!113272 () Option!190)

(assert (=> b!171628 (= e!113271 e!113272)))

(declare-fun c!30704 () Bool)

(assert (=> b!171628 (= c!30704 (and ((_ is Cons!2189) lt!85288) (not (= (_1!1628 (h!2806 lt!85288)) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171629 () Bool)

(assert (=> b!171629 (= e!113272 (getValueByKey!184 (t!6995 lt!85288) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun d!52139 () Bool)

(declare-fun c!30703 () Bool)

(assert (=> d!52139 (= c!30703 (and ((_ is Cons!2189) lt!85288) (= (_1!1628 (h!2806 lt!85288)) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(assert (=> d!52139 (= (getValueByKey!184 lt!85288 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) e!113271)))

(declare-fun b!171630 () Bool)

(assert (=> b!171630 (= e!113272 None!188)))

(declare-fun b!171627 () Bool)

(assert (=> b!171627 (= e!113271 (Some!189 (_2!1628 (h!2806 lt!85288))))))

(assert (= (and d!52139 c!30703) b!171627))

(assert (= (and d!52139 (not c!30703)) b!171628))

(assert (= (and b!171628 c!30704) b!171629))

(assert (= (and b!171628 (not c!30704)) b!171630))

(declare-fun m!200315 () Bool)

(assert (=> b!171629 m!200315))

(assert (=> d!51863 d!52139))

(declare-fun d!52141 () Bool)

(assert (=> d!52141 (= (getValueByKey!184 lt!85288 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85431 () Unit!5252)

(assert (=> d!52141 (= lt!85431 (choose!924 lt!85288 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun e!113273 () Bool)

(assert (=> d!52141 e!113273))

(declare-fun res!81541 () Bool)

(assert (=> d!52141 (=> (not res!81541) (not e!113273))))

(assert (=> d!52141 (= res!81541 (isStrictlySorted!331 lt!85288))))

(assert (=> d!52141 (= (lemmaContainsTupThenGetReturnValue!97 lt!85288 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) lt!85431)))

(declare-fun b!171631 () Bool)

(declare-fun res!81542 () Bool)

(assert (=> b!171631 (=> (not res!81542) (not e!113273))))

(assert (=> b!171631 (= res!81542 (containsKey!188 lt!85288 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun b!171632 () Bool)

(assert (=> b!171632 (= e!113273 (contains!1146 lt!85288 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52141 res!81541) b!171631))

(assert (= (and b!171631 res!81542) b!171632))

(assert (=> d!52141 m!199675))

(declare-fun m!200317 () Bool)

(assert (=> d!52141 m!200317))

(declare-fun m!200319 () Bool)

(assert (=> d!52141 m!200319))

(declare-fun m!200321 () Bool)

(assert (=> b!171631 m!200321))

(declare-fun m!200323 () Bool)

(assert (=> b!171632 m!200323))

(assert (=> d!51863 d!52141))

(declare-fun b!171633 () Bool)

(declare-fun e!113274 () List!2193)

(declare-fun call!17475 () List!2193)

(assert (=> b!171633 (= e!113274 call!17475)))

(declare-fun b!171634 () Bool)

(declare-fun res!81544 () Bool)

(declare-fun e!113278 () Bool)

(assert (=> b!171634 (=> (not res!81544) (not e!113278))))

(declare-fun lt!85432 () List!2193)

(assert (=> b!171634 (= res!81544 (containsKey!188 lt!85432 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun b!171635 () Bool)

(declare-fun e!113277 () List!2193)

(declare-fun e!113275 () List!2193)

(assert (=> b!171635 (= e!113277 e!113275)))

(declare-fun c!30706 () Bool)

(assert (=> b!171635 (= c!30706 (and ((_ is Cons!2189) (toList!1096 lt!85115)) (= (_1!1628 (h!2806 (toList!1096 lt!85115))) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(declare-fun e!113276 () List!2193)

(declare-fun b!171636 () Bool)

(declare-fun c!30707 () Bool)

(assert (=> b!171636 (= e!113276 (ite c!30706 (t!6995 (toList!1096 lt!85115)) (ite c!30707 (Cons!2189 (h!2806 (toList!1096 lt!85115)) (t!6995 (toList!1096 lt!85115))) Nil!2190)))))

(declare-fun b!171637 () Bool)

(assert (=> b!171637 (= e!113278 (contains!1146 lt!85432 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(declare-fun b!171638 () Bool)

(declare-fun call!17474 () List!2193)

(assert (=> b!171638 (= e!113277 call!17474)))

(declare-fun bm!17471 () Bool)

(declare-fun c!30708 () Bool)

(assert (=> bm!17471 (= call!17474 ($colon$colon!97 e!113276 (ite c!30708 (h!2806 (toList!1096 lt!85115)) (tuple2!3235 (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))))

(declare-fun c!30705 () Bool)

(assert (=> bm!17471 (= c!30705 c!30708)))

(declare-fun bm!17473 () Bool)

(declare-fun call!17476 () List!2193)

(assert (=> bm!17473 (= call!17475 call!17476)))

(declare-fun b!171639 () Bool)

(assert (=> b!171639 (= e!113275 call!17476)))

(declare-fun b!171640 () Bool)

(assert (=> b!171640 (= e!113274 call!17475)))

(declare-fun b!171641 () Bool)

(assert (=> b!171641 (= c!30707 (and ((_ is Cons!2189) (toList!1096 lt!85115)) (bvsgt (_1!1628 (h!2806 (toList!1096 lt!85115))) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(assert (=> b!171641 (= e!113275 e!113274)))

(declare-fun b!171642 () Bool)

(assert (=> b!171642 (= e!113276 (insertStrictlySorted!100 (t!6995 (toList!1096 lt!85115)) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun bm!17472 () Bool)

(assert (=> bm!17472 (= call!17476 call!17474)))

(declare-fun d!52143 () Bool)

(assert (=> d!52143 e!113278))

(declare-fun res!81543 () Bool)

(assert (=> d!52143 (=> (not res!81543) (not e!113278))))

(assert (=> d!52143 (= res!81543 (isStrictlySorted!331 lt!85432))))

(assert (=> d!52143 (= lt!85432 e!113277)))

(assert (=> d!52143 (= c!30708 (and ((_ is Cons!2189) (toList!1096 lt!85115)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85115))) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(assert (=> d!52143 (isStrictlySorted!331 (toList!1096 lt!85115))))

(assert (=> d!52143 (= (insertStrictlySorted!100 (toList!1096 lt!85115) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) lt!85432)))

(assert (= (and d!52143 c!30708) b!171638))

(assert (= (and d!52143 (not c!30708)) b!171635))

(assert (= (and b!171635 c!30706) b!171639))

(assert (= (and b!171635 (not c!30706)) b!171641))

(assert (= (and b!171641 c!30707) b!171640))

(assert (= (and b!171641 (not c!30707)) b!171633))

(assert (= (or b!171640 b!171633) bm!17473))

(assert (= (or b!171639 bm!17473) bm!17472))

(assert (= (or b!171638 bm!17472) bm!17471))

(assert (= (and bm!17471 c!30705) b!171642))

(assert (= (and bm!17471 (not c!30705)) b!171636))

(assert (= (and d!52143 res!81543) b!171634))

(assert (= (and b!171634 res!81544) b!171637))

(declare-fun m!200325 () Bool)

(assert (=> b!171634 m!200325))

(declare-fun m!200327 () Bool)

(assert (=> d!52143 m!200327))

(declare-fun m!200329 () Bool)

(assert (=> d!52143 m!200329))

(declare-fun m!200331 () Bool)

(assert (=> b!171642 m!200331))

(declare-fun m!200333 () Bool)

(assert (=> b!171637 m!200333))

(declare-fun m!200335 () Bool)

(assert (=> bm!17471 m!200335))

(assert (=> d!51863 d!52143))

(declare-fun d!52145 () Bool)

(declare-fun lt!85435 () Bool)

(declare-fun content!148 (List!2195) (InoxSet (_ BitVec 64)))

(assert (=> d!52145 (= lt!85435 (select (content!148 Nil!2192) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113284 () Bool)

(assert (=> d!52145 (= lt!85435 e!113284)))

(declare-fun res!81550 () Bool)

(assert (=> d!52145 (=> (not res!81550) (not e!113284))))

(assert (=> d!52145 (= res!81550 ((_ is Cons!2191) Nil!2192))))

(assert (=> d!52145 (= (contains!1147 Nil!2192 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) lt!85435)))

(declare-fun b!171647 () Bool)

(declare-fun e!113283 () Bool)

(assert (=> b!171647 (= e!113284 e!113283)))

(declare-fun res!81549 () Bool)

(assert (=> b!171647 (=> res!81549 e!113283)))

(assert (=> b!171647 (= res!81549 (= (h!2808 Nil!2192) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171648 () Bool)

(assert (=> b!171648 (= e!113283 (contains!1147 (t!6999 Nil!2192) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52145 res!81550) b!171647))

(assert (= (and b!171647 (not res!81549)) b!171648))

(declare-fun m!200337 () Bool)

(assert (=> d!52145 m!200337))

(assert (=> d!52145 m!199241))

(declare-fun m!200339 () Bool)

(assert (=> d!52145 m!200339))

(assert (=> b!171648 m!199241))

(declare-fun m!200341 () Bool)

(assert (=> b!171648 m!200341))

(assert (=> b!171322 d!52145))

(declare-fun d!52147 () Bool)

(declare-fun res!81551 () Bool)

(declare-fun e!113285 () Bool)

(assert (=> d!52147 (=> res!81551 e!113285)))

(assert (=> d!52147 (= res!81551 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (= (_1!1628 (h!2806 (toList!1096 lt!85130))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52147 (= (containsKey!188 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) e!113285)))

(declare-fun b!171649 () Bool)

(declare-fun e!113286 () Bool)

(assert (=> b!171649 (= e!113285 e!113286)))

(declare-fun res!81552 () Bool)

(assert (=> b!171649 (=> (not res!81552) (not e!113286))))

(assert (=> b!171649 (= res!81552 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85130))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85130))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2189) (toList!1096 lt!85130)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85130))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!171650 () Bool)

(assert (=> b!171650 (= e!113286 (containsKey!188 (t!6995 (toList!1096 lt!85130)) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52147 (not res!81551)) b!171649))

(assert (= (and b!171649 res!81552) b!171650))

(assert (=> b!171650 m!199241))

(declare-fun m!200343 () Bool)

(assert (=> b!171650 m!200343))

(assert (=> d!51819 d!52147))

(assert (=> d!51867 d!51875))

(assert (=> d!51867 d!51885))

(declare-fun d!52149 () Bool)

(assert (=> d!52149 (contains!1144 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)) lt!85102)))

(assert (=> d!52149 true))

(declare-fun _$35!408 () Unit!5252)

(assert (=> d!52149 (= (choose!925 lt!85119 lt!85104 v!309 lt!85102) _$35!408)))

(declare-fun bs!7087 () Bool)

(assert (= bs!7087 d!52149))

(assert (=> bs!7087 m!199267))

(assert (=> bs!7087 m!199267))

(assert (=> bs!7087 m!199269))

(assert (=> d!51867 d!52149))

(declare-fun d!52151 () Bool)

(declare-fun e!113288 () Bool)

(assert (=> d!52151 e!113288))

(declare-fun res!81553 () Bool)

(assert (=> d!52151 (=> res!81553 e!113288)))

(declare-fun lt!85438 () Bool)

(assert (=> d!52151 (= res!81553 (not lt!85438))))

(declare-fun lt!85436 () Bool)

(assert (=> d!52151 (= lt!85438 lt!85436)))

(declare-fun lt!85437 () Unit!5252)

(declare-fun e!113287 () Unit!5252)

(assert (=> d!52151 (= lt!85437 e!113287)))

(declare-fun c!30709 () Bool)

(assert (=> d!52151 (= c!30709 lt!85436)))

(assert (=> d!52151 (= lt!85436 (containsKey!188 (toList!1096 lt!85119) lt!85102))))

(assert (=> d!52151 (= (contains!1144 lt!85119 lt!85102) lt!85438)))

(declare-fun b!171652 () Bool)

(declare-fun lt!85439 () Unit!5252)

(assert (=> b!171652 (= e!113287 lt!85439)))

(assert (=> b!171652 (= lt!85439 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85119) lt!85102))))

(assert (=> b!171652 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85119) lt!85102))))

(declare-fun b!171653 () Bool)

(declare-fun Unit!5275 () Unit!5252)

(assert (=> b!171653 (= e!113287 Unit!5275)))

(declare-fun b!171654 () Bool)

(assert (=> b!171654 (= e!113288 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85119) lt!85102)))))

(assert (= (and d!52151 c!30709) b!171652))

(assert (= (and d!52151 (not c!30709)) b!171653))

(assert (= (and d!52151 (not res!81553)) b!171654))

(declare-fun m!200345 () Bool)

(assert (=> d!52151 m!200345))

(declare-fun m!200347 () Bool)

(assert (=> b!171652 m!200347))

(declare-fun m!200349 () Bool)

(assert (=> b!171652 m!200349))

(assert (=> b!171652 m!200349))

(declare-fun m!200351 () Bool)

(assert (=> b!171652 m!200351))

(assert (=> b!171654 m!200349))

(assert (=> b!171654 m!200349))

(assert (=> b!171654 m!200351))

(assert (=> d!51867 d!52151))

(declare-fun d!52153 () Bool)

(assert (=> d!52153 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102))))

(declare-fun lt!85440 () Unit!5252)

(assert (=> d!52153 (= lt!85440 (choose!923 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102))))

(declare-fun e!113289 () Bool)

(assert (=> d!52153 e!113289))

(declare-fun res!81554 () Bool)

(assert (=> d!52153 (=> (not res!81554) (not e!113289))))

(assert (=> d!52153 (= res!81554 (isStrictlySorted!331 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)))))))

(assert (=> d!52153 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102) lt!85440)))

(declare-fun b!171655 () Bool)

(assert (=> b!171655 (= e!113289 (containsKey!188 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102))))

(assert (= (and d!52153 res!81554) b!171655))

(assert (=> d!52153 m!199717))

(assert (=> d!52153 m!199717))

(assert (=> d!52153 m!199719))

(declare-fun m!200353 () Bool)

(assert (=> d!52153 m!200353))

(declare-fun m!200355 () Bool)

(assert (=> d!52153 m!200355))

(assert (=> b!171655 m!199713))

(assert (=> b!171285 d!52153))

(assert (=> b!171285 d!52043))

(assert (=> b!171285 d!52045))

(declare-fun d!52155 () Bool)

(declare-fun lt!85441 () Bool)

(assert (=> d!52155 (= lt!85441 (select (content!147 (toList!1096 lt!85302)) (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))

(declare-fun e!113291 () Bool)

(assert (=> d!52155 (= lt!85441 e!113291)))

(declare-fun res!81555 () Bool)

(assert (=> d!52155 (=> (not res!81555) (not e!113291))))

(assert (=> d!52155 (= res!81555 ((_ is Cons!2189) (toList!1096 lt!85302)))))

(assert (=> d!52155 (= (contains!1146 (toList!1096 lt!85302) (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) lt!85441)))

(declare-fun b!171656 () Bool)

(declare-fun e!113290 () Bool)

(assert (=> b!171656 (= e!113291 e!113290)))

(declare-fun res!81556 () Bool)

(assert (=> b!171656 (=> res!81556 e!113290)))

(assert (=> b!171656 (= res!81556 (= (h!2806 (toList!1096 lt!85302)) (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))

(declare-fun b!171657 () Bool)

(assert (=> b!171657 (= e!113290 (contains!1146 (t!6995 (toList!1096 lt!85302)) (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))

(assert (= (and d!52155 res!81555) b!171656))

(assert (= (and b!171656 (not res!81556)) b!171657))

(declare-fun m!200357 () Bool)

(assert (=> d!52155 m!200357))

(declare-fun m!200359 () Bool)

(assert (=> d!52155 m!200359))

(declare-fun m!200361 () Bool)

(assert (=> b!171657 m!200361))

(assert (=> b!171289 d!52155))

(declare-fun d!52157 () Bool)

(assert (=> d!52157 (= (apply!129 (+!244 lt!85136 (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) lt!85128) (apply!129 lt!85136 lt!85128))))

(assert (=> d!52157 true))

(declare-fun _$34!1047 () Unit!5252)

(assert (=> d!52157 (= (choose!926 lt!85136 lt!85135 (minValue!3398 thiss!1248) lt!85128) _$34!1047)))

(declare-fun bs!7088 () Bool)

(assert (= bs!7088 d!52157))

(assert (=> bs!7088 m!199327))

(assert (=> bs!7088 m!199327))

(assert (=> bs!7088 m!199345))

(assert (=> bs!7088 m!199337))

(assert (=> d!51911 d!52157))

(assert (=> d!51911 d!51909))

(assert (=> d!51911 d!51913))

(declare-fun d!52159 () Bool)

(declare-fun e!113293 () Bool)

(assert (=> d!52159 e!113293))

(declare-fun res!81557 () Bool)

(assert (=> d!52159 (=> res!81557 e!113293)))

(declare-fun lt!85444 () Bool)

(assert (=> d!52159 (= res!81557 (not lt!85444))))

(declare-fun lt!85442 () Bool)

(assert (=> d!52159 (= lt!85444 lt!85442)))

(declare-fun lt!85443 () Unit!5252)

(declare-fun e!113292 () Unit!5252)

(assert (=> d!52159 (= lt!85443 e!113292)))

(declare-fun c!30710 () Bool)

(assert (=> d!52159 (= c!30710 lt!85442)))

(assert (=> d!52159 (= lt!85442 (containsKey!188 (toList!1096 lt!85136) lt!85128))))

(assert (=> d!52159 (= (contains!1144 lt!85136 lt!85128) lt!85444)))

(declare-fun b!171659 () Bool)

(declare-fun lt!85445 () Unit!5252)

(assert (=> b!171659 (= e!113292 lt!85445)))

(assert (=> b!171659 (= lt!85445 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85136) lt!85128))))

(assert (=> b!171659 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85136) lt!85128))))

(declare-fun b!171660 () Bool)

(declare-fun Unit!5276 () Unit!5252)

(assert (=> b!171660 (= e!113292 Unit!5276)))

(declare-fun b!171661 () Bool)

(assert (=> b!171661 (= e!113293 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85136) lt!85128)))))

(assert (= (and d!52159 c!30710) b!171659))

(assert (= (and d!52159 (not c!30710)) b!171660))

(assert (= (and d!52159 (not res!81557)) b!171661))

(declare-fun m!200363 () Bool)

(assert (=> d!52159 m!200363))

(declare-fun m!200365 () Bool)

(assert (=> b!171659 m!200365))

(assert (=> b!171659 m!199815))

(assert (=> b!171659 m!199815))

(declare-fun m!200367 () Bool)

(assert (=> b!171659 m!200367))

(assert (=> b!171661 m!199815))

(assert (=> b!171661 m!199815))

(assert (=> b!171661 m!200367))

(assert (=> d!51911 d!52159))

(assert (=> d!51911 d!51921))

(declare-fun bm!17474 () Bool)

(declare-fun c!30711 () Bool)

(declare-fun call!17477 () Bool)

(assert (=> bm!17474 (= call!17477 (arrayNoDuplicates!0 (_keys!5387 lt!85045) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!30711 (Cons!2191 (select (arr!3389 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30588 (Cons!2191 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) Nil!2192) Nil!2192)) (ite c!30588 (Cons!2191 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) Nil!2192) Nil!2192))))))

(declare-fun b!171662 () Bool)

(declare-fun e!113297 () Bool)

(assert (=> b!171662 (= e!113297 call!17477)))

(declare-fun b!171663 () Bool)

(declare-fun e!113296 () Bool)

(assert (=> b!171663 (= e!113296 e!113297)))

(assert (=> b!171663 (= c!30711 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171664 () Bool)

(assert (=> b!171664 (= e!113297 call!17477)))

(declare-fun b!171665 () Bool)

(declare-fun e!113294 () Bool)

(assert (=> b!171665 (= e!113294 (contains!1147 (ite c!30588 (Cons!2191 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) Nil!2192) Nil!2192) (select (arr!3389 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171666 () Bool)

(declare-fun e!113295 () Bool)

(assert (=> b!171666 (= e!113295 e!113296)))

(declare-fun res!81558 () Bool)

(assert (=> b!171666 (=> (not res!81558) (not e!113296))))

(assert (=> b!171666 (= res!81558 (not e!113294))))

(declare-fun res!81560 () Bool)

(assert (=> b!171666 (=> (not res!81560) (not e!113294))))

(assert (=> b!171666 (= res!81560 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52161 () Bool)

(declare-fun res!81559 () Bool)

(assert (=> d!52161 (=> res!81559 e!113295)))

(assert (=> d!52161 (= res!81559 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!52161 (= (arrayNoDuplicates!0 (_keys!5387 lt!85045) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30588 (Cons!2191 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000) Nil!2192) Nil!2192)) e!113295)))

(assert (= (and d!52161 (not res!81559)) b!171666))

(assert (= (and b!171666 res!81560) b!171665))

(assert (= (and b!171666 res!81558) b!171663))

(assert (= (and b!171663 c!30711) b!171662))

(assert (= (and b!171663 (not c!30711)) b!171664))

(assert (= (or b!171662 b!171664) bm!17474))

(assert (=> bm!17474 m!200115))

(declare-fun m!200369 () Bool)

(assert (=> bm!17474 m!200369))

(assert (=> b!171663 m!200115))

(assert (=> b!171663 m!200115))

(assert (=> b!171663 m!200117))

(assert (=> b!171665 m!200115))

(assert (=> b!171665 m!200115))

(declare-fun m!200371 () Bool)

(assert (=> b!171665 m!200371))

(assert (=> b!171666 m!200115))

(assert (=> b!171666 m!200115))

(assert (=> b!171666 m!200117))

(assert (=> bm!17439 d!52161))

(declare-fun b!171668 () Bool)

(declare-fun e!113298 () Option!190)

(declare-fun e!113299 () Option!190)

(assert (=> b!171668 (= e!113298 e!113299)))

(declare-fun c!30713 () Bool)

(assert (=> b!171668 (= c!30713 (and ((_ is Cons!2189) (toList!1096 lt!85232)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85232))) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))))

(declare-fun b!171669 () Bool)

(assert (=> b!171669 (= e!113299 (getValueByKey!184 (t!6995 (toList!1096 lt!85232)) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun d!52163 () Bool)

(declare-fun c!30712 () Bool)

(assert (=> d!52163 (= c!30712 (and ((_ is Cons!2189) (toList!1096 lt!85232)) (= (_1!1628 (h!2806 (toList!1096 lt!85232))) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (=> d!52163 (= (getValueByKey!184 (toList!1096 lt!85232) (_1!1628 (ite (or c!30512 c!30510) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) e!113298)))

(declare-fun b!171670 () Bool)

(assert (=> b!171670 (= e!113299 None!188)))

(declare-fun b!171667 () Bool)

(assert (=> b!171667 (= e!113298 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85232)))))))

(assert (= (and d!52163 c!30712) b!171667))

(assert (= (and d!52163 (not c!30712)) b!171668))

(assert (= (and b!171668 c!30713) b!171669))

(assert (= (and b!171668 (not c!30713)) b!171670))

(declare-fun m!200373 () Bool)

(assert (=> b!171669 m!200373))

(assert (=> b!171159 d!52163))

(declare-fun b!171672 () Bool)

(declare-fun e!113300 () Option!190)

(declare-fun e!113301 () Option!190)

(assert (=> b!171672 (= e!113300 e!113301)))

(declare-fun c!30715 () Bool)

(assert (=> b!171672 (= c!30715 (and ((_ is Cons!2189) (toList!1096 lt!85340)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85340))) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))))

(declare-fun b!171673 () Bool)

(assert (=> b!171673 (= e!113301 (getValueByKey!184 (t!6995 (toList!1096 lt!85340)) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))))))

(declare-fun c!30714 () Bool)

(declare-fun d!52165 () Bool)

(assert (=> d!52165 (= c!30714 (and ((_ is Cons!2189) (toList!1096 lt!85340)) (= (_1!1628 (h!2806 (toList!1096 lt!85340))) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))))))))

(assert (=> d!52165 (= (getValueByKey!184 (toList!1096 lt!85340) (_1!1628 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248)))) e!113300)))

(declare-fun b!171674 () Bool)

(assert (=> b!171674 (= e!113301 None!188)))

(declare-fun b!171671 () Bool)

(assert (=> b!171671 (= e!113300 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85340)))))))

(assert (= (and d!52165 c!30714) b!171671))

(assert (= (and d!52165 (not c!30714)) b!171672))

(assert (= (and b!171672 c!30715) b!171673))

(assert (= (and b!171672 (not c!30715)) b!171674))

(declare-fun m!200375 () Bool)

(assert (=> b!171673 m!200375))

(assert (=> b!171315 d!52165))

(declare-fun d!52167 () Bool)

(declare-fun e!113303 () Bool)

(assert (=> d!52167 e!113303))

(declare-fun res!81561 () Bool)

(assert (=> d!52167 (=> res!81561 e!113303)))

(declare-fun lt!85448 () Bool)

(assert (=> d!52167 (= res!81561 (not lt!85448))))

(declare-fun lt!85446 () Bool)

(assert (=> d!52167 (= lt!85448 lt!85446)))

(declare-fun lt!85447 () Unit!5252)

(declare-fun e!113302 () Unit!5252)

(assert (=> d!52167 (= lt!85447 e!113302)))

(declare-fun c!30716 () Bool)

(assert (=> d!52167 (= c!30716 lt!85446)))

(assert (=> d!52167 (= lt!85446 (containsKey!188 (toList!1096 lt!85239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52167 (= (contains!1144 lt!85239 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85448)))

(declare-fun b!171675 () Bool)

(declare-fun lt!85449 () Unit!5252)

(assert (=> b!171675 (= e!113302 lt!85449)))

(assert (=> b!171675 (= lt!85449 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171675 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85239) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171676 () Bool)

(declare-fun Unit!5277 () Unit!5252)

(assert (=> b!171676 (= e!113302 Unit!5277)))

(declare-fun b!171677 () Bool)

(assert (=> b!171677 (= e!113303 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52167 c!30716) b!171675))

(assert (= (and d!52167 (not c!30716)) b!171676))

(assert (= (and d!52167 (not res!81561)) b!171677))

(declare-fun m!200377 () Bool)

(assert (=> d!52167 m!200377))

(declare-fun m!200379 () Bool)

(assert (=> b!171675 m!200379))

(declare-fun m!200381 () Bool)

(assert (=> b!171675 m!200381))

(assert (=> b!171675 m!200381))

(declare-fun m!200383 () Bool)

(assert (=> b!171675 m!200383))

(assert (=> b!171677 m!200381))

(assert (=> b!171677 m!200381))

(assert (=> b!171677 m!200383))

(assert (=> b!171164 d!52167))

(declare-fun d!52169 () Bool)

(assert (=> d!52169 (= (apply!129 (+!244 lt!85101 (tuple2!3235 lt!85107 v!309)) lt!85116) (apply!129 lt!85101 lt!85116))))

(assert (=> d!52169 true))

(declare-fun _$34!1048 () Unit!5252)

(assert (=> d!52169 (= (choose!926 lt!85101 lt!85107 v!309 lt!85116) _$34!1048)))

(declare-fun bs!7089 () Bool)

(assert (= bs!7089 d!52169))

(assert (=> bs!7089 m!199257))

(assert (=> bs!7089 m!199257))

(assert (=> bs!7089 m!199259))

(assert (=> bs!7089 m!199255))

(assert (=> d!51881 d!52169))

(assert (=> d!51881 d!51865))

(assert (=> d!51881 d!51873))

(assert (=> d!51881 d!51889))

(declare-fun d!52171 () Bool)

(declare-fun e!113305 () Bool)

(assert (=> d!52171 e!113305))

(declare-fun res!81562 () Bool)

(assert (=> d!52171 (=> res!81562 e!113305)))

(declare-fun lt!85452 () Bool)

(assert (=> d!52171 (= res!81562 (not lt!85452))))

(declare-fun lt!85450 () Bool)

(assert (=> d!52171 (= lt!85452 lt!85450)))

(declare-fun lt!85451 () Unit!5252)

(declare-fun e!113304 () Unit!5252)

(assert (=> d!52171 (= lt!85451 e!113304)))

(declare-fun c!30717 () Bool)

(assert (=> d!52171 (= c!30717 lt!85450)))

(assert (=> d!52171 (= lt!85450 (containsKey!188 (toList!1096 lt!85101) lt!85116))))

(assert (=> d!52171 (= (contains!1144 lt!85101 lt!85116) lt!85452)))

(declare-fun b!171678 () Bool)

(declare-fun lt!85453 () Unit!5252)

(assert (=> b!171678 (= e!113304 lt!85453)))

(assert (=> b!171678 (= lt!85453 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85101) lt!85116))))

(assert (=> b!171678 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85101) lt!85116))))

(declare-fun b!171679 () Bool)

(declare-fun Unit!5278 () Unit!5252)

(assert (=> b!171679 (= e!113304 Unit!5278)))

(declare-fun b!171680 () Bool)

(assert (=> b!171680 (= e!113305 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85101) lt!85116)))))

(assert (= (and d!52171 c!30717) b!171678))

(assert (= (and d!52171 (not c!30717)) b!171679))

(assert (= (and d!52171 (not res!81562)) b!171680))

(declare-fun m!200385 () Bool)

(assert (=> d!52171 m!200385))

(declare-fun m!200387 () Bool)

(assert (=> b!171678 m!200387))

(assert (=> b!171678 m!199709))

(assert (=> b!171678 m!199709))

(declare-fun m!200389 () Bool)

(assert (=> b!171678 m!200389))

(assert (=> b!171680 m!199709))

(assert (=> b!171680 m!199709))

(assert (=> b!171680 m!200389))

(assert (=> d!51881 d!52171))

(declare-fun d!52173 () Bool)

(assert (=> d!52173 (= (size!3686 lt!85045) (bvadd (_size!1162 lt!85045) (bvsdiv (bvadd (extraKeys!3296 lt!85045) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!171232 d!52173))

(declare-fun b!171681 () Bool)

(declare-fun e!113310 () Bool)

(declare-fun e!113307 () Bool)

(assert (=> b!171681 (= e!113310 e!113307)))

(declare-fun c!30719 () Bool)

(assert (=> b!171681 (= c!30719 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun b!171683 () Bool)

(declare-fun e!113306 () Bool)

(assert (=> b!171683 (= e!113306 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171683 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!171684 () Bool)

(declare-fun res!81566 () Bool)

(declare-fun e!113309 () Bool)

(assert (=> b!171684 (=> (not res!81566) (not e!113309))))

(declare-fun lt!85458 () ListLongMap!2161)

(assert (=> b!171684 (= res!81566 (not (contains!1144 lt!85458 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171685 () Bool)

(declare-fun e!113312 () ListLongMap!2161)

(assert (=> b!171685 (= e!113312 (ListLongMap!2162 Nil!2190))))

(declare-fun b!171686 () Bool)

(declare-fun e!113308 () Bool)

(assert (=> b!171686 (= e!113310 e!113308)))

(assert (=> b!171686 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun res!81565 () Bool)

(assert (=> b!171686 (= res!81565 (contains!1144 lt!85458 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171686 (=> (not res!81565) (not e!113308))))

(declare-fun b!171687 () Bool)

(assert (=> b!171687 (= e!113309 e!113310)))

(declare-fun c!30721 () Bool)

(assert (=> b!171687 (= c!30721 e!113306)))

(declare-fun res!81564 () Bool)

(assert (=> b!171687 (=> (not res!81564) (not e!113306))))

(assert (=> b!171687 (= res!81564 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun bm!17475 () Bool)

(declare-fun call!17478 () ListLongMap!2161)

(assert (=> bm!17475 (= call!17478 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248)))))

(declare-fun d!52175 () Bool)

(assert (=> d!52175 e!113309))

(declare-fun res!81563 () Bool)

(assert (=> d!52175 (=> (not res!81563) (not e!113309))))

(assert (=> d!52175 (= res!81563 (not (contains!1144 lt!85458 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52175 (= lt!85458 e!113312)))

(declare-fun c!30718 () Bool)

(assert (=> d!52175 (= c!30718 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!52175 (validMask!0 (mask!8383 thiss!1248))))

(assert (=> d!52175 (= (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248)) lt!85458)))

(declare-fun b!171682 () Bool)

(declare-fun e!113311 () ListLongMap!2161)

(assert (=> b!171682 (= e!113312 e!113311)))

(declare-fun c!30720 () Bool)

(assert (=> b!171682 (= c!30720 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171688 () Bool)

(assert (=> b!171688 (= e!113307 (= lt!85458 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248))))))

(declare-fun b!171689 () Bool)

(assert (=> b!171689 (= e!113307 (isEmpty!434 lt!85458))))

(declare-fun b!171690 () Bool)

(assert (=> b!171690 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> b!171690 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3683 (_values!3538 thiss!1248))))))

(assert (=> b!171690 (= e!113308 (= (apply!129 lt!85458 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171691 () Bool)

(assert (=> b!171691 (= e!113311 call!17478)))

(declare-fun b!171692 () Bool)

(declare-fun lt!85457 () Unit!5252)

(declare-fun lt!85454 () Unit!5252)

(assert (=> b!171692 (= lt!85457 lt!85454)))

(declare-fun lt!85459 () (_ BitVec 64))

(declare-fun lt!85460 () V!4987)

(declare-fun lt!85455 () ListLongMap!2161)

(declare-fun lt!85456 () (_ BitVec 64))

(assert (=> b!171692 (not (contains!1144 (+!244 lt!85455 (tuple2!3235 lt!85456 lt!85460)) lt!85459))))

(assert (=> b!171692 (= lt!85454 (addStillNotContains!71 lt!85455 lt!85456 lt!85460 lt!85459))))

(assert (=> b!171692 (= lt!85459 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171692 (= lt!85460 (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171692 (= lt!85456 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171692 (= lt!85455 call!17478)))

(assert (=> b!171692 (= e!113311 (+!244 call!17478 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52175 c!30718) b!171685))

(assert (= (and d!52175 (not c!30718)) b!171682))

(assert (= (and b!171682 c!30720) b!171692))

(assert (= (and b!171682 (not c!30720)) b!171691))

(assert (= (or b!171692 b!171691) bm!17475))

(assert (= (and d!52175 res!81563) b!171684))

(assert (= (and b!171684 res!81566) b!171687))

(assert (= (and b!171687 res!81564) b!171683))

(assert (= (and b!171687 c!30721) b!171686))

(assert (= (and b!171687 (not c!30721)) b!171681))

(assert (= (and b!171686 res!81565) b!171690))

(assert (= (and b!171681 c!30719) b!171688))

(assert (= (and b!171681 (not c!30719)) b!171689))

(declare-fun b_lambda!6917 () Bool)

(assert (=> (not b_lambda!6917) (not b!171690)))

(assert (=> b!171690 t!6998))

(declare-fun b_and!10669 () Bool)

(assert (= b_and!10667 (and (=> t!6998 result!4561) b_and!10669)))

(declare-fun b_lambda!6919 () Bool)

(assert (=> (not b_lambda!6919) (not b!171692)))

(assert (=> b!171692 t!6998))

(declare-fun b_and!10671 () Bool)

(assert (= b_and!10669 (and (=> t!6998 result!4561) b_and!10671)))

(assert (=> b!171682 m!200053))

(assert (=> b!171682 m!200053))

(assert (=> b!171682 m!200055))

(declare-fun m!200391 () Bool)

(assert (=> b!171688 m!200391))

(assert (=> b!171683 m!200053))

(assert (=> b!171683 m!200053))

(assert (=> b!171683 m!200055))

(assert (=> bm!17475 m!200391))

(declare-fun m!200393 () Bool)

(assert (=> d!52175 m!200393))

(assert (=> d!52175 m!199295))

(assert (=> b!171686 m!200053))

(assert (=> b!171686 m!200053))

(declare-fun m!200395 () Bool)

(assert (=> b!171686 m!200395))

(declare-fun m!200397 () Bool)

(assert (=> b!171692 m!200397))

(assert (=> b!171692 m!199289))

(declare-fun m!200399 () Bool)

(assert (=> b!171692 m!200399))

(declare-fun m!200401 () Bool)

(assert (=> b!171692 m!200401))

(assert (=> b!171692 m!200397))

(assert (=> b!171692 m!199289))

(declare-fun m!200403 () Bool)

(assert (=> b!171692 m!200403))

(assert (=> b!171692 m!200053))

(declare-fun m!200405 () Bool)

(assert (=> b!171692 m!200405))

(declare-fun m!200407 () Bool)

(assert (=> b!171692 m!200407))

(assert (=> b!171692 m!200405))

(declare-fun m!200409 () Bool)

(assert (=> b!171689 m!200409))

(assert (=> b!171690 m!200397))

(assert (=> b!171690 m!199289))

(assert (=> b!171690 m!200399))

(assert (=> b!171690 m!200053))

(declare-fun m!200411 () Bool)

(assert (=> b!171690 m!200411))

(assert (=> b!171690 m!200397))

(assert (=> b!171690 m!199289))

(assert (=> b!171690 m!200053))

(declare-fun m!200413 () Bool)

(assert (=> b!171684 m!200413))

(assert (=> b!171168 d!52175))

(declare-fun d!52177 () Bool)

(declare-fun lt!85461 () Bool)

(assert (=> d!52177 (= lt!85461 (select (content!147 (toList!1096 lt!85287)) (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))

(declare-fun e!113314 () Bool)

(assert (=> d!52177 (= lt!85461 e!113314)))

(declare-fun res!81567 () Bool)

(assert (=> d!52177 (=> (not res!81567) (not e!113314))))

(assert (=> d!52177 (= res!81567 ((_ is Cons!2189) (toList!1096 lt!85287)))))

(assert (=> d!52177 (= (contains!1146 (toList!1096 lt!85287) (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) lt!85461)))

(declare-fun b!171693 () Bool)

(declare-fun e!113313 () Bool)

(assert (=> b!171693 (= e!113314 e!113313)))

(declare-fun res!81568 () Bool)

(assert (=> b!171693 (=> res!81568 e!113313)))

(assert (=> b!171693 (= res!81568 (= (h!2806 (toList!1096 lt!85287)) (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))

(declare-fun b!171694 () Bool)

(assert (=> b!171694 (= e!113313 (contains!1146 (t!6995 (toList!1096 lt!85287)) (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))

(assert (= (and d!52177 res!81567) b!171693))

(assert (= (and b!171693 (not res!81568)) b!171694))

(declare-fun m!200415 () Bool)

(assert (=> d!52177 m!200415))

(declare-fun m!200417 () Bool)

(assert (=> d!52177 m!200417))

(declare-fun m!200419 () Bool)

(assert (=> b!171694 m!200419))

(assert (=> b!171281 d!52177))

(declare-fun d!52179 () Bool)

(declare-fun e!113316 () Bool)

(assert (=> d!52179 e!113316))

(declare-fun res!81569 () Bool)

(assert (=> d!52179 (=> res!81569 e!113316)))

(declare-fun lt!85464 () Bool)

(assert (=> d!52179 (= res!81569 (not lt!85464))))

(declare-fun lt!85462 () Bool)

(assert (=> d!52179 (= lt!85464 lt!85462)))

(declare-fun lt!85463 () Unit!5252)

(declare-fun e!113315 () Unit!5252)

(assert (=> d!52179 (= lt!85463 e!113315)))

(declare-fun c!30722 () Bool)

(assert (=> d!52179 (= c!30722 lt!85462)))

(assert (=> d!52179 (= lt!85462 (containsKey!188 (toList!1096 lt!85221) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52179 (= (contains!1144 lt!85221 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) lt!85464)))

(declare-fun b!171695 () Bool)

(declare-fun lt!85465 () Unit!5252)

(assert (=> b!171695 (= e!113315 lt!85465)))

(assert (=> b!171695 (= lt!85465 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85221) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171695 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85221) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171696 () Bool)

(declare-fun Unit!5279 () Unit!5252)

(assert (=> b!171696 (= e!113315 Unit!5279)))

(declare-fun b!171697 () Bool)

(assert (=> b!171697 (= e!113316 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85221) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52179 c!30722) b!171695))

(assert (= (and d!52179 (not c!30722)) b!171696))

(assert (= (and d!52179 (not res!81569)) b!171697))

(assert (=> d!52179 m!199241))

(declare-fun m!200421 () Bool)

(assert (=> d!52179 m!200421))

(assert (=> b!171695 m!199241))

(declare-fun m!200423 () Bool)

(assert (=> b!171695 m!200423))

(assert (=> b!171695 m!199241))

(assert (=> b!171695 m!200103))

(assert (=> b!171695 m!200103))

(declare-fun m!200425 () Bool)

(assert (=> b!171695 m!200425))

(assert (=> b!171697 m!199241))

(assert (=> b!171697 m!200103))

(assert (=> b!171697 m!200103))

(assert (=> b!171697 m!200425))

(assert (=> b!171137 d!52179))

(declare-fun d!52181 () Bool)

(declare-fun lt!85466 () Bool)

(assert (=> d!52181 (= lt!85466 (select (content!147 lt!85194) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun e!113318 () Bool)

(assert (=> d!52181 (= lt!85466 e!113318)))

(declare-fun res!81570 () Bool)

(assert (=> d!52181 (=> (not res!81570) (not e!113318))))

(assert (=> d!52181 (= res!81570 ((_ is Cons!2189) lt!85194))))

(assert (=> d!52181 (= (contains!1146 lt!85194 (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))) lt!85466)))

(declare-fun b!171698 () Bool)

(declare-fun e!113317 () Bool)

(assert (=> b!171698 (= e!113318 e!113317)))

(declare-fun res!81571 () Bool)

(assert (=> b!171698 (=> res!81571 e!113317)))

(assert (=> b!171698 (= res!81571 (= (h!2806 lt!85194) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun b!171699 () Bool)

(assert (=> b!171699 (= e!113317 (contains!1146 (t!6995 lt!85194) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(assert (= (and d!52181 res!81570) b!171698))

(assert (= (and b!171698 (not res!81571)) b!171699))

(declare-fun m!200427 () Bool)

(assert (=> d!52181 m!200427))

(declare-fun m!200429 () Bool)

(assert (=> d!52181 m!200429))

(declare-fun m!200431 () Bool)

(assert (=> b!171699 m!200431))

(assert (=> b!171096 d!52181))

(declare-fun d!52183 () Bool)

(declare-fun e!113320 () Bool)

(assert (=> d!52183 e!113320))

(declare-fun res!81572 () Bool)

(assert (=> d!52183 (=> res!81572 e!113320)))

(declare-fun lt!85469 () Bool)

(assert (=> d!52183 (= res!81572 (not lt!85469))))

(declare-fun lt!85467 () Bool)

(assert (=> d!52183 (= lt!85469 lt!85467)))

(declare-fun lt!85468 () Unit!5252)

(declare-fun e!113319 () Unit!5252)

(assert (=> d!52183 (= lt!85468 e!113319)))

(declare-fun c!30723 () Bool)

(assert (=> d!52183 (= c!30723 lt!85467)))

(assert (=> d!52183 (= lt!85467 (containsKey!188 (toList!1096 lt!85175) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> d!52183 (= (contains!1144 lt!85175 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85469)))

(declare-fun b!171700 () Bool)

(declare-fun lt!85470 () Unit!5252)

(assert (=> b!171700 (= e!113319 lt!85470)))

(assert (=> b!171700 (= lt!85470 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85175) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (=> b!171700 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85175) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171701 () Bool)

(declare-fun Unit!5280 () Unit!5252)

(assert (=> b!171701 (= e!113319 Unit!5280)))

(declare-fun b!171702 () Bool)

(assert (=> b!171702 (= e!113320 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85175) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52183 c!30723) b!171700))

(assert (= (and d!52183 (not c!30723)) b!171701))

(assert (= (and d!52183 (not res!81572)) b!171702))

(declare-fun m!200433 () Bool)

(assert (=> d!52183 m!200433))

(declare-fun m!200435 () Bool)

(assert (=> b!171700 m!200435))

(assert (=> b!171700 m!199411))

(assert (=> b!171700 m!199411))

(declare-fun m!200437 () Bool)

(assert (=> b!171700 m!200437))

(assert (=> b!171702 m!199411))

(assert (=> b!171702 m!199411))

(assert (=> b!171702 m!200437))

(assert (=> d!51791 d!52183))

(declare-fun b!171704 () Bool)

(declare-fun e!113321 () Option!190)

(declare-fun e!113322 () Option!190)

(assert (=> b!171704 (= e!113321 e!113322)))

(declare-fun c!30725 () Bool)

(assert (=> b!171704 (= c!30725 (and ((_ is Cons!2189) lt!85176) (not (= (_1!1628 (h!2806 lt!85176)) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171705 () Bool)

(assert (=> b!171705 (= e!113322 (getValueByKey!184 (t!6995 lt!85176) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun d!52185 () Bool)

(declare-fun c!30724 () Bool)

(assert (=> d!52185 (= c!30724 (and ((_ is Cons!2189) lt!85176) (= (_1!1628 (h!2806 lt!85176)) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!52185 (= (getValueByKey!184 lt!85176 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) e!113321)))

(declare-fun b!171706 () Bool)

(assert (=> b!171706 (= e!113322 None!188)))

(declare-fun b!171703 () Bool)

(assert (=> b!171703 (= e!113321 (Some!189 (_2!1628 (h!2806 lt!85176))))))

(assert (= (and d!52185 c!30724) b!171703))

(assert (= (and d!52185 (not c!30724)) b!171704))

(assert (= (and b!171704 c!30725) b!171705))

(assert (= (and b!171704 (not c!30725)) b!171706))

(declare-fun m!200439 () Bool)

(assert (=> b!171705 m!200439))

(assert (=> d!51791 d!52185))

(declare-fun d!52187 () Bool)

(assert (=> d!52187 (= (getValueByKey!184 lt!85176 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85471 () Unit!5252)

(assert (=> d!52187 (= lt!85471 (choose!924 lt!85176 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun e!113323 () Bool)

(assert (=> d!52187 e!113323))

(declare-fun res!81573 () Bool)

(assert (=> d!52187 (=> (not res!81573) (not e!113323))))

(assert (=> d!52187 (= res!81573 (isStrictlySorted!331 lt!85176))))

(assert (=> d!52187 (= (lemmaContainsTupThenGetReturnValue!97 lt!85176 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85471)))

(declare-fun b!171707 () Bool)

(declare-fun res!81574 () Bool)

(assert (=> b!171707 (=> (not res!81574) (not e!113323))))

(assert (=> b!171707 (= res!81574 (containsKey!188 lt!85176 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171708 () Bool)

(assert (=> b!171708 (= e!113323 (contains!1146 lt!85176 (tuple2!3235 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52187 res!81573) b!171707))

(assert (= (and b!171707 res!81574) b!171708))

(assert (=> d!52187 m!199405))

(declare-fun m!200441 () Bool)

(assert (=> d!52187 m!200441))

(declare-fun m!200443 () Bool)

(assert (=> d!52187 m!200443))

(declare-fun m!200445 () Bool)

(assert (=> b!171707 m!200445))

(declare-fun m!200447 () Bool)

(assert (=> b!171708 m!200447))

(assert (=> d!51791 d!52187))

(declare-fun b!171709 () Bool)

(declare-fun e!113324 () List!2193)

(declare-fun call!17480 () List!2193)

(assert (=> b!171709 (= e!113324 call!17480)))

(declare-fun b!171710 () Bool)

(declare-fun res!81576 () Bool)

(declare-fun e!113328 () Bool)

(assert (=> b!171710 (=> (not res!81576) (not e!113328))))

(declare-fun lt!85472 () List!2193)

(assert (=> b!171710 (= res!81576 (containsKey!188 lt!85472 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171711 () Bool)

(declare-fun e!113327 () List!2193)

(declare-fun e!113325 () List!2193)

(assert (=> b!171711 (= e!113327 e!113325)))

(declare-fun c!30727 () Bool)

(assert (=> b!171711 (= c!30727 (and ((_ is Cons!2189) (toList!1096 call!17413)) (= (_1!1628 (h!2806 (toList!1096 call!17413))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171712 () Bool)

(declare-fun c!30728 () Bool)

(declare-fun e!113326 () List!2193)

(assert (=> b!171712 (= e!113326 (ite c!30727 (t!6995 (toList!1096 call!17413)) (ite c!30728 (Cons!2189 (h!2806 (toList!1096 call!17413)) (t!6995 (toList!1096 call!17413))) Nil!2190)))))

(declare-fun b!171713 () Bool)

(assert (=> b!171713 (= e!113328 (contains!1146 lt!85472 (tuple2!3235 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!171714 () Bool)

(declare-fun call!17479 () List!2193)

(assert (=> b!171714 (= e!113327 call!17479)))

(declare-fun c!30729 () Bool)

(declare-fun bm!17476 () Bool)

(assert (=> bm!17476 (= call!17479 ($colon$colon!97 e!113326 (ite c!30729 (h!2806 (toList!1096 call!17413)) (tuple2!3235 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun c!30726 () Bool)

(assert (=> bm!17476 (= c!30726 c!30729)))

(declare-fun bm!17478 () Bool)

(declare-fun call!17481 () List!2193)

(assert (=> bm!17478 (= call!17480 call!17481)))

(declare-fun b!171715 () Bool)

(assert (=> b!171715 (= e!113325 call!17481)))

(declare-fun b!171716 () Bool)

(assert (=> b!171716 (= e!113324 call!17480)))

(declare-fun b!171717 () Bool)

(assert (=> b!171717 (= c!30728 (and ((_ is Cons!2189) (toList!1096 call!17413)) (bvsgt (_1!1628 (h!2806 (toList!1096 call!17413))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> b!171717 (= e!113325 e!113324)))

(declare-fun b!171718 () Bool)

(assert (=> b!171718 (= e!113326 (insertStrictlySorted!100 (t!6995 (toList!1096 call!17413)) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun bm!17477 () Bool)

(assert (=> bm!17477 (= call!17481 call!17479)))

(declare-fun d!52189 () Bool)

(assert (=> d!52189 e!113328))

(declare-fun res!81575 () Bool)

(assert (=> d!52189 (=> (not res!81575) (not e!113328))))

(assert (=> d!52189 (= res!81575 (isStrictlySorted!331 lt!85472))))

(assert (=> d!52189 (= lt!85472 e!113327)))

(assert (=> d!52189 (= c!30729 (and ((_ is Cons!2189) (toList!1096 call!17413)) (bvslt (_1!1628 (h!2806 (toList!1096 call!17413))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!52189 (isStrictlySorted!331 (toList!1096 call!17413))))

(assert (=> d!52189 (= (insertStrictlySorted!100 (toList!1096 call!17413) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85472)))

(assert (= (and d!52189 c!30729) b!171714))

(assert (= (and d!52189 (not c!30729)) b!171711))

(assert (= (and b!171711 c!30727) b!171715))

(assert (= (and b!171711 (not c!30727)) b!171717))

(assert (= (and b!171717 c!30728) b!171716))

(assert (= (and b!171717 (not c!30728)) b!171709))

(assert (= (or b!171716 b!171709) bm!17478))

(assert (= (or b!171715 bm!17478) bm!17477))

(assert (= (or b!171714 bm!17477) bm!17476))

(assert (= (and bm!17476 c!30726) b!171718))

(assert (= (and bm!17476 (not c!30726)) b!171712))

(assert (= (and d!52189 res!81575) b!171710))

(assert (= (and b!171710 res!81576) b!171713))

(declare-fun m!200449 () Bool)

(assert (=> b!171710 m!200449))

(declare-fun m!200451 () Bool)

(assert (=> d!52189 m!200451))

(declare-fun m!200453 () Bool)

(assert (=> d!52189 m!200453))

(declare-fun m!200455 () Bool)

(assert (=> b!171718 m!200455))

(declare-fun m!200457 () Bool)

(assert (=> b!171713 m!200457))

(declare-fun m!200459 () Bool)

(assert (=> bm!17476 m!200459))

(assert (=> d!51791 d!52189))

(assert (=> b!171331 d!51833))

(declare-fun b!171719 () Bool)

(declare-fun e!113330 () (_ BitVec 32))

(declare-fun call!17482 () (_ BitVec 32))

(assert (=> b!171719 (= e!113330 call!17482)))

(declare-fun b!171720 () Bool)

(declare-fun e!113329 () (_ BitVec 32))

(assert (=> b!171720 (= e!113329 #b00000000000000000000000000000000)))

(declare-fun b!171721 () Bool)

(assert (=> b!171721 (= e!113329 e!113330)))

(declare-fun c!30731 () Bool)

(assert (=> b!171721 (= c!30731 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171722 () Bool)

(assert (=> b!171722 (= e!113330 (bvadd #b00000000000000000000000000000001 call!17482))))

(declare-fun bm!17479 () Bool)

(assert (=> bm!17479 (= call!17482 (arrayCountValidKeys!0 (_keys!5387 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun d!52191 () Bool)

(declare-fun lt!85473 () (_ BitVec 32))

(assert (=> d!52191 (and (bvsge lt!85473 #b00000000000000000000000000000000) (bvsle lt!85473 (bvsub (size!3682 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!52191 (= lt!85473 e!113329)))

(declare-fun c!30730 () Bool)

(assert (=> d!52191 (= c!30730 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!52191 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3682 (_keys!5387 thiss!1248)) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!52191 (= (arrayCountValidKeys!0 (_keys!5387 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))) lt!85473)))

(assert (= (and d!52191 c!30730) b!171720))

(assert (= (and d!52191 (not c!30730)) b!171721))

(assert (= (and b!171721 c!30731) b!171722))

(assert (= (and b!171721 (not c!30731)) b!171719))

(assert (= (or b!171722 b!171719) bm!17479))

(assert (=> b!171721 m!200053))

(assert (=> b!171721 m!200053))

(assert (=> b!171721 m!200055))

(declare-fun m!200461 () Bool)

(assert (=> bm!17479 m!200461))

(assert (=> bm!17449 d!52191))

(declare-fun d!52193 () Bool)

(assert (=> d!52193 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85101) lt!85116)) (v!3914 (getValueByKey!184 (toList!1096 lt!85101) lt!85116)))))

(assert (=> d!51873 d!52193))

(declare-fun b!171724 () Bool)

(declare-fun e!113331 () Option!190)

(declare-fun e!113332 () Option!190)

(assert (=> b!171724 (= e!113331 e!113332)))

(declare-fun c!30733 () Bool)

(assert (=> b!171724 (= c!30733 (and ((_ is Cons!2189) (toList!1096 lt!85101)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85101))) lt!85116))))))

(declare-fun b!171725 () Bool)

(assert (=> b!171725 (= e!113332 (getValueByKey!184 (t!6995 (toList!1096 lt!85101)) lt!85116))))

(declare-fun d!52195 () Bool)

(declare-fun c!30732 () Bool)

(assert (=> d!52195 (= c!30732 (and ((_ is Cons!2189) (toList!1096 lt!85101)) (= (_1!1628 (h!2806 (toList!1096 lt!85101))) lt!85116)))))

(assert (=> d!52195 (= (getValueByKey!184 (toList!1096 lt!85101) lt!85116) e!113331)))

(declare-fun b!171726 () Bool)

(assert (=> b!171726 (= e!113332 None!188)))

(declare-fun b!171723 () Bool)

(assert (=> b!171723 (= e!113331 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85101)))))))

(assert (= (and d!52195 c!30732) b!171723))

(assert (= (and d!52195 (not c!30732)) b!171724))

(assert (= (and b!171724 c!30733) b!171725))

(assert (= (and b!171724 (not c!30733)) b!171726))

(declare-fun m!200463 () Bool)

(assert (=> b!171725 m!200463))

(assert (=> d!51873 d!52195))

(assert (=> b!171254 d!52031))

(declare-fun d!52197 () Bool)

(assert (=> d!52197 (= (isEmpty!434 lt!85221) (isEmpty!435 (toList!1096 lt!85221)))))

(declare-fun bs!7090 () Bool)

(assert (= bs!7090 d!52197))

(declare-fun m!200465 () Bool)

(assert (=> bs!7090 m!200465))

(assert (=> b!171140 d!52197))

(declare-fun d!52199 () Bool)

(assert (=> d!52199 (arrayContainsKey!0 (_keys!5387 thiss!1248) lt!85353 #b00000000000000000000000000000000)))

(declare-fun lt!85474 () Unit!5252)

(assert (=> d!52199 (= lt!85474 (choose!13 (_keys!5387 thiss!1248) lt!85353 #b00000000000000000000000000000000))))

(assert (=> d!52199 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!52199 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5387 thiss!1248) lt!85353 #b00000000000000000000000000000000) lt!85474)))

(declare-fun bs!7091 () Bool)

(assert (= bs!7091 d!52199))

(assert (=> bs!7091 m!199913))

(declare-fun m!200467 () Bool)

(assert (=> bs!7091 m!200467))

(assert (=> b!171334 d!52199))

(declare-fun d!52201 () Bool)

(declare-fun res!81577 () Bool)

(declare-fun e!113333 () Bool)

(assert (=> d!52201 (=> res!81577 e!113333)))

(assert (=> d!52201 (= res!81577 (= (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) lt!85353))))

(assert (=> d!52201 (= (arrayContainsKey!0 (_keys!5387 thiss!1248) lt!85353 #b00000000000000000000000000000000) e!113333)))

(declare-fun b!171727 () Bool)

(declare-fun e!113334 () Bool)

(assert (=> b!171727 (= e!113333 e!113334)))

(declare-fun res!81578 () Bool)

(assert (=> b!171727 (=> (not res!81578) (not e!113334))))

(assert (=> b!171727 (= res!81578 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun b!171728 () Bool)

(assert (=> b!171728 (= e!113334 (arrayContainsKey!0 (_keys!5387 thiss!1248) lt!85353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!52201 (not res!81577)) b!171727))

(assert (= (and b!171727 res!81578) b!171728))

(assert (=> d!52201 m!199241))

(declare-fun m!200469 () Bool)

(assert (=> b!171728 m!200469))

(assert (=> b!171334 d!52201))

(declare-fun b!171729 () Bool)

(declare-fun e!113337 () SeekEntryResult!534)

(declare-fun lt!85477 () SeekEntryResult!534)

(assert (=> b!171729 (= e!113337 (seekKeyOrZeroReturnVacant!0 (x!18959 lt!85477) (index!4306 lt!85477) (index!4306 lt!85477) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (_keys!5387 thiss!1248) (mask!8383 thiss!1248)))))

(declare-fun b!171730 () Bool)

(declare-fun e!113335 () SeekEntryResult!534)

(declare-fun e!113336 () SeekEntryResult!534)

(assert (=> b!171730 (= e!113335 e!113336)))

(declare-fun lt!85475 () (_ BitVec 64))

(assert (=> b!171730 (= lt!85475 (select (arr!3389 (_keys!5387 thiss!1248)) (index!4306 lt!85477)))))

(declare-fun c!30735 () Bool)

(assert (=> b!171730 (= c!30735 (= lt!85475 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171731 () Bool)

(assert (=> b!171731 (= e!113337 (MissingZero!534 (index!4306 lt!85477)))))

(declare-fun b!171732 () Bool)

(assert (=> b!171732 (= e!113335 Undefined!534)))

(declare-fun b!171733 () Bool)

(assert (=> b!171733 (= e!113336 (Found!534 (index!4306 lt!85477)))))

(declare-fun d!52203 () Bool)

(declare-fun lt!85476 () SeekEntryResult!534)

(assert (=> d!52203 (and (or ((_ is Undefined!534) lt!85476) (not ((_ is Found!534) lt!85476)) (and (bvsge (index!4305 lt!85476) #b00000000000000000000000000000000) (bvslt (index!4305 lt!85476) (size!3682 (_keys!5387 thiss!1248))))) (or ((_ is Undefined!534) lt!85476) ((_ is Found!534) lt!85476) (not ((_ is MissingZero!534) lt!85476)) (and (bvsge (index!4304 lt!85476) #b00000000000000000000000000000000) (bvslt (index!4304 lt!85476) (size!3682 (_keys!5387 thiss!1248))))) (or ((_ is Undefined!534) lt!85476) ((_ is Found!534) lt!85476) ((_ is MissingZero!534) lt!85476) (not ((_ is MissingVacant!534) lt!85476)) (and (bvsge (index!4307 lt!85476) #b00000000000000000000000000000000) (bvslt (index!4307 lt!85476) (size!3682 (_keys!5387 thiss!1248))))) (or ((_ is Undefined!534) lt!85476) (ite ((_ is Found!534) lt!85476) (= (select (arr!3389 (_keys!5387 thiss!1248)) (index!4305 lt!85476)) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!534) lt!85476) (= (select (arr!3389 (_keys!5387 thiss!1248)) (index!4304 lt!85476)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!534) lt!85476) (= (select (arr!3389 (_keys!5387 thiss!1248)) (index!4307 lt!85476)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52203 (= lt!85476 e!113335)))

(declare-fun c!30734 () Bool)

(assert (=> d!52203 (= c!30734 (and ((_ is Intermediate!534) lt!85477) (undefined!1346 lt!85477)))))

(assert (=> d!52203 (= lt!85477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (mask!8383 thiss!1248)) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (_keys!5387 thiss!1248) (mask!8383 thiss!1248)))))

(assert (=> d!52203 (validMask!0 (mask!8383 thiss!1248))))

(assert (=> d!52203 (= (seekEntryOrOpen!0 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (_keys!5387 thiss!1248) (mask!8383 thiss!1248)) lt!85476)))

(declare-fun b!171734 () Bool)

(declare-fun c!30736 () Bool)

(assert (=> b!171734 (= c!30736 (= lt!85475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171734 (= e!113336 e!113337)))

(assert (= (and d!52203 c!30734) b!171732))

(assert (= (and d!52203 (not c!30734)) b!171730))

(assert (= (and b!171730 c!30735) b!171733))

(assert (= (and b!171730 (not c!30735)) b!171734))

(assert (= (and b!171734 c!30736) b!171731))

(assert (= (and b!171734 (not c!30736)) b!171729))

(assert (=> b!171729 m!199241))

(declare-fun m!200471 () Bool)

(assert (=> b!171729 m!200471))

(declare-fun m!200473 () Bool)

(assert (=> b!171730 m!200473))

(declare-fun m!200475 () Bool)

(assert (=> d!52203 m!200475))

(assert (=> d!52203 m!199241))

(declare-fun m!200477 () Bool)

(assert (=> d!52203 m!200477))

(declare-fun m!200479 () Bool)

(assert (=> d!52203 m!200479))

(declare-fun m!200481 () Bool)

(assert (=> d!52203 m!200481))

(assert (=> d!52203 m!199295))

(declare-fun m!200483 () Bool)

(assert (=> d!52203 m!200483))

(assert (=> d!52203 m!199241))

(assert (=> d!52203 m!200475))

(assert (=> b!171334 d!52203))

(declare-fun d!52205 () Bool)

(assert (=> d!52205 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!85478 () Unit!5252)

(assert (=> d!52205 (= lt!85478 (choose!923 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113338 () Bool)

(assert (=> d!52205 e!113338))

(declare-fun res!81579 () Bool)

(assert (=> d!52205 (=> (not res!81579) (not e!113338))))

(assert (=> d!52205 (= res!81579 (isStrictlySorted!331 (toList!1096 lt!85130)))))

(assert (=> d!52205 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) lt!85478)))

(declare-fun b!171735 () Bool)

(assert (=> b!171735 (= e!113338 (containsKey!188 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52205 res!81579) b!171735))

(assert (=> d!52205 m!199241))

(assert (=> d!52205 m!199499))

(assert (=> d!52205 m!199499))

(assert (=> d!52205 m!199501))

(assert (=> d!52205 m!199241))

(declare-fun m!200485 () Bool)

(assert (=> d!52205 m!200485))

(declare-fun m!200487 () Bool)

(assert (=> d!52205 m!200487))

(assert (=> b!171735 m!199241))

(assert (=> b!171735 m!199495))

(assert (=> b!171144 d!52205))

(declare-fun d!52207 () Bool)

(assert (=> d!52207 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7092 () Bool)

(assert (= bs!7092 d!52207))

(assert (=> bs!7092 m!199499))

(declare-fun m!200489 () Bool)

(assert (=> bs!7092 m!200489))

(assert (=> b!171144 d!52207))

(declare-fun b!171737 () Bool)

(declare-fun e!113339 () Option!190)

(declare-fun e!113340 () Option!190)

(assert (=> b!171737 (= e!113339 e!113340)))

(declare-fun c!30738 () Bool)

(assert (=> b!171737 (= c!30738 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85130))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!171738 () Bool)

(assert (=> b!171738 (= e!113340 (getValueByKey!184 (t!6995 (toList!1096 lt!85130)) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52209 () Bool)

(declare-fun c!30737 () Bool)

(assert (=> d!52209 (= c!30737 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (= (_1!1628 (h!2806 (toList!1096 lt!85130))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52209 (= (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) e!113339)))

(declare-fun b!171739 () Bool)

(assert (=> b!171739 (= e!113340 None!188)))

(declare-fun b!171736 () Bool)

(assert (=> b!171736 (= e!113339 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85130)))))))

(assert (= (and d!52209 c!30737) b!171736))

(assert (= (and d!52209 (not c!30737)) b!171737))

(assert (= (and b!171737 c!30738) b!171738))

(assert (= (and b!171737 (not c!30738)) b!171739))

(assert (=> b!171738 m!199241))

(declare-fun m!200491 () Bool)

(assert (=> b!171738 m!200491))

(assert (=> b!171144 d!52209))

(declare-fun lt!85479 () Bool)

(declare-fun d!52211 () Bool)

(assert (=> d!52211 (= lt!85479 (select (content!147 (t!6995 (toList!1096 lt!85171))) (tuple2!3235 key!828 v!309)))))

(declare-fun e!113342 () Bool)

(assert (=> d!52211 (= lt!85479 e!113342)))

(declare-fun res!81580 () Bool)

(assert (=> d!52211 (=> (not res!81580) (not e!113342))))

(assert (=> d!52211 (= res!81580 ((_ is Cons!2189) (t!6995 (toList!1096 lt!85171))))))

(assert (=> d!52211 (= (contains!1146 (t!6995 (toList!1096 lt!85171)) (tuple2!3235 key!828 v!309)) lt!85479)))

(declare-fun b!171740 () Bool)

(declare-fun e!113341 () Bool)

(assert (=> b!171740 (= e!113342 e!113341)))

(declare-fun res!81581 () Bool)

(assert (=> b!171740 (=> res!81581 e!113341)))

(assert (=> b!171740 (= res!81581 (= (h!2806 (t!6995 (toList!1096 lt!85171))) (tuple2!3235 key!828 v!309)))))

(declare-fun b!171741 () Bool)

(assert (=> b!171741 (= e!113341 (contains!1146 (t!6995 (t!6995 (toList!1096 lt!85171))) (tuple2!3235 key!828 v!309)))))

(assert (= (and d!52211 res!81580) b!171740))

(assert (= (and b!171740 (not res!81581)) b!171741))

(assert (=> d!52211 m!199971))

(declare-fun m!200493 () Bool)

(assert (=> d!52211 m!200493))

(declare-fun m!200495 () Bool)

(assert (=> b!171741 m!200495))

(assert (=> b!171158 d!52211))

(declare-fun d!52213 () Bool)

(assert (=> d!52213 (= (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7093 () Bool)

(assert (= bs!7093 d!52213))

(assert (=> bs!7093 m!199471))

(declare-fun m!200497 () Bool)

(assert (=> bs!7093 m!200497))

(assert (=> b!171107 d!52213))

(declare-fun b!171743 () Bool)

(declare-fun e!113343 () Option!190)

(declare-fun e!113344 () Option!190)

(assert (=> b!171743 (= e!113343 e!113344)))

(declare-fun c!30740 () Bool)

(assert (=> b!171743 (= c!30740 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85105))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!171744 () Bool)

(assert (=> b!171744 (= e!113344 (getValueByKey!184 (t!6995 (toList!1096 lt!85105)) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52215 () Bool)

(declare-fun c!30739 () Bool)

(assert (=> d!52215 (= c!30739 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (= (_1!1628 (h!2806 (toList!1096 lt!85105))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52215 (= (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) e!113343)))

(declare-fun b!171745 () Bool)

(assert (=> b!171745 (= e!113344 None!188)))

(declare-fun b!171742 () Bool)

(assert (=> b!171742 (= e!113343 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85105)))))))

(assert (= (and d!52215 c!30739) b!171742))

(assert (= (and d!52215 (not c!30739)) b!171743))

(assert (= (and b!171743 c!30740) b!171744))

(assert (= (and b!171743 (not c!30740)) b!171745))

(assert (=> b!171744 m!199241))

(declare-fun m!200499 () Bool)

(assert (=> b!171744 m!200499))

(assert (=> b!171107 d!52215))

(declare-fun d!52217 () Bool)

(assert (=> d!52217 (not (contains!1144 (+!244 lt!85236 (tuple2!3235 lt!85237 lt!85241)) lt!85240))))

(declare-fun lt!85482 () Unit!5252)

(declare-fun choose!927 (ListLongMap!2161 (_ BitVec 64) V!4987 (_ BitVec 64)) Unit!5252)

(assert (=> d!52217 (= lt!85482 (choose!927 lt!85236 lt!85237 lt!85241 lt!85240))))

(declare-fun e!113347 () Bool)

(assert (=> d!52217 e!113347))

(declare-fun res!81584 () Bool)

(assert (=> d!52217 (=> (not res!81584) (not e!113347))))

(assert (=> d!52217 (= res!81584 (not (contains!1144 lt!85236 lt!85240)))))

(assert (=> d!52217 (= (addStillNotContains!71 lt!85236 lt!85237 lt!85241 lt!85240) lt!85482)))

(declare-fun b!171749 () Bool)

(assert (=> b!171749 (= e!113347 (not (= lt!85237 lt!85240)))))

(assert (= (and d!52217 res!81584) b!171749))

(assert (=> d!52217 m!199533))

(assert (=> d!52217 m!199533))

(assert (=> d!52217 m!199535))

(declare-fun m!200501 () Bool)

(assert (=> d!52217 m!200501))

(declare-fun m!200503 () Bool)

(assert (=> d!52217 m!200503))

(assert (=> b!171172 d!52217))

(declare-fun d!52219 () Bool)

(declare-fun e!113349 () Bool)

(assert (=> d!52219 e!113349))

(declare-fun res!81585 () Bool)

(assert (=> d!52219 (=> res!81585 e!113349)))

(declare-fun lt!85485 () Bool)

(assert (=> d!52219 (= res!81585 (not lt!85485))))

(declare-fun lt!85483 () Bool)

(assert (=> d!52219 (= lt!85485 lt!85483)))

(declare-fun lt!85484 () Unit!5252)

(declare-fun e!113348 () Unit!5252)

(assert (=> d!52219 (= lt!85484 e!113348)))

(declare-fun c!30741 () Bool)

(assert (=> d!52219 (= c!30741 lt!85483)))

(assert (=> d!52219 (= lt!85483 (containsKey!188 (toList!1096 (+!244 lt!85236 (tuple2!3235 lt!85237 lt!85241))) lt!85240))))

(assert (=> d!52219 (= (contains!1144 (+!244 lt!85236 (tuple2!3235 lt!85237 lt!85241)) lt!85240) lt!85485)))

(declare-fun b!171750 () Bool)

(declare-fun lt!85486 () Unit!5252)

(assert (=> b!171750 (= e!113348 lt!85486)))

(assert (=> b!171750 (= lt!85486 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 (+!244 lt!85236 (tuple2!3235 lt!85237 lt!85241))) lt!85240))))

(assert (=> b!171750 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85236 (tuple2!3235 lt!85237 lt!85241))) lt!85240))))

(declare-fun b!171751 () Bool)

(declare-fun Unit!5281 () Unit!5252)

(assert (=> b!171751 (= e!113348 Unit!5281)))

(declare-fun b!171752 () Bool)

(assert (=> b!171752 (= e!113349 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85236 (tuple2!3235 lt!85237 lt!85241))) lt!85240)))))

(assert (= (and d!52219 c!30741) b!171750))

(assert (= (and d!52219 (not c!30741)) b!171751))

(assert (= (and d!52219 (not res!81585)) b!171752))

(declare-fun m!200505 () Bool)

(assert (=> d!52219 m!200505))

(declare-fun m!200507 () Bool)

(assert (=> b!171750 m!200507))

(declare-fun m!200509 () Bool)

(assert (=> b!171750 m!200509))

(assert (=> b!171750 m!200509))

(declare-fun m!200511 () Bool)

(assert (=> b!171750 m!200511))

(assert (=> b!171752 m!200509))

(assert (=> b!171752 m!200509))

(assert (=> b!171752 m!200511))

(assert (=> b!171172 d!52219))

(declare-fun d!52221 () Bool)

(declare-fun e!113350 () Bool)

(assert (=> d!52221 e!113350))

(declare-fun res!81586 () Bool)

(assert (=> d!52221 (=> (not res!81586) (not e!113350))))

(declare-fun lt!85488 () ListLongMap!2161)

(assert (=> d!52221 (= res!81586 (contains!1144 lt!85488 (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!85489 () List!2193)

(assert (=> d!52221 (= lt!85488 (ListLongMap!2162 lt!85489))))

(declare-fun lt!85490 () Unit!5252)

(declare-fun lt!85487 () Unit!5252)

(assert (=> d!52221 (= lt!85490 lt!85487)))

(assert (=> d!52221 (= (getValueByKey!184 lt!85489 (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!189 (_2!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52221 (= lt!85487 (lemmaContainsTupThenGetReturnValue!97 lt!85489 (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52221 (= lt!85489 (insertStrictlySorted!100 (toList!1096 call!17430) (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52221 (= (+!244 call!17430 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!85488)))

(declare-fun b!171753 () Bool)

(declare-fun res!81587 () Bool)

(assert (=> b!171753 (=> (not res!81587) (not e!113350))))

(assert (=> b!171753 (= res!81587 (= (getValueByKey!184 (toList!1096 lt!85488) (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!189 (_2!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!171754 () Bool)

(assert (=> b!171754 (= e!113350 (contains!1146 (toList!1096 lt!85488) (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52221 res!81586) b!171753))

(assert (= (and b!171753 res!81587) b!171754))

(declare-fun m!200513 () Bool)

(assert (=> d!52221 m!200513))

(declare-fun m!200515 () Bool)

(assert (=> d!52221 m!200515))

(declare-fun m!200517 () Bool)

(assert (=> d!52221 m!200517))

(declare-fun m!200519 () Bool)

(assert (=> d!52221 m!200519))

(declare-fun m!200521 () Bool)

(assert (=> b!171753 m!200521))

(declare-fun m!200523 () Bool)

(assert (=> b!171754 m!200523))

(assert (=> b!171172 d!52221))

(declare-fun d!52223 () Bool)

(declare-fun e!113351 () Bool)

(assert (=> d!52223 e!113351))

(declare-fun res!81588 () Bool)

(assert (=> d!52223 (=> (not res!81588) (not e!113351))))

(declare-fun lt!85492 () ListLongMap!2161)

(assert (=> d!52223 (= res!81588 (contains!1144 lt!85492 (_1!1628 (tuple2!3235 lt!85237 lt!85241))))))

(declare-fun lt!85493 () List!2193)

(assert (=> d!52223 (= lt!85492 (ListLongMap!2162 lt!85493))))

(declare-fun lt!85494 () Unit!5252)

(declare-fun lt!85491 () Unit!5252)

(assert (=> d!52223 (= lt!85494 lt!85491)))

(assert (=> d!52223 (= (getValueByKey!184 lt!85493 (_1!1628 (tuple2!3235 lt!85237 lt!85241))) (Some!189 (_2!1628 (tuple2!3235 lt!85237 lt!85241))))))

(assert (=> d!52223 (= lt!85491 (lemmaContainsTupThenGetReturnValue!97 lt!85493 (_1!1628 (tuple2!3235 lt!85237 lt!85241)) (_2!1628 (tuple2!3235 lt!85237 lt!85241))))))

(assert (=> d!52223 (= lt!85493 (insertStrictlySorted!100 (toList!1096 lt!85236) (_1!1628 (tuple2!3235 lt!85237 lt!85241)) (_2!1628 (tuple2!3235 lt!85237 lt!85241))))))

(assert (=> d!52223 (= (+!244 lt!85236 (tuple2!3235 lt!85237 lt!85241)) lt!85492)))

(declare-fun b!171755 () Bool)

(declare-fun res!81589 () Bool)

(assert (=> b!171755 (=> (not res!81589) (not e!113351))))

(assert (=> b!171755 (= res!81589 (= (getValueByKey!184 (toList!1096 lt!85492) (_1!1628 (tuple2!3235 lt!85237 lt!85241))) (Some!189 (_2!1628 (tuple2!3235 lt!85237 lt!85241)))))))

(declare-fun b!171756 () Bool)

(assert (=> b!171756 (= e!113351 (contains!1146 (toList!1096 lt!85492) (tuple2!3235 lt!85237 lt!85241)))))

(assert (= (and d!52223 res!81588) b!171755))

(assert (= (and b!171755 res!81589) b!171756))

(declare-fun m!200525 () Bool)

(assert (=> d!52223 m!200525))

(declare-fun m!200527 () Bool)

(assert (=> d!52223 m!200527))

(declare-fun m!200529 () Bool)

(assert (=> d!52223 m!200529))

(declare-fun m!200531 () Bool)

(assert (=> d!52223 m!200531))

(declare-fun m!200533 () Bool)

(assert (=> b!171755 m!200533))

(declare-fun m!200535 () Bool)

(assert (=> b!171756 m!200535))

(assert (=> b!171172 d!52223))

(assert (=> b!171172 d!51851))

(declare-fun b!171758 () Bool)

(declare-fun e!113352 () Option!190)

(declare-fun e!113353 () Option!190)

(assert (=> b!171758 (= e!113352 e!113353)))

(declare-fun c!30743 () Bool)

(assert (=> b!171758 (= c!30743 (and ((_ is Cons!2189) (toList!1096 lt!85320)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85320))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171759 () Bool)

(assert (=> b!171759 (= e!113353 (getValueByKey!184 (t!6995 (toList!1096 lt!85320)) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun d!52225 () Bool)

(declare-fun c!30742 () Bool)

(assert (=> d!52225 (= c!30742 (and ((_ is Cons!2189) (toList!1096 lt!85320)) (= (_1!1628 (h!2806 (toList!1096 lt!85320))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!52225 (= (getValueByKey!184 (toList!1096 lt!85320) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) e!113352)))

(declare-fun b!171760 () Bool)

(assert (=> b!171760 (= e!113353 None!188)))

(declare-fun b!171757 () Bool)

(assert (=> b!171757 (= e!113352 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85320)))))))

(assert (= (and d!52225 c!30742) b!171757))

(assert (= (and d!52225 (not c!30742)) b!171758))

(assert (= (and b!171758 c!30743) b!171759))

(assert (= (and b!171758 (not c!30743)) b!171760))

(declare-fun m!200537 () Bool)

(assert (=> b!171759 m!200537))

(assert (=> b!171303 d!52225))

(declare-fun b!171762 () Bool)

(declare-fun e!113354 () Option!190)

(declare-fun e!113355 () Option!190)

(assert (=> b!171762 (= e!113354 e!113355)))

(declare-fun c!30745 () Bool)

(assert (=> b!171762 (= c!30745 (and ((_ is Cons!2189) (toList!1096 lt!85344)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85344))) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))))

(declare-fun b!171763 () Bool)

(assert (=> b!171763 (= e!113355 (getValueByKey!184 (t!6995 (toList!1096 lt!85344)) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))))))

(declare-fun c!30744 () Bool)

(declare-fun d!52227 () Bool)

(assert (=> d!52227 (= c!30744 (and ((_ is Cons!2189) (toList!1096 lt!85344)) (= (_1!1628 (h!2806 (toList!1096 lt!85344))) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))))))))

(assert (=> d!52227 (= (getValueByKey!184 (toList!1096 lt!85344) (_1!1628 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248)))) e!113354)))

(declare-fun b!171764 () Bool)

(assert (=> b!171764 (= e!113355 None!188)))

(declare-fun b!171761 () Bool)

(assert (=> b!171761 (= e!113354 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85344)))))))

(assert (= (and d!52227 c!30744) b!171761))

(assert (= (and d!52227 (not c!30744)) b!171762))

(assert (= (and b!171762 c!30745) b!171763))

(assert (= (and b!171762 (not c!30745)) b!171764))

(declare-fun m!200539 () Bool)

(assert (=> b!171763 m!200539))

(assert (=> b!171317 d!52227))

(declare-fun call!17483 () Bool)

(declare-fun bm!17480 () Bool)

(declare-fun c!30746 () Bool)

(assert (=> bm!17480 (= call!17483 (arrayNoDuplicates!0 (_keys!5387 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!30746 (Cons!2191 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30598 (Cons!2191 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) Nil!2192) Nil!2192)) (ite c!30598 (Cons!2191 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) Nil!2192) Nil!2192))))))

(declare-fun b!171765 () Bool)

(declare-fun e!113359 () Bool)

(assert (=> b!171765 (= e!113359 call!17483)))

(declare-fun b!171766 () Bool)

(declare-fun e!113358 () Bool)

(assert (=> b!171766 (= e!113358 e!113359)))

(assert (=> b!171766 (= c!30746 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171767 () Bool)

(assert (=> b!171767 (= e!113359 call!17483)))

(declare-fun b!171768 () Bool)

(declare-fun e!113356 () Bool)

(assert (=> b!171768 (= e!113356 (contains!1147 (ite c!30598 (Cons!2191 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) Nil!2192) Nil!2192) (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171769 () Bool)

(declare-fun e!113357 () Bool)

(assert (=> b!171769 (= e!113357 e!113358)))

(declare-fun res!81590 () Bool)

(assert (=> b!171769 (=> (not res!81590) (not e!113358))))

(assert (=> b!171769 (= res!81590 (not e!113356))))

(declare-fun res!81592 () Bool)

(assert (=> b!171769 (=> (not res!81592) (not e!113356))))

(assert (=> b!171769 (= res!81592 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!52229 () Bool)

(declare-fun res!81591 () Bool)

(assert (=> d!52229 (=> res!81591 e!113357)))

(assert (=> d!52229 (= res!81591 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!52229 (= (arrayNoDuplicates!0 (_keys!5387 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30598 (Cons!2191 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) Nil!2192) Nil!2192)) e!113357)))

(assert (= (and d!52229 (not res!81591)) b!171769))

(assert (= (and b!171769 res!81592) b!171768))

(assert (= (and b!171769 res!81590) b!171766))

(assert (= (and b!171766 c!30746) b!171765))

(assert (= (and b!171766 (not c!30746)) b!171767))

(assert (= (or b!171765 b!171767) bm!17480))

(assert (=> bm!17480 m!200053))

(declare-fun m!200541 () Bool)

(assert (=> bm!17480 m!200541))

(assert (=> b!171766 m!200053))

(assert (=> b!171766 m!200053))

(assert (=> b!171766 m!200055))

(assert (=> b!171768 m!200053))

(assert (=> b!171768 m!200053))

(declare-fun m!200543 () Bool)

(assert (=> b!171768 m!200543))

(assert (=> b!171769 m!200053))

(assert (=> b!171769 m!200053))

(assert (=> b!171769 m!200055))

(assert (=> bm!17447 d!52229))

(assert (=> b!171185 d!52031))

(declare-fun b!171770 () Bool)

(declare-fun e!113360 () List!2193)

(declare-fun call!17485 () List!2193)

(assert (=> b!171770 (= e!113360 call!17485)))

(declare-fun b!171771 () Bool)

(declare-fun res!81594 () Bool)

(declare-fun e!113364 () Bool)

(assert (=> b!171771 (=> (not res!81594) (not e!113364))))

(declare-fun lt!85495 () List!2193)

(assert (=> b!171771 (= res!81594 (containsKey!188 lt!85495 (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun b!171772 () Bool)

(declare-fun e!113363 () List!2193)

(declare-fun e!113361 () List!2193)

(assert (=> b!171772 (= e!113363 e!113361)))

(declare-fun c!30748 () Bool)

(assert (=> b!171772 (= c!30748 (and ((_ is Cons!2189) (t!6995 (toList!1096 (map!1853 thiss!1248)))) (= (_1!1628 (h!2806 (t!6995 (toList!1096 (map!1853 thiss!1248))))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun c!30749 () Bool)

(declare-fun b!171773 () Bool)

(declare-fun e!113362 () List!2193)

(assert (=> b!171773 (= e!113362 (ite c!30748 (t!6995 (t!6995 (toList!1096 (map!1853 thiss!1248)))) (ite c!30749 (Cons!2189 (h!2806 (t!6995 (toList!1096 (map!1853 thiss!1248)))) (t!6995 (t!6995 (toList!1096 (map!1853 thiss!1248))))) Nil!2190)))))

(declare-fun b!171774 () Bool)

(assert (=> b!171774 (= e!113364 (contains!1146 lt!85495 (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun b!171775 () Bool)

(declare-fun call!17484 () List!2193)

(assert (=> b!171775 (= e!113363 call!17484)))

(declare-fun c!30750 () Bool)

(declare-fun bm!17481 () Bool)

(assert (=> bm!17481 (= call!17484 ($colon$colon!97 e!113362 (ite c!30750 (h!2806 (t!6995 (toList!1096 (map!1853 thiss!1248)))) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))))))))

(declare-fun c!30747 () Bool)

(assert (=> bm!17481 (= c!30747 c!30750)))

(declare-fun bm!17483 () Bool)

(declare-fun call!17486 () List!2193)

(assert (=> bm!17483 (= call!17485 call!17486)))

(declare-fun b!171776 () Bool)

(assert (=> b!171776 (= e!113361 call!17486)))

(declare-fun b!171777 () Bool)

(assert (=> b!171777 (= e!113360 call!17485)))

(declare-fun b!171778 () Bool)

(assert (=> b!171778 (= c!30749 (and ((_ is Cons!2189) (t!6995 (toList!1096 (map!1853 thiss!1248)))) (bvsgt (_1!1628 (h!2806 (t!6995 (toList!1096 (map!1853 thiss!1248))))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> b!171778 (= e!113361 e!113360)))

(declare-fun b!171779 () Bool)

(assert (=> b!171779 (= e!113362 (insertStrictlySorted!100 (t!6995 (t!6995 (toList!1096 (map!1853 thiss!1248)))) (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun bm!17482 () Bool)

(assert (=> bm!17482 (= call!17486 call!17484)))

(declare-fun d!52231 () Bool)

(assert (=> d!52231 e!113364))

(declare-fun res!81593 () Bool)

(assert (=> d!52231 (=> (not res!81593) (not e!113364))))

(assert (=> d!52231 (= res!81593 (isStrictlySorted!331 lt!85495))))

(assert (=> d!52231 (= lt!85495 e!113363)))

(assert (=> d!52231 (= c!30750 (and ((_ is Cons!2189) (t!6995 (toList!1096 (map!1853 thiss!1248)))) (bvslt (_1!1628 (h!2806 (t!6995 (toList!1096 (map!1853 thiss!1248))))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!52231 (isStrictlySorted!331 (t!6995 (toList!1096 (map!1853 thiss!1248))))))

(assert (=> d!52231 (= (insertStrictlySorted!100 (t!6995 (toList!1096 (map!1853 thiss!1248))) (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))) lt!85495)))

(assert (= (and d!52231 c!30750) b!171775))

(assert (= (and d!52231 (not c!30750)) b!171772))

(assert (= (and b!171772 c!30748) b!171776))

(assert (= (and b!171772 (not c!30748)) b!171778))

(assert (= (and b!171778 c!30749) b!171777))

(assert (= (and b!171778 (not c!30749)) b!171770))

(assert (= (or b!171777 b!171770) bm!17483))

(assert (= (or b!171776 bm!17483) bm!17482))

(assert (= (or b!171775 bm!17482) bm!17481))

(assert (= (and bm!17481 c!30747) b!171779))

(assert (= (and bm!17481 (not c!30747)) b!171773))

(assert (= (and d!52231 res!81593) b!171771))

(assert (= (and b!171771 res!81594) b!171774))

(declare-fun m!200545 () Bool)

(assert (=> b!171771 m!200545))

(declare-fun m!200547 () Bool)

(assert (=> d!52231 m!200547))

(declare-fun m!200549 () Bool)

(assert (=> d!52231 m!200549))

(declare-fun m!200551 () Bool)

(assert (=> b!171779 m!200551))

(declare-fun m!200553 () Bool)

(assert (=> b!171774 m!200553))

(declare-fun m!200555 () Bool)

(assert (=> bm!17481 m!200555))

(assert (=> b!171101 d!52231))

(declare-fun b!171781 () Bool)

(declare-fun e!113365 () Option!190)

(declare-fun e!113366 () Option!190)

(assert (=> b!171781 (= e!113365 e!113366)))

(declare-fun c!30752 () Bool)

(assert (=> b!171781 (= c!30752 (and ((_ is Cons!2189) (toList!1096 lt!85175)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85175))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171782 () Bool)

(assert (=> b!171782 (= e!113366 (getValueByKey!184 (t!6995 (toList!1096 lt!85175)) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun d!52233 () Bool)

(declare-fun c!30751 () Bool)

(assert (=> d!52233 (= c!30751 (and ((_ is Cons!2189) (toList!1096 lt!85175)) (= (_1!1628 (h!2806 (toList!1096 lt!85175))) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!52233 (= (getValueByKey!184 (toList!1096 lt!85175) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) e!113365)))

(declare-fun b!171783 () Bool)

(assert (=> b!171783 (= e!113366 None!188)))

(declare-fun b!171780 () Bool)

(assert (=> b!171780 (= e!113365 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85175)))))))

(assert (= (and d!52233 c!30751) b!171780))

(assert (= (and d!52233 (not c!30751)) b!171781))

(assert (= (and b!171781 c!30752) b!171782))

(assert (= (and b!171781 (not c!30752)) b!171783))

(declare-fun m!200557 () Bool)

(assert (=> b!171782 m!200557))

(assert (=> b!171039 d!52233))

(declare-fun d!52235 () Bool)

(assert (=> d!52235 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3914 (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51943 d!52235))

(assert (=> d!51943 d!51953))

(declare-fun d!52237 () Bool)

(assert (=> d!52237 (= (get!1941 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171239 d!52237))

(declare-fun d!52239 () Bool)

(declare-fun e!113368 () Bool)

(assert (=> d!52239 e!113368))

(declare-fun res!81595 () Bool)

(assert (=> d!52239 (=> res!81595 e!113368)))

(declare-fun lt!85498 () Bool)

(assert (=> d!52239 (= res!81595 (not lt!85498))))

(declare-fun lt!85496 () Bool)

(assert (=> d!52239 (= lt!85498 lt!85496)))

(declare-fun lt!85497 () Unit!5252)

(declare-fun e!113367 () Unit!5252)

(assert (=> d!52239 (= lt!85497 e!113367)))

(declare-fun c!30753 () Bool)

(assert (=> d!52239 (= c!30753 lt!85496)))

(assert (=> d!52239 (= lt!85496 (containsKey!188 (toList!1096 lt!85140) lt!85137))))

(assert (=> d!52239 (= (contains!1144 lt!85140 lt!85137) lt!85498)))

(declare-fun b!171784 () Bool)

(declare-fun lt!85499 () Unit!5252)

(assert (=> b!171784 (= e!113367 lt!85499)))

(assert (=> b!171784 (= lt!85499 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85140) lt!85137))))

(assert (=> b!171784 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85140) lt!85137))))

(declare-fun b!171785 () Bool)

(declare-fun Unit!5282 () Unit!5252)

(assert (=> b!171785 (= e!113367 Unit!5282)))

(declare-fun b!171786 () Bool)

(assert (=> b!171786 (= e!113368 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85140) lt!85137)))))

(assert (= (and d!52239 c!30753) b!171784))

(assert (= (and d!52239 (not c!30753)) b!171785))

(assert (= (and d!52239 (not res!81595)) b!171786))

(declare-fun m!200559 () Bool)

(assert (=> d!52239 m!200559))

(declare-fun m!200561 () Bool)

(assert (=> b!171784 m!200561))

(assert (=> b!171784 m!199879))

(assert (=> b!171784 m!199879))

(declare-fun m!200563 () Bool)

(assert (=> b!171784 m!200563))

(assert (=> b!171786 m!199879))

(assert (=> b!171786 m!199879))

(assert (=> b!171786 m!200563))

(assert (=> d!51915 d!52239))

(assert (=> d!51915 d!51917))

(assert (=> d!51915 d!51919))

(declare-fun d!52241 () Bool)

(assert (=> d!52241 (= (apply!129 (+!244 lt!85140 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) lt!85137) (apply!129 lt!85140 lt!85137))))

(assert (=> d!52241 true))

(declare-fun _$34!1049 () Unit!5252)

(assert (=> d!52241 (= (choose!926 lt!85140 lt!85131 (minValue!3398 thiss!1248) lt!85137) _$34!1049)))

(declare-fun bs!7094 () Bool)

(assert (= bs!7094 d!52241))

(assert (=> bs!7094 m!199339))

(assert (=> bs!7094 m!199339))

(assert (=> bs!7094 m!199347))

(assert (=> bs!7094 m!199341))

(assert (=> d!51915 d!52241))

(assert (=> d!51915 d!51929))

(declare-fun d!52243 () Bool)

(declare-fun e!113370 () Bool)

(assert (=> d!52243 e!113370))

(declare-fun res!81596 () Bool)

(assert (=> d!52243 (=> res!81596 e!113370)))

(declare-fun lt!85502 () Bool)

(assert (=> d!52243 (= res!81596 (not lt!85502))))

(declare-fun lt!85500 () Bool)

(assert (=> d!52243 (= lt!85502 lt!85500)))

(declare-fun lt!85501 () Unit!5252)

(declare-fun e!113369 () Unit!5252)

(assert (=> d!52243 (= lt!85501 e!113369)))

(declare-fun c!30754 () Bool)

(assert (=> d!52243 (= c!30754 lt!85500)))

(assert (=> d!52243 (= lt!85500 (containsKey!188 (toList!1096 lt!85302) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(assert (=> d!52243 (= (contains!1144 lt!85302 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) lt!85502)))

(declare-fun b!171787 () Bool)

(declare-fun lt!85503 () Unit!5252)

(assert (=> b!171787 (= e!113369 lt!85503)))

(assert (=> b!171787 (= lt!85503 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85302) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(assert (=> b!171787 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85302) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun b!171788 () Bool)

(declare-fun Unit!5283 () Unit!5252)

(assert (=> b!171788 (= e!113369 Unit!5283)))

(declare-fun b!171789 () Bool)

(assert (=> b!171789 (= e!113370 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85302) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52243 c!30754) b!171787))

(assert (= (and d!52243 (not c!30754)) b!171788))

(assert (= (and d!52243 (not res!81596)) b!171789))

(declare-fun m!200565 () Bool)

(assert (=> d!52243 m!200565))

(declare-fun m!200567 () Bool)

(assert (=> b!171787 m!200567))

(assert (=> b!171787 m!199729))

(assert (=> b!171787 m!199729))

(declare-fun m!200569 () Bool)

(assert (=> b!171787 m!200569))

(assert (=> b!171789 m!199729))

(assert (=> b!171789 m!199729))

(assert (=> b!171789 m!200569))

(assert (=> d!51877 d!52243))

(declare-fun b!171791 () Bool)

(declare-fun e!113371 () Option!190)

(declare-fun e!113372 () Option!190)

(assert (=> b!171791 (= e!113371 e!113372)))

(declare-fun c!30756 () Bool)

(assert (=> b!171791 (= c!30756 (and ((_ is Cons!2189) lt!85303) (not (= (_1!1628 (h!2806 lt!85303)) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171792 () Bool)

(assert (=> b!171792 (= e!113372 (getValueByKey!184 (t!6995 lt!85303) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun c!30755 () Bool)

(declare-fun d!52245 () Bool)

(assert (=> d!52245 (= c!30755 (and ((_ is Cons!2189) lt!85303) (= (_1!1628 (h!2806 lt!85303)) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(assert (=> d!52245 (= (getValueByKey!184 lt!85303 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) e!113371)))

(declare-fun b!171793 () Bool)

(assert (=> b!171793 (= e!113372 None!188)))

(declare-fun b!171790 () Bool)

(assert (=> b!171790 (= e!113371 (Some!189 (_2!1628 (h!2806 lt!85303))))))

(assert (= (and d!52245 c!30755) b!171790))

(assert (= (and d!52245 (not c!30755)) b!171791))

(assert (= (and b!171791 c!30756) b!171792))

(assert (= (and b!171791 (not c!30756)) b!171793))

(declare-fun m!200571 () Bool)

(assert (=> b!171792 m!200571))

(assert (=> d!51877 d!52245))

(declare-fun d!52247 () Bool)

(assert (=> d!52247 (= (getValueByKey!184 lt!85303 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85504 () Unit!5252)

(assert (=> d!52247 (= lt!85504 (choose!924 lt!85303 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun e!113373 () Bool)

(assert (=> d!52247 e!113373))

(declare-fun res!81597 () Bool)

(assert (=> d!52247 (=> (not res!81597) (not e!113373))))

(assert (=> d!52247 (= res!81597 (isStrictlySorted!331 lt!85303))))

(assert (=> d!52247 (= (lemmaContainsTupThenGetReturnValue!97 lt!85303 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) lt!85504)))

(declare-fun b!171794 () Bool)

(declare-fun res!81598 () Bool)

(assert (=> b!171794 (=> (not res!81598) (not e!113373))))

(assert (=> b!171794 (= res!81598 (containsKey!188 lt!85303 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun b!171795 () Bool)

(assert (=> b!171795 (= e!113373 (contains!1146 lt!85303 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52247 res!81597) b!171794))

(assert (= (and b!171794 res!81598) b!171795))

(assert (=> d!52247 m!199723))

(declare-fun m!200573 () Bool)

(assert (=> d!52247 m!200573))

(declare-fun m!200575 () Bool)

(assert (=> d!52247 m!200575))

(declare-fun m!200577 () Bool)

(assert (=> b!171794 m!200577))

(declare-fun m!200579 () Bool)

(assert (=> b!171795 m!200579))

(assert (=> d!51877 d!52247))

(declare-fun b!171796 () Bool)

(declare-fun e!113374 () List!2193)

(declare-fun call!17488 () List!2193)

(assert (=> b!171796 (= e!113374 call!17488)))

(declare-fun b!171797 () Bool)

(declare-fun res!81600 () Bool)

(declare-fun e!113378 () Bool)

(assert (=> b!171797 (=> (not res!81600) (not e!113378))))

(declare-fun lt!85505 () List!2193)

(assert (=> b!171797 (= res!81600 (containsKey!188 lt!85505 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun b!171798 () Bool)

(declare-fun e!113377 () List!2193)

(declare-fun e!113375 () List!2193)

(assert (=> b!171798 (= e!113377 e!113375)))

(declare-fun c!30758 () Bool)

(assert (=> b!171798 (= c!30758 (and ((_ is Cons!2189) (toList!1096 lt!85111)) (= (_1!1628 (h!2806 (toList!1096 lt!85111))) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(declare-fun c!30759 () Bool)

(declare-fun e!113376 () List!2193)

(declare-fun b!171799 () Bool)

(assert (=> b!171799 (= e!113376 (ite c!30758 (t!6995 (toList!1096 lt!85111)) (ite c!30759 (Cons!2189 (h!2806 (toList!1096 lt!85111)) (t!6995 (toList!1096 lt!85111))) Nil!2190)))))

(declare-fun b!171800 () Bool)

(assert (=> b!171800 (= e!113378 (contains!1146 lt!85505 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(declare-fun b!171801 () Bool)

(declare-fun call!17487 () List!2193)

(assert (=> b!171801 (= e!113377 call!17487)))

(declare-fun c!30760 () Bool)

(declare-fun bm!17484 () Bool)

(assert (=> bm!17484 (= call!17487 ($colon$colon!97 e!113376 (ite c!30760 (h!2806 (toList!1096 lt!85111)) (tuple2!3235 (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))))

(declare-fun c!30757 () Bool)

(assert (=> bm!17484 (= c!30757 c!30760)))

(declare-fun bm!17486 () Bool)

(declare-fun call!17489 () List!2193)

(assert (=> bm!17486 (= call!17488 call!17489)))

(declare-fun b!171802 () Bool)

(assert (=> b!171802 (= e!113375 call!17489)))

(declare-fun b!171803 () Bool)

(assert (=> b!171803 (= e!113374 call!17488)))

(declare-fun b!171804 () Bool)

(assert (=> b!171804 (= c!30759 (and ((_ is Cons!2189) (toList!1096 lt!85111)) (bvsgt (_1!1628 (h!2806 (toList!1096 lt!85111))) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(assert (=> b!171804 (= e!113375 e!113374)))

(declare-fun b!171805 () Bool)

(assert (=> b!171805 (= e!113376 (insertStrictlySorted!100 (t!6995 (toList!1096 lt!85111)) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun bm!17485 () Bool)

(assert (=> bm!17485 (= call!17489 call!17487)))

(declare-fun d!52249 () Bool)

(assert (=> d!52249 e!113378))

(declare-fun res!81599 () Bool)

(assert (=> d!52249 (=> (not res!81599) (not e!113378))))

(assert (=> d!52249 (= res!81599 (isStrictlySorted!331 lt!85505))))

(assert (=> d!52249 (= lt!85505 e!113377)))

(assert (=> d!52249 (= c!30760 (and ((_ is Cons!2189) (toList!1096 lt!85111)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85111))) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(assert (=> d!52249 (isStrictlySorted!331 (toList!1096 lt!85111))))

(assert (=> d!52249 (= (insertStrictlySorted!100 (toList!1096 lt!85111) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) lt!85505)))

(assert (= (and d!52249 c!30760) b!171801))

(assert (= (and d!52249 (not c!30760)) b!171798))

(assert (= (and b!171798 c!30758) b!171802))

(assert (= (and b!171798 (not c!30758)) b!171804))

(assert (= (and b!171804 c!30759) b!171803))

(assert (= (and b!171804 (not c!30759)) b!171796))

(assert (= (or b!171803 b!171796) bm!17486))

(assert (= (or b!171802 bm!17486) bm!17485))

(assert (= (or b!171801 bm!17485) bm!17484))

(assert (= (and bm!17484 c!30757) b!171805))

(assert (= (and bm!17484 (not c!30757)) b!171799))

(assert (= (and d!52249 res!81599) b!171797))

(assert (= (and b!171797 res!81600) b!171800))

(declare-fun m!200581 () Bool)

(assert (=> b!171797 m!200581))

(declare-fun m!200583 () Bool)

(assert (=> d!52249 m!200583))

(declare-fun m!200585 () Bool)

(assert (=> d!52249 m!200585))

(declare-fun m!200587 () Bool)

(assert (=> b!171805 m!200587))

(declare-fun m!200589 () Bool)

(assert (=> b!171800 m!200589))

(declare-fun m!200591 () Bool)

(assert (=> bm!17484 m!200591))

(assert (=> d!51877 d!52249))

(declare-fun d!52251 () Bool)

(assert (=> d!52251 (= (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) lt!85103)) (v!3914 (getValueByKey!184 (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) lt!85103)))))

(assert (=> d!51869 d!52251))

(declare-fun b!171807 () Bool)

(declare-fun e!113379 () Option!190)

(declare-fun e!113380 () Option!190)

(assert (=> b!171807 (= e!113379 e!113380)))

(declare-fun c!30762 () Bool)

(assert (=> b!171807 (= c!30762 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))) (not (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))) lt!85103))))))

(declare-fun b!171808 () Bool)

(assert (=> b!171808 (= e!113380 (getValueByKey!184 (t!6995 (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))) lt!85103))))

(declare-fun d!52253 () Bool)

(declare-fun c!30761 () Bool)

(assert (=> d!52253 (= c!30761 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))) lt!85103)))))

(assert (=> d!52253 (= (getValueByKey!184 (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) lt!85103) e!113379)))

(declare-fun b!171809 () Bool)

(assert (=> b!171809 (= e!113380 None!188)))

(declare-fun b!171806 () Bool)

(assert (=> b!171806 (= e!113379 (Some!189 (_2!1628 (h!2806 (toList!1096 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))))

(assert (= (and d!52253 c!30761) b!171806))

(assert (= (and d!52253 (not c!30761)) b!171807))

(assert (= (and b!171807 c!30762) b!171808))

(assert (= (and b!171807 (not c!30762)) b!171809))

(declare-fun m!200593 () Bool)

(assert (=> b!171808 m!200593))

(assert (=> d!51869 d!52253))

(declare-fun d!52255 () Bool)

(declare-fun res!81601 () Bool)

(declare-fun e!113381 () Bool)

(assert (=> d!52255 (=> res!81601 e!113381)))

(assert (=> d!52255 (= res!81601 (and ((_ is Cons!2189) (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)))) (= (_1!1628 (h!2806 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))))) lt!85102)))))

(assert (=> d!52255 (= (containsKey!188 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))) lt!85102) e!113381)))

(declare-fun b!171810 () Bool)

(declare-fun e!113382 () Bool)

(assert (=> b!171810 (= e!113381 e!113382)))

(declare-fun res!81602 () Bool)

(assert (=> b!171810 (=> (not res!81602) (not e!113382))))

(assert (=> b!171810 (= res!81602 (and (or (not ((_ is Cons!2189) (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))))) (bvsle (_1!1628 (h!2806 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))))) lt!85102)) ((_ is Cons!2189) (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)))) (bvslt (_1!1628 (h!2806 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309))))) lt!85102)))))

(declare-fun b!171811 () Bool)

(assert (=> b!171811 (= e!113382 (containsKey!188 (t!6995 (toList!1096 (+!244 lt!85119 (tuple2!3235 lt!85104 v!309)))) lt!85102))))

(assert (= (and d!52255 (not res!81601)) b!171810))

(assert (= (and b!171810 res!81602) b!171811))

(declare-fun m!200595 () Bool)

(assert (=> b!171811 m!200595))

(assert (=> d!51875 d!52255))

(declare-fun b!171813 () Bool)

(declare-fun e!113383 () Option!190)

(declare-fun e!113384 () Option!190)

(assert (=> b!171813 (= e!113383 e!113384)))

(declare-fun c!30764 () Bool)

(assert (=> b!171813 (= c!30764 (and ((_ is Cons!2189) (toList!1096 lt!85335)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85335))) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171814 () Bool)

(assert (=> b!171814 (= e!113384 (getValueByKey!184 (t!6995 (toList!1096 lt!85335)) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun c!30763 () Bool)

(declare-fun d!52257 () Bool)

(assert (=> d!52257 (= c!30763 (and ((_ is Cons!2189) (toList!1096 lt!85335)) (= (_1!1628 (h!2806 (toList!1096 lt!85335))) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(assert (=> d!52257 (= (getValueByKey!184 (toList!1096 lt!85335) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) e!113383)))

(declare-fun b!171815 () Bool)

(assert (=> b!171815 (= e!113384 None!188)))

(declare-fun b!171812 () Bool)

(assert (=> b!171812 (= e!113383 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85335)))))))

(assert (= (and d!52257 c!30763) b!171812))

(assert (= (and d!52257 (not c!30763)) b!171813))

(assert (= (and b!171813 c!30764) b!171814))

(assert (= (and b!171813 (not c!30764)) b!171815))

(declare-fun m!200597 () Bool)

(assert (=> b!171814 m!200597))

(assert (=> b!171312 d!52257))

(declare-fun d!52259 () Bool)

(assert (=> d!52259 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun lt!85506 () Unit!5252)

(assert (=> d!52259 (= lt!85506 (choose!923 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun e!113385 () Bool)

(assert (=> d!52259 e!113385))

(declare-fun res!81603 () Bool)

(assert (=> d!52259 (=> (not res!81603) (not e!113385))))

(assert (=> d!52259 (= res!81603 (isStrictlySorted!331 (toList!1096 lt!85171)))))

(assert (=> d!52259 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))) lt!85506)))

(declare-fun b!171816 () Bool)

(assert (=> b!171816 (= e!113385 (containsKey!188 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))))))

(assert (= (and d!52259 res!81603) b!171816))

(assert (=> d!52259 m!199397))

(assert (=> d!52259 m!199397))

(assert (=> d!52259 m!199435))

(declare-fun m!200599 () Bool)

(assert (=> d!52259 m!200599))

(declare-fun m!200601 () Bool)

(assert (=> d!52259 m!200601))

(assert (=> b!171816 m!199431))

(assert (=> b!171059 d!52259))

(assert (=> b!171059 d!51959))

(assert (=> b!171059 d!51829))

(assert (=> b!171163 d!51833))

(declare-fun d!52261 () Bool)

(declare-fun e!113386 () Bool)

(assert (=> d!52261 e!113386))

(declare-fun res!81604 () Bool)

(assert (=> d!52261 (=> (not res!81604) (not e!113386))))

(declare-fun lt!85508 () ListLongMap!2161)

(assert (=> d!52261 (= res!81604 (contains!1144 lt!85508 (_1!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))))))

(declare-fun lt!85509 () List!2193)

(assert (=> d!52261 (= lt!85508 (ListLongMap!2162 lt!85509))))

(declare-fun lt!85510 () Unit!5252)

(declare-fun lt!85507 () Unit!5252)

(assert (=> d!52261 (= lt!85510 lt!85507)))

(assert (=> d!52261 (= (getValueByKey!184 lt!85509 (_1!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))) (Some!189 (_2!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))))))

(assert (=> d!52261 (= lt!85507 (lemmaContainsTupThenGetReturnValue!97 lt!85509 (_1!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))) (_2!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))))))

(assert (=> d!52261 (= lt!85509 (insertStrictlySorted!100 (toList!1096 (ite c!30592 call!17443 (ite c!30590 call!17447 call!17446))) (_1!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))) (_2!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))))))

(assert (=> d!52261 (= (+!244 (ite c!30592 call!17443 (ite c!30590 call!17447 call!17446)) (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))) lt!85508)))

(declare-fun b!171817 () Bool)

(declare-fun res!81605 () Bool)

(assert (=> b!171817 (=> (not res!81605) (not e!113386))))

(assert (=> b!171817 (= res!81605 (= (getValueByKey!184 (toList!1096 lt!85508) (_1!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))) (Some!189 (_2!1628 (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))))))))

(declare-fun b!171818 () Bool)

(assert (=> b!171818 (= e!113386 (contains!1146 (toList!1096 lt!85508) (ite (or c!30592 c!30590) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 lt!85045)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))))))

(assert (= (and d!52261 res!81604) b!171817))

(assert (= (and b!171817 res!81605) b!171818))

(declare-fun m!200603 () Bool)

(assert (=> d!52261 m!200603))

(declare-fun m!200605 () Bool)

(assert (=> d!52261 m!200605))

(declare-fun m!200607 () Bool)

(assert (=> d!52261 m!200607))

(declare-fun m!200609 () Bool)

(assert (=> d!52261 m!200609))

(declare-fun m!200611 () Bool)

(assert (=> b!171817 m!200611))

(declare-fun m!200613 () Bool)

(assert (=> b!171818 m!200613))

(assert (=> bm!17445 d!52261))

(assert (=> d!51903 d!51907))

(assert (=> d!51903 d!51931))

(declare-fun d!52263 () Bool)

(assert (=> d!52263 (contains!1144 (+!244 lt!85144 (tuple2!3235 lt!85129 (zeroValue!3398 thiss!1248))) lt!85127)))

(assert (=> d!52263 true))

(declare-fun _$35!409 () Unit!5252)

(assert (=> d!52263 (= (choose!925 lt!85144 lt!85129 (zeroValue!3398 thiss!1248) lt!85127) _$35!409)))

(declare-fun bs!7095 () Bool)

(assert (= bs!7095 d!52263))

(assert (=> bs!7095 m!199333))

(assert (=> bs!7095 m!199333))

(assert (=> bs!7095 m!199335))

(assert (=> d!51903 d!52263))

(declare-fun d!52265 () Bool)

(declare-fun e!113388 () Bool)

(assert (=> d!52265 e!113388))

(declare-fun res!81606 () Bool)

(assert (=> d!52265 (=> res!81606 e!113388)))

(declare-fun lt!85513 () Bool)

(assert (=> d!52265 (= res!81606 (not lt!85513))))

(declare-fun lt!85511 () Bool)

(assert (=> d!52265 (= lt!85513 lt!85511)))

(declare-fun lt!85512 () Unit!5252)

(declare-fun e!113387 () Unit!5252)

(assert (=> d!52265 (= lt!85512 e!113387)))

(declare-fun c!30765 () Bool)

(assert (=> d!52265 (= c!30765 lt!85511)))

(assert (=> d!52265 (= lt!85511 (containsKey!188 (toList!1096 lt!85144) lt!85127))))

(assert (=> d!52265 (= (contains!1144 lt!85144 lt!85127) lt!85513)))

(declare-fun b!171819 () Bool)

(declare-fun lt!85514 () Unit!5252)

(assert (=> b!171819 (= e!113387 lt!85514)))

(assert (=> b!171819 (= lt!85514 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85144) lt!85127))))

(assert (=> b!171819 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85144) lt!85127))))

(declare-fun b!171820 () Bool)

(declare-fun Unit!5284 () Unit!5252)

(assert (=> b!171820 (= e!113387 Unit!5284)))

(declare-fun b!171821 () Bool)

(assert (=> b!171821 (= e!113388 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85144) lt!85127)))))

(assert (= (and d!52265 c!30765) b!171819))

(assert (= (and d!52265 (not c!30765)) b!171820))

(assert (= (and d!52265 (not res!81606)) b!171821))

(declare-fun m!200615 () Bool)

(assert (=> d!52265 m!200615))

(declare-fun m!200617 () Bool)

(assert (=> b!171819 m!200617))

(declare-fun m!200619 () Bool)

(assert (=> b!171819 m!200619))

(assert (=> b!171819 m!200619))

(declare-fun m!200621 () Bool)

(assert (=> b!171819 m!200621))

(assert (=> b!171821 m!200619))

(assert (=> b!171821 m!200619))

(assert (=> b!171821 m!200621))

(assert (=> d!51903 d!52265))

(declare-fun d!52267 () Bool)

(declare-fun res!81607 () Bool)

(declare-fun e!113389 () Bool)

(assert (=> d!52267 (=> res!81607 e!113389)))

(assert (=> d!52267 (= res!81607 (and ((_ is Cons!2189) (toList!1096 lt!85130)) (= (_1!1628 (h!2806 (toList!1096 lt!85130))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52267 (= (containsKey!188 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000) e!113389)))

(declare-fun b!171822 () Bool)

(declare-fun e!113390 () Bool)

(assert (=> b!171822 (= e!113389 e!113390)))

(declare-fun res!81608 () Bool)

(assert (=> b!171822 (=> (not res!81608) (not e!113390))))

(assert (=> b!171822 (= res!81608 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85130))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85130))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2189) (toList!1096 lt!85130)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85130))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171823 () Bool)

(assert (=> b!171823 (= e!113390 (containsKey!188 (t!6995 (toList!1096 lt!85130)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52267 (not res!81607)) b!171822))

(assert (= (and b!171822 res!81608) b!171823))

(declare-fun m!200623 () Bool)

(assert (=> b!171823 m!200623))

(assert (=> d!51935 d!52267))

(declare-fun d!52269 () Bool)

(declare-fun e!113392 () Bool)

(assert (=> d!52269 e!113392))

(declare-fun res!81609 () Bool)

(assert (=> d!52269 (=> res!81609 e!113392)))

(declare-fun lt!85517 () Bool)

(assert (=> d!52269 (= res!81609 (not lt!85517))))

(declare-fun lt!85515 () Bool)

(assert (=> d!52269 (= lt!85517 lt!85515)))

(declare-fun lt!85516 () Unit!5252)

(declare-fun e!113391 () Unit!5252)

(assert (=> d!52269 (= lt!85516 e!113391)))

(declare-fun c!30766 () Bool)

(assert (=> d!52269 (= c!30766 lt!85515)))

(assert (=> d!52269 (= lt!85515 (containsKey!188 (toList!1096 lt!85221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52269 (= (contains!1144 lt!85221 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85517)))

(declare-fun b!171824 () Bool)

(declare-fun lt!85518 () Unit!5252)

(assert (=> b!171824 (= e!113391 lt!85518)))

(assert (=> b!171824 (= lt!85518 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171824 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171825 () Bool)

(declare-fun Unit!5285 () Unit!5252)

(assert (=> b!171825 (= e!113391 Unit!5285)))

(declare-fun b!171826 () Bool)

(assert (=> b!171826 (= e!113392 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52269 c!30766) b!171824))

(assert (= (and d!52269 (not c!30766)) b!171825))

(assert (= (and d!52269 (not res!81609)) b!171826))

(declare-fun m!200625 () Bool)

(assert (=> d!52269 m!200625))

(declare-fun m!200627 () Bool)

(assert (=> b!171824 m!200627))

(declare-fun m!200629 () Bool)

(assert (=> b!171824 m!200629))

(assert (=> b!171824 m!200629))

(declare-fun m!200631 () Bool)

(assert (=> b!171824 m!200631))

(assert (=> b!171826 m!200629))

(assert (=> b!171826 m!200629))

(assert (=> b!171826 m!200631))

(assert (=> b!171135 d!52269))

(declare-fun b!171828 () Bool)

(declare-fun e!113393 () Option!190)

(declare-fun e!113394 () Option!190)

(assert (=> b!171828 (= e!113393 e!113394)))

(declare-fun c!30768 () Bool)

(assert (=> b!171828 (= c!30768 (and ((_ is Cons!2189) (toList!1096 lt!85302)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85302))) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171829 () Bool)

(assert (=> b!171829 (= e!113394 (getValueByKey!184 (t!6995 (toList!1096 lt!85302)) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))))))

(declare-fun d!52271 () Bool)

(declare-fun c!30767 () Bool)

(assert (=> d!52271 (= c!30767 (and ((_ is Cons!2189) (toList!1096 lt!85302)) (= (_1!1628 (h!2806 (toList!1096 lt!85302))) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))))))))

(assert (=> d!52271 (= (getValueByKey!184 (toList!1096 lt!85302) (_1!1628 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248)))) e!113393)))

(declare-fun b!171830 () Bool)

(assert (=> b!171830 (= e!113394 None!188)))

(declare-fun b!171827 () Bool)

(assert (=> b!171827 (= e!113393 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85302)))))))

(assert (= (and d!52271 c!30767) b!171827))

(assert (= (and d!52271 (not c!30767)) b!171828))

(assert (= (and b!171828 c!30768) b!171829))

(assert (= (and b!171828 (not c!30768)) b!171830))

(declare-fun m!200633 () Bool)

(assert (=> b!171829 m!200633))

(assert (=> b!171288 d!52271))

(declare-fun d!52273 () Bool)

(declare-fun lt!85519 () Bool)

(assert (=> d!52273 (= lt!85519 (select (content!147 (toList!1096 lt!85255)) (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun e!113396 () Bool)

(assert (=> d!52273 (= lt!85519 e!113396)))

(declare-fun res!81610 () Bool)

(assert (=> d!52273 (=> (not res!81610) (not e!113396))))

(assert (=> d!52273 (= res!81610 ((_ is Cons!2189) (toList!1096 lt!85255)))))

(assert (=> d!52273 (= (contains!1146 (toList!1096 lt!85255) (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) lt!85519)))

(declare-fun b!171831 () Bool)

(declare-fun e!113395 () Bool)

(assert (=> b!171831 (= e!113396 e!113395)))

(declare-fun res!81611 () Bool)

(assert (=> b!171831 (=> res!81611 e!113395)))

(assert (=> b!171831 (= res!81611 (= (h!2806 (toList!1096 lt!85255)) (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(declare-fun b!171832 () Bool)

(assert (=> b!171832 (= e!113395 (contains!1146 (t!6995 (toList!1096 lt!85255)) (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))

(assert (= (and d!52273 res!81610) b!171831))

(assert (= (and b!171831 (not res!81611)) b!171832))

(declare-fun m!200635 () Bool)

(assert (=> d!52273 m!200635))

(declare-fun m!200637 () Bool)

(assert (=> d!52273 m!200637))

(declare-fun m!200639 () Bool)

(assert (=> b!171832 m!200639))

(assert (=> b!171202 d!52273))

(declare-fun d!52275 () Bool)

(assert (=> d!52275 (= (apply!129 lt!85270 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1939 (getValueByKey!184 (toList!1096 lt!85270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7096 () Bool)

(assert (= bs!7096 d!52275))

(declare-fun m!200641 () Bool)

(assert (=> bs!7096 m!200641))

(assert (=> bs!7096 m!200641))

(declare-fun m!200643 () Bool)

(assert (=> bs!7096 m!200643))

(assert (=> b!171275 d!52275))

(declare-fun d!52277 () Bool)

(assert (=> d!52277 (= (isEmpty!433 (getValueByKey!184 (toList!1096 lt!85043) key!828)) (not ((_ is Some!189) (getValueByKey!184 (toList!1096 lt!85043) key!828))))))

(assert (=> d!51795 d!52277))

(declare-fun b!171833 () Bool)

(declare-fun e!113397 () List!2193)

(declare-fun call!17491 () List!2193)

(assert (=> b!171833 (= e!113397 call!17491)))

(declare-fun b!171834 () Bool)

(declare-fun res!81613 () Bool)

(declare-fun e!113401 () Bool)

(assert (=> b!171834 (=> (not res!81613) (not e!113401))))

(declare-fun lt!85520 () List!2193)

(assert (=> b!171834 (= res!81613 (containsKey!188 lt!85520 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!171835 () Bool)

(declare-fun e!113400 () List!2193)

(declare-fun e!113398 () List!2193)

(assert (=> b!171835 (= e!113400 e!113398)))

(declare-fun c!30770 () Bool)

(assert (=> b!171835 (= c!30770 (and ((_ is Cons!2189) (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (= (_1!1628 (h!2806 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun c!30771 () Bool)

(declare-fun e!113399 () List!2193)

(declare-fun b!171836 () Bool)

(assert (=> b!171836 (= e!113399 (ite c!30770 (t!6995 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (ite c!30771 (Cons!2189 (h!2806 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (t!6995 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))) Nil!2190)))))

(declare-fun b!171837 () Bool)

(assert (=> b!171837 (= e!113401 (contains!1146 lt!85520 (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171838 () Bool)

(declare-fun call!17490 () List!2193)

(assert (=> b!171838 (= e!113400 call!17490)))

(declare-fun bm!17487 () Bool)

(declare-fun c!30772 () Bool)

(assert (=> bm!17487 (= call!17490 ($colon$colon!97 e!113399 (ite c!30772 (h!2806 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30769 () Bool)

(assert (=> bm!17487 (= c!30769 c!30772)))

(declare-fun bm!17489 () Bool)

(declare-fun call!17492 () List!2193)

(assert (=> bm!17489 (= call!17491 call!17492)))

(declare-fun b!171839 () Bool)

(assert (=> b!171839 (= e!113398 call!17492)))

(declare-fun b!171840 () Bool)

(assert (=> b!171840 (= e!113397 call!17491)))

(declare-fun b!171841 () Bool)

(assert (=> b!171841 (= c!30771 (and ((_ is Cons!2189) (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (bvsgt (_1!1628 (h!2806 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!171841 (= e!113398 e!113397)))

(declare-fun b!171842 () Bool)

(assert (=> b!171842 (= e!113399 (insertStrictlySorted!100 (t!6995 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17488 () Bool)

(assert (=> bm!17488 (= call!17492 call!17490)))

(declare-fun d!52279 () Bool)

(assert (=> d!52279 e!113401))

(declare-fun res!81612 () Bool)

(assert (=> d!52279 (=> (not res!81612) (not e!113401))))

(assert (=> d!52279 (= res!81612 (isStrictlySorted!331 lt!85520))))

(assert (=> d!52279 (= lt!85520 e!113400)))

(assert (=> d!52279 (= c!30772 (and ((_ is Cons!2189) (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248))))) (bvslt (_1!1628 (h!2806 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52279 (isStrictlySorted!331 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))))))

(assert (=> d!52279 (= (insertStrictlySorted!100 (t!6995 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85520)))

(assert (= (and d!52279 c!30772) b!171838))

(assert (= (and d!52279 (not c!30772)) b!171835))

(assert (= (and b!171835 c!30770) b!171839))

(assert (= (and b!171835 (not c!30770)) b!171841))

(assert (= (and b!171841 c!30771) b!171840))

(assert (= (and b!171841 (not c!30771)) b!171833))

(assert (= (or b!171840 b!171833) bm!17489))

(assert (= (or b!171839 bm!17489) bm!17488))

(assert (= (or b!171838 bm!17488) bm!17487))

(assert (= (and bm!17487 c!30769) b!171842))

(assert (= (and bm!17487 (not c!30769)) b!171836))

(assert (= (and d!52279 res!81612) b!171834))

(assert (= (and b!171834 res!81613) b!171837))

(declare-fun m!200645 () Bool)

(assert (=> b!171834 m!200645))

(declare-fun m!200647 () Bool)

(assert (=> d!52279 m!200647))

(assert (=> d!52279 m!199957))

(declare-fun m!200649 () Bool)

(assert (=> b!171842 m!200649))

(declare-fun m!200651 () Bool)

(assert (=> b!171837 m!200651))

(declare-fun m!200653 () Bool)

(assert (=> bm!17487 m!200653))

(assert (=> b!171221 d!52279))

(assert (=> bm!17427 d!52175))

(declare-fun b!171844 () Bool)

(declare-fun e!113402 () Option!190)

(declare-fun e!113403 () Option!190)

(assert (=> b!171844 (= e!113402 e!113403)))

(declare-fun c!30774 () Bool)

(assert (=> b!171844 (= c!30774 (and ((_ is Cons!2189) (t!6995 (toList!1096 lt!85171))) (not (= (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85171)))) (_1!1628 (tuple2!3235 key!828 v!309))))))))

(declare-fun b!171845 () Bool)

(assert (=> b!171845 (= e!113403 (getValueByKey!184 (t!6995 (t!6995 (toList!1096 lt!85171))) (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun c!30773 () Bool)

(declare-fun d!52281 () Bool)

(assert (=> d!52281 (= c!30773 (and ((_ is Cons!2189) (t!6995 (toList!1096 lt!85171))) (= (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85171)))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!52281 (= (getValueByKey!184 (t!6995 (toList!1096 lt!85171)) (_1!1628 (tuple2!3235 key!828 v!309))) e!113402)))

(declare-fun b!171846 () Bool)

(assert (=> b!171846 (= e!113403 None!188)))

(declare-fun b!171843 () Bool)

(assert (=> b!171843 (= e!113402 (Some!189 (_2!1628 (h!2806 (t!6995 (toList!1096 lt!85171))))))))

(assert (= (and d!52281 c!30773) b!171843))

(assert (= (and d!52281 (not c!30773)) b!171844))

(assert (= (and b!171844 c!30774) b!171845))

(assert (= (and b!171844 (not c!30774)) b!171846))

(declare-fun m!200655 () Bool)

(assert (=> b!171845 m!200655))

(assert (=> b!171175 d!52281))

(declare-fun b!171848 () Bool)

(declare-fun e!113404 () Option!190)

(declare-fun e!113405 () Option!190)

(assert (=> b!171848 (= e!113404 e!113405)))

(declare-fun c!30776 () Bool)

(assert (=> b!171848 (= c!30776 (and ((_ is Cons!2189) (toList!1096 lt!85287)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85287))) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171849 () Bool)

(assert (=> b!171849 (= e!113405 (getValueByKey!184 (t!6995 (toList!1096 lt!85287)) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))))))

(declare-fun d!52283 () Bool)

(declare-fun c!30775 () Bool)

(assert (=> d!52283 (= c!30775 (and ((_ is Cons!2189) (toList!1096 lt!85287)) (= (_1!1628 (h!2806 (toList!1096 lt!85287))) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))))))))

(assert (=> d!52283 (= (getValueByKey!184 (toList!1096 lt!85287) (_1!1628 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248)))) e!113404)))

(declare-fun b!171850 () Bool)

(assert (=> b!171850 (= e!113405 None!188)))

(declare-fun b!171847 () Bool)

(assert (=> b!171847 (= e!113404 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85287)))))))

(assert (= (and d!52283 c!30775) b!171847))

(assert (= (and d!52283 (not c!30775)) b!171848))

(assert (= (and b!171848 c!30776) b!171849))

(assert (= (and b!171848 (not c!30776)) b!171850))

(declare-fun m!200657 () Bool)

(assert (=> b!171849 m!200657))

(assert (=> b!171280 d!52283))

(assert (=> b!171231 d!52173))

(declare-fun b!171851 () Bool)

(declare-fun e!113410 () Bool)

(declare-fun e!113407 () Bool)

(assert (=> b!171851 (= e!113410 e!113407)))

(declare-fun c!30778 () Bool)

(assert (=> b!171851 (= c!30778 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun b!171853 () Bool)

(declare-fun e!113406 () Bool)

(assert (=> b!171853 (= e!113406 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171853 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!171854 () Bool)

(declare-fun res!81617 () Bool)

(declare-fun e!113409 () Bool)

(assert (=> b!171854 (=> (not res!81617) (not e!113409))))

(declare-fun lt!85525 () ListLongMap!2161)

(assert (=> b!171854 (= res!81617 (not (contains!1144 lt!85525 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171855 () Bool)

(declare-fun e!113412 () ListLongMap!2161)

(assert (=> b!171855 (= e!113412 (ListLongMap!2162 Nil!2190))))

(declare-fun b!171856 () Bool)

(declare-fun e!113408 () Bool)

(assert (=> b!171856 (= e!113410 e!113408)))

(assert (=> b!171856 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun res!81616 () Bool)

(assert (=> b!171856 (= res!81616 (contains!1144 lt!85525 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!171856 (=> (not res!81616) (not e!113408))))

(declare-fun b!171857 () Bool)

(assert (=> b!171857 (= e!113409 e!113410)))

(declare-fun c!30780 () Bool)

(assert (=> b!171857 (= c!30780 e!113406)))

(declare-fun res!81615 () Bool)

(assert (=> b!171857 (=> (not res!81615) (not e!113406))))

(assert (=> b!171857 (= res!81615 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(declare-fun bm!17490 () Bool)

(declare-fun call!17493 () ListLongMap!2161)

(assert (=> bm!17490 (= call!17493 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248)))))

(declare-fun d!52285 () Bool)

(assert (=> d!52285 e!113409))

(declare-fun res!81614 () Bool)

(assert (=> d!52285 (=> (not res!81614) (not e!113409))))

(assert (=> d!52285 (= res!81614 (not (contains!1144 lt!85525 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52285 (= lt!85525 e!113412)))

(declare-fun c!30777 () Bool)

(assert (=> d!52285 (= c!30777 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> d!52285 (validMask!0 (mask!8383 thiss!1248))))

(assert (=> d!52285 (= (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248)) lt!85525)))

(declare-fun b!171852 () Bool)

(declare-fun e!113411 () ListLongMap!2161)

(assert (=> b!171852 (= e!113412 e!113411)))

(declare-fun c!30779 () Bool)

(assert (=> b!171852 (= c!30779 (validKeyInArray!0 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171858 () Bool)

(assert (=> b!171858 (= e!113407 (= lt!85525 (getCurrentListMapNoExtraKeys!162 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (bvor (extraKeys!3296 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!3398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3555 thiss!1248))))))

(declare-fun b!171859 () Bool)

(assert (=> b!171859 (= e!113407 (isEmpty!434 lt!85525))))

(declare-fun b!171860 () Bool)

(assert (=> b!171860 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 thiss!1248))))))

(assert (=> b!171860 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3683 (_values!3538 thiss!1248))))))

(assert (=> b!171860 (= e!113408 (= (apply!129 lt!85525 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171861 () Bool)

(assert (=> b!171861 (= e!113411 call!17493)))

(declare-fun b!171862 () Bool)

(declare-fun lt!85524 () Unit!5252)

(declare-fun lt!85521 () Unit!5252)

(assert (=> b!171862 (= lt!85524 lt!85521)))

(declare-fun lt!85522 () ListLongMap!2161)

(declare-fun lt!85526 () (_ BitVec 64))

(declare-fun lt!85523 () (_ BitVec 64))

(declare-fun lt!85527 () V!4987)

(assert (=> b!171862 (not (contains!1144 (+!244 lt!85522 (tuple2!3235 lt!85523 lt!85527)) lt!85526))))

(assert (=> b!171862 (= lt!85521 (addStillNotContains!71 lt!85522 lt!85523 lt!85527 lt!85526))))

(assert (=> b!171862 (= lt!85526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!171862 (= lt!85527 (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171862 (= lt!85523 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!171862 (= lt!85522 call!17493)))

(assert (=> b!171862 (= e!113411 (+!244 call!17493 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52285 c!30777) b!171855))

(assert (= (and d!52285 (not c!30777)) b!171852))

(assert (= (and b!171852 c!30779) b!171862))

(assert (= (and b!171852 (not c!30779)) b!171861))

(assert (= (or b!171862 b!171861) bm!17490))

(assert (= (and d!52285 res!81614) b!171854))

(assert (= (and b!171854 res!81617) b!171857))

(assert (= (and b!171857 res!81615) b!171853))

(assert (= (and b!171857 c!30780) b!171856))

(assert (= (and b!171857 (not c!30780)) b!171851))

(assert (= (and b!171856 res!81616) b!171860))

(assert (= (and b!171851 c!30778) b!171858))

(assert (= (and b!171851 (not c!30778)) b!171859))

(declare-fun b_lambda!6921 () Bool)

(assert (=> (not b_lambda!6921) (not b!171860)))

(assert (=> b!171860 t!6998))

(declare-fun b_and!10673 () Bool)

(assert (= b_and!10671 (and (=> t!6998 result!4561) b_and!10673)))

(declare-fun b_lambda!6923 () Bool)

(assert (=> (not b_lambda!6923) (not b!171862)))

(assert (=> b!171862 t!6998))

(declare-fun b_and!10675 () Bool)

(assert (= b_and!10673 (and (=> t!6998 result!4561) b_and!10675)))

(assert (=> b!171852 m!200053))

(assert (=> b!171852 m!200053))

(assert (=> b!171852 m!200055))

(declare-fun m!200659 () Bool)

(assert (=> b!171858 m!200659))

(assert (=> b!171853 m!200053))

(assert (=> b!171853 m!200053))

(assert (=> b!171853 m!200055))

(assert (=> bm!17490 m!200659))

(declare-fun m!200661 () Bool)

(assert (=> d!52285 m!200661))

(assert (=> d!52285 m!199295))

(assert (=> b!171856 m!200053))

(assert (=> b!171856 m!200053))

(declare-fun m!200663 () Bool)

(assert (=> b!171856 m!200663))

(assert (=> b!171862 m!200397))

(assert (=> b!171862 m!199289))

(assert (=> b!171862 m!200399))

(declare-fun m!200665 () Bool)

(assert (=> b!171862 m!200665))

(assert (=> b!171862 m!200397))

(assert (=> b!171862 m!199289))

(declare-fun m!200667 () Bool)

(assert (=> b!171862 m!200667))

(assert (=> b!171862 m!200053))

(declare-fun m!200669 () Bool)

(assert (=> b!171862 m!200669))

(declare-fun m!200671 () Bool)

(assert (=> b!171862 m!200671))

(assert (=> b!171862 m!200669))

(declare-fun m!200673 () Bool)

(assert (=> b!171859 m!200673))

(assert (=> b!171860 m!200397))

(assert (=> b!171860 m!199289))

(assert (=> b!171860 m!200399))

(assert (=> b!171860 m!200053))

(declare-fun m!200675 () Bool)

(assert (=> b!171860 m!200675))

(assert (=> b!171860 m!200397))

(assert (=> b!171860 m!199289))

(assert (=> b!171860 m!200053))

(declare-fun m!200677 () Bool)

(assert (=> b!171854 m!200677))

(assert (=> b!171139 d!52285))

(assert (=> b!171300 d!52053))

(assert (=> b!171300 d!52055))

(declare-fun d!52287 () Bool)

(declare-fun res!81618 () Bool)

(declare-fun e!113413 () Bool)

(assert (=> d!52287 (=> res!81618 e!113413)))

(assert (=> d!52287 (= res!81618 (or ((_ is Nil!2190) lt!85194) ((_ is Nil!2190) (t!6995 lt!85194))))))

(assert (=> d!52287 (= (isStrictlySorted!331 lt!85194) e!113413)))

(declare-fun b!171863 () Bool)

(declare-fun e!113414 () Bool)

(assert (=> b!171863 (= e!113413 e!113414)))

(declare-fun res!81619 () Bool)

(assert (=> b!171863 (=> (not res!81619) (not e!113414))))

(assert (=> b!171863 (= res!81619 (bvslt (_1!1628 (h!2806 lt!85194)) (_1!1628 (h!2806 (t!6995 lt!85194)))))))

(declare-fun b!171864 () Bool)

(assert (=> b!171864 (= e!113414 (isStrictlySorted!331 (t!6995 lt!85194)))))

(assert (= (and d!52287 (not res!81618)) b!171863))

(assert (= (and b!171863 res!81619) b!171864))

(declare-fun m!200679 () Bool)

(assert (=> b!171864 m!200679))

(assert (=> d!51809 d!52287))

(declare-fun d!52289 () Bool)

(declare-fun res!81620 () Bool)

(declare-fun e!113415 () Bool)

(assert (=> d!52289 (=> res!81620 e!113415)))

(assert (=> d!52289 (= res!81620 (or ((_ is Nil!2190) (toList!1096 (map!1853 thiss!1248))) ((_ is Nil!2190) (t!6995 (toList!1096 (map!1853 thiss!1248))))))))

(assert (=> d!52289 (= (isStrictlySorted!331 (toList!1096 (map!1853 thiss!1248))) e!113415)))

(declare-fun b!171865 () Bool)

(declare-fun e!113416 () Bool)

(assert (=> b!171865 (= e!113415 e!113416)))

(declare-fun res!81621 () Bool)

(assert (=> b!171865 (=> (not res!81621) (not e!113416))))

(assert (=> b!171865 (= res!81621 (bvslt (_1!1628 (h!2806 (toList!1096 (map!1853 thiss!1248)))) (_1!1628 (h!2806 (t!6995 (toList!1096 (map!1853 thiss!1248)))))))))

(declare-fun b!171866 () Bool)

(assert (=> b!171866 (= e!113416 (isStrictlySorted!331 (t!6995 (toList!1096 (map!1853 thiss!1248)))))))

(assert (= (and d!52289 (not res!81620)) b!171865))

(assert (= (and b!171865 res!81621) b!171866))

(assert (=> b!171866 m!200549))

(assert (=> d!51809 d!52289))

(assert (=> b!171337 d!51833))

(assert (=> b!171307 d!52027))

(assert (=> b!171307 d!52029))

(declare-fun d!52291 () Bool)

(declare-fun lt!85528 () Bool)

(assert (=> d!52291 (= lt!85528 (select (content!148 Nil!2192) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun e!113418 () Bool)

(assert (=> d!52291 (= lt!85528 e!113418)))

(declare-fun res!81623 () Bool)

(assert (=> d!52291 (=> (not res!81623) (not e!113418))))

(assert (=> d!52291 (= res!81623 ((_ is Cons!2191) Nil!2192))))

(assert (=> d!52291 (= (contains!1147 Nil!2192 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)) lt!85528)))

(declare-fun b!171867 () Bool)

(declare-fun e!113417 () Bool)

(assert (=> b!171867 (= e!113418 e!113417)))

(declare-fun res!81622 () Bool)

(assert (=> b!171867 (=> res!81622 e!113417)))

(assert (=> b!171867 (= res!81622 (= (h!2808 Nil!2192) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun b!171868 () Bool)

(assert (=> b!171868 (= e!113417 (contains!1147 (t!6999 Nil!2192) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(assert (= (and d!52291 res!81623) b!171867))

(assert (= (and b!171867 (not res!81622)) b!171868))

(assert (=> d!52291 m!200337))

(assert (=> d!52291 m!199545))

(declare-fun m!200681 () Bool)

(assert (=> d!52291 m!200681))

(assert (=> b!171868 m!199545))

(declare-fun m!200683 () Bool)

(assert (=> b!171868 m!200683))

(assert (=> b!171253 d!52291))

(assert (=> d!51859 d!51957))

(declare-fun d!52293 () Bool)

(declare-fun e!113420 () Bool)

(assert (=> d!52293 e!113420))

(declare-fun res!81624 () Bool)

(assert (=> d!52293 (=> res!81624 e!113420)))

(declare-fun lt!85531 () Bool)

(assert (=> d!52293 (= res!81624 (not lt!85531))))

(declare-fun lt!85529 () Bool)

(assert (=> d!52293 (= lt!85531 lt!85529)))

(declare-fun lt!85530 () Unit!5252)

(declare-fun e!113419 () Unit!5252)

(assert (=> d!52293 (= lt!85530 e!113419)))

(declare-fun c!30781 () Bool)

(assert (=> d!52293 (= c!30781 lt!85529)))

(assert (=> d!52293 (= lt!85529 (containsKey!188 (toList!1096 lt!85335) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(assert (=> d!52293 (= (contains!1144 lt!85335 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) lt!85531)))

(declare-fun b!171869 () Bool)

(declare-fun lt!85532 () Unit!5252)

(assert (=> b!171869 (= e!113419 lt!85532)))

(assert (=> b!171869 (= lt!85532 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85335) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(assert (=> b!171869 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85335) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun b!171870 () Bool)

(declare-fun Unit!5286 () Unit!5252)

(assert (=> b!171870 (= e!113419 Unit!5286)))

(declare-fun b!171871 () Bool)

(assert (=> b!171871 (= e!113420 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85335) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52293 c!30781) b!171869))

(assert (= (and d!52293 (not c!30781)) b!171870))

(assert (= (and d!52293 (not res!81624)) b!171871))

(declare-fun m!200685 () Bool)

(assert (=> d!52293 m!200685))

(declare-fun m!200687 () Bool)

(assert (=> b!171869 m!200687))

(assert (=> b!171869 m!199851))

(assert (=> b!171869 m!199851))

(declare-fun m!200689 () Bool)

(assert (=> b!171869 m!200689))

(assert (=> b!171871 m!199851))

(assert (=> b!171871 m!199851))

(assert (=> b!171871 m!200689))

(assert (=> d!51919 d!52293))

(declare-fun b!171873 () Bool)

(declare-fun e!113421 () Option!190)

(declare-fun e!113422 () Option!190)

(assert (=> b!171873 (= e!113421 e!113422)))

(declare-fun c!30783 () Bool)

(assert (=> b!171873 (= c!30783 (and ((_ is Cons!2189) lt!85336) (not (= (_1!1628 (h!2806 lt!85336)) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))))

(declare-fun b!171874 () Bool)

(assert (=> b!171874 (= e!113422 (getValueByKey!184 (t!6995 lt!85336) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun d!52295 () Bool)

(declare-fun c!30782 () Bool)

(assert (=> d!52295 (= c!30782 (and ((_ is Cons!2189) lt!85336) (= (_1!1628 (h!2806 lt!85336)) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(assert (=> d!52295 (= (getValueByKey!184 lt!85336 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) e!113421)))

(declare-fun b!171875 () Bool)

(assert (=> b!171875 (= e!113422 None!188)))

(declare-fun b!171872 () Bool)

(assert (=> b!171872 (= e!113421 (Some!189 (_2!1628 (h!2806 lt!85336))))))

(assert (= (and d!52295 c!30782) b!171872))

(assert (= (and d!52295 (not c!30782)) b!171873))

(assert (= (and b!171873 c!30783) b!171874))

(assert (= (and b!171873 (not c!30783)) b!171875))

(declare-fun m!200691 () Bool)

(assert (=> b!171874 m!200691))

(assert (=> d!51919 d!52295))

(declare-fun d!52297 () Bool)

(assert (=> d!52297 (= (getValueByKey!184 lt!85336 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) (Some!189 (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun lt!85533 () Unit!5252)

(assert (=> d!52297 (= lt!85533 (choose!924 lt!85336 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun e!113423 () Bool)

(assert (=> d!52297 e!113423))

(declare-fun res!81625 () Bool)

(assert (=> d!52297 (=> (not res!81625) (not e!113423))))

(assert (=> d!52297 (= res!81625 (isStrictlySorted!331 lt!85336))))

(assert (=> d!52297 (= (lemmaContainsTupThenGetReturnValue!97 lt!85336 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) lt!85533)))

(declare-fun b!171876 () Bool)

(declare-fun res!81626 () Bool)

(assert (=> b!171876 (=> (not res!81626) (not e!113423))))

(assert (=> b!171876 (= res!81626 (containsKey!188 lt!85336 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun b!171877 () Bool)

(assert (=> b!171877 (= e!113423 (contains!1146 lt!85336 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(assert (= (and d!52297 res!81625) b!171876))

(assert (= (and b!171876 res!81626) b!171877))

(assert (=> d!52297 m!199845))

(declare-fun m!200693 () Bool)

(assert (=> d!52297 m!200693))

(declare-fun m!200695 () Bool)

(assert (=> d!52297 m!200695))

(declare-fun m!200697 () Bool)

(assert (=> b!171876 m!200697))

(declare-fun m!200699 () Bool)

(assert (=> b!171877 m!200699))

(assert (=> d!51919 d!52297))

(declare-fun b!171878 () Bool)

(declare-fun e!113424 () List!2193)

(declare-fun call!17495 () List!2193)

(assert (=> b!171878 (= e!113424 call!17495)))

(declare-fun b!171879 () Bool)

(declare-fun res!81628 () Bool)

(declare-fun e!113428 () Bool)

(assert (=> b!171879 (=> (not res!81628) (not e!113428))))

(declare-fun lt!85534 () List!2193)

(assert (=> b!171879 (= res!81628 (containsKey!188 lt!85534 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun b!171880 () Bool)

(declare-fun e!113427 () List!2193)

(declare-fun e!113425 () List!2193)

(assert (=> b!171880 (= e!113427 e!113425)))

(declare-fun c!30785 () Bool)

(assert (=> b!171880 (= c!30785 (and ((_ is Cons!2189) (toList!1096 lt!85140)) (= (_1!1628 (h!2806 (toList!1096 lt!85140))) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(declare-fun b!171881 () Bool)

(declare-fun c!30786 () Bool)

(declare-fun e!113426 () List!2193)

(assert (=> b!171881 (= e!113426 (ite c!30785 (t!6995 (toList!1096 lt!85140)) (ite c!30786 (Cons!2189 (h!2806 (toList!1096 lt!85140)) (t!6995 (toList!1096 lt!85140))) Nil!2190)))))

(declare-fun b!171882 () Bool)

(assert (=> b!171882 (= e!113428 (contains!1146 lt!85534 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(declare-fun b!171883 () Bool)

(declare-fun call!17494 () List!2193)

(assert (=> b!171883 (= e!113427 call!17494)))

(declare-fun c!30787 () Bool)

(declare-fun bm!17491 () Bool)

(assert (=> bm!17491 (= call!17494 ($colon$colon!97 e!113426 (ite c!30787 (h!2806 (toList!1096 lt!85140)) (tuple2!3235 (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))))

(declare-fun c!30784 () Bool)

(assert (=> bm!17491 (= c!30784 c!30787)))

(declare-fun bm!17493 () Bool)

(declare-fun call!17496 () List!2193)

(assert (=> bm!17493 (= call!17495 call!17496)))

(declare-fun b!171884 () Bool)

(assert (=> b!171884 (= e!113425 call!17496)))

(declare-fun b!171885 () Bool)

(assert (=> b!171885 (= e!113424 call!17495)))

(declare-fun b!171886 () Bool)

(assert (=> b!171886 (= c!30786 (and ((_ is Cons!2189) (toList!1096 lt!85140)) (bvsgt (_1!1628 (h!2806 (toList!1096 lt!85140))) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(assert (=> b!171886 (= e!113425 e!113424)))

(declare-fun b!171887 () Bool)

(assert (=> b!171887 (= e!113426 (insertStrictlySorted!100 (t!6995 (toList!1096 lt!85140)) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))))))

(declare-fun bm!17492 () Bool)

(assert (=> bm!17492 (= call!17496 call!17494)))

(declare-fun d!52299 () Bool)

(assert (=> d!52299 e!113428))

(declare-fun res!81627 () Bool)

(assert (=> d!52299 (=> (not res!81627) (not e!113428))))

(assert (=> d!52299 (= res!81627 (isStrictlySorted!331 lt!85534))))

(assert (=> d!52299 (= lt!85534 e!113427)))

(assert (=> d!52299 (= c!30787 (and ((_ is Cons!2189) (toList!1096 lt!85140)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85140))) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))))))))

(assert (=> d!52299 (isStrictlySorted!331 (toList!1096 lt!85140))))

(assert (=> d!52299 (= (insertStrictlySorted!100 (toList!1096 lt!85140) (_1!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248))) (_2!1628 (tuple2!3235 lt!85131 (minValue!3398 thiss!1248)))) lt!85534)))

(assert (= (and d!52299 c!30787) b!171883))

(assert (= (and d!52299 (not c!30787)) b!171880))

(assert (= (and b!171880 c!30785) b!171884))

(assert (= (and b!171880 (not c!30785)) b!171886))

(assert (= (and b!171886 c!30786) b!171885))

(assert (= (and b!171886 (not c!30786)) b!171878))

(assert (= (or b!171885 b!171878) bm!17493))

(assert (= (or b!171884 bm!17493) bm!17492))

(assert (= (or b!171883 bm!17492) bm!17491))

(assert (= (and bm!17491 c!30784) b!171887))

(assert (= (and bm!17491 (not c!30784)) b!171881))

(assert (= (and d!52299 res!81627) b!171879))

(assert (= (and b!171879 res!81628) b!171882))

(declare-fun m!200701 () Bool)

(assert (=> b!171879 m!200701))

(declare-fun m!200703 () Bool)

(assert (=> d!52299 m!200703))

(declare-fun m!200705 () Bool)

(assert (=> d!52299 m!200705))

(declare-fun m!200707 () Bool)

(assert (=> b!171887 m!200707))

(declare-fun m!200709 () Bool)

(assert (=> b!171882 m!200709))

(declare-fun m!200711 () Bool)

(assert (=> bm!17491 m!200711))

(assert (=> d!51919 d!52299))

(declare-fun d!52301 () Bool)

(declare-fun lt!85535 () Bool)

(assert (=> d!52301 (= lt!85535 (select (content!147 lt!85156) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!113430 () Bool)

(assert (=> d!52301 (= lt!85535 e!113430)))

(declare-fun res!81629 () Bool)

(assert (=> d!52301 (=> (not res!81629) (not e!113430))))

(assert (=> d!52301 (= res!81629 ((_ is Cons!2189) lt!85156))))

(assert (=> d!52301 (= (contains!1146 lt!85156 (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!85535)))

(declare-fun b!171888 () Bool)

(declare-fun e!113429 () Bool)

(assert (=> b!171888 (= e!113430 e!113429)))

(declare-fun res!81630 () Bool)

(assert (=> b!171888 (=> res!81630 e!113429)))

(assert (=> b!171888 (= res!81630 (= (h!2806 lt!85156) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171889 () Bool)

(assert (=> b!171889 (= e!113429 (contains!1146 (t!6995 lt!85156) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52301 res!81629) b!171888))

(assert (= (and b!171888 (not res!81630)) b!171889))

(declare-fun m!200713 () Bool)

(assert (=> d!52301 m!200713))

(declare-fun m!200715 () Bool)

(assert (=> d!52301 m!200715))

(declare-fun m!200717 () Bool)

(assert (=> b!171889 m!200717))

(assert (=> b!171211 d!52301))

(declare-fun d!52303 () Bool)

(declare-fun e!113432 () Bool)

(assert (=> d!52303 e!113432))

(declare-fun res!81631 () Bool)

(assert (=> d!52303 (=> res!81631 e!113432)))

(declare-fun lt!85538 () Bool)

(assert (=> d!52303 (= res!81631 (not lt!85538))))

(declare-fun lt!85536 () Bool)

(assert (=> d!52303 (= lt!85538 lt!85536)))

(declare-fun lt!85537 () Unit!5252)

(declare-fun e!113431 () Unit!5252)

(assert (=> d!52303 (= lt!85537 e!113431)))

(declare-fun c!30788 () Bool)

(assert (=> d!52303 (= c!30788 lt!85536)))

(assert (=> d!52303 (= lt!85536 (containsKey!188 (toList!1096 lt!85270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52303 (= (contains!1144 lt!85270 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85538)))

(declare-fun b!171890 () Bool)

(declare-fun lt!85539 () Unit!5252)

(assert (=> b!171890 (= e!113431 lt!85539)))

(assert (=> b!171890 (= lt!85539 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171890 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171891 () Bool)

(declare-fun Unit!5287 () Unit!5252)

(assert (=> b!171891 (= e!113431 Unit!5287)))

(declare-fun b!171892 () Bool)

(assert (=> b!171892 (= e!113432 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52303 c!30788) b!171890))

(assert (= (and d!52303 (not c!30788)) b!171891))

(assert (= (and d!52303 (not res!81631)) b!171892))

(declare-fun m!200719 () Bool)

(assert (=> d!52303 m!200719))

(declare-fun m!200721 () Bool)

(assert (=> b!171890 m!200721))

(assert (=> b!171890 m!200075))

(assert (=> b!171890 m!200075))

(declare-fun m!200723 () Bool)

(assert (=> b!171890 m!200723))

(assert (=> b!171892 m!200075))

(assert (=> b!171892 m!200075))

(assert (=> b!171892 m!200723))

(assert (=> bm!17446 d!52303))

(assert (=> d!51891 d!51877))

(assert (=> d!51891 d!51869))

(assert (=> d!51891 d!51871))

(declare-fun d!52305 () Bool)

(declare-fun e!113434 () Bool)

(assert (=> d!52305 e!113434))

(declare-fun res!81632 () Bool)

(assert (=> d!52305 (=> res!81632 e!113434)))

(declare-fun lt!85542 () Bool)

(assert (=> d!52305 (= res!81632 (not lt!85542))))

(declare-fun lt!85540 () Bool)

(assert (=> d!52305 (= lt!85542 lt!85540)))

(declare-fun lt!85541 () Unit!5252)

(declare-fun e!113433 () Unit!5252)

(assert (=> d!52305 (= lt!85541 e!113433)))

(declare-fun c!30789 () Bool)

(assert (=> d!52305 (= c!30789 lt!85540)))

(assert (=> d!52305 (= lt!85540 (containsKey!188 (toList!1096 lt!85111) lt!85103))))

(assert (=> d!52305 (= (contains!1144 lt!85111 lt!85103) lt!85542)))

(declare-fun b!171893 () Bool)

(declare-fun lt!85543 () Unit!5252)

(assert (=> b!171893 (= e!113433 lt!85543)))

(assert (=> b!171893 (= lt!85543 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85111) lt!85103))))

(assert (=> b!171893 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85111) lt!85103))))

(declare-fun b!171894 () Bool)

(declare-fun Unit!5288 () Unit!5252)

(assert (=> b!171894 (= e!113433 Unit!5288)))

(declare-fun b!171895 () Bool)

(assert (=> b!171895 (= e!113434 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85111) lt!85103)))))

(assert (= (and d!52305 c!30789) b!171893))

(assert (= (and d!52305 (not c!30789)) b!171894))

(assert (= (and d!52305 (not res!81632)) b!171895))

(declare-fun m!200725 () Bool)

(assert (=> d!52305 m!200725))

(declare-fun m!200727 () Bool)

(assert (=> b!171893 m!200727))

(assert (=> b!171893 m!199705))

(assert (=> b!171893 m!199705))

(declare-fun m!200729 () Bool)

(assert (=> b!171893 m!200729))

(assert (=> b!171895 m!199705))

(assert (=> b!171895 m!199705))

(assert (=> b!171895 m!200729))

(assert (=> d!51891 d!52305))

(declare-fun d!52307 () Bool)

(assert (=> d!52307 (= (apply!129 (+!244 lt!85111 (tuple2!3235 lt!85110 (minValue!3398 thiss!1248))) lt!85103) (apply!129 lt!85111 lt!85103))))

(assert (=> d!52307 true))

(declare-fun _$34!1050 () Unit!5252)

(assert (=> d!52307 (= (choose!926 lt!85111 lt!85110 (minValue!3398 thiss!1248) lt!85103) _$34!1050)))

(declare-fun bs!7097 () Bool)

(assert (= bs!7097 d!52307))

(assert (=> bs!7097 m!199261))

(assert (=> bs!7097 m!199261))

(assert (=> bs!7097 m!199279))

(assert (=> bs!7097 m!199271))

(assert (=> d!51891 d!52307))

(declare-fun d!52309 () Bool)

(assert (=> d!52309 (= (apply!129 lt!85280 lt!85277) (get!1939 (getValueByKey!184 (toList!1096 lt!85280) lt!85277)))))

(declare-fun bs!7098 () Bool)

(assert (= bs!7098 d!52309))

(declare-fun m!200731 () Bool)

(assert (=> bs!7098 m!200731))

(assert (=> bs!7098 m!200731))

(declare-fun m!200733 () Bool)

(assert (=> bs!7098 m!200733))

(assert (=> b!171262 d!52309))

(declare-fun d!52311 () Bool)

(assert (=> d!52311 (contains!1144 (+!244 lt!85284 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045))) lt!85267)))

(declare-fun lt!85544 () Unit!5252)

(assert (=> d!52311 (= lt!85544 (choose!925 lt!85284 lt!85269 (zeroValue!3398 lt!85045) lt!85267))))

(assert (=> d!52311 (contains!1144 lt!85284 lt!85267)))

(assert (=> d!52311 (= (addStillContains!105 lt!85284 lt!85269 (zeroValue!3398 lt!85045) lt!85267) lt!85544)))

(declare-fun bs!7099 () Bool)

(assert (= bs!7099 d!52311))

(assert (=> bs!7099 m!199639))

(assert (=> bs!7099 m!199639))

(assert (=> bs!7099 m!199641))

(declare-fun m!200735 () Bool)

(assert (=> bs!7099 m!200735))

(declare-fun m!200737 () Bool)

(assert (=> bs!7099 m!200737))

(assert (=> b!171262 d!52311))

(declare-fun d!52313 () Bool)

(assert (=> d!52313 (= (apply!129 (+!244 lt!85280 (tuple2!3235 lt!85271 (minValue!3398 lt!85045))) lt!85277) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85280 (tuple2!3235 lt!85271 (minValue!3398 lt!85045)))) lt!85277)))))

(declare-fun bs!7100 () Bool)

(assert (= bs!7100 d!52313))

(declare-fun m!200739 () Bool)

(assert (=> bs!7100 m!200739))

(assert (=> bs!7100 m!200739))

(declare-fun m!200741 () Bool)

(assert (=> bs!7100 m!200741))

(assert (=> b!171262 d!52313))

(declare-fun d!52315 () Bool)

(assert (=> d!52315 (= (apply!129 (+!244 lt!85280 (tuple2!3235 lt!85271 (minValue!3398 lt!85045))) lt!85277) (apply!129 lt!85280 lt!85277))))

(declare-fun lt!85545 () Unit!5252)

(assert (=> d!52315 (= lt!85545 (choose!926 lt!85280 lt!85271 (minValue!3398 lt!85045) lt!85277))))

(declare-fun e!113435 () Bool)

(assert (=> d!52315 e!113435))

(declare-fun res!81633 () Bool)

(assert (=> d!52315 (=> (not res!81633) (not e!113435))))

(assert (=> d!52315 (= res!81633 (contains!1144 lt!85280 lt!85277))))

(assert (=> d!52315 (= (addApplyDifferent!105 lt!85280 lt!85271 (minValue!3398 lt!85045) lt!85277) lt!85545)))

(declare-fun b!171896 () Bool)

(assert (=> b!171896 (= e!113435 (not (= lt!85277 lt!85271)))))

(assert (= (and d!52315 res!81633) b!171896))

(assert (=> d!52315 m!199647))

(declare-fun m!200743 () Bool)

(assert (=> d!52315 m!200743))

(assert (=> d!52315 m!199645))

(assert (=> d!52315 m!199653))

(declare-fun m!200745 () Bool)

(assert (=> d!52315 m!200745))

(assert (=> d!52315 m!199645))

(assert (=> b!171262 d!52315))

(declare-fun d!52317 () Bool)

(declare-fun e!113437 () Bool)

(assert (=> d!52317 e!113437))

(declare-fun res!81634 () Bool)

(assert (=> d!52317 (=> res!81634 e!113437)))

(declare-fun lt!85548 () Bool)

(assert (=> d!52317 (= res!81634 (not lt!85548))))

(declare-fun lt!85546 () Bool)

(assert (=> d!52317 (= lt!85548 lt!85546)))

(declare-fun lt!85547 () Unit!5252)

(declare-fun e!113436 () Unit!5252)

(assert (=> d!52317 (= lt!85547 e!113436)))

(declare-fun c!30790 () Bool)

(assert (=> d!52317 (= c!30790 lt!85546)))

(assert (=> d!52317 (= lt!85546 (containsKey!188 (toList!1096 (+!244 lt!85284 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))) lt!85267))))

(assert (=> d!52317 (= (contains!1144 (+!244 lt!85284 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045))) lt!85267) lt!85548)))

(declare-fun b!171897 () Bool)

(declare-fun lt!85549 () Unit!5252)

(assert (=> b!171897 (= e!113436 lt!85549)))

(assert (=> b!171897 (= lt!85549 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 (+!244 lt!85284 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))) lt!85267))))

(assert (=> b!171897 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85284 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))) lt!85267))))

(declare-fun b!171898 () Bool)

(declare-fun Unit!5289 () Unit!5252)

(assert (=> b!171898 (= e!113436 Unit!5289)))

(declare-fun b!171899 () Bool)

(assert (=> b!171899 (= e!113437 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85284 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))) lt!85267)))))

(assert (= (and d!52317 c!30790) b!171897))

(assert (= (and d!52317 (not c!30790)) b!171898))

(assert (= (and d!52317 (not res!81634)) b!171899))

(declare-fun m!200747 () Bool)

(assert (=> d!52317 m!200747))

(declare-fun m!200749 () Bool)

(assert (=> b!171897 m!200749))

(declare-fun m!200751 () Bool)

(assert (=> b!171897 m!200751))

(assert (=> b!171897 m!200751))

(declare-fun m!200753 () Bool)

(assert (=> b!171897 m!200753))

(assert (=> b!171899 m!200751))

(assert (=> b!171899 m!200751))

(assert (=> b!171899 m!200753))

(assert (=> b!171262 d!52317))

(declare-fun d!52319 () Bool)

(declare-fun e!113438 () Bool)

(assert (=> d!52319 e!113438))

(declare-fun res!81635 () Bool)

(assert (=> d!52319 (=> (not res!81635) (not e!113438))))

(declare-fun lt!85551 () ListLongMap!2161)

(assert (=> d!52319 (= res!81635 (contains!1144 lt!85551 (_1!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))))))

(declare-fun lt!85552 () List!2193)

(assert (=> d!52319 (= lt!85551 (ListLongMap!2162 lt!85552))))

(declare-fun lt!85553 () Unit!5252)

(declare-fun lt!85550 () Unit!5252)

(assert (=> d!52319 (= lt!85553 lt!85550)))

(assert (=> d!52319 (= (getValueByKey!184 lt!85552 (_1!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))))))

(assert (=> d!52319 (= lt!85550 (lemmaContainsTupThenGetReturnValue!97 lt!85552 (_1!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045))) (_2!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))))))

(assert (=> d!52319 (= lt!85552 (insertStrictlySorted!100 (toList!1096 lt!85284) (_1!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045))) (_2!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))))))

(assert (=> d!52319 (= (+!244 lt!85284 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045))) lt!85551)))

(declare-fun b!171900 () Bool)

(declare-fun res!81636 () Bool)

(assert (=> b!171900 (=> (not res!81636) (not e!113438))))

(assert (=> b!171900 (= res!81636 (= (getValueByKey!184 (toList!1096 lt!85551) (_1!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045))))))))

(declare-fun b!171901 () Bool)

(assert (=> b!171901 (= e!113438 (contains!1146 (toList!1096 lt!85551) (tuple2!3235 lt!85269 (zeroValue!3398 lt!85045))))))

(assert (= (and d!52319 res!81635) b!171900))

(assert (= (and b!171900 res!81636) b!171901))

(declare-fun m!200755 () Bool)

(assert (=> d!52319 m!200755))

(declare-fun m!200757 () Bool)

(assert (=> d!52319 m!200757))

(declare-fun m!200759 () Bool)

(assert (=> d!52319 m!200759))

(declare-fun m!200761 () Bool)

(assert (=> d!52319 m!200761))

(declare-fun m!200763 () Bool)

(assert (=> b!171900 m!200763))

(declare-fun m!200765 () Bool)

(assert (=> b!171901 m!200765))

(assert (=> b!171262 d!52319))

(declare-fun d!52321 () Bool)

(assert (=> d!52321 (= (apply!129 lt!85276 lt!85268) (get!1939 (getValueByKey!184 (toList!1096 lt!85276) lt!85268)))))

(declare-fun bs!7101 () Bool)

(assert (= bs!7101 d!52321))

(declare-fun m!200767 () Bool)

(assert (=> bs!7101 m!200767))

(assert (=> bs!7101 m!200767))

(declare-fun m!200769 () Bool)

(assert (=> bs!7101 m!200769))

(assert (=> b!171262 d!52321))

(assert (=> b!171262 d!52123))

(declare-fun d!52323 () Bool)

(assert (=> d!52323 (= (apply!129 lt!85266 lt!85281) (get!1939 (getValueByKey!184 (toList!1096 lt!85266) lt!85281)))))

(declare-fun bs!7102 () Bool)

(assert (= bs!7102 d!52323))

(declare-fun m!200771 () Bool)

(assert (=> bs!7102 m!200771))

(assert (=> bs!7102 m!200771))

(declare-fun m!200773 () Bool)

(assert (=> bs!7102 m!200773))

(assert (=> b!171262 d!52323))

(declare-fun d!52325 () Bool)

(assert (=> d!52325 (= (apply!129 (+!244 lt!85266 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045))) lt!85281) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85266 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045)))) lt!85281)))))

(declare-fun bs!7103 () Bool)

(assert (= bs!7103 d!52325))

(declare-fun m!200775 () Bool)

(assert (=> bs!7103 m!200775))

(assert (=> bs!7103 m!200775))

(declare-fun m!200777 () Bool)

(assert (=> bs!7103 m!200777))

(assert (=> b!171262 d!52325))

(declare-fun d!52327 () Bool)

(assert (=> d!52327 (= (apply!129 (+!244 lt!85276 (tuple2!3235 lt!85275 (minValue!3398 lt!85045))) lt!85268) (get!1939 (getValueByKey!184 (toList!1096 (+!244 lt!85276 (tuple2!3235 lt!85275 (minValue!3398 lt!85045)))) lt!85268)))))

(declare-fun bs!7104 () Bool)

(assert (= bs!7104 d!52327))

(declare-fun m!200779 () Bool)

(assert (=> bs!7104 m!200779))

(assert (=> bs!7104 m!200779))

(declare-fun m!200781 () Bool)

(assert (=> bs!7104 m!200781))

(assert (=> b!171262 d!52327))

(declare-fun d!52329 () Bool)

(declare-fun e!113439 () Bool)

(assert (=> d!52329 e!113439))

(declare-fun res!81637 () Bool)

(assert (=> d!52329 (=> (not res!81637) (not e!113439))))

(declare-fun lt!85555 () ListLongMap!2161)

(assert (=> d!52329 (= res!81637 (contains!1144 lt!85555 (_1!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045)))))))

(declare-fun lt!85556 () List!2193)

(assert (=> d!52329 (= lt!85555 (ListLongMap!2162 lt!85556))))

(declare-fun lt!85557 () Unit!5252)

(declare-fun lt!85554 () Unit!5252)

(assert (=> d!52329 (= lt!85557 lt!85554)))

(assert (=> d!52329 (= (getValueByKey!184 lt!85556 (_1!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045)))))))

(assert (=> d!52329 (= lt!85554 (lemmaContainsTupThenGetReturnValue!97 lt!85556 (_1!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045))) (_2!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045)))))))

(assert (=> d!52329 (= lt!85556 (insertStrictlySorted!100 (toList!1096 lt!85276) (_1!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045))) (_2!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045)))))))

(assert (=> d!52329 (= (+!244 lt!85276 (tuple2!3235 lt!85275 (minValue!3398 lt!85045))) lt!85555)))

(declare-fun b!171902 () Bool)

(declare-fun res!81638 () Bool)

(assert (=> b!171902 (=> (not res!81638) (not e!113439))))

(assert (=> b!171902 (= res!81638 (= (getValueByKey!184 (toList!1096 lt!85555) (_1!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 lt!85275 (minValue!3398 lt!85045))))))))

(declare-fun b!171903 () Bool)

(assert (=> b!171903 (= e!113439 (contains!1146 (toList!1096 lt!85555) (tuple2!3235 lt!85275 (minValue!3398 lt!85045))))))

(assert (= (and d!52329 res!81637) b!171902))

(assert (= (and b!171902 res!81638) b!171903))

(declare-fun m!200783 () Bool)

(assert (=> d!52329 m!200783))

(declare-fun m!200785 () Bool)

(assert (=> d!52329 m!200785))

(declare-fun m!200787 () Bool)

(assert (=> d!52329 m!200787))

(declare-fun m!200789 () Bool)

(assert (=> d!52329 m!200789))

(declare-fun m!200791 () Bool)

(assert (=> b!171902 m!200791))

(declare-fun m!200793 () Bool)

(assert (=> b!171903 m!200793))

(assert (=> b!171262 d!52329))

(declare-fun d!52331 () Bool)

(assert (=> d!52331 (= (apply!129 (+!244 lt!85276 (tuple2!3235 lt!85275 (minValue!3398 lt!85045))) lt!85268) (apply!129 lt!85276 lt!85268))))

(declare-fun lt!85558 () Unit!5252)

(assert (=> d!52331 (= lt!85558 (choose!926 lt!85276 lt!85275 (minValue!3398 lt!85045) lt!85268))))

(declare-fun e!113440 () Bool)

(assert (=> d!52331 e!113440))

(declare-fun res!81639 () Bool)

(assert (=> d!52331 (=> (not res!81639) (not e!113440))))

(assert (=> d!52331 (= res!81639 (contains!1144 lt!85276 lt!85268))))

(assert (=> d!52331 (= (addApplyDifferent!105 lt!85276 lt!85275 (minValue!3398 lt!85045) lt!85268) lt!85558)))

(declare-fun b!171904 () Bool)

(assert (=> b!171904 (= e!113440 (not (= lt!85268 lt!85275)))))

(assert (= (and d!52331 res!81639) b!171904))

(assert (=> d!52331 m!199643))

(declare-fun m!200795 () Bool)

(assert (=> d!52331 m!200795))

(assert (=> d!52331 m!199633))

(assert (=> d!52331 m!199651))

(declare-fun m!200797 () Bool)

(assert (=> d!52331 m!200797))

(assert (=> d!52331 m!199633))

(assert (=> b!171262 d!52331))

(declare-fun d!52333 () Bool)

(declare-fun e!113441 () Bool)

(assert (=> d!52333 e!113441))

(declare-fun res!81640 () Bool)

(assert (=> d!52333 (=> (not res!81640) (not e!113441))))

(declare-fun lt!85560 () ListLongMap!2161)

(assert (=> d!52333 (= res!81640 (contains!1144 lt!85560 (_1!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045)))))))

(declare-fun lt!85561 () List!2193)

(assert (=> d!52333 (= lt!85560 (ListLongMap!2162 lt!85561))))

(declare-fun lt!85562 () Unit!5252)

(declare-fun lt!85559 () Unit!5252)

(assert (=> d!52333 (= lt!85562 lt!85559)))

(assert (=> d!52333 (= (getValueByKey!184 lt!85561 (_1!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045)))))))

(assert (=> d!52333 (= lt!85559 (lemmaContainsTupThenGetReturnValue!97 lt!85561 (_1!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045))) (_2!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045)))))))

(assert (=> d!52333 (= lt!85561 (insertStrictlySorted!100 (toList!1096 lt!85280) (_1!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045))) (_2!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045)))))))

(assert (=> d!52333 (= (+!244 lt!85280 (tuple2!3235 lt!85271 (minValue!3398 lt!85045))) lt!85560)))

(declare-fun b!171905 () Bool)

(declare-fun res!81641 () Bool)

(assert (=> b!171905 (=> (not res!81641) (not e!113441))))

(assert (=> b!171905 (= res!81641 (= (getValueByKey!184 (toList!1096 lt!85560) (_1!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 lt!85271 (minValue!3398 lt!85045))))))))

(declare-fun b!171906 () Bool)

(assert (=> b!171906 (= e!113441 (contains!1146 (toList!1096 lt!85560) (tuple2!3235 lt!85271 (minValue!3398 lt!85045))))))

(assert (= (and d!52333 res!81640) b!171905))

(assert (= (and b!171905 res!81641) b!171906))

(declare-fun m!200799 () Bool)

(assert (=> d!52333 m!200799))

(declare-fun m!200801 () Bool)

(assert (=> d!52333 m!200801))

(declare-fun m!200803 () Bool)

(assert (=> d!52333 m!200803))

(declare-fun m!200805 () Bool)

(assert (=> d!52333 m!200805))

(declare-fun m!200807 () Bool)

(assert (=> b!171905 m!200807))

(declare-fun m!200809 () Bool)

(assert (=> b!171906 m!200809))

(assert (=> b!171262 d!52333))

(declare-fun d!52335 () Bool)

(assert (=> d!52335 (= (apply!129 (+!244 lt!85266 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045))) lt!85281) (apply!129 lt!85266 lt!85281))))

(declare-fun lt!85563 () Unit!5252)

(assert (=> d!52335 (= lt!85563 (choose!926 lt!85266 lt!85272 (zeroValue!3398 lt!85045) lt!85281))))

(declare-fun e!113442 () Bool)

(assert (=> d!52335 e!113442))

(declare-fun res!81642 () Bool)

(assert (=> d!52335 (=> (not res!81642) (not e!113442))))

(assert (=> d!52335 (= res!81642 (contains!1144 lt!85266 lt!85281))))

(assert (=> d!52335 (= (addApplyDifferent!105 lt!85266 lt!85272 (zeroValue!3398 lt!85045) lt!85281) lt!85563)))

(declare-fun b!171907 () Bool)

(assert (=> b!171907 (= e!113442 (not (= lt!85281 lt!85272)))))

(assert (= (and d!52335 res!81642) b!171907))

(assert (=> d!52335 m!199627))

(declare-fun m!200811 () Bool)

(assert (=> d!52335 m!200811))

(assert (=> d!52335 m!199629))

(assert (=> d!52335 m!199631))

(declare-fun m!200813 () Bool)

(assert (=> d!52335 m!200813))

(assert (=> d!52335 m!199629))

(assert (=> b!171262 d!52335))

(declare-fun d!52337 () Bool)

(declare-fun e!113443 () Bool)

(assert (=> d!52337 e!113443))

(declare-fun res!81643 () Bool)

(assert (=> d!52337 (=> (not res!81643) (not e!113443))))

(declare-fun lt!85565 () ListLongMap!2161)

(assert (=> d!52337 (= res!81643 (contains!1144 lt!85565 (_1!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045)))))))

(declare-fun lt!85566 () List!2193)

(assert (=> d!52337 (= lt!85565 (ListLongMap!2162 lt!85566))))

(declare-fun lt!85567 () Unit!5252)

(declare-fun lt!85564 () Unit!5252)

(assert (=> d!52337 (= lt!85567 lt!85564)))

(assert (=> d!52337 (= (getValueByKey!184 lt!85566 (_1!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045)))))))

(assert (=> d!52337 (= lt!85564 (lemmaContainsTupThenGetReturnValue!97 lt!85566 (_1!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045))) (_2!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045)))))))

(assert (=> d!52337 (= lt!85566 (insertStrictlySorted!100 (toList!1096 lt!85266) (_1!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045))) (_2!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045)))))))

(assert (=> d!52337 (= (+!244 lt!85266 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045))) lt!85565)))

(declare-fun b!171908 () Bool)

(declare-fun res!81644 () Bool)

(assert (=> b!171908 (=> (not res!81644) (not e!113443))))

(assert (=> b!171908 (= res!81644 (= (getValueByKey!184 (toList!1096 lt!85565) (_1!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045))))))))

(declare-fun b!171909 () Bool)

(assert (=> b!171909 (= e!113443 (contains!1146 (toList!1096 lt!85565) (tuple2!3235 lt!85272 (zeroValue!3398 lt!85045))))))

(assert (= (and d!52337 res!81643) b!171908))

(assert (= (and b!171908 res!81644) b!171909))

(declare-fun m!200815 () Bool)

(assert (=> d!52337 m!200815))

(declare-fun m!200817 () Bool)

(assert (=> d!52337 m!200817))

(declare-fun m!200819 () Bool)

(assert (=> d!52337 m!200819))

(declare-fun m!200821 () Bool)

(assert (=> d!52337 m!200821))

(declare-fun m!200823 () Bool)

(assert (=> b!171908 m!200823))

(declare-fun m!200825 () Bool)

(assert (=> b!171909 m!200825))

(assert (=> b!171262 d!52337))

(assert (=> d!51887 d!51879))

(assert (=> d!51887 d!51863))

(declare-fun d!52339 () Bool)

(declare-fun e!113445 () Bool)

(assert (=> d!52339 e!113445))

(declare-fun res!81645 () Bool)

(assert (=> d!52339 (=> res!81645 e!113445)))

(declare-fun lt!85570 () Bool)

(assert (=> d!52339 (= res!81645 (not lt!85570))))

(declare-fun lt!85568 () Bool)

(assert (=> d!52339 (= lt!85570 lt!85568)))

(declare-fun lt!85569 () Unit!5252)

(declare-fun e!113444 () Unit!5252)

(assert (=> d!52339 (= lt!85569 e!113444)))

(declare-fun c!30791 () Bool)

(assert (=> d!52339 (= c!30791 lt!85568)))

(assert (=> d!52339 (= lt!85568 (containsKey!188 (toList!1096 lt!85115) lt!85112))))

(assert (=> d!52339 (= (contains!1144 lt!85115 lt!85112) lt!85570)))

(declare-fun b!171910 () Bool)

(declare-fun lt!85571 () Unit!5252)

(assert (=> b!171910 (= e!113444 lt!85571)))

(assert (=> b!171910 (= lt!85571 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85115) lt!85112))))

(assert (=> b!171910 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85115) lt!85112))))

(declare-fun b!171911 () Bool)

(declare-fun Unit!5290 () Unit!5252)

(assert (=> b!171911 (= e!113444 Unit!5290)))

(declare-fun b!171912 () Bool)

(assert (=> b!171912 (= e!113445 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85115) lt!85112)))))

(assert (= (and d!52339 c!30791) b!171910))

(assert (= (and d!52339 (not c!30791)) b!171911))

(assert (= (and d!52339 (not res!81645)) b!171912))

(declare-fun m!200827 () Bool)

(assert (=> d!52339 m!200827))

(declare-fun m!200829 () Bool)

(assert (=> b!171910 m!200829))

(assert (=> b!171910 m!199741))

(assert (=> b!171910 m!199741))

(declare-fun m!200831 () Bool)

(assert (=> b!171910 m!200831))

(assert (=> b!171912 m!199741))

(assert (=> b!171912 m!199741))

(assert (=> b!171912 m!200831))

(assert (=> d!51887 d!52339))

(assert (=> d!51887 d!51883))

(declare-fun d!52341 () Bool)

(assert (=> d!52341 (= (apply!129 (+!244 lt!85115 (tuple2!3235 lt!85106 (minValue!3398 thiss!1248))) lt!85112) (apply!129 lt!85115 lt!85112))))

(assert (=> d!52341 true))

(declare-fun _$34!1051 () Unit!5252)

(assert (=> d!52341 (= (choose!926 lt!85115 lt!85106 (minValue!3398 thiss!1248) lt!85112) _$34!1051)))

(declare-fun bs!7105 () Bool)

(assert (= bs!7105 d!52341))

(assert (=> bs!7105 m!199273))

(assert (=> bs!7105 m!199273))

(assert (=> bs!7105 m!199281))

(assert (=> bs!7105 m!199275))

(assert (=> d!51887 d!52341))

(declare-fun d!52343 () Bool)

(declare-fun e!113447 () Bool)

(assert (=> d!52343 e!113447))

(declare-fun res!81646 () Bool)

(assert (=> d!52343 (=> res!81646 e!113447)))

(declare-fun lt!85574 () Bool)

(assert (=> d!52343 (= res!81646 (not lt!85574))))

(declare-fun lt!85572 () Bool)

(assert (=> d!52343 (= lt!85574 lt!85572)))

(declare-fun lt!85573 () Unit!5252)

(declare-fun e!113446 () Unit!5252)

(assert (=> d!52343 (= lt!85573 e!113446)))

(declare-fun c!30792 () Bool)

(assert (=> d!52343 (= c!30792 lt!85572)))

(assert (=> d!52343 (= lt!85572 (containsKey!188 (toList!1096 lt!85270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52343 (= (contains!1144 lt!85270 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85574)))

(declare-fun b!171913 () Bool)

(declare-fun lt!85575 () Unit!5252)

(assert (=> b!171913 (= e!113446 lt!85575)))

(assert (=> b!171913 (= lt!85575 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171913 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171914 () Bool)

(declare-fun Unit!5291 () Unit!5252)

(assert (=> b!171914 (= e!113446 Unit!5291)))

(declare-fun b!171915 () Bool)

(assert (=> b!171915 (= e!113447 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52343 c!30792) b!171913))

(assert (= (and d!52343 (not c!30792)) b!171914))

(assert (= (and d!52343 (not res!81646)) b!171915))

(declare-fun m!200833 () Bool)

(assert (=> d!52343 m!200833))

(declare-fun m!200835 () Bool)

(assert (=> b!171913 m!200835))

(assert (=> b!171913 m!200641))

(assert (=> b!171913 m!200641))

(declare-fun m!200837 () Bool)

(assert (=> b!171913 m!200837))

(assert (=> b!171915 m!200641))

(assert (=> b!171915 m!200641))

(assert (=> b!171915 m!200837))

(assert (=> bm!17442 d!52343))

(declare-fun b!171917 () Bool)

(declare-fun e!113448 () Option!190)

(declare-fun e!113449 () Option!190)

(assert (=> b!171917 (= e!113448 e!113449)))

(declare-fun c!30794 () Bool)

(assert (=> b!171917 (= c!30794 (and ((_ is Cons!2189) (t!6995 lt!85172)) (not (= (_1!1628 (h!2806 (t!6995 lt!85172))) (_1!1628 (tuple2!3235 key!828 v!309))))))))

(declare-fun b!171918 () Bool)

(assert (=> b!171918 (= e!113449 (getValueByKey!184 (t!6995 (t!6995 lt!85172)) (_1!1628 (tuple2!3235 key!828 v!309))))))

(declare-fun c!30793 () Bool)

(declare-fun d!52345 () Bool)

(assert (=> d!52345 (= c!30793 (and ((_ is Cons!2189) (t!6995 lt!85172)) (= (_1!1628 (h!2806 (t!6995 lt!85172))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!52345 (= (getValueByKey!184 (t!6995 lt!85172) (_1!1628 (tuple2!3235 key!828 v!309))) e!113448)))

(declare-fun b!171919 () Bool)

(assert (=> b!171919 (= e!113449 None!188)))

(declare-fun b!171916 () Bool)

(assert (=> b!171916 (= e!113448 (Some!189 (_2!1628 (h!2806 (t!6995 lt!85172)))))))

(assert (= (and d!52345 c!30793) b!171916))

(assert (= (and d!52345 (not c!30793)) b!171917))

(assert (= (and b!171917 c!30794) b!171918))

(assert (= (and b!171917 (not c!30794)) b!171919))

(declare-fun m!200839 () Bool)

(assert (=> b!171918 m!200839))

(assert (=> b!171064 d!52345))

(declare-fun d!52347 () Bool)

(declare-fun e!113450 () Bool)

(assert (=> d!52347 e!113450))

(declare-fun res!81647 () Bool)

(assert (=> d!52347 (=> (not res!81647) (not e!113450))))

(declare-fun lt!85577 () ListLongMap!2161)

(assert (=> d!52347 (= res!81647 (contains!1144 lt!85577 (_1!1628 (tuple2!3235 lt!85219 lt!85223))))))

(declare-fun lt!85578 () List!2193)

(assert (=> d!52347 (= lt!85577 (ListLongMap!2162 lt!85578))))

(declare-fun lt!85579 () Unit!5252)

(declare-fun lt!85576 () Unit!5252)

(assert (=> d!52347 (= lt!85579 lt!85576)))

(assert (=> d!52347 (= (getValueByKey!184 lt!85578 (_1!1628 (tuple2!3235 lt!85219 lt!85223))) (Some!189 (_2!1628 (tuple2!3235 lt!85219 lt!85223))))))

(assert (=> d!52347 (= lt!85576 (lemmaContainsTupThenGetReturnValue!97 lt!85578 (_1!1628 (tuple2!3235 lt!85219 lt!85223)) (_2!1628 (tuple2!3235 lt!85219 lt!85223))))))

(assert (=> d!52347 (= lt!85578 (insertStrictlySorted!100 (toList!1096 lt!85218) (_1!1628 (tuple2!3235 lt!85219 lt!85223)) (_2!1628 (tuple2!3235 lt!85219 lt!85223))))))

(assert (=> d!52347 (= (+!244 lt!85218 (tuple2!3235 lt!85219 lt!85223)) lt!85577)))

(declare-fun b!171920 () Bool)

(declare-fun res!81648 () Bool)

(assert (=> b!171920 (=> (not res!81648) (not e!113450))))

(assert (=> b!171920 (= res!81648 (= (getValueByKey!184 (toList!1096 lt!85577) (_1!1628 (tuple2!3235 lt!85219 lt!85223))) (Some!189 (_2!1628 (tuple2!3235 lt!85219 lt!85223)))))))

(declare-fun b!171921 () Bool)

(assert (=> b!171921 (= e!113450 (contains!1146 (toList!1096 lt!85577) (tuple2!3235 lt!85219 lt!85223)))))

(assert (= (and d!52347 res!81647) b!171920))

(assert (= (and b!171920 res!81648) b!171921))

(declare-fun m!200841 () Bool)

(assert (=> d!52347 m!200841))

(declare-fun m!200843 () Bool)

(assert (=> d!52347 m!200843))

(declare-fun m!200845 () Bool)

(assert (=> d!52347 m!200845))

(declare-fun m!200847 () Bool)

(assert (=> d!52347 m!200847))

(declare-fun m!200849 () Bool)

(assert (=> b!171920 m!200849))

(declare-fun m!200851 () Bool)

(assert (=> b!171921 m!200851))

(assert (=> b!171143 d!52347))

(assert (=> b!171143 d!51851))

(declare-fun d!52349 () Bool)

(declare-fun e!113452 () Bool)

(assert (=> d!52349 e!113452))

(declare-fun res!81649 () Bool)

(assert (=> d!52349 (=> res!81649 e!113452)))

(declare-fun lt!85582 () Bool)

(assert (=> d!52349 (= res!81649 (not lt!85582))))

(declare-fun lt!85580 () Bool)

(assert (=> d!52349 (= lt!85582 lt!85580)))

(declare-fun lt!85581 () Unit!5252)

(declare-fun e!113451 () Unit!5252)

(assert (=> d!52349 (= lt!85581 e!113451)))

(declare-fun c!30795 () Bool)

(assert (=> d!52349 (= c!30795 lt!85580)))

(assert (=> d!52349 (= lt!85580 (containsKey!188 (toList!1096 (+!244 lt!85218 (tuple2!3235 lt!85219 lt!85223))) lt!85222))))

(assert (=> d!52349 (= (contains!1144 (+!244 lt!85218 (tuple2!3235 lt!85219 lt!85223)) lt!85222) lt!85582)))

(declare-fun b!171922 () Bool)

(declare-fun lt!85583 () Unit!5252)

(assert (=> b!171922 (= e!113451 lt!85583)))

(assert (=> b!171922 (= lt!85583 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 (+!244 lt!85218 (tuple2!3235 lt!85219 lt!85223))) lt!85222))))

(assert (=> b!171922 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85218 (tuple2!3235 lt!85219 lt!85223))) lt!85222))))

(declare-fun b!171923 () Bool)

(declare-fun Unit!5292 () Unit!5252)

(assert (=> b!171923 (= e!113451 Unit!5292)))

(declare-fun b!171924 () Bool)

(assert (=> b!171924 (= e!113452 (isDefined!137 (getValueByKey!184 (toList!1096 (+!244 lt!85218 (tuple2!3235 lt!85219 lt!85223))) lt!85222)))))

(assert (= (and d!52349 c!30795) b!171922))

(assert (= (and d!52349 (not c!30795)) b!171923))

(assert (= (and d!52349 (not res!81649)) b!171924))

(declare-fun m!200853 () Bool)

(assert (=> d!52349 m!200853))

(declare-fun m!200855 () Bool)

(assert (=> b!171922 m!200855))

(declare-fun m!200857 () Bool)

(assert (=> b!171922 m!200857))

(assert (=> b!171922 m!200857))

(declare-fun m!200859 () Bool)

(assert (=> b!171922 m!200859))

(assert (=> b!171924 m!200857))

(assert (=> b!171924 m!200857))

(assert (=> b!171924 m!200859))

(assert (=> b!171143 d!52349))

(declare-fun d!52351 () Bool)

(assert (=> d!52351 (not (contains!1144 (+!244 lt!85218 (tuple2!3235 lt!85219 lt!85223)) lt!85222))))

(declare-fun lt!85584 () Unit!5252)

(assert (=> d!52351 (= lt!85584 (choose!927 lt!85218 lt!85219 lt!85223 lt!85222))))

(declare-fun e!113453 () Bool)

(assert (=> d!52351 e!113453))

(declare-fun res!81650 () Bool)

(assert (=> d!52351 (=> (not res!81650) (not e!113453))))

(assert (=> d!52351 (= res!81650 (not (contains!1144 lt!85218 lt!85222)))))

(assert (=> d!52351 (= (addStillNotContains!71 lt!85218 lt!85219 lt!85223 lt!85222) lt!85584)))

(declare-fun b!171925 () Bool)

(assert (=> b!171925 (= e!113453 (not (= lt!85219 lt!85222)))))

(assert (= (and d!52351 res!81650) b!171925))

(assert (=> d!52351 m!199485))

(assert (=> d!52351 m!199485))

(assert (=> d!52351 m!199487))

(declare-fun m!200861 () Bool)

(assert (=> d!52351 m!200861))

(declare-fun m!200863 () Bool)

(assert (=> d!52351 m!200863))

(assert (=> b!171143 d!52351))

(declare-fun d!52353 () Bool)

(declare-fun e!113454 () Bool)

(assert (=> d!52353 e!113454))

(declare-fun res!81651 () Bool)

(assert (=> d!52353 (=> (not res!81651) (not e!113454))))

(declare-fun lt!85586 () ListLongMap!2161)

(assert (=> d!52353 (= res!81651 (contains!1144 lt!85586 (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!85587 () List!2193)

(assert (=> d!52353 (= lt!85586 (ListLongMap!2162 lt!85587))))

(declare-fun lt!85588 () Unit!5252)

(declare-fun lt!85585 () Unit!5252)

(assert (=> d!52353 (= lt!85588 lt!85585)))

(assert (=> d!52353 (= (getValueByKey!184 lt!85587 (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!189 (_2!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52353 (= lt!85585 (lemmaContainsTupThenGetReturnValue!97 lt!85587 (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52353 (= lt!85587 (insertStrictlySorted!100 (toList!1096 call!17429) (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52353 (= (+!244 call!17429 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!85586)))

(declare-fun b!171926 () Bool)

(declare-fun res!81652 () Bool)

(assert (=> b!171926 (=> (not res!81652) (not e!113454))))

(assert (=> b!171926 (= res!81652 (= (getValueByKey!184 (toList!1096 lt!85586) (_1!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!189 (_2!1628 (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!171927 () Bool)

(assert (=> b!171927 (= e!113454 (contains!1146 (toList!1096 lt!85586) (tuple2!3235 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000) (get!1938 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52353 res!81651) b!171926))

(assert (= (and b!171926 res!81652) b!171927))

(declare-fun m!200865 () Bool)

(assert (=> d!52353 m!200865))

(declare-fun m!200867 () Bool)

(assert (=> d!52353 m!200867))

(declare-fun m!200869 () Bool)

(assert (=> d!52353 m!200869))

(declare-fun m!200871 () Bool)

(assert (=> d!52353 m!200871))

(declare-fun m!200873 () Bool)

(assert (=> b!171926 m!200873))

(declare-fun m!200875 () Bool)

(assert (=> b!171927 m!200875))

(assert (=> b!171143 d!52353))

(declare-fun d!52355 () Bool)

(assert (=> d!52355 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85589 () Unit!5252)

(assert (=> d!52355 (= lt!85589 (choose!923 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113455 () Bool)

(assert (=> d!52355 e!113455))

(declare-fun res!81653 () Bool)

(assert (=> d!52355 (=> (not res!81653) (not e!113455))))

(assert (=> d!52355 (= res!81653 (isStrictlySorted!331 (toList!1096 lt!85130)))))

(assert (=> d!52355 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000) lt!85589)))

(declare-fun b!171928 () Bool)

(assert (=> b!171928 (= e!113455 (containsKey!188 (toList!1096 lt!85130) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52355 res!81653) b!171928))

(assert (=> d!52355 m!199903))

(assert (=> d!52355 m!199903))

(assert (=> d!52355 m!199905))

(declare-fun m!200877 () Bool)

(assert (=> d!52355 m!200877))

(assert (=> d!52355 m!200487))

(assert (=> b!171928 m!199899))

(assert (=> b!171324 d!52355))

(assert (=> b!171324 d!51951))

(assert (=> b!171324 d!51953))

(declare-fun d!52357 () Bool)

(assert (=> d!52357 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))) (v!3914 (getValueByKey!184 (toList!1096 lt!85130) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51861 d!52357))

(assert (=> d!51861 d!52209))

(declare-fun d!52359 () Bool)

(assert (=> d!52359 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))) (v!3914 (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!51849 d!52359))

(assert (=> d!51849 d!52215))

(declare-fun d!52361 () Bool)

(declare-fun e!113457 () Bool)

(assert (=> d!52361 e!113457))

(declare-fun res!81654 () Bool)

(assert (=> d!52361 (=> res!81654 e!113457)))

(declare-fun lt!85592 () Bool)

(assert (=> d!52361 (= res!81654 (not lt!85592))))

(declare-fun lt!85590 () Bool)

(assert (=> d!52361 (= lt!85592 lt!85590)))

(declare-fun lt!85591 () Unit!5252)

(declare-fun e!113456 () Unit!5252)

(assert (=> d!52361 (= lt!85591 e!113456)))

(declare-fun c!30796 () Bool)

(assert (=> d!52361 (= c!30796 lt!85590)))

(assert (=> d!52361 (= lt!85590 (containsKey!188 (toList!1096 lt!85239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52361 (= (contains!1144 lt!85239 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85592)))

(declare-fun b!171929 () Bool)

(declare-fun lt!85593 () Unit!5252)

(assert (=> b!171929 (= e!113456 lt!85593)))

(assert (=> b!171929 (= lt!85593 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171929 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85239) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171930 () Bool)

(declare-fun Unit!5293 () Unit!5252)

(assert (=> b!171930 (= e!113456 Unit!5293)))

(declare-fun b!171931 () Bool)

(assert (=> b!171931 (= e!113457 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85239) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52361 c!30796) b!171929))

(assert (= (and d!52361 (not c!30796)) b!171930))

(assert (= (and d!52361 (not res!81654)) b!171931))

(declare-fun m!200879 () Bool)

(assert (=> d!52361 m!200879))

(declare-fun m!200881 () Bool)

(assert (=> b!171929 m!200881))

(declare-fun m!200883 () Bool)

(assert (=> b!171929 m!200883))

(assert (=> b!171929 m!200883))

(declare-fun m!200885 () Bool)

(assert (=> b!171929 m!200885))

(assert (=> b!171931 m!200883))

(assert (=> b!171931 m!200883))

(assert (=> b!171931 m!200885))

(assert (=> d!51827 d!52361))

(assert (=> d!51827 d!51801))

(assert (=> b!171320 d!51833))

(declare-fun d!52363 () Bool)

(assert (=> d!52363 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85140) lt!85137)) (v!3914 (getValueByKey!184 (toList!1096 lt!85140) lt!85137)))))

(assert (=> d!51929 d!52363))

(declare-fun b!171933 () Bool)

(declare-fun e!113458 () Option!190)

(declare-fun e!113459 () Option!190)

(assert (=> b!171933 (= e!113458 e!113459)))

(declare-fun c!30798 () Bool)

(assert (=> b!171933 (= c!30798 (and ((_ is Cons!2189) (toList!1096 lt!85140)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85140))) lt!85137))))))

(declare-fun b!171934 () Bool)

(assert (=> b!171934 (= e!113459 (getValueByKey!184 (t!6995 (toList!1096 lt!85140)) lt!85137))))

(declare-fun d!52365 () Bool)

(declare-fun c!30797 () Bool)

(assert (=> d!52365 (= c!30797 (and ((_ is Cons!2189) (toList!1096 lt!85140)) (= (_1!1628 (h!2806 (toList!1096 lt!85140))) lt!85137)))))

(assert (=> d!52365 (= (getValueByKey!184 (toList!1096 lt!85140) lt!85137) e!113458)))

(declare-fun b!171935 () Bool)

(assert (=> b!171935 (= e!113459 None!188)))

(declare-fun b!171932 () Bool)

(assert (=> b!171932 (= e!113458 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85140)))))))

(assert (= (and d!52365 c!30797) b!171932))

(assert (= (and d!52365 (not c!30797)) b!171933))

(assert (= (and b!171933 c!30798) b!171934))

(assert (= (and b!171933 (not c!30798)) b!171935))

(declare-fun m!200887 () Bool)

(assert (=> b!171934 m!200887))

(assert (=> d!51929 d!52365))

(declare-fun d!52367 () Bool)

(assert (=> d!52367 (= (get!1940 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!472 (defaultEntry!3555 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3912 (select (arr!3390 (_values!3538 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171238 d!52367))

(declare-fun lt!85594 () Bool)

(declare-fun d!52369 () Bool)

(assert (=> d!52369 (= lt!85594 (select (content!147 lt!85172) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun e!113461 () Bool)

(assert (=> d!52369 (= lt!85594 e!113461)))

(declare-fun res!81655 () Bool)

(assert (=> d!52369 (=> (not res!81655) (not e!113461))))

(assert (=> d!52369 (= res!81655 ((_ is Cons!2189) lt!85172))))

(assert (=> d!52369 (= (contains!1146 lt!85172 (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))) lt!85594)))

(declare-fun b!171936 () Bool)

(declare-fun e!113460 () Bool)

(assert (=> b!171936 (= e!113461 e!113460)))

(declare-fun res!81656 () Bool)

(assert (=> b!171936 (=> res!81656 e!113460)))

(assert (=> b!171936 (= res!81656 (= (h!2806 lt!85172) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun b!171937 () Bool)

(assert (=> b!171937 (= e!113460 (contains!1146 (t!6995 lt!85172) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))))))

(assert (= (and d!52369 res!81655) b!171936))

(assert (= (and b!171936 (not res!81656)) b!171937))

(declare-fun m!200889 () Bool)

(assert (=> d!52369 m!200889))

(declare-fun m!200891 () Bool)

(assert (=> d!52369 m!200891))

(declare-fun m!200893 () Bool)

(assert (=> b!171937 m!200893))

(assert (=> b!171071 d!52369))

(declare-fun d!52371 () Bool)

(declare-fun e!113463 () Bool)

(assert (=> d!52371 e!113463))

(declare-fun res!81657 () Bool)

(assert (=> d!52371 (=> res!81657 e!113463)))

(declare-fun lt!85597 () Bool)

(assert (=> d!52371 (= res!81657 (not lt!85597))))

(declare-fun lt!85595 () Bool)

(assert (=> d!52371 (= lt!85597 lt!85595)))

(declare-fun lt!85596 () Unit!5252)

(declare-fun e!113462 () Unit!5252)

(assert (=> d!52371 (= lt!85596 e!113462)))

(declare-fun c!30799 () Bool)

(assert (=> d!52371 (= c!30799 lt!85595)))

(assert (=> d!52371 (= lt!85595 (containsKey!188 (toList!1096 lt!85291) (_1!1628 (tuple2!3235 lt!85107 v!309))))))

(assert (=> d!52371 (= (contains!1144 lt!85291 (_1!1628 (tuple2!3235 lt!85107 v!309))) lt!85597)))

(declare-fun b!171938 () Bool)

(declare-fun lt!85598 () Unit!5252)

(assert (=> b!171938 (= e!113462 lt!85598)))

(assert (=> b!171938 (= lt!85598 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85291) (_1!1628 (tuple2!3235 lt!85107 v!309))))))

(assert (=> b!171938 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85291) (_1!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun b!171939 () Bool)

(declare-fun Unit!5294 () Unit!5252)

(assert (=> b!171939 (= e!113462 Unit!5294)))

(declare-fun b!171940 () Bool)

(assert (=> b!171940 (= e!113463 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85291) (_1!1628 (tuple2!3235 lt!85107 v!309)))))))

(assert (= (and d!52371 c!30799) b!171938))

(assert (= (and d!52371 (not c!30799)) b!171939))

(assert (= (and d!52371 (not res!81657)) b!171940))

(declare-fun m!200895 () Bool)

(assert (=> d!52371 m!200895))

(declare-fun m!200897 () Bool)

(assert (=> b!171938 m!200897))

(assert (=> b!171938 m!199693))

(assert (=> b!171938 m!199693))

(declare-fun m!200899 () Bool)

(assert (=> b!171938 m!200899))

(assert (=> b!171940 m!199693))

(assert (=> b!171940 m!199693))

(assert (=> b!171940 m!200899))

(assert (=> d!51865 d!52371))

(declare-fun b!171942 () Bool)

(declare-fun e!113464 () Option!190)

(declare-fun e!113465 () Option!190)

(assert (=> b!171942 (= e!113464 e!113465)))

(declare-fun c!30801 () Bool)

(assert (=> b!171942 (= c!30801 (and ((_ is Cons!2189) lt!85292) (not (= (_1!1628 (h!2806 lt!85292)) (_1!1628 (tuple2!3235 lt!85107 v!309))))))))

(declare-fun b!171943 () Bool)

(assert (=> b!171943 (= e!113465 (getValueByKey!184 (t!6995 lt!85292) (_1!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun d!52373 () Bool)

(declare-fun c!30800 () Bool)

(assert (=> d!52373 (= c!30800 (and ((_ is Cons!2189) lt!85292) (= (_1!1628 (h!2806 lt!85292)) (_1!1628 (tuple2!3235 lt!85107 v!309)))))))

(assert (=> d!52373 (= (getValueByKey!184 lt!85292 (_1!1628 (tuple2!3235 lt!85107 v!309))) e!113464)))

(declare-fun b!171944 () Bool)

(assert (=> b!171944 (= e!113465 None!188)))

(declare-fun b!171941 () Bool)

(assert (=> b!171941 (= e!113464 (Some!189 (_2!1628 (h!2806 lt!85292))))))

(assert (= (and d!52373 c!30800) b!171941))

(assert (= (and d!52373 (not c!30800)) b!171942))

(assert (= (and b!171942 c!30801) b!171943))

(assert (= (and b!171942 (not c!30801)) b!171944))

(declare-fun m!200901 () Bool)

(assert (=> b!171943 m!200901))

(assert (=> d!51865 d!52373))

(declare-fun d!52375 () Bool)

(assert (=> d!52375 (= (getValueByKey!184 lt!85292 (_1!1628 (tuple2!3235 lt!85107 v!309))) (Some!189 (_2!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun lt!85599 () Unit!5252)

(assert (=> d!52375 (= lt!85599 (choose!924 lt!85292 (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun e!113466 () Bool)

(assert (=> d!52375 e!113466))

(declare-fun res!81658 () Bool)

(assert (=> d!52375 (=> (not res!81658) (not e!113466))))

(assert (=> d!52375 (= res!81658 (isStrictlySorted!331 lt!85292))))

(assert (=> d!52375 (= (lemmaContainsTupThenGetReturnValue!97 lt!85292 (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309))) lt!85599)))

(declare-fun b!171945 () Bool)

(declare-fun res!81659 () Bool)

(assert (=> b!171945 (=> (not res!81659) (not e!113466))))

(assert (=> b!171945 (= res!81659 (containsKey!188 lt!85292 (_1!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun b!171946 () Bool)

(assert (=> b!171946 (= e!113466 (contains!1146 lt!85292 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309)))))))

(assert (= (and d!52375 res!81658) b!171945))

(assert (= (and b!171945 res!81659) b!171946))

(assert (=> d!52375 m!199687))

(declare-fun m!200903 () Bool)

(assert (=> d!52375 m!200903))

(declare-fun m!200905 () Bool)

(assert (=> d!52375 m!200905))

(declare-fun m!200907 () Bool)

(assert (=> b!171945 m!200907))

(declare-fun m!200909 () Bool)

(assert (=> b!171946 m!200909))

(assert (=> d!51865 d!52375))

(declare-fun b!171947 () Bool)

(declare-fun e!113467 () List!2193)

(declare-fun call!17498 () List!2193)

(assert (=> b!171947 (= e!113467 call!17498)))

(declare-fun b!171948 () Bool)

(declare-fun res!81661 () Bool)

(declare-fun e!113471 () Bool)

(assert (=> b!171948 (=> (not res!81661) (not e!113471))))

(declare-fun lt!85600 () List!2193)

(assert (=> b!171948 (= res!81661 (containsKey!188 lt!85600 (_1!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun b!171949 () Bool)

(declare-fun e!113470 () List!2193)

(declare-fun e!113468 () List!2193)

(assert (=> b!171949 (= e!113470 e!113468)))

(declare-fun c!30803 () Bool)

(assert (=> b!171949 (= c!30803 (and ((_ is Cons!2189) (toList!1096 lt!85101)) (= (_1!1628 (h!2806 (toList!1096 lt!85101))) (_1!1628 (tuple2!3235 lt!85107 v!309)))))))

(declare-fun e!113469 () List!2193)

(declare-fun c!30804 () Bool)

(declare-fun b!171950 () Bool)

(assert (=> b!171950 (= e!113469 (ite c!30803 (t!6995 (toList!1096 lt!85101)) (ite c!30804 (Cons!2189 (h!2806 (toList!1096 lt!85101)) (t!6995 (toList!1096 lt!85101))) Nil!2190)))))

(declare-fun b!171951 () Bool)

(assert (=> b!171951 (= e!113471 (contains!1146 lt!85600 (tuple2!3235 (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309)))))))

(declare-fun b!171952 () Bool)

(declare-fun call!17497 () List!2193)

(assert (=> b!171952 (= e!113470 call!17497)))

(declare-fun c!30805 () Bool)

(declare-fun bm!17494 () Bool)

(assert (=> bm!17494 (= call!17497 ($colon$colon!97 e!113469 (ite c!30805 (h!2806 (toList!1096 lt!85101)) (tuple2!3235 (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309))))))))

(declare-fun c!30802 () Bool)

(assert (=> bm!17494 (= c!30802 c!30805)))

(declare-fun bm!17496 () Bool)

(declare-fun call!17499 () List!2193)

(assert (=> bm!17496 (= call!17498 call!17499)))

(declare-fun b!171953 () Bool)

(assert (=> b!171953 (= e!113468 call!17499)))

(declare-fun b!171954 () Bool)

(assert (=> b!171954 (= e!113467 call!17498)))

(declare-fun b!171955 () Bool)

(assert (=> b!171955 (= c!30804 (and ((_ is Cons!2189) (toList!1096 lt!85101)) (bvsgt (_1!1628 (h!2806 (toList!1096 lt!85101))) (_1!1628 (tuple2!3235 lt!85107 v!309)))))))

(assert (=> b!171955 (= e!113468 e!113467)))

(declare-fun b!171956 () Bool)

(assert (=> b!171956 (= e!113469 (insertStrictlySorted!100 (t!6995 (toList!1096 lt!85101)) (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309))))))

(declare-fun bm!17495 () Bool)

(assert (=> bm!17495 (= call!17499 call!17497)))

(declare-fun d!52377 () Bool)

(assert (=> d!52377 e!113471))

(declare-fun res!81660 () Bool)

(assert (=> d!52377 (=> (not res!81660) (not e!113471))))

(assert (=> d!52377 (= res!81660 (isStrictlySorted!331 lt!85600))))

(assert (=> d!52377 (= lt!85600 e!113470)))

(assert (=> d!52377 (= c!30805 (and ((_ is Cons!2189) (toList!1096 lt!85101)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85101))) (_1!1628 (tuple2!3235 lt!85107 v!309)))))))

(assert (=> d!52377 (isStrictlySorted!331 (toList!1096 lt!85101))))

(assert (=> d!52377 (= (insertStrictlySorted!100 (toList!1096 lt!85101) (_1!1628 (tuple2!3235 lt!85107 v!309)) (_2!1628 (tuple2!3235 lt!85107 v!309))) lt!85600)))

(assert (= (and d!52377 c!30805) b!171952))

(assert (= (and d!52377 (not c!30805)) b!171949))

(assert (= (and b!171949 c!30803) b!171953))

(assert (= (and b!171949 (not c!30803)) b!171955))

(assert (= (and b!171955 c!30804) b!171954))

(assert (= (and b!171955 (not c!30804)) b!171947))

(assert (= (or b!171954 b!171947) bm!17496))

(assert (= (or b!171953 bm!17496) bm!17495))

(assert (= (or b!171952 bm!17495) bm!17494))

(assert (= (and bm!17494 c!30802) b!171956))

(assert (= (and bm!17494 (not c!30802)) b!171950))

(assert (= (and d!52377 res!81660) b!171948))

(assert (= (and b!171948 res!81661) b!171951))

(declare-fun m!200911 () Bool)

(assert (=> b!171948 m!200911))

(declare-fun m!200913 () Bool)

(assert (=> d!52377 m!200913))

(declare-fun m!200915 () Bool)

(assert (=> d!52377 m!200915))

(declare-fun m!200917 () Bool)

(assert (=> b!171956 m!200917))

(declare-fun m!200919 () Bool)

(assert (=> b!171951 m!200919))

(declare-fun m!200921 () Bool)

(assert (=> bm!17494 m!200921))

(assert (=> d!51865 d!52377))

(declare-fun b!171958 () Bool)

(declare-fun e!113472 () Option!190)

(declare-fun e!113473 () Option!190)

(assert (=> b!171958 (= e!113472 e!113473)))

(declare-fun c!30807 () Bool)

(assert (=> b!171958 (= c!30807 (and ((_ is Cons!2189) (toList!1096 lt!85255)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85255))) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))))

(declare-fun b!171959 () Bool)

(assert (=> b!171959 (= e!113473 (getValueByKey!184 (t!6995 (toList!1096 lt!85255)) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun d!52379 () Bool)

(declare-fun c!30806 () Bool)

(assert (=> d!52379 (= c!30806 (and ((_ is Cons!2189) (toList!1096 lt!85255)) (= (_1!1628 (h!2806 (toList!1096 lt!85255))) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (=> d!52379 (= (getValueByKey!184 (toList!1096 lt!85255) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) e!113472)))

(declare-fun b!171960 () Bool)

(assert (=> b!171960 (= e!113473 None!188)))

(declare-fun b!171957 () Bool)

(assert (=> b!171957 (= e!113472 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85255)))))))

(assert (= (and d!52379 c!30806) b!171957))

(assert (= (and d!52379 (not c!30806)) b!171958))

(assert (= (and b!171958 c!30807) b!171959))

(assert (= (and b!171958 (not c!30807)) b!171960))

(declare-fun m!200923 () Bool)

(assert (=> b!171959 m!200923))

(assert (=> b!171201 d!52379))

(declare-fun d!52381 () Bool)

(declare-fun res!81662 () Bool)

(declare-fun e!113474 () Bool)

(assert (=> d!52381 (=> res!81662 e!113474)))

(assert (=> d!52381 (= res!81662 (and ((_ is Cons!2189) lt!85194) (= (_1!1628 (h!2806 lt!85194)) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!52381 (= (containsKey!188 lt!85194 (_1!1628 (tuple2!3235 key!828 v!309))) e!113474)))

(declare-fun b!171961 () Bool)

(declare-fun e!113475 () Bool)

(assert (=> b!171961 (= e!113474 e!113475)))

(declare-fun res!81663 () Bool)

(assert (=> b!171961 (=> (not res!81663) (not e!113475))))

(assert (=> b!171961 (= res!81663 (and (or (not ((_ is Cons!2189) lt!85194)) (bvsle (_1!1628 (h!2806 lt!85194)) (_1!1628 (tuple2!3235 key!828 v!309)))) ((_ is Cons!2189) lt!85194) (bvslt (_1!1628 (h!2806 lt!85194)) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun b!171962 () Bool)

(assert (=> b!171962 (= e!113475 (containsKey!188 (t!6995 lt!85194) (_1!1628 (tuple2!3235 key!828 v!309))))))

(assert (= (and d!52381 (not res!81662)) b!171961))

(assert (= (and b!171961 res!81663) b!171962))

(declare-fun m!200925 () Bool)

(assert (=> b!171962 m!200925))

(assert (=> b!171093 d!52381))

(declare-fun d!52383 () Bool)

(declare-fun res!81664 () Bool)

(declare-fun e!113476 () Bool)

(assert (=> d!52383 (=> res!81664 e!113476)))

(assert (=> d!52383 (= res!81664 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (= (_1!1628 (h!2806 (toList!1096 lt!85105))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52383 (= (containsKey!188 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) e!113476)))

(declare-fun b!171963 () Bool)

(declare-fun e!113477 () Bool)

(assert (=> b!171963 (= e!113476 e!113477)))

(declare-fun res!81665 () Bool)

(assert (=> b!171963 (=> (not res!81665) (not e!113477))))

(assert (=> b!171963 (= res!81665 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85105))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85105))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2189) (toList!1096 lt!85105)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85105))) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!171964 () Bool)

(assert (=> b!171964 (= e!113477 (containsKey!188 (t!6995 (toList!1096 lt!85105)) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52383 (not res!81664)) b!171963))

(assert (= (and b!171963 res!81665) b!171964))

(assert (=> b!171964 m!199241))

(declare-fun m!200927 () Bool)

(assert (=> b!171964 m!200927))

(assert (=> d!51815 d!52383))

(declare-fun lt!85601 () Bool)

(declare-fun d!52385 () Bool)

(assert (=> d!52385 (= lt!85601 (select (content!147 (toList!1096 lt!85330)) (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))

(declare-fun e!113479 () Bool)

(assert (=> d!52385 (= lt!85601 e!113479)))

(declare-fun res!81666 () Bool)

(assert (=> d!52385 (=> (not res!81666) (not e!113479))))

(assert (=> d!52385 (= res!81666 ((_ is Cons!2189) (toList!1096 lt!85330)))))

(assert (=> d!52385 (= (contains!1146 (toList!1096 lt!85330) (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))) lt!85601)))

(declare-fun b!171965 () Bool)

(declare-fun e!113478 () Bool)

(assert (=> b!171965 (= e!113479 e!113478)))

(declare-fun res!81667 () Bool)

(assert (=> b!171965 (=> res!81667 e!113478)))

(assert (=> b!171965 (= res!81667 (= (h!2806 (toList!1096 lt!85330)) (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))

(declare-fun b!171966 () Bool)

(assert (=> b!171966 (= e!113478 (contains!1146 (t!6995 (toList!1096 lt!85330)) (tuple2!3235 lt!85135 (minValue!3398 thiss!1248))))))

(assert (= (and d!52385 res!81666) b!171965))

(assert (= (and b!171965 (not res!81667)) b!171966))

(declare-fun m!200929 () Bool)

(assert (=> d!52385 m!200929))

(declare-fun m!200931 () Bool)

(assert (=> d!52385 m!200931))

(declare-fun m!200933 () Bool)

(assert (=> b!171966 m!200933))

(assert (=> b!171310 d!52385))

(assert (=> b!171257 d!51977))

(assert (=> b!171043 d!51821))

(declare-fun d!52387 () Bool)

(assert (=> d!52387 (= ($colon$colon!97 e!113021 (ite c!30582 (h!2806 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))) (Cons!2189 (ite c!30582 (h!2806 (toList!1096 (getCurrentListMap!750 (_keys!5387 thiss!1248) (_values!3538 thiss!1248) (mask!8383 thiss!1248) (extraKeys!3296 thiss!1248) (zeroValue!3398 thiss!1248) (minValue!3398 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3555 thiss!1248)))) (tuple2!3235 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!113021))))

(assert (=> bm!17434 d!52387))

(assert (=> b!171162 d!51833))

(declare-fun d!52389 () Bool)

(declare-fun e!113481 () Bool)

(assert (=> d!52389 e!113481))

(declare-fun res!81668 () Bool)

(assert (=> d!52389 (=> res!81668 e!113481)))

(declare-fun lt!85604 () Bool)

(assert (=> d!52389 (= res!81668 (not lt!85604))))

(declare-fun lt!85602 () Bool)

(assert (=> d!52389 (= lt!85604 lt!85602)))

(declare-fun lt!85603 () Unit!5252)

(declare-fun e!113480 () Unit!5252)

(assert (=> d!52389 (= lt!85603 e!113480)))

(declare-fun c!30808 () Bool)

(assert (=> d!52389 (= c!30808 lt!85602)))

(assert (=> d!52389 (= lt!85602 (containsKey!188 (toList!1096 lt!85221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52389 (= (contains!1144 lt!85221 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85604)))

(declare-fun b!171967 () Bool)

(declare-fun lt!85605 () Unit!5252)

(assert (=> b!171967 (= e!113480 lt!85605)))

(assert (=> b!171967 (= lt!85605 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!171967 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171968 () Bool)

(declare-fun Unit!5295 () Unit!5252)

(assert (=> b!171968 (= e!113480 Unit!5295)))

(declare-fun b!171969 () Bool)

(assert (=> b!171969 (= e!113481 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52389 c!30808) b!171967))

(assert (= (and d!52389 (not c!30808)) b!171968))

(assert (= (and d!52389 (not res!81668)) b!171969))

(declare-fun m!200935 () Bool)

(assert (=> d!52389 m!200935))

(declare-fun m!200937 () Bool)

(assert (=> b!171967 m!200937))

(declare-fun m!200939 () Bool)

(assert (=> b!171967 m!200939))

(assert (=> b!171967 m!200939))

(declare-fun m!200941 () Bool)

(assert (=> b!171967 m!200941))

(assert (=> b!171969 m!200939))

(assert (=> b!171969 m!200939))

(assert (=> b!171969 m!200941))

(assert (=> d!51817 d!52389))

(assert (=> d!51817 d!51801))

(declare-fun lt!85606 () Bool)

(declare-fun d!52391 () Bool)

(assert (=> d!52391 (= lt!85606 (select (content!147 (toList!1096 lt!85309)) (tuple2!3235 lt!85104 v!309)))))

(declare-fun e!113483 () Bool)

(assert (=> d!52391 (= lt!85606 e!113483)))

(declare-fun res!81669 () Bool)

(assert (=> d!52391 (=> (not res!81669) (not e!113483))))

(assert (=> d!52391 (= res!81669 ((_ is Cons!2189) (toList!1096 lt!85309)))))

(assert (=> d!52391 (= (contains!1146 (toList!1096 lt!85309) (tuple2!3235 lt!85104 v!309)) lt!85606)))

(declare-fun b!171970 () Bool)

(declare-fun e!113482 () Bool)

(assert (=> b!171970 (= e!113483 e!113482)))

(declare-fun res!81670 () Bool)

(assert (=> b!171970 (=> res!81670 e!113482)))

(assert (=> b!171970 (= res!81670 (= (h!2806 (toList!1096 lt!85309)) (tuple2!3235 lt!85104 v!309)))))

(declare-fun b!171971 () Bool)

(assert (=> b!171971 (= e!113482 (contains!1146 (t!6995 (toList!1096 lt!85309)) (tuple2!3235 lt!85104 v!309)))))

(assert (= (and d!52391 res!81669) b!171970))

(assert (= (and b!171970 (not res!81670)) b!171971))

(declare-fun m!200943 () Bool)

(assert (=> d!52391 m!200943))

(declare-fun m!200945 () Bool)

(assert (=> d!52391 m!200945))

(declare-fun m!200947 () Bool)

(assert (=> b!171971 m!200947))

(assert (=> b!171295 d!52391))

(declare-fun d!52393 () Bool)

(declare-fun e!113485 () Bool)

(assert (=> d!52393 e!113485))

(declare-fun res!81671 () Bool)

(assert (=> d!52393 (=> res!81671 e!113485)))

(declare-fun lt!85609 () Bool)

(assert (=> d!52393 (= res!81671 (not lt!85609))))

(declare-fun lt!85607 () Bool)

(assert (=> d!52393 (= lt!85609 lt!85607)))

(declare-fun lt!85608 () Unit!5252)

(declare-fun e!113484 () Unit!5252)

(assert (=> d!52393 (= lt!85608 e!113484)))

(declare-fun c!30809 () Bool)

(assert (=> d!52393 (= c!30809 lt!85607)))

(assert (=> d!52393 (= lt!85607 (containsKey!188 (toList!1096 lt!85270) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(assert (=> d!52393 (= (contains!1144 lt!85270 (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)) lt!85609)))

(declare-fun b!171972 () Bool)

(declare-fun lt!85610 () Unit!5252)

(assert (=> b!171972 (= e!113484 lt!85610)))

(assert (=> b!171972 (= lt!85610 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85270) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(assert (=> b!171972 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85270) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000)))))

(declare-fun b!171973 () Bool)

(declare-fun Unit!5296 () Unit!5252)

(assert (=> b!171973 (= e!113484 Unit!5296)))

(declare-fun b!171974 () Bool)

(assert (=> b!171974 (= e!113485 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85270) (select (arr!3389 (_keys!5387 lt!85045)) #b00000000000000000000000000000000))))))

(assert (= (and d!52393 c!30809) b!171972))

(assert (= (and d!52393 (not c!30809)) b!171973))

(assert (= (and d!52393 (not res!81671)) b!171974))

(assert (=> d!52393 m!199545))

(declare-fun m!200949 () Bool)

(assert (=> d!52393 m!200949))

(assert (=> b!171972 m!199545))

(declare-fun m!200951 () Bool)

(assert (=> b!171972 m!200951))

(assert (=> b!171972 m!199545))

(assert (=> b!171972 m!200089))

(assert (=> b!171972 m!200089))

(declare-fun m!200953 () Bool)

(assert (=> b!171972 m!200953))

(assert (=> b!171974 m!199545))

(assert (=> b!171974 m!200089))

(assert (=> b!171974 m!200089))

(assert (=> b!171974 m!200953))

(assert (=> b!171270 d!52393))

(declare-fun d!52395 () Bool)

(declare-fun e!113487 () Bool)

(assert (=> d!52395 e!113487))

(declare-fun res!81672 () Bool)

(assert (=> d!52395 (=> res!81672 e!113487)))

(declare-fun lt!85613 () Bool)

(assert (=> d!52395 (= res!81672 (not lt!85613))))

(declare-fun lt!85611 () Bool)

(assert (=> d!52395 (= lt!85613 lt!85611)))

(declare-fun lt!85612 () Unit!5252)

(declare-fun e!113486 () Unit!5252)

(assert (=> d!52395 (= lt!85612 e!113486)))

(declare-fun c!30810 () Bool)

(assert (=> d!52395 (= c!30810 lt!85611)))

(assert (=> d!52395 (= lt!85611 (containsKey!188 (toList!1096 lt!85239) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52395 (= (contains!1144 lt!85239 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) lt!85613)))

(declare-fun b!171975 () Bool)

(declare-fun lt!85614 () Unit!5252)

(assert (=> b!171975 (= e!113486 lt!85614)))

(assert (=> b!171975 (= lt!85614 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85239) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!171975 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85239) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171976 () Bool)

(declare-fun Unit!5297 () Unit!5252)

(assert (=> b!171976 (= e!113486 Unit!5297)))

(declare-fun b!171977 () Bool)

(assert (=> b!171977 (= e!113487 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85239) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52395 c!30810) b!171975))

(assert (= (and d!52395 (not c!30810)) b!171976))

(assert (= (and d!52395 (not res!81672)) b!171977))

(assert (=> d!52395 m!199241))

(declare-fun m!200955 () Bool)

(assert (=> d!52395 m!200955))

(assert (=> b!171975 m!199241))

(declare-fun m!200957 () Bool)

(assert (=> b!171975 m!200957))

(assert (=> b!171975 m!199241))

(declare-fun m!200959 () Bool)

(assert (=> b!171975 m!200959))

(assert (=> b!171975 m!200959))

(declare-fun m!200961 () Bool)

(assert (=> b!171975 m!200961))

(assert (=> b!171977 m!199241))

(assert (=> b!171977 m!200959))

(assert (=> b!171977 m!200959))

(assert (=> b!171977 m!200961))

(assert (=> b!171166 d!52395))

(declare-fun d!52397 () Bool)

(declare-fun res!81673 () Bool)

(declare-fun e!113488 () Bool)

(assert (=> d!52397 (=> res!81673 e!113488)))

(assert (=> d!52397 (= res!81673 (and ((_ is Cons!2189) (toList!1096 lt!85105)) (= (_1!1628 (h!2806 (toList!1096 lt!85105))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52397 (= (containsKey!188 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000) e!113488)))

(declare-fun b!171978 () Bool)

(declare-fun e!113489 () Bool)

(assert (=> b!171978 (= e!113488 e!113489)))

(declare-fun res!81674 () Bool)

(assert (=> b!171978 (=> (not res!81674) (not e!113489))))

(assert (=> b!171978 (= res!81674 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85105))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85105))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2189) (toList!1096 lt!85105)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85105))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!171979 () Bool)

(assert (=> b!171979 (= e!113489 (containsKey!188 (t!6995 (toList!1096 lt!85105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52397 (not res!81673)) b!171978))

(assert (= (and b!171978 res!81674) b!171979))

(declare-fun m!200963 () Bool)

(assert (=> b!171979 m!200963))

(assert (=> d!51799 d!52397))

(declare-fun d!52399 () Bool)

(assert (=> d!52399 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3914 (getValueByKey!184 (toList!1096 lt!85105) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51897 d!52399))

(assert (=> d!51897 d!52055))

(assert (=> b!171134 d!51833))

(declare-fun d!52401 () Bool)

(assert (=> d!52401 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85111) lt!85103)) (v!3914 (getValueByKey!184 (toList!1096 lt!85111) lt!85103)))))

(assert (=> d!51871 d!52401))

(declare-fun b!171981 () Bool)

(declare-fun e!113490 () Option!190)

(declare-fun e!113491 () Option!190)

(assert (=> b!171981 (= e!113490 e!113491)))

(declare-fun c!30812 () Bool)

(assert (=> b!171981 (= c!30812 (and ((_ is Cons!2189) (toList!1096 lt!85111)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85111))) lt!85103))))))

(declare-fun b!171982 () Bool)

(assert (=> b!171982 (= e!113491 (getValueByKey!184 (t!6995 (toList!1096 lt!85111)) lt!85103))))

(declare-fun d!52403 () Bool)

(declare-fun c!30811 () Bool)

(assert (=> d!52403 (= c!30811 (and ((_ is Cons!2189) (toList!1096 lt!85111)) (= (_1!1628 (h!2806 (toList!1096 lt!85111))) lt!85103)))))

(assert (=> d!52403 (= (getValueByKey!184 (toList!1096 lt!85111) lt!85103) e!113490)))

(declare-fun b!171983 () Bool)

(assert (=> b!171983 (= e!113491 None!188)))

(declare-fun b!171980 () Bool)

(assert (=> b!171980 (= e!113490 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85111)))))))

(assert (= (and d!52403 c!30811) b!171980))

(assert (= (and d!52403 (not c!30811)) b!171981))

(assert (= (and b!171981 c!30812) b!171982))

(assert (= (and b!171981 (not c!30812)) b!171983))

(declare-fun m!200965 () Bool)

(assert (=> b!171982 m!200965))

(assert (=> d!51871 d!52403))

(declare-fun b!171984 () Bool)

(declare-fun e!113493 () (_ BitVec 32))

(declare-fun call!17500 () (_ BitVec 32))

(assert (=> b!171984 (= e!113493 call!17500)))

(declare-fun b!171985 () Bool)

(declare-fun e!113492 () (_ BitVec 32))

(assert (=> b!171985 (= e!113492 #b00000000000000000000000000000000)))

(declare-fun b!171986 () Bool)

(assert (=> b!171986 (= e!113492 e!113493)))

(declare-fun c!30814 () Bool)

(assert (=> b!171986 (= c!30814 (validKeyInArray!0 (select (arr!3389 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!171987 () Bool)

(assert (=> b!171987 (= e!113493 (bvadd #b00000000000000000000000000000001 call!17500))))

(declare-fun bm!17497 () Bool)

(assert (=> bm!17497 (= call!17500 (arrayCountValidKeys!0 (_keys!5387 lt!85045) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3682 (_keys!5387 lt!85045))))))

(declare-fun d!52405 () Bool)

(declare-fun lt!85615 () (_ BitVec 32))

(assert (=> d!52405 (and (bvsge lt!85615 #b00000000000000000000000000000000) (bvsle lt!85615 (bvsub (size!3682 (_keys!5387 lt!85045)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!52405 (= lt!85615 e!113492)))

(declare-fun c!30813 () Bool)

(assert (=> d!52405 (= c!30813 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!52405 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 lt!85045))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3682 (_keys!5387 lt!85045)) (size!3682 (_keys!5387 lt!85045))))))

(assert (=> d!52405 (= (arrayCountValidKeys!0 (_keys!5387 lt!85045) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3682 (_keys!5387 lt!85045))) lt!85615)))

(assert (= (and d!52405 c!30813) b!171985))

(assert (= (and d!52405 (not c!30813)) b!171986))

(assert (= (and b!171986 c!30814) b!171987))

(assert (= (and b!171986 (not c!30814)) b!171984))

(assert (= (or b!171987 b!171984) bm!17497))

(assert (=> b!171986 m!200115))

(assert (=> b!171986 m!200115))

(assert (=> b!171986 m!200117))

(declare-fun m!200967 () Bool)

(assert (=> bm!17497 m!200967))

(assert (=> bm!17433 d!52405))

(declare-fun d!52407 () Bool)

(assert (=> d!52407 (= ($colon$colon!97 e!112946 (ite c!30545 (h!2806 (toList!1096 (map!1853 thiss!1248))) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309))))) (Cons!2189 (ite c!30545 (h!2806 (toList!1096 (map!1853 thiss!1248))) (tuple2!3235 (_1!1628 (tuple2!3235 key!828 v!309)) (_2!1628 (tuple2!3235 key!828 v!309)))) e!112946))))

(assert (=> bm!17421 d!52407))

(assert (=> b!171205 d!51993))

(assert (=> b!171205 d!51937))

(assert (=> d!51793 d!51795))

(assert (=> d!51793 d!51797))

(declare-fun d!52409 () Bool)

(assert (=> d!52409 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85043) key!828))))

(assert (=> d!52409 true))

(declare-fun _$12!443 () Unit!5252)

(assert (=> d!52409 (= (choose!923 (toList!1096 lt!85043) key!828) _$12!443)))

(declare-fun bs!7106 () Bool)

(assert (= bs!7106 d!52409))

(assert (=> bs!7106 m!199383))

(assert (=> bs!7106 m!199383))

(assert (=> bs!7106 m!199385))

(assert (=> d!51793 d!52409))

(declare-fun d!52411 () Bool)

(declare-fun res!81675 () Bool)

(declare-fun e!113494 () Bool)

(assert (=> d!52411 (=> res!81675 e!113494)))

(assert (=> d!52411 (= res!81675 (or ((_ is Nil!2190) (toList!1096 lt!85043)) ((_ is Nil!2190) (t!6995 (toList!1096 lt!85043)))))))

(assert (=> d!52411 (= (isStrictlySorted!331 (toList!1096 lt!85043)) e!113494)))

(declare-fun b!171988 () Bool)

(declare-fun e!113495 () Bool)

(assert (=> b!171988 (= e!113494 e!113495)))

(declare-fun res!81676 () Bool)

(assert (=> b!171988 (=> (not res!81676) (not e!113495))))

(assert (=> b!171988 (= res!81676 (bvslt (_1!1628 (h!2806 (toList!1096 lt!85043))) (_1!1628 (h!2806 (t!6995 (toList!1096 lt!85043))))))))

(declare-fun b!171989 () Bool)

(assert (=> b!171989 (= e!113495 (isStrictlySorted!331 (t!6995 (toList!1096 lt!85043))))))

(assert (= (and d!52411 (not res!81675)) b!171988))

(assert (= (and b!171988 res!81676) b!171989))

(declare-fun m!200969 () Bool)

(assert (=> b!171989 m!200969))

(assert (=> d!51793 d!52411))

(declare-fun d!52413 () Bool)

(assert (=> d!52413 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3914 (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!51857 d!52413))

(assert (=> d!51857 d!52121))

(assert (=> d!51925 d!51905))

(declare-fun d!52415 () Bool)

(declare-fun e!113497 () Bool)

(assert (=> d!52415 e!113497))

(declare-fun res!81677 () Bool)

(assert (=> d!52415 (=> res!81677 e!113497)))

(declare-fun lt!85618 () Bool)

(assert (=> d!52415 (= res!81677 (not lt!85618))))

(declare-fun lt!85616 () Bool)

(assert (=> d!52415 (= lt!85618 lt!85616)))

(declare-fun lt!85617 () Unit!5252)

(declare-fun e!113496 () Unit!5252)

(assert (=> d!52415 (= lt!85617 e!113496)))

(declare-fun c!30815 () Bool)

(assert (=> d!52415 (= c!30815 lt!85616)))

(assert (=> d!52415 (= lt!85616 (containsKey!188 (toList!1096 lt!85126) lt!85141))))

(assert (=> d!52415 (= (contains!1144 lt!85126 lt!85141) lt!85618)))

(declare-fun b!171990 () Bool)

(declare-fun lt!85619 () Unit!5252)

(assert (=> b!171990 (= e!113496 lt!85619)))

(assert (=> b!171990 (= lt!85619 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85126) lt!85141))))

(assert (=> b!171990 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85126) lt!85141))))

(declare-fun b!171991 () Bool)

(declare-fun Unit!5298 () Unit!5252)

(assert (=> b!171991 (= e!113496 Unit!5298)))

(declare-fun b!171992 () Bool)

(assert (=> b!171992 (= e!113497 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85126) lt!85141)))))

(assert (= (and d!52415 c!30815) b!171990))

(assert (= (and d!52415 (not c!30815)) b!171991))

(assert (= (and d!52415 (not res!81677)) b!171992))

(declare-fun m!200971 () Bool)

(assert (=> d!52415 m!200971))

(declare-fun m!200973 () Bool)

(assert (=> b!171990 m!200973))

(assert (=> b!171990 m!199803))

(assert (=> b!171990 m!199803))

(declare-fun m!200975 () Bool)

(assert (=> b!171990 m!200975))

(assert (=> b!171992 m!199803))

(assert (=> b!171992 m!199803))

(assert (=> b!171992 m!200975))

(assert (=> d!51925 d!52415))

(declare-fun d!52417 () Bool)

(assert (=> d!52417 (= (apply!129 (+!244 lt!85126 (tuple2!3235 lt!85132 (zeroValue!3398 thiss!1248))) lt!85141) (apply!129 lt!85126 lt!85141))))

(assert (=> d!52417 true))

(declare-fun _$34!1052 () Unit!5252)

(assert (=> d!52417 (= (choose!926 lt!85126 lt!85132 (zeroValue!3398 thiss!1248) lt!85141) _$34!1052)))

(declare-fun bs!7107 () Bool)

(assert (= bs!7107 d!52417))

(assert (=> bs!7107 m!199323))

(assert (=> bs!7107 m!199323))

(assert (=> bs!7107 m!199325))

(assert (=> bs!7107 m!199321))

(assert (=> d!51925 d!52417))

(assert (=> d!51925 d!51923))

(assert (=> d!51925 d!51927))

(declare-fun d!52419 () Bool)

(assert (=> d!52419 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85115) lt!85112)) (v!3914 (getValueByKey!184 (toList!1096 lt!85115) lt!85112)))))

(assert (=> d!51883 d!52419))

(declare-fun b!171994 () Bool)

(declare-fun e!113498 () Option!190)

(declare-fun e!113499 () Option!190)

(assert (=> b!171994 (= e!113498 e!113499)))

(declare-fun c!30817 () Bool)

(assert (=> b!171994 (= c!30817 (and ((_ is Cons!2189) (toList!1096 lt!85115)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85115))) lt!85112))))))

(declare-fun b!171995 () Bool)

(assert (=> b!171995 (= e!113499 (getValueByKey!184 (t!6995 (toList!1096 lt!85115)) lt!85112))))

(declare-fun d!52421 () Bool)

(declare-fun c!30816 () Bool)

(assert (=> d!52421 (= c!30816 (and ((_ is Cons!2189) (toList!1096 lt!85115)) (= (_1!1628 (h!2806 (toList!1096 lt!85115))) lt!85112)))))

(assert (=> d!52421 (= (getValueByKey!184 (toList!1096 lt!85115) lt!85112) e!113498)))

(declare-fun b!171996 () Bool)

(assert (=> b!171996 (= e!113499 None!188)))

(declare-fun b!171993 () Bool)

(assert (=> b!171993 (= e!113498 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85115)))))))

(assert (= (and d!52421 c!30816) b!171993))

(assert (= (and d!52421 (not c!30816)) b!171994))

(assert (= (and b!171994 c!30817) b!171995))

(assert (= (and b!171994 (not c!30817)) b!171996))

(declare-fun m!200977 () Bool)

(assert (=> b!171995 m!200977))

(assert (=> d!51883 d!52421))

(assert (=> b!171274 d!52031))

(declare-fun d!52423 () Bool)

(declare-fun res!81678 () Bool)

(declare-fun e!113500 () Bool)

(assert (=> d!52423 (=> res!81678 e!113500)))

(assert (=> d!52423 (= res!81678 (and ((_ is Cons!2189) lt!85156) (= (_1!1628 (h!2806 lt!85156)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52423 (= (containsKey!188 lt!85156 (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))) e!113500)))

(declare-fun b!171997 () Bool)

(declare-fun e!113501 () Bool)

(assert (=> b!171997 (= e!113500 e!113501)))

(declare-fun res!81679 () Bool)

(assert (=> b!171997 (=> (not res!81679) (not e!113501))))

(assert (=> b!171997 (= res!81679 (and (or (not ((_ is Cons!2189) lt!85156)) (bvsle (_1!1628 (h!2806 lt!85156)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2189) lt!85156) (bvslt (_1!1628 (h!2806 lt!85156)) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!171998 () Bool)

(assert (=> b!171998 (= e!113501 (containsKey!188 (t!6995 lt!85156) (_1!1628 (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52423 (not res!81678)) b!171997))

(assert (= (and b!171997 res!81679) b!171998))

(declare-fun m!200979 () Bool)

(assert (=> b!171998 m!200979))

(assert (=> b!171210 d!52423))

(declare-fun d!52425 () Bool)

(assert (=> d!52425 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!85620 () Unit!5252)

(assert (=> d!52425 (= lt!85620 (choose!923 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113502 () Bool)

(assert (=> d!52425 e!113502))

(declare-fun res!81680 () Bool)

(assert (=> d!52425 (=> (not res!81680) (not e!113502))))

(assert (=> d!52425 (= res!81680 (isStrictlySorted!331 (toList!1096 lt!85105)))))

(assert (=> d!52425 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) lt!85620)))

(declare-fun b!171999 () Bool)

(assert (=> b!171999 (= e!113502 (containsKey!188 (toList!1096 lt!85105) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52425 res!81680) b!171999))

(assert (=> d!52425 m!199241))

(assert (=> d!52425 m!199471))

(assert (=> d!52425 m!199471))

(assert (=> d!52425 m!199473))

(assert (=> d!52425 m!199241))

(declare-fun m!200981 () Bool)

(assert (=> d!52425 m!200981))

(assert (=> d!52425 m!200083))

(assert (=> b!171999 m!199241))

(assert (=> b!171999 m!199467))

(assert (=> b!171105 d!52425))

(assert (=> b!171105 d!52213))

(assert (=> b!171105 d!52215))

(declare-fun d!52427 () Bool)

(assert (=> d!52427 (= (apply!129 lt!85239 (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000)) (get!1939 (getValueByKey!184 (toList!1096 lt!85239) (select (arr!3389 (_keys!5387 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7108 () Bool)

(assert (= bs!7108 d!52427))

(assert (=> bs!7108 m!199241))

(assert (=> bs!7108 m!200959))

(assert (=> bs!7108 m!200959))

(declare-fun m!200983 () Bool)

(assert (=> bs!7108 m!200983))

(assert (=> b!171170 d!52427))

(assert (=> b!171170 d!51851))

(declare-fun d!52429 () Bool)

(declare-fun res!81681 () Bool)

(declare-fun e!113503 () Bool)

(assert (=> d!52429 (=> res!81681 e!113503)))

(assert (=> d!52429 (= res!81681 (and ((_ is Cons!2189) (toList!1096 lt!85171)) (= (_1!1628 (h!2806 (toList!1096 lt!85171))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(assert (=> d!52429 (= (containsKey!188 (toList!1096 lt!85171) (_1!1628 (tuple2!3235 key!828 v!309))) e!113503)))

(declare-fun b!172000 () Bool)

(declare-fun e!113504 () Bool)

(assert (=> b!172000 (= e!113503 e!113504)))

(declare-fun res!81682 () Bool)

(assert (=> b!172000 (=> (not res!81682) (not e!113504))))

(assert (=> b!172000 (= res!81682 (and (or (not ((_ is Cons!2189) (toList!1096 lt!85171))) (bvsle (_1!1628 (h!2806 (toList!1096 lt!85171))) (_1!1628 (tuple2!3235 key!828 v!309)))) ((_ is Cons!2189) (toList!1096 lt!85171)) (bvslt (_1!1628 (h!2806 (toList!1096 lt!85171))) (_1!1628 (tuple2!3235 key!828 v!309)))))))

(declare-fun b!172001 () Bool)

(assert (=> b!172001 (= e!113504 (containsKey!188 (t!6995 (toList!1096 lt!85171)) (_1!1628 (tuple2!3235 key!828 v!309))))))

(assert (= (and d!52429 (not res!81681)) b!172000))

(assert (= (and b!172000 res!81682) b!172001))

(declare-fun m!200985 () Bool)

(assert (=> b!172001 m!200985))

(assert (=> d!51803 d!52429))

(assert (=> b!171278 d!52031))

(declare-fun lt!85621 () Bool)

(declare-fun d!52431 () Bool)

(assert (=> d!52431 (= lt!85621 (select (content!147 (toList!1096 lt!85291)) (tuple2!3235 lt!85107 v!309)))))

(declare-fun e!113506 () Bool)

(assert (=> d!52431 (= lt!85621 e!113506)))

(declare-fun res!81683 () Bool)

(assert (=> d!52431 (=> (not res!81683) (not e!113506))))

(assert (=> d!52431 (= res!81683 ((_ is Cons!2189) (toList!1096 lt!85291)))))

(assert (=> d!52431 (= (contains!1146 (toList!1096 lt!85291) (tuple2!3235 lt!85107 v!309)) lt!85621)))

(declare-fun b!172002 () Bool)

(declare-fun e!113505 () Bool)

(assert (=> b!172002 (= e!113506 e!113505)))

(declare-fun res!81684 () Bool)

(assert (=> b!172002 (=> res!81684 e!113505)))

(assert (=> b!172002 (= res!81684 (= (h!2806 (toList!1096 lt!85291)) (tuple2!3235 lt!85107 v!309)))))

(declare-fun b!172003 () Bool)

(assert (=> b!172003 (= e!113505 (contains!1146 (t!6995 (toList!1096 lt!85291)) (tuple2!3235 lt!85107 v!309)))))

(assert (= (and d!52431 res!81683) b!172002))

(assert (= (and b!172002 (not res!81684)) b!172003))

(declare-fun m!200987 () Bool)

(assert (=> d!52431 m!200987))

(declare-fun m!200989 () Bool)

(assert (=> d!52431 m!200989))

(declare-fun m!200991 () Bool)

(assert (=> b!172003 m!200991))

(assert (=> b!171283 d!52431))

(declare-fun d!52433 () Bool)

(declare-fun c!30818 () Bool)

(assert (=> d!52433 (= c!30818 ((_ is Nil!2190) (toList!1096 lt!85155)))))

(declare-fun e!113507 () (InoxSet tuple2!3234))

(assert (=> d!52433 (= (content!147 (toList!1096 lt!85155)) e!113507)))

(declare-fun b!172004 () Bool)

(assert (=> b!172004 (= e!113507 ((as const (Array tuple2!3234 Bool)) false))))

(declare-fun b!172005 () Bool)

(assert (=> b!172005 (= e!113507 ((_ map or) (store ((as const (Array tuple2!3234 Bool)) false) (h!2806 (toList!1096 lt!85155)) true) (content!147 (t!6995 (toList!1096 lt!85155)))))))

(assert (= (and d!52433 c!30818) b!172004))

(assert (= (and d!52433 (not c!30818)) b!172005))

(declare-fun m!200993 () Bool)

(assert (=> b!172005 m!200993))

(assert (=> b!172005 m!199931))

(assert (=> d!51899 d!52433))

(assert (=> bm!17426 d!52285))

(declare-fun d!52435 () Bool)

(assert (=> d!52435 (= (get!1939 (getValueByKey!184 (toList!1096 lt!85126) lt!85141)) (v!3914 (getValueByKey!184 (toList!1096 lt!85126) lt!85141)))))

(assert (=> d!51905 d!52435))

(declare-fun b!172007 () Bool)

(declare-fun e!113508 () Option!190)

(declare-fun e!113509 () Option!190)

(assert (=> b!172007 (= e!113508 e!113509)))

(declare-fun c!30820 () Bool)

(assert (=> b!172007 (= c!30820 (and ((_ is Cons!2189) (toList!1096 lt!85126)) (not (= (_1!1628 (h!2806 (toList!1096 lt!85126))) lt!85141))))))

(declare-fun b!172008 () Bool)

(assert (=> b!172008 (= e!113509 (getValueByKey!184 (t!6995 (toList!1096 lt!85126)) lt!85141))))

(declare-fun d!52437 () Bool)

(declare-fun c!30819 () Bool)

(assert (=> d!52437 (= c!30819 (and ((_ is Cons!2189) (toList!1096 lt!85126)) (= (_1!1628 (h!2806 (toList!1096 lt!85126))) lt!85141)))))

(assert (=> d!52437 (= (getValueByKey!184 (toList!1096 lt!85126) lt!85141) e!113508)))

(declare-fun b!172009 () Bool)

(assert (=> b!172009 (= e!113509 None!188)))

(declare-fun b!172006 () Bool)

(assert (=> b!172006 (= e!113508 (Some!189 (_2!1628 (h!2806 (toList!1096 lt!85126)))))))

(assert (= (and d!52437 c!30819) b!172006))

(assert (= (and d!52437 (not c!30819)) b!172007))

(assert (= (and b!172007 c!30820) b!172008))

(assert (= (and b!172007 (not c!30820)) b!172009))

(declare-fun m!200995 () Bool)

(assert (=> b!172008 m!200995))

(assert (=> d!51905 d!52437))

(assert (=> b!171146 d!52207))

(assert (=> b!171146 d!52209))

(declare-fun d!52439 () Bool)

(declare-fun e!113511 () Bool)

(assert (=> d!52439 e!113511))

(declare-fun res!81685 () Bool)

(assert (=> d!52439 (=> res!81685 e!113511)))

(declare-fun lt!85624 () Bool)

(assert (=> d!52439 (= res!81685 (not lt!85624))))

(declare-fun lt!85622 () Bool)

(assert (=> d!52439 (= lt!85624 lt!85622)))

(declare-fun lt!85623 () Unit!5252)

(declare-fun e!113510 () Unit!5252)

(assert (=> d!52439 (= lt!85623 e!113510)))

(declare-fun c!30821 () Bool)

(assert (=> d!52439 (= c!30821 lt!85622)))

(assert (=> d!52439 (= lt!85622 (containsKey!188 (toList!1096 lt!85255) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> d!52439 (= (contains!1144 lt!85255 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) lt!85624)))

(declare-fun b!172010 () Bool)

(declare-fun lt!85625 () Unit!5252)

(assert (=> b!172010 (= e!113510 lt!85625)))

(assert (=> b!172010 (= lt!85625 (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85255) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(assert (=> b!172010 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85255) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!172011 () Bool)

(declare-fun Unit!5299 () Unit!5252)

(assert (=> b!172011 (= e!113510 Unit!5299)))

(declare-fun b!172012 () Bool)

(assert (=> b!172012 (= e!113511 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85255) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (= (and d!52439 c!30821) b!172010))

(assert (= (and d!52439 (not c!30821)) b!172011))

(assert (= (and d!52439 (not res!81685)) b!172012))

(declare-fun m!200997 () Bool)

(assert (=> d!52439 m!200997))

(declare-fun m!200999 () Bool)

(assert (=> b!172010 m!200999))

(assert (=> b!172010 m!199567))

(assert (=> b!172010 m!199567))

(declare-fun m!201001 () Bool)

(assert (=> b!172010 m!201001))

(assert (=> b!172012 m!199567))

(assert (=> b!172012 m!199567))

(assert (=> b!172012 m!201001))

(assert (=> d!51837 d!52439))

(declare-fun b!172014 () Bool)

(declare-fun e!113512 () Option!190)

(declare-fun e!113513 () Option!190)

(assert (=> b!172014 (= e!113512 e!113513)))

(declare-fun c!30823 () Bool)

(assert (=> b!172014 (= c!30823 (and ((_ is Cons!2189) lt!85256) (not (= (_1!1628 (h!2806 lt!85256)) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))))

(declare-fun b!172015 () Bool)

(assert (=> b!172015 (= e!113513 (getValueByKey!184 (t!6995 lt!85256) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun d!52441 () Bool)

(declare-fun c!30822 () Bool)

(assert (=> d!52441 (= c!30822 (and ((_ is Cons!2189) lt!85256) (= (_1!1628 (h!2806 lt!85256)) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (=> d!52441 (= (getValueByKey!184 lt!85256 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) e!113512)))

(declare-fun b!172016 () Bool)

(assert (=> b!172016 (= e!113513 None!188)))

(declare-fun b!172013 () Bool)

(assert (=> b!172013 (= e!113512 (Some!189 (_2!1628 (h!2806 lt!85256))))))

(assert (= (and d!52441 c!30822) b!172013))

(assert (= (and d!52441 (not c!30822)) b!172014))

(assert (= (and b!172014 c!30823) b!172015))

(assert (= (and b!172014 (not c!30823)) b!172016))

(declare-fun m!201003 () Bool)

(assert (=> b!172015 m!201003))

(assert (=> d!51837 d!52441))

(declare-fun d!52443 () Bool)

(assert (=> d!52443 (= (getValueByKey!184 lt!85256 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) (Some!189 (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun lt!85626 () Unit!5252)

(assert (=> d!52443 (= lt!85626 (choose!924 lt!85256 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun e!113514 () Bool)

(assert (=> d!52443 e!113514))

(declare-fun res!81686 () Bool)

(assert (=> d!52443 (=> (not res!81686) (not e!113514))))

(assert (=> d!52443 (= res!81686 (isStrictlySorted!331 lt!85256))))

(assert (=> d!52443 (= (lemmaContainsTupThenGetReturnValue!97 lt!85256 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) lt!85626)))

(declare-fun b!172017 () Bool)

(declare-fun res!81687 () Bool)

(assert (=> b!172017 (=> (not res!81687) (not e!113514))))

(assert (=> b!172017 (= res!81687 (containsKey!188 lt!85256 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!172018 () Bool)

(assert (=> b!172018 (= e!113514 (contains!1146 lt!85256 (tuple2!3235 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (= (and d!52443 res!81686) b!172017))

(assert (= (and b!172017 res!81687) b!172018))

(assert (=> d!52443 m!199561))

(declare-fun m!201005 () Bool)

(assert (=> d!52443 m!201005))

(declare-fun m!201007 () Bool)

(assert (=> d!52443 m!201007))

(declare-fun m!201009 () Bool)

(assert (=> b!172017 m!201009))

(declare-fun m!201011 () Bool)

(assert (=> b!172018 m!201011))

(assert (=> d!51837 d!52443))

(declare-fun b!172019 () Bool)

(declare-fun e!113515 () List!2193)

(declare-fun call!17502 () List!2193)

(assert (=> b!172019 (= e!113515 call!17502)))

(declare-fun b!172020 () Bool)

(declare-fun res!81689 () Bool)

(declare-fun e!113519 () Bool)

(assert (=> b!172020 (=> (not res!81689) (not e!113519))))

(declare-fun lt!85627 () List!2193)

(assert (=> b!172020 (= res!81689 (containsKey!188 lt!85627 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun b!172021 () Bool)

(declare-fun e!113518 () List!2193)

(declare-fun e!113516 () List!2193)

(assert (=> b!172021 (= e!113518 e!113516)))

(declare-fun c!30825 () Bool)

(assert (=> b!172021 (= c!30825 (and ((_ is Cons!2189) (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)))) (= (_1!1628 (h!2806 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414))))) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun c!30826 () Bool)

(declare-fun b!172022 () Bool)

(declare-fun e!113517 () List!2193)

(assert (=> b!172022 (= e!113517 (ite c!30825 (t!6995 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)))) (ite c!30826 (Cons!2189 (h!2806 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)))) (t!6995 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414))))) Nil!2190)))))

(declare-fun b!172023 () Bool)

(assert (=> b!172023 (= e!113519 (contains!1146 lt!85627 (tuple2!3235 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(declare-fun b!172024 () Bool)

(declare-fun call!17501 () List!2193)

(assert (=> b!172024 (= e!113518 call!17501)))

(declare-fun c!30827 () Bool)

(declare-fun bm!17498 () Bool)

(assert (=> bm!17498 (= call!17501 ($colon$colon!97 e!113517 (ite c!30827 (h!2806 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)))) (tuple2!3235 (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))))

(declare-fun c!30824 () Bool)

(assert (=> bm!17498 (= c!30824 c!30827)))

(declare-fun bm!17500 () Bool)

(declare-fun call!17503 () List!2193)

(assert (=> bm!17500 (= call!17502 call!17503)))

(declare-fun b!172025 () Bool)

(assert (=> b!172025 (= e!113516 call!17503)))

(declare-fun b!172026 () Bool)

(assert (=> b!172026 (= e!113515 call!17502)))

(declare-fun b!172027 () Bool)

(assert (=> b!172027 (= c!30826 (and ((_ is Cons!2189) (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)))) (bvsgt (_1!1628 (h!2806 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414))))) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (=> b!172027 (= e!113516 e!113515)))

(declare-fun b!172028 () Bool)

(assert (=> b!172028 (= e!113517 (insertStrictlySorted!100 (t!6995 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)))) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))))))

(declare-fun bm!17499 () Bool)

(assert (=> bm!17499 (= call!17503 call!17501)))

(declare-fun d!52445 () Bool)

(assert (=> d!52445 e!113519))

(declare-fun res!81688 () Bool)

(assert (=> d!52445 (=> (not res!81688) (not e!113519))))

(assert (=> d!52445 (= res!81688 (isStrictlySorted!331 lt!85627))))

(assert (=> d!52445 (= lt!85627 e!113518)))

(assert (=> d!52445 (= c!30827 (and ((_ is Cons!2189) (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414)))) (bvslt (_1!1628 (h!2806 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414))))) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))))))))

(assert (=> d!52445 (isStrictlySorted!331 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414))))))

(assert (=> d!52445 (= (insertStrictlySorted!100 (toList!1096 (ite c!30518 call!17411 (ite c!30516 call!17415 call!17414))) (_1!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248)))) (_2!1628 (ite (or c!30518 c!30516) (tuple2!3235 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3398 thiss!1248)) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 thiss!1248))))) lt!85627)))

(assert (= (and d!52445 c!30827) b!172024))

(assert (= (and d!52445 (not c!30827)) b!172021))

(assert (= (and b!172021 c!30825) b!172025))

(assert (= (and b!172021 (not c!30825)) b!172027))

(assert (= (and b!172027 c!30826) b!172026))

(assert (= (and b!172027 (not c!30826)) b!172019))

(assert (= (or b!172026 b!172019) bm!17500))

(assert (= (or b!172025 bm!17500) bm!17499))

(assert (= (or b!172024 bm!17499) bm!17498))

(assert (= (and bm!17498 c!30824) b!172028))

(assert (= (and bm!17498 (not c!30824)) b!172022))

(assert (= (and d!52445 res!81688) b!172020))

(assert (= (and b!172020 res!81689) b!172023))

(declare-fun m!201013 () Bool)

(assert (=> b!172020 m!201013))

(declare-fun m!201015 () Bool)

(assert (=> d!52445 m!201015))

(declare-fun m!201017 () Bool)

(assert (=> d!52445 m!201017))

(declare-fun m!201019 () Bool)

(assert (=> b!172028 m!201019))

(declare-fun m!201021 () Bool)

(assert (=> b!172023 m!201021))

(declare-fun m!201023 () Bool)

(assert (=> bm!17498 m!201023))

(assert (=> d!51837 d!52445))

(assert (=> d!51855 d!51801))

(declare-fun d!52447 () Bool)

(assert (=> d!52447 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85628 () Unit!5252)

(assert (=> d!52447 (= lt!85628 (choose!923 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113520 () Bool)

(assert (=> d!52447 e!113520))

(declare-fun res!81690 () Bool)

(assert (=> d!52447 (=> (not res!81690) (not e!113520))))

(assert (=> d!52447 (= res!81690 (isStrictlySorted!331 (toList!1096 lt!85130)))))

(assert (=> d!52447 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000) lt!85628)))

(declare-fun b!172029 () Bool)

(assert (=> b!172029 (= e!113520 (containsKey!188 (toList!1096 lt!85130) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52447 res!81690) b!172029))

(assert (=> d!52447 m!199463))

(assert (=> d!52447 m!199463))

(assert (=> d!52447 m!199465))

(declare-fun m!201025 () Bool)

(assert (=> d!52447 m!201025))

(assert (=> d!52447 m!200487))

(assert (=> b!172029 m!199459))

(assert (=> b!171102 d!52447))

(assert (=> b!171102 d!52117))

(assert (=> b!171102 d!51963))

(declare-fun d!52449 () Bool)

(assert (=> d!52449 (isDefined!137 (getValueByKey!184 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!85629 () Unit!5252)

(assert (=> d!52449 (= lt!85629 (choose!923 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!113521 () Bool)

(assert (=> d!52449 e!113521))

(declare-fun res!81691 () Bool)

(assert (=> d!52449 (=> (not res!81691) (not e!113521))))

(assert (=> d!52449 (= res!81691 (isStrictlySorted!331 (toList!1096 lt!85105)))))

(assert (=> d!52449 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!136 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000) lt!85629)))

(declare-fun b!172030 () Bool)

(assert (=> b!172030 (= e!113521 (containsKey!188 (toList!1096 lt!85105) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52449 res!81691) b!172030))

(assert (=> d!52449 m!199427))

(assert (=> d!52449 m!199427))

(assert (=> d!52449 m!199429))

(declare-fun m!201027 () Bool)

(assert (=> d!52449 m!201027))

(assert (=> d!52449 m!200083))

(assert (=> b!172030 m!199423))

(assert (=> b!171056 d!52449))

(assert (=> b!171056 d!52119))

(assert (=> b!171056 d!52121))

(declare-fun d!52451 () Bool)

(declare-fun e!113522 () Bool)

(assert (=> d!52451 e!113522))

(declare-fun res!81692 () Bool)

(assert (=> d!52451 (=> (not res!81692) (not e!113522))))

(declare-fun lt!85631 () ListLongMap!2161)

(assert (=> d!52451 (= res!81692 (contains!1144 lt!85631 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))))))

(declare-fun lt!85632 () List!2193)

(assert (=> d!52451 (= lt!85631 (ListLongMap!2162 lt!85632))))

(declare-fun lt!85633 () Unit!5252)

(declare-fun lt!85630 () Unit!5252)

(assert (=> d!52451 (= lt!85633 lt!85630)))

(assert (=> d!52451 (= (getValueByKey!184 lt!85632 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))))))

(assert (=> d!52451 (= lt!85630 (lemmaContainsTupThenGetReturnValue!97 lt!85632 (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))))))

(assert (=> d!52451 (= lt!85632 (insertStrictlySorted!100 (toList!1096 call!17445) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))) (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))))))

(assert (=> d!52451 (= (+!244 call!17445 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))) lt!85631)))

(declare-fun b!172031 () Bool)

(declare-fun res!81693 () Bool)

(assert (=> b!172031 (=> (not res!81693) (not e!113522))))

(assert (=> b!172031 (= res!81693 (= (getValueByKey!184 (toList!1096 lt!85631) (_1!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045)))) (Some!189 (_2!1628 (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))))))

(declare-fun b!172032 () Bool)

(assert (=> b!172032 (= e!113522 (contains!1146 (toList!1096 lt!85631) (tuple2!3235 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3398 lt!85045))))))

(assert (= (and d!52451 res!81692) b!172031))

(assert (= (and b!172031 res!81693) b!172032))

(declare-fun m!201029 () Bool)

(assert (=> d!52451 m!201029))

(declare-fun m!201031 () Bool)

(assert (=> d!52451 m!201031))

(declare-fun m!201033 () Bool)

(assert (=> d!52451 m!201033))

(declare-fun m!201035 () Bool)

(assert (=> d!52451 m!201035))

(declare-fun m!201037 () Bool)

(assert (=> b!172031 m!201037))

(declare-fun m!201039 () Bool)

(assert (=> b!172032 m!201039))

(assert (=> b!171265 d!52451))

(declare-fun condMapEmpty!6808 () Bool)

(declare-fun mapDefault!6808 () ValueCell!1659)

(assert (=> mapNonEmpty!6807 (= condMapEmpty!6808 (= mapRest!6807 ((as const (Array (_ BitVec 32) ValueCell!1659)) mapDefault!6808)))))

(declare-fun e!113524 () Bool)

(declare-fun mapRes!6808 () Bool)

(assert (=> mapNonEmpty!6807 (= tp!15339 (and e!113524 mapRes!6808))))

(declare-fun b!172034 () Bool)

(assert (=> b!172034 (= e!113524 tp_is_empty!4005)))

(declare-fun b!172033 () Bool)

(declare-fun e!113523 () Bool)

(assert (=> b!172033 (= e!113523 tp_is_empty!4005)))

(declare-fun mapNonEmpty!6808 () Bool)

(declare-fun tp!15340 () Bool)

(assert (=> mapNonEmpty!6808 (= mapRes!6808 (and tp!15340 e!113523))))

(declare-fun mapRest!6808 () (Array (_ BitVec 32) ValueCell!1659))

(declare-fun mapKey!6808 () (_ BitVec 32))

(declare-fun mapValue!6808 () ValueCell!1659)

(assert (=> mapNonEmpty!6808 (= mapRest!6807 (store mapRest!6808 mapKey!6808 mapValue!6808))))

(declare-fun mapIsEmpty!6808 () Bool)

(assert (=> mapIsEmpty!6808 mapRes!6808))

(assert (= (and mapNonEmpty!6807 condMapEmpty!6808) mapIsEmpty!6808))

(assert (= (and mapNonEmpty!6807 (not condMapEmpty!6808)) mapNonEmpty!6808))

(assert (= (and mapNonEmpty!6808 ((_ is ValueCellFull!1659) mapValue!6808)) b!172033))

(assert (= (and mapNonEmpty!6807 ((_ is ValueCellFull!1659) mapDefault!6808)) b!172034))

(declare-fun m!201041 () Bool)

(assert (=> mapNonEmpty!6808 m!201041))

(declare-fun b_lambda!6925 () Bool)

(assert (= b_lambda!6923 (or (and b!170884 b_free!4233) b_lambda!6925)))

(declare-fun b_lambda!6927 () Bool)

(assert (= b_lambda!6917 (or (and b!170884 b_free!4233) b_lambda!6927)))

(declare-fun b_lambda!6929 () Bool)

(assert (= b_lambda!6903 (or (and b!170884 b_free!4233 (= (defaultEntry!3555 thiss!1248) (defaultEntry!3555 lt!85045))) b_lambda!6929)))

(declare-fun b_lambda!6931 () Bool)

(assert (= b_lambda!6919 (or (and b!170884 b_free!4233) b_lambda!6931)))

(declare-fun b_lambda!6933 () Bool)

(assert (= b_lambda!6921 (or (and b!170884 b_free!4233) b_lambda!6933)))

(check-sat (not d!52189) (not b!171605) (not d!52327) (not b_lambda!6905) (not b!171969) (not b!171435) (not d!52067) (not b_next!4233) (not d!52133) (not bm!17464) (not b!171595) (not d!52089) (not b!171689) (not b!171869) (not b!171642) (not b!171753) (not b!171624) (not b_lambda!6907) (not b!171924) (not b!171795) (not b!171702) (not b!171382) (not b!171837) (not b_lambda!6933) (not d!52171) (not b!171922) (not d!52057) (not d!52375) (not b!171434) (not b_lambda!6931) (not b!171455) (not b!171587) (not b!171437) (not b!171842) (not d!52409) (not b!171871) (not b!171677) (not bm!17470) (not b!171816) (not b!171582) (not b!171874) (not b!171829) (not d!51951) (not b!171817) (not bm!17471) (not d!52113) (not b!171464) (not b!171892) (not b!171797) (not b!171938) (not d!52143) (not b!171448) (not b!171686) (not b!171826) (not b!171445) (not bm!17484) (not b!171782) (not b!171372) (not bm!17453) (not b!171659) (not b!171387) (not b!171972) (not b!171566) (not d!52199) (not b!171937) (not bm!17494) (not b!171576) (not b!171623) (not b!171789) (not b!171906) (not d!52323) (not b!171918) (not b!171707) (not b!172023) (not b!171735) (not d!52077) (not b!171756) (not b_lambda!6893) (not d!51959) (not d!52343) (not b!171929) (not b!171629) (not b!171517) (not d!52013) (not b!171620) (not d!52083) (not b!171416) (not b!171787) (not b!171407) (not d!52175) (not b!171964) (not d!52027) (not b!171597) (not d!52247) (not d!52103) (not d!52445) (not d!52273) (not b!171523) (not d!52099) (not d!52145) (not b!172010) (not b!171522) (not d!52149) (not d!52141) (not b!171910) (not b!171786) (not b!171613) (not d!52361) (not b!171866) (not d!52151) (not d!52107) (not b!171571) (not b!171515) (not b!171754) (not d!52071) (not b!171823) (not b!171654) (not d!52003) (not d!52127) (not b!171427) (not bm!17480) (not b!171404) (not d!52053) (not b!171974) (not b!171713) (not d!52239) (not d!52339) (not b!171897) (not d!52153) (not b!171471) (not b!171577) (not d!52093) (not b!171568) (not b!171966) (not b!171413) (not b!171834) (not b!171525) (not b!171879) (not b!171858) (not b!171579) (not b!171514) (not d!52097) (not d!52249) (not d!52389) (not d!52309) (not d!52219) (not bm!17487) (not b!171415) (not b!171744) (not b!171495) (not b!171349) (not d!52355) (not b!171500) (not d!52395) (not b!172008) (not b!171845) (not b!171766) (not d!52017) (not b!171862) (not b!171769) (not b!171673) (not b!171868) (not bm!17458) (not d!51997) (not b!171355) (not b!171631) (not d!52063) (not b!171666) (not b!171779) (not b!171584) (not d!52321) (not b_lambda!6913) (not b!171975) (not b!171626) (not b!171489) (not b!171900) (not b!171992) (not d!52293) (not b!172018) (not b!171682) (not b!171887) (not b!171486) (not b!171663) (not b!171824) (not b!171721) (not b!171652) (not b!171948) (not bm!17450) (not b!171690) (not b!171995) (not b!171603) (not d!52311) (not b!171921) (not b!171853) (not b!171882) (not b!171849) (not b!171893) (not b!171750) (not b!171725) (not d!52393) (not d!52305) (not b!171479) (not d!52269) (not d!52285) (not b!171905) (not bm!17498) (not b!171469) (not d!52157) (not b!171611) (not b!171485) (not d!52117) (not b_lambda!6927) (not b!171476) (not b!171982) (not d!52005) (not d!52427) (not b!171889) (not d!52385) (not b!171607) (not b!171528) (not b!171895) (not d!52155) (not b!171665) (not d!52061) (not d!52347) (not b!171860) (not d!52329) (not b!171343) (not b!171369) (not d!52301) (not d!52265) (not d!52263) (not b!171774) (not b!171533) (not d!52043) (not b!171511) (not bm!17475) (not b!172020) (not b!171794) (not bm!17474) (not b!171998) (not d!52177) (not d!52111) (not b!171805) (not bm!17457) (not b!171609) (not b_lambda!6909) (not d!52207) (not d!52179) (not d!52417) (not b!171792) (not b!171752) (not b!171901) (not d!52331) (not d!52325) (not d!52349) (not b!171503) (not b!171410) (not d!52333) (not b!171650) (not b!171474) (not b!171940) (not d!52123) (not b!172028) (not b!171934) (not d!52137) (not b!171967) (not b!171999) (not b!171854) (not d!52011) (not b!172030) (not d!52341) (not b!171956) (not b!171418) (not b!171819) (not d!52279) (not d!52009) (not b!172032) (not bm!17461) (not b!171784) (not d!52371) (not b!171931) (not d!52119) (not b!171728) (not b!171864) (not b!171632) (not d!52187) (not d!51991) (not b!171876) (not b!171977) (not b!171590) (not d!52377) (not d!52443) (not d!52303) (not b!171759) (not b!171497) (not b!171899) (not d!52337) (not bm!17456) (not b!171565) (not b!171684) (not b!171951) (not b!171366) (not b!171482) (not d!52205) (not d!52275) (not b!171408) (not b!171492) (not d!52313) (not b!171678) (not b!171945) (not d!52183) (not d!52213) (not b!171912) (not d!52125) (not b!171520) (not b!171990) (not b!171818) (not bm!17479) (not d!52315) (not b!171358) (not d!52439) (not b!171741) (not d!52085) (not b!171708) (not b!171680) (not d!52391) (not b!171877) (not b!171552) (not d!52351) (not b!171648) (not b!171821) (not b!171979) (not b!171928) (not b!171450) (not b!171971) (not b!171913) (not d!52243) (not b!171705) (not b!171399) (not b!171617) (not b!171755) (not b!171375) (not b!171694) (not b!171585) (not b!171461) (not b!172005) (not b!171926) (not d!52203) (not b!171808) (not b!171718) (not b!171927) (not b!171490) (not d!52451) (not d!52297) (not d!52167) (not b!171352) (not b!171610) (not b!171710) (not b!171604) (not b!171738) (not b!171699) (not d!52169) (not b!171962) (not bm!17490) (not d!52231) (not b!171384) (not d!52019) (not d!52241) (not b!171637) (not d!52259) (not b!172001) (not b!172012) (not b!171346) (not d!52261) (not b!171852) (not b!171959) (not b!171890) (not b!171401) (not b_lambda!6929) (not b!171600) (not b!171800) (not d!52075) (not d!52291) (not b_lambda!6925) (not d!52025) b_and!10675 (not b!171943) (not b!171426) (not b!171908) (not b!172029) (not b_lambda!6891) (not d!52049) (not b!171558) (not b!171903) (not d!52091) (not b!172017) (not b!171986) (not d!52221) (not d!52223) (not d!52197) (not b!171393) (not b!171683) (not b!171697) (not d!52449) (not d!52335) (not b!171700) (not d!51955) (not b!172031) (not d!52369) (not b!171360) (not b!171429) (not b!171811) (not b!171563) (not b!171634) (not d!52105) (not bm!17491) (not b!171695) (not d!52047) tp_is_empty!4005 (not b!172015) (not mapNonEmpty!6808) (not b!171771) (not b!171615) (not b!171655) (not d!52051) (not d!52217) (not b!171902) (not b!171560) (not b!171440) (not b!171498) (not b!171432) (not d!52319) (not bm!17467) (not d!52181) (not b!171669) (not b!171657) (not b!171363) (not b!171915) (not b!171729) (not b!171453) (not b!171859) (not d!52353) (not b!171692) (not d!52425) (not b!171508) (not b!172003) (not b!171763) (not b!171856) (not bm!17497) (not b!171477) (not d!52447) (not d!52307) (not b!171946) (not d!52431) (not b!171688) (not b!171539) (not b!171675) (not b!171832) (not b!171391) (not b_lambda!6915) (not b!171768) (not b!171421) (not d!52159) (not d!52317) (not b_lambda!6911) (not b!171661) (not d!52299) (not b!171814) (not d!51993) (not bm!17476) (not d!52211) (not b!171920) (not b!171989) (not bm!17481) (not b!171458) (not d!52039) (not b!171909) (not d!52415) (not b!171466))
(check-sat b_and!10675 (not b_next!4233))
