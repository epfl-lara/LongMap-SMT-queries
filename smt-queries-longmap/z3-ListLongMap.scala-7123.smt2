; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90280 () Bool)

(assert start!90280)

(declare-fun b!1033300 () Bool)

(declare-fun b_free!20791 () Bool)

(declare-fun b_next!20791 () Bool)

(assert (=> b!1033300 (= b_free!20791 (not b_next!20791))))

(declare-fun tp!73469 () Bool)

(declare-fun b_and!33233 () Bool)

(assert (=> b!1033300 (= tp!73469 b_and!33233)))

(declare-fun b!1033298 () Bool)

(declare-fun res!690444 () Bool)

(declare-fun e!584043 () Bool)

(assert (=> b!1033298 (=> (not res!690444) (not e!584043))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033298 (= res!690444 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033299 () Bool)

(declare-fun res!690446 () Bool)

(assert (=> b!1033299 (=> (not res!690446) (not e!584043))))

(declare-datatypes ((V!37555 0))(
  ( (V!37556 (val!12306 Int)) )
))
(declare-datatypes ((ValueCell!11552 0))(
  ( (ValueCellFull!11552 (v!14882 V!37555)) (EmptyCell!11552) )
))
(declare-datatypes ((array!65039 0))(
  ( (array!65040 (arr!31314 (Array (_ BitVec 32) (_ BitVec 64))) (size!31838 (_ BitVec 32))) )
))
(declare-datatypes ((array!65041 0))(
  ( (array!65042 (arr!31315 (Array (_ BitVec 32) ValueCell!11552)) (size!31839 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5698 0))(
  ( (LongMapFixedSize!5699 (defaultEntry!6223 Int) (mask!30071 (_ BitVec 32)) (extraKeys!5955 (_ BitVec 32)) (zeroValue!6059 V!37555) (minValue!6059 V!37555) (_size!2904 (_ BitVec 32)) (_keys!11398 array!65039) (_values!6246 array!65041) (_vacant!2904 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5698)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033299 (= res!690446 (validMask!0 (mask!30071 thiss!1427)))))

(declare-fun e!584044 () Bool)

(declare-fun e!584042 () Bool)

(declare-fun tp_is_empty!24511 () Bool)

(declare-fun array_inv!24229 (array!65039) Bool)

(declare-fun array_inv!24230 (array!65041) Bool)

(assert (=> b!1033300 (= e!584042 (and tp!73469 tp_is_empty!24511 (array_inv!24229 (_keys!11398 thiss!1427)) (array_inv!24230 (_values!6246 thiss!1427)) e!584044))))

(declare-fun res!690448 () Bool)

(assert (=> start!90280 (=> (not res!690448) (not e!584043))))

(declare-fun valid!2143 (LongMapFixedSize!5698) Bool)

(assert (=> start!90280 (= res!690448 (valid!2143 thiss!1427))))

(assert (=> start!90280 e!584043))

(assert (=> start!90280 e!584042))

(assert (=> start!90280 true))

(declare-fun b!1033301 () Bool)

(declare-datatypes ((List!21938 0))(
  ( (Nil!21935) (Cons!21934 (h!23136 (_ BitVec 64)) (t!31123 List!21938)) )
))
(declare-fun arrayNoDuplicates!0 (array!65039 (_ BitVec 32) List!21938) Bool)

(assert (=> b!1033301 (= e!584043 (not (arrayNoDuplicates!0 (_keys!11398 thiss!1427) #b00000000000000000000000000000000 Nil!21935)))))

(declare-fun b!1033302 () Bool)

(declare-fun e!584046 () Bool)

(assert (=> b!1033302 (= e!584046 tp_is_empty!24511)))

(declare-fun mapIsEmpty!38246 () Bool)

(declare-fun mapRes!38246 () Bool)

(assert (=> mapIsEmpty!38246 mapRes!38246))

(declare-fun b!1033303 () Bool)

(declare-fun e!584041 () Bool)

(assert (=> b!1033303 (= e!584044 (and e!584041 mapRes!38246))))

(declare-fun condMapEmpty!38246 () Bool)

(declare-fun mapDefault!38246 () ValueCell!11552)

(assert (=> b!1033303 (= condMapEmpty!38246 (= (arr!31315 (_values!6246 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11552)) mapDefault!38246)))))

(declare-fun mapNonEmpty!38246 () Bool)

(declare-fun tp!73470 () Bool)

(assert (=> mapNonEmpty!38246 (= mapRes!38246 (and tp!73470 e!584046))))

(declare-fun mapValue!38246 () ValueCell!11552)

(declare-fun mapKey!38246 () (_ BitVec 32))

(declare-fun mapRest!38246 () (Array (_ BitVec 32) ValueCell!11552))

(assert (=> mapNonEmpty!38246 (= (arr!31315 (_values!6246 thiss!1427)) (store mapRest!38246 mapKey!38246 mapValue!38246))))

(declare-fun b!1033304 () Bool)

(assert (=> b!1033304 (= e!584041 tp_is_empty!24511)))

(declare-fun b!1033305 () Bool)

(declare-fun res!690445 () Bool)

(assert (=> b!1033305 (=> (not res!690445) (not e!584043))))

(assert (=> b!1033305 (= res!690445 (and (= (size!31839 (_values!6246 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30071 thiss!1427))) (= (size!31838 (_keys!11398 thiss!1427)) (size!31839 (_values!6246 thiss!1427))) (bvsge (mask!30071 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5955 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5955 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033306 () Bool)

(declare-fun res!690447 () Bool)

(assert (=> b!1033306 (=> (not res!690447) (not e!584043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65039 (_ BitVec 32)) Bool)

(assert (=> b!1033306 (= res!690447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11398 thiss!1427) (mask!30071 thiss!1427)))))

(assert (= (and start!90280 res!690448) b!1033298))

(assert (= (and b!1033298 res!690444) b!1033299))

(assert (= (and b!1033299 res!690446) b!1033305))

(assert (= (and b!1033305 res!690445) b!1033306))

(assert (= (and b!1033306 res!690447) b!1033301))

(assert (= (and b!1033303 condMapEmpty!38246) mapIsEmpty!38246))

(assert (= (and b!1033303 (not condMapEmpty!38246)) mapNonEmpty!38246))

(get-info :version)

(assert (= (and mapNonEmpty!38246 ((_ is ValueCellFull!11552) mapValue!38246)) b!1033302))

(assert (= (and b!1033303 ((_ is ValueCellFull!11552) mapDefault!38246)) b!1033304))

(assert (= b!1033300 b!1033303))

(assert (= start!90280 b!1033300))

(declare-fun m!952583 () Bool)

(assert (=> b!1033306 m!952583))

(declare-fun m!952585 () Bool)

(assert (=> b!1033299 m!952585))

(declare-fun m!952587 () Bool)

(assert (=> b!1033300 m!952587))

(declare-fun m!952589 () Bool)

(assert (=> b!1033300 m!952589))

(declare-fun m!952591 () Bool)

(assert (=> b!1033301 m!952591))

(declare-fun m!952593 () Bool)

(assert (=> start!90280 m!952593))

(declare-fun m!952595 () Bool)

(assert (=> mapNonEmpty!38246 m!952595))

(check-sat (not b!1033306) (not mapNonEmpty!38246) (not b!1033299) (not b_next!20791) (not start!90280) b_and!33233 (not b!1033300) (not b!1033301) tp_is_empty!24511)
(check-sat b_and!33233 (not b_next!20791))
(get-model)

(declare-fun d!123641 () Bool)

(assert (=> d!123641 (= (validMask!0 (mask!30071 thiss!1427)) (and (or (= (mask!30071 thiss!1427) #b00000000000000000000000000000111) (= (mask!30071 thiss!1427) #b00000000000000000000000000001111) (= (mask!30071 thiss!1427) #b00000000000000000000000000011111) (= (mask!30071 thiss!1427) #b00000000000000000000000000111111) (= (mask!30071 thiss!1427) #b00000000000000000000000001111111) (= (mask!30071 thiss!1427) #b00000000000000000000000011111111) (= (mask!30071 thiss!1427) #b00000000000000000000000111111111) (= (mask!30071 thiss!1427) #b00000000000000000000001111111111) (= (mask!30071 thiss!1427) #b00000000000000000000011111111111) (= (mask!30071 thiss!1427) #b00000000000000000000111111111111) (= (mask!30071 thiss!1427) #b00000000000000000001111111111111) (= (mask!30071 thiss!1427) #b00000000000000000011111111111111) (= (mask!30071 thiss!1427) #b00000000000000000111111111111111) (= (mask!30071 thiss!1427) #b00000000000000001111111111111111) (= (mask!30071 thiss!1427) #b00000000000000011111111111111111) (= (mask!30071 thiss!1427) #b00000000000000111111111111111111) (= (mask!30071 thiss!1427) #b00000000000001111111111111111111) (= (mask!30071 thiss!1427) #b00000000000011111111111111111111) (= (mask!30071 thiss!1427) #b00000000000111111111111111111111) (= (mask!30071 thiss!1427) #b00000000001111111111111111111111) (= (mask!30071 thiss!1427) #b00000000011111111111111111111111) (= (mask!30071 thiss!1427) #b00000000111111111111111111111111) (= (mask!30071 thiss!1427) #b00000001111111111111111111111111) (= (mask!30071 thiss!1427) #b00000011111111111111111111111111) (= (mask!30071 thiss!1427) #b00000111111111111111111111111111) (= (mask!30071 thiss!1427) #b00001111111111111111111111111111) (= (mask!30071 thiss!1427) #b00011111111111111111111111111111) (= (mask!30071 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30071 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1033299 d!123641))

(declare-fun b!1033369 () Bool)

(declare-fun e!584089 () Bool)

(declare-fun call!43618 () Bool)

(assert (=> b!1033369 (= e!584089 call!43618)))

(declare-fun bm!43615 () Bool)

(assert (=> bm!43615 (= call!43618 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11398 thiss!1427) (mask!30071 thiss!1427)))))

(declare-fun b!1033370 () Bool)

(declare-fun e!584091 () Bool)

(assert (=> b!1033370 (= e!584091 call!43618)))

(declare-fun d!123643 () Bool)

(declare-fun res!690484 () Bool)

(declare-fun e!584090 () Bool)

(assert (=> d!123643 (=> res!690484 e!584090)))

(assert (=> d!123643 (= res!690484 (bvsge #b00000000000000000000000000000000 (size!31838 (_keys!11398 thiss!1427))))))

(assert (=> d!123643 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11398 thiss!1427) (mask!30071 thiss!1427)) e!584090)))

(declare-fun b!1033371 () Bool)

(assert (=> b!1033371 (= e!584089 e!584091)))

(declare-fun lt!455907 () (_ BitVec 64))

(assert (=> b!1033371 (= lt!455907 (select (arr!31314 (_keys!11398 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33711 0))(
  ( (Unit!33712) )
))
(declare-fun lt!455906 () Unit!33711)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65039 (_ BitVec 64) (_ BitVec 32)) Unit!33711)

(assert (=> b!1033371 (= lt!455906 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11398 thiss!1427) lt!455907 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033371 (arrayContainsKey!0 (_keys!11398 thiss!1427) lt!455907 #b00000000000000000000000000000000)))

(declare-fun lt!455905 () Unit!33711)

(assert (=> b!1033371 (= lt!455905 lt!455906)))

(declare-fun res!690483 () Bool)

(declare-datatypes ((SeekEntryResult!9728 0))(
  ( (MissingZero!9728 (index!41283 (_ BitVec 32))) (Found!9728 (index!41284 (_ BitVec 32))) (Intermediate!9728 (undefined!10540 Bool) (index!41285 (_ BitVec 32)) (x!92171 (_ BitVec 32))) (Undefined!9728) (MissingVacant!9728 (index!41286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65039 (_ BitVec 32)) SeekEntryResult!9728)

(assert (=> b!1033371 (= res!690483 (= (seekEntryOrOpen!0 (select (arr!31314 (_keys!11398 thiss!1427)) #b00000000000000000000000000000000) (_keys!11398 thiss!1427) (mask!30071 thiss!1427)) (Found!9728 #b00000000000000000000000000000000)))))

(assert (=> b!1033371 (=> (not res!690483) (not e!584091))))

(declare-fun b!1033372 () Bool)

(assert (=> b!1033372 (= e!584090 e!584089)))

(declare-fun c!104328 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033372 (= c!104328 (validKeyInArray!0 (select (arr!31314 (_keys!11398 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123643 (not res!690484)) b!1033372))

(assert (= (and b!1033372 c!104328) b!1033371))

(assert (= (and b!1033372 (not c!104328)) b!1033369))

(assert (= (and b!1033371 res!690483) b!1033370))

(assert (= (or b!1033370 b!1033369) bm!43615))

(declare-fun m!952625 () Bool)

(assert (=> bm!43615 m!952625))

(declare-fun m!952627 () Bool)

(assert (=> b!1033371 m!952627))

(declare-fun m!952629 () Bool)

(assert (=> b!1033371 m!952629))

(declare-fun m!952631 () Bool)

(assert (=> b!1033371 m!952631))

(assert (=> b!1033371 m!952627))

(declare-fun m!952633 () Bool)

(assert (=> b!1033371 m!952633))

(assert (=> b!1033372 m!952627))

(assert (=> b!1033372 m!952627))

(declare-fun m!952635 () Bool)

(assert (=> b!1033372 m!952635))

(assert (=> b!1033306 d!123643))

(declare-fun d!123645 () Bool)

(declare-fun res!690491 () Bool)

(declare-fun e!584094 () Bool)

(assert (=> d!123645 (=> (not res!690491) (not e!584094))))

(declare-fun simpleValid!404 (LongMapFixedSize!5698) Bool)

(assert (=> d!123645 (= res!690491 (simpleValid!404 thiss!1427))))

(assert (=> d!123645 (= (valid!2143 thiss!1427) e!584094)))

(declare-fun b!1033379 () Bool)

(declare-fun res!690492 () Bool)

(assert (=> b!1033379 (=> (not res!690492) (not e!584094))))

(declare-fun arrayCountValidKeys!0 (array!65039 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033379 (= res!690492 (= (arrayCountValidKeys!0 (_keys!11398 thiss!1427) #b00000000000000000000000000000000 (size!31838 (_keys!11398 thiss!1427))) (_size!2904 thiss!1427)))))

(declare-fun b!1033380 () Bool)

(declare-fun res!690493 () Bool)

(assert (=> b!1033380 (=> (not res!690493) (not e!584094))))

(assert (=> b!1033380 (= res!690493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11398 thiss!1427) (mask!30071 thiss!1427)))))

(declare-fun b!1033381 () Bool)

(assert (=> b!1033381 (= e!584094 (arrayNoDuplicates!0 (_keys!11398 thiss!1427) #b00000000000000000000000000000000 Nil!21935))))

(assert (= (and d!123645 res!690491) b!1033379))

(assert (= (and b!1033379 res!690492) b!1033380))

(assert (= (and b!1033380 res!690493) b!1033381))

(declare-fun m!952637 () Bool)

(assert (=> d!123645 m!952637))

(declare-fun m!952639 () Bool)

(assert (=> b!1033379 m!952639))

(assert (=> b!1033380 m!952583))

(assert (=> b!1033381 m!952591))

(assert (=> start!90280 d!123645))

(declare-fun b!1033392 () Bool)

(declare-fun e!584104 () Bool)

(declare-fun call!43621 () Bool)

(assert (=> b!1033392 (= e!584104 call!43621)))

(declare-fun b!1033394 () Bool)

(assert (=> b!1033394 (= e!584104 call!43621)))

(declare-fun b!1033395 () Bool)

(declare-fun e!584103 () Bool)

(declare-fun e!584106 () Bool)

(assert (=> b!1033395 (= e!584103 e!584106)))

(declare-fun res!690502 () Bool)

(assert (=> b!1033395 (=> (not res!690502) (not e!584106))))

(declare-fun e!584105 () Bool)

(assert (=> b!1033395 (= res!690502 (not e!584105))))

(declare-fun res!690501 () Bool)

(assert (=> b!1033395 (=> (not res!690501) (not e!584105))))

(assert (=> b!1033395 (= res!690501 (validKeyInArray!0 (select (arr!31314 (_keys!11398 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033396 () Bool)

(declare-fun contains!5991 (List!21938 (_ BitVec 64)) Bool)

(assert (=> b!1033396 (= e!584105 (contains!5991 Nil!21935 (select (arr!31314 (_keys!11398 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43618 () Bool)

(declare-fun c!104331 () Bool)

(assert (=> bm!43618 (= call!43621 (arrayNoDuplicates!0 (_keys!11398 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104331 (Cons!21934 (select (arr!31314 (_keys!11398 thiss!1427)) #b00000000000000000000000000000000) Nil!21935) Nil!21935)))))

(declare-fun b!1033393 () Bool)

(assert (=> b!1033393 (= e!584106 e!584104)))

(assert (=> b!1033393 (= c!104331 (validKeyInArray!0 (select (arr!31314 (_keys!11398 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123647 () Bool)

(declare-fun res!690500 () Bool)

(assert (=> d!123647 (=> res!690500 e!584103)))

(assert (=> d!123647 (= res!690500 (bvsge #b00000000000000000000000000000000 (size!31838 (_keys!11398 thiss!1427))))))

(assert (=> d!123647 (= (arrayNoDuplicates!0 (_keys!11398 thiss!1427) #b00000000000000000000000000000000 Nil!21935) e!584103)))

(assert (= (and d!123647 (not res!690500)) b!1033395))

(assert (= (and b!1033395 res!690501) b!1033396))

(assert (= (and b!1033395 res!690502) b!1033393))

(assert (= (and b!1033393 c!104331) b!1033394))

(assert (= (and b!1033393 (not c!104331)) b!1033392))

(assert (= (or b!1033394 b!1033392) bm!43618))

(assert (=> b!1033395 m!952627))

(assert (=> b!1033395 m!952627))

(assert (=> b!1033395 m!952635))

(assert (=> b!1033396 m!952627))

(assert (=> b!1033396 m!952627))

(declare-fun m!952641 () Bool)

(assert (=> b!1033396 m!952641))

(assert (=> bm!43618 m!952627))

(declare-fun m!952643 () Bool)

(assert (=> bm!43618 m!952643))

(assert (=> b!1033393 m!952627))

(assert (=> b!1033393 m!952627))

(assert (=> b!1033393 m!952635))

(assert (=> b!1033301 d!123647))

(declare-fun d!123649 () Bool)

(assert (=> d!123649 (= (array_inv!24229 (_keys!11398 thiss!1427)) (bvsge (size!31838 (_keys!11398 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033300 d!123649))

(declare-fun d!123651 () Bool)

(assert (=> d!123651 (= (array_inv!24230 (_values!6246 thiss!1427)) (bvsge (size!31839 (_values!6246 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033300 d!123651))

(declare-fun condMapEmpty!38255 () Bool)

(declare-fun mapDefault!38255 () ValueCell!11552)

(assert (=> mapNonEmpty!38246 (= condMapEmpty!38255 (= mapRest!38246 ((as const (Array (_ BitVec 32) ValueCell!11552)) mapDefault!38255)))))

(declare-fun e!584111 () Bool)

(declare-fun mapRes!38255 () Bool)

(assert (=> mapNonEmpty!38246 (= tp!73470 (and e!584111 mapRes!38255))))

(declare-fun b!1033403 () Bool)

(declare-fun e!584112 () Bool)

(assert (=> b!1033403 (= e!584112 tp_is_empty!24511)))

(declare-fun mapNonEmpty!38255 () Bool)

(declare-fun tp!73485 () Bool)

(assert (=> mapNonEmpty!38255 (= mapRes!38255 (and tp!73485 e!584112))))

(declare-fun mapValue!38255 () ValueCell!11552)

(declare-fun mapRest!38255 () (Array (_ BitVec 32) ValueCell!11552))

(declare-fun mapKey!38255 () (_ BitVec 32))

(assert (=> mapNonEmpty!38255 (= mapRest!38246 (store mapRest!38255 mapKey!38255 mapValue!38255))))

(declare-fun b!1033404 () Bool)

(assert (=> b!1033404 (= e!584111 tp_is_empty!24511)))

(declare-fun mapIsEmpty!38255 () Bool)

(assert (=> mapIsEmpty!38255 mapRes!38255))

(assert (= (and mapNonEmpty!38246 condMapEmpty!38255) mapIsEmpty!38255))

(assert (= (and mapNonEmpty!38246 (not condMapEmpty!38255)) mapNonEmpty!38255))

(assert (= (and mapNonEmpty!38255 ((_ is ValueCellFull!11552) mapValue!38255)) b!1033403))

(assert (= (and mapNonEmpty!38246 ((_ is ValueCellFull!11552) mapDefault!38255)) b!1033404))

(declare-fun m!952645 () Bool)

(assert (=> mapNonEmpty!38255 m!952645))

(check-sat (not bm!43618) (not b!1033380) (not b!1033372) (not b!1033379) (not b!1033395) (not b_next!20791) (not bm!43615) b_and!33233 tp_is_empty!24511 (not b!1033396) (not d!123645) (not b!1033393) (not b!1033371) (not b!1033381) (not mapNonEmpty!38255))
(check-sat b_and!33233 (not b_next!20791))
