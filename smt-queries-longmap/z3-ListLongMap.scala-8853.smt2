; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107370 () Bool)

(assert start!107370)

(declare-fun b!1272365 () Bool)

(declare-fun b_free!27663 () Bool)

(declare-fun b_next!27663 () Bool)

(assert (=> b!1272365 (= b_free!27663 (not b_next!27663))))

(declare-fun tp!97501 () Bool)

(declare-fun b_and!45719 () Bool)

(assert (=> b!1272365 (= tp!97501 b_and!45719)))

(declare-fun mapIsEmpty!51136 () Bool)

(declare-fun mapRes!51136 () Bool)

(assert (=> mapIsEmpty!51136 mapRes!51136))

(declare-fun mapNonEmpty!51136 () Bool)

(declare-fun tp!97500 () Bool)

(declare-fun e!725709 () Bool)

(assert (=> mapNonEmpty!51136 (= mapRes!51136 (and tp!97500 e!725709))))

(declare-datatypes ((V!49237 0))(
  ( (V!49238 (val!16591 Int)) )
))
(declare-datatypes ((ValueCell!15663 0))(
  ( (ValueCellFull!15663 (v!19228 V!49237)) (EmptyCell!15663) )
))
(declare-fun mapValue!51136 () ValueCell!15663)

