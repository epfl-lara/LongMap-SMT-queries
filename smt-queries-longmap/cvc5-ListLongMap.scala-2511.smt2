; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38884 () Bool)

(assert start!38884)

(declare-fun b!406430 () Bool)

(declare-fun e!244232 () Bool)

(declare-fun e!244231 () Bool)

(declare-fun mapRes!17076 () Bool)

(assert (=> b!406430 (= e!244232 (and e!244231 mapRes!17076))))

(declare-fun condMapEmpty!17076 () Bool)

(declare-datatypes ((V!14843 0))(
  ( (V!14844 (val!5196 Int)) )
))
(declare-datatypes ((ValueCell!4808 0))(
  ( (ValueCellFull!4808 (v!7443 V!14843)) (EmptyCell!4808) )
))
(declare-datatypes ((array!24497 0))(
  ( (array!24498 (arr!11698 (Array (_ BitVec 32) ValueCell!4808)) (size!12050 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24497)

(declare-fun mapDefault!17076 () ValueCell!4808)

