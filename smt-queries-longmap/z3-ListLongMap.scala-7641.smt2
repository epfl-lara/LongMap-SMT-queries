; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96402 () Bool)

(assert start!96402)

(declare-fun b_free!22819 () Bool)

(declare-fun b_next!22819 () Bool)

(assert (=> start!96402 (= b_free!22819 (not b_next!22819))))

(declare-fun tp!80306 () Bool)

(declare-fun b_and!36323 () Bool)

(assert (=> start!96402 (= tp!80306 b_and!36323)))

(declare-fun b!1093094 () Bool)

(declare-fun e!624372 () Bool)

(declare-fun e!624371 () Bool)

(assert (=> b!1093094 (= e!624372 (not e!624371))))

(declare-fun res!728970 () Bool)

(assert (=> b!1093094 (=> res!728970 e!624371)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093094 (= res!728970 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40889 0))(
  ( (V!40890 (val!13467 Int)) )
))
(declare-fun minValue!831 () V!40889)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17132 0))(
  ( (tuple2!17133 (_1!8577 (_ BitVec 64)) (_2!8577 V!40889)) )
))
(declare-datatypes ((List!23724 0))(
  ( (Nil!23721) (Cons!23720 (h!24938 tuple2!17132) (t!33593 List!23724)) )
))
(declare-datatypes ((ListLongMap!15109 0))(
  ( (ListLongMap!15110 (toList!7570 List!23724)) )
))
(declare-fun lt!488233 () ListLongMap!15109)

(declare-fun zeroValue!831 () V!40889)

