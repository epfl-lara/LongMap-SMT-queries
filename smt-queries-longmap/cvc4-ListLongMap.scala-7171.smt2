; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91618 () Bool)

(assert start!91618)

(declare-fun b!1043158 () Bool)

(declare-fun b_free!21083 () Bool)

(declare-fun b_next!21083 () Bool)

(assert (=> b!1043158 (= b_free!21083 (not b_next!21083))))

(declare-fun tp!74483 () Bool)

(declare-fun b_and!33615 () Bool)

(assert (=> b!1043158 (= tp!74483 b_and!33615)))

(declare-fun b!1043156 () Bool)

(declare-fun res!695009 () Bool)

(declare-fun e!590992 () Bool)

(assert (=> b!1043156 (=> res!695009 e!590992)))

(declare-datatypes ((V!37943 0))(
  ( (V!37944 (val!12452 Int)) )
))
(declare-datatypes ((ValueCell!11698 0))(
  ( (ValueCellFull!11698 (v!15043 V!37943)) (EmptyCell!11698) )
))
(declare-datatypes ((array!65766 0))(
  ( (array!65767 (arr!31637 (Array (_ BitVec 32) (_ BitVec 64))) (size!32172 (_ BitVec 32))) )
))
(declare-datatypes ((array!65768 0))(
  ( (array!65769 (arr!31638 (Array (_ BitVec 32) ValueCell!11698)) (size!32173 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5990 0))(
  ( (LongMapFixedSize!5991 (defaultEntry!6377 Int) (mask!30458 (_ BitVec 32)) (extraKeys!6105 (_ BitVec 32)) (zeroValue!6211 V!37943) (minValue!6211 V!37943) (_size!3050 (_ BitVec 32)) (_keys!11633 array!65766) (_values!6400 array!65768) (_vacant!3050 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5990)

(declare-datatypes ((List!21983 0))(
  ( (Nil!21980) (Cons!21979 (h!23187 (_ BitVec 64)) (t!31197 List!21983)) )
))
(declare-fun arrayNoDuplicates!0 (array!65766 (_ BitVec 32) List!21983) Bool)

(assert (=> b!1043156 (= res!695009 (not (arrayNoDuplicates!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 Nil!21980)))))

(declare-fun res!695007 () Bool)

(declare-fun e!590987 () Bool)

(assert (=> start!91618 (=> (not res!695007) (not e!590987))))

(declare-fun valid!2249 (LongMapFixedSize!5990) Bool)

(assert (=> start!91618 (= res!695007 (valid!2249 thiss!1427))))

(assert (=> start!91618 e!590987))

(declare-fun e!590990 () Bool)

(assert (=> start!91618 e!590990))

(assert (=> start!91618 true))

(declare-fun b!1043157 () Bool)

(declare-fun e!590994 () Bool)

(assert (=> b!1043157 (= e!590994 (not e!590992))))

(declare-fun res!695012 () Bool)

(assert (=> b!1043157 (=> res!695012 e!590992)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043157 (= res!695012 (not (validMask!0 (mask!30458 thiss!1427))))))

(declare-fun lt!459789 () array!65766)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043157 (not (arrayContainsKey!0 lt!459789 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34059 0))(
  ( (Unit!34060) )
))
(declare-fun lt!459788 () Unit!34059)

(declare-datatypes ((SeekEntryResult!9825 0))(
  ( (MissingZero!9825 (index!41671 (_ BitVec 32))) (Found!9825 (index!41672 (_ BitVec 32))) (Intermediate!9825 (undefined!10637 Bool) (index!41673 (_ BitVec 32)) (x!93125 (_ BitVec 32))) (Undefined!9825) (MissingVacant!9825 (index!41674 (_ BitVec 32))) )
))
(declare-fun lt!459785 () SeekEntryResult!9825)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65766 (_ BitVec 32) (_ BitVec 64)) Unit!34059)

(assert (=> b!1043157 (= lt!459788 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11633 thiss!1427) (index!41672 lt!459785) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65766 (_ BitVec 32)) Bool)

(assert (=> b!1043157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459789 (mask!30458 thiss!1427))))

(declare-fun lt!459786 () Unit!34059)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65766 (_ BitVec 32) (_ BitVec 32)) Unit!34059)

(assert (=> b!1043157 (= lt!459786 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11633 thiss!1427) (index!41672 lt!459785) (mask!30458 thiss!1427)))))

(assert (=> b!1043157 (arrayNoDuplicates!0 lt!459789 #b00000000000000000000000000000000 Nil!21980)))

(declare-fun lt!459784 () Unit!34059)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21983) Unit!34059)

(assert (=> b!1043157 (= lt!459784 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11633 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41672 lt!459785) #b00000000000000000000000000000000 Nil!21980))))

(declare-fun arrayCountValidKeys!0 (array!65766 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043157 (= (arrayCountValidKeys!0 lt!459789 #b00000000000000000000000000000000 (size!32172 (_keys!11633 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11633 thiss!1427) #b00000000000000000000000000000000 (size!32172 (_keys!11633 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043157 (= lt!459789 (array!65767 (store (arr!31637 (_keys!11633 thiss!1427)) (index!41672 lt!459785) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32172 (_keys!11633 thiss!1427))))))

(declare-fun lt!459787 () Unit!34059)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65766 (_ BitVec 32) (_ BitVec 64)) Unit!34059)

(assert (=> b!1043157 (= lt!459787 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11633 thiss!1427) (index!41672 lt!459785) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590993 () Bool)

(declare-fun tp_is_empty!24803 () Bool)

(declare-fun array_inv!24443 (array!65766) Bool)

(declare-fun array_inv!24444 (array!65768) Bool)

(assert (=> b!1043158 (= e!590990 (and tp!74483 tp_is_empty!24803 (array_inv!24443 (_keys!11633 thiss!1427)) (array_inv!24444 (_values!6400 thiss!1427)) e!590993))))

(declare-fun b!1043159 () Bool)

(assert (=> b!1043159 (= e!590992 (= (select (arr!31637 (_keys!11633 thiss!1427)) (index!41672 lt!459785)) key!909))))

(declare-fun mapNonEmpty!38822 () Bool)

(declare-fun mapRes!38822 () Bool)

(declare-fun tp!74484 () Bool)

(declare-fun e!590989 () Bool)

(assert (=> mapNonEmpty!38822 (= mapRes!38822 (and tp!74484 e!590989))))

(declare-fun mapKey!38822 () (_ BitVec 32))

(declare-fun mapRest!38822 () (Array (_ BitVec 32) ValueCell!11698))

(declare-fun mapValue!38822 () ValueCell!11698)

(assert (=> mapNonEmpty!38822 (= (arr!31638 (_values!6400 thiss!1427)) (store mapRest!38822 mapKey!38822 mapValue!38822))))

(declare-fun b!1043160 () Bool)

(declare-fun e!590988 () Bool)

(assert (=> b!1043160 (= e!590993 (and e!590988 mapRes!38822))))

(declare-fun condMapEmpty!38822 () Bool)

(declare-fun mapDefault!38822 () ValueCell!11698)

