; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99356 () Bool)

(assert start!99356)

(declare-fun b_free!24935 () Bool)

(declare-fun b_next!24935 () Bool)

(assert (=> start!99356 (= b_free!24935 (not b_next!24935))))

(declare-fun tp!87519 () Bool)

(declare-fun b_and!40737 () Bool)

(assert (=> start!99356 (= tp!87519 b_and!40737)))

(declare-fun b!1171855 () Bool)

(declare-fun res!777951 () Bool)

(declare-fun e!666076 () Bool)

(assert (=> b!1171855 (=> (not res!777951) (not e!666076))))

(declare-datatypes ((array!75747 0))(
  ( (array!75748 (arr!36523 (Array (_ BitVec 32) (_ BitVec 64))) (size!37059 (_ BitVec 32))) )
))
(declare-fun lt!527941 () array!75747)

(declare-datatypes ((List!25630 0))(
  ( (Nil!25627) (Cons!25626 (h!26835 (_ BitVec 64)) (t!37557 List!25630)) )
))
(declare-fun arrayNoDuplicates!0 (array!75747 (_ BitVec 32) List!25630) Bool)

(assert (=> b!1171855 (= res!777951 (arrayNoDuplicates!0 lt!527941 #b00000000000000000000000000000000 Nil!25627))))

(declare-fun b!1171856 () Bool)

(declare-fun e!666074 () Bool)

(assert (=> b!1171856 (= e!666074 e!666076)))

(declare-fun res!777963 () Bool)

(assert (=> b!1171856 (=> (not res!777963) (not e!666076))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75747 (_ BitVec 32)) Bool)

(assert (=> b!1171856 (= res!777963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527941 mask!1564))))

(declare-fun _keys!1208 () array!75747)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171856 (= lt!527941 (array!75748 (store (arr!36523 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37059 _keys!1208)))))

(declare-fun b!1171857 () Bool)

(declare-fun e!666081 () Bool)

(declare-fun tp_is_empty!29465 () Bool)

(assert (=> b!1171857 (= e!666081 tp_is_empty!29465)))

(declare-fun b!1171858 () Bool)

(declare-fun res!777953 () Bool)

(assert (=> b!1171858 (=> (not res!777953) (not e!666074))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171858 (= res!777953 (validKeyInArray!0 k!934))))

(declare-fun e!666070 () Bool)

(declare-fun b!1171859 () Bool)

(declare-fun arrayContainsKey!0 (array!75747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171859 (= e!666070 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1171860 () Bool)

(declare-fun e!666072 () Bool)

(assert (=> b!1171860 (= e!666072 e!666070)))

(declare-fun res!777957 () Bool)

(assert (=> b!1171860 (=> res!777957 e!666070)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171860 (= res!777957 (not (= (select (arr!36523 _keys!1208) from!1455) k!934)))))

(declare-fun b!1171861 () Bool)

(declare-fun e!666079 () Bool)

(declare-fun e!666082 () Bool)

(assert (=> b!1171861 (= e!666079 e!666082)))

(declare-fun res!777962 () Bool)

(assert (=> b!1171861 (=> res!777962 e!666082)))

(assert (=> b!1171861 (= res!777962 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44413 0))(
  ( (V!44414 (val!14789 Int)) )
))
(declare-fun zeroValue!944 () V!44413)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14023 0))(
  ( (ValueCellFull!14023 (v!17427 V!44413)) (EmptyCell!14023) )
))
(declare-datatypes ((array!75749 0))(
  ( (array!75750 (arr!36524 (Array (_ BitVec 32) ValueCell!14023)) (size!37060 (_ BitVec 32))) )
))
(declare-fun lt!527949 () array!75749)

(declare-fun minValue!944 () V!44413)

(declare-datatypes ((tuple2!18894 0))(
  ( (tuple2!18895 (_1!9458 (_ BitVec 64)) (_2!9458 V!44413)) )
))
(declare-datatypes ((List!25631 0))(
  ( (Nil!25628) (Cons!25627 (h!26836 tuple2!18894) (t!37558 List!25631)) )
))
(declare-datatypes ((ListLongMap!16863 0))(
  ( (ListLongMap!16864 (toList!8447 List!25631)) )
))
(declare-fun lt!527942 () ListLongMap!16863)

(declare-fun getCurrentListMapNoExtraKeys!4911 (array!75747 array!75749 (_ BitVec 32) (_ BitVec 32) V!44413 V!44413 (_ BitVec 32) Int) ListLongMap!16863)

(assert (=> b!1171861 (= lt!527942 (getCurrentListMapNoExtraKeys!4911 lt!527941 lt!527949 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527947 () V!44413)

(declare-fun _values!996 () array!75749)

(assert (=> b!1171861 (= lt!527949 (array!75750 (store (arr!36524 _values!996) i!673 (ValueCellFull!14023 lt!527947)) (size!37060 _values!996)))))

(declare-fun dynLambda!2883 (Int (_ BitVec 64)) V!44413)

(assert (=> b!1171861 (= lt!527947 (dynLambda!2883 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527946 () ListLongMap!16863)

(assert (=> b!1171861 (= lt!527946 (getCurrentListMapNoExtraKeys!4911 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171862 () Bool)

(declare-fun res!777965 () Bool)

(assert (=> b!1171862 (=> (not res!777965) (not e!666074))))

(assert (=> b!1171862 (= res!777965 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25627))))

(declare-fun b!1171863 () Bool)

(declare-fun res!777964 () Bool)

(declare-fun e!666071 () Bool)

(assert (=> b!1171863 (=> res!777964 e!666071)))

(declare-fun noDuplicate!1612 (List!25630) Bool)

(assert (=> b!1171863 (= res!777964 (not (noDuplicate!1612 Nil!25627)))))

(declare-fun b!1171864 () Bool)

(assert (=> b!1171864 (= e!666076 (not e!666079))))

(declare-fun res!777952 () Bool)

(assert (=> b!1171864 (=> res!777952 e!666079)))

(assert (=> b!1171864 (= res!777952 (bvsgt from!1455 i!673))))

(assert (=> b!1171864 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38646 0))(
  ( (Unit!38647) )
))
(declare-fun lt!527952 () Unit!38646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75747 (_ BitVec 64) (_ BitVec 32)) Unit!38646)

(assert (=> b!1171864 (= lt!527952 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1171865 () Bool)

(declare-fun e!666073 () Bool)

(assert (=> b!1171865 (= e!666082 e!666073)))

(declare-fun res!777956 () Bool)

(assert (=> b!1171865 (=> res!777956 e!666073)))

(assert (=> b!1171865 (= res!777956 (not (validKeyInArray!0 (select (arr!36523 _keys!1208) from!1455))))))

(declare-fun lt!527940 () ListLongMap!16863)

(declare-fun lt!527945 () ListLongMap!16863)

(assert (=> b!1171865 (= lt!527940 lt!527945)))

(declare-fun lt!527943 () ListLongMap!16863)

(declare-fun -!1515 (ListLongMap!16863 (_ BitVec 64)) ListLongMap!16863)

(assert (=> b!1171865 (= lt!527945 (-!1515 lt!527943 k!934))))

(assert (=> b!1171865 (= lt!527940 (getCurrentListMapNoExtraKeys!4911 lt!527941 lt!527949 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171865 (= lt!527943 (getCurrentListMapNoExtraKeys!4911 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527951 () Unit!38646)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!742 (array!75747 array!75749 (_ BitVec 32) (_ BitVec 32) V!44413 V!44413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38646)

(assert (=> b!1171865 (= lt!527951 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!742 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171866 () Bool)

(declare-fun e!666080 () Bool)

(declare-fun mapRes!46025 () Bool)

(assert (=> b!1171866 (= e!666080 (and e!666081 mapRes!46025))))

(declare-fun condMapEmpty!46025 () Bool)

(declare-fun mapDefault!46025 () ValueCell!14023)

