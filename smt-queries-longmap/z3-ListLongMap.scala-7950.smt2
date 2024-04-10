; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98542 () Bool)

(assert start!98542)

(declare-fun b_free!24147 () Bool)

(declare-fun b_next!24147 () Bool)

(assert (=> start!98542 (= b_free!24147 (not b_next!24147))))

(declare-fun tp!85151 () Bool)

(declare-fun b_and!39143 () Bool)

(assert (=> start!98542 (= tp!85151 b_and!39143)))

(declare-fun b!1141850 () Bool)

(declare-fun e!649618 () Bool)

(declare-fun e!649620 () Bool)

(declare-fun mapRes!44840 () Bool)

(assert (=> b!1141850 (= e!649618 (and e!649620 mapRes!44840))))

(declare-fun condMapEmpty!44840 () Bool)

(declare-datatypes ((V!43363 0))(
  ( (V!43364 (val!14395 Int)) )
))
(declare-datatypes ((ValueCell!13629 0))(
  ( (ValueCellFull!13629 (v!17032 V!43363)) (EmptyCell!13629) )
))
(declare-datatypes ((array!74207 0))(
  ( (array!74208 (arr!35754 (Array (_ BitVec 32) ValueCell!13629)) (size!36290 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74207)

(declare-fun mapDefault!44840 () ValueCell!13629)

(assert (=> b!1141850 (= condMapEmpty!44840 (= (arr!35754 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13629)) mapDefault!44840)))))

(declare-fun zeroValue!944 () V!43363)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!51303 () Bool)

(declare-datatypes ((array!74209 0))(
  ( (array!74210 (arr!35755 (Array (_ BitVec 32) (_ BitVec 64))) (size!36291 (_ BitVec 32))) )
))
(declare-fun lt!508833 () array!74209)

(declare-datatypes ((tuple2!18210 0))(
  ( (tuple2!18211 (_1!9116 (_ BitVec 64)) (_2!9116 V!43363)) )
))
(declare-datatypes ((List!24965 0))(
  ( (Nil!24962) (Cons!24961 (h!26170 tuple2!18210) (t!36104 List!24965)) )
))
(declare-datatypes ((ListLongMap!16179 0))(
  ( (ListLongMap!16180 (toList!8105 List!24965)) )
))
(declare-fun call!51308 () ListLongMap!16179)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!508835 () array!74207)

(declare-fun minValue!944 () V!43363)

(declare-fun getCurrentListMapNoExtraKeys!4587 (array!74209 array!74207 (_ BitVec 32) (_ BitVec 32) V!43363 V!43363 (_ BitVec 32) Int) ListLongMap!16179)

