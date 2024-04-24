; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96864 () Bool)

(assert start!96864)

(declare-fun b_free!23101 () Bool)

(declare-fun b_next!23101 () Bool)

(assert (=> start!96864 (= b_free!23101 (not b_next!23101))))

(declare-fun tp!81242 () Bool)

(declare-fun b_and!36931 () Bool)

(assert (=> start!96864 (= tp!81242 b_and!36931)))

(declare-fun b!1100241 () Bool)

(declare-fun res!733878 () Bool)

(declare-fun e!628075 () Bool)

(assert (=> b!1100241 (=> (not res!733878) (not e!628075))))

(declare-datatypes ((array!71251 0))(
  ( (array!71252 (arr!34287 (Array (_ BitVec 32) (_ BitVec 64))) (size!34824 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71251)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71251 (_ BitVec 32)) Bool)

(assert (=> b!1100241 (= res!733878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100242 () Bool)

(declare-fun res!733876 () Bool)

(assert (=> b!1100242 (=> (not res!733876) (not e!628075))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100242 (= res!733876 (validKeyInArray!0 k0!904))))

(declare-fun res!733881 () Bool)

(assert (=> start!96864 (=> (not res!733881) (not e!628075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96864 (= res!733881 (validMask!0 mask!1414))))

(assert (=> start!96864 e!628075))

(assert (=> start!96864 tp!81242))

(assert (=> start!96864 true))

(declare-fun tp_is_empty!27151 () Bool)

(assert (=> start!96864 tp_is_empty!27151))

(declare-fun array_inv!26438 (array!71251) Bool)

(assert (=> start!96864 (array_inv!26438 _keys!1070)))

(declare-datatypes ((V!41329 0))(
  ( (V!41330 (val!13632 Int)) )
))
(declare-datatypes ((ValueCell!12866 0))(
  ( (ValueCellFull!12866 (v!16253 V!41329)) (EmptyCell!12866) )
))
(declare-datatypes ((array!71253 0))(
  ( (array!71254 (arr!34288 (Array (_ BitVec 32) ValueCell!12866)) (size!34825 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71253)

(declare-fun e!628076 () Bool)

(declare-fun array_inv!26439 (array!71253) Bool)

(assert (=> start!96864 (and (array_inv!26439 _values!874) e!628076)))

(declare-fun b!1100243 () Bool)

(declare-fun e!628070 () Bool)

(declare-fun mapRes!42499 () Bool)

(assert (=> b!1100243 (= e!628076 (and e!628070 mapRes!42499))))

(declare-fun condMapEmpty!42499 () Bool)

(declare-fun mapDefault!42499 () ValueCell!12866)

(assert (=> b!1100243 (= condMapEmpty!42499 (= (arr!34288 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12866)) mapDefault!42499)))))

(declare-fun b!1100244 () Bool)

(declare-fun res!733879 () Bool)

(assert (=> b!1100244 (=> (not res!733879) (not e!628075))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100244 (= res!733879 (and (= (size!34825 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34824 _keys!1070) (size!34825 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42499 () Bool)

(assert (=> mapIsEmpty!42499 mapRes!42499))

(declare-fun b!1100245 () Bool)

(assert (=> b!1100245 (= e!628070 tp_is_empty!27151)))

(declare-fun b!1100246 () Bool)

(declare-fun e!628072 () Bool)

(declare-fun e!628077 () Bool)

(assert (=> b!1100246 (= e!628072 (not e!628077))))

(declare-fun res!733877 () Bool)

(assert (=> b!1100246 (=> res!733877 e!628077)))

(assert (=> b!1100246 (= res!733877 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41329)

(declare-datatypes ((tuple2!17334 0))(
  ( (tuple2!17335 (_1!8678 (_ BitVec 64)) (_2!8678 V!41329)) )
))
(declare-datatypes ((List!23956 0))(
  ( (Nil!23953) (Cons!23952 (h!25170 tuple2!17334) (t!34095 List!23956)) )
))
(declare-datatypes ((ListLongMap!15311 0))(
  ( (ListLongMap!15312 (toList!7671 List!23956)) )
))
(declare-fun lt!492347 () ListLongMap!15311)

(declare-fun minValue!831 () V!41329)

(declare-fun getCurrentListMap!4380 (array!71251 array!71253 (_ BitVec 32) (_ BitVec 32) V!41329 V!41329 (_ BitVec 32) Int) ListLongMap!15311)

(assert (=> b!1100246 (= lt!492347 (getCurrentListMap!4380 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492349 () array!71251)

(declare-fun lt!492345 () ListLongMap!15311)

(declare-fun lt!492339 () array!71253)

(assert (=> b!1100246 (= lt!492345 (getCurrentListMap!4380 lt!492349 lt!492339 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492337 () ListLongMap!15311)

(declare-fun lt!492348 () ListLongMap!15311)

(assert (=> b!1100246 (and (= lt!492337 lt!492348) (= lt!492348 lt!492337))))

(declare-fun lt!492341 () ListLongMap!15311)

(declare-fun -!943 (ListLongMap!15311 (_ BitVec 64)) ListLongMap!15311)

(assert (=> b!1100246 (= lt!492348 (-!943 lt!492341 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36133 0))(
  ( (Unit!36134) )
))
(declare-fun lt!492350 () Unit!36133)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!214 (array!71251 array!71253 (_ BitVec 32) (_ BitVec 32) V!41329 V!41329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36133)

(assert (=> b!1100246 (= lt!492350 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!214 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4221 (array!71251 array!71253 (_ BitVec 32) (_ BitVec 32) V!41329 V!41329 (_ BitVec 32) Int) ListLongMap!15311)

(assert (=> b!1100246 (= lt!492337 (getCurrentListMapNoExtraKeys!4221 lt!492349 lt!492339 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2339 (Int (_ BitVec 64)) V!41329)

(assert (=> b!1100246 (= lt!492339 (array!71254 (store (arr!34288 _values!874) i!650 (ValueCellFull!12866 (dynLambda!2339 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34825 _values!874)))))

(assert (=> b!1100246 (= lt!492341 (getCurrentListMapNoExtraKeys!4221 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100246 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492338 () Unit!36133)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71251 (_ BitVec 64) (_ BitVec 32)) Unit!36133)

(assert (=> b!1100246 (= lt!492338 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100247 () Bool)

(declare-fun e!628073 () Bool)

(assert (=> b!1100247 (= e!628073 tp_is_empty!27151)))

(declare-fun b!1100248 () Bool)

(declare-fun res!733880 () Bool)

(assert (=> b!1100248 (=> (not res!733880) (not e!628075))))

(assert (=> b!1100248 (= res!733880 (= (select (arr!34287 _keys!1070) i!650) k0!904))))

(declare-fun b!1100249 () Bool)

(declare-fun res!733873 () Bool)

(assert (=> b!1100249 (=> (not res!733873) (not e!628075))))

(declare-datatypes ((List!23957 0))(
  ( (Nil!23954) (Cons!23953 (h!25171 (_ BitVec 64)) (t!34096 List!23957)) )
))
(declare-fun arrayNoDuplicates!0 (array!71251 (_ BitVec 32) List!23957) Bool)

(assert (=> b!1100249 (= res!733873 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23954))))

(declare-fun b!1100250 () Bool)

(declare-fun e!628071 () Bool)

(assert (=> b!1100250 (= e!628077 e!628071)))

(declare-fun res!733883 () Bool)

(assert (=> b!1100250 (=> res!733883 e!628071)))

(assert (=> b!1100250 (= res!733883 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!492343 () ListLongMap!15311)

(declare-fun lt!492344 () ListLongMap!15311)

(assert (=> b!1100250 (= lt!492343 lt!492344)))

(declare-fun lt!492336 () ListLongMap!15311)

(assert (=> b!1100250 (= lt!492343 (-!943 lt!492336 k0!904))))

(declare-fun lt!492335 () Unit!36133)

(declare-fun addRemoveCommutativeForDiffKeys!122 (ListLongMap!15311 (_ BitVec 64) V!41329 (_ BitVec 64)) Unit!36133)

(assert (=> b!1100250 (= lt!492335 (addRemoveCommutativeForDiffKeys!122 lt!492341 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!492340 () tuple2!17334)

(declare-fun +!3405 (ListLongMap!15311 tuple2!17334) ListLongMap!15311)

(assert (=> b!1100250 (= lt!492345 (+!3405 lt!492344 lt!492340))))

(declare-fun lt!492334 () tuple2!17334)

(assert (=> b!1100250 (= lt!492344 (+!3405 lt!492348 lt!492334))))

(declare-fun lt!492342 () ListLongMap!15311)

(assert (=> b!1100250 (= lt!492347 lt!492342)))

(assert (=> b!1100250 (= lt!492342 (+!3405 lt!492336 lt!492340))))

(assert (=> b!1100250 (= lt!492336 (+!3405 lt!492341 lt!492334))))

(assert (=> b!1100250 (= lt!492345 (+!3405 (+!3405 lt!492337 lt!492334) lt!492340))))

(assert (=> b!1100250 (= lt!492340 (tuple2!17335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1100250 (= lt!492334 (tuple2!17335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100251 () Bool)

(assert (=> b!1100251 (= e!628075 e!628072)))

(declare-fun res!733875 () Bool)

(assert (=> b!1100251 (=> (not res!733875) (not e!628072))))

(assert (=> b!1100251 (= res!733875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492349 mask!1414))))

(assert (=> b!1100251 (= lt!492349 (array!71252 (store (arr!34287 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34824 _keys!1070)))))

(declare-fun b!1100252 () Bool)

(declare-fun res!733882 () Bool)

(assert (=> b!1100252 (=> (not res!733882) (not e!628075))))

(assert (=> b!1100252 (= res!733882 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34824 _keys!1070))))))

(declare-fun b!1100253 () Bool)

(assert (=> b!1100253 (= e!628071 (bvslt i!650 (size!34825 _values!874)))))

(assert (=> b!1100253 (= (-!943 lt!492342 k0!904) (+!3405 lt!492343 lt!492340))))

(declare-fun lt!492346 () Unit!36133)

(assert (=> b!1100253 (= lt!492346 (addRemoveCommutativeForDiffKeys!122 lt!492336 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1100254 () Bool)

(declare-fun res!733874 () Bool)

(assert (=> b!1100254 (=> (not res!733874) (not e!628072))))

(assert (=> b!1100254 (= res!733874 (arrayNoDuplicates!0 lt!492349 #b00000000000000000000000000000000 Nil!23954))))

(declare-fun mapNonEmpty!42499 () Bool)

(declare-fun tp!81241 () Bool)

(assert (=> mapNonEmpty!42499 (= mapRes!42499 (and tp!81241 e!628073))))

(declare-fun mapValue!42499 () ValueCell!12866)

(declare-fun mapKey!42499 () (_ BitVec 32))

(declare-fun mapRest!42499 () (Array (_ BitVec 32) ValueCell!12866))

(assert (=> mapNonEmpty!42499 (= (arr!34288 _values!874) (store mapRest!42499 mapKey!42499 mapValue!42499))))

(assert (= (and start!96864 res!733881) b!1100244))

(assert (= (and b!1100244 res!733879) b!1100241))

(assert (= (and b!1100241 res!733878) b!1100249))

(assert (= (and b!1100249 res!733873) b!1100252))

(assert (= (and b!1100252 res!733882) b!1100242))

(assert (= (and b!1100242 res!733876) b!1100248))

(assert (= (and b!1100248 res!733880) b!1100251))

(assert (= (and b!1100251 res!733875) b!1100254))

(assert (= (and b!1100254 res!733874) b!1100246))

(assert (= (and b!1100246 (not res!733877)) b!1100250))

(assert (= (and b!1100250 (not res!733883)) b!1100253))

(assert (= (and b!1100243 condMapEmpty!42499) mapIsEmpty!42499))

(assert (= (and b!1100243 (not condMapEmpty!42499)) mapNonEmpty!42499))

(get-info :version)

(assert (= (and mapNonEmpty!42499 ((_ is ValueCellFull!12866) mapValue!42499)) b!1100247))

(assert (= (and b!1100243 ((_ is ValueCellFull!12866) mapDefault!42499)) b!1100245))

(assert (= start!96864 b!1100243))

(declare-fun b_lambda!17889 () Bool)

(assert (=> (not b_lambda!17889) (not b!1100246)))

(declare-fun t!34094 () Bool)

(declare-fun tb!7959 () Bool)

(assert (=> (and start!96864 (= defaultEntry!882 defaultEntry!882) t!34094) tb!7959))

(declare-fun result!16457 () Bool)

(assert (=> tb!7959 (= result!16457 tp_is_empty!27151)))

(assert (=> b!1100246 t!34094))

(declare-fun b_and!36933 () Bool)

(assert (= b_and!36931 (and (=> t!34094 result!16457) b_and!36933)))

(declare-fun m!1020425 () Bool)

(assert (=> b!1100248 m!1020425))

(declare-fun m!1020427 () Bool)

(assert (=> b!1100241 m!1020427))

(declare-fun m!1020429 () Bool)

(assert (=> mapNonEmpty!42499 m!1020429))

(declare-fun m!1020431 () Bool)

(assert (=> b!1100254 m!1020431))

(declare-fun m!1020433 () Bool)

(assert (=> b!1100246 m!1020433))

(declare-fun m!1020435 () Bool)

(assert (=> b!1100246 m!1020435))

(declare-fun m!1020437 () Bool)

(assert (=> b!1100246 m!1020437))

(declare-fun m!1020439 () Bool)

(assert (=> b!1100246 m!1020439))

(declare-fun m!1020441 () Bool)

(assert (=> b!1100246 m!1020441))

(declare-fun m!1020443 () Bool)

(assert (=> b!1100246 m!1020443))

(declare-fun m!1020445 () Bool)

(assert (=> b!1100246 m!1020445))

(declare-fun m!1020447 () Bool)

(assert (=> b!1100246 m!1020447))

(declare-fun m!1020449 () Bool)

(assert (=> b!1100246 m!1020449))

(declare-fun m!1020451 () Bool)

(assert (=> b!1100246 m!1020451))

(declare-fun m!1020453 () Bool)

(assert (=> b!1100251 m!1020453))

(declare-fun m!1020455 () Bool)

(assert (=> b!1100251 m!1020455))

(declare-fun m!1020457 () Bool)

(assert (=> b!1100253 m!1020457))

(declare-fun m!1020459 () Bool)

(assert (=> b!1100253 m!1020459))

(declare-fun m!1020461 () Bool)

(assert (=> b!1100253 m!1020461))

(declare-fun m!1020463 () Bool)

(assert (=> b!1100242 m!1020463))

(declare-fun m!1020465 () Bool)

(assert (=> b!1100249 m!1020465))

(declare-fun m!1020467 () Bool)

(assert (=> b!1100250 m!1020467))

(declare-fun m!1020469 () Bool)

(assert (=> b!1100250 m!1020469))

(declare-fun m!1020471 () Bool)

(assert (=> b!1100250 m!1020471))

(declare-fun m!1020473 () Bool)

(assert (=> b!1100250 m!1020473))

(declare-fun m!1020475 () Bool)

(assert (=> b!1100250 m!1020475))

(assert (=> b!1100250 m!1020471))

(declare-fun m!1020477 () Bool)

(assert (=> b!1100250 m!1020477))

(declare-fun m!1020479 () Bool)

(assert (=> b!1100250 m!1020479))

(declare-fun m!1020481 () Bool)

(assert (=> b!1100250 m!1020481))

(declare-fun m!1020483 () Bool)

(assert (=> start!96864 m!1020483))

(declare-fun m!1020485 () Bool)

(assert (=> start!96864 m!1020485))

(declare-fun m!1020487 () Bool)

(assert (=> start!96864 m!1020487))

(check-sat (not start!96864) (not b!1100250) b_and!36933 (not b_next!23101) (not b!1100246) (not b_lambda!17889) (not b!1100249) (not b!1100241) (not b!1100242) (not b!1100253) tp_is_empty!27151 (not mapNonEmpty!42499) (not b!1100251) (not b!1100254))
(check-sat b_and!36933 (not b_next!23101))
