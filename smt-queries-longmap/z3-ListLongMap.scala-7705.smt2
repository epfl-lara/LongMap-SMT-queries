; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96996 () Bool)

(assert start!96996)

(declare-fun b_free!23155 () Bool)

(declare-fun b_next!23155 () Bool)

(assert (=> start!96996 (= b_free!23155 (not b_next!23155))))

(declare-fun tp!81412 () Bool)

(declare-fun b_and!37081 () Bool)

(assert (=> start!96996 (= tp!81412 b_and!37081)))

(declare-fun b!1102015 () Bool)

(declare-fun e!629093 () Bool)

(declare-fun tp_is_empty!27205 () Bool)

(assert (=> b!1102015 (= e!629093 tp_is_empty!27205)))

(declare-fun b!1102017 () Bool)

(declare-fun res!735026 () Bool)

(declare-fun e!629088 () Bool)

(assert (=> b!1102017 (=> (not res!735026) (not e!629088))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71363 0))(
  ( (array!71364 (arr!34340 (Array (_ BitVec 32) (_ BitVec 64))) (size!34877 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71363)

(assert (=> b!1102017 (= res!735026 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34877 _keys!1070))))))

(declare-fun b!1102018 () Bool)

(declare-fun res!735024 () Bool)

(assert (=> b!1102018 (=> (not res!735024) (not e!629088))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102018 (= res!735024 (validKeyInArray!0 k0!904))))

(declare-fun b!1102019 () Bool)

(declare-fun res!735022 () Bool)

(assert (=> b!1102019 (=> (not res!735022) (not e!629088))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71363 (_ BitVec 32)) Bool)

