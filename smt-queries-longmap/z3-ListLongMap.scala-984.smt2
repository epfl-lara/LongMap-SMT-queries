; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21246 () Bool)

(assert start!21246)

(declare-fun b!214089 () Bool)

(declare-fun b_free!5653 () Bool)

(declare-fun b_next!5653 () Bool)

(assert (=> b!214089 (= b_free!5653 (not b_next!5653))))

(declare-fun tp!20035 () Bool)

(declare-fun b_and!12557 () Bool)

(assert (=> b!214089 (= tp!20035 b_and!12557)))

(declare-fun b!214088 () Bool)

(declare-fun e!139197 () Bool)

(declare-fun tp_is_empty!5515 () Bool)

(assert (=> b!214088 (= e!139197 tp_is_empty!5515)))

(declare-datatypes ((V!7001 0))(
  ( (V!7002 (val!2802 Int)) )
))
(declare-datatypes ((ValueCell!2414 0))(
  ( (ValueCellFull!2414 (v!4821 V!7001)) (EmptyCell!2414) )
))
(declare-datatypes ((array!10233 0))(
  ( (array!10234 (arr!4855 (Array (_ BitVec 32) ValueCell!2414)) (size!5180 (_ BitVec 32))) )
))
(declare-datatypes ((array!10235 0))(
  ( (array!10236 (arr!4856 (Array (_ BitVec 32) (_ BitVec 64))) (size!5181 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2728 0))(
  ( (LongMapFixedSize!2729 (defaultEntry!4014 Int) (mask!9662 (_ BitVec 32)) (extraKeys!3751 (_ BitVec 32)) (zeroValue!3855 V!7001) (minValue!3855 V!7001) (_size!1413 (_ BitVec 32)) (_keys!6030 array!10235) (_values!3997 array!10233) (_vacant!1413 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2728)

(declare-fun e!139198 () Bool)

(declare-fun e!139199 () Bool)

(declare-fun array_inv!3189 (array!10235) Bool)

(declare-fun array_inv!3190 (array!10233) Bool)

(assert (=> b!214089 (= e!139198 (and tp!20035 tp_is_empty!5515 (array_inv!3189 (_keys!6030 thiss!1504)) (array_inv!3190 (_values!3997 thiss!1504)) e!139199))))

(declare-fun mapIsEmpty!9377 () Bool)

(declare-fun mapRes!9377 () Bool)

(assert (=> mapIsEmpty!9377 mapRes!9377))

(declare-fun b!214090 () Bool)

(declare-fun e!139194 () Bool)

(assert (=> b!214090 (= e!139199 (and e!139194 mapRes!9377))))

(declare-fun condMapEmpty!9377 () Bool)

(declare-fun mapDefault!9377 () ValueCell!2414)

(assert (=> b!214090 (= condMapEmpty!9377 (= (arr!4855 (_values!3997 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2414)) mapDefault!9377)))))

(declare-fun b!214091 () Bool)

(assert (=> b!214091 (= e!139194 tp_is_empty!5515)))

(declare-fun b!214092 () Bool)

(declare-fun res!104815 () Bool)

(declare-fun e!139196 () Bool)

(assert (=> b!214092 (=> (not res!104815) (not e!139196))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214092 (= res!104815 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9377 () Bool)

(declare-fun tp!20036 () Bool)

(assert (=> mapNonEmpty!9377 (= mapRes!9377 (and tp!20036 e!139197))))

(declare-fun mapRest!9377 () (Array (_ BitVec 32) ValueCell!2414))

(declare-fun mapValue!9377 () ValueCell!2414)

(declare-fun mapKey!9377 () (_ BitVec 32))

(assert (=> mapNonEmpty!9377 (= (arr!4855 (_values!3997 thiss!1504)) (store mapRest!9377 mapKey!9377 mapValue!9377))))

(declare-fun b!214093 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214093 (= e!139196 (not (validMask!0 (mask!9662 thiss!1504))))))

(declare-fun res!104814 () Bool)

(assert (=> start!21246 (=> (not res!104814) (not e!139196))))

(declare-fun valid!1138 (LongMapFixedSize!2728) Bool)

(assert (=> start!21246 (= res!104814 (valid!1138 thiss!1504))))

(assert (=> start!21246 e!139196))

(assert (=> start!21246 e!139198))

(assert (=> start!21246 true))

(assert (= (and start!21246 res!104814) b!214092))

(assert (= (and b!214092 res!104815) b!214093))

(assert (= (and b!214090 condMapEmpty!9377) mapIsEmpty!9377))

(assert (= (and b!214090 (not condMapEmpty!9377)) mapNonEmpty!9377))

(get-info :version)

(assert (= (and mapNonEmpty!9377 ((_ is ValueCellFull!2414) mapValue!9377)) b!214088))

(assert (= (and b!214090 ((_ is ValueCellFull!2414) mapDefault!9377)) b!214091))

(assert (= b!214089 b!214090))

(assert (= start!21246 b!214089))

(declare-fun m!242101 () Bool)

(assert (=> b!214089 m!242101))

(declare-fun m!242103 () Bool)

(assert (=> b!214089 m!242103))

(declare-fun m!242105 () Bool)

(assert (=> mapNonEmpty!9377 m!242105))

(declare-fun m!242107 () Bool)

(assert (=> b!214093 m!242107))

(declare-fun m!242109 () Bool)

(assert (=> start!21246 m!242109))

(check-sat (not b!214089) (not start!21246) (not b_next!5653) (not mapNonEmpty!9377) (not b!214093) tp_is_empty!5515 b_and!12557)
(check-sat b_and!12557 (not b_next!5653))
(get-model)

(declare-fun d!58335 () Bool)

(assert (=> d!58335 (= (validMask!0 (mask!9662 thiss!1504)) (and (or (= (mask!9662 thiss!1504) #b00000000000000000000000000000111) (= (mask!9662 thiss!1504) #b00000000000000000000000000001111) (= (mask!9662 thiss!1504) #b00000000000000000000000000011111) (= (mask!9662 thiss!1504) #b00000000000000000000000000111111) (= (mask!9662 thiss!1504) #b00000000000000000000000001111111) (= (mask!9662 thiss!1504) #b00000000000000000000000011111111) (= (mask!9662 thiss!1504) #b00000000000000000000000111111111) (= (mask!9662 thiss!1504) #b00000000000000000000001111111111) (= (mask!9662 thiss!1504) #b00000000000000000000011111111111) (= (mask!9662 thiss!1504) #b00000000000000000000111111111111) (= (mask!9662 thiss!1504) #b00000000000000000001111111111111) (= (mask!9662 thiss!1504) #b00000000000000000011111111111111) (= (mask!9662 thiss!1504) #b00000000000000000111111111111111) (= (mask!9662 thiss!1504) #b00000000000000001111111111111111) (= (mask!9662 thiss!1504) #b00000000000000011111111111111111) (= (mask!9662 thiss!1504) #b00000000000000111111111111111111) (= (mask!9662 thiss!1504) #b00000000000001111111111111111111) (= (mask!9662 thiss!1504) #b00000000000011111111111111111111) (= (mask!9662 thiss!1504) #b00000000000111111111111111111111) (= (mask!9662 thiss!1504) #b00000000001111111111111111111111) (= (mask!9662 thiss!1504) #b00000000011111111111111111111111) (= (mask!9662 thiss!1504) #b00000000111111111111111111111111) (= (mask!9662 thiss!1504) #b00000001111111111111111111111111) (= (mask!9662 thiss!1504) #b00000011111111111111111111111111) (= (mask!9662 thiss!1504) #b00000111111111111111111111111111) (= (mask!9662 thiss!1504) #b00001111111111111111111111111111) (= (mask!9662 thiss!1504) #b00011111111111111111111111111111) (= (mask!9662 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9662 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214093 d!58335))

(declare-fun d!58337 () Bool)

(assert (=> d!58337 (= (array_inv!3189 (_keys!6030 thiss!1504)) (bvsge (size!5181 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214089 d!58337))

(declare-fun d!58339 () Bool)

(assert (=> d!58339 (= (array_inv!3190 (_values!3997 thiss!1504)) (bvsge (size!5180 (_values!3997 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214089 d!58339))

(declare-fun d!58341 () Bool)

(declare-fun res!104834 () Bool)

(declare-fun e!139238 () Bool)

(assert (=> d!58341 (=> (not res!104834) (not e!139238))))

(declare-fun simpleValid!207 (LongMapFixedSize!2728) Bool)

(assert (=> d!58341 (= res!104834 (simpleValid!207 thiss!1504))))

(assert (=> d!58341 (= (valid!1138 thiss!1504) e!139238)))

(declare-fun b!214136 () Bool)

(declare-fun res!104835 () Bool)

(assert (=> b!214136 (=> (not res!104835) (not e!139238))))

(declare-fun arrayCountValidKeys!0 (array!10235 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214136 (= res!104835 (= (arrayCountValidKeys!0 (_keys!6030 thiss!1504) #b00000000000000000000000000000000 (size!5181 (_keys!6030 thiss!1504))) (_size!1413 thiss!1504)))))

(declare-fun b!214137 () Bool)

(declare-fun res!104836 () Bool)

(assert (=> b!214137 (=> (not res!104836) (not e!139238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10235 (_ BitVec 32)) Bool)

(assert (=> b!214137 (= res!104836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6030 thiss!1504) (mask!9662 thiss!1504)))))

(declare-fun b!214138 () Bool)

(declare-datatypes ((List!3061 0))(
  ( (Nil!3058) (Cons!3057 (h!3699 (_ BitVec 64)) (t!8008 List!3061)) )
))
(declare-fun arrayNoDuplicates!0 (array!10235 (_ BitVec 32) List!3061) Bool)

(assert (=> b!214138 (= e!139238 (arrayNoDuplicates!0 (_keys!6030 thiss!1504) #b00000000000000000000000000000000 Nil!3058))))

(assert (= (and d!58341 res!104834) b!214136))

(assert (= (and b!214136 res!104835) b!214137))

(assert (= (and b!214137 res!104836) b!214138))

(declare-fun m!242131 () Bool)

(assert (=> d!58341 m!242131))

(declare-fun m!242133 () Bool)

(assert (=> b!214136 m!242133))

(declare-fun m!242135 () Bool)

(assert (=> b!214137 m!242135))

(declare-fun m!242137 () Bool)

(assert (=> b!214138 m!242137))

(assert (=> start!21246 d!58341))

(declare-fun mapNonEmpty!9386 () Bool)

(declare-fun mapRes!9386 () Bool)

(declare-fun tp!20051 () Bool)

(declare-fun e!139244 () Bool)

(assert (=> mapNonEmpty!9386 (= mapRes!9386 (and tp!20051 e!139244))))

(declare-fun mapRest!9386 () (Array (_ BitVec 32) ValueCell!2414))

(declare-fun mapValue!9386 () ValueCell!2414)

(declare-fun mapKey!9386 () (_ BitVec 32))

(assert (=> mapNonEmpty!9386 (= mapRest!9377 (store mapRest!9386 mapKey!9386 mapValue!9386))))

(declare-fun mapIsEmpty!9386 () Bool)

(assert (=> mapIsEmpty!9386 mapRes!9386))

(declare-fun b!214145 () Bool)

(assert (=> b!214145 (= e!139244 tp_is_empty!5515)))

(declare-fun b!214146 () Bool)

(declare-fun e!139243 () Bool)

(assert (=> b!214146 (= e!139243 tp_is_empty!5515)))

(declare-fun condMapEmpty!9386 () Bool)

(declare-fun mapDefault!9386 () ValueCell!2414)

(assert (=> mapNonEmpty!9377 (= condMapEmpty!9386 (= mapRest!9377 ((as const (Array (_ BitVec 32) ValueCell!2414)) mapDefault!9386)))))

(assert (=> mapNonEmpty!9377 (= tp!20036 (and e!139243 mapRes!9386))))

(assert (= (and mapNonEmpty!9377 condMapEmpty!9386) mapIsEmpty!9386))

(assert (= (and mapNonEmpty!9377 (not condMapEmpty!9386)) mapNonEmpty!9386))

(assert (= (and mapNonEmpty!9386 ((_ is ValueCellFull!2414) mapValue!9386)) b!214145))

(assert (= (and mapNonEmpty!9377 ((_ is ValueCellFull!2414) mapDefault!9386)) b!214146))

(declare-fun m!242139 () Bool)

(assert (=> mapNonEmpty!9386 m!242139))

(check-sat (not b!214137) (not d!58341) (not b!214136) (not b!214138) (not mapNonEmpty!9386) (not b_next!5653) tp_is_empty!5515 b_and!12557)
(check-sat b_and!12557 (not b_next!5653))
(get-model)

(declare-fun b!214156 () Bool)

(declare-fun res!104846 () Bool)

(declare-fun e!139247 () Bool)

(assert (=> b!214156 (=> (not res!104846) (not e!139247))))

(declare-fun size!5186 (LongMapFixedSize!2728) (_ BitVec 32))

(assert (=> b!214156 (= res!104846 (bvsge (size!5186 thiss!1504) (_size!1413 thiss!1504)))))

(declare-fun b!214157 () Bool)

(declare-fun res!104848 () Bool)

(assert (=> b!214157 (=> (not res!104848) (not e!139247))))

(assert (=> b!214157 (= res!104848 (= (size!5186 thiss!1504) (bvadd (_size!1413 thiss!1504) (bvsdiv (bvadd (extraKeys!3751 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!58343 () Bool)

(declare-fun res!104845 () Bool)

(assert (=> d!58343 (=> (not res!104845) (not e!139247))))

(assert (=> d!58343 (= res!104845 (validMask!0 (mask!9662 thiss!1504)))))

(assert (=> d!58343 (= (simpleValid!207 thiss!1504) e!139247)))

(declare-fun b!214155 () Bool)

(declare-fun res!104847 () Bool)

(assert (=> b!214155 (=> (not res!104847) (not e!139247))))

(assert (=> b!214155 (= res!104847 (and (= (size!5180 (_values!3997 thiss!1504)) (bvadd (mask!9662 thiss!1504) #b00000000000000000000000000000001)) (= (size!5181 (_keys!6030 thiss!1504)) (size!5180 (_values!3997 thiss!1504))) (bvsge (_size!1413 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1413 thiss!1504) (bvadd (mask!9662 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!214158 () Bool)

(assert (=> b!214158 (= e!139247 (and (bvsge (extraKeys!3751 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3751 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1413 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!58343 res!104845) b!214155))

(assert (= (and b!214155 res!104847) b!214156))

(assert (= (and b!214156 res!104846) b!214157))

(assert (= (and b!214157 res!104848) b!214158))

(declare-fun m!242141 () Bool)

(assert (=> b!214156 m!242141))

(assert (=> b!214157 m!242141))

(assert (=> d!58343 m!242107))

(assert (=> d!58341 d!58343))

(declare-fun b!214167 () Bool)

(declare-fun e!139253 () (_ BitVec 32))

(declare-fun call!20295 () (_ BitVec 32))

(assert (=> b!214167 (= e!139253 call!20295)))

(declare-fun b!214168 () Bool)

(declare-fun e!139252 () (_ BitVec 32))

(assert (=> b!214168 (= e!139252 #b00000000000000000000000000000000)))

(declare-fun bm!20292 () Bool)

(assert (=> bm!20292 (= call!20295 (arrayCountValidKeys!0 (_keys!6030 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5181 (_keys!6030 thiss!1504))))))

(declare-fun d!58345 () Bool)

(declare-fun lt!110828 () (_ BitVec 32))

(assert (=> d!58345 (and (bvsge lt!110828 #b00000000000000000000000000000000) (bvsle lt!110828 (bvsub (size!5181 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58345 (= lt!110828 e!139252)))

(declare-fun c!36041 () Bool)

(assert (=> d!58345 (= c!36041 (bvsge #b00000000000000000000000000000000 (size!5181 (_keys!6030 thiss!1504))))))

(assert (=> d!58345 (and (bvsle #b00000000000000000000000000000000 (size!5181 (_keys!6030 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5181 (_keys!6030 thiss!1504)) (size!5181 (_keys!6030 thiss!1504))))))

(assert (=> d!58345 (= (arrayCountValidKeys!0 (_keys!6030 thiss!1504) #b00000000000000000000000000000000 (size!5181 (_keys!6030 thiss!1504))) lt!110828)))

(declare-fun b!214169 () Bool)

(assert (=> b!214169 (= e!139253 (bvadd #b00000000000000000000000000000001 call!20295))))

(declare-fun b!214170 () Bool)

(assert (=> b!214170 (= e!139252 e!139253)))

(declare-fun c!36042 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214170 (= c!36042 (validKeyInArray!0 (select (arr!4856 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58345 c!36041) b!214168))

(assert (= (and d!58345 (not c!36041)) b!214170))

(assert (= (and b!214170 c!36042) b!214169))

(assert (= (and b!214170 (not c!36042)) b!214167))

(assert (= (or b!214169 b!214167) bm!20292))

(declare-fun m!242143 () Bool)

(assert (=> bm!20292 m!242143))

(declare-fun m!242145 () Bool)

(assert (=> b!214170 m!242145))

(assert (=> b!214170 m!242145))

(declare-fun m!242147 () Bool)

(assert (=> b!214170 m!242147))

(assert (=> b!214136 d!58345))

(declare-fun b!214181 () Bool)

(declare-fun e!139265 () Bool)

(declare-fun contains!1408 (List!3061 (_ BitVec 64)) Bool)

(assert (=> b!214181 (= e!139265 (contains!1408 Nil!3058 (select (arr!4856 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20295 () Bool)

(declare-fun call!20298 () Bool)

(declare-fun c!36045 () Bool)

(assert (=> bm!20295 (= call!20298 (arrayNoDuplicates!0 (_keys!6030 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36045 (Cons!3057 (select (arr!4856 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000) Nil!3058) Nil!3058)))))

(declare-fun b!214182 () Bool)

(declare-fun e!139262 () Bool)

(assert (=> b!214182 (= e!139262 call!20298)))

(declare-fun d!58347 () Bool)

(declare-fun res!104856 () Bool)

(declare-fun e!139264 () Bool)

(assert (=> d!58347 (=> res!104856 e!139264)))

(assert (=> d!58347 (= res!104856 (bvsge #b00000000000000000000000000000000 (size!5181 (_keys!6030 thiss!1504))))))

(assert (=> d!58347 (= (arrayNoDuplicates!0 (_keys!6030 thiss!1504) #b00000000000000000000000000000000 Nil!3058) e!139264)))

(declare-fun b!214183 () Bool)

(declare-fun e!139263 () Bool)

(assert (=> b!214183 (= e!139264 e!139263)))

(declare-fun res!104855 () Bool)

(assert (=> b!214183 (=> (not res!104855) (not e!139263))))

(assert (=> b!214183 (= res!104855 (not e!139265))))

(declare-fun res!104857 () Bool)

(assert (=> b!214183 (=> (not res!104857) (not e!139265))))

(assert (=> b!214183 (= res!104857 (validKeyInArray!0 (select (arr!4856 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214184 () Bool)

(assert (=> b!214184 (= e!139263 e!139262)))

(assert (=> b!214184 (= c!36045 (validKeyInArray!0 (select (arr!4856 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214185 () Bool)

(assert (=> b!214185 (= e!139262 call!20298)))

(assert (= (and d!58347 (not res!104856)) b!214183))

(assert (= (and b!214183 res!104857) b!214181))

(assert (= (and b!214183 res!104855) b!214184))

(assert (= (and b!214184 c!36045) b!214182))

(assert (= (and b!214184 (not c!36045)) b!214185))

(assert (= (or b!214182 b!214185) bm!20295))

(assert (=> b!214181 m!242145))

(assert (=> b!214181 m!242145))

(declare-fun m!242149 () Bool)

(assert (=> b!214181 m!242149))

(assert (=> bm!20295 m!242145))

(declare-fun m!242151 () Bool)

(assert (=> bm!20295 m!242151))

(assert (=> b!214183 m!242145))

(assert (=> b!214183 m!242145))

(assert (=> b!214183 m!242147))

(assert (=> b!214184 m!242145))

(assert (=> b!214184 m!242145))

(assert (=> b!214184 m!242147))

(assert (=> b!214138 d!58347))

(declare-fun b!214194 () Bool)

(declare-fun e!139273 () Bool)

(declare-fun call!20301 () Bool)

(assert (=> b!214194 (= e!139273 call!20301)))

(declare-fun b!214195 () Bool)

(declare-fun e!139272 () Bool)

(declare-fun e!139274 () Bool)

(assert (=> b!214195 (= e!139272 e!139274)))

(declare-fun c!36048 () Bool)

(assert (=> b!214195 (= c!36048 (validKeyInArray!0 (select (arr!4856 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214196 () Bool)

(assert (=> b!214196 (= e!139274 e!139273)))

(declare-fun lt!110837 () (_ BitVec 64))

(assert (=> b!214196 (= lt!110837 (select (arr!4856 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6474 0))(
  ( (Unit!6475) )
))
(declare-fun lt!110836 () Unit!6474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10235 (_ BitVec 64) (_ BitVec 32)) Unit!6474)

(assert (=> b!214196 (= lt!110836 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6030 thiss!1504) lt!110837 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214196 (arrayContainsKey!0 (_keys!6030 thiss!1504) lt!110837 #b00000000000000000000000000000000)))

(declare-fun lt!110835 () Unit!6474)

(assert (=> b!214196 (= lt!110835 lt!110836)))

(declare-fun res!104862 () Bool)

(declare-datatypes ((SeekEntryResult!705 0))(
  ( (MissingZero!705 (index!4990 (_ BitVec 32))) (Found!705 (index!4991 (_ BitVec 32))) (Intermediate!705 (undefined!1517 Bool) (index!4992 (_ BitVec 32)) (x!22286 (_ BitVec 32))) (Undefined!705) (MissingVacant!705 (index!4993 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10235 (_ BitVec 32)) SeekEntryResult!705)

(assert (=> b!214196 (= res!104862 (= (seekEntryOrOpen!0 (select (arr!4856 (_keys!6030 thiss!1504)) #b00000000000000000000000000000000) (_keys!6030 thiss!1504) (mask!9662 thiss!1504)) (Found!705 #b00000000000000000000000000000000)))))

(assert (=> b!214196 (=> (not res!104862) (not e!139273))))

(declare-fun b!214197 () Bool)

(assert (=> b!214197 (= e!139274 call!20301)))

(declare-fun bm!20298 () Bool)

(assert (=> bm!20298 (= call!20301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6030 thiss!1504) (mask!9662 thiss!1504)))))

(declare-fun d!58349 () Bool)

(declare-fun res!104863 () Bool)

(assert (=> d!58349 (=> res!104863 e!139272)))

(assert (=> d!58349 (= res!104863 (bvsge #b00000000000000000000000000000000 (size!5181 (_keys!6030 thiss!1504))))))

(assert (=> d!58349 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6030 thiss!1504) (mask!9662 thiss!1504)) e!139272)))

(assert (= (and d!58349 (not res!104863)) b!214195))

(assert (= (and b!214195 c!36048) b!214196))

(assert (= (and b!214195 (not c!36048)) b!214197))

(assert (= (and b!214196 res!104862) b!214194))

(assert (= (or b!214194 b!214197) bm!20298))

(assert (=> b!214195 m!242145))

(assert (=> b!214195 m!242145))

(assert (=> b!214195 m!242147))

(assert (=> b!214196 m!242145))

(declare-fun m!242153 () Bool)

(assert (=> b!214196 m!242153))

(declare-fun m!242155 () Bool)

(assert (=> b!214196 m!242155))

(assert (=> b!214196 m!242145))

(declare-fun m!242157 () Bool)

(assert (=> b!214196 m!242157))

(declare-fun m!242159 () Bool)

(assert (=> bm!20298 m!242159))

(assert (=> b!214137 d!58349))

(declare-fun mapNonEmpty!9387 () Bool)

(declare-fun mapRes!9387 () Bool)

(declare-fun tp!20052 () Bool)

(declare-fun e!139276 () Bool)

(assert (=> mapNonEmpty!9387 (= mapRes!9387 (and tp!20052 e!139276))))

(declare-fun mapValue!9387 () ValueCell!2414)

(declare-fun mapRest!9387 () (Array (_ BitVec 32) ValueCell!2414))

(declare-fun mapKey!9387 () (_ BitVec 32))

(assert (=> mapNonEmpty!9387 (= mapRest!9386 (store mapRest!9387 mapKey!9387 mapValue!9387))))

(declare-fun mapIsEmpty!9387 () Bool)

(assert (=> mapIsEmpty!9387 mapRes!9387))

(declare-fun b!214198 () Bool)

(assert (=> b!214198 (= e!139276 tp_is_empty!5515)))

(declare-fun b!214199 () Bool)

(declare-fun e!139275 () Bool)

(assert (=> b!214199 (= e!139275 tp_is_empty!5515)))

(declare-fun condMapEmpty!9387 () Bool)

(declare-fun mapDefault!9387 () ValueCell!2414)

(assert (=> mapNonEmpty!9386 (= condMapEmpty!9387 (= mapRest!9386 ((as const (Array (_ BitVec 32) ValueCell!2414)) mapDefault!9387)))))

(assert (=> mapNonEmpty!9386 (= tp!20051 (and e!139275 mapRes!9387))))

(assert (= (and mapNonEmpty!9386 condMapEmpty!9387) mapIsEmpty!9387))

(assert (= (and mapNonEmpty!9386 (not condMapEmpty!9387)) mapNonEmpty!9387))

(assert (= (and mapNonEmpty!9387 ((_ is ValueCellFull!2414) mapValue!9387)) b!214198))

(assert (= (and mapNonEmpty!9386 ((_ is ValueCellFull!2414) mapDefault!9387)) b!214199))

(declare-fun m!242161 () Bool)

(assert (=> mapNonEmpty!9387 m!242161))

(check-sat (not bm!20292) (not b!214157) (not b!214170) (not d!58343) (not bm!20298) (not b!214195) (not b!214184) (not b!214156) (not b!214196) (not mapNonEmpty!9387) (not b!214181) (not b_next!5653) (not bm!20295) (not b!214183) tp_is_empty!5515 b_and!12557)
(check-sat b_and!12557 (not b_next!5653))
