; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97258 () Bool)

(assert start!97258)

(declare-fun b_free!23229 () Bool)

(declare-fun b_next!23229 () Bool)

(assert (=> start!97258 (= b_free!23229 (not b_next!23229))))

(declare-fun tp!81986 () Bool)

(declare-fun b_and!37289 () Bool)

(assert (=> start!97258 (= tp!81986 b_and!37289)))

(declare-fun b!1107095 () Bool)

(declare-fun e!631684 () Bool)

(declare-fun tp_is_empty!27489 () Bool)

(assert (=> b!1107095 (= e!631684 tp_is_empty!27489)))

(declare-fun mapIsEmpty!43051 () Bool)

(declare-fun mapRes!43051 () Bool)

(assert (=> mapIsEmpty!43051 mapRes!43051))

(declare-fun b!1107097 () Bool)

(declare-fun res!738844 () Bool)

(declare-fun e!631686 () Bool)

(assert (=> b!1107097 (=> (not res!738844) (not e!631686))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107097 (= res!738844 (validMask!0 mask!1564))))

(declare-datatypes ((V!41779 0))(
  ( (V!41780 (val!13801 Int)) )
))
(declare-fun zeroValue!944 () V!41779)

(declare-fun bm!46380 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!71895 0))(
  ( (array!71896 (arr!34600 (Array (_ BitVec 32) (_ BitVec 64))) (size!35136 (_ BitVec 32))) )
))
(declare-fun lt!495569 () array!71895)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17426 0))(
  ( (tuple2!17427 (_1!8724 (_ BitVec 64)) (_2!8724 V!41779)) )
))
(declare-datatypes ((List!24112 0))(
  ( (Nil!24109) (Cons!24108 (h!25317 tuple2!17426) (t!34387 List!24112)) )
))
(declare-datatypes ((ListLongMap!15395 0))(
  ( (ListLongMap!15396 (toList!7713 List!24112)) )
))
(declare-fun call!46383 () ListLongMap!15395)

