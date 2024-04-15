; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98426 () Bool)

(assert start!98426)

(declare-fun b_free!24037 () Bool)

(declare-fun b_next!24037 () Bool)

(assert (=> start!98426 (= b_free!24037 (not b_next!24037))))

(declare-fun tp!84821 () Bool)

(declare-fun b_and!38901 () Bool)

(assert (=> start!98426 (= tp!84821 b_and!38901)))

(declare-fun b!1136831 () Bool)

(declare-datatypes ((Unit!37085 0))(
  ( (Unit!37086) )
))
(declare-fun e!646898 () Unit!37085)

(declare-fun Unit!37087 () Unit!37085)

(assert (=> b!1136831 (= e!646898 Unit!37087)))

(declare-fun b!1136832 () Bool)

(declare-fun e!646891 () Unit!37085)

(declare-fun Unit!37088 () Unit!37085)

(assert (=> b!1136832 (= e!646891 Unit!37088)))

(declare-fun b!1136833 () Bool)

(declare-fun call!49969 () Bool)

(assert (=> b!1136833 call!49969))

(declare-fun lt!505402 () Unit!37085)

(declare-fun call!49967 () Unit!37085)

(assert (=> b!1136833 (= lt!505402 call!49967)))

(assert (=> b!1136833 (= e!646891 lt!505402)))

(declare-fun mapIsEmpty!44675 () Bool)

(declare-fun mapRes!44675 () Bool)

(assert (=> mapIsEmpty!44675 mapRes!44675))

(declare-fun bm!49961 () Bool)

(declare-fun call!49963 () Unit!37085)

(assert (=> bm!49961 (= call!49967 call!49963)))

(declare-fun b!1136834 () Bool)

(declare-fun res!758675 () Bool)

(declare-fun e!646901 () Bool)

(assert (=> b!1136834 (=> (not res!758675) (not e!646901))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73916 0))(
  ( (array!73917 (arr!35609 (Array (_ BitVec 32) (_ BitVec 64))) (size!36147 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73916)

(assert (=> b!1136834 (= res!758675 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36147 _keys!1208))))))

(declare-datatypes ((V!43217 0))(
  ( (V!43218 (val!14340 Int)) )
))
(declare-fun zeroValue!944 () V!43217)

