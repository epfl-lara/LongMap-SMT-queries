; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98444 () Bool)

(assert start!98444)

(declare-fun b_free!24049 () Bool)

(declare-fun b_next!24049 () Bool)

(assert (=> start!98444 (= b_free!24049 (not b_next!24049))))

(declare-fun tp!84857 () Bool)

(declare-fun b_and!38947 () Bool)

(assert (=> start!98444 (= tp!84857 b_and!38947)))

(declare-fun b!1137489 () Bool)

(declare-fun call!50135 () Bool)

(assert (=> b!1137489 call!50135))

(declare-datatypes ((Unit!37261 0))(
  ( (Unit!37262) )
))
(declare-fun lt!505911 () Unit!37261)

(declare-fun call!50134 () Unit!37261)

(assert (=> b!1137489 (= lt!505911 call!50134)))

(declare-fun e!647260 () Unit!37261)

(assert (=> b!1137489 (= e!647260 lt!505911)))

(declare-fun b!1137490 () Bool)

(declare-fun res!759002 () Bool)

(declare-fun e!647267 () Bool)

(assert (=> b!1137490 (=> (not res!759002) (not e!647267))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137490 (= res!759002 (validMask!0 mask!1564))))

(declare-fun b!1137491 () Bool)

(declare-fun res!759000 () Bool)

(assert (=> b!1137491 (=> (not res!759000) (not e!647267))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74019 0))(
  ( (array!74020 (arr!35660 (Array (_ BitVec 32) (_ BitVec 64))) (size!36196 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74019)

(assert (=> b!1137491 (= res!759000 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36196 _keys!1208))))))

(declare-fun mapNonEmpty!44693 () Bool)

(declare-fun mapRes!44693 () Bool)

(declare-fun tp!84858 () Bool)

(declare-fun e!647261 () Bool)

(assert (=> mapNonEmpty!44693 (= mapRes!44693 (and tp!84858 e!647261))))

(declare-datatypes ((V!43233 0))(
  ( (V!43234 (val!14346 Int)) )
))
(declare-datatypes ((ValueCell!13580 0))(
  ( (ValueCellFull!13580 (v!16983 V!43233)) (EmptyCell!13580) )
))
(declare-fun mapValue!44693 () ValueCell!13580)

(declare-fun mapRest!44693 () (Array (_ BitVec 32) ValueCell!13580))

