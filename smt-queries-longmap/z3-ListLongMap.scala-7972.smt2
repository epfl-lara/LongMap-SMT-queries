; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98674 () Bool)

(assert start!98674)

(declare-fun b_free!24279 () Bool)

(declare-fun b_next!24279 () Bool)

(assert (=> start!98674 (= b_free!24279 (not b_next!24279))))

(declare-fun tp!85548 () Bool)

(declare-fun b_and!39407 () Bool)

(assert (=> start!98674 (= tp!85548 b_and!39407)))

(declare-fun b!1147846 () Bool)

(declare-fun res!763956 () Bool)

(declare-fun e!652911 () Bool)

(assert (=> b!1147846 (=> (not res!763956) (not e!652911))))

(declare-datatypes ((array!74465 0))(
  ( (array!74466 (arr!35883 (Array (_ BitVec 32) (_ BitVec 64))) (size!36419 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74465)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74465 (_ BitVec 32)) Bool)

(assert (=> b!1147846 (= res!763956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!52887 () Bool)

(declare-fun call!52897 () Bool)

(declare-fun call!52895 () Bool)

(assert (=> bm!52887 (= call!52897 call!52895)))

(declare-fun b!1147847 () Bool)

(declare-fun res!763958 () Bool)

(assert (=> b!1147847 (=> (not res!763958) (not e!652911))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147847 (= res!763958 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36419 _keys!1208))))))

(declare-fun b!1147848 () Bool)

(declare-fun res!763954 () Bool)

(assert (=> b!1147848 (=> (not res!763954) (not e!652911))))

(declare-datatypes ((List!25085 0))(
  ( (Nil!25082) (Cons!25081 (h!26290 (_ BitVec 64)) (t!36356 List!25085)) )
))
(declare-fun arrayNoDuplicates!0 (array!74465 (_ BitVec 32) List!25085) Bool)

(assert (=> b!1147848 (= res!763954 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25082))))

(declare-fun b!1147850 () Bool)

(declare-fun e!652900 () Bool)

(assert (=> b!1147850 (= e!652900 true)))

(declare-fun e!652908 () Bool)

(assert (=> b!1147850 e!652908))

(declare-fun res!763951 () Bool)

(assert (=> b!1147850 (=> (not res!763951) (not e!652908))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43539 0))(
  ( (V!43540 (val!14461 Int)) )
))
(declare-datatypes ((tuple2!18334 0))(
  ( (tuple2!18335 (_1!9178 (_ BitVec 64)) (_2!9178 V!43539)) )
))
(declare-datatypes ((List!25086 0))(
  ( (Nil!25083) (Cons!25082 (h!26291 tuple2!18334) (t!36357 List!25086)) )
))
(declare-datatypes ((ListLongMap!16303 0))(
  ( (ListLongMap!16304 (toList!8167 List!25086)) )
))
(declare-fun lt!512988 () ListLongMap!16303)

(declare-fun lt!512984 () V!43539)

(declare-fun -!1303 (ListLongMap!16303 (_ BitVec 64)) ListLongMap!16303)

(declare-fun +!3590 (ListLongMap!16303 tuple2!18334) ListLongMap!16303)

(assert (=> b!1147850 (= res!763951 (= (-!1303 (+!3590 lt!512988 (tuple2!18335 (select (arr!35883 _keys!1208) from!1455) lt!512984)) (select (arr!35883 _keys!1208) from!1455)) lt!512988))))

(declare-datatypes ((Unit!37709 0))(
  ( (Unit!37710) )
))
(declare-fun lt!512987 () Unit!37709)

(declare-fun addThenRemoveForNewKeyIsSame!150 (ListLongMap!16303 (_ BitVec 64) V!43539) Unit!37709)

(assert (=> b!1147850 (= lt!512987 (addThenRemoveForNewKeyIsSame!150 lt!512988 (select (arr!35883 _keys!1208) from!1455) lt!512984))))

(declare-fun lt!512991 () V!43539)

