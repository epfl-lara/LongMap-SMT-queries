; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97910 () Bool)

(assert start!97910)

(declare-fun b_free!23617 () Bool)

(declare-fun b_next!23617 () Bool)

(assert (=> start!97910 (= b_free!23617 (not b_next!23617))))

(declare-fun tp!83555 () Bool)

(declare-fun b_and!37995 () Bool)

(assert (=> start!97910 (= tp!83555 b_and!37995)))

(declare-fun b!1121564 () Bool)

(declare-fun e!638564 () Bool)

(declare-datatypes ((V!42657 0))(
  ( (V!42658 (val!14130 Int)) )
))
(declare-datatypes ((tuple2!17802 0))(
  ( (tuple2!17803 (_1!8912 (_ BitVec 64)) (_2!8912 V!42657)) )
))
(declare-datatypes ((List!24574 0))(
  ( (Nil!24571) (Cons!24570 (h!25779 tuple2!17802) (t!35174 List!24574)) )
))
(declare-datatypes ((ListLongMap!15771 0))(
  ( (ListLongMap!15772 (toList!7901 List!24574)) )
))
(declare-fun call!47110 () ListLongMap!15771)

(declare-fun call!47111 () ListLongMap!15771)

(assert (=> b!1121564 (= e!638564 (= call!47110 call!47111))))

(declare-fun b!1121565 () Bool)

(declare-fun e!638563 () Bool)

(declare-fun tp_is_empty!28147 () Bool)

(assert (=> b!1121565 (= e!638563 tp_is_empty!28147)))

(declare-fun b!1121566 () Bool)

(declare-fun res!749292 () Bool)

(declare-fun e!638570 () Bool)

(assert (=> b!1121566 (=> (not res!749292) (not e!638570))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73088 0))(
  ( (array!73089 (arr!35197 (Array (_ BitVec 32) (_ BitVec 64))) (size!35735 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73088)

(assert (=> b!1121566 (= res!749292 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35735 _keys!1208))))))

(declare-fun b!1121567 () Bool)

(declare-fun res!749300 () Bool)

(declare-fun e!638566 () Bool)

(assert (=> b!1121567 (=> (not res!749300) (not e!638566))))

(declare-fun lt!498246 () array!73088)

(declare-datatypes ((List!24575 0))(
  ( (Nil!24572) (Cons!24571 (h!25780 (_ BitVec 64)) (t!35175 List!24575)) )
))
(declare-fun arrayNoDuplicates!0 (array!73088 (_ BitVec 32) List!24575) Bool)

