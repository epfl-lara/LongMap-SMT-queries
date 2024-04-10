; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105390 () Bool)

(assert start!105390)

(declare-fun b_free!27049 () Bool)

(declare-fun b_next!27049 () Bool)

(assert (=> start!105390 (= b_free!27049 (not b_next!27049))))

(declare-fun tp!94660 () Bool)

(declare-fun b_and!44895 () Bool)

(assert (=> start!105390 (= tp!94660 b_and!44895)))

(declare-fun b!1255585 () Bool)

(declare-fun e!713617 () Bool)

(declare-fun tp_is_empty!31951 () Bool)

(assert (=> b!1255585 (= e!713617 tp_is_empty!31951)))

(declare-fun b!1255586 () Bool)

(declare-fun e!713621 () Bool)

(declare-fun mapRes!49711 () Bool)

(assert (=> b!1255586 (= e!713621 (and e!713617 mapRes!49711))))

(declare-fun condMapEmpty!49711 () Bool)

(declare-datatypes ((V!47967 0))(
  ( (V!47968 (val!16038 Int)) )
))
(declare-datatypes ((ValueCell!15212 0))(
  ( (ValueCellFull!15212 (v!18738 V!47967)) (EmptyCell!15212) )
))
(declare-datatypes ((array!81548 0))(
  ( (array!81549 (arr!39333 (Array (_ BitVec 32) ValueCell!15212)) (size!39869 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81548)

(declare-fun mapDefault!49711 () ValueCell!15212)

