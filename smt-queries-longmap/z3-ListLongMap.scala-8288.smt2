; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101236 () Bool)

(assert start!101236)

(declare-fun b_free!25999 () Bool)

(declare-fun b_next!25999 () Bool)

(assert (=> start!101236 (= b_free!25999 (not b_next!25999))))

(declare-fun tp!91012 () Bool)

(declare-fun b_and!43081 () Bool)

(assert (=> start!101236 (= tp!91012 b_and!43081)))

(declare-fun b!1210974 () Bool)

(declare-fun res!804463 () Bool)

(declare-fun e!687858 () Bool)

(assert (=> b!1210974 (=> (not res!804463) (not e!687858))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1210974 (= res!804463 (validKeyInArray!0 k0!934))))

(declare-fun bm!59491 () Bool)

(declare-datatypes ((Unit!40048 0))(
  ( (Unit!40049) )
))
(declare-fun call!59495 () Unit!40048)

(declare-fun call!59497 () Unit!40048)

(assert (=> bm!59491 (= call!59495 call!59497)))

(declare-datatypes ((V!46065 0))(
  ( (V!46066 (val!15408 Int)) )
))
(declare-fun zeroValue!944 () V!46065)

(declare-fun c!119510 () Bool)

(declare-datatypes ((tuple2!19796 0))(
  ( (tuple2!19797 (_1!9909 (_ BitVec 64)) (_2!9909 V!46065)) )
))
(declare-datatypes ((List!26601 0))(
  ( (Nil!26598) (Cons!26597 (h!27815 tuple2!19796) (t!39572 List!26601)) )
))
(declare-datatypes ((ListLongMap!17773 0))(
  ( (ListLongMap!17774 (toList!8902 List!26601)) )
))
(declare-fun lt!549605 () ListLongMap!17773)

(declare-fun bm!59492 () Bool)

(declare-fun c!119508 () Bool)

(declare-fun minValue!944 () V!46065)

(declare-fun addStillContains!1046 (ListLongMap!17773 (_ BitVec 64) V!46065 (_ BitVec 64)) Unit!40048)

(assert (=> bm!59492 (= call!59497 (addStillContains!1046 lt!549605 (ite (or c!119508 c!119510) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119508 c!119510) zeroValue!944 minValue!944) k0!934))))

(declare-fun call!59498 () ListLongMap!17773)

(declare-fun bm!59493 () Bool)

(declare-fun +!4063 (ListLongMap!17773 tuple2!19796) ListLongMap!17773)

