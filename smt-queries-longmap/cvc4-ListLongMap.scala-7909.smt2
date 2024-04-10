; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98202 () Bool)

(assert start!98202)

(declare-fun b_free!23903 () Bool)

(declare-fun b_next!23903 () Bool)

(assert (=> start!98202 (= b_free!23903 (not b_next!23903))))

(declare-fun tp!84413 () Bool)

(declare-fun b_and!38589 () Bool)

(assert (=> start!98202 (= tp!84413 b_and!38589)))

(declare-fun b!1130316 () Bool)

(declare-fun res!755246 () Bool)

(declare-fun e!643278 () Bool)

(assert (=> b!1130316 (=> (not res!755246) (not e!643278))))

(declare-datatypes ((array!73723 0))(
  ( (array!73724 (arr!35514 (Array (_ BitVec 32) (_ BitVec 64))) (size!36050 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73723)

(declare-datatypes ((List!24744 0))(
  ( (Nil!24741) (Cons!24740 (h!25949 (_ BitVec 64)) (t!35639 List!24744)) )
))
(declare-fun arrayNoDuplicates!0 (array!73723 (_ BitVec 32) List!24744) Bool)

(assert (=> b!1130316 (= res!755246 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24741))))

(declare-datatypes ((V!43037 0))(
  ( (V!43038 (val!14273 Int)) )
))
(declare-fun zeroValue!944 () V!43037)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!48306 () Bool)

(declare-datatypes ((ValueCell!13507 0))(
  ( (ValueCellFull!13507 (v!16906 V!43037)) (EmptyCell!13507) )
))
(declare-datatypes ((array!73725 0))(
  ( (array!73726 (arr!35515 (Array (_ BitVec 32) ValueCell!13507)) (size!36051 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73725)

(declare-fun minValue!944 () V!43037)

(declare-datatypes ((tuple2!17980 0))(
  ( (tuple2!17981 (_1!9001 (_ BitVec 64)) (_2!9001 V!43037)) )
))
(declare-datatypes ((List!24745 0))(
  ( (Nil!24742) (Cons!24741 (h!25950 tuple2!17980) (t!35640 List!24745)) )
))
(declare-datatypes ((ListLongMap!15949 0))(
  ( (ListLongMap!15950 (toList!7990 List!24745)) )
))
(declare-fun call!48309 () ListLongMap!15949)

(declare-fun getCurrentListMapNoExtraKeys!4477 (array!73723 array!73725 (_ BitVec 32) (_ BitVec 32) V!43037 V!43037 (_ BitVec 32) Int) ListLongMap!15949)

(assert (=> bm!48306 (= call!48309 (getCurrentListMapNoExtraKeys!4477 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!501922 () array!73723)

(declare-fun bm!48307 () Bool)

(declare-fun call!48314 () ListLongMap!15949)

(declare-fun lt!501926 () array!73725)

(assert (=> bm!48307 (= call!48314 (getCurrentListMapNoExtraKeys!4477 lt!501922 lt!501926 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130317 () Bool)

(declare-datatypes ((Unit!37029 0))(
  ( (Unit!37030) )
))
(declare-fun e!643284 () Unit!37029)

(declare-fun lt!501930 () Unit!37029)

(assert (=> b!1130317 (= e!643284 lt!501930)))

(declare-fun call!48315 () Unit!37029)

(assert (=> b!1130317 (= lt!501930 call!48315)))

(declare-fun call!48311 () Bool)

(assert (=> b!1130317 call!48311))

(declare-fun b!1130318 () Bool)

(declare-fun e!643285 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1169 (ListLongMap!15949 (_ BitVec 64)) ListLongMap!15949)

(assert (=> b!1130318 (= e!643285 (= call!48314 (-!1169 call!48309 k!934)))))

(declare-fun bm!48308 () Bool)

(declare-fun c!110005 () Bool)

(declare-fun call!48316 () Unit!37029)

(declare-fun c!110004 () Bool)

(declare-fun lt!501932 () ListLongMap!15949)

(declare-fun addStillContains!702 (ListLongMap!15949 (_ BitVec 64) V!43037 (_ BitVec 64)) Unit!37029)

(assert (=> bm!48308 (= call!48316 (addStillContains!702 lt!501932 (ite (or c!110005 c!110004) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110005 c!110004) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1130319 () Bool)

(declare-fun res!755240 () Bool)

(assert (=> b!1130319 (=> (not res!755240) (not e!643278))))

(assert (=> b!1130319 (= res!755240 (and (= (size!36051 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36050 _keys!1208) (size!36051 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44467 () Bool)

(declare-fun mapRes!44467 () Bool)

(assert (=> mapIsEmpty!44467 mapRes!44467))

(declare-fun b!1130320 () Bool)

(declare-fun e!643287 () Bool)

(declare-fun tp_is_empty!28433 () Bool)

(assert (=> b!1130320 (= e!643287 tp_is_empty!28433)))

(declare-fun bm!48309 () Bool)

(assert (=> bm!48309 (= call!48315 call!48316)))

(declare-fun res!755237 () Bool)

(assert (=> start!98202 (=> (not res!755237) (not e!643278))))

(assert (=> start!98202 (= res!755237 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36050 _keys!1208))))))

(assert (=> start!98202 e!643278))

(assert (=> start!98202 tp_is_empty!28433))

(declare-fun array_inv!27244 (array!73723) Bool)

(assert (=> start!98202 (array_inv!27244 _keys!1208)))

(assert (=> start!98202 true))

(assert (=> start!98202 tp!84413))

(declare-fun e!643282 () Bool)

(declare-fun array_inv!27245 (array!73725) Bool)

(assert (=> start!98202 (and (array_inv!27245 _values!996) e!643282)))

(declare-fun b!1130321 () Bool)

(declare-fun c!110006 () Bool)

(declare-fun lt!501924 () Bool)

(assert (=> b!1130321 (= c!110006 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501924))))

(declare-fun e!643279 () Unit!37029)

(assert (=> b!1130321 (= e!643279 e!643284)))

(declare-fun b!1130322 () Bool)

(declare-fun e!643276 () Bool)

(declare-fun e!643280 () Bool)

(assert (=> b!1130322 (= e!643276 e!643280)))

(declare-fun res!755247 () Bool)

(assert (=> b!1130322 (=> res!755247 e!643280)))

(assert (=> b!1130322 (= res!755247 (not (= (select (arr!35514 _keys!1208) from!1455) k!934)))))

(assert (=> b!1130322 e!643285))

(declare-fun c!110007 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130322 (= c!110007 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501919 () Unit!37029)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!422 (array!73723 array!73725 (_ BitVec 32) (_ BitVec 32) V!43037 V!43037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37029)

(assert (=> b!1130322 (= lt!501919 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130323 () Bool)

(assert (=> b!1130323 call!48311))

(declare-fun lt!501920 () Unit!37029)

(assert (=> b!1130323 (= lt!501920 call!48315)))

(assert (=> b!1130323 (= e!643279 lt!501920)))

(declare-fun b!1130324 () Bool)

(declare-fun res!755242 () Bool)

(assert (=> b!1130324 (=> (not res!755242) (not e!643278))))

(assert (=> b!1130324 (= res!755242 (= (select (arr!35514 _keys!1208) i!673) k!934))))

(declare-fun b!1130325 () Bool)

(declare-fun e!643273 () Bool)

(assert (=> b!1130325 (= e!643273 e!643276)))

(declare-fun res!755236 () Bool)

(assert (=> b!1130325 (=> res!755236 e!643276)))

(assert (=> b!1130325 (= res!755236 (not (= from!1455 i!673)))))

(declare-fun lt!501921 () ListLongMap!15949)

(assert (=> b!1130325 (= lt!501921 (getCurrentListMapNoExtraKeys!4477 lt!501922 lt!501926 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2553 (Int (_ BitVec 64)) V!43037)

(assert (=> b!1130325 (= lt!501926 (array!73726 (store (arr!35515 _values!996) i!673 (ValueCellFull!13507 (dynLambda!2553 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36051 _values!996)))))

(declare-fun lt!501929 () ListLongMap!15949)

(assert (=> b!1130325 (= lt!501929 (getCurrentListMapNoExtraKeys!4477 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130326 () Bool)

(declare-fun res!755239 () Bool)

(assert (=> b!1130326 (=> (not res!755239) (not e!643278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130326 (= res!755239 (validKeyInArray!0 k!934))))

(declare-fun b!1130327 () Bool)

(declare-fun e!643283 () Unit!37029)

(assert (=> b!1130327 (= e!643283 e!643279)))

(assert (=> b!1130327 (= c!110004 (and (not lt!501924) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130328 () Bool)

(assert (=> b!1130328 (= e!643285 (= call!48314 call!48309))))

(declare-fun b!1130329 () Bool)

(declare-fun e!643275 () Bool)

(assert (=> b!1130329 (= e!643275 true)))

(declare-fun lt!501918 () Bool)

(declare-fun contains!6513 (ListLongMap!15949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4423 (array!73723 array!73725 (_ BitVec 32) (_ BitVec 32) V!43037 V!43037 (_ BitVec 32) Int) ListLongMap!15949)

(assert (=> b!1130329 (= lt!501918 (contains!6513 (getCurrentListMap!4423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun mapNonEmpty!44467 () Bool)

(declare-fun tp!84412 () Bool)

(assert (=> mapNonEmpty!44467 (= mapRes!44467 (and tp!84412 e!643287))))

(declare-fun mapRest!44467 () (Array (_ BitVec 32) ValueCell!13507))

(declare-fun mapKey!44467 () (_ BitVec 32))

(declare-fun mapValue!44467 () ValueCell!13507)

(assert (=> mapNonEmpty!44467 (= (arr!35515 _values!996) (store mapRest!44467 mapKey!44467 mapValue!44467))))

(declare-fun b!1130330 () Bool)

(declare-fun res!755238 () Bool)

(assert (=> b!1130330 (=> (not res!755238) (not e!643278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130330 (= res!755238 (validMask!0 mask!1564))))

(declare-fun call!48310 () Bool)

(declare-fun lt!501928 () ListLongMap!15949)

(declare-fun bm!48310 () Bool)

(declare-fun call!48313 () ListLongMap!15949)

(assert (=> bm!48310 (= call!48310 (contains!6513 (ite c!110005 lt!501928 call!48313) k!934))))

(declare-fun b!1130331 () Bool)

(declare-fun lt!501931 () Unit!37029)

(assert (=> b!1130331 (= e!643283 lt!501931)))

(declare-fun lt!501925 () Unit!37029)

(assert (=> b!1130331 (= lt!501925 call!48316)))

(declare-fun call!48312 () ListLongMap!15949)

(assert (=> b!1130331 (= lt!501928 call!48312)))

(assert (=> b!1130331 call!48310))

(assert (=> b!1130331 (= lt!501931 (addStillContains!702 lt!501928 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun +!3440 (ListLongMap!15949 tuple2!17980) ListLongMap!15949)

(assert (=> b!1130331 (contains!6513 (+!3440 lt!501928 (tuple2!17981 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun b!1130332 () Bool)

(declare-fun e!643281 () Bool)

(assert (=> b!1130332 (= e!643281 (not e!643273))))

(declare-fun res!755245 () Bool)

(assert (=> b!1130332 (=> res!755245 e!643273)))

(assert (=> b!1130332 (= res!755245 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130332 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!501927 () Unit!37029)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73723 (_ BitVec 64) (_ BitVec 32)) Unit!37029)

(assert (=> b!1130332 (= lt!501927 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1130333 () Bool)

(declare-fun e!643277 () Bool)

(assert (=> b!1130333 (= e!643277 e!643275)))

(declare-fun res!755235 () Bool)

(assert (=> b!1130333 (=> res!755235 e!643275)))

(assert (=> b!1130333 (= res!755235 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36050 _keys!1208))))))

(declare-fun lt!501923 () Unit!37029)

(assert (=> b!1130333 (= lt!501923 e!643283)))

(assert (=> b!1130333 (= c!110005 (and (not lt!501924) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130333 (= lt!501924 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130334 () Bool)

(assert (=> b!1130334 (= e!643278 e!643281)))

(declare-fun res!755241 () Bool)

(assert (=> b!1130334 (=> (not res!755241) (not e!643281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73723 (_ BitVec 32)) Bool)

(assert (=> b!1130334 (= res!755241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501922 mask!1564))))

(assert (=> b!1130334 (= lt!501922 (array!73724 (store (arr!35514 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36050 _keys!1208)))))

(declare-fun b!1130335 () Bool)

(declare-fun res!755234 () Bool)

(assert (=> b!1130335 (=> (not res!755234) (not e!643278))))

(assert (=> b!1130335 (= res!755234 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36050 _keys!1208))))))

(declare-fun b!1130336 () Bool)

(declare-fun e!643274 () Bool)

(assert (=> b!1130336 (= e!643282 (and e!643274 mapRes!44467))))

(declare-fun condMapEmpty!44467 () Bool)

(declare-fun mapDefault!44467 () ValueCell!13507)

