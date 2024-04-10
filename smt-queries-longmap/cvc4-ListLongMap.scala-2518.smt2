; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38930 () Bool)

(assert start!38930)

(declare-fun b!407327 () Bool)

(declare-fun e!244649 () Bool)

(declare-fun e!244650 () Bool)

(declare-fun mapRes!17145 () Bool)

(assert (=> b!407327 (= e!244649 (and e!244650 mapRes!17145))))

(declare-fun condMapEmpty!17145 () Bool)

(declare-datatypes ((V!14903 0))(
  ( (V!14904 (val!5219 Int)) )
))
(declare-datatypes ((ValueCell!4831 0))(
  ( (ValueCellFull!4831 (v!7466 V!14903)) (EmptyCell!4831) )
))
(declare-datatypes ((array!24581 0))(
  ( (array!24582 (arr!11740 (Array (_ BitVec 32) ValueCell!4831)) (size!12092 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24581)

(declare-fun mapDefault!17145 () ValueCell!4831)

