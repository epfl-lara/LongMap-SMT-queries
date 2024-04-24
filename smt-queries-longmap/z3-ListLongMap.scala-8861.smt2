; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107750 () Bool)

(assert start!107750)

(declare-fun b!1274550 () Bool)

(declare-fun b_free!27709 () Bool)

(declare-fun b_next!27709 () Bool)

(assert (=> b!1274550 (= b_free!27709 (not b_next!27709))))

(declare-fun tp!97668 () Bool)

(declare-fun b_and!45767 () Bool)

(assert (=> b!1274550 (= tp!97668 b_and!45767)))

(declare-fun e!727233 () Bool)

(declare-datatypes ((V!49299 0))(
  ( (V!49300 (val!16614 Int)) )
))
(declare-datatypes ((ValueCell!15686 0))(
  ( (ValueCellFull!15686 (v!19246 V!49299)) (EmptyCell!15686) )
))
(declare-datatypes ((array!83443 0))(
  ( (array!83444 (arr!40244 (Array (_ BitVec 32) ValueCell!15686)) (size!40786 (_ BitVec 32))) )
))
(declare-datatypes ((array!83445 0))(
  ( (array!83446 (arr!40245 (Array (_ BitVec 32) (_ BitVec 64))) (size!40787 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6136 0))(
  ( (LongMapFixedSize!6137 (defaultEntry!6714 Int) (mask!34549 (_ BitVec 32)) (extraKeys!6393 (_ BitVec 32)) (zeroValue!6499 V!49299) (minValue!6499 V!49299) (_size!3123 (_ BitVec 32)) (_keys!12165 array!83445) (_values!6737 array!83443) (_vacant!3123 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6136)

(declare-fun tp_is_empty!33079 () Bool)

(declare-fun e!727231 () Bool)

(declare-fun array_inv!30777 (array!83445) Bool)

(declare-fun array_inv!30778 (array!83443) Bool)

(assert (=> b!1274550 (= e!727233 (and tp!97668 tp_is_empty!33079 (array_inv!30777 (_keys!12165 thiss!1559)) (array_inv!30778 (_values!6737 thiss!1559)) e!727231))))

(declare-fun mapIsEmpty!51234 () Bool)

(declare-fun mapRes!51234 () Bool)

(assert (=> mapIsEmpty!51234 mapRes!51234))

(declare-fun b!1274551 () Bool)

(declare-fun res!847285 () Bool)

(declare-fun e!727235 () Bool)

(assert (=> b!1274551 (=> (not res!847285) (not e!727235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83445 (_ BitVec 32)) Bool)

(assert (=> b!1274551 (= res!847285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12165 thiss!1559) (mask!34549 thiss!1559)))))

(declare-fun mapNonEmpty!51234 () Bool)

(declare-fun tp!97667 () Bool)

(declare-fun e!727236 () Bool)

(assert (=> mapNonEmpty!51234 (= mapRes!51234 (and tp!97667 e!727236))))

(declare-fun mapKey!51234 () (_ BitVec 32))

(declare-fun mapValue!51234 () ValueCell!15686)

(declare-fun mapRest!51234 () (Array (_ BitVec 32) ValueCell!15686))

(assert (=> mapNonEmpty!51234 (= (arr!40244 (_values!6737 thiss!1559)) (store mapRest!51234 mapKey!51234 mapValue!51234))))

(declare-fun b!1274552 () Bool)

(assert (=> b!1274552 (= e!727235 (bvsgt #b00000000000000000000000000000000 (size!40787 (_keys!12165 thiss!1559))))))

(declare-fun b!1274553 () Bool)

(declare-fun res!847283 () Bool)

(assert (=> b!1274553 (=> (not res!847283) (not e!727235))))

(assert (=> b!1274553 (= res!847283 (and (= (size!40786 (_values!6737 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34549 thiss!1559))) (= (size!40787 (_keys!12165 thiss!1559)) (size!40786 (_values!6737 thiss!1559))) (bvsge (mask!34549 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6393 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6393 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1274554 () Bool)

(declare-fun res!847281 () Bool)

(assert (=> b!1274554 (=> (not res!847281) (not e!727235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1274554 (= res!847281 (validMask!0 (mask!34549 thiss!1559)))))

(declare-fun b!1274555 () Bool)

(declare-fun res!847282 () Bool)

(assert (=> b!1274555 (=> (not res!847282) (not e!727235))))

(declare-datatypes ((List!28594 0))(
  ( (Nil!28591) (Cons!28590 (h!29808 (_ BitVec 64)) (t!42119 List!28594)) )
))
(declare-fun arrayNoDuplicates!0 (array!83445 (_ BitVec 32) List!28594) Bool)

(assert (=> b!1274555 (= res!847282 (arrayNoDuplicates!0 (_keys!12165 thiss!1559) #b00000000000000000000000000000000 Nil!28591))))

(declare-fun b!1274556 () Bool)

(declare-fun e!727234 () Bool)

(assert (=> b!1274556 (= e!727231 (and e!727234 mapRes!51234))))

(declare-fun condMapEmpty!51234 () Bool)

(declare-fun mapDefault!51234 () ValueCell!15686)

(assert (=> b!1274556 (= condMapEmpty!51234 (= (arr!40244 (_values!6737 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15686)) mapDefault!51234)))))

(declare-fun res!847284 () Bool)

(assert (=> start!107750 (=> (not res!847284) (not e!727235))))

(declare-fun valid!2302 (LongMapFixedSize!6136) Bool)

(assert (=> start!107750 (= res!847284 (valid!2302 thiss!1559))))

(assert (=> start!107750 e!727235))

(assert (=> start!107750 e!727233))

(declare-fun b!1274557 () Bool)

(assert (=> b!1274557 (= e!727236 tp_is_empty!33079)))

(declare-fun b!1274558 () Bool)

(assert (=> b!1274558 (= e!727234 tp_is_empty!33079)))

(assert (= (and start!107750 res!847284) b!1274554))

(assert (= (and b!1274554 res!847281) b!1274553))

(assert (= (and b!1274553 res!847283) b!1274551))

(assert (= (and b!1274551 res!847285) b!1274555))

(assert (= (and b!1274555 res!847282) b!1274552))

(assert (= (and b!1274556 condMapEmpty!51234) mapIsEmpty!51234))

(assert (= (and b!1274556 (not condMapEmpty!51234)) mapNonEmpty!51234))

(get-info :version)

(assert (= (and mapNonEmpty!51234 ((_ is ValueCellFull!15686) mapValue!51234)) b!1274557))

(assert (= (and b!1274556 ((_ is ValueCellFull!15686) mapDefault!51234)) b!1274558))

(assert (= b!1274550 b!1274556))

(assert (= start!107750 b!1274550))

(declare-fun m!1172141 () Bool)

(assert (=> mapNonEmpty!51234 m!1172141))

(declare-fun m!1172143 () Bool)

(assert (=> b!1274554 m!1172143))

(declare-fun m!1172145 () Bool)

(assert (=> b!1274555 m!1172145))

(declare-fun m!1172147 () Bool)

(assert (=> b!1274550 m!1172147))

(declare-fun m!1172149 () Bool)

(assert (=> b!1274550 m!1172149))

(declare-fun m!1172151 () Bool)

(assert (=> b!1274551 m!1172151))

(declare-fun m!1172153 () Bool)

(assert (=> start!107750 m!1172153))

(check-sat (not b!1274554) (not b!1274550) b_and!45767 (not b!1274551) tp_is_empty!33079 (not b!1274555) (not b_next!27709) (not mapNonEmpty!51234) (not start!107750))
(check-sat b_and!45767 (not b_next!27709))
(get-model)

(declare-fun bm!62656 () Bool)

(declare-fun call!62659 () Bool)

(assert (=> bm!62656 (= call!62659 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12165 thiss!1559) (mask!34549 thiss!1559)))))

(declare-fun b!1274621 () Bool)

(declare-fun e!727281 () Bool)

(assert (=> b!1274621 (= e!727281 call!62659)))

(declare-fun b!1274622 () Bool)

(declare-fun e!727280 () Bool)

(assert (=> b!1274622 (= e!727280 e!727281)))

(declare-fun c!124156 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274622 (= c!124156 (validKeyInArray!0 (select (arr!40245 (_keys!12165 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274623 () Bool)

(declare-fun e!727279 () Bool)

(assert (=> b!1274623 (= e!727279 call!62659)))

(declare-fun b!1274624 () Bool)

(assert (=> b!1274624 (= e!727281 e!727279)))

(declare-fun lt!575613 () (_ BitVec 64))

(assert (=> b!1274624 (= lt!575613 (select (arr!40245 (_keys!12165 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42303 0))(
  ( (Unit!42304) )
))
(declare-fun lt!575615 () Unit!42303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83445 (_ BitVec 64) (_ BitVec 32)) Unit!42303)

(assert (=> b!1274624 (= lt!575615 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12165 thiss!1559) lt!575613 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274624 (arrayContainsKey!0 (_keys!12165 thiss!1559) lt!575613 #b00000000000000000000000000000000)))

(declare-fun lt!575614 () Unit!42303)

(assert (=> b!1274624 (= lt!575614 lt!575615)))

(declare-fun res!847320 () Bool)

(declare-datatypes ((SeekEntryResult!9952 0))(
  ( (MissingZero!9952 (index!42179 (_ BitVec 32))) (Found!9952 (index!42180 (_ BitVec 32))) (Intermediate!9952 (undefined!10764 Bool) (index!42181 (_ BitVec 32)) (x!112547 (_ BitVec 32))) (Undefined!9952) (MissingVacant!9952 (index!42182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83445 (_ BitVec 32)) SeekEntryResult!9952)

(assert (=> b!1274624 (= res!847320 (= (seekEntryOrOpen!0 (select (arr!40245 (_keys!12165 thiss!1559)) #b00000000000000000000000000000000) (_keys!12165 thiss!1559) (mask!34549 thiss!1559)) (Found!9952 #b00000000000000000000000000000000)))))

(assert (=> b!1274624 (=> (not res!847320) (not e!727279))))

(declare-fun d!140419 () Bool)

(declare-fun res!847321 () Bool)

(assert (=> d!140419 (=> res!847321 e!727280)))

(assert (=> d!140419 (= res!847321 (bvsge #b00000000000000000000000000000000 (size!40787 (_keys!12165 thiss!1559))))))

(assert (=> d!140419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12165 thiss!1559) (mask!34549 thiss!1559)) e!727280)))

(assert (= (and d!140419 (not res!847321)) b!1274622))

(assert (= (and b!1274622 c!124156) b!1274624))

(assert (= (and b!1274622 (not c!124156)) b!1274621))

(assert (= (and b!1274624 res!847320) b!1274623))

(assert (= (or b!1274623 b!1274621) bm!62656))

(declare-fun m!1172183 () Bool)

(assert (=> bm!62656 m!1172183))

(declare-fun m!1172185 () Bool)

(assert (=> b!1274622 m!1172185))

(assert (=> b!1274622 m!1172185))

(declare-fun m!1172187 () Bool)

(assert (=> b!1274622 m!1172187))

(assert (=> b!1274624 m!1172185))

(declare-fun m!1172189 () Bool)

(assert (=> b!1274624 m!1172189))

(declare-fun m!1172191 () Bool)

(assert (=> b!1274624 m!1172191))

(assert (=> b!1274624 m!1172185))

(declare-fun m!1172193 () Bool)

(assert (=> b!1274624 m!1172193))

(assert (=> b!1274551 d!140419))

(declare-fun d!140421 () Bool)

(declare-fun res!847328 () Bool)

(declare-fun e!727284 () Bool)

(assert (=> d!140421 (=> (not res!847328) (not e!727284))))

(declare-fun simpleValid!463 (LongMapFixedSize!6136) Bool)

(assert (=> d!140421 (= res!847328 (simpleValid!463 thiss!1559))))

(assert (=> d!140421 (= (valid!2302 thiss!1559) e!727284)))

(declare-fun b!1274631 () Bool)

(declare-fun res!847329 () Bool)

(assert (=> b!1274631 (=> (not res!847329) (not e!727284))))

(declare-fun arrayCountValidKeys!0 (array!83445 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274631 (= res!847329 (= (arrayCountValidKeys!0 (_keys!12165 thiss!1559) #b00000000000000000000000000000000 (size!40787 (_keys!12165 thiss!1559))) (_size!3123 thiss!1559)))))

(declare-fun b!1274632 () Bool)

(declare-fun res!847330 () Bool)

(assert (=> b!1274632 (=> (not res!847330) (not e!727284))))

(assert (=> b!1274632 (= res!847330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12165 thiss!1559) (mask!34549 thiss!1559)))))

(declare-fun b!1274633 () Bool)

(assert (=> b!1274633 (= e!727284 (arrayNoDuplicates!0 (_keys!12165 thiss!1559) #b00000000000000000000000000000000 Nil!28591))))

(assert (= (and d!140421 res!847328) b!1274631))

(assert (= (and b!1274631 res!847329) b!1274632))

(assert (= (and b!1274632 res!847330) b!1274633))

(declare-fun m!1172195 () Bool)

(assert (=> d!140421 m!1172195))

(declare-fun m!1172197 () Bool)

(assert (=> b!1274631 m!1172197))

(assert (=> b!1274632 m!1172151))

(assert (=> b!1274633 m!1172145))

(assert (=> start!107750 d!140421))

(declare-fun d!140423 () Bool)

(assert (=> d!140423 (= (array_inv!30777 (_keys!12165 thiss!1559)) (bvsge (size!40787 (_keys!12165 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274550 d!140423))

(declare-fun d!140425 () Bool)

(assert (=> d!140425 (= (array_inv!30778 (_values!6737 thiss!1559)) (bvsge (size!40786 (_values!6737 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274550 d!140425))

(declare-fun d!140427 () Bool)

(assert (=> d!140427 (= (validMask!0 (mask!34549 thiss!1559)) (and (or (= (mask!34549 thiss!1559) #b00000000000000000000000000000111) (= (mask!34549 thiss!1559) #b00000000000000000000000000001111) (= (mask!34549 thiss!1559) #b00000000000000000000000000011111) (= (mask!34549 thiss!1559) #b00000000000000000000000000111111) (= (mask!34549 thiss!1559) #b00000000000000000000000001111111) (= (mask!34549 thiss!1559) #b00000000000000000000000011111111) (= (mask!34549 thiss!1559) #b00000000000000000000000111111111) (= (mask!34549 thiss!1559) #b00000000000000000000001111111111) (= (mask!34549 thiss!1559) #b00000000000000000000011111111111) (= (mask!34549 thiss!1559) #b00000000000000000000111111111111) (= (mask!34549 thiss!1559) #b00000000000000000001111111111111) (= (mask!34549 thiss!1559) #b00000000000000000011111111111111) (= (mask!34549 thiss!1559) #b00000000000000000111111111111111) (= (mask!34549 thiss!1559) #b00000000000000001111111111111111) (= (mask!34549 thiss!1559) #b00000000000000011111111111111111) (= (mask!34549 thiss!1559) #b00000000000000111111111111111111) (= (mask!34549 thiss!1559) #b00000000000001111111111111111111) (= (mask!34549 thiss!1559) #b00000000000011111111111111111111) (= (mask!34549 thiss!1559) #b00000000000111111111111111111111) (= (mask!34549 thiss!1559) #b00000000001111111111111111111111) (= (mask!34549 thiss!1559) #b00000000011111111111111111111111) (= (mask!34549 thiss!1559) #b00000000111111111111111111111111) (= (mask!34549 thiss!1559) #b00000001111111111111111111111111) (= (mask!34549 thiss!1559) #b00000011111111111111111111111111) (= (mask!34549 thiss!1559) #b00000111111111111111111111111111) (= (mask!34549 thiss!1559) #b00001111111111111111111111111111) (= (mask!34549 thiss!1559) #b00011111111111111111111111111111) (= (mask!34549 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34549 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1274554 d!140427))

(declare-fun b!1274644 () Bool)

(declare-fun e!727296 () Bool)

(declare-fun e!727293 () Bool)

(assert (=> b!1274644 (= e!727296 e!727293)))

(declare-fun c!124159 () Bool)

(assert (=> b!1274644 (= c!124159 (validKeyInArray!0 (select (arr!40245 (_keys!12165 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274645 () Bool)

(declare-fun call!62662 () Bool)

(assert (=> b!1274645 (= e!727293 call!62662)))

(declare-fun b!1274646 () Bool)

(declare-fun e!727294 () Bool)

(assert (=> b!1274646 (= e!727294 e!727296)))

(declare-fun res!847337 () Bool)

(assert (=> b!1274646 (=> (not res!847337) (not e!727296))))

(declare-fun e!727295 () Bool)

(assert (=> b!1274646 (= res!847337 (not e!727295))))

(declare-fun res!847339 () Bool)

(assert (=> b!1274646 (=> (not res!847339) (not e!727295))))

(assert (=> b!1274646 (= res!847339 (validKeyInArray!0 (select (arr!40245 (_keys!12165 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!140429 () Bool)

(declare-fun res!847338 () Bool)

(assert (=> d!140429 (=> res!847338 e!727294)))

(assert (=> d!140429 (= res!847338 (bvsge #b00000000000000000000000000000000 (size!40787 (_keys!12165 thiss!1559))))))

(assert (=> d!140429 (= (arrayNoDuplicates!0 (_keys!12165 thiss!1559) #b00000000000000000000000000000000 Nil!28591) e!727294)))

(declare-fun bm!62659 () Bool)

(assert (=> bm!62659 (= call!62662 (arrayNoDuplicates!0 (_keys!12165 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124159 (Cons!28590 (select (arr!40245 (_keys!12165 thiss!1559)) #b00000000000000000000000000000000) Nil!28591) Nil!28591)))))

(declare-fun b!1274647 () Bool)

(assert (=> b!1274647 (= e!727293 call!62662)))

(declare-fun b!1274648 () Bool)

(declare-fun contains!7698 (List!28594 (_ BitVec 64)) Bool)

(assert (=> b!1274648 (= e!727295 (contains!7698 Nil!28591 (select (arr!40245 (_keys!12165 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!140429 (not res!847338)) b!1274646))

(assert (= (and b!1274646 res!847339) b!1274648))

(assert (= (and b!1274646 res!847337) b!1274644))

(assert (= (and b!1274644 c!124159) b!1274645))

(assert (= (and b!1274644 (not c!124159)) b!1274647))

(assert (= (or b!1274645 b!1274647) bm!62659))

(assert (=> b!1274644 m!1172185))

(assert (=> b!1274644 m!1172185))

(assert (=> b!1274644 m!1172187))

(assert (=> b!1274646 m!1172185))

(assert (=> b!1274646 m!1172185))

(assert (=> b!1274646 m!1172187))

(assert (=> bm!62659 m!1172185))

(declare-fun m!1172199 () Bool)

(assert (=> bm!62659 m!1172199))

(assert (=> b!1274648 m!1172185))

(assert (=> b!1274648 m!1172185))

(declare-fun m!1172201 () Bool)

(assert (=> b!1274648 m!1172201))

(assert (=> b!1274555 d!140429))

(declare-fun mapIsEmpty!51243 () Bool)

(declare-fun mapRes!51243 () Bool)

(assert (=> mapIsEmpty!51243 mapRes!51243))

(declare-fun condMapEmpty!51243 () Bool)

(declare-fun mapDefault!51243 () ValueCell!15686)

(assert (=> mapNonEmpty!51234 (= condMapEmpty!51243 (= mapRest!51234 ((as const (Array (_ BitVec 32) ValueCell!15686)) mapDefault!51243)))))

(declare-fun e!727302 () Bool)

(assert (=> mapNonEmpty!51234 (= tp!97667 (and e!727302 mapRes!51243))))

(declare-fun mapNonEmpty!51243 () Bool)

(declare-fun tp!97683 () Bool)

(declare-fun e!727301 () Bool)

(assert (=> mapNonEmpty!51243 (= mapRes!51243 (and tp!97683 e!727301))))

(declare-fun mapKey!51243 () (_ BitVec 32))

(declare-fun mapRest!51243 () (Array (_ BitVec 32) ValueCell!15686))

(declare-fun mapValue!51243 () ValueCell!15686)

(assert (=> mapNonEmpty!51243 (= mapRest!51234 (store mapRest!51243 mapKey!51243 mapValue!51243))))

(declare-fun b!1274656 () Bool)

(assert (=> b!1274656 (= e!727302 tp_is_empty!33079)))

(declare-fun b!1274655 () Bool)

(assert (=> b!1274655 (= e!727301 tp_is_empty!33079)))

(assert (= (and mapNonEmpty!51234 condMapEmpty!51243) mapIsEmpty!51243))

(assert (= (and mapNonEmpty!51234 (not condMapEmpty!51243)) mapNonEmpty!51243))

(assert (= (and mapNonEmpty!51243 ((_ is ValueCellFull!15686) mapValue!51243)) b!1274655))

(assert (= (and mapNonEmpty!51234 ((_ is ValueCellFull!15686) mapDefault!51243)) b!1274656))

(declare-fun m!1172203 () Bool)

(assert (=> mapNonEmpty!51243 m!1172203))

(check-sat (not b!1274624) (not b!1274648) (not b!1274644) (not d!140421) (not b!1274622) (not b!1274631) (not b!1274633) (not b_next!27709) (not bm!62656) b_and!45767 (not b!1274646) tp_is_empty!33079 (not mapNonEmpty!51243) (not b!1274632) (not bm!62659))
(check-sat b_and!45767 (not b_next!27709))
