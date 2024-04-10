; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38978 () Bool)

(assert start!38978)

(declare-fun b!408263 () Bool)

(declare-fun e!245079 () Bool)

(declare-fun e!245081 () Bool)

(declare-fun mapRes!17217 () Bool)

(assert (=> b!408263 (= e!245079 (and e!245081 mapRes!17217))))

(declare-fun condMapEmpty!17217 () Bool)

(declare-datatypes ((V!14967 0))(
  ( (V!14968 (val!5243 Int)) )
))
(declare-datatypes ((ValueCell!4855 0))(
  ( (ValueCellFull!4855 (v!7490 V!14967)) (EmptyCell!4855) )
))
(declare-datatypes ((array!24671 0))(
  ( (array!24672 (arr!11785 (Array (_ BitVec 32) ValueCell!4855)) (size!12137 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24671)

(declare-fun mapDefault!17217 () ValueCell!4855)

