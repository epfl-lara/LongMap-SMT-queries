; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98638 () Bool)

(assert start!98638)

(declare-fun b_free!24007 () Bool)

(declare-fun b_next!24007 () Bool)

(assert (=> start!98638 (= b_free!24007 (not b_next!24007))))

(declare-fun tp!84732 () Bool)

(declare-fun b_and!38865 () Bool)

(assert (=> start!98638 (= tp!84732 b_and!38865)))

(declare-fun e!647061 () Bool)

(declare-datatypes ((array!73977 0))(
  ( (array!73978 (arr!35633 (Array (_ BitVec 32) (_ BitVec 64))) (size!36170 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73977)

(declare-fun b!1136841 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!73977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136841 (= e!647061 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136842 () Bool)

(declare-fun res!758497 () Bool)

(declare-fun e!647049 () Bool)

(assert (=> b!1136842 (=> (not res!758497) (not e!647049))))

(declare-fun lt!505293 () array!73977)

(declare-datatypes ((List!24857 0))(
  ( (Nil!24854) (Cons!24853 (h!26071 (_ BitVec 64)) (t!35848 List!24857)) )
))
(declare-fun arrayNoDuplicates!0 (array!73977 (_ BitVec 32) List!24857) Bool)

(assert (=> b!1136842 (= res!758497 (arrayNoDuplicates!0 lt!505293 #b00000000000000000000000000000000 Nil!24854))))

(declare-fun b!1136843 () Bool)

(declare-fun res!758490 () Bool)

(declare-fun e!647047 () Bool)

(assert (=> b!1136843 (=> (not res!758490) (not e!647047))))

(assert (=> b!1136843 (= res!758490 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24854))))

(declare-fun b!1136844 () Bool)

(declare-fun e!647053 () Bool)

(declare-fun e!647046 () Bool)

(assert (=> b!1136844 (= e!647053 e!647046)))

(declare-fun res!758494 () Bool)

(assert (=> b!1136844 (=> res!758494 e!647046)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136844 (= res!758494 (not (= from!1455 i!673)))))

(declare-datatypes ((V!43177 0))(
  ( (V!43178 (val!14325 Int)) )
))
(declare-fun zeroValue!944 () V!43177)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13559 0))(
  ( (ValueCellFull!13559 (v!16958 V!43177)) (EmptyCell!13559) )
))
(declare-datatypes ((array!73979 0))(
  ( (array!73980 (arr!35634 (Array (_ BitVec 32) ValueCell!13559)) (size!36171 (_ BitVec 32))) )
))
(declare-fun lt!505309 () array!73979)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43177)

(declare-datatypes ((tuple2!18092 0))(
  ( (tuple2!18093 (_1!9057 (_ BitVec 64)) (_2!9057 V!43177)) )
))
(declare-datatypes ((List!24858 0))(
  ( (Nil!24855) (Cons!24854 (h!26072 tuple2!18092) (t!35849 List!24858)) )
))
(declare-datatypes ((ListLongMap!16069 0))(
  ( (ListLongMap!16070 (toList!8050 List!24858)) )
))
(declare-fun lt!505302 () ListLongMap!16069)

(declare-fun getCurrentListMapNoExtraKeys!4561 (array!73977 array!73979 (_ BitVec 32) (_ BitVec 32) V!43177 V!43177 (_ BitVec 32) Int) ListLongMap!16069)

(assert (=> b!1136844 (= lt!505302 (getCurrentListMapNoExtraKeys!4561 lt!505293 lt!505309 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73979)

(declare-fun dynLambda!2614 (Int (_ BitVec 64)) V!43177)

(assert (=> b!1136844 (= lt!505309 (array!73980 (store (arr!35634 _values!996) i!673 (ValueCellFull!13559 (dynLambda!2614 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36171 _values!996)))))

(declare-fun lt!505300 () ListLongMap!16069)

(assert (=> b!1136844 (= lt!505300 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136845 () Bool)

(declare-fun c!111356 () Bool)

(declare-fun lt!505296 () Bool)

(assert (=> b!1136845 (= c!111356 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505296))))

(declare-datatypes ((Unit!37167 0))(
  ( (Unit!37168) )
))
(declare-fun e!647048 () Unit!37167)

(declare-fun e!647055 () Unit!37167)

(assert (=> b!1136845 (= e!647048 e!647055)))

(declare-fun b!1136846 () Bool)

(declare-fun lt!505301 () Unit!37167)

(assert (=> b!1136846 (= e!647055 lt!505301)))

(declare-fun call!49692 () Unit!37167)

(assert (=> b!1136846 (= lt!505301 call!49692)))

(declare-fun call!49698 () Bool)

(assert (=> b!1136846 call!49698))

(declare-fun lt!505298 () ListLongMap!16069)

(declare-fun call!49696 () ListLongMap!16069)

(declare-fun c!111357 () Bool)

(declare-fun bm!49688 () Bool)

(declare-fun c!111354 () Bool)

(declare-fun lt!505306 () ListLongMap!16069)

(declare-fun +!3505 (ListLongMap!16069 tuple2!18092) ListLongMap!16069)

(assert (=> bm!49688 (= call!49696 (+!3505 (ite c!111357 lt!505306 lt!505298) (ite c!111357 (tuple2!18093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111354 (tuple2!18093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1136847 () Bool)

(assert (=> b!1136847 call!49698))

(declare-fun lt!505303 () Unit!37167)

(assert (=> b!1136847 (= lt!505303 call!49692)))

(assert (=> b!1136847 (= e!647048 lt!505303)))

(declare-fun b!1136848 () Bool)

(declare-fun e!647051 () Bool)

(declare-fun tp_is_empty!28537 () Bool)

(assert (=> b!1136848 (= e!647051 tp_is_empty!28537)))

(declare-fun b!1136849 () Bool)

(declare-fun e!647058 () Bool)

(assert (=> b!1136849 (= e!647058 true)))

(declare-fun lt!505294 () Bool)

(declare-fun contains!6593 (List!24857 (_ BitVec 64)) Bool)

(assert (=> b!1136849 (= lt!505294 (contains!6593 Nil!24854 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1136850 () Bool)

(declare-fun Unit!37169 () Unit!37167)

(assert (=> b!1136850 (= e!647055 Unit!37169)))

(declare-fun b!1136851 () Bool)

(declare-fun res!758498 () Bool)

(assert (=> b!1136851 (=> res!758498 e!647058)))

(assert (=> b!1136851 (= res!758498 (contains!6593 Nil!24854 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!49689 () Bool)

(declare-fun call!49695 () Unit!37167)

(assert (=> bm!49689 (= call!49692 call!49695)))

(declare-fun call!49694 () ListLongMap!16069)

(declare-fun call!49697 () Bool)

(declare-fun bm!49690 () Bool)

(declare-fun contains!6594 (ListLongMap!16069 (_ BitVec 64)) Bool)

(assert (=> bm!49690 (= call!49697 (contains!6594 (ite c!111357 lt!505306 call!49694) k0!934))))

(declare-fun b!1136852 () Bool)

(declare-fun res!758485 () Bool)

(assert (=> b!1136852 (=> (not res!758485) (not e!647047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73977 (_ BitVec 32)) Bool)

(assert (=> b!1136852 (= res!758485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1136853 () Bool)

(declare-fun e!647062 () Bool)

(assert (=> b!1136853 (= e!647062 tp_is_empty!28537)))

(declare-fun b!1136854 () Bool)

(declare-fun res!758483 () Bool)

(assert (=> b!1136854 (=> (not res!758483) (not e!647047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136854 (= res!758483 (validKeyInArray!0 k0!934))))

(declare-fun call!49693 () ListLongMap!16069)

(declare-fun bm!49691 () Bool)

(assert (=> bm!49691 (= call!49693 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136855 () Bool)

(declare-fun res!758496 () Bool)

(assert (=> b!1136855 (=> (not res!758496) (not e!647047))))

(assert (=> b!1136855 (= res!758496 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36170 _keys!1208))))))

(declare-fun b!1136856 () Bool)

(assert (=> b!1136856 (= e!647049 (not e!647053))))

(declare-fun res!758488 () Bool)

(assert (=> b!1136856 (=> res!758488 e!647053)))

(assert (=> b!1136856 (= res!758488 (bvsgt from!1455 i!673))))

(assert (=> b!1136856 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505307 () Unit!37167)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73977 (_ BitVec 64) (_ BitVec 32)) Unit!37167)

(assert (=> b!1136856 (= lt!505307 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1136857 () Bool)

(declare-fun e!647052 () Bool)

(declare-fun mapRes!44630 () Bool)

(assert (=> b!1136857 (= e!647052 (and e!647051 mapRes!44630))))

(declare-fun condMapEmpty!44630 () Bool)

(declare-fun mapDefault!44630 () ValueCell!13559)

(assert (=> b!1136857 (= condMapEmpty!44630 (= (arr!35634 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13559)) mapDefault!44630)))))

(declare-fun b!1136858 () Bool)

(declare-fun e!647056 () Bool)

(declare-fun e!647054 () Bool)

(assert (=> b!1136858 (= e!647056 e!647054)))

(declare-fun res!758484 () Bool)

(assert (=> b!1136858 (=> res!758484 e!647054)))

(assert (=> b!1136858 (= res!758484 (not (contains!6594 lt!505298 k0!934)))))

(assert (=> b!1136858 (= lt!505298 (getCurrentListMapNoExtraKeys!4561 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136859 () Bool)

(assert (=> b!1136859 (= e!647054 e!647058)))

(declare-fun res!758491 () Bool)

(assert (=> b!1136859 (=> res!758491 e!647058)))

(assert (=> b!1136859 (= res!758491 (or (bvsge (size!36170 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36170 _keys!1208)) (bvsge from!1455 (size!36170 _keys!1208))))))

(assert (=> b!1136859 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24854)))

(declare-fun lt!505308 () Unit!37167)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73977 (_ BitVec 32) (_ BitVec 32)) Unit!37167)

(assert (=> b!1136859 (= lt!505308 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!647057 () Bool)

(assert (=> b!1136859 e!647057))

(declare-fun res!758492 () Bool)

(assert (=> b!1136859 (=> (not res!758492) (not e!647057))))

(assert (=> b!1136859 (= res!758492 e!647061)))

(declare-fun c!111353 () Bool)

(assert (=> b!1136859 (= c!111353 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505295 () Unit!37167)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!341 (array!73977 array!73979 (_ BitVec 32) (_ BitVec 32) V!43177 V!43177 (_ BitVec 64) (_ BitVec 32) Int) Unit!37167)

(assert (=> b!1136859 (= lt!505295 (lemmaListMapContainsThenArrayContainsFrom!341 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505297 () Unit!37167)

(declare-fun e!647060 () Unit!37167)

(assert (=> b!1136859 (= lt!505297 e!647060)))

(assert (=> b!1136859 (= c!111357 (and (not lt!505296) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1136859 (= lt!505296 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1136860 () Bool)

(declare-fun res!758495 () Bool)

(assert (=> b!1136860 (=> res!758495 e!647058)))

(declare-fun noDuplicate!1614 (List!24857) Bool)

(assert (=> b!1136860 (= res!758495 (not (noDuplicate!1614 Nil!24854)))))

(declare-fun bm!49692 () Bool)

(declare-fun call!49691 () ListLongMap!16069)

(assert (=> bm!49692 (= call!49691 (getCurrentListMapNoExtraKeys!4561 lt!505293 lt!505309 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136861 () Bool)

(declare-fun e!647050 () Bool)

(declare-fun -!1197 (ListLongMap!16069 (_ BitVec 64)) ListLongMap!16069)

(assert (=> b!1136861 (= e!647050 (= call!49691 (-!1197 call!49693 k0!934)))))

(declare-fun b!1136862 () Bool)

(declare-fun res!758486 () Bool)

(assert (=> b!1136862 (=> (not res!758486) (not e!647047))))

(assert (=> b!1136862 (= res!758486 (= (select (arr!35633 _keys!1208) i!673) k0!934))))

(declare-fun b!1136863 () Bool)

(assert (=> b!1136863 (= e!647046 e!647056)))

(declare-fun res!758489 () Bool)

(assert (=> b!1136863 (=> res!758489 e!647056)))

(assert (=> b!1136863 (= res!758489 (not (= (select (arr!35633 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1136863 e!647050))

(declare-fun c!111355 () Bool)

(assert (=> b!1136863 (= c!111355 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505305 () Unit!37167)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!452 (array!73977 array!73979 (_ BitVec 32) (_ BitVec 32) V!43177 V!43177 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37167)

(assert (=> b!1136863 (= lt!505305 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!452 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!758493 () Bool)

(assert (=> start!98638 (=> (not res!758493) (not e!647047))))

(assert (=> start!98638 (= res!758493 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36170 _keys!1208))))))

(assert (=> start!98638 e!647047))

(assert (=> start!98638 tp_is_empty!28537))

(declare-fun array_inv!27376 (array!73977) Bool)

(assert (=> start!98638 (array_inv!27376 _keys!1208)))

(assert (=> start!98638 true))

(assert (=> start!98638 tp!84732))

(declare-fun array_inv!27377 (array!73979) Bool)

(assert (=> start!98638 (and (array_inv!27377 _values!996) e!647052)))

(declare-fun b!1136864 () Bool)

(declare-fun res!758499 () Bool)

(assert (=> b!1136864 (=> (not res!758499) (not e!647047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136864 (= res!758499 (validMask!0 mask!1564))))

(declare-fun bm!49693 () Bool)

(assert (=> bm!49693 (= call!49698 call!49697)))

(declare-fun b!1136865 () Bool)

(assert (=> b!1136865 (= e!647050 (= call!49691 call!49693))))

(declare-fun mapNonEmpty!44630 () Bool)

(declare-fun tp!84731 () Bool)

(assert (=> mapNonEmpty!44630 (= mapRes!44630 (and tp!84731 e!647062))))

(declare-fun mapValue!44630 () ValueCell!13559)

(declare-fun mapRest!44630 () (Array (_ BitVec 32) ValueCell!13559))

(declare-fun mapKey!44630 () (_ BitVec 32))

(assert (=> mapNonEmpty!44630 (= (arr!35634 _values!996) (store mapRest!44630 mapKey!44630 mapValue!44630))))

(declare-fun bm!49694 () Bool)

(assert (=> bm!49694 (= call!49694 call!49696)))

(declare-fun b!1136866 () Bool)

(declare-fun res!758482 () Bool)

(assert (=> b!1136866 (=> (not res!758482) (not e!647047))))

(assert (=> b!1136866 (= res!758482 (and (= (size!36171 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36170 _keys!1208) (size!36171 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1136867 () Bool)

(assert (=> b!1136867 (= e!647061 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505296) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!44630 () Bool)

(assert (=> mapIsEmpty!44630 mapRes!44630))

(declare-fun b!1136868 () Bool)

(assert (=> b!1136868 (= e!647047 e!647049)))

(declare-fun res!758487 () Bool)

(assert (=> b!1136868 (=> (not res!758487) (not e!647049))))

(assert (=> b!1136868 (= res!758487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505293 mask!1564))))

(assert (=> b!1136868 (= lt!505293 (array!73978 (store (arr!35633 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36170 _keys!1208)))))

(declare-fun b!1136869 () Bool)

(assert (=> b!1136869 (= e!647060 e!647048)))

(assert (=> b!1136869 (= c!111354 (and (not lt!505296) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!49695 () Bool)

(declare-fun addStillContains!732 (ListLongMap!16069 (_ BitVec 64) V!43177 (_ BitVec 64)) Unit!37167)

(assert (=> bm!49695 (= call!49695 (addStillContains!732 (ite c!111357 lt!505306 lt!505298) (ite c!111357 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111354 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111357 minValue!944 (ite c!111354 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1136870 () Bool)

(declare-fun lt!505304 () Unit!37167)

(assert (=> b!1136870 (= e!647060 lt!505304)))

(declare-fun lt!505299 () Unit!37167)

(assert (=> b!1136870 (= lt!505299 (addStillContains!732 lt!505298 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1136870 (= lt!505306 (+!3505 lt!505298 (tuple2!18093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1136870 call!49697))

(assert (=> b!1136870 (= lt!505304 call!49695)))

(assert (=> b!1136870 (contains!6594 call!49696 k0!934)))

(declare-fun b!1136871 () Bool)

(assert (=> b!1136871 (= e!647057 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!98638 res!758493) b!1136864))

(assert (= (and b!1136864 res!758499) b!1136866))

(assert (= (and b!1136866 res!758482) b!1136852))

(assert (= (and b!1136852 res!758485) b!1136843))

(assert (= (and b!1136843 res!758490) b!1136855))

(assert (= (and b!1136855 res!758496) b!1136854))

(assert (= (and b!1136854 res!758483) b!1136862))

(assert (= (and b!1136862 res!758486) b!1136868))

(assert (= (and b!1136868 res!758487) b!1136842))

(assert (= (and b!1136842 res!758497) b!1136856))

(assert (= (and b!1136856 (not res!758488)) b!1136844))

(assert (= (and b!1136844 (not res!758494)) b!1136863))

(assert (= (and b!1136863 c!111355) b!1136861))

(assert (= (and b!1136863 (not c!111355)) b!1136865))

(assert (= (or b!1136861 b!1136865) bm!49691))

(assert (= (or b!1136861 b!1136865) bm!49692))

(assert (= (and b!1136863 (not res!758489)) b!1136858))

(assert (= (and b!1136858 (not res!758484)) b!1136859))

(assert (= (and b!1136859 c!111357) b!1136870))

(assert (= (and b!1136859 (not c!111357)) b!1136869))

(assert (= (and b!1136869 c!111354) b!1136847))

(assert (= (and b!1136869 (not c!111354)) b!1136845))

(assert (= (and b!1136845 c!111356) b!1136846))

(assert (= (and b!1136845 (not c!111356)) b!1136850))

(assert (= (or b!1136847 b!1136846) bm!49689))

(assert (= (or b!1136847 b!1136846) bm!49694))

(assert (= (or b!1136847 b!1136846) bm!49693))

(assert (= (or b!1136870 bm!49693) bm!49690))

(assert (= (or b!1136870 bm!49689) bm!49695))

(assert (= (or b!1136870 bm!49694) bm!49688))

(assert (= (and b!1136859 c!111353) b!1136841))

(assert (= (and b!1136859 (not c!111353)) b!1136867))

(assert (= (and b!1136859 res!758492) b!1136871))

(assert (= (and b!1136859 (not res!758491)) b!1136860))

(assert (= (and b!1136860 (not res!758495)) b!1136851))

(assert (= (and b!1136851 (not res!758498)) b!1136849))

(assert (= (and b!1136857 condMapEmpty!44630) mapIsEmpty!44630))

(assert (= (and b!1136857 (not condMapEmpty!44630)) mapNonEmpty!44630))

(get-info :version)

(assert (= (and mapNonEmpty!44630 ((_ is ValueCellFull!13559) mapValue!44630)) b!1136853))

(assert (= (and b!1136857 ((_ is ValueCellFull!13559) mapDefault!44630)) b!1136848))

(assert (= start!98638 b!1136857))

(declare-fun b_lambda!19107 () Bool)

(assert (=> (not b_lambda!19107) (not b!1136844)))

(declare-fun t!35847 () Bool)

(declare-fun tb!8811 () Bool)

(assert (=> (and start!98638 (= defaultEntry!1004 defaultEntry!1004) t!35847) tb!8811))

(declare-fun result!18195 () Bool)

(assert (=> tb!8811 (= result!18195 tp_is_empty!28537)))

(assert (=> b!1136844 t!35847))

(declare-fun b_and!38867 () Bool)

(assert (= b_and!38865 (and (=> t!35847 result!18195) b_and!38867)))

(declare-fun m!1049667 () Bool)

(assert (=> b!1136870 m!1049667))

(declare-fun m!1049669 () Bool)

(assert (=> b!1136870 m!1049669))

(declare-fun m!1049671 () Bool)

(assert (=> b!1136870 m!1049671))

(declare-fun m!1049673 () Bool)

(assert (=> b!1136859 m!1049673))

(declare-fun m!1049675 () Bool)

(assert (=> b!1136859 m!1049675))

(declare-fun m!1049677 () Bool)

(assert (=> b!1136859 m!1049677))

(declare-fun m!1049679 () Bool)

(assert (=> b!1136871 m!1049679))

(declare-fun m!1049681 () Bool)

(assert (=> b!1136854 m!1049681))

(declare-fun m!1049683 () Bool)

(assert (=> bm!49688 m!1049683))

(declare-fun m!1049685 () Bool)

(assert (=> b!1136868 m!1049685))

(declare-fun m!1049687 () Bool)

(assert (=> b!1136868 m!1049687))

(declare-fun m!1049689 () Bool)

(assert (=> b!1136863 m!1049689))

(declare-fun m!1049691 () Bool)

(assert (=> b!1136863 m!1049691))

(declare-fun m!1049693 () Bool)

(assert (=> b!1136849 m!1049693))

(declare-fun m!1049695 () Bool)

(assert (=> b!1136851 m!1049695))

(declare-fun m!1049697 () Bool)

(assert (=> b!1136843 m!1049697))

(declare-fun m!1049699 () Bool)

(assert (=> bm!49691 m!1049699))

(declare-fun m!1049701 () Bool)

(assert (=> b!1136864 m!1049701))

(declare-fun m!1049703 () Bool)

(assert (=> b!1136858 m!1049703))

(assert (=> b!1136858 m!1049699))

(declare-fun m!1049705 () Bool)

(assert (=> b!1136842 m!1049705))

(declare-fun m!1049707 () Bool)

(assert (=> b!1136862 m!1049707))

(declare-fun m!1049709 () Bool)

(assert (=> b!1136844 m!1049709))

(declare-fun m!1049711 () Bool)

(assert (=> b!1136844 m!1049711))

(declare-fun m!1049713 () Bool)

(assert (=> b!1136844 m!1049713))

(declare-fun m!1049715 () Bool)

(assert (=> b!1136844 m!1049715))

(declare-fun m!1049717 () Bool)

(assert (=> bm!49692 m!1049717))

(declare-fun m!1049719 () Bool)

(assert (=> mapNonEmpty!44630 m!1049719))

(declare-fun m!1049721 () Bool)

(assert (=> bm!49695 m!1049721))

(declare-fun m!1049723 () Bool)

(assert (=> b!1136861 m!1049723))

(declare-fun m!1049725 () Bool)

(assert (=> bm!49690 m!1049725))

(declare-fun m!1049727 () Bool)

(assert (=> start!98638 m!1049727))

(declare-fun m!1049729 () Bool)

(assert (=> start!98638 m!1049729))

(declare-fun m!1049731 () Bool)

(assert (=> b!1136856 m!1049731))

(declare-fun m!1049733 () Bool)

(assert (=> b!1136856 m!1049733))

(assert (=> b!1136841 m!1049679))

(declare-fun m!1049735 () Bool)

(assert (=> b!1136860 m!1049735))

(declare-fun m!1049737 () Bool)

(assert (=> b!1136852 m!1049737))

(check-sat (not bm!49695) (not bm!49690) (not b!1136841) (not b!1136868) (not bm!49691) (not b!1136842) (not b!1136861) (not b!1136860) (not b_lambda!19107) (not b!1136871) b_and!38867 (not b!1136856) (not b!1136851) (not b!1136849) (not bm!49692) (not start!98638) (not b!1136858) (not b!1136843) tp_is_empty!28537 (not b!1136852) (not b!1136844) (not b!1136870) (not b!1136864) (not b!1136863) (not b!1136854) (not b!1136859) (not b_next!24007) (not mapNonEmpty!44630) (not bm!49688))
(check-sat b_and!38867 (not b_next!24007))
