; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99580 () Bool)

(assert start!99580)

(declare-fun b_free!25159 () Bool)

(declare-fun b_next!25159 () Bool)

(assert (=> start!99580 (= b_free!25159 (not b_next!25159))))

(declare-fun tp!88190 () Bool)

(declare-fun b_and!41185 () Bool)

(assert (=> start!99580 (= tp!88190 b_and!41185)))

(declare-fun b!1179010 () Bool)

(declare-fun e!670282 () Bool)

(declare-fun e!670284 () Bool)

(assert (=> b!1179010 (= e!670282 e!670284)))

(declare-fun res!783274 () Bool)

(assert (=> b!1179010 (=> res!783274 e!670284)))

(declare-datatypes ((array!76181 0))(
  ( (array!76182 (arr!36740 (Array (_ BitVec 32) (_ BitVec 64))) (size!37276 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76181)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179010 (= res!783274 (not (validKeyInArray!0 (select (arr!36740 _keys!1208) from!1455))))))

(declare-datatypes ((V!44713 0))(
  ( (V!44714 (val!14901 Int)) )
))
(declare-datatypes ((tuple2!19072 0))(
  ( (tuple2!19073 (_1!9547 (_ BitVec 64)) (_2!9547 V!44713)) )
))
(declare-datatypes ((List!25809 0))(
  ( (Nil!25806) (Cons!25805 (h!27014 tuple2!19072) (t!37960 List!25809)) )
))
(declare-datatypes ((ListLongMap!17041 0))(
  ( (ListLongMap!17042 (toList!8536 List!25809)) )
))
(declare-fun lt!532746 () ListLongMap!17041)

(declare-fun lt!532755 () ListLongMap!17041)

(assert (=> b!1179010 (= lt!532746 lt!532755)))

(declare-fun lt!532744 () ListLongMap!17041)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1581 (ListLongMap!17041 (_ BitVec 64)) ListLongMap!17041)

(assert (=> b!1179010 (= lt!532755 (-!1581 lt!532744 k!934))))

(declare-fun zeroValue!944 () V!44713)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44713)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!532747 () array!76181)

(declare-datatypes ((ValueCell!14135 0))(
  ( (ValueCellFull!14135 (v!17539 V!44713)) (EmptyCell!14135) )
))
(declare-datatypes ((array!76183 0))(
  ( (array!76184 (arr!36741 (Array (_ BitVec 32) ValueCell!14135)) (size!37277 (_ BitVec 32))) )
))
(declare-fun lt!532754 () array!76183)

(declare-fun getCurrentListMapNoExtraKeys!4991 (array!76181 array!76183 (_ BitVec 32) (_ BitVec 32) V!44713 V!44713 (_ BitVec 32) Int) ListLongMap!17041)

