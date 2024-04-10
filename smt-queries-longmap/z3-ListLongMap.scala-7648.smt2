; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96210 () Bool)

(assert start!96210)

(declare-fun b_free!22863 () Bool)

(declare-fun b_next!22863 () Bool)

(assert (=> start!96210 (= b_free!22863 (not b_next!22863))))

(declare-fun tp!80438 () Bool)

(declare-fun b_and!36401 () Bool)

(assert (=> start!96210 (= tp!80438 b_and!36401)))

(declare-fun b!1092671 () Bool)

(declare-fun e!623981 () Bool)

(declare-fun tp_is_empty!26865 () Bool)

(assert (=> b!1092671 (= e!623981 tp_is_empty!26865)))

(declare-fun b!1092672 () Bool)

(declare-fun res!729117 () Bool)

(declare-fun e!623983 () Bool)

(assert (=> b!1092672 (=> (not res!729117) (not e!623983))))

(declare-datatypes ((array!70649 0))(
  ( (array!70650 (arr!33998 (Array (_ BitVec 32) (_ BitVec 64))) (size!34534 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70649)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70649 (_ BitVec 32)) Bool)

(assert (=> b!1092672 (= res!729117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092673 () Bool)

(declare-fun res!729115 () Bool)

(assert (=> b!1092673 (=> (not res!729115) (not e!623983))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40947 0))(
  ( (V!40948 (val!13489 Int)) )
))
(declare-datatypes ((ValueCell!12723 0))(
  ( (ValueCellFull!12723 (v!16110 V!40947)) (EmptyCell!12723) )
))
(declare-datatypes ((array!70651 0))(
  ( (array!70652 (arr!33999 (Array (_ BitVec 32) ValueCell!12723)) (size!34535 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70651)

(assert (=> b!1092673 (= res!729115 (and (= (size!34535 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34534 _keys!1070) (size!34535 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092675 () Bool)

(declare-fun res!729109 () Bool)

(assert (=> b!1092675 (=> (not res!729109) (not e!623983))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092675 (= res!729109 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42052 () Bool)

(declare-fun mapRes!42052 () Bool)

(declare-fun tp!80437 () Bool)

(assert (=> mapNonEmpty!42052 (= mapRes!42052 (and tp!80437 e!623981))))

(declare-fun mapKey!42052 () (_ BitVec 32))

(declare-fun mapRest!42052 () (Array (_ BitVec 32) ValueCell!12723))

(declare-fun mapValue!42052 () ValueCell!12723)

(assert (=> mapNonEmpty!42052 (= (arr!33999 _values!874) (store mapRest!42052 mapKey!42052 mapValue!42052))))

(declare-fun b!1092676 () Bool)

(declare-fun e!623980 () Bool)

(declare-fun e!623984 () Bool)

(assert (=> b!1092676 (= e!623980 (and e!623984 mapRes!42052))))

(declare-fun condMapEmpty!42052 () Bool)

(declare-fun mapDefault!42052 () ValueCell!12723)

(assert (=> b!1092676 (= condMapEmpty!42052 (= (arr!33999 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12723)) mapDefault!42052)))))

(declare-fun b!1092677 () Bool)

(declare-fun e!623979 () Bool)

(assert (=> b!1092677 (= e!623983 e!623979)))

(declare-fun res!729112 () Bool)

(assert (=> b!1092677 (=> (not res!729112) (not e!623979))))

(declare-fun lt!488442 () array!70649)

(assert (=> b!1092677 (= res!729112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488442 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092677 (= lt!488442 (array!70650 (store (arr!33998 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34534 _keys!1070)))))

(declare-fun b!1092678 () Bool)

(declare-fun res!729113 () Bool)

(assert (=> b!1092678 (=> (not res!729113) (not e!623983))))

(declare-datatypes ((List!23751 0))(
  ( (Nil!23748) (Cons!23747 (h!24956 (_ BitVec 64)) (t!33672 List!23751)) )
))
(declare-fun arrayNoDuplicates!0 (array!70649 (_ BitVec 32) List!23751) Bool)

(assert (=> b!1092678 (= res!729113 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23748))))

(declare-fun b!1092674 () Bool)

(declare-fun res!729110 () Bool)

(assert (=> b!1092674 (=> (not res!729110) (not e!623983))))

(assert (=> b!1092674 (= res!729110 (= (select (arr!33998 _keys!1070) i!650) k0!904))))

(declare-fun res!729114 () Bool)

(assert (=> start!96210 (=> (not res!729114) (not e!623983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96210 (= res!729114 (validMask!0 mask!1414))))

(assert (=> start!96210 e!623983))

(assert (=> start!96210 tp!80438))

(assert (=> start!96210 true))

(assert (=> start!96210 tp_is_empty!26865))

(declare-fun array_inv!26210 (array!70649) Bool)

(assert (=> start!96210 (array_inv!26210 _keys!1070)))

(declare-fun array_inv!26211 (array!70651) Bool)

(assert (=> start!96210 (and (array_inv!26211 _values!874) e!623980)))

(declare-fun b!1092679 () Bool)

(declare-fun res!729111 () Bool)

(assert (=> b!1092679 (=> (not res!729111) (not e!623979))))

(assert (=> b!1092679 (= res!729111 (arrayNoDuplicates!0 lt!488442 #b00000000000000000000000000000000 Nil!23748))))

(declare-fun b!1092680 () Bool)

(assert (=> b!1092680 (= e!623979 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40947)

(declare-fun zeroValue!831 () V!40947)

(declare-datatypes ((tuple2!17166 0))(
  ( (tuple2!17167 (_1!8594 (_ BitVec 64)) (_2!8594 V!40947)) )
))
(declare-datatypes ((List!23752 0))(
  ( (Nil!23749) (Cons!23748 (h!24957 tuple2!17166) (t!33673 List!23752)) )
))
(declare-datatypes ((ListLongMap!15135 0))(
  ( (ListLongMap!15136 (toList!7583 List!23752)) )
))
(declare-fun lt!488445 () ListLongMap!15135)

(declare-fun getCurrentListMap!4339 (array!70649 array!70651 (_ BitVec 32) (_ BitVec 32) V!40947 V!40947 (_ BitVec 32) Int) ListLongMap!15135)

(assert (=> b!1092680 (= lt!488445 (getCurrentListMap!4339 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488449 () ListLongMap!15135)

(declare-fun lt!488444 () array!70651)

(assert (=> b!1092680 (= lt!488449 (getCurrentListMap!4339 lt!488442 lt!488444 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488447 () ListLongMap!15135)

(declare-fun lt!488441 () ListLongMap!15135)

(assert (=> b!1092680 (and (= lt!488447 lt!488441) (= lt!488441 lt!488447))))

(declare-fun lt!488446 () ListLongMap!15135)

(declare-fun -!902 (ListLongMap!15135 (_ BitVec 64)) ListLongMap!15135)

(assert (=> b!1092680 (= lt!488441 (-!902 lt!488446 k0!904))))

(declare-datatypes ((Unit!35970 0))(
  ( (Unit!35971) )
))
(declare-fun lt!488448 () Unit!35970)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!158 (array!70649 array!70651 (_ BitVec 32) (_ BitVec 32) V!40947 V!40947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35970)

(assert (=> b!1092680 (= lt!488448 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!158 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4099 (array!70649 array!70651 (_ BitVec 32) (_ BitVec 32) V!40947 V!40947 (_ BitVec 32) Int) ListLongMap!15135)

(assert (=> b!1092680 (= lt!488447 (getCurrentListMapNoExtraKeys!4099 lt!488442 lt!488444 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2236 (Int (_ BitVec 64)) V!40947)

(assert (=> b!1092680 (= lt!488444 (array!70652 (store (arr!33999 _values!874) i!650 (ValueCellFull!12723 (dynLambda!2236 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34535 _values!874)))))

(assert (=> b!1092680 (= lt!488446 (getCurrentListMapNoExtraKeys!4099 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092680 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488443 () Unit!35970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70649 (_ BitVec 64) (_ BitVec 32)) Unit!35970)

(assert (=> b!1092680 (= lt!488443 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092681 () Bool)

(assert (=> b!1092681 (= e!623984 tp_is_empty!26865)))

(declare-fun mapIsEmpty!42052 () Bool)

(assert (=> mapIsEmpty!42052 mapRes!42052))

(declare-fun b!1092682 () Bool)

(declare-fun res!729116 () Bool)

(assert (=> b!1092682 (=> (not res!729116) (not e!623983))))

(assert (=> b!1092682 (= res!729116 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34534 _keys!1070))))))

(assert (= (and start!96210 res!729114) b!1092673))

(assert (= (and b!1092673 res!729115) b!1092672))

(assert (= (and b!1092672 res!729117) b!1092678))

(assert (= (and b!1092678 res!729113) b!1092682))

(assert (= (and b!1092682 res!729116) b!1092675))

(assert (= (and b!1092675 res!729109) b!1092674))

(assert (= (and b!1092674 res!729110) b!1092677))

(assert (= (and b!1092677 res!729112) b!1092679))

(assert (= (and b!1092679 res!729111) b!1092680))

(assert (= (and b!1092676 condMapEmpty!42052) mapIsEmpty!42052))

(assert (= (and b!1092676 (not condMapEmpty!42052)) mapNonEmpty!42052))

(get-info :version)

(assert (= (and mapNonEmpty!42052 ((_ is ValueCellFull!12723) mapValue!42052)) b!1092671))

(assert (= (and b!1092676 ((_ is ValueCellFull!12723) mapDefault!42052)) b!1092681))

(assert (= start!96210 b!1092676))

(declare-fun b_lambda!17533 () Bool)

(assert (=> (not b_lambda!17533) (not b!1092680)))

(declare-fun t!33671 () Bool)

(declare-fun tb!7741 () Bool)

(assert (=> (and start!96210 (= defaultEntry!882 defaultEntry!882) t!33671) tb!7741))

(declare-fun result!16001 () Bool)

(assert (=> tb!7741 (= result!16001 tp_is_empty!26865)))

(assert (=> b!1092680 t!33671))

(declare-fun b_and!36403 () Bool)

(assert (= b_and!36401 (and (=> t!33671 result!16001) b_and!36403)))

(declare-fun m!1012459 () Bool)

(assert (=> start!96210 m!1012459))

(declare-fun m!1012461 () Bool)

(assert (=> start!96210 m!1012461))

(declare-fun m!1012463 () Bool)

(assert (=> start!96210 m!1012463))

(declare-fun m!1012465 () Bool)

(assert (=> b!1092674 m!1012465))

(declare-fun m!1012467 () Bool)

(assert (=> mapNonEmpty!42052 m!1012467))

(declare-fun m!1012469 () Bool)

(assert (=> b!1092675 m!1012469))

(declare-fun m!1012471 () Bool)

(assert (=> b!1092679 m!1012471))

(declare-fun m!1012473 () Bool)

(assert (=> b!1092672 m!1012473))

(declare-fun m!1012475 () Bool)

(assert (=> b!1092678 m!1012475))

(declare-fun m!1012477 () Bool)

(assert (=> b!1092680 m!1012477))

(declare-fun m!1012479 () Bool)

(assert (=> b!1092680 m!1012479))

(declare-fun m!1012481 () Bool)

(assert (=> b!1092680 m!1012481))

(declare-fun m!1012483 () Bool)

(assert (=> b!1092680 m!1012483))

(declare-fun m!1012485 () Bool)

(assert (=> b!1092680 m!1012485))

(declare-fun m!1012487 () Bool)

(assert (=> b!1092680 m!1012487))

(declare-fun m!1012489 () Bool)

(assert (=> b!1092680 m!1012489))

(declare-fun m!1012491 () Bool)

(assert (=> b!1092680 m!1012491))

(declare-fun m!1012493 () Bool)

(assert (=> b!1092680 m!1012493))

(declare-fun m!1012495 () Bool)

(assert (=> b!1092680 m!1012495))

(declare-fun m!1012497 () Bool)

(assert (=> b!1092677 m!1012497))

(declare-fun m!1012499 () Bool)

(assert (=> b!1092677 m!1012499))

(check-sat (not start!96210) b_and!36403 (not b_next!22863) (not mapNonEmpty!42052) (not b!1092680) (not b_lambda!17533) (not b!1092675) (not b!1092679) (not b!1092672) (not b!1092677) tp_is_empty!26865 (not b!1092678))
(check-sat b_and!36403 (not b_next!22863))
