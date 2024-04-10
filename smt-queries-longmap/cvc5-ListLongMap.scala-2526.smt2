; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38974 () Bool)

(assert start!38974)

(declare-fun b!408185 () Bool)

(declare-fun e!245043 () Bool)

(declare-fun e!245046 () Bool)

(declare-fun mapRes!17211 () Bool)

(assert (=> b!408185 (= e!245043 (and e!245046 mapRes!17211))))

(declare-fun condMapEmpty!17211 () Bool)

(declare-datatypes ((V!14963 0))(
  ( (V!14964 (val!5241 Int)) )
))
(declare-datatypes ((ValueCell!4853 0))(
  ( (ValueCellFull!4853 (v!7488 V!14963)) (EmptyCell!4853) )
))
(declare-datatypes ((array!24665 0))(
  ( (array!24666 (arr!11782 (Array (_ BitVec 32) ValueCell!4853)) (size!12134 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24665)

(declare-fun mapDefault!17211 () ValueCell!4853)

