; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99420 () Bool)

(assert start!99420)

(declare-fun b_free!24999 () Bool)

(declare-fun b_next!24999 () Bool)

(assert (=> start!99420 (= b_free!24999 (not b_next!24999))))

(declare-fun tp!87710 () Bool)

(declare-fun b_and!40865 () Bool)

(assert (=> start!99420 (= tp!87710 b_and!40865)))

(declare-fun mapIsEmpty!46121 () Bool)

(declare-fun mapRes!46121 () Bool)

(assert (=> mapIsEmpty!46121 mapRes!46121))

(declare-fun b!1173913 () Bool)

(declare-fun e!667264 () Bool)

(declare-fun e!667260 () Bool)

(assert (=> b!1173913 (= e!667264 e!667260)))

(declare-fun res!779537 () Bool)

(assert (=> b!1173913 (=> (not res!779537) (not e!667260))))

(declare-datatypes ((array!75869 0))(
  ( (array!75870 (arr!36584 (Array (_ BitVec 32) (_ BitVec 64))) (size!37120 (_ BitVec 32))) )
))
(declare-fun lt!529256 () array!75869)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75869 (_ BitVec 32)) Bool)

(assert (=> b!1173913 (= res!779537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529256 mask!1564))))

(declare-fun _keys!1208 () array!75869)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173913 (= lt!529256 (array!75870 (store (arr!36584 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37120 _keys!1208)))))

(declare-fun b!1173914 () Bool)

(declare-fun res!779540 () Bool)

(assert (=> b!1173914 (=> (not res!779540) (not e!667264))))

