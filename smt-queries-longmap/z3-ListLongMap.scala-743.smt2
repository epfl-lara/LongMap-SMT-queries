; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17252 () Bool)

(assert start!17252)

(declare-fun b!173064 () Bool)

(declare-fun b_free!4299 () Bool)

(declare-fun b_next!4299 () Bool)

(assert (=> b!173064 (= b_free!4299 (not b_next!4299))))

(declare-fun tp!15555 () Bool)

(declare-fun b_and!10739 () Bool)

(assert (=> b!173064 (= tp!15555 b_and!10739)))

(declare-fun mapIsEmpty!6927 () Bool)

(declare-fun mapRes!6927 () Bool)

(assert (=> mapIsEmpty!6927 mapRes!6927))

(declare-fun tp_is_empty!4071 () Bool)

(declare-fun e!114312 () Bool)

(declare-fun e!114310 () Bool)

(declare-datatypes ((V!5075 0))(
  ( (V!5076 (val!2080 Int)) )
))
(declare-datatypes ((ValueCell!1692 0))(
  ( (ValueCellFull!1692 (v!3948 V!5075)) (EmptyCell!1692) )
))
(declare-datatypes ((array!7269 0))(
  ( (array!7270 (arr!3455 (Array (_ BitVec 32) (_ BitVec 64))) (size!3754 (_ BitVec 32))) )
))
(declare-datatypes ((array!7271 0))(
  ( (array!7272 (arr!3456 (Array (_ BitVec 32) ValueCell!1692)) (size!3755 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2292 0))(
  ( (LongMapFixedSize!2293 (defaultEntry!3592 Int) (mask!8456 (_ BitVec 32)) (extraKeys!3331 (_ BitVec 32)) (zeroValue!3433 V!5075) (minValue!3435 V!5075) (_size!1195 (_ BitVec 32)) (_keys!5431 array!7269) (_values!3575 array!7271) (_vacant!1195 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2292)

(declare-fun array_inv!2211 (array!7269) Bool)

(declare-fun array_inv!2212 (array!7271) Bool)

(assert (=> b!173064 (= e!114310 (and tp!15555 tp_is_empty!4071 (array_inv!2211 (_keys!5431 thiss!1248)) (array_inv!2212 (_values!3575 thiss!1248)) e!114312))))

(declare-fun b!173065 () Bool)

(declare-fun e!114309 () Bool)

(assert (=> b!173065 (= e!114312 (and e!114309 mapRes!6927))))

(declare-fun condMapEmpty!6927 () Bool)

(declare-fun mapDefault!6927 () ValueCell!1692)

(assert (=> b!173065 (= condMapEmpty!6927 (= (arr!3456 (_values!3575 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1692)) mapDefault!6927)))))

(declare-fun b!173066 () Bool)

(declare-fun res!82165 () Bool)

(declare-fun e!114313 () Bool)

(assert (=> b!173066 (=> (not res!82165) (not e!114313))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!173066 (= res!82165 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173067 () Bool)

(assert (=> b!173067 (= e!114309 tp_is_empty!4071)))

(declare-fun b!173068 () Bool)

(declare-fun res!82167 () Bool)

(assert (=> b!173068 (=> (not res!82167) (not e!114313))))

(assert (=> b!173068 (= res!82167 (and (= (size!3755 (_values!3575 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8456 thiss!1248))) (= (size!3754 (_keys!5431 thiss!1248)) (size!3755 (_values!3575 thiss!1248))) (bvsge (mask!8456 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3331 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3331 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3331 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3331 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3331 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3331 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3331 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!173069 () Bool)

(declare-fun res!82164 () Bool)

(assert (=> b!173069 (=> (not res!82164) (not e!114313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!173069 (= res!82164 (validMask!0 (mask!8456 thiss!1248)))))

(declare-fun b!173063 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7269 (_ BitVec 32)) Bool)

(assert (=> b!173063 (= e!114313 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5431 thiss!1248) (mask!8456 thiss!1248))))))

(declare-fun res!82166 () Bool)

(assert (=> start!17252 (=> (not res!82166) (not e!114313))))

(declare-fun valid!970 (LongMapFixedSize!2292) Bool)

(assert (=> start!17252 (= res!82166 (valid!970 thiss!1248))))

(assert (=> start!17252 e!114313))

(assert (=> start!17252 e!114310))

(assert (=> start!17252 true))

(declare-fun mapNonEmpty!6927 () Bool)

(declare-fun tp!15554 () Bool)

(declare-fun e!114314 () Bool)

(assert (=> mapNonEmpty!6927 (= mapRes!6927 (and tp!15554 e!114314))))

(declare-fun mapKey!6927 () (_ BitVec 32))

(declare-fun mapValue!6927 () ValueCell!1692)

(declare-fun mapRest!6927 () (Array (_ BitVec 32) ValueCell!1692))

(assert (=> mapNonEmpty!6927 (= (arr!3456 (_values!3575 thiss!1248)) (store mapRest!6927 mapKey!6927 mapValue!6927))))

(declare-fun b!173070 () Bool)

(assert (=> b!173070 (= e!114314 tp_is_empty!4071)))

(assert (= (and start!17252 res!82166) b!173066))

(assert (= (and b!173066 res!82165) b!173069))

(assert (= (and b!173069 res!82164) b!173068))

(assert (= (and b!173068 res!82167) b!173063))

(assert (= (and b!173065 condMapEmpty!6927) mapIsEmpty!6927))

(assert (= (and b!173065 (not condMapEmpty!6927)) mapNonEmpty!6927))

(get-info :version)

(assert (= (and mapNonEmpty!6927 ((_ is ValueCellFull!1692) mapValue!6927)) b!173070))

(assert (= (and b!173065 ((_ is ValueCellFull!1692) mapDefault!6927)) b!173067))

(assert (= b!173064 b!173065))

(assert (= start!17252 b!173064))

(declare-fun m!201525 () Bool)

(assert (=> b!173063 m!201525))

(declare-fun m!201527 () Bool)

(assert (=> b!173064 m!201527))

(declare-fun m!201529 () Bool)

(assert (=> b!173064 m!201529))

(declare-fun m!201531 () Bool)

(assert (=> b!173069 m!201531))

(declare-fun m!201533 () Bool)

(assert (=> mapNonEmpty!6927 m!201533))

(declare-fun m!201535 () Bool)

(assert (=> start!17252 m!201535))

(check-sat tp_is_empty!4071 (not b!173069) (not b!173063) (not mapNonEmpty!6927) (not start!17252) b_and!10739 (not b!173064) (not b_next!4299))
(check-sat b_and!10739 (not b_next!4299))
(get-model)

(declare-fun b!173103 () Bool)

(declare-fun e!114341 () Bool)

(declare-fun e!114339 () Bool)

(assert (=> b!173103 (= e!114341 e!114339)))

(declare-fun lt!85701 () (_ BitVec 64))

(assert (=> b!173103 (= lt!85701 (select (arr!3455 (_keys!5431 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5310 0))(
  ( (Unit!5311) )
))
(declare-fun lt!85700 () Unit!5310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7269 (_ BitVec 64) (_ BitVec 32)) Unit!5310)

(assert (=> b!173103 (= lt!85700 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5431 thiss!1248) lt!85701 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!173103 (arrayContainsKey!0 (_keys!5431 thiss!1248) lt!85701 #b00000000000000000000000000000000)))

(declare-fun lt!85702 () Unit!5310)

(assert (=> b!173103 (= lt!85702 lt!85700)))

(declare-fun res!82184 () Bool)

(declare-datatypes ((SeekEntryResult!540 0))(
  ( (MissingZero!540 (index!4328 (_ BitVec 32))) (Found!540 (index!4329 (_ BitVec 32))) (Intermediate!540 (undefined!1352 Bool) (index!4330 (_ BitVec 32)) (x!19147 (_ BitVec 32))) (Undefined!540) (MissingVacant!540 (index!4331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7269 (_ BitVec 32)) SeekEntryResult!540)

(assert (=> b!173103 (= res!82184 (= (seekEntryOrOpen!0 (select (arr!3455 (_keys!5431 thiss!1248)) #b00000000000000000000000000000000) (_keys!5431 thiss!1248) (mask!8456 thiss!1248)) (Found!540 #b00000000000000000000000000000000)))))

(assert (=> b!173103 (=> (not res!82184) (not e!114339))))

(declare-fun d!52563 () Bool)

(declare-fun res!82185 () Bool)

(declare-fun e!114340 () Bool)

(assert (=> d!52563 (=> res!82185 e!114340)))

(assert (=> d!52563 (= res!82185 (bvsge #b00000000000000000000000000000000 (size!3754 (_keys!5431 thiss!1248))))))

(assert (=> d!52563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5431 thiss!1248) (mask!8456 thiss!1248)) e!114340)))

(declare-fun bm!17548 () Bool)

(declare-fun call!17551 () Bool)

(assert (=> bm!17548 (= call!17551 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5431 thiss!1248) (mask!8456 thiss!1248)))))

(declare-fun b!173104 () Bool)

(assert (=> b!173104 (= e!114341 call!17551)))

(declare-fun b!173105 () Bool)

(assert (=> b!173105 (= e!114340 e!114341)))

(declare-fun c!30890 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!173105 (= c!30890 (validKeyInArray!0 (select (arr!3455 (_keys!5431 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173106 () Bool)

(assert (=> b!173106 (= e!114339 call!17551)))

(assert (= (and d!52563 (not res!82185)) b!173105))

(assert (= (and b!173105 c!30890) b!173103))

(assert (= (and b!173105 (not c!30890)) b!173104))

(assert (= (and b!173103 res!82184) b!173106))

(assert (= (or b!173106 b!173104) bm!17548))

(declare-fun m!201549 () Bool)

(assert (=> b!173103 m!201549))

(declare-fun m!201551 () Bool)

(assert (=> b!173103 m!201551))

(declare-fun m!201553 () Bool)

(assert (=> b!173103 m!201553))

(assert (=> b!173103 m!201549))

(declare-fun m!201555 () Bool)

(assert (=> b!173103 m!201555))

(declare-fun m!201557 () Bool)

(assert (=> bm!17548 m!201557))

(assert (=> b!173105 m!201549))

(assert (=> b!173105 m!201549))

(declare-fun m!201559 () Bool)

(assert (=> b!173105 m!201559))

(assert (=> b!173063 d!52563))

(declare-fun d!52565 () Bool)

(assert (=> d!52565 (= (validMask!0 (mask!8456 thiss!1248)) (and (or (= (mask!8456 thiss!1248) #b00000000000000000000000000000111) (= (mask!8456 thiss!1248) #b00000000000000000000000000001111) (= (mask!8456 thiss!1248) #b00000000000000000000000000011111) (= (mask!8456 thiss!1248) #b00000000000000000000000000111111) (= (mask!8456 thiss!1248) #b00000000000000000000000001111111) (= (mask!8456 thiss!1248) #b00000000000000000000000011111111) (= (mask!8456 thiss!1248) #b00000000000000000000000111111111) (= (mask!8456 thiss!1248) #b00000000000000000000001111111111) (= (mask!8456 thiss!1248) #b00000000000000000000011111111111) (= (mask!8456 thiss!1248) #b00000000000000000000111111111111) (= (mask!8456 thiss!1248) #b00000000000000000001111111111111) (= (mask!8456 thiss!1248) #b00000000000000000011111111111111) (= (mask!8456 thiss!1248) #b00000000000000000111111111111111) (= (mask!8456 thiss!1248) #b00000000000000001111111111111111) (= (mask!8456 thiss!1248) #b00000000000000011111111111111111) (= (mask!8456 thiss!1248) #b00000000000000111111111111111111) (= (mask!8456 thiss!1248) #b00000000000001111111111111111111) (= (mask!8456 thiss!1248) #b00000000000011111111111111111111) (= (mask!8456 thiss!1248) #b00000000000111111111111111111111) (= (mask!8456 thiss!1248) #b00000000001111111111111111111111) (= (mask!8456 thiss!1248) #b00000000011111111111111111111111) (= (mask!8456 thiss!1248) #b00000000111111111111111111111111) (= (mask!8456 thiss!1248) #b00000001111111111111111111111111) (= (mask!8456 thiss!1248) #b00000011111111111111111111111111) (= (mask!8456 thiss!1248) #b00000111111111111111111111111111) (= (mask!8456 thiss!1248) #b00001111111111111111111111111111) (= (mask!8456 thiss!1248) #b00011111111111111111111111111111) (= (mask!8456 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8456 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!173069 d!52565))

(declare-fun d!52567 () Bool)

(assert (=> d!52567 (= (array_inv!2211 (_keys!5431 thiss!1248)) (bvsge (size!3754 (_keys!5431 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173064 d!52567))

(declare-fun d!52569 () Bool)

(assert (=> d!52569 (= (array_inv!2212 (_values!3575 thiss!1248)) (bvsge (size!3755 (_values!3575 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173064 d!52569))

(declare-fun d!52571 () Bool)

(declare-fun res!82192 () Bool)

(declare-fun e!114344 () Bool)

(assert (=> d!52571 (=> (not res!82192) (not e!114344))))

(declare-fun simpleValid!142 (LongMapFixedSize!2292) Bool)

(assert (=> d!52571 (= res!82192 (simpleValid!142 thiss!1248))))

(assert (=> d!52571 (= (valid!970 thiss!1248) e!114344)))

(declare-fun b!173113 () Bool)

(declare-fun res!82193 () Bool)

(assert (=> b!173113 (=> (not res!82193) (not e!114344))))

(declare-fun arrayCountValidKeys!0 (array!7269 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!173113 (= res!82193 (= (arrayCountValidKeys!0 (_keys!5431 thiss!1248) #b00000000000000000000000000000000 (size!3754 (_keys!5431 thiss!1248))) (_size!1195 thiss!1248)))))

(declare-fun b!173114 () Bool)

(declare-fun res!82194 () Bool)

(assert (=> b!173114 (=> (not res!82194) (not e!114344))))

(assert (=> b!173114 (= res!82194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5431 thiss!1248) (mask!8456 thiss!1248)))))

(declare-fun b!173115 () Bool)

(declare-datatypes ((List!2202 0))(
  ( (Nil!2199) (Cons!2198 (h!2815 (_ BitVec 64)) (t!7009 List!2202)) )
))
(declare-fun arrayNoDuplicates!0 (array!7269 (_ BitVec 32) List!2202) Bool)

(assert (=> b!173115 (= e!114344 (arrayNoDuplicates!0 (_keys!5431 thiss!1248) #b00000000000000000000000000000000 Nil!2199))))

(assert (= (and d!52571 res!82192) b!173113))

(assert (= (and b!173113 res!82193) b!173114))

(assert (= (and b!173114 res!82194) b!173115))

(declare-fun m!201561 () Bool)

(assert (=> d!52571 m!201561))

(declare-fun m!201563 () Bool)

(assert (=> b!173113 m!201563))

(assert (=> b!173114 m!201525))

(declare-fun m!201565 () Bool)

(assert (=> b!173115 m!201565))

(assert (=> start!17252 d!52571))

(declare-fun mapNonEmpty!6933 () Bool)

(declare-fun mapRes!6933 () Bool)

(declare-fun tp!15564 () Bool)

(declare-fun e!114350 () Bool)

(assert (=> mapNonEmpty!6933 (= mapRes!6933 (and tp!15564 e!114350))))

(declare-fun mapRest!6933 () (Array (_ BitVec 32) ValueCell!1692))

(declare-fun mapKey!6933 () (_ BitVec 32))

(declare-fun mapValue!6933 () ValueCell!1692)

(assert (=> mapNonEmpty!6933 (= mapRest!6927 (store mapRest!6933 mapKey!6933 mapValue!6933))))

(declare-fun condMapEmpty!6933 () Bool)

(declare-fun mapDefault!6933 () ValueCell!1692)

(assert (=> mapNonEmpty!6927 (= condMapEmpty!6933 (= mapRest!6927 ((as const (Array (_ BitVec 32) ValueCell!1692)) mapDefault!6933)))))

(declare-fun e!114349 () Bool)

(assert (=> mapNonEmpty!6927 (= tp!15554 (and e!114349 mapRes!6933))))

(declare-fun b!173123 () Bool)

(assert (=> b!173123 (= e!114349 tp_is_empty!4071)))

(declare-fun mapIsEmpty!6933 () Bool)

(assert (=> mapIsEmpty!6933 mapRes!6933))

(declare-fun b!173122 () Bool)

(assert (=> b!173122 (= e!114350 tp_is_empty!4071)))

(assert (= (and mapNonEmpty!6927 condMapEmpty!6933) mapIsEmpty!6933))

(assert (= (and mapNonEmpty!6927 (not condMapEmpty!6933)) mapNonEmpty!6933))

(assert (= (and mapNonEmpty!6933 ((_ is ValueCellFull!1692) mapValue!6933)) b!173122))

(assert (= (and mapNonEmpty!6927 ((_ is ValueCellFull!1692) mapDefault!6933)) b!173123))

(declare-fun m!201567 () Bool)

(assert (=> mapNonEmpty!6933 m!201567))

(check-sat (not mapNonEmpty!6933) tp_is_empty!4071 (not b!173105) (not d!52571) (not bm!17548) b_and!10739 (not b_next!4299) (not b!173103) (not b!173113) (not b!173114) (not b!173115))
(check-sat b_and!10739 (not b_next!4299))
