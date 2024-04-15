; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17516 () Bool)

(assert start!17516)

(declare-fun b!175269 () Bool)

(declare-fun b_free!4333 () Bool)

(declare-fun b_next!4333 () Bool)

(assert (=> b!175269 (= b_free!4333 (not b_next!4333))))

(declare-fun tp!15678 () Bool)

(declare-fun b_and!10787 () Bool)

(assert (=> b!175269 (= tp!15678 b_and!10787)))

(declare-fun b!175264 () Bool)

(declare-fun e!115684 () Bool)

(declare-fun tp_is_empty!4105 () Bool)

(assert (=> b!175264 (= e!115684 tp_is_empty!4105)))

(declare-fun mapIsEmpty!7000 () Bool)

(declare-fun mapRes!7000 () Bool)

(assert (=> mapIsEmpty!7000 mapRes!7000))

(declare-fun b!175265 () Bool)

(declare-fun res!83063 () Bool)

(declare-fun e!115687 () Bool)

(assert (=> b!175265 (=> (not res!83063) (not e!115687))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!175265 (= res!83063 (not (= key!828 (bvneg key!828))))))

(declare-fun b!175266 () Bool)

(declare-fun e!115688 () Bool)

(assert (=> b!175266 (= e!115688 tp_is_empty!4105)))

(declare-fun b!175268 () Bool)

