; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89528 () Bool)

(assert start!89528)

(declare-fun b!1025204 () Bool)

(declare-fun b_free!20335 () Bool)

(declare-fun b_next!20335 () Bool)

(assert (=> b!1025204 (= b_free!20335 (not b_next!20335))))

(declare-fun tp!72040 () Bool)

(declare-fun b_and!32591 () Bool)

(assert (=> b!1025204 (= tp!72040 b_and!32591)))

(declare-fun b!1025202 () Bool)

(declare-fun e!577896 () Bool)

(declare-fun tp_is_empty!24055 () Bool)

(assert (=> b!1025202 (= e!577896 tp_is_empty!24055)))

(declare-fun b!1025203 () Bool)

(declare-fun e!577892 () Bool)

(assert (=> b!1025203 (= e!577892 tp_is_empty!24055)))

(declare-datatypes ((V!36947 0))(
  ( (V!36948 (val!12078 Int)) )
))
(declare-datatypes ((ValueCell!11324 0))(
  ( (ValueCellFull!11324 (v!14643 V!36947)) (EmptyCell!11324) )
))
(declare-datatypes ((array!64203 0))(
  ( (array!64204 (arr!30907 (Array (_ BitVec 32) (_ BitVec 64))) (size!31419 (_ BitVec 32))) )
))
(declare-datatypes ((array!64205 0))(
  ( (array!64206 (arr!30908 (Array (_ BitVec 32) ValueCell!11324)) (size!31420 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5242 0))(
  ( (LongMapFixedSize!5243 (defaultEntry!5973 Int) (mask!29668 (_ BitVec 32)) (extraKeys!5705 (_ BitVec 32)) (zeroValue!5809 V!36947) (minValue!5809 V!36947) (_size!2676 (_ BitVec 32)) (_keys!11156 array!64203) (_values!5996 array!64205) (_vacant!2676 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5242)

(declare-fun e!577894 () Bool)

(declare-fun e!577891 () Bool)

(declare-fun array_inv!23963 (array!64203) Bool)

(declare-fun array_inv!23964 (array!64205) Bool)

(assert (=> b!1025204 (= e!577894 (and tp!72040 tp_is_empty!24055 (array_inv!23963 (_keys!11156 thiss!1427)) (array_inv!23964 (_values!5996 thiss!1427)) e!577891))))

(declare-fun mapIsEmpty!37500 () Bool)

(declare-fun mapRes!37500 () Bool)

(assert (=> mapIsEmpty!37500 mapRes!37500))

(declare-fun b!1025205 () Bool)

(declare-fun res!686125 () Bool)

(declare-fun e!577895 () Bool)

(assert (=> b!1025205 (=> (not res!686125) (not e!577895))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1025205 (= res!686125 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!37500 () Bool)

(declare-fun tp!72039 () Bool)

(assert (=> mapNonEmpty!37500 (= mapRes!37500 (and tp!72039 e!577892))))

(declare-fun mapRest!37500 () (Array (_ BitVec 32) ValueCell!11324))

(declare-fun mapValue!37500 () ValueCell!11324)

(declare-fun mapKey!37500 () (_ BitVec 32))

(assert (=> mapNonEmpty!37500 (= (arr!30908 (_values!5996 thiss!1427)) (store mapRest!37500 mapKey!37500 mapValue!37500))))

(declare-fun res!686126 () Bool)

(assert (=> start!89528 (=> (not res!686126) (not e!577895))))

(declare-fun valid!2003 (LongMapFixedSize!5242) Bool)

(assert (=> start!89528 (= res!686126 (valid!2003 thiss!1427))))

(assert (=> start!89528 e!577895))

(assert (=> start!89528 e!577894))

(assert (=> start!89528 true))

(declare-fun b!1025206 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025206 (= e!577895 (not (validMask!0 (mask!29668 thiss!1427))))))

(declare-fun b!1025207 () Bool)

(assert (=> b!1025207 (= e!577891 (and e!577896 mapRes!37500))))

(declare-fun condMapEmpty!37500 () Bool)

(declare-fun mapDefault!37500 () ValueCell!11324)

(assert (=> b!1025207 (= condMapEmpty!37500 (= (arr!30908 (_values!5996 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11324)) mapDefault!37500)))))

(assert (= (and start!89528 res!686126) b!1025205))

(assert (= (and b!1025205 res!686125) b!1025206))

(assert (= (and b!1025207 condMapEmpty!37500) mapIsEmpty!37500))

(assert (= (and b!1025207 (not condMapEmpty!37500)) mapNonEmpty!37500))

(get-info :version)

(assert (= (and mapNonEmpty!37500 ((_ is ValueCellFull!11324) mapValue!37500)) b!1025203))

(assert (= (and b!1025207 ((_ is ValueCellFull!11324) mapDefault!37500)) b!1025202))

(assert (= b!1025204 b!1025207))

(assert (= start!89528 b!1025204))

(declare-fun m!944137 () Bool)

(assert (=> b!1025204 m!944137))

(declare-fun m!944139 () Bool)

(assert (=> b!1025204 m!944139))

(declare-fun m!944141 () Bool)

(assert (=> mapNonEmpty!37500 m!944141))

(declare-fun m!944143 () Bool)

(assert (=> start!89528 m!944143))

(declare-fun m!944145 () Bool)

(assert (=> b!1025206 m!944145))

(check-sat tp_is_empty!24055 (not b!1025206) (not start!89528) (not b_next!20335) b_and!32591 (not mapNonEmpty!37500) (not b!1025204))
(check-sat b_and!32591 (not b_next!20335))
(get-model)

(declare-fun d!123049 () Bool)

(assert (=> d!123049 (= (array_inv!23963 (_keys!11156 thiss!1427)) (bvsge (size!31419 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1025204 d!123049))

(declare-fun d!123051 () Bool)

(assert (=> d!123051 (= (array_inv!23964 (_values!5996 thiss!1427)) (bvsge (size!31420 (_values!5996 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1025204 d!123051))

(declare-fun d!123053 () Bool)

(declare-fun res!686145 () Bool)

(declare-fun e!577935 () Bool)

(assert (=> d!123053 (=> (not res!686145) (not e!577935))))

(declare-fun simpleValid!387 (LongMapFixedSize!5242) Bool)

(assert (=> d!123053 (= res!686145 (simpleValid!387 thiss!1427))))

(assert (=> d!123053 (= (valid!2003 thiss!1427) e!577935)))

(declare-fun b!1025250 () Bool)

(declare-fun res!686146 () Bool)

(assert (=> b!1025250 (=> (not res!686146) (not e!577935))))

(declare-fun arrayCountValidKeys!0 (array!64203 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025250 (= res!686146 (= (arrayCountValidKeys!0 (_keys!11156 thiss!1427) #b00000000000000000000000000000000 (size!31419 (_keys!11156 thiss!1427))) (_size!2676 thiss!1427)))))

(declare-fun b!1025251 () Bool)

(declare-fun res!686147 () Bool)

(assert (=> b!1025251 (=> (not res!686147) (not e!577935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64203 (_ BitVec 32)) Bool)

(assert (=> b!1025251 (= res!686147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11156 thiss!1427) (mask!29668 thiss!1427)))))

(declare-fun b!1025252 () Bool)

(declare-datatypes ((List!21709 0))(
  ( (Nil!21706) (Cons!21705 (h!22912 (_ BitVec 64)) (t!30763 List!21709)) )
))
(declare-fun arrayNoDuplicates!0 (array!64203 (_ BitVec 32) List!21709) Bool)

(assert (=> b!1025252 (= e!577935 (arrayNoDuplicates!0 (_keys!11156 thiss!1427) #b00000000000000000000000000000000 Nil!21706))))

(assert (= (and d!123053 res!686145) b!1025250))

(assert (= (and b!1025250 res!686146) b!1025251))

(assert (= (and b!1025251 res!686147) b!1025252))

(declare-fun m!944167 () Bool)

(assert (=> d!123053 m!944167))

(declare-fun m!944169 () Bool)

(assert (=> b!1025250 m!944169))

(declare-fun m!944171 () Bool)

(assert (=> b!1025251 m!944171))

(declare-fun m!944173 () Bool)

(assert (=> b!1025252 m!944173))

(assert (=> start!89528 d!123053))

(declare-fun d!123055 () Bool)

(assert (=> d!123055 (= (validMask!0 (mask!29668 thiss!1427)) (and (or (= (mask!29668 thiss!1427) #b00000000000000000000000000000111) (= (mask!29668 thiss!1427) #b00000000000000000000000000001111) (= (mask!29668 thiss!1427) #b00000000000000000000000000011111) (= (mask!29668 thiss!1427) #b00000000000000000000000000111111) (= (mask!29668 thiss!1427) #b00000000000000000000000001111111) (= (mask!29668 thiss!1427) #b00000000000000000000000011111111) (= (mask!29668 thiss!1427) #b00000000000000000000000111111111) (= (mask!29668 thiss!1427) #b00000000000000000000001111111111) (= (mask!29668 thiss!1427) #b00000000000000000000011111111111) (= (mask!29668 thiss!1427) #b00000000000000000000111111111111) (= (mask!29668 thiss!1427) #b00000000000000000001111111111111) (= (mask!29668 thiss!1427) #b00000000000000000011111111111111) (= (mask!29668 thiss!1427) #b00000000000000000111111111111111) (= (mask!29668 thiss!1427) #b00000000000000001111111111111111) (= (mask!29668 thiss!1427) #b00000000000000011111111111111111) (= (mask!29668 thiss!1427) #b00000000000000111111111111111111) (= (mask!29668 thiss!1427) #b00000000000001111111111111111111) (= (mask!29668 thiss!1427) #b00000000000011111111111111111111) (= (mask!29668 thiss!1427) #b00000000000111111111111111111111) (= (mask!29668 thiss!1427) #b00000000001111111111111111111111) (= (mask!29668 thiss!1427) #b00000000011111111111111111111111) (= (mask!29668 thiss!1427) #b00000000111111111111111111111111) (= (mask!29668 thiss!1427) #b00000001111111111111111111111111) (= (mask!29668 thiss!1427) #b00000011111111111111111111111111) (= (mask!29668 thiss!1427) #b00000111111111111111111111111111) (= (mask!29668 thiss!1427) #b00001111111111111111111111111111) (= (mask!29668 thiss!1427) #b00011111111111111111111111111111) (= (mask!29668 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29668 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1025206 d!123055))

(declare-fun b!1025260 () Bool)

(declare-fun e!577940 () Bool)

(assert (=> b!1025260 (= e!577940 tp_is_empty!24055)))

(declare-fun condMapEmpty!37509 () Bool)

(declare-fun mapDefault!37509 () ValueCell!11324)

(assert (=> mapNonEmpty!37500 (= condMapEmpty!37509 (= mapRest!37500 ((as const (Array (_ BitVec 32) ValueCell!11324)) mapDefault!37509)))))

(declare-fun mapRes!37509 () Bool)

(assert (=> mapNonEmpty!37500 (= tp!72039 (and e!577940 mapRes!37509))))

(declare-fun b!1025259 () Bool)

(declare-fun e!577941 () Bool)

(assert (=> b!1025259 (= e!577941 tp_is_empty!24055)))

(declare-fun mapNonEmpty!37509 () Bool)

(declare-fun tp!72055 () Bool)

(assert (=> mapNonEmpty!37509 (= mapRes!37509 (and tp!72055 e!577941))))

(declare-fun mapRest!37509 () (Array (_ BitVec 32) ValueCell!11324))

(declare-fun mapKey!37509 () (_ BitVec 32))

(declare-fun mapValue!37509 () ValueCell!11324)

(assert (=> mapNonEmpty!37509 (= mapRest!37500 (store mapRest!37509 mapKey!37509 mapValue!37509))))

(declare-fun mapIsEmpty!37509 () Bool)

(assert (=> mapIsEmpty!37509 mapRes!37509))

(assert (= (and mapNonEmpty!37500 condMapEmpty!37509) mapIsEmpty!37509))

(assert (= (and mapNonEmpty!37500 (not condMapEmpty!37509)) mapNonEmpty!37509))

(assert (= (and mapNonEmpty!37509 ((_ is ValueCellFull!11324) mapValue!37509)) b!1025259))

(assert (= (and mapNonEmpty!37500 ((_ is ValueCellFull!11324) mapDefault!37509)) b!1025260))

(declare-fun m!944175 () Bool)

(assert (=> mapNonEmpty!37509 m!944175))

(check-sat (not b!1025251) (not mapNonEmpty!37509) (not b_next!20335) (not d!123053) b_and!32591 (not b!1025250) tp_is_empty!24055 (not b!1025252))
(check-sat b_and!32591 (not b_next!20335))
(get-model)

(declare-fun b!1025269 () Bool)

(declare-fun e!577947 () (_ BitVec 32))

(declare-fun call!43294 () (_ BitVec 32))

(assert (=> b!1025269 (= e!577947 call!43294)))

(declare-fun d!123057 () Bool)

(declare-fun lt!451055 () (_ BitVec 32))

(assert (=> d!123057 (and (bvsge lt!451055 #b00000000000000000000000000000000) (bvsle lt!451055 (bvsub (size!31419 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!577946 () (_ BitVec 32))

(assert (=> d!123057 (= lt!451055 e!577946)))

(declare-fun c!103962 () Bool)

(assert (=> d!123057 (= c!103962 (bvsge #b00000000000000000000000000000000 (size!31419 (_keys!11156 thiss!1427))))))

(assert (=> d!123057 (and (bvsle #b00000000000000000000000000000000 (size!31419 (_keys!11156 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31419 (_keys!11156 thiss!1427)) (size!31419 (_keys!11156 thiss!1427))))))

(assert (=> d!123057 (= (arrayCountValidKeys!0 (_keys!11156 thiss!1427) #b00000000000000000000000000000000 (size!31419 (_keys!11156 thiss!1427))) lt!451055)))

(declare-fun bm!43291 () Bool)

(assert (=> bm!43291 (= call!43294 (arrayCountValidKeys!0 (_keys!11156 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31419 (_keys!11156 thiss!1427))))))

(declare-fun b!1025270 () Bool)

(assert (=> b!1025270 (= e!577946 #b00000000000000000000000000000000)))

(declare-fun b!1025271 () Bool)

(assert (=> b!1025271 (= e!577946 e!577947)))

(declare-fun c!103961 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025271 (= c!103961 (validKeyInArray!0 (select (arr!30907 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1025272 () Bool)

(assert (=> b!1025272 (= e!577947 (bvadd #b00000000000000000000000000000001 call!43294))))

(assert (= (and d!123057 c!103962) b!1025270))

(assert (= (and d!123057 (not c!103962)) b!1025271))

(assert (= (and b!1025271 c!103961) b!1025272))

(assert (= (and b!1025271 (not c!103961)) b!1025269))

(assert (= (or b!1025272 b!1025269) bm!43291))

(declare-fun m!944177 () Bool)

(assert (=> bm!43291 m!944177))

(declare-fun m!944179 () Bool)

(assert (=> b!1025271 m!944179))

(assert (=> b!1025271 m!944179))

(declare-fun m!944181 () Bool)

(assert (=> b!1025271 m!944181))

(assert (=> b!1025250 d!123057))

(declare-fun d!123059 () Bool)

(declare-fun res!686152 () Bool)

(declare-fun e!577954 () Bool)

(assert (=> d!123059 (=> res!686152 e!577954)))

(assert (=> d!123059 (= res!686152 (bvsge #b00000000000000000000000000000000 (size!31419 (_keys!11156 thiss!1427))))))

(assert (=> d!123059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11156 thiss!1427) (mask!29668 thiss!1427)) e!577954)))

(declare-fun bm!43294 () Bool)

(declare-fun call!43297 () Bool)

(assert (=> bm!43294 (= call!43297 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11156 thiss!1427) (mask!29668 thiss!1427)))))

(declare-fun b!1025281 () Bool)

(declare-fun e!577955 () Bool)

(declare-fun e!577956 () Bool)

(assert (=> b!1025281 (= e!577955 e!577956)))

(declare-fun lt!451064 () (_ BitVec 64))

(assert (=> b!1025281 (= lt!451064 (select (arr!30907 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33346 0))(
  ( (Unit!33347) )
))
(declare-fun lt!451063 () Unit!33346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64203 (_ BitVec 64) (_ BitVec 32)) Unit!33346)

(assert (=> b!1025281 (= lt!451063 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11156 thiss!1427) lt!451064 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1025281 (arrayContainsKey!0 (_keys!11156 thiss!1427) lt!451064 #b00000000000000000000000000000000)))

(declare-fun lt!451062 () Unit!33346)

(assert (=> b!1025281 (= lt!451062 lt!451063)))

(declare-fun res!686153 () Bool)

(declare-datatypes ((SeekEntryResult!9542 0))(
  ( (MissingZero!9542 (index!40539 (_ BitVec 32))) (Found!9542 (index!40540 (_ BitVec 32))) (Intermediate!9542 (undefined!10354 Bool) (index!40541 (_ BitVec 32)) (x!90988 (_ BitVec 32))) (Undefined!9542) (MissingVacant!9542 (index!40542 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64203 (_ BitVec 32)) SeekEntryResult!9542)

(assert (=> b!1025281 (= res!686153 (= (seekEntryOrOpen!0 (select (arr!30907 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000) (_keys!11156 thiss!1427) (mask!29668 thiss!1427)) (Found!9542 #b00000000000000000000000000000000)))))

(assert (=> b!1025281 (=> (not res!686153) (not e!577956))))

(declare-fun b!1025282 () Bool)

(assert (=> b!1025282 (= e!577954 e!577955)))

(declare-fun c!103965 () Bool)

(assert (=> b!1025282 (= c!103965 (validKeyInArray!0 (select (arr!30907 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1025283 () Bool)

(assert (=> b!1025283 (= e!577956 call!43297)))

(declare-fun b!1025284 () Bool)

(assert (=> b!1025284 (= e!577955 call!43297)))

(assert (= (and d!123059 (not res!686152)) b!1025282))

(assert (= (and b!1025282 c!103965) b!1025281))

(assert (= (and b!1025282 (not c!103965)) b!1025284))

(assert (= (and b!1025281 res!686153) b!1025283))

(assert (= (or b!1025283 b!1025284) bm!43294))

(declare-fun m!944183 () Bool)

(assert (=> bm!43294 m!944183))

(assert (=> b!1025281 m!944179))

(declare-fun m!944185 () Bool)

(assert (=> b!1025281 m!944185))

(declare-fun m!944187 () Bool)

(assert (=> b!1025281 m!944187))

(assert (=> b!1025281 m!944179))

(declare-fun m!944189 () Bool)

(assert (=> b!1025281 m!944189))

(assert (=> b!1025282 m!944179))

(assert (=> b!1025282 m!944179))

(assert (=> b!1025282 m!944181))

(assert (=> b!1025251 d!123059))

(declare-fun b!1025295 () Bool)

(declare-fun res!686164 () Bool)

(declare-fun e!577959 () Bool)

(assert (=> b!1025295 (=> (not res!686164) (not e!577959))))

(declare-fun size!31425 (LongMapFixedSize!5242) (_ BitVec 32))

(assert (=> b!1025295 (= res!686164 (= (size!31425 thiss!1427) (bvadd (_size!2676 thiss!1427) (bvsdiv (bvadd (extraKeys!5705 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1025296 () Bool)

(assert (=> b!1025296 (= e!577959 (and (bvsge (extraKeys!5705 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5705 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2676 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!123061 () Bool)

(declare-fun res!686162 () Bool)

(assert (=> d!123061 (=> (not res!686162) (not e!577959))))

(assert (=> d!123061 (= res!686162 (validMask!0 (mask!29668 thiss!1427)))))

(assert (=> d!123061 (= (simpleValid!387 thiss!1427) e!577959)))

(declare-fun b!1025293 () Bool)

(declare-fun res!686165 () Bool)

(assert (=> b!1025293 (=> (not res!686165) (not e!577959))))

(assert (=> b!1025293 (= res!686165 (and (= (size!31420 (_values!5996 thiss!1427)) (bvadd (mask!29668 thiss!1427) #b00000000000000000000000000000001)) (= (size!31419 (_keys!11156 thiss!1427)) (size!31420 (_values!5996 thiss!1427))) (bvsge (_size!2676 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2676 thiss!1427) (bvadd (mask!29668 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1025294 () Bool)

(declare-fun res!686163 () Bool)

(assert (=> b!1025294 (=> (not res!686163) (not e!577959))))

(assert (=> b!1025294 (= res!686163 (bvsge (size!31425 thiss!1427) (_size!2676 thiss!1427)))))

(assert (= (and d!123061 res!686162) b!1025293))

(assert (= (and b!1025293 res!686165) b!1025294))

(assert (= (and b!1025294 res!686163) b!1025295))

(assert (= (and b!1025295 res!686164) b!1025296))

(declare-fun m!944191 () Bool)

(assert (=> b!1025295 m!944191))

(assert (=> d!123061 m!944145))

(assert (=> b!1025294 m!944191))

(assert (=> d!123053 d!123061))

(declare-fun b!1025308 () Bool)

(declare-fun e!577970 () Bool)

(declare-fun call!43300 () Bool)

(assert (=> b!1025308 (= e!577970 call!43300)))

(declare-fun b!1025309 () Bool)

(assert (=> b!1025309 (= e!577970 call!43300)))

(declare-fun b!1025310 () Bool)

(declare-fun e!577968 () Bool)

(assert (=> b!1025310 (= e!577968 e!577970)))

(declare-fun c!103968 () Bool)

(assert (=> b!1025310 (= c!103968 (validKeyInArray!0 (select (arr!30907 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1025311 () Bool)

(declare-fun e!577971 () Bool)

(declare-fun contains!5964 (List!21709 (_ BitVec 64)) Bool)

(assert (=> b!1025311 (= e!577971 (contains!5964 Nil!21706 (select (arr!30907 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43297 () Bool)

(assert (=> bm!43297 (= call!43300 (arrayNoDuplicates!0 (_keys!11156 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103968 (Cons!21705 (select (arr!30907 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000) Nil!21706) Nil!21706)))))

(declare-fun b!1025307 () Bool)

(declare-fun e!577969 () Bool)

(assert (=> b!1025307 (= e!577969 e!577968)))

(declare-fun res!686173 () Bool)

(assert (=> b!1025307 (=> (not res!686173) (not e!577968))))

(assert (=> b!1025307 (= res!686173 (not e!577971))))

(declare-fun res!686174 () Bool)

(assert (=> b!1025307 (=> (not res!686174) (not e!577971))))

(assert (=> b!1025307 (= res!686174 (validKeyInArray!0 (select (arr!30907 (_keys!11156 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123063 () Bool)

(declare-fun res!686172 () Bool)

(assert (=> d!123063 (=> res!686172 e!577969)))

(assert (=> d!123063 (= res!686172 (bvsge #b00000000000000000000000000000000 (size!31419 (_keys!11156 thiss!1427))))))

(assert (=> d!123063 (= (arrayNoDuplicates!0 (_keys!11156 thiss!1427) #b00000000000000000000000000000000 Nil!21706) e!577969)))

(assert (= (and d!123063 (not res!686172)) b!1025307))

(assert (= (and b!1025307 res!686174) b!1025311))

(assert (= (and b!1025307 res!686173) b!1025310))

(assert (= (and b!1025310 c!103968) b!1025309))

(assert (= (and b!1025310 (not c!103968)) b!1025308))

(assert (= (or b!1025309 b!1025308) bm!43297))

(assert (=> b!1025310 m!944179))

(assert (=> b!1025310 m!944179))

(assert (=> b!1025310 m!944181))

(assert (=> b!1025311 m!944179))

(assert (=> b!1025311 m!944179))

(declare-fun m!944193 () Bool)

(assert (=> b!1025311 m!944193))

(assert (=> bm!43297 m!944179))

(declare-fun m!944195 () Bool)

(assert (=> bm!43297 m!944195))

(assert (=> b!1025307 m!944179))

(assert (=> b!1025307 m!944179))

(assert (=> b!1025307 m!944181))

(assert (=> b!1025252 d!123063))

(declare-fun b!1025313 () Bool)

(declare-fun e!577972 () Bool)

(assert (=> b!1025313 (= e!577972 tp_is_empty!24055)))

(declare-fun condMapEmpty!37510 () Bool)

(declare-fun mapDefault!37510 () ValueCell!11324)

(assert (=> mapNonEmpty!37509 (= condMapEmpty!37510 (= mapRest!37509 ((as const (Array (_ BitVec 32) ValueCell!11324)) mapDefault!37510)))))

(declare-fun mapRes!37510 () Bool)

(assert (=> mapNonEmpty!37509 (= tp!72055 (and e!577972 mapRes!37510))))

(declare-fun b!1025312 () Bool)

(declare-fun e!577973 () Bool)

(assert (=> b!1025312 (= e!577973 tp_is_empty!24055)))

(declare-fun mapNonEmpty!37510 () Bool)

(declare-fun tp!72056 () Bool)

(assert (=> mapNonEmpty!37510 (= mapRes!37510 (and tp!72056 e!577973))))

(declare-fun mapKey!37510 () (_ BitVec 32))

(declare-fun mapValue!37510 () ValueCell!11324)

(declare-fun mapRest!37510 () (Array (_ BitVec 32) ValueCell!11324))

(assert (=> mapNonEmpty!37510 (= mapRest!37509 (store mapRest!37510 mapKey!37510 mapValue!37510))))

(declare-fun mapIsEmpty!37510 () Bool)

(assert (=> mapIsEmpty!37510 mapRes!37510))

(assert (= (and mapNonEmpty!37509 condMapEmpty!37510) mapIsEmpty!37510))

(assert (= (and mapNonEmpty!37509 (not condMapEmpty!37510)) mapNonEmpty!37510))

(assert (= (and mapNonEmpty!37510 ((_ is ValueCellFull!11324) mapValue!37510)) b!1025312))

(assert (= (and mapNonEmpty!37509 ((_ is ValueCellFull!11324) mapDefault!37510)) b!1025313))

(declare-fun m!944197 () Bool)

(assert (=> mapNonEmpty!37510 m!944197))

(check-sat (not b!1025295) (not bm!43291) (not b!1025271) tp_is_empty!24055 (not b!1025311) (not b!1025307) (not mapNonEmpty!37510) (not b!1025281) (not b!1025282) (not b_next!20335) (not bm!43297) b_and!32591 (not bm!43294) (not b!1025310) (not b!1025294) (not d!123061))
(check-sat b_and!32591 (not b_next!20335))
