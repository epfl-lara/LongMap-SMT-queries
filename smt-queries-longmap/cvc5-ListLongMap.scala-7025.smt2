; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89162 () Bool)

(assert start!89162)

(declare-fun b!1022286 () Bool)

(declare-fun b_free!20203 () Bool)

(declare-fun b_next!20203 () Bool)

(assert (=> b!1022286 (= b_free!20203 (not b_next!20203))))

(declare-fun tp!71644 () Bool)

(declare-fun b_and!32401 () Bool)

(assert (=> b!1022286 (= tp!71644 b_and!32401)))

(declare-fun mapIsEmpty!37302 () Bool)

(declare-fun mapRes!37302 () Bool)

(assert (=> mapIsEmpty!37302 mapRes!37302))

(declare-fun b!1022279 () Bool)

(declare-fun res!684847 () Bool)

(declare-fun e!575862 () Bool)

(assert (=> b!1022279 (=> (not res!684847) (not e!575862))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022279 (= res!684847 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!684851 () Bool)

(assert (=> start!89162 (=> (not res!684851) (not e!575862))))

(declare-datatypes ((V!36771 0))(
  ( (V!36772 (val!12012 Int)) )
))
(declare-datatypes ((ValueCell!11258 0))(
  ( (ValueCellFull!11258 (v!14581 V!36771)) (EmptyCell!11258) )
))
(declare-datatypes ((array!63890 0))(
  ( (array!63891 (arr!30757 (Array (_ BitVec 32) (_ BitVec 64))) (size!31268 (_ BitVec 32))) )
))
(declare-datatypes ((array!63892 0))(
  ( (array!63893 (arr!30758 (Array (_ BitVec 32) ValueCell!11258)) (size!31269 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5110 0))(
  ( (LongMapFixedSize!5111 (defaultEntry!5907 Int) (mask!29498 (_ BitVec 32)) (extraKeys!5639 (_ BitVec 32)) (zeroValue!5743 V!36771) (minValue!5743 V!36771) (_size!2610 (_ BitVec 32)) (_keys!11052 array!63890) (_values!5930 array!63892) (_vacant!2610 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5110)

(declare-fun valid!1945 (LongMapFixedSize!5110) Bool)

(assert (=> start!89162 (= res!684851 (valid!1945 thiss!1427))))

(assert (=> start!89162 e!575862))

(declare-fun e!575864 () Bool)

(assert (=> start!89162 e!575864))

(assert (=> start!89162 true))

(declare-fun b!1022280 () Bool)

(assert (=> b!1022280 (= e!575862 false)))

(declare-fun lt!450198 () Bool)

(declare-datatypes ((List!21677 0))(
  ( (Nil!21674) (Cons!21673 (h!22871 (_ BitVec 64)) (t!30691 List!21677)) )
))
(declare-fun arrayNoDuplicates!0 (array!63890 (_ BitVec 32) List!21677) Bool)

(assert (=> b!1022280 (= lt!450198 (arrayNoDuplicates!0 (_keys!11052 thiss!1427) #b00000000000000000000000000000000 Nil!21674))))

(declare-fun b!1022281 () Bool)

(declare-fun res!684848 () Bool)

(assert (=> b!1022281 (=> (not res!684848) (not e!575862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022281 (= res!684848 (validMask!0 (mask!29498 thiss!1427)))))

(declare-fun b!1022282 () Bool)

(declare-fun e!575860 () Bool)

(declare-fun tp_is_empty!23923 () Bool)

(assert (=> b!1022282 (= e!575860 tp_is_empty!23923)))

(declare-fun mapNonEmpty!37302 () Bool)

(declare-fun tp!71643 () Bool)

(assert (=> mapNonEmpty!37302 (= mapRes!37302 (and tp!71643 e!575860))))

(declare-fun mapKey!37302 () (_ BitVec 32))

(declare-fun mapValue!37302 () ValueCell!11258)

(declare-fun mapRest!37302 () (Array (_ BitVec 32) ValueCell!11258))

(assert (=> mapNonEmpty!37302 (= (arr!30758 (_values!5930 thiss!1427)) (store mapRest!37302 mapKey!37302 mapValue!37302))))

(declare-fun b!1022283 () Bool)

(declare-fun res!684849 () Bool)

(assert (=> b!1022283 (=> (not res!684849) (not e!575862))))

(assert (=> b!1022283 (= res!684849 (and (= (size!31269 (_values!5930 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29498 thiss!1427))) (= (size!31268 (_keys!11052 thiss!1427)) (size!31269 (_values!5930 thiss!1427))) (bvsge (mask!29498 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5639 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5639 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022284 () Bool)

(declare-fun e!575865 () Bool)

(declare-fun e!575861 () Bool)

(assert (=> b!1022284 (= e!575865 (and e!575861 mapRes!37302))))

(declare-fun condMapEmpty!37302 () Bool)

(declare-fun mapDefault!37302 () ValueCell!11258)

