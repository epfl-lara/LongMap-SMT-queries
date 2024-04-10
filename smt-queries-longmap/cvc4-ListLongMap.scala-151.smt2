; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2950 () Bool)

(assert start!2950)

(declare-fun b!16878 () Bool)

(declare-fun b_free!587 () Bool)

(declare-fun b_next!587 () Bool)

(assert (=> b!16878 (= b_free!587 (not b_next!587))))

(declare-fun tp!2948 () Bool)

(declare-fun b_and!1229 () Bool)

(assert (=> b!16878 (= tp!2948 b_and!1229)))

(declare-fun b!16871 () Bool)

(declare-fun e!10524 () Bool)

(declare-fun e!10526 () Bool)

(declare-fun mapRes!707 () Bool)

(assert (=> b!16871 (= e!10524 (and e!10526 mapRes!707))))

(declare-fun condMapEmpty!707 () Bool)

(declare-datatypes ((V!959 0))(
  ( (V!960 (val!452 Int)) )
))
(declare-datatypes ((ValueCell!226 0))(
  ( (ValueCellFull!226 (v!1404 V!959)) (EmptyCell!226) )
))
(declare-datatypes ((array!905 0))(
  ( (array!906 (arr!435 (Array (_ BitVec 32) ValueCell!226)) (size!524 (_ BitVec 32))) )
))
(declare-datatypes ((array!907 0))(
  ( (array!908 (arr!436 (Array (_ BitVec 32) (_ BitVec 64))) (size!525 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!38 0))(
  ( (LongMapFixedSize!39 (defaultEntry!1629 Int) (mask!4539 (_ BitVec 32)) (extraKeys!1543 (_ BitVec 32)) (zeroValue!1566 V!959) (minValue!1566 V!959) (_size!50 (_ BitVec 32)) (_keys!3054 array!907) (_values!1627 array!905) (_vacant!50 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!38 0))(
  ( (Cell!39 (v!1405 LongMapFixedSize!38)) )
))
(declare-datatypes ((LongMap!38 0))(
  ( (LongMap!39 (underlying!30 Cell!38)) )
))
(declare-fun thiss!848 () LongMap!38)

(declare-fun mapDefault!707 () ValueCell!226)