(assert (=> bm!51303 (= call!51308 (getCurrentListMapNoExtraKeys!4587 lt!508833 lt!508835 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141851 () Bool)

(declare-fun res!761059 () Bool)

(declare-fun e!649612 () Bool)

(assert (=> b!1141851 (=> (not res!761059) (not e!649612))))

(declare-fun _keys!1208 () array!74209)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74209 (_ BitVec 32)) Bool)

(assert (=> b!1141851 (= res!761059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141853 () Bool)

(declare-fun e!649623 () Bool)

(assert (=> b!1141853 (= e!649623 true)))

(declare-fun lt!508838 () ListLongMap!16179)

(declare-fun lt!508842 () V!43363)

(declare-fun -!1255 (ListLongMap!16179 (_ BitVec 64)) ListLongMap!16179)

(declare-fun +!3536 (ListLongMap!16179 tuple2!18210) ListLongMap!16179)

(assert (=> b!1141853 (= (-!1255 (+!3536 lt!508838 (tuple2!18211 (select (arr!35755 _keys!1208) from!1455) lt!508842)) (select (arr!35755 _keys!1208) from!1455)) lt!508838)))

(declare-datatypes ((Unit!37451 0))(
  ( (Unit!37452) )
))
(declare-fun lt!508825 () Unit!37451)

(declare-fun addThenRemoveForNewKeyIsSame!108 (ListLongMap!16179 (_ BitVec 64) V!43363) Unit!37451)

(assert (=> b!1141853 (= lt!508825 (addThenRemoveForNewKeyIsSame!108 lt!508838 (select (arr!35755 _keys!1208) from!1455) lt!508842))))

(declare-fun lt!508834 () V!43363)

(declare-fun get!18170 (ValueCell!13629 V!43363) V!43363)

(assert (=> b!1141853 (= lt!508842 (get!18170 (select (arr!35754 _values!996) from!1455) lt!508834))))

(declare-fun lt!508823 () Unit!37451)

(declare-fun e!649610 () Unit!37451)

(assert (=> b!1141853 (= lt!508823 e!649610)))

(declare-fun c!112186 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6640 (ListLongMap!16179 (_ BitVec 64)) Bool)

(assert (=> b!1141853 (= c!112186 (contains!6640 lt!508838 k0!934))))

(assert (=> b!1141853 (= lt!508838 (getCurrentListMapNoExtraKeys!4587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!51313 () Unit!37451)

(declare-fun c!112185 () Bool)

(declare-fun c!112183 () Bool)

(declare-fun bm!51304 () Bool)

(declare-fun addStillContains!793 (ListLongMap!16179 (_ BitVec 64) V!43363 (_ BitVec 64)) Unit!37451)

(assert (=> bm!51304 (= call!51313 (addStillContains!793 lt!508838 (ite (or c!112183 c!112185) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112183 c!112185) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1141854 () Bool)

(declare-fun e!649621 () Bool)

(declare-fun call!51312 () ListLongMap!16179)

(assert (=> b!1141854 (= e!649621 (= call!51308 call!51312))))

(declare-fun bm!51305 () Bool)

(declare-fun call!51306 () Bool)

(declare-fun call!51310 () Bool)

(assert (=> bm!51305 (= call!51306 call!51310)))

(declare-fun b!1141855 () Bool)

(declare-fun e!649617 () Bool)

(declare-fun e!649609 () Bool)

(assert (=> b!1141855 (= e!649617 e!649609)))

(declare-fun res!761055 () Bool)

(assert (=> b!1141855 (=> res!761055 e!649609)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141855 (= res!761055 (not (= from!1455 i!673)))))

(declare-fun lt!508827 () ListLongMap!16179)

(assert (=> b!1141855 (= lt!508827 (getCurrentListMapNoExtraKeys!4587 lt!508833 lt!508835 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1141855 (= lt!508835 (array!74208 (store (arr!35754 _values!996) i!673 (ValueCellFull!13629 lt!508834)) (size!36290 _values!996)))))

(declare-fun dynLambda!2630 (Int (_ BitVec 64)) V!43363)

(assert (=> b!1141855 (= lt!508834 (dynLambda!2630 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508822 () ListLongMap!16179)

(assert (=> b!1141855 (= lt!508822 (getCurrentListMapNoExtraKeys!4587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141856 () Bool)

(declare-fun res!761056 () Bool)

(assert (=> b!1141856 (=> (not res!761056) (not e!649612))))

(declare-datatypes ((List!24966 0))(
  ( (Nil!24963) (Cons!24962 (h!26171 (_ BitVec 64)) (t!36105 List!24966)) )
))
(declare-fun arrayNoDuplicates!0 (array!74209 (_ BitVec 32) List!24966) Bool)

(assert (=> b!1141856 (= res!761056 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24963))))

(declare-fun b!1141857 () Bool)

(declare-fun res!761060 () Bool)

(assert (=> b!1141857 (=> (not res!761060) (not e!649612))))

(assert (=> b!1141857 (= res!761060 (and (= (size!36290 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36291 _keys!1208) (size!36290 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44840 () Bool)

(declare-fun tp!85152 () Bool)

(declare-fun e!649619 () Bool)

(assert (=> mapNonEmpty!44840 (= mapRes!44840 (and tp!85152 e!649619))))

(declare-fun mapKey!44840 () (_ BitVec 32))

(declare-fun mapRest!44840 () (Array (_ BitVec 32) ValueCell!13629))

(declare-fun mapValue!44840 () ValueCell!13629)

(assert (=> mapNonEmpty!44840 (= (arr!35754 _values!996) (store mapRest!44840 mapKey!44840 mapValue!44840))))

(declare-fun b!1141858 () Bool)

(declare-fun e!649608 () Bool)

(declare-fun arrayContainsKey!0 (array!74209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141858 (= e!649608 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141859 () Bool)

(assert (=> b!1141859 (= e!649621 (= call!51308 (-!1255 call!51312 k0!934)))))

(declare-fun b!1141860 () Bool)

(declare-fun res!761062 () Bool)

(assert (=> b!1141860 (=> (not res!761062) (not e!649612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141860 (= res!761062 (validMask!0 mask!1564))))

(declare-fun b!1141861 () Bool)

(declare-fun e!649614 () Unit!37451)

(declare-fun Unit!37453 () Unit!37451)

(assert (=> b!1141861 (= e!649614 Unit!37453)))

(declare-fun b!1141862 () Bool)

(declare-fun tp_is_empty!28677 () Bool)

(assert (=> b!1141862 (= e!649619 tp_is_empty!28677)))

(declare-fun b!1141863 () Bool)

(declare-fun res!761061 () Bool)

(assert (=> b!1141863 (=> (not res!761061) (not e!649612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141863 (= res!761061 (validKeyInArray!0 k0!934))))

(declare-fun bm!51306 () Bool)

(assert (=> bm!51306 (= call!51312 (getCurrentListMapNoExtraKeys!4587 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141864 () Bool)

(declare-fun lt!508840 () Bool)

(assert (=> b!1141864 (= c!112185 (and (not lt!508840) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649611 () Unit!37451)

(declare-fun e!649615 () Unit!37451)

(assert (=> b!1141864 (= e!649611 e!649615)))

(declare-fun b!1141865 () Bool)

(declare-fun res!761053 () Bool)

(assert (=> b!1141865 (=> (not res!761053) (not e!649612))))

(assert (=> b!1141865 (= res!761053 (= (select (arr!35755 _keys!1208) i!673) k0!934))))

(declare-fun b!1141852 () Bool)

(declare-fun Unit!37454 () Unit!37451)

(assert (=> b!1141852 (= e!649610 Unit!37454)))

(assert (=> b!1141852 (= lt!508840 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141852 (= c!112183 (and (not lt!508840) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508824 () Unit!37451)

(assert (=> b!1141852 (= lt!508824 e!649611)))

(declare-fun lt!508836 () Unit!37451)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!389 (array!74209 array!74207 (_ BitVec 32) (_ BitVec 32) V!43363 V!43363 (_ BitVec 64) (_ BitVec 32) Int) Unit!37451)

(assert (=> b!1141852 (= lt!508836 (lemmaListMapContainsThenArrayContainsFrom!389 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112182 () Bool)

(assert (=> b!1141852 (= c!112182 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761054 () Bool)

(assert (=> b!1141852 (= res!761054 e!649608)))

(declare-fun e!649622 () Bool)

(assert (=> b!1141852 (=> (not res!761054) (not e!649622))))

(assert (=> b!1141852 e!649622))

(declare-fun lt!508830 () Unit!37451)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74209 (_ BitVec 32) (_ BitVec 32)) Unit!37451)

(assert (=> b!1141852 (= lt!508830 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1141852 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24963)))

(declare-fun lt!508831 () Unit!37451)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74209 (_ BitVec 64) (_ BitVec 32) List!24966) Unit!37451)

(assert (=> b!1141852 (= lt!508831 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24963))))

(assert (=> b!1141852 false))

(declare-fun res!761057 () Bool)

(assert (=> start!98542 (=> (not res!761057) (not e!649612))))

(assert (=> start!98542 (= res!761057 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36291 _keys!1208))))))

(assert (=> start!98542 e!649612))

(assert (=> start!98542 tp_is_empty!28677))

(declare-fun array_inv!27404 (array!74209) Bool)

(assert (=> start!98542 (array_inv!27404 _keys!1208)))

(assert (=> start!98542 true))

(assert (=> start!98542 tp!85151))

(declare-fun array_inv!27405 (array!74207) Bool)

(assert (=> start!98542 (and (array_inv!27405 _values!996) e!649618)))

(declare-fun b!1141866 () Bool)

(assert (=> b!1141866 (= e!649608 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508840) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141867 () Bool)

(assert (=> b!1141867 (= e!649620 tp_is_empty!28677)))

(declare-fun bm!51307 () Bool)

(declare-fun call!51309 () ListLongMap!16179)

(declare-fun lt!508841 () ListLongMap!16179)

(assert (=> bm!51307 (= call!51309 (+!3536 (ite c!112183 lt!508841 lt!508838) (ite c!112183 (tuple2!18211 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112185 (tuple2!18211 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18211 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1141868 () Bool)

(assert (=> b!1141868 call!51306))

(declare-fun lt!508826 () Unit!37451)

(declare-fun call!51311 () Unit!37451)

(assert (=> b!1141868 (= lt!508826 call!51311)))

(assert (=> b!1141868 (= e!649614 lt!508826)))

(declare-fun b!1141869 () Bool)

(declare-fun Unit!37455 () Unit!37451)

(assert (=> b!1141869 (= e!649610 Unit!37455)))

(declare-fun bm!51308 () Bool)

(declare-fun call!51307 () ListLongMap!16179)

(assert (=> bm!51308 (= call!51307 call!51309)))

(declare-fun b!1141870 () Bool)

(assert (=> b!1141870 (contains!6640 call!51309 k0!934)))

(declare-fun lt!508837 () Unit!37451)

(assert (=> b!1141870 (= lt!508837 (addStillContains!793 lt!508841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1141870 call!51310))

(assert (=> b!1141870 (= lt!508841 (+!3536 lt!508838 (tuple2!18211 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508829 () Unit!37451)

(assert (=> b!1141870 (= lt!508829 call!51313)))

(assert (=> b!1141870 (= e!649611 lt!508837)))

(declare-fun b!1141871 () Bool)

(assert (=> b!1141871 (= e!649615 e!649614)))

(declare-fun c!112181 () Bool)

(assert (=> b!1141871 (= c!112181 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508840))))

(declare-fun b!1141872 () Bool)

(assert (=> b!1141872 (= e!649622 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141873 () Bool)

(declare-fun e!649613 () Bool)

(assert (=> b!1141873 (= e!649612 e!649613)))

(declare-fun res!761050 () Bool)

(assert (=> b!1141873 (=> (not res!761050) (not e!649613))))

(assert (=> b!1141873 (= res!761050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508833 mask!1564))))

(assert (=> b!1141873 (= lt!508833 (array!74210 (store (arr!35755 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36291 _keys!1208)))))

(declare-fun b!1141874 () Bool)

(declare-fun res!761063 () Bool)

(assert (=> b!1141874 (=> (not res!761063) (not e!649613))))

(assert (=> b!1141874 (= res!761063 (arrayNoDuplicates!0 lt!508833 #b00000000000000000000000000000000 Nil!24963))))

(declare-fun bm!51309 () Bool)

(assert (=> bm!51309 (= call!51310 (contains!6640 (ite c!112183 lt!508841 call!51307) k0!934))))

(declare-fun b!1141875 () Bool)

(assert (=> b!1141875 (= e!649609 e!649623)))

(declare-fun res!761058 () Bool)

(assert (=> b!1141875 (=> res!761058 e!649623)))

(assert (=> b!1141875 (= res!761058 (not (= (select (arr!35755 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1141875 e!649621))

(declare-fun c!112184 () Bool)

(assert (=> b!1141875 (= c!112184 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508828 () Unit!37451)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!499 (array!74209 array!74207 (_ BitVec 32) (_ BitVec 32) V!43363 V!43363 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37451)

(assert (=> b!1141875 (= lt!508828 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!499 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51310 () Bool)

(assert (=> bm!51310 (= call!51311 call!51313)))

(declare-fun mapIsEmpty!44840 () Bool)

(assert (=> mapIsEmpty!44840 mapRes!44840))

(declare-fun b!1141876 () Bool)

(declare-fun res!761051 () Bool)

(assert (=> b!1141876 (=> (not res!761051) (not e!649612))))

(assert (=> b!1141876 (= res!761051 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36291 _keys!1208))))))

(declare-fun b!1141877 () Bool)

(assert (=> b!1141877 (= e!649613 (not e!649617))))

(declare-fun res!761052 () Bool)

(assert (=> b!1141877 (=> res!761052 e!649617)))

(assert (=> b!1141877 (= res!761052 (bvsgt from!1455 i!673))))

(assert (=> b!1141877 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508839 () Unit!37451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74209 (_ BitVec 64) (_ BitVec 32)) Unit!37451)

(assert (=> b!1141877 (= lt!508839 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1141878 () Bool)

(declare-fun lt!508832 () Unit!37451)

(assert (=> b!1141878 (= e!649615 lt!508832)))

(assert (=> b!1141878 (= lt!508832 call!51311)))

(assert (=> b!1141878 call!51306))

(assert (= (and start!98542 res!761057) b!1141860))

(assert (= (and b!1141860 res!761062) b!1141857))

(assert (= (and b!1141857 res!761060) b!1141851))

(assert (= (and b!1141851 res!761059) b!1141856))

(assert (= (and b!1141856 res!761056) b!1141876))

(assert (= (and b!1141876 res!761051) b!1141863))

(assert (= (and b!1141863 res!761061) b!1141865))

(assert (= (and b!1141865 res!761053) b!1141873))

(assert (= (and b!1141873 res!761050) b!1141874))

(assert (= (and b!1141874 res!761063) b!1141877))

(assert (= (and b!1141877 (not res!761052)) b!1141855))

(assert (= (and b!1141855 (not res!761055)) b!1141875))

(assert (= (and b!1141875 c!112184) b!1141859))

(assert (= (and b!1141875 (not c!112184)) b!1141854))

(assert (= (or b!1141859 b!1141854) bm!51303))

(assert (= (or b!1141859 b!1141854) bm!51306))

(assert (= (and b!1141875 (not res!761058)) b!1141853))

(assert (= (and b!1141853 c!112186) b!1141852))

(assert (= (and b!1141853 (not c!112186)) b!1141869))

(assert (= (and b!1141852 c!112183) b!1141870))

(assert (= (and b!1141852 (not c!112183)) b!1141864))

(assert (= (and b!1141864 c!112185) b!1141878))

(assert (= (and b!1141864 (not c!112185)) b!1141871))

(assert (= (and b!1141871 c!112181) b!1141868))

(assert (= (and b!1141871 (not c!112181)) b!1141861))

(assert (= (or b!1141878 b!1141868) bm!51310))

(assert (= (or b!1141878 b!1141868) bm!51308))

(assert (= (or b!1141878 b!1141868) bm!51305))

(assert (= (or b!1141870 bm!51305) bm!51309))

(assert (= (or b!1141870 bm!51310) bm!51304))

(assert (= (or b!1141870 bm!51308) bm!51307))

(assert (= (and b!1141852 c!112182) b!1141858))

(assert (= (and b!1141852 (not c!112182)) b!1141866))

(assert (= (and b!1141852 res!761054) b!1141872))

(assert (= (and b!1141850 condMapEmpty!44840) mapIsEmpty!44840))

(assert (= (and b!1141850 (not condMapEmpty!44840)) mapNonEmpty!44840))

(get-info :version)

(assert (= (and mapNonEmpty!44840 ((_ is ValueCellFull!13629) mapValue!44840)) b!1141862))

(assert (= (and b!1141850 ((_ is ValueCellFull!13629) mapDefault!44840)) b!1141867))

(assert (= start!98542 b!1141850))

(declare-fun b_lambda!19253 () Bool)

(assert (=> (not b_lambda!19253) (not b!1141855)))

(declare-fun t!36103 () Bool)

(declare-fun tb!8959 () Bool)

(assert (=> (and start!98542 (= defaultEntry!1004 defaultEntry!1004) t!36103) tb!8959))

(declare-fun result!18483 () Bool)

(assert (=> tb!8959 (= result!18483 tp_is_empty!28677)))

(assert (=> b!1141855 t!36103))

(declare-fun b_and!39145 () Bool)

(assert (= b_and!39143 (and (=> t!36103 result!18483) b_and!39145)))

(declare-fun m!1053187 () Bool)

(assert (=> start!98542 m!1053187))

(declare-fun m!1053189 () Bool)

(assert (=> start!98542 m!1053189))

(declare-fun m!1053191 () Bool)

(assert (=> bm!51304 m!1053191))

(declare-fun m!1053193 () Bool)

(assert (=> b!1141855 m!1053193))

(declare-fun m!1053195 () Bool)

(assert (=> b!1141855 m!1053195))

(declare-fun m!1053197 () Bool)

(assert (=> b!1141855 m!1053197))

(declare-fun m!1053199 () Bool)

(assert (=> b!1141855 m!1053199))

(declare-fun m!1053201 () Bool)

(assert (=> bm!51309 m!1053201))

(declare-fun m!1053203 () Bool)

(assert (=> b!1141852 m!1053203))

(declare-fun m!1053205 () Bool)

(assert (=> b!1141852 m!1053205))

(declare-fun m!1053207 () Bool)

(assert (=> b!1141852 m!1053207))

(declare-fun m!1053209 () Bool)

(assert (=> b!1141852 m!1053209))

(declare-fun m!1053211 () Bool)

(assert (=> b!1141863 m!1053211))

(declare-fun m!1053213 () Bool)

(assert (=> bm!51306 m!1053213))

(declare-fun m!1053215 () Bool)

(assert (=> b!1141858 m!1053215))

(declare-fun m!1053217 () Bool)

(assert (=> b!1141875 m!1053217))

(declare-fun m!1053219 () Bool)

(assert (=> b!1141875 m!1053219))

(declare-fun m!1053221 () Bool)

(assert (=> b!1141859 m!1053221))

(declare-fun m!1053223 () Bool)

(assert (=> bm!51307 m!1053223))

(declare-fun m!1053225 () Bool)

(assert (=> bm!51303 m!1053225))

(declare-fun m!1053227 () Bool)

(assert (=> mapNonEmpty!44840 m!1053227))

(assert (=> b!1141853 m!1053213))

(declare-fun m!1053229 () Bool)

(assert (=> b!1141853 m!1053229))

(declare-fun m!1053231 () Bool)

(assert (=> b!1141853 m!1053231))

(assert (=> b!1141853 m!1053217))

(declare-fun m!1053233 () Bool)

(assert (=> b!1141853 m!1053233))

(assert (=> b!1141853 m!1053217))

(assert (=> b!1141853 m!1053231))

(assert (=> b!1141853 m!1053217))

(declare-fun m!1053235 () Bool)

(assert (=> b!1141853 m!1053235))

(declare-fun m!1053237 () Bool)

(assert (=> b!1141853 m!1053237))

(assert (=> b!1141853 m!1053237))

(declare-fun m!1053239 () Bool)

(assert (=> b!1141853 m!1053239))

(declare-fun m!1053241 () Bool)

(assert (=> b!1141851 m!1053241))

(assert (=> b!1141872 m!1053215))

(declare-fun m!1053243 () Bool)

(assert (=> b!1141860 m!1053243))

(declare-fun m!1053245 () Bool)

(assert (=> b!1141874 m!1053245))

(declare-fun m!1053247 () Bool)

(assert (=> b!1141856 m!1053247))

(declare-fun m!1053249 () Bool)

(assert (=> b!1141877 m!1053249))

(declare-fun m!1053251 () Bool)

(assert (=> b!1141877 m!1053251))

(declare-fun m!1053253 () Bool)

(assert (=> b!1141873 m!1053253))

(declare-fun m!1053255 () Bool)

(assert (=> b!1141873 m!1053255))

(declare-fun m!1053257 () Bool)

(assert (=> b!1141865 m!1053257))

(declare-fun m!1053259 () Bool)

(assert (=> b!1141870 m!1053259))

(declare-fun m!1053261 () Bool)

(assert (=> b!1141870 m!1053261))

(declare-fun m!1053263 () Bool)

(assert (=> b!1141870 m!1053263))

(check-sat (not b!1141858) (not b_lambda!19253) (not mapNonEmpty!44840) (not b!1141860) (not b!1141851) b_and!39145 (not b!1141863) (not b_next!24147) (not bm!51306) (not b!1141875) (not b!1141853) (not b!1141870) (not b!1141859) (not bm!51304) (not b!1141873) (not b!1141855) (not b!1141872) tp_is_empty!28677 (not bm!51309) (not b!1141877) (not b!1141856) (not b!1141874) (not bm!51307) (not bm!51303) (not start!98542) (not b!1141852))
(check-sat b_and!39145 (not b_next!24147))
