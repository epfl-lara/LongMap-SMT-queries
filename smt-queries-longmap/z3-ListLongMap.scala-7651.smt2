; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96462 () Bool)

(assert start!96462)

(declare-fun b_free!22879 () Bool)

(declare-fun b_next!22879 () Bool)

(assert (=> start!96462 (= b_free!22879 (not b_next!22879))))

(declare-fun tp!80486 () Bool)

(declare-fun b_and!36443 () Bool)

(assert (=> start!96462 (= tp!80486 b_and!36443)))

(declare-fun mapNonEmpty!42076 () Bool)

(declare-fun mapRes!42076 () Bool)

(declare-fun tp!80485 () Bool)

(declare-fun e!624979 () Bool)

(assert (=> mapNonEmpty!42076 (= mapRes!42076 (and tp!80485 e!624979))))

(declare-datatypes ((V!40969 0))(
  ( (V!40970 (val!13497 Int)) )
))
(declare-datatypes ((ValueCell!12731 0))(
  ( (ValueCellFull!12731 (v!16114 V!40969)) (EmptyCell!12731) )
))
(declare-datatypes ((array!70707 0))(
  ( (array!70708 (arr!34021 (Array (_ BitVec 32) ValueCell!12731)) (size!34558 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70707)

(declare-fun mapValue!42076 () ValueCell!12731)

(declare-fun mapRest!42076 () (Array (_ BitVec 32) ValueCell!12731))

(declare-fun mapKey!42076 () (_ BitVec 32))

(assert (=> mapNonEmpty!42076 (= (arr!34021 _values!874) (store mapRest!42076 mapKey!42076 mapValue!42076))))

(declare-fun mapIsEmpty!42076 () Bool)

(assert (=> mapIsEmpty!42076 mapRes!42076))

(declare-fun b!1094302 () Bool)

(declare-fun e!624981 () Bool)

(assert (=> b!1094302 (= e!624981 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40969)

(declare-datatypes ((array!70709 0))(
  ( (array!70710 (arr!34022 (Array (_ BitVec 32) (_ BitVec 64))) (size!34559 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70709)

(declare-fun minValue!831 () V!40969)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17174 0))(
  ( (tuple2!17175 (_1!8598 (_ BitVec 64)) (_2!8598 V!40969)) )
))
(declare-datatypes ((List!23766 0))(
  ( (Nil!23763) (Cons!23762 (h!24980 tuple2!17174) (t!33695 List!23766)) )
))
(declare-datatypes ((ListLongMap!15151 0))(
  ( (ListLongMap!15152 (toList!7591 List!23766)) )
))
(declare-fun lt!489180 () ListLongMap!15151)

(declare-fun getCurrentListMap!4339 (array!70709 array!70707 (_ BitVec 32) (_ BitVec 32) V!40969 V!40969 (_ BitVec 32) Int) ListLongMap!15151)

(assert (=> b!1094302 (= lt!489180 (getCurrentListMap!4339 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489176 () ListLongMap!15151)

(declare-fun lt!489177 () array!70707)

(declare-fun lt!489179 () array!70709)

(assert (=> b!1094302 (= lt!489176 (getCurrentListMap!4339 lt!489179 lt!489177 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489175 () ListLongMap!15151)

(declare-fun lt!489173 () ListLongMap!15151)

(assert (=> b!1094302 (and (= lt!489175 lt!489173) (= lt!489173 lt!489175))))

(declare-fun lt!489172 () ListLongMap!15151)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!896 (ListLongMap!15151 (_ BitVec 64)) ListLongMap!15151)

(assert (=> b!1094302 (= lt!489173 (-!896 lt!489172 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35959 0))(
  ( (Unit!35960) )
))
(declare-fun lt!489174 () Unit!35959)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!168 (array!70709 array!70707 (_ BitVec 32) (_ BitVec 32) V!40969 V!40969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35959)

(assert (=> b!1094302 (= lt!489174 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!168 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4144 (array!70709 array!70707 (_ BitVec 32) (_ BitVec 32) V!40969 V!40969 (_ BitVec 32) Int) ListLongMap!15151)

(assert (=> b!1094302 (= lt!489175 (getCurrentListMapNoExtraKeys!4144 lt!489179 lt!489177 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2265 (Int (_ BitVec 64)) V!40969)

(assert (=> b!1094302 (= lt!489177 (array!70708 (store (arr!34021 _values!874) i!650 (ValueCellFull!12731 (dynLambda!2265 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34558 _values!874)))))

(assert (=> b!1094302 (= lt!489172 (getCurrentListMapNoExtraKeys!4144 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094302 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489178 () Unit!35959)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70709 (_ BitVec 64) (_ BitVec 32)) Unit!35959)

(assert (=> b!1094302 (= lt!489178 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1094303 () Bool)

(declare-fun res!729847 () Bool)

(declare-fun e!624982 () Bool)

(assert (=> b!1094303 (=> (not res!729847) (not e!624982))))

(assert (=> b!1094303 (= res!729847 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34559 _keys!1070))))))

(declare-fun b!1094304 () Bool)

(declare-fun res!729848 () Bool)

(assert (=> b!1094304 (=> (not res!729848) (not e!624981))))

(declare-datatypes ((List!23767 0))(
  ( (Nil!23764) (Cons!23763 (h!24981 (_ BitVec 64)) (t!33696 List!23767)) )
))
(declare-fun arrayNoDuplicates!0 (array!70709 (_ BitVec 32) List!23767) Bool)

(assert (=> b!1094304 (= res!729848 (arrayNoDuplicates!0 lt!489179 #b00000000000000000000000000000000 Nil!23764))))

(declare-fun b!1094305 () Bool)

(declare-fun res!729849 () Bool)

(assert (=> b!1094305 (=> (not res!729849) (not e!624982))))

(assert (=> b!1094305 (= res!729849 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23764))))

(declare-fun b!1094306 () Bool)

(declare-fun e!624980 () Bool)

(declare-fun e!624983 () Bool)

(assert (=> b!1094306 (= e!624980 (and e!624983 mapRes!42076))))

(declare-fun condMapEmpty!42076 () Bool)

(declare-fun mapDefault!42076 () ValueCell!12731)

(assert (=> b!1094306 (= condMapEmpty!42076 (= (arr!34021 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12731)) mapDefault!42076)))))

(declare-fun b!1094307 () Bool)

(declare-fun tp_is_empty!26881 () Bool)

(assert (=> b!1094307 (= e!624979 tp_is_empty!26881)))

(declare-fun b!1094308 () Bool)

(assert (=> b!1094308 (= e!624983 tp_is_empty!26881)))

(declare-fun b!1094310 () Bool)

(declare-fun res!729852 () Bool)

(assert (=> b!1094310 (=> (not res!729852) (not e!624982))))

(assert (=> b!1094310 (= res!729852 (and (= (size!34558 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34559 _keys!1070) (size!34558 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094311 () Bool)

(declare-fun res!729850 () Bool)

(assert (=> b!1094311 (=> (not res!729850) (not e!624982))))

(assert (=> b!1094311 (= res!729850 (= (select (arr!34022 _keys!1070) i!650) k0!904))))

(declare-fun b!1094312 () Bool)

(declare-fun res!729854 () Bool)

(assert (=> b!1094312 (=> (not res!729854) (not e!624982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70709 (_ BitVec 32)) Bool)

(assert (=> b!1094312 (= res!729854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094313 () Bool)

(declare-fun res!729851 () Bool)

(assert (=> b!1094313 (=> (not res!729851) (not e!624982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094313 (= res!729851 (validKeyInArray!0 k0!904))))

(declare-fun res!729853 () Bool)

(assert (=> start!96462 (=> (not res!729853) (not e!624982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96462 (= res!729853 (validMask!0 mask!1414))))

(assert (=> start!96462 e!624982))

(assert (=> start!96462 tp!80486))

(assert (=> start!96462 true))

(assert (=> start!96462 tp_is_empty!26881))

(declare-fun array_inv!26260 (array!70709) Bool)

(assert (=> start!96462 (array_inv!26260 _keys!1070)))

(declare-fun array_inv!26261 (array!70707) Bool)

(assert (=> start!96462 (and (array_inv!26261 _values!874) e!624980)))

(declare-fun b!1094309 () Bool)

(assert (=> b!1094309 (= e!624982 e!624981)))

(declare-fun res!729855 () Bool)

(assert (=> b!1094309 (=> (not res!729855) (not e!624981))))

(assert (=> b!1094309 (= res!729855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489179 mask!1414))))

(assert (=> b!1094309 (= lt!489179 (array!70710 (store (arr!34022 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34559 _keys!1070)))))

(assert (= (and start!96462 res!729853) b!1094310))

(assert (= (and b!1094310 res!729852) b!1094312))

(assert (= (and b!1094312 res!729854) b!1094305))

(assert (= (and b!1094305 res!729849) b!1094303))

(assert (= (and b!1094303 res!729847) b!1094313))

(assert (= (and b!1094313 res!729851) b!1094311))

(assert (= (and b!1094311 res!729850) b!1094309))

(assert (= (and b!1094309 res!729855) b!1094304))

(assert (= (and b!1094304 res!729848) b!1094302))

(assert (= (and b!1094306 condMapEmpty!42076) mapIsEmpty!42076))

(assert (= (and b!1094306 (not condMapEmpty!42076)) mapNonEmpty!42076))

(get-info :version)

(assert (= (and mapNonEmpty!42076 ((_ is ValueCellFull!12731) mapValue!42076)) b!1094307))

(assert (= (and b!1094306 ((_ is ValueCellFull!12731) mapDefault!42076)) b!1094308))

(assert (= start!96462 b!1094306))

(declare-fun b_lambda!17559 () Bool)

(assert (=> (not b_lambda!17559) (not b!1094302)))

(declare-fun t!33694 () Bool)

(declare-fun tb!7749 () Bool)

(assert (=> (and start!96462 (= defaultEntry!882 defaultEntry!882) t!33694) tb!7749))

(declare-fun result!16025 () Bool)

(assert (=> tb!7749 (= result!16025 tp_is_empty!26881)))

(assert (=> b!1094302 t!33694))

(declare-fun b_and!36445 () Bool)

(assert (= b_and!36443 (and (=> t!33694 result!16025) b_and!36445)))

(declare-fun m!1014467 () Bool)

(assert (=> b!1094304 m!1014467))

(declare-fun m!1014469 () Bool)

(assert (=> b!1094305 m!1014469))

(declare-fun m!1014471 () Bool)

(assert (=> b!1094313 m!1014471))

(declare-fun m!1014473 () Bool)

(assert (=> b!1094302 m!1014473))

(declare-fun m!1014475 () Bool)

(assert (=> b!1094302 m!1014475))

(declare-fun m!1014477 () Bool)

(assert (=> b!1094302 m!1014477))

(declare-fun m!1014479 () Bool)

(assert (=> b!1094302 m!1014479))

(declare-fun m!1014481 () Bool)

(assert (=> b!1094302 m!1014481))

(declare-fun m!1014483 () Bool)

(assert (=> b!1094302 m!1014483))

(declare-fun m!1014485 () Bool)

(assert (=> b!1094302 m!1014485))

(declare-fun m!1014487 () Bool)

(assert (=> b!1094302 m!1014487))

(declare-fun m!1014489 () Bool)

(assert (=> b!1094302 m!1014489))

(declare-fun m!1014491 () Bool)

(assert (=> b!1094302 m!1014491))

(declare-fun m!1014493 () Bool)

(assert (=> start!96462 m!1014493))

(declare-fun m!1014495 () Bool)

(assert (=> start!96462 m!1014495))

(declare-fun m!1014497 () Bool)

(assert (=> start!96462 m!1014497))

(declare-fun m!1014499 () Bool)

(assert (=> b!1094311 m!1014499))

(declare-fun m!1014501 () Bool)

(assert (=> b!1094312 m!1014501))

(declare-fun m!1014503 () Bool)

(assert (=> b!1094309 m!1014503))

(declare-fun m!1014505 () Bool)

(assert (=> b!1094309 m!1014505))

(declare-fun m!1014507 () Bool)

(assert (=> mapNonEmpty!42076 m!1014507))

(check-sat (not b_next!22879) (not b!1094305) (not b!1094313) (not b!1094312) (not b!1094304) (not b!1094309) (not b_lambda!17559) (not b!1094302) (not start!96462) tp_is_empty!26881 (not mapNonEmpty!42076) b_and!36445)
(check-sat b_and!36445 (not b_next!22879))
