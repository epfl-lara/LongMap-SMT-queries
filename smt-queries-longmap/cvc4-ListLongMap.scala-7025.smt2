; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89166 () Bool)

(assert start!89166)

(declare-fun b!1022336 () Bool)

(declare-fun b_free!20207 () Bool)

(declare-fun b_next!20207 () Bool)

(assert (=> b!1022336 (= b_free!20207 (not b_next!20207))))

(declare-fun tp!71656 () Bool)

(declare-fun b_and!32405 () Bool)

(assert (=> b!1022336 (= tp!71656 b_and!32405)))

(declare-fun b!1022333 () Bool)

(declare-fun e!575898 () Bool)

(declare-fun tp_is_empty!23927 () Bool)

(assert (=> b!1022333 (= e!575898 tp_is_empty!23927)))

(declare-fun b!1022334 () Bool)

(declare-fun e!575896 () Bool)

(assert (=> b!1022334 (= e!575896 false)))

(declare-fun lt!450204 () Bool)

(declare-datatypes ((V!36775 0))(
  ( (V!36776 (val!12014 Int)) )
))
(declare-datatypes ((ValueCell!11260 0))(
  ( (ValueCellFull!11260 (v!14583 V!36775)) (EmptyCell!11260) )
))
(declare-datatypes ((array!63898 0))(
  ( (array!63899 (arr!30761 (Array (_ BitVec 32) (_ BitVec 64))) (size!31272 (_ BitVec 32))) )
))
(declare-datatypes ((array!63900 0))(
  ( (array!63901 (arr!30762 (Array (_ BitVec 32) ValueCell!11260)) (size!31273 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5114 0))(
  ( (LongMapFixedSize!5115 (defaultEntry!5909 Int) (mask!29500 (_ BitVec 32)) (extraKeys!5641 (_ BitVec 32)) (zeroValue!5745 V!36775) (minValue!5745 V!36775) (_size!2612 (_ BitVec 32)) (_keys!11054 array!63898) (_values!5932 array!63900) (_vacant!2612 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5114)

(declare-datatypes ((List!21679 0))(
  ( (Nil!21676) (Cons!21675 (h!22873 (_ BitVec 64)) (t!30693 List!21679)) )
))
(declare-fun arrayNoDuplicates!0 (array!63898 (_ BitVec 32) List!21679) Bool)

(assert (=> b!1022334 (= lt!450204 (arrayNoDuplicates!0 (_keys!11054 thiss!1427) #b00000000000000000000000000000000 Nil!21676))))

(declare-fun res!684878 () Bool)

(assert (=> start!89166 (=> (not res!684878) (not e!575896))))

(declare-fun valid!1947 (LongMapFixedSize!5114) Bool)

(assert (=> start!89166 (= res!684878 (valid!1947 thiss!1427))))

(assert (=> start!89166 e!575896))

(declare-fun e!575897 () Bool)

(assert (=> start!89166 e!575897))

(assert (=> start!89166 true))

(declare-fun b!1022335 () Bool)

(declare-fun e!575900 () Bool)

(assert (=> b!1022335 (= e!575900 tp_is_empty!23927)))

(declare-fun e!575899 () Bool)

(declare-fun array_inv!23847 (array!63898) Bool)

(declare-fun array_inv!23848 (array!63900) Bool)

(assert (=> b!1022336 (= e!575897 (and tp!71656 tp_is_empty!23927 (array_inv!23847 (_keys!11054 thiss!1427)) (array_inv!23848 (_values!5932 thiss!1427)) e!575899))))

(declare-fun mapIsEmpty!37308 () Bool)

(declare-fun mapRes!37308 () Bool)

(assert (=> mapIsEmpty!37308 mapRes!37308))

(declare-fun b!1022337 () Bool)

(declare-fun res!684879 () Bool)

(assert (=> b!1022337 (=> (not res!684879) (not e!575896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63898 (_ BitVec 32)) Bool)

(assert (=> b!1022337 (= res!684879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11054 thiss!1427) (mask!29500 thiss!1427)))))

(declare-fun b!1022338 () Bool)

(declare-fun res!684880 () Bool)

(assert (=> b!1022338 (=> (not res!684880) (not e!575896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022338 (= res!684880 (validMask!0 (mask!29500 thiss!1427)))))

(declare-fun b!1022339 () Bool)

(declare-fun res!684877 () Bool)

(assert (=> b!1022339 (=> (not res!684877) (not e!575896))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022339 (= res!684877 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022340 () Bool)

(declare-fun res!684881 () Bool)

(assert (=> b!1022340 (=> (not res!684881) (not e!575896))))

(assert (=> b!1022340 (= res!684881 (and (= (size!31273 (_values!5932 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29500 thiss!1427))) (= (size!31272 (_keys!11054 thiss!1427)) (size!31273 (_values!5932 thiss!1427))) (bvsge (mask!29500 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5641 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5641 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5641 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5641 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5641 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5641 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5641 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37308 () Bool)

(declare-fun tp!71655 () Bool)

(assert (=> mapNonEmpty!37308 (= mapRes!37308 (and tp!71655 e!575900))))

(declare-fun mapRest!37308 () (Array (_ BitVec 32) ValueCell!11260))

(declare-fun mapValue!37308 () ValueCell!11260)

(declare-fun mapKey!37308 () (_ BitVec 32))

(assert (=> mapNonEmpty!37308 (= (arr!30762 (_values!5932 thiss!1427)) (store mapRest!37308 mapKey!37308 mapValue!37308))))

(declare-fun b!1022341 () Bool)

(assert (=> b!1022341 (= e!575899 (and e!575898 mapRes!37308))))

(declare-fun condMapEmpty!37308 () Bool)

(declare-fun mapDefault!37308 () ValueCell!11260)

