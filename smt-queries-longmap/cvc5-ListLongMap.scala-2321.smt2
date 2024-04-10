; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37388 () Bool)

(assert start!37388)

(declare-fun b_free!8515 () Bool)

(declare-fun b_next!8515 () Bool)

(assert (=> start!37388 (= b_free!8515 (not b_next!8515))))

(declare-fun tp!30261 () Bool)

(declare-fun b_and!15757 () Bool)

(assert (=> start!37388 (= tp!30261 b_and!15757)))

(declare-fun b!380040 () Bool)

(declare-fun e!231179 () Bool)

(declare-fun e!231181 () Bool)

(declare-fun mapRes!15309 () Bool)

(assert (=> b!380040 (= e!231179 (and e!231181 mapRes!15309))))

(declare-fun condMapEmpty!15309 () Bool)

(declare-datatypes ((V!13323 0))(
  ( (V!13324 (val!4626 Int)) )
))
(declare-datatypes ((ValueCell!4238 0))(
  ( (ValueCellFull!4238 (v!6823 V!13323)) (EmptyCell!4238) )
))
(declare-datatypes ((array!22247 0))(
  ( (array!22248 (arr!10592 (Array (_ BitVec 32) ValueCell!4238)) (size!10944 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22247)

(declare-fun mapDefault!15309 () ValueCell!4238)

