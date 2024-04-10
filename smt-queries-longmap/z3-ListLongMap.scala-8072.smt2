; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99300 () Bool)

(assert start!99300)

(declare-fun b_free!24879 () Bool)

(declare-fun b_next!24879 () Bool)

(assert (=> start!99300 (= b_free!24879 (not b_next!24879))))

(declare-fun tp!87350 () Bool)

(declare-fun b_and!40625 () Bool)

(assert (=> start!99300 (= tp!87350 b_and!40625)))

(declare-fun b!1170071 () Bool)

(declare-fun res!776475 () Bool)

(declare-fun e!665019 () Bool)

(assert (=> b!1170071 (=> (not res!776475) (not e!665019))))

(declare-datatypes ((array!75637 0))(
  ( (array!75638 (arr!36468 (Array (_ BitVec 32) (_ BitVec 64))) (size!37004 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75637)

(declare-datatypes ((List!25584 0))(
  ( (Nil!25581) (Cons!25580 (h!26789 (_ BitVec 64)) (t!37455 List!25584)) )
))
(declare-fun arrayNoDuplicates!0 (array!75637 (_ BitVec 32) List!25584) Bool)

(assert (=> b!1170071 (= res!776475 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25581))))

(declare-fun b!1170072 () Bool)

(declare-fun e!665021 () Bool)

(declare-fun e!665026 () Bool)

(assert (=> b!1170072 (= e!665021 e!665026)))

(declare-fun res!776480 () Bool)

(assert (=> b!1170072 (=> res!776480 e!665026)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1170072 (= res!776480 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44339 0))(
  ( (V!44340 (val!14761 Int)) )
))
(declare-fun zeroValue!944 () V!44339)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526935 () array!75637)

(declare-datatypes ((tuple2!18848 0))(
  ( (tuple2!18849 (_1!9435 (_ BitVec 64)) (_2!9435 V!44339)) )
))
(declare-datatypes ((List!25585 0))(
  ( (Nil!25582) (Cons!25581 (h!26790 tuple2!18848) (t!37456 List!25585)) )
))
(declare-datatypes ((ListLongMap!16817 0))(
  ( (ListLongMap!16818 (toList!8424 List!25585)) )
))
(declare-fun lt!526932 () ListLongMap!16817)

(declare-fun minValue!944 () V!44339)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13995 0))(
  ( (ValueCellFull!13995 (v!17399 V!44339)) (EmptyCell!13995) )
))
(declare-datatypes ((array!75639 0))(
  ( (array!75640 (arr!36469 (Array (_ BitVec 32) ValueCell!13995)) (size!37005 (_ BitVec 32))) )
))
(declare-fun lt!526937 () array!75639)

(declare-fun getCurrentListMapNoExtraKeys!4888 (array!75637 array!75639 (_ BitVec 32) (_ BitVec 32) V!44339 V!44339 (_ BitVec 32) Int) ListLongMap!16817)