(declare-datatypes ((V!5121 0))(
  ( (V!5122 (val!2097 Int)) )
))
(declare-datatypes ((ValueCell!1709 0))(
  ( (ValueCellFull!1709 (v!3965 V!5121)) (EmptyCell!1709) )
))
(declare-datatypes ((array!7329 0))(
  ( (array!7330 (arr!3478 (Array (_ BitVec 32) (_ BitVec 64))) (size!3781 (_ BitVec 32))) )
))
(declare-datatypes ((array!7331 0))(
  ( (array!7332 (arr!3479 (Array (_ BitVec 32) ValueCell!1709)) (size!3782 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2326 0))(
  ( (LongMapFixedSize!2327 (defaultEntry!3618 Int) (mask!8514 (_ BitVec 32)) (extraKeys!3355 (_ BitVec 32)) (zeroValue!3459 V!5121) (minValue!3459 V!5121) (_size!1212 (_ BitVec 32)) (_keys!5469 array!7329) (_values!3601 array!7331) (_vacant!1212 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2326)

(assert (=> b!175268 (= e!115687 (and (= (size!3782 (_values!3601 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8514 thiss!1248))) (= (size!3781 (_keys!5469 thiss!1248)) (size!3782 (_values!3601 thiss!1248))) (bvslt (mask!8514 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun e!115683 () Bool)

(declare-fun e!115686 () Bool)

(declare-fun array_inv!2243 (array!7329) Bool)

(declare-fun array_inv!2244 (array!7331) Bool)

(assert (=> b!175269 (= e!115686 (and tp!15678 tp_is_empty!4105 (array_inv!2243 (_keys!5469 thiss!1248)) (array_inv!2244 (_values!3601 thiss!1248)) e!115683))))

(declare-fun mapNonEmpty!7000 () Bool)

(declare-fun tp!15679 () Bool)

(assert (=> mapNonEmpty!7000 (= mapRes!7000 (and tp!15679 e!115688))))

(declare-fun mapKey!7000 () (_ BitVec 32))

(declare-fun mapRest!7000 () (Array (_ BitVec 32) ValueCell!1709))

(declare-fun mapValue!7000 () ValueCell!1709)

(assert (=> mapNonEmpty!7000 (= (arr!3479 (_values!3601 thiss!1248)) (store mapRest!7000 mapKey!7000 mapValue!7000))))

(declare-fun b!175270 () Bool)

(declare-fun res!83062 () Bool)

(assert (=> b!175270 (=> (not res!83062) (not e!115687))))

(declare-datatypes ((tuple2!3254 0))(
  ( (tuple2!3255 (_1!1638 (_ BitVec 64)) (_2!1638 V!5121)) )
))
(declare-datatypes ((List!2227 0))(
  ( (Nil!2224) (Cons!2223 (h!2842 tuple2!3254) (t!7036 List!2227)) )
))
(declare-datatypes ((ListLongMap!2173 0))(
  ( (ListLongMap!2174 (toList!1102 List!2227)) )
))
(declare-fun contains!1167 (ListLongMap!2173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!738 (array!7329 array!7331 (_ BitVec 32) (_ BitVec 32) V!5121 V!5121 (_ BitVec 32) Int) ListLongMap!2173)

(assert (=> b!175270 (= res!83062 (contains!1167 (getCurrentListMap!738 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)) key!828))))

(declare-fun b!175271 () Bool)

(declare-fun res!83064 () Bool)

(assert (=> b!175271 (=> (not res!83064) (not e!115687))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!560 0))(
  ( (MissingZero!560 (index!4408 (_ BitVec 32))) (Found!560 (index!4409 (_ BitVec 32))) (Intermediate!560 (undefined!1372 Bool) (index!4410 (_ BitVec 32)) (x!19299 (_ BitVec 32))) (Undefined!560) (MissingVacant!560 (index!4411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7329 (_ BitVec 32)) SeekEntryResult!560)

(assert (=> b!175271 (= res!83064 ((_ is Undefined!560) (seekEntryOrOpen!0 key!828 (_keys!5469 thiss!1248) (mask!8514 thiss!1248))))))

(declare-fun b!175272 () Bool)

(assert (=> b!175272 (= e!115683 (and e!115684 mapRes!7000))))

(declare-fun condMapEmpty!7000 () Bool)

(declare-fun mapDefault!7000 () ValueCell!1709)

(assert (=> b!175272 (= condMapEmpty!7000 (= (arr!3479 (_values!3601 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1709)) mapDefault!7000)))))

(declare-fun b!175267 () Bool)

(declare-fun res!83066 () Bool)

(assert (=> b!175267 (=> (not res!83066) (not e!115687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175267 (= res!83066 (validMask!0 (mask!8514 thiss!1248)))))

(declare-fun res!83065 () Bool)

(assert (=> start!17516 (=> (not res!83065) (not e!115687))))

(declare-fun valid!997 (LongMapFixedSize!2326) Bool)

(assert (=> start!17516 (= res!83065 (valid!997 thiss!1248))))

(assert (=> start!17516 e!115687))

(assert (=> start!17516 e!115686))

(assert (=> start!17516 true))

(assert (= (and start!17516 res!83065) b!175265))

(assert (= (and b!175265 res!83063) b!175271))

(assert (= (and b!175271 res!83064) b!175270))

(assert (= (and b!175270 res!83062) b!175267))

(assert (= (and b!175267 res!83066) b!175268))

(assert (= (and b!175272 condMapEmpty!7000) mapIsEmpty!7000))

(assert (= (and b!175272 (not condMapEmpty!7000)) mapNonEmpty!7000))

(assert (= (and mapNonEmpty!7000 ((_ is ValueCellFull!1709) mapValue!7000)) b!175266))

(assert (= (and b!175272 ((_ is ValueCellFull!1709) mapDefault!7000)) b!175264))

(assert (= b!175269 b!175272))

(assert (= start!17516 b!175269))

(declare-fun m!203743 () Bool)

(assert (=> b!175267 m!203743))

(declare-fun m!203745 () Bool)

(assert (=> start!17516 m!203745))

(declare-fun m!203747 () Bool)

(assert (=> b!175270 m!203747))

(assert (=> b!175270 m!203747))

(declare-fun m!203749 () Bool)

(assert (=> b!175270 m!203749))

(declare-fun m!203751 () Bool)

(assert (=> b!175271 m!203751))

(declare-fun m!203753 () Bool)

(assert (=> mapNonEmpty!7000 m!203753))

(declare-fun m!203755 () Bool)

(assert (=> b!175269 m!203755))

(declare-fun m!203757 () Bool)

(assert (=> b!175269 m!203757))

(check-sat (not b!175267) (not b!175269) (not b_next!4333) (not b!175271) (not mapNonEmpty!7000) (not b!175270) tp_is_empty!4105 b_and!10787 (not start!17516))
(check-sat b_and!10787 (not b_next!4333))
(get-model)

(declare-fun b!175339 () Bool)

(declare-fun e!115733 () SeekEntryResult!560)

(declare-fun lt!86624 () SeekEntryResult!560)

(assert (=> b!175339 (= e!115733 (MissingZero!560 (index!4410 lt!86624)))))

(declare-fun d!53325 () Bool)

(declare-fun lt!86625 () SeekEntryResult!560)

(assert (=> d!53325 (and (or ((_ is Undefined!560) lt!86625) (not ((_ is Found!560) lt!86625)) (and (bvsge (index!4409 lt!86625) #b00000000000000000000000000000000) (bvslt (index!4409 lt!86625) (size!3781 (_keys!5469 thiss!1248))))) (or ((_ is Undefined!560) lt!86625) ((_ is Found!560) lt!86625) (not ((_ is MissingZero!560) lt!86625)) (and (bvsge (index!4408 lt!86625) #b00000000000000000000000000000000) (bvslt (index!4408 lt!86625) (size!3781 (_keys!5469 thiss!1248))))) (or ((_ is Undefined!560) lt!86625) ((_ is Found!560) lt!86625) ((_ is MissingZero!560) lt!86625) (not ((_ is MissingVacant!560) lt!86625)) (and (bvsge (index!4411 lt!86625) #b00000000000000000000000000000000) (bvslt (index!4411 lt!86625) (size!3781 (_keys!5469 thiss!1248))))) (or ((_ is Undefined!560) lt!86625) (ite ((_ is Found!560) lt!86625) (= (select (arr!3478 (_keys!5469 thiss!1248)) (index!4409 lt!86625)) key!828) (ite ((_ is MissingZero!560) lt!86625) (= (select (arr!3478 (_keys!5469 thiss!1248)) (index!4408 lt!86625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!560) lt!86625) (= (select (arr!3478 (_keys!5469 thiss!1248)) (index!4411 lt!86625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!115731 () SeekEntryResult!560)

(assert (=> d!53325 (= lt!86625 e!115731)))

(declare-fun c!31409 () Bool)

(assert (=> d!53325 (= c!31409 (and ((_ is Intermediate!560) lt!86624) (undefined!1372 lt!86624)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7329 (_ BitVec 32)) SeekEntryResult!560)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53325 (= lt!86624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8514 thiss!1248)) key!828 (_keys!5469 thiss!1248) (mask!8514 thiss!1248)))))

(assert (=> d!53325 (validMask!0 (mask!8514 thiss!1248))))

(assert (=> d!53325 (= (seekEntryOrOpen!0 key!828 (_keys!5469 thiss!1248) (mask!8514 thiss!1248)) lt!86625)))

(declare-fun b!175340 () Bool)

(declare-fun e!115732 () SeekEntryResult!560)

(assert (=> b!175340 (= e!115732 (Found!560 (index!4410 lt!86624)))))

(declare-fun b!175341 () Bool)

(assert (=> b!175341 (= e!115731 Undefined!560)))

(declare-fun b!175342 () Bool)

(assert (=> b!175342 (= e!115731 e!115732)))

(declare-fun lt!86626 () (_ BitVec 64))

(assert (=> b!175342 (= lt!86626 (select (arr!3478 (_keys!5469 thiss!1248)) (index!4410 lt!86624)))))

(declare-fun c!31410 () Bool)

(assert (=> b!175342 (= c!31410 (= lt!86626 key!828))))

(declare-fun b!175343 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7329 (_ BitVec 32)) SeekEntryResult!560)

(assert (=> b!175343 (= e!115733 (seekKeyOrZeroReturnVacant!0 (x!19299 lt!86624) (index!4410 lt!86624) (index!4410 lt!86624) key!828 (_keys!5469 thiss!1248) (mask!8514 thiss!1248)))))

(declare-fun b!175344 () Bool)

(declare-fun c!31408 () Bool)

(assert (=> b!175344 (= c!31408 (= lt!86626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175344 (= e!115732 e!115733)))

(assert (= (and d!53325 c!31409) b!175341))

(assert (= (and d!53325 (not c!31409)) b!175342))

(assert (= (and b!175342 c!31410) b!175340))

(assert (= (and b!175342 (not c!31410)) b!175344))

(assert (= (and b!175344 c!31408) b!175339))

(assert (= (and b!175344 (not c!31408)) b!175343))

(declare-fun m!203791 () Bool)

(assert (=> d!53325 m!203791))

(declare-fun m!203793 () Bool)

(assert (=> d!53325 m!203793))

(declare-fun m!203795 () Bool)

(assert (=> d!53325 m!203795))

(assert (=> d!53325 m!203743))

(declare-fun m!203797 () Bool)

(assert (=> d!53325 m!203797))

(declare-fun m!203799 () Bool)

(assert (=> d!53325 m!203799))

(assert (=> d!53325 m!203797))

(declare-fun m!203801 () Bool)

(assert (=> b!175342 m!203801))

(declare-fun m!203803 () Bool)

(assert (=> b!175343 m!203803))

(assert (=> b!175271 d!53325))

(declare-fun d!53327 () Bool)

(assert (=> d!53327 (= (validMask!0 (mask!8514 thiss!1248)) (and (or (= (mask!8514 thiss!1248) #b00000000000000000000000000000111) (= (mask!8514 thiss!1248) #b00000000000000000000000000001111) (= (mask!8514 thiss!1248) #b00000000000000000000000000011111) (= (mask!8514 thiss!1248) #b00000000000000000000000000111111) (= (mask!8514 thiss!1248) #b00000000000000000000000001111111) (= (mask!8514 thiss!1248) #b00000000000000000000000011111111) (= (mask!8514 thiss!1248) #b00000000000000000000000111111111) (= (mask!8514 thiss!1248) #b00000000000000000000001111111111) (= (mask!8514 thiss!1248) #b00000000000000000000011111111111) (= (mask!8514 thiss!1248) #b00000000000000000000111111111111) (= (mask!8514 thiss!1248) #b00000000000000000001111111111111) (= (mask!8514 thiss!1248) #b00000000000000000011111111111111) (= (mask!8514 thiss!1248) #b00000000000000000111111111111111) (= (mask!8514 thiss!1248) #b00000000000000001111111111111111) (= (mask!8514 thiss!1248) #b00000000000000011111111111111111) (= (mask!8514 thiss!1248) #b00000000000000111111111111111111) (= (mask!8514 thiss!1248) #b00000000000001111111111111111111) (= (mask!8514 thiss!1248) #b00000000000011111111111111111111) (= (mask!8514 thiss!1248) #b00000000000111111111111111111111) (= (mask!8514 thiss!1248) #b00000000001111111111111111111111) (= (mask!8514 thiss!1248) #b00000000011111111111111111111111) (= (mask!8514 thiss!1248) #b00000000111111111111111111111111) (= (mask!8514 thiss!1248) #b00000001111111111111111111111111) (= (mask!8514 thiss!1248) #b00000011111111111111111111111111) (= (mask!8514 thiss!1248) #b00000111111111111111111111111111) (= (mask!8514 thiss!1248) #b00001111111111111111111111111111) (= (mask!8514 thiss!1248) #b00011111111111111111111111111111) (= (mask!8514 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8514 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175267 d!53327))

(declare-fun d!53329 () Bool)

(declare-fun res!83103 () Bool)

(declare-fun e!115736 () Bool)

(assert (=> d!53329 (=> (not res!83103) (not e!115736))))

(declare-fun simpleValid!148 (LongMapFixedSize!2326) Bool)

(assert (=> d!53329 (= res!83103 (simpleValid!148 thiss!1248))))

(assert (=> d!53329 (= (valid!997 thiss!1248) e!115736)))

(declare-fun b!175351 () Bool)

(declare-fun res!83104 () Bool)

(assert (=> b!175351 (=> (not res!83104) (not e!115736))))

(declare-fun arrayCountValidKeys!0 (array!7329 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175351 (= res!83104 (= (arrayCountValidKeys!0 (_keys!5469 thiss!1248) #b00000000000000000000000000000000 (size!3781 (_keys!5469 thiss!1248))) (_size!1212 thiss!1248)))))

(declare-fun b!175352 () Bool)

(declare-fun res!83105 () Bool)

(assert (=> b!175352 (=> (not res!83105) (not e!115736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7329 (_ BitVec 32)) Bool)

(assert (=> b!175352 (= res!83105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5469 thiss!1248) (mask!8514 thiss!1248)))))

(declare-fun b!175353 () Bool)

(declare-datatypes ((List!2229 0))(
  ( (Nil!2226) (Cons!2225 (h!2844 (_ BitVec 64)) (t!7040 List!2229)) )
))
(declare-fun arrayNoDuplicates!0 (array!7329 (_ BitVec 32) List!2229) Bool)

(assert (=> b!175353 (= e!115736 (arrayNoDuplicates!0 (_keys!5469 thiss!1248) #b00000000000000000000000000000000 Nil!2226))))

(assert (= (and d!53329 res!83103) b!175351))

(assert (= (and b!175351 res!83104) b!175352))

(assert (= (and b!175352 res!83105) b!175353))

(declare-fun m!203805 () Bool)

(assert (=> d!53329 m!203805))

(declare-fun m!203807 () Bool)

(assert (=> b!175351 m!203807))

(declare-fun m!203809 () Bool)

(assert (=> b!175352 m!203809))

(declare-fun m!203811 () Bool)

(assert (=> b!175353 m!203811))

(assert (=> start!17516 d!53329))

(declare-fun d!53331 () Bool)

(declare-fun e!115742 () Bool)

(assert (=> d!53331 e!115742))

(declare-fun res!83108 () Bool)

(assert (=> d!53331 (=> res!83108 e!115742)))

(declare-fun lt!86635 () Bool)

(assert (=> d!53331 (= res!83108 (not lt!86635))))

(declare-fun lt!86638 () Bool)

(assert (=> d!53331 (= lt!86635 lt!86638)))

(declare-datatypes ((Unit!5359 0))(
  ( (Unit!5360) )
))
(declare-fun lt!86636 () Unit!5359)

(declare-fun e!115741 () Unit!5359)

(assert (=> d!53331 (= lt!86636 e!115741)))

(declare-fun c!31413 () Bool)

(assert (=> d!53331 (= c!31413 lt!86638)))

(declare-fun containsKey!191 (List!2227 (_ BitVec 64)) Bool)

(assert (=> d!53331 (= lt!86638 (containsKey!191 (toList!1102 (getCurrentListMap!738 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248))) key!828))))

(assert (=> d!53331 (= (contains!1167 (getCurrentListMap!738 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)) key!828) lt!86635)))

(declare-fun b!175360 () Bool)

(declare-fun lt!86637 () Unit!5359)

(assert (=> b!175360 (= e!115741 lt!86637)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!140 (List!2227 (_ BitVec 64)) Unit!5359)

(assert (=> b!175360 (= lt!86637 (lemmaContainsKeyImpliesGetValueByKeyDefined!140 (toList!1102 (getCurrentListMap!738 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248))) key!828))))

(declare-datatypes ((Option!193 0))(
  ( (Some!192 (v!3968 V!5121)) (None!191) )
))
(declare-fun isDefined!141 (Option!193) Bool)

(declare-fun getValueByKey!187 (List!2227 (_ BitVec 64)) Option!193)

(assert (=> b!175360 (isDefined!141 (getValueByKey!187 (toList!1102 (getCurrentListMap!738 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248))) key!828))))

(declare-fun b!175361 () Bool)

(declare-fun Unit!5361 () Unit!5359)

(assert (=> b!175361 (= e!115741 Unit!5361)))

(declare-fun b!175362 () Bool)

(assert (=> b!175362 (= e!115742 (isDefined!141 (getValueByKey!187 (toList!1102 (getCurrentListMap!738 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248))) key!828)))))

(assert (= (and d!53331 c!31413) b!175360))

(assert (= (and d!53331 (not c!31413)) b!175361))

(assert (= (and d!53331 (not res!83108)) b!175362))

(declare-fun m!203813 () Bool)

(assert (=> d!53331 m!203813))

(declare-fun m!203815 () Bool)

(assert (=> b!175360 m!203815))

(declare-fun m!203817 () Bool)

(assert (=> b!175360 m!203817))

(assert (=> b!175360 m!203817))

(declare-fun m!203819 () Bool)

(assert (=> b!175360 m!203819))

(assert (=> b!175362 m!203817))

(assert (=> b!175362 m!203817))

(assert (=> b!175362 m!203819))

(assert (=> b!175270 d!53331))

(declare-fun b!175405 () Bool)

(declare-fun e!115780 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175405 (= e!115780 (validKeyInArray!0 (select (arr!3478 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175406 () Bool)

(declare-fun e!115770 () Bool)

(declare-fun e!115774 () Bool)

(assert (=> b!175406 (= e!115770 e!115774)))

(declare-fun res!83129 () Bool)

(assert (=> b!175406 (=> (not res!83129) (not e!115774))))

(declare-fun lt!86686 () ListLongMap!2173)

(assert (=> b!175406 (= res!83129 (contains!1167 lt!86686 (select (arr!3478 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3781 (_keys!5469 thiss!1248))))))

(declare-fun b!175407 () Bool)

(declare-fun e!115772 () ListLongMap!2173)

(declare-fun e!115771 () ListLongMap!2173)

(assert (=> b!175407 (= e!115772 e!115771)))

(declare-fun c!31431 () Bool)

(assert (=> b!175407 (= c!31431 (and (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175408 () Bool)

(declare-fun e!115781 () Bool)

(declare-fun apply!134 (ListLongMap!2173 (_ BitVec 64)) V!5121)

(assert (=> b!175408 (= e!115781 (= (apply!134 lt!86686 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3459 thiss!1248)))))

(declare-fun b!175409 () Bool)

(declare-fun e!115778 () Bool)

(assert (=> b!175409 (= e!115778 (= (apply!134 lt!86686 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3459 thiss!1248)))))

(declare-fun b!175410 () Bool)

(declare-fun e!115775 () Bool)

(declare-fun call!17752 () Bool)

(assert (=> b!175410 (= e!115775 (not call!17752))))

(declare-fun bm!17746 () Bool)

(declare-fun call!17753 () ListLongMap!2173)

(declare-fun call!17749 () ListLongMap!2173)

(assert (=> bm!17746 (= call!17753 call!17749)))

(declare-fun b!175411 () Bool)

(declare-fun c!31429 () Bool)

(assert (=> b!175411 (= c!31429 (and (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!115777 () ListLongMap!2173)

(assert (=> b!175411 (= e!115771 e!115777)))

(declare-fun b!175412 () Bool)

(declare-fun e!115773 () Unit!5359)

(declare-fun lt!86694 () Unit!5359)

(assert (=> b!175412 (= e!115773 lt!86694)))

(declare-fun lt!86688 () ListLongMap!2173)

(declare-fun getCurrentListMapNoExtraKeys!155 (array!7329 array!7331 (_ BitVec 32) (_ BitVec 32) V!5121 V!5121 (_ BitVec 32) Int) ListLongMap!2173)

(assert (=> b!175412 (= lt!86688 (getCurrentListMapNoExtraKeys!155 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun lt!86703 () (_ BitVec 64))

(assert (=> b!175412 (= lt!86703 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86697 () (_ BitVec 64))

(assert (=> b!175412 (= lt!86697 (select (arr!3478 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86701 () Unit!5359)

(declare-fun addStillContains!110 (ListLongMap!2173 (_ BitVec 64) V!5121 (_ BitVec 64)) Unit!5359)

(assert (=> b!175412 (= lt!86701 (addStillContains!110 lt!86688 lt!86703 (zeroValue!3459 thiss!1248) lt!86697))))

(declare-fun +!246 (ListLongMap!2173 tuple2!3254) ListLongMap!2173)

(assert (=> b!175412 (contains!1167 (+!246 lt!86688 (tuple2!3255 lt!86703 (zeroValue!3459 thiss!1248))) lt!86697)))

(declare-fun lt!86704 () Unit!5359)

(assert (=> b!175412 (= lt!86704 lt!86701)))

(declare-fun lt!86684 () ListLongMap!2173)

(assert (=> b!175412 (= lt!86684 (getCurrentListMapNoExtraKeys!155 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun lt!86702 () (_ BitVec 64))

(assert (=> b!175412 (= lt!86702 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86683 () (_ BitVec 64))

(assert (=> b!175412 (= lt!86683 (select (arr!3478 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86689 () Unit!5359)

(declare-fun addApplyDifferent!110 (ListLongMap!2173 (_ BitVec 64) V!5121 (_ BitVec 64)) Unit!5359)

(assert (=> b!175412 (= lt!86689 (addApplyDifferent!110 lt!86684 lt!86702 (minValue!3459 thiss!1248) lt!86683))))

(assert (=> b!175412 (= (apply!134 (+!246 lt!86684 (tuple2!3255 lt!86702 (minValue!3459 thiss!1248))) lt!86683) (apply!134 lt!86684 lt!86683))))

(declare-fun lt!86692 () Unit!5359)

(assert (=> b!175412 (= lt!86692 lt!86689)))

(declare-fun lt!86700 () ListLongMap!2173)

(assert (=> b!175412 (= lt!86700 (getCurrentListMapNoExtraKeys!155 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun lt!86690 () (_ BitVec 64))

(assert (=> b!175412 (= lt!86690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86693 () (_ BitVec 64))

(assert (=> b!175412 (= lt!86693 (select (arr!3478 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86696 () Unit!5359)

(assert (=> b!175412 (= lt!86696 (addApplyDifferent!110 lt!86700 lt!86690 (zeroValue!3459 thiss!1248) lt!86693))))

(assert (=> b!175412 (= (apply!134 (+!246 lt!86700 (tuple2!3255 lt!86690 (zeroValue!3459 thiss!1248))) lt!86693) (apply!134 lt!86700 lt!86693))))

(declare-fun lt!86691 () Unit!5359)

(assert (=> b!175412 (= lt!86691 lt!86696)))

(declare-fun lt!86685 () ListLongMap!2173)

(assert (=> b!175412 (= lt!86685 (getCurrentListMapNoExtraKeys!155 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun lt!86687 () (_ BitVec 64))

(assert (=> b!175412 (= lt!86687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86699 () (_ BitVec 64))

(assert (=> b!175412 (= lt!86699 (select (arr!3478 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175412 (= lt!86694 (addApplyDifferent!110 lt!86685 lt!86687 (minValue!3459 thiss!1248) lt!86699))))

(assert (=> b!175412 (= (apply!134 (+!246 lt!86685 (tuple2!3255 lt!86687 (minValue!3459 thiss!1248))) lt!86699) (apply!134 lt!86685 lt!86699))))

(declare-fun d!53333 () Bool)

(declare-fun e!115769 () Bool)

(assert (=> d!53333 e!115769))

(declare-fun res!83131 () Bool)

(assert (=> d!53333 (=> (not res!83131) (not e!115769))))

(assert (=> d!53333 (= res!83131 (or (bvsge #b00000000000000000000000000000000 (size!3781 (_keys!5469 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3781 (_keys!5469 thiss!1248))))))))

(declare-fun lt!86695 () ListLongMap!2173)

(assert (=> d!53333 (= lt!86686 lt!86695)))

(declare-fun lt!86698 () Unit!5359)

(assert (=> d!53333 (= lt!86698 e!115773)))

(declare-fun c!31430 () Bool)

(assert (=> d!53333 (= c!31430 e!115780)))

(declare-fun res!83135 () Bool)

(assert (=> d!53333 (=> (not res!83135) (not e!115780))))

(assert (=> d!53333 (= res!83135 (bvslt #b00000000000000000000000000000000 (size!3781 (_keys!5469 thiss!1248))))))

(assert (=> d!53333 (= lt!86695 e!115772)))

(declare-fun c!31426 () Bool)

(assert (=> d!53333 (= c!31426 (and (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53333 (validMask!0 (mask!8514 thiss!1248))))

(assert (=> d!53333 (= (getCurrentListMap!738 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)) lt!86686)))

(declare-fun b!175413 () Bool)

(assert (=> b!175413 (= e!115769 e!115775)))

(declare-fun c!31428 () Bool)

(assert (=> b!175413 (= c!31428 (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17747 () Bool)

(assert (=> bm!17747 (= call!17752 (contains!1167 lt!86686 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175414 () Bool)

(assert (=> b!175414 (= e!115772 (+!246 call!17749 (tuple2!3255 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3459 thiss!1248))))))

(declare-fun b!175415 () Bool)

(declare-fun res!83130 () Bool)

(assert (=> b!175415 (=> (not res!83130) (not e!115769))))

(declare-fun e!115776 () Bool)

(assert (=> b!175415 (= res!83130 e!115776)))

(declare-fun c!31427 () Bool)

(assert (=> b!175415 (= c!31427 (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!175416 () Bool)

(declare-fun Unit!5362 () Unit!5359)

(assert (=> b!175416 (= e!115773 Unit!5362)))

(declare-fun b!175417 () Bool)

(declare-fun call!17755 () Bool)

(assert (=> b!175417 (= e!115776 (not call!17755))))

(declare-fun b!175418 () Bool)

(declare-fun get!1983 (ValueCell!1709 V!5121) V!5121)

(declare-fun dynLambda!468 (Int (_ BitVec 64)) V!5121)

(assert (=> b!175418 (= e!115774 (= (apply!134 lt!86686 (select (arr!3478 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000)) (get!1983 (select (arr!3479 (_values!3601 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!468 (defaultEntry!3618 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3782 (_values!3601 thiss!1248))))))

(assert (=> b!175418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3781 (_keys!5469 thiss!1248))))))

(declare-fun bm!17748 () Bool)

(declare-fun call!17751 () ListLongMap!2173)

(declare-fun call!17754 () ListLongMap!2173)

(assert (=> bm!17748 (= call!17751 call!17754)))

(declare-fun bm!17749 () Bool)

(assert (=> bm!17749 (= call!17755 (contains!1167 lt!86686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175419 () Bool)

(assert (=> b!175419 (= e!115777 call!17751)))

(declare-fun b!175420 () Bool)

(assert (=> b!175420 (= e!115777 call!17753)))

(declare-fun bm!17750 () Bool)

(declare-fun call!17750 () ListLongMap!2173)

(assert (=> bm!17750 (= call!17750 (getCurrentListMapNoExtraKeys!155 (_keys!5469 thiss!1248) (_values!3601 thiss!1248) (mask!8514 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun b!175421 () Bool)

(assert (=> b!175421 (= e!115771 call!17753)))

(declare-fun bm!17751 () Bool)

(assert (=> bm!17751 (= call!17754 call!17750)))

(declare-fun bm!17752 () Bool)

(assert (=> bm!17752 (= call!17749 (+!246 (ite c!31426 call!17750 (ite c!31431 call!17754 call!17751)) (ite (or c!31426 c!31431) (tuple2!3255 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3459 thiss!1248)) (tuple2!3255 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3459 thiss!1248)))))))

(declare-fun b!175422 () Bool)

(declare-fun res!83127 () Bool)

(assert (=> b!175422 (=> (not res!83127) (not e!115769))))

(assert (=> b!175422 (= res!83127 e!115770)))

(declare-fun res!83133 () Bool)

(assert (=> b!175422 (=> res!83133 e!115770)))

(declare-fun e!115779 () Bool)

(assert (=> b!175422 (= res!83133 (not e!115779))))

(declare-fun res!83128 () Bool)

(assert (=> b!175422 (=> (not res!83128) (not e!115779))))

(assert (=> b!175422 (= res!83128 (bvslt #b00000000000000000000000000000000 (size!3781 (_keys!5469 thiss!1248))))))

(declare-fun b!175423 () Bool)

(assert (=> b!175423 (= e!115779 (validKeyInArray!0 (select (arr!3478 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175424 () Bool)

(assert (=> b!175424 (= e!115775 e!115778)))

(declare-fun res!83134 () Bool)

(assert (=> b!175424 (= res!83134 call!17752)))

(assert (=> b!175424 (=> (not res!83134) (not e!115778))))

(declare-fun b!175425 () Bool)

(assert (=> b!175425 (= e!115776 e!115781)))

(declare-fun res!83132 () Bool)

(assert (=> b!175425 (= res!83132 call!17755)))

(assert (=> b!175425 (=> (not res!83132) (not e!115781))))

(assert (= (and d!53333 c!31426) b!175414))

(assert (= (and d!53333 (not c!31426)) b!175407))

(assert (= (and b!175407 c!31431) b!175421))

(assert (= (and b!175407 (not c!31431)) b!175411))

(assert (= (and b!175411 c!31429) b!175420))

(assert (= (and b!175411 (not c!31429)) b!175419))

(assert (= (or b!175420 b!175419) bm!17748))

(assert (= (or b!175421 bm!17748) bm!17751))

(assert (= (or b!175421 b!175420) bm!17746))

(assert (= (or b!175414 bm!17751) bm!17750))

(assert (= (or b!175414 bm!17746) bm!17752))

(assert (= (and d!53333 res!83135) b!175405))

(assert (= (and d!53333 c!31430) b!175412))

(assert (= (and d!53333 (not c!31430)) b!175416))

(assert (= (and d!53333 res!83131) b!175422))

(assert (= (and b!175422 res!83128) b!175423))

(assert (= (and b!175422 (not res!83133)) b!175406))

(assert (= (and b!175406 res!83129) b!175418))

(assert (= (and b!175422 res!83127) b!175415))

(assert (= (and b!175415 c!31427) b!175425))

(assert (= (and b!175415 (not c!31427)) b!175417))

(assert (= (and b!175425 res!83132) b!175408))

(assert (= (or b!175425 b!175417) bm!17749))

(assert (= (and b!175415 res!83130) b!175413))

(assert (= (and b!175413 c!31428) b!175424))

(assert (= (and b!175413 (not c!31428)) b!175410))

(assert (= (and b!175424 res!83134) b!175409))

(assert (= (or b!175424 b!175410) bm!17747))

(declare-fun b_lambda!6993 () Bool)

(assert (=> (not b_lambda!6993) (not b!175418)))

(declare-fun t!7039 () Bool)

(declare-fun tb!2771 () Bool)

(assert (=> (and b!175269 (= (defaultEntry!3618 thiss!1248) (defaultEntry!3618 thiss!1248)) t!7039) tb!2771))

(declare-fun result!4603 () Bool)

(assert (=> tb!2771 (= result!4603 tp_is_empty!4105)))

(assert (=> b!175418 t!7039))

(declare-fun b_and!10793 () Bool)

(assert (= b_and!10787 (and (=> t!7039 result!4603) b_and!10793)))

(declare-fun m!203821 () Bool)

(assert (=> b!175409 m!203821))

(declare-fun m!203823 () Bool)

(assert (=> bm!17750 m!203823))

(declare-fun m!203825 () Bool)

(assert (=> b!175405 m!203825))

(assert (=> b!175405 m!203825))

(declare-fun m!203827 () Bool)

(assert (=> b!175405 m!203827))

(declare-fun m!203829 () Bool)

(assert (=> b!175412 m!203829))

(declare-fun m!203831 () Bool)

(assert (=> b!175412 m!203831))

(declare-fun m!203833 () Bool)

(assert (=> b!175412 m!203833))

(declare-fun m!203835 () Bool)

(assert (=> b!175412 m!203835))

(assert (=> b!175412 m!203825))

(declare-fun m!203837 () Bool)

(assert (=> b!175412 m!203837))

(declare-fun m!203839 () Bool)

(assert (=> b!175412 m!203839))

(assert (=> b!175412 m!203823))

(declare-fun m!203841 () Bool)

(assert (=> b!175412 m!203841))

(declare-fun m!203843 () Bool)

(assert (=> b!175412 m!203843))

(declare-fun m!203845 () Bool)

(assert (=> b!175412 m!203845))

(declare-fun m!203847 () Bool)

(assert (=> b!175412 m!203847))

(assert (=> b!175412 m!203837))

(declare-fun m!203849 () Bool)

(assert (=> b!175412 m!203849))

(assert (=> b!175412 m!203835))

(declare-fun m!203851 () Bool)

(assert (=> b!175412 m!203851))

(assert (=> b!175412 m!203843))

(declare-fun m!203853 () Bool)

(assert (=> b!175412 m!203853))

(assert (=> b!175412 m!203829))

(declare-fun m!203855 () Bool)

(assert (=> b!175412 m!203855))

(declare-fun m!203857 () Bool)

(assert (=> b!175412 m!203857))

(declare-fun m!203859 () Bool)

(assert (=> bm!17752 m!203859))

(assert (=> b!175406 m!203825))

(assert (=> b!175406 m!203825))

(declare-fun m!203861 () Bool)

(assert (=> b!175406 m!203861))

(assert (=> d!53333 m!203743))

(declare-fun m!203863 () Bool)

(assert (=> bm!17749 m!203863))

(declare-fun m!203865 () Bool)

(assert (=> b!175414 m!203865))

(declare-fun m!203867 () Bool)

(assert (=> b!175408 m!203867))

(declare-fun m!203869 () Bool)

(assert (=> bm!17747 m!203869))

(assert (=> b!175423 m!203825))

(assert (=> b!175423 m!203825))

(assert (=> b!175423 m!203827))

(declare-fun m!203871 () Bool)

(assert (=> b!175418 m!203871))

(assert (=> b!175418 m!203825))

(declare-fun m!203873 () Bool)

(assert (=> b!175418 m!203873))

(declare-fun m!203875 () Bool)

(assert (=> b!175418 m!203875))

(assert (=> b!175418 m!203825))

(assert (=> b!175418 m!203871))

(assert (=> b!175418 m!203875))

(declare-fun m!203877 () Bool)

(assert (=> b!175418 m!203877))

(assert (=> b!175270 d!53333))

(declare-fun d!53335 () Bool)

(assert (=> d!53335 (= (array_inv!2243 (_keys!5469 thiss!1248)) (bvsge (size!3781 (_keys!5469 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175269 d!53335))

(declare-fun d!53337 () Bool)

(assert (=> d!53337 (= (array_inv!2244 (_values!3601 thiss!1248)) (bvsge (size!3782 (_values!3601 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175269 d!53337))

(declare-fun b!175434 () Bool)

(declare-fun e!115786 () Bool)

(assert (=> b!175434 (= e!115786 tp_is_empty!4105)))

(declare-fun b!175435 () Bool)

(declare-fun e!115787 () Bool)

(assert (=> b!175435 (= e!115787 tp_is_empty!4105)))

(declare-fun condMapEmpty!7009 () Bool)

(declare-fun mapDefault!7009 () ValueCell!1709)

(assert (=> mapNonEmpty!7000 (= condMapEmpty!7009 (= mapRest!7000 ((as const (Array (_ BitVec 32) ValueCell!1709)) mapDefault!7009)))))

(declare-fun mapRes!7009 () Bool)

(assert (=> mapNonEmpty!7000 (= tp!15679 (and e!115787 mapRes!7009))))

(declare-fun mapIsEmpty!7009 () Bool)

(assert (=> mapIsEmpty!7009 mapRes!7009))

(declare-fun mapNonEmpty!7009 () Bool)

(declare-fun tp!15694 () Bool)

(assert (=> mapNonEmpty!7009 (= mapRes!7009 (and tp!15694 e!115786))))

(declare-fun mapValue!7009 () ValueCell!1709)

(declare-fun mapKey!7009 () (_ BitVec 32))

(declare-fun mapRest!7009 () (Array (_ BitVec 32) ValueCell!1709))

(assert (=> mapNonEmpty!7009 (= mapRest!7000 (store mapRest!7009 mapKey!7009 mapValue!7009))))

(assert (= (and mapNonEmpty!7000 condMapEmpty!7009) mapIsEmpty!7009))

(assert (= (and mapNonEmpty!7000 (not condMapEmpty!7009)) mapNonEmpty!7009))

(assert (= (and mapNonEmpty!7009 ((_ is ValueCellFull!1709) mapValue!7009)) b!175434))

(assert (= (and mapNonEmpty!7000 ((_ is ValueCellFull!1709) mapDefault!7009)) b!175435))

(declare-fun m!203879 () Bool)

(assert (=> mapNonEmpty!7009 m!203879))

(declare-fun b_lambda!6995 () Bool)

(assert (= b_lambda!6993 (or (and b!175269 b_free!4333) b_lambda!6995)))

(check-sat (not bm!17752) (not d!53331) (not b!175353) (not b!175414) (not b!175360) (not b_next!4333) (not d!53333) (not b!175352) (not b!175412) b_and!10793 (not d!53325) (not b_lambda!6995) (not bm!17750) (not b!175423) (not b!175405) (not d!53329) (not b!175351) (not b!175406) (not bm!17749) (not mapNonEmpty!7009) (not b!175418) (not b!175408) (not b!175362) (not b!175409) (not bm!17747) (not b!175343) tp_is_empty!4105)
(check-sat b_and!10793 (not b_next!4333))
