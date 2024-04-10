; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98098 () Bool)

(assert start!98098)

(declare-fun b_free!23799 () Bool)

(declare-fun b_next!23799 () Bool)

(assert (=> start!98098 (= b_free!23799 (not b_next!23799))))

(declare-fun tp!84101 () Bool)

(declare-fun b_and!38381 () Bool)

(assert (=> start!98098 (= tp!84101 b_and!38381)))

(declare-fun b!1126967 () Bool)

(declare-fun e!641448 () Bool)

(declare-fun e!641457 () Bool)

(assert (=> b!1126967 (= e!641448 e!641457)))

(declare-fun res!753097 () Bool)

(assert (=> b!1126967 (=> res!753097 e!641457)))

(declare-datatypes ((array!73519 0))(
  ( (array!73520 (arr!35412 (Array (_ BitVec 32) (_ BitVec 64))) (size!35948 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73519)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1126967 (= res!753097 (not (= (select (arr!35412 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641453 () Bool)

(assert (=> b!1126967 e!641453))

(declare-fun c!109689 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126967 (= c!109689 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42899 0))(
  ( (V!42900 (val!14221 Int)) )
))
(declare-fun zeroValue!944 () V!42899)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13455 0))(
  ( (ValueCellFull!13455 (v!16854 V!42899)) (EmptyCell!13455) )
))
(declare-datatypes ((array!73521 0))(
  ( (array!73522 (arr!35413 (Array (_ BitVec 32) ValueCell!13455)) (size!35949 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73521)

(declare-fun minValue!944 () V!42899)

(declare-datatypes ((Unit!36928 0))(
  ( (Unit!36929) )
))
(declare-fun lt!500419 () Unit!36928)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!385 (array!73519 array!73521 (_ BitVec 32) (_ BitVec 32) V!42899 V!42899 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36928)

(assert (=> b!1126967 (= lt!500419 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!385 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126968 () Bool)

(declare-fun res!753087 () Bool)

(declare-fun e!641454 () Bool)

(assert (=> b!1126968 (=> (not res!753087) (not e!641454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126968 (= res!753087 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!44311 () Bool)

(declare-fun mapRes!44311 () Bool)

(declare-fun tp!84100 () Bool)

(declare-fun e!641455 () Bool)

(assert (=> mapNonEmpty!44311 (= mapRes!44311 (and tp!84100 e!641455))))

(declare-fun mapValue!44311 () ValueCell!13455)

(declare-fun mapKey!44311 () (_ BitVec 32))

(declare-fun mapRest!44311 () (Array (_ BitVec 32) ValueCell!13455))

(assert (=> mapNonEmpty!44311 (= (arr!35413 _values!996) (store mapRest!44311 mapKey!44311 mapValue!44311))))

(declare-fun res!753093 () Bool)

(assert (=> start!98098 (=> (not res!753093) (not e!641454))))

(assert (=> start!98098 (= res!753093 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35948 _keys!1208))))))

(assert (=> start!98098 e!641454))

(declare-fun tp_is_empty!28329 () Bool)

(assert (=> start!98098 tp_is_empty!28329))

(declare-fun array_inv!27178 (array!73519) Bool)

(assert (=> start!98098 (array_inv!27178 _keys!1208)))

(assert (=> start!98098 true))

(assert (=> start!98098 tp!84101))

(declare-fun e!641456 () Bool)

(declare-fun array_inv!27179 (array!73521) Bool)

(assert (=> start!98098 (and (array_inv!27179 _values!996) e!641456)))

(declare-fun b!1126969 () Bool)

(declare-fun e!641452 () Bool)

(assert (=> b!1126969 (= e!641456 (and e!641452 mapRes!44311))))

(declare-fun condMapEmpty!44311 () Bool)

(declare-fun mapDefault!44311 () ValueCell!13455)

(assert (=> b!1126969 (= condMapEmpty!44311 (= (arr!35413 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13455)) mapDefault!44311)))))

(declare-fun b!1126970 () Bool)

(declare-fun res!753094 () Bool)

(assert (=> b!1126970 (=> (not res!753094) (not e!641454))))

(assert (=> b!1126970 (= res!753094 (= (select (arr!35412 _keys!1208) i!673) k0!934))))

(declare-fun b!1126971 () Bool)

(assert (=> b!1126971 (= e!641457 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35948 _keys!1208)))))))

(declare-fun b!1126972 () Bool)

(declare-fun e!641449 () Bool)

(assert (=> b!1126972 (= e!641454 e!641449)))

(declare-fun res!753089 () Bool)

(assert (=> b!1126972 (=> (not res!753089) (not e!641449))))

(declare-fun lt!500418 () array!73519)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73519 (_ BitVec 32)) Bool)

(assert (=> b!1126972 (= res!753089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500418 mask!1564))))

(assert (=> b!1126972 (= lt!500418 (array!73520 (store (arr!35412 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35948 _keys!1208)))))

(declare-fun b!1126973 () Bool)

(assert (=> b!1126973 (= e!641455 tp_is_empty!28329)))

(declare-fun b!1126974 () Bool)

(declare-fun res!753098 () Bool)

(assert (=> b!1126974 (=> (not res!753098) (not e!641454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126974 (= res!753098 (validKeyInArray!0 k0!934))))

(declare-datatypes ((tuple2!17882 0))(
  ( (tuple2!17883 (_1!8952 (_ BitVec 64)) (_2!8952 V!42899)) )
))
(declare-datatypes ((List!24656 0))(
  ( (Nil!24653) (Cons!24652 (h!25861 tuple2!17882) (t!35447 List!24656)) )
))
(declare-datatypes ((ListLongMap!15851 0))(
  ( (ListLongMap!15852 (toList!7941 List!24656)) )
))
(declare-fun call!47680 () ListLongMap!15851)

(declare-fun b!1126975 () Bool)

(declare-fun call!47679 () ListLongMap!15851)

(declare-fun -!1133 (ListLongMap!15851 (_ BitVec 64)) ListLongMap!15851)

(assert (=> b!1126975 (= e!641453 (= call!47680 (-!1133 call!47679 k0!934)))))

(declare-fun b!1126976 () Bool)

(declare-fun res!753092 () Bool)

(assert (=> b!1126976 (=> (not res!753092) (not e!641454))))

(assert (=> b!1126976 (= res!753092 (and (= (size!35949 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35948 _keys!1208) (size!35949 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126977 () Bool)

(declare-fun res!753091 () Bool)

(assert (=> b!1126977 (=> (not res!753091) (not e!641454))))

(declare-datatypes ((List!24657 0))(
  ( (Nil!24654) (Cons!24653 (h!25862 (_ BitVec 64)) (t!35448 List!24657)) )
))
(declare-fun arrayNoDuplicates!0 (array!73519 (_ BitVec 32) List!24657) Bool)

(assert (=> b!1126977 (= res!753091 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24654))))

(declare-fun b!1126978 () Bool)

(assert (=> b!1126978 (= e!641453 (= call!47680 call!47679))))

(declare-fun b!1126979 () Bool)

(declare-fun res!753095 () Bool)

(assert (=> b!1126979 (=> (not res!753095) (not e!641454))))

(assert (=> b!1126979 (= res!753095 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35948 _keys!1208))))))

(declare-fun lt!500415 () array!73521)

(declare-fun bm!47676 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4429 (array!73519 array!73521 (_ BitVec 32) (_ BitVec 32) V!42899 V!42899 (_ BitVec 32) Int) ListLongMap!15851)

(assert (=> bm!47676 (= call!47680 (getCurrentListMapNoExtraKeys!4429 lt!500418 lt!500415 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126980 () Bool)

(declare-fun e!641451 () Bool)

(assert (=> b!1126980 (= e!641449 (not e!641451))))

(declare-fun res!753100 () Bool)

(assert (=> b!1126980 (=> res!753100 e!641451)))

(assert (=> b!1126980 (= res!753100 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126980 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500417 () Unit!36928)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73519 (_ BitVec 64) (_ BitVec 32)) Unit!36928)

(assert (=> b!1126980 (= lt!500417 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44311 () Bool)

(assert (=> mapIsEmpty!44311 mapRes!44311))

(declare-fun b!1126981 () Bool)

(declare-fun res!753088 () Bool)

(assert (=> b!1126981 (=> (not res!753088) (not e!641449))))

(assert (=> b!1126981 (= res!753088 (arrayNoDuplicates!0 lt!500418 #b00000000000000000000000000000000 Nil!24654))))

(declare-fun b!1126982 () Bool)

(assert (=> b!1126982 (= e!641452 tp_is_empty!28329)))

(declare-fun bm!47677 () Bool)

(assert (=> bm!47677 (= call!47679 (getCurrentListMapNoExtraKeys!4429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126983 () Bool)

(assert (=> b!1126983 (= e!641451 e!641448)))

(declare-fun res!753096 () Bool)

(assert (=> b!1126983 (=> res!753096 e!641448)))

(assert (=> b!1126983 (= res!753096 (not (= from!1455 i!673)))))

(declare-fun lt!500416 () ListLongMap!15851)

(assert (=> b!1126983 (= lt!500416 (getCurrentListMapNoExtraKeys!4429 lt!500418 lt!500415 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2517 (Int (_ BitVec 64)) V!42899)

(assert (=> b!1126983 (= lt!500415 (array!73522 (store (arr!35413 _values!996) i!673 (ValueCellFull!13455 (dynLambda!2517 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35949 _values!996)))))

(declare-fun lt!500420 () ListLongMap!15851)

(assert (=> b!1126983 (= lt!500420 (getCurrentListMapNoExtraKeys!4429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126984 () Bool)

(declare-fun res!753090 () Bool)

(assert (=> b!1126984 (=> (not res!753090) (not e!641454))))

(assert (=> b!1126984 (= res!753090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126985 () Bool)

(declare-fun res!753099 () Bool)

(assert (=> b!1126985 (=> res!753099 e!641457)))

(declare-fun contains!6473 (ListLongMap!15851 (_ BitVec 64)) Bool)

(assert (=> b!1126985 (= res!753099 (not (contains!6473 (getCurrentListMapNoExtraKeys!4429 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(assert (= (and start!98098 res!753093) b!1126968))

(assert (= (and b!1126968 res!753087) b!1126976))

(assert (= (and b!1126976 res!753092) b!1126984))

(assert (= (and b!1126984 res!753090) b!1126977))

(assert (= (and b!1126977 res!753091) b!1126979))

(assert (= (and b!1126979 res!753095) b!1126974))

(assert (= (and b!1126974 res!753098) b!1126970))

(assert (= (and b!1126970 res!753094) b!1126972))

(assert (= (and b!1126972 res!753089) b!1126981))

(assert (= (and b!1126981 res!753088) b!1126980))

(assert (= (and b!1126980 (not res!753100)) b!1126983))

(assert (= (and b!1126983 (not res!753096)) b!1126967))

(assert (= (and b!1126967 c!109689) b!1126975))

(assert (= (and b!1126967 (not c!109689)) b!1126978))

(assert (= (or b!1126975 b!1126978) bm!47676))

(assert (= (or b!1126975 b!1126978) bm!47677))

(assert (= (and b!1126967 (not res!753097)) b!1126985))

(assert (= (and b!1126985 (not res!753099)) b!1126971))

(assert (= (and b!1126969 condMapEmpty!44311) mapIsEmpty!44311))

(assert (= (and b!1126969 (not condMapEmpty!44311)) mapNonEmpty!44311))

(get-info :version)

(assert (= (and mapNonEmpty!44311 ((_ is ValueCellFull!13455) mapValue!44311)) b!1126973))

(assert (= (and b!1126969 ((_ is ValueCellFull!13455) mapDefault!44311)) b!1126982))

(assert (= start!98098 b!1126969))

(declare-fun b_lambda!18769 () Bool)

(assert (=> (not b_lambda!18769) (not b!1126983)))

(declare-fun t!35446 () Bool)

(declare-fun tb!8611 () Bool)

(assert (=> (and start!98098 (= defaultEntry!1004 defaultEntry!1004) t!35446) tb!8611))

(declare-fun result!17783 () Bool)

(assert (=> tb!8611 (= result!17783 tp_is_empty!28329)))

(assert (=> b!1126983 t!35446))

(declare-fun b_and!38383 () Bool)

(assert (= b_and!38381 (and (=> t!35446 result!17783) b_and!38383)))

(declare-fun m!1040833 () Bool)

(assert (=> b!1126968 m!1040833))

(declare-fun m!1040835 () Bool)

(assert (=> bm!47676 m!1040835))

(declare-fun m!1040837 () Bool)

(assert (=> b!1126974 m!1040837))

(declare-fun m!1040839 () Bool)

(assert (=> b!1126972 m!1040839))

(declare-fun m!1040841 () Bool)

(assert (=> b!1126972 m!1040841))

(declare-fun m!1040843 () Bool)

(assert (=> b!1126981 m!1040843))

(declare-fun m!1040845 () Bool)

(assert (=> start!98098 m!1040845))

(declare-fun m!1040847 () Bool)

(assert (=> start!98098 m!1040847))

(declare-fun m!1040849 () Bool)

(assert (=> b!1126983 m!1040849))

(declare-fun m!1040851 () Bool)

(assert (=> b!1126983 m!1040851))

(declare-fun m!1040853 () Bool)

(assert (=> b!1126983 m!1040853))

(declare-fun m!1040855 () Bool)

(assert (=> b!1126983 m!1040855))

(declare-fun m!1040857 () Bool)

(assert (=> b!1126984 m!1040857))

(declare-fun m!1040859 () Bool)

(assert (=> b!1126975 m!1040859))

(declare-fun m!1040861 () Bool)

(assert (=> b!1126980 m!1040861))

(declare-fun m!1040863 () Bool)

(assert (=> b!1126980 m!1040863))

(declare-fun m!1040865 () Bool)

(assert (=> b!1126970 m!1040865))

(declare-fun m!1040867 () Bool)

(assert (=> bm!47677 m!1040867))

(declare-fun m!1040869 () Bool)

(assert (=> b!1126977 m!1040869))

(assert (=> b!1126985 m!1040867))

(assert (=> b!1126985 m!1040867))

(declare-fun m!1040871 () Bool)

(assert (=> b!1126985 m!1040871))

(declare-fun m!1040873 () Bool)

(assert (=> mapNonEmpty!44311 m!1040873))

(declare-fun m!1040875 () Bool)

(assert (=> b!1126967 m!1040875))

(declare-fun m!1040877 () Bool)

(assert (=> b!1126967 m!1040877))

(check-sat (not b!1126967) (not b!1126980) (not mapNonEmpty!44311) tp_is_empty!28329 (not b!1126983) (not start!98098) (not b!1126974) (not b!1126985) (not bm!47676) (not b!1126972) (not b_next!23799) (not b!1126975) (not b!1126977) b_and!38383 (not b!1126968) (not b!1126984) (not b!1126981) (not bm!47677) (not b_lambda!18769))
(check-sat b_and!38383 (not b_next!23799))
