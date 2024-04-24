; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98596 () Bool)

(assert start!98596)

(declare-fun b_free!23965 () Bool)

(declare-fun b_next!23965 () Bool)

(assert (=> start!98596 (= b_free!23965 (not b_next!23965))))

(declare-fun tp!84606 () Bool)

(declare-fun b_and!38781 () Bool)

(assert (=> start!98596 (= tp!84606 b_and!38781)))

(declare-fun b!1134894 () Bool)

(declare-datatypes ((Unit!37111 0))(
  ( (Unit!37112) )
))
(declare-fun e!645995 () Unit!37111)

(declare-fun Unit!37113 () Unit!37111)

(assert (=> b!1134894 (= e!645995 Unit!37113)))

(declare-fun bm!49184 () Bool)

(declare-fun call!49189 () Unit!37111)

(declare-fun call!49194 () Unit!37111)

(assert (=> bm!49184 (= call!49189 call!49194)))

(declare-fun bm!49185 () Bool)

(declare-datatypes ((V!43121 0))(
  ( (V!43122 (val!14304 Int)) )
))
(declare-datatypes ((tuple2!18050 0))(
  ( (tuple2!18051 (_1!9036 (_ BitVec 64)) (_2!9036 V!43121)) )
))
(declare-datatypes ((List!24819 0))(
  ( (Nil!24816) (Cons!24815 (h!26033 tuple2!18050) (t!35768 List!24819)) )
))
(declare-datatypes ((ListLongMap!16027 0))(
  ( (ListLongMap!16028 (toList!8029 List!24819)) )
))
(declare-fun call!49188 () ListLongMap!16027)

(declare-fun call!49190 () ListLongMap!16027)

(assert (=> bm!49185 (= call!49188 call!49190)))

(declare-fun e!645996 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1134895 () Bool)

(declare-fun call!49193 () ListLongMap!16027)

(declare-fun call!49192 () ListLongMap!16027)

(declare-fun -!1183 (ListLongMap!16027 (_ BitVec 64)) ListLongMap!16027)

(assert (=> b!1134895 (= e!645996 (= call!49193 (-!1183 call!49192 k0!934)))))

(declare-fun c!111040 () Bool)

(declare-fun bm!49186 () Bool)

(declare-fun lt!504255 () ListLongMap!16027)

(declare-fun call!49191 () Bool)

(declare-fun contains!6564 (ListLongMap!16027 (_ BitVec 64)) Bool)

(assert (=> bm!49186 (= call!49191 (contains!6564 (ite c!111040 lt!504255 call!49188) k0!934))))

(declare-fun b!1134896 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!646005 () Bool)

(declare-fun lt!504260 () Bool)

