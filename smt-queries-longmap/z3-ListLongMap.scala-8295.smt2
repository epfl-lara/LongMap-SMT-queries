; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101074 () Bool)

(assert start!101074)

(declare-fun b_free!26041 () Bool)

(declare-fun b_next!26041 () Bool)

(assert (=> start!101074 (= b_free!26041 (not b_next!26041))))

(declare-fun tp!91142 () Bool)

(declare-fun b_and!43155 () Bool)

(assert (=> start!101074 (= tp!91142 b_and!43155)))

(declare-fun b!1211610 () Bool)

(declare-fun res!804861 () Bool)

(declare-fun e!688096 () Bool)

(assert (=> b!1211610 (=> (not res!804861) (not e!688096))))

(declare-datatypes ((array!78190 0))(
  ( (array!78191 (arr!37731 (Array (_ BitVec 32) (_ BitVec 64))) (size!38269 (_ BitVec 32))) )
))
(declare-fun lt!550272 () array!78190)

(declare-datatypes ((List!26676 0))(
  ( (Nil!26673) (Cons!26672 (h!27881 (_ BitVec 64)) (t!39688 List!26676)) )
))
(declare-fun arrayNoDuplicates!0 (array!78190 (_ BitVec 32) List!26676) Bool)

(assert (=> b!1211610 (= res!804861 (arrayNoDuplicates!0 lt!550272 #b00000000000000000000000000000000 Nil!26673))))

(declare-fun b!1211612 () Bool)

(declare-fun c!119503 () Bool)

(declare-fun lt!550268 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1211612 (= c!119503 (and (not lt!550268) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!40010 0))(
  ( (Unit!40011) )
))
(declare-fun e!688083 () Unit!40010)

(declare-fun e!688088 () Unit!40010)

(assert (=> b!1211612 (= e!688083 e!688088)))

(declare-fun mapNonEmpty!47989 () Bool)

(declare-fun mapRes!47989 () Bool)

(declare-fun tp!91141 () Bool)

(declare-fun e!688086 () Bool)

(assert (=> mapNonEmpty!47989 (= mapRes!47989 (and tp!91141 e!688086))))

(declare-datatypes ((V!46121 0))(
  ( (V!46122 (val!15429 Int)) )
))
(declare-datatypes ((ValueCell!14663 0))(
  ( (ValueCellFull!14663 (v!18080 V!46121)) (EmptyCell!14663) )
))
(declare-fun mapRest!47989 () (Array (_ BitVec 32) ValueCell!14663))

(declare-fun mapValue!47989 () ValueCell!14663)

(declare-fun mapKey!47989 () (_ BitVec 32))

(declare-datatypes ((array!78192 0))(
  ( (array!78193 (arr!37732 (Array (_ BitVec 32) ValueCell!14663)) (size!38270 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78192)

(assert (=> mapNonEmpty!47989 (= (arr!37732 _values!996) (store mapRest!47989 mapKey!47989 mapValue!47989))))

(declare-fun b!1211613 () Bool)

(declare-fun tp_is_empty!30745 () Bool)

(assert (=> b!1211613 (= e!688086 tp_is_empty!30745)))

(declare-fun zeroValue!944 () V!46121)

(declare-fun c!119501 () Bool)

(declare-fun call!59934 () Unit!40010)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!59927 () Bool)

(declare-datatypes ((tuple2!19898 0))(
  ( (tuple2!19899 (_1!9960 (_ BitVec 64)) (_2!9960 V!46121)) )
))
(declare-datatypes ((List!26677 0))(
  ( (Nil!26674) (Cons!26673 (h!27882 tuple2!19898) (t!39689 List!26677)) )
))
(declare-datatypes ((ListLongMap!17867 0))(
  ( (ListLongMap!17868 (toList!8949 List!26677)) )
))
(declare-fun lt!550266 () ListLongMap!17867)

(declare-fun minValue!944 () V!46121)

(declare-fun addStillContains!1055 (ListLongMap!17867 (_ BitVec 64) V!46121 (_ BitVec 64)) Unit!40010)

(assert (=> bm!59927 (= call!59934 (addStillContains!1055 lt!550266 (ite (or c!119501 c!119503) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!119501 c!119503) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1211614 () Bool)

(declare-fun res!804867 () Bool)

(declare-fun e!688093 () Bool)

(assert (=> b!1211614 (=> (not res!804867) (not e!688093))))

(declare-fun _keys!1208 () array!78190)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1211614 (= res!804867 (and (= (size!38270 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38269 _keys!1208) (size!38270 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!688081 () Bool)

(declare-fun b!1211615 () Bool)

(declare-fun arrayContainsKey!0 (array!78190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211615 (= e!688081 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211616 () Bool)

(declare-fun res!804863 () Bool)

(assert (=> b!1211616 (=> (not res!804863) (not e!688093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211616 (= res!804863 (validMask!0 mask!1564))))

(declare-fun lt!550267 () ListLongMap!17867)

(declare-fun call!59931 () Bool)

(declare-fun bm!59928 () Bool)

(declare-fun call!59936 () ListLongMap!17867)

(declare-fun contains!6956 (ListLongMap!17867 (_ BitVec 64)) Bool)

(assert (=> bm!59928 (= call!59931 (contains!6956 (ite c!119501 lt!550267 call!59936) k0!934))))

(declare-fun b!1211617 () Bool)

(declare-fun res!804866 () Bool)

(assert (=> b!1211617 (=> (not res!804866) (not e!688093))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211617 (= res!804866 (= (select (arr!37731 _keys!1208) i!673) k0!934))))

(declare-fun b!1211618 () Bool)

(declare-fun lt!550265 () Unit!40010)

(assert (=> b!1211618 (= e!688088 lt!550265)))

(declare-fun call!59930 () Unit!40010)

(assert (=> b!1211618 (= lt!550265 call!59930)))

(declare-fun call!59932 () Bool)

(assert (=> b!1211618 call!59932))

(declare-fun b!1211619 () Bool)

(declare-fun e!688084 () Bool)

(assert (=> b!1211619 (= e!688084 tp_is_empty!30745)))

(declare-fun res!804856 () Bool)

(assert (=> start!101074 (=> (not res!804856) (not e!688093))))

(assert (=> start!101074 (= res!804856 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38269 _keys!1208))))))

(assert (=> start!101074 e!688093))

(assert (=> start!101074 tp_is_empty!30745))

(declare-fun array_inv!28846 (array!78190) Bool)

(assert (=> start!101074 (array_inv!28846 _keys!1208)))

(assert (=> start!101074 true))

(assert (=> start!101074 tp!91142))

(declare-fun e!688087 () Bool)

(declare-fun array_inv!28847 (array!78192) Bool)

(assert (=> start!101074 (and (array_inv!28847 _values!996) e!688087)))

(declare-fun b!1211611 () Bool)

(declare-fun e!688089 () Unit!40010)

(declare-fun Unit!40012 () Unit!40010)

(assert (=> b!1211611 (= e!688089 Unit!40012)))

(declare-fun b!1211620 () Bool)

(declare-fun e!688092 () Unit!40010)

(declare-fun Unit!40013 () Unit!40010)

(assert (=> b!1211620 (= e!688092 Unit!40013)))

(declare-fun lt!550271 () ListLongMap!17867)

(declare-fun defaultEntry!1004 () Int)

(declare-fun e!688094 () Bool)

(declare-fun b!1211621 () Bool)

(declare-fun lt!550264 () array!78192)

(declare-fun getCurrentListMapNoExtraKeys!5391 (array!78190 array!78192 (_ BitVec 32) (_ BitVec 32) V!46121 V!46121 (_ BitVec 32) Int) ListLongMap!17867)

(assert (=> b!1211621 (= e!688094 (= lt!550271 (getCurrentListMapNoExtraKeys!5391 lt!550272 lt!550264 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(assert (=> b!1211621 (= lt!550271 lt!550266)))

(declare-fun lt!550277 () ListLongMap!17867)

(declare-fun -!1827 (ListLongMap!17867 (_ BitVec 64)) ListLongMap!17867)

(assert (=> b!1211621 (= lt!550271 (-!1827 lt!550277 k0!934))))

(declare-fun lt!550273 () V!46121)

(declare-fun +!4070 (ListLongMap!17867 tuple2!19898) ListLongMap!17867)

(assert (=> b!1211621 (= (-!1827 (+!4070 lt!550266 (tuple2!19899 (select (arr!37731 _keys!1208) from!1455) lt!550273)) (select (arr!37731 _keys!1208) from!1455)) lt!550266)))

(declare-fun lt!550279 () Unit!40010)

(declare-fun addThenRemoveForNewKeyIsSame!263 (ListLongMap!17867 (_ BitVec 64) V!46121) Unit!40010)

(assert (=> b!1211621 (= lt!550279 (addThenRemoveForNewKeyIsSame!263 lt!550266 (select (arr!37731 _keys!1208) from!1455) lt!550273))))

(declare-fun lt!550269 () V!46121)

(declare-fun get!19246 (ValueCell!14663 V!46121) V!46121)

(assert (=> b!1211621 (= lt!550273 (get!19246 (select (arr!37732 _values!996) from!1455) lt!550269))))

(declare-fun lt!550263 () Unit!40010)

(assert (=> b!1211621 (= lt!550263 e!688089)))

(declare-fun c!119500 () Bool)

(assert (=> b!1211621 (= c!119500 (contains!6956 lt!550266 k0!934))))

(assert (=> b!1211621 (= lt!550266 (getCurrentListMapNoExtraKeys!5391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211622 () Bool)

(declare-fun e!688090 () Bool)

(assert (=> b!1211622 (= e!688096 (not e!688090))))

(declare-fun res!804855 () Bool)

(assert (=> b!1211622 (=> res!804855 e!688090)))

(assert (=> b!1211622 (= res!804855 (bvsgt from!1455 i!673))))

(assert (=> b!1211622 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550261 () Unit!40010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78190 (_ BitVec 64) (_ BitVec 32)) Unit!40010)

(assert (=> b!1211622 (= lt!550261 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59929 () Bool)

(declare-fun call!59935 () ListLongMap!17867)

(assert (=> bm!59929 (= call!59935 (getCurrentListMapNoExtraKeys!5391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211623 () Bool)

(declare-fun Unit!40014 () Unit!40010)

(assert (=> b!1211623 (= e!688089 Unit!40014)))

(assert (=> b!1211623 (= lt!550268 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211623 (= c!119501 (and (not lt!550268) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550278 () Unit!40010)

(assert (=> b!1211623 (= lt!550278 e!688083)))

(declare-fun lt!550260 () Unit!40010)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!595 (array!78190 array!78192 (_ BitVec 32) (_ BitVec 32) V!46121 V!46121 (_ BitVec 64) (_ BitVec 32) Int) Unit!40010)

(assert (=> b!1211623 (= lt!550260 (lemmaListMapContainsThenArrayContainsFrom!595 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119499 () Bool)

(assert (=> b!1211623 (= c!119499 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804862 () Bool)

(assert (=> b!1211623 (= res!804862 e!688081)))

(declare-fun e!688095 () Bool)

(assert (=> b!1211623 (=> (not res!804862) (not e!688095))))

(assert (=> b!1211623 e!688095))

(declare-fun lt!550280 () Unit!40010)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78190 (_ BitVec 32) (_ BitVec 32)) Unit!40010)

(assert (=> b!1211623 (= lt!550280 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1211623 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26673)))

(declare-fun lt!550262 () Unit!40010)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78190 (_ BitVec 64) (_ BitVec 32) List!26676) Unit!40010)

(assert (=> b!1211623 (= lt!550262 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26673))))

(assert (=> b!1211623 false))

(declare-fun b!1211624 () Bool)

(declare-fun call!59933 () ListLongMap!17867)

(assert (=> b!1211624 (contains!6956 call!59933 k0!934)))

(declare-fun lt!550275 () Unit!40010)

(assert (=> b!1211624 (= lt!550275 (addStillContains!1055 lt!550267 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1211624 call!59931))

(assert (=> b!1211624 (= lt!550267 (+!4070 lt!550266 (tuple2!19899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!550276 () Unit!40010)

(assert (=> b!1211624 (= lt!550276 call!59934)))

(assert (=> b!1211624 (= e!688083 lt!550275)))

(declare-fun b!1211625 () Bool)

(assert (=> b!1211625 (= e!688088 e!688092)))

(declare-fun c!119504 () Bool)

(assert (=> b!1211625 (= c!119504 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550268))))

(declare-fun b!1211626 () Bool)

(declare-fun res!804864 () Bool)

(assert (=> b!1211626 (=> (not res!804864) (not e!688093))))

(assert (=> b!1211626 (= res!804864 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38269 _keys!1208))))))

(declare-fun mapIsEmpty!47989 () Bool)

(assert (=> mapIsEmpty!47989 mapRes!47989))

(declare-fun b!1211627 () Bool)

(assert (=> b!1211627 (= e!688093 e!688096)))

(declare-fun res!804868 () Bool)

(assert (=> b!1211627 (=> (not res!804868) (not e!688096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78190 (_ BitVec 32)) Bool)

(assert (=> b!1211627 (= res!804868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550272 mask!1564))))

(assert (=> b!1211627 (= lt!550272 (array!78191 (store (arr!37731 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38269 _keys!1208)))))

(declare-fun b!1211628 () Bool)

(assert (=> b!1211628 (= e!688081 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550268) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211629 () Bool)

(declare-fun res!804858 () Bool)

(assert (=> b!1211629 (=> (not res!804858) (not e!688093))))

(assert (=> b!1211629 (= res!804858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211630 () Bool)

(declare-fun e!688082 () Bool)

(assert (=> b!1211630 (= e!688082 e!688094)))

(declare-fun res!804860 () Bool)

(assert (=> b!1211630 (=> res!804860 e!688094)))

(assert (=> b!1211630 (= res!804860 (not (= (select (arr!37731 _keys!1208) from!1455) k0!934)))))

(declare-fun e!688085 () Bool)

(assert (=> b!1211630 e!688085))

(declare-fun c!119502 () Bool)

(assert (=> b!1211630 (= c!119502 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550270 () Unit!40010)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1066 (array!78190 array!78192 (_ BitVec 32) (_ BitVec 32) V!46121 V!46121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40010)

(assert (=> b!1211630 (= lt!550270 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1066 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211631 () Bool)

(assert (=> b!1211631 call!59932))

(declare-fun lt!550259 () Unit!40010)

(assert (=> b!1211631 (= lt!550259 call!59930)))

(assert (=> b!1211631 (= e!688092 lt!550259)))

(declare-fun call!59937 () ListLongMap!17867)

(declare-fun bm!59930 () Bool)

(assert (=> bm!59930 (= call!59937 (getCurrentListMapNoExtraKeys!5391 lt!550272 lt!550264 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211632 () Bool)

(assert (=> b!1211632 (= e!688087 (and e!688084 mapRes!47989))))

(declare-fun condMapEmpty!47989 () Bool)

(declare-fun mapDefault!47989 () ValueCell!14663)

(assert (=> b!1211632 (= condMapEmpty!47989 (= (arr!37732 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14663)) mapDefault!47989)))))

(declare-fun bm!59931 () Bool)

(assert (=> bm!59931 (= call!59930 call!59934)))

(declare-fun b!1211633 () Bool)

(declare-fun res!804859 () Bool)

(assert (=> b!1211633 (=> (not res!804859) (not e!688093))))

(assert (=> b!1211633 (= res!804859 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26673))))

(declare-fun bm!59932 () Bool)

(assert (=> bm!59932 (= call!59933 (+!4070 (ite c!119501 lt!550267 lt!550266) (ite c!119501 (tuple2!19899 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!119503 (tuple2!19899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19899 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!59933 () Bool)

(assert (=> bm!59933 (= call!59936 call!59933)))

(declare-fun b!1211634 () Bool)

(assert (=> b!1211634 (= e!688085 (= call!59937 (-!1827 call!59935 k0!934)))))

(declare-fun b!1211635 () Bool)

(declare-fun res!804857 () Bool)

(assert (=> b!1211635 (=> (not res!804857) (not e!688093))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211635 (= res!804857 (validKeyInArray!0 k0!934))))

(declare-fun b!1211636 () Bool)

(assert (=> b!1211636 (= e!688085 (= call!59937 call!59935))))

(declare-fun b!1211637 () Bool)

(assert (=> b!1211637 (= e!688090 e!688082)))

(declare-fun res!804865 () Bool)

(assert (=> b!1211637 (=> res!804865 e!688082)))

(assert (=> b!1211637 (= res!804865 (not (= from!1455 i!673)))))

(declare-fun lt!550274 () ListLongMap!17867)

(assert (=> b!1211637 (= lt!550274 (getCurrentListMapNoExtraKeys!5391 lt!550272 lt!550264 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1211637 (= lt!550264 (array!78193 (store (arr!37732 _values!996) i!673 (ValueCellFull!14663 lt!550269)) (size!38270 _values!996)))))

(declare-fun dynLambda!3248 (Int (_ BitVec 64)) V!46121)

(assert (=> b!1211637 (= lt!550269 (dynLambda!3248 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1211637 (= lt!550277 (getCurrentListMapNoExtraKeys!5391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!59934 () Bool)

(assert (=> bm!59934 (= call!59932 call!59931)))

(declare-fun b!1211638 () Bool)

(assert (=> b!1211638 (= e!688095 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!101074 res!804856) b!1211616))

(assert (= (and b!1211616 res!804863) b!1211614))

(assert (= (and b!1211614 res!804867) b!1211629))

(assert (= (and b!1211629 res!804858) b!1211633))

(assert (= (and b!1211633 res!804859) b!1211626))

(assert (= (and b!1211626 res!804864) b!1211635))

(assert (= (and b!1211635 res!804857) b!1211617))

(assert (= (and b!1211617 res!804866) b!1211627))

(assert (= (and b!1211627 res!804868) b!1211610))

(assert (= (and b!1211610 res!804861) b!1211622))

(assert (= (and b!1211622 (not res!804855)) b!1211637))

(assert (= (and b!1211637 (not res!804865)) b!1211630))

(assert (= (and b!1211630 c!119502) b!1211634))

(assert (= (and b!1211630 (not c!119502)) b!1211636))

(assert (= (or b!1211634 b!1211636) bm!59930))

(assert (= (or b!1211634 b!1211636) bm!59929))

(assert (= (and b!1211630 (not res!804860)) b!1211621))

(assert (= (and b!1211621 c!119500) b!1211623))

(assert (= (and b!1211621 (not c!119500)) b!1211611))

(assert (= (and b!1211623 c!119501) b!1211624))

(assert (= (and b!1211623 (not c!119501)) b!1211612))

(assert (= (and b!1211612 c!119503) b!1211618))

(assert (= (and b!1211612 (not c!119503)) b!1211625))

(assert (= (and b!1211625 c!119504) b!1211631))

(assert (= (and b!1211625 (not c!119504)) b!1211620))

(assert (= (or b!1211618 b!1211631) bm!59931))

(assert (= (or b!1211618 b!1211631) bm!59933))

(assert (= (or b!1211618 b!1211631) bm!59934))

(assert (= (or b!1211624 bm!59934) bm!59928))

(assert (= (or b!1211624 bm!59931) bm!59927))

(assert (= (or b!1211624 bm!59933) bm!59932))

(assert (= (and b!1211623 c!119499) b!1211615))

(assert (= (and b!1211623 (not c!119499)) b!1211628))

(assert (= (and b!1211623 res!804862) b!1211638))

(assert (= (and b!1211632 condMapEmpty!47989) mapIsEmpty!47989))

(assert (= (and b!1211632 (not condMapEmpty!47989)) mapNonEmpty!47989))

(get-info :version)

(assert (= (and mapNonEmpty!47989 ((_ is ValueCellFull!14663) mapValue!47989)) b!1211613))

(assert (= (and b!1211632 ((_ is ValueCellFull!14663) mapDefault!47989)) b!1211619))

(assert (= start!101074 b!1211632))

(declare-fun b_lambda!21653 () Bool)

(assert (=> (not b_lambda!21653) (not b!1211637)))

(declare-fun t!39687 () Bool)

(declare-fun tb!10833 () Bool)

(assert (=> (and start!101074 (= defaultEntry!1004 defaultEntry!1004) t!39687) tb!10833))

(declare-fun result!22269 () Bool)

(assert (=> tb!10833 (= result!22269 tp_is_empty!30745)))

(assert (=> b!1211637 t!39687))

(declare-fun b_and!43157 () Bool)

(assert (= b_and!43155 (and (=> t!39687 result!22269) b_and!43157)))

(declare-fun m!1116531 () Bool)

(assert (=> b!1211622 m!1116531))

(declare-fun m!1116533 () Bool)

(assert (=> b!1211622 m!1116533))

(declare-fun m!1116535 () Bool)

(assert (=> b!1211635 m!1116535))

(declare-fun m!1116537 () Bool)

(assert (=> b!1211617 m!1116537))

(declare-fun m!1116539 () Bool)

(assert (=> bm!59928 m!1116539))

(declare-fun m!1116541 () Bool)

(assert (=> bm!59930 m!1116541))

(declare-fun m!1116543 () Bool)

(assert (=> bm!59927 m!1116543))

(declare-fun m!1116545 () Bool)

(assert (=> b!1211630 m!1116545))

(declare-fun m!1116547 () Bool)

(assert (=> b!1211630 m!1116547))

(declare-fun m!1116549 () Bool)

(assert (=> b!1211615 m!1116549))

(declare-fun m!1116551 () Bool)

(assert (=> b!1211624 m!1116551))

(declare-fun m!1116553 () Bool)

(assert (=> b!1211624 m!1116553))

(declare-fun m!1116555 () Bool)

(assert (=> b!1211624 m!1116555))

(declare-fun m!1116557 () Bool)

(assert (=> b!1211633 m!1116557))

(declare-fun m!1116559 () Bool)

(assert (=> b!1211627 m!1116559))

(declare-fun m!1116561 () Bool)

(assert (=> b!1211627 m!1116561))

(declare-fun m!1116563 () Bool)

(assert (=> b!1211621 m!1116563))

(assert (=> b!1211621 m!1116545))

(declare-fun m!1116565 () Bool)

(assert (=> b!1211621 m!1116565))

(declare-fun m!1116567 () Bool)

(assert (=> b!1211621 m!1116567))

(declare-fun m!1116569 () Bool)

(assert (=> b!1211621 m!1116569))

(assert (=> b!1211621 m!1116545))

(declare-fun m!1116571 () Bool)

(assert (=> b!1211621 m!1116571))

(declare-fun m!1116573 () Bool)

(assert (=> b!1211621 m!1116573))

(declare-fun m!1116575 () Bool)

(assert (=> b!1211621 m!1116575))

(assert (=> b!1211621 m!1116541))

(assert (=> b!1211621 m!1116567))

(declare-fun m!1116577 () Bool)

(assert (=> b!1211621 m!1116577))

(assert (=> b!1211621 m!1116545))

(assert (=> b!1211621 m!1116569))

(declare-fun m!1116579 () Bool)

(assert (=> b!1211629 m!1116579))

(declare-fun m!1116581 () Bool)

(assert (=> bm!59932 m!1116581))

(declare-fun m!1116583 () Bool)

(assert (=> b!1211610 m!1116583))

(declare-fun m!1116585 () Bool)

(assert (=> b!1211616 m!1116585))

(assert (=> b!1211638 m!1116549))

(declare-fun m!1116587 () Bool)

(assert (=> b!1211637 m!1116587))

(declare-fun m!1116589 () Bool)

(assert (=> b!1211637 m!1116589))

(declare-fun m!1116591 () Bool)

(assert (=> b!1211637 m!1116591))

(declare-fun m!1116593 () Bool)

(assert (=> b!1211637 m!1116593))

(declare-fun m!1116595 () Bool)

(assert (=> mapNonEmpty!47989 m!1116595))

(declare-fun m!1116597 () Bool)

(assert (=> b!1211634 m!1116597))

(assert (=> bm!59929 m!1116563))

(declare-fun m!1116599 () Bool)

(assert (=> start!101074 m!1116599))

(declare-fun m!1116601 () Bool)

(assert (=> start!101074 m!1116601))

(declare-fun m!1116603 () Bool)

(assert (=> b!1211623 m!1116603))

(declare-fun m!1116605 () Bool)

(assert (=> b!1211623 m!1116605))

(declare-fun m!1116607 () Bool)

(assert (=> b!1211623 m!1116607))

(declare-fun m!1116609 () Bool)

(assert (=> b!1211623 m!1116609))

(check-sat (not bm!59927) (not b!1211621) (not b!1211633) (not bm!59928) (not b!1211623) (not b!1211635) (not b!1211634) (not b!1211624) (not mapNonEmpty!47989) (not b!1211622) tp_is_empty!30745 (not b!1211629) (not bm!59930) (not b_lambda!21653) (not b!1211616) (not b!1211630) (not b_next!26041) (not start!101074) (not b!1211638) (not bm!59932) (not bm!59929) (not b!1211627) (not b!1211610) b_and!43157 (not b!1211637) (not b!1211615))
(check-sat b_and!43157 (not b_next!26041))
