; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96420 () Bool)

(assert start!96420)

(declare-fun b_free!22837 () Bool)

(declare-fun b_next!22837 () Bool)

(assert (=> start!96420 (= b_free!22837 (not b_next!22837))))

(declare-fun tp!80359 () Bool)

(declare-fun b_and!36359 () Bool)

(assert (=> start!96420 (= tp!80359 b_and!36359)))

(declare-fun b!1093490 () Bool)

(declare-fun e!624592 () Bool)

(declare-datatypes ((array!70629 0))(
  ( (array!70630 (arr!33982 (Array (_ BitVec 32) (_ BitVec 64))) (size!34519 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70629)

(assert (=> b!1093490 (= e!624592 (bvsle #b00000000000000000000000000000000 (size!34519 _keys!1070)))))

(declare-datatypes ((V!40913 0))(
  ( (V!40914 (val!13476 Int)) )
))
(declare-datatypes ((tuple2!17146 0))(
  ( (tuple2!17147 (_1!8584 (_ BitVec 64)) (_2!8584 V!40913)) )
))
(declare-datatypes ((List!23738 0))(
  ( (Nil!23735) (Cons!23734 (h!24952 tuple2!17146) (t!33625 List!23738)) )
))
(declare-datatypes ((ListLongMap!15123 0))(
  ( (ListLongMap!15124 (toList!7577 List!23738)) )
))
(declare-fun lt!488578 () ListLongMap!15123)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!488577 () ListLongMap!15123)

(declare-fun -!882 (ListLongMap!15123 (_ BitVec 64)) ListLongMap!15123)

(assert (=> b!1093490 (= (-!882 lt!488578 k0!904) lt!488577)))

(declare-fun lt!488587 () ListLongMap!15123)

(declare-datatypes ((Unit!35931 0))(
  ( (Unit!35932) )
))
(declare-fun lt!488585 () Unit!35931)

(declare-fun minValue!831 () V!40913)

(declare-fun addRemoveCommutativeForDiffKeys!115 (ListLongMap!15123 (_ BitVec 64) V!40913 (_ BitVec 64)) Unit!35931)

(assert (=> b!1093490 (= lt!488585 (addRemoveCommutativeForDiffKeys!115 lt!488587 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1093491 () Bool)

(declare-fun e!624593 () Bool)

(assert (=> b!1093491 (= e!624593 e!624592)))

(declare-fun res!729271 () Bool)

(assert (=> b!1093491 (=> res!729271 e!624592)))

(assert (=> b!1093491 (= res!729271 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!488581 () ListLongMap!15123)

(assert (=> b!1093491 (= lt!488581 lt!488578)))

(declare-fun lt!488583 () tuple2!17146)

(declare-fun +!3389 (ListLongMap!15123 tuple2!17146) ListLongMap!15123)

(assert (=> b!1093491 (= lt!488578 (+!3389 lt!488587 lt!488583))))

(declare-fun lt!488579 () ListLongMap!15123)

(assert (=> b!1093491 (= lt!488579 lt!488577)))

(declare-fun lt!488580 () ListLongMap!15123)

(assert (=> b!1093491 (= lt!488577 (+!3389 lt!488580 lt!488583))))

(declare-fun lt!488586 () ListLongMap!15123)

(assert (=> b!1093491 (= lt!488579 (+!3389 lt!488586 lt!488583))))

(assert (=> b!1093491 (= lt!488583 (tuple2!17147 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1093492 () Bool)

(declare-fun res!729276 () Bool)

(declare-fun e!624587 () Bool)

(assert (=> b!1093492 (=> (not res!729276) (not e!624587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093492 (= res!729276 (validKeyInArray!0 k0!904))))

(declare-fun b!1093493 () Bool)

(declare-fun res!729275 () Bool)

(assert (=> b!1093493 (=> (not res!729275) (not e!624587))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093493 (= res!729275 (= (select (arr!33982 _keys!1070) i!650) k0!904))))

(declare-fun b!1093494 () Bool)

(declare-fun e!624588 () Bool)

(declare-fun tp_is_empty!26839 () Bool)

(assert (=> b!1093494 (= e!624588 tp_is_empty!26839)))

(declare-fun b!1093495 () Bool)

(declare-fun res!729273 () Bool)

(assert (=> b!1093495 (=> (not res!729273) (not e!624587))))

(declare-datatypes ((List!23739 0))(
  ( (Nil!23736) (Cons!23735 (h!24953 (_ BitVec 64)) (t!33626 List!23739)) )
))
(declare-fun arrayNoDuplicates!0 (array!70629 (_ BitVec 32) List!23739) Bool)

(assert (=> b!1093495 (= res!729273 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23736))))

(declare-fun mapNonEmpty!42013 () Bool)

(declare-fun mapRes!42013 () Bool)

(declare-fun tp!80360 () Bool)

(assert (=> mapNonEmpty!42013 (= mapRes!42013 (and tp!80360 e!624588))))

(declare-datatypes ((ValueCell!12710 0))(
  ( (ValueCellFull!12710 (v!16093 V!40913)) (EmptyCell!12710) )
))
(declare-fun mapValue!42013 () ValueCell!12710)

(declare-datatypes ((array!70631 0))(
  ( (array!70632 (arr!33983 (Array (_ BitVec 32) ValueCell!12710)) (size!34520 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70631)

(declare-fun mapKey!42013 () (_ BitVec 32))

(declare-fun mapRest!42013 () (Array (_ BitVec 32) ValueCell!12710))

(assert (=> mapNonEmpty!42013 (= (arr!33983 _values!874) (store mapRest!42013 mapKey!42013 mapValue!42013))))

(declare-fun b!1093496 () Bool)

(declare-fun res!729270 () Bool)

(assert (=> b!1093496 (=> (not res!729270) (not e!624587))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093496 (= res!729270 (and (= (size!34520 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34519 _keys!1070) (size!34520 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!729269 () Bool)

(assert (=> start!96420 (=> (not res!729269) (not e!624587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96420 (= res!729269 (validMask!0 mask!1414))))

(assert (=> start!96420 e!624587))

(assert (=> start!96420 tp!80359))

(assert (=> start!96420 true))

(assert (=> start!96420 tp_is_empty!26839))

(declare-fun array_inv!26236 (array!70629) Bool)

(assert (=> start!96420 (array_inv!26236 _keys!1070)))

(declare-fun e!624590 () Bool)

(declare-fun array_inv!26237 (array!70631) Bool)

(assert (=> start!96420 (and (array_inv!26237 _values!874) e!624590)))

(declare-fun b!1093497 () Bool)

(declare-fun res!729266 () Bool)

(assert (=> b!1093497 (=> (not res!729266) (not e!624587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70629 (_ BitVec 32)) Bool)

(assert (=> b!1093497 (= res!729266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093498 () Bool)

(declare-fun e!624589 () Bool)

(assert (=> b!1093498 (= e!624587 e!624589)))

(declare-fun res!729268 () Bool)

(assert (=> b!1093498 (=> (not res!729268) (not e!624589))))

(declare-fun lt!488582 () array!70629)

(assert (=> b!1093498 (= res!729268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488582 mask!1414))))

(assert (=> b!1093498 (= lt!488582 (array!70630 (store (arr!33982 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34519 _keys!1070)))))

(declare-fun b!1093499 () Bool)

(declare-fun e!624591 () Bool)

(assert (=> b!1093499 (= e!624590 (and e!624591 mapRes!42013))))

(declare-fun condMapEmpty!42013 () Bool)

(declare-fun mapDefault!42013 () ValueCell!12710)

(assert (=> b!1093499 (= condMapEmpty!42013 (= (arr!33983 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12710)) mapDefault!42013)))))

(declare-fun b!1093500 () Bool)

(declare-fun res!729267 () Bool)

(assert (=> b!1093500 (=> (not res!729267) (not e!624589))))

(assert (=> b!1093500 (= res!729267 (arrayNoDuplicates!0 lt!488582 #b00000000000000000000000000000000 Nil!23736))))

(declare-fun b!1093501 () Bool)

(assert (=> b!1093501 (= e!624589 (not e!624593))))

(declare-fun res!729272 () Bool)

(assert (=> b!1093501 (=> res!729272 e!624593)))

(assert (=> b!1093501 (= res!729272 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40913)

(declare-fun getCurrentListMap!4325 (array!70629 array!70631 (_ BitVec 32) (_ BitVec 32) V!40913 V!40913 (_ BitVec 32) Int) ListLongMap!15123)

(assert (=> b!1093501 (= lt!488581 (getCurrentListMap!4325 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488589 () array!70631)

(assert (=> b!1093501 (= lt!488579 (getCurrentListMap!4325 lt!488582 lt!488589 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1093501 (and (= lt!488586 lt!488580) (= lt!488580 lt!488586))))

(assert (=> b!1093501 (= lt!488580 (-!882 lt!488587 k0!904))))

(declare-fun lt!488584 () Unit!35931)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!154 (array!70629 array!70631 (_ BitVec 32) (_ BitVec 32) V!40913 V!40913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35931)

(assert (=> b!1093501 (= lt!488584 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!154 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4130 (array!70629 array!70631 (_ BitVec 32) (_ BitVec 32) V!40913 V!40913 (_ BitVec 32) Int) ListLongMap!15123)

(assert (=> b!1093501 (= lt!488586 (getCurrentListMapNoExtraKeys!4130 lt!488582 lt!488589 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2251 (Int (_ BitVec 64)) V!40913)

(assert (=> b!1093501 (= lt!488589 (array!70632 (store (arr!33983 _values!874) i!650 (ValueCellFull!12710 (dynLambda!2251 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34520 _values!874)))))

(assert (=> b!1093501 (= lt!488587 (getCurrentListMapNoExtraKeys!4130 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093501 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488588 () Unit!35931)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70629 (_ BitVec 64) (_ BitVec 32)) Unit!35931)

(assert (=> b!1093501 (= lt!488588 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093502 () Bool)

(assert (=> b!1093502 (= e!624591 tp_is_empty!26839)))

(declare-fun mapIsEmpty!42013 () Bool)

(assert (=> mapIsEmpty!42013 mapRes!42013))

(declare-fun b!1093503 () Bool)

(declare-fun res!729274 () Bool)

(assert (=> b!1093503 (=> (not res!729274) (not e!624587))))

(assert (=> b!1093503 (= res!729274 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34519 _keys!1070))))))

(assert (= (and start!96420 res!729269) b!1093496))

(assert (= (and b!1093496 res!729270) b!1093497))

(assert (= (and b!1093497 res!729266) b!1093495))

(assert (= (and b!1093495 res!729273) b!1093503))

(assert (= (and b!1093503 res!729274) b!1093492))

(assert (= (and b!1093492 res!729276) b!1093493))

(assert (= (and b!1093493 res!729275) b!1093498))

(assert (= (and b!1093498 res!729268) b!1093500))

(assert (= (and b!1093500 res!729267) b!1093501))

(assert (= (and b!1093501 (not res!729272)) b!1093491))

(assert (= (and b!1093491 (not res!729271)) b!1093490))

(assert (= (and b!1093499 condMapEmpty!42013) mapIsEmpty!42013))

(assert (= (and b!1093499 (not condMapEmpty!42013)) mapNonEmpty!42013))

(get-info :version)

(assert (= (and mapNonEmpty!42013 ((_ is ValueCellFull!12710) mapValue!42013)) b!1093494))

(assert (= (and b!1093499 ((_ is ValueCellFull!12710) mapDefault!42013)) b!1093502))

(assert (= start!96420 b!1093499))

(declare-fun b_lambda!17517 () Bool)

(assert (=> (not b_lambda!17517) (not b!1093501)))

(declare-fun t!33624 () Bool)

(declare-fun tb!7707 () Bool)

(assert (=> (and start!96420 (= defaultEntry!882 defaultEntry!882) t!33624) tb!7707))

(declare-fun result!15941 () Bool)

(assert (=> tb!7707 (= result!15941 tp_is_empty!26839)))

(assert (=> b!1093501 t!33624))

(declare-fun b_and!36361 () Bool)

(assert (= b_and!36359 (and (=> t!33624 result!15941) b_and!36361)))

(declare-fun m!1013555 () Bool)

(assert (=> start!96420 m!1013555))

(declare-fun m!1013557 () Bool)

(assert (=> start!96420 m!1013557))

(declare-fun m!1013559 () Bool)

(assert (=> start!96420 m!1013559))

(declare-fun m!1013561 () Bool)

(assert (=> b!1093498 m!1013561))

(declare-fun m!1013563 () Bool)

(assert (=> b!1093498 m!1013563))

(declare-fun m!1013565 () Bool)

(assert (=> b!1093492 m!1013565))

(declare-fun m!1013567 () Bool)

(assert (=> b!1093501 m!1013567))

(declare-fun m!1013569 () Bool)

(assert (=> b!1093501 m!1013569))

(declare-fun m!1013571 () Bool)

(assert (=> b!1093501 m!1013571))

(declare-fun m!1013573 () Bool)

(assert (=> b!1093501 m!1013573))

(declare-fun m!1013575 () Bool)

(assert (=> b!1093501 m!1013575))

(declare-fun m!1013577 () Bool)

(assert (=> b!1093501 m!1013577))

(declare-fun m!1013579 () Bool)

(assert (=> b!1093501 m!1013579))

(declare-fun m!1013581 () Bool)

(assert (=> b!1093501 m!1013581))

(declare-fun m!1013583 () Bool)

(assert (=> b!1093501 m!1013583))

(declare-fun m!1013585 () Bool)

(assert (=> b!1093501 m!1013585))

(declare-fun m!1013587 () Bool)

(assert (=> b!1093491 m!1013587))

(declare-fun m!1013589 () Bool)

(assert (=> b!1093491 m!1013589))

(declare-fun m!1013591 () Bool)

(assert (=> b!1093491 m!1013591))

(declare-fun m!1013593 () Bool)

(assert (=> mapNonEmpty!42013 m!1013593))

(declare-fun m!1013595 () Bool)

(assert (=> b!1093490 m!1013595))

(declare-fun m!1013597 () Bool)

(assert (=> b!1093490 m!1013597))

(declare-fun m!1013599 () Bool)

(assert (=> b!1093493 m!1013599))

(declare-fun m!1013601 () Bool)

(assert (=> b!1093500 m!1013601))

(declare-fun m!1013603 () Bool)

(assert (=> b!1093495 m!1013603))

(declare-fun m!1013605 () Bool)

(assert (=> b!1093497 m!1013605))

(check-sat (not b!1093490) (not b_lambda!17517) (not b!1093497) tp_is_empty!26839 (not b!1093501) (not b_next!22837) (not b!1093495) b_and!36361 (not start!96420) (not mapNonEmpty!42013) (not b!1093491) (not b!1093498) (not b!1093500) (not b!1093492))
(check-sat b_and!36361 (not b_next!22837))
