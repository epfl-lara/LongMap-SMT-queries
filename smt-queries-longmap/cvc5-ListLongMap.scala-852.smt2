; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20208 () Bool)

(assert start!20208)

(declare-fun b_free!4867 () Bool)

(declare-fun b_next!4867 () Bool)

(assert (=> start!20208 (= b_free!4867 (not b_next!4867))))

(declare-fun tp!17632 () Bool)

(declare-fun b_and!11613 () Bool)

(assert (=> start!20208 (= tp!17632 b_and!11613)))

(declare-fun b!198554 () Bool)

(declare-fun e!130483 () Bool)

(declare-fun e!130482 () Bool)

(declare-fun mapRes!8153 () Bool)

(assert (=> b!198554 (= e!130483 (and e!130482 mapRes!8153))))

(declare-fun condMapEmpty!8153 () Bool)

(declare-datatypes ((V!5945 0))(
  ( (V!5946 (val!2406 Int)) )
))
(declare-datatypes ((ValueCell!2018 0))(
  ( (ValueCellFull!2018 (v!4376 V!5945)) (EmptyCell!2018) )
))
(declare-datatypes ((array!8695 0))(
  ( (array!8696 (arr!4098 (Array (_ BitVec 32) ValueCell!2018)) (size!4423 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8695)

(declare-fun mapDefault!8153 () ValueCell!2018)

