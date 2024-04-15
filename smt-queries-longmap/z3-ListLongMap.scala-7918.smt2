; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98342 () Bool)

(assert start!98342)

(declare-fun b_free!23953 () Bool)

(declare-fun b_next!23953 () Bool)

(assert (=> start!98342 (= b_free!23953 (not b_next!23953))))

(declare-fun tp!84570 () Bool)

(declare-fun b_and!38733 () Bool)

(assert (=> start!98342 (= tp!84570 b_and!38733)))

(declare-fun b!1132965 () Bool)

(declare-fun res!756553 () Bool)

(declare-fun e!644804 () Bool)

(assert (=> b!1132965 (=> (not res!756553) (not e!644804))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132965 (= res!756553 (validMask!0 mask!1564))))

(declare-fun b!1132966 () Bool)

(declare-fun call!48957 () Bool)

(assert (=> b!1132966 call!48957))

(declare-datatypes ((Unit!36967 0))(
  ( (Unit!36968) )
))
(declare-fun lt!503315 () Unit!36967)

(declare-fun call!48955 () Unit!36967)

(assert (=> b!1132966 (= lt!503315 call!48955)))

(declare-fun e!644796 () Unit!36967)

(assert (=> b!1132966 (= e!644796 lt!503315)))

(declare-fun b!1132967 () Bool)

(declare-fun res!756560 () Bool)

(assert (=> b!1132967 (=> (not res!756560) (not e!644804))))

(declare-datatypes ((array!73750 0))(
  ( (array!73751 (arr!35526 (Array (_ BitVec 32) (_ BitVec 64))) (size!36064 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73750)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1132967 (= res!756560 (= (select (arr!35526 _keys!1208) i!673) k0!934))))

(declare-fun b!1132968 () Bool)

(declare-fun e!644793 () Unit!36967)

(assert (=> b!1132968 (= e!644793 e!644796)))

(declare-fun c!110524 () Bool)

(declare-fun lt!503312 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1132968 (= c!110524 (and (not lt!503312) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!43105 0))(
  ( (V!43106 (val!14298 Int)) )
))
(declare-fun zeroValue!944 () V!43105)

(declare-fun lt!503314 () array!73750)

(declare-datatypes ((ValueCell!13532 0))(
  ( (ValueCellFull!13532 (v!16934 V!43105)) (EmptyCell!13532) )
))
(declare-datatypes ((array!73752 0))(
  ( (array!73753 (arr!35527 (Array (_ BitVec 32) ValueCell!13532)) (size!36065 (_ BitVec 32))) )
))
(declare-fun lt!503319 () array!73752)

(declare-fun bm!48952 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18114 0))(
  ( (tuple2!18115 (_1!9068 (_ BitVec 64)) (_2!9068 V!43105)) )
))
(declare-datatypes ((List!24861 0))(
  ( (Nil!24858) (Cons!24857 (h!26066 tuple2!18114) (t!35797 List!24861)) )
))
(declare-datatypes ((ListLongMap!16083 0))(
  ( (ListLongMap!16084 (toList!8057 List!24861)) )
))
(declare-fun call!48958 () ListLongMap!16083)

(declare-fun minValue!944 () V!43105)

(declare-fun getCurrentListMapNoExtraKeys!4555 (array!73750 array!73752 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 32) Int) ListLongMap!16083)