(assert (=> bm!59493 (= call!59498 (+!4063 lt!549605 (ite (or c!119508 c!119510) (tuple2!19797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1210976 () Bool)

(declare-fun e!687866 () Unit!40048)

(declare-fun lt!549608 () Unit!40048)

(assert (=> b!1210976 (= e!687866 lt!549608)))

(declare-fun lt!549612 () Unit!40048)

(assert (=> b!1210976 (= lt!549612 call!59497)))

(declare-fun lt!549599 () ListLongMap!17773)

(assert (=> b!1210976 (= lt!549599 call!59498)))

(declare-fun call!59494 () Bool)

(assert (=> b!1210976 call!59494))

(assert (=> b!1210976 (= lt!549608 (addStillContains!1046 lt!549599 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6995 (ListLongMap!17773 (_ BitVec 64)) Bool)

(assert (=> b!1210976 (contains!6995 (+!4063 lt!549599 (tuple2!19797 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1210977 () Bool)

(declare-fun res!804450 () Bool)

(assert (=> b!1210977 (=> (not res!804450) (not e!687858))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1210977 (= res!804450 (validMask!0 mask!1564))))

(declare-fun e!687868 () Bool)

(declare-fun call!59500 () ListLongMap!17773)

(declare-fun b!1210978 () Bool)

(declare-fun call!59496 () ListLongMap!17773)

(declare-fun -!1832 (ListLongMap!17773 (_ BitVec 64)) ListLongMap!17773)

(assert (=> b!1210978 (= e!687868 (= call!59500 (-!1832 call!59496 k0!934)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1210979 () Bool)

(declare-fun lt!549601 () Bool)

(declare-fun e!687857 () Bool)

(assert (=> b!1210979 (= e!687857 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!549601) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1210980 () Bool)

(declare-fun e!687855 () Unit!40048)

(assert (=> b!1210980 (= e!687866 e!687855)))

(assert (=> b!1210980 (= c!119510 (and (not lt!549601) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1210981 () Bool)

(declare-fun res!804454 () Bool)

(assert (=> b!1210981 (=> (not res!804454) (not e!687858))))

(declare-datatypes ((array!78225 0))(
  ( (array!78226 (arr!37743 (Array (_ BitVec 32) (_ BitVec 64))) (size!38280 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78225)

(declare-datatypes ((List!26602 0))(
  ( (Nil!26599) (Cons!26598 (h!27816 (_ BitVec 64)) (t!39573 List!26602)) )
))
(declare-fun arrayNoDuplicates!0 (array!78225 (_ BitVec 32) List!26602) Bool)

(assert (=> b!1210981 (= res!804454 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26599))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!59494 () Bool)

(declare-datatypes ((ValueCell!14642 0))(
  ( (ValueCellFull!14642 (v!18055 V!46065)) (EmptyCell!14642) )
))
(declare-datatypes ((array!78227 0))(
  ( (array!78228 (arr!37744 (Array (_ BitVec 32) ValueCell!14642)) (size!38281 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78227)

(declare-fun getCurrentListMapNoExtraKeys!5363 (array!78225 array!78227 (_ BitVec 32) (_ BitVec 32) V!46065 V!46065 (_ BitVec 32) Int) ListLongMap!17773)

(assert (=> bm!59494 (= call!59496 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210982 () Bool)

(declare-fun res!804455 () Bool)

(assert (=> b!1210982 (=> (not res!804455) (not e!687858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78225 (_ BitVec 32)) Bool)

(assert (=> b!1210982 (= res!804455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!804459 () Bool)

(assert (=> start!101236 (=> (not res!804459) (not e!687858))))

(assert (=> start!101236 (= res!804459 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38280 _keys!1208))))))

(assert (=> start!101236 e!687858))

(declare-fun tp_is_empty!30703 () Bool)

(assert (=> start!101236 tp_is_empty!30703))

(declare-fun array_inv!28812 (array!78225) Bool)

(assert (=> start!101236 (array_inv!28812 _keys!1208)))

(assert (=> start!101236 true))

(assert (=> start!101236 tp!91012))

(declare-fun e!687861 () Bool)

(declare-fun array_inv!28813 (array!78227) Bool)

(assert (=> start!101236 (and (array_inv!28813 _values!996) e!687861)))

(declare-fun b!1210975 () Bool)

(declare-fun e!687856 () Unit!40048)

(declare-fun lt!549600 () Unit!40048)

(assert (=> b!1210975 (= e!687856 lt!549600)))

(assert (=> b!1210975 (= lt!549600 call!59495)))

(declare-fun call!59501 () Bool)

(assert (=> b!1210975 call!59501))

(declare-fun b!1210983 () Bool)

(declare-fun c!119509 () Bool)

(assert (=> b!1210983 (= c!119509 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!549601))))

(assert (=> b!1210983 (= e!687855 e!687856)))

(declare-fun call!59499 () ListLongMap!17773)

(declare-fun bm!59495 () Bool)

(assert (=> bm!59495 (= call!59494 (contains!6995 (ite c!119508 lt!549599 call!59499) k0!934))))

(declare-fun b!1210984 () Bool)

(assert (=> b!1210984 (= e!687868 (= call!59500 call!59496))))

(declare-fun b!1210985 () Bool)

(declare-fun res!804453 () Bool)

(assert (=> b!1210985 (=> (not res!804453) (not e!687858))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210985 (= res!804453 (= (select (arr!37743 _keys!1208) i!673) k0!934))))

(declare-fun b!1210986 () Bool)

(declare-fun e!687854 () Bool)

(declare-fun e!687860 () Bool)

(assert (=> b!1210986 (= e!687854 e!687860)))

(declare-fun res!804461 () Bool)

(assert (=> b!1210986 (=> res!804461 e!687860)))

(assert (=> b!1210986 (= res!804461 (not (= (select (arr!37743 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1210986 e!687868))

(declare-fun c!119512 () Bool)

(assert (=> b!1210986 (= c!119512 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!549606 () Unit!40048)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1050 (array!78225 array!78227 (_ BitVec 32) (_ BitVec 32) V!46065 V!46065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40048)

(assert (=> b!1210986 (= lt!549606 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1050 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!59496 () Bool)

(assert (=> bm!59496 (= call!59499 call!59498)))

(declare-fun b!1210987 () Bool)

(declare-fun e!687865 () Bool)

(assert (=> b!1210987 (= e!687858 e!687865)))

(declare-fun res!804452 () Bool)

(assert (=> b!1210987 (=> (not res!804452) (not e!687865))))

(declare-fun lt!549597 () array!78225)

(assert (=> b!1210987 (= res!804452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!549597 mask!1564))))

(assert (=> b!1210987 (= lt!549597 (array!78226 (store (arr!37743 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38280 _keys!1208)))))

(declare-fun lt!549604 () array!78227)

(declare-fun bm!59497 () Bool)

(assert (=> bm!59497 (= call!59500 (getCurrentListMapNoExtraKeys!5363 lt!549597 lt!549604 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210988 () Bool)

(declare-fun e!687864 () Bool)

(assert (=> b!1210988 (= e!687864 tp_is_empty!30703)))

(declare-fun mapIsEmpty!47923 () Bool)

(declare-fun mapRes!47923 () Bool)

(assert (=> mapIsEmpty!47923 mapRes!47923))

(declare-fun b!1210989 () Bool)

(declare-fun e!687859 () Bool)

(assert (=> b!1210989 (= e!687860 e!687859)))

(declare-fun res!804451 () Bool)

(assert (=> b!1210989 (=> res!804451 e!687859)))

(assert (=> b!1210989 (= res!804451 (not (contains!6995 lt!549605 k0!934)))))

(assert (=> b!1210989 (= lt!549605 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1210990 () Bool)

(declare-fun res!804460 () Bool)

(assert (=> b!1210990 (=> (not res!804460) (not e!687858))))

(assert (=> b!1210990 (= res!804460 (and (= (size!38281 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38280 _keys!1208) (size!38281 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!687863 () Bool)

(declare-fun b!1210991 () Bool)

(declare-fun arrayContainsKey!0 (array!78225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210991 (= e!687863 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1210992 () Bool)

(assert (=> b!1210992 call!59501))

(declare-fun lt!549610 () Unit!40048)

(assert (=> b!1210992 (= lt!549610 call!59495)))

(assert (=> b!1210992 (= e!687855 lt!549610)))

(declare-fun b!1210993 () Bool)

(declare-fun e!687869 () Bool)

(assert (=> b!1210993 (= e!687869 e!687854)))

(declare-fun res!804456 () Bool)

(assert (=> b!1210993 (=> res!804456 e!687854)))

(assert (=> b!1210993 (= res!804456 (not (= from!1455 i!673)))))

(declare-fun lt!549603 () ListLongMap!17773)

(assert (=> b!1210993 (= lt!549603 (getCurrentListMapNoExtraKeys!5363 lt!549597 lt!549604 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3282 (Int (_ BitVec 64)) V!46065)

(assert (=> b!1210993 (= lt!549604 (array!78228 (store (arr!37744 _values!996) i!673 (ValueCellFull!14642 (dynLambda!3282 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38281 _values!996)))))

(declare-fun lt!549611 () ListLongMap!17773)

(assert (=> b!1210993 (= lt!549611 (getCurrentListMapNoExtraKeys!5363 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1210994 () Bool)

(declare-fun res!804462 () Bool)

(assert (=> b!1210994 (=> (not res!804462) (not e!687858))))

(assert (=> b!1210994 (= res!804462 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38280 _keys!1208))))))

(declare-fun b!1210995 () Bool)

(declare-fun res!804458 () Bool)

(assert (=> b!1210995 (=> (not res!804458) (not e!687865))))

(assert (=> b!1210995 (= res!804458 (arrayNoDuplicates!0 lt!549597 #b00000000000000000000000000000000 Nil!26599))))

(declare-fun b!1210996 () Bool)

(assert (=> b!1210996 (= e!687859 true)))

(assert (=> b!1210996 false))

(declare-fun lt!549613 () Unit!40048)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78225 (_ BitVec 64) (_ BitVec 32) List!26602) Unit!40048)

(assert (=> b!1210996 (= lt!549613 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26599))))

(assert (=> b!1210996 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26599)))

(declare-fun lt!549598 () Unit!40048)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78225 (_ BitVec 32) (_ BitVec 32)) Unit!40048)

(assert (=> b!1210996 (= lt!549598 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1210996 e!687863))

(declare-fun res!804457 () Bool)

(assert (=> b!1210996 (=> (not res!804457) (not e!687863))))

(assert (=> b!1210996 (= res!804457 e!687857)))

(declare-fun c!119511 () Bool)

(assert (=> b!1210996 (= c!119511 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!549602 () Unit!40048)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!597 (array!78225 array!78227 (_ BitVec 32) (_ BitVec 32) V!46065 V!46065 (_ BitVec 64) (_ BitVec 32) Int) Unit!40048)

(assert (=> b!1210996 (= lt!549602 (lemmaListMapContainsThenArrayContainsFrom!597 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!549607 () Unit!40048)

(assert (=> b!1210996 (= lt!549607 e!687866)))

(assert (=> b!1210996 (= c!119508 (and (not lt!549601) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1210996 (= lt!549601 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1210997 () Bool)

(assert (=> b!1210997 (= e!687865 (not e!687869))))

(declare-fun res!804464 () Bool)

(assert (=> b!1210997 (=> res!804464 e!687869)))

(assert (=> b!1210997 (= res!804464 (bvsgt from!1455 i!673))))

(assert (=> b!1210997 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!549609 () Unit!40048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78225 (_ BitVec 64) (_ BitVec 32)) Unit!40048)

(assert (=> b!1210997 (= lt!549609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1210998 () Bool)

(declare-fun e!687862 () Bool)

(assert (=> b!1210998 (= e!687861 (and e!687862 mapRes!47923))))

(declare-fun condMapEmpty!47923 () Bool)

(declare-fun mapDefault!47923 () ValueCell!14642)

(assert (=> b!1210998 (= condMapEmpty!47923 (= (arr!37744 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14642)) mapDefault!47923)))))

(declare-fun b!1210999 () Bool)

(assert (=> b!1210999 (= e!687862 tp_is_empty!30703)))

(declare-fun b!1211000 () Bool)

(assert (=> b!1211000 (= e!687857 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!47923 () Bool)

(declare-fun tp!91013 () Bool)

(assert (=> mapNonEmpty!47923 (= mapRes!47923 (and tp!91013 e!687864))))

(declare-fun mapKey!47923 () (_ BitVec 32))

(declare-fun mapValue!47923 () ValueCell!14642)

(declare-fun mapRest!47923 () (Array (_ BitVec 32) ValueCell!14642))

(assert (=> mapNonEmpty!47923 (= (arr!37744 _values!996) (store mapRest!47923 mapKey!47923 mapValue!47923))))

(declare-fun b!1211001 () Bool)

(declare-fun Unit!40050 () Unit!40048)

(assert (=> b!1211001 (= e!687856 Unit!40050)))

(declare-fun bm!59498 () Bool)

(assert (=> bm!59498 (= call!59501 call!59494)))

(assert (= (and start!101236 res!804459) b!1210977))

(assert (= (and b!1210977 res!804450) b!1210990))

(assert (= (and b!1210990 res!804460) b!1210982))

(assert (= (and b!1210982 res!804455) b!1210981))

(assert (= (and b!1210981 res!804454) b!1210994))

(assert (= (and b!1210994 res!804462) b!1210974))

(assert (= (and b!1210974 res!804463) b!1210985))

(assert (= (and b!1210985 res!804453) b!1210987))

(assert (= (and b!1210987 res!804452) b!1210995))

(assert (= (and b!1210995 res!804458) b!1210997))

(assert (= (and b!1210997 (not res!804464)) b!1210993))

(assert (= (and b!1210993 (not res!804456)) b!1210986))

(assert (= (and b!1210986 c!119512) b!1210978))

(assert (= (and b!1210986 (not c!119512)) b!1210984))

(assert (= (or b!1210978 b!1210984) bm!59497))

(assert (= (or b!1210978 b!1210984) bm!59494))

(assert (= (and b!1210986 (not res!804461)) b!1210989))

(assert (= (and b!1210989 (not res!804451)) b!1210996))

(assert (= (and b!1210996 c!119508) b!1210976))

(assert (= (and b!1210996 (not c!119508)) b!1210980))

(assert (= (and b!1210980 c!119510) b!1210992))

(assert (= (and b!1210980 (not c!119510)) b!1210983))

(assert (= (and b!1210983 c!119509) b!1210975))

(assert (= (and b!1210983 (not c!119509)) b!1211001))

(assert (= (or b!1210992 b!1210975) bm!59491))

(assert (= (or b!1210992 b!1210975) bm!59496))

(assert (= (or b!1210992 b!1210975) bm!59498))

(assert (= (or b!1210976 bm!59498) bm!59495))

(assert (= (or b!1210976 bm!59491) bm!59492))

(assert (= (or b!1210976 bm!59496) bm!59493))

(assert (= (and b!1210996 c!119511) b!1211000))

(assert (= (and b!1210996 (not c!119511)) b!1210979))

(assert (= (and b!1210996 res!804457) b!1210991))

(assert (= (and b!1210998 condMapEmpty!47923) mapIsEmpty!47923))

(assert (= (and b!1210998 (not condMapEmpty!47923)) mapNonEmpty!47923))

(get-info :version)

(assert (= (and mapNonEmpty!47923 ((_ is ValueCellFull!14642) mapValue!47923)) b!1210988))

(assert (= (and b!1210998 ((_ is ValueCellFull!14642) mapDefault!47923)) b!1210999))

(assert (= start!101236 b!1210998))

(declare-fun b_lambda!21593 () Bool)

(assert (=> (not b_lambda!21593) (not b!1210993)))

(declare-fun t!39571 () Bool)

(declare-fun tb!10791 () Bool)

(assert (=> (and start!101236 (= defaultEntry!1004 defaultEntry!1004) t!39571) tb!10791))

(declare-fun result!22183 () Bool)

(assert (=> tb!10791 (= result!22183 tp_is_empty!30703)))

(assert (=> b!1210993 t!39571))

(declare-fun b_and!43083 () Bool)

(assert (= b_and!43081 (and (=> t!39571 result!22183) b_and!43083)))

(declare-fun m!1116933 () Bool)

(assert (=> bm!59493 m!1116933))

(declare-fun m!1116935 () Bool)

(assert (=> b!1210974 m!1116935))

(declare-fun m!1116937 () Bool)

(assert (=> b!1210986 m!1116937))

(declare-fun m!1116939 () Bool)

(assert (=> b!1210986 m!1116939))

(declare-fun m!1116941 () Bool)

(assert (=> bm!59494 m!1116941))

(declare-fun m!1116943 () Bool)

(assert (=> bm!59497 m!1116943))

(declare-fun m!1116945 () Bool)

(assert (=> b!1210989 m!1116945))

(assert (=> b!1210989 m!1116941))

(declare-fun m!1116947 () Bool)

(assert (=> b!1210997 m!1116947))

(declare-fun m!1116949 () Bool)

(assert (=> b!1210997 m!1116949))

(declare-fun m!1116951 () Bool)

(assert (=> b!1210981 m!1116951))

(declare-fun m!1116953 () Bool)

(assert (=> bm!59495 m!1116953))

(declare-fun m!1116955 () Bool)

(assert (=> b!1210993 m!1116955))

(declare-fun m!1116957 () Bool)

(assert (=> b!1210993 m!1116957))

(declare-fun m!1116959 () Bool)

(assert (=> b!1210993 m!1116959))

(declare-fun m!1116961 () Bool)

(assert (=> b!1210993 m!1116961))

(declare-fun m!1116963 () Bool)

(assert (=> b!1210985 m!1116963))

(declare-fun m!1116965 () Bool)

(assert (=> b!1210976 m!1116965))

(declare-fun m!1116967 () Bool)

(assert (=> b!1210976 m!1116967))

(assert (=> b!1210976 m!1116967))

(declare-fun m!1116969 () Bool)

(assert (=> b!1210976 m!1116969))

(declare-fun m!1116971 () Bool)

(assert (=> b!1210978 m!1116971))

(declare-fun m!1116973 () Bool)

(assert (=> bm!59492 m!1116973))

(declare-fun m!1116975 () Bool)

(assert (=> b!1210977 m!1116975))

(declare-fun m!1116977 () Bool)

(assert (=> b!1210995 m!1116977))

(declare-fun m!1116979 () Bool)

(assert (=> b!1210982 m!1116979))

(declare-fun m!1116981 () Bool)

(assert (=> b!1210987 m!1116981))

(declare-fun m!1116983 () Bool)

(assert (=> b!1210987 m!1116983))

(declare-fun m!1116985 () Bool)

(assert (=> mapNonEmpty!47923 m!1116985))

(declare-fun m!1116987 () Bool)

(assert (=> start!101236 m!1116987))

(declare-fun m!1116989 () Bool)

(assert (=> start!101236 m!1116989))

(declare-fun m!1116991 () Bool)

(assert (=> b!1210991 m!1116991))

(declare-fun m!1116993 () Bool)

(assert (=> b!1210996 m!1116993))

(declare-fun m!1116995 () Bool)

(assert (=> b!1210996 m!1116995))

(declare-fun m!1116997 () Bool)

(assert (=> b!1210996 m!1116997))

(declare-fun m!1116999 () Bool)

(assert (=> b!1210996 m!1116999))

(assert (=> b!1211000 m!1116991))

(check-sat (not bm!59494) (not b!1210997) (not b!1210977) (not b!1210993) (not b!1210976) (not b!1210982) (not bm!59493) (not bm!59492) (not b!1210996) (not b!1210989) (not b!1210981) (not b_next!25999) (not b!1210974) (not b!1210978) (not b_lambda!21593) b_and!43083 (not bm!59497) (not b!1211000) (not start!101236) (not b!1210987) (not b!1210991) (not b!1210995) (not mapNonEmpty!47923) tp_is_empty!30703 (not b!1210986) (not bm!59495))
(check-sat b_and!43083 (not b_next!25999))
