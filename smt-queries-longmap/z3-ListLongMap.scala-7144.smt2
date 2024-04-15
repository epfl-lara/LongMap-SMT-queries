; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90780 () Bool)

(assert start!90780)

(declare-fun b!1037675 () Bool)

(declare-fun b_free!20917 () Bool)

(declare-fun b_next!20917 () Bool)

(assert (=> b!1037675 (= b_free!20917 (not b_next!20917))))

(declare-fun tp!73905 () Bool)

(declare-fun b_and!33423 () Bool)

(assert (=> b!1037675 (= tp!73905 b_and!33423)))

(declare-fun b!1037667 () Bool)

(declare-fun e!587047 () Bool)

(declare-fun e!587051 () Bool)

(assert (=> b!1037667 (= e!587047 e!587051)))

(declare-fun res!692302 () Bool)

(assert (=> b!1037667 (=> (not res!692302) (not e!587051))))

(declare-datatypes ((SeekEntryResult!9753 0))(
  ( (MissingZero!9753 (index!41383 (_ BitVec 32))) (Found!9753 (index!41384 (_ BitVec 32))) (Intermediate!9753 (undefined!10565 Bool) (index!41385 (_ BitVec 32)) (x!92589 (_ BitVec 32))) (Undefined!9753) (MissingVacant!9753 (index!41386 (_ BitVec 32))) )
))
(declare-fun lt!457389 () SeekEntryResult!9753)

(get-info :version)

