; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96748 () Bool)

(assert start!96748)

(declare-fun b_free!23149 () Bool)

(declare-fun b_next!23149 () Bool)

(assert (=> start!96748 (= b_free!23149 (not b_next!23149))))

(declare-fun tp!81394 () Bool)

(declare-fun b_and!37033 () Bool)

(assert (=> start!96748 (= tp!81394 b_and!37033)))

(declare-fun b!1100405 () Bool)

(declare-fun res!734332 () Bool)

(declare-fun e!628071 () Bool)

(assert (=> b!1100405 (=> (not res!734332) (not e!628071))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71222 0))(
  ( (array!71223 (arr!34276 (Array (_ BitVec 32) (_ BitVec 64))) (size!34814 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71222)

(assert (=> b!1100405 (= res!734332 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34814 _keys!1070))))))

(declare-fun mapNonEmpty!42580 () Bool)

(declare-fun mapRes!42580 () Bool)

(declare-fun tp!81395 () Bool)

(declare-fun e!628070 () Bool)

(assert (=> mapNonEmpty!42580 (= mapRes!42580 (and tp!81395 e!628070))))

(declare-datatypes ((V!41393 0))(
  ( (V!41394 (val!13656 Int)) )
))
(declare-datatypes ((ValueCell!12890 0))(
  ( (ValueCellFull!12890 (v!16283 V!41393)) (EmptyCell!12890) )
))
(declare-datatypes ((array!71224 0))(
  ( (array!71225 (arr!34277 (Array (_ BitVec 32) ValueCell!12890)) (size!34815 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71224)

(declare-fun mapValue!42580 () ValueCell!12890)

(declare-fun mapKey!42580 () (_ BitVec 32))

(declare-fun mapRest!42580 () (Array (_ BitVec 32) ValueCell!12890))

(assert (=> mapNonEmpty!42580 (= (arr!34277 _values!874) (store mapRest!42580 mapKey!42580 mapValue!42580))))

(declare-fun b!1100406 () Bool)

(declare-fun res!734339 () Bool)

(assert (=> b!1100406 (=> (not res!734339) (not e!628071))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1100406 (= res!734339 (= (select (arr!34276 _keys!1070) i!650) k0!904))))

(declare-fun b!1100407 () Bool)

(declare-fun res!734341 () Bool)

(declare-fun e!628074 () Bool)

(assert (=> b!1100407 (=> (not res!734341) (not e!628074))))

(declare-fun lt!492964 () array!71222)

(declare-datatypes ((List!24012 0))(
  ( (Nil!24009) (Cons!24008 (h!25217 (_ BitVec 64)) (t!34198 List!24012)) )
))
(declare-fun arrayNoDuplicates!0 (array!71222 (_ BitVec 32) List!24012) Bool)

(assert (=> b!1100407 (= res!734341 (arrayNoDuplicates!0 lt!492964 #b00000000000000000000000000000000 Nil!24009))))

(declare-fun b!1100408 () Bool)

(declare-fun res!734338 () Bool)

(assert (=> b!1100408 (=> (not res!734338) (not e!628071))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100408 (= res!734338 (and (= (size!34815 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34814 _keys!1070) (size!34815 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100409 () Bool)

(declare-fun e!628077 () Bool)

(declare-fun tp_is_empty!27199 () Bool)

(assert (=> b!1100409 (= e!628077 tp_is_empty!27199)))

(declare-fun b!1100410 () Bool)

(assert (=> b!1100410 (= e!628071 e!628074)))

(declare-fun res!734342 () Bool)

(assert (=> b!1100410 (=> (not res!734342) (not e!628074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71222 (_ BitVec 32)) Bool)

(assert (=> b!1100410 (= res!734342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492964 mask!1414))))

(assert (=> b!1100410 (= lt!492964 (array!71223 (store (arr!34276 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34814 _keys!1070)))))

(declare-fun b!1100411 () Bool)

(assert (=> b!1100411 (= e!628070 tp_is_empty!27199)))

(declare-fun b!1100412 () Bool)

(declare-fun res!734334 () Bool)

(assert (=> b!1100412 (=> (not res!734334) (not e!628071))))

(assert (=> b!1100412 (= res!734334 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24009))))

(declare-fun b!1100413 () Bool)

(declare-fun res!734333 () Bool)

(assert (=> b!1100413 (=> (not res!734333) (not e!628071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100413 (= res!734333 (validKeyInArray!0 k0!904))))

(declare-fun b!1100414 () Bool)

(declare-fun e!628073 () Bool)

(assert (=> b!1100414 (= e!628074 (not e!628073))))

(declare-fun res!734337 () Bool)

(assert (=> b!1100414 (=> res!734337 e!628073)))

(assert (=> b!1100414 (= res!734337 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17420 0))(
  ( (tuple2!17421 (_1!8721 (_ BitVec 64)) (_2!8721 V!41393)) )
))
(declare-datatypes ((List!24013 0))(
  ( (Nil!24010) (Cons!24009 (h!25218 tuple2!17420) (t!34199 List!24013)) )
))
(declare-datatypes ((ListLongMap!15389 0))(
  ( (ListLongMap!15390 (toList!7710 List!24013)) )
))
(declare-fun lt!492963 () ListLongMap!15389)

(declare-fun minValue!831 () V!41393)

(declare-fun zeroValue!831 () V!41393)

(declare-fun getCurrentListMap!4327 (array!71222 array!71224 (_ BitVec 32) (_ BitVec 32) V!41393 V!41393 (_ BitVec 32) Int) ListLongMap!15389)

(assert (=> b!1100414 (= lt!492963 (getCurrentListMap!4327 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492969 () array!71224)

(declare-fun lt!492972 () ListLongMap!15389)

(assert (=> b!1100414 (= lt!492972 (getCurrentListMap!4327 lt!492964 lt!492969 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492968 () ListLongMap!15389)

(declare-fun lt!492965 () ListLongMap!15389)

(assert (=> b!1100414 (and (= lt!492968 lt!492965) (= lt!492965 lt!492968))))

(declare-fun lt!492970 () ListLongMap!15389)

(declare-fun -!942 (ListLongMap!15389 (_ BitVec 64)) ListLongMap!15389)

(assert (=> b!1100414 (= lt!492965 (-!942 lt!492970 k0!904))))

(declare-datatypes ((Unit!36005 0))(
  ( (Unit!36006) )
))
(declare-fun lt!492961 () Unit!36005)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!216 (array!71222 array!71224 (_ BitVec 32) (_ BitVec 32) V!41393 V!41393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36005)

(assert (=> b!1100414 (= lt!492961 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4234 (array!71222 array!71224 (_ BitVec 32) (_ BitVec 32) V!41393 V!41393 (_ BitVec 32) Int) ListLongMap!15389)

(assert (=> b!1100414 (= lt!492968 (getCurrentListMapNoExtraKeys!4234 lt!492964 lt!492969 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2303 (Int (_ BitVec 64)) V!41393)

(assert (=> b!1100414 (= lt!492969 (array!71225 (store (arr!34277 _values!874) i!650 (ValueCellFull!12890 (dynLambda!2303 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34815 _values!874)))))

(assert (=> b!1100414 (= lt!492970 (getCurrentListMapNoExtraKeys!4234 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100414 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492962 () Unit!36005)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71222 (_ BitVec 64) (_ BitVec 32)) Unit!36005)

(assert (=> b!1100414 (= lt!492962 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42580 () Bool)

(assert (=> mapIsEmpty!42580 mapRes!42580))

(declare-fun res!734336 () Bool)

(assert (=> start!96748 (=> (not res!734336) (not e!628071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96748 (= res!734336 (validMask!0 mask!1414))))

(assert (=> start!96748 e!628071))

(assert (=> start!96748 tp!81394))

(assert (=> start!96748 true))

(assert (=> start!96748 tp_is_empty!27199))

(declare-fun array_inv!26432 (array!71222) Bool)

(assert (=> start!96748 (array_inv!26432 _keys!1070)))

(declare-fun e!628072 () Bool)

(declare-fun array_inv!26433 (array!71224) Bool)

(assert (=> start!96748 (and (array_inv!26433 _values!874) e!628072)))

(declare-fun b!1100415 () Bool)

(assert (=> b!1100415 (= e!628072 (and e!628077 mapRes!42580))))

(declare-fun condMapEmpty!42580 () Bool)

(declare-fun mapDefault!42580 () ValueCell!12890)

(assert (=> b!1100415 (= condMapEmpty!42580 (= (arr!34277 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12890)) mapDefault!42580)))))

(declare-fun e!628076 () Bool)

(declare-fun b!1100416 () Bool)

(assert (=> b!1100416 (= e!628076 (= (-!942 lt!492963 k0!904) lt!492972))))

(declare-fun lt!492966 () ListLongMap!15389)

(declare-fun lt!492967 () ListLongMap!15389)

(assert (=> b!1100416 (= (-!942 lt!492966 k0!904) lt!492967)))

(declare-fun lt!492973 () Unit!36005)

(declare-fun addRemoveCommutativeForDiffKeys!129 (ListLongMap!15389 (_ BitVec 64) V!41393 (_ BitVec 64)) Unit!36005)

(assert (=> b!1100416 (= lt!492973 (addRemoveCommutativeForDiffKeys!129 lt!492970 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1100417 () Bool)

(assert (=> b!1100417 (= e!628073 e!628076)))

(declare-fun res!734340 () Bool)

(assert (=> b!1100417 (=> res!734340 e!628076)))

(assert (=> b!1100417 (= res!734340 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1100417 (= lt!492972 lt!492967)))

(declare-fun lt!492971 () tuple2!17420)

(declare-fun +!3421 (ListLongMap!15389 tuple2!17420) ListLongMap!15389)

(assert (=> b!1100417 (= lt!492967 (+!3421 lt!492965 lt!492971))))

(assert (=> b!1100417 (= lt!492963 lt!492966)))

(assert (=> b!1100417 (= lt!492966 (+!3421 lt!492970 lt!492971))))

(assert (=> b!1100417 (= lt!492972 (+!3421 lt!492968 lt!492971))))

(assert (=> b!1100417 (= lt!492971 (tuple2!17421 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100418 () Bool)

(declare-fun res!734335 () Bool)

(assert (=> b!1100418 (=> (not res!734335) (not e!628071))))

(assert (=> b!1100418 (= res!734335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96748 res!734336) b!1100408))

(assert (= (and b!1100408 res!734338) b!1100418))

(assert (= (and b!1100418 res!734335) b!1100412))

(assert (= (and b!1100412 res!734334) b!1100405))

(assert (= (and b!1100405 res!734332) b!1100413))

(assert (= (and b!1100413 res!734333) b!1100406))

(assert (= (and b!1100406 res!734339) b!1100410))

(assert (= (and b!1100410 res!734342) b!1100407))

(assert (= (and b!1100407 res!734341) b!1100414))

(assert (= (and b!1100414 (not res!734337)) b!1100417))

(assert (= (and b!1100417 (not res!734340)) b!1100416))

(assert (= (and b!1100415 condMapEmpty!42580) mapIsEmpty!42580))

(assert (= (and b!1100415 (not condMapEmpty!42580)) mapNonEmpty!42580))

(get-info :version)

(assert (= (and mapNonEmpty!42580 ((_ is ValueCellFull!12890) mapValue!42580)) b!1100411))

(assert (= (and b!1100415 ((_ is ValueCellFull!12890) mapDefault!42580)) b!1100409))

(assert (= start!96748 b!1100415))

(declare-fun b_lambda!17995 () Bool)

(assert (=> (not b_lambda!17995) (not b!1100414)))

(declare-fun t!34197 () Bool)

(declare-fun tb!8007 () Bool)

(assert (=> (and start!96748 (= defaultEntry!882 defaultEntry!882) t!34197) tb!8007))

(declare-fun result!16559 () Bool)

(assert (=> tb!8007 (= result!16559 tp_is_empty!27199)))

(assert (=> b!1100414 t!34197))

(declare-fun b_and!37035 () Bool)

(assert (= b_and!37033 (and (=> t!34197 result!16559) b_and!37035)))

(declare-fun m!1020023 () Bool)

(assert (=> b!1100407 m!1020023))

(declare-fun m!1020025 () Bool)

(assert (=> b!1100417 m!1020025))

(declare-fun m!1020027 () Bool)

(assert (=> b!1100417 m!1020027))

(declare-fun m!1020029 () Bool)

(assert (=> b!1100417 m!1020029))

(declare-fun m!1020031 () Bool)

(assert (=> b!1100413 m!1020031))

(declare-fun m!1020033 () Bool)

(assert (=> b!1100412 m!1020033))

(declare-fun m!1020035 () Bool)

(assert (=> b!1100418 m!1020035))

(declare-fun m!1020037 () Bool)

(assert (=> mapNonEmpty!42580 m!1020037))

(declare-fun m!1020039 () Bool)

(assert (=> b!1100406 m!1020039))

(declare-fun m!1020041 () Bool)

(assert (=> b!1100416 m!1020041))

(declare-fun m!1020043 () Bool)

(assert (=> b!1100416 m!1020043))

(declare-fun m!1020045 () Bool)

(assert (=> b!1100416 m!1020045))

(declare-fun m!1020047 () Bool)

(assert (=> b!1100410 m!1020047))

(declare-fun m!1020049 () Bool)

(assert (=> b!1100410 m!1020049))

(declare-fun m!1020051 () Bool)

(assert (=> start!96748 m!1020051))

(declare-fun m!1020053 () Bool)

(assert (=> start!96748 m!1020053))

(declare-fun m!1020055 () Bool)

(assert (=> start!96748 m!1020055))

(declare-fun m!1020057 () Bool)

(assert (=> b!1100414 m!1020057))

(declare-fun m!1020059 () Bool)

(assert (=> b!1100414 m!1020059))

(declare-fun m!1020061 () Bool)

(assert (=> b!1100414 m!1020061))

(declare-fun m!1020063 () Bool)

(assert (=> b!1100414 m!1020063))

(declare-fun m!1020065 () Bool)

(assert (=> b!1100414 m!1020065))

(declare-fun m!1020067 () Bool)

(assert (=> b!1100414 m!1020067))

(declare-fun m!1020069 () Bool)

(assert (=> b!1100414 m!1020069))

(declare-fun m!1020071 () Bool)

(assert (=> b!1100414 m!1020071))

(declare-fun m!1020073 () Bool)

(assert (=> b!1100414 m!1020073))

(declare-fun m!1020075 () Bool)

(assert (=> b!1100414 m!1020075))

(check-sat (not b!1100416) tp_is_empty!27199 (not b_next!23149) b_and!37035 (not b!1100412) (not b!1100413) (not mapNonEmpty!42580) (not b!1100407) (not b!1100417) (not b_lambda!17995) (not b!1100410) (not start!96748) (not b!1100414) (not b!1100418))
(check-sat b_and!37035 (not b_next!23149))
