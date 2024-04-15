; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96868 () Bool)

(assert start!96868)

(declare-fun b_free!23191 () Bool)

(declare-fun b_next!23191 () Bool)

(assert (=> start!96868 (= b_free!23191 (not b_next!23191))))

(declare-fun tp!81529 () Bool)

(declare-fun b_and!37159 () Bool)

(assert (=> start!96868 (= tp!81529 b_and!37159)))

(declare-fun b!1101919 () Bool)

(declare-fun e!628948 () Bool)

(declare-fun tp_is_empty!27241 () Bool)

(assert (=> b!1101919 (= e!628948 tp_is_empty!27241)))

(declare-fun b!1101920 () Bool)

(declare-fun e!628950 () Bool)

(declare-fun e!628951 () Bool)

(assert (=> b!1101920 (= e!628950 e!628951)))

(declare-fun res!735285 () Bool)

(assert (=> b!1101920 (=> (not res!735285) (not e!628951))))

(declare-datatypes ((array!71310 0))(
  ( (array!71311 (arr!34317 (Array (_ BitVec 32) (_ BitVec 64))) (size!34855 (_ BitVec 32))) )
))
(declare-fun lt!494127 () array!71310)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71310 (_ BitVec 32)) Bool)

(assert (=> b!1101920 (= res!735285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494127 mask!1414))))

(declare-fun _keys!1070 () array!71310)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101920 (= lt!494127 (array!71311 (store (arr!34317 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34855 _keys!1070)))))

(declare-fun b!1101921 () Bool)

(declare-fun res!735291 () Bool)

(assert (=> b!1101921 (=> (not res!735291) (not e!628950))))

(assert (=> b!1101921 (= res!735291 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34855 _keys!1070))))))

(declare-fun b!1101922 () Bool)

(declare-fun res!735293 () Bool)

(assert (=> b!1101922 (=> (not res!735293) (not e!628950))))

