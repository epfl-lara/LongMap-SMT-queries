; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107894 () Bool)

(assert start!107894)

(declare-fun b!1275376 () Bool)

(declare-fun b_free!27763 () Bool)

(declare-fun b_next!27763 () Bool)

(assert (=> b!1275376 (= b_free!27763 (not b_next!27763))))

(declare-fun tp!97855 () Bool)

(declare-fun b_and!45821 () Bool)

(assert (=> b!1275376 (= tp!97855 b_and!45821)))

(declare-fun b!1275374 () Bool)

(declare-fun e!727887 () Bool)

(declare-datatypes ((List!28597 0))(
  ( (Nil!28594) (Cons!28593 (h!29811 (_ BitVec 64)) (t!42122 List!28597)) )
))
(declare-fun noDuplicate!2062 (List!28597) Bool)

(assert (=> b!1275374 (= e!727887 (not (noDuplicate!2062 Nil!28594)))))

(declare-fun mapIsEmpty!51341 () Bool)

(declare-fun mapRes!51341 () Bool)

(assert (=> mapIsEmpty!51341 mapRes!51341))

(declare-fun b!1275375 () Bool)

(declare-fun res!847605 () Bool)

(assert (=> b!1275375 (=> (not res!847605) (not e!727887))))

(declare-datatypes ((V!49371 0))(
  ( (V!49372 (val!16641 Int)) )
))
(declare-datatypes ((ValueCell!15713 0))(
  ( (ValueCellFull!15713 (v!19273 V!49371)) (EmptyCell!15713) )
))
(declare-datatypes ((array!83567 0))(
  ( (array!83568 (arr!40298 (Array (_ BitVec 32) ValueCell!15713)) (size!40847 (_ BitVec 32))) )
))
(declare-datatypes ((array!83569 0))(
  ( (array!83570 (arr!40299 (Array (_ BitVec 32) (_ BitVec 64))) (size!40848 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6190 0))(
  ( (LongMapFixedSize!6191 (defaultEntry!6741 Int) (mask!34604 (_ BitVec 32)) (extraKeys!6420 (_ BitVec 32)) (zeroValue!6526 V!49371) (minValue!6526 V!49371) (_size!3150 (_ BitVec 32)) (_keys!12196 array!83569) (_values!6764 array!83567) (_vacant!3150 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6190)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83569 (_ BitVec 32)) Bool)

(assert (=> b!1275375 (= res!847605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12196 thiss!1551) (mask!34604 thiss!1551)))))

(declare-fun e!727882 () Bool)

(declare-fun e!727883 () Bool)

(declare-fun tp_is_empty!33133 () Bool)

(declare-fun array_inv!30813 (array!83569) Bool)

(declare-fun array_inv!30814 (array!83567) Bool)

(assert (=> b!1275376 (= e!727882 (and tp!97855 tp_is_empty!33133 (array_inv!30813 (_keys!12196 thiss!1551)) (array_inv!30814 (_values!6764 thiss!1551)) e!727883))))

(declare-fun b!1275377 () Bool)

(declare-fun res!847608 () Bool)

(assert (=> b!1275377 (=> (not res!847608) (not e!727887))))

(assert (=> b!1275377 (= res!847608 (and (bvsle #b00000000000000000000000000000000 (size!40848 (_keys!12196 thiss!1551))) (bvslt (size!40848 (_keys!12196 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun b!1275378 () Bool)

(declare-fun e!727885 () Bool)

(assert (=> b!1275378 (= e!727885 tp_is_empty!33133)))

(declare-fun b!1275379 () Bool)

(declare-fun e!727884 () Bool)

(assert (=> b!1275379 (= e!727883 (and e!727884 mapRes!51341))))

(declare-fun condMapEmpty!51341 () Bool)

(declare-fun mapDefault!51341 () ValueCell!15713)

(assert (=> b!1275379 (= condMapEmpty!51341 (= (arr!40298 (_values!6764 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15713)) mapDefault!51341)))))

(declare-fun b!1275380 () Bool)

(assert (=> b!1275380 (= e!727884 tp_is_empty!33133)))

(declare-fun b!1275381 () Bool)

(declare-fun res!847607 () Bool)

(assert (=> b!1275381 (=> (not res!847607) (not e!727887))))

(declare-fun arrayCountValidKeys!0 (array!83569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1275381 (= res!847607 (= (arrayCountValidKeys!0 (_keys!12196 thiss!1551) #b00000000000000000000000000000000 (size!40848 (_keys!12196 thiss!1551))) (_size!3150 thiss!1551)))))

(declare-fun mapNonEmpty!51341 () Bool)

(declare-fun tp!97856 () Bool)

(assert (=> mapNonEmpty!51341 (= mapRes!51341 (and tp!97856 e!727885))))

(declare-fun mapKey!51341 () (_ BitVec 32))

(declare-fun mapRest!51341 () (Array (_ BitVec 32) ValueCell!15713))

(declare-fun mapValue!51341 () ValueCell!15713)

(assert (=> mapNonEmpty!51341 (= (arr!40298 (_values!6764 thiss!1551)) (store mapRest!51341 mapKey!51341 mapValue!51341))))

(declare-fun res!847606 () Bool)

(assert (=> start!107894 (=> (not res!847606) (not e!727887))))

(declare-fun simpleValid!482 (LongMapFixedSize!6190) Bool)

(assert (=> start!107894 (= res!847606 (simpleValid!482 thiss!1551))))

(assert (=> start!107894 e!727887))

(assert (=> start!107894 e!727882))

(assert (= (and start!107894 res!847606) b!1275381))

(assert (= (and b!1275381 res!847607) b!1275375))

(assert (= (and b!1275375 res!847605) b!1275377))

(assert (= (and b!1275377 res!847608) b!1275374))

(assert (= (and b!1275379 condMapEmpty!51341) mapIsEmpty!51341))

(assert (= (and b!1275379 (not condMapEmpty!51341)) mapNonEmpty!51341))

(get-info :version)

(assert (= (and mapNonEmpty!51341 ((_ is ValueCellFull!15713) mapValue!51341)) b!1275378))

(assert (= (and b!1275379 ((_ is ValueCellFull!15713) mapDefault!51341)) b!1275380))

(assert (= b!1275376 b!1275379))

(assert (= start!107894 b!1275376))

(declare-fun m!1172581 () Bool)

(assert (=> b!1275381 m!1172581))

(declare-fun m!1172583 () Bool)

(assert (=> b!1275376 m!1172583))

(declare-fun m!1172585 () Bool)

(assert (=> b!1275376 m!1172585))

(declare-fun m!1172587 () Bool)

(assert (=> start!107894 m!1172587))

(declare-fun m!1172589 () Bool)

(assert (=> mapNonEmpty!51341 m!1172589))

(declare-fun m!1172591 () Bool)

(assert (=> b!1275374 m!1172591))

(declare-fun m!1172593 () Bool)

(assert (=> b!1275375 m!1172593))

(check-sat tp_is_empty!33133 (not b!1275381) (not b!1275375) (not start!107894) (not b!1275374) (not mapNonEmpty!51341) (not b_next!27763) (not b!1275376) b_and!45821)
(check-sat b_and!45821 (not b_next!27763))
(get-model)

(declare-fun b!1275440 () Bool)

(declare-fun res!847641 () Bool)

(declare-fun e!727926 () Bool)

(assert (=> b!1275440 (=> (not res!847641) (not e!727926))))

(declare-fun size!40853 (LongMapFixedSize!6190) (_ BitVec 32))

(assert (=> b!1275440 (= res!847641 (= (size!40853 thiss!1551) (bvadd (_size!3150 thiss!1551) (bvsdiv (bvadd (extraKeys!6420 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1275441 () Bool)

(assert (=> b!1275441 (= e!727926 (and (bvsge (extraKeys!6420 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6420 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3150 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1275438 () Bool)

(declare-fun res!847644 () Bool)

(assert (=> b!1275438 (=> (not res!847644) (not e!727926))))

(assert (=> b!1275438 (= res!847644 (and (= (size!40847 (_values!6764 thiss!1551)) (bvadd (mask!34604 thiss!1551) #b00000000000000000000000000000001)) (= (size!40848 (_keys!12196 thiss!1551)) (size!40847 (_values!6764 thiss!1551))) (bvsge (_size!3150 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3150 thiss!1551) (bvadd (mask!34604 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1275439 () Bool)

(declare-fun res!847642 () Bool)

(assert (=> b!1275439 (=> (not res!847642) (not e!727926))))

(assert (=> b!1275439 (= res!847642 (bvsge (size!40853 thiss!1551) (_size!3150 thiss!1551)))))

(declare-fun d!140531 () Bool)

(declare-fun res!847643 () Bool)

(assert (=> d!140531 (=> (not res!847643) (not e!727926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!140531 (= res!847643 (validMask!0 (mask!34604 thiss!1551)))))

(assert (=> d!140531 (= (simpleValid!482 thiss!1551) e!727926)))

(assert (= (and d!140531 res!847643) b!1275438))

(assert (= (and b!1275438 res!847644) b!1275439))

(assert (= (and b!1275439 res!847642) b!1275440))

(assert (= (and b!1275440 res!847641) b!1275441))

(declare-fun m!1172623 () Bool)

(assert (=> b!1275440 m!1172623))

(assert (=> b!1275439 m!1172623))

(declare-fun m!1172625 () Bool)

(assert (=> d!140531 m!1172625))

(assert (=> start!107894 d!140531))

(declare-fun d!140533 () Bool)

(assert (=> d!140533 (= (array_inv!30813 (_keys!12196 thiss!1551)) (bvsge (size!40848 (_keys!12196 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275376 d!140533))

(declare-fun d!140535 () Bool)

(assert (=> d!140535 (= (array_inv!30814 (_values!6764 thiss!1551)) (bvsge (size!40847 (_values!6764 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275376 d!140535))

(declare-fun d!140537 () Bool)

(declare-fun lt!575676 () (_ BitVec 32))

(assert (=> d!140537 (and (bvsge lt!575676 #b00000000000000000000000000000000) (bvsle lt!575676 (bvsub (size!40848 (_keys!12196 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun e!727931 () (_ BitVec 32))

(assert (=> d!140537 (= lt!575676 e!727931)))

(declare-fun c!124213 () Bool)

(assert (=> d!140537 (= c!124213 (bvsge #b00000000000000000000000000000000 (size!40848 (_keys!12196 thiss!1551))))))

(assert (=> d!140537 (and (bvsle #b00000000000000000000000000000000 (size!40848 (_keys!12196 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40848 (_keys!12196 thiss!1551)) (size!40848 (_keys!12196 thiss!1551))))))

(assert (=> d!140537 (= (arrayCountValidKeys!0 (_keys!12196 thiss!1551) #b00000000000000000000000000000000 (size!40848 (_keys!12196 thiss!1551))) lt!575676)))

(declare-fun bm!62685 () Bool)

(declare-fun call!62688 () (_ BitVec 32))

(assert (=> bm!62685 (= call!62688 (arrayCountValidKeys!0 (_keys!12196 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40848 (_keys!12196 thiss!1551))))))

(declare-fun b!1275450 () Bool)

(assert (=> b!1275450 (= e!727931 #b00000000000000000000000000000000)))

(declare-fun b!1275451 () Bool)

(declare-fun e!727932 () (_ BitVec 32))

(assert (=> b!1275451 (= e!727931 e!727932)))

(declare-fun c!124212 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275451 (= c!124212 (validKeyInArray!0 (select (arr!40299 (_keys!12196 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1275452 () Bool)

(assert (=> b!1275452 (= e!727932 call!62688)))

(declare-fun b!1275453 () Bool)

(assert (=> b!1275453 (= e!727932 (bvadd #b00000000000000000000000000000001 call!62688))))

(assert (= (and d!140537 c!124213) b!1275450))

(assert (= (and d!140537 (not c!124213)) b!1275451))

(assert (= (and b!1275451 c!124212) b!1275453))

(assert (= (and b!1275451 (not c!124212)) b!1275452))

(assert (= (or b!1275453 b!1275452) bm!62685))

(declare-fun m!1172627 () Bool)

(assert (=> bm!62685 m!1172627))

(declare-fun m!1172629 () Bool)

(assert (=> b!1275451 m!1172629))

(assert (=> b!1275451 m!1172629))

(declare-fun m!1172631 () Bool)

(assert (=> b!1275451 m!1172631))

(assert (=> b!1275381 d!140537))

(declare-fun b!1275462 () Bool)

(declare-fun e!727939 () Bool)

(declare-fun call!62691 () Bool)

(assert (=> b!1275462 (= e!727939 call!62691)))

(declare-fun b!1275463 () Bool)

(declare-fun e!727940 () Bool)

(assert (=> b!1275463 (= e!727940 e!727939)))

(declare-fun lt!575684 () (_ BitVec 64))

(assert (=> b!1275463 (= lt!575684 (select (arr!40299 (_keys!12196 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42309 0))(
  ( (Unit!42310) )
))
(declare-fun lt!575683 () Unit!42309)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83569 (_ BitVec 64) (_ BitVec 32)) Unit!42309)

(assert (=> b!1275463 (= lt!575683 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12196 thiss!1551) lt!575684 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275463 (arrayContainsKey!0 (_keys!12196 thiss!1551) lt!575684 #b00000000000000000000000000000000)))

(declare-fun lt!575685 () Unit!42309)

(assert (=> b!1275463 (= lt!575685 lt!575683)))

(declare-fun res!847650 () Bool)

(declare-datatypes ((SeekEntryResult!9955 0))(
  ( (MissingZero!9955 (index!42191 (_ BitVec 32))) (Found!9955 (index!42192 (_ BitVec 32))) (Intermediate!9955 (undefined!10767 Bool) (index!42193 (_ BitVec 32)) (x!112698 (_ BitVec 32))) (Undefined!9955) (MissingVacant!9955 (index!42194 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83569 (_ BitVec 32)) SeekEntryResult!9955)

(assert (=> b!1275463 (= res!847650 (= (seekEntryOrOpen!0 (select (arr!40299 (_keys!12196 thiss!1551)) #b00000000000000000000000000000000) (_keys!12196 thiss!1551) (mask!34604 thiss!1551)) (Found!9955 #b00000000000000000000000000000000)))))

(assert (=> b!1275463 (=> (not res!847650) (not e!727939))))

(declare-fun b!1275464 () Bool)

(assert (=> b!1275464 (= e!727940 call!62691)))

(declare-fun d!140539 () Bool)

(declare-fun res!847649 () Bool)

(declare-fun e!727941 () Bool)

(assert (=> d!140539 (=> res!847649 e!727941)))

(assert (=> d!140539 (= res!847649 (bvsge #b00000000000000000000000000000000 (size!40848 (_keys!12196 thiss!1551))))))

(assert (=> d!140539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12196 thiss!1551) (mask!34604 thiss!1551)) e!727941)))

(declare-fun b!1275465 () Bool)

(assert (=> b!1275465 (= e!727941 e!727940)))

(declare-fun c!124216 () Bool)

(assert (=> b!1275465 (= c!124216 (validKeyInArray!0 (select (arr!40299 (_keys!12196 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun bm!62688 () Bool)

(assert (=> bm!62688 (= call!62691 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12196 thiss!1551) (mask!34604 thiss!1551)))))

(assert (= (and d!140539 (not res!847649)) b!1275465))

(assert (= (and b!1275465 c!124216) b!1275463))

(assert (= (and b!1275465 (not c!124216)) b!1275464))

(assert (= (and b!1275463 res!847650) b!1275462))

(assert (= (or b!1275462 b!1275464) bm!62688))

(assert (=> b!1275463 m!1172629))

(declare-fun m!1172633 () Bool)

(assert (=> b!1275463 m!1172633))

(declare-fun m!1172635 () Bool)

(assert (=> b!1275463 m!1172635))

(assert (=> b!1275463 m!1172629))

(declare-fun m!1172637 () Bool)

(assert (=> b!1275463 m!1172637))

(assert (=> b!1275465 m!1172629))

(assert (=> b!1275465 m!1172629))

(assert (=> b!1275465 m!1172631))

(declare-fun m!1172639 () Bool)

(assert (=> bm!62688 m!1172639))

(assert (=> b!1275375 d!140539))

(declare-fun d!140541 () Bool)

(declare-fun res!847655 () Bool)

(declare-fun e!727946 () Bool)

(assert (=> d!140541 (=> res!847655 e!727946)))

(assert (=> d!140541 (= res!847655 ((_ is Nil!28594) Nil!28594))))

(assert (=> d!140541 (= (noDuplicate!2062 Nil!28594) e!727946)))

(declare-fun b!1275470 () Bool)

(declare-fun e!727947 () Bool)

(assert (=> b!1275470 (= e!727946 e!727947)))

(declare-fun res!847656 () Bool)

(assert (=> b!1275470 (=> (not res!847656) (not e!727947))))

(declare-fun contains!7699 (List!28597 (_ BitVec 64)) Bool)

(assert (=> b!1275470 (= res!847656 (not (contains!7699 (t!42122 Nil!28594) (h!29811 Nil!28594))))))

(declare-fun b!1275471 () Bool)

(assert (=> b!1275471 (= e!727947 (noDuplicate!2062 (t!42122 Nil!28594)))))

(assert (= (and d!140541 (not res!847655)) b!1275470))

(assert (= (and b!1275470 res!847656) b!1275471))

(declare-fun m!1172641 () Bool)

(assert (=> b!1275470 m!1172641))

(declare-fun m!1172643 () Bool)

(assert (=> b!1275471 m!1172643))

(assert (=> b!1275374 d!140541))

(declare-fun b!1275479 () Bool)

(declare-fun e!727953 () Bool)

(assert (=> b!1275479 (= e!727953 tp_is_empty!33133)))

(declare-fun mapIsEmpty!51350 () Bool)

(declare-fun mapRes!51350 () Bool)

(assert (=> mapIsEmpty!51350 mapRes!51350))

(declare-fun mapNonEmpty!51350 () Bool)

(declare-fun tp!97871 () Bool)

(declare-fun e!727952 () Bool)

(assert (=> mapNonEmpty!51350 (= mapRes!51350 (and tp!97871 e!727952))))

(declare-fun mapValue!51350 () ValueCell!15713)

(declare-fun mapKey!51350 () (_ BitVec 32))

(declare-fun mapRest!51350 () (Array (_ BitVec 32) ValueCell!15713))

(assert (=> mapNonEmpty!51350 (= mapRest!51341 (store mapRest!51350 mapKey!51350 mapValue!51350))))

(declare-fun b!1275478 () Bool)

(assert (=> b!1275478 (= e!727952 tp_is_empty!33133)))

(declare-fun condMapEmpty!51350 () Bool)

(declare-fun mapDefault!51350 () ValueCell!15713)

(assert (=> mapNonEmpty!51341 (= condMapEmpty!51350 (= mapRest!51341 ((as const (Array (_ BitVec 32) ValueCell!15713)) mapDefault!51350)))))

(assert (=> mapNonEmpty!51341 (= tp!97856 (and e!727953 mapRes!51350))))

(assert (= (and mapNonEmpty!51341 condMapEmpty!51350) mapIsEmpty!51350))

(assert (= (and mapNonEmpty!51341 (not condMapEmpty!51350)) mapNonEmpty!51350))

(assert (= (and mapNonEmpty!51350 ((_ is ValueCellFull!15713) mapValue!51350)) b!1275478))

(assert (= (and mapNonEmpty!51341 ((_ is ValueCellFull!15713) mapDefault!51350)) b!1275479))

(declare-fun m!1172645 () Bool)

(assert (=> mapNonEmpty!51350 m!1172645))

(check-sat tp_is_empty!33133 b_and!45821 (not b!1275451) (not b!1275471) (not b!1275440) (not d!140531) (not bm!62688) (not b!1275465) (not b!1275470) (not b_next!27763) (not b!1275439) (not bm!62685) (not mapNonEmpty!51350) (not b!1275463))
(check-sat b_and!45821 (not b_next!27763))
