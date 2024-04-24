; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90454 () Bool)

(assert start!90454)

(declare-fun b!1034276 () Bool)

(declare-fun b_free!20755 () Bool)

(declare-fun b_next!20755 () Bool)

(assert (=> b!1034276 (= b_free!20755 (not b_next!20755))))

(declare-fun tp!73354 () Bool)

(declare-fun b_and!33233 () Bool)

(assert (=> b!1034276 (= tp!73354 b_and!33233)))

(declare-fun mapNonEmpty!38185 () Bool)

(declare-fun mapRes!38185 () Bool)

(declare-fun tp!73355 () Bool)

(declare-fun e!584595 () Bool)

(assert (=> mapNonEmpty!38185 (= mapRes!38185 (and tp!73355 e!584595))))

(declare-datatypes ((V!37507 0))(
  ( (V!37508 (val!12288 Int)) )
))
(declare-datatypes ((ValueCell!11534 0))(
  ( (ValueCellFull!11534 (v!14861 V!37507)) (EmptyCell!11534) )
))
(declare-fun mapValue!38185 () ValueCell!11534)

(declare-fun mapRest!38185 () (Array (_ BitVec 32) ValueCell!11534))

(declare-fun mapKey!38185 () (_ BitVec 32))

(declare-datatypes ((array!65073 0))(
  ( (array!65074 (arr!31327 (Array (_ BitVec 32) (_ BitVec 64))) (size!31849 (_ BitVec 32))) )
))
(declare-datatypes ((array!65075 0))(
  ( (array!65076 (arr!31328 (Array (_ BitVec 32) ValueCell!11534)) (size!31850 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5662 0))(
  ( (LongMapFixedSize!5663 (defaultEntry!6205 Int) (mask!30102 (_ BitVec 32)) (extraKeys!5937 (_ BitVec 32)) (zeroValue!6041 V!37507) (minValue!6041 V!37507) (_size!2886 (_ BitVec 32)) (_keys!11420 array!65073) (_values!6228 array!65075) (_vacant!2886 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5662)

(assert (=> mapNonEmpty!38185 (= (arr!31328 (_values!6228 thiss!1427)) (store mapRest!38185 mapKey!38185 mapValue!38185))))

(declare-fun res!690795 () Bool)

(declare-fun e!584592 () Bool)

(assert (=> start!90454 (=> (not res!690795) (not e!584592))))

(declare-fun valid!2147 (LongMapFixedSize!5662) Bool)

(assert (=> start!90454 (= res!690795 (valid!2147 thiss!1427))))

(assert (=> start!90454 e!584592))

(declare-fun e!584596 () Bool)

(assert (=> start!90454 e!584596))

(assert (=> start!90454 true))

(declare-fun b!1034274 () Bool)

(declare-fun res!690796 () Bool)

(assert (=> b!1034274 (=> (not res!690796) (not e!584592))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034274 (= res!690796 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034275 () Bool)

(declare-fun tp_is_empty!24475 () Bool)

(assert (=> b!1034275 (= e!584595 tp_is_empty!24475)))

(declare-fun e!584597 () Bool)

(declare-fun array_inv!24251 (array!65073) Bool)

(declare-fun array_inv!24252 (array!65075) Bool)

(assert (=> b!1034276 (= e!584596 (and tp!73354 tp_is_empty!24475 (array_inv!24251 (_keys!11420 thiss!1427)) (array_inv!24252 (_values!6228 thiss!1427)) e!584597))))

(declare-fun b!1034277 () Bool)

(declare-fun res!690797 () Bool)

(assert (=> b!1034277 (=> (not res!690797) (not e!584592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034277 (= res!690797 (validMask!0 (mask!30102 thiss!1427)))))

(declare-fun mapIsEmpty!38185 () Bool)

(assert (=> mapIsEmpty!38185 mapRes!38185))

(declare-fun b!1034278 () Bool)

(declare-fun e!584593 () Bool)

(assert (=> b!1034278 (= e!584593 tp_is_empty!24475)))

(declare-fun b!1034279 () Bool)

(assert (=> b!1034279 (= e!584597 (and e!584593 mapRes!38185))))

(declare-fun condMapEmpty!38185 () Bool)

(declare-fun mapDefault!38185 () ValueCell!11534)

(assert (=> b!1034279 (= condMapEmpty!38185 (= (arr!31328 (_values!6228 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11534)) mapDefault!38185)))))

(declare-fun b!1034280 () Bool)

(assert (=> b!1034280 (= e!584592 (and (= (size!31850 (_values!6228 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30102 thiss!1427))) (= (size!31849 (_keys!11420 thiss!1427)) (size!31850 (_values!6228 thiss!1427))) (bvsge (mask!30102 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5937 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5937 thiss!1427) #b00000000000000000000000000000011)))))

(assert (= (and start!90454 res!690795) b!1034274))

(assert (= (and b!1034274 res!690796) b!1034277))

(assert (= (and b!1034277 res!690797) b!1034280))

(assert (= (and b!1034279 condMapEmpty!38185) mapIsEmpty!38185))

(assert (= (and b!1034279 (not condMapEmpty!38185)) mapNonEmpty!38185))

(get-info :version)

(assert (= (and mapNonEmpty!38185 ((_ is ValueCellFull!11534) mapValue!38185)) b!1034275))

(assert (= (and b!1034279 ((_ is ValueCellFull!11534) mapDefault!38185)) b!1034278))

(assert (= b!1034276 b!1034279))

(assert (= start!90454 b!1034276))

(declare-fun m!954629 () Bool)

(assert (=> mapNonEmpty!38185 m!954629))

(declare-fun m!954631 () Bool)

(assert (=> start!90454 m!954631))

(declare-fun m!954633 () Bool)

(assert (=> b!1034276 m!954633))

(declare-fun m!954635 () Bool)

(assert (=> b!1034276 m!954635))

(declare-fun m!954637 () Bool)

(assert (=> b!1034277 m!954637))

(check-sat tp_is_empty!24475 (not mapNonEmpty!38185) (not b!1034276) (not start!90454) b_and!33233 (not b_next!20755) (not b!1034277))
(check-sat b_and!33233 (not b_next!20755))
(get-model)

(declare-fun d!124215 () Bool)

(assert (=> d!124215 (= (array_inv!24251 (_keys!11420 thiss!1427)) (bvsge (size!31849 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034276 d!124215))

(declare-fun d!124217 () Bool)

(assert (=> d!124217 (= (array_inv!24252 (_values!6228 thiss!1427)) (bvsge (size!31850 (_values!6228 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034276 d!124217))

(declare-fun d!124219 () Bool)

(declare-fun res!690822 () Bool)

(declare-fun e!584636 () Bool)

(assert (=> d!124219 (=> (not res!690822) (not e!584636))))

(declare-fun simpleValid!402 (LongMapFixedSize!5662) Bool)

(assert (=> d!124219 (= res!690822 (simpleValid!402 thiss!1427))))

(assert (=> d!124219 (= (valid!2147 thiss!1427) e!584636)))

(declare-fun b!1034329 () Bool)

(declare-fun res!690823 () Bool)

(assert (=> b!1034329 (=> (not res!690823) (not e!584636))))

(declare-fun arrayCountValidKeys!0 (array!65073 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034329 (= res!690823 (= (arrayCountValidKeys!0 (_keys!11420 thiss!1427) #b00000000000000000000000000000000 (size!31849 (_keys!11420 thiss!1427))) (_size!2886 thiss!1427)))))

(declare-fun b!1034330 () Bool)

(declare-fun res!690824 () Bool)

(assert (=> b!1034330 (=> (not res!690824) (not e!584636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65073 (_ BitVec 32)) Bool)

(assert (=> b!1034330 (= res!690824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11420 thiss!1427) (mask!30102 thiss!1427)))))

(declare-fun b!1034331 () Bool)

(declare-datatypes ((List!21887 0))(
  ( (Nil!21884) (Cons!21883 (h!23094 (_ BitVec 64)) (t!31073 List!21887)) )
))
(declare-fun arrayNoDuplicates!0 (array!65073 (_ BitVec 32) List!21887) Bool)

(assert (=> b!1034331 (= e!584636 (arrayNoDuplicates!0 (_keys!11420 thiss!1427) #b00000000000000000000000000000000 Nil!21884))))

(assert (= (and d!124219 res!690822) b!1034329))

(assert (= (and b!1034329 res!690823) b!1034330))

(assert (= (and b!1034330 res!690824) b!1034331))

(declare-fun m!954659 () Bool)

(assert (=> d!124219 m!954659))

(declare-fun m!954661 () Bool)

(assert (=> b!1034329 m!954661))

(declare-fun m!954663 () Bool)

(assert (=> b!1034330 m!954663))

(declare-fun m!954665 () Bool)

(assert (=> b!1034331 m!954665))

(assert (=> start!90454 d!124219))

(declare-fun d!124221 () Bool)

(assert (=> d!124221 (= (validMask!0 (mask!30102 thiss!1427)) (and (or (= (mask!30102 thiss!1427) #b00000000000000000000000000000111) (= (mask!30102 thiss!1427) #b00000000000000000000000000001111) (= (mask!30102 thiss!1427) #b00000000000000000000000000011111) (= (mask!30102 thiss!1427) #b00000000000000000000000000111111) (= (mask!30102 thiss!1427) #b00000000000000000000000001111111) (= (mask!30102 thiss!1427) #b00000000000000000000000011111111) (= (mask!30102 thiss!1427) #b00000000000000000000000111111111) (= (mask!30102 thiss!1427) #b00000000000000000000001111111111) (= (mask!30102 thiss!1427) #b00000000000000000000011111111111) (= (mask!30102 thiss!1427) #b00000000000000000000111111111111) (= (mask!30102 thiss!1427) #b00000000000000000001111111111111) (= (mask!30102 thiss!1427) #b00000000000000000011111111111111) (= (mask!30102 thiss!1427) #b00000000000000000111111111111111) (= (mask!30102 thiss!1427) #b00000000000000001111111111111111) (= (mask!30102 thiss!1427) #b00000000000000011111111111111111) (= (mask!30102 thiss!1427) #b00000000000000111111111111111111) (= (mask!30102 thiss!1427) #b00000000000001111111111111111111) (= (mask!30102 thiss!1427) #b00000000000011111111111111111111) (= (mask!30102 thiss!1427) #b00000000000111111111111111111111) (= (mask!30102 thiss!1427) #b00000000001111111111111111111111) (= (mask!30102 thiss!1427) #b00000000011111111111111111111111) (= (mask!30102 thiss!1427) #b00000000111111111111111111111111) (= (mask!30102 thiss!1427) #b00000001111111111111111111111111) (= (mask!30102 thiss!1427) #b00000011111111111111111111111111) (= (mask!30102 thiss!1427) #b00000111111111111111111111111111) (= (mask!30102 thiss!1427) #b00001111111111111111111111111111) (= (mask!30102 thiss!1427) #b00011111111111111111111111111111) (= (mask!30102 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30102 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034277 d!124221))

(declare-fun b!1034339 () Bool)

(declare-fun e!584642 () Bool)

(assert (=> b!1034339 (= e!584642 tp_is_empty!24475)))

(declare-fun condMapEmpty!38194 () Bool)

(declare-fun mapDefault!38194 () ValueCell!11534)

(assert (=> mapNonEmpty!38185 (= condMapEmpty!38194 (= mapRest!38185 ((as const (Array (_ BitVec 32) ValueCell!11534)) mapDefault!38194)))))

(declare-fun mapRes!38194 () Bool)

(assert (=> mapNonEmpty!38185 (= tp!73355 (and e!584642 mapRes!38194))))

(declare-fun b!1034338 () Bool)

(declare-fun e!584641 () Bool)

(assert (=> b!1034338 (= e!584641 tp_is_empty!24475)))

(declare-fun mapNonEmpty!38194 () Bool)

(declare-fun tp!73370 () Bool)

(assert (=> mapNonEmpty!38194 (= mapRes!38194 (and tp!73370 e!584641))))

(declare-fun mapRest!38194 () (Array (_ BitVec 32) ValueCell!11534))

(declare-fun mapKey!38194 () (_ BitVec 32))

(declare-fun mapValue!38194 () ValueCell!11534)

(assert (=> mapNonEmpty!38194 (= mapRest!38185 (store mapRest!38194 mapKey!38194 mapValue!38194))))

(declare-fun mapIsEmpty!38194 () Bool)

(assert (=> mapIsEmpty!38194 mapRes!38194))

(assert (= (and mapNonEmpty!38185 condMapEmpty!38194) mapIsEmpty!38194))

(assert (= (and mapNonEmpty!38185 (not condMapEmpty!38194)) mapNonEmpty!38194))

(assert (= (and mapNonEmpty!38194 ((_ is ValueCellFull!11534) mapValue!38194)) b!1034338))

(assert (= (and mapNonEmpty!38185 ((_ is ValueCellFull!11534) mapDefault!38194)) b!1034339))

(declare-fun m!954667 () Bool)

(assert (=> mapNonEmpty!38194 m!954667))

(check-sat (not b!1034330) (not mapNonEmpty!38194) b_and!33233 (not b_next!20755) (not b!1034331) (not b!1034329) (not d!124219) tp_is_empty!24475)
(check-sat b_and!33233 (not b_next!20755))
(get-model)

(declare-fun b!1034348 () Bool)

(declare-fun e!584650 () Bool)

(declare-fun e!584651 () Bool)

(assert (=> b!1034348 (= e!584650 e!584651)))

(declare-fun c!104762 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034348 (= c!104762 (validKeyInArray!0 (select (arr!31327 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034349 () Bool)

(declare-fun e!584649 () Bool)

(assert (=> b!1034349 (= e!584651 e!584649)))

(declare-fun lt!456601 () (_ BitVec 64))

(assert (=> b!1034349 (= lt!456601 (select (arr!31327 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33831 0))(
  ( (Unit!33832) )
))
(declare-fun lt!456599 () Unit!33831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65073 (_ BitVec 64) (_ BitVec 32)) Unit!33831)

(assert (=> b!1034349 (= lt!456599 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11420 thiss!1427) lt!456601 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034349 (arrayContainsKey!0 (_keys!11420 thiss!1427) lt!456601 #b00000000000000000000000000000000)))

(declare-fun lt!456600 () Unit!33831)

(assert (=> b!1034349 (= lt!456600 lt!456599)))

(declare-fun res!690829 () Bool)

(declare-datatypes ((SeekEntryResult!9692 0))(
  ( (MissingZero!9692 (index!41139 (_ BitVec 32))) (Found!9692 (index!41140 (_ BitVec 32))) (Intermediate!9692 (undefined!10504 Bool) (index!41141 (_ BitVec 32)) (x!92096 (_ BitVec 32))) (Undefined!9692) (MissingVacant!9692 (index!41142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65073 (_ BitVec 32)) SeekEntryResult!9692)

(assert (=> b!1034349 (= res!690829 (= (seekEntryOrOpen!0 (select (arr!31327 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000) (_keys!11420 thiss!1427) (mask!30102 thiss!1427)) (Found!9692 #b00000000000000000000000000000000)))))

(assert (=> b!1034349 (=> (not res!690829) (not e!584649))))

(declare-fun bm!43693 () Bool)

(declare-fun call!43696 () Bool)

(assert (=> bm!43693 (= call!43696 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11420 thiss!1427) (mask!30102 thiss!1427)))))

(declare-fun b!1034351 () Bool)

(assert (=> b!1034351 (= e!584651 call!43696)))

(declare-fun d!124223 () Bool)

(declare-fun res!690830 () Bool)

(assert (=> d!124223 (=> res!690830 e!584650)))

(assert (=> d!124223 (= res!690830 (bvsge #b00000000000000000000000000000000 (size!31849 (_keys!11420 thiss!1427))))))

(assert (=> d!124223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11420 thiss!1427) (mask!30102 thiss!1427)) e!584650)))

(declare-fun b!1034350 () Bool)

(assert (=> b!1034350 (= e!584649 call!43696)))

(assert (= (and d!124223 (not res!690830)) b!1034348))

(assert (= (and b!1034348 c!104762) b!1034349))

(assert (= (and b!1034348 (not c!104762)) b!1034351))

(assert (= (and b!1034349 res!690829) b!1034350))

(assert (= (or b!1034350 b!1034351) bm!43693))

(declare-fun m!954669 () Bool)

(assert (=> b!1034348 m!954669))

(assert (=> b!1034348 m!954669))

(declare-fun m!954671 () Bool)

(assert (=> b!1034348 m!954671))

(assert (=> b!1034349 m!954669))

(declare-fun m!954673 () Bool)

(assert (=> b!1034349 m!954673))

(declare-fun m!954675 () Bool)

(assert (=> b!1034349 m!954675))

(assert (=> b!1034349 m!954669))

(declare-fun m!954677 () Bool)

(assert (=> b!1034349 m!954677))

(declare-fun m!954679 () Bool)

(assert (=> bm!43693 m!954679))

(assert (=> b!1034330 d!124223))

(declare-fun bm!43696 () Bool)

(declare-fun call!43699 () Bool)

(declare-fun c!104765 () Bool)

(assert (=> bm!43696 (= call!43699 (arrayNoDuplicates!0 (_keys!11420 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104765 (Cons!21883 (select (arr!31327 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000) Nil!21884) Nil!21884)))))

(declare-fun d!124225 () Bool)

(declare-fun res!690839 () Bool)

(declare-fun e!584663 () Bool)

(assert (=> d!124225 (=> res!690839 e!584663)))

(assert (=> d!124225 (= res!690839 (bvsge #b00000000000000000000000000000000 (size!31849 (_keys!11420 thiss!1427))))))

(assert (=> d!124225 (= (arrayNoDuplicates!0 (_keys!11420 thiss!1427) #b00000000000000000000000000000000 Nil!21884) e!584663)))

(declare-fun b!1034362 () Bool)

(declare-fun e!584662 () Bool)

(assert (=> b!1034362 (= e!584663 e!584662)))

(declare-fun res!690838 () Bool)

(assert (=> b!1034362 (=> (not res!690838) (not e!584662))))

(declare-fun e!584661 () Bool)

(assert (=> b!1034362 (= res!690838 (not e!584661))))

(declare-fun res!690837 () Bool)

(assert (=> b!1034362 (=> (not res!690837) (not e!584661))))

(assert (=> b!1034362 (= res!690837 (validKeyInArray!0 (select (arr!31327 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034363 () Bool)

(declare-fun e!584660 () Bool)

(assert (=> b!1034363 (= e!584660 call!43699)))

(declare-fun b!1034364 () Bool)

(assert (=> b!1034364 (= e!584660 call!43699)))

(declare-fun b!1034365 () Bool)

(assert (=> b!1034365 (= e!584662 e!584660)))

(assert (=> b!1034365 (= c!104765 (validKeyInArray!0 (select (arr!31327 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034366 () Bool)

(declare-fun contains!6035 (List!21887 (_ BitVec 64)) Bool)

(assert (=> b!1034366 (= e!584661 (contains!6035 Nil!21884 (select (arr!31327 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124225 (not res!690839)) b!1034362))

(assert (= (and b!1034362 res!690837) b!1034366))

(assert (= (and b!1034362 res!690838) b!1034365))

(assert (= (and b!1034365 c!104765) b!1034364))

(assert (= (and b!1034365 (not c!104765)) b!1034363))

(assert (= (or b!1034364 b!1034363) bm!43696))

(assert (=> bm!43696 m!954669))

(declare-fun m!954681 () Bool)

(assert (=> bm!43696 m!954681))

(assert (=> b!1034362 m!954669))

(assert (=> b!1034362 m!954669))

(assert (=> b!1034362 m!954671))

(assert (=> b!1034365 m!954669))

(assert (=> b!1034365 m!954669))

(assert (=> b!1034365 m!954671))

(assert (=> b!1034366 m!954669))

(assert (=> b!1034366 m!954669))

(declare-fun m!954683 () Bool)

(assert (=> b!1034366 m!954683))

(assert (=> b!1034331 d!124225))

(declare-fun b!1034375 () Bool)

(declare-fun e!584668 () (_ BitVec 32))

(declare-fun e!584669 () (_ BitVec 32))

(assert (=> b!1034375 (= e!584668 e!584669)))

(declare-fun c!104771 () Bool)

(assert (=> b!1034375 (= c!104771 (validKeyInArray!0 (select (arr!31327 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034376 () Bool)

(declare-fun call!43702 () (_ BitVec 32))

(assert (=> b!1034376 (= e!584669 (bvadd #b00000000000000000000000000000001 call!43702))))

(declare-fun b!1034377 () Bool)

(assert (=> b!1034377 (= e!584669 call!43702)))

(declare-fun bm!43699 () Bool)

(assert (=> bm!43699 (= call!43702 (arrayCountValidKeys!0 (_keys!11420 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31849 (_keys!11420 thiss!1427))))))

(declare-fun d!124227 () Bool)

(declare-fun lt!456604 () (_ BitVec 32))

(assert (=> d!124227 (and (bvsge lt!456604 #b00000000000000000000000000000000) (bvsle lt!456604 (bvsub (size!31849 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124227 (= lt!456604 e!584668)))

(declare-fun c!104770 () Bool)

(assert (=> d!124227 (= c!104770 (bvsge #b00000000000000000000000000000000 (size!31849 (_keys!11420 thiss!1427))))))

(assert (=> d!124227 (and (bvsle #b00000000000000000000000000000000 (size!31849 (_keys!11420 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31849 (_keys!11420 thiss!1427)) (size!31849 (_keys!11420 thiss!1427))))))

(assert (=> d!124227 (= (arrayCountValidKeys!0 (_keys!11420 thiss!1427) #b00000000000000000000000000000000 (size!31849 (_keys!11420 thiss!1427))) lt!456604)))

(declare-fun b!1034378 () Bool)

(assert (=> b!1034378 (= e!584668 #b00000000000000000000000000000000)))

(assert (= (and d!124227 c!104770) b!1034378))

(assert (= (and d!124227 (not c!104770)) b!1034375))

(assert (= (and b!1034375 c!104771) b!1034376))

(assert (= (and b!1034375 (not c!104771)) b!1034377))

(assert (= (or b!1034376 b!1034377) bm!43699))

(assert (=> b!1034375 m!954669))

(assert (=> b!1034375 m!954669))

(assert (=> b!1034375 m!954671))

(declare-fun m!954685 () Bool)

(assert (=> bm!43699 m!954685))

(assert (=> b!1034329 d!124227))

(declare-fun d!124229 () Bool)

(declare-fun res!690849 () Bool)

(declare-fun e!584672 () Bool)

(assert (=> d!124229 (=> (not res!690849) (not e!584672))))

(assert (=> d!124229 (= res!690849 (validMask!0 (mask!30102 thiss!1427)))))

(assert (=> d!124229 (= (simpleValid!402 thiss!1427) e!584672)))

(declare-fun b!1034390 () Bool)

(assert (=> b!1034390 (= e!584672 (and (bvsge (extraKeys!5937 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5937 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2886 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1034389 () Bool)

(declare-fun res!690848 () Bool)

(assert (=> b!1034389 (=> (not res!690848) (not e!584672))))

(declare-fun size!31855 (LongMapFixedSize!5662) (_ BitVec 32))

(assert (=> b!1034389 (= res!690848 (= (size!31855 thiss!1427) (bvadd (_size!2886 thiss!1427) (bvsdiv (bvadd (extraKeys!5937 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1034388 () Bool)

(declare-fun res!690851 () Bool)

(assert (=> b!1034388 (=> (not res!690851) (not e!584672))))

(assert (=> b!1034388 (= res!690851 (bvsge (size!31855 thiss!1427) (_size!2886 thiss!1427)))))

(declare-fun b!1034387 () Bool)

(declare-fun res!690850 () Bool)

(assert (=> b!1034387 (=> (not res!690850) (not e!584672))))

(assert (=> b!1034387 (= res!690850 (and (= (size!31850 (_values!6228 thiss!1427)) (bvadd (mask!30102 thiss!1427) #b00000000000000000000000000000001)) (= (size!31849 (_keys!11420 thiss!1427)) (size!31850 (_values!6228 thiss!1427))) (bvsge (_size!2886 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2886 thiss!1427) (bvadd (mask!30102 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!124229 res!690849) b!1034387))

(assert (= (and b!1034387 res!690850) b!1034388))

(assert (= (and b!1034388 res!690851) b!1034389))

(assert (= (and b!1034389 res!690848) b!1034390))

(assert (=> d!124229 m!954637))

(declare-fun m!954687 () Bool)

(assert (=> b!1034389 m!954687))

(assert (=> b!1034388 m!954687))

(assert (=> d!124219 d!124229))

(declare-fun b!1034392 () Bool)

(declare-fun e!584674 () Bool)

(assert (=> b!1034392 (= e!584674 tp_is_empty!24475)))

(declare-fun condMapEmpty!38195 () Bool)

(declare-fun mapDefault!38195 () ValueCell!11534)

(assert (=> mapNonEmpty!38194 (= condMapEmpty!38195 (= mapRest!38194 ((as const (Array (_ BitVec 32) ValueCell!11534)) mapDefault!38195)))))

(declare-fun mapRes!38195 () Bool)

(assert (=> mapNonEmpty!38194 (= tp!73370 (and e!584674 mapRes!38195))))

(declare-fun b!1034391 () Bool)

(declare-fun e!584673 () Bool)

(assert (=> b!1034391 (= e!584673 tp_is_empty!24475)))

(declare-fun mapNonEmpty!38195 () Bool)

(declare-fun tp!73371 () Bool)

(assert (=> mapNonEmpty!38195 (= mapRes!38195 (and tp!73371 e!584673))))

(declare-fun mapKey!38195 () (_ BitVec 32))

(declare-fun mapRest!38195 () (Array (_ BitVec 32) ValueCell!11534))

(declare-fun mapValue!38195 () ValueCell!11534)

(assert (=> mapNonEmpty!38195 (= mapRest!38194 (store mapRest!38195 mapKey!38195 mapValue!38195))))

(declare-fun mapIsEmpty!38195 () Bool)

(assert (=> mapIsEmpty!38195 mapRes!38195))

(assert (= (and mapNonEmpty!38194 condMapEmpty!38195) mapIsEmpty!38195))

(assert (= (and mapNonEmpty!38194 (not condMapEmpty!38195)) mapNonEmpty!38195))

(assert (= (and mapNonEmpty!38195 ((_ is ValueCellFull!11534) mapValue!38195)) b!1034391))

(assert (= (and mapNonEmpty!38194 ((_ is ValueCellFull!11534) mapDefault!38195)) b!1034392))

(declare-fun m!954689 () Bool)

(assert (=> mapNonEmpty!38195 m!954689))

(check-sat tp_is_empty!24475 (not b!1034349) (not b!1034366) (not bm!43696) (not b!1034375) b_and!33233 (not b_next!20755) (not mapNonEmpty!38195) (not b!1034365) (not d!124229) (not b!1034348) (not b!1034389) (not bm!43699) (not b!1034362) (not bm!43693) (not b!1034388))
(check-sat b_and!33233 (not b_next!20755))
