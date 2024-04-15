; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97376 () Bool)

(assert start!97376)

(declare-fun b_free!23353 () Bool)

(declare-fun b_next!23353 () Bool)

(assert (=> start!97376 (= b_free!23353 (not b_next!23353))))

(declare-fun tp!82358 () Bool)

(declare-fun b_and!37519 () Bool)

(assert (=> start!97376 (= tp!82358 b_and!37519)))

(declare-fun b!1110090 () Bool)

(declare-fun e!633103 () Bool)

(declare-fun e!633101 () Bool)

(assert (=> b!1110090 (= e!633103 e!633101)))

(declare-fun res!740830 () Bool)

(assert (=> b!1110090 (=> (not res!740830) (not e!633101))))

(declare-datatypes ((array!72036 0))(
  ( (array!72037 (arr!34671 (Array (_ BitVec 32) (_ BitVec 64))) (size!35209 (_ BitVec 32))) )
))
(declare-fun lt!495925 () array!72036)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72036 (_ BitVec 32)) Bool)

(assert (=> b!1110090 (= res!740830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495925 mask!1564))))

(declare-fun _keys!1208 () array!72036)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110090 (= lt!495925 (array!72037 (store (arr!34671 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35209 _keys!1208)))))

(declare-fun mapNonEmpty!43237 () Bool)

(declare-fun mapRes!43237 () Bool)

(declare-fun tp!82357 () Bool)

(declare-fun e!633107 () Bool)

(assert (=> mapNonEmpty!43237 (= mapRes!43237 (and tp!82357 e!633107))))

(declare-datatypes ((V!41945 0))(
  ( (V!41946 (val!13863 Int)) )
))
(declare-datatypes ((ValueCell!13097 0))(
  ( (ValueCellFull!13097 (v!16495 V!41945)) (EmptyCell!13097) )
))
(declare-fun mapValue!43237 () ValueCell!13097)

(declare-fun mapRest!43237 () (Array (_ BitVec 32) ValueCell!13097))

