; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98352 () Bool)

(assert start!98352)

(declare-fun b_free!23957 () Bool)

(declare-fun b_next!23957 () Bool)

(assert (=> start!98352 (= b_free!23957 (not b_next!23957))))

(declare-fun tp!84582 () Bool)

(declare-fun b_and!38763 () Bool)

(assert (=> start!98352 (= tp!84582 b_and!38763)))

(declare-datatypes ((V!43109 0))(
  ( (V!43110 (val!14300 Int)) )
))
(declare-fun zeroValue!944 () V!43109)

(declare-fun bm!49023 () Bool)

(declare-datatypes ((tuple2!18032 0))(
  ( (tuple2!18033 (_1!9027 (_ BitVec 64)) (_2!9027 V!43109)) )
))
(declare-datatypes ((List!24794 0))(
  ( (Nil!24791) (Cons!24790 (h!25999 tuple2!18032) (t!35743 List!24794)) )
))
(declare-datatypes ((ListLongMap!16001 0))(
  ( (ListLongMap!16002 (toList!8016 List!24794)) )
))
(declare-fun lt!503593 () ListLongMap!16001)

(declare-fun lt!503601 () ListLongMap!16001)

(declare-fun c!110583 () Bool)

(declare-fun c!110582 () Bool)

(declare-fun call!49033 () ListLongMap!16001)

(declare-fun minValue!944 () V!43109)

(declare-fun +!3459 (ListLongMap!16001 tuple2!18032) ListLongMap!16001)

(assert (=> bm!49023 (= call!49033 (+!3459 (ite c!110583 lt!503601 lt!503593) (ite c!110583 (tuple2!18033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110582 (tuple2!18033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!49024 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13534 0))(
  ( (ValueCellFull!13534 (v!16937 V!43109)) (EmptyCell!13534) )
))
(declare-datatypes ((array!73835 0))(
  ( (array!73836 (arr!35568 (Array (_ BitVec 32) ValueCell!13534)) (size!36104 (_ BitVec 32))) )
))
(declare-fun lt!503595 () array!73835)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!73837 0))(
  ( (array!73838 (arr!35569 (Array (_ BitVec 32) (_ BitVec 64))) (size!36105 (_ BitVec 32))) )
))
(declare-fun lt!503602 () array!73837)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun call!49030 () ListLongMap!16001)

(declare-fun getCurrentListMapNoExtraKeys!4503 (array!73837 array!73835 (_ BitVec 32) (_ BitVec 32) V!43109 V!43109 (_ BitVec 32) Int) ListLongMap!16001)

(assert (=> bm!49024 (= call!49030 (getCurrentListMapNoExtraKeys!4503 lt!503602 lt!503595 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133261 () Bool)

(declare-fun res!756708 () Bool)

(declare-fun e!644979 () Bool)

(assert (=> b!1133261 (=> (not res!756708) (not e!644979))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!73837)

(assert (=> b!1133261 (= res!756708 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36105 _keys!1208))))))

(declare-datatypes ((Unit!37134 0))(
  ( (Unit!37135) )
))
(declare-fun call!49026 () Unit!37134)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!49025 () Bool)

(declare-fun addStillContains!722 (ListLongMap!16001 (_ BitVec 64) V!43109 (_ BitVec 64)) Unit!37134)

(assert (=> bm!49025 (= call!49026 (addStillContains!722 lt!503593 (ite (or c!110583 c!110582) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110583 c!110582) zeroValue!944 minValue!944) k!934))))

(declare-fun bm!49026 () Bool)

(declare-fun call!49028 () Unit!37134)

(assert (=> bm!49026 (= call!49028 call!49026)))

(declare-fun e!644973 () Bool)

(declare-fun b!1133262 () Bool)

