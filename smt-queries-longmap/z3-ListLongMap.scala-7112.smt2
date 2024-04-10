; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90120 () Bool)

(assert start!90120)

(declare-fun b!1032374 () Bool)

(declare-fun b_free!20727 () Bool)

(declare-fun b_next!20727 () Bool)

(assert (=> b!1032374 (= b_free!20727 (not b_next!20727))))

(declare-fun tp!73251 () Bool)

(declare-fun b_and!33195 () Bool)

(assert (=> b!1032374 (= tp!73251 b_and!33195)))

(declare-fun b!1032372 () Bool)

(declare-fun res!690011 () Bool)

(declare-fun e!583327 () Bool)

(assert (=> b!1032372 (=> (not res!690011) (not e!583327))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032372 (= res!690011 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1032373 () Bool)

(declare-fun e!583329 () Bool)

(declare-fun e!583325 () Bool)

(declare-fun mapRes!38124 () Bool)

(assert (=> b!1032373 (= e!583329 (and e!583325 mapRes!38124))))

(declare-fun condMapEmpty!38124 () Bool)

(declare-datatypes ((V!37469 0))(
  ( (V!37470 (val!12274 Int)) )
))
(declare-datatypes ((ValueCell!11520 0))(
  ( (ValueCellFull!11520 (v!14851 V!37469)) (EmptyCell!11520) )
))
(declare-datatypes ((array!64958 0))(
  ( (array!64959 (arr!31281 (Array (_ BitVec 32) (_ BitVec 64))) (size!31798 (_ BitVec 32))) )
))
(declare-datatypes ((array!64960 0))(
  ( (array!64961 (arr!31282 (Array (_ BitVec 32) ValueCell!11520)) (size!31799 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5634 0))(
  ( (LongMapFixedSize!5635 (defaultEntry!6191 Int) (mask!30009 (_ BitVec 32)) (extraKeys!5923 (_ BitVec 32)) (zeroValue!6027 V!37469) (minValue!6027 V!37469) (_size!2872 (_ BitVec 32)) (_keys!11364 array!64958) (_values!6214 array!64960) (_vacant!2872 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5634)

(declare-fun mapDefault!38124 () ValueCell!11520)

(assert (=> b!1032373 (= condMapEmpty!38124 (= (arr!31282 (_values!6214 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11520)) mapDefault!38124)))))

(declare-fun b!1032375 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032375 (= e!583327 (not (validMask!0 (mask!30009 thiss!1427))))))

(declare-fun mapIsEmpty!38124 () Bool)

(assert (=> mapIsEmpty!38124 mapRes!38124))

(declare-fun b!1032376 () Bool)

(declare-fun e!583324 () Bool)

(declare-fun tp_is_empty!24447 () Bool)

(assert (=> b!1032376 (= e!583324 tp_is_empty!24447)))

(declare-fun res!690010 () Bool)

(assert (=> start!90120 (=> (not res!690010) (not e!583327))))

(declare-fun valid!2132 (LongMapFixedSize!5634) Bool)

(assert (=> start!90120 (= res!690010 (valid!2132 thiss!1427))))

(assert (=> start!90120 e!583327))

(declare-fun e!583328 () Bool)

(assert (=> start!90120 e!583328))

(assert (=> start!90120 true))

(declare-fun array_inv!24211 (array!64958) Bool)

(declare-fun array_inv!24212 (array!64960) Bool)

(assert (=> b!1032374 (= e!583328 (and tp!73251 tp_is_empty!24447 (array_inv!24211 (_keys!11364 thiss!1427)) (array_inv!24212 (_values!6214 thiss!1427)) e!583329))))

(declare-fun mapNonEmpty!38124 () Bool)

(declare-fun tp!73252 () Bool)

(assert (=> mapNonEmpty!38124 (= mapRes!38124 (and tp!73252 e!583324))))

(declare-fun mapValue!38124 () ValueCell!11520)

(declare-fun mapKey!38124 () (_ BitVec 32))

(declare-fun mapRest!38124 () (Array (_ BitVec 32) ValueCell!11520))

(assert (=> mapNonEmpty!38124 (= (arr!31282 (_values!6214 thiss!1427)) (store mapRest!38124 mapKey!38124 mapValue!38124))))

(declare-fun b!1032377 () Bool)

(assert (=> b!1032377 (= e!583325 tp_is_empty!24447)))

(assert (= (and start!90120 res!690010) b!1032372))

(assert (= (and b!1032372 res!690011) b!1032375))

(assert (= (and b!1032373 condMapEmpty!38124) mapIsEmpty!38124))

(assert (= (and b!1032373 (not condMapEmpty!38124)) mapNonEmpty!38124))

(get-info :version)

(assert (= (and mapNonEmpty!38124 ((_ is ValueCellFull!11520) mapValue!38124)) b!1032376))

(assert (= (and b!1032373 ((_ is ValueCellFull!11520) mapDefault!38124)) b!1032377))

(assert (= b!1032374 b!1032373))

(assert (= start!90120 b!1032374))

(declare-fun m!952687 () Bool)

(assert (=> b!1032375 m!952687))

(declare-fun m!952689 () Bool)

(assert (=> start!90120 m!952689))

(declare-fun m!952691 () Bool)

(assert (=> b!1032374 m!952691))

(declare-fun m!952693 () Bool)

(assert (=> b!1032374 m!952693))

(declare-fun m!952695 () Bool)

(assert (=> mapNonEmpty!38124 m!952695))

(check-sat (not mapNonEmpty!38124) tp_is_empty!24447 (not b!1032374) (not b_next!20727) (not b!1032375) b_and!33195 (not start!90120))
(check-sat b_and!33195 (not b_next!20727))
(get-model)

(declare-fun d!123671 () Bool)

(declare-fun res!690024 () Bool)

(declare-fun e!583350 () Bool)

(assert (=> d!123671 (=> (not res!690024) (not e!583350))))

(declare-fun simpleValid!397 (LongMapFixedSize!5634) Bool)

(assert (=> d!123671 (= res!690024 (simpleValid!397 thiss!1427))))

(assert (=> d!123671 (= (valid!2132 thiss!1427) e!583350)))

(declare-fun b!1032402 () Bool)

(declare-fun res!690025 () Bool)

(assert (=> b!1032402 (=> (not res!690025) (not e!583350))))

(declare-fun arrayCountValidKeys!0 (array!64958 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032402 (= res!690025 (= (arrayCountValidKeys!0 (_keys!11364 thiss!1427) #b00000000000000000000000000000000 (size!31798 (_keys!11364 thiss!1427))) (_size!2872 thiss!1427)))))

(declare-fun b!1032403 () Bool)

(declare-fun res!690026 () Bool)

(assert (=> b!1032403 (=> (not res!690026) (not e!583350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64958 (_ BitVec 32)) Bool)

(assert (=> b!1032403 (= res!690026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11364 thiss!1427) (mask!30009 thiss!1427)))))

(declare-fun b!1032404 () Bool)

(declare-datatypes ((List!21895 0))(
  ( (Nil!21892) (Cons!21891 (h!23093 (_ BitVec 64)) (t!31089 List!21895)) )
))
(declare-fun arrayNoDuplicates!0 (array!64958 (_ BitVec 32) List!21895) Bool)

(assert (=> b!1032404 (= e!583350 (arrayNoDuplicates!0 (_keys!11364 thiss!1427) #b00000000000000000000000000000000 Nil!21892))))

(assert (= (and d!123671 res!690024) b!1032402))

(assert (= (and b!1032402 res!690025) b!1032403))

(assert (= (and b!1032403 res!690026) b!1032404))

(declare-fun m!952707 () Bool)

(assert (=> d!123671 m!952707))

(declare-fun m!952709 () Bool)

(assert (=> b!1032402 m!952709))

(declare-fun m!952711 () Bool)

(assert (=> b!1032403 m!952711))

(declare-fun m!952713 () Bool)

(assert (=> b!1032404 m!952713))

(assert (=> start!90120 d!123671))

(declare-fun d!123673 () Bool)

(assert (=> d!123673 (= (array_inv!24211 (_keys!11364 thiss!1427)) (bvsge (size!31798 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032374 d!123673))

(declare-fun d!123675 () Bool)

(assert (=> d!123675 (= (array_inv!24212 (_values!6214 thiss!1427)) (bvsge (size!31799 (_values!6214 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032374 d!123675))

(declare-fun d!123677 () Bool)

(assert (=> d!123677 (= (validMask!0 (mask!30009 thiss!1427)) (and (or (= (mask!30009 thiss!1427) #b00000000000000000000000000000111) (= (mask!30009 thiss!1427) #b00000000000000000000000000001111) (= (mask!30009 thiss!1427) #b00000000000000000000000000011111) (= (mask!30009 thiss!1427) #b00000000000000000000000000111111) (= (mask!30009 thiss!1427) #b00000000000000000000000001111111) (= (mask!30009 thiss!1427) #b00000000000000000000000011111111) (= (mask!30009 thiss!1427) #b00000000000000000000000111111111) (= (mask!30009 thiss!1427) #b00000000000000000000001111111111) (= (mask!30009 thiss!1427) #b00000000000000000000011111111111) (= (mask!30009 thiss!1427) #b00000000000000000000111111111111) (= (mask!30009 thiss!1427) #b00000000000000000001111111111111) (= (mask!30009 thiss!1427) #b00000000000000000011111111111111) (= (mask!30009 thiss!1427) #b00000000000000000111111111111111) (= (mask!30009 thiss!1427) #b00000000000000001111111111111111) (= (mask!30009 thiss!1427) #b00000000000000011111111111111111) (= (mask!30009 thiss!1427) #b00000000000000111111111111111111) (= (mask!30009 thiss!1427) #b00000000000001111111111111111111) (= (mask!30009 thiss!1427) #b00000000000011111111111111111111) (= (mask!30009 thiss!1427) #b00000000000111111111111111111111) (= (mask!30009 thiss!1427) #b00000000001111111111111111111111) (= (mask!30009 thiss!1427) #b00000000011111111111111111111111) (= (mask!30009 thiss!1427) #b00000000111111111111111111111111) (= (mask!30009 thiss!1427) #b00000001111111111111111111111111) (= (mask!30009 thiss!1427) #b00000011111111111111111111111111) (= (mask!30009 thiss!1427) #b00000111111111111111111111111111) (= (mask!30009 thiss!1427) #b00001111111111111111111111111111) (= (mask!30009 thiss!1427) #b00011111111111111111111111111111) (= (mask!30009 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30009 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032375 d!123677))

(declare-fun b!1032412 () Bool)

(declare-fun e!583355 () Bool)

(assert (=> b!1032412 (= e!583355 tp_is_empty!24447)))

(declare-fun b!1032411 () Bool)

(declare-fun e!583356 () Bool)

(assert (=> b!1032411 (= e!583356 tp_is_empty!24447)))

(declare-fun condMapEmpty!38130 () Bool)

(declare-fun mapDefault!38130 () ValueCell!11520)

(assert (=> mapNonEmpty!38124 (= condMapEmpty!38130 (= mapRest!38124 ((as const (Array (_ BitVec 32) ValueCell!11520)) mapDefault!38130)))))

(declare-fun mapRes!38130 () Bool)

(assert (=> mapNonEmpty!38124 (= tp!73252 (and e!583355 mapRes!38130))))

(declare-fun mapIsEmpty!38130 () Bool)

(assert (=> mapIsEmpty!38130 mapRes!38130))

(declare-fun mapNonEmpty!38130 () Bool)

(declare-fun tp!73261 () Bool)

(assert (=> mapNonEmpty!38130 (= mapRes!38130 (and tp!73261 e!583356))))

(declare-fun mapRest!38130 () (Array (_ BitVec 32) ValueCell!11520))

(declare-fun mapKey!38130 () (_ BitVec 32))

(declare-fun mapValue!38130 () ValueCell!11520)

(assert (=> mapNonEmpty!38130 (= mapRest!38124 (store mapRest!38130 mapKey!38130 mapValue!38130))))

(assert (= (and mapNonEmpty!38124 condMapEmpty!38130) mapIsEmpty!38130))

(assert (= (and mapNonEmpty!38124 (not condMapEmpty!38130)) mapNonEmpty!38130))

(assert (= (and mapNonEmpty!38130 ((_ is ValueCellFull!11520) mapValue!38130)) b!1032411))

(assert (= (and mapNonEmpty!38124 ((_ is ValueCellFull!11520) mapDefault!38130)) b!1032412))

(declare-fun m!952715 () Bool)

(assert (=> mapNonEmpty!38130 m!952715))

(check-sat (not b!1032403) (not b!1032404) (not b_next!20727) (not d!123671) tp_is_empty!24447 (not mapNonEmpty!38130) b_and!33195 (not b!1032402))
(check-sat b_and!33195 (not b_next!20727))
(get-model)

(declare-fun b!1032424 () Bool)

(declare-fun e!583359 () Bool)

(assert (=> b!1032424 (= e!583359 (and (bvsge (extraKeys!5923 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5923 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2872 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!123679 () Bool)

(declare-fun res!690035 () Bool)

(assert (=> d!123679 (=> (not res!690035) (not e!583359))))

(assert (=> d!123679 (= res!690035 (validMask!0 (mask!30009 thiss!1427)))))

(assert (=> d!123679 (= (simpleValid!397 thiss!1427) e!583359)))

(declare-fun b!1032422 () Bool)

(declare-fun res!690038 () Bool)

(assert (=> b!1032422 (=> (not res!690038) (not e!583359))))

(declare-fun size!31802 (LongMapFixedSize!5634) (_ BitVec 32))

(assert (=> b!1032422 (= res!690038 (bvsge (size!31802 thiss!1427) (_size!2872 thiss!1427)))))

(declare-fun b!1032421 () Bool)

(declare-fun res!690036 () Bool)

(assert (=> b!1032421 (=> (not res!690036) (not e!583359))))

(assert (=> b!1032421 (= res!690036 (and (= (size!31799 (_values!6214 thiss!1427)) (bvadd (mask!30009 thiss!1427) #b00000000000000000000000000000001)) (= (size!31798 (_keys!11364 thiss!1427)) (size!31799 (_values!6214 thiss!1427))) (bvsge (_size!2872 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2872 thiss!1427) (bvadd (mask!30009 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1032423 () Bool)

(declare-fun res!690037 () Bool)

(assert (=> b!1032423 (=> (not res!690037) (not e!583359))))

(assert (=> b!1032423 (= res!690037 (= (size!31802 thiss!1427) (bvadd (_size!2872 thiss!1427) (bvsdiv (bvadd (extraKeys!5923 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!123679 res!690035) b!1032421))

(assert (= (and b!1032421 res!690036) b!1032422))

(assert (= (and b!1032422 res!690038) b!1032423))

(assert (= (and b!1032423 res!690037) b!1032424))

(assert (=> d!123679 m!952687))

(declare-fun m!952717 () Bool)

(assert (=> b!1032422 m!952717))

(assert (=> b!1032423 m!952717))

(assert (=> d!123671 d!123679))

(declare-fun b!1032433 () Bool)

(declare-fun e!583364 () (_ BitVec 32))

(declare-fun call!43593 () (_ BitVec 32))

(assert (=> b!1032433 (= e!583364 (bvadd #b00000000000000000000000000000001 call!43593))))

(declare-fun d!123681 () Bool)

(declare-fun lt!456032 () (_ BitVec 32))

(assert (=> d!123681 (and (bvsge lt!456032 #b00000000000000000000000000000000) (bvsle lt!456032 (bvsub (size!31798 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!583365 () (_ BitVec 32))

(assert (=> d!123681 (= lt!456032 e!583365)))

(declare-fun c!104307 () Bool)

(assert (=> d!123681 (= c!104307 (bvsge #b00000000000000000000000000000000 (size!31798 (_keys!11364 thiss!1427))))))

(assert (=> d!123681 (and (bvsle #b00000000000000000000000000000000 (size!31798 (_keys!11364 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31798 (_keys!11364 thiss!1427)) (size!31798 (_keys!11364 thiss!1427))))))

(assert (=> d!123681 (= (arrayCountValidKeys!0 (_keys!11364 thiss!1427) #b00000000000000000000000000000000 (size!31798 (_keys!11364 thiss!1427))) lt!456032)))

(declare-fun b!1032434 () Bool)

(assert (=> b!1032434 (= e!583365 #b00000000000000000000000000000000)))

(declare-fun bm!43590 () Bool)

(assert (=> bm!43590 (= call!43593 (arrayCountValidKeys!0 (_keys!11364 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31798 (_keys!11364 thiss!1427))))))

(declare-fun b!1032435 () Bool)

(assert (=> b!1032435 (= e!583364 call!43593)))

(declare-fun b!1032436 () Bool)

(assert (=> b!1032436 (= e!583365 e!583364)))

(declare-fun c!104306 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032436 (= c!104306 (validKeyInArray!0 (select (arr!31281 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123681 c!104307) b!1032434))

(assert (= (and d!123681 (not c!104307)) b!1032436))

(assert (= (and b!1032436 c!104306) b!1032433))

(assert (= (and b!1032436 (not c!104306)) b!1032435))

(assert (= (or b!1032433 b!1032435) bm!43590))

(declare-fun m!952719 () Bool)

(assert (=> bm!43590 m!952719))

(declare-fun m!952721 () Bool)

(assert (=> b!1032436 m!952721))

(assert (=> b!1032436 m!952721))

(declare-fun m!952723 () Bool)

(assert (=> b!1032436 m!952723))

(assert (=> b!1032402 d!123681))

(declare-fun b!1032447 () Bool)

(declare-fun e!583377 () Bool)

(declare-fun call!43596 () Bool)

(assert (=> b!1032447 (= e!583377 call!43596)))

(declare-fun bm!43593 () Bool)

(declare-fun c!104310 () Bool)

(assert (=> bm!43593 (= call!43596 (arrayNoDuplicates!0 (_keys!11364 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104310 (Cons!21891 (select (arr!31281 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000) Nil!21892) Nil!21892)))))

(declare-fun b!1032448 () Bool)

(declare-fun e!583376 () Bool)

(assert (=> b!1032448 (= e!583376 e!583377)))

(assert (=> b!1032448 (= c!104310 (validKeyInArray!0 (select (arr!31281 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032449 () Bool)

(declare-fun e!583375 () Bool)

(declare-fun contains!6006 (List!21895 (_ BitVec 64)) Bool)

(assert (=> b!1032449 (= e!583375 (contains!6006 Nil!21892 (select (arr!31281 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123683 () Bool)

(declare-fun res!690045 () Bool)

(declare-fun e!583374 () Bool)

(assert (=> d!123683 (=> res!690045 e!583374)))

(assert (=> d!123683 (= res!690045 (bvsge #b00000000000000000000000000000000 (size!31798 (_keys!11364 thiss!1427))))))

(assert (=> d!123683 (= (arrayNoDuplicates!0 (_keys!11364 thiss!1427) #b00000000000000000000000000000000 Nil!21892) e!583374)))

(declare-fun b!1032450 () Bool)

(assert (=> b!1032450 (= e!583377 call!43596)))

(declare-fun b!1032451 () Bool)

(assert (=> b!1032451 (= e!583374 e!583376)))

(declare-fun res!690046 () Bool)

(assert (=> b!1032451 (=> (not res!690046) (not e!583376))))

(assert (=> b!1032451 (= res!690046 (not e!583375))))

(declare-fun res!690047 () Bool)

(assert (=> b!1032451 (=> (not res!690047) (not e!583375))))

(assert (=> b!1032451 (= res!690047 (validKeyInArray!0 (select (arr!31281 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123683 (not res!690045)) b!1032451))

(assert (= (and b!1032451 res!690047) b!1032449))

(assert (= (and b!1032451 res!690046) b!1032448))

(assert (= (and b!1032448 c!104310) b!1032447))

(assert (= (and b!1032448 (not c!104310)) b!1032450))

(assert (= (or b!1032447 b!1032450) bm!43593))

(assert (=> bm!43593 m!952721))

(declare-fun m!952725 () Bool)

(assert (=> bm!43593 m!952725))

(assert (=> b!1032448 m!952721))

(assert (=> b!1032448 m!952721))

(assert (=> b!1032448 m!952723))

(assert (=> b!1032449 m!952721))

(assert (=> b!1032449 m!952721))

(declare-fun m!952727 () Bool)

(assert (=> b!1032449 m!952727))

(assert (=> b!1032451 m!952721))

(assert (=> b!1032451 m!952721))

(assert (=> b!1032451 m!952723))

(assert (=> b!1032404 d!123683))

(declare-fun b!1032460 () Bool)

(declare-fun e!583385 () Bool)

(declare-fun e!583384 () Bool)

(assert (=> b!1032460 (= e!583385 e!583384)))

(declare-fun c!104313 () Bool)

(assert (=> b!1032460 (= c!104313 (validKeyInArray!0 (select (arr!31281 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032462 () Bool)

(declare-fun e!583386 () Bool)

(declare-fun call!43599 () Bool)

(assert (=> b!1032462 (= e!583386 call!43599)))

(declare-fun b!1032463 () Bool)

(assert (=> b!1032463 (= e!583384 e!583386)))

(declare-fun lt!456041 () (_ BitVec 64))

(assert (=> b!1032463 (= lt!456041 (select (arr!31281 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33815 0))(
  ( (Unit!33816) )
))
(declare-fun lt!456039 () Unit!33815)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64958 (_ BitVec 64) (_ BitVec 32)) Unit!33815)

(assert (=> b!1032463 (= lt!456039 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11364 thiss!1427) lt!456041 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032463 (arrayContainsKey!0 (_keys!11364 thiss!1427) lt!456041 #b00000000000000000000000000000000)))

(declare-fun lt!456040 () Unit!33815)

(assert (=> b!1032463 (= lt!456040 lt!456039)))

(declare-fun res!690053 () Bool)

(declare-datatypes ((SeekEntryResult!9731 0))(
  ( (MissingZero!9731 (index!41295 (_ BitVec 32))) (Found!9731 (index!41296 (_ BitVec 32))) (Intermediate!9731 (undefined!10543 Bool) (index!41297 (_ BitVec 32)) (x!92009 (_ BitVec 32))) (Undefined!9731) (MissingVacant!9731 (index!41298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64958 (_ BitVec 32)) SeekEntryResult!9731)

(assert (=> b!1032463 (= res!690053 (= (seekEntryOrOpen!0 (select (arr!31281 (_keys!11364 thiss!1427)) #b00000000000000000000000000000000) (_keys!11364 thiss!1427) (mask!30009 thiss!1427)) (Found!9731 #b00000000000000000000000000000000)))))

(assert (=> b!1032463 (=> (not res!690053) (not e!583386))))

(declare-fun bm!43596 () Bool)

(assert (=> bm!43596 (= call!43599 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11364 thiss!1427) (mask!30009 thiss!1427)))))

(declare-fun b!1032461 () Bool)

(assert (=> b!1032461 (= e!583384 call!43599)))

(declare-fun d!123685 () Bool)

(declare-fun res!690052 () Bool)

(assert (=> d!123685 (=> res!690052 e!583385)))

(assert (=> d!123685 (= res!690052 (bvsge #b00000000000000000000000000000000 (size!31798 (_keys!11364 thiss!1427))))))

(assert (=> d!123685 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11364 thiss!1427) (mask!30009 thiss!1427)) e!583385)))

(assert (= (and d!123685 (not res!690052)) b!1032460))

(assert (= (and b!1032460 c!104313) b!1032463))

(assert (= (and b!1032460 (not c!104313)) b!1032461))

(assert (= (and b!1032463 res!690053) b!1032462))

(assert (= (or b!1032462 b!1032461) bm!43596))

(assert (=> b!1032460 m!952721))

(assert (=> b!1032460 m!952721))

(assert (=> b!1032460 m!952723))

(assert (=> b!1032463 m!952721))

(declare-fun m!952729 () Bool)

(assert (=> b!1032463 m!952729))

(declare-fun m!952731 () Bool)

(assert (=> b!1032463 m!952731))

(assert (=> b!1032463 m!952721))

(declare-fun m!952733 () Bool)

(assert (=> b!1032463 m!952733))

(declare-fun m!952735 () Bool)

(assert (=> bm!43596 m!952735))

(assert (=> b!1032403 d!123685))

(declare-fun b!1032465 () Bool)

(declare-fun e!583387 () Bool)

(assert (=> b!1032465 (= e!583387 tp_is_empty!24447)))

(declare-fun b!1032464 () Bool)

(declare-fun e!583388 () Bool)

(assert (=> b!1032464 (= e!583388 tp_is_empty!24447)))

(declare-fun condMapEmpty!38131 () Bool)

(declare-fun mapDefault!38131 () ValueCell!11520)

(assert (=> mapNonEmpty!38130 (= condMapEmpty!38131 (= mapRest!38130 ((as const (Array (_ BitVec 32) ValueCell!11520)) mapDefault!38131)))))

(declare-fun mapRes!38131 () Bool)

(assert (=> mapNonEmpty!38130 (= tp!73261 (and e!583387 mapRes!38131))))

(declare-fun mapIsEmpty!38131 () Bool)

(assert (=> mapIsEmpty!38131 mapRes!38131))

(declare-fun mapNonEmpty!38131 () Bool)

(declare-fun tp!73262 () Bool)

(assert (=> mapNonEmpty!38131 (= mapRes!38131 (and tp!73262 e!583388))))

(declare-fun mapKey!38131 () (_ BitVec 32))

(declare-fun mapValue!38131 () ValueCell!11520)

(declare-fun mapRest!38131 () (Array (_ BitVec 32) ValueCell!11520))

(assert (=> mapNonEmpty!38131 (= mapRest!38130 (store mapRest!38131 mapKey!38131 mapValue!38131))))

(assert (= (and mapNonEmpty!38130 condMapEmpty!38131) mapIsEmpty!38131))

(assert (= (and mapNonEmpty!38130 (not condMapEmpty!38131)) mapNonEmpty!38131))

(assert (= (and mapNonEmpty!38131 ((_ is ValueCellFull!11520) mapValue!38131)) b!1032464))

(assert (= (and mapNonEmpty!38130 ((_ is ValueCellFull!11520) mapDefault!38131)) b!1032465))

(declare-fun m!952737 () Bool)

(assert (=> mapNonEmpty!38131 m!952737))

(check-sat (not bm!43590) (not b!1032451) tp_is_empty!24447 (not b!1032448) (not b!1032422) (not b!1032436) (not d!123679) (not bm!43593) (not bm!43596) (not mapNonEmpty!38131) (not b_next!20727) (not b!1032423) (not b!1032460) (not b!1032463) (not b!1032449) b_and!33195)
(check-sat b_and!33195 (not b_next!20727))