(declare-datatypes ((array!72038 0))(
  ( (array!72039 (arr!34672 (Array (_ BitVec 32) ValueCell!13097)) (size!35210 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72038)

(declare-fun mapKey!43237 () (_ BitVec 32))

(assert (=> mapNonEmpty!43237 (= (arr!34672 _values!996) (store mapRest!43237 mapKey!43237 mapValue!43237))))

(declare-fun zeroValue!944 () V!41945)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17590 0))(
  ( (tuple2!17591 (_1!8806 (_ BitVec 64)) (_2!8806 V!41945)) )
))
(declare-datatypes ((List!24245 0))(
  ( (Nil!24242) (Cons!24241 (h!25450 tuple2!17590) (t!34635 List!24245)) )
))
(declare-datatypes ((ListLongMap!15559 0))(
  ( (ListLongMap!15560 (toList!7795 List!24245)) )
))
(declare-fun call!46732 () ListLongMap!15559)

(declare-fun minValue!944 () V!41945)

(declare-fun bm!46729 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4310 (array!72036 array!72038 (_ BitVec 32) (_ BitVec 32) V!41945 V!41945 (_ BitVec 32) Int) ListLongMap!15559)

(declare-fun dynLambda!2375 (Int (_ BitVec 64)) V!41945)

(assert (=> bm!46729 (= call!46732 (getCurrentListMapNoExtraKeys!4310 lt!495925 (array!72039 (store (arr!34672 _values!996) i!673 (ValueCellFull!13097 (dynLambda!2375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35210 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110091 () Bool)

(declare-fun res!740821 () Bool)

(assert (=> b!1110091 (=> (not res!740821) (not e!633103))))

(assert (=> b!1110091 (= res!740821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110092 () Bool)

(declare-fun tp_is_empty!27613 () Bool)

(assert (=> b!1110092 (= e!633107 tp_is_empty!27613)))

(declare-fun mapIsEmpty!43237 () Bool)

(assert (=> mapIsEmpty!43237 mapRes!43237))

(declare-fun b!1110093 () Bool)

(declare-fun e!633105 () Bool)

(declare-fun e!633104 () Bool)

(assert (=> b!1110093 (= e!633105 (and e!633104 mapRes!43237))))

(declare-fun condMapEmpty!43237 () Bool)

(declare-fun mapDefault!43237 () ValueCell!13097)

(assert (=> b!1110093 (= condMapEmpty!43237 (= (arr!34672 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13097)) mapDefault!43237)))))

(declare-fun b!1110094 () Bool)

(declare-fun res!740823 () Bool)

(assert (=> b!1110094 (=> (not res!740823) (not e!633103))))

(declare-datatypes ((List!24246 0))(
  ( (Nil!24243) (Cons!24242 (h!25451 (_ BitVec 64)) (t!34636 List!24246)) )
))
(declare-fun arrayNoDuplicates!0 (array!72036 (_ BitVec 32) List!24246) Bool)

(assert (=> b!1110094 (= res!740823 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24243))))

(declare-fun b!1110095 () Bool)

(declare-fun res!740826 () Bool)

(assert (=> b!1110095 (=> (not res!740826) (not e!633103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110095 (= res!740826 (validMask!0 mask!1564))))

(declare-fun res!740829 () Bool)

(assert (=> start!97376 (=> (not res!740829) (not e!633103))))

(assert (=> start!97376 (= res!740829 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35209 _keys!1208))))))

(assert (=> start!97376 e!633103))

(assert (=> start!97376 tp_is_empty!27613))

(declare-fun array_inv!26724 (array!72036) Bool)

(assert (=> start!97376 (array_inv!26724 _keys!1208)))

(assert (=> start!97376 true))

(assert (=> start!97376 tp!82358))

(declare-fun array_inv!26725 (array!72038) Bool)

(assert (=> start!97376 (and (array_inv!26725 _values!996) e!633105)))

(declare-fun b!1110096 () Bool)

(declare-fun res!740820 () Bool)

(assert (=> b!1110096 (=> (not res!740820) (not e!633103))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110096 (= res!740820 (validKeyInArray!0 k0!934))))

(declare-fun b!1110097 () Bool)

(assert (=> b!1110097 (= e!633104 tp_is_empty!27613)))

(declare-fun bm!46730 () Bool)

(declare-fun call!46733 () ListLongMap!15559)

(assert (=> bm!46730 (= call!46733 (getCurrentListMapNoExtraKeys!4310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110098 () Bool)

(declare-fun e!633106 () Bool)

(assert (=> b!1110098 (= e!633101 (not e!633106))))

(declare-fun res!740827 () Bool)

(assert (=> b!1110098 (=> res!740827 e!633106)))

(assert (=> b!1110098 (= res!740827 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35209 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72036 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110098 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36241 0))(
  ( (Unit!36242) )
))
(declare-fun lt!495926 () Unit!36241)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72036 (_ BitVec 64) (_ BitVec 32)) Unit!36241)

(assert (=> b!1110098 (= lt!495926 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110099 () Bool)

(declare-fun res!740825 () Bool)

(assert (=> b!1110099 (=> (not res!740825) (not e!633103))))

(assert (=> b!1110099 (= res!740825 (and (= (size!35210 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35209 _keys!1208) (size!35210 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110100 () Bool)

(declare-fun res!740822 () Bool)

(assert (=> b!1110100 (=> (not res!740822) (not e!633101))))

(assert (=> b!1110100 (= res!740822 (arrayNoDuplicates!0 lt!495925 #b00000000000000000000000000000000 Nil!24243))))

(declare-fun b!1110101 () Bool)

(declare-fun res!740828 () Bool)

(assert (=> b!1110101 (=> (not res!740828) (not e!633103))))

(assert (=> b!1110101 (= res!740828 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35209 _keys!1208))))))

(declare-fun b!1110102 () Bool)

(declare-fun e!633102 () Bool)

(assert (=> b!1110102 (= e!633102 (= call!46732 call!46733))))

(declare-fun b!1110103 () Bool)

(assert (=> b!1110103 (= e!633106 true)))

(assert (=> b!1110103 e!633102))

(declare-fun c!109194 () Bool)

(assert (=> b!1110103 (= c!109194 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495927 () Unit!36241)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!282 (array!72036 array!72038 (_ BitVec 32) (_ BitVec 32) V!41945 V!41945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36241)

(assert (=> b!1110103 (= lt!495927 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!282 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110104 () Bool)

(declare-fun res!740824 () Bool)

(assert (=> b!1110104 (=> (not res!740824) (not e!633103))))

(assert (=> b!1110104 (= res!740824 (= (select (arr!34671 _keys!1208) i!673) k0!934))))

(declare-fun b!1110105 () Bool)

(declare-fun -!1010 (ListLongMap!15559 (_ BitVec 64)) ListLongMap!15559)

(assert (=> b!1110105 (= e!633102 (= call!46732 (-!1010 call!46733 k0!934)))))

(assert (= (and start!97376 res!740829) b!1110095))

(assert (= (and b!1110095 res!740826) b!1110099))

(assert (= (and b!1110099 res!740825) b!1110091))

(assert (= (and b!1110091 res!740821) b!1110094))

(assert (= (and b!1110094 res!740823) b!1110101))

(assert (= (and b!1110101 res!740828) b!1110096))

(assert (= (and b!1110096 res!740820) b!1110104))

(assert (= (and b!1110104 res!740824) b!1110090))

(assert (= (and b!1110090 res!740830) b!1110100))

(assert (= (and b!1110100 res!740822) b!1110098))

(assert (= (and b!1110098 (not res!740827)) b!1110103))

(assert (= (and b!1110103 c!109194) b!1110105))

(assert (= (and b!1110103 (not c!109194)) b!1110102))

(assert (= (or b!1110105 b!1110102) bm!46729))

(assert (= (or b!1110105 b!1110102) bm!46730))

(assert (= (and b!1110093 condMapEmpty!43237) mapIsEmpty!43237))

(assert (= (and b!1110093 (not condMapEmpty!43237)) mapNonEmpty!43237))

(get-info :version)

(assert (= (and mapNonEmpty!43237 ((_ is ValueCellFull!13097) mapValue!43237)) b!1110092))

(assert (= (and b!1110093 ((_ is ValueCellFull!13097) mapDefault!43237)) b!1110097))

(assert (= start!97376 b!1110093))

(declare-fun b_lambda!18357 () Bool)

(assert (=> (not b_lambda!18357) (not bm!46729)))

(declare-fun t!34634 () Bool)

(declare-fun tb!8211 () Bool)

(assert (=> (and start!97376 (= defaultEntry!1004 defaultEntry!1004) t!34634) tb!8211))

(declare-fun result!16991 () Bool)

(assert (=> tb!8211 (= result!16991 tp_is_empty!27613)))

(assert (=> bm!46729 t!34634))

(declare-fun b_and!37521 () Bool)

(assert (= b_and!37519 (and (=> t!34634 result!16991) b_and!37521)))

(declare-fun m!1027683 () Bool)

(assert (=> b!1110103 m!1027683))

(declare-fun m!1027685 () Bool)

(assert (=> b!1110104 m!1027685))

(declare-fun m!1027687 () Bool)

(assert (=> b!1110105 m!1027687))

(declare-fun m!1027689 () Bool)

(assert (=> b!1110094 m!1027689))

(declare-fun m!1027691 () Bool)

(assert (=> bm!46730 m!1027691))

(declare-fun m!1027693 () Bool)

(assert (=> bm!46729 m!1027693))

(declare-fun m!1027695 () Bool)

(assert (=> bm!46729 m!1027695))

(declare-fun m!1027697 () Bool)

(assert (=> bm!46729 m!1027697))

(declare-fun m!1027699 () Bool)

(assert (=> mapNonEmpty!43237 m!1027699))

(declare-fun m!1027701 () Bool)

(assert (=> b!1110100 m!1027701))

(declare-fun m!1027703 () Bool)

(assert (=> b!1110091 m!1027703))

(declare-fun m!1027705 () Bool)

(assert (=> b!1110096 m!1027705))

(declare-fun m!1027707 () Bool)

(assert (=> b!1110095 m!1027707))

(declare-fun m!1027709 () Bool)

(assert (=> b!1110098 m!1027709))

(declare-fun m!1027711 () Bool)

(assert (=> b!1110098 m!1027711))

(declare-fun m!1027713 () Bool)

(assert (=> start!97376 m!1027713))

(declare-fun m!1027715 () Bool)

(assert (=> start!97376 m!1027715))

(declare-fun m!1027717 () Bool)

(assert (=> b!1110090 m!1027717))

(declare-fun m!1027719 () Bool)

(assert (=> b!1110090 m!1027719))

(check-sat (not b!1110100) (not bm!46730) tp_is_empty!27613 (not start!97376) (not b!1110096) (not b!1110094) (not b_next!23353) (not b!1110090) (not b!1110091) (not b_lambda!18357) b_and!37521 (not b!1110103) (not b!1110098) (not mapNonEmpty!43237) (not b!1110095) (not bm!46729) (not b!1110105))
(check-sat b_and!37521 (not b_next!23353))
