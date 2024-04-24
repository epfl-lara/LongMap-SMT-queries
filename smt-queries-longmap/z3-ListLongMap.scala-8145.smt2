; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99972 () Bool)

(assert start!99972)

(declare-fun b_free!25315 () Bool)

(declare-fun b_next!25315 () Bool)

(assert (=> start!99972 (= b_free!25315 (not b_next!25315))))

(declare-fun tp!88659 () Bool)

(declare-fun b_and!41499 () Bool)

(assert (=> start!99972 (= tp!88659 b_and!41499)))

(declare-fun b!1185341 () Bool)

(declare-fun res!787505 () Bool)

(declare-fun e!674039 () Bool)

(assert (=> b!1185341 (=> (not res!787505) (not e!674039))))

(declare-datatypes ((array!76535 0))(
  ( (array!76536 (arr!36911 (Array (_ BitVec 32) (_ BitVec 64))) (size!37448 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76535)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76535 (_ BitVec 32)) Bool)

(assert (=> b!1185341 (= res!787505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185342 () Bool)

(declare-fun e!674032 () Bool)

(declare-fun e!674041 () Bool)

(assert (=> b!1185342 (= e!674032 (not e!674041))))

(declare-fun res!787508 () Bool)

(assert (=> b!1185342 (=> res!787508 e!674041)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185342 (= res!787508 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185342 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39195 0))(
  ( (Unit!39196) )
))
(declare-fun lt!537217 () Unit!39195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76535 (_ BitVec 64) (_ BitVec 32)) Unit!39195)

(assert (=> b!1185342 (= lt!537217 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185343 () Bool)

(declare-fun res!787507 () Bool)

(assert (=> b!1185343 (=> (not res!787507) (not e!674039))))

(declare-datatypes ((List!25979 0))(
  ( (Nil!25976) (Cons!25975 (h!27193 (_ BitVec 64)) (t!38278 List!25979)) )
))
(declare-fun arrayNoDuplicates!0 (array!76535 (_ BitVec 32) List!25979) Bool)

(assert (=> b!1185343 (= res!787507 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25976))))

(declare-fun b!1185344 () Bool)

(declare-fun e!674038 () Bool)

(declare-fun e!674036 () Bool)

(declare-fun mapRes!46595 () Bool)

(assert (=> b!1185344 (= e!674038 (and e!674036 mapRes!46595))))

(declare-fun condMapEmpty!46595 () Bool)

(declare-datatypes ((V!44921 0))(
  ( (V!44922 (val!14979 Int)) )
))
(declare-datatypes ((ValueCell!14213 0))(
  ( (ValueCellFull!14213 (v!17613 V!44921)) (EmptyCell!14213) )
))
(declare-datatypes ((array!76537 0))(
  ( (array!76538 (arr!36912 (Array (_ BitVec 32) ValueCell!14213)) (size!37449 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76537)

(declare-fun mapDefault!46595 () ValueCell!14213)

(assert (=> b!1185344 (= condMapEmpty!46595 (= (arr!36912 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14213)) mapDefault!46595)))))

(declare-fun b!1185345 () Bool)

(declare-fun e!674042 () Bool)

(assert (=> b!1185345 (= e!674042 true)))

(declare-datatypes ((tuple2!19246 0))(
  ( (tuple2!19247 (_1!9634 (_ BitVec 64)) (_2!9634 V!44921)) )
))
(declare-datatypes ((List!25980 0))(
  ( (Nil!25977) (Cons!25976 (h!27194 tuple2!19246) (t!38279 List!25980)) )
))
(declare-datatypes ((ListLongMap!17223 0))(
  ( (ListLongMap!17224 (toList!8627 List!25980)) )
))
(declare-fun lt!537221 () ListLongMap!17223)

(declare-fun lt!537228 () ListLongMap!17223)

(declare-fun -!1648 (ListLongMap!17223 (_ BitVec 64)) ListLongMap!17223)

(assert (=> b!1185345 (= (-!1648 lt!537221 k0!934) lt!537228)))

(declare-fun lt!537227 () V!44921)

(declare-fun lt!537231 () Unit!39195)

(declare-fun lt!537224 () ListLongMap!17223)

(declare-fun addRemoveCommutativeForDiffKeys!162 (ListLongMap!17223 (_ BitVec 64) V!44921 (_ BitVec 64)) Unit!39195)

(assert (=> b!1185345 (= lt!537231 (addRemoveCommutativeForDiffKeys!162 lt!537224 (select (arr!36911 _keys!1208) from!1455) lt!537227 k0!934))))

(declare-fun lt!537216 () ListLongMap!17223)

(declare-fun lt!537230 () ListLongMap!17223)

(declare-fun lt!537214 () ListLongMap!17223)

(assert (=> b!1185345 (and (= lt!537216 lt!537221) (= lt!537230 lt!537214))))

(declare-fun lt!537222 () tuple2!19246)

(declare-fun +!3946 (ListLongMap!17223 tuple2!19246) ListLongMap!17223)

(assert (=> b!1185345 (= lt!537221 (+!3946 lt!537224 lt!537222))))

(assert (=> b!1185345 (not (= (select (arr!36911 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537225 () Unit!39195)

(declare-fun e!674040 () Unit!39195)

(assert (=> b!1185345 (= lt!537225 e!674040)))

(declare-fun c!117494 () Bool)

(assert (=> b!1185345 (= c!117494 (= (select (arr!36911 _keys!1208) from!1455) k0!934))))

(declare-fun e!674031 () Bool)

(assert (=> b!1185345 e!674031))

(declare-fun res!787498 () Bool)

(assert (=> b!1185345 (=> (not res!787498) (not e!674031))))

(declare-fun lt!537232 () ListLongMap!17223)

(assert (=> b!1185345 (= res!787498 (= lt!537232 lt!537228))))

(assert (=> b!1185345 (= lt!537228 (+!3946 lt!537230 lt!537222))))

(assert (=> b!1185345 (= lt!537222 (tuple2!19247 (select (arr!36911 _keys!1208) from!1455) lt!537227))))

(declare-fun lt!537226 () V!44921)

(declare-fun get!18929 (ValueCell!14213 V!44921) V!44921)

(assert (=> b!1185345 (= lt!537227 (get!18929 (select (arr!36912 _values!996) from!1455) lt!537226))))

(declare-fun mapNonEmpty!46595 () Bool)

(declare-fun tp!88658 () Bool)

(declare-fun e!674035 () Bool)

(assert (=> mapNonEmpty!46595 (= mapRes!46595 (and tp!88658 e!674035))))

(declare-fun mapValue!46595 () ValueCell!14213)

(declare-fun mapRest!46595 () (Array (_ BitVec 32) ValueCell!14213))

(declare-fun mapKey!46595 () (_ BitVec 32))

(assert (=> mapNonEmpty!46595 (= (arr!36912 _values!996) (store mapRest!46595 mapKey!46595 mapValue!46595))))

(declare-fun mapIsEmpty!46595 () Bool)

(assert (=> mapIsEmpty!46595 mapRes!46595))

(declare-fun b!1185346 () Bool)

(declare-fun res!787510 () Bool)

(assert (=> b!1185346 (=> (not res!787510) (not e!674039))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1185346 (= res!787510 (and (= (size!37449 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37448 _keys!1208) (size!37449 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185347 () Bool)

(declare-fun res!787504 () Bool)

(assert (=> b!1185347 (=> (not res!787504) (not e!674039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185347 (= res!787504 (validMask!0 mask!1564))))

(declare-fun b!1185348 () Bool)

(declare-fun Unit!39197 () Unit!39195)

(assert (=> b!1185348 (= e!674040 Unit!39197)))

(declare-fun lt!537215 () Unit!39195)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39195)

(assert (=> b!1185348 (= lt!537215 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185348 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537223 () Unit!39195)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76535 (_ BitVec 32) (_ BitVec 32)) Unit!39195)

(assert (=> b!1185348 (= lt!537223 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185348 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25976)))

(declare-fun lt!537218 () Unit!39195)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76535 (_ BitVec 64) (_ BitVec 32) List!25979) Unit!39195)

(assert (=> b!1185348 (= lt!537218 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25976))))

(assert (=> b!1185348 false))

(declare-fun b!1185340 () Bool)

(declare-fun e!674033 () Bool)

(assert (=> b!1185340 (= e!674033 e!674042)))

(declare-fun res!787506 () Bool)

(assert (=> b!1185340 (=> res!787506 e!674042)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185340 (= res!787506 (not (validKeyInArray!0 (select (arr!36911 _keys!1208) from!1455))))))

(assert (=> b!1185340 (= lt!537214 lt!537230)))

(assert (=> b!1185340 (= lt!537230 (-!1648 lt!537224 k0!934))))

(declare-fun zeroValue!944 () V!44921)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537229 () array!76537)

(declare-fun lt!537219 () array!76535)

(declare-fun minValue!944 () V!44921)

(declare-fun getCurrentListMapNoExtraKeys!5098 (array!76535 array!76537 (_ BitVec 32) (_ BitVec 32) V!44921 V!44921 (_ BitVec 32) Int) ListLongMap!17223)

(assert (=> b!1185340 (= lt!537214 (getCurrentListMapNoExtraKeys!5098 lt!537219 lt!537229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185340 (= lt!537224 (getCurrentListMapNoExtraKeys!5098 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537220 () Unit!39195)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!869 (array!76535 array!76537 (_ BitVec 32) (_ BitVec 32) V!44921 V!44921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39195)

(assert (=> b!1185340 (= lt!537220 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!869 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!787502 () Bool)

(assert (=> start!99972 (=> (not res!787502) (not e!674039))))

(assert (=> start!99972 (= res!787502 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37448 _keys!1208))))))

(assert (=> start!99972 e!674039))

(declare-fun tp_is_empty!29845 () Bool)

(assert (=> start!99972 tp_is_empty!29845))

(declare-fun array_inv!28244 (array!76535) Bool)

(assert (=> start!99972 (array_inv!28244 _keys!1208)))

(assert (=> start!99972 true))

(assert (=> start!99972 tp!88659))

(declare-fun array_inv!28245 (array!76537) Bool)

(assert (=> start!99972 (and (array_inv!28245 _values!996) e!674038)))

(declare-fun b!1185349 () Bool)

(declare-fun res!787497 () Bool)

(assert (=> b!1185349 (=> (not res!787497) (not e!674039))))

(assert (=> b!1185349 (= res!787497 (validKeyInArray!0 k0!934))))

(declare-fun b!1185350 () Bool)

(declare-fun res!787500 () Bool)

(assert (=> b!1185350 (=> (not res!787500) (not e!674032))))

(assert (=> b!1185350 (= res!787500 (arrayNoDuplicates!0 lt!537219 #b00000000000000000000000000000000 Nil!25976))))

(declare-fun b!1185351 () Bool)

(declare-fun Unit!39198 () Unit!39195)

(assert (=> b!1185351 (= e!674040 Unit!39198)))

(declare-fun b!1185352 () Bool)

(assert (=> b!1185352 (= e!674041 e!674033)))

(declare-fun res!787509 () Bool)

(assert (=> b!1185352 (=> res!787509 e!674033)))

(assert (=> b!1185352 (= res!787509 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185352 (= lt!537232 (getCurrentListMapNoExtraKeys!5098 lt!537219 lt!537229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185352 (= lt!537229 (array!76538 (store (arr!36912 _values!996) i!673 (ValueCellFull!14213 lt!537226)) (size!37449 _values!996)))))

(declare-fun dynLambda!3061 (Int (_ BitVec 64)) V!44921)

(assert (=> b!1185352 (= lt!537226 (dynLambda!3061 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185352 (= lt!537216 (getCurrentListMapNoExtraKeys!5098 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185353 () Bool)

(declare-fun res!787503 () Bool)

(assert (=> b!1185353 (=> (not res!787503) (not e!674039))))

(assert (=> b!1185353 (= res!787503 (= (select (arr!36911 _keys!1208) i!673) k0!934))))

(declare-fun b!1185354 () Bool)

(declare-fun e!674034 () Bool)

(assert (=> b!1185354 (= e!674034 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185355 () Bool)

(assert (=> b!1185355 (= e!674035 tp_is_empty!29845)))

(declare-fun b!1185356 () Bool)

(assert (=> b!1185356 (= e!674031 e!674034)))

(declare-fun res!787511 () Bool)

(assert (=> b!1185356 (=> res!787511 e!674034)))

(assert (=> b!1185356 (= res!787511 (not (= (select (arr!36911 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185357 () Bool)

(assert (=> b!1185357 (= e!674036 tp_is_empty!29845)))

(declare-fun b!1185358 () Bool)

(assert (=> b!1185358 (= e!674039 e!674032)))

(declare-fun res!787501 () Bool)

(assert (=> b!1185358 (=> (not res!787501) (not e!674032))))

(assert (=> b!1185358 (= res!787501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537219 mask!1564))))

(assert (=> b!1185358 (= lt!537219 (array!76536 (store (arr!36911 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37448 _keys!1208)))))

(declare-fun b!1185359 () Bool)

(declare-fun res!787499 () Bool)

(assert (=> b!1185359 (=> (not res!787499) (not e!674039))))

(assert (=> b!1185359 (= res!787499 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37448 _keys!1208))))))

(assert (= (and start!99972 res!787502) b!1185347))

(assert (= (and b!1185347 res!787504) b!1185346))

(assert (= (and b!1185346 res!787510) b!1185341))

(assert (= (and b!1185341 res!787505) b!1185343))

(assert (= (and b!1185343 res!787507) b!1185359))

(assert (= (and b!1185359 res!787499) b!1185349))

(assert (= (and b!1185349 res!787497) b!1185353))

(assert (= (and b!1185353 res!787503) b!1185358))

(assert (= (and b!1185358 res!787501) b!1185350))

(assert (= (and b!1185350 res!787500) b!1185342))

(assert (= (and b!1185342 (not res!787508)) b!1185352))

(assert (= (and b!1185352 (not res!787509)) b!1185340))

(assert (= (and b!1185340 (not res!787506)) b!1185345))

(assert (= (and b!1185345 res!787498) b!1185356))

(assert (= (and b!1185356 (not res!787511)) b!1185354))

(assert (= (and b!1185345 c!117494) b!1185348))

(assert (= (and b!1185345 (not c!117494)) b!1185351))

(assert (= (and b!1185344 condMapEmpty!46595) mapIsEmpty!46595))

(assert (= (and b!1185344 (not condMapEmpty!46595)) mapNonEmpty!46595))

(get-info :version)

(assert (= (and mapNonEmpty!46595 ((_ is ValueCellFull!14213) mapValue!46595)) b!1185355))

(assert (= (and b!1185344 ((_ is ValueCellFull!14213) mapDefault!46595)) b!1185357))

(assert (= start!99972 b!1185344))

(declare-fun b_lambda!20453 () Bool)

(assert (=> (not b_lambda!20453) (not b!1185352)))

(declare-fun t!38277 () Bool)

(declare-fun tb!10119 () Bool)

(assert (=> (and start!99972 (= defaultEntry!1004 defaultEntry!1004) t!38277) tb!10119))

(declare-fun result!20813 () Bool)

(assert (=> tb!10119 (= result!20813 tp_is_empty!29845)))

(assert (=> b!1185352 t!38277))

(declare-fun b_and!41501 () Bool)

(assert (= b_and!41499 (and (=> t!38277 result!20813) b_and!41501)))

(declare-fun m!1093857 () Bool)

(assert (=> b!1185349 m!1093857))

(declare-fun m!1093859 () Bool)

(assert (=> b!1185345 m!1093859))

(declare-fun m!1093861 () Bool)

(assert (=> b!1185345 m!1093861))

(declare-fun m!1093863 () Bool)

(assert (=> b!1185345 m!1093863))

(assert (=> b!1185345 m!1093863))

(declare-fun m!1093865 () Bool)

(assert (=> b!1185345 m!1093865))

(declare-fun m!1093867 () Bool)

(assert (=> b!1185345 m!1093867))

(declare-fun m!1093869 () Bool)

(assert (=> b!1185345 m!1093869))

(declare-fun m!1093871 () Bool)

(assert (=> b!1185345 m!1093871))

(assert (=> b!1185345 m!1093859))

(declare-fun m!1093873 () Bool)

(assert (=> b!1185352 m!1093873))

(declare-fun m!1093875 () Bool)

(assert (=> b!1185352 m!1093875))

(declare-fun m!1093877 () Bool)

(assert (=> b!1185352 m!1093877))

(declare-fun m!1093879 () Bool)

(assert (=> b!1185352 m!1093879))

(declare-fun m!1093881 () Bool)

(assert (=> b!1185348 m!1093881))

(declare-fun m!1093883 () Bool)

(assert (=> b!1185348 m!1093883))

(declare-fun m!1093885 () Bool)

(assert (=> b!1185348 m!1093885))

(declare-fun m!1093887 () Bool)

(assert (=> b!1185348 m!1093887))

(declare-fun m!1093889 () Bool)

(assert (=> b!1185348 m!1093889))

(declare-fun m!1093891 () Bool)

(assert (=> b!1185353 m!1093891))

(declare-fun m!1093893 () Bool)

(assert (=> b!1185350 m!1093893))

(declare-fun m!1093895 () Bool)

(assert (=> b!1185347 m!1093895))

(declare-fun m!1093897 () Bool)

(assert (=> b!1185340 m!1093897))

(declare-fun m!1093899 () Bool)

(assert (=> b!1185340 m!1093899))

(assert (=> b!1185340 m!1093859))

(declare-fun m!1093901 () Bool)

(assert (=> b!1185340 m!1093901))

(declare-fun m!1093903 () Bool)

(assert (=> b!1185340 m!1093903))

(assert (=> b!1185340 m!1093859))

(declare-fun m!1093905 () Bool)

(assert (=> b!1185340 m!1093905))

(declare-fun m!1093907 () Bool)

(assert (=> b!1185342 m!1093907))

(declare-fun m!1093909 () Bool)

(assert (=> b!1185342 m!1093909))

(declare-fun m!1093911 () Bool)

(assert (=> mapNonEmpty!46595 m!1093911))

(declare-fun m!1093913 () Bool)

(assert (=> b!1185343 m!1093913))

(declare-fun m!1093915 () Bool)

(assert (=> start!99972 m!1093915))

(declare-fun m!1093917 () Bool)

(assert (=> start!99972 m!1093917))

(declare-fun m!1093919 () Bool)

(assert (=> b!1185358 m!1093919))

(declare-fun m!1093921 () Bool)

(assert (=> b!1185358 m!1093921))

(assert (=> b!1185356 m!1093859))

(declare-fun m!1093923 () Bool)

(assert (=> b!1185341 m!1093923))

(declare-fun m!1093925 () Bool)

(assert (=> b!1185354 m!1093925))

(check-sat tp_is_empty!29845 (not b!1185341) (not b!1185358) (not mapNonEmpty!46595) (not b!1185352) (not b!1185350) (not b!1185347) (not b_next!25315) (not b!1185345) (not b!1185343) b_and!41501 (not b!1185348) (not b_lambda!20453) (not b!1185354) (not b!1185349) (not b!1185340) (not b!1185342) (not start!99972))
(check-sat b_and!41501 (not b_next!25315))