(declare-datatypes ((array!83318 0))(
  ( (array!83319 (arr!40194 (Array (_ BitVec 32) ValueCell!15663)) (size!40730 (_ BitVec 32))) )
))
(declare-datatypes ((array!83320 0))(
  ( (array!83321 (arr!40195 (Array (_ BitVec 32) (_ BitVec 64))) (size!40731 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6090 0))(
  ( (LongMapFixedSize!6091 (defaultEntry!6691 Int) (mask!34435 (_ BitVec 32)) (extraKeys!6370 (_ BitVec 32)) (zeroValue!6476 V!49237) (minValue!6476 V!49237) (_size!3100 (_ BitVec 32)) (_keys!12097 array!83320) (_values!6714 array!83318) (_vacant!3100 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6090)

(declare-fun mapRest!51136 () (Array (_ BitVec 32) ValueCell!15663))

(declare-fun mapKey!51136 () (_ BitVec 32))

(assert (=> mapNonEmpty!51136 (= (arr!40194 (_values!6714 thiss!1559)) (store mapRest!51136 mapKey!51136 mapValue!51136))))

(declare-fun b!1272362 () Bool)

(declare-fun e!725713 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272362 (= e!725713 (not (validMask!0 (mask!34435 thiss!1559))))))

(declare-fun res!846366 () Bool)

(assert (=> start!107370 (=> (not res!846366) (not e!725713))))

(declare-fun valid!2286 (LongMapFixedSize!6090) Bool)

(assert (=> start!107370 (= res!846366 (valid!2286 thiss!1559))))

(assert (=> start!107370 e!725713))

(declare-fun e!725708 () Bool)

(assert (=> start!107370 e!725708))

(declare-fun b!1272363 () Bool)

(declare-fun e!725711 () Bool)

(declare-fun e!725710 () Bool)

(assert (=> b!1272363 (= e!725711 (and e!725710 mapRes!51136))))

(declare-fun condMapEmpty!51136 () Bool)

(declare-fun mapDefault!51136 () ValueCell!15663)

(assert (=> b!1272363 (= condMapEmpty!51136 (= (arr!40194 (_values!6714 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15663)) mapDefault!51136)))))

(declare-fun b!1272364 () Bool)

(declare-fun tp_is_empty!33033 () Bool)

(assert (=> b!1272364 (= e!725709 tp_is_empty!33033)))

(declare-fun array_inv!30575 (array!83320) Bool)

(declare-fun array_inv!30576 (array!83318) Bool)

(assert (=> b!1272365 (= e!725708 (and tp!97501 tp_is_empty!33033 (array_inv!30575 (_keys!12097 thiss!1559)) (array_inv!30576 (_values!6714 thiss!1559)) e!725711))))

(declare-fun b!1272366 () Bool)

(assert (=> b!1272366 (= e!725710 tp_is_empty!33033)))

(assert (= (and start!107370 res!846366) b!1272362))

(assert (= (and b!1272363 condMapEmpty!51136) mapIsEmpty!51136))

(assert (= (and b!1272363 (not condMapEmpty!51136)) mapNonEmpty!51136))

(get-info :version)

(assert (= (and mapNonEmpty!51136 ((_ is ValueCellFull!15663) mapValue!51136)) b!1272364))

(assert (= (and b!1272363 ((_ is ValueCellFull!15663) mapDefault!51136)) b!1272366))

(assert (= b!1272365 b!1272363))

(assert (= start!107370 b!1272365))

(declare-fun m!1170069 () Bool)

(assert (=> mapNonEmpty!51136 m!1170069))

(declare-fun m!1170071 () Bool)

(assert (=> b!1272362 m!1170071))

(declare-fun m!1170073 () Bool)

(assert (=> start!107370 m!1170073))

(declare-fun m!1170075 () Bool)

(assert (=> b!1272365 m!1170075))

(declare-fun m!1170077 () Bool)

(assert (=> b!1272365 m!1170077))

(check-sat (not b_next!27663) b_and!45719 tp_is_empty!33033 (not b!1272362) (not start!107370) (not b!1272365) (not mapNonEmpty!51136))
(check-sat b_and!45719 (not b_next!27663))
(get-model)

(declare-fun d!139845 () Bool)

(declare-fun res!846376 () Bool)

(declare-fun e!725734 () Bool)

(assert (=> d!139845 (=> (not res!846376) (not e!725734))))

(declare-fun simpleValid!455 (LongMapFixedSize!6090) Bool)

(assert (=> d!139845 (= res!846376 (simpleValid!455 thiss!1559))))

(assert (=> d!139845 (= (valid!2286 thiss!1559) e!725734)))

(declare-fun b!1272388 () Bool)

(declare-fun res!846377 () Bool)

(assert (=> b!1272388 (=> (not res!846377) (not e!725734))))

(declare-fun arrayCountValidKeys!0 (array!83320 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272388 (= res!846377 (= (arrayCountValidKeys!0 (_keys!12097 thiss!1559) #b00000000000000000000000000000000 (size!40731 (_keys!12097 thiss!1559))) (_size!3100 thiss!1559)))))

(declare-fun b!1272389 () Bool)

(declare-fun res!846378 () Bool)

(assert (=> b!1272389 (=> (not res!846378) (not e!725734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83320 (_ BitVec 32)) Bool)

(assert (=> b!1272389 (= res!846378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12097 thiss!1559) (mask!34435 thiss!1559)))))

(declare-fun b!1272390 () Bool)

(declare-datatypes ((List!28558 0))(
  ( (Nil!28555) (Cons!28554 (h!29763 (_ BitVec 64)) (t!42091 List!28558)) )
))
(declare-fun arrayNoDuplicates!0 (array!83320 (_ BitVec 32) List!28558) Bool)

(assert (=> b!1272390 (= e!725734 (arrayNoDuplicates!0 (_keys!12097 thiss!1559) #b00000000000000000000000000000000 Nil!28555))))

(assert (= (and d!139845 res!846376) b!1272388))

(assert (= (and b!1272388 res!846377) b!1272389))

(assert (= (and b!1272389 res!846378) b!1272390))

(declare-fun m!1170089 () Bool)

(assert (=> d!139845 m!1170089))

(declare-fun m!1170091 () Bool)

(assert (=> b!1272388 m!1170091))

(declare-fun m!1170093 () Bool)

(assert (=> b!1272389 m!1170093))

(declare-fun m!1170095 () Bool)

(assert (=> b!1272390 m!1170095))

(assert (=> start!107370 d!139845))

(declare-fun d!139847 () Bool)

(assert (=> d!139847 (= (validMask!0 (mask!34435 thiss!1559)) (and (or (= (mask!34435 thiss!1559) #b00000000000000000000000000000111) (= (mask!34435 thiss!1559) #b00000000000000000000000000001111) (= (mask!34435 thiss!1559) #b00000000000000000000000000011111) (= (mask!34435 thiss!1559) #b00000000000000000000000000111111) (= (mask!34435 thiss!1559) #b00000000000000000000000001111111) (= (mask!34435 thiss!1559) #b00000000000000000000000011111111) (= (mask!34435 thiss!1559) #b00000000000000000000000111111111) (= (mask!34435 thiss!1559) #b00000000000000000000001111111111) (= (mask!34435 thiss!1559) #b00000000000000000000011111111111) (= (mask!34435 thiss!1559) #b00000000000000000000111111111111) (= (mask!34435 thiss!1559) #b00000000000000000001111111111111) (= (mask!34435 thiss!1559) #b00000000000000000011111111111111) (= (mask!34435 thiss!1559) #b00000000000000000111111111111111) (= (mask!34435 thiss!1559) #b00000000000000001111111111111111) (= (mask!34435 thiss!1559) #b00000000000000011111111111111111) (= (mask!34435 thiss!1559) #b00000000000000111111111111111111) (= (mask!34435 thiss!1559) #b00000000000001111111111111111111) (= (mask!34435 thiss!1559) #b00000000000011111111111111111111) (= (mask!34435 thiss!1559) #b00000000000111111111111111111111) (= (mask!34435 thiss!1559) #b00000000001111111111111111111111) (= (mask!34435 thiss!1559) #b00000000011111111111111111111111) (= (mask!34435 thiss!1559) #b00000000111111111111111111111111) (= (mask!34435 thiss!1559) #b00000001111111111111111111111111) (= (mask!34435 thiss!1559) #b00000011111111111111111111111111) (= (mask!34435 thiss!1559) #b00000111111111111111111111111111) (= (mask!34435 thiss!1559) #b00001111111111111111111111111111) (= (mask!34435 thiss!1559) #b00011111111111111111111111111111) (= (mask!34435 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34435 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272362 d!139847))

(declare-fun d!139849 () Bool)

(assert (=> d!139849 (= (array_inv!30575 (_keys!12097 thiss!1559)) (bvsge (size!40731 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272365 d!139849))

(declare-fun d!139851 () Bool)

(assert (=> d!139851 (= (array_inv!30576 (_values!6714 thiss!1559)) (bvsge (size!40730 (_values!6714 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272365 d!139851))

(declare-fun mapNonEmpty!51142 () Bool)

(declare-fun mapRes!51142 () Bool)

(declare-fun tp!97510 () Bool)

(declare-fun e!725740 () Bool)

(assert (=> mapNonEmpty!51142 (= mapRes!51142 (and tp!97510 e!725740))))

(declare-fun mapRest!51142 () (Array (_ BitVec 32) ValueCell!15663))

(declare-fun mapValue!51142 () ValueCell!15663)

(declare-fun mapKey!51142 () (_ BitVec 32))

(assert (=> mapNonEmpty!51142 (= mapRest!51136 (store mapRest!51142 mapKey!51142 mapValue!51142))))

(declare-fun b!1272398 () Bool)

(declare-fun e!725739 () Bool)

(assert (=> b!1272398 (= e!725739 tp_is_empty!33033)))

(declare-fun mapIsEmpty!51142 () Bool)

(assert (=> mapIsEmpty!51142 mapRes!51142))

(declare-fun b!1272397 () Bool)

(assert (=> b!1272397 (= e!725740 tp_is_empty!33033)))

(declare-fun condMapEmpty!51142 () Bool)

(declare-fun mapDefault!51142 () ValueCell!15663)

(assert (=> mapNonEmpty!51136 (= condMapEmpty!51142 (= mapRest!51136 ((as const (Array (_ BitVec 32) ValueCell!15663)) mapDefault!51142)))))

(assert (=> mapNonEmpty!51136 (= tp!97500 (and e!725739 mapRes!51142))))

(assert (= (and mapNonEmpty!51136 condMapEmpty!51142) mapIsEmpty!51142))

(assert (= (and mapNonEmpty!51136 (not condMapEmpty!51142)) mapNonEmpty!51142))

(assert (= (and mapNonEmpty!51142 ((_ is ValueCellFull!15663) mapValue!51142)) b!1272397))

(assert (= (and mapNonEmpty!51136 ((_ is ValueCellFull!15663) mapDefault!51142)) b!1272398))

(declare-fun m!1170097 () Bool)

(assert (=> mapNonEmpty!51142 m!1170097))

(check-sat (not b!1272390) (not b_next!27663) (not d!139845) (not b!1272388) b_and!45719 tp_is_empty!33033 (not b!1272389) (not mapNonEmpty!51142))
(check-sat b_and!45719 (not b_next!27663))
(get-model)

(declare-fun b!1272409 () Bool)

(declare-fun e!725750 () Bool)

(declare-fun call!62540 () Bool)

(assert (=> b!1272409 (= e!725750 call!62540)))

(declare-fun b!1272410 () Bool)

(assert (=> b!1272410 (= e!725750 call!62540)))

(declare-fun d!139853 () Bool)

(declare-fun res!846387 () Bool)

(declare-fun e!725749 () Bool)

(assert (=> d!139853 (=> res!846387 e!725749)))

(assert (=> d!139853 (= res!846387 (bvsge #b00000000000000000000000000000000 (size!40731 (_keys!12097 thiss!1559))))))

(assert (=> d!139853 (= (arrayNoDuplicates!0 (_keys!12097 thiss!1559) #b00000000000000000000000000000000 Nil!28555) e!725749)))

(declare-fun b!1272411 () Bool)

(declare-fun e!725751 () Bool)

(assert (=> b!1272411 (= e!725751 e!725750)))

(declare-fun c!123687 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272411 (= c!123687 (validKeyInArray!0 (select (arr!40195 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62537 () Bool)

(assert (=> bm!62537 (= call!62540 (arrayNoDuplicates!0 (_keys!12097 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123687 (Cons!28554 (select (arr!40195 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000) Nil!28555) Nil!28555)))))

(declare-fun b!1272412 () Bool)

(assert (=> b!1272412 (= e!725749 e!725751)))

(declare-fun res!846385 () Bool)

(assert (=> b!1272412 (=> (not res!846385) (not e!725751))))

(declare-fun e!725752 () Bool)

(assert (=> b!1272412 (= res!846385 (not e!725752))))

(declare-fun res!846386 () Bool)

(assert (=> b!1272412 (=> (not res!846386) (not e!725752))))

(assert (=> b!1272412 (= res!846386 (validKeyInArray!0 (select (arr!40195 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272413 () Bool)

(declare-fun contains!7668 (List!28558 (_ BitVec 64)) Bool)

(assert (=> b!1272413 (= e!725752 (contains!7668 Nil!28555 (select (arr!40195 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139853 (not res!846387)) b!1272412))

(assert (= (and b!1272412 res!846386) b!1272413))

(assert (= (and b!1272412 res!846385) b!1272411))

(assert (= (and b!1272411 c!123687) b!1272410))

(assert (= (and b!1272411 (not c!123687)) b!1272409))

(assert (= (or b!1272410 b!1272409) bm!62537))

(declare-fun m!1170099 () Bool)

(assert (=> b!1272411 m!1170099))

(assert (=> b!1272411 m!1170099))

(declare-fun m!1170101 () Bool)

(assert (=> b!1272411 m!1170101))

(assert (=> bm!62537 m!1170099))

(declare-fun m!1170103 () Bool)

(assert (=> bm!62537 m!1170103))

(assert (=> b!1272412 m!1170099))

(assert (=> b!1272412 m!1170099))

(assert (=> b!1272412 m!1170101))

(assert (=> b!1272413 m!1170099))

(assert (=> b!1272413 m!1170099))

(declare-fun m!1170105 () Bool)

(assert (=> b!1272413 m!1170105))

(assert (=> b!1272390 d!139853))

(declare-fun b!1272422 () Bool)

(declare-fun e!725758 () (_ BitVec 32))

(declare-fun e!725757 () (_ BitVec 32))

(assert (=> b!1272422 (= e!725758 e!725757)))

(declare-fun c!123692 () Bool)

(assert (=> b!1272422 (= c!123692 (validKeyInArray!0 (select (arr!40195 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272423 () Bool)

(declare-fun call!62543 () (_ BitVec 32))

(assert (=> b!1272423 (= e!725757 (bvadd #b00000000000000000000000000000001 call!62543))))

(declare-fun b!1272424 () Bool)

(assert (=> b!1272424 (= e!725758 #b00000000000000000000000000000000)))

(declare-fun b!1272425 () Bool)

(assert (=> b!1272425 (= e!725757 call!62543)))

(declare-fun d!139855 () Bool)

(declare-fun lt!575047 () (_ BitVec 32))

(assert (=> d!139855 (and (bvsge lt!575047 #b00000000000000000000000000000000) (bvsle lt!575047 (bvsub (size!40731 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139855 (= lt!575047 e!725758)))

(declare-fun c!123693 () Bool)

(assert (=> d!139855 (= c!123693 (bvsge #b00000000000000000000000000000000 (size!40731 (_keys!12097 thiss!1559))))))

(assert (=> d!139855 (and (bvsle #b00000000000000000000000000000000 (size!40731 (_keys!12097 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40731 (_keys!12097 thiss!1559)) (size!40731 (_keys!12097 thiss!1559))))))

(assert (=> d!139855 (= (arrayCountValidKeys!0 (_keys!12097 thiss!1559) #b00000000000000000000000000000000 (size!40731 (_keys!12097 thiss!1559))) lt!575047)))

(declare-fun bm!62540 () Bool)

(assert (=> bm!62540 (= call!62543 (arrayCountValidKeys!0 (_keys!12097 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40731 (_keys!12097 thiss!1559))))))

(assert (= (and d!139855 c!123693) b!1272424))

(assert (= (and d!139855 (not c!123693)) b!1272422))

(assert (= (and b!1272422 c!123692) b!1272423))

(assert (= (and b!1272422 (not c!123692)) b!1272425))

(assert (= (or b!1272423 b!1272425) bm!62540))

(assert (=> b!1272422 m!1170099))

(assert (=> b!1272422 m!1170099))

(assert (=> b!1272422 m!1170101))

(declare-fun m!1170107 () Bool)

(assert (=> bm!62540 m!1170107))

(assert (=> b!1272388 d!139855))

(declare-fun d!139857 () Bool)

(declare-fun res!846392 () Bool)

(declare-fun e!725766 () Bool)

(assert (=> d!139857 (=> res!846392 e!725766)))

(assert (=> d!139857 (= res!846392 (bvsge #b00000000000000000000000000000000 (size!40731 (_keys!12097 thiss!1559))))))

(assert (=> d!139857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12097 thiss!1559) (mask!34435 thiss!1559)) e!725766)))

(declare-fun b!1272434 () Bool)

(declare-fun e!725765 () Bool)

(declare-fun call!62546 () Bool)

(assert (=> b!1272434 (= e!725765 call!62546)))

(declare-fun b!1272435 () Bool)

(declare-fun e!725767 () Bool)

(assert (=> b!1272435 (= e!725765 e!725767)))

(declare-fun lt!575055 () (_ BitVec 64))

(assert (=> b!1272435 (= lt!575055 (select (arr!40195 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42318 0))(
  ( (Unit!42319) )
))
(declare-fun lt!575054 () Unit!42318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83320 (_ BitVec 64) (_ BitVec 32)) Unit!42318)

(assert (=> b!1272435 (= lt!575054 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12097 thiss!1559) lt!575055 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272435 (arrayContainsKey!0 (_keys!12097 thiss!1559) lt!575055 #b00000000000000000000000000000000)))

(declare-fun lt!575056 () Unit!42318)

(assert (=> b!1272435 (= lt!575056 lt!575054)))

(declare-fun res!846393 () Bool)

(declare-datatypes ((SeekEntryResult!9989 0))(
  ( (MissingZero!9989 (index!42327 (_ BitVec 32))) (Found!9989 (index!42328 (_ BitVec 32))) (Intermediate!9989 (undefined!10801 Bool) (index!42329 (_ BitVec 32)) (x!112410 (_ BitVec 32))) (Undefined!9989) (MissingVacant!9989 (index!42330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83320 (_ BitVec 32)) SeekEntryResult!9989)

(assert (=> b!1272435 (= res!846393 (= (seekEntryOrOpen!0 (select (arr!40195 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000) (_keys!12097 thiss!1559) (mask!34435 thiss!1559)) (Found!9989 #b00000000000000000000000000000000)))))

(assert (=> b!1272435 (=> (not res!846393) (not e!725767))))

(declare-fun b!1272436 () Bool)

(assert (=> b!1272436 (= e!725767 call!62546)))

(declare-fun b!1272437 () Bool)

(assert (=> b!1272437 (= e!725766 e!725765)))

(declare-fun c!123696 () Bool)

(assert (=> b!1272437 (= c!123696 (validKeyInArray!0 (select (arr!40195 (_keys!12097 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62543 () Bool)

(assert (=> bm!62543 (= call!62546 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12097 thiss!1559) (mask!34435 thiss!1559)))))

(assert (= (and d!139857 (not res!846392)) b!1272437))

(assert (= (and b!1272437 c!123696) b!1272435))

(assert (= (and b!1272437 (not c!123696)) b!1272434))

(assert (= (and b!1272435 res!846393) b!1272436))

(assert (= (or b!1272436 b!1272434) bm!62543))

(assert (=> b!1272435 m!1170099))

(declare-fun m!1170109 () Bool)

(assert (=> b!1272435 m!1170109))

(declare-fun m!1170111 () Bool)

(assert (=> b!1272435 m!1170111))

(assert (=> b!1272435 m!1170099))

(declare-fun m!1170113 () Bool)

(assert (=> b!1272435 m!1170113))

(assert (=> b!1272437 m!1170099))

(assert (=> b!1272437 m!1170099))

(assert (=> b!1272437 m!1170101))

(declare-fun m!1170115 () Bool)

(assert (=> bm!62543 m!1170115))

(assert (=> b!1272389 d!139857))

(declare-fun b!1272447 () Bool)

(declare-fun res!846404 () Bool)

(declare-fun e!725770 () Bool)

(assert (=> b!1272447 (=> (not res!846404) (not e!725770))))

(declare-fun size!40734 (LongMapFixedSize!6090) (_ BitVec 32))

(assert (=> b!1272447 (= res!846404 (bvsge (size!40734 thiss!1559) (_size!3100 thiss!1559)))))

(declare-fun b!1272448 () Bool)

(declare-fun res!846403 () Bool)

(assert (=> b!1272448 (=> (not res!846403) (not e!725770))))

(assert (=> b!1272448 (= res!846403 (= (size!40734 thiss!1559) (bvadd (_size!3100 thiss!1559) (bvsdiv (bvadd (extraKeys!6370 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1272446 () Bool)

(declare-fun res!846405 () Bool)

(assert (=> b!1272446 (=> (not res!846405) (not e!725770))))

(assert (=> b!1272446 (= res!846405 (and (= (size!40730 (_values!6714 thiss!1559)) (bvadd (mask!34435 thiss!1559) #b00000000000000000000000000000001)) (= (size!40731 (_keys!12097 thiss!1559)) (size!40730 (_values!6714 thiss!1559))) (bvsge (_size!3100 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3100 thiss!1559) (bvadd (mask!34435 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1272449 () Bool)

(assert (=> b!1272449 (= e!725770 (and (bvsge (extraKeys!6370 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6370 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3100 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun d!139859 () Bool)

(declare-fun res!846402 () Bool)

(assert (=> d!139859 (=> (not res!846402) (not e!725770))))

(assert (=> d!139859 (= res!846402 (validMask!0 (mask!34435 thiss!1559)))))

(assert (=> d!139859 (= (simpleValid!455 thiss!1559) e!725770)))

(assert (= (and d!139859 res!846402) b!1272446))

(assert (= (and b!1272446 res!846405) b!1272447))

(assert (= (and b!1272447 res!846404) b!1272448))

(assert (= (and b!1272448 res!846403) b!1272449))

(declare-fun m!1170117 () Bool)

(assert (=> b!1272447 m!1170117))

(assert (=> b!1272448 m!1170117))

(assert (=> d!139859 m!1170071))

(assert (=> d!139845 d!139859))

(declare-fun mapNonEmpty!51143 () Bool)

(declare-fun mapRes!51143 () Bool)

(declare-fun tp!97511 () Bool)

(declare-fun e!725772 () Bool)

(assert (=> mapNonEmpty!51143 (= mapRes!51143 (and tp!97511 e!725772))))

(declare-fun mapValue!51143 () ValueCell!15663)

(declare-fun mapKey!51143 () (_ BitVec 32))

(declare-fun mapRest!51143 () (Array (_ BitVec 32) ValueCell!15663))

(assert (=> mapNonEmpty!51143 (= mapRest!51142 (store mapRest!51143 mapKey!51143 mapValue!51143))))

(declare-fun b!1272451 () Bool)

(declare-fun e!725771 () Bool)

(assert (=> b!1272451 (= e!725771 tp_is_empty!33033)))

(declare-fun mapIsEmpty!51143 () Bool)

(assert (=> mapIsEmpty!51143 mapRes!51143))

(declare-fun b!1272450 () Bool)

(assert (=> b!1272450 (= e!725772 tp_is_empty!33033)))

(declare-fun condMapEmpty!51143 () Bool)

(declare-fun mapDefault!51143 () ValueCell!15663)

(assert (=> mapNonEmpty!51142 (= condMapEmpty!51143 (= mapRest!51142 ((as const (Array (_ BitVec 32) ValueCell!15663)) mapDefault!51143)))))

(assert (=> mapNonEmpty!51142 (= tp!97510 (and e!725771 mapRes!51143))))

(assert (= (and mapNonEmpty!51142 condMapEmpty!51143) mapIsEmpty!51143))

(assert (= (and mapNonEmpty!51142 (not condMapEmpty!51143)) mapNonEmpty!51143))

(assert (= (and mapNonEmpty!51143 ((_ is ValueCellFull!15663) mapValue!51143)) b!1272450))

(assert (= (and mapNonEmpty!51142 ((_ is ValueCellFull!15663) mapDefault!51143)) b!1272451))

(declare-fun m!1170119 () Bool)

(assert (=> mapNonEmpty!51143 m!1170119))

(check-sat (not b_next!27663) (not bm!62540) (not b!1272435) (not bm!62537) (not b!1272413) (not b!1272437) (not d!139859) (not b!1272447) (not bm!62543) (not mapNonEmpty!51143) b_and!45719 (not b!1272412) tp_is_empty!33033 (not b!1272411) (not b!1272422) (not b!1272448))
(check-sat b_and!45719 (not b_next!27663))
