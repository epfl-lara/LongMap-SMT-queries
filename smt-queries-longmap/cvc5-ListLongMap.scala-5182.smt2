; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70078 () Bool)

(assert start!70078)

(declare-fun b_free!12499 () Bool)

(declare-fun b_next!12499 () Bool)

(assert (=> start!70078 (= b_free!12499 (not b_next!12499))))

(declare-fun tp!44211 () Bool)

(declare-fun b_and!21271 () Bool)

(assert (=> start!70078 (= tp!44211 b_and!21271)))

(declare-fun mapIsEmpty!22894 () Bool)

(declare-fun mapRes!22894 () Bool)

(assert (=> mapIsEmpty!22894 mapRes!22894))

(declare-fun b!814394 () Bool)

(declare-fun e!451428 () Bool)

(declare-fun e!451425 () Bool)

(assert (=> b!814394 (= e!451428 (and e!451425 mapRes!22894))))

(declare-fun condMapEmpty!22894 () Bool)

(declare-datatypes ((V!23947 0))(
  ( (V!23948 (val!7152 Int)) )
))
(declare-datatypes ((ValueCell!6689 0))(
  ( (ValueCellFull!6689 (v!9579 V!23947)) (EmptyCell!6689) )
))
(declare-datatypes ((array!44622 0))(
  ( (array!44623 (arr!21371 (Array (_ BitVec 32) ValueCell!6689)) (size!21792 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44622)

(declare-fun mapDefault!22894 () ValueCell!6689)

