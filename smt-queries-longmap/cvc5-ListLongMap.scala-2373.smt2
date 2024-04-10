; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37700 () Bool)

(assert start!37700)

(declare-fun b_free!8803 () Bool)

(declare-fun b_next!8803 () Bool)

(assert (=> start!37700 (= b_free!8803 (not b_next!8803))))

(declare-fun tp!31161 () Bool)

(declare-fun b_and!16045 () Bool)

(assert (=> start!37700 (= tp!31161 b_and!16045)))

(declare-fun b!386363 () Bool)

(declare-fun e!234396 () Bool)

(declare-fun e!234394 () Bool)

(declare-fun mapRes!15777 () Bool)

(assert (=> b!386363 (= e!234396 (and e!234394 mapRes!15777))))

(declare-fun condMapEmpty!15777 () Bool)

(declare-datatypes ((V!13739 0))(
  ( (V!13740 (val!4782 Int)) )
))
(declare-datatypes ((ValueCell!4394 0))(
  ( (ValueCellFull!4394 (v!6979 V!13739)) (EmptyCell!4394) )
))
(declare-datatypes ((array!22847 0))(
  ( (array!22848 (arr!10892 (Array (_ BitVec 32) ValueCell!4394)) (size!11244 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22847)

(declare-fun mapDefault!15777 () ValueCell!4394)

