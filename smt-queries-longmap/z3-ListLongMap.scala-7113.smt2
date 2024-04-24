; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90374 () Bool)

(assert start!90374)

(declare-fun b!1033797 () Bool)

(declare-fun b_free!20731 () Bool)

(declare-fun b_next!20731 () Bool)

(assert (=> b!1033797 (= b_free!20731 (not b_next!20731))))

(declare-fun tp!73268 () Bool)

(declare-fun b_and!33209 () Bool)

(assert (=> b!1033797 (= tp!73268 b_and!33209)))

(declare-fun b!1033795 () Bool)

(declare-fun e!584248 () Bool)

(declare-fun tp_is_empty!24451 () Bool)

(assert (=> b!1033795 (= e!584248 tp_is_empty!24451)))

(declare-fun b!1033796 () Bool)

(declare-fun e!584246 () Bool)

(declare-datatypes ((V!37475 0))(
  ( (V!37476 (val!12276 Int)) )
))
(declare-datatypes ((ValueCell!11522 0))(
  ( (ValueCellFull!11522 (v!14849 V!37475)) (EmptyCell!11522) )
))
(declare-datatypes ((array!65017 0))(
  ( (array!65018 (arr!31303 (Array (_ BitVec 32) (_ BitVec 64))) (size!31822 (_ BitVec 32))) )
))
(declare-datatypes ((array!65019 0))(
  ( (array!65020 (arr!31304 (Array (_ BitVec 32) ValueCell!11522)) (size!31823 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5638 0))(
  ( (LongMapFixedSize!5639 (defaultEntry!6193 Int) (mask!30075 (_ BitVec 32)) (extraKeys!5925 (_ BitVec 32)) (zeroValue!6029 V!37475) (minValue!6029 V!37475) (_size!2874 (_ BitVec 32)) (_keys!11405 array!65017) (_values!6216 array!65019) (_vacant!2874 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5638)

(assert (=> b!1033796 (= e!584246 (not (= (size!31823 (_values!6216 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30075 thiss!1427)))))))

(declare-fun mapNonEmpty!38134 () Bool)

(declare-fun mapRes!38134 () Bool)

(declare-fun tp!73267 () Bool)

(declare-fun e!584245 () Bool)

(assert (=> mapNonEmpty!38134 (= mapRes!38134 (and tp!73267 e!584245))))

(declare-fun mapRest!38134 () (Array (_ BitVec 32) ValueCell!11522))

(declare-fun mapValue!38134 () ValueCell!11522)

(declare-fun mapKey!38134 () (_ BitVec 32))

(assert (=> mapNonEmpty!38134 (= (arr!31304 (_values!6216 thiss!1427)) (store mapRest!38134 mapKey!38134 mapValue!38134))))

(declare-fun e!584244 () Bool)

(declare-fun e!584247 () Bool)

(declare-fun array_inv!24231 (array!65017) Bool)

(declare-fun array_inv!24232 (array!65019) Bool)

(assert (=> b!1033797 (= e!584244 (and tp!73268 tp_is_empty!24451 (array_inv!24231 (_keys!11405 thiss!1427)) (array_inv!24232 (_values!6216 thiss!1427)) e!584247))))

(declare-fun b!1033798 () Bool)

(declare-fun res!690572 () Bool)

(assert (=> b!1033798 (=> (not res!690572) (not e!584246))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033798 (= res!690572 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033799 () Bool)

(assert (=> b!1033799 (= e!584245 tp_is_empty!24451)))

(declare-fun b!1033800 () Bool)

(assert (=> b!1033800 (= e!584247 (and e!584248 mapRes!38134))))

(declare-fun condMapEmpty!38134 () Bool)

(declare-fun mapDefault!38134 () ValueCell!11522)

(assert (=> b!1033800 (= condMapEmpty!38134 (= (arr!31304 (_values!6216 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11522)) mapDefault!38134)))))

(declare-fun res!690570 () Bool)

(assert (=> start!90374 (=> (not res!690570) (not e!584246))))

(declare-fun valid!2140 (LongMapFixedSize!5638) Bool)

(assert (=> start!90374 (= res!690570 (valid!2140 thiss!1427))))

(assert (=> start!90374 e!584246))

(assert (=> start!90374 e!584244))

(assert (=> start!90374 true))

(declare-fun b!1033801 () Bool)

(declare-fun res!690571 () Bool)

(assert (=> b!1033801 (=> (not res!690571) (not e!584246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033801 (= res!690571 (validMask!0 (mask!30075 thiss!1427)))))

(declare-fun mapIsEmpty!38134 () Bool)

(assert (=> mapIsEmpty!38134 mapRes!38134))

(assert (= (and start!90374 res!690570) b!1033798))

(assert (= (and b!1033798 res!690572) b!1033801))

(assert (= (and b!1033801 res!690571) b!1033796))

(assert (= (and b!1033800 condMapEmpty!38134) mapIsEmpty!38134))

(assert (= (and b!1033800 (not condMapEmpty!38134)) mapNonEmpty!38134))

(get-info :version)

(assert (= (and mapNonEmpty!38134 ((_ is ValueCellFull!11522) mapValue!38134)) b!1033799))

(assert (= (and b!1033800 ((_ is ValueCellFull!11522) mapDefault!38134)) b!1033795))

(assert (= b!1033797 b!1033800))

(assert (= start!90374 b!1033797))

(declare-fun m!954403 () Bool)

(assert (=> mapNonEmpty!38134 m!954403))

(declare-fun m!954405 () Bool)

(assert (=> b!1033797 m!954405))

(declare-fun m!954407 () Bool)

(assert (=> b!1033797 m!954407))

(declare-fun m!954409 () Bool)

(assert (=> start!90374 m!954409))

(declare-fun m!954411 () Bool)

(assert (=> b!1033801 m!954411))

(check-sat b_and!33209 (not b!1033801) (not b_next!20731) tp_is_empty!24451 (not b!1033797) (not start!90374) (not mapNonEmpty!38134))
(check-sat b_and!33209 (not b_next!20731))
(get-model)

(declare-fun d!124151 () Bool)

(declare-fun res!690597 () Bool)

(declare-fun e!584288 () Bool)

(assert (=> d!124151 (=> (not res!690597) (not e!584288))))

(declare-fun simpleValid!398 (LongMapFixedSize!5638) Bool)

(assert (=> d!124151 (= res!690597 (simpleValid!398 thiss!1427))))

(assert (=> d!124151 (= (valid!2140 thiss!1427) e!584288)))

(declare-fun b!1033850 () Bool)

(declare-fun res!690598 () Bool)

(assert (=> b!1033850 (=> (not res!690598) (not e!584288))))

(declare-fun arrayCountValidKeys!0 (array!65017 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033850 (= res!690598 (= (arrayCountValidKeys!0 (_keys!11405 thiss!1427) #b00000000000000000000000000000000 (size!31822 (_keys!11405 thiss!1427))) (_size!2874 thiss!1427)))))

(declare-fun b!1033851 () Bool)

(declare-fun res!690599 () Bool)

(assert (=> b!1033851 (=> (not res!690599) (not e!584288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65017 (_ BitVec 32)) Bool)

(assert (=> b!1033851 (= res!690599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11405 thiss!1427) (mask!30075 thiss!1427)))))

(declare-fun b!1033852 () Bool)

(declare-datatypes ((List!21883 0))(
  ( (Nil!21880) (Cons!21879 (h!23090 (_ BitVec 64)) (t!31069 List!21883)) )
))
(declare-fun arrayNoDuplicates!0 (array!65017 (_ BitVec 32) List!21883) Bool)

(assert (=> b!1033852 (= e!584288 (arrayNoDuplicates!0 (_keys!11405 thiss!1427) #b00000000000000000000000000000000 Nil!21880))))

(assert (= (and d!124151 res!690597) b!1033850))

(assert (= (and b!1033850 res!690598) b!1033851))

(assert (= (and b!1033851 res!690599) b!1033852))

(declare-fun m!954433 () Bool)

(assert (=> d!124151 m!954433))

(declare-fun m!954435 () Bool)

(assert (=> b!1033850 m!954435))

(declare-fun m!954437 () Bool)

(assert (=> b!1033851 m!954437))

(declare-fun m!954439 () Bool)

(assert (=> b!1033852 m!954439))

(assert (=> start!90374 d!124151))

(declare-fun d!124153 () Bool)

(assert (=> d!124153 (= (array_inv!24231 (_keys!11405 thiss!1427)) (bvsge (size!31822 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033797 d!124153))

(declare-fun d!124155 () Bool)

(assert (=> d!124155 (= (array_inv!24232 (_values!6216 thiss!1427)) (bvsge (size!31823 (_values!6216 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033797 d!124155))

(declare-fun d!124157 () Bool)

(assert (=> d!124157 (= (validMask!0 (mask!30075 thiss!1427)) (and (or (= (mask!30075 thiss!1427) #b00000000000000000000000000000111) (= (mask!30075 thiss!1427) #b00000000000000000000000000001111) (= (mask!30075 thiss!1427) #b00000000000000000000000000011111) (= (mask!30075 thiss!1427) #b00000000000000000000000000111111) (= (mask!30075 thiss!1427) #b00000000000000000000000001111111) (= (mask!30075 thiss!1427) #b00000000000000000000000011111111) (= (mask!30075 thiss!1427) #b00000000000000000000000111111111) (= (mask!30075 thiss!1427) #b00000000000000000000001111111111) (= (mask!30075 thiss!1427) #b00000000000000000000011111111111) (= (mask!30075 thiss!1427) #b00000000000000000000111111111111) (= (mask!30075 thiss!1427) #b00000000000000000001111111111111) (= (mask!30075 thiss!1427) #b00000000000000000011111111111111) (= (mask!30075 thiss!1427) #b00000000000000000111111111111111) (= (mask!30075 thiss!1427) #b00000000000000001111111111111111) (= (mask!30075 thiss!1427) #b00000000000000011111111111111111) (= (mask!30075 thiss!1427) #b00000000000000111111111111111111) (= (mask!30075 thiss!1427) #b00000000000001111111111111111111) (= (mask!30075 thiss!1427) #b00000000000011111111111111111111) (= (mask!30075 thiss!1427) #b00000000000111111111111111111111) (= (mask!30075 thiss!1427) #b00000000001111111111111111111111) (= (mask!30075 thiss!1427) #b00000000011111111111111111111111) (= (mask!30075 thiss!1427) #b00000000111111111111111111111111) (= (mask!30075 thiss!1427) #b00000001111111111111111111111111) (= (mask!30075 thiss!1427) #b00000011111111111111111111111111) (= (mask!30075 thiss!1427) #b00000111111111111111111111111111) (= (mask!30075 thiss!1427) #b00001111111111111111111111111111) (= (mask!30075 thiss!1427) #b00011111111111111111111111111111) (= (mask!30075 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30075 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1033801 d!124157))

(declare-fun b!1033859 () Bool)

(declare-fun e!584293 () Bool)

(assert (=> b!1033859 (= e!584293 tp_is_empty!24451)))

(declare-fun mapNonEmpty!38143 () Bool)

(declare-fun mapRes!38143 () Bool)

(declare-fun tp!73283 () Bool)

(assert (=> mapNonEmpty!38143 (= mapRes!38143 (and tp!73283 e!584293))))

(declare-fun mapRest!38143 () (Array (_ BitVec 32) ValueCell!11522))

(declare-fun mapKey!38143 () (_ BitVec 32))

(declare-fun mapValue!38143 () ValueCell!11522)

(assert (=> mapNonEmpty!38143 (= mapRest!38134 (store mapRest!38143 mapKey!38143 mapValue!38143))))

(declare-fun mapIsEmpty!38143 () Bool)

(assert (=> mapIsEmpty!38143 mapRes!38143))

(declare-fun b!1033860 () Bool)

(declare-fun e!584294 () Bool)

(assert (=> b!1033860 (= e!584294 tp_is_empty!24451)))

(declare-fun condMapEmpty!38143 () Bool)

(declare-fun mapDefault!38143 () ValueCell!11522)

(assert (=> mapNonEmpty!38134 (= condMapEmpty!38143 (= mapRest!38134 ((as const (Array (_ BitVec 32) ValueCell!11522)) mapDefault!38143)))))

(assert (=> mapNonEmpty!38134 (= tp!73267 (and e!584294 mapRes!38143))))

(assert (= (and mapNonEmpty!38134 condMapEmpty!38143) mapIsEmpty!38143))

(assert (= (and mapNonEmpty!38134 (not condMapEmpty!38143)) mapNonEmpty!38143))

(assert (= (and mapNonEmpty!38143 ((_ is ValueCellFull!11522) mapValue!38143)) b!1033859))

(assert (= (and mapNonEmpty!38134 ((_ is ValueCellFull!11522) mapDefault!38143)) b!1033860))

(declare-fun m!954441 () Bool)

(assert (=> mapNonEmpty!38143 m!954441))

(check-sat (not b!1033852) b_and!33209 tp_is_empty!24451 (not d!124151) (not b!1033850) (not b!1033851) (not b_next!20731) (not mapNonEmpty!38143))
(check-sat b_and!33209 (not b_next!20731))
(get-model)

(declare-fun b!1033871 () Bool)

(declare-fun e!584304 () Bool)

(declare-fun call!43669 () Bool)

(assert (=> b!1033871 (= e!584304 call!43669)))

(declare-fun b!1033872 () Bool)

(declare-fun e!584303 () Bool)

(declare-fun e!584305 () Bool)

(assert (=> b!1033872 (= e!584303 e!584305)))

(declare-fun res!690607 () Bool)

(assert (=> b!1033872 (=> (not res!690607) (not e!584305))))

(declare-fun e!584306 () Bool)

(assert (=> b!1033872 (= res!690607 (not e!584306))))

(declare-fun res!690606 () Bool)

(assert (=> b!1033872 (=> (not res!690606) (not e!584306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033872 (= res!690606 (validKeyInArray!0 (select (arr!31303 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033873 () Bool)

(declare-fun contains!6032 (List!21883 (_ BitVec 64)) Bool)

(assert (=> b!1033873 (= e!584306 (contains!6032 Nil!21880 (select (arr!31303 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033874 () Bool)

(assert (=> b!1033874 (= e!584304 call!43669)))

(declare-fun bm!43666 () Bool)

(declare-fun c!104726 () Bool)

(assert (=> bm!43666 (= call!43669 (arrayNoDuplicates!0 (_keys!11405 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104726 (Cons!21879 (select (arr!31303 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000) Nil!21880) Nil!21880)))))

(declare-fun d!124159 () Bool)

(declare-fun res!690608 () Bool)

(assert (=> d!124159 (=> res!690608 e!584303)))

(assert (=> d!124159 (= res!690608 (bvsge #b00000000000000000000000000000000 (size!31822 (_keys!11405 thiss!1427))))))

(assert (=> d!124159 (= (arrayNoDuplicates!0 (_keys!11405 thiss!1427) #b00000000000000000000000000000000 Nil!21880) e!584303)))

(declare-fun b!1033875 () Bool)

(assert (=> b!1033875 (= e!584305 e!584304)))

(assert (=> b!1033875 (= c!104726 (validKeyInArray!0 (select (arr!31303 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124159 (not res!690608)) b!1033872))

(assert (= (and b!1033872 res!690606) b!1033873))

(assert (= (and b!1033872 res!690607) b!1033875))

(assert (= (and b!1033875 c!104726) b!1033871))

(assert (= (and b!1033875 (not c!104726)) b!1033874))

(assert (= (or b!1033871 b!1033874) bm!43666))

(declare-fun m!954443 () Bool)

(assert (=> b!1033872 m!954443))

(assert (=> b!1033872 m!954443))

(declare-fun m!954445 () Bool)

(assert (=> b!1033872 m!954445))

(assert (=> b!1033873 m!954443))

(assert (=> b!1033873 m!954443))

(declare-fun m!954447 () Bool)

(assert (=> b!1033873 m!954447))

(assert (=> bm!43666 m!954443))

(declare-fun m!954449 () Bool)

(assert (=> bm!43666 m!954449))

(assert (=> b!1033875 m!954443))

(assert (=> b!1033875 m!954443))

(assert (=> b!1033875 m!954445))

(assert (=> b!1033852 d!124159))

(declare-fun d!124161 () Bool)

(declare-fun res!690613 () Bool)

(declare-fun e!584315 () Bool)

(assert (=> d!124161 (=> res!690613 e!584315)))

(assert (=> d!124161 (= res!690613 (bvsge #b00000000000000000000000000000000 (size!31822 (_keys!11405 thiss!1427))))))

(assert (=> d!124161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11405 thiss!1427) (mask!30075 thiss!1427)) e!584315)))

(declare-fun b!1033884 () Bool)

(declare-fun e!584314 () Bool)

(assert (=> b!1033884 (= e!584315 e!584314)))

(declare-fun c!104729 () Bool)

(assert (=> b!1033884 (= c!104729 (validKeyInArray!0 (select (arr!31303 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033885 () Bool)

(declare-fun e!584313 () Bool)

(assert (=> b!1033885 (= e!584314 e!584313)))

(declare-fun lt!456563 () (_ BitVec 64))

(assert (=> b!1033885 (= lt!456563 (select (arr!31303 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33825 0))(
  ( (Unit!33826) )
))
(declare-fun lt!456564 () Unit!33825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65017 (_ BitVec 64) (_ BitVec 32)) Unit!33825)

(assert (=> b!1033885 (= lt!456564 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11405 thiss!1427) lt!456563 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033885 (arrayContainsKey!0 (_keys!11405 thiss!1427) lt!456563 #b00000000000000000000000000000000)))

(declare-fun lt!456565 () Unit!33825)

(assert (=> b!1033885 (= lt!456565 lt!456564)))

(declare-fun res!690614 () Bool)

(declare-datatypes ((SeekEntryResult!9689 0))(
  ( (MissingZero!9689 (index!41127 (_ BitVec 32))) (Found!9689 (index!41128 (_ BitVec 32))) (Intermediate!9689 (undefined!10501 Bool) (index!41129 (_ BitVec 32)) (x!92011 (_ BitVec 32))) (Undefined!9689) (MissingVacant!9689 (index!41130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65017 (_ BitVec 32)) SeekEntryResult!9689)

(assert (=> b!1033885 (= res!690614 (= (seekEntryOrOpen!0 (select (arr!31303 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000) (_keys!11405 thiss!1427) (mask!30075 thiss!1427)) (Found!9689 #b00000000000000000000000000000000)))))

(assert (=> b!1033885 (=> (not res!690614) (not e!584313))))

(declare-fun b!1033886 () Bool)

(declare-fun call!43672 () Bool)

(assert (=> b!1033886 (= e!584313 call!43672)))

(declare-fun bm!43669 () Bool)

(assert (=> bm!43669 (= call!43672 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11405 thiss!1427) (mask!30075 thiss!1427)))))

(declare-fun b!1033887 () Bool)

(assert (=> b!1033887 (= e!584314 call!43672)))

(assert (= (and d!124161 (not res!690613)) b!1033884))

(assert (= (and b!1033884 c!104729) b!1033885))

(assert (= (and b!1033884 (not c!104729)) b!1033887))

(assert (= (and b!1033885 res!690614) b!1033886))

(assert (= (or b!1033886 b!1033887) bm!43669))

(assert (=> b!1033884 m!954443))

(assert (=> b!1033884 m!954443))

(assert (=> b!1033884 m!954445))

(assert (=> b!1033885 m!954443))

(declare-fun m!954451 () Bool)

(assert (=> b!1033885 m!954451))

(declare-fun m!954453 () Bool)

(assert (=> b!1033885 m!954453))

(assert (=> b!1033885 m!954443))

(declare-fun m!954455 () Bool)

(assert (=> b!1033885 m!954455))

(declare-fun m!954457 () Bool)

(assert (=> bm!43669 m!954457))

(assert (=> b!1033851 d!124161))

(declare-fun b!1033896 () Bool)

(declare-fun e!584321 () (_ BitVec 32))

(assert (=> b!1033896 (= e!584321 #b00000000000000000000000000000000)))

(declare-fun b!1033897 () Bool)

(declare-fun e!584320 () (_ BitVec 32))

(declare-fun call!43675 () (_ BitVec 32))

(assert (=> b!1033897 (= e!584320 call!43675)))

(declare-fun b!1033898 () Bool)

(assert (=> b!1033898 (= e!584321 e!584320)))

(declare-fun c!104735 () Bool)

(assert (=> b!1033898 (= c!104735 (validKeyInArray!0 (select (arr!31303 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43672 () Bool)

(assert (=> bm!43672 (= call!43675 (arrayCountValidKeys!0 (_keys!11405 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31822 (_keys!11405 thiss!1427))))))

(declare-fun d!124163 () Bool)

(declare-fun lt!456568 () (_ BitVec 32))

(assert (=> d!124163 (and (bvsge lt!456568 #b00000000000000000000000000000000) (bvsle lt!456568 (bvsub (size!31822 (_keys!11405 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124163 (= lt!456568 e!584321)))

(declare-fun c!104734 () Bool)

(assert (=> d!124163 (= c!104734 (bvsge #b00000000000000000000000000000000 (size!31822 (_keys!11405 thiss!1427))))))

(assert (=> d!124163 (and (bvsle #b00000000000000000000000000000000 (size!31822 (_keys!11405 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31822 (_keys!11405 thiss!1427)) (size!31822 (_keys!11405 thiss!1427))))))

(assert (=> d!124163 (= (arrayCountValidKeys!0 (_keys!11405 thiss!1427) #b00000000000000000000000000000000 (size!31822 (_keys!11405 thiss!1427))) lt!456568)))

(declare-fun b!1033899 () Bool)

(assert (=> b!1033899 (= e!584320 (bvadd #b00000000000000000000000000000001 call!43675))))

(assert (= (and d!124163 c!104734) b!1033896))

(assert (= (and d!124163 (not c!104734)) b!1033898))

(assert (= (and b!1033898 c!104735) b!1033899))

(assert (= (and b!1033898 (not c!104735)) b!1033897))

(assert (= (or b!1033899 b!1033897) bm!43672))

(assert (=> b!1033898 m!954443))

(assert (=> b!1033898 m!954443))

(assert (=> b!1033898 m!954445))

(declare-fun m!954459 () Bool)

(assert (=> bm!43672 m!954459))

(assert (=> b!1033850 d!124163))

(declare-fun b!1033909 () Bool)

(declare-fun res!690626 () Bool)

(declare-fun e!584324 () Bool)

(assert (=> b!1033909 (=> (not res!690626) (not e!584324))))

(declare-fun size!31828 (LongMapFixedSize!5638) (_ BitVec 32))

(assert (=> b!1033909 (= res!690626 (bvsge (size!31828 thiss!1427) (_size!2874 thiss!1427)))))

(declare-fun b!1033908 () Bool)

(declare-fun res!690623 () Bool)

(assert (=> b!1033908 (=> (not res!690623) (not e!584324))))

(assert (=> b!1033908 (= res!690623 (and (= (size!31823 (_values!6216 thiss!1427)) (bvadd (mask!30075 thiss!1427) #b00000000000000000000000000000001)) (= (size!31822 (_keys!11405 thiss!1427)) (size!31823 (_values!6216 thiss!1427))) (bvsge (_size!2874 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2874 thiss!1427) (bvadd (mask!30075 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1033910 () Bool)

(declare-fun res!690624 () Bool)

(assert (=> b!1033910 (=> (not res!690624) (not e!584324))))

(assert (=> b!1033910 (= res!690624 (= (size!31828 thiss!1427) (bvadd (_size!2874 thiss!1427) (bvsdiv (bvadd (extraKeys!5925 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124165 () Bool)

(declare-fun res!690625 () Bool)

(assert (=> d!124165 (=> (not res!690625) (not e!584324))))

(assert (=> d!124165 (= res!690625 (validMask!0 (mask!30075 thiss!1427)))))

(assert (=> d!124165 (= (simpleValid!398 thiss!1427) e!584324)))

(declare-fun b!1033911 () Bool)

(assert (=> b!1033911 (= e!584324 (and (bvsge (extraKeys!5925 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5925 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2874 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124165 res!690625) b!1033908))

(assert (= (and b!1033908 res!690623) b!1033909))

(assert (= (and b!1033909 res!690626) b!1033910))

(assert (= (and b!1033910 res!690624) b!1033911))

(declare-fun m!954461 () Bool)

(assert (=> b!1033909 m!954461))

(assert (=> b!1033910 m!954461))

(assert (=> d!124165 m!954411))

(assert (=> d!124151 d!124165))

(declare-fun b!1033912 () Bool)

(declare-fun e!584325 () Bool)

(assert (=> b!1033912 (= e!584325 tp_is_empty!24451)))

(declare-fun mapNonEmpty!38144 () Bool)

(declare-fun mapRes!38144 () Bool)

(declare-fun tp!73284 () Bool)

(assert (=> mapNonEmpty!38144 (= mapRes!38144 (and tp!73284 e!584325))))

(declare-fun mapValue!38144 () ValueCell!11522)

(declare-fun mapRest!38144 () (Array (_ BitVec 32) ValueCell!11522))

(declare-fun mapKey!38144 () (_ BitVec 32))

(assert (=> mapNonEmpty!38144 (= mapRest!38143 (store mapRest!38144 mapKey!38144 mapValue!38144))))

(declare-fun mapIsEmpty!38144 () Bool)

(assert (=> mapIsEmpty!38144 mapRes!38144))

(declare-fun b!1033913 () Bool)

(declare-fun e!584326 () Bool)

(assert (=> b!1033913 (= e!584326 tp_is_empty!24451)))

(declare-fun condMapEmpty!38144 () Bool)

(declare-fun mapDefault!38144 () ValueCell!11522)

(assert (=> mapNonEmpty!38143 (= condMapEmpty!38144 (= mapRest!38143 ((as const (Array (_ BitVec 32) ValueCell!11522)) mapDefault!38144)))))

(assert (=> mapNonEmpty!38143 (= tp!73283 (and e!584326 mapRes!38144))))

(assert (= (and mapNonEmpty!38143 condMapEmpty!38144) mapIsEmpty!38144))

(assert (= (and mapNonEmpty!38143 (not condMapEmpty!38144)) mapNonEmpty!38144))

(assert (= (and mapNonEmpty!38144 ((_ is ValueCellFull!11522) mapValue!38144)) b!1033912))

(assert (= (and mapNonEmpty!38143 ((_ is ValueCellFull!11522) mapDefault!38144)) b!1033913))

(declare-fun m!954463 () Bool)

(assert (=> mapNonEmpty!38144 m!954463))

(check-sat (not bm!43672) b_and!33209 (not b!1033872) (not b!1033884) (not mapNonEmpty!38144) tp_is_empty!24451 (not b!1033885) (not b!1033875) (not b!1033910) (not b!1033873) (not b!1033909) (not bm!43669) (not b_next!20731) (not b!1033898) (not bm!43666) (not d!124165))
(check-sat b_and!33209 (not b_next!20731))
