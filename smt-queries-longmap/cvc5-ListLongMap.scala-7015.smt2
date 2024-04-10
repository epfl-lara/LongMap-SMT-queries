; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89102 () Bool)

(assert start!89102)

(declare-fun b!1021477 () Bool)

(declare-fun b_free!20143 () Bool)

(declare-fun b_next!20143 () Bool)

(assert (=> b!1021477 (= b_free!20143 (not b_next!20143))))

(declare-fun tp!71463 () Bool)

(declare-fun b_and!32341 () Bool)

(assert (=> b!1021477 (= tp!71463 b_and!32341)))

(declare-fun b!1021469 () Bool)

(declare-fun res!684397 () Bool)

(declare-fun e!575321 () Bool)

(assert (=> b!1021469 (=> (not res!684397) (not e!575321))))

(declare-datatypes ((V!36691 0))(
  ( (V!36692 (val!11982 Int)) )
))
(declare-datatypes ((ValueCell!11228 0))(
  ( (ValueCellFull!11228 (v!14551 V!36691)) (EmptyCell!11228) )
))
(declare-datatypes ((array!63770 0))(
  ( (array!63771 (arr!30697 (Array (_ BitVec 32) (_ BitVec 64))) (size!31208 (_ BitVec 32))) )
))
(declare-datatypes ((array!63772 0))(
  ( (array!63773 (arr!30698 (Array (_ BitVec 32) ValueCell!11228)) (size!31209 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5050 0))(
  ( (LongMapFixedSize!5051 (defaultEntry!5877 Int) (mask!29448 (_ BitVec 32)) (extraKeys!5609 (_ BitVec 32)) (zeroValue!5713 V!36691) (minValue!5713 V!36691) (_size!2580 (_ BitVec 32)) (_keys!11022 array!63770) (_values!5900 array!63772) (_vacant!2580 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5050)

(assert (=> b!1021469 (= res!684397 (and (= (size!31209 (_values!5900 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29448 thiss!1427))) (= (size!31208 (_keys!11022 thiss!1427)) (size!31209 (_values!5900 thiss!1427))) (bvsge (mask!29448 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5609 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5609 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021470 () Bool)

(declare-fun res!684398 () Bool)

(assert (=> b!1021470 (=> (not res!684398) (not e!575321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021470 (= res!684398 (validMask!0 (mask!29448 thiss!1427)))))

(declare-fun res!684399 () Bool)

(assert (=> start!89102 (=> (not res!684399) (not e!575321))))

(declare-fun valid!1926 (LongMapFixedSize!5050) Bool)

(assert (=> start!89102 (= res!684399 (valid!1926 thiss!1427))))

(assert (=> start!89102 e!575321))

(declare-fun e!575323 () Bool)

(assert (=> start!89102 e!575323))

(assert (=> start!89102 true))

(declare-fun b!1021471 () Bool)

(assert (=> b!1021471 (= e!575321 false)))

(declare-fun lt!450108 () Bool)

(declare-datatypes ((List!21655 0))(
  ( (Nil!21652) (Cons!21651 (h!22849 (_ BitVec 64)) (t!30669 List!21655)) )
))
(declare-fun arrayNoDuplicates!0 (array!63770 (_ BitVec 32) List!21655) Bool)

(assert (=> b!1021471 (= lt!450108 (arrayNoDuplicates!0 (_keys!11022 thiss!1427) #b00000000000000000000000000000000 Nil!21652))))

(declare-fun b!1021472 () Bool)

(declare-fun e!575320 () Bool)

(declare-fun tp_is_empty!23863 () Bool)

(assert (=> b!1021472 (= e!575320 tp_is_empty!23863)))

(declare-fun b!1021473 () Bool)

(declare-fun e!575322 () Bool)

(declare-fun e!575324 () Bool)

(declare-fun mapRes!37212 () Bool)

(assert (=> b!1021473 (= e!575322 (and e!575324 mapRes!37212))))

(declare-fun condMapEmpty!37212 () Bool)

(declare-fun mapDefault!37212 () ValueCell!11228)

