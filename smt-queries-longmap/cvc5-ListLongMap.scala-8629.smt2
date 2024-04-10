; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105062 () Bool)

(assert start!105062)

(declare-fun b_free!26809 () Bool)

(declare-fun b_next!26809 () Bool)

(assert (=> start!105062 (= b_free!26809 (not b_next!26809))))

(declare-fun tp!93926 () Bool)

(declare-fun b_and!44605 () Bool)

(assert (=> start!105062 (= tp!93926 b_and!44605)))

(declare-fun mapIsEmpty!49336 () Bool)

(declare-fun mapRes!49336 () Bool)

(assert (=> mapIsEmpty!49336 mapRes!49336))

(declare-fun b!1252116 () Bool)

(declare-fun e!711115 () Bool)

(declare-fun tp_is_empty!31711 () Bool)

(assert (=> b!1252116 (= e!711115 tp_is_empty!31711)))

(declare-fun b!1252117 () Bool)

(declare-fun e!711114 () Bool)

(assert (=> b!1252117 (= e!711114 (and e!711115 mapRes!49336))))

(declare-fun condMapEmpty!49336 () Bool)

(declare-datatypes ((V!47647 0))(
  ( (V!47648 (val!15918 Int)) )
))
(declare-datatypes ((ValueCell!15092 0))(
  ( (ValueCellFull!15092 (v!18616 V!47647)) (EmptyCell!15092) )
))
(declare-datatypes ((array!81084 0))(
  ( (array!81085 (arr!39106 (Array (_ BitVec 32) ValueCell!15092)) (size!39642 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81084)

(declare-fun mapDefault!49336 () ValueCell!15092)

