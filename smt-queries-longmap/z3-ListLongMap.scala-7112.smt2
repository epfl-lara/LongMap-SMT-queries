; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90116 () Bool)

(assert start!90116)

(declare-fun b!1032208 () Bool)

(declare-fun b_free!20725 () Bool)

(declare-fun b_next!20725 () Bool)

(assert (=> b!1032208 (= b_free!20725 (not b_next!20725))))

(declare-fun tp!73246 () Bool)

(declare-fun b_and!33167 () Bool)

(assert (=> b!1032208 (= tp!73246 b_and!33167)))

(declare-fun b!1032203 () Bool)

(declare-fun e!583219 () Bool)

(declare-fun e!583218 () Bool)

(declare-fun mapRes!38121 () Bool)

(assert (=> b!1032203 (= e!583219 (and e!583218 mapRes!38121))))

(declare-fun condMapEmpty!38121 () Bool)

(declare-datatypes ((V!37467 0))(
  ( (V!37468 (val!12273 Int)) )
))
(declare-datatypes ((ValueCell!11519 0))(
  ( (ValueCellFull!11519 (v!14849 V!37467)) (EmptyCell!11519) )
))
(declare-datatypes ((array!64893 0))(
  ( (array!64894 (arr!31248 (Array (_ BitVec 32) (_ BitVec 64))) (size!31767 (_ BitVec 32))) )
))
(declare-datatypes ((array!64895 0))(
  ( (array!64896 (arr!31249 (Array (_ BitVec 32) ValueCell!11519)) (size!31768 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5632 0))(
  ( (LongMapFixedSize!5633 (defaultEntry!6190 Int) (mask!30003 (_ BitVec 32)) (extraKeys!5922 (_ BitVec 32)) (zeroValue!6026 V!37467) (minValue!6026 V!37467) (_size!2871 (_ BitVec 32)) (_keys!11359 array!64893) (_values!6213 array!64895) (_vacant!2871 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5632)

(declare-fun mapDefault!38121 () ValueCell!11519)

(assert (=> b!1032203 (= condMapEmpty!38121 (= (arr!31249 (_values!6213 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11519)) mapDefault!38121)))))

(declare-fun b!1032204 () Bool)

(declare-fun e!583216 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032204 (= e!583216 (not (validMask!0 (mask!30003 thiss!1427))))))

(declare-fun mapNonEmpty!38121 () Bool)

(declare-fun tp!73245 () Bool)

(declare-fun e!583215 () Bool)

(assert (=> mapNonEmpty!38121 (= mapRes!38121 (and tp!73245 e!583215))))

(declare-fun mapKey!38121 () (_ BitVec 32))

(declare-fun mapValue!38121 () ValueCell!11519)

(declare-fun mapRest!38121 () (Array (_ BitVec 32) ValueCell!11519))

(assert (=> mapNonEmpty!38121 (= (arr!31249 (_values!6213 thiss!1427)) (store mapRest!38121 mapKey!38121 mapValue!38121))))

(declare-fun b!1032205 () Bool)

(declare-fun tp_is_empty!24445 () Bool)

(assert (=> b!1032205 (= e!583215 tp_is_empty!24445)))

(declare-fun b!1032206 () Bool)

(assert (=> b!1032206 (= e!583218 tp_is_empty!24445)))

(declare-fun b!1032207 () Bool)

(declare-fun res!689938 () Bool)

(assert (=> b!1032207 (=> (not res!689938) (not e!583216))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032207 (= res!689938 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!583217 () Bool)

(declare-fun array_inv!24181 (array!64893) Bool)

(declare-fun array_inv!24182 (array!64895) Bool)

(assert (=> b!1032208 (= e!583217 (and tp!73246 tp_is_empty!24445 (array_inv!24181 (_keys!11359 thiss!1427)) (array_inv!24182 (_values!6213 thiss!1427)) e!583219))))

(declare-fun res!689937 () Bool)

(assert (=> start!90116 (=> (not res!689937) (not e!583216))))

(declare-fun valid!2121 (LongMapFixedSize!5632) Bool)

(assert (=> start!90116 (= res!689937 (valid!2121 thiss!1427))))

(assert (=> start!90116 e!583216))

(assert (=> start!90116 e!583217))

(assert (=> start!90116 true))

(declare-fun mapIsEmpty!38121 () Bool)

(assert (=> mapIsEmpty!38121 mapRes!38121))

(assert (= (and start!90116 res!689937) b!1032207))

(assert (= (and b!1032207 res!689938) b!1032204))

(assert (= (and b!1032203 condMapEmpty!38121) mapIsEmpty!38121))

(assert (= (and b!1032203 (not condMapEmpty!38121)) mapNonEmpty!38121))

(get-info :version)

(assert (= (and mapNonEmpty!38121 ((_ is ValueCellFull!11519) mapValue!38121)) b!1032205))

(assert (= (and b!1032203 ((_ is ValueCellFull!11519) mapDefault!38121)) b!1032206))

(assert (= b!1032208 b!1032203))

(assert (= start!90116 b!1032208))

(declare-fun m!952057 () Bool)

(assert (=> b!1032204 m!952057))

(declare-fun m!952059 () Bool)

(assert (=> mapNonEmpty!38121 m!952059))

(declare-fun m!952061 () Bool)

(assert (=> b!1032208 m!952061))

(declare-fun m!952063 () Bool)

(assert (=> b!1032208 m!952063))

(declare-fun m!952065 () Bool)

(assert (=> start!90116 m!952065))

(check-sat (not b_next!20725) b_and!33167 tp_is_empty!24445 (not b!1032204) (not start!90116) (not mapNonEmpty!38121) (not b!1032208))
(check-sat b_and!33167 (not b_next!20725))
(get-model)

(declare-fun d!123521 () Bool)

(declare-fun res!689957 () Bool)

(declare-fun e!583259 () Bool)

(assert (=> d!123521 (=> (not res!689957) (not e!583259))))

(declare-fun simpleValid!397 (LongMapFixedSize!5632) Bool)

(assert (=> d!123521 (= res!689957 (simpleValid!397 thiss!1427))))

(assert (=> d!123521 (= (valid!2121 thiss!1427) e!583259)))

(declare-fun b!1032251 () Bool)

(declare-fun res!689958 () Bool)

(assert (=> b!1032251 (=> (not res!689958) (not e!583259))))

(declare-fun arrayCountValidKeys!0 (array!64893 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032251 (= res!689958 (= (arrayCountValidKeys!0 (_keys!11359 thiss!1427) #b00000000000000000000000000000000 (size!31767 (_keys!11359 thiss!1427))) (_size!2871 thiss!1427)))))

(declare-fun b!1032252 () Bool)

(declare-fun res!689959 () Bool)

(assert (=> b!1032252 (=> (not res!689959) (not e!583259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64893 (_ BitVec 32)) Bool)

(assert (=> b!1032252 (= res!689959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11359 thiss!1427) (mask!30003 thiss!1427)))))

(declare-fun b!1032253 () Bool)

(declare-datatypes ((List!21931 0))(
  ( (Nil!21928) (Cons!21927 (h!23129 (_ BitVec 64)) (t!31116 List!21931)) )
))
(declare-fun arrayNoDuplicates!0 (array!64893 (_ BitVec 32) List!21931) Bool)

(assert (=> b!1032253 (= e!583259 (arrayNoDuplicates!0 (_keys!11359 thiss!1427) #b00000000000000000000000000000000 Nil!21928))))

(assert (= (and d!123521 res!689957) b!1032251))

(assert (= (and b!1032251 res!689958) b!1032252))

(assert (= (and b!1032252 res!689959) b!1032253))

(declare-fun m!952087 () Bool)

(assert (=> d!123521 m!952087))

(declare-fun m!952089 () Bool)

(assert (=> b!1032251 m!952089))

(declare-fun m!952091 () Bool)

(assert (=> b!1032252 m!952091))

(declare-fun m!952093 () Bool)

(assert (=> b!1032253 m!952093))

(assert (=> start!90116 d!123521))

(declare-fun d!123523 () Bool)

(assert (=> d!123523 (= (array_inv!24181 (_keys!11359 thiss!1427)) (bvsge (size!31767 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032208 d!123523))

(declare-fun d!123525 () Bool)

(assert (=> d!123525 (= (array_inv!24182 (_values!6213 thiss!1427)) (bvsge (size!31768 (_values!6213 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032208 d!123525))

(declare-fun d!123527 () Bool)

(assert (=> d!123527 (= (validMask!0 (mask!30003 thiss!1427)) (and (or (= (mask!30003 thiss!1427) #b00000000000000000000000000000111) (= (mask!30003 thiss!1427) #b00000000000000000000000000001111) (= (mask!30003 thiss!1427) #b00000000000000000000000000011111) (= (mask!30003 thiss!1427) #b00000000000000000000000000111111) (= (mask!30003 thiss!1427) #b00000000000000000000000001111111) (= (mask!30003 thiss!1427) #b00000000000000000000000011111111) (= (mask!30003 thiss!1427) #b00000000000000000000000111111111) (= (mask!30003 thiss!1427) #b00000000000000000000001111111111) (= (mask!30003 thiss!1427) #b00000000000000000000011111111111) (= (mask!30003 thiss!1427) #b00000000000000000000111111111111) (= (mask!30003 thiss!1427) #b00000000000000000001111111111111) (= (mask!30003 thiss!1427) #b00000000000000000011111111111111) (= (mask!30003 thiss!1427) #b00000000000000000111111111111111) (= (mask!30003 thiss!1427) #b00000000000000001111111111111111) (= (mask!30003 thiss!1427) #b00000000000000011111111111111111) (= (mask!30003 thiss!1427) #b00000000000000111111111111111111) (= (mask!30003 thiss!1427) #b00000000000001111111111111111111) (= (mask!30003 thiss!1427) #b00000000000011111111111111111111) (= (mask!30003 thiss!1427) #b00000000000111111111111111111111) (= (mask!30003 thiss!1427) #b00000000001111111111111111111111) (= (mask!30003 thiss!1427) #b00000000011111111111111111111111) (= (mask!30003 thiss!1427) #b00000000111111111111111111111111) (= (mask!30003 thiss!1427) #b00000001111111111111111111111111) (= (mask!30003 thiss!1427) #b00000011111111111111111111111111) (= (mask!30003 thiss!1427) #b00000111111111111111111111111111) (= (mask!30003 thiss!1427) #b00001111111111111111111111111111) (= (mask!30003 thiss!1427) #b00011111111111111111111111111111) (= (mask!30003 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30003 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032204 d!123527))

(declare-fun mapIsEmpty!38130 () Bool)

(declare-fun mapRes!38130 () Bool)

(assert (=> mapIsEmpty!38130 mapRes!38130))

(declare-fun b!1032260 () Bool)

(declare-fun e!583265 () Bool)

(assert (=> b!1032260 (= e!583265 tp_is_empty!24445)))

(declare-fun condMapEmpty!38130 () Bool)

(declare-fun mapDefault!38130 () ValueCell!11519)

(assert (=> mapNonEmpty!38121 (= condMapEmpty!38130 (= mapRest!38121 ((as const (Array (_ BitVec 32) ValueCell!11519)) mapDefault!38130)))))

(declare-fun e!583264 () Bool)

(assert (=> mapNonEmpty!38121 (= tp!73245 (and e!583264 mapRes!38130))))

(declare-fun b!1032261 () Bool)

(assert (=> b!1032261 (= e!583264 tp_is_empty!24445)))

(declare-fun mapNonEmpty!38130 () Bool)

(declare-fun tp!73261 () Bool)

(assert (=> mapNonEmpty!38130 (= mapRes!38130 (and tp!73261 e!583265))))

(declare-fun mapValue!38130 () ValueCell!11519)

(declare-fun mapKey!38130 () (_ BitVec 32))

(declare-fun mapRest!38130 () (Array (_ BitVec 32) ValueCell!11519))

(assert (=> mapNonEmpty!38130 (= mapRest!38121 (store mapRest!38130 mapKey!38130 mapValue!38130))))

(assert (= (and mapNonEmpty!38121 condMapEmpty!38130) mapIsEmpty!38130))

(assert (= (and mapNonEmpty!38121 (not condMapEmpty!38130)) mapNonEmpty!38130))

(assert (= (and mapNonEmpty!38130 ((_ is ValueCellFull!11519) mapValue!38130)) b!1032260))

(assert (= (and mapNonEmpty!38121 ((_ is ValueCellFull!11519) mapDefault!38130)) b!1032261))

(declare-fun m!952095 () Bool)

(assert (=> mapNonEmpty!38130 m!952095))

(check-sat (not b!1032251) b_and!33167 (not d!123521) tp_is_empty!24445 (not b!1032253) (not b_next!20725) (not b!1032252) (not mapNonEmpty!38130))
(check-sat b_and!33167 (not b_next!20725))
(get-model)

(declare-fun b!1032272 () Bool)

(declare-fun e!583275 () Bool)

(declare-fun call!43570 () Bool)

(assert (=> b!1032272 (= e!583275 call!43570)))

(declare-fun b!1032273 () Bool)

(declare-fun e!583274 () Bool)

(declare-fun contains!5986 (List!21931 (_ BitVec 64)) Bool)

(assert (=> b!1032273 (= e!583274 (contains!5986 Nil!21928 (select (arr!31248 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032274 () Bool)

(declare-fun e!583276 () Bool)

(declare-fun e!583277 () Bool)

(assert (=> b!1032274 (= e!583276 e!583277)))

(declare-fun res!689968 () Bool)

(assert (=> b!1032274 (=> (not res!689968) (not e!583277))))

(assert (=> b!1032274 (= res!689968 (not e!583274))))

(declare-fun res!689967 () Bool)

(assert (=> b!1032274 (=> (not res!689967) (not e!583274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032274 (= res!689967 (validKeyInArray!0 (select (arr!31248 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032275 () Bool)

(assert (=> b!1032275 (= e!583275 call!43570)))

(declare-fun bm!43567 () Bool)

(declare-fun c!104265 () Bool)

(assert (=> bm!43567 (= call!43570 (arrayNoDuplicates!0 (_keys!11359 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104265 (Cons!21927 (select (arr!31248 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000) Nil!21928) Nil!21928)))))

(declare-fun d!123529 () Bool)

(declare-fun res!689966 () Bool)

(assert (=> d!123529 (=> res!689966 e!583276)))

(assert (=> d!123529 (= res!689966 (bvsge #b00000000000000000000000000000000 (size!31767 (_keys!11359 thiss!1427))))))

(assert (=> d!123529 (= (arrayNoDuplicates!0 (_keys!11359 thiss!1427) #b00000000000000000000000000000000 Nil!21928) e!583276)))

(declare-fun b!1032276 () Bool)

(assert (=> b!1032276 (= e!583277 e!583275)))

(assert (=> b!1032276 (= c!104265 (validKeyInArray!0 (select (arr!31248 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123529 (not res!689966)) b!1032274))

(assert (= (and b!1032274 res!689967) b!1032273))

(assert (= (and b!1032274 res!689968) b!1032276))

(assert (= (and b!1032276 c!104265) b!1032275))

(assert (= (and b!1032276 (not c!104265)) b!1032272))

(assert (= (or b!1032275 b!1032272) bm!43567))

(declare-fun m!952097 () Bool)

(assert (=> b!1032273 m!952097))

(assert (=> b!1032273 m!952097))

(declare-fun m!952099 () Bool)

(assert (=> b!1032273 m!952099))

(assert (=> b!1032274 m!952097))

(assert (=> b!1032274 m!952097))

(declare-fun m!952101 () Bool)

(assert (=> b!1032274 m!952101))

(assert (=> bm!43567 m!952097))

(declare-fun m!952103 () Bool)

(assert (=> bm!43567 m!952103))

(assert (=> b!1032276 m!952097))

(assert (=> b!1032276 m!952097))

(assert (=> b!1032276 m!952101))

(assert (=> b!1032253 d!123529))

(declare-fun bm!43570 () Bool)

(declare-fun call!43573 () Bool)

(assert (=> bm!43570 (= call!43573 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11359 thiss!1427) (mask!30003 thiss!1427)))))

(declare-fun b!1032285 () Bool)

(declare-fun e!583285 () Bool)

(declare-fun e!583284 () Bool)

(assert (=> b!1032285 (= e!583285 e!583284)))

(declare-fun c!104268 () Bool)

(assert (=> b!1032285 (= c!104268 (validKeyInArray!0 (select (arr!31248 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123531 () Bool)

(declare-fun res!689974 () Bool)

(assert (=> d!123531 (=> res!689974 e!583285)))

(assert (=> d!123531 (= res!689974 (bvsge #b00000000000000000000000000000000 (size!31767 (_keys!11359 thiss!1427))))))

(assert (=> d!123531 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11359 thiss!1427) (mask!30003 thiss!1427)) e!583285)))

(declare-fun b!1032286 () Bool)

(declare-fun e!583286 () Bool)

(assert (=> b!1032286 (= e!583284 e!583286)))

(declare-fun lt!455837 () (_ BitVec 64))

(assert (=> b!1032286 (= lt!455837 (select (arr!31248 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33699 0))(
  ( (Unit!33700) )
))
(declare-fun lt!455836 () Unit!33699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64893 (_ BitVec 64) (_ BitVec 32)) Unit!33699)

(assert (=> b!1032286 (= lt!455836 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11359 thiss!1427) lt!455837 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032286 (arrayContainsKey!0 (_keys!11359 thiss!1427) lt!455837 #b00000000000000000000000000000000)))

(declare-fun lt!455838 () Unit!33699)

(assert (=> b!1032286 (= lt!455838 lt!455836)))

(declare-fun res!689973 () Bool)

(declare-datatypes ((SeekEntryResult!9722 0))(
  ( (MissingZero!9722 (index!41259 (_ BitVec 32))) (Found!9722 (index!41260 (_ BitVec 32))) (Intermediate!9722 (undefined!10534 Bool) (index!41261 (_ BitVec 32)) (x!91997 (_ BitVec 32))) (Undefined!9722) (MissingVacant!9722 (index!41262 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64893 (_ BitVec 32)) SeekEntryResult!9722)

(assert (=> b!1032286 (= res!689973 (= (seekEntryOrOpen!0 (select (arr!31248 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000) (_keys!11359 thiss!1427) (mask!30003 thiss!1427)) (Found!9722 #b00000000000000000000000000000000)))))

(assert (=> b!1032286 (=> (not res!689973) (not e!583286))))

(declare-fun b!1032287 () Bool)

(assert (=> b!1032287 (= e!583284 call!43573)))

(declare-fun b!1032288 () Bool)

(assert (=> b!1032288 (= e!583286 call!43573)))

(assert (= (and d!123531 (not res!689974)) b!1032285))

(assert (= (and b!1032285 c!104268) b!1032286))

(assert (= (and b!1032285 (not c!104268)) b!1032287))

(assert (= (and b!1032286 res!689973) b!1032288))

(assert (= (or b!1032288 b!1032287) bm!43570))

(declare-fun m!952105 () Bool)

(assert (=> bm!43570 m!952105))

(assert (=> b!1032285 m!952097))

(assert (=> b!1032285 m!952097))

(assert (=> b!1032285 m!952101))

(assert (=> b!1032286 m!952097))

(declare-fun m!952107 () Bool)

(assert (=> b!1032286 m!952107))

(declare-fun m!952109 () Bool)

(assert (=> b!1032286 m!952109))

(assert (=> b!1032286 m!952097))

(declare-fun m!952111 () Bool)

(assert (=> b!1032286 m!952111))

(assert (=> b!1032252 d!123531))

(declare-fun bm!43573 () Bool)

(declare-fun call!43576 () (_ BitVec 32))

(assert (=> bm!43573 (= call!43576 (arrayCountValidKeys!0 (_keys!11359 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31767 (_keys!11359 thiss!1427))))))

(declare-fun d!123533 () Bool)

(declare-fun lt!455841 () (_ BitVec 32))

(assert (=> d!123533 (and (bvsge lt!455841 #b00000000000000000000000000000000) (bvsle lt!455841 (bvsub (size!31767 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!583292 () (_ BitVec 32))

(assert (=> d!123533 (= lt!455841 e!583292)))

(declare-fun c!104274 () Bool)

(assert (=> d!123533 (= c!104274 (bvsge #b00000000000000000000000000000000 (size!31767 (_keys!11359 thiss!1427))))))

(assert (=> d!123533 (and (bvsle #b00000000000000000000000000000000 (size!31767 (_keys!11359 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31767 (_keys!11359 thiss!1427)) (size!31767 (_keys!11359 thiss!1427))))))

(assert (=> d!123533 (= (arrayCountValidKeys!0 (_keys!11359 thiss!1427) #b00000000000000000000000000000000 (size!31767 (_keys!11359 thiss!1427))) lt!455841)))

(declare-fun b!1032297 () Bool)

(assert (=> b!1032297 (= e!583292 #b00000000000000000000000000000000)))

(declare-fun b!1032298 () Bool)

(declare-fun e!583291 () (_ BitVec 32))

(assert (=> b!1032298 (= e!583291 call!43576)))

(declare-fun b!1032299 () Bool)

(assert (=> b!1032299 (= e!583292 e!583291)))

(declare-fun c!104273 () Bool)

(assert (=> b!1032299 (= c!104273 (validKeyInArray!0 (select (arr!31248 (_keys!11359 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032300 () Bool)

(assert (=> b!1032300 (= e!583291 (bvadd #b00000000000000000000000000000001 call!43576))))

(assert (= (and d!123533 c!104274) b!1032297))

(assert (= (and d!123533 (not c!104274)) b!1032299))

(assert (= (and b!1032299 c!104273) b!1032300))

(assert (= (and b!1032299 (not c!104273)) b!1032298))

(assert (= (or b!1032300 b!1032298) bm!43573))

(declare-fun m!952113 () Bool)

(assert (=> bm!43573 m!952113))

(assert (=> b!1032299 m!952097))

(assert (=> b!1032299 m!952097))

(assert (=> b!1032299 m!952101))

(assert (=> b!1032251 d!123533))

(declare-fun b!1032311 () Bool)

(declare-fun res!689985 () Bool)

(declare-fun e!583295 () Bool)

(assert (=> b!1032311 (=> (not res!689985) (not e!583295))))

(declare-fun size!31773 (LongMapFixedSize!5632) (_ BitVec 32))

(assert (=> b!1032311 (= res!689985 (= (size!31773 thiss!1427) (bvadd (_size!2871 thiss!1427) (bvsdiv (bvadd (extraKeys!5922 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1032309 () Bool)

(declare-fun res!689983 () Bool)

(assert (=> b!1032309 (=> (not res!689983) (not e!583295))))

(assert (=> b!1032309 (= res!689983 (and (= (size!31768 (_values!6213 thiss!1427)) (bvadd (mask!30003 thiss!1427) #b00000000000000000000000000000001)) (= (size!31767 (_keys!11359 thiss!1427)) (size!31768 (_values!6213 thiss!1427))) (bvsge (_size!2871 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2871 thiss!1427) (bvadd (mask!30003 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!123535 () Bool)

(declare-fun res!689984 () Bool)

(assert (=> d!123535 (=> (not res!689984) (not e!583295))))

(assert (=> d!123535 (= res!689984 (validMask!0 (mask!30003 thiss!1427)))))

(assert (=> d!123535 (= (simpleValid!397 thiss!1427) e!583295)))

(declare-fun b!1032312 () Bool)

(assert (=> b!1032312 (= e!583295 (and (bvsge (extraKeys!5922 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5922 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2871 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032310 () Bool)

(declare-fun res!689986 () Bool)

(assert (=> b!1032310 (=> (not res!689986) (not e!583295))))

(assert (=> b!1032310 (= res!689986 (bvsge (size!31773 thiss!1427) (_size!2871 thiss!1427)))))

(assert (= (and d!123535 res!689984) b!1032309))

(assert (= (and b!1032309 res!689983) b!1032310))

(assert (= (and b!1032310 res!689986) b!1032311))

(assert (= (and b!1032311 res!689985) b!1032312))

(declare-fun m!952115 () Bool)

(assert (=> b!1032311 m!952115))

(assert (=> d!123535 m!952057))

(assert (=> b!1032310 m!952115))

(assert (=> d!123521 d!123535))

(declare-fun mapIsEmpty!38131 () Bool)

(declare-fun mapRes!38131 () Bool)

(assert (=> mapIsEmpty!38131 mapRes!38131))

(declare-fun b!1032313 () Bool)

(declare-fun e!583297 () Bool)

(assert (=> b!1032313 (= e!583297 tp_is_empty!24445)))

(declare-fun condMapEmpty!38131 () Bool)

(declare-fun mapDefault!38131 () ValueCell!11519)

(assert (=> mapNonEmpty!38130 (= condMapEmpty!38131 (= mapRest!38130 ((as const (Array (_ BitVec 32) ValueCell!11519)) mapDefault!38131)))))

(declare-fun e!583296 () Bool)

(assert (=> mapNonEmpty!38130 (= tp!73261 (and e!583296 mapRes!38131))))

(declare-fun b!1032314 () Bool)

(assert (=> b!1032314 (= e!583296 tp_is_empty!24445)))

(declare-fun mapNonEmpty!38131 () Bool)

(declare-fun tp!73262 () Bool)

(assert (=> mapNonEmpty!38131 (= mapRes!38131 (and tp!73262 e!583297))))

(declare-fun mapKey!38131 () (_ BitVec 32))

(declare-fun mapValue!38131 () ValueCell!11519)

(declare-fun mapRest!38131 () (Array (_ BitVec 32) ValueCell!11519))

(assert (=> mapNonEmpty!38131 (= mapRest!38130 (store mapRest!38131 mapKey!38131 mapValue!38131))))

(assert (= (and mapNonEmpty!38130 condMapEmpty!38131) mapIsEmpty!38131))

(assert (= (and mapNonEmpty!38130 (not condMapEmpty!38131)) mapNonEmpty!38131))

(assert (= (and mapNonEmpty!38131 ((_ is ValueCellFull!11519) mapValue!38131)) b!1032313))

(assert (= (and mapNonEmpty!38130 ((_ is ValueCellFull!11519) mapDefault!38131)) b!1032314))

(declare-fun m!952117 () Bool)

(assert (=> mapNonEmpty!38131 m!952117))

(check-sat (not b!1032285) (not mapNonEmpty!38131) (not bm!43570) (not b!1032273) (not b_next!20725) b_and!33167 (not b!1032310) tp_is_empty!24445 (not d!123535) (not b!1032286) (not b!1032311) (not b!1032276) (not bm!43567) (not b!1032299) (not bm!43573) (not b!1032274))
(check-sat b_and!33167 (not b_next!20725))
