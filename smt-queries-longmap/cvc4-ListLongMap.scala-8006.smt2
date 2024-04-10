; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98880 () Bool)

(assert start!98880)

(declare-fun b_free!24485 () Bool)

(declare-fun b_next!24485 () Bool)

(assert (=> start!98880 (= b_free!24485 (not b_next!24485))))

(declare-fun tp!86165 () Bool)

(declare-fun b_and!39819 () Bool)

(assert (=> start!98880 (= tp!86165 b_and!39819)))

(declare-fun b!1157322 () Bool)

(declare-fun res!768584 () Bool)

(declare-fun e!658163 () Bool)

(assert (=> b!1157322 (=> (not res!768584) (not e!658163))))

(declare-datatypes ((array!74873 0))(
  ( (array!74874 (arr!36087 (Array (_ BitVec 32) (_ BitVec 64))) (size!36623 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74873)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1157322 (= res!768584 (= (select (arr!36087 _keys!1208) i!673) k!934))))

(declare-fun b!1157323 () Bool)

(declare-fun res!768588 () Bool)

(declare-fun e!658162 () Bool)

(assert (=> b!1157323 (=> (not res!768588) (not e!658162))))

(declare-fun lt!519759 () array!74873)

(declare-datatypes ((List!25271 0))(
  ( (Nil!25268) (Cons!25267 (h!26476 (_ BitVec 64)) (t!36748 List!25271)) )
))
(declare-fun arrayNoDuplicates!0 (array!74873 (_ BitVec 32) List!25271) Bool)

(assert (=> b!1157323 (= res!768588 (arrayNoDuplicates!0 lt!519759 #b00000000000000000000000000000000 Nil!25268))))

(declare-fun b!1157324 () Bool)

(declare-fun call!55364 () Bool)

(assert (=> b!1157324 call!55364))

(declare-datatypes ((Unit!38125 0))(
  ( (Unit!38126) )
))
(declare-fun lt!519743 () Unit!38125)

(declare-fun call!55366 () Unit!38125)

(assert (=> b!1157324 (= lt!519743 call!55366)))

(declare-fun e!658151 () Unit!38125)

(assert (=> b!1157324 (= e!658151 lt!519743)))

(declare-datatypes ((V!43813 0))(
  ( (V!43814 (val!14564 Int)) )
))
(declare-fun zeroValue!944 () V!43813)

(declare-datatypes ((tuple2!18530 0))(
  ( (tuple2!18531 (_1!9276 (_ BitVec 64)) (_2!9276 V!43813)) )
))
(declare-datatypes ((List!25272 0))(
  ( (Nil!25269) (Cons!25268 (h!26477 tuple2!18530) (t!36749 List!25272)) )
))
(declare-datatypes ((ListLongMap!16499 0))(
  ( (ListLongMap!16500 (toList!8265 List!25272)) )
))
(declare-fun call!55369 () ListLongMap!16499)

(declare-fun lt!519753 () ListLongMap!16499)

(declare-fun bm!55359 () Bool)

(declare-fun minValue!944 () V!43813)

(declare-fun c!115223 () Bool)

(declare-fun c!115224 () Bool)

(declare-fun +!3676 (ListLongMap!16499 tuple2!18530) ListLongMap!16499)

(assert (=> bm!55359 (= call!55369 (+!3676 lt!519753 (ite (or c!115223 c!115224) (tuple2!18531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1157325 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13798 0))(
  ( (ValueCellFull!13798 (v!17201 V!43813)) (EmptyCell!13798) )
))
(declare-datatypes ((array!74875 0))(
  ( (array!74876 (arr!36088 (Array (_ BitVec 32) ValueCell!13798)) (size!36624 (_ BitVec 32))) )
))
(declare-fun lt!519748 () array!74875)

(declare-fun e!658159 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!519739 () ListLongMap!16499)

(declare-fun getCurrentListMapNoExtraKeys!4732 (array!74873 array!74875 (_ BitVec 32) (_ BitVec 32) V!43813 V!43813 (_ BitVec 32) Int) ListLongMap!16499)

(assert (=> b!1157325 (= e!658159 (= lt!519739 (getCurrentListMapNoExtraKeys!4732 lt!519759 lt!519748 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!55360 () Bool)

(declare-fun call!55362 () ListLongMap!16499)

(assert (=> bm!55360 (= call!55362 call!55369)))

(declare-fun b!1157326 () Bool)

(declare-fun e!658167 () Bool)

(declare-fun call!55365 () ListLongMap!16499)

(declare-fun call!55363 () ListLongMap!16499)

(assert (=> b!1157326 (= e!658167 (= call!55365 call!55363))))

(declare-fun bm!55361 () Bool)

(declare-fun call!55368 () Unit!38125)

(assert (=> bm!55361 (= call!55366 call!55368)))

(declare-fun bm!55362 () Bool)

(declare-fun lt!519755 () ListLongMap!16499)

(declare-fun call!55367 () Bool)

(declare-fun contains!6776 (ListLongMap!16499 (_ BitVec 64)) Bool)

(assert (=> bm!55362 (= call!55367 (contains!6776 (ite c!115223 lt!519755 call!55362) k!934))))

(declare-fun b!1157327 () Bool)

(declare-fun e!658155 () Bool)

(assert (=> b!1157327 (= e!658155 true)))

(assert (=> b!1157327 e!658159))

(declare-fun res!768593 () Bool)

(assert (=> b!1157327 (=> (not res!768593) (not e!658159))))

(assert (=> b!1157327 (= res!768593 (= lt!519739 lt!519753))))

(declare-fun lt!519738 () ListLongMap!16499)

(declare-fun -!1379 (ListLongMap!16499 (_ BitVec 64)) ListLongMap!16499)

(assert (=> b!1157327 (= lt!519739 (-!1379 lt!519738 k!934))))

(declare-fun lt!519758 () V!43813)

(assert (=> b!1157327 (= (-!1379 (+!3676 lt!519753 (tuple2!18531 (select (arr!36087 _keys!1208) from!1455) lt!519758)) (select (arr!36087 _keys!1208) from!1455)) lt!519753)))

(declare-fun lt!519742 () Unit!38125)

(declare-fun addThenRemoveForNewKeyIsSame!218 (ListLongMap!16499 (_ BitVec 64) V!43813) Unit!38125)

(assert (=> b!1157327 (= lt!519742 (addThenRemoveForNewKeyIsSame!218 lt!519753 (select (arr!36087 _keys!1208) from!1455) lt!519758))))

(declare-fun lt!519756 () V!43813)

(declare-fun _values!996 () array!74875)

(declare-fun get!18392 (ValueCell!13798 V!43813) V!43813)

(assert (=> b!1157327 (= lt!519758 (get!18392 (select (arr!36088 _values!996) from!1455) lt!519756))))

(declare-fun lt!519754 () Unit!38125)

(declare-fun e!658160 () Unit!38125)

(assert (=> b!1157327 (= lt!519754 e!658160)))

(declare-fun c!115226 () Bool)

(assert (=> b!1157327 (= c!115226 (contains!6776 lt!519753 k!934))))

(assert (=> b!1157327 (= lt!519753 (getCurrentListMapNoExtraKeys!4732 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157328 () Bool)

(assert (=> b!1157328 (contains!6776 (+!3676 lt!519755 (tuple2!18531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!519745 () Unit!38125)

(assert (=> b!1157328 (= lt!519745 call!55368)))

(assert (=> b!1157328 call!55367))

(assert (=> b!1157328 (= lt!519755 call!55369)))

(declare-fun lt!519751 () Unit!38125)

(declare-fun addStillContains!918 (ListLongMap!16499 (_ BitVec 64) V!43813 (_ BitVec 64)) Unit!38125)

(assert (=> b!1157328 (= lt!519751 (addStillContains!918 lt!519753 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!658158 () Unit!38125)

(assert (=> b!1157328 (= e!658158 lt!519745)))

(declare-fun b!1157329 () Bool)

(declare-fun res!768586 () Bool)

(assert (=> b!1157329 (=> (not res!768586) (not e!658163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74873 (_ BitVec 32)) Bool)

(assert (=> b!1157329 (= res!768586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1157330 () Bool)

(declare-fun e!658153 () Unit!38125)

(assert (=> b!1157330 (= e!658153 e!658151)))

(declare-fun c!115225 () Bool)

(declare-fun lt!519744 () Bool)

(assert (=> b!1157330 (= c!115225 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!519744))))

(declare-fun b!1157331 () Bool)

(declare-fun e!658161 () Bool)

(declare-fun tp_is_empty!29015 () Bool)

(assert (=> b!1157331 (= e!658161 tp_is_empty!29015)))

(declare-fun b!1157332 () Bool)

(declare-fun res!768589 () Bool)

(assert (=> b!1157332 (=> (not res!768589) (not e!658163))))

(assert (=> b!1157332 (= res!768589 (and (= (size!36624 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36623 _keys!1208) (size!36624 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1157333 () Bool)

(declare-fun Unit!38127 () Unit!38125)

(assert (=> b!1157333 (= e!658151 Unit!38127)))

(declare-fun mapNonEmpty!45347 () Bool)

(declare-fun mapRes!45347 () Bool)

(declare-fun tp!86166 () Bool)

(assert (=> mapNonEmpty!45347 (= mapRes!45347 (and tp!86166 e!658161))))

(declare-fun mapKey!45347 () (_ BitVec 32))

(declare-fun mapRest!45347 () (Array (_ BitVec 32) ValueCell!13798))

(declare-fun mapValue!45347 () ValueCell!13798)

(assert (=> mapNonEmpty!45347 (= (arr!36088 _values!996) (store mapRest!45347 mapKey!45347 mapValue!45347))))

(declare-fun bm!55363 () Bool)

(assert (=> bm!55363 (= call!55365 (getCurrentListMapNoExtraKeys!4732 lt!519759 lt!519748 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!658165 () Bool)

(declare-fun b!1157334 () Bool)

(assert (=> b!1157334 (= e!658165 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!519744) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55364 () Bool)

(assert (=> bm!55364 (= call!55364 call!55367)))

(declare-fun b!1157335 () Bool)

(declare-fun e!658154 () Bool)

(assert (=> b!1157335 (= e!658162 (not e!658154))))

(declare-fun res!768579 () Bool)

(assert (=> b!1157335 (=> res!768579 e!658154)))

(assert (=> b!1157335 (= res!768579 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1157335 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!519747 () Unit!38125)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74873 (_ BitVec 64) (_ BitVec 32)) Unit!38125)

(assert (=> b!1157335 (= lt!519747 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!45347 () Bool)

(assert (=> mapIsEmpty!45347 mapRes!45347))

(declare-fun b!1157336 () Bool)

(declare-fun Unit!38128 () Unit!38125)

(assert (=> b!1157336 (= e!658160 Unit!38128)))

(declare-fun res!768580 () Bool)

(assert (=> start!98880 (=> (not res!768580) (not e!658163))))

(assert (=> start!98880 (= res!768580 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36623 _keys!1208))))))

(assert (=> start!98880 e!658163))

(assert (=> start!98880 tp_is_empty!29015))

(declare-fun array_inv!27618 (array!74873) Bool)

(assert (=> start!98880 (array_inv!27618 _keys!1208)))

(assert (=> start!98880 true))

(assert (=> start!98880 tp!86165))

(declare-fun e!658152 () Bool)

(declare-fun array_inv!27619 (array!74875) Bool)

(assert (=> start!98880 (and (array_inv!27619 _values!996) e!658152)))

(declare-fun b!1157337 () Bool)

(assert (=> b!1157337 (= e!658163 e!658162)))

(declare-fun res!768590 () Bool)

(assert (=> b!1157337 (=> (not res!768590) (not e!658162))))

(assert (=> b!1157337 (= res!768590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!519759 mask!1564))))

(assert (=> b!1157337 (= lt!519759 (array!74874 (store (arr!36087 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36623 _keys!1208)))))

(declare-fun b!1157338 () Bool)

(declare-fun res!768585 () Bool)

(assert (=> b!1157338 (=> (not res!768585) (not e!658163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1157338 (= res!768585 (validKeyInArray!0 k!934))))

(declare-fun b!1157339 () Bool)

(declare-fun e!658156 () Bool)

(assert (=> b!1157339 (= e!658156 tp_is_empty!29015)))

(declare-fun b!1157340 () Bool)

(declare-fun e!658164 () Bool)

(assert (=> b!1157340 (= e!658164 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1157341 () Bool)

(assert (=> b!1157341 (= c!115224 (and (not lt!519744) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1157341 (= e!658158 e!658153)))

(declare-fun bm!55365 () Bool)

(assert (=> bm!55365 (= call!55363 (getCurrentListMapNoExtraKeys!4732 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55366 () Bool)

(assert (=> bm!55366 (= call!55368 (addStillContains!918 (ite c!115223 lt!519755 lt!519753) (ite c!115223 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115224 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115223 minValue!944 (ite c!115224 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1157342 () Bool)

(declare-fun e!658166 () Bool)

(assert (=> b!1157342 (= e!658166 e!658155)))

(declare-fun res!768587 () Bool)

(assert (=> b!1157342 (=> res!768587 e!658155)))

(assert (=> b!1157342 (= res!768587 (not (= (select (arr!36087 _keys!1208) from!1455) k!934)))))

(assert (=> b!1157342 e!658167))

(declare-fun c!115227 () Bool)

(assert (=> b!1157342 (= c!115227 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!519749 () Unit!38125)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!612 (array!74873 array!74875 (_ BitVec 32) (_ BitVec 32) V!43813 V!43813 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38125)

(assert (=> b!1157342 (= lt!519749 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!612 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1157343 () Bool)

(declare-fun lt!519752 () Unit!38125)

(assert (=> b!1157343 (= e!658153 lt!519752)))

(assert (=> b!1157343 (= lt!519752 call!55366)))

(assert (=> b!1157343 call!55364))

(declare-fun b!1157344 () Bool)

(assert (=> b!1157344 (= e!658167 (= call!55365 (-!1379 call!55363 k!934)))))

(declare-fun b!1157345 () Bool)

(assert (=> b!1157345 (= e!658154 e!658166)))

(declare-fun res!768591 () Bool)

(assert (=> b!1157345 (=> res!768591 e!658166)))

(assert (=> b!1157345 (= res!768591 (not (= from!1455 i!673)))))

(declare-fun lt!519757 () ListLongMap!16499)

(assert (=> b!1157345 (= lt!519757 (getCurrentListMapNoExtraKeys!4732 lt!519759 lt!519748 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1157345 (= lt!519748 (array!74876 (store (arr!36088 _values!996) i!673 (ValueCellFull!13798 lt!519756)) (size!36624 _values!996)))))

(declare-fun dynLambda!2739 (Int (_ BitVec 64)) V!43813)

(assert (=> b!1157345 (= lt!519756 (dynLambda!2739 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1157345 (= lt!519738 (getCurrentListMapNoExtraKeys!4732 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1157346 () Bool)

(assert (=> b!1157346 (= e!658152 (and e!658156 mapRes!45347))))

(declare-fun condMapEmpty!45347 () Bool)

(declare-fun mapDefault!45347 () ValueCell!13798)

