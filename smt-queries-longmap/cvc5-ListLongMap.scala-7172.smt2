; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91648 () Bool)

(assert start!91648)

(declare-fun b!1043308 () Bool)

(declare-fun b_free!21085 () Bool)

(declare-fun b_next!21085 () Bool)

(assert (=> b!1043308 (= b_free!21085 (not b_next!21085))))

(declare-fun tp!74492 () Bool)

(declare-fun b_and!33617 () Bool)

(assert (=> b!1043308 (= tp!74492 b_and!33617)))

(declare-fun b!1043303 () Bool)

(declare-fun e!591090 () Bool)

(declare-fun tp_is_empty!24805 () Bool)

(assert (=> b!1043303 (= e!591090 tp_is_empty!24805)))

(declare-fun b!1043304 () Bool)

(declare-fun e!591087 () Bool)

(declare-fun e!591093 () Bool)

(assert (=> b!1043304 (= e!591087 (not e!591093))))

(declare-fun res!695085 () Bool)

(assert (=> b!1043304 (=> res!695085 e!591093)))

(declare-datatypes ((V!37947 0))(
  ( (V!37948 (val!12453 Int)) )
))
(declare-datatypes ((ValueCell!11699 0))(
  ( (ValueCellFull!11699 (v!15044 V!37947)) (EmptyCell!11699) )
))
(declare-datatypes ((array!65772 0))(
  ( (array!65773 (arr!31639 (Array (_ BitVec 32) (_ BitVec 64))) (size!32174 (_ BitVec 32))) )
))
(declare-datatypes ((array!65774 0))(
  ( (array!65775 (arr!31640 (Array (_ BitVec 32) ValueCell!11699)) (size!32175 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5992 0))(
  ( (LongMapFixedSize!5993 (defaultEntry!6378 Int) (mask!30465 (_ BitVec 32)) (extraKeys!6106 (_ BitVec 32)) (zeroValue!6212 V!37947) (minValue!6212 V!37947) (_size!3051 (_ BitVec 32)) (_keys!11636 array!65772) (_values!6401 array!65774) (_vacant!3051 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5992)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043304 (= res!695085 (not (validMask!0 (mask!30465 thiss!1427))))))

(declare-fun lt!459850 () array!65772)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043304 (not (arrayContainsKey!0 lt!459850 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9826 0))(
  ( (MissingZero!9826 (index!41675 (_ BitVec 32))) (Found!9826 (index!41676 (_ BitVec 32))) (Intermediate!9826 (undefined!10638 Bool) (index!41677 (_ BitVec 32)) (x!93142 (_ BitVec 32))) (Undefined!9826) (MissingVacant!9826 (index!41678 (_ BitVec 32))) )
))
(declare-fun lt!459849 () SeekEntryResult!9826)

(declare-datatypes ((Unit!34061 0))(
  ( (Unit!34062) )
))
(declare-fun lt!459845 () Unit!34061)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65772 (_ BitVec 32) (_ BitVec 64)) Unit!34061)

(assert (=> b!1043304 (= lt!459845 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11636 thiss!1427) (index!41676 lt!459849) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65772 (_ BitVec 32)) Bool)

(assert (=> b!1043304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459850 (mask!30465 thiss!1427))))

(declare-fun lt!459846 () Unit!34061)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65772 (_ BitVec 32) (_ BitVec 32)) Unit!34061)

(assert (=> b!1043304 (= lt!459846 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11636 thiss!1427) (index!41676 lt!459849) (mask!30465 thiss!1427)))))

(declare-datatypes ((List!21984 0))(
  ( (Nil!21981) (Cons!21980 (h!23188 (_ BitVec 64)) (t!31198 List!21984)) )
))
(declare-fun arrayNoDuplicates!0 (array!65772 (_ BitVec 32) List!21984) Bool)

(assert (=> b!1043304 (arrayNoDuplicates!0 lt!459850 #b00000000000000000000000000000000 Nil!21981)))

(declare-fun lt!459847 () Unit!34061)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65772 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21984) Unit!34061)

(assert (=> b!1043304 (= lt!459847 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11636 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41676 lt!459849) #b00000000000000000000000000000000 Nil!21981))))

(declare-fun arrayCountValidKeys!0 (array!65772 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043304 (= (arrayCountValidKeys!0 lt!459850 #b00000000000000000000000000000000 (size!32174 (_keys!11636 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11636 thiss!1427) #b00000000000000000000000000000000 (size!32174 (_keys!11636 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043304 (= lt!459850 (array!65773 (store (arr!31639 (_keys!11636 thiss!1427)) (index!41676 lt!459849) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32174 (_keys!11636 thiss!1427))))))

(declare-fun lt!459844 () Unit!34061)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65772 (_ BitVec 32) (_ BitVec 64)) Unit!34061)

(assert (=> b!1043304 (= lt!459844 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11636 thiss!1427) (index!41676 lt!459849) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38828 () Bool)

(declare-fun mapRes!38828 () Bool)

(assert (=> mapIsEmpty!38828 mapRes!38828))

(declare-fun b!1043305 () Bool)

(declare-fun res!695087 () Bool)

(declare-fun e!591089 () Bool)

(assert (=> b!1043305 (=> (not res!695087) (not e!591089))))

(assert (=> b!1043305 (= res!695087 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1043306 () Bool)

(declare-fun res!695088 () Bool)

(assert (=> b!1043306 (=> res!695088 e!591093)))

(assert (=> b!1043306 (= res!695088 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11636 thiss!1427) (mask!30465 thiss!1427))))))

(declare-fun b!1043307 () Bool)

(declare-fun e!591092 () Bool)

(declare-fun e!591086 () Bool)

(assert (=> b!1043307 (= e!591092 (and e!591086 mapRes!38828))))

(declare-fun condMapEmpty!38828 () Bool)

(declare-fun mapDefault!38828 () ValueCell!11699)

