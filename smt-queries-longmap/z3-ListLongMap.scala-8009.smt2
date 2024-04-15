; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98888 () Bool)

(assert start!98888)

(declare-fun b_free!24499 () Bool)

(declare-fun b_next!24499 () Bool)

(assert (=> start!98888 (= b_free!24499 (not b_next!24499))))

(declare-fun tp!86207 () Bool)

(declare-fun b_and!39825 () Bool)

(assert (=> start!98888 (= tp!86207 b_and!39825)))

(declare-datatypes ((V!43833 0))(
  ( (V!43834 (val!14571 Int)) )
))
(declare-datatypes ((tuple2!18626 0))(
  ( (tuple2!18627 (_1!9324 (_ BitVec 64)) (_2!9324 V!43833)) )
))
(declare-datatypes ((List!25351 0))(
  ( (Nil!25348) (Cons!25347 (h!26556 tuple2!18626) (t!36833 List!25351)) )
))
(declare-datatypes ((ListLongMap!16595 0))(
  ( (ListLongMap!16596 (toList!8313 List!25351)) )
))
(declare-fun lt!520013 () ListLongMap!16595)

(declare-fun call!55513 () ListLongMap!16595)

(declare-fun c!115326 () Bool)

(declare-fun minValue!944 () V!43833)

(declare-fun zeroValue!944 () V!43833)

(declare-fun c!115325 () Bool)

(declare-fun lt!520020 () ListLongMap!16595)

(declare-fun bm!55504 () Bool)

(declare-fun +!3722 (ListLongMap!16595 tuple2!18626) ListLongMap!16595)

