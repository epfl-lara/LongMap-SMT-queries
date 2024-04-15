; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101184 () Bool)

(assert start!101184)

(declare-fun b_free!26113 () Bool)

(declare-fun b_next!26113 () Bool)

(assert (=> start!101184 (= b_free!26113 (not b_next!26113))))

(declare-fun tp!91361 () Bool)

(declare-fun b_and!43325 () Bool)

(assert (=> start!101184 (= tp!91361 b_and!43325)))

(declare-fun mapIsEmpty!48100 () Bool)

(declare-fun mapRes!48100 () Bool)

(assert (=> mapIsEmpty!48100 mapRes!48100))

(declare-fun res!806440 () Bool)

(declare-fun e!689750 () Bool)

(assert (=> start!101184 (=> (not res!806440) (not e!689750))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78332 0))(
  ( (array!78333 (arr!37801 (Array (_ BitVec 32) (_ BitVec 64))) (size!38339 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78332)

(assert (=> start!101184 (= res!806440 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38339 _keys!1208))))))

(assert (=> start!101184 e!689750))

(declare-fun tp_is_empty!30817 () Bool)

(assert (=> start!101184 tp_is_empty!30817))

(declare-fun array_inv!28896 (array!78332) Bool)

(assert (=> start!101184 (array_inv!28896 _keys!1208)))

(assert (=> start!101184 true))

(assert (=> start!101184 tp!91361))