(assert (=> b!1179010 (= lt!532746 (getCurrentListMapNoExtraKeys!4991 lt!532747 lt!532754 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76183)

(assert (=> b!1179010 (= lt!532744 (getCurrentListMapNoExtraKeys!4991 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38954 0))(
  ( (Unit!38955) )
))
(declare-fun lt!532757 () Unit!38954)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!808 (array!76181 array!76183 (_ BitVec 32) (_ BitVec 32) V!44713 V!44713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38954)

(assert (=> b!1179010 (= lt!532757 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!808 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179011 () Bool)

(declare-fun res!783275 () Bool)

(declare-fun e!670276 () Bool)

(assert (=> b!1179011 (=> (not res!783275) (not e!670276))))

(assert (=> b!1179011 (= res!783275 (and (= (size!37277 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37276 _keys!1208) (size!37277 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179012 () Bool)

(declare-fun e!670277 () Bool)

(assert (=> b!1179012 (= e!670276 e!670277)))

(declare-fun res!783286 () Bool)

(assert (=> b!1179012 (=> (not res!783286) (not e!670277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76181 (_ BitVec 32)) Bool)

(assert (=> b!1179012 (= res!783286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532747 mask!1564))))

(assert (=> b!1179012 (= lt!532747 (array!76182 (store (arr!36740 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37276 _keys!1208)))))

(declare-fun b!1179013 () Bool)

(declare-fun e!670281 () Unit!38954)

(declare-fun Unit!38956 () Unit!38954)

(assert (=> b!1179013 (= e!670281 Unit!38956)))

(declare-fun lt!532748 () Unit!38954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76181 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38954)

(assert (=> b!1179013 (= lt!532748 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179013 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532750 () Unit!38954)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76181 (_ BitVec 32) (_ BitVec 32)) Unit!38954)

(assert (=> b!1179013 (= lt!532750 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25810 0))(
  ( (Nil!25807) (Cons!25806 (h!27015 (_ BitVec 64)) (t!37961 List!25810)) )
))
(declare-fun arrayNoDuplicates!0 (array!76181 (_ BitVec 32) List!25810) Bool)

(assert (=> b!1179013 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25807)))

(declare-fun lt!532758 () Unit!38954)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76181 (_ BitVec 64) (_ BitVec 32) List!25810) Unit!38954)

(assert (=> b!1179013 (= lt!532758 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25807))))

(assert (=> b!1179013 false))

(declare-fun b!1179014 () Bool)

(declare-fun res!783280 () Bool)

(assert (=> b!1179014 (=> (not res!783280) (not e!670276))))

(assert (=> b!1179014 (= res!783280 (= (select (arr!36740 _keys!1208) i!673) k!934))))

(declare-fun lt!532756 () ListLongMap!17041)

(declare-fun e!670285 () Bool)

(declare-fun b!1179015 () Bool)

(declare-fun lt!532745 () tuple2!19072)

(declare-fun +!3850 (ListLongMap!17041 tuple2!19072) ListLongMap!17041)

(assert (=> b!1179015 (= e!670285 (= lt!532756 (+!3850 lt!532744 lt!532745)))))

(declare-fun mapIsEmpty!46361 () Bool)

(declare-fun mapRes!46361 () Bool)

(assert (=> mapIsEmpty!46361 mapRes!46361))

(declare-fun res!783288 () Bool)

(assert (=> start!99580 (=> (not res!783288) (not e!670276))))

(assert (=> start!99580 (= res!783288 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37276 _keys!1208))))))

(assert (=> start!99580 e!670276))

(declare-fun tp_is_empty!29689 () Bool)

(assert (=> start!99580 tp_is_empty!29689))

(declare-fun array_inv!28052 (array!76181) Bool)

(assert (=> start!99580 (array_inv!28052 _keys!1208)))

(assert (=> start!99580 true))

(assert (=> start!99580 tp!88190))

(declare-fun e!670280 () Bool)

(declare-fun array_inv!28053 (array!76183) Bool)

(assert (=> start!99580 (and (array_inv!28053 _values!996) e!670280)))

(declare-fun b!1179016 () Bool)

(declare-fun Unit!38957 () Unit!38954)

(assert (=> b!1179016 (= e!670281 Unit!38957)))

(declare-fun b!1179017 () Bool)

(assert (=> b!1179017 (= e!670284 true)))

(assert (=> b!1179017 e!670285))

(declare-fun res!783278 () Bool)

(assert (=> b!1179017 (=> (not res!783278) (not e!670285))))

(assert (=> b!1179017 (= res!783278 (not (= (select (arr!36740 _keys!1208) from!1455) k!934)))))

(declare-fun lt!532749 () Unit!38954)

(assert (=> b!1179017 (= lt!532749 e!670281)))

(declare-fun c!116862 () Bool)

(assert (=> b!1179017 (= c!116862 (= (select (arr!36740 _keys!1208) from!1455) k!934))))

(declare-fun e!670287 () Bool)

(assert (=> b!1179017 e!670287))

(declare-fun res!783276 () Bool)

(assert (=> b!1179017 (=> (not res!783276) (not e!670287))))

(declare-fun lt!532753 () ListLongMap!17041)

(assert (=> b!1179017 (= res!783276 (= lt!532753 (+!3850 lt!532755 lt!532745)))))

(declare-fun lt!532752 () V!44713)

(declare-fun get!18782 (ValueCell!14135 V!44713) V!44713)

(assert (=> b!1179017 (= lt!532745 (tuple2!19073 (select (arr!36740 _keys!1208) from!1455) (get!18782 (select (arr!36741 _values!996) from!1455) lt!532752)))))

(declare-fun b!1179018 () Bool)

(declare-fun e!670278 () Bool)

(assert (=> b!1179018 (= e!670278 tp_is_empty!29689)))

(declare-fun b!1179019 () Bool)

(declare-fun res!783289 () Bool)

(assert (=> b!1179019 (=> (not res!783289) (not e!670276))))

(assert (=> b!1179019 (= res!783289 (validKeyInArray!0 k!934))))

(declare-fun b!1179020 () Bool)

(declare-fun e!670283 () Bool)

(assert (=> b!1179020 (= e!670283 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179021 () Bool)

(declare-fun res!783281 () Bool)

(assert (=> b!1179021 (=> (not res!783281) (not e!670277))))

(assert (=> b!1179021 (= res!783281 (arrayNoDuplicates!0 lt!532747 #b00000000000000000000000000000000 Nil!25807))))

(declare-fun mapNonEmpty!46361 () Bool)

(declare-fun tp!88191 () Bool)

(assert (=> mapNonEmpty!46361 (= mapRes!46361 (and tp!88191 e!670278))))

(declare-fun mapKey!46361 () (_ BitVec 32))

(declare-fun mapValue!46361 () ValueCell!14135)

(declare-fun mapRest!46361 () (Array (_ BitVec 32) ValueCell!14135))

(assert (=> mapNonEmpty!46361 (= (arr!36741 _values!996) (store mapRest!46361 mapKey!46361 mapValue!46361))))

(declare-fun b!1179022 () Bool)

(assert (=> b!1179022 (= e!670287 e!670283)))

(declare-fun res!783279 () Bool)

(assert (=> b!1179022 (=> res!783279 e!670283)))

(assert (=> b!1179022 (= res!783279 (not (= (select (arr!36740 _keys!1208) from!1455) k!934)))))

(declare-fun b!1179023 () Bool)

(declare-fun e!670279 () Bool)

(assert (=> b!1179023 (= e!670280 (and e!670279 mapRes!46361))))

(declare-fun condMapEmpty!46361 () Bool)

(declare-fun mapDefault!46361 () ValueCell!14135)