(assert (=> bm!55504 (= call!55513 (+!3722 (ite c!115325 lt!520013 lt!520020) (ite c!115325 (tuple2!18627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115326 (tuple2!18627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1157842 () Bool)

(declare-datatypes ((Unit!37997 0))(
  ( (Unit!37998) )
))
(declare-fun e!658443 () Unit!37997)

(declare-fun Unit!37999 () Unit!37997)

(assert (=> b!1157842 (= e!658443 Unit!37999)))

(declare-fun b!1157843 () Bool)

(declare-fun e!658440 () Bool)

(declare-fun call!55512 () ListLongMap!16595)

(declare-fun call!55510 () ListLongMap!16595)

(assert (=> b!1157843 (= e!658440 (= call!55512 call!55510))))

(declare-fun bm!55505 () Bool)

(declare-fun call!55507 () Bool)

(declare-fun call!55511 () Bool)

(assert (=> bm!55505 (= call!55507 call!55511)))

(declare-fun call!55508 () ListLongMap!16595)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun bm!55506 () Bool)

(declare-fun contains!6765 (ListLongMap!16595 (_ BitVec 64)) Bool)

(assert (=> bm!55506 (= call!55511 (contains!6765 (ite c!115325 lt!520013 call!55508) k0!934))))

(declare-fun b!1157844 () Bool)

(declare-fun e!658446 () Bool)

(declare-fun e!658430 () Bool)

(assert (=> b!1157844 (= e!658446 e!658430)))

(declare-fun res!768835 () Bool)

(assert (=> b!1157844 (=> (not res!768835) (not e!658430))))

(declare-datatypes ((array!74820 0))(
  ( (array!74821 (arr!36061 (Array (_ BitVec 32) (_ BitVec 64))) (size!36599 (_ BitVec 32))) )
))
(declare-fun lt!520015 () array!74820)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74820 (_ BitVec 32)) Bool)

(assert (=> b!1157844 (= res!768835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520015 mask!1564))))

(declare-fun _keys!1208 () array!74820)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1157844 (= lt!520015 (array!74821 (store (arr!36061 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36599 _keys!1208)))))

(declare-fun bm!55507 () Bool)

(assert (=> bm!55507 (= call!55508 call!55513)))

(declare-fun b!1157845 () Bool)

(declare-fun e!658442 () Bool)

(declare-fun e!658431 () Bool)

(assert (=> b!1157845 (= e!658442 e!658431)))

(declare-fun res!768830 () Bool)

(assert (=> b!1157845 (=> res!768830 e!658431)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1157845 (= res!768830 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!520026 () ListLongMap!16595)

(declare-datatypes ((ValueCell!13805 0))(
  ( (ValueCellFull!13805 (v!17207 V!43833)) (EmptyCell!13805) )
))
(declare-datatypes ((array!74822 0))(
  ( (array!74823 (arr!36062 (Array (_ BitVec 32) ValueCell!13805)) (size!36600 (_ BitVec 32))) )
))
(declare-fun lt!520021 () array!74822)

(declare-fun getCurrentListMapNoExtraKeys!4793 (array!74820 array!74822 (_ BitVec 32) (_ BitVec 32) V!43833 V!43833 (_ BitVec 32) Int) ListLongMap!16595)

(assert (=> b!1157845 (= lt!520026 (getCurrentListMapNoExtraKeys!4793 lt!520015 lt!520021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520009 () V!43833)

(declare-fun _values!996 () array!74822)

(assert (=> b!1157845 (= lt!520021 (array!74823 (store (arr!36062 _values!996) i!673 (ValueCellFull!13805 lt!520009)) (size!36600 _values!996)))))

(declare-fun dynLambda!2744 (Int (_ BitVec 64)) V!43833)

(assert (=> b!1157845 (= lt!520009 (dynLambda!2744 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520012 () ListLongMap!16595)

(assert (=> b!1157845 (= lt!520012 (getCurrentListMapNoExtraKeys!4793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157846 () Bool)

(declare-fun res!768842 () Bool)

(assert (=> b!1157846 (=> (not res!768842) (not e!658446))))

(assert (=> b!1157846 (= res!768842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157847 () Bool)

(declare-fun e!658437 () Bool)

(assert (=> b!1157847 (= e!658437 true)))

(declare-fun e!658444 () Bool)

(assert (=> b!1157847 e!658444))

(declare-fun res!768839 () Bool)

(assert (=> b!1157847 (=> (not res!768839) (not e!658444))))

(declare-fun lt!520011 () ListLongMap!16595)

(assert (=> b!1157847 (= res!768839 (= lt!520011 lt!520020))))

(declare-fun -!1369 (ListLongMap!16595 (_ BitVec 64)) ListLongMap!16595)

(assert (=> b!1157847 (= lt!520011 (-!1369 lt!520012 k0!934))))

(declare-fun lt!520025 () V!43833)

(assert (=> b!1157847 (= (-!1369 (+!3722 lt!520020 (tuple2!18627 (select (arr!36061 _keys!1208) from!1455) lt!520025)) (select (arr!36061 _keys!1208) from!1455)) lt!520020)))

(declare-fun lt!520028 () Unit!37997)

(declare-fun addThenRemoveForNewKeyIsSame!221 (ListLongMap!16595 (_ BitVec 64) V!43833) Unit!37997)

(assert (=> b!1157847 (= lt!520028 (addThenRemoveForNewKeyIsSame!221 lt!520020 (select (arr!36061 _keys!1208) from!1455) lt!520025))))

(declare-fun get!18401 (ValueCell!13805 V!43833) V!43833)

(assert (=> b!1157847 (= lt!520025 (get!18401 (select (arr!36062 _values!996) from!1455) lt!520009))))

(declare-fun lt!520016 () Unit!37997)

(assert (=> b!1157847 (= lt!520016 e!658443)))

(declare-fun c!115327 () Bool)

(assert (=> b!1157847 (= c!115327 (contains!6765 lt!520020 k0!934))))

(assert (=> b!1157847 (= lt!520020 (getCurrentListMapNoExtraKeys!4793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157848 () Bool)

(assert (=> b!1157848 (= e!658444 (= lt!520011 (getCurrentListMapNoExtraKeys!4793 lt!520015 lt!520021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1157849 () Bool)

(assert (=> b!1157849 (contains!6765 call!55513 k0!934)))

(declare-fun lt!520018 () Unit!37997)

(declare-fun addStillContains!930 (ListLongMap!16595 (_ BitVec 64) V!43833 (_ BitVec 64)) Unit!37997)

(assert (=> b!1157849 (= lt!520018 (addStillContains!930 lt!520013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1157849 call!55511))

(assert (=> b!1157849 (= lt!520013 (+!3722 lt!520020 (tuple2!18627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520014 () Unit!37997)

(declare-fun call!55514 () Unit!37997)

(assert (=> b!1157849 (= lt!520014 call!55514)))

(declare-fun e!658445 () Unit!37997)

(assert (=> b!1157849 (= e!658445 lt!520018)))

(declare-fun b!1157850 () Bool)

(declare-fun e!658432 () Unit!37997)

(declare-fun Unit!38000 () Unit!37997)

(assert (=> b!1157850 (= e!658432 Unit!38000)))

(declare-fun b!1157851 () Bool)

(declare-fun e!658438 () Unit!37997)

(assert (=> b!1157851 (= e!658438 e!658432)))

(declare-fun c!115323 () Bool)

(declare-fun lt!520017 () Bool)

(assert (=> b!1157851 (= c!115323 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520017))))

(declare-fun b!1157852 () Bool)

(declare-fun e!658436 () Bool)

(declare-fun tp_is_empty!29029 () Bool)

(assert (=> b!1157852 (= e!658436 tp_is_empty!29029)))

(declare-fun bm!55508 () Bool)

(assert (=> bm!55508 (= call!55510 (getCurrentListMapNoExtraKeys!4793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157853 () Bool)

(assert (=> b!1157853 (= e!658440 (= call!55512 (-!1369 call!55510 k0!934)))))

(declare-fun b!1157854 () Bool)

(declare-fun res!768838 () Bool)

(assert (=> b!1157854 (=> (not res!768838) (not e!658430))))

(declare-datatypes ((List!25352 0))(
  ( (Nil!25349) (Cons!25348 (h!26557 (_ BitVec 64)) (t!36834 List!25352)) )
))
(declare-fun arrayNoDuplicates!0 (array!74820 (_ BitVec 32) List!25352) Bool)

(assert (=> b!1157854 (= res!768838 (arrayNoDuplicates!0 lt!520015 #b00000000000000000000000000000000 Nil!25349))))

(declare-fun b!1157855 () Bool)

(declare-fun e!658439 () Bool)

(declare-fun mapRes!45368 () Bool)

(assert (=> b!1157855 (= e!658439 (and e!658436 mapRes!45368))))

(declare-fun condMapEmpty!45368 () Bool)

(declare-fun mapDefault!45368 () ValueCell!13805)

(assert (=> b!1157855 (= condMapEmpty!45368 (= (arr!36062 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13805)) mapDefault!45368)))))

(declare-fun e!658434 () Bool)

(declare-fun b!1157856 () Bool)

(declare-fun arrayContainsKey!0 (array!74820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157856 (= e!658434 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157857 () Bool)

(declare-fun res!768828 () Bool)

(assert (=> b!1157857 (=> (not res!768828) (not e!658446))))

(assert (=> b!1157857 (= res!768828 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25349))))

(declare-fun b!1157858 () Bool)

(declare-fun Unit!38001 () Unit!37997)

(assert (=> b!1157858 (= e!658443 Unit!38001)))

(assert (=> b!1157858 (= lt!520017 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1157858 (= c!115325 (and (not lt!520017) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520022 () Unit!37997)

(assert (=> b!1157858 (= lt!520022 e!658445)))

(declare-fun lt!520029 () Unit!37997)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!512 (array!74820 array!74822 (_ BitVec 32) (_ BitVec 32) V!43833 V!43833 (_ BitVec 64) (_ BitVec 32) Int) Unit!37997)

(assert (=> b!1157858 (= lt!520029 (lemmaListMapContainsThenArrayContainsFrom!512 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115328 () Bool)

(assert (=> b!1157858 (= c!115328 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768840 () Bool)

(assert (=> b!1157858 (= res!768840 e!658434)))

(declare-fun e!658435 () Bool)

(assert (=> b!1157858 (=> (not res!768840) (not e!658435))))

(assert (=> b!1157858 e!658435))

(declare-fun lt!520008 () Unit!37997)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74820 (_ BitVec 32) (_ BitVec 32)) Unit!37997)

(assert (=> b!1157858 (= lt!520008 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1157858 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25349)))

(declare-fun lt!520023 () Unit!37997)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74820 (_ BitVec 64) (_ BitVec 32) List!25352) Unit!37997)

(assert (=> b!1157858 (= lt!520023 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25349))))

(assert (=> b!1157858 false))

(declare-fun b!1157859 () Bool)

(declare-fun res!768829 () Bool)

(assert (=> b!1157859 (=> (not res!768829) (not e!658446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1157859 (= res!768829 (validMask!0 mask!1564))))

(declare-fun b!1157860 () Bool)

(assert (=> b!1157860 call!55507))

(declare-fun lt!520010 () Unit!37997)

(declare-fun call!55509 () Unit!37997)

(assert (=> b!1157860 (= lt!520010 call!55509)))

(assert (=> b!1157860 (= e!658432 lt!520010)))

(declare-fun b!1157861 () Bool)

(declare-fun res!768834 () Bool)

(assert (=> b!1157861 (=> (not res!768834) (not e!658446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157861 (= res!768834 (validKeyInArray!0 k0!934))))

(declare-fun b!1157862 () Bool)

(assert (=> b!1157862 (= c!115326 (and (not lt!520017) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157862 (= e!658445 e!658438)))

(declare-fun mapIsEmpty!45368 () Bool)

(assert (=> mapIsEmpty!45368 mapRes!45368))

(declare-fun bm!55509 () Bool)

(assert (=> bm!55509 (= call!55512 (getCurrentListMapNoExtraKeys!4793 lt!520015 lt!520021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!768831 () Bool)

(assert (=> start!98888 (=> (not res!768831) (not e!658446))))

(assert (=> start!98888 (= res!768831 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36599 _keys!1208))))))

(assert (=> start!98888 e!658446))

(assert (=> start!98888 tp_is_empty!29029))

(declare-fun array_inv!27710 (array!74820) Bool)

(assert (=> start!98888 (array_inv!27710 _keys!1208)))

(assert (=> start!98888 true))

(assert (=> start!98888 tp!86207))

(declare-fun array_inv!27711 (array!74822) Bool)

(assert (=> start!98888 (and (array_inv!27711 _values!996) e!658439)))

(declare-fun b!1157863 () Bool)

(assert (=> b!1157863 (= e!658430 (not e!658442))))

(declare-fun res!768833 () Bool)

(assert (=> b!1157863 (=> res!768833 e!658442)))

(assert (=> b!1157863 (= res!768833 (bvsgt from!1455 i!673))))

(assert (=> b!1157863 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520024 () Unit!37997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74820 (_ BitVec 64) (_ BitVec 32)) Unit!37997)

(assert (=> b!1157863 (= lt!520024 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1157864 () Bool)

(assert (=> b!1157864 (= e!658434 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520017) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1157865 () Bool)

(declare-fun res!768836 () Bool)

(assert (=> b!1157865 (=> (not res!768836) (not e!658446))))

(assert (=> b!1157865 (= res!768836 (= (select (arr!36061 _keys!1208) i!673) k0!934))))

(declare-fun b!1157866 () Bool)

(declare-fun e!658441 () Bool)

(assert (=> b!1157866 (= e!658441 tp_is_empty!29029)))

(declare-fun b!1157867 () Bool)

(assert (=> b!1157867 (= e!658431 e!658437)))

(declare-fun res!768832 () Bool)

(assert (=> b!1157867 (=> res!768832 e!658437)))

(assert (=> b!1157867 (= res!768832 (not (= (select (arr!36061 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1157867 e!658440))

(declare-fun c!115324 () Bool)

(assert (=> b!1157867 (= c!115324 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!520019 () Unit!37997)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!639 (array!74820 array!74822 (_ BitVec 32) (_ BitVec 32) V!43833 V!43833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37997)

(assert (=> b!1157867 (= lt!520019 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!639 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157868 () Bool)

(declare-fun res!768837 () Bool)

(assert (=> b!1157868 (=> (not res!768837) (not e!658446))))

(assert (=> b!1157868 (= res!768837 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36599 _keys!1208))))))

(declare-fun bm!55510 () Bool)

(assert (=> bm!55510 (= call!55509 call!55514)))

(declare-fun b!1157869 () Bool)

(declare-fun lt!520027 () Unit!37997)

(assert (=> b!1157869 (= e!658438 lt!520027)))

(assert (=> b!1157869 (= lt!520027 call!55509)))

(assert (=> b!1157869 call!55507))

(declare-fun b!1157870 () Bool)

(assert (=> b!1157870 (= e!658435 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157871 () Bool)

(declare-fun res!768841 () Bool)

(assert (=> b!1157871 (=> (not res!768841) (not e!658446))))

(assert (=> b!1157871 (= res!768841 (and (= (size!36600 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36599 _keys!1208) (size!36600 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!55511 () Bool)

(assert (=> bm!55511 (= call!55514 (addStillContains!930 lt!520020 (ite (or c!115325 c!115326) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115325 c!115326) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapNonEmpty!45368 () Bool)

(declare-fun tp!86208 () Bool)

(assert (=> mapNonEmpty!45368 (= mapRes!45368 (and tp!86208 e!658441))))

(declare-fun mapKey!45368 () (_ BitVec 32))

(declare-fun mapRest!45368 () (Array (_ BitVec 32) ValueCell!13805))

(declare-fun mapValue!45368 () ValueCell!13805)

(assert (=> mapNonEmpty!45368 (= (arr!36062 _values!996) (store mapRest!45368 mapKey!45368 mapValue!45368))))

(assert (= (and start!98888 res!768831) b!1157859))

(assert (= (and b!1157859 res!768829) b!1157871))

(assert (= (and b!1157871 res!768841) b!1157846))

(assert (= (and b!1157846 res!768842) b!1157857))

(assert (= (and b!1157857 res!768828) b!1157868))

(assert (= (and b!1157868 res!768837) b!1157861))

(assert (= (and b!1157861 res!768834) b!1157865))

(assert (= (and b!1157865 res!768836) b!1157844))

(assert (= (and b!1157844 res!768835) b!1157854))

(assert (= (and b!1157854 res!768838) b!1157863))

(assert (= (and b!1157863 (not res!768833)) b!1157845))

(assert (= (and b!1157845 (not res!768830)) b!1157867))

(assert (= (and b!1157867 c!115324) b!1157853))

(assert (= (and b!1157867 (not c!115324)) b!1157843))

(assert (= (or b!1157853 b!1157843) bm!55508))

(assert (= (or b!1157853 b!1157843) bm!55509))

(assert (= (and b!1157867 (not res!768832)) b!1157847))

(assert (= (and b!1157847 c!115327) b!1157858))

(assert (= (and b!1157847 (not c!115327)) b!1157842))

(assert (= (and b!1157858 c!115325) b!1157849))

(assert (= (and b!1157858 (not c!115325)) b!1157862))

(assert (= (and b!1157862 c!115326) b!1157869))

(assert (= (and b!1157862 (not c!115326)) b!1157851))

(assert (= (and b!1157851 c!115323) b!1157860))

(assert (= (and b!1157851 (not c!115323)) b!1157850))

(assert (= (or b!1157869 b!1157860) bm!55510))

(assert (= (or b!1157869 b!1157860) bm!55507))

(assert (= (or b!1157869 b!1157860) bm!55505))

(assert (= (or b!1157849 bm!55505) bm!55506))

(assert (= (or b!1157849 bm!55510) bm!55511))

(assert (= (or b!1157849 bm!55507) bm!55504))

(assert (= (and b!1157858 c!115328) b!1157856))

(assert (= (and b!1157858 (not c!115328)) b!1157864))

(assert (= (and b!1157858 res!768840) b!1157870))

(assert (= (and b!1157847 res!768839) b!1157848))

(assert (= (and b!1157855 condMapEmpty!45368) mapIsEmpty!45368))

(assert (= (and b!1157855 (not condMapEmpty!45368)) mapNonEmpty!45368))

(get-info :version)

(assert (= (and mapNonEmpty!45368 ((_ is ValueCellFull!13805) mapValue!45368)) b!1157866))

(assert (= (and b!1157855 ((_ is ValueCellFull!13805) mapDefault!45368)) b!1157852))

(assert (= start!98888 b!1157855))

(declare-fun b_lambda!19587 () Bool)

(assert (=> (not b_lambda!19587) (not b!1157845)))

(declare-fun t!36832 () Bool)

(declare-fun tb!9303 () Bool)

(assert (=> (and start!98888 (= defaultEntry!1004 defaultEntry!1004) t!36832) tb!9303))

(declare-fun result!19179 () Bool)

(assert (=> tb!9303 (= result!19179 tp_is_empty!29029)))

(assert (=> b!1157845 t!36832))

(declare-fun b_and!39827 () Bool)

(assert (= b_and!39825 (and (=> t!36832 result!19179) b_and!39827)))

(declare-fun m!1066635 () Bool)

(assert (=> bm!55508 m!1066635))

(declare-fun m!1066637 () Bool)

(assert (=> b!1157849 m!1066637))

(declare-fun m!1066639 () Bool)

(assert (=> b!1157849 m!1066639))

(declare-fun m!1066641 () Bool)

(assert (=> b!1157849 m!1066641))

(declare-fun m!1066643 () Bool)

(assert (=> b!1157848 m!1066643))

(declare-fun m!1066645 () Bool)

(assert (=> b!1157854 m!1066645))

(declare-fun m!1066647 () Bool)

(assert (=> mapNonEmpty!45368 m!1066647))

(declare-fun m!1066649 () Bool)

(assert (=> bm!55506 m!1066649))

(declare-fun m!1066651 () Bool)

(assert (=> b!1157863 m!1066651))

(declare-fun m!1066653 () Bool)

(assert (=> b!1157863 m!1066653))

(declare-fun m!1066655 () Bool)

(assert (=> b!1157870 m!1066655))

(declare-fun m!1066657 () Bool)

(assert (=> b!1157847 m!1066657))

(declare-fun m!1066659 () Bool)

(assert (=> b!1157847 m!1066659))

(declare-fun m!1066661 () Bool)

(assert (=> b!1157847 m!1066661))

(declare-fun m!1066663 () Bool)

(assert (=> b!1157847 m!1066663))

(declare-fun m!1066665 () Bool)

(assert (=> b!1157847 m!1066665))

(assert (=> b!1157847 m!1066657))

(declare-fun m!1066667 () Bool)

(assert (=> b!1157847 m!1066667))

(declare-fun m!1066669 () Bool)

(assert (=> b!1157847 m!1066669))

(assert (=> b!1157847 m!1066663))

(declare-fun m!1066671 () Bool)

(assert (=> b!1157847 m!1066671))

(assert (=> b!1157847 m!1066657))

(assert (=> b!1157847 m!1066635))

(assert (=> b!1157847 m!1066665))

(declare-fun m!1066673 () Bool)

(assert (=> bm!55504 m!1066673))

(assert (=> b!1157867 m!1066657))

(declare-fun m!1066675 () Bool)

(assert (=> b!1157867 m!1066675))

(declare-fun m!1066677 () Bool)

(assert (=> bm!55511 m!1066677))

(assert (=> b!1157856 m!1066655))

(declare-fun m!1066679 () Bool)

(assert (=> b!1157859 m!1066679))

(declare-fun m!1066681 () Bool)

(assert (=> b!1157861 m!1066681))

(declare-fun m!1066683 () Bool)

(assert (=> b!1157846 m!1066683))

(declare-fun m!1066685 () Bool)

(assert (=> start!98888 m!1066685))

(declare-fun m!1066687 () Bool)

(assert (=> start!98888 m!1066687))

(declare-fun m!1066689 () Bool)

(assert (=> b!1157858 m!1066689))

(declare-fun m!1066691 () Bool)

(assert (=> b!1157858 m!1066691))

(declare-fun m!1066693 () Bool)

(assert (=> b!1157858 m!1066693))

(declare-fun m!1066695 () Bool)

(assert (=> b!1157858 m!1066695))

(declare-fun m!1066697 () Bool)

(assert (=> b!1157844 m!1066697))

(declare-fun m!1066699 () Bool)

(assert (=> b!1157844 m!1066699))

(declare-fun m!1066701 () Bool)

(assert (=> b!1157845 m!1066701))

(declare-fun m!1066703 () Bool)

(assert (=> b!1157845 m!1066703))

(declare-fun m!1066705 () Bool)

(assert (=> b!1157845 m!1066705))

(declare-fun m!1066707 () Bool)

(assert (=> b!1157845 m!1066707))

(declare-fun m!1066709 () Bool)

(assert (=> b!1157853 m!1066709))

(assert (=> bm!55509 m!1066643))

(declare-fun m!1066711 () Bool)

(assert (=> b!1157865 m!1066711))

(declare-fun m!1066713 () Bool)

(assert (=> b!1157857 m!1066713))

(check-sat (not bm!55511) (not bm!55506) (not b!1157861) (not start!98888) (not b!1157857) (not b_lambda!19587) b_and!39827 (not b!1157847) (not mapNonEmpty!45368) tp_is_empty!29029 (not bm!55508) (not b!1157856) (not b!1157846) (not b!1157858) (not b!1157854) (not bm!55504) (not bm!55509) (not b!1157844) (not b_next!24499) (not b!1157863) (not b!1157867) (not b!1157849) (not b!1157870) (not b!1157853) (not b!1157848) (not b!1157859) (not b!1157845))
(check-sat b_and!39827 (not b_next!24499))