(declare-datatypes ((array!70595 0))(
  ( (array!70596 (arr!33965 (Array (_ BitVec 32) (_ BitVec 64))) (size!34502 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70595)

(declare-datatypes ((ValueCell!12701 0))(
  ( (ValueCellFull!12701 (v!16084 V!40889)) (EmptyCell!12701) )
))
(declare-datatypes ((array!70597 0))(
  ( (array!70598 (arr!33966 (Array (_ BitVec 32) ValueCell!12701)) (size!34503 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70597)

(declare-fun getCurrentListMap!4319 (array!70595 array!70597 (_ BitVec 32) (_ BitVec 32) V!40889 V!40889 (_ BitVec 32) Int) ListLongMap!15109)

(assert (=> b!1093094 (= lt!488233 (getCurrentListMap!4319 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488227 () ListLongMap!15109)

(declare-fun lt!488231 () array!70597)

(declare-fun lt!488236 () array!70595)

(assert (=> b!1093094 (= lt!488227 (getCurrentListMap!4319 lt!488236 lt!488231 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488235 () ListLongMap!15109)

(declare-fun lt!488226 () ListLongMap!15109)

(assert (=> b!1093094 (and (= lt!488235 lt!488226) (= lt!488226 lt!488235))))

(declare-fun lt!488232 () ListLongMap!15109)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!875 (ListLongMap!15109 (_ BitVec 64)) ListLongMap!15109)

(assert (=> b!1093094 (= lt!488226 (-!875 lt!488232 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35917 0))(
  ( (Unit!35918) )
))
(declare-fun lt!488229 () Unit!35917)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!148 (array!70595 array!70597 (_ BitVec 32) (_ BitVec 32) V!40889 V!40889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35917)

(assert (=> b!1093094 (= lt!488229 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!148 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4124 (array!70595 array!70597 (_ BitVec 32) (_ BitVec 32) V!40889 V!40889 (_ BitVec 32) Int) ListLongMap!15109)

(assert (=> b!1093094 (= lt!488235 (getCurrentListMapNoExtraKeys!4124 lt!488236 lt!488231 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2245 (Int (_ BitVec 64)) V!40889)

(assert (=> b!1093094 (= lt!488231 (array!70598 (store (arr!33966 _values!874) i!650 (ValueCellFull!12701 (dynLambda!2245 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34503 _values!874)))))

(assert (=> b!1093094 (= lt!488232 (getCurrentListMapNoExtraKeys!4124 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093094 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488234 () Unit!35917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70595 (_ BitVec 64) (_ BitVec 32)) Unit!35917)

(assert (=> b!1093094 (= lt!488234 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093095 () Bool)

(declare-fun res!728978 () Bool)

(assert (=> b!1093095 (=> (not res!728978) (not e!624372))))

(declare-datatypes ((List!23725 0))(
  ( (Nil!23722) (Cons!23721 (h!24939 (_ BitVec 64)) (t!33594 List!23725)) )
))
(declare-fun arrayNoDuplicates!0 (array!70595 (_ BitVec 32) List!23725) Bool)

(assert (=> b!1093095 (= res!728978 (arrayNoDuplicates!0 lt!488236 #b00000000000000000000000000000000 Nil!23722))))

(declare-fun b!1093096 () Bool)

(declare-fun res!728969 () Bool)

(declare-fun e!624370 () Bool)

(assert (=> b!1093096 (=> (not res!728969) (not e!624370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70595 (_ BitVec 32)) Bool)

(assert (=> b!1093096 (= res!728969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093097 () Bool)

(declare-fun res!728974 () Bool)

(assert (=> b!1093097 (=> (not res!728974) (not e!624370))))

(assert (=> b!1093097 (= res!728974 (and (= (size!34503 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34502 _keys!1070) (size!34503 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093098 () Bool)

(assert (=> b!1093098 (= e!624370 e!624372)))

(declare-fun res!728975 () Bool)

(assert (=> b!1093098 (=> (not res!728975) (not e!624372))))

(assert (=> b!1093098 (= res!728975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488236 mask!1414))))

(assert (=> b!1093098 (= lt!488236 (array!70596 (store (arr!33965 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34502 _keys!1070)))))

(declare-fun b!1093099 () Bool)

(declare-fun e!624375 () Bool)

(assert (=> b!1093099 (= e!624371 e!624375)))

(declare-fun res!728977 () Bool)

(assert (=> b!1093099 (=> res!728977 e!624375)))

(assert (=> b!1093099 (= res!728977 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!488237 () ListLongMap!15109)

(assert (=> b!1093099 (= lt!488233 lt!488237)))

(declare-fun lt!488238 () tuple2!17132)

(declare-fun +!3383 (ListLongMap!15109 tuple2!17132) ListLongMap!15109)

(assert (=> b!1093099 (= lt!488237 (+!3383 lt!488232 lt!488238))))

(declare-fun lt!488230 () ListLongMap!15109)

(assert (=> b!1093099 (= lt!488227 lt!488230)))

(assert (=> b!1093099 (= lt!488230 (+!3383 lt!488226 lt!488238))))

(assert (=> b!1093099 (= lt!488227 (+!3383 lt!488235 lt!488238))))

(assert (=> b!1093099 (= lt!488238 (tuple2!17133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun mapIsEmpty!41986 () Bool)

(declare-fun mapRes!41986 () Bool)

(assert (=> mapIsEmpty!41986 mapRes!41986))

(declare-fun res!728976 () Bool)

(assert (=> start!96402 (=> (not res!728976) (not e!624370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96402 (= res!728976 (validMask!0 mask!1414))))

(assert (=> start!96402 e!624370))

(assert (=> start!96402 tp!80306))

(assert (=> start!96402 true))

(declare-fun tp_is_empty!26821 () Bool)

(assert (=> start!96402 tp_is_empty!26821))

(declare-fun array_inv!26224 (array!70595) Bool)

(assert (=> start!96402 (array_inv!26224 _keys!1070)))

(declare-fun e!624377 () Bool)

(declare-fun array_inv!26225 (array!70597) Bool)

(assert (=> start!96402 (and (array_inv!26225 _values!874) e!624377)))

(declare-fun b!1093100 () Bool)

(declare-fun e!624376 () Bool)

(assert (=> b!1093100 (= e!624376 tp_is_empty!26821)))

(declare-fun b!1093101 () Bool)

(declare-fun res!728973 () Bool)

(assert (=> b!1093101 (=> (not res!728973) (not e!624370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093101 (= res!728973 (validKeyInArray!0 k0!904))))

(declare-fun b!1093102 () Bool)

(declare-fun e!624373 () Bool)

(assert (=> b!1093102 (= e!624377 (and e!624373 mapRes!41986))))

(declare-fun condMapEmpty!41986 () Bool)

(declare-fun mapDefault!41986 () ValueCell!12701)

(assert (=> b!1093102 (= condMapEmpty!41986 (= (arr!33966 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12701)) mapDefault!41986)))))

(declare-fun b!1093103 () Bool)

(assert (=> b!1093103 (= e!624375 true)))

(assert (=> b!1093103 (= (-!875 lt!488237 k0!904) lt!488230)))

(declare-fun lt!488228 () Unit!35917)

(declare-fun addRemoveCommutativeForDiffKeys!108 (ListLongMap!15109 (_ BitVec 64) V!40889 (_ BitVec 64)) Unit!35917)

(assert (=> b!1093103 (= lt!488228 (addRemoveCommutativeForDiffKeys!108 lt!488232 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun b!1093104 () Bool)

(declare-fun res!728971 () Bool)

(assert (=> b!1093104 (=> (not res!728971) (not e!624370))))

(assert (=> b!1093104 (= res!728971 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23722))))

(declare-fun b!1093105 () Bool)

(declare-fun res!728972 () Bool)

(assert (=> b!1093105 (=> (not res!728972) (not e!624370))))

(assert (=> b!1093105 (= res!728972 (= (select (arr!33965 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41986 () Bool)

(declare-fun tp!80305 () Bool)

(assert (=> mapNonEmpty!41986 (= mapRes!41986 (and tp!80305 e!624376))))

(declare-fun mapRest!41986 () (Array (_ BitVec 32) ValueCell!12701))

(declare-fun mapKey!41986 () (_ BitVec 32))

(declare-fun mapValue!41986 () ValueCell!12701)

(assert (=> mapNonEmpty!41986 (= (arr!33966 _values!874) (store mapRest!41986 mapKey!41986 mapValue!41986))))

(declare-fun b!1093106 () Bool)

(assert (=> b!1093106 (= e!624373 tp_is_empty!26821)))

(declare-fun b!1093107 () Bool)

(declare-fun res!728979 () Bool)

(assert (=> b!1093107 (=> (not res!728979) (not e!624370))))

(assert (=> b!1093107 (= res!728979 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34502 _keys!1070))))))

(assert (= (and start!96402 res!728976) b!1093097))

(assert (= (and b!1093097 res!728974) b!1093096))

(assert (= (and b!1093096 res!728969) b!1093104))

(assert (= (and b!1093104 res!728971) b!1093107))

(assert (= (and b!1093107 res!728979) b!1093101))

(assert (= (and b!1093101 res!728973) b!1093105))

(assert (= (and b!1093105 res!728972) b!1093098))

(assert (= (and b!1093098 res!728975) b!1093095))

(assert (= (and b!1093095 res!728978) b!1093094))

(assert (= (and b!1093094 (not res!728970)) b!1093099))

(assert (= (and b!1093099 (not res!728977)) b!1093103))

(assert (= (and b!1093102 condMapEmpty!41986) mapIsEmpty!41986))

(assert (= (and b!1093102 (not condMapEmpty!41986)) mapNonEmpty!41986))

(get-info :version)

(assert (= (and mapNonEmpty!41986 ((_ is ValueCellFull!12701) mapValue!41986)) b!1093100))

(assert (= (and b!1093102 ((_ is ValueCellFull!12701) mapDefault!41986)) b!1093106))

(assert (= start!96402 b!1093102))

(declare-fun b_lambda!17499 () Bool)

(assert (=> (not b_lambda!17499) (not b!1093094)))

(declare-fun t!33592 () Bool)

(declare-fun tb!7689 () Bool)

(assert (=> (and start!96402 (= defaultEntry!882 defaultEntry!882) t!33592) tb!7689))

(declare-fun result!15905 () Bool)

(assert (=> tb!7689 (= result!15905 tp_is_empty!26821)))

(assert (=> b!1093094 t!33592))

(declare-fun b_and!36325 () Bool)

(assert (= b_and!36323 (and (=> t!33592 result!15905) b_and!36325)))

(declare-fun m!1013087 () Bool)

(assert (=> b!1093103 m!1013087))

(declare-fun m!1013089 () Bool)

(assert (=> b!1093103 m!1013089))

(declare-fun m!1013091 () Bool)

(assert (=> b!1093098 m!1013091))

(declare-fun m!1013093 () Bool)

(assert (=> b!1093098 m!1013093))

(declare-fun m!1013095 () Bool)

(assert (=> b!1093099 m!1013095))

(declare-fun m!1013097 () Bool)

(assert (=> b!1093099 m!1013097))

(declare-fun m!1013099 () Bool)

(assert (=> b!1093099 m!1013099))

(declare-fun m!1013101 () Bool)

(assert (=> b!1093096 m!1013101))

(declare-fun m!1013103 () Bool)

(assert (=> b!1093104 m!1013103))

(declare-fun m!1013105 () Bool)

(assert (=> start!96402 m!1013105))

(declare-fun m!1013107 () Bool)

(assert (=> start!96402 m!1013107))

(declare-fun m!1013109 () Bool)

(assert (=> start!96402 m!1013109))

(declare-fun m!1013111 () Bool)

(assert (=> b!1093095 m!1013111))

(declare-fun m!1013113 () Bool)

(assert (=> b!1093101 m!1013113))

(declare-fun m!1013115 () Bool)

(assert (=> mapNonEmpty!41986 m!1013115))

(declare-fun m!1013117 () Bool)

(assert (=> b!1093105 m!1013117))

(declare-fun m!1013119 () Bool)

(assert (=> b!1093094 m!1013119))

(declare-fun m!1013121 () Bool)

(assert (=> b!1093094 m!1013121))

(declare-fun m!1013123 () Bool)

(assert (=> b!1093094 m!1013123))

(declare-fun m!1013125 () Bool)

(assert (=> b!1093094 m!1013125))

(declare-fun m!1013127 () Bool)

(assert (=> b!1093094 m!1013127))

(declare-fun m!1013129 () Bool)

(assert (=> b!1093094 m!1013129))

(declare-fun m!1013131 () Bool)

(assert (=> b!1093094 m!1013131))

(declare-fun m!1013133 () Bool)

(assert (=> b!1093094 m!1013133))

(declare-fun m!1013135 () Bool)

(assert (=> b!1093094 m!1013135))

(declare-fun m!1013137 () Bool)

(assert (=> b!1093094 m!1013137))

(check-sat (not b!1093098) b_and!36325 (not start!96402) (not b_lambda!17499) (not mapNonEmpty!41986) (not b!1093101) (not b!1093104) (not b!1093094) (not b!1093096) (not b!1093099) (not b_next!22819) (not b!1093095) tp_is_empty!26821 (not b!1093103))
(check-sat b_and!36325 (not b_next!22819))
