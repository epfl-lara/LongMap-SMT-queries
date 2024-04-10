; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16928 () Bool)

(assert start!16928)

(declare-fun b!170271 () Bool)

(declare-fun b_free!4191 () Bool)

(declare-fun b_next!4191 () Bool)

(assert (=> b!170271 (= b_free!4191 (not b_next!4191))))

(declare-fun tp!15192 () Bool)

(declare-fun b_and!10605 () Bool)

(assert (=> b!170271 (= tp!15192 b_and!10605)))

(declare-fun mapNonEmpty!6727 () Bool)

(declare-fun mapRes!6727 () Bool)

(declare-fun tp!15193 () Bool)

(declare-fun e!112335 () Bool)

(assert (=> mapNonEmpty!6727 (= mapRes!6727 (and tp!15193 e!112335))))

(declare-datatypes ((V!4931 0))(
  ( (V!4932 (val!2026 Int)) )
))
(declare-datatypes ((ValueCell!1638 0))(
  ( (ValueCellFull!1638 (v!3891 V!4931)) (EmptyCell!1638) )
))
(declare-fun mapValue!6727 () ValueCell!1638)

(declare-fun mapRest!6727 () (Array (_ BitVec 32) ValueCell!1638))

(declare-fun mapKey!6727 () (_ BitVec 32))

