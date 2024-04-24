; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90956 () Bool)

(assert start!90956)

(declare-fun b!1038693 () Bool)

(declare-fun b_free!20899 () Bool)

(declare-fun b_next!20899 () Bool)

(assert (=> b!1038693 (= b_free!20899 (not b_next!20899))))

(declare-fun tp!73843 () Bool)

(declare-fun b_and!33441 () Bool)

(assert (=> b!1038693 (= tp!73843 b_and!33441)))

(declare-fun b!1038690 () Bool)

(declare-fun res!692670 () Bool)

(declare-fun e!587651 () Bool)

(assert (=> b!1038690 (=> (not res!692670) (not e!587651))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1038690 (= res!692670 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1038691 () Bool)

(declare-fun e!587652 () Bool)

(assert (=> b!1038691 (= e!587651 e!587652)))

(declare-fun res!692668 () Bool)

(assert (=> b!1038691 (=> (not res!692668) (not e!587652))))

(declare-datatypes ((SeekEntryResult!9711 0))(
  ( (MissingZero!9711 (index!41215 (_ BitVec 32))) (Found!9711 (index!41216 (_ BitVec 32))) (Intermediate!9711 (undefined!10523 Bool) (index!41217 (_ BitVec 32)) (x!92524 (_ BitVec 32))) (Undefined!9711) (MissingVacant!9711 (index!41218 (_ BitVec 32))) )
))
(declare-fun lt!457990 () SeekEntryResult!9711)

(get-info :version)

(assert (=> b!1038691 (= res!692668 ((_ is Found!9711) lt!457990))))

(declare-datatypes ((V!37699 0))(
  ( (V!37700 (val!12360 Int)) )
))
(declare-datatypes ((ValueCell!11606 0))(
  ( (ValueCellFull!11606 (v!14939 V!37699)) (EmptyCell!11606) )
))
(declare-datatypes ((array!65391 0))(
  ( (array!65392 (arr!31471 (Array (_ BitVec 32) (_ BitVec 64))) (size!32002 (_ BitVec 32))) )
))
(declare-datatypes ((array!65393 0))(
  ( (array!65394 (arr!31472 (Array (_ BitVec 32) ValueCell!11606)) (size!32003 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5806 0))(
  ( (LongMapFixedSize!5807 (defaultEntry!6285 Int) (mask!30264 (_ BitVec 32)) (extraKeys!6013 (_ BitVec 32)) (zeroValue!6119 V!37699) (minValue!6119 V!37699) (_size!2958 (_ BitVec 32)) (_keys!11519 array!65391) (_values!6308 array!65393) (_vacant!2958 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5806)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65391 (_ BitVec 32)) SeekEntryResult!9711)

(assert (=> b!1038691 (= lt!457990 (seekEntry!0 key!909 (_keys!11519 thiss!1427) (mask!30264 thiss!1427)))))

(declare-fun b!1038692 () Bool)

(declare-fun e!587647 () Bool)

(declare-fun tp_is_empty!24619 () Bool)

(assert (=> b!1038692 (= e!587647 tp_is_empty!24619)))

(declare-fun res!692669 () Bool)

(assert (=> start!90956 (=> (not res!692669) (not e!587651))))

(declare-fun valid!2194 (LongMapFixedSize!5806) Bool)

(assert (=> start!90956 (= res!692669 (valid!2194 thiss!1427))))

(assert (=> start!90956 e!587651))

(declare-fun e!587653 () Bool)

(assert (=> start!90956 e!587653))

(assert (=> start!90956 true))

(declare-fun e!587648 () Bool)

(declare-fun array_inv!24347 (array!65391) Bool)

(declare-fun array_inv!24348 (array!65393) Bool)

(assert (=> b!1038693 (= e!587653 (and tp!73843 tp_is_empty!24619 (array_inv!24347 (_keys!11519 thiss!1427)) (array_inv!24348 (_values!6308 thiss!1427)) e!587648))))

(declare-fun mapIsEmpty!38457 () Bool)

(declare-fun mapRes!38457 () Bool)

(assert (=> mapIsEmpty!38457 mapRes!38457))

(declare-fun b!1038694 () Bool)

(declare-fun e!587649 () Bool)

(assert (=> b!1038694 (= e!587648 (and e!587649 mapRes!38457))))

(declare-fun condMapEmpty!38457 () Bool)

(declare-fun mapDefault!38457 () ValueCell!11606)

(assert (=> b!1038694 (= condMapEmpty!38457 (= (arr!31472 (_values!6308 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11606)) mapDefault!38457)))))

(declare-fun b!1038695 () Bool)

(assert (=> b!1038695 (= e!587649 tp_is_empty!24619)))

(declare-fun mapNonEmpty!38457 () Bool)

(declare-fun tp!73842 () Bool)

(assert (=> mapNonEmpty!38457 (= mapRes!38457 (and tp!73842 e!587647))))

(declare-fun mapValue!38457 () ValueCell!11606)

(declare-fun mapRest!38457 () (Array (_ BitVec 32) ValueCell!11606))

(declare-fun mapKey!38457 () (_ BitVec 32))

(assert (=> mapNonEmpty!38457 (= (arr!31472 (_values!6308 thiss!1427)) (store mapRest!38457 mapKey!38457 mapValue!38457))))

(declare-fun b!1038696 () Bool)

(assert (=> b!1038696 (= e!587652 (not (or (bvsge (size!32002 (_keys!11519 thiss!1427)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))))))))

(declare-fun arrayCountValidKeys!0 (array!65391 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038696 (= (arrayCountValidKeys!0 (array!65392 (store (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11519 thiss!1427))) #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33953 0))(
  ( (Unit!33954) )
))
(declare-fun lt!457989 () Unit!33953)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65391 (_ BitVec 32) (_ BitVec 64)) Unit!33953)

(assert (=> b!1038696 (= lt!457989 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11519 thiss!1427) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!90956 res!692669) b!1038690))

(assert (= (and b!1038690 res!692670) b!1038691))

(assert (= (and b!1038691 res!692668) b!1038696))

(assert (= (and b!1038694 condMapEmpty!38457) mapIsEmpty!38457))

(assert (= (and b!1038694 (not condMapEmpty!38457)) mapNonEmpty!38457))

(assert (= (and mapNonEmpty!38457 ((_ is ValueCellFull!11606) mapValue!38457)) b!1038692))

(assert (= (and b!1038694 ((_ is ValueCellFull!11606) mapDefault!38457)) b!1038695))

(assert (= b!1038693 b!1038694))

(assert (= start!90956 b!1038693))

(declare-fun m!959265 () Bool)

(assert (=> b!1038693 m!959265))

(declare-fun m!959267 () Bool)

(assert (=> b!1038693 m!959267))

(declare-fun m!959269 () Bool)

(assert (=> mapNonEmpty!38457 m!959269))

(declare-fun m!959271 () Bool)

(assert (=> b!1038696 m!959271))

(declare-fun m!959273 () Bool)

(assert (=> b!1038696 m!959273))

(declare-fun m!959275 () Bool)

(assert (=> b!1038696 m!959275))

(declare-fun m!959277 () Bool)

(assert (=> b!1038696 m!959277))

(declare-fun m!959279 () Bool)

(assert (=> start!90956 m!959279))

(declare-fun m!959281 () Bool)

(assert (=> b!1038691 m!959281))

(check-sat (not start!90956) (not mapNonEmpty!38457) tp_is_empty!24619 (not b!1038696) (not b!1038693) b_and!33441 (not b_next!20899) (not b!1038691))
(check-sat b_and!33441 (not b_next!20899))
(get-model)

(declare-fun b!1038751 () Bool)

(declare-fun e!587703 () SeekEntryResult!9711)

(declare-fun lt!458012 () SeekEntryResult!9711)

(assert (=> b!1038751 (= e!587703 (MissingZero!9711 (index!41217 lt!458012)))))

(declare-fun d!125687 () Bool)

(declare-fun lt!458013 () SeekEntryResult!9711)

(assert (=> d!125687 (and (or ((_ is MissingVacant!9711) lt!458013) (not ((_ is Found!9711) lt!458013)) (and (bvsge (index!41216 lt!458013) #b00000000000000000000000000000000) (bvslt (index!41216 lt!458013) (size!32002 (_keys!11519 thiss!1427))))) (not ((_ is MissingVacant!9711) lt!458013)) (or (not ((_ is Found!9711) lt!458013)) (= (select (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!458013)) key!909)))))

(declare-fun e!587702 () SeekEntryResult!9711)

(assert (=> d!125687 (= lt!458013 e!587702)))

(declare-fun c!105524 () Bool)

(assert (=> d!125687 (= c!105524 (and ((_ is Intermediate!9711) lt!458012) (undefined!10523 lt!458012)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65391 (_ BitVec 32)) SeekEntryResult!9711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125687 (= lt!458012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30264 thiss!1427)) key!909 (_keys!11519 thiss!1427) (mask!30264 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125687 (validMask!0 (mask!30264 thiss!1427))))

(assert (=> d!125687 (= (seekEntry!0 key!909 (_keys!11519 thiss!1427) (mask!30264 thiss!1427)) lt!458013)))

(declare-fun b!1038752 () Bool)

(declare-fun lt!458011 () SeekEntryResult!9711)

(assert (=> b!1038752 (= e!587703 (ite ((_ is MissingVacant!9711) lt!458011) (MissingZero!9711 (index!41218 lt!458011)) lt!458011))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65391 (_ BitVec 32)) SeekEntryResult!9711)

(assert (=> b!1038752 (= lt!458011 (seekKeyOrZeroReturnVacant!0 (x!92524 lt!458012) (index!41217 lt!458012) (index!41217 lt!458012) key!909 (_keys!11519 thiss!1427) (mask!30264 thiss!1427)))))

(declare-fun b!1038753 () Bool)

(declare-fun e!587704 () SeekEntryResult!9711)

(assert (=> b!1038753 (= e!587704 (Found!9711 (index!41217 lt!458012)))))

(declare-fun b!1038754 () Bool)

(assert (=> b!1038754 (= e!587702 e!587704)))

(declare-fun lt!458014 () (_ BitVec 64))

(assert (=> b!1038754 (= lt!458014 (select (arr!31471 (_keys!11519 thiss!1427)) (index!41217 lt!458012)))))

(declare-fun c!105526 () Bool)

(assert (=> b!1038754 (= c!105526 (= lt!458014 key!909))))

(declare-fun b!1038755 () Bool)

(assert (=> b!1038755 (= e!587702 Undefined!9711)))

(declare-fun b!1038756 () Bool)

(declare-fun c!105525 () Bool)

(assert (=> b!1038756 (= c!105525 (= lt!458014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1038756 (= e!587704 e!587703)))

(assert (= (and d!125687 c!105524) b!1038755))

(assert (= (and d!125687 (not c!105524)) b!1038754))

(assert (= (and b!1038754 c!105526) b!1038753))

(assert (= (and b!1038754 (not c!105526)) b!1038756))

(assert (= (and b!1038756 c!105525) b!1038751))

(assert (= (and b!1038756 (not c!105525)) b!1038752))

(declare-fun m!959319 () Bool)

(assert (=> d!125687 m!959319))

(declare-fun m!959321 () Bool)

(assert (=> d!125687 m!959321))

(assert (=> d!125687 m!959321))

(declare-fun m!959323 () Bool)

(assert (=> d!125687 m!959323))

(declare-fun m!959325 () Bool)

(assert (=> d!125687 m!959325))

(declare-fun m!959327 () Bool)

(assert (=> b!1038752 m!959327))

(declare-fun m!959329 () Bool)

(assert (=> b!1038754 m!959329))

(assert (=> b!1038691 d!125687))

(declare-fun b!1038765 () Bool)

(declare-fun e!587710 () (_ BitVec 32))

(declare-fun e!587709 () (_ BitVec 32))

(assert (=> b!1038765 (= e!587710 e!587709)))

(declare-fun c!105532 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1038765 (= c!105532 (validKeyInArray!0 (select (arr!31471 (array!65392 (store (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11519 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun b!1038766 () Bool)

(declare-fun call!43985 () (_ BitVec 32))

(assert (=> b!1038766 (= e!587709 (bvadd #b00000000000000000000000000000001 call!43985))))

(declare-fun b!1038767 () Bool)

(assert (=> b!1038767 (= e!587710 #b00000000000000000000000000000000)))

(declare-fun bm!43982 () Bool)

(assert (=> bm!43982 (= call!43985 (arrayCountValidKeys!0 (array!65392 (store (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11519 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11519 thiss!1427))))))

(declare-fun b!1038768 () Bool)

(assert (=> b!1038768 (= e!587709 call!43985)))

(declare-fun d!125689 () Bool)

(declare-fun lt!458017 () (_ BitVec 32))

(assert (=> d!125689 (and (bvsge lt!458017 #b00000000000000000000000000000000) (bvsle lt!458017 (bvsub (size!32002 (array!65392 (store (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11519 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (=> d!125689 (= lt!458017 e!587710)))

(declare-fun c!105531 () Bool)

(assert (=> d!125689 (= c!105531 (bvsge #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))))))

(assert (=> d!125689 (and (bvsle #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32002 (_keys!11519 thiss!1427)) (size!32002 (array!65392 (store (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11519 thiss!1427))))))))

(assert (=> d!125689 (= (arrayCountValidKeys!0 (array!65392 (store (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11519 thiss!1427))) #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) lt!458017)))

(assert (= (and d!125689 c!105531) b!1038767))

(assert (= (and d!125689 (not c!105531)) b!1038765))

(assert (= (and b!1038765 c!105532) b!1038766))

(assert (= (and b!1038765 (not c!105532)) b!1038768))

(assert (= (or b!1038766 b!1038768) bm!43982))

(declare-fun m!959331 () Bool)

(assert (=> b!1038765 m!959331))

(assert (=> b!1038765 m!959331))

(declare-fun m!959333 () Bool)

(assert (=> b!1038765 m!959333))

(declare-fun m!959335 () Bool)

(assert (=> bm!43982 m!959335))

(assert (=> b!1038696 d!125689))

(declare-fun b!1038769 () Bool)

(declare-fun e!587712 () (_ BitVec 32))

(declare-fun e!587711 () (_ BitVec 32))

(assert (=> b!1038769 (= e!587712 e!587711)))

(declare-fun c!105534 () Bool)

(assert (=> b!1038769 (= c!105534 (validKeyInArray!0 (select (arr!31471 (_keys!11519 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1038770 () Bool)

(declare-fun call!43986 () (_ BitVec 32))

(assert (=> b!1038770 (= e!587711 (bvadd #b00000000000000000000000000000001 call!43986))))

(declare-fun b!1038771 () Bool)

(assert (=> b!1038771 (= e!587712 #b00000000000000000000000000000000)))

(declare-fun bm!43983 () Bool)

(assert (=> bm!43983 (= call!43986 (arrayCountValidKeys!0 (_keys!11519 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32002 (_keys!11519 thiss!1427))))))

(declare-fun b!1038772 () Bool)

(assert (=> b!1038772 (= e!587711 call!43986)))

(declare-fun d!125691 () Bool)

(declare-fun lt!458018 () (_ BitVec 32))

(assert (=> d!125691 (and (bvsge lt!458018 #b00000000000000000000000000000000) (bvsle lt!458018 (bvsub (size!32002 (_keys!11519 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!125691 (= lt!458018 e!587712)))

(declare-fun c!105533 () Bool)

(assert (=> d!125691 (= c!105533 (bvsge #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))))))

(assert (=> d!125691 (and (bvsle #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32002 (_keys!11519 thiss!1427)) (size!32002 (_keys!11519 thiss!1427))))))

(assert (=> d!125691 (= (arrayCountValidKeys!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) lt!458018)))

(assert (= (and d!125691 c!105533) b!1038771))

(assert (= (and d!125691 (not c!105533)) b!1038769))

(assert (= (and b!1038769 c!105534) b!1038770))

(assert (= (and b!1038769 (not c!105534)) b!1038772))

(assert (= (or b!1038770 b!1038772) bm!43983))

(declare-fun m!959337 () Bool)

(assert (=> b!1038769 m!959337))

(assert (=> b!1038769 m!959337))

(declare-fun m!959339 () Bool)

(assert (=> b!1038769 m!959339))

(declare-fun m!959341 () Bool)

(assert (=> bm!43983 m!959341))

(assert (=> b!1038696 d!125691))

(declare-fun b!1038783 () Bool)

(declare-fun e!587717 () Bool)

(assert (=> b!1038783 (= e!587717 (bvslt (size!32002 (_keys!11519 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1038784 () Bool)

(declare-fun e!587718 () Bool)

(assert (=> b!1038784 (= e!587718 (= (arrayCountValidKeys!0 (array!65392 (store (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32002 (_keys!11519 thiss!1427))) #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1038781 () Bool)

(declare-fun res!692697 () Bool)

(assert (=> b!1038781 (=> (not res!692697) (not e!587717))))

(assert (=> b!1038781 (= res!692697 (validKeyInArray!0 (select (arr!31471 (_keys!11519 thiss!1427)) (index!41216 lt!457990))))))

(declare-fun d!125693 () Bool)

(assert (=> d!125693 e!587718))

(declare-fun res!692700 () Bool)

(assert (=> d!125693 (=> (not res!692700) (not e!587718))))

(assert (=> d!125693 (= res!692700 (and (bvsge (index!41216 lt!457990) #b00000000000000000000000000000000) (bvslt (index!41216 lt!457990) (size!32002 (_keys!11519 thiss!1427)))))))

(declare-fun lt!458021 () Unit!33953)

(declare-fun choose!82 (array!65391 (_ BitVec 32) (_ BitVec 64)) Unit!33953)

(assert (=> d!125693 (= lt!458021 (choose!82 (_keys!11519 thiss!1427) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125693 e!587717))

(declare-fun res!692698 () Bool)

(assert (=> d!125693 (=> (not res!692698) (not e!587717))))

(assert (=> d!125693 (= res!692698 (and (bvsge (index!41216 lt!457990) #b00000000000000000000000000000000) (bvslt (index!41216 lt!457990) (size!32002 (_keys!11519 thiss!1427)))))))

(assert (=> d!125693 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11519 thiss!1427) (index!41216 lt!457990) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458021)))

(declare-fun b!1038782 () Bool)

(declare-fun res!692699 () Bool)

(assert (=> b!1038782 (=> (not res!692699) (not e!587717))))

(assert (=> b!1038782 (= res!692699 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!125693 res!692698) b!1038781))

(assert (= (and b!1038781 res!692697) b!1038782))

(assert (= (and b!1038782 res!692699) b!1038783))

(assert (= (and d!125693 res!692700) b!1038784))

(assert (=> b!1038784 m!959271))

(assert (=> b!1038784 m!959273))

(assert (=> b!1038784 m!959275))

(declare-fun m!959343 () Bool)

(assert (=> b!1038781 m!959343))

(assert (=> b!1038781 m!959343))

(declare-fun m!959345 () Bool)

(assert (=> b!1038781 m!959345))

(declare-fun m!959347 () Bool)

(assert (=> d!125693 m!959347))

(declare-fun m!959349 () Bool)

(assert (=> b!1038782 m!959349))

(assert (=> b!1038696 d!125693))

(declare-fun d!125695 () Bool)

(assert (=> d!125695 (= (array_inv!24347 (_keys!11519 thiss!1427)) (bvsge (size!32002 (_keys!11519 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038693 d!125695))

(declare-fun d!125697 () Bool)

(assert (=> d!125697 (= (array_inv!24348 (_values!6308 thiss!1427)) (bvsge (size!32003 (_values!6308 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1038693 d!125697))

(declare-fun d!125699 () Bool)

(declare-fun res!692707 () Bool)

(declare-fun e!587721 () Bool)

(assert (=> d!125699 (=> (not res!692707) (not e!587721))))

(declare-fun simpleValid!417 (LongMapFixedSize!5806) Bool)

(assert (=> d!125699 (= res!692707 (simpleValid!417 thiss!1427))))

(assert (=> d!125699 (= (valid!2194 thiss!1427) e!587721)))

(declare-fun b!1038791 () Bool)

(declare-fun res!692708 () Bool)

(assert (=> b!1038791 (=> (not res!692708) (not e!587721))))

(assert (=> b!1038791 (= res!692708 (= (arrayCountValidKeys!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 (size!32002 (_keys!11519 thiss!1427))) (_size!2958 thiss!1427)))))

(declare-fun b!1038792 () Bool)

(declare-fun res!692709 () Bool)

(assert (=> b!1038792 (=> (not res!692709) (not e!587721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65391 (_ BitVec 32)) Bool)

(assert (=> b!1038792 (= res!692709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11519 thiss!1427) (mask!30264 thiss!1427)))))

(declare-fun b!1038793 () Bool)

(declare-datatypes ((List!21908 0))(
  ( (Nil!21905) (Cons!21904 (h!23116 (_ BitVec 64)) (t!31114 List!21908)) )
))
(declare-fun arrayNoDuplicates!0 (array!65391 (_ BitVec 32) List!21908) Bool)

(assert (=> b!1038793 (= e!587721 (arrayNoDuplicates!0 (_keys!11519 thiss!1427) #b00000000000000000000000000000000 Nil!21905))))

(assert (= (and d!125699 res!692707) b!1038791))

(assert (= (and b!1038791 res!692708) b!1038792))

(assert (= (and b!1038792 res!692709) b!1038793))

(declare-fun m!959351 () Bool)

(assert (=> d!125699 m!959351))

(assert (=> b!1038791 m!959275))

(declare-fun m!959353 () Bool)

(assert (=> b!1038792 m!959353))

(declare-fun m!959355 () Bool)

(assert (=> b!1038793 m!959355))

(assert (=> start!90956 d!125699))

(declare-fun mapNonEmpty!38466 () Bool)

(declare-fun mapRes!38466 () Bool)

(declare-fun tp!73858 () Bool)

(declare-fun e!587726 () Bool)

(assert (=> mapNonEmpty!38466 (= mapRes!38466 (and tp!73858 e!587726))))

(declare-fun mapValue!38466 () ValueCell!11606)

(declare-fun mapKey!38466 () (_ BitVec 32))

(declare-fun mapRest!38466 () (Array (_ BitVec 32) ValueCell!11606))

(assert (=> mapNonEmpty!38466 (= mapRest!38457 (store mapRest!38466 mapKey!38466 mapValue!38466))))

(declare-fun mapIsEmpty!38466 () Bool)

(assert (=> mapIsEmpty!38466 mapRes!38466))

(declare-fun condMapEmpty!38466 () Bool)

(declare-fun mapDefault!38466 () ValueCell!11606)

(assert (=> mapNonEmpty!38457 (= condMapEmpty!38466 (= mapRest!38457 ((as const (Array (_ BitVec 32) ValueCell!11606)) mapDefault!38466)))))

(declare-fun e!587727 () Bool)

(assert (=> mapNonEmpty!38457 (= tp!73842 (and e!587727 mapRes!38466))))

(declare-fun b!1038800 () Bool)

(assert (=> b!1038800 (= e!587726 tp_is_empty!24619)))

(declare-fun b!1038801 () Bool)

(assert (=> b!1038801 (= e!587727 tp_is_empty!24619)))

(assert (= (and mapNonEmpty!38457 condMapEmpty!38466) mapIsEmpty!38466))

(assert (= (and mapNonEmpty!38457 (not condMapEmpty!38466)) mapNonEmpty!38466))

(assert (= (and mapNonEmpty!38466 ((_ is ValueCellFull!11606) mapValue!38466)) b!1038800))

(assert (= (and mapNonEmpty!38457 ((_ is ValueCellFull!11606) mapDefault!38466)) b!1038801))

(declare-fun m!959357 () Bool)

(assert (=> mapNonEmpty!38466 m!959357))

(check-sat (not d!125687) (not b_next!20899) (not d!125699) (not b!1038781) (not mapNonEmpty!38466) (not bm!43982) (not b!1038784) tp_is_empty!24619 (not b!1038792) (not b!1038793) b_and!33441 (not b!1038782) (not d!125693) (not b!1038791) (not b!1038752) (not b!1038765) (not bm!43983) (not b!1038769))
(check-sat b_and!33441 (not b_next!20899))
