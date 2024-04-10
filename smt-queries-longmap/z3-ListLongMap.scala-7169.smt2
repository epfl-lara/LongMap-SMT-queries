; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91550 () Bool)

(assert start!91550)

(declare-fun b!1042676 () Bool)

(declare-fun b_free!21069 () Bool)

(declare-fun b_next!21069 () Bool)

(assert (=> b!1042676 (= b_free!21069 (not b_next!21069))))

(declare-fun tp!74436 () Bool)

(declare-fun b_and!33601 () Bool)

(assert (=> b!1042676 (= tp!74436 b_and!33601)))

(declare-fun mapIsEmpty!38795 () Bool)

(declare-fun mapRes!38795 () Bool)

(assert (=> mapIsEmpty!38795 mapRes!38795))

(declare-fun b!1042672 () Bool)

(declare-fun e!590669 () Bool)

(declare-fun e!590670 () Bool)

(assert (=> b!1042672 (= e!590669 (and e!590670 mapRes!38795))))

(declare-fun condMapEmpty!38795 () Bool)

(declare-datatypes ((V!37925 0))(
  ( (V!37926 (val!12445 Int)) )
))
(declare-datatypes ((ValueCell!11691 0))(
  ( (ValueCellFull!11691 (v!15036 V!37925)) (EmptyCell!11691) )
))
(declare-datatypes ((array!65734 0))(
  ( (array!65735 (arr!31623 (Array (_ BitVec 32) (_ BitVec 64))) (size!32158 (_ BitVec 32))) )
))
(declare-datatypes ((array!65736 0))(
  ( (array!65737 (arr!31624 (Array (_ BitVec 32) ValueCell!11691)) (size!32159 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5976 0))(
  ( (LongMapFixedSize!5977 (defaultEntry!6370 Int) (mask!30439 (_ BitVec 32)) (extraKeys!6098 (_ BitVec 32)) (zeroValue!6204 V!37925) (minValue!6204 V!37925) (_size!3043 (_ BitVec 32)) (_keys!11622 array!65734) (_values!6393 array!65736) (_vacant!3043 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5976)

(declare-fun mapDefault!38795 () ValueCell!11691)

(assert (=> b!1042672 (= condMapEmpty!38795 (= (arr!31624 (_values!6393 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11691)) mapDefault!38795)))))

(declare-fun mapNonEmpty!38795 () Bool)

(declare-fun tp!74435 () Bool)

(declare-fun e!590672 () Bool)

(assert (=> mapNonEmpty!38795 (= mapRes!38795 (and tp!74435 e!590672))))

(declare-fun mapRest!38795 () (Array (_ BitVec 32) ValueCell!11691))

(declare-fun mapValue!38795 () ValueCell!11691)

(declare-fun mapKey!38795 () (_ BitVec 32))

(assert (=> mapNonEmpty!38795 (= (arr!31624 (_values!6393 thiss!1427)) (store mapRest!38795 mapKey!38795 mapValue!38795))))

(declare-fun b!1042673 () Bool)

(declare-fun tp_is_empty!24789 () Bool)

(assert (=> b!1042673 (= e!590670 tp_is_empty!24789)))

(declare-fun b!1042674 () Bool)

(declare-fun e!590673 () Bool)

(declare-datatypes ((SeekEntryResult!9819 0))(
  ( (MissingZero!9819 (index!41647 (_ BitVec 32))) (Found!9819 (index!41648 (_ BitVec 32))) (Intermediate!9819 (undefined!10631 Bool) (index!41649 (_ BitVec 32)) (x!93087 (_ BitVec 32))) (Undefined!9819) (MissingVacant!9819 (index!41650 (_ BitVec 32))) )
))
(declare-fun lt!459578 () SeekEntryResult!9819)

(assert (=> b!1042674 (= e!590673 (and (bvsge (index!41648 lt!459578) #b00000000000000000000000000000000) (bvslt (index!41648 lt!459578) (size!32158 (_keys!11622 thiss!1427)))))))

(declare-fun b!1042675 () Bool)

(declare-fun res!694725 () Bool)

(assert (=> b!1042675 (=> res!694725 e!590673)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65734 (_ BitVec 32)) Bool)

(assert (=> b!1042675 (= res!694725 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11622 thiss!1427) (mask!30439 thiss!1427))))))

(declare-fun e!590671 () Bool)

(declare-fun array_inv!24433 (array!65734) Bool)

(declare-fun array_inv!24434 (array!65736) Bool)

(assert (=> b!1042676 (= e!590671 (and tp!74436 tp_is_empty!24789 (array_inv!24433 (_keys!11622 thiss!1427)) (array_inv!24434 (_values!6393 thiss!1427)) e!590669))))

(declare-fun b!1042677 () Bool)

(declare-fun res!694722 () Bool)

(assert (=> b!1042677 (=> res!694722 e!590673)))

(assert (=> b!1042677 (= res!694722 (or (not (= (size!32159 (_values!6393 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30439 thiss!1427)))) (not (= (size!32158 (_keys!11622 thiss!1427)) (size!32159 (_values!6393 thiss!1427)))) (bvslt (mask!30439 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6098 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6098 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1042678 () Bool)

(assert (=> b!1042678 (= e!590672 tp_is_empty!24789)))

(declare-fun b!1042679 () Bool)

(declare-fun res!694728 () Bool)

(declare-fun e!590676 () Bool)

(assert (=> b!1042679 (=> (not res!694728) (not e!590676))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042679 (= res!694728 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042680 () Bool)

(declare-fun res!694724 () Bool)

(assert (=> b!1042680 (=> res!694724 e!590673)))

(declare-datatypes ((List!21977 0))(
  ( (Nil!21974) (Cons!21973 (h!23181 (_ BitVec 64)) (t!31191 List!21977)) )
))
(declare-fun arrayNoDuplicates!0 (array!65734 (_ BitVec 32) List!21977) Bool)

(assert (=> b!1042680 (= res!694724 (not (arrayNoDuplicates!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 Nil!21974)))))

(declare-fun res!694727 () Bool)

(assert (=> start!91550 (=> (not res!694727) (not e!590676))))

(declare-fun valid!2244 (LongMapFixedSize!5976) Bool)

(assert (=> start!91550 (= res!694727 (valid!2244 thiss!1427))))

(assert (=> start!91550 e!590676))

(assert (=> start!91550 e!590671))

(assert (=> start!91550 true))

(declare-fun b!1042681 () Bool)

(declare-fun e!590674 () Bool)

(assert (=> b!1042681 (= e!590674 (not e!590673))))

(declare-fun res!694723 () Bool)

(assert (=> b!1042681 (=> res!694723 e!590673)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042681 (= res!694723 (not (validMask!0 (mask!30439 thiss!1427))))))

(declare-fun lt!459581 () array!65734)

(declare-fun arrayContainsKey!0 (array!65734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042681 (not (arrayContainsKey!0 lt!459581 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34051 0))(
  ( (Unit!34052) )
))
(declare-fun lt!459579 () Unit!34051)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65734 (_ BitVec 32) (_ BitVec 64)) Unit!34051)

(assert (=> b!1042681 (= lt!459579 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11622 thiss!1427) (index!41648 lt!459578) key!909))))

(assert (=> b!1042681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459581 (mask!30439 thiss!1427))))

(declare-fun lt!459582 () Unit!34051)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65734 (_ BitVec 32) (_ BitVec 32)) Unit!34051)

(assert (=> b!1042681 (= lt!459582 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11622 thiss!1427) (index!41648 lt!459578) (mask!30439 thiss!1427)))))

(assert (=> b!1042681 (arrayNoDuplicates!0 lt!459581 #b00000000000000000000000000000000 Nil!21974)))

(declare-fun lt!459580 () Unit!34051)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65734 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21977) Unit!34051)

(assert (=> b!1042681 (= lt!459580 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11622 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41648 lt!459578) #b00000000000000000000000000000000 Nil!21974))))

(declare-fun arrayCountValidKeys!0 (array!65734 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042681 (= (arrayCountValidKeys!0 lt!459581 #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042681 (= lt!459581 (array!65735 (store (arr!31623 (_keys!11622 thiss!1427)) (index!41648 lt!459578) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32158 (_keys!11622 thiss!1427))))))

(declare-fun lt!459583 () Unit!34051)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65734 (_ BitVec 32) (_ BitVec 64)) Unit!34051)

(assert (=> b!1042681 (= lt!459583 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11622 thiss!1427) (index!41648 lt!459578) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042682 () Bool)

(assert (=> b!1042682 (= e!590676 e!590674)))

(declare-fun res!694726 () Bool)

(assert (=> b!1042682 (=> (not res!694726) (not e!590674))))

(get-info :version)

(assert (=> b!1042682 (= res!694726 ((_ is Found!9819) lt!459578))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65734 (_ BitVec 32)) SeekEntryResult!9819)

(assert (=> b!1042682 (= lt!459578 (seekEntry!0 key!909 (_keys!11622 thiss!1427) (mask!30439 thiss!1427)))))

(assert (= (and start!91550 res!694727) b!1042679))

(assert (= (and b!1042679 res!694728) b!1042682))

(assert (= (and b!1042682 res!694726) b!1042681))

(assert (= (and b!1042681 (not res!694723)) b!1042677))

(assert (= (and b!1042677 (not res!694722)) b!1042675))

(assert (= (and b!1042675 (not res!694725)) b!1042680))

(assert (= (and b!1042680 (not res!694724)) b!1042674))

(assert (= (and b!1042672 condMapEmpty!38795) mapIsEmpty!38795))

(assert (= (and b!1042672 (not condMapEmpty!38795)) mapNonEmpty!38795))

(assert (= (and mapNonEmpty!38795 ((_ is ValueCellFull!11691) mapValue!38795)) b!1042678))

(assert (= (and b!1042672 ((_ is ValueCellFull!11691) mapDefault!38795)) b!1042673))

(assert (= b!1042676 b!1042672))

(assert (= start!91550 b!1042676))

(declare-fun m!961957 () Bool)

(assert (=> b!1042675 m!961957))

(declare-fun m!961959 () Bool)

(assert (=> b!1042682 m!961959))

(declare-fun m!961961 () Bool)

(assert (=> b!1042676 m!961961))

(declare-fun m!961963 () Bool)

(assert (=> b!1042676 m!961963))

(declare-fun m!961965 () Bool)

(assert (=> start!91550 m!961965))

(declare-fun m!961967 () Bool)

(assert (=> b!1042681 m!961967))

(declare-fun m!961969 () Bool)

(assert (=> b!1042681 m!961969))

(declare-fun m!961971 () Bool)

(assert (=> b!1042681 m!961971))

(declare-fun m!961973 () Bool)

(assert (=> b!1042681 m!961973))

(declare-fun m!961975 () Bool)

(assert (=> b!1042681 m!961975))

(declare-fun m!961977 () Bool)

(assert (=> b!1042681 m!961977))

(declare-fun m!961979 () Bool)

(assert (=> b!1042681 m!961979))

(declare-fun m!961981 () Bool)

(assert (=> b!1042681 m!961981))

(declare-fun m!961983 () Bool)

(assert (=> b!1042681 m!961983))

(declare-fun m!961985 () Bool)

(assert (=> b!1042681 m!961985))

(declare-fun m!961987 () Bool)

(assert (=> b!1042681 m!961987))

(declare-fun m!961989 () Bool)

(assert (=> mapNonEmpty!38795 m!961989))

(declare-fun m!961991 () Bool)

(assert (=> b!1042680 m!961991))

(check-sat (not b!1042675) (not b_next!21069) (not b!1042676) (not b!1042681) (not start!91550) (not b!1042682) (not mapNonEmpty!38795) b_and!33601 tp_is_empty!24789 (not b!1042680))
(check-sat b_and!33601 (not b_next!21069))
(get-model)

(declare-fun b!1042728 () Bool)

(declare-fun c!105866 () Bool)

(declare-fun lt!459612 () (_ BitVec 64))

(assert (=> b!1042728 (= c!105866 (= lt!459612 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590708 () SeekEntryResult!9819)

(declare-fun e!590707 () SeekEntryResult!9819)

(assert (=> b!1042728 (= e!590708 e!590707)))

(declare-fun d!126151 () Bool)

(declare-fun lt!459613 () SeekEntryResult!9819)

(assert (=> d!126151 (and (or ((_ is MissingVacant!9819) lt!459613) (not ((_ is Found!9819) lt!459613)) (and (bvsge (index!41648 lt!459613) #b00000000000000000000000000000000) (bvslt (index!41648 lt!459613) (size!32158 (_keys!11622 thiss!1427))))) (not ((_ is MissingVacant!9819) lt!459613)) (or (not ((_ is Found!9819) lt!459613)) (= (select (arr!31623 (_keys!11622 thiss!1427)) (index!41648 lt!459613)) key!909)))))

(declare-fun e!590709 () SeekEntryResult!9819)

(assert (=> d!126151 (= lt!459613 e!590709)))

(declare-fun c!105865 () Bool)

(declare-fun lt!459610 () SeekEntryResult!9819)

(assert (=> d!126151 (= c!105865 (and ((_ is Intermediate!9819) lt!459610) (undefined!10631 lt!459610)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65734 (_ BitVec 32)) SeekEntryResult!9819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!126151 (= lt!459610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!909 (mask!30439 thiss!1427)) key!909 (_keys!11622 thiss!1427) (mask!30439 thiss!1427)))))

(assert (=> d!126151 (validMask!0 (mask!30439 thiss!1427))))

(assert (=> d!126151 (= (seekEntry!0 key!909 (_keys!11622 thiss!1427) (mask!30439 thiss!1427)) lt!459613)))

(declare-fun b!1042729 () Bool)

(assert (=> b!1042729 (= e!590709 e!590708)))

(assert (=> b!1042729 (= lt!459612 (select (arr!31623 (_keys!11622 thiss!1427)) (index!41649 lt!459610)))))

(declare-fun c!105864 () Bool)

(assert (=> b!1042729 (= c!105864 (= lt!459612 key!909))))

(declare-fun b!1042730 () Bool)

(assert (=> b!1042730 (= e!590708 (Found!9819 (index!41649 lt!459610)))))

(declare-fun b!1042731 () Bool)

(assert (=> b!1042731 (= e!590709 Undefined!9819)))

(declare-fun b!1042732 () Bool)

(assert (=> b!1042732 (= e!590707 (MissingZero!9819 (index!41649 lt!459610)))))

(declare-fun b!1042733 () Bool)

(declare-fun lt!459611 () SeekEntryResult!9819)

(assert (=> b!1042733 (= e!590707 (ite ((_ is MissingVacant!9819) lt!459611) (MissingZero!9819 (index!41650 lt!459611)) lt!459611))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65734 (_ BitVec 32)) SeekEntryResult!9819)

(assert (=> b!1042733 (= lt!459611 (seekKeyOrZeroReturnVacant!0 (x!93087 lt!459610) (index!41649 lt!459610) (index!41649 lt!459610) key!909 (_keys!11622 thiss!1427) (mask!30439 thiss!1427)))))

(assert (= (and d!126151 c!105865) b!1042731))

(assert (= (and d!126151 (not c!105865)) b!1042729))

(assert (= (and b!1042729 c!105864) b!1042730))

(assert (= (and b!1042729 (not c!105864)) b!1042728))

(assert (= (and b!1042728 c!105866) b!1042732))

(assert (= (and b!1042728 (not c!105866)) b!1042733))

(declare-fun m!962029 () Bool)

(assert (=> d!126151 m!962029))

(declare-fun m!962031 () Bool)

(assert (=> d!126151 m!962031))

(assert (=> d!126151 m!962031))

(declare-fun m!962033 () Bool)

(assert (=> d!126151 m!962033))

(assert (=> d!126151 m!961971))

(declare-fun m!962035 () Bool)

(assert (=> b!1042729 m!962035))

(declare-fun m!962037 () Bool)

(assert (=> b!1042733 m!962037))

(assert (=> b!1042682 d!126151))

(declare-fun d!126153 () Bool)

(declare-fun res!694756 () Bool)

(declare-fun e!590712 () Bool)

(assert (=> d!126153 (=> (not res!694756) (not e!590712))))

(declare-fun simpleValid!443 (LongMapFixedSize!5976) Bool)

(assert (=> d!126153 (= res!694756 (simpleValid!443 thiss!1427))))

(assert (=> d!126153 (= (valid!2244 thiss!1427) e!590712)))

(declare-fun b!1042740 () Bool)

(declare-fun res!694757 () Bool)

(assert (=> b!1042740 (=> (not res!694757) (not e!590712))))

(assert (=> b!1042740 (= res!694757 (= (arrayCountValidKeys!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) (_size!3043 thiss!1427)))))

(declare-fun b!1042741 () Bool)

(declare-fun res!694758 () Bool)

(assert (=> b!1042741 (=> (not res!694758) (not e!590712))))

(assert (=> b!1042741 (= res!694758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11622 thiss!1427) (mask!30439 thiss!1427)))))

(declare-fun b!1042742 () Bool)

(assert (=> b!1042742 (= e!590712 (arrayNoDuplicates!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 Nil!21974))))

(assert (= (and d!126153 res!694756) b!1042740))

(assert (= (and b!1042740 res!694757) b!1042741))

(assert (= (and b!1042741 res!694758) b!1042742))

(declare-fun m!962039 () Bool)

(assert (=> d!126153 m!962039))

(assert (=> b!1042740 m!961979))

(assert (=> b!1042741 m!961957))

(assert (=> b!1042742 m!961991))

(assert (=> start!91550 d!126153))

(declare-fun d!126155 () Bool)

(assert (=> d!126155 (= (array_inv!24433 (_keys!11622 thiss!1427)) (bvsge (size!32158 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042676 d!126155))

(declare-fun d!126157 () Bool)

(assert (=> d!126157 (= (array_inv!24434 (_values!6393 thiss!1427)) (bvsge (size!32159 (_values!6393 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1042676 d!126157))

(declare-fun d!126159 () Bool)

(declare-fun e!590715 () Bool)

(assert (=> d!126159 e!590715))

(declare-fun res!694761 () Bool)

(assert (=> d!126159 (=> (not res!694761) (not e!590715))))

(assert (=> d!126159 (= res!694761 (bvslt (index!41648 lt!459578) (size!32158 (_keys!11622 thiss!1427))))))

(declare-fun lt!459616 () Unit!34051)

(declare-fun choose!121 (array!65734 (_ BitVec 32) (_ BitVec 64)) Unit!34051)

(assert (=> d!126159 (= lt!459616 (choose!121 (_keys!11622 thiss!1427) (index!41648 lt!459578) key!909))))

(assert (=> d!126159 (bvsge (index!41648 lt!459578) #b00000000000000000000000000000000)))

(assert (=> d!126159 (= (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11622 thiss!1427) (index!41648 lt!459578) key!909) lt!459616)))

(declare-fun b!1042745 () Bool)

(assert (=> b!1042745 (= e!590715 (not (arrayContainsKey!0 (array!65735 (store (arr!31623 (_keys!11622 thiss!1427)) (index!41648 lt!459578) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32158 (_keys!11622 thiss!1427))) key!909 #b00000000000000000000000000000000)))))

(assert (= (and d!126159 res!694761) b!1042745))

(declare-fun m!962041 () Bool)

(assert (=> d!126159 m!962041))

(assert (=> b!1042745 m!961973))

(declare-fun m!962043 () Bool)

(assert (=> b!1042745 m!962043))

(assert (=> b!1042681 d!126159))

(declare-fun b!1042754 () Bool)

(declare-fun e!590723 () Bool)

(declare-fun e!590722 () Bool)

(assert (=> b!1042754 (= e!590723 e!590722)))

(declare-fun c!105869 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1042754 (= c!105869 (validKeyInArray!0 (select (arr!31623 lt!459581) #b00000000000000000000000000000000)))))

(declare-fun d!126161 () Bool)

(declare-fun res!694767 () Bool)

(assert (=> d!126161 (=> res!694767 e!590723)))

(assert (=> d!126161 (= res!694767 (bvsge #b00000000000000000000000000000000 (size!32158 lt!459581)))))

(assert (=> d!126161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459581 (mask!30439 thiss!1427)) e!590723)))

(declare-fun b!1042755 () Bool)

(declare-fun e!590724 () Bool)

(declare-fun call!44189 () Bool)

(assert (=> b!1042755 (= e!590724 call!44189)))

(declare-fun bm!44186 () Bool)

(assert (=> bm!44186 (= call!44189 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!459581 (mask!30439 thiss!1427)))))

(declare-fun b!1042756 () Bool)

(assert (=> b!1042756 (= e!590722 call!44189)))

(declare-fun b!1042757 () Bool)

(assert (=> b!1042757 (= e!590722 e!590724)))

(declare-fun lt!459623 () (_ BitVec 64))

(assert (=> b!1042757 (= lt!459623 (select (arr!31623 lt!459581) #b00000000000000000000000000000000))))

(declare-fun lt!459625 () Unit!34051)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65734 (_ BitVec 64) (_ BitVec 32)) Unit!34051)

(assert (=> b!1042757 (= lt!459625 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!459581 lt!459623 #b00000000000000000000000000000000))))

(assert (=> b!1042757 (arrayContainsKey!0 lt!459581 lt!459623 #b00000000000000000000000000000000)))

(declare-fun lt!459624 () Unit!34051)

(assert (=> b!1042757 (= lt!459624 lt!459625)))

(declare-fun res!694766 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65734 (_ BitVec 32)) SeekEntryResult!9819)

(assert (=> b!1042757 (= res!694766 (= (seekEntryOrOpen!0 (select (arr!31623 lt!459581) #b00000000000000000000000000000000) lt!459581 (mask!30439 thiss!1427)) (Found!9819 #b00000000000000000000000000000000)))))

(assert (=> b!1042757 (=> (not res!694766) (not e!590724))))

(assert (= (and d!126161 (not res!694767)) b!1042754))

(assert (= (and b!1042754 c!105869) b!1042757))

(assert (= (and b!1042754 (not c!105869)) b!1042756))

(assert (= (and b!1042757 res!694766) b!1042755))

(assert (= (or b!1042755 b!1042756) bm!44186))

(declare-fun m!962045 () Bool)

(assert (=> b!1042754 m!962045))

(assert (=> b!1042754 m!962045))

(declare-fun m!962047 () Bool)

(assert (=> b!1042754 m!962047))

(declare-fun m!962049 () Bool)

(assert (=> bm!44186 m!962049))

(assert (=> b!1042757 m!962045))

(declare-fun m!962051 () Bool)

(assert (=> b!1042757 m!962051))

(declare-fun m!962053 () Bool)

(assert (=> b!1042757 m!962053))

(assert (=> b!1042757 m!962045))

(declare-fun m!962055 () Bool)

(assert (=> b!1042757 m!962055))

(assert (=> b!1042681 d!126161))

(declare-fun d!126163 () Bool)

(declare-fun res!694772 () Bool)

(declare-fun e!590729 () Bool)

(assert (=> d!126163 (=> res!694772 e!590729)))

(assert (=> d!126163 (= res!694772 (= (select (arr!31623 lt!459581) #b00000000000000000000000000000000) key!909))))

(assert (=> d!126163 (= (arrayContainsKey!0 lt!459581 key!909 #b00000000000000000000000000000000) e!590729)))

(declare-fun b!1042762 () Bool)

(declare-fun e!590730 () Bool)

(assert (=> b!1042762 (= e!590729 e!590730)))

(declare-fun res!694773 () Bool)

(assert (=> b!1042762 (=> (not res!694773) (not e!590730))))

(assert (=> b!1042762 (= res!694773 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32158 lt!459581)))))

(declare-fun b!1042763 () Bool)

(assert (=> b!1042763 (= e!590730 (arrayContainsKey!0 lt!459581 key!909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!126163 (not res!694772)) b!1042762))

(assert (= (and b!1042762 res!694773) b!1042763))

(assert (=> d!126163 m!962045))

(declare-fun m!962057 () Bool)

(assert (=> b!1042763 m!962057))

(assert (=> b!1042681 d!126163))

(declare-fun d!126165 () Bool)

(assert (=> d!126165 (= (validMask!0 (mask!30439 thiss!1427)) (and (or (= (mask!30439 thiss!1427) #b00000000000000000000000000000111) (= (mask!30439 thiss!1427) #b00000000000000000000000000001111) (= (mask!30439 thiss!1427) #b00000000000000000000000000011111) (= (mask!30439 thiss!1427) #b00000000000000000000000000111111) (= (mask!30439 thiss!1427) #b00000000000000000000000001111111) (= (mask!30439 thiss!1427) #b00000000000000000000000011111111) (= (mask!30439 thiss!1427) #b00000000000000000000000111111111) (= (mask!30439 thiss!1427) #b00000000000000000000001111111111) (= (mask!30439 thiss!1427) #b00000000000000000000011111111111) (= (mask!30439 thiss!1427) #b00000000000000000000111111111111) (= (mask!30439 thiss!1427) #b00000000000000000001111111111111) (= (mask!30439 thiss!1427) #b00000000000000000011111111111111) (= (mask!30439 thiss!1427) #b00000000000000000111111111111111) (= (mask!30439 thiss!1427) #b00000000000000001111111111111111) (= (mask!30439 thiss!1427) #b00000000000000011111111111111111) (= (mask!30439 thiss!1427) #b00000000000000111111111111111111) (= (mask!30439 thiss!1427) #b00000000000001111111111111111111) (= (mask!30439 thiss!1427) #b00000000000011111111111111111111) (= (mask!30439 thiss!1427) #b00000000000111111111111111111111) (= (mask!30439 thiss!1427) #b00000000001111111111111111111111) (= (mask!30439 thiss!1427) #b00000000011111111111111111111111) (= (mask!30439 thiss!1427) #b00000000111111111111111111111111) (= (mask!30439 thiss!1427) #b00000001111111111111111111111111) (= (mask!30439 thiss!1427) #b00000011111111111111111111111111) (= (mask!30439 thiss!1427) #b00000111111111111111111111111111) (= (mask!30439 thiss!1427) #b00001111111111111111111111111111) (= (mask!30439 thiss!1427) #b00011111111111111111111111111111) (= (mask!30439 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30439 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1042681 d!126165))

(declare-fun d!126167 () Bool)

(declare-fun e!590733 () Bool)

(assert (=> d!126167 e!590733))

(declare-fun res!694776 () Bool)

(assert (=> d!126167 (=> (not res!694776) (not e!590733))))

(assert (=> d!126167 (= res!694776 (and (bvsge (index!41648 lt!459578) #b00000000000000000000000000000000) (bvslt (index!41648 lt!459578) (size!32158 (_keys!11622 thiss!1427)))))))

(declare-fun lt!459628 () Unit!34051)

(declare-fun choose!25 (array!65734 (_ BitVec 32) (_ BitVec 32)) Unit!34051)

(assert (=> d!126167 (= lt!459628 (choose!25 (_keys!11622 thiss!1427) (index!41648 lt!459578) (mask!30439 thiss!1427)))))

(assert (=> d!126167 (validMask!0 (mask!30439 thiss!1427))))

(assert (=> d!126167 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11622 thiss!1427) (index!41648 lt!459578) (mask!30439 thiss!1427)) lt!459628)))

(declare-fun b!1042766 () Bool)

(assert (=> b!1042766 (= e!590733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!65735 (store (arr!31623 (_keys!11622 thiss!1427)) (index!41648 lt!459578) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32158 (_keys!11622 thiss!1427))) (mask!30439 thiss!1427)))))

(assert (= (and d!126167 res!694776) b!1042766))

(declare-fun m!962059 () Bool)

(assert (=> d!126167 m!962059))

(assert (=> d!126167 m!961971))

(assert (=> b!1042766 m!961973))

(declare-fun m!962061 () Bool)

(assert (=> b!1042766 m!962061))

(assert (=> b!1042681 d!126167))

(declare-fun bm!44189 () Bool)

(declare-fun call!44192 () (_ BitVec 32))

(assert (=> bm!44189 (= call!44192 (arrayCountValidKeys!0 lt!459581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32158 (_keys!11622 thiss!1427))))))

(declare-fun d!126169 () Bool)

(declare-fun lt!459631 () (_ BitVec 32))

(assert (=> d!126169 (and (bvsge lt!459631 #b00000000000000000000000000000000) (bvsle lt!459631 (bvsub (size!32158 lt!459581) #b00000000000000000000000000000000)))))

(declare-fun e!590739 () (_ BitVec 32))

(assert (=> d!126169 (= lt!459631 e!590739)))

(declare-fun c!105874 () Bool)

(assert (=> d!126169 (= c!105874 (bvsge #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))))))

(assert (=> d!126169 (and (bvsle #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32158 (_keys!11622 thiss!1427)) (size!32158 lt!459581)))))

(assert (=> d!126169 (= (arrayCountValidKeys!0 lt!459581 #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) lt!459631)))

(declare-fun b!1042775 () Bool)

(assert (=> b!1042775 (= e!590739 #b00000000000000000000000000000000)))

(declare-fun b!1042776 () Bool)

(declare-fun e!590738 () (_ BitVec 32))

(assert (=> b!1042776 (= e!590739 e!590738)))

(declare-fun c!105875 () Bool)

(assert (=> b!1042776 (= c!105875 (validKeyInArray!0 (select (arr!31623 lt!459581) #b00000000000000000000000000000000)))))

(declare-fun b!1042777 () Bool)

(assert (=> b!1042777 (= e!590738 (bvadd #b00000000000000000000000000000001 call!44192))))

(declare-fun b!1042778 () Bool)

(assert (=> b!1042778 (= e!590738 call!44192)))

(assert (= (and d!126169 c!105874) b!1042775))

(assert (= (and d!126169 (not c!105874)) b!1042776))

(assert (= (and b!1042776 c!105875) b!1042777))

(assert (= (and b!1042776 (not c!105875)) b!1042778))

(assert (= (or b!1042777 b!1042778) bm!44189))

(declare-fun m!962063 () Bool)

(assert (=> bm!44189 m!962063))

(assert (=> b!1042776 m!962045))

(assert (=> b!1042776 m!962045))

(assert (=> b!1042776 m!962047))

(assert (=> b!1042681 d!126169))

(declare-fun d!126171 () Bool)

(declare-fun e!590745 () Bool)

(assert (=> d!126171 e!590745))

(declare-fun res!694788 () Bool)

(assert (=> d!126171 (=> (not res!694788) (not e!590745))))

(assert (=> d!126171 (= res!694788 (and (bvsge (index!41648 lt!459578) #b00000000000000000000000000000000) (bvslt (index!41648 lt!459578) (size!32158 (_keys!11622 thiss!1427)))))))

(declare-fun lt!459634 () Unit!34051)

(declare-fun choose!82 (array!65734 (_ BitVec 32) (_ BitVec 64)) Unit!34051)

(assert (=> d!126171 (= lt!459634 (choose!82 (_keys!11622 thiss!1427) (index!41648 lt!459578) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590744 () Bool)

(assert (=> d!126171 e!590744))

(declare-fun res!694787 () Bool)

(assert (=> d!126171 (=> (not res!694787) (not e!590744))))

(assert (=> d!126171 (= res!694787 (and (bvsge (index!41648 lt!459578) #b00000000000000000000000000000000) (bvslt (index!41648 lt!459578) (size!32158 (_keys!11622 thiss!1427)))))))

(assert (=> d!126171 (= (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11622 thiss!1427) (index!41648 lt!459578) #b1000000000000000000000000000000000000000000000000000000000000000) lt!459634)))

(declare-fun b!1042787 () Bool)

(declare-fun res!694785 () Bool)

(assert (=> b!1042787 (=> (not res!694785) (not e!590744))))

(assert (=> b!1042787 (= res!694785 (validKeyInArray!0 (select (arr!31623 (_keys!11622 thiss!1427)) (index!41648 lt!459578))))))

(declare-fun b!1042789 () Bool)

(assert (=> b!1042789 (= e!590744 (bvslt (size!32158 (_keys!11622 thiss!1427)) #b01111111111111111111111111111111))))

(declare-fun b!1042790 () Bool)

(assert (=> b!1042790 (= e!590745 (= (arrayCountValidKeys!0 (array!65735 (store (arr!31623 (_keys!11622 thiss!1427)) (index!41648 lt!459578) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32158 (_keys!11622 thiss!1427))) #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) #b00000000000000000000000000000001)))))

(declare-fun b!1042788 () Bool)

(declare-fun res!694786 () Bool)

(assert (=> b!1042788 (=> (not res!694786) (not e!590744))))

(assert (=> b!1042788 (= res!694786 (not (validKeyInArray!0 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!126171 res!694787) b!1042787))

(assert (= (and b!1042787 res!694785) b!1042788))

(assert (= (and b!1042788 res!694786) b!1042789))

(assert (= (and d!126171 res!694788) b!1042790))

(declare-fun m!962065 () Bool)

(assert (=> d!126171 m!962065))

(declare-fun m!962067 () Bool)

(assert (=> b!1042787 m!962067))

(assert (=> b!1042787 m!962067))

(declare-fun m!962069 () Bool)

(assert (=> b!1042787 m!962069))

(assert (=> b!1042790 m!961973))

(declare-fun m!962071 () Bool)

(assert (=> b!1042790 m!962071))

(assert (=> b!1042790 m!961979))

(declare-fun m!962073 () Bool)

(assert (=> b!1042788 m!962073))

(assert (=> b!1042681 d!126171))

(declare-fun d!126173 () Bool)

(declare-fun e!590748 () Bool)

(assert (=> d!126173 e!590748))

(declare-fun res!694791 () Bool)

(assert (=> d!126173 (=> (not res!694791) (not e!590748))))

(assert (=> d!126173 (= res!694791 (and (bvsge (index!41648 lt!459578) #b00000000000000000000000000000000) (bvslt (index!41648 lt!459578) (size!32158 (_keys!11622 thiss!1427)))))))

(declare-fun lt!459637 () Unit!34051)

(declare-fun choose!53 (array!65734 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21977) Unit!34051)

(assert (=> d!126173 (= lt!459637 (choose!53 (_keys!11622 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41648 lt!459578) #b00000000000000000000000000000000 Nil!21974))))

(assert (=> d!126173 (bvslt (size!32158 (_keys!11622 thiss!1427)) #b01111111111111111111111111111111)))

(assert (=> d!126173 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11622 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41648 lt!459578) #b00000000000000000000000000000000 Nil!21974) lt!459637)))

(declare-fun b!1042793 () Bool)

(assert (=> b!1042793 (= e!590748 (arrayNoDuplicates!0 (array!65735 (store (arr!31623 (_keys!11622 thiss!1427)) (index!41648 lt!459578) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32158 (_keys!11622 thiss!1427))) #b00000000000000000000000000000000 Nil!21974))))

(assert (= (and d!126173 res!694791) b!1042793))

(declare-fun m!962075 () Bool)

(assert (=> d!126173 m!962075))

(assert (=> b!1042793 m!961973))

(declare-fun m!962077 () Bool)

(assert (=> b!1042793 m!962077))

(assert (=> b!1042681 d!126173))

(declare-fun bm!44190 () Bool)

(declare-fun call!44193 () (_ BitVec 32))

(assert (=> bm!44190 (= call!44193 (arrayCountValidKeys!0 (_keys!11622 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32158 (_keys!11622 thiss!1427))))))

(declare-fun d!126175 () Bool)

(declare-fun lt!459638 () (_ BitVec 32))

(assert (=> d!126175 (and (bvsge lt!459638 #b00000000000000000000000000000000) (bvsle lt!459638 (bvsub (size!32158 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!590750 () (_ BitVec 32))

(assert (=> d!126175 (= lt!459638 e!590750)))

(declare-fun c!105876 () Bool)

(assert (=> d!126175 (= c!105876 (bvsge #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))))))

(assert (=> d!126175 (and (bvsle #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!32158 (_keys!11622 thiss!1427)) (size!32158 (_keys!11622 thiss!1427))))))

(assert (=> d!126175 (= (arrayCountValidKeys!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))) lt!459638)))

(declare-fun b!1042794 () Bool)

(assert (=> b!1042794 (= e!590750 #b00000000000000000000000000000000)))

(declare-fun b!1042795 () Bool)

(declare-fun e!590749 () (_ BitVec 32))

(assert (=> b!1042795 (= e!590750 e!590749)))

(declare-fun c!105877 () Bool)

(assert (=> b!1042795 (= c!105877 (validKeyInArray!0 (select (arr!31623 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042796 () Bool)

(assert (=> b!1042796 (= e!590749 (bvadd #b00000000000000000000000000000001 call!44193))))

(declare-fun b!1042797 () Bool)

(assert (=> b!1042797 (= e!590749 call!44193)))

(assert (= (and d!126175 c!105876) b!1042794))

(assert (= (and d!126175 (not c!105876)) b!1042795))

(assert (= (and b!1042795 c!105877) b!1042796))

(assert (= (and b!1042795 (not c!105877)) b!1042797))

(assert (= (or b!1042796 b!1042797) bm!44190))

(declare-fun m!962079 () Bool)

(assert (=> bm!44190 m!962079))

(declare-fun m!962081 () Bool)

(assert (=> b!1042795 m!962081))

(assert (=> b!1042795 m!962081))

(declare-fun m!962083 () Bool)

(assert (=> b!1042795 m!962083))

(assert (=> b!1042681 d!126175))

(declare-fun b!1042808 () Bool)

(declare-fun e!590761 () Bool)

(declare-fun call!44196 () Bool)

(assert (=> b!1042808 (= e!590761 call!44196)))

(declare-fun bm!44193 () Bool)

(declare-fun c!105880 () Bool)

(assert (=> bm!44193 (= call!44196 (arrayNoDuplicates!0 lt!459581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105880 (Cons!21973 (select (arr!31623 lt!459581) #b00000000000000000000000000000000) Nil!21974) Nil!21974)))))

(declare-fun d!126177 () Bool)

(declare-fun res!694800 () Bool)

(declare-fun e!590759 () Bool)

(assert (=> d!126177 (=> res!694800 e!590759)))

(assert (=> d!126177 (= res!694800 (bvsge #b00000000000000000000000000000000 (size!32158 lt!459581)))))

(assert (=> d!126177 (= (arrayNoDuplicates!0 lt!459581 #b00000000000000000000000000000000 Nil!21974) e!590759)))

(declare-fun b!1042809 () Bool)

(declare-fun e!590760 () Bool)

(assert (=> b!1042809 (= e!590759 e!590760)))

(declare-fun res!694799 () Bool)

(assert (=> b!1042809 (=> (not res!694799) (not e!590760))))

(declare-fun e!590762 () Bool)

(assert (=> b!1042809 (= res!694799 (not e!590762))))

(declare-fun res!694798 () Bool)

(assert (=> b!1042809 (=> (not res!694798) (not e!590762))))

(assert (=> b!1042809 (= res!694798 (validKeyInArray!0 (select (arr!31623 lt!459581) #b00000000000000000000000000000000)))))

(declare-fun b!1042810 () Bool)

(assert (=> b!1042810 (= e!590761 call!44196)))

(declare-fun b!1042811 () Bool)

(assert (=> b!1042811 (= e!590760 e!590761)))

(assert (=> b!1042811 (= c!105880 (validKeyInArray!0 (select (arr!31623 lt!459581) #b00000000000000000000000000000000)))))

(declare-fun b!1042812 () Bool)

(declare-fun contains!6059 (List!21977 (_ BitVec 64)) Bool)

(assert (=> b!1042812 (= e!590762 (contains!6059 Nil!21974 (select (arr!31623 lt!459581) #b00000000000000000000000000000000)))))

(assert (= (and d!126177 (not res!694800)) b!1042809))

(assert (= (and b!1042809 res!694798) b!1042812))

(assert (= (and b!1042809 res!694799) b!1042811))

(assert (= (and b!1042811 c!105880) b!1042808))

(assert (= (and b!1042811 (not c!105880)) b!1042810))

(assert (= (or b!1042808 b!1042810) bm!44193))

(assert (=> bm!44193 m!962045))

(declare-fun m!962085 () Bool)

(assert (=> bm!44193 m!962085))

(assert (=> b!1042809 m!962045))

(assert (=> b!1042809 m!962045))

(assert (=> b!1042809 m!962047))

(assert (=> b!1042811 m!962045))

(assert (=> b!1042811 m!962045))

(assert (=> b!1042811 m!962047))

(assert (=> b!1042812 m!962045))

(assert (=> b!1042812 m!962045))

(declare-fun m!962087 () Bool)

(assert (=> b!1042812 m!962087))

(assert (=> b!1042681 d!126177))

(declare-fun b!1042813 () Bool)

(declare-fun e!590765 () Bool)

(declare-fun call!44197 () Bool)

(assert (=> b!1042813 (= e!590765 call!44197)))

(declare-fun bm!44194 () Bool)

(declare-fun c!105881 () Bool)

(assert (=> bm!44194 (= call!44197 (arrayNoDuplicates!0 (_keys!11622 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105881 (Cons!21973 (select (arr!31623 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000) Nil!21974) Nil!21974)))))

(declare-fun d!126179 () Bool)

(declare-fun res!694803 () Bool)

(declare-fun e!590763 () Bool)

(assert (=> d!126179 (=> res!694803 e!590763)))

(assert (=> d!126179 (= res!694803 (bvsge #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))))))

(assert (=> d!126179 (= (arrayNoDuplicates!0 (_keys!11622 thiss!1427) #b00000000000000000000000000000000 Nil!21974) e!590763)))

(declare-fun b!1042814 () Bool)

(declare-fun e!590764 () Bool)

(assert (=> b!1042814 (= e!590763 e!590764)))

(declare-fun res!694802 () Bool)

(assert (=> b!1042814 (=> (not res!694802) (not e!590764))))

(declare-fun e!590766 () Bool)

(assert (=> b!1042814 (= res!694802 (not e!590766))))

(declare-fun res!694801 () Bool)

(assert (=> b!1042814 (=> (not res!694801) (not e!590766))))

(assert (=> b!1042814 (= res!694801 (validKeyInArray!0 (select (arr!31623 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042815 () Bool)

(assert (=> b!1042815 (= e!590765 call!44197)))

(declare-fun b!1042816 () Bool)

(assert (=> b!1042816 (= e!590764 e!590765)))

(assert (=> b!1042816 (= c!105881 (validKeyInArray!0 (select (arr!31623 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1042817 () Bool)

(assert (=> b!1042817 (= e!590766 (contains!6059 Nil!21974 (select (arr!31623 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!126179 (not res!694803)) b!1042814))

(assert (= (and b!1042814 res!694801) b!1042817))

(assert (= (and b!1042814 res!694802) b!1042816))

(assert (= (and b!1042816 c!105881) b!1042813))

(assert (= (and b!1042816 (not c!105881)) b!1042815))

(assert (= (or b!1042813 b!1042815) bm!44194))

(assert (=> bm!44194 m!962081))

(declare-fun m!962089 () Bool)

(assert (=> bm!44194 m!962089))

(assert (=> b!1042814 m!962081))

(assert (=> b!1042814 m!962081))

(assert (=> b!1042814 m!962083))

(assert (=> b!1042816 m!962081))

(assert (=> b!1042816 m!962081))

(assert (=> b!1042816 m!962083))

(assert (=> b!1042817 m!962081))

(assert (=> b!1042817 m!962081))

(declare-fun m!962091 () Bool)

(assert (=> b!1042817 m!962091))

(assert (=> b!1042680 d!126179))

(declare-fun b!1042818 () Bool)

(declare-fun e!590768 () Bool)

(declare-fun e!590767 () Bool)

(assert (=> b!1042818 (= e!590768 e!590767)))

(declare-fun c!105882 () Bool)

(assert (=> b!1042818 (= c!105882 (validKeyInArray!0 (select (arr!31623 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!126181 () Bool)

(declare-fun res!694805 () Bool)

(assert (=> d!126181 (=> res!694805 e!590768)))

(assert (=> d!126181 (= res!694805 (bvsge #b00000000000000000000000000000000 (size!32158 (_keys!11622 thiss!1427))))))

(assert (=> d!126181 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11622 thiss!1427) (mask!30439 thiss!1427)) e!590768)))

(declare-fun b!1042819 () Bool)

(declare-fun e!590769 () Bool)

(declare-fun call!44198 () Bool)

(assert (=> b!1042819 (= e!590769 call!44198)))

(declare-fun bm!44195 () Bool)

(assert (=> bm!44195 (= call!44198 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11622 thiss!1427) (mask!30439 thiss!1427)))))

(declare-fun b!1042820 () Bool)

(assert (=> b!1042820 (= e!590767 call!44198)))

(declare-fun b!1042821 () Bool)

(assert (=> b!1042821 (= e!590767 e!590769)))

(declare-fun lt!459639 () (_ BitVec 64))

(assert (=> b!1042821 (= lt!459639 (select (arr!31623 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!459641 () Unit!34051)

(assert (=> b!1042821 (= lt!459641 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11622 thiss!1427) lt!459639 #b00000000000000000000000000000000))))

(assert (=> b!1042821 (arrayContainsKey!0 (_keys!11622 thiss!1427) lt!459639 #b00000000000000000000000000000000)))

(declare-fun lt!459640 () Unit!34051)

(assert (=> b!1042821 (= lt!459640 lt!459641)))

(declare-fun res!694804 () Bool)

(assert (=> b!1042821 (= res!694804 (= (seekEntryOrOpen!0 (select (arr!31623 (_keys!11622 thiss!1427)) #b00000000000000000000000000000000) (_keys!11622 thiss!1427) (mask!30439 thiss!1427)) (Found!9819 #b00000000000000000000000000000000)))))

(assert (=> b!1042821 (=> (not res!694804) (not e!590769))))

(assert (= (and d!126181 (not res!694805)) b!1042818))

(assert (= (and b!1042818 c!105882) b!1042821))

(assert (= (and b!1042818 (not c!105882)) b!1042820))

(assert (= (and b!1042821 res!694804) b!1042819))

(assert (= (or b!1042819 b!1042820) bm!44195))

(assert (=> b!1042818 m!962081))

(assert (=> b!1042818 m!962081))

(assert (=> b!1042818 m!962083))

(declare-fun m!962093 () Bool)

(assert (=> bm!44195 m!962093))

(assert (=> b!1042821 m!962081))

(declare-fun m!962095 () Bool)

(assert (=> b!1042821 m!962095))

(declare-fun m!962097 () Bool)

(assert (=> b!1042821 m!962097))

(assert (=> b!1042821 m!962081))

(declare-fun m!962099 () Bool)

(assert (=> b!1042821 m!962099))

(assert (=> b!1042675 d!126181))

(declare-fun b!1042829 () Bool)

(declare-fun e!590774 () Bool)

(assert (=> b!1042829 (= e!590774 tp_is_empty!24789)))

(declare-fun mapIsEmpty!38801 () Bool)

(declare-fun mapRes!38801 () Bool)

(assert (=> mapIsEmpty!38801 mapRes!38801))

(declare-fun b!1042828 () Bool)

(declare-fun e!590775 () Bool)

(assert (=> b!1042828 (= e!590775 tp_is_empty!24789)))

(declare-fun condMapEmpty!38801 () Bool)

(declare-fun mapDefault!38801 () ValueCell!11691)

(assert (=> mapNonEmpty!38795 (= condMapEmpty!38801 (= mapRest!38795 ((as const (Array (_ BitVec 32) ValueCell!11691)) mapDefault!38801)))))

(assert (=> mapNonEmpty!38795 (= tp!74435 (and e!590774 mapRes!38801))))

(declare-fun mapNonEmpty!38801 () Bool)

(declare-fun tp!74445 () Bool)

(assert (=> mapNonEmpty!38801 (= mapRes!38801 (and tp!74445 e!590775))))

(declare-fun mapKey!38801 () (_ BitVec 32))

(declare-fun mapValue!38801 () ValueCell!11691)

(declare-fun mapRest!38801 () (Array (_ BitVec 32) ValueCell!11691))

(assert (=> mapNonEmpty!38801 (= mapRest!38795 (store mapRest!38801 mapKey!38801 mapValue!38801))))

(assert (= (and mapNonEmpty!38795 condMapEmpty!38801) mapIsEmpty!38801))

(assert (= (and mapNonEmpty!38795 (not condMapEmpty!38801)) mapNonEmpty!38801))

(assert (= (and mapNonEmpty!38801 ((_ is ValueCellFull!11691) mapValue!38801)) b!1042828))

(assert (= (and mapNonEmpty!38795 ((_ is ValueCellFull!11691) mapDefault!38801)) b!1042829))

(declare-fun m!962101 () Bool)

(assert (=> mapNonEmpty!38801 m!962101))

(check-sat (not b!1042814) (not d!126151) (not bm!44193) (not b!1042741) (not b!1042795) (not b!1042742) (not b!1042821) (not b!1042816) (not mapNonEmpty!38801) (not b!1042757) (not d!126167) (not b!1042766) (not d!126173) tp_is_empty!24789 (not bm!44194) (not d!126153) (not b!1042790) (not b_next!21069) (not bm!44195) (not b!1042817) (not b!1042811) (not d!126171) (not bm!44186) (not b!1042745) (not bm!44190) (not b!1042740) (not b!1042754) (not b!1042809) (not b!1042733) (not b!1042818) (not d!126159) (not b!1042776) (not b!1042788) (not b!1042793) (not bm!44189) (not b!1042812) (not b!1042763) (not b!1042787) b_and!33601)
(check-sat b_and!33601 (not b_next!21069))
