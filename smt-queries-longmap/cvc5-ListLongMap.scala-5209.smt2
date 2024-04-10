; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70286 () Bool)

(assert start!70286)

(declare-fun b_free!12661 () Bool)

(declare-fun b_next!12661 () Bool)

(assert (=> start!70286 (= b_free!12661 (not b_next!12661))))

(declare-fun tp!44707 () Bool)

(declare-fun b_and!21461 () Bool)

(assert (=> start!70286 (= tp!44707 b_and!21461)))

(declare-fun b!816559 () Bool)

(declare-fun e!452971 () Bool)

(declare-fun e!452973 () Bool)

(declare-fun mapRes!23146 () Bool)

(assert (=> b!816559 (= e!452971 (and e!452973 mapRes!23146))))

(declare-fun condMapEmpty!23146 () Bool)

(declare-datatypes ((V!24163 0))(
  ( (V!24164 (val!7233 Int)) )
))
(declare-datatypes ((ValueCell!6770 0))(
  ( (ValueCellFull!6770 (v!9661 V!24163)) (EmptyCell!6770) )
))
(declare-datatypes ((array!44944 0))(
  ( (array!44945 (arr!21529 (Array (_ BitVec 32) ValueCell!6770)) (size!21950 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44944)

(declare-fun mapDefault!23146 () ValueCell!6770)

