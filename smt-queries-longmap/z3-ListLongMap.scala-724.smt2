; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16908 () Bool)

(assert start!16908)

(declare-fun b!170162 () Bool)

(declare-fun b_free!4183 () Bool)

(declare-fun b_next!4183 () Bool)

(assert (=> b!170162 (= b_free!4183 (not b_next!4183))))

(declare-fun tp!15164 () Bool)

(declare-fun b_and!10611 () Bool)

(assert (=> b!170162 (= tp!15164 b_and!10611)))

(declare-fun b!170161 () Bool)

(declare-fun res!80895 () Bool)

(declare-fun e!112250 () Bool)

(assert (=> b!170161 (=> (not res!80895) (not e!112250))))

(declare-datatypes ((V!4921 0))(
  ( (V!4922 (val!2022 Int)) )
))
(declare-datatypes ((ValueCell!1634 0))(
  ( (ValueCellFull!1634 (v!3888 V!4921)) (EmptyCell!1634) )
))
(declare-datatypes ((array!7001 0))(
  ( (array!7002 (arr!3332 (Array (_ BitVec 32) (_ BitVec 64))) (size!3623 (_ BitVec 32))) )
))
(declare-datatypes ((array!7003 0))(
  ( (array!7004 (arr!3333 (Array (_ BitVec 32) ValueCell!1634)) (size!3624 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2176 0))(
  ( (LongMapFixedSize!2177 (defaultEntry!3530 Int) (mask!8334 (_ BitVec 32)) (extraKeys!3271 (_ BitVec 32)) (zeroValue!3373 V!4921) (minValue!3373 V!4921) (_size!1137 (_ BitVec 32)) (_keys!5358 array!7001) (_values!3513 array!7003) (_vacant!1137 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2176)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170161 (= res!80895 (validMask!0 (mask!8334 thiss!1248)))))

(declare-fun mapNonEmpty!6711 () Bool)

(declare-fun mapRes!6711 () Bool)

(declare-fun tp!15165 () Bool)

(declare-fun e!112246 () Bool)

(assert (=> mapNonEmpty!6711 (= mapRes!6711 (and tp!15165 e!112246))))

(declare-fun mapValue!6711 () ValueCell!1634)

(declare-fun mapRest!6711 () (Array (_ BitVec 32) ValueCell!1634))

(declare-fun mapKey!6711 () (_ BitVec 32))

(assert (=> mapNonEmpty!6711 (= (arr!3333 (_values!3513 thiss!1248)) (store mapRest!6711 mapKey!6711 mapValue!6711))))

(declare-fun res!80894 () Bool)

(assert (=> start!16908 (=> (not res!80894) (not e!112250))))

(declare-fun valid!948 (LongMapFixedSize!2176) Bool)

(assert (=> start!16908 (= res!80894 (valid!948 thiss!1248))))

(assert (=> start!16908 e!112250))

(declare-fun e!112248 () Bool)

(assert (=> start!16908 e!112248))

(assert (=> start!16908 true))

(declare-fun tp_is_empty!3955 () Bool)

(declare-fun e!112249 () Bool)

(declare-fun array_inv!2141 (array!7001) Bool)

(declare-fun array_inv!2142 (array!7003) Bool)

(assert (=> b!170162 (= e!112248 (and tp!15164 tp_is_empty!3955 (array_inv!2141 (_keys!5358 thiss!1248)) (array_inv!2142 (_values!3513 thiss!1248)) e!112249))))

(declare-fun b!170163 () Bool)

(assert (=> b!170163 (= e!112250 (and (= (size!3624 (_values!3513 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8334 thiss!1248))) (= (size!3623 (_keys!5358 thiss!1248)) (size!3624 (_values!3513 thiss!1248))) (bvsge (mask!8334 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3271 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170164 () Bool)

(declare-fun res!80893 () Bool)

(assert (=> b!170164 (=> (not res!80893) (not e!112250))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170164 (= res!80893 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!170165 () Bool)

(declare-fun e!112247 () Bool)

(assert (=> b!170165 (= e!112247 tp_is_empty!3955)))

(declare-fun b!170166 () Bool)

(assert (=> b!170166 (= e!112246 tp_is_empty!3955)))

(declare-fun b!170167 () Bool)

(assert (=> b!170167 (= e!112249 (and e!112247 mapRes!6711))))

(declare-fun condMapEmpty!6711 () Bool)

(declare-fun mapDefault!6711 () ValueCell!1634)

(assert (=> b!170167 (= condMapEmpty!6711 (= (arr!3333 (_values!3513 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1634)) mapDefault!6711)))))

(declare-fun mapIsEmpty!6711 () Bool)

(assert (=> mapIsEmpty!6711 mapRes!6711))

(assert (= (and start!16908 res!80894) b!170164))

(assert (= (and b!170164 res!80893) b!170161))

(assert (= (and b!170161 res!80895) b!170163))

(assert (= (and b!170167 condMapEmpty!6711) mapIsEmpty!6711))

(assert (= (and b!170167 (not condMapEmpty!6711)) mapNonEmpty!6711))

(get-info :version)

(assert (= (and mapNonEmpty!6711 ((_ is ValueCellFull!1634) mapValue!6711)) b!170166))

(assert (= (and b!170167 ((_ is ValueCellFull!1634) mapDefault!6711)) b!170165))

(assert (= b!170162 b!170167))

(assert (= start!16908 b!170162))

(declare-fun m!198981 () Bool)

(assert (=> b!170161 m!198981))

(declare-fun m!198983 () Bool)

(assert (=> mapNonEmpty!6711 m!198983))

(declare-fun m!198985 () Bool)

(assert (=> start!16908 m!198985))

(declare-fun m!198987 () Bool)

(assert (=> b!170162 m!198987))

(declare-fun m!198989 () Bool)

(assert (=> b!170162 m!198989))

(check-sat b_and!10611 tp_is_empty!3955 (not b!170162) (not mapNonEmpty!6711) (not b!170161) (not start!16908) (not b_next!4183))
(check-sat b_and!10611 (not b_next!4183))
(get-model)

(declare-fun d!51771 () Bool)

(declare-fun res!80920 () Bool)

(declare-fun e!112289 () Bool)

(assert (=> d!51771 (=> (not res!80920) (not e!112289))))

(declare-fun simpleValid!131 (LongMapFixedSize!2176) Bool)

(assert (=> d!51771 (= res!80920 (simpleValid!131 thiss!1248))))

(assert (=> d!51771 (= (valid!948 thiss!1248) e!112289)))

(declare-fun b!170216 () Bool)

(declare-fun res!80921 () Bool)

(assert (=> b!170216 (=> (not res!80921) (not e!112289))))

(declare-fun arrayCountValidKeys!0 (array!7001 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170216 (= res!80921 (= (arrayCountValidKeys!0 (_keys!5358 thiss!1248) #b00000000000000000000000000000000 (size!3623 (_keys!5358 thiss!1248))) (_size!1137 thiss!1248)))))

(declare-fun b!170217 () Bool)

(declare-fun res!80922 () Bool)

(assert (=> b!170217 (=> (not res!80922) (not e!112289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7001 (_ BitVec 32)) Bool)

(assert (=> b!170217 (= res!80922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5358 thiss!1248) (mask!8334 thiss!1248)))))

(declare-fun b!170218 () Bool)

(declare-datatypes ((List!2170 0))(
  ( (Nil!2167) (Cons!2166 (h!2783 (_ BitVec 64)) (t!6964 List!2170)) )
))
(declare-fun arrayNoDuplicates!0 (array!7001 (_ BitVec 32) List!2170) Bool)

(assert (=> b!170218 (= e!112289 (arrayNoDuplicates!0 (_keys!5358 thiss!1248) #b00000000000000000000000000000000 Nil!2167))))

(assert (= (and d!51771 res!80920) b!170216))

(assert (= (and b!170216 res!80921) b!170217))

(assert (= (and b!170217 res!80922) b!170218))

(declare-fun m!199011 () Bool)

(assert (=> d!51771 m!199011))

(declare-fun m!199013 () Bool)

(assert (=> b!170216 m!199013))

(declare-fun m!199015 () Bool)

(assert (=> b!170217 m!199015))

(declare-fun m!199017 () Bool)

(assert (=> b!170218 m!199017))

(assert (=> start!16908 d!51771))

(declare-fun d!51773 () Bool)

(assert (=> d!51773 (= (array_inv!2141 (_keys!5358 thiss!1248)) (bvsge (size!3623 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170162 d!51773))

(declare-fun d!51775 () Bool)

(assert (=> d!51775 (= (array_inv!2142 (_values!3513 thiss!1248)) (bvsge (size!3624 (_values!3513 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170162 d!51775))

(declare-fun d!51777 () Bool)

(assert (=> d!51777 (= (validMask!0 (mask!8334 thiss!1248)) (and (or (= (mask!8334 thiss!1248) #b00000000000000000000000000000111) (= (mask!8334 thiss!1248) #b00000000000000000000000000001111) (= (mask!8334 thiss!1248) #b00000000000000000000000000011111) (= (mask!8334 thiss!1248) #b00000000000000000000000000111111) (= (mask!8334 thiss!1248) #b00000000000000000000000001111111) (= (mask!8334 thiss!1248) #b00000000000000000000000011111111) (= (mask!8334 thiss!1248) #b00000000000000000000000111111111) (= (mask!8334 thiss!1248) #b00000000000000000000001111111111) (= (mask!8334 thiss!1248) #b00000000000000000000011111111111) (= (mask!8334 thiss!1248) #b00000000000000000000111111111111) (= (mask!8334 thiss!1248) #b00000000000000000001111111111111) (= (mask!8334 thiss!1248) #b00000000000000000011111111111111) (= (mask!8334 thiss!1248) #b00000000000000000111111111111111) (= (mask!8334 thiss!1248) #b00000000000000001111111111111111) (= (mask!8334 thiss!1248) #b00000000000000011111111111111111) (= (mask!8334 thiss!1248) #b00000000000000111111111111111111) (= (mask!8334 thiss!1248) #b00000000000001111111111111111111) (= (mask!8334 thiss!1248) #b00000000000011111111111111111111) (= (mask!8334 thiss!1248) #b00000000000111111111111111111111) (= (mask!8334 thiss!1248) #b00000000001111111111111111111111) (= (mask!8334 thiss!1248) #b00000000011111111111111111111111) (= (mask!8334 thiss!1248) #b00000000111111111111111111111111) (= (mask!8334 thiss!1248) #b00000001111111111111111111111111) (= (mask!8334 thiss!1248) #b00000011111111111111111111111111) (= (mask!8334 thiss!1248) #b00000111111111111111111111111111) (= (mask!8334 thiss!1248) #b00001111111111111111111111111111) (= (mask!8334 thiss!1248) #b00011111111111111111111111111111) (= (mask!8334 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8334 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170161 d!51777))

(declare-fun mapIsEmpty!6720 () Bool)

(declare-fun mapRes!6720 () Bool)

(assert (=> mapIsEmpty!6720 mapRes!6720))

(declare-fun b!170225 () Bool)

(declare-fun e!112295 () Bool)

(assert (=> b!170225 (= e!112295 tp_is_empty!3955)))

(declare-fun b!170226 () Bool)

(declare-fun e!112294 () Bool)

(assert (=> b!170226 (= e!112294 tp_is_empty!3955)))

(declare-fun mapNonEmpty!6720 () Bool)

(declare-fun tp!15180 () Bool)

(assert (=> mapNonEmpty!6720 (= mapRes!6720 (and tp!15180 e!112295))))

(declare-fun mapKey!6720 () (_ BitVec 32))

(declare-fun mapRest!6720 () (Array (_ BitVec 32) ValueCell!1634))

(declare-fun mapValue!6720 () ValueCell!1634)

(assert (=> mapNonEmpty!6720 (= mapRest!6711 (store mapRest!6720 mapKey!6720 mapValue!6720))))

(declare-fun condMapEmpty!6720 () Bool)

(declare-fun mapDefault!6720 () ValueCell!1634)

(assert (=> mapNonEmpty!6711 (= condMapEmpty!6720 (= mapRest!6711 ((as const (Array (_ BitVec 32) ValueCell!1634)) mapDefault!6720)))))

(assert (=> mapNonEmpty!6711 (= tp!15165 (and e!112294 mapRes!6720))))

(assert (= (and mapNonEmpty!6711 condMapEmpty!6720) mapIsEmpty!6720))

(assert (= (and mapNonEmpty!6711 (not condMapEmpty!6720)) mapNonEmpty!6720))

(assert (= (and mapNonEmpty!6720 ((_ is ValueCellFull!1634) mapValue!6720)) b!170225))

(assert (= (and mapNonEmpty!6711 ((_ is ValueCellFull!1634) mapDefault!6720)) b!170226))

(declare-fun m!199019 () Bool)

(assert (=> mapNonEmpty!6720 m!199019))

(check-sat b_and!10611 tp_is_empty!3955 (not b!170217) (not mapNonEmpty!6720) (not b_next!4183) (not b!170218) (not b!170216) (not d!51771))
(check-sat b_and!10611 (not b_next!4183))
(get-model)

(declare-fun d!51779 () Bool)

(declare-fun lt!85047 () (_ BitVec 32))

(assert (=> d!51779 (and (bvsge lt!85047 #b00000000000000000000000000000000) (bvsle lt!85047 (bvsub (size!3623 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!112301 () (_ BitVec 32))

(assert (=> d!51779 (= lt!85047 e!112301)))

(declare-fun c!30481 () Bool)

(assert (=> d!51779 (= c!30481 (bvsge #b00000000000000000000000000000000 (size!3623 (_keys!5358 thiss!1248))))))

(assert (=> d!51779 (and (bvsle #b00000000000000000000000000000000 (size!3623 (_keys!5358 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3623 (_keys!5358 thiss!1248)) (size!3623 (_keys!5358 thiss!1248))))))

(assert (=> d!51779 (= (arrayCountValidKeys!0 (_keys!5358 thiss!1248) #b00000000000000000000000000000000 (size!3623 (_keys!5358 thiss!1248))) lt!85047)))

(declare-fun b!170235 () Bool)

(assert (=> b!170235 (= e!112301 #b00000000000000000000000000000000)))

(declare-fun b!170236 () Bool)

(declare-fun e!112300 () (_ BitVec 32))

(declare-fun call!17353 () (_ BitVec 32))

(assert (=> b!170236 (= e!112300 (bvadd #b00000000000000000000000000000001 call!17353))))

(declare-fun bm!17350 () Bool)

(assert (=> bm!17350 (= call!17353 (arrayCountValidKeys!0 (_keys!5358 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3623 (_keys!5358 thiss!1248))))))

(declare-fun b!170237 () Bool)

(assert (=> b!170237 (= e!112300 call!17353)))

(declare-fun b!170238 () Bool)

(assert (=> b!170238 (= e!112301 e!112300)))

(declare-fun c!30482 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170238 (= c!30482 (validKeyInArray!0 (select (arr!3332 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51779 c!30481) b!170235))

(assert (= (and d!51779 (not c!30481)) b!170238))

(assert (= (and b!170238 c!30482) b!170236))

(assert (= (and b!170238 (not c!30482)) b!170237))

(assert (= (or b!170236 b!170237) bm!17350))

(declare-fun m!199021 () Bool)

(assert (=> bm!17350 m!199021))

(declare-fun m!199023 () Bool)

(assert (=> b!170238 m!199023))

(assert (=> b!170238 m!199023))

(declare-fun m!199025 () Bool)

(assert (=> b!170238 m!199025))

(assert (=> b!170216 d!51779))

(declare-fun b!170249 () Bool)

(declare-fun res!80932 () Bool)

(declare-fun e!112304 () Bool)

(assert (=> b!170249 (=> (not res!80932) (not e!112304))))

(declare-fun size!3629 (LongMapFixedSize!2176) (_ BitVec 32))

(assert (=> b!170249 (= res!80932 (= (size!3629 thiss!1248) (bvadd (_size!1137 thiss!1248) (bvsdiv (bvadd (extraKeys!3271 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!51781 () Bool)

(declare-fun res!80931 () Bool)

(assert (=> d!51781 (=> (not res!80931) (not e!112304))))

(assert (=> d!51781 (= res!80931 (validMask!0 (mask!8334 thiss!1248)))))

(assert (=> d!51781 (= (simpleValid!131 thiss!1248) e!112304)))

(declare-fun b!170250 () Bool)

(assert (=> b!170250 (= e!112304 (and (bvsge (extraKeys!3271 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3271 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1137 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170247 () Bool)

(declare-fun res!80934 () Bool)

(assert (=> b!170247 (=> (not res!80934) (not e!112304))))

(assert (=> b!170247 (= res!80934 (and (= (size!3624 (_values!3513 thiss!1248)) (bvadd (mask!8334 thiss!1248) #b00000000000000000000000000000001)) (= (size!3623 (_keys!5358 thiss!1248)) (size!3624 (_values!3513 thiss!1248))) (bvsge (_size!1137 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1137 thiss!1248) (bvadd (mask!8334 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!170248 () Bool)

(declare-fun res!80933 () Bool)

(assert (=> b!170248 (=> (not res!80933) (not e!112304))))

(assert (=> b!170248 (= res!80933 (bvsge (size!3629 thiss!1248) (_size!1137 thiss!1248)))))

(assert (= (and d!51781 res!80931) b!170247))

(assert (= (and b!170247 res!80934) b!170248))

(assert (= (and b!170248 res!80933) b!170249))

(assert (= (and b!170249 res!80932) b!170250))

(declare-fun m!199027 () Bool)

(assert (=> b!170249 m!199027))

(assert (=> d!51781 m!198981))

(assert (=> b!170248 m!199027))

(assert (=> d!51771 d!51781))

(declare-fun b!170259 () Bool)

(declare-fun e!112313 () Bool)

(declare-fun e!112312 () Bool)

(assert (=> b!170259 (= e!112313 e!112312)))

(declare-fun lt!85055 () (_ BitVec 64))

(assert (=> b!170259 (= lt!85055 (select (arr!3332 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5243 0))(
  ( (Unit!5244) )
))
(declare-fun lt!85056 () Unit!5243)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7001 (_ BitVec 64) (_ BitVec 32)) Unit!5243)

(assert (=> b!170259 (= lt!85056 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5358 thiss!1248) lt!85055 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170259 (arrayContainsKey!0 (_keys!5358 thiss!1248) lt!85055 #b00000000000000000000000000000000)))

(declare-fun lt!85054 () Unit!5243)

(assert (=> b!170259 (= lt!85054 lt!85056)))

(declare-fun res!80940 () Bool)

(declare-datatypes ((SeekEntryResult!524 0))(
  ( (MissingZero!524 (index!4264 (_ BitVec 32))) (Found!524 (index!4265 (_ BitVec 32))) (Intermediate!524 (undefined!1336 Bool) (index!4266 (_ BitVec 32)) (x!18832 (_ BitVec 32))) (Undefined!524) (MissingVacant!524 (index!4267 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7001 (_ BitVec 32)) SeekEntryResult!524)

(assert (=> b!170259 (= res!80940 (= (seekEntryOrOpen!0 (select (arr!3332 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000) (_keys!5358 thiss!1248) (mask!8334 thiss!1248)) (Found!524 #b00000000000000000000000000000000)))))

(assert (=> b!170259 (=> (not res!80940) (not e!112312))))

(declare-fun b!170260 () Bool)

(declare-fun call!17356 () Bool)

(assert (=> b!170260 (= e!112312 call!17356)))

(declare-fun b!170261 () Bool)

(declare-fun e!112311 () Bool)

(assert (=> b!170261 (= e!112311 e!112313)))

(declare-fun c!30485 () Bool)

(assert (=> b!170261 (= c!30485 (validKeyInArray!0 (select (arr!3332 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17353 () Bool)

(assert (=> bm!17353 (= call!17356 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5358 thiss!1248) (mask!8334 thiss!1248)))))

(declare-fun d!51783 () Bool)

(declare-fun res!80939 () Bool)

(assert (=> d!51783 (=> res!80939 e!112311)))

(assert (=> d!51783 (= res!80939 (bvsge #b00000000000000000000000000000000 (size!3623 (_keys!5358 thiss!1248))))))

(assert (=> d!51783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5358 thiss!1248) (mask!8334 thiss!1248)) e!112311)))

(declare-fun b!170262 () Bool)

(assert (=> b!170262 (= e!112313 call!17356)))

(assert (= (and d!51783 (not res!80939)) b!170261))

(assert (= (and b!170261 c!30485) b!170259))

(assert (= (and b!170261 (not c!30485)) b!170262))

(assert (= (and b!170259 res!80940) b!170260))

(assert (= (or b!170260 b!170262) bm!17353))

(assert (=> b!170259 m!199023))

(declare-fun m!199029 () Bool)

(assert (=> b!170259 m!199029))

(declare-fun m!199031 () Bool)

(assert (=> b!170259 m!199031))

(assert (=> b!170259 m!199023))

(declare-fun m!199033 () Bool)

(assert (=> b!170259 m!199033))

(assert (=> b!170261 m!199023))

(assert (=> b!170261 m!199023))

(assert (=> b!170261 m!199025))

(declare-fun m!199035 () Bool)

(assert (=> bm!17353 m!199035))

(assert (=> b!170217 d!51783))

(declare-fun b!170273 () Bool)

(declare-fun e!112323 () Bool)

(declare-fun e!112324 () Bool)

(assert (=> b!170273 (= e!112323 e!112324)))

(declare-fun c!30488 () Bool)

(assert (=> b!170273 (= c!30488 (validKeyInArray!0 (select (arr!3332 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51785 () Bool)

(declare-fun res!80948 () Bool)

(declare-fun e!112325 () Bool)

(assert (=> d!51785 (=> res!80948 e!112325)))

(assert (=> d!51785 (= res!80948 (bvsge #b00000000000000000000000000000000 (size!3623 (_keys!5358 thiss!1248))))))

(assert (=> d!51785 (= (arrayNoDuplicates!0 (_keys!5358 thiss!1248) #b00000000000000000000000000000000 Nil!2167) e!112325)))

(declare-fun bm!17356 () Bool)

(declare-fun call!17359 () Bool)

(assert (=> bm!17356 (= call!17359 (arrayNoDuplicates!0 (_keys!5358 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30488 (Cons!2166 (select (arr!3332 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000) Nil!2167) Nil!2167)))))

(declare-fun b!170274 () Bool)

(assert (=> b!170274 (= e!112324 call!17359)))

(declare-fun b!170275 () Bool)

(assert (=> b!170275 (= e!112324 call!17359)))

(declare-fun b!170276 () Bool)

(assert (=> b!170276 (= e!112325 e!112323)))

(declare-fun res!80947 () Bool)

(assert (=> b!170276 (=> (not res!80947) (not e!112323))))

(declare-fun e!112322 () Bool)

(assert (=> b!170276 (= res!80947 (not e!112322))))

(declare-fun res!80949 () Bool)

(assert (=> b!170276 (=> (not res!80949) (not e!112322))))

(assert (=> b!170276 (= res!80949 (validKeyInArray!0 (select (arr!3332 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170277 () Bool)

(declare-fun contains!1136 (List!2170 (_ BitVec 64)) Bool)

(assert (=> b!170277 (= e!112322 (contains!1136 Nil!2167 (select (arr!3332 (_keys!5358 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51785 (not res!80948)) b!170276))

(assert (= (and b!170276 res!80949) b!170277))

(assert (= (and b!170276 res!80947) b!170273))

(assert (= (and b!170273 c!30488) b!170275))

(assert (= (and b!170273 (not c!30488)) b!170274))

(assert (= (or b!170275 b!170274) bm!17356))

(assert (=> b!170273 m!199023))

(assert (=> b!170273 m!199023))

(assert (=> b!170273 m!199025))

(assert (=> bm!17356 m!199023))

(declare-fun m!199037 () Bool)

(assert (=> bm!17356 m!199037))

(assert (=> b!170276 m!199023))

(assert (=> b!170276 m!199023))

(assert (=> b!170276 m!199025))

(assert (=> b!170277 m!199023))

(assert (=> b!170277 m!199023))

(declare-fun m!199039 () Bool)

(assert (=> b!170277 m!199039))

(assert (=> b!170218 d!51785))

(declare-fun mapIsEmpty!6721 () Bool)

(declare-fun mapRes!6721 () Bool)

(assert (=> mapIsEmpty!6721 mapRes!6721))

(declare-fun b!170278 () Bool)

(declare-fun e!112327 () Bool)

(assert (=> b!170278 (= e!112327 tp_is_empty!3955)))

(declare-fun b!170279 () Bool)

(declare-fun e!112326 () Bool)

(assert (=> b!170279 (= e!112326 tp_is_empty!3955)))

(declare-fun mapNonEmpty!6721 () Bool)

(declare-fun tp!15181 () Bool)

(assert (=> mapNonEmpty!6721 (= mapRes!6721 (and tp!15181 e!112327))))

(declare-fun mapValue!6721 () ValueCell!1634)

(declare-fun mapKey!6721 () (_ BitVec 32))

(declare-fun mapRest!6721 () (Array (_ BitVec 32) ValueCell!1634))

(assert (=> mapNonEmpty!6721 (= mapRest!6720 (store mapRest!6721 mapKey!6721 mapValue!6721))))

(declare-fun condMapEmpty!6721 () Bool)

(declare-fun mapDefault!6721 () ValueCell!1634)

(assert (=> mapNonEmpty!6720 (= condMapEmpty!6721 (= mapRest!6720 ((as const (Array (_ BitVec 32) ValueCell!1634)) mapDefault!6721)))))

(assert (=> mapNonEmpty!6720 (= tp!15180 (and e!112326 mapRes!6721))))

(assert (= (and mapNonEmpty!6720 condMapEmpty!6721) mapIsEmpty!6721))

(assert (= (and mapNonEmpty!6720 (not condMapEmpty!6721)) mapNonEmpty!6721))

(assert (= (and mapNonEmpty!6721 ((_ is ValueCellFull!1634) mapValue!6721)) b!170278))

(assert (= (and mapNonEmpty!6720 ((_ is ValueCellFull!1634) mapDefault!6721)) b!170279))

(declare-fun m!199041 () Bool)

(assert (=> mapNonEmpty!6721 m!199041))

(check-sat tp_is_empty!3955 (not b!170276) (not d!51781) (not b!170238) (not b!170249) (not b!170277) (not b!170273) (not b!170248) (not mapNonEmpty!6721) (not bm!17350) b_and!10611 (not b!170261) (not bm!17356) (not b_next!4183) (not b!170259) (not bm!17353))
(check-sat b_and!10611 (not b_next!4183))
