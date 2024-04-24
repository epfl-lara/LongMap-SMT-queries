; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90396 () Bool)

(assert start!90396)

(declare-fun b!1033932 () Bool)

(declare-fun b_free!20737 () Bool)

(declare-fun b_next!20737 () Bool)

(assert (=> b!1033932 (= b_free!20737 (not b_next!20737))))

(declare-fun tp!73290 () Bool)

(declare-fun b_and!33215 () Bool)

(assert (=> b!1033932 (= tp!73290 b_and!33215)))

(declare-fun b!1033928 () Bool)

(declare-fun res!690635 () Bool)

(declare-fun e!584340 () Bool)

(assert (=> b!1033928 (=> (not res!690635) (not e!584340))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033928 (= res!690635 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033929 () Bool)

(declare-fun res!690634 () Bool)

(assert (=> b!1033929 (=> (not res!690634) (not e!584340))))

(declare-datatypes ((V!37483 0))(
  ( (V!37484 (val!12279 Int)) )
))
(declare-datatypes ((ValueCell!11525 0))(
  ( (ValueCellFull!11525 (v!14852 V!37483)) (EmptyCell!11525) )
))
(declare-datatypes ((array!65031 0))(
  ( (array!65032 (arr!31309 (Array (_ BitVec 32) (_ BitVec 64))) (size!31829 (_ BitVec 32))) )
))
(declare-datatypes ((array!65033 0))(
  ( (array!65034 (arr!31310 (Array (_ BitVec 32) ValueCell!11525)) (size!31830 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5644 0))(
  ( (LongMapFixedSize!5645 (defaultEntry!6196 Int) (mask!30082 (_ BitVec 32)) (extraKeys!5928 (_ BitVec 32)) (zeroValue!6032 V!37483) (minValue!6032 V!37483) (_size!2877 (_ BitVec 32)) (_keys!11409 array!65031) (_values!6219 array!65033) (_vacant!2877 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5644)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033929 (= res!690634 (validMask!0 (mask!30082 thiss!1427)))))

(declare-fun b!1033930 () Bool)

(declare-fun e!584339 () Bool)

(declare-fun tp_is_empty!24457 () Bool)

(assert (=> b!1033930 (= e!584339 tp_is_empty!24457)))

(declare-fun b!1033931 () Bool)

(declare-fun e!584342 () Bool)

(assert (=> b!1033931 (= e!584342 tp_is_empty!24457)))

(declare-fun e!584343 () Bool)

(declare-fun e!584341 () Bool)

(declare-fun array_inv!24237 (array!65031) Bool)

(declare-fun array_inv!24238 (array!65033) Bool)

(assert (=> b!1033932 (= e!584341 (and tp!73290 tp_is_empty!24457 (array_inv!24237 (_keys!11409 thiss!1427)) (array_inv!24238 (_values!6219 thiss!1427)) e!584343))))

(declare-fun res!690633 () Bool)

(assert (=> start!90396 (=> (not res!690633) (not e!584340))))

(declare-fun valid!2141 (LongMapFixedSize!5644) Bool)

(assert (=> start!90396 (= res!690633 (valid!2141 thiss!1427))))

(assert (=> start!90396 e!584340))

(assert (=> start!90396 e!584341))

(assert (=> start!90396 true))

(declare-fun mapNonEmpty!38147 () Bool)

(declare-fun mapRes!38147 () Bool)

(declare-fun tp!73289 () Bool)

(assert (=> mapNonEmpty!38147 (= mapRes!38147 (and tp!73289 e!584339))))

(declare-fun mapRest!38147 () (Array (_ BitVec 32) ValueCell!11525))

(declare-fun mapKey!38147 () (_ BitVec 32))

(declare-fun mapValue!38147 () ValueCell!11525)

(assert (=> mapNonEmpty!38147 (= (arr!31310 (_values!6219 thiss!1427)) (store mapRest!38147 mapKey!38147 mapValue!38147))))

(declare-fun mapIsEmpty!38147 () Bool)

(assert (=> mapIsEmpty!38147 mapRes!38147))

(declare-fun b!1033933 () Bool)

(assert (=> b!1033933 (= e!584340 (and (= (size!31830 (_values!6219 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30082 thiss!1427))) (not (= (size!31829 (_keys!11409 thiss!1427)) (size!31830 (_values!6219 thiss!1427))))))))

(declare-fun b!1033934 () Bool)

(assert (=> b!1033934 (= e!584343 (and e!584342 mapRes!38147))))

(declare-fun condMapEmpty!38147 () Bool)

(declare-fun mapDefault!38147 () ValueCell!11525)

(assert (=> b!1033934 (= condMapEmpty!38147 (= (arr!31310 (_values!6219 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11525)) mapDefault!38147)))))

(assert (= (and start!90396 res!690633) b!1033928))

(assert (= (and b!1033928 res!690635) b!1033929))

(assert (= (and b!1033929 res!690634) b!1033933))

(assert (= (and b!1033934 condMapEmpty!38147) mapIsEmpty!38147))

(assert (= (and b!1033934 (not condMapEmpty!38147)) mapNonEmpty!38147))

(get-info :version)

(assert (= (and mapNonEmpty!38147 ((_ is ValueCellFull!11525) mapValue!38147)) b!1033930))

(assert (= (and b!1033934 ((_ is ValueCellFull!11525) mapDefault!38147)) b!1033931))

(assert (= b!1033932 b!1033934))

(assert (= start!90396 b!1033932))

(declare-fun m!954465 () Bool)

(assert (=> b!1033929 m!954465))

(declare-fun m!954467 () Bool)

(assert (=> b!1033932 m!954467))

(declare-fun m!954469 () Bool)

(assert (=> b!1033932 m!954469))

(declare-fun m!954471 () Bool)

(assert (=> start!90396 m!954471))

(declare-fun m!954473 () Bool)

(assert (=> mapNonEmpty!38147 m!954473))

(check-sat b_and!33215 (not mapNonEmpty!38147) (not b!1033929) (not b!1033932) (not start!90396) tp_is_empty!24457 (not b_next!20737))
(check-sat b_and!33215 (not b_next!20737))
(get-model)

(declare-fun d!124169 () Bool)

(assert (=> d!124169 (= (array_inv!24237 (_keys!11409 thiss!1427)) (bvsge (size!31829 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033932 d!124169))

(declare-fun d!124171 () Bool)

(assert (=> d!124171 (= (array_inv!24238 (_values!6219 thiss!1427)) (bvsge (size!31830 (_values!6219 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033932 d!124171))

(declare-fun d!124173 () Bool)

(declare-fun res!690660 () Bool)

(declare-fun e!584383 () Bool)

(assert (=> d!124173 (=> (not res!690660) (not e!584383))))

(declare-fun simpleValid!399 (LongMapFixedSize!5644) Bool)

(assert (=> d!124173 (= res!690660 (simpleValid!399 thiss!1427))))

(assert (=> d!124173 (= (valid!2141 thiss!1427) e!584383)))

(declare-fun b!1033983 () Bool)

(declare-fun res!690661 () Bool)

(assert (=> b!1033983 (=> (not res!690661) (not e!584383))))

(declare-fun arrayCountValidKeys!0 (array!65031 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033983 (= res!690661 (= (arrayCountValidKeys!0 (_keys!11409 thiss!1427) #b00000000000000000000000000000000 (size!31829 (_keys!11409 thiss!1427))) (_size!2877 thiss!1427)))))

(declare-fun b!1033984 () Bool)

(declare-fun res!690662 () Bool)

(assert (=> b!1033984 (=> (not res!690662) (not e!584383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65031 (_ BitVec 32)) Bool)

(assert (=> b!1033984 (= res!690662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11409 thiss!1427) (mask!30082 thiss!1427)))))

(declare-fun b!1033985 () Bool)

(declare-datatypes ((List!21884 0))(
  ( (Nil!21881) (Cons!21880 (h!23091 (_ BitVec 64)) (t!31070 List!21884)) )
))
(declare-fun arrayNoDuplicates!0 (array!65031 (_ BitVec 32) List!21884) Bool)

(assert (=> b!1033985 (= e!584383 (arrayNoDuplicates!0 (_keys!11409 thiss!1427) #b00000000000000000000000000000000 Nil!21881))))

(assert (= (and d!124173 res!690660) b!1033983))

(assert (= (and b!1033983 res!690661) b!1033984))

(assert (= (and b!1033984 res!690662) b!1033985))

(declare-fun m!954495 () Bool)

(assert (=> d!124173 m!954495))

(declare-fun m!954497 () Bool)

(assert (=> b!1033983 m!954497))

(declare-fun m!954499 () Bool)

(assert (=> b!1033984 m!954499))

(declare-fun m!954501 () Bool)

(assert (=> b!1033985 m!954501))

(assert (=> start!90396 d!124173))

(declare-fun d!124175 () Bool)

(assert (=> d!124175 (= (validMask!0 (mask!30082 thiss!1427)) (and (or (= (mask!30082 thiss!1427) #b00000000000000000000000000000111) (= (mask!30082 thiss!1427) #b00000000000000000000000000001111) (= (mask!30082 thiss!1427) #b00000000000000000000000000011111) (= (mask!30082 thiss!1427) #b00000000000000000000000000111111) (= (mask!30082 thiss!1427) #b00000000000000000000000001111111) (= (mask!30082 thiss!1427) #b00000000000000000000000011111111) (= (mask!30082 thiss!1427) #b00000000000000000000000111111111) (= (mask!30082 thiss!1427) #b00000000000000000000001111111111) (= (mask!30082 thiss!1427) #b00000000000000000000011111111111) (= (mask!30082 thiss!1427) #b00000000000000000000111111111111) (= (mask!30082 thiss!1427) #b00000000000000000001111111111111) (= (mask!30082 thiss!1427) #b00000000000000000011111111111111) (= (mask!30082 thiss!1427) #b00000000000000000111111111111111) (= (mask!30082 thiss!1427) #b00000000000000001111111111111111) (= (mask!30082 thiss!1427) #b00000000000000011111111111111111) (= (mask!30082 thiss!1427) #b00000000000000111111111111111111) (= (mask!30082 thiss!1427) #b00000000000001111111111111111111) (= (mask!30082 thiss!1427) #b00000000000011111111111111111111) (= (mask!30082 thiss!1427) #b00000000000111111111111111111111) (= (mask!30082 thiss!1427) #b00000000001111111111111111111111) (= (mask!30082 thiss!1427) #b00000000011111111111111111111111) (= (mask!30082 thiss!1427) #b00000000111111111111111111111111) (= (mask!30082 thiss!1427) #b00000001111111111111111111111111) (= (mask!30082 thiss!1427) #b00000011111111111111111111111111) (= (mask!30082 thiss!1427) #b00000111111111111111111111111111) (= (mask!30082 thiss!1427) #b00001111111111111111111111111111) (= (mask!30082 thiss!1427) #b00011111111111111111111111111111) (= (mask!30082 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30082 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1033929 d!124175))

(declare-fun b!1033992 () Bool)

(declare-fun e!584388 () Bool)

(assert (=> b!1033992 (= e!584388 tp_is_empty!24457)))

(declare-fun mapIsEmpty!38156 () Bool)

(declare-fun mapRes!38156 () Bool)

(assert (=> mapIsEmpty!38156 mapRes!38156))

(declare-fun condMapEmpty!38156 () Bool)

(declare-fun mapDefault!38156 () ValueCell!11525)

(assert (=> mapNonEmpty!38147 (= condMapEmpty!38156 (= mapRest!38147 ((as const (Array (_ BitVec 32) ValueCell!11525)) mapDefault!38156)))))

(declare-fun e!584389 () Bool)

(assert (=> mapNonEmpty!38147 (= tp!73289 (and e!584389 mapRes!38156))))

(declare-fun mapNonEmpty!38156 () Bool)

(declare-fun tp!73305 () Bool)

(assert (=> mapNonEmpty!38156 (= mapRes!38156 (and tp!73305 e!584388))))

(declare-fun mapKey!38156 () (_ BitVec 32))

(declare-fun mapValue!38156 () ValueCell!11525)

(declare-fun mapRest!38156 () (Array (_ BitVec 32) ValueCell!11525))

(assert (=> mapNonEmpty!38156 (= mapRest!38147 (store mapRest!38156 mapKey!38156 mapValue!38156))))

(declare-fun b!1033993 () Bool)

(assert (=> b!1033993 (= e!584389 tp_is_empty!24457)))

(assert (= (and mapNonEmpty!38147 condMapEmpty!38156) mapIsEmpty!38156))

(assert (= (and mapNonEmpty!38147 (not condMapEmpty!38156)) mapNonEmpty!38156))

(assert (= (and mapNonEmpty!38156 ((_ is ValueCellFull!11525) mapValue!38156)) b!1033992))

(assert (= (and mapNonEmpty!38147 ((_ is ValueCellFull!11525) mapDefault!38156)) b!1033993))

(declare-fun m!954503 () Bool)

(assert (=> mapNonEmpty!38156 m!954503))

(check-sat b_and!33215 (not mapNonEmpty!38156) (not b!1033984) tp_is_empty!24457 (not b!1033983) (not b!1033985) (not b_next!20737) (not d!124173))
(check-sat b_and!33215 (not b_next!20737))
(get-model)

(declare-fun b!1034002 () Bool)

(declare-fun e!584397 () Bool)

(declare-fun e!584398 () Bool)

(assert (=> b!1034002 (= e!584397 e!584398)))

(declare-fun lt!456575 () (_ BitVec 64))

(assert (=> b!1034002 (= lt!456575 (select (arr!31309 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33827 0))(
  ( (Unit!33828) )
))
(declare-fun lt!456576 () Unit!33827)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65031 (_ BitVec 64) (_ BitVec 32)) Unit!33827)

(assert (=> b!1034002 (= lt!456576 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11409 thiss!1427) lt!456575 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034002 (arrayContainsKey!0 (_keys!11409 thiss!1427) lt!456575 #b00000000000000000000000000000000)))

(declare-fun lt!456577 () Unit!33827)

(assert (=> b!1034002 (= lt!456577 lt!456576)))

(declare-fun res!690667 () Bool)

(declare-datatypes ((SeekEntryResult!9690 0))(
  ( (MissingZero!9690 (index!41131 (_ BitVec 32))) (Found!9690 (index!41132 (_ BitVec 32))) (Intermediate!9690 (undefined!10502 Bool) (index!41133 (_ BitVec 32)) (x!92034 (_ BitVec 32))) (Undefined!9690) (MissingVacant!9690 (index!41134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65031 (_ BitVec 32)) SeekEntryResult!9690)

(assert (=> b!1034002 (= res!690667 (= (seekEntryOrOpen!0 (select (arr!31309 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000) (_keys!11409 thiss!1427) (mask!30082 thiss!1427)) (Found!9690 #b00000000000000000000000000000000)))))

(assert (=> b!1034002 (=> (not res!690667) (not e!584398))))

(declare-fun b!1034003 () Bool)

(declare-fun call!43678 () Bool)

(assert (=> b!1034003 (= e!584397 call!43678)))

(declare-fun b!1034004 () Bool)

(assert (=> b!1034004 (= e!584398 call!43678)))

(declare-fun b!1034005 () Bool)

(declare-fun e!584396 () Bool)

(assert (=> b!1034005 (= e!584396 e!584397)))

(declare-fun c!104738 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034005 (= c!104738 (validKeyInArray!0 (select (arr!31309 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124177 () Bool)

(declare-fun res!690668 () Bool)

(assert (=> d!124177 (=> res!690668 e!584396)))

(assert (=> d!124177 (= res!690668 (bvsge #b00000000000000000000000000000000 (size!31829 (_keys!11409 thiss!1427))))))

(assert (=> d!124177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11409 thiss!1427) (mask!30082 thiss!1427)) e!584396)))

(declare-fun bm!43675 () Bool)

(assert (=> bm!43675 (= call!43678 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11409 thiss!1427) (mask!30082 thiss!1427)))))

(assert (= (and d!124177 (not res!690668)) b!1034005))

(assert (= (and b!1034005 c!104738) b!1034002))

(assert (= (and b!1034005 (not c!104738)) b!1034003))

(assert (= (and b!1034002 res!690667) b!1034004))

(assert (= (or b!1034004 b!1034003) bm!43675))

(declare-fun m!954505 () Bool)

(assert (=> b!1034002 m!954505))

(declare-fun m!954507 () Bool)

(assert (=> b!1034002 m!954507))

(declare-fun m!954509 () Bool)

(assert (=> b!1034002 m!954509))

(assert (=> b!1034002 m!954505))

(declare-fun m!954511 () Bool)

(assert (=> b!1034002 m!954511))

(assert (=> b!1034005 m!954505))

(assert (=> b!1034005 m!954505))

(declare-fun m!954513 () Bool)

(assert (=> b!1034005 m!954513))

(declare-fun m!954515 () Bool)

(assert (=> bm!43675 m!954515))

(assert (=> b!1033984 d!124177))

(declare-fun b!1034016 () Bool)

(declare-fun e!584407 () Bool)

(declare-fun contains!6033 (List!21884 (_ BitVec 64)) Bool)

(assert (=> b!1034016 (= e!584407 (contains!6033 Nil!21881 (select (arr!31309 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124179 () Bool)

(declare-fun res!690677 () Bool)

(declare-fun e!584408 () Bool)

(assert (=> d!124179 (=> res!690677 e!584408)))

(assert (=> d!124179 (= res!690677 (bvsge #b00000000000000000000000000000000 (size!31829 (_keys!11409 thiss!1427))))))

(assert (=> d!124179 (= (arrayNoDuplicates!0 (_keys!11409 thiss!1427) #b00000000000000000000000000000000 Nil!21881) e!584408)))

(declare-fun b!1034017 () Bool)

(declare-fun e!584409 () Bool)

(declare-fun e!584410 () Bool)

(assert (=> b!1034017 (= e!584409 e!584410)))

(declare-fun c!104741 () Bool)

(assert (=> b!1034017 (= c!104741 (validKeyInArray!0 (select (arr!31309 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43678 () Bool)

(declare-fun call!43681 () Bool)

(assert (=> bm!43678 (= call!43681 (arrayNoDuplicates!0 (_keys!11409 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104741 (Cons!21880 (select (arr!31309 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000) Nil!21881) Nil!21881)))))

(declare-fun b!1034018 () Bool)

(assert (=> b!1034018 (= e!584410 call!43681)))

(declare-fun b!1034019 () Bool)

(assert (=> b!1034019 (= e!584408 e!584409)))

(declare-fun res!690675 () Bool)

(assert (=> b!1034019 (=> (not res!690675) (not e!584409))))

(assert (=> b!1034019 (= res!690675 (not e!584407))))

(declare-fun res!690676 () Bool)

(assert (=> b!1034019 (=> (not res!690676) (not e!584407))))

(assert (=> b!1034019 (= res!690676 (validKeyInArray!0 (select (arr!31309 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034020 () Bool)

(assert (=> b!1034020 (= e!584410 call!43681)))

(assert (= (and d!124179 (not res!690677)) b!1034019))

(assert (= (and b!1034019 res!690676) b!1034016))

(assert (= (and b!1034019 res!690675) b!1034017))

(assert (= (and b!1034017 c!104741) b!1034020))

(assert (= (and b!1034017 (not c!104741)) b!1034018))

(assert (= (or b!1034020 b!1034018) bm!43678))

(assert (=> b!1034016 m!954505))

(assert (=> b!1034016 m!954505))

(declare-fun m!954517 () Bool)

(assert (=> b!1034016 m!954517))

(assert (=> b!1034017 m!954505))

(assert (=> b!1034017 m!954505))

(assert (=> b!1034017 m!954513))

(assert (=> bm!43678 m!954505))

(declare-fun m!954519 () Bool)

(assert (=> bm!43678 m!954519))

(assert (=> b!1034019 m!954505))

(assert (=> b!1034019 m!954505))

(assert (=> b!1034019 m!954513))

(assert (=> b!1033985 d!124179))

(declare-fun bm!43681 () Bool)

(declare-fun call!43684 () (_ BitVec 32))

(assert (=> bm!43681 (= call!43684 (arrayCountValidKeys!0 (_keys!11409 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31829 (_keys!11409 thiss!1427))))))

(declare-fun b!1034029 () Bool)

(declare-fun e!584415 () (_ BitVec 32))

(assert (=> b!1034029 (= e!584415 (bvadd #b00000000000000000000000000000001 call!43684))))

(declare-fun b!1034030 () Bool)

(assert (=> b!1034030 (= e!584415 call!43684)))

(declare-fun b!1034031 () Bool)

(declare-fun e!584416 () (_ BitVec 32))

(assert (=> b!1034031 (= e!584416 #b00000000000000000000000000000000)))

(declare-fun b!1034032 () Bool)

(assert (=> b!1034032 (= e!584416 e!584415)))

(declare-fun c!104746 () Bool)

(assert (=> b!1034032 (= c!104746 (validKeyInArray!0 (select (arr!31309 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124181 () Bool)

(declare-fun lt!456580 () (_ BitVec 32))

(assert (=> d!124181 (and (bvsge lt!456580 #b00000000000000000000000000000000) (bvsle lt!456580 (bvsub (size!31829 (_keys!11409 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124181 (= lt!456580 e!584416)))

(declare-fun c!104747 () Bool)

(assert (=> d!124181 (= c!104747 (bvsge #b00000000000000000000000000000000 (size!31829 (_keys!11409 thiss!1427))))))

(assert (=> d!124181 (and (bvsle #b00000000000000000000000000000000 (size!31829 (_keys!11409 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31829 (_keys!11409 thiss!1427)) (size!31829 (_keys!11409 thiss!1427))))))

(assert (=> d!124181 (= (arrayCountValidKeys!0 (_keys!11409 thiss!1427) #b00000000000000000000000000000000 (size!31829 (_keys!11409 thiss!1427))) lt!456580)))

(assert (= (and d!124181 c!104747) b!1034031))

(assert (= (and d!124181 (not c!104747)) b!1034032))

(assert (= (and b!1034032 c!104746) b!1034029))

(assert (= (and b!1034032 (not c!104746)) b!1034030))

(assert (= (or b!1034029 b!1034030) bm!43681))

(declare-fun m!954521 () Bool)

(assert (=> bm!43681 m!954521))

(assert (=> b!1034032 m!954505))

(assert (=> b!1034032 m!954505))

(assert (=> b!1034032 m!954513))

(assert (=> b!1033983 d!124181))

(declare-fun b!1034043 () Bool)

(declare-fun res!690686 () Bool)

(declare-fun e!584419 () Bool)

(assert (=> b!1034043 (=> (not res!690686) (not e!584419))))

(declare-fun size!31835 (LongMapFixedSize!5644) (_ BitVec 32))

(assert (=> b!1034043 (= res!690686 (= (size!31835 thiss!1427) (bvadd (_size!2877 thiss!1427) (bvsdiv (bvadd (extraKeys!5928 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1034042 () Bool)

(declare-fun res!690687 () Bool)

(assert (=> b!1034042 (=> (not res!690687) (not e!584419))))

(assert (=> b!1034042 (= res!690687 (bvsge (size!31835 thiss!1427) (_size!2877 thiss!1427)))))

(declare-fun b!1034044 () Bool)

(assert (=> b!1034044 (= e!584419 (and (bvsge (extraKeys!5928 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5928 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2877 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!124183 () Bool)

(declare-fun res!690688 () Bool)

(assert (=> d!124183 (=> (not res!690688) (not e!584419))))

(assert (=> d!124183 (= res!690688 (validMask!0 (mask!30082 thiss!1427)))))

(assert (=> d!124183 (= (simpleValid!399 thiss!1427) e!584419)))

(declare-fun b!1034041 () Bool)

(declare-fun res!690689 () Bool)

(assert (=> b!1034041 (=> (not res!690689) (not e!584419))))

(assert (=> b!1034041 (= res!690689 (and (= (size!31830 (_values!6219 thiss!1427)) (bvadd (mask!30082 thiss!1427) #b00000000000000000000000000000001)) (= (size!31829 (_keys!11409 thiss!1427)) (size!31830 (_values!6219 thiss!1427))) (bvsge (_size!2877 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2877 thiss!1427) (bvadd (mask!30082 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!124183 res!690688) b!1034041))

(assert (= (and b!1034041 res!690689) b!1034042))

(assert (= (and b!1034042 res!690687) b!1034043))

(assert (= (and b!1034043 res!690686) b!1034044))

(declare-fun m!954523 () Bool)

(assert (=> b!1034043 m!954523))

(assert (=> b!1034042 m!954523))

(assert (=> d!124183 m!954465))

(assert (=> d!124173 d!124183))

(declare-fun b!1034045 () Bool)

(declare-fun e!584420 () Bool)

(assert (=> b!1034045 (= e!584420 tp_is_empty!24457)))

(declare-fun mapIsEmpty!38157 () Bool)

(declare-fun mapRes!38157 () Bool)

(assert (=> mapIsEmpty!38157 mapRes!38157))

(declare-fun condMapEmpty!38157 () Bool)

(declare-fun mapDefault!38157 () ValueCell!11525)

(assert (=> mapNonEmpty!38156 (= condMapEmpty!38157 (= mapRest!38156 ((as const (Array (_ BitVec 32) ValueCell!11525)) mapDefault!38157)))))

(declare-fun e!584421 () Bool)

(assert (=> mapNonEmpty!38156 (= tp!73305 (and e!584421 mapRes!38157))))

(declare-fun mapNonEmpty!38157 () Bool)

(declare-fun tp!73306 () Bool)

(assert (=> mapNonEmpty!38157 (= mapRes!38157 (and tp!73306 e!584420))))

(declare-fun mapKey!38157 () (_ BitVec 32))

(declare-fun mapValue!38157 () ValueCell!11525)

(declare-fun mapRest!38157 () (Array (_ BitVec 32) ValueCell!11525))

(assert (=> mapNonEmpty!38157 (= mapRest!38156 (store mapRest!38157 mapKey!38157 mapValue!38157))))

(declare-fun b!1034046 () Bool)

(assert (=> b!1034046 (= e!584421 tp_is_empty!24457)))

(assert (= (and mapNonEmpty!38156 condMapEmpty!38157) mapIsEmpty!38157))

(assert (= (and mapNonEmpty!38156 (not condMapEmpty!38157)) mapNonEmpty!38157))

(assert (= (and mapNonEmpty!38157 ((_ is ValueCellFull!11525) mapValue!38157)) b!1034045))

(assert (= (and mapNonEmpty!38156 ((_ is ValueCellFull!11525) mapDefault!38157)) b!1034046))

(declare-fun m!954525 () Bool)

(assert (=> mapNonEmpty!38157 m!954525))

(check-sat (not mapNonEmpty!38157) (not b!1034042) (not b!1034032) (not bm!43675) (not bm!43681) (not bm!43678) (not b!1034016) (not b!1034002) tp_is_empty!24457 (not b_next!20737) (not b!1034043) (not b!1034017) (not d!124183) (not b!1034019) b_and!33215 (not b!1034005))
(check-sat b_and!33215 (not b_next!20737))
