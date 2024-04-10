; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99746 () Bool)

(assert start!99746)

(declare-fun b_free!25325 () Bool)

(declare-fun b_next!25325 () Bool)

(assert (=> start!99746 (= b_free!25325 (not b_next!25325))))

(declare-fun tp!88688 () Bool)

(declare-fun b_and!41517 () Bool)

(assert (=> start!99746 (= tp!88688 b_and!41517)))

(declare-fun b!1184361 () Bool)

(declare-datatypes ((Unit!39211 0))(
  ( (Unit!39212) )
))
(declare-fun e!673386 () Unit!39211)

(declare-fun Unit!39213 () Unit!39211)

(assert (=> b!1184361 (= e!673386 Unit!39213)))

(declare-fun b!1184362 () Bool)

(declare-fun e!673390 () Bool)

(declare-fun e!673389 () Bool)

(assert (=> b!1184362 (= e!673390 e!673389)))

(declare-fun res!787216 () Bool)

(assert (=> b!1184362 (=> (not res!787216) (not e!673389))))

(declare-datatypes ((array!76509 0))(
  ( (array!76510 (arr!36904 (Array (_ BitVec 32) (_ BitVec 64))) (size!37440 (_ BitVec 32))) )
))
(declare-fun lt!537018 () array!76509)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76509 (_ BitVec 32)) Bool)

(assert (=> b!1184362 (= res!787216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537018 mask!1564))))

(declare-fun _keys!1208 () array!76509)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184362 (= lt!537018 (array!76510 (store (arr!36904 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37440 _keys!1208)))))

(declare-fun b!1184363 () Bool)

(declare-fun res!787218 () Bool)

