; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98446 () Bool)

(assert start!98446)

(declare-fun b_free!23911 () Bool)

(declare-fun b_next!23911 () Bool)

(assert (=> start!98446 (= b_free!23911 (not b_next!23911))))

(declare-fun tp!84436 () Bool)

(declare-fun b_and!38615 () Bool)

(assert (=> start!98446 (= tp!84436 b_and!38615)))

(declare-fun b!1131963 () Bool)

(declare-fun res!755942 () Bool)

(declare-fun e!644319 () Bool)

(assert (=> b!1131963 (=> (not res!755942) (not e!644319))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131963 (= res!755942 (validKeyInArray!0 k0!934))))

(declare-fun b!1131964 () Bool)

(declare-datatypes ((Unit!37015 0))(
  ( (Unit!37016) )
))
(declare-fun e!644309 () Unit!37015)

(declare-fun lt!502618 () Unit!37015)

(assert (=> b!1131964 (= e!644309 lt!502618)))

(declare-fun lt!502620 () Unit!37015)

(declare-fun call!48475 () Unit!37015)

(assert (=> b!1131964 (= lt!502620 call!48475)))

(declare-datatypes ((V!43049 0))(
  ( (V!43050 (val!14277 Int)) )
))
(declare-datatypes ((tuple2!18000 0))(
  ( (tuple2!18001 (_1!9011 (_ BitVec 64)) (_2!9011 V!43049)) )
))
(declare-datatypes ((List!24778 0))(
  ( (Nil!24775) (Cons!24774 (h!25992 tuple2!18000) (t!35673 List!24778)) )
))
(declare-datatypes ((ListLongMap!15977 0))(
  ( (ListLongMap!15978 (toList!8004 List!24778)) )
))
(declare-fun lt!502621 () ListLongMap!15977)

(declare-fun lt!502627 () ListLongMap!15977)

(declare-fun zeroValue!944 () V!43049)

(declare-fun +!3471 (ListLongMap!15977 tuple2!18000) ListLongMap!15977)