(declare-datatypes ((tuple2!18194 0))(
  ( (tuple2!18195 (_1!9108 (_ BitVec 64)) (_2!9108 V!43217)) )
))
(declare-datatypes ((List!24939 0))(
  ( (Nil!24936) (Cons!24935 (h!26144 tuple2!18194) (t!35959 List!24939)) )
))
(declare-datatypes ((ListLongMap!16163 0))(
  ( (ListLongMap!16164 (toList!8097 List!24939)) )
))
(declare-fun call!49964 () ListLongMap!16163)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13574 0))(
  ( (ValueCellFull!13574 (v!16976 V!43217)) (EmptyCell!13574) )
))
(declare-datatypes ((array!73918 0))(
  ( (array!73919 (arr!35610 (Array (_ BitVec 32) ValueCell!13574)) (size!36148 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73918)

(declare-fun minValue!944 () V!43217)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!49962 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4593 (array!73916 array!73918 (_ BitVec 32) (_ BitVec 32) V!43217 V!43217 (_ BitVec 32) Int) ListLongMap!16163)

(assert (=> bm!49962 (= call!49964 (getCurrentListMapNoExtraKeys!4593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136835 () Bool)

(declare-fun e!646890 () Unit!37085)

(declare-fun lt!505399 () Unit!37085)

(assert (=> b!1136835 (= e!646890 lt!505399)))

(assert (=> b!1136835 (= lt!505399 call!49967)))

(assert (=> b!1136835 call!49969))

(declare-fun b!1136836 () Bool)

(declare-fun e!646903 () Bool)

(assert (=> b!1136836 (= e!646903 true)))

(declare-fun lt!505401 () Unit!37085)

(assert (=> b!1136836 (= lt!505401 e!646898)))

(declare-fun c!111168 () Bool)

(declare-fun lt!505403 () ListLongMap!16163)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6572 (ListLongMap!16163 (_ BitVec 64)) Bool)

(assert (=> b!1136836 (= c!111168 (contains!6572 lt!505403 k0!934))))

(assert (=> b!1136836 (= lt!505403 (getCurrentListMapNoExtraKeys!4593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136837 () Bool)

(declare-fun e!646894 () Bool)

(declare-fun e!646895 () Bool)

(assert (=> b!1136837 (= e!646894 (and e!646895 mapRes!44675))))

(declare-fun condMapEmpty!44675 () Bool)

(declare-fun mapDefault!44675 () ValueCell!13574)

(assert (=> b!1136837 (= condMapEmpty!44675 (= (arr!35610 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13574)) mapDefault!44675)))))

(declare-fun bm!49963 () Bool)

(declare-fun call!49968 () Bool)

(assert (=> bm!49963 (= call!49969 call!49968)))

(declare-fun b!1136838 () Bool)

(declare-fun tp_is_empty!28567 () Bool)

(assert (=> b!1136838 (= e!646895 tp_is_empty!28567)))

(declare-fun b!1136839 () Bool)

(declare-fun res!758683 () Bool)

(assert (=> b!1136839 (=> (not res!758683) (not e!646901))))

(declare-datatypes ((List!24940 0))(
  ( (Nil!24937) (Cons!24936 (h!26145 (_ BitVec 64)) (t!35960 List!24940)) )
))
(declare-fun arrayNoDuplicates!0 (array!73916 (_ BitVec 32) List!24940) Bool)

(assert (=> b!1136839 (= res!758683 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24937))))

(declare-fun b!1136840 () Bool)

(declare-fun e!646905 () Bool)

(declare-fun e!646904 () Bool)

(assert (=> b!1136840 (= e!646905 e!646904)))

(declare-fun res!758686 () Bool)

(assert (=> b!1136840 (=> res!758686 e!646904)))

(assert (=> b!1136840 (= res!758686 (not (= from!1455 i!673)))))

(declare-fun lt!505405 () array!73916)

(declare-fun lt!505400 () array!73918)

(declare-fun lt!505396 () ListLongMap!16163)

(assert (=> b!1136840 (= lt!505396 (getCurrentListMapNoExtraKeys!4593 lt!505405 lt!505400 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2586 (Int (_ BitVec 64)) V!43217)

(assert (=> b!1136840 (= lt!505400 (array!73919 (store (arr!35610 _values!996) i!673 (ValueCellFull!13574 (dynLambda!2586 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36148 _values!996)))))

(declare-fun lt!505393 () ListLongMap!16163)

(assert (=> b!1136840 (= lt!505393 (getCurrentListMapNoExtraKeys!4593 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136841 () Bool)

(declare-fun e!646893 () Bool)

(assert (=> b!1136841 (= e!646893 (not e!646905))))

(declare-fun res!758685 () Bool)

(assert (=> b!1136841 (=> res!758685 e!646905)))

(assert (=> b!1136841 (= res!758685 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136841 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505409 () Unit!37085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73916 (_ BitVec 64) (_ BitVec 32)) Unit!37085)

(assert (=> b!1136841 (= lt!505409 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!49960 () Bool)

(declare-fun call!49965 () ListLongMap!16163)

(declare-fun call!49966 () ListLongMap!16163)

(assert (=> bm!49960 (= call!49965 call!49966)))

(declare-fun res!758679 () Bool)

(assert (=> start!98426 (=> (not res!758679) (not e!646901))))

(assert (=> start!98426 (= res!758679 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36147 _keys!1208))))))

(assert (=> start!98426 e!646901))

(assert (=> start!98426 tp_is_empty!28567))

(declare-fun array_inv!27378 (array!73916) Bool)

(assert (=> start!98426 (array_inv!27378 _keys!1208)))

(assert (=> start!98426 true))

(assert (=> start!98426 tp!84821))

(declare-fun array_inv!27379 (array!73918) Bool)

(assert (=> start!98426 (and (array_inv!27379 _values!996) e!646894)))

(declare-fun c!111165 () Bool)

(declare-fun bm!49964 () Bool)

(declare-fun lt!505398 () ListLongMap!16163)

(assert (=> bm!49964 (= call!49968 (contains!6572 (ite c!111165 lt!505398 call!49965) k0!934))))

(declare-fun b!1136842 () Bool)

(assert (=> b!1136842 (= e!646890 e!646891)))

(declare-fun c!111166 () Bool)

(declare-fun lt!505397 () Bool)

(assert (=> b!1136842 (= c!111166 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505397))))

(declare-fun c!111167 () Bool)

(declare-fun bm!49965 () Bool)

(declare-fun +!3527 (ListLongMap!16163 tuple2!18194) ListLongMap!16163)

(assert (=> bm!49965 (= call!49966 (+!3527 lt!505403 (ite (or c!111165 c!111167) (tuple2!18195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1136843 () Bool)

(declare-fun res!758687 () Bool)

(assert (=> b!1136843 (=> (not res!758687) (not e!646901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73916 (_ BitVec 32)) Bool)

(assert (=> b!1136843 (= res!758687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1136844 () Bool)

(declare-fun call!49970 () ListLongMap!16163)

(declare-fun e!646892 () Bool)

(declare-fun -!1192 (ListLongMap!16163 (_ BitVec 64)) ListLongMap!16163)

(assert (=> b!1136844 (= e!646892 (= call!49970 (-!1192 call!49964 k0!934)))))

(declare-fun b!1136845 () Bool)

(declare-fun res!758684 () Bool)

(assert (=> b!1136845 (=> (not res!758684) (not e!646901))))

(assert (=> b!1136845 (= res!758684 (= (select (arr!35609 _keys!1208) i!673) k0!934))))

(declare-fun bm!49966 () Bool)

(declare-fun addStillContains!746 (ListLongMap!16163 (_ BitVec 64) V!43217 (_ BitVec 64)) Unit!37085)

(assert (=> bm!49966 (= call!49963 (addStillContains!746 (ite c!111165 lt!505398 lt!505403) (ite c!111165 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111167 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111165 minValue!944 (ite c!111167 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1136846 () Bool)

(assert (=> b!1136846 (= e!646901 e!646893)))

(declare-fun res!758676 () Bool)

(assert (=> b!1136846 (=> (not res!758676) (not e!646893))))

(assert (=> b!1136846 (= res!758676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505405 mask!1564))))

(assert (=> b!1136846 (= lt!505405 (array!73917 (store (arr!35609 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36147 _keys!1208)))))

(declare-fun bm!49967 () Bool)

(assert (=> bm!49967 (= call!49970 (getCurrentListMapNoExtraKeys!4593 lt!505405 lt!505400 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44675 () Bool)

(declare-fun tp!84822 () Bool)

(declare-fun e!646902 () Bool)

(assert (=> mapNonEmpty!44675 (= mapRes!44675 (and tp!84822 e!646902))))

(declare-fun mapRest!44675 () (Array (_ BitVec 32) ValueCell!13574))

(declare-fun mapKey!44675 () (_ BitVec 32))

(declare-fun mapValue!44675 () ValueCell!13574)

(assert (=> mapNonEmpty!44675 (= (arr!35610 _values!996) (store mapRest!44675 mapKey!44675 mapValue!44675))))

(declare-fun b!1136847 () Bool)

(declare-fun res!758682 () Bool)

(assert (=> b!1136847 (=> (not res!758682) (not e!646901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136847 (= res!758682 (validMask!0 mask!1564))))

(declare-fun e!646900 () Bool)

(declare-fun b!1136848 () Bool)

(assert (=> b!1136848 (= e!646900 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505397) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1136849 () Bool)

(assert (=> b!1136849 (= e!646904 e!646903)))

(declare-fun res!758674 () Bool)

(assert (=> b!1136849 (=> res!758674 e!646903)))

(assert (=> b!1136849 (= res!758674 (not (= (select (arr!35609 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1136849 e!646892))

(declare-fun c!111169 () Bool)

(assert (=> b!1136849 (= c!111169 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505404 () Unit!37085)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!476 (array!73916 array!73918 (_ BitVec 32) (_ BitVec 32) V!43217 V!43217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37085)

(assert (=> b!1136849 (= lt!505404 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1136850 () Bool)

(assert (=> b!1136850 (contains!6572 (+!3527 lt!505398 (tuple2!18195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!505395 () Unit!37085)

(assert (=> b!1136850 (= lt!505395 call!49963)))

(assert (=> b!1136850 call!49968))

(assert (=> b!1136850 (= lt!505398 call!49966)))

(declare-fun lt!505406 () Unit!37085)

(assert (=> b!1136850 (= lt!505406 (addStillContains!746 lt!505403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!646899 () Unit!37085)

(assert (=> b!1136850 (= e!646899 lt!505395)))

(declare-fun b!1136851 () Bool)

(assert (=> b!1136851 (= e!646892 (= call!49970 call!49964))))

(declare-fun b!1136852 () Bool)

(assert (=> b!1136852 (= c!111167 (and (not lt!505397) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1136852 (= e!646899 e!646890)))

(declare-fun b!1136853 () Bool)

(assert (=> b!1136853 (= e!646902 tp_is_empty!28567)))

(declare-fun e!646896 () Bool)

(declare-fun b!1136854 () Bool)

(assert (=> b!1136854 (= e!646896 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136855 () Bool)

(declare-fun Unit!37089 () Unit!37085)

(assert (=> b!1136855 (= e!646898 Unit!37089)))

(assert (=> b!1136855 (= lt!505397 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1136855 (= c!111165 (and (not lt!505397) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505407 () Unit!37085)

(assert (=> b!1136855 (= lt!505407 e!646899)))

(declare-fun lt!505394 () Unit!37085)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!356 (array!73916 array!73918 (_ BitVec 32) (_ BitVec 32) V!43217 V!43217 (_ BitVec 64) (_ BitVec 32) Int) Unit!37085)

(assert (=> b!1136855 (= lt!505394 (lemmaListMapContainsThenArrayContainsFrom!356 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111170 () Bool)

(assert (=> b!1136855 (= c!111170 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758680 () Bool)

(assert (=> b!1136855 (= res!758680 e!646900)))

(assert (=> b!1136855 (=> (not res!758680) (not e!646896))))

(assert (=> b!1136855 e!646896))

(declare-fun lt!505410 () Unit!37085)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73916 (_ BitVec 32) (_ BitVec 32)) Unit!37085)

(assert (=> b!1136855 (= lt!505410 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1136855 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24937)))

(declare-fun lt!505408 () Unit!37085)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73916 (_ BitVec 64) (_ BitVec 32) List!24940) Unit!37085)

(assert (=> b!1136855 (= lt!505408 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24937))))

(assert (=> b!1136855 false))

(declare-fun b!1136856 () Bool)

(assert (=> b!1136856 (= e!646900 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136857 () Bool)

(declare-fun res!758677 () Bool)

(assert (=> b!1136857 (=> (not res!758677) (not e!646893))))

(assert (=> b!1136857 (= res!758677 (arrayNoDuplicates!0 lt!505405 #b00000000000000000000000000000000 Nil!24937))))

(declare-fun b!1136858 () Bool)

(declare-fun res!758681 () Bool)

(assert (=> b!1136858 (=> (not res!758681) (not e!646901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136858 (= res!758681 (validKeyInArray!0 k0!934))))

(declare-fun b!1136859 () Bool)

(declare-fun res!758678 () Bool)

(assert (=> b!1136859 (=> (not res!758678) (not e!646901))))

(assert (=> b!1136859 (= res!758678 (and (= (size!36148 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36147 _keys!1208) (size!36148 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!98426 res!758679) b!1136847))

(assert (= (and b!1136847 res!758682) b!1136859))

(assert (= (and b!1136859 res!758678) b!1136843))

(assert (= (and b!1136843 res!758687) b!1136839))

(assert (= (and b!1136839 res!758683) b!1136834))

(assert (= (and b!1136834 res!758675) b!1136858))

(assert (= (and b!1136858 res!758681) b!1136845))

(assert (= (and b!1136845 res!758684) b!1136846))

(assert (= (and b!1136846 res!758676) b!1136857))

(assert (= (and b!1136857 res!758677) b!1136841))

(assert (= (and b!1136841 (not res!758685)) b!1136840))

(assert (= (and b!1136840 (not res!758686)) b!1136849))

(assert (= (and b!1136849 c!111169) b!1136844))

(assert (= (and b!1136849 (not c!111169)) b!1136851))

(assert (= (or b!1136844 b!1136851) bm!49967))

(assert (= (or b!1136844 b!1136851) bm!49962))

(assert (= (and b!1136849 (not res!758674)) b!1136836))

(assert (= (and b!1136836 c!111168) b!1136855))

(assert (= (and b!1136836 (not c!111168)) b!1136831))

(assert (= (and b!1136855 c!111165) b!1136850))

(assert (= (and b!1136855 (not c!111165)) b!1136852))

(assert (= (and b!1136852 c!111167) b!1136835))

(assert (= (and b!1136852 (not c!111167)) b!1136842))

(assert (= (and b!1136842 c!111166) b!1136833))

(assert (= (and b!1136842 (not c!111166)) b!1136832))

(assert (= (or b!1136835 b!1136833) bm!49961))

(assert (= (or b!1136835 b!1136833) bm!49960))

(assert (= (or b!1136835 b!1136833) bm!49963))

(assert (= (or b!1136850 bm!49963) bm!49964))

(assert (= (or b!1136850 bm!49961) bm!49966))

(assert (= (or b!1136850 bm!49960) bm!49965))

(assert (= (and b!1136855 c!111170) b!1136856))

(assert (= (and b!1136855 (not c!111170)) b!1136848))

(assert (= (and b!1136855 res!758680) b!1136854))

(assert (= (and b!1136837 condMapEmpty!44675) mapIsEmpty!44675))

(assert (= (and b!1136837 (not condMapEmpty!44675)) mapNonEmpty!44675))

(get-info :version)

(assert (= (and mapNonEmpty!44675 ((_ is ValueCellFull!13574) mapValue!44675)) b!1136853))

(assert (= (and b!1136837 ((_ is ValueCellFull!13574) mapDefault!44675)) b!1136838))

(assert (= start!98426 b!1136837))

(declare-fun b_lambda!19125 () Bool)

(assert (=> (not b_lambda!19125) (not b!1136840)))

(declare-fun t!35958 () Bool)

(declare-fun tb!8841 () Bool)

(assert (=> (and start!98426 (= defaultEntry!1004 defaultEntry!1004) t!35958) tb!8841))

(declare-fun result!18255 () Bool)

(assert (=> tb!8841 (= result!18255 tp_is_empty!28567)))

(assert (=> b!1136840 t!35958))

(declare-fun b_and!38903 () Bool)

(assert (= b_and!38901 (and (=> t!35958 result!18255) b_and!38903)))

(declare-fun m!1048557 () Bool)

(assert (=> mapNonEmpty!44675 m!1048557))

(declare-fun m!1048559 () Bool)

(assert (=> bm!49967 m!1048559))

(declare-fun m!1048561 () Bool)

(assert (=> b!1136839 m!1048561))

(declare-fun m!1048563 () Bool)

(assert (=> b!1136854 m!1048563))

(declare-fun m!1048565 () Bool)

(assert (=> b!1136858 m!1048565))

(declare-fun m!1048567 () Bool)

(assert (=> bm!49965 m!1048567))

(declare-fun m!1048569 () Bool)

(assert (=> bm!49966 m!1048569))

(declare-fun m!1048571 () Bool)

(assert (=> b!1136843 m!1048571))

(declare-fun m!1048573 () Bool)

(assert (=> b!1136845 m!1048573))

(declare-fun m!1048575 () Bool)

(assert (=> b!1136836 m!1048575))

(declare-fun m!1048577 () Bool)

(assert (=> b!1136836 m!1048577))

(declare-fun m!1048579 () Bool)

(assert (=> b!1136850 m!1048579))

(assert (=> b!1136850 m!1048579))

(declare-fun m!1048581 () Bool)

(assert (=> b!1136850 m!1048581))

(declare-fun m!1048583 () Bool)

(assert (=> b!1136850 m!1048583))

(declare-fun m!1048585 () Bool)

(assert (=> b!1136855 m!1048585))

(declare-fun m!1048587 () Bool)

(assert (=> b!1136855 m!1048587))

(declare-fun m!1048589 () Bool)

(assert (=> b!1136855 m!1048589))

(declare-fun m!1048591 () Bool)

(assert (=> b!1136855 m!1048591))

(declare-fun m!1048593 () Bool)

(assert (=> b!1136841 m!1048593))

(declare-fun m!1048595 () Bool)

(assert (=> b!1136841 m!1048595))

(declare-fun m!1048597 () Bool)

(assert (=> b!1136849 m!1048597))

(declare-fun m!1048599 () Bool)

(assert (=> b!1136849 m!1048599))

(assert (=> bm!49962 m!1048577))

(declare-fun m!1048601 () Bool)

(assert (=> b!1136857 m!1048601))

(declare-fun m!1048603 () Bool)

(assert (=> b!1136847 m!1048603))

(declare-fun m!1048605 () Bool)

(assert (=> b!1136840 m!1048605))

(declare-fun m!1048607 () Bool)

(assert (=> b!1136840 m!1048607))

(declare-fun m!1048609 () Bool)

(assert (=> b!1136840 m!1048609))

(declare-fun m!1048611 () Bool)

(assert (=> b!1136840 m!1048611))

(declare-fun m!1048613 () Bool)

(assert (=> start!98426 m!1048613))

(declare-fun m!1048615 () Bool)

(assert (=> start!98426 m!1048615))

(declare-fun m!1048617 () Bool)

(assert (=> b!1136844 m!1048617))

(declare-fun m!1048619 () Bool)

(assert (=> b!1136846 m!1048619))

(declare-fun m!1048621 () Bool)

(assert (=> b!1136846 m!1048621))

(assert (=> b!1136856 m!1048563))

(declare-fun m!1048623 () Bool)

(assert (=> bm!49964 m!1048623))

(check-sat (not b!1136857) (not bm!49965) (not b!1136850) (not bm!49967) b_and!38903 (not mapNonEmpty!44675) (not bm!49962) (not b!1136839) tp_is_empty!28567 (not b!1136849) (not b_lambda!19125) (not b!1136854) (not b!1136856) (not b!1136846) (not bm!49966) (not b!1136855) (not b!1136847) (not b!1136841) (not b!1136844) (not bm!49964) (not b_next!24037) (not b!1136836) (not b!1136858) (not start!98426) (not b!1136840) (not b!1136843))
(check-sat b_and!38903 (not b_next!24037))
