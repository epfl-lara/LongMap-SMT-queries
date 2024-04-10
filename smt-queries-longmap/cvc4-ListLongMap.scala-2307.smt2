; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37308 () Bool)

(assert start!37308)

(declare-fun b_free!8435 () Bool)

(declare-fun b_next!8435 () Bool)

(assert (=> start!37308 (= b_free!8435 (not b_next!8435))))

(declare-fun tp!30020 () Bool)

(declare-fun b_and!15677 () Bool)

(assert (=> start!37308 (= tp!30020 b_and!15677)))

(declare-fun b!378231 () Bool)

(declare-fun e!230215 () Bool)

(declare-fun e!230221 () Bool)

(declare-fun mapRes!15189 () Bool)

(assert (=> b!378231 (= e!230215 (and e!230221 mapRes!15189))))

(declare-fun condMapEmpty!15189 () Bool)

(declare-datatypes ((V!13215 0))(
  ( (V!13216 (val!4586 Int)) )
))
(declare-datatypes ((ValueCell!4198 0))(
  ( (ValueCellFull!4198 (v!6783 V!13215)) (EmptyCell!4198) )
))
(declare-datatypes ((array!22093 0))(
  ( (array!22094 (arr!10515 (Array (_ BitVec 32) ValueCell!4198)) (size!10867 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22093)

(declare-fun mapDefault!15189 () ValueCell!4198)

