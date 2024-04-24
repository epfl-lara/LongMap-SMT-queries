; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101254 () Bool)

(assert start!101254)

(declare-fun b_free!26017 () Bool)

(declare-fun b_next!26017 () Bool)

(assert (=> start!101254 (= b_free!26017 (not b_next!26017))))

(declare-fun tp!91066 () Bool)

(declare-fun b_and!43117 () Bool)

(assert (=> start!101254 (= tp!91066 b_and!43117)))

(declare-fun b!1211768 () Bool)

(declare-fun res!804842 () Bool)

(declare-fun e!688292 () Bool)

(assert (=> b!1211768 (=> (not res!804842) (not e!688292))))

(declare-datatypes ((array!78261 0))(
  ( (array!78262 (arr!37761 (Array (_ BitVec 32) (_ BitVec 64))) (size!38298 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78261)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211768 (= res!804842 (= (select (arr!37761 _keys!1208) i!673) k0!934))))

(declare-fun b!1211769 () Bool)

(declare-fun res!804837 () Bool)

(declare-fun e!688300 () Bool)

(assert (=> b!1211769 (=> (not res!804837) (not e!688300))))

(declare-fun lt!550087 () array!78261)

(declare-datatypes ((List!26618 0))(
  ( (Nil!26615) (Cons!26614 (h!27832 (_ BitVec 64)) (t!39607 List!26618)) )
))
(declare-fun arrayNoDuplicates!0 (array!78261 (_ BitVec 32) List!26618) Bool)

(assert (=> b!1211769 (= res!804837 (arrayNoDuplicates!0 lt!550087 #b00000000000000000000000000000000 Nil!26615))))

(declare-fun b!1211770 () Bool)

(declare-fun c!119667 () Bool)

(declare-fun lt!550084 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1211770 (= c!119667 (and (not lt!550084) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!40079 0))(
  ( (Unit!40080) )
))
(declare-fun e!688294 () Unit!40079)

(declare-fun e!688299 () Unit!40079)

(assert (=> b!1211770 (= e!688294 e!688299)))

(declare-fun res!804835 () Bool)

(assert (=> start!101254 (=> (not res!804835) (not e!688292))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101254 (= res!804835 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38298 _keys!1208))))))

(assert (=> start!101254 e!688292))

(declare-fun tp_is_empty!30721 () Bool)

(assert (=> start!101254 tp_is_empty!30721))

(declare-fun array_inv!28824 (array!78261) Bool)

(assert (=> start!101254 (array_inv!28824 _keys!1208)))

(assert (=> start!101254 true))

(assert (=> start!101254 tp!91066))

(declare-datatypes ((V!46089 0))(
  ( (V!46090 (val!15417 Int)) )
))
(declare-datatypes ((ValueCell!14651 0))(
  ( (ValueCellFull!14651 (v!18064 V!46089)) (EmptyCell!14651) )
))
(declare-datatypes ((array!78263 0))(
  ( (array!78264 (arr!37762 (Array (_ BitVec 32) ValueCell!14651)) (size!38299 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78263)

(declare-fun e!688288 () Bool)

(declare-fun array_inv!28825 (array!78263) Bool)

(assert (=> start!101254 (and (array_inv!28825 _values!996) e!688288)))

(declare-fun mapNonEmpty!47950 () Bool)

(declare-fun mapRes!47950 () Bool)

(declare-fun tp!91067 () Bool)

(declare-fun e!688290 () Bool)

(assert (=> mapNonEmpty!47950 (= mapRes!47950 (and tp!91067 e!688290))))

(declare-fun mapValue!47950 () ValueCell!14651)

(declare-fun mapRest!47950 () (Array (_ BitVec 32) ValueCell!14651))

(declare-fun mapKey!47950 () (_ BitVec 32))

(assert (=> mapNonEmpty!47950 (= (arr!37762 _values!996) (store mapRest!47950 mapKey!47950 mapValue!47950))))

(declare-fun b!1211771 () Bool)

(declare-fun e!688287 () Bool)

(declare-fun e!688298 () Bool)

(assert (=> b!1211771 (= e!688287 e!688298)))

(declare-fun res!804845 () Bool)

(assert (=> b!1211771 (=> res!804845 e!688298)))

(assert (=> b!1211771 (= res!804845 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46089)

(declare-fun lt!550076 () array!78263)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46089)

(declare-datatypes ((tuple2!19814 0))(
  ( (tuple2!19815 (_1!9918 (_ BitVec 64)) (_2!9918 V!46089)) )
))
(declare-datatypes ((List!26619 0))(
  ( (Nil!26616) (Cons!26615 (h!27833 tuple2!19814) (t!39608 List!26619)) )
))
(declare-datatypes ((ListLongMap!17791 0))(
  ( (ListLongMap!17792 (toList!8911 List!26619)) )
))
(declare-fun lt!550083 () ListLongMap!17791)

(declare-fun getCurrentListMapNoExtraKeys!5371 (array!78261 array!78263 (_ BitVec 32) (_ BitVec 32) V!46089 V!46089 (_ BitVec 32) Int) ListLongMap!17791)

(assert (=> b!1211771 (= lt!550083 (getCurrentListMapNoExtraKeys!5371 lt!550087 lt!550076 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3288 (Int (_ BitVec 64)) V!46089)

(assert (=> b!1211771 (= lt!550076 (array!78264 (store (arr!37762 _values!996) i!673 (ValueCellFull!14651 (dynLambda!3288 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38299 _values!996)))))

(declare-fun lt!550081 () ListLongMap!17791)

(assert (=> b!1211771 (= lt!550081 (getCurrentListMapNoExtraKeys!5371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!688291 () Bool)

(declare-fun b!1211772 () Bool)

(declare-fun call!59715 () ListLongMap!17791)

(declare-fun call!59717 () ListLongMap!17791)

(declare-fun -!1840 (ListLongMap!17791 (_ BitVec 64)) ListLongMap!17791)

(assert (=> b!1211772 (= e!688291 (= call!59715 (-!1840 call!59717 k0!934)))))

(declare-fun bm!59707 () Bool)

(declare-fun call!59716 () ListLongMap!17791)

(declare-fun call!59713 () ListLongMap!17791)

(assert (=> bm!59707 (= call!59716 call!59713)))

(declare-fun c!119666 () Bool)

(declare-fun call!59710 () Bool)

(declare-fun lt!550091 () ListLongMap!17791)

(declare-fun bm!59708 () Bool)

(declare-fun contains!7004 (ListLongMap!17791 (_ BitVec 64)) Bool)

(assert (=> bm!59708 (= call!59710 (contains!7004 (ite c!119666 lt!550091 call!59716) k0!934))))

(declare-fun b!1211773 () Bool)

(declare-fun res!804838 () Bool)

(assert (=> b!1211773 (=> (not res!804838) (not e!688292))))

(assert (=> b!1211773 (= res!804838 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38298 _keys!1208))))))

(declare-fun bm!59709 () Bool)

(declare-fun c!119668 () Bool)

(assert (=> bm!59709 (= call!59717 (getCurrentListMapNoExtraKeys!5371 (ite c!119668 _keys!1208 lt!550087) (ite c!119668 _values!996 lt!550076) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211774 () Bool)

(declare-fun e!688301 () Unit!40079)

(declare-fun Unit!40081 () Unit!40079)

(assert (=> b!1211774 (= e!688301 Unit!40081)))

(assert (=> b!1211774 (= lt!550084 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211774 (= c!119666 (and (not lt!550084) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550093 () Unit!40079)

(assert (=> b!1211774 (= lt!550093 e!688294)))

(declare-fun lt!550089 () Unit!40079)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!602 (array!78261 array!78263 (_ BitVec 32) (_ BitVec 32) V!46089 V!46089 (_ BitVec 64) (_ BitVec 32) Int) Unit!40079)

(assert (=> b!1211774 (= lt!550089 (lemmaListMapContainsThenArrayContainsFrom!602 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119665 () Bool)

(assert (=> b!1211774 (= c!119665 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804839 () Bool)

(declare-fun e!688295 () Bool)

(assert (=> b!1211774 (= res!804839 e!688295)))

(declare-fun e!688296 () Bool)

(assert (=> b!1211774 (=> (not res!804839) (not e!688296))))

(assert (=> b!1211774 e!688296))

(declare-fun lt!550086 () Unit!40079)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78261 (_ BitVec 32) (_ BitVec 32)) Unit!40079)

(assert (=> b!1211774 (= lt!550086 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1211774 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26615)))

(declare-fun lt!550080 () Unit!40079)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78261 (_ BitVec 64) (_ BitVec 32) List!26618) Unit!40079)

(assert (=> b!1211774 (= lt!550080 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26615))))

(assert (=> b!1211774 false))

(declare-fun b!1211775 () Bool)

(declare-fun res!804843 () Bool)

(assert (=> b!1211775 (=> (not res!804843) (not e!688292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211775 (= res!804843 (validKeyInArray!0 k0!934))))

(declare-fun bm!59710 () Bool)

(assert (=> bm!59710 (= call!59715 (getCurrentListMapNoExtraKeys!5371 (ite c!119668 lt!550087 _keys!1208) (ite c!119668 lt!550076 _values!996) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211776 () Bool)

(declare-fun call!59712 () Bool)

(assert (=> b!1211776 call!59712))

(declare-fun lt!550078 () Unit!40079)

(declare-fun call!59711 () Unit!40079)

(assert (=> b!1211776 (= lt!550078 call!59711)))

(declare-fun e!688297 () Unit!40079)

(assert (=> b!1211776 (= e!688297 lt!550078)))

(declare-fun b!1211777 () Bool)

(assert (=> b!1211777 (= e!688291 (= call!59717 call!59715))))

(declare-fun b!1211778 () Bool)

(assert (=> b!1211778 (= e!688300 (not e!688287))))

(declare-fun res!804847 () Bool)

(assert (=> b!1211778 (=> res!804847 e!688287)))

(assert (=> b!1211778 (= res!804847 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211778 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550092 () Unit!40079)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78261 (_ BitVec 64) (_ BitVec 32)) Unit!40079)

(assert (=> b!1211778 (= lt!550092 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59711 () Bool)

(declare-fun call!59714 () Unit!40079)

(assert (=> bm!59711 (= call!59711 call!59714)))

(declare-fun b!1211779 () Bool)

(declare-fun lt!550090 () ListLongMap!17791)

(declare-fun e!688293 () Bool)

(assert (=> b!1211779 (= e!688293 (not (contains!7004 lt!550090 (select (arr!37761 _keys!1208) from!1455))))))

(declare-fun lt!550088 () Unit!40079)

(assert (=> b!1211779 (= lt!550088 e!688301)))

(declare-fun c!119663 () Bool)

(assert (=> b!1211779 (= c!119663 (contains!7004 lt!550090 k0!934))))

(assert (=> b!1211779 (= lt!550090 (getCurrentListMapNoExtraKeys!5371 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211780 () Bool)

(declare-fun res!804840 () Bool)

(assert (=> b!1211780 (=> (not res!804840) (not e!688292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211780 (= res!804840 (validMask!0 mask!1564))))

(declare-fun b!1211781 () Bool)

(declare-fun lt!550082 () Unit!40079)

(assert (=> b!1211781 (= e!688299 lt!550082)))

(assert (=> b!1211781 (= lt!550082 call!59711)))

(assert (=> b!1211781 call!59712))

(declare-fun b!1211782 () Bool)

(declare-fun +!4072 (ListLongMap!17791 tuple2!19814) ListLongMap!17791)

(assert (=> b!1211782 (contains!7004 (+!4072 lt!550091 (tuple2!19815 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!550077 () Unit!40079)

(assert (=> b!1211782 (= lt!550077 call!59714)))

(assert (=> b!1211782 call!59710))

(assert (=> b!1211782 (= lt!550091 call!59713)))

(declare-fun lt!550085 () Unit!40079)

(declare-fun addStillContains!1055 (ListLongMap!17791 (_ BitVec 64) V!46089 (_ BitVec 64)) Unit!40079)

(assert (=> b!1211782 (= lt!550085 (addStillContains!1055 lt!550090 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1211782 (= e!688294 lt!550077)))

(declare-fun b!1211783 () Bool)

(assert (=> b!1211783 (= e!688295 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550084) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1211784 () Bool)

(assert (=> b!1211784 (= e!688292 e!688300)))

(declare-fun res!804841 () Bool)

(assert (=> b!1211784 (=> (not res!804841) (not e!688300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78261 (_ BitVec 32)) Bool)

(assert (=> b!1211784 (= res!804841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550087 mask!1564))))

(assert (=> b!1211784 (= lt!550087 (array!78262 (store (arr!37761 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38298 _keys!1208)))))

(declare-fun b!1211785 () Bool)

(declare-fun res!804844 () Bool)

(assert (=> b!1211785 (=> (not res!804844) (not e!688292))))

(assert (=> b!1211785 (= res!804844 (and (= (size!38299 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38298 _keys!1208) (size!38299 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211786 () Bool)

(assert (=> b!1211786 (= e!688299 e!688297)))

(declare-fun c!119664 () Bool)

(assert (=> b!1211786 (= c!119664 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550084))))

(declare-fun b!1211787 () Bool)

(assert (=> b!1211787 (= e!688296 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211788 () Bool)

(declare-fun e!688289 () Bool)

(assert (=> b!1211788 (= e!688289 tp_is_empty!30721)))

(declare-fun bm!59712 () Bool)

(assert (=> bm!59712 (= call!59713 (+!4072 lt!550090 (ite (or c!119666 c!119667) (tuple2!19815 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19815 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1211789 () Bool)

(declare-fun res!804836 () Bool)

(assert (=> b!1211789 (=> (not res!804836) (not e!688292))))

(assert (=> b!1211789 (= res!804836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1211790 () Bool)

(assert (=> b!1211790 (= e!688298 e!688293)))

(declare-fun res!804846 () Bool)

(assert (=> b!1211790 (=> res!804846 e!688293)))

(assert (=> b!1211790 (= res!804846 (not (= (select (arr!37761 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1211790 e!688291))

(assert (=> b!1211790 (= c!119668 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550079 () Unit!40079)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1055 (array!78261 array!78263 (_ BitVec 32) (_ BitVec 32) V!46089 V!46089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40079)

(assert (=> b!1211790 (= lt!550079 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1055 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211791 () Bool)

(declare-fun Unit!40082 () Unit!40079)

(assert (=> b!1211791 (= e!688301 Unit!40082)))

(declare-fun mapIsEmpty!47950 () Bool)

(assert (=> mapIsEmpty!47950 mapRes!47950))

(declare-fun b!1211792 () Bool)

(declare-fun res!804848 () Bool)

(assert (=> b!1211792 (=> (not res!804848) (not e!688292))))

(assert (=> b!1211792 (= res!804848 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26615))))

(declare-fun bm!59713 () Bool)

(assert (=> bm!59713 (= call!59712 call!59710)))

(declare-fun b!1211793 () Bool)

(assert (=> b!1211793 (= e!688295 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!59714 () Bool)

(assert (=> bm!59714 (= call!59714 (addStillContains!1055 (ite c!119666 lt!550091 lt!550090) (ite c!119666 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119667 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119666 minValue!944 (ite c!119667 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1211794 () Bool)

(assert (=> b!1211794 (= e!688288 (and e!688289 mapRes!47950))))

(declare-fun condMapEmpty!47950 () Bool)

(declare-fun mapDefault!47950 () ValueCell!14651)

(assert (=> b!1211794 (= condMapEmpty!47950 (= (arr!37762 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14651)) mapDefault!47950)))))

(declare-fun b!1211795 () Bool)

(assert (=> b!1211795 (= e!688290 tp_is_empty!30721)))

(declare-fun b!1211796 () Bool)

(declare-fun Unit!40083 () Unit!40079)

(assert (=> b!1211796 (= e!688297 Unit!40083)))

(assert (= (and start!101254 res!804835) b!1211780))

(assert (= (and b!1211780 res!804840) b!1211785))

(assert (= (and b!1211785 res!804844) b!1211789))

(assert (= (and b!1211789 res!804836) b!1211792))

(assert (= (and b!1211792 res!804848) b!1211773))

(assert (= (and b!1211773 res!804838) b!1211775))

(assert (= (and b!1211775 res!804843) b!1211768))

(assert (= (and b!1211768 res!804842) b!1211784))

(assert (= (and b!1211784 res!804841) b!1211769))

(assert (= (and b!1211769 res!804837) b!1211778))

(assert (= (and b!1211778 (not res!804847)) b!1211771))

(assert (= (and b!1211771 (not res!804845)) b!1211790))

(assert (= (and b!1211790 c!119668) b!1211772))

(assert (= (and b!1211790 (not c!119668)) b!1211777))

(assert (= (or b!1211772 b!1211777) bm!59709))

(assert (= (or b!1211772 b!1211777) bm!59710))

(assert (= (and b!1211790 (not res!804846)) b!1211779))

(assert (= (and b!1211779 c!119663) b!1211774))

(assert (= (and b!1211779 (not c!119663)) b!1211791))

(assert (= (and b!1211774 c!119666) b!1211782))

(assert (= (and b!1211774 (not c!119666)) b!1211770))

(assert (= (and b!1211770 c!119667) b!1211781))

(assert (= (and b!1211770 (not c!119667)) b!1211786))

(assert (= (and b!1211786 c!119664) b!1211776))

(assert (= (and b!1211786 (not c!119664)) b!1211796))

(assert (= (or b!1211781 b!1211776) bm!59711))

(assert (= (or b!1211781 b!1211776) bm!59707))

(assert (= (or b!1211781 b!1211776) bm!59713))

(assert (= (or b!1211782 bm!59713) bm!59708))

(assert (= (or b!1211782 bm!59711) bm!59714))

(assert (= (or b!1211782 bm!59707) bm!59712))

(assert (= (and b!1211774 c!119665) b!1211793))

(assert (= (and b!1211774 (not c!119665)) b!1211783))

(assert (= (and b!1211774 res!804839) b!1211787))

(assert (= (and b!1211794 condMapEmpty!47950) mapIsEmpty!47950))

(assert (= (and b!1211794 (not condMapEmpty!47950)) mapNonEmpty!47950))

(get-info :version)

(assert (= (and mapNonEmpty!47950 ((_ is ValueCellFull!14651) mapValue!47950)) b!1211795))

(assert (= (and b!1211794 ((_ is ValueCellFull!14651) mapDefault!47950)) b!1211788))

(assert (= start!101254 b!1211794))

(declare-fun b_lambda!21611 () Bool)

(assert (=> (not b_lambda!21611) (not b!1211771)))

(declare-fun t!39606 () Bool)

(declare-fun tb!10809 () Bool)

(assert (=> (and start!101254 (= defaultEntry!1004 defaultEntry!1004) t!39606) tb!10809))

(declare-fun result!22219 () Bool)

(assert (=> tb!10809 (= result!22219 tp_is_empty!30721)))

(assert (=> b!1211771 t!39606))

(declare-fun b_and!43119 () Bool)

(assert (= b_and!43117 (and (=> t!39606 result!22219) b_and!43119)))

(declare-fun m!1117545 () Bool)

(assert (=> b!1211778 m!1117545))

(declare-fun m!1117547 () Bool)

(assert (=> b!1211778 m!1117547))

(declare-fun m!1117549 () Bool)

(assert (=> b!1211787 m!1117549))

(declare-fun m!1117551 () Bool)

(assert (=> b!1211774 m!1117551))

(declare-fun m!1117553 () Bool)

(assert (=> b!1211774 m!1117553))

(declare-fun m!1117555 () Bool)

(assert (=> b!1211774 m!1117555))

(declare-fun m!1117557 () Bool)

(assert (=> b!1211774 m!1117557))

(declare-fun m!1117559 () Bool)

(assert (=> bm!59710 m!1117559))

(declare-fun m!1117561 () Bool)

(assert (=> b!1211775 m!1117561))

(declare-fun m!1117563 () Bool)

(assert (=> bm!59712 m!1117563))

(assert (=> b!1211793 m!1117549))

(declare-fun m!1117565 () Bool)

(assert (=> start!101254 m!1117565))

(declare-fun m!1117567 () Bool)

(assert (=> start!101254 m!1117567))

(declare-fun m!1117569 () Bool)

(assert (=> bm!59709 m!1117569))

(declare-fun m!1117571 () Bool)

(assert (=> b!1211792 m!1117571))

(declare-fun m!1117573 () Bool)

(assert (=> b!1211790 m!1117573))

(declare-fun m!1117575 () Bool)

(assert (=> b!1211790 m!1117575))

(declare-fun m!1117577 () Bool)

(assert (=> bm!59714 m!1117577))

(declare-fun m!1117579 () Bool)

(assert (=> b!1211780 m!1117579))

(declare-fun m!1117581 () Bool)

(assert (=> bm!59708 m!1117581))

(declare-fun m!1117583 () Bool)

(assert (=> b!1211769 m!1117583))

(assert (=> b!1211779 m!1117573))

(assert (=> b!1211779 m!1117573))

(declare-fun m!1117585 () Bool)

(assert (=> b!1211779 m!1117585))

(declare-fun m!1117587 () Bool)

(assert (=> b!1211779 m!1117587))

(declare-fun m!1117589 () Bool)

(assert (=> b!1211779 m!1117589))

(declare-fun m!1117591 () Bool)

(assert (=> b!1211782 m!1117591))

(assert (=> b!1211782 m!1117591))

(declare-fun m!1117593 () Bool)

(assert (=> b!1211782 m!1117593))

(declare-fun m!1117595 () Bool)

(assert (=> b!1211782 m!1117595))

(declare-fun m!1117597 () Bool)

(assert (=> b!1211771 m!1117597))

(declare-fun m!1117599 () Bool)

(assert (=> b!1211771 m!1117599))

(declare-fun m!1117601 () Bool)

(assert (=> b!1211771 m!1117601))

(declare-fun m!1117603 () Bool)

(assert (=> b!1211771 m!1117603))

(declare-fun m!1117605 () Bool)

(assert (=> b!1211768 m!1117605))

(declare-fun m!1117607 () Bool)

(assert (=> b!1211784 m!1117607))

(declare-fun m!1117609 () Bool)

(assert (=> b!1211784 m!1117609))

(declare-fun m!1117611 () Bool)

(assert (=> b!1211789 m!1117611))

(declare-fun m!1117613 () Bool)

(assert (=> mapNonEmpty!47950 m!1117613))

(declare-fun m!1117615 () Bool)

(assert (=> b!1211772 m!1117615))

(check-sat (not b!1211790) (not b!1211780) (not mapNonEmpty!47950) (not b!1211789) (not bm!59712) (not b!1211792) (not bm!59708) b_and!43119 (not b!1211774) (not b!1211784) (not b_next!26017) (not b!1211771) (not b!1211779) (not start!101254) (not b!1211787) (not b!1211769) tp_is_empty!30721 (not bm!59710) (not b!1211775) (not b!1211793) (not bm!59714) (not b!1211782) (not bm!59709) (not b!1211772) (not b!1211778) (not b_lambda!21611))
(check-sat b_and!43119 (not b_next!26017))
