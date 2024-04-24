; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98926 () Bool)

(assert start!98926)

(declare-fun b_free!24295 () Bool)

(declare-fun b_next!24295 () Bool)

(assert (=> start!98926 (= b_free!24295 (not b_next!24295))))

(declare-fun tp!85596 () Bool)

(declare-fun b_and!39441 () Bool)

(assert (=> start!98926 (= tp!85596 b_and!39441)))

(declare-fun bm!53144 () Bool)

(declare-fun call!53153 () Bool)

(declare-fun call!53148 () Bool)

(assert (=> bm!53144 (= call!53153 call!53148)))

(declare-fun bm!53145 () Bool)

(declare-datatypes ((V!43561 0))(
  ( (V!43562 (val!14469 Int)) )
))
(declare-datatypes ((tuple2!18364 0))(
  ( (tuple2!18365 (_1!9193 (_ BitVec 64)) (_2!9193 V!43561)) )
))
(declare-datatypes ((List!25119 0))(
  ( (Nil!25116) (Cons!25115 (h!26333 tuple2!18364) (t!36398 List!25119)) )
))
(declare-datatypes ((ListLongMap!16341 0))(
  ( (ListLongMap!16342 (toList!8186 List!25119)) )
))
(declare-fun call!53154 () ListLongMap!16341)

(declare-fun call!53149 () ListLongMap!16341)

(assert (=> bm!53145 (= call!53154 call!53149)))

(declare-fun b!1149871 () Bool)

(declare-datatypes ((Unit!37725 0))(
  ( (Unit!37726) )
))
(declare-fun e!654140 () Unit!37725)

(declare-fun Unit!37727 () Unit!37725)

(assert (=> b!1149871 (= e!654140 Unit!37727)))

(declare-fun b!1149872 () Bool)

(declare-fun res!764812 () Bool)

(declare-fun e!654141 () Bool)

(assert (=> b!1149872 (=> (not res!764812) (not e!654141))))

(declare-datatypes ((array!74545 0))(
  ( (array!74546 (arr!35917 (Array (_ BitVec 32) (_ BitVec 64))) (size!36454 (_ BitVec 32))) )
))
(declare-fun lt!513973 () array!74545)

(declare-datatypes ((List!25120 0))(
  ( (Nil!25117) (Cons!25116 (h!26334 (_ BitVec 64)) (t!36399 List!25120)) )
))
(declare-fun arrayNoDuplicates!0 (array!74545 (_ BitVec 32) List!25120) Bool)

