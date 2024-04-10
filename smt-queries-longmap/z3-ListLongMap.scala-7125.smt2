; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90394 () Bool)

(assert start!90394)

(declare-fun b!1034681 () Bool)

(declare-fun b_free!20805 () Bool)

(declare-fun b_next!20805 () Bool)

(assert (=> b!1034681 (= b_free!20805 (not b_next!20805))))

(declare-fun tp!73520 () Bool)

(declare-fun b_and!33305 () Bool)

(assert (=> b!1034681 (= tp!73520 b_and!33305)))

(declare-fun b!1034680 () Bool)

(declare-fun e!584924 () Bool)

(declare-fun e!584922 () Bool)

(declare-fun mapRes!38275 () Bool)

(assert (=> b!1034680 (= e!584924 (and e!584922 mapRes!38275))))

(declare-fun condMapEmpty!38275 () Bool)

(declare-datatypes ((V!37573 0))(
  ( (V!37574 (val!12313 Int)) )
))
(declare-datatypes ((ValueCell!11559 0))(
  ( (ValueCellFull!11559 (v!14893 V!37573)) (EmptyCell!11559) )
))
(declare-datatypes ((array!65132 0))(
  ( (array!65133 (arr!31359 (Array (_ BitVec 32) (_ BitVec 64))) (size!31882 (_ BitVec 32))) )
))
(declare-datatypes ((array!65134 0))(
  ( (array!65135 (arr!31360 (Array (_ BitVec 32) ValueCell!11559)) (size!31883 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5712 0))(
  ( (LongMapFixedSize!5713 (defaultEntry!6234 Int) (mask!30096 (_ BitVec 32)) (extraKeys!5964 (_ BitVec 32)) (zeroValue!6068 V!37573) (minValue!6070 V!37573) (_size!2911 (_ BitVec 32)) (_keys!11416 array!65132) (_values!6257 array!65134) (_vacant!2911 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5712)

(declare-fun mapDefault!38275 () ValueCell!11559)

(assert (=> b!1034680 (= condMapEmpty!38275 (= (arr!31360 (_values!6257 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11559)) mapDefault!38275)))))

(declare-fun mapIsEmpty!38275 () Bool)

(assert (=> mapIsEmpty!38275 mapRes!38275))

(declare-fun e!584920 () Bool)

(declare-fun tp_is_empty!24525 () Bool)

(declare-fun array_inv!24259 (array!65132) Bool)

(declare-fun array_inv!24260 (array!65134) Bool)

(assert (=> b!1034681 (= e!584920 (and tp!73520 tp_is_empty!24525 (array_inv!24259 (_keys!11416 thiss!1427)) (array_inv!24260 (_values!6257 thiss!1427)) e!584924))))

(declare-fun mapNonEmpty!38275 () Bool)

(declare-fun tp!73519 () Bool)

(declare-fun e!584923 () Bool)

(assert (=> mapNonEmpty!38275 (= mapRes!38275 (and tp!73519 e!584923))))

(declare-fun mapKey!38275 () (_ BitVec 32))

(declare-fun mapValue!38275 () ValueCell!11559)

(declare-fun mapRest!38275 () (Array (_ BitVec 32) ValueCell!11559))

(assert (=> mapNonEmpty!38275 (= (arr!31360 (_values!6257 thiss!1427)) (store mapRest!38275 mapKey!38275 mapValue!38275))))

(declare-fun b!1034682 () Bool)

(assert (=> b!1034682 (= e!584922 tp_is_empty!24525)))

(declare-fun b!1034683 () Bool)

(declare-fun e!584925 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034683 (= e!584925 (not (validMask!0 (mask!30096 thiss!1427))))))

(declare-fun res!691004 () Bool)

(assert (=> start!90394 (=> (not res!691004) (not e!584925))))

(declare-fun valid!2158 (LongMapFixedSize!5712) Bool)

(assert (=> start!90394 (= res!691004 (valid!2158 thiss!1427))))

(assert (=> start!90394 e!584925))

(assert (=> start!90394 e!584920))

(assert (=> start!90394 true))

(declare-fun b!1034684 () Bool)

(assert (=> b!1034684 (= e!584923 tp_is_empty!24525)))

(declare-fun b!1034685 () Bool)

(declare-fun res!691003 () Bool)

(assert (=> b!1034685 (=> (not res!691003) (not e!584925))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034685 (= res!691003 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!90394 res!691004) b!1034685))

(assert (= (and b!1034685 res!691003) b!1034683))

(assert (= (and b!1034680 condMapEmpty!38275) mapIsEmpty!38275))

(assert (= (and b!1034680 (not condMapEmpty!38275)) mapNonEmpty!38275))

(get-info :version)

(assert (= (and mapNonEmpty!38275 ((_ is ValueCellFull!11559) mapValue!38275)) b!1034684))

(assert (= (and b!1034680 ((_ is ValueCellFull!11559) mapDefault!38275)) b!1034682))

(assert (= b!1034681 b!1034680))

(assert (= start!90394 b!1034681))

(declare-fun m!955023 () Bool)

(assert (=> b!1034681 m!955023))

(declare-fun m!955025 () Bool)

(assert (=> b!1034681 m!955025))

(declare-fun m!955027 () Bool)

(assert (=> mapNonEmpty!38275 m!955027))

(declare-fun m!955029 () Bool)

(assert (=> b!1034683 m!955029))

(declare-fun m!955031 () Bool)

(assert (=> start!90394 m!955031))

(check-sat b_and!33305 (not mapNonEmpty!38275) (not b_next!20805) (not start!90394) (not b!1034683) tp_is_empty!24525 (not b!1034681))
(check-sat b_and!33305 (not b_next!20805))
(get-model)

(declare-fun d!124425 () Bool)

(declare-fun res!691017 () Bool)

(declare-fun e!584946 () Bool)

(assert (=> d!124425 (=> (not res!691017) (not e!584946))))

(declare-fun simpleValid!406 (LongMapFixedSize!5712) Bool)

(assert (=> d!124425 (= res!691017 (simpleValid!406 thiss!1427))))

(assert (=> d!124425 (= (valid!2158 thiss!1427) e!584946)))

(declare-fun b!1034710 () Bool)

(declare-fun res!691018 () Bool)

(assert (=> b!1034710 (=> (not res!691018) (not e!584946))))

(declare-fun arrayCountValidKeys!0 (array!65132 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034710 (= res!691018 (= (arrayCountValidKeys!0 (_keys!11416 thiss!1427) #b00000000000000000000000000000000 (size!31882 (_keys!11416 thiss!1427))) (_size!2911 thiss!1427)))))

(declare-fun b!1034711 () Bool)

(declare-fun res!691019 () Bool)

(assert (=> b!1034711 (=> (not res!691019) (not e!584946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65132 (_ BitVec 32)) Bool)

(assert (=> b!1034711 (= res!691019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11416 thiss!1427) (mask!30096 thiss!1427)))))

(declare-fun b!1034712 () Bool)

(declare-datatypes ((List!21908 0))(
  ( (Nil!21905) (Cons!21904 (h!23106 (_ BitVec 64)) (t!31111 List!21908)) )
))
(declare-fun arrayNoDuplicates!0 (array!65132 (_ BitVec 32) List!21908) Bool)

(assert (=> b!1034712 (= e!584946 (arrayNoDuplicates!0 (_keys!11416 thiss!1427) #b00000000000000000000000000000000 Nil!21905))))

(assert (= (and d!124425 res!691017) b!1034710))

(assert (= (and b!1034710 res!691018) b!1034711))

(assert (= (and b!1034711 res!691019) b!1034712))

(declare-fun m!955043 () Bool)

(assert (=> d!124425 m!955043))

(declare-fun m!955045 () Bool)

(assert (=> b!1034710 m!955045))

(declare-fun m!955047 () Bool)

(assert (=> b!1034711 m!955047))

(declare-fun m!955049 () Bool)

(assert (=> b!1034712 m!955049))

(assert (=> start!90394 d!124425))

(declare-fun d!124427 () Bool)

(assert (=> d!124427 (= (array_inv!24259 (_keys!11416 thiss!1427)) (bvsge (size!31882 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034681 d!124427))

(declare-fun d!124429 () Bool)

(assert (=> d!124429 (= (array_inv!24260 (_values!6257 thiss!1427)) (bvsge (size!31883 (_values!6257 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034681 d!124429))

(declare-fun d!124431 () Bool)

(assert (=> d!124431 (= (validMask!0 (mask!30096 thiss!1427)) (and (or (= (mask!30096 thiss!1427) #b00000000000000000000000000000111) (= (mask!30096 thiss!1427) #b00000000000000000000000000001111) (= (mask!30096 thiss!1427) #b00000000000000000000000000011111) (= (mask!30096 thiss!1427) #b00000000000000000000000000111111) (= (mask!30096 thiss!1427) #b00000000000000000000000001111111) (= (mask!30096 thiss!1427) #b00000000000000000000000011111111) (= (mask!30096 thiss!1427) #b00000000000000000000000111111111) (= (mask!30096 thiss!1427) #b00000000000000000000001111111111) (= (mask!30096 thiss!1427) #b00000000000000000000011111111111) (= (mask!30096 thiss!1427) #b00000000000000000000111111111111) (= (mask!30096 thiss!1427) #b00000000000000000001111111111111) (= (mask!30096 thiss!1427) #b00000000000000000011111111111111) (= (mask!30096 thiss!1427) #b00000000000000000111111111111111) (= (mask!30096 thiss!1427) #b00000000000000001111111111111111) (= (mask!30096 thiss!1427) #b00000000000000011111111111111111) (= (mask!30096 thiss!1427) #b00000000000000111111111111111111) (= (mask!30096 thiss!1427) #b00000000000001111111111111111111) (= (mask!30096 thiss!1427) #b00000000000011111111111111111111) (= (mask!30096 thiss!1427) #b00000000000111111111111111111111) (= (mask!30096 thiss!1427) #b00000000001111111111111111111111) (= (mask!30096 thiss!1427) #b00000000011111111111111111111111) (= (mask!30096 thiss!1427) #b00000000111111111111111111111111) (= (mask!30096 thiss!1427) #b00000001111111111111111111111111) (= (mask!30096 thiss!1427) #b00000011111111111111111111111111) (= (mask!30096 thiss!1427) #b00000111111111111111111111111111) (= (mask!30096 thiss!1427) #b00001111111111111111111111111111) (= (mask!30096 thiss!1427) #b00011111111111111111111111111111) (= (mask!30096 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30096 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034683 d!124431))

(declare-fun mapNonEmpty!38281 () Bool)

(declare-fun mapRes!38281 () Bool)

(declare-fun tp!73529 () Bool)

(declare-fun e!584951 () Bool)

(assert (=> mapNonEmpty!38281 (= mapRes!38281 (and tp!73529 e!584951))))

(declare-fun mapKey!38281 () (_ BitVec 32))

(declare-fun mapRest!38281 () (Array (_ BitVec 32) ValueCell!11559))

(declare-fun mapValue!38281 () ValueCell!11559)

(assert (=> mapNonEmpty!38281 (= mapRest!38275 (store mapRest!38281 mapKey!38281 mapValue!38281))))

(declare-fun b!1034719 () Bool)

(assert (=> b!1034719 (= e!584951 tp_is_empty!24525)))

(declare-fun mapIsEmpty!38281 () Bool)

(assert (=> mapIsEmpty!38281 mapRes!38281))

(declare-fun b!1034720 () Bool)

(declare-fun e!584952 () Bool)

(assert (=> b!1034720 (= e!584952 tp_is_empty!24525)))

(declare-fun condMapEmpty!38281 () Bool)

(declare-fun mapDefault!38281 () ValueCell!11559)

(assert (=> mapNonEmpty!38275 (= condMapEmpty!38281 (= mapRest!38275 ((as const (Array (_ BitVec 32) ValueCell!11559)) mapDefault!38281)))))

(assert (=> mapNonEmpty!38275 (= tp!73519 (and e!584952 mapRes!38281))))

(assert (= (and mapNonEmpty!38275 condMapEmpty!38281) mapIsEmpty!38281))

(assert (= (and mapNonEmpty!38275 (not condMapEmpty!38281)) mapNonEmpty!38281))

(assert (= (and mapNonEmpty!38281 ((_ is ValueCellFull!11559) mapValue!38281)) b!1034719))

(assert (= (and mapNonEmpty!38275 ((_ is ValueCellFull!11559) mapDefault!38281)) b!1034720))

(declare-fun m!955051 () Bool)

(assert (=> mapNonEmpty!38281 m!955051))

(check-sat (not b!1034712) (not d!124425) (not mapNonEmpty!38281) b_and!33305 (not b!1034710) (not b!1034711) (not b_next!20805) tp_is_empty!24525)
(check-sat b_and!33305 (not b_next!20805))
(get-model)

(declare-fun d!124433 () Bool)

(declare-fun res!691027 () Bool)

(declare-fun e!584964 () Bool)

(assert (=> d!124433 (=> res!691027 e!584964)))

(assert (=> d!124433 (= res!691027 (bvsge #b00000000000000000000000000000000 (size!31882 (_keys!11416 thiss!1427))))))

(assert (=> d!124433 (= (arrayNoDuplicates!0 (_keys!11416 thiss!1427) #b00000000000000000000000000000000 Nil!21905) e!584964)))

(declare-fun b!1034731 () Bool)

(declare-fun e!584963 () Bool)

(assert (=> b!1034731 (= e!584964 e!584963)))

(declare-fun res!691026 () Bool)

(assert (=> b!1034731 (=> (not res!691026) (not e!584963))))

(declare-fun e!584961 () Bool)

(assert (=> b!1034731 (= res!691026 (not e!584961))))

(declare-fun res!691028 () Bool)

(assert (=> b!1034731 (=> (not res!691028) (not e!584961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034731 (= res!691028 (validKeyInArray!0 (select (arr!31359 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43746 () Bool)

(declare-fun call!43749 () Bool)

(declare-fun c!104679 () Bool)

(assert (=> bm!43746 (= call!43749 (arrayNoDuplicates!0 (_keys!11416 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104679 (Cons!21904 (select (arr!31359 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000) Nil!21905) Nil!21905)))))

(declare-fun b!1034732 () Bool)

(declare-fun e!584962 () Bool)

(assert (=> b!1034732 (= e!584962 call!43749)))

(declare-fun b!1034733 () Bool)

(assert (=> b!1034733 (= e!584962 call!43749)))

(declare-fun b!1034734 () Bool)

(assert (=> b!1034734 (= e!584963 e!584962)))

(assert (=> b!1034734 (= c!104679 (validKeyInArray!0 (select (arr!31359 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034735 () Bool)

(declare-fun contains!6015 (List!21908 (_ BitVec 64)) Bool)

(assert (=> b!1034735 (= e!584961 (contains!6015 Nil!21905 (select (arr!31359 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124433 (not res!691027)) b!1034731))

(assert (= (and b!1034731 res!691028) b!1034735))

(assert (= (and b!1034731 res!691026) b!1034734))

(assert (= (and b!1034734 c!104679) b!1034733))

(assert (= (and b!1034734 (not c!104679)) b!1034732))

(assert (= (or b!1034733 b!1034732) bm!43746))

(declare-fun m!955053 () Bool)

(assert (=> b!1034731 m!955053))

(assert (=> b!1034731 m!955053))

(declare-fun m!955055 () Bool)

(assert (=> b!1034731 m!955055))

(assert (=> bm!43746 m!955053))

(declare-fun m!955057 () Bool)

(assert (=> bm!43746 m!955057))

(assert (=> b!1034734 m!955053))

(assert (=> b!1034734 m!955053))

(assert (=> b!1034734 m!955055))

(assert (=> b!1034735 m!955053))

(assert (=> b!1034735 m!955053))

(declare-fun m!955059 () Bool)

(assert (=> b!1034735 m!955059))

(assert (=> b!1034712 d!124433))

(declare-fun b!1034744 () Bool)

(declare-fun e!584973 () Bool)

(declare-fun e!584972 () Bool)

(assert (=> b!1034744 (= e!584973 e!584972)))

(declare-fun c!104682 () Bool)

(assert (=> b!1034744 (= c!104682 (validKeyInArray!0 (select (arr!31359 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124435 () Bool)

(declare-fun res!691034 () Bool)

(assert (=> d!124435 (=> res!691034 e!584973)))

(assert (=> d!124435 (= res!691034 (bvsge #b00000000000000000000000000000000 (size!31882 (_keys!11416 thiss!1427))))))

(assert (=> d!124435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11416 thiss!1427) (mask!30096 thiss!1427)) e!584973)))

(declare-fun b!1034745 () Bool)

(declare-fun e!584971 () Bool)

(declare-fun call!43752 () Bool)

(assert (=> b!1034745 (= e!584971 call!43752)))

(declare-fun b!1034746 () Bool)

(assert (=> b!1034746 (= e!584972 e!584971)))

(declare-fun lt!456704 () (_ BitVec 64))

(assert (=> b!1034746 (= lt!456704 (select (arr!31359 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33880 0))(
  ( (Unit!33881) )
))
(declare-fun lt!456705 () Unit!33880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65132 (_ BitVec 64) (_ BitVec 32)) Unit!33880)

(assert (=> b!1034746 (= lt!456705 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11416 thiss!1427) lt!456704 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034746 (arrayContainsKey!0 (_keys!11416 thiss!1427) lt!456704 #b00000000000000000000000000000000)))

(declare-fun lt!456703 () Unit!33880)

(assert (=> b!1034746 (= lt!456703 lt!456705)))

(declare-fun res!691033 () Bool)

(declare-datatypes ((SeekEntryResult!9739 0))(
  ( (MissingZero!9739 (index!41327 (_ BitVec 32))) (Found!9739 (index!41328 (_ BitVec 32))) (Intermediate!9739 (undefined!10551 Bool) (index!41329 (_ BitVec 32)) (x!92256 (_ BitVec 32))) (Undefined!9739) (MissingVacant!9739 (index!41330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65132 (_ BitVec 32)) SeekEntryResult!9739)

(assert (=> b!1034746 (= res!691033 (= (seekEntryOrOpen!0 (select (arr!31359 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000) (_keys!11416 thiss!1427) (mask!30096 thiss!1427)) (Found!9739 #b00000000000000000000000000000000)))))

(assert (=> b!1034746 (=> (not res!691033) (not e!584971))))

(declare-fun b!1034747 () Bool)

(assert (=> b!1034747 (= e!584972 call!43752)))

(declare-fun bm!43749 () Bool)

(assert (=> bm!43749 (= call!43752 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11416 thiss!1427) (mask!30096 thiss!1427)))))

(assert (= (and d!124435 (not res!691034)) b!1034744))

(assert (= (and b!1034744 c!104682) b!1034746))

(assert (= (and b!1034744 (not c!104682)) b!1034747))

(assert (= (and b!1034746 res!691033) b!1034745))

(assert (= (or b!1034745 b!1034747) bm!43749))

(assert (=> b!1034744 m!955053))

(assert (=> b!1034744 m!955053))

(assert (=> b!1034744 m!955055))

(assert (=> b!1034746 m!955053))

(declare-fun m!955061 () Bool)

(assert (=> b!1034746 m!955061))

(declare-fun m!955063 () Bool)

(assert (=> b!1034746 m!955063))

(assert (=> b!1034746 m!955053))

(declare-fun m!955065 () Bool)

(assert (=> b!1034746 m!955065))

(declare-fun m!955067 () Bool)

(assert (=> bm!43749 m!955067))

(assert (=> b!1034711 d!124435))

(declare-fun b!1034756 () Bool)

(declare-fun e!584978 () (_ BitVec 32))

(declare-fun e!584979 () (_ BitVec 32))

(assert (=> b!1034756 (= e!584978 e!584979)))

(declare-fun c!104688 () Bool)

(assert (=> b!1034756 (= c!104688 (validKeyInArray!0 (select (arr!31359 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124437 () Bool)

(declare-fun lt!456708 () (_ BitVec 32))

(assert (=> d!124437 (and (bvsge lt!456708 #b00000000000000000000000000000000) (bvsle lt!456708 (bvsub (size!31882 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124437 (= lt!456708 e!584978)))

(declare-fun c!104687 () Bool)

(assert (=> d!124437 (= c!104687 (bvsge #b00000000000000000000000000000000 (size!31882 (_keys!11416 thiss!1427))))))

(assert (=> d!124437 (and (bvsle #b00000000000000000000000000000000 (size!31882 (_keys!11416 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31882 (_keys!11416 thiss!1427)) (size!31882 (_keys!11416 thiss!1427))))))

(assert (=> d!124437 (= (arrayCountValidKeys!0 (_keys!11416 thiss!1427) #b00000000000000000000000000000000 (size!31882 (_keys!11416 thiss!1427))) lt!456708)))

(declare-fun bm!43752 () Bool)

(declare-fun call!43755 () (_ BitVec 32))

(assert (=> bm!43752 (= call!43755 (arrayCountValidKeys!0 (_keys!11416 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31882 (_keys!11416 thiss!1427))))))

(declare-fun b!1034757 () Bool)

(assert (=> b!1034757 (= e!584979 (bvadd #b00000000000000000000000000000001 call!43755))))

(declare-fun b!1034758 () Bool)

(assert (=> b!1034758 (= e!584978 #b00000000000000000000000000000000)))

(declare-fun b!1034759 () Bool)

(assert (=> b!1034759 (= e!584979 call!43755)))

(assert (= (and d!124437 c!104687) b!1034758))

(assert (= (and d!124437 (not c!104687)) b!1034756))

(assert (= (and b!1034756 c!104688) b!1034757))

(assert (= (and b!1034756 (not c!104688)) b!1034759))

(assert (= (or b!1034757 b!1034759) bm!43752))

(assert (=> b!1034756 m!955053))

(assert (=> b!1034756 m!955053))

(assert (=> b!1034756 m!955055))

(declare-fun m!955069 () Bool)

(assert (=> bm!43752 m!955069))

(assert (=> b!1034710 d!124437))

(declare-fun b!1034769 () Bool)

(declare-fun res!691043 () Bool)

(declare-fun e!584982 () Bool)

(assert (=> b!1034769 (=> (not res!691043) (not e!584982))))

(declare-fun size!31886 (LongMapFixedSize!5712) (_ BitVec 32))

(assert (=> b!1034769 (= res!691043 (bvsge (size!31886 thiss!1427) (_size!2911 thiss!1427)))))

(declare-fun b!1034768 () Bool)

(declare-fun res!691044 () Bool)

(assert (=> b!1034768 (=> (not res!691044) (not e!584982))))

(assert (=> b!1034768 (= res!691044 (and (= (size!31883 (_values!6257 thiss!1427)) (bvadd (mask!30096 thiss!1427) #b00000000000000000000000000000001)) (= (size!31882 (_keys!11416 thiss!1427)) (size!31883 (_values!6257 thiss!1427))) (bvsge (_size!2911 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2911 thiss!1427) (bvadd (mask!30096 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!124439 () Bool)

(declare-fun res!691045 () Bool)

(assert (=> d!124439 (=> (not res!691045) (not e!584982))))

(assert (=> d!124439 (= res!691045 (validMask!0 (mask!30096 thiss!1427)))))

(assert (=> d!124439 (= (simpleValid!406 thiss!1427) e!584982)))

(declare-fun b!1034770 () Bool)

(declare-fun res!691046 () Bool)

(assert (=> b!1034770 (=> (not res!691046) (not e!584982))))

(assert (=> b!1034770 (= res!691046 (= (size!31886 thiss!1427) (bvadd (_size!2911 thiss!1427) (bvsdiv (bvadd (extraKeys!5964 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1034771 () Bool)

(assert (=> b!1034771 (= e!584982 (and (bvsge (extraKeys!5964 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5964 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2911 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124439 res!691045) b!1034768))

(assert (= (and b!1034768 res!691044) b!1034769))

(assert (= (and b!1034769 res!691043) b!1034770))

(assert (= (and b!1034770 res!691046) b!1034771))

(declare-fun m!955071 () Bool)

(assert (=> b!1034769 m!955071))

(assert (=> d!124439 m!955029))

(assert (=> b!1034770 m!955071))

(assert (=> d!124425 d!124439))

(declare-fun mapNonEmpty!38282 () Bool)

(declare-fun mapRes!38282 () Bool)

(declare-fun tp!73530 () Bool)

(declare-fun e!584983 () Bool)

(assert (=> mapNonEmpty!38282 (= mapRes!38282 (and tp!73530 e!584983))))

(declare-fun mapKey!38282 () (_ BitVec 32))

(declare-fun mapValue!38282 () ValueCell!11559)

(declare-fun mapRest!38282 () (Array (_ BitVec 32) ValueCell!11559))

(assert (=> mapNonEmpty!38282 (= mapRest!38281 (store mapRest!38282 mapKey!38282 mapValue!38282))))

(declare-fun b!1034772 () Bool)

(assert (=> b!1034772 (= e!584983 tp_is_empty!24525)))

(declare-fun mapIsEmpty!38282 () Bool)

(assert (=> mapIsEmpty!38282 mapRes!38282))

(declare-fun b!1034773 () Bool)

(declare-fun e!584984 () Bool)

(assert (=> b!1034773 (= e!584984 tp_is_empty!24525)))

(declare-fun condMapEmpty!38282 () Bool)

(declare-fun mapDefault!38282 () ValueCell!11559)

(assert (=> mapNonEmpty!38281 (= condMapEmpty!38282 (= mapRest!38281 ((as const (Array (_ BitVec 32) ValueCell!11559)) mapDefault!38282)))))

(assert (=> mapNonEmpty!38281 (= tp!73529 (and e!584984 mapRes!38282))))

(assert (= (and mapNonEmpty!38281 condMapEmpty!38282) mapIsEmpty!38282))

(assert (= (and mapNonEmpty!38281 (not condMapEmpty!38282)) mapNonEmpty!38282))

(assert (= (and mapNonEmpty!38282 ((_ is ValueCellFull!11559) mapValue!38282)) b!1034772))

(assert (= (and mapNonEmpty!38281 ((_ is ValueCellFull!11559) mapDefault!38282)) b!1034773))

(declare-fun m!955073 () Bool)

(assert (=> mapNonEmpty!38282 m!955073))

(check-sat (not b!1034731) (not b!1034770) (not b!1034735) (not b!1034744) (not bm!43752) tp_is_empty!24525 (not b!1034734) (not bm!43746) (not b!1034746) (not b!1034756) (not b!1034769) b_and!33305 (not mapNonEmpty!38282) (not bm!43749) (not b_next!20805) (not d!124439))
(check-sat b_and!33305 (not b_next!20805))