(declare-datatypes ((ValueCell!13035 0))(
  ( (ValueCellFull!13035 (v!16434 V!41779)) (EmptyCell!13035) )
))
(declare-datatypes ((array!71897 0))(
  ( (array!71898 (arr!34601 (Array (_ BitVec 32) ValueCell!13035)) (size!35137 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71897)

(declare-fun minValue!944 () V!41779)

(declare-fun getCurrentListMapNoExtraKeys!4211 (array!71895 array!71897 (_ BitVec 32) (_ BitVec 32) V!41779 V!41779 (_ BitVec 32) Int) ListLongMap!15395)

(declare-fun dynLambda!2346 (Int (_ BitVec 64)) V!41779)

(assert (=> bm!46380 (= call!46383 (getCurrentListMapNoExtraKeys!4211 lt!495569 (array!71898 (store (arr!34601 _values!996) i!673 (ValueCellFull!13035 (dynLambda!2346 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35137 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107098 () Bool)

(declare-fun res!738845 () Bool)

(declare-fun e!631682 () Bool)

(assert (=> b!1107098 (=> (not res!738845) (not e!631682))))

(declare-datatypes ((List!24113 0))(
  ( (Nil!24110) (Cons!24109 (h!25318 (_ BitVec 64)) (t!34388 List!24113)) )
))
(declare-fun arrayNoDuplicates!0 (array!71895 (_ BitVec 32) List!24113) Bool)

(assert (=> b!1107098 (= res!738845 (arrayNoDuplicates!0 lt!495569 #b00000000000000000000000000000000 Nil!24110))))

(declare-fun b!1107099 () Bool)

(declare-fun res!738843 () Bool)

(assert (=> b!1107099 (=> (not res!738843) (not e!631686))))

(declare-fun _keys!1208 () array!71895)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71895 (_ BitVec 32)) Bool)

(assert (=> b!1107099 (= res!738843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107100 () Bool)

(declare-fun res!738847 () Bool)

(assert (=> b!1107100 (=> (not res!738847) (not e!631686))))

(assert (=> b!1107100 (= res!738847 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24110))))

(declare-fun call!46384 () ListLongMap!15395)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1107101 () Bool)

(declare-fun e!631685 () Bool)

(declare-fun -!995 (ListLongMap!15395 (_ BitVec 64)) ListLongMap!15395)

(assert (=> b!1107101 (= e!631685 (= call!46383 (-!995 call!46384 k0!934)))))

(declare-fun b!1107102 () Bool)

(declare-fun e!631689 () Bool)

(assert (=> b!1107102 (= e!631689 true)))

(assert (=> b!1107102 e!631685))

(declare-fun c!109023 () Bool)

(assert (=> b!1107102 (= c!109023 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36332 0))(
  ( (Unit!36333) )
))
(declare-fun lt!495567 () Unit!36332)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!241 (array!71895 array!71897 (_ BitVec 32) (_ BitVec 32) V!41779 V!41779 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36332)

(assert (=> b!1107102 (= lt!495567 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!241 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107103 () Bool)

(declare-fun res!738850 () Bool)

(assert (=> b!1107103 (=> (not res!738850) (not e!631686))))

(assert (=> b!1107103 (= res!738850 (= (select (arr!34600 _keys!1208) i!673) k0!934))))

(declare-fun b!1107104 () Bool)

(declare-fun res!738852 () Bool)

(assert (=> b!1107104 (=> (not res!738852) (not e!631686))))

(assert (=> b!1107104 (= res!738852 (and (= (size!35137 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35136 _keys!1208) (size!35137 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107105 () Bool)

(assert (=> b!1107105 (= e!631686 e!631682)))

(declare-fun res!738846 () Bool)

(assert (=> b!1107105 (=> (not res!738846) (not e!631682))))

(assert (=> b!1107105 (= res!738846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495569 mask!1564))))

(assert (=> b!1107105 (= lt!495569 (array!71896 (store (arr!34600 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35136 _keys!1208)))))

(declare-fun b!1107106 () Bool)

(declare-fun e!631688 () Bool)

(assert (=> b!1107106 (= e!631688 (and e!631684 mapRes!43051))))

(declare-fun condMapEmpty!43051 () Bool)

(declare-fun mapDefault!43051 () ValueCell!13035)

(assert (=> b!1107106 (= condMapEmpty!43051 (= (arr!34601 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13035)) mapDefault!43051)))))

(declare-fun res!738848 () Bool)

(assert (=> start!97258 (=> (not res!738848) (not e!631686))))

(assert (=> start!97258 (= res!738848 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35136 _keys!1208))))))

(assert (=> start!97258 e!631686))

(assert (=> start!97258 tp_is_empty!27489))

(declare-fun array_inv!26626 (array!71895) Bool)

(assert (=> start!97258 (array_inv!26626 _keys!1208)))

(assert (=> start!97258 true))

(assert (=> start!97258 tp!81986))

(declare-fun array_inv!26627 (array!71897) Bool)

(assert (=> start!97258 (and (array_inv!26627 _values!996) e!631688)))

(declare-fun b!1107096 () Bool)

(declare-fun res!738849 () Bool)

(assert (=> b!1107096 (=> (not res!738849) (not e!631686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107096 (= res!738849 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43051 () Bool)

(declare-fun tp!81985 () Bool)

(declare-fun e!631683 () Bool)

(assert (=> mapNonEmpty!43051 (= mapRes!43051 (and tp!81985 e!631683))))

(declare-fun mapKey!43051 () (_ BitVec 32))

(declare-fun mapValue!43051 () ValueCell!13035)

(declare-fun mapRest!43051 () (Array (_ BitVec 32) ValueCell!13035))

(assert (=> mapNonEmpty!43051 (= (arr!34601 _values!996) (store mapRest!43051 mapKey!43051 mapValue!43051))))

(declare-fun bm!46381 () Bool)

(assert (=> bm!46381 (= call!46384 (getCurrentListMapNoExtraKeys!4211 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107107 () Bool)

(assert (=> b!1107107 (= e!631682 (not e!631689))))

(declare-fun res!738853 () Bool)

(assert (=> b!1107107 (=> res!738853 e!631689)))

(assert (=> b!1107107 (= res!738853 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35136 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107107 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!495568 () Unit!36332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71895 (_ BitVec 64) (_ BitVec 32)) Unit!36332)

(assert (=> b!1107107 (= lt!495568 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107108 () Bool)

(assert (=> b!1107108 (= e!631683 tp_is_empty!27489)))

(declare-fun b!1107109 () Bool)

(assert (=> b!1107109 (= e!631685 (= call!46383 call!46384))))

(declare-fun b!1107110 () Bool)

(declare-fun res!738851 () Bool)

(assert (=> b!1107110 (=> (not res!738851) (not e!631686))))

(assert (=> b!1107110 (= res!738851 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35136 _keys!1208))))))

(assert (= (and start!97258 res!738848) b!1107097))

(assert (= (and b!1107097 res!738844) b!1107104))

(assert (= (and b!1107104 res!738852) b!1107099))

(assert (= (and b!1107099 res!738843) b!1107100))

(assert (= (and b!1107100 res!738847) b!1107110))

(assert (= (and b!1107110 res!738851) b!1107096))

(assert (= (and b!1107096 res!738849) b!1107103))

(assert (= (and b!1107103 res!738850) b!1107105))

(assert (= (and b!1107105 res!738846) b!1107098))

(assert (= (and b!1107098 res!738845) b!1107107))

(assert (= (and b!1107107 (not res!738853)) b!1107102))

(assert (= (and b!1107102 c!109023) b!1107101))

(assert (= (and b!1107102 (not c!109023)) b!1107109))

(assert (= (or b!1107101 b!1107109) bm!46380))

(assert (= (or b!1107101 b!1107109) bm!46381))

(assert (= (and b!1107106 condMapEmpty!43051) mapIsEmpty!43051))

(assert (= (and b!1107106 (not condMapEmpty!43051)) mapNonEmpty!43051))

(get-info :version)

(assert (= (and mapNonEmpty!43051 ((_ is ValueCellFull!13035) mapValue!43051)) b!1107108))

(assert (= (and b!1107106 ((_ is ValueCellFull!13035) mapDefault!43051)) b!1107095))

(assert (= start!97258 b!1107106))

(declare-fun b_lambda!18247 () Bool)

(assert (=> (not b_lambda!18247) (not bm!46380)))

(declare-fun t!34386 () Bool)

(declare-fun tb!8095 () Bool)

(assert (=> (and start!97258 (= defaultEntry!1004 defaultEntry!1004) t!34386) tb!8095))

(declare-fun result!16751 () Bool)

(assert (=> tb!8095 (= result!16751 tp_is_empty!27489)))

(assert (=> bm!46380 t!34386))

(declare-fun b_and!37291 () Bool)

(assert (= b_and!37289 (and (=> t!34386 result!16751) b_and!37291)))

(declare-fun m!1025953 () Bool)

(assert (=> b!1107107 m!1025953))

(declare-fun m!1025955 () Bool)

(assert (=> b!1107107 m!1025955))

(declare-fun m!1025957 () Bool)

(assert (=> bm!46380 m!1025957))

(declare-fun m!1025959 () Bool)

(assert (=> bm!46380 m!1025959))

(declare-fun m!1025961 () Bool)

(assert (=> bm!46380 m!1025961))

(declare-fun m!1025963 () Bool)

(assert (=> bm!46381 m!1025963))

(declare-fun m!1025965 () Bool)

(assert (=> b!1107102 m!1025965))

(declare-fun m!1025967 () Bool)

(assert (=> b!1107096 m!1025967))

(declare-fun m!1025969 () Bool)

(assert (=> mapNonEmpty!43051 m!1025969))

(declare-fun m!1025971 () Bool)

(assert (=> b!1107100 m!1025971))

(declare-fun m!1025973 () Bool)

(assert (=> b!1107099 m!1025973))

(declare-fun m!1025975 () Bool)

(assert (=> b!1107101 m!1025975))

(declare-fun m!1025977 () Bool)

(assert (=> b!1107097 m!1025977))

(declare-fun m!1025979 () Bool)

(assert (=> b!1107103 m!1025979))

(declare-fun m!1025981 () Bool)

(assert (=> b!1107105 m!1025981))

(declare-fun m!1025983 () Bool)

(assert (=> b!1107105 m!1025983))

(declare-fun m!1025985 () Bool)

(assert (=> b!1107098 m!1025985))

(declare-fun m!1025987 () Bool)

(assert (=> start!97258 m!1025987))

(declare-fun m!1025989 () Bool)

(assert (=> start!97258 m!1025989))

(check-sat tp_is_empty!27489 (not b!1107100) (not b!1107099) (not b!1107101) (not b!1107097) (not b!1107105) (not b!1107096) (not mapNonEmpty!43051) (not bm!46380) (not b!1107098) (not b_next!23229) (not b_lambda!18247) b_and!37291 (not b!1107107) (not start!97258) (not b!1107102) (not bm!46381))
(check-sat b_and!37291 (not b_next!23229))
