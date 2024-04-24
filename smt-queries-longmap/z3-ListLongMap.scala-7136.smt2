; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90790 () Bool)

(assert start!90790)

(declare-fun b!1037074 () Bool)

(declare-fun b_free!20869 () Bool)

(declare-fun b_next!20869 () Bool)

(assert (=> b!1037074 (= b_free!20869 (not b_next!20869))))

(declare-fun tp!73738 () Bool)

(declare-fun b_and!33379 () Bool)

(assert (=> b!1037074 (= tp!73738 b_and!33379)))

(declare-fun b!1037073 () Bool)

(declare-fun e!586572 () Bool)

(declare-fun tp_is_empty!24589 () Bool)

(assert (=> b!1037073 (= e!586572 tp_is_empty!24589)))

(declare-fun mapIsEmpty!38397 () Bool)

(declare-fun mapRes!38397 () Bool)

(assert (=> mapIsEmpty!38397 mapRes!38397))

(declare-fun e!586575 () Bool)

(declare-datatypes ((V!37659 0))(
  ( (V!37660 (val!12345 Int)) )
))
(declare-datatypes ((ValueCell!11591 0))(
  ( (ValueCellFull!11591 (v!14921 V!37659)) (EmptyCell!11591) )
))
(declare-datatypes ((array!65323 0))(
  ( (array!65324 (arr!31441 (Array (_ BitVec 32) (_ BitVec 64))) (size!31970 (_ BitVec 32))) )
))
(declare-datatypes ((array!65325 0))(
  ( (array!65326 (arr!31442 (Array (_ BitVec 32) ValueCell!11591)) (size!31971 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5776 0))(
  ( (LongMapFixedSize!5777 (defaultEntry!6266 Int) (mask!30223 (_ BitVec 32)) (extraKeys!5996 (_ BitVec 32)) (zeroValue!6100 V!37659) (minValue!6102 V!37659) (_size!2943 (_ BitVec 32)) (_keys!11492 array!65323) (_values!6289 array!65325) (_vacant!2943 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5776)

(declare-fun e!586576 () Bool)

(declare-fun array_inv!24327 (array!65323) Bool)

(declare-fun array_inv!24328 (array!65325) Bool)

(assert (=> b!1037074 (= e!586575 (and tp!73738 tp_is_empty!24589 (array_inv!24327 (_keys!11492 thiss!1427)) (array_inv!24328 (_values!6289 thiss!1427)) e!586576))))

(declare-fun b!1037075 () Bool)

(declare-fun res!692015 () Bool)

(declare-fun e!586574 () Bool)

(assert (=> b!1037075 (=> (not res!692015) (not e!586574))))

(assert (=> b!1037075 (= res!692015 (and (= (size!31971 (_values!6289 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30223 thiss!1427))) (= (size!31970 (_keys!11492 thiss!1427)) (size!31971 (_values!6289 thiss!1427))) (bvsge (mask!30223 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5996 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5996 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1037076 () Bool)

(declare-fun res!692017 () Bool)

(assert (=> b!1037076 (=> (not res!692017) (not e!586574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65323 (_ BitVec 32)) Bool)

(assert (=> b!1037076 (= res!692017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11492 thiss!1427) (mask!30223 thiss!1427)))))

(declare-fun b!1037077 () Bool)

(assert (=> b!1037077 (= e!586576 (and e!586572 mapRes!38397))))

(declare-fun condMapEmpty!38397 () Bool)

(declare-fun mapDefault!38397 () ValueCell!11591)

(assert (=> b!1037077 (= condMapEmpty!38397 (= (arr!31442 (_values!6289 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11591)) mapDefault!38397)))))

(declare-fun b!1037078 () Bool)

(declare-fun res!692018 () Bool)

(assert (=> b!1037078 (=> (not res!692018) (not e!586574))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1037078 (= res!692018 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!38397 () Bool)

(declare-fun tp!73737 () Bool)

(declare-fun e!586571 () Bool)

(assert (=> mapNonEmpty!38397 (= mapRes!38397 (and tp!73737 e!586571))))

(declare-fun mapRest!38397 () (Array (_ BitVec 32) ValueCell!11591))

(declare-fun mapKey!38397 () (_ BitVec 32))

(declare-fun mapValue!38397 () ValueCell!11591)

(assert (=> mapNonEmpty!38397 (= (arr!31442 (_values!6289 thiss!1427)) (store mapRest!38397 mapKey!38397 mapValue!38397))))

(declare-fun res!692014 () Bool)

(assert (=> start!90790 (=> (not res!692014) (not e!586574))))

(declare-fun valid!2186 (LongMapFixedSize!5776) Bool)

(assert (=> start!90790 (= res!692014 (valid!2186 thiss!1427))))

(assert (=> start!90790 e!586574))

(assert (=> start!90790 e!586575))

(assert (=> start!90790 true))

(declare-fun b!1037072 () Bool)

(assert (=> b!1037072 (= e!586571 tp_is_empty!24589)))

(declare-fun b!1037079 () Bool)

(declare-fun res!692016 () Bool)

(assert (=> b!1037079 (=> (not res!692016) (not e!586574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1037079 (= res!692016 (validMask!0 (mask!30223 thiss!1427)))))

(declare-fun b!1037080 () Bool)

(declare-datatypes ((List!21901 0))(
  ( (Nil!21898) (Cons!21897 (h!23108 (_ BitVec 64)) (t!31096 List!21901)) )
))
(declare-fun arrayNoDuplicates!0 (array!65323 (_ BitVec 32) List!21901) Bool)

(assert (=> b!1037080 (= e!586574 (not (arrayNoDuplicates!0 (_keys!11492 thiss!1427) #b00000000000000000000000000000000 Nil!21898)))))

(assert (= (and start!90790 res!692014) b!1037078))

(assert (= (and b!1037078 res!692018) b!1037079))

(assert (= (and b!1037079 res!692016) b!1037075))

(assert (= (and b!1037075 res!692015) b!1037076))

(assert (= (and b!1037076 res!692017) b!1037080))

(assert (= (and b!1037077 condMapEmpty!38397) mapIsEmpty!38397))

(assert (= (and b!1037077 (not condMapEmpty!38397)) mapNonEmpty!38397))

(get-info :version)

(assert (= (and mapNonEmpty!38397 ((_ is ValueCellFull!11591) mapValue!38397)) b!1037072))

(assert (= (and b!1037077 ((_ is ValueCellFull!11591) mapDefault!38397)) b!1037073))

(assert (= b!1037074 b!1037077))

(assert (= start!90790 b!1037074))

(declare-fun m!957203 () Bool)

(assert (=> b!1037074 m!957203))

(declare-fun m!957205 () Bool)

(assert (=> b!1037074 m!957205))

(declare-fun m!957207 () Bool)

(assert (=> b!1037076 m!957207))

(declare-fun m!957209 () Bool)

(assert (=> mapNonEmpty!38397 m!957209))

(declare-fun m!957211 () Bool)

(assert (=> start!90790 m!957211))

(declare-fun m!957213 () Bool)

(assert (=> b!1037079 m!957213))

(declare-fun m!957215 () Bool)

(assert (=> b!1037080 m!957215))

(check-sat (not b!1037080) (not b!1037076) tp_is_empty!24589 b_and!33379 (not b!1037074) (not mapNonEmpty!38397) (not b_next!20869) (not b!1037079) (not start!90790))
(check-sat b_and!33379 (not b_next!20869))
(get-model)

(declare-fun d!125007 () Bool)

(assert (=> d!125007 (= (array_inv!24327 (_keys!11492 thiss!1427)) (bvsge (size!31970 (_keys!11492 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037074 d!125007))

(declare-fun d!125009 () Bool)

(assert (=> d!125009 (= (array_inv!24328 (_values!6289 thiss!1427)) (bvsge (size!31971 (_values!6289 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1037074 d!125009))

(declare-fun d!125011 () Bool)

(declare-fun res!692055 () Bool)

(declare-fun e!586615 () Bool)

(assert (=> d!125011 (=> (not res!692055) (not e!586615))))

(declare-fun simpleValid!413 (LongMapFixedSize!5776) Bool)

(assert (=> d!125011 (= res!692055 (simpleValid!413 thiss!1427))))

(assert (=> d!125011 (= (valid!2186 thiss!1427) e!586615)))

(declare-fun b!1037141 () Bool)

(declare-fun res!692056 () Bool)

(assert (=> b!1037141 (=> (not res!692056) (not e!586615))))

(declare-fun arrayCountValidKeys!0 (array!65323 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1037141 (= res!692056 (= (arrayCountValidKeys!0 (_keys!11492 thiss!1427) #b00000000000000000000000000000000 (size!31970 (_keys!11492 thiss!1427))) (_size!2943 thiss!1427)))))

(declare-fun b!1037142 () Bool)

(declare-fun res!692057 () Bool)

(assert (=> b!1037142 (=> (not res!692057) (not e!586615))))

(assert (=> b!1037142 (= res!692057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11492 thiss!1427) (mask!30223 thiss!1427)))))

(declare-fun b!1037143 () Bool)

(assert (=> b!1037143 (= e!586615 (arrayNoDuplicates!0 (_keys!11492 thiss!1427) #b00000000000000000000000000000000 Nil!21898))))

(assert (= (and d!125011 res!692055) b!1037141))

(assert (= (and b!1037141 res!692056) b!1037142))

(assert (= (and b!1037142 res!692057) b!1037143))

(declare-fun m!957245 () Bool)

(assert (=> d!125011 m!957245))

(declare-fun m!957247 () Bool)

(assert (=> b!1037141 m!957247))

(assert (=> b!1037142 m!957207))

(assert (=> b!1037143 m!957215))

(assert (=> start!90790 d!125011))

(declare-fun d!125013 () Bool)

(assert (=> d!125013 (= (validMask!0 (mask!30223 thiss!1427)) (and (or (= (mask!30223 thiss!1427) #b00000000000000000000000000000111) (= (mask!30223 thiss!1427) #b00000000000000000000000000001111) (= (mask!30223 thiss!1427) #b00000000000000000000000000011111) (= (mask!30223 thiss!1427) #b00000000000000000000000000111111) (= (mask!30223 thiss!1427) #b00000000000000000000000001111111) (= (mask!30223 thiss!1427) #b00000000000000000000000011111111) (= (mask!30223 thiss!1427) #b00000000000000000000000111111111) (= (mask!30223 thiss!1427) #b00000000000000000000001111111111) (= (mask!30223 thiss!1427) #b00000000000000000000011111111111) (= (mask!30223 thiss!1427) #b00000000000000000000111111111111) (= (mask!30223 thiss!1427) #b00000000000000000001111111111111) (= (mask!30223 thiss!1427) #b00000000000000000011111111111111) (= (mask!30223 thiss!1427) #b00000000000000000111111111111111) (= (mask!30223 thiss!1427) #b00000000000000001111111111111111) (= (mask!30223 thiss!1427) #b00000000000000011111111111111111) (= (mask!30223 thiss!1427) #b00000000000000111111111111111111) (= (mask!30223 thiss!1427) #b00000000000001111111111111111111) (= (mask!30223 thiss!1427) #b00000000000011111111111111111111) (= (mask!30223 thiss!1427) #b00000000000111111111111111111111) (= (mask!30223 thiss!1427) #b00000000001111111111111111111111) (= (mask!30223 thiss!1427) #b00000000011111111111111111111111) (= (mask!30223 thiss!1427) #b00000000111111111111111111111111) (= (mask!30223 thiss!1427) #b00000001111111111111111111111111) (= (mask!30223 thiss!1427) #b00000011111111111111111111111111) (= (mask!30223 thiss!1427) #b00000111111111111111111111111111) (= (mask!30223 thiss!1427) #b00001111111111111111111111111111) (= (mask!30223 thiss!1427) #b00011111111111111111111111111111) (= (mask!30223 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30223 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1037079 d!125013))

(declare-fun bm!43861 () Bool)

(declare-fun call!43864 () Bool)

(declare-fun c!105152 () Bool)

(assert (=> bm!43861 (= call!43864 (arrayNoDuplicates!0 (_keys!11492 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105152 (Cons!21897 (select (arr!31441 (_keys!11492 thiss!1427)) #b00000000000000000000000000000000) Nil!21898) Nil!21898)))))

(declare-fun b!1037154 () Bool)

(declare-fun e!586626 () Bool)

(assert (=> b!1037154 (= e!586626 call!43864)))

(declare-fun b!1037155 () Bool)

(assert (=> b!1037155 (= e!586626 call!43864)))

(declare-fun b!1037156 () Bool)

(declare-fun e!586625 () Bool)

(assert (=> b!1037156 (= e!586625 e!586626)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1037156 (= c!105152 (validKeyInArray!0 (select (arr!31441 (_keys!11492 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037158 () Bool)

(declare-fun e!586627 () Bool)

(declare-fun contains!6045 (List!21901 (_ BitVec 64)) Bool)

(assert (=> b!1037158 (= e!586627 (contains!6045 Nil!21898 (select (arr!31441 (_keys!11492 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125015 () Bool)

(declare-fun res!692065 () Bool)

(declare-fun e!586624 () Bool)

(assert (=> d!125015 (=> res!692065 e!586624)))

(assert (=> d!125015 (= res!692065 (bvsge #b00000000000000000000000000000000 (size!31970 (_keys!11492 thiss!1427))))))

(assert (=> d!125015 (= (arrayNoDuplicates!0 (_keys!11492 thiss!1427) #b00000000000000000000000000000000 Nil!21898) e!586624)))

(declare-fun b!1037157 () Bool)

(assert (=> b!1037157 (= e!586624 e!586625)))

(declare-fun res!692066 () Bool)

(assert (=> b!1037157 (=> (not res!692066) (not e!586625))))

(assert (=> b!1037157 (= res!692066 (not e!586627))))

(declare-fun res!692064 () Bool)

(assert (=> b!1037157 (=> (not res!692064) (not e!586627))))

(assert (=> b!1037157 (= res!692064 (validKeyInArray!0 (select (arr!31441 (_keys!11492 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125015 (not res!692065)) b!1037157))

(assert (= (and b!1037157 res!692064) b!1037158))

(assert (= (and b!1037157 res!692066) b!1037156))

(assert (= (and b!1037156 c!105152) b!1037154))

(assert (= (and b!1037156 (not c!105152)) b!1037155))

(assert (= (or b!1037154 b!1037155) bm!43861))

(declare-fun m!957249 () Bool)

(assert (=> bm!43861 m!957249))

(declare-fun m!957251 () Bool)

(assert (=> bm!43861 m!957251))

(assert (=> b!1037156 m!957249))

(assert (=> b!1037156 m!957249))

(declare-fun m!957253 () Bool)

(assert (=> b!1037156 m!957253))

(assert (=> b!1037158 m!957249))

(assert (=> b!1037158 m!957249))

(declare-fun m!957255 () Bool)

(assert (=> b!1037158 m!957255))

(assert (=> b!1037157 m!957249))

(assert (=> b!1037157 m!957249))

(assert (=> b!1037157 m!957253))

(assert (=> b!1037080 d!125015))

(declare-fun b!1037167 () Bool)

(declare-fun e!586634 () Bool)

(declare-fun e!586635 () Bool)

(assert (=> b!1037167 (= e!586634 e!586635)))

(declare-fun c!105155 () Bool)

(assert (=> b!1037167 (= c!105155 (validKeyInArray!0 (select (arr!31441 (_keys!11492 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1037168 () Bool)

(declare-fun e!586636 () Bool)

(declare-fun call!43867 () Bool)

(assert (=> b!1037168 (= e!586636 call!43867)))

(declare-fun b!1037169 () Bool)

(assert (=> b!1037169 (= e!586635 e!586636)))

(declare-fun lt!457289 () (_ BitVec 64))

(assert (=> b!1037169 (= lt!457289 (select (arr!31441 (_keys!11492 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33896 0))(
  ( (Unit!33897) )
))
(declare-fun lt!457287 () Unit!33896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65323 (_ BitVec 64) (_ BitVec 32)) Unit!33896)

(assert (=> b!1037169 (= lt!457287 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11492 thiss!1427) lt!457289 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1037169 (arrayContainsKey!0 (_keys!11492 thiss!1427) lt!457289 #b00000000000000000000000000000000)))

(declare-fun lt!457288 () Unit!33896)

(assert (=> b!1037169 (= lt!457288 lt!457287)))

(declare-fun res!692071 () Bool)

(declare-datatypes ((SeekEntryResult!9702 0))(
  ( (MissingZero!9702 (index!41179 (_ BitVec 32))) (Found!9702 (index!41180 (_ BitVec 32))) (Intermediate!9702 (undefined!10514 Bool) (index!41181 (_ BitVec 32)) (x!92409 (_ BitVec 32))) (Undefined!9702) (MissingVacant!9702 (index!41182 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65323 (_ BitVec 32)) SeekEntryResult!9702)

(assert (=> b!1037169 (= res!692071 (= (seekEntryOrOpen!0 (select (arr!31441 (_keys!11492 thiss!1427)) #b00000000000000000000000000000000) (_keys!11492 thiss!1427) (mask!30223 thiss!1427)) (Found!9702 #b00000000000000000000000000000000)))))

(assert (=> b!1037169 (=> (not res!692071) (not e!586636))))

(declare-fun d!125017 () Bool)

(declare-fun res!692072 () Bool)

(assert (=> d!125017 (=> res!692072 e!586634)))

(assert (=> d!125017 (= res!692072 (bvsge #b00000000000000000000000000000000 (size!31970 (_keys!11492 thiss!1427))))))

(assert (=> d!125017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11492 thiss!1427) (mask!30223 thiss!1427)) e!586634)))

(declare-fun b!1037170 () Bool)

(assert (=> b!1037170 (= e!586635 call!43867)))

(declare-fun bm!43864 () Bool)

(assert (=> bm!43864 (= call!43867 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11492 thiss!1427) (mask!30223 thiss!1427)))))

(assert (= (and d!125017 (not res!692072)) b!1037167))

(assert (= (and b!1037167 c!105155) b!1037169))

(assert (= (and b!1037167 (not c!105155)) b!1037170))

(assert (= (and b!1037169 res!692071) b!1037168))

(assert (= (or b!1037168 b!1037170) bm!43864))

(assert (=> b!1037167 m!957249))

(assert (=> b!1037167 m!957249))

(assert (=> b!1037167 m!957253))

(assert (=> b!1037169 m!957249))

(declare-fun m!957257 () Bool)

(assert (=> b!1037169 m!957257))

(declare-fun m!957259 () Bool)

(assert (=> b!1037169 m!957259))

(assert (=> b!1037169 m!957249))

(declare-fun m!957261 () Bool)

(assert (=> b!1037169 m!957261))

(declare-fun m!957263 () Bool)

(assert (=> bm!43864 m!957263))

(assert (=> b!1037076 d!125017))

(declare-fun b!1037177 () Bool)

(declare-fun e!586641 () Bool)

(assert (=> b!1037177 (= e!586641 tp_is_empty!24589)))

(declare-fun mapIsEmpty!38406 () Bool)

(declare-fun mapRes!38406 () Bool)

(assert (=> mapIsEmpty!38406 mapRes!38406))

(declare-fun condMapEmpty!38406 () Bool)

(declare-fun mapDefault!38406 () ValueCell!11591)

(assert (=> mapNonEmpty!38397 (= condMapEmpty!38406 (= mapRest!38397 ((as const (Array (_ BitVec 32) ValueCell!11591)) mapDefault!38406)))))

(declare-fun e!586642 () Bool)

(assert (=> mapNonEmpty!38397 (= tp!73737 (and e!586642 mapRes!38406))))

(declare-fun b!1037178 () Bool)

(assert (=> b!1037178 (= e!586642 tp_is_empty!24589)))

(declare-fun mapNonEmpty!38406 () Bool)

(declare-fun tp!73753 () Bool)

(assert (=> mapNonEmpty!38406 (= mapRes!38406 (and tp!73753 e!586641))))

(declare-fun mapValue!38406 () ValueCell!11591)

(declare-fun mapRest!38406 () (Array (_ BitVec 32) ValueCell!11591))

(declare-fun mapKey!38406 () (_ BitVec 32))

(assert (=> mapNonEmpty!38406 (= mapRest!38397 (store mapRest!38406 mapKey!38406 mapValue!38406))))

(assert (= (and mapNonEmpty!38397 condMapEmpty!38406) mapIsEmpty!38406))

(assert (= (and mapNonEmpty!38397 (not condMapEmpty!38406)) mapNonEmpty!38406))

(assert (= (and mapNonEmpty!38406 ((_ is ValueCellFull!11591) mapValue!38406)) b!1037177))

(assert (= (and mapNonEmpty!38397 ((_ is ValueCellFull!11591) mapDefault!38406)) b!1037178))

(declare-fun m!957265 () Bool)

(assert (=> mapNonEmpty!38406 m!957265))

(check-sat (not b_next!20869) (not b!1037169) (not b!1037143) (not b!1037158) (not b!1037141) b_and!33379 (not mapNonEmpty!38406) (not bm!43864) (not b!1037142) (not bm!43861) (not d!125011) tp_is_empty!24589 (not b!1037167) (not b!1037156) (not b!1037157))
(check-sat b_and!33379 (not b_next!20869))
