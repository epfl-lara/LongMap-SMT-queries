; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91046 () Bool)

(assert start!91046)

(declare-fun b!1039431 () Bool)

(declare-fun b_free!20929 () Bool)

(declare-fun b_next!20929 () Bool)

(assert (=> b!1039431 (= b_free!20929 (not b_next!20929))))

(declare-fun tp!73944 () Bool)

(declare-fun b_and!33471 () Bool)

(assert (=> b!1039431 (= tp!73944 b_and!33471)))

(declare-fun b!1039424 () Bool)

(declare-fun e!588185 () Bool)

(declare-fun tp_is_empty!24649 () Bool)

(assert (=> b!1039424 (= e!588185 tp_is_empty!24649)))

(declare-fun mapIsEmpty!38514 () Bool)

(declare-fun mapRes!38514 () Bool)

(assert (=> mapIsEmpty!38514 mapRes!38514))

(declare-fun b!1039425 () Bool)

(declare-fun res!693052 () Bool)

(declare-fun e!588184 () Bool)

(assert (=> b!1039425 (=> res!693052 e!588184)))

(declare-datatypes ((V!37739 0))(
  ( (V!37740 (val!12375 Int)) )
))
(declare-datatypes ((ValueCell!11621 0))(
  ( (ValueCellFull!11621 (v!14956 V!37739)) (EmptyCell!11621) )
))
(declare-datatypes ((array!65459 0))(
  ( (array!65460 (arr!31501 (Array (_ BitVec 32) (_ BitVec 64))) (size!32032 (_ BitVec 32))) )
))
(declare-datatypes ((array!65461 0))(
  ( (array!65462 (arr!31502 (Array (_ BitVec 32) ValueCell!11621)) (size!32033 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5836 0))(
  ( (LongMapFixedSize!5837 (defaultEntry!6300 Int) (mask!30293 (_ BitVec 32)) (extraKeys!6028 (_ BitVec 32)) (zeroValue!6134 V!37739) (minValue!6134 V!37739) (_size!2973 (_ BitVec 32)) (_keys!11538 array!65459) (_values!6323 array!65461) (_vacant!2973 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5836)

(declare-datatypes ((List!21919 0))(
  ( (Nil!21916) (Cons!21915 (h!23127 (_ BitVec 64)) (t!31125 List!21919)) )
))
(declare-fun arrayNoDuplicates!0 (array!65459 (_ BitVec 32) List!21919) Bool)

(assert (=> b!1039425 (= res!693052 (not (arrayNoDuplicates!0 (_keys!11538 thiss!1427) #b00000000000000000000000000000000 Nil!21916)))))

(declare-fun b!1039426 () Bool)

(declare-fun e!588183 () Bool)

(assert (=> b!1039426 (= e!588183 tp_is_empty!24649)))

(declare-fun b!1039427 () Bool)

(declare-fun res!693050 () Bool)

(assert (=> b!1039427 (=> res!693050 e!588184)))

(declare-fun contains!6059 (List!21919 (_ BitVec 64)) Bool)

(assert (=> b!1039427 (= res!693050 (contains!6059 Nil!21916 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039428 () Bool)

(declare-datatypes ((SeekEntryResult!9720 0))(
  ( (MissingZero!9720 (index!41251 (_ BitVec 32))) (Found!9720 (index!41252 (_ BitVec 32))) (Intermediate!9720 (undefined!10532 Bool) (index!41253 (_ BitVec 32)) (x!92605 (_ BitVec 32))) (Undefined!9720) (MissingVacant!9720 (index!41254 (_ BitVec 32))) )
))
(declare-fun lt!458173 () SeekEntryResult!9720)

(assert (=> b!1039428 (= e!588184 (and (bvsge (index!41252 lt!458173) #b00000000000000000000000000000000) (bvslt (index!41252 lt!458173) (size!32032 (_keys!11538 thiss!1427)))))))

(declare-fun b!1039429 () Bool)

(declare-fun e!588188 () Bool)

(declare-fun e!588190 () Bool)

(assert (=> b!1039429 (= e!588188 e!588190)))

(declare-fun res!693054 () Bool)

(assert (=> b!1039429 (=> (not res!693054) (not e!588190))))

(get-info :version)

(assert (=> b!1039429 (= res!693054 ((_ is Found!9720) lt!458173))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65459 (_ BitVec 32)) SeekEntryResult!9720)

(assert (=> b!1039429 (= lt!458173 (seekEntry!0 key!909 (_keys!11538 thiss!1427) (mask!30293 thiss!1427)))))

(declare-fun b!1039430 () Bool)

(declare-fun e!588186 () Bool)

(assert (=> b!1039430 (= e!588186 (and e!588183 mapRes!38514))))

(declare-fun condMapEmpty!38514 () Bool)

(declare-fun mapDefault!38514 () ValueCell!11621)

(assert (=> b!1039430 (= condMapEmpty!38514 (= (arr!31502 (_values!6323 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11621)) mapDefault!38514)))))

(declare-fun b!1039432 () Bool)

(declare-fun res!693048 () Bool)

(assert (=> b!1039432 (=> res!693048 e!588184)))

(assert (=> b!1039432 (= res!693048 (contains!6059 Nil!21916 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039433 () Bool)

(declare-fun res!693055 () Bool)

(assert (=> b!1039433 (=> (not res!693055) (not e!588188))))

(assert (=> b!1039433 (= res!693055 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039434 () Bool)

(declare-fun res!693049 () Bool)

(assert (=> b!1039434 (=> res!693049 e!588184)))

(declare-fun noDuplicate!1496 (List!21919) Bool)

(assert (=> b!1039434 (= res!693049 (not (noDuplicate!1496 Nil!21916)))))

(declare-fun mapNonEmpty!38514 () Bool)

(declare-fun tp!73945 () Bool)

(assert (=> mapNonEmpty!38514 (= mapRes!38514 (and tp!73945 e!588185))))

(declare-fun mapKey!38514 () (_ BitVec 32))

(declare-fun mapValue!38514 () ValueCell!11621)

(declare-fun mapRest!38514 () (Array (_ BitVec 32) ValueCell!11621))

(assert (=> mapNonEmpty!38514 (= (arr!31502 (_values!6323 thiss!1427)) (store mapRest!38514 mapKey!38514 mapValue!38514))))

(declare-fun b!1039435 () Bool)

(assert (=> b!1039435 (= e!588190 (not e!588184))))

(declare-fun res!693053 () Bool)

(assert (=> b!1039435 (=> res!693053 e!588184)))

(assert (=> b!1039435 (= res!693053 (or (bvsge (size!32032 (_keys!11538 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!65459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039435 (= (arrayCountValidKeys!0 (array!65460 (store (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32032 (_keys!11538 thiss!1427))) #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11538 thiss!1427) #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33969 0))(
  ( (Unit!33970) )
))
(declare-fun lt!458172 () Unit!33969)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65459 (_ BitVec 32) (_ BitVec 64)) Unit!33969)

(assert (=> b!1039435 (= lt!458172 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11538 thiss!1427) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!693051 () Bool)

(assert (=> start!91046 (=> (not res!693051) (not e!588188))))

(declare-fun valid!2204 (LongMapFixedSize!5836) Bool)

(assert (=> start!91046 (= res!693051 (valid!2204 thiss!1427))))

(assert (=> start!91046 e!588188))

(declare-fun e!588187 () Bool)

(assert (=> start!91046 e!588187))

(assert (=> start!91046 true))

(declare-fun array_inv!24369 (array!65459) Bool)

(declare-fun array_inv!24370 (array!65461) Bool)

(assert (=> b!1039431 (= e!588187 (and tp!73944 tp_is_empty!24649 (array_inv!24369 (_keys!11538 thiss!1427)) (array_inv!24370 (_values!6323 thiss!1427)) e!588186))))

(assert (= (and start!91046 res!693051) b!1039433))

(assert (= (and b!1039433 res!693055) b!1039429))

(assert (= (and b!1039429 res!693054) b!1039435))

(assert (= (and b!1039435 (not res!693053)) b!1039434))

(assert (= (and b!1039434 (not res!693049)) b!1039432))

(assert (= (and b!1039432 (not res!693048)) b!1039427))

(assert (= (and b!1039427 (not res!693050)) b!1039425))

(assert (= (and b!1039425 (not res!693052)) b!1039428))

(assert (= (and b!1039430 condMapEmpty!38514) mapIsEmpty!38514))

(assert (= (and b!1039430 (not condMapEmpty!38514)) mapNonEmpty!38514))

(assert (= (and mapNonEmpty!38514 ((_ is ValueCellFull!11621) mapValue!38514)) b!1039424))

(assert (= (and b!1039430 ((_ is ValueCellFull!11621) mapDefault!38514)) b!1039426))

(assert (= b!1039431 b!1039430))

(assert (= start!91046 b!1039431))

(declare-fun m!959801 () Bool)

(assert (=> b!1039425 m!959801))

(declare-fun m!959803 () Bool)

(assert (=> b!1039431 m!959803))

(declare-fun m!959805 () Bool)

(assert (=> b!1039431 m!959805))

(declare-fun m!959807 () Bool)

(assert (=> b!1039432 m!959807))

(declare-fun m!959809 () Bool)

(assert (=> b!1039435 m!959809))

(declare-fun m!959811 () Bool)

(assert (=> b!1039435 m!959811))

(declare-fun m!959813 () Bool)

(assert (=> b!1039435 m!959813))

(declare-fun m!959815 () Bool)

(assert (=> b!1039435 m!959815))

(declare-fun m!959817 () Bool)

(assert (=> b!1039429 m!959817))

(declare-fun m!959819 () Bool)

(assert (=> b!1039427 m!959819))

(declare-fun m!959821 () Bool)

(assert (=> b!1039434 m!959821))

(declare-fun m!959823 () Bool)

(assert (=> start!91046 m!959823))

(declare-fun m!959825 () Bool)

(assert (=> mapNonEmpty!38514 m!959825))

(check-sat (not b!1039434) (not b!1039435) (not start!91046) (not b!1039431) (not b!1039427) b_and!33471 (not b!1039432) (not mapNonEmpty!38514) (not b_next!20929) (not b!1039425) tp_is_empty!24649 (not b!1039429))
(check-sat b_and!33471 (not b_next!20929))
(get-model)

(declare-fun d!125769 () Bool)

(declare-fun res!693108 () Bool)

(declare-fun e!588243 () Bool)

(assert (=> d!125769 (=> res!693108 e!588243)))

(assert (=> d!125769 (= res!693108 ((_ is Nil!21916) Nil!21916))))

(assert (=> d!125769 (= (noDuplicate!1496 Nil!21916) e!588243)))

(declare-fun b!1039512 () Bool)

(declare-fun e!588244 () Bool)

(assert (=> b!1039512 (= e!588243 e!588244)))

(declare-fun res!693109 () Bool)

(assert (=> b!1039512 (=> (not res!693109) (not e!588244))))

(assert (=> b!1039512 (= res!693109 (not (contains!6059 (t!31125 Nil!21916) (h!23127 Nil!21916))))))

(declare-fun b!1039513 () Bool)

(assert (=> b!1039513 (= e!588244 (noDuplicate!1496 (t!31125 Nil!21916)))))

(assert (= (and d!125769 (not res!693108)) b!1039512))

(assert (= (and b!1039512 res!693109) b!1039513))

(declare-fun m!959879 () Bool)

(assert (=> b!1039512 m!959879))

(declare-fun m!959881 () Bool)

(assert (=> b!1039513 m!959881))

(assert (=> b!1039434 d!125769))

(declare-fun b!1039527 () Bool)

(declare-fun e!588251 () SeekEntryResult!9720)

(assert (=> b!1039527 (= e!588251 Undefined!9720)))

(declare-fun b!1039528 () Bool)

(declare-fun e!588252 () SeekEntryResult!9720)

(assert (=> b!1039528 (= e!588251 e!588252)))

(declare-fun lt!458197 () (_ BitVec 64))

(declare-fun lt!458194 () SeekEntryResult!9720)

(assert (=> b!1039528 (= lt!458197 (select (arr!31501 (_keys!11538 thiss!1427)) (index!41253 lt!458194)))))

(declare-fun c!105596 () Bool)

(assert (=> b!1039528 (= c!105596 (= lt!458197 key!909))))

(declare-fun b!1039529 () Bool)

(assert (=> b!1039529 (= e!588252 (Found!9720 (index!41253 lt!458194)))))

(declare-fun b!1039530 () Bool)

(declare-fun e!588253 () SeekEntryResult!9720)

(declare-fun lt!458195 () SeekEntryResult!9720)

(assert (=> b!1039530 (= e!588253 (ite ((_ is MissingVacant!9720) lt!458195) (MissingZero!9720 (index!41254 lt!458195)) lt!458195))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65459 (_ BitVec 32)) SeekEntryResult!9720)

(assert (=> b!1039530 (= lt!458195 (seekKeyOrZeroReturnVacant!0 (x!92605 lt!458194) (index!41253 lt!458194) (index!41253 lt!458194) key!909 (_keys!11538 thiss!1427) (mask!30293 thiss!1427)))))

(declare-fun b!1039531 () Bool)

(assert (=> b!1039531 (= e!588253 (MissingZero!9720 (index!41253 lt!458194)))))

(declare-fun b!1039526 () Bool)

(declare-fun c!105595 () Bool)

(assert (=> b!1039526 (= c!105595 (= lt!458197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1039526 (= e!588252 e!588253)))

(declare-fun d!125771 () Bool)

(declare-fun lt!458196 () SeekEntryResult!9720)

(assert (=> d!125771 (and (or ((_ is MissingVacant!9720) lt!458196) (not ((_ is Found!9720) lt!458196)) (and (bvsge (index!41252 lt!458196) #b00000000000000000000000000000000) (bvslt (index!41252 lt!458196) (size!32032 (_keys!11538 thiss!1427))))) (not ((_ is MissingVacant!9720) lt!458196)) (or (not ((_ is Found!9720) lt!458196)) (= (select (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458196)) key!909)))))

(assert (=> d!125771 (= lt!458196 e!588251)))

(declare-fun c!105597 () Bool)

(assert (=> d!125771 (= c!105597 (and ((_ is Intermediate!9720) lt!458194) (undefined!10532 lt!458194)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65459 (_ BitVec 32)) SeekEntryResult!9720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!125771 (= lt!458194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30293 thiss!1427)) key!909 (_keys!11538 thiss!1427) (mask!30293 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!125771 (validMask!0 (mask!30293 thiss!1427))))

(assert (=> d!125771 (= (seekEntry!0 key!909 (_keys!11538 thiss!1427) (mask!30293 thiss!1427)) lt!458196)))

(assert (= (and d!125771 c!105597) b!1039527))

(assert (= (and d!125771 (not c!105597)) b!1039528))

(assert (= (and b!1039528 c!105596) b!1039529))

(assert (= (and b!1039528 (not c!105596)) b!1039526))

(assert (= (and b!1039526 c!105595) b!1039531))

(assert (= (and b!1039526 (not c!105595)) b!1039530))

(declare-fun m!959883 () Bool)

(assert (=> b!1039528 m!959883))

(declare-fun m!959885 () Bool)

(assert (=> b!1039530 m!959885))

(declare-fun m!959887 () Bool)

(assert (=> d!125771 m!959887))

(declare-fun m!959889 () Bool)

(assert (=> d!125771 m!959889))

(assert (=> d!125771 m!959889))

(declare-fun m!959891 () Bool)

(assert (=> d!125771 m!959891))

(declare-fun m!959893 () Bool)

(assert (=> d!125771 m!959893))

(assert (=> b!1039429 d!125771))

(declare-fun d!125773 () Bool)

(declare-fun lt!458200 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!521 (List!21919) (InoxSet (_ BitVec 64)))

(assert (=> d!125773 (= lt!458200 (select (content!521 Nil!21916) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588258 () Bool)

(assert (=> d!125773 (= lt!458200 e!588258)))

(declare-fun res!693114 () Bool)

(assert (=> d!125773 (=> (not res!693114) (not e!588258))))

(assert (=> d!125773 (= res!693114 ((_ is Cons!21915) Nil!21916))))

(assert (=> d!125773 (= (contains!6059 Nil!21916 #b0000000000000000000000000000000000000000000000000000000000000000) lt!458200)))

(declare-fun b!1039536 () Bool)

(declare-fun e!588259 () Bool)

(assert (=> b!1039536 (= e!588258 e!588259)))

(declare-fun res!693115 () Bool)

(assert (=> b!1039536 (=> res!693115 e!588259)))

(assert (=> b!1039536 (= res!693115 (= (h!23127 Nil!21916) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039537 () Bool)

(assert (=> b!1039537 (= e!588259 (contains!6059 (t!31125 Nil!21916) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125773 res!693114) b!1039536))

(assert (= (and b!1039536 (not res!693115)) b!1039537))

(declare-fun m!959895 () Bool)

(assert (=> d!125773 m!959895))

(declare-fun m!959897 () Bool)

(assert (=> d!125773 m!959897))

(declare-fun m!959899 () Bool)

(assert (=> b!1039537 m!959899))

(assert (=> b!1039432 d!125773))

(declare-fun d!125775 () Bool)

(declare-fun lt!458201 () Bool)

(assert (=> d!125775 (= lt!458201 (select (content!521 Nil!21916) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!588260 () Bool)

(assert (=> d!125775 (= lt!458201 e!588260)))

(declare-fun res!693116 () Bool)

(assert (=> d!125775 (=> (not res!693116) (not e!588260))))

(assert (=> d!125775 (= res!693116 ((_ is Cons!21915) Nil!21916))))

(assert (=> d!125775 (= (contains!6059 Nil!21916 #b1000000000000000000000000000000000000000000000000000000000000000) lt!458201)))

(declare-fun b!1039538 () Bool)

(declare-fun e!588261 () Bool)

(assert (=> b!1039538 (= e!588260 e!588261)))

(declare-fun res!693117 () Bool)

(assert (=> b!1039538 (=> res!693117 e!588261)))

(assert (=> b!1039538 (= res!693117 (= (h!23127 Nil!21916) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039539 () Bool)

(assert (=> b!1039539 (= e!588261 (contains!6059 (t!31125 Nil!21916) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!125775 res!693116) b!1039538))

(assert (= (and b!1039538 (not res!693117)) b!1039539))

(assert (=> d!125775 m!959895))

(declare-fun m!959901 () Bool)

(assert (=> d!125775 m!959901))

(declare-fun m!959903 () Bool)

(assert (=> b!1039539 m!959903))

(assert (=> b!1039427 d!125775))

(declare-fun d!125777 () Bool)

(declare-fun lt!458204 () (_ BitVec 32))

(assert (=> d!125777 (and (bvsge lt!458204 #b00000000000000000000000000000000) (bvsle lt!458204 (bvsub (size!32032 (array!65460 (store (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32032 (_keys!11538 thiss!1427)))) #b00000000000000000000000000000000)))))

(declare-fun e!588266 () (_ BitVec 32))

(assert (=> d!125777 (= lt!458204 e!588266)))

(declare-fun c!105603 () Bool)

(assert (=> d!125777 (= c!105603 (bvsge #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))))))

(assert (=> d!125777 (and (bvsle #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32032 (_keys!11538 thiss!1427)) (size!32032 (array!65460 (store (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32032 (_keys!11538 thiss!1427))))))))

(assert (=> d!125777 (= (arrayCountValidKeys!0 (array!65460 (store (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32032 (_keys!11538 thiss!1427))) #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) lt!458204)))

(declare-fun b!1039548 () Bool)

(declare-fun e!588267 () (_ BitVec 32))

(declare-fun call!44004 () (_ BitVec 32))

(assert (=> b!1039548 (= e!588267 call!44004)))

(declare-fun bm!44001 () Bool)

(assert (=> bm!44001 (= call!44004 (arrayCountValidKeys!0 (array!65460 (store (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32032 (_keys!11538 thiss!1427))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32032 (_keys!11538 thiss!1427))))))

(declare-fun b!1039549 () Bool)

(assert (=> b!1039549 (= e!588267 (bvadd #b00000000000000000000000000000001 call!44004))))

(declare-fun b!1039550 () Bool)

(assert (=> b!1039550 (= e!588266 #b00000000000000000000000000000000)))

(declare-fun b!1039551 () Bool)

(assert (=> b!1039551 (= e!588266 e!588267)))

(declare-fun c!105602 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039551 (= c!105602 (validKeyInArray!0 (select (arr!31501 (array!65460 (store (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32032 (_keys!11538 thiss!1427)))) #b00000000000000000000000000000000)))))

(assert (= (and d!125777 c!105603) b!1039550))

(assert (= (and d!125777 (not c!105603)) b!1039551))

(assert (= (and b!1039551 c!105602) b!1039549))

(assert (= (and b!1039551 (not c!105602)) b!1039548))

(assert (= (or b!1039549 b!1039548) bm!44001))

(declare-fun m!959905 () Bool)

(assert (=> bm!44001 m!959905))

(declare-fun m!959907 () Bool)

(assert (=> b!1039551 m!959907))

(assert (=> b!1039551 m!959907))

(declare-fun m!959909 () Bool)

(assert (=> b!1039551 m!959909))

(assert (=> b!1039435 d!125777))

(declare-fun d!125779 () Bool)

(declare-fun lt!458205 () (_ BitVec 32))

(assert (=> d!125779 (and (bvsge lt!458205 #b00000000000000000000000000000000) (bvsle lt!458205 (bvsub (size!32032 (_keys!11538 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!588268 () (_ BitVec 32))

(assert (=> d!125779 (= lt!458205 e!588268)))

(declare-fun c!105605 () Bool)

(assert (=> d!125779 (= c!105605 (bvsge #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))))))

(assert (=> d!125779 (and (bvsle #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32032 (_keys!11538 thiss!1427)) (size!32032 (_keys!11538 thiss!1427))))))

(assert (=> d!125779 (= (arrayCountValidKeys!0 (_keys!11538 thiss!1427) #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) lt!458205)))

(declare-fun b!1039552 () Bool)

(declare-fun e!588269 () (_ BitVec 32))

(declare-fun call!44005 () (_ BitVec 32))

(assert (=> b!1039552 (= e!588269 call!44005)))

(declare-fun bm!44002 () Bool)

(assert (=> bm!44002 (= call!44005 (arrayCountValidKeys!0 (_keys!11538 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32032 (_keys!11538 thiss!1427))))))

(declare-fun b!1039553 () Bool)

(assert (=> b!1039553 (= e!588269 (bvadd #b00000000000000000000000000000001 call!44005))))

(declare-fun b!1039554 () Bool)

(assert (=> b!1039554 (= e!588268 #b00000000000000000000000000000000)))

(declare-fun b!1039555 () Bool)

(assert (=> b!1039555 (= e!588268 e!588269)))

(declare-fun c!105604 () Bool)

(assert (=> b!1039555 (= c!105604 (validKeyInArray!0 (select (arr!31501 (_keys!11538 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!125779 c!105605) b!1039554))

(assert (= (and d!125779 (not c!105605)) b!1039555))

(assert (= (and b!1039555 c!105604) b!1039553))

(assert (= (and b!1039555 (not c!105604)) b!1039552))

(assert (= (or b!1039553 b!1039552) bm!44002))

(declare-fun m!959911 () Bool)

(assert (=> bm!44002 m!959911))

(declare-fun m!959913 () Bool)

(assert (=> b!1039555 m!959913))

(assert (=> b!1039555 m!959913))

(declare-fun m!959915 () Bool)

(assert (=> b!1039555 m!959915))

(assert (=> b!1039435 d!125779))

(declare-fun b!1039565 () Bool)

(declare-fun res!693128 () Bool)

(declare-fun e!588274 () Bool)

(assert (=> b!1039565 (=> (not res!693128) (not e!588274))))

(assert (=> b!1039565 (= res!693128 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1039566 () Bool)

(assert (=> b!1039566 (= e!588274 (bvslt (size!32032 (_keys!11538 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1039567 () Bool)

(declare-fun e!588275 () Bool)

(assert (=> b!1039567 (= e!588275 (= (arrayCountValidKeys!0 (array!65460 (store (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32032 (_keys!11538 thiss!1427))) #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11538 thiss!1427) #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun d!125781 () Bool)

(assert (=> d!125781 e!588275))

(declare-fun res!693126 () Bool)

(assert (=> d!125781 (=> (not res!693126) (not e!588275))))

(assert (=> d!125781 (= res!693126 (and (bvsge (index!41252 lt!458173) #b00000000000000000000000000000000) (bvslt (index!41252 lt!458173) (size!32032 (_keys!11538 thiss!1427)))))))

(declare-fun lt!458208 () Unit!33969)

(declare-fun choose!82 (array!65459 (_ BitVec 32) (_ BitVec 64)) Unit!33969)

(assert (=> d!125781 (= lt!458208 (choose!82 (_keys!11538 thiss!1427) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!125781 e!588274))

(declare-fun res!693129 () Bool)

(assert (=> d!125781 (=> (not res!693129) (not e!588274))))

(assert (=> d!125781 (= res!693129 (and (bvsge (index!41252 lt!458173) #b00000000000000000000000000000000) (bvslt (index!41252 lt!458173) (size!32032 (_keys!11538 thiss!1427)))))))

(assert (=> d!125781 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11538 thiss!1427) (index!41252 lt!458173) #b1000000000000000000000000000000000000000000000000000000000000000) lt!458208)))

(declare-fun b!1039564 () Bool)

(declare-fun res!693127 () Bool)

(assert (=> b!1039564 (=> (not res!693127) (not e!588274))))

(assert (=> b!1039564 (= res!693127 (validKeyInArray!0 (select (arr!31501 (_keys!11538 thiss!1427)) (index!41252 lt!458173))))))

(assert (= (and d!125781 res!693129) b!1039564))

(assert (= (and b!1039564 res!693127) b!1039565))

(assert (= (and b!1039565 res!693128) b!1039566))

(assert (= (and d!125781 res!693126) b!1039567))

(declare-fun m!959917 () Bool)

(assert (=> b!1039565 m!959917))

(assert (=> b!1039567 m!959809))

(assert (=> b!1039567 m!959811))

(assert (=> b!1039567 m!959813))

(declare-fun m!959919 () Bool)

(assert (=> d!125781 m!959919))

(declare-fun m!959921 () Bool)

(assert (=> b!1039564 m!959921))

(assert (=> b!1039564 m!959921))

(declare-fun m!959923 () Bool)

(assert (=> b!1039564 m!959923))

(assert (=> b!1039435 d!125781))

(declare-fun d!125783 () Bool)

(assert (=> d!125783 (= (array_inv!24369 (_keys!11538 thiss!1427)) (bvsge (size!32032 (_keys!11538 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039431 d!125783))

(declare-fun d!125785 () Bool)

(assert (=> d!125785 (= (array_inv!24370 (_values!6323 thiss!1427)) (bvsge (size!32033 (_values!6323 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1039431 d!125785))

(declare-fun d!125787 () Bool)

(declare-fun res!693136 () Bool)

(declare-fun e!588278 () Bool)

(assert (=> d!125787 (=> (not res!693136) (not e!588278))))

(declare-fun simpleValid!421 (LongMapFixedSize!5836) Bool)

(assert (=> d!125787 (= res!693136 (simpleValid!421 thiss!1427))))

(assert (=> d!125787 (= (valid!2204 thiss!1427) e!588278)))

(declare-fun b!1039574 () Bool)

(declare-fun res!693137 () Bool)

(assert (=> b!1039574 (=> (not res!693137) (not e!588278))))

(assert (=> b!1039574 (= res!693137 (= (arrayCountValidKeys!0 (_keys!11538 thiss!1427) #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))) (_size!2973 thiss!1427)))))

(declare-fun b!1039575 () Bool)

(declare-fun res!693138 () Bool)

(assert (=> b!1039575 (=> (not res!693138) (not e!588278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65459 (_ BitVec 32)) Bool)

(assert (=> b!1039575 (= res!693138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11538 thiss!1427) (mask!30293 thiss!1427)))))

(declare-fun b!1039576 () Bool)

(assert (=> b!1039576 (= e!588278 (arrayNoDuplicates!0 (_keys!11538 thiss!1427) #b00000000000000000000000000000000 Nil!21916))))

(assert (= (and d!125787 res!693136) b!1039574))

(assert (= (and b!1039574 res!693137) b!1039575))

(assert (= (and b!1039575 res!693138) b!1039576))

(declare-fun m!959925 () Bool)

(assert (=> d!125787 m!959925))

(assert (=> b!1039574 m!959813))

(declare-fun m!959927 () Bool)

(assert (=> b!1039575 m!959927))

(assert (=> b!1039576 m!959801))

(assert (=> start!91046 d!125787))

(declare-fun bm!44005 () Bool)

(declare-fun call!44008 () Bool)

(declare-fun c!105608 () Bool)

(assert (=> bm!44005 (= call!44008 (arrayNoDuplicates!0 (_keys!11538 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105608 (Cons!21915 (select (arr!31501 (_keys!11538 thiss!1427)) #b00000000000000000000000000000000) Nil!21916) Nil!21916)))))

(declare-fun b!1039587 () Bool)

(declare-fun e!588289 () Bool)

(declare-fun e!588290 () Bool)

(assert (=> b!1039587 (= e!588289 e!588290)))

(assert (=> b!1039587 (= c!105608 (validKeyInArray!0 (select (arr!31501 (_keys!11538 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039589 () Bool)

(declare-fun e!588288 () Bool)

(assert (=> b!1039589 (= e!588288 e!588289)))

(declare-fun res!693145 () Bool)

(assert (=> b!1039589 (=> (not res!693145) (not e!588289))))

(declare-fun e!588287 () Bool)

(assert (=> b!1039589 (= res!693145 (not e!588287))))

(declare-fun res!693147 () Bool)

(assert (=> b!1039589 (=> (not res!693147) (not e!588287))))

(assert (=> b!1039589 (= res!693147 (validKeyInArray!0 (select (arr!31501 (_keys!11538 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039590 () Bool)

(assert (=> b!1039590 (= e!588290 call!44008)))

(declare-fun b!1039591 () Bool)

(assert (=> b!1039591 (= e!588287 (contains!6059 Nil!21916 (select (arr!31501 (_keys!11538 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1039588 () Bool)

(assert (=> b!1039588 (= e!588290 call!44008)))

(declare-fun d!125789 () Bool)

(declare-fun res!693146 () Bool)

(assert (=> d!125789 (=> res!693146 e!588288)))

(assert (=> d!125789 (= res!693146 (bvsge #b00000000000000000000000000000000 (size!32032 (_keys!11538 thiss!1427))))))

(assert (=> d!125789 (= (arrayNoDuplicates!0 (_keys!11538 thiss!1427) #b00000000000000000000000000000000 Nil!21916) e!588288)))

(assert (= (and d!125789 (not res!693146)) b!1039589))

(assert (= (and b!1039589 res!693147) b!1039591))

(assert (= (and b!1039589 res!693145) b!1039587))

(assert (= (and b!1039587 c!105608) b!1039590))

(assert (= (and b!1039587 (not c!105608)) b!1039588))

(assert (= (or b!1039590 b!1039588) bm!44005))

(assert (=> bm!44005 m!959913))

(declare-fun m!959929 () Bool)

(assert (=> bm!44005 m!959929))

(assert (=> b!1039587 m!959913))

(assert (=> b!1039587 m!959913))

(assert (=> b!1039587 m!959915))

(assert (=> b!1039589 m!959913))

(assert (=> b!1039589 m!959913))

(assert (=> b!1039589 m!959915))

(assert (=> b!1039591 m!959913))

(assert (=> b!1039591 m!959913))

(declare-fun m!959931 () Bool)

(assert (=> b!1039591 m!959931))

(assert (=> b!1039425 d!125789))

(declare-fun mapNonEmpty!38523 () Bool)

(declare-fun mapRes!38523 () Bool)

(declare-fun tp!73960 () Bool)

(declare-fun e!588296 () Bool)

(assert (=> mapNonEmpty!38523 (= mapRes!38523 (and tp!73960 e!588296))))

(declare-fun mapKey!38523 () (_ BitVec 32))

(declare-fun mapRest!38523 () (Array (_ BitVec 32) ValueCell!11621))

(declare-fun mapValue!38523 () ValueCell!11621)

(assert (=> mapNonEmpty!38523 (= mapRest!38514 (store mapRest!38523 mapKey!38523 mapValue!38523))))

(declare-fun b!1039599 () Bool)

(declare-fun e!588295 () Bool)

(assert (=> b!1039599 (= e!588295 tp_is_empty!24649)))

(declare-fun b!1039598 () Bool)

(assert (=> b!1039598 (= e!588296 tp_is_empty!24649)))

(declare-fun mapIsEmpty!38523 () Bool)

(assert (=> mapIsEmpty!38523 mapRes!38523))

(declare-fun condMapEmpty!38523 () Bool)

(declare-fun mapDefault!38523 () ValueCell!11621)

(assert (=> mapNonEmpty!38514 (= condMapEmpty!38523 (= mapRest!38514 ((as const (Array (_ BitVec 32) ValueCell!11621)) mapDefault!38523)))))

(assert (=> mapNonEmpty!38514 (= tp!73945 (and e!588295 mapRes!38523))))

(assert (= (and mapNonEmpty!38514 condMapEmpty!38523) mapIsEmpty!38523))

(assert (= (and mapNonEmpty!38514 (not condMapEmpty!38523)) mapNonEmpty!38523))

(assert (= (and mapNonEmpty!38523 ((_ is ValueCellFull!11621) mapValue!38523)) b!1039598))

(assert (= (and mapNonEmpty!38514 ((_ is ValueCellFull!11621) mapDefault!38523)) b!1039599))

(declare-fun m!959933 () Bool)

(assert (=> mapNonEmpty!38523 m!959933))

(check-sat (not b!1039530) (not bm!44005) (not b_next!20929) (not bm!44002) (not b!1039537) (not b!1039575) b_and!33471 (not b!1039591) (not mapNonEmpty!38523) (not b!1039551) (not b!1039576) (not b!1039513) (not b!1039574) (not d!125775) (not b!1039539) (not d!125771) (not b!1039565) tp_is_empty!24649 (not b!1039589) (not b!1039567) (not d!125787) (not b!1039564) (not bm!44001) (not d!125773) (not d!125781) (not b!1039587) (not b!1039512) (not b!1039555))
(check-sat b_and!33471 (not b_next!20929))