(assert (=> b!1184363 (=> (not res!787218) (not e!673390))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44933 0))(
  ( (V!44934 (val!14984 Int)) )
))
(declare-datatypes ((ValueCell!14218 0))(
  ( (ValueCellFull!14218 (v!17622 V!44933)) (EmptyCell!14218) )
))
(declare-datatypes ((array!76511 0))(
  ( (array!76512 (arr!36905 (Array (_ BitVec 32) ValueCell!14218)) (size!37441 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76511)

(assert (=> b!1184363 (= res!787218 (and (= (size!37441 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37440 _keys!1208) (size!37441 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!787226 () Bool)

(assert (=> start!99746 (=> (not res!787226) (not e!673390))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99746 (= res!787226 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37440 _keys!1208))))))

(assert (=> start!99746 e!673390))

(declare-fun tp_is_empty!29855 () Bool)

(assert (=> start!99746 tp_is_empty!29855))

(declare-fun array_inv!28166 (array!76509) Bool)

(assert (=> start!99746 (array_inv!28166 _keys!1208)))

(assert (=> start!99746 true))

(assert (=> start!99746 tp!88688))

(declare-fun e!673384 () Bool)

(declare-fun array_inv!28167 (array!76511) Bool)

(assert (=> start!99746 (and (array_inv!28167 _values!996) e!673384)))

(declare-fun b!1184364 () Bool)

(declare-fun e!673387 () Bool)

(declare-fun e!673388 () Bool)

(assert (=> b!1184364 (= e!673387 e!673388)))

(declare-fun res!787225 () Bool)

(assert (=> b!1184364 (=> res!787225 e!673388)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184364 (= res!787225 (not (validKeyInArray!0 (select (arr!36904 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19212 0))(
  ( (tuple2!19213 (_1!9617 (_ BitVec 64)) (_2!9617 V!44933)) )
))
(declare-datatypes ((List!25952 0))(
  ( (Nil!25949) (Cons!25948 (h!27157 tuple2!19212) (t!38269 List!25952)) )
))
(declare-datatypes ((ListLongMap!17181 0))(
  ( (ListLongMap!17182 (toList!8606 List!25952)) )
))
(declare-fun lt!537023 () ListLongMap!17181)

(declare-fun lt!537020 () ListLongMap!17181)

(assert (=> b!1184364 (= lt!537023 lt!537020)))

(declare-fun lt!537024 () ListLongMap!17181)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1641 (ListLongMap!17181 (_ BitVec 64)) ListLongMap!17181)

(assert (=> b!1184364 (= lt!537020 (-!1641 lt!537024 k!934))))

(declare-fun zeroValue!944 () V!44933)

(declare-fun lt!537032 () array!76511)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44933)

(declare-fun getCurrentListMapNoExtraKeys!5056 (array!76509 array!76511 (_ BitVec 32) (_ BitVec 32) V!44933 V!44933 (_ BitVec 32) Int) ListLongMap!17181)

(assert (=> b!1184364 (= lt!537023 (getCurrentListMapNoExtraKeys!5056 lt!537018 lt!537032 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184364 (= lt!537024 (getCurrentListMapNoExtraKeys!5056 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537031 () Unit!39211)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!861 (array!76509 array!76511 (_ BitVec 32) (_ BitVec 32) V!44933 V!44933 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39211)

(assert (=> b!1184364 (= lt!537031 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!861 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184365 () Bool)

(declare-fun e!673385 () Bool)

(declare-fun arrayContainsKey!0 (array!76509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184365 (= e!673385 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1184366 () Bool)

(declare-fun e!673383 () Bool)

(assert (=> b!1184366 (= e!673383 e!673385)))

(declare-fun res!787214 () Bool)

(assert (=> b!1184366 (=> res!787214 e!673385)))

(assert (=> b!1184366 (= res!787214 (not (= (select (arr!36904 _keys!1208) from!1455) k!934)))))

(declare-fun b!1184367 () Bool)

(declare-fun Unit!39214 () Unit!39211)

(assert (=> b!1184367 (= e!673386 Unit!39214)))

(declare-fun lt!537026 () Unit!39211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76509 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39211)

(assert (=> b!1184367 (= lt!537026 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184367 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537022 () Unit!39211)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76509 (_ BitVec 32) (_ BitVec 32)) Unit!39211)

(assert (=> b!1184367 (= lt!537022 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25953 0))(
  ( (Nil!25950) (Cons!25949 (h!27158 (_ BitVec 64)) (t!38270 List!25953)) )
))
(declare-fun arrayNoDuplicates!0 (array!76509 (_ BitVec 32) List!25953) Bool)

(assert (=> b!1184367 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25950)))

(declare-fun lt!537029 () Unit!39211)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76509 (_ BitVec 64) (_ BitVec 32) List!25953) Unit!39211)

(assert (=> b!1184367 (= lt!537029 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25950))))

(assert (=> b!1184367 false))

(declare-fun b!1184368 () Bool)

(declare-fun res!787221 () Bool)

(assert (=> b!1184368 (=> (not res!787221) (not e!673390))))

(assert (=> b!1184368 (= res!787221 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25950))))

(declare-fun b!1184369 () Bool)

(declare-fun res!787220 () Bool)

(assert (=> b!1184369 (=> (not res!787220) (not e!673390))))

(assert (=> b!1184369 (= res!787220 (validKeyInArray!0 k!934))))

(declare-fun b!1184370 () Bool)

(declare-fun e!673380 () Bool)

(assert (=> b!1184370 (= e!673380 tp_is_empty!29855)))

(declare-fun b!1184371 () Bool)

(declare-fun e!673382 () Bool)

(assert (=> b!1184371 (= e!673389 (not e!673382))))

(declare-fun res!787224 () Bool)

(assert (=> b!1184371 (=> res!787224 e!673382)))

(assert (=> b!1184371 (= res!787224 (bvsgt from!1455 i!673))))

(assert (=> b!1184371 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!537027 () Unit!39211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76509 (_ BitVec 64) (_ BitVec 32)) Unit!39211)

(assert (=> b!1184371 (= lt!537027 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46610 () Bool)

(declare-fun mapRes!46610 () Bool)

(assert (=> mapIsEmpty!46610 mapRes!46610))

(declare-fun b!1184372 () Bool)

(assert (=> b!1184372 (= e!673382 e!673387)))

(declare-fun res!787219 () Bool)

(assert (=> b!1184372 (=> res!787219 e!673387)))

(assert (=> b!1184372 (= res!787219 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!537016 () ListLongMap!17181)

(assert (=> b!1184372 (= lt!537016 (getCurrentListMapNoExtraKeys!5056 lt!537018 lt!537032 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!537028 () V!44933)

(assert (=> b!1184372 (= lt!537032 (array!76512 (store (arr!36905 _values!996) i!673 (ValueCellFull!14218 lt!537028)) (size!37441 _values!996)))))

(declare-fun dynLambda!3007 (Int (_ BitVec 64)) V!44933)

(assert (=> b!1184372 (= lt!537028 (dynLambda!3007 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!537021 () ListLongMap!17181)

(assert (=> b!1184372 (= lt!537021 (getCurrentListMapNoExtraKeys!5056 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184373 () Bool)

(declare-fun res!787217 () Bool)

(assert (=> b!1184373 (=> (not res!787217) (not e!673389))))

(assert (=> b!1184373 (= res!787217 (arrayNoDuplicates!0 lt!537018 #b00000000000000000000000000000000 Nil!25950))))

(declare-fun b!1184374 () Bool)

(assert (=> b!1184374 (= e!673388 true)))

(declare-fun lt!537030 () ListLongMap!17181)

(declare-fun lt!537033 () ListLongMap!17181)

(assert (=> b!1184374 (= (-!1641 lt!537030 k!934) lt!537033)))

(declare-fun lt!537019 () Unit!39211)

(declare-fun lt!537015 () V!44933)

(declare-fun addRemoveCommutativeForDiffKeys!166 (ListLongMap!17181 (_ BitVec 64) V!44933 (_ BitVec 64)) Unit!39211)

(assert (=> b!1184374 (= lt!537019 (addRemoveCommutativeForDiffKeys!166 lt!537024 (select (arr!36904 _keys!1208) from!1455) lt!537015 k!934))))

(assert (=> b!1184374 (and (= lt!537021 lt!537030) (= lt!537020 lt!537023))))

(declare-fun lt!537017 () tuple2!19212)

(declare-fun +!3903 (ListLongMap!17181 tuple2!19212) ListLongMap!17181)

(assert (=> b!1184374 (= lt!537030 (+!3903 lt!537024 lt!537017))))

(assert (=> b!1184374 (not (= (select (arr!36904 _keys!1208) from!1455) k!934))))

(declare-fun lt!537025 () Unit!39211)

(assert (=> b!1184374 (= lt!537025 e!673386)))

(declare-fun c!117111 () Bool)

(assert (=> b!1184374 (= c!117111 (= (select (arr!36904 _keys!1208) from!1455) k!934))))

(assert (=> b!1184374 e!673383))

(declare-fun res!787227 () Bool)

(assert (=> b!1184374 (=> (not res!787227) (not e!673383))))

(assert (=> b!1184374 (= res!787227 (= lt!537016 lt!537033))))

(assert (=> b!1184374 (= lt!537033 (+!3903 lt!537020 lt!537017))))

(assert (=> b!1184374 (= lt!537017 (tuple2!19213 (select (arr!36904 _keys!1208) from!1455) lt!537015))))

(declare-fun get!18884 (ValueCell!14218 V!44933) V!44933)

(assert (=> b!1184374 (= lt!537015 (get!18884 (select (arr!36905 _values!996) from!1455) lt!537028))))

(declare-fun b!1184375 () Bool)

(declare-fun e!673379 () Bool)

(assert (=> b!1184375 (= e!673379 tp_is_empty!29855)))

(declare-fun b!1184376 () Bool)

(declare-fun res!787222 () Bool)

(assert (=> b!1184376 (=> (not res!787222) (not e!673390))))

(assert (=> b!1184376 (= res!787222 (= (select (arr!36904 _keys!1208) i!673) k!934))))

(declare-fun b!1184377 () Bool)

(declare-fun res!787228 () Bool)

(assert (=> b!1184377 (=> (not res!787228) (not e!673390))))

(assert (=> b!1184377 (= res!787228 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37440 _keys!1208))))))

(declare-fun b!1184378 () Bool)

(declare-fun res!787215 () Bool)

(assert (=> b!1184378 (=> (not res!787215) (not e!673390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184378 (= res!787215 (validMask!0 mask!1564))))

(declare-fun b!1184379 () Bool)

(assert (=> b!1184379 (= e!673384 (and e!673380 mapRes!46610))))

(declare-fun condMapEmpty!46610 () Bool)

(declare-fun mapDefault!46610 () ValueCell!14218)

