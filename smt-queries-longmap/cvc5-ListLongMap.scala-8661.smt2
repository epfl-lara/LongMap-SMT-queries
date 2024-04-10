; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105328 () Bool)

(assert start!105328)

(declare-fun b_free!27001 () Bool)

(declare-fun b_next!27001 () Bool)

(assert (=> start!105328 (= b_free!27001 (not b_next!27001))))

(declare-fun tp!94514 () Bool)

(declare-fun b_and!44839 () Bool)

(assert (=> start!105328 (= tp!94514 b_and!44839)))

(declare-fun b!1254994 () Bool)

(declare-fun e!713203 () Bool)

(declare-fun tp_is_empty!31903 () Bool)

(assert (=> b!1254994 (= e!713203 tp_is_empty!31903)))

(declare-fun b!1254995 () Bool)

(declare-fun e!713201 () Bool)

(declare-fun mapRes!49636 () Bool)

(assert (=> b!1254995 (= e!713201 (and e!713203 mapRes!49636))))

(declare-fun condMapEmpty!49636 () Bool)

(declare-datatypes ((V!47903 0))(
  ( (V!47904 (val!16014 Int)) )
))
(declare-datatypes ((ValueCell!15188 0))(
  ( (ValueCellFull!15188 (v!18714 V!47903)) (EmptyCell!15188) )
))
(declare-datatypes ((array!81460 0))(
  ( (array!81461 (arr!39290 (Array (_ BitVec 32) ValueCell!15188)) (size!39826 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81460)

(declare-fun mapDefault!49636 () ValueCell!15188)

