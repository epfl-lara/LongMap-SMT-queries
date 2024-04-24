; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91190 () Bool)

(assert start!91190)

(declare-fun b!1040437 () Bool)

(declare-fun b_free!20965 () Bool)

(declare-fun b_next!20965 () Bool)

(assert (=> b!1040437 (= b_free!20965 (not b_next!20965))))

(declare-fun tp!74068 () Bool)

(declare-fun b_and!33507 () Bool)

(assert (=> b!1040437 (= tp!74068 b_and!33507)))

(declare-fun b!1040433 () Bool)

(declare-fun e!588921 () Bool)

(declare-fun tp_is_empty!24685 () Bool)

(assert (=> b!1040433 (= e!588921 tp_is_empty!24685)))

(declare-fun b!1040434 () Bool)

(declare-fun e!588918 () Bool)

(assert (=> b!1040434 (= e!588918 tp_is_empty!24685)))

(declare-fun b!1040435 () Bool)

(declare-fun res!693544 () Bool)

(declare-fun e!588915 () Bool)

(assert (=> b!1040435 (=> (not res!693544) (not e!588915))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1040435 (= res!693544 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040436 () Bool)

(declare-fun e!588919 () Bool)

(assert (=> b!1040436 (= e!588915 e!588919)))

(declare-fun res!693542 () Bool)

(assert (=> b!1040436 (=> (not res!693542) (not e!588919))))

(declare-datatypes ((SeekEntryResult!9735 0))(
  ( (MissingZero!9735 (index!41311 (_ BitVec 32))) (Found!9735 (index!41312 (_ BitVec 32))) (Intermediate!9735 (undefined!10547 Bool) (index!41313 (_ BitVec 32)) (x!92717 (_ BitVec 32))) (Undefined!9735) (MissingVacant!9735 (index!41314 (_ BitVec 32))) )
))
(declare-fun lt!458502 () SeekEntryResult!9735)

(get-info :version)

(assert (=> b!1040436 (= res!693542 ((_ is Found!9735) lt!458502))))

(declare-datatypes ((V!37787 0))(
  ( (V!37788 (val!12393 Int)) )
))
(declare-datatypes ((ValueCell!11639 0))(
  ( (ValueCellFull!11639 (v!14976 V!37787)) (EmptyCell!11639) )
))
(declare-datatypes ((array!65541 0))(
  ( (array!65542 (arr!31537 (Array (_ BitVec 32) (_ BitVec 64))) (size!32069 (_ BitVec 32))) )
))
(declare-datatypes ((array!65543 0))(
  ( (array!65544 (arr!31538 (Array (_ BitVec 32) ValueCell!11639)) (size!32070 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5872 0))(
  ( (LongMapFixedSize!5873 (defaultEntry!6318 Int) (mask!30336 (_ BitVec 32)) (extraKeys!6046 (_ BitVec 32)) (zeroValue!6152 V!37787) (minValue!6152 V!37787) (_size!2991 (_ BitVec 32)) (_keys!11564 array!65541) (_values!6341 array!65543) (_vacant!2991 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5872)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65541 (_ BitVec 32)) SeekEntryResult!9735)

(assert (=> b!1040436 (= lt!458502 (seekEntry!0 key!909 (_keys!11564 thiss!1427) (mask!30336 thiss!1427)))))

(declare-fun e!588920 () Bool)

(declare-fun e!588914 () Bool)

(declare-fun array_inv!24393 (array!65541) Bool)

(declare-fun array_inv!24394 (array!65543) Bool)

(assert (=> b!1040437 (= e!588914 (and tp!74068 tp_is_empty!24685 (array_inv!24393 (_keys!11564 thiss!1427)) (array_inv!24394 (_values!6341 thiss!1427)) e!588920))))

(declare-fun mapIsEmpty!38584 () Bool)

(declare-fun mapRes!38584 () Bool)

(assert (=> mapIsEmpty!38584 mapRes!38584))

(declare-fun b!1040438 () Bool)

(declare-fun e!588916 () Bool)

(assert (=> b!1040438 (= e!588919 (not e!588916))))

(declare-fun res!693541 () Bool)

(assert (=> b!1040438 (=> res!693541 e!588916)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040438 (= res!693541 (not (validMask!0 (mask!30336 thiss!1427))))))

(declare-fun lt!458500 () array!65541)

(declare-datatypes ((List!21932 0))(
  ( (Nil!21929) (Cons!21928 (h!23141 (_ BitVec 64)) (t!31138 List!21932)) )
))
(declare-fun arrayNoDuplicates!0 (array!65541 (_ BitVec 32) List!21932) Bool)

(assert (=> b!1040438 (arrayNoDuplicates!0 lt!458500 #b00000000000000000000000000000000 Nil!21929)))

(declare-datatypes ((Unit!33991 0))(
  ( (Unit!33992) )
))
(declare-fun lt!458501 () Unit!33991)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21932) Unit!33991)

(assert (=> b!1040438 (= lt!458501 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11564 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41312 lt!458502) #b00000000000000000000000000000000 Nil!21929))))

(declare-fun arrayCountValidKeys!0 (array!65541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040438 (= (arrayCountValidKeys!0 lt!458500 #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11564 thiss!1427) #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040438 (= lt!458500 (array!65542 (store (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458502) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32069 (_keys!11564 thiss!1427))))))

(declare-fun lt!458503 () Unit!33991)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65541 (_ BitVec 32) (_ BitVec 64)) Unit!33991)

(assert (=> b!1040438 (= lt!458503 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11564 thiss!1427) (index!41312 lt!458502) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040439 () Bool)

(declare-fun res!693543 () Bool)

(assert (=> b!1040439 (=> res!693543 e!588916)))

(assert (=> b!1040439 (= res!693543 (or (not (= (size!32069 (_keys!11564 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30336 thiss!1427)))) (bvslt (index!41312 lt!458502) #b00000000000000000000000000000000) (bvsge (index!41312 lt!458502) (size!32069 (_keys!11564 thiss!1427)))))))

(declare-fun b!1040440 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040440 (= e!588916 (validKeyInArray!0 (select (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458502))))))

(declare-fun b!1040441 () Bool)

(assert (=> b!1040441 (= e!588920 (and e!588918 mapRes!38584))))

(declare-fun condMapEmpty!38584 () Bool)

(declare-fun mapDefault!38584 () ValueCell!11639)

(assert (=> b!1040441 (= condMapEmpty!38584 (= (arr!31538 (_values!6341 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11639)) mapDefault!38584)))))

(declare-fun mapNonEmpty!38584 () Bool)

(declare-fun tp!74069 () Bool)

(assert (=> mapNonEmpty!38584 (= mapRes!38584 (and tp!74069 e!588921))))

(declare-fun mapRest!38584 () (Array (_ BitVec 32) ValueCell!11639))

(declare-fun mapValue!38584 () ValueCell!11639)

(declare-fun mapKey!38584 () (_ BitVec 32))

(assert (=> mapNonEmpty!38584 (= (arr!31538 (_values!6341 thiss!1427)) (store mapRest!38584 mapKey!38584 mapValue!38584))))

(declare-fun res!693540 () Bool)

(assert (=> start!91190 (=> (not res!693540) (not e!588915))))

(declare-fun valid!2219 (LongMapFixedSize!5872) Bool)

(assert (=> start!91190 (= res!693540 (valid!2219 thiss!1427))))

(assert (=> start!91190 e!588915))

(assert (=> start!91190 e!588914))

(assert (=> start!91190 true))

(assert (= (and start!91190 res!693540) b!1040435))

(assert (= (and b!1040435 res!693544) b!1040436))

(assert (= (and b!1040436 res!693542) b!1040438))

(assert (= (and b!1040438 (not res!693541)) b!1040439))

(assert (= (and b!1040439 (not res!693543)) b!1040440))

(assert (= (and b!1040441 condMapEmpty!38584) mapIsEmpty!38584))

(assert (= (and b!1040441 (not condMapEmpty!38584)) mapNonEmpty!38584))

(assert (= (and mapNonEmpty!38584 ((_ is ValueCellFull!11639) mapValue!38584)) b!1040433))

(assert (= (and b!1040441 ((_ is ValueCellFull!11639) mapDefault!38584)) b!1040434))

(assert (= b!1040437 b!1040441))

(assert (= start!91190 b!1040437))

(declare-fun m!960557 () Bool)

(assert (=> b!1040440 m!960557))

(assert (=> b!1040440 m!960557))

(declare-fun m!960559 () Bool)

(assert (=> b!1040440 m!960559))

(declare-fun m!960561 () Bool)

(assert (=> b!1040436 m!960561))

(declare-fun m!960563 () Bool)

(assert (=> mapNonEmpty!38584 m!960563))

(declare-fun m!960565 () Bool)

(assert (=> b!1040438 m!960565))

(declare-fun m!960567 () Bool)

(assert (=> b!1040438 m!960567))

(declare-fun m!960569 () Bool)

(assert (=> b!1040438 m!960569))

(declare-fun m!960571 () Bool)

(assert (=> b!1040438 m!960571))

(declare-fun m!960573 () Bool)

(assert (=> b!1040438 m!960573))

(declare-fun m!960575 () Bool)

(assert (=> b!1040438 m!960575))

(declare-fun m!960577 () Bool)

(assert (=> b!1040438 m!960577))

(declare-fun m!960579 () Bool)

(assert (=> start!91190 m!960579))

(declare-fun m!960581 () Bool)

(assert (=> b!1040437 m!960581))

(declare-fun m!960583 () Bool)

(assert (=> b!1040437 m!960583))

(check-sat (not b!1040440) (not b!1040436) (not start!91190) (not b!1040438) (not mapNonEmpty!38584) (not b_next!20965) tp_is_empty!24685 b_and!33507 (not b!1040437))
(check-sat b_and!33507 (not b_next!20965))
(get-model)

(declare-fun d!125919 () Bool)

(assert (=> d!125919 (= (array_inv!24393 (_keys!11564 thiss!1427)) (bvsge (size!32069 (_keys!11564 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040437 d!125919))

(declare-fun d!125921 () Bool)

(assert (=> d!125921 (= (array_inv!24394 (_values!6341 thiss!1427)) (bvsge (size!32070 (_values!6341 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1040437 d!125921))

(declare-fun b!1040508 () Bool)

(declare-fun e!588976 () SeekEntryResult!9735)

(declare-fun lt!458538 () SeekEntryResult!9735)

(assert (=> b!1040508 (= e!588976 (ite ((_ is MissingVacant!9735) lt!458538) (MissingZero!9735 (index!41314 lt!458538)) lt!458538))))

(declare-fun lt!458539 () SeekEntryResult!9735)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65541 (_ BitVec 32)) SeekEntryResult!9735)

(assert (=> b!1040508 (= lt!458538 (seekKeyOrZeroReturnVacant!0 (x!92717 lt!458539) (index!41313 lt!458539) (index!41313 lt!458539) key!909 (_keys!11564 thiss!1427) (mask!30336 thiss!1427)))))

(declare-fun d!125923 () Bool)

(declare-fun lt!458536 () SeekEntryResult!9735)

(assert (=> d!125923 (and (or ((_ is MissingVacant!9735) lt!458536) (not ((_ is Found!9735) lt!458536)) (and (bvsge (index!41312 lt!458536) #b00000000000000000000000000000000) (bvslt (index!41312 lt!458536) (size!32069 (_keys!11564 thiss!1427))))) (not ((_ is MissingVacant!9735) lt!458536)) (or (not ((_ is Found!9735) lt!458536)) (= (select (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458536)) key!909)))))

(declare-fun e!588978 () SeekEntryResult!9735)

(assert (=> d!125923 (= lt!458536 e!588978)))

(declare-fun c!105726 () Bool)

(assert (=> d!125923 (= c!105726 (and ((_ is Intermediate!9735) lt!458539) (undefined!10547 lt!458539)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65541 (_ BitVec 32)) SeekEntryResult!9735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125923 (= lt!458539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30336 thiss!1427)) key!909 (_keys!11564 thiss!1427) (mask!30336 thiss!1427)))))

(assert (=> d!125923 (validMask!0 (mask!30336 thiss!1427))))

(assert (=> d!125923 (= (seekEntry!0 key!909 (_keys!11564 thiss!1427) (mask!30336 thiss!1427)) lt!458536)))

(declare-fun b!1040509 () Bool)

(assert (=> b!1040509 (= e!588976 (MissingZero!9735 (index!41313 lt!458539)))))

(declare-fun b!1040510 () Bool)

(declare-fun e!588977 () SeekEntryResult!9735)

(assert (=> b!1040510 (= e!588978 e!588977)))

(declare-fun lt!458537 () (_ BitVec 64))

(assert (=> b!1040510 (= lt!458537 (select (arr!31537 (_keys!11564 thiss!1427)) (index!41313 lt!458539)))))

(declare-fun c!105727 () Bool)

(assert (=> b!1040510 (= c!105727 (= lt!458537 key!909))))

(declare-fun b!1040511 () Bool)

(declare-fun c!105725 () Bool)

(assert (=> b!1040511 (= c!105725 (= lt!458537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1040511 (= e!588977 e!588976)))

(declare-fun b!1040512 () Bool)

(assert (=> b!1040512 (= e!588978 Undefined!9735)))

(declare-fun b!1040513 () Bool)

(assert (=> b!1040513 (= e!588977 (Found!9735 (index!41313 lt!458539)))))

(assert (= (and d!125923 c!105726) b!1040512))

(assert (= (and d!125923 (not c!105726)) b!1040510))

(assert (= (and b!1040510 c!105727) b!1040513))

(assert (= (and b!1040510 (not c!105727)) b!1040511))

(assert (= (and b!1040511 c!105725) b!1040509))

(assert (= (and b!1040511 (not c!105725)) b!1040508))

(declare-fun m!960641 () Bool)

(assert (=> b!1040508 m!960641))

(declare-fun m!960643 () Bool)

(assert (=> d!125923 m!960643))

(declare-fun m!960645 () Bool)

(assert (=> d!125923 m!960645))

(assert (=> d!125923 m!960645))

(declare-fun m!960647 () Bool)

(assert (=> d!125923 m!960647))

(assert (=> d!125923 m!960565))

(declare-fun m!960649 () Bool)

(assert (=> b!1040510 m!960649))

(assert (=> b!1040436 d!125923))

(declare-fun d!125925 () Bool)

(assert (=> d!125925 (= (validKeyInArray!0 (select (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458502))) (and (not (= (select (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458502)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458502)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1040440 d!125925))

(declare-fun d!125927 () Bool)

(declare-fun res!693581 () Bool)

(declare-fun e!588981 () Bool)

(assert (=> d!125927 (=> (not res!693581) (not e!588981))))

(declare-fun simpleValid!426 (LongMapFixedSize!5872) Bool)

(assert (=> d!125927 (= res!693581 (simpleValid!426 thiss!1427))))

(assert (=> d!125927 (= (valid!2219 thiss!1427) e!588981)))

(declare-fun b!1040520 () Bool)

(declare-fun res!693582 () Bool)

(assert (=> b!1040520 (=> (not res!693582) (not e!588981))))

(assert (=> b!1040520 (= res!693582 (= (arrayCountValidKeys!0 (_keys!11564 thiss!1427) #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) (_size!2991 thiss!1427)))))

(declare-fun b!1040521 () Bool)

(declare-fun res!693583 () Bool)

(assert (=> b!1040521 (=> (not res!693583) (not e!588981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65541 (_ BitVec 32)) Bool)

(assert (=> b!1040521 (= res!693583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11564 thiss!1427) (mask!30336 thiss!1427)))))

(declare-fun b!1040522 () Bool)

(assert (=> b!1040522 (= e!588981 (arrayNoDuplicates!0 (_keys!11564 thiss!1427) #b00000000000000000000000000000000 Nil!21929))))

(assert (= (and d!125927 res!693581) b!1040520))

(assert (= (and b!1040520 res!693582) b!1040521))

(assert (= (and b!1040521 res!693583) b!1040522))

(declare-fun m!960651 () Bool)

(assert (=> d!125927 m!960651))

(assert (=> b!1040520 m!960571))

(declare-fun m!960653 () Bool)

(assert (=> b!1040521 m!960653))

(declare-fun m!960655 () Bool)

(assert (=> b!1040522 m!960655))

(assert (=> start!91190 d!125927))

(declare-fun d!125929 () Bool)

(assert (=> d!125929 (= (validMask!0 (mask!30336 thiss!1427)) (and (or (= (mask!30336 thiss!1427) #b00000000000000000000000000000111) (= (mask!30336 thiss!1427) #b00000000000000000000000000001111) (= (mask!30336 thiss!1427) #b00000000000000000000000000011111) (= (mask!30336 thiss!1427) #b00000000000000000000000000111111) (= (mask!30336 thiss!1427) #b00000000000000000000000001111111) (= (mask!30336 thiss!1427) #b00000000000000000000000011111111) (= (mask!30336 thiss!1427) #b00000000000000000000000111111111) (= (mask!30336 thiss!1427) #b00000000000000000000001111111111) (= (mask!30336 thiss!1427) #b00000000000000000000011111111111) (= (mask!30336 thiss!1427) #b00000000000000000000111111111111) (= (mask!30336 thiss!1427) #b00000000000000000001111111111111) (= (mask!30336 thiss!1427) #b00000000000000000011111111111111) (= (mask!30336 thiss!1427) #b00000000000000000111111111111111) (= (mask!30336 thiss!1427) #b00000000000000001111111111111111) (= (mask!30336 thiss!1427) #b00000000000000011111111111111111) (= (mask!30336 thiss!1427) #b00000000000000111111111111111111) (= (mask!30336 thiss!1427) #b00000000000001111111111111111111) (= (mask!30336 thiss!1427) #b00000000000011111111111111111111) (= (mask!30336 thiss!1427) #b00000000000111111111111111111111) (= (mask!30336 thiss!1427) #b00000000001111111111111111111111) (= (mask!30336 thiss!1427) #b00000000011111111111111111111111) (= (mask!30336 thiss!1427) #b00000000111111111111111111111111) (= (mask!30336 thiss!1427) #b00000001111111111111111111111111) (= (mask!30336 thiss!1427) #b00000011111111111111111111111111) (= (mask!30336 thiss!1427) #b00000111111111111111111111111111) (= (mask!30336 thiss!1427) #b00001111111111111111111111111111) (= (mask!30336 thiss!1427) #b00011111111111111111111111111111) (= (mask!30336 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30336 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1040438 d!125929))

(declare-fun b!1040531 () Bool)

(declare-fun e!588987 () (_ BitVec 32))

(declare-fun call!44048 () (_ BitVec 32))

(assert (=> b!1040531 (= e!588987 call!44048)))

(declare-fun b!1040532 () Bool)

(declare-fun e!588986 () (_ BitVec 32))

(assert (=> b!1040532 (= e!588986 e!588987)))

(declare-fun c!105732 () Bool)

(assert (=> b!1040532 (= c!105732 (validKeyInArray!0 (select (arr!31537 (_keys!11564 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!44045 () Bool)

(assert (=> bm!44045 (= call!44048 (arrayCountValidKeys!0 (_keys!11564 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32069 (_keys!11564 thiss!1427))))))

(declare-fun b!1040533 () Bool)

(assert (=> b!1040533 (= e!588987 (bvadd #b00000000000000000000000000000001 call!44048))))

(declare-fun d!125931 () Bool)

(declare-fun lt!458542 () (_ BitVec 32))

(assert (=> d!125931 (and (bvsge lt!458542 #b00000000000000000000000000000000) (bvsle lt!458542 (bvsub (size!32069 (_keys!11564 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125931 (= lt!458542 e!588986)))

(declare-fun c!105733 () Bool)

(assert (=> d!125931 (= c!105733 (bvsge #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))))))

(assert (=> d!125931 (and (bvsle #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32069 (_keys!11564 thiss!1427)) (size!32069 (_keys!11564 thiss!1427))))))

(assert (=> d!125931 (= (arrayCountValidKeys!0 (_keys!11564 thiss!1427) #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) lt!458542)))

(declare-fun b!1040534 () Bool)

(assert (=> b!1040534 (= e!588986 #b00000000000000000000000000000000)))

(assert (= (and d!125931 c!105733) b!1040534))

(assert (= (and d!125931 (not c!105733)) b!1040532))

(assert (= (and b!1040532 c!105732) b!1040533))

(assert (= (and b!1040532 (not c!105732)) b!1040531))

(assert (= (or b!1040533 b!1040531) bm!44045))

(declare-fun m!960657 () Bool)

(assert (=> b!1040532 m!960657))

(assert (=> b!1040532 m!960657))

(declare-fun m!960659 () Bool)

(assert (=> b!1040532 m!960659))

(declare-fun m!960661 () Bool)

(assert (=> bm!44045 m!960661))

(assert (=> b!1040438 d!125931))

(declare-fun d!125933 () Bool)

(declare-fun e!588990 () Bool)

(assert (=> d!125933 e!588990))

(declare-fun res!693586 () Bool)

(assert (=> d!125933 (=> (not res!693586) (not e!588990))))

(assert (=> d!125933 (= res!693586 (and (bvsge (index!41312 lt!458502) #b00000000000000000000000000000000) (bvslt (index!41312 lt!458502) (size!32069 (_keys!11564 thiss!1427)))))))

(declare-fun lt!458545 () Unit!33991)

(declare-fun choose!53 (array!65541 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21932) Unit!33991)

(assert (=> d!125933 (= lt!458545 (choose!53 (_keys!11564 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41312 lt!458502) #b00000000000000000000000000000000 Nil!21929))))

(assert (=> d!125933 (bvslt (size!32069 (_keys!11564 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!125933 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11564 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41312 lt!458502) #b00000000000000000000000000000000 Nil!21929) lt!458545)))

(declare-fun b!1040537 () Bool)

(assert (=> b!1040537 (= e!588990 (arrayNoDuplicates!0 (array!65542 (store (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458502) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32069 (_keys!11564 thiss!1427))) #b00000000000000000000000000000000 Nil!21929))))

(assert (= (and d!125933 res!693586) b!1040537))

(declare-fun m!960663 () Bool)

(assert (=> d!125933 m!960663))

(assert (=> b!1040537 m!960573))

(declare-fun m!960665 () Bool)

(assert (=> b!1040537 m!960665))

(assert (=> b!1040438 d!125933))

(declare-fun b!1040547 () Bool)

(declare-fun res!693596 () Bool)

(declare-fun e!588996 () Bool)

(assert (=> b!1040547 (=> (not res!693596) (not e!588996))))

(assert (=> b!1040547 (= res!693596 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1040549 () Bool)

(declare-fun e!588995 () Bool)

(assert (=> b!1040549 (= e!588995 (= (arrayCountValidKeys!0 (array!65542 (store (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458502) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32069 (_keys!11564 thiss!1427))) #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11564 thiss!1427) #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1040548 () Bool)

(assert (=> b!1040548 (= e!588996 (bvslt (size!32069 (_keys!11564 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1040546 () Bool)

(declare-fun res!693597 () Bool)

(assert (=> b!1040546 (=> (not res!693597) (not e!588996))))

(assert (=> b!1040546 (= res!693597 (validKeyInArray!0 (select (arr!31537 (_keys!11564 thiss!1427)) (index!41312 lt!458502))))))

(declare-fun d!125935 () Bool)

(assert (=> d!125935 e!588995))

(declare-fun res!693598 () Bool)

(assert (=> d!125935 (=> (not res!693598) (not e!588995))))

(assert (=> d!125935 (= res!693598 (and (bvsge (index!41312 lt!458502) #b00000000000000000000000000000000) (bvslt (index!41312 lt!458502) (size!32069 (_keys!11564 thiss!1427)))))))

(declare-fun lt!458548 () Unit!33991)

(declare-fun choose!82 (array!65541 (_ BitVec 32) (_ BitVec 64)) Unit!33991)

(assert (=> d!125935 (= lt!458548 (choose!82 (_keys!11564 thiss!1427) (index!41312 lt!458502) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125935 e!588996))

(declare-fun res!693595 () Bool)

(assert (=> d!125935 (=> (not res!693595) (not e!588996))))

(assert (=> d!125935 (= res!693595 (and (bvsge (index!41312 lt!458502) #b00000000000000000000000000000000) (bvslt (index!41312 lt!458502) (size!32069 (_keys!11564 thiss!1427)))))))

(assert (=> d!125935 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11564 thiss!1427) (index!41312 lt!458502) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458548)))

(assert (= (and d!125935 res!693595) b!1040546))

(assert (= (and b!1040546 res!693597) b!1040547))

(assert (= (and b!1040547 res!693596) b!1040548))

(assert (= (and d!125935 res!693598) b!1040549))

(declare-fun m!960667 () Bool)

(assert (=> b!1040547 m!960667))

(assert (=> b!1040549 m!960573))

(declare-fun m!960669 () Bool)

(assert (=> b!1040549 m!960669))

(assert (=> b!1040549 m!960571))

(assert (=> b!1040546 m!960557))

(assert (=> b!1040546 m!960557))

(assert (=> b!1040546 m!960559))

(declare-fun m!960671 () Bool)

(assert (=> d!125935 m!960671))

(assert (=> b!1040438 d!125935))

(declare-fun b!1040560 () Bool)

(declare-fun e!589008 () Bool)

(declare-fun e!589006 () Bool)

(assert (=> b!1040560 (= e!589008 e!589006)))

(declare-fun res!693606 () Bool)

(assert (=> b!1040560 (=> (not res!693606) (not e!589006))))

(declare-fun e!589005 () Bool)

(assert (=> b!1040560 (= res!693606 (not e!589005))))

(declare-fun res!693607 () Bool)

(assert (=> b!1040560 (=> (not res!693607) (not e!589005))))

(assert (=> b!1040560 (= res!693607 (validKeyInArray!0 (select (arr!31537 lt!458500) #b00000000000000000000000000000000)))))

(declare-fun b!1040561 () Bool)

(declare-fun e!589007 () Bool)

(assert (=> b!1040561 (= e!589006 e!589007)))

(declare-fun c!105736 () Bool)

(assert (=> b!1040561 (= c!105736 (validKeyInArray!0 (select (arr!31537 lt!458500) #b00000000000000000000000000000000)))))

(declare-fun b!1040562 () Bool)

(declare-fun contains!6068 (List!21932 (_ BitVec 64)) Bool)

(assert (=> b!1040562 (= e!589005 (contains!6068 Nil!21929 (select (arr!31537 lt!458500) #b00000000000000000000000000000000)))))

(declare-fun b!1040563 () Bool)

(declare-fun call!44051 () Bool)

(assert (=> b!1040563 (= e!589007 call!44051)))

(declare-fun d!125937 () Bool)

(declare-fun res!693605 () Bool)

(assert (=> d!125937 (=> res!693605 e!589008)))

(assert (=> d!125937 (= res!693605 (bvsge #b00000000000000000000000000000000 (size!32069 lt!458500)))))

(assert (=> d!125937 (= (arrayNoDuplicates!0 lt!458500 #b00000000000000000000000000000000 Nil!21929) e!589008)))

(declare-fun bm!44048 () Bool)

(assert (=> bm!44048 (= call!44051 (arrayNoDuplicates!0 lt!458500 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105736 (Cons!21928 (select (arr!31537 lt!458500) #b00000000000000000000000000000000) Nil!21929) Nil!21929)))))

(declare-fun b!1040564 () Bool)

(assert (=> b!1040564 (= e!589007 call!44051)))

(assert (= (and d!125937 (not res!693605)) b!1040560))

(assert (= (and b!1040560 res!693607) b!1040562))

(assert (= (and b!1040560 res!693606) b!1040561))

(assert (= (and b!1040561 c!105736) b!1040564))

(assert (= (and b!1040561 (not c!105736)) b!1040563))

(assert (= (or b!1040564 b!1040563) bm!44048))

(declare-fun m!960673 () Bool)

(assert (=> b!1040560 m!960673))

(assert (=> b!1040560 m!960673))

(declare-fun m!960675 () Bool)

(assert (=> b!1040560 m!960675))

(assert (=> b!1040561 m!960673))

(assert (=> b!1040561 m!960673))

(assert (=> b!1040561 m!960675))

(assert (=> b!1040562 m!960673))

(assert (=> b!1040562 m!960673))

(declare-fun m!960677 () Bool)

(assert (=> b!1040562 m!960677))

(assert (=> bm!44048 m!960673))

(declare-fun m!960679 () Bool)

(assert (=> bm!44048 m!960679))

(assert (=> b!1040438 d!125937))

(declare-fun b!1040565 () Bool)

(declare-fun e!589010 () (_ BitVec 32))

(declare-fun call!44052 () (_ BitVec 32))

(assert (=> b!1040565 (= e!589010 call!44052)))

(declare-fun b!1040566 () Bool)

(declare-fun e!589009 () (_ BitVec 32))

(assert (=> b!1040566 (= e!589009 e!589010)))

(declare-fun c!105737 () Bool)

(assert (=> b!1040566 (= c!105737 (validKeyInArray!0 (select (arr!31537 lt!458500) #b00000000000000000000000000000000)))))

(declare-fun bm!44049 () Bool)

(assert (=> bm!44049 (= call!44052 (arrayCountValidKeys!0 lt!458500 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32069 (_keys!11564 thiss!1427))))))

(declare-fun b!1040567 () Bool)

(assert (=> b!1040567 (= e!589010 (bvadd #b00000000000000000000000000000001 call!44052))))

(declare-fun d!125939 () Bool)

(declare-fun lt!458549 () (_ BitVec 32))

(assert (=> d!125939 (and (bvsge lt!458549 #b00000000000000000000000000000000) (bvsle lt!458549 (bvsub (size!32069 lt!458500) #b00000000000000000000000000000000)))))

(assert (=> d!125939 (= lt!458549 e!589009)))

(declare-fun c!105738 () Bool)

(assert (=> d!125939 (= c!105738 (bvsge #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))))))

(assert (=> d!125939 (and (bvsle #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32069 (_keys!11564 thiss!1427)) (size!32069 lt!458500)))))

(assert (=> d!125939 (= (arrayCountValidKeys!0 lt!458500 #b00000000000000000000000000000000 (size!32069 (_keys!11564 thiss!1427))) lt!458549)))

(declare-fun b!1040568 () Bool)

(assert (=> b!1040568 (= e!589009 #b00000000000000000000000000000000)))

(assert (= (and d!125939 c!105738) b!1040568))

(assert (= (and d!125939 (not c!105738)) b!1040566))

(assert (= (and b!1040566 c!105737) b!1040567))

(assert (= (and b!1040566 (not c!105737)) b!1040565))

(assert (= (or b!1040567 b!1040565) bm!44049))

(assert (=> b!1040566 m!960673))

(assert (=> b!1040566 m!960673))

(assert (=> b!1040566 m!960675))

(declare-fun m!960681 () Bool)

(assert (=> bm!44049 m!960681))

(assert (=> b!1040438 d!125939))

(declare-fun mapNonEmpty!38593 () Bool)

(declare-fun mapRes!38593 () Bool)

(declare-fun tp!74084 () Bool)

(declare-fun e!589016 () Bool)

(assert (=> mapNonEmpty!38593 (= mapRes!38593 (and tp!74084 e!589016))))

(declare-fun mapRest!38593 () (Array (_ BitVec 32) ValueCell!11639))

(declare-fun mapValue!38593 () ValueCell!11639)

(declare-fun mapKey!38593 () (_ BitVec 32))

(assert (=> mapNonEmpty!38593 (= mapRest!38584 (store mapRest!38593 mapKey!38593 mapValue!38593))))

(declare-fun condMapEmpty!38593 () Bool)

(declare-fun mapDefault!38593 () ValueCell!11639)

(assert (=> mapNonEmpty!38584 (= condMapEmpty!38593 (= mapRest!38584 ((as const (Array (_ BitVec 32) ValueCell!11639)) mapDefault!38593)))))

(declare-fun e!589015 () Bool)

(assert (=> mapNonEmpty!38584 (= tp!74069 (and e!589015 mapRes!38593))))

(declare-fun b!1040575 () Bool)

(assert (=> b!1040575 (= e!589016 tp_is_empty!24685)))

(declare-fun b!1040576 () Bool)

(assert (=> b!1040576 (= e!589015 tp_is_empty!24685)))

(declare-fun mapIsEmpty!38593 () Bool)

(assert (=> mapIsEmpty!38593 mapRes!38593))

(assert (= (and mapNonEmpty!38584 condMapEmpty!38593) mapIsEmpty!38593))

(assert (= (and mapNonEmpty!38584 (not condMapEmpty!38593)) mapNonEmpty!38593))

(assert (= (and mapNonEmpty!38593 ((_ is ValueCellFull!11639) mapValue!38593)) b!1040575))

(assert (= (and mapNonEmpty!38584 ((_ is ValueCellFull!11639) mapDefault!38593)) b!1040576))

(declare-fun m!960683 () Bool)

(assert (=> mapNonEmpty!38593 m!960683))

(check-sat (not b!1040549) (not b!1040561) (not b!1040532) (not d!125927) (not d!125933) (not b!1040508) (not b!1040562) (not b!1040560) (not bm!44045) b_and!33507 (not bm!44049) (not b!1040522) (not b!1040537) (not b!1040547) (not b!1040566) (not b_next!20965) tp_is_empty!24685 (not b!1040520) (not mapNonEmpty!38593) (not b!1040546) (not d!125923) (not d!125935) (not b!1040521) (not bm!44048))
(check-sat b_and!33507 (not b_next!20965))
