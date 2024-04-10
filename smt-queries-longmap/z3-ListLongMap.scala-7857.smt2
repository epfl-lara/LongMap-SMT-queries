; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97888 () Bool)

(assert start!97888)

(declare-fun b_free!23589 () Bool)

(declare-fun b_next!23589 () Bool)

(assert (=> start!97888 (= b_free!23589 (not b_next!23589))))

(declare-fun tp!83471 () Bool)

(declare-fun b_and!37961 () Bool)

(assert (=> start!97888 (= tp!83471 b_and!37961)))

(declare-fun b!1120951 () Bool)

(declare-fun res!748858 () Bool)

(declare-fun e!638271 () Bool)

(assert (=> b!1120951 (=> (not res!748858) (not e!638271))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73119 0))(
  ( (array!73120 (arr!35212 (Array (_ BitVec 32) (_ BitVec 64))) (size!35748 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73119)

(assert (=> b!1120951 (= res!748858 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35748 _keys!1208))))))

(declare-fun b!1120952 () Bool)

(declare-fun e!638270 () Bool)

(declare-fun e!638269 () Bool)

(assert (=> b!1120952 (= e!638270 (not e!638269))))

(declare-fun res!748867 () Bool)

(assert (=> b!1120952 (=> res!748867 e!638269)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1120952 (= res!748867 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120952 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36776 0))(
  ( (Unit!36777) )
))
(declare-fun lt!498196 () Unit!36776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73119 (_ BitVec 64) (_ BitVec 32)) Unit!36776)

