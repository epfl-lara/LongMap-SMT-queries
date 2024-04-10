; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81046 () Bool)

(assert start!81046)

(declare-fun b!949029 () Bool)

(declare-fun b_free!18215 () Bool)

(declare-fun b_next!18215 () Bool)

(assert (=> b!949029 (= b_free!18215 (not b_next!18215))))

(declare-fun tp!63226 () Bool)

(declare-fun b_and!29655 () Bool)

(assert (=> b!949029 (= tp!63226 b_and!29655)))

(declare-fun b!949026 () Bool)

(declare-fun e!534266 () Bool)

(declare-fun e!534268 () Bool)

(declare-fun mapRes!32982 () Bool)

(assert (=> b!949026 (= e!534266 (and e!534268 mapRes!32982))))

(declare-fun condMapEmpty!32982 () Bool)

(declare-datatypes ((V!32595 0))(
  ( (V!32596 (val!10412 Int)) )
))
(declare-datatypes ((ValueCell!9880 0))(
  ( (ValueCellFull!9880 (v!12951 V!32595)) (EmptyCell!9880) )
))
(declare-datatypes ((array!57456 0))(
  ( (array!57457 (arr!27632 (Array (_ BitVec 32) ValueCell!9880)) (size!28107 (_ BitVec 32))) )
))
(declare-datatypes ((array!57458 0))(
  ( (array!57459 (arr!27633 (Array (_ BitVec 32) (_ BitVec 64))) (size!28108 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4910 0))(
  ( (LongMapFixedSize!4911 (defaultEntry!5760 Int) (mask!27532 (_ BitVec 32)) (extraKeys!5492 (_ BitVec 32)) (zeroValue!5596 V!32595) (minValue!5596 V!32595) (_size!2510 (_ BitVec 32)) (_keys!10684 array!57458) (_values!5783 array!57456) (_vacant!2510 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4910)

(declare-fun mapDefault!32982 () ValueCell!9880)