(declare-datatypes ((ValueCell!13695 0))(
  ( (ValueCellFull!13695 (v!17098 V!43539)) (EmptyCell!13695) )
))
(declare-datatypes ((array!74467 0))(
  ( (array!74468 (arr!35884 (Array (_ BitVec 32) ValueCell!13695)) (size!36420 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74467)

(declare-fun get!18256 (ValueCell!13695 V!43539) V!43539)

(assert (=> b!1147850 (= lt!512984 (get!18256 (select (arr!35884 _values!996) from!1455) lt!512991))))

(declare-fun lt!512996 () Unit!37709)

(declare-fun e!652902 () Unit!37709)

(assert (=> b!1147850 (= lt!512996 e!652902)))

(declare-fun c!113372 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6690 (ListLongMap!16303 (_ BitVec 64)) Bool)

(assert (=> b!1147850 (= c!113372 (contains!6690 lt!512988 k0!934))))

(declare-fun zeroValue!944 () V!43539)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43539)

(declare-fun getCurrentListMapNoExtraKeys!4641 (array!74465 array!74467 (_ BitVec 32) (_ BitVec 32) V!43539 V!43539 (_ BitVec 32) Int) ListLongMap!16303)

(assert (=> b!1147850 (= lt!512988 (getCurrentListMapNoExtraKeys!4641 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147851 () Bool)

(declare-fun e!652907 () Unit!37709)

(declare-fun lt!512982 () Unit!37709)

(assert (=> b!1147851 (= e!652907 lt!512982)))

(declare-fun call!52891 () Unit!37709)

(assert (=> b!1147851 (= lt!512982 call!52891)))

(assert (=> b!1147851 call!52897))

(declare-fun b!1147852 () Bool)

(declare-fun e!652912 () Bool)

(assert (=> b!1147852 (= e!652911 e!652912)))

(declare-fun res!763947 () Bool)

(assert (=> b!1147852 (=> (not res!763947) (not e!652912))))

(declare-fun lt!512983 () array!74465)

(assert (=> b!1147852 (= res!763947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512983 mask!1564))))

(assert (=> b!1147852 (= lt!512983 (array!74466 (store (arr!35883 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36419 _keys!1208)))))

(declare-fun b!1147853 () Bool)

(declare-fun res!763953 () Bool)

(assert (=> b!1147853 (=> (not res!763953) (not e!652912))))

(assert (=> b!1147853 (= res!763953 (arrayNoDuplicates!0 lt!512983 #b00000000000000000000000000000000 Nil!25082))))

(declare-fun b!1147854 () Bool)

(declare-fun e!652903 () Bool)

(assert (=> b!1147854 (= e!652903 e!652900)))

(declare-fun res!763957 () Bool)

(assert (=> b!1147854 (=> res!763957 e!652900)))

(assert (=> b!1147854 (= res!763957 (not (= (select (arr!35883 _keys!1208) from!1455) k0!934)))))

(declare-fun e!652910 () Bool)

(assert (=> b!1147854 e!652910))

(declare-fun c!113373 () Bool)

(assert (=> b!1147854 (= c!113373 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512986 () Unit!37709)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!540 (array!74465 array!74467 (_ BitVec 32) (_ BitVec 32) V!43539 V!43539 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37709)

(assert (=> b!1147854 (= lt!512986 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!540 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147855 () Bool)

(declare-fun e!652913 () Bool)

(assert (=> b!1147855 (= e!652913 e!652903)))

(declare-fun res!763955 () Bool)

(assert (=> b!1147855 (=> res!763955 e!652903)))

(assert (=> b!1147855 (= res!763955 (not (= from!1455 i!673)))))

(declare-fun lt!512989 () array!74467)

(declare-fun lt!512981 () ListLongMap!16303)

(assert (=> b!1147855 (= lt!512981 (getCurrentListMapNoExtraKeys!4641 lt!512983 lt!512989 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147855 (= lt!512989 (array!74468 (store (arr!35884 _values!996) i!673 (ValueCellFull!13695 lt!512991)) (size!36420 _values!996)))))

(declare-fun dynLambda!2671 (Int (_ BitVec 64)) V!43539)

(assert (=> b!1147855 (= lt!512991 (dynLambda!2671 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512994 () ListLongMap!16303)

(assert (=> b!1147855 (= lt!512994 (getCurrentListMapNoExtraKeys!4641 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147856 () Bool)

(assert (=> b!1147856 (= e!652908 (= (-!1303 lt!512994 k0!934) lt!512988))))

(declare-fun c!113374 () Bool)

(declare-fun bm!52888 () Bool)

(declare-fun c!113369 () Bool)

(declare-fun lt!512980 () ListLongMap!16303)

(declare-fun call!52892 () ListLongMap!16303)

(assert (=> bm!52888 (= call!52892 (+!3590 (ite c!113369 lt!512980 lt!512988) (ite c!113369 (tuple2!18335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113374 (tuple2!18335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18335 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1147857 () Bool)

(declare-fun lt!512990 () Bool)

(declare-fun e!652901 () Bool)

(assert (=> b!1147857 (= e!652901 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512990) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1147858 () Bool)

(declare-fun e!652899 () Bool)

(declare-fun tp_is_empty!28809 () Bool)

(assert (=> b!1147858 (= e!652899 tp_is_empty!28809)))

(declare-fun bm!52889 () Bool)

(declare-fun call!52890 () ListLongMap!16303)

(assert (=> bm!52889 (= call!52895 (contains!6690 (ite c!113369 lt!512980 call!52890) k0!934))))

(declare-fun bm!52890 () Bool)

(assert (=> bm!52890 (= call!52890 call!52892)))

(declare-fun b!1147859 () Bool)

(declare-fun call!52893 () ListLongMap!16303)

(declare-fun call!52894 () ListLongMap!16303)

(assert (=> b!1147859 (= e!652910 (= call!52893 call!52894))))

(declare-fun b!1147860 () Bool)

(declare-fun res!763949 () Bool)

(assert (=> b!1147860 (=> (not res!763949) (not e!652911))))

(assert (=> b!1147860 (= res!763949 (and (= (size!36420 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36419 _keys!1208) (size!36420 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147861 () Bool)

(declare-fun res!763952 () Bool)

(assert (=> b!1147861 (=> (not res!763952) (not e!652911))))

(assert (=> b!1147861 (= res!763952 (= (select (arr!35883 _keys!1208) i!673) k0!934))))

(declare-fun b!1147849 () Bool)

(assert (=> b!1147849 call!52897))

(declare-fun lt!512985 () Unit!37709)

(assert (=> b!1147849 (= lt!512985 call!52891)))

(declare-fun e!652904 () Unit!37709)

(assert (=> b!1147849 (= e!652904 lt!512985)))

(declare-fun res!763948 () Bool)

(assert (=> start!98674 (=> (not res!763948) (not e!652911))))

(assert (=> start!98674 (= res!763948 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36419 _keys!1208))))))

(assert (=> start!98674 e!652911))

(assert (=> start!98674 tp_is_empty!28809))

(declare-fun array_inv!27484 (array!74465) Bool)

(assert (=> start!98674 (array_inv!27484 _keys!1208)))

(assert (=> start!98674 true))

(assert (=> start!98674 tp!85548))

(declare-fun e!652909 () Bool)

(declare-fun array_inv!27485 (array!74467) Bool)

(assert (=> start!98674 (and (array_inv!27485 _values!996) e!652909)))

(declare-fun b!1147862 () Bool)

(declare-fun res!763946 () Bool)

(assert (=> b!1147862 (=> (not res!763946) (not e!652911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147862 (= res!763946 (validMask!0 mask!1564))))

(declare-fun b!1147863 () Bool)

(declare-fun mapRes!45038 () Bool)

(assert (=> b!1147863 (= e!652909 (and e!652899 mapRes!45038))))

(declare-fun condMapEmpty!45038 () Bool)

(declare-fun mapDefault!45038 () ValueCell!13695)

(assert (=> b!1147863 (= condMapEmpty!45038 (= (arr!35884 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13695)) mapDefault!45038)))))

(declare-fun mapNonEmpty!45038 () Bool)

(declare-fun tp!85547 () Bool)

(declare-fun e!652905 () Bool)

(assert (=> mapNonEmpty!45038 (= mapRes!45038 (and tp!85547 e!652905))))

(declare-fun mapRest!45038 () (Array (_ BitVec 32) ValueCell!13695))

(declare-fun mapKey!45038 () (_ BitVec 32))

(declare-fun mapValue!45038 () ValueCell!13695)

(assert (=> mapNonEmpty!45038 (= (arr!35884 _values!996) (store mapRest!45038 mapKey!45038 mapValue!45038))))

(declare-fun bm!52891 () Bool)

(declare-fun call!52896 () Unit!37709)

(assert (=> bm!52891 (= call!52891 call!52896)))

(declare-fun b!1147864 () Bool)

(declare-fun res!763944 () Bool)

(assert (=> b!1147864 (=> (not res!763944) (not e!652911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147864 (= res!763944 (validKeyInArray!0 k0!934))))

(declare-fun b!1147865 () Bool)

(assert (=> b!1147865 (contains!6690 call!52892 k0!934)))

(declare-fun lt!512993 () Unit!37709)

(assert (=> b!1147865 (= lt!512993 call!52896)))

(assert (=> b!1147865 call!52895))

(assert (=> b!1147865 (= lt!512980 (+!3590 lt!512988 (tuple2!18335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!512999 () Unit!37709)

(declare-fun addStillContains!841 (ListLongMap!16303 (_ BitVec 64) V!43539 (_ BitVec 64)) Unit!37709)

(assert (=> b!1147865 (= lt!512999 (addStillContains!841 lt!512988 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!652906 () Unit!37709)

(assert (=> b!1147865 (= e!652906 lt!512993)))

(declare-fun b!1147866 () Bool)

(declare-fun Unit!37711 () Unit!37709)

(assert (=> b!1147866 (= e!652902 Unit!37711)))

(declare-fun b!1147867 () Bool)

(declare-fun Unit!37712 () Unit!37709)

(assert (=> b!1147867 (= e!652902 Unit!37712)))

(assert (=> b!1147867 (= lt!512990 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147867 (= c!113369 (and (not lt!512990) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512997 () Unit!37709)

(assert (=> b!1147867 (= lt!512997 e!652906)))

(declare-fun lt!512995 () Unit!37709)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!435 (array!74465 array!74467 (_ BitVec 32) (_ BitVec 32) V!43539 V!43539 (_ BitVec 64) (_ BitVec 32) Int) Unit!37709)

(assert (=> b!1147867 (= lt!512995 (lemmaListMapContainsThenArrayContainsFrom!435 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113371 () Bool)

(assert (=> b!1147867 (= c!113371 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763950 () Bool)

(assert (=> b!1147867 (= res!763950 e!652901)))

(declare-fun e!652914 () Bool)

(assert (=> b!1147867 (=> (not res!763950) (not e!652914))))

(assert (=> b!1147867 e!652914))

(declare-fun lt!513000 () Unit!37709)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74465 (_ BitVec 32) (_ BitVec 32)) Unit!37709)

(assert (=> b!1147867 (= lt!513000 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147867 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25082)))

(declare-fun lt!512992 () Unit!37709)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74465 (_ BitVec 64) (_ BitVec 32) List!25085) Unit!37709)

(assert (=> b!1147867 (= lt!512992 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25082))))

(assert (=> b!1147867 false))

(declare-fun bm!52892 () Bool)

(assert (=> bm!52892 (= call!52894 (getCurrentListMapNoExtraKeys!4641 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45038 () Bool)

(assert (=> mapIsEmpty!45038 mapRes!45038))

(declare-fun b!1147868 () Bool)

(declare-fun arrayContainsKey!0 (array!74465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147868 (= e!652901 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52893 () Bool)

(assert (=> bm!52893 (= call!52896 (addStillContains!841 (ite c!113369 lt!512980 lt!512988) (ite c!113369 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113374 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113369 minValue!944 (ite c!113374 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1147869 () Bool)

(assert (=> b!1147869 (= e!652907 e!652904)))

(declare-fun c!113370 () Bool)

(assert (=> b!1147869 (= c!113370 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512990))))

(declare-fun b!1147870 () Bool)

(assert (=> b!1147870 (= e!652914 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147871 () Bool)

(assert (=> b!1147871 (= c!113374 (and (not lt!512990) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147871 (= e!652906 e!652907)))

(declare-fun b!1147872 () Bool)

(assert (=> b!1147872 (= e!652910 (= call!52893 (-!1303 call!52894 k0!934)))))

(declare-fun b!1147873 () Bool)

(assert (=> b!1147873 (= e!652912 (not e!652913))))

(declare-fun res!763945 () Bool)

(assert (=> b!1147873 (=> res!763945 e!652913)))

(assert (=> b!1147873 (= res!763945 (bvsgt from!1455 i!673))))

(assert (=> b!1147873 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512998 () Unit!37709)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74465 (_ BitVec 64) (_ BitVec 32)) Unit!37709)

(assert (=> b!1147873 (= lt!512998 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1147874 () Bool)

(assert (=> b!1147874 (= e!652905 tp_is_empty!28809)))

(declare-fun b!1147875 () Bool)

(declare-fun Unit!37713 () Unit!37709)

(assert (=> b!1147875 (= e!652904 Unit!37713)))

(declare-fun bm!52894 () Bool)

(assert (=> bm!52894 (= call!52893 (getCurrentListMapNoExtraKeys!4641 lt!512983 lt!512989 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98674 res!763948) b!1147862))

(assert (= (and b!1147862 res!763946) b!1147860))

(assert (= (and b!1147860 res!763949) b!1147846))

(assert (= (and b!1147846 res!763956) b!1147848))

(assert (= (and b!1147848 res!763954) b!1147847))

(assert (= (and b!1147847 res!763958) b!1147864))

(assert (= (and b!1147864 res!763944) b!1147861))

(assert (= (and b!1147861 res!763952) b!1147852))

(assert (= (and b!1147852 res!763947) b!1147853))

(assert (= (and b!1147853 res!763953) b!1147873))

(assert (= (and b!1147873 (not res!763945)) b!1147855))

(assert (= (and b!1147855 (not res!763955)) b!1147854))

(assert (= (and b!1147854 c!113373) b!1147872))

(assert (= (and b!1147854 (not c!113373)) b!1147859))

(assert (= (or b!1147872 b!1147859) bm!52892))

(assert (= (or b!1147872 b!1147859) bm!52894))

(assert (= (and b!1147854 (not res!763957)) b!1147850))

(assert (= (and b!1147850 c!113372) b!1147867))

(assert (= (and b!1147850 (not c!113372)) b!1147866))

(assert (= (and b!1147867 c!113369) b!1147865))

(assert (= (and b!1147867 (not c!113369)) b!1147871))

(assert (= (and b!1147871 c!113374) b!1147851))

(assert (= (and b!1147871 (not c!113374)) b!1147869))

(assert (= (and b!1147869 c!113370) b!1147849))

(assert (= (and b!1147869 (not c!113370)) b!1147875))

(assert (= (or b!1147851 b!1147849) bm!52891))

(assert (= (or b!1147851 b!1147849) bm!52890))

(assert (= (or b!1147851 b!1147849) bm!52887))

(assert (= (or b!1147865 bm!52887) bm!52889))

(assert (= (or b!1147865 bm!52891) bm!52893))

(assert (= (or b!1147865 bm!52890) bm!52888))

(assert (= (and b!1147867 c!113371) b!1147868))

(assert (= (and b!1147867 (not c!113371)) b!1147857))

(assert (= (and b!1147867 res!763950) b!1147870))

(assert (= (and b!1147850 res!763951) b!1147856))

(assert (= (and b!1147863 condMapEmpty!45038) mapIsEmpty!45038))

(assert (= (and b!1147863 (not condMapEmpty!45038)) mapNonEmpty!45038))

(get-info :version)

(assert (= (and mapNonEmpty!45038 ((_ is ValueCellFull!13695) mapValue!45038)) b!1147874))

(assert (= (and b!1147863 ((_ is ValueCellFull!13695) mapDefault!45038)) b!1147858))

(assert (= start!98674 b!1147863))

(declare-fun b_lambda!19385 () Bool)

(assert (=> (not b_lambda!19385) (not b!1147855)))

(declare-fun t!36355 () Bool)

(declare-fun tb!9091 () Bool)

(assert (=> (and start!98674 (= defaultEntry!1004 defaultEntry!1004) t!36355) tb!9091))

(declare-fun result!18747 () Bool)

(assert (=> tb!9091 (= result!18747 tp_is_empty!28809)))

(assert (=> b!1147855 t!36355))

(declare-fun b_and!39409 () Bool)

(assert (= b_and!39407 (and (=> t!36355 result!18747) b_and!39409)))

(declare-fun m!1058421 () Bool)

(assert (=> b!1147872 m!1058421))

(declare-fun m!1058423 () Bool)

(assert (=> bm!52889 m!1058423))

(declare-fun m!1058425 () Bool)

(assert (=> bm!52894 m!1058425))

(declare-fun m!1058427 () Bool)

(assert (=> b!1147861 m!1058427))

(declare-fun m!1058429 () Bool)

(assert (=> bm!52893 m!1058429))

(declare-fun m!1058431 () Bool)

(assert (=> b!1147853 m!1058431))

(declare-fun m!1058433 () Bool)

(assert (=> b!1147862 m!1058433))

(declare-fun m!1058435 () Bool)

(assert (=> b!1147855 m!1058435))

(declare-fun m!1058437 () Bool)

(assert (=> b!1147855 m!1058437))

(declare-fun m!1058439 () Bool)

(assert (=> b!1147855 m!1058439))

(declare-fun m!1058441 () Bool)

(assert (=> b!1147855 m!1058441))

(declare-fun m!1058443 () Bool)

(assert (=> b!1147856 m!1058443))

(declare-fun m!1058445 () Bool)

(assert (=> b!1147864 m!1058445))

(declare-fun m!1058447 () Bool)

(assert (=> start!98674 m!1058447))

(declare-fun m!1058449 () Bool)

(assert (=> start!98674 m!1058449))

(declare-fun m!1058451 () Bool)

(assert (=> b!1147870 m!1058451))

(declare-fun m!1058453 () Bool)

(assert (=> b!1147850 m!1058453))

(declare-fun m!1058455 () Bool)

(assert (=> b!1147850 m!1058455))

(declare-fun m!1058457 () Bool)

(assert (=> b!1147850 m!1058457))

(assert (=> b!1147850 m!1058455))

(declare-fun m!1058459 () Bool)

(assert (=> b!1147850 m!1058459))

(declare-fun m!1058461 () Bool)

(assert (=> b!1147850 m!1058461))

(declare-fun m!1058463 () Bool)

(assert (=> b!1147850 m!1058463))

(declare-fun m!1058465 () Bool)

(assert (=> b!1147850 m!1058465))

(assert (=> b!1147850 m!1058461))

(assert (=> b!1147850 m!1058463))

(declare-fun m!1058467 () Bool)

(assert (=> b!1147850 m!1058467))

(assert (=> b!1147850 m!1058463))

(declare-fun m!1058469 () Bool)

(assert (=> b!1147852 m!1058469))

(declare-fun m!1058471 () Bool)

(assert (=> b!1147852 m!1058471))

(declare-fun m!1058473 () Bool)

(assert (=> b!1147865 m!1058473))

(declare-fun m!1058475 () Bool)

(assert (=> b!1147865 m!1058475))

(declare-fun m!1058477 () Bool)

(assert (=> b!1147865 m!1058477))

(assert (=> bm!52892 m!1058453))

(assert (=> b!1147868 m!1058451))

(declare-fun m!1058479 () Bool)

(assert (=> b!1147846 m!1058479))

(declare-fun m!1058481 () Bool)

(assert (=> mapNonEmpty!45038 m!1058481))

(declare-fun m!1058483 () Bool)

(assert (=> b!1147873 m!1058483))

(declare-fun m!1058485 () Bool)

(assert (=> b!1147873 m!1058485))

(declare-fun m!1058487 () Bool)

(assert (=> b!1147867 m!1058487))

(declare-fun m!1058489 () Bool)

(assert (=> b!1147867 m!1058489))

(declare-fun m!1058491 () Bool)

(assert (=> b!1147867 m!1058491))

(declare-fun m!1058493 () Bool)

(assert (=> b!1147867 m!1058493))

(declare-fun m!1058495 () Bool)

(assert (=> b!1147848 m!1058495))

(assert (=> b!1147854 m!1058463))

(declare-fun m!1058497 () Bool)

(assert (=> b!1147854 m!1058497))

(declare-fun m!1058499 () Bool)

(assert (=> bm!52888 m!1058499))

(check-sat (not b!1147848) (not b!1147856) (not bm!52889) (not b!1147864) (not b!1147855) (not b!1147850) (not bm!52892) (not b!1147868) (not bm!52888) (not mapNonEmpty!45038) tp_is_empty!28809 (not b!1147870) (not b!1147865) (not b!1147846) (not b!1147862) (not bm!52893) (not b!1147873) (not b!1147852) (not b_next!24279) (not b!1147867) (not bm!52894) (not b!1147854) (not b!1147872) (not b_lambda!19385) (not b!1147853) b_and!39409 (not start!98674))
(check-sat b_and!39409 (not b_next!24279))
