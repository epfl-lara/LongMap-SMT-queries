; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90806 () Bool)

(assert start!90806)

(declare-fun b!1038012 () Bool)

(declare-fun b_free!20923 () Bool)

(declare-fun b_next!20923 () Bool)

(assert (=> b!1038012 (= b_free!20923 (not b_next!20923))))

(declare-fun tp!73926 () Bool)

(declare-fun b_and!33455 () Bool)

(assert (=> b!1038012 (= tp!73926 b_and!33455)))

(declare-fun b!1038008 () Bool)

(declare-fun res!692475 () Bool)

(declare-fun e!587270 () Bool)

(assert (=> b!1038008 (=> res!692475 e!587270)))

(declare-datatypes ((List!21930 0))(
  ( (Nil!21927) (Cons!21926 (h!23129 (_ BitVec 64)) (t!31144 List!21930)) )
))
(declare-fun contains!6031 (List!21930 (_ BitVec 64)) Bool)

(assert (=> b!1038008 (= res!692475 (contains!6031 Nil!21927 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038009 () Bool)

(declare-fun e!587272 () Bool)

(assert (=> b!1038009 (= e!587272 (not e!587270))))

(declare-fun res!692478 () Bool)

(assert (=> b!1038009 (=> res!692478 e!587270)))

(declare-datatypes ((V!37731 0))(
  ( (V!37732 (val!12372 Int)) )
))
(declare-datatypes ((ValueCell!11618 0))(
  ( (ValueCellFull!11618 (v!14957 V!37731)) (EmptyCell!11618) )
))
(declare-datatypes ((array!65398 0))(
  ( (array!65399 (arr!31477 (Array (_ BitVec 32) (_ BitVec 64))) (size!32007 (_ BitVec 32))) )
))
(declare-datatypes ((array!65400 0))(
  ( (array!65401 (arr!31478 (Array (_ BitVec 32) ValueCell!11618)) (size!32008 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5830 0))(
  ( (LongMapFixedSize!5831 (defaultEntry!6297 Int) (mask!30228 (_ BitVec 32)) (extraKeys!6025 (_ BitVec 32)) (zeroValue!6131 V!37731) (minValue!6131 V!37731) (_size!2970 (_ BitVec 32)) (_keys!11497 array!65398) (_values!6320 array!65400) (_vacant!2970 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5830)

(assert (=> b!1038009 (= res!692478 (or (bvsge (size!32007 (_keys!11497 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!32007 (_keys!11497 thiss!1427)))))))

(declare-datatypes ((SeekEntryResult!9764 0))(
  ( (MissingZero!9764 (index!41427 (_ BitVec 32))) (Found!9764 (index!41428 (_ BitVec 32))) (Intermediate!9764 (undefined!10576 Bool) (index!41429 (_ BitVec 32)) (x!92619 (_ BitVec 32))) (Undefined!9764) (MissingVacant!9764 (index!41430 (_ BitVec 32))) )
))
(declare-fun lt!457632 () SeekEntryResult!9764)

(declare-fun arrayCountValidKeys!0 (array!65398 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038009 (= (arrayCountValidKeys!0 (array!65399 (store (arr!31477 (_keys!11497 thiss!1427)) (index!41428 lt!457632) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32007 (_keys!11497 thiss!1427))) #b00000000000000000000000000000000 (size!32007 (_keys!11497 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11497 thiss!1427) #b00000000000000000000000000000000 (size!32007 (_keys!11497 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33967 0))(
  ( (Unit!33968) )
))
(declare-fun lt!457634 () Unit!33967)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65398 (_ BitVec 32) (_ BitVec 64)) Unit!33967)

(assert (=> b!1038009 (= lt!457634 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11497 thiss!1427) (index!41428 lt!457632) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038010 () Bool)

(declare-fun e!587273 () Bool)

(assert (=> b!1038010 (= e!587273 e!587272)))

(declare-fun res!692474 () Bool)

(assert (=> b!1038010 (=> (not res!692474) (not e!587272))))

(assert (=> b!1038010 (= res!692474 (is-Found!9764 lt!457632))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65398 (_ BitVec 32)) SeekEntryResult!9764)

(assert (=> b!1038010 (= lt!457632 (seekEntry!0 key!909 (_keys!11497 thiss!1427) (mask!30228 thiss!1427)))))

(declare-fun b!1038011 () Bool)

(declare-fun e!587271 () Bool)

(declare-fun e!587274 () Bool)

(declare-fun mapRes!38505 () Bool)

(assert (=> b!1038011 (= e!587271 (and e!587274 mapRes!38505))))

(declare-fun condMapEmpty!38505 () Bool)

(declare-fun mapDefault!38505 () ValueCell!11618)

