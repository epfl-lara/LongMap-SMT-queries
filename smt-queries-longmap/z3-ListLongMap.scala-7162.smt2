; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91230 () Bool)

(assert start!91230)

(declare-fun b!1040870 () Bool)

(declare-fun b_free!21027 () Bool)

(declare-fun b_next!21027 () Bool)

(assert (=> b!1040870 (= b_free!21027 (not b_next!21027))))

(declare-fun tp!74284 () Bool)

(declare-fun b_and!33559 () Bool)

(assert (=> b!1040870 (= tp!74284 b_and!33559)))

(declare-fun b!1040866 () Bool)

(declare-fun e!589378 () Bool)

(declare-fun tp_is_empty!24747 () Bool)

(assert (=> b!1040866 (= e!589378 tp_is_empty!24747)))

(declare-fun b!1040867 () Bool)

(declare-fun e!589377 () Bool)

(declare-datatypes ((V!37869 0))(
  ( (V!37870 (val!12424 Int)) )
))
(declare-datatypes ((ValueCell!11670 0))(
  ( (ValueCellFull!11670 (v!15011 V!37869)) (EmptyCell!11670) )
))
(declare-datatypes ((array!65636 0))(
  ( (array!65637 (arr!31581 (Array (_ BitVec 32) (_ BitVec 64))) (size!32112 (_ BitVec 32))) )
))
(declare-datatypes ((array!65638 0))(
  ( (array!65639 (arr!31582 (Array (_ BitVec 32) ValueCell!11670)) (size!32113 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5934 0))(
  ( (LongMapFixedSize!5935 (defaultEntry!6349 Int) (mask!30356 (_ BitVec 32)) (extraKeys!6077 (_ BitVec 32)) (zeroValue!6183 V!37869) (minValue!6183 V!37869) (_size!3022 (_ BitVec 32)) (_keys!11575 array!65636) (_values!6372 array!65638) (_vacant!3022 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5934)

(assert (=> b!1040867 (= e!589377 (= (size!32113 (_values!6372 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30356 thiss!1427))))))

(declare-fun mapIsEmpty!38707 () Bool)

(declare-fun mapRes!38707 () Bool)

(assert (=> mapIsEmpty!38707 mapRes!38707))

(declare-fun b!1040868 () Bool)

(declare-fun e!589375 () Bool)

(assert (=> b!1040868 (= e!589375 (not e!589377))))

(declare-fun res!693869 () Bool)

(assert (=> b!1040868 (=> res!693869 e!589377)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040868 (= res!693869 (not (validMask!0 (mask!30356 thiss!1427))))))

(declare-fun lt!458756 () array!65636)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040868 (not (arrayContainsKey!0 lt!458756 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34025 0))(
  ( (Unit!34026) )
))
(declare-fun lt!458757 () Unit!34025)

(declare-datatypes ((SeekEntryResult!9802 0))(
  ( (MissingZero!9802 (index!41579 (_ BitVec 32))) (Found!9802 (index!41580 (_ BitVec 32))) (Intermediate!9802 (undefined!10614 Bool) (index!41581 (_ BitVec 32)) (x!92922 (_ BitVec 32))) (Undefined!9802) (MissingVacant!9802 (index!41582 (_ BitVec 32))) )
))
(declare-fun lt!458755 () SeekEntryResult!9802)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65636 (_ BitVec 32) (_ BitVec 64)) Unit!34025)

(assert (=> b!1040868 (= lt!458757 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11575 thiss!1427) (index!41580 lt!458755) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65636 (_ BitVec 32)) Bool)

(assert (=> b!1040868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458756 (mask!30356 thiss!1427))))

(declare-fun lt!458758 () Unit!34025)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65636 (_ BitVec 32) (_ BitVec 32)) Unit!34025)

(assert (=> b!1040868 (= lt!458758 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11575 thiss!1427) (index!41580 lt!458755) (mask!30356 thiss!1427)))))

(declare-datatypes ((List!21964 0))(
  ( (Nil!21961) (Cons!21960 (h!23164 (_ BitVec 64)) (t!31178 List!21964)) )
))
(declare-fun arrayNoDuplicates!0 (array!65636 (_ BitVec 32) List!21964) Bool)

