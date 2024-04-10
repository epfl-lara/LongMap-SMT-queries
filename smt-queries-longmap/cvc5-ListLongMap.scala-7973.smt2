; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98678 () Bool)

(assert start!98678)

(declare-fun b_free!24283 () Bool)

(declare-fun b_next!24283 () Bool)

(assert (=> start!98678 (= b_free!24283 (not b_next!24283))))

(declare-fun tp!85560 () Bool)

(declare-fun b_and!39415 () Bool)

(assert (=> start!98678 (= tp!85560 b_and!39415)))

(declare-fun b!1148030 () Bool)

(declare-datatypes ((Unit!37718 0))(
  ( (Unit!37719) )
))
(declare-fun e!653005 () Unit!37718)

(declare-fun Unit!37720 () Unit!37718)

(assert (=> b!1148030 (= e!653005 Unit!37720)))

(declare-fun lt!513110 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1148030 (= lt!513110 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113405 () Bool)

(assert (=> b!1148030 (= c!113405 (and (not lt!513110) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513109 () Unit!37718)

(declare-fun e!653008 () Unit!37718)

(assert (=> b!1148030 (= lt!513109 e!653008)))

(declare-datatypes ((array!74473 0))(
  ( (array!74474 (arr!35887 (Array (_ BitVec 32) (_ BitVec 64))) (size!36423 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74473)

(declare-fun lt!513126 () Unit!37718)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!43545 0))(
  ( (V!43546 (val!14463 Int)) )
))
(declare-datatypes ((ValueCell!13697 0))(
  ( (ValueCellFull!13697 (v!17100 V!43545)) (EmptyCell!13697) )
))
(declare-datatypes ((array!74475 0))(
  ( (array!74476 (arr!35888 (Array (_ BitVec 32) ValueCell!13697)) (size!36424 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74475)

(declare-fun minValue!944 () V!43545)

(declare-fun zeroValue!944 () V!43545)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!437 (array!74473 array!74475 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 64) (_ BitVec 32) Int) Unit!37718)

(assert (=> b!1148030 (= lt!513126 (lemmaListMapContainsThenArrayContainsFrom!437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113406 () Bool)

(assert (=> b!1148030 (= c!113406 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764043 () Bool)

(declare-fun e!653006 () Bool)

(assert (=> b!1148030 (= res!764043 e!653006)))

(declare-fun e!653010 () Bool)

(assert (=> b!1148030 (=> (not res!764043) (not e!653010))))

(assert (=> b!1148030 e!653010))

(declare-fun lt!513123 () Unit!37718)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74473 (_ BitVec 32) (_ BitVec 32)) Unit!37718)

(assert (=> b!1148030 (= lt!513123 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25089 0))(
  ( (Nil!25086) (Cons!25085 (h!26294 (_ BitVec 64)) (t!36364 List!25089)) )
))
(declare-fun arrayNoDuplicates!0 (array!74473 (_ BitVec 32) List!25089) Bool)

(assert (=> b!1148030 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25086)))

(declare-fun lt!513113 () Unit!37718)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74473 (_ BitVec 64) (_ BitVec 32) List!25089) Unit!37718)

(assert (=> b!1148030 (= lt!513113 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25086))))

(assert (=> b!1148030 false))

(declare-fun b!1148031 () Bool)

(declare-fun res!764036 () Bool)

(declare-fun e!653014 () Bool)

(assert (=> b!1148031 (=> (not res!764036) (not e!653014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148031 (= res!764036 (validKeyInArray!0 k!934))))

(declare-fun b!1148032 () Bool)

(declare-fun res!764042 () Bool)

(assert (=> b!1148032 (=> (not res!764042) (not e!653014))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148032 (= res!764042 (= (select (arr!35887 _keys!1208) i!673) k!934))))

(declare-fun b!1148033 () Bool)

(declare-fun res!764045 () Bool)

(declare-fun e!653016 () Bool)

(assert (=> b!1148033 (=> (not res!764045) (not e!653016))))

(declare-fun lt!513111 () array!74473)

(assert (=> b!1148033 (= res!764045 (arrayNoDuplicates!0 lt!513111 #b00000000000000000000000000000000 Nil!25086))))

(declare-fun b!1148034 () Bool)

(declare-datatypes ((tuple2!18338 0))(
  ( (tuple2!18339 (_1!9180 (_ BitVec 64)) (_2!9180 V!43545)) )
))
(declare-datatypes ((List!25090 0))(
  ( (Nil!25087) (Cons!25086 (h!26295 tuple2!18338) (t!36365 List!25090)) )
))
(declare-datatypes ((ListLongMap!16307 0))(
  ( (ListLongMap!16308 (toList!8169 List!25090)) )
))
(declare-fun call!52940 () ListLongMap!16307)

(declare-fun contains!6692 (ListLongMap!16307 (_ BitVec 64)) Bool)

(assert (=> b!1148034 (contains!6692 call!52940 k!934)))

(declare-fun lt!513106 () Unit!37718)

(declare-fun lt!513116 () ListLongMap!16307)

(declare-fun addStillContains!843 (ListLongMap!16307 (_ BitVec 64) V!43545 (_ BitVec 64)) Unit!37718)

(assert (=> b!1148034 (= lt!513106 (addStillContains!843 lt!513116 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!52938 () Bool)

(assert (=> b!1148034 call!52938))

(declare-fun lt!513122 () ListLongMap!16307)

(declare-fun +!3592 (ListLongMap!16307 tuple2!18338) ListLongMap!16307)

(assert (=> b!1148034 (= lt!513116 (+!3592 lt!513122 (tuple2!18339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!513124 () Unit!37718)

(declare-fun call!52942 () Unit!37718)

(assert (=> b!1148034 (= lt!513124 call!52942)))

(assert (=> b!1148034 (= e!653008 lt!513106)))

(declare-fun mapNonEmpty!45044 () Bool)

(declare-fun mapRes!45044 () Bool)

(declare-fun tp!85559 () Bool)

(declare-fun e!653012 () Bool)

(assert (=> mapNonEmpty!45044 (= mapRes!45044 (and tp!85559 e!653012))))

(declare-fun mapKey!45044 () (_ BitVec 32))

(declare-fun mapRest!45044 () (Array (_ BitVec 32) ValueCell!13697))

(declare-fun mapValue!45044 () ValueCell!13697)

(assert (=> mapNonEmpty!45044 (= (arr!35888 _values!996) (store mapRest!45044 mapKey!45044 mapValue!45044))))

(declare-fun b!1148035 () Bool)

(assert (=> b!1148035 (= e!653006 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513110) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52935 () Bool)

(declare-fun call!52944 () ListLongMap!16307)

(assert (=> bm!52935 (= call!52944 call!52940)))

(declare-fun call!52939 () ListLongMap!16307)

(declare-fun b!1148036 () Bool)

(declare-fun e!653002 () Bool)

(declare-fun call!52943 () ListLongMap!16307)

(declare-fun -!1304 (ListLongMap!16307 (_ BitVec 64)) ListLongMap!16307)

(assert (=> b!1148036 (= e!653002 (= call!52943 (-!1304 call!52939 k!934)))))

(declare-fun b!1148037 () Bool)

(declare-fun arrayContainsKey!0 (array!74473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148037 (= e!653010 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52936 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4643 (array!74473 array!74475 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 32) Int) ListLongMap!16307)

(assert (=> bm!52936 (= call!52939 (getCurrentListMapNoExtraKeys!4643 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148038 () Bool)

(declare-fun res!764041 () Bool)

(assert (=> b!1148038 (=> (not res!764041) (not e!653014))))

(assert (=> b!1148038 (= res!764041 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25086))))

(declare-fun b!1148039 () Bool)

(declare-fun res!764040 () Bool)

(assert (=> b!1148039 (=> (not res!764040) (not e!653014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148039 (= res!764040 (validMask!0 mask!1564))))

(declare-fun b!1148040 () Bool)

(declare-fun e!653004 () Bool)

(declare-fun e!653015 () Bool)

(assert (=> b!1148040 (= e!653004 e!653015)))

(declare-fun res!764035 () Bool)

(assert (=> b!1148040 (=> res!764035 e!653015)))

(assert (=> b!1148040 (= res!764035 (not (= (select (arr!35887 _keys!1208) from!1455) k!934)))))

(assert (=> b!1148040 e!653002))

(declare-fun c!113407 () Bool)

(assert (=> b!1148040 (= c!113407 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513108 () Unit!37718)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!542 (array!74473 array!74475 (_ BitVec 32) (_ BitVec 32) V!43545 V!43545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37718)

(assert (=> b!1148040 (= lt!513108 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!542 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148041 () Bool)

(assert (=> b!1148041 (= e!653006 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148042 () Bool)

(assert (=> b!1148042 (= e!653014 e!653016)))

(declare-fun res!764044 () Bool)

(assert (=> b!1148042 (=> (not res!764044) (not e!653016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74473 (_ BitVec 32)) Bool)

(assert (=> b!1148042 (= res!764044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513111 mask!1564))))

(assert (=> b!1148042 (= lt!513111 (array!74474 (store (arr!35887 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36423 _keys!1208)))))

(declare-fun b!1148043 () Bool)

(declare-fun Unit!37721 () Unit!37718)

(assert (=> b!1148043 (= e!653005 Unit!37721)))

(declare-fun b!1148044 () Bool)

(declare-fun e!653007 () Bool)

(assert (=> b!1148044 (= e!653016 (not e!653007))))

(declare-fun res!764034 () Bool)

(assert (=> b!1148044 (=> res!764034 e!653007)))

(assert (=> b!1148044 (= res!764034 (bvsgt from!1455 i!673))))

(assert (=> b!1148044 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!513107 () Unit!37718)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74473 (_ BitVec 64) (_ BitVec 32)) Unit!37718)

(assert (=> b!1148044 (= lt!513107 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun c!113408 () Bool)

(declare-fun bm!52937 () Bool)

(assert (=> bm!52937 (= call!52940 (+!3592 (ite c!113405 lt!513116 lt!513122) (ite c!113405 (tuple2!18339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!113408 (tuple2!18339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1148045 () Bool)

(declare-fun res!764038 () Bool)

(assert (=> b!1148045 (=> (not res!764038) (not e!653014))))

(assert (=> b!1148045 (= res!764038 (and (= (size!36424 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36423 _keys!1208) (size!36424 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148046 () Bool)

(declare-fun call!52945 () Bool)

(assert (=> b!1148046 call!52945))

(declare-fun lt!513115 () Unit!37718)

(declare-fun call!52941 () Unit!37718)

(assert (=> b!1148046 (= lt!513115 call!52941)))

(declare-fun e!653011 () Unit!37718)

(assert (=> b!1148046 (= e!653011 lt!513115)))

(declare-fun b!1148047 () Bool)

(declare-fun tp_is_empty!28813 () Bool)

(assert (=> b!1148047 (= e!653012 tp_is_empty!28813)))

(declare-fun res!764047 () Bool)

(assert (=> start!98678 (=> (not res!764047) (not e!653014))))

(assert (=> start!98678 (= res!764047 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36423 _keys!1208))))))

(assert (=> start!98678 e!653014))

(assert (=> start!98678 tp_is_empty!28813))

(declare-fun array_inv!27488 (array!74473) Bool)

(assert (=> start!98678 (array_inv!27488 _keys!1208)))

(assert (=> start!98678 true))

(assert (=> start!98678 tp!85560))

(declare-fun e!653003 () Bool)

(declare-fun array_inv!27489 (array!74475) Bool)

(assert (=> start!98678 (and (array_inv!27489 _values!996) e!653003)))

(declare-fun b!1148048 () Bool)

(declare-fun res!764039 () Bool)

(assert (=> b!1148048 (=> (not res!764039) (not e!653014))))

(assert (=> b!1148048 (= res!764039 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36423 _keys!1208))))))

(declare-fun mapIsEmpty!45044 () Bool)

(assert (=> mapIsEmpty!45044 mapRes!45044))

(declare-fun b!1148049 () Bool)

(assert (=> b!1148049 (= c!113408 (and (not lt!513110) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!653013 () Unit!37718)

(assert (=> b!1148049 (= e!653008 e!653013)))

(declare-fun b!1148050 () Bool)

(declare-fun e!653000 () Bool)

(assert (=> b!1148050 (= e!653003 (and e!653000 mapRes!45044))))

(declare-fun condMapEmpty!45044 () Bool)

(declare-fun mapDefault!45044 () ValueCell!13697)

