; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100140 () Bool)

(assert start!100140)

(declare-fun b_free!25483 () Bool)

(declare-fun b_next!25483 () Bool)

(assert (=> start!100140 (= b_free!25483 (not b_next!25483))))

(declare-fun tp!89163 () Bool)

(declare-fun b_and!41835 () Bool)

(assert (=> start!100140 (= tp!89163 b_and!41835)))

(declare-fun res!791139 () Bool)

(declare-fun e!676869 () Bool)

(assert (=> start!100140 (=> (not res!791139) (not e!676869))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76865 0))(
  ( (array!76866 (arr!37076 (Array (_ BitVec 32) (_ BitVec 64))) (size!37613 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76865)

(assert (=> start!100140 (= res!791139 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37613 _keys!1208))))))

(assert (=> start!100140 e!676869))

(declare-fun tp_is_empty!30013 () Bool)

(assert (=> start!100140 tp_is_empty!30013))

(declare-fun array_inv!28348 (array!76865) Bool)

(assert (=> start!100140 (array_inv!28348 _keys!1208)))

(assert (=> start!100140 true))

(assert (=> start!100140 tp!89163))

(declare-datatypes ((V!45145 0))(
  ( (V!45146 (val!15063 Int)) )
))
(declare-datatypes ((ValueCell!14297 0))(
  ( (ValueCellFull!14297 (v!17697 V!45145)) (EmptyCell!14297) )
))
(declare-datatypes ((array!76867 0))(
  ( (array!76868 (arr!37077 (Array (_ BitVec 32) ValueCell!14297)) (size!37614 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76867)

(declare-fun e!676872 () Bool)

(declare-fun array_inv!28349 (array!76867) Bool)

(assert (=> start!100140 (and (array_inv!28349 _values!996) e!676872)))

(declare-fun b!1190313 () Bool)

(declare-fun res!791138 () Bool)

(assert (=> b!1190313 (=> (not res!791138) (not e!676869))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190313 (= res!791138 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46847 () Bool)

(declare-fun mapRes!46847 () Bool)

(assert (=> mapIsEmpty!46847 mapRes!46847))

(declare-fun b!1190314 () Bool)

(declare-fun res!791146 () Bool)

(assert (=> b!1190314 (=> (not res!791146) (not e!676869))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1190314 (= res!791146 (and (= (size!37614 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37613 _keys!1208) (size!37614 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190315 () Bool)

(declare-fun e!676874 () Bool)

(assert (=> b!1190315 (= e!676874 true)))

(declare-fun zeroValue!944 () V!45145)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541392 () array!76865)

(declare-fun lt!541394 () array!76867)

(declare-fun minValue!944 () V!45145)

(declare-datatypes ((tuple2!19380 0))(
  ( (tuple2!19381 (_1!9701 (_ BitVec 64)) (_2!9701 V!45145)) )
))
(declare-datatypes ((List!26122 0))(
  ( (Nil!26119) (Cons!26118 (h!27336 tuple2!19380) (t!38589 List!26122)) )
))
(declare-datatypes ((ListLongMap!17357 0))(
  ( (ListLongMap!17358 (toList!8694 List!26122)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5162 (array!76865 array!76867 (_ BitVec 32) (_ BitVec 32) V!45145 V!45145 (_ BitVec 32) Int) ListLongMap!17357)

(declare-fun -!1710 (ListLongMap!17357 (_ BitVec 64)) ListLongMap!17357)

(assert (=> b!1190315 (= (getCurrentListMapNoExtraKeys!5162 lt!541392 lt!541394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1710 (getCurrentListMapNoExtraKeys!5162 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39427 0))(
  ( (Unit!39428) )
))
(declare-fun lt!541391 () Unit!39427)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!925 (array!76865 array!76867 (_ BitVec 32) (_ BitVec 32) V!45145 V!45145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39427)

(assert (=> b!1190315 (= lt!541391 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!925 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190316 () Bool)

(declare-fun e!676868 () Bool)

(assert (=> b!1190316 (= e!676869 e!676868)))

(declare-fun res!791142 () Bool)

(assert (=> b!1190316 (=> (not res!791142) (not e!676868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76865 (_ BitVec 32)) Bool)

(assert (=> b!1190316 (= res!791142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541392 mask!1564))))

(assert (=> b!1190316 (= lt!541392 (array!76866 (store (arr!37076 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37613 _keys!1208)))))

(declare-fun b!1190317 () Bool)

(declare-fun res!791140 () Bool)

(assert (=> b!1190317 (=> (not res!791140) (not e!676869))))

(assert (=> b!1190317 (= res!791140 (= (select (arr!37076 _keys!1208) i!673) k0!934))))

(declare-fun b!1190318 () Bool)

(declare-fun res!791144 () Bool)

(assert (=> b!1190318 (=> (not res!791144) (not e!676869))))

(assert (=> b!1190318 (= res!791144 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37613 _keys!1208))))))

(declare-fun b!1190319 () Bool)

(declare-fun e!676873 () Bool)

(assert (=> b!1190319 (= e!676873 tp_is_empty!30013)))

(declare-fun mapNonEmpty!46847 () Bool)

(declare-fun tp!89162 () Bool)

(declare-fun e!676870 () Bool)

(assert (=> mapNonEmpty!46847 (= mapRes!46847 (and tp!89162 e!676870))))

(declare-fun mapRest!46847 () (Array (_ BitVec 32) ValueCell!14297))

(declare-fun mapKey!46847 () (_ BitVec 32))

(declare-fun mapValue!46847 () ValueCell!14297)

(assert (=> mapNonEmpty!46847 (= (arr!37077 _values!996) (store mapRest!46847 mapKey!46847 mapValue!46847))))

(declare-fun b!1190320 () Bool)

(assert (=> b!1190320 (= e!676870 tp_is_empty!30013)))

(declare-fun b!1190321 () Bool)

(assert (=> b!1190321 (= e!676872 (and e!676873 mapRes!46847))))

(declare-fun condMapEmpty!46847 () Bool)

(declare-fun mapDefault!46847 () ValueCell!14297)

(assert (=> b!1190321 (= condMapEmpty!46847 (= (arr!37077 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14297)) mapDefault!46847)))))

(declare-fun b!1190322 () Bool)

(declare-fun e!676867 () Bool)

(assert (=> b!1190322 (= e!676868 (not e!676867))))

(declare-fun res!791137 () Bool)

(assert (=> b!1190322 (=> res!791137 e!676867)))

(assert (=> b!1190322 (= res!791137 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190322 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541393 () Unit!39427)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76865 (_ BitVec 64) (_ BitVec 32)) Unit!39427)

(assert (=> b!1190322 (= lt!541393 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190323 () Bool)

(assert (=> b!1190323 (= e!676867 e!676874)))

(declare-fun res!791141 () Bool)

(assert (=> b!1190323 (=> res!791141 e!676874)))

(assert (=> b!1190323 (= res!791141 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541395 () ListLongMap!17357)

(assert (=> b!1190323 (= lt!541395 (getCurrentListMapNoExtraKeys!5162 lt!541392 lt!541394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3120 (Int (_ BitVec 64)) V!45145)

(assert (=> b!1190323 (= lt!541394 (array!76868 (store (arr!37077 _values!996) i!673 (ValueCellFull!14297 (dynLambda!3120 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37614 _values!996)))))

(declare-fun lt!541396 () ListLongMap!17357)

(assert (=> b!1190323 (= lt!541396 (getCurrentListMapNoExtraKeys!5162 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190324 () Bool)

(declare-fun res!791147 () Bool)

(assert (=> b!1190324 (=> (not res!791147) (not e!676868))))

(declare-datatypes ((List!26123 0))(
  ( (Nil!26120) (Cons!26119 (h!27337 (_ BitVec 64)) (t!38590 List!26123)) )
))
(declare-fun arrayNoDuplicates!0 (array!76865 (_ BitVec 32) List!26123) Bool)

(assert (=> b!1190324 (= res!791147 (arrayNoDuplicates!0 lt!541392 #b00000000000000000000000000000000 Nil!26120))))

(declare-fun b!1190325 () Bool)

(declare-fun res!791136 () Bool)

(assert (=> b!1190325 (=> (not res!791136) (not e!676869))))

(assert (=> b!1190325 (= res!791136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190326 () Bool)

(declare-fun res!791145 () Bool)

(assert (=> b!1190326 (=> (not res!791145) (not e!676869))))

(assert (=> b!1190326 (= res!791145 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26120))))

(declare-fun b!1190327 () Bool)

(declare-fun res!791143 () Bool)

(assert (=> b!1190327 (=> (not res!791143) (not e!676869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190327 (= res!791143 (validMask!0 mask!1564))))

(assert (= (and start!100140 res!791139) b!1190327))

(assert (= (and b!1190327 res!791143) b!1190314))

(assert (= (and b!1190314 res!791146) b!1190325))

(assert (= (and b!1190325 res!791136) b!1190326))

(assert (= (and b!1190326 res!791145) b!1190318))

(assert (= (and b!1190318 res!791144) b!1190313))

(assert (= (and b!1190313 res!791138) b!1190317))

(assert (= (and b!1190317 res!791140) b!1190316))

(assert (= (and b!1190316 res!791142) b!1190324))

(assert (= (and b!1190324 res!791147) b!1190322))

(assert (= (and b!1190322 (not res!791137)) b!1190323))

(assert (= (and b!1190323 (not res!791141)) b!1190315))

(assert (= (and b!1190321 condMapEmpty!46847) mapIsEmpty!46847))

(assert (= (and b!1190321 (not condMapEmpty!46847)) mapNonEmpty!46847))

(get-info :version)

(assert (= (and mapNonEmpty!46847 ((_ is ValueCellFull!14297) mapValue!46847)) b!1190320))

(assert (= (and b!1190321 ((_ is ValueCellFull!14297) mapDefault!46847)) b!1190319))

(assert (= start!100140 b!1190321))

(declare-fun b_lambda!20621 () Bool)

(assert (=> (not b_lambda!20621) (not b!1190323)))

(declare-fun t!38588 () Bool)

(declare-fun tb!10287 () Bool)

(assert (=> (and start!100140 (= defaultEntry!1004 defaultEntry!1004) t!38588) tb!10287))

(declare-fun result!21149 () Bool)

(assert (=> tb!10287 (= result!21149 tp_is_empty!30013)))

(assert (=> b!1190323 t!38588))

(declare-fun b_and!41837 () Bool)

(assert (= b_and!41835 (and (=> t!38588 result!21149) b_and!41837)))

(declare-fun m!1099317 () Bool)

(assert (=> b!1190315 m!1099317))

(declare-fun m!1099319 () Bool)

(assert (=> b!1190315 m!1099319))

(assert (=> b!1190315 m!1099319))

(declare-fun m!1099321 () Bool)

(assert (=> b!1190315 m!1099321))

(declare-fun m!1099323 () Bool)

(assert (=> b!1190315 m!1099323))

(declare-fun m!1099325 () Bool)

(assert (=> b!1190317 m!1099325))

(declare-fun m!1099327 () Bool)

(assert (=> b!1190323 m!1099327))

(declare-fun m!1099329 () Bool)

(assert (=> b!1190323 m!1099329))

(declare-fun m!1099331 () Bool)

(assert (=> b!1190323 m!1099331))

(declare-fun m!1099333 () Bool)

(assert (=> b!1190323 m!1099333))

(declare-fun m!1099335 () Bool)

(assert (=> b!1190325 m!1099335))

(declare-fun m!1099337 () Bool)

(assert (=> b!1190324 m!1099337))

(declare-fun m!1099339 () Bool)

(assert (=> mapNonEmpty!46847 m!1099339))

(declare-fun m!1099341 () Bool)

(assert (=> b!1190313 m!1099341))

(declare-fun m!1099343 () Bool)

(assert (=> start!100140 m!1099343))

(declare-fun m!1099345 () Bool)

(assert (=> start!100140 m!1099345))

(declare-fun m!1099347 () Bool)

(assert (=> b!1190316 m!1099347))

(declare-fun m!1099349 () Bool)

(assert (=> b!1190316 m!1099349))

(declare-fun m!1099351 () Bool)

(assert (=> b!1190322 m!1099351))

(declare-fun m!1099353 () Bool)

(assert (=> b!1190322 m!1099353))

(declare-fun m!1099355 () Bool)

(assert (=> b!1190327 m!1099355))

(declare-fun m!1099357 () Bool)

(assert (=> b!1190326 m!1099357))

(check-sat (not b!1190316) (not b_lambda!20621) (not b!1190313) (not b!1190326) (not start!100140) (not b!1190322) (not b!1190327) (not b!1190315) (not b!1190323) (not mapNonEmpty!46847) b_and!41837 tp_is_empty!30013 (not b!1190325) (not b_next!25483) (not b!1190324))
(check-sat b_and!41837 (not b_next!25483))
