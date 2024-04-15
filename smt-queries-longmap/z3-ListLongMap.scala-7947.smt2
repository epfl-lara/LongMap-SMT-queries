; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98516 () Bool)

(assert start!98516)

(declare-fun b_free!24127 () Bool)

(declare-fun b_next!24127 () Bool)

(assert (=> start!98516 (= b_free!24127 (not b_next!24127))))

(declare-fun tp!85092 () Bool)

(declare-fun b_and!39081 () Bool)

(assert (=> start!98516 (= tp!85092 b_and!39081)))

(declare-fun b!1140836 () Bool)

(declare-fun e!649050 () Bool)

(declare-fun e!649057 () Bool)

(assert (=> b!1140836 (= e!649050 e!649057)))

(declare-fun res!760565 () Bool)

(assert (=> b!1140836 (=> (not res!760565) (not e!649057))))

(declare-datatypes ((array!74096 0))(
  ( (array!74097 (arr!35699 (Array (_ BitVec 32) (_ BitVec 64))) (size!36237 (_ BitVec 32))) )
))
(declare-fun lt!508019 () array!74096)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74096 (_ BitVec 32)) Bool)

(assert (=> b!1140836 (= res!760565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508019 mask!1564))))

(declare-fun _keys!1208 () array!74096)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140836 (= lt!508019 (array!74097 (store (arr!35699 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36237 _keys!1208)))))

(declare-fun res!760569 () Bool)

(assert (=> start!98516 (=> (not res!760569) (not e!649050))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!98516 (= res!760569 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36237 _keys!1208))))))

(assert (=> start!98516 e!649050))

(declare-fun tp_is_empty!28657 () Bool)

(assert (=> start!98516 tp_is_empty!28657))

(declare-fun array_inv!27434 (array!74096) Bool)

(assert (=> start!98516 (array_inv!27434 _keys!1208)))

(assert (=> start!98516 true))

(assert (=> start!98516 tp!85092))