(assert (=> b!1131964 (= lt!502621 (+!3471 lt!502627 (tuple2!18001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!48479 () Bool)

(assert (=> b!1131964 call!48479))

(declare-fun minValue!944 () V!43049)

(declare-fun addStillContains!696 (ListLongMap!15977 (_ BitVec 64) V!43049 (_ BitVec 64)) Unit!37015)

(assert (=> b!1131964 (= lt!502618 (addStillContains!696 lt!502621 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!48478 () ListLongMap!15977)

(declare-fun contains!6538 (ListLongMap!15977 (_ BitVec 64)) Bool)

(assert (=> b!1131964 (contains!6538 call!48478 k0!934)))

(declare-fun bm!48469 () Bool)

(declare-fun call!48474 () ListLongMap!15977)

(assert (=> bm!48469 (= call!48474 call!48478)))

(declare-fun b!1131965 () Bool)

(declare-fun res!755946 () Bool)

(assert (=> b!1131965 (=> (not res!755946) (not e!644319))))

(declare-datatypes ((array!73785 0))(
  ( (array!73786 (arr!35539 (Array (_ BitVec 32) (_ BitVec 64))) (size!36076 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73785)

(declare-datatypes ((List!24779 0))(
  ( (Nil!24776) (Cons!24775 (h!25993 (_ BitVec 64)) (t!35674 List!24779)) )
))
(declare-fun arrayNoDuplicates!0 (array!73785 (_ BitVec 32) List!24779) Bool)

(assert (=> b!1131965 (= res!755946 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24776))))

(declare-fun b!1131966 () Bool)

(declare-fun e!644312 () Bool)

(declare-fun e!644315 () Bool)

(declare-fun mapRes!44479 () Bool)

(assert (=> b!1131966 (= e!644312 (and e!644315 mapRes!44479))))

(declare-fun condMapEmpty!44479 () Bool)

(declare-datatypes ((ValueCell!13511 0))(
  ( (ValueCellFull!13511 (v!16906 V!43049)) (EmptyCell!13511) )
))
(declare-datatypes ((array!73787 0))(
  ( (array!73788 (arr!35540 (Array (_ BitVec 32) ValueCell!13511)) (size!36077 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73787)

(declare-fun mapDefault!44479 () ValueCell!13511)

(assert (=> b!1131966 (= condMapEmpty!44479 (= (arr!35540 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13511)) mapDefault!44479)))))

(declare-fun b!1131967 () Bool)

(declare-fun res!755944 () Bool)

(assert (=> b!1131967 (=> (not res!755944) (not e!644319))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73785 (_ BitVec 32)) Bool)

(assert (=> b!1131967 (= res!755944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131968 () Bool)

(declare-fun res!755940 () Bool)

(assert (=> b!1131968 (=> (not res!755940) (not e!644319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131968 (= res!755940 (validMask!0 mask!1564))))

(declare-fun b!1131969 () Bool)

(declare-fun e!644316 () Bool)

(assert (=> b!1131969 (= e!644319 e!644316)))

(declare-fun res!755941 () Bool)

(assert (=> b!1131969 (=> (not res!755941) (not e!644316))))

(declare-fun lt!502626 () array!73785)

(assert (=> b!1131969 (= res!755941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502626 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131969 (= lt!502626 (array!73786 (store (arr!35539 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36076 _keys!1208)))))

(declare-fun b!1131970 () Bool)

(declare-fun e!644321 () Bool)

(declare-fun tp_is_empty!28441 () Bool)

(assert (=> b!1131970 (= e!644321 tp_is_empty!28441)))

(declare-fun b!1131971 () Bool)

(declare-fun res!755939 () Bool)

(assert (=> b!1131971 (=> (not res!755939) (not e!644319))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1131971 (= res!755939 (and (= (size!36077 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36076 _keys!1208) (size!36077 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48470 () Bool)

(declare-fun call!48472 () Unit!37015)

(assert (=> bm!48470 (= call!48472 call!48475)))

(declare-fun b!1131972 () Bool)

(declare-fun e!644318 () Bool)

(assert (=> b!1131972 (= e!644318 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!502622 () Bool)

(declare-fun getCurrentListMap!4433 (array!73785 array!73787 (_ BitVec 32) (_ BitVec 32) V!43049 V!43049 (_ BitVec 32) Int) ListLongMap!15977)

(assert (=> b!1131972 (= lt!502622 (contains!6538 (getCurrentListMap!4433 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1131973 () Bool)

(declare-fun e!644320 () Unit!37015)

(declare-fun Unit!37017 () Unit!37015)

(assert (=> b!1131973 (= e!644320 Unit!37017)))

(declare-fun b!1131974 () Bool)

(declare-fun res!755945 () Bool)

(assert (=> b!1131974 (=> (not res!755945) (not e!644319))))

(assert (=> b!1131974 (= res!755945 (= (select (arr!35539 _keys!1208) i!673) k0!934))))

(declare-fun bm!48471 () Bool)

(declare-fun c!110462 () Bool)

(assert (=> bm!48471 (= call!48479 (contains!6538 (ite c!110462 lt!502621 call!48474) k0!934))))

(declare-fun b!1131976 () Bool)

(declare-fun lt!502614 () Unit!37015)

(assert (=> b!1131976 (= e!644320 lt!502614)))

(assert (=> b!1131976 (= lt!502614 call!48472)))

(declare-fun call!48477 () Bool)

(assert (=> b!1131976 call!48477))

(declare-fun c!110463 () Bool)

(declare-fun bm!48472 () Bool)

(assert (=> bm!48472 (= call!48478 (+!3471 (ite c!110462 lt!502621 lt!502627) (ite c!110462 (tuple2!18001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110463 (tuple2!18001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun call!48476 () ListLongMap!15977)

(declare-fun b!1131977 () Bool)

(declare-fun e!644310 () Bool)

(declare-fun call!48473 () ListLongMap!15977)

(declare-fun -!1165 (ListLongMap!15977 (_ BitVec 64)) ListLongMap!15977)

(assert (=> b!1131977 (= e!644310 (= call!48473 (-!1165 call!48476 k0!934)))))

(declare-fun b!1131978 () Bool)

(assert (=> b!1131978 (= e!644310 (= call!48473 call!48476))))

(declare-fun b!1131979 () Bool)

(declare-fun e!644313 () Bool)

(declare-fun e!644308 () Bool)

(assert (=> b!1131979 (= e!644313 e!644308)))

(declare-fun res!755943 () Bool)

(assert (=> b!1131979 (=> res!755943 e!644308)))

(assert (=> b!1131979 (= res!755943 (not (= (select (arr!35539 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1131979 e!644310))

(declare-fun c!110464 () Bool)

(assert (=> b!1131979 (= c!110464 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502619 () Unit!37015)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!425 (array!73785 array!73787 (_ BitVec 32) (_ BitVec 32) V!43049 V!43049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37015)

(assert (=> b!1131979 (= lt!502619 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!425 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131980 () Bool)

(declare-fun e!644314 () Bool)

(assert (=> b!1131980 (= e!644316 (not e!644314))))

(declare-fun res!755950 () Bool)

(assert (=> b!1131980 (=> res!755950 e!644314)))

(assert (=> b!1131980 (= res!755950 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131980 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502623 () Unit!37015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73785 (_ BitVec 64) (_ BitVec 32)) Unit!37015)

(assert (=> b!1131980 (= lt!502623 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1131981 () Bool)

(assert (=> b!1131981 call!48477))

(declare-fun lt!502616 () Unit!37015)

(assert (=> b!1131981 (= lt!502616 call!48472)))

(declare-fun e!644322 () Unit!37015)

(assert (=> b!1131981 (= e!644322 lt!502616)))

(declare-fun bm!48473 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4522 (array!73785 array!73787 (_ BitVec 32) (_ BitVec 32) V!43049 V!43049 (_ BitVec 32) Int) ListLongMap!15977)

(assert (=> bm!48473 (= call!48476 (getCurrentListMapNoExtraKeys!4522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48474 () Bool)

(declare-fun lt!502613 () array!73787)

(assert (=> bm!48474 (= call!48473 (getCurrentListMapNoExtraKeys!4522 lt!502626 lt!502613 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48475 () Bool)

(assert (=> bm!48475 (= call!48475 (addStillContains!696 lt!502627 (ite (or c!110462 c!110463) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110462 c!110463) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!48476 () Bool)

(assert (=> bm!48476 (= call!48477 call!48479)))

(declare-fun mapIsEmpty!44479 () Bool)

(assert (=> mapIsEmpty!44479 mapRes!44479))

(declare-fun b!1131982 () Bool)

(declare-fun res!755937 () Bool)

(assert (=> b!1131982 (=> (not res!755937) (not e!644316))))

(assert (=> b!1131982 (= res!755937 (arrayNoDuplicates!0 lt!502626 #b00000000000000000000000000000000 Nil!24776))))

(declare-fun b!1131983 () Bool)

(assert (=> b!1131983 (= e!644315 tp_is_empty!28441)))

(declare-fun b!1131984 () Bool)

(declare-fun e!644311 () Bool)

(assert (=> b!1131984 (= e!644311 e!644318)))

(declare-fun res!755936 () Bool)

(assert (=> b!1131984 (=> res!755936 e!644318)))

(assert (=> b!1131984 (= res!755936 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36076 _keys!1208))))))

(declare-fun lt!502625 () Unit!37015)

(assert (=> b!1131984 (= lt!502625 e!644309)))

(declare-fun lt!502624 () Bool)

(assert (=> b!1131984 (= c!110462 (and (not lt!502624) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131984 (= lt!502624 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1131985 () Bool)

(declare-fun res!755938 () Bool)

(assert (=> b!1131985 (=> (not res!755938) (not e!644319))))

(assert (=> b!1131985 (= res!755938 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36076 _keys!1208))))))

(declare-fun mapNonEmpty!44479 () Bool)

(declare-fun tp!84437 () Bool)

(assert (=> mapNonEmpty!44479 (= mapRes!44479 (and tp!84437 e!644321))))

(declare-fun mapValue!44479 () ValueCell!13511)

(declare-fun mapRest!44479 () (Array (_ BitVec 32) ValueCell!13511))

(declare-fun mapKey!44479 () (_ BitVec 32))

(assert (=> mapNonEmpty!44479 (= (arr!35540 _values!996) (store mapRest!44479 mapKey!44479 mapValue!44479))))

(declare-fun b!1131986 () Bool)

(declare-fun c!110465 () Bool)

(assert (=> b!1131986 (= c!110465 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502624))))

(assert (=> b!1131986 (= e!644322 e!644320)))

(declare-fun b!1131975 () Bool)

(assert (=> b!1131975 (= e!644308 e!644311)))

(declare-fun res!755949 () Bool)

(assert (=> b!1131975 (=> res!755949 e!644311)))

(assert (=> b!1131975 (= res!755949 (not (contains!6538 lt!502627 k0!934)))))

(assert (=> b!1131975 (= lt!502627 (getCurrentListMapNoExtraKeys!4522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!755947 () Bool)

(assert (=> start!98446 (=> (not res!755947) (not e!644319))))

(assert (=> start!98446 (= res!755947 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36076 _keys!1208))))))

(assert (=> start!98446 e!644319))

(assert (=> start!98446 tp_is_empty!28441))

(declare-fun array_inv!27318 (array!73785) Bool)

(assert (=> start!98446 (array_inv!27318 _keys!1208)))

(assert (=> start!98446 true))

(assert (=> start!98446 tp!84436))

(declare-fun array_inv!27319 (array!73787) Bool)

(assert (=> start!98446 (and (array_inv!27319 _values!996) e!644312)))

(declare-fun b!1131987 () Bool)

(assert (=> b!1131987 (= e!644309 e!644322)))

(assert (=> b!1131987 (= c!110463 (and (not lt!502624) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131988 () Bool)

(assert (=> b!1131988 (= e!644314 e!644313)))

(declare-fun res!755948 () Bool)

(assert (=> b!1131988 (=> res!755948 e!644313)))

(assert (=> b!1131988 (= res!755948 (not (= from!1455 i!673)))))

(declare-fun lt!502617 () ListLongMap!15977)

(assert (=> b!1131988 (= lt!502617 (getCurrentListMapNoExtraKeys!4522 lt!502626 lt!502613 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2583 (Int (_ BitVec 64)) V!43049)

(assert (=> b!1131988 (= lt!502613 (array!73788 (store (arr!35540 _values!996) i!673 (ValueCellFull!13511 (dynLambda!2583 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36077 _values!996)))))

(declare-fun lt!502615 () ListLongMap!15977)

(assert (=> b!1131988 (= lt!502615 (getCurrentListMapNoExtraKeys!4522 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!98446 res!755947) b!1131968))

(assert (= (and b!1131968 res!755940) b!1131971))

(assert (= (and b!1131971 res!755939) b!1131967))

(assert (= (and b!1131967 res!755944) b!1131965))

(assert (= (and b!1131965 res!755946) b!1131985))

(assert (= (and b!1131985 res!755938) b!1131963))

(assert (= (and b!1131963 res!755942) b!1131974))

(assert (= (and b!1131974 res!755945) b!1131969))

(assert (= (and b!1131969 res!755941) b!1131982))

(assert (= (and b!1131982 res!755937) b!1131980))

(assert (= (and b!1131980 (not res!755950)) b!1131988))

(assert (= (and b!1131988 (not res!755948)) b!1131979))

(assert (= (and b!1131979 c!110464) b!1131977))

(assert (= (and b!1131979 (not c!110464)) b!1131978))

(assert (= (or b!1131977 b!1131978) bm!48474))

(assert (= (or b!1131977 b!1131978) bm!48473))

(assert (= (and b!1131979 (not res!755943)) b!1131975))

(assert (= (and b!1131975 (not res!755949)) b!1131984))

(assert (= (and b!1131984 c!110462) b!1131964))

(assert (= (and b!1131984 (not c!110462)) b!1131987))

(assert (= (and b!1131987 c!110463) b!1131981))

(assert (= (and b!1131987 (not c!110463)) b!1131986))

(assert (= (and b!1131986 c!110465) b!1131976))

(assert (= (and b!1131986 (not c!110465)) b!1131973))

(assert (= (or b!1131981 b!1131976) bm!48470))

(assert (= (or b!1131981 b!1131976) bm!48469))

(assert (= (or b!1131981 b!1131976) bm!48476))

(assert (= (or b!1131964 bm!48476) bm!48471))

(assert (= (or b!1131964 bm!48470) bm!48475))

(assert (= (or b!1131964 bm!48469) bm!48472))

(assert (= (and b!1131984 (not res!755936)) b!1131972))

(assert (= (and b!1131966 condMapEmpty!44479) mapIsEmpty!44479))

(assert (= (and b!1131966 (not condMapEmpty!44479)) mapNonEmpty!44479))

(get-info :version)

(assert (= (and mapNonEmpty!44479 ((_ is ValueCellFull!13511) mapValue!44479)) b!1131970))

(assert (= (and b!1131966 ((_ is ValueCellFull!13511) mapDefault!44479)) b!1131983))

(assert (= start!98446 b!1131966))

(declare-fun b_lambda!18891 () Bool)

(assert (=> (not b_lambda!18891) (not b!1131988)))

(declare-fun t!35672 () Bool)

(declare-fun tb!8715 () Bool)

(assert (=> (and start!98446 (= defaultEntry!1004 defaultEntry!1004) t!35672) tb!8715))

(declare-fun result!17999 () Bool)

(assert (=> tb!8715 (= result!17999 tp_is_empty!28441)))

(assert (=> b!1131988 t!35672))

(declare-fun b_and!38617 () Bool)

(assert (= b_and!38615 (and (=> t!35672 result!17999) b_and!38617)))

(declare-fun m!1045425 () Bool)

(assert (=> b!1131988 m!1045425))

(declare-fun m!1045427 () Bool)

(assert (=> b!1131988 m!1045427))

(declare-fun m!1045429 () Bool)

(assert (=> b!1131988 m!1045429))

(declare-fun m!1045431 () Bool)

(assert (=> b!1131988 m!1045431))

(declare-fun m!1045433 () Bool)

(assert (=> b!1131979 m!1045433))

(declare-fun m!1045435 () Bool)

(assert (=> b!1131979 m!1045435))

(declare-fun m!1045437 () Bool)

(assert (=> b!1131965 m!1045437))

(declare-fun m!1045439 () Bool)

(assert (=> bm!48474 m!1045439))

(declare-fun m!1045441 () Bool)

(assert (=> b!1131974 m!1045441))

(declare-fun m!1045443 () Bool)

(assert (=> b!1131980 m!1045443))

(declare-fun m!1045445 () Bool)

(assert (=> b!1131980 m!1045445))

(declare-fun m!1045447 () Bool)

(assert (=> bm!48472 m!1045447))

(declare-fun m!1045449 () Bool)

(assert (=> b!1131968 m!1045449))

(declare-fun m!1045451 () Bool)

(assert (=> bm!48475 m!1045451))

(declare-fun m!1045453 () Bool)

(assert (=> b!1131969 m!1045453))

(declare-fun m!1045455 () Bool)

(assert (=> b!1131969 m!1045455))

(declare-fun m!1045457 () Bool)

(assert (=> b!1131967 m!1045457))

(declare-fun m!1045459 () Bool)

(assert (=> bm!48473 m!1045459))

(declare-fun m!1045461 () Bool)

(assert (=> bm!48471 m!1045461))

(declare-fun m!1045463 () Bool)

(assert (=> start!98446 m!1045463))

(declare-fun m!1045465 () Bool)

(assert (=> start!98446 m!1045465))

(declare-fun m!1045467 () Bool)

(assert (=> b!1131972 m!1045467))

(assert (=> b!1131972 m!1045467))

(declare-fun m!1045469 () Bool)

(assert (=> b!1131972 m!1045469))

(declare-fun m!1045471 () Bool)

(assert (=> b!1131982 m!1045471))

(declare-fun m!1045473 () Bool)

(assert (=> b!1131977 m!1045473))

(declare-fun m!1045475 () Bool)

(assert (=> mapNonEmpty!44479 m!1045475))

(declare-fun m!1045477 () Bool)

(assert (=> b!1131963 m!1045477))

(declare-fun m!1045479 () Bool)

(assert (=> b!1131964 m!1045479))

(declare-fun m!1045481 () Bool)

(assert (=> b!1131964 m!1045481))

(declare-fun m!1045483 () Bool)

(assert (=> b!1131964 m!1045483))

(declare-fun m!1045485 () Bool)

(assert (=> b!1131975 m!1045485))

(assert (=> b!1131975 m!1045459))

(check-sat (not mapNonEmpty!44479) (not b!1131963) tp_is_empty!28441 (not b_lambda!18891) (not b!1131980) (not bm!48472) (not b!1131965) (not b!1131979) (not bm!48475) b_and!38617 (not b_next!23911) (not b!1131967) (not b!1131977) (not b!1131968) (not bm!48474) (not b!1131988) (not bm!48471) (not b!1131975) (not bm!48473) (not b!1131964) (not b!1131982) (not start!98446) (not b!1131969) (not b!1131972))
(check-sat b_and!38617 (not b_next!23911))