(assert (=> b!1040868 (arrayNoDuplicates!0 lt!458756 #b00000000000000000000000000000000 Nil!21961)))

(declare-fun lt!458759 () Unit!34025)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65636 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21964) Unit!34025)

(assert (=> b!1040868 (= lt!458759 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11575 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41580 lt!458755) #b00000000000000000000000000000000 Nil!21961))))

(declare-fun arrayCountValidKeys!0 (array!65636 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040868 (= (arrayCountValidKeys!0 lt!458756 #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11575 thiss!1427) #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040868 (= lt!458756 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun lt!458760 () Unit!34025)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65636 (_ BitVec 32) (_ BitVec 64)) Unit!34025)

(assert (=> b!1040868 (= lt!458760 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11575 thiss!1427) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38707 () Bool)

(declare-fun tp!74285 () Bool)

(declare-fun e!589372 () Bool)

(assert (=> mapNonEmpty!38707 (= mapRes!38707 (and tp!74285 e!589372))))

(declare-fun mapKey!38707 () (_ BitVec 32))

(declare-fun mapRest!38707 () (Array (_ BitVec 32) ValueCell!11670))

(declare-fun mapValue!38707 () ValueCell!11670)

(assert (=> mapNonEmpty!38707 (= (arr!31582 (_values!6372 thiss!1427)) (store mapRest!38707 mapKey!38707 mapValue!38707))))

(declare-fun b!1040869 () Bool)

(declare-fun res!693871 () Bool)

(declare-fun e!589374 () Bool)

(assert (=> b!1040869 (=> (not res!693871) (not e!589374))))

(assert (=> b!1040869 (= res!693871 (not (= key!909 (bvneg key!909))))))

(declare-fun e!589376 () Bool)

(declare-fun e!589373 () Bool)

(declare-fun array_inv!24399 (array!65636) Bool)

(declare-fun array_inv!24400 (array!65638) Bool)

(assert (=> b!1040870 (= e!589373 (and tp!74284 tp_is_empty!24747 (array_inv!24399 (_keys!11575 thiss!1427)) (array_inv!24400 (_values!6372 thiss!1427)) e!589376))))

(declare-fun res!693870 () Bool)

(assert (=> start!91230 (=> (not res!693870) (not e!589374))))

(declare-fun valid!2228 (LongMapFixedSize!5934) Bool)

(assert (=> start!91230 (= res!693870 (valid!2228 thiss!1427))))

(assert (=> start!91230 e!589374))

(assert (=> start!91230 e!589373))

(assert (=> start!91230 true))

(declare-fun b!1040871 () Bool)

(assert (=> b!1040871 (= e!589374 e!589375)))

(declare-fun res!693868 () Bool)

(assert (=> b!1040871 (=> (not res!693868) (not e!589375))))

(get-info :version)

(assert (=> b!1040871 (= res!693868 ((_ is Found!9802) lt!458755))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65636 (_ BitVec 32)) SeekEntryResult!9802)

(assert (=> b!1040871 (= lt!458755 (seekEntry!0 key!909 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)))))

(declare-fun b!1040872 () Bool)

(assert (=> b!1040872 (= e!589376 (and e!589378 mapRes!38707))))

(declare-fun condMapEmpty!38707 () Bool)

(declare-fun mapDefault!38707 () ValueCell!11670)

(assert (=> b!1040872 (= condMapEmpty!38707 (= (arr!31582 (_values!6372 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11670)) mapDefault!38707)))))

(declare-fun b!1040873 () Bool)

(assert (=> b!1040873 (= e!589372 tp_is_empty!24747)))

(assert (= (and start!91230 res!693870) b!1040869))

(assert (= (and b!1040869 res!693871) b!1040871))

(assert (= (and b!1040871 res!693868) b!1040868))

(assert (= (and b!1040868 (not res!693869)) b!1040867))

(assert (= (and b!1040872 condMapEmpty!38707) mapIsEmpty!38707))

(assert (= (and b!1040872 (not condMapEmpty!38707)) mapNonEmpty!38707))

(assert (= (and mapNonEmpty!38707 ((_ is ValueCellFull!11670) mapValue!38707)) b!1040873))

(assert (= (and b!1040872 ((_ is ValueCellFull!11670) mapDefault!38707)) b!1040866))

(assert (= b!1040870 b!1040872))

(assert (= start!91230 b!1040870))

(declare-fun m!960379 () Bool)

(assert (=> b!1040868 m!960379))

(declare-fun m!960381 () Bool)

(assert (=> b!1040868 m!960381))

(declare-fun m!960383 () Bool)

(assert (=> b!1040868 m!960383))

(declare-fun m!960385 () Bool)

(assert (=> b!1040868 m!960385))

(declare-fun m!960387 () Bool)

(assert (=> b!1040868 m!960387))

(declare-fun m!960389 () Bool)

(assert (=> b!1040868 m!960389))

(declare-fun m!960391 () Bool)

(assert (=> b!1040868 m!960391))

(declare-fun m!960393 () Bool)

(assert (=> b!1040868 m!960393))

(declare-fun m!960395 () Bool)

(assert (=> b!1040868 m!960395))

(declare-fun m!960397 () Bool)

(assert (=> b!1040868 m!960397))

(declare-fun m!960399 () Bool)

(assert (=> b!1040868 m!960399))

(declare-fun m!960401 () Bool)

(assert (=> mapNonEmpty!38707 m!960401))

(declare-fun m!960403 () Bool)

(assert (=> b!1040871 m!960403))

(declare-fun m!960405 () Bool)

(assert (=> b!1040870 m!960405))

(declare-fun m!960407 () Bool)

(assert (=> b!1040870 m!960407))

(declare-fun m!960409 () Bool)

(assert (=> start!91230 m!960409))

(check-sat b_and!33559 (not start!91230) (not b!1040871) (not mapNonEmpty!38707) tp_is_empty!24747 (not b_next!21027) (not b!1040870) (not b!1040868))
(check-sat b_and!33559 (not b_next!21027))
(get-model)

(declare-fun d!125719 () Bool)

(declare-fun e!589405 () Bool)

(assert (=> d!125719 e!589405))

(declare-fun res!693886 () Bool)

(assert (=> d!125719 (=> (not res!693886) (not e!589405))))

(assert (=> d!125719 (= res!693886 (bvslt (index!41580 lt!458755) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun lt!458781 () Unit!34025)

(declare-fun choose!121 (array!65636 (_ BitVec 32) (_ BitVec 64)) Unit!34025)

(assert (=> d!125719 (= lt!458781 (choose!121 (_keys!11575 thiss!1427) (index!41580 lt!458755) key!909))))

(assert (=> d!125719 (bvsge (index!41580 lt!458755) #b00000000000000000000000000000000)))

(assert (=> d!125719 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11575 thiss!1427) (index!41580 lt!458755) key!909) lt!458781)))

(declare-fun b!1040900 () Bool)

(assert (=> b!1040900 (= e!589405 (not (arrayContainsKey!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!125719 res!693886) b!1040900))

(declare-fun m!960443 () Bool)

(assert (=> d!125719 m!960443))

(assert (=> b!1040900 m!960395))

(declare-fun m!960445 () Bool)

(assert (=> b!1040900 m!960445))

(assert (=> b!1040868 d!125719))

(declare-fun b!1040911 () Bool)

(declare-fun e!589410 () Bool)

(assert (=> b!1040911 (= e!589410 (bvslt (size!32112 (_keys!11575 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1040910 () Bool)

(declare-fun res!693898 () Bool)

(assert (=> b!1040910 (=> (not res!693898) (not e!589410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040910 (= res!693898 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040909 () Bool)

(declare-fun res!693896 () Bool)

(assert (=> b!1040909 (=> (not res!693896) (not e!589410))))

(assert (=> b!1040909 (= res!693896 (validKeyInArray!0 (select (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755))))))

(declare-fun b!1040912 () Bool)

(declare-fun e!589411 () Bool)

(assert (=> b!1040912 (= e!589411 (= (arrayCountValidKeys!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11575 thiss!1427) #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125721 () Bool)

(assert (=> d!125721 e!589411))

(declare-fun res!693897 () Bool)

(assert (=> d!125721 (=> (not res!693897) (not e!589411))))

(assert (=> d!125721 (= res!693897 (and (bvsge (index!41580 lt!458755) #b00000000000000000000000000000000) (bvslt (index!41580 lt!458755) (size!32112 (_keys!11575 thiss!1427)))))))

(declare-fun lt!458784 () Unit!34025)

(declare-fun choose!82 (array!65636 (_ BitVec 32) (_ BitVec 64)) Unit!34025)

(assert (=> d!125721 (= lt!458784 (choose!82 (_keys!11575 thiss!1427) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125721 e!589410))

(declare-fun res!693895 () Bool)

(assert (=> d!125721 (=> (not res!693895) (not e!589410))))

(assert (=> d!125721 (= res!693895 (and (bvsge (index!41580 lt!458755) #b00000000000000000000000000000000) (bvslt (index!41580 lt!458755) (size!32112 (_keys!11575 thiss!1427)))))))

(assert (=> d!125721 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11575 thiss!1427) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458784)))

(assert (= (and d!125721 res!693895) b!1040909))

(assert (= (and b!1040909 res!693896) b!1040910))

(assert (= (and b!1040910 res!693898) b!1040911))

(assert (= (and d!125721 res!693897) b!1040912))

(declare-fun m!960447 () Bool)

(assert (=> b!1040910 m!960447))

(declare-fun m!960449 () Bool)

(assert (=> b!1040909 m!960449))

(assert (=> b!1040909 m!960449))

(declare-fun m!960451 () Bool)

(assert (=> b!1040909 m!960451))

(assert (=> b!1040912 m!960395))

(declare-fun m!960453 () Bool)

(assert (=> b!1040912 m!960453))

(assert (=> b!1040912 m!960385))

(declare-fun m!960455 () Bool)

(assert (=> d!125721 m!960455))

(assert (=> b!1040868 d!125721))

(declare-fun b!1040921 () Bool)

(declare-fun e!589418 () Bool)

(declare-fun call!44080 () Bool)

(assert (=> b!1040921 (= e!589418 call!44080)))

(declare-fun b!1040922 () Bool)

(declare-fun e!589419 () Bool)

(declare-fun e!589420 () Bool)

(assert (=> b!1040922 (= e!589419 e!589420)))

(declare-fun c!105540 () Bool)

(assert (=> b!1040922 (= c!105540 (validKeyInArray!0 (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun d!125723 () Bool)

(declare-fun res!693904 () Bool)

(assert (=> d!125723 (=> res!693904 e!589419)))

(assert (=> d!125723 (= res!693904 (bvsge #b00000000000000000000000000000000 (size!32112 lt!458756)))))

(assert (=> d!125723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458756 (mask!30356 thiss!1427)) e!589419)))

(declare-fun bm!44077 () Bool)

(assert (=> bm!44077 (= call!44080 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458756 (mask!30356 thiss!1427)))))

(declare-fun b!1040923 () Bool)

(assert (=> b!1040923 (= e!589420 call!44080)))

(declare-fun b!1040924 () Bool)

(assert (=> b!1040924 (= e!589420 e!589418)))

(declare-fun lt!458792 () (_ BitVec 64))

(assert (=> b!1040924 (= lt!458792 (select (arr!31581 lt!458756) #b00000000000000000000000000000000))))

(declare-fun lt!458793 () Unit!34025)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65636 (_ BitVec 64) (_ BitVec 32)) Unit!34025)

(assert (=> b!1040924 (= lt!458793 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458756 lt!458792 #b00000000000000000000000000000000))))

(assert (=> b!1040924 (arrayContainsKey!0 lt!458756 lt!458792 #b00000000000000000000000000000000)))

(declare-fun lt!458791 () Unit!34025)

(assert (=> b!1040924 (= lt!458791 lt!458793)))

(declare-fun res!693903 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65636 (_ BitVec 32)) SeekEntryResult!9802)

(assert (=> b!1040924 (= res!693903 (= (seekEntryOrOpen!0 (select (arr!31581 lt!458756) #b00000000000000000000000000000000) lt!458756 (mask!30356 thiss!1427)) (Found!9802 #b00000000000000000000000000000000)))))

(assert (=> b!1040924 (=> (not res!693903) (not e!589418))))

(assert (= (and d!125723 (not res!693904)) b!1040922))

(assert (= (and b!1040922 c!105540) b!1040924))

(assert (= (and b!1040922 (not c!105540)) b!1040923))

(assert (= (and b!1040924 res!693903) b!1040921))

(assert (= (or b!1040921 b!1040923) bm!44077))

(declare-fun m!960457 () Bool)

(assert (=> b!1040922 m!960457))

(assert (=> b!1040922 m!960457))

(declare-fun m!960459 () Bool)

(assert (=> b!1040922 m!960459))

(declare-fun m!960461 () Bool)

(assert (=> bm!44077 m!960461))

(assert (=> b!1040924 m!960457))

(declare-fun m!960463 () Bool)

(assert (=> b!1040924 m!960463))

(declare-fun m!960465 () Bool)

(assert (=> b!1040924 m!960465))

(assert (=> b!1040924 m!960457))

(declare-fun m!960467 () Bool)

(assert (=> b!1040924 m!960467))

(assert (=> b!1040868 d!125723))

(declare-fun d!125725 () Bool)

(declare-fun e!589423 () Bool)

(assert (=> d!125725 e!589423))

(declare-fun res!693907 () Bool)

(assert (=> d!125725 (=> (not res!693907) (not e!589423))))

(assert (=> d!125725 (= res!693907 (and (bvsge (index!41580 lt!458755) #b00000000000000000000000000000000) (bvslt (index!41580 lt!458755) (size!32112 (_keys!11575 thiss!1427)))))))

(declare-fun lt!458796 () Unit!34025)

(declare-fun choose!25 (array!65636 (_ BitVec 32) (_ BitVec 32)) Unit!34025)

(assert (=> d!125725 (= lt!458796 (choose!25 (_keys!11575 thiss!1427) (index!41580 lt!458755) (mask!30356 thiss!1427)))))

(assert (=> d!125725 (validMask!0 (mask!30356 thiss!1427))))

(assert (=> d!125725 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11575 thiss!1427) (index!41580 lt!458755) (mask!30356 thiss!1427)) lt!458796)))

(declare-fun b!1040927 () Bool)

(assert (=> b!1040927 (= e!589423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) (mask!30356 thiss!1427)))))

(assert (= (and d!125725 res!693907) b!1040927))

(declare-fun m!960469 () Bool)

(assert (=> d!125725 m!960469))

(assert (=> d!125725 m!960379))

(assert (=> b!1040927 m!960395))

(declare-fun m!960471 () Bool)

(assert (=> b!1040927 m!960471))

(assert (=> b!1040868 d!125725))

(declare-fun d!125727 () Bool)

(declare-fun e!589426 () Bool)

(assert (=> d!125727 e!589426))

(declare-fun res!693910 () Bool)

(assert (=> d!125727 (=> (not res!693910) (not e!589426))))

(assert (=> d!125727 (= res!693910 (and (bvsge (index!41580 lt!458755) #b00000000000000000000000000000000) (bvslt (index!41580 lt!458755) (size!32112 (_keys!11575 thiss!1427)))))))

(declare-fun lt!458799 () Unit!34025)

(declare-fun choose!53 (array!65636 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21964) Unit!34025)

(assert (=> d!125727 (= lt!458799 (choose!53 (_keys!11575 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41580 lt!458755) #b00000000000000000000000000000000 Nil!21961))))

(assert (=> d!125727 (bvslt (size!32112 (_keys!11575 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125727 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11575 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41580 lt!458755) #b00000000000000000000000000000000 Nil!21961) lt!458799)))

(declare-fun b!1040930 () Bool)

(assert (=> b!1040930 (= e!589426 (arrayNoDuplicates!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000000 Nil!21961))))

(assert (= (and d!125727 res!693910) b!1040930))

(declare-fun m!960473 () Bool)

(assert (=> d!125727 m!960473))

(assert (=> b!1040930 m!960395))

(declare-fun m!960475 () Bool)

(assert (=> b!1040930 m!960475))

(assert (=> b!1040868 d!125727))

(declare-fun d!125729 () Bool)

(declare-fun lt!458802 () (_ BitVec 32))

(assert (=> d!125729 (and (bvsge lt!458802 #b00000000000000000000000000000000) (bvsle lt!458802 (bvsub (size!32112 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!589431 () (_ BitVec 32))

(assert (=> d!125729 (= lt!458802 e!589431)))

(declare-fun c!105546 () Bool)

(assert (=> d!125729 (= c!105546 (bvsge #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125729 (and (bvsle #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32112 (_keys!11575 thiss!1427)) (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125729 (= (arrayCountValidKeys!0 (_keys!11575 thiss!1427) #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) lt!458802)))

(declare-fun bm!44080 () Bool)

(declare-fun call!44083 () (_ BitVec 32))

(assert (=> bm!44080 (= call!44083 (arrayCountValidKeys!0 (_keys!11575 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun b!1040939 () Bool)

(assert (=> b!1040939 (= e!589431 #b00000000000000000000000000000000)))

(declare-fun b!1040940 () Bool)

(declare-fun e!589432 () (_ BitVec 32))

(assert (=> b!1040940 (= e!589432 call!44083)))

(declare-fun b!1040941 () Bool)

(assert (=> b!1040941 (= e!589431 e!589432)))

(declare-fun c!105545 () Bool)

(assert (=> b!1040941 (= c!105545 (validKeyInArray!0 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1040942 () Bool)

(assert (=> b!1040942 (= e!589432 (bvadd #b00000000000000000000000000000001 call!44083))))

(assert (= (and d!125729 c!105546) b!1040939))

(assert (= (and d!125729 (not c!105546)) b!1040941))

(assert (= (and b!1040941 c!105545) b!1040942))

(assert (= (and b!1040941 (not c!105545)) b!1040940))

(assert (= (or b!1040942 b!1040940) bm!44080))

(declare-fun m!960477 () Bool)

(assert (=> bm!44080 m!960477))

(declare-fun m!960479 () Bool)

(assert (=> b!1040941 m!960479))

(assert (=> b!1040941 m!960479))

(declare-fun m!960481 () Bool)

(assert (=> b!1040941 m!960481))

(assert (=> b!1040868 d!125729))

(declare-fun d!125731 () Bool)

(assert (=> d!125731 (= (validMask!0 (mask!30356 thiss!1427)) (and (or (= (mask!30356 thiss!1427) #b00000000000000000000000000000111) (= (mask!30356 thiss!1427) #b00000000000000000000000000001111) (= (mask!30356 thiss!1427) #b00000000000000000000000000011111) (= (mask!30356 thiss!1427) #b00000000000000000000000000111111) (= (mask!30356 thiss!1427) #b00000000000000000000000001111111) (= (mask!30356 thiss!1427) #b00000000000000000000000011111111) (= (mask!30356 thiss!1427) #b00000000000000000000000111111111) (= (mask!30356 thiss!1427) #b00000000000000000000001111111111) (= (mask!30356 thiss!1427) #b00000000000000000000011111111111) (= (mask!30356 thiss!1427) #b00000000000000000000111111111111) (= (mask!30356 thiss!1427) #b00000000000000000001111111111111) (= (mask!30356 thiss!1427) #b00000000000000000011111111111111) (= (mask!30356 thiss!1427) #b00000000000000000111111111111111) (= (mask!30356 thiss!1427) #b00000000000000001111111111111111) (= (mask!30356 thiss!1427) #b00000000000000011111111111111111) (= (mask!30356 thiss!1427) #b00000000000000111111111111111111) (= (mask!30356 thiss!1427) #b00000000000001111111111111111111) (= (mask!30356 thiss!1427) #b00000000000011111111111111111111) (= (mask!30356 thiss!1427) #b00000000000111111111111111111111) (= (mask!30356 thiss!1427) #b00000000001111111111111111111111) (= (mask!30356 thiss!1427) #b00000000011111111111111111111111) (= (mask!30356 thiss!1427) #b00000000111111111111111111111111) (= (mask!30356 thiss!1427) #b00000001111111111111111111111111) (= (mask!30356 thiss!1427) #b00000011111111111111111111111111) (= (mask!30356 thiss!1427) #b00000111111111111111111111111111) (= (mask!30356 thiss!1427) #b00001111111111111111111111111111) (= (mask!30356 thiss!1427) #b00011111111111111111111111111111) (= (mask!30356 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30356 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040868 d!125731))

(declare-fun d!125733 () Bool)

(declare-fun lt!458803 () (_ BitVec 32))

(assert (=> d!125733 (and (bvsge lt!458803 #b00000000000000000000000000000000) (bvsle lt!458803 (bvsub (size!32112 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun e!589433 () (_ BitVec 32))

(assert (=> d!125733 (= lt!458803 e!589433)))

(declare-fun c!105548 () Bool)

(assert (=> d!125733 (= c!105548 (bvsge #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125733 (and (bvsle #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32112 (_keys!11575 thiss!1427)) (size!32112 lt!458756)))))

(assert (=> d!125733 (= (arrayCountValidKeys!0 lt!458756 #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) lt!458803)))

(declare-fun bm!44081 () Bool)

(declare-fun call!44084 () (_ BitVec 32))

(assert (=> bm!44081 (= call!44084 (arrayCountValidKeys!0 lt!458756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun b!1040943 () Bool)

(assert (=> b!1040943 (= e!589433 #b00000000000000000000000000000000)))

(declare-fun b!1040944 () Bool)

(declare-fun e!589434 () (_ BitVec 32))

(assert (=> b!1040944 (= e!589434 call!44084)))

(declare-fun b!1040945 () Bool)

(assert (=> b!1040945 (= e!589433 e!589434)))

(declare-fun c!105547 () Bool)

(assert (=> b!1040945 (= c!105547 (validKeyInArray!0 (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun b!1040946 () Bool)

(assert (=> b!1040946 (= e!589434 (bvadd #b00000000000000000000000000000001 call!44084))))

(assert (= (and d!125733 c!105548) b!1040943))

(assert (= (and d!125733 (not c!105548)) b!1040945))

(assert (= (and b!1040945 c!105547) b!1040946))

(assert (= (and b!1040945 (not c!105547)) b!1040944))

(assert (= (or b!1040946 b!1040944) bm!44081))

(declare-fun m!960483 () Bool)

(assert (=> bm!44081 m!960483))

(assert (=> b!1040945 m!960457))

(assert (=> b!1040945 m!960457))

(assert (=> b!1040945 m!960459))

(assert (=> b!1040868 d!125733))

(declare-fun d!125735 () Bool)

(declare-fun res!693915 () Bool)

(declare-fun e!589439 () Bool)

(assert (=> d!125735 (=> res!693915 e!589439)))

(assert (=> d!125735 (= res!693915 (= (select (arr!31581 lt!458756) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125735 (= (arrayContainsKey!0 lt!458756 key!909 #b00000000000000000000000000000000) e!589439)))

(declare-fun b!1040951 () Bool)

(declare-fun e!589440 () Bool)

(assert (=> b!1040951 (= e!589439 e!589440)))

(declare-fun res!693916 () Bool)

(assert (=> b!1040951 (=> (not res!693916) (not e!589440))))

(assert (=> b!1040951 (= res!693916 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 lt!458756)))))

(declare-fun b!1040952 () Bool)

(assert (=> b!1040952 (= e!589440 (arrayContainsKey!0 lt!458756 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125735 (not res!693915)) b!1040951))

(assert (= (and b!1040951 res!693916) b!1040952))

(assert (=> d!125735 m!960457))

(declare-fun m!960485 () Bool)

(assert (=> b!1040952 m!960485))

(assert (=> b!1040868 d!125735))

(declare-fun b!1040963 () Bool)

(declare-fun e!589450 () Bool)

(declare-fun call!44087 () Bool)

(assert (=> b!1040963 (= e!589450 call!44087)))

(declare-fun b!1040965 () Bool)

(assert (=> b!1040965 (= e!589450 call!44087)))

(declare-fun b!1040966 () Bool)

(declare-fun e!589452 () Bool)

(assert (=> b!1040966 (= e!589452 e!589450)))

(declare-fun c!105551 () Bool)

(assert (=> b!1040966 (= c!105551 (validKeyInArray!0 (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun d!125737 () Bool)

(declare-fun res!693924 () Bool)

(declare-fun e!589449 () Bool)

(assert (=> d!125737 (=> res!693924 e!589449)))

(assert (=> d!125737 (= res!693924 (bvsge #b00000000000000000000000000000000 (size!32112 lt!458756)))))

(assert (=> d!125737 (= (arrayNoDuplicates!0 lt!458756 #b00000000000000000000000000000000 Nil!21961) e!589449)))

(declare-fun b!1040964 () Bool)

(assert (=> b!1040964 (= e!589449 e!589452)))

(declare-fun res!693925 () Bool)

(assert (=> b!1040964 (=> (not res!693925) (not e!589452))))

(declare-fun e!589451 () Bool)

(assert (=> b!1040964 (= res!693925 (not e!589451))))

(declare-fun res!693923 () Bool)

(assert (=> b!1040964 (=> (not res!693923) (not e!589451))))

(assert (=> b!1040964 (= res!693923 (validKeyInArray!0 (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun b!1040967 () Bool)

(declare-fun contains!6052 (List!21964 (_ BitVec 64)) Bool)

(assert (=> b!1040967 (= e!589451 (contains!6052 Nil!21961 (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun bm!44084 () Bool)

(assert (=> bm!44084 (= call!44087 (arrayNoDuplicates!0 lt!458756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105551 (Cons!21960 (select (arr!31581 lt!458756) #b00000000000000000000000000000000) Nil!21961) Nil!21961)))))

(assert (= (and d!125737 (not res!693924)) b!1040964))

(assert (= (and b!1040964 res!693923) b!1040967))

(assert (= (and b!1040964 res!693925) b!1040966))

(assert (= (and b!1040966 c!105551) b!1040965))

(assert (= (and b!1040966 (not c!105551)) b!1040963))

(assert (= (or b!1040965 b!1040963) bm!44084))

(assert (=> b!1040966 m!960457))

(assert (=> b!1040966 m!960457))

(assert (=> b!1040966 m!960459))

(assert (=> b!1040964 m!960457))

(assert (=> b!1040964 m!960457))

(assert (=> b!1040964 m!960459))

(assert (=> b!1040967 m!960457))

(assert (=> b!1040967 m!960457))

(declare-fun m!960487 () Bool)

(assert (=> b!1040967 m!960487))

(assert (=> bm!44084 m!960457))

(declare-fun m!960489 () Bool)

(assert (=> bm!44084 m!960489))

(assert (=> b!1040868 d!125737))

(declare-fun d!125739 () Bool)

(declare-fun res!693932 () Bool)

(declare-fun e!589455 () Bool)

(assert (=> d!125739 (=> (not res!693932) (not e!589455))))

(declare-fun simpleValid!436 (LongMapFixedSize!5934) Bool)

(assert (=> d!125739 (= res!693932 (simpleValid!436 thiss!1427))))

(assert (=> d!125739 (= (valid!2228 thiss!1427) e!589455)))

(declare-fun b!1040974 () Bool)

(declare-fun res!693933 () Bool)

(assert (=> b!1040974 (=> (not res!693933) (not e!589455))))

(assert (=> b!1040974 (= res!693933 (= (arrayCountValidKeys!0 (_keys!11575 thiss!1427) #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) (_size!3022 thiss!1427)))))

(declare-fun b!1040975 () Bool)

(declare-fun res!693934 () Bool)

(assert (=> b!1040975 (=> (not res!693934) (not e!589455))))

(assert (=> b!1040975 (= res!693934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)))))

(declare-fun b!1040976 () Bool)

(assert (=> b!1040976 (= e!589455 (arrayNoDuplicates!0 (_keys!11575 thiss!1427) #b00000000000000000000000000000000 Nil!21961))))

(assert (= (and d!125739 res!693932) b!1040974))

(assert (= (and b!1040974 res!693933) b!1040975))

(assert (= (and b!1040975 res!693934) b!1040976))

(declare-fun m!960491 () Bool)

(assert (=> d!125739 m!960491))

(assert (=> b!1040974 m!960385))

(declare-fun m!960493 () Bool)

(assert (=> b!1040975 m!960493))

(declare-fun m!960495 () Bool)

(assert (=> b!1040976 m!960495))

(assert (=> start!91230 d!125739))

(declare-fun d!125741 () Bool)

(assert (=> d!125741 (= (array_inv!24399 (_keys!11575 thiss!1427)) (bvsge (size!32112 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040870 d!125741))

(declare-fun d!125743 () Bool)

(assert (=> d!125743 (= (array_inv!24400 (_values!6372 thiss!1427)) (bvsge (size!32113 (_values!6372 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040870 d!125743))

(declare-fun d!125745 () Bool)

(declare-fun lt!458812 () SeekEntryResult!9802)

(assert (=> d!125745 (and (or ((_ is MissingVacant!9802) lt!458812) (not ((_ is Found!9802) lt!458812)) (and (bvsge (index!41580 lt!458812) #b00000000000000000000000000000000) (bvslt (index!41580 lt!458812) (size!32112 (_keys!11575 thiss!1427))))) (not ((_ is MissingVacant!9802) lt!458812)) (or (not ((_ is Found!9802) lt!458812)) (= (select (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458812)) key!909)))))

(declare-fun e!589462 () SeekEntryResult!9802)

(assert (=> d!125745 (= lt!458812 e!589462)))

(declare-fun c!105560 () Bool)

(declare-fun lt!458815 () SeekEntryResult!9802)

(assert (=> d!125745 (= c!105560 (and ((_ is Intermediate!9802) lt!458815) (undefined!10614 lt!458815)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65636 (_ BitVec 32)) SeekEntryResult!9802)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125745 (= lt!458815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30356 thiss!1427)) key!909 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)))))

(assert (=> d!125745 (validMask!0 (mask!30356 thiss!1427))))

(assert (=> d!125745 (= (seekEntry!0 key!909 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)) lt!458812)))

(declare-fun b!1040989 () Bool)

(declare-fun e!589464 () SeekEntryResult!9802)

(assert (=> b!1040989 (= e!589464 (MissingZero!9802 (index!41581 lt!458815)))))

(declare-fun b!1040990 () Bool)

(declare-fun e!589463 () SeekEntryResult!9802)

(assert (=> b!1040990 (= e!589463 (Found!9802 (index!41581 lt!458815)))))

(declare-fun b!1040991 () Bool)

(assert (=> b!1040991 (= e!589462 e!589463)))

(declare-fun lt!458813 () (_ BitVec 64))

(assert (=> b!1040991 (= lt!458813 (select (arr!31581 (_keys!11575 thiss!1427)) (index!41581 lt!458815)))))

(declare-fun c!105559 () Bool)

(assert (=> b!1040991 (= c!105559 (= lt!458813 key!909))))

(declare-fun b!1040992 () Bool)

(assert (=> b!1040992 (= e!589462 Undefined!9802)))

(declare-fun b!1040993 () Bool)

(declare-fun c!105558 () Bool)

(assert (=> b!1040993 (= c!105558 (= lt!458813 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040993 (= e!589463 e!589464)))

(declare-fun b!1040994 () Bool)

(declare-fun lt!458814 () SeekEntryResult!9802)

(assert (=> b!1040994 (= e!589464 (ite ((_ is MissingVacant!9802) lt!458814) (MissingZero!9802 (index!41582 lt!458814)) lt!458814))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65636 (_ BitVec 32)) SeekEntryResult!9802)

(assert (=> b!1040994 (= lt!458814 (seekKeyOrZeroReturnVacant!0 (x!92922 lt!458815) (index!41581 lt!458815) (index!41581 lt!458815) key!909 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)))))

(assert (= (and d!125745 c!105560) b!1040992))

(assert (= (and d!125745 (not c!105560)) b!1040991))

(assert (= (and b!1040991 c!105559) b!1040990))

(assert (= (and b!1040991 (not c!105559)) b!1040993))

(assert (= (and b!1040993 c!105558) b!1040989))

(assert (= (and b!1040993 (not c!105558)) b!1040994))

(declare-fun m!960497 () Bool)

(assert (=> d!125745 m!960497))

(declare-fun m!960499 () Bool)

(assert (=> d!125745 m!960499))

(assert (=> d!125745 m!960499))

(declare-fun m!960501 () Bool)

(assert (=> d!125745 m!960501))

(assert (=> d!125745 m!960379))

(declare-fun m!960503 () Bool)

(assert (=> b!1040991 m!960503))

(declare-fun m!960505 () Bool)

(assert (=> b!1040994 m!960505))

(assert (=> b!1040871 d!125745))

(declare-fun mapIsEmpty!38713 () Bool)

(declare-fun mapRes!38713 () Bool)

(assert (=> mapIsEmpty!38713 mapRes!38713))

(declare-fun b!1041002 () Bool)

(declare-fun e!589470 () Bool)

(assert (=> b!1041002 (= e!589470 tp_is_empty!24747)))

(declare-fun mapNonEmpty!38713 () Bool)

(declare-fun tp!74294 () Bool)

(declare-fun e!589469 () Bool)

(assert (=> mapNonEmpty!38713 (= mapRes!38713 (and tp!74294 e!589469))))

(declare-fun mapRest!38713 () (Array (_ BitVec 32) ValueCell!11670))

(declare-fun mapValue!38713 () ValueCell!11670)

(declare-fun mapKey!38713 () (_ BitVec 32))

(assert (=> mapNonEmpty!38713 (= mapRest!38707 (store mapRest!38713 mapKey!38713 mapValue!38713))))

(declare-fun condMapEmpty!38713 () Bool)

(declare-fun mapDefault!38713 () ValueCell!11670)

(assert (=> mapNonEmpty!38707 (= condMapEmpty!38713 (= mapRest!38707 ((as const (Array (_ BitVec 32) ValueCell!11670)) mapDefault!38713)))))

(assert (=> mapNonEmpty!38707 (= tp!74285 (and e!589470 mapRes!38713))))

(declare-fun b!1041001 () Bool)

(assert (=> b!1041001 (= e!589469 tp_is_empty!24747)))

(assert (= (and mapNonEmpty!38707 condMapEmpty!38713) mapIsEmpty!38713))

(assert (= (and mapNonEmpty!38707 (not condMapEmpty!38713)) mapNonEmpty!38713))

(assert (= (and mapNonEmpty!38713 ((_ is ValueCellFull!11670) mapValue!38713)) b!1041001))

(assert (= (and mapNonEmpty!38707 ((_ is ValueCellFull!11670) mapDefault!38713)) b!1041002))

(declare-fun m!960507 () Bool)

(assert (=> mapNonEmpty!38713 m!960507))

(check-sat (not bm!44080) (not d!125721) (not mapNonEmpty!38713) tp_is_empty!24747 (not b!1040910) (not b!1040945) (not b!1040964) (not b!1040927) (not b!1040909) (not b!1040941) (not b!1040975) b_and!33559 (not b!1040967) (not b!1040930) (not b!1040974) (not d!125745) (not b_next!21027) (not bm!44077) (not b!1040994) (not d!125727) (not d!125719) (not d!125739) (not d!125725) (not b!1040912) (not b!1040924) (not b!1040952) (not bm!44081) (not bm!44084) (not b!1040922) (not b!1040900) (not b!1040966) (not b!1040976))
(check-sat b_and!33559 (not b_next!21027))
(get-model)

(declare-fun d!125747 () Bool)

(assert (=> d!125747 (arrayNoDuplicates!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000000 Nil!21961)))

(assert (=> d!125747 true))

(declare-fun _$66!47 () Unit!34025)

(assert (=> d!125747 (= (choose!53 (_keys!11575 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41580 lt!458755) #b00000000000000000000000000000000 Nil!21961) _$66!47)))

(declare-fun bs!30447 () Bool)

(assert (= bs!30447 d!125747))

(assert (=> bs!30447 m!960395))

(assert (=> bs!30447 m!960475))

(assert (=> d!125727 d!125747))

(declare-fun d!125749 () Bool)

(assert (=> d!125749 (= (validKeyInArray!0 (select (arr!31581 lt!458756) #b00000000000000000000000000000000)) (and (not (= (select (arr!31581 lt!458756) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31581 lt!458756) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040945 d!125749))

(declare-fun b!1041021 () Bool)

(declare-fun lt!458821 () SeekEntryResult!9802)

(assert (=> b!1041021 (and (bvsge (index!41581 lt!458821) #b00000000000000000000000000000000) (bvslt (index!41581 lt!458821) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun res!693942 () Bool)

(assert (=> b!1041021 (= res!693942 (= (select (arr!31581 (_keys!11575 thiss!1427)) (index!41581 lt!458821)) key!909))))

(declare-fun e!589483 () Bool)

(assert (=> b!1041021 (=> res!693942 e!589483)))

(declare-fun e!589485 () Bool)

(assert (=> b!1041021 (= e!589485 e!589483)))

(declare-fun b!1041022 () Bool)

(declare-fun e!589484 () Bool)

(assert (=> b!1041022 (= e!589484 (bvsge (x!92922 lt!458821) #b01111111111111111111111111111110))))

(declare-fun b!1041023 () Bool)

(assert (=> b!1041023 (= e!589484 e!589485)))

(declare-fun res!693943 () Bool)

(assert (=> b!1041023 (= res!693943 (and ((_ is Intermediate!9802) lt!458821) (not (undefined!10614 lt!458821)) (bvslt (x!92922 lt!458821) #b01111111111111111111111111111110) (bvsge (x!92922 lt!458821) #b00000000000000000000000000000000) (bvsge (x!92922 lt!458821) #b00000000000000000000000000000000)))))

(assert (=> b!1041023 (=> (not res!693943) (not e!589485))))

(declare-fun b!1041024 () Bool)

(declare-fun e!589482 () SeekEntryResult!9802)

(assert (=> b!1041024 (= e!589482 (Intermediate!9802 true (toIndex!0 key!909 (mask!30356 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun d!125751 () Bool)

(assert (=> d!125751 e!589484))

(declare-fun c!105568 () Bool)

(assert (=> d!125751 (= c!105568 (and ((_ is Intermediate!9802) lt!458821) (undefined!10614 lt!458821)))))

(assert (=> d!125751 (= lt!458821 e!589482)))

(declare-fun c!105569 () Bool)

(assert (=> d!125751 (= c!105569 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!458820 () (_ BitVec 64))

(assert (=> d!125751 (= lt!458820 (select (arr!31581 (_keys!11575 thiss!1427)) (toIndex!0 key!909 (mask!30356 thiss!1427))))))

(assert (=> d!125751 (validMask!0 (mask!30356 thiss!1427))))

(assert (=> d!125751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30356 thiss!1427)) key!909 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)) lt!458821)))

(declare-fun b!1041025 () Bool)

(assert (=> b!1041025 (and (bvsge (index!41581 lt!458821) #b00000000000000000000000000000000) (bvslt (index!41581 lt!458821) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun res!693941 () Bool)

(assert (=> b!1041025 (= res!693941 (= (select (arr!31581 (_keys!11575 thiss!1427)) (index!41581 lt!458821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1041025 (=> res!693941 e!589483)))

(declare-fun b!1041026 () Bool)

(assert (=> b!1041026 (and (bvsge (index!41581 lt!458821) #b00000000000000000000000000000000) (bvslt (index!41581 lt!458821) (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> b!1041026 (= e!589483 (= (select (arr!31581 (_keys!11575 thiss!1427)) (index!41581 lt!458821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041027 () Bool)

(declare-fun e!589481 () SeekEntryResult!9802)

(assert (=> b!1041027 (= e!589482 e!589481)))

(declare-fun c!105567 () Bool)

(assert (=> b!1041027 (= c!105567 (or (= lt!458820 key!909) (= (bvadd lt!458820 lt!458820) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1041028 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041028 (= e!589481 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!909 (mask!30356 thiss!1427)) #b00000000000000000000000000000000 (mask!30356 thiss!1427)) key!909 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)))))

(declare-fun b!1041029 () Bool)

(assert (=> b!1041029 (= e!589481 (Intermediate!9802 false (toIndex!0 key!909 (mask!30356 thiss!1427)) #b00000000000000000000000000000000))))

(assert (= (and d!125751 c!105569) b!1041024))

(assert (= (and d!125751 (not c!105569)) b!1041027))

(assert (= (and b!1041027 c!105567) b!1041029))

(assert (= (and b!1041027 (not c!105567)) b!1041028))

(assert (= (and d!125751 c!105568) b!1041022))

(assert (= (and d!125751 (not c!105568)) b!1041023))

(assert (= (and b!1041023 res!693943) b!1041021))

(assert (= (and b!1041021 (not res!693942)) b!1041025))

(assert (= (and b!1041025 (not res!693941)) b!1041026))

(assert (=> d!125751 m!960499))

(declare-fun m!960509 () Bool)

(assert (=> d!125751 m!960509))

(assert (=> d!125751 m!960379))

(declare-fun m!960511 () Bool)

(assert (=> b!1041025 m!960511))

(assert (=> b!1041021 m!960511))

(assert (=> b!1041026 m!960511))

(assert (=> b!1041028 m!960499))

(declare-fun m!960513 () Bool)

(assert (=> b!1041028 m!960513))

(assert (=> b!1041028 m!960513))

(declare-fun m!960515 () Bool)

(assert (=> b!1041028 m!960515))

(assert (=> d!125745 d!125751))

(declare-fun d!125753 () Bool)

(declare-fun lt!458827 () (_ BitVec 32))

(declare-fun lt!458826 () (_ BitVec 32))

(assert (=> d!125753 (= lt!458827 (bvmul (bvxor lt!458826 (bvlshr lt!458826 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!125753 (= lt!458826 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!125753 (and (bvsge (mask!30356 thiss!1427) #b00000000000000000000000000000000) (let ((res!693944 (let ((h!23166 ((_ extract 31 0) (bvand (bvxor key!909 (bvlshr key!909 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!92939 (bvmul (bvxor h!23166 (bvlshr h!23166 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!92939 (bvlshr x!92939 #b00000000000000000000000000001101)) (mask!30356 thiss!1427)))))) (and (bvslt res!693944 (bvadd (mask!30356 thiss!1427) #b00000000000000000000000000000001)) (bvsge res!693944 #b00000000000000000000000000000000))))))

(assert (=> d!125753 (= (toIndex!0 key!909 (mask!30356 thiss!1427)) (bvand (bvxor lt!458827 (bvlshr lt!458827 #b00000000000000000000000000001101)) (mask!30356 thiss!1427)))))

(assert (=> d!125745 d!125753))

(assert (=> d!125745 d!125731))

(assert (=> b!1040922 d!125749))

(declare-fun b!1041041 () Bool)

(declare-fun e!589488 () Bool)

(assert (=> b!1041041 (= e!589488 (and (bvsge (extraKeys!6077 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!6077 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!3022 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun d!125755 () Bool)

(declare-fun res!693956 () Bool)

(assert (=> d!125755 (=> (not res!693956) (not e!589488))))

(assert (=> d!125755 (= res!693956 (validMask!0 (mask!30356 thiss!1427)))))

(assert (=> d!125755 (= (simpleValid!436 thiss!1427) e!589488)))

(declare-fun b!1041040 () Bool)

(declare-fun res!693955 () Bool)

(assert (=> b!1041040 (=> (not res!693955) (not e!589488))))

(declare-fun size!32116 (LongMapFixedSize!5934) (_ BitVec 32))

(assert (=> b!1041040 (= res!693955 (= (size!32116 thiss!1427) (bvadd (_size!3022 thiss!1427) (bvsdiv (bvadd (extraKeys!6077 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1041038 () Bool)

(declare-fun res!693953 () Bool)

(assert (=> b!1041038 (=> (not res!693953) (not e!589488))))

(assert (=> b!1041038 (= res!693953 (and (= (size!32113 (_values!6372 thiss!1427)) (bvadd (mask!30356 thiss!1427) #b00000000000000000000000000000001)) (= (size!32112 (_keys!11575 thiss!1427)) (size!32113 (_values!6372 thiss!1427))) (bvsge (_size!3022 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!3022 thiss!1427) (bvadd (mask!30356 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1041039 () Bool)

(declare-fun res!693954 () Bool)

(assert (=> b!1041039 (=> (not res!693954) (not e!589488))))

(assert (=> b!1041039 (= res!693954 (bvsge (size!32116 thiss!1427) (_size!3022 thiss!1427)))))

(assert (= (and d!125755 res!693956) b!1041038))

(assert (= (and b!1041038 res!693953) b!1041039))

(assert (= (and b!1041039 res!693954) b!1041040))

(assert (= (and b!1041040 res!693955) b!1041041))

(assert (=> d!125755 m!960379))

(declare-fun m!960517 () Bool)

(assert (=> b!1041040 m!960517))

(assert (=> b!1041039 m!960517))

(assert (=> d!125739 d!125755))

(declare-fun b!1041042 () Bool)

(declare-fun e!589489 () Bool)

(declare-fun call!44088 () Bool)

(assert (=> b!1041042 (= e!589489 call!44088)))

(declare-fun b!1041043 () Bool)

(declare-fun e!589490 () Bool)

(declare-fun e!589491 () Bool)

(assert (=> b!1041043 (= e!589490 e!589491)))

(declare-fun c!105570 () Bool)

(assert (=> b!1041043 (= c!105570 (validKeyInArray!0 (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125757 () Bool)

(declare-fun res!693958 () Bool)

(assert (=> d!125757 (=> res!693958 e!589490)))

(assert (=> d!125757 (= res!693958 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 lt!458756)))))

(assert (=> d!125757 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!458756 (mask!30356 thiss!1427)) e!589490)))

(declare-fun bm!44085 () Bool)

(assert (=> bm!44085 (= call!44088 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!458756 (mask!30356 thiss!1427)))))

(declare-fun b!1041044 () Bool)

(assert (=> b!1041044 (= e!589491 call!44088)))

(declare-fun b!1041045 () Bool)

(assert (=> b!1041045 (= e!589491 e!589489)))

(declare-fun lt!458829 () (_ BitVec 64))

(assert (=> b!1041045 (= lt!458829 (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!458830 () Unit!34025)

(assert (=> b!1041045 (= lt!458830 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458756 lt!458829 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1041045 (arrayContainsKey!0 lt!458756 lt!458829 #b00000000000000000000000000000000)))

(declare-fun lt!458828 () Unit!34025)

(assert (=> b!1041045 (= lt!458828 lt!458830)))

(declare-fun res!693957 () Bool)

(assert (=> b!1041045 (= res!693957 (= (seekEntryOrOpen!0 (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!458756 (mask!30356 thiss!1427)) (Found!9802 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1041045 (=> (not res!693957) (not e!589489))))

(assert (= (and d!125757 (not res!693958)) b!1041043))

(assert (= (and b!1041043 c!105570) b!1041045))

(assert (= (and b!1041043 (not c!105570)) b!1041044))

(assert (= (and b!1041045 res!693957) b!1041042))

(assert (= (or b!1041042 b!1041044) bm!44085))

(declare-fun m!960519 () Bool)

(assert (=> b!1041043 m!960519))

(assert (=> b!1041043 m!960519))

(declare-fun m!960521 () Bool)

(assert (=> b!1041043 m!960521))

(declare-fun m!960523 () Bool)

(assert (=> bm!44085 m!960523))

(assert (=> b!1041045 m!960519))

(declare-fun m!960525 () Bool)

(assert (=> b!1041045 m!960525))

(declare-fun m!960527 () Bool)

(assert (=> b!1041045 m!960527))

(assert (=> b!1041045 m!960519))

(declare-fun m!960529 () Bool)

(assert (=> b!1041045 m!960529))

(assert (=> bm!44077 d!125757))

(assert (=> b!1040974 d!125729))

(declare-fun d!125759 () Bool)

(assert (=> d!125759 (= (validKeyInArray!0 (select (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755))) (and (not (= (select (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040909 d!125759))

(declare-fun d!125761 () Bool)

(declare-fun lt!458831 () (_ BitVec 32))

(assert (=> d!125761 (and (bvsge lt!458831 #b00000000000000000000000000000000) (bvsle lt!458831 (bvsub (size!32112 (_keys!11575 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!589492 () (_ BitVec 32))

(assert (=> d!125761 (= lt!458831 e!589492)))

(declare-fun c!105572 () Bool)

(assert (=> d!125761 (= c!105572 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125761 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32112 (_keys!11575 thiss!1427)) (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125761 (= (arrayCountValidKeys!0 (_keys!11575 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))) lt!458831)))

(declare-fun bm!44086 () Bool)

(declare-fun call!44089 () (_ BitVec 32))

(assert (=> bm!44086 (= call!44089 (arrayCountValidKeys!0 (_keys!11575 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun b!1041046 () Bool)

(assert (=> b!1041046 (= e!589492 #b00000000000000000000000000000000)))

(declare-fun b!1041047 () Bool)

(declare-fun e!589493 () (_ BitVec 32))

(assert (=> b!1041047 (= e!589493 call!44089)))

(declare-fun b!1041048 () Bool)

(assert (=> b!1041048 (= e!589492 e!589493)))

(declare-fun c!105571 () Bool)

(assert (=> b!1041048 (= c!105571 (validKeyInArray!0 (select (arr!31581 (_keys!11575 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041049 () Bool)

(assert (=> b!1041049 (= e!589493 (bvadd #b00000000000000000000000000000001 call!44089))))

(assert (= (and d!125761 c!105572) b!1041046))

(assert (= (and d!125761 (not c!105572)) b!1041048))

(assert (= (and b!1041048 c!105571) b!1041049))

(assert (= (and b!1041048 (not c!105571)) b!1041047))

(assert (= (or b!1041049 b!1041047) bm!44086))

(declare-fun m!960531 () Bool)

(assert (=> bm!44086 m!960531))

(declare-fun m!960533 () Bool)

(assert (=> b!1041048 m!960533))

(assert (=> b!1041048 m!960533))

(declare-fun m!960535 () Bool)

(assert (=> b!1041048 m!960535))

(assert (=> bm!44080 d!125761))

(assert (=> b!1040966 d!125749))

(declare-fun d!125763 () Bool)

(declare-fun lt!458834 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!520 (List!21964) (InoxSet (_ BitVec 64)))

(assert (=> d!125763 (= lt!458834 (select (content!520 Nil!21961) (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun e!589499 () Bool)

(assert (=> d!125763 (= lt!458834 e!589499)))

(declare-fun res!693964 () Bool)

(assert (=> d!125763 (=> (not res!693964) (not e!589499))))

(assert (=> d!125763 (= res!693964 ((_ is Cons!21960) Nil!21961))))

(assert (=> d!125763 (= (contains!6052 Nil!21961 (select (arr!31581 lt!458756) #b00000000000000000000000000000000)) lt!458834)))

(declare-fun b!1041054 () Bool)

(declare-fun e!589498 () Bool)

(assert (=> b!1041054 (= e!589499 e!589498)))

(declare-fun res!693963 () Bool)

(assert (=> b!1041054 (=> res!693963 e!589498)))

(assert (=> b!1041054 (= res!693963 (= (h!23164 Nil!21961) (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun b!1041055 () Bool)

(assert (=> b!1041055 (= e!589498 (contains!6052 (t!31178 Nil!21961) (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(assert (= (and d!125763 res!693964) b!1041054))

(assert (= (and b!1041054 (not res!693963)) b!1041055))

(declare-fun m!960537 () Bool)

(assert (=> d!125763 m!960537))

(assert (=> d!125763 m!960457))

(declare-fun m!960539 () Bool)

(assert (=> d!125763 m!960539))

(assert (=> b!1041055 m!960457))

(declare-fun m!960541 () Bool)

(assert (=> b!1041055 m!960541))

(assert (=> b!1040967 d!125763))

(declare-fun b!1041056 () Bool)

(declare-fun e!589501 () Bool)

(declare-fun call!44090 () Bool)

(assert (=> b!1041056 (= e!589501 call!44090)))

(declare-fun b!1041058 () Bool)

(assert (=> b!1041058 (= e!589501 call!44090)))

(declare-fun b!1041059 () Bool)

(declare-fun e!589503 () Bool)

(assert (=> b!1041059 (= e!589503 e!589501)))

(declare-fun c!105573 () Bool)

(assert (=> b!1041059 (= c!105573 (validKeyInArray!0 (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!125765 () Bool)

(declare-fun res!693966 () Bool)

(declare-fun e!589500 () Bool)

(assert (=> d!125765 (=> res!693966 e!589500)))

(assert (=> d!125765 (= res!693966 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 lt!458756)))))

(assert (=> d!125765 (= (arrayNoDuplicates!0 lt!458756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105551 (Cons!21960 (select (arr!31581 lt!458756) #b00000000000000000000000000000000) Nil!21961) Nil!21961)) e!589500)))

(declare-fun b!1041057 () Bool)

(assert (=> b!1041057 (= e!589500 e!589503)))

(declare-fun res!693967 () Bool)

(assert (=> b!1041057 (=> (not res!693967) (not e!589503))))

(declare-fun e!589502 () Bool)

(assert (=> b!1041057 (= res!693967 (not e!589502))))

(declare-fun res!693965 () Bool)

(assert (=> b!1041057 (=> (not res!693965) (not e!589502))))

(assert (=> b!1041057 (= res!693965 (validKeyInArray!0 (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041060 () Bool)

(assert (=> b!1041060 (= e!589502 (contains!6052 (ite c!105551 (Cons!21960 (select (arr!31581 lt!458756) #b00000000000000000000000000000000) Nil!21961) Nil!21961) (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!44087 () Bool)

(assert (=> bm!44087 (= call!44090 (arrayNoDuplicates!0 lt!458756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!105573 (Cons!21960 (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!105551 (Cons!21960 (select (arr!31581 lt!458756) #b00000000000000000000000000000000) Nil!21961) Nil!21961)) (ite c!105551 (Cons!21960 (select (arr!31581 lt!458756) #b00000000000000000000000000000000) Nil!21961) Nil!21961))))))

(assert (= (and d!125765 (not res!693966)) b!1041057))

(assert (= (and b!1041057 res!693965) b!1041060))

(assert (= (and b!1041057 res!693967) b!1041059))

(assert (= (and b!1041059 c!105573) b!1041058))

(assert (= (and b!1041059 (not c!105573)) b!1041056))

(assert (= (or b!1041058 b!1041056) bm!44087))

(assert (=> b!1041059 m!960519))

(assert (=> b!1041059 m!960519))

(assert (=> b!1041059 m!960521))

(assert (=> b!1041057 m!960519))

(assert (=> b!1041057 m!960519))

(assert (=> b!1041057 m!960521))

(assert (=> b!1041060 m!960519))

(assert (=> b!1041060 m!960519))

(declare-fun m!960543 () Bool)

(assert (=> b!1041060 m!960543))

(assert (=> bm!44087 m!960519))

(declare-fun m!960545 () Bool)

(assert (=> bm!44087 m!960545))

(assert (=> bm!44084 d!125765))

(declare-fun d!125767 () Bool)

(declare-fun lt!458835 () (_ BitVec 32))

(assert (=> d!125767 (and (bvsge lt!458835 #b00000000000000000000000000000000) (bvsle lt!458835 (bvsub (size!32112 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!589504 () (_ BitVec 32))

(assert (=> d!125767 (= lt!458835 e!589504)))

(declare-fun c!105575 () Bool)

(assert (=> d!125767 (= c!105575 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125767 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!32112 (_keys!11575 thiss!1427)) (size!32112 lt!458756)))))

(assert (=> d!125767 (= (arrayCountValidKeys!0 lt!458756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))) lt!458835)))

(declare-fun bm!44088 () Bool)

(declare-fun call!44091 () (_ BitVec 32))

(assert (=> bm!44088 (= call!44091 (arrayCountValidKeys!0 lt!458756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun b!1041061 () Bool)

(assert (=> b!1041061 (= e!589504 #b00000000000000000000000000000000)))

(declare-fun b!1041062 () Bool)

(declare-fun e!589505 () (_ BitVec 32))

(assert (=> b!1041062 (= e!589505 call!44091)))

(declare-fun b!1041063 () Bool)

(assert (=> b!1041063 (= e!589504 e!589505)))

(declare-fun c!105574 () Bool)

(assert (=> b!1041063 (= c!105574 (validKeyInArray!0 (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1041064 () Bool)

(assert (=> b!1041064 (= e!589505 (bvadd #b00000000000000000000000000000001 call!44091))))

(assert (= (and d!125767 c!105575) b!1041061))

(assert (= (and d!125767 (not c!105575)) b!1041063))

(assert (= (and b!1041063 c!105574) b!1041064))

(assert (= (and b!1041063 (not c!105574)) b!1041062))

(assert (= (or b!1041064 b!1041062) bm!44088))

(declare-fun m!960547 () Bool)

(assert (=> bm!44088 m!960547))

(assert (=> b!1041063 m!960519))

(assert (=> b!1041063 m!960519))

(assert (=> b!1041063 m!960521))

(assert (=> bm!44081 d!125767))

(declare-fun b!1041065 () Bool)

(declare-fun e!589507 () Bool)

(declare-fun call!44092 () Bool)

(assert (=> b!1041065 (= e!589507 call!44092)))

(declare-fun b!1041067 () Bool)

(assert (=> b!1041067 (= e!589507 call!44092)))

(declare-fun b!1041068 () Bool)

(declare-fun e!589509 () Bool)

(assert (=> b!1041068 (= e!589509 e!589507)))

(declare-fun c!105576 () Bool)

(assert (=> b!1041068 (= c!105576 (validKeyInArray!0 (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125769 () Bool)

(declare-fun res!693969 () Bool)

(declare-fun e!589506 () Bool)

(assert (=> d!125769 (=> res!693969 e!589506)))

(assert (=> d!125769 (= res!693969 (bvsge #b00000000000000000000000000000000 (size!32112 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))))))))

(assert (=> d!125769 (= (arrayNoDuplicates!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000000 Nil!21961) e!589506)))

(declare-fun b!1041066 () Bool)

(assert (=> b!1041066 (= e!589506 e!589509)))

(declare-fun res!693970 () Bool)

(assert (=> b!1041066 (=> (not res!693970) (not e!589509))))

(declare-fun e!589508 () Bool)

(assert (=> b!1041066 (= res!693970 (not e!589508))))

(declare-fun res!693968 () Bool)

(assert (=> b!1041066 (=> (not res!693968) (not e!589508))))

(assert (=> b!1041066 (= res!693968 (validKeyInArray!0 (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041069 () Bool)

(assert (=> b!1041069 (= e!589508 (contains!6052 Nil!21961 (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun bm!44089 () Bool)

(assert (=> bm!44089 (= call!44092 (arrayNoDuplicates!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105576 (Cons!21960 (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000) Nil!21961) Nil!21961)))))

(assert (= (and d!125769 (not res!693969)) b!1041066))

(assert (= (and b!1041066 res!693968) b!1041069))

(assert (= (and b!1041066 res!693970) b!1041068))

(assert (= (and b!1041068 c!105576) b!1041067))

(assert (= (and b!1041068 (not c!105576)) b!1041065))

(assert (= (or b!1041067 b!1041065) bm!44089))

(declare-fun m!960549 () Bool)

(assert (=> b!1041068 m!960549))

(assert (=> b!1041068 m!960549))

(declare-fun m!960551 () Bool)

(assert (=> b!1041068 m!960551))

(assert (=> b!1041066 m!960549))

(assert (=> b!1041066 m!960549))

(assert (=> b!1041066 m!960551))

(assert (=> b!1041069 m!960549))

(assert (=> b!1041069 m!960549))

(declare-fun m!960553 () Bool)

(assert (=> b!1041069 m!960553))

(assert (=> bm!44089 m!960549))

(declare-fun m!960555 () Bool)

(assert (=> bm!44089 m!960555))

(assert (=> b!1040930 d!125769))

(declare-fun d!125771 () Bool)

(assert (=> d!125771 (= (validKeyInArray!0 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040941 d!125771))

(declare-fun d!125773 () Bool)

(assert (=> d!125773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) (mask!30356 thiss!1427))))

(assert (=> d!125773 true))

(declare-fun _$44!21 () Unit!34025)

(assert (=> d!125773 (= (choose!25 (_keys!11575 thiss!1427) (index!41580 lt!458755) (mask!30356 thiss!1427)) _$44!21)))

(declare-fun bs!30448 () Bool)

(assert (= bs!30448 d!125773))

(assert (=> bs!30448 m!960395))

(assert (=> bs!30448 m!960471))

(assert (=> d!125725 d!125773))

(assert (=> d!125725 d!125731))

(declare-fun d!125775 () Bool)

(assert (=> d!125775 (not (arrayContainsKey!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) key!909 #b00000000000000000000000000000000))))

(assert (=> d!125775 true))

(declare-fun _$59!23 () Unit!34025)

(assert (=> d!125775 (= (choose!121 (_keys!11575 thiss!1427) (index!41580 lt!458755) key!909) _$59!23)))

(declare-fun bs!30449 () Bool)

(assert (= bs!30449 d!125775))

(assert (=> bs!30449 m!960395))

(assert (=> bs!30449 m!960445))

(assert (=> d!125719 d!125775))

(declare-fun d!125777 () Bool)

(assert (=> d!125777 (= (arrayCountValidKeys!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11575 thiss!1427) #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> d!125777 true))

(declare-fun _$79!23 () Unit!34025)

(assert (=> d!125777 (= (choose!82 (_keys!11575 thiss!1427) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) _$79!23)))

(declare-fun bs!30450 () Bool)

(assert (= bs!30450 d!125777))

(assert (=> bs!30450 m!960395))

(assert (=> bs!30450 m!960453))

(assert (=> bs!30450 m!960385))

(assert (=> d!125721 d!125777))

(declare-fun b!1041082 () Bool)

(declare-fun e!589516 () SeekEntryResult!9802)

(assert (=> b!1041082 (= e!589516 (MissingVacant!9802 (index!41581 lt!458815)))))

(declare-fun d!125779 () Bool)

(declare-fun lt!458840 () SeekEntryResult!9802)

(assert (=> d!125779 (and (or ((_ is Undefined!9802) lt!458840) (not ((_ is Found!9802) lt!458840)) (and (bvsge (index!41580 lt!458840) #b00000000000000000000000000000000) (bvslt (index!41580 lt!458840) (size!32112 (_keys!11575 thiss!1427))))) (or ((_ is Undefined!9802) lt!458840) ((_ is Found!9802) lt!458840) (not ((_ is MissingVacant!9802) lt!458840)) (not (= (index!41582 lt!458840) (index!41581 lt!458815))) (and (bvsge (index!41582 lt!458840) #b00000000000000000000000000000000) (bvslt (index!41582 lt!458840) (size!32112 (_keys!11575 thiss!1427))))) (or ((_ is Undefined!9802) lt!458840) (ite ((_ is Found!9802) lt!458840) (= (select (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458840)) key!909) (and ((_ is MissingVacant!9802) lt!458840) (= (index!41582 lt!458840) (index!41581 lt!458815)) (= (select (arr!31581 (_keys!11575 thiss!1427)) (index!41582 lt!458840)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!589517 () SeekEntryResult!9802)

(assert (=> d!125779 (= lt!458840 e!589517)))

(declare-fun c!105585 () Bool)

(assert (=> d!125779 (= c!105585 (bvsge (x!92922 lt!458815) #b01111111111111111111111111111110))))

(declare-fun lt!458841 () (_ BitVec 64))

(assert (=> d!125779 (= lt!458841 (select (arr!31581 (_keys!11575 thiss!1427)) (index!41581 lt!458815)))))

(assert (=> d!125779 (validMask!0 (mask!30356 thiss!1427))))

(assert (=> d!125779 (= (seekKeyOrZeroReturnVacant!0 (x!92922 lt!458815) (index!41581 lt!458815) (index!41581 lt!458815) key!909 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)) lt!458840)))

(declare-fun b!1041083 () Bool)

(assert (=> b!1041083 (= e!589517 Undefined!9802)))

(declare-fun b!1041084 () Bool)

(declare-fun c!105584 () Bool)

(assert (=> b!1041084 (= c!105584 (= lt!458841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589518 () SeekEntryResult!9802)

(assert (=> b!1041084 (= e!589518 e!589516)))

(declare-fun b!1041085 () Bool)

(assert (=> b!1041085 (= e!589516 (seekKeyOrZeroReturnVacant!0 (bvadd (x!92922 lt!458815) #b00000000000000000000000000000001) (nextIndex!0 (index!41581 lt!458815) (x!92922 lt!458815) (mask!30356 thiss!1427)) (index!41581 lt!458815) key!909 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)))))

(declare-fun b!1041086 () Bool)

(assert (=> b!1041086 (= e!589518 (Found!9802 (index!41581 lt!458815)))))

(declare-fun b!1041087 () Bool)

(assert (=> b!1041087 (= e!589517 e!589518)))

(declare-fun c!105583 () Bool)

(assert (=> b!1041087 (= c!105583 (= lt!458841 key!909))))

(assert (= (and d!125779 c!105585) b!1041083))

(assert (= (and d!125779 (not c!105585)) b!1041087))

(assert (= (and b!1041087 c!105583) b!1041086))

(assert (= (and b!1041087 (not c!105583)) b!1041084))

(assert (= (and b!1041084 c!105584) b!1041082))

(assert (= (and b!1041084 (not c!105584)) b!1041085))

(declare-fun m!960557 () Bool)

(assert (=> d!125779 m!960557))

(declare-fun m!960559 () Bool)

(assert (=> d!125779 m!960559))

(assert (=> d!125779 m!960503))

(assert (=> d!125779 m!960379))

(declare-fun m!960561 () Bool)

(assert (=> b!1041085 m!960561))

(assert (=> b!1041085 m!960561))

(declare-fun m!960563 () Bool)

(assert (=> b!1041085 m!960563))

(assert (=> b!1040994 d!125779))

(assert (=> b!1040964 d!125749))

(declare-fun b!1041088 () Bool)

(declare-fun e!589519 () Bool)

(declare-fun call!44093 () Bool)

(assert (=> b!1041088 (= e!589519 call!44093)))

(declare-fun b!1041089 () Bool)

(declare-fun e!589520 () Bool)

(declare-fun e!589521 () Bool)

(assert (=> b!1041089 (= e!589520 e!589521)))

(declare-fun c!105586 () Bool)

(assert (=> b!1041089 (= c!105586 (validKeyInArray!0 (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun d!125781 () Bool)

(declare-fun res!693972 () Bool)

(assert (=> d!125781 (=> res!693972 e!589520)))

(assert (=> d!125781 (= res!693972 (bvsge #b00000000000000000000000000000000 (size!32112 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))))))))

(assert (=> d!125781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) (mask!30356 thiss!1427)) e!589520)))

(declare-fun bm!44090 () Bool)

(assert (=> bm!44090 (= call!44093 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) (mask!30356 thiss!1427)))))

(declare-fun b!1041090 () Bool)

(assert (=> b!1041090 (= e!589521 call!44093)))

(declare-fun b!1041091 () Bool)

(assert (=> b!1041091 (= e!589521 e!589519)))

(declare-fun lt!458843 () (_ BitVec 64))

(assert (=> b!1041091 (= lt!458843 (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000))))

(declare-fun lt!458844 () Unit!34025)

(assert (=> b!1041091 (= lt!458844 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) lt!458843 #b00000000000000000000000000000000))))

(assert (=> b!1041091 (arrayContainsKey!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) lt!458843 #b00000000000000000000000000000000)))

(declare-fun lt!458842 () Unit!34025)

(assert (=> b!1041091 (= lt!458842 lt!458844)))

(declare-fun res!693971 () Bool)

(assert (=> b!1041091 (= res!693971 (= (seekEntryOrOpen!0 (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000) (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) (mask!30356 thiss!1427)) (Found!9802 #b00000000000000000000000000000000)))))

(assert (=> b!1041091 (=> (not res!693971) (not e!589519))))

(assert (= (and d!125781 (not res!693972)) b!1041089))

(assert (= (and b!1041089 c!105586) b!1041091))

(assert (= (and b!1041089 (not c!105586)) b!1041090))

(assert (= (and b!1041091 res!693971) b!1041088))

(assert (= (or b!1041088 b!1041090) bm!44090))

(assert (=> b!1041089 m!960549))

(assert (=> b!1041089 m!960549))

(assert (=> b!1041089 m!960551))

(declare-fun m!960565 () Bool)

(assert (=> bm!44090 m!960565))

(assert (=> b!1041091 m!960549))

(declare-fun m!960567 () Bool)

(assert (=> b!1041091 m!960567))

(declare-fun m!960569 () Bool)

(assert (=> b!1041091 m!960569))

(assert (=> b!1041091 m!960549))

(declare-fun m!960571 () Bool)

(assert (=> b!1041091 m!960571))

(assert (=> b!1040927 d!125781))

(declare-fun b!1041092 () Bool)

(declare-fun e!589522 () Bool)

(declare-fun call!44094 () Bool)

(assert (=> b!1041092 (= e!589522 call!44094)))

(declare-fun b!1041093 () Bool)

(declare-fun e!589523 () Bool)

(declare-fun e!589524 () Bool)

(assert (=> b!1041093 (= e!589523 e!589524)))

(declare-fun c!105587 () Bool)

(assert (=> b!1041093 (= c!105587 (validKeyInArray!0 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125783 () Bool)

(declare-fun res!693974 () Bool)

(assert (=> d!125783 (=> res!693974 e!589523)))

(assert (=> d!125783 (= res!693974 (bvsge #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125783 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11575 thiss!1427) (mask!30356 thiss!1427)) e!589523)))

(declare-fun bm!44091 () Bool)

(assert (=> bm!44091 (= call!44094 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11575 thiss!1427) (mask!30356 thiss!1427)))))

(declare-fun b!1041094 () Bool)

(assert (=> b!1041094 (= e!589524 call!44094)))

(declare-fun b!1041095 () Bool)

(assert (=> b!1041095 (= e!589524 e!589522)))

(declare-fun lt!458846 () (_ BitVec 64))

(assert (=> b!1041095 (= lt!458846 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!458847 () Unit!34025)

(assert (=> b!1041095 (= lt!458847 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11575 thiss!1427) lt!458846 #b00000000000000000000000000000000))))

(assert (=> b!1041095 (arrayContainsKey!0 (_keys!11575 thiss!1427) lt!458846 #b00000000000000000000000000000000)))

(declare-fun lt!458845 () Unit!34025)

(assert (=> b!1041095 (= lt!458845 lt!458847)))

(declare-fun res!693973 () Bool)

(assert (=> b!1041095 (= res!693973 (= (seekEntryOrOpen!0 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000) (_keys!11575 thiss!1427) (mask!30356 thiss!1427)) (Found!9802 #b00000000000000000000000000000000)))))

(assert (=> b!1041095 (=> (not res!693973) (not e!589522))))

(assert (= (and d!125783 (not res!693974)) b!1041093))

(assert (= (and b!1041093 c!105587) b!1041095))

(assert (= (and b!1041093 (not c!105587)) b!1041094))

(assert (= (and b!1041095 res!693973) b!1041092))

(assert (= (or b!1041092 b!1041094) bm!44091))

(assert (=> b!1041093 m!960479))

(assert (=> b!1041093 m!960479))

(assert (=> b!1041093 m!960481))

(declare-fun m!960573 () Bool)

(assert (=> bm!44091 m!960573))

(assert (=> b!1041095 m!960479))

(declare-fun m!960575 () Bool)

(assert (=> b!1041095 m!960575))

(declare-fun m!960577 () Bool)

(assert (=> b!1041095 m!960577))

(assert (=> b!1041095 m!960479))

(declare-fun m!960579 () Bool)

(assert (=> b!1041095 m!960579))

(assert (=> b!1040975 d!125783))

(declare-fun d!125785 () Bool)

(assert (=> d!125785 (arrayContainsKey!0 lt!458756 lt!458792 #b00000000000000000000000000000000)))

(declare-fun lt!458850 () Unit!34025)

(declare-fun choose!13 (array!65636 (_ BitVec 64) (_ BitVec 32)) Unit!34025)

(assert (=> d!125785 (= lt!458850 (choose!13 lt!458756 lt!458792 #b00000000000000000000000000000000))))

(assert (=> d!125785 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!125785 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!458756 lt!458792 #b00000000000000000000000000000000) lt!458850)))

(declare-fun bs!30451 () Bool)

(assert (= bs!30451 d!125785))

(assert (=> bs!30451 m!960465))

(declare-fun m!960581 () Bool)

(assert (=> bs!30451 m!960581))

(assert (=> b!1040924 d!125785))

(declare-fun d!125787 () Bool)

(declare-fun res!693975 () Bool)

(declare-fun e!589525 () Bool)

(assert (=> d!125787 (=> res!693975 e!589525)))

(assert (=> d!125787 (= res!693975 (= (select (arr!31581 lt!458756) #b00000000000000000000000000000000) lt!458792))))

(assert (=> d!125787 (= (arrayContainsKey!0 lt!458756 lt!458792 #b00000000000000000000000000000000) e!589525)))

(declare-fun b!1041096 () Bool)

(declare-fun e!589526 () Bool)

(assert (=> b!1041096 (= e!589525 e!589526)))

(declare-fun res!693976 () Bool)

(assert (=> b!1041096 (=> (not res!693976) (not e!589526))))

(assert (=> b!1041096 (= res!693976 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 lt!458756)))))

(declare-fun b!1041097 () Bool)

(assert (=> b!1041097 (= e!589526 (arrayContainsKey!0 lt!458756 lt!458792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125787 (not res!693975)) b!1041096))

(assert (= (and b!1041096 res!693976) b!1041097))

(assert (=> d!125787 m!960457))

(declare-fun m!960583 () Bool)

(assert (=> b!1041097 m!960583))

(assert (=> b!1040924 d!125787))

(declare-fun b!1041110 () Bool)

(declare-fun c!105595 () Bool)

(declare-fun lt!458858 () (_ BitVec 64))

(assert (=> b!1041110 (= c!105595 (= lt!458858 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!589534 () SeekEntryResult!9802)

(declare-fun e!589533 () SeekEntryResult!9802)

(assert (=> b!1041110 (= e!589534 e!589533)))

(declare-fun d!125789 () Bool)

(declare-fun lt!458859 () SeekEntryResult!9802)

(assert (=> d!125789 (and (or ((_ is Undefined!9802) lt!458859) (not ((_ is Found!9802) lt!458859)) (and (bvsge (index!41580 lt!458859) #b00000000000000000000000000000000) (bvslt (index!41580 lt!458859) (size!32112 lt!458756)))) (or ((_ is Undefined!9802) lt!458859) ((_ is Found!9802) lt!458859) (not ((_ is MissingZero!9802) lt!458859)) (and (bvsge (index!41579 lt!458859) #b00000000000000000000000000000000) (bvslt (index!41579 lt!458859) (size!32112 lt!458756)))) (or ((_ is Undefined!9802) lt!458859) ((_ is Found!9802) lt!458859) ((_ is MissingZero!9802) lt!458859) (not ((_ is MissingVacant!9802) lt!458859)) (and (bvsge (index!41582 lt!458859) #b00000000000000000000000000000000) (bvslt (index!41582 lt!458859) (size!32112 lt!458756)))) (or ((_ is Undefined!9802) lt!458859) (ite ((_ is Found!9802) lt!458859) (= (select (arr!31581 lt!458756) (index!41580 lt!458859)) (select (arr!31581 lt!458756) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9802) lt!458859) (= (select (arr!31581 lt!458756) (index!41579 lt!458859)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9802) lt!458859) (= (select (arr!31581 lt!458756) (index!41582 lt!458859)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!589535 () SeekEntryResult!9802)

(assert (=> d!125789 (= lt!458859 e!589535)))

(declare-fun c!105594 () Bool)

(declare-fun lt!458857 () SeekEntryResult!9802)

(assert (=> d!125789 (= c!105594 (and ((_ is Intermediate!9802) lt!458857) (undefined!10614 lt!458857)))))

(assert (=> d!125789 (= lt!458857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31581 lt!458756) #b00000000000000000000000000000000) (mask!30356 thiss!1427)) (select (arr!31581 lt!458756) #b00000000000000000000000000000000) lt!458756 (mask!30356 thiss!1427)))))

(assert (=> d!125789 (validMask!0 (mask!30356 thiss!1427))))

(assert (=> d!125789 (= (seekEntryOrOpen!0 (select (arr!31581 lt!458756) #b00000000000000000000000000000000) lt!458756 (mask!30356 thiss!1427)) lt!458859)))

(declare-fun b!1041111 () Bool)

(assert (=> b!1041111 (= e!589535 e!589534)))

(assert (=> b!1041111 (= lt!458858 (select (arr!31581 lt!458756) (index!41581 lt!458857)))))

(declare-fun c!105596 () Bool)

(assert (=> b!1041111 (= c!105596 (= lt!458858 (select (arr!31581 lt!458756) #b00000000000000000000000000000000)))))

(declare-fun b!1041112 () Bool)

(assert (=> b!1041112 (= e!589533 (seekKeyOrZeroReturnVacant!0 (x!92922 lt!458857) (index!41581 lt!458857) (index!41581 lt!458857) (select (arr!31581 lt!458756) #b00000000000000000000000000000000) lt!458756 (mask!30356 thiss!1427)))))

(declare-fun b!1041113 () Bool)

(assert (=> b!1041113 (= e!589534 (Found!9802 (index!41581 lt!458857)))))

(declare-fun b!1041114 () Bool)

(assert (=> b!1041114 (= e!589533 (MissingZero!9802 (index!41581 lt!458857)))))

(declare-fun b!1041115 () Bool)

(assert (=> b!1041115 (= e!589535 Undefined!9802)))

(assert (= (and d!125789 c!105594) b!1041115))

(assert (= (and d!125789 (not c!105594)) b!1041111))

(assert (= (and b!1041111 c!105596) b!1041113))

(assert (= (and b!1041111 (not c!105596)) b!1041110))

(assert (= (and b!1041110 c!105595) b!1041114))

(assert (= (and b!1041110 (not c!105595)) b!1041112))

(declare-fun m!960585 () Bool)

(assert (=> d!125789 m!960585))

(assert (=> d!125789 m!960457))

(declare-fun m!960587 () Bool)

(assert (=> d!125789 m!960587))

(declare-fun m!960589 () Bool)

(assert (=> d!125789 m!960589))

(declare-fun m!960591 () Bool)

(assert (=> d!125789 m!960591))

(assert (=> d!125789 m!960457))

(assert (=> d!125789 m!960585))

(declare-fun m!960593 () Bool)

(assert (=> d!125789 m!960593))

(assert (=> d!125789 m!960379))

(declare-fun m!960595 () Bool)

(assert (=> b!1041111 m!960595))

(assert (=> b!1041112 m!960457))

(declare-fun m!960597 () Bool)

(assert (=> b!1041112 m!960597))

(assert (=> b!1040924 d!125789))

(declare-fun d!125791 () Bool)

(assert (=> d!125791 (= (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000) false)))

(assert (=> b!1040910 d!125791))

(declare-fun b!1041116 () Bool)

(declare-fun e!589537 () Bool)

(declare-fun call!44095 () Bool)

(assert (=> b!1041116 (= e!589537 call!44095)))

(declare-fun b!1041118 () Bool)

(assert (=> b!1041118 (= e!589537 call!44095)))

(declare-fun b!1041119 () Bool)

(declare-fun e!589539 () Bool)

(assert (=> b!1041119 (= e!589539 e!589537)))

(declare-fun c!105597 () Bool)

(assert (=> b!1041119 (= c!105597 (validKeyInArray!0 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!125793 () Bool)

(declare-fun res!693978 () Bool)

(declare-fun e!589536 () Bool)

(assert (=> d!125793 (=> res!693978 e!589536)))

(assert (=> d!125793 (= res!693978 (bvsge #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125793 (= (arrayNoDuplicates!0 (_keys!11575 thiss!1427) #b00000000000000000000000000000000 Nil!21961) e!589536)))

(declare-fun b!1041117 () Bool)

(assert (=> b!1041117 (= e!589536 e!589539)))

(declare-fun res!693979 () Bool)

(assert (=> b!1041117 (=> (not res!693979) (not e!589539))))

(declare-fun e!589538 () Bool)

(assert (=> b!1041117 (= res!693979 (not e!589538))))

(declare-fun res!693977 () Bool)

(assert (=> b!1041117 (=> (not res!693977) (not e!589538))))

(assert (=> b!1041117 (= res!693977 (validKeyInArray!0 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1041120 () Bool)

(assert (=> b!1041120 (= e!589538 (contains!6052 Nil!21961 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44092 () Bool)

(assert (=> bm!44092 (= call!44095 (arrayNoDuplicates!0 (_keys!11575 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105597 (Cons!21960 (select (arr!31581 (_keys!11575 thiss!1427)) #b00000000000000000000000000000000) Nil!21961) Nil!21961)))))

(assert (= (and d!125793 (not res!693978)) b!1041117))

(assert (= (and b!1041117 res!693977) b!1041120))

(assert (= (and b!1041117 res!693979) b!1041119))

(assert (= (and b!1041119 c!105597) b!1041118))

(assert (= (and b!1041119 (not c!105597)) b!1041116))

(assert (= (or b!1041118 b!1041116) bm!44092))

(assert (=> b!1041119 m!960479))

(assert (=> b!1041119 m!960479))

(assert (=> b!1041119 m!960481))

(assert (=> b!1041117 m!960479))

(assert (=> b!1041117 m!960479))

(assert (=> b!1041117 m!960481))

(assert (=> b!1041120 m!960479))

(assert (=> b!1041120 m!960479))

(declare-fun m!960599 () Bool)

(assert (=> b!1041120 m!960599))

(assert (=> bm!44092 m!960479))

(declare-fun m!960601 () Bool)

(assert (=> bm!44092 m!960601))

(assert (=> b!1040976 d!125793))

(declare-fun d!125795 () Bool)

(declare-fun res!693980 () Bool)

(declare-fun e!589540 () Bool)

(assert (=> d!125795 (=> res!693980 e!589540)))

(assert (=> d!125795 (= res!693980 (= (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000) key!909))))

(assert (=> d!125795 (= (arrayContainsKey!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) key!909 #b00000000000000000000000000000000) e!589540)))

(declare-fun b!1041121 () Bool)

(declare-fun e!589541 () Bool)

(assert (=> b!1041121 (= e!589540 e!589541)))

(declare-fun res!693981 () Bool)

(assert (=> b!1041121 (=> (not res!693981) (not e!589541))))

(assert (=> b!1041121 (= res!693981 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))))))))

(declare-fun b!1041122 () Bool)

(assert (=> b!1041122 (= e!589541 (arrayContainsKey!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!125795 (not res!693980)) b!1041121))

(assert (= (and b!1041121 res!693981) b!1041122))

(assert (=> d!125795 m!960549))

(declare-fun m!960603 () Bool)

(assert (=> b!1041122 m!960603))

(assert (=> b!1040900 d!125795))

(declare-fun d!125797 () Bool)

(declare-fun res!693982 () Bool)

(declare-fun e!589542 () Bool)

(assert (=> d!125797 (=> res!693982 e!589542)))

(assert (=> d!125797 (= res!693982 (= (select (arr!31581 lt!458756) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!909))))

(assert (=> d!125797 (= (arrayContainsKey!0 lt!458756 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!589542)))

(declare-fun b!1041123 () Bool)

(declare-fun e!589543 () Bool)

(assert (=> b!1041123 (= e!589542 e!589543)))

(declare-fun res!693983 () Bool)

(assert (=> b!1041123 (=> (not res!693983) (not e!589543))))

(assert (=> b!1041123 (= res!693983 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!32112 lt!458756)))))

(declare-fun b!1041124 () Bool)

(assert (=> b!1041124 (= e!589543 (arrayContainsKey!0 lt!458756 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!125797 (not res!693982)) b!1041123))

(assert (= (and b!1041123 res!693983) b!1041124))

(assert (=> d!125797 m!960519))

(declare-fun m!960605 () Bool)

(assert (=> b!1041124 m!960605))

(assert (=> b!1040952 d!125797))

(declare-fun d!125799 () Bool)

(declare-fun lt!458860 () (_ BitVec 32))

(assert (=> d!125799 (and (bvsge lt!458860 #b00000000000000000000000000000000) (bvsle lt!458860 (bvsub (size!32112 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!589544 () (_ BitVec 32))

(assert (=> d!125799 (= lt!458860 e!589544)))

(declare-fun c!105599 () Bool)

(assert (=> d!125799 (= c!105599 (bvsge #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))))))

(assert (=> d!125799 (and (bvsle #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32112 (_keys!11575 thiss!1427)) (size!32112 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))))))))

(assert (=> d!125799 (= (arrayCountValidKeys!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) #b00000000000000000000000000000000 (size!32112 (_keys!11575 thiss!1427))) lt!458860)))

(declare-fun bm!44093 () Bool)

(declare-fun call!44096 () (_ BitVec 32))

(assert (=> bm!44093 (= call!44096 (arrayCountValidKeys!0 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32112 (_keys!11575 thiss!1427))))))

(declare-fun b!1041125 () Bool)

(assert (=> b!1041125 (= e!589544 #b00000000000000000000000000000000)))

(declare-fun b!1041126 () Bool)

(declare-fun e!589545 () (_ BitVec 32))

(assert (=> b!1041126 (= e!589545 call!44096)))

(declare-fun b!1041127 () Bool)

(assert (=> b!1041127 (= e!589544 e!589545)))

(declare-fun c!105598 () Bool)

(assert (=> b!1041127 (= c!105598 (validKeyInArray!0 (select (arr!31581 (array!65637 (store (arr!31581 (_keys!11575 thiss!1427)) (index!41580 lt!458755) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32112 (_keys!11575 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1041128 () Bool)

(assert (=> b!1041128 (= e!589545 (bvadd #b00000000000000000000000000000001 call!44096))))

(assert (= (and d!125799 c!105599) b!1041125))

(assert (= (and d!125799 (not c!105599)) b!1041127))

(assert (= (and b!1041127 c!105598) b!1041128))

(assert (= (and b!1041127 (not c!105598)) b!1041126))

(assert (= (or b!1041128 b!1041126) bm!44093))

(declare-fun m!960607 () Bool)

(assert (=> bm!44093 m!960607))

(assert (=> b!1041127 m!960549))

(assert (=> b!1041127 m!960549))

(assert (=> b!1041127 m!960551))

(assert (=> b!1040912 d!125799))

(assert (=> b!1040912 d!125729))

(declare-fun mapIsEmpty!38714 () Bool)

(declare-fun mapRes!38714 () Bool)

(assert (=> mapIsEmpty!38714 mapRes!38714))

(declare-fun b!1041130 () Bool)

(declare-fun e!589547 () Bool)

(assert (=> b!1041130 (= e!589547 tp_is_empty!24747)))

(declare-fun mapNonEmpty!38714 () Bool)

(declare-fun tp!74295 () Bool)

(declare-fun e!589546 () Bool)

(assert (=> mapNonEmpty!38714 (= mapRes!38714 (and tp!74295 e!589546))))

(declare-fun mapValue!38714 () ValueCell!11670)

(declare-fun mapKey!38714 () (_ BitVec 32))

(declare-fun mapRest!38714 () (Array (_ BitVec 32) ValueCell!11670))

(assert (=> mapNonEmpty!38714 (= mapRest!38713 (store mapRest!38714 mapKey!38714 mapValue!38714))))

(declare-fun condMapEmpty!38714 () Bool)

(declare-fun mapDefault!38714 () ValueCell!11670)

(assert (=> mapNonEmpty!38713 (= condMapEmpty!38714 (= mapRest!38713 ((as const (Array (_ BitVec 32) ValueCell!11670)) mapDefault!38714)))))

(assert (=> mapNonEmpty!38713 (= tp!74294 (and e!589547 mapRes!38714))))

(declare-fun b!1041129 () Bool)

(assert (=> b!1041129 (= e!589546 tp_is_empty!24747)))

(assert (= (and mapNonEmpty!38713 condMapEmpty!38714) mapIsEmpty!38714))

(assert (= (and mapNonEmpty!38713 (not condMapEmpty!38714)) mapNonEmpty!38714))

(assert (= (and mapNonEmpty!38714 ((_ is ValueCellFull!11670) mapValue!38714)) b!1041129))

(assert (= (and mapNonEmpty!38713 ((_ is ValueCellFull!11670) mapDefault!38714)) b!1041130))

(declare-fun m!960609 () Bool)

(assert (=> mapNonEmpty!38714 m!960609))

(check-sat (not b!1041028) (not b!1041060) (not mapNonEmpty!38714) (not b!1041091) (not bm!44092) (not b!1041120) (not b!1041127) (not b!1041048) b_and!33559 (not b!1041055) (not d!125755) (not d!125789) (not b!1041089) (not d!125763) (not b!1041040) (not b!1041063) (not b!1041068) (not b!1041119) tp_is_empty!24747 (not b!1041112) (not d!125779) (not bm!44091) (not b_next!21027) (not b!1041095) (not d!125751) (not d!125785) (not b!1041117) (not b!1041124) (not b!1041059) (not bm!44086) (not d!125747) (not b!1041122) (not b!1041043) (not bm!44093) (not b!1041093) (not d!125775) (not bm!44089) (not b!1041057) (not b!1041045) (not b!1041085) (not bm!44087) (not d!125773) (not b!1041039) (not b!1041069) (not bm!44090) (not d!125777) (not b!1041097) (not b!1041066) (not bm!44088) (not bm!44085))
(check-sat b_and!33559 (not b_next!21027))