(assert (=> bm!48952 (= call!48958 (getCurrentListMapNoExtraKeys!4555 lt!503314 lt!503319 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132969 () Bool)

(declare-fun res!756562 () Bool)

(assert (=> b!1132969 (=> (not res!756562) (not e!644804))))

(declare-datatypes ((List!24862 0))(
  ( (Nil!24859) (Cons!24858 (h!26067 (_ BitVec 64)) (t!35798 List!24862)) )
))
(declare-fun arrayNoDuplicates!0 (array!73750 (_ BitVec 32) List!24862) Bool)

(assert (=> b!1132969 (= res!756562 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24859))))

(declare-fun mapNonEmpty!44549 () Bool)

(declare-fun mapRes!44549 () Bool)

(declare-fun tp!84569 () Bool)

(declare-fun e!644794 () Bool)

(assert (=> mapNonEmpty!44549 (= mapRes!44549 (and tp!84569 e!644794))))

(declare-fun mapValue!44549 () ValueCell!13532)

(declare-fun mapRest!44549 () (Array (_ BitVec 32) ValueCell!13532))

(declare-fun _values!996 () array!73752)

(declare-fun mapKey!44549 () (_ BitVec 32))

(assert (=> mapNonEmpty!44549 (= (arr!35527 _values!996) (store mapRest!44549 mapKey!44549 mapValue!44549))))

(declare-fun b!1132970 () Bool)

(declare-fun e!644803 () Bool)

(assert (=> b!1132970 (= e!644803 true)))

(declare-fun e!644808 () Bool)

(assert (=> b!1132970 e!644808))

(declare-fun res!756554 () Bool)

(assert (=> b!1132970 (=> (not res!756554) (not e!644808))))

(declare-fun e!644806 () Bool)

(assert (=> b!1132970 (= res!756554 e!644806)))

(declare-fun c!110527 () Bool)

(assert (=> b!1132970 (= c!110527 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503308 () Unit!36967)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!324 (array!73750 array!73752 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 64) (_ BitVec 32) Int) Unit!36967)

(assert (=> b!1132970 (= lt!503308 (lemmaListMapContainsThenArrayContainsFrom!324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503322 () Unit!36967)

(assert (=> b!1132970 (= lt!503322 e!644793)))

(declare-fun c!110528 () Bool)

(assert (=> b!1132970 (= c!110528 (and (not lt!503312) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1132970 (= lt!503312 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!48956 () ListLongMap!16083)

(declare-fun b!1132971 () Bool)

(declare-fun e!644802 () Bool)

(declare-fun -!1161 (ListLongMap!16083 (_ BitVec 64)) ListLongMap!16083)

(assert (=> b!1132971 (= e!644802 (= call!48958 (-!1161 call!48956 k0!934)))))

(declare-fun lt!503311 () ListLongMap!16083)

(declare-fun call!48962 () Bool)

(declare-fun call!48960 () ListLongMap!16083)

(declare-fun bm!48953 () Bool)

(declare-fun contains!6511 (ListLongMap!16083 (_ BitVec 64)) Bool)

(assert (=> bm!48953 (= call!48962 (contains!6511 (ite c!110528 lt!503311 call!48960) k0!934))))

(declare-fun bm!48954 () Bool)

(assert (=> bm!48954 (= call!48957 call!48962)))

(declare-fun bm!48955 () Bool)

(declare-fun call!48959 () ListLongMap!16083)

(assert (=> bm!48955 (= call!48960 call!48959)))

(declare-fun b!1132972 () Bool)

(declare-fun res!756552 () Bool)

(assert (=> b!1132972 (=> (not res!756552) (not e!644804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73750 (_ BitVec 32)) Bool)

(assert (=> b!1132972 (= res!756552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1132973 () Bool)

(assert (=> b!1132973 (= e!644806 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503312) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1132974 () Bool)

(declare-fun res!756559 () Bool)

(assert (=> b!1132974 (=> (not res!756559) (not e!644804))))

(assert (=> b!1132974 (= res!756559 (and (= (size!36065 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36064 _keys!1208) (size!36065 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!48956 () Bool)

(declare-fun lt!503310 () ListLongMap!16083)

(declare-fun +!3492 (ListLongMap!16083 tuple2!18114) ListLongMap!16083)

(assert (=> bm!48956 (= call!48959 (+!3492 (ite c!110528 lt!503311 lt!503310) (ite c!110528 (tuple2!18115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110524 (tuple2!18115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1132975 () Bool)

(declare-fun arrayContainsKey!0 (array!73750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132975 (= e!644808 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132976 () Bool)

(declare-fun res!756564 () Bool)

(declare-fun e!644801 () Bool)

(assert (=> b!1132976 (=> (not res!756564) (not e!644801))))

(assert (=> b!1132976 (= res!756564 (arrayNoDuplicates!0 lt!503314 #b00000000000000000000000000000000 Nil!24859))))

(declare-fun b!1132977 () Bool)

(declare-fun res!756565 () Bool)

(assert (=> b!1132977 (=> (not res!756565) (not e!644804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132977 (= res!756565 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44549 () Bool)

(assert (=> mapIsEmpty!44549 mapRes!44549))

(declare-fun b!1132978 () Bool)

(declare-fun res!756556 () Bool)

(assert (=> b!1132978 (=> (not res!756556) (not e!644804))))

(assert (=> b!1132978 (= res!756556 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36064 _keys!1208))))))

(declare-fun b!1132979 () Bool)

(declare-fun e!644798 () Bool)

(assert (=> b!1132979 (= e!644798 e!644803)))

(declare-fun res!756557 () Bool)

(assert (=> b!1132979 (=> res!756557 e!644803)))

(assert (=> b!1132979 (= res!756557 (not (contains!6511 lt!503310 k0!934)))))

(assert (=> b!1132979 (= lt!503310 (getCurrentListMapNoExtraKeys!4555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132980 () Bool)

(declare-fun e!644799 () Bool)

(assert (=> b!1132980 (= e!644799 e!644798)))

(declare-fun res!756563 () Bool)

(assert (=> b!1132980 (=> res!756563 e!644798)))

(assert (=> b!1132980 (= res!756563 (not (= (select (arr!35526 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1132980 e!644802))

(declare-fun c!110525 () Bool)

(assert (=> b!1132980 (= c!110525 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503317 () Unit!36967)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!445 (array!73750 array!73752 (_ BitVec 32) (_ BitVec 32) V!43105 V!43105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36967)

(assert (=> b!1132980 (= lt!503317 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132981 () Bool)

(declare-fun e!644797 () Unit!36967)

(declare-fun lt!503318 () Unit!36967)

(assert (=> b!1132981 (= e!644797 lt!503318)))

(assert (=> b!1132981 (= lt!503318 call!48955)))

(assert (=> b!1132981 call!48957))

(declare-fun b!1132982 () Bool)

(declare-fun c!110526 () Bool)

(assert (=> b!1132982 (= c!110526 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503312))))

(assert (=> b!1132982 (= e!644796 e!644797)))

(declare-fun call!48961 () Unit!36967)

(declare-fun bm!48957 () Bool)

(declare-fun addStillContains!711 (ListLongMap!16083 (_ BitVec 64) V!43105 (_ BitVec 64)) Unit!36967)

(assert (=> bm!48957 (= call!48961 (addStillContains!711 lt!503310 (ite (or c!110528 c!110524) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110528 c!110524) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!48958 () Bool)

(assert (=> bm!48958 (= call!48955 call!48961)))

(declare-fun b!1132983 () Bool)

(declare-fun e!644800 () Bool)

(assert (=> b!1132983 (= e!644800 e!644799)))

(declare-fun res!756555 () Bool)

(assert (=> b!1132983 (=> res!756555 e!644799)))

(assert (=> b!1132983 (= res!756555 (not (= from!1455 i!673)))))

(declare-fun lt!503316 () ListLongMap!16083)

(assert (=> b!1132983 (= lt!503316 (getCurrentListMapNoExtraKeys!4555 lt!503314 lt!503319 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2554 (Int (_ BitVec 64)) V!43105)

(assert (=> b!1132983 (= lt!503319 (array!73753 (store (arr!35527 _values!996) i!673 (ValueCellFull!13532 (dynLambda!2554 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36065 _values!996)))))

(declare-fun lt!503320 () ListLongMap!16083)

(assert (=> b!1132983 (= lt!503320 (getCurrentListMapNoExtraKeys!4555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1132984 () Bool)

(declare-fun tp_is_empty!28483 () Bool)

(assert (=> b!1132984 (= e!644794 tp_is_empty!28483)))

(declare-fun b!1132985 () Bool)

(assert (=> b!1132985 (= e!644804 e!644801)))

(declare-fun res!756566 () Bool)

(assert (=> b!1132985 (=> (not res!756566) (not e!644801))))

(assert (=> b!1132985 (= res!756566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503314 mask!1564))))

(assert (=> b!1132985 (= lt!503314 (array!73751 (store (arr!35526 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36064 _keys!1208)))))

(declare-fun b!1132986 () Bool)

(declare-fun e!644795 () Bool)

(declare-fun e!644807 () Bool)

(assert (=> b!1132986 (= e!644795 (and e!644807 mapRes!44549))))

(declare-fun condMapEmpty!44549 () Bool)

(declare-fun mapDefault!44549 () ValueCell!13532)

(assert (=> b!1132986 (= condMapEmpty!44549 (= (arr!35527 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13532)) mapDefault!44549)))))

(declare-fun b!1132987 () Bool)

(assert (=> b!1132987 (= e!644806 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1132988 () Bool)

(assert (=> b!1132988 (= e!644801 (not e!644800))))

(declare-fun res!756558 () Bool)

(assert (=> b!1132988 (=> res!756558 e!644800)))

(assert (=> b!1132988 (= res!756558 (bvsgt from!1455 i!673))))

(assert (=> b!1132988 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503309 () Unit!36967)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73750 (_ BitVec 64) (_ BitVec 32)) Unit!36967)

(assert (=> b!1132988 (= lt!503309 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!48959 () Bool)

(assert (=> bm!48959 (= call!48956 (getCurrentListMapNoExtraKeys!4555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132989 () Bool)

(assert (=> b!1132989 (= e!644802 (= call!48958 call!48956))))

(declare-fun b!1132990 () Bool)

(assert (=> b!1132990 (= e!644807 tp_is_empty!28483)))

(declare-fun b!1132991 () Bool)

(declare-fun Unit!36969 () Unit!36967)

(assert (=> b!1132991 (= e!644797 Unit!36969)))

(declare-fun b!1132992 () Bool)

(declare-fun lt!503313 () Unit!36967)

(assert (=> b!1132992 (= e!644793 lt!503313)))

(declare-fun lt!503321 () Unit!36967)

(assert (=> b!1132992 (= lt!503321 call!48961)))

(assert (=> b!1132992 (= lt!503311 (+!3492 lt!503310 (tuple2!18115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1132992 call!48962))

(assert (=> b!1132992 (= lt!503313 (addStillContains!711 lt!503311 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1132992 (contains!6511 call!48959 k0!934)))

(declare-fun res!756561 () Bool)

(assert (=> start!98342 (=> (not res!756561) (not e!644804))))

(assert (=> start!98342 (= res!756561 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36064 _keys!1208))))))

(assert (=> start!98342 e!644804))

(assert (=> start!98342 tp_is_empty!28483))

(declare-fun array_inv!27320 (array!73750) Bool)

(assert (=> start!98342 (array_inv!27320 _keys!1208)))

(assert (=> start!98342 true))

(assert (=> start!98342 tp!84570))

(declare-fun array_inv!27321 (array!73752) Bool)

(assert (=> start!98342 (and (array_inv!27321 _values!996) e!644795)))

(assert (= (and start!98342 res!756561) b!1132965))

(assert (= (and b!1132965 res!756553) b!1132974))

(assert (= (and b!1132974 res!756559) b!1132972))

(assert (= (and b!1132972 res!756552) b!1132969))

(assert (= (and b!1132969 res!756562) b!1132978))

(assert (= (and b!1132978 res!756556) b!1132977))

(assert (= (and b!1132977 res!756565) b!1132967))

(assert (= (and b!1132967 res!756560) b!1132985))

(assert (= (and b!1132985 res!756566) b!1132976))

(assert (= (and b!1132976 res!756564) b!1132988))

(assert (= (and b!1132988 (not res!756558)) b!1132983))

(assert (= (and b!1132983 (not res!756555)) b!1132980))

(assert (= (and b!1132980 c!110525) b!1132971))

(assert (= (and b!1132980 (not c!110525)) b!1132989))

(assert (= (or b!1132971 b!1132989) bm!48952))

(assert (= (or b!1132971 b!1132989) bm!48959))

(assert (= (and b!1132980 (not res!756563)) b!1132979))

(assert (= (and b!1132979 (not res!756557)) b!1132970))

(assert (= (and b!1132970 c!110528) b!1132992))

(assert (= (and b!1132970 (not c!110528)) b!1132968))

(assert (= (and b!1132968 c!110524) b!1132966))

(assert (= (and b!1132968 (not c!110524)) b!1132982))

(assert (= (and b!1132982 c!110526) b!1132981))

(assert (= (and b!1132982 (not c!110526)) b!1132991))

(assert (= (or b!1132966 b!1132981) bm!48958))

(assert (= (or b!1132966 b!1132981) bm!48955))

(assert (= (or b!1132966 b!1132981) bm!48954))

(assert (= (or b!1132992 bm!48954) bm!48953))

(assert (= (or b!1132992 bm!48958) bm!48957))

(assert (= (or b!1132992 bm!48955) bm!48956))

(assert (= (and b!1132970 c!110527) b!1132987))

(assert (= (and b!1132970 (not c!110527)) b!1132973))

(assert (= (and b!1132970 res!756554) b!1132975))

(assert (= (and b!1132986 condMapEmpty!44549) mapIsEmpty!44549))

(assert (= (and b!1132986 (not condMapEmpty!44549)) mapNonEmpty!44549))

(get-info :version)

(assert (= (and mapNonEmpty!44549 ((_ is ValueCellFull!13532) mapValue!44549)) b!1132984))

(assert (= (and b!1132986 ((_ is ValueCellFull!13532) mapDefault!44549)) b!1132990))

(assert (= start!98342 b!1132986))

(declare-fun b_lambda!19041 () Bool)

(assert (=> (not b_lambda!19041) (not b!1132983)))

(declare-fun t!35796 () Bool)

(declare-fun tb!8757 () Bool)

(assert (=> (and start!98342 (= defaultEntry!1004 defaultEntry!1004) t!35796) tb!8757))

(declare-fun result!18087 () Bool)

(assert (=> tb!8757 (= result!18087 tp_is_empty!28483)))

(assert (=> b!1132983 t!35796))

(declare-fun b_and!38735 () Bool)

(assert (= b_and!38733 (and (=> t!35796 result!18087) b_and!38735)))

(declare-fun m!1045663 () Bool)

(assert (=> b!1132970 m!1045663))

(declare-fun m!1045665 () Bool)

(assert (=> b!1132965 m!1045665))

(declare-fun m!1045667 () Bool)

(assert (=> b!1132971 m!1045667))

(declare-fun m!1045669 () Bool)

(assert (=> b!1132980 m!1045669))

(declare-fun m!1045671 () Bool)

(assert (=> b!1132980 m!1045671))

(declare-fun m!1045673 () Bool)

(assert (=> b!1132967 m!1045673))

(declare-fun m!1045675 () Bool)

(assert (=> b!1132976 m!1045675))

(declare-fun m!1045677 () Bool)

(assert (=> mapNonEmpty!44549 m!1045677))

(declare-fun m!1045679 () Bool)

(assert (=> b!1132969 m!1045679))

(declare-fun m!1045681 () Bool)

(assert (=> b!1132979 m!1045681))

(declare-fun m!1045683 () Bool)

(assert (=> b!1132979 m!1045683))

(declare-fun m!1045685 () Bool)

(assert (=> b!1132972 m!1045685))

(declare-fun m!1045687 () Bool)

(assert (=> start!98342 m!1045687))

(declare-fun m!1045689 () Bool)

(assert (=> start!98342 m!1045689))

(declare-fun m!1045691 () Bool)

(assert (=> b!1132977 m!1045691))

(declare-fun m!1045693 () Bool)

(assert (=> bm!48956 m!1045693))

(assert (=> bm!48959 m!1045683))

(declare-fun m!1045695 () Bool)

(assert (=> bm!48952 m!1045695))

(declare-fun m!1045697 () Bool)

(assert (=> bm!48953 m!1045697))

(declare-fun m!1045699 () Bool)

(assert (=> b!1132975 m!1045699))

(assert (=> b!1132987 m!1045699))

(declare-fun m!1045701 () Bool)

(assert (=> b!1132992 m!1045701))

(declare-fun m!1045703 () Bool)

(assert (=> b!1132992 m!1045703))

(declare-fun m!1045705 () Bool)

(assert (=> b!1132992 m!1045705))

(declare-fun m!1045707 () Bool)

(assert (=> b!1132983 m!1045707))

(declare-fun m!1045709 () Bool)

(assert (=> b!1132983 m!1045709))

(declare-fun m!1045711 () Bool)

(assert (=> b!1132983 m!1045711))

(declare-fun m!1045713 () Bool)

(assert (=> b!1132983 m!1045713))

(declare-fun m!1045715 () Bool)

(assert (=> b!1132985 m!1045715))

(declare-fun m!1045717 () Bool)

(assert (=> b!1132985 m!1045717))

(declare-fun m!1045719 () Bool)

(assert (=> b!1132988 m!1045719))

(declare-fun m!1045721 () Bool)

(assert (=> b!1132988 m!1045721))

(declare-fun m!1045723 () Bool)

(assert (=> bm!48957 m!1045723))

(check-sat (not bm!48956) (not b!1132977) tp_is_empty!28483 (not start!98342) (not b!1132983) (not b!1132972) (not b!1132976) (not b!1132985) (not b_next!23953) (not b!1132965) (not b!1132980) (not bm!48957) (not b!1132987) (not b_lambda!19041) (not b!1132979) b_and!38735 (not bm!48953) (not bm!48952) (not bm!48959) (not mapNonEmpty!44549) (not b!1132992) (not b!1132975) (not b!1132988) (not b!1132971) (not b!1132969) (not b!1132970))
(check-sat b_and!38735 (not b_next!23953))
