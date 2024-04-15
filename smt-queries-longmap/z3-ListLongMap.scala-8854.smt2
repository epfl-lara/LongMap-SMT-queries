; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107390 () Bool)

(assert start!107390)

(declare-fun b!1272405 () Bool)

(declare-fun b_free!27667 () Bool)

(declare-fun b_next!27667 () Bool)

(assert (=> b!1272405 (= b_free!27667 (not b_next!27667))))

(declare-fun tp!97517 () Bool)

(declare-fun b_and!45705 () Bool)

(assert (=> b!1272405 (= tp!97517 b_and!45705)))

(declare-fun b!1272400 () Bool)

(declare-fun e!725757 () Bool)

(declare-fun tp_is_empty!33037 () Bool)

(assert (=> b!1272400 (= e!725757 tp_is_empty!33037)))

(declare-fun b!1272401 () Bool)

(declare-fun e!725761 () Bool)

(declare-datatypes ((V!49243 0))(
  ( (V!49244 (val!16593 Int)) )
))
(declare-datatypes ((ValueCell!15665 0))(
  ( (ValueCellFull!15665 (v!19229 V!49243)) (EmptyCell!15665) )
))
(declare-datatypes ((array!83227 0))(
  ( (array!83228 (arr!40148 (Array (_ BitVec 32) ValueCell!15665)) (size!40687 (_ BitVec 32))) )
))
(declare-datatypes ((array!83229 0))(
  ( (array!83230 (arr!40149 (Array (_ BitVec 32) (_ BitVec 64))) (size!40688 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6094 0))(
  ( (LongMapFixedSize!6095 (defaultEntry!6693 Int) (mask!34436 (_ BitVec 32)) (extraKeys!6372 (_ BitVec 32)) (zeroValue!6478 V!49243) (minValue!6478 V!49243) (_size!3102 (_ BitVec 32)) (_keys!12096 array!83229) (_values!6716 array!83227) (_vacant!3102 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6094)

(assert (=> b!1272401 (= e!725761 (not (= (size!40687 (_values!6716 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34436 thiss!1559)))))))

(declare-fun b!1272403 () Bool)

(declare-fun e!725756 () Bool)

(declare-fun mapRes!51146 () Bool)

(assert (=> b!1272403 (= e!725756 (and e!725757 mapRes!51146))))

(declare-fun condMapEmpty!51146 () Bool)

(declare-fun mapDefault!51146 () ValueCell!15665)

(assert (=> b!1272403 (= condMapEmpty!51146 (= (arr!40148 (_values!6716 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15665)) mapDefault!51146)))))

(declare-fun b!1272404 () Bool)

(declare-fun res!846383 () Bool)

(assert (=> b!1272404 (=> (not res!846383) (not e!725761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272404 (= res!846383 (validMask!0 (mask!34436 thiss!1559)))))

(declare-fun e!725759 () Bool)

(declare-fun array_inv!30689 (array!83229) Bool)

(declare-fun array_inv!30690 (array!83227) Bool)

(assert (=> b!1272405 (= e!725759 (and tp!97517 tp_is_empty!33037 (array_inv!30689 (_keys!12096 thiss!1559)) (array_inv!30690 (_values!6716 thiss!1559)) e!725756))))

(declare-fun mapNonEmpty!51146 () Bool)

(declare-fun tp!97518 () Bool)

(declare-fun e!725760 () Bool)

(assert (=> mapNonEmpty!51146 (= mapRes!51146 (and tp!97518 e!725760))))

(declare-fun mapValue!51146 () ValueCell!15665)

(declare-fun mapRest!51146 () (Array (_ BitVec 32) ValueCell!15665))

(declare-fun mapKey!51146 () (_ BitVec 32))

(assert (=> mapNonEmpty!51146 (= (arr!40148 (_values!6716 thiss!1559)) (store mapRest!51146 mapKey!51146 mapValue!51146))))

(declare-fun mapIsEmpty!51146 () Bool)

(assert (=> mapIsEmpty!51146 mapRes!51146))

(declare-fun res!846384 () Bool)

(assert (=> start!107390 (=> (not res!846384) (not e!725761))))

(declare-fun valid!2280 (LongMapFixedSize!6094) Bool)

(assert (=> start!107390 (= res!846384 (valid!2280 thiss!1559))))

(assert (=> start!107390 e!725761))

(assert (=> start!107390 e!725759))

(declare-fun b!1272402 () Bool)

(assert (=> b!1272402 (= e!725760 tp_is_empty!33037)))

(assert (= (and start!107390 res!846384) b!1272404))

(assert (= (and b!1272404 res!846383) b!1272401))

(assert (= (and b!1272403 condMapEmpty!51146) mapIsEmpty!51146))

(assert (= (and b!1272403 (not condMapEmpty!51146)) mapNonEmpty!51146))

(get-info :version)

(assert (= (and mapNonEmpty!51146 ((_ is ValueCellFull!15665) mapValue!51146)) b!1272402))

(assert (= (and b!1272403 ((_ is ValueCellFull!15665) mapDefault!51146)) b!1272400))

(assert (= b!1272405 b!1272403))

(assert (= start!107390 b!1272405))

(declare-fun m!1169621 () Bool)

(assert (=> b!1272404 m!1169621))

(declare-fun m!1169623 () Bool)

(assert (=> b!1272405 m!1169623))

(declare-fun m!1169625 () Bool)

(assert (=> b!1272405 m!1169625))

(declare-fun m!1169627 () Bool)

(assert (=> mapNonEmpty!51146 m!1169627))

(declare-fun m!1169629 () Bool)

(assert (=> start!107390 m!1169629))

(check-sat (not mapNonEmpty!51146) (not b!1272405) b_and!45705 tp_is_empty!33037 (not start!107390) (not b_next!27667) (not b!1272404))
(check-sat b_and!45705 (not b_next!27667))
(get-model)

(declare-fun d!139751 () Bool)

(assert (=> d!139751 (= (array_inv!30689 (_keys!12096 thiss!1559)) (bvsge (size!40688 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272405 d!139751))

(declare-fun d!139753 () Bool)

(assert (=> d!139753 (= (array_inv!30690 (_values!6716 thiss!1559)) (bvsge (size!40687 (_values!6716 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272405 d!139753))

(declare-fun d!139755 () Bool)

(assert (=> d!139755 (= (validMask!0 (mask!34436 thiss!1559)) (and (or (= (mask!34436 thiss!1559) #b00000000000000000000000000000111) (= (mask!34436 thiss!1559) #b00000000000000000000000000001111) (= (mask!34436 thiss!1559) #b00000000000000000000000000011111) (= (mask!34436 thiss!1559) #b00000000000000000000000000111111) (= (mask!34436 thiss!1559) #b00000000000000000000000001111111) (= (mask!34436 thiss!1559) #b00000000000000000000000011111111) (= (mask!34436 thiss!1559) #b00000000000000000000000111111111) (= (mask!34436 thiss!1559) #b00000000000000000000001111111111) (= (mask!34436 thiss!1559) #b00000000000000000000011111111111) (= (mask!34436 thiss!1559) #b00000000000000000000111111111111) (= (mask!34436 thiss!1559) #b00000000000000000001111111111111) (= (mask!34436 thiss!1559) #b00000000000000000011111111111111) (= (mask!34436 thiss!1559) #b00000000000000000111111111111111) (= (mask!34436 thiss!1559) #b00000000000000001111111111111111) (= (mask!34436 thiss!1559) #b00000000000000011111111111111111) (= (mask!34436 thiss!1559) #b00000000000000111111111111111111) (= (mask!34436 thiss!1559) #b00000000000001111111111111111111) (= (mask!34436 thiss!1559) #b00000000000011111111111111111111) (= (mask!34436 thiss!1559) #b00000000000111111111111111111111) (= (mask!34436 thiss!1559) #b00000000001111111111111111111111) (= (mask!34436 thiss!1559) #b00000000011111111111111111111111) (= (mask!34436 thiss!1559) #b00000000111111111111111111111111) (= (mask!34436 thiss!1559) #b00000001111111111111111111111111) (= (mask!34436 thiss!1559) #b00000011111111111111111111111111) (= (mask!34436 thiss!1559) #b00000111111111111111111111111111) (= (mask!34436 thiss!1559) #b00001111111111111111111111111111) (= (mask!34436 thiss!1559) #b00011111111111111111111111111111) (= (mask!34436 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34436 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272404 d!139755))

(declare-fun d!139757 () Bool)

(declare-fun res!846403 () Bool)

(declare-fun e!725800 () Bool)

(assert (=> d!139757 (=> (not res!846403) (not e!725800))))

(declare-fun simpleValid!456 (LongMapFixedSize!6094) Bool)

(assert (=> d!139757 (= res!846403 (simpleValid!456 thiss!1559))))

(assert (=> d!139757 (= (valid!2280 thiss!1559) e!725800)))

(declare-fun b!1272448 () Bool)

(declare-fun res!846404 () Bool)

(assert (=> b!1272448 (=> (not res!846404) (not e!725800))))

(declare-fun arrayCountValidKeys!0 (array!83229 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272448 (= res!846404 (= (arrayCountValidKeys!0 (_keys!12096 thiss!1559) #b00000000000000000000000000000000 (size!40688 (_keys!12096 thiss!1559))) (_size!3102 thiss!1559)))))

(declare-fun b!1272449 () Bool)

(declare-fun res!846405 () Bool)

(assert (=> b!1272449 (=> (not res!846405) (not e!725800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83229 (_ BitVec 32)) Bool)

(assert (=> b!1272449 (= res!846405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12096 thiss!1559) (mask!34436 thiss!1559)))))

(declare-fun b!1272450 () Bool)

(declare-datatypes ((List!28631 0))(
  ( (Nil!28628) (Cons!28627 (h!29836 (_ BitVec 64)) (t!42156 List!28631)) )
))
(declare-fun arrayNoDuplicates!0 (array!83229 (_ BitVec 32) List!28631) Bool)

(assert (=> b!1272450 (= e!725800 (arrayNoDuplicates!0 (_keys!12096 thiss!1559) #b00000000000000000000000000000000 Nil!28628))))

(assert (= (and d!139757 res!846403) b!1272448))

(assert (= (and b!1272448 res!846404) b!1272449))

(assert (= (and b!1272449 res!846405) b!1272450))

(declare-fun m!1169651 () Bool)

(assert (=> d!139757 m!1169651))

(declare-fun m!1169653 () Bool)

(assert (=> b!1272448 m!1169653))

(declare-fun m!1169655 () Bool)

(assert (=> b!1272449 m!1169655))

(declare-fun m!1169657 () Bool)

(assert (=> b!1272450 m!1169657))

(assert (=> start!107390 d!139757))

(declare-fun b!1272457 () Bool)

(declare-fun e!725805 () Bool)

(assert (=> b!1272457 (= e!725805 tp_is_empty!33037)))

(declare-fun b!1272458 () Bool)

(declare-fun e!725806 () Bool)

(assert (=> b!1272458 (= e!725806 tp_is_empty!33037)))

(declare-fun mapNonEmpty!51155 () Bool)

(declare-fun mapRes!51155 () Bool)

(declare-fun tp!97533 () Bool)

(assert (=> mapNonEmpty!51155 (= mapRes!51155 (and tp!97533 e!725805))))

(declare-fun mapRest!51155 () (Array (_ BitVec 32) ValueCell!15665))

(declare-fun mapValue!51155 () ValueCell!15665)

(declare-fun mapKey!51155 () (_ BitVec 32))

(assert (=> mapNonEmpty!51155 (= mapRest!51146 (store mapRest!51155 mapKey!51155 mapValue!51155))))

(declare-fun condMapEmpty!51155 () Bool)

(declare-fun mapDefault!51155 () ValueCell!15665)

(assert (=> mapNonEmpty!51146 (= condMapEmpty!51155 (= mapRest!51146 ((as const (Array (_ BitVec 32) ValueCell!15665)) mapDefault!51155)))))

(assert (=> mapNonEmpty!51146 (= tp!97518 (and e!725806 mapRes!51155))))

(declare-fun mapIsEmpty!51155 () Bool)

(assert (=> mapIsEmpty!51155 mapRes!51155))

(assert (= (and mapNonEmpty!51146 condMapEmpty!51155) mapIsEmpty!51155))

(assert (= (and mapNonEmpty!51146 (not condMapEmpty!51155)) mapNonEmpty!51155))

(assert (= (and mapNonEmpty!51155 ((_ is ValueCellFull!15665) mapValue!51155)) b!1272457))

(assert (= (and mapNonEmpty!51146 ((_ is ValueCellFull!15665) mapDefault!51155)) b!1272458))

(declare-fun m!1169659 () Bool)

(assert (=> mapNonEmpty!51155 m!1169659))

(check-sat (not d!139757) (not b!1272448) (not b!1272450) b_and!45705 (not b!1272449) tp_is_empty!33037 (not b_next!27667) (not mapNonEmpty!51155))
(check-sat b_and!45705 (not b_next!27667))
(get-model)

(declare-fun b!1272469 () Bool)

(declare-fun e!725818 () Bool)

(declare-fun e!725815 () Bool)

(assert (=> b!1272469 (= e!725818 e!725815)))

(declare-fun c!123683 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272469 (= c!123683 (validKeyInArray!0 (select (arr!40149 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!139759 () Bool)

(declare-fun res!846413 () Bool)

(declare-fun e!725817 () Bool)

(assert (=> d!139759 (=> res!846413 e!725817)))

(assert (=> d!139759 (= res!846413 (bvsge #b00000000000000000000000000000000 (size!40688 (_keys!12096 thiss!1559))))))

(assert (=> d!139759 (= (arrayNoDuplicates!0 (_keys!12096 thiss!1559) #b00000000000000000000000000000000 Nil!28628) e!725817)))

(declare-fun b!1272470 () Bool)

(declare-fun call!62530 () Bool)

(assert (=> b!1272470 (= e!725815 call!62530)))

(declare-fun bm!62527 () Bool)

(assert (=> bm!62527 (= call!62530 (arrayNoDuplicates!0 (_keys!12096 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123683 (Cons!28627 (select (arr!40149 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000) Nil!28628) Nil!28628)))))

(declare-fun b!1272471 () Bool)

(declare-fun e!725816 () Bool)

(declare-fun contains!7638 (List!28631 (_ BitVec 64)) Bool)

(assert (=> b!1272471 (= e!725816 (contains!7638 Nil!28628 (select (arr!40149 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272472 () Bool)

(assert (=> b!1272472 (= e!725817 e!725818)))

(declare-fun res!846412 () Bool)

(assert (=> b!1272472 (=> (not res!846412) (not e!725818))))

(assert (=> b!1272472 (= res!846412 (not e!725816))))

(declare-fun res!846414 () Bool)

(assert (=> b!1272472 (=> (not res!846414) (not e!725816))))

(assert (=> b!1272472 (= res!846414 (validKeyInArray!0 (select (arr!40149 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272473 () Bool)

(assert (=> b!1272473 (= e!725815 call!62530)))

(assert (= (and d!139759 (not res!846413)) b!1272472))

(assert (= (and b!1272472 res!846414) b!1272471))

(assert (= (and b!1272472 res!846412) b!1272469))

(assert (= (and b!1272469 c!123683) b!1272470))

(assert (= (and b!1272469 (not c!123683)) b!1272473))

(assert (= (or b!1272470 b!1272473) bm!62527))

(declare-fun m!1169661 () Bool)

(assert (=> b!1272469 m!1169661))

(assert (=> b!1272469 m!1169661))

(declare-fun m!1169663 () Bool)

(assert (=> b!1272469 m!1169663))

(assert (=> bm!62527 m!1169661))

(declare-fun m!1169665 () Bool)

(assert (=> bm!62527 m!1169665))

(assert (=> b!1272471 m!1169661))

(assert (=> b!1272471 m!1169661))

(declare-fun m!1169667 () Bool)

(assert (=> b!1272471 m!1169667))

(assert (=> b!1272472 m!1169661))

(assert (=> b!1272472 m!1169661))

(assert (=> b!1272472 m!1169663))

(assert (=> b!1272450 d!139759))

(declare-fun b!1272483 () Bool)

(declare-fun e!725824 () (_ BitVec 32))

(declare-fun e!725823 () (_ BitVec 32))

(assert (=> b!1272483 (= e!725824 e!725823)))

(declare-fun c!123688 () Bool)

(assert (=> b!1272483 (= c!123688 (validKeyInArray!0 (select (arr!40149 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272484 () Bool)

(declare-fun call!62533 () (_ BitVec 32))

(assert (=> b!1272484 (= e!725823 (bvadd #b00000000000000000000000000000001 call!62533))))

(declare-fun bm!62530 () Bool)

(assert (=> bm!62530 (= call!62533 (arrayCountValidKeys!0 (_keys!12096 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40688 (_keys!12096 thiss!1559))))))

(declare-fun b!1272485 () Bool)

(assert (=> b!1272485 (= e!725823 call!62533)))

(declare-fun b!1272482 () Bool)

(assert (=> b!1272482 (= e!725824 #b00000000000000000000000000000000)))

(declare-fun d!139761 () Bool)

(declare-fun lt!574881 () (_ BitVec 32))

(assert (=> d!139761 (and (bvsge lt!574881 #b00000000000000000000000000000000) (bvsle lt!574881 (bvsub (size!40688 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139761 (= lt!574881 e!725824)))

(declare-fun c!123689 () Bool)

(assert (=> d!139761 (= c!123689 (bvsge #b00000000000000000000000000000000 (size!40688 (_keys!12096 thiss!1559))))))

(assert (=> d!139761 (and (bvsle #b00000000000000000000000000000000 (size!40688 (_keys!12096 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40688 (_keys!12096 thiss!1559)) (size!40688 (_keys!12096 thiss!1559))))))

(assert (=> d!139761 (= (arrayCountValidKeys!0 (_keys!12096 thiss!1559) #b00000000000000000000000000000000 (size!40688 (_keys!12096 thiss!1559))) lt!574881)))

(assert (= (and d!139761 c!123689) b!1272482))

(assert (= (and d!139761 (not c!123689)) b!1272483))

(assert (= (and b!1272483 c!123688) b!1272484))

(assert (= (and b!1272483 (not c!123688)) b!1272485))

(assert (= (or b!1272484 b!1272485) bm!62530))

(assert (=> b!1272483 m!1169661))

(assert (=> b!1272483 m!1169661))

(assert (=> b!1272483 m!1169663))

(declare-fun m!1169669 () Bool)

(assert (=> bm!62530 m!1169669))

(assert (=> b!1272448 d!139761))

(declare-fun d!139763 () Bool)

(declare-fun res!846419 () Bool)

(declare-fun e!725832 () Bool)

(assert (=> d!139763 (=> res!846419 e!725832)))

(assert (=> d!139763 (= res!846419 (bvsge #b00000000000000000000000000000000 (size!40688 (_keys!12096 thiss!1559))))))

(assert (=> d!139763 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12096 thiss!1559) (mask!34436 thiss!1559)) e!725832)))

(declare-fun b!1272494 () Bool)

(declare-fun e!725831 () Bool)

(declare-fun e!725833 () Bool)

(assert (=> b!1272494 (= e!725831 e!725833)))

(declare-fun lt!574890 () (_ BitVec 64))

(assert (=> b!1272494 (= lt!574890 (select (arr!40149 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42166 0))(
  ( (Unit!42167) )
))
(declare-fun lt!574888 () Unit!42166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83229 (_ BitVec 64) (_ BitVec 32)) Unit!42166)

(assert (=> b!1272494 (= lt!574888 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12096 thiss!1559) lt!574890 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272494 (arrayContainsKey!0 (_keys!12096 thiss!1559) lt!574890 #b00000000000000000000000000000000)))

(declare-fun lt!574889 () Unit!42166)

(assert (=> b!1272494 (= lt!574889 lt!574888)))

(declare-fun res!846420 () Bool)

(declare-datatypes ((SeekEntryResult!9989 0))(
  ( (MissingZero!9989 (index!42327 (_ BitVec 32))) (Found!9989 (index!42328 (_ BitVec 32))) (Intermediate!9989 (undefined!10801 Bool) (index!42329 (_ BitVec 32)) (x!112429 (_ BitVec 32))) (Undefined!9989) (MissingVacant!9989 (index!42330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83229 (_ BitVec 32)) SeekEntryResult!9989)

(assert (=> b!1272494 (= res!846420 (= (seekEntryOrOpen!0 (select (arr!40149 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000) (_keys!12096 thiss!1559) (mask!34436 thiss!1559)) (Found!9989 #b00000000000000000000000000000000)))))

(assert (=> b!1272494 (=> (not res!846420) (not e!725833))))

(declare-fun b!1272495 () Bool)

(declare-fun call!62536 () Bool)

(assert (=> b!1272495 (= e!725831 call!62536)))

(declare-fun bm!62533 () Bool)

(assert (=> bm!62533 (= call!62536 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12096 thiss!1559) (mask!34436 thiss!1559)))))

(declare-fun b!1272496 () Bool)

(assert (=> b!1272496 (= e!725833 call!62536)))

(declare-fun b!1272497 () Bool)

(assert (=> b!1272497 (= e!725832 e!725831)))

(declare-fun c!123692 () Bool)

(assert (=> b!1272497 (= c!123692 (validKeyInArray!0 (select (arr!40149 (_keys!12096 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139763 (not res!846419)) b!1272497))

(assert (= (and b!1272497 c!123692) b!1272494))

(assert (= (and b!1272497 (not c!123692)) b!1272495))

(assert (= (and b!1272494 res!846420) b!1272496))

(assert (= (or b!1272496 b!1272495) bm!62533))

(assert (=> b!1272494 m!1169661))

(declare-fun m!1169671 () Bool)

(assert (=> b!1272494 m!1169671))

(declare-fun m!1169673 () Bool)

(assert (=> b!1272494 m!1169673))

(assert (=> b!1272494 m!1169661))

(declare-fun m!1169675 () Bool)

(assert (=> b!1272494 m!1169675))

(declare-fun m!1169677 () Bool)

(assert (=> bm!62533 m!1169677))

(assert (=> b!1272497 m!1169661))

(assert (=> b!1272497 m!1169661))

(assert (=> b!1272497 m!1169663))

(assert (=> b!1272449 d!139763))

(declare-fun b!1272507 () Bool)

(declare-fun res!846429 () Bool)

(declare-fun e!725836 () Bool)

(assert (=> b!1272507 (=> (not res!846429) (not e!725836))))

(declare-fun size!40693 (LongMapFixedSize!6094) (_ BitVec 32))

(assert (=> b!1272507 (= res!846429 (bvsge (size!40693 thiss!1559) (_size!3102 thiss!1559)))))

(declare-fun b!1272506 () Bool)

(declare-fun res!846432 () Bool)

(assert (=> b!1272506 (=> (not res!846432) (not e!725836))))

(assert (=> b!1272506 (= res!846432 (and (= (size!40687 (_values!6716 thiss!1559)) (bvadd (mask!34436 thiss!1559) #b00000000000000000000000000000001)) (= (size!40688 (_keys!12096 thiss!1559)) (size!40687 (_values!6716 thiss!1559))) (bvsge (_size!3102 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3102 thiss!1559) (bvadd (mask!34436 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1272508 () Bool)

(declare-fun res!846431 () Bool)

(assert (=> b!1272508 (=> (not res!846431) (not e!725836))))

(assert (=> b!1272508 (= res!846431 (= (size!40693 thiss!1559) (bvadd (_size!3102 thiss!1559) (bvsdiv (bvadd (extraKeys!6372 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1272509 () Bool)

(assert (=> b!1272509 (= e!725836 (and (bvsge (extraKeys!6372 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6372 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3102 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun d!139765 () Bool)

(declare-fun res!846430 () Bool)

(assert (=> d!139765 (=> (not res!846430) (not e!725836))))

(assert (=> d!139765 (= res!846430 (validMask!0 (mask!34436 thiss!1559)))))

(assert (=> d!139765 (= (simpleValid!456 thiss!1559) e!725836)))

(assert (= (and d!139765 res!846430) b!1272506))

(assert (= (and b!1272506 res!846432) b!1272507))

(assert (= (and b!1272507 res!846429) b!1272508))

(assert (= (and b!1272508 res!846431) b!1272509))

(declare-fun m!1169679 () Bool)

(assert (=> b!1272507 m!1169679))

(assert (=> b!1272508 m!1169679))

(assert (=> d!139765 m!1169621))

(assert (=> d!139757 d!139765))

(declare-fun b!1272510 () Bool)

(declare-fun e!725837 () Bool)

(assert (=> b!1272510 (= e!725837 tp_is_empty!33037)))

(declare-fun b!1272511 () Bool)

(declare-fun e!725838 () Bool)

(assert (=> b!1272511 (= e!725838 tp_is_empty!33037)))

(declare-fun mapNonEmpty!51156 () Bool)

(declare-fun mapRes!51156 () Bool)

(declare-fun tp!97534 () Bool)

(assert (=> mapNonEmpty!51156 (= mapRes!51156 (and tp!97534 e!725837))))

(declare-fun mapKey!51156 () (_ BitVec 32))

(declare-fun mapValue!51156 () ValueCell!15665)

(declare-fun mapRest!51156 () (Array (_ BitVec 32) ValueCell!15665))

(assert (=> mapNonEmpty!51156 (= mapRest!51155 (store mapRest!51156 mapKey!51156 mapValue!51156))))

(declare-fun condMapEmpty!51156 () Bool)

(declare-fun mapDefault!51156 () ValueCell!15665)

(assert (=> mapNonEmpty!51155 (= condMapEmpty!51156 (= mapRest!51155 ((as const (Array (_ BitVec 32) ValueCell!15665)) mapDefault!51156)))))

(assert (=> mapNonEmpty!51155 (= tp!97533 (and e!725838 mapRes!51156))))

(declare-fun mapIsEmpty!51156 () Bool)

(assert (=> mapIsEmpty!51156 mapRes!51156))

(assert (= (and mapNonEmpty!51155 condMapEmpty!51156) mapIsEmpty!51156))

(assert (= (and mapNonEmpty!51155 (not condMapEmpty!51156)) mapNonEmpty!51156))

(assert (= (and mapNonEmpty!51156 ((_ is ValueCellFull!15665) mapValue!51156)) b!1272510))

(assert (= (and mapNonEmpty!51155 ((_ is ValueCellFull!15665) mapDefault!51156)) b!1272511))

(declare-fun m!1169681 () Bool)

(assert (=> mapNonEmpty!51156 m!1169681))

(check-sat (not b_next!27667) (not mapNonEmpty!51156) (not b!1272472) (not bm!62530) (not b!1272469) (not b!1272494) b_and!45705 tp_is_empty!33037 (not bm!62533) (not b!1272497) (not bm!62527) (not d!139765) (not b!1272507) (not b!1272471) (not b!1272508) (not b!1272483))
(check-sat b_and!45705 (not b_next!27667))
