; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70030 () Bool)

(assert start!70030)

(declare-fun b_free!12451 () Bool)

(declare-fun b_next!12451 () Bool)

(assert (=> start!70030 (= b_free!12451 (not b_next!12451))))

(declare-fun tp!44068 () Bool)

(declare-fun b_and!21223 () Bool)

(assert (=> start!70030 (= tp!44068 b_and!21223)))

(declare-fun b!813890 () Bool)

(declare-fun e!451066 () Bool)

(declare-fun e!451064 () Bool)

(declare-fun mapRes!22822 () Bool)

(assert (=> b!813890 (= e!451066 (and e!451064 mapRes!22822))))

(declare-fun condMapEmpty!22822 () Bool)

(declare-datatypes ((V!23883 0))(
  ( (V!23884 (val!7128 Int)) )
))
(declare-datatypes ((ValueCell!6665 0))(
  ( (ValueCellFull!6665 (v!9555 V!23883)) (EmptyCell!6665) )
))
(declare-datatypes ((array!44530 0))(
  ( (array!44531 (arr!21325 (Array (_ BitVec 32) ValueCell!6665)) (size!21746 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44530)

(declare-fun mapDefault!22822 () ValueCell!6665)

