; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3036 () Bool)

(assert start!3036)

(declare-fun b!18080 () Bool)

(declare-fun b_free!643 () Bool)

(declare-fun b_next!643 () Bool)

(assert (=> b!18080 (= b_free!643 (not b_next!643))))

(declare-fun tp!3119 () Bool)

(declare-fun b_and!1291 () Bool)

(assert (=> b!18080 (= tp!3119 b_and!1291)))

(declare-fun b!18078 () Bool)

(declare-fun e!11565 () Bool)

(declare-fun e!11559 () Bool)

(declare-fun mapRes!795 () Bool)

(assert (=> b!18078 (= e!11565 (and e!11559 mapRes!795))))

(declare-fun condMapEmpty!795 () Bool)

(declare-datatypes ((V!1035 0))(
  ( (V!1036 (val!480 Int)) )
))
(declare-datatypes ((ValueCell!254 0))(
  ( (ValueCellFull!254 (v!1464 V!1035)) (EmptyCell!254) )
))
(declare-datatypes ((array!1019 0))(
  ( (array!1020 (arr!491 (Array (_ BitVec 32) ValueCell!254)) (size!581 (_ BitVec 32))) )
))
(declare-datatypes ((array!1021 0))(
  ( (array!1022 (arr!492 (Array (_ BitVec 32) (_ BitVec 64))) (size!582 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!94 0))(
  ( (LongMapFixedSize!95 (defaultEntry!1658 Int) (mask!4589 (_ BitVec 32)) (extraKeys!1571 (_ BitVec 32)) (zeroValue!1594 V!1035) (minValue!1594 V!1035) (_size!79 (_ BitVec 32)) (_keys!3083 array!1021) (_values!1655 array!1019) (_vacant!79 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!94 0))(
  ( (Cell!95 (v!1465 LongMapFixedSize!94)) )
))
(declare-datatypes ((LongMap!94 0))(
  ( (LongMap!95 (underlying!58 Cell!94)) )
))
(declare-fun thiss!848 () LongMap!94)

(declare-fun mapDefault!795 () ValueCell!254)

