; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98716 () Bool)

(assert start!98716)

(declare-fun b_free!24085 () Bool)

(declare-fun b_next!24085 () Bool)

(assert (=> start!98716 (= b_free!24085 (not b_next!24085))))

(declare-fun tp!84965 () Bool)

(declare-fun b_and!39021 () Bool)

(assert (=> start!98716 (= tp!84965 b_and!39021)))

(declare-fun b!1140380 () Bool)

(declare-fun res!760268 () Bool)

(declare-fun e!648956 () Bool)

(assert (=> b!1140380 (=> (not res!760268) (not e!648956))))

(declare-datatypes ((array!74131 0))(
  ( (array!74132 (arr!35710 (Array (_ BitVec 32) (_ BitVec 64))) (size!36247 (_ BitVec 32))) )
))
(declare-fun lt!507373 () array!74131)

(declare-datatypes ((List!24929 0))(
  ( (Nil!24926) (Cons!24925 (h!26143 (_ BitVec 64)) (t!35998 List!24929)) )
))
(declare-fun arrayNoDuplicates!0 (array!74131 (_ BitVec 32) List!24929) Bool)

(assert (=> b!1140380 (= res!760268 (arrayNoDuplicates!0 lt!507373 #b00000000000000000000000000000000 Nil!24926))))

(declare-datatypes ((V!43281 0))(
  ( (V!43282 (val!14364 Int)) )
))
(declare-fun zeroValue!944 () V!43281)

(declare-fun bm!50624 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!18166 0))(
  ( (tuple2!18167 (_1!9094 (_ BitVec 64)) (_2!9094 V!43281)) )
))
(declare-datatypes ((List!24930 0))(
  ( (Nil!24927) (Cons!24926 (h!26144 tuple2!18166) (t!35999 List!24930)) )
))
(declare-datatypes ((ListLongMap!16143 0))(
  ( (ListLongMap!16144 (toList!8087 List!24930)) )
))
(declare-fun lt!507379 () ListLongMap!16143)

(declare-fun c!112026 () Bool)

(declare-fun minValue!944 () V!43281)

(declare-fun lt!507370 () ListLongMap!16143)

(declare-datatypes ((Unit!37308 0))(
  ( (Unit!37309) )
))
(declare-fun call!50628 () Unit!37308)

(declare-fun c!112023 () Bool)

(declare-fun addStillContains!765 (ListLongMap!16143 (_ BitVec 64) V!43281 (_ BitVec 64)) Unit!37308)

(assert (=> bm!50624 (= call!50628 (addStillContains!765 (ite c!112023 lt!507379 lt!507370) (ite c!112023 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112026 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112023 minValue!944 (ite c!112026 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1140381 () Bool)

(declare-fun res!760265 () Bool)

(declare-fun e!648952 () Bool)

(assert (=> b!1140381 (=> (not res!760265) (not e!648952))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!74131)

(assert (=> b!1140381 (= res!760265 (= (select (arr!35710 _keys!1208) i!673) k0!934))))

(declare-fun b!1140382 () Bool)

(declare-fun e!648964 () Bool)

(declare-fun tp_is_empty!28615 () Bool)

(assert (=> b!1140382 (= e!648964 tp_is_empty!28615)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13598 0))(
  ( (ValueCellFull!13598 (v!16997 V!43281)) (EmptyCell!13598) )
))
(declare-datatypes ((array!74133 0))(
  ( (array!74134 (arr!35711 (Array (_ BitVec 32) ValueCell!13598)) (size!36248 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74133)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!50625 () Bool)

(declare-fun call!50633 () ListLongMap!16143)

(declare-fun getCurrentListMapNoExtraKeys!4596 (array!74131 array!74133 (_ BitVec 32) (_ BitVec 32) V!43281 V!43281 (_ BitVec 32) Int) ListLongMap!16143)

(assert (=> bm!50625 (= call!50633 (getCurrentListMapNoExtraKeys!4596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50626 () Bool)

(declare-fun call!50627 () ListLongMap!16143)

(declare-fun +!3537 (ListLongMap!16143 tuple2!18166) ListLongMap!16143)

(assert (=> bm!50626 (= call!50627 (+!3537 (ite c!112023 lt!507379 lt!507370) (ite c!112023 (tuple2!18167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112026 (tuple2!18167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18167 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1140383 () Bool)

(declare-fun e!648966 () Bool)

(declare-fun call!50630 () ListLongMap!16143)

(assert (=> b!1140383 (= e!648966 (= call!50630 call!50633))))

(declare-fun res!760258 () Bool)

(assert (=> start!98716 (=> (not res!760258) (not e!648952))))

(assert (=> start!98716 (= res!760258 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36247 _keys!1208))))))

(assert (=> start!98716 e!648952))

(assert (=> start!98716 tp_is_empty!28615))

(declare-fun array_inv!27422 (array!74131) Bool)

(assert (=> start!98716 (array_inv!27422 _keys!1208)))

(assert (=> start!98716 true))

(assert (=> start!98716 tp!84965))

(declare-fun e!648967 () Bool)

(declare-fun array_inv!27423 (array!74133) Bool)

(assert (=> start!98716 (and (array_inv!27423 _values!996) e!648967)))

(declare-fun b!1140384 () Bool)

(declare-fun res!760259 () Bool)

(assert (=> b!1140384 (=> (not res!760259) (not e!648952))))

(assert (=> b!1140384 (= res!760259 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36247 _keys!1208))))))

(declare-fun b!1140385 () Bool)

(declare-fun res!760261 () Bool)

(assert (=> b!1140385 (=> (not res!760261) (not e!648952))))

(assert (=> b!1140385 (= res!760261 (and (= (size!36248 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36247 _keys!1208) (size!36248 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50627 () Bool)

(declare-fun lt!507378 () array!74133)

(assert (=> bm!50627 (= call!50630 (getCurrentListMapNoExtraKeys!4596 lt!507373 lt!507378 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140386 () Bool)

(declare-fun lt!507385 () Bool)

(assert (=> b!1140386 (= c!112026 (and (not lt!507385) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648962 () Unit!37308)

(declare-fun e!648953 () Unit!37308)

(assert (=> b!1140386 (= e!648962 e!648953)))

(declare-fun mapNonEmpty!44747 () Bool)

(declare-fun mapRes!44747 () Bool)

(declare-fun tp!84966 () Bool)

(assert (=> mapNonEmpty!44747 (= mapRes!44747 (and tp!84966 e!648964))))

(declare-fun mapValue!44747 () ValueCell!13598)

(declare-fun mapKey!44747 () (_ BitVec 32))

(declare-fun mapRest!44747 () (Array (_ BitVec 32) ValueCell!13598))

(assert (=> mapNonEmpty!44747 (= (arr!35711 _values!996) (store mapRest!44747 mapKey!44747 mapValue!44747))))

(declare-fun b!1140387 () Bool)

(declare-fun e!648957 () Bool)

(assert (=> b!1140387 (= e!648956 (not e!648957))))

(declare-fun res!760256 () Bool)

(assert (=> b!1140387 (=> res!760256 e!648957)))

(assert (=> b!1140387 (= res!760256 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140387 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507369 () Unit!37308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74131 (_ BitVec 64) (_ BitVec 32)) Unit!37308)

(assert (=> b!1140387 (= lt!507369 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!50628 () Bool)

(declare-fun call!50634 () ListLongMap!16143)

(assert (=> bm!50628 (= call!50634 call!50627)))

(declare-fun b!1140388 () Bool)

(declare-fun e!648961 () Unit!37308)

(declare-fun Unit!37310 () Unit!37308)

(assert (=> b!1140388 (= e!648961 Unit!37310)))

(declare-fun e!648960 () Bool)

(declare-fun b!1140389 () Bool)

(assert (=> b!1140389 (= e!648960 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140390 () Bool)

(declare-fun res!760263 () Bool)

(assert (=> b!1140390 (=> (not res!760263) (not e!648952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74131 (_ BitVec 32)) Bool)

(assert (=> b!1140390 (= res!760263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140391 () Bool)

(declare-fun e!648955 () Unit!37308)

(declare-fun Unit!37311 () Unit!37308)

(assert (=> b!1140391 (= e!648955 Unit!37311)))

(declare-fun b!1140392 () Bool)

(declare-fun res!760260 () Bool)

(assert (=> b!1140392 (=> (not res!760260) (not e!648952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140392 (= res!760260 (validKeyInArray!0 k0!934))))

(declare-fun bm!50629 () Bool)

(declare-fun call!50631 () Unit!37308)

(assert (=> bm!50629 (= call!50631 call!50628)))

(declare-fun bm!50630 () Bool)

(declare-fun call!50632 () Bool)

(declare-fun call!50629 () Bool)

(assert (=> bm!50630 (= call!50632 call!50629)))

(declare-fun b!1140393 () Bool)

(assert (=> b!1140393 (= e!648952 e!648956)))

(declare-fun res!760267 () Bool)

(assert (=> b!1140393 (=> (not res!760267) (not e!648956))))

(assert (=> b!1140393 (= res!760267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507373 mask!1564))))

(assert (=> b!1140393 (= lt!507373 (array!74132 (store (arr!35710 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36247 _keys!1208)))))

(declare-fun b!1140394 () Bool)

(assert (=> b!1140394 call!50632))

(declare-fun lt!507368 () Unit!37308)

(assert (=> b!1140394 (= lt!507368 call!50631)))

(assert (=> b!1140394 (= e!648961 lt!507368)))

(declare-fun b!1140395 () Bool)

(declare-fun e!648954 () Bool)

(assert (=> b!1140395 (= e!648957 e!648954)))

(declare-fun res!760269 () Bool)

(assert (=> b!1140395 (=> res!760269 e!648954)))

(assert (=> b!1140395 (= res!760269 (not (= from!1455 i!673)))))

(declare-fun lt!507374 () ListLongMap!16143)

(assert (=> b!1140395 (= lt!507374 (getCurrentListMapNoExtraKeys!4596 lt!507373 lt!507378 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2642 (Int (_ BitVec 64)) V!43281)

(assert (=> b!1140395 (= lt!507378 (array!74134 (store (arr!35711 _values!996) i!673 (ValueCellFull!13598 (dynLambda!2642 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36248 _values!996)))))

(declare-fun lt!507380 () ListLongMap!16143)

(assert (=> b!1140395 (= lt!507380 (getCurrentListMapNoExtraKeys!4596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1140396 () Bool)

(declare-fun e!648959 () Bool)

(assert (=> b!1140396 (= e!648954 e!648959)))

(declare-fun res!760266 () Bool)

(assert (=> b!1140396 (=> res!760266 e!648959)))

(assert (=> b!1140396 (= res!760266 (not (= (select (arr!35710 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1140396 e!648966))

(declare-fun c!112025 () Bool)

(assert (=> b!1140396 (= c!112025 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507384 () Unit!37308)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!480 (array!74131 array!74133 (_ BitVec 32) (_ BitVec 32) V!43281 V!43281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37308)

(assert (=> b!1140396 (= lt!507384 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!480 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140397 () Bool)

(declare-fun e!648958 () Bool)

(assert (=> b!1140397 (= e!648958 tp_is_empty!28615)))

(declare-fun b!1140398 () Bool)

(declare-fun res!760262 () Bool)

(assert (=> b!1140398 (=> (not res!760262) (not e!648952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140398 (= res!760262 (validMask!0 mask!1564))))

(declare-fun b!1140399 () Bool)

(declare-fun e!648963 () Bool)

(assert (=> b!1140399 (= e!648963 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140400 () Bool)

(declare-fun res!760264 () Bool)

(assert (=> b!1140400 (=> (not res!760264) (not e!648952))))

(assert (=> b!1140400 (= res!760264 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24926))))

(declare-fun b!1140401 () Bool)

(assert (=> b!1140401 (= e!648953 e!648961)))

(declare-fun c!112021 () Bool)

(assert (=> b!1140401 (= c!112021 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507385))))

(declare-fun bm!50631 () Bool)

(declare-fun contains!6635 (ListLongMap!16143 (_ BitVec 64)) Bool)

(assert (=> bm!50631 (= call!50629 (contains!6635 (ite c!112023 lt!507379 call!50634) k0!934))))

(declare-fun mapIsEmpty!44747 () Bool)

(assert (=> mapIsEmpty!44747 mapRes!44747))

(declare-fun b!1140402 () Bool)

(assert (=> b!1140402 (= e!648960 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507385) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140403 () Bool)

(declare-fun -!1221 (ListLongMap!16143 (_ BitVec 64)) ListLongMap!16143)

(assert (=> b!1140403 (= e!648966 (= call!50630 (-!1221 call!50633 k0!934)))))

(declare-fun b!1140404 () Bool)

(declare-fun lt!507367 () Unit!37308)

(assert (=> b!1140404 (= e!648953 lt!507367)))

(assert (=> b!1140404 (= lt!507367 call!50631)))

(assert (=> b!1140404 call!50632))

(declare-fun b!1140405 () Bool)

(declare-fun Unit!37312 () Unit!37308)

(assert (=> b!1140405 (= e!648955 Unit!37312)))

(assert (=> b!1140405 (= lt!507385 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140405 (= c!112023 (and (not lt!507385) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507372 () Unit!37308)

(assert (=> b!1140405 (= lt!507372 e!648962)))

(declare-fun lt!507375 () Unit!37308)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!371 (array!74131 array!74133 (_ BitVec 32) (_ BitVec 32) V!43281 V!43281 (_ BitVec 64) (_ BitVec 32) Int) Unit!37308)

(assert (=> b!1140405 (= lt!507375 (lemmaListMapContainsThenArrayContainsFrom!371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112024 () Bool)

(assert (=> b!1140405 (= c!112024 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760257 () Bool)

(assert (=> b!1140405 (= res!760257 e!648960)))

(assert (=> b!1140405 (=> (not res!760257) (not e!648963))))

(assert (=> b!1140405 e!648963))

(declare-fun lt!507382 () Unit!37308)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74131 (_ BitVec 32) (_ BitVec 32)) Unit!37308)

(assert (=> b!1140405 (= lt!507382 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140405 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24926)))

(declare-fun lt!507377 () Unit!37308)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74131 (_ BitVec 64) (_ BitVec 32) List!24929) Unit!37308)

(assert (=> b!1140405 (= lt!507377 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24926))))

(assert (=> b!1140405 false))

(declare-fun b!1140406 () Bool)

(assert (=> b!1140406 (= e!648959 true)))

(declare-fun lt!507376 () Bool)

(assert (=> b!1140406 (= lt!507376 (contains!6635 lt!507370 (select (arr!35710 _keys!1208) from!1455)))))

(declare-fun lt!507383 () Unit!37308)

(assert (=> b!1140406 (= lt!507383 e!648955)))

(declare-fun c!112022 () Bool)

(assert (=> b!1140406 (= c!112022 (contains!6635 lt!507370 k0!934))))

(assert (=> b!1140406 (= lt!507370 (getCurrentListMapNoExtraKeys!4596 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140407 () Bool)

(assert (=> b!1140407 (contains!6635 call!50627 k0!934)))

(declare-fun lt!507381 () Unit!37308)

(assert (=> b!1140407 (= lt!507381 call!50628)))

(assert (=> b!1140407 call!50629))

(assert (=> b!1140407 (= lt!507379 (+!3537 lt!507370 (tuple2!18167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507371 () Unit!37308)

(assert (=> b!1140407 (= lt!507371 (addStillContains!765 lt!507370 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1140407 (= e!648962 lt!507381)))

(declare-fun b!1140408 () Bool)

(assert (=> b!1140408 (= e!648967 (and e!648958 mapRes!44747))))

(declare-fun condMapEmpty!44747 () Bool)

(declare-fun mapDefault!44747 () ValueCell!13598)

(assert (=> b!1140408 (= condMapEmpty!44747 (= (arr!35711 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13598)) mapDefault!44747)))))

(assert (= (and start!98716 res!760258) b!1140398))

(assert (= (and b!1140398 res!760262) b!1140385))

(assert (= (and b!1140385 res!760261) b!1140390))

(assert (= (and b!1140390 res!760263) b!1140400))

(assert (= (and b!1140400 res!760264) b!1140384))

(assert (= (and b!1140384 res!760259) b!1140392))

(assert (= (and b!1140392 res!760260) b!1140381))

(assert (= (and b!1140381 res!760265) b!1140393))

(assert (= (and b!1140393 res!760267) b!1140380))

(assert (= (and b!1140380 res!760268) b!1140387))

(assert (= (and b!1140387 (not res!760256)) b!1140395))

(assert (= (and b!1140395 (not res!760269)) b!1140396))

(assert (= (and b!1140396 c!112025) b!1140403))

(assert (= (and b!1140396 (not c!112025)) b!1140383))

(assert (= (or b!1140403 b!1140383) bm!50627))

(assert (= (or b!1140403 b!1140383) bm!50625))

(assert (= (and b!1140396 (not res!760266)) b!1140406))

(assert (= (and b!1140406 c!112022) b!1140405))

(assert (= (and b!1140406 (not c!112022)) b!1140391))

(assert (= (and b!1140405 c!112023) b!1140407))

(assert (= (and b!1140405 (not c!112023)) b!1140386))

(assert (= (and b!1140386 c!112026) b!1140404))

(assert (= (and b!1140386 (not c!112026)) b!1140401))

(assert (= (and b!1140401 c!112021) b!1140394))

(assert (= (and b!1140401 (not c!112021)) b!1140388))

(assert (= (or b!1140404 b!1140394) bm!50629))

(assert (= (or b!1140404 b!1140394) bm!50628))

(assert (= (or b!1140404 b!1140394) bm!50630))

(assert (= (or b!1140407 bm!50630) bm!50631))

(assert (= (or b!1140407 bm!50629) bm!50624))

(assert (= (or b!1140407 bm!50628) bm!50626))

(assert (= (and b!1140405 c!112024) b!1140389))

(assert (= (and b!1140405 (not c!112024)) b!1140402))

(assert (= (and b!1140405 res!760257) b!1140399))

(assert (= (and b!1140408 condMapEmpty!44747) mapIsEmpty!44747))

(assert (= (and b!1140408 (not condMapEmpty!44747)) mapNonEmpty!44747))

(get-info :version)

(assert (= (and mapNonEmpty!44747 ((_ is ValueCellFull!13598) mapValue!44747)) b!1140382))

(assert (= (and b!1140408 ((_ is ValueCellFull!13598) mapDefault!44747)) b!1140397))

(assert (= start!98716 b!1140408))

(declare-fun b_lambda!19185 () Bool)

(assert (=> (not b_lambda!19185) (not b!1140395)))

(declare-fun t!35997 () Bool)

(declare-fun tb!8889 () Bool)

(assert (=> (and start!98716 (= defaultEntry!1004 defaultEntry!1004) t!35997) tb!8889))

(declare-fun result!18351 () Bool)

(assert (=> tb!8889 (= result!18351 tp_is_empty!28615)))

(assert (=> b!1140395 t!35997))

(declare-fun b_and!39023 () Bool)

(assert (= b_and!39021 (and (=> t!35997 result!18351) b_and!39023)))

(declare-fun m!1052367 () Bool)

(assert (=> b!1140407 m!1052367))

(declare-fun m!1052369 () Bool)

(assert (=> b!1140407 m!1052369))

(declare-fun m!1052371 () Bool)

(assert (=> b!1140407 m!1052371))

(declare-fun m!1052373 () Bool)

(assert (=> b!1140392 m!1052373))

(declare-fun m!1052375 () Bool)

(assert (=> b!1140405 m!1052375))

(declare-fun m!1052377 () Bool)

(assert (=> b!1140405 m!1052377))

(declare-fun m!1052379 () Bool)

(assert (=> b!1140405 m!1052379))

(declare-fun m!1052381 () Bool)

(assert (=> b!1140405 m!1052381))

(declare-fun m!1052383 () Bool)

(assert (=> start!98716 m!1052383))

(declare-fun m!1052385 () Bool)

(assert (=> start!98716 m!1052385))

(declare-fun m!1052387 () Bool)

(assert (=> b!1140406 m!1052387))

(assert (=> b!1140406 m!1052387))

(declare-fun m!1052389 () Bool)

(assert (=> b!1140406 m!1052389))

(declare-fun m!1052391 () Bool)

(assert (=> b!1140406 m!1052391))

(declare-fun m!1052393 () Bool)

(assert (=> b!1140406 m!1052393))

(declare-fun m!1052395 () Bool)

(assert (=> b!1140395 m!1052395))

(declare-fun m!1052397 () Bool)

(assert (=> b!1140395 m!1052397))

(declare-fun m!1052399 () Bool)

(assert (=> b!1140395 m!1052399))

(declare-fun m!1052401 () Bool)

(assert (=> b!1140395 m!1052401))

(declare-fun m!1052403 () Bool)

(assert (=> b!1140381 m!1052403))

(declare-fun m!1052405 () Bool)

(assert (=> bm!50626 m!1052405))

(declare-fun m!1052407 () Bool)

(assert (=> bm!50624 m!1052407))

(declare-fun m!1052409 () Bool)

(assert (=> b!1140393 m!1052409))

(declare-fun m!1052411 () Bool)

(assert (=> b!1140393 m!1052411))

(declare-fun m!1052413 () Bool)

(assert (=> b!1140389 m!1052413))

(declare-fun m!1052415 () Bool)

(assert (=> mapNonEmpty!44747 m!1052415))

(assert (=> bm!50625 m!1052393))

(declare-fun m!1052417 () Bool)

(assert (=> b!1140380 m!1052417))

(assert (=> b!1140396 m!1052387))

(declare-fun m!1052419 () Bool)

(assert (=> b!1140396 m!1052419))

(declare-fun m!1052421 () Bool)

(assert (=> b!1140398 m!1052421))

(declare-fun m!1052423 () Bool)

(assert (=> bm!50627 m!1052423))

(declare-fun m!1052425 () Bool)

(assert (=> b!1140403 m!1052425))

(declare-fun m!1052427 () Bool)

(assert (=> b!1140400 m!1052427))

(declare-fun m!1052429 () Bool)

(assert (=> b!1140387 m!1052429))

(declare-fun m!1052431 () Bool)

(assert (=> b!1140387 m!1052431))

(declare-fun m!1052433 () Bool)

(assert (=> bm!50631 m!1052433))

(assert (=> b!1140399 m!1052413))

(declare-fun m!1052435 () Bool)

(assert (=> b!1140390 m!1052435))

(check-sat (not b!1140392) (not b!1140395) (not b!1140406) (not bm!50625) (not b_lambda!19185) (not bm!50624) (not b!1140390) (not b!1140380) (not b!1140398) tp_is_empty!28615 (not bm!50627) (not bm!50631) (not bm!50626) (not start!98716) (not b!1140393) (not b!1140396) (not b_next!24085) (not b!1140405) (not b!1140389) (not mapNonEmpty!44747) (not b!1140400) (not b!1140387) (not b!1140399) b_and!39023 (not b!1140403) (not b!1140407))
(check-sat b_and!39023 (not b_next!24085))
