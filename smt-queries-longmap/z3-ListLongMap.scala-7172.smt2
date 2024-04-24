; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91882 () Bool)

(assert start!91882)

(declare-fun b!1044620 () Bool)

(declare-fun b_free!21085 () Bool)

(declare-fun b_next!21085 () Bool)

(assert (=> b!1044620 (= b_free!21085 (not b_next!21085))))

(declare-fun tp!74493 () Bool)

(declare-fun b_and!33627 () Bool)

(assert (=> b!1044620 (= tp!74493 b_and!33627)))

(declare-fun b!1044618 () Bool)

(declare-fun e!591935 () Bool)

(assert (=> b!1044618 (= e!591935 true)))

(declare-fun lt!460360 () Bool)

(declare-datatypes ((V!37947 0))(
  ( (V!37948 (val!12453 Int)) )
))
(declare-datatypes ((ValueCell!11699 0))(
  ( (ValueCellFull!11699 (v!15040 V!37947)) (EmptyCell!11699) )
))
(declare-datatypes ((array!65821 0))(
  ( (array!65822 (arr!31657 (Array (_ BitVec 32) (_ BitVec 64))) (size!32193 (_ BitVec 32))) )
))
(declare-datatypes ((array!65823 0))(
  ( (array!65824 (arr!31658 (Array (_ BitVec 32) ValueCell!11699)) (size!32194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5992 0))(
  ( (LongMapFixedSize!5993 (defaultEntry!6378 Int) (mask!30525 (_ BitVec 32)) (extraKeys!6106 (_ BitVec 32)) (zeroValue!6212 V!37947) (minValue!6212 V!37947) (_size!3051 (_ BitVec 32)) (_keys!11674 array!65821) (_values!6401 array!65823) (_vacant!3051 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5992)

(declare-datatypes ((List!21976 0))(
  ( (Nil!21973) (Cons!21972 (h!23189 (_ BitVec 64)) (t!31182 List!21976)) )
))
(declare-fun arrayNoDuplicates!0 (array!65821 (_ BitVec 32) List!21976) Bool)

(assert (=> b!1044618 (= lt!460360 (arrayNoDuplicates!0 (_keys!11674 thiss!1427) #b00000000000000000000000000000000 Nil!21973))))

(declare-fun b!1044619 () Bool)

(declare-fun e!591934 () Bool)

(declare-fun tp_is_empty!24805 () Bool)

(assert (=> b!1044619 (= e!591934 tp_is_empty!24805)))

(declare-fun e!591931 () Bool)

(declare-fun e!591932 () Bool)

(declare-fun array_inv!24469 (array!65821) Bool)

(declare-fun array_inv!24470 (array!65823) Bool)

(assert (=> b!1044620 (= e!591932 (and tp!74493 tp_is_empty!24805 (array_inv!24469 (_keys!11674 thiss!1427)) (array_inv!24470 (_values!6401 thiss!1427)) e!591931))))

(declare-fun b!1044621 () Bool)

(declare-fun res!695594 () Bool)

(declare-fun e!591933 () Bool)

(assert (=> b!1044621 (=> (not res!695594) (not e!591933))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1044621 (= res!695594 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1044622 () Bool)

(declare-fun e!591930 () Bool)

(assert (=> b!1044622 (= e!591933 e!591930)))

(declare-fun res!695593 () Bool)

(assert (=> b!1044622 (=> (not res!695593) (not e!591930))))

(declare-datatypes ((SeekEntryResult!9782 0))(
  ( (MissingZero!9782 (index!41499 (_ BitVec 32))) (Found!9782 (index!41500 (_ BitVec 32))) (Intermediate!9782 (undefined!10594 Bool) (index!41501 (_ BitVec 32)) (x!93120 (_ BitVec 32))) (Undefined!9782) (MissingVacant!9782 (index!41502 (_ BitVec 32))) )
))
(declare-fun lt!460364 () SeekEntryResult!9782)

(get-info :version)

(assert (=> b!1044622 (= res!695593 ((_ is Found!9782) lt!460364))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65821 (_ BitVec 32)) SeekEntryResult!9782)

(assert (=> b!1044622 (= lt!460364 (seekEntry!0 key!909 (_keys!11674 thiss!1427) (mask!30525 thiss!1427)))))

(declare-fun b!1044623 () Bool)

(assert (=> b!1044623 (= e!591930 (not e!591935))))

(declare-fun res!695598 () Bool)

(assert (=> b!1044623 (=> res!695598 e!591935)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044623 (= res!695598 (not (validMask!0 (mask!30525 thiss!1427))))))

(declare-fun lt!460359 () array!65821)

(declare-fun arrayContainsKey!0 (array!65821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044623 (not (arrayContainsKey!0 lt!460359 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34075 0))(
  ( (Unit!34076) )
))
(declare-fun lt!460362 () Unit!34075)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65821 (_ BitVec 32) (_ BitVec 64)) Unit!34075)

(assert (=> b!1044623 (= lt!460362 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11674 thiss!1427) (index!41500 lt!460364) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65821 (_ BitVec 32)) Bool)

(assert (=> b!1044623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460359 (mask!30525 thiss!1427))))

(declare-fun lt!460365 () Unit!34075)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65821 (_ BitVec 32) (_ BitVec 32)) Unit!34075)

(assert (=> b!1044623 (= lt!460365 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11674 thiss!1427) (index!41500 lt!460364) (mask!30525 thiss!1427)))))

(assert (=> b!1044623 (arrayNoDuplicates!0 lt!460359 #b00000000000000000000000000000000 Nil!21973)))

(declare-fun lt!460361 () Unit!34075)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65821 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21976) Unit!34075)

(assert (=> b!1044623 (= lt!460361 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11674 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41500 lt!460364) #b00000000000000000000000000000000 Nil!21973))))

(declare-fun arrayCountValidKeys!0 (array!65821 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044623 (= (arrayCountValidKeys!0 lt!460359 #b00000000000000000000000000000000 (size!32193 (_keys!11674 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11674 thiss!1427) #b00000000000000000000000000000000 (size!32193 (_keys!11674 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044623 (= lt!460359 (array!65822 (store (arr!31657 (_keys!11674 thiss!1427)) (index!41500 lt!460364) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32193 (_keys!11674 thiss!1427))))))

(declare-fun lt!460363 () Unit!34075)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65821 (_ BitVec 32) (_ BitVec 64)) Unit!34075)

(assert (=> b!1044623 (= lt!460363 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11674 thiss!1427) (index!41500 lt!460364) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!695596 () Bool)

(assert (=> start!91882 (=> (not res!695596) (not e!591933))))

(declare-fun valid!2256 (LongMapFixedSize!5992) Bool)

(assert (=> start!91882 (= res!695596 (valid!2256 thiss!1427))))

(assert (=> start!91882 e!591933))

(assert (=> start!91882 e!591932))

(assert (=> start!91882 true))

(declare-fun b!1044624 () Bool)

(declare-fun mapRes!38828 () Bool)

(assert (=> b!1044624 (= e!591931 (and e!591934 mapRes!38828))))

(declare-fun condMapEmpty!38828 () Bool)

(declare-fun mapDefault!38828 () ValueCell!11699)

(assert (=> b!1044624 (= condMapEmpty!38828 (= (arr!31658 (_values!6401 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11699)) mapDefault!38828)))))

(declare-fun b!1044625 () Bool)

(declare-fun res!695597 () Bool)

(assert (=> b!1044625 (=> res!695597 e!591935)))

(assert (=> b!1044625 (= res!695597 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11674 thiss!1427) (mask!30525 thiss!1427))))))

(declare-fun mapNonEmpty!38828 () Bool)

(declare-fun tp!74492 () Bool)

(declare-fun e!591929 () Bool)

(assert (=> mapNonEmpty!38828 (= mapRes!38828 (and tp!74492 e!591929))))

(declare-fun mapKey!38828 () (_ BitVec 32))

(declare-fun mapValue!38828 () ValueCell!11699)

(declare-fun mapRest!38828 () (Array (_ BitVec 32) ValueCell!11699))

(assert (=> mapNonEmpty!38828 (= (arr!31658 (_values!6401 thiss!1427)) (store mapRest!38828 mapKey!38828 mapValue!38828))))

(declare-fun b!1044626 () Bool)

(assert (=> b!1044626 (= e!591929 tp_is_empty!24805)))

(declare-fun b!1044627 () Bool)

(declare-fun res!695595 () Bool)

(assert (=> b!1044627 (=> res!695595 e!591935)))

(assert (=> b!1044627 (= res!695595 (or (not (= (size!32194 (_values!6401 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30525 thiss!1427)))) (not (= (size!32193 (_keys!11674 thiss!1427)) (size!32194 (_values!6401 thiss!1427)))) (bvslt (mask!30525 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6106 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6106 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38828 () Bool)

(assert (=> mapIsEmpty!38828 mapRes!38828))

(assert (= (and start!91882 res!695596) b!1044621))

(assert (= (and b!1044621 res!695594) b!1044622))

(assert (= (and b!1044622 res!695593) b!1044623))

(assert (= (and b!1044623 (not res!695598)) b!1044627))

(assert (= (and b!1044627 (not res!695595)) b!1044625))

(assert (= (and b!1044625 (not res!695597)) b!1044618))

(assert (= (and b!1044624 condMapEmpty!38828) mapIsEmpty!38828))

(assert (= (and b!1044624 (not condMapEmpty!38828)) mapNonEmpty!38828))

(assert (= (and mapNonEmpty!38828 ((_ is ValueCellFull!11699) mapValue!38828)) b!1044626))

(assert (= (and b!1044624 ((_ is ValueCellFull!11699) mapDefault!38828)) b!1044619))

(assert (= b!1044620 b!1044624))

(assert (= start!91882 b!1044620))

(declare-fun m!964147 () Bool)

(assert (=> b!1044618 m!964147))

(declare-fun m!964149 () Bool)

(assert (=> b!1044622 m!964149))

(declare-fun m!964151 () Bool)

(assert (=> b!1044623 m!964151))

(declare-fun m!964153 () Bool)

(assert (=> b!1044623 m!964153))

(declare-fun m!964155 () Bool)

(assert (=> b!1044623 m!964155))

(declare-fun m!964157 () Bool)

(assert (=> b!1044623 m!964157))

(declare-fun m!964159 () Bool)

(assert (=> b!1044623 m!964159))

(declare-fun m!964161 () Bool)

(assert (=> b!1044623 m!964161))

(declare-fun m!964163 () Bool)

(assert (=> b!1044623 m!964163))

(declare-fun m!964165 () Bool)

(assert (=> b!1044623 m!964165))

(declare-fun m!964167 () Bool)

(assert (=> b!1044623 m!964167))

(declare-fun m!964169 () Bool)

(assert (=> b!1044623 m!964169))

(declare-fun m!964171 () Bool)

(assert (=> b!1044623 m!964171))

(declare-fun m!964173 () Bool)

(assert (=> b!1044620 m!964173))

(declare-fun m!964175 () Bool)

(assert (=> b!1044620 m!964175))

(declare-fun m!964177 () Bool)

(assert (=> b!1044625 m!964177))

(declare-fun m!964179 () Bool)

(assert (=> mapNonEmpty!38828 m!964179))

(declare-fun m!964181 () Bool)

(assert (=> start!91882 m!964181))

(check-sat (not b!1044620) b_and!33627 (not start!91882) (not b!1044625) (not b!1044618) (not mapNonEmpty!38828) (not b!1044623) (not b_next!21085) tp_is_empty!24805 (not b!1044622))
(check-sat b_and!33627 (not b_next!21085))
