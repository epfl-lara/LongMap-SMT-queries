; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98376 () Bool)

(assert start!98376)

(declare-fun b_free!23981 () Bool)

(declare-fun b_next!23981 () Bool)

(assert (=> start!98376 (= b_free!23981 (not b_next!23981))))

(declare-fun tp!84654 () Bool)

(declare-fun b_and!38811 () Bool)

(assert (=> start!98376 (= tp!84654 b_and!38811)))

(declare-datatypes ((array!73883 0))(
  ( (array!73884 (arr!35592 (Array (_ BitVec 32) (_ BitVec 64))) (size!36128 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73883)

(declare-fun e!645555 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1134317 () Bool)

(declare-fun arrayContainsKey!0 (array!73883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1134317 (= e!645555 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!504155 () Bool)

(declare-fun b!1134318 () Bool)

(assert (=> b!1134318 (= e!645555 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504155) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!757281 () Bool)

(declare-fun e!645561 () Bool)

(assert (=> start!98376 (=> (not res!757281) (not e!645561))))

(assert (=> start!98376 (= res!757281 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36128 _keys!1208))))))

(assert (=> start!98376 e!645561))

(declare-fun tp_is_empty!28511 () Bool)

(assert (=> start!98376 tp_is_empty!28511))

(declare-fun array_inv!27298 (array!73883) Bool)

(assert (=> start!98376 (array_inv!27298 _keys!1208)))

(assert (=> start!98376 true))

(assert (=> start!98376 tp!84654))

(declare-datatypes ((V!43141 0))(
  ( (V!43142 (val!14312 Int)) )
))
(declare-datatypes ((ValueCell!13546 0))(
  ( (ValueCellFull!13546 (v!16949 V!43141)) (EmptyCell!13546) )
))
(declare-datatypes ((array!73885 0))(
  ( (array!73886 (arr!35593 (Array (_ BitVec 32) ValueCell!13546)) (size!36129 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73885)

(declare-fun e!645558 () Bool)

(declare-fun array_inv!27299 (array!73885) Bool)

(assert (=> start!98376 (and (array_inv!27299 _values!996) e!645558)))

(declare-fun b!1134319 () Bool)

(declare-fun e!645552 () Bool)

(assert (=> b!1134319 (= e!645552 tp_is_empty!28511)))

(declare-fun b!1134320 () Bool)

(declare-datatypes ((Unit!37166 0))(
  ( (Unit!37167) )
))
(declare-fun e!645562 () Unit!37166)

(declare-fun e!645563 () Unit!37166)

(assert (=> b!1134320 (= e!645562 e!645563)))

(declare-fun c!110764 () Bool)

(assert (=> b!1134320 (= c!110764 (and (not lt!504155) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1134321 () Bool)

(declare-fun e!645556 () Bool)

(declare-fun e!645559 () Bool)

(assert (=> b!1134321 (= e!645556 e!645559)))

(declare-fun res!757276 () Bool)

(assert (=> b!1134321 (=> res!757276 e!645559)))

(assert (=> b!1134321 (= res!757276 (not (= (select (arr!35592 _keys!1208) from!1455) k!934)))))

(declare-fun e!645554 () Bool)

(assert (=> b!1134321 e!645554))

(declare-fun c!110761 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134321 (= c!110761 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43141)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43141)

(declare-fun lt!504162 () Unit!37166)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!445 (array!73883 array!73885 (_ BitVec 32) (_ BitVec 32) V!43141 V!43141 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37166)

(assert (=> b!1134321 (= lt!504162 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!445 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44591 () Bool)

(declare-fun mapRes!44591 () Bool)

(declare-fun tp!84653 () Bool)

(assert (=> mapNonEmpty!44591 (= mapRes!44591 (and tp!84653 e!645552))))

(declare-fun mapRest!44591 () (Array (_ BitVec 32) ValueCell!13546))

(declare-fun mapValue!44591 () ValueCell!13546)

(declare-fun mapKey!44591 () (_ BitVec 32))

(assert (=> mapNonEmpty!44591 (= (arr!35593 _values!996) (store mapRest!44591 mapKey!44591 mapValue!44591))))

(declare-fun b!1134322 () Bool)

(declare-fun e!645565 () Unit!37166)

(declare-fun Unit!37168 () Unit!37166)

(assert (=> b!1134322 (= e!645565 Unit!37168)))

(declare-datatypes ((tuple2!18056 0))(
  ( (tuple2!18057 (_1!9039 (_ BitVec 64)) (_2!9039 V!43141)) )
))
(declare-datatypes ((List!24815 0))(
  ( (Nil!24812) (Cons!24811 (h!26020 tuple2!18056) (t!35788 List!24815)) )
))
(declare-datatypes ((ListLongMap!16025 0))(
  ( (ListLongMap!16026 (toList!8028 List!24815)) )
))
(declare-fun call!49321 () ListLongMap!16025)

(declare-fun bm!49311 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4514 (array!73883 array!73885 (_ BitVec 32) (_ BitVec 32) V!43141 V!43141 (_ BitVec 32) Int) ListLongMap!16025)

(assert (=> bm!49311 (= call!49321 (getCurrentListMapNoExtraKeys!4514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134323 () Bool)

(declare-fun res!757282 () Bool)

(assert (=> b!1134323 (=> (not res!757282) (not e!645561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1134323 (= res!757282 (validMask!0 mask!1564))))

(declare-fun b!1134324 () Bool)

(declare-fun e!645557 () Bool)

(declare-fun e!645566 () Bool)

(assert (=> b!1134324 (= e!645557 (not e!645566))))

(declare-fun res!757275 () Bool)

(assert (=> b!1134324 (=> res!757275 e!645566)))

(assert (=> b!1134324 (= res!757275 (bvsgt from!1455 i!673))))

(assert (=> b!1134324 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!504152 () Unit!37166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73883 (_ BitVec 64) (_ BitVec 32)) Unit!37166)

(assert (=> b!1134324 (= lt!504152 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1134325 () Bool)

(declare-fun res!757284 () Bool)

(assert (=> b!1134325 (=> (not res!757284) (not e!645561))))

(assert (=> b!1134325 (= res!757284 (and (= (size!36129 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36128 _keys!1208) (size!36129 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134326 () Bool)

(declare-fun e!645560 () Bool)

(assert (=> b!1134326 (= e!645559 e!645560)))

(declare-fun res!757288 () Bool)

(assert (=> b!1134326 (=> res!757288 e!645560)))

(declare-fun lt!504151 () ListLongMap!16025)

(declare-fun contains!6553 (ListLongMap!16025 (_ BitVec 64)) Bool)

(assert (=> b!1134326 (= res!757288 (not (contains!6553 lt!504151 k!934)))))

(assert (=> b!1134326 (= lt!504151 (getCurrentListMapNoExtraKeys!4514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134327 () Bool)

(declare-fun res!757280 () Bool)

(assert (=> b!1134327 (=> (not res!757280) (not e!645561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73883 (_ BitVec 32)) Bool)

(assert (=> b!1134327 (= res!757280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun c!110762 () Bool)

(declare-fun call!49318 () Unit!37166)

(declare-fun bm!49312 () Bool)

(declare-fun addStillContains!729 (ListLongMap!16025 (_ BitVec 64) V!43141 (_ BitVec 64)) Unit!37166)

(assert (=> bm!49312 (= call!49318 (addStillContains!729 lt!504151 (ite (or c!110762 c!110764) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110762 c!110764) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1134328 () Bool)

(assert (=> b!1134328 (= e!645561 e!645557)))

(declare-fun res!757286 () Bool)

(assert (=> b!1134328 (=> (not res!757286) (not e!645557))))

(declare-fun lt!504159 () array!73883)

(assert (=> b!1134328 (= res!757286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!504159 mask!1564))))

(assert (=> b!1134328 (= lt!504159 (array!73884 (store (arr!35592 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36128 _keys!1208)))))

(declare-fun b!1134329 () Bool)

(declare-fun e!645567 () Bool)

(assert (=> b!1134329 (= e!645558 (and e!645567 mapRes!44591))))

(declare-fun condMapEmpty!44591 () Bool)

(declare-fun mapDefault!44591 () ValueCell!13546)

