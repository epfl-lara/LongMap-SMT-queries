; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96150 () Bool)

(assert start!96150)

(declare-fun b_free!22803 () Bool)

(declare-fun b_next!22803 () Bool)

(assert (=> start!96150 (= b_free!22803 (not b_next!22803))))

(declare-fun tp!80258 () Bool)

(declare-fun b_and!36281 () Bool)

(assert (=> start!96150 (= tp!80258 b_and!36281)))

(declare-fun mapIsEmpty!41962 () Bool)

(declare-fun mapRes!41962 () Bool)

(assert (=> mapIsEmpty!41962 mapRes!41962))

(declare-fun b!1091415 () Bool)

(declare-fun res!728188 () Bool)

(declare-fun e!623324 () Bool)

(assert (=> b!1091415 (=> (not res!728188) (not e!623324))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1091415 (= res!728188 (validKeyInArray!0 k0!904))))

(declare-fun b!1091416 () Bool)

(declare-fun e!623323 () Bool)

(declare-fun tp_is_empty!26805 () Bool)

(assert (=> b!1091416 (= e!623323 tp_is_empty!26805)))

(declare-fun b!1091417 () Bool)

(declare-fun res!728186 () Bool)

(assert (=> b!1091417 (=> (not res!728186) (not e!623324))))

