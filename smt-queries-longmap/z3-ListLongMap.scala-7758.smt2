; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97528 () Bool)

(assert start!97528)

(declare-fun b_free!23263 () Bool)

(declare-fun b_next!23263 () Bool)

(assert (=> start!97528 (= b_free!23263 (not b_next!23263))))

(declare-fun tp!82087 () Bool)

(declare-fun b_and!37369 () Bool)

(assert (=> start!97528 (= tp!82087 b_and!37369)))

(declare-fun b!1109284 () Bool)

(declare-fun res!739926 () Bool)

(declare-fun e!632955 () Bool)

(assert (=> b!1109284 (=> (not res!739926) (not e!632955))))

(declare-datatypes ((array!71997 0))(
  ( (array!71998 (arr!34645 (Array (_ BitVec 32) (_ BitVec 64))) (size!35182 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71997)

(declare-datatypes ((List!24156 0))(
  ( (Nil!24153) (Cons!24152 (h!25370 (_ BitVec 64)) (t!34457 List!24156)) )
))
(declare-fun arrayNoDuplicates!0 (array!71997 (_ BitVec 32) List!24156) Bool)

(assert (=> b!1109284 (= res!739926 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24153))))

(declare-fun b!1109286 () Bool)

(declare-fun res!739936 () Bool)

(assert (=> b!1109286 (=> (not res!739936) (not e!632955))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109286 (= res!739936 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43102 () Bool)

(declare-fun mapRes!43102 () Bool)

(assert (=> mapIsEmpty!43102 mapRes!43102))

(declare-fun b!1109287 () Bool)

(declare-fun e!632951 () Bool)

(declare-fun e!632952 () Bool)

(assert (=> b!1109287 (= e!632951 (not e!632952))))

(declare-fun res!739933 () Bool)

(assert (=> b!1109287 (=> res!739933 e!632952)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109287 (= res!739933 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35182 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109287 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36339 0))(
  ( (Unit!36340) )
))
(declare-fun lt!496236 () Unit!36339)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71997 (_ BitVec 64) (_ BitVec 32)) Unit!36339)

(assert (=> b!1109287 (= lt!496236 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43102 () Bool)

(declare-fun tp!82088 () Bool)

(declare-fun e!632956 () Bool)

(assert (=> mapNonEmpty!43102 (= mapRes!43102 (and tp!82088 e!632956))))

(declare-datatypes ((V!41825 0))(
  ( (V!41826 (val!13818 Int)) )
))
(declare-datatypes ((ValueCell!13052 0))(
  ( (ValueCellFull!13052 (v!16447 V!41825)) (EmptyCell!13052) )
))
(declare-fun mapRest!43102 () (Array (_ BitVec 32) ValueCell!13052))

(declare-fun mapValue!43102 () ValueCell!13052)

(declare-fun mapKey!43102 () (_ BitVec 32))

(declare-datatypes ((array!71999 0))(
  ( (array!72000 (arr!34646 (Array (_ BitVec 32) ValueCell!13052)) (size!35183 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71999)

(assert (=> mapNonEmpty!43102 (= (arr!34646 _values!996) (store mapRest!43102 mapKey!43102 mapValue!43102))))

(declare-fun b!1109288 () Bool)

(declare-fun tp_is_empty!27523 () Bool)

(assert (=> b!1109288 (= e!632956 tp_is_empty!27523)))

(declare-fun b!1109289 () Bool)

(declare-fun res!739934 () Bool)

(assert (=> b!1109289 (=> (not res!739934) (not e!632955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109289 (= res!739934 (validKeyInArray!0 k0!934))))

(declare-fun e!632953 () Bool)

(declare-fun b!1109290 () Bool)

(declare-datatypes ((tuple2!17470 0))(
  ( (tuple2!17471 (_1!8746 (_ BitVec 64)) (_2!8746 V!41825)) )
))
(declare-datatypes ((List!24157 0))(
  ( (Nil!24154) (Cons!24153 (h!25371 tuple2!17470) (t!34458 List!24157)) )
))
(declare-datatypes ((ListLongMap!15447 0))(
  ( (ListLongMap!15448 (toList!7739 List!24157)) )
))
(declare-fun call!46552 () ListLongMap!15447)

(declare-fun call!46553 () ListLongMap!15447)

(declare-fun -!997 (ListLongMap!15447 (_ BitVec 64)) ListLongMap!15447)

(assert (=> b!1109290 (= e!632953 (= call!46553 (-!997 call!46552 k0!934)))))

(declare-fun b!1109291 () Bool)

(declare-fun res!739927 () Bool)

(assert (=> b!1109291 (=> (not res!739927) (not e!632955))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1109291 (= res!739927 (and (= (size!35183 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35182 _keys!1208) (size!35183 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!41825)

(declare-fun bm!46549 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41825)

(declare-fun lt!496237 () array!71997)

(declare-fun getCurrentListMapNoExtraKeys!4274 (array!71997 array!71999 (_ BitVec 32) (_ BitVec 32) V!41825 V!41825 (_ BitVec 32) Int) ListLongMap!15447)

(declare-fun dynLambda!2390 (Int (_ BitVec 64)) V!41825)

(assert (=> bm!46549 (= call!46553 (getCurrentListMapNoExtraKeys!4274 lt!496237 (array!72000 (store (arr!34646 _values!996) i!673 (ValueCellFull!13052 (dynLambda!2390 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35183 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46550 () Bool)

(assert (=> bm!46550 (= call!46552 (getCurrentListMapNoExtraKeys!4274 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109285 () Bool)

(declare-fun e!632958 () Bool)

(declare-fun e!632957 () Bool)

(assert (=> b!1109285 (= e!632958 (and e!632957 mapRes!43102))))

(declare-fun condMapEmpty!43102 () Bool)

(declare-fun mapDefault!43102 () ValueCell!13052)

(assert (=> b!1109285 (= condMapEmpty!43102 (= (arr!34646 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13052)) mapDefault!43102)))))

(declare-fun res!739929 () Bool)

(assert (=> start!97528 (=> (not res!739929) (not e!632955))))

(assert (=> start!97528 (= res!739929 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35182 _keys!1208))))))

(assert (=> start!97528 e!632955))

(assert (=> start!97528 tp_is_empty!27523))

(declare-fun array_inv!26690 (array!71997) Bool)

(assert (=> start!97528 (array_inv!26690 _keys!1208)))

(assert (=> start!97528 true))

(assert (=> start!97528 tp!82087))

(declare-fun array_inv!26691 (array!71999) Bool)

(assert (=> start!97528 (and (array_inv!26691 _values!996) e!632958)))

(declare-fun b!1109292 () Bool)

(assert (=> b!1109292 (= e!632957 tp_is_empty!27523)))

(declare-fun b!1109293 () Bool)

(assert (=> b!1109293 (= e!632952 true)))

(assert (=> b!1109293 e!632953))

(declare-fun c!109490 () Bool)

(assert (=> b!1109293 (= c!109490 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496235 () Unit!36339)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!267 (array!71997 array!71999 (_ BitVec 32) (_ BitVec 32) V!41825 V!41825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36339)

(assert (=> b!1109293 (= lt!496235 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!267 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109294 () Bool)

(declare-fun res!739932 () Bool)

(assert (=> b!1109294 (=> (not res!739932) (not e!632955))))

(assert (=> b!1109294 (= res!739932 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35182 _keys!1208))))))

(declare-fun b!1109295 () Bool)

(assert (=> b!1109295 (= e!632953 (= call!46553 call!46552))))

(declare-fun b!1109296 () Bool)

(declare-fun res!739930 () Bool)

(assert (=> b!1109296 (=> (not res!739930) (not e!632955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71997 (_ BitVec 32)) Bool)

(assert (=> b!1109296 (= res!739930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109297 () Bool)

(assert (=> b!1109297 (= e!632955 e!632951)))

(declare-fun res!739935 () Bool)

(assert (=> b!1109297 (=> (not res!739935) (not e!632951))))

(assert (=> b!1109297 (= res!739935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496237 mask!1564))))

(assert (=> b!1109297 (= lt!496237 (array!71998 (store (arr!34645 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35182 _keys!1208)))))

(declare-fun b!1109298 () Bool)

(declare-fun res!739931 () Bool)

(assert (=> b!1109298 (=> (not res!739931) (not e!632951))))

(assert (=> b!1109298 (= res!739931 (arrayNoDuplicates!0 lt!496237 #b00000000000000000000000000000000 Nil!24153))))

(declare-fun b!1109299 () Bool)

(declare-fun res!739928 () Bool)

(assert (=> b!1109299 (=> (not res!739928) (not e!632955))))

(assert (=> b!1109299 (= res!739928 (= (select (arr!34645 _keys!1208) i!673) k0!934))))

(assert (= (and start!97528 res!739929) b!1109286))

(assert (= (and b!1109286 res!739936) b!1109291))

(assert (= (and b!1109291 res!739927) b!1109296))

(assert (= (and b!1109296 res!739930) b!1109284))

(assert (= (and b!1109284 res!739926) b!1109294))

(assert (= (and b!1109294 res!739932) b!1109289))

(assert (= (and b!1109289 res!739934) b!1109299))

(assert (= (and b!1109299 res!739928) b!1109297))

(assert (= (and b!1109297 res!739935) b!1109298))

(assert (= (and b!1109298 res!739931) b!1109287))

(assert (= (and b!1109287 (not res!739933)) b!1109293))

(assert (= (and b!1109293 c!109490) b!1109290))

(assert (= (and b!1109293 (not c!109490)) b!1109295))

(assert (= (or b!1109290 b!1109295) bm!46549))

(assert (= (or b!1109290 b!1109295) bm!46550))

(assert (= (and b!1109285 condMapEmpty!43102) mapIsEmpty!43102))

(assert (= (and b!1109285 (not condMapEmpty!43102)) mapNonEmpty!43102))

(get-info :version)

(assert (= (and mapNonEmpty!43102 ((_ is ValueCellFull!13052) mapValue!43102)) b!1109288))

(assert (= (and b!1109285 ((_ is ValueCellFull!13052) mapDefault!43102)) b!1109292))

(assert (= start!97528 b!1109285))

(declare-fun b_lambda!18293 () Bool)

(assert (=> (not b_lambda!18293) (not bm!46549)))

(declare-fun t!34456 () Bool)

(declare-fun tb!8121 () Bool)

(assert (=> (and start!97528 (= defaultEntry!1004 defaultEntry!1004) t!34456) tb!8121))

(declare-fun result!16811 () Bool)

(assert (=> tb!8121 (= result!16811 tp_is_empty!27523)))

(assert (=> bm!46549 t!34456))

(declare-fun b_and!37371 () Bool)

(assert (= b_and!37369 (and (=> t!34456 result!16811) b_and!37371)))

(declare-fun m!1028271 () Bool)

(assert (=> b!1109286 m!1028271))

(declare-fun m!1028273 () Bool)

(assert (=> b!1109284 m!1028273))

(declare-fun m!1028275 () Bool)

(assert (=> mapNonEmpty!43102 m!1028275))

(declare-fun m!1028277 () Bool)

(assert (=> b!1109299 m!1028277))

(declare-fun m!1028279 () Bool)

(assert (=> b!1109287 m!1028279))

(declare-fun m!1028281 () Bool)

(assert (=> b!1109287 m!1028281))

(declare-fun m!1028283 () Bool)

(assert (=> bm!46549 m!1028283))

(declare-fun m!1028285 () Bool)

(assert (=> bm!46549 m!1028285))

(declare-fun m!1028287 () Bool)

(assert (=> bm!46549 m!1028287))

(declare-fun m!1028289 () Bool)

(assert (=> b!1109290 m!1028289))

(declare-fun m!1028291 () Bool)

(assert (=> b!1109296 m!1028291))

(declare-fun m!1028293 () Bool)

(assert (=> b!1109293 m!1028293))

(declare-fun m!1028295 () Bool)

(assert (=> bm!46550 m!1028295))

(declare-fun m!1028297 () Bool)

(assert (=> b!1109298 m!1028297))

(declare-fun m!1028299 () Bool)

(assert (=> b!1109289 m!1028299))

(declare-fun m!1028301 () Bool)

(assert (=> b!1109297 m!1028301))

(declare-fun m!1028303 () Bool)

(assert (=> b!1109297 m!1028303))

(declare-fun m!1028305 () Bool)

(assert (=> start!97528 m!1028305))

(declare-fun m!1028307 () Bool)

(assert (=> start!97528 m!1028307))

(check-sat (not b!1109296) (not b!1109286) (not b!1109284) (not bm!46549) (not b!1109290) (not mapNonEmpty!43102) (not b!1109287) b_and!37371 (not b_lambda!18293) (not b!1109297) (not b!1109289) (not b_next!23263) (not b!1109293) (not start!97528) (not bm!46550) (not b!1109298) tp_is_empty!27523)
(check-sat b_and!37371 (not b_next!23263))
