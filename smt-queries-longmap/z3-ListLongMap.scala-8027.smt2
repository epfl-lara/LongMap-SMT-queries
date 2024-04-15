; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98996 () Bool)

(assert start!98996)

(declare-fun b_free!24607 () Bool)

(declare-fun b_next!24607 () Bool)

(assert (=> start!98996 (= b_free!24607 (not b_next!24607))))

(declare-fun tp!86532 () Bool)

(declare-fun b_and!40041 () Bool)

(assert (=> start!98996 (= tp!86532 b_and!40041)))

(declare-fun b!1162810 () Bool)

(declare-fun e!661195 () Bool)

(declare-fun e!661200 () Bool)

(assert (=> b!1162810 (= e!661195 e!661200)))

(declare-fun res!771263 () Bool)

(assert (=> b!1162810 (=> res!771263 e!661200)))

(declare-datatypes ((array!75030 0))(
  ( (array!75031 (arr!36166 (Array (_ BitVec 32) (_ BitVec 64))) (size!36704 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75030)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1162810 (= res!771263 (not (= (select (arr!36166 _keys!1208) from!1455) k0!934)))))

(declare-fun e!661189 () Bool)

(assert (=> b!1162810 e!661189))

(declare-fun c!116300 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1162810 (= c!116300 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43977 0))(
  ( (V!43978 (val!14625 Int)) )
))
(declare-fun zeroValue!944 () V!43977)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((Unit!38202 0))(
  ( (Unit!38203) )
))
(declare-fun lt!523587 () Unit!38202)

