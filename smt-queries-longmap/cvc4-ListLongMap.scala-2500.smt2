; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38822 () Bool)

(assert start!38822)

(declare-fun b!405221 () Bool)

(declare-fun e!243673 () Bool)

(declare-fun e!243675 () Bool)

(declare-fun mapRes!16983 () Bool)

(assert (=> b!405221 (= e!243673 (and e!243675 mapRes!16983))))

(declare-fun condMapEmpty!16983 () Bool)

(declare-datatypes ((V!14759 0))(
  ( (V!14760 (val!5165 Int)) )
))
(declare-datatypes ((ValueCell!4777 0))(
  ( (ValueCellFull!4777 (v!7412 V!14759)) (EmptyCell!4777) )
))
(declare-datatypes ((array!24375 0))(
  ( (array!24376 (arr!11637 (Array (_ BitVec 32) ValueCell!4777)) (size!11989 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24375)

(declare-fun mapDefault!16983 () ValueCell!4777)