(assert (=> b!1037667 (= res!692302 ((_ is Found!9753) lt!457389))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37723 0))(
  ( (V!37724 (val!12369 Int)) )
))
(declare-datatypes ((ValueCell!11615 0))(
  ( (ValueCellFull!11615 (v!14952 V!37723)) (EmptyCell!11615) )
))
(declare-datatypes ((array!65323 0))(
  ( (array!65324 (arr!31440 (Array (_ BitVec 32) (_ BitVec 64))) (size!31972 (_ BitVec 32))) )
))
(declare-datatypes ((array!65325 0))(
  ( (array!65326 (arr!31441 (Array (_ BitVec 32) ValueCell!11615)) (size!31973 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5824 0))(
  ( (LongMapFixedSize!5825 (defaultEntry!6294 Int) (mask!30217 (_ BitVec 32)) (extraKeys!6022 (_ BitVec 32)) (zeroValue!6128 V!37723) (minValue!6128 V!37723) (_size!2967 (_ BitVec 32)) (_keys!11489 array!65323) (_values!6317 array!65325) (_vacant!2967 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5824)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65323 (_ BitVec 32)) SeekEntryResult!9753)

(assert (=> b!1037667 (= lt!457389 (seekEntry!0 key!909 (_keys!11489 thiss!1427) (mask!30217 thiss!1427)))))

(declare-fun mapIsEmpty!38493 () Bool)

(declare-fun mapRes!38493 () Bool)

(assert (=> mapIsEmpty!38493 mapRes!38493))

(declare-fun b!1037668 () Bool)

(declare-fun e!587049 () Bool)

(assert (=> b!1037668 (= e!587051 (not e!587049))))

(declare-fun res!692305 () Bool)

(assert (=> b!1037668 (=> res!692305 e!587049)))

(assert (=> b!1037668 (= res!692305 (or (bvsge (size!31972 (_keys!11489 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65323 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037668 (= (arrayCountValidKeys!0 (array!65324 (store (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31972 (_keys!11489 thiss!1427))) #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11489 thiss!1427) #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33841 0))(
  ( (Unit!33842) )
))
(declare-fun lt!457390 () Unit!33841)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65323 (_ BitVec 32) (_ BitVec 64)) Unit!33841)

(assert (=> b!1037668 (= lt!457390 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11489 thiss!1427) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037669 () Bool)

(declare-fun e!587050 () Bool)

(declare-fun e!587052 () Bool)

(assert (=> b!1037669 (= e!587050 (and e!587052 mapRes!38493))))

(declare-fun condMapEmpty!38493 () Bool)

(declare-fun mapDefault!38493 () ValueCell!11615)

(assert (=> b!1037669 (= condMapEmpty!38493 (= (arr!31441 (_values!6317 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11615)) mapDefault!38493)))))

(declare-fun b!1037670 () Bool)

(declare-fun res!692301 () Bool)

(assert (=> b!1037670 (=> (not res!692301) (not e!587047))))

(assert (=> b!1037670 (= res!692301 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1037671 () Bool)

(declare-fun tp_is_empty!24637 () Bool)

(assert (=> b!1037671 (= e!587052 tp_is_empty!24637)))

(declare-fun b!1037666 () Bool)

(declare-fun res!692299 () Bool)

(assert (=> b!1037666 (=> res!692299 e!587049)))

(declare-datatypes ((List!21960 0))(
  ( (Nil!21957) (Cons!21956 (h!23159 (_ BitVec 64)) (t!31165 List!21960)) )
))
(declare-fun contains!6007 (List!21960 (_ BitVec 64)) Bool)

(assert (=> b!1037666 (= res!692299 (contains!6007 Nil!21957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!692304 () Bool)

(assert (=> start!90780 (=> (not res!692304) (not e!587047))))

(declare-fun valid!2186 (LongMapFixedSize!5824) Bool)

(assert (=> start!90780 (= res!692304 (valid!2186 thiss!1427))))

(assert (=> start!90780 e!587047))

(declare-fun e!587054 () Bool)

(assert (=> start!90780 e!587054))

(assert (=> start!90780 true))

(declare-fun b!1037672 () Bool)

(declare-fun res!692300 () Bool)

(assert (=> b!1037672 (=> res!692300 e!587049)))

(declare-fun noDuplicate!1489 (List!21960) Bool)

(assert (=> b!1037672 (= res!692300 (not (noDuplicate!1489 Nil!21957)))))

(declare-fun b!1037673 () Bool)

(declare-fun arrayNoDuplicates!0 (array!65323 (_ BitVec 32) List!21960) Bool)

(assert (=> b!1037673 (= e!587049 (arrayNoDuplicates!0 (_keys!11489 thiss!1427) #b00000000000000000000000000000000 Nil!21957))))

(declare-fun b!1037674 () Bool)

(declare-fun e!587053 () Bool)

(assert (=> b!1037674 (= e!587053 tp_is_empty!24637)))

(declare-fun mapNonEmpty!38493 () Bool)

(declare-fun tp!73906 () Bool)

(assert (=> mapNonEmpty!38493 (= mapRes!38493 (and tp!73906 e!587053))))

(declare-fun mapValue!38493 () ValueCell!11615)

(declare-fun mapKey!38493 () (_ BitVec 32))

(declare-fun mapRest!38493 () (Array (_ BitVec 32) ValueCell!11615))

(assert (=> mapNonEmpty!38493 (= (arr!31441 (_values!6317 thiss!1427)) (store mapRest!38493 mapKey!38493 mapValue!38493))))

(declare-fun array_inv!24311 (array!65323) Bool)

(declare-fun array_inv!24312 (array!65325) Bool)

(assert (=> b!1037675 (= e!587054 (and tp!73905 tp_is_empty!24637 (array_inv!24311 (_keys!11489 thiss!1427)) (array_inv!24312 (_values!6317 thiss!1427)) e!587050))))

(declare-fun b!1037676 () Bool)

(declare-fun res!692303 () Bool)

(assert (=> b!1037676 (=> res!692303 e!587049)))

(assert (=> b!1037676 (= res!692303 (contains!6007 Nil!21957 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90780 res!692304) b!1037670))

(assert (= (and b!1037670 res!692301) b!1037667))

(assert (= (and b!1037667 res!692302) b!1037668))

(assert (= (and b!1037668 (not res!692305)) b!1037672))

(assert (= (and b!1037672 (not res!692300)) b!1037666))

(assert (= (and b!1037666 (not res!692299)) b!1037676))

(assert (= (and b!1037676 (not res!692303)) b!1037673))

(assert (= (and b!1037669 condMapEmpty!38493) mapIsEmpty!38493))

(assert (= (and b!1037669 (not condMapEmpty!38493)) mapNonEmpty!38493))

(assert (= (and mapNonEmpty!38493 ((_ is ValueCellFull!11615) mapValue!38493)) b!1037674))

(assert (= (and b!1037669 ((_ is ValueCellFull!11615) mapDefault!38493)) b!1037671))

(assert (= b!1037675 b!1037669))

(assert (= start!90780 b!1037675))

(declare-fun m!957305 () Bool)

(assert (=> b!1037673 m!957305))

(declare-fun m!957307 () Bool)

(assert (=> b!1037668 m!957307))

(declare-fun m!957309 () Bool)

(assert (=> b!1037668 m!957309))

(declare-fun m!957311 () Bool)

(assert (=> b!1037668 m!957311))

(declare-fun m!957313 () Bool)

(assert (=> b!1037668 m!957313))

(declare-fun m!957315 () Bool)

(assert (=> b!1037676 m!957315))

(declare-fun m!957317 () Bool)

(assert (=> b!1037667 m!957317))

(declare-fun m!957319 () Bool)

(assert (=> start!90780 m!957319))

(declare-fun m!957321 () Bool)

(assert (=> mapNonEmpty!38493 m!957321))

(declare-fun m!957323 () Bool)

(assert (=> b!1037675 m!957323))

(declare-fun m!957325 () Bool)

(assert (=> b!1037675 m!957325))

(declare-fun m!957327 () Bool)

(assert (=> b!1037672 m!957327))

(declare-fun m!957329 () Bool)

(assert (=> b!1037666 m!957329))

(check-sat (not b!1037668) (not b!1037673) tp_is_empty!24637 (not b!1037676) (not b!1037675) (not b_next!20917) (not b!1037672) (not b!1037667) (not mapNonEmpty!38493) b_and!33423 (not start!90780) (not b!1037666))
(check-sat b_and!33423 (not b_next!20917))
(get-model)

(declare-fun b!1037751 () Bool)

(declare-fun e!587108 () (_ BitVec 32))

(declare-fun e!587107 () (_ BitVec 32))

(assert (=> b!1037751 (= e!587108 e!587107)))

(declare-fun c!105125 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037751 (= c!105125 (validKeyInArray!0 (select (arr!31440 (array!65324 (store (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31972 (_keys!11489 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1037752 () Bool)

(assert (=> b!1037752 (= e!587108 #b00000000000000000000000000000000)))

(declare-fun d!125131 () Bool)

(declare-fun lt!457405 () (_ BitVec 32))

(assert (=> d!125131 (and (bvsge lt!457405 #b00000000000000000000000000000000) (bvsle lt!457405 (bvsub (size!31972 (array!65324 (store (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31972 (_keys!11489 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125131 (= lt!457405 e!587108)))

(declare-fun c!105124 () Bool)

(assert (=> d!125131 (= c!105124 (bvsge #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))))))

(assert (=> d!125131 (and (bvsle #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31972 (_keys!11489 thiss!1427)) (size!31972 (array!65324 (store (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31972 (_keys!11489 thiss!1427))))))))

(assert (=> d!125131 (= (arrayCountValidKeys!0 (array!65324 (store (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31972 (_keys!11489 thiss!1427))) #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) lt!457405)))

(declare-fun b!1037753 () Bool)

(declare-fun call!43907 () (_ BitVec 32))

(assert (=> b!1037753 (= e!587107 call!43907)))

(declare-fun b!1037754 () Bool)

(assert (=> b!1037754 (= e!587107 (bvadd #b00000000000000000000000000000001 call!43907))))

(declare-fun bm!43904 () Bool)

(assert (=> bm!43904 (= call!43907 (arrayCountValidKeys!0 (array!65324 (store (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31972 (_keys!11489 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31972 (_keys!11489 thiss!1427))))))

(assert (= (and d!125131 c!105124) b!1037752))

(assert (= (and d!125131 (not c!105124)) b!1037751))

(assert (= (and b!1037751 c!105125) b!1037754))

(assert (= (and b!1037751 (not c!105125)) b!1037753))

(assert (= (or b!1037754 b!1037753) bm!43904))

(declare-fun m!957383 () Bool)

(assert (=> b!1037751 m!957383))

(assert (=> b!1037751 m!957383))

(declare-fun m!957385 () Bool)

(assert (=> b!1037751 m!957385))

(declare-fun m!957387 () Bool)

(assert (=> bm!43904 m!957387))

(assert (=> b!1037668 d!125131))

(declare-fun b!1037755 () Bool)

(declare-fun e!587110 () (_ BitVec 32))

(declare-fun e!587109 () (_ BitVec 32))

(assert (=> b!1037755 (= e!587110 e!587109)))

(declare-fun c!105127 () Bool)

(assert (=> b!1037755 (= c!105127 (validKeyInArray!0 (select (arr!31440 (_keys!11489 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037756 () Bool)

(assert (=> b!1037756 (= e!587110 #b00000000000000000000000000000000)))

(declare-fun d!125133 () Bool)

(declare-fun lt!457406 () (_ BitVec 32))

(assert (=> d!125133 (and (bvsge lt!457406 #b00000000000000000000000000000000) (bvsle lt!457406 (bvsub (size!31972 (_keys!11489 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125133 (= lt!457406 e!587110)))

(declare-fun c!105126 () Bool)

(assert (=> d!125133 (= c!105126 (bvsge #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))))))

(assert (=> d!125133 (and (bvsle #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31972 (_keys!11489 thiss!1427)) (size!31972 (_keys!11489 thiss!1427))))))

(assert (=> d!125133 (= (arrayCountValidKeys!0 (_keys!11489 thiss!1427) #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) lt!457406)))

(declare-fun b!1037757 () Bool)

(declare-fun call!43908 () (_ BitVec 32))

(assert (=> b!1037757 (= e!587109 call!43908)))

(declare-fun b!1037758 () Bool)

(assert (=> b!1037758 (= e!587109 (bvadd #b00000000000000000000000000000001 call!43908))))

(declare-fun bm!43905 () Bool)

(assert (=> bm!43905 (= call!43908 (arrayCountValidKeys!0 (_keys!11489 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31972 (_keys!11489 thiss!1427))))))

(assert (= (and d!125133 c!105126) b!1037756))

(assert (= (and d!125133 (not c!105126)) b!1037755))

(assert (= (and b!1037755 c!105127) b!1037758))

(assert (= (and b!1037755 (not c!105127)) b!1037757))

(assert (= (or b!1037758 b!1037757) bm!43905))

(declare-fun m!957389 () Bool)

(assert (=> b!1037755 m!957389))

(assert (=> b!1037755 m!957389))

(declare-fun m!957391 () Bool)

(assert (=> b!1037755 m!957391))

(declare-fun m!957393 () Bool)

(assert (=> bm!43905 m!957393))

(assert (=> b!1037668 d!125133))

(declare-fun b!1037770 () Bool)

(declare-fun e!587116 () Bool)

(assert (=> b!1037770 (= e!587116 (= (arrayCountValidKeys!0 (array!65324 (store (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31972 (_keys!11489 thiss!1427))) #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11489 thiss!1427) #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1037767 () Bool)

(declare-fun res!692358 () Bool)

(declare-fun e!587115 () Bool)

(assert (=> b!1037767 (=> (not res!692358) (not e!587115))))

(assert (=> b!1037767 (= res!692358 (validKeyInArray!0 (select (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457389))))))

(declare-fun b!1037769 () Bool)

(assert (=> b!1037769 (= e!587115 (bvslt (size!31972 (_keys!11489 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun d!125135 () Bool)

(assert (=> d!125135 e!587116))

(declare-fun res!692356 () Bool)

(assert (=> d!125135 (=> (not res!692356) (not e!587116))))

(assert (=> d!125135 (= res!692356 (and (bvsge (index!41384 lt!457389) #b00000000000000000000000000000000) (bvslt (index!41384 lt!457389) (size!31972 (_keys!11489 thiss!1427)))))))

(declare-fun lt!457409 () Unit!33841)

(declare-fun choose!82 (array!65323 (_ BitVec 32) (_ BitVec 64)) Unit!33841)

(assert (=> d!125135 (= lt!457409 (choose!82 (_keys!11489 thiss!1427) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125135 e!587115))

(declare-fun res!692359 () Bool)

(assert (=> d!125135 (=> (not res!692359) (not e!587115))))

(assert (=> d!125135 (= res!692359 (and (bvsge (index!41384 lt!457389) #b00000000000000000000000000000000) (bvslt (index!41384 lt!457389) (size!31972 (_keys!11489 thiss!1427)))))))

(assert (=> d!125135 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11489 thiss!1427) (index!41384 lt!457389) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457409)))

(declare-fun b!1037768 () Bool)

(declare-fun res!692357 () Bool)

(assert (=> b!1037768 (=> (not res!692357) (not e!587115))))

(assert (=> b!1037768 (= res!692357 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125135 res!692359) b!1037767))

(assert (= (and b!1037767 res!692358) b!1037768))

(assert (= (and b!1037768 res!692357) b!1037769))

(assert (= (and d!125135 res!692356) b!1037770))

(assert (=> b!1037770 m!957307))

(assert (=> b!1037770 m!957309))

(assert (=> b!1037770 m!957311))

(declare-fun m!957395 () Bool)

(assert (=> b!1037767 m!957395))

(assert (=> b!1037767 m!957395))

(declare-fun m!957397 () Bool)

(assert (=> b!1037767 m!957397))

(declare-fun m!957399 () Bool)

(assert (=> d!125135 m!957399))

(declare-fun m!957401 () Bool)

(assert (=> b!1037768 m!957401))

(assert (=> b!1037668 d!125135))

(declare-fun b!1037781 () Bool)

(declare-fun e!587128 () Bool)

(assert (=> b!1037781 (= e!587128 (contains!6007 Nil!21957 (select (arr!31440 (_keys!11489 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037782 () Bool)

(declare-fun e!587126 () Bool)

(declare-fun e!587127 () Bool)

(assert (=> b!1037782 (= e!587126 e!587127)))

(declare-fun c!105130 () Bool)

(assert (=> b!1037782 (= c!105130 (validKeyInArray!0 (select (arr!31440 (_keys!11489 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43908 () Bool)

(declare-fun call!43911 () Bool)

(assert (=> bm!43908 (= call!43911 (arrayNoDuplicates!0 (_keys!11489 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105130 (Cons!21956 (select (arr!31440 (_keys!11489 thiss!1427)) #b00000000000000000000000000000000) Nil!21957) Nil!21957)))))

(declare-fun b!1037783 () Bool)

(assert (=> b!1037783 (= e!587127 call!43911)))

(declare-fun b!1037784 () Bool)

(assert (=> b!1037784 (= e!587127 call!43911)))

(declare-fun d!125137 () Bool)

(declare-fun res!692368 () Bool)

(declare-fun e!587125 () Bool)

(assert (=> d!125137 (=> res!692368 e!587125)))

(assert (=> d!125137 (= res!692368 (bvsge #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))))))

(assert (=> d!125137 (= (arrayNoDuplicates!0 (_keys!11489 thiss!1427) #b00000000000000000000000000000000 Nil!21957) e!587125)))

(declare-fun b!1037785 () Bool)

(assert (=> b!1037785 (= e!587125 e!587126)))

(declare-fun res!692367 () Bool)

(assert (=> b!1037785 (=> (not res!692367) (not e!587126))))

(assert (=> b!1037785 (= res!692367 (not e!587128))))

(declare-fun res!692366 () Bool)

(assert (=> b!1037785 (=> (not res!692366) (not e!587128))))

(assert (=> b!1037785 (= res!692366 (validKeyInArray!0 (select (arr!31440 (_keys!11489 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125137 (not res!692368)) b!1037785))

(assert (= (and b!1037785 res!692366) b!1037781))

(assert (= (and b!1037785 res!692367) b!1037782))

(assert (= (and b!1037782 c!105130) b!1037783))

(assert (= (and b!1037782 (not c!105130)) b!1037784))

(assert (= (or b!1037783 b!1037784) bm!43908))

(assert (=> b!1037781 m!957389))

(assert (=> b!1037781 m!957389))

(declare-fun m!957403 () Bool)

(assert (=> b!1037781 m!957403))

(assert (=> b!1037782 m!957389))

(assert (=> b!1037782 m!957389))

(assert (=> b!1037782 m!957391))

(assert (=> bm!43908 m!957389))

(declare-fun m!957405 () Bool)

(assert (=> bm!43908 m!957405))

(assert (=> b!1037785 m!957389))

(assert (=> b!1037785 m!957389))

(assert (=> b!1037785 m!957391))

(assert (=> b!1037673 d!125137))

(declare-fun d!125139 () Bool)

(declare-fun res!692375 () Bool)

(declare-fun e!587131 () Bool)

(assert (=> d!125139 (=> (not res!692375) (not e!587131))))

(declare-fun simpleValid!420 (LongMapFixedSize!5824) Bool)

(assert (=> d!125139 (= res!692375 (simpleValid!420 thiss!1427))))

(assert (=> d!125139 (= (valid!2186 thiss!1427) e!587131)))

(declare-fun b!1037792 () Bool)

(declare-fun res!692376 () Bool)

(assert (=> b!1037792 (=> (not res!692376) (not e!587131))))

(assert (=> b!1037792 (= res!692376 (= (arrayCountValidKeys!0 (_keys!11489 thiss!1427) #b00000000000000000000000000000000 (size!31972 (_keys!11489 thiss!1427))) (_size!2967 thiss!1427)))))

(declare-fun b!1037793 () Bool)

(declare-fun res!692377 () Bool)

(assert (=> b!1037793 (=> (not res!692377) (not e!587131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65323 (_ BitVec 32)) Bool)

(assert (=> b!1037793 (= res!692377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11489 thiss!1427) (mask!30217 thiss!1427)))))

(declare-fun b!1037794 () Bool)

(assert (=> b!1037794 (= e!587131 (arrayNoDuplicates!0 (_keys!11489 thiss!1427) #b00000000000000000000000000000000 Nil!21957))))

(assert (= (and d!125139 res!692375) b!1037792))

(assert (= (and b!1037792 res!692376) b!1037793))

(assert (= (and b!1037793 res!692377) b!1037794))

(declare-fun m!957407 () Bool)

(assert (=> d!125139 m!957407))

(assert (=> b!1037792 m!957311))

(declare-fun m!957409 () Bool)

(assert (=> b!1037793 m!957409))

(assert (=> b!1037794 m!957305))

(assert (=> start!90780 d!125139))

(declare-fun d!125141 () Bool)

(declare-fun res!692382 () Bool)

(declare-fun e!587136 () Bool)

(assert (=> d!125141 (=> res!692382 e!587136)))

(assert (=> d!125141 (= res!692382 ((_ is Nil!21957) Nil!21957))))

(assert (=> d!125141 (= (noDuplicate!1489 Nil!21957) e!587136)))

(declare-fun b!1037799 () Bool)

(declare-fun e!587137 () Bool)

(assert (=> b!1037799 (= e!587136 e!587137)))

(declare-fun res!692383 () Bool)

(assert (=> b!1037799 (=> (not res!692383) (not e!587137))))

(assert (=> b!1037799 (= res!692383 (not (contains!6007 (t!31165 Nil!21957) (h!23159 Nil!21957))))))

(declare-fun b!1037800 () Bool)

(assert (=> b!1037800 (= e!587137 (noDuplicate!1489 (t!31165 Nil!21957)))))

(assert (= (and d!125141 (not res!692382)) b!1037799))

(assert (= (and b!1037799 res!692383) b!1037800))

(declare-fun m!957411 () Bool)

(assert (=> b!1037799 m!957411))

(declare-fun m!957413 () Bool)

(assert (=> b!1037800 m!957413))

(assert (=> b!1037672 d!125141))

(declare-fun d!125143 () Bool)

(declare-fun lt!457412 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!517 (List!21960) (InoxSet (_ BitVec 64)))

(assert (=> d!125143 (= lt!457412 (select (content!517 Nil!21957) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587142 () Bool)

(assert (=> d!125143 (= lt!457412 e!587142)))

(declare-fun res!692389 () Bool)

(assert (=> d!125143 (=> (not res!692389) (not e!587142))))

(assert (=> d!125143 (= res!692389 ((_ is Cons!21956) Nil!21957))))

(assert (=> d!125143 (= (contains!6007 Nil!21957 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457412)))

(declare-fun b!1037805 () Bool)

(declare-fun e!587143 () Bool)

(assert (=> b!1037805 (= e!587142 e!587143)))

(declare-fun res!692388 () Bool)

(assert (=> b!1037805 (=> res!692388 e!587143)))

(assert (=> b!1037805 (= res!692388 (= (h!23159 Nil!21957) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037806 () Bool)

(assert (=> b!1037806 (= e!587143 (contains!6007 (t!31165 Nil!21957) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125143 res!692389) b!1037805))

(assert (= (and b!1037805 (not res!692388)) b!1037806))

(declare-fun m!957415 () Bool)

(assert (=> d!125143 m!957415))

(declare-fun m!957417 () Bool)

(assert (=> d!125143 m!957417))

(declare-fun m!957419 () Bool)

(assert (=> b!1037806 m!957419))

(assert (=> b!1037676 d!125143))

(declare-fun d!125145 () Bool)

(assert (=> d!125145 (= (array_inv!24311 (_keys!11489 thiss!1427)) (bvsge (size!31972 (_keys!11489 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037675 d!125145))

(declare-fun d!125147 () Bool)

(assert (=> d!125147 (= (array_inv!24312 (_values!6317 thiss!1427)) (bvsge (size!31973 (_values!6317 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037675 d!125147))

(declare-fun d!125149 () Bool)

(declare-fun lt!457413 () Bool)

(assert (=> d!125149 (= lt!457413 (select (content!517 Nil!21957) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!587144 () Bool)

(assert (=> d!125149 (= lt!457413 e!587144)))

(declare-fun res!692391 () Bool)

(assert (=> d!125149 (=> (not res!692391) (not e!587144))))

(assert (=> d!125149 (= res!692391 ((_ is Cons!21956) Nil!21957))))

(assert (=> d!125149 (= (contains!6007 Nil!21957 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457413)))

(declare-fun b!1037807 () Bool)

(declare-fun e!587145 () Bool)

(assert (=> b!1037807 (= e!587144 e!587145)))

(declare-fun res!692390 () Bool)

(assert (=> b!1037807 (=> res!692390 e!587145)))

(assert (=> b!1037807 (= res!692390 (= (h!23159 Nil!21957) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1037808 () Bool)

(assert (=> b!1037808 (= e!587145 (contains!6007 (t!31165 Nil!21957) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125149 res!692391) b!1037807))

(assert (= (and b!1037807 (not res!692390)) b!1037808))

(assert (=> d!125149 m!957415))

(declare-fun m!957421 () Bool)

(assert (=> d!125149 m!957421))

(declare-fun m!957423 () Bool)

(assert (=> b!1037808 m!957423))

(assert (=> b!1037666 d!125149))

(declare-fun b!1037821 () Bool)

(declare-fun e!587154 () SeekEntryResult!9753)

(declare-fun lt!457422 () SeekEntryResult!9753)

(assert (=> b!1037821 (= e!587154 (Found!9753 (index!41385 lt!457422)))))

(declare-fun d!125151 () Bool)

(declare-fun lt!457424 () SeekEntryResult!9753)

(assert (=> d!125151 (and (or ((_ is MissingVacant!9753) lt!457424) (not ((_ is Found!9753) lt!457424)) (and (bvsge (index!41384 lt!457424) #b00000000000000000000000000000000) (bvslt (index!41384 lt!457424) (size!31972 (_keys!11489 thiss!1427))))) (not ((_ is MissingVacant!9753) lt!457424)) (or (not ((_ is Found!9753) lt!457424)) (= (select (arr!31440 (_keys!11489 thiss!1427)) (index!41384 lt!457424)) key!909)))))

(declare-fun e!587153 () SeekEntryResult!9753)

(assert (=> d!125151 (= lt!457424 e!587153)))

(declare-fun c!105137 () Bool)

(assert (=> d!125151 (= c!105137 (and ((_ is Intermediate!9753) lt!457422) (undefined!10565 lt!457422)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65323 (_ BitVec 32)) SeekEntryResult!9753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125151 (= lt!457422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30217 thiss!1427)) key!909 (_keys!11489 thiss!1427) (mask!30217 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125151 (validMask!0 (mask!30217 thiss!1427))))

(assert (=> d!125151 (= (seekEntry!0 key!909 (_keys!11489 thiss!1427) (mask!30217 thiss!1427)) lt!457424)))

(declare-fun b!1037822 () Bool)

(assert (=> b!1037822 (= e!587153 e!587154)))

(declare-fun lt!457423 () (_ BitVec 64))

(assert (=> b!1037822 (= lt!457423 (select (arr!31440 (_keys!11489 thiss!1427)) (index!41385 lt!457422)))))

(declare-fun c!105138 () Bool)

(assert (=> b!1037822 (= c!105138 (= lt!457423 key!909))))

(declare-fun b!1037823 () Bool)

(declare-fun e!587152 () SeekEntryResult!9753)

(assert (=> b!1037823 (= e!587152 (MissingZero!9753 (index!41385 lt!457422)))))

(declare-fun b!1037824 () Bool)

(assert (=> b!1037824 (= e!587153 Undefined!9753)))

(declare-fun b!1037825 () Bool)

(declare-fun c!105139 () Bool)

(assert (=> b!1037825 (= c!105139 (= lt!457423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1037825 (= e!587154 e!587152)))

(declare-fun b!1037826 () Bool)

(declare-fun lt!457425 () SeekEntryResult!9753)

(assert (=> b!1037826 (= e!587152 (ite ((_ is MissingVacant!9753) lt!457425) (MissingZero!9753 (index!41386 lt!457425)) lt!457425))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65323 (_ BitVec 32)) SeekEntryResult!9753)

(assert (=> b!1037826 (= lt!457425 (seekKeyOrZeroReturnVacant!0 (x!92589 lt!457422) (index!41385 lt!457422) (index!41385 lt!457422) key!909 (_keys!11489 thiss!1427) (mask!30217 thiss!1427)))))

(assert (= (and d!125151 c!105137) b!1037824))

(assert (= (and d!125151 (not c!105137)) b!1037822))

(assert (= (and b!1037822 c!105138) b!1037821))

(assert (= (and b!1037822 (not c!105138)) b!1037825))

(assert (= (and b!1037825 c!105139) b!1037823))

(assert (= (and b!1037825 (not c!105139)) b!1037826))

(declare-fun m!957425 () Bool)

(assert (=> d!125151 m!957425))

(declare-fun m!957427 () Bool)

(assert (=> d!125151 m!957427))

(assert (=> d!125151 m!957427))

(declare-fun m!957429 () Bool)

(assert (=> d!125151 m!957429))

(declare-fun m!957431 () Bool)

(assert (=> d!125151 m!957431))

(declare-fun m!957433 () Bool)

(assert (=> b!1037822 m!957433))

(declare-fun m!957435 () Bool)

(assert (=> b!1037826 m!957435))

(assert (=> b!1037667 d!125151))

(declare-fun b!1037833 () Bool)

(declare-fun e!587159 () Bool)

(assert (=> b!1037833 (= e!587159 tp_is_empty!24637)))

(declare-fun mapNonEmpty!38502 () Bool)

(declare-fun mapRes!38502 () Bool)

(declare-fun tp!73921 () Bool)

(assert (=> mapNonEmpty!38502 (= mapRes!38502 (and tp!73921 e!587159))))

(declare-fun mapRest!38502 () (Array (_ BitVec 32) ValueCell!11615))

(declare-fun mapValue!38502 () ValueCell!11615)

(declare-fun mapKey!38502 () (_ BitVec 32))

(assert (=> mapNonEmpty!38502 (= mapRest!38493 (store mapRest!38502 mapKey!38502 mapValue!38502))))

(declare-fun condMapEmpty!38502 () Bool)

(declare-fun mapDefault!38502 () ValueCell!11615)

(assert (=> mapNonEmpty!38493 (= condMapEmpty!38502 (= mapRest!38493 ((as const (Array (_ BitVec 32) ValueCell!11615)) mapDefault!38502)))))

(declare-fun e!587160 () Bool)

(assert (=> mapNonEmpty!38493 (= tp!73906 (and e!587160 mapRes!38502))))

(declare-fun b!1037834 () Bool)

(assert (=> b!1037834 (= e!587160 tp_is_empty!24637)))

(declare-fun mapIsEmpty!38502 () Bool)

(assert (=> mapIsEmpty!38502 mapRes!38502))

(assert (= (and mapNonEmpty!38493 condMapEmpty!38502) mapIsEmpty!38502))

(assert (= (and mapNonEmpty!38493 (not condMapEmpty!38502)) mapNonEmpty!38502))

(assert (= (and mapNonEmpty!38502 ((_ is ValueCellFull!11615) mapValue!38502)) b!1037833))

(assert (= (and mapNonEmpty!38493 ((_ is ValueCellFull!11615) mapDefault!38502)) b!1037834))

(declare-fun m!957437 () Bool)

(assert (=> mapNonEmpty!38502 m!957437))

(check-sat (not b!1037799) (not b!1037794) (not b!1037806) (not d!125139) tp_is_empty!24637 (not b!1037785) (not d!125151) (not d!125149) (not b!1037793) (not b!1037770) b_and!33423 (not b!1037781) (not b!1037768) (not bm!43904) (not b!1037808) (not d!125143) (not b!1037792) (not mapNonEmpty!38502) (not b!1037755) (not bm!43905) (not d!125135) (not b!1037826) (not b!1037751) (not bm!43908) (not b!1037767) (not b!1037800) (not b_next!20917) (not b!1037782))
(check-sat b_and!33423 (not b_next!20917))