(declare-datatypes ((array!74021 0))(
  ( (array!74022 (arr!35661 (Array (_ BitVec 32) ValueCell!13580)) (size!36197 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74021)

(declare-fun mapKey!44693 () (_ BitVec 32))

(assert (=> mapNonEmpty!44693 (= (arr!35661 _values!996) (store mapRest!44693 mapKey!44693 mapValue!44693))))

(declare-fun e!647270 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1137492 () Bool)

(declare-fun arrayContainsKey!0 (array!74019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137492 (= e!647270 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137493 () Bool)

(declare-fun e!647256 () Bool)

(declare-fun e!647265 () Bool)

(assert (=> b!1137493 (= e!647256 e!647265)))

(declare-fun res!758993 () Bool)

(assert (=> b!1137493 (=> res!758993 e!647265)))

(assert (=> b!1137493 (= res!758993 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43233)

(declare-fun lt!505909 () array!74019)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!505910 () array!74021)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18120 0))(
  ( (tuple2!18121 (_1!9071 (_ BitVec 64)) (_2!9071 V!43233)) )
))
(declare-datatypes ((List!24878 0))(
  ( (Nil!24875) (Cons!24874 (h!26083 tuple2!18120) (t!35919 List!24878)) )
))
(declare-datatypes ((ListLongMap!16089 0))(
  ( (ListLongMap!16090 (toList!8060 List!24878)) )
))
(declare-fun lt!505913 () ListLongMap!16089)

(declare-fun minValue!944 () V!43233)

(declare-fun getCurrentListMapNoExtraKeys!4544 (array!74019 array!74021 (_ BitVec 32) (_ BitVec 32) V!43233 V!43233 (_ BitVec 32) Int) ListLongMap!16089)

(assert (=> b!1137493 (= lt!505913 (getCurrentListMapNoExtraKeys!4544 lt!505909 lt!505910 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2599 (Int (_ BitVec 64)) V!43233)

(assert (=> b!1137493 (= lt!505910 (array!74022 (store (arr!35661 _values!996) i!673 (ValueCellFull!13580 (dynLambda!2599 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36197 _values!996)))))

(declare-fun lt!505919 () ListLongMap!16089)

(assert (=> b!1137493 (= lt!505919 (getCurrentListMapNoExtraKeys!4544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!505914 () ListLongMap!16089)

(declare-fun c!111300 () Bool)

(declare-fun call!50131 () ListLongMap!16089)

(declare-fun call!50136 () Bool)

(declare-fun bm!50127 () Bool)

(declare-fun contains!6598 (ListLongMap!16089 (_ BitVec 64)) Bool)

(assert (=> bm!50127 (= call!50136 (contains!6598 (ite c!111300 lt!505914 call!50131) k!934))))

(declare-fun b!1137494 () Bool)

(declare-fun tp_is_empty!28579 () Bool)

(assert (=> b!1137494 (= e!647261 tp_is_empty!28579)))

(declare-fun bm!50128 () Bool)

(declare-fun call!50137 () ListLongMap!16089)

(assert (=> bm!50128 (= call!50131 call!50137)))

(declare-fun b!1137495 () Bool)

(declare-fun e!647269 () Unit!37261)

(declare-fun lt!505920 () Unit!37261)

(assert (=> b!1137495 (= e!647269 lt!505920)))

(assert (=> b!1137495 (= lt!505920 call!50134)))

(assert (=> b!1137495 call!50135))

(declare-fun b!1137496 () Bool)

(declare-fun c!111301 () Bool)

(declare-fun lt!505917 () Bool)

(assert (=> b!1137496 (= c!111301 (and (not lt!505917) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!647259 () Unit!37261)

(assert (=> b!1137496 (= e!647259 e!647269)))

(declare-fun bm!50129 () Bool)

(assert (=> bm!50129 (= call!50135 call!50136)))

(declare-fun b!1137497 () Bool)

(declare-fun res!758995 () Bool)

(assert (=> b!1137497 (=> (not res!758995) (not e!647267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74019 (_ BitVec 32)) Bool)

(assert (=> b!1137497 (= res!758995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1137498 () Bool)

(declare-fun res!758999 () Bool)

(assert (=> b!1137498 (=> (not res!758999) (not e!647267))))

(assert (=> b!1137498 (= res!758999 (and (= (size!36197 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36196 _keys!1208) (size!36197 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137499 () Bool)

(declare-fun e!647266 () Bool)

(assert (=> b!1137499 (= e!647267 e!647266)))

(declare-fun res!758992 () Bool)

(assert (=> b!1137499 (=> (not res!758992) (not e!647266))))

(assert (=> b!1137499 (= res!758992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505909 mask!1564))))

(assert (=> b!1137499 (= lt!505909 (array!74020 (store (arr!35660 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36196 _keys!1208)))))

(declare-fun b!1137500 () Bool)

(declare-fun e!647257 () Bool)

(assert (=> b!1137500 (= e!647257 tp_is_empty!28579)))

(declare-fun b!1137501 () Bool)

(declare-fun e!647262 () Bool)

(assert (=> b!1137501 (= e!647265 e!647262)))

(declare-fun res!759001 () Bool)

(assert (=> b!1137501 (=> res!759001 e!647262)))

(assert (=> b!1137501 (= res!759001 (not (= (select (arr!35660 _keys!1208) from!1455) k!934)))))

(declare-fun e!647268 () Bool)

(assert (=> b!1137501 e!647268))

(declare-fun c!111304 () Bool)

(assert (=> b!1137501 (= c!111304 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505926 () Unit!37261)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!464 (array!74019 array!74021 (_ BitVec 32) (_ BitVec 32) V!43233 V!43233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37261)

(assert (=> b!1137501 (= lt!505926 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137502 () Bool)

(assert (=> b!1137502 (contains!6598 call!50137 k!934)))

(declare-fun lt!505916 () Unit!37261)

(declare-fun addStillContains!755 (ListLongMap!16089 (_ BitVec 64) V!43233 (_ BitVec 64)) Unit!37261)

(assert (=> b!1137502 (= lt!505916 (addStillContains!755 lt!505914 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1137502 call!50136))

(declare-fun lt!505921 () ListLongMap!16089)

(declare-fun +!3495 (ListLongMap!16089 tuple2!18120) ListLongMap!16089)

(assert (=> b!1137502 (= lt!505914 (+!3495 lt!505921 (tuple2!18121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!505922 () Unit!37261)

(declare-fun call!50133 () Unit!37261)

(assert (=> b!1137502 (= lt!505922 call!50133)))

(assert (=> b!1137502 (= e!647259 lt!505916)))

(declare-fun b!1137503 () Bool)

(declare-fun res!759003 () Bool)

(assert (=> b!1137503 (=> (not res!759003) (not e!647267))))

(assert (=> b!1137503 (= res!759003 (= (select (arr!35660 _keys!1208) i!673) k!934))))

(declare-fun b!1137504 () Bool)

(assert (=> b!1137504 (= e!647266 (not e!647256))))

(declare-fun res!758994 () Bool)

(assert (=> b!1137504 (=> res!758994 e!647256)))

(assert (=> b!1137504 (= res!758994 (bvsgt from!1455 i!673))))

(assert (=> b!1137504 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!505925 () Unit!37261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74019 (_ BitVec 64) (_ BitVec 32)) Unit!37261)

(assert (=> b!1137504 (= lt!505925 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1137505 () Bool)

(assert (=> b!1137505 (= e!647269 e!647260)))

(declare-fun c!111299 () Bool)

(assert (=> b!1137505 (= c!111299 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505917))))

(declare-fun bm!50130 () Bool)

(assert (=> bm!50130 (= call!50137 (+!3495 (ite c!111300 lt!505914 lt!505921) (ite c!111300 (tuple2!18121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111301 (tuple2!18121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1137506 () Bool)

(declare-fun e!647264 () Bool)

(assert (=> b!1137506 (= e!647264 (and e!647257 mapRes!44693))))

(declare-fun condMapEmpty!44693 () Bool)

(declare-fun mapDefault!44693 () ValueCell!13580)