(declare-fun arrayContainsKey!0 (array!73837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133262 (= e!644973 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49027 () Bool)

(declare-fun call!49031 () ListLongMap!16001)

(assert (=> bm!49027 (= call!49031 call!49033)))

(declare-fun b!1133263 () Bool)

(declare-fun res!756718 () Bool)

(assert (=> b!1133263 (=> (not res!756718) (not e!644979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133263 (= res!756718 (validKeyInArray!0 k!934))))

(declare-fun b!1133264 () Bool)

(declare-fun res!756721 () Bool)

(assert (=> b!1133264 (=> (not res!756721) (not e!644979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73837 (_ BitVec 32)) Bool)

(assert (=> b!1133264 (= res!756721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1133265 () Bool)

(declare-fun e!644970 () Bool)

(declare-fun tp_is_empty!28487 () Bool)

(assert (=> b!1133265 (= e!644970 tp_is_empty!28487)))

(declare-fun b!1133266 () Bool)

(declare-fun e!644969 () Bool)

(assert (=> b!1133266 (= e!644969 tp_is_empty!28487)))

(declare-fun b!1133267 () Bool)

(declare-fun e!644975 () Bool)

(declare-fun e!644972 () Bool)

(assert (=> b!1133267 (= e!644975 (not e!644972))))

(declare-fun res!756710 () Bool)

(assert (=> b!1133267 (=> res!756710 e!644972)))

(assert (=> b!1133267 (= res!756710 (bvsgt from!1455 i!673))))

(assert (=> b!1133267 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!503604 () Unit!37134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73837 (_ BitVec 64) (_ BitVec 32)) Unit!37134)

(assert (=> b!1133267 (= lt!503604 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1133268 () Bool)

(declare-fun e!644971 () Bool)

(declare-fun call!49027 () ListLongMap!16001)

(assert (=> b!1133268 (= e!644971 (= call!49030 call!49027))))

(declare-fun b!1133269 () Bool)

(declare-fun e!644982 () Unit!37134)

(declare-fun lt!503597 () Unit!37134)

(assert (=> b!1133269 (= e!644982 lt!503597)))

(declare-fun lt!503598 () Unit!37134)

(assert (=> b!1133269 (= lt!503598 call!49026)))

(assert (=> b!1133269 (= lt!503601 (+!3459 lt!503593 (tuple2!18033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!49029 () Bool)

(assert (=> b!1133269 call!49029))

(assert (=> b!1133269 (= lt!503597 (addStillContains!722 lt!503601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun contains!6542 (ListLongMap!16001 (_ BitVec 64)) Bool)

(assert (=> b!1133269 (contains!6542 call!49033 k!934)))

(declare-fun b!1133270 () Bool)

(declare-fun e!644967 () Unit!37134)

(declare-fun lt!503599 () Unit!37134)

(assert (=> b!1133270 (= e!644967 lt!503599)))

(assert (=> b!1133270 (= lt!503599 call!49028)))

(declare-fun call!49032 () Bool)

(assert (=> b!1133270 call!49032))

(declare-fun b!1133271 () Bool)

(declare-fun e!644978 () Bool)

(assert (=> b!1133271 (= e!644972 e!644978)))

(declare-fun res!756722 () Bool)

(assert (=> b!1133271 (=> res!756722 e!644978)))

(assert (=> b!1133271 (= res!756722 (not (= from!1455 i!673)))))

(declare-fun lt!503594 () ListLongMap!16001)

(assert (=> b!1133271 (= lt!503594 (getCurrentListMapNoExtraKeys!4503 lt!503602 lt!503595 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73835)

(declare-fun dynLambda!2572 (Int (_ BitVec 64)) V!43109)

(assert (=> b!1133271 (= lt!503595 (array!73836 (store (arr!35568 _values!996) i!673 (ValueCellFull!13534 (dynLambda!2572 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36104 _values!996)))))

(declare-fun lt!503603 () ListLongMap!16001)

(assert (=> b!1133271 (= lt!503603 (getCurrentListMapNoExtraKeys!4503 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!49028 () Bool)

(assert (=> bm!49028 (= call!49027 (getCurrentListMapNoExtraKeys!4503 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44555 () Bool)

(declare-fun mapRes!44555 () Bool)

(assert (=> mapIsEmpty!44555 mapRes!44555))

(declare-fun b!1133272 () Bool)

(declare-fun e!644976 () Unit!37134)

(assert (=> b!1133272 (= e!644982 e!644976)))

(declare-fun lt!503600 () Bool)

(assert (=> b!1133272 (= c!110582 (and (not lt!503600) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133273 () Bool)

(declare-fun -!1185 (ListLongMap!16001 (_ BitVec 64)) ListLongMap!16001)

(assert (=> b!1133273 (= e!644971 (= call!49030 (-!1185 call!49027 k!934)))))

(declare-fun b!1133275 () Bool)

(assert (=> b!1133275 call!49032))

(declare-fun lt!503590 () Unit!37134)

(assert (=> b!1133275 (= lt!503590 call!49028)))

(assert (=> b!1133275 (= e!644976 lt!503590)))

(declare-fun res!756714 () Bool)

(assert (=> start!98352 (=> (not res!756714) (not e!644979))))

(assert (=> start!98352 (= res!756714 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36105 _keys!1208))))))

(assert (=> start!98352 e!644979))

(assert (=> start!98352 tp_is_empty!28487))

(declare-fun array_inv!27282 (array!73837) Bool)

(assert (=> start!98352 (array_inv!27282 _keys!1208)))

(assert (=> start!98352 true))

(assert (=> start!98352 tp!84582))

(declare-fun e!644977 () Bool)

(declare-fun array_inv!27283 (array!73835) Bool)

(assert (=> start!98352 (and (array_inv!27283 _values!996) e!644977)))

(declare-fun b!1133274 () Bool)

(declare-fun res!756712 () Bool)

(assert (=> b!1133274 (=> (not res!756712) (not e!644979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133274 (= res!756712 (validMask!0 mask!1564))))

(declare-fun b!1133276 () Bool)

(declare-fun res!756711 () Bool)

(assert (=> b!1133276 (=> (not res!756711) (not e!644975))))

(declare-datatypes ((List!24795 0))(
  ( (Nil!24792) (Cons!24791 (h!26000 (_ BitVec 64)) (t!35744 List!24795)) )
))
(declare-fun arrayNoDuplicates!0 (array!73837 (_ BitVec 32) List!24795) Bool)

(assert (=> b!1133276 (= res!756711 (arrayNoDuplicates!0 lt!503602 #b00000000000000000000000000000000 Nil!24792))))

(declare-fun b!1133277 () Bool)

(declare-fun res!756709 () Bool)

(assert (=> b!1133277 (=> (not res!756709) (not e!644979))))

(assert (=> b!1133277 (= res!756709 (and (= (size!36104 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36105 _keys!1208) (size!36104 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!644968 () Bool)

(declare-fun b!1133278 () Bool)

(assert (=> b!1133278 (= e!644968 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133279 () Bool)

(assert (=> b!1133279 (= e!644979 e!644975)))

(declare-fun res!756720 () Bool)

(assert (=> b!1133279 (=> (not res!756720) (not e!644975))))

(assert (=> b!1133279 (= res!756720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503602 mask!1564))))

(assert (=> b!1133279 (= lt!503602 (array!73838 (store (arr!35569 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36105 _keys!1208)))))

(declare-fun b!1133280 () Bool)

(declare-fun Unit!37136 () Unit!37134)

(assert (=> b!1133280 (= e!644967 Unit!37136)))

(declare-fun b!1133281 () Bool)

(assert (=> b!1133281 (= e!644977 (and e!644969 mapRes!44555))))

(declare-fun condMapEmpty!44555 () Bool)

(declare-fun mapDefault!44555 () ValueCell!13534)

