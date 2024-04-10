; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70058 () Bool)

(assert start!70058)

(declare-fun b_free!12479 () Bool)

(declare-fun b_next!12479 () Bool)

(assert (=> start!70058 (= b_free!12479 (not b_next!12479))))

(declare-fun tp!44152 () Bool)

(declare-fun b_and!21251 () Bool)

(assert (=> start!70058 (= tp!44152 b_and!21251)))

(declare-fun b!814184 () Bool)

(declare-fun e!451275 () Bool)

(declare-fun tp_is_empty!14189 () Bool)

(assert (=> b!814184 (= e!451275 tp_is_empty!14189)))

(declare-fun b!814185 () Bool)

(declare-fun e!451276 () Bool)

(declare-fun mapRes!22864 () Bool)

(assert (=> b!814185 (= e!451276 (and e!451275 mapRes!22864))))

(declare-fun condMapEmpty!22864 () Bool)

(declare-datatypes ((V!23919 0))(
  ( (V!23920 (val!7142 Int)) )
))
(declare-datatypes ((ValueCell!6679 0))(
  ( (ValueCellFull!6679 (v!9569 V!23919)) (EmptyCell!6679) )
))
(declare-datatypes ((array!44584 0))(
  ( (array!44585 (arr!21352 (Array (_ BitVec 32) ValueCell!6679)) (size!21773 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44584)

(declare-fun mapDefault!22864 () ValueCell!6679)

