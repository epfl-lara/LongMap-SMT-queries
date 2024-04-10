; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90870 () Bool)

(assert start!90870)

(declare-fun b!1038601 () Bool)

(declare-fun b_free!20951 () Bool)

(declare-fun b_next!20951 () Bool)

(assert (=> b!1038601 (= b_free!20951 (not b_next!20951))))

(declare-fun tp!74017 () Bool)

(declare-fun b_and!33483 () Bool)

(assert (=> b!1038601 (= tp!74017 b_and!33483)))

(declare-fun e!587706 () Bool)

(declare-datatypes ((V!37767 0))(
  ( (V!37768 (val!12386 Int)) )
))
(declare-datatypes ((ValueCell!11632 0))(
  ( (ValueCellFull!11632 (v!14972 V!37767)) (EmptyCell!11632) )
))
(declare-datatypes ((array!65458 0))(
  ( (array!65459 (arr!31505 (Array (_ BitVec 32) (_ BitVec 64))) (size!32035 (_ BitVec 32))) )
))
(declare-datatypes ((array!65460 0))(
  ( (array!65461 (arr!31506 (Array (_ BitVec 32) ValueCell!11632)) (size!32036 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5858 0))(
  ( (LongMapFixedSize!5859 (defaultEntry!6311 Int) (mask!30253 (_ BitVec 32)) (extraKeys!6039 (_ BitVec 32)) (zeroValue!6145 V!37767) (minValue!6145 V!37767) (_size!2984 (_ BitVec 32)) (_keys!11513 array!65458) (_values!6334 array!65460) (_vacant!2984 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5858)

(declare-fun e!587701 () Bool)

(declare-fun tp_is_empty!24671 () Bool)

(declare-fun array_inv!24361 (array!65458) Bool)

(declare-fun array_inv!24362 (array!65460) Bool)

(assert (=> b!1038601 (= e!587701 (and tp!74017 tp_is_empty!24671 (array_inv!24361 (_keys!11513 thiss!1427)) (array_inv!24362 (_values!6334 thiss!1427)) e!587706))))

(declare-fun b!1038602 () Bool)

(declare-fun e!587700 () Bool)

(declare-fun e!587703 () Bool)

(assert (=> b!1038602 (= e!587700 (not e!587703))))

(declare-fun res!692805 () Bool)

(assert (=> b!1038602 (=> res!692805 e!587703)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1038602 (= res!692805 (not (validMask!0 (mask!30253 thiss!1427))))))

(declare-fun lt!457804 () array!65458)

(declare-datatypes ((List!21939 0))(
  ( (Nil!21936) (Cons!21935 (h!23138 (_ BitVec 64)) (t!31153 List!21939)) )
))
(declare-fun arrayNoDuplicates!0 (array!65458 (_ BitVec 32) List!21939) Bool)

(assert (=> b!1038602 (arrayNoDuplicates!0 lt!457804 #b00000000000000000000000000000000 Nil!21936)))

(declare-datatypes ((Unit!33981 0))(
  ( (Unit!33982) )
))
(declare-fun lt!457802 () Unit!33981)

(declare-datatypes ((SeekEntryResult!9774 0))(
  ( (MissingZero!9774 (index!41467 (_ BitVec 32))) (Found!9774 (index!41468 (_ BitVec 32))) (Intermediate!9774 (undefined!10586 Bool) (index!41469 (_ BitVec 32)) (x!92677 (_ BitVec 32))) (Undefined!9774) (MissingVacant!9774 (index!41470 (_ BitVec 32))) )
))
(declare-fun lt!457803 () SeekEntryResult!9774)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21939) Unit!33981)

(assert (=> b!1038602 (= lt!457802 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11513 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41468 lt!457803) #b00000000000000000000000000000000 Nil!21936))))

(declare-fun arrayCountValidKeys!0 (array!65458 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1038602 (= (arrayCountValidKeys!0 lt!457804 #b00000000000000000000000000000000 (size!32035 (_keys!11513 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11513 thiss!1427) #b00000000000000000000000000000000 (size!32035 (_keys!11513 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1038602 (= lt!457804 (array!65459 (store (arr!31505 (_keys!11513 thiss!1427)) (index!41468 lt!457803) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32035 (_keys!11513 thiss!1427))))))

(declare-fun lt!457805 () Unit!33981)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65458 (_ BitVec 32) (_ BitVec 64)) Unit!33981)

(assert (=> b!1038602 (= lt!457805 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11513 thiss!1427) (index!41468 lt!457803) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1038603 () Bool)

(declare-fun e!587702 () Bool)

(declare-fun mapRes!38553 () Bool)

(assert (=> b!1038603 (= e!587706 (and e!587702 mapRes!38553))))

(declare-fun condMapEmpty!38553 () Bool)

(declare-fun mapDefault!38553 () ValueCell!11632)

