; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96190 () Bool)

(assert start!96190)

(declare-fun b_free!22843 () Bool)

(declare-fun b_next!22843 () Bool)

(assert (=> start!96190 (= b_free!22843 (not b_next!22843))))

(declare-fun tp!80377 () Bool)

(declare-fun b_and!36361 () Bool)

(assert (=> start!96190 (= tp!80377 b_and!36361)))

(declare-fun b!1092291 () Bool)

(declare-fun res!728844 () Bool)

(declare-fun e!623803 () Bool)

(assert (=> b!1092291 (=> (not res!728844) (not e!623803))))

(declare-datatypes ((array!70609 0))(
  ( (array!70610 (arr!33978 (Array (_ BitVec 32) (_ BitVec 64))) (size!34514 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70609)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092291 (= res!728844 (= (select (arr!33978 _keys!1070) i!650) k!904))))

(declare-fun b!1092292 () Bool)

(declare-fun res!728846 () Bool)

(assert (=> b!1092292 (=> (not res!728846) (not e!623803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092292 (= res!728846 (validKeyInArray!0 k!904))))

(declare-fun mapIsEmpty!42022 () Bool)

(declare-fun mapRes!42022 () Bool)

(assert (=> mapIsEmpty!42022 mapRes!42022))

(declare-fun res!728847 () Bool)

(assert (=> start!96190 (=> (not res!728847) (not e!623803))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96190 (= res!728847 (validMask!0 mask!1414))))

(assert (=> start!96190 e!623803))

(assert (=> start!96190 tp!80377))

(assert (=> start!96190 true))

(declare-fun tp_is_empty!26845 () Bool)

(assert (=> start!96190 tp_is_empty!26845))

(declare-fun array_inv!26196 (array!70609) Bool)

(assert (=> start!96190 (array_inv!26196 _keys!1070)))

(declare-datatypes ((V!40921 0))(
  ( (V!40922 (val!13479 Int)) )
))
(declare-datatypes ((ValueCell!12713 0))(
  ( (ValueCellFull!12713 (v!16100 V!40921)) (EmptyCell!12713) )
))
(declare-datatypes ((array!70611 0))(
  ( (array!70612 (arr!33979 (Array (_ BitVec 32) ValueCell!12713)) (size!34515 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70611)

(declare-fun e!623799 () Bool)

(declare-fun array_inv!26197 (array!70611) Bool)

(assert (=> start!96190 (and (array_inv!26197 _values!874) e!623799)))

(declare-fun b!1092293 () Bool)

(declare-fun res!728839 () Bool)

(assert (=> b!1092293 (=> (not res!728839) (not e!623803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70609 (_ BitVec 32)) Bool)

(assert (=> b!1092293 (= res!728839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092294 () Bool)

(declare-fun res!728843 () Bool)

(assert (=> b!1092294 (=> (not res!728843) (not e!623803))))

(declare-datatypes ((List!23734 0))(
  ( (Nil!23731) (Cons!23730 (h!24939 (_ BitVec 64)) (t!33635 List!23734)) )
))
(declare-fun arrayNoDuplicates!0 (array!70609 (_ BitVec 32) List!23734) Bool)

(assert (=> b!1092294 (= res!728843 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23731))))

(declare-fun mapNonEmpty!42022 () Bool)

(declare-fun tp!80378 () Bool)

(declare-fun e!623800 () Bool)

(assert (=> mapNonEmpty!42022 (= mapRes!42022 (and tp!80378 e!623800))))

(declare-fun mapValue!42022 () ValueCell!12713)

(declare-fun mapKey!42022 () (_ BitVec 32))

(declare-fun mapRest!42022 () (Array (_ BitVec 32) ValueCell!12713))

(assert (=> mapNonEmpty!42022 (= (arr!33979 _values!874) (store mapRest!42022 mapKey!42022 mapValue!42022))))

(declare-fun b!1092295 () Bool)

(declare-fun e!623801 () Bool)

(assert (=> b!1092295 (= e!623801 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40921)

(declare-datatypes ((tuple2!17150 0))(
  ( (tuple2!17151 (_1!8586 (_ BitVec 64)) (_2!8586 V!40921)) )
))
(declare-datatypes ((List!23735 0))(
  ( (Nil!23732) (Cons!23731 (h!24940 tuple2!17150) (t!33636 List!23735)) )
))
(declare-datatypes ((ListLongMap!15119 0))(
  ( (ListLongMap!15120 (toList!7575 List!23735)) )
))
(declare-fun lt!488175 () ListLongMap!15119)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40921)

(declare-fun getCurrentListMap!4331 (array!70609 array!70611 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) Int) ListLongMap!15119)

(assert (=> b!1092295 (= lt!488175 (getCurrentListMap!4331 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488173 () array!70609)

(declare-fun lt!488179 () array!70611)

(declare-fun lt!488176 () ListLongMap!15119)

(assert (=> b!1092295 (= lt!488176 (getCurrentListMap!4331 lt!488173 lt!488179 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488171 () ListLongMap!15119)

(declare-fun lt!488178 () ListLongMap!15119)

(assert (=> b!1092295 (and (= lt!488171 lt!488178) (= lt!488178 lt!488171))))

(declare-fun lt!488172 () ListLongMap!15119)

(declare-fun -!894 (ListLongMap!15119 (_ BitVec 64)) ListLongMap!15119)

(assert (=> b!1092295 (= lt!488178 (-!894 lt!488172 k!904))))

(declare-datatypes ((Unit!35954 0))(
  ( (Unit!35955) )
))
(declare-fun lt!488174 () Unit!35954)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!150 (array!70609 array!70611 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35954)

(assert (=> b!1092295 (= lt!488174 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!150 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4091 (array!70609 array!70611 (_ BitVec 32) (_ BitVec 32) V!40921 V!40921 (_ BitVec 32) Int) ListLongMap!15119)

(assert (=> b!1092295 (= lt!488171 (getCurrentListMapNoExtraKeys!4091 lt!488173 lt!488179 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2228 (Int (_ BitVec 64)) V!40921)

(assert (=> b!1092295 (= lt!488179 (array!70612 (store (arr!33979 _values!874) i!650 (ValueCellFull!12713 (dynLambda!2228 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34515 _values!874)))))

(assert (=> b!1092295 (= lt!488172 (getCurrentListMapNoExtraKeys!4091 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092295 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488177 () Unit!35954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70609 (_ BitVec 64) (_ BitVec 32)) Unit!35954)

(assert (=> b!1092295 (= lt!488177 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1092296 () Bool)

(assert (=> b!1092296 (= e!623800 tp_is_empty!26845)))

(declare-fun b!1092297 () Bool)

(assert (=> b!1092297 (= e!623803 e!623801)))

(declare-fun res!728840 () Bool)

(assert (=> b!1092297 (=> (not res!728840) (not e!623801))))

(assert (=> b!1092297 (= res!728840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488173 mask!1414))))

(assert (=> b!1092297 (= lt!488173 (array!70610 (store (arr!33978 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34514 _keys!1070)))))

(declare-fun b!1092298 () Bool)

(declare-fun res!728845 () Bool)

(assert (=> b!1092298 (=> (not res!728845) (not e!623803))))

(assert (=> b!1092298 (= res!728845 (and (= (size!34515 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34514 _keys!1070) (size!34515 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092299 () Bool)

(declare-fun e!623804 () Bool)

(assert (=> b!1092299 (= e!623804 tp_is_empty!26845)))

(declare-fun b!1092300 () Bool)

(declare-fun res!728842 () Bool)

(assert (=> b!1092300 (=> (not res!728842) (not e!623801))))

(assert (=> b!1092300 (= res!728842 (arrayNoDuplicates!0 lt!488173 #b00000000000000000000000000000000 Nil!23731))))

(declare-fun b!1092301 () Bool)

(declare-fun res!728841 () Bool)

(assert (=> b!1092301 (=> (not res!728841) (not e!623803))))

(assert (=> b!1092301 (= res!728841 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34514 _keys!1070))))))

(declare-fun b!1092302 () Bool)

(assert (=> b!1092302 (= e!623799 (and e!623804 mapRes!42022))))

(declare-fun condMapEmpty!42022 () Bool)

(declare-fun mapDefault!42022 () ValueCell!12713)

