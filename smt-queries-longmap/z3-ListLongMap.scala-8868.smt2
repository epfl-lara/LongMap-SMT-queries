; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107850 () Bool)

(assert start!107850)

(declare-fun b!1275130 () Bool)

(declare-fun b_free!27751 () Bool)

(declare-fun b_next!27751 () Bool)

(assert (=> b!1275130 (= b_free!27751 (not b_next!27751))))

(declare-fun tp!97813 () Bool)

(declare-fun b_and!45809 () Bool)

(assert (=> b!1275130 (= tp!97813 b_and!45809)))

(declare-fun mapIsEmpty!51316 () Bool)

(declare-fun mapRes!51316 () Bool)

(assert (=> mapIsEmpty!51316 mapRes!51316))

(declare-fun b!1275124 () Bool)

(declare-fun e!727708 () Bool)

(declare-fun e!727709 () Bool)

(assert (=> b!1275124 (= e!727708 (and e!727709 mapRes!51316))))

(declare-fun condMapEmpty!51316 () Bool)

(declare-datatypes ((V!49355 0))(
  ( (V!49356 (val!16635 Int)) )
))
(declare-datatypes ((ValueCell!15707 0))(
  ( (ValueCellFull!15707 (v!19267 V!49355)) (EmptyCell!15707) )
))
(declare-datatypes ((array!83539 0))(
  ( (array!83540 (arr!40286 (Array (_ BitVec 32) ValueCell!15707)) (size!40833 (_ BitVec 32))) )
))
(declare-datatypes ((array!83541 0))(
  ( (array!83542 (arr!40287 (Array (_ BitVec 32) (_ BitVec 64))) (size!40834 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6178 0))(
  ( (LongMapFixedSize!6179 (defaultEntry!6735 Int) (mask!34590 (_ BitVec 32)) (extraKeys!6414 (_ BitVec 32)) (zeroValue!6520 V!49355) (minValue!6520 V!49355) (_size!3144 (_ BitVec 32)) (_keys!12187 array!83541) (_values!6758 array!83539) (_vacant!3144 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6178)

(declare-fun mapDefault!51316 () ValueCell!15707)

(assert (=> b!1275124 (= condMapEmpty!51316 (= (arr!40286 (_values!6758 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15707)) mapDefault!51316)))))

(declare-fun res!847505 () Bool)

(declare-fun e!727706 () Bool)

(assert (=> start!107850 (=> (not res!847505) (not e!727706))))

(declare-fun simpleValid!476 (LongMapFixedSize!6178) Bool)

(assert (=> start!107850 (= res!847505 (simpleValid!476 thiss!1551))))

(assert (=> start!107850 e!727706))

(declare-fun e!727704 () Bool)

(assert (=> start!107850 e!727704))

(declare-fun b!1275125 () Bool)

(declare-fun res!847507 () Bool)

(assert (=> b!1275125 (=> (not res!847507) (not e!727706))))

(declare-fun arrayCountValidKeys!0 (array!83541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1275125 (= res!847507 (= (arrayCountValidKeys!0 (_keys!12187 thiss!1551) #b00000000000000000000000000000000 (size!40834 (_keys!12187 thiss!1551))) (_size!3144 thiss!1551)))))

(declare-fun b!1275126 () Bool)

(assert (=> b!1275126 (= e!727706 (bvsgt #b00000000000000000000000000000000 (size!40834 (_keys!12187 thiss!1551))))))

(declare-fun mapNonEmpty!51316 () Bool)

(declare-fun tp!97812 () Bool)

(declare-fun e!727705 () Bool)

(assert (=> mapNonEmpty!51316 (= mapRes!51316 (and tp!97812 e!727705))))

(declare-fun mapRest!51316 () (Array (_ BitVec 32) ValueCell!15707))

(declare-fun mapKey!51316 () (_ BitVec 32))

(declare-fun mapValue!51316 () ValueCell!15707)

(assert (=> mapNonEmpty!51316 (= (arr!40286 (_values!6758 thiss!1551)) (store mapRest!51316 mapKey!51316 mapValue!51316))))

(declare-fun b!1275127 () Bool)

(declare-fun tp_is_empty!33121 () Bool)

(assert (=> b!1275127 (= e!727709 tp_is_empty!33121)))

(declare-fun b!1275128 () Bool)

(assert (=> b!1275128 (= e!727705 tp_is_empty!33121)))

(declare-fun b!1275129 () Bool)

(declare-fun res!847506 () Bool)

(assert (=> b!1275129 (=> (not res!847506) (not e!727706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83541 (_ BitVec 32)) Bool)

(assert (=> b!1275129 (= res!847506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12187 thiss!1551) (mask!34590 thiss!1551)))))

(declare-fun array_inv!30801 (array!83541) Bool)

(declare-fun array_inv!30802 (array!83539) Bool)

(assert (=> b!1275130 (= e!727704 (and tp!97813 tp_is_empty!33121 (array_inv!30801 (_keys!12187 thiss!1551)) (array_inv!30802 (_values!6758 thiss!1551)) e!727708))))

(assert (= (and start!107850 res!847505) b!1275125))

(assert (= (and b!1275125 res!847507) b!1275129))

(assert (= (and b!1275129 res!847506) b!1275126))

(assert (= (and b!1275124 condMapEmpty!51316) mapIsEmpty!51316))

(assert (= (and b!1275124 (not condMapEmpty!51316)) mapNonEmpty!51316))

(get-info :version)

(assert (= (and mapNonEmpty!51316 ((_ is ValueCellFull!15707) mapValue!51316)) b!1275128))

(assert (= (and b!1275124 ((_ is ValueCellFull!15707) mapDefault!51316)) b!1275127))

(assert (= b!1275130 b!1275124))

(assert (= start!107850 b!1275130))

(declare-fun m!1172435 () Bool)

(assert (=> b!1275125 m!1172435))

(declare-fun m!1172437 () Bool)

(assert (=> b!1275130 m!1172437))

(declare-fun m!1172439 () Bool)

(assert (=> b!1275130 m!1172439))

(declare-fun m!1172441 () Bool)

(assert (=> mapNonEmpty!51316 m!1172441))

(declare-fun m!1172443 () Bool)

(assert (=> start!107850 m!1172443))

(declare-fun m!1172445 () Bool)

(assert (=> b!1275129 m!1172445))

(check-sat (not start!107850) b_and!45809 tp_is_empty!33121 (not b!1275125) (not b_next!27751) (not b!1275130) (not mapNonEmpty!51316) (not b!1275129))
(check-sat b_and!45809 (not b_next!27751))
(get-model)

(declare-fun d!140491 () Bool)

(declare-fun res!847535 () Bool)

(declare-fun e!727748 () Bool)

(assert (=> d!140491 (=> (not res!847535) (not e!727748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140491 (= res!847535 (validMask!0 (mask!34590 thiss!1551)))))

(assert (=> d!140491 (= (simpleValid!476 thiss!1551) e!727748)))

(declare-fun b!1275184 () Bool)

(assert (=> b!1275184 (= e!727748 (and (bvsge (extraKeys!6414 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6414 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3144 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1275182 () Bool)

(declare-fun res!847534 () Bool)

(assert (=> b!1275182 (=> (not res!847534) (not e!727748))))

(declare-fun size!40839 (LongMapFixedSize!6178) (_ BitVec 32))

(assert (=> b!1275182 (= res!847534 (bvsge (size!40839 thiss!1551) (_size!3144 thiss!1551)))))

(declare-fun b!1275181 () Bool)

(declare-fun res!847537 () Bool)

(assert (=> b!1275181 (=> (not res!847537) (not e!727748))))

(assert (=> b!1275181 (= res!847537 (and (= (size!40833 (_values!6758 thiss!1551)) (bvadd (mask!34590 thiss!1551) #b00000000000000000000000000000001)) (= (size!40834 (_keys!12187 thiss!1551)) (size!40833 (_values!6758 thiss!1551))) (bvsge (_size!3144 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3144 thiss!1551) (bvadd (mask!34590 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1275183 () Bool)

(declare-fun res!847536 () Bool)

(assert (=> b!1275183 (=> (not res!847536) (not e!727748))))

(assert (=> b!1275183 (= res!847536 (= (size!40839 thiss!1551) (bvadd (_size!3144 thiss!1551) (bvsdiv (bvadd (extraKeys!6414 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!140491 res!847535) b!1275181))

(assert (= (and b!1275181 res!847537) b!1275182))

(assert (= (and b!1275182 res!847534) b!1275183))

(assert (= (and b!1275183 res!847536) b!1275184))

(declare-fun m!1172471 () Bool)

(assert (=> d!140491 m!1172471))

(declare-fun m!1172473 () Bool)

(assert (=> b!1275182 m!1172473))

(assert (=> b!1275183 m!1172473))

(assert (=> start!107850 d!140491))

(declare-fun d!140493 () Bool)

(assert (=> d!140493 (= (array_inv!30801 (_keys!12187 thiss!1551)) (bvsge (size!40834 (_keys!12187 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275130 d!140493))

(declare-fun d!140495 () Bool)

(assert (=> d!140495 (= (array_inv!30802 (_values!6758 thiss!1551)) (bvsge (size!40833 (_values!6758 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275130 d!140495))

(declare-fun b!1275193 () Bool)

(declare-fun e!727755 () Bool)

(declare-fun call!62674 () Bool)

(assert (=> b!1275193 (= e!727755 call!62674)))

(declare-fun d!140497 () Bool)

(declare-fun res!847542 () Bool)

(declare-fun e!727757 () Bool)

(assert (=> d!140497 (=> res!847542 e!727757)))

(assert (=> d!140497 (= res!847542 (bvsge #b00000000000000000000000000000000 (size!40834 (_keys!12187 thiss!1551))))))

(assert (=> d!140497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12187 thiss!1551) (mask!34590 thiss!1551)) e!727757)))

(declare-fun bm!62671 () Bool)

(assert (=> bm!62671 (= call!62674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12187 thiss!1551) (mask!34590 thiss!1551)))))

(declare-fun b!1275194 () Bool)

(assert (=> b!1275194 (= e!727757 e!727755)))

(declare-fun c!124180 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275194 (= c!124180 (validKeyInArray!0 (select (arr!40287 (_keys!12187 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1275195 () Bool)

(declare-fun e!727756 () Bool)

(assert (=> b!1275195 (= e!727755 e!727756)))

(declare-fun lt!575642 () (_ BitVec 64))

(assert (=> b!1275195 (= lt!575642 (select (arr!40287 (_keys!12187 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42305 0))(
  ( (Unit!42306) )
))
(declare-fun lt!575641 () Unit!42305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83541 (_ BitVec 64) (_ BitVec 32)) Unit!42305)

(assert (=> b!1275195 (= lt!575641 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12187 thiss!1551) lt!575642 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275195 (arrayContainsKey!0 (_keys!12187 thiss!1551) lt!575642 #b00000000000000000000000000000000)))

(declare-fun lt!575640 () Unit!42305)

(assert (=> b!1275195 (= lt!575640 lt!575641)))

(declare-fun res!847543 () Bool)

(declare-datatypes ((SeekEntryResult!9953 0))(
  ( (MissingZero!9953 (index!42183 (_ BitVec 32))) (Found!9953 (index!42184 (_ BitVec 32))) (Intermediate!9953 (undefined!10765 Bool) (index!42185 (_ BitVec 32)) (x!112658 (_ BitVec 32))) (Undefined!9953) (MissingVacant!9953 (index!42186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83541 (_ BitVec 32)) SeekEntryResult!9953)

(assert (=> b!1275195 (= res!847543 (= (seekEntryOrOpen!0 (select (arr!40287 (_keys!12187 thiss!1551)) #b00000000000000000000000000000000) (_keys!12187 thiss!1551) (mask!34590 thiss!1551)) (Found!9953 #b00000000000000000000000000000000)))))

(assert (=> b!1275195 (=> (not res!847543) (not e!727756))))

(declare-fun b!1275196 () Bool)

(assert (=> b!1275196 (= e!727756 call!62674)))

(assert (= (and d!140497 (not res!847542)) b!1275194))

(assert (= (and b!1275194 c!124180) b!1275195))

(assert (= (and b!1275194 (not c!124180)) b!1275193))

(assert (= (and b!1275195 res!847543) b!1275196))

(assert (= (or b!1275196 b!1275193) bm!62671))

(declare-fun m!1172475 () Bool)

(assert (=> bm!62671 m!1172475))

(declare-fun m!1172477 () Bool)

(assert (=> b!1275194 m!1172477))

(assert (=> b!1275194 m!1172477))

(declare-fun m!1172479 () Bool)

(assert (=> b!1275194 m!1172479))

(assert (=> b!1275195 m!1172477))

(declare-fun m!1172481 () Bool)

(assert (=> b!1275195 m!1172481))

(declare-fun m!1172483 () Bool)

(assert (=> b!1275195 m!1172483))

(assert (=> b!1275195 m!1172477))

(declare-fun m!1172485 () Bool)

(assert (=> b!1275195 m!1172485))

(assert (=> b!1275129 d!140497))

(declare-fun b!1275205 () Bool)

(declare-fun e!727762 () (_ BitVec 32))

(assert (=> b!1275205 (= e!727762 #b00000000000000000000000000000000)))

(declare-fun bm!62674 () Bool)

(declare-fun call!62677 () (_ BitVec 32))

(assert (=> bm!62674 (= call!62677 (arrayCountValidKeys!0 (_keys!12187 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40834 (_keys!12187 thiss!1551))))))

(declare-fun d!140499 () Bool)

(declare-fun lt!575645 () (_ BitVec 32))

(assert (=> d!140499 (and (bvsge lt!575645 #b00000000000000000000000000000000) (bvsle lt!575645 (bvsub (size!40834 (_keys!12187 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!140499 (= lt!575645 e!727762)))

(declare-fun c!124185 () Bool)

(assert (=> d!140499 (= c!124185 (bvsge #b00000000000000000000000000000000 (size!40834 (_keys!12187 thiss!1551))))))

(assert (=> d!140499 (and (bvsle #b00000000000000000000000000000000 (size!40834 (_keys!12187 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40834 (_keys!12187 thiss!1551)) (size!40834 (_keys!12187 thiss!1551))))))

(assert (=> d!140499 (= (arrayCountValidKeys!0 (_keys!12187 thiss!1551) #b00000000000000000000000000000000 (size!40834 (_keys!12187 thiss!1551))) lt!575645)))

(declare-fun b!1275206 () Bool)

(declare-fun e!727763 () (_ BitVec 32))

(assert (=> b!1275206 (= e!727762 e!727763)))

(declare-fun c!124186 () Bool)

(assert (=> b!1275206 (= c!124186 (validKeyInArray!0 (select (arr!40287 (_keys!12187 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1275207 () Bool)

(assert (=> b!1275207 (= e!727763 call!62677)))

(declare-fun b!1275208 () Bool)

(assert (=> b!1275208 (= e!727763 (bvadd #b00000000000000000000000000000001 call!62677))))

(assert (= (and d!140499 c!124185) b!1275205))

(assert (= (and d!140499 (not c!124185)) b!1275206))

(assert (= (and b!1275206 c!124186) b!1275208))

(assert (= (and b!1275206 (not c!124186)) b!1275207))

(assert (= (or b!1275208 b!1275207) bm!62674))

(declare-fun m!1172487 () Bool)

(assert (=> bm!62674 m!1172487))

(assert (=> b!1275206 m!1172477))

(assert (=> b!1275206 m!1172477))

(assert (=> b!1275206 m!1172479))

(assert (=> b!1275125 d!140499))

(declare-fun mapIsEmpty!51325 () Bool)

(declare-fun mapRes!51325 () Bool)

(assert (=> mapIsEmpty!51325 mapRes!51325))

(declare-fun b!1275216 () Bool)

(declare-fun e!727768 () Bool)

(assert (=> b!1275216 (= e!727768 tp_is_empty!33121)))

(declare-fun b!1275215 () Bool)

(declare-fun e!727769 () Bool)

(assert (=> b!1275215 (= e!727769 tp_is_empty!33121)))

(declare-fun mapNonEmpty!51325 () Bool)

(declare-fun tp!97828 () Bool)

(assert (=> mapNonEmpty!51325 (= mapRes!51325 (and tp!97828 e!727769))))

(declare-fun mapValue!51325 () ValueCell!15707)

(declare-fun mapKey!51325 () (_ BitVec 32))

(declare-fun mapRest!51325 () (Array (_ BitVec 32) ValueCell!15707))

(assert (=> mapNonEmpty!51325 (= mapRest!51316 (store mapRest!51325 mapKey!51325 mapValue!51325))))

(declare-fun condMapEmpty!51325 () Bool)

(declare-fun mapDefault!51325 () ValueCell!15707)

(assert (=> mapNonEmpty!51316 (= condMapEmpty!51325 (= mapRest!51316 ((as const (Array (_ BitVec 32) ValueCell!15707)) mapDefault!51325)))))

(assert (=> mapNonEmpty!51316 (= tp!97812 (and e!727768 mapRes!51325))))

(assert (= (and mapNonEmpty!51316 condMapEmpty!51325) mapIsEmpty!51325))

(assert (= (and mapNonEmpty!51316 (not condMapEmpty!51325)) mapNonEmpty!51325))

(assert (= (and mapNonEmpty!51325 ((_ is ValueCellFull!15707) mapValue!51325)) b!1275215))

(assert (= (and mapNonEmpty!51316 ((_ is ValueCellFull!15707) mapDefault!51325)) b!1275216))

(declare-fun m!1172489 () Bool)

(assert (=> mapNonEmpty!51325 m!1172489))

(check-sat (not b!1275183) (not b!1275194) (not d!140491) b_and!45809 (not b!1275182) (not mapNonEmpty!51325) tp_is_empty!33121 (not b_next!27751) (not bm!62671) (not bm!62674) (not b!1275206) (not b!1275195))
(check-sat b_and!45809 (not b_next!27751))
