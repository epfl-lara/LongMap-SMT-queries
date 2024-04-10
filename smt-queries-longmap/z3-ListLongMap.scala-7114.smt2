; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90164 () Bool)

(assert start!90164)

(declare-fun b!1032638 () Bool)

(declare-fun b_free!20739 () Bool)

(declare-fun b_next!20739 () Bool)

(assert (=> b!1032638 (= b_free!20739 (not b_next!20739))))

(declare-fun tp!73295 () Bool)

(declare-fun b_and!33207 () Bool)

(assert (=> b!1032638 (= tp!73295 b_and!33207)))

(declare-fun b!1032634 () Bool)

(declare-fun e!583515 () Bool)

(declare-datatypes ((V!37485 0))(
  ( (V!37486 (val!12280 Int)) )
))
(declare-datatypes ((ValueCell!11526 0))(
  ( (ValueCellFull!11526 (v!14857 V!37485)) (EmptyCell!11526) )
))
(declare-datatypes ((array!64986 0))(
  ( (array!64987 (arr!31293 (Array (_ BitVec 32) (_ BitVec 64))) (size!31812 (_ BitVec 32))) )
))
(declare-datatypes ((array!64988 0))(
  ( (array!64989 (arr!31294 (Array (_ BitVec 32) ValueCell!11526)) (size!31813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5646 0))(
  ( (LongMapFixedSize!5647 (defaultEntry!6197 Int) (mask!30023 (_ BitVec 32)) (extraKeys!5929 (_ BitVec 32)) (zeroValue!6033 V!37485) (minValue!6033 V!37485) (_size!2878 (_ BitVec 32)) (_keys!11372 array!64986) (_values!6220 array!64988) (_vacant!2878 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5646)

(assert (=> b!1032634 (= e!583515 (and (= (size!31813 (_values!6220 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30023 thiss!1427))) (not (= (size!31812 (_keys!11372 thiss!1427)) (size!31813 (_values!6220 thiss!1427))))))))

(declare-fun b!1032635 () Bool)

(declare-fun e!583517 () Bool)

(declare-fun e!583516 () Bool)

(declare-fun mapRes!38150 () Bool)

(assert (=> b!1032635 (= e!583517 (and e!583516 mapRes!38150))))

(declare-fun condMapEmpty!38150 () Bool)

(declare-fun mapDefault!38150 () ValueCell!11526)

(assert (=> b!1032635 (= condMapEmpty!38150 (= (arr!31294 (_values!6220 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11526)) mapDefault!38150)))))

(declare-fun res!690134 () Bool)

(assert (=> start!90164 (=> (not res!690134) (not e!583515))))

(declare-fun valid!2137 (LongMapFixedSize!5646) Bool)

(assert (=> start!90164 (= res!690134 (valid!2137 thiss!1427))))

(assert (=> start!90164 e!583515))

(declare-fun e!583518 () Bool)

(assert (=> start!90164 e!583518))

(assert (=> start!90164 true))

(declare-fun b!1032636 () Bool)

(declare-fun tp_is_empty!24459 () Bool)

(assert (=> b!1032636 (= e!583516 tp_is_empty!24459)))

(declare-fun mapNonEmpty!38150 () Bool)

(declare-fun tp!73296 () Bool)

(declare-fun e!583519 () Bool)

(assert (=> mapNonEmpty!38150 (= mapRes!38150 (and tp!73296 e!583519))))

(declare-fun mapValue!38150 () ValueCell!11526)

(declare-fun mapRest!38150 () (Array (_ BitVec 32) ValueCell!11526))

(declare-fun mapKey!38150 () (_ BitVec 32))

(assert (=> mapNonEmpty!38150 (= (arr!31294 (_values!6220 thiss!1427)) (store mapRest!38150 mapKey!38150 mapValue!38150))))

(declare-fun mapIsEmpty!38150 () Bool)

(assert (=> mapIsEmpty!38150 mapRes!38150))

(declare-fun b!1032637 () Bool)

(assert (=> b!1032637 (= e!583519 tp_is_empty!24459)))

(declare-fun array_inv!24219 (array!64986) Bool)

(declare-fun array_inv!24220 (array!64988) Bool)

(assert (=> b!1032638 (= e!583518 (and tp!73295 tp_is_empty!24459 (array_inv!24219 (_keys!11372 thiss!1427)) (array_inv!24220 (_values!6220 thiss!1427)) e!583517))))

(declare-fun b!1032639 () Bool)

(declare-fun res!690133 () Bool)

(assert (=> b!1032639 (=> (not res!690133) (not e!583515))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032639 (= res!690133 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1032640 () Bool)

(declare-fun res!690132 () Bool)

(assert (=> b!1032640 (=> (not res!690132) (not e!583515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032640 (= res!690132 (validMask!0 (mask!30023 thiss!1427)))))

(assert (= (and start!90164 res!690134) b!1032639))

(assert (= (and b!1032639 res!690133) b!1032640))

(assert (= (and b!1032640 res!690132) b!1032634))

(assert (= (and b!1032635 condMapEmpty!38150) mapIsEmpty!38150))

(assert (= (and b!1032635 (not condMapEmpty!38150)) mapNonEmpty!38150))

(get-info :version)

(assert (= (and mapNonEmpty!38150 ((_ is ValueCellFull!11526) mapValue!38150)) b!1032637))

(assert (= (and b!1032635 ((_ is ValueCellFull!11526) mapDefault!38150)) b!1032636))

(assert (= b!1032638 b!1032635))

(assert (= start!90164 b!1032638))

(declare-fun m!952811 () Bool)

(assert (=> start!90164 m!952811))

(declare-fun m!952813 () Bool)

(assert (=> mapNonEmpty!38150 m!952813))

(declare-fun m!952815 () Bool)

(assert (=> b!1032638 m!952815))

(declare-fun m!952817 () Bool)

(assert (=> b!1032638 m!952817))

(declare-fun m!952819 () Bool)

(assert (=> b!1032640 m!952819))

(check-sat (not b!1032638) (not b!1032640) (not mapNonEmpty!38150) (not start!90164) (not b_next!20739) tp_is_empty!24459 b_and!33207)
(check-sat b_and!33207 (not b_next!20739))
(get-model)

(declare-fun d!123707 () Bool)

(assert (=> d!123707 (= (array_inv!24219 (_keys!11372 thiss!1427)) (bvsge (size!31812 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032638 d!123707))

(declare-fun d!123709 () Bool)

(assert (=> d!123709 (= (array_inv!24220 (_values!6220 thiss!1427)) (bvsge (size!31813 (_values!6220 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032638 d!123709))

(declare-fun d!123711 () Bool)

(assert (=> d!123711 (= (validMask!0 (mask!30023 thiss!1427)) (and (or (= (mask!30023 thiss!1427) #b00000000000000000000000000000111) (= (mask!30023 thiss!1427) #b00000000000000000000000000001111) (= (mask!30023 thiss!1427) #b00000000000000000000000000011111) (= (mask!30023 thiss!1427) #b00000000000000000000000000111111) (= (mask!30023 thiss!1427) #b00000000000000000000000001111111) (= (mask!30023 thiss!1427) #b00000000000000000000000011111111) (= (mask!30023 thiss!1427) #b00000000000000000000000111111111) (= (mask!30023 thiss!1427) #b00000000000000000000001111111111) (= (mask!30023 thiss!1427) #b00000000000000000000011111111111) (= (mask!30023 thiss!1427) #b00000000000000000000111111111111) (= (mask!30023 thiss!1427) #b00000000000000000001111111111111) (= (mask!30023 thiss!1427) #b00000000000000000011111111111111) (= (mask!30023 thiss!1427) #b00000000000000000111111111111111) (= (mask!30023 thiss!1427) #b00000000000000001111111111111111) (= (mask!30023 thiss!1427) #b00000000000000011111111111111111) (= (mask!30023 thiss!1427) #b00000000000000111111111111111111) (= (mask!30023 thiss!1427) #b00000000000001111111111111111111) (= (mask!30023 thiss!1427) #b00000000000011111111111111111111) (= (mask!30023 thiss!1427) #b00000000000111111111111111111111) (= (mask!30023 thiss!1427) #b00000000001111111111111111111111) (= (mask!30023 thiss!1427) #b00000000011111111111111111111111) (= (mask!30023 thiss!1427) #b00000000111111111111111111111111) (= (mask!30023 thiss!1427) #b00000001111111111111111111111111) (= (mask!30023 thiss!1427) #b00000011111111111111111111111111) (= (mask!30023 thiss!1427) #b00000111111111111111111111111111) (= (mask!30023 thiss!1427) #b00001111111111111111111111111111) (= (mask!30023 thiss!1427) #b00011111111111111111111111111111) (= (mask!30023 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30023 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032640 d!123711))

(declare-fun d!123713 () Bool)

(declare-fun res!690150 () Bool)

(declare-fun e!583540 () Bool)

(assert (=> d!123713 (=> (not res!690150) (not e!583540))))

(declare-fun simpleValid!399 (LongMapFixedSize!5646) Bool)

(assert (=> d!123713 (= res!690150 (simpleValid!399 thiss!1427))))

(assert (=> d!123713 (= (valid!2137 thiss!1427) e!583540)))

(declare-fun b!1032668 () Bool)

(declare-fun res!690151 () Bool)

(assert (=> b!1032668 (=> (not res!690151) (not e!583540))))

(declare-fun arrayCountValidKeys!0 (array!64986 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032668 (= res!690151 (= (arrayCountValidKeys!0 (_keys!11372 thiss!1427) #b00000000000000000000000000000000 (size!31812 (_keys!11372 thiss!1427))) (_size!2878 thiss!1427)))))

(declare-fun b!1032669 () Bool)

(declare-fun res!690152 () Bool)

(assert (=> b!1032669 (=> (not res!690152) (not e!583540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64986 (_ BitVec 32)) Bool)

(assert (=> b!1032669 (= res!690152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11372 thiss!1427) (mask!30023 thiss!1427)))))

(declare-fun b!1032670 () Bool)

(declare-datatypes ((List!21897 0))(
  ( (Nil!21894) (Cons!21893 (h!23095 (_ BitVec 64)) (t!31091 List!21897)) )
))
(declare-fun arrayNoDuplicates!0 (array!64986 (_ BitVec 32) List!21897) Bool)

(assert (=> b!1032670 (= e!583540 (arrayNoDuplicates!0 (_keys!11372 thiss!1427) #b00000000000000000000000000000000 Nil!21894))))

(assert (= (and d!123713 res!690150) b!1032668))

(assert (= (and b!1032668 res!690151) b!1032669))

(assert (= (and b!1032669 res!690152) b!1032670))

(declare-fun m!952831 () Bool)

(assert (=> d!123713 m!952831))

(declare-fun m!952833 () Bool)

(assert (=> b!1032668 m!952833))

(declare-fun m!952835 () Bool)

(assert (=> b!1032669 m!952835))

(declare-fun m!952837 () Bool)

(assert (=> b!1032670 m!952837))

(assert (=> start!90164 d!123713))

(declare-fun mapNonEmpty!38156 () Bool)

(declare-fun mapRes!38156 () Bool)

(declare-fun tp!73305 () Bool)

(declare-fun e!583545 () Bool)

(assert (=> mapNonEmpty!38156 (= mapRes!38156 (and tp!73305 e!583545))))

(declare-fun mapRest!38156 () (Array (_ BitVec 32) ValueCell!11526))

(declare-fun mapValue!38156 () ValueCell!11526)

(declare-fun mapKey!38156 () (_ BitVec 32))

(assert (=> mapNonEmpty!38156 (= mapRest!38150 (store mapRest!38156 mapKey!38156 mapValue!38156))))

(declare-fun mapIsEmpty!38156 () Bool)

(assert (=> mapIsEmpty!38156 mapRes!38156))

(declare-fun b!1032678 () Bool)

(declare-fun e!583546 () Bool)

(assert (=> b!1032678 (= e!583546 tp_is_empty!24459)))

(declare-fun condMapEmpty!38156 () Bool)

(declare-fun mapDefault!38156 () ValueCell!11526)

(assert (=> mapNonEmpty!38150 (= condMapEmpty!38156 (= mapRest!38150 ((as const (Array (_ BitVec 32) ValueCell!11526)) mapDefault!38156)))))

(assert (=> mapNonEmpty!38150 (= tp!73296 (and e!583546 mapRes!38156))))

(declare-fun b!1032677 () Bool)

(assert (=> b!1032677 (= e!583545 tp_is_empty!24459)))

(assert (= (and mapNonEmpty!38150 condMapEmpty!38156) mapIsEmpty!38156))

(assert (= (and mapNonEmpty!38150 (not condMapEmpty!38156)) mapNonEmpty!38156))

(assert (= (and mapNonEmpty!38156 ((_ is ValueCellFull!11526) mapValue!38156)) b!1032677))

(assert (= (and mapNonEmpty!38150 ((_ is ValueCellFull!11526) mapDefault!38156)) b!1032678))

(declare-fun m!952839 () Bool)

(assert (=> mapNonEmpty!38156 m!952839))

(check-sat (not d!123713) (not b!1032670) (not b!1032669) (not mapNonEmpty!38156) tp_is_empty!24459 b_and!33207 (not b_next!20739) (not b!1032668))
(check-sat b_and!33207 (not b_next!20739))
(get-model)

(declare-fun b!1032687 () Bool)

(declare-fun res!690161 () Bool)

(declare-fun e!583549 () Bool)

(assert (=> b!1032687 (=> (not res!690161) (not e!583549))))

(assert (=> b!1032687 (= res!690161 (and (= (size!31813 (_values!6220 thiss!1427)) (bvadd (mask!30023 thiss!1427) #b00000000000000000000000000000001)) (= (size!31812 (_keys!11372 thiss!1427)) (size!31813 (_values!6220 thiss!1427))) (bvsge (_size!2878 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2878 thiss!1427) (bvadd (mask!30023 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!123715 () Bool)

(declare-fun res!690163 () Bool)

(assert (=> d!123715 (=> (not res!690163) (not e!583549))))

(assert (=> d!123715 (= res!690163 (validMask!0 (mask!30023 thiss!1427)))))

(assert (=> d!123715 (= (simpleValid!399 thiss!1427) e!583549)))

(declare-fun b!1032689 () Bool)

(declare-fun res!690164 () Bool)

(assert (=> b!1032689 (=> (not res!690164) (not e!583549))))

(declare-fun size!31816 (LongMapFixedSize!5646) (_ BitVec 32))

(assert (=> b!1032689 (= res!690164 (= (size!31816 thiss!1427) (bvadd (_size!2878 thiss!1427) (bvsdiv (bvadd (extraKeys!5929 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1032690 () Bool)

(assert (=> b!1032690 (= e!583549 (and (bvsge (extraKeys!5929 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5929 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2878 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032688 () Bool)

(declare-fun res!690162 () Bool)

(assert (=> b!1032688 (=> (not res!690162) (not e!583549))))

(assert (=> b!1032688 (= res!690162 (bvsge (size!31816 thiss!1427) (_size!2878 thiss!1427)))))

(assert (= (and d!123715 res!690163) b!1032687))

(assert (= (and b!1032687 res!690161) b!1032688))

(assert (= (and b!1032688 res!690162) b!1032689))

(assert (= (and b!1032689 res!690164) b!1032690))

(assert (=> d!123715 m!952819))

(declare-fun m!952841 () Bool)

(assert (=> b!1032689 m!952841))

(assert (=> b!1032688 m!952841))

(assert (=> d!123713 d!123715))

(declare-fun bm!43608 () Bool)

(declare-fun call!43611 () Bool)

(assert (=> bm!43608 (= call!43611 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11372 thiss!1427) (mask!30023 thiss!1427)))))

(declare-fun b!1032699 () Bool)

(declare-fun e!583558 () Bool)

(declare-fun e!583557 () Bool)

(assert (=> b!1032699 (= e!583558 e!583557)))

(declare-fun lt!456061 () (_ BitVec 64))

(assert (=> b!1032699 (= lt!456061 (select (arr!31293 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33819 0))(
  ( (Unit!33820) )
))
(declare-fun lt!456060 () Unit!33819)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64986 (_ BitVec 64) (_ BitVec 32)) Unit!33819)

(assert (=> b!1032699 (= lt!456060 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11372 thiss!1427) lt!456061 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032699 (arrayContainsKey!0 (_keys!11372 thiss!1427) lt!456061 #b00000000000000000000000000000000)))

(declare-fun lt!456062 () Unit!33819)

(assert (=> b!1032699 (= lt!456062 lt!456060)))

(declare-fun res!690170 () Bool)

(declare-datatypes ((SeekEntryResult!9733 0))(
  ( (MissingZero!9733 (index!41303 (_ BitVec 32))) (Found!9733 (index!41304 (_ BitVec 32))) (Intermediate!9733 (undefined!10545 Bool) (index!41305 (_ BitVec 32)) (x!92055 (_ BitVec 32))) (Undefined!9733) (MissingVacant!9733 (index!41306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64986 (_ BitVec 32)) SeekEntryResult!9733)

(assert (=> b!1032699 (= res!690170 (= (seekEntryOrOpen!0 (select (arr!31293 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000) (_keys!11372 thiss!1427) (mask!30023 thiss!1427)) (Found!9733 #b00000000000000000000000000000000)))))

(assert (=> b!1032699 (=> (not res!690170) (not e!583557))))

(declare-fun b!1032700 () Bool)

(assert (=> b!1032700 (= e!583557 call!43611)))

(declare-fun b!1032701 () Bool)

(assert (=> b!1032701 (= e!583558 call!43611)))

(declare-fun d!123717 () Bool)

(declare-fun res!690169 () Bool)

(declare-fun e!583556 () Bool)

(assert (=> d!123717 (=> res!690169 e!583556)))

(assert (=> d!123717 (= res!690169 (bvsge #b00000000000000000000000000000000 (size!31812 (_keys!11372 thiss!1427))))))

(assert (=> d!123717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11372 thiss!1427) (mask!30023 thiss!1427)) e!583556)))

(declare-fun b!1032702 () Bool)

(assert (=> b!1032702 (= e!583556 e!583558)))

(declare-fun c!104328 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032702 (= c!104328 (validKeyInArray!0 (select (arr!31293 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123717 (not res!690169)) b!1032702))

(assert (= (and b!1032702 c!104328) b!1032699))

(assert (= (and b!1032702 (not c!104328)) b!1032701))

(assert (= (and b!1032699 res!690170) b!1032700))

(assert (= (or b!1032700 b!1032701) bm!43608))

(declare-fun m!952843 () Bool)

(assert (=> bm!43608 m!952843))

(declare-fun m!952845 () Bool)

(assert (=> b!1032699 m!952845))

(declare-fun m!952847 () Bool)

(assert (=> b!1032699 m!952847))

(declare-fun m!952849 () Bool)

(assert (=> b!1032699 m!952849))

(assert (=> b!1032699 m!952845))

(declare-fun m!952851 () Bool)

(assert (=> b!1032699 m!952851))

(assert (=> b!1032702 m!952845))

(assert (=> b!1032702 m!952845))

(declare-fun m!952853 () Bool)

(assert (=> b!1032702 m!952853))

(assert (=> b!1032669 d!123717))

(declare-fun bm!43611 () Bool)

(declare-fun call!43614 () (_ BitVec 32))

(assert (=> bm!43611 (= call!43614 (arrayCountValidKeys!0 (_keys!11372 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31812 (_keys!11372 thiss!1427))))))

(declare-fun b!1032711 () Bool)

(declare-fun e!583563 () (_ BitVec 32))

(assert (=> b!1032711 (= e!583563 call!43614)))

(declare-fun b!1032712 () Bool)

(declare-fun e!583564 () (_ BitVec 32))

(assert (=> b!1032712 (= e!583564 #b00000000000000000000000000000000)))

(declare-fun d!123719 () Bool)

(declare-fun lt!456065 () (_ BitVec 32))

(assert (=> d!123719 (and (bvsge lt!456065 #b00000000000000000000000000000000) (bvsle lt!456065 (bvsub (size!31812 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123719 (= lt!456065 e!583564)))

(declare-fun c!104333 () Bool)

(assert (=> d!123719 (= c!104333 (bvsge #b00000000000000000000000000000000 (size!31812 (_keys!11372 thiss!1427))))))

(assert (=> d!123719 (and (bvsle #b00000000000000000000000000000000 (size!31812 (_keys!11372 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31812 (_keys!11372 thiss!1427)) (size!31812 (_keys!11372 thiss!1427))))))

(assert (=> d!123719 (= (arrayCountValidKeys!0 (_keys!11372 thiss!1427) #b00000000000000000000000000000000 (size!31812 (_keys!11372 thiss!1427))) lt!456065)))

(declare-fun b!1032713 () Bool)

(assert (=> b!1032713 (= e!583564 e!583563)))

(declare-fun c!104334 () Bool)

(assert (=> b!1032713 (= c!104334 (validKeyInArray!0 (select (arr!31293 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032714 () Bool)

(assert (=> b!1032714 (= e!583563 (bvadd #b00000000000000000000000000000001 call!43614))))

(assert (= (and d!123719 c!104333) b!1032712))

(assert (= (and d!123719 (not c!104333)) b!1032713))

(assert (= (and b!1032713 c!104334) b!1032714))

(assert (= (and b!1032713 (not c!104334)) b!1032711))

(assert (= (or b!1032714 b!1032711) bm!43611))

(declare-fun m!952855 () Bool)

(assert (=> bm!43611 m!952855))

(assert (=> b!1032713 m!952845))

(assert (=> b!1032713 m!952845))

(assert (=> b!1032713 m!952853))

(assert (=> b!1032668 d!123719))

(declare-fun b!1032725 () Bool)

(declare-fun e!583575 () Bool)

(declare-fun contains!6008 (List!21897 (_ BitVec 64)) Bool)

(assert (=> b!1032725 (= e!583575 (contains!6008 Nil!21894 (select (arr!31293 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032726 () Bool)

(declare-fun e!583574 () Bool)

(declare-fun call!43617 () Bool)

(assert (=> b!1032726 (= e!583574 call!43617)))

(declare-fun d!123721 () Bool)

(declare-fun res!690177 () Bool)

(declare-fun e!583576 () Bool)

(assert (=> d!123721 (=> res!690177 e!583576)))

(assert (=> d!123721 (= res!690177 (bvsge #b00000000000000000000000000000000 (size!31812 (_keys!11372 thiss!1427))))))

(assert (=> d!123721 (= (arrayNoDuplicates!0 (_keys!11372 thiss!1427) #b00000000000000000000000000000000 Nil!21894) e!583576)))

(declare-fun b!1032727 () Bool)

(declare-fun e!583573 () Bool)

(assert (=> b!1032727 (= e!583576 e!583573)))

(declare-fun res!690179 () Bool)

(assert (=> b!1032727 (=> (not res!690179) (not e!583573))))

(assert (=> b!1032727 (= res!690179 (not e!583575))))

(declare-fun res!690178 () Bool)

(assert (=> b!1032727 (=> (not res!690178) (not e!583575))))

(assert (=> b!1032727 (= res!690178 (validKeyInArray!0 (select (arr!31293 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032728 () Bool)

(assert (=> b!1032728 (= e!583573 e!583574)))

(declare-fun c!104337 () Bool)

(assert (=> b!1032728 (= c!104337 (validKeyInArray!0 (select (arr!31293 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43614 () Bool)

(assert (=> bm!43614 (= call!43617 (arrayNoDuplicates!0 (_keys!11372 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104337 (Cons!21893 (select (arr!31293 (_keys!11372 thiss!1427)) #b00000000000000000000000000000000) Nil!21894) Nil!21894)))))

(declare-fun b!1032729 () Bool)

(assert (=> b!1032729 (= e!583574 call!43617)))

(assert (= (and d!123721 (not res!690177)) b!1032727))

(assert (= (and b!1032727 res!690178) b!1032725))

(assert (= (and b!1032727 res!690179) b!1032728))

(assert (= (and b!1032728 c!104337) b!1032726))

(assert (= (and b!1032728 (not c!104337)) b!1032729))

(assert (= (or b!1032726 b!1032729) bm!43614))

(assert (=> b!1032725 m!952845))

(assert (=> b!1032725 m!952845))

(declare-fun m!952857 () Bool)

(assert (=> b!1032725 m!952857))

(assert (=> b!1032727 m!952845))

(assert (=> b!1032727 m!952845))

(assert (=> b!1032727 m!952853))

(assert (=> b!1032728 m!952845))

(assert (=> b!1032728 m!952845))

(assert (=> b!1032728 m!952853))

(assert (=> bm!43614 m!952845))

(declare-fun m!952859 () Bool)

(assert (=> bm!43614 m!952859))

(assert (=> b!1032670 d!123721))

(declare-fun mapNonEmpty!38157 () Bool)

(declare-fun mapRes!38157 () Bool)

(declare-fun tp!73306 () Bool)

(declare-fun e!583577 () Bool)

(assert (=> mapNonEmpty!38157 (= mapRes!38157 (and tp!73306 e!583577))))

(declare-fun mapValue!38157 () ValueCell!11526)

(declare-fun mapRest!38157 () (Array (_ BitVec 32) ValueCell!11526))

(declare-fun mapKey!38157 () (_ BitVec 32))

(assert (=> mapNonEmpty!38157 (= mapRest!38156 (store mapRest!38157 mapKey!38157 mapValue!38157))))

(declare-fun mapIsEmpty!38157 () Bool)

(assert (=> mapIsEmpty!38157 mapRes!38157))

(declare-fun b!1032731 () Bool)

(declare-fun e!583578 () Bool)

(assert (=> b!1032731 (= e!583578 tp_is_empty!24459)))

(declare-fun condMapEmpty!38157 () Bool)

(declare-fun mapDefault!38157 () ValueCell!11526)

(assert (=> mapNonEmpty!38156 (= condMapEmpty!38157 (= mapRest!38156 ((as const (Array (_ BitVec 32) ValueCell!11526)) mapDefault!38157)))))

(assert (=> mapNonEmpty!38156 (= tp!73305 (and e!583578 mapRes!38157))))

(declare-fun b!1032730 () Bool)

(assert (=> b!1032730 (= e!583577 tp_is_empty!24459)))

(assert (= (and mapNonEmpty!38156 condMapEmpty!38157) mapIsEmpty!38157))

(assert (= (and mapNonEmpty!38156 (not condMapEmpty!38157)) mapNonEmpty!38157))

(assert (= (and mapNonEmpty!38157 ((_ is ValueCellFull!11526) mapValue!38157)) b!1032730))

(assert (= (and mapNonEmpty!38156 ((_ is ValueCellFull!11526) mapDefault!38157)) b!1032731))

(declare-fun m!952861 () Bool)

(assert (=> mapNonEmpty!38157 m!952861))

(check-sat (not b!1032699) (not b!1032713) (not d!123715) (not b_next!20739) (not bm!43608) (not bm!43611) (not bm!43614) (not mapNonEmpty!38157) tp_is_empty!24459 b_and!33207 (not b!1032688) (not b!1032702) (not b!1032725) (not b!1032727) (not b!1032689) (not b!1032728))
(check-sat b_and!33207 (not b_next!20739))
