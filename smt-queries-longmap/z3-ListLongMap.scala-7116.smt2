; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90200 () Bool)

(assert start!90200)

(declare-fun b!1032853 () Bool)

(declare-fun b_free!20751 () Bool)

(declare-fun b_next!20751 () Bool)

(assert (=> b!1032853 (= b_free!20751 (not b_next!20751))))

(declare-fun tp!73339 () Bool)

(declare-fun b_and!33219 () Bool)

(assert (=> b!1032853 (= tp!73339 b_and!33219)))

(declare-fun mapNonEmpty!38175 () Bool)

(declare-fun mapRes!38175 () Bool)

(declare-fun tp!73338 () Bool)

(declare-fun e!583676 () Bool)

(assert (=> mapNonEmpty!38175 (= mapRes!38175 (and tp!73338 e!583676))))

(declare-fun mapKey!38175 () (_ BitVec 32))

(declare-datatypes ((V!37501 0))(
  ( (V!37502 (val!12286 Int)) )
))
(declare-datatypes ((ValueCell!11532 0))(
  ( (ValueCellFull!11532 (v!14863 V!37501)) (EmptyCell!11532) )
))
(declare-datatypes ((array!65014 0))(
  ( (array!65015 (arr!31305 (Array (_ BitVec 32) (_ BitVec 64))) (size!31825 (_ BitVec 32))) )
))
(declare-datatypes ((array!65016 0))(
  ( (array!65017 (arr!31306 (Array (_ BitVec 32) ValueCell!11532)) (size!31826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5658 0))(
  ( (LongMapFixedSize!5659 (defaultEntry!6203 Int) (mask!30036 (_ BitVec 32)) (extraKeys!5935 (_ BitVec 32)) (zeroValue!6039 V!37501) (minValue!6039 V!37501) (_size!2884 (_ BitVec 32)) (_keys!11379 array!65014) (_values!6226 array!65016) (_vacant!2884 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5658)

(declare-fun mapValue!38175 () ValueCell!11532)

(declare-fun mapRest!38175 () (Array (_ BitVec 32) ValueCell!11532))

(assert (=> mapNonEmpty!38175 (= (arr!31306 (_values!6226 thiss!1427)) (store mapRest!38175 mapKey!38175 mapValue!38175))))

(declare-fun b!1032847 () Bool)

(declare-fun res!690232 () Bool)

(declare-fun e!583677 () Bool)

(assert (=> b!1032847 (=> (not res!690232) (not e!583677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032847 (= res!690232 (validMask!0 (mask!30036 thiss!1427)))))

(declare-fun b!1032848 () Bool)

(declare-fun e!583672 () Bool)

(declare-fun e!583673 () Bool)

(assert (=> b!1032848 (= e!583672 (and e!583673 mapRes!38175))))

(declare-fun condMapEmpty!38175 () Bool)

(declare-fun mapDefault!38175 () ValueCell!11532)

(assert (=> b!1032848 (= condMapEmpty!38175 (= (arr!31306 (_values!6226 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11532)) mapDefault!38175)))))

(declare-fun res!690233 () Bool)

(assert (=> start!90200 (=> (not res!690233) (not e!583677))))

(declare-fun valid!2140 (LongMapFixedSize!5658) Bool)

(assert (=> start!90200 (= res!690233 (valid!2140 thiss!1427))))

(assert (=> start!90200 e!583677))

(declare-fun e!583675 () Bool)

(assert (=> start!90200 e!583675))

(assert (=> start!90200 true))

(declare-fun b!1032849 () Bool)

(declare-fun res!690231 () Bool)

(assert (=> b!1032849 (=> (not res!690231) (not e!583677))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032849 (= res!690231 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1032850 () Bool)

(declare-fun tp_is_empty!24471 () Bool)

(assert (=> b!1032850 (= e!583673 tp_is_empty!24471)))

(declare-fun b!1032851 () Bool)

(assert (=> b!1032851 (= e!583676 tp_is_empty!24471)))

(declare-fun mapIsEmpty!38175 () Bool)

(assert (=> mapIsEmpty!38175 mapRes!38175))

(declare-fun b!1032852 () Bool)

(assert (=> b!1032852 (= e!583677 (and (= (size!31826 (_values!6226 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30036 thiss!1427))) (= (size!31825 (_keys!11379 thiss!1427)) (size!31826 (_values!6226 thiss!1427))) (bvsge (mask!30036 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5935 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun array_inv!24227 (array!65014) Bool)

(declare-fun array_inv!24228 (array!65016) Bool)

(assert (=> b!1032853 (= e!583675 (and tp!73339 tp_is_empty!24471 (array_inv!24227 (_keys!11379 thiss!1427)) (array_inv!24228 (_values!6226 thiss!1427)) e!583672))))

(assert (= (and start!90200 res!690233) b!1032849))

(assert (= (and b!1032849 res!690231) b!1032847))

(assert (= (and b!1032847 res!690232) b!1032852))

(assert (= (and b!1032848 condMapEmpty!38175) mapIsEmpty!38175))

(assert (= (and b!1032848 (not condMapEmpty!38175)) mapNonEmpty!38175))

(get-info :version)

(assert (= (and mapNonEmpty!38175 ((_ is ValueCellFull!11532) mapValue!38175)) b!1032851))

(assert (= (and b!1032848 ((_ is ValueCellFull!11532) mapDefault!38175)) b!1032850))

(assert (= b!1032853 b!1032848))

(assert (= start!90200 b!1032853))

(declare-fun m!952913 () Bool)

(assert (=> mapNonEmpty!38175 m!952913))

(declare-fun m!952915 () Bool)

(assert (=> b!1032847 m!952915))

(declare-fun m!952917 () Bool)

(assert (=> start!90200 m!952917))

(declare-fun m!952919 () Bool)

(assert (=> b!1032853 m!952919))

(declare-fun m!952921 () Bool)

(assert (=> b!1032853 m!952921))

(check-sat (not b!1032853) (not b!1032847) tp_is_empty!24471 (not start!90200) (not mapNonEmpty!38175) b_and!33219 (not b_next!20751))
(check-sat b_and!33219 (not b_next!20751))
(get-model)

(declare-fun d!123735 () Bool)

(assert (=> d!123735 (= (array_inv!24227 (_keys!11379 thiss!1427)) (bvsge (size!31825 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032853 d!123735))

(declare-fun d!123737 () Bool)

(assert (=> d!123737 (= (array_inv!24228 (_values!6226 thiss!1427)) (bvsge (size!31826 (_values!6226 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032853 d!123737))

(declare-fun d!123739 () Bool)

(declare-fun res!690249 () Bool)

(declare-fun e!583698 () Bool)

(assert (=> d!123739 (=> (not res!690249) (not e!583698))))

(declare-fun simpleValid!401 (LongMapFixedSize!5658) Bool)

(assert (=> d!123739 (= res!690249 (simpleValid!401 thiss!1427))))

(assert (=> d!123739 (= (valid!2140 thiss!1427) e!583698)))

(declare-fun b!1032881 () Bool)

(declare-fun res!690250 () Bool)

(assert (=> b!1032881 (=> (not res!690250) (not e!583698))))

(declare-fun arrayCountValidKeys!0 (array!65014 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032881 (= res!690250 (= (arrayCountValidKeys!0 (_keys!11379 thiss!1427) #b00000000000000000000000000000000 (size!31825 (_keys!11379 thiss!1427))) (_size!2884 thiss!1427)))))

(declare-fun b!1032882 () Bool)

(declare-fun res!690251 () Bool)

(assert (=> b!1032882 (=> (not res!690251) (not e!583698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65014 (_ BitVec 32)) Bool)

(assert (=> b!1032882 (= res!690251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11379 thiss!1427) (mask!30036 thiss!1427)))))

(declare-fun b!1032883 () Bool)

(declare-datatypes ((List!21899 0))(
  ( (Nil!21896) (Cons!21895 (h!23097 (_ BitVec 64)) (t!31093 List!21899)) )
))
(declare-fun arrayNoDuplicates!0 (array!65014 (_ BitVec 32) List!21899) Bool)

(assert (=> b!1032883 (= e!583698 (arrayNoDuplicates!0 (_keys!11379 thiss!1427) #b00000000000000000000000000000000 Nil!21896))))

(assert (= (and d!123739 res!690249) b!1032881))

(assert (= (and b!1032881 res!690250) b!1032882))

(assert (= (and b!1032882 res!690251) b!1032883))

(declare-fun m!952933 () Bool)

(assert (=> d!123739 m!952933))

(declare-fun m!952935 () Bool)

(assert (=> b!1032881 m!952935))

(declare-fun m!952937 () Bool)

(assert (=> b!1032882 m!952937))

(declare-fun m!952939 () Bool)

(assert (=> b!1032883 m!952939))

(assert (=> start!90200 d!123739))

(declare-fun d!123741 () Bool)

(assert (=> d!123741 (= (validMask!0 (mask!30036 thiss!1427)) (and (or (= (mask!30036 thiss!1427) #b00000000000000000000000000000111) (= (mask!30036 thiss!1427) #b00000000000000000000000000001111) (= (mask!30036 thiss!1427) #b00000000000000000000000000011111) (= (mask!30036 thiss!1427) #b00000000000000000000000000111111) (= (mask!30036 thiss!1427) #b00000000000000000000000001111111) (= (mask!30036 thiss!1427) #b00000000000000000000000011111111) (= (mask!30036 thiss!1427) #b00000000000000000000000111111111) (= (mask!30036 thiss!1427) #b00000000000000000000001111111111) (= (mask!30036 thiss!1427) #b00000000000000000000011111111111) (= (mask!30036 thiss!1427) #b00000000000000000000111111111111) (= (mask!30036 thiss!1427) #b00000000000000000001111111111111) (= (mask!30036 thiss!1427) #b00000000000000000011111111111111) (= (mask!30036 thiss!1427) #b00000000000000000111111111111111) (= (mask!30036 thiss!1427) #b00000000000000001111111111111111) (= (mask!30036 thiss!1427) #b00000000000000011111111111111111) (= (mask!30036 thiss!1427) #b00000000000000111111111111111111) (= (mask!30036 thiss!1427) #b00000000000001111111111111111111) (= (mask!30036 thiss!1427) #b00000000000011111111111111111111) (= (mask!30036 thiss!1427) #b00000000000111111111111111111111) (= (mask!30036 thiss!1427) #b00000000001111111111111111111111) (= (mask!30036 thiss!1427) #b00000000011111111111111111111111) (= (mask!30036 thiss!1427) #b00000000111111111111111111111111) (= (mask!30036 thiss!1427) #b00000001111111111111111111111111) (= (mask!30036 thiss!1427) #b00000011111111111111111111111111) (= (mask!30036 thiss!1427) #b00000111111111111111111111111111) (= (mask!30036 thiss!1427) #b00001111111111111111111111111111) (= (mask!30036 thiss!1427) #b00011111111111111111111111111111) (= (mask!30036 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30036 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032847 d!123741))

(declare-fun mapNonEmpty!38181 () Bool)

(declare-fun mapRes!38181 () Bool)

(declare-fun tp!73348 () Bool)

(declare-fun e!583704 () Bool)

(assert (=> mapNonEmpty!38181 (= mapRes!38181 (and tp!73348 e!583704))))

(declare-fun mapRest!38181 () (Array (_ BitVec 32) ValueCell!11532))

(declare-fun mapValue!38181 () ValueCell!11532)

(declare-fun mapKey!38181 () (_ BitVec 32))

(assert (=> mapNonEmpty!38181 (= mapRest!38175 (store mapRest!38181 mapKey!38181 mapValue!38181))))

(declare-fun mapIsEmpty!38181 () Bool)

(assert (=> mapIsEmpty!38181 mapRes!38181))

(declare-fun b!1032891 () Bool)

(declare-fun e!583703 () Bool)

(assert (=> b!1032891 (= e!583703 tp_is_empty!24471)))

(declare-fun condMapEmpty!38181 () Bool)

(declare-fun mapDefault!38181 () ValueCell!11532)

(assert (=> mapNonEmpty!38175 (= condMapEmpty!38181 (= mapRest!38175 ((as const (Array (_ BitVec 32) ValueCell!11532)) mapDefault!38181)))))

(assert (=> mapNonEmpty!38175 (= tp!73338 (and e!583703 mapRes!38181))))

(declare-fun b!1032890 () Bool)

(assert (=> b!1032890 (= e!583704 tp_is_empty!24471)))

(assert (= (and mapNonEmpty!38175 condMapEmpty!38181) mapIsEmpty!38181))

(assert (= (and mapNonEmpty!38175 (not condMapEmpty!38181)) mapNonEmpty!38181))

(assert (= (and mapNonEmpty!38181 ((_ is ValueCellFull!11532) mapValue!38181)) b!1032890))

(assert (= (and mapNonEmpty!38175 ((_ is ValueCellFull!11532) mapDefault!38181)) b!1032891))

(declare-fun m!952941 () Bool)

(assert (=> mapNonEmpty!38181 m!952941))

(check-sat (not b!1032881) tp_is_empty!24471 (not mapNonEmpty!38181) (not b!1032882) b_and!33219 (not b!1032883) (not b_next!20751) (not d!123739))
(check-sat b_and!33219 (not b_next!20751))
(get-model)

(declare-fun b!1032900 () Bool)

(declare-fun e!583713 () Bool)

(declare-fun call!43620 () Bool)

(assert (=> b!1032900 (= e!583713 call!43620)))

(declare-fun d!123743 () Bool)

(declare-fun res!690257 () Bool)

(declare-fun e!583712 () Bool)

(assert (=> d!123743 (=> res!690257 e!583712)))

(assert (=> d!123743 (= res!690257 (bvsge #b00000000000000000000000000000000 (size!31825 (_keys!11379 thiss!1427))))))

(assert (=> d!123743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11379 thiss!1427) (mask!30036 thiss!1427)) e!583712)))

(declare-fun bm!43617 () Bool)

(assert (=> bm!43617 (= call!43620 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11379 thiss!1427) (mask!30036 thiss!1427)))))

(declare-fun b!1032901 () Bool)

(declare-fun e!583711 () Bool)

(assert (=> b!1032901 (= e!583713 e!583711)))

(declare-fun lt!456073 () (_ BitVec 64))

(assert (=> b!1032901 (= lt!456073 (select (arr!31305 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33821 0))(
  ( (Unit!33822) )
))
(declare-fun lt!456072 () Unit!33821)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65014 (_ BitVec 64) (_ BitVec 32)) Unit!33821)

(assert (=> b!1032901 (= lt!456072 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11379 thiss!1427) lt!456073 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032901 (arrayContainsKey!0 (_keys!11379 thiss!1427) lt!456073 #b00000000000000000000000000000000)))

(declare-fun lt!456074 () Unit!33821)

(assert (=> b!1032901 (= lt!456074 lt!456072)))

(declare-fun res!690256 () Bool)

(declare-datatypes ((SeekEntryResult!9734 0))(
  ( (MissingZero!9734 (index!41307 (_ BitVec 32))) (Found!9734 (index!41308 (_ BitVec 32))) (Intermediate!9734 (undefined!10546 Bool) (index!41309 (_ BitVec 32)) (x!92094 (_ BitVec 32))) (Undefined!9734) (MissingVacant!9734 (index!41310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65014 (_ BitVec 32)) SeekEntryResult!9734)

(assert (=> b!1032901 (= res!690256 (= (seekEntryOrOpen!0 (select (arr!31305 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000) (_keys!11379 thiss!1427) (mask!30036 thiss!1427)) (Found!9734 #b00000000000000000000000000000000)))))

(assert (=> b!1032901 (=> (not res!690256) (not e!583711))))

(declare-fun b!1032902 () Bool)

(assert (=> b!1032902 (= e!583712 e!583713)))

(declare-fun c!104340 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032902 (= c!104340 (validKeyInArray!0 (select (arr!31305 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032903 () Bool)

(assert (=> b!1032903 (= e!583711 call!43620)))

(assert (= (and d!123743 (not res!690257)) b!1032902))

(assert (= (and b!1032902 c!104340) b!1032901))

(assert (= (and b!1032902 (not c!104340)) b!1032900))

(assert (= (and b!1032901 res!690256) b!1032903))

(assert (= (or b!1032903 b!1032900) bm!43617))

(declare-fun m!952943 () Bool)

(assert (=> bm!43617 m!952943))

(declare-fun m!952945 () Bool)

(assert (=> b!1032901 m!952945))

(declare-fun m!952947 () Bool)

(assert (=> b!1032901 m!952947))

(declare-fun m!952949 () Bool)

(assert (=> b!1032901 m!952949))

(assert (=> b!1032901 m!952945))

(declare-fun m!952951 () Bool)

(assert (=> b!1032901 m!952951))

(assert (=> b!1032902 m!952945))

(assert (=> b!1032902 m!952945))

(declare-fun m!952953 () Bool)

(assert (=> b!1032902 m!952953))

(assert (=> b!1032882 d!123743))

(declare-fun bm!43620 () Bool)

(declare-fun call!43623 () (_ BitVec 32))

(assert (=> bm!43620 (= call!43623 (arrayCountValidKeys!0 (_keys!11379 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31825 (_keys!11379 thiss!1427))))))

(declare-fun b!1032912 () Bool)

(declare-fun e!583719 () (_ BitVec 32))

(assert (=> b!1032912 (= e!583719 call!43623)))

(declare-fun b!1032913 () Bool)

(declare-fun e!583718 () (_ BitVec 32))

(assert (=> b!1032913 (= e!583718 #b00000000000000000000000000000000)))

(declare-fun d!123745 () Bool)

(declare-fun lt!456077 () (_ BitVec 32))

(assert (=> d!123745 (and (bvsge lt!456077 #b00000000000000000000000000000000) (bvsle lt!456077 (bvsub (size!31825 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123745 (= lt!456077 e!583718)))

(declare-fun c!104346 () Bool)

(assert (=> d!123745 (= c!104346 (bvsge #b00000000000000000000000000000000 (size!31825 (_keys!11379 thiss!1427))))))

(assert (=> d!123745 (and (bvsle #b00000000000000000000000000000000 (size!31825 (_keys!11379 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31825 (_keys!11379 thiss!1427)) (size!31825 (_keys!11379 thiss!1427))))))

(assert (=> d!123745 (= (arrayCountValidKeys!0 (_keys!11379 thiss!1427) #b00000000000000000000000000000000 (size!31825 (_keys!11379 thiss!1427))) lt!456077)))

(declare-fun b!1032914 () Bool)

(assert (=> b!1032914 (= e!583718 e!583719)))

(declare-fun c!104345 () Bool)

(assert (=> b!1032914 (= c!104345 (validKeyInArray!0 (select (arr!31305 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032915 () Bool)

(assert (=> b!1032915 (= e!583719 (bvadd #b00000000000000000000000000000001 call!43623))))

(assert (= (and d!123745 c!104346) b!1032913))

(assert (= (and d!123745 (not c!104346)) b!1032914))

(assert (= (and b!1032914 c!104345) b!1032915))

(assert (= (and b!1032914 (not c!104345)) b!1032912))

(assert (= (or b!1032915 b!1032912) bm!43620))

(declare-fun m!952955 () Bool)

(assert (=> bm!43620 m!952955))

(assert (=> b!1032914 m!952945))

(assert (=> b!1032914 m!952945))

(assert (=> b!1032914 m!952953))

(assert (=> b!1032881 d!123745))

(declare-fun d!123747 () Bool)

(declare-fun res!690265 () Bool)

(declare-fun e!583730 () Bool)

(assert (=> d!123747 (=> res!690265 e!583730)))

(assert (=> d!123747 (= res!690265 (bvsge #b00000000000000000000000000000000 (size!31825 (_keys!11379 thiss!1427))))))

(assert (=> d!123747 (= (arrayNoDuplicates!0 (_keys!11379 thiss!1427) #b00000000000000000000000000000000 Nil!21896) e!583730)))

(declare-fun bm!43623 () Bool)

(declare-fun call!43626 () Bool)

(declare-fun c!104349 () Bool)

(assert (=> bm!43623 (= call!43626 (arrayNoDuplicates!0 (_keys!11379 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104349 (Cons!21895 (select (arr!31305 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000) Nil!21896) Nil!21896)))))

(declare-fun b!1032926 () Bool)

(declare-fun e!583728 () Bool)

(assert (=> b!1032926 (= e!583728 call!43626)))

(declare-fun b!1032927 () Bool)

(declare-fun e!583731 () Bool)

(assert (=> b!1032927 (= e!583730 e!583731)))

(declare-fun res!690264 () Bool)

(assert (=> b!1032927 (=> (not res!690264) (not e!583731))))

(declare-fun e!583729 () Bool)

(assert (=> b!1032927 (= res!690264 (not e!583729))))

(declare-fun res!690266 () Bool)

(assert (=> b!1032927 (=> (not res!690266) (not e!583729))))

(assert (=> b!1032927 (= res!690266 (validKeyInArray!0 (select (arr!31305 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032928 () Bool)

(declare-fun contains!6009 (List!21899 (_ BitVec 64)) Bool)

(assert (=> b!1032928 (= e!583729 (contains!6009 Nil!21896 (select (arr!31305 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032929 () Bool)

(assert (=> b!1032929 (= e!583728 call!43626)))

(declare-fun b!1032930 () Bool)

(assert (=> b!1032930 (= e!583731 e!583728)))

(assert (=> b!1032930 (= c!104349 (validKeyInArray!0 (select (arr!31305 (_keys!11379 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123747 (not res!690265)) b!1032927))

(assert (= (and b!1032927 res!690266) b!1032928))

(assert (= (and b!1032927 res!690264) b!1032930))

(assert (= (and b!1032930 c!104349) b!1032926))

(assert (= (and b!1032930 (not c!104349)) b!1032929))

(assert (= (or b!1032926 b!1032929) bm!43623))

(assert (=> bm!43623 m!952945))

(declare-fun m!952957 () Bool)

(assert (=> bm!43623 m!952957))

(assert (=> b!1032927 m!952945))

(assert (=> b!1032927 m!952945))

(assert (=> b!1032927 m!952953))

(assert (=> b!1032928 m!952945))

(assert (=> b!1032928 m!952945))

(declare-fun m!952959 () Bool)

(assert (=> b!1032928 m!952959))

(assert (=> b!1032930 m!952945))

(assert (=> b!1032930 m!952945))

(assert (=> b!1032930 m!952953))

(assert (=> b!1032883 d!123747))

(declare-fun b!1032941 () Bool)

(declare-fun res!690276 () Bool)

(declare-fun e!583734 () Bool)

(assert (=> b!1032941 (=> (not res!690276) (not e!583734))))

(declare-fun size!31829 (LongMapFixedSize!5658) (_ BitVec 32))

(assert (=> b!1032941 (= res!690276 (= (size!31829 thiss!1427) (bvadd (_size!2884 thiss!1427) (bvsdiv (bvadd (extraKeys!5935 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1032940 () Bool)

(declare-fun res!690275 () Bool)

(assert (=> b!1032940 (=> (not res!690275) (not e!583734))))

(assert (=> b!1032940 (= res!690275 (bvsge (size!31829 thiss!1427) (_size!2884 thiss!1427)))))

(declare-fun b!1032942 () Bool)

(assert (=> b!1032942 (= e!583734 (and (bvsge (extraKeys!5935 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5935 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2884 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032939 () Bool)

(declare-fun res!690277 () Bool)

(assert (=> b!1032939 (=> (not res!690277) (not e!583734))))

(assert (=> b!1032939 (= res!690277 (and (= (size!31826 (_values!6226 thiss!1427)) (bvadd (mask!30036 thiss!1427) #b00000000000000000000000000000001)) (= (size!31825 (_keys!11379 thiss!1427)) (size!31826 (_values!6226 thiss!1427))) (bvsge (_size!2884 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2884 thiss!1427) (bvadd (mask!30036 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!123749 () Bool)

(declare-fun res!690278 () Bool)

(assert (=> d!123749 (=> (not res!690278) (not e!583734))))

(assert (=> d!123749 (= res!690278 (validMask!0 (mask!30036 thiss!1427)))))

(assert (=> d!123749 (= (simpleValid!401 thiss!1427) e!583734)))

(assert (= (and d!123749 res!690278) b!1032939))

(assert (= (and b!1032939 res!690277) b!1032940))

(assert (= (and b!1032940 res!690275) b!1032941))

(assert (= (and b!1032941 res!690276) b!1032942))

(declare-fun m!952961 () Bool)

(assert (=> b!1032941 m!952961))

(assert (=> b!1032940 m!952961))

(assert (=> d!123749 m!952915))

(assert (=> d!123739 d!123749))

(declare-fun mapNonEmpty!38182 () Bool)

(declare-fun mapRes!38182 () Bool)

(declare-fun tp!73349 () Bool)

(declare-fun e!583736 () Bool)

(assert (=> mapNonEmpty!38182 (= mapRes!38182 (and tp!73349 e!583736))))

(declare-fun mapKey!38182 () (_ BitVec 32))

(declare-fun mapValue!38182 () ValueCell!11532)

(declare-fun mapRest!38182 () (Array (_ BitVec 32) ValueCell!11532))

(assert (=> mapNonEmpty!38182 (= mapRest!38181 (store mapRest!38182 mapKey!38182 mapValue!38182))))

(declare-fun mapIsEmpty!38182 () Bool)

(assert (=> mapIsEmpty!38182 mapRes!38182))

(declare-fun b!1032944 () Bool)

(declare-fun e!583735 () Bool)

(assert (=> b!1032944 (= e!583735 tp_is_empty!24471)))

(declare-fun condMapEmpty!38182 () Bool)

(declare-fun mapDefault!38182 () ValueCell!11532)

(assert (=> mapNonEmpty!38181 (= condMapEmpty!38182 (= mapRest!38181 ((as const (Array (_ BitVec 32) ValueCell!11532)) mapDefault!38182)))))

(assert (=> mapNonEmpty!38181 (= tp!73348 (and e!583735 mapRes!38182))))

(declare-fun b!1032943 () Bool)

(assert (=> b!1032943 (= e!583736 tp_is_empty!24471)))

(assert (= (and mapNonEmpty!38181 condMapEmpty!38182) mapIsEmpty!38182))

(assert (= (and mapNonEmpty!38181 (not condMapEmpty!38182)) mapNonEmpty!38182))

(assert (= (and mapNonEmpty!38182 ((_ is ValueCellFull!11532) mapValue!38182)) b!1032943))

(assert (= (and mapNonEmpty!38181 ((_ is ValueCellFull!11532) mapDefault!38182)) b!1032944))

(declare-fun m!952963 () Bool)

(assert (=> mapNonEmpty!38182 m!952963))

(check-sat (not b!1032927) (not d!123749) tp_is_empty!24471 (not b!1032914) (not bm!43617) (not b!1032930) b_and!33219 (not bm!43620) (not b_next!20751) (not b!1032902) (not b!1032940) (not mapNonEmpty!38182) (not b!1032901) (not b!1032941) (not bm!43623) (not b!1032928))
(check-sat b_and!33219 (not b_next!20751))
