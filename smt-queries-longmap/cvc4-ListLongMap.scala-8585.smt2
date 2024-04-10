; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104744 () Bool)

(assert start!104744)

(declare-fun b_free!26549 () Bool)

(declare-fun b_next!26549 () Bool)

(assert (=> start!104744 (= b_free!26549 (not b_next!26549))))

(declare-fun tp!93137 () Bool)

(declare-fun b_and!44317 () Bool)

(assert (=> start!104744 (= tp!93137 b_and!44317)))

(declare-fun mapIsEmpty!48937 () Bool)

(declare-fun mapRes!48937 () Bool)

(assert (=> mapIsEmpty!48937 mapRes!48937))

(declare-fun b!1248654 () Bool)

(declare-fun e!708574 () Bool)

(declare-fun tp_is_empty!31451 () Bool)

(assert (=> b!1248654 (= e!708574 tp_is_empty!31451)))

(declare-fun b!1248655 () Bool)

(declare-fun e!708577 () Bool)

(assert (=> b!1248655 (= e!708577 (and e!708574 mapRes!48937))))

(declare-fun condMapEmpty!48937 () Bool)

(declare-datatypes ((V!47299 0))(
  ( (V!47300 (val!15788 Int)) )
))
(declare-datatypes ((ValueCell!14962 0))(
  ( (ValueCellFull!14962 (v!18484 V!47299)) (EmptyCell!14962) )
))
(declare-datatypes ((array!80594 0))(
  ( (array!80595 (arr!38864 (Array (_ BitVec 32) ValueCell!14962)) (size!39400 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80594)

(declare-fun mapDefault!48937 () ValueCell!14962)