(declare-datatypes ((ValueCell!13859 0))(
  ( (ValueCellFull!13859 (v!17261 V!43977)) (EmptyCell!13859) )
))
(declare-datatypes ((array!75032 0))(
  ( (array!75033 (arr!36167 (Array (_ BitVec 32) ValueCell!13859)) (size!36705 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75032)

(declare-fun minValue!944 () V!43977)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!678 (array!75030 array!75032 (_ BitVec 32) (_ BitVec 32) V!43977 V!43977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38202)

(assert (=> b!1162810 (= lt!523587 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!678 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162811 () Bool)

(declare-fun e!661196 () Bool)

(assert (=> b!1162811 (= e!661196 e!661195)))

(declare-fun res!771266 () Bool)

(assert (=> b!1162811 (=> res!771266 e!661195)))

(assert (=> b!1162811 (= res!771266 (not (= from!1455 i!673)))))

(declare-fun lt!523572 () array!75030)

(declare-fun lt!523590 () array!75032)

(declare-datatypes ((tuple2!18728 0))(
  ( (tuple2!18729 (_1!9375 (_ BitVec 64)) (_2!9375 V!43977)) )
))
(declare-datatypes ((List!25445 0))(
  ( (Nil!25442) (Cons!25441 (h!26650 tuple2!18728) (t!37035 List!25445)) )
))
(declare-datatypes ((ListLongMap!16697 0))(
  ( (ListLongMap!16698 (toList!8364 List!25445)) )
))
(declare-fun lt!523582 () ListLongMap!16697)

(declare-fun getCurrentListMapNoExtraKeys!4842 (array!75030 array!75032 (_ BitVec 32) (_ BitVec 32) V!43977 V!43977 (_ BitVec 32) Int) ListLongMap!16697)

(assert (=> b!1162811 (= lt!523582 (getCurrentListMapNoExtraKeys!4842 lt!523572 lt!523590 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!523573 () V!43977)

(assert (=> b!1162811 (= lt!523590 (array!75033 (store (arr!36167 _values!996) i!673 (ValueCellFull!13859 lt!523573)) (size!36705 _values!996)))))

(declare-fun dynLambda!2778 (Int (_ BitVec 64)) V!43977)

(assert (=> b!1162811 (= lt!523573 (dynLambda!2778 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!523591 () ListLongMap!16697)

(assert (=> b!1162811 (= lt!523591 (getCurrentListMapNoExtraKeys!4842 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1162812 () Bool)

(declare-fun call!56803 () Bool)

(assert (=> b!1162812 call!56803))

(declare-fun lt!523581 () Unit!38202)

(declare-fun call!56804 () Unit!38202)

(assert (=> b!1162812 (= lt!523581 call!56804)))

(declare-fun e!661194 () Unit!38202)

(assert (=> b!1162812 (= e!661194 lt!523581)))

(declare-fun bm!56800 () Bool)

(declare-fun call!56808 () ListLongMap!16697)

(declare-fun call!56806 () ListLongMap!16697)

(assert (=> bm!56800 (= call!56808 call!56806)))

(declare-fun b!1162813 () Bool)

(declare-fun res!771268 () Bool)

(declare-fun e!661187 () Bool)

(assert (=> b!1162813 (=> (not res!771268) (not e!661187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1162813 (= res!771268 (validMask!0 mask!1564))))

(declare-fun b!1162814 () Bool)

(declare-fun contains!6810 (ListLongMap!16697 (_ BitVec 64)) Bool)

(assert (=> b!1162814 (contains!6810 call!56806 k0!934)))

(declare-fun lt!523580 () Unit!38202)

(declare-fun lt!523578 () ListLongMap!16697)

(declare-fun addStillContains!975 (ListLongMap!16697 (_ BitVec 64) V!43977 (_ BitVec 64)) Unit!38202)

(assert (=> b!1162814 (= lt!523580 (addStillContains!975 lt!523578 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!56809 () Bool)

(assert (=> b!1162814 call!56809))

(declare-fun lt!523575 () ListLongMap!16697)

(declare-fun +!3767 (ListLongMap!16697 tuple2!18728) ListLongMap!16697)

(assert (=> b!1162814 (= lt!523578 (+!3767 lt!523575 (tuple2!18729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!523592 () Unit!38202)

(declare-fun call!56805 () Unit!38202)

(assert (=> b!1162814 (= lt!523592 call!56805)))

(declare-fun e!661192 () Unit!38202)

(assert (=> b!1162814 (= e!661192 lt!523580)))

(declare-fun bm!56801 () Bool)

(assert (=> bm!56801 (= call!56804 call!56805)))

(declare-fun b!1162815 () Bool)

(declare-fun res!771262 () Bool)

(assert (=> b!1162815 (=> (not res!771262) (not e!661187))))

(declare-datatypes ((List!25446 0))(
  ( (Nil!25443) (Cons!25442 (h!26651 (_ BitVec 64)) (t!37036 List!25446)) )
))
(declare-fun arrayNoDuplicates!0 (array!75030 (_ BitVec 32) List!25446) Bool)

(assert (=> b!1162815 (= res!771262 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25443))))

(declare-fun bm!56802 () Bool)

(assert (=> bm!56802 (= call!56803 call!56809)))

(declare-fun call!56807 () ListLongMap!16697)

(declare-fun call!56810 () ListLongMap!16697)

(declare-fun b!1162817 () Bool)

(declare-fun -!1411 (ListLongMap!16697 (_ BitVec 64)) ListLongMap!16697)

(assert (=> b!1162817 (= e!661189 (= call!56807 (-!1411 call!56810 k0!934)))))

(declare-fun b!1162818 () Bool)

(declare-fun Unit!38204 () Unit!38202)

(assert (=> b!1162818 (= e!661194 Unit!38204)))

(declare-fun c!116297 () Bool)

(declare-fun bm!56803 () Bool)

(assert (=> bm!56803 (= call!56809 (contains!6810 (ite c!116297 lt!523578 call!56808) k0!934))))

(declare-fun bm!56804 () Bool)

(assert (=> bm!56804 (= call!56807 (getCurrentListMapNoExtraKeys!4842 lt!523572 lt!523590 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162819 () Bool)

(declare-fun res!771270 () Bool)

(assert (=> b!1162819 (=> (not res!771270) (not e!661187))))

(assert (=> b!1162819 (= res!771270 (= (select (arr!36166 _keys!1208) i!673) k0!934))))

(declare-fun b!1162820 () Bool)

(declare-fun e!661186 () Bool)

(declare-fun tp_is_empty!29137 () Bool)

(assert (=> b!1162820 (= e!661186 tp_is_empty!29137)))

(declare-fun b!1162821 () Bool)

(declare-fun e!661198 () Bool)

(assert (=> b!1162821 (= e!661198 (not e!661196))))

(declare-fun res!771261 () Bool)

(assert (=> b!1162821 (=> res!771261 e!661196)))

(assert (=> b!1162821 (= res!771261 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1162821 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!523574 () Unit!38202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75030 (_ BitVec 64) (_ BitVec 32)) Unit!38202)

(assert (=> b!1162821 (= lt!523574 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1162822 () Bool)

(declare-fun res!771271 () Bool)

(assert (=> b!1162822 (=> (not res!771271) (not e!661187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75030 (_ BitVec 32)) Bool)

(assert (=> b!1162822 (= res!771271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1162823 () Bool)

(declare-fun res!771264 () Bool)

(assert (=> b!1162823 (=> (not res!771264) (not e!661187))))

(assert (=> b!1162823 (= res!771264 (and (= (size!36705 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36704 _keys!1208) (size!36705 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1162824 () Bool)

(declare-fun e!661191 () Unit!38202)

(declare-fun Unit!38205 () Unit!38202)

(assert (=> b!1162824 (= e!661191 Unit!38205)))

(declare-fun b!1162825 () Bool)

(declare-fun e!661190 () Bool)

(declare-fun e!661197 () Bool)

(declare-fun mapRes!45530 () Bool)

(assert (=> b!1162825 (= e!661190 (and e!661197 mapRes!45530))))

(declare-fun condMapEmpty!45530 () Bool)

(declare-fun mapDefault!45530 () ValueCell!13859)

(assert (=> b!1162825 (= condMapEmpty!45530 (= (arr!36167 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13859)) mapDefault!45530)))))

(declare-fun mapIsEmpty!45530 () Bool)

(assert (=> mapIsEmpty!45530 mapRes!45530))

(declare-fun b!1162826 () Bool)

(declare-fun Unit!38206 () Unit!38202)

(assert (=> b!1162826 (= e!661191 Unit!38206)))

(declare-fun lt!523585 () Bool)

(assert (=> b!1162826 (= lt!523585 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1162826 (= c!116297 (and (not lt!523585) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!523583 () Unit!38202)

(assert (=> b!1162826 (= lt!523583 e!661192)))

(declare-fun lt!523579 () Unit!38202)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!545 (array!75030 array!75032 (_ BitVec 32) (_ BitVec 32) V!43977 V!43977 (_ BitVec 64) (_ BitVec 32) Int) Unit!38202)

(assert (=> b!1162826 (= lt!523579 (lemmaListMapContainsThenArrayContainsFrom!545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116296 () Bool)

(assert (=> b!1162826 (= c!116296 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!771259 () Bool)

(declare-fun e!661184 () Bool)

(assert (=> b!1162826 (= res!771259 e!661184)))

(declare-fun e!661193 () Bool)

(assert (=> b!1162826 (=> (not res!771259) (not e!661193))))

(assert (=> b!1162826 e!661193))

(declare-fun lt!523576 () Unit!38202)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75030 (_ BitVec 32) (_ BitVec 32)) Unit!38202)

(assert (=> b!1162826 (= lt!523576 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1162826 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25443)))

(declare-fun lt!523589 () Unit!38202)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75030 (_ BitVec 64) (_ BitVec 32) List!25446) Unit!38202)

(assert (=> b!1162826 (= lt!523589 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25443))))

(assert (=> b!1162826 false))

(declare-fun mapNonEmpty!45530 () Bool)

(declare-fun tp!86531 () Bool)

(assert (=> mapNonEmpty!45530 (= mapRes!45530 (and tp!86531 e!661186))))

(declare-fun mapKey!45530 () (_ BitVec 32))

(declare-fun mapRest!45530 () (Array (_ BitVec 32) ValueCell!13859))

(declare-fun mapValue!45530 () ValueCell!13859)

(assert (=> mapNonEmpty!45530 (= (arr!36167 _values!996) (store mapRest!45530 mapKey!45530 mapValue!45530))))

(declare-fun e!661185 () Bool)

(declare-fun lt!523584 () ListLongMap!16697)

(declare-fun b!1162827 () Bool)

(assert (=> b!1162827 (= e!661185 (= lt!523584 (getCurrentListMapNoExtraKeys!4842 lt!523572 lt!523590 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!56805 () Bool)

(declare-fun c!116298 () Bool)

(assert (=> bm!56805 (= call!56805 (addStillContains!975 lt!523575 (ite (or c!116297 c!116298) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!116297 c!116298) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!56806 () Bool)

(assert (=> bm!56806 (= call!56806 (+!3767 (ite c!116297 lt!523578 lt!523575) (ite c!116297 (tuple2!18729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116298 (tuple2!18729 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1162828 () Bool)

(assert (=> b!1162828 (= e!661197 tp_is_empty!29137)))

(declare-fun b!1162816 () Bool)

(declare-fun res!771258 () Bool)

(assert (=> b!1162816 (=> (not res!771258) (not e!661187))))

(assert (=> b!1162816 (= res!771258 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36704 _keys!1208))))))

(declare-fun res!771269 () Bool)

(assert (=> start!98996 (=> (not res!771269) (not e!661187))))

(assert (=> start!98996 (= res!771269 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36704 _keys!1208))))))

(assert (=> start!98996 e!661187))

(assert (=> start!98996 tp_is_empty!29137))

(declare-fun array_inv!27784 (array!75030) Bool)

(assert (=> start!98996 (array_inv!27784 _keys!1208)))

(assert (=> start!98996 true))

(assert (=> start!98996 tp!86532))

(declare-fun array_inv!27785 (array!75032) Bool)

(assert (=> start!98996 (and (array_inv!27785 _values!996) e!661190)))

(declare-fun b!1162829 () Bool)

(declare-fun res!771265 () Bool)

(assert (=> b!1162829 (=> (not res!771265) (not e!661198))))

(assert (=> b!1162829 (= res!771265 (arrayNoDuplicates!0 lt!523572 #b00000000000000000000000000000000 Nil!25443))))

(declare-fun b!1162830 () Bool)

(assert (=> b!1162830 (= e!661187 e!661198)))

(declare-fun res!771267 () Bool)

(assert (=> b!1162830 (=> (not res!771267) (not e!661198))))

(assert (=> b!1162830 (= res!771267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!523572 mask!1564))))

(assert (=> b!1162830 (= lt!523572 (array!75031 (store (arr!36166 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36704 _keys!1208)))))

(declare-fun bm!56807 () Bool)

(assert (=> bm!56807 (= call!56810 (getCurrentListMapNoExtraKeys!4842 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162831 () Bool)

(assert (=> b!1162831 (= c!116298 (and (not lt!523585) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!661199 () Unit!38202)

(assert (=> b!1162831 (= e!661192 e!661199)))

(declare-fun b!1162832 () Bool)

(declare-fun res!771260 () Bool)

(assert (=> b!1162832 (=> (not res!771260) (not e!661187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1162832 (= res!771260 (validKeyInArray!0 k0!934))))

(declare-fun b!1162833 () Bool)

(assert (=> b!1162833 (= e!661193 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162834 () Bool)

(assert (=> b!1162834 (= e!661184 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1162835 () Bool)

(declare-fun lt!523577 () Unit!38202)

(assert (=> b!1162835 (= e!661199 lt!523577)))

(assert (=> b!1162835 (= lt!523577 call!56804)))

(assert (=> b!1162835 call!56803))

(declare-fun b!1162836 () Bool)

(assert (=> b!1162836 (= e!661199 e!661194)))

(declare-fun c!116295 () Bool)

(assert (=> b!1162836 (= c!116295 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!523585))))

(declare-fun b!1162837 () Bool)

(assert (=> b!1162837 (= e!661200 true)))

(assert (=> b!1162837 e!661185))

(declare-fun res!771272 () Bool)

(assert (=> b!1162837 (=> (not res!771272) (not e!661185))))

(assert (=> b!1162837 (= res!771272 (= lt!523584 lt!523575))))

(assert (=> b!1162837 (= lt!523584 (-!1411 lt!523591 k0!934))))

(declare-fun lt!523586 () V!43977)

(assert (=> b!1162837 (= (-!1411 (+!3767 lt!523575 (tuple2!18729 (select (arr!36166 _keys!1208) from!1455) lt!523586)) (select (arr!36166 _keys!1208) from!1455)) lt!523575)))

(declare-fun lt!523593 () Unit!38202)

(declare-fun addThenRemoveForNewKeyIsSame!252 (ListLongMap!16697 (_ BitVec 64) V!43977) Unit!38202)

(assert (=> b!1162837 (= lt!523593 (addThenRemoveForNewKeyIsSame!252 lt!523575 (select (arr!36166 _keys!1208) from!1455) lt!523586))))

(declare-fun get!18468 (ValueCell!13859 V!43977) V!43977)

(assert (=> b!1162837 (= lt!523586 (get!18468 (select (arr!36167 _values!996) from!1455) lt!523573))))

(declare-fun lt!523588 () Unit!38202)

(assert (=> b!1162837 (= lt!523588 e!661191)))

(declare-fun c!116299 () Bool)

(assert (=> b!1162837 (= c!116299 (contains!6810 lt!523575 k0!934))))

(assert (=> b!1162837 (= lt!523575 (getCurrentListMapNoExtraKeys!4842 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1162838 () Bool)

(assert (=> b!1162838 (= e!661184 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!523585) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1162839 () Bool)

(assert (=> b!1162839 (= e!661189 (= call!56807 call!56810))))

(assert (= (and start!98996 res!771269) b!1162813))

(assert (= (and b!1162813 res!771268) b!1162823))

(assert (= (and b!1162823 res!771264) b!1162822))

(assert (= (and b!1162822 res!771271) b!1162815))

(assert (= (and b!1162815 res!771262) b!1162816))

(assert (= (and b!1162816 res!771258) b!1162832))

(assert (= (and b!1162832 res!771260) b!1162819))

(assert (= (and b!1162819 res!771270) b!1162830))

(assert (= (and b!1162830 res!771267) b!1162829))

(assert (= (and b!1162829 res!771265) b!1162821))

(assert (= (and b!1162821 (not res!771261)) b!1162811))

(assert (= (and b!1162811 (not res!771266)) b!1162810))

(assert (= (and b!1162810 c!116300) b!1162817))

(assert (= (and b!1162810 (not c!116300)) b!1162839))

(assert (= (or b!1162817 b!1162839) bm!56807))

(assert (= (or b!1162817 b!1162839) bm!56804))

(assert (= (and b!1162810 (not res!771263)) b!1162837))

(assert (= (and b!1162837 c!116299) b!1162826))

(assert (= (and b!1162837 (not c!116299)) b!1162824))

(assert (= (and b!1162826 c!116297) b!1162814))

(assert (= (and b!1162826 (not c!116297)) b!1162831))

(assert (= (and b!1162831 c!116298) b!1162835))

(assert (= (and b!1162831 (not c!116298)) b!1162836))

(assert (= (and b!1162836 c!116295) b!1162812))

(assert (= (and b!1162836 (not c!116295)) b!1162818))

(assert (= (or b!1162835 b!1162812) bm!56801))

(assert (= (or b!1162835 b!1162812) bm!56800))

(assert (= (or b!1162835 b!1162812) bm!56802))

(assert (= (or b!1162814 bm!56802) bm!56803))

(assert (= (or b!1162814 bm!56801) bm!56805))

(assert (= (or b!1162814 bm!56800) bm!56806))

(assert (= (and b!1162826 c!116296) b!1162834))

(assert (= (and b!1162826 (not c!116296)) b!1162838))

(assert (= (and b!1162826 res!771259) b!1162833))

(assert (= (and b!1162837 res!771272) b!1162827))

(assert (= (and b!1162825 condMapEmpty!45530) mapIsEmpty!45530))

(assert (= (and b!1162825 (not condMapEmpty!45530)) mapNonEmpty!45530))

(get-info :version)

(assert (= (and mapNonEmpty!45530 ((_ is ValueCellFull!13859) mapValue!45530)) b!1162820))

(assert (= (and b!1162825 ((_ is ValueCellFull!13859) mapDefault!45530)) b!1162828))

(assert (= start!98996 b!1162825))

(declare-fun b_lambda!19695 () Bool)

(assert (=> (not b_lambda!19695) (not b!1162811)))

(declare-fun t!37034 () Bool)

(declare-fun tb!9411 () Bool)

(assert (=> (and start!98996 (= defaultEntry!1004 defaultEntry!1004) t!37034) tb!9411))

(declare-fun result!19395 () Bool)

(assert (=> tb!9411 (= result!19395 tp_is_empty!29137)))

(assert (=> b!1162811 t!37034))

(declare-fun b_and!40043 () Bool)

(assert (= b_and!40041 (and (=> t!37034 result!19395) b_and!40043)))

(declare-fun m!1070959 () Bool)

(assert (=> b!1162826 m!1070959))

(declare-fun m!1070961 () Bool)

(assert (=> b!1162826 m!1070961))

(declare-fun m!1070963 () Bool)

(assert (=> b!1162826 m!1070963))

(declare-fun m!1070965 () Bool)

(assert (=> b!1162826 m!1070965))

(declare-fun m!1070967 () Bool)

(assert (=> bm!56805 m!1070967))

(declare-fun m!1070969 () Bool)

(assert (=> b!1162834 m!1070969))

(declare-fun m!1070971 () Bool)

(assert (=> b!1162830 m!1070971))

(declare-fun m!1070973 () Bool)

(assert (=> b!1162830 m!1070973))

(declare-fun m!1070975 () Bool)

(assert (=> bm!56807 m!1070975))

(declare-fun m!1070977 () Bool)

(assert (=> b!1162832 m!1070977))

(declare-fun m!1070979 () Bool)

(assert (=> bm!56806 m!1070979))

(declare-fun m!1070981 () Bool)

(assert (=> b!1162829 m!1070981))

(declare-fun m!1070983 () Bool)

(assert (=> b!1162827 m!1070983))

(declare-fun m!1070985 () Bool)

(assert (=> mapNonEmpty!45530 m!1070985))

(declare-fun m!1070987 () Bool)

(assert (=> b!1162814 m!1070987))

(declare-fun m!1070989 () Bool)

(assert (=> b!1162814 m!1070989))

(declare-fun m!1070991 () Bool)

(assert (=> b!1162814 m!1070991))

(declare-fun m!1070993 () Bool)

(assert (=> b!1162810 m!1070993))

(declare-fun m!1070995 () Bool)

(assert (=> b!1162810 m!1070995))

(declare-fun m!1070997 () Bool)

(assert (=> b!1162822 m!1070997))

(assert (=> b!1162833 m!1070969))

(declare-fun m!1070999 () Bool)

(assert (=> b!1162817 m!1070999))

(declare-fun m!1071001 () Bool)

(assert (=> bm!56803 m!1071001))

(declare-fun m!1071003 () Bool)

(assert (=> b!1162819 m!1071003))

(declare-fun m!1071005 () Bool)

(assert (=> start!98996 m!1071005))

(declare-fun m!1071007 () Bool)

(assert (=> start!98996 m!1071007))

(declare-fun m!1071009 () Bool)

(assert (=> b!1162811 m!1071009))

(declare-fun m!1071011 () Bool)

(assert (=> b!1162811 m!1071011))

(declare-fun m!1071013 () Bool)

(assert (=> b!1162811 m!1071013))

(declare-fun m!1071015 () Bool)

(assert (=> b!1162811 m!1071015))

(declare-fun m!1071017 () Bool)

(assert (=> b!1162821 m!1071017))

(declare-fun m!1071019 () Bool)

(assert (=> b!1162821 m!1071019))

(assert (=> bm!56804 m!1070983))

(assert (=> b!1162837 m!1070975))

(declare-fun m!1071021 () Bool)

(assert (=> b!1162837 m!1071021))

(assert (=> b!1162837 m!1070993))

(declare-fun m!1071023 () Bool)

(assert (=> b!1162837 m!1071023))

(declare-fun m!1071025 () Bool)

(assert (=> b!1162837 m!1071025))

(declare-fun m!1071027 () Bool)

(assert (=> b!1162837 m!1071027))

(declare-fun m!1071029 () Bool)

(assert (=> b!1162837 m!1071029))

(assert (=> b!1162837 m!1071021))

(declare-fun m!1071031 () Bool)

(assert (=> b!1162837 m!1071031))

(assert (=> b!1162837 m!1070993))

(assert (=> b!1162837 m!1070993))

(declare-fun m!1071033 () Bool)

(assert (=> b!1162837 m!1071033))

(assert (=> b!1162837 m!1071027))

(declare-fun m!1071035 () Bool)

(assert (=> b!1162815 m!1071035))

(declare-fun m!1071037 () Bool)

(assert (=> b!1162813 m!1071037))

(check-sat (not bm!56807) (not b!1162827) (not b!1162829) tp_is_empty!29137 (not b!1162822) (not b!1162814) (not b!1162815) (not start!98996) (not b!1162813) (not b!1162811) (not b!1162826) (not bm!56803) b_and!40043 (not b!1162833) (not bm!56804) (not b!1162817) (not b_next!24607) (not b_lambda!19695) (not mapNonEmpty!45530) (not b!1162821) (not b!1162810) (not b!1162834) (not b!1162832) (not bm!56805) (not b!1162837) (not bm!56806) (not b!1162830))
(check-sat b_and!40043 (not b_next!24607))
