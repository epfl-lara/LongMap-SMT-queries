; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38812 () Bool)

(assert start!38812)

(declare-fun b!405026 () Bool)

(declare-fun e!243586 () Bool)

(declare-fun e!243583 () Bool)

(declare-fun mapRes!16968 () Bool)

(assert (=> b!405026 (= e!243586 (and e!243583 mapRes!16968))))

(declare-fun condMapEmpty!16968 () Bool)

(declare-datatypes ((V!14747 0))(
  ( (V!14748 (val!5160 Int)) )
))
(declare-datatypes ((ValueCell!4772 0))(
  ( (ValueCellFull!4772 (v!7407 V!14747)) (EmptyCell!4772) )
))
(declare-datatypes ((array!24357 0))(
  ( (array!24358 (arr!11628 (Array (_ BitVec 32) ValueCell!4772)) (size!11980 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24357)

(declare-fun mapDefault!16968 () ValueCell!4772)

