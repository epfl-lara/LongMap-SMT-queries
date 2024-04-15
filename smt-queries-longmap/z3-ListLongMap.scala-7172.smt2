; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91646 () Bool)

(assert start!91646)

(declare-fun b!1043160 () Bool)

(declare-fun b_free!21085 () Bool)

(declare-fun b_next!21085 () Bool)

(assert (=> b!1043160 (= b_free!21085 (not b_next!21085))))

(declare-fun tp!74493 () Bool)

(declare-fun b_and!33591 () Bool)

(assert (=> b!1043160 (= tp!74493 b_and!33591)))

(declare-fun b!1043152 () Bool)

(declare-fun e!590995 () Bool)

(declare-fun tp_is_empty!24805 () Bool)

(assert (=> b!1043152 (= e!590995 tp_is_empty!24805)))

(declare-fun mapNonEmpty!38828 () Bool)

(declare-fun mapRes!38828 () Bool)

(declare-fun tp!74492 () Bool)

(declare-fun e!591001 () Bool)

(assert (=> mapNonEmpty!38828 (= mapRes!38828 (and tp!74492 e!591001))))

(declare-datatypes ((V!37947 0))(
  ( (V!37948 (val!12453 Int)) )
))
(declare-datatypes ((ValueCell!11699 0))(
  ( (ValueCellFull!11699 (v!15043 V!37947)) (EmptyCell!11699) )
))
(declare-datatypes ((array!65711 0))(
  ( (array!65712 (arr!31608 (Array (_ BitVec 32) (_ BitVec 64))) (size!32145 (_ BitVec 32))) )
))
(declare-datatypes ((array!65713 0))(
  ( (array!65714 (arr!31609 (Array (_ BitVec 32) ValueCell!11699)) (size!32146 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5992 0))(
  ( (LongMapFixedSize!5993 (defaultEntry!6378 Int) (mask!30460 (_ BitVec 32)) (extraKeys!6106 (_ BitVec 32)) (zeroValue!6212 V!37947) (minValue!6212 V!37947) (_size!3051 (_ BitVec 32)) (_keys!11632 array!65711) (_values!6401 array!65713) (_vacant!3051 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5992)

(declare-fun mapKey!38828 () (_ BitVec 32))

(declare-fun mapRest!38828 () (Array (_ BitVec 32) ValueCell!11699))

(declare-fun mapValue!38828 () ValueCell!11699)

(assert (=> mapNonEmpty!38828 (= (arr!31609 (_values!6401 thiss!1427)) (store mapRest!38828 mapKey!38828 mapValue!38828))))

(declare-fun res!695021 () Bool)

(declare-fun e!590997 () Bool)

(assert (=> start!91646 (=> (not res!695021) (not e!590997))))

(declare-fun valid!2242 (LongMapFixedSize!5992) Bool)

(assert (=> start!91646 (= res!695021 (valid!2242 thiss!1427))))

(assert (=> start!91646 e!590997))

(declare-fun e!591000 () Bool)

(assert (=> start!91646 e!591000))

(assert (=> start!91646 true))

(declare-fun mapIsEmpty!38828 () Bool)

(assert (=> mapIsEmpty!38828 mapRes!38828))

(declare-fun b!1043153 () Bool)

(declare-fun res!695017 () Bool)

(assert (=> b!1043153 (=> (not res!695017) (not e!590997))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043153 (= res!695017 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043154 () Bool)

(declare-fun e!590996 () Bool)

(declare-fun e!591002 () Bool)

(assert (=> b!1043154 (= e!590996 (not e!591002))))

(declare-fun res!695018 () Bool)

(assert (=> b!1043154 (=> res!695018 e!591002)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043154 (= res!695018 (not (validMask!0 (mask!30460 thiss!1427))))))

(declare-fun lt!459644 () array!65711)

(declare-fun arrayContainsKey!0 (array!65711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043154 (not (arrayContainsKey!0 lt!459644 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33949 0))(
  ( (Unit!33950) )
))
(declare-fun lt!459646 () Unit!33949)

(declare-datatypes ((SeekEntryResult!9826 0))(
  ( (MissingZero!9826 (index!41675 (_ BitVec 32))) (Found!9826 (index!41676 (_ BitVec 32))) (Intermediate!9826 (undefined!10638 Bool) (index!41677 (_ BitVec 32)) (x!93139 (_ BitVec 32))) (Undefined!9826) (MissingVacant!9826 (index!41678 (_ BitVec 32))) )
))
(declare-fun lt!459648 () SeekEntryResult!9826)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65711 (_ BitVec 32) (_ BitVec 64)) Unit!33949)

(assert (=> b!1043154 (= lt!459646 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11632 thiss!1427) (index!41676 lt!459648) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65711 (_ BitVec 32)) Bool)

(assert (=> b!1043154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459644 (mask!30460 thiss!1427))))

(declare-fun lt!459645 () Unit!33949)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65711 (_ BitVec 32) (_ BitVec 32)) Unit!33949)

(assert (=> b!1043154 (= lt!459645 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11632 thiss!1427) (index!41676 lt!459648) (mask!30460 thiss!1427)))))

(declare-datatypes ((List!22022 0))(
  ( (Nil!22019) (Cons!22018 (h!23226 (_ BitVec 64)) (t!31227 List!22022)) )
))
(declare-fun arrayNoDuplicates!0 (array!65711 (_ BitVec 32) List!22022) Bool)

(assert (=> b!1043154 (arrayNoDuplicates!0 lt!459644 #b00000000000000000000000000000000 Nil!22019)))

(declare-fun lt!459650 () Unit!33949)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65711 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22022) Unit!33949)

(assert (=> b!1043154 (= lt!459650 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11632 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41676 lt!459648) #b00000000000000000000000000000000 Nil!22019))))

(declare-fun arrayCountValidKeys!0 (array!65711 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043154 (= (arrayCountValidKeys!0 lt!459644 #b00000000000000000000000000000000 (size!32145 (_keys!11632 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 (size!32145 (_keys!11632 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043154 (= lt!459644 (array!65712 (store (arr!31608 (_keys!11632 thiss!1427)) (index!41676 lt!459648) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32145 (_keys!11632 thiss!1427))))))

(declare-fun lt!459647 () Unit!33949)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65711 (_ BitVec 32) (_ BitVec 64)) Unit!33949)

(assert (=> b!1043154 (= lt!459647 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11632 thiss!1427) (index!41676 lt!459648) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043155 () Bool)

(declare-fun res!695020 () Bool)

(assert (=> b!1043155 (=> res!695020 e!591002)))

(assert (=> b!1043155 (= res!695020 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11632 thiss!1427) (mask!30460 thiss!1427))))))

(declare-fun b!1043156 () Bool)

(declare-fun res!695016 () Bool)

(assert (=> b!1043156 (=> res!695016 e!591002)))

(assert (=> b!1043156 (= res!695016 (or (not (= (size!32146 (_values!6401 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30460 thiss!1427)))) (not (= (size!32145 (_keys!11632 thiss!1427)) (size!32146 (_values!6401 thiss!1427)))) (bvslt (mask!30460 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6106 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6106 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1043157 () Bool)

(assert (=> b!1043157 (= e!591002 true)))

(declare-fun lt!459649 () Bool)

(assert (=> b!1043157 (= lt!459649 (arrayNoDuplicates!0 (_keys!11632 thiss!1427) #b00000000000000000000000000000000 Nil!22019))))

(declare-fun b!1043158 () Bool)

(assert (=> b!1043158 (= e!591001 tp_is_empty!24805)))

(declare-fun b!1043159 () Bool)

(declare-fun e!590999 () Bool)

(assert (=> b!1043159 (= e!590999 (and e!590995 mapRes!38828))))

(declare-fun condMapEmpty!38828 () Bool)

(declare-fun mapDefault!38828 () ValueCell!11699)

(assert (=> b!1043159 (= condMapEmpty!38828 (= (arr!31609 (_values!6401 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11699)) mapDefault!38828)))))

(declare-fun array_inv!24425 (array!65711) Bool)

(declare-fun array_inv!24426 (array!65713) Bool)

(assert (=> b!1043160 (= e!591000 (and tp!74493 tp_is_empty!24805 (array_inv!24425 (_keys!11632 thiss!1427)) (array_inv!24426 (_values!6401 thiss!1427)) e!590999))))

(declare-fun b!1043161 () Bool)

(assert (=> b!1043161 (= e!590997 e!590996)))

(declare-fun res!695019 () Bool)

(assert (=> b!1043161 (=> (not res!695019) (not e!590996))))

(get-info :version)

(assert (=> b!1043161 (= res!695019 ((_ is Found!9826) lt!459648))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65711 (_ BitVec 32)) SeekEntryResult!9826)

(assert (=> b!1043161 (= lt!459648 (seekEntry!0 key!909 (_keys!11632 thiss!1427) (mask!30460 thiss!1427)))))

(assert (= (and start!91646 res!695021) b!1043153))

(assert (= (and b!1043153 res!695017) b!1043161))

(assert (= (and b!1043161 res!695019) b!1043154))

(assert (= (and b!1043154 (not res!695018)) b!1043156))

(assert (= (and b!1043156 (not res!695016)) b!1043155))

(assert (= (and b!1043155 (not res!695020)) b!1043157))

(assert (= (and b!1043159 condMapEmpty!38828) mapIsEmpty!38828))

(assert (= (and b!1043159 (not condMapEmpty!38828)) mapNonEmpty!38828))

(assert (= (and mapNonEmpty!38828 ((_ is ValueCellFull!11699) mapValue!38828)) b!1043158))

(assert (= (and b!1043159 ((_ is ValueCellFull!11699) mapDefault!38828)) b!1043152))

(assert (= b!1043160 b!1043159))

(assert (= start!91646 b!1043160))

(declare-fun m!961863 () Bool)

(assert (=> b!1043157 m!961863))

(declare-fun m!961865 () Bool)

(assert (=> b!1043155 m!961865))

(declare-fun m!961867 () Bool)

(assert (=> b!1043154 m!961867))

(declare-fun m!961869 () Bool)

(assert (=> b!1043154 m!961869))

(declare-fun m!961871 () Bool)

(assert (=> b!1043154 m!961871))

(declare-fun m!961873 () Bool)

(assert (=> b!1043154 m!961873))

(declare-fun m!961875 () Bool)

(assert (=> b!1043154 m!961875))

(declare-fun m!961877 () Bool)

(assert (=> b!1043154 m!961877))

(declare-fun m!961879 () Bool)

(assert (=> b!1043154 m!961879))

(declare-fun m!961881 () Bool)

(assert (=> b!1043154 m!961881))

(declare-fun m!961883 () Bool)

(assert (=> b!1043154 m!961883))

(declare-fun m!961885 () Bool)

(assert (=> b!1043154 m!961885))

(declare-fun m!961887 () Bool)

(assert (=> b!1043154 m!961887))

(declare-fun m!961889 () Bool)

(assert (=> start!91646 m!961889))

(declare-fun m!961891 () Bool)

(assert (=> b!1043161 m!961891))

(declare-fun m!961893 () Bool)

(assert (=> mapNonEmpty!38828 m!961893))

(declare-fun m!961895 () Bool)

(assert (=> b!1043160 m!961895))

(declare-fun m!961897 () Bool)

(assert (=> b!1043160 m!961897))

(check-sat (not b!1043161) tp_is_empty!24805 (not b!1043160) (not b!1043157) (not start!91646) (not b!1043155) (not mapNonEmpty!38828) (not b!1043154) b_and!33591 (not b_next!21085))
(check-sat b_and!33591 (not b_next!21085))