(assert (=> b!1121567 (= res!749300 (arrayNoDuplicates!0 lt!498246 #b00000000000000000000000000000000 Nil!24572))))

(declare-fun mapIsEmpty!44038 () Bool)

(declare-fun mapRes!44038 () Bool)

(assert (=> mapIsEmpty!44038 mapRes!44038))

(declare-fun b!1121569 () Bool)

(assert (=> b!1121569 (= e!638570 e!638566)))

(declare-fun res!749295 () Bool)

(assert (=> b!1121569 (=> (not res!749295) (not e!638566))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73088 (_ BitVec 32)) Bool)

(assert (=> b!1121569 (= res!749295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498246 mask!1564))))

(assert (=> b!1121569 (= lt!498246 (array!73089 (store (arr!35197 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35735 _keys!1208)))))

(declare-fun zeroValue!944 () V!42657)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47107 () Bool)

(declare-datatypes ((ValueCell!13364 0))(
  ( (ValueCellFull!13364 (v!16762 V!42657)) (EmptyCell!13364) )
))
(declare-datatypes ((array!73090 0))(
  ( (array!73091 (arr!35198 (Array (_ BitVec 32) ValueCell!13364)) (size!35736 (_ BitVec 32))) )
))
(declare-fun lt!498244 () array!73090)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42657)

(declare-fun getCurrentListMapNoExtraKeys!4409 (array!73088 array!73090 (_ BitVec 32) (_ BitVec 32) V!42657 V!42657 (_ BitVec 32) Int) ListLongMap!15771)

(assert (=> bm!47107 (= call!47110 (getCurrentListMapNoExtraKeys!4409 lt!498246 lt!498244 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121570 () Bool)

(declare-fun e!638565 () Bool)

(assert (=> b!1121570 (= e!638565 (and e!638563 mapRes!44038))))

(declare-fun condMapEmpty!44038 () Bool)

(declare-fun _values!996 () array!73090)

(declare-fun mapDefault!44038 () ValueCell!13364)

(assert (=> b!1121570 (= condMapEmpty!44038 (= (arr!35198 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13364)) mapDefault!44038)))))

(declare-fun b!1121571 () Bool)

(declare-fun e!638568 () Bool)

(assert (=> b!1121571 (= e!638568 tp_is_empty!28147)))

(declare-fun b!1121572 () Bool)

(declare-fun res!749293 () Bool)

(assert (=> b!1121572 (=> (not res!749293) (not e!638570))))

(assert (=> b!1121572 (= res!749293 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24572))))

(declare-fun b!1121573 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1054 (ListLongMap!15771 (_ BitVec 64)) ListLongMap!15771)

(assert (=> b!1121573 (= e!638564 (= call!47110 (-!1054 call!47111 k0!934)))))

(declare-fun b!1121574 () Bool)

(declare-fun res!749296 () Bool)

(assert (=> b!1121574 (=> (not res!749296) (not e!638570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121574 (= res!749296 (validKeyInArray!0 k0!934))))

(declare-fun b!1121575 () Bool)

(declare-fun res!749294 () Bool)

(assert (=> b!1121575 (=> (not res!749294) (not e!638570))))

(assert (=> b!1121575 (= res!749294 (= (select (arr!35197 _keys!1208) i!673) k0!934))))

(declare-fun bm!47108 () Bool)

(assert (=> bm!47108 (= call!47111 (getCurrentListMapNoExtraKeys!4409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121576 () Bool)

(declare-fun res!749297 () Bool)

(assert (=> b!1121576 (=> (not res!749297) (not e!638570))))

(assert (=> b!1121576 (= res!749297 (and (= (size!35736 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35735 _keys!1208) (size!35736 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121577 () Bool)

(declare-fun e!638567 () Bool)

(declare-fun e!638571 () Bool)

(assert (=> b!1121577 (= e!638567 e!638571)))

(declare-fun res!749298 () Bool)

(assert (=> b!1121577 (=> res!749298 e!638571)))

(assert (=> b!1121577 (= res!749298 (not (= from!1455 i!673)))))

(declare-fun lt!498248 () ListLongMap!15771)

(assert (=> b!1121577 (= lt!498248 (getCurrentListMapNoExtraKeys!4409 lt!498246 lt!498244 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2449 (Int (_ BitVec 64)) V!42657)

(assert (=> b!1121577 (= lt!498244 (array!73091 (store (arr!35198 _values!996) i!673 (ValueCellFull!13364 (dynLambda!2449 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35736 _values!996)))))

(declare-fun lt!498249 () ListLongMap!15771)

(assert (=> b!1121577 (= lt!498249 (getCurrentListMapNoExtraKeys!4409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121568 () Bool)

(declare-fun res!749291 () Bool)

(assert (=> b!1121568 (=> (not res!749291) (not e!638570))))

(assert (=> b!1121568 (= res!749291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!749302 () Bool)

(assert (=> start!97910 (=> (not res!749302) (not e!638570))))

(assert (=> start!97910 (= res!749302 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35735 _keys!1208))))))

(assert (=> start!97910 e!638570))

(assert (=> start!97910 tp_is_empty!28147))

(declare-fun array_inv!27104 (array!73088) Bool)

(assert (=> start!97910 (array_inv!27104 _keys!1208)))

(assert (=> start!97910 true))

(assert (=> start!97910 tp!83555))

(declare-fun array_inv!27105 (array!73090) Bool)

(assert (=> start!97910 (and (array_inv!27105 _values!996) e!638565)))

(declare-fun mapNonEmpty!44038 () Bool)

(declare-fun tp!83554 () Bool)

(assert (=> mapNonEmpty!44038 (= mapRes!44038 (and tp!83554 e!638568))))

(declare-fun mapValue!44038 () ValueCell!13364)

(declare-fun mapKey!44038 () (_ BitVec 32))

(declare-fun mapRest!44038 () (Array (_ BitVec 32) ValueCell!13364))

(assert (=> mapNonEmpty!44038 (= (arr!35198 _values!996) (store mapRest!44038 mapKey!44038 mapValue!44038))))

(declare-fun b!1121578 () Bool)

(assert (=> b!1121578 (= e!638566 (not e!638567))))

(declare-fun res!749299 () Bool)

(assert (=> b!1121578 (=> res!749299 e!638567)))

(assert (=> b!1121578 (= res!749299 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121578 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36629 0))(
  ( (Unit!36630) )
))
(declare-fun lt!498247 () Unit!36629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73088 (_ BitVec 64) (_ BitVec 32)) Unit!36629)

(assert (=> b!1121578 (= lt!498247 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121579 () Bool)

(assert (=> b!1121579 (= e!638571 true)))

(assert (=> b!1121579 e!638564))

(declare-fun c!109389 () Bool)

(assert (=> b!1121579 (= c!109389 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498245 () Unit!36629)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!331 (array!73088 array!73090 (_ BitVec 32) (_ BitVec 32) V!42657 V!42657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36629)

(assert (=> b!1121579 (= lt!498245 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!331 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121580 () Bool)

(declare-fun res!749301 () Bool)

(assert (=> b!1121580 (=> (not res!749301) (not e!638570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121580 (= res!749301 (validMask!0 mask!1564))))

(assert (= (and start!97910 res!749302) b!1121580))

(assert (= (and b!1121580 res!749301) b!1121576))

(assert (= (and b!1121576 res!749297) b!1121568))

(assert (= (and b!1121568 res!749291) b!1121572))

(assert (= (and b!1121572 res!749293) b!1121566))

(assert (= (and b!1121566 res!749292) b!1121574))

(assert (= (and b!1121574 res!749296) b!1121575))

(assert (= (and b!1121575 res!749294) b!1121569))

(assert (= (and b!1121569 res!749295) b!1121567))

(assert (= (and b!1121567 res!749300) b!1121578))

(assert (= (and b!1121578 (not res!749299)) b!1121577))

(assert (= (and b!1121577 (not res!749298)) b!1121579))

(assert (= (and b!1121579 c!109389) b!1121573))

(assert (= (and b!1121579 (not c!109389)) b!1121564))

(assert (= (or b!1121573 b!1121564) bm!47108))

(assert (= (or b!1121573 b!1121564) bm!47107))

(assert (= (and b!1121570 condMapEmpty!44038) mapIsEmpty!44038))

(assert (= (and b!1121570 (not condMapEmpty!44038)) mapNonEmpty!44038))

(get-info :version)

(assert (= (and mapNonEmpty!44038 ((_ is ValueCellFull!13364) mapValue!44038)) b!1121571))

(assert (= (and b!1121570 ((_ is ValueCellFull!13364) mapDefault!44038)) b!1121565))

(assert (= start!97910 b!1121570))

(declare-fun b_lambda!18569 () Bool)

(assert (=> (not b_lambda!18569) (not b!1121577)))

(declare-fun t!35173 () Bool)

(declare-fun tb!8421 () Bool)

(assert (=> (and start!97910 (= defaultEntry!1004 defaultEntry!1004) t!35173) tb!8421))

(declare-fun result!17411 () Bool)

(assert (=> tb!8421 (= result!17411 tp_is_empty!28147)))

(assert (=> b!1121577 t!35173))

(declare-fun b_and!37997 () Bool)

(assert (= b_and!37995 (and (=> t!35173 result!17411) b_and!37997)))

(declare-fun m!1035855 () Bool)

(assert (=> b!1121573 m!1035855))

(declare-fun m!1035857 () Bool)

(assert (=> b!1121567 m!1035857))

(declare-fun m!1035859 () Bool)

(assert (=> b!1121572 m!1035859))

(declare-fun m!1035861 () Bool)

(assert (=> b!1121574 m!1035861))

(declare-fun m!1035863 () Bool)

(assert (=> b!1121575 m!1035863))

(declare-fun m!1035865 () Bool)

(assert (=> bm!47108 m!1035865))

(declare-fun m!1035867 () Bool)

(assert (=> b!1121577 m!1035867))

(declare-fun m!1035869 () Bool)

(assert (=> b!1121577 m!1035869))

(declare-fun m!1035871 () Bool)

(assert (=> b!1121577 m!1035871))

(declare-fun m!1035873 () Bool)

(assert (=> b!1121577 m!1035873))

(declare-fun m!1035875 () Bool)

(assert (=> mapNonEmpty!44038 m!1035875))

(declare-fun m!1035877 () Bool)

(assert (=> b!1121578 m!1035877))

(declare-fun m!1035879 () Bool)

(assert (=> b!1121578 m!1035879))

(declare-fun m!1035881 () Bool)

(assert (=> bm!47107 m!1035881))

(declare-fun m!1035883 () Bool)

(assert (=> start!97910 m!1035883))

(declare-fun m!1035885 () Bool)

(assert (=> start!97910 m!1035885))

(declare-fun m!1035887 () Bool)

(assert (=> b!1121569 m!1035887))

(declare-fun m!1035889 () Bool)

(assert (=> b!1121569 m!1035889))

(declare-fun m!1035891 () Bool)

(assert (=> b!1121568 m!1035891))

(declare-fun m!1035893 () Bool)

(assert (=> b!1121580 m!1035893))

(declare-fun m!1035895 () Bool)

(assert (=> b!1121579 m!1035895))

(check-sat (not b_next!23617) (not start!97910) (not b!1121578) (not b!1121574) (not b!1121567) (not b!1121579) tp_is_empty!28147 b_and!37997 (not b!1121577) (not mapNonEmpty!44038) (not bm!47108) (not b!1121568) (not b!1121569) (not bm!47107) (not b!1121580) (not b_lambda!18569) (not b!1121573) (not b!1121572))
(check-sat b_and!37997 (not b_next!23617))
