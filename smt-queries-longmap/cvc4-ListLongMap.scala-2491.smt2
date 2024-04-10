; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38768 () Bool)

(assert start!38768)

(declare-fun b!404168 () Bool)

(declare-fun e!243190 () Bool)

(declare-fun e!243189 () Bool)

(declare-fun mapRes!16902 () Bool)

(assert (=> b!404168 (= e!243190 (and e!243189 mapRes!16902))))

(declare-fun condMapEmpty!16902 () Bool)

(declare-datatypes ((V!14687 0))(
  ( (V!14688 (val!5138 Int)) )
))
(declare-datatypes ((ValueCell!4750 0))(
  ( (ValueCellFull!4750 (v!7385 V!14687)) (EmptyCell!4750) )
))
(declare-datatypes ((array!24271 0))(
  ( (array!24272 (arr!11585 (Array (_ BitVec 32) ValueCell!4750)) (size!11937 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24271)

(declare-fun mapDefault!16902 () ValueCell!4750)

