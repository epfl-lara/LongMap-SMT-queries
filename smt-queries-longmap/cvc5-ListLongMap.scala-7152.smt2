; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90956 () Bool)

(assert start!90956)

(declare-fun b!1039121 () Bool)

(declare-fun b_free!20965 () Bool)

(declare-fun b_next!20965 () Bool)

(assert (=> b!1039121 (= b_free!20965 (not b_next!20965))))

(declare-fun tp!74069 () Bool)

(declare-fun b_and!33497 () Bool)

(assert (=> b!1039121 (= tp!74069 b_and!33497)))

(declare-fun b!1039118 () Bool)

(declare-fun e!588075 () Bool)

(declare-fun e!588074 () Bool)

(assert (=> b!1039118 (= e!588075 (not e!588074))))

(declare-fun res!693031 () Bool)

(assert (=> b!1039118 (=> res!693031 e!588074)))

(declare-datatypes ((V!37787 0))(
  ( (V!37788 (val!12393 Int)) )
))
(declare-datatypes ((ValueCell!11639 0))(
  ( (ValueCellFull!11639 (v!14980 V!37787)) (EmptyCell!11639) )
))
(declare-datatypes ((array!65492 0))(
  ( (array!65493 (arr!31519 (Array (_ BitVec 32) (_ BitVec 64))) (size!32050 (_ BitVec 32))) )
))
(declare-datatypes ((array!65494 0))(
  ( (array!65495 (arr!31520 (Array (_ BitVec 32) ValueCell!11639)) (size!32051 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5872 0))(
  ( (LongMapFixedSize!5873 (defaultEntry!6318 Int) (mask!30276 (_ BitVec 32)) (extraKeys!6046 (_ BitVec 32)) (zeroValue!6152 V!37787) (minValue!6152 V!37787) (_size!2991 (_ BitVec 32)) (_keys!11526 array!65492) (_values!6341 array!65494) (_vacant!2991 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5872)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1039118 (= res!693031 (not (validMask!0 (mask!30276 thiss!1427))))))

(declare-fun lt!457985 () array!65492)

(declare-datatypes ((List!21943 0))(
  ( (Nil!21940) (Cons!21939 (h!23143 (_ BitVec 64)) (t!31157 List!21943)) )
))
(declare-fun arrayNoDuplicates!0 (array!65492 (_ BitVec 32) List!21943) Bool)

(assert (=> b!1039118 (arrayNoDuplicates!0 lt!457985 #b00000000000000000000000000000000 Nil!21940)))

(declare-datatypes ((Unit!33989 0))(
  ( (Unit!33990) )
))
(declare-fun lt!457986 () Unit!33989)

(declare-datatypes ((SeekEntryResult!9779 0))(
  ( (MissingZero!9779 (index!41487 (_ BitVec 32))) (Found!9779 (index!41488 (_ BitVec 32))) (Intermediate!9779 (undefined!10591 Bool) (index!41489 (_ BitVec 32)) (x!92739 (_ BitVec 32))) (Undefined!9779) (MissingVacant!9779 (index!41490 (_ BitVec 32))) )
))
(declare-fun lt!457987 () SeekEntryResult!9779)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65492 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21943) Unit!33989)

(assert (=> b!1039118 (= lt!457986 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11526 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41488 lt!457987) #b00000000000000000000000000000000 Nil!21940))))

(declare-fun arrayCountValidKeys!0 (array!65492 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039118 (= (arrayCountValidKeys!0 lt!457985 #b00000000000000000000000000000000 (size!32050 (_keys!11526 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11526 thiss!1427) #b00000000000000000000000000000000 (size!32050 (_keys!11526 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039118 (= lt!457985 (array!65493 (store (arr!31519 (_keys!11526 thiss!1427)) (index!41488 lt!457987) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32050 (_keys!11526 thiss!1427))))))

(declare-fun lt!457988 () Unit!33989)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65492 (_ BitVec 32) (_ BitVec 64)) Unit!33989)

(assert (=> b!1039118 (= lt!457988 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11526 thiss!1427) (index!41488 lt!457987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039119 () Bool)

(declare-fun e!588073 () Bool)

(assert (=> b!1039119 (= e!588073 e!588075)))

(declare-fun res!693032 () Bool)

(assert (=> b!1039119 (=> (not res!693032) (not e!588075))))

(assert (=> b!1039119 (= res!693032 (is-Found!9779 lt!457987))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65492 (_ BitVec 32)) SeekEntryResult!9779)

(assert (=> b!1039119 (= lt!457987 (seekEntry!0 key!909 (_keys!11526 thiss!1427) (mask!30276 thiss!1427)))))

(declare-fun res!693034 () Bool)

(assert (=> start!90956 (=> (not res!693034) (not e!588073))))

(declare-fun valid!2206 (LongMapFixedSize!5872) Bool)

(assert (=> start!90956 (= res!693034 (valid!2206 thiss!1427))))

(assert (=> start!90956 e!588073))

(declare-fun e!588076 () Bool)

(assert (=> start!90956 e!588076))

(assert (=> start!90956 true))

(declare-fun b!1039120 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1039120 (= e!588074 (validKeyInArray!0 (select (arr!31519 (_keys!11526 thiss!1427)) (index!41488 lt!457987))))))

(declare-fun e!588071 () Bool)

(declare-fun tp_is_empty!24685 () Bool)

(declare-fun array_inv!24369 (array!65492) Bool)

(declare-fun array_inv!24370 (array!65494) Bool)

(assert (=> b!1039121 (= e!588076 (and tp!74069 tp_is_empty!24685 (array_inv!24369 (_keys!11526 thiss!1427)) (array_inv!24370 (_values!6341 thiss!1427)) e!588071))))

(declare-fun mapIsEmpty!38584 () Bool)

(declare-fun mapRes!38584 () Bool)

(assert (=> mapIsEmpty!38584 mapRes!38584))

(declare-fun b!1039122 () Bool)

(declare-fun res!693033 () Bool)

(assert (=> b!1039122 (=> (not res!693033) (not e!588073))))

(assert (=> b!1039122 (= res!693033 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1039123 () Bool)

(declare-fun e!588072 () Bool)

(assert (=> b!1039123 (= e!588072 tp_is_empty!24685)))

(declare-fun b!1039124 () Bool)

(declare-fun e!588077 () Bool)

(assert (=> b!1039124 (= e!588071 (and e!588077 mapRes!38584))))

(declare-fun condMapEmpty!38584 () Bool)

(declare-fun mapDefault!38584 () ValueCell!11639)

