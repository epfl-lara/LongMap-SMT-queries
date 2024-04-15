; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90390 () Bool)

(assert start!90390)

(declare-fun b!1034516 () Bool)

(declare-fun b_free!20803 () Bool)

(declare-fun b_next!20803 () Bool)

(assert (=> b!1034516 (= b_free!20803 (not b_next!20803))))

(declare-fun tp!73513 () Bool)

(declare-fun b_and!33277 () Bool)

(assert (=> b!1034516 (= tp!73513 b_and!33277)))

(declare-fun b!1034511 () Bool)

(declare-fun e!584812 () Bool)

(declare-fun e!584814 () Bool)

(declare-fun mapRes!38272 () Bool)

(assert (=> b!1034511 (= e!584812 (and e!584814 mapRes!38272))))

(declare-fun condMapEmpty!38272 () Bool)

(declare-datatypes ((V!37571 0))(
  ( (V!37572 (val!12312 Int)) )
))
(declare-datatypes ((ValueCell!11558 0))(
  ( (ValueCellFull!11558 (v!14891 V!37571)) (EmptyCell!11558) )
))
(declare-datatypes ((array!65067 0))(
  ( (array!65068 (arr!31326 (Array (_ BitVec 32) (_ BitVec 64))) (size!31851 (_ BitVec 32))) )
))
(declare-datatypes ((array!65069 0))(
  ( (array!65070 (arr!31327 (Array (_ BitVec 32) ValueCell!11558)) (size!31852 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5710 0))(
  ( (LongMapFixedSize!5711 (defaultEntry!6233 Int) (mask!30090 (_ BitVec 32)) (extraKeys!5963 (_ BitVec 32)) (zeroValue!6067 V!37571) (minValue!6069 V!37571) (_size!2910 (_ BitVec 32)) (_keys!11411 array!65067) (_values!6256 array!65069) (_vacant!2910 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5710)

(declare-fun mapDefault!38272 () ValueCell!11558)

(assert (=> b!1034511 (= condMapEmpty!38272 (= (arr!31327 (_values!6256 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11558)) mapDefault!38272)))))

(declare-fun b!1034512 () Bool)

(declare-fun e!584813 () Bool)

(declare-fun tp_is_empty!24523 () Bool)

(assert (=> b!1034512 (= e!584813 tp_is_empty!24523)))

(declare-fun b!1034513 () Bool)

(declare-fun e!584816 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034513 (= e!584816 (not (validMask!0 (mask!30090 thiss!1427))))))

(declare-fun mapNonEmpty!38272 () Bool)

(declare-fun tp!73514 () Bool)

(assert (=> mapNonEmpty!38272 (= mapRes!38272 (and tp!73514 e!584813))))

(declare-fun mapValue!38272 () ValueCell!11558)

(declare-fun mapKey!38272 () (_ BitVec 32))

(declare-fun mapRest!38272 () (Array (_ BitVec 32) ValueCell!11558))

(assert (=> mapNonEmpty!38272 (= (arr!31327 (_values!6256 thiss!1427)) (store mapRest!38272 mapKey!38272 mapValue!38272))))

(declare-fun b!1034514 () Bool)

(assert (=> b!1034514 (= e!584814 tp_is_empty!24523)))

(declare-fun res!690931 () Bool)

(assert (=> start!90390 (=> (not res!690931) (not e!584816))))

(declare-fun valid!2147 (LongMapFixedSize!5710) Bool)

(assert (=> start!90390 (= res!690931 (valid!2147 thiss!1427))))

(assert (=> start!90390 e!584816))

(declare-fun e!584815 () Bool)

(assert (=> start!90390 e!584815))

(assert (=> start!90390 true))

(declare-fun mapIsEmpty!38272 () Bool)

(assert (=> mapIsEmpty!38272 mapRes!38272))

(declare-fun b!1034515 () Bool)

(declare-fun res!690930 () Bool)

(assert (=> b!1034515 (=> (not res!690930) (not e!584816))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034515 (= res!690930 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!24237 (array!65067) Bool)

(declare-fun array_inv!24238 (array!65069) Bool)

(assert (=> b!1034516 (= e!584815 (and tp!73513 tp_is_empty!24523 (array_inv!24237 (_keys!11411 thiss!1427)) (array_inv!24238 (_values!6256 thiss!1427)) e!584812))))

(assert (= (and start!90390 res!690931) b!1034515))

(assert (= (and b!1034515 res!690930) b!1034513))

(assert (= (and b!1034511 condMapEmpty!38272) mapIsEmpty!38272))

(assert (= (and b!1034511 (not condMapEmpty!38272)) mapNonEmpty!38272))

(get-info :version)

(assert (= (and mapNonEmpty!38272 ((_ is ValueCellFull!11558) mapValue!38272)) b!1034512))

(assert (= (and b!1034511 ((_ is ValueCellFull!11558) mapDefault!38272)) b!1034514))

(assert (= b!1034516 b!1034511))

(assert (= start!90390 b!1034516))

(declare-fun m!954393 () Bool)

(assert (=> b!1034513 m!954393))

(declare-fun m!954395 () Bool)

(assert (=> mapNonEmpty!38272 m!954395))

(declare-fun m!954397 () Bool)

(assert (=> start!90390 m!954397))

(declare-fun m!954399 () Bool)

(assert (=> b!1034516 m!954399))

(declare-fun m!954401 () Bool)

(assert (=> b!1034516 m!954401))

(check-sat (not start!90390) (not b!1034516) (not mapNonEmpty!38272) (not b_next!20803) b_and!33277 (not b!1034513) tp_is_empty!24523)
(check-sat b_and!33277 (not b_next!20803))
(get-model)

(declare-fun d!124275 () Bool)

(assert (=> d!124275 (= (array_inv!24237 (_keys!11411 thiss!1427)) (bvsge (size!31851 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034516 d!124275))

(declare-fun d!124277 () Bool)

(assert (=> d!124277 (= (array_inv!24238 (_values!6256 thiss!1427)) (bvsge (size!31852 (_values!6256 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034516 d!124277))

(declare-fun d!124279 () Bool)

(assert (=> d!124279 (= (validMask!0 (mask!30090 thiss!1427)) (and (or (= (mask!30090 thiss!1427) #b00000000000000000000000000000111) (= (mask!30090 thiss!1427) #b00000000000000000000000000001111) (= (mask!30090 thiss!1427) #b00000000000000000000000000011111) (= (mask!30090 thiss!1427) #b00000000000000000000000000111111) (= (mask!30090 thiss!1427) #b00000000000000000000000001111111) (= (mask!30090 thiss!1427) #b00000000000000000000000011111111) (= (mask!30090 thiss!1427) #b00000000000000000000000111111111) (= (mask!30090 thiss!1427) #b00000000000000000000001111111111) (= (mask!30090 thiss!1427) #b00000000000000000000011111111111) (= (mask!30090 thiss!1427) #b00000000000000000000111111111111) (= (mask!30090 thiss!1427) #b00000000000000000001111111111111) (= (mask!30090 thiss!1427) #b00000000000000000011111111111111) (= (mask!30090 thiss!1427) #b00000000000000000111111111111111) (= (mask!30090 thiss!1427) #b00000000000000001111111111111111) (= (mask!30090 thiss!1427) #b00000000000000011111111111111111) (= (mask!30090 thiss!1427) #b00000000000000111111111111111111) (= (mask!30090 thiss!1427) #b00000000000001111111111111111111) (= (mask!30090 thiss!1427) #b00000000000011111111111111111111) (= (mask!30090 thiss!1427) #b00000000000111111111111111111111) (= (mask!30090 thiss!1427) #b00000000001111111111111111111111) (= (mask!30090 thiss!1427) #b00000000011111111111111111111111) (= (mask!30090 thiss!1427) #b00000000111111111111111111111111) (= (mask!30090 thiss!1427) #b00000001111111111111111111111111) (= (mask!30090 thiss!1427) #b00000011111111111111111111111111) (= (mask!30090 thiss!1427) #b00000111111111111111111111111111) (= (mask!30090 thiss!1427) #b00001111111111111111111111111111) (= (mask!30090 thiss!1427) #b00011111111111111111111111111111) (= (mask!30090 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30090 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034513 d!124279))

(declare-fun d!124281 () Bool)

(declare-fun res!690950 () Bool)

(declare-fun e!584855 () Bool)

(assert (=> d!124281 (=> (not res!690950) (not e!584855))))

(declare-fun simpleValid!406 (LongMapFixedSize!5710) Bool)

(assert (=> d!124281 (= res!690950 (simpleValid!406 thiss!1427))))

(assert (=> d!124281 (= (valid!2147 thiss!1427) e!584855)))

(declare-fun b!1034559 () Bool)

(declare-fun res!690951 () Bool)

(assert (=> b!1034559 (=> (not res!690951) (not e!584855))))

(declare-fun arrayCountValidKeys!0 (array!65067 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034559 (= res!690951 (= (arrayCountValidKeys!0 (_keys!11411 thiss!1427) #b00000000000000000000000000000000 (size!31851 (_keys!11411 thiss!1427))) (_size!2910 thiss!1427)))))

(declare-fun b!1034560 () Bool)

(declare-fun res!690952 () Bool)

(assert (=> b!1034560 (=> (not res!690952) (not e!584855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65067 (_ BitVec 32)) Bool)

(assert (=> b!1034560 (= res!690952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11411 thiss!1427) (mask!30090 thiss!1427)))))

(declare-fun b!1034561 () Bool)

(declare-datatypes ((List!21942 0))(
  ( (Nil!21939) (Cons!21938 (h!23140 (_ BitVec 64)) (t!31136 List!21942)) )
))
(declare-fun arrayNoDuplicates!0 (array!65067 (_ BitVec 32) List!21942) Bool)

(assert (=> b!1034561 (= e!584855 (arrayNoDuplicates!0 (_keys!11411 thiss!1427) #b00000000000000000000000000000000 Nil!21939))))

(assert (= (and d!124281 res!690950) b!1034559))

(assert (= (and b!1034559 res!690951) b!1034560))

(assert (= (and b!1034560 res!690952) b!1034561))

(declare-fun m!954423 () Bool)

(assert (=> d!124281 m!954423))

(declare-fun m!954425 () Bool)

(assert (=> b!1034559 m!954425))

(declare-fun m!954427 () Bool)

(assert (=> b!1034560 m!954427))

(declare-fun m!954429 () Bool)

(assert (=> b!1034561 m!954429))

(assert (=> start!90390 d!124281))

(declare-fun mapIsEmpty!38281 () Bool)

(declare-fun mapRes!38281 () Bool)

(assert (=> mapIsEmpty!38281 mapRes!38281))

(declare-fun b!1034568 () Bool)

(declare-fun e!584860 () Bool)

(assert (=> b!1034568 (= e!584860 tp_is_empty!24523)))

(declare-fun condMapEmpty!38281 () Bool)

(declare-fun mapDefault!38281 () ValueCell!11558)

(assert (=> mapNonEmpty!38272 (= condMapEmpty!38281 (= mapRest!38272 ((as const (Array (_ BitVec 32) ValueCell!11558)) mapDefault!38281)))))

(declare-fun e!584861 () Bool)

(assert (=> mapNonEmpty!38272 (= tp!73514 (and e!584861 mapRes!38281))))

(declare-fun mapNonEmpty!38281 () Bool)

(declare-fun tp!73529 () Bool)

(assert (=> mapNonEmpty!38281 (= mapRes!38281 (and tp!73529 e!584860))))

(declare-fun mapRest!38281 () (Array (_ BitVec 32) ValueCell!11558))

(declare-fun mapKey!38281 () (_ BitVec 32))

(declare-fun mapValue!38281 () ValueCell!11558)

(assert (=> mapNonEmpty!38281 (= mapRest!38272 (store mapRest!38281 mapKey!38281 mapValue!38281))))

(declare-fun b!1034569 () Bool)

(assert (=> b!1034569 (= e!584861 tp_is_empty!24523)))

(assert (= (and mapNonEmpty!38272 condMapEmpty!38281) mapIsEmpty!38281))

(assert (= (and mapNonEmpty!38272 (not condMapEmpty!38281)) mapNonEmpty!38281))

(assert (= (and mapNonEmpty!38281 ((_ is ValueCellFull!11558) mapValue!38281)) b!1034568))

(assert (= (and mapNonEmpty!38272 ((_ is ValueCellFull!11558) mapDefault!38281)) b!1034569))

(declare-fun m!954431 () Bool)

(assert (=> mapNonEmpty!38281 m!954431))

(check-sat (not d!124281) (not b!1034561) (not mapNonEmpty!38281) b_and!33277 tp_is_empty!24523 (not b!1034560) (not b!1034559) (not b_next!20803))
(check-sat b_and!33277 (not b_next!20803))
(get-model)

(declare-fun b!1034580 () Bool)

(declare-fun e!584871 () Bool)

(declare-fun e!584870 () Bool)

(assert (=> b!1034580 (= e!584871 e!584870)))

(declare-fun res!690961 () Bool)

(assert (=> b!1034580 (=> (not res!690961) (not e!584870))))

(declare-fun e!584872 () Bool)

(assert (=> b!1034580 (= res!690961 (not e!584872))))

(declare-fun res!690959 () Bool)

(assert (=> b!1034580 (=> (not res!690959) (not e!584872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034580 (= res!690959 (validKeyInArray!0 (select (arr!31326 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034581 () Bool)

(declare-fun contains!5995 (List!21942 (_ BitVec 64)) Bool)

(assert (=> b!1034581 (= e!584872 (contains!5995 Nil!21939 (select (arr!31326 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124283 () Bool)

(declare-fun res!690960 () Bool)

(assert (=> d!124283 (=> res!690960 e!584871)))

(assert (=> d!124283 (= res!690960 (bvsge #b00000000000000000000000000000000 (size!31851 (_keys!11411 thiss!1427))))))

(assert (=> d!124283 (= (arrayNoDuplicates!0 (_keys!11411 thiss!1427) #b00000000000000000000000000000000 Nil!21939) e!584871)))

(declare-fun b!1034582 () Bool)

(declare-fun e!584873 () Bool)

(declare-fun call!43726 () Bool)

(assert (=> b!1034582 (= e!584873 call!43726)))

(declare-fun bm!43723 () Bool)

(declare-fun c!104640 () Bool)

(assert (=> bm!43723 (= call!43726 (arrayNoDuplicates!0 (_keys!11411 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104640 (Cons!21938 (select (arr!31326 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000) Nil!21939) Nil!21939)))))

(declare-fun b!1034583 () Bool)

(assert (=> b!1034583 (= e!584873 call!43726)))

(declare-fun b!1034584 () Bool)

(assert (=> b!1034584 (= e!584870 e!584873)))

(assert (=> b!1034584 (= c!104640 (validKeyInArray!0 (select (arr!31326 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124283 (not res!690960)) b!1034580))

(assert (= (and b!1034580 res!690959) b!1034581))

(assert (= (and b!1034580 res!690961) b!1034584))

(assert (= (and b!1034584 c!104640) b!1034583))

(assert (= (and b!1034584 (not c!104640)) b!1034582))

(assert (= (or b!1034583 b!1034582) bm!43723))

(declare-fun m!954433 () Bool)

(assert (=> b!1034580 m!954433))

(assert (=> b!1034580 m!954433))

(declare-fun m!954435 () Bool)

(assert (=> b!1034580 m!954435))

(assert (=> b!1034581 m!954433))

(assert (=> b!1034581 m!954433))

(declare-fun m!954437 () Bool)

(assert (=> b!1034581 m!954437))

(assert (=> bm!43723 m!954433))

(declare-fun m!954439 () Bool)

(assert (=> bm!43723 m!954439))

(assert (=> b!1034584 m!954433))

(assert (=> b!1034584 m!954433))

(assert (=> b!1034584 m!954435))

(assert (=> b!1034561 d!124283))

(declare-fun d!124285 () Bool)

(declare-fun res!690971 () Bool)

(declare-fun e!584876 () Bool)

(assert (=> d!124285 (=> (not res!690971) (not e!584876))))

(assert (=> d!124285 (= res!690971 (validMask!0 (mask!30090 thiss!1427)))))

(assert (=> d!124285 (= (simpleValid!406 thiss!1427) e!584876)))

(declare-fun b!1034596 () Bool)

(assert (=> b!1034596 (= e!584876 (and (bvsge (extraKeys!5963 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5963 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2910 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1034593 () Bool)

(declare-fun res!690970 () Bool)

(assert (=> b!1034593 (=> (not res!690970) (not e!584876))))

(assert (=> b!1034593 (= res!690970 (and (= (size!31852 (_values!6256 thiss!1427)) (bvadd (mask!30090 thiss!1427) #b00000000000000000000000000000001)) (= (size!31851 (_keys!11411 thiss!1427)) (size!31852 (_values!6256 thiss!1427))) (bvsge (_size!2910 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2910 thiss!1427) (bvadd (mask!30090 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1034595 () Bool)

(declare-fun res!690972 () Bool)

(assert (=> b!1034595 (=> (not res!690972) (not e!584876))))

(declare-fun size!31857 (LongMapFixedSize!5710) (_ BitVec 32))

(assert (=> b!1034595 (= res!690972 (= (size!31857 thiss!1427) (bvadd (_size!2910 thiss!1427) (bvsdiv (bvadd (extraKeys!5963 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1034594 () Bool)

(declare-fun res!690973 () Bool)

(assert (=> b!1034594 (=> (not res!690973) (not e!584876))))

(assert (=> b!1034594 (= res!690973 (bvsge (size!31857 thiss!1427) (_size!2910 thiss!1427)))))

(assert (= (and d!124285 res!690971) b!1034593))

(assert (= (and b!1034593 res!690970) b!1034594))

(assert (= (and b!1034594 res!690973) b!1034595))

(assert (= (and b!1034595 res!690972) b!1034596))

(assert (=> d!124285 m!954393))

(declare-fun m!954441 () Bool)

(assert (=> b!1034595 m!954441))

(assert (=> b!1034594 m!954441))

(assert (=> d!124281 d!124285))

(declare-fun b!1034605 () Bool)

(declare-fun e!584882 () (_ BitVec 32))

(declare-fun e!584881 () (_ BitVec 32))

(assert (=> b!1034605 (= e!584882 e!584881)))

(declare-fun c!104646 () Bool)

(assert (=> b!1034605 (= c!104646 (validKeyInArray!0 (select (arr!31326 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43726 () Bool)

(declare-fun call!43729 () (_ BitVec 32))

(assert (=> bm!43726 (= call!43729 (arrayCountValidKeys!0 (_keys!11411 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31851 (_keys!11411 thiss!1427))))))

(declare-fun b!1034606 () Bool)

(assert (=> b!1034606 (= e!584881 (bvadd #b00000000000000000000000000000001 call!43729))))

(declare-fun d!124287 () Bool)

(declare-fun lt!456499 () (_ BitVec 32))

(assert (=> d!124287 (and (bvsge lt!456499 #b00000000000000000000000000000000) (bvsle lt!456499 (bvsub (size!31851 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124287 (= lt!456499 e!584882)))

(declare-fun c!104645 () Bool)

(assert (=> d!124287 (= c!104645 (bvsge #b00000000000000000000000000000000 (size!31851 (_keys!11411 thiss!1427))))))

(assert (=> d!124287 (and (bvsle #b00000000000000000000000000000000 (size!31851 (_keys!11411 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31851 (_keys!11411 thiss!1427)) (size!31851 (_keys!11411 thiss!1427))))))

(assert (=> d!124287 (= (arrayCountValidKeys!0 (_keys!11411 thiss!1427) #b00000000000000000000000000000000 (size!31851 (_keys!11411 thiss!1427))) lt!456499)))

(declare-fun b!1034607 () Bool)

(assert (=> b!1034607 (= e!584881 call!43729)))

(declare-fun b!1034608 () Bool)

(assert (=> b!1034608 (= e!584882 #b00000000000000000000000000000000)))

(assert (= (and d!124287 c!104645) b!1034608))

(assert (= (and d!124287 (not c!104645)) b!1034605))

(assert (= (and b!1034605 c!104646) b!1034606))

(assert (= (and b!1034605 (not c!104646)) b!1034607))

(assert (= (or b!1034606 b!1034607) bm!43726))

(assert (=> b!1034605 m!954433))

(assert (=> b!1034605 m!954433))

(assert (=> b!1034605 m!954435))

(declare-fun m!954443 () Bool)

(assert (=> bm!43726 m!954443))

(assert (=> b!1034559 d!124287))

(declare-fun bm!43729 () Bool)

(declare-fun call!43732 () Bool)

(assert (=> bm!43729 (= call!43732 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11411 thiss!1427) (mask!30090 thiss!1427)))))

(declare-fun b!1034617 () Bool)

(declare-fun e!584889 () Bool)

(assert (=> b!1034617 (= e!584889 call!43732)))

(declare-fun d!124289 () Bool)

(declare-fun res!690978 () Bool)

(declare-fun e!584891 () Bool)

(assert (=> d!124289 (=> res!690978 e!584891)))

(assert (=> d!124289 (= res!690978 (bvsge #b00000000000000000000000000000000 (size!31851 (_keys!11411 thiss!1427))))))

(assert (=> d!124289 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11411 thiss!1427) (mask!30090 thiss!1427)) e!584891)))

(declare-fun b!1034618 () Bool)

(declare-fun e!584890 () Bool)

(assert (=> b!1034618 (= e!584890 call!43732)))

(declare-fun b!1034619 () Bool)

(assert (=> b!1034619 (= e!584891 e!584890)))

(declare-fun c!104649 () Bool)

(assert (=> b!1034619 (= c!104649 (validKeyInArray!0 (select (arr!31326 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034620 () Bool)

(assert (=> b!1034620 (= e!584890 e!584889)))

(declare-fun lt!456506 () (_ BitVec 64))

(assert (=> b!1034620 (= lt!456506 (select (arr!31326 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33760 0))(
  ( (Unit!33761) )
))
(declare-fun lt!456507 () Unit!33760)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65067 (_ BitVec 64) (_ BitVec 32)) Unit!33760)

(assert (=> b!1034620 (= lt!456507 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11411 thiss!1427) lt!456506 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034620 (arrayContainsKey!0 (_keys!11411 thiss!1427) lt!456506 #b00000000000000000000000000000000)))

(declare-fun lt!456508 () Unit!33760)

(assert (=> b!1034620 (= lt!456508 lt!456507)))

(declare-fun res!690979 () Bool)

(declare-datatypes ((SeekEntryResult!9730 0))(
  ( (MissingZero!9730 (index!41291 (_ BitVec 32))) (Found!9730 (index!41292 (_ BitVec 32))) (Intermediate!9730 (undefined!10542 Bool) (index!41293 (_ BitVec 32)) (x!92244 (_ BitVec 32))) (Undefined!9730) (MissingVacant!9730 (index!41294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65067 (_ BitVec 32)) SeekEntryResult!9730)

(assert (=> b!1034620 (= res!690979 (= (seekEntryOrOpen!0 (select (arr!31326 (_keys!11411 thiss!1427)) #b00000000000000000000000000000000) (_keys!11411 thiss!1427) (mask!30090 thiss!1427)) (Found!9730 #b00000000000000000000000000000000)))))

(assert (=> b!1034620 (=> (not res!690979) (not e!584889))))

(assert (= (and d!124289 (not res!690978)) b!1034619))

(assert (= (and b!1034619 c!104649) b!1034620))

(assert (= (and b!1034619 (not c!104649)) b!1034618))

(assert (= (and b!1034620 res!690979) b!1034617))

(assert (= (or b!1034617 b!1034618) bm!43729))

(declare-fun m!954445 () Bool)

(assert (=> bm!43729 m!954445))

(assert (=> b!1034619 m!954433))

(assert (=> b!1034619 m!954433))

(assert (=> b!1034619 m!954435))

(assert (=> b!1034620 m!954433))

(declare-fun m!954447 () Bool)

(assert (=> b!1034620 m!954447))

(declare-fun m!954449 () Bool)

(assert (=> b!1034620 m!954449))

(assert (=> b!1034620 m!954433))

(declare-fun m!954451 () Bool)

(assert (=> b!1034620 m!954451))

(assert (=> b!1034560 d!124289))

(declare-fun mapIsEmpty!38282 () Bool)

(declare-fun mapRes!38282 () Bool)

(assert (=> mapIsEmpty!38282 mapRes!38282))

(declare-fun b!1034621 () Bool)

(declare-fun e!584892 () Bool)

(assert (=> b!1034621 (= e!584892 tp_is_empty!24523)))

(declare-fun condMapEmpty!38282 () Bool)

(declare-fun mapDefault!38282 () ValueCell!11558)

(assert (=> mapNonEmpty!38281 (= condMapEmpty!38282 (= mapRest!38281 ((as const (Array (_ BitVec 32) ValueCell!11558)) mapDefault!38282)))))

(declare-fun e!584893 () Bool)

(assert (=> mapNonEmpty!38281 (= tp!73529 (and e!584893 mapRes!38282))))

(declare-fun mapNonEmpty!38282 () Bool)

(declare-fun tp!73530 () Bool)

(assert (=> mapNonEmpty!38282 (= mapRes!38282 (and tp!73530 e!584892))))

(declare-fun mapValue!38282 () ValueCell!11558)

(declare-fun mapRest!38282 () (Array (_ BitVec 32) ValueCell!11558))

(declare-fun mapKey!38282 () (_ BitVec 32))

(assert (=> mapNonEmpty!38282 (= mapRest!38281 (store mapRest!38282 mapKey!38282 mapValue!38282))))

(declare-fun b!1034622 () Bool)

(assert (=> b!1034622 (= e!584893 tp_is_empty!24523)))

(assert (= (and mapNonEmpty!38281 condMapEmpty!38282) mapIsEmpty!38282))

(assert (= (and mapNonEmpty!38281 (not condMapEmpty!38282)) mapNonEmpty!38282))

(assert (= (and mapNonEmpty!38282 ((_ is ValueCellFull!11558) mapValue!38282)) b!1034621))

(assert (= (and mapNonEmpty!38281 ((_ is ValueCellFull!11558) mapDefault!38282)) b!1034622))

(declare-fun m!954453 () Bool)

(assert (=> mapNonEmpty!38282 m!954453))

(check-sat (not b!1034594) (not b!1034584) (not mapNonEmpty!38282) (not b!1034580) (not bm!43723) (not b!1034581) (not b_next!20803) (not b!1034619) (not bm!43726) (not d!124285) (not b!1034605) (not b!1034595) b_and!33277 (not bm!43729) tp_is_empty!24523 (not b!1034620))
(check-sat b_and!33277 (not b_next!20803))
