; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96278 () Bool)

(assert start!96278)

(declare-fun b_free!22931 () Bool)

(declare-fun b_next!22931 () Bool)

(assert (=> start!96278 (= b_free!22931 (not b_next!22931))))

(declare-fun tp!80641 () Bool)

(declare-fun b_and!36537 () Bool)

(assert (=> start!96278 (= tp!80641 b_and!36537)))

(declare-fun res!730035 () Bool)

(declare-fun e!624593 () Bool)

(assert (=> start!96278 (=> (not res!730035) (not e!624593))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96278 (= res!730035 (validMask!0 mask!1414))))

(assert (=> start!96278 e!624593))

(assert (=> start!96278 tp!80641))

(assert (=> start!96278 true))

(declare-fun tp_is_empty!26933 () Bool)

(assert (=> start!96278 tp_is_empty!26933))

(declare-datatypes ((array!70781 0))(
  ( (array!70782 (arr!34064 (Array (_ BitVec 32) (_ BitVec 64))) (size!34600 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70781)

(declare-fun array_inv!26252 (array!70781) Bool)

(assert (=> start!96278 (array_inv!26252 _keys!1070)))

(declare-datatypes ((V!41037 0))(
  ( (V!41038 (val!13523 Int)) )
))
(declare-datatypes ((ValueCell!12757 0))(
  ( (ValueCellFull!12757 (v!16144 V!41037)) (EmptyCell!12757) )
))
(declare-datatypes ((array!70783 0))(
  ( (array!70784 (arr!34065 (Array (_ BitVec 32) ValueCell!12757)) (size!34601 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70783)

(declare-fun e!624591 () Bool)

(declare-fun array_inv!26253 (array!70783) Bool)

(assert (=> start!96278 (and (array_inv!26253 _values!874) e!624591)))

(declare-fun b!1093963 () Bool)

(declare-fun res!730030 () Bool)

(assert (=> b!1093963 (=> (not res!730030) (not e!624593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70781 (_ BitVec 32)) Bool)

(assert (=> b!1093963 (= res!730030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093964 () Bool)

(declare-fun e!624592 () Bool)

(assert (=> b!1093964 (= e!624592 (not true))))

(declare-datatypes ((tuple2!17202 0))(
  ( (tuple2!17203 (_1!8612 (_ BitVec 64)) (_2!8612 V!41037)) )
))
(declare-datatypes ((List!23799 0))(
  ( (Nil!23796) (Cons!23795 (h!25004 tuple2!17202) (t!33788 List!23799)) )
))
(declare-datatypes ((ListLongMap!15171 0))(
  ( (ListLongMap!15172 (toList!7601 List!23799)) )
))
(declare-fun lt!489371 () ListLongMap!15171)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41037)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41037)

(declare-fun getCurrentListMap!4357 (array!70781 array!70783 (_ BitVec 32) (_ BitVec 32) V!41037 V!41037 (_ BitVec 32) Int) ListLongMap!15171)

(assert (=> b!1093964 (= lt!489371 (getCurrentListMap!4357 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489372 () ListLongMap!15171)

(declare-fun lt!489373 () array!70781)

(declare-fun lt!489369 () array!70783)

(assert (=> b!1093964 (= lt!489372 (getCurrentListMap!4357 lt!489373 lt!489369 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489368 () ListLongMap!15171)

(declare-fun lt!489370 () ListLongMap!15171)

(assert (=> b!1093964 (and (= lt!489368 lt!489370) (= lt!489370 lt!489368))))

(declare-fun lt!489376 () ListLongMap!15171)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!920 (ListLongMap!15171 (_ BitVec 64)) ListLongMap!15171)

(assert (=> b!1093964 (= lt!489370 (-!920 lt!489376 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36006 0))(
  ( (Unit!36007) )
))
(declare-fun lt!489374 () Unit!36006)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!176 (array!70781 array!70783 (_ BitVec 32) (_ BitVec 32) V!41037 V!41037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36006)

(assert (=> b!1093964 (= lt!489374 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!176 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4117 (array!70781 array!70783 (_ BitVec 32) (_ BitVec 32) V!41037 V!41037 (_ BitVec 32) Int) ListLongMap!15171)

(assert (=> b!1093964 (= lt!489368 (getCurrentListMapNoExtraKeys!4117 lt!489373 lt!489369 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2254 (Int (_ BitVec 64)) V!41037)

(assert (=> b!1093964 (= lt!489369 (array!70784 (store (arr!34065 _values!874) i!650 (ValueCellFull!12757 (dynLambda!2254 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34601 _values!874)))))

(assert (=> b!1093964 (= lt!489376 (getCurrentListMapNoExtraKeys!4117 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093964 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!489375 () Unit!36006)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70781 (_ BitVec 64) (_ BitVec 32)) Unit!36006)

(assert (=> b!1093964 (= lt!489375 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1093965 () Bool)

(declare-fun e!624594 () Bool)

(assert (=> b!1093965 (= e!624594 tp_is_empty!26933)))

(declare-fun mapNonEmpty!42154 () Bool)

(declare-fun mapRes!42154 () Bool)

(declare-fun tp!80642 () Bool)

(declare-fun e!624595 () Bool)

(assert (=> mapNonEmpty!42154 (= mapRes!42154 (and tp!80642 e!624595))))

(declare-fun mapValue!42154 () ValueCell!12757)

(declare-fun mapRest!42154 () (Array (_ BitVec 32) ValueCell!12757))

(declare-fun mapKey!42154 () (_ BitVec 32))

(assert (=> mapNonEmpty!42154 (= (arr!34065 _values!874) (store mapRest!42154 mapKey!42154 mapValue!42154))))

(declare-fun b!1093966 () Bool)

(declare-fun res!730028 () Bool)

(assert (=> b!1093966 (=> (not res!730028) (not e!624593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093966 (= res!730028 (validKeyInArray!0 k!904))))

(declare-fun b!1093967 () Bool)

(assert (=> b!1093967 (= e!624593 e!624592)))

(declare-fun res!730034 () Bool)

(assert (=> b!1093967 (=> (not res!730034) (not e!624592))))

(assert (=> b!1093967 (= res!730034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489373 mask!1414))))

(assert (=> b!1093967 (= lt!489373 (array!70782 (store (arr!34064 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34600 _keys!1070)))))

(declare-fun b!1093968 () Bool)

(assert (=> b!1093968 (= e!624591 (and e!624594 mapRes!42154))))

(declare-fun condMapEmpty!42154 () Bool)

(declare-fun mapDefault!42154 () ValueCell!12757)

