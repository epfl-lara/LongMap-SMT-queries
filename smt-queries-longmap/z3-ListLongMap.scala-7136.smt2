; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90558 () Bool)

(assert start!90558)

(declare-fun b!1035789 () Bool)

(declare-fun b_free!20871 () Bool)

(declare-fun b_next!20871 () Bool)

(assert (=> b!1035789 (= b_free!20871 (not b_next!20871))))

(declare-fun tp!73743 () Bool)

(declare-fun b_and!33371 () Bool)

(assert (=> b!1035789 (= tp!73743 b_and!33371)))

(declare-fun b!1035784 () Bool)

(declare-fun res!691520 () Bool)

(declare-fun e!585749 () Bool)

(assert (=> b!1035784 (=> (not res!691520) (not e!585749))))

(declare-datatypes ((V!37661 0))(
  ( (V!37662 (val!12346 Int)) )
))
(declare-datatypes ((ValueCell!11592 0))(
  ( (ValueCellFull!11592 (v!14926 V!37661)) (EmptyCell!11592) )
))
(declare-datatypes ((array!65278 0))(
  ( (array!65279 (arr!31425 (Array (_ BitVec 32) (_ BitVec 64))) (size!31953 (_ BitVec 32))) )
))
(declare-datatypes ((array!65280 0))(
  ( (array!65281 (arr!31426 (Array (_ BitVec 32) ValueCell!11592)) (size!31954 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5778 0))(
  ( (LongMapFixedSize!5779 (defaultEntry!6267 Int) (mask!30164 (_ BitVec 32)) (extraKeys!5997 (_ BitVec 32)) (zeroValue!6101 V!37661) (minValue!6103 V!37661) (_size!2944 (_ BitVec 32)) (_keys!11455 array!65278) (_values!6290 array!65280) (_vacant!2944 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5778)

(assert (=> b!1035784 (= res!691520 (and (= (size!31954 (_values!6290 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30164 thiss!1427))) (= (size!31953 (_keys!11455 thiss!1427)) (size!31954 (_values!6290 thiss!1427))) (bvsge (mask!30164 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5997 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5997 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5997 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5997 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5997 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5997 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5997 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!691522 () Bool)

(assert (=> start!90558 (=> (not res!691522) (not e!585749))))

(declare-fun valid!2180 (LongMapFixedSize!5778) Bool)

(assert (=> start!90558 (= res!691522 (valid!2180 thiss!1427))))

(assert (=> start!90558 e!585749))

(declare-fun e!585751 () Bool)

(assert (=> start!90558 e!585751))

(assert (=> start!90558 true))

(declare-fun b!1035785 () Bool)

(declare-fun e!585748 () Bool)

(declare-fun tp_is_empty!24591 () Bool)

(assert (=> b!1035785 (= e!585748 tp_is_empty!24591)))

(declare-fun b!1035786 () Bool)

(declare-fun res!691523 () Bool)

(assert (=> b!1035786 (=> (not res!691523) (not e!585749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65278 (_ BitVec 32)) Bool)

(assert (=> b!1035786 (= res!691523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11455 thiss!1427) (mask!30164 thiss!1427)))))

(declare-fun b!1035787 () Bool)

(declare-fun e!585747 () Bool)

(assert (=> b!1035787 (= e!585747 tp_is_empty!24591)))

(declare-fun mapNonEmpty!38400 () Bool)

(declare-fun mapRes!38400 () Bool)

(declare-fun tp!73744 () Bool)

(assert (=> mapNonEmpty!38400 (= mapRes!38400 (and tp!73744 e!585748))))

(declare-fun mapKey!38400 () (_ BitVec 32))

(declare-fun mapRest!38400 () (Array (_ BitVec 32) ValueCell!11592))

(declare-fun mapValue!38400 () ValueCell!11592)

(assert (=> mapNonEmpty!38400 (= (arr!31426 (_values!6290 thiss!1427)) (store mapRest!38400 mapKey!38400 mapValue!38400))))

(declare-fun b!1035788 () Bool)

(declare-datatypes ((List!21916 0))(
  ( (Nil!21913) (Cons!21912 (h!23114 (_ BitVec 64)) (t!31119 List!21916)) )
))
(declare-fun arrayNoDuplicates!0 (array!65278 (_ BitVec 32) List!21916) Bool)

(assert (=> b!1035788 (= e!585749 (not (arrayNoDuplicates!0 (_keys!11455 thiss!1427) #b00000000000000000000000000000000 Nil!21913)))))

(declare-fun e!585750 () Bool)

(declare-fun array_inv!24313 (array!65278) Bool)

(declare-fun array_inv!24314 (array!65280) Bool)

(assert (=> b!1035789 (= e!585751 (and tp!73743 tp_is_empty!24591 (array_inv!24313 (_keys!11455 thiss!1427)) (array_inv!24314 (_values!6290 thiss!1427)) e!585750))))

(declare-fun mapIsEmpty!38400 () Bool)

(assert (=> mapIsEmpty!38400 mapRes!38400))

(declare-fun b!1035790 () Bool)

(assert (=> b!1035790 (= e!585750 (and e!585747 mapRes!38400))))

(declare-fun condMapEmpty!38400 () Bool)

(declare-fun mapDefault!38400 () ValueCell!11592)

(assert (=> b!1035790 (= condMapEmpty!38400 (= (arr!31426 (_values!6290 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11592)) mapDefault!38400)))))

(declare-fun b!1035791 () Bool)

(declare-fun res!691521 () Bool)

(assert (=> b!1035791 (=> (not res!691521) (not e!585749))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035791 (= res!691521 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035792 () Bool)

(declare-fun res!691519 () Bool)

(assert (=> b!1035792 (=> (not res!691519) (not e!585749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035792 (= res!691519 (validMask!0 (mask!30164 thiss!1427)))))

(assert (= (and start!90558 res!691522) b!1035791))

(assert (= (and b!1035791 res!691521) b!1035792))

(assert (= (and b!1035792 res!691519) b!1035784))

(assert (= (and b!1035784 res!691520) b!1035786))

(assert (= (and b!1035786 res!691523) b!1035788))

(assert (= (and b!1035790 condMapEmpty!38400) mapIsEmpty!38400))

(assert (= (and b!1035790 (not condMapEmpty!38400)) mapNonEmpty!38400))

(get-info :version)

(assert (= (and mapNonEmpty!38400 ((_ is ValueCellFull!11592) mapValue!38400)) b!1035785))

(assert (= (and b!1035790 ((_ is ValueCellFull!11592) mapDefault!38400)) b!1035787))

(assert (= b!1035789 b!1035790))

(assert (= start!90558 b!1035789))

(declare-fun m!955553 () Bool)

(assert (=> b!1035789 m!955553))

(declare-fun m!955555 () Bool)

(assert (=> b!1035789 m!955555))

(declare-fun m!955557 () Bool)

(assert (=> start!90558 m!955557))

(declare-fun m!955559 () Bool)

(assert (=> b!1035786 m!955559))

(declare-fun m!955561 () Bool)

(assert (=> mapNonEmpty!38400 m!955561))

(declare-fun m!955563 () Bool)

(assert (=> b!1035792 m!955563))

(declare-fun m!955565 () Bool)

(assert (=> b!1035788 m!955565))

(check-sat tp_is_empty!24591 (not b!1035788) (not b!1035789) b_and!33371 (not b!1035786) (not mapNonEmpty!38400) (not start!90558) (not b!1035792) (not b_next!20871))
(check-sat b_and!33371 (not b_next!20871))
(get-model)

(declare-fun b!1035830 () Bool)

(declare-fun e!585780 () Bool)

(declare-fun call!43797 () Bool)

(assert (=> b!1035830 (= e!585780 call!43797)))

(declare-fun b!1035831 () Bool)

(declare-fun e!585781 () Bool)

(declare-fun e!585779 () Bool)

(assert (=> b!1035831 (= e!585781 e!585779)))

(declare-fun res!691545 () Bool)

(assert (=> b!1035831 (=> (not res!691545) (not e!585779))))

(declare-fun e!585778 () Bool)

(assert (=> b!1035831 (= res!691545 (not e!585778))))

(declare-fun res!691547 () Bool)

(assert (=> b!1035831 (=> (not res!691547) (not e!585778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035831 (= res!691547 (validKeyInArray!0 (select (arr!31425 (_keys!11455 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035832 () Bool)

(declare-fun contains!6020 (List!21916 (_ BitVec 64)) Bool)

(assert (=> b!1035832 (= e!585778 (contains!6020 Nil!21913 (select (arr!31425 (_keys!11455 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43794 () Bool)

(declare-fun c!104742 () Bool)

(assert (=> bm!43794 (= call!43797 (arrayNoDuplicates!0 (_keys!11455 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104742 (Cons!21912 (select (arr!31425 (_keys!11455 thiss!1427)) #b00000000000000000000000000000000) Nil!21913) Nil!21913)))))

(declare-fun d!124545 () Bool)

(declare-fun res!691546 () Bool)

(assert (=> d!124545 (=> res!691546 e!585781)))

(assert (=> d!124545 (= res!691546 (bvsge #b00000000000000000000000000000000 (size!31953 (_keys!11455 thiss!1427))))))

(assert (=> d!124545 (= (arrayNoDuplicates!0 (_keys!11455 thiss!1427) #b00000000000000000000000000000000 Nil!21913) e!585781)))

(declare-fun b!1035833 () Bool)

(assert (=> b!1035833 (= e!585780 call!43797)))

(declare-fun b!1035834 () Bool)

(assert (=> b!1035834 (= e!585779 e!585780)))

(assert (=> b!1035834 (= c!104742 (validKeyInArray!0 (select (arr!31425 (_keys!11455 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124545 (not res!691546)) b!1035831))

(assert (= (and b!1035831 res!691547) b!1035832))

(assert (= (and b!1035831 res!691545) b!1035834))

(assert (= (and b!1035834 c!104742) b!1035830))

(assert (= (and b!1035834 (not c!104742)) b!1035833))

(assert (= (or b!1035830 b!1035833) bm!43794))

(declare-fun m!955581 () Bool)

(assert (=> b!1035831 m!955581))

(assert (=> b!1035831 m!955581))

(declare-fun m!955583 () Bool)

(assert (=> b!1035831 m!955583))

(assert (=> b!1035832 m!955581))

(assert (=> b!1035832 m!955581))

(declare-fun m!955585 () Bool)

(assert (=> b!1035832 m!955585))

(assert (=> bm!43794 m!955581))

(declare-fun m!955587 () Bool)

(assert (=> bm!43794 m!955587))

(assert (=> b!1035834 m!955581))

(assert (=> b!1035834 m!955581))

(assert (=> b!1035834 m!955583))

(assert (=> b!1035788 d!124545))

(declare-fun d!124547 () Bool)

(assert (=> d!124547 (= (validMask!0 (mask!30164 thiss!1427)) (and (or (= (mask!30164 thiss!1427) #b00000000000000000000000000000111) (= (mask!30164 thiss!1427) #b00000000000000000000000000001111) (= (mask!30164 thiss!1427) #b00000000000000000000000000011111) (= (mask!30164 thiss!1427) #b00000000000000000000000000111111) (= (mask!30164 thiss!1427) #b00000000000000000000000001111111) (= (mask!30164 thiss!1427) #b00000000000000000000000011111111) (= (mask!30164 thiss!1427) #b00000000000000000000000111111111) (= (mask!30164 thiss!1427) #b00000000000000000000001111111111) (= (mask!30164 thiss!1427) #b00000000000000000000011111111111) (= (mask!30164 thiss!1427) #b00000000000000000000111111111111) (= (mask!30164 thiss!1427) #b00000000000000000001111111111111) (= (mask!30164 thiss!1427) #b00000000000000000011111111111111) (= (mask!30164 thiss!1427) #b00000000000000000111111111111111) (= (mask!30164 thiss!1427) #b00000000000000001111111111111111) (= (mask!30164 thiss!1427) #b00000000000000011111111111111111) (= (mask!30164 thiss!1427) #b00000000000000111111111111111111) (= (mask!30164 thiss!1427) #b00000000000001111111111111111111) (= (mask!30164 thiss!1427) #b00000000000011111111111111111111) (= (mask!30164 thiss!1427) #b00000000000111111111111111111111) (= (mask!30164 thiss!1427) #b00000000001111111111111111111111) (= (mask!30164 thiss!1427) #b00000000011111111111111111111111) (= (mask!30164 thiss!1427) #b00000000111111111111111111111111) (= (mask!30164 thiss!1427) #b00000001111111111111111111111111) (= (mask!30164 thiss!1427) #b00000011111111111111111111111111) (= (mask!30164 thiss!1427) #b00000111111111111111111111111111) (= (mask!30164 thiss!1427) #b00001111111111111111111111111111) (= (mask!30164 thiss!1427) #b00011111111111111111111111111111) (= (mask!30164 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30164 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035792 d!124547))

(declare-fun d!124549 () Bool)

(declare-fun res!691554 () Bool)

(declare-fun e!585784 () Bool)

(assert (=> d!124549 (=> (not res!691554) (not e!585784))))

(declare-fun simpleValid!413 (LongMapFixedSize!5778) Bool)

(assert (=> d!124549 (= res!691554 (simpleValid!413 thiss!1427))))

(assert (=> d!124549 (= (valid!2180 thiss!1427) e!585784)))

(declare-fun b!1035841 () Bool)

(declare-fun res!691555 () Bool)

(assert (=> b!1035841 (=> (not res!691555) (not e!585784))))

(declare-fun arrayCountValidKeys!0 (array!65278 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035841 (= res!691555 (= (arrayCountValidKeys!0 (_keys!11455 thiss!1427) #b00000000000000000000000000000000 (size!31953 (_keys!11455 thiss!1427))) (_size!2944 thiss!1427)))))

(declare-fun b!1035842 () Bool)

(declare-fun res!691556 () Bool)

(assert (=> b!1035842 (=> (not res!691556) (not e!585784))))

(assert (=> b!1035842 (= res!691556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11455 thiss!1427) (mask!30164 thiss!1427)))))

(declare-fun b!1035843 () Bool)

(assert (=> b!1035843 (= e!585784 (arrayNoDuplicates!0 (_keys!11455 thiss!1427) #b00000000000000000000000000000000 Nil!21913))))

(assert (= (and d!124549 res!691554) b!1035841))

(assert (= (and b!1035841 res!691555) b!1035842))

(assert (= (and b!1035842 res!691556) b!1035843))

(declare-fun m!955589 () Bool)

(assert (=> d!124549 m!955589))

(declare-fun m!955591 () Bool)

(assert (=> b!1035841 m!955591))

(assert (=> b!1035842 m!955559))

(assert (=> b!1035843 m!955565))

(assert (=> start!90558 d!124549))

(declare-fun bm!43797 () Bool)

(declare-fun call!43800 () Bool)

(assert (=> bm!43797 (= call!43800 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11455 thiss!1427) (mask!30164 thiss!1427)))))

(declare-fun b!1035852 () Bool)

(declare-fun e!585793 () Bool)

(declare-fun e!585792 () Bool)

(assert (=> b!1035852 (= e!585793 e!585792)))

(declare-fun lt!456774 () (_ BitVec 64))

(assert (=> b!1035852 (= lt!456774 (select (arr!31425 (_keys!11455 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33892 0))(
  ( (Unit!33893) )
))
(declare-fun lt!456772 () Unit!33892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65278 (_ BitVec 64) (_ BitVec 32)) Unit!33892)

(assert (=> b!1035852 (= lt!456772 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11455 thiss!1427) lt!456774 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035852 (arrayContainsKey!0 (_keys!11455 thiss!1427) lt!456774 #b00000000000000000000000000000000)))

(declare-fun lt!456773 () Unit!33892)

(assert (=> b!1035852 (= lt!456773 lt!456772)))

(declare-fun res!691561 () Bool)

(declare-datatypes ((SeekEntryResult!9745 0))(
  ( (MissingZero!9745 (index!41351 (_ BitVec 32))) (Found!9745 (index!41352 (_ BitVec 32))) (Intermediate!9745 (undefined!10557 Bool) (index!41353 (_ BitVec 32)) (x!92430 (_ BitVec 32))) (Undefined!9745) (MissingVacant!9745 (index!41354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65278 (_ BitVec 32)) SeekEntryResult!9745)

(assert (=> b!1035852 (= res!691561 (= (seekEntryOrOpen!0 (select (arr!31425 (_keys!11455 thiss!1427)) #b00000000000000000000000000000000) (_keys!11455 thiss!1427) (mask!30164 thiss!1427)) (Found!9745 #b00000000000000000000000000000000)))))

(assert (=> b!1035852 (=> (not res!691561) (not e!585792))))

(declare-fun d!124551 () Bool)

(declare-fun res!691562 () Bool)

(declare-fun e!585791 () Bool)

(assert (=> d!124551 (=> res!691562 e!585791)))

(assert (=> d!124551 (= res!691562 (bvsge #b00000000000000000000000000000000 (size!31953 (_keys!11455 thiss!1427))))))

(assert (=> d!124551 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11455 thiss!1427) (mask!30164 thiss!1427)) e!585791)))

(declare-fun b!1035853 () Bool)

(assert (=> b!1035853 (= e!585791 e!585793)))

(declare-fun c!104745 () Bool)

(assert (=> b!1035853 (= c!104745 (validKeyInArray!0 (select (arr!31425 (_keys!11455 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035854 () Bool)

(assert (=> b!1035854 (= e!585793 call!43800)))

(declare-fun b!1035855 () Bool)

(assert (=> b!1035855 (= e!585792 call!43800)))

(assert (= (and d!124551 (not res!691562)) b!1035853))

(assert (= (and b!1035853 c!104745) b!1035852))

(assert (= (and b!1035853 (not c!104745)) b!1035854))

(assert (= (and b!1035852 res!691561) b!1035855))

(assert (= (or b!1035855 b!1035854) bm!43797))

(declare-fun m!955593 () Bool)

(assert (=> bm!43797 m!955593))

(assert (=> b!1035852 m!955581))

(declare-fun m!955595 () Bool)

(assert (=> b!1035852 m!955595))

(declare-fun m!955597 () Bool)

(assert (=> b!1035852 m!955597))

(assert (=> b!1035852 m!955581))

(declare-fun m!955599 () Bool)

(assert (=> b!1035852 m!955599))

(assert (=> b!1035853 m!955581))

(assert (=> b!1035853 m!955581))

(assert (=> b!1035853 m!955583))

(assert (=> b!1035786 d!124551))

(declare-fun d!124553 () Bool)

(assert (=> d!124553 (= (array_inv!24313 (_keys!11455 thiss!1427)) (bvsge (size!31953 (_keys!11455 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035789 d!124553))

(declare-fun d!124555 () Bool)

(assert (=> d!124555 (= (array_inv!24314 (_values!6290 thiss!1427)) (bvsge (size!31954 (_values!6290 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035789 d!124555))

(declare-fun b!1035863 () Bool)

(declare-fun e!585799 () Bool)

(assert (=> b!1035863 (= e!585799 tp_is_empty!24591)))

(declare-fun b!1035862 () Bool)

(declare-fun e!585798 () Bool)

(assert (=> b!1035862 (= e!585798 tp_is_empty!24591)))

(declare-fun condMapEmpty!38406 () Bool)

(declare-fun mapDefault!38406 () ValueCell!11592)

(assert (=> mapNonEmpty!38400 (= condMapEmpty!38406 (= mapRest!38400 ((as const (Array (_ BitVec 32) ValueCell!11592)) mapDefault!38406)))))

(declare-fun mapRes!38406 () Bool)

(assert (=> mapNonEmpty!38400 (= tp!73744 (and e!585799 mapRes!38406))))

(declare-fun mapNonEmpty!38406 () Bool)

(declare-fun tp!73753 () Bool)

(assert (=> mapNonEmpty!38406 (= mapRes!38406 (and tp!73753 e!585798))))

(declare-fun mapValue!38406 () ValueCell!11592)

(declare-fun mapKey!38406 () (_ BitVec 32))

(declare-fun mapRest!38406 () (Array (_ BitVec 32) ValueCell!11592))

(assert (=> mapNonEmpty!38406 (= mapRest!38400 (store mapRest!38406 mapKey!38406 mapValue!38406))))

(declare-fun mapIsEmpty!38406 () Bool)

(assert (=> mapIsEmpty!38406 mapRes!38406))

(assert (= (and mapNonEmpty!38400 condMapEmpty!38406) mapIsEmpty!38406))

(assert (= (and mapNonEmpty!38400 (not condMapEmpty!38406)) mapNonEmpty!38406))

(assert (= (and mapNonEmpty!38406 ((_ is ValueCellFull!11592) mapValue!38406)) b!1035862))

(assert (= (and mapNonEmpty!38400 ((_ is ValueCellFull!11592) mapDefault!38406)) b!1035863))

(declare-fun m!955601 () Bool)

(assert (=> mapNonEmpty!38406 m!955601))

(check-sat (not mapNonEmpty!38406) (not bm!43794) tp_is_empty!24591 (not b!1035832) (not b!1035831) (not b!1035843) b_and!33371 (not d!124549) (not bm!43797) (not b!1035853) (not b!1035834) (not b!1035842) (not b!1035841) (not b!1035852) (not b_next!20871))
(check-sat b_and!33371 (not b_next!20871))