(assert (=> b!1101922 (= res!735293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101923 () Bool)

(declare-fun res!735290 () Bool)

(assert (=> b!1101923 (=> (not res!735290) (not e!628950))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41449 0))(
  ( (V!41450 (val!13677 Int)) )
))
(declare-datatypes ((ValueCell!12911 0))(
  ( (ValueCellFull!12911 (v!16307 V!41449)) (EmptyCell!12911) )
))
(declare-datatypes ((array!71312 0))(
  ( (array!71313 (arr!34318 (Array (_ BitVec 32) ValueCell!12911)) (size!34856 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71312)

(assert (=> b!1101923 (= res!735290 (and (= (size!34856 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34855 _keys!1070) (size!34856 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42652 () Bool)

(declare-fun mapRes!42652 () Bool)

(declare-fun tp!81530 () Bool)

(assert (=> mapNonEmpty!42652 (= mapRes!42652 (and tp!81530 e!628948))))

(declare-fun mapValue!42652 () ValueCell!12911)

(declare-fun mapRest!42652 () (Array (_ BitVec 32) ValueCell!12911))

(declare-fun mapKey!42652 () (_ BitVec 32))

(assert (=> mapNonEmpty!42652 (= (arr!34318 _values!874) (store mapRest!42652 mapKey!42652 mapValue!42652))))

(declare-fun b!1101925 () Bool)

(declare-fun e!628949 () Bool)

(assert (=> b!1101925 (= e!628949 tp_is_empty!27241)))

(declare-fun b!1101926 () Bool)

(declare-fun e!628947 () Bool)

(declare-fun e!628952 () Bool)

(assert (=> b!1101926 (= e!628947 e!628952)))

(declare-fun res!735286 () Bool)

(assert (=> b!1101926 (=> res!735286 e!628952)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1101926 (= res!735286 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17458 0))(
  ( (tuple2!17459 (_1!8740 (_ BitVec 64)) (_2!8740 V!41449)) )
))
(declare-datatypes ((List!24047 0))(
  ( (Nil!24044) (Cons!24043 (h!25252 tuple2!17458) (t!34275 List!24047)) )
))
(declare-datatypes ((ListLongMap!15427 0))(
  ( (ListLongMap!15428 (toList!7729 List!24047)) )
))
(declare-fun lt!494136 () ListLongMap!15427)

(declare-fun lt!494126 () ListLongMap!15427)

(assert (=> b!1101926 (= lt!494136 lt!494126)))

(declare-fun lt!494130 () ListLongMap!15427)

(declare-fun lt!494135 () tuple2!17458)

(declare-fun +!3439 (ListLongMap!15427 tuple2!17458) ListLongMap!15427)

(assert (=> b!1101926 (= lt!494126 (+!3439 lt!494130 lt!494135))))

(declare-fun lt!494128 () ListLongMap!15427)

(declare-fun lt!494133 () ListLongMap!15427)

(assert (=> b!1101926 (= lt!494128 lt!494133)))

(declare-fun lt!494137 () ListLongMap!15427)

(assert (=> b!1101926 (= lt!494133 (+!3439 lt!494137 lt!494135))))

(declare-fun lt!494138 () ListLongMap!15427)

(assert (=> b!1101926 (= lt!494128 (+!3439 lt!494138 lt!494135))))

(declare-fun minValue!831 () V!41449)

(assert (=> b!1101926 (= lt!494135 (tuple2!17459 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101927 () Bool)

(declare-fun res!735287 () Bool)

(assert (=> b!1101927 (=> (not res!735287) (not e!628951))))

(declare-datatypes ((List!24048 0))(
  ( (Nil!24045) (Cons!24044 (h!25253 (_ BitVec 64)) (t!34276 List!24048)) )
))
(declare-fun arrayNoDuplicates!0 (array!71310 (_ BitVec 32) List!24048) Bool)

(assert (=> b!1101927 (= res!735287 (arrayNoDuplicates!0 lt!494127 #b00000000000000000000000000000000 Nil!24045))))

(declare-fun b!1101928 () Bool)

(declare-fun res!735288 () Bool)

(assert (=> b!1101928 (=> (not res!735288) (not e!628950))))

(assert (=> b!1101928 (= res!735288 (= (select (arr!34317 _keys!1070) i!650) k0!904))))

(declare-fun b!1101929 () Bool)

(declare-fun res!735295 () Bool)

(assert (=> b!1101929 (=> (not res!735295) (not e!628950))))

(assert (=> b!1101929 (= res!735295 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24045))))

(declare-fun b!1101930 () Bool)

(declare-fun res!735289 () Bool)

(assert (=> b!1101930 (=> (not res!735289) (not e!628950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101930 (= res!735289 (validKeyInArray!0 k0!904))))

(declare-fun b!1101931 () Bool)

(assert (=> b!1101931 (= e!628951 (not e!628947))))

(declare-fun res!735294 () Bool)

(assert (=> b!1101931 (=> res!735294 e!628947)))

(assert (=> b!1101931 (= res!735294 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41449)

(declare-fun getCurrentListMap!4341 (array!71310 array!71312 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) Int) ListLongMap!15427)

(assert (=> b!1101931 (= lt!494136 (getCurrentListMap!4341 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494129 () array!71312)

(assert (=> b!1101931 (= lt!494128 (getCurrentListMap!4341 lt!494127 lt!494129 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1101931 (and (= lt!494138 lt!494137) (= lt!494137 lt!494138))))

(declare-fun -!956 (ListLongMap!15427 (_ BitVec 64)) ListLongMap!15427)

(assert (=> b!1101931 (= lt!494137 (-!956 lt!494130 k0!904))))

(declare-datatypes ((Unit!36039 0))(
  ( (Unit!36040) )
))
(declare-fun lt!494131 () Unit!36039)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!230 (array!71310 array!71312 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36039)

(assert (=> b!1101931 (= lt!494131 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!230 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4248 (array!71310 array!71312 (_ BitVec 32) (_ BitVec 32) V!41449 V!41449 (_ BitVec 32) Int) ListLongMap!15427)

(assert (=> b!1101931 (= lt!494138 (getCurrentListMapNoExtraKeys!4248 lt!494127 lt!494129 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2317 (Int (_ BitVec 64)) V!41449)

(assert (=> b!1101931 (= lt!494129 (array!71313 (store (arr!34318 _values!874) i!650 (ValueCellFull!12911 (dynLambda!2317 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34856 _values!874)))))

(assert (=> b!1101931 (= lt!494130 (getCurrentListMapNoExtraKeys!4248 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101931 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494132 () Unit!36039)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71310 (_ BitVec 64) (_ BitVec 32)) Unit!36039)

(assert (=> b!1101931 (= lt!494132 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!735292 () Bool)

(assert (=> start!96868 (=> (not res!735292) (not e!628950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96868 (= res!735292 (validMask!0 mask!1414))))

(assert (=> start!96868 e!628950))

(assert (=> start!96868 tp!81529))

(assert (=> start!96868 true))

(assert (=> start!96868 tp_is_empty!27241))

(declare-fun array_inv!26466 (array!71310) Bool)

(assert (=> start!96868 (array_inv!26466 _keys!1070)))

(declare-fun e!628953 () Bool)

(declare-fun array_inv!26467 (array!71312) Bool)

(assert (=> start!96868 (and (array_inv!26467 _values!874) e!628953)))

(declare-fun b!1101924 () Bool)

(assert (=> b!1101924 (= e!628952 (= (-!956 lt!494136 k0!904) lt!494128))))

(assert (=> b!1101924 (= (-!956 lt!494126 k0!904) lt!494133)))

(declare-fun lt!494134 () Unit!36039)

(declare-fun addRemoveCommutativeForDiffKeys!134 (ListLongMap!15427 (_ BitVec 64) V!41449 (_ BitVec 64)) Unit!36039)

(assert (=> b!1101924 (= lt!494134 (addRemoveCommutativeForDiffKeys!134 lt!494130 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1101932 () Bool)

(assert (=> b!1101932 (= e!628953 (and e!628949 mapRes!42652))))

(declare-fun condMapEmpty!42652 () Bool)

(declare-fun mapDefault!42652 () ValueCell!12911)

(assert (=> b!1101932 (= condMapEmpty!42652 (= (arr!34318 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12911)) mapDefault!42652)))))

(declare-fun mapIsEmpty!42652 () Bool)

(assert (=> mapIsEmpty!42652 mapRes!42652))

(assert (= (and start!96868 res!735292) b!1101923))

(assert (= (and b!1101923 res!735290) b!1101922))

(assert (= (and b!1101922 res!735293) b!1101929))

(assert (= (and b!1101929 res!735295) b!1101921))

(assert (= (and b!1101921 res!735291) b!1101930))

(assert (= (and b!1101930 res!735289) b!1101928))

(assert (= (and b!1101928 res!735288) b!1101920))

(assert (= (and b!1101920 res!735285) b!1101927))

(assert (= (and b!1101927 res!735287) b!1101931))

(assert (= (and b!1101931 (not res!735294)) b!1101926))

(assert (= (and b!1101926 (not res!735286)) b!1101924))

(assert (= (and b!1101932 condMapEmpty!42652) mapIsEmpty!42652))

(assert (= (and b!1101932 (not condMapEmpty!42652)) mapNonEmpty!42652))

(get-info :version)

(assert (= (and mapNonEmpty!42652 ((_ is ValueCellFull!12911) mapValue!42652)) b!1101919))

(assert (= (and b!1101932 ((_ is ValueCellFull!12911) mapDefault!42652)) b!1101925))

(assert (= start!96868 b!1101932))

(declare-fun b_lambda!18127 () Bool)

(assert (=> (not b_lambda!18127) (not b!1101931)))

(declare-fun t!34274 () Bool)

(declare-fun tb!8049 () Bool)

(assert (=> (and start!96868 (= defaultEntry!882 defaultEntry!882) t!34274) tb!8049))

(declare-fun result!16649 () Bool)

(assert (=> tb!8049 (= result!16649 tp_is_empty!27241)))

(assert (=> b!1101931 t!34274))

(declare-fun b_and!37161 () Bool)

(assert (= b_and!37159 (and (=> t!34274 result!16649) b_and!37161)))

(declare-fun m!1021703 () Bool)

(assert (=> b!1101931 m!1021703))

(declare-fun m!1021705 () Bool)

(assert (=> b!1101931 m!1021705))

(declare-fun m!1021707 () Bool)

(assert (=> b!1101931 m!1021707))

(declare-fun m!1021709 () Bool)

(assert (=> b!1101931 m!1021709))

(declare-fun m!1021711 () Bool)

(assert (=> b!1101931 m!1021711))

(declare-fun m!1021713 () Bool)

(assert (=> b!1101931 m!1021713))

(declare-fun m!1021715 () Bool)

(assert (=> b!1101931 m!1021715))

(declare-fun m!1021717 () Bool)

(assert (=> b!1101931 m!1021717))

(declare-fun m!1021719 () Bool)

(assert (=> b!1101931 m!1021719))

(declare-fun m!1021721 () Bool)

(assert (=> b!1101931 m!1021721))

(declare-fun m!1021723 () Bool)

(assert (=> b!1101930 m!1021723))

(declare-fun m!1021725 () Bool)

(assert (=> b!1101926 m!1021725))

(declare-fun m!1021727 () Bool)

(assert (=> b!1101926 m!1021727))

(declare-fun m!1021729 () Bool)

(assert (=> b!1101926 m!1021729))

(declare-fun m!1021731 () Bool)

(assert (=> b!1101924 m!1021731))

(declare-fun m!1021733 () Bool)

(assert (=> b!1101924 m!1021733))

(declare-fun m!1021735 () Bool)

(assert (=> b!1101924 m!1021735))

(declare-fun m!1021737 () Bool)

(assert (=> b!1101929 m!1021737))

(declare-fun m!1021739 () Bool)

(assert (=> b!1101927 m!1021739))

(declare-fun m!1021741 () Bool)

(assert (=> start!96868 m!1021741))

(declare-fun m!1021743 () Bool)

(assert (=> start!96868 m!1021743))

(declare-fun m!1021745 () Bool)

(assert (=> start!96868 m!1021745))

(declare-fun m!1021747 () Bool)

(assert (=> mapNonEmpty!42652 m!1021747))

(declare-fun m!1021749 () Bool)

(assert (=> b!1101922 m!1021749))

(declare-fun m!1021751 () Bool)

(assert (=> b!1101928 m!1021751))

(declare-fun m!1021753 () Bool)

(assert (=> b!1101920 m!1021753))

(declare-fun m!1021755 () Bool)

(assert (=> b!1101920 m!1021755))

(check-sat tp_is_empty!27241 (not b!1101929) (not b!1101926) (not mapNonEmpty!42652) (not b_lambda!18127) (not b!1101924) b_and!37161 (not b!1101922) (not b!1101920) (not start!96868) (not b_next!23191) (not b!1101931) (not b!1101927) (not b!1101930))
(check-sat b_and!37161 (not b_next!23191))
