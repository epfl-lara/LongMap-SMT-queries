; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96462 () Bool)

(assert start!96462)

(declare-fun b_free!23047 () Bool)

(declare-fun b_next!23047 () Bool)

(assert (=> start!96462 (= b_free!23047 (not b_next!23047))))

(declare-fun tp!81067 () Bool)

(declare-fun b_and!36731 () Bool)

(assert (=> start!96462 (= tp!81067 b_and!36731)))

(declare-fun b!1096825 () Bool)

(declare-fun res!732087 () Bool)

(declare-fun e!626022 () Bool)

(assert (=> b!1096825 (=> (not res!732087) (not e!626022))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71014 0))(
  ( (array!71015 (arr!34179 (Array (_ BitVec 32) (_ BitVec 64))) (size!34717 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71014)

(assert (=> b!1096825 (= res!732087 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34717 _keys!1070))))))

(declare-fun mapNonEmpty!42406 () Bool)

(declare-fun mapRes!42406 () Bool)

(declare-fun tp!81068 () Bool)

(declare-fun e!626024 () Bool)

(assert (=> mapNonEmpty!42406 (= mapRes!42406 (and tp!81068 e!626024))))

(declare-datatypes ((V!41257 0))(
  ( (V!41258 (val!13605 Int)) )
))
(declare-datatypes ((ValueCell!12839 0))(
  ( (ValueCellFull!12839 (v!16225 V!41257)) (EmptyCell!12839) )
))
(declare-datatypes ((array!71016 0))(
  ( (array!71017 (arr!34180 (Array (_ BitVec 32) ValueCell!12839)) (size!34718 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71016)

(declare-fun mapValue!42406 () ValueCell!12839)

(declare-fun mapRest!42406 () (Array (_ BitVec 32) ValueCell!12839))

(declare-fun mapKey!42406 () (_ BitVec 32))

(assert (=> mapNonEmpty!42406 (= (arr!34180 _values!874) (store mapRest!42406 mapKey!42406 mapValue!42406))))

(declare-fun b!1096826 () Bool)

(declare-fun e!626025 () Bool)

(declare-fun e!626023 () Bool)

(assert (=> b!1096826 (= e!626025 (and e!626023 mapRes!42406))))

(declare-fun condMapEmpty!42406 () Bool)

(declare-fun mapDefault!42406 () ValueCell!12839)

(assert (=> b!1096826 (= condMapEmpty!42406 (= (arr!34180 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12839)) mapDefault!42406)))))

(declare-fun b!1096827 () Bool)

(declare-fun res!732083 () Bool)

(assert (=> b!1096827 (=> (not res!732083) (not e!626022))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096827 (= res!732083 (and (= (size!34718 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34717 _keys!1070) (size!34718 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096828 () Bool)

(declare-fun res!732088 () Bool)

(assert (=> b!1096828 (=> (not res!732088) (not e!626022))))

(declare-datatypes ((List!23934 0))(
  ( (Nil!23931) (Cons!23930 (h!25139 (_ BitVec 64)) (t!34018 List!23934)) )
))
(declare-fun arrayNoDuplicates!0 (array!71014 (_ BitVec 32) List!23934) Bool)

(assert (=> b!1096828 (= res!732088 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23931))))

(declare-fun b!1096829 () Bool)

(declare-fun res!732090 () Bool)

(declare-fun e!626021 () Bool)

(assert (=> b!1096829 (=> (not res!732090) (not e!626021))))

(declare-fun lt!490127 () array!71014)

(assert (=> b!1096829 (= res!732090 (arrayNoDuplicates!0 lt!490127 #b00000000000000000000000000000000 Nil!23931))))

(declare-fun b!1096830 () Bool)

(declare-fun res!732089 () Bool)

(assert (=> b!1096830 (=> (not res!732089) (not e!626022))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096830 (= res!732089 (validKeyInArray!0 k0!904))))

(declare-fun b!1096831 () Bool)

(declare-fun tp_is_empty!27097 () Bool)

(assert (=> b!1096831 (= e!626023 tp_is_empty!27097)))

(declare-fun res!732085 () Bool)

(assert (=> start!96462 (=> (not res!732085) (not e!626022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96462 (= res!732085 (validMask!0 mask!1414))))

(assert (=> start!96462 e!626022))

(assert (=> start!96462 tp!81067))

(assert (=> start!96462 true))

(assert (=> start!96462 tp_is_empty!27097))

(declare-fun array_inv!26370 (array!71014) Bool)

(assert (=> start!96462 (array_inv!26370 _keys!1070)))

(declare-fun array_inv!26371 (array!71016) Bool)

(assert (=> start!96462 (and (array_inv!26371 _values!874) e!626025)))

(declare-fun b!1096832 () Bool)

(assert (=> b!1096832 (= e!626024 tp_is_empty!27097)))

(declare-fun b!1096833 () Bool)

(declare-datatypes ((tuple2!17342 0))(
  ( (tuple2!17343 (_1!8682 (_ BitVec 64)) (_2!8682 V!41257)) )
))
(declare-datatypes ((List!23935 0))(
  ( (Nil!23932) (Cons!23931 (h!25140 tuple2!17342) (t!34019 List!23935)) )
))
(declare-datatypes ((ListLongMap!15311 0))(
  ( (ListLongMap!15312 (toList!7671 List!23935)) )
))
(declare-fun lt!490126 () ListLongMap!15311)

(declare-fun lt!490124 () ListLongMap!15311)

(assert (=> b!1096833 (= e!626021 (not (= lt!490126 lt!490124)))))

(assert (=> b!1096833 (= lt!490124 lt!490126)))

(declare-fun lt!490125 () ListLongMap!15311)

(declare-fun -!911 (ListLongMap!15311 (_ BitVec 64)) ListLongMap!15311)

(assert (=> b!1096833 (= lt!490126 (-!911 lt!490125 k0!904))))

(declare-fun minValue!831 () V!41257)

(declare-fun zeroValue!831 () V!41257)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((Unit!35929 0))(
  ( (Unit!35930) )
))
(declare-fun lt!490122 () Unit!35929)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!186 (array!71014 array!71016 (_ BitVec 32) (_ BitVec 32) V!41257 V!41257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35929)

(assert (=> b!1096833 (= lt!490122 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!186 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4204 (array!71014 array!71016 (_ BitVec 32) (_ BitVec 32) V!41257 V!41257 (_ BitVec 32) Int) ListLongMap!15311)

(declare-fun dynLambda!2273 (Int (_ BitVec 64)) V!41257)

(assert (=> b!1096833 (= lt!490124 (getCurrentListMapNoExtraKeys!4204 lt!490127 (array!71017 (store (arr!34180 _values!874) i!650 (ValueCellFull!12839 (dynLambda!2273 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34718 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1096833 (= lt!490125 (getCurrentListMapNoExtraKeys!4204 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096833 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490123 () Unit!35929)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71014 (_ BitVec 64) (_ BitVec 32)) Unit!35929)

(assert (=> b!1096833 (= lt!490123 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096834 () Bool)

(declare-fun res!732084 () Bool)

(assert (=> b!1096834 (=> (not res!732084) (not e!626022))))

(assert (=> b!1096834 (= res!732084 (= (select (arr!34179 _keys!1070) i!650) k0!904))))

(declare-fun b!1096835 () Bool)

(declare-fun res!732091 () Bool)

(assert (=> b!1096835 (=> (not res!732091) (not e!626022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71014 (_ BitVec 32)) Bool)

(assert (=> b!1096835 (= res!732091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42406 () Bool)

(assert (=> mapIsEmpty!42406 mapRes!42406))

(declare-fun b!1096836 () Bool)

(assert (=> b!1096836 (= e!626022 e!626021)))

(declare-fun res!732086 () Bool)

(assert (=> b!1096836 (=> (not res!732086) (not e!626021))))

(assert (=> b!1096836 (= res!732086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490127 mask!1414))))

(assert (=> b!1096836 (= lt!490127 (array!71015 (store (arr!34179 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34717 _keys!1070)))))

(assert (= (and start!96462 res!732085) b!1096827))

(assert (= (and b!1096827 res!732083) b!1096835))

(assert (= (and b!1096835 res!732091) b!1096828))

(assert (= (and b!1096828 res!732088) b!1096825))

(assert (= (and b!1096825 res!732087) b!1096830))

(assert (= (and b!1096830 res!732089) b!1096834))

(assert (= (and b!1096834 res!732084) b!1096836))

(assert (= (and b!1096836 res!732086) b!1096829))

(assert (= (and b!1096829 res!732090) b!1096833))

(assert (= (and b!1096826 condMapEmpty!42406) mapIsEmpty!42406))

(assert (= (and b!1096826 (not condMapEmpty!42406)) mapNonEmpty!42406))

(get-info :version)

(assert (= (and mapNonEmpty!42406 ((_ is ValueCellFull!12839) mapValue!42406)) b!1096832))

(assert (= (and b!1096826 ((_ is ValueCellFull!12839) mapDefault!42406)) b!1096831))

(assert (= start!96462 b!1096826))

(declare-fun b_lambda!17683 () Bool)

(assert (=> (not b_lambda!17683) (not b!1096833)))

(declare-fun t!34017 () Bool)

(declare-fun tb!7905 () Bool)

(assert (=> (and start!96462 (= defaultEntry!882 defaultEntry!882) t!34017) tb!7905))

(declare-fun result!16341 () Bool)

(assert (=> tb!7905 (= result!16341 tp_is_empty!27097)))

(assert (=> b!1096833 t!34017))

(declare-fun b_and!36733 () Bool)

(assert (= b_and!36731 (and (=> t!34017 result!16341) b_and!36733)))

(declare-fun m!1015827 () Bool)

(assert (=> b!1096834 m!1015827))

(declare-fun m!1015829 () Bool)

(assert (=> b!1096835 m!1015829))

(declare-fun m!1015831 () Bool)

(assert (=> b!1096836 m!1015831))

(declare-fun m!1015833 () Bool)

(assert (=> b!1096836 m!1015833))

(declare-fun m!1015835 () Bool)

(assert (=> b!1096828 m!1015835))

(declare-fun m!1015837 () Bool)

(assert (=> b!1096830 m!1015837))

(declare-fun m!1015839 () Bool)

(assert (=> b!1096833 m!1015839))

(declare-fun m!1015841 () Bool)

(assert (=> b!1096833 m!1015841))

(declare-fun m!1015843 () Bool)

(assert (=> b!1096833 m!1015843))

(declare-fun m!1015845 () Bool)

(assert (=> b!1096833 m!1015845))

(declare-fun m!1015847 () Bool)

(assert (=> b!1096833 m!1015847))

(declare-fun m!1015849 () Bool)

(assert (=> b!1096833 m!1015849))

(declare-fun m!1015851 () Bool)

(assert (=> b!1096833 m!1015851))

(declare-fun m!1015853 () Bool)

(assert (=> b!1096833 m!1015853))

(declare-fun m!1015855 () Bool)

(assert (=> start!96462 m!1015855))

(declare-fun m!1015857 () Bool)

(assert (=> start!96462 m!1015857))

(declare-fun m!1015859 () Bool)

(assert (=> start!96462 m!1015859))

(declare-fun m!1015861 () Bool)

(assert (=> mapNonEmpty!42406 m!1015861))

(declare-fun m!1015863 () Bool)

(assert (=> b!1096829 m!1015863))

(check-sat (not mapNonEmpty!42406) (not b_lambda!17683) (not b!1096828) (not b!1096836) (not b!1096833) (not b!1096835) (not start!96462) tp_is_empty!27097 (not b_next!23047) (not b!1096830) b_and!36733 (not b!1096829))
(check-sat b_and!36733 (not b_next!23047))