(declare-datatypes ((V!43337 0))(
  ( (V!43338 (val!14385 Int)) )
))
(declare-datatypes ((ValueCell!13619 0))(
  ( (ValueCellFull!13619 (v!17021 V!43337)) (EmptyCell!13619) )
))
(declare-datatypes ((array!74098 0))(
  ( (array!74099 (arr!35700 (Array (_ BitVec 32) ValueCell!13619)) (size!36238 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74098)

(declare-fun e!649053 () Bool)

(declare-fun array_inv!27435 (array!74098) Bool)

(assert (=> start!98516 (and (array_inv!27435 _values!996) e!649053)))

(declare-fun zeroValue!944 () V!43337)

(declare-fun c!111978 () Bool)

(declare-fun bm!51040 () Bool)

(declare-datatypes ((tuple2!18282 0))(
  ( (tuple2!18283 (_1!9152 (_ BitVec 64)) (_2!9152 V!43337)) )
))
(declare-datatypes ((List!25021 0))(
  ( (Nil!25018) (Cons!25017 (h!26226 tuple2!18282) (t!36131 List!25021)) )
))
(declare-datatypes ((ListLongMap!16251 0))(
  ( (ListLongMap!16252 (toList!8141 List!25021)) )
))
(declare-fun call!51045 () ListLongMap!16251)

(declare-fun lt!508016 () ListLongMap!16251)

(declare-fun c!111975 () Bool)

(declare-fun minValue!944 () V!43337)

(declare-fun lt!508010 () ListLongMap!16251)

(declare-fun +!3568 (ListLongMap!16251 tuple2!18282) ListLongMap!16251)

(assert (=> bm!51040 (= call!51045 (+!3568 (ite c!111978 lt!508010 lt!508016) (ite c!111978 (tuple2!18283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111975 (tuple2!18283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18283 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1140837 () Bool)

(declare-fun res!760570 () Bool)

(assert (=> b!1140837 (=> (not res!760570) (not e!649050))))

(assert (=> b!1140837 (= res!760570 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36237 _keys!1208))))))

(declare-fun b!1140838 () Bool)

(declare-fun e!649058 () Bool)

(declare-fun e!649065 () Bool)

(assert (=> b!1140838 (= e!649058 e!649065)))

(declare-fun res!760566 () Bool)

(assert (=> b!1140838 (=> res!760566 e!649065)))

(assert (=> b!1140838 (= res!760566 (not (= from!1455 i!673)))))

(declare-fun lt!508008 () ListLongMap!16251)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!508009 () array!74098)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4634 (array!74096 array!74098 (_ BitVec 32) (_ BitVec 32) V!43337 V!43337 (_ BitVec 32) Int) ListLongMap!16251)

(assert (=> b!1140838 (= lt!508008 (getCurrentListMapNoExtraKeys!4634 lt!508019 lt!508009 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508015 () V!43337)

(assert (=> b!1140838 (= lt!508009 (array!74099 (store (arr!35700 _values!996) i!673 (ValueCellFull!13619 lt!508015)) (size!36238 _values!996)))))

(declare-fun dynLambda!2617 (Int (_ BitVec 64)) V!43337)

(assert (=> b!1140838 (= lt!508015 (dynLambda!2617 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508012 () ListLongMap!16251)

(assert (=> b!1140838 (= lt!508012 (getCurrentListMapNoExtraKeys!4634 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1140839 () Bool)

(declare-fun res!760573 () Bool)

(assert (=> b!1140839 (=> (not res!760573) (not e!649050))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140839 (= res!760573 (validKeyInArray!0 k0!934))))

(declare-fun b!1140840 () Bool)

(declare-fun res!760577 () Bool)

(assert (=> b!1140840 (=> (not res!760577) (not e!649050))))

(assert (=> b!1140840 (= res!760577 (= (select (arr!35699 _keys!1208) i!673) k0!934))))

(declare-fun b!1140841 () Bool)

(assert (=> b!1140841 (= e!649057 (not e!649058))))

(declare-fun res!760568 () Bool)

(assert (=> b!1140841 (=> res!760568 e!649058)))

(assert (=> b!1140841 (= res!760568 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140841 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37268 0))(
  ( (Unit!37269) )
))
(declare-fun lt!508002 () Unit!37268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74096 (_ BitVec 64) (_ BitVec 32)) Unit!37268)

(assert (=> b!1140841 (= lt!508002 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1140842 () Bool)

(declare-fun e!649055 () Bool)

(assert (=> b!1140842 (= e!649055 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51041 () Bool)

(declare-fun call!51044 () Bool)

(declare-fun call!51043 () Bool)

(assert (=> bm!51041 (= call!51044 call!51043)))

(declare-fun b!1140843 () Bool)

(declare-fun e!649060 () Unit!37268)

(declare-fun Unit!37270 () Unit!37268)

(assert (=> b!1140843 (= e!649060 Unit!37270)))

(declare-fun lt!508018 () Bool)

(assert (=> b!1140843 (= lt!508018 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140843 (= c!111978 (and (not lt!508018) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508003 () Unit!37268)

(declare-fun e!649059 () Unit!37268)

(assert (=> b!1140843 (= lt!508003 e!649059)))

(declare-fun lt!508004 () Unit!37268)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!384 (array!74096 array!74098 (_ BitVec 32) (_ BitVec 32) V!43337 V!43337 (_ BitVec 64) (_ BitVec 32) Int) Unit!37268)

(assert (=> b!1140843 (= lt!508004 (lemmaListMapContainsThenArrayContainsFrom!384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111977 () Bool)

(assert (=> b!1140843 (= c!111977 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760572 () Bool)

(declare-fun e!649056 () Bool)

(assert (=> b!1140843 (= res!760572 e!649056)))

(assert (=> b!1140843 (=> (not res!760572) (not e!649055))))

(assert (=> b!1140843 e!649055))

(declare-fun lt!508017 () Unit!37268)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74096 (_ BitVec 32) (_ BitVec 32)) Unit!37268)

(assert (=> b!1140843 (= lt!508017 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25022 0))(
  ( (Nil!25019) (Cons!25018 (h!26227 (_ BitVec 64)) (t!36132 List!25022)) )
))
(declare-fun arrayNoDuplicates!0 (array!74096 (_ BitVec 32) List!25022) Bool)

(assert (=> b!1140843 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25019)))

(declare-fun lt!508005 () Unit!37268)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74096 (_ BitVec 64) (_ BitVec 32) List!25022) Unit!37268)

(assert (=> b!1140843 (= lt!508005 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25019))))

(assert (=> b!1140843 false))

(declare-fun bm!51042 () Bool)

(declare-fun call!51050 () Unit!37268)

(declare-fun addStillContains!782 (ListLongMap!16251 (_ BitVec 64) V!43337 (_ BitVec 64)) Unit!37268)

(assert (=> bm!51042 (= call!51050 (addStillContains!782 (ite c!111978 lt!508010 lt!508016) (ite c!111978 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111975 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111978 minValue!944 (ite c!111975 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1140844 () Bool)

(declare-fun e!649061 () Bool)

(assert (=> b!1140844 (= e!649061 true)))

(declare-fun lt!508011 () V!43337)

(declare-fun -!1227 (ListLongMap!16251 (_ BitVec 64)) ListLongMap!16251)

(assert (=> b!1140844 (= (-!1227 (+!3568 lt!508016 (tuple2!18283 (select (arr!35699 _keys!1208) from!1455) lt!508011)) (select (arr!35699 _keys!1208) from!1455)) lt!508016)))

(declare-fun lt!508001 () Unit!37268)

(declare-fun addThenRemoveForNewKeyIsSame!93 (ListLongMap!16251 (_ BitVec 64) V!43337) Unit!37268)

(assert (=> b!1140844 (= lt!508001 (addThenRemoveForNewKeyIsSame!93 lt!508016 (select (arr!35699 _keys!1208) from!1455) lt!508011))))

(declare-fun get!18149 (ValueCell!13619 V!43337) V!43337)

(assert (=> b!1140844 (= lt!508011 (get!18149 (select (arr!35700 _values!996) from!1455) lt!508015))))

(declare-fun lt!508007 () Unit!37268)

(assert (=> b!1140844 (= lt!508007 e!649060)))

(declare-fun c!111979 () Bool)

(declare-fun contains!6612 (ListLongMap!16251 (_ BitVec 64)) Bool)

(assert (=> b!1140844 (= c!111979 (contains!6612 lt!508016 k0!934))))

(assert (=> b!1140844 (= lt!508016 (getCurrentListMapNoExtraKeys!4634 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140845 () Bool)

(declare-fun e!649064 () Bool)

(assert (=> b!1140845 (= e!649064 tp_is_empty!28657)))

(declare-fun mapNonEmpty!44810 () Bool)

(declare-fun mapRes!44810 () Bool)

(declare-fun tp!85091 () Bool)

(declare-fun e!649063 () Bool)

(assert (=> mapNonEmpty!44810 (= mapRes!44810 (and tp!85091 e!649063))))

(declare-fun mapRest!44810 () (Array (_ BitVec 32) ValueCell!13619))

(declare-fun mapValue!44810 () ValueCell!13619)

(declare-fun mapKey!44810 () (_ BitVec 32))

(assert (=> mapNonEmpty!44810 (= (arr!35700 _values!996) (store mapRest!44810 mapKey!44810 mapValue!44810))))

(declare-fun b!1140846 () Bool)

(assert (=> b!1140846 (= e!649063 tp_is_empty!28657)))

(declare-fun b!1140847 () Bool)

(assert (=> b!1140847 (= e!649053 (and e!649064 mapRes!44810))))

(declare-fun condMapEmpty!44810 () Bool)

(declare-fun mapDefault!44810 () ValueCell!13619)

(assert (=> b!1140847 (= condMapEmpty!44810 (= (arr!35700 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13619)) mapDefault!44810)))))

(declare-fun b!1140848 () Bool)

(declare-fun e!649052 () Bool)

(declare-fun call!51047 () ListLongMap!16251)

(declare-fun call!51048 () ListLongMap!16251)

(assert (=> b!1140848 (= e!649052 (= call!51047 call!51048))))

(declare-fun b!1140849 () Bool)

(assert (=> b!1140849 call!51044))

(declare-fun lt!508000 () Unit!37268)

(declare-fun call!51049 () Unit!37268)

(assert (=> b!1140849 (= lt!508000 call!51049)))

(declare-fun e!649062 () Unit!37268)

(assert (=> b!1140849 (= e!649062 lt!508000)))

(declare-fun b!1140850 () Bool)

(declare-fun e!649054 () Unit!37268)

(declare-fun lt!508006 () Unit!37268)

(assert (=> b!1140850 (= e!649054 lt!508006)))

(assert (=> b!1140850 (= lt!508006 call!51049)))

(assert (=> b!1140850 call!51044))

(declare-fun bm!51043 () Bool)

(assert (=> bm!51043 (= call!51048 (getCurrentListMapNoExtraKeys!4634 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140851 () Bool)

(assert (=> b!1140851 (contains!6612 call!51045 k0!934)))

(declare-fun lt!508013 () Unit!37268)

(assert (=> b!1140851 (= lt!508013 call!51050)))

(assert (=> b!1140851 call!51043))

(assert (=> b!1140851 (= lt!508010 (+!3568 lt!508016 (tuple2!18283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508014 () Unit!37268)

(assert (=> b!1140851 (= lt!508014 (addStillContains!782 lt!508016 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1140851 (= e!649059 lt!508013)))

(declare-fun call!51046 () ListLongMap!16251)

(declare-fun bm!51044 () Bool)

(assert (=> bm!51044 (= call!51043 (contains!6612 (ite c!111978 lt!508010 call!51046) k0!934))))

(declare-fun b!1140852 () Bool)

(declare-fun res!760571 () Bool)

(assert (=> b!1140852 (=> (not res!760571) (not e!649057))))

(assert (=> b!1140852 (= res!760571 (arrayNoDuplicates!0 lt!508019 #b00000000000000000000000000000000 Nil!25019))))

(declare-fun b!1140853 () Bool)

(declare-fun res!760576 () Bool)

(assert (=> b!1140853 (=> (not res!760576) (not e!649050))))

(assert (=> b!1140853 (= res!760576 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25019))))

(declare-fun b!1140854 () Bool)

(declare-fun Unit!37271 () Unit!37268)

(assert (=> b!1140854 (= e!649062 Unit!37271)))

(declare-fun b!1140855 () Bool)

(assert (=> b!1140855 (= e!649054 e!649062)))

(declare-fun c!111980 () Bool)

(assert (=> b!1140855 (= c!111980 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508018))))

(declare-fun b!1140856 () Bool)

(assert (=> b!1140856 (= c!111975 (and (not lt!508018) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1140856 (= e!649059 e!649054)))

(declare-fun b!1140857 () Bool)

(assert (=> b!1140857 (= e!649056 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140858 () Bool)

(declare-fun res!760575 () Bool)

(assert (=> b!1140858 (=> (not res!760575) (not e!649050))))

(assert (=> b!1140858 (= res!760575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1140859 () Bool)

(declare-fun res!760574 () Bool)

(assert (=> b!1140859 (=> (not res!760574) (not e!649050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140859 (= res!760574 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44810 () Bool)

(assert (=> mapIsEmpty!44810 mapRes!44810))

(declare-fun b!1140860 () Bool)

(assert (=> b!1140860 (= e!649056 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508018) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1140861 () Bool)

(assert (=> b!1140861 (= e!649052 (= call!51047 (-!1227 call!51048 k0!934)))))

(declare-fun bm!51045 () Bool)

(assert (=> bm!51045 (= call!51046 call!51045)))

(declare-fun b!1140862 () Bool)

(assert (=> b!1140862 (= e!649065 e!649061)))

(declare-fun res!760564 () Bool)

(assert (=> b!1140862 (=> res!760564 e!649061)))

(assert (=> b!1140862 (= res!760564 (not (= (select (arr!35699 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1140862 e!649052))

(declare-fun c!111976 () Bool)

(assert (=> b!1140862 (= c!111976 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508020 () Unit!37268)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!508 (array!74096 array!74098 (_ BitVec 32) (_ BitVec 32) V!43337 V!43337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37268)

(assert (=> b!1140862 (= lt!508020 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!51046 () Bool)

(assert (=> bm!51046 (= call!51049 call!51050)))

(declare-fun b!1140863 () Bool)

(declare-fun res!760567 () Bool)

(assert (=> b!1140863 (=> (not res!760567) (not e!649050))))

(assert (=> b!1140863 (= res!760567 (and (= (size!36238 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36237 _keys!1208) (size!36238 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140864 () Bool)

(declare-fun Unit!37272 () Unit!37268)

(assert (=> b!1140864 (= e!649060 Unit!37272)))

(declare-fun bm!51047 () Bool)

(assert (=> bm!51047 (= call!51047 (getCurrentListMapNoExtraKeys!4634 lt!508019 lt!508009 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98516 res!760569) b!1140859))

(assert (= (and b!1140859 res!760574) b!1140863))

(assert (= (and b!1140863 res!760567) b!1140858))

(assert (= (and b!1140858 res!760575) b!1140853))

(assert (= (and b!1140853 res!760576) b!1140837))

(assert (= (and b!1140837 res!760570) b!1140839))

(assert (= (and b!1140839 res!760573) b!1140840))

(assert (= (and b!1140840 res!760577) b!1140836))

(assert (= (and b!1140836 res!760565) b!1140852))

(assert (= (and b!1140852 res!760571) b!1140841))

(assert (= (and b!1140841 (not res!760568)) b!1140838))

(assert (= (and b!1140838 (not res!760566)) b!1140862))

(assert (= (and b!1140862 c!111976) b!1140861))

(assert (= (and b!1140862 (not c!111976)) b!1140848))

(assert (= (or b!1140861 b!1140848) bm!51043))

(assert (= (or b!1140861 b!1140848) bm!51047))

(assert (= (and b!1140862 (not res!760564)) b!1140844))

(assert (= (and b!1140844 c!111979) b!1140843))

(assert (= (and b!1140844 (not c!111979)) b!1140864))

(assert (= (and b!1140843 c!111978) b!1140851))

(assert (= (and b!1140843 (not c!111978)) b!1140856))

(assert (= (and b!1140856 c!111975) b!1140850))

(assert (= (and b!1140856 (not c!111975)) b!1140855))

(assert (= (and b!1140855 c!111980) b!1140849))

(assert (= (and b!1140855 (not c!111980)) b!1140854))

(assert (= (or b!1140850 b!1140849) bm!51046))

(assert (= (or b!1140850 b!1140849) bm!51045))

(assert (= (or b!1140850 b!1140849) bm!51041))

(assert (= (or b!1140851 bm!51041) bm!51044))

(assert (= (or b!1140851 bm!51046) bm!51042))

(assert (= (or b!1140851 bm!51045) bm!51040))

(assert (= (and b!1140843 c!111977) b!1140857))

(assert (= (and b!1140843 (not c!111977)) b!1140860))

(assert (= (and b!1140843 res!760572) b!1140842))

(assert (= (and b!1140847 condMapEmpty!44810) mapIsEmpty!44810))

(assert (= (and b!1140847 (not condMapEmpty!44810)) mapNonEmpty!44810))

(get-info :version)

(assert (= (and mapNonEmpty!44810 ((_ is ValueCellFull!13619) mapValue!44810)) b!1140846))

(assert (= (and b!1140847 ((_ is ValueCellFull!13619) mapDefault!44810)) b!1140845))

(assert (= start!98516 b!1140847))

(declare-fun b_lambda!19215 () Bool)

(assert (=> (not b_lambda!19215) (not b!1140838)))

(declare-fun t!36130 () Bool)

(declare-fun tb!8931 () Bool)

(assert (=> (and start!98516 (= defaultEntry!1004 defaultEntry!1004) t!36130) tb!8931))

(declare-fun result!18435 () Bool)

(assert (=> tb!8931 (= result!18435 tp_is_empty!28657)))

(assert (=> b!1140838 t!36130))

(declare-fun b_and!39083 () Bool)

(assert (= b_and!39081 (and (=> t!36130 result!18435) b_and!39083)))

(declare-fun m!1051807 () Bool)

(assert (=> b!1140859 m!1051807))

(declare-fun m!1051809 () Bool)

(assert (=> b!1140840 m!1051809))

(declare-fun m!1051811 () Bool)

(assert (=> b!1140853 m!1051811))

(declare-fun m!1051813 () Bool)

(assert (=> mapNonEmpty!44810 m!1051813))

(declare-fun m!1051815 () Bool)

(assert (=> b!1140838 m!1051815))

(declare-fun m!1051817 () Bool)

(assert (=> b!1140838 m!1051817))

(declare-fun m!1051819 () Bool)

(assert (=> b!1140838 m!1051819))

(declare-fun m!1051821 () Bool)

(assert (=> b!1140838 m!1051821))

(declare-fun m!1051823 () Bool)

(assert (=> b!1140857 m!1051823))

(declare-fun m!1051825 () Bool)

(assert (=> b!1140844 m!1051825))

(declare-fun m!1051827 () Bool)

(assert (=> b!1140844 m!1051827))

(declare-fun m!1051829 () Bool)

(assert (=> b!1140844 m!1051829))

(declare-fun m!1051831 () Bool)

(assert (=> b!1140844 m!1051831))

(declare-fun m!1051833 () Bool)

(assert (=> b!1140844 m!1051833))

(assert (=> b!1140844 m!1051833))

(declare-fun m!1051835 () Bool)

(assert (=> b!1140844 m!1051835))

(assert (=> b!1140844 m!1051825))

(assert (=> b!1140844 m!1051829))

(declare-fun m!1051837 () Bool)

(assert (=> b!1140844 m!1051837))

(declare-fun m!1051839 () Bool)

(assert (=> b!1140844 m!1051839))

(assert (=> b!1140844 m!1051829))

(declare-fun m!1051841 () Bool)

(assert (=> bm!51044 m!1051841))

(declare-fun m!1051843 () Bool)

(assert (=> b!1140861 m!1051843))

(declare-fun m!1051845 () Bool)

(assert (=> b!1140852 m!1051845))

(assert (=> bm!51043 m!1051827))

(declare-fun m!1051847 () Bool)

(assert (=> bm!51042 m!1051847))

(declare-fun m!1051849 () Bool)

(assert (=> start!98516 m!1051849))

(declare-fun m!1051851 () Bool)

(assert (=> start!98516 m!1051851))

(declare-fun m!1051853 () Bool)

(assert (=> b!1140851 m!1051853))

(declare-fun m!1051855 () Bool)

(assert (=> b!1140851 m!1051855))

(declare-fun m!1051857 () Bool)

(assert (=> b!1140851 m!1051857))

(declare-fun m!1051859 () Bool)

(assert (=> b!1140843 m!1051859))

(declare-fun m!1051861 () Bool)

(assert (=> b!1140843 m!1051861))

(declare-fun m!1051863 () Bool)

(assert (=> b!1140843 m!1051863))

(declare-fun m!1051865 () Bool)

(assert (=> b!1140843 m!1051865))

(assert (=> b!1140842 m!1051823))

(assert (=> b!1140862 m!1051829))

(declare-fun m!1051867 () Bool)

(assert (=> b!1140862 m!1051867))

(declare-fun m!1051869 () Bool)

(assert (=> b!1140858 m!1051869))

(declare-fun m!1051871 () Bool)

(assert (=> bm!51047 m!1051871))

(declare-fun m!1051873 () Bool)

(assert (=> b!1140839 m!1051873))

(declare-fun m!1051875 () Bool)

(assert (=> b!1140836 m!1051875))

(declare-fun m!1051877 () Bool)

(assert (=> b!1140836 m!1051877))

(declare-fun m!1051879 () Bool)

(assert (=> b!1140841 m!1051879))

(declare-fun m!1051881 () Bool)

(assert (=> b!1140841 m!1051881))

(declare-fun m!1051883 () Bool)

(assert (=> bm!51040 m!1051883))

(check-sat (not bm!51047) (not mapNonEmpty!44810) (not b!1140838) (not b!1140861) tp_is_empty!28657 (not b_lambda!19215) (not b!1140858) b_and!39083 (not b!1140851) (not b!1140843) (not b!1140859) (not b!1140844) (not b!1140839) (not b_next!24127) (not b!1140862) (not b!1140852) (not b!1140853) (not b!1140857) (not b!1140841) (not bm!51040) (not bm!51043) (not b!1140842) (not b!1140836) (not bm!51044) (not start!98516) (not bm!51042))
(check-sat b_and!39083 (not b_next!24127))
