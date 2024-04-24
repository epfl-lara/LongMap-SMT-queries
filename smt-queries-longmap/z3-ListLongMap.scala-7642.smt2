; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96408 () Bool)

(assert start!96408)

(declare-fun b_free!22825 () Bool)

(declare-fun b_next!22825 () Bool)

(assert (=> start!96408 (= b_free!22825 (not b_next!22825))))

(declare-fun tp!80323 () Bool)

(declare-fun b_and!36335 () Bool)

(assert (=> start!96408 (= tp!80323 b_and!36335)))

(declare-fun b!1093226 () Bool)

(declare-fun res!729076 () Bool)

(declare-fun e!624442 () Bool)

(assert (=> b!1093226 (=> (not res!729076) (not e!624442))))

(declare-datatypes ((array!70607 0))(
  ( (array!70608 (arr!33971 (Array (_ BitVec 32) (_ BitVec 64))) (size!34508 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70607)

(declare-datatypes ((List!23730 0))(
  ( (Nil!23727) (Cons!23726 (h!24944 (_ BitVec 64)) (t!33605 List!23730)) )
))
(declare-fun arrayNoDuplicates!0 (array!70607 (_ BitVec 32) List!23730) Bool)

(assert (=> b!1093226 (= res!729076 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23727))))

(declare-fun b!1093227 () Bool)

(declare-fun e!624448 () Bool)

(declare-fun tp_is_empty!26827 () Bool)

(assert (=> b!1093227 (= e!624448 tp_is_empty!26827)))

(declare-fun b!1093228 () Bool)

(declare-fun res!729071 () Bool)

(assert (=> b!1093228 (=> (not res!729071) (not e!624442))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093228 (= res!729071 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34508 _keys!1070))))))

(declare-fun b!1093229 () Bool)

(declare-fun e!624443 () Bool)

(assert (=> b!1093229 (= e!624442 e!624443)))

(declare-fun res!729073 () Bool)

(assert (=> b!1093229 (=> (not res!729073) (not e!624443))))

(declare-fun lt!488355 () array!70607)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70607 (_ BitVec 32)) Bool)

(assert (=> b!1093229 (= res!729073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488355 mask!1414))))

