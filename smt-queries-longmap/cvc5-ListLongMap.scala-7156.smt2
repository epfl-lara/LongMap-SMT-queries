; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91062 () Bool)

(assert start!91062)

(declare-fun b!1039810 () Bool)

(declare-fun b_free!20989 () Bool)

(declare-fun b_next!20989 () Bool)

(assert (=> b!1039810 (= b_free!20989 (not b_next!20989))))

(declare-fun tp!74153 () Bool)

(declare-fun b_and!33521 () Bool)

(assert (=> b!1039810 (= tp!74153 b_and!33521)))

(declare-fun res!693369 () Bool)

(declare-fun e!588569 () Bool)

(assert (=> start!91062 (=> (not res!693369) (not e!588569))))

(declare-datatypes ((V!37819 0))(
  ( (V!37820 (val!12405 Int)) )
))
(declare-datatypes ((ValueCell!11651 0))(
  ( (ValueCellFull!11651 (v!14992 V!37819)) (EmptyCell!11651) )
))
(declare-datatypes ((array!65548 0))(
  ( (array!65549 (arr!31543 (Array (_ BitVec 32) (_ BitVec 64))) (size!32074 (_ BitVec 32))) )
))
(declare-datatypes ((array!65550 0))(
  ( (array!65551 (arr!31544 (Array (_ BitVec 32) ValueCell!11651)) (size!32075 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5896 0))(
  ( (LongMapFixedSize!5897 (defaultEntry!6330 Int) (mask!30306 (_ BitVec 32)) (extraKeys!6058 (_ BitVec 32)) (zeroValue!6164 V!37819) (minValue!6164 V!37819) (_size!3003 (_ BitVec 32)) (_keys!11544 array!65548) (_values!6353 array!65550) (_vacant!3003 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5896)

(declare-fun valid!2215 (LongMapFixedSize!5896) Bool)

(assert (=> start!91062 (= res!693369 (valid!2215 thiss!1427))))

(assert (=> start!91062 e!588569))

(declare-fun e!588565 () Bool)

(assert (=> start!91062 e!588565))

(assert (=> start!91062 true))

(declare-fun b!1039808 () Bool)

(declare-fun e!588571 () Bool)

(assert (=> b!1039808 (= e!588569 e!588571)))

(declare-fun res!693368 () Bool)

(assert (=> b!1039808 (=> (not res!693368) (not e!588571))))

(declare-datatypes ((SeekEntryResult!9788 0))(
  ( (MissingZero!9788 (index!41523 (_ BitVec 32))) (Found!9788 (index!41524 (_ BitVec 32))) (Intermediate!9788 (undefined!10600 Bool) (index!41525 (_ BitVec 32)) (x!92812 (_ BitVec 32))) (Undefined!9788) (MissingVacant!9788 (index!41526 (_ BitVec 32))) )
))
(declare-fun lt!458253 () SeekEntryResult!9788)

(assert (=> b!1039808 (= res!693368 (is-Found!9788 lt!458253))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65548 (_ BitVec 32)) SeekEntryResult!9788)

(assert (=> b!1039808 (= lt!458253 (seekEntry!0 key!909 (_keys!11544 thiss!1427) (mask!30306 thiss!1427)))))

(declare-fun mapIsEmpty!38632 () Bool)

(declare-fun mapRes!38632 () Bool)

(assert (=> mapIsEmpty!38632 mapRes!38632))

(declare-fun b!1039809 () Bool)

(declare-fun res!693370 () Bool)

(assert (=> b!1039809 (=> (not res!693370) (not e!588569))))

(assert (=> b!1039809 (= res!693370 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38632 () Bool)

(declare-fun tp!74152 () Bool)

(declare-fun e!588570 () Bool)

(assert (=> mapNonEmpty!38632 (= mapRes!38632 (and tp!74152 e!588570))))

(declare-fun mapKey!38632 () (_ BitVec 32))

(declare-fun mapValue!38632 () ValueCell!11651)

(declare-fun mapRest!38632 () (Array (_ BitVec 32) ValueCell!11651))

(assert (=> mapNonEmpty!38632 (= (arr!31544 (_values!6353 thiss!1427)) (store mapRest!38632 mapKey!38632 mapValue!38632))))

(declare-fun tp_is_empty!24709 () Bool)

(declare-fun e!588566 () Bool)

(declare-fun array_inv!24383 (array!65548) Bool)

(declare-fun array_inv!24384 (array!65550) Bool)

(assert (=> b!1039810 (= e!588565 (and tp!74153 tp_is_empty!24709 (array_inv!24383 (_keys!11544 thiss!1427)) (array_inv!24384 (_values!6353 thiss!1427)) e!588566))))

(declare-fun b!1039811 () Bool)

(assert (=> b!1039811 (= e!588571 (not (or (bvslt (index!41524 lt!458253) #b00000000000000000000000000000000) (bvslt (index!41524 lt!458253) (size!32074 (_keys!11544 thiss!1427))))))))

(declare-fun lt!458251 () array!65548)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65548 (_ BitVec 32)) Bool)

(assert (=> b!1039811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458251 (mask!30306 thiss!1427))))

(declare-datatypes ((Unit!34001 0))(
  ( (Unit!34002) )
))
(declare-fun lt!458249 () Unit!34001)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65548 (_ BitVec 32) (_ BitVec 32)) Unit!34001)

(assert (=> b!1039811 (= lt!458249 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11544 thiss!1427) (index!41524 lt!458253) (mask!30306 thiss!1427)))))

(declare-datatypes ((List!21950 0))(
  ( (Nil!21947) (Cons!21946 (h!23150 (_ BitVec 64)) (t!31164 List!21950)) )
))
(declare-fun arrayNoDuplicates!0 (array!65548 (_ BitVec 32) List!21950) Bool)

(assert (=> b!1039811 (arrayNoDuplicates!0 lt!458251 #b00000000000000000000000000000000 Nil!21947)))

(declare-fun lt!458250 () Unit!34001)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21950) Unit!34001)

(assert (=> b!1039811 (= lt!458250 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11544 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41524 lt!458253) #b00000000000000000000000000000000 Nil!21947))))

(declare-fun arrayCountValidKeys!0 (array!65548 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1039811 (= (arrayCountValidKeys!0 lt!458251 #b00000000000000000000000000000000 (size!32074 (_keys!11544 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11544 thiss!1427) #b00000000000000000000000000000000 (size!32074 (_keys!11544 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1039811 (= lt!458251 (array!65549 (store (arr!31543 (_keys!11544 thiss!1427)) (index!41524 lt!458253) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32074 (_keys!11544 thiss!1427))))))

(declare-fun lt!458252 () Unit!34001)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65548 (_ BitVec 32) (_ BitVec 64)) Unit!34001)

(assert (=> b!1039811 (= lt!458252 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11544 thiss!1427) (index!41524 lt!458253) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1039812 () Bool)

(declare-fun e!588568 () Bool)

(assert (=> b!1039812 (= e!588568 tp_is_empty!24709)))

(declare-fun b!1039813 () Bool)

(assert (=> b!1039813 (= e!588566 (and e!588568 mapRes!38632))))

(declare-fun condMapEmpty!38632 () Bool)

(declare-fun mapDefault!38632 () ValueCell!11651)