(assert (=> b!1173914 (= res!779540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173915 () Bool)

(declare-fun e!667267 () Bool)

(declare-fun tp_is_empty!29529 () Bool)

(assert (=> b!1173915 (= e!667267 tp_is_empty!29529)))

(declare-fun b!1173916 () Bool)

(declare-fun e!667270 () Bool)

(assert (=> b!1173916 (= e!667270 tp_is_empty!29529)))

(declare-fun b!1173917 () Bool)

(declare-fun res!779550 () Bool)

(assert (=> b!1173917 (=> (not res!779550) (not e!667264))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1173917 (= res!779550 (= (select (arr!36584 _keys!1208) i!673) k0!934))))

(declare-fun b!1173918 () Bool)

(declare-fun res!779546 () Bool)

(assert (=> b!1173918 (=> (not res!779546) (not e!667260))))

(declare-datatypes ((List!25680 0))(
  ( (Nil!25677) (Cons!25676 (h!26885 (_ BitVec 64)) (t!37671 List!25680)) )
))
(declare-fun arrayNoDuplicates!0 (array!75869 (_ BitVec 32) List!25680) Bool)

(assert (=> b!1173918 (= res!779546 (arrayNoDuplicates!0 lt!529256 #b00000000000000000000000000000000 Nil!25677))))

(declare-fun b!1173919 () Bool)

(declare-fun res!779547 () Bool)

(assert (=> b!1173919 (=> (not res!779547) (not e!667264))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44499 0))(
  ( (V!44500 (val!14821 Int)) )
))
(declare-datatypes ((ValueCell!14055 0))(
  ( (ValueCellFull!14055 (v!17459 V!44499)) (EmptyCell!14055) )
))
(declare-datatypes ((array!75871 0))(
  ( (array!75872 (arr!36585 (Array (_ BitVec 32) ValueCell!14055)) (size!37121 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75871)

(assert (=> b!1173919 (= res!779547 (and (= (size!37121 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37120 _keys!1208) (size!37121 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173920 () Bool)

(declare-fun e!667263 () Bool)

(declare-fun arrayContainsKey!0 (array!75869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173920 (= e!667263 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173921 () Bool)

(declare-fun res!779539 () Bool)

(assert (=> b!1173921 (=> (not res!779539) (not e!667264))))

(assert (=> b!1173921 (= res!779539 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37120 _keys!1208))))))

(declare-fun b!1173922 () Bool)

(declare-fun e!667268 () Bool)

(assert (=> b!1173922 (= e!667260 (not e!667268))))

(declare-fun res!779544 () Bool)

(assert (=> b!1173922 (=> res!779544 e!667268)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173922 (= res!779544 (bvsgt from!1455 i!673))))

(assert (=> b!1173922 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38715 0))(
  ( (Unit!38716) )
))
(declare-fun lt!529250 () Unit!38715)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75869 (_ BitVec 64) (_ BitVec 32)) Unit!38715)

(assert (=> b!1173922 (= lt!529250 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!779542 () Bool)

(assert (=> start!99420 (=> (not res!779542) (not e!667264))))

(assert (=> start!99420 (= res!779542 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37120 _keys!1208))))))

(assert (=> start!99420 e!667264))

(assert (=> start!99420 tp_is_empty!29529))

(declare-fun array_inv!27950 (array!75869) Bool)

(assert (=> start!99420 (array_inv!27950 _keys!1208)))

(assert (=> start!99420 true))

(assert (=> start!99420 tp!87710))

(declare-fun e!667266 () Bool)

(declare-fun array_inv!27951 (array!75871) Bool)

(assert (=> start!99420 (and (array_inv!27951 _values!996) e!667266)))

(declare-fun mapNonEmpty!46121 () Bool)

(declare-fun tp!87711 () Bool)

(assert (=> mapNonEmpty!46121 (= mapRes!46121 (and tp!87711 e!667267))))

(declare-fun mapRest!46121 () (Array (_ BitVec 32) ValueCell!14055))

(declare-fun mapValue!46121 () ValueCell!14055)

(declare-fun mapKey!46121 () (_ BitVec 32))

(assert (=> mapNonEmpty!46121 (= (arr!36585 _values!996) (store mapRest!46121 mapKey!46121 mapValue!46121))))

(declare-fun b!1173923 () Bool)

(declare-fun e!667259 () Bool)

(assert (=> b!1173923 (= e!667268 e!667259)))

(declare-fun res!779548 () Bool)

(assert (=> b!1173923 (=> res!779548 e!667259)))

(assert (=> b!1173923 (= res!779548 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44499)

(declare-datatypes ((tuple2!18942 0))(
  ( (tuple2!18943 (_1!9482 (_ BitVec 64)) (_2!9482 V!44499)) )
))
(declare-datatypes ((List!25681 0))(
  ( (Nil!25678) (Cons!25677 (h!26886 tuple2!18942) (t!37672 List!25681)) )
))
(declare-datatypes ((ListLongMap!16911 0))(
  ( (ListLongMap!16912 (toList!8471 List!25681)) )
))
(declare-fun lt!529259 () ListLongMap!16911)

(declare-fun zeroValue!944 () V!44499)

(declare-fun lt!529251 () array!75871)

(declare-fun getCurrentListMapNoExtraKeys!4932 (array!75869 array!75871 (_ BitVec 32) (_ BitVec 32) V!44499 V!44499 (_ BitVec 32) Int) ListLongMap!16911)

(assert (=> b!1173923 (= lt!529259 (getCurrentListMapNoExtraKeys!4932 lt!529256 lt!529251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529254 () V!44499)

(assert (=> b!1173923 (= lt!529251 (array!75872 (store (arr!36585 _values!996) i!673 (ValueCellFull!14055 lt!529254)) (size!37121 _values!996)))))

(declare-fun dynLambda!2902 (Int (_ BitVec 64)) V!44499)

(assert (=> b!1173923 (= lt!529254 (dynLambda!2902 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529248 () ListLongMap!16911)

(assert (=> b!1173923 (= lt!529248 (getCurrentListMapNoExtraKeys!4932 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173924 () Bool)

(declare-fun e!667261 () Bool)

(assert (=> b!1173924 (= e!667259 e!667261)))

(declare-fun res!779549 () Bool)

(assert (=> b!1173924 (=> res!779549 e!667261)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173924 (= res!779549 (not (validKeyInArray!0 (select (arr!36584 _keys!1208) from!1455))))))

(declare-fun lt!529260 () ListLongMap!16911)

(declare-fun lt!529258 () ListLongMap!16911)

(assert (=> b!1173924 (= lt!529260 lt!529258)))

(declare-fun lt!529247 () ListLongMap!16911)

(declare-fun -!1532 (ListLongMap!16911 (_ BitVec 64)) ListLongMap!16911)

(assert (=> b!1173924 (= lt!529258 (-!1532 lt!529247 k0!934))))

(assert (=> b!1173924 (= lt!529260 (getCurrentListMapNoExtraKeys!4932 lt!529256 lt!529251 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173924 (= lt!529247 (getCurrentListMapNoExtraKeys!4932 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529249 () Unit!38715)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!759 (array!75869 array!75871 (_ BitVec 32) (_ BitVec 32) V!44499 V!44499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38715)

(assert (=> b!1173924 (= lt!529249 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!759 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1173925 () Bool)

(declare-fun e!667269 () Bool)

(assert (=> b!1173925 (= e!667269 e!667263)))

(declare-fun res!779545 () Bool)

(assert (=> b!1173925 (=> res!779545 e!667263)))

(assert (=> b!1173925 (= res!779545 (not (= (select (arr!36584 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173926 () Bool)

(assert (=> b!1173926 (= e!667261 true)))

(assert (=> b!1173926 (not (= (select (arr!36584 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529253 () Unit!38715)

(declare-fun e!667265 () Unit!38715)

(assert (=> b!1173926 (= lt!529253 e!667265)))

(declare-fun c!116622 () Bool)

(assert (=> b!1173926 (= c!116622 (= (select (arr!36584 _keys!1208) from!1455) k0!934))))

(assert (=> b!1173926 e!667269))

(declare-fun res!779538 () Bool)

(assert (=> b!1173926 (=> (not res!779538) (not e!667269))))

(declare-fun +!3789 (ListLongMap!16911 tuple2!18942) ListLongMap!16911)

(declare-fun get!18669 (ValueCell!14055 V!44499) V!44499)

(assert (=> b!1173926 (= res!779538 (= lt!529259 (+!3789 lt!529258 (tuple2!18943 (select (arr!36584 _keys!1208) from!1455) (get!18669 (select (arr!36585 _values!996) from!1455) lt!529254)))))))

(declare-fun b!1173927 () Bool)

(assert (=> b!1173927 (= e!667266 (and e!667270 mapRes!46121))))

(declare-fun condMapEmpty!46121 () Bool)

(declare-fun mapDefault!46121 () ValueCell!14055)

(assert (=> b!1173927 (= condMapEmpty!46121 (= (arr!36585 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14055)) mapDefault!46121)))))

(declare-fun b!1173928 () Bool)

(declare-fun res!779543 () Bool)

(assert (=> b!1173928 (=> (not res!779543) (not e!667264))))

(assert (=> b!1173928 (= res!779543 (validKeyInArray!0 k0!934))))

(declare-fun b!1173929 () Bool)

(declare-fun res!779551 () Bool)

(assert (=> b!1173929 (=> (not res!779551) (not e!667264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173929 (= res!779551 (validMask!0 mask!1564))))

(declare-fun b!1173930 () Bool)

(declare-fun res!779541 () Bool)

(assert (=> b!1173930 (=> (not res!779541) (not e!667264))))

(assert (=> b!1173930 (= res!779541 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25677))))

(declare-fun b!1173931 () Bool)

(declare-fun Unit!38717 () Unit!38715)

(assert (=> b!1173931 (= e!667265 Unit!38717)))

(declare-fun b!1173932 () Bool)

(declare-fun Unit!38718 () Unit!38715)

(assert (=> b!1173932 (= e!667265 Unit!38718)))

(declare-fun lt!529255 () Unit!38715)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75869 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38715)

(assert (=> b!1173932 (= lt!529255 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1173932 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529252 () Unit!38715)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75869 (_ BitVec 32) (_ BitVec 32)) Unit!38715)

(assert (=> b!1173932 (= lt!529252 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173932 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25677)))

(declare-fun lt!529257 () Unit!38715)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75869 (_ BitVec 64) (_ BitVec 32) List!25680) Unit!38715)

(assert (=> b!1173932 (= lt!529257 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25677))))

(assert (=> b!1173932 false))

(assert (= (and start!99420 res!779542) b!1173929))

(assert (= (and b!1173929 res!779551) b!1173919))

(assert (= (and b!1173919 res!779547) b!1173914))

(assert (= (and b!1173914 res!779540) b!1173930))

(assert (= (and b!1173930 res!779541) b!1173921))

(assert (= (and b!1173921 res!779539) b!1173928))

(assert (= (and b!1173928 res!779543) b!1173917))

(assert (= (and b!1173917 res!779550) b!1173913))

(assert (= (and b!1173913 res!779537) b!1173918))

(assert (= (and b!1173918 res!779546) b!1173922))

(assert (= (and b!1173922 (not res!779544)) b!1173923))

(assert (= (and b!1173923 (not res!779548)) b!1173924))

(assert (= (and b!1173924 (not res!779549)) b!1173926))

(assert (= (and b!1173926 res!779538) b!1173925))

(assert (= (and b!1173925 (not res!779545)) b!1173920))

(assert (= (and b!1173926 c!116622) b!1173932))

(assert (= (and b!1173926 (not c!116622)) b!1173931))

(assert (= (and b!1173927 condMapEmpty!46121) mapIsEmpty!46121))

(assert (= (and b!1173927 (not condMapEmpty!46121)) mapNonEmpty!46121))

(get-info :version)

(assert (= (and mapNonEmpty!46121 ((_ is ValueCellFull!14055) mapValue!46121)) b!1173915))

(assert (= (and b!1173927 ((_ is ValueCellFull!14055) mapDefault!46121)) b!1173916))

(assert (= start!99420 b!1173927))

(declare-fun b_lambda!20143 () Bool)

(assert (=> (not b_lambda!20143) (not b!1173923)))

(declare-fun t!37670 () Bool)

(declare-fun tb!9811 () Bool)

(assert (=> (and start!99420 (= defaultEntry!1004 defaultEntry!1004) t!37670) tb!9811))

(declare-fun result!20189 () Bool)

(assert (=> tb!9811 (= result!20189 tp_is_empty!29529)))

(assert (=> b!1173923 t!37670))

(declare-fun b_and!40867 () Bool)

(assert (= b_and!40865 (and (=> t!37670 result!20189) b_and!40867)))

(declare-fun m!1081771 () Bool)

(assert (=> b!1173922 m!1081771))

(declare-fun m!1081773 () Bool)

(assert (=> b!1173922 m!1081773))

(declare-fun m!1081775 () Bool)

(assert (=> b!1173917 m!1081775))

(declare-fun m!1081777 () Bool)

(assert (=> b!1173918 m!1081777))

(declare-fun m!1081779 () Bool)

(assert (=> b!1173913 m!1081779))

(declare-fun m!1081781 () Bool)

(assert (=> b!1173913 m!1081781))

(declare-fun m!1081783 () Bool)

(assert (=> b!1173920 m!1081783))

(declare-fun m!1081785 () Bool)

(assert (=> b!1173932 m!1081785))

(declare-fun m!1081787 () Bool)

(assert (=> b!1173932 m!1081787))

(declare-fun m!1081789 () Bool)

(assert (=> b!1173932 m!1081789))

(declare-fun m!1081791 () Bool)

(assert (=> b!1173932 m!1081791))

(declare-fun m!1081793 () Bool)

(assert (=> b!1173932 m!1081793))

(declare-fun m!1081795 () Bool)

(assert (=> b!1173914 m!1081795))

(declare-fun m!1081797 () Bool)

(assert (=> start!99420 m!1081797))

(declare-fun m!1081799 () Bool)

(assert (=> start!99420 m!1081799))

(declare-fun m!1081801 () Bool)

(assert (=> b!1173930 m!1081801))

(declare-fun m!1081803 () Bool)

(assert (=> b!1173924 m!1081803))

(declare-fun m!1081805 () Bool)

(assert (=> b!1173924 m!1081805))

(declare-fun m!1081807 () Bool)

(assert (=> b!1173924 m!1081807))

(declare-fun m!1081809 () Bool)

(assert (=> b!1173924 m!1081809))

(declare-fun m!1081811 () Bool)

(assert (=> b!1173924 m!1081811))

(declare-fun m!1081813 () Bool)

(assert (=> b!1173924 m!1081813))

(assert (=> b!1173924 m!1081811))

(declare-fun m!1081815 () Bool)

(assert (=> mapNonEmpty!46121 m!1081815))

(declare-fun m!1081817 () Bool)

(assert (=> b!1173929 m!1081817))

(assert (=> b!1173925 m!1081811))

(declare-fun m!1081819 () Bool)

(assert (=> b!1173928 m!1081819))

(declare-fun m!1081821 () Bool)

(assert (=> b!1173923 m!1081821))

(declare-fun m!1081823 () Bool)

(assert (=> b!1173923 m!1081823))

(declare-fun m!1081825 () Bool)

(assert (=> b!1173923 m!1081825))

(declare-fun m!1081827 () Bool)

(assert (=> b!1173923 m!1081827))

(assert (=> b!1173926 m!1081811))

(declare-fun m!1081829 () Bool)

(assert (=> b!1173926 m!1081829))

(assert (=> b!1173926 m!1081829))

(declare-fun m!1081831 () Bool)

(assert (=> b!1173926 m!1081831))

(declare-fun m!1081833 () Bool)

(assert (=> b!1173926 m!1081833))

(check-sat tp_is_empty!29529 (not b!1173918) (not b_next!24999) (not b!1173928) (not mapNonEmpty!46121) (not b!1173929) (not b!1173926) (not b!1173913) (not b!1173924) (not b!1173932) (not b_lambda!20143) (not b!1173930) (not b!1173922) (not b!1173914) (not start!99420) (not b!1173920) b_and!40867 (not b!1173923))
(check-sat b_and!40867 (not b_next!24999))