(assert (=> b!1093229 (= lt!488355 (array!70608 (store (arr!33971 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34508 _keys!1070)))))

(declare-fun mapNonEmpty!41995 () Bool)

(declare-fun mapRes!41995 () Bool)

(declare-fun tp!80324 () Bool)

(assert (=> mapNonEmpty!41995 (= mapRes!41995 (and tp!80324 e!624448))))

(declare-datatypes ((V!40897 0))(
  ( (V!40898 (val!13470 Int)) )
))
(declare-datatypes ((ValueCell!12704 0))(
  ( (ValueCellFull!12704 (v!16087 V!40897)) (EmptyCell!12704) )
))
(declare-datatypes ((array!70609 0))(
  ( (array!70610 (arr!33972 (Array (_ BitVec 32) ValueCell!12704)) (size!34509 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70609)

(declare-fun mapKey!41995 () (_ BitVec 32))

(declare-fun mapValue!41995 () ValueCell!12704)

(declare-fun mapRest!41995 () (Array (_ BitVec 32) ValueCell!12704))

(assert (=> mapNonEmpty!41995 (= (arr!33972 _values!874) (store mapRest!41995 mapKey!41995 mapValue!41995))))

(declare-fun b!1093230 () Bool)

(declare-fun res!729069 () Bool)

(assert (=> b!1093230 (=> (not res!729069) (not e!624442))))

(assert (=> b!1093230 (= res!729069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093231 () Bool)

(declare-fun res!729068 () Bool)

(assert (=> b!1093231 (=> (not res!729068) (not e!624442))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093231 (= res!729068 (and (= (size!34509 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34508 _keys!1070) (size!34509 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!729077 () Bool)

(assert (=> start!96408 (=> (not res!729077) (not e!624442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96408 (= res!729077 (validMask!0 mask!1414))))

(assert (=> start!96408 e!624442))

(assert (=> start!96408 tp!80323))

(assert (=> start!96408 true))

(assert (=> start!96408 tp_is_empty!26827))

(declare-fun array_inv!26230 (array!70607) Bool)

(assert (=> start!96408 (array_inv!26230 _keys!1070)))

(declare-fun e!624446 () Bool)

(declare-fun array_inv!26231 (array!70609) Bool)

(assert (=> start!96408 (and (array_inv!26231 _values!874) e!624446)))

(declare-fun b!1093232 () Bool)

(declare-fun e!624449 () Bool)

(assert (=> b!1093232 (= e!624449 tp_is_empty!26827)))

(declare-fun b!1093233 () Bool)

(declare-fun res!729072 () Bool)

(assert (=> b!1093233 (=> (not res!729072) (not e!624442))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093233 (= res!729072 (validKeyInArray!0 k0!904))))

(declare-fun b!1093234 () Bool)

(assert (=> b!1093234 (= e!624446 (and e!624449 mapRes!41995))))

(declare-fun condMapEmpty!41995 () Bool)

(declare-fun mapDefault!41995 () ValueCell!12704)

(assert (=> b!1093234 (= condMapEmpty!41995 (= (arr!33972 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12704)) mapDefault!41995)))))

(declare-fun mapIsEmpty!41995 () Bool)

(assert (=> mapIsEmpty!41995 mapRes!41995))

(declare-fun b!1093235 () Bool)

(declare-fun res!729070 () Bool)

(assert (=> b!1093235 (=> (not res!729070) (not e!624442))))

(assert (=> b!1093235 (= res!729070 (= (select (arr!33971 _keys!1070) i!650) k0!904))))

(declare-fun b!1093236 () Bool)

(declare-fun e!624445 () Bool)

(assert (=> b!1093236 (= e!624443 (not e!624445))))

(declare-fun res!729075 () Bool)

(assert (=> b!1093236 (=> res!729075 e!624445)))

(assert (=> b!1093236 (= res!729075 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40897)

(declare-datatypes ((tuple2!17138 0))(
  ( (tuple2!17139 (_1!8580 (_ BitVec 64)) (_2!8580 V!40897)) )
))
(declare-datatypes ((List!23731 0))(
  ( (Nil!23728) (Cons!23727 (h!24945 tuple2!17138) (t!33606 List!23731)) )
))
(declare-datatypes ((ListLongMap!15115 0))(
  ( (ListLongMap!15116 (toList!7573 List!23731)) )
))
(declare-fun lt!488353 () ListLongMap!15115)

(declare-fun zeroValue!831 () V!40897)

(declare-fun getCurrentListMap!4321 (array!70607 array!70609 (_ BitVec 32) (_ BitVec 32) V!40897 V!40897 (_ BitVec 32) Int) ListLongMap!15115)

(assert (=> b!1093236 (= lt!488353 (getCurrentListMap!4321 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488348 () array!70609)

(declare-fun lt!488351 () ListLongMap!15115)

(assert (=> b!1093236 (= lt!488351 (getCurrentListMap!4321 lt!488355 lt!488348 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488347 () ListLongMap!15115)

(declare-fun lt!488343 () ListLongMap!15115)

(assert (=> b!1093236 (and (= lt!488347 lt!488343) (= lt!488343 lt!488347))))

(declare-fun lt!488349 () ListLongMap!15115)

(declare-fun -!878 (ListLongMap!15115 (_ BitVec 64)) ListLongMap!15115)

(assert (=> b!1093236 (= lt!488343 (-!878 lt!488349 k0!904))))

(declare-datatypes ((Unit!35923 0))(
  ( (Unit!35924) )
))
(declare-fun lt!488345 () Unit!35923)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!150 (array!70607 array!70609 (_ BitVec 32) (_ BitVec 32) V!40897 V!40897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35923)

(assert (=> b!1093236 (= lt!488345 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!150 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4126 (array!70607 array!70609 (_ BitVec 32) (_ BitVec 32) V!40897 V!40897 (_ BitVec 32) Int) ListLongMap!15115)

(assert (=> b!1093236 (= lt!488347 (getCurrentListMapNoExtraKeys!4126 lt!488355 lt!488348 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2247 (Int (_ BitVec 64)) V!40897)

(assert (=> b!1093236 (= lt!488348 (array!70610 (store (arr!33972 _values!874) i!650 (ValueCellFull!12704 (dynLambda!2247 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34509 _values!874)))))

(assert (=> b!1093236 (= lt!488349 (getCurrentListMapNoExtraKeys!4126 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093236 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488344 () Unit!35923)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70607 (_ BitVec 64) (_ BitVec 32)) Unit!35923)

(assert (=> b!1093236 (= lt!488344 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093237 () Bool)

(declare-fun e!624444 () Bool)

(assert (=> b!1093237 (= e!624444 true)))

(declare-fun lt!488352 () ListLongMap!15115)

(declare-fun lt!488346 () ListLongMap!15115)

(assert (=> b!1093237 (= (-!878 lt!488352 k0!904) lt!488346)))

(declare-fun lt!488354 () Unit!35923)

(declare-fun addRemoveCommutativeForDiffKeys!111 (ListLongMap!15115 (_ BitVec 64) V!40897 (_ BitVec 64)) Unit!35923)

(assert (=> b!1093237 (= lt!488354 (addRemoveCommutativeForDiffKeys!111 lt!488349 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1093238 () Bool)

(declare-fun res!729074 () Bool)

(assert (=> b!1093238 (=> (not res!729074) (not e!624443))))

(assert (=> b!1093238 (= res!729074 (arrayNoDuplicates!0 lt!488355 #b00000000000000000000000000000000 Nil!23727))))

(declare-fun b!1093239 () Bool)

(assert (=> b!1093239 (= e!624445 e!624444)))

(declare-fun res!729078 () Bool)

(assert (=> b!1093239 (=> res!729078 e!624444)))

(assert (=> b!1093239 (= res!729078 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1093239 (= lt!488353 lt!488352)))

(declare-fun lt!488350 () tuple2!17138)

(declare-fun +!3385 (ListLongMap!15115 tuple2!17138) ListLongMap!15115)

(assert (=> b!1093239 (= lt!488352 (+!3385 lt!488349 lt!488350))))

(assert (=> b!1093239 (= lt!488351 lt!488346)))

(assert (=> b!1093239 (= lt!488346 (+!3385 lt!488343 lt!488350))))

(assert (=> b!1093239 (= lt!488351 (+!3385 lt!488347 lt!488350))))

(assert (=> b!1093239 (= lt!488350 (tuple2!17139 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (= (and start!96408 res!729077) b!1093231))

(assert (= (and b!1093231 res!729068) b!1093230))

(assert (= (and b!1093230 res!729069) b!1093226))

(assert (= (and b!1093226 res!729076) b!1093228))

(assert (= (and b!1093228 res!729071) b!1093233))

(assert (= (and b!1093233 res!729072) b!1093235))

(assert (= (and b!1093235 res!729070) b!1093229))

(assert (= (and b!1093229 res!729073) b!1093238))

(assert (= (and b!1093238 res!729074) b!1093236))

(assert (= (and b!1093236 (not res!729075)) b!1093239))

(assert (= (and b!1093239 (not res!729078)) b!1093237))

(assert (= (and b!1093234 condMapEmpty!41995) mapIsEmpty!41995))

(assert (= (and b!1093234 (not condMapEmpty!41995)) mapNonEmpty!41995))

(get-info :version)

(assert (= (and mapNonEmpty!41995 ((_ is ValueCellFull!12704) mapValue!41995)) b!1093227))

(assert (= (and b!1093234 ((_ is ValueCellFull!12704) mapDefault!41995)) b!1093232))

(assert (= start!96408 b!1093234))

(declare-fun b_lambda!17505 () Bool)

(assert (=> (not b_lambda!17505) (not b!1093236)))

(declare-fun t!33604 () Bool)

(declare-fun tb!7695 () Bool)

(assert (=> (and start!96408 (= defaultEntry!882 defaultEntry!882) t!33604) tb!7695))

(declare-fun result!15917 () Bool)

(assert (=> tb!7695 (= result!15917 tp_is_empty!26827)))

(assert (=> b!1093236 t!33604))

(declare-fun b_and!36337 () Bool)

(assert (= b_and!36335 (and (=> t!33604 result!15917) b_and!36337)))

(declare-fun m!1013243 () Bool)

(assert (=> b!1093229 m!1013243))

(declare-fun m!1013245 () Bool)

(assert (=> b!1093229 m!1013245))

(declare-fun m!1013247 () Bool)

(assert (=> b!1093226 m!1013247))

(declare-fun m!1013249 () Bool)

(assert (=> b!1093233 m!1013249))

(declare-fun m!1013251 () Bool)

(assert (=> b!1093235 m!1013251))

(declare-fun m!1013253 () Bool)

(assert (=> mapNonEmpty!41995 m!1013253))

(declare-fun m!1013255 () Bool)

(assert (=> b!1093236 m!1013255))

(declare-fun m!1013257 () Bool)

(assert (=> b!1093236 m!1013257))

(declare-fun m!1013259 () Bool)

(assert (=> b!1093236 m!1013259))

(declare-fun m!1013261 () Bool)

(assert (=> b!1093236 m!1013261))

(declare-fun m!1013263 () Bool)

(assert (=> b!1093236 m!1013263))

(declare-fun m!1013265 () Bool)

(assert (=> b!1093236 m!1013265))

(declare-fun m!1013267 () Bool)

(assert (=> b!1093236 m!1013267))

(declare-fun m!1013269 () Bool)

(assert (=> b!1093236 m!1013269))

(declare-fun m!1013271 () Bool)

(assert (=> b!1093236 m!1013271))

(declare-fun m!1013273 () Bool)

(assert (=> b!1093236 m!1013273))

(declare-fun m!1013275 () Bool)

(assert (=> b!1093230 m!1013275))

(declare-fun m!1013277 () Bool)

(assert (=> start!96408 m!1013277))

(declare-fun m!1013279 () Bool)

(assert (=> start!96408 m!1013279))

(declare-fun m!1013281 () Bool)

(assert (=> start!96408 m!1013281))

(declare-fun m!1013283 () Bool)

(assert (=> b!1093238 m!1013283))

(declare-fun m!1013285 () Bool)

(assert (=> b!1093237 m!1013285))

(declare-fun m!1013287 () Bool)

(assert (=> b!1093237 m!1013287))

(declare-fun m!1013289 () Bool)

(assert (=> b!1093239 m!1013289))

(declare-fun m!1013291 () Bool)

(assert (=> b!1093239 m!1013291))

(declare-fun m!1013293 () Bool)

(assert (=> b!1093239 m!1013293))

(check-sat b_and!36337 (not b!1093238) (not mapNonEmpty!41995) tp_is_empty!26827 (not b!1093226) (not b!1093230) (not b!1093229) (not b!1093236) (not b_lambda!17505) (not b!1093239) (not b!1093233) (not b_next!22825) (not start!96408) (not b!1093237))
(check-sat b_and!36337 (not b_next!22825))
