; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96438 () Bool)

(assert start!96438)

(declare-fun b_free!22855 () Bool)

(declare-fun b_next!22855 () Bool)

(assert (=> start!96438 (= b_free!22855 (not b_next!22855))))

(declare-fun tp!80414 () Bool)

(declare-fun b_and!36395 () Bool)

(assert (=> start!96438 (= tp!80414 b_and!36395)))

(declare-fun b!1093846 () Bool)

(declare-fun res!729527 () Bool)

(declare-fun e!624766 () Bool)

(assert (=> b!1093846 (=> (not res!729527) (not e!624766))))

(declare-datatypes ((array!70663 0))(
  ( (array!70664 (arr!33999 (Array (_ BitVec 32) (_ BitVec 64))) (size!34536 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70663)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093846 (= res!729527 (= (select (arr!33999 _keys!1070) i!650) k0!904))))

(declare-fun b!1093847 () Bool)

(declare-fun e!624763 () Bool)

(declare-fun e!624765 () Bool)

(declare-fun mapRes!42040 () Bool)

(assert (=> b!1093847 (= e!624763 (and e!624765 mapRes!42040))))

(declare-fun condMapEmpty!42040 () Bool)

(declare-datatypes ((V!40937 0))(
  ( (V!40938 (val!13485 Int)) )
))
(declare-datatypes ((ValueCell!12719 0))(
  ( (ValueCellFull!12719 (v!16102 V!40937)) (EmptyCell!12719) )
))
(declare-datatypes ((array!70665 0))(
  ( (array!70666 (arr!34000 (Array (_ BitVec 32) ValueCell!12719)) (size!34537 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70665)

(declare-fun mapDefault!42040 () ValueCell!12719)

(assert (=> b!1093847 (= condMapEmpty!42040 (= (arr!34000 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12719)) mapDefault!42040)))))

(declare-fun b!1093848 () Bool)

(declare-fun tp_is_empty!26857 () Bool)

(assert (=> b!1093848 (= e!624765 tp_is_empty!26857)))

(declare-fun mapIsEmpty!42040 () Bool)

(assert (=> mapIsEmpty!42040 mapRes!42040))

(declare-fun b!1093849 () Bool)

(declare-fun e!624762 () Bool)

(assert (=> b!1093849 (= e!624766 e!624762)))

(declare-fun res!729525 () Bool)

(assert (=> b!1093849 (=> (not res!729525) (not e!624762))))

(declare-fun lt!488848 () array!70663)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70663 (_ BitVec 32)) Bool)

(assert (=> b!1093849 (= res!729525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488848 mask!1414))))

(assert (=> b!1093849 (= lt!488848 (array!70664 (store (arr!33999 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34536 _keys!1070)))))

(declare-fun b!1093850 () Bool)

(declare-fun res!729531 () Bool)

(assert (=> b!1093850 (=> (not res!729531) (not e!624762))))

(declare-datatypes ((List!23752 0))(
  ( (Nil!23749) (Cons!23748 (h!24966 (_ BitVec 64)) (t!33657 List!23752)) )
))
(declare-fun arrayNoDuplicates!0 (array!70663 (_ BitVec 32) List!23752) Bool)

(assert (=> b!1093850 (= res!729531 (arrayNoDuplicates!0 lt!488848 #b00000000000000000000000000000000 Nil!23749))))

(declare-fun b!1093851 () Bool)

(declare-fun res!729526 () Bool)

(assert (=> b!1093851 (=> (not res!729526) (not e!624766))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093851 (= res!729526 (and (= (size!34537 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34536 _keys!1070) (size!34537 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093852 () Bool)

(declare-fun e!624764 () Bool)

(assert (=> b!1093852 (= e!624764 tp_is_empty!26857)))

(declare-fun b!1093853 () Bool)

(declare-fun res!729529 () Bool)

(assert (=> b!1093853 (=> (not res!729529) (not e!624766))))

(assert (=> b!1093853 (= res!729529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!729528 () Bool)

(assert (=> start!96438 (=> (not res!729528) (not e!624766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96438 (= res!729528 (validMask!0 mask!1414))))

(assert (=> start!96438 e!624766))

(assert (=> start!96438 tp!80414))

(assert (=> start!96438 true))

(assert (=> start!96438 tp_is_empty!26857))

(declare-fun array_inv!26248 (array!70663) Bool)

(assert (=> start!96438 (array_inv!26248 _keys!1070)))

(declare-fun array_inv!26249 (array!70665) Bool)

(assert (=> start!96438 (and (array_inv!26249 _values!874) e!624763)))

(declare-fun mapNonEmpty!42040 () Bool)

(declare-fun tp!80413 () Bool)

(assert (=> mapNonEmpty!42040 (= mapRes!42040 (and tp!80413 e!624764))))

(declare-fun mapValue!42040 () ValueCell!12719)

(declare-fun mapRest!42040 () (Array (_ BitVec 32) ValueCell!12719))

(declare-fun mapKey!42040 () (_ BitVec 32))

(assert (=> mapNonEmpty!42040 (= (arr!34000 _values!874) (store mapRest!42040 mapKey!42040 mapValue!42040))))

(declare-fun b!1093854 () Bool)

(declare-fun res!729524 () Bool)

(assert (=> b!1093854 (=> (not res!729524) (not e!624766))))

(assert (=> b!1093854 (= res!729524 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34536 _keys!1070))))))

(declare-fun b!1093855 () Bool)

(declare-fun res!729523 () Bool)

(assert (=> b!1093855 (=> (not res!729523) (not e!624766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093855 (= res!729523 (validKeyInArray!0 k0!904))))

(declare-fun b!1093856 () Bool)

(assert (=> b!1093856 (= e!624762 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40937)

(declare-datatypes ((tuple2!17162 0))(
  ( (tuple2!17163 (_1!8592 (_ BitVec 64)) (_2!8592 V!40937)) )
))
(declare-datatypes ((List!23753 0))(
  ( (Nil!23750) (Cons!23749 (h!24967 tuple2!17162) (t!33658 List!23753)) )
))
(declare-datatypes ((ListLongMap!15139 0))(
  ( (ListLongMap!15140 (toList!7585 List!23753)) )
))
(declare-fun lt!488853 () ListLongMap!15139)

(declare-fun zeroValue!831 () V!40937)

(declare-fun getCurrentListMap!4333 (array!70663 array!70665 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) Int) ListLongMap!15139)

(assert (=> b!1093856 (= lt!488853 (getCurrentListMap!4333 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488849 () array!70665)

(declare-fun lt!488854 () ListLongMap!15139)

(assert (=> b!1093856 (= lt!488854 (getCurrentListMap!4333 lt!488848 lt!488849 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488856 () ListLongMap!15139)

(declare-fun lt!488855 () ListLongMap!15139)

(assert (=> b!1093856 (and (= lt!488856 lt!488855) (= lt!488855 lt!488856))))

(declare-fun lt!488850 () ListLongMap!15139)

(declare-fun -!890 (ListLongMap!15139 (_ BitVec 64)) ListLongMap!15139)

(assert (=> b!1093856 (= lt!488855 (-!890 lt!488850 k0!904))))

(declare-datatypes ((Unit!35947 0))(
  ( (Unit!35948) )
))
(declare-fun lt!488851 () Unit!35947)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!162 (array!70663 array!70665 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35947)

(assert (=> b!1093856 (= lt!488851 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4138 (array!70663 array!70665 (_ BitVec 32) (_ BitVec 32) V!40937 V!40937 (_ BitVec 32) Int) ListLongMap!15139)

(assert (=> b!1093856 (= lt!488856 (getCurrentListMapNoExtraKeys!4138 lt!488848 lt!488849 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2259 (Int (_ BitVec 64)) V!40937)

(assert (=> b!1093856 (= lt!488849 (array!70666 (store (arr!34000 _values!874) i!650 (ValueCellFull!12719 (dynLambda!2259 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34537 _values!874)))))

(assert (=> b!1093856 (= lt!488850 (getCurrentListMapNoExtraKeys!4138 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093856 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488852 () Unit!35947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70663 (_ BitVec 64) (_ BitVec 32)) Unit!35947)

(assert (=> b!1093856 (= lt!488852 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093857 () Bool)

(declare-fun res!729530 () Bool)

(assert (=> b!1093857 (=> (not res!729530) (not e!624766))))

(assert (=> b!1093857 (= res!729530 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23749))))

(assert (= (and start!96438 res!729528) b!1093851))

(assert (= (and b!1093851 res!729526) b!1093853))

(assert (= (and b!1093853 res!729529) b!1093857))

(assert (= (and b!1093857 res!729530) b!1093854))

(assert (= (and b!1093854 res!729524) b!1093855))

(assert (= (and b!1093855 res!729523) b!1093846))

(assert (= (and b!1093846 res!729527) b!1093849))

(assert (= (and b!1093849 res!729525) b!1093850))

(assert (= (and b!1093850 res!729531) b!1093856))

(assert (= (and b!1093847 condMapEmpty!42040) mapIsEmpty!42040))

(assert (= (and b!1093847 (not condMapEmpty!42040)) mapNonEmpty!42040))

(get-info :version)

(assert (= (and mapNonEmpty!42040 ((_ is ValueCellFull!12719) mapValue!42040)) b!1093852))

(assert (= (and b!1093847 ((_ is ValueCellFull!12719) mapDefault!42040)) b!1093848))

(assert (= start!96438 b!1093847))

(declare-fun b_lambda!17535 () Bool)

(assert (=> (not b_lambda!17535) (not b!1093856)))

(declare-fun t!33656 () Bool)

(declare-fun tb!7725 () Bool)

(assert (=> (and start!96438 (= defaultEntry!882 defaultEntry!882) t!33656) tb!7725))

(declare-fun result!15977 () Bool)

(assert (=> tb!7725 (= result!15977 tp_is_empty!26857)))

(assert (=> b!1093856 t!33656))

(declare-fun b_and!36397 () Bool)

(assert (= b_and!36395 (and (=> t!33656 result!15977) b_and!36397)))

(declare-fun m!1013963 () Bool)

(assert (=> b!1093856 m!1013963))

(declare-fun m!1013965 () Bool)

(assert (=> b!1093856 m!1013965))

(declare-fun m!1013967 () Bool)

(assert (=> b!1093856 m!1013967))

(declare-fun m!1013969 () Bool)

(assert (=> b!1093856 m!1013969))

(declare-fun m!1013971 () Bool)

(assert (=> b!1093856 m!1013971))

(declare-fun m!1013973 () Bool)

(assert (=> b!1093856 m!1013973))

(declare-fun m!1013975 () Bool)

(assert (=> b!1093856 m!1013975))

(declare-fun m!1013977 () Bool)

(assert (=> b!1093856 m!1013977))

(declare-fun m!1013979 () Bool)

(assert (=> b!1093856 m!1013979))

(declare-fun m!1013981 () Bool)

(assert (=> b!1093856 m!1013981))

(declare-fun m!1013983 () Bool)

(assert (=> b!1093857 m!1013983))

(declare-fun m!1013985 () Bool)

(assert (=> mapNonEmpty!42040 m!1013985))

(declare-fun m!1013987 () Bool)

(assert (=> b!1093853 m!1013987))

(declare-fun m!1013989 () Bool)

(assert (=> start!96438 m!1013989))

(declare-fun m!1013991 () Bool)

(assert (=> start!96438 m!1013991))

(declare-fun m!1013993 () Bool)

(assert (=> start!96438 m!1013993))

(declare-fun m!1013995 () Bool)

(assert (=> b!1093849 m!1013995))

(declare-fun m!1013997 () Bool)

(assert (=> b!1093849 m!1013997))

(declare-fun m!1013999 () Bool)

(assert (=> b!1093855 m!1013999))

(declare-fun m!1014001 () Bool)

(assert (=> b!1093850 m!1014001))

(declare-fun m!1014003 () Bool)

(assert (=> b!1093846 m!1014003))

(check-sat (not mapNonEmpty!42040) (not b!1093855) (not b!1093849) (not start!96438) b_and!36397 (not b!1093853) (not b!1093856) (not b_lambda!17535) (not b!1093850) tp_is_empty!26857 (not b_next!22855) (not b!1093857))
(check-sat b_and!36397 (not b_next!22855))
