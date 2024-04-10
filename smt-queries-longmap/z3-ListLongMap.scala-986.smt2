; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21280 () Bool)

(assert start!21280)

(declare-fun b!214274 () Bool)

(declare-fun b_free!5667 () Bool)

(declare-fun b_next!5667 () Bool)

(assert (=> b!214274 (= b_free!5667 (not b_next!5667))))

(declare-fun tp!20084 () Bool)

(declare-fun b_and!12557 () Bool)

(assert (=> b!214274 (= tp!20084 b_and!12557)))

(declare-fun b!214268 () Bool)

(declare-fun res!104896 () Bool)

(declare-fun e!139347 () Bool)

(assert (=> b!214268 (=> (not res!104896) (not e!139347))))

(declare-datatypes ((V!7019 0))(
  ( (V!7020 (val!2809 Int)) )
))
(declare-datatypes ((ValueCell!2421 0))(
  ( (ValueCellFull!2421 (v!4827 V!7019)) (EmptyCell!2421) )
))
(declare-datatypes ((array!10267 0))(
  ( (array!10268 (arr!4870 (Array (_ BitVec 32) ValueCell!2421)) (size!5196 (_ BitVec 32))) )
))
(declare-datatypes ((array!10269 0))(
  ( (array!10270 (arr!4871 (Array (_ BitVec 32) (_ BitVec 64))) (size!5197 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2742 0))(
  ( (LongMapFixedSize!2743 (defaultEntry!4021 Int) (mask!9676 (_ BitVec 32)) (extraKeys!3758 (_ BitVec 32)) (zeroValue!3862 V!7019) (minValue!3862 V!7019) (_size!1420 (_ BitVec 32)) (_keys!6038 array!10269) (_values!4004 array!10267) (_vacant!1420 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2742)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214268 (= res!104896 (validMask!0 (mask!9676 thiss!1504)))))

(declare-fun b!214269 () Bool)

(declare-fun e!139348 () Bool)

(declare-fun tp_is_empty!5529 () Bool)

(assert (=> b!214269 (= e!139348 tp_is_empty!5529)))

(declare-fun b!214270 () Bool)

(declare-fun res!104894 () Bool)

(assert (=> b!214270 (=> (not res!104894) (not e!139347))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214270 (= res!104894 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9405 () Bool)

(declare-fun mapRes!9405 () Bool)

(assert (=> mapIsEmpty!9405 mapRes!9405))

(declare-fun res!104895 () Bool)

(assert (=> start!21280 (=> (not res!104895) (not e!139347))))

(declare-fun valid!1123 (LongMapFixedSize!2742) Bool)

(assert (=> start!21280 (= res!104895 (valid!1123 thiss!1504))))

(assert (=> start!21280 e!139347))

(declare-fun e!139351 () Bool)

(assert (=> start!21280 e!139351))

(assert (=> start!21280 true))

(declare-fun b!214271 () Bool)

(assert (=> b!214271 (= e!139347 (and (bvsge (mask!9676 thiss!1504) #b00000000000000000000000000000000) (not (= (size!5197 (_keys!6038 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9676 thiss!1504))))))))

(declare-fun b!214272 () Bool)

(declare-fun e!139349 () Bool)

(assert (=> b!214272 (= e!139349 tp_is_empty!5529)))

(declare-fun b!214273 () Bool)

(declare-fun e!139350 () Bool)

(assert (=> b!214273 (= e!139350 (and e!139349 mapRes!9405))))

(declare-fun condMapEmpty!9405 () Bool)

(declare-fun mapDefault!9405 () ValueCell!2421)

(assert (=> b!214273 (= condMapEmpty!9405 (= (arr!4870 (_values!4004 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2421)) mapDefault!9405)))))

(declare-fun mapNonEmpty!9405 () Bool)

(declare-fun tp!20085 () Bool)

(assert (=> mapNonEmpty!9405 (= mapRes!9405 (and tp!20085 e!139348))))

(declare-fun mapValue!9405 () ValueCell!2421)

(declare-fun mapRest!9405 () (Array (_ BitVec 32) ValueCell!2421))

(declare-fun mapKey!9405 () (_ BitVec 32))

(assert (=> mapNonEmpty!9405 (= (arr!4870 (_values!4004 thiss!1504)) (store mapRest!9405 mapKey!9405 mapValue!9405))))

(declare-fun array_inv!3221 (array!10269) Bool)

(declare-fun array_inv!3222 (array!10267) Bool)

(assert (=> b!214274 (= e!139351 (and tp!20084 tp_is_empty!5529 (array_inv!3221 (_keys!6038 thiss!1504)) (array_inv!3222 (_values!4004 thiss!1504)) e!139350))))

(assert (= (and start!21280 res!104895) b!214270))

(assert (= (and b!214270 res!104894) b!214268))

(assert (= (and b!214268 res!104896) b!214271))

(assert (= (and b!214273 condMapEmpty!9405) mapIsEmpty!9405))

(assert (= (and b!214273 (not condMapEmpty!9405)) mapNonEmpty!9405))

(get-info :version)

(assert (= (and mapNonEmpty!9405 ((_ is ValueCellFull!2421) mapValue!9405)) b!214269))

(assert (= (and b!214273 ((_ is ValueCellFull!2421) mapDefault!9405)) b!214272))

(assert (= b!214274 b!214273))

(assert (= start!21280 b!214274))

(declare-fun m!242031 () Bool)

(assert (=> b!214268 m!242031))

(declare-fun m!242033 () Bool)

(assert (=> start!21280 m!242033))

(declare-fun m!242035 () Bool)

(assert (=> mapNonEmpty!9405 m!242035))

(declare-fun m!242037 () Bool)

(assert (=> b!214274 m!242037))

(declare-fun m!242039 () Bool)

(assert (=> b!214274 m!242039))

(check-sat (not b!214268) (not b_next!5667) b_and!12557 (not b!214274) tp_is_empty!5529 (not start!21280) (not mapNonEmpty!9405))
(check-sat b_and!12557 (not b_next!5667))
(get-model)

(declare-fun d!58289 () Bool)

(assert (=> d!58289 (= (validMask!0 (mask!9676 thiss!1504)) (and (or (= (mask!9676 thiss!1504) #b00000000000000000000000000000111) (= (mask!9676 thiss!1504) #b00000000000000000000000000001111) (= (mask!9676 thiss!1504) #b00000000000000000000000000011111) (= (mask!9676 thiss!1504) #b00000000000000000000000000111111) (= (mask!9676 thiss!1504) #b00000000000000000000000001111111) (= (mask!9676 thiss!1504) #b00000000000000000000000011111111) (= (mask!9676 thiss!1504) #b00000000000000000000000111111111) (= (mask!9676 thiss!1504) #b00000000000000000000001111111111) (= (mask!9676 thiss!1504) #b00000000000000000000011111111111) (= (mask!9676 thiss!1504) #b00000000000000000000111111111111) (= (mask!9676 thiss!1504) #b00000000000000000001111111111111) (= (mask!9676 thiss!1504) #b00000000000000000011111111111111) (= (mask!9676 thiss!1504) #b00000000000000000111111111111111) (= (mask!9676 thiss!1504) #b00000000000000001111111111111111) (= (mask!9676 thiss!1504) #b00000000000000011111111111111111) (= (mask!9676 thiss!1504) #b00000000000000111111111111111111) (= (mask!9676 thiss!1504) #b00000000000001111111111111111111) (= (mask!9676 thiss!1504) #b00000000000011111111111111111111) (= (mask!9676 thiss!1504) #b00000000000111111111111111111111) (= (mask!9676 thiss!1504) #b00000000001111111111111111111111) (= (mask!9676 thiss!1504) #b00000000011111111111111111111111) (= (mask!9676 thiss!1504) #b00000000111111111111111111111111) (= (mask!9676 thiss!1504) #b00000001111111111111111111111111) (= (mask!9676 thiss!1504) #b00000011111111111111111111111111) (= (mask!9676 thiss!1504) #b00000111111111111111111111111111) (= (mask!9676 thiss!1504) #b00001111111111111111111111111111) (= (mask!9676 thiss!1504) #b00011111111111111111111111111111) (= (mask!9676 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9676 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214268 d!58289))

(declare-fun d!58291 () Bool)

(assert (=> d!58291 (= (array_inv!3221 (_keys!6038 thiss!1504)) (bvsge (size!5197 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214274 d!58291))

(declare-fun d!58293 () Bool)

(assert (=> d!58293 (= (array_inv!3222 (_values!4004 thiss!1504)) (bvsge (size!5196 (_values!4004 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214274 d!58293))

(declare-fun d!58295 () Bool)

(declare-fun res!104912 () Bool)

(declare-fun e!139372 () Bool)

(assert (=> d!58295 (=> (not res!104912) (not e!139372))))

(declare-fun simpleValid!209 (LongMapFixedSize!2742) Bool)

(assert (=> d!58295 (= res!104912 (simpleValid!209 thiss!1504))))

(assert (=> d!58295 (= (valid!1123 thiss!1504) e!139372)))

(declare-fun b!214302 () Bool)

(declare-fun res!104913 () Bool)

(assert (=> b!214302 (=> (not res!104913) (not e!139372))))

(declare-fun arrayCountValidKeys!0 (array!10269 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214302 (= res!104913 (= (arrayCountValidKeys!0 (_keys!6038 thiss!1504) #b00000000000000000000000000000000 (size!5197 (_keys!6038 thiss!1504))) (_size!1420 thiss!1504)))))

(declare-fun b!214303 () Bool)

(declare-fun res!104914 () Bool)

(assert (=> b!214303 (=> (not res!104914) (not e!139372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10269 (_ BitVec 32)) Bool)

(assert (=> b!214303 (= res!104914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6038 thiss!1504) (mask!9676 thiss!1504)))))

(declare-fun b!214304 () Bool)

(declare-datatypes ((List!3128 0))(
  ( (Nil!3125) (Cons!3124 (h!3766 (_ BitVec 64)) (t!8083 List!3128)) )
))
(declare-fun arrayNoDuplicates!0 (array!10269 (_ BitVec 32) List!3128) Bool)

(assert (=> b!214304 (= e!139372 (arrayNoDuplicates!0 (_keys!6038 thiss!1504) #b00000000000000000000000000000000 Nil!3125))))

(assert (= (and d!58295 res!104912) b!214302))

(assert (= (and b!214302 res!104913) b!214303))

(assert (= (and b!214303 res!104914) b!214304))

(declare-fun m!242051 () Bool)

(assert (=> d!58295 m!242051))

(declare-fun m!242053 () Bool)

(assert (=> b!214302 m!242053))

(declare-fun m!242055 () Bool)

(assert (=> b!214303 m!242055))

(declare-fun m!242057 () Bool)

(assert (=> b!214304 m!242057))

(assert (=> start!21280 d!58295))

(declare-fun b!214311 () Bool)

(declare-fun e!139377 () Bool)

(assert (=> b!214311 (= e!139377 tp_is_empty!5529)))

(declare-fun mapIsEmpty!9411 () Bool)

(declare-fun mapRes!9411 () Bool)

(assert (=> mapIsEmpty!9411 mapRes!9411))

(declare-fun mapNonEmpty!9411 () Bool)

(declare-fun tp!20094 () Bool)

(assert (=> mapNonEmpty!9411 (= mapRes!9411 (and tp!20094 e!139377))))

(declare-fun mapRest!9411 () (Array (_ BitVec 32) ValueCell!2421))

(declare-fun mapValue!9411 () ValueCell!2421)

(declare-fun mapKey!9411 () (_ BitVec 32))

(assert (=> mapNonEmpty!9411 (= mapRest!9405 (store mapRest!9411 mapKey!9411 mapValue!9411))))

(declare-fun b!214312 () Bool)

(declare-fun e!139378 () Bool)

(assert (=> b!214312 (= e!139378 tp_is_empty!5529)))

(declare-fun condMapEmpty!9411 () Bool)

(declare-fun mapDefault!9411 () ValueCell!2421)

(assert (=> mapNonEmpty!9405 (= condMapEmpty!9411 (= mapRest!9405 ((as const (Array (_ BitVec 32) ValueCell!2421)) mapDefault!9411)))))

(assert (=> mapNonEmpty!9405 (= tp!20085 (and e!139378 mapRes!9411))))

(assert (= (and mapNonEmpty!9405 condMapEmpty!9411) mapIsEmpty!9411))

(assert (= (and mapNonEmpty!9405 (not condMapEmpty!9411)) mapNonEmpty!9411))

(assert (= (and mapNonEmpty!9411 ((_ is ValueCellFull!2421) mapValue!9411)) b!214311))

(assert (= (and mapNonEmpty!9405 ((_ is ValueCellFull!2421) mapDefault!9411)) b!214312))

(declare-fun m!242059 () Bool)

(assert (=> mapNonEmpty!9411 m!242059))

(check-sat (not b_next!5667) b_and!12557 (not mapNonEmpty!9411) (not b!214303) (not b!214302) tp_is_empty!5529 (not d!58295) (not b!214304))
(check-sat b_and!12557 (not b_next!5667))
(get-model)

(declare-fun b!214323 () Bool)

(declare-fun e!139389 () Bool)

(declare-fun contains!1426 (List!3128 (_ BitVec 64)) Bool)

(assert (=> b!214323 (= e!139389 (contains!1426 Nil!3125 (select (arr!4871 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58297 () Bool)

(declare-fun res!104921 () Bool)

(declare-fun e!139390 () Bool)

(assert (=> d!58297 (=> res!104921 e!139390)))

(assert (=> d!58297 (= res!104921 (bvsge #b00000000000000000000000000000000 (size!5197 (_keys!6038 thiss!1504))))))

(assert (=> d!58297 (= (arrayNoDuplicates!0 (_keys!6038 thiss!1504) #b00000000000000000000000000000000 Nil!3125) e!139390)))

(declare-fun b!214324 () Bool)

(declare-fun e!139388 () Bool)

(declare-fun e!139387 () Bool)

(assert (=> b!214324 (= e!139388 e!139387)))

(declare-fun c!36038 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214324 (= c!36038 (validKeyInArray!0 (select (arr!4871 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214325 () Bool)

(declare-fun call!20316 () Bool)

(assert (=> b!214325 (= e!139387 call!20316)))

(declare-fun b!214326 () Bool)

(assert (=> b!214326 (= e!139390 e!139388)))

(declare-fun res!104923 () Bool)

(assert (=> b!214326 (=> (not res!104923) (not e!139388))))

(assert (=> b!214326 (= res!104923 (not e!139389))))

(declare-fun res!104922 () Bool)

(assert (=> b!214326 (=> (not res!104922) (not e!139389))))

(assert (=> b!214326 (= res!104922 (validKeyInArray!0 (select (arr!4871 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20313 () Bool)

(assert (=> bm!20313 (= call!20316 (arrayNoDuplicates!0 (_keys!6038 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36038 (Cons!3124 (select (arr!4871 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000) Nil!3125) Nil!3125)))))

(declare-fun b!214327 () Bool)

(assert (=> b!214327 (= e!139387 call!20316)))

(assert (= (and d!58297 (not res!104921)) b!214326))

(assert (= (and b!214326 res!104922) b!214323))

(assert (= (and b!214326 res!104923) b!214324))

(assert (= (and b!214324 c!36038) b!214327))

(assert (= (and b!214324 (not c!36038)) b!214325))

(assert (= (or b!214327 b!214325) bm!20313))

(declare-fun m!242061 () Bool)

(assert (=> b!214323 m!242061))

(assert (=> b!214323 m!242061))

(declare-fun m!242063 () Bool)

(assert (=> b!214323 m!242063))

(assert (=> b!214324 m!242061))

(assert (=> b!214324 m!242061))

(declare-fun m!242065 () Bool)

(assert (=> b!214324 m!242065))

(assert (=> b!214326 m!242061))

(assert (=> b!214326 m!242061))

(assert (=> b!214326 m!242065))

(assert (=> bm!20313 m!242061))

(declare-fun m!242067 () Bool)

(assert (=> bm!20313 m!242067))

(assert (=> b!214304 d!58297))

(declare-fun d!58299 () Bool)

(declare-fun res!104933 () Bool)

(declare-fun e!139393 () Bool)

(assert (=> d!58299 (=> (not res!104933) (not e!139393))))

(assert (=> d!58299 (= res!104933 (validMask!0 (mask!9676 thiss!1504)))))

(assert (=> d!58299 (= (simpleValid!209 thiss!1504) e!139393)))

(declare-fun b!214339 () Bool)

(assert (=> b!214339 (= e!139393 (and (bvsge (extraKeys!3758 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3758 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1420 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!214337 () Bool)

(declare-fun res!104935 () Bool)

(assert (=> b!214337 (=> (not res!104935) (not e!139393))))

(declare-fun size!5200 (LongMapFixedSize!2742) (_ BitVec 32))

(assert (=> b!214337 (= res!104935 (bvsge (size!5200 thiss!1504) (_size!1420 thiss!1504)))))

(declare-fun b!214338 () Bool)

(declare-fun res!104932 () Bool)

(assert (=> b!214338 (=> (not res!104932) (not e!139393))))

(assert (=> b!214338 (= res!104932 (= (size!5200 thiss!1504) (bvadd (_size!1420 thiss!1504) (bvsdiv (bvadd (extraKeys!3758 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!214336 () Bool)

(declare-fun res!104934 () Bool)

(assert (=> b!214336 (=> (not res!104934) (not e!139393))))

(assert (=> b!214336 (= res!104934 (and (= (size!5196 (_values!4004 thiss!1504)) (bvadd (mask!9676 thiss!1504) #b00000000000000000000000000000001)) (= (size!5197 (_keys!6038 thiss!1504)) (size!5196 (_values!4004 thiss!1504))) (bvsge (_size!1420 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1420 thiss!1504) (bvadd (mask!9676 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!58299 res!104933) b!214336))

(assert (= (and b!214336 res!104934) b!214337))

(assert (= (and b!214337 res!104935) b!214338))

(assert (= (and b!214338 res!104932) b!214339))

(assert (=> d!58299 m!242031))

(declare-fun m!242069 () Bool)

(assert (=> b!214337 m!242069))

(assert (=> b!214338 m!242069))

(assert (=> d!58295 d!58299))

(declare-fun b!214348 () Bool)

(declare-fun e!139399 () (_ BitVec 32))

(assert (=> b!214348 (= e!139399 #b00000000000000000000000000000000)))

(declare-fun b!214349 () Bool)

(declare-fun e!139398 () (_ BitVec 32))

(declare-fun call!20319 () (_ BitVec 32))

(assert (=> b!214349 (= e!139398 (bvadd #b00000000000000000000000000000001 call!20319))))

(declare-fun bm!20316 () Bool)

(assert (=> bm!20316 (= call!20319 (arrayCountValidKeys!0 (_keys!6038 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5197 (_keys!6038 thiss!1504))))))

(declare-fun b!214351 () Bool)

(assert (=> b!214351 (= e!139398 call!20319)))

(declare-fun d!58301 () Bool)

(declare-fun lt!110781 () (_ BitVec 32))

(assert (=> d!58301 (and (bvsge lt!110781 #b00000000000000000000000000000000) (bvsle lt!110781 (bvsub (size!5197 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58301 (= lt!110781 e!139399)))

(declare-fun c!36044 () Bool)

(assert (=> d!58301 (= c!36044 (bvsge #b00000000000000000000000000000000 (size!5197 (_keys!6038 thiss!1504))))))

(assert (=> d!58301 (and (bvsle #b00000000000000000000000000000000 (size!5197 (_keys!6038 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5197 (_keys!6038 thiss!1504)) (size!5197 (_keys!6038 thiss!1504))))))

(assert (=> d!58301 (= (arrayCountValidKeys!0 (_keys!6038 thiss!1504) #b00000000000000000000000000000000 (size!5197 (_keys!6038 thiss!1504))) lt!110781)))

(declare-fun b!214350 () Bool)

(assert (=> b!214350 (= e!139399 e!139398)))

(declare-fun c!36043 () Bool)

(assert (=> b!214350 (= c!36043 (validKeyInArray!0 (select (arr!4871 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58301 c!36044) b!214348))

(assert (= (and d!58301 (not c!36044)) b!214350))

(assert (= (and b!214350 c!36043) b!214349))

(assert (= (and b!214350 (not c!36043)) b!214351))

(assert (= (or b!214349 b!214351) bm!20316))

(declare-fun m!242071 () Bool)

(assert (=> bm!20316 m!242071))

(assert (=> b!214350 m!242061))

(assert (=> b!214350 m!242061))

(assert (=> b!214350 m!242065))

(assert (=> b!214302 d!58301))

(declare-fun b!214360 () Bool)

(declare-fun e!139407 () Bool)

(declare-fun call!20322 () Bool)

(assert (=> b!214360 (= e!139407 call!20322)))

(declare-fun bm!20319 () Bool)

(assert (=> bm!20319 (= call!20322 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6038 thiss!1504) (mask!9676 thiss!1504)))))

(declare-fun d!58303 () Bool)

(declare-fun res!104940 () Bool)

(declare-fun e!139406 () Bool)

(assert (=> d!58303 (=> res!104940 e!139406)))

(assert (=> d!58303 (= res!104940 (bvsge #b00000000000000000000000000000000 (size!5197 (_keys!6038 thiss!1504))))))

(assert (=> d!58303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6038 thiss!1504) (mask!9676 thiss!1504)) e!139406)))

(declare-fun b!214361 () Bool)

(declare-fun e!139408 () Bool)

(assert (=> b!214361 (= e!139408 e!139407)))

(declare-fun lt!110789 () (_ BitVec 64))

(assert (=> b!214361 (= lt!110789 (select (arr!4871 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6490 0))(
  ( (Unit!6491) )
))
(declare-fun lt!110790 () Unit!6490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10269 (_ BitVec 64) (_ BitVec 32)) Unit!6490)

(assert (=> b!214361 (= lt!110790 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6038 thiss!1504) lt!110789 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214361 (arrayContainsKey!0 (_keys!6038 thiss!1504) lt!110789 #b00000000000000000000000000000000)))

(declare-fun lt!110788 () Unit!6490)

(assert (=> b!214361 (= lt!110788 lt!110790)))

(declare-fun res!104941 () Bool)

(declare-datatypes ((SeekEntryResult!717 0))(
  ( (MissingZero!717 (index!5038 (_ BitVec 32))) (Found!717 (index!5039 (_ BitVec 32))) (Intermediate!717 (undefined!1529 Bool) (index!5040 (_ BitVec 32)) (x!22336 (_ BitVec 32))) (Undefined!717) (MissingVacant!717 (index!5041 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10269 (_ BitVec 32)) SeekEntryResult!717)

(assert (=> b!214361 (= res!104941 (= (seekEntryOrOpen!0 (select (arr!4871 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000) (_keys!6038 thiss!1504) (mask!9676 thiss!1504)) (Found!717 #b00000000000000000000000000000000)))))

(assert (=> b!214361 (=> (not res!104941) (not e!139407))))

(declare-fun b!214362 () Bool)

(assert (=> b!214362 (= e!139406 e!139408)))

(declare-fun c!36047 () Bool)

(assert (=> b!214362 (= c!36047 (validKeyInArray!0 (select (arr!4871 (_keys!6038 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214363 () Bool)

(assert (=> b!214363 (= e!139408 call!20322)))

(assert (= (and d!58303 (not res!104940)) b!214362))

(assert (= (and b!214362 c!36047) b!214361))

(assert (= (and b!214362 (not c!36047)) b!214363))

(assert (= (and b!214361 res!104941) b!214360))

(assert (= (or b!214360 b!214363) bm!20319))

(declare-fun m!242073 () Bool)

(assert (=> bm!20319 m!242073))

(assert (=> b!214361 m!242061))

(declare-fun m!242075 () Bool)

(assert (=> b!214361 m!242075))

(declare-fun m!242077 () Bool)

(assert (=> b!214361 m!242077))

(assert (=> b!214361 m!242061))

(declare-fun m!242079 () Bool)

(assert (=> b!214361 m!242079))

(assert (=> b!214362 m!242061))

(assert (=> b!214362 m!242061))

(assert (=> b!214362 m!242065))

(assert (=> b!214303 d!58303))

(declare-fun b!214364 () Bool)

(declare-fun e!139409 () Bool)

(assert (=> b!214364 (= e!139409 tp_is_empty!5529)))

(declare-fun mapIsEmpty!9412 () Bool)

(declare-fun mapRes!9412 () Bool)

(assert (=> mapIsEmpty!9412 mapRes!9412))

(declare-fun mapNonEmpty!9412 () Bool)

(declare-fun tp!20095 () Bool)

(assert (=> mapNonEmpty!9412 (= mapRes!9412 (and tp!20095 e!139409))))

(declare-fun mapRest!9412 () (Array (_ BitVec 32) ValueCell!2421))

(declare-fun mapValue!9412 () ValueCell!2421)

(declare-fun mapKey!9412 () (_ BitVec 32))

(assert (=> mapNonEmpty!9412 (= mapRest!9411 (store mapRest!9412 mapKey!9412 mapValue!9412))))

(declare-fun b!214365 () Bool)

(declare-fun e!139410 () Bool)

(assert (=> b!214365 (= e!139410 tp_is_empty!5529)))

(declare-fun condMapEmpty!9412 () Bool)

(declare-fun mapDefault!9412 () ValueCell!2421)

(assert (=> mapNonEmpty!9411 (= condMapEmpty!9412 (= mapRest!9411 ((as const (Array (_ BitVec 32) ValueCell!2421)) mapDefault!9412)))))

(assert (=> mapNonEmpty!9411 (= tp!20094 (and e!139410 mapRes!9412))))

(assert (= (and mapNonEmpty!9411 condMapEmpty!9412) mapIsEmpty!9412))

(assert (= (and mapNonEmpty!9411 (not condMapEmpty!9412)) mapNonEmpty!9412))

(assert (= (and mapNonEmpty!9412 ((_ is ValueCellFull!2421) mapValue!9412)) b!214364))

(assert (= (and mapNonEmpty!9411 ((_ is ValueCellFull!2421) mapDefault!9412)) b!214365))

(declare-fun m!242081 () Bool)

(assert (=> mapNonEmpty!9412 m!242081))

(check-sat (not b_next!5667) b_and!12557 (not b!214362) (not b!214338) (not b!214326) (not bm!20313) (not bm!20319) (not b!214350) (not mapNonEmpty!9412) tp_is_empty!5529 (not d!58299) (not b!214361) (not b!214323) (not b!214324) (not b!214337) (not bm!20316))
(check-sat b_and!12557 (not b_next!5667))
