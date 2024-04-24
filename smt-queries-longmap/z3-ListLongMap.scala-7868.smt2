; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98188 () Bool)

(assert start!98188)

(declare-fun b_free!23653 () Bool)

(declare-fun b_next!23653 () Bool)

(assert (=> start!98188 (= b_free!23653 (not b_next!23653))))

(declare-fun tp!83663 () Bool)

(declare-fun b_and!38099 () Bool)

(assert (=> start!98188 (= tp!83663 b_and!38099)))

(declare-fun b!1124012 () Bool)

(declare-fun res!750580 () Bool)

(declare-fun e!640028 () Bool)

(assert (=> b!1124012 (=> (not res!750580) (not e!640028))))

(declare-datatypes ((array!73283 0))(
  ( (array!73284 (arr!35288 (Array (_ BitVec 32) (_ BitVec 64))) (size!35825 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73283)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1124012 (= res!750580 (= (select (arr!35288 _keys!1208) i!673) k0!934))))

(declare-fun b!1124013 () Bool)

(declare-fun res!750579 () Bool)

(declare-fun e!640032 () Bool)

(assert (=> b!1124013 (=> (not res!750579) (not e!640032))))

(declare-fun lt!499321 () array!73283)

(declare-datatypes ((List!24566 0))(
  ( (Nil!24563) (Cons!24562 (h!25780 (_ BitVec 64)) (t!35203 List!24566)) )
))
(declare-fun arrayNoDuplicates!0 (array!73283 (_ BitVec 32) List!24566) Bool)

(assert (=> b!1124013 (= res!750579 (arrayNoDuplicates!0 lt!499321 #b00000000000000000000000000000000 Nil!24563))))

(declare-fun b!1124014 () Bool)

(declare-fun e!640024 () Bool)

(assert (=> b!1124014 (= e!640024 true)))

(declare-datatypes ((V!42705 0))(
  ( (V!42706 (val!14148 Int)) )
))
(declare-fun zeroValue!944 () V!42705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499323 () Bool)

(declare-datatypes ((ValueCell!13382 0))(
  ( (ValueCellFull!13382 (v!16777 V!42705)) (EmptyCell!13382) )
))
(declare-datatypes ((array!73285 0))(
  ( (array!73286 (arr!35289 (Array (_ BitVec 32) ValueCell!13382)) (size!35826 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73285)

(declare-fun minValue!944 () V!42705)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17772 0))(
  ( (tuple2!17773 (_1!8897 (_ BitVec 64)) (_2!8897 V!42705)) )
))
(declare-datatypes ((List!24567 0))(
  ( (Nil!24564) (Cons!24563 (h!25781 tuple2!17772) (t!35204 List!24567)) )
))
(declare-datatypes ((ListLongMap!15749 0))(
  ( (ListLongMap!15750 (toList!7890 List!24567)) )
))
(declare-fun contains!6451 (ListLongMap!15749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4418 (array!73283 array!73285 (_ BitVec 32) (_ BitVec 32) V!42705 V!42705 (_ BitVec 32) Int) ListLongMap!15749)

(assert (=> b!1124014 (= lt!499323 (contains!6451 (getCurrentListMapNoExtraKeys!4418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1124016 () Bool)

(declare-fun e!640029 () Bool)

(declare-fun tp_is_empty!28183 () Bool)

(assert (=> b!1124016 (= e!640029 tp_is_empty!28183)))

(declare-fun b!1124017 () Bool)

(declare-fun e!640025 () Bool)

(assert (=> b!1124017 (= e!640032 (not e!640025))))

(declare-fun res!750568 () Bool)

(assert (=> b!1124017 (=> res!750568 e!640025)))

(assert (=> b!1124017 (= res!750568 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124017 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36813 0))(
  ( (Unit!36814) )
))
(declare-fun lt!499322 () Unit!36813)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73283 (_ BitVec 64) (_ BitVec 32)) Unit!36813)

(assert (=> b!1124017 (= lt!499322 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun call!47308 () ListLongMap!15749)

(declare-fun bm!47305 () Bool)

(assert (=> bm!47305 (= call!47308 (getCurrentListMapNoExtraKeys!4418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124018 () Bool)

(declare-fun e!640031 () Bool)

(assert (=> b!1124018 (= e!640031 tp_is_empty!28183)))

(declare-fun b!1124019 () Bool)

(declare-fun e!640023 () Bool)

(declare-fun mapRes!44092 () Bool)

(assert (=> b!1124019 (= e!640023 (and e!640031 mapRes!44092))))

(declare-fun condMapEmpty!44092 () Bool)

(declare-fun mapDefault!44092 () ValueCell!13382)

(assert (=> b!1124019 (= condMapEmpty!44092 (= (arr!35289 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13382)) mapDefault!44092)))))

(declare-fun e!640027 () Bool)

(declare-fun call!47309 () ListLongMap!15749)

(declare-fun b!1124020 () Bool)

(declare-fun -!1085 (ListLongMap!15749 (_ BitVec 64)) ListLongMap!15749)

(assert (=> b!1124020 (= e!640027 (= call!47309 (-!1085 call!47308 k0!934)))))

(declare-fun b!1124021 () Bool)

(declare-fun res!750570 () Bool)

(assert (=> b!1124021 (=> (not res!750570) (not e!640028))))

(assert (=> b!1124021 (= res!750570 (and (= (size!35826 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35825 _keys!1208) (size!35826 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124022 () Bool)

(declare-fun e!640026 () Bool)

(assert (=> b!1124022 (= e!640025 e!640026)))

(declare-fun res!750576 () Bool)

(assert (=> b!1124022 (=> res!750576 e!640026)))

(assert (=> b!1124022 (= res!750576 (not (= from!1455 i!673)))))

(declare-fun lt!499326 () array!73285)

(declare-fun lt!499325 () ListLongMap!15749)

(assert (=> b!1124022 (= lt!499325 (getCurrentListMapNoExtraKeys!4418 lt!499321 lt!499326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2502 (Int (_ BitVec 64)) V!42705)

(assert (=> b!1124022 (= lt!499326 (array!73286 (store (arr!35289 _values!996) i!673 (ValueCellFull!13382 (dynLambda!2502 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35826 _values!996)))))

(declare-fun lt!499327 () ListLongMap!15749)

(assert (=> b!1124022 (= lt!499327 (getCurrentListMapNoExtraKeys!4418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124023 () Bool)

(declare-fun res!750574 () Bool)

(assert (=> b!1124023 (=> (not res!750574) (not e!640028))))

(assert (=> b!1124023 (= res!750574 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24563))))

(declare-fun b!1124024 () Bool)

(assert (=> b!1124024 (= e!640027 (= call!47309 call!47308))))

(declare-fun b!1124025 () Bool)

(declare-fun res!750575 () Bool)

(assert (=> b!1124025 (=> (not res!750575) (not e!640028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124025 (= res!750575 (validKeyInArray!0 k0!934))))

(declare-fun res!750573 () Bool)

(assert (=> start!98188 (=> (not res!750573) (not e!640028))))

(assert (=> start!98188 (= res!750573 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35825 _keys!1208))))))

(assert (=> start!98188 e!640028))

(assert (=> start!98188 tp_is_empty!28183))

(declare-fun array_inv!27162 (array!73283) Bool)

(assert (=> start!98188 (array_inv!27162 _keys!1208)))

(assert (=> start!98188 true))

(assert (=> start!98188 tp!83663))

(declare-fun array_inv!27163 (array!73285) Bool)

(assert (=> start!98188 (and (array_inv!27163 _values!996) e!640023)))

(declare-fun b!1124015 () Bool)

(declare-fun res!750571 () Bool)

(assert (=> b!1124015 (=> (not res!750571) (not e!640028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73283 (_ BitVec 32)) Bool)

(assert (=> b!1124015 (= res!750571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1124026 () Bool)

(declare-fun res!750572 () Bool)

(assert (=> b!1124026 (=> (not res!750572) (not e!640028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124026 (= res!750572 (validMask!0 mask!1564))))

(declare-fun b!1124027 () Bool)

(assert (=> b!1124027 (= e!640026 e!640024)))

(declare-fun res!750577 () Bool)

(assert (=> b!1124027 (=> res!750577 e!640024)))

(assert (=> b!1124027 (= res!750577 (not (= (select (arr!35288 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124027 e!640027))

(declare-fun c!109880 () Bool)

(assert (=> b!1124027 (= c!109880 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499324 () Unit!36813)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!348 (array!73283 array!73285 (_ BitVec 32) (_ BitVec 32) V!42705 V!42705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36813)

(assert (=> b!1124027 (= lt!499324 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!348 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124028 () Bool)

(assert (=> b!1124028 (= e!640028 e!640032)))

(declare-fun res!750569 () Bool)

(assert (=> b!1124028 (=> (not res!750569) (not e!640032))))

(assert (=> b!1124028 (= res!750569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499321 mask!1564))))

(assert (=> b!1124028 (= lt!499321 (array!73284 (store (arr!35288 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35825 _keys!1208)))))

(declare-fun b!1124029 () Bool)

(declare-fun res!750578 () Bool)

(assert (=> b!1124029 (=> (not res!750578) (not e!640028))))

(assert (=> b!1124029 (= res!750578 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35825 _keys!1208))))))

(declare-fun bm!47306 () Bool)

(assert (=> bm!47306 (= call!47309 (getCurrentListMapNoExtraKeys!4418 lt!499321 lt!499326 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44092 () Bool)

(assert (=> mapIsEmpty!44092 mapRes!44092))

(declare-fun mapNonEmpty!44092 () Bool)

(declare-fun tp!83662 () Bool)

(assert (=> mapNonEmpty!44092 (= mapRes!44092 (and tp!83662 e!640029))))

(declare-fun mapValue!44092 () ValueCell!13382)

(declare-fun mapRest!44092 () (Array (_ BitVec 32) ValueCell!13382))

(declare-fun mapKey!44092 () (_ BitVec 32))

(assert (=> mapNonEmpty!44092 (= (arr!35289 _values!996) (store mapRest!44092 mapKey!44092 mapValue!44092))))

(assert (= (and start!98188 res!750573) b!1124026))

(assert (= (and b!1124026 res!750572) b!1124021))

(assert (= (and b!1124021 res!750570) b!1124015))

(assert (= (and b!1124015 res!750571) b!1124023))

(assert (= (and b!1124023 res!750574) b!1124029))

(assert (= (and b!1124029 res!750578) b!1124025))

(assert (= (and b!1124025 res!750575) b!1124012))

(assert (= (and b!1124012 res!750580) b!1124028))

(assert (= (and b!1124028 res!750569) b!1124013))

(assert (= (and b!1124013 res!750579) b!1124017))

(assert (= (and b!1124017 (not res!750568)) b!1124022))

(assert (= (and b!1124022 (not res!750576)) b!1124027))

(assert (= (and b!1124027 c!109880) b!1124020))

(assert (= (and b!1124027 (not c!109880)) b!1124024))

(assert (= (or b!1124020 b!1124024) bm!47306))

(assert (= (or b!1124020 b!1124024) bm!47305))

(assert (= (and b!1124027 (not res!750577)) b!1124014))

(assert (= (and b!1124019 condMapEmpty!44092) mapIsEmpty!44092))

(assert (= (and b!1124019 (not condMapEmpty!44092)) mapNonEmpty!44092))

(get-info :version)

(assert (= (and mapNonEmpty!44092 ((_ is ValueCellFull!13382) mapValue!44092)) b!1124016))

(assert (= (and b!1124019 ((_ is ValueCellFull!13382) mapDefault!44092)) b!1124018))

(assert (= start!98188 b!1124019))

(declare-fun b_lambda!18633 () Bool)

(assert (=> (not b_lambda!18633) (not b!1124022)))

(declare-fun t!35202 () Bool)

(declare-fun tb!8457 () Bool)

(assert (=> (and start!98188 (= defaultEntry!1004 defaultEntry!1004) t!35202) tb!8457))

(declare-fun result!17483 () Bool)

(assert (=> tb!8457 (= result!17483 tp_is_empty!28183)))

(assert (=> b!1124022 t!35202))

(declare-fun b_and!38101 () Bool)

(assert (= b_and!38099 (and (=> t!35202 result!17483) b_and!38101)))

(declare-fun m!1038965 () Bool)

(assert (=> b!1124023 m!1038965))

(declare-fun m!1038967 () Bool)

(assert (=> b!1124026 m!1038967))

(declare-fun m!1038969 () Bool)

(assert (=> b!1124012 m!1038969))

(declare-fun m!1038971 () Bool)

(assert (=> bm!47305 m!1038971))

(declare-fun m!1038973 () Bool)

(assert (=> b!1124015 m!1038973))

(declare-fun m!1038975 () Bool)

(assert (=> bm!47306 m!1038975))

(assert (=> b!1124014 m!1038971))

(assert (=> b!1124014 m!1038971))

(declare-fun m!1038977 () Bool)

(assert (=> b!1124014 m!1038977))

(declare-fun m!1038979 () Bool)

(assert (=> b!1124022 m!1038979))

(declare-fun m!1038981 () Bool)

(assert (=> b!1124022 m!1038981))

(declare-fun m!1038983 () Bool)

(assert (=> b!1124022 m!1038983))

(declare-fun m!1038985 () Bool)

(assert (=> b!1124022 m!1038985))

(declare-fun m!1038987 () Bool)

(assert (=> mapNonEmpty!44092 m!1038987))

(declare-fun m!1038989 () Bool)

(assert (=> b!1124028 m!1038989))

(declare-fun m!1038991 () Bool)

(assert (=> b!1124028 m!1038991))

(declare-fun m!1038993 () Bool)

(assert (=> b!1124013 m!1038993))

(declare-fun m!1038995 () Bool)

(assert (=> b!1124025 m!1038995))

(declare-fun m!1038997 () Bool)

(assert (=> b!1124017 m!1038997))

(declare-fun m!1038999 () Bool)

(assert (=> b!1124017 m!1038999))

(declare-fun m!1039001 () Bool)

(assert (=> start!98188 m!1039001))

(declare-fun m!1039003 () Bool)

(assert (=> start!98188 m!1039003))

(declare-fun m!1039005 () Bool)

(assert (=> b!1124027 m!1039005))

(declare-fun m!1039007 () Bool)

(assert (=> b!1124027 m!1039007))

(declare-fun m!1039009 () Bool)

(assert (=> b!1124020 m!1039009))

(check-sat (not b!1124015) (not b!1124028) (not b!1124026) (not b!1124027) (not start!98188) (not bm!47306) b_and!38101 (not mapNonEmpty!44092) tp_is_empty!28183 (not b!1124025) (not b_lambda!18633) (not b!1124014) (not b!1124020) (not b!1124013) (not b!1124023) (not b_next!23653) (not b!1124022) (not bm!47305) (not b!1124017))
(check-sat b_and!38101 (not b_next!23653))
