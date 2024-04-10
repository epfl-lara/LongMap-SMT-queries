; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99264 () Bool)

(assert start!99264)

(declare-fun b_free!24843 () Bool)

(declare-fun b_next!24843 () Bool)

(assert (=> start!99264 (= b_free!24843 (not b_next!24843))))

(declare-fun tp!87243 () Bool)

(declare-fun b_and!40553 () Bool)

(assert (=> start!99264 (= tp!87243 b_and!40553)))

(declare-fun mapNonEmpty!45887 () Bool)

(declare-fun mapRes!45887 () Bool)

(declare-fun tp!87242 () Bool)

(declare-fun e!664419 () Bool)

(assert (=> mapNonEmpty!45887 (= mapRes!45887 (and tp!87242 e!664419))))

(declare-datatypes ((V!44291 0))(
  ( (V!44292 (val!14743 Int)) )
))
(declare-datatypes ((ValueCell!13977 0))(
  ( (ValueCellFull!13977 (v!17381 V!44291)) (EmptyCell!13977) )
))
(declare-fun mapRest!45887 () (Array (_ BitVec 32) ValueCell!13977))

(declare-fun mapKey!45887 () (_ BitVec 32))

(declare-fun mapValue!45887 () ValueCell!13977)

(declare-datatypes ((array!75569 0))(
  ( (array!75570 (arr!36434 (Array (_ BitVec 32) ValueCell!13977)) (size!36970 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75569)

(assert (=> mapNonEmpty!45887 (= (arr!36434 _values!996) (store mapRest!45887 mapKey!45887 mapValue!45887))))

(declare-fun b!1169058 () Bool)

(declare-fun res!775670 () Bool)

(declare-fun e!664422 () Bool)

(assert (=> b!1169058 (=> (not res!775670) (not e!664422))))

(declare-datatypes ((array!75571 0))(
  ( (array!75572 (arr!36435 (Array (_ BitVec 32) (_ BitVec 64))) (size!36971 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75571)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75571 (_ BitVec 32)) Bool)

(assert (=> b!1169058 (= res!775670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1169059 () Bool)

(declare-fun e!664429 () Bool)

(declare-fun arrayContainsKey!0 (array!75571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169059 (= e!664429 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169060 () Bool)

(declare-fun e!664426 () Bool)

(assert (=> b!1169060 (= e!664426 true)))

(declare-fun e!664427 () Bool)

(assert (=> b!1169060 e!664427))

(declare-fun res!775668 () Bool)

(assert (=> b!1169060 (=> (not res!775668) (not e!664427))))

(declare-datatypes ((tuple2!18822 0))(
  ( (tuple2!18823 (_1!9422 (_ BitVec 64)) (_2!9422 V!44291)) )
))
(declare-datatypes ((List!25560 0))(
  ( (Nil!25557) (Cons!25556 (h!26765 tuple2!18822) (t!37395 List!25560)) )
))
(declare-datatypes ((ListLongMap!16791 0))(
  ( (ListLongMap!16792 (toList!8411 List!25560)) )
))
(declare-fun lt!526391 () ListLongMap!16791)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!526388 () ListLongMap!16791)

(declare-fun lt!526387 () V!44291)

(declare-fun +!3744 (ListLongMap!16791 tuple2!18822) ListLongMap!16791)

(declare-fun get!18572 (ValueCell!13977 V!44291) V!44291)

(assert (=> b!1169060 (= res!775668 (= lt!526391 (+!3744 lt!526388 (tuple2!18823 (select (arr!36435 _keys!1208) from!1455) (get!18572 (select (arr!36434 _values!996) from!1455) lt!526387)))))))

(declare-fun b!1169061 () Bool)

(declare-fun res!775669 () Bool)

(declare-fun e!664420 () Bool)

(assert (=> b!1169061 (=> (not res!775669) (not e!664420))))

(declare-fun lt!526383 () array!75571)

(declare-datatypes ((List!25561 0))(
  ( (Nil!25558) (Cons!25557 (h!26766 (_ BitVec 64)) (t!37396 List!25561)) )
))
(declare-fun arrayNoDuplicates!0 (array!75571 (_ BitVec 32) List!25561) Bool)

(assert (=> b!1169061 (= res!775669 (arrayNoDuplicates!0 lt!526383 #b00000000000000000000000000000000 Nil!25558))))

(declare-fun mapIsEmpty!45887 () Bool)

(assert (=> mapIsEmpty!45887 mapRes!45887))

(declare-fun b!1169063 () Bool)

(assert (=> b!1169063 (= e!664427 e!664429)))

(declare-fun res!775660 () Bool)

(assert (=> b!1169063 (=> res!775660 e!664429)))

(assert (=> b!1169063 (= res!775660 (not (= (select (arr!36435 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169064 () Bool)

(declare-fun e!664425 () Bool)

(assert (=> b!1169064 (= e!664420 (not e!664425))))

(declare-fun res!775664 () Bool)

(assert (=> b!1169064 (=> res!775664 e!664425)))

(assert (=> b!1169064 (= res!775664 (bvsgt from!1455 i!673))))

(assert (=> b!1169064 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38574 0))(
  ( (Unit!38575) )
))
(declare-fun lt!526385 () Unit!38574)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75571 (_ BitVec 64) (_ BitVec 32)) Unit!38574)

(assert (=> b!1169064 (= lt!526385 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169065 () Bool)

(declare-fun res!775663 () Bool)

(assert (=> b!1169065 (=> (not res!775663) (not e!664422))))

(assert (=> b!1169065 (= res!775663 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25558))))

(declare-fun b!1169066 () Bool)

(assert (=> b!1169066 (= e!664422 e!664420)))

(declare-fun res!775659 () Bool)

(assert (=> b!1169066 (=> (not res!775659) (not e!664420))))

(assert (=> b!1169066 (= res!775659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526383 mask!1564))))

(assert (=> b!1169066 (= lt!526383 (array!75572 (store (arr!36435 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36971 _keys!1208)))))

(declare-fun b!1169067 () Bool)

(declare-fun res!775671 () Bool)

(assert (=> b!1169067 (=> (not res!775671) (not e!664422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169067 (= res!775671 (validKeyInArray!0 k0!934))))

(declare-fun b!1169068 () Bool)

(declare-fun e!664428 () Bool)

(declare-fun e!664421 () Bool)

(assert (=> b!1169068 (= e!664428 (and e!664421 mapRes!45887))))

(declare-fun condMapEmpty!45887 () Bool)

(declare-fun mapDefault!45887 () ValueCell!13977)

(assert (=> b!1169068 (= condMapEmpty!45887 (= (arr!36434 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13977)) mapDefault!45887)))))

(declare-fun b!1169069 () Bool)

(declare-fun res!775666 () Bool)

(assert (=> b!1169069 (=> (not res!775666) (not e!664422))))

(assert (=> b!1169069 (= res!775666 (= (select (arr!36435 _keys!1208) i!673) k0!934))))

(declare-fun b!1169070 () Bool)

(declare-fun tp_is_empty!29373 () Bool)

(assert (=> b!1169070 (= e!664419 tp_is_empty!29373)))

(declare-fun b!1169062 () Bool)

(declare-fun res!775662 () Bool)

(assert (=> b!1169062 (=> (not res!775662) (not e!664422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169062 (= res!775662 (validMask!0 mask!1564))))

(declare-fun res!775661 () Bool)

(assert (=> start!99264 (=> (not res!775661) (not e!664422))))

(assert (=> start!99264 (= res!775661 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36971 _keys!1208))))))

(assert (=> start!99264 e!664422))

(assert (=> start!99264 tp_is_empty!29373))

(declare-fun array_inv!27848 (array!75571) Bool)

(assert (=> start!99264 (array_inv!27848 _keys!1208)))

(assert (=> start!99264 true))

(assert (=> start!99264 tp!87243))

(declare-fun array_inv!27849 (array!75569) Bool)

(assert (=> start!99264 (and (array_inv!27849 _values!996) e!664428)))

(declare-fun b!1169071 () Bool)

(declare-fun e!664423 () Bool)

(assert (=> b!1169071 (= e!664423 e!664426)))

(declare-fun res!775672 () Bool)

(assert (=> b!1169071 (=> res!775672 e!664426)))

(assert (=> b!1169071 (= res!775672 (not (validKeyInArray!0 (select (arr!36435 _keys!1208) from!1455))))))

(declare-fun lt!526390 () ListLongMap!16791)

(assert (=> b!1169071 (= lt!526390 lt!526388)))

(declare-fun lt!526386 () ListLongMap!16791)

(declare-fun -!1483 (ListLongMap!16791 (_ BitVec 64)) ListLongMap!16791)

(assert (=> b!1169071 (= lt!526388 (-!1483 lt!526386 k0!934))))

(declare-fun zeroValue!944 () V!44291)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526392 () array!75569)

(declare-fun minValue!944 () V!44291)

(declare-fun getCurrentListMapNoExtraKeys!4875 (array!75571 array!75569 (_ BitVec 32) (_ BitVec 32) V!44291 V!44291 (_ BitVec 32) Int) ListLongMap!16791)

(assert (=> b!1169071 (= lt!526390 (getCurrentListMapNoExtraKeys!4875 lt!526383 lt!526392 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169071 (= lt!526386 (getCurrentListMapNoExtraKeys!4875 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526389 () Unit!38574)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!710 (array!75571 array!75569 (_ BitVec 32) (_ BitVec 32) V!44291 V!44291 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38574)

(assert (=> b!1169071 (= lt!526389 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!710 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169072 () Bool)

(declare-fun res!775665 () Bool)

(assert (=> b!1169072 (=> (not res!775665) (not e!664422))))

(assert (=> b!1169072 (= res!775665 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36971 _keys!1208))))))

(declare-fun b!1169073 () Bool)

(assert (=> b!1169073 (= e!664425 e!664423)))

(declare-fun res!775667 () Bool)

(assert (=> b!1169073 (=> res!775667 e!664423)))

(assert (=> b!1169073 (= res!775667 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1169073 (= lt!526391 (getCurrentListMapNoExtraKeys!4875 lt!526383 lt!526392 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1169073 (= lt!526392 (array!75570 (store (arr!36434 _values!996) i!673 (ValueCellFull!13977 lt!526387)) (size!36970 _values!996)))))

(declare-fun dynLambda!2854 (Int (_ BitVec 64)) V!44291)

(assert (=> b!1169073 (= lt!526387 (dynLambda!2854 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526384 () ListLongMap!16791)

(assert (=> b!1169073 (= lt!526384 (getCurrentListMapNoExtraKeys!4875 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169074 () Bool)

(declare-fun res!775658 () Bool)

(assert (=> b!1169074 (=> (not res!775658) (not e!664422))))

(assert (=> b!1169074 (= res!775658 (and (= (size!36970 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36971 _keys!1208) (size!36970 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169075 () Bool)

(assert (=> b!1169075 (= e!664421 tp_is_empty!29373)))

(assert (= (and start!99264 res!775661) b!1169062))

(assert (= (and b!1169062 res!775662) b!1169074))

(assert (= (and b!1169074 res!775658) b!1169058))

(assert (= (and b!1169058 res!775670) b!1169065))

(assert (= (and b!1169065 res!775663) b!1169072))

(assert (= (and b!1169072 res!775665) b!1169067))

(assert (= (and b!1169067 res!775671) b!1169069))

(assert (= (and b!1169069 res!775666) b!1169066))

(assert (= (and b!1169066 res!775659) b!1169061))

(assert (= (and b!1169061 res!775669) b!1169064))

(assert (= (and b!1169064 (not res!775664)) b!1169073))

(assert (= (and b!1169073 (not res!775667)) b!1169071))

(assert (= (and b!1169071 (not res!775672)) b!1169060))

(assert (= (and b!1169060 res!775668) b!1169063))

(assert (= (and b!1169063 (not res!775660)) b!1169059))

(assert (= (and b!1169068 condMapEmpty!45887) mapIsEmpty!45887))

(assert (= (and b!1169068 (not condMapEmpty!45887)) mapNonEmpty!45887))

(get-info :version)

(assert (= (and mapNonEmpty!45887 ((_ is ValueCellFull!13977) mapValue!45887)) b!1169070))

(assert (= (and b!1169068 ((_ is ValueCellFull!13977) mapDefault!45887)) b!1169075))

(assert (= start!99264 b!1169068))

(declare-fun b_lambda!19987 () Bool)

(assert (=> (not b_lambda!19987) (not b!1169073)))

(declare-fun t!37394 () Bool)

(declare-fun tb!9655 () Bool)

(assert (=> (and start!99264 (= defaultEntry!1004 defaultEntry!1004) t!37394) tb!9655))

(declare-fun result!19877 () Bool)

(assert (=> tb!9655 (= result!19877 tp_is_empty!29373)))

(assert (=> b!1169073 t!37394))

(declare-fun b_and!40555 () Bool)

(assert (= b_and!40553 (and (=> t!37394 result!19877) b_and!40555)))

(declare-fun m!1076931 () Bool)

(assert (=> b!1169067 m!1076931))

(declare-fun m!1076933 () Bool)

(assert (=> b!1169059 m!1076933))

(declare-fun m!1076935 () Bool)

(assert (=> b!1169062 m!1076935))

(declare-fun m!1076937 () Bool)

(assert (=> b!1169060 m!1076937))

(declare-fun m!1076939 () Bool)

(assert (=> b!1169060 m!1076939))

(assert (=> b!1169060 m!1076939))

(declare-fun m!1076941 () Bool)

(assert (=> b!1169060 m!1076941))

(declare-fun m!1076943 () Bool)

(assert (=> b!1169060 m!1076943))

(declare-fun m!1076945 () Bool)

(assert (=> b!1169069 m!1076945))

(declare-fun m!1076947 () Bool)

(assert (=> start!99264 m!1076947))

(declare-fun m!1076949 () Bool)

(assert (=> start!99264 m!1076949))

(declare-fun m!1076951 () Bool)

(assert (=> b!1169073 m!1076951))

(declare-fun m!1076953 () Bool)

(assert (=> b!1169073 m!1076953))

(declare-fun m!1076955 () Bool)

(assert (=> b!1169073 m!1076955))

(declare-fun m!1076957 () Bool)

(assert (=> b!1169073 m!1076957))

(declare-fun m!1076959 () Bool)

(assert (=> b!1169058 m!1076959))

(declare-fun m!1076961 () Bool)

(assert (=> b!1169064 m!1076961))

(declare-fun m!1076963 () Bool)

(assert (=> b!1169064 m!1076963))

(declare-fun m!1076965 () Bool)

(assert (=> b!1169071 m!1076965))

(declare-fun m!1076967 () Bool)

(assert (=> b!1169071 m!1076967))

(declare-fun m!1076969 () Bool)

(assert (=> b!1169071 m!1076969))

(assert (=> b!1169071 m!1076937))

(assert (=> b!1169071 m!1076937))

(declare-fun m!1076971 () Bool)

(assert (=> b!1169071 m!1076971))

(declare-fun m!1076973 () Bool)

(assert (=> b!1169071 m!1076973))

(declare-fun m!1076975 () Bool)

(assert (=> b!1169066 m!1076975))

(declare-fun m!1076977 () Bool)

(assert (=> b!1169066 m!1076977))

(declare-fun m!1076979 () Bool)

(assert (=> b!1169065 m!1076979))

(assert (=> b!1169063 m!1076937))

(declare-fun m!1076981 () Bool)

(assert (=> b!1169061 m!1076981))

(declare-fun m!1076983 () Bool)

(assert (=> mapNonEmpty!45887 m!1076983))

(check-sat (not start!99264) (not b!1169062) (not b!1169071) (not b!1169059) b_and!40555 (not b!1169058) (not b!1169064) (not b_lambda!19987) (not b!1169065) (not b!1169067) (not b_next!24843) tp_is_empty!29373 (not b!1169061) (not b!1169066) (not mapNonEmpty!45887) (not b!1169060) (not b!1169073))
(check-sat b_and!40555 (not b_next!24843))
