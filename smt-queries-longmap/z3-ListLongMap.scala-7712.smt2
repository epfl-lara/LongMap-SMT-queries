; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97116 () Bool)

(assert start!97116)

(declare-fun b_free!23197 () Bool)

(declare-fun b_next!23197 () Bool)

(assert (=> start!97116 (= b_free!23197 (not b_next!23197))))

(declare-fun tp!81548 () Bool)

(declare-fun b_and!37207 () Bool)

(assert (=> start!97116 (= tp!81548 b_and!37207)))

(declare-fun b!1103527 () Bool)

(declare-fun res!735973 () Bool)

(declare-fun e!629964 () Bool)

(assert (=> b!1103527 (=> (not res!735973) (not e!629964))))

(declare-datatypes ((array!71453 0))(
  ( (array!71454 (arr!34382 (Array (_ BitVec 32) (_ BitVec 64))) (size!34919 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71453)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1103527 (= res!735973 (= (select (arr!34382 _keys!1070) i!650) k0!904))))

(declare-fun b!1103528 () Bool)

(declare-fun res!735976 () Bool)

(declare-fun e!629965 () Bool)

(assert (=> b!1103528 (=> (not res!735976) (not e!629965))))

(declare-fun lt!494960 () array!71453)

(declare-datatypes ((List!24038 0))(
  ( (Nil!24035) (Cons!24034 (h!25252 (_ BitVec 64)) (t!34273 List!24038)) )
))
(declare-fun arrayNoDuplicates!0 (array!71453 (_ BitVec 32) List!24038) Bool)

(assert (=> b!1103528 (= res!735976 (arrayNoDuplicates!0 lt!494960 #b00000000000000000000000000000000 Nil!24035))))

(declare-fun b!1103529 () Bool)

(declare-fun res!735971 () Bool)

(assert (=> b!1103529 (=> (not res!735971) (not e!629964))))

(assert (=> b!1103529 (= res!735971 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34919 _keys!1070))))))

(declare-fun mapIsEmpty!42661 () Bool)

(declare-fun mapRes!42661 () Bool)

(assert (=> mapIsEmpty!42661 mapRes!42661))

(declare-fun b!1103530 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41457 0))(
  ( (V!41458 (val!13680 Int)) )
))
(declare-datatypes ((tuple2!17418 0))(
  ( (tuple2!17419 (_1!8720 (_ BitVec 64)) (_2!8720 V!41457)) )
))
(declare-datatypes ((List!24039 0))(
  ( (Nil!24036) (Cons!24035 (h!25253 tuple2!17418) (t!34274 List!24039)) )
))
(declare-datatypes ((ListLongMap!15395 0))(
  ( (ListLongMap!15396 (toList!7713 List!24039)) )
))
(declare-fun lt!494959 () ListLongMap!15395)

(declare-fun lt!494958 () Bool)

(declare-fun lt!494953 () ListLongMap!15395)

(assert (=> b!1103530 (= e!629965 (not (or (and (not lt!494958) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494958) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494958) (= lt!494959 lt!494953))))))

(assert (=> b!1103530 (= lt!494958 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!494954 () ListLongMap!15395)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41457)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41457)