(assert (=> b!1170072 (= lt!526932 (getCurrentListMapNoExtraKeys!4888 lt!526935 lt!526937 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526934 () V!44339)

(declare-fun _values!996 () array!75639)

(assert (=> b!1170072 (= lt!526937 (array!75640 (store (arr!36469 _values!996) i!673 (ValueCellFull!13995 lt!526934)) (size!37005 _values!996)))))

(declare-fun dynLambda!2865 (Int (_ BitVec 64)) V!44339)

(assert (=> b!1170072 (= lt!526934 (dynLambda!2865 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526938 () ListLongMap!16817)

(assert (=> b!1170072 (= lt!526938 (getCurrentListMapNoExtraKeys!4888 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!776482 () Bool)

(assert (=> start!99300 (=> (not res!776482) (not e!665019))))

(assert (=> start!99300 (= res!776482 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37004 _keys!1208))))))

(assert (=> start!99300 e!665019))

(declare-fun tp_is_empty!29409 () Bool)

(assert (=> start!99300 tp_is_empty!29409))

(declare-fun array_inv!27874 (array!75637) Bool)

(assert (=> start!99300 (array_inv!27874 _keys!1208)))

(assert (=> start!99300 true))

(assert (=> start!99300 tp!87350))

(declare-fun e!665029 () Bool)

(declare-fun array_inv!27875 (array!75639) Bool)

(assert (=> start!99300 (and (array_inv!27875 _values!996) e!665029)))

(declare-fun b!1170073 () Bool)

(declare-fun e!665018 () Bool)

(declare-fun e!665023 () Bool)

(assert (=> b!1170073 (= e!665018 e!665023)))

(declare-fun res!776483 () Bool)

(assert (=> b!1170073 (=> res!776483 e!665023)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1170073 (= res!776483 (not (= (select (arr!36468 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1170074 () Bool)

(declare-fun res!776476 () Bool)

(assert (=> b!1170074 (=> (not res!776476) (not e!665019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75637 (_ BitVec 32)) Bool)

(assert (=> b!1170074 (= res!776476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1170075 () Bool)

(declare-fun e!665028 () Bool)

(declare-fun mapRes!45941 () Bool)

(assert (=> b!1170075 (= e!665029 (and e!665028 mapRes!45941))))

(declare-fun condMapEmpty!45941 () Bool)

(declare-fun mapDefault!45941 () ValueCell!13995)

(assert (=> b!1170075 (= condMapEmpty!45941 (= (arr!36469 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13995)) mapDefault!45941)))))

(declare-fun b!1170076 () Bool)

(declare-fun res!776481 () Bool)

(assert (=> b!1170076 (=> (not res!776481) (not e!665019))))

(assert (=> b!1170076 (= res!776481 (= (select (arr!36468 _keys!1208) i!673) k0!934))))

(declare-fun b!1170077 () Bool)

(declare-fun res!776479 () Bool)

(assert (=> b!1170077 (=> (not res!776479) (not e!665019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1170077 (= res!776479 (validKeyInArray!0 k0!934))))

(declare-fun b!1170078 () Bool)

(declare-fun arrayContainsKey!0 (array!75637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1170078 (= e!665023 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170079 () Bool)

(declare-fun e!665022 () Bool)

(declare-fun e!665027 () Bool)

(assert (=> b!1170079 (= e!665022 e!665027)))

(declare-fun res!776473 () Bool)

(assert (=> b!1170079 (=> res!776473 e!665027)))

(assert (=> b!1170079 (= res!776473 (not (= (select (arr!36468 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1170079 e!665018))

(declare-fun res!776487 () Bool)

(assert (=> b!1170079 (=> (not res!776487) (not e!665018))))

(declare-fun lt!526936 () ListLongMap!16817)

(declare-fun +!3753 (ListLongMap!16817 tuple2!18848) ListLongMap!16817)

(declare-fun get!18593 (ValueCell!13995 V!44339) V!44339)

(assert (=> b!1170079 (= res!776487 (= lt!526932 (+!3753 lt!526936 (tuple2!18849 (select (arr!36468 _keys!1208) from!1455) (get!18593 (select (arr!36469 _values!996) from!1455) lt!526934)))))))

(declare-fun b!1170080 () Bool)

(declare-fun res!776484 () Bool)

(assert (=> b!1170080 (=> (not res!776484) (not e!665019))))

(assert (=> b!1170080 (= res!776484 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37004 _keys!1208))))))

(declare-fun b!1170081 () Bool)

(assert (=> b!1170081 (= e!665028 tp_is_empty!29409)))

(declare-fun b!1170082 () Bool)

(declare-fun res!776486 () Bool)

(assert (=> b!1170082 (=> (not res!776486) (not e!665019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1170082 (= res!776486 (validMask!0 mask!1564))))

(declare-fun b!1170083 () Bool)

(declare-fun e!665025 () Bool)

(assert (=> b!1170083 (= e!665025 (not e!665021))))

(declare-fun res!776485 () Bool)

(assert (=> b!1170083 (=> res!776485 e!665021)))

(assert (=> b!1170083 (= res!776485 (bvsgt from!1455 i!673))))

(assert (=> b!1170083 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38600 0))(
  ( (Unit!38601) )
))
(declare-fun lt!526931 () Unit!38600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75637 (_ BitVec 64) (_ BitVec 32)) Unit!38600)

(assert (=> b!1170083 (= lt!526931 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1170084 () Bool)

(declare-fun res!776474 () Bool)

(assert (=> b!1170084 (=> (not res!776474) (not e!665025))))

(assert (=> b!1170084 (= res!776474 (arrayNoDuplicates!0 lt!526935 #b00000000000000000000000000000000 Nil!25581))))

(declare-fun mapNonEmpty!45941 () Bool)

(declare-fun tp!87351 () Bool)

(declare-fun e!665020 () Bool)

(assert (=> mapNonEmpty!45941 (= mapRes!45941 (and tp!87351 e!665020))))

(declare-fun mapValue!45941 () ValueCell!13995)

(declare-fun mapKey!45941 () (_ BitVec 32))

(declare-fun mapRest!45941 () (Array (_ BitVec 32) ValueCell!13995))

(assert (=> mapNonEmpty!45941 (= (arr!36469 _values!996) (store mapRest!45941 mapKey!45941 mapValue!45941))))

(declare-fun b!1170085 () Bool)

(assert (=> b!1170085 (= e!665020 tp_is_empty!29409)))

(declare-fun b!1170086 () Bool)

(assert (=> b!1170086 (= e!665026 e!665022)))

(declare-fun res!776477 () Bool)

(assert (=> b!1170086 (=> res!776477 e!665022)))

(assert (=> b!1170086 (= res!776477 (not (validKeyInArray!0 (select (arr!36468 _keys!1208) from!1455))))))

(declare-fun lt!526930 () ListLongMap!16817)

(assert (=> b!1170086 (= lt!526930 lt!526936)))

(declare-fun lt!526929 () ListLongMap!16817)

(declare-fun -!1495 (ListLongMap!16817 (_ BitVec 64)) ListLongMap!16817)

(assert (=> b!1170086 (= lt!526936 (-!1495 lt!526929 k0!934))))

(assert (=> b!1170086 (= lt!526930 (getCurrentListMapNoExtraKeys!4888 lt!526935 lt!526937 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1170086 (= lt!526929 (getCurrentListMapNoExtraKeys!4888 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526928 () Unit!38600)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!722 (array!75637 array!75639 (_ BitVec 32) (_ BitVec 32) V!44339 V!44339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38600)

(assert (=> b!1170086 (= lt!526928 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!722 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45941 () Bool)

(assert (=> mapIsEmpty!45941 mapRes!45941))

(declare-fun b!1170087 () Bool)

(declare-fun res!776478 () Bool)

(assert (=> b!1170087 (=> (not res!776478) (not e!665019))))

(assert (=> b!1170087 (= res!776478 (and (= (size!37005 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37004 _keys!1208) (size!37005 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1170088 () Bool)

(assert (=> b!1170088 (= e!665019 e!665025)))

(declare-fun res!776488 () Bool)

(assert (=> b!1170088 (=> (not res!776488) (not e!665025))))

(assert (=> b!1170088 (= res!776488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526935 mask!1564))))

(assert (=> b!1170088 (= lt!526935 (array!75638 (store (arr!36468 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37004 _keys!1208)))))

(declare-fun b!1170089 () Bool)

(assert (=> b!1170089 (= e!665027 true)))

(assert (=> b!1170089 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!526933 () Unit!38600)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38600)

(assert (=> b!1170089 (= lt!526933 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!99300 res!776482) b!1170082))

(assert (= (and b!1170082 res!776486) b!1170087))

(assert (= (and b!1170087 res!776478) b!1170074))

(assert (= (and b!1170074 res!776476) b!1170071))

(assert (= (and b!1170071 res!776475) b!1170080))

(assert (= (and b!1170080 res!776484) b!1170077))

(assert (= (and b!1170077 res!776479) b!1170076))

(assert (= (and b!1170076 res!776481) b!1170088))

(assert (= (and b!1170088 res!776488) b!1170084))

(assert (= (and b!1170084 res!776474) b!1170083))

(assert (= (and b!1170083 (not res!776485)) b!1170072))

(assert (= (and b!1170072 (not res!776480)) b!1170086))

(assert (= (and b!1170086 (not res!776477)) b!1170079))

(assert (= (and b!1170079 res!776487) b!1170073))

(assert (= (and b!1170073 (not res!776483)) b!1170078))

(assert (= (and b!1170079 (not res!776473)) b!1170089))

(assert (= (and b!1170075 condMapEmpty!45941) mapIsEmpty!45941))

(assert (= (and b!1170075 (not condMapEmpty!45941)) mapNonEmpty!45941))

(get-info :version)

(assert (= (and mapNonEmpty!45941 ((_ is ValueCellFull!13995) mapValue!45941)) b!1170085))

(assert (= (and b!1170075 ((_ is ValueCellFull!13995) mapDefault!45941)) b!1170081))

(assert (= start!99300 b!1170075))

(declare-fun b_lambda!20023 () Bool)

(assert (=> (not b_lambda!20023) (not b!1170072)))

(declare-fun t!37454 () Bool)

(declare-fun tb!9691 () Bool)

(assert (=> (and start!99300 (= defaultEntry!1004 defaultEntry!1004) t!37454) tb!9691))

(declare-fun result!19949 () Bool)

(assert (=> tb!9691 (= result!19949 tp_is_empty!29409)))

(assert (=> b!1170072 t!37454))

(declare-fun b_and!40627 () Bool)

(assert (= b_and!40625 (and (=> t!37454 result!19949) b_and!40627)))

(declare-fun m!1077907 () Bool)

(assert (=> b!1170086 m!1077907))

(declare-fun m!1077909 () Bool)

(assert (=> b!1170086 m!1077909))

(declare-fun m!1077911 () Bool)

(assert (=> b!1170086 m!1077911))

(declare-fun m!1077913 () Bool)

(assert (=> b!1170086 m!1077913))

(assert (=> b!1170086 m!1077911))

(declare-fun m!1077915 () Bool)

(assert (=> b!1170086 m!1077915))

(declare-fun m!1077917 () Bool)

(assert (=> b!1170086 m!1077917))

(declare-fun m!1077919 () Bool)

(assert (=> b!1170083 m!1077919))

(declare-fun m!1077921 () Bool)

(assert (=> b!1170083 m!1077921))

(declare-fun m!1077923 () Bool)

(assert (=> b!1170071 m!1077923))

(declare-fun m!1077925 () Bool)

(assert (=> mapNonEmpty!45941 m!1077925))

(declare-fun m!1077927 () Bool)

(assert (=> b!1170074 m!1077927))

(declare-fun m!1077929 () Bool)

(assert (=> b!1170089 m!1077929))

(declare-fun m!1077931 () Bool)

(assert (=> b!1170089 m!1077931))

(declare-fun m!1077933 () Bool)

(assert (=> b!1170077 m!1077933))

(declare-fun m!1077935 () Bool)

(assert (=> start!99300 m!1077935))

(declare-fun m!1077937 () Bool)

(assert (=> start!99300 m!1077937))

(assert (=> b!1170079 m!1077911))

(declare-fun m!1077939 () Bool)

(assert (=> b!1170079 m!1077939))

(assert (=> b!1170079 m!1077939))

(declare-fun m!1077941 () Bool)

(assert (=> b!1170079 m!1077941))

(declare-fun m!1077943 () Bool)

(assert (=> b!1170079 m!1077943))

(declare-fun m!1077945 () Bool)

(assert (=> b!1170082 m!1077945))

(assert (=> b!1170073 m!1077911))

(declare-fun m!1077947 () Bool)

(assert (=> b!1170076 m!1077947))

(declare-fun m!1077949 () Bool)

(assert (=> b!1170084 m!1077949))

(declare-fun m!1077951 () Bool)

(assert (=> b!1170078 m!1077951))

(declare-fun m!1077953 () Bool)

(assert (=> b!1170072 m!1077953))

(declare-fun m!1077955 () Bool)

(assert (=> b!1170072 m!1077955))

(declare-fun m!1077957 () Bool)

(assert (=> b!1170072 m!1077957))

(declare-fun m!1077959 () Bool)

(assert (=> b!1170072 m!1077959))

(declare-fun m!1077961 () Bool)

(assert (=> b!1170088 m!1077961))

(declare-fun m!1077963 () Bool)

(assert (=> b!1170088 m!1077963))

(check-sat (not b_lambda!20023) (not b_next!24879) (not b!1170088) (not b!1170077) (not b!1170074) (not b!1170083) (not b!1170082) (not b!1170071) (not b!1170084) (not start!99300) (not mapNonEmpty!45941) (not b!1170086) (not b!1170079) (not b!1170089) b_and!40627 tp_is_empty!29409 (not b!1170078) (not b!1170072))
(check-sat b_and!40627 (not b_next!24879))
