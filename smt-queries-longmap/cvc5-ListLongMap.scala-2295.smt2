; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37232 () Bool)

(assert start!37232)

(declare-fun b_free!8359 () Bool)

(declare-fun b_next!8359 () Bool)

(assert (=> start!37232 (= b_free!8359 (not b_next!8359))))

(declare-fun tp!29793 () Bool)

(declare-fun b_and!15601 () Bool)

(assert (=> start!37232 (= tp!29793 b_and!15601)))

(declare-fun mapIsEmpty!15075 () Bool)

(declare-fun mapRes!15075 () Bool)

(assert (=> mapIsEmpty!15075 mapRes!15075))

(declare-fun b!376521 () Bool)

(declare-fun res!212813 () Bool)

(declare-fun e!229310 () Bool)

(assert (=> b!376521 (=> (not res!212813) (not e!229310))))

(declare-datatypes ((array!21943 0))(
  ( (array!21944 (arr!10440 (Array (_ BitVec 32) (_ BitVec 64))) (size!10792 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21943)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!376521 (= res!212813 (or (= (select (arr!10440 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10440 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!376522 () Bool)

(declare-fun e!229308 () Bool)

(declare-fun tp_is_empty!9007 () Bool)

(assert (=> b!376522 (= e!229308 tp_is_empty!9007)))

(declare-fun b!376523 () Bool)

(declare-fun e!229309 () Bool)

(assert (=> b!376523 (= e!229309 tp_is_empty!9007)))

(declare-fun b!376524 () Bool)

(declare-fun e!229303 () Bool)

(assert (=> b!376524 (= e!229303 (and e!229309 mapRes!15075))))

(declare-fun condMapEmpty!15075 () Bool)

(declare-datatypes ((V!13115 0))(
  ( (V!13116 (val!4548 Int)) )
))
(declare-datatypes ((ValueCell!4160 0))(
  ( (ValueCellFull!4160 (v!6745 V!13115)) (EmptyCell!4160) )
))
(declare-datatypes ((array!21945 0))(
  ( (array!21946 (arr!10441 (Array (_ BitVec 32) ValueCell!4160)) (size!10793 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21945)

(declare-fun mapDefault!15075 () ValueCell!4160)