(assert (=> b!1134896 (= e!646005 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504260) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134897 () Bool)

(declare-fun res!757399 () Bool)

(declare-fun e!646002 () Bool)

(assert (=> b!1134897 (=> (not res!757399) (not e!646002))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134897 (= res!757399 (validMask!0 mask!1564))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73893 0))(
  ( (array!73894 (arr!35591 (Array (_ BitVec 32) (_ BitVec 64))) (size!36128 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73893)

(declare-fun b!1134898 () Bool)

(declare-fun arrayContainsKey!0 (array!73893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134898 (= e!646005 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134899 () Bool)

(declare-fun res!757404 () Bool)

(assert (=> b!1134899 (=> (not res!757404) (not e!646002))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134899 (= res!757404 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36128 _keys!1208))))))

(declare-fun zeroValue!944 () V!43121)

(declare-fun c!111042 () Bool)

(declare-fun lt!504267 () ListLongMap!16027)

(declare-fun minValue!944 () V!43121)

(declare-fun bm!49187 () Bool)

(declare-fun addStillContains!715 (ListLongMap!16027 (_ BitVec 64) V!43121 (_ BitVec 64)) Unit!37111)

(assert (=> bm!49187 (= call!49194 (addStillContains!715 lt!504267 (ite (or c!111040 c!111042) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111040 c!111042) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1134900 () Bool)

(declare-fun e!646006 () Unit!37111)

(declare-fun lt!504262 () Unit!37111)

(assert (=> b!1134900 (= e!646006 lt!504262)))

(declare-fun lt!504259 () Unit!37111)

(assert (=> b!1134900 (= lt!504259 call!49194)))

(declare-fun +!3489 (ListLongMap!16027 tuple2!18050) ListLongMap!16027)

(assert (=> b!1134900 (= lt!504255 (+!3489 lt!504267 (tuple2!18051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1134900 call!49191))

(assert (=> b!1134900 (= lt!504262 (addStillContains!715 lt!504255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1134900 (contains!6564 call!49190 k0!934)))

(declare-fun b!1134901 () Bool)

(declare-fun res!757396 () Bool)

(assert (=> b!1134901 (=> (not res!757396) (not e!646002))))

(declare-datatypes ((ValueCell!13538 0))(
  ( (ValueCellFull!13538 (v!16937 V!43121)) (EmptyCell!13538) )
))
(declare-datatypes ((array!73895 0))(
  ( (array!73896 (arr!35592 (Array (_ BitVec 32) ValueCell!13538)) (size!36129 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73895)

(assert (=> b!1134901 (= res!757396 (and (= (size!36129 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36128 _keys!1208) (size!36129 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!49188 () Bool)

(declare-fun call!49187 () Bool)

(assert (=> bm!49188 (= call!49187 call!49191)))

(declare-fun b!1134902 () Bool)

(declare-fun res!757409 () Bool)

(declare-fun e!646001 () Bool)

(assert (=> b!1134902 (=> (not res!757409) (not e!646001))))

(declare-fun lt!504256 () array!73893)

(declare-datatypes ((List!24820 0))(
  ( (Nil!24817) (Cons!24816 (h!26034 (_ BitVec 64)) (t!35769 List!24820)) )
))
(declare-fun arrayNoDuplicates!0 (array!73893 (_ BitVec 32) List!24820) Bool)

(assert (=> b!1134902 (= res!757409 (arrayNoDuplicates!0 lt!504256 #b00000000000000000000000000000000 Nil!24817))))

(declare-fun b!1134903 () Bool)

(declare-fun e!646004 () Bool)

(declare-fun e!646000 () Bool)

(assert (=> b!1134903 (= e!646004 e!646000)))

(declare-fun res!757410 () Bool)

(assert (=> b!1134903 (=> res!757410 e!646000)))

(assert (=> b!1134903 (= res!757410 (not (contains!6564 lt!504267 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4543 (array!73893 array!73895 (_ BitVec 32) (_ BitVec 32) V!43121 V!43121 (_ BitVec 32) Int) ListLongMap!16027)

(assert (=> b!1134903 (= lt!504267 (getCurrentListMapNoExtraKeys!4543 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134904 () Bool)

(assert (=> b!1134904 (= e!646002 e!646001)))

(declare-fun res!757401 () Bool)

(assert (=> b!1134904 (=> (not res!757401) (not e!646001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73893 (_ BitVec 32)) Bool)

(assert (=> b!1134904 (= res!757401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504256 mask!1564))))

(assert (=> b!1134904 (= lt!504256 (array!73894 (store (arr!35591 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36128 _keys!1208)))))

(declare-fun b!1134905 () Bool)

(declare-fun res!757398 () Bool)

(assert (=> b!1134905 (=> (not res!757398) (not e!646002))))

(assert (=> b!1134905 (= res!757398 (= (select (arr!35591 _keys!1208) i!673) k0!934))))

(declare-fun res!757402 () Bool)

(assert (=> start!98596 (=> (not res!757402) (not e!646002))))

(assert (=> start!98596 (= res!757402 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36128 _keys!1208))))))

(assert (=> start!98596 e!646002))

(declare-fun tp_is_empty!28495 () Bool)

(assert (=> start!98596 tp_is_empty!28495))

(declare-fun array_inv!27350 (array!73893) Bool)

(assert (=> start!98596 (array_inv!27350 _keys!1208)))

(assert (=> start!98596 true))

(assert (=> start!98596 tp!84606))

(declare-fun e!645998 () Bool)

(declare-fun array_inv!27351 (array!73895) Bool)

(assert (=> start!98596 (and (array_inv!27351 _values!996) e!645998)))

(declare-fun b!1134906 () Bool)

(declare-fun e!645993 () Bool)

(assert (=> b!1134906 (= e!645993 e!646004)))

(declare-fun res!757407 () Bool)

(assert (=> b!1134906 (=> res!757407 e!646004)))

(assert (=> b!1134906 (= res!757407 (not (= (select (arr!35591 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1134906 e!645996))

(declare-fun c!111041 () Bool)

(assert (=> b!1134906 (= c!111041 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!504265 () Unit!37111)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!439 (array!73893 array!73895 (_ BitVec 32) (_ BitVec 32) V!43121 V!43121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37111)

(assert (=> b!1134906 (= lt!504265 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!439 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!645999 () Bool)

(declare-fun b!1134907 () Bool)

(assert (=> b!1134907 (= e!645999 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1134908 () Bool)

(declare-fun e!646003 () Bool)

(assert (=> b!1134908 (= e!646003 e!645993)))

(declare-fun res!757403 () Bool)

(assert (=> b!1134908 (=> res!757403 e!645993)))

(assert (=> b!1134908 (= res!757403 (not (= from!1455 i!673)))))

(declare-fun lt!504254 () array!73895)

(declare-fun lt!504258 () ListLongMap!16027)

(assert (=> b!1134908 (= lt!504258 (getCurrentListMapNoExtraKeys!4543 lt!504256 lt!504254 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2601 (Int (_ BitVec 64)) V!43121)

(assert (=> b!1134908 (= lt!504254 (array!73896 (store (arr!35592 _values!996) i!673 (ValueCellFull!13538 (dynLambda!2601 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36129 _values!996)))))

(declare-fun lt!504257 () ListLongMap!16027)

(assert (=> b!1134908 (= lt!504257 (getCurrentListMapNoExtraKeys!4543 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1134909 () Bool)

(assert (=> b!1134909 (= e!646001 (not e!646003))))

(declare-fun res!757405 () Bool)

(assert (=> b!1134909 (=> res!757405 e!646003)))

(assert (=> b!1134909 (= res!757405 (bvsgt from!1455 i!673))))

(assert (=> b!1134909 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!504263 () Unit!37111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73893 (_ BitVec 64) (_ BitVec 32)) Unit!37111)

(assert (=> b!1134909 (= lt!504263 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44567 () Bool)

(declare-fun mapRes!44567 () Bool)

(assert (=> mapIsEmpty!44567 mapRes!44567))

(declare-fun b!1134910 () Bool)

(declare-fun e!645997 () Bool)

(assert (=> b!1134910 (= e!645998 (and e!645997 mapRes!44567))))

(declare-fun condMapEmpty!44567 () Bool)

(declare-fun mapDefault!44567 () ValueCell!13538)

(assert (=> b!1134910 (= condMapEmpty!44567 (= (arr!35592 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13538)) mapDefault!44567)))))

(declare-fun b!1134911 () Bool)

(assert (=> b!1134911 (= e!645997 tp_is_empty!28495)))

(declare-fun b!1134912 () Bool)

(declare-fun e!645991 () Unit!37111)

(assert (=> b!1134912 (= e!646006 e!645991)))

(assert (=> b!1134912 (= c!111042 (and (not lt!504260) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44567 () Bool)

(declare-fun tp!84605 () Bool)

(declare-fun e!645994 () Bool)

(assert (=> mapNonEmpty!44567 (= mapRes!44567 (and tp!84605 e!645994))))

(declare-fun mapRest!44567 () (Array (_ BitVec 32) ValueCell!13538))

(declare-fun mapValue!44567 () ValueCell!13538)

(declare-fun mapKey!44567 () (_ BitVec 32))

(assert (=> mapNonEmpty!44567 (= (arr!35592 _values!996) (store mapRest!44567 mapKey!44567 mapValue!44567))))

(declare-fun bm!49189 () Bool)

(assert (=> bm!49189 (= call!49190 (+!3489 (ite c!111040 lt!504255 lt!504267) (ite c!111040 (tuple2!18051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111042 (tuple2!18051 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18051 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1134913 () Bool)

(assert (=> b!1134913 (= e!646000 true)))

(assert (=> b!1134913 e!645999))

(declare-fun res!757408 () Bool)

(assert (=> b!1134913 (=> (not res!757408) (not e!645999))))

(assert (=> b!1134913 (= res!757408 e!646005)))

(declare-fun c!111039 () Bool)

(assert (=> b!1134913 (= c!111039 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!504268 () Unit!37111)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!325 (array!73893 array!73895 (_ BitVec 32) (_ BitVec 32) V!43121 V!43121 (_ BitVec 64) (_ BitVec 32) Int) Unit!37111)

(assert (=> b!1134913 (= lt!504268 (lemmaListMapContainsThenArrayContainsFrom!325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!504261 () Unit!37111)

(assert (=> b!1134913 (= lt!504261 e!646006)))

(assert (=> b!1134913 (= c!111040 (and (not lt!504260) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1134913 (= lt!504260 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1134914 () Bool)

(declare-fun res!757400 () Bool)

(assert (=> b!1134914 (=> (not res!757400) (not e!646002))))

(assert (=> b!1134914 (= res!757400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1134915 () Bool)

(declare-fun res!757406 () Bool)

(assert (=> b!1134915 (=> (not res!757406) (not e!646002))))

(assert (=> b!1134915 (= res!757406 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24817))))

(declare-fun bm!49190 () Bool)

(assert (=> bm!49190 (= call!49192 (getCurrentListMapNoExtraKeys!4543 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134916 () Bool)

(declare-fun res!757397 () Bool)

(assert (=> b!1134916 (=> (not res!757397) (not e!646002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1134916 (= res!757397 (validKeyInArray!0 k0!934))))

(declare-fun b!1134917 () Bool)

(assert (=> b!1134917 (= e!645996 (= call!49193 call!49192))))

(declare-fun b!1134918 () Bool)

(assert (=> b!1134918 call!49187))

(declare-fun lt!504266 () Unit!37111)

(assert (=> b!1134918 (= lt!504266 call!49189)))

(assert (=> b!1134918 (= e!645991 lt!504266)))

(declare-fun b!1134919 () Bool)

(assert (=> b!1134919 (= e!645994 tp_is_empty!28495)))

(declare-fun bm!49191 () Bool)

(assert (=> bm!49191 (= call!49193 (getCurrentListMapNoExtraKeys!4543 lt!504256 lt!504254 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134920 () Bool)

(declare-fun lt!504264 () Unit!37111)

(assert (=> b!1134920 (= e!645995 lt!504264)))

(assert (=> b!1134920 (= lt!504264 call!49189)))

(assert (=> b!1134920 call!49187))

(declare-fun b!1134921 () Bool)

(declare-fun c!111038 () Bool)

(assert (=> b!1134921 (= c!111038 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!504260))))

(assert (=> b!1134921 (= e!645991 e!645995)))

(assert (= (and start!98596 res!757402) b!1134897))

(assert (= (and b!1134897 res!757399) b!1134901))

(assert (= (and b!1134901 res!757396) b!1134914))

(assert (= (and b!1134914 res!757400) b!1134915))

(assert (= (and b!1134915 res!757406) b!1134899))

(assert (= (and b!1134899 res!757404) b!1134916))

(assert (= (and b!1134916 res!757397) b!1134905))

(assert (= (and b!1134905 res!757398) b!1134904))

(assert (= (and b!1134904 res!757401) b!1134902))

(assert (= (and b!1134902 res!757409) b!1134909))

(assert (= (and b!1134909 (not res!757405)) b!1134908))

(assert (= (and b!1134908 (not res!757403)) b!1134906))

(assert (= (and b!1134906 c!111041) b!1134895))

(assert (= (and b!1134906 (not c!111041)) b!1134917))

(assert (= (or b!1134895 b!1134917) bm!49191))

(assert (= (or b!1134895 b!1134917) bm!49190))

(assert (= (and b!1134906 (not res!757407)) b!1134903))

(assert (= (and b!1134903 (not res!757410)) b!1134913))

(assert (= (and b!1134913 c!111040) b!1134900))

(assert (= (and b!1134913 (not c!111040)) b!1134912))

(assert (= (and b!1134912 c!111042) b!1134918))

(assert (= (and b!1134912 (not c!111042)) b!1134921))

(assert (= (and b!1134921 c!111038) b!1134920))

(assert (= (and b!1134921 (not c!111038)) b!1134894))

(assert (= (or b!1134918 b!1134920) bm!49184))

(assert (= (or b!1134918 b!1134920) bm!49185))

(assert (= (or b!1134918 b!1134920) bm!49188))

(assert (= (or b!1134900 bm!49188) bm!49186))

(assert (= (or b!1134900 bm!49184) bm!49187))

(assert (= (or b!1134900 bm!49185) bm!49189))

(assert (= (and b!1134913 c!111039) b!1134898))

(assert (= (and b!1134913 (not c!111039)) b!1134896))

(assert (= (and b!1134913 res!757408) b!1134907))

(assert (= (and b!1134910 condMapEmpty!44567) mapIsEmpty!44567))

(assert (= (and b!1134910 (not condMapEmpty!44567)) mapNonEmpty!44567))

(get-info :version)

(assert (= (and mapNonEmpty!44567 ((_ is ValueCellFull!13538) mapValue!44567)) b!1134919))

(assert (= (and b!1134910 ((_ is ValueCellFull!13538) mapDefault!44567)) b!1134911))

(assert (= start!98596 b!1134910))

(declare-fun b_lambda!19065 () Bool)

(assert (=> (not b_lambda!19065) (not b!1134908)))

(declare-fun t!35767 () Bool)

(declare-fun tb!8769 () Bool)

(assert (=> (and start!98596 (= defaultEntry!1004 defaultEntry!1004) t!35767) tb!8769))

(declare-fun result!18111 () Bool)

(assert (=> tb!8769 (= result!18111 tp_is_empty!28495)))

(assert (=> b!1134908 t!35767))

(declare-fun b_and!38783 () Bool)

(assert (= b_and!38781 (and (=> t!35767 result!18111) b_and!38783)))

(declare-fun m!1048213 () Bool)

(assert (=> b!1134902 m!1048213))

(declare-fun m!1048215 () Bool)

(assert (=> b!1134908 m!1048215))

(declare-fun m!1048217 () Bool)

(assert (=> b!1134908 m!1048217))

(declare-fun m!1048219 () Bool)

(assert (=> b!1134908 m!1048219))

(declare-fun m!1048221 () Bool)

(assert (=> b!1134908 m!1048221))

(declare-fun m!1048223 () Bool)

(assert (=> b!1134914 m!1048223))

(declare-fun m!1048225 () Bool)

(assert (=> b!1134909 m!1048225))

(declare-fun m!1048227 () Bool)

(assert (=> b!1134909 m!1048227))

(declare-fun m!1048229 () Bool)

(assert (=> b!1134898 m!1048229))

(declare-fun m!1048231 () Bool)

(assert (=> bm!49189 m!1048231))

(assert (=> b!1134907 m!1048229))

(declare-fun m!1048233 () Bool)

(assert (=> bm!49186 m!1048233))

(declare-fun m!1048235 () Bool)

(assert (=> bm!49191 m!1048235))

(declare-fun m!1048237 () Bool)

(assert (=> b!1134916 m!1048237))

(declare-fun m!1048239 () Bool)

(assert (=> bm!49187 m!1048239))

(declare-fun m!1048241 () Bool)

(assert (=> mapNonEmpty!44567 m!1048241))

(declare-fun m!1048243 () Bool)

(assert (=> b!1134913 m!1048243))

(declare-fun m!1048245 () Bool)

(assert (=> b!1134906 m!1048245))

(declare-fun m!1048247 () Bool)

(assert (=> b!1134906 m!1048247))

(declare-fun m!1048249 () Bool)

(assert (=> b!1134895 m!1048249))

(declare-fun m!1048251 () Bool)

(assert (=> start!98596 m!1048251))

(declare-fun m!1048253 () Bool)

(assert (=> start!98596 m!1048253))

(declare-fun m!1048255 () Bool)

(assert (=> b!1134897 m!1048255))

(declare-fun m!1048257 () Bool)

(assert (=> b!1134904 m!1048257))

(declare-fun m!1048259 () Bool)

(assert (=> b!1134904 m!1048259))

(declare-fun m!1048261 () Bool)

(assert (=> b!1134900 m!1048261))

(declare-fun m!1048263 () Bool)

(assert (=> b!1134900 m!1048263))

(declare-fun m!1048265 () Bool)

(assert (=> b!1134900 m!1048265))

(declare-fun m!1048267 () Bool)

(assert (=> b!1134915 m!1048267))

(declare-fun m!1048269 () Bool)

(assert (=> b!1134903 m!1048269))

(declare-fun m!1048271 () Bool)

(assert (=> b!1134903 m!1048271))

(assert (=> bm!49190 m!1048271))

(declare-fun m!1048273 () Bool)

(assert (=> b!1134905 m!1048273))

(check-sat (not b!1134898) (not b!1134906) (not bm!49191) (not b!1134897) (not b!1134895) (not b!1134903) (not bm!49190) (not bm!49187) (not bm!49186) (not b!1134907) (not b!1134908) (not b_next!23965) (not bm!49189) (not b!1134909) (not b!1134915) (not b!1134916) (not start!98596) (not mapNonEmpty!44567) (not b!1134902) (not b!1134900) (not b_lambda!19065) (not b!1134914) (not b!1134913) (not b!1134904) b_and!38783 tp_is_empty!28495)
(check-sat b_and!38783 (not b_next!23965))
