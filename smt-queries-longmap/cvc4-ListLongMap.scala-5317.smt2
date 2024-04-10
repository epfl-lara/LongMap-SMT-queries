; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71146 () Bool)

(assert start!71146)

(declare-fun b_free!13313 () Bool)

(declare-fun b_next!13313 () Bool)

(assert (=> start!71146 (= b_free!13313 (not b_next!13313))))

(declare-fun tp!46698 () Bool)

(declare-fun b_and!22239 () Bool)

(assert (=> start!71146 (= tp!46698 b_and!22239)))

(declare-fun b!826364 () Bool)

(declare-fun e!460142 () Bool)

(declare-fun e!460144 () Bool)

(declare-fun mapRes!24160 () Bool)

(assert (=> b!826364 (= e!460142 (and e!460144 mapRes!24160))))

(declare-fun condMapEmpty!24160 () Bool)

(declare-datatypes ((V!25031 0))(
  ( (V!25032 (val!7559 Int)) )
))
(declare-datatypes ((ValueCell!7096 0))(
  ( (ValueCellFull!7096 (v!9993 V!25031)) (EmptyCell!7096) )
))
(declare-datatypes ((array!46228 0))(
  ( (array!46229 (arr!22159 (Array (_ BitVec 32) ValueCell!7096)) (size!22580 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46228)

(declare-fun mapDefault!24160 () ValueCell!7096)