(declare-datatypes ((V!46217 0))(
  ( (V!46218 (val!15465 Int)) )
))
(declare-datatypes ((ValueCell!14699 0))(
  ( (ValueCellFull!14699 (v!18117 V!46217)) (EmptyCell!14699) )
))
(declare-datatypes ((array!78334 0))(
  ( (array!78335 (arr!37802 (Array (_ BitVec 32) ValueCell!14699)) (size!38340 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78334)

(declare-fun e!689749 () Bool)

(declare-fun array_inv!28897 (array!78334) Bool)

(assert (=> start!101184 (and (array_inv!28897 _values!996) e!689749)))

(declare-fun b!1214651 () Bool)

(declare-fun res!806442 () Bool)

(assert (=> b!1214651 (=> (not res!806442) (not e!689750))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1214651 (= res!806442 (= (select (arr!37801 _keys!1208) i!673) k0!934))))

(declare-fun b!1214652 () Bool)

(declare-fun res!806434 () Bool)

(declare-fun e!689753 () Bool)

(assert (=> b!1214652 (=> (not res!806434) (not e!689753))))

(declare-fun lt!552250 () array!78332)

(declare-datatypes ((List!26736 0))(
  ( (Nil!26733) (Cons!26732 (h!27941 (_ BitVec 64)) (t!39820 List!26736)) )
))
(declare-fun arrayNoDuplicates!0 (array!78332 (_ BitVec 32) List!26736) Bool)

(assert (=> b!1214652 (= res!806434 (arrayNoDuplicates!0 lt!552250 #b00000000000000000000000000000000 Nil!26733))))

(declare-fun mapNonEmpty!48100 () Bool)

(declare-fun tp!91360 () Bool)

(declare-fun e!689752 () Bool)

(assert (=> mapNonEmpty!48100 (= mapRes!48100 (and tp!91360 e!689752))))

(declare-fun mapRest!48100 () (Array (_ BitVec 32) ValueCell!14699))

(declare-fun mapValue!48100 () ValueCell!14699)

(declare-fun mapKey!48100 () (_ BitVec 32))

(assert (=> mapNonEmpty!48100 (= (arr!37802 _values!996) (store mapRest!48100 mapKey!48100 mapValue!48100))))

(declare-fun b!1214653 () Bool)

(assert (=> b!1214653 (= e!689752 tp_is_empty!30817)))

(declare-fun b!1214654 () Bool)

(declare-fun res!806439 () Bool)

(assert (=> b!1214654 (=> (not res!806439) (not e!689750))))

(assert (=> b!1214654 (= res!806439 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26733))))

(declare-fun b!1214655 () Bool)

(declare-fun e!689751 () Bool)

(assert (=> b!1214655 (= e!689753 (not e!689751))))

(declare-fun res!806433 () Bool)

(assert (=> b!1214655 (=> res!806433 e!689751)))

(assert (=> b!1214655 (= res!806433 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1214655 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40135 0))(
  ( (Unit!40136) )
))
(declare-fun lt!552251 () Unit!40135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78332 (_ BitVec 64) (_ BitVec 32)) Unit!40135)

(assert (=> b!1214655 (= lt!552251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1214656 () Bool)

(declare-fun e!689754 () Bool)

(assert (=> b!1214656 (= e!689754 tp_is_empty!30817)))

(declare-fun b!1214657 () Bool)

(declare-fun res!806443 () Bool)

(assert (=> b!1214657 (=> (not res!806443) (not e!689750))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78332 (_ BitVec 32)) Bool)

(assert (=> b!1214657 (= res!806443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1214658 () Bool)

(assert (=> b!1214658 (= e!689751 true)))

(declare-fun zeroValue!944 () V!46217)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46217)

(declare-datatypes ((tuple2!19958 0))(
  ( (tuple2!19959 (_1!9990 (_ BitVec 64)) (_2!9990 V!46217)) )
))
(declare-datatypes ((List!26737 0))(
  ( (Nil!26734) (Cons!26733 (h!27942 tuple2!19958) (t!39821 List!26737)) )
))
(declare-datatypes ((ListLongMap!17927 0))(
  ( (ListLongMap!17928 (toList!8979 List!26737)) )
))
(declare-fun lt!552248 () ListLongMap!17927)

(declare-fun getCurrentListMapNoExtraKeys!5418 (array!78332 array!78334 (_ BitVec 32) (_ BitVec 32) V!46217 V!46217 (_ BitVec 32) Int) ListLongMap!17927)

(declare-fun dynLambda!3270 (Int (_ BitVec 64)) V!46217)

(assert (=> b!1214658 (= lt!552248 (getCurrentListMapNoExtraKeys!5418 lt!552250 (array!78335 (store (arr!37802 _values!996) i!673 (ValueCellFull!14699 (dynLambda!3270 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38340 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!552249 () ListLongMap!17927)

(assert (=> b!1214658 (= lt!552249 (getCurrentListMapNoExtraKeys!5418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1214659 () Bool)

(declare-fun res!806441 () Bool)

(assert (=> b!1214659 (=> (not res!806441) (not e!689750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214659 (= res!806441 (validMask!0 mask!1564))))

(declare-fun b!1214660 () Bool)

(assert (=> b!1214660 (= e!689750 e!689753)))

(declare-fun res!806437 () Bool)

(assert (=> b!1214660 (=> (not res!806437) (not e!689753))))

(assert (=> b!1214660 (= res!806437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!552250 mask!1564))))

(assert (=> b!1214660 (= lt!552250 (array!78333 (store (arr!37801 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38339 _keys!1208)))))

(declare-fun b!1214661 () Bool)

(declare-fun res!806436 () Bool)

(assert (=> b!1214661 (=> (not res!806436) (not e!689750))))

(assert (=> b!1214661 (= res!806436 (and (= (size!38340 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38339 _keys!1208) (size!38340 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1214662 () Bool)

(declare-fun res!806438 () Bool)

(assert (=> b!1214662 (=> (not res!806438) (not e!689750))))

(assert (=> b!1214662 (= res!806438 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38339 _keys!1208))))))

(declare-fun b!1214663 () Bool)

(assert (=> b!1214663 (= e!689749 (and e!689754 mapRes!48100))))

(declare-fun condMapEmpty!48100 () Bool)

(declare-fun mapDefault!48100 () ValueCell!14699)

(assert (=> b!1214663 (= condMapEmpty!48100 (= (arr!37802 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14699)) mapDefault!48100)))))

(declare-fun b!1214664 () Bool)

(declare-fun res!806435 () Bool)

(assert (=> b!1214664 (=> (not res!806435) (not e!689750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1214664 (= res!806435 (validKeyInArray!0 k0!934))))

(assert (= (and start!101184 res!806440) b!1214659))

(assert (= (and b!1214659 res!806441) b!1214661))

(assert (= (and b!1214661 res!806436) b!1214657))

(assert (= (and b!1214657 res!806443) b!1214654))

(assert (= (and b!1214654 res!806439) b!1214662))

(assert (= (and b!1214662 res!806438) b!1214664))

(assert (= (and b!1214664 res!806435) b!1214651))

(assert (= (and b!1214651 res!806442) b!1214660))

(assert (= (and b!1214660 res!806437) b!1214652))

(assert (= (and b!1214652 res!806434) b!1214655))

(assert (= (and b!1214655 (not res!806433)) b!1214658))

(assert (= (and b!1214663 condMapEmpty!48100) mapIsEmpty!48100))

(assert (= (and b!1214663 (not condMapEmpty!48100)) mapNonEmpty!48100))

(get-info :version)

(assert (= (and mapNonEmpty!48100 ((_ is ValueCellFull!14699) mapValue!48100)) b!1214653))

(assert (= (and b!1214663 ((_ is ValueCellFull!14699) mapDefault!48100)) b!1214656))

(assert (= start!101184 b!1214663))

(declare-fun b_lambda!21779 () Bool)

(assert (=> (not b_lambda!21779) (not b!1214658)))

(declare-fun t!39819 () Bool)

(declare-fun tb!10905 () Bool)

(assert (=> (and start!101184 (= defaultEntry!1004 defaultEntry!1004) t!39819) tb!10905))

(declare-fun result!22415 () Bool)

(assert (=> tb!10905 (= result!22415 tp_is_empty!30817)))

(assert (=> b!1214658 t!39819))

(declare-fun b_and!43327 () Bool)

(assert (= b_and!43325 (and (=> t!39819 result!22415) b_and!43327)))

(declare-fun m!1119321 () Bool)

(assert (=> b!1214659 m!1119321))

(declare-fun m!1119323 () Bool)

(assert (=> b!1214654 m!1119323))

(declare-fun m!1119325 () Bool)

(assert (=> b!1214652 m!1119325))

(declare-fun m!1119327 () Bool)

(assert (=> b!1214660 m!1119327))

(declare-fun m!1119329 () Bool)

(assert (=> b!1214660 m!1119329))

(declare-fun m!1119331 () Bool)

(assert (=> b!1214651 m!1119331))

(declare-fun m!1119333 () Bool)

(assert (=> b!1214655 m!1119333))

(declare-fun m!1119335 () Bool)

(assert (=> b!1214655 m!1119335))

(declare-fun m!1119337 () Bool)

(assert (=> start!101184 m!1119337))

(declare-fun m!1119339 () Bool)

(assert (=> start!101184 m!1119339))

(declare-fun m!1119341 () Bool)

(assert (=> b!1214664 m!1119341))

(declare-fun m!1119343 () Bool)

(assert (=> b!1214657 m!1119343))

(declare-fun m!1119345 () Bool)

(assert (=> mapNonEmpty!48100 m!1119345))

(declare-fun m!1119347 () Bool)

(assert (=> b!1214658 m!1119347))

(declare-fun m!1119349 () Bool)

(assert (=> b!1214658 m!1119349))

(declare-fun m!1119351 () Bool)

(assert (=> b!1214658 m!1119351))

(declare-fun m!1119353 () Bool)

(assert (=> b!1214658 m!1119353))

(check-sat (not b_lambda!21779) tp_is_empty!30817 (not b!1214659) b_and!43327 (not b!1214652) (not b!1214655) (not b!1214658) (not b!1214660) (not b!1214657) (not start!101184) (not mapNonEmpty!48100) (not b!1214664) (not b_next!26113) (not b!1214654))
(check-sat b_and!43327 (not b_next!26113))
