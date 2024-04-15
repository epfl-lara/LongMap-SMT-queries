; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90412 () Bool)

(assert start!90412)

(declare-fun b!1034637 () Bool)

(declare-fun b_free!20809 () Bool)

(declare-fun b_next!20809 () Bool)

(assert (=> b!1034637 (= b_free!20809 (not b_next!20809))))

(declare-fun tp!73535 () Bool)

(declare-fun b_and!33283 () Bool)

(assert (=> b!1034637 (= tp!73535 b_and!33283)))

(declare-fun res!690988 () Bool)

(declare-fun e!584911 () Bool)

(assert (=> start!90412 (=> (not res!690988) (not e!584911))))

(declare-datatypes ((V!37579 0))(
  ( (V!37580 (val!12315 Int)) )
))
(declare-datatypes ((ValueCell!11561 0))(
  ( (ValueCellFull!11561 (v!14894 V!37579)) (EmptyCell!11561) )
))
(declare-datatypes ((array!65081 0))(
  ( (array!65082 (arr!31332 (Array (_ BitVec 32) (_ BitVec 64))) (size!31858 (_ BitVec 32))) )
))
(declare-datatypes ((array!65083 0))(
  ( (array!65084 (arr!31333 (Array (_ BitVec 32) ValueCell!11561)) (size!31859 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5716 0))(
  ( (LongMapFixedSize!5717 (defaultEntry!6236 Int) (mask!30097 (_ BitVec 32)) (extraKeys!5966 (_ BitVec 32)) (zeroValue!6070 V!37579) (minValue!6072 V!37579) (_size!2913 (_ BitVec 32)) (_keys!11415 array!65081) (_values!6259 array!65083) (_vacant!2913 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5716)

(declare-fun valid!2148 (LongMapFixedSize!5716) Bool)

(assert (=> start!90412 (= res!690988 (valid!2148 thiss!1427))))

(assert (=> start!90412 e!584911))

(declare-fun e!584907 () Bool)

(assert (=> start!90412 e!584907))

(assert (=> start!90412 true))

(declare-fun e!584908 () Bool)

(declare-fun tp_is_empty!24529 () Bool)

(declare-fun array_inv!24239 (array!65081) Bool)

(declare-fun array_inv!24240 (array!65083) Bool)

(assert (=> b!1034637 (= e!584907 (and tp!73535 tp_is_empty!24529 (array_inv!24239 (_keys!11415 thiss!1427)) (array_inv!24240 (_values!6259 thiss!1427)) e!584908))))

(declare-fun b!1034638 () Bool)

(declare-fun e!584906 () Bool)

(assert (=> b!1034638 (= e!584906 tp_is_empty!24529)))

(declare-fun b!1034639 () Bool)

(declare-fun res!690987 () Bool)

(assert (=> b!1034639 (=> (not res!690987) (not e!584911))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034639 (= res!690987 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034640 () Bool)

(declare-fun e!584910 () Bool)

(assert (=> b!1034640 (= e!584910 tp_is_empty!24529)))

(declare-fun b!1034641 () Bool)

(assert (=> b!1034641 (= e!584911 (not (= (size!31859 (_values!6259 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30097 thiss!1427)))))))

(declare-fun mapIsEmpty!38285 () Bool)

(declare-fun mapRes!38285 () Bool)

(assert (=> mapIsEmpty!38285 mapRes!38285))

(declare-fun b!1034642 () Bool)

(declare-fun res!690986 () Bool)

(assert (=> b!1034642 (=> (not res!690986) (not e!584911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034642 (= res!690986 (validMask!0 (mask!30097 thiss!1427)))))

(declare-fun b!1034643 () Bool)

(assert (=> b!1034643 (= e!584908 (and e!584906 mapRes!38285))))

(declare-fun condMapEmpty!38285 () Bool)

(declare-fun mapDefault!38285 () ValueCell!11561)

(assert (=> b!1034643 (= condMapEmpty!38285 (= (arr!31333 (_values!6259 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11561)) mapDefault!38285)))))

(declare-fun mapNonEmpty!38285 () Bool)

(declare-fun tp!73536 () Bool)

(assert (=> mapNonEmpty!38285 (= mapRes!38285 (and tp!73536 e!584910))))

(declare-fun mapValue!38285 () ValueCell!11561)

(declare-fun mapKey!38285 () (_ BitVec 32))

(declare-fun mapRest!38285 () (Array (_ BitVec 32) ValueCell!11561))

(assert (=> mapNonEmpty!38285 (= (arr!31333 (_values!6259 thiss!1427)) (store mapRest!38285 mapKey!38285 mapValue!38285))))

(assert (= (and start!90412 res!690988) b!1034639))

(assert (= (and b!1034639 res!690987) b!1034642))

(assert (= (and b!1034642 res!690986) b!1034641))

(assert (= (and b!1034643 condMapEmpty!38285) mapIsEmpty!38285))

(assert (= (and b!1034643 (not condMapEmpty!38285)) mapNonEmpty!38285))

(get-info :version)

(assert (= (and mapNonEmpty!38285 ((_ is ValueCellFull!11561) mapValue!38285)) b!1034640))

(assert (= (and b!1034643 ((_ is ValueCellFull!11561) mapDefault!38285)) b!1034638))

(assert (= b!1034637 b!1034643))

(assert (= start!90412 b!1034637))

(declare-fun m!954455 () Bool)

(assert (=> start!90412 m!954455))

(declare-fun m!954457 () Bool)

(assert (=> b!1034637 m!954457))

(declare-fun m!954459 () Bool)

(assert (=> b!1034637 m!954459))

(declare-fun m!954461 () Bool)

(assert (=> b!1034642 m!954461))

(declare-fun m!954463 () Bool)

(assert (=> mapNonEmpty!38285 m!954463))

(check-sat (not b!1034642) (not b!1034637) (not mapNonEmpty!38285) (not start!90412) (not b_next!20809) tp_is_empty!24529 b_and!33283)
(check-sat b_and!33283 (not b_next!20809))
(get-model)

(declare-fun d!124293 () Bool)

(declare-fun res!691013 () Bool)

(declare-fun e!584950 () Bool)

(assert (=> d!124293 (=> (not res!691013) (not e!584950))))

(declare-fun simpleValid!407 (LongMapFixedSize!5716) Bool)

(assert (=> d!124293 (= res!691013 (simpleValid!407 thiss!1427))))

(assert (=> d!124293 (= (valid!2148 thiss!1427) e!584950)))

(declare-fun b!1034692 () Bool)

(declare-fun res!691014 () Bool)

(assert (=> b!1034692 (=> (not res!691014) (not e!584950))))

(declare-fun arrayCountValidKeys!0 (array!65081 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034692 (= res!691014 (= (arrayCountValidKeys!0 (_keys!11415 thiss!1427) #b00000000000000000000000000000000 (size!31858 (_keys!11415 thiss!1427))) (_size!2913 thiss!1427)))))

(declare-fun b!1034693 () Bool)

(declare-fun res!691015 () Bool)

(assert (=> b!1034693 (=> (not res!691015) (not e!584950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65081 (_ BitVec 32)) Bool)

(assert (=> b!1034693 (= res!691015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11415 thiss!1427) (mask!30097 thiss!1427)))))

(declare-fun b!1034694 () Bool)

(declare-datatypes ((List!21943 0))(
  ( (Nil!21940) (Cons!21939 (h!23141 (_ BitVec 64)) (t!31137 List!21943)) )
))
(declare-fun arrayNoDuplicates!0 (array!65081 (_ BitVec 32) List!21943) Bool)

(assert (=> b!1034694 (= e!584950 (arrayNoDuplicates!0 (_keys!11415 thiss!1427) #b00000000000000000000000000000000 Nil!21940))))

(assert (= (and d!124293 res!691013) b!1034692))

(assert (= (and b!1034692 res!691014) b!1034693))

(assert (= (and b!1034693 res!691015) b!1034694))

(declare-fun m!954485 () Bool)

(assert (=> d!124293 m!954485))

(declare-fun m!954487 () Bool)

(assert (=> b!1034692 m!954487))

(declare-fun m!954489 () Bool)

(assert (=> b!1034693 m!954489))

(declare-fun m!954491 () Bool)

(assert (=> b!1034694 m!954491))

(assert (=> start!90412 d!124293))

(declare-fun d!124295 () Bool)

(assert (=> d!124295 (= (validMask!0 (mask!30097 thiss!1427)) (and (or (= (mask!30097 thiss!1427) #b00000000000000000000000000000111) (= (mask!30097 thiss!1427) #b00000000000000000000000000001111) (= (mask!30097 thiss!1427) #b00000000000000000000000000011111) (= (mask!30097 thiss!1427) #b00000000000000000000000000111111) (= (mask!30097 thiss!1427) #b00000000000000000000000001111111) (= (mask!30097 thiss!1427) #b00000000000000000000000011111111) (= (mask!30097 thiss!1427) #b00000000000000000000000111111111) (= (mask!30097 thiss!1427) #b00000000000000000000001111111111) (= (mask!30097 thiss!1427) #b00000000000000000000011111111111) (= (mask!30097 thiss!1427) #b00000000000000000000111111111111) (= (mask!30097 thiss!1427) #b00000000000000000001111111111111) (= (mask!30097 thiss!1427) #b00000000000000000011111111111111) (= (mask!30097 thiss!1427) #b00000000000000000111111111111111) (= (mask!30097 thiss!1427) #b00000000000000001111111111111111) (= (mask!30097 thiss!1427) #b00000000000000011111111111111111) (= (mask!30097 thiss!1427) #b00000000000000111111111111111111) (= (mask!30097 thiss!1427) #b00000000000001111111111111111111) (= (mask!30097 thiss!1427) #b00000000000011111111111111111111) (= (mask!30097 thiss!1427) #b00000000000111111111111111111111) (= (mask!30097 thiss!1427) #b00000000001111111111111111111111) (= (mask!30097 thiss!1427) #b00000000011111111111111111111111) (= (mask!30097 thiss!1427) #b00000000111111111111111111111111) (= (mask!30097 thiss!1427) #b00000001111111111111111111111111) (= (mask!30097 thiss!1427) #b00000011111111111111111111111111) (= (mask!30097 thiss!1427) #b00000111111111111111111111111111) (= (mask!30097 thiss!1427) #b00001111111111111111111111111111) (= (mask!30097 thiss!1427) #b00011111111111111111111111111111) (= (mask!30097 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30097 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034642 d!124295))

(declare-fun d!124297 () Bool)

(assert (=> d!124297 (= (array_inv!24239 (_keys!11415 thiss!1427)) (bvsge (size!31858 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034637 d!124297))

(declare-fun d!124299 () Bool)

(assert (=> d!124299 (= (array_inv!24240 (_values!6259 thiss!1427)) (bvsge (size!31859 (_values!6259 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034637 d!124299))

(declare-fun b!1034702 () Bool)

(declare-fun e!584956 () Bool)

(assert (=> b!1034702 (= e!584956 tp_is_empty!24529)))

(declare-fun b!1034701 () Bool)

(declare-fun e!584955 () Bool)

(assert (=> b!1034701 (= e!584955 tp_is_empty!24529)))

(declare-fun condMapEmpty!38294 () Bool)

(declare-fun mapDefault!38294 () ValueCell!11561)

(assert (=> mapNonEmpty!38285 (= condMapEmpty!38294 (= mapRest!38285 ((as const (Array (_ BitVec 32) ValueCell!11561)) mapDefault!38294)))))

(declare-fun mapRes!38294 () Bool)

(assert (=> mapNonEmpty!38285 (= tp!73536 (and e!584956 mapRes!38294))))

(declare-fun mapIsEmpty!38294 () Bool)

(assert (=> mapIsEmpty!38294 mapRes!38294))

(declare-fun mapNonEmpty!38294 () Bool)

(declare-fun tp!73551 () Bool)

(assert (=> mapNonEmpty!38294 (= mapRes!38294 (and tp!73551 e!584955))))

(declare-fun mapValue!38294 () ValueCell!11561)

(declare-fun mapKey!38294 () (_ BitVec 32))

(declare-fun mapRest!38294 () (Array (_ BitVec 32) ValueCell!11561))

(assert (=> mapNonEmpty!38294 (= mapRest!38285 (store mapRest!38294 mapKey!38294 mapValue!38294))))

(assert (= (and mapNonEmpty!38285 condMapEmpty!38294) mapIsEmpty!38294))

(assert (= (and mapNonEmpty!38285 (not condMapEmpty!38294)) mapNonEmpty!38294))

(assert (= (and mapNonEmpty!38294 ((_ is ValueCellFull!11561) mapValue!38294)) b!1034701))

(assert (= (and mapNonEmpty!38285 ((_ is ValueCellFull!11561) mapDefault!38294)) b!1034702))

(declare-fun m!954493 () Bool)

(assert (=> mapNonEmpty!38294 m!954493))

(check-sat (not d!124293) (not b!1034693) (not b!1034694) (not mapNonEmpty!38294) (not b!1034692) (not b_next!20809) tp_is_empty!24529 b_and!33283)
(check-sat b_and!33283 (not b_next!20809))
(get-model)

(declare-fun b!1034713 () Bool)

(declare-fun e!584965 () Bool)

(declare-fun e!584968 () Bool)

(assert (=> b!1034713 (= e!584965 e!584968)))

(declare-fun c!104652 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034713 (= c!104652 (validKeyInArray!0 (select (arr!31332 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034714 () Bool)

(declare-fun e!584966 () Bool)

(declare-fun contains!5996 (List!21943 (_ BitVec 64)) Bool)

(assert (=> b!1034714 (= e!584966 (contains!5996 Nil!21940 (select (arr!31332 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43732 () Bool)

(declare-fun call!43735 () Bool)

(assert (=> bm!43732 (= call!43735 (arrayNoDuplicates!0 (_keys!11415 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104652 (Cons!21939 (select (arr!31332 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000) Nil!21940) Nil!21940)))))

(declare-fun b!1034715 () Bool)

(assert (=> b!1034715 (= e!584968 call!43735)))

(declare-fun d!124301 () Bool)

(declare-fun res!691023 () Bool)

(declare-fun e!584967 () Bool)

(assert (=> d!124301 (=> res!691023 e!584967)))

(assert (=> d!124301 (= res!691023 (bvsge #b00000000000000000000000000000000 (size!31858 (_keys!11415 thiss!1427))))))

(assert (=> d!124301 (= (arrayNoDuplicates!0 (_keys!11415 thiss!1427) #b00000000000000000000000000000000 Nil!21940) e!584967)))

(declare-fun b!1034716 () Bool)

(assert (=> b!1034716 (= e!584968 call!43735)))

(declare-fun b!1034717 () Bool)

(assert (=> b!1034717 (= e!584967 e!584965)))

(declare-fun res!691024 () Bool)

(assert (=> b!1034717 (=> (not res!691024) (not e!584965))))

(assert (=> b!1034717 (= res!691024 (not e!584966))))

(declare-fun res!691022 () Bool)

(assert (=> b!1034717 (=> (not res!691022) (not e!584966))))

(assert (=> b!1034717 (= res!691022 (validKeyInArray!0 (select (arr!31332 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124301 (not res!691023)) b!1034717))

(assert (= (and b!1034717 res!691022) b!1034714))

(assert (= (and b!1034717 res!691024) b!1034713))

(assert (= (and b!1034713 c!104652) b!1034715))

(assert (= (and b!1034713 (not c!104652)) b!1034716))

(assert (= (or b!1034715 b!1034716) bm!43732))

(declare-fun m!954495 () Bool)

(assert (=> b!1034713 m!954495))

(assert (=> b!1034713 m!954495))

(declare-fun m!954497 () Bool)

(assert (=> b!1034713 m!954497))

(assert (=> b!1034714 m!954495))

(assert (=> b!1034714 m!954495))

(declare-fun m!954499 () Bool)

(assert (=> b!1034714 m!954499))

(assert (=> bm!43732 m!954495))

(declare-fun m!954501 () Bool)

(assert (=> bm!43732 m!954501))

(assert (=> b!1034717 m!954495))

(assert (=> b!1034717 m!954495))

(assert (=> b!1034717 m!954497))

(assert (=> b!1034694 d!124301))

(declare-fun b!1034726 () Bool)

(declare-fun e!584976 () Bool)

(declare-fun e!584977 () Bool)

(assert (=> b!1034726 (= e!584976 e!584977)))

(declare-fun lt!456515 () (_ BitVec 64))

(assert (=> b!1034726 (= lt!456515 (select (arr!31332 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33762 0))(
  ( (Unit!33763) )
))
(declare-fun lt!456516 () Unit!33762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65081 (_ BitVec 64) (_ BitVec 32)) Unit!33762)

(assert (=> b!1034726 (= lt!456516 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11415 thiss!1427) lt!456515 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034726 (arrayContainsKey!0 (_keys!11415 thiss!1427) lt!456515 #b00000000000000000000000000000000)))

(declare-fun lt!456517 () Unit!33762)

(assert (=> b!1034726 (= lt!456517 lt!456516)))

(declare-fun res!691029 () Bool)

(declare-datatypes ((SeekEntryResult!9731 0))(
  ( (MissingZero!9731 (index!41295 (_ BitVec 32))) (Found!9731 (index!41296 (_ BitVec 32))) (Intermediate!9731 (undefined!10543 Bool) (index!41297 (_ BitVec 32)) (x!92267 (_ BitVec 32))) (Undefined!9731) (MissingVacant!9731 (index!41298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65081 (_ BitVec 32)) SeekEntryResult!9731)

(assert (=> b!1034726 (= res!691029 (= (seekEntryOrOpen!0 (select (arr!31332 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000) (_keys!11415 thiss!1427) (mask!30097 thiss!1427)) (Found!9731 #b00000000000000000000000000000000)))))

(assert (=> b!1034726 (=> (not res!691029) (not e!584977))))

(declare-fun b!1034727 () Bool)

(declare-fun call!43738 () Bool)

(assert (=> b!1034727 (= e!584976 call!43738)))

(declare-fun d!124303 () Bool)

(declare-fun res!691030 () Bool)

(declare-fun e!584975 () Bool)

(assert (=> d!124303 (=> res!691030 e!584975)))

(assert (=> d!124303 (= res!691030 (bvsge #b00000000000000000000000000000000 (size!31858 (_keys!11415 thiss!1427))))))

(assert (=> d!124303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11415 thiss!1427) (mask!30097 thiss!1427)) e!584975)))

(declare-fun b!1034728 () Bool)

(assert (=> b!1034728 (= e!584975 e!584976)))

(declare-fun c!104655 () Bool)

(assert (=> b!1034728 (= c!104655 (validKeyInArray!0 (select (arr!31332 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43735 () Bool)

(assert (=> bm!43735 (= call!43738 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11415 thiss!1427) (mask!30097 thiss!1427)))))

(declare-fun b!1034729 () Bool)

(assert (=> b!1034729 (= e!584977 call!43738)))

(assert (= (and d!124303 (not res!691030)) b!1034728))

(assert (= (and b!1034728 c!104655) b!1034726))

(assert (= (and b!1034728 (not c!104655)) b!1034727))

(assert (= (and b!1034726 res!691029) b!1034729))

(assert (= (or b!1034729 b!1034727) bm!43735))

(assert (=> b!1034726 m!954495))

(declare-fun m!954503 () Bool)

(assert (=> b!1034726 m!954503))

(declare-fun m!954505 () Bool)

(assert (=> b!1034726 m!954505))

(assert (=> b!1034726 m!954495))

(declare-fun m!954507 () Bool)

(assert (=> b!1034726 m!954507))

(assert (=> b!1034728 m!954495))

(assert (=> b!1034728 m!954495))

(assert (=> b!1034728 m!954497))

(declare-fun m!954509 () Bool)

(assert (=> bm!43735 m!954509))

(assert (=> b!1034693 d!124303))

(declare-fun d!124305 () Bool)

(declare-fun lt!456520 () (_ BitVec 32))

(assert (=> d!124305 (and (bvsge lt!456520 #b00000000000000000000000000000000) (bvsle lt!456520 (bvsub (size!31858 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584982 () (_ BitVec 32))

(assert (=> d!124305 (= lt!456520 e!584982)))

(declare-fun c!104660 () Bool)

(assert (=> d!124305 (= c!104660 (bvsge #b00000000000000000000000000000000 (size!31858 (_keys!11415 thiss!1427))))))

(assert (=> d!124305 (and (bvsle #b00000000000000000000000000000000 (size!31858 (_keys!11415 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31858 (_keys!11415 thiss!1427)) (size!31858 (_keys!11415 thiss!1427))))))

(assert (=> d!124305 (= (arrayCountValidKeys!0 (_keys!11415 thiss!1427) #b00000000000000000000000000000000 (size!31858 (_keys!11415 thiss!1427))) lt!456520)))

(declare-fun b!1034738 () Bool)

(declare-fun e!584983 () (_ BitVec 32))

(assert (=> b!1034738 (= e!584982 e!584983)))

(declare-fun c!104661 () Bool)

(assert (=> b!1034738 (= c!104661 (validKeyInArray!0 (select (arr!31332 (_keys!11415 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034739 () Bool)

(declare-fun call!43741 () (_ BitVec 32))

(assert (=> b!1034739 (= e!584983 (bvadd #b00000000000000000000000000000001 call!43741))))

(declare-fun bm!43738 () Bool)

(assert (=> bm!43738 (= call!43741 (arrayCountValidKeys!0 (_keys!11415 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31858 (_keys!11415 thiss!1427))))))

(declare-fun b!1034740 () Bool)

(assert (=> b!1034740 (= e!584983 call!43741)))

(declare-fun b!1034741 () Bool)

(assert (=> b!1034741 (= e!584982 #b00000000000000000000000000000000)))

(assert (= (and d!124305 c!104660) b!1034741))

(assert (= (and d!124305 (not c!104660)) b!1034738))

(assert (= (and b!1034738 c!104661) b!1034739))

(assert (= (and b!1034738 (not c!104661)) b!1034740))

(assert (= (or b!1034739 b!1034740) bm!43738))

(assert (=> b!1034738 m!954495))

(assert (=> b!1034738 m!954495))

(assert (=> b!1034738 m!954497))

(declare-fun m!954511 () Bool)

(assert (=> bm!43738 m!954511))

(assert (=> b!1034692 d!124305))

(declare-fun d!124307 () Bool)

(declare-fun res!691041 () Bool)

(declare-fun e!584986 () Bool)

(assert (=> d!124307 (=> (not res!691041) (not e!584986))))

(assert (=> d!124307 (= res!691041 (validMask!0 (mask!30097 thiss!1427)))))

(assert (=> d!124307 (= (simpleValid!407 thiss!1427) e!584986)))

(declare-fun b!1034751 () Bool)

(declare-fun res!691040 () Bool)

(assert (=> b!1034751 (=> (not res!691040) (not e!584986))))

(declare-fun size!31864 (LongMapFixedSize!5716) (_ BitVec 32))

(assert (=> b!1034751 (= res!691040 (bvsge (size!31864 thiss!1427) (_size!2913 thiss!1427)))))

(declare-fun b!1034752 () Bool)

(declare-fun res!691039 () Bool)

(assert (=> b!1034752 (=> (not res!691039) (not e!584986))))

(assert (=> b!1034752 (= res!691039 (= (size!31864 thiss!1427) (bvadd (_size!2913 thiss!1427) (bvsdiv (bvadd (extraKeys!5966 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1034750 () Bool)

(declare-fun res!691042 () Bool)

(assert (=> b!1034750 (=> (not res!691042) (not e!584986))))

(assert (=> b!1034750 (= res!691042 (and (= (size!31859 (_values!6259 thiss!1427)) (bvadd (mask!30097 thiss!1427) #b00000000000000000000000000000001)) (= (size!31858 (_keys!11415 thiss!1427)) (size!31859 (_values!6259 thiss!1427))) (bvsge (_size!2913 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2913 thiss!1427) (bvadd (mask!30097 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1034753 () Bool)

(assert (=> b!1034753 (= e!584986 (and (bvsge (extraKeys!5966 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5966 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2913 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124307 res!691041) b!1034750))

(assert (= (and b!1034750 res!691042) b!1034751))

(assert (= (and b!1034751 res!691040) b!1034752))

(assert (= (and b!1034752 res!691039) b!1034753))

(assert (=> d!124307 m!954461))

(declare-fun m!954513 () Bool)

(assert (=> b!1034751 m!954513))

(assert (=> b!1034752 m!954513))

(assert (=> d!124293 d!124307))

(declare-fun b!1034755 () Bool)

(declare-fun e!584988 () Bool)

(assert (=> b!1034755 (= e!584988 tp_is_empty!24529)))

(declare-fun b!1034754 () Bool)

(declare-fun e!584987 () Bool)

(assert (=> b!1034754 (= e!584987 tp_is_empty!24529)))

(declare-fun condMapEmpty!38295 () Bool)

(declare-fun mapDefault!38295 () ValueCell!11561)

(assert (=> mapNonEmpty!38294 (= condMapEmpty!38295 (= mapRest!38294 ((as const (Array (_ BitVec 32) ValueCell!11561)) mapDefault!38295)))))

(declare-fun mapRes!38295 () Bool)

(assert (=> mapNonEmpty!38294 (= tp!73551 (and e!584988 mapRes!38295))))

(declare-fun mapIsEmpty!38295 () Bool)

(assert (=> mapIsEmpty!38295 mapRes!38295))

(declare-fun mapNonEmpty!38295 () Bool)

(declare-fun tp!73552 () Bool)

(assert (=> mapNonEmpty!38295 (= mapRes!38295 (and tp!73552 e!584987))))

(declare-fun mapKey!38295 () (_ BitVec 32))

(declare-fun mapValue!38295 () ValueCell!11561)

(declare-fun mapRest!38295 () (Array (_ BitVec 32) ValueCell!11561))

(assert (=> mapNonEmpty!38295 (= mapRest!38294 (store mapRest!38295 mapKey!38295 mapValue!38295))))

(assert (= (and mapNonEmpty!38294 condMapEmpty!38295) mapIsEmpty!38295))

(assert (= (and mapNonEmpty!38294 (not condMapEmpty!38295)) mapNonEmpty!38295))

(assert (= (and mapNonEmpty!38295 ((_ is ValueCellFull!11561) mapValue!38295)) b!1034754))

(assert (= (and mapNonEmpty!38294 ((_ is ValueCellFull!11561) mapDefault!38295)) b!1034755))

(declare-fun m!954515 () Bool)

(assert (=> mapNonEmpty!38295 m!954515))

(check-sat (not mapNonEmpty!38295) (not bm!43732) (not bm!43735) (not b!1034717) (not b!1034751) (not b!1034714) (not bm!43738) (not d!124307) (not b!1034713) (not b!1034752) tp_is_empty!24529 b_and!33283 (not b!1034726) (not b!1034738) (not b!1034728) (not b_next!20809))
(check-sat b_and!33283 (not b_next!20809))
