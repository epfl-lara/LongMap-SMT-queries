; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96796 () Bool)

(assert start!96796)

(declare-fun b_free!23165 () Bool)

(declare-fun b_next!23165 () Bool)

(assert (=> start!96796 (= b_free!23165 (not b_next!23165))))

(declare-fun tp!81446 () Bool)

(declare-fun b_and!37105 () Bool)

(assert (=> start!96796 (= tp!81446 b_and!37105)))

(declare-datatypes ((V!41413 0))(
  ( (V!41414 (val!13664 Int)) )
))
(declare-datatypes ((tuple2!17374 0))(
  ( (tuple2!17375 (_1!8698 (_ BitVec 64)) (_2!8698 V!41413)) )
))
(declare-fun lt!493569 () tuple2!17374)

(declare-fun b!1101090 () Bool)

(declare-fun e!628473 () Bool)

(declare-datatypes ((List!23990 0))(
  ( (Nil!23987) (Cons!23986 (h!25195 tuple2!17374) (t!34201 List!23990)) )
))
(declare-datatypes ((ListLongMap!15343 0))(
  ( (ListLongMap!15344 (toList!7687 List!23990)) )
))
(declare-fun lt!493563 () ListLongMap!15343)

(declare-fun lt!493562 () ListLongMap!15343)

(declare-fun +!3392 (ListLongMap!15343 tuple2!17374) ListLongMap!15343)

(assert (=> b!1101090 (= e!628473 (= lt!493563 (+!3392 lt!493562 lt!493569)))))

(declare-fun lt!493570 () ListLongMap!15343)

(assert (=> b!1101090 (= lt!493563 (+!3392 lt!493570 lt!493569))))

(declare-fun minValue!831 () V!41413)

