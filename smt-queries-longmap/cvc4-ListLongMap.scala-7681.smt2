; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96436 () Bool)

(assert start!96436)

(declare-fun b_free!23015 () Bool)

(declare-fun b_next!23015 () Bool)

(assert (=> start!96436 (= b_free!23015 (not b_next!23015))))

(declare-fun tp!80972 () Bool)

(declare-fun b_and!36693 () Bool)

(assert (=> start!96436 (= tp!80972 b_and!36693)))

(declare-fun b!1096370 () Bool)

(declare-fun res!731721 () Bool)

(declare-fun e!625830 () Bool)

(assert (=> b!1096370 (=> (not res!731721) (not e!625830))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71043 0))(
  ( (array!71044 (arr!34193 (Array (_ BitVec 32) (_ BitVec 64))) (size!34729 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71043)

(declare-datatypes ((V!41213 0))(
  ( (V!41214 (val!13589 Int)) )
))
(declare-datatypes ((ValueCell!12823 0))(
  ( (ValueCellFull!12823 (v!16210 V!41213)) (EmptyCell!12823) )
))
(declare-datatypes ((array!71045 0))(
  ( (array!71046 (arr!34194 (Array (_ BitVec 32) ValueCell!12823)) (size!34730 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71045)

(assert (=> b!1096370 (= res!731721 (and (= (size!34730 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34729 _keys!1070) (size!34730 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096371 () Bool)

(declare-fun e!625827 () Bool)

(declare-fun tp_is_empty!27065 () Bool)

(assert (=> b!1096371 (= e!625827 tp_is_empty!27065)))

(declare-fun b!1096372 () Bool)

(declare-fun e!625828 () Bool)

(assert (=> b!1096372 (= e!625828 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41213)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!490127 () array!71043)

(declare-fun zeroValue!831 () V!41213)

(declare-datatypes ((tuple2!17260 0))(
  ( (tuple2!17261 (_1!8641 (_ BitVec 64)) (_2!8641 V!41213)) )
))
(declare-datatypes ((List!23880 0))(
  ( (Nil!23877) (Cons!23876 (h!25085 tuple2!17260) (t!33941 List!23880)) )
))
(declare-datatypes ((ListLongMap!15229 0))(
  ( (ListLongMap!15230 (toList!7630 List!23880)) )
))
(declare-fun lt!490129 () ListLongMap!15229)

(declare-fun getCurrentListMapNoExtraKeys!4146 (array!71043 array!71045 (_ BitVec 32) (_ BitVec 32) V!41213 V!41213 (_ BitVec 32) Int) ListLongMap!15229)

(declare-fun dynLambda!2281 (Int (_ BitVec 64)) V!41213)

(assert (=> b!1096372 (= lt!490129 (getCurrentListMapNoExtraKeys!4146 lt!490127 (array!71046 (store (arr!34194 _values!874) i!650 (ValueCellFull!12823 (dynLambda!2281 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34730 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490126 () ListLongMap!15229)

(assert (=> b!1096372 (= lt!490126 (getCurrentListMapNoExtraKeys!4146 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096372 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36072 0))(
  ( (Unit!36073) )
))
(declare-fun lt!490128 () Unit!36072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71043 (_ BitVec 64) (_ BitVec 32)) Unit!36072)

(assert (=> b!1096372 (= lt!490128 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1096373 () Bool)

(declare-fun res!731728 () Bool)

(assert (=> b!1096373 (=> (not res!731728) (not e!625830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71043 (_ BitVec 32)) Bool)

(assert (=> b!1096373 (= res!731728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42358 () Bool)

(declare-fun mapRes!42358 () Bool)

(declare-fun tp!80971 () Bool)

(assert (=> mapNonEmpty!42358 (= mapRes!42358 (and tp!80971 e!625827))))

(declare-fun mapValue!42358 () ValueCell!12823)

(declare-fun mapRest!42358 () (Array (_ BitVec 32) ValueCell!12823))

(declare-fun mapKey!42358 () (_ BitVec 32))

(assert (=> mapNonEmpty!42358 (= (arr!34194 _values!874) (store mapRest!42358 mapKey!42358 mapValue!42358))))

(declare-fun b!1096374 () Bool)

(declare-fun e!625831 () Bool)

(declare-fun e!625826 () Bool)

(assert (=> b!1096374 (= e!625831 (and e!625826 mapRes!42358))))

(declare-fun condMapEmpty!42358 () Bool)

(declare-fun mapDefault!42358 () ValueCell!12823)

