; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90264 () Bool)

(assert start!90264)

(declare-fun b!1033197 () Bool)

(declare-fun b_free!20785 () Bool)

(declare-fun b_next!20785 () Bool)

(assert (=> b!1033197 (= b_free!20785 (not b_next!20785))))

(declare-fun tp!73448 () Bool)

(declare-fun b_and!33227 () Bool)

(assert (=> b!1033197 (= tp!73448 b_and!33227)))

(declare-fun b!1033195 () Bool)

(declare-fun res!690392 () Bool)

(declare-fun e!583974 () Bool)

(assert (=> b!1033195 (=> (not res!690392) (not e!583974))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033195 (= res!690392 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033196 () Bool)

(declare-fun e!583970 () Bool)

(declare-fun tp_is_empty!24505 () Bool)

(assert (=> b!1033196 (= e!583970 tp_is_empty!24505)))

(declare-fun e!583969 () Bool)

(declare-fun e!583971 () Bool)

(declare-datatypes ((V!37547 0))(
  ( (V!37548 (val!12303 Int)) )
))
(declare-datatypes ((ValueCell!11549 0))(
  ( (ValueCellFull!11549 (v!14879 V!37547)) (EmptyCell!11549) )
))
(declare-datatypes ((array!65025 0))(
  ( (array!65026 (arr!31308 (Array (_ BitVec 32) (_ BitVec 64))) (size!31832 (_ BitVec 32))) )
))
(declare-datatypes ((array!65027 0))(
  ( (array!65028 (arr!31309 (Array (_ BitVec 32) ValueCell!11549)) (size!31833 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5692 0))(
  ( (LongMapFixedSize!5693 (defaultEntry!6220 Int) (mask!30064 (_ BitVec 32)) (extraKeys!5952 (_ BitVec 32)) (zeroValue!6056 V!37547) (minValue!6056 V!37547) (_size!2901 (_ BitVec 32)) (_keys!11394 array!65025) (_values!6243 array!65027) (_vacant!2901 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5692)

(declare-fun array_inv!24223 (array!65025) Bool)

(declare-fun array_inv!24224 (array!65027) Bool)

(assert (=> b!1033197 (= e!583969 (and tp!73448 tp_is_empty!24505 (array_inv!24223 (_keys!11394 thiss!1427)) (array_inv!24224 (_values!6243 thiss!1427)) e!583971))))

(declare-fun b!1033198 () Bool)

(declare-fun e!583972 () Bool)

(declare-fun mapRes!38234 () Bool)

(assert (=> b!1033198 (= e!583971 (and e!583972 mapRes!38234))))

(declare-fun condMapEmpty!38234 () Bool)

(declare-fun mapDefault!38234 () ValueCell!11549)

(assert (=> b!1033198 (= condMapEmpty!38234 (= (arr!31309 (_values!6243 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11549)) mapDefault!38234)))))

(declare-fun mapIsEmpty!38234 () Bool)

(assert (=> mapIsEmpty!38234 mapRes!38234))

(declare-fun b!1033199 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65025 (_ BitVec 32)) Bool)

(assert (=> b!1033199 (= e!583974 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11394 thiss!1427) (mask!30064 thiss!1427))))))

(declare-fun mapNonEmpty!38234 () Bool)

(declare-fun tp!73449 () Bool)

(assert (=> mapNonEmpty!38234 (= mapRes!38234 (and tp!73449 e!583970))))

(declare-fun mapRest!38234 () (Array (_ BitVec 32) ValueCell!11549))

(declare-fun mapValue!38234 () ValueCell!11549)

(declare-fun mapKey!38234 () (_ BitVec 32))

(assert (=> mapNonEmpty!38234 (= (arr!31309 (_values!6243 thiss!1427)) (store mapRest!38234 mapKey!38234 mapValue!38234))))

(declare-fun b!1033200 () Bool)

(declare-fun res!690391 () Bool)

(assert (=> b!1033200 (=> (not res!690391) (not e!583974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033200 (= res!690391 (validMask!0 (mask!30064 thiss!1427)))))

(declare-fun b!1033201 () Bool)

(declare-fun res!690393 () Bool)

(assert (=> b!1033201 (=> (not res!690393) (not e!583974))))

(assert (=> b!1033201 (= res!690393 (and (= (size!31833 (_values!6243 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30064 thiss!1427))) (= (size!31832 (_keys!11394 thiss!1427)) (size!31833 (_values!6243 thiss!1427))) (bvsge (mask!30064 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5952 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5952 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033202 () Bool)

(assert (=> b!1033202 (= e!583972 tp_is_empty!24505)))

(declare-fun res!690394 () Bool)

(assert (=> start!90264 (=> (not res!690394) (not e!583974))))

(declare-fun valid!2140 (LongMapFixedSize!5692) Bool)

(assert (=> start!90264 (= res!690394 (valid!2140 thiss!1427))))

(assert (=> start!90264 e!583974))

(assert (=> start!90264 e!583969))

(assert (=> start!90264 true))

(assert (= (and start!90264 res!690394) b!1033195))

(assert (= (and b!1033195 res!690392) b!1033200))

(assert (= (and b!1033200 res!690391) b!1033201))

(assert (= (and b!1033201 res!690393) b!1033199))

(assert (= (and b!1033198 condMapEmpty!38234) mapIsEmpty!38234))

(assert (= (and b!1033198 (not condMapEmpty!38234)) mapNonEmpty!38234))

(get-info :version)

(assert (= (and mapNonEmpty!38234 ((_ is ValueCellFull!11549) mapValue!38234)) b!1033196))

(assert (= (and b!1033198 ((_ is ValueCellFull!11549) mapDefault!38234)) b!1033202))

(assert (= b!1033197 b!1033198))

(assert (= start!90264 b!1033197))

(declare-fun m!952527 () Bool)

(assert (=> start!90264 m!952527))

(declare-fun m!952529 () Bool)

(assert (=> b!1033199 m!952529))

(declare-fun m!952531 () Bool)

(assert (=> mapNonEmpty!38234 m!952531))

(declare-fun m!952533 () Bool)

(assert (=> b!1033200 m!952533))

(declare-fun m!952535 () Bool)

(assert (=> b!1033197 m!952535))

(declare-fun m!952537 () Bool)

(assert (=> b!1033197 m!952537))

(check-sat (not b_next!20785) (not start!90264) (not b!1033200) (not b!1033197) (not b!1033199) b_and!33227 tp_is_empty!24505 (not mapNonEmpty!38234))
(check-sat b_and!33227 (not b_next!20785))
(get-model)

(declare-fun d!123629 () Bool)

(declare-fun res!690423 () Bool)

(declare-fun e!584019 () Bool)

(assert (=> d!123629 (=> res!690423 e!584019)))

(assert (=> d!123629 (= res!690423 (bvsge #b00000000000000000000000000000000 (size!31832 (_keys!11394 thiss!1427))))))

(assert (=> d!123629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11394 thiss!1427) (mask!30064 thiss!1427)) e!584019)))

(declare-fun b!1033259 () Bool)

(declare-fun e!584017 () Bool)

(declare-fun call!43615 () Bool)

(assert (=> b!1033259 (= e!584017 call!43615)))

(declare-fun b!1033260 () Bool)

(declare-fun e!584018 () Bool)

(assert (=> b!1033260 (= e!584018 call!43615)))

(declare-fun b!1033261 () Bool)

(assert (=> b!1033261 (= e!584019 e!584018)))

(declare-fun c!104325 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033261 (= c!104325 (validKeyInArray!0 (select (arr!31308 (_keys!11394 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43612 () Bool)

(assert (=> bm!43612 (= call!43615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11394 thiss!1427) (mask!30064 thiss!1427)))))

(declare-fun b!1033262 () Bool)

(assert (=> b!1033262 (= e!584018 e!584017)))

(declare-fun lt!455898 () (_ BitVec 64))

(assert (=> b!1033262 (= lt!455898 (select (arr!31308 (_keys!11394 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33709 0))(
  ( (Unit!33710) )
))
(declare-fun lt!455897 () Unit!33709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65025 (_ BitVec 64) (_ BitVec 32)) Unit!33709)

(assert (=> b!1033262 (= lt!455897 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11394 thiss!1427) lt!455898 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033262 (arrayContainsKey!0 (_keys!11394 thiss!1427) lt!455898 #b00000000000000000000000000000000)))

(declare-fun lt!455896 () Unit!33709)

(assert (=> b!1033262 (= lt!455896 lt!455897)))

(declare-fun res!690424 () Bool)

(declare-datatypes ((SeekEntryResult!9727 0))(
  ( (MissingZero!9727 (index!41279 (_ BitVec 32))) (Found!9727 (index!41280 (_ BitVec 32))) (Intermediate!9727 (undefined!10539 Bool) (index!41281 (_ BitVec 32)) (x!92154 (_ BitVec 32))) (Undefined!9727) (MissingVacant!9727 (index!41282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65025 (_ BitVec 32)) SeekEntryResult!9727)

(assert (=> b!1033262 (= res!690424 (= (seekEntryOrOpen!0 (select (arr!31308 (_keys!11394 thiss!1427)) #b00000000000000000000000000000000) (_keys!11394 thiss!1427) (mask!30064 thiss!1427)) (Found!9727 #b00000000000000000000000000000000)))))

(assert (=> b!1033262 (=> (not res!690424) (not e!584017))))

(assert (= (and d!123629 (not res!690423)) b!1033261))

(assert (= (and b!1033261 c!104325) b!1033262))

(assert (= (and b!1033261 (not c!104325)) b!1033260))

(assert (= (and b!1033262 res!690424) b!1033259))

(assert (= (or b!1033259 b!1033260) bm!43612))

(declare-fun m!952563 () Bool)

(assert (=> b!1033261 m!952563))

(assert (=> b!1033261 m!952563))

(declare-fun m!952565 () Bool)

(assert (=> b!1033261 m!952565))

(declare-fun m!952567 () Bool)

(assert (=> bm!43612 m!952567))

(assert (=> b!1033262 m!952563))

(declare-fun m!952569 () Bool)

(assert (=> b!1033262 m!952569))

(declare-fun m!952571 () Bool)

(assert (=> b!1033262 m!952571))

(assert (=> b!1033262 m!952563))

(declare-fun m!952573 () Bool)

(assert (=> b!1033262 m!952573))

(assert (=> b!1033199 d!123629))

(declare-fun d!123631 () Bool)

(assert (=> d!123631 (= (validMask!0 (mask!30064 thiss!1427)) (and (or (= (mask!30064 thiss!1427) #b00000000000000000000000000000111) (= (mask!30064 thiss!1427) #b00000000000000000000000000001111) (= (mask!30064 thiss!1427) #b00000000000000000000000000011111) (= (mask!30064 thiss!1427) #b00000000000000000000000000111111) (= (mask!30064 thiss!1427) #b00000000000000000000000001111111) (= (mask!30064 thiss!1427) #b00000000000000000000000011111111) (= (mask!30064 thiss!1427) #b00000000000000000000000111111111) (= (mask!30064 thiss!1427) #b00000000000000000000001111111111) (= (mask!30064 thiss!1427) #b00000000000000000000011111111111) (= (mask!30064 thiss!1427) #b00000000000000000000111111111111) (= (mask!30064 thiss!1427) #b00000000000000000001111111111111) (= (mask!30064 thiss!1427) #b00000000000000000011111111111111) (= (mask!30064 thiss!1427) #b00000000000000000111111111111111) (= (mask!30064 thiss!1427) #b00000000000000001111111111111111) (= (mask!30064 thiss!1427) #b00000000000000011111111111111111) (= (mask!30064 thiss!1427) #b00000000000000111111111111111111) (= (mask!30064 thiss!1427) #b00000000000001111111111111111111) (= (mask!30064 thiss!1427) #b00000000000011111111111111111111) (= (mask!30064 thiss!1427) #b00000000000111111111111111111111) (= (mask!30064 thiss!1427) #b00000000001111111111111111111111) (= (mask!30064 thiss!1427) #b00000000011111111111111111111111) (= (mask!30064 thiss!1427) #b00000000111111111111111111111111) (= (mask!30064 thiss!1427) #b00000001111111111111111111111111) (= (mask!30064 thiss!1427) #b00000011111111111111111111111111) (= (mask!30064 thiss!1427) #b00000111111111111111111111111111) (= (mask!30064 thiss!1427) #b00001111111111111111111111111111) (= (mask!30064 thiss!1427) #b00011111111111111111111111111111) (= (mask!30064 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30064 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1033200 d!123631))

(declare-fun d!123633 () Bool)

(assert (=> d!123633 (= (array_inv!24223 (_keys!11394 thiss!1427)) (bvsge (size!31832 (_keys!11394 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033197 d!123633))

(declare-fun d!123635 () Bool)

(assert (=> d!123635 (= (array_inv!24224 (_values!6243 thiss!1427)) (bvsge (size!31833 (_values!6243 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033197 d!123635))

(declare-fun d!123637 () Bool)

(declare-fun res!690431 () Bool)

(declare-fun e!584022 () Bool)

(assert (=> d!123637 (=> (not res!690431) (not e!584022))))

(declare-fun simpleValid!403 (LongMapFixedSize!5692) Bool)

(assert (=> d!123637 (= res!690431 (simpleValid!403 thiss!1427))))

(assert (=> d!123637 (= (valid!2140 thiss!1427) e!584022)))

(declare-fun b!1033269 () Bool)

(declare-fun res!690432 () Bool)

(assert (=> b!1033269 (=> (not res!690432) (not e!584022))))

(declare-fun arrayCountValidKeys!0 (array!65025 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033269 (= res!690432 (= (arrayCountValidKeys!0 (_keys!11394 thiss!1427) #b00000000000000000000000000000000 (size!31832 (_keys!11394 thiss!1427))) (_size!2901 thiss!1427)))))

(declare-fun b!1033270 () Bool)

(declare-fun res!690433 () Bool)

(assert (=> b!1033270 (=> (not res!690433) (not e!584022))))

(assert (=> b!1033270 (= res!690433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11394 thiss!1427) (mask!30064 thiss!1427)))))

(declare-fun b!1033271 () Bool)

(declare-datatypes ((List!21937 0))(
  ( (Nil!21934) (Cons!21933 (h!23135 (_ BitVec 64)) (t!31122 List!21937)) )
))
(declare-fun arrayNoDuplicates!0 (array!65025 (_ BitVec 32) List!21937) Bool)

(assert (=> b!1033271 (= e!584022 (arrayNoDuplicates!0 (_keys!11394 thiss!1427) #b00000000000000000000000000000000 Nil!21934))))

(assert (= (and d!123637 res!690431) b!1033269))

(assert (= (and b!1033269 res!690432) b!1033270))

(assert (= (and b!1033270 res!690433) b!1033271))

(declare-fun m!952575 () Bool)

(assert (=> d!123637 m!952575))

(declare-fun m!952577 () Bool)

(assert (=> b!1033269 m!952577))

(assert (=> b!1033270 m!952529))

(declare-fun m!952579 () Bool)

(assert (=> b!1033271 m!952579))

(assert (=> start!90264 d!123637))

(declare-fun mapIsEmpty!38243 () Bool)

(declare-fun mapRes!38243 () Bool)

(assert (=> mapIsEmpty!38243 mapRes!38243))

(declare-fun b!1033279 () Bool)

(declare-fun e!584028 () Bool)

(assert (=> b!1033279 (= e!584028 tp_is_empty!24505)))

(declare-fun mapNonEmpty!38243 () Bool)

(declare-fun tp!73464 () Bool)

(declare-fun e!584027 () Bool)

(assert (=> mapNonEmpty!38243 (= mapRes!38243 (and tp!73464 e!584027))))

(declare-fun mapKey!38243 () (_ BitVec 32))

(declare-fun mapValue!38243 () ValueCell!11549)

(declare-fun mapRest!38243 () (Array (_ BitVec 32) ValueCell!11549))

(assert (=> mapNonEmpty!38243 (= mapRest!38234 (store mapRest!38243 mapKey!38243 mapValue!38243))))

(declare-fun b!1033278 () Bool)

(assert (=> b!1033278 (= e!584027 tp_is_empty!24505)))

(declare-fun condMapEmpty!38243 () Bool)

(declare-fun mapDefault!38243 () ValueCell!11549)

(assert (=> mapNonEmpty!38234 (= condMapEmpty!38243 (= mapRest!38234 ((as const (Array (_ BitVec 32) ValueCell!11549)) mapDefault!38243)))))

(assert (=> mapNonEmpty!38234 (= tp!73449 (and e!584028 mapRes!38243))))

(assert (= (and mapNonEmpty!38234 condMapEmpty!38243) mapIsEmpty!38243))

(assert (= (and mapNonEmpty!38234 (not condMapEmpty!38243)) mapNonEmpty!38243))

(assert (= (and mapNonEmpty!38243 ((_ is ValueCellFull!11549) mapValue!38243)) b!1033278))

(assert (= (and mapNonEmpty!38234 ((_ is ValueCellFull!11549) mapDefault!38243)) b!1033279))

(declare-fun m!952581 () Bool)

(assert (=> mapNonEmpty!38243 m!952581))

(check-sat (not b_next!20785) (not d!123637) (not b!1033271) b_and!33227 (not b!1033270) (not mapNonEmpty!38243) (not b!1033269) (not b!1033261) (not bm!43612) tp_is_empty!24505 (not b!1033262))
(check-sat b_and!33227 (not b_next!20785))
