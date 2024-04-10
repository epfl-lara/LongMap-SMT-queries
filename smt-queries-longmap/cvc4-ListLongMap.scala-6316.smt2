; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81102 () Bool)

(assert start!81102)

(declare-fun b!949415 () Bool)

(declare-fun b_free!18221 () Bool)

(declare-fun b_next!18221 () Bool)

(assert (=> b!949415 (= b_free!18221 (not b_next!18221))))

(declare-fun tp!63249 () Bool)

(declare-fun b_and!29667 () Bool)

(assert (=> b!949415 (= tp!63249 b_and!29667)))

(declare-fun b!949413 () Bool)

(declare-fun res!636731 () Bool)

(declare-fun e!534502 () Bool)

(assert (=> b!949413 (=> (not res!636731) (not e!534502))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!949413 (= res!636731 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949414 () Bool)

(declare-fun e!534498 () Bool)

(declare-fun e!534499 () Bool)

(declare-fun mapRes!32995 () Bool)

(assert (=> b!949414 (= e!534498 (and e!534499 mapRes!32995))))

(declare-fun condMapEmpty!32995 () Bool)

(declare-datatypes ((V!32603 0))(
  ( (V!32604 (val!10415 Int)) )
))
(declare-datatypes ((ValueCell!9883 0))(
  ( (ValueCellFull!9883 (v!12955 V!32603)) (EmptyCell!9883) )
))
(declare-datatypes ((array!57470 0))(
  ( (array!57471 (arr!27638 (Array (_ BitVec 32) ValueCell!9883)) (size!28114 (_ BitVec 32))) )
))
(declare-datatypes ((array!57472 0))(
  ( (array!57473 (arr!27639 (Array (_ BitVec 32) (_ BitVec 64))) (size!28115 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4916 0))(
  ( (LongMapFixedSize!4917 (defaultEntry!5765 Int) (mask!27545 (_ BitVec 32)) (extraKeys!5497 (_ BitVec 32)) (zeroValue!5601 V!32603) (minValue!5601 V!32603) (_size!2513 (_ BitVec 32)) (_keys!10693 array!57472) (_values!5788 array!57470) (_vacant!2513 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4916)

(declare-fun mapDefault!32995 () ValueCell!9883)