(assert (=> b!1102019 (= res!735022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102020 () Bool)

(declare-fun e!629090 () Bool)

(declare-fun e!629092 () Bool)

(assert (=> b!1102020 (= e!629090 (not e!629092))))

(declare-fun res!735023 () Bool)

(assert (=> b!1102020 (=> res!735023 e!629092)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102020 (= res!735023 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41401 0))(
  ( (V!41402 (val!13659 Int)) )
))
(declare-fun minValue!831 () V!41401)

(declare-fun zeroValue!831 () V!41401)

(declare-datatypes ((tuple2!17380 0))(
  ( (tuple2!17381 (_1!8701 (_ BitVec 64)) (_2!8701 V!41401)) )
))
(declare-datatypes ((List!23999 0))(
  ( (Nil!23996) (Cons!23995 (h!25213 tuple2!17380) (t!34192 List!23999)) )
))
(declare-datatypes ((ListLongMap!15357 0))(
  ( (ListLongMap!15358 (toList!7694 List!23999)) )
))
(declare-fun lt!493785 () ListLongMap!15357)

(declare-datatypes ((ValueCell!12893 0))(
  ( (ValueCellFull!12893 (v!16283 V!41401)) (EmptyCell!12893) )
))
(declare-datatypes ((array!71365 0))(
  ( (array!71366 (arr!34341 (Array (_ BitVec 32) ValueCell!12893)) (size!34878 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71365)

(declare-fun getCurrentListMap!4398 (array!71363 array!71365 (_ BitVec 32) (_ BitVec 32) V!41401 V!41401 (_ BitVec 32) Int) ListLongMap!15357)

(assert (=> b!1102020 (= lt!493785 (getCurrentListMap!4398 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493787 () array!71363)

(declare-fun lt!493792 () array!71365)

(declare-fun lt!493791 () ListLongMap!15357)

(assert (=> b!1102020 (= lt!493791 (getCurrentListMap!4398 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493790 () ListLongMap!15357)

(declare-fun lt!493788 () ListLongMap!15357)

(assert (=> b!1102020 (and (= lt!493790 lt!493788) (= lt!493788 lt!493790))))

(declare-fun lt!493786 () ListLongMap!15357)

(declare-fun -!962 (ListLongMap!15357 (_ BitVec 64)) ListLongMap!15357)

(assert (=> b!1102020 (= lt!493788 (-!962 lt!493786 k0!904))))

(declare-datatypes ((Unit!36177 0))(
  ( (Unit!36178) )
))
(declare-fun lt!493789 () Unit!36177)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!232 (array!71363 array!71365 (_ BitVec 32) (_ BitVec 32) V!41401 V!41401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36177)

(assert (=> b!1102020 (= lt!493789 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!232 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4239 (array!71363 array!71365 (_ BitVec 32) (_ BitVec 32) V!41401 V!41401 (_ BitVec 32) Int) ListLongMap!15357)

(assert (=> b!1102020 (= lt!493790 (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2357 (Int (_ BitVec 64)) V!41401)

(assert (=> b!1102020 (= lt!493792 (array!71366 (store (arr!34341 _values!874) i!650 (ValueCellFull!12893 (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34878 _values!874)))))

(assert (=> b!1102020 (= lt!493786 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102020 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493793 () Unit!36177)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71363 (_ BitVec 64) (_ BitVec 32)) Unit!36177)

(assert (=> b!1102020 (= lt!493793 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102021 () Bool)

(declare-fun e!629089 () Bool)

(declare-fun e!629091 () Bool)

(declare-fun mapRes!42589 () Bool)

(assert (=> b!1102021 (= e!629089 (and e!629091 mapRes!42589))))

(declare-fun condMapEmpty!42589 () Bool)

(declare-fun mapDefault!42589 () ValueCell!12893)

(assert (=> b!1102021 (= condMapEmpty!42589 (= (arr!34341 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12893)) mapDefault!42589)))))

(declare-fun b!1102022 () Bool)

(declare-fun res!735029 () Bool)

(assert (=> b!1102022 (=> (not res!735029) (not e!629088))))

(assert (=> b!1102022 (= res!735029 (= (select (arr!34340 _keys!1070) i!650) k0!904))))

(declare-fun b!1102023 () Bool)

(assert (=> b!1102023 (= e!629088 e!629090)))

(declare-fun res!735020 () Bool)

(assert (=> b!1102023 (=> (not res!735020) (not e!629090))))

(assert (=> b!1102023 (= res!735020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493787 mask!1414))))

(assert (=> b!1102023 (= lt!493787 (array!71364 (store (arr!34340 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34877 _keys!1070)))))

(declare-fun mapIsEmpty!42589 () Bool)

(assert (=> mapIsEmpty!42589 mapRes!42589))

(declare-fun b!1102024 () Bool)

(declare-fun res!735021 () Bool)

(assert (=> b!1102024 (=> (not res!735021) (not e!629088))))

(assert (=> b!1102024 (= res!735021 (and (= (size!34878 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34877 _keys!1070) (size!34878 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!735027 () Bool)

(assert (=> start!96996 (=> (not res!735027) (not e!629088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96996 (= res!735027 (validMask!0 mask!1414))))

(assert (=> start!96996 e!629088))

(assert (=> start!96996 tp!81412))

(assert (=> start!96996 true))

(assert (=> start!96996 tp_is_empty!27205))

(declare-fun array_inv!26476 (array!71363) Bool)

(assert (=> start!96996 (array_inv!26476 _keys!1070)))

(declare-fun array_inv!26477 (array!71365) Bool)

(assert (=> start!96996 (and (array_inv!26477 _values!874) e!629089)))

(declare-fun b!1102016 () Bool)

(declare-fun +!3424 (ListLongMap!15357 tuple2!17380) ListLongMap!15357)

(assert (=> b!1102016 (= e!629092 (= lt!493791 (+!3424 lt!493790 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102025 () Bool)

(declare-fun res!735028 () Bool)

(assert (=> b!1102025 (=> (not res!735028) (not e!629088))))

(declare-datatypes ((List!24000 0))(
  ( (Nil!23997) (Cons!23996 (h!25214 (_ BitVec 64)) (t!34193 List!24000)) )
))
(declare-fun arrayNoDuplicates!0 (array!71363 (_ BitVec 32) List!24000) Bool)

(assert (=> b!1102025 (= res!735028 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23997))))

(declare-fun b!1102026 () Bool)

(assert (=> b!1102026 (= e!629091 tp_is_empty!27205)))

(declare-fun b!1102027 () Bool)

(declare-fun res!735025 () Bool)

(assert (=> b!1102027 (=> (not res!735025) (not e!629090))))

(assert (=> b!1102027 (= res!735025 (arrayNoDuplicates!0 lt!493787 #b00000000000000000000000000000000 Nil!23997))))

(declare-fun mapNonEmpty!42589 () Bool)

(declare-fun tp!81413 () Bool)

(assert (=> mapNonEmpty!42589 (= mapRes!42589 (and tp!81413 e!629093))))

(declare-fun mapRest!42589 () (Array (_ BitVec 32) ValueCell!12893))

(declare-fun mapKey!42589 () (_ BitVec 32))

(declare-fun mapValue!42589 () ValueCell!12893)

(assert (=> mapNonEmpty!42589 (= (arr!34341 _values!874) (store mapRest!42589 mapKey!42589 mapValue!42589))))

(assert (= (and start!96996 res!735027) b!1102024))

(assert (= (and b!1102024 res!735021) b!1102019))

(assert (= (and b!1102019 res!735022) b!1102025))

(assert (= (and b!1102025 res!735028) b!1102017))

(assert (= (and b!1102017 res!735026) b!1102018))

(assert (= (and b!1102018 res!735024) b!1102022))

(assert (= (and b!1102022 res!735029) b!1102023))

(assert (= (and b!1102023 res!735020) b!1102027))

(assert (= (and b!1102027 res!735025) b!1102020))

(assert (= (and b!1102020 (not res!735023)) b!1102016))

(assert (= (and b!1102021 condMapEmpty!42589) mapIsEmpty!42589))

(assert (= (and b!1102021 (not condMapEmpty!42589)) mapNonEmpty!42589))

(get-info :version)

(assert (= (and mapNonEmpty!42589 ((_ is ValueCellFull!12893) mapValue!42589)) b!1102015))

(assert (= (and b!1102021 ((_ is ValueCellFull!12893) mapDefault!42589)) b!1102026))

(assert (= start!96996 b!1102021))

(declare-fun b_lambda!18033 () Bool)

(assert (=> (not b_lambda!18033) (not b!1102020)))

(declare-fun t!34191 () Bool)

(declare-fun tb!8013 () Bool)

(assert (=> (and start!96996 (= defaultEntry!882 defaultEntry!882) t!34191) tb!8013))

(declare-fun result!16571 () Bool)

(assert (=> tb!8013 (= result!16571 tp_is_empty!27205)))

(assert (=> b!1102020 t!34191))

(declare-fun b_and!37083 () Bool)

(assert (= b_and!37081 (and (=> t!34191 result!16571) b_and!37083)))

(declare-fun m!1022483 () Bool)

(assert (=> b!1102020 m!1022483))

(declare-fun m!1022485 () Bool)

(assert (=> b!1102020 m!1022485))

(declare-fun m!1022487 () Bool)

(assert (=> b!1102020 m!1022487))

(declare-fun m!1022489 () Bool)

(assert (=> b!1102020 m!1022489))

(declare-fun m!1022491 () Bool)

(assert (=> b!1102020 m!1022491))

(declare-fun m!1022493 () Bool)

(assert (=> b!1102020 m!1022493))

(declare-fun m!1022495 () Bool)

(assert (=> b!1102020 m!1022495))

(declare-fun m!1022497 () Bool)

(assert (=> b!1102020 m!1022497))

(declare-fun m!1022499 () Bool)

(assert (=> b!1102020 m!1022499))

(declare-fun m!1022501 () Bool)

(assert (=> b!1102020 m!1022501))

(declare-fun m!1022503 () Bool)

(assert (=> b!1102018 m!1022503))

(declare-fun m!1022505 () Bool)

(assert (=> b!1102016 m!1022505))

(declare-fun m!1022507 () Bool)

(assert (=> start!96996 m!1022507))

(declare-fun m!1022509 () Bool)

(assert (=> start!96996 m!1022509))

(declare-fun m!1022511 () Bool)

(assert (=> start!96996 m!1022511))

(declare-fun m!1022513 () Bool)

(assert (=> b!1102025 m!1022513))

(declare-fun m!1022515 () Bool)

(assert (=> b!1102023 m!1022515))

(declare-fun m!1022517 () Bool)

(assert (=> b!1102023 m!1022517))

(declare-fun m!1022519 () Bool)

(assert (=> mapNonEmpty!42589 m!1022519))

(declare-fun m!1022521 () Bool)

(assert (=> b!1102022 m!1022521))

(declare-fun m!1022523 () Bool)

(assert (=> b!1102019 m!1022523))

(declare-fun m!1022525 () Bool)

(assert (=> b!1102027 m!1022525))

(check-sat tp_is_empty!27205 (not b!1102025) (not start!96996) (not mapNonEmpty!42589) (not b_next!23155) (not b_lambda!18033) (not b!1102016) (not b!1102020) b_and!37083 (not b!1102023) (not b!1102027) (not b!1102019) (not b!1102018))
(check-sat b_and!37083 (not b_next!23155))
(get-model)

(declare-fun b_lambda!18039 () Bool)

(assert (= b_lambda!18033 (or (and start!96996 b_free!23155) b_lambda!18039)))

(check-sat tp_is_empty!27205 (not b!1102025) (not start!96996) (not mapNonEmpty!42589) (not b_next!23155) (not b_lambda!18039) (not b!1102016) (not b!1102020) b_and!37083 (not b!1102023) (not b!1102027) (not b!1102019) (not b!1102018))
(check-sat b_and!37083 (not b_next!23155))
(get-model)

(declare-fun d!131063 () Bool)

(declare-fun e!629139 () Bool)

(assert (=> d!131063 e!629139))

(declare-fun res!735095 () Bool)

(assert (=> d!131063 (=> (not res!735095) (not e!629139))))

(declare-fun lt!493858 () ListLongMap!15357)

(declare-fun contains!6422 (ListLongMap!15357 (_ BitVec 64)) Bool)

(assert (=> d!131063 (= res!735095 (contains!6422 lt!493858 (_1!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lt!493859 () List!23999)

(assert (=> d!131063 (= lt!493858 (ListLongMap!15358 lt!493859))))

(declare-fun lt!493856 () Unit!36177)

(declare-fun lt!493857 () Unit!36177)

(assert (=> d!131063 (= lt!493856 lt!493857)))

(declare-datatypes ((Option!672 0))(
  ( (Some!671 (v!16286 V!41401)) (None!670) )
))
(declare-fun getValueByKey!621 (List!23999 (_ BitVec 64)) Option!672)

(assert (=> d!131063 (= (getValueByKey!621 lt!493859 (_1!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!671 (_2!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!303 (List!23999 (_ BitVec 64) V!41401) Unit!36177)

(assert (=> d!131063 (= lt!493857 (lemmaContainsTupThenGetReturnValue!303 lt!493859 (_1!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun insertStrictlySorted!396 (List!23999 (_ BitVec 64) V!41401) List!23999)

(assert (=> d!131063 (= lt!493859 (insertStrictlySorted!396 (toList!7694 lt!493790) (_1!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(assert (=> d!131063 (= (+!3424 lt!493790 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) lt!493858)))

(declare-fun b!1102116 () Bool)

(declare-fun res!735094 () Bool)

(assert (=> b!1102116 (=> (not res!735094) (not e!629139))))

(assert (=> b!1102116 (= res!735094 (= (getValueByKey!621 (toList!7694 lt!493858) (_1!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!671 (_2!8701 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))))

(declare-fun b!1102117 () Bool)

(declare-fun contains!6423 (List!23999 tuple2!17380) Bool)

(assert (=> b!1102117 (= e!629139 (contains!6423 (toList!7694 lt!493858) (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(assert (= (and d!131063 res!735095) b!1102116))

(assert (= (and b!1102116 res!735094) b!1102117))

(declare-fun m!1022615 () Bool)

(assert (=> d!131063 m!1022615))

(declare-fun m!1022617 () Bool)

(assert (=> d!131063 m!1022617))

(declare-fun m!1022619 () Bool)

(assert (=> d!131063 m!1022619))

(declare-fun m!1022621 () Bool)

(assert (=> d!131063 m!1022621))

(declare-fun m!1022623 () Bool)

(assert (=> b!1102116 m!1022623))

(declare-fun m!1022625 () Bool)

(assert (=> b!1102117 m!1022625))

(assert (=> b!1102016 d!131063))

(declare-fun b!1102128 () Bool)

(declare-fun e!629150 () Bool)

(declare-fun e!629149 () Bool)

(assert (=> b!1102128 (= e!629150 e!629149)))

(declare-fun res!735104 () Bool)

(assert (=> b!1102128 (=> (not res!735104) (not e!629149))))

(declare-fun e!629151 () Bool)

(assert (=> b!1102128 (= res!735104 (not e!629151))))

(declare-fun res!735103 () Bool)

(assert (=> b!1102128 (=> (not res!735103) (not e!629151))))

(assert (=> b!1102128 (= res!735103 (validKeyInArray!0 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102129 () Bool)

(declare-fun contains!6424 (List!24000 (_ BitVec 64)) Bool)

(assert (=> b!1102129 (= e!629151 (contains!6424 Nil!23997 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102130 () Bool)

(declare-fun e!629148 () Bool)

(declare-fun call!46156 () Bool)

(assert (=> b!1102130 (= e!629148 call!46156)))

(declare-fun b!1102131 () Bool)

(assert (=> b!1102131 (= e!629149 e!629148)))

(declare-fun c!109128 () Bool)

(assert (=> b!1102131 (= c!109128 (validKeyInArray!0 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!131065 () Bool)

(declare-fun res!735102 () Bool)

(assert (=> d!131065 (=> res!735102 e!629150)))

(assert (=> d!131065 (= res!735102 (bvsge #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(assert (=> d!131065 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23997) e!629150)))

(declare-fun b!1102132 () Bool)

(assert (=> b!1102132 (= e!629148 call!46156)))

(declare-fun bm!46153 () Bool)

(assert (=> bm!46153 (= call!46156 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109128 (Cons!23996 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000) Nil!23997) Nil!23997)))))

(assert (= (and d!131065 (not res!735102)) b!1102128))

(assert (= (and b!1102128 res!735103) b!1102129))

(assert (= (and b!1102128 res!735104) b!1102131))

(assert (= (and b!1102131 c!109128) b!1102130))

(assert (= (and b!1102131 (not c!109128)) b!1102132))

(assert (= (or b!1102130 b!1102132) bm!46153))

(declare-fun m!1022627 () Bool)

(assert (=> b!1102128 m!1022627))

(assert (=> b!1102128 m!1022627))

(declare-fun m!1022629 () Bool)

(assert (=> b!1102128 m!1022629))

(assert (=> b!1102129 m!1022627))

(assert (=> b!1102129 m!1022627))

(declare-fun m!1022631 () Bool)

(assert (=> b!1102129 m!1022631))

(assert (=> b!1102131 m!1022627))

(assert (=> b!1102131 m!1022627))

(assert (=> b!1102131 m!1022629))

(assert (=> bm!46153 m!1022627))

(declare-fun m!1022633 () Bool)

(assert (=> bm!46153 m!1022633))

(assert (=> b!1102025 d!131065))

(declare-fun d!131067 () Bool)

(declare-fun res!735109 () Bool)

(declare-fun e!629156 () Bool)

(assert (=> d!131067 (=> res!735109 e!629156)))

(assert (=> d!131067 (= res!735109 (= (select (arr!34340 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!131067 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!629156)))

(declare-fun b!1102137 () Bool)

(declare-fun e!629157 () Bool)

(assert (=> b!1102137 (= e!629156 e!629157)))

(declare-fun res!735110 () Bool)

(assert (=> b!1102137 (=> (not res!735110) (not e!629157))))

(assert (=> b!1102137 (= res!735110 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34877 _keys!1070)))))

(declare-fun b!1102138 () Bool)

(assert (=> b!1102138 (= e!629157 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131067 (not res!735109)) b!1102137))

(assert (= (and b!1102137 res!735110) b!1102138))

(assert (=> d!131067 m!1022627))

(declare-fun m!1022635 () Bool)

(assert (=> b!1102138 m!1022635))

(assert (=> b!1102020 d!131067))

(declare-fun bm!46168 () Bool)

(declare-fun call!46177 () Bool)

(declare-fun lt!493915 () ListLongMap!15357)

(assert (=> bm!46168 (= call!46177 (contains!6422 lt!493915 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46169 () Bool)

(declare-fun call!46176 () ListLongMap!15357)

(declare-fun call!46171 () ListLongMap!15357)

(declare-fun c!109144 () Bool)

(declare-fun call!46175 () ListLongMap!15357)

(declare-fun call!46174 () ListLongMap!15357)

(declare-fun c!109142 () Bool)

(assert (=> bm!46169 (= call!46174 (+!3424 (ite c!109144 call!46176 (ite c!109142 call!46171 call!46175)) (ite (or c!109144 c!109142) (tuple2!17381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102181 () Bool)

(declare-fun e!629193 () Bool)

(assert (=> b!1102181 (= e!629193 (validKeyInArray!0 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46170 () Bool)

(assert (=> bm!46170 (= call!46171 call!46176)))

(declare-fun b!1102182 () Bool)

(declare-fun res!735134 () Bool)

(declare-fun e!629192 () Bool)

(assert (=> b!1102182 (=> (not res!735134) (not e!629192))))

(declare-fun e!629185 () Bool)

(assert (=> b!1102182 (= res!735134 e!629185)))

(declare-fun res!735130 () Bool)

(assert (=> b!1102182 (=> res!735130 e!629185)))

(assert (=> b!1102182 (= res!735130 (not e!629193))))

(declare-fun res!735131 () Bool)

(assert (=> b!1102182 (=> (not res!735131) (not e!629193))))

(assert (=> b!1102182 (= res!735131 (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(declare-fun d!131069 () Bool)

(assert (=> d!131069 e!629192))

(declare-fun res!735133 () Bool)

(assert (=> d!131069 (=> (not res!735133) (not e!629192))))

(assert (=> d!131069 (= res!735133 (or (bvsge #b00000000000000000000000000000000 (size!34877 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))))

(declare-fun lt!493919 () ListLongMap!15357)

(assert (=> d!131069 (= lt!493915 lt!493919)))

(declare-fun lt!493904 () Unit!36177)

(declare-fun e!629194 () Unit!36177)

(assert (=> d!131069 (= lt!493904 e!629194)))

(declare-fun c!109145 () Bool)

(declare-fun e!629187 () Bool)

(assert (=> d!131069 (= c!109145 e!629187)))

(declare-fun res!735137 () Bool)

(assert (=> d!131069 (=> (not res!735137) (not e!629187))))

(assert (=> d!131069 (= res!735137 (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(declare-fun e!629189 () ListLongMap!15357)

(assert (=> d!131069 (= lt!493919 e!629189)))

(assert (=> d!131069 (= c!109144 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131069 (validMask!0 mask!1414)))

(assert (=> d!131069 (= (getCurrentListMap!4398 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493915)))

(declare-fun bm!46171 () Bool)

(declare-fun call!46172 () ListLongMap!15357)

(assert (=> bm!46171 (= call!46172 call!46174)))

(declare-fun b!1102183 () Bool)

(declare-fun e!629188 () ListLongMap!15357)

(assert (=> b!1102183 (= e!629189 e!629188)))

(assert (=> b!1102183 (= c!109142 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102184 () Bool)

(declare-fun e!629184 () Bool)

(declare-fun apply!959 (ListLongMap!15357 (_ BitVec 64)) V!41401)

(assert (=> b!1102184 (= e!629184 (= (apply!959 lt!493915 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102185 () Bool)

(declare-fun e!629196 () ListLongMap!15357)

(assert (=> b!1102185 (= e!629196 call!46175)))

(declare-fun b!1102186 () Bool)

(declare-fun e!629190 () Bool)

(declare-fun e!629191 () Bool)

(assert (=> b!1102186 (= e!629190 e!629191)))

(declare-fun res!735129 () Bool)

(assert (=> b!1102186 (= res!735129 call!46177)))

(assert (=> b!1102186 (=> (not res!735129) (not e!629191))))

(declare-fun b!1102187 () Bool)

(assert (=> b!1102187 (= e!629189 (+!3424 call!46174 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102188 () Bool)

(declare-fun c!109143 () Bool)

(assert (=> b!1102188 (= c!109143 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1102188 (= e!629188 e!629196)))

(declare-fun b!1102189 () Bool)

(assert (=> b!1102189 (= e!629196 call!46172)))

(declare-fun bm!46172 () Bool)

(declare-fun call!46173 () Bool)

(assert (=> bm!46172 (= call!46173 (contains!6422 lt!493915 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102190 () Bool)

(assert (=> b!1102190 (= e!629187 (validKeyInArray!0 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102191 () Bool)

(assert (=> b!1102191 (= e!629191 (= (apply!959 lt!493915 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1102192 () Bool)

(assert (=> b!1102192 (= e!629190 (not call!46177))))

(declare-fun b!1102193 () Bool)

(declare-fun e!629195 () Bool)

(assert (=> b!1102193 (= e!629195 e!629184)))

(declare-fun res!735136 () Bool)

(assert (=> b!1102193 (= res!735136 call!46173)))

(assert (=> b!1102193 (=> (not res!735136) (not e!629184))))

(declare-fun b!1102194 () Bool)

(declare-fun res!735135 () Bool)

(assert (=> b!1102194 (=> (not res!735135) (not e!629192))))

(assert (=> b!1102194 (= res!735135 e!629190)))

(declare-fun c!109141 () Bool)

(assert (=> b!1102194 (= c!109141 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102195 () Bool)

(declare-fun e!629186 () Bool)

(assert (=> b!1102195 (= e!629185 e!629186)))

(declare-fun res!735132 () Bool)

(assert (=> b!1102195 (=> (not res!735132) (not e!629186))))

(assert (=> b!1102195 (= res!735132 (contains!6422 lt!493915 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102195 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(declare-fun bm!46173 () Bool)

(assert (=> bm!46173 (= call!46176 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102196 () Bool)

(assert (=> b!1102196 (= e!629192 e!629195)))

(declare-fun c!109146 () Bool)

(assert (=> b!1102196 (= c!109146 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102197 () Bool)

(declare-fun Unit!36183 () Unit!36177)

(assert (=> b!1102197 (= e!629194 Unit!36183)))

(declare-fun b!1102198 () Bool)

(assert (=> b!1102198 (= e!629195 (not call!46173))))

(declare-fun b!1102199 () Bool)

(declare-fun lt!493917 () Unit!36177)

(assert (=> b!1102199 (= e!629194 lt!493917)))

(declare-fun lt!493922 () ListLongMap!15357)

(assert (=> b!1102199 (= lt!493922 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493909 () (_ BitVec 64))

(assert (=> b!1102199 (= lt!493909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493921 () (_ BitVec 64))

(assert (=> b!1102199 (= lt!493921 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493916 () Unit!36177)

(declare-fun addStillContains!663 (ListLongMap!15357 (_ BitVec 64) V!41401 (_ BitVec 64)) Unit!36177)

(assert (=> b!1102199 (= lt!493916 (addStillContains!663 lt!493922 lt!493909 zeroValue!831 lt!493921))))

(assert (=> b!1102199 (contains!6422 (+!3424 lt!493922 (tuple2!17381 lt!493909 zeroValue!831)) lt!493921)))

(declare-fun lt!493907 () Unit!36177)

(assert (=> b!1102199 (= lt!493907 lt!493916)))

(declare-fun lt!493913 () ListLongMap!15357)

(assert (=> b!1102199 (= lt!493913 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493925 () (_ BitVec 64))

(assert (=> b!1102199 (= lt!493925 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493905 () (_ BitVec 64))

(assert (=> b!1102199 (= lt!493905 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493911 () Unit!36177)

(declare-fun addApplyDifferent!519 (ListLongMap!15357 (_ BitVec 64) V!41401 (_ BitVec 64)) Unit!36177)

(assert (=> b!1102199 (= lt!493911 (addApplyDifferent!519 lt!493913 lt!493925 minValue!831 lt!493905))))

(assert (=> b!1102199 (= (apply!959 (+!3424 lt!493913 (tuple2!17381 lt!493925 minValue!831)) lt!493905) (apply!959 lt!493913 lt!493905))))

(declare-fun lt!493918 () Unit!36177)

(assert (=> b!1102199 (= lt!493918 lt!493911)))

(declare-fun lt!493908 () ListLongMap!15357)

(assert (=> b!1102199 (= lt!493908 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493914 () (_ BitVec 64))

(assert (=> b!1102199 (= lt!493914 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493920 () (_ BitVec 64))

(assert (=> b!1102199 (= lt!493920 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493910 () Unit!36177)

(assert (=> b!1102199 (= lt!493910 (addApplyDifferent!519 lt!493908 lt!493914 zeroValue!831 lt!493920))))

(assert (=> b!1102199 (= (apply!959 (+!3424 lt!493908 (tuple2!17381 lt!493914 zeroValue!831)) lt!493920) (apply!959 lt!493908 lt!493920))))

(declare-fun lt!493906 () Unit!36177)

(assert (=> b!1102199 (= lt!493906 lt!493910)))

(declare-fun lt!493924 () ListLongMap!15357)

(assert (=> b!1102199 (= lt!493924 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493923 () (_ BitVec 64))

(assert (=> b!1102199 (= lt!493923 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493912 () (_ BitVec 64))

(assert (=> b!1102199 (= lt!493912 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102199 (= lt!493917 (addApplyDifferent!519 lt!493924 lt!493923 minValue!831 lt!493912))))

(assert (=> b!1102199 (= (apply!959 (+!3424 lt!493924 (tuple2!17381 lt!493923 minValue!831)) lt!493912) (apply!959 lt!493924 lt!493912))))

(declare-fun b!1102200 () Bool)

(declare-fun get!17677 (ValueCell!12893 V!41401) V!41401)

(assert (=> b!1102200 (= e!629186 (= (apply!959 lt!493915 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)) (get!17677 (select (arr!34341 _values!874) #b00000000000000000000000000000000) (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 _values!874)))))

(assert (=> b!1102200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(declare-fun b!1102201 () Bool)

(assert (=> b!1102201 (= e!629188 call!46172)))

(declare-fun bm!46174 () Bool)

(assert (=> bm!46174 (= call!46175 call!46171)))

(assert (= (and d!131069 c!109144) b!1102187))

(assert (= (and d!131069 (not c!109144)) b!1102183))

(assert (= (and b!1102183 c!109142) b!1102201))

(assert (= (and b!1102183 (not c!109142)) b!1102188))

(assert (= (and b!1102188 c!109143) b!1102189))

(assert (= (and b!1102188 (not c!109143)) b!1102185))

(assert (= (or b!1102189 b!1102185) bm!46174))

(assert (= (or b!1102201 bm!46174) bm!46170))

(assert (= (or b!1102201 b!1102189) bm!46171))

(assert (= (or b!1102187 bm!46170) bm!46173))

(assert (= (or b!1102187 bm!46171) bm!46169))

(assert (= (and d!131069 res!735137) b!1102190))

(assert (= (and d!131069 c!109145) b!1102199))

(assert (= (and d!131069 (not c!109145)) b!1102197))

(assert (= (and d!131069 res!735133) b!1102182))

(assert (= (and b!1102182 res!735131) b!1102181))

(assert (= (and b!1102182 (not res!735130)) b!1102195))

(assert (= (and b!1102195 res!735132) b!1102200))

(assert (= (and b!1102182 res!735134) b!1102194))

(assert (= (and b!1102194 c!109141) b!1102186))

(assert (= (and b!1102194 (not c!109141)) b!1102192))

(assert (= (and b!1102186 res!735129) b!1102191))

(assert (= (or b!1102186 b!1102192) bm!46168))

(assert (= (and b!1102194 res!735135) b!1102196))

(assert (= (and b!1102196 c!109146) b!1102193))

(assert (= (and b!1102196 (not c!109146)) b!1102198))

(assert (= (and b!1102193 res!735136) b!1102184))

(assert (= (or b!1102193 b!1102198) bm!46172))

(declare-fun b_lambda!18041 () Bool)

(assert (=> (not b_lambda!18041) (not b!1102200)))

(assert (=> b!1102200 t!34191))

(declare-fun b_and!37093 () Bool)

(assert (= b_and!37083 (and (=> t!34191 result!16571) b_and!37093)))

(declare-fun m!1022637 () Bool)

(assert (=> b!1102184 m!1022637))

(assert (=> bm!46173 m!1022495))

(declare-fun m!1022639 () Bool)

(assert (=> bm!46168 m!1022639))

(assert (=> b!1102190 m!1022627))

(assert (=> b!1102190 m!1022627))

(assert (=> b!1102190 m!1022629))

(declare-fun m!1022641 () Bool)

(assert (=> b!1102187 m!1022641))

(assert (=> d!131069 m!1022507))

(declare-fun m!1022643 () Bool)

(assert (=> bm!46169 m!1022643))

(declare-fun m!1022645 () Bool)

(assert (=> b!1102191 m!1022645))

(declare-fun m!1022647 () Bool)

(assert (=> bm!46172 m!1022647))

(declare-fun m!1022649 () Bool)

(assert (=> b!1102200 m!1022649))

(assert (=> b!1102200 m!1022649))

(assert (=> b!1102200 m!1022483))

(declare-fun m!1022651 () Bool)

(assert (=> b!1102200 m!1022651))

(assert (=> b!1102200 m!1022627))

(declare-fun m!1022653 () Bool)

(assert (=> b!1102200 m!1022653))

(assert (=> b!1102200 m!1022483))

(assert (=> b!1102200 m!1022627))

(declare-fun m!1022655 () Bool)

(assert (=> b!1102199 m!1022655))

(assert (=> b!1102199 m!1022495))

(declare-fun m!1022657 () Bool)

(assert (=> b!1102199 m!1022657))

(assert (=> b!1102199 m!1022657))

(declare-fun m!1022659 () Bool)

(assert (=> b!1102199 m!1022659))

(declare-fun m!1022661 () Bool)

(assert (=> b!1102199 m!1022661))

(declare-fun m!1022663 () Bool)

(assert (=> b!1102199 m!1022663))

(declare-fun m!1022665 () Bool)

(assert (=> b!1102199 m!1022665))

(declare-fun m!1022667 () Bool)

(assert (=> b!1102199 m!1022667))

(declare-fun m!1022669 () Bool)

(assert (=> b!1102199 m!1022669))

(declare-fun m!1022671 () Bool)

(assert (=> b!1102199 m!1022671))

(declare-fun m!1022673 () Bool)

(assert (=> b!1102199 m!1022673))

(declare-fun m!1022675 () Bool)

(assert (=> b!1102199 m!1022675))

(declare-fun m!1022677 () Bool)

(assert (=> b!1102199 m!1022677))

(assert (=> b!1102199 m!1022661))

(declare-fun m!1022679 () Bool)

(assert (=> b!1102199 m!1022679))

(declare-fun m!1022681 () Bool)

(assert (=> b!1102199 m!1022681))

(assert (=> b!1102199 m!1022675))

(declare-fun m!1022683 () Bool)

(assert (=> b!1102199 m!1022683))

(assert (=> b!1102199 m!1022671))

(assert (=> b!1102199 m!1022627))

(assert (=> b!1102195 m!1022627))

(assert (=> b!1102195 m!1022627))

(declare-fun m!1022685 () Bool)

(assert (=> b!1102195 m!1022685))

(assert (=> b!1102181 m!1022627))

(assert (=> b!1102181 m!1022627))

(assert (=> b!1102181 m!1022629))

(assert (=> b!1102020 d!131069))

(declare-fun b!1102226 () Bool)

(assert (=> b!1102226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(assert (=> b!1102226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 lt!493792)))))

(declare-fun lt!493944 () ListLongMap!15357)

(declare-fun e!629213 () Bool)

(assert (=> b!1102226 (= e!629213 (= (apply!959 lt!493944 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)) (get!17677 (select (arr!34341 lt!493792) #b00000000000000000000000000000000) (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102227 () Bool)

(declare-fun e!629214 () Bool)

(declare-fun e!629216 () Bool)

(assert (=> b!1102227 (= e!629214 e!629216)))

(declare-fun c!109156 () Bool)

(declare-fun e!629215 () Bool)

(assert (=> b!1102227 (= c!109156 e!629215)))

(declare-fun res!735146 () Bool)

(assert (=> b!1102227 (=> (not res!735146) (not e!629215))))

(assert (=> b!1102227 (= res!735146 (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(declare-fun b!1102228 () Bool)

(assert (=> b!1102228 (= e!629216 e!629213)))

(assert (=> b!1102228 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(declare-fun res!735147 () Bool)

(assert (=> b!1102228 (= res!735147 (contains!6422 lt!493944 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(assert (=> b!1102228 (=> (not res!735147) (not e!629213))))

(declare-fun b!1102229 () Bool)

(declare-fun e!629212 () ListLongMap!15357)

(declare-fun call!46180 () ListLongMap!15357)

(assert (=> b!1102229 (= e!629212 call!46180)))

(declare-fun bm!46177 () Bool)

(assert (=> bm!46177 (= call!46180 (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102230 () Bool)

(declare-fun e!629211 () ListLongMap!15357)

(assert (=> b!1102230 (= e!629211 (ListLongMap!15358 Nil!23996))))

(declare-fun b!1102231 () Bool)

(declare-fun lt!493943 () Unit!36177)

(declare-fun lt!493941 () Unit!36177)

(assert (=> b!1102231 (= lt!493943 lt!493941)))

(declare-fun lt!493940 () ListLongMap!15357)

(declare-fun lt!493942 () V!41401)

(declare-fun lt!493946 () (_ BitVec 64))

(declare-fun lt!493945 () (_ BitVec 64))

(assert (=> b!1102231 (not (contains!6422 (+!3424 lt!493940 (tuple2!17381 lt!493945 lt!493942)) lt!493946))))

(declare-fun addStillNotContains!280 (ListLongMap!15357 (_ BitVec 64) V!41401 (_ BitVec 64)) Unit!36177)

(assert (=> b!1102231 (= lt!493941 (addStillNotContains!280 lt!493940 lt!493945 lt!493942 lt!493946))))

(assert (=> b!1102231 (= lt!493946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102231 (= lt!493942 (get!17677 (select (arr!34341 lt!493792) #b00000000000000000000000000000000) (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102231 (= lt!493945 (select (arr!34340 lt!493787) #b00000000000000000000000000000000))))

(assert (=> b!1102231 (= lt!493940 call!46180)))

(assert (=> b!1102231 (= e!629212 (+!3424 call!46180 (tuple2!17381 (select (arr!34340 lt!493787) #b00000000000000000000000000000000) (get!17677 (select (arr!34341 lt!493792) #b00000000000000000000000000000000) (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!131071 () Bool)

(assert (=> d!131071 e!629214))

(declare-fun res!735149 () Bool)

(assert (=> d!131071 (=> (not res!735149) (not e!629214))))

(assert (=> d!131071 (= res!735149 (not (contains!6422 lt!493944 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131071 (= lt!493944 e!629211)))

(declare-fun c!109157 () Bool)

(assert (=> d!131071 (= c!109157 (bvsge #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(assert (=> d!131071 (validMask!0 mask!1414)))

(assert (=> d!131071 (= (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493944)))

(declare-fun b!1102232 () Bool)

(declare-fun e!629217 () Bool)

(assert (=> b!1102232 (= e!629217 (= lt!493944 (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102233 () Bool)

(assert (=> b!1102233 (= e!629211 e!629212)))

(declare-fun c!109158 () Bool)

(assert (=> b!1102233 (= c!109158 (validKeyInArray!0 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(declare-fun b!1102234 () Bool)

(assert (=> b!1102234 (= e!629215 (validKeyInArray!0 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(assert (=> b!1102234 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1102235 () Bool)

(assert (=> b!1102235 (= e!629216 e!629217)))

(declare-fun c!109155 () Bool)

(assert (=> b!1102235 (= c!109155 (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(declare-fun b!1102236 () Bool)

(declare-fun res!735148 () Bool)

(assert (=> b!1102236 (=> (not res!735148) (not e!629214))))

(assert (=> b!1102236 (= res!735148 (not (contains!6422 lt!493944 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102237 () Bool)

(declare-fun isEmpty!972 (ListLongMap!15357) Bool)

(assert (=> b!1102237 (= e!629217 (isEmpty!972 lt!493944))))

(assert (= (and d!131071 c!109157) b!1102230))

(assert (= (and d!131071 (not c!109157)) b!1102233))

(assert (= (and b!1102233 c!109158) b!1102231))

(assert (= (and b!1102233 (not c!109158)) b!1102229))

(assert (= (or b!1102231 b!1102229) bm!46177))

(assert (= (and d!131071 res!735149) b!1102236))

(assert (= (and b!1102236 res!735148) b!1102227))

(assert (= (and b!1102227 res!735146) b!1102234))

(assert (= (and b!1102227 c!109156) b!1102228))

(assert (= (and b!1102227 (not c!109156)) b!1102235))

(assert (= (and b!1102228 res!735147) b!1102226))

(assert (= (and b!1102235 c!109155) b!1102232))

(assert (= (and b!1102235 (not c!109155)) b!1102237))

(declare-fun b_lambda!18043 () Bool)

(assert (=> (not b_lambda!18043) (not b!1102226)))

(assert (=> b!1102226 t!34191))

(declare-fun b_and!37095 () Bool)

(assert (= b_and!37093 (and (=> t!34191 result!16571) b_and!37095)))

(declare-fun b_lambda!18045 () Bool)

(assert (=> (not b_lambda!18045) (not b!1102231)))

(assert (=> b!1102231 t!34191))

(declare-fun b_and!37097 () Bool)

(assert (= b_and!37095 (and (=> t!34191 result!16571) b_and!37097)))

(declare-fun m!1022687 () Bool)

(assert (=> b!1102226 m!1022687))

(assert (=> b!1102226 m!1022483))

(declare-fun m!1022689 () Bool)

(assert (=> b!1102226 m!1022689))

(assert (=> b!1102226 m!1022483))

(declare-fun m!1022691 () Bool)

(assert (=> b!1102226 m!1022691))

(declare-fun m!1022693 () Bool)

(assert (=> b!1102226 m!1022693))

(assert (=> b!1102226 m!1022687))

(assert (=> b!1102226 m!1022691))

(declare-fun m!1022695 () Bool)

(assert (=> b!1102232 m!1022695))

(declare-fun m!1022697 () Bool)

(assert (=> b!1102237 m!1022697))

(assert (=> b!1102234 m!1022691))

(assert (=> b!1102234 m!1022691))

(declare-fun m!1022699 () Bool)

(assert (=> b!1102234 m!1022699))

(assert (=> b!1102228 m!1022691))

(assert (=> b!1102228 m!1022691))

(declare-fun m!1022701 () Bool)

(assert (=> b!1102228 m!1022701))

(assert (=> bm!46177 m!1022695))

(declare-fun m!1022703 () Bool)

(assert (=> b!1102236 m!1022703))

(declare-fun m!1022705 () Bool)

(assert (=> d!131071 m!1022705))

(assert (=> d!131071 m!1022507))

(assert (=> b!1102231 m!1022687))

(assert (=> b!1102231 m!1022483))

(assert (=> b!1102231 m!1022689))

(assert (=> b!1102231 m!1022483))

(declare-fun m!1022707 () Bool)

(assert (=> b!1102231 m!1022707))

(declare-fun m!1022709 () Bool)

(assert (=> b!1102231 m!1022709))

(declare-fun m!1022711 () Bool)

(assert (=> b!1102231 m!1022711))

(declare-fun m!1022713 () Bool)

(assert (=> b!1102231 m!1022713))

(assert (=> b!1102231 m!1022707))

(assert (=> b!1102231 m!1022687))

(assert (=> b!1102231 m!1022691))

(assert (=> b!1102233 m!1022691))

(assert (=> b!1102233 m!1022691))

(assert (=> b!1102233 m!1022699))

(assert (=> b!1102020 d!131071))

(declare-fun bm!46178 () Bool)

(declare-fun call!46187 () Bool)

(declare-fun lt!493958 () ListLongMap!15357)

(assert (=> bm!46178 (= call!46187 (contains!6422 lt!493958 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!109160 () Bool)

(declare-fun call!46185 () ListLongMap!15357)

(declare-fun call!46184 () ListLongMap!15357)

(declare-fun call!46181 () ListLongMap!15357)

(declare-fun bm!46179 () Bool)

(declare-fun c!109162 () Bool)

(declare-fun call!46186 () ListLongMap!15357)

(assert (=> bm!46179 (= call!46184 (+!3424 (ite c!109162 call!46186 (ite c!109160 call!46181 call!46185)) (ite (or c!109162 c!109160) (tuple2!17381 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102238 () Bool)

(declare-fun e!629227 () Bool)

(assert (=> b!1102238 (= e!629227 (validKeyInArray!0 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(declare-fun bm!46180 () Bool)

(assert (=> bm!46180 (= call!46181 call!46186)))

(declare-fun b!1102239 () Bool)

(declare-fun res!735155 () Bool)

(declare-fun e!629226 () Bool)

(assert (=> b!1102239 (=> (not res!735155) (not e!629226))))

(declare-fun e!629219 () Bool)

(assert (=> b!1102239 (= res!735155 e!629219)))

(declare-fun res!735151 () Bool)

(assert (=> b!1102239 (=> res!735151 e!629219)))

(assert (=> b!1102239 (= res!735151 (not e!629227))))

(declare-fun res!735152 () Bool)

(assert (=> b!1102239 (=> (not res!735152) (not e!629227))))

(assert (=> b!1102239 (= res!735152 (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(declare-fun d!131073 () Bool)

(assert (=> d!131073 e!629226))

(declare-fun res!735154 () Bool)

(assert (=> d!131073 (=> (not res!735154) (not e!629226))))

(assert (=> d!131073 (= res!735154 (or (bvsge #b00000000000000000000000000000000 (size!34877 lt!493787)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))))

(declare-fun lt!493962 () ListLongMap!15357)

(assert (=> d!131073 (= lt!493958 lt!493962)))

(declare-fun lt!493947 () Unit!36177)

(declare-fun e!629228 () Unit!36177)

(assert (=> d!131073 (= lt!493947 e!629228)))

(declare-fun c!109163 () Bool)

(declare-fun e!629221 () Bool)

(assert (=> d!131073 (= c!109163 e!629221)))

(declare-fun res!735158 () Bool)

(assert (=> d!131073 (=> (not res!735158) (not e!629221))))

(assert (=> d!131073 (= res!735158 (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(declare-fun e!629223 () ListLongMap!15357)

(assert (=> d!131073 (= lt!493962 e!629223)))

(assert (=> d!131073 (= c!109162 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131073 (validMask!0 mask!1414)))

(assert (=> d!131073 (= (getCurrentListMap!4398 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493958)))

(declare-fun bm!46181 () Bool)

(declare-fun call!46182 () ListLongMap!15357)

(assert (=> bm!46181 (= call!46182 call!46184)))

(declare-fun b!1102240 () Bool)

(declare-fun e!629222 () ListLongMap!15357)

(assert (=> b!1102240 (= e!629223 e!629222)))

(assert (=> b!1102240 (= c!109160 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102241 () Bool)

(declare-fun e!629218 () Bool)

(assert (=> b!1102241 (= e!629218 (= (apply!959 lt!493958 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102242 () Bool)

(declare-fun e!629230 () ListLongMap!15357)

(assert (=> b!1102242 (= e!629230 call!46185)))

(declare-fun b!1102243 () Bool)

(declare-fun e!629224 () Bool)

(declare-fun e!629225 () Bool)

(assert (=> b!1102243 (= e!629224 e!629225)))

(declare-fun res!735150 () Bool)

(assert (=> b!1102243 (= res!735150 call!46187)))

(assert (=> b!1102243 (=> (not res!735150) (not e!629225))))

(declare-fun b!1102244 () Bool)

(assert (=> b!1102244 (= e!629223 (+!3424 call!46184 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102245 () Bool)

(declare-fun c!109161 () Bool)

(assert (=> b!1102245 (= c!109161 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1102245 (= e!629222 e!629230)))

(declare-fun b!1102246 () Bool)

(assert (=> b!1102246 (= e!629230 call!46182)))

(declare-fun bm!46182 () Bool)

(declare-fun call!46183 () Bool)

(assert (=> bm!46182 (= call!46183 (contains!6422 lt!493958 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102247 () Bool)

(assert (=> b!1102247 (= e!629221 (validKeyInArray!0 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(declare-fun b!1102248 () Bool)

(assert (=> b!1102248 (= e!629225 (= (apply!959 lt!493958 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1102249 () Bool)

(assert (=> b!1102249 (= e!629224 (not call!46187))))

(declare-fun b!1102250 () Bool)

(declare-fun e!629229 () Bool)

(assert (=> b!1102250 (= e!629229 e!629218)))

(declare-fun res!735157 () Bool)

(assert (=> b!1102250 (= res!735157 call!46183)))

(assert (=> b!1102250 (=> (not res!735157) (not e!629218))))

(declare-fun b!1102251 () Bool)

(declare-fun res!735156 () Bool)

(assert (=> b!1102251 (=> (not res!735156) (not e!629226))))

(assert (=> b!1102251 (= res!735156 e!629224)))

(declare-fun c!109159 () Bool)

(assert (=> b!1102251 (= c!109159 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102252 () Bool)

(declare-fun e!629220 () Bool)

(assert (=> b!1102252 (= e!629219 e!629220)))

(declare-fun res!735153 () Bool)

(assert (=> b!1102252 (=> (not res!735153) (not e!629220))))

(assert (=> b!1102252 (= res!735153 (contains!6422 lt!493958 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(assert (=> b!1102252 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(declare-fun bm!46183 () Bool)

(assert (=> bm!46183 (= call!46186 (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102253 () Bool)

(assert (=> b!1102253 (= e!629226 e!629229)))

(declare-fun c!109164 () Bool)

(assert (=> b!1102253 (= c!109164 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102254 () Bool)

(declare-fun Unit!36184 () Unit!36177)

(assert (=> b!1102254 (= e!629228 Unit!36184)))

(declare-fun b!1102255 () Bool)

(assert (=> b!1102255 (= e!629229 (not call!46183))))

(declare-fun b!1102256 () Bool)

(declare-fun lt!493960 () Unit!36177)

(assert (=> b!1102256 (= e!629228 lt!493960)))

(declare-fun lt!493965 () ListLongMap!15357)

(assert (=> b!1102256 (= lt!493965 (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493952 () (_ BitVec 64))

(assert (=> b!1102256 (= lt!493952 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493964 () (_ BitVec 64))

(assert (=> b!1102256 (= lt!493964 (select (arr!34340 lt!493787) #b00000000000000000000000000000000))))

(declare-fun lt!493959 () Unit!36177)

(assert (=> b!1102256 (= lt!493959 (addStillContains!663 lt!493965 lt!493952 zeroValue!831 lt!493964))))

(assert (=> b!1102256 (contains!6422 (+!3424 lt!493965 (tuple2!17381 lt!493952 zeroValue!831)) lt!493964)))

(declare-fun lt!493950 () Unit!36177)

(assert (=> b!1102256 (= lt!493950 lt!493959)))

(declare-fun lt!493956 () ListLongMap!15357)

(assert (=> b!1102256 (= lt!493956 (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493968 () (_ BitVec 64))

(assert (=> b!1102256 (= lt!493968 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493948 () (_ BitVec 64))

(assert (=> b!1102256 (= lt!493948 (select (arr!34340 lt!493787) #b00000000000000000000000000000000))))

(declare-fun lt!493954 () Unit!36177)

(assert (=> b!1102256 (= lt!493954 (addApplyDifferent!519 lt!493956 lt!493968 minValue!831 lt!493948))))

(assert (=> b!1102256 (= (apply!959 (+!3424 lt!493956 (tuple2!17381 lt!493968 minValue!831)) lt!493948) (apply!959 lt!493956 lt!493948))))

(declare-fun lt!493961 () Unit!36177)

(assert (=> b!1102256 (= lt!493961 lt!493954)))

(declare-fun lt!493951 () ListLongMap!15357)

(assert (=> b!1102256 (= lt!493951 (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493957 () (_ BitVec 64))

(assert (=> b!1102256 (= lt!493957 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493963 () (_ BitVec 64))

(assert (=> b!1102256 (= lt!493963 (select (arr!34340 lt!493787) #b00000000000000000000000000000000))))

(declare-fun lt!493953 () Unit!36177)

(assert (=> b!1102256 (= lt!493953 (addApplyDifferent!519 lt!493951 lt!493957 zeroValue!831 lt!493963))))

(assert (=> b!1102256 (= (apply!959 (+!3424 lt!493951 (tuple2!17381 lt!493957 zeroValue!831)) lt!493963) (apply!959 lt!493951 lt!493963))))

(declare-fun lt!493949 () Unit!36177)

(assert (=> b!1102256 (= lt!493949 lt!493953)))

(declare-fun lt!493967 () ListLongMap!15357)

(assert (=> b!1102256 (= lt!493967 (getCurrentListMapNoExtraKeys!4239 lt!493787 lt!493792 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493966 () (_ BitVec 64))

(assert (=> b!1102256 (= lt!493966 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!493955 () (_ BitVec 64))

(assert (=> b!1102256 (= lt!493955 (select (arr!34340 lt!493787) #b00000000000000000000000000000000))))

(assert (=> b!1102256 (= lt!493960 (addApplyDifferent!519 lt!493967 lt!493966 minValue!831 lt!493955))))

(assert (=> b!1102256 (= (apply!959 (+!3424 lt!493967 (tuple2!17381 lt!493966 minValue!831)) lt!493955) (apply!959 lt!493967 lt!493955))))

(declare-fun b!1102257 () Bool)

(assert (=> b!1102257 (= e!629220 (= (apply!959 lt!493958 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)) (get!17677 (select (arr!34341 lt!493792) #b00000000000000000000000000000000) (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 lt!493792)))))

(assert (=> b!1102257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(declare-fun b!1102258 () Bool)

(assert (=> b!1102258 (= e!629222 call!46182)))

(declare-fun bm!46184 () Bool)

(assert (=> bm!46184 (= call!46185 call!46181)))

(assert (= (and d!131073 c!109162) b!1102244))

(assert (= (and d!131073 (not c!109162)) b!1102240))

(assert (= (and b!1102240 c!109160) b!1102258))

(assert (= (and b!1102240 (not c!109160)) b!1102245))

(assert (= (and b!1102245 c!109161) b!1102246))

(assert (= (and b!1102245 (not c!109161)) b!1102242))

(assert (= (or b!1102246 b!1102242) bm!46184))

(assert (= (or b!1102258 bm!46184) bm!46180))

(assert (= (or b!1102258 b!1102246) bm!46181))

(assert (= (or b!1102244 bm!46180) bm!46183))

(assert (= (or b!1102244 bm!46181) bm!46179))

(assert (= (and d!131073 res!735158) b!1102247))

(assert (= (and d!131073 c!109163) b!1102256))

(assert (= (and d!131073 (not c!109163)) b!1102254))

(assert (= (and d!131073 res!735154) b!1102239))

(assert (= (and b!1102239 res!735152) b!1102238))

(assert (= (and b!1102239 (not res!735151)) b!1102252))

(assert (= (and b!1102252 res!735153) b!1102257))

(assert (= (and b!1102239 res!735155) b!1102251))

(assert (= (and b!1102251 c!109159) b!1102243))

(assert (= (and b!1102251 (not c!109159)) b!1102249))

(assert (= (and b!1102243 res!735150) b!1102248))

(assert (= (or b!1102243 b!1102249) bm!46178))

(assert (= (and b!1102251 res!735156) b!1102253))

(assert (= (and b!1102253 c!109164) b!1102250))

(assert (= (and b!1102253 (not c!109164)) b!1102255))

(assert (= (and b!1102250 res!735157) b!1102241))

(assert (= (or b!1102250 b!1102255) bm!46182))

(declare-fun b_lambda!18047 () Bool)

(assert (=> (not b_lambda!18047) (not b!1102257)))

(assert (=> b!1102257 t!34191))

(declare-fun b_and!37099 () Bool)

(assert (= b_and!37097 (and (=> t!34191 result!16571) b_and!37099)))

(declare-fun m!1022715 () Bool)

(assert (=> b!1102241 m!1022715))

(assert (=> bm!46183 m!1022485))

(declare-fun m!1022717 () Bool)

(assert (=> bm!46178 m!1022717))

(assert (=> b!1102247 m!1022691))

(assert (=> b!1102247 m!1022691))

(assert (=> b!1102247 m!1022699))

(declare-fun m!1022719 () Bool)

(assert (=> b!1102244 m!1022719))

(assert (=> d!131073 m!1022507))

(declare-fun m!1022721 () Bool)

(assert (=> bm!46179 m!1022721))

(declare-fun m!1022723 () Bool)

(assert (=> b!1102248 m!1022723))

(declare-fun m!1022725 () Bool)

(assert (=> bm!46182 m!1022725))

(assert (=> b!1102257 m!1022687))

(assert (=> b!1102257 m!1022687))

(assert (=> b!1102257 m!1022483))

(assert (=> b!1102257 m!1022689))

(assert (=> b!1102257 m!1022691))

(declare-fun m!1022727 () Bool)

(assert (=> b!1102257 m!1022727))

(assert (=> b!1102257 m!1022483))

(assert (=> b!1102257 m!1022691))

(declare-fun m!1022729 () Bool)

(assert (=> b!1102256 m!1022729))

(assert (=> b!1102256 m!1022485))

(declare-fun m!1022731 () Bool)

(assert (=> b!1102256 m!1022731))

(assert (=> b!1102256 m!1022731))

(declare-fun m!1022733 () Bool)

(assert (=> b!1102256 m!1022733))

(declare-fun m!1022735 () Bool)

(assert (=> b!1102256 m!1022735))

(declare-fun m!1022737 () Bool)

(assert (=> b!1102256 m!1022737))

(declare-fun m!1022739 () Bool)

(assert (=> b!1102256 m!1022739))

(declare-fun m!1022741 () Bool)

(assert (=> b!1102256 m!1022741))

(declare-fun m!1022743 () Bool)

(assert (=> b!1102256 m!1022743))

(declare-fun m!1022745 () Bool)

(assert (=> b!1102256 m!1022745))

(declare-fun m!1022747 () Bool)

(assert (=> b!1102256 m!1022747))

(declare-fun m!1022749 () Bool)

(assert (=> b!1102256 m!1022749))

(declare-fun m!1022751 () Bool)

(assert (=> b!1102256 m!1022751))

(assert (=> b!1102256 m!1022735))

(declare-fun m!1022753 () Bool)

(assert (=> b!1102256 m!1022753))

(declare-fun m!1022755 () Bool)

(assert (=> b!1102256 m!1022755))

(assert (=> b!1102256 m!1022749))

(declare-fun m!1022757 () Bool)

(assert (=> b!1102256 m!1022757))

(assert (=> b!1102256 m!1022745))

(assert (=> b!1102256 m!1022691))

(assert (=> b!1102252 m!1022691))

(assert (=> b!1102252 m!1022691))

(declare-fun m!1022759 () Bool)

(assert (=> b!1102252 m!1022759))

(assert (=> b!1102238 m!1022691))

(assert (=> b!1102238 m!1022691))

(assert (=> b!1102238 m!1022699))

(assert (=> b!1102020 d!131073))

(declare-fun call!46192 () ListLongMap!15357)

(declare-fun e!629236 () Bool)

(declare-fun b!1102265 () Bool)

(declare-fun call!46193 () ListLongMap!15357)

(assert (=> b!1102265 (= e!629236 (= call!46193 (-!962 call!46192 k0!904)))))

(assert (=> b!1102265 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34878 _values!874)))))

(declare-fun b!1102266 () Bool)

(assert (=> b!1102266 (= e!629236 (= call!46193 call!46192))))

(assert (=> b!1102266 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34878 _values!874)))))

(declare-fun d!131075 () Bool)

(declare-fun e!629235 () Bool)

(assert (=> d!131075 e!629235))

(declare-fun res!735161 () Bool)

(assert (=> d!131075 (=> (not res!735161) (not e!629235))))

(assert (=> d!131075 (= res!735161 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34877 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34877 _keys!1070))))))))

(declare-fun lt!493971 () Unit!36177)

(declare-fun choose!1774 (array!71363 array!71365 (_ BitVec 32) (_ BitVec 32) V!41401 V!41401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36177)

(assert (=> d!131075 (= lt!493971 (choose!1774 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!131075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(assert (=> d!131075 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!232 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!493971)))

(declare-fun bm!46189 () Bool)

(assert (=> bm!46189 (= call!46192 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46190 () Bool)

(assert (=> bm!46190 (= call!46193 (getCurrentListMapNoExtraKeys!4239 (array!71364 (store (arr!34340 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34877 _keys!1070)) (array!71366 (store (arr!34341 _values!874) i!650 (ValueCellFull!12893 (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34878 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102267 () Bool)

(assert (=> b!1102267 (= e!629235 e!629236)))

(declare-fun c!109167 () Bool)

(assert (=> b!1102267 (= c!109167 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!131075 res!735161) b!1102267))

(assert (= (and b!1102267 c!109167) b!1102265))

(assert (= (and b!1102267 (not c!109167)) b!1102266))

(assert (= (or b!1102265 b!1102266) bm!46189))

(assert (= (or b!1102265 b!1102266) bm!46190))

(declare-fun b_lambda!18049 () Bool)

(assert (=> (not b_lambda!18049) (not bm!46190)))

(assert (=> bm!46190 t!34191))

(declare-fun b_and!37101 () Bool)

(assert (= b_and!37099 (and (=> t!34191 result!16571) b_and!37101)))

(declare-fun m!1022761 () Bool)

(assert (=> b!1102265 m!1022761))

(declare-fun m!1022763 () Bool)

(assert (=> d!131075 m!1022763))

(assert (=> bm!46189 m!1022495))

(assert (=> bm!46190 m!1022517))

(assert (=> bm!46190 m!1022483))

(assert (=> bm!46190 m!1022487))

(declare-fun m!1022765 () Bool)

(assert (=> bm!46190 m!1022765))

(assert (=> b!1102020 d!131075))

(declare-fun d!131077 () Bool)

(declare-fun lt!493974 () ListLongMap!15357)

(assert (=> d!131077 (not (contains!6422 lt!493974 k0!904))))

(declare-fun removeStrictlySorted!83 (List!23999 (_ BitVec 64)) List!23999)

(assert (=> d!131077 (= lt!493974 (ListLongMap!15358 (removeStrictlySorted!83 (toList!7694 lt!493786) k0!904)))))

(assert (=> d!131077 (= (-!962 lt!493786 k0!904) lt!493974)))

(declare-fun bs!32335 () Bool)

(assert (= bs!32335 d!131077))

(declare-fun m!1022767 () Bool)

(assert (=> bs!32335 m!1022767))

(declare-fun m!1022769 () Bool)

(assert (=> bs!32335 m!1022769))

(assert (=> b!1102020 d!131077))

(declare-fun b!1102268 () Bool)

(assert (=> b!1102268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(assert (=> b!1102268 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34878 _values!874)))))

(declare-fun lt!493979 () ListLongMap!15357)

(declare-fun e!629239 () Bool)

(assert (=> b!1102268 (= e!629239 (= (apply!959 lt!493979 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)) (get!17677 (select (arr!34341 _values!874) #b00000000000000000000000000000000) (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102269 () Bool)

(declare-fun e!629240 () Bool)

(declare-fun e!629242 () Bool)

(assert (=> b!1102269 (= e!629240 e!629242)))

(declare-fun c!109169 () Bool)

(declare-fun e!629241 () Bool)

(assert (=> b!1102269 (= c!109169 e!629241)))

(declare-fun res!735162 () Bool)

(assert (=> b!1102269 (=> (not res!735162) (not e!629241))))

(assert (=> b!1102269 (= res!735162 (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(declare-fun b!1102270 () Bool)

(assert (=> b!1102270 (= e!629242 e!629239)))

(assert (=> b!1102270 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(declare-fun res!735163 () Bool)

(assert (=> b!1102270 (= res!735163 (contains!6422 lt!493979 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102270 (=> (not res!735163) (not e!629239))))

(declare-fun b!1102271 () Bool)

(declare-fun e!629238 () ListLongMap!15357)

(declare-fun call!46194 () ListLongMap!15357)

(assert (=> b!1102271 (= e!629238 call!46194)))

(declare-fun bm!46191 () Bool)

(assert (=> bm!46191 (= call!46194 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102272 () Bool)

(declare-fun e!629237 () ListLongMap!15357)

(assert (=> b!1102272 (= e!629237 (ListLongMap!15358 Nil!23996))))

(declare-fun b!1102273 () Bool)

(declare-fun lt!493978 () Unit!36177)

(declare-fun lt!493976 () Unit!36177)

(assert (=> b!1102273 (= lt!493978 lt!493976)))

(declare-fun lt!493980 () (_ BitVec 64))

(declare-fun lt!493975 () ListLongMap!15357)

(declare-fun lt!493981 () (_ BitVec 64))

(declare-fun lt!493977 () V!41401)

(assert (=> b!1102273 (not (contains!6422 (+!3424 lt!493975 (tuple2!17381 lt!493980 lt!493977)) lt!493981))))

(assert (=> b!1102273 (= lt!493976 (addStillNotContains!280 lt!493975 lt!493980 lt!493977 lt!493981))))

(assert (=> b!1102273 (= lt!493981 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102273 (= lt!493977 (get!17677 (select (arr!34341 _values!874) #b00000000000000000000000000000000) (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102273 (= lt!493980 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102273 (= lt!493975 call!46194)))

(assert (=> b!1102273 (= e!629238 (+!3424 call!46194 (tuple2!17381 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000) (get!17677 (select (arr!34341 _values!874) #b00000000000000000000000000000000) (dynLambda!2357 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!131079 () Bool)

(assert (=> d!131079 e!629240))

(declare-fun res!735165 () Bool)

(assert (=> d!131079 (=> (not res!735165) (not e!629240))))

(assert (=> d!131079 (= res!735165 (not (contains!6422 lt!493979 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131079 (= lt!493979 e!629237)))

(declare-fun c!109170 () Bool)

(assert (=> d!131079 (= c!109170 (bvsge #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(assert (=> d!131079 (validMask!0 mask!1414)))

(assert (=> d!131079 (= (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!493979)))

(declare-fun e!629243 () Bool)

(declare-fun b!1102274 () Bool)

(assert (=> b!1102274 (= e!629243 (= lt!493979 (getCurrentListMapNoExtraKeys!4239 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102275 () Bool)

(assert (=> b!1102275 (= e!629237 e!629238)))

(declare-fun c!109171 () Bool)

(assert (=> b!1102275 (= c!109171 (validKeyInArray!0 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102276 () Bool)

(assert (=> b!1102276 (= e!629241 (validKeyInArray!0 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102276 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1102277 () Bool)

(assert (=> b!1102277 (= e!629242 e!629243)))

(declare-fun c!109168 () Bool)

(assert (=> b!1102277 (= c!109168 (bvslt #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(declare-fun b!1102278 () Bool)

(declare-fun res!735164 () Bool)

(assert (=> b!1102278 (=> (not res!735164) (not e!629240))))

(assert (=> b!1102278 (= res!735164 (not (contains!6422 lt!493979 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102279 () Bool)

(assert (=> b!1102279 (= e!629243 (isEmpty!972 lt!493979))))

(assert (= (and d!131079 c!109170) b!1102272))

(assert (= (and d!131079 (not c!109170)) b!1102275))

(assert (= (and b!1102275 c!109171) b!1102273))

(assert (= (and b!1102275 (not c!109171)) b!1102271))

(assert (= (or b!1102273 b!1102271) bm!46191))

(assert (= (and d!131079 res!735165) b!1102278))

(assert (= (and b!1102278 res!735164) b!1102269))

(assert (= (and b!1102269 res!735162) b!1102276))

(assert (= (and b!1102269 c!109169) b!1102270))

(assert (= (and b!1102269 (not c!109169)) b!1102277))

(assert (= (and b!1102270 res!735163) b!1102268))

(assert (= (and b!1102277 c!109168) b!1102274))

(assert (= (and b!1102277 (not c!109168)) b!1102279))

(declare-fun b_lambda!18051 () Bool)

(assert (=> (not b_lambda!18051) (not b!1102268)))

(assert (=> b!1102268 t!34191))

(declare-fun b_and!37103 () Bool)

(assert (= b_and!37101 (and (=> t!34191 result!16571) b_and!37103)))

(declare-fun b_lambda!18053 () Bool)

(assert (=> (not b_lambda!18053) (not b!1102273)))

(assert (=> b!1102273 t!34191))

(declare-fun b_and!37105 () Bool)

(assert (= b_and!37103 (and (=> t!34191 result!16571) b_and!37105)))

(assert (=> b!1102268 m!1022649))

(assert (=> b!1102268 m!1022483))

(assert (=> b!1102268 m!1022651))

(assert (=> b!1102268 m!1022483))

(assert (=> b!1102268 m!1022627))

(declare-fun m!1022771 () Bool)

(assert (=> b!1102268 m!1022771))

(assert (=> b!1102268 m!1022649))

(assert (=> b!1102268 m!1022627))

(declare-fun m!1022773 () Bool)

(assert (=> b!1102274 m!1022773))

(declare-fun m!1022775 () Bool)

(assert (=> b!1102279 m!1022775))

(assert (=> b!1102276 m!1022627))

(assert (=> b!1102276 m!1022627))

(assert (=> b!1102276 m!1022629))

(assert (=> b!1102270 m!1022627))

(assert (=> b!1102270 m!1022627))

(declare-fun m!1022777 () Bool)

(assert (=> b!1102270 m!1022777))

(assert (=> bm!46191 m!1022773))

(declare-fun m!1022779 () Bool)

(assert (=> b!1102278 m!1022779))

(declare-fun m!1022781 () Bool)

(assert (=> d!131079 m!1022781))

(assert (=> d!131079 m!1022507))

(assert (=> b!1102273 m!1022649))

(assert (=> b!1102273 m!1022483))

(assert (=> b!1102273 m!1022651))

(assert (=> b!1102273 m!1022483))

(declare-fun m!1022783 () Bool)

(assert (=> b!1102273 m!1022783))

(declare-fun m!1022785 () Bool)

(assert (=> b!1102273 m!1022785))

(declare-fun m!1022787 () Bool)

(assert (=> b!1102273 m!1022787))

(declare-fun m!1022789 () Bool)

(assert (=> b!1102273 m!1022789))

(assert (=> b!1102273 m!1022783))

(assert (=> b!1102273 m!1022649))

(assert (=> b!1102273 m!1022627))

(assert (=> b!1102275 m!1022627))

(assert (=> b!1102275 m!1022627))

(assert (=> b!1102275 m!1022629))

(assert (=> b!1102020 d!131079))

(declare-fun d!131081 () Bool)

(assert (=> d!131081 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493984 () Unit!36177)

(declare-fun choose!13 (array!71363 (_ BitVec 64) (_ BitVec 32)) Unit!36177)

(assert (=> d!131081 (= lt!493984 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!131081 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!131081 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!493984)))

(declare-fun bs!32336 () Bool)

(assert (= bs!32336 d!131081))

(assert (=> bs!32336 m!1022489))

(declare-fun m!1022791 () Bool)

(assert (=> bs!32336 m!1022791))

(assert (=> b!1102020 d!131081))

(declare-fun b!1102288 () Bool)

(declare-fun e!629250 () Bool)

(declare-fun call!46197 () Bool)

(assert (=> b!1102288 (= e!629250 call!46197)))

(declare-fun b!1102289 () Bool)

(declare-fun e!629252 () Bool)

(assert (=> b!1102289 (= e!629252 call!46197)))

(declare-fun b!1102290 () Bool)

(declare-fun e!629251 () Bool)

(assert (=> b!1102290 (= e!629251 e!629252)))

(declare-fun c!109174 () Bool)

(assert (=> b!1102290 (= c!109174 (validKeyInArray!0 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102291 () Bool)

(assert (=> b!1102291 (= e!629252 e!629250)))

(declare-fun lt!493993 () (_ BitVec 64))

(assert (=> b!1102291 (= lt!493993 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!493991 () Unit!36177)

(assert (=> b!1102291 (= lt!493991 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!493993 #b00000000000000000000000000000000))))

(assert (=> b!1102291 (arrayContainsKey!0 _keys!1070 lt!493993 #b00000000000000000000000000000000)))

(declare-fun lt!493992 () Unit!36177)

(assert (=> b!1102291 (= lt!493992 lt!493991)))

(declare-fun res!735170 () Bool)

(declare-datatypes ((SeekEntryResult!9869 0))(
  ( (MissingZero!9869 (index!41847 (_ BitVec 32))) (Found!9869 (index!41848 (_ BitVec 32))) (Intermediate!9869 (undefined!10681 Bool) (index!41849 (_ BitVec 32)) (x!98982 (_ BitVec 32))) (Undefined!9869) (MissingVacant!9869 (index!41850 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71363 (_ BitVec 32)) SeekEntryResult!9869)

(assert (=> b!1102291 (= res!735170 (= (seekEntryOrOpen!0 (select (arr!34340 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9869 #b00000000000000000000000000000000)))))

(assert (=> b!1102291 (=> (not res!735170) (not e!629250))))

(declare-fun d!131083 () Bool)

(declare-fun res!735171 () Bool)

(assert (=> d!131083 (=> res!735171 e!629251)))

(assert (=> d!131083 (= res!735171 (bvsge #b00000000000000000000000000000000 (size!34877 _keys!1070)))))

(assert (=> d!131083 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!629251)))

(declare-fun bm!46194 () Bool)

(assert (=> bm!46194 (= call!46197 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(assert (= (and d!131083 (not res!735171)) b!1102290))

(assert (= (and b!1102290 c!109174) b!1102291))

(assert (= (and b!1102290 (not c!109174)) b!1102289))

(assert (= (and b!1102291 res!735170) b!1102288))

(assert (= (or b!1102288 b!1102289) bm!46194))

(assert (=> b!1102290 m!1022627))

(assert (=> b!1102290 m!1022627))

(assert (=> b!1102290 m!1022629))

(assert (=> b!1102291 m!1022627))

(declare-fun m!1022793 () Bool)

(assert (=> b!1102291 m!1022793))

(declare-fun m!1022795 () Bool)

(assert (=> b!1102291 m!1022795))

(assert (=> b!1102291 m!1022627))

(declare-fun m!1022797 () Bool)

(assert (=> b!1102291 m!1022797))

(declare-fun m!1022799 () Bool)

(assert (=> bm!46194 m!1022799))

(assert (=> b!1102019 d!131083))

(declare-fun d!131085 () Bool)

(assert (=> d!131085 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96996 d!131085))

(declare-fun d!131087 () Bool)

(assert (=> d!131087 (= (array_inv!26476 _keys!1070) (bvsge (size!34877 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96996 d!131087))

(declare-fun d!131089 () Bool)

(assert (=> d!131089 (= (array_inv!26477 _values!874) (bvsge (size!34878 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96996 d!131089))

(declare-fun b!1102292 () Bool)

(declare-fun e!629253 () Bool)

(declare-fun call!46198 () Bool)

(assert (=> b!1102292 (= e!629253 call!46198)))

(declare-fun b!1102293 () Bool)

(declare-fun e!629255 () Bool)

(assert (=> b!1102293 (= e!629255 call!46198)))

(declare-fun b!1102294 () Bool)

(declare-fun e!629254 () Bool)

(assert (=> b!1102294 (= e!629254 e!629255)))

(declare-fun c!109175 () Bool)

(assert (=> b!1102294 (= c!109175 (validKeyInArray!0 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(declare-fun b!1102295 () Bool)

(assert (=> b!1102295 (= e!629255 e!629253)))

(declare-fun lt!493996 () (_ BitVec 64))

(assert (=> b!1102295 (= lt!493996 (select (arr!34340 lt!493787) #b00000000000000000000000000000000))))

(declare-fun lt!493994 () Unit!36177)

(assert (=> b!1102295 (= lt!493994 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!493787 lt!493996 #b00000000000000000000000000000000))))

(assert (=> b!1102295 (arrayContainsKey!0 lt!493787 lt!493996 #b00000000000000000000000000000000)))

(declare-fun lt!493995 () Unit!36177)

(assert (=> b!1102295 (= lt!493995 lt!493994)))

(declare-fun res!735172 () Bool)

(assert (=> b!1102295 (= res!735172 (= (seekEntryOrOpen!0 (select (arr!34340 lt!493787) #b00000000000000000000000000000000) lt!493787 mask!1414) (Found!9869 #b00000000000000000000000000000000)))))

(assert (=> b!1102295 (=> (not res!735172) (not e!629253))))

(declare-fun d!131091 () Bool)

(declare-fun res!735173 () Bool)

(assert (=> d!131091 (=> res!735173 e!629254)))

(assert (=> d!131091 (= res!735173 (bvsge #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(assert (=> d!131091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493787 mask!1414) e!629254)))

(declare-fun bm!46195 () Bool)

(assert (=> bm!46195 (= call!46198 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!493787 mask!1414))))

(assert (= (and d!131091 (not res!735173)) b!1102294))

(assert (= (and b!1102294 c!109175) b!1102295))

(assert (= (and b!1102294 (not c!109175)) b!1102293))

(assert (= (and b!1102295 res!735172) b!1102292))

(assert (= (or b!1102292 b!1102293) bm!46195))

(assert (=> b!1102294 m!1022691))

(assert (=> b!1102294 m!1022691))

(assert (=> b!1102294 m!1022699))

(assert (=> b!1102295 m!1022691))

(declare-fun m!1022801 () Bool)

(assert (=> b!1102295 m!1022801))

(declare-fun m!1022803 () Bool)

(assert (=> b!1102295 m!1022803))

(assert (=> b!1102295 m!1022691))

(declare-fun m!1022805 () Bool)

(assert (=> b!1102295 m!1022805))

(declare-fun m!1022807 () Bool)

(assert (=> bm!46195 m!1022807))

(assert (=> b!1102023 d!131091))

(declare-fun d!131093 () Bool)

(assert (=> d!131093 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102018 d!131093))

(declare-fun b!1102296 () Bool)

(declare-fun e!629258 () Bool)

(declare-fun e!629257 () Bool)

(assert (=> b!1102296 (= e!629258 e!629257)))

(declare-fun res!735176 () Bool)

(assert (=> b!1102296 (=> (not res!735176) (not e!629257))))

(declare-fun e!629259 () Bool)

(assert (=> b!1102296 (= res!735176 (not e!629259))))

(declare-fun res!735175 () Bool)

(assert (=> b!1102296 (=> (not res!735175) (not e!629259))))

(assert (=> b!1102296 (= res!735175 (validKeyInArray!0 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(declare-fun b!1102297 () Bool)

(assert (=> b!1102297 (= e!629259 (contains!6424 Nil!23997 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(declare-fun b!1102298 () Bool)

(declare-fun e!629256 () Bool)

(declare-fun call!46199 () Bool)

(assert (=> b!1102298 (= e!629256 call!46199)))

(declare-fun b!1102299 () Bool)

(assert (=> b!1102299 (= e!629257 e!629256)))

(declare-fun c!109176 () Bool)

(assert (=> b!1102299 (= c!109176 (validKeyInArray!0 (select (arr!34340 lt!493787) #b00000000000000000000000000000000)))))

(declare-fun d!131095 () Bool)

(declare-fun res!735174 () Bool)

(assert (=> d!131095 (=> res!735174 e!629258)))

(assert (=> d!131095 (= res!735174 (bvsge #b00000000000000000000000000000000 (size!34877 lt!493787)))))

(assert (=> d!131095 (= (arrayNoDuplicates!0 lt!493787 #b00000000000000000000000000000000 Nil!23997) e!629258)))

(declare-fun b!1102300 () Bool)

(assert (=> b!1102300 (= e!629256 call!46199)))

(declare-fun bm!46196 () Bool)

(assert (=> bm!46196 (= call!46199 (arrayNoDuplicates!0 lt!493787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109176 (Cons!23996 (select (arr!34340 lt!493787) #b00000000000000000000000000000000) Nil!23997) Nil!23997)))))

(assert (= (and d!131095 (not res!735174)) b!1102296))

(assert (= (and b!1102296 res!735175) b!1102297))

(assert (= (and b!1102296 res!735176) b!1102299))

(assert (= (and b!1102299 c!109176) b!1102298))

(assert (= (and b!1102299 (not c!109176)) b!1102300))

(assert (= (or b!1102298 b!1102300) bm!46196))

(assert (=> b!1102296 m!1022691))

(assert (=> b!1102296 m!1022691))

(assert (=> b!1102296 m!1022699))

(assert (=> b!1102297 m!1022691))

(assert (=> b!1102297 m!1022691))

(declare-fun m!1022809 () Bool)

(assert (=> b!1102297 m!1022809))

(assert (=> b!1102299 m!1022691))

(assert (=> b!1102299 m!1022691))

(assert (=> b!1102299 m!1022699))

(assert (=> bm!46196 m!1022691))

(declare-fun m!1022811 () Bool)

(assert (=> bm!46196 m!1022811))

(assert (=> b!1102027 d!131095))

(declare-fun mapIsEmpty!42598 () Bool)

(declare-fun mapRes!42598 () Bool)

(assert (=> mapIsEmpty!42598 mapRes!42598))

(declare-fun condMapEmpty!42598 () Bool)

(declare-fun mapDefault!42598 () ValueCell!12893)

(assert (=> mapNonEmpty!42589 (= condMapEmpty!42598 (= mapRest!42589 ((as const (Array (_ BitVec 32) ValueCell!12893)) mapDefault!42598)))))

(declare-fun e!629264 () Bool)

(assert (=> mapNonEmpty!42589 (= tp!81413 (and e!629264 mapRes!42598))))

(declare-fun b!1102308 () Bool)

(assert (=> b!1102308 (= e!629264 tp_is_empty!27205)))

(declare-fun b!1102307 () Bool)

(declare-fun e!629265 () Bool)

(assert (=> b!1102307 (= e!629265 tp_is_empty!27205)))

(declare-fun mapNonEmpty!42598 () Bool)

(declare-fun tp!81428 () Bool)

(assert (=> mapNonEmpty!42598 (= mapRes!42598 (and tp!81428 e!629265))))

(declare-fun mapRest!42598 () (Array (_ BitVec 32) ValueCell!12893))

(declare-fun mapKey!42598 () (_ BitVec 32))

(declare-fun mapValue!42598 () ValueCell!12893)

(assert (=> mapNonEmpty!42598 (= mapRest!42589 (store mapRest!42598 mapKey!42598 mapValue!42598))))

(assert (= (and mapNonEmpty!42589 condMapEmpty!42598) mapIsEmpty!42598))

(assert (= (and mapNonEmpty!42589 (not condMapEmpty!42598)) mapNonEmpty!42598))

(assert (= (and mapNonEmpty!42598 ((_ is ValueCellFull!12893) mapValue!42598)) b!1102307))

(assert (= (and mapNonEmpty!42589 ((_ is ValueCellFull!12893) mapDefault!42598)) b!1102308))

(declare-fun m!1022813 () Bool)

(assert (=> mapNonEmpty!42598 m!1022813))

(declare-fun b_lambda!18055 () Bool)

(assert (= b_lambda!18043 (or (and start!96996 b_free!23155) b_lambda!18055)))

(declare-fun b_lambda!18057 () Bool)

(assert (= b_lambda!18041 (or (and start!96996 b_free!23155) b_lambda!18057)))

(declare-fun b_lambda!18059 () Bool)

(assert (= b_lambda!18045 (or (and start!96996 b_free!23155) b_lambda!18059)))

(declare-fun b_lambda!18061 () Bool)

(assert (= b_lambda!18047 (or (and start!96996 b_free!23155) b_lambda!18061)))

(declare-fun b_lambda!18063 () Bool)

(assert (= b_lambda!18053 (or (and start!96996 b_free!23155) b_lambda!18063)))

(declare-fun b_lambda!18065 () Bool)

(assert (= b_lambda!18051 (or (and start!96996 b_free!23155) b_lambda!18065)))

(declare-fun b_lambda!18067 () Bool)

(assert (= b_lambda!18049 (or (and start!96996 b_free!23155) b_lambda!18067)))

(check-sat (not b_lambda!18061) (not b_lambda!18065) (not b!1102290) (not b!1102268) (not b!1102226) (not d!131073) (not bm!46182) (not bm!46190) (not b!1102276) (not bm!46196) tp_is_empty!27205 (not b!1102294) (not b!1102291) (not bm!46179) (not b!1102238) (not b!1102274) (not b!1102248) (not b!1102247) (not b!1102228) (not b_lambda!18067) (not b!1102256) (not b!1102279) (not bm!46194) (not bm!46195) (not b!1102187) (not b_lambda!18059) (not bm!46169) b_and!37105 (not b!1102231) (not b_lambda!18063) (not b!1102265) (not b!1102190) (not b!1102270) (not b!1102117) (not b!1102296) (not d!131075) (not b!1102241) (not b!1102195) (not b!1102232) (not b!1102236) (not d!131069) (not bm!46172) (not b!1102297) (not bm!46153) (not b!1102257) (not b!1102237) (not d!131071) (not b!1102295) (not b_next!23155) (not d!131063) (not b!1102116) (not b!1102184) (not bm!46168) (not d!131081) (not b!1102244) (not b!1102275) (not b!1102233) (not b!1102129) (not b_lambda!18057) (not b_lambda!18039) (not b!1102252) (not b!1102128) (not bm!46178) (not bm!46173) (not b!1102199) (not b!1102234) (not b!1102191) (not b!1102273) (not b!1102131) (not d!131079) (not b!1102299) (not bm!46183) (not b!1102200) (not b!1102278) (not bm!46177) (not d!131077) (not bm!46189) (not mapNonEmpty!42598) (not b!1102181) (not b!1102138) (not b_lambda!18055) (not bm!46191))
(check-sat b_and!37105 (not b_next!23155))
