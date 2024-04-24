; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90728 () Bool)

(assert start!90728)

(declare-fun b!1036587 () Bool)

(declare-fun b_free!20833 () Bool)

(declare-fun b_next!20833 () Bool)

(assert (=> b!1036587 (= b_free!20833 (not b_next!20833))))

(declare-fun tp!73623 () Bool)

(declare-fun b_and!33343 () Bool)

(assert (=> b!1036587 (= tp!73623 b_and!33343)))

(declare-fun b!1036582 () Bool)

(declare-fun e!586189 () Bool)

(declare-fun tp_is_empty!24553 () Bool)

(assert (=> b!1036582 (= e!586189 tp_is_empty!24553)))

(declare-fun b!1036583 () Bool)

(declare-fun res!691790 () Bool)

(declare-fun e!586191 () Bool)

(assert (=> b!1036583 (=> (not res!691790) (not e!586191))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036583 (= res!691790 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!691788 () Bool)

(assert (=> start!90728 (=> (not res!691788) (not e!586191))))

(declare-datatypes ((V!37611 0))(
  ( (V!37612 (val!12327 Int)) )
))
(declare-datatypes ((ValueCell!11573 0))(
  ( (ValueCellFull!11573 (v!14903 V!37611)) (EmptyCell!11573) )
))
(declare-datatypes ((array!65247 0))(
  ( (array!65248 (arr!31405 (Array (_ BitVec 32) (_ BitVec 64))) (size!31933 (_ BitVec 32))) )
))
(declare-datatypes ((array!65249 0))(
  ( (array!65250 (arr!31406 (Array (_ BitVec 32) ValueCell!11573)) (size!31934 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5740 0))(
  ( (LongMapFixedSize!5741 (defaultEntry!6248 Int) (mask!30189 (_ BitVec 32)) (extraKeys!5978 (_ BitVec 32)) (zeroValue!6082 V!37611) (minValue!6084 V!37611) (_size!2925 (_ BitVec 32)) (_keys!11472 array!65247) (_values!6271 array!65249) (_vacant!2925 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5740)

(declare-fun valid!2175 (LongMapFixedSize!5740) Bool)

(assert (=> start!90728 (= res!691788 (valid!2175 thiss!1427))))

(assert (=> start!90728 e!586191))

(declare-fun e!586190 () Bool)

(assert (=> start!90728 e!586190))

(assert (=> start!90728 true))

(declare-fun b!1036584 () Bool)

(declare-fun e!586192 () Bool)

(assert (=> b!1036584 (= e!586192 tp_is_empty!24553)))

(declare-fun b!1036585 () Bool)

(declare-fun res!691789 () Bool)

(assert (=> b!1036585 (=> (not res!691789) (not e!586191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036585 (= res!691789 (validMask!0 (mask!30189 thiss!1427)))))

(declare-fun mapIsEmpty!38336 () Bool)

(declare-fun mapRes!38336 () Bool)

(assert (=> mapIsEmpty!38336 mapRes!38336))

(declare-fun b!1036586 () Bool)

(assert (=> b!1036586 (= e!586191 (and (= (size!31934 (_values!6271 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30189 thiss!1427))) (= (size!31933 (_keys!11472 thiss!1427)) (size!31934 (_values!6271 thiss!1427))) (bvsge (mask!30189 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5978 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5978 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun e!586188 () Bool)

(declare-fun array_inv!24305 (array!65247) Bool)

(declare-fun array_inv!24306 (array!65249) Bool)

(assert (=> b!1036587 (= e!586190 (and tp!73623 tp_is_empty!24553 (array_inv!24305 (_keys!11472 thiss!1427)) (array_inv!24306 (_values!6271 thiss!1427)) e!586188))))

(declare-fun b!1036588 () Bool)

(assert (=> b!1036588 (= e!586188 (and e!586192 mapRes!38336))))

(declare-fun condMapEmpty!38336 () Bool)

(declare-fun mapDefault!38336 () ValueCell!11573)

(assert (=> b!1036588 (= condMapEmpty!38336 (= (arr!31406 (_values!6271 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11573)) mapDefault!38336)))))

(declare-fun mapNonEmpty!38336 () Bool)

(declare-fun tp!73622 () Bool)

(assert (=> mapNonEmpty!38336 (= mapRes!38336 (and tp!73622 e!586189))))

(declare-fun mapKey!38336 () (_ BitVec 32))

(declare-fun mapValue!38336 () ValueCell!11573)

(declare-fun mapRest!38336 () (Array (_ BitVec 32) ValueCell!11573))

(assert (=> mapNonEmpty!38336 (= (arr!31406 (_values!6271 thiss!1427)) (store mapRest!38336 mapKey!38336 mapValue!38336))))

(assert (= (and start!90728 res!691788) b!1036583))

(assert (= (and b!1036583 res!691790) b!1036585))

(assert (= (and b!1036585 res!691789) b!1036586))

(assert (= (and b!1036588 condMapEmpty!38336) mapIsEmpty!38336))

(assert (= (and b!1036588 (not condMapEmpty!38336)) mapNonEmpty!38336))

(get-info :version)

(assert (= (and mapNonEmpty!38336 ((_ is ValueCellFull!11573) mapValue!38336)) b!1036582))

(assert (= (and b!1036588 ((_ is ValueCellFull!11573) mapDefault!38336)) b!1036584))

(assert (= b!1036587 b!1036588))

(assert (= start!90728 b!1036587))

(declare-fun m!956965 () Bool)

(assert (=> start!90728 m!956965))

(declare-fun m!956967 () Bool)

(assert (=> b!1036585 m!956967))

(declare-fun m!956969 () Bool)

(assert (=> b!1036587 m!956969))

(declare-fun m!956971 () Bool)

(assert (=> b!1036587 m!956971))

(declare-fun m!956973 () Bool)

(assert (=> mapNonEmpty!38336 m!956973))

(check-sat (not start!90728) tp_is_empty!24553 (not b_next!20833) (not b!1036587) b_and!33343 (not mapNonEmpty!38336) (not b!1036585))
(check-sat b_and!33343 (not b_next!20833))
(get-model)

(declare-fun d!124969 () Bool)

(assert (=> d!124969 (= (validMask!0 (mask!30189 thiss!1427)) (and (or (= (mask!30189 thiss!1427) #b00000000000000000000000000000111) (= (mask!30189 thiss!1427) #b00000000000000000000000000001111) (= (mask!30189 thiss!1427) #b00000000000000000000000000011111) (= (mask!30189 thiss!1427) #b00000000000000000000000000111111) (= (mask!30189 thiss!1427) #b00000000000000000000000001111111) (= (mask!30189 thiss!1427) #b00000000000000000000000011111111) (= (mask!30189 thiss!1427) #b00000000000000000000000111111111) (= (mask!30189 thiss!1427) #b00000000000000000000001111111111) (= (mask!30189 thiss!1427) #b00000000000000000000011111111111) (= (mask!30189 thiss!1427) #b00000000000000000000111111111111) (= (mask!30189 thiss!1427) #b00000000000000000001111111111111) (= (mask!30189 thiss!1427) #b00000000000000000011111111111111) (= (mask!30189 thiss!1427) #b00000000000000000111111111111111) (= (mask!30189 thiss!1427) #b00000000000000001111111111111111) (= (mask!30189 thiss!1427) #b00000000000000011111111111111111) (= (mask!30189 thiss!1427) #b00000000000000111111111111111111) (= (mask!30189 thiss!1427) #b00000000000001111111111111111111) (= (mask!30189 thiss!1427) #b00000000000011111111111111111111) (= (mask!30189 thiss!1427) #b00000000000111111111111111111111) (= (mask!30189 thiss!1427) #b00000000001111111111111111111111) (= (mask!30189 thiss!1427) #b00000000011111111111111111111111) (= (mask!30189 thiss!1427) #b00000000111111111111111111111111) (= (mask!30189 thiss!1427) #b00000001111111111111111111111111) (= (mask!30189 thiss!1427) #b00000011111111111111111111111111) (= (mask!30189 thiss!1427) #b00000111111111111111111111111111) (= (mask!30189 thiss!1427) #b00001111111111111111111111111111) (= (mask!30189 thiss!1427) #b00011111111111111111111111111111) (= (mask!30189 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30189 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1036585 d!124969))

(declare-fun d!124971 () Bool)

(declare-fun res!691815 () Bool)

(declare-fun e!586232 () Bool)

(assert (=> d!124971 (=> (not res!691815) (not e!586232))))

(declare-fun simpleValid!411 (LongMapFixedSize!5740) Bool)

(assert (=> d!124971 (= res!691815 (simpleValid!411 thiss!1427))))

(assert (=> d!124971 (= (valid!2175 thiss!1427) e!586232)))

(declare-fun b!1036637 () Bool)

(declare-fun res!691816 () Bool)

(assert (=> b!1036637 (=> (not res!691816) (not e!586232))))

(declare-fun arrayCountValidKeys!0 (array!65247 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036637 (= res!691816 (= (arrayCountValidKeys!0 (_keys!11472 thiss!1427) #b00000000000000000000000000000000 (size!31933 (_keys!11472 thiss!1427))) (_size!2925 thiss!1427)))))

(declare-fun b!1036638 () Bool)

(declare-fun res!691817 () Bool)

(assert (=> b!1036638 (=> (not res!691817) (not e!586232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65247 (_ BitVec 32)) Bool)

(assert (=> b!1036638 (= res!691817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11472 thiss!1427) (mask!30189 thiss!1427)))))

(declare-fun b!1036639 () Bool)

(declare-datatypes ((List!21899 0))(
  ( (Nil!21896) (Cons!21895 (h!23106 (_ BitVec 64)) (t!31094 List!21899)) )
))
(declare-fun arrayNoDuplicates!0 (array!65247 (_ BitVec 32) List!21899) Bool)

(assert (=> b!1036639 (= e!586232 (arrayNoDuplicates!0 (_keys!11472 thiss!1427) #b00000000000000000000000000000000 Nil!21896))))

(assert (= (and d!124971 res!691815) b!1036637))

(assert (= (and b!1036637 res!691816) b!1036638))

(assert (= (and b!1036638 res!691817) b!1036639))

(declare-fun m!956995 () Bool)

(assert (=> d!124971 m!956995))

(declare-fun m!956997 () Bool)

(assert (=> b!1036637 m!956997))

(declare-fun m!956999 () Bool)

(assert (=> b!1036638 m!956999))

(declare-fun m!957001 () Bool)

(assert (=> b!1036639 m!957001))

(assert (=> start!90728 d!124971))

(declare-fun d!124973 () Bool)

(assert (=> d!124973 (= (array_inv!24305 (_keys!11472 thiss!1427)) (bvsge (size!31933 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036587 d!124973))

(declare-fun d!124975 () Bool)

(assert (=> d!124975 (= (array_inv!24306 (_values!6271 thiss!1427)) (bvsge (size!31934 (_values!6271 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036587 d!124975))

(declare-fun mapNonEmpty!38345 () Bool)

(declare-fun mapRes!38345 () Bool)

(declare-fun tp!73638 () Bool)

(declare-fun e!586237 () Bool)

(assert (=> mapNonEmpty!38345 (= mapRes!38345 (and tp!73638 e!586237))))

(declare-fun mapValue!38345 () ValueCell!11573)

(declare-fun mapRest!38345 () (Array (_ BitVec 32) ValueCell!11573))

(declare-fun mapKey!38345 () (_ BitVec 32))

(assert (=> mapNonEmpty!38345 (= mapRest!38336 (store mapRest!38345 mapKey!38345 mapValue!38345))))

(declare-fun mapIsEmpty!38345 () Bool)

(assert (=> mapIsEmpty!38345 mapRes!38345))

(declare-fun b!1036647 () Bool)

(declare-fun e!586238 () Bool)

(assert (=> b!1036647 (= e!586238 tp_is_empty!24553)))

(declare-fun condMapEmpty!38345 () Bool)

(declare-fun mapDefault!38345 () ValueCell!11573)

(assert (=> mapNonEmpty!38336 (= condMapEmpty!38345 (= mapRest!38336 ((as const (Array (_ BitVec 32) ValueCell!11573)) mapDefault!38345)))))

(assert (=> mapNonEmpty!38336 (= tp!73622 (and e!586238 mapRes!38345))))

(declare-fun b!1036646 () Bool)

(assert (=> b!1036646 (= e!586237 tp_is_empty!24553)))

(assert (= (and mapNonEmpty!38336 condMapEmpty!38345) mapIsEmpty!38345))

(assert (= (and mapNonEmpty!38336 (not condMapEmpty!38345)) mapNonEmpty!38345))

(assert (= (and mapNonEmpty!38345 ((_ is ValueCellFull!11573) mapValue!38345)) b!1036646))

(assert (= (and mapNonEmpty!38336 ((_ is ValueCellFull!11573) mapDefault!38345)) b!1036647))

(declare-fun m!957003 () Bool)

(assert (=> mapNonEmpty!38345 m!957003))

(check-sat (not b!1036638) tp_is_empty!24553 (not b!1036639) (not b_next!20833) (not d!124971) b_and!33343 (not mapNonEmpty!38345) (not b!1036637))
(check-sat b_and!33343 (not b_next!20833))
(get-model)

(declare-fun b!1036658 () Bool)

(declare-fun res!691826 () Bool)

(declare-fun e!586241 () Bool)

(assert (=> b!1036658 (=> (not res!691826) (not e!586241))))

(declare-fun size!31939 (LongMapFixedSize!5740) (_ BitVec 32))

(assert (=> b!1036658 (= res!691826 (= (size!31939 thiss!1427) (bvadd (_size!2925 thiss!1427) (bvsdiv (bvadd (extraKeys!5978 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124977 () Bool)

(declare-fun res!691827 () Bool)

(assert (=> d!124977 (=> (not res!691827) (not e!586241))))

(assert (=> d!124977 (= res!691827 (validMask!0 (mask!30189 thiss!1427)))))

(assert (=> d!124977 (= (simpleValid!411 thiss!1427) e!586241)))

(declare-fun b!1036657 () Bool)

(declare-fun res!691828 () Bool)

(assert (=> b!1036657 (=> (not res!691828) (not e!586241))))

(assert (=> b!1036657 (= res!691828 (bvsge (size!31939 thiss!1427) (_size!2925 thiss!1427)))))

(declare-fun b!1036656 () Bool)

(declare-fun res!691829 () Bool)

(assert (=> b!1036656 (=> (not res!691829) (not e!586241))))

(assert (=> b!1036656 (= res!691829 (and (= (size!31934 (_values!6271 thiss!1427)) (bvadd (mask!30189 thiss!1427) #b00000000000000000000000000000001)) (= (size!31933 (_keys!11472 thiss!1427)) (size!31934 (_values!6271 thiss!1427))) (bvsge (_size!2925 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2925 thiss!1427) (bvadd (mask!30189 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1036659 () Bool)

(assert (=> b!1036659 (= e!586241 (and (bvsge (extraKeys!5978 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5978 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2925 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124977 res!691827) b!1036656))

(assert (= (and b!1036656 res!691829) b!1036657))

(assert (= (and b!1036657 res!691828) b!1036658))

(assert (= (and b!1036658 res!691826) b!1036659))

(declare-fun m!957005 () Bool)

(assert (=> b!1036658 m!957005))

(assert (=> d!124977 m!956967))

(assert (=> b!1036657 m!957005))

(assert (=> d!124971 d!124977))

(declare-fun b!1036670 () Bool)

(declare-fun e!586250 () Bool)

(declare-fun e!586253 () Bool)

(assert (=> b!1036670 (= e!586250 e!586253)))

(declare-fun res!691837 () Bool)

(assert (=> b!1036670 (=> (not res!691837) (not e!586253))))

(declare-fun e!586251 () Bool)

(assert (=> b!1036670 (= res!691837 (not e!586251))))

(declare-fun res!691836 () Bool)

(assert (=> b!1036670 (=> (not res!691836) (not e!586251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1036670 (= res!691836 (validKeyInArray!0 (select (arr!31405 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124979 () Bool)

(declare-fun res!691838 () Bool)

(assert (=> d!124979 (=> res!691838 e!586250)))

(assert (=> d!124979 (= res!691838 (bvsge #b00000000000000000000000000000000 (size!31933 (_keys!11472 thiss!1427))))))

(assert (=> d!124979 (= (arrayNoDuplicates!0 (_keys!11472 thiss!1427) #b00000000000000000000000000000000 Nil!21896) e!586250)))

(declare-fun b!1036671 () Bool)

(declare-fun contains!6044 (List!21899 (_ BitVec 64)) Bool)

(assert (=> b!1036671 (= e!586251 (contains!6044 Nil!21896 (select (arr!31405 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43849 () Bool)

(declare-fun call!43852 () Bool)

(declare-fun c!105137 () Bool)

(assert (=> bm!43849 (= call!43852 (arrayNoDuplicates!0 (_keys!11472 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105137 (Cons!21895 (select (arr!31405 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000) Nil!21896) Nil!21896)))))

(declare-fun b!1036672 () Bool)

(declare-fun e!586252 () Bool)

(assert (=> b!1036672 (= e!586252 call!43852)))

(declare-fun b!1036673 () Bool)

(assert (=> b!1036673 (= e!586253 e!586252)))

(assert (=> b!1036673 (= c!105137 (validKeyInArray!0 (select (arr!31405 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036674 () Bool)

(assert (=> b!1036674 (= e!586252 call!43852)))

(assert (= (and d!124979 (not res!691838)) b!1036670))

(assert (= (and b!1036670 res!691836) b!1036671))

(assert (= (and b!1036670 res!691837) b!1036673))

(assert (= (and b!1036673 c!105137) b!1036672))

(assert (= (and b!1036673 (not c!105137)) b!1036674))

(assert (= (or b!1036672 b!1036674) bm!43849))

(declare-fun m!957007 () Bool)

(assert (=> b!1036670 m!957007))

(assert (=> b!1036670 m!957007))

(declare-fun m!957009 () Bool)

(assert (=> b!1036670 m!957009))

(assert (=> b!1036671 m!957007))

(assert (=> b!1036671 m!957007))

(declare-fun m!957011 () Bool)

(assert (=> b!1036671 m!957011))

(assert (=> bm!43849 m!957007))

(declare-fun m!957013 () Bool)

(assert (=> bm!43849 m!957013))

(assert (=> b!1036673 m!957007))

(assert (=> b!1036673 m!957007))

(assert (=> b!1036673 m!957009))

(assert (=> b!1036639 d!124979))

(declare-fun d!124981 () Bool)

(declare-fun lt!457262 () (_ BitVec 32))

(assert (=> d!124981 (and (bvsge lt!457262 #b00000000000000000000000000000000) (bvsle lt!457262 (bvsub (size!31933 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!586259 () (_ BitVec 32))

(assert (=> d!124981 (= lt!457262 e!586259)))

(declare-fun c!105142 () Bool)

(assert (=> d!124981 (= c!105142 (bvsge #b00000000000000000000000000000000 (size!31933 (_keys!11472 thiss!1427))))))

(assert (=> d!124981 (and (bvsle #b00000000000000000000000000000000 (size!31933 (_keys!11472 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31933 (_keys!11472 thiss!1427)) (size!31933 (_keys!11472 thiss!1427))))))

(assert (=> d!124981 (= (arrayCountValidKeys!0 (_keys!11472 thiss!1427) #b00000000000000000000000000000000 (size!31933 (_keys!11472 thiss!1427))) lt!457262)))

(declare-fun bm!43852 () Bool)

(declare-fun call!43855 () (_ BitVec 32))

(assert (=> bm!43852 (= call!43855 (arrayCountValidKeys!0 (_keys!11472 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31933 (_keys!11472 thiss!1427))))))

(declare-fun b!1036683 () Bool)

(assert (=> b!1036683 (= e!586259 #b00000000000000000000000000000000)))

(declare-fun b!1036684 () Bool)

(declare-fun e!586258 () (_ BitVec 32))

(assert (=> b!1036684 (= e!586259 e!586258)))

(declare-fun c!105143 () Bool)

(assert (=> b!1036684 (= c!105143 (validKeyInArray!0 (select (arr!31405 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036685 () Bool)

(assert (=> b!1036685 (= e!586258 (bvadd #b00000000000000000000000000000001 call!43855))))

(declare-fun b!1036686 () Bool)

(assert (=> b!1036686 (= e!586258 call!43855)))

(assert (= (and d!124981 c!105142) b!1036683))

(assert (= (and d!124981 (not c!105142)) b!1036684))

(assert (= (and b!1036684 c!105143) b!1036685))

(assert (= (and b!1036684 (not c!105143)) b!1036686))

(assert (= (or b!1036685 b!1036686) bm!43852))

(declare-fun m!957015 () Bool)

(assert (=> bm!43852 m!957015))

(assert (=> b!1036684 m!957007))

(assert (=> b!1036684 m!957007))

(assert (=> b!1036684 m!957009))

(assert (=> b!1036637 d!124981))

(declare-fun b!1036695 () Bool)

(declare-fun e!586267 () Bool)

(declare-fun call!43858 () Bool)

(assert (=> b!1036695 (= e!586267 call!43858)))

(declare-fun bm!43855 () Bool)

(assert (=> bm!43855 (= call!43858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11472 thiss!1427) (mask!30189 thiss!1427)))))

(declare-fun b!1036696 () Bool)

(declare-fun e!586266 () Bool)

(assert (=> b!1036696 (= e!586266 e!586267)))

(declare-fun lt!457271 () (_ BitVec 64))

(assert (=> b!1036696 (= lt!457271 (select (arr!31405 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33892 0))(
  ( (Unit!33893) )
))
(declare-fun lt!457270 () Unit!33892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65247 (_ BitVec 64) (_ BitVec 32)) Unit!33892)

(assert (=> b!1036696 (= lt!457270 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11472 thiss!1427) lt!457271 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1036696 (arrayContainsKey!0 (_keys!11472 thiss!1427) lt!457271 #b00000000000000000000000000000000)))

(declare-fun lt!457269 () Unit!33892)

(assert (=> b!1036696 (= lt!457269 lt!457270)))

(declare-fun res!691843 () Bool)

(declare-datatypes ((SeekEntryResult!9700 0))(
  ( (MissingZero!9700 (index!41171 (_ BitVec 32))) (Found!9700 (index!41172 (_ BitVec 32))) (Intermediate!9700 (undefined!10512 Bool) (index!41173 (_ BitVec 32)) (x!92343 (_ BitVec 32))) (Undefined!9700) (MissingVacant!9700 (index!41174 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65247 (_ BitVec 32)) SeekEntryResult!9700)

(assert (=> b!1036696 (= res!691843 (= (seekEntryOrOpen!0 (select (arr!31405 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000) (_keys!11472 thiss!1427) (mask!30189 thiss!1427)) (Found!9700 #b00000000000000000000000000000000)))))

(assert (=> b!1036696 (=> (not res!691843) (not e!586267))))

(declare-fun d!124983 () Bool)

(declare-fun res!691844 () Bool)

(declare-fun e!586268 () Bool)

(assert (=> d!124983 (=> res!691844 e!586268)))

(assert (=> d!124983 (= res!691844 (bvsge #b00000000000000000000000000000000 (size!31933 (_keys!11472 thiss!1427))))))

(assert (=> d!124983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11472 thiss!1427) (mask!30189 thiss!1427)) e!586268)))

(declare-fun b!1036697 () Bool)

(assert (=> b!1036697 (= e!586268 e!586266)))

(declare-fun c!105146 () Bool)

(assert (=> b!1036697 (= c!105146 (validKeyInArray!0 (select (arr!31405 (_keys!11472 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036698 () Bool)

(assert (=> b!1036698 (= e!586266 call!43858)))

(assert (= (and d!124983 (not res!691844)) b!1036697))

(assert (= (and b!1036697 c!105146) b!1036696))

(assert (= (and b!1036697 (not c!105146)) b!1036698))

(assert (= (and b!1036696 res!691843) b!1036695))

(assert (= (or b!1036695 b!1036698) bm!43855))

(declare-fun m!957017 () Bool)

(assert (=> bm!43855 m!957017))

(assert (=> b!1036696 m!957007))

(declare-fun m!957019 () Bool)

(assert (=> b!1036696 m!957019))

(declare-fun m!957021 () Bool)

(assert (=> b!1036696 m!957021))

(assert (=> b!1036696 m!957007))

(declare-fun m!957023 () Bool)

(assert (=> b!1036696 m!957023))

(assert (=> b!1036697 m!957007))

(assert (=> b!1036697 m!957007))

(assert (=> b!1036697 m!957009))

(assert (=> b!1036638 d!124983))

(declare-fun mapNonEmpty!38346 () Bool)

(declare-fun mapRes!38346 () Bool)

(declare-fun tp!73639 () Bool)

(declare-fun e!586269 () Bool)

(assert (=> mapNonEmpty!38346 (= mapRes!38346 (and tp!73639 e!586269))))

(declare-fun mapKey!38346 () (_ BitVec 32))

(declare-fun mapValue!38346 () ValueCell!11573)

(declare-fun mapRest!38346 () (Array (_ BitVec 32) ValueCell!11573))

(assert (=> mapNonEmpty!38346 (= mapRest!38345 (store mapRest!38346 mapKey!38346 mapValue!38346))))

(declare-fun mapIsEmpty!38346 () Bool)

(assert (=> mapIsEmpty!38346 mapRes!38346))

(declare-fun b!1036700 () Bool)

(declare-fun e!586270 () Bool)

(assert (=> b!1036700 (= e!586270 tp_is_empty!24553)))

(declare-fun condMapEmpty!38346 () Bool)

(declare-fun mapDefault!38346 () ValueCell!11573)

(assert (=> mapNonEmpty!38345 (= condMapEmpty!38346 (= mapRest!38345 ((as const (Array (_ BitVec 32) ValueCell!11573)) mapDefault!38346)))))

(assert (=> mapNonEmpty!38345 (= tp!73638 (and e!586270 mapRes!38346))))

(declare-fun b!1036699 () Bool)

(assert (=> b!1036699 (= e!586269 tp_is_empty!24553)))

(assert (= (and mapNonEmpty!38345 condMapEmpty!38346) mapIsEmpty!38346))

(assert (= (and mapNonEmpty!38345 (not condMapEmpty!38346)) mapNonEmpty!38346))

(assert (= (and mapNonEmpty!38346 ((_ is ValueCellFull!11573) mapValue!38346)) b!1036699))

(assert (= (and mapNonEmpty!38345 ((_ is ValueCellFull!11573) mapDefault!38346)) b!1036700))

(declare-fun m!957025 () Bool)

(assert (=> mapNonEmpty!38346 m!957025))

(check-sat (not b!1036657) (not b!1036697) (not b!1036671) (not mapNonEmpty!38346) tp_is_empty!24553 (not b_next!20833) (not b!1036673) b_and!33343 (not b!1036684) (not b!1036696) (not bm!43849) (not bm!43852) (not b!1036670) (not bm!43855) (not d!124977) (not b!1036658))
(check-sat b_and!33343 (not b_next!20833))
