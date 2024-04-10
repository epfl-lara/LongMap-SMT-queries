; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96274 () Bool)

(assert start!96274)

(declare-fun b_free!22927 () Bool)

(declare-fun b_next!22927 () Bool)

(assert (=> start!96274 (= b_free!22927 (not b_next!22927))))

(declare-fun tp!80630 () Bool)

(declare-fun b_and!36529 () Bool)

(assert (=> start!96274 (= tp!80630 b_and!36529)))

(declare-fun b!1093887 () Bool)

(declare-fun res!729975 () Bool)

(declare-fun e!624559 () Bool)

(assert (=> b!1093887 (=> (not res!729975) (not e!624559))))

(declare-datatypes ((array!70773 0))(
  ( (array!70774 (arr!34060 (Array (_ BitVec 32) (_ BitVec 64))) (size!34596 (_ BitVec 32))) )
))
(declare-fun lt!489317 () array!70773)

(declare-datatypes ((List!23795 0))(
  ( (Nil!23792) (Cons!23791 (h!25000 (_ BitVec 64)) (t!33780 List!23795)) )
))
(declare-fun arrayNoDuplicates!0 (array!70773 (_ BitVec 32) List!23795) Bool)

(assert (=> b!1093887 (= res!729975 (arrayNoDuplicates!0 lt!489317 #b00000000000000000000000000000000 Nil!23792))))

(declare-fun b!1093888 () Bool)

(declare-fun res!729974 () Bool)

(declare-fun e!624555 () Bool)

(assert (=> b!1093888 (=> (not res!729974) (not e!624555))))

(declare-fun _keys!1070 () array!70773)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093888 (= res!729974 (= (select (arr!34060 _keys!1070) i!650) k!904))))

(declare-fun b!1093889 () Bool)

(declare-fun res!729973 () Bool)

(assert (=> b!1093889 (=> (not res!729973) (not e!624555))))

(assert (=> b!1093889 (= res!729973 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34596 _keys!1070))))))

(declare-fun res!729976 () Bool)

(assert (=> start!96274 (=> (not res!729976) (not e!624555))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96274 (= res!729976 (validMask!0 mask!1414))))

(assert (=> start!96274 e!624555))

(assert (=> start!96274 tp!80630))

(assert (=> start!96274 true))

(declare-fun tp_is_empty!26929 () Bool)

(assert (=> start!96274 tp_is_empty!26929))

(declare-fun array_inv!26248 (array!70773) Bool)

(assert (=> start!96274 (array_inv!26248 _keys!1070)))

(declare-datatypes ((V!41033 0))(
  ( (V!41034 (val!13521 Int)) )
))
(declare-datatypes ((ValueCell!12755 0))(
  ( (ValueCellFull!12755 (v!16142 V!41033)) (EmptyCell!12755) )
))
(declare-datatypes ((array!70775 0))(
  ( (array!70776 (arr!34061 (Array (_ BitVec 32) ValueCell!12755)) (size!34597 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70775)

(declare-fun e!624560 () Bool)

(declare-fun array_inv!26249 (array!70775) Bool)

(assert (=> start!96274 (and (array_inv!26249 _values!874) e!624560)))

(declare-fun b!1093890 () Bool)

(declare-fun res!729977 () Bool)

(assert (=> b!1093890 (=> (not res!729977) (not e!624555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093890 (= res!729977 (validKeyInArray!0 k!904))))

(declare-fun b!1093891 () Bool)

(assert (=> b!1093891 (= e!624559 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41033)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17198 0))(
  ( (tuple2!17199 (_1!8610 (_ BitVec 64)) (_2!8610 V!41033)) )
))
(declare-datatypes ((List!23796 0))(
  ( (Nil!23793) (Cons!23792 (h!25001 tuple2!17198) (t!33781 List!23796)) )
))
(declare-datatypes ((ListLongMap!15167 0))(
  ( (ListLongMap!15168 (toList!7599 List!23796)) )
))
(declare-fun lt!489321 () ListLongMap!15167)

(declare-fun zeroValue!831 () V!41033)

(declare-fun getCurrentListMap!4355 (array!70773 array!70775 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) Int) ListLongMap!15167)

(assert (=> b!1093891 (= lt!489321 (getCurrentListMap!4355 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489315 () ListLongMap!15167)

(declare-fun lt!489322 () array!70775)

(assert (=> b!1093891 (= lt!489315 (getCurrentListMap!4355 lt!489317 lt!489322 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489316 () ListLongMap!15167)

(declare-fun lt!489320 () ListLongMap!15167)

(assert (=> b!1093891 (and (= lt!489316 lt!489320) (= lt!489320 lt!489316))))

(declare-fun lt!489318 () ListLongMap!15167)

(declare-fun -!918 (ListLongMap!15167 (_ BitVec 64)) ListLongMap!15167)

(assert (=> b!1093891 (= lt!489320 (-!918 lt!489318 k!904))))

(declare-datatypes ((Unit!36002 0))(
  ( (Unit!36003) )
))
(declare-fun lt!489319 () Unit!36002)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!174 (array!70773 array!70775 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36002)

(assert (=> b!1093891 (= lt!489319 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!174 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4115 (array!70773 array!70775 (_ BitVec 32) (_ BitVec 32) V!41033 V!41033 (_ BitVec 32) Int) ListLongMap!15167)

(assert (=> b!1093891 (= lt!489316 (getCurrentListMapNoExtraKeys!4115 lt!489317 lt!489322 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2252 (Int (_ BitVec 64)) V!41033)

(assert (=> b!1093891 (= lt!489322 (array!70776 (store (arr!34061 _values!874) i!650 (ValueCellFull!12755 (dynLambda!2252 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34597 _values!874)))))

(assert (=> b!1093891 (= lt!489318 (getCurrentListMapNoExtraKeys!4115 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093891 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!489314 () Unit!36002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70773 (_ BitVec 64) (_ BitVec 32)) Unit!36002)

(assert (=> b!1093891 (= lt!489314 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1093892 () Bool)

(declare-fun res!729978 () Bool)

(assert (=> b!1093892 (=> (not res!729978) (not e!624555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70773 (_ BitVec 32)) Bool)

(assert (=> b!1093892 (= res!729978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42148 () Bool)

(declare-fun mapRes!42148 () Bool)

(assert (=> mapIsEmpty!42148 mapRes!42148))

(declare-fun mapNonEmpty!42148 () Bool)

(declare-fun tp!80629 () Bool)

(declare-fun e!624556 () Bool)

(assert (=> mapNonEmpty!42148 (= mapRes!42148 (and tp!80629 e!624556))))

(declare-fun mapRest!42148 () (Array (_ BitVec 32) ValueCell!12755))

(declare-fun mapKey!42148 () (_ BitVec 32))

(declare-fun mapValue!42148 () ValueCell!12755)

(assert (=> mapNonEmpty!42148 (= (arr!34061 _values!874) (store mapRest!42148 mapKey!42148 mapValue!42148))))

(declare-fun b!1093893 () Bool)

(declare-fun e!624557 () Bool)

(assert (=> b!1093893 (= e!624560 (and e!624557 mapRes!42148))))

(declare-fun condMapEmpty!42148 () Bool)

(declare-fun mapDefault!42148 () ValueCell!12755)

