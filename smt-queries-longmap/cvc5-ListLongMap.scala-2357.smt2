; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37604 () Bool)

(assert start!37604)

(declare-fun b_free!8731 () Bool)

(declare-fun b_next!8731 () Bool)

(assert (=> start!37604 (= b_free!8731 (not b_next!8731))))

(declare-fun tp!30908 () Bool)

(declare-fun b_and!15973 () Bool)

(assert (=> start!37604 (= tp!30908 b_and!15973)))

(declare-fun b!384637 () Bool)

(declare-fun e!233504 () Bool)

(declare-fun e!233508 () Bool)

(declare-fun mapRes!15633 () Bool)

(assert (=> b!384637 (= e!233504 (and e!233508 mapRes!15633))))

(declare-fun condMapEmpty!15633 () Bool)

(declare-datatypes ((V!13611 0))(
  ( (V!13612 (val!4734 Int)) )
))
(declare-datatypes ((ValueCell!4346 0))(
  ( (ValueCellFull!4346 (v!6931 V!13611)) (EmptyCell!4346) )
))
(declare-datatypes ((array!22661 0))(
  ( (array!22662 (arr!10799 (Array (_ BitVec 32) ValueCell!4346)) (size!11151 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22661)

(declare-fun mapDefault!15633 () ValueCell!4346)

