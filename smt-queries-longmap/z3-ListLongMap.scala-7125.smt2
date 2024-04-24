; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90626 () Bool)

(assert start!90626)

(declare-fun b!1035979 () Bool)

(declare-fun b_free!20803 () Bool)

(declare-fun b_next!20803 () Bool)

(assert (=> b!1035979 (= b_free!20803 (not b_next!20803))))

(declare-fun tp!73513 () Bool)

(declare-fun b_and!33313 () Bool)

(assert (=> b!1035979 (= tp!73513 b_and!33313)))

(declare-fun b!1035977 () Bool)

(declare-fun e!585747 () Bool)

(declare-fun tp_is_empty!24523 () Bool)

(assert (=> b!1035977 (= e!585747 tp_is_empty!24523)))

(declare-fun b!1035978 () Bool)

(declare-fun e!585750 () Bool)

(declare-fun e!585749 () Bool)

(declare-fun mapRes!38272 () Bool)

(assert (=> b!1035978 (= e!585750 (and e!585749 mapRes!38272))))

(declare-fun condMapEmpty!38272 () Bool)

(declare-datatypes ((V!37571 0))(
  ( (V!37572 (val!12312 Int)) )
))
(declare-datatypes ((ValueCell!11558 0))(
  ( (ValueCellFull!11558 (v!14888 V!37571)) (EmptyCell!11558) )
))
(declare-datatypes ((array!65177 0))(
  ( (array!65178 (arr!31375 (Array (_ BitVec 32) (_ BitVec 64))) (size!31899 (_ BitVec 32))) )
))
(declare-datatypes ((array!65179 0))(
  ( (array!65180 (arr!31376 (Array (_ BitVec 32) ValueCell!11558)) (size!31900 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5710 0))(
  ( (LongMapFixedSize!5711 (defaultEntry!6233 Int) (mask!30155 (_ BitVec 32)) (extraKeys!5963 (_ BitVec 32)) (zeroValue!6067 V!37571) (minValue!6069 V!37571) (_size!2910 (_ BitVec 32)) (_keys!11453 array!65177) (_values!6256 array!65179) (_vacant!2910 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5710)

(declare-fun mapDefault!38272 () ValueCell!11558)

(assert (=> b!1035978 (= condMapEmpty!38272 (= (arr!31376 (_values!6256 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11558)) mapDefault!38272)))))

(declare-fun mapIsEmpty!38272 () Bool)

(assert (=> mapIsEmpty!38272 mapRes!38272))

(declare-fun e!585745 () Bool)

(declare-fun array_inv!24283 (array!65177) Bool)

(declare-fun array_inv!24284 (array!65179) Bool)

(assert (=> b!1035979 (= e!585745 (and tp!73513 tp_is_empty!24523 (array_inv!24283 (_keys!11453 thiss!1427)) (array_inv!24284 (_values!6256 thiss!1427)) e!585750))))

(declare-fun b!1035980 () Bool)

(declare-fun res!691507 () Bool)

(declare-fun e!585746 () Bool)

(assert (=> b!1035980 (=> (not res!691507) (not e!585746))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035980 (= res!691507 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035981 () Bool)

(assert (=> b!1035981 (= e!585749 tp_is_empty!24523)))

(declare-fun b!1035982 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035982 (= e!585746 (not (validMask!0 (mask!30155 thiss!1427))))))

(declare-fun res!691508 () Bool)

(assert (=> start!90626 (=> (not res!691508) (not e!585746))))

(declare-fun valid!2165 (LongMapFixedSize!5710) Bool)

(assert (=> start!90626 (= res!691508 (valid!2165 thiss!1427))))

(assert (=> start!90626 e!585746))

(assert (=> start!90626 e!585745))

(assert (=> start!90626 true))

(declare-fun mapNonEmpty!38272 () Bool)

(declare-fun tp!73514 () Bool)

(assert (=> mapNonEmpty!38272 (= mapRes!38272 (and tp!73514 e!585747))))

(declare-fun mapValue!38272 () ValueCell!11558)

(declare-fun mapKey!38272 () (_ BitVec 32))

(declare-fun mapRest!38272 () (Array (_ BitVec 32) ValueCell!11558))

(assert (=> mapNonEmpty!38272 (= (arr!31376 (_values!6256 thiss!1427)) (store mapRest!38272 mapKey!38272 mapValue!38272))))

(assert (= (and start!90626 res!691508) b!1035980))

(assert (= (and b!1035980 res!691507) b!1035982))

(assert (= (and b!1035978 condMapEmpty!38272) mapIsEmpty!38272))

(assert (= (and b!1035978 (not condMapEmpty!38272)) mapNonEmpty!38272))

(get-info :version)

(assert (= (and mapNonEmpty!38272 ((_ is ValueCellFull!11558) mapValue!38272)) b!1035977))

(assert (= (and b!1035978 ((_ is ValueCellFull!11558) mapDefault!38272)) b!1035981))

(assert (= b!1035979 b!1035978))

(assert (= start!90626 b!1035979))

(declare-fun m!956677 () Bool)

(assert (=> b!1035979 m!956677))

(declare-fun m!956679 () Bool)

(assert (=> b!1035979 m!956679))

(declare-fun m!956681 () Bool)

(assert (=> b!1035982 m!956681))

(declare-fun m!956683 () Bool)

(assert (=> start!90626 m!956683))

(declare-fun m!956685 () Bool)

(assert (=> mapNonEmpty!38272 m!956685))

(check-sat (not start!90626) b_and!33313 (not mapNonEmpty!38272) (not b_next!20803) (not b!1035979) (not b!1035982) tp_is_empty!24523)
(check-sat b_and!33313 (not b_next!20803))
(get-model)

(declare-fun d!124887 () Bool)

(assert (=> d!124887 (= (validMask!0 (mask!30155 thiss!1427)) (and (or (= (mask!30155 thiss!1427) #b00000000000000000000000000000111) (= (mask!30155 thiss!1427) #b00000000000000000000000000001111) (= (mask!30155 thiss!1427) #b00000000000000000000000000011111) (= (mask!30155 thiss!1427) #b00000000000000000000000000111111) (= (mask!30155 thiss!1427) #b00000000000000000000000001111111) (= (mask!30155 thiss!1427) #b00000000000000000000000011111111) (= (mask!30155 thiss!1427) #b00000000000000000000000111111111) (= (mask!30155 thiss!1427) #b00000000000000000000001111111111) (= (mask!30155 thiss!1427) #b00000000000000000000011111111111) (= (mask!30155 thiss!1427) #b00000000000000000000111111111111) (= (mask!30155 thiss!1427) #b00000000000000000001111111111111) (= (mask!30155 thiss!1427) #b00000000000000000011111111111111) (= (mask!30155 thiss!1427) #b00000000000000000111111111111111) (= (mask!30155 thiss!1427) #b00000000000000001111111111111111) (= (mask!30155 thiss!1427) #b00000000000000011111111111111111) (= (mask!30155 thiss!1427) #b00000000000000111111111111111111) (= (mask!30155 thiss!1427) #b00000000000001111111111111111111) (= (mask!30155 thiss!1427) #b00000000000011111111111111111111) (= (mask!30155 thiss!1427) #b00000000000111111111111111111111) (= (mask!30155 thiss!1427) #b00000000001111111111111111111111) (= (mask!30155 thiss!1427) #b00000000011111111111111111111111) (= (mask!30155 thiss!1427) #b00000000111111111111111111111111) (= (mask!30155 thiss!1427) #b00000001111111111111111111111111) (= (mask!30155 thiss!1427) #b00000011111111111111111111111111) (= (mask!30155 thiss!1427) #b00000111111111111111111111111111) (= (mask!30155 thiss!1427) #b00001111111111111111111111111111) (= (mask!30155 thiss!1427) #b00011111111111111111111111111111) (= (mask!30155 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30155 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035982 d!124887))

(declare-fun d!124889 () Bool)

(declare-fun res!691527 () Bool)

(declare-fun e!585789 () Bool)

(assert (=> d!124889 (=> (not res!691527) (not e!585789))))

(declare-fun simpleValid!406 (LongMapFixedSize!5710) Bool)

(assert (=> d!124889 (= res!691527 (simpleValid!406 thiss!1427))))

(assert (=> d!124889 (= (valid!2165 thiss!1427) e!585789)))

(declare-fun b!1036025 () Bool)

(declare-fun res!691528 () Bool)

(assert (=> b!1036025 (=> (not res!691528) (not e!585789))))

(declare-fun arrayCountValidKeys!0 (array!65177 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036025 (= res!691528 (= (arrayCountValidKeys!0 (_keys!11453 thiss!1427) #b00000000000000000000000000000000 (size!31899 (_keys!11453 thiss!1427))) (_size!2910 thiss!1427)))))

(declare-fun b!1036026 () Bool)

(declare-fun res!691529 () Bool)

(assert (=> b!1036026 (=> (not res!691529) (not e!585789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65177 (_ BitVec 32)) Bool)

(assert (=> b!1036026 (= res!691529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11453 thiss!1427) (mask!30155 thiss!1427)))))

(declare-fun b!1036027 () Bool)

(declare-datatypes ((List!21894 0))(
  ( (Nil!21891) (Cons!21890 (h!23101 (_ BitVec 64)) (t!31089 List!21894)) )
))
(declare-fun arrayNoDuplicates!0 (array!65177 (_ BitVec 32) List!21894) Bool)

(assert (=> b!1036027 (= e!585789 (arrayNoDuplicates!0 (_keys!11453 thiss!1427) #b00000000000000000000000000000000 Nil!21891))))

(assert (= (and d!124889 res!691527) b!1036025))

(assert (= (and b!1036025 res!691528) b!1036026))

(assert (= (and b!1036026 res!691529) b!1036027))

(declare-fun m!956707 () Bool)

(assert (=> d!124889 m!956707))

(declare-fun m!956709 () Bool)

(assert (=> b!1036025 m!956709))

(declare-fun m!956711 () Bool)

(assert (=> b!1036026 m!956711))

(declare-fun m!956713 () Bool)

(assert (=> b!1036027 m!956713))

(assert (=> start!90626 d!124889))

(declare-fun d!124891 () Bool)

(assert (=> d!124891 (= (array_inv!24283 (_keys!11453 thiss!1427)) (bvsge (size!31899 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035979 d!124891))

(declare-fun d!124893 () Bool)

(assert (=> d!124893 (= (array_inv!24284 (_values!6256 thiss!1427)) (bvsge (size!31900 (_values!6256 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035979 d!124893))

(declare-fun b!1036034 () Bool)

(declare-fun e!585795 () Bool)

(assert (=> b!1036034 (= e!585795 tp_is_empty!24523)))

(declare-fun b!1036035 () Bool)

(declare-fun e!585794 () Bool)

(assert (=> b!1036035 (= e!585794 tp_is_empty!24523)))

(declare-fun condMapEmpty!38281 () Bool)

(declare-fun mapDefault!38281 () ValueCell!11558)

(assert (=> mapNonEmpty!38272 (= condMapEmpty!38281 (= mapRest!38272 ((as const (Array (_ BitVec 32) ValueCell!11558)) mapDefault!38281)))))

(declare-fun mapRes!38281 () Bool)

(assert (=> mapNonEmpty!38272 (= tp!73514 (and e!585794 mapRes!38281))))

(declare-fun mapNonEmpty!38281 () Bool)

(declare-fun tp!73529 () Bool)

(assert (=> mapNonEmpty!38281 (= mapRes!38281 (and tp!73529 e!585795))))

(declare-fun mapValue!38281 () ValueCell!11558)

(declare-fun mapRest!38281 () (Array (_ BitVec 32) ValueCell!11558))

(declare-fun mapKey!38281 () (_ BitVec 32))

(assert (=> mapNonEmpty!38281 (= mapRest!38272 (store mapRest!38281 mapKey!38281 mapValue!38281))))

(declare-fun mapIsEmpty!38281 () Bool)

(assert (=> mapIsEmpty!38281 mapRes!38281))

(assert (= (and mapNonEmpty!38272 condMapEmpty!38281) mapIsEmpty!38281))

(assert (= (and mapNonEmpty!38272 (not condMapEmpty!38281)) mapNonEmpty!38281))

(assert (= (and mapNonEmpty!38281 ((_ is ValueCellFull!11558) mapValue!38281)) b!1036034))

(assert (= (and mapNonEmpty!38272 ((_ is ValueCellFull!11558) mapDefault!38281)) b!1036035))

(declare-fun m!956715 () Bool)

(assert (=> mapNonEmpty!38281 m!956715))

(check-sat b_and!33313 (not b_next!20803) (not b!1036026) (not b!1036025) tp_is_empty!24523 (not b!1036027) (not mapNonEmpty!38281) (not d!124889))
(check-sat b_and!33313 (not b_next!20803))
(get-model)

(declare-fun bm!43813 () Bool)

(declare-fun call!43816 () Bool)

(assert (=> bm!43813 (= call!43816 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11453 thiss!1427) (mask!30155 thiss!1427)))))

(declare-fun b!1036044 () Bool)

(declare-fun e!585804 () Bool)

(assert (=> b!1036044 (= e!585804 call!43816)))

(declare-fun b!1036045 () Bool)

(declare-fun e!585802 () Bool)

(assert (=> b!1036045 (= e!585804 e!585802)))

(declare-fun lt!457220 () (_ BitVec 64))

(assert (=> b!1036045 (= lt!457220 (select (arr!31375 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33884 0))(
  ( (Unit!33885) )
))
(declare-fun lt!457218 () Unit!33884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65177 (_ BitVec 64) (_ BitVec 32)) Unit!33884)

(assert (=> b!1036045 (= lt!457218 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11453 thiss!1427) lt!457220 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1036045 (arrayContainsKey!0 (_keys!11453 thiss!1427) lt!457220 #b00000000000000000000000000000000)))

(declare-fun lt!457219 () Unit!33884)

(assert (=> b!1036045 (= lt!457219 lt!457218)))

(declare-fun res!691534 () Bool)

(declare-datatypes ((SeekEntryResult!9696 0))(
  ( (MissingZero!9696 (index!41155 (_ BitVec 32))) (Found!9696 (index!41156 (_ BitVec 32))) (Intermediate!9696 (undefined!10508 Bool) (index!41157 (_ BitVec 32)) (x!92235 (_ BitVec 32))) (Undefined!9696) (MissingVacant!9696 (index!41158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65177 (_ BitVec 32)) SeekEntryResult!9696)

(assert (=> b!1036045 (= res!691534 (= (seekEntryOrOpen!0 (select (arr!31375 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000) (_keys!11453 thiss!1427) (mask!30155 thiss!1427)) (Found!9696 #b00000000000000000000000000000000)))))

(assert (=> b!1036045 (=> (not res!691534) (not e!585802))))

(declare-fun b!1036046 () Bool)

(declare-fun e!585803 () Bool)

(assert (=> b!1036046 (= e!585803 e!585804)))

(declare-fun c!105089 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1036046 (= c!105089 (validKeyInArray!0 (select (arr!31375 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036047 () Bool)

(assert (=> b!1036047 (= e!585802 call!43816)))

(declare-fun d!124895 () Bool)

(declare-fun res!691535 () Bool)

(assert (=> d!124895 (=> res!691535 e!585803)))

(assert (=> d!124895 (= res!691535 (bvsge #b00000000000000000000000000000000 (size!31899 (_keys!11453 thiss!1427))))))

(assert (=> d!124895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11453 thiss!1427) (mask!30155 thiss!1427)) e!585803)))

(assert (= (and d!124895 (not res!691535)) b!1036046))

(assert (= (and b!1036046 c!105089) b!1036045))

(assert (= (and b!1036046 (not c!105089)) b!1036044))

(assert (= (and b!1036045 res!691534) b!1036047))

(assert (= (or b!1036047 b!1036044) bm!43813))

(declare-fun m!956717 () Bool)

(assert (=> bm!43813 m!956717))

(declare-fun m!956719 () Bool)

(assert (=> b!1036045 m!956719))

(declare-fun m!956721 () Bool)

(assert (=> b!1036045 m!956721))

(declare-fun m!956723 () Bool)

(assert (=> b!1036045 m!956723))

(assert (=> b!1036045 m!956719))

(declare-fun m!956725 () Bool)

(assert (=> b!1036045 m!956725))

(assert (=> b!1036046 m!956719))

(assert (=> b!1036046 m!956719))

(declare-fun m!956727 () Bool)

(assert (=> b!1036046 m!956727))

(assert (=> b!1036026 d!124895))

(declare-fun d!124897 () Bool)

(declare-fun res!691543 () Bool)

(declare-fun e!585816 () Bool)

(assert (=> d!124897 (=> res!691543 e!585816)))

(assert (=> d!124897 (= res!691543 (bvsge #b00000000000000000000000000000000 (size!31899 (_keys!11453 thiss!1427))))))

(assert (=> d!124897 (= (arrayNoDuplicates!0 (_keys!11453 thiss!1427) #b00000000000000000000000000000000 Nil!21891) e!585816)))

(declare-fun b!1036058 () Bool)

(declare-fun e!585813 () Bool)

(declare-fun contains!6040 (List!21894 (_ BitVec 64)) Bool)

(assert (=> b!1036058 (= e!585813 (contains!6040 Nil!21891 (select (arr!31375 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036059 () Bool)

(declare-fun e!585814 () Bool)

(declare-fun call!43819 () Bool)

(assert (=> b!1036059 (= e!585814 call!43819)))

(declare-fun b!1036060 () Bool)

(assert (=> b!1036060 (= e!585814 call!43819)))

(declare-fun b!1036061 () Bool)

(declare-fun e!585815 () Bool)

(assert (=> b!1036061 (= e!585816 e!585815)))

(declare-fun res!691542 () Bool)

(assert (=> b!1036061 (=> (not res!691542) (not e!585815))))

(assert (=> b!1036061 (= res!691542 (not e!585813))))

(declare-fun res!691544 () Bool)

(assert (=> b!1036061 (=> (not res!691544) (not e!585813))))

(assert (=> b!1036061 (= res!691544 (validKeyInArray!0 (select (arr!31375 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43816 () Bool)

(declare-fun c!105092 () Bool)

(assert (=> bm!43816 (= call!43819 (arrayNoDuplicates!0 (_keys!11453 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105092 (Cons!21890 (select (arr!31375 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000) Nil!21891) Nil!21891)))))

(declare-fun b!1036062 () Bool)

(assert (=> b!1036062 (= e!585815 e!585814)))

(assert (=> b!1036062 (= c!105092 (validKeyInArray!0 (select (arr!31375 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124897 (not res!691543)) b!1036061))

(assert (= (and b!1036061 res!691544) b!1036058))

(assert (= (and b!1036061 res!691542) b!1036062))

(assert (= (and b!1036062 c!105092) b!1036060))

(assert (= (and b!1036062 (not c!105092)) b!1036059))

(assert (= (or b!1036060 b!1036059) bm!43816))

(assert (=> b!1036058 m!956719))

(assert (=> b!1036058 m!956719))

(declare-fun m!956729 () Bool)

(assert (=> b!1036058 m!956729))

(assert (=> b!1036061 m!956719))

(assert (=> b!1036061 m!956719))

(assert (=> b!1036061 m!956727))

(assert (=> bm!43816 m!956719))

(declare-fun m!956731 () Bool)

(assert (=> bm!43816 m!956731))

(assert (=> b!1036062 m!956719))

(assert (=> b!1036062 m!956719))

(assert (=> b!1036062 m!956727))

(assert (=> b!1036027 d!124897))

(declare-fun b!1036074 () Bool)

(declare-fun e!585819 () Bool)

(assert (=> b!1036074 (= e!585819 (and (bvsge (extraKeys!5963 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5963 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2910 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1036072 () Bool)

(declare-fun res!691555 () Bool)

(assert (=> b!1036072 (=> (not res!691555) (not e!585819))))

(declare-fun size!31905 (LongMapFixedSize!5710) (_ BitVec 32))

(assert (=> b!1036072 (= res!691555 (bvsge (size!31905 thiss!1427) (_size!2910 thiss!1427)))))

(declare-fun b!1036071 () Bool)

(declare-fun res!691554 () Bool)

(assert (=> b!1036071 (=> (not res!691554) (not e!585819))))

(assert (=> b!1036071 (= res!691554 (and (= (size!31900 (_values!6256 thiss!1427)) (bvadd (mask!30155 thiss!1427) #b00000000000000000000000000000001)) (= (size!31899 (_keys!11453 thiss!1427)) (size!31900 (_values!6256 thiss!1427))) (bvsge (_size!2910 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2910 thiss!1427) (bvadd (mask!30155 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!124899 () Bool)

(declare-fun res!691553 () Bool)

(assert (=> d!124899 (=> (not res!691553) (not e!585819))))

(assert (=> d!124899 (= res!691553 (validMask!0 (mask!30155 thiss!1427)))))

(assert (=> d!124899 (= (simpleValid!406 thiss!1427) e!585819)))

(declare-fun b!1036073 () Bool)

(declare-fun res!691556 () Bool)

(assert (=> b!1036073 (=> (not res!691556) (not e!585819))))

(assert (=> b!1036073 (= res!691556 (= (size!31905 thiss!1427) (bvadd (_size!2910 thiss!1427) (bvsdiv (bvadd (extraKeys!5963 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!124899 res!691553) b!1036071))

(assert (= (and b!1036071 res!691554) b!1036072))

(assert (= (and b!1036072 res!691555) b!1036073))

(assert (= (and b!1036073 res!691556) b!1036074))

(declare-fun m!956733 () Bool)

(assert (=> b!1036072 m!956733))

(assert (=> d!124899 m!956681))

(assert (=> b!1036073 m!956733))

(assert (=> d!124889 d!124899))

(declare-fun b!1036083 () Bool)

(declare-fun e!585825 () (_ BitVec 32))

(declare-fun call!43822 () (_ BitVec 32))

(assert (=> b!1036083 (= e!585825 (bvadd #b00000000000000000000000000000001 call!43822))))

(declare-fun bm!43819 () Bool)

(assert (=> bm!43819 (= call!43822 (arrayCountValidKeys!0 (_keys!11453 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31899 (_keys!11453 thiss!1427))))))

(declare-fun b!1036084 () Bool)

(assert (=> b!1036084 (= e!585825 call!43822)))

(declare-fun b!1036085 () Bool)

(declare-fun e!585824 () (_ BitVec 32))

(assert (=> b!1036085 (= e!585824 #b00000000000000000000000000000000)))

(declare-fun d!124901 () Bool)

(declare-fun lt!457223 () (_ BitVec 32))

(assert (=> d!124901 (and (bvsge lt!457223 #b00000000000000000000000000000000) (bvsle lt!457223 (bvsub (size!31899 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124901 (= lt!457223 e!585824)))

(declare-fun c!105097 () Bool)

(assert (=> d!124901 (= c!105097 (bvsge #b00000000000000000000000000000000 (size!31899 (_keys!11453 thiss!1427))))))

(assert (=> d!124901 (and (bvsle #b00000000000000000000000000000000 (size!31899 (_keys!11453 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31899 (_keys!11453 thiss!1427)) (size!31899 (_keys!11453 thiss!1427))))))

(assert (=> d!124901 (= (arrayCountValidKeys!0 (_keys!11453 thiss!1427) #b00000000000000000000000000000000 (size!31899 (_keys!11453 thiss!1427))) lt!457223)))

(declare-fun b!1036086 () Bool)

(assert (=> b!1036086 (= e!585824 e!585825)))

(declare-fun c!105098 () Bool)

(assert (=> b!1036086 (= c!105098 (validKeyInArray!0 (select (arr!31375 (_keys!11453 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124901 c!105097) b!1036085))

(assert (= (and d!124901 (not c!105097)) b!1036086))

(assert (= (and b!1036086 c!105098) b!1036083))

(assert (= (and b!1036086 (not c!105098)) b!1036084))

(assert (= (or b!1036083 b!1036084) bm!43819))

(declare-fun m!956735 () Bool)

(assert (=> bm!43819 m!956735))

(assert (=> b!1036086 m!956719))

(assert (=> b!1036086 m!956719))

(assert (=> b!1036086 m!956727))

(assert (=> b!1036025 d!124901))

(declare-fun b!1036087 () Bool)

(declare-fun e!585827 () Bool)

(assert (=> b!1036087 (= e!585827 tp_is_empty!24523)))

(declare-fun b!1036088 () Bool)

(declare-fun e!585826 () Bool)

(assert (=> b!1036088 (= e!585826 tp_is_empty!24523)))

(declare-fun condMapEmpty!38282 () Bool)

(declare-fun mapDefault!38282 () ValueCell!11558)

(assert (=> mapNonEmpty!38281 (= condMapEmpty!38282 (= mapRest!38281 ((as const (Array (_ BitVec 32) ValueCell!11558)) mapDefault!38282)))))

(declare-fun mapRes!38282 () Bool)

(assert (=> mapNonEmpty!38281 (= tp!73529 (and e!585826 mapRes!38282))))

(declare-fun mapNonEmpty!38282 () Bool)

(declare-fun tp!73530 () Bool)

(assert (=> mapNonEmpty!38282 (= mapRes!38282 (and tp!73530 e!585827))))

(declare-fun mapValue!38282 () ValueCell!11558)

(declare-fun mapKey!38282 () (_ BitVec 32))

(declare-fun mapRest!38282 () (Array (_ BitVec 32) ValueCell!11558))

(assert (=> mapNonEmpty!38282 (= mapRest!38281 (store mapRest!38282 mapKey!38282 mapValue!38282))))

(declare-fun mapIsEmpty!38282 () Bool)

(assert (=> mapIsEmpty!38282 mapRes!38282))

(assert (= (and mapNonEmpty!38281 condMapEmpty!38282) mapIsEmpty!38282))

(assert (= (and mapNonEmpty!38281 (not condMapEmpty!38282)) mapNonEmpty!38282))

(assert (= (and mapNonEmpty!38282 ((_ is ValueCellFull!11558) mapValue!38282)) b!1036087))

(assert (= (and mapNonEmpty!38281 ((_ is ValueCellFull!11558) mapDefault!38282)) b!1036088))

(declare-fun m!956737 () Bool)

(assert (=> mapNonEmpty!38282 m!956737))

(check-sat (not b!1036073) (not b!1036086) (not b_next!20803) (not b!1036058) tp_is_empty!24523 (not b!1036062) (not bm!43816) (not mapNonEmpty!38282) (not b!1036046) b_and!33313 (not b!1036061) (not bm!43813) (not b!1036072) (not bm!43819) (not d!124899) (not b!1036045))
(check-sat b_and!33313 (not b_next!20803))
