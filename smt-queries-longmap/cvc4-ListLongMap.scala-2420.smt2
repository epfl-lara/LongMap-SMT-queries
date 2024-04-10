; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38252 () Bool)

(assert start!38252)

(declare-fun mapIsEmpty!16242 () Bool)

(declare-fun mapRes!16242 () Bool)

(assert (=> mapIsEmpty!16242 mapRes!16242))

(declare-fun b!394681 () Bool)

(declare-fun e!238927 () Bool)

(declare-fun e!238931 () Bool)

(assert (=> b!394681 (= e!238927 (and e!238931 mapRes!16242))))

(declare-fun condMapEmpty!16242 () Bool)

(declare-datatypes ((V!14119 0))(
  ( (V!14120 (val!4925 Int)) )
))
(declare-datatypes ((ValueCell!4537 0))(
  ( (ValueCellFull!4537 (v!7170 V!14119)) (EmptyCell!4537) )
))
(declare-datatypes ((array!23429 0))(
  ( (array!23430 (arr!11171 (Array (_ BitVec 32) ValueCell!4537)) (size!11523 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23429)

(declare-fun mapDefault!16242 () ValueCell!4537)

