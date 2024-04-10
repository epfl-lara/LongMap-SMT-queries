; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16906 () Bool)

(assert start!16906)

(declare-fun b!170135 () Bool)

(declare-fun b_free!4185 () Bool)

(declare-fun b_next!4185 () Bool)

(assert (=> b!170135 (= b_free!4185 (not b_next!4185))))

(declare-fun tp!15170 () Bool)

(declare-fun b_and!10599 () Bool)

(assert (=> b!170135 (= tp!15170 b_and!10599)))

(declare-fun mapIsEmpty!6714 () Bool)

(declare-fun mapRes!6714 () Bool)

(assert (=> mapIsEmpty!6714 mapRes!6714))

(declare-fun res!80881 () Bool)

(declare-fun e!112242 () Bool)

(assert (=> start!16906 (=> (not res!80881) (not e!112242))))

(declare-datatypes ((V!4923 0))(
  ( (V!4924 (val!2023 Int)) )
))
(declare-datatypes ((ValueCell!1635 0))(
  ( (ValueCellFull!1635 (v!3888 V!4923)) (EmptyCell!1635) )
))
(declare-datatypes ((array!7019 0))(
  ( (array!7020 (arr!3341 (Array (_ BitVec 32) (_ BitVec 64))) (size!3632 (_ BitVec 32))) )
))
(declare-datatypes ((array!7021 0))(
  ( (array!7022 (arr!3342 (Array (_ BitVec 32) ValueCell!1635)) (size!3633 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2178 0))(
  ( (LongMapFixedSize!2179 (defaultEntry!3531 Int) (mask!8335 (_ BitVec 32)) (extraKeys!3272 (_ BitVec 32)) (zeroValue!3374 V!4923) (minValue!3374 V!4923) (_size!1138 (_ BitVec 32)) (_keys!5359 array!7019) (_values!3514 array!7021) (_vacant!1138 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2178)

(declare-fun valid!935 (LongMapFixedSize!2178) Bool)

(assert (=> start!16906 (= res!80881 (valid!935 thiss!1248))))

(assert (=> start!16906 e!112242))

(declare-fun e!112241 () Bool)

(assert (=> start!16906 e!112241))

(assert (=> start!16906 true))

(declare-fun e!112244 () Bool)

(declare-fun tp_is_empty!3957 () Bool)

(declare-fun array_inv!2139 (array!7019) Bool)

(declare-fun array_inv!2140 (array!7021) Bool)

(assert (=> b!170135 (= e!112241 (and tp!15170 tp_is_empty!3957 (array_inv!2139 (_keys!5359 thiss!1248)) (array_inv!2140 (_values!3514 thiss!1248)) e!112244))))

(declare-fun b!170136 () Bool)

(declare-fun res!80883 () Bool)

(assert (=> b!170136 (=> (not res!80883) (not e!112242))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170136 (= res!80883 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170137 () Bool)

(declare-fun res!80882 () Bool)

(assert (=> b!170137 (=> (not res!80882) (not e!112242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170137 (= res!80882 (validMask!0 (mask!8335 thiss!1248)))))

(declare-fun b!170138 () Bool)

(declare-fun e!112239 () Bool)

(assert (=> b!170138 (= e!112244 (and e!112239 mapRes!6714))))

(declare-fun condMapEmpty!6714 () Bool)

(declare-fun mapDefault!6714 () ValueCell!1635)

(assert (=> b!170138 (= condMapEmpty!6714 (= (arr!3342 (_values!3514 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1635)) mapDefault!6714)))))

(declare-fun b!170139 () Bool)

(assert (=> b!170139 (= e!112242 (and (= (size!3633 (_values!3514 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8335 thiss!1248))) (= (size!3632 (_keys!5359 thiss!1248)) (size!3633 (_values!3514 thiss!1248))) (bvsge (mask!8335 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3272 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170140 () Bool)

(declare-fun e!112243 () Bool)

(assert (=> b!170140 (= e!112243 tp_is_empty!3957)))

(declare-fun b!170141 () Bool)

(assert (=> b!170141 (= e!112239 tp_is_empty!3957)))

(declare-fun mapNonEmpty!6714 () Bool)

(declare-fun tp!15171 () Bool)

(assert (=> mapNonEmpty!6714 (= mapRes!6714 (and tp!15171 e!112243))))

(declare-fun mapValue!6714 () ValueCell!1635)

(declare-fun mapKey!6714 () (_ BitVec 32))

(declare-fun mapRest!6714 () (Array (_ BitVec 32) ValueCell!1635))

(assert (=> mapNonEmpty!6714 (= (arr!3342 (_values!3514 thiss!1248)) (store mapRest!6714 mapKey!6714 mapValue!6714))))

(assert (= (and start!16906 res!80881) b!170136))

(assert (= (and b!170136 res!80883) b!170137))

(assert (= (and b!170137 res!80882) b!170139))

(assert (= (and b!170138 condMapEmpty!6714) mapIsEmpty!6714))

(assert (= (and b!170138 (not condMapEmpty!6714)) mapNonEmpty!6714))

(get-info :version)

(assert (= (and mapNonEmpty!6714 ((_ is ValueCellFull!1635) mapValue!6714)) b!170140))

(assert (= (and b!170138 ((_ is ValueCellFull!1635) mapDefault!6714)) b!170141))

(assert (= b!170135 b!170138))

(assert (= start!16906 b!170135))

(declare-fun m!198809 () Bool)

(assert (=> start!16906 m!198809))

(declare-fun m!198811 () Bool)

(assert (=> b!170135 m!198811))

(declare-fun m!198813 () Bool)

(assert (=> b!170135 m!198813))

(declare-fun m!198815 () Bool)

(assert (=> b!170137 m!198815))

(declare-fun m!198817 () Bool)

(assert (=> mapNonEmpty!6714 m!198817))

(check-sat (not mapNonEmpty!6714) (not start!16906) b_and!10599 (not b_next!4185) (not b!170135) tp_is_empty!3957 (not b!170137))
(check-sat b_and!10599 (not b_next!4185))
(get-model)

(declare-fun d!51697 () Bool)

(declare-fun res!80899 () Bool)

(declare-fun e!112265 () Bool)

(assert (=> d!51697 (=> (not res!80899) (not e!112265))))

(declare-fun simpleValid!131 (LongMapFixedSize!2178) Bool)

(assert (=> d!51697 (= res!80899 (simpleValid!131 thiss!1248))))

(assert (=> d!51697 (= (valid!935 thiss!1248) e!112265)))

(declare-fun b!170169 () Bool)

(declare-fun res!80900 () Bool)

(assert (=> b!170169 (=> (not res!80900) (not e!112265))))

(declare-fun arrayCountValidKeys!0 (array!7019 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170169 (= res!80900 (= (arrayCountValidKeys!0 (_keys!5359 thiss!1248) #b00000000000000000000000000000000 (size!3632 (_keys!5359 thiss!1248))) (_size!1138 thiss!1248)))))

(declare-fun b!170170 () Bool)

(declare-fun res!80901 () Bool)

(assert (=> b!170170 (=> (not res!80901) (not e!112265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7019 (_ BitVec 32)) Bool)

(assert (=> b!170170 (= res!80901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5359 thiss!1248) (mask!8335 thiss!1248)))))

(declare-fun b!170171 () Bool)

(declare-datatypes ((List!2187 0))(
  ( (Nil!2184) (Cons!2183 (h!2800 (_ BitVec 64)) (t!6989 List!2187)) )
))
(declare-fun arrayNoDuplicates!0 (array!7019 (_ BitVec 32) List!2187) Bool)

(assert (=> b!170171 (= e!112265 (arrayNoDuplicates!0 (_keys!5359 thiss!1248) #b00000000000000000000000000000000 Nil!2184))))

(assert (= (and d!51697 res!80899) b!170169))

(assert (= (and b!170169 res!80900) b!170170))

(assert (= (and b!170170 res!80901) b!170171))

(declare-fun m!198829 () Bool)

(assert (=> d!51697 m!198829))

(declare-fun m!198831 () Bool)

(assert (=> b!170169 m!198831))

(declare-fun m!198833 () Bool)

(assert (=> b!170170 m!198833))

(declare-fun m!198835 () Bool)

(assert (=> b!170171 m!198835))

(assert (=> start!16906 d!51697))

(declare-fun d!51699 () Bool)

(assert (=> d!51699 (= (validMask!0 (mask!8335 thiss!1248)) (and (or (= (mask!8335 thiss!1248) #b00000000000000000000000000000111) (= (mask!8335 thiss!1248) #b00000000000000000000000000001111) (= (mask!8335 thiss!1248) #b00000000000000000000000000011111) (= (mask!8335 thiss!1248) #b00000000000000000000000000111111) (= (mask!8335 thiss!1248) #b00000000000000000000000001111111) (= (mask!8335 thiss!1248) #b00000000000000000000000011111111) (= (mask!8335 thiss!1248) #b00000000000000000000000111111111) (= (mask!8335 thiss!1248) #b00000000000000000000001111111111) (= (mask!8335 thiss!1248) #b00000000000000000000011111111111) (= (mask!8335 thiss!1248) #b00000000000000000000111111111111) (= (mask!8335 thiss!1248) #b00000000000000000001111111111111) (= (mask!8335 thiss!1248) #b00000000000000000011111111111111) (= (mask!8335 thiss!1248) #b00000000000000000111111111111111) (= (mask!8335 thiss!1248) #b00000000000000001111111111111111) (= (mask!8335 thiss!1248) #b00000000000000011111111111111111) (= (mask!8335 thiss!1248) #b00000000000000111111111111111111) (= (mask!8335 thiss!1248) #b00000000000001111111111111111111) (= (mask!8335 thiss!1248) #b00000000000011111111111111111111) (= (mask!8335 thiss!1248) #b00000000000111111111111111111111) (= (mask!8335 thiss!1248) #b00000000001111111111111111111111) (= (mask!8335 thiss!1248) #b00000000011111111111111111111111) (= (mask!8335 thiss!1248) #b00000000111111111111111111111111) (= (mask!8335 thiss!1248) #b00000001111111111111111111111111) (= (mask!8335 thiss!1248) #b00000011111111111111111111111111) (= (mask!8335 thiss!1248) #b00000111111111111111111111111111) (= (mask!8335 thiss!1248) #b00001111111111111111111111111111) (= (mask!8335 thiss!1248) #b00011111111111111111111111111111) (= (mask!8335 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8335 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170137 d!51699))

(declare-fun d!51701 () Bool)

(assert (=> d!51701 (= (array_inv!2139 (_keys!5359 thiss!1248)) (bvsge (size!3632 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170135 d!51701))

(declare-fun d!51703 () Bool)

(assert (=> d!51703 (= (array_inv!2140 (_values!3514 thiss!1248)) (bvsge (size!3633 (_values!3514 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170135 d!51703))

(declare-fun b!170178 () Bool)

(declare-fun e!112271 () Bool)

(assert (=> b!170178 (= e!112271 tp_is_empty!3957)))

(declare-fun mapIsEmpty!6720 () Bool)

(declare-fun mapRes!6720 () Bool)

(assert (=> mapIsEmpty!6720 mapRes!6720))

(declare-fun mapNonEmpty!6720 () Bool)

(declare-fun tp!15180 () Bool)

(assert (=> mapNonEmpty!6720 (= mapRes!6720 (and tp!15180 e!112271))))

(declare-fun mapValue!6720 () ValueCell!1635)

(declare-fun mapRest!6720 () (Array (_ BitVec 32) ValueCell!1635))

(declare-fun mapKey!6720 () (_ BitVec 32))

(assert (=> mapNonEmpty!6720 (= mapRest!6714 (store mapRest!6720 mapKey!6720 mapValue!6720))))

(declare-fun condMapEmpty!6720 () Bool)

(declare-fun mapDefault!6720 () ValueCell!1635)

(assert (=> mapNonEmpty!6714 (= condMapEmpty!6720 (= mapRest!6714 ((as const (Array (_ BitVec 32) ValueCell!1635)) mapDefault!6720)))))

(declare-fun e!112270 () Bool)

(assert (=> mapNonEmpty!6714 (= tp!15171 (and e!112270 mapRes!6720))))

(declare-fun b!170179 () Bool)

(assert (=> b!170179 (= e!112270 tp_is_empty!3957)))

(assert (= (and mapNonEmpty!6714 condMapEmpty!6720) mapIsEmpty!6720))

(assert (= (and mapNonEmpty!6714 (not condMapEmpty!6720)) mapNonEmpty!6720))

(assert (= (and mapNonEmpty!6720 ((_ is ValueCellFull!1635) mapValue!6720)) b!170178))

(assert (= (and mapNonEmpty!6714 ((_ is ValueCellFull!1635) mapDefault!6720)) b!170179))

(declare-fun m!198837 () Bool)

(assert (=> mapNonEmpty!6720 m!198837))

(check-sat (not b!170171) (not mapNonEmpty!6720) (not d!51697) (not b_next!4185) (not b!170169) b_and!10599 tp_is_empty!3957 (not b!170170))
(check-sat b_and!10599 (not b_next!4185))
(get-model)

(declare-fun b!170190 () Bool)

(declare-fun res!80911 () Bool)

(declare-fun e!112274 () Bool)

(assert (=> b!170190 (=> (not res!80911) (not e!112274))))

(declare-fun size!3636 (LongMapFixedSize!2178) (_ BitVec 32))

(assert (=> b!170190 (= res!80911 (= (size!3636 thiss!1248) (bvadd (_size!1138 thiss!1248) (bvsdiv (bvadd (extraKeys!3272 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!170188 () Bool)

(declare-fun res!80910 () Bool)

(assert (=> b!170188 (=> (not res!80910) (not e!112274))))

(assert (=> b!170188 (= res!80910 (and (= (size!3633 (_values!3514 thiss!1248)) (bvadd (mask!8335 thiss!1248) #b00000000000000000000000000000001)) (= (size!3632 (_keys!5359 thiss!1248)) (size!3633 (_values!3514 thiss!1248))) (bvsge (_size!1138 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1138 thiss!1248) (bvadd (mask!8335 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!170191 () Bool)

(assert (=> b!170191 (= e!112274 (and (bvsge (extraKeys!3272 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3272 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1138 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170189 () Bool)

(declare-fun res!80913 () Bool)

(assert (=> b!170189 (=> (not res!80913) (not e!112274))))

(assert (=> b!170189 (= res!80913 (bvsge (size!3636 thiss!1248) (_size!1138 thiss!1248)))))

(declare-fun d!51705 () Bool)

(declare-fun res!80912 () Bool)

(assert (=> d!51705 (=> (not res!80912) (not e!112274))))

(assert (=> d!51705 (= res!80912 (validMask!0 (mask!8335 thiss!1248)))))

(assert (=> d!51705 (= (simpleValid!131 thiss!1248) e!112274)))

(assert (= (and d!51705 res!80912) b!170188))

(assert (= (and b!170188 res!80910) b!170189))

(assert (= (and b!170189 res!80913) b!170190))

(assert (= (and b!170190 res!80911) b!170191))

(declare-fun m!198839 () Bool)

(assert (=> b!170190 m!198839))

(assert (=> b!170189 m!198839))

(assert (=> d!51705 m!198815))

(assert (=> d!51697 d!51705))

(declare-fun d!51707 () Bool)

(declare-fun res!80918 () Bool)

(declare-fun e!112282 () Bool)

(assert (=> d!51707 (=> res!80918 e!112282)))

(assert (=> d!51707 (= res!80918 (bvsge #b00000000000000000000000000000000 (size!3632 (_keys!5359 thiss!1248))))))

(assert (=> d!51707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5359 thiss!1248) (mask!8335 thiss!1248)) e!112282)))

(declare-fun bm!17362 () Bool)

(declare-fun call!17365 () Bool)

(assert (=> bm!17362 (= call!17365 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5359 thiss!1248) (mask!8335 thiss!1248)))))

(declare-fun b!170200 () Bool)

(declare-fun e!112281 () Bool)

(assert (=> b!170200 (= e!112281 call!17365)))

(declare-fun b!170201 () Bool)

(declare-fun e!112283 () Bool)

(assert (=> b!170201 (= e!112283 e!112281)))

(declare-fun lt!84993 () (_ BitVec 64))

(assert (=> b!170201 (= lt!84993 (select (arr!3341 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5242 0))(
  ( (Unit!5243) )
))
(declare-fun lt!84992 () Unit!5242)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7019 (_ BitVec 64) (_ BitVec 32)) Unit!5242)

(assert (=> b!170201 (= lt!84992 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5359 thiss!1248) lt!84993 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170201 (arrayContainsKey!0 (_keys!5359 thiss!1248) lt!84993 #b00000000000000000000000000000000)))

(declare-fun lt!84994 () Unit!5242)

(assert (=> b!170201 (= lt!84994 lt!84992)))

(declare-fun res!80919 () Bool)

(declare-datatypes ((SeekEntryResult!530 0))(
  ( (MissingZero!530 (index!4288 (_ BitVec 32))) (Found!530 (index!4289 (_ BitVec 32))) (Intermediate!530 (undefined!1342 Bool) (index!4290 (_ BitVec 32)) (x!18838 (_ BitVec 32))) (Undefined!530) (MissingVacant!530 (index!4291 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7019 (_ BitVec 32)) SeekEntryResult!530)

(assert (=> b!170201 (= res!80919 (= (seekEntryOrOpen!0 (select (arr!3341 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000) (_keys!5359 thiss!1248) (mask!8335 thiss!1248)) (Found!530 #b00000000000000000000000000000000)))))

(assert (=> b!170201 (=> (not res!80919) (not e!112281))))

(declare-fun b!170202 () Bool)

(assert (=> b!170202 (= e!112283 call!17365)))

(declare-fun b!170203 () Bool)

(assert (=> b!170203 (= e!112282 e!112283)))

(declare-fun c!30466 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170203 (= c!30466 (validKeyInArray!0 (select (arr!3341 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51707 (not res!80918)) b!170203))

(assert (= (and b!170203 c!30466) b!170201))

(assert (= (and b!170203 (not c!30466)) b!170202))

(assert (= (and b!170201 res!80919) b!170200))

(assert (= (or b!170200 b!170202) bm!17362))

(declare-fun m!198841 () Bool)

(assert (=> bm!17362 m!198841))

(declare-fun m!198843 () Bool)

(assert (=> b!170201 m!198843))

(declare-fun m!198845 () Bool)

(assert (=> b!170201 m!198845))

(declare-fun m!198847 () Bool)

(assert (=> b!170201 m!198847))

(assert (=> b!170201 m!198843))

(declare-fun m!198849 () Bool)

(assert (=> b!170201 m!198849))

(assert (=> b!170203 m!198843))

(assert (=> b!170203 m!198843))

(declare-fun m!198851 () Bool)

(assert (=> b!170203 m!198851))

(assert (=> b!170170 d!51707))

(declare-fun b!170214 () Bool)

(declare-fun e!112293 () Bool)

(declare-fun contains!1140 (List!2187 (_ BitVec 64)) Bool)

(assert (=> b!170214 (= e!112293 (contains!1140 Nil!2184 (select (arr!3341 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51709 () Bool)

(declare-fun res!80928 () Bool)

(declare-fun e!112294 () Bool)

(assert (=> d!51709 (=> res!80928 e!112294)))

(assert (=> d!51709 (= res!80928 (bvsge #b00000000000000000000000000000000 (size!3632 (_keys!5359 thiss!1248))))))

(assert (=> d!51709 (= (arrayNoDuplicates!0 (_keys!5359 thiss!1248) #b00000000000000000000000000000000 Nil!2184) e!112294)))

(declare-fun b!170215 () Bool)

(declare-fun e!112295 () Bool)

(declare-fun e!112292 () Bool)

(assert (=> b!170215 (= e!112295 e!112292)))

(declare-fun c!30469 () Bool)

(assert (=> b!170215 (= c!30469 (validKeyInArray!0 (select (arr!3341 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17365 () Bool)

(declare-fun call!17368 () Bool)

(assert (=> bm!17365 (= call!17368 (arrayNoDuplicates!0 (_keys!5359 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30469 (Cons!2183 (select (arr!3341 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000) Nil!2184) Nil!2184)))))

(declare-fun b!170216 () Bool)

(assert (=> b!170216 (= e!112292 call!17368)))

(declare-fun b!170217 () Bool)

(assert (=> b!170217 (= e!112292 call!17368)))

(declare-fun b!170218 () Bool)

(assert (=> b!170218 (= e!112294 e!112295)))

(declare-fun res!80927 () Bool)

(assert (=> b!170218 (=> (not res!80927) (not e!112295))))

(assert (=> b!170218 (= res!80927 (not e!112293))))

(declare-fun res!80926 () Bool)

(assert (=> b!170218 (=> (not res!80926) (not e!112293))))

(assert (=> b!170218 (= res!80926 (validKeyInArray!0 (select (arr!3341 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51709 (not res!80928)) b!170218))

(assert (= (and b!170218 res!80926) b!170214))

(assert (= (and b!170218 res!80927) b!170215))

(assert (= (and b!170215 c!30469) b!170216))

(assert (= (and b!170215 (not c!30469)) b!170217))

(assert (= (or b!170216 b!170217) bm!17365))

(assert (=> b!170214 m!198843))

(assert (=> b!170214 m!198843))

(declare-fun m!198853 () Bool)

(assert (=> b!170214 m!198853))

(assert (=> b!170215 m!198843))

(assert (=> b!170215 m!198843))

(assert (=> b!170215 m!198851))

(assert (=> bm!17365 m!198843))

(declare-fun m!198855 () Bool)

(assert (=> bm!17365 m!198855))

(assert (=> b!170218 m!198843))

(assert (=> b!170218 m!198843))

(assert (=> b!170218 m!198851))

(assert (=> b!170171 d!51709))

(declare-fun b!170227 () Bool)

(declare-fun e!112301 () (_ BitVec 32))

(declare-fun e!112300 () (_ BitVec 32))

(assert (=> b!170227 (= e!112301 e!112300)))

(declare-fun c!30474 () Bool)

(assert (=> b!170227 (= c!30474 (validKeyInArray!0 (select (arr!3341 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170228 () Bool)

(declare-fun call!17371 () (_ BitVec 32))

(assert (=> b!170228 (= e!112300 call!17371)))

(declare-fun bm!17368 () Bool)

(assert (=> bm!17368 (= call!17371 (arrayCountValidKeys!0 (_keys!5359 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3632 (_keys!5359 thiss!1248))))))

(declare-fun b!170229 () Bool)

(assert (=> b!170229 (= e!112301 #b00000000000000000000000000000000)))

(declare-fun d!51711 () Bool)

(declare-fun lt!84997 () (_ BitVec 32))

(assert (=> d!51711 (and (bvsge lt!84997 #b00000000000000000000000000000000) (bvsle lt!84997 (bvsub (size!3632 (_keys!5359 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51711 (= lt!84997 e!112301)))

(declare-fun c!30475 () Bool)

(assert (=> d!51711 (= c!30475 (bvsge #b00000000000000000000000000000000 (size!3632 (_keys!5359 thiss!1248))))))

(assert (=> d!51711 (and (bvsle #b00000000000000000000000000000000 (size!3632 (_keys!5359 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3632 (_keys!5359 thiss!1248)) (size!3632 (_keys!5359 thiss!1248))))))

(assert (=> d!51711 (= (arrayCountValidKeys!0 (_keys!5359 thiss!1248) #b00000000000000000000000000000000 (size!3632 (_keys!5359 thiss!1248))) lt!84997)))

(declare-fun b!170230 () Bool)

(assert (=> b!170230 (= e!112300 (bvadd #b00000000000000000000000000000001 call!17371))))

(assert (= (and d!51711 c!30475) b!170229))

(assert (= (and d!51711 (not c!30475)) b!170227))

(assert (= (and b!170227 c!30474) b!170230))

(assert (= (and b!170227 (not c!30474)) b!170228))

(assert (= (or b!170230 b!170228) bm!17368))

(assert (=> b!170227 m!198843))

(assert (=> b!170227 m!198843))

(assert (=> b!170227 m!198851))

(declare-fun m!198857 () Bool)

(assert (=> bm!17368 m!198857))

(assert (=> b!170169 d!51711))

(declare-fun b!170231 () Bool)

(declare-fun e!112303 () Bool)

(assert (=> b!170231 (= e!112303 tp_is_empty!3957)))

(declare-fun mapIsEmpty!6721 () Bool)

(declare-fun mapRes!6721 () Bool)

(assert (=> mapIsEmpty!6721 mapRes!6721))

(declare-fun mapNonEmpty!6721 () Bool)

(declare-fun tp!15181 () Bool)

(assert (=> mapNonEmpty!6721 (= mapRes!6721 (and tp!15181 e!112303))))

(declare-fun mapValue!6721 () ValueCell!1635)

(declare-fun mapKey!6721 () (_ BitVec 32))

(declare-fun mapRest!6721 () (Array (_ BitVec 32) ValueCell!1635))

(assert (=> mapNonEmpty!6721 (= mapRest!6720 (store mapRest!6721 mapKey!6721 mapValue!6721))))

(declare-fun condMapEmpty!6721 () Bool)

(declare-fun mapDefault!6721 () ValueCell!1635)

(assert (=> mapNonEmpty!6720 (= condMapEmpty!6721 (= mapRest!6720 ((as const (Array (_ BitVec 32) ValueCell!1635)) mapDefault!6721)))))

(declare-fun e!112302 () Bool)

(assert (=> mapNonEmpty!6720 (= tp!15180 (and e!112302 mapRes!6721))))

(declare-fun b!170232 () Bool)

(assert (=> b!170232 (= e!112302 tp_is_empty!3957)))

(assert (= (and mapNonEmpty!6720 condMapEmpty!6721) mapIsEmpty!6721))

(assert (= (and mapNonEmpty!6720 (not condMapEmpty!6721)) mapNonEmpty!6721))

(assert (= (and mapNonEmpty!6721 ((_ is ValueCellFull!1635) mapValue!6721)) b!170231))

(assert (= (and mapNonEmpty!6720 ((_ is ValueCellFull!1635) mapDefault!6721)) b!170232))

(declare-fun m!198859 () Bool)

(assert (=> mapNonEmpty!6721 m!198859))

(check-sat (not b!170201) (not b!170190) (not bm!17362) (not d!51705) b_and!10599 (not b!170214) (not b!170203) (not b!170189) (not b!170218) (not b!170215) (not mapNonEmpty!6721) (not b!170227) (not bm!17368) (not b_next!4185) tp_is_empty!3957 (not bm!17365))
(check-sat b_and!10599 (not b_next!4185))
