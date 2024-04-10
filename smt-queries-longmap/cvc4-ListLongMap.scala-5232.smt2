; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70460 () Bool)

(assert start!70460)

(declare-fun b_free!12803 () Bool)

(declare-fun b_next!12803 () Bool)

(assert (=> start!70460 (= b_free!12803 (not b_next!12803))))

(declare-fun tp!45139 () Bool)

(declare-fun b_and!21623 () Bool)

(assert (=> start!70460 (= tp!45139 b_and!21623)))

(declare-fun b!818451 () Bool)

(declare-fun e!454335 () Bool)

(declare-fun e!454332 () Bool)

(declare-fun mapRes!23365 () Bool)

(assert (=> b!818451 (= e!454335 (and e!454332 mapRes!23365))))

(declare-fun condMapEmpty!23365 () Bool)

(declare-datatypes ((V!24351 0))(
  ( (V!24352 (val!7304 Int)) )
))
(declare-datatypes ((ValueCell!6841 0))(
  ( (ValueCellFull!6841 (v!9733 V!24351)) (EmptyCell!6841) )
))
(declare-datatypes ((array!45224 0))(
  ( (array!45225 (arr!21667 (Array (_ BitVec 32) ValueCell!6841)) (size!22088 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45224)

(declare-fun mapDefault!23365 () ValueCell!6841)

