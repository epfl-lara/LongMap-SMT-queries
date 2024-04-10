; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98452 () Bool)

(assert start!98452)

(declare-fun b_free!24057 () Bool)

(declare-fun b_next!24057 () Bool)

(assert (=> start!98452 (= b_free!24057 (not b_next!24057))))

(declare-fun tp!84881 () Bool)

(declare-fun b_and!38963 () Bool)

(assert (=> start!98452 (= tp!84881 b_and!38963)))

(declare-datatypes ((array!74033 0))(
  ( (array!74034 (arr!35667 (Array (_ BitVec 32) (_ BitVec 64))) (size!36203 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74033)

(declare-fun e!647449 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1137845 () Bool)

(declare-fun arrayContainsKey!0 (array!74033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137845 (= e!647449 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!43243 0))(
  ( (V!43244 (val!14350 Int)) )
))
(declare-datatypes ((ValueCell!13584 0))(
  ( (ValueCellFull!13584 (v!16987 V!43243)) (EmptyCell!13584) )
))
(declare-datatypes ((array!74035 0))(
  ( (array!74036 (arr!35668 (Array (_ BitVec 32) ValueCell!13584)) (size!36204 (_ BitVec 32))) )
))
(declare-fun lt!506137 () array!74035)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!50223 () Bool)

(declare-datatypes ((tuple2!18126 0))(
  ( (tuple2!18127 (_1!9074 (_ BitVec 64)) (_2!9074 V!43243)) )
))
(declare-datatypes ((List!24883 0))(
  ( (Nil!24880) (Cons!24879 (h!26088 tuple2!18126) (t!35932 List!24883)) )
))
(declare-datatypes ((ListLongMap!16095 0))(
  ( (ListLongMap!16096 (toList!8063 List!24883)) )
))
(declare-fun call!50233 () ListLongMap!16095)

(declare-fun minValue!944 () V!43243)

(declare-fun lt!506125 () array!74033)

(declare-fun zeroValue!944 () V!43243)

(declare-fun getCurrentListMapNoExtraKeys!4547 (array!74033 array!74035 (_ BitVec 32) (_ BitVec 32) V!43243 V!43243 (_ BitVec 32) Int) ListLongMap!16095)

(assert (=> bm!50223 (= call!50233 (getCurrentListMapNoExtraKeys!4547 lt!506125 lt!506137 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137846 () Bool)

(declare-fun e!647450 () Bool)

(declare-fun e!647461 () Bool)

(assert (=> b!1137846 (= e!647450 e!647461)))

(declare-fun res!759160 () Bool)

(assert (=> b!1137846 (=> res!759160 e!647461)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137846 (= res!759160 (not (= from!1455 i!673)))))

(declare-fun lt!506141 () ListLongMap!16095)

(assert (=> b!1137846 (= lt!506141 (getCurrentListMapNoExtraKeys!4547 lt!506125 lt!506137 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74035)

(declare-fun dynLambda!2601 (Int (_ BitVec 64)) V!43243)

(assert (=> b!1137846 (= lt!506137 (array!74036 (store (arr!35668 _values!996) i!673 (ValueCellFull!13584 (dynLambda!2601 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36204 _values!996)))))

(declare-fun lt!506136 () ListLongMap!16095)

(assert (=> b!1137846 (= lt!506136 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun c!111372 () Bool)

(declare-fun call!50227 () ListLongMap!16095)

(declare-fun lt!506139 () ListLongMap!16095)

(declare-fun call!50231 () Bool)

(declare-fun bm!50224 () Bool)

(declare-fun contains!6601 (ListLongMap!16095 (_ BitVec 64)) Bool)

(assert (=> bm!50224 (= call!50231 (contains!6601 (ite c!111372 lt!506139 call!50227) k0!934))))

(declare-fun mapIsEmpty!44705 () Bool)

(declare-fun mapRes!44705 () Bool)

(assert (=> mapIsEmpty!44705 mapRes!44705))

(declare-fun b!1137847 () Bool)

(declare-fun res!759169 () Bool)

(declare-fun e!647454 () Bool)

(assert (=> b!1137847 (=> (not res!759169) (not e!647454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74033 (_ BitVec 32)) Bool)

(assert (=> b!1137847 (= res!759169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50225 () Bool)

(declare-fun call!50228 () Bool)

(assert (=> bm!50225 (= call!50228 call!50231)))

(declare-datatypes ((Unit!37271 0))(
  ( (Unit!37272) )
))
(declare-fun call!50230 () Unit!37271)

(declare-fun c!111375 () Bool)

(declare-fun lt!506132 () ListLongMap!16095)

(declare-fun bm!50226 () Bool)

(declare-fun addStillContains!758 (ListLongMap!16095 (_ BitVec 64) V!43243 (_ BitVec 64)) Unit!37271)

(assert (=> bm!50226 (= call!50230 (addStillContains!758 (ite c!111372 lt!506139 lt!506132) (ite c!111372 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111375 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111372 minValue!944 (ite c!111375 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1137848 () Bool)

(declare-fun e!647455 () Bool)

(assert (=> b!1137848 (= e!647461 e!647455)))

(declare-fun res!759167 () Bool)

(assert (=> b!1137848 (=> res!759167 e!647455)))

(assert (=> b!1137848 (= res!759167 (not (= (select (arr!35667 _keys!1208) from!1455) k0!934)))))

(declare-fun e!647459 () Bool)

(assert (=> b!1137848 e!647459))

(declare-fun c!111371 () Bool)

(assert (=> b!1137848 (= c!111371 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506130 () Unit!37271)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!467 (array!74033 array!74035 (_ BitVec 32) (_ BitVec 32) V!43243 V!43243 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37271)

(assert (=> b!1137848 (= lt!506130 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!467 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137849 () Bool)

(declare-fun res!759173 () Bool)

(assert (=> b!1137849 (=> (not res!759173) (not e!647454))))

(assert (=> b!1137849 (= res!759173 (and (= (size!36204 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36203 _keys!1208) (size!36204 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137850 () Bool)

(declare-fun lt!506135 () Bool)

(assert (=> b!1137850 (= c!111375 (and (not lt!506135) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!647456 () Unit!37271)

(declare-fun e!647453 () Unit!37271)

(assert (=> b!1137850 (= e!647456 e!647453)))

(declare-fun bm!50227 () Bool)

(declare-fun call!50232 () ListLongMap!16095)

(assert (=> bm!50227 (= call!50227 call!50232)))

(declare-fun b!1137851 () Bool)

(declare-fun e!647457 () Unit!37271)

(declare-fun Unit!37273 () Unit!37271)

(assert (=> b!1137851 (= e!647457 Unit!37273)))

(declare-fun b!1137852 () Bool)

(declare-fun e!647460 () Bool)

(declare-fun tp_is_empty!28587 () Bool)

(assert (=> b!1137852 (= e!647460 tp_is_empty!28587)))

(declare-fun b!1137853 () Bool)

(declare-fun res!759164 () Bool)

(declare-fun e!647452 () Bool)

(assert (=> b!1137853 (=> (not res!759164) (not e!647452))))

(declare-datatypes ((List!24884 0))(
  ( (Nil!24881) (Cons!24880 (h!26089 (_ BitVec 64)) (t!35933 List!24884)) )
))
(declare-fun arrayNoDuplicates!0 (array!74033 (_ BitVec 32) List!24884) Bool)

(assert (=> b!1137853 (= res!759164 (arrayNoDuplicates!0 lt!506125 #b00000000000000000000000000000000 Nil!24881))))

(declare-fun b!1137854 () Bool)

(declare-fun e!647458 () Bool)

(declare-fun e!647462 () Bool)

(assert (=> b!1137854 (= e!647458 (and e!647462 mapRes!44705))))

(declare-fun condMapEmpty!44705 () Bool)

(declare-fun mapDefault!44705 () ValueCell!13584)

(assert (=> b!1137854 (= condMapEmpty!44705 (= (arr!35668 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13584)) mapDefault!44705)))))

(declare-fun b!1137855 () Bool)

(assert (=> b!1137855 (= e!647462 tp_is_empty!28587)))

(declare-fun b!1137856 () Bool)

(assert (=> b!1137856 (= e!647455 true)))

(declare-fun lt!506142 () Unit!37271)

(declare-fun e!647448 () Unit!37271)

(assert (=> b!1137856 (= lt!506142 e!647448)))

(declare-fun c!111376 () Bool)

(assert (=> b!1137856 (= c!111376 (contains!6601 lt!506132 k0!934))))

(assert (=> b!1137856 (= lt!506132 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137857 () Bool)

(declare-fun call!50226 () ListLongMap!16095)

(assert (=> b!1137857 (= e!647459 (= call!50233 call!50226))))

(declare-fun res!759168 () Bool)

(assert (=> start!98452 (=> (not res!759168) (not e!647454))))

(assert (=> start!98452 (= res!759168 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36203 _keys!1208))))))

(assert (=> start!98452 e!647454))

(assert (=> start!98452 tp_is_empty!28587))

(declare-fun array_inv!27346 (array!74033) Bool)

(assert (=> start!98452 (array_inv!27346 _keys!1208)))

(assert (=> start!98452 true))

(assert (=> start!98452 tp!84881))

(declare-fun array_inv!27347 (array!74035) Bool)

(assert (=> start!98452 (and (array_inv!27347 _values!996) e!647458)))

(declare-fun bm!50228 () Bool)

(assert (=> bm!50228 (= call!50226 (getCurrentListMapNoExtraKeys!4547 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137858 () Bool)

(declare-fun res!759163 () Bool)

(assert (=> b!1137858 (=> (not res!759163) (not e!647454))))

(assert (=> b!1137858 (= res!759163 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36203 _keys!1208))))))

(declare-fun b!1137859 () Bool)

(declare-fun lt!506129 () Unit!37271)

(assert (=> b!1137859 (= e!647453 lt!506129)))

(declare-fun call!50229 () Unit!37271)

(assert (=> b!1137859 (= lt!506129 call!50229)))

(assert (=> b!1137859 call!50228))

(declare-fun b!1137860 () Bool)

(declare-fun res!759162 () Bool)

(assert (=> b!1137860 (=> (not res!759162) (not e!647454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137860 (= res!759162 (validMask!0 mask!1564))))

(declare-fun b!1137861 () Bool)

(declare-fun Unit!37274 () Unit!37271)

(assert (=> b!1137861 (= e!647448 Unit!37274)))

(assert (=> b!1137861 (= lt!506135 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1137861 (= c!111372 (and (not lt!506135) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506133 () Unit!37271)

(assert (=> b!1137861 (= lt!506133 e!647456)))

(declare-fun lt!506131 () Unit!37271)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!360 (array!74033 array!74035 (_ BitVec 32) (_ BitVec 32) V!43243 V!43243 (_ BitVec 64) (_ BitVec 32) Int) Unit!37271)

(assert (=> b!1137861 (= lt!506131 (lemmaListMapContainsThenArrayContainsFrom!360 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111374 () Bool)

(assert (=> b!1137861 (= c!111374 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759172 () Bool)

(declare-fun e!647451 () Bool)

(assert (=> b!1137861 (= res!759172 e!647451)))

(assert (=> b!1137861 (=> (not res!759172) (not e!647449))))

(assert (=> b!1137861 e!647449))

(declare-fun lt!506140 () Unit!37271)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74033 (_ BitVec 32) (_ BitVec 32)) Unit!37271)

(assert (=> b!1137861 (= lt!506140 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137861 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24881)))

(declare-fun lt!506138 () Unit!37271)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74033 (_ BitVec 64) (_ BitVec 32) List!24884) Unit!37271)

(assert (=> b!1137861 (= lt!506138 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24881))))

(assert (=> b!1137861 false))

(declare-fun bm!50229 () Bool)

(declare-fun +!3498 (ListLongMap!16095 tuple2!18126) ListLongMap!16095)

(assert (=> bm!50229 (= call!50232 (+!3498 (ite c!111372 lt!506139 lt!506132) (ite c!111372 (tuple2!18127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111375 (tuple2!18127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18127 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1137862 () Bool)

(assert (=> b!1137862 (= e!647454 e!647452)))

(declare-fun res!759170 () Bool)

(assert (=> b!1137862 (=> (not res!759170) (not e!647452))))

(assert (=> b!1137862 (= res!759170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506125 mask!1564))))

(assert (=> b!1137862 (= lt!506125 (array!74034 (store (arr!35667 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36203 _keys!1208)))))

(declare-fun bm!50230 () Bool)

(assert (=> bm!50230 (= call!50229 call!50230)))

(declare-fun b!1137863 () Bool)

(assert (=> b!1137863 (= e!647452 (not e!647450))))

(declare-fun res!759166 () Bool)

(assert (=> b!1137863 (=> res!759166 e!647450)))

(assert (=> b!1137863 (= res!759166 (bvsgt from!1455 i!673))))

(assert (=> b!1137863 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506127 () Unit!37271)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74033 (_ BitVec 64) (_ BitVec 32)) Unit!37271)

(assert (=> b!1137863 (= lt!506127 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44705 () Bool)

(declare-fun tp!84882 () Bool)

(assert (=> mapNonEmpty!44705 (= mapRes!44705 (and tp!84882 e!647460))))

(declare-fun mapValue!44705 () ValueCell!13584)

(declare-fun mapRest!44705 () (Array (_ BitVec 32) ValueCell!13584))

(declare-fun mapKey!44705 () (_ BitVec 32))

(assert (=> mapNonEmpty!44705 (= (arr!35668 _values!996) (store mapRest!44705 mapKey!44705 mapValue!44705))))

(declare-fun b!1137864 () Bool)

(assert (=> b!1137864 (= e!647453 e!647457)))

(declare-fun c!111373 () Bool)

(assert (=> b!1137864 (= c!111373 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506135))))

(declare-fun b!1137865 () Bool)

(assert (=> b!1137865 (= e!647451 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506135) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137866 () Bool)

(declare-fun Unit!37275 () Unit!37271)

(assert (=> b!1137866 (= e!647448 Unit!37275)))

(declare-fun b!1137867 () Bool)

(declare-fun res!759171 () Bool)

(assert (=> b!1137867 (=> (not res!759171) (not e!647454))))

(assert (=> b!1137867 (= res!759171 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24881))))

(declare-fun b!1137868 () Bool)

(assert (=> b!1137868 (= e!647451 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137869 () Bool)

(assert (=> b!1137869 (contains!6601 call!50232 k0!934)))

(declare-fun lt!506128 () Unit!37271)

(assert (=> b!1137869 (= lt!506128 call!50230)))

(assert (=> b!1137869 call!50231))

(assert (=> b!1137869 (= lt!506139 (+!3498 lt!506132 (tuple2!18127 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506126 () Unit!37271)

(assert (=> b!1137869 (= lt!506126 (addStillContains!758 lt!506132 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1137869 (= e!647456 lt!506128)))

(declare-fun b!1137870 () Bool)

(assert (=> b!1137870 call!50228))

(declare-fun lt!506134 () Unit!37271)

(assert (=> b!1137870 (= lt!506134 call!50229)))

(assert (=> b!1137870 (= e!647457 lt!506134)))

(declare-fun b!1137871 () Bool)

(declare-fun -!1218 (ListLongMap!16095 (_ BitVec 64)) ListLongMap!16095)

(assert (=> b!1137871 (= e!647459 (= call!50233 (-!1218 call!50226 k0!934)))))

(declare-fun b!1137872 () Bool)

(declare-fun res!759165 () Bool)

(assert (=> b!1137872 (=> (not res!759165) (not e!647454))))

(assert (=> b!1137872 (= res!759165 (= (select (arr!35667 _keys!1208) i!673) k0!934))))

(declare-fun b!1137873 () Bool)

(declare-fun res!759161 () Bool)

(assert (=> b!1137873 (=> (not res!759161) (not e!647454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137873 (= res!759161 (validKeyInArray!0 k0!934))))

(assert (= (and start!98452 res!759168) b!1137860))

(assert (= (and b!1137860 res!759162) b!1137849))

(assert (= (and b!1137849 res!759173) b!1137847))

(assert (= (and b!1137847 res!759169) b!1137867))

(assert (= (and b!1137867 res!759171) b!1137858))

(assert (= (and b!1137858 res!759163) b!1137873))

(assert (= (and b!1137873 res!759161) b!1137872))

(assert (= (and b!1137872 res!759165) b!1137862))

(assert (= (and b!1137862 res!759170) b!1137853))

(assert (= (and b!1137853 res!759164) b!1137863))

(assert (= (and b!1137863 (not res!759166)) b!1137846))

(assert (= (and b!1137846 (not res!759160)) b!1137848))

(assert (= (and b!1137848 c!111371) b!1137871))

(assert (= (and b!1137848 (not c!111371)) b!1137857))

(assert (= (or b!1137871 b!1137857) bm!50223))

(assert (= (or b!1137871 b!1137857) bm!50228))

(assert (= (and b!1137848 (not res!759167)) b!1137856))

(assert (= (and b!1137856 c!111376) b!1137861))

(assert (= (and b!1137856 (not c!111376)) b!1137866))

(assert (= (and b!1137861 c!111372) b!1137869))

(assert (= (and b!1137861 (not c!111372)) b!1137850))

(assert (= (and b!1137850 c!111375) b!1137859))

(assert (= (and b!1137850 (not c!111375)) b!1137864))

(assert (= (and b!1137864 c!111373) b!1137870))

(assert (= (and b!1137864 (not c!111373)) b!1137851))

(assert (= (or b!1137859 b!1137870) bm!50230))

(assert (= (or b!1137859 b!1137870) bm!50227))

(assert (= (or b!1137859 b!1137870) bm!50225))

(assert (= (or b!1137869 bm!50225) bm!50224))

(assert (= (or b!1137869 bm!50230) bm!50226))

(assert (= (or b!1137869 bm!50227) bm!50229))

(assert (= (and b!1137861 c!111374) b!1137868))

(assert (= (and b!1137861 (not c!111374)) b!1137865))

(assert (= (and b!1137861 res!759172) b!1137845))

(assert (= (and b!1137854 condMapEmpty!44705) mapIsEmpty!44705))

(assert (= (and b!1137854 (not condMapEmpty!44705)) mapNonEmpty!44705))

(get-info :version)

(assert (= (and mapNonEmpty!44705 ((_ is ValueCellFull!13584) mapValue!44705)) b!1137852))

(assert (= (and b!1137854 ((_ is ValueCellFull!13584) mapDefault!44705)) b!1137855))

(assert (= start!98452 b!1137854))

(declare-fun b_lambda!19163 () Bool)

(assert (=> (not b_lambda!19163) (not b!1137846)))

(declare-fun t!35931 () Bool)

(declare-fun tb!8869 () Bool)

(assert (=> (and start!98452 (= defaultEntry!1004 defaultEntry!1004) t!35931) tb!8869))

(declare-fun result!18303 () Bool)

(assert (=> tb!8869 (= result!18303 tp_is_empty!28587)))

(assert (=> b!1137846 t!35931))

(declare-fun b_and!38965 () Bool)

(assert (= b_and!38963 (and (=> t!35931 result!18303) b_and!38965)))

(declare-fun m!1049837 () Bool)

(assert (=> b!1137856 m!1049837))

(declare-fun m!1049839 () Bool)

(assert (=> b!1137856 m!1049839))

(declare-fun m!1049841 () Bool)

(assert (=> b!1137863 m!1049841))

(declare-fun m!1049843 () Bool)

(assert (=> b!1137863 m!1049843))

(declare-fun m!1049845 () Bool)

(assert (=> b!1137846 m!1049845))

(declare-fun m!1049847 () Bool)

(assert (=> b!1137846 m!1049847))

(declare-fun m!1049849 () Bool)

(assert (=> b!1137846 m!1049849))

(declare-fun m!1049851 () Bool)

(assert (=> b!1137846 m!1049851))

(declare-fun m!1049853 () Bool)

(assert (=> bm!50223 m!1049853))

(declare-fun m!1049855 () Bool)

(assert (=> mapNonEmpty!44705 m!1049855))

(declare-fun m!1049857 () Bool)

(assert (=> b!1137861 m!1049857))

(declare-fun m!1049859 () Bool)

(assert (=> b!1137861 m!1049859))

(declare-fun m!1049861 () Bool)

(assert (=> b!1137861 m!1049861))

(declare-fun m!1049863 () Bool)

(assert (=> b!1137861 m!1049863))

(declare-fun m!1049865 () Bool)

(assert (=> b!1137847 m!1049865))

(declare-fun m!1049867 () Bool)

(assert (=> b!1137848 m!1049867))

(declare-fun m!1049869 () Bool)

(assert (=> b!1137848 m!1049869))

(declare-fun m!1049871 () Bool)

(assert (=> bm!50229 m!1049871))

(declare-fun m!1049873 () Bool)

(assert (=> b!1137845 m!1049873))

(declare-fun m!1049875 () Bool)

(assert (=> b!1137869 m!1049875))

(declare-fun m!1049877 () Bool)

(assert (=> b!1137869 m!1049877))

(declare-fun m!1049879 () Bool)

(assert (=> b!1137869 m!1049879))

(declare-fun m!1049881 () Bool)

(assert (=> bm!50224 m!1049881))

(declare-fun m!1049883 () Bool)

(assert (=> b!1137871 m!1049883))

(declare-fun m!1049885 () Bool)

(assert (=> b!1137873 m!1049885))

(declare-fun m!1049887 () Bool)

(assert (=> b!1137860 m!1049887))

(declare-fun m!1049889 () Bool)

(assert (=> b!1137867 m!1049889))

(declare-fun m!1049891 () Bool)

(assert (=> b!1137862 m!1049891))

(declare-fun m!1049893 () Bool)

(assert (=> b!1137862 m!1049893))

(declare-fun m!1049895 () Bool)

(assert (=> start!98452 m!1049895))

(declare-fun m!1049897 () Bool)

(assert (=> start!98452 m!1049897))

(declare-fun m!1049899 () Bool)

(assert (=> b!1137872 m!1049899))

(declare-fun m!1049901 () Bool)

(assert (=> bm!50226 m!1049901))

(assert (=> bm!50228 m!1049839))

(assert (=> b!1137868 m!1049873))

(declare-fun m!1049903 () Bool)

(assert (=> b!1137853 m!1049903))

(check-sat (not b!1137863) (not b!1137868) (not b!1137862) (not start!98452) (not bm!50226) (not b!1137861) (not b!1137847) (not b_next!24057) (not b!1137845) (not b!1137856) tp_is_empty!28587 (not bm!50223) (not bm!50228) (not b!1137873) (not b!1137846) b_and!38965 (not b!1137848) (not bm!50224) (not b!1137871) (not b!1137869) (not mapNonEmpty!44705) (not b!1137853) (not b_lambda!19163) (not b!1137867) (not b!1137860) (not bm!50229))
(check-sat b_and!38965 (not b_next!24057))
