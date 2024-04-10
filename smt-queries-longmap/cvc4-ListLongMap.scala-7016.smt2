; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89112 () Bool)

(assert start!89112)

(declare-fun b!1021611 () Bool)

(declare-fun b_free!20153 () Bool)

(declare-fun b_next!20153 () Bool)

(assert (=> b!1021611 (= b_free!20153 (not b_next!20153))))

(declare-fun tp!71493 () Bool)

(declare-fun b_and!32351 () Bool)

(assert (=> b!1021611 (= tp!71493 b_and!32351)))

(declare-fun mapIsEmpty!37227 () Bool)

(declare-fun mapRes!37227 () Bool)

(assert (=> mapIsEmpty!37227 mapRes!37227))

(declare-fun res!684473 () Bool)

(declare-fun e!575413 () Bool)

(assert (=> start!89112 (=> (not res!684473) (not e!575413))))

(declare-datatypes ((V!36703 0))(
  ( (V!36704 (val!11987 Int)) )
))
(declare-datatypes ((ValueCell!11233 0))(
  ( (ValueCellFull!11233 (v!14556 V!36703)) (EmptyCell!11233) )
))
(declare-datatypes ((array!63790 0))(
  ( (array!63791 (arr!30707 (Array (_ BitVec 32) (_ BitVec 64))) (size!31218 (_ BitVec 32))) )
))
(declare-datatypes ((array!63792 0))(
  ( (array!63793 (arr!30708 (Array (_ BitVec 32) ValueCell!11233)) (size!31219 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5060 0))(
  ( (LongMapFixedSize!5061 (defaultEntry!5882 Int) (mask!29455 (_ BitVec 32)) (extraKeys!5614 (_ BitVec 32)) (zeroValue!5718 V!36703) (minValue!5718 V!36703) (_size!2585 (_ BitVec 32)) (_keys!11027 array!63790) (_values!5905 array!63792) (_vacant!2585 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5060)

(declare-fun valid!1930 (LongMapFixedSize!5060) Bool)

(assert (=> start!89112 (= res!684473 (valid!1930 thiss!1427))))

(assert (=> start!89112 e!575413))

(declare-fun e!575415 () Bool)

(assert (=> start!89112 e!575415))

(assert (=> start!89112 true))

(declare-fun b!1021604 () Bool)

(declare-fun e!575410 () Bool)

(declare-fun tp_is_empty!23873 () Bool)

(assert (=> b!1021604 (= e!575410 tp_is_empty!23873)))

(declare-fun b!1021605 () Bool)

(declare-fun res!684475 () Bool)

(assert (=> b!1021605 (=> (not res!684475) (not e!575413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63790 (_ BitVec 32)) Bool)

(assert (=> b!1021605 (= res!684475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11027 thiss!1427) (mask!29455 thiss!1427)))))

(declare-fun b!1021606 () Bool)

(declare-fun res!684472 () Bool)

(assert (=> b!1021606 (=> (not res!684472) (not e!575413))))

(assert (=> b!1021606 (= res!684472 (and (= (size!31219 (_values!5905 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29455 thiss!1427))) (= (size!31218 (_keys!11027 thiss!1427)) (size!31219 (_values!5905 thiss!1427))) (bvsge (mask!29455 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5614 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5614 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5614 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5614 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5614 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5614 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5614 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021607 () Bool)

(declare-fun e!575411 () Bool)

(assert (=> b!1021607 (= e!575411 (and e!575410 mapRes!37227))))

(declare-fun condMapEmpty!37227 () Bool)

(declare-fun mapDefault!37227 () ValueCell!11233)

