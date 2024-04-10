; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89064 () Bool)

(assert start!89064)

(declare-fun b!1021176 () Bool)

(declare-fun b_free!20125 () Bool)

(declare-fun b_next!20125 () Bool)

(assert (=> b!1021176 (= b_free!20125 (not b_next!20125))))

(declare-fun tp!71404 () Bool)

(declare-fun b_and!32313 () Bool)

(assert (=> b!1021176 (= tp!71404 b_and!32313)))

(declare-fun b!1021171 () Bool)

(declare-fun e!575054 () Bool)

(declare-fun e!575048 () Bool)

(declare-fun mapRes!37179 () Bool)

(assert (=> b!1021171 (= e!575054 (and e!575048 mapRes!37179))))

(declare-fun condMapEmpty!37179 () Bool)

(declare-datatypes ((V!36667 0))(
  ( (V!36668 (val!11973 Int)) )
))
(declare-datatypes ((array!63730 0))(
  ( (array!63731 (arr!30679 (Array (_ BitVec 32) (_ BitVec 64))) (size!31190 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11219 0))(
  ( (ValueCellFull!11219 (v!14533 V!36667)) (EmptyCell!11219) )
))
(declare-datatypes ((array!63732 0))(
  ( (array!63733 (arr!30680 (Array (_ BitVec 32) ValueCell!11219)) (size!31191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5032 0))(
  ( (LongMapFixedSize!5033 (defaultEntry!5868 Int) (mask!29433 (_ BitVec 32)) (extraKeys!5600 (_ BitVec 32)) (zeroValue!5704 V!36667) (minValue!5704 V!36667) (_size!2571 (_ BitVec 32)) (_keys!11013 array!63730) (_values!5891 array!63732) (_vacant!2571 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1106 0))(
  ( (Cell!1107 (v!14534 LongMapFixedSize!5032)) )
))
(declare-datatypes ((LongMap!1106 0))(
  ( (LongMap!1107 (underlying!564 Cell!1106)) )
))
(declare-fun thiss!908 () LongMap!1106)

(declare-fun mapDefault!37179 () ValueCell!11219)

