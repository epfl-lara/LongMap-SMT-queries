; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!91652 () Bool)

(assert start!91652)

(declare-fun b!1043243 () Bool)

(declare-fun b_free!21091 () Bool)

(declare-fun b_next!21091 () Bool)

(assert (=> b!1043243 (= b_free!21091 (not b_next!21091))))

(declare-fun tp!74511 () Bool)

(declare-fun b_and!33597 () Bool)

(assert (=> b!1043243 (= tp!74511 b_and!33597)))

(declare-fun e!591067 () Bool)

(declare-datatypes ((V!37955 0))(
  ( (V!37956 (val!12456 Int)) )
))
(declare-datatypes ((ValueCell!11702 0))(
  ( (ValueCellFull!11702 (v!15046 V!37955)) (EmptyCell!11702) )
))
(declare-datatypes ((array!65723 0))(
  ( (array!65724 (arr!31614 (Array (_ BitVec 32) (_ BitVec 64))) (size!32151 (_ BitVec 32))) )
))
(declare-datatypes ((array!65725 0))(
  ( (array!65726 (arr!31615 (Array (_ BitVec 32) ValueCell!11702)) (size!32152 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5998 0))(
  ( (LongMapFixedSize!5999 (defaultEntry!6381 Int) (mask!30465 (_ BitVec 32)) (extraKeys!6109 (_ BitVec 32)) (zeroValue!6215 V!37955) (minValue!6215 V!37955) (_size!3054 (_ BitVec 32)) (_keys!11635 array!65723) (_values!6404 array!65725) (_vacant!3054 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5998)

(declare-fun e!591072 () Bool)

(declare-fun tp_is_empty!24811 () Bool)

(declare-fun array_inv!24431 (array!65723) Bool)

(declare-fun array_inv!24432 (array!65725) Bool)

(assert (=> b!1043243 (= e!591067 (and tp!74511 tp_is_empty!24811 (array_inv!24431 (_keys!11635 thiss!1427)) (array_inv!24432 (_values!6404 thiss!1427)) e!591072))))

(declare-fun b!1043244 () Bool)

(declare-fun res!695071 () Bool)

(declare-fun e!591068 () Bool)

(assert (=> b!1043244 (=> (not res!695071) (not e!591068))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1043244 (= res!695071 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043245 () Bool)

(declare-fun e!591070 () Bool)

(assert (=> b!1043245 (= e!591068 e!591070)))

(declare-fun res!695075 () Bool)

(assert (=> b!1043245 (=> (not res!695075) (not e!591070))))

(declare-datatypes ((SeekEntryResult!9829 0))(
  ( (MissingZero!9829 (index!41687 (_ BitVec 32))) (Found!9829 (index!41688 (_ BitVec 32))) (Intermediate!9829 (undefined!10641 Bool) (index!41689 (_ BitVec 32)) (x!93150 (_ BitVec 32))) (Undefined!9829) (MissingVacant!9829 (index!41690 (_ BitVec 32))) )
))
(declare-fun lt!459708 () SeekEntryResult!9829)

(get-info :version)

(assert (=> b!1043245 (= res!695075 ((_ is Found!9829) lt!459708))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65723 (_ BitVec 32)) SeekEntryResult!9829)

(assert (=> b!1043245 (= lt!459708 (seekEntry!0 key!909 (_keys!11635 thiss!1427) (mask!30465 thiss!1427)))))

(declare-fun mapIsEmpty!38837 () Bool)

(declare-fun mapRes!38837 () Bool)

(assert (=> mapIsEmpty!38837 mapRes!38837))

(declare-fun b!1043246 () Bool)

(declare-fun e!591074 () Bool)

(assert (=> b!1043246 (= e!591074 tp_is_empty!24811)))

(declare-fun b!1043247 () Bool)

(declare-fun e!591073 () Bool)

(assert (=> b!1043247 (= e!591073 tp_is_empty!24811)))

(declare-fun b!1043248 () Bool)

(declare-fun e!591069 () Bool)

(assert (=> b!1043248 (= e!591069 true)))

(declare-fun lt!459713 () Bool)

(declare-datatypes ((List!22025 0))(
  ( (Nil!22022) (Cons!22021 (h!23229 (_ BitVec 64)) (t!31230 List!22025)) )
))
(declare-fun arrayNoDuplicates!0 (array!65723 (_ BitVec 32) List!22025) Bool)

(assert (=> b!1043248 (= lt!459713 (arrayNoDuplicates!0 (_keys!11635 thiss!1427) #b00000000000000000000000000000000 Nil!22022))))

(declare-fun b!1043249 () Bool)

(assert (=> b!1043249 (= e!591070 (not e!591069))))

(declare-fun res!695070 () Bool)

(assert (=> b!1043249 (=> res!695070 e!591069)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043249 (= res!695070 (not (validMask!0 (mask!30465 thiss!1427))))))

(declare-fun lt!459711 () array!65723)

(declare-fun arrayContainsKey!0 (array!65723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043249 (not (arrayContainsKey!0 lt!459711 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33955 0))(
  ( (Unit!33956) )
))
(declare-fun lt!459709 () Unit!33955)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65723 (_ BitVec 32) (_ BitVec 64)) Unit!33955)

(assert (=> b!1043249 (= lt!459709 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11635 thiss!1427) (index!41688 lt!459708) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65723 (_ BitVec 32)) Bool)

(assert (=> b!1043249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459711 (mask!30465 thiss!1427))))

(declare-fun lt!459712 () Unit!33955)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65723 (_ BitVec 32) (_ BitVec 32)) Unit!33955)

(assert (=> b!1043249 (= lt!459712 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11635 thiss!1427) (index!41688 lt!459708) (mask!30465 thiss!1427)))))

(assert (=> b!1043249 (arrayNoDuplicates!0 lt!459711 #b00000000000000000000000000000000 Nil!22022)))

(declare-fun lt!459710 () Unit!33955)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65723 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22025) Unit!33955)

(assert (=> b!1043249 (= lt!459710 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11635 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41688 lt!459708) #b00000000000000000000000000000000 Nil!22022))))

(declare-fun arrayCountValidKeys!0 (array!65723 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043249 (= (arrayCountValidKeys!0 lt!459711 #b00000000000000000000000000000000 (size!32151 (_keys!11635 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11635 thiss!1427) #b00000000000000000000000000000000 (size!32151 (_keys!11635 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043249 (= lt!459711 (array!65724 (store (arr!31614 (_keys!11635 thiss!1427)) (index!41688 lt!459708) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32151 (_keys!11635 thiss!1427))))))

(declare-fun lt!459707 () Unit!33955)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65723 (_ BitVec 32) (_ BitVec 64)) Unit!33955)

(assert (=> b!1043249 (= lt!459707 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11635 thiss!1427) (index!41688 lt!459708) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043250 () Bool)

(declare-fun res!695072 () Bool)

(assert (=> b!1043250 (=> res!695072 e!591069)))

(assert (=> b!1043250 (= res!695072 (or (not (= (size!32152 (_values!6404 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30465 thiss!1427)))) (not (= (size!32151 (_keys!11635 thiss!1427)) (size!32152 (_values!6404 thiss!1427)))) (bvslt (mask!30465 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6109 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6109 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!38837 () Bool)

(declare-fun tp!74510 () Bool)

(assert (=> mapNonEmpty!38837 (= mapRes!38837 (and tp!74510 e!591073))))

(declare-fun mapRest!38837 () (Array (_ BitVec 32) ValueCell!11702))

(declare-fun mapValue!38837 () ValueCell!11702)

(declare-fun mapKey!38837 () (_ BitVec 32))

(assert (=> mapNonEmpty!38837 (= (arr!31615 (_values!6404 thiss!1427)) (store mapRest!38837 mapKey!38837 mapValue!38837))))

(declare-fun b!1043251 () Bool)

(declare-fun res!695073 () Bool)

(assert (=> b!1043251 (=> res!695073 e!591069)))

(assert (=> b!1043251 (= res!695073 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11635 thiss!1427) (mask!30465 thiss!1427))))))

(declare-fun b!1043242 () Bool)

(assert (=> b!1043242 (= e!591072 (and e!591074 mapRes!38837))))

(declare-fun condMapEmpty!38837 () Bool)

(declare-fun mapDefault!38837 () ValueCell!11702)

(assert (=> b!1043242 (= condMapEmpty!38837 (= (arr!31615 (_values!6404 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11702)) mapDefault!38837)))))

(declare-fun res!695074 () Bool)

(assert (=> start!91652 (=> (not res!695074) (not e!591068))))

(declare-fun valid!2245 (LongMapFixedSize!5998) Bool)

(assert (=> start!91652 (= res!695074 (valid!2245 thiss!1427))))

(assert (=> start!91652 e!591068))

(assert (=> start!91652 e!591067))

(assert (=> start!91652 true))

(assert (= (and start!91652 res!695074) b!1043244))

(assert (= (and b!1043244 res!695071) b!1043245))

(assert (= (and b!1043245 res!695075) b!1043249))

(assert (= (and b!1043249 (not res!695070)) b!1043250))

(assert (= (and b!1043250 (not res!695072)) b!1043251))

(assert (= (and b!1043251 (not res!695073)) b!1043248))

(assert (= (and b!1043242 condMapEmpty!38837) mapIsEmpty!38837))

(assert (= (and b!1043242 (not condMapEmpty!38837)) mapNonEmpty!38837))

(assert (= (and mapNonEmpty!38837 ((_ is ValueCellFull!11702) mapValue!38837)) b!1043247))

(assert (= (and b!1043242 ((_ is ValueCellFull!11702) mapDefault!38837)) b!1043246))

(assert (= b!1043243 b!1043242))

(assert (= start!91652 b!1043243))

(declare-fun m!961971 () Bool)

(assert (=> b!1043249 m!961971))

(declare-fun m!961973 () Bool)

(assert (=> b!1043249 m!961973))

(declare-fun m!961975 () Bool)

(assert (=> b!1043249 m!961975))

(declare-fun m!961977 () Bool)

(assert (=> b!1043249 m!961977))

(declare-fun m!961979 () Bool)

(assert (=> b!1043249 m!961979))

(declare-fun m!961981 () Bool)

(assert (=> b!1043249 m!961981))

(declare-fun m!961983 () Bool)

(assert (=> b!1043249 m!961983))

(declare-fun m!961985 () Bool)

(assert (=> b!1043249 m!961985))

(declare-fun m!961987 () Bool)

(assert (=> b!1043249 m!961987))

(declare-fun m!961989 () Bool)

(assert (=> b!1043249 m!961989))

(declare-fun m!961991 () Bool)

(assert (=> b!1043249 m!961991))

(declare-fun m!961993 () Bool)

(assert (=> b!1043248 m!961993))

(declare-fun m!961995 () Bool)

(assert (=> mapNonEmpty!38837 m!961995))

(declare-fun m!961997 () Bool)

(assert (=> b!1043251 m!961997))

(declare-fun m!961999 () Bool)

(assert (=> b!1043245 m!961999))

(declare-fun m!962001 () Bool)

(assert (=> b!1043243 m!962001))

(declare-fun m!962003 () Bool)

(assert (=> b!1043243 m!962003))

(declare-fun m!962005 () Bool)

(assert (=> start!91652 m!962005))

(check-sat (not b!1043251) (not b!1043245) b_and!33597 (not b_next!21091) (not b!1043249) (not start!91652) (not b!1043243) (not b!1043248) (not mapNonEmpty!38837) tp_is_empty!24811)
(check-sat b_and!33597 (not b_next!21091))
