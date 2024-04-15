; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98606 () Bool)

(assert start!98606)

(declare-fun b_free!24217 () Bool)

(declare-fun b_next!24217 () Bool)

(assert (=> start!98606 (= b_free!24217 (not b_next!24217))))

(declare-fun tp!85362 () Bool)

(declare-fun b_and!39261 () Bool)

(assert (=> start!98606 (= tp!85362 b_and!39261)))

(declare-fun b!1144870 () Bool)

(declare-fun e!651239 () Bool)

(declare-fun tp_is_empty!28747 () Bool)

(assert (=> b!1144870 (= e!651239 tp_is_empty!28747)))

(declare-fun b!1144871 () Bool)

(declare-fun e!651255 () Bool)

(declare-fun mapRes!44945 () Bool)

(assert (=> b!1144871 (= e!651255 (and e!651239 mapRes!44945))))

(declare-fun condMapEmpty!44945 () Bool)

(declare-datatypes ((V!43457 0))(
  ( (V!43458 (val!14430 Int)) )
))
(declare-datatypes ((ValueCell!13664 0))(
  ( (ValueCellFull!13664 (v!17066 V!43457)) (EmptyCell!13664) )
))
(declare-datatypes ((array!74266 0))(
  ( (array!74267 (arr!35784 (Array (_ BitVec 32) ValueCell!13664)) (size!36322 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74266)

(declare-fun mapDefault!44945 () ValueCell!13664)

(assert (=> b!1144871 (= condMapEmpty!44945 (= (arr!35784 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13664)) mapDefault!44945)))))

(declare-datatypes ((array!74268 0))(
  ( (array!74269 (arr!35785 (Array (_ BitVec 32) (_ BitVec 64))) (size!36323 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74268)

(declare-fun b!1144872 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!651254 () Bool)

(declare-fun arrayContainsKey!0 (array!74268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144872 (= e!651254 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun zeroValue!944 () V!43457)

(declare-fun bm!52120 () Bool)

(declare-datatypes ((tuple2!18364 0))(
  ( (tuple2!18365 (_1!9193 (_ BitVec 64)) (_2!9193 V!43457)) )
))
(declare-datatypes ((List!25100 0))(
  ( (Nil!25097) (Cons!25096 (h!26305 tuple2!18364) (t!36300 List!25100)) )
))
(declare-datatypes ((ListLongMap!16333 0))(
  ( (ListLongMap!16334 (toList!8182 List!25100)) )
))
(declare-fun call!52123 () ListLongMap!16333)

(declare-fun minValue!944 () V!43457)

(declare-fun c!112787 () Bool)

(declare-fun lt!510848 () ListLongMap!16333)

(declare-fun c!112786 () Bool)

(declare-fun lt!510837 () ListLongMap!16333)

(declare-fun +!3603 (ListLongMap!16333 tuple2!18364) ListLongMap!16333)

(assert (=> bm!52120 (= call!52123 (+!3603 (ite c!112787 lt!510837 lt!510848) (ite c!112787 (tuple2!18365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112786 (tuple2!18365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!52121 () Bool)

(declare-fun call!52126 () ListLongMap!16333)

(assert (=> bm!52121 (= call!52126 call!52123)))

(declare-fun b!1144873 () Bool)

(declare-datatypes ((Unit!37438 0))(
  ( (Unit!37439) )
))
(declare-fun e!651248 () Unit!37438)

(declare-fun Unit!37440 () Unit!37438)

(assert (=> b!1144873 (= e!651248 Unit!37440)))

(declare-fun bm!52122 () Bool)

(declare-fun call!52130 () Unit!37438)

(declare-fun addStillContains!817 (ListLongMap!16333 (_ BitVec 64) V!43457 (_ BitVec 64)) Unit!37438)

(assert (=> bm!52122 (= call!52130 (addStillContains!817 (ite c!112787 lt!510837 lt!510848) (ite c!112787 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112786 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112787 minValue!944 (ite c!112786 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1144874 () Bool)

(declare-fun e!651249 () Bool)

(assert (=> b!1144874 (= e!651249 tp_is_empty!28747)))

(declare-fun b!1144875 () Bool)

(declare-fun contains!6648 (ListLongMap!16333 (_ BitVec 64)) Bool)

(assert (=> b!1144875 (contains!6648 call!52123 k0!934)))

(declare-fun lt!510855 () Unit!37438)

(assert (=> b!1144875 (= lt!510855 call!52130)))

(declare-fun call!52125 () Bool)

(assert (=> b!1144875 call!52125))

(assert (=> b!1144875 (= lt!510837 (+!3603 lt!510848 (tuple2!18365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!510840 () Unit!37438)

(assert (=> b!1144875 (= lt!510840 (addStillContains!817 lt!510848 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!651245 () Unit!37438)

(assert (=> b!1144875 (= e!651245 lt!510855)))

(declare-fun b!1144876 () Bool)

(declare-fun res!762484 () Bool)

(declare-fun e!651253 () Bool)

(assert (=> b!1144876 (=> (not res!762484) (not e!651253))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1144876 (= res!762484 (validMask!0 mask!1564))))

(declare-fun b!1144877 () Bool)

(declare-fun res!762486 () Bool)

(assert (=> b!1144877 (=> (not res!762486) (not e!651253))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1144877 (= res!762486 (and (= (size!36322 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36323 _keys!1208) (size!36322 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!52123 () Bool)

(assert (=> bm!52123 (= call!52125 (contains!6648 (ite c!112787 lt!510837 call!52126) k0!934))))

(declare-fun b!1144878 () Bool)

(declare-fun e!651244 () Bool)

(assert (=> b!1144878 (= e!651253 e!651244)))

(declare-fun res!762485 () Bool)

(assert (=> b!1144878 (=> (not res!762485) (not e!651244))))

(declare-fun lt!510844 () array!74268)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74268 (_ BitVec 32)) Bool)

(assert (=> b!1144878 (= res!762485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510844 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144878 (= lt!510844 (array!74269 (store (arr!35785 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36323 _keys!1208)))))

(declare-fun b!1144879 () Bool)

(declare-fun res!762495 () Bool)

(assert (=> b!1144879 (=> (not res!762495) (not e!651253))))

(declare-datatypes ((List!25101 0))(
  ( (Nil!25098) (Cons!25097 (h!26306 (_ BitVec 64)) (t!36301 List!25101)) )
))
(declare-fun arrayNoDuplicates!0 (array!74268 (_ BitVec 32) List!25101) Bool)

(assert (=> b!1144879 (= res!762495 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25098))))

(declare-fun e!651240 () Bool)

(declare-fun b!1144880 () Bool)

(assert (=> b!1144880 (= e!651240 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52124 () Bool)

(declare-fun call!52127 () Unit!37438)

(assert (=> bm!52124 (= call!52127 call!52130)))

(declare-fun call!52128 () ListLongMap!16333)

(declare-fun bm!52125 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!510838 () array!74266)

(declare-fun getCurrentListMapNoExtraKeys!4668 (array!74268 array!74266 (_ BitVec 32) (_ BitVec 32) V!43457 V!43457 (_ BitVec 32) Int) ListLongMap!16333)

(assert (=> bm!52125 (= call!52128 (getCurrentListMapNoExtraKeys!4668 lt!510844 lt!510838 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!762489 () Bool)

(assert (=> start!98606 (=> (not res!762489) (not e!651253))))

(assert (=> start!98606 (= res!762489 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36323 _keys!1208))))))

(assert (=> start!98606 e!651253))

(assert (=> start!98606 tp_is_empty!28747))

(declare-fun array_inv!27498 (array!74268) Bool)

(assert (=> start!98606 (array_inv!27498 _keys!1208)))

(assert (=> start!98606 true))

(assert (=> start!98606 tp!85362))

(declare-fun array_inv!27499 (array!74266) Bool)

(assert (=> start!98606 (and (array_inv!27499 _values!996) e!651255)))

(declare-fun b!1144881 () Bool)

(declare-fun lt!510845 () Bool)

(assert (=> b!1144881 (= c!112786 (and (not lt!510845) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!651246 () Unit!37438)

(assert (=> b!1144881 (= e!651245 e!651246)))

(declare-fun b!1144882 () Bool)

(declare-fun res!762491 () Bool)

(assert (=> b!1144882 (=> (not res!762491) (not e!651253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1144882 (= res!762491 (validKeyInArray!0 k0!934))))

(declare-fun b!1144883 () Bool)

(declare-fun call!52124 () Bool)

(assert (=> b!1144883 call!52124))

(declare-fun lt!510839 () Unit!37438)

(assert (=> b!1144883 (= lt!510839 call!52127)))

(declare-fun e!651241 () Unit!37438)

(assert (=> b!1144883 (= e!651241 lt!510839)))

(declare-fun mapNonEmpty!44945 () Bool)

(declare-fun tp!85361 () Bool)

(assert (=> mapNonEmpty!44945 (= mapRes!44945 (and tp!85361 e!651249))))

(declare-fun mapKey!44945 () (_ BitVec 32))

(declare-fun mapValue!44945 () ValueCell!13664)

(declare-fun mapRest!44945 () (Array (_ BitVec 32) ValueCell!13664))

(assert (=> mapNonEmpty!44945 (= (arr!35784 _values!996) (store mapRest!44945 mapKey!44945 mapValue!44945))))

(declare-fun e!651251 () Bool)

(declare-fun call!52129 () ListLongMap!16333)

(declare-fun b!1144884 () Bool)

(declare-fun -!1258 (ListLongMap!16333 (_ BitVec 64)) ListLongMap!16333)

(assert (=> b!1144884 (= e!651251 (= call!52128 (-!1258 call!52129 k0!934)))))

(declare-fun b!1144885 () Bool)

(declare-fun Unit!37441 () Unit!37438)

(assert (=> b!1144885 (= e!651248 Unit!37441)))

(assert (=> b!1144885 (= lt!510845 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1144885 (= c!112787 (and (not lt!510845) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510842 () Unit!37438)

(assert (=> b!1144885 (= lt!510842 e!651245)))

(declare-fun lt!510836 () Unit!37438)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!412 (array!74268 array!74266 (_ BitVec 32) (_ BitVec 32) V!43457 V!43457 (_ BitVec 64) (_ BitVec 32) Int) Unit!37438)

(assert (=> b!1144885 (= lt!510836 (lemmaListMapContainsThenArrayContainsFrom!412 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112789 () Bool)

(assert (=> b!1144885 (= c!112789 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!762492 () Bool)

(assert (=> b!1144885 (= res!762492 e!651240)))

(assert (=> b!1144885 (=> (not res!762492) (not e!651254))))

(assert (=> b!1144885 e!651254))

(declare-fun lt!510835 () Unit!37438)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74268 (_ BitVec 32) (_ BitVec 32)) Unit!37438)

(assert (=> b!1144885 (= lt!510835 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1144885 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25098)))

(declare-fun lt!510841 () Unit!37438)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74268 (_ BitVec 64) (_ BitVec 32) List!25101) Unit!37438)

(assert (=> b!1144885 (= lt!510841 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25098))))

(assert (=> b!1144885 false))

(declare-fun b!1144886 () Bool)

(declare-fun res!762483 () Bool)

(assert (=> b!1144886 (=> (not res!762483) (not e!651253))))

(assert (=> b!1144886 (= res!762483 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36323 _keys!1208))))))

(declare-fun bm!52126 () Bool)

(assert (=> bm!52126 (= call!52129 (getCurrentListMapNoExtraKeys!4668 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!510843 () ListLongMap!16333)

(declare-fun e!651252 () Bool)

(declare-fun b!1144887 () Bool)

(assert (=> b!1144887 (= e!651252 (= (-!1258 lt!510843 k0!934) lt!510848))))

(declare-fun bm!52127 () Bool)

(assert (=> bm!52127 (= call!52124 call!52125)))

(declare-fun b!1144888 () Bool)

(declare-fun e!651250 () Bool)

(assert (=> b!1144888 (= e!651250 true)))

(assert (=> b!1144888 e!651252))

(declare-fun res!762490 () Bool)

(assert (=> b!1144888 (=> (not res!762490) (not e!651252))))

(declare-fun lt!510851 () V!43457)

(assert (=> b!1144888 (= res!762490 (= (-!1258 (+!3603 lt!510848 (tuple2!18365 (select (arr!35785 _keys!1208) from!1455) lt!510851)) (select (arr!35785 _keys!1208) from!1455)) lt!510848))))

(declare-fun lt!510852 () Unit!37438)

(declare-fun addThenRemoveForNewKeyIsSame!121 (ListLongMap!16333 (_ BitVec 64) V!43457) Unit!37438)

(assert (=> b!1144888 (= lt!510852 (addThenRemoveForNewKeyIsSame!121 lt!510848 (select (arr!35785 _keys!1208) from!1455) lt!510851))))

(declare-fun lt!510853 () V!43457)

(declare-fun get!18207 (ValueCell!13664 V!43457) V!43457)

(assert (=> b!1144888 (= lt!510851 (get!18207 (select (arr!35784 _values!996) from!1455) lt!510853))))

(declare-fun lt!510847 () Unit!37438)

(assert (=> b!1144888 (= lt!510847 e!651248)))

(declare-fun c!112788 () Bool)

(assert (=> b!1144888 (= c!112788 (contains!6648 lt!510848 k0!934))))

(assert (=> b!1144888 (= lt!510848 (getCurrentListMapNoExtraKeys!4668 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144889 () Bool)

(declare-fun res!762497 () Bool)

(assert (=> b!1144889 (=> (not res!762497) (not e!651253))))

(assert (=> b!1144889 (= res!762497 (= (select (arr!35785 _keys!1208) i!673) k0!934))))

(declare-fun b!1144890 () Bool)

(declare-fun Unit!37442 () Unit!37438)

(assert (=> b!1144890 (= e!651241 Unit!37442)))

(declare-fun mapIsEmpty!44945 () Bool)

(assert (=> mapIsEmpty!44945 mapRes!44945))

(declare-fun b!1144891 () Bool)

(declare-fun lt!510850 () Unit!37438)

(assert (=> b!1144891 (= e!651246 lt!510850)))

(assert (=> b!1144891 (= lt!510850 call!52127)))

(assert (=> b!1144891 call!52124))

(declare-fun b!1144892 () Bool)

(assert (=> b!1144892 (= e!651251 (= call!52128 call!52129))))

(declare-fun b!1144893 () Bool)

(assert (=> b!1144893 (= e!651246 e!651241)))

(declare-fun c!112785 () Bool)

(assert (=> b!1144893 (= c!112785 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!510845))))

(declare-fun b!1144894 () Bool)

(declare-fun res!762487 () Bool)

(assert (=> b!1144894 (=> (not res!762487) (not e!651253))))

(assert (=> b!1144894 (= res!762487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144895 () Bool)

(declare-fun e!651247 () Bool)

(assert (=> b!1144895 (= e!651244 (not e!651247))))

(declare-fun res!762493 () Bool)

(assert (=> b!1144895 (=> res!762493 e!651247)))

(assert (=> b!1144895 (= res!762493 (bvsgt from!1455 i!673))))

(assert (=> b!1144895 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!510854 () Unit!37438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74268 (_ BitVec 64) (_ BitVec 32)) Unit!37438)

(assert (=> b!1144895 (= lt!510854 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1144896 () Bool)

(declare-fun res!762488 () Bool)

(assert (=> b!1144896 (=> (not res!762488) (not e!651244))))

(assert (=> b!1144896 (= res!762488 (arrayNoDuplicates!0 lt!510844 #b00000000000000000000000000000000 Nil!25098))))

(declare-fun b!1144897 () Bool)

(declare-fun e!651243 () Bool)

(assert (=> b!1144897 (= e!651247 e!651243)))

(declare-fun res!762496 () Bool)

(assert (=> b!1144897 (=> res!762496 e!651243)))

(assert (=> b!1144897 (= res!762496 (not (= from!1455 i!673)))))

(declare-fun lt!510846 () ListLongMap!16333)

(assert (=> b!1144897 (= lt!510846 (getCurrentListMapNoExtraKeys!4668 lt!510844 lt!510838 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1144897 (= lt!510838 (array!74267 (store (arr!35784 _values!996) i!673 (ValueCellFull!13664 lt!510853)) (size!36322 _values!996)))))

(declare-fun dynLambda!2643 (Int (_ BitVec 64)) V!43457)

(assert (=> b!1144897 (= lt!510853 (dynLambda!2643 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1144897 (= lt!510843 (getCurrentListMapNoExtraKeys!4668 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144898 () Bool)

(assert (=> b!1144898 (= e!651243 e!651250)))

(declare-fun res!762494 () Bool)

(assert (=> b!1144898 (=> res!762494 e!651250)))

(assert (=> b!1144898 (= res!762494 (not (= (select (arr!35785 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1144898 e!651251))

(declare-fun c!112790 () Bool)

(assert (=> b!1144898 (= c!112790 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!510849 () Unit!37438)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!537 (array!74268 array!74266 (_ BitVec 32) (_ BitVec 32) V!43457 V!43457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37438)

(assert (=> b!1144898 (= lt!510849 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!537 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1144899 () Bool)

(assert (=> b!1144899 (= e!651240 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510845) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!98606 res!762489) b!1144876))

(assert (= (and b!1144876 res!762484) b!1144877))

(assert (= (and b!1144877 res!762486) b!1144894))

(assert (= (and b!1144894 res!762487) b!1144879))

(assert (= (and b!1144879 res!762495) b!1144886))

(assert (= (and b!1144886 res!762483) b!1144882))

(assert (= (and b!1144882 res!762491) b!1144889))

(assert (= (and b!1144889 res!762497) b!1144878))

(assert (= (and b!1144878 res!762485) b!1144896))

(assert (= (and b!1144896 res!762488) b!1144895))

(assert (= (and b!1144895 (not res!762493)) b!1144897))

(assert (= (and b!1144897 (not res!762496)) b!1144898))

(assert (= (and b!1144898 c!112790) b!1144884))

(assert (= (and b!1144898 (not c!112790)) b!1144892))

(assert (= (or b!1144884 b!1144892) bm!52125))

(assert (= (or b!1144884 b!1144892) bm!52126))

(assert (= (and b!1144898 (not res!762494)) b!1144888))

(assert (= (and b!1144888 c!112788) b!1144885))

(assert (= (and b!1144888 (not c!112788)) b!1144873))

(assert (= (and b!1144885 c!112787) b!1144875))

(assert (= (and b!1144885 (not c!112787)) b!1144881))

(assert (= (and b!1144881 c!112786) b!1144891))

(assert (= (and b!1144881 (not c!112786)) b!1144893))

(assert (= (and b!1144893 c!112785) b!1144883))

(assert (= (and b!1144893 (not c!112785)) b!1144890))

(assert (= (or b!1144891 b!1144883) bm!52124))

(assert (= (or b!1144891 b!1144883) bm!52121))

(assert (= (or b!1144891 b!1144883) bm!52127))

(assert (= (or b!1144875 bm!52127) bm!52123))

(assert (= (or b!1144875 bm!52124) bm!52122))

(assert (= (or b!1144875 bm!52121) bm!52120))

(assert (= (and b!1144885 c!112789) b!1144880))

(assert (= (and b!1144885 (not c!112789)) b!1144899))

(assert (= (and b!1144885 res!762492) b!1144872))

(assert (= (and b!1144888 res!762490) b!1144887))

(assert (= (and b!1144871 condMapEmpty!44945) mapIsEmpty!44945))

(assert (= (and b!1144871 (not condMapEmpty!44945)) mapNonEmpty!44945))

(get-info :version)

(assert (= (and mapNonEmpty!44945 ((_ is ValueCellFull!13664) mapValue!44945)) b!1144874))

(assert (= (and b!1144871 ((_ is ValueCellFull!13664) mapDefault!44945)) b!1144870))

(assert (= start!98606 b!1144871))

(declare-fun b_lambda!19305 () Bool)

(assert (=> (not b_lambda!19305) (not b!1144897)))

(declare-fun t!36299 () Bool)

(declare-fun tb!9021 () Bool)

(assert (=> (and start!98606 (= defaultEntry!1004 defaultEntry!1004) t!36299) tb!9021))

(declare-fun result!18615 () Bool)

(assert (=> tb!9021 (= result!18615 tp_is_empty!28747)))

(assert (=> b!1144897 t!36299))

(declare-fun b_and!39263 () Bool)

(assert (= b_and!39261 (and (=> t!36299 result!18615) b_and!39263)))

(declare-fun m!1055339 () Bool)

(assert (=> bm!52126 m!1055339))

(declare-fun m!1055341 () Bool)

(assert (=> start!98606 m!1055341))

(declare-fun m!1055343 () Bool)

(assert (=> start!98606 m!1055343))

(declare-fun m!1055345 () Bool)

(assert (=> b!1144897 m!1055345))

(declare-fun m!1055347 () Bool)

(assert (=> b!1144897 m!1055347))

(declare-fun m!1055349 () Bool)

(assert (=> b!1144897 m!1055349))

(declare-fun m!1055351 () Bool)

(assert (=> b!1144897 m!1055351))

(declare-fun m!1055353 () Bool)

(assert (=> mapNonEmpty!44945 m!1055353))

(declare-fun m!1055355 () Bool)

(assert (=> b!1144895 m!1055355))

(declare-fun m!1055357 () Bool)

(assert (=> b!1144895 m!1055357))

(assert (=> b!1144888 m!1055339))

(declare-fun m!1055359 () Bool)

(assert (=> b!1144888 m!1055359))

(assert (=> b!1144888 m!1055359))

(declare-fun m!1055361 () Bool)

(assert (=> b!1144888 m!1055361))

(declare-fun m!1055363 () Bool)

(assert (=> b!1144888 m!1055363))

(declare-fun m!1055365 () Bool)

(assert (=> b!1144888 m!1055365))

(declare-fun m!1055367 () Bool)

(assert (=> b!1144888 m!1055367))

(assert (=> b!1144888 m!1055363))

(declare-fun m!1055369 () Bool)

(assert (=> b!1144888 m!1055369))

(assert (=> b!1144888 m!1055367))

(declare-fun m!1055371 () Bool)

(assert (=> b!1144888 m!1055371))

(assert (=> b!1144888 m!1055363))

(assert (=> b!1144898 m!1055363))

(declare-fun m!1055373 () Bool)

(assert (=> b!1144898 m!1055373))

(declare-fun m!1055375 () Bool)

(assert (=> b!1144896 m!1055375))

(declare-fun m!1055377 () Bool)

(assert (=> b!1144885 m!1055377))

(declare-fun m!1055379 () Bool)

(assert (=> b!1144885 m!1055379))

(declare-fun m!1055381 () Bool)

(assert (=> b!1144885 m!1055381))

(declare-fun m!1055383 () Bool)

(assert (=> b!1144885 m!1055383))

(declare-fun m!1055385 () Bool)

(assert (=> b!1144882 m!1055385))

(declare-fun m!1055387 () Bool)

(assert (=> bm!52122 m!1055387))

(declare-fun m!1055389 () Bool)

(assert (=> b!1144878 m!1055389))

(declare-fun m!1055391 () Bool)

(assert (=> b!1144878 m!1055391))

(declare-fun m!1055393 () Bool)

(assert (=> b!1144884 m!1055393))

(declare-fun m!1055395 () Bool)

(assert (=> bm!52123 m!1055395))

(declare-fun m!1055397 () Bool)

(assert (=> b!1144879 m!1055397))

(declare-fun m!1055399 () Bool)

(assert (=> bm!52125 m!1055399))

(declare-fun m!1055401 () Bool)

(assert (=> b!1144876 m!1055401))

(declare-fun m!1055403 () Bool)

(assert (=> b!1144894 m!1055403))

(declare-fun m!1055405 () Bool)

(assert (=> bm!52120 m!1055405))

(declare-fun m!1055407 () Bool)

(assert (=> b!1144872 m!1055407))

(declare-fun m!1055409 () Bool)

(assert (=> b!1144887 m!1055409))

(declare-fun m!1055411 () Bool)

(assert (=> b!1144889 m!1055411))

(assert (=> b!1144880 m!1055407))

(declare-fun m!1055413 () Bool)

(assert (=> b!1144875 m!1055413))

(declare-fun m!1055415 () Bool)

(assert (=> b!1144875 m!1055415))

(declare-fun m!1055417 () Bool)

(assert (=> b!1144875 m!1055417))

(check-sat (not b!1144888) (not bm!52125) (not b!1144887) (not b!1144876) (not b!1144896) (not bm!52122) (not b!1144879) (not b!1144895) (not b!1144880) (not b!1144894) (not b!1144898) (not b!1144872) (not b_next!24217) (not b!1144875) (not b!1144878) b_and!39263 (not b!1144885) (not b!1144884) (not bm!52120) tp_is_empty!28747 (not b_lambda!19305) (not b!1144897) (not start!98606) (not bm!52123) (not bm!52126) (not mapNonEmpty!44945) (not b!1144882))
(check-sat b_and!39263 (not b_next!24217))
