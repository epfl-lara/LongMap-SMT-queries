; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96204 () Bool)

(assert start!96204)

(declare-fun b_free!22857 () Bool)

(declare-fun b_next!22857 () Bool)

(assert (=> start!96204 (= b_free!22857 (not b_next!22857))))

(declare-fun tp!80420 () Bool)

(declare-fun b_and!36389 () Bool)

(assert (=> start!96204 (= tp!80420 b_and!36389)))

(declare-fun b!1092557 () Bool)

(declare-fun res!729031 () Bool)

(declare-fun e!623929 () Bool)

(assert (=> b!1092557 (=> (not res!729031) (not e!623929))))

(declare-datatypes ((array!70637 0))(
  ( (array!70638 (arr!33992 (Array (_ BitVec 32) (_ BitVec 64))) (size!34528 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70637)

(declare-datatypes ((List!23745 0))(
  ( (Nil!23742) (Cons!23741 (h!24950 (_ BitVec 64)) (t!33660 List!23745)) )
))
(declare-fun arrayNoDuplicates!0 (array!70637 (_ BitVec 32) List!23745) Bool)

(assert (=> b!1092557 (= res!729031 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23742))))

(declare-fun mapIsEmpty!42043 () Bool)

(declare-fun mapRes!42043 () Bool)

(assert (=> mapIsEmpty!42043 mapRes!42043))

(declare-fun b!1092558 () Bool)

(declare-fun res!729033 () Bool)

(declare-fun e!623926 () Bool)

(assert (=> b!1092558 (=> (not res!729033) (not e!623926))))

(declare-fun lt!488366 () array!70637)

(assert (=> b!1092558 (= res!729033 (arrayNoDuplicates!0 lt!488366 #b00000000000000000000000000000000 Nil!23742))))

(declare-fun b!1092559 () Bool)

(declare-fun e!623927 () Bool)

(declare-fun e!623930 () Bool)

(assert (=> b!1092559 (= e!623927 (and e!623930 mapRes!42043))))

(declare-fun condMapEmpty!42043 () Bool)

(declare-datatypes ((V!40939 0))(
  ( (V!40940 (val!13486 Int)) )
))
(declare-datatypes ((ValueCell!12720 0))(
  ( (ValueCellFull!12720 (v!16107 V!40939)) (EmptyCell!12720) )
))
(declare-datatypes ((array!70639 0))(
  ( (array!70640 (arr!33993 (Array (_ BitVec 32) ValueCell!12720)) (size!34529 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70639)

(declare-fun mapDefault!42043 () ValueCell!12720)

(assert (=> b!1092559 (= condMapEmpty!42043 (= (arr!33993 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12720)) mapDefault!42043)))))

(declare-fun b!1092560 () Bool)

(declare-fun res!729032 () Bool)

(assert (=> b!1092560 (=> (not res!729032) (not e!623929))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092560 (= res!729032 (validKeyInArray!0 k0!904))))

(declare-fun b!1092561 () Bool)

(declare-fun res!729028 () Bool)

(assert (=> b!1092561 (=> (not res!729028) (not e!623929))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092561 (= res!729028 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34528 _keys!1070))))))

(declare-fun b!1092562 () Bool)

(assert (=> b!1092562 (= e!623929 e!623926)))

(declare-fun res!729035 () Bool)

(assert (=> b!1092562 (=> (not res!729035) (not e!623926))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70637 (_ BitVec 32)) Bool)

(assert (=> b!1092562 (= res!729035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488366 mask!1414))))

(assert (=> b!1092562 (= lt!488366 (array!70638 (store (arr!33992 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34528 _keys!1070)))))

(declare-fun b!1092563 () Bool)

(assert (=> b!1092563 (= e!623926 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40939)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17160 0))(
  ( (tuple2!17161 (_1!8591 (_ BitVec 64)) (_2!8591 V!40939)) )
))
(declare-datatypes ((List!23746 0))(
  ( (Nil!23743) (Cons!23742 (h!24951 tuple2!17160) (t!33661 List!23746)) )
))
(declare-datatypes ((ListLongMap!15129 0))(
  ( (ListLongMap!15130 (toList!7580 List!23746)) )
))
(declare-fun lt!488361 () ListLongMap!15129)

(declare-fun zeroValue!831 () V!40939)

(declare-fun getCurrentListMap!4336 (array!70637 array!70639 (_ BitVec 32) (_ BitVec 32) V!40939 V!40939 (_ BitVec 32) Int) ListLongMap!15129)

(assert (=> b!1092563 (= lt!488361 (getCurrentListMap!4336 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488360 () array!70639)

(declare-fun lt!488367 () ListLongMap!15129)

(assert (=> b!1092563 (= lt!488367 (getCurrentListMap!4336 lt!488366 lt!488360 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488364 () ListLongMap!15129)

(declare-fun lt!488365 () ListLongMap!15129)

(assert (=> b!1092563 (and (= lt!488364 lt!488365) (= lt!488365 lt!488364))))

(declare-fun lt!488362 () ListLongMap!15129)

(declare-fun -!899 (ListLongMap!15129 (_ BitVec 64)) ListLongMap!15129)

(assert (=> b!1092563 (= lt!488365 (-!899 lt!488362 k0!904))))

(declare-datatypes ((Unit!35964 0))(
  ( (Unit!35965) )
))
(declare-fun lt!488363 () Unit!35964)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!155 (array!70637 array!70639 (_ BitVec 32) (_ BitVec 32) V!40939 V!40939 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35964)

(assert (=> b!1092563 (= lt!488363 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!155 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4096 (array!70637 array!70639 (_ BitVec 32) (_ BitVec 32) V!40939 V!40939 (_ BitVec 32) Int) ListLongMap!15129)

(assert (=> b!1092563 (= lt!488364 (getCurrentListMapNoExtraKeys!4096 lt!488366 lt!488360 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2233 (Int (_ BitVec 64)) V!40939)

(assert (=> b!1092563 (= lt!488360 (array!70640 (store (arr!33993 _values!874) i!650 (ValueCellFull!12720 (dynLambda!2233 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34529 _values!874)))))

(assert (=> b!1092563 (= lt!488362 (getCurrentListMapNoExtraKeys!4096 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092563 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488368 () Unit!35964)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70637 (_ BitVec 64) (_ BitVec 32)) Unit!35964)

(assert (=> b!1092563 (= lt!488368 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!729029 () Bool)

(assert (=> start!96204 (=> (not res!729029) (not e!623929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96204 (= res!729029 (validMask!0 mask!1414))))

(assert (=> start!96204 e!623929))

(assert (=> start!96204 tp!80420))

(assert (=> start!96204 true))

(declare-fun tp_is_empty!26859 () Bool)

(assert (=> start!96204 tp_is_empty!26859))

(declare-fun array_inv!26206 (array!70637) Bool)

(assert (=> start!96204 (array_inv!26206 _keys!1070)))

(declare-fun array_inv!26207 (array!70639) Bool)

(assert (=> start!96204 (and (array_inv!26207 _values!874) e!623927)))

(declare-fun b!1092564 () Bool)

(declare-fun res!729036 () Bool)

(assert (=> b!1092564 (=> (not res!729036) (not e!623929))))

(assert (=> b!1092564 (= res!729036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42043 () Bool)

(declare-fun tp!80419 () Bool)

(declare-fun e!623928 () Bool)

(assert (=> mapNonEmpty!42043 (= mapRes!42043 (and tp!80419 e!623928))))

(declare-fun mapKey!42043 () (_ BitVec 32))

(declare-fun mapRest!42043 () (Array (_ BitVec 32) ValueCell!12720))

(declare-fun mapValue!42043 () ValueCell!12720)

(assert (=> mapNonEmpty!42043 (= (arr!33993 _values!874) (store mapRest!42043 mapKey!42043 mapValue!42043))))

(declare-fun b!1092565 () Bool)

(declare-fun res!729030 () Bool)

(assert (=> b!1092565 (=> (not res!729030) (not e!623929))))

(assert (=> b!1092565 (= res!729030 (= (select (arr!33992 _keys!1070) i!650) k0!904))))

(declare-fun b!1092566 () Bool)

(assert (=> b!1092566 (= e!623928 tp_is_empty!26859)))

(declare-fun b!1092567 () Bool)

(declare-fun res!729034 () Bool)

(assert (=> b!1092567 (=> (not res!729034) (not e!623929))))

(assert (=> b!1092567 (= res!729034 (and (= (size!34529 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34528 _keys!1070) (size!34529 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092568 () Bool)

(assert (=> b!1092568 (= e!623930 tp_is_empty!26859)))

(assert (= (and start!96204 res!729029) b!1092567))

(assert (= (and b!1092567 res!729034) b!1092564))

(assert (= (and b!1092564 res!729036) b!1092557))

(assert (= (and b!1092557 res!729031) b!1092561))

(assert (= (and b!1092561 res!729028) b!1092560))

(assert (= (and b!1092560 res!729032) b!1092565))

(assert (= (and b!1092565 res!729030) b!1092562))

(assert (= (and b!1092562 res!729035) b!1092558))

(assert (= (and b!1092558 res!729033) b!1092563))

(assert (= (and b!1092559 condMapEmpty!42043) mapIsEmpty!42043))

(assert (= (and b!1092559 (not condMapEmpty!42043)) mapNonEmpty!42043))

(get-info :version)

(assert (= (and mapNonEmpty!42043 ((_ is ValueCellFull!12720) mapValue!42043)) b!1092566))

(assert (= (and b!1092559 ((_ is ValueCellFull!12720) mapDefault!42043)) b!1092568))

(assert (= start!96204 b!1092559))

(declare-fun b_lambda!17527 () Bool)

(assert (=> (not b_lambda!17527) (not b!1092563)))

(declare-fun t!33659 () Bool)

(declare-fun tb!7735 () Bool)

(assert (=> (and start!96204 (= defaultEntry!882 defaultEntry!882) t!33659) tb!7735))

(declare-fun result!15989 () Bool)

(assert (=> tb!7735 (= result!15989 tp_is_empty!26859)))

(assert (=> b!1092563 t!33659))

(declare-fun b_and!36391 () Bool)

(assert (= b_and!36389 (and (=> t!33659 result!15989) b_and!36391)))

(declare-fun m!1012333 () Bool)

(assert (=> b!1092557 m!1012333))

(declare-fun m!1012335 () Bool)

(assert (=> b!1092564 m!1012335))

(declare-fun m!1012337 () Bool)

(assert (=> b!1092558 m!1012337))

(declare-fun m!1012339 () Bool)

(assert (=> b!1092560 m!1012339))

(declare-fun m!1012341 () Bool)

(assert (=> b!1092563 m!1012341))

(declare-fun m!1012343 () Bool)

(assert (=> b!1092563 m!1012343))

(declare-fun m!1012345 () Bool)

(assert (=> b!1092563 m!1012345))

(declare-fun m!1012347 () Bool)

(assert (=> b!1092563 m!1012347))

(declare-fun m!1012349 () Bool)

(assert (=> b!1092563 m!1012349))

(declare-fun m!1012351 () Bool)

(assert (=> b!1092563 m!1012351))

(declare-fun m!1012353 () Bool)

(assert (=> b!1092563 m!1012353))

(declare-fun m!1012355 () Bool)

(assert (=> b!1092563 m!1012355))

(declare-fun m!1012357 () Bool)

(assert (=> b!1092563 m!1012357))

(declare-fun m!1012359 () Bool)

(assert (=> b!1092563 m!1012359))

(declare-fun m!1012361 () Bool)

(assert (=> b!1092562 m!1012361))

(declare-fun m!1012363 () Bool)

(assert (=> b!1092562 m!1012363))

(declare-fun m!1012365 () Bool)

(assert (=> start!96204 m!1012365))

(declare-fun m!1012367 () Bool)

(assert (=> start!96204 m!1012367))

(declare-fun m!1012369 () Bool)

(assert (=> start!96204 m!1012369))

(declare-fun m!1012371 () Bool)

(assert (=> b!1092565 m!1012371))

(declare-fun m!1012373 () Bool)

(assert (=> mapNonEmpty!42043 m!1012373))

(check-sat b_and!36391 (not b_next!22857) (not b!1092560) (not mapNonEmpty!42043) (not b!1092564) (not b_lambda!17527) (not b!1092563) tp_is_empty!26859 (not b!1092557) (not b!1092558) (not b!1092562) (not start!96204))
(check-sat b_and!36391 (not b_next!22857))
