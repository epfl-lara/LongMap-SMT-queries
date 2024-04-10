; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!430 () Bool)

(assert start!430)

(declare-fun b!2538 () Bool)

(declare-fun b_free!55 () Bool)

(declare-fun b_next!55 () Bool)

(assert (=> b!2538 (= b_free!55 (not b_next!55))))

(declare-fun tp!227 () Bool)

(declare-fun b_and!193 () Bool)

(assert (=> b!2538 (= tp!227 b_and!193)))

(declare-fun mapIsEmpty!2 () Bool)

(declare-fun mapRes!2 () Bool)

(assert (=> mapIsEmpty!2 mapRes!2))

(declare-fun b!2532 () Bool)

(declare-fun e!863 () Bool)

(declare-fun e!862 () Bool)

(assert (=> b!2532 (= e!863 (and e!862 mapRes!2))))

(declare-fun condMapEmpty!2 () Bool)

(declare-datatypes ((V!235 0))(
  ( (V!236 (val!27 Int)) )
))
(declare-datatypes ((ValueCell!5 0))(
  ( (ValueCellFull!5 (v!1107 V!235)) (EmptyCell!5) )
))
(declare-datatypes ((array!15 0))(
  ( (array!16 (arr!7 (Array (_ BitVec 32) ValueCell!5)) (size!69 (_ BitVec 32))) )
))
(declare-datatypes ((array!17 0))(
  ( (array!18 (arr!8 (Array (_ BitVec 32) (_ BitVec 64))) (size!70 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!10 0))(
  ( (LongMapFixedSize!11 (defaultEntry!1589 Int) (mask!4165 (_ BitVec 32)) (extraKeys!1506 (_ BitVec 32)) (zeroValue!1529 V!235) (minValue!1529 V!235) (_size!36 (_ BitVec 32)) (_keys!2991 array!17) (_values!1590 array!15) (_vacant!36 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!10 0))(
  ( (Cell!11 (v!1108 LongMapFixedSize!10)) )
))
(declare-datatypes ((LongMap!10 0))(
  ( (LongMap!11 (underlying!16 Cell!10)) )
))
(declare-fun thiss!814 () LongMap!10)

(declare-fun mapDefault!2 () ValueCell!5)
