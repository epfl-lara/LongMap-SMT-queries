; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38908 () Bool)

(assert start!38908)

(declare-fun b!406898 () Bool)

(declare-fun e!244449 () Bool)

(declare-fun e!244447 () Bool)

(declare-fun mapRes!17112 () Bool)

(assert (=> b!406898 (= e!244449 (and e!244447 mapRes!17112))))

(declare-fun condMapEmpty!17112 () Bool)

(declare-datatypes ((V!14875 0))(
  ( (V!14876 (val!5208 Int)) )
))
(declare-datatypes ((ValueCell!4820 0))(
  ( (ValueCellFull!4820 (v!7455 V!14875)) (EmptyCell!4820) )
))
(declare-datatypes ((array!24541 0))(
  ( (array!24542 (arr!11720 (Array (_ BitVec 32) ValueCell!4820)) (size!12072 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24541)

(declare-fun mapDefault!17112 () ValueCell!4820)

