; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98398 () Bool)

(assert start!98398)

(declare-fun b_free!23863 () Bool)

(declare-fun b_next!23863 () Bool)

(assert (=> start!98398 (= b_free!23863 (not b_next!23863))))

(declare-fun tp!84293 () Bool)

(declare-fun b_and!38519 () Bool)

(assert (=> start!98398 (= tp!84293 b_and!38519)))

(declare-fun b!1130099 () Bool)

(declare-fun e!643269 () Bool)

(declare-fun tp_is_empty!28393 () Bool)

(assert (=> b!1130099 (= e!643269 tp_is_empty!28393)))

(declare-datatypes ((V!42985 0))(
  ( (V!42986 (val!14253 Int)) )
))
(declare-fun zeroValue!944 () V!42985)

(declare-datatypes ((array!73689 0))(
  ( (array!73690 (arr!35491 (Array (_ BitVec 32) (_ BitVec 64))) (size!36028 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73689)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17960 0))(
  ( (tuple2!17961 (_1!8991 (_ BitVec 64)) (_2!8991 V!42985)) )
))
(declare-datatypes ((List!24737 0))(
  ( (Nil!24734) (Cons!24733 (h!25951 tuple2!17960) (t!35584 List!24737)) )
))
(declare-datatypes ((ListLongMap!15937 0))(
  ( (ListLongMap!15938 (toList!7984 List!24737)) )
))
(declare-fun call!47938 () ListLongMap!15937)

(declare-fun minValue!944 () V!42985)

(declare-fun bm!47936 () Bool)

(declare-datatypes ((ValueCell!13487 0))(
  ( (ValueCellFull!13487 (v!16882 V!42985)) (EmptyCell!13487) )
))
(declare-datatypes ((array!73691 0))(
  ( (array!73692 (arr!35492 (Array (_ BitVec 32) ValueCell!13487)) (size!36029 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73691)

(declare-fun getCurrentListMapNoExtraKeys!4504 (array!73689 array!73691 (_ BitVec 32) (_ BitVec 32) V!42985 V!42985 (_ BitVec 32) Int) ListLongMap!15937)

(assert (=> bm!47936 (= call!47938 (getCurrentListMapNoExtraKeys!4504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130100 () Bool)

(declare-fun e!643268 () Bool)

(assert (=> b!1130100 (= e!643268 true)))

(declare-fun lt!501590 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6521 (ListLongMap!15937 (_ BitVec 64)) Bool)

(assert (=> b!1130100 (= lt!501590 (contains!6521 (getCurrentListMapNoExtraKeys!4504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1130101 () Bool)

(declare-fun e!643263 () Bool)

(assert (=> b!1130101 (= e!643263 tp_is_empty!28393)))

(declare-fun b!1130102 () Bool)

(declare-fun res!754877 () Bool)

(declare-fun e!643265 () Bool)

(assert (=> b!1130102 (=> (not res!754877) (not e!643265))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130102 (= res!754877 (= (select (arr!35491 _keys!1208) i!673) k0!934))))

(declare-fun b!1130103 () Bool)

(declare-fun res!754882 () Bool)

(assert (=> b!1130103 (=> (not res!754882) (not e!643265))))

(assert (=> b!1130103 (= res!754882 (and (= (size!36029 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36028 _keys!1208) (size!36029 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130104 () Bool)

(declare-fun e!643264 () Bool)

(assert (=> b!1130104 (= e!643264 e!643268)))

(declare-fun res!754876 () Bool)

(assert (=> b!1130104 (=> res!754876 e!643268)))

(assert (=> b!1130104 (= res!754876 (not (= (select (arr!35491 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643271 () Bool)

(assert (=> b!1130104 e!643271))

(declare-fun c!110195 () Bool)

(assert (=> b!1130104 (= c!110195 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36963 0))(
  ( (Unit!36964) )
))
(declare-fun lt!501589 () Unit!36963)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!410 (array!73689 array!73691 (_ BitVec 32) (_ BitVec 32) V!42985 V!42985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36963)

(assert (=> b!1130104 (= lt!501589 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130105 () Bool)

(declare-fun e!643272 () Bool)

(declare-fun e!643267 () Bool)

(assert (=> b!1130105 (= e!643272 (not e!643267))))

(declare-fun res!754871 () Bool)

(assert (=> b!1130105 (=> res!754871 e!643267)))

(assert (=> b!1130105 (= res!754871 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130105 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501592 () Unit!36963)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73689 (_ BitVec 64) (_ BitVec 32)) Unit!36963)

(assert (=> b!1130105 (= lt!501592 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1130106 () Bool)

(declare-fun res!754878 () Bool)

(assert (=> b!1130106 (=> (not res!754878) (not e!643265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130106 (= res!754878 (validMask!0 mask!1564))))

(declare-fun res!754872 () Bool)

(assert (=> start!98398 (=> (not res!754872) (not e!643265))))

(assert (=> start!98398 (= res!754872 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36028 _keys!1208))))))

(assert (=> start!98398 e!643265))

(assert (=> start!98398 tp_is_empty!28393))

(declare-fun array_inv!27288 (array!73689) Bool)

(assert (=> start!98398 (array_inv!27288 _keys!1208)))

(assert (=> start!98398 true))

(assert (=> start!98398 tp!84293))

(declare-fun e!643270 () Bool)

(declare-fun array_inv!27289 (array!73691) Bool)

(assert (=> start!98398 (and (array_inv!27289 _values!996) e!643270)))

(declare-fun bm!47935 () Bool)

(declare-fun lt!501591 () array!73689)

(declare-fun lt!501594 () array!73691)

(declare-fun call!47939 () ListLongMap!15937)

(assert (=> bm!47935 (= call!47939 (getCurrentListMapNoExtraKeys!4504 lt!501591 lt!501594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130107 () Bool)

(assert (=> b!1130107 (= e!643271 (= call!47939 call!47938))))

(declare-fun b!1130108 () Bool)

(declare-fun mapRes!44407 () Bool)

(assert (=> b!1130108 (= e!643270 (and e!643269 mapRes!44407))))

(declare-fun condMapEmpty!44407 () Bool)

(declare-fun mapDefault!44407 () ValueCell!13487)

(assert (=> b!1130108 (= condMapEmpty!44407 (= (arr!35492 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13487)) mapDefault!44407)))))

(declare-fun b!1130109 () Bool)

(declare-fun -!1150 (ListLongMap!15937 (_ BitVec 64)) ListLongMap!15937)

(assert (=> b!1130109 (= e!643271 (= call!47939 (-!1150 call!47938 k0!934)))))

(declare-fun b!1130110 () Bool)

(declare-fun res!754874 () Bool)

(assert (=> b!1130110 (=> (not res!754874) (not e!643265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130110 (= res!754874 (validKeyInArray!0 k0!934))))

(declare-fun b!1130111 () Bool)

(assert (=> b!1130111 (= e!643265 e!643272)))

(declare-fun res!754879 () Bool)

(assert (=> b!1130111 (=> (not res!754879) (not e!643272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73689 (_ BitVec 32)) Bool)

(assert (=> b!1130111 (= res!754879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501591 mask!1564))))

(assert (=> b!1130111 (= lt!501591 (array!73690 (store (arr!35491 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36028 _keys!1208)))))

(declare-fun b!1130112 () Bool)

(assert (=> b!1130112 (= e!643267 e!643264)))

(declare-fun res!754881 () Bool)

(assert (=> b!1130112 (=> res!754881 e!643264)))

(assert (=> b!1130112 (= res!754881 (not (= from!1455 i!673)))))

(declare-fun lt!501593 () ListLongMap!15937)

(assert (=> b!1130112 (= lt!501593 (getCurrentListMapNoExtraKeys!4504 lt!501591 lt!501594 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2568 (Int (_ BitVec 64)) V!42985)

(assert (=> b!1130112 (= lt!501594 (array!73692 (store (arr!35492 _values!996) i!673 (ValueCellFull!13487 (dynLambda!2568 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36029 _values!996)))))

(declare-fun lt!501595 () ListLongMap!15937)

(assert (=> b!1130112 (= lt!501595 (getCurrentListMapNoExtraKeys!4504 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1130113 () Bool)

(declare-fun res!754873 () Bool)

(assert (=> b!1130113 (=> (not res!754873) (not e!643272))))

(declare-datatypes ((List!24738 0))(
  ( (Nil!24735) (Cons!24734 (h!25952 (_ BitVec 64)) (t!35585 List!24738)) )
))
(declare-fun arrayNoDuplicates!0 (array!73689 (_ BitVec 32) List!24738) Bool)

(assert (=> b!1130113 (= res!754873 (arrayNoDuplicates!0 lt!501591 #b00000000000000000000000000000000 Nil!24735))))

(declare-fun b!1130114 () Bool)

(declare-fun res!754880 () Bool)

(assert (=> b!1130114 (=> (not res!754880) (not e!643265))))

(assert (=> b!1130114 (= res!754880 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36028 _keys!1208))))))

(declare-fun b!1130115 () Bool)

(declare-fun res!754870 () Bool)

(assert (=> b!1130115 (=> (not res!754870) (not e!643265))))

(assert (=> b!1130115 (= res!754870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130116 () Bool)

(declare-fun res!754875 () Bool)

(assert (=> b!1130116 (=> (not res!754875) (not e!643265))))

(assert (=> b!1130116 (= res!754875 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24735))))

(declare-fun mapNonEmpty!44407 () Bool)

(declare-fun tp!84292 () Bool)

(assert (=> mapNonEmpty!44407 (= mapRes!44407 (and tp!84292 e!643263))))

(declare-fun mapRest!44407 () (Array (_ BitVec 32) ValueCell!13487))

(declare-fun mapKey!44407 () (_ BitVec 32))

(declare-fun mapValue!44407 () ValueCell!13487)

(assert (=> mapNonEmpty!44407 (= (arr!35492 _values!996) (store mapRest!44407 mapKey!44407 mapValue!44407))))

(declare-fun mapIsEmpty!44407 () Bool)

(assert (=> mapIsEmpty!44407 mapRes!44407))

(assert (= (and start!98398 res!754872) b!1130106))

(assert (= (and b!1130106 res!754878) b!1130103))

(assert (= (and b!1130103 res!754882) b!1130115))

(assert (= (and b!1130115 res!754870) b!1130116))

(assert (= (and b!1130116 res!754875) b!1130114))

(assert (= (and b!1130114 res!754880) b!1130110))

(assert (= (and b!1130110 res!754874) b!1130102))

(assert (= (and b!1130102 res!754877) b!1130111))

(assert (= (and b!1130111 res!754879) b!1130113))

(assert (= (and b!1130113 res!754873) b!1130105))

(assert (= (and b!1130105 (not res!754871)) b!1130112))

(assert (= (and b!1130112 (not res!754881)) b!1130104))

(assert (= (and b!1130104 c!110195) b!1130109))

(assert (= (and b!1130104 (not c!110195)) b!1130107))

(assert (= (or b!1130109 b!1130107) bm!47935))

(assert (= (or b!1130109 b!1130107) bm!47936))

(assert (= (and b!1130104 (not res!754876)) b!1130100))

(assert (= (and b!1130108 condMapEmpty!44407) mapIsEmpty!44407))

(assert (= (and b!1130108 (not condMapEmpty!44407)) mapNonEmpty!44407))

(get-info :version)

(assert (= (and mapNonEmpty!44407 ((_ is ValueCellFull!13487) mapValue!44407)) b!1130101))

(assert (= (and b!1130108 ((_ is ValueCellFull!13487) mapDefault!44407)) b!1130099))

(assert (= start!98398 b!1130108))

(declare-fun b_lambda!18843 () Bool)

(assert (=> (not b_lambda!18843) (not b!1130112)))

(declare-fun t!35583 () Bool)

(declare-fun tb!8667 () Bool)

(assert (=> (and start!98398 (= defaultEntry!1004 defaultEntry!1004) t!35583) tb!8667))

(declare-fun result!17903 () Bool)

(assert (=> tb!8667 (= result!17903 tp_is_empty!28393)))

(assert (=> b!1130112 t!35583))

(declare-fun b_and!38521 () Bool)

(assert (= b_and!38519 (and (=> t!35583 result!17903) b_and!38521)))

(declare-fun m!1043983 () Bool)

(assert (=> start!98398 m!1043983))

(declare-fun m!1043985 () Bool)

(assert (=> start!98398 m!1043985))

(declare-fun m!1043987 () Bool)

(assert (=> b!1130115 m!1043987))

(declare-fun m!1043989 () Bool)

(assert (=> mapNonEmpty!44407 m!1043989))

(declare-fun m!1043991 () Bool)

(assert (=> b!1130110 m!1043991))

(declare-fun m!1043993 () Bool)

(assert (=> b!1130116 m!1043993))

(declare-fun m!1043995 () Bool)

(assert (=> b!1130112 m!1043995))

(declare-fun m!1043997 () Bool)

(assert (=> b!1130112 m!1043997))

(declare-fun m!1043999 () Bool)

(assert (=> b!1130112 m!1043999))

(declare-fun m!1044001 () Bool)

(assert (=> b!1130112 m!1044001))

(declare-fun m!1044003 () Bool)

(assert (=> b!1130105 m!1044003))

(declare-fun m!1044005 () Bool)

(assert (=> b!1130105 m!1044005))

(declare-fun m!1044007 () Bool)

(assert (=> bm!47936 m!1044007))

(declare-fun m!1044009 () Bool)

(assert (=> b!1130102 m!1044009))

(declare-fun m!1044011 () Bool)

(assert (=> b!1130106 m!1044011))

(declare-fun m!1044013 () Bool)

(assert (=> b!1130104 m!1044013))

(declare-fun m!1044015 () Bool)

(assert (=> b!1130104 m!1044015))

(declare-fun m!1044017 () Bool)

(assert (=> b!1130113 m!1044017))

(assert (=> b!1130100 m!1044007))

(assert (=> b!1130100 m!1044007))

(declare-fun m!1044019 () Bool)

(assert (=> b!1130100 m!1044019))

(declare-fun m!1044021 () Bool)

(assert (=> b!1130109 m!1044021))

(declare-fun m!1044023 () Bool)

(assert (=> b!1130111 m!1044023))

(declare-fun m!1044025 () Bool)

(assert (=> b!1130111 m!1044025))

(declare-fun m!1044027 () Bool)

(assert (=> bm!47935 m!1044027))

(check-sat b_and!38521 (not b!1130109) (not mapNonEmpty!44407) (not b!1130106) (not bm!47935) (not b!1130115) tp_is_empty!28393 (not b!1130111) (not b!1130113) (not b!1130116) (not b!1130105) (not bm!47936) (not b!1130110) (not start!98398) (not b!1130104) (not b_next!23863) (not b!1130100) (not b_lambda!18843) (not b!1130112))
(check-sat b_and!38521 (not b_next!23863))