(declare-datatypes ((array!70529 0))(
  ( (array!70530 (arr!33938 (Array (_ BitVec 32) (_ BitVec 64))) (size!34474 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70529)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091417 (= res!728186 (= (select (arr!33938 _keys!1070) i!650) k0!904))))

(declare-fun res!728185 () Bool)

(assert (=> start!96150 (=> (not res!728185) (not e!623324))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96150 (= res!728185 (validMask!0 mask!1414))))

(assert (=> start!96150 e!623324))

(assert (=> start!96150 tp!80258))

(assert (=> start!96150 true))

(assert (=> start!96150 tp_is_empty!26805))

(declare-fun array_inv!26170 (array!70529) Bool)

(assert (=> start!96150 (array_inv!26170 _keys!1070)))

(declare-datatypes ((V!40867 0))(
  ( (V!40868 (val!13459 Int)) )
))
(declare-datatypes ((ValueCell!12693 0))(
  ( (ValueCellFull!12693 (v!16080 V!40867)) (EmptyCell!12693) )
))
(declare-datatypes ((array!70531 0))(
  ( (array!70532 (arr!33939 (Array (_ BitVec 32) ValueCell!12693)) (size!34475 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70531)

(declare-fun e!623326 () Bool)

(declare-fun array_inv!26171 (array!70531) Bool)

(assert (=> start!96150 (and (array_inv!26171 _values!874) e!623326)))

(declare-fun b!1091418 () Bool)

(declare-fun e!623327 () Bool)

(declare-fun e!623329 () Bool)

(assert (=> b!1091418 (= e!623327 (not e!623329))))

(declare-fun res!728190 () Bool)

(assert (=> b!1091418 (=> res!728190 e!623329)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1091418 (= res!728190 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40867)

(declare-datatypes ((tuple2!17120 0))(
  ( (tuple2!17121 (_1!8571 (_ BitVec 64)) (_2!8571 V!40867)) )
))
(declare-datatypes ((List!23703 0))(
  ( (Nil!23700) (Cons!23699 (h!24908 tuple2!17120) (t!33564 List!23703)) )
))
(declare-datatypes ((ListLongMap!15089 0))(
  ( (ListLongMap!15090 (toList!7560 List!23703)) )
))
(declare-fun lt!487402 () ListLongMap!15089)

(declare-fun zeroValue!831 () V!40867)

(declare-fun getCurrentListMap!4320 (array!70529 array!70531 (_ BitVec 32) (_ BitVec 32) V!40867 V!40867 (_ BitVec 32) Int) ListLongMap!15089)

(assert (=> b!1091418 (= lt!487402 (getCurrentListMap!4320 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487405 () array!70531)

(declare-fun lt!487404 () ListLongMap!15089)

(declare-fun lt!487407 () array!70529)

(assert (=> b!1091418 (= lt!487404 (getCurrentListMap!4320 lt!487407 lt!487405 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487410 () ListLongMap!15089)

(declare-fun lt!487406 () ListLongMap!15089)

(assert (=> b!1091418 (and (= lt!487410 lt!487406) (= lt!487406 lt!487410))))

(declare-fun lt!487400 () ListLongMap!15089)

(declare-fun -!881 (ListLongMap!15089 (_ BitVec 64)) ListLongMap!15089)

(assert (=> b!1091418 (= lt!487406 (-!881 lt!487400 k0!904))))

(declare-datatypes ((Unit!35928 0))(
  ( (Unit!35929) )
))
(declare-fun lt!487401 () Unit!35928)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!139 (array!70529 array!70531 (_ BitVec 32) (_ BitVec 32) V!40867 V!40867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35928)

(assert (=> b!1091418 (= lt!487401 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!139 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4080 (array!70529 array!70531 (_ BitVec 32) (_ BitVec 32) V!40867 V!40867 (_ BitVec 32) Int) ListLongMap!15089)

(assert (=> b!1091418 (= lt!487410 (getCurrentListMapNoExtraKeys!4080 lt!487407 lt!487405 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2217 (Int (_ BitVec 64)) V!40867)

(assert (=> b!1091418 (= lt!487405 (array!70532 (store (arr!33939 _values!874) i!650 (ValueCellFull!12693 (dynLambda!2217 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34475 _values!874)))))

(assert (=> b!1091418 (= lt!487400 (getCurrentListMapNoExtraKeys!4080 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1091418 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487399 () Unit!35928)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70529 (_ BitVec 64) (_ BitVec 32)) Unit!35928)

(assert (=> b!1091418 (= lt!487399 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1091419 () Bool)

(declare-fun res!728187 () Bool)

(assert (=> b!1091419 (=> (not res!728187) (not e!623324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70529 (_ BitVec 32)) Bool)

(assert (=> b!1091419 (= res!728187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1091420 () Bool)

(declare-fun e!623325 () Bool)

(assert (=> b!1091420 (= e!623325 true)))

(declare-fun lt!487408 () ListLongMap!15089)

(declare-fun lt!487403 () ListLongMap!15089)

(assert (=> b!1091420 (= (-!881 lt!487408 k0!904) lt!487403)))

(declare-fun lt!487411 () Unit!35928)

(declare-fun addRemoveCommutativeForDiffKeys!103 (ListLongMap!15089 (_ BitVec 64) V!40867 (_ BitVec 64)) Unit!35928)

(assert (=> b!1091420 (= lt!487411 (addRemoveCommutativeForDiffKeys!103 lt!487400 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1091421 () Bool)

(assert (=> b!1091421 (= e!623326 (and e!623323 mapRes!41962))))

(declare-fun condMapEmpty!41962 () Bool)

(declare-fun mapDefault!41962 () ValueCell!12693)

(assert (=> b!1091421 (= condMapEmpty!41962 (= (arr!33939 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12693)) mapDefault!41962)))))

(declare-fun b!1091422 () Bool)

(declare-fun e!623328 () Bool)

(assert (=> b!1091422 (= e!623328 tp_is_empty!26805)))

(declare-fun mapNonEmpty!41962 () Bool)

(declare-fun tp!80257 () Bool)

(assert (=> mapNonEmpty!41962 (= mapRes!41962 (and tp!80257 e!623328))))

(declare-fun mapKey!41962 () (_ BitVec 32))

(declare-fun mapValue!41962 () ValueCell!12693)

(declare-fun mapRest!41962 () (Array (_ BitVec 32) ValueCell!12693))

(assert (=> mapNonEmpty!41962 (= (arr!33939 _values!874) (store mapRest!41962 mapKey!41962 mapValue!41962))))

(declare-fun b!1091423 () Bool)

(declare-fun res!728184 () Bool)

(assert (=> b!1091423 (=> (not res!728184) (not e!623327))))

(declare-datatypes ((List!23704 0))(
  ( (Nil!23701) (Cons!23700 (h!24909 (_ BitVec 64)) (t!33565 List!23704)) )
))
(declare-fun arrayNoDuplicates!0 (array!70529 (_ BitVec 32) List!23704) Bool)

(assert (=> b!1091423 (= res!728184 (arrayNoDuplicates!0 lt!487407 #b00000000000000000000000000000000 Nil!23701))))

(declare-fun b!1091424 () Bool)

(declare-fun res!728193 () Bool)

(assert (=> b!1091424 (=> (not res!728193) (not e!623324))))

(assert (=> b!1091424 (= res!728193 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34474 _keys!1070))))))

(declare-fun b!1091425 () Bool)

(assert (=> b!1091425 (= e!623329 e!623325)))

(declare-fun res!728192 () Bool)

(assert (=> b!1091425 (=> res!728192 e!623325)))

(assert (=> b!1091425 (= res!728192 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1091425 (= lt!487402 lt!487408)))

(declare-fun lt!487409 () tuple2!17120)

(declare-fun +!3344 (ListLongMap!15089 tuple2!17120) ListLongMap!15089)

(assert (=> b!1091425 (= lt!487408 (+!3344 lt!487400 lt!487409))))

(assert (=> b!1091425 (= lt!487404 lt!487403)))

(assert (=> b!1091425 (= lt!487403 (+!3344 lt!487406 lt!487409))))

(assert (=> b!1091425 (= lt!487404 (+!3344 lt!487410 lt!487409))))

(assert (=> b!1091425 (= lt!487409 (tuple2!17121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1091426 () Bool)

(declare-fun res!728189 () Bool)

(assert (=> b!1091426 (=> (not res!728189) (not e!623324))))

(assert (=> b!1091426 (= res!728189 (and (= (size!34475 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34474 _keys!1070) (size!34475 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1091427 () Bool)

(declare-fun res!728183 () Bool)

(assert (=> b!1091427 (=> (not res!728183) (not e!623324))))

(assert (=> b!1091427 (= res!728183 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23701))))

(declare-fun b!1091428 () Bool)

(assert (=> b!1091428 (= e!623324 e!623327)))

(declare-fun res!728191 () Bool)

(assert (=> b!1091428 (=> (not res!728191) (not e!623327))))

(assert (=> b!1091428 (= res!728191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487407 mask!1414))))

(assert (=> b!1091428 (= lt!487407 (array!70530 (store (arr!33938 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34474 _keys!1070)))))

(assert (= (and start!96150 res!728185) b!1091426))

(assert (= (and b!1091426 res!728189) b!1091419))

(assert (= (and b!1091419 res!728187) b!1091427))

(assert (= (and b!1091427 res!728183) b!1091424))

(assert (= (and b!1091424 res!728193) b!1091415))

(assert (= (and b!1091415 res!728188) b!1091417))

(assert (= (and b!1091417 res!728186) b!1091428))

(assert (= (and b!1091428 res!728191) b!1091423))

(assert (= (and b!1091423 res!728184) b!1091418))

(assert (= (and b!1091418 (not res!728190)) b!1091425))

(assert (= (and b!1091425 (not res!728192)) b!1091420))

(assert (= (and b!1091421 condMapEmpty!41962) mapIsEmpty!41962))

(assert (= (and b!1091421 (not condMapEmpty!41962)) mapNonEmpty!41962))

(get-info :version)

(assert (= (and mapNonEmpty!41962 ((_ is ValueCellFull!12693) mapValue!41962)) b!1091422))

(assert (= (and b!1091421 ((_ is ValueCellFull!12693) mapDefault!41962)) b!1091416))

(assert (= start!96150 b!1091421))

(declare-fun b_lambda!17473 () Bool)

(assert (=> (not b_lambda!17473) (not b!1091418)))

(declare-fun t!33563 () Bool)

(declare-fun tb!7681 () Bool)

(assert (=> (and start!96150 (= defaultEntry!882 defaultEntry!882) t!33563) tb!7681))

(declare-fun result!15881 () Bool)

(assert (=> tb!7681 (= result!15881 tp_is_empty!26805)))

(assert (=> b!1091418 t!33563))

(declare-fun b_and!36283 () Bool)

(assert (= b_and!36281 (and (=> t!33563 result!15881) b_and!36283)))

(declare-fun m!1010999 () Bool)

(assert (=> b!1091425 m!1010999))

(declare-fun m!1011001 () Bool)

(assert (=> b!1091425 m!1011001))

(declare-fun m!1011003 () Bool)

(assert (=> b!1091425 m!1011003))

(declare-fun m!1011005 () Bool)

(assert (=> b!1091415 m!1011005))

(declare-fun m!1011007 () Bool)

(assert (=> b!1091420 m!1011007))

(declare-fun m!1011009 () Bool)

(assert (=> b!1091420 m!1011009))

(declare-fun m!1011011 () Bool)

(assert (=> b!1091423 m!1011011))

(declare-fun m!1011013 () Bool)

(assert (=> b!1091418 m!1011013))

(declare-fun m!1011015 () Bool)

(assert (=> b!1091418 m!1011015))

(declare-fun m!1011017 () Bool)

(assert (=> b!1091418 m!1011017))

(declare-fun m!1011019 () Bool)

(assert (=> b!1091418 m!1011019))

(declare-fun m!1011021 () Bool)

(assert (=> b!1091418 m!1011021))

(declare-fun m!1011023 () Bool)

(assert (=> b!1091418 m!1011023))

(declare-fun m!1011025 () Bool)

(assert (=> b!1091418 m!1011025))

(declare-fun m!1011027 () Bool)

(assert (=> b!1091418 m!1011027))

(declare-fun m!1011029 () Bool)

(assert (=> b!1091418 m!1011029))

(declare-fun m!1011031 () Bool)

(assert (=> b!1091418 m!1011031))

(declare-fun m!1011033 () Bool)

(assert (=> b!1091419 m!1011033))

(declare-fun m!1011035 () Bool)

(assert (=> b!1091428 m!1011035))

(declare-fun m!1011037 () Bool)

(assert (=> b!1091428 m!1011037))

(declare-fun m!1011039 () Bool)

(assert (=> b!1091427 m!1011039))

(declare-fun m!1011041 () Bool)

(assert (=> b!1091417 m!1011041))

(declare-fun m!1011043 () Bool)

(assert (=> mapNonEmpty!41962 m!1011043))

(declare-fun m!1011045 () Bool)

(assert (=> start!96150 m!1011045))

(declare-fun m!1011047 () Bool)

(assert (=> start!96150 m!1011047))

(declare-fun m!1011049 () Bool)

(assert (=> start!96150 m!1011049))

(check-sat (not b_lambda!17473) (not b_next!22803) (not b!1091427) (not b!1091419) (not b!1091425) (not start!96150) b_and!36283 (not b!1091418) (not b!1091423) (not b!1091420) (not b!1091415) (not mapNonEmpty!41962) (not b!1091428) tp_is_empty!26805)
(check-sat b_and!36283 (not b_next!22803))