(declare-datatypes ((array!7033 0))(
  ( (array!7034 (arr!3347 (Array (_ BitVec 32) (_ BitVec 64))) (size!3639 (_ BitVec 32))) )
))
(declare-datatypes ((array!7035 0))(
  ( (array!7036 (arr!3348 (Array (_ BitVec 32) ValueCell!1638)) (size!3640 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2184 0))(
  ( (LongMapFixedSize!2185 (defaultEntry!3534 Int) (mask!8342 (_ BitVec 32)) (extraKeys!3275 (_ BitVec 32)) (zeroValue!3377 V!4931) (minValue!3377 V!4931) (_size!1141 (_ BitVec 32)) (_keys!5363 array!7033) (_values!3517 array!7035) (_vacant!1141 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2184)

(assert (=> mapNonEmpty!6727 (= (arr!3348 (_values!3517 thiss!1248)) (store mapRest!6727 mapKey!6727 mapValue!6727))))

(declare-fun b!170268 () Bool)

(declare-fun res!80946 () Bool)

(declare-fun e!112334 () Bool)

(assert (=> b!170268 (=> (not res!80946) (not e!112334))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170268 (= res!80946 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!6727 () Bool)

(assert (=> mapIsEmpty!6727 mapRes!6727))

(declare-fun res!80945 () Bool)

(assert (=> start!16928 (=> (not res!80945) (not e!112334))))

(declare-fun valid!936 (LongMapFixedSize!2184) Bool)

(assert (=> start!16928 (= res!80945 (valid!936 thiss!1248))))

(assert (=> start!16928 e!112334))

(declare-fun e!112339 () Bool)

(assert (=> start!16928 e!112339))

(assert (=> start!16928 true))

(declare-fun b!170269 () Bool)

(declare-fun res!80944 () Bool)

(assert (=> b!170269 (=> (not res!80944) (not e!112334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170269 (= res!80944 (validMask!0 (mask!8342 thiss!1248)))))

(declare-fun b!170270 () Bool)

(assert (=> b!170270 (= e!112334 (and (= (size!3640 (_values!3517 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8342 thiss!1248))) (= (size!3639 (_keys!5363 thiss!1248)) (size!3640 (_values!3517 thiss!1248))) (bvsge (mask!8342 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3275 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3275 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!112336 () Bool)

(declare-fun tp_is_empty!3963 () Bool)

(declare-fun array_inv!2141 (array!7033) Bool)

(declare-fun array_inv!2142 (array!7035) Bool)

(assert (=> b!170271 (= e!112339 (and tp!15192 tp_is_empty!3963 (array_inv!2141 (_keys!5363 thiss!1248)) (array_inv!2142 (_values!3517 thiss!1248)) e!112336))))

(declare-fun b!170272 () Bool)

(assert (=> b!170272 (= e!112335 tp_is_empty!3963)))

(declare-fun b!170273 () Bool)

(declare-fun e!112338 () Bool)

(assert (=> b!170273 (= e!112336 (and e!112338 mapRes!6727))))

(declare-fun condMapEmpty!6727 () Bool)

(declare-fun mapDefault!6727 () ValueCell!1638)

(assert (=> b!170273 (= condMapEmpty!6727 (= (arr!3348 (_values!3517 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1638)) mapDefault!6727)))))

(declare-fun b!170274 () Bool)

(assert (=> b!170274 (= e!112338 tp_is_empty!3963)))

(assert (= (and start!16928 res!80945) b!170268))

(assert (= (and b!170268 res!80946) b!170269))

(assert (= (and b!170269 res!80944) b!170270))

(assert (= (and b!170273 condMapEmpty!6727) mapIsEmpty!6727))

(assert (= (and b!170273 (not condMapEmpty!6727)) mapNonEmpty!6727))

(get-info :version)

(assert (= (and mapNonEmpty!6727 ((_ is ValueCellFull!1638) mapValue!6727)) b!170272))

(assert (= (and b!170273 ((_ is ValueCellFull!1638) mapDefault!6727)) b!170274))

(assert (= b!170271 b!170273))

(assert (= start!16928 b!170271))

(declare-fun m!198871 () Bool)

(assert (=> mapNonEmpty!6727 m!198871))

(declare-fun m!198873 () Bool)

(assert (=> start!16928 m!198873))

(declare-fun m!198875 () Bool)

(assert (=> b!170269 m!198875))

(declare-fun m!198877 () Bool)

(assert (=> b!170271 m!198877))

(declare-fun m!198879 () Bool)

(assert (=> b!170271 m!198879))

(check-sat b_and!10605 (not b!170269) (not b!170271) (not mapNonEmpty!6727) (not start!16928) (not b_next!4191) tp_is_empty!3963)
(check-sat b_and!10605 (not b_next!4191))
(get-model)

(declare-fun d!51715 () Bool)

(assert (=> d!51715 (= (array_inv!2141 (_keys!5363 thiss!1248)) (bvsge (size!3639 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170271 d!51715))

(declare-fun d!51717 () Bool)

(assert (=> d!51717 (= (array_inv!2142 (_values!3517 thiss!1248)) (bvsge (size!3640 (_values!3517 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170271 d!51717))

(declare-fun d!51719 () Bool)

(declare-fun res!80962 () Bool)

(declare-fun e!112360 () Bool)

(assert (=> d!51719 (=> (not res!80962) (not e!112360))))

(declare-fun simpleValid!132 (LongMapFixedSize!2184) Bool)

(assert (=> d!51719 (= res!80962 (simpleValid!132 thiss!1248))))

(assert (=> d!51719 (= (valid!936 thiss!1248) e!112360)))

(declare-fun b!170302 () Bool)

(declare-fun res!80963 () Bool)

(assert (=> b!170302 (=> (not res!80963) (not e!112360))))

(declare-fun arrayCountValidKeys!0 (array!7033 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170302 (= res!80963 (= (arrayCountValidKeys!0 (_keys!5363 thiss!1248) #b00000000000000000000000000000000 (size!3639 (_keys!5363 thiss!1248))) (_size!1141 thiss!1248)))))

(declare-fun b!170303 () Bool)

(declare-fun res!80964 () Bool)

(assert (=> b!170303 (=> (not res!80964) (not e!112360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7033 (_ BitVec 32)) Bool)

(assert (=> b!170303 (= res!80964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5363 thiss!1248) (mask!8342 thiss!1248)))))

(declare-fun b!170304 () Bool)

(declare-datatypes ((List!2188 0))(
  ( (Nil!2185) (Cons!2184 (h!2801 (_ BitVec 64)) (t!6990 List!2188)) )
))
(declare-fun arrayNoDuplicates!0 (array!7033 (_ BitVec 32) List!2188) Bool)

(assert (=> b!170304 (= e!112360 (arrayNoDuplicates!0 (_keys!5363 thiss!1248) #b00000000000000000000000000000000 Nil!2185))))

(assert (= (and d!51719 res!80962) b!170302))

(assert (= (and b!170302 res!80963) b!170303))

(assert (= (and b!170303 res!80964) b!170304))

(declare-fun m!198891 () Bool)

(assert (=> d!51719 m!198891))

(declare-fun m!198893 () Bool)

(assert (=> b!170302 m!198893))

(declare-fun m!198895 () Bool)

(assert (=> b!170303 m!198895))

(declare-fun m!198897 () Bool)

(assert (=> b!170304 m!198897))

(assert (=> start!16928 d!51719))

(declare-fun d!51721 () Bool)

(assert (=> d!51721 (= (validMask!0 (mask!8342 thiss!1248)) (and (or (= (mask!8342 thiss!1248) #b00000000000000000000000000000111) (= (mask!8342 thiss!1248) #b00000000000000000000000000001111) (= (mask!8342 thiss!1248) #b00000000000000000000000000011111) (= (mask!8342 thiss!1248) #b00000000000000000000000000111111) (= (mask!8342 thiss!1248) #b00000000000000000000000001111111) (= (mask!8342 thiss!1248) #b00000000000000000000000011111111) (= (mask!8342 thiss!1248) #b00000000000000000000000111111111) (= (mask!8342 thiss!1248) #b00000000000000000000001111111111) (= (mask!8342 thiss!1248) #b00000000000000000000011111111111) (= (mask!8342 thiss!1248) #b00000000000000000000111111111111) (= (mask!8342 thiss!1248) #b00000000000000000001111111111111) (= (mask!8342 thiss!1248) #b00000000000000000011111111111111) (= (mask!8342 thiss!1248) #b00000000000000000111111111111111) (= (mask!8342 thiss!1248) #b00000000000000001111111111111111) (= (mask!8342 thiss!1248) #b00000000000000011111111111111111) (= (mask!8342 thiss!1248) #b00000000000000111111111111111111) (= (mask!8342 thiss!1248) #b00000000000001111111111111111111) (= (mask!8342 thiss!1248) #b00000000000011111111111111111111) (= (mask!8342 thiss!1248) #b00000000000111111111111111111111) (= (mask!8342 thiss!1248) #b00000000001111111111111111111111) (= (mask!8342 thiss!1248) #b00000000011111111111111111111111) (= (mask!8342 thiss!1248) #b00000000111111111111111111111111) (= (mask!8342 thiss!1248) #b00000001111111111111111111111111) (= (mask!8342 thiss!1248) #b00000011111111111111111111111111) (= (mask!8342 thiss!1248) #b00000111111111111111111111111111) (= (mask!8342 thiss!1248) #b00001111111111111111111111111111) (= (mask!8342 thiss!1248) #b00011111111111111111111111111111) (= (mask!8342 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8342 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170269 d!51721))

(declare-fun b!170312 () Bool)

(declare-fun e!112365 () Bool)

(assert (=> b!170312 (= e!112365 tp_is_empty!3963)))

(declare-fun condMapEmpty!6733 () Bool)

(declare-fun mapDefault!6733 () ValueCell!1638)

(assert (=> mapNonEmpty!6727 (= condMapEmpty!6733 (= mapRest!6727 ((as const (Array (_ BitVec 32) ValueCell!1638)) mapDefault!6733)))))

(declare-fun mapRes!6733 () Bool)

(assert (=> mapNonEmpty!6727 (= tp!15193 (and e!112365 mapRes!6733))))

(declare-fun b!170311 () Bool)

(declare-fun e!112366 () Bool)

(assert (=> b!170311 (= e!112366 tp_is_empty!3963)))

(declare-fun mapNonEmpty!6733 () Bool)

(declare-fun tp!15202 () Bool)

(assert (=> mapNonEmpty!6733 (= mapRes!6733 (and tp!15202 e!112366))))

(declare-fun mapKey!6733 () (_ BitVec 32))

(declare-fun mapValue!6733 () ValueCell!1638)

(declare-fun mapRest!6733 () (Array (_ BitVec 32) ValueCell!1638))

(assert (=> mapNonEmpty!6733 (= mapRest!6727 (store mapRest!6733 mapKey!6733 mapValue!6733))))

(declare-fun mapIsEmpty!6733 () Bool)

(assert (=> mapIsEmpty!6733 mapRes!6733))

(assert (= (and mapNonEmpty!6727 condMapEmpty!6733) mapIsEmpty!6733))

(assert (= (and mapNonEmpty!6727 (not condMapEmpty!6733)) mapNonEmpty!6733))

(assert (= (and mapNonEmpty!6733 ((_ is ValueCellFull!1638) mapValue!6733)) b!170311))

(assert (= (and mapNonEmpty!6727 ((_ is ValueCellFull!1638) mapDefault!6733)) b!170312))

(declare-fun m!198899 () Bool)

(assert (=> mapNonEmpty!6733 m!198899))

(check-sat (not mapNonEmpty!6733) (not b!170302) (not b!170303) b_and!10605 (not b!170304) (not d!51719) (not b_next!4191) tp_is_empty!3963)
(check-sat b_and!10605 (not b_next!4191))
(get-model)

(declare-fun d!51723 () Bool)

(declare-fun res!80975 () Bool)

(declare-fun e!112369 () Bool)

(assert (=> d!51723 (=> (not res!80975) (not e!112369))))

(assert (=> d!51723 (= res!80975 (validMask!0 (mask!8342 thiss!1248)))))

(assert (=> d!51723 (= (simpleValid!132 thiss!1248) e!112369)))

(declare-fun b!170323 () Bool)

(declare-fun res!80974 () Bool)

(assert (=> b!170323 (=> (not res!80974) (not e!112369))))

(declare-fun size!3643 (LongMapFixedSize!2184) (_ BitVec 32))

(assert (=> b!170323 (= res!80974 (= (size!3643 thiss!1248) (bvadd (_size!1141 thiss!1248) (bvsdiv (bvadd (extraKeys!3275 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!170322 () Bool)

(declare-fun res!80973 () Bool)

(assert (=> b!170322 (=> (not res!80973) (not e!112369))))

(assert (=> b!170322 (= res!80973 (bvsge (size!3643 thiss!1248) (_size!1141 thiss!1248)))))

(declare-fun b!170324 () Bool)

(assert (=> b!170324 (= e!112369 (and (bvsge (extraKeys!3275 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3275 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1141 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170321 () Bool)

(declare-fun res!80976 () Bool)

(assert (=> b!170321 (=> (not res!80976) (not e!112369))))

(assert (=> b!170321 (= res!80976 (and (= (size!3640 (_values!3517 thiss!1248)) (bvadd (mask!8342 thiss!1248) #b00000000000000000000000000000001)) (= (size!3639 (_keys!5363 thiss!1248)) (size!3640 (_values!3517 thiss!1248))) (bvsge (_size!1141 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1141 thiss!1248) (bvadd (mask!8342 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51723 res!80975) b!170321))

(assert (= (and b!170321 res!80976) b!170322))

(assert (= (and b!170322 res!80973) b!170323))

(assert (= (and b!170323 res!80974) b!170324))

(assert (=> d!51723 m!198875))

(declare-fun m!198901 () Bool)

(assert (=> b!170323 m!198901))

(assert (=> b!170322 m!198901))

(assert (=> d!51719 d!51723))

(declare-fun d!51725 () Bool)

(declare-fun lt!85000 () (_ BitVec 32))

(assert (=> d!51725 (and (bvsge lt!85000 #b00000000000000000000000000000000) (bvsle lt!85000 (bvsub (size!3639 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!112375 () (_ BitVec 32))

(assert (=> d!51725 (= lt!85000 e!112375)))

(declare-fun c!30480 () Bool)

(assert (=> d!51725 (= c!30480 (bvsge #b00000000000000000000000000000000 (size!3639 (_keys!5363 thiss!1248))))))

(assert (=> d!51725 (and (bvsle #b00000000000000000000000000000000 (size!3639 (_keys!5363 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3639 (_keys!5363 thiss!1248)) (size!3639 (_keys!5363 thiss!1248))))))

(assert (=> d!51725 (= (arrayCountValidKeys!0 (_keys!5363 thiss!1248) #b00000000000000000000000000000000 (size!3639 (_keys!5363 thiss!1248))) lt!85000)))

(declare-fun bm!17371 () Bool)

(declare-fun call!17374 () (_ BitVec 32))

(assert (=> bm!17371 (= call!17374 (arrayCountValidKeys!0 (_keys!5363 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3639 (_keys!5363 thiss!1248))))))

(declare-fun b!170333 () Bool)

(assert (=> b!170333 (= e!112375 #b00000000000000000000000000000000)))

(declare-fun b!170334 () Bool)

(declare-fun e!112374 () (_ BitVec 32))

(assert (=> b!170334 (= e!112375 e!112374)))

(declare-fun c!30481 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170334 (= c!30481 (validKeyInArray!0 (select (arr!3347 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170335 () Bool)

(assert (=> b!170335 (= e!112374 call!17374)))

(declare-fun b!170336 () Bool)

(assert (=> b!170336 (= e!112374 (bvadd #b00000000000000000000000000000001 call!17374))))

(assert (= (and d!51725 c!30480) b!170333))

(assert (= (and d!51725 (not c!30480)) b!170334))

(assert (= (and b!170334 c!30481) b!170336))

(assert (= (and b!170334 (not c!30481)) b!170335))

(assert (= (or b!170336 b!170335) bm!17371))

(declare-fun m!198903 () Bool)

(assert (=> bm!17371 m!198903))

(declare-fun m!198905 () Bool)

(assert (=> b!170334 m!198905))

(assert (=> b!170334 m!198905))

(declare-fun m!198907 () Bool)

(assert (=> b!170334 m!198907))

(assert (=> b!170302 d!51725))

(declare-fun b!170347 () Bool)

(declare-fun e!112387 () Bool)

(declare-fun e!112386 () Bool)

(assert (=> b!170347 (= e!112387 e!112386)))

(declare-fun c!30484 () Bool)

(assert (=> b!170347 (= c!30484 (validKeyInArray!0 (select (arr!3347 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170348 () Bool)

(declare-fun call!17377 () Bool)

(assert (=> b!170348 (= e!112386 call!17377)))

(declare-fun bm!17374 () Bool)

(assert (=> bm!17374 (= call!17377 (arrayNoDuplicates!0 (_keys!5363 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30484 (Cons!2184 (select (arr!3347 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000) Nil!2185) Nil!2185)))))

(declare-fun b!170349 () Bool)

(assert (=> b!170349 (= e!112386 call!17377)))

(declare-fun d!51727 () Bool)

(declare-fun res!80984 () Bool)

(declare-fun e!112384 () Bool)

(assert (=> d!51727 (=> res!80984 e!112384)))

(assert (=> d!51727 (= res!80984 (bvsge #b00000000000000000000000000000000 (size!3639 (_keys!5363 thiss!1248))))))

(assert (=> d!51727 (= (arrayNoDuplicates!0 (_keys!5363 thiss!1248) #b00000000000000000000000000000000 Nil!2185) e!112384)))

(declare-fun b!170350 () Bool)

(assert (=> b!170350 (= e!112384 e!112387)))

(declare-fun res!80985 () Bool)

(assert (=> b!170350 (=> (not res!80985) (not e!112387))))

(declare-fun e!112385 () Bool)

(assert (=> b!170350 (= res!80985 (not e!112385))))

(declare-fun res!80983 () Bool)

(assert (=> b!170350 (=> (not res!80983) (not e!112385))))

(assert (=> b!170350 (= res!80983 (validKeyInArray!0 (select (arr!3347 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170351 () Bool)

(declare-fun contains!1141 (List!2188 (_ BitVec 64)) Bool)

(assert (=> b!170351 (= e!112385 (contains!1141 Nil!2185 (select (arr!3347 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51727 (not res!80984)) b!170350))

(assert (= (and b!170350 res!80983) b!170351))

(assert (= (and b!170350 res!80985) b!170347))

(assert (= (and b!170347 c!30484) b!170349))

(assert (= (and b!170347 (not c!30484)) b!170348))

(assert (= (or b!170349 b!170348) bm!17374))

(assert (=> b!170347 m!198905))

(assert (=> b!170347 m!198905))

(assert (=> b!170347 m!198907))

(assert (=> bm!17374 m!198905))

(declare-fun m!198909 () Bool)

(assert (=> bm!17374 m!198909))

(assert (=> b!170350 m!198905))

(assert (=> b!170350 m!198905))

(assert (=> b!170350 m!198907))

(assert (=> b!170351 m!198905))

(assert (=> b!170351 m!198905))

(declare-fun m!198911 () Bool)

(assert (=> b!170351 m!198911))

(assert (=> b!170304 d!51727))

(declare-fun b!170360 () Bool)

(declare-fun e!112396 () Bool)

(declare-fun call!17380 () Bool)

(assert (=> b!170360 (= e!112396 call!17380)))

(declare-fun d!51729 () Bool)

(declare-fun res!80991 () Bool)

(declare-fun e!112394 () Bool)

(assert (=> d!51729 (=> res!80991 e!112394)))

(assert (=> d!51729 (= res!80991 (bvsge #b00000000000000000000000000000000 (size!3639 (_keys!5363 thiss!1248))))))

(assert (=> d!51729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5363 thiss!1248) (mask!8342 thiss!1248)) e!112394)))

(declare-fun bm!17377 () Bool)

(assert (=> bm!17377 (= call!17380 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5363 thiss!1248) (mask!8342 thiss!1248)))))

(declare-fun b!170361 () Bool)

(declare-fun e!112395 () Bool)

(assert (=> b!170361 (= e!112395 call!17380)))

(declare-fun b!170362 () Bool)

(assert (=> b!170362 (= e!112394 e!112395)))

(declare-fun c!30487 () Bool)

(assert (=> b!170362 (= c!30487 (validKeyInArray!0 (select (arr!3347 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170363 () Bool)

(assert (=> b!170363 (= e!112395 e!112396)))

(declare-fun lt!85007 () (_ BitVec 64))

(assert (=> b!170363 (= lt!85007 (select (arr!3347 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5244 0))(
  ( (Unit!5245) )
))
(declare-fun lt!85009 () Unit!5244)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7033 (_ BitVec 64) (_ BitVec 32)) Unit!5244)

(assert (=> b!170363 (= lt!85009 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5363 thiss!1248) lt!85007 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170363 (arrayContainsKey!0 (_keys!5363 thiss!1248) lt!85007 #b00000000000000000000000000000000)))

(declare-fun lt!85008 () Unit!5244)

(assert (=> b!170363 (= lt!85008 lt!85009)))

(declare-fun res!80990 () Bool)

(declare-datatypes ((SeekEntryResult!531 0))(
  ( (MissingZero!531 (index!4292 (_ BitVec 32))) (Found!531 (index!4293 (_ BitVec 32))) (Intermediate!531 (undefined!1343 Bool) (index!4294 (_ BitVec 32)) (x!18861 (_ BitVec 32))) (Undefined!531) (MissingVacant!531 (index!4295 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7033 (_ BitVec 32)) SeekEntryResult!531)

(assert (=> b!170363 (= res!80990 (= (seekEntryOrOpen!0 (select (arr!3347 (_keys!5363 thiss!1248)) #b00000000000000000000000000000000) (_keys!5363 thiss!1248) (mask!8342 thiss!1248)) (Found!531 #b00000000000000000000000000000000)))))

(assert (=> b!170363 (=> (not res!80990) (not e!112396))))

(assert (= (and d!51729 (not res!80991)) b!170362))

(assert (= (and b!170362 c!30487) b!170363))

(assert (= (and b!170362 (not c!30487)) b!170361))

(assert (= (and b!170363 res!80990) b!170360))

(assert (= (or b!170360 b!170361) bm!17377))

(declare-fun m!198913 () Bool)

(assert (=> bm!17377 m!198913))

(assert (=> b!170362 m!198905))

(assert (=> b!170362 m!198905))

(assert (=> b!170362 m!198907))

(assert (=> b!170363 m!198905))

(declare-fun m!198915 () Bool)

(assert (=> b!170363 m!198915))

(declare-fun m!198917 () Bool)

(assert (=> b!170363 m!198917))

(assert (=> b!170363 m!198905))

(declare-fun m!198919 () Bool)

(assert (=> b!170363 m!198919))

(assert (=> b!170303 d!51729))

(declare-fun b!170365 () Bool)

(declare-fun e!112397 () Bool)

(assert (=> b!170365 (= e!112397 tp_is_empty!3963)))

(declare-fun condMapEmpty!6734 () Bool)

(declare-fun mapDefault!6734 () ValueCell!1638)

(assert (=> mapNonEmpty!6733 (= condMapEmpty!6734 (= mapRest!6733 ((as const (Array (_ BitVec 32) ValueCell!1638)) mapDefault!6734)))))

(declare-fun mapRes!6734 () Bool)

(assert (=> mapNonEmpty!6733 (= tp!15202 (and e!112397 mapRes!6734))))

(declare-fun b!170364 () Bool)

(declare-fun e!112398 () Bool)

(assert (=> b!170364 (= e!112398 tp_is_empty!3963)))

(declare-fun mapNonEmpty!6734 () Bool)

(declare-fun tp!15203 () Bool)

(assert (=> mapNonEmpty!6734 (= mapRes!6734 (and tp!15203 e!112398))))

(declare-fun mapValue!6734 () ValueCell!1638)

(declare-fun mapRest!6734 () (Array (_ BitVec 32) ValueCell!1638))

(declare-fun mapKey!6734 () (_ BitVec 32))

(assert (=> mapNonEmpty!6734 (= mapRest!6733 (store mapRest!6734 mapKey!6734 mapValue!6734))))

(declare-fun mapIsEmpty!6734 () Bool)

(assert (=> mapIsEmpty!6734 mapRes!6734))

(assert (= (and mapNonEmpty!6733 condMapEmpty!6734) mapIsEmpty!6734))

(assert (= (and mapNonEmpty!6733 (not condMapEmpty!6734)) mapNonEmpty!6734))

(assert (= (and mapNonEmpty!6734 ((_ is ValueCellFull!1638) mapValue!6734)) b!170364))

(assert (= (and mapNonEmpty!6733 ((_ is ValueCellFull!1638) mapDefault!6734)) b!170365))

(declare-fun m!198921 () Bool)

(assert (=> mapNonEmpty!6734 m!198921))

(check-sat (not b!170347) (not b!170334) (not d!51723) b_and!10605 (not bm!17377) (not b!170350) (not mapNonEmpty!6734) (not b!170362) (not b!170322) (not b!170351) (not b!170323) (not bm!17371) (not bm!17374) (not b!170363) (not b_next!4191) tp_is_empty!3963)
(check-sat b_and!10605 (not b_next!4191))