(declare-datatypes ((ValueCell!12914 0))(
  ( (ValueCellFull!12914 (v!16307 V!41457)) (EmptyCell!12914) )
))
(declare-datatypes ((array!71455 0))(
  ( (array!71456 (arr!34383 (Array (_ BitVec 32) ValueCell!12914)) (size!34920 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71455)

(declare-fun getCurrentListMap!4412 (array!71453 array!71455 (_ BitVec 32) (_ BitVec 32) V!41457 V!41457 (_ BitVec 32) Int) ListLongMap!15395)

(assert (=> b!1103530 (= lt!494954 (getCurrentListMap!4412 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494952 () array!71455)

(assert (=> b!1103530 (= lt!494959 (getCurrentListMap!4412 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494955 () ListLongMap!15395)

(assert (=> b!1103530 (and (= lt!494953 lt!494955) (= lt!494955 lt!494953))))

(declare-fun lt!494956 () ListLongMap!15395)

(declare-fun -!976 (ListLongMap!15395 (_ BitVec 64)) ListLongMap!15395)

(assert (=> b!1103530 (= lt!494955 (-!976 lt!494956 k0!904))))

(declare-datatypes ((Unit!36211 0))(
  ( (Unit!36212) )
))
(declare-fun lt!494961 () Unit!36211)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!246 (array!71453 array!71455 (_ BitVec 32) (_ BitVec 32) V!41457 V!41457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36211)

(assert (=> b!1103530 (= lt!494961 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!246 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4253 (array!71453 array!71455 (_ BitVec 32) (_ BitVec 32) V!41457 V!41457 (_ BitVec 32) Int) ListLongMap!15395)

(assert (=> b!1103530 (= lt!494953 (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2371 (Int (_ BitVec 64)) V!41457)

(assert (=> b!1103530 (= lt!494952 (array!71456 (store (arr!34383 _values!874) i!650 (ValueCellFull!12914 (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34920 _values!874)))))

(assert (=> b!1103530 (= lt!494956 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103530 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494957 () Unit!36211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71453 (_ BitVec 64) (_ BitVec 32)) Unit!36211)

(assert (=> b!1103530 (= lt!494957 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapNonEmpty!42661 () Bool)

(declare-fun tp!81547 () Bool)

(declare-fun e!629967 () Bool)

(assert (=> mapNonEmpty!42661 (= mapRes!42661 (and tp!81547 e!629967))))

(declare-fun mapKey!42661 () (_ BitVec 32))

(declare-fun mapValue!42661 () ValueCell!12914)

(declare-fun mapRest!42661 () (Array (_ BitVec 32) ValueCell!12914))

(assert (=> mapNonEmpty!42661 (= (arr!34383 _values!874) (store mapRest!42661 mapKey!42661 mapValue!42661))))

(declare-fun b!1103531 () Bool)

(declare-fun res!735972 () Bool)

(assert (=> b!1103531 (=> (not res!735972) (not e!629964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71453 (_ BitVec 32)) Bool)

(assert (=> b!1103531 (= res!735972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1103532 () Bool)

(declare-fun tp_is_empty!27247 () Bool)

(assert (=> b!1103532 (= e!629967 tp_is_empty!27247)))

(declare-fun res!735979 () Bool)

(assert (=> start!97116 (=> (not res!735979) (not e!629964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97116 (= res!735979 (validMask!0 mask!1414))))

(assert (=> start!97116 e!629964))

(assert (=> start!97116 tp!81548))

(assert (=> start!97116 true))

(assert (=> start!97116 tp_is_empty!27247))

(declare-fun array_inv!26508 (array!71453) Bool)

(assert (=> start!97116 (array_inv!26508 _keys!1070)))

(declare-fun e!629966 () Bool)

(declare-fun array_inv!26509 (array!71455) Bool)

(assert (=> start!97116 (and (array_inv!26509 _values!874) e!629966)))

(declare-fun b!1103533 () Bool)

(declare-fun e!629968 () Bool)

(assert (=> b!1103533 (= e!629966 (and e!629968 mapRes!42661))))

(declare-fun condMapEmpty!42661 () Bool)

(declare-fun mapDefault!42661 () ValueCell!12914)

(assert (=> b!1103533 (= condMapEmpty!42661 (= (arr!34383 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12914)) mapDefault!42661)))))

(declare-fun b!1103534 () Bool)

(declare-fun res!735978 () Bool)

(assert (=> b!1103534 (=> (not res!735978) (not e!629964))))

(assert (=> b!1103534 (= res!735978 (and (= (size!34920 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34919 _keys!1070) (size!34920 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1103535 () Bool)

(assert (=> b!1103535 (= e!629968 tp_is_empty!27247)))

(declare-fun b!1103536 () Bool)

(declare-fun res!735975 () Bool)

(assert (=> b!1103536 (=> (not res!735975) (not e!629964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103536 (= res!735975 (validKeyInArray!0 k0!904))))

(declare-fun b!1103537 () Bool)

(declare-fun res!735977 () Bool)

(assert (=> b!1103537 (=> (not res!735977) (not e!629964))))

(assert (=> b!1103537 (= res!735977 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24035))))

(declare-fun b!1103538 () Bool)

(assert (=> b!1103538 (= e!629964 e!629965)))

(declare-fun res!735974 () Bool)

(assert (=> b!1103538 (=> (not res!735974) (not e!629965))))

(assert (=> b!1103538 (= res!735974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494960 mask!1414))))

(assert (=> b!1103538 (= lt!494960 (array!71454 (store (arr!34382 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34919 _keys!1070)))))

(assert (= (and start!97116 res!735979) b!1103534))

(assert (= (and b!1103534 res!735978) b!1103531))

(assert (= (and b!1103531 res!735972) b!1103537))

(assert (= (and b!1103537 res!735977) b!1103529))

(assert (= (and b!1103529 res!735971) b!1103536))

(assert (= (and b!1103536 res!735975) b!1103527))

(assert (= (and b!1103527 res!735973) b!1103538))

(assert (= (and b!1103538 res!735974) b!1103528))

(assert (= (and b!1103528 res!735976) b!1103530))

(assert (= (and b!1103533 condMapEmpty!42661) mapIsEmpty!42661))

(assert (= (and b!1103533 (not condMapEmpty!42661)) mapNonEmpty!42661))

(get-info :version)

(assert (= (and mapNonEmpty!42661 ((_ is ValueCellFull!12914) mapValue!42661)) b!1103532))

(assert (= (and b!1103533 ((_ is ValueCellFull!12914) mapDefault!42661)) b!1103535))

(assert (= start!97116 b!1103533))

(declare-fun b_lambda!18165 () Bool)

(assert (=> (not b_lambda!18165) (not b!1103530)))

(declare-fun t!34272 () Bool)

(declare-fun tb!8055 () Bool)

(assert (=> (and start!97116 (= defaultEntry!882 defaultEntry!882) t!34272) tb!8055))

(declare-fun result!16661 () Bool)

(assert (=> tb!8055 (= result!16661 tp_is_empty!27247)))

(assert (=> b!1103530 t!34272))

(declare-fun b_and!37209 () Bool)

(assert (= b_and!37207 (and (=> t!34272 result!16661) b_and!37209)))

(declare-fun m!1024163 () Bool)

(assert (=> start!97116 m!1024163))

(declare-fun m!1024165 () Bool)

(assert (=> start!97116 m!1024165))

(declare-fun m!1024167 () Bool)

(assert (=> start!97116 m!1024167))

(declare-fun m!1024169 () Bool)

(assert (=> b!1103538 m!1024169))

(declare-fun m!1024171 () Bool)

(assert (=> b!1103538 m!1024171))

(declare-fun m!1024173 () Bool)

(assert (=> b!1103536 m!1024173))

(declare-fun m!1024175 () Bool)

(assert (=> b!1103530 m!1024175))

(declare-fun m!1024177 () Bool)

(assert (=> b!1103530 m!1024177))

(declare-fun m!1024179 () Bool)

(assert (=> b!1103530 m!1024179))

(declare-fun m!1024181 () Bool)

(assert (=> b!1103530 m!1024181))

(declare-fun m!1024183 () Bool)

(assert (=> b!1103530 m!1024183))

(declare-fun m!1024185 () Bool)

(assert (=> b!1103530 m!1024185))

(declare-fun m!1024187 () Bool)

(assert (=> b!1103530 m!1024187))

(declare-fun m!1024189 () Bool)

(assert (=> b!1103530 m!1024189))

(declare-fun m!1024191 () Bool)

(assert (=> b!1103530 m!1024191))

(declare-fun m!1024193 () Bool)

(assert (=> b!1103530 m!1024193))

(declare-fun m!1024195 () Bool)

(assert (=> b!1103537 m!1024195))

(declare-fun m!1024197 () Bool)

(assert (=> mapNonEmpty!42661 m!1024197))

(declare-fun m!1024199 () Bool)

(assert (=> b!1103531 m!1024199))

(declare-fun m!1024201 () Bool)

(assert (=> b!1103528 m!1024201))

(declare-fun m!1024203 () Bool)

(assert (=> b!1103527 m!1024203))

(check-sat (not mapNonEmpty!42661) (not start!97116) (not b!1103537) (not b!1103531) b_and!37209 (not b!1103536) (not b!1103538) (not b_lambda!18165) (not b!1103528) tp_is_empty!27247 (not b_next!23197) (not b!1103530))
(check-sat b_and!37209 (not b_next!23197))
(get-model)

(declare-fun b_lambda!18171 () Bool)

(assert (= b_lambda!18165 (or (and start!97116 b_free!23197) b_lambda!18171)))

(check-sat (not start!97116) (not b!1103537) (not b!1103531) b_and!37209 (not b!1103536) (not b!1103538) (not mapNonEmpty!42661) (not b_lambda!18171) (not b!1103528) tp_is_empty!27247 (not b_next!23197) (not b!1103530))
(check-sat b_and!37209 (not b_next!23197))
(get-model)

(declare-fun d!131187 () Bool)

(declare-fun res!736038 () Bool)

(declare-fun e!630009 () Bool)

(assert (=> d!131187 (=> res!736038 e!630009)))

(assert (=> d!131187 (= res!736038 (= (select (arr!34382 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!131187 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!630009)))

(declare-fun b!1103621 () Bool)

(declare-fun e!630010 () Bool)

(assert (=> b!1103621 (= e!630009 e!630010)))

(declare-fun res!736039 () Bool)

(assert (=> b!1103621 (=> (not res!736039) (not e!630010))))

(assert (=> b!1103621 (= res!736039 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34919 _keys!1070)))))

(declare-fun b!1103622 () Bool)

(assert (=> b!1103622 (= e!630010 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131187 (not res!736038)) b!1103621))

(assert (= (and b!1103621 res!736039) b!1103622))

(declare-fun m!1024289 () Bool)

(assert (=> d!131187 m!1024289))

(declare-fun m!1024291 () Bool)

(assert (=> b!1103622 m!1024291))

(assert (=> b!1103530 d!131187))

(declare-fun b!1103665 () Bool)

(declare-fun e!630045 () ListLongMap!15395)

(declare-fun e!630044 () ListLongMap!15395)

(assert (=> b!1103665 (= e!630045 e!630044)))

(declare-fun c!109295 () Bool)

(assert (=> b!1103665 (= c!109295 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1103666 () Bool)

(declare-fun e!630043 () Unit!36211)

(declare-fun lt!495073 () Unit!36211)

(assert (=> b!1103666 (= e!630043 lt!495073)))

(declare-fun lt!495080 () ListLongMap!15395)

(assert (=> b!1103666 (= lt!495080 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495087 () (_ BitVec 64))

(assert (=> b!1103666 (= lt!495087 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495071 () (_ BitVec 64))

(assert (=> b!1103666 (= lt!495071 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!495083 () Unit!36211)

(declare-fun addStillContains!666 (ListLongMap!15395 (_ BitVec 64) V!41457 (_ BitVec 64)) Unit!36211)

(assert (=> b!1103666 (= lt!495083 (addStillContains!666 lt!495080 lt!495087 zeroValue!831 lt!495071))))

(declare-fun contains!6431 (ListLongMap!15395 (_ BitVec 64)) Bool)

(declare-fun +!3440 (ListLongMap!15395 tuple2!17418) ListLongMap!15395)

(assert (=> b!1103666 (contains!6431 (+!3440 lt!495080 (tuple2!17419 lt!495087 zeroValue!831)) lt!495071)))

(declare-fun lt!495085 () Unit!36211)

(assert (=> b!1103666 (= lt!495085 lt!495083)))

(declare-fun lt!495067 () ListLongMap!15395)

(assert (=> b!1103666 (= lt!495067 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495075 () (_ BitVec 64))

(assert (=> b!1103666 (= lt!495075 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495086 () (_ BitVec 64))

(assert (=> b!1103666 (= lt!495086 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!495084 () Unit!36211)

(declare-fun addApplyDifferent!522 (ListLongMap!15395 (_ BitVec 64) V!41457 (_ BitVec 64)) Unit!36211)

(assert (=> b!1103666 (= lt!495084 (addApplyDifferent!522 lt!495067 lt!495075 minValue!831 lt!495086))))

(declare-fun apply!962 (ListLongMap!15395 (_ BitVec 64)) V!41457)

(assert (=> b!1103666 (= (apply!962 (+!3440 lt!495067 (tuple2!17419 lt!495075 minValue!831)) lt!495086) (apply!962 lt!495067 lt!495086))))

(declare-fun lt!495074 () Unit!36211)

(assert (=> b!1103666 (= lt!495074 lt!495084)))

(declare-fun lt!495079 () ListLongMap!15395)

(assert (=> b!1103666 (= lt!495079 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495070 () (_ BitVec 64))

(assert (=> b!1103666 (= lt!495070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495066 () (_ BitVec 64))

(assert (=> b!1103666 (= lt!495066 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!495072 () Unit!36211)

(assert (=> b!1103666 (= lt!495072 (addApplyDifferent!522 lt!495079 lt!495070 zeroValue!831 lt!495066))))

(assert (=> b!1103666 (= (apply!962 (+!3440 lt!495079 (tuple2!17419 lt!495070 zeroValue!831)) lt!495066) (apply!962 lt!495079 lt!495066))))

(declare-fun lt!495068 () Unit!36211)

(assert (=> b!1103666 (= lt!495068 lt!495072)))

(declare-fun lt!495077 () ListLongMap!15395)

(assert (=> b!1103666 (= lt!495077 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495078 () (_ BitVec 64))

(assert (=> b!1103666 (= lt!495078 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495082 () (_ BitVec 64))

(assert (=> b!1103666 (= lt!495082 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1103666 (= lt!495073 (addApplyDifferent!522 lt!495077 lt!495078 minValue!831 lt!495082))))

(assert (=> b!1103666 (= (apply!962 (+!3440 lt!495077 (tuple2!17419 lt!495078 minValue!831)) lt!495082) (apply!962 lt!495077 lt!495082))))

(declare-fun b!1103667 () Bool)

(declare-fun Unit!36215 () Unit!36211)

(assert (=> b!1103667 (= e!630043 Unit!36215)))

(declare-fun bm!46303 () Bool)

(declare-fun call!46312 () ListLongMap!15395)

(declare-fun call!46309 () ListLongMap!15395)

(assert (=> bm!46303 (= call!46312 call!46309)))

(declare-fun b!1103669 () Bool)

(declare-fun e!630048 () ListLongMap!15395)

(declare-fun call!46306 () ListLongMap!15395)

(assert (=> b!1103669 (= e!630048 call!46306)))

(declare-fun b!1103670 () Bool)

(declare-fun res!736066 () Bool)

(declare-fun e!630038 () Bool)

(assert (=> b!1103670 (=> (not res!736066) (not e!630038))))

(declare-fun e!630047 () Bool)

(assert (=> b!1103670 (= res!736066 e!630047)))

(declare-fun c!109294 () Bool)

(assert (=> b!1103670 (= c!109294 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1103671 () Bool)

(declare-fun e!630040 () Bool)

(declare-fun call!46308 () Bool)

(assert (=> b!1103671 (= e!630040 (not call!46308))))

(declare-fun bm!46304 () Bool)

(declare-fun lt!495081 () ListLongMap!15395)

(assert (=> bm!46304 (= call!46308 (contains!6431 lt!495081 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103672 () Bool)

(declare-fun res!736065 () Bool)

(assert (=> b!1103672 (=> (not res!736065) (not e!630038))))

(declare-fun e!630042 () Bool)

(assert (=> b!1103672 (= res!736065 e!630042)))

(declare-fun res!736062 () Bool)

(assert (=> b!1103672 (=> res!736062 e!630042)))

(declare-fun e!630039 () Bool)

(assert (=> b!1103672 (= res!736062 (not e!630039))))

(declare-fun res!736058 () Bool)

(assert (=> b!1103672 (=> (not res!736058) (not e!630039))))

(assert (=> b!1103672 (= res!736058 (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(declare-fun b!1103673 () Bool)

(declare-fun call!46311 () Bool)

(assert (=> b!1103673 (= e!630047 (not call!46311))))

(declare-fun bm!46305 () Bool)

(assert (=> bm!46305 (= call!46309 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46306 () Bool)

(declare-fun call!46307 () ListLongMap!15395)

(assert (=> bm!46306 (= call!46307 call!46312)))

(declare-fun b!1103674 () Bool)

(declare-fun e!630041 () Bool)

(assert (=> b!1103674 (= e!630047 e!630041)))

(declare-fun res!736063 () Bool)

(assert (=> b!1103674 (= res!736063 call!46311)))

(assert (=> b!1103674 (=> (not res!736063) (not e!630041))))

(declare-fun b!1103675 () Bool)

(declare-fun c!109291 () Bool)

(assert (=> b!1103675 (= c!109291 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1103675 (= e!630044 e!630048)))

(declare-fun call!46310 () ListLongMap!15395)

(declare-fun bm!46307 () Bool)

(declare-fun c!109292 () Bool)

(assert (=> bm!46307 (= call!46310 (+!3440 (ite c!109292 call!46309 (ite c!109295 call!46312 call!46307)) (ite (or c!109292 c!109295) (tuple2!17419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1103676 () Bool)

(declare-fun e!630049 () Bool)

(assert (=> b!1103676 (= e!630049 (= (apply!962 lt!495081 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun e!630037 () Bool)

(declare-fun b!1103677 () Bool)

(declare-fun get!17694 (ValueCell!12914 V!41457) V!41457)

(assert (=> b!1103677 (= e!630037 (= (apply!962 lt!495081 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)) (get!17694 (select (arr!34383 _values!874) #b00000000000000000000000000000000) (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1103677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34920 _values!874)))))

(assert (=> b!1103677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(declare-fun b!1103668 () Bool)

(assert (=> b!1103668 (= e!630045 (+!3440 call!46310 (tuple2!17419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun d!131189 () Bool)

(assert (=> d!131189 e!630038))

(declare-fun res!736060 () Bool)

(assert (=> d!131189 (=> (not res!736060) (not e!630038))))

(assert (=> d!131189 (= res!736060 (or (bvsge #b00000000000000000000000000000000 (size!34919 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))))

(declare-fun lt!495069 () ListLongMap!15395)

(assert (=> d!131189 (= lt!495081 lt!495069)))

(declare-fun lt!495076 () Unit!36211)

(assert (=> d!131189 (= lt!495076 e!630043)))

(declare-fun c!109293 () Bool)

(declare-fun e!630046 () Bool)

(assert (=> d!131189 (= c!109293 e!630046)))

(declare-fun res!736061 () Bool)

(assert (=> d!131189 (=> (not res!736061) (not e!630046))))

(assert (=> d!131189 (= res!736061 (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(assert (=> d!131189 (= lt!495069 e!630045)))

(assert (=> d!131189 (= c!109292 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131189 (validMask!0 mask!1414)))

(assert (=> d!131189 (= (getCurrentListMap!4412 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495081)))

(declare-fun b!1103678 () Bool)

(assert (=> b!1103678 (= e!630040 e!630049)))

(declare-fun res!736064 () Bool)

(assert (=> b!1103678 (= res!736064 call!46308)))

(assert (=> b!1103678 (=> (not res!736064) (not e!630049))))

(declare-fun b!1103679 () Bool)

(assert (=> b!1103679 (= e!630038 e!630040)))

(declare-fun c!109296 () Bool)

(assert (=> b!1103679 (= c!109296 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1103680 () Bool)

(assert (=> b!1103680 (= e!630044 call!46306)))

(declare-fun bm!46308 () Bool)

(assert (=> bm!46308 (= call!46311 (contains!6431 lt!495081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103681 () Bool)

(assert (=> b!1103681 (= e!630042 e!630037)))

(declare-fun res!736059 () Bool)

(assert (=> b!1103681 (=> (not res!736059) (not e!630037))))

(assert (=> b!1103681 (= res!736059 (contains!6431 lt!495081 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1103681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(declare-fun b!1103682 () Bool)

(assert (=> b!1103682 (= e!630048 call!46307)))

(declare-fun b!1103683 () Bool)

(assert (=> b!1103683 (= e!630046 (validKeyInArray!0 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46309 () Bool)

(assert (=> bm!46309 (= call!46306 call!46310)))

(declare-fun b!1103684 () Bool)

(assert (=> b!1103684 (= e!630041 (= (apply!962 lt!495081 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1103685 () Bool)

(assert (=> b!1103685 (= e!630039 (validKeyInArray!0 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!131189 c!109292) b!1103668))

(assert (= (and d!131189 (not c!109292)) b!1103665))

(assert (= (and b!1103665 c!109295) b!1103680))

(assert (= (and b!1103665 (not c!109295)) b!1103675))

(assert (= (and b!1103675 c!109291) b!1103669))

(assert (= (and b!1103675 (not c!109291)) b!1103682))

(assert (= (or b!1103669 b!1103682) bm!46306))

(assert (= (or b!1103680 bm!46306) bm!46303))

(assert (= (or b!1103680 b!1103669) bm!46309))

(assert (= (or b!1103668 bm!46303) bm!46305))

(assert (= (or b!1103668 bm!46309) bm!46307))

(assert (= (and d!131189 res!736061) b!1103683))

(assert (= (and d!131189 c!109293) b!1103666))

(assert (= (and d!131189 (not c!109293)) b!1103667))

(assert (= (and d!131189 res!736060) b!1103672))

(assert (= (and b!1103672 res!736058) b!1103685))

(assert (= (and b!1103672 (not res!736062)) b!1103681))

(assert (= (and b!1103681 res!736059) b!1103677))

(assert (= (and b!1103672 res!736065) b!1103670))

(assert (= (and b!1103670 c!109294) b!1103674))

(assert (= (and b!1103670 (not c!109294)) b!1103673))

(assert (= (and b!1103674 res!736063) b!1103684))

(assert (= (or b!1103674 b!1103673) bm!46308))

(assert (= (and b!1103670 res!736066) b!1103679))

(assert (= (and b!1103679 c!109296) b!1103678))

(assert (= (and b!1103679 (not c!109296)) b!1103671))

(assert (= (and b!1103678 res!736064) b!1103676))

(assert (= (or b!1103678 b!1103671) bm!46304))

(declare-fun b_lambda!18173 () Bool)

(assert (=> (not b_lambda!18173) (not b!1103677)))

(assert (=> b!1103677 t!34272))

(declare-fun b_and!37219 () Bool)

(assert (= b_and!37209 (and (=> t!34272 result!16661) b_and!37219)))

(assert (=> b!1103681 m!1024289))

(assert (=> b!1103681 m!1024289))

(declare-fun m!1024293 () Bool)

(assert (=> b!1103681 m!1024293))

(assert (=> bm!46305 m!1024189))

(declare-fun m!1024295 () Bool)

(assert (=> bm!46304 m!1024295))

(declare-fun m!1024297 () Bool)

(assert (=> b!1103668 m!1024297))

(assert (=> b!1103677 m!1024289))

(declare-fun m!1024299 () Bool)

(assert (=> b!1103677 m!1024299))

(assert (=> b!1103677 m!1024289))

(assert (=> b!1103677 m!1024175))

(declare-fun m!1024301 () Bool)

(assert (=> b!1103677 m!1024301))

(assert (=> b!1103677 m!1024301))

(assert (=> b!1103677 m!1024175))

(declare-fun m!1024303 () Bool)

(assert (=> b!1103677 m!1024303))

(assert (=> b!1103685 m!1024289))

(assert (=> b!1103685 m!1024289))

(declare-fun m!1024305 () Bool)

(assert (=> b!1103685 m!1024305))

(declare-fun m!1024307 () Bool)

(assert (=> b!1103676 m!1024307))

(declare-fun m!1024309 () Bool)

(assert (=> b!1103666 m!1024309))

(declare-fun m!1024311 () Bool)

(assert (=> b!1103666 m!1024311))

(assert (=> b!1103666 m!1024289))

(assert (=> b!1103666 m!1024189))

(declare-fun m!1024313 () Bool)

(assert (=> b!1103666 m!1024313))

(declare-fun m!1024315 () Bool)

(assert (=> b!1103666 m!1024315))

(declare-fun m!1024317 () Bool)

(assert (=> b!1103666 m!1024317))

(declare-fun m!1024319 () Bool)

(assert (=> b!1103666 m!1024319))

(declare-fun m!1024321 () Bool)

(assert (=> b!1103666 m!1024321))

(assert (=> b!1103666 m!1024309))

(declare-fun m!1024323 () Bool)

(assert (=> b!1103666 m!1024323))

(assert (=> b!1103666 m!1024315))

(declare-fun m!1024325 () Bool)

(assert (=> b!1103666 m!1024325))

(declare-fun m!1024327 () Bool)

(assert (=> b!1103666 m!1024327))

(declare-fun m!1024329 () Bool)

(assert (=> b!1103666 m!1024329))

(assert (=> b!1103666 m!1024327))

(declare-fun m!1024331 () Bool)

(assert (=> b!1103666 m!1024331))

(declare-fun m!1024333 () Bool)

(assert (=> b!1103666 m!1024333))

(declare-fun m!1024335 () Bool)

(assert (=> b!1103666 m!1024335))

(assert (=> b!1103666 m!1024313))

(declare-fun m!1024337 () Bool)

(assert (=> b!1103666 m!1024337))

(assert (=> d!131189 m!1024163))

(declare-fun m!1024339 () Bool)

(assert (=> b!1103684 m!1024339))

(assert (=> b!1103683 m!1024289))

(assert (=> b!1103683 m!1024289))

(assert (=> b!1103683 m!1024305))

(declare-fun m!1024341 () Bool)

(assert (=> bm!46307 m!1024341))

(declare-fun m!1024343 () Bool)

(assert (=> bm!46308 m!1024343))

(assert (=> b!1103530 d!131189))

(declare-fun b!1103686 () Bool)

(declare-fun e!630058 () ListLongMap!15395)

(declare-fun e!630057 () ListLongMap!15395)

(assert (=> b!1103686 (= e!630058 e!630057)))

(declare-fun c!109301 () Bool)

(assert (=> b!1103686 (= c!109301 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1103687 () Bool)

(declare-fun e!630056 () Unit!36211)

(declare-fun lt!495095 () Unit!36211)

(assert (=> b!1103687 (= e!630056 lt!495095)))

(declare-fun lt!495102 () ListLongMap!15395)

(assert (=> b!1103687 (= lt!495102 (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495109 () (_ BitVec 64))

(assert (=> b!1103687 (= lt!495109 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495093 () (_ BitVec 64))

(assert (=> b!1103687 (= lt!495093 (select (arr!34382 lt!494960) #b00000000000000000000000000000000))))

(declare-fun lt!495105 () Unit!36211)

(assert (=> b!1103687 (= lt!495105 (addStillContains!666 lt!495102 lt!495109 zeroValue!831 lt!495093))))

(assert (=> b!1103687 (contains!6431 (+!3440 lt!495102 (tuple2!17419 lt!495109 zeroValue!831)) lt!495093)))

(declare-fun lt!495107 () Unit!36211)

(assert (=> b!1103687 (= lt!495107 lt!495105)))

(declare-fun lt!495089 () ListLongMap!15395)

(assert (=> b!1103687 (= lt!495089 (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495097 () (_ BitVec 64))

(assert (=> b!1103687 (= lt!495097 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495108 () (_ BitVec 64))

(assert (=> b!1103687 (= lt!495108 (select (arr!34382 lt!494960) #b00000000000000000000000000000000))))

(declare-fun lt!495106 () Unit!36211)

(assert (=> b!1103687 (= lt!495106 (addApplyDifferent!522 lt!495089 lt!495097 minValue!831 lt!495108))))

(assert (=> b!1103687 (= (apply!962 (+!3440 lt!495089 (tuple2!17419 lt!495097 minValue!831)) lt!495108) (apply!962 lt!495089 lt!495108))))

(declare-fun lt!495096 () Unit!36211)

(assert (=> b!1103687 (= lt!495096 lt!495106)))

(declare-fun lt!495101 () ListLongMap!15395)

(assert (=> b!1103687 (= lt!495101 (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495092 () (_ BitVec 64))

(assert (=> b!1103687 (= lt!495092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495088 () (_ BitVec 64))

(assert (=> b!1103687 (= lt!495088 (select (arr!34382 lt!494960) #b00000000000000000000000000000000))))

(declare-fun lt!495094 () Unit!36211)

(assert (=> b!1103687 (= lt!495094 (addApplyDifferent!522 lt!495101 lt!495092 zeroValue!831 lt!495088))))

(assert (=> b!1103687 (= (apply!962 (+!3440 lt!495101 (tuple2!17419 lt!495092 zeroValue!831)) lt!495088) (apply!962 lt!495101 lt!495088))))

(declare-fun lt!495090 () Unit!36211)

(assert (=> b!1103687 (= lt!495090 lt!495094)))

(declare-fun lt!495099 () ListLongMap!15395)

(assert (=> b!1103687 (= lt!495099 (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495100 () (_ BitVec 64))

(assert (=> b!1103687 (= lt!495100 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495104 () (_ BitVec 64))

(assert (=> b!1103687 (= lt!495104 (select (arr!34382 lt!494960) #b00000000000000000000000000000000))))

(assert (=> b!1103687 (= lt!495095 (addApplyDifferent!522 lt!495099 lt!495100 minValue!831 lt!495104))))

(assert (=> b!1103687 (= (apply!962 (+!3440 lt!495099 (tuple2!17419 lt!495100 minValue!831)) lt!495104) (apply!962 lt!495099 lt!495104))))

(declare-fun b!1103688 () Bool)

(declare-fun Unit!36216 () Unit!36211)

(assert (=> b!1103688 (= e!630056 Unit!36216)))

(declare-fun bm!46310 () Bool)

(declare-fun call!46319 () ListLongMap!15395)

(declare-fun call!46316 () ListLongMap!15395)

(assert (=> bm!46310 (= call!46319 call!46316)))

(declare-fun b!1103690 () Bool)

(declare-fun e!630061 () ListLongMap!15395)

(declare-fun call!46313 () ListLongMap!15395)

(assert (=> b!1103690 (= e!630061 call!46313)))

(declare-fun b!1103691 () Bool)

(declare-fun res!736075 () Bool)

(declare-fun e!630051 () Bool)

(assert (=> b!1103691 (=> (not res!736075) (not e!630051))))

(declare-fun e!630060 () Bool)

(assert (=> b!1103691 (= res!736075 e!630060)))

(declare-fun c!109300 () Bool)

(assert (=> b!1103691 (= c!109300 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1103692 () Bool)

(declare-fun e!630053 () Bool)

(declare-fun call!46315 () Bool)

(assert (=> b!1103692 (= e!630053 (not call!46315))))

(declare-fun bm!46311 () Bool)

(declare-fun lt!495103 () ListLongMap!15395)

(assert (=> bm!46311 (= call!46315 (contains!6431 lt!495103 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103693 () Bool)

(declare-fun res!736074 () Bool)

(assert (=> b!1103693 (=> (not res!736074) (not e!630051))))

(declare-fun e!630055 () Bool)

(assert (=> b!1103693 (= res!736074 e!630055)))

(declare-fun res!736071 () Bool)

(assert (=> b!1103693 (=> res!736071 e!630055)))

(declare-fun e!630052 () Bool)

(assert (=> b!1103693 (= res!736071 (not e!630052))))

(declare-fun res!736067 () Bool)

(assert (=> b!1103693 (=> (not res!736067) (not e!630052))))

(assert (=> b!1103693 (= res!736067 (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(declare-fun b!1103694 () Bool)

(declare-fun call!46318 () Bool)

(assert (=> b!1103694 (= e!630060 (not call!46318))))

(declare-fun bm!46312 () Bool)

(assert (=> bm!46312 (= call!46316 (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46313 () Bool)

(declare-fun call!46314 () ListLongMap!15395)

(assert (=> bm!46313 (= call!46314 call!46319)))

(declare-fun b!1103695 () Bool)

(declare-fun e!630054 () Bool)

(assert (=> b!1103695 (= e!630060 e!630054)))

(declare-fun res!736072 () Bool)

(assert (=> b!1103695 (= res!736072 call!46318)))

(assert (=> b!1103695 (=> (not res!736072) (not e!630054))))

(declare-fun b!1103696 () Bool)

(declare-fun c!109297 () Bool)

(assert (=> b!1103696 (= c!109297 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1103696 (= e!630057 e!630061)))

(declare-fun bm!46314 () Bool)

(declare-fun call!46317 () ListLongMap!15395)

(declare-fun c!109298 () Bool)

(assert (=> bm!46314 (= call!46317 (+!3440 (ite c!109298 call!46316 (ite c!109301 call!46319 call!46314)) (ite (or c!109298 c!109301) (tuple2!17419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1103697 () Bool)

(declare-fun e!630062 () Bool)

(assert (=> b!1103697 (= e!630062 (= (apply!962 lt!495103 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun e!630050 () Bool)

(declare-fun b!1103698 () Bool)

(assert (=> b!1103698 (= e!630050 (= (apply!962 lt!495103 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)) (get!17694 (select (arr!34383 lt!494952) #b00000000000000000000000000000000) (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1103698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34920 lt!494952)))))

(assert (=> b!1103698 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(declare-fun b!1103689 () Bool)

(assert (=> b!1103689 (= e!630058 (+!3440 call!46317 (tuple2!17419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun d!131191 () Bool)

(assert (=> d!131191 e!630051))

(declare-fun res!736069 () Bool)

(assert (=> d!131191 (=> (not res!736069) (not e!630051))))

(assert (=> d!131191 (= res!736069 (or (bvsge #b00000000000000000000000000000000 (size!34919 lt!494960)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))))

(declare-fun lt!495091 () ListLongMap!15395)

(assert (=> d!131191 (= lt!495103 lt!495091)))

(declare-fun lt!495098 () Unit!36211)

(assert (=> d!131191 (= lt!495098 e!630056)))

(declare-fun c!109299 () Bool)

(declare-fun e!630059 () Bool)

(assert (=> d!131191 (= c!109299 e!630059)))

(declare-fun res!736070 () Bool)

(assert (=> d!131191 (=> (not res!736070) (not e!630059))))

(assert (=> d!131191 (= res!736070 (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(assert (=> d!131191 (= lt!495091 e!630058)))

(assert (=> d!131191 (= c!109298 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131191 (validMask!0 mask!1414)))

(assert (=> d!131191 (= (getCurrentListMap!4412 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495103)))

(declare-fun b!1103699 () Bool)

(assert (=> b!1103699 (= e!630053 e!630062)))

(declare-fun res!736073 () Bool)

(assert (=> b!1103699 (= res!736073 call!46315)))

(assert (=> b!1103699 (=> (not res!736073) (not e!630062))))

(declare-fun b!1103700 () Bool)

(assert (=> b!1103700 (= e!630051 e!630053)))

(declare-fun c!109302 () Bool)

(assert (=> b!1103700 (= c!109302 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1103701 () Bool)

(assert (=> b!1103701 (= e!630057 call!46313)))

(declare-fun bm!46315 () Bool)

(assert (=> bm!46315 (= call!46318 (contains!6431 lt!495103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103702 () Bool)

(assert (=> b!1103702 (= e!630055 e!630050)))

(declare-fun res!736068 () Bool)

(assert (=> b!1103702 (=> (not res!736068) (not e!630050))))

(assert (=> b!1103702 (= res!736068 (contains!6431 lt!495103 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(assert (=> b!1103702 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(declare-fun b!1103703 () Bool)

(assert (=> b!1103703 (= e!630061 call!46314)))

(declare-fun b!1103704 () Bool)

(assert (=> b!1103704 (= e!630059 (validKeyInArray!0 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(declare-fun bm!46316 () Bool)

(assert (=> bm!46316 (= call!46313 call!46317)))

(declare-fun b!1103705 () Bool)

(assert (=> b!1103705 (= e!630054 (= (apply!962 lt!495103 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1103706 () Bool)

(assert (=> b!1103706 (= e!630052 (validKeyInArray!0 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(assert (= (and d!131191 c!109298) b!1103689))

(assert (= (and d!131191 (not c!109298)) b!1103686))

(assert (= (and b!1103686 c!109301) b!1103701))

(assert (= (and b!1103686 (not c!109301)) b!1103696))

(assert (= (and b!1103696 c!109297) b!1103690))

(assert (= (and b!1103696 (not c!109297)) b!1103703))

(assert (= (or b!1103690 b!1103703) bm!46313))

(assert (= (or b!1103701 bm!46313) bm!46310))

(assert (= (or b!1103701 b!1103690) bm!46316))

(assert (= (or b!1103689 bm!46310) bm!46312))

(assert (= (or b!1103689 bm!46316) bm!46314))

(assert (= (and d!131191 res!736070) b!1103704))

(assert (= (and d!131191 c!109299) b!1103687))

(assert (= (and d!131191 (not c!109299)) b!1103688))

(assert (= (and d!131191 res!736069) b!1103693))

(assert (= (and b!1103693 res!736067) b!1103706))

(assert (= (and b!1103693 (not res!736071)) b!1103702))

(assert (= (and b!1103702 res!736068) b!1103698))

(assert (= (and b!1103693 res!736074) b!1103691))

(assert (= (and b!1103691 c!109300) b!1103695))

(assert (= (and b!1103691 (not c!109300)) b!1103694))

(assert (= (and b!1103695 res!736072) b!1103705))

(assert (= (or b!1103695 b!1103694) bm!46315))

(assert (= (and b!1103691 res!736075) b!1103700))

(assert (= (and b!1103700 c!109302) b!1103699))

(assert (= (and b!1103700 (not c!109302)) b!1103692))

(assert (= (and b!1103699 res!736073) b!1103697))

(assert (= (or b!1103699 b!1103692) bm!46311))

(declare-fun b_lambda!18175 () Bool)

(assert (=> (not b_lambda!18175) (not b!1103698)))

(assert (=> b!1103698 t!34272))

(declare-fun b_and!37221 () Bool)

(assert (= b_and!37219 (and (=> t!34272 result!16661) b_and!37221)))

(declare-fun m!1024345 () Bool)

(assert (=> b!1103702 m!1024345))

(assert (=> b!1103702 m!1024345))

(declare-fun m!1024347 () Bool)

(assert (=> b!1103702 m!1024347))

(assert (=> bm!46312 m!1024187))

(declare-fun m!1024349 () Bool)

(assert (=> bm!46311 m!1024349))

(declare-fun m!1024351 () Bool)

(assert (=> b!1103689 m!1024351))

(assert (=> b!1103698 m!1024345))

(declare-fun m!1024353 () Bool)

(assert (=> b!1103698 m!1024353))

(assert (=> b!1103698 m!1024345))

(assert (=> b!1103698 m!1024175))

(declare-fun m!1024355 () Bool)

(assert (=> b!1103698 m!1024355))

(assert (=> b!1103698 m!1024355))

(assert (=> b!1103698 m!1024175))

(declare-fun m!1024357 () Bool)

(assert (=> b!1103698 m!1024357))

(assert (=> b!1103706 m!1024345))

(assert (=> b!1103706 m!1024345))

(declare-fun m!1024359 () Bool)

(assert (=> b!1103706 m!1024359))

(declare-fun m!1024361 () Bool)

(assert (=> b!1103697 m!1024361))

(declare-fun m!1024363 () Bool)

(assert (=> b!1103687 m!1024363))

(declare-fun m!1024365 () Bool)

(assert (=> b!1103687 m!1024365))

(assert (=> b!1103687 m!1024345))

(assert (=> b!1103687 m!1024187))

(declare-fun m!1024367 () Bool)

(assert (=> b!1103687 m!1024367))

(declare-fun m!1024369 () Bool)

(assert (=> b!1103687 m!1024369))

(declare-fun m!1024371 () Bool)

(assert (=> b!1103687 m!1024371))

(declare-fun m!1024373 () Bool)

(assert (=> b!1103687 m!1024373))

(declare-fun m!1024375 () Bool)

(assert (=> b!1103687 m!1024375))

(assert (=> b!1103687 m!1024363))

(declare-fun m!1024377 () Bool)

(assert (=> b!1103687 m!1024377))

(assert (=> b!1103687 m!1024369))

(declare-fun m!1024379 () Bool)

(assert (=> b!1103687 m!1024379))

(declare-fun m!1024381 () Bool)

(assert (=> b!1103687 m!1024381))

(declare-fun m!1024383 () Bool)

(assert (=> b!1103687 m!1024383))

(assert (=> b!1103687 m!1024381))

(declare-fun m!1024385 () Bool)

(assert (=> b!1103687 m!1024385))

(declare-fun m!1024387 () Bool)

(assert (=> b!1103687 m!1024387))

(declare-fun m!1024389 () Bool)

(assert (=> b!1103687 m!1024389))

(assert (=> b!1103687 m!1024367))

(declare-fun m!1024391 () Bool)

(assert (=> b!1103687 m!1024391))

(assert (=> d!131191 m!1024163))

(declare-fun m!1024393 () Bool)

(assert (=> b!1103705 m!1024393))

(assert (=> b!1103704 m!1024345))

(assert (=> b!1103704 m!1024345))

(assert (=> b!1103704 m!1024359))

(declare-fun m!1024395 () Bool)

(assert (=> bm!46314 m!1024395))

(declare-fun m!1024397 () Bool)

(assert (=> bm!46315 m!1024397))

(assert (=> b!1103530 d!131191))

(declare-fun d!131193 () Bool)

(declare-fun lt!495112 () ListLongMap!15395)

(assert (=> d!131193 (not (contains!6431 lt!495112 k0!904))))

(declare-fun removeStrictlySorted!86 (List!24039 (_ BitVec 64)) List!24039)

(assert (=> d!131193 (= lt!495112 (ListLongMap!15396 (removeStrictlySorted!86 (toList!7713 lt!494956) k0!904)))))

(assert (=> d!131193 (= (-!976 lt!494956 k0!904) lt!495112)))

(declare-fun bs!32362 () Bool)

(assert (= bs!32362 d!131193))

(declare-fun m!1024399 () Bool)

(assert (=> bs!32362 m!1024399))

(declare-fun m!1024401 () Bool)

(assert (=> bs!32362 m!1024401))

(assert (=> b!1103530 d!131193))

(declare-fun b!1103731 () Bool)

(declare-fun e!630078 () Bool)

(declare-fun e!630083 () Bool)

(assert (=> b!1103731 (= e!630078 e!630083)))

(declare-fun c!109313 () Bool)

(assert (=> b!1103731 (= c!109313 (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(declare-fun b!1103732 () Bool)

(declare-fun lt!495130 () ListLongMap!15395)

(assert (=> b!1103732 (= e!630083 (= lt!495130 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1103733 () Bool)

(declare-fun e!630081 () ListLongMap!15395)

(declare-fun call!46322 () ListLongMap!15395)

(assert (=> b!1103733 (= e!630081 call!46322)))

(declare-fun b!1103734 () Bool)

(declare-fun e!630082 () Bool)

(assert (=> b!1103734 (= e!630078 e!630082)))

(assert (=> b!1103734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(declare-fun res!736086 () Bool)

(assert (=> b!1103734 (= res!736086 (contains!6431 lt!495130 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1103734 (=> (not res!736086) (not e!630082))))

(declare-fun b!1103736 () Bool)

(declare-fun e!630080 () ListLongMap!15395)

(assert (=> b!1103736 (= e!630080 (ListLongMap!15396 Nil!24036))))

(declare-fun b!1103737 () Bool)

(declare-fun res!736087 () Bool)

(declare-fun e!630079 () Bool)

(assert (=> b!1103737 (=> (not res!736087) (not e!630079))))

(assert (=> b!1103737 (= res!736087 (not (contains!6431 lt!495130 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!46319 () Bool)

(assert (=> bm!46319 (= call!46322 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1103738 () Bool)

(declare-fun lt!495127 () Unit!36211)

(declare-fun lt!495132 () Unit!36211)

(assert (=> b!1103738 (= lt!495127 lt!495132)))

(declare-fun lt!495129 () ListLongMap!15395)

(declare-fun lt!495131 () (_ BitVec 64))

(declare-fun lt!495133 () (_ BitVec 64))

(declare-fun lt!495128 () V!41457)

(assert (=> b!1103738 (not (contains!6431 (+!3440 lt!495129 (tuple2!17419 lt!495133 lt!495128)) lt!495131))))

(declare-fun addStillNotContains!283 (ListLongMap!15395 (_ BitVec 64) V!41457 (_ BitVec 64)) Unit!36211)

(assert (=> b!1103738 (= lt!495132 (addStillNotContains!283 lt!495129 lt!495133 lt!495128 lt!495131))))

(assert (=> b!1103738 (= lt!495131 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1103738 (= lt!495128 (get!17694 (select (arr!34383 _values!874) #b00000000000000000000000000000000) (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1103738 (= lt!495133 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1103738 (= lt!495129 call!46322)))

(assert (=> b!1103738 (= e!630081 (+!3440 call!46322 (tuple2!17419 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000) (get!17694 (select (arr!34383 _values!874) #b00000000000000000000000000000000) (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1103735 () Bool)

(assert (=> b!1103735 (= e!630080 e!630081)))

(declare-fun c!109311 () Bool)

(assert (=> b!1103735 (= c!109311 (validKeyInArray!0 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!131195 () Bool)

(assert (=> d!131195 e!630079))

(declare-fun res!736084 () Bool)

(assert (=> d!131195 (=> (not res!736084) (not e!630079))))

(assert (=> d!131195 (= res!736084 (not (contains!6431 lt!495130 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131195 (= lt!495130 e!630080)))

(declare-fun c!109314 () Bool)

(assert (=> d!131195 (= c!109314 (bvsge #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(assert (=> d!131195 (validMask!0 mask!1414)))

(assert (=> d!131195 (= (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495130)))

(declare-fun b!1103739 () Bool)

(assert (=> b!1103739 (= e!630079 e!630078)))

(declare-fun c!109312 () Bool)

(declare-fun e!630077 () Bool)

(assert (=> b!1103739 (= c!109312 e!630077)))

(declare-fun res!736085 () Bool)

(assert (=> b!1103739 (=> (not res!736085) (not e!630077))))

(assert (=> b!1103739 (= res!736085 (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(declare-fun b!1103740 () Bool)

(assert (=> b!1103740 (= e!630077 (validKeyInArray!0 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1103740 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1103741 () Bool)

(declare-fun isEmpty!975 (ListLongMap!15395) Bool)

(assert (=> b!1103741 (= e!630083 (isEmpty!975 lt!495130))))

(declare-fun b!1103742 () Bool)

(assert (=> b!1103742 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(assert (=> b!1103742 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34920 _values!874)))))

(assert (=> b!1103742 (= e!630082 (= (apply!962 lt!495130 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)) (get!17694 (select (arr!34383 _values!874) #b00000000000000000000000000000000) (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!131195 c!109314) b!1103736))

(assert (= (and d!131195 (not c!109314)) b!1103735))

(assert (= (and b!1103735 c!109311) b!1103738))

(assert (= (and b!1103735 (not c!109311)) b!1103733))

(assert (= (or b!1103738 b!1103733) bm!46319))

(assert (= (and d!131195 res!736084) b!1103737))

(assert (= (and b!1103737 res!736087) b!1103739))

(assert (= (and b!1103739 res!736085) b!1103740))

(assert (= (and b!1103739 c!109312) b!1103734))

(assert (= (and b!1103739 (not c!109312)) b!1103731))

(assert (= (and b!1103734 res!736086) b!1103742))

(assert (= (and b!1103731 c!109313) b!1103732))

(assert (= (and b!1103731 (not c!109313)) b!1103741))

(declare-fun b_lambda!18177 () Bool)

(assert (=> (not b_lambda!18177) (not b!1103738)))

(assert (=> b!1103738 t!34272))

(declare-fun b_and!37223 () Bool)

(assert (= b_and!37221 (and (=> t!34272 result!16661) b_and!37223)))

(declare-fun b_lambda!18179 () Bool)

(assert (=> (not b_lambda!18179) (not b!1103742)))

(assert (=> b!1103742 t!34272))

(declare-fun b_and!37225 () Bool)

(assert (= b_and!37223 (and (=> t!34272 result!16661) b_and!37225)))

(assert (=> b!1103734 m!1024289))

(assert (=> b!1103734 m!1024289))

(declare-fun m!1024403 () Bool)

(assert (=> b!1103734 m!1024403))

(declare-fun m!1024405 () Bool)

(assert (=> d!131195 m!1024405))

(assert (=> d!131195 m!1024163))

(declare-fun m!1024407 () Bool)

(assert (=> b!1103741 m!1024407))

(declare-fun m!1024409 () Bool)

(assert (=> b!1103732 m!1024409))

(declare-fun m!1024411 () Bool)

(assert (=> b!1103737 m!1024411))

(assert (=> b!1103740 m!1024289))

(assert (=> b!1103740 m!1024289))

(assert (=> b!1103740 m!1024305))

(declare-fun m!1024413 () Bool)

(assert (=> b!1103738 m!1024413))

(declare-fun m!1024415 () Bool)

(assert (=> b!1103738 m!1024415))

(assert (=> b!1103738 m!1024301))

(assert (=> b!1103738 m!1024175))

(assert (=> b!1103738 m!1024303))

(declare-fun m!1024417 () Bool)

(assert (=> b!1103738 m!1024417))

(assert (=> b!1103738 m!1024175))

(assert (=> b!1103738 m!1024417))

(declare-fun m!1024419 () Bool)

(assert (=> b!1103738 m!1024419))

(assert (=> b!1103738 m!1024301))

(assert (=> b!1103738 m!1024289))

(assert (=> b!1103742 m!1024289))

(declare-fun m!1024421 () Bool)

(assert (=> b!1103742 m!1024421))

(assert (=> b!1103742 m!1024301))

(assert (=> b!1103742 m!1024175))

(assert (=> b!1103742 m!1024303))

(assert (=> b!1103742 m!1024175))

(assert (=> b!1103742 m!1024301))

(assert (=> b!1103742 m!1024289))

(assert (=> bm!46319 m!1024409))

(assert (=> b!1103735 m!1024289))

(assert (=> b!1103735 m!1024289))

(assert (=> b!1103735 m!1024305))

(assert (=> b!1103530 d!131195))

(declare-fun d!131197 () Bool)

(assert (=> d!131197 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!495136 () Unit!36211)

(declare-fun choose!13 (array!71453 (_ BitVec 64) (_ BitVec 32)) Unit!36211)

(assert (=> d!131197 (= lt!495136 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!131197 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!131197 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!495136)))

(declare-fun bs!32363 () Bool)

(assert (= bs!32363 d!131197))

(assert (=> bs!32363 m!1024181))

(declare-fun m!1024423 () Bool)

(assert (=> bs!32363 m!1024423))

(assert (=> b!1103530 d!131197))

(declare-fun call!46327 () ListLongMap!15395)

(declare-fun bm!46324 () Bool)

(assert (=> bm!46324 (= call!46327 (getCurrentListMapNoExtraKeys!4253 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46325 () Bool)

(declare-fun call!46328 () ListLongMap!15395)

(assert (=> bm!46325 (= call!46328 (getCurrentListMapNoExtraKeys!4253 (array!71454 (store (arr!34382 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34919 _keys!1070)) (array!71456 (store (arr!34383 _values!874) i!650 (ValueCellFull!12914 (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34920 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!131199 () Bool)

(declare-fun e!630088 () Bool)

(assert (=> d!131199 e!630088))

(declare-fun res!736090 () Bool)

(assert (=> d!131199 (=> (not res!736090) (not e!630088))))

(assert (=> d!131199 (= res!736090 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34919 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34919 _keys!1070))))))))

(declare-fun lt!495139 () Unit!36211)

(declare-fun choose!1777 (array!71453 array!71455 (_ BitVec 32) (_ BitVec 32) V!41457 V!41457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36211)

(assert (=> d!131199 (= lt!495139 (choose!1777 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!131199 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(assert (=> d!131199 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!246 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!495139)))

(declare-fun b!1103749 () Bool)

(declare-fun e!630089 () Bool)

(assert (=> b!1103749 (= e!630089 (= call!46328 (-!976 call!46327 k0!904)))))

(assert (=> b!1103749 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34920 _values!874)))))

(declare-fun b!1103750 () Bool)

(assert (=> b!1103750 (= e!630089 (= call!46328 call!46327))))

(assert (=> b!1103750 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34920 _values!874)))))

(declare-fun b!1103751 () Bool)

(assert (=> b!1103751 (= e!630088 e!630089)))

(declare-fun c!109317 () Bool)

(assert (=> b!1103751 (= c!109317 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!131199 res!736090) b!1103751))

(assert (= (and b!1103751 c!109317) b!1103749))

(assert (= (and b!1103751 (not c!109317)) b!1103750))

(assert (= (or b!1103749 b!1103750) bm!46324))

(assert (= (or b!1103749 b!1103750) bm!46325))

(declare-fun b_lambda!18181 () Bool)

(assert (=> (not b_lambda!18181) (not bm!46325)))

(assert (=> bm!46325 t!34272))

(declare-fun b_and!37227 () Bool)

(assert (= b_and!37225 (and (=> t!34272 result!16661) b_and!37227)))

(assert (=> bm!46324 m!1024189))

(assert (=> bm!46325 m!1024171))

(assert (=> bm!46325 m!1024175))

(assert (=> bm!46325 m!1024179))

(declare-fun m!1024425 () Bool)

(assert (=> bm!46325 m!1024425))

(declare-fun m!1024427 () Bool)

(assert (=> d!131199 m!1024427))

(declare-fun m!1024429 () Bool)

(assert (=> b!1103749 m!1024429))

(assert (=> b!1103530 d!131199))

(declare-fun b!1103752 () Bool)

(declare-fun e!630091 () Bool)

(declare-fun e!630096 () Bool)

(assert (=> b!1103752 (= e!630091 e!630096)))

(declare-fun c!109320 () Bool)

(assert (=> b!1103752 (= c!109320 (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(declare-fun lt!495143 () ListLongMap!15395)

(declare-fun b!1103753 () Bool)

(assert (=> b!1103753 (= e!630096 (= lt!495143 (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1103754 () Bool)

(declare-fun e!630094 () ListLongMap!15395)

(declare-fun call!46329 () ListLongMap!15395)

(assert (=> b!1103754 (= e!630094 call!46329)))

(declare-fun b!1103755 () Bool)

(declare-fun e!630095 () Bool)

(assert (=> b!1103755 (= e!630091 e!630095)))

(assert (=> b!1103755 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(declare-fun res!736093 () Bool)

(assert (=> b!1103755 (= res!736093 (contains!6431 lt!495143 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(assert (=> b!1103755 (=> (not res!736093) (not e!630095))))

(declare-fun b!1103757 () Bool)

(declare-fun e!630093 () ListLongMap!15395)

(assert (=> b!1103757 (= e!630093 (ListLongMap!15396 Nil!24036))))

(declare-fun b!1103758 () Bool)

(declare-fun res!736094 () Bool)

(declare-fun e!630092 () Bool)

(assert (=> b!1103758 (=> (not res!736094) (not e!630092))))

(assert (=> b!1103758 (= res!736094 (not (contains!6431 lt!495143 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!46326 () Bool)

(assert (=> bm!46326 (= call!46329 (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1103759 () Bool)

(declare-fun lt!495140 () Unit!36211)

(declare-fun lt!495145 () Unit!36211)

(assert (=> b!1103759 (= lt!495140 lt!495145)))

(declare-fun lt!495146 () (_ BitVec 64))

(declare-fun lt!495142 () ListLongMap!15395)

(declare-fun lt!495144 () (_ BitVec 64))

(declare-fun lt!495141 () V!41457)

(assert (=> b!1103759 (not (contains!6431 (+!3440 lt!495142 (tuple2!17419 lt!495146 lt!495141)) lt!495144))))

(assert (=> b!1103759 (= lt!495145 (addStillNotContains!283 lt!495142 lt!495146 lt!495141 lt!495144))))

(assert (=> b!1103759 (= lt!495144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1103759 (= lt!495141 (get!17694 (select (arr!34383 lt!494952) #b00000000000000000000000000000000) (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1103759 (= lt!495146 (select (arr!34382 lt!494960) #b00000000000000000000000000000000))))

(assert (=> b!1103759 (= lt!495142 call!46329)))

(assert (=> b!1103759 (= e!630094 (+!3440 call!46329 (tuple2!17419 (select (arr!34382 lt!494960) #b00000000000000000000000000000000) (get!17694 (select (arr!34383 lt!494952) #b00000000000000000000000000000000) (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1103756 () Bool)

(assert (=> b!1103756 (= e!630093 e!630094)))

(declare-fun c!109318 () Bool)

(assert (=> b!1103756 (= c!109318 (validKeyInArray!0 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(declare-fun d!131201 () Bool)

(assert (=> d!131201 e!630092))

(declare-fun res!736091 () Bool)

(assert (=> d!131201 (=> (not res!736091) (not e!630092))))

(assert (=> d!131201 (= res!736091 (not (contains!6431 lt!495143 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131201 (= lt!495143 e!630093)))

(declare-fun c!109321 () Bool)

(assert (=> d!131201 (= c!109321 (bvsge #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(assert (=> d!131201 (validMask!0 mask!1414)))

(assert (=> d!131201 (= (getCurrentListMapNoExtraKeys!4253 lt!494960 lt!494952 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495143)))

(declare-fun b!1103760 () Bool)

(assert (=> b!1103760 (= e!630092 e!630091)))

(declare-fun c!109319 () Bool)

(declare-fun e!630090 () Bool)

(assert (=> b!1103760 (= c!109319 e!630090)))

(declare-fun res!736092 () Bool)

(assert (=> b!1103760 (=> (not res!736092) (not e!630090))))

(assert (=> b!1103760 (= res!736092 (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(declare-fun b!1103761 () Bool)

(assert (=> b!1103761 (= e!630090 (validKeyInArray!0 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(assert (=> b!1103761 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1103762 () Bool)

(assert (=> b!1103762 (= e!630096 (isEmpty!975 lt!495143))))

(declare-fun b!1103763 () Bool)

(assert (=> b!1103763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(assert (=> b!1103763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34920 lt!494952)))))

(assert (=> b!1103763 (= e!630095 (= (apply!962 lt!495143 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)) (get!17694 (select (arr!34383 lt!494952) #b00000000000000000000000000000000) (dynLambda!2371 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!131201 c!109321) b!1103757))

(assert (= (and d!131201 (not c!109321)) b!1103756))

(assert (= (and b!1103756 c!109318) b!1103759))

(assert (= (and b!1103756 (not c!109318)) b!1103754))

(assert (= (or b!1103759 b!1103754) bm!46326))

(assert (= (and d!131201 res!736091) b!1103758))

(assert (= (and b!1103758 res!736094) b!1103760))

(assert (= (and b!1103760 res!736092) b!1103761))

(assert (= (and b!1103760 c!109319) b!1103755))

(assert (= (and b!1103760 (not c!109319)) b!1103752))

(assert (= (and b!1103755 res!736093) b!1103763))

(assert (= (and b!1103752 c!109320) b!1103753))

(assert (= (and b!1103752 (not c!109320)) b!1103762))

(declare-fun b_lambda!18183 () Bool)

(assert (=> (not b_lambda!18183) (not b!1103759)))

(assert (=> b!1103759 t!34272))

(declare-fun b_and!37229 () Bool)

(assert (= b_and!37227 (and (=> t!34272 result!16661) b_and!37229)))

(declare-fun b_lambda!18185 () Bool)

(assert (=> (not b_lambda!18185) (not b!1103763)))

(assert (=> b!1103763 t!34272))

(declare-fun b_and!37231 () Bool)

(assert (= b_and!37229 (and (=> t!34272 result!16661) b_and!37231)))

(assert (=> b!1103755 m!1024345))

(assert (=> b!1103755 m!1024345))

(declare-fun m!1024431 () Bool)

(assert (=> b!1103755 m!1024431))

(declare-fun m!1024433 () Bool)

(assert (=> d!131201 m!1024433))

(assert (=> d!131201 m!1024163))

(declare-fun m!1024435 () Bool)

(assert (=> b!1103762 m!1024435))

(declare-fun m!1024437 () Bool)

(assert (=> b!1103753 m!1024437))

(declare-fun m!1024439 () Bool)

(assert (=> b!1103758 m!1024439))

(assert (=> b!1103761 m!1024345))

(assert (=> b!1103761 m!1024345))

(assert (=> b!1103761 m!1024359))

(declare-fun m!1024441 () Bool)

(assert (=> b!1103759 m!1024441))

(declare-fun m!1024443 () Bool)

(assert (=> b!1103759 m!1024443))

(assert (=> b!1103759 m!1024355))

(assert (=> b!1103759 m!1024175))

(assert (=> b!1103759 m!1024357))

(declare-fun m!1024445 () Bool)

(assert (=> b!1103759 m!1024445))

(assert (=> b!1103759 m!1024175))

(assert (=> b!1103759 m!1024445))

(declare-fun m!1024447 () Bool)

(assert (=> b!1103759 m!1024447))

(assert (=> b!1103759 m!1024355))

(assert (=> b!1103759 m!1024345))

(assert (=> b!1103763 m!1024345))

(declare-fun m!1024449 () Bool)

(assert (=> b!1103763 m!1024449))

(assert (=> b!1103763 m!1024355))

(assert (=> b!1103763 m!1024175))

(assert (=> b!1103763 m!1024357))

(assert (=> b!1103763 m!1024175))

(assert (=> b!1103763 m!1024355))

(assert (=> b!1103763 m!1024345))

(assert (=> bm!46326 m!1024437))

(assert (=> b!1103756 m!1024345))

(assert (=> b!1103756 m!1024345))

(assert (=> b!1103756 m!1024359))

(assert (=> b!1103530 d!131201))

(declare-fun d!131203 () Bool)

(declare-fun res!736100 () Bool)

(declare-fun e!630103 () Bool)

(assert (=> d!131203 (=> res!736100 e!630103)))

(assert (=> d!131203 (= res!736100 (bvsge #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(assert (=> d!131203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494960 mask!1414) e!630103)))

(declare-fun b!1103772 () Bool)

(declare-fun e!630104 () Bool)

(assert (=> b!1103772 (= e!630103 e!630104)))

(declare-fun c!109324 () Bool)

(assert (=> b!1103772 (= c!109324 (validKeyInArray!0 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(declare-fun b!1103773 () Bool)

(declare-fun call!46332 () Bool)

(assert (=> b!1103773 (= e!630104 call!46332)))

(declare-fun b!1103774 () Bool)

(declare-fun e!630105 () Bool)

(assert (=> b!1103774 (= e!630105 call!46332)))

(declare-fun bm!46329 () Bool)

(assert (=> bm!46329 (= call!46332 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!494960 mask!1414))))

(declare-fun b!1103775 () Bool)

(assert (=> b!1103775 (= e!630104 e!630105)))

(declare-fun lt!495154 () (_ BitVec 64))

(assert (=> b!1103775 (= lt!495154 (select (arr!34382 lt!494960) #b00000000000000000000000000000000))))

(declare-fun lt!495153 () Unit!36211)

(assert (=> b!1103775 (= lt!495153 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!494960 lt!495154 #b00000000000000000000000000000000))))

(assert (=> b!1103775 (arrayContainsKey!0 lt!494960 lt!495154 #b00000000000000000000000000000000)))

(declare-fun lt!495155 () Unit!36211)

(assert (=> b!1103775 (= lt!495155 lt!495153)))

(declare-fun res!736099 () Bool)

(declare-datatypes ((SeekEntryResult!9872 0))(
  ( (MissingZero!9872 (index!41859 (_ BitVec 32))) (Found!9872 (index!41860 (_ BitVec 32))) (Intermediate!9872 (undefined!10684 Bool) (index!41861 (_ BitVec 32)) (x!99116 (_ BitVec 32))) (Undefined!9872) (MissingVacant!9872 (index!41862 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71453 (_ BitVec 32)) SeekEntryResult!9872)

(assert (=> b!1103775 (= res!736099 (= (seekEntryOrOpen!0 (select (arr!34382 lt!494960) #b00000000000000000000000000000000) lt!494960 mask!1414) (Found!9872 #b00000000000000000000000000000000)))))

(assert (=> b!1103775 (=> (not res!736099) (not e!630105))))

(assert (= (and d!131203 (not res!736100)) b!1103772))

(assert (= (and b!1103772 c!109324) b!1103775))

(assert (= (and b!1103772 (not c!109324)) b!1103773))

(assert (= (and b!1103775 res!736099) b!1103774))

(assert (= (or b!1103774 b!1103773) bm!46329))

(assert (=> b!1103772 m!1024345))

(assert (=> b!1103772 m!1024345))

(assert (=> b!1103772 m!1024359))

(declare-fun m!1024451 () Bool)

(assert (=> bm!46329 m!1024451))

(assert (=> b!1103775 m!1024345))

(declare-fun m!1024453 () Bool)

(assert (=> b!1103775 m!1024453))

(declare-fun m!1024455 () Bool)

(assert (=> b!1103775 m!1024455))

(assert (=> b!1103775 m!1024345))

(declare-fun m!1024457 () Bool)

(assert (=> b!1103775 m!1024457))

(assert (=> b!1103538 d!131203))

(declare-fun d!131205 () Bool)

(assert (=> d!131205 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!97116 d!131205))

(declare-fun d!131207 () Bool)

(assert (=> d!131207 (= (array_inv!26508 _keys!1070) (bvsge (size!34919 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!97116 d!131207))

(declare-fun d!131209 () Bool)

(assert (=> d!131209 (= (array_inv!26509 _values!874) (bvsge (size!34920 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!97116 d!131209))

(declare-fun b!1103787 () Bool)

(declare-fun e!630114 () Bool)

(declare-fun contains!6432 (List!24038 (_ BitVec 64)) Bool)

(assert (=> b!1103787 (= e!630114 (contains!6432 Nil!24035 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103788 () Bool)

(declare-fun e!630117 () Bool)

(declare-fun call!46335 () Bool)

(assert (=> b!1103788 (= e!630117 call!46335)))

(declare-fun bm!46332 () Bool)

(declare-fun c!109327 () Bool)

(assert (=> bm!46332 (= call!46335 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109327 (Cons!24034 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000) Nil!24035) Nil!24035)))))

(declare-fun b!1103789 () Bool)

(declare-fun e!630115 () Bool)

(declare-fun e!630116 () Bool)

(assert (=> b!1103789 (= e!630115 e!630116)))

(declare-fun res!736107 () Bool)

(assert (=> b!1103789 (=> (not res!736107) (not e!630116))))

(assert (=> b!1103789 (= res!736107 (not e!630114))))

(declare-fun res!736108 () Bool)

(assert (=> b!1103789 (=> (not res!736108) (not e!630114))))

(assert (=> b!1103789 (= res!736108 (validKeyInArray!0 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103790 () Bool)

(assert (=> b!1103790 (= e!630117 call!46335)))

(declare-fun d!131211 () Bool)

(declare-fun res!736109 () Bool)

(assert (=> d!131211 (=> res!736109 e!630115)))

(assert (=> d!131211 (= res!736109 (bvsge #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(assert (=> d!131211 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24035) e!630115)))

(declare-fun b!1103786 () Bool)

(assert (=> b!1103786 (= e!630116 e!630117)))

(assert (=> b!1103786 (= c!109327 (validKeyInArray!0 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!131211 (not res!736109)) b!1103789))

(assert (= (and b!1103789 res!736108) b!1103787))

(assert (= (and b!1103789 res!736107) b!1103786))

(assert (= (and b!1103786 c!109327) b!1103788))

(assert (= (and b!1103786 (not c!109327)) b!1103790))

(assert (= (or b!1103788 b!1103790) bm!46332))

(assert (=> b!1103787 m!1024289))

(assert (=> b!1103787 m!1024289))

(declare-fun m!1024459 () Bool)

(assert (=> b!1103787 m!1024459))

(assert (=> bm!46332 m!1024289))

(declare-fun m!1024461 () Bool)

(assert (=> bm!46332 m!1024461))

(assert (=> b!1103789 m!1024289))

(assert (=> b!1103789 m!1024289))

(assert (=> b!1103789 m!1024305))

(assert (=> b!1103786 m!1024289))

(assert (=> b!1103786 m!1024289))

(assert (=> b!1103786 m!1024305))

(assert (=> b!1103537 d!131211))

(declare-fun b!1103792 () Bool)

(declare-fun e!630118 () Bool)

(assert (=> b!1103792 (= e!630118 (contains!6432 Nil!24035 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(declare-fun b!1103793 () Bool)

(declare-fun e!630121 () Bool)

(declare-fun call!46336 () Bool)

(assert (=> b!1103793 (= e!630121 call!46336)))

(declare-fun bm!46333 () Bool)

(declare-fun c!109328 () Bool)

(assert (=> bm!46333 (= call!46336 (arrayNoDuplicates!0 lt!494960 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109328 (Cons!24034 (select (arr!34382 lt!494960) #b00000000000000000000000000000000) Nil!24035) Nil!24035)))))

(declare-fun b!1103794 () Bool)

(declare-fun e!630119 () Bool)

(declare-fun e!630120 () Bool)

(assert (=> b!1103794 (= e!630119 e!630120)))

(declare-fun res!736110 () Bool)

(assert (=> b!1103794 (=> (not res!736110) (not e!630120))))

(assert (=> b!1103794 (= res!736110 (not e!630118))))

(declare-fun res!736111 () Bool)

(assert (=> b!1103794 (=> (not res!736111) (not e!630118))))

(assert (=> b!1103794 (= res!736111 (validKeyInArray!0 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(declare-fun b!1103795 () Bool)

(assert (=> b!1103795 (= e!630121 call!46336)))

(declare-fun d!131213 () Bool)

(declare-fun res!736112 () Bool)

(assert (=> d!131213 (=> res!736112 e!630119)))

(assert (=> d!131213 (= res!736112 (bvsge #b00000000000000000000000000000000 (size!34919 lt!494960)))))

(assert (=> d!131213 (= (arrayNoDuplicates!0 lt!494960 #b00000000000000000000000000000000 Nil!24035) e!630119)))

(declare-fun b!1103791 () Bool)

(assert (=> b!1103791 (= e!630120 e!630121)))

(assert (=> b!1103791 (= c!109328 (validKeyInArray!0 (select (arr!34382 lt!494960) #b00000000000000000000000000000000)))))

(assert (= (and d!131213 (not res!736112)) b!1103794))

(assert (= (and b!1103794 res!736111) b!1103792))

(assert (= (and b!1103794 res!736110) b!1103791))

(assert (= (and b!1103791 c!109328) b!1103793))

(assert (= (and b!1103791 (not c!109328)) b!1103795))

(assert (= (or b!1103793 b!1103795) bm!46333))

(assert (=> b!1103792 m!1024345))

(assert (=> b!1103792 m!1024345))

(declare-fun m!1024463 () Bool)

(assert (=> b!1103792 m!1024463))

(assert (=> bm!46333 m!1024345))

(declare-fun m!1024465 () Bool)

(assert (=> bm!46333 m!1024465))

(assert (=> b!1103794 m!1024345))

(assert (=> b!1103794 m!1024345))

(assert (=> b!1103794 m!1024359))

(assert (=> b!1103791 m!1024345))

(assert (=> b!1103791 m!1024345))

(assert (=> b!1103791 m!1024359))

(assert (=> b!1103528 d!131213))

(declare-fun d!131215 () Bool)

(declare-fun res!736114 () Bool)

(declare-fun e!630122 () Bool)

(assert (=> d!131215 (=> res!736114 e!630122)))

(assert (=> d!131215 (= res!736114 (bvsge #b00000000000000000000000000000000 (size!34919 _keys!1070)))))

(assert (=> d!131215 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!630122)))

(declare-fun b!1103796 () Bool)

(declare-fun e!630123 () Bool)

(assert (=> b!1103796 (= e!630122 e!630123)))

(declare-fun c!109329 () Bool)

(assert (=> b!1103796 (= c!109329 (validKeyInArray!0 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1103797 () Bool)

(declare-fun call!46337 () Bool)

(assert (=> b!1103797 (= e!630123 call!46337)))

(declare-fun b!1103798 () Bool)

(declare-fun e!630124 () Bool)

(assert (=> b!1103798 (= e!630124 call!46337)))

(declare-fun bm!46334 () Bool)

(assert (=> bm!46334 (= call!46337 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1103799 () Bool)

(assert (=> b!1103799 (= e!630123 e!630124)))

(declare-fun lt!495157 () (_ BitVec 64))

(assert (=> b!1103799 (= lt!495157 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!495156 () Unit!36211)

(assert (=> b!1103799 (= lt!495156 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!495157 #b00000000000000000000000000000000))))

(assert (=> b!1103799 (arrayContainsKey!0 _keys!1070 lt!495157 #b00000000000000000000000000000000)))

(declare-fun lt!495158 () Unit!36211)

(assert (=> b!1103799 (= lt!495158 lt!495156)))

(declare-fun res!736113 () Bool)

(assert (=> b!1103799 (= res!736113 (= (seekEntryOrOpen!0 (select (arr!34382 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9872 #b00000000000000000000000000000000)))))

(assert (=> b!1103799 (=> (not res!736113) (not e!630124))))

(assert (= (and d!131215 (not res!736114)) b!1103796))

(assert (= (and b!1103796 c!109329) b!1103799))

(assert (= (and b!1103796 (not c!109329)) b!1103797))

(assert (= (and b!1103799 res!736113) b!1103798))

(assert (= (or b!1103798 b!1103797) bm!46334))

(assert (=> b!1103796 m!1024289))

(assert (=> b!1103796 m!1024289))

(assert (=> b!1103796 m!1024305))

(declare-fun m!1024467 () Bool)

(assert (=> bm!46334 m!1024467))

(assert (=> b!1103799 m!1024289))

(declare-fun m!1024469 () Bool)

(assert (=> b!1103799 m!1024469))

(declare-fun m!1024471 () Bool)

(assert (=> b!1103799 m!1024471))

(assert (=> b!1103799 m!1024289))

(declare-fun m!1024473 () Bool)

(assert (=> b!1103799 m!1024473))

(assert (=> b!1103531 d!131215))

(declare-fun d!131217 () Bool)

(assert (=> d!131217 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1103536 d!131217))

(declare-fun mapIsEmpty!42670 () Bool)

(declare-fun mapRes!42670 () Bool)

(assert (=> mapIsEmpty!42670 mapRes!42670))

(declare-fun b!1103807 () Bool)

(declare-fun e!630130 () Bool)

(assert (=> b!1103807 (= e!630130 tp_is_empty!27247)))

(declare-fun b!1103806 () Bool)

(declare-fun e!630129 () Bool)

(assert (=> b!1103806 (= e!630129 tp_is_empty!27247)))

(declare-fun mapNonEmpty!42670 () Bool)

(declare-fun tp!81563 () Bool)

(assert (=> mapNonEmpty!42670 (= mapRes!42670 (and tp!81563 e!630129))))

(declare-fun mapRest!42670 () (Array (_ BitVec 32) ValueCell!12914))

(declare-fun mapKey!42670 () (_ BitVec 32))

(declare-fun mapValue!42670 () ValueCell!12914)

(assert (=> mapNonEmpty!42670 (= mapRest!42661 (store mapRest!42670 mapKey!42670 mapValue!42670))))

(declare-fun condMapEmpty!42670 () Bool)

(declare-fun mapDefault!42670 () ValueCell!12914)

(assert (=> mapNonEmpty!42661 (= condMapEmpty!42670 (= mapRest!42661 ((as const (Array (_ BitVec 32) ValueCell!12914)) mapDefault!42670)))))

(assert (=> mapNonEmpty!42661 (= tp!81547 (and e!630130 mapRes!42670))))

(assert (= (and mapNonEmpty!42661 condMapEmpty!42670) mapIsEmpty!42670))

(assert (= (and mapNonEmpty!42661 (not condMapEmpty!42670)) mapNonEmpty!42670))

(assert (= (and mapNonEmpty!42670 ((_ is ValueCellFull!12914) mapValue!42670)) b!1103806))

(assert (= (and mapNonEmpty!42661 ((_ is ValueCellFull!12914) mapDefault!42670)) b!1103807))

(declare-fun m!1024475 () Bool)

(assert (=> mapNonEmpty!42670 m!1024475))

(declare-fun b_lambda!18187 () Bool)

(assert (= b_lambda!18179 (or (and start!97116 b_free!23197) b_lambda!18187)))

(declare-fun b_lambda!18189 () Bool)

(assert (= b_lambda!18177 (or (and start!97116 b_free!23197) b_lambda!18189)))

(declare-fun b_lambda!18191 () Bool)

(assert (= b_lambda!18175 (or (and start!97116 b_free!23197) b_lambda!18191)))

(declare-fun b_lambda!18193 () Bool)

(assert (= b_lambda!18185 (or (and start!97116 b_free!23197) b_lambda!18193)))

(declare-fun b_lambda!18195 () Bool)

(assert (= b_lambda!18181 (or (and start!97116 b_free!23197) b_lambda!18195)))

(declare-fun b_lambda!18197 () Bool)

(assert (= b_lambda!18173 (or (and start!97116 b_free!23197) b_lambda!18197)))

(declare-fun b_lambda!18199 () Bool)

(assert (= b_lambda!18183 (or (and start!97116 b_free!23197) b_lambda!18199)))

(check-sat (not b!1103789) (not b!1103772) (not b!1103687) (not bm!46308) (not b!1103761) (not b!1103742) (not bm!46305) (not b!1103749) (not b!1103702) (not b!1103666) (not b_lambda!18171) (not d!131197) (not b!1103705) (not d!131195) (not b!1103791) (not d!131201) (not b!1103787) (not b!1103755) (not b!1103668) (not mapNonEmpty!42670) (not d!131189) (not b!1103794) (not b!1103698) (not b!1103697) (not b!1103799) (not bm!46332) (not b!1103759) (not b_lambda!18189) (not bm!46334) (not b!1103762) (not b!1103741) (not bm!46326) (not d!131199) (not bm!46314) (not bm!46324) (not bm!46304) (not b!1103763) (not d!131191) (not b!1103735) (not b_lambda!18191) (not bm!46315) (not bm!46333) (not b!1103775) (not b!1103740) (not b!1103756) (not b!1103732) (not bm!46307) tp_is_empty!27247 (not b!1103704) (not d!131193) (not b_lambda!18187) (not b!1103681) (not bm!46319) (not b_lambda!18197) (not b!1103622) (not b!1103737) (not b!1103786) (not b_lambda!18199) (not b!1103685) (not b!1103706) (not b!1103792) (not bm!46329) (not b!1103683) (not b!1103753) (not b!1103738) (not bm!46325) (not b!1103758) (not b!1103676) (not bm!46311) (not b_lambda!18195) (not b!1103734) (not b!1103677) (not b!1103689) (not b_next!23197) (not bm!46312) b_and!37231 (not b!1103684) (not b_lambda!18193) (not b!1103796))
(check-sat b_and!37231 (not b_next!23197))
