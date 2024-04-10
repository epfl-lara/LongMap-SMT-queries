; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70302 () Bool)

(assert start!70302)

(declare-fun b_free!12677 () Bool)

(declare-fun b_next!12677 () Bool)

(assert (=> start!70302 (= b_free!12677 (not b_next!12677))))

(declare-fun tp!44755 () Bool)

(declare-fun b_and!21477 () Bool)

(assert (=> start!70302 (= tp!44755 b_and!21477)))

(declare-fun b!816751 () Bool)

(declare-fun e!453118 () Bool)

(declare-fun e!453117 () Bool)

(declare-fun mapRes!23170 () Bool)

(assert (=> b!816751 (= e!453118 (and e!453117 mapRes!23170))))

(declare-fun condMapEmpty!23170 () Bool)

(declare-datatypes ((V!24183 0))(
  ( (V!24184 (val!7241 Int)) )
))
(declare-datatypes ((ValueCell!6778 0))(
  ( (ValueCellFull!6778 (v!9669 V!24183)) (EmptyCell!6778) )
))
(declare-datatypes ((array!44974 0))(
  ( (array!44975 (arr!21544 (Array (_ BitVec 32) ValueCell!6778)) (size!21965 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44974)

(declare-fun mapDefault!23170 () ValueCell!6778)