(assert (=> b!1149872 (= res!764812 (arrayNoDuplicates!0 lt!513973 #b00000000000000000000000000000000 Nil!25117))))

(declare-fun b!1149873 () Bool)

(declare-fun c!113914 () Bool)

(declare-fun lt!513981 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1149873 (= c!113914 (and (not lt!513981) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654153 () Unit!37725)

(declare-fun e!654142 () Unit!37725)

(assert (=> b!1149873 (= e!654153 e!654142)))

(declare-fun b!1149874 () Bool)

(assert (=> b!1149874 (= e!654142 e!654140)))

(declare-fun c!113912 () Bool)

(assert (=> b!1149874 (= c!113912 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513981))))

(declare-fun b!1149875 () Bool)

(declare-fun call!53147 () ListLongMap!16341)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!53150 () ListLongMap!16341)

(declare-fun e!654144 () Bool)

(declare-fun -!1309 (ListLongMap!16341 (_ BitVec 64)) ListLongMap!16341)

(assert (=> b!1149875 (= e!654144 (= call!53150 (-!1309 call!53147 k0!934)))))

(declare-fun lt!513988 () ListLongMap!16341)

(declare-fun b!1149876 () Bool)

(declare-fun lt!513972 () ListLongMap!16341)

(declare-fun e!654147 () Bool)

(assert (=> b!1149876 (= e!654147 (= (-!1309 lt!513972 k0!934) lt!513988))))

(declare-fun b!1149877 () Bool)

(declare-fun res!764823 () Bool)

(declare-fun e!654148 () Bool)

(assert (=> b!1149877 (=> (not res!764823) (not e!654148))))

(declare-fun _keys!1208 () array!74545)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149877 (= res!764823 (= (select (arr!35917 _keys!1208) i!673) k0!934))))

(declare-fun zeroValue!944 () V!43561)

(declare-fun c!113915 () Bool)

(declare-fun bm!53146 () Bool)

(declare-fun lt!513984 () ListLongMap!16341)

(declare-fun minValue!944 () V!43561)

(declare-fun +!3625 (ListLongMap!16341 tuple2!18364) ListLongMap!16341)

(assert (=> bm!53146 (= call!53149 (+!3625 (ite c!113915 lt!513984 lt!513988) (ite c!113915 (tuple2!18365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113914 (tuple2!18365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18365 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1149878 () Bool)

(declare-fun lt!513976 () Unit!37725)

(assert (=> b!1149878 (= e!654142 lt!513976)))

(declare-fun call!53152 () Unit!37725)

(assert (=> b!1149878 (= lt!513976 call!53152)))

(assert (=> b!1149878 call!53153))

(declare-fun b!1149879 () Bool)

(declare-fun res!764818 () Bool)

(assert (=> b!1149879 (=> (not res!764818) (not e!654148))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74545 (_ BitVec 32)) Bool)

(assert (=> b!1149879 (= res!764818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45062 () Bool)

(declare-fun mapRes!45062 () Bool)

(assert (=> mapIsEmpty!45062 mapRes!45062))

(declare-fun res!764813 () Bool)

(assert (=> start!98926 (=> (not res!764813) (not e!654148))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98926 (= res!764813 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36454 _keys!1208))))))

(assert (=> start!98926 e!654148))

(declare-fun tp_is_empty!28825 () Bool)

(assert (=> start!98926 tp_is_empty!28825))

(declare-fun array_inv!27564 (array!74545) Bool)

(assert (=> start!98926 (array_inv!27564 _keys!1208)))

(assert (=> start!98926 true))

(assert (=> start!98926 tp!85596))

(declare-datatypes ((ValueCell!13703 0))(
  ( (ValueCellFull!13703 (v!17102 V!43561)) (EmptyCell!13703) )
))
(declare-datatypes ((array!74547 0))(
  ( (array!74548 (arr!35918 (Array (_ BitVec 32) ValueCell!13703)) (size!36455 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74547)

(declare-fun e!654145 () Bool)

(declare-fun array_inv!27565 (array!74547) Bool)

(assert (=> start!98926 (and (array_inv!27565 _values!996) e!654145)))

(declare-fun b!1149880 () Bool)

(assert (=> b!1149880 (= e!654148 e!654141)))

(declare-fun res!764817 () Bool)

(assert (=> b!1149880 (=> (not res!764817) (not e!654141))))

(assert (=> b!1149880 (= res!764817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513973 mask!1564))))

(assert (=> b!1149880 (= lt!513973 (array!74546 (store (arr!35917 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36454 _keys!1208)))))

(declare-fun b!1149881 () Bool)

(declare-fun res!764824 () Bool)

(assert (=> b!1149881 (=> (not res!764824) (not e!654148))))

(assert (=> b!1149881 (= res!764824 (and (= (size!36455 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36454 _keys!1208) (size!36455 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!45062 () Bool)

(declare-fun tp!85595 () Bool)

(declare-fun e!654151 () Bool)

(assert (=> mapNonEmpty!45062 (= mapRes!45062 (and tp!85595 e!654151))))

(declare-fun mapKey!45062 () (_ BitVec 32))

(declare-fun mapValue!45062 () ValueCell!13703)

(declare-fun mapRest!45062 () (Array (_ BitVec 32) ValueCell!13703))

(assert (=> mapNonEmpty!45062 (= (arr!35918 _values!996) (store mapRest!45062 mapKey!45062 mapValue!45062))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!513975 () array!74547)

(declare-fun bm!53147 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4687 (array!74545 array!74547 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 32) Int) ListLongMap!16341)

(assert (=> bm!53147 (= call!53150 (getCurrentListMapNoExtraKeys!4687 lt!513973 lt!513975 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149882 () Bool)

(assert (=> b!1149882 call!53153))

(declare-fun lt!513971 () Unit!37725)

(assert (=> b!1149882 (= lt!513971 call!53152)))

(assert (=> b!1149882 (= e!654140 lt!513971)))

(declare-fun b!1149883 () Bool)

(declare-fun e!654143 () Bool)

(assert (=> b!1149883 (= e!654145 (and e!654143 mapRes!45062))))

(declare-fun condMapEmpty!45062 () Bool)

(declare-fun mapDefault!45062 () ValueCell!13703)

(assert (=> b!1149883 (= condMapEmpty!45062 (= (arr!35918 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13703)) mapDefault!45062)))))

(declare-fun b!1149884 () Bool)

(assert (=> b!1149884 (= e!654143 tp_is_empty!28825)))

(declare-fun b!1149885 () Bool)

(declare-fun res!764825 () Bool)

(assert (=> b!1149885 (=> (not res!764825) (not e!654148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149885 (= res!764825 (validKeyInArray!0 k0!934))))

(declare-fun b!1149886 () Bool)

(declare-fun e!654152 () Bool)

(assert (=> b!1149886 (= e!654141 (not e!654152))))

(declare-fun res!764826 () Bool)

(assert (=> b!1149886 (=> res!764826 e!654152)))

(assert (=> b!1149886 (= res!764826 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149886 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513979 () Unit!37725)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74545 (_ BitVec 64) (_ BitVec 32)) Unit!37725)

(assert (=> b!1149886 (= lt!513979 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!53148 () Bool)

(declare-fun contains!6723 (ListLongMap!16341 (_ BitVec 64)) Bool)

(assert (=> bm!53148 (= call!53148 (contains!6723 (ite c!113915 lt!513984 call!53154) k0!934))))

(declare-fun bm!53149 () Bool)

(declare-fun call!53151 () Unit!37725)

(assert (=> bm!53149 (= call!53152 call!53151)))

(declare-fun b!1149887 () Bool)

(declare-fun e!654149 () Bool)

(assert (=> b!1149887 (= e!654149 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149888 () Bool)

(declare-fun e!654138 () Unit!37725)

(declare-fun Unit!37728 () Unit!37725)

(assert (=> b!1149888 (= e!654138 Unit!37728)))

(declare-fun b!1149889 () Bool)

(declare-fun e!654154 () Bool)

(assert (=> b!1149889 (= e!654154 true)))

(assert (=> b!1149889 e!654147))

(declare-fun res!764819 () Bool)

(assert (=> b!1149889 (=> (not res!764819) (not e!654147))))

(declare-fun lt!513977 () V!43561)

(assert (=> b!1149889 (= res!764819 (= (-!1309 (+!3625 lt!513988 (tuple2!18365 (select (arr!35917 _keys!1208) from!1455) lt!513977)) (select (arr!35917 _keys!1208) from!1455)) lt!513988))))

(declare-fun lt!513968 () Unit!37725)

(declare-fun addThenRemoveForNewKeyIsSame!158 (ListLongMap!16341 (_ BitVec 64) V!43561) Unit!37725)

(assert (=> b!1149889 (= lt!513968 (addThenRemoveForNewKeyIsSame!158 lt!513988 (select (arr!35917 _keys!1208) from!1455) lt!513977))))

(declare-fun lt!513974 () V!43561)

(declare-fun get!18301 (ValueCell!13703 V!43561) V!43561)

(assert (=> b!1149889 (= lt!513977 (get!18301 (select (arr!35918 _values!996) from!1455) lt!513974))))

(declare-fun lt!513970 () Unit!37725)

(assert (=> b!1149889 (= lt!513970 e!654138)))

(declare-fun c!113916 () Bool)

(assert (=> b!1149889 (= c!113916 (contains!6723 lt!513988 k0!934))))

(assert (=> b!1149889 (= lt!513988 (getCurrentListMapNoExtraKeys!4687 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149890 () Bool)

(assert (=> b!1149890 (= e!654144 (= call!53150 call!53147))))

(declare-fun b!1149891 () Bool)

(declare-fun e!654139 () Bool)

(assert (=> b!1149891 (= e!654139 e!654154)))

(declare-fun res!764816 () Bool)

(assert (=> b!1149891 (=> res!764816 e!654154)))

(assert (=> b!1149891 (= res!764816 (not (= (select (arr!35917 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1149891 e!654144))

(declare-fun c!113911 () Bool)

(assert (=> b!1149891 (= c!113911 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513987 () Unit!37725)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!556 (array!74545 array!74547 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37725)

(assert (=> b!1149891 (= lt!513987 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!556 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53150 () Bool)

(assert (=> bm!53150 (= call!53147 (getCurrentListMapNoExtraKeys!4687 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149892 () Bool)

(declare-fun res!764814 () Bool)

(assert (=> b!1149892 (=> (not res!764814) (not e!654148))))

(assert (=> b!1149892 (= res!764814 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36454 _keys!1208))))))

(declare-fun e!654146 () Bool)

(declare-fun b!1149893 () Bool)

(assert (=> b!1149893 (= e!654146 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149894 () Bool)

(assert (=> b!1149894 (= e!654146 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513981) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149895 () Bool)

(assert (=> b!1149895 (contains!6723 call!53149 k0!934)))

(declare-fun lt!513969 () Unit!37725)

(declare-fun addStillContains!851 (ListLongMap!16341 (_ BitVec 64) V!43561 (_ BitVec 64)) Unit!37725)

(assert (=> b!1149895 (= lt!513969 (addStillContains!851 lt!513984 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1149895 call!53148))

(assert (=> b!1149895 (= lt!513984 (+!3625 lt!513988 (tuple2!18365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513986 () Unit!37725)

(assert (=> b!1149895 (= lt!513986 call!53151)))

(assert (=> b!1149895 (= e!654153 lt!513969)))

(declare-fun b!1149896 () Bool)

(declare-fun res!764821 () Bool)

(assert (=> b!1149896 (=> (not res!764821) (not e!654148))))

(assert (=> b!1149896 (= res!764821 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25117))))

(declare-fun b!1149897 () Bool)

(assert (=> b!1149897 (= e!654152 e!654139)))

(declare-fun res!764820 () Bool)

(assert (=> b!1149897 (=> res!764820 e!654139)))

(assert (=> b!1149897 (= res!764820 (not (= from!1455 i!673)))))

(declare-fun lt!513983 () ListLongMap!16341)

(assert (=> b!1149897 (= lt!513983 (getCurrentListMapNoExtraKeys!4687 lt!513973 lt!513975 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1149897 (= lt!513975 (array!74548 (store (arr!35918 _values!996) i!673 (ValueCellFull!13703 lt!513974)) (size!36455 _values!996)))))

(declare-fun dynLambda!2714 (Int (_ BitVec 64)) V!43561)

(assert (=> b!1149897 (= lt!513974 (dynLambda!2714 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1149897 (= lt!513972 (getCurrentListMapNoExtraKeys!4687 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53151 () Bool)

(assert (=> bm!53151 (= call!53151 (addStillContains!851 lt!513988 (ite (or c!113915 c!113914) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113915 c!113914) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1149898 () Bool)

(declare-fun res!764822 () Bool)

(assert (=> b!1149898 (=> (not res!764822) (not e!654148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149898 (= res!764822 (validMask!0 mask!1564))))

(declare-fun b!1149899 () Bool)

(declare-fun Unit!37729 () Unit!37725)

(assert (=> b!1149899 (= e!654138 Unit!37729)))

(assert (=> b!1149899 (= lt!513981 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149899 (= c!113915 (and (not lt!513981) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513985 () Unit!37725)

(assert (=> b!1149899 (= lt!513985 e!654153)))

(declare-fun lt!513978 () Unit!37725)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!446 (array!74545 array!74547 (_ BitVec 32) (_ BitVec 32) V!43561 V!43561 (_ BitVec 64) (_ BitVec 32) Int) Unit!37725)

(assert (=> b!1149899 (= lt!513978 (lemmaListMapContainsThenArrayContainsFrom!446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113913 () Bool)

(assert (=> b!1149899 (= c!113913 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764815 () Bool)

(assert (=> b!1149899 (= res!764815 e!654146)))

(assert (=> b!1149899 (=> (not res!764815) (not e!654149))))

(assert (=> b!1149899 e!654149))

(declare-fun lt!513982 () Unit!37725)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74545 (_ BitVec 32) (_ BitVec 32)) Unit!37725)

(assert (=> b!1149899 (= lt!513982 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1149899 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25117)))

(declare-fun lt!513980 () Unit!37725)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74545 (_ BitVec 64) (_ BitVec 32) List!25120) Unit!37725)

(assert (=> b!1149899 (= lt!513980 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25117))))

(assert (=> b!1149899 false))

(declare-fun b!1149900 () Bool)

(assert (=> b!1149900 (= e!654151 tp_is_empty!28825)))

(assert (= (and start!98926 res!764813) b!1149898))

(assert (= (and b!1149898 res!764822) b!1149881))

(assert (= (and b!1149881 res!764824) b!1149879))

(assert (= (and b!1149879 res!764818) b!1149896))

(assert (= (and b!1149896 res!764821) b!1149892))

(assert (= (and b!1149892 res!764814) b!1149885))

(assert (= (and b!1149885 res!764825) b!1149877))

(assert (= (and b!1149877 res!764823) b!1149880))

(assert (= (and b!1149880 res!764817) b!1149872))

(assert (= (and b!1149872 res!764812) b!1149886))

(assert (= (and b!1149886 (not res!764826)) b!1149897))

(assert (= (and b!1149897 (not res!764820)) b!1149891))

(assert (= (and b!1149891 c!113911) b!1149875))

(assert (= (and b!1149891 (not c!113911)) b!1149890))

(assert (= (or b!1149875 b!1149890) bm!53147))

(assert (= (or b!1149875 b!1149890) bm!53150))

(assert (= (and b!1149891 (not res!764816)) b!1149889))

(assert (= (and b!1149889 c!113916) b!1149899))

(assert (= (and b!1149889 (not c!113916)) b!1149888))

(assert (= (and b!1149899 c!113915) b!1149895))

(assert (= (and b!1149899 (not c!113915)) b!1149873))

(assert (= (and b!1149873 c!113914) b!1149878))

(assert (= (and b!1149873 (not c!113914)) b!1149874))

(assert (= (and b!1149874 c!113912) b!1149882))

(assert (= (and b!1149874 (not c!113912)) b!1149871))

(assert (= (or b!1149878 b!1149882) bm!53149))

(assert (= (or b!1149878 b!1149882) bm!53145))

(assert (= (or b!1149878 b!1149882) bm!53144))

(assert (= (or b!1149895 bm!53144) bm!53148))

(assert (= (or b!1149895 bm!53149) bm!53151))

(assert (= (or b!1149895 bm!53145) bm!53146))

(assert (= (and b!1149899 c!113913) b!1149893))

(assert (= (and b!1149899 (not c!113913)) b!1149894))

(assert (= (and b!1149899 res!764815) b!1149887))

(assert (= (and b!1149889 res!764819) b!1149876))

(assert (= (and b!1149883 condMapEmpty!45062) mapIsEmpty!45062))

(assert (= (and b!1149883 (not condMapEmpty!45062)) mapNonEmpty!45062))

(get-info :version)

(assert (= (and mapNonEmpty!45062 ((_ is ValueCellFull!13703) mapValue!45062)) b!1149900))

(assert (= (and b!1149883 ((_ is ValueCellFull!13703) mapDefault!45062)) b!1149884))

(assert (= start!98926 b!1149883))

(declare-fun b_lambda!19395 () Bool)

(assert (=> (not b_lambda!19395) (not b!1149897)))

(declare-fun t!36397 () Bool)

(declare-fun tb!9099 () Bool)

(assert (=> (and start!98926 (= defaultEntry!1004 defaultEntry!1004) t!36397) tb!9099))

(declare-fun result!18771 () Bool)

(assert (=> tb!9099 (= result!18771 tp_is_empty!28825)))

(assert (=> b!1149897 t!36397))

(declare-fun b_and!39443 () Bool)

(assert (= b_and!39441 (and (=> t!36397 result!18771) b_and!39443)))

(declare-fun m!1060633 () Bool)

(assert (=> start!98926 m!1060633))

(declare-fun m!1060635 () Bool)

(assert (=> start!98926 m!1060635))

(declare-fun m!1060637 () Bool)

(assert (=> b!1149896 m!1060637))

(declare-fun m!1060639 () Bool)

(assert (=> b!1149885 m!1060639))

(declare-fun m!1060641 () Bool)

(assert (=> b!1149893 m!1060641))

(declare-fun m!1060643 () Bool)

(assert (=> b!1149876 m!1060643))

(assert (=> b!1149887 m!1060641))

(declare-fun m!1060645 () Bool)

(assert (=> b!1149897 m!1060645))

(declare-fun m!1060647 () Bool)

(assert (=> b!1149897 m!1060647))

(declare-fun m!1060649 () Bool)

(assert (=> b!1149897 m!1060649))

(declare-fun m!1060651 () Bool)

(assert (=> b!1149897 m!1060651))

(declare-fun m!1060653 () Bool)

(assert (=> b!1149899 m!1060653))

(declare-fun m!1060655 () Bool)

(assert (=> b!1149899 m!1060655))

(declare-fun m!1060657 () Bool)

(assert (=> b!1149899 m!1060657))

(declare-fun m!1060659 () Bool)

(assert (=> b!1149899 m!1060659))

(declare-fun m!1060661 () Bool)

(assert (=> b!1149877 m!1060661))

(declare-fun m!1060663 () Bool)

(assert (=> bm!53148 m!1060663))

(declare-fun m!1060665 () Bool)

(assert (=> b!1149875 m!1060665))

(declare-fun m!1060667 () Bool)

(assert (=> bm!53150 m!1060667))

(declare-fun m!1060669 () Bool)

(assert (=> b!1149872 m!1060669))

(declare-fun m!1060671 () Bool)

(assert (=> b!1149889 m!1060671))

(declare-fun m!1060673 () Bool)

(assert (=> b!1149889 m!1060673))

(declare-fun m!1060675 () Bool)

(assert (=> b!1149889 m!1060675))

(declare-fun m!1060677 () Bool)

(assert (=> b!1149889 m!1060677))

(assert (=> b!1149889 m!1060673))

(assert (=> b!1149889 m!1060675))

(declare-fun m!1060679 () Bool)

(assert (=> b!1149889 m!1060679))

(assert (=> b!1149889 m!1060671))

(declare-fun m!1060681 () Bool)

(assert (=> b!1149889 m!1060681))

(assert (=> b!1149889 m!1060675))

(assert (=> b!1149889 m!1060667))

(declare-fun m!1060683 () Bool)

(assert (=> b!1149889 m!1060683))

(assert (=> b!1149891 m!1060675))

(declare-fun m!1060685 () Bool)

(assert (=> b!1149891 m!1060685))

(declare-fun m!1060687 () Bool)

(assert (=> b!1149886 m!1060687))

(declare-fun m!1060689 () Bool)

(assert (=> b!1149886 m!1060689))

(declare-fun m!1060691 () Bool)

(assert (=> b!1149895 m!1060691))

(declare-fun m!1060693 () Bool)

(assert (=> b!1149895 m!1060693))

(declare-fun m!1060695 () Bool)

(assert (=> b!1149895 m!1060695))

(declare-fun m!1060697 () Bool)

(assert (=> bm!53146 m!1060697))

(declare-fun m!1060699 () Bool)

(assert (=> b!1149880 m!1060699))

(declare-fun m!1060701 () Bool)

(assert (=> b!1149880 m!1060701))

(declare-fun m!1060703 () Bool)

(assert (=> b!1149879 m!1060703))

(declare-fun m!1060705 () Bool)

(assert (=> bm!53147 m!1060705))

(declare-fun m!1060707 () Bool)

(assert (=> bm!53151 m!1060707))

(declare-fun m!1060709 () Bool)

(assert (=> b!1149898 m!1060709))

(declare-fun m!1060711 () Bool)

(assert (=> mapNonEmpty!45062 m!1060711))

(check-sat (not start!98926) (not b!1149896) (not b!1149891) (not bm!53146) (not b!1149893) b_and!39443 (not b!1149887) (not b!1149899) (not b!1149895) (not b!1149879) (not b!1149872) (not b!1149885) (not b!1149889) (not mapNonEmpty!45062) (not b!1149886) (not b_lambda!19395) (not b!1149876) tp_is_empty!28825 (not bm!53151) (not b!1149897) (not b!1149898) (not b!1149875) (not bm!53148) (not bm!53150) (not bm!53147) (not b_next!24295) (not b!1149880))
(check-sat b_and!39443 (not b_next!24295))
