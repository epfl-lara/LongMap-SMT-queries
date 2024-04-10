; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91008 () Bool)

(assert start!91008)

(declare-fun b!1039468 () Bool)

(declare-fun b_free!20977 () Bool)

(declare-fun b_next!20977 () Bool)

(assert (=> b!1039468 (= b_free!20977 (not b_next!20977))))

(declare-fun tp!74110 () Bool)

(declare-fun b_and!33509 () Bool)

(assert (=> b!1039468 (= tp!74110 b_and!33509)))

(declare-fun b!1039460 () Bool)

(declare-fun e!588320 () Bool)

(declare-datatypes ((V!37803 0))(
  ( (V!37804 (val!12399 Int)) )
))
(declare-datatypes ((ValueCell!11645 0))(
  ( (ValueCellFull!11645 (v!14986 V!37803)) (EmptyCell!11645) )
))
(declare-datatypes ((array!65520 0))(
  ( (array!65521 (arr!31531 (Array (_ BitVec 32) (_ BitVec 64))) (size!32062 (_ BitVec 32))) )
))
(declare-datatypes ((array!65522 0))(
  ( (array!65523 (arr!31532 (Array (_ BitVec 32) ValueCell!11645)) (size!32063 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5884 0))(
  ( (LongMapFixedSize!5885 (defaultEntry!6324 Int) (mask!30290 (_ BitVec 32)) (extraKeys!6052 (_ BitVec 32)) (zeroValue!6158 V!37803) (minValue!6158 V!37803) (_size!2997 (_ BitVec 32)) (_keys!11534 array!65520) (_values!6347 array!65522) (_vacant!2997 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5884)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65520 (_ BitVec 32)) Bool)

(assert (=> b!1039460 (= e!588320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11534 thiss!1427) (mask!30290 thiss!1427)))))

(declare-fun res!693205 () Bool)

(declare-fun e!588316 () Bool)

(assert (=> start!91008 (=> (not res!693205) (not e!588316))))

(declare-fun valid!2210 (LongMapFixedSize!5884) Bool)

(assert (=> start!91008 (= res!693205 (valid!2210 thiss!1427))))

(assert (=> start!91008 e!588316))

(declare-fun e!588318 () Bool)

(assert (=> start!91008 e!588318))

(assert (=> start!91008 true))

(declare-fun b!1039461 () Bool)

(declare-fun e!588319 () Bool)

(assert (=> b!1039461 (= e!588319 (not e!588320))))

(declare-fun res!693202 () Bool)

(assert (=> b!1039461 (=> res!693202 e!588320)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039461 (= res!693202 (not (validMask!0 (mask!30290 thiss!1427))))))

(declare-fun lt!458101 () array!65520)

(declare-datatypes ((List!21947 0))(
  ( (Nil!21944) (Cons!21943 (h!23147 (_ BitVec 64)) (t!31161 List!21947)) )
))
(declare-fun arrayNoDuplicates!0 (array!65520 (_ BitVec 32) List!21947) Bool)

(assert (=> b!1039461 (arrayNoDuplicates!0 lt!458101 #b00000000000000000000000000000000 Nil!21944)))

(declare-datatypes ((Unit!33995 0))(
  ( (Unit!33996) )
))
(declare-fun lt!458104 () Unit!33995)

(declare-datatypes ((SeekEntryResult!9783 0))(
  ( (MissingZero!9783 (index!41503 (_ BitVec 32))) (Found!9783 (index!41504 (_ BitVec 32))) (Intermediate!9783 (undefined!10595 Bool) (index!41505 (_ BitVec 32)) (x!92775 (_ BitVec 32))) (Undefined!9783) (MissingVacant!9783 (index!41506 (_ BitVec 32))) )
))
(declare-fun lt!458102 () SeekEntryResult!9783)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21947) Unit!33995)

(assert (=> b!1039461 (= lt!458104 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11534 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41504 lt!458102) #b00000000000000000000000000000000 Nil!21944))))

(declare-fun arrayCountValidKeys!0 (array!65520 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039461 (= (arrayCountValidKeys!0 lt!458101 #b00000000000000000000000000000000 (size!32062 (_keys!11534 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11534 thiss!1427) #b00000000000000000000000000000000 (size!32062 (_keys!11534 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039461 (= lt!458101 (array!65521 (store (arr!31531 (_keys!11534 thiss!1427)) (index!41504 lt!458102) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32062 (_keys!11534 thiss!1427))))))

(declare-fun lt!458103 () Unit!33995)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65520 (_ BitVec 32) (_ BitVec 64)) Unit!33995)

(assert (=> b!1039461 (= lt!458103 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11534 thiss!1427) (index!41504 lt!458102) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38608 () Bool)

(declare-fun mapRes!38608 () Bool)

(declare-fun tp!74111 () Bool)

(declare-fun e!588314 () Bool)

(assert (=> mapNonEmpty!38608 (= mapRes!38608 (and tp!74111 e!588314))))

(declare-fun mapKey!38608 () (_ BitVec 32))

(declare-fun mapRest!38608 () (Array (_ BitVec 32) ValueCell!11645))

(declare-fun mapValue!38608 () ValueCell!11645)

(assert (=> mapNonEmpty!38608 (= (arr!31532 (_values!6347 thiss!1427)) (store mapRest!38608 mapKey!38608 mapValue!38608))))

(declare-fun b!1039462 () Bool)

(declare-fun res!693207 () Bool)

(assert (=> b!1039462 (=> res!693207 e!588320)))

(assert (=> b!1039462 (= res!693207 (or (not (= (size!32062 (_keys!11534 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30290 thiss!1427)))) (bvslt (index!41504 lt!458102) #b00000000000000000000000000000000) (bvsge (index!41504 lt!458102) (size!32062 (_keys!11534 thiss!1427)))))))

(declare-fun b!1039463 () Bool)

(declare-fun res!693206 () Bool)

(assert (=> b!1039463 (=> (not res!693206) (not e!588316))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1039463 (= res!693206 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039464 () Bool)

(declare-fun tp_is_empty!24697 () Bool)

(assert (=> b!1039464 (= e!588314 tp_is_empty!24697)))

(declare-fun mapIsEmpty!38608 () Bool)

(assert (=> mapIsEmpty!38608 mapRes!38608))

(declare-fun b!1039465 () Bool)

(declare-fun e!588317 () Bool)

(assert (=> b!1039465 (= e!588317 tp_is_empty!24697)))

(declare-fun b!1039466 () Bool)

(declare-fun res!693204 () Bool)

(assert (=> b!1039466 (=> res!693204 e!588320)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039466 (= res!693204 (not (validKeyInArray!0 (select (arr!31531 (_keys!11534 thiss!1427)) (index!41504 lt!458102)))))))

(declare-fun b!1039467 () Bool)

(declare-fun e!588313 () Bool)

(assert (=> b!1039467 (= e!588313 (and e!588317 mapRes!38608))))

(declare-fun condMapEmpty!38608 () Bool)

(declare-fun mapDefault!38608 () ValueCell!11645)