(assert (=> b!1101090 (= lt!493569 (tuple2!17375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101091 () Bool)

(declare-fun e!628472 () Bool)

(assert (=> b!1101091 (= e!628472 (not e!628473))))

(declare-fun res!734744 () Bool)

(assert (=> b!1101091 (=> res!734744 e!628473)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101091 (= res!734744 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!493571 () ListLongMap!15343)

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41413)

(declare-datatypes ((array!71349 0))(
  ( (array!71350 (arr!34338 (Array (_ BitVec 32) (_ BitVec 64))) (size!34874 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71349)

(declare-datatypes ((ValueCell!12898 0))(
  ( (ValueCellFull!12898 (v!16293 V!41413)) (EmptyCell!12898) )
))
(declare-datatypes ((array!71351 0))(
  ( (array!71352 (arr!34339 (Array (_ BitVec 32) ValueCell!12898)) (size!34875 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71351)

(declare-fun getCurrentListMap!4394 (array!71349 array!71351 (_ BitVec 32) (_ BitVec 32) V!41413 V!41413 (_ BitVec 32) Int) ListLongMap!15343)

(assert (=> b!1101091 (= lt!493571 (getCurrentListMap!4394 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493566 () array!71351)

(declare-fun lt!493568 () array!71349)

(assert (=> b!1101091 (= lt!493563 (getCurrentListMap!4394 lt!493568 lt!493566 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101091 (and (= lt!493570 lt!493562) (= lt!493562 lt!493570))))

(declare-fun lt!493565 () ListLongMap!15343)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!972 (ListLongMap!15343 (_ BitVec 64)) ListLongMap!15343)

(assert (=> b!1101091 (= lt!493562 (-!972 lt!493565 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36192 0))(
  ( (Unit!36193) )
))
(declare-fun lt!493567 () Unit!36192)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!220 (array!71349 array!71351 (_ BitVec 32) (_ BitVec 32) V!41413 V!41413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36192)

(assert (=> b!1101091 (= lt!493567 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!220 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4190 (array!71349 array!71351 (_ BitVec 32) (_ BitVec 32) V!41413 V!41413 (_ BitVec 32) Int) ListLongMap!15343)

(assert (=> b!1101091 (= lt!493570 (getCurrentListMapNoExtraKeys!4190 lt!493568 lt!493566 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2325 (Int (_ BitVec 64)) V!41413)

(assert (=> b!1101091 (= lt!493566 (array!71352 (store (arr!34339 _values!874) i!650 (ValueCellFull!12898 (dynLambda!2325 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34875 _values!874)))))

(assert (=> b!1101091 (= lt!493565 (getCurrentListMapNoExtraKeys!4190 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101091 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!493564 () Unit!36192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71349 (_ BitVec 64) (_ BitVec 32)) Unit!36192)

(assert (=> b!1101091 (= lt!493564 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1101092 () Bool)

(declare-fun res!734742 () Bool)

(declare-fun e!628470 () Bool)

(assert (=> b!1101092 (=> (not res!734742) (not e!628470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71349 (_ BitVec 32)) Bool)

(assert (=> b!1101092 (= res!734742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101093 () Bool)

(declare-fun res!734737 () Bool)

(assert (=> b!1101093 (=> (not res!734737) (not e!628470))))

(declare-datatypes ((List!23991 0))(
  ( (Nil!23988) (Cons!23987 (h!25196 (_ BitVec 64)) (t!34202 List!23991)) )
))
(declare-fun arrayNoDuplicates!0 (array!71349 (_ BitVec 32) List!23991) Bool)

(assert (=> b!1101093 (= res!734737 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23988))))

(declare-fun b!1101094 () Bool)

(declare-fun res!734741 () Bool)

(assert (=> b!1101094 (=> (not res!734741) (not e!628470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101094 (= res!734741 (validKeyInArray!0 k!904))))

(declare-fun b!1101095 () Bool)

(declare-fun e!628467 () Bool)

(declare-fun tp_is_empty!27215 () Bool)

(assert (=> b!1101095 (= e!628467 tp_is_empty!27215)))

(declare-fun b!1101096 () Bool)

(declare-fun res!734740 () Bool)

(assert (=> b!1101096 (=> (not res!734740) (not e!628470))))

(assert (=> b!1101096 (= res!734740 (and (= (size!34875 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34874 _keys!1070) (size!34875 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!734743 () Bool)

(assert (=> start!96796 (=> (not res!734743) (not e!628470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96796 (= res!734743 (validMask!0 mask!1414))))

(assert (=> start!96796 e!628470))

(assert (=> start!96796 tp!81446))

(assert (=> start!96796 true))

(assert (=> start!96796 tp_is_empty!27215))

(declare-fun array_inv!26448 (array!71349) Bool)

(assert (=> start!96796 (array_inv!26448 _keys!1070)))

(declare-fun e!628469 () Bool)

(declare-fun array_inv!26449 (array!71351) Bool)

(assert (=> start!96796 (and (array_inv!26449 _values!874) e!628469)))

(declare-fun b!1101097 () Bool)

(assert (=> b!1101097 (= e!628470 e!628472)))

(declare-fun res!734736 () Bool)

(assert (=> b!1101097 (=> (not res!734736) (not e!628472))))

(assert (=> b!1101097 (= res!734736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493568 mask!1414))))

(assert (=> b!1101097 (= lt!493568 (array!71350 (store (arr!34338 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34874 _keys!1070)))))

(declare-fun b!1101098 () Bool)

(declare-fun res!734735 () Bool)

(assert (=> b!1101098 (=> (not res!734735) (not e!628472))))

(assert (=> b!1101098 (= res!734735 (arrayNoDuplicates!0 lt!493568 #b00000000000000000000000000000000 Nil!23988))))

(declare-fun b!1101099 () Bool)

(declare-fun e!628471 () Bool)

(assert (=> b!1101099 (= e!628471 tp_is_empty!27215)))

(declare-fun b!1101100 () Bool)

(declare-fun res!734738 () Bool)

(assert (=> b!1101100 (=> (not res!734738) (not e!628470))))

(assert (=> b!1101100 (= res!734738 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34874 _keys!1070))))))

(declare-fun b!1101101 () Bool)

(declare-fun res!734739 () Bool)

(assert (=> b!1101101 (=> (not res!734739) (not e!628470))))

(assert (=> b!1101101 (= res!734739 (= (select (arr!34338 _keys!1070) i!650) k!904))))

(declare-fun b!1101102 () Bool)

(declare-fun mapRes!42607 () Bool)

(assert (=> b!1101102 (= e!628469 (and e!628467 mapRes!42607))))

(declare-fun condMapEmpty!42607 () Bool)

(declare-fun mapDefault!42607 () ValueCell!12898)