(assert (=> b!1120952 (= lt!498196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120953 () Bool)

(declare-fun res!748865 () Bool)

(assert (=> b!1120953 (=> (not res!748865) (not e!638271))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120953 (= res!748865 (validMask!0 mask!1564))))

(declare-fun b!1120954 () Bool)

(declare-fun e!638272 () Bool)

(assert (=> b!1120954 (= e!638272 true)))

(declare-fun e!638273 () Bool)

(assert (=> b!1120954 e!638273))

(declare-fun c!109374 () Bool)

(assert (=> b!1120954 (= c!109374 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42619 0))(
  ( (V!42620 (val!14116 Int)) )
))
(declare-fun zeroValue!944 () V!42619)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!498193 () Unit!36776)

(declare-datatypes ((ValueCell!13350 0))(
  ( (ValueCellFull!13350 (v!16749 V!42619)) (EmptyCell!13350) )
))
(declare-datatypes ((array!73121 0))(
  ( (array!73122 (arr!35213 (Array (_ BitVec 32) ValueCell!13350)) (size!35749 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73121)

(declare-fun minValue!944 () V!42619)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!318 (array!73119 array!73121 (_ BitVec 32) (_ BitVec 32) V!42619 V!42619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36776)

(assert (=> b!1120954 (= lt!498193 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120955 () Bool)

(declare-fun res!748856 () Bool)

(assert (=> b!1120955 (=> (not res!748856) (not e!638271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120955 (= res!748856 (validKeyInArray!0 k0!934))))

(declare-datatypes ((tuple2!17714 0))(
  ( (tuple2!17715 (_1!8868 (_ BitVec 64)) (_2!8868 V!42619)) )
))
(declare-datatypes ((List!24498 0))(
  ( (Nil!24495) (Cons!24494 (h!25703 tuple2!17714) (t!35079 List!24498)) )
))
(declare-datatypes ((ListLongMap!15683 0))(
  ( (ListLongMap!15684 (toList!7857 List!24498)) )
))
(declare-fun call!47049 () ListLongMap!15683)

(declare-fun b!1120956 () Bool)

(declare-fun call!47050 () ListLongMap!15683)

(declare-fun -!1069 (ListLongMap!15683 (_ BitVec 64)) ListLongMap!15683)

(assert (=> b!1120956 (= e!638273 (= call!47050 (-!1069 call!47049 k0!934)))))

(declare-fun b!1120957 () Bool)

(assert (=> b!1120957 (= e!638269 e!638272)))

(declare-fun res!748866 () Bool)

(assert (=> b!1120957 (=> res!748866 e!638272)))

(assert (=> b!1120957 (= res!748866 (not (= from!1455 i!673)))))

(declare-fun lt!498192 () array!73121)

(declare-fun lt!498194 () ListLongMap!15683)

(declare-fun lt!498195 () array!73119)

(declare-fun getCurrentListMapNoExtraKeys!4347 (array!73119 array!73121 (_ BitVec 32) (_ BitVec 32) V!42619 V!42619 (_ BitVec 32) Int) ListLongMap!15683)

(assert (=> b!1120957 (= lt!498194 (getCurrentListMapNoExtraKeys!4347 lt!498195 lt!498192 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2449 (Int (_ BitVec 64)) V!42619)

(assert (=> b!1120957 (= lt!498192 (array!73122 (store (arr!35213 _values!996) i!673 (ValueCellFull!13350 (dynLambda!2449 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35749 _values!996)))))

(declare-fun lt!498197 () ListLongMap!15683)

(assert (=> b!1120957 (= lt!498197 (getCurrentListMapNoExtraKeys!4347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!43996 () Bool)

(declare-fun mapRes!43996 () Bool)

(assert (=> mapIsEmpty!43996 mapRes!43996))

(declare-fun b!1120958 () Bool)

(assert (=> b!1120958 (= e!638273 (= call!47050 call!47049))))

(declare-fun res!748860 () Bool)

(assert (=> start!97888 (=> (not res!748860) (not e!638271))))

(assert (=> start!97888 (= res!748860 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35748 _keys!1208))))))

(assert (=> start!97888 e!638271))

(declare-fun tp_is_empty!28119 () Bool)

(assert (=> start!97888 tp_is_empty!28119))

(declare-fun array_inv!27044 (array!73119) Bool)

(assert (=> start!97888 (array_inv!27044 _keys!1208)))

(assert (=> start!97888 true))

(assert (=> start!97888 tp!83471))

(declare-fun e!638268 () Bool)

(declare-fun array_inv!27045 (array!73121) Bool)

(assert (=> start!97888 (and (array_inv!27045 _values!996) e!638268)))

(declare-fun b!1120959 () Bool)

(declare-fun res!748863 () Bool)

(assert (=> b!1120959 (=> (not res!748863) (not e!638271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73119 (_ BitVec 32)) Bool)

(assert (=> b!1120959 (= res!748863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120960 () Bool)

(declare-fun e!638274 () Bool)

(assert (=> b!1120960 (= e!638274 tp_is_empty!28119)))

(declare-fun b!1120961 () Bool)

(assert (=> b!1120961 (= e!638271 e!638270)))

(declare-fun res!748859 () Bool)

(assert (=> b!1120961 (=> (not res!748859) (not e!638270))))

(assert (=> b!1120961 (= res!748859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498195 mask!1564))))

(assert (=> b!1120961 (= lt!498195 (array!73120 (store (arr!35212 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35748 _keys!1208)))))

(declare-fun mapNonEmpty!43996 () Bool)

(declare-fun tp!83470 () Bool)

(declare-fun e!638266 () Bool)

(assert (=> mapNonEmpty!43996 (= mapRes!43996 (and tp!83470 e!638266))))

(declare-fun mapKey!43996 () (_ BitVec 32))

(declare-fun mapRest!43996 () (Array (_ BitVec 32) ValueCell!13350))

(declare-fun mapValue!43996 () ValueCell!13350)

(assert (=> mapNonEmpty!43996 (= (arr!35213 _values!996) (store mapRest!43996 mapKey!43996 mapValue!43996))))

(declare-fun b!1120962 () Bool)

(declare-fun res!748864 () Bool)

(assert (=> b!1120962 (=> (not res!748864) (not e!638271))))

(declare-datatypes ((List!24499 0))(
  ( (Nil!24496) (Cons!24495 (h!25704 (_ BitVec 64)) (t!35080 List!24499)) )
))
(declare-fun arrayNoDuplicates!0 (array!73119 (_ BitVec 32) List!24499) Bool)

(assert (=> b!1120962 (= res!748864 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24496))))

(declare-fun b!1120963 () Bool)

(assert (=> b!1120963 (= e!638266 tp_is_empty!28119)))

(declare-fun b!1120964 () Bool)

(declare-fun res!748857 () Bool)

(assert (=> b!1120964 (=> (not res!748857) (not e!638270))))

(assert (=> b!1120964 (= res!748857 (arrayNoDuplicates!0 lt!498195 #b00000000000000000000000000000000 Nil!24496))))

(declare-fun bm!47046 () Bool)

(assert (=> bm!47046 (= call!47049 (getCurrentListMapNoExtraKeys!4347 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120965 () Bool)

(assert (=> b!1120965 (= e!638268 (and e!638274 mapRes!43996))))

(declare-fun condMapEmpty!43996 () Bool)

(declare-fun mapDefault!43996 () ValueCell!13350)

(assert (=> b!1120965 (= condMapEmpty!43996 (= (arr!35213 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13350)) mapDefault!43996)))))

(declare-fun b!1120966 () Bool)

(declare-fun res!748861 () Bool)

(assert (=> b!1120966 (=> (not res!748861) (not e!638271))))

(assert (=> b!1120966 (= res!748861 (= (select (arr!35212 _keys!1208) i!673) k0!934))))

(declare-fun bm!47047 () Bool)

(assert (=> bm!47047 (= call!47050 (getCurrentListMapNoExtraKeys!4347 lt!498195 lt!498192 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120967 () Bool)

(declare-fun res!748862 () Bool)

(assert (=> b!1120967 (=> (not res!748862) (not e!638271))))

(assert (=> b!1120967 (= res!748862 (and (= (size!35749 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35748 _keys!1208) (size!35749 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97888 res!748860) b!1120953))

(assert (= (and b!1120953 res!748865) b!1120967))

(assert (= (and b!1120967 res!748862) b!1120959))

(assert (= (and b!1120959 res!748863) b!1120962))

(assert (= (and b!1120962 res!748864) b!1120951))

(assert (= (and b!1120951 res!748858) b!1120955))

(assert (= (and b!1120955 res!748856) b!1120966))

(assert (= (and b!1120966 res!748861) b!1120961))

(assert (= (and b!1120961 res!748859) b!1120964))

(assert (= (and b!1120964 res!748857) b!1120952))

(assert (= (and b!1120952 (not res!748867)) b!1120957))

(assert (= (and b!1120957 (not res!748866)) b!1120954))

(assert (= (and b!1120954 c!109374) b!1120956))

(assert (= (and b!1120954 (not c!109374)) b!1120958))

(assert (= (or b!1120956 b!1120958) bm!47047))

(assert (= (or b!1120956 b!1120958) bm!47046))

(assert (= (and b!1120965 condMapEmpty!43996) mapIsEmpty!43996))

(assert (= (and b!1120965 (not condMapEmpty!43996)) mapNonEmpty!43996))

(get-info :version)

(assert (= (and mapNonEmpty!43996 ((_ is ValueCellFull!13350) mapValue!43996)) b!1120963))

(assert (= (and b!1120965 ((_ is ValueCellFull!13350) mapDefault!43996)) b!1120960))

(assert (= start!97888 b!1120965))

(declare-fun b_lambda!18559 () Bool)

(assert (=> (not b_lambda!18559) (not b!1120957)))

(declare-fun t!35078 () Bool)

(declare-fun tb!8401 () Bool)

(assert (=> (and start!97888 (= defaultEntry!1004 defaultEntry!1004) t!35078) tb!8401))

(declare-fun result!17363 () Bool)

(assert (=> tb!8401 (= result!17363 tp_is_empty!28119)))

(assert (=> b!1120957 t!35078))

(declare-fun b_and!37963 () Bool)

(assert (= b_and!37961 (and (=> t!35078 result!17363) b_and!37963)))

(declare-fun m!1035893 () Bool)

(assert (=> b!1120956 m!1035893))

(declare-fun m!1035895 () Bool)

(assert (=> b!1120961 m!1035895))

(declare-fun m!1035897 () Bool)

(assert (=> b!1120961 m!1035897))

(declare-fun m!1035899 () Bool)

(assert (=> mapNonEmpty!43996 m!1035899))

(declare-fun m!1035901 () Bool)

(assert (=> bm!47047 m!1035901))

(declare-fun m!1035903 () Bool)

(assert (=> b!1120966 m!1035903))

(declare-fun m!1035905 () Bool)

(assert (=> b!1120959 m!1035905))

(declare-fun m!1035907 () Bool)

(assert (=> start!97888 m!1035907))

(declare-fun m!1035909 () Bool)

(assert (=> start!97888 m!1035909))

(declare-fun m!1035911 () Bool)

(assert (=> b!1120964 m!1035911))

(declare-fun m!1035913 () Bool)

(assert (=> b!1120953 m!1035913))

(declare-fun m!1035915 () Bool)

(assert (=> b!1120954 m!1035915))

(declare-fun m!1035917 () Bool)

(assert (=> b!1120962 m!1035917))

(declare-fun m!1035919 () Bool)

(assert (=> bm!47046 m!1035919))

(declare-fun m!1035921 () Bool)

(assert (=> b!1120952 m!1035921))

(declare-fun m!1035923 () Bool)

(assert (=> b!1120952 m!1035923))

(declare-fun m!1035925 () Bool)

(assert (=> b!1120955 m!1035925))

(declare-fun m!1035927 () Bool)

(assert (=> b!1120957 m!1035927))

(declare-fun m!1035929 () Bool)

(assert (=> b!1120957 m!1035929))

(declare-fun m!1035931 () Bool)

(assert (=> b!1120957 m!1035931))

(declare-fun m!1035933 () Bool)

(assert (=> b!1120957 m!1035933))

(check-sat (not mapNonEmpty!43996) (not bm!47047) (not b!1120962) (not b!1120964) (not b!1120954) (not b!1120956) (not start!97888) (not b_lambda!18559) (not b!1120957) (not b!1120953) (not b!1120955) (not b!1120959) tp_is_empty!28119 (not b!1120952) b_and!37963 (not b!1120961) (not bm!47046) (not b_next!23589))
(check-sat b_and!37963 (not b_next!23589))
