; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17732 () Bool)

(assert start!17732)

(declare-fun b!177090 () Bool)

(declare-fun b_free!4381 () Bool)

(declare-fun b_next!4381 () Bool)

(assert (=> b!177090 (= b_free!4381 (not b_next!4381))))

(declare-fun tp!15842 () Bool)

(declare-fun b_and!10855 () Bool)

(assert (=> b!177090 (= tp!15842 b_and!10855)))

(declare-fun b!177085 () Bool)

(declare-fun e!116778 () Bool)

(declare-fun e!116777 () Bool)

(declare-fun mapRes!7092 () Bool)

(assert (=> b!177085 (= e!116778 (and e!116777 mapRes!7092))))

(declare-fun condMapEmpty!7092 () Bool)

(declare-datatypes ((V!5185 0))(
  ( (V!5186 (val!2121 Int)) )
))
(declare-datatypes ((ValueCell!1733 0))(
  ( (ValueCellFull!1733 (v!3995 V!5185)) (EmptyCell!1733) )
))
(declare-datatypes ((array!7437 0))(
  ( (array!7438 (arr!3526 (Array (_ BitVec 32) (_ BitVec 64))) (size!3831 (_ BitVec 32))) )
))
(declare-datatypes ((array!7439 0))(
  ( (array!7440 (arr!3527 (Array (_ BitVec 32) ValueCell!1733)) (size!3832 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2374 0))(
  ( (LongMapFixedSize!2375 (defaultEntry!3650 Int) (mask!8585 (_ BitVec 32)) (extraKeys!3387 (_ BitVec 32)) (zeroValue!3491 V!5185) (minValue!3491 V!5185) (_size!1236 (_ BitVec 32)) (_keys!5516 array!7437) (_values!3633 array!7439) (_vacant!1236 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2374)

(declare-fun mapDefault!7092 () ValueCell!1733)

(assert (=> b!177085 (= condMapEmpty!7092 (= (arr!3527 (_values!3633 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1733)) mapDefault!7092)))))

(declare-fun b!177087 () Bool)

(declare-fun res!83919 () Bool)

(declare-fun e!116776 () Bool)

(assert (=> b!177087 (=> (not res!83919) (not e!116776))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!177087 (= res!83919 (not (= key!828 (bvneg key!828))))))

(declare-fun b!177088 () Bool)

(declare-fun e!116781 () Bool)

(declare-fun tp_is_empty!4153 () Bool)

(assert (=> b!177088 (= e!116781 tp_is_empty!4153)))

(declare-fun mapIsEmpty!7092 () Bool)

(assert (=> mapIsEmpty!7092 mapRes!7092))

(declare-fun b!177089 () Bool)

(assert (=> b!177089 (= e!116777 tp_is_empty!4153)))

(declare-fun e!116780 () Bool)

(declare-fun array_inv!2277 (array!7437) Bool)

(declare-fun array_inv!2278 (array!7439) Bool)

(assert (=> b!177090 (= e!116780 (and tp!15842 tp_is_empty!4153 (array_inv!2277 (_keys!5516 thiss!1248)) (array_inv!2278 (_values!3633 thiss!1248)) e!116778))))

(declare-fun b!177091 () Bool)

(declare-fun res!83921 () Bool)

(assert (=> b!177091 (=> (not res!83921) (not e!116776))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!577 0))(
  ( (MissingZero!577 (index!4476 (_ BitVec 32))) (Found!577 (index!4477 (_ BitVec 32))) (Intermediate!577 (undefined!1389 Bool) (index!4478 (_ BitVec 32)) (x!19456 (_ BitVec 32))) (Undefined!577) (MissingVacant!577 (index!4479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7437 (_ BitVec 32)) SeekEntryResult!577)

(assert (=> b!177091 (= res!83921 ((_ is Undefined!577) (seekEntryOrOpen!0 key!828 (_keys!5516 thiss!1248) (mask!8585 thiss!1248))))))

(declare-fun b!177092 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!177092 (= e!116776 (not (validMask!0 (mask!8585 thiss!1248))))))

(declare-fun mapNonEmpty!7092 () Bool)

(declare-fun tp!15843 () Bool)

(assert (=> mapNonEmpty!7092 (= mapRes!7092 (and tp!15843 e!116781))))

(declare-fun mapRest!7092 () (Array (_ BitVec 32) ValueCell!1733))

(declare-fun mapValue!7092 () ValueCell!1733)

(declare-fun mapKey!7092 () (_ BitVec 32))

(assert (=> mapNonEmpty!7092 (= (arr!3527 (_values!3633 thiss!1248)) (store mapRest!7092 mapKey!7092 mapValue!7092))))

(declare-fun res!83922 () Bool)

(assert (=> start!17732 (=> (not res!83922) (not e!116776))))

(declare-fun valid!1013 (LongMapFixedSize!2374) Bool)

(assert (=> start!17732 (= res!83922 (valid!1013 thiss!1248))))

(assert (=> start!17732 e!116776))

(assert (=> start!17732 e!116780))

(assert (=> start!17732 true))

(declare-fun b!177086 () Bool)

(declare-fun res!83920 () Bool)

(assert (=> b!177086 (=> (not res!83920) (not e!116776))))

(declare-datatypes ((tuple2!3286 0))(
  ( (tuple2!3287 (_1!1654 (_ BitVec 64)) (_2!1654 V!5185)) )
))
(declare-datatypes ((List!2254 0))(
  ( (Nil!2251) (Cons!2250 (h!2871 tuple2!3286) (t!7075 List!2254)) )
))
(declare-datatypes ((ListLongMap!2205 0))(
  ( (ListLongMap!2206 (toList!1118 List!2254)) )
))
(declare-fun contains!1189 (ListLongMap!2205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!754 (array!7437 array!7439 (_ BitVec 32) (_ BitVec 32) V!5185 V!5185 (_ BitVec 32) Int) ListLongMap!2205)

(assert (=> b!177086 (= res!83920 (not (contains!1189 (getCurrentListMap!754 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)) key!828)))))

(assert (= (and start!17732 res!83922) b!177087))

(assert (= (and b!177087 res!83919) b!177091))

(assert (= (and b!177091 res!83921) b!177086))

(assert (= (and b!177086 res!83920) b!177092))

(assert (= (and b!177085 condMapEmpty!7092) mapIsEmpty!7092))

(assert (= (and b!177085 (not condMapEmpty!7092)) mapNonEmpty!7092))

(assert (= (and mapNonEmpty!7092 ((_ is ValueCellFull!1733) mapValue!7092)) b!177088))

(assert (= (and b!177085 ((_ is ValueCellFull!1733) mapDefault!7092)) b!177089))

(assert (= b!177090 b!177085))

(assert (= start!17732 b!177090))

(declare-fun m!205173 () Bool)

(assert (=> b!177091 m!205173))

(declare-fun m!205175 () Bool)

(assert (=> mapNonEmpty!7092 m!205175))

(declare-fun m!205177 () Bool)

(assert (=> b!177086 m!205177))

(assert (=> b!177086 m!205177))

(declare-fun m!205179 () Bool)

(assert (=> b!177086 m!205179))

(declare-fun m!205181 () Bool)

(assert (=> b!177090 m!205181))

(declare-fun m!205183 () Bool)

(assert (=> b!177090 m!205183))

(declare-fun m!205185 () Bool)

(assert (=> b!177092 m!205185))

(declare-fun m!205187 () Bool)

(assert (=> start!17732 m!205187))

(check-sat tp_is_empty!4153 (not b!177090) (not b_next!4381) (not b!177086) (not b!177092) (not start!17732) b_and!10855 (not mapNonEmpty!7092) (not b!177091))
(check-sat b_and!10855 (not b_next!4381))
(get-model)

(declare-fun d!53585 () Bool)

(declare-fun res!83953 () Bool)

(declare-fun e!116820 () Bool)

(assert (=> d!53585 (=> (not res!83953) (not e!116820))))

(declare-fun simpleValid!154 (LongMapFixedSize!2374) Bool)

(assert (=> d!53585 (= res!83953 (simpleValid!154 thiss!1248))))

(assert (=> d!53585 (= (valid!1013 thiss!1248) e!116820)))

(declare-fun b!177147 () Bool)

(declare-fun res!83954 () Bool)

(assert (=> b!177147 (=> (not res!83954) (not e!116820))))

(declare-fun arrayCountValidKeys!0 (array!7437 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!177147 (= res!83954 (= (arrayCountValidKeys!0 (_keys!5516 thiss!1248) #b00000000000000000000000000000000 (size!3831 (_keys!5516 thiss!1248))) (_size!1236 thiss!1248)))))

(declare-fun b!177148 () Bool)

(declare-fun res!83955 () Bool)

(assert (=> b!177148 (=> (not res!83955) (not e!116820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7437 (_ BitVec 32)) Bool)

(assert (=> b!177148 (= res!83955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5516 thiss!1248) (mask!8585 thiss!1248)))))

(declare-fun b!177149 () Bool)

(declare-datatypes ((List!2256 0))(
  ( (Nil!2253) (Cons!2252 (h!2873 (_ BitVec 64)) (t!7079 List!2256)) )
))
(declare-fun arrayNoDuplicates!0 (array!7437 (_ BitVec 32) List!2256) Bool)

(assert (=> b!177149 (= e!116820 (arrayNoDuplicates!0 (_keys!5516 thiss!1248) #b00000000000000000000000000000000 Nil!2253))))

(assert (= (and d!53585 res!83953) b!177147))

(assert (= (and b!177147 res!83954) b!177148))

(assert (= (and b!177148 res!83955) b!177149))

(declare-fun m!205221 () Bool)

(assert (=> d!53585 m!205221))

(declare-fun m!205223 () Bool)

(assert (=> b!177147 m!205223))

(declare-fun m!205225 () Bool)

(assert (=> b!177148 m!205225))

(declare-fun m!205227 () Bool)

(assert (=> b!177149 m!205227))

(assert (=> start!17732 d!53585))

(declare-fun b!177162 () Bool)

(declare-fun e!116827 () SeekEntryResult!577)

(declare-fun lt!87412 () SeekEntryResult!577)

(assert (=> b!177162 (= e!116827 (MissingZero!577 (index!4478 lt!87412)))))

(declare-fun b!177163 () Bool)

(declare-fun e!116829 () SeekEntryResult!577)

(assert (=> b!177163 (= e!116829 Undefined!577)))

(declare-fun d!53587 () Bool)

(declare-fun lt!87411 () SeekEntryResult!577)

(assert (=> d!53587 (and (or ((_ is Undefined!577) lt!87411) (not ((_ is Found!577) lt!87411)) (and (bvsge (index!4477 lt!87411) #b00000000000000000000000000000000) (bvslt (index!4477 lt!87411) (size!3831 (_keys!5516 thiss!1248))))) (or ((_ is Undefined!577) lt!87411) ((_ is Found!577) lt!87411) (not ((_ is MissingZero!577) lt!87411)) (and (bvsge (index!4476 lt!87411) #b00000000000000000000000000000000) (bvslt (index!4476 lt!87411) (size!3831 (_keys!5516 thiss!1248))))) (or ((_ is Undefined!577) lt!87411) ((_ is Found!577) lt!87411) ((_ is MissingZero!577) lt!87411) (not ((_ is MissingVacant!577) lt!87411)) (and (bvsge (index!4479 lt!87411) #b00000000000000000000000000000000) (bvslt (index!4479 lt!87411) (size!3831 (_keys!5516 thiss!1248))))) (or ((_ is Undefined!577) lt!87411) (ite ((_ is Found!577) lt!87411) (= (select (arr!3526 (_keys!5516 thiss!1248)) (index!4477 lt!87411)) key!828) (ite ((_ is MissingZero!577) lt!87411) (= (select (arr!3526 (_keys!5516 thiss!1248)) (index!4476 lt!87411)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!577) lt!87411) (= (select (arr!3526 (_keys!5516 thiss!1248)) (index!4479 lt!87411)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53587 (= lt!87411 e!116829)))

(declare-fun c!31715 () Bool)

(assert (=> d!53587 (= c!31715 (and ((_ is Intermediate!577) lt!87412) (undefined!1389 lt!87412)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7437 (_ BitVec 32)) SeekEntryResult!577)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53587 (= lt!87412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8585 thiss!1248)) key!828 (_keys!5516 thiss!1248) (mask!8585 thiss!1248)))))

(assert (=> d!53587 (validMask!0 (mask!8585 thiss!1248))))

(assert (=> d!53587 (= (seekEntryOrOpen!0 key!828 (_keys!5516 thiss!1248) (mask!8585 thiss!1248)) lt!87411)))

(declare-fun b!177164 () Bool)

(declare-fun e!116828 () SeekEntryResult!577)

(assert (=> b!177164 (= e!116828 (Found!577 (index!4478 lt!87412)))))

(declare-fun b!177165 () Bool)

(declare-fun c!31713 () Bool)

(declare-fun lt!87413 () (_ BitVec 64))

(assert (=> b!177165 (= c!31713 (= lt!87413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!177165 (= e!116828 e!116827)))

(declare-fun b!177166 () Bool)

(assert (=> b!177166 (= e!116829 e!116828)))

(assert (=> b!177166 (= lt!87413 (select (arr!3526 (_keys!5516 thiss!1248)) (index!4478 lt!87412)))))

(declare-fun c!31714 () Bool)

(assert (=> b!177166 (= c!31714 (= lt!87413 key!828))))

(declare-fun b!177167 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7437 (_ BitVec 32)) SeekEntryResult!577)

(assert (=> b!177167 (= e!116827 (seekKeyOrZeroReturnVacant!0 (x!19456 lt!87412) (index!4478 lt!87412) (index!4478 lt!87412) key!828 (_keys!5516 thiss!1248) (mask!8585 thiss!1248)))))

(assert (= (and d!53587 c!31715) b!177163))

(assert (= (and d!53587 (not c!31715)) b!177166))

(assert (= (and b!177166 c!31714) b!177164))

(assert (= (and b!177166 (not c!31714)) b!177165))

(assert (= (and b!177165 c!31713) b!177162))

(assert (= (and b!177165 (not c!31713)) b!177167))

(declare-fun m!205229 () Bool)

(assert (=> d!53587 m!205229))

(declare-fun m!205231 () Bool)

(assert (=> d!53587 m!205231))

(declare-fun m!205233 () Bool)

(assert (=> d!53587 m!205233))

(assert (=> d!53587 m!205233))

(declare-fun m!205235 () Bool)

(assert (=> d!53587 m!205235))

(assert (=> d!53587 m!205185))

(declare-fun m!205237 () Bool)

(assert (=> d!53587 m!205237))

(declare-fun m!205239 () Bool)

(assert (=> b!177166 m!205239))

(declare-fun m!205241 () Bool)

(assert (=> b!177167 m!205241))

(assert (=> b!177091 d!53587))

(declare-fun d!53589 () Bool)

(assert (=> d!53589 (= (validMask!0 (mask!8585 thiss!1248)) (and (or (= (mask!8585 thiss!1248) #b00000000000000000000000000000111) (= (mask!8585 thiss!1248) #b00000000000000000000000000001111) (= (mask!8585 thiss!1248) #b00000000000000000000000000011111) (= (mask!8585 thiss!1248) #b00000000000000000000000000111111) (= (mask!8585 thiss!1248) #b00000000000000000000000001111111) (= (mask!8585 thiss!1248) #b00000000000000000000000011111111) (= (mask!8585 thiss!1248) #b00000000000000000000000111111111) (= (mask!8585 thiss!1248) #b00000000000000000000001111111111) (= (mask!8585 thiss!1248) #b00000000000000000000011111111111) (= (mask!8585 thiss!1248) #b00000000000000000000111111111111) (= (mask!8585 thiss!1248) #b00000000000000000001111111111111) (= (mask!8585 thiss!1248) #b00000000000000000011111111111111) (= (mask!8585 thiss!1248) #b00000000000000000111111111111111) (= (mask!8585 thiss!1248) #b00000000000000001111111111111111) (= (mask!8585 thiss!1248) #b00000000000000011111111111111111) (= (mask!8585 thiss!1248) #b00000000000000111111111111111111) (= (mask!8585 thiss!1248) #b00000000000001111111111111111111) (= (mask!8585 thiss!1248) #b00000000000011111111111111111111) (= (mask!8585 thiss!1248) #b00000000000111111111111111111111) (= (mask!8585 thiss!1248) #b00000000001111111111111111111111) (= (mask!8585 thiss!1248) #b00000000011111111111111111111111) (= (mask!8585 thiss!1248) #b00000000111111111111111111111111) (= (mask!8585 thiss!1248) #b00000001111111111111111111111111) (= (mask!8585 thiss!1248) #b00000011111111111111111111111111) (= (mask!8585 thiss!1248) #b00000111111111111111111111111111) (= (mask!8585 thiss!1248) #b00001111111111111111111111111111) (= (mask!8585 thiss!1248) #b00011111111111111111111111111111) (= (mask!8585 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8585 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!177092 d!53589))

(declare-fun d!53591 () Bool)

(assert (=> d!53591 (= (array_inv!2277 (_keys!5516 thiss!1248)) (bvsge (size!3831 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177090 d!53591))

(declare-fun d!53593 () Bool)

(assert (=> d!53593 (= (array_inv!2278 (_values!3633 thiss!1248)) (bvsge (size!3832 (_values!3633 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177090 d!53593))

(declare-fun d!53595 () Bool)

(declare-fun e!116835 () Bool)

(assert (=> d!53595 e!116835))

(declare-fun res!83958 () Bool)

(assert (=> d!53595 (=> res!83958 e!116835)))

(declare-fun lt!87423 () Bool)

(assert (=> d!53595 (= res!83958 (not lt!87423))))

(declare-fun lt!87424 () Bool)

(assert (=> d!53595 (= lt!87423 lt!87424)))

(declare-datatypes ((Unit!5393 0))(
  ( (Unit!5394) )
))
(declare-fun lt!87425 () Unit!5393)

(declare-fun e!116834 () Unit!5393)

(assert (=> d!53595 (= lt!87425 e!116834)))

(declare-fun c!31718 () Bool)

(assert (=> d!53595 (= c!31718 lt!87424)))

(declare-fun containsKey!197 (List!2254 (_ BitVec 64)) Bool)

(assert (=> d!53595 (= lt!87424 (containsKey!197 (toList!1118 (getCurrentListMap!754 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248))) key!828))))

(assert (=> d!53595 (= (contains!1189 (getCurrentListMap!754 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)) key!828) lt!87423)))

(declare-fun b!177174 () Bool)

(declare-fun lt!87422 () Unit!5393)

(assert (=> b!177174 (= e!116834 lt!87422)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!146 (List!2254 (_ BitVec 64)) Unit!5393)

(assert (=> b!177174 (= lt!87422 (lemmaContainsKeyImpliesGetValueByKeyDefined!146 (toList!1118 (getCurrentListMap!754 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248))) key!828))))

(declare-datatypes ((Option!199 0))(
  ( (Some!198 (v!3998 V!5185)) (None!197) )
))
(declare-fun isDefined!147 (Option!199) Bool)

(declare-fun getValueByKey!193 (List!2254 (_ BitVec 64)) Option!199)

(assert (=> b!177174 (isDefined!147 (getValueByKey!193 (toList!1118 (getCurrentListMap!754 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248))) key!828))))

(declare-fun b!177175 () Bool)

(declare-fun Unit!5395 () Unit!5393)

(assert (=> b!177175 (= e!116834 Unit!5395)))

(declare-fun b!177176 () Bool)

(assert (=> b!177176 (= e!116835 (isDefined!147 (getValueByKey!193 (toList!1118 (getCurrentListMap!754 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248))) key!828)))))

(assert (= (and d!53595 c!31718) b!177174))

(assert (= (and d!53595 (not c!31718)) b!177175))

(assert (= (and d!53595 (not res!83958)) b!177176))

(declare-fun m!205243 () Bool)

(assert (=> d!53595 m!205243))

(declare-fun m!205245 () Bool)

(assert (=> b!177174 m!205245))

(declare-fun m!205247 () Bool)

(assert (=> b!177174 m!205247))

(assert (=> b!177174 m!205247))

(declare-fun m!205249 () Bool)

(assert (=> b!177174 m!205249))

(assert (=> b!177176 m!205247))

(assert (=> b!177176 m!205247))

(assert (=> b!177176 m!205249))

(assert (=> b!177086 d!53595))

(declare-fun b!177219 () Bool)

(declare-fun e!116871 () Bool)

(declare-fun call!17919 () Bool)

(assert (=> b!177219 (= e!116871 (not call!17919))))

(declare-fun bm!17911 () Bool)

(declare-fun call!17918 () ListLongMap!2205)

(declare-fun call!17920 () ListLongMap!2205)

(assert (=> bm!17911 (= call!17918 call!17920)))

(declare-fun b!177220 () Bool)

(declare-fun e!116869 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!177220 (= e!116869 (validKeyInArray!0 (select (arr!3526 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177221 () Bool)

(declare-fun e!116865 () ListLongMap!2205)

(declare-fun call!17914 () ListLongMap!2205)

(declare-fun +!252 (ListLongMap!2205 tuple2!3286) ListLongMap!2205)

(assert (=> b!177221 (= e!116865 (+!252 call!17914 (tuple2!3287 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3491 thiss!1248))))))

(declare-fun b!177222 () Bool)

(declare-fun e!116870 () Bool)

(declare-fun lt!87477 () ListLongMap!2205)

(declare-fun apply!140 (ListLongMap!2205 (_ BitVec 64)) V!5185)

(assert (=> b!177222 (= e!116870 (= (apply!140 lt!87477 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3491 thiss!1248)))))

(declare-fun b!177223 () Bool)

(declare-fun e!116868 () ListLongMap!2205)

(declare-fun call!17915 () ListLongMap!2205)

(assert (=> b!177223 (= e!116868 call!17915)))

(declare-fun c!31732 () Bool)

(declare-fun c!31736 () Bool)

(declare-fun bm!17912 () Bool)

(assert (=> bm!17912 (= call!17914 (+!252 (ite c!31732 call!17920 (ite c!31736 call!17918 call!17915)) (ite (or c!31732 c!31736) (tuple2!3287 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3491 thiss!1248)) (tuple2!3287 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3491 thiss!1248)))))))

(declare-fun b!177224 () Bool)

(declare-fun e!116863 () Bool)

(assert (=> b!177224 (= e!116863 e!116870)))

(declare-fun res!83978 () Bool)

(declare-fun call!17916 () Bool)

(assert (=> b!177224 (= res!83978 call!17916)))

(assert (=> b!177224 (=> (not res!83978) (not e!116870))))

(declare-fun bm!17913 () Bool)

(assert (=> bm!17913 (= call!17915 call!17918)))

(declare-fun bm!17914 () Bool)

(assert (=> bm!17914 (= call!17919 (contains!1189 lt!87477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177226 () Bool)

(declare-fun e!116866 () Bool)

(declare-fun get!2011 (ValueCell!1733 V!5185) V!5185)

(declare-fun dynLambda!474 (Int (_ BitVec 64)) V!5185)

(assert (=> b!177226 (= e!116866 (= (apply!140 lt!87477 (select (arr!3526 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000)) (get!2011 (select (arr!3527 (_values!3633 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!474 (defaultEntry!3650 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!177226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3832 (_values!3633 thiss!1248))))))

(assert (=> b!177226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5516 thiss!1248))))))

(declare-fun b!177227 () Bool)

(declare-fun e!116864 () Unit!5393)

(declare-fun lt!87488 () Unit!5393)

(assert (=> b!177227 (= e!116864 lt!87488)))

(declare-fun lt!87480 () ListLongMap!2205)

(declare-fun getCurrentListMapNoExtraKeys!161 (array!7437 array!7439 (_ BitVec 32) (_ BitVec 32) V!5185 V!5185 (_ BitVec 32) Int) ListLongMap!2205)

(assert (=> b!177227 (= lt!87480 (getCurrentListMapNoExtraKeys!161 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun lt!87490 () (_ BitVec 64))

(assert (=> b!177227 (= lt!87490 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87475 () (_ BitVec 64))

(assert (=> b!177227 (= lt!87475 (select (arr!3526 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87487 () Unit!5393)

(declare-fun addStillContains!116 (ListLongMap!2205 (_ BitVec 64) V!5185 (_ BitVec 64)) Unit!5393)

(assert (=> b!177227 (= lt!87487 (addStillContains!116 lt!87480 lt!87490 (zeroValue!3491 thiss!1248) lt!87475))))

(assert (=> b!177227 (contains!1189 (+!252 lt!87480 (tuple2!3287 lt!87490 (zeroValue!3491 thiss!1248))) lt!87475)))

(declare-fun lt!87484 () Unit!5393)

(assert (=> b!177227 (= lt!87484 lt!87487)))

(declare-fun lt!87474 () ListLongMap!2205)

(assert (=> b!177227 (= lt!87474 (getCurrentListMapNoExtraKeys!161 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun lt!87482 () (_ BitVec 64))

(assert (=> b!177227 (= lt!87482 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87473 () (_ BitVec 64))

(assert (=> b!177227 (= lt!87473 (select (arr!3526 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87491 () Unit!5393)

(declare-fun addApplyDifferent!116 (ListLongMap!2205 (_ BitVec 64) V!5185 (_ BitVec 64)) Unit!5393)

(assert (=> b!177227 (= lt!87491 (addApplyDifferent!116 lt!87474 lt!87482 (minValue!3491 thiss!1248) lt!87473))))

(assert (=> b!177227 (= (apply!140 (+!252 lt!87474 (tuple2!3287 lt!87482 (minValue!3491 thiss!1248))) lt!87473) (apply!140 lt!87474 lt!87473))))

(declare-fun lt!87471 () Unit!5393)

(assert (=> b!177227 (= lt!87471 lt!87491)))

(declare-fun lt!87485 () ListLongMap!2205)

(assert (=> b!177227 (= lt!87485 (getCurrentListMapNoExtraKeys!161 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun lt!87478 () (_ BitVec 64))

(assert (=> b!177227 (= lt!87478 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87472 () (_ BitVec 64))

(assert (=> b!177227 (= lt!87472 (select (arr!3526 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!87476 () Unit!5393)

(assert (=> b!177227 (= lt!87476 (addApplyDifferent!116 lt!87485 lt!87478 (zeroValue!3491 thiss!1248) lt!87472))))

(assert (=> b!177227 (= (apply!140 (+!252 lt!87485 (tuple2!3287 lt!87478 (zeroValue!3491 thiss!1248))) lt!87472) (apply!140 lt!87485 lt!87472))))

(declare-fun lt!87479 () Unit!5393)

(assert (=> b!177227 (= lt!87479 lt!87476)))

(declare-fun lt!87470 () ListLongMap!2205)

(assert (=> b!177227 (= lt!87470 (getCurrentListMapNoExtraKeys!161 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun lt!87481 () (_ BitVec 64))

(assert (=> b!177227 (= lt!87481 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!87486 () (_ BitVec 64))

(assert (=> b!177227 (= lt!87486 (select (arr!3526 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!177227 (= lt!87488 (addApplyDifferent!116 lt!87470 lt!87481 (minValue!3491 thiss!1248) lt!87486))))

(assert (=> b!177227 (= (apply!140 (+!252 lt!87470 (tuple2!3287 lt!87481 (minValue!3491 thiss!1248))) lt!87486) (apply!140 lt!87470 lt!87486))))

(declare-fun bm!17915 () Bool)

(declare-fun call!17917 () ListLongMap!2205)

(assert (=> bm!17915 (= call!17917 call!17914)))

(declare-fun b!177228 () Bool)

(declare-fun c!31735 () Bool)

(assert (=> b!177228 (= c!31735 (and (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!116874 () ListLongMap!2205)

(assert (=> b!177228 (= e!116874 e!116868)))

(declare-fun b!177229 () Bool)

(declare-fun e!116867 () Bool)

(assert (=> b!177229 (= e!116867 (= (apply!140 lt!87477 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3491 thiss!1248)))))

(declare-fun bm!17916 () Bool)

(assert (=> bm!17916 (= call!17920 (getCurrentListMapNoExtraKeys!161 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)))))

(declare-fun b!177230 () Bool)

(declare-fun e!116873 () Bool)

(assert (=> b!177230 (= e!116873 (validKeyInArray!0 (select (arr!3526 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!177231 () Bool)

(assert (=> b!177231 (= e!116863 (not call!17916))))

(declare-fun b!177232 () Bool)

(assert (=> b!177232 (= e!116874 call!17917)))

(declare-fun b!177233 () Bool)

(assert (=> b!177233 (= e!116871 e!116867)))

(declare-fun res!83981 () Bool)

(assert (=> b!177233 (= res!83981 call!17919)))

(assert (=> b!177233 (=> (not res!83981) (not e!116867))))

(declare-fun b!177234 () Bool)

(assert (=> b!177234 (= e!116865 e!116874)))

(assert (=> b!177234 (= c!31736 (and (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177235 () Bool)

(assert (=> b!177235 (= e!116868 call!17917)))

(declare-fun b!177236 () Bool)

(declare-fun res!83979 () Bool)

(declare-fun e!116872 () Bool)

(assert (=> b!177236 (=> (not res!83979) (not e!116872))))

(declare-fun e!116862 () Bool)

(assert (=> b!177236 (= res!83979 e!116862)))

(declare-fun res!83984 () Bool)

(assert (=> b!177236 (=> res!83984 e!116862)))

(assert (=> b!177236 (= res!83984 (not e!116873))))

(declare-fun res!83977 () Bool)

(assert (=> b!177236 (=> (not res!83977) (not e!116873))))

(assert (=> b!177236 (= res!83977 (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5516 thiss!1248))))))

(declare-fun bm!17917 () Bool)

(assert (=> bm!17917 (= call!17916 (contains!1189 lt!87477 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!177237 () Bool)

(assert (=> b!177237 (= e!116872 e!116863)))

(declare-fun c!31733 () Bool)

(assert (=> b!177237 (= c!31733 (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!177238 () Bool)

(declare-fun res!83982 () Bool)

(assert (=> b!177238 (=> (not res!83982) (not e!116872))))

(assert (=> b!177238 (= res!83982 e!116871)))

(declare-fun c!31731 () Bool)

(assert (=> b!177238 (= c!31731 (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!177239 () Bool)

(declare-fun Unit!5396 () Unit!5393)

(assert (=> b!177239 (= e!116864 Unit!5396)))

(declare-fun b!177225 () Bool)

(assert (=> b!177225 (= e!116862 e!116866)))

(declare-fun res!83983 () Bool)

(assert (=> b!177225 (=> (not res!83983) (not e!116866))))

(assert (=> b!177225 (= res!83983 (contains!1189 lt!87477 (select (arr!3526 (_keys!5516 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!177225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5516 thiss!1248))))))

(declare-fun d!53597 () Bool)

(assert (=> d!53597 e!116872))

(declare-fun res!83980 () Bool)

(assert (=> d!53597 (=> (not res!83980) (not e!116872))))

(assert (=> d!53597 (= res!83980 (or (bvsge #b00000000000000000000000000000000 (size!3831 (_keys!5516 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5516 thiss!1248))))))))

(declare-fun lt!87483 () ListLongMap!2205)

(assert (=> d!53597 (= lt!87477 lt!87483)))

(declare-fun lt!87489 () Unit!5393)

(assert (=> d!53597 (= lt!87489 e!116864)))

(declare-fun c!31734 () Bool)

(assert (=> d!53597 (= c!31734 e!116869)))

(declare-fun res!83985 () Bool)

(assert (=> d!53597 (=> (not res!83985) (not e!116869))))

(assert (=> d!53597 (= res!83985 (bvslt #b00000000000000000000000000000000 (size!3831 (_keys!5516 thiss!1248))))))

(assert (=> d!53597 (= lt!87483 e!116865)))

(assert (=> d!53597 (= c!31732 (and (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3387 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53597 (validMask!0 (mask!8585 thiss!1248))))

(assert (=> d!53597 (= (getCurrentListMap!754 (_keys!5516 thiss!1248) (_values!3633 thiss!1248) (mask!8585 thiss!1248) (extraKeys!3387 thiss!1248) (zeroValue!3491 thiss!1248) (minValue!3491 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3650 thiss!1248)) lt!87477)))

(assert (= (and d!53597 c!31732) b!177221))

(assert (= (and d!53597 (not c!31732)) b!177234))

(assert (= (and b!177234 c!31736) b!177232))

(assert (= (and b!177234 (not c!31736)) b!177228))

(assert (= (and b!177228 c!31735) b!177235))

(assert (= (and b!177228 (not c!31735)) b!177223))

(assert (= (or b!177235 b!177223) bm!17913))

(assert (= (or b!177232 bm!17913) bm!17911))

(assert (= (or b!177232 b!177235) bm!17915))

(assert (= (or b!177221 bm!17911) bm!17916))

(assert (= (or b!177221 bm!17915) bm!17912))

(assert (= (and d!53597 res!83985) b!177220))

(assert (= (and d!53597 c!31734) b!177227))

(assert (= (and d!53597 (not c!31734)) b!177239))

(assert (= (and d!53597 res!83980) b!177236))

(assert (= (and b!177236 res!83977) b!177230))

(assert (= (and b!177236 (not res!83984)) b!177225))

(assert (= (and b!177225 res!83983) b!177226))

(assert (= (and b!177236 res!83979) b!177238))

(assert (= (and b!177238 c!31731) b!177233))

(assert (= (and b!177238 (not c!31731)) b!177219))

(assert (= (and b!177233 res!83981) b!177229))

(assert (= (or b!177233 b!177219) bm!17914))

(assert (= (and b!177238 res!83982) b!177237))

(assert (= (and b!177237 c!31733) b!177224))

(assert (= (and b!177237 (not c!31733)) b!177231))

(assert (= (and b!177224 res!83978) b!177222))

(assert (= (or b!177224 b!177231) bm!17917))

(declare-fun b_lambda!7033 () Bool)

(assert (=> (not b_lambda!7033) (not b!177226)))

(declare-fun t!7078 () Bool)

(declare-fun tb!2783 () Bool)

(assert (=> (and b!177090 (= (defaultEntry!3650 thiss!1248) (defaultEntry!3650 thiss!1248)) t!7078) tb!2783))

(declare-fun result!4639 () Bool)

(assert (=> tb!2783 (= result!4639 tp_is_empty!4153)))

(assert (=> b!177226 t!7078))

(declare-fun b_and!10861 () Bool)

(assert (= b_and!10855 (and (=> t!7078 result!4639) b_and!10861)))

(declare-fun m!205251 () Bool)

(assert (=> b!177222 m!205251))

(declare-fun m!205253 () Bool)

(assert (=> b!177220 m!205253))

(assert (=> b!177220 m!205253))

(declare-fun m!205255 () Bool)

(assert (=> b!177220 m!205255))

(declare-fun m!205257 () Bool)

(assert (=> b!177221 m!205257))

(assert (=> b!177226 m!205253))

(declare-fun m!205259 () Bool)

(assert (=> b!177226 m!205259))

(declare-fun m!205261 () Bool)

(assert (=> b!177226 m!205261))

(assert (=> b!177226 m!205253))

(declare-fun m!205263 () Bool)

(assert (=> b!177226 m!205263))

(assert (=> b!177226 m!205263))

(assert (=> b!177226 m!205261))

(declare-fun m!205265 () Bool)

(assert (=> b!177226 m!205265))

(declare-fun m!205267 () Bool)

(assert (=> bm!17916 m!205267))

(declare-fun m!205269 () Bool)

(assert (=> bm!17917 m!205269))

(assert (=> b!177225 m!205253))

(assert (=> b!177225 m!205253))

(declare-fun m!205271 () Bool)

(assert (=> b!177225 m!205271))

(declare-fun m!205273 () Bool)

(assert (=> b!177229 m!205273))

(assert (=> d!53597 m!205185))

(assert (=> b!177230 m!205253))

(assert (=> b!177230 m!205253))

(assert (=> b!177230 m!205255))

(declare-fun m!205275 () Bool)

(assert (=> bm!17912 m!205275))

(declare-fun m!205277 () Bool)

(assert (=> bm!17914 m!205277))

(declare-fun m!205279 () Bool)

(assert (=> b!177227 m!205279))

(assert (=> b!177227 m!205267))

(declare-fun m!205281 () Bool)

(assert (=> b!177227 m!205281))

(declare-fun m!205283 () Bool)

(assert (=> b!177227 m!205283))

(declare-fun m!205285 () Bool)

(assert (=> b!177227 m!205285))

(declare-fun m!205287 () Bool)

(assert (=> b!177227 m!205287))

(declare-fun m!205289 () Bool)

(assert (=> b!177227 m!205289))

(declare-fun m!205291 () Bool)

(assert (=> b!177227 m!205291))

(declare-fun m!205293 () Bool)

(assert (=> b!177227 m!205293))

(declare-fun m!205295 () Bool)

(assert (=> b!177227 m!205295))

(declare-fun m!205297 () Bool)

(assert (=> b!177227 m!205297))

(assert (=> b!177227 m!205281))

(assert (=> b!177227 m!205295))

(declare-fun m!205299 () Bool)

(assert (=> b!177227 m!205299))

(declare-fun m!205301 () Bool)

(assert (=> b!177227 m!205301))

(assert (=> b!177227 m!205287))

(declare-fun m!205303 () Bool)

(assert (=> b!177227 m!205303))

(declare-fun m!205305 () Bool)

(assert (=> b!177227 m!205305))

(declare-fun m!205307 () Bool)

(assert (=> b!177227 m!205307))

(assert (=> b!177227 m!205253))

(assert (=> b!177227 m!205299))

(assert (=> b!177086 d!53597))

(declare-fun condMapEmpty!7101 () Bool)

(declare-fun mapDefault!7101 () ValueCell!1733)

(assert (=> mapNonEmpty!7092 (= condMapEmpty!7101 (= mapRest!7092 ((as const (Array (_ BitVec 32) ValueCell!1733)) mapDefault!7101)))))

(declare-fun e!116880 () Bool)

(declare-fun mapRes!7101 () Bool)

(assert (=> mapNonEmpty!7092 (= tp!15843 (and e!116880 mapRes!7101))))

(declare-fun b!177249 () Bool)

(assert (=> b!177249 (= e!116880 tp_is_empty!4153)))

(declare-fun b!177248 () Bool)

(declare-fun e!116879 () Bool)

(assert (=> b!177248 (= e!116879 tp_is_empty!4153)))

(declare-fun mapIsEmpty!7101 () Bool)

(assert (=> mapIsEmpty!7101 mapRes!7101))

(declare-fun mapNonEmpty!7101 () Bool)

(declare-fun tp!15858 () Bool)

(assert (=> mapNonEmpty!7101 (= mapRes!7101 (and tp!15858 e!116879))))

(declare-fun mapRest!7101 () (Array (_ BitVec 32) ValueCell!1733))

(declare-fun mapKey!7101 () (_ BitVec 32))

(declare-fun mapValue!7101 () ValueCell!1733)

(assert (=> mapNonEmpty!7101 (= mapRest!7092 (store mapRest!7101 mapKey!7101 mapValue!7101))))

(assert (= (and mapNonEmpty!7092 condMapEmpty!7101) mapIsEmpty!7101))

(assert (= (and mapNonEmpty!7092 (not condMapEmpty!7101)) mapNonEmpty!7101))

(assert (= (and mapNonEmpty!7101 ((_ is ValueCellFull!1733) mapValue!7101)) b!177248))

(assert (= (and mapNonEmpty!7092 ((_ is ValueCellFull!1733) mapDefault!7101)) b!177249))

(declare-fun m!205309 () Bool)

(assert (=> mapNonEmpty!7101 m!205309))

(declare-fun b_lambda!7035 () Bool)

(assert (= b_lambda!7033 (or (and b!177090 b_free!4381) b_lambda!7035)))

(check-sat (not b!177167) (not b!177230) (not bm!17914) (not b!177147) (not b!177220) b_and!10861 (not bm!17916) (not b!177229) (not b!177227) (not d!53597) (not b!177226) (not b!177221) (not b!177174) (not d!53585) tp_is_empty!4153 (not b!177148) (not b!177149) (not b_next!4381) (not b!177176) (not d!53595) (not bm!17912) (not b!177222) (not d!53587) (not b!177225) (not bm!17917) (not mapNonEmpty!7101) (not b_lambda!7035))
(check-sat b_and!10861 (not b_next!4381))
