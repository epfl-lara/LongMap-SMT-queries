; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96920 () Bool)

(assert start!96920)

(declare-fun b_free!23213 () Bool)

(declare-fun b_next!23213 () Bool)

(assert (=> start!96920 (= b_free!23213 (not b_next!23213))))

(declare-fun tp!81599 () Bool)

(declare-fun b_and!37243 () Bool)

(assert (=> start!96920 (= tp!81599 b_and!37243)))

(declare-fun b!1102695 () Bool)

(declare-fun res!735747 () Bool)

(declare-fun e!629382 () Bool)

(assert (=> b!1102695 (=> (not res!735747) (not e!629382))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71447 0))(
  ( (array!71448 (arr!34384 (Array (_ BitVec 32) (_ BitVec 64))) (size!34920 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71447)

(declare-datatypes ((V!41477 0))(
  ( (V!41478 (val!13688 Int)) )
))
(declare-datatypes ((ValueCell!12922 0))(
  ( (ValueCellFull!12922 (v!16319 V!41477)) (EmptyCell!12922) )
))
(declare-datatypes ((array!71449 0))(
  ( (array!71450 (arr!34385 (Array (_ BitVec 32) ValueCell!12922)) (size!34921 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71449)

(assert (=> b!1102695 (= res!735747 (and (= (size!34921 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34920 _keys!1070) (size!34921 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102696 () Bool)

(declare-fun res!735754 () Bool)

(assert (=> b!1102696 (=> (not res!735754) (not e!629382))))

(declare-datatypes ((List!24028 0))(
  ( (Nil!24025) (Cons!24024 (h!25233 (_ BitVec 64)) (t!34287 List!24028)) )
))
(declare-fun arrayNoDuplicates!0 (array!71447 (_ BitVec 32) List!24028) Bool)

(assert (=> b!1102696 (= res!735754 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24025))))

(declare-fun b!1102697 () Bool)

(declare-fun e!629378 () Bool)

(declare-fun tp_is_empty!27263 () Bool)

(assert (=> b!1102697 (= e!629378 tp_is_empty!27263)))

(declare-fun b!1102698 () Bool)

(declare-fun e!629380 () Bool)

(assert (=> b!1102698 (= e!629380 tp_is_empty!27263)))

(declare-fun res!735753 () Bool)

(assert (=> start!96920 (=> (not res!735753) (not e!629382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96920 (= res!735753 (validMask!0 mask!1414))))

(assert (=> start!96920 e!629382))

(assert (=> start!96920 tp!81599))

(assert (=> start!96920 true))

(assert (=> start!96920 tp_is_empty!27263))

(declare-fun array_inv!26482 (array!71447) Bool)

(assert (=> start!96920 (array_inv!26482 _keys!1070)))

(declare-fun e!629381 () Bool)

(declare-fun array_inv!26483 (array!71449) Bool)

(assert (=> start!96920 (and (array_inv!26483 _values!874) e!629381)))

(declare-fun b!1102699 () Bool)

(declare-fun mapRes!42688 () Bool)

(assert (=> b!1102699 (= e!629381 (and e!629378 mapRes!42688))))

(declare-fun condMapEmpty!42688 () Bool)

(declare-fun mapDefault!42688 () ValueCell!12922)

