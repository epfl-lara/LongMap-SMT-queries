; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90500 () Bool)

(assert start!90500)

(declare-fun b!1034666 () Bool)

(declare-fun b_free!20785 () Bool)

(declare-fun b_next!20785 () Bool)

(assert (=> b!1034666 (= b_free!20785 (not b_next!20785))))

(declare-fun tp!73448 () Bool)

(declare-fun b_and!33263 () Bool)

(assert (=> b!1034666 (= tp!73448 b_and!33263)))

(declare-fun b!1034661 () Bool)

(declare-fun e!584904 () Bool)

(declare-fun tp_is_empty!24505 () Bool)

(assert (=> b!1034661 (= e!584904 tp_is_empty!24505)))

(declare-fun b!1034662 () Bool)

(declare-fun e!584903 () Bool)

(declare-fun mapRes!38234 () Bool)

(assert (=> b!1034662 (= e!584903 (and e!584904 mapRes!38234))))

(declare-fun condMapEmpty!38234 () Bool)

(declare-datatypes ((V!37547 0))(
  ( (V!37548 (val!12303 Int)) )
))
(declare-datatypes ((ValueCell!11549 0))(
  ( (ValueCellFull!11549 (v!14876 V!37547)) (EmptyCell!11549) )
))
(declare-datatypes ((array!65135 0))(
  ( (array!65136 (arr!31357 (Array (_ BitVec 32) (_ BitVec 64))) (size!31880 (_ BitVec 32))) )
))
(declare-datatypes ((array!65137 0))(
  ( (array!65138 (arr!31358 (Array (_ BitVec 32) ValueCell!11549)) (size!31881 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5692 0))(
  ( (LongMapFixedSize!5693 (defaultEntry!6220 Int) (mask!30129 (_ BitVec 32)) (extraKeys!5952 (_ BitVec 32)) (zeroValue!6056 V!37547) (minValue!6056 V!37547) (_size!2901 (_ BitVec 32)) (_keys!11436 array!65135) (_values!6243 array!65137) (_vacant!2901 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5692)

(declare-fun mapDefault!38234 () ValueCell!11549)

(assert (=> b!1034662 (= condMapEmpty!38234 (= (arr!31358 (_values!6243 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11549)) mapDefault!38234)))))

(declare-fun b!1034663 () Bool)

(declare-fun e!584907 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65135 (_ BitVec 32)) Bool)

(assert (=> b!1034663 (= e!584907 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11436 thiss!1427) (mask!30129 thiss!1427))))))

(declare-fun res!690969 () Bool)

(assert (=> start!90500 (=> (not res!690969) (not e!584907))))

(declare-fun valid!2158 (LongMapFixedSize!5692) Bool)

(assert (=> start!90500 (= res!690969 (valid!2158 thiss!1427))))

(assert (=> start!90500 e!584907))

(declare-fun e!584905 () Bool)

(assert (=> start!90500 e!584905))

(assert (=> start!90500 true))

(declare-fun b!1034664 () Bool)

(declare-fun res!690968 () Bool)

(assert (=> b!1034664 (=> (not res!690968) (not e!584907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034664 (= res!690968 (validMask!0 (mask!30129 thiss!1427)))))

(declare-fun b!1034665 () Bool)

(declare-fun res!690971 () Bool)

(assert (=> b!1034665 (=> (not res!690971) (not e!584907))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034665 (= res!690971 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38234 () Bool)

(declare-fun tp!73449 () Bool)

(declare-fun e!584906 () Bool)

(assert (=> mapNonEmpty!38234 (= mapRes!38234 (and tp!73449 e!584906))))

(declare-fun mapRest!38234 () (Array (_ BitVec 32) ValueCell!11549))

(declare-fun mapKey!38234 () (_ BitVec 32))

(declare-fun mapValue!38234 () ValueCell!11549)

(assert (=> mapNonEmpty!38234 (= (arr!31358 (_values!6243 thiss!1427)) (store mapRest!38234 mapKey!38234 mapValue!38234))))

(declare-fun array_inv!24271 (array!65135) Bool)

(declare-fun array_inv!24272 (array!65137) Bool)

(assert (=> b!1034666 (= e!584905 (and tp!73448 tp_is_empty!24505 (array_inv!24271 (_keys!11436 thiss!1427)) (array_inv!24272 (_values!6243 thiss!1427)) e!584903))))

(declare-fun mapIsEmpty!38234 () Bool)

(assert (=> mapIsEmpty!38234 mapRes!38234))

(declare-fun b!1034667 () Bool)

(assert (=> b!1034667 (= e!584906 tp_is_empty!24505)))

(declare-fun b!1034668 () Bool)

(declare-fun res!690970 () Bool)

(assert (=> b!1034668 (=> (not res!690970) (not e!584907))))

(assert (=> b!1034668 (= res!690970 (and (= (size!31881 (_values!6243 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30129 thiss!1427))) (= (size!31880 (_keys!11436 thiss!1427)) (size!31881 (_values!6243 thiss!1427))) (bvsge (mask!30129 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5952 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5952 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5952 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!90500 res!690969) b!1034665))

(assert (= (and b!1034665 res!690971) b!1034664))

(assert (= (and b!1034664 res!690968) b!1034668))

(assert (= (and b!1034668 res!690970) b!1034663))

(assert (= (and b!1034662 condMapEmpty!38234) mapIsEmpty!38234))

(assert (= (and b!1034662 (not condMapEmpty!38234)) mapNonEmpty!38234))

(get-info :version)

(assert (= (and mapNonEmpty!38234 ((_ is ValueCellFull!11549) mapValue!38234)) b!1034667))

(assert (= (and b!1034662 ((_ is ValueCellFull!11549) mapDefault!38234)) b!1034661))

(assert (= b!1034666 b!1034662))

(assert (= start!90500 b!1034666))

(declare-fun m!954811 () Bool)

(assert (=> b!1034666 m!954811))

(declare-fun m!954813 () Bool)

(assert (=> b!1034666 m!954813))

(declare-fun m!954815 () Bool)

(assert (=> start!90500 m!954815))

(declare-fun m!954817 () Bool)

(assert (=> mapNonEmpty!38234 m!954817))

(declare-fun m!954819 () Bool)

(assert (=> b!1034663 m!954819))

(declare-fun m!954821 () Bool)

(assert (=> b!1034664 m!954821))

(check-sat (not b_next!20785) (not start!90500) (not b!1034664) (not b!1034663) b_and!33263 (not b!1034666) (not mapNonEmpty!38234) tp_is_empty!24505)
(check-sat b_and!33263 (not b_next!20785))
(get-model)

(declare-fun d!124241 () Bool)

(assert (=> d!124241 (= (validMask!0 (mask!30129 thiss!1427)) (and (or (= (mask!30129 thiss!1427) #b00000000000000000000000000000111) (= (mask!30129 thiss!1427) #b00000000000000000000000000001111) (= (mask!30129 thiss!1427) #b00000000000000000000000000011111) (= (mask!30129 thiss!1427) #b00000000000000000000000000111111) (= (mask!30129 thiss!1427) #b00000000000000000000000001111111) (= (mask!30129 thiss!1427) #b00000000000000000000000011111111) (= (mask!30129 thiss!1427) #b00000000000000000000000111111111) (= (mask!30129 thiss!1427) #b00000000000000000000001111111111) (= (mask!30129 thiss!1427) #b00000000000000000000011111111111) (= (mask!30129 thiss!1427) #b00000000000000000000111111111111) (= (mask!30129 thiss!1427) #b00000000000000000001111111111111) (= (mask!30129 thiss!1427) #b00000000000000000011111111111111) (= (mask!30129 thiss!1427) #b00000000000000000111111111111111) (= (mask!30129 thiss!1427) #b00000000000000001111111111111111) (= (mask!30129 thiss!1427) #b00000000000000011111111111111111) (= (mask!30129 thiss!1427) #b00000000000000111111111111111111) (= (mask!30129 thiss!1427) #b00000000000001111111111111111111) (= (mask!30129 thiss!1427) #b00000000000011111111111111111111) (= (mask!30129 thiss!1427) #b00000000000111111111111111111111) (= (mask!30129 thiss!1427) #b00000000001111111111111111111111) (= (mask!30129 thiss!1427) #b00000000011111111111111111111111) (= (mask!30129 thiss!1427) #b00000000111111111111111111111111) (= (mask!30129 thiss!1427) #b00000001111111111111111111111111) (= (mask!30129 thiss!1427) #b00000011111111111111111111111111) (= (mask!30129 thiss!1427) #b00000111111111111111111111111111) (= (mask!30129 thiss!1427) #b00001111111111111111111111111111) (= (mask!30129 thiss!1427) #b00011111111111111111111111111111) (= (mask!30129 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30129 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034664 d!124241))

(declare-fun d!124243 () Bool)

(declare-fun res!691002 () Bool)

(declare-fun e!584947 () Bool)

(assert (=> d!124243 (=> (not res!691002) (not e!584947))))

(declare-fun simpleValid!403 (LongMapFixedSize!5692) Bool)

(assert (=> d!124243 (= res!691002 (simpleValid!403 thiss!1427))))

(assert (=> d!124243 (= (valid!2158 thiss!1427) e!584947)))

(declare-fun b!1034723 () Bool)

(declare-fun res!691003 () Bool)

(assert (=> b!1034723 (=> (not res!691003) (not e!584947))))

(declare-fun arrayCountValidKeys!0 (array!65135 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034723 (= res!691003 (= (arrayCountValidKeys!0 (_keys!11436 thiss!1427) #b00000000000000000000000000000000 (size!31880 (_keys!11436 thiss!1427))) (_size!2901 thiss!1427)))))

(declare-fun b!1034724 () Bool)

(declare-fun res!691004 () Bool)

(assert (=> b!1034724 (=> (not res!691004) (not e!584947))))

(assert (=> b!1034724 (= res!691004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11436 thiss!1427) (mask!30129 thiss!1427)))))

(declare-fun b!1034725 () Bool)

(declare-datatypes ((List!21888 0))(
  ( (Nil!21885) (Cons!21884 (h!23095 (_ BitVec 64)) (t!31074 List!21888)) )
))
(declare-fun arrayNoDuplicates!0 (array!65135 (_ BitVec 32) List!21888) Bool)

(assert (=> b!1034725 (= e!584947 (arrayNoDuplicates!0 (_keys!11436 thiss!1427) #b00000000000000000000000000000000 Nil!21885))))

(assert (= (and d!124243 res!691002) b!1034723))

(assert (= (and b!1034723 res!691003) b!1034724))

(assert (= (and b!1034724 res!691004) b!1034725))

(declare-fun m!954847 () Bool)

(assert (=> d!124243 m!954847))

(declare-fun m!954849 () Bool)

(assert (=> b!1034723 m!954849))

(assert (=> b!1034724 m!954819))

(declare-fun m!954851 () Bool)

(assert (=> b!1034725 m!954851))

(assert (=> start!90500 d!124243))

(declare-fun d!124245 () Bool)

(assert (=> d!124245 (= (array_inv!24271 (_keys!11436 thiss!1427)) (bvsge (size!31880 (_keys!11436 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034666 d!124245))

(declare-fun d!124247 () Bool)

(assert (=> d!124247 (= (array_inv!24272 (_values!6243 thiss!1427)) (bvsge (size!31881 (_values!6243 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034666 d!124247))

(declare-fun b!1034734 () Bool)

(declare-fun e!584955 () Bool)

(declare-fun e!584954 () Bool)

(assert (=> b!1034734 (= e!584955 e!584954)))

(declare-fun lt!456613 () (_ BitVec 64))

(assert (=> b!1034734 (= lt!456613 (select (arr!31357 (_keys!11436 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33833 0))(
  ( (Unit!33834) )
))
(declare-fun lt!456612 () Unit!33833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65135 (_ BitVec 64) (_ BitVec 32)) Unit!33833)

(assert (=> b!1034734 (= lt!456612 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11436 thiss!1427) lt!456613 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034734 (arrayContainsKey!0 (_keys!11436 thiss!1427) lt!456613 #b00000000000000000000000000000000)))

(declare-fun lt!456611 () Unit!33833)

(assert (=> b!1034734 (= lt!456611 lt!456612)))

(declare-fun res!691009 () Bool)

(declare-datatypes ((SeekEntryResult!9693 0))(
  ( (MissingZero!9693 (index!41143 (_ BitVec 32))) (Found!9693 (index!41144 (_ BitVec 32))) (Intermediate!9693 (undefined!10505 Bool) (index!41145 (_ BitVec 32)) (x!92145 (_ BitVec 32))) (Undefined!9693) (MissingVacant!9693 (index!41146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65135 (_ BitVec 32)) SeekEntryResult!9693)

(assert (=> b!1034734 (= res!691009 (= (seekEntryOrOpen!0 (select (arr!31357 (_keys!11436 thiss!1427)) #b00000000000000000000000000000000) (_keys!11436 thiss!1427) (mask!30129 thiss!1427)) (Found!9693 #b00000000000000000000000000000000)))))

(assert (=> b!1034734 (=> (not res!691009) (not e!584954))))

(declare-fun b!1034735 () Bool)

(declare-fun e!584956 () Bool)

(assert (=> b!1034735 (= e!584956 e!584955)))

(declare-fun c!104774 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034735 (= c!104774 (validKeyInArray!0 (select (arr!31357 (_keys!11436 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034736 () Bool)

(declare-fun call!43705 () Bool)

(assert (=> b!1034736 (= e!584954 call!43705)))

(declare-fun b!1034737 () Bool)

(assert (=> b!1034737 (= e!584955 call!43705)))

(declare-fun bm!43702 () Bool)

(assert (=> bm!43702 (= call!43705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11436 thiss!1427) (mask!30129 thiss!1427)))))

(declare-fun d!124249 () Bool)

(declare-fun res!691010 () Bool)

(assert (=> d!124249 (=> res!691010 e!584956)))

(assert (=> d!124249 (= res!691010 (bvsge #b00000000000000000000000000000000 (size!31880 (_keys!11436 thiss!1427))))))

(assert (=> d!124249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11436 thiss!1427) (mask!30129 thiss!1427)) e!584956)))

(assert (= (and d!124249 (not res!691010)) b!1034735))

(assert (= (and b!1034735 c!104774) b!1034734))

(assert (= (and b!1034735 (not c!104774)) b!1034737))

(assert (= (and b!1034734 res!691009) b!1034736))

(assert (= (or b!1034736 b!1034737) bm!43702))

(declare-fun m!954853 () Bool)

(assert (=> b!1034734 m!954853))

(declare-fun m!954855 () Bool)

(assert (=> b!1034734 m!954855))

(declare-fun m!954857 () Bool)

(assert (=> b!1034734 m!954857))

(assert (=> b!1034734 m!954853))

(declare-fun m!954859 () Bool)

(assert (=> b!1034734 m!954859))

(assert (=> b!1034735 m!954853))

(assert (=> b!1034735 m!954853))

(declare-fun m!954861 () Bool)

(assert (=> b!1034735 m!954861))

(declare-fun m!954863 () Bool)

(assert (=> bm!43702 m!954863))

(assert (=> b!1034663 d!124249))

(declare-fun b!1034745 () Bool)

(declare-fun e!584962 () Bool)

(assert (=> b!1034745 (= e!584962 tp_is_empty!24505)))

(declare-fun condMapEmpty!38243 () Bool)

(declare-fun mapDefault!38243 () ValueCell!11549)

(assert (=> mapNonEmpty!38234 (= condMapEmpty!38243 (= mapRest!38234 ((as const (Array (_ BitVec 32) ValueCell!11549)) mapDefault!38243)))))

(declare-fun mapRes!38243 () Bool)

(assert (=> mapNonEmpty!38234 (= tp!73449 (and e!584962 mapRes!38243))))

(declare-fun mapNonEmpty!38243 () Bool)

(declare-fun tp!73464 () Bool)

(declare-fun e!584961 () Bool)

(assert (=> mapNonEmpty!38243 (= mapRes!38243 (and tp!73464 e!584961))))

(declare-fun mapRest!38243 () (Array (_ BitVec 32) ValueCell!11549))

(declare-fun mapKey!38243 () (_ BitVec 32))

(declare-fun mapValue!38243 () ValueCell!11549)

(assert (=> mapNonEmpty!38243 (= mapRest!38234 (store mapRest!38243 mapKey!38243 mapValue!38243))))

(declare-fun mapIsEmpty!38243 () Bool)

(assert (=> mapIsEmpty!38243 mapRes!38243))

(declare-fun b!1034744 () Bool)

(assert (=> b!1034744 (= e!584961 tp_is_empty!24505)))

(assert (= (and mapNonEmpty!38234 condMapEmpty!38243) mapIsEmpty!38243))

(assert (= (and mapNonEmpty!38234 (not condMapEmpty!38243)) mapNonEmpty!38243))

(assert (= (and mapNonEmpty!38243 ((_ is ValueCellFull!11549) mapValue!38243)) b!1034744))

(assert (= (and mapNonEmpty!38234 ((_ is ValueCellFull!11549) mapDefault!38243)) b!1034745))

(declare-fun m!954865 () Bool)

(assert (=> mapNonEmpty!38243 m!954865))

(check-sat (not b_next!20785) (not b!1034735) (not b!1034725) (not mapNonEmpty!38243) b_and!33263 tp_is_empty!24505 (not bm!43702) (not b!1034724) (not b!1034723) (not d!124243) (not b!1034734))
(check-sat b_and!33263 (not b_next!20785))
