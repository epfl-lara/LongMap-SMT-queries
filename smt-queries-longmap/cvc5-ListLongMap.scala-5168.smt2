; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69994 () Bool)

(assert start!69994)

(declare-fun b_free!12415 () Bool)

(declare-fun b_next!12415 () Bool)

(assert (=> start!69994 (= b_free!12415 (not b_next!12415))))

(declare-fun tp!43959 () Bool)

(declare-fun b_and!21187 () Bool)

(assert (=> start!69994 (= tp!43959 b_and!21187)))

(declare-fun b!813512 () Bool)

(declare-fun e!450795 () Bool)

(declare-fun e!450796 () Bool)

(declare-fun mapRes!22768 () Bool)

(assert (=> b!813512 (= e!450795 (and e!450796 mapRes!22768))))

(declare-fun condMapEmpty!22768 () Bool)

(declare-datatypes ((V!23835 0))(
  ( (V!23836 (val!7110 Int)) )
))
(declare-datatypes ((ValueCell!6647 0))(
  ( (ValueCellFull!6647 (v!9537 V!23835)) (EmptyCell!6647) )
))
(declare-datatypes ((array!44460 0))(
  ( (array!44461 (arr!21290 (Array (_ BitVec 32) ValueCell!6647)) (size!21711 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44460)

(declare-fun mapDefault!22768 () ValueCell!6647)

