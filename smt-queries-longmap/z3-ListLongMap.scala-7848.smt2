; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98068 () Bool)

(assert start!98068)

(declare-fun b_free!23533 () Bool)

(declare-fun b_next!23533 () Bool)

(assert (=> start!98068 (= b_free!23533 (not b_next!23533))))

(declare-fun tp!83302 () Bool)

(declare-fun b_and!37859 () Bool)

(assert (=> start!98068 (= tp!83302 b_and!37859)))

(declare-fun b!1120977 () Bool)

(declare-fun res!748438 () Bool)

(declare-fun e!638489 () Bool)

(assert (=> b!1120977 (=> (not res!748438) (not e!638489))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120977 (= res!748438 (validKeyInArray!0 k0!934))))

(declare-fun b!1120978 () Bool)

(declare-fun e!638491 () Bool)

(declare-fun tp_is_empty!28063 () Bool)

(assert (=> b!1120978 (= e!638491 tp_is_empty!28063)))

(declare-fun b!1120979 () Bool)

(declare-fun res!748431 () Bool)

(assert (=> b!1120979 (=> (not res!748431) (not e!638489))))

(declare-datatypes ((array!73057 0))(
  ( (array!73058 (arr!35175 (Array (_ BitVec 32) (_ BitVec 64))) (size!35712 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73057)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120979 (= res!748431 (= (select (arr!35175 _keys!1208) i!673) k0!934))))

(declare-fun b!1120980 () Bool)

(declare-fun e!638490 () Bool)

(assert (=> b!1120980 (= e!638490 tp_is_empty!28063)))

(declare-fun b!1120981 () Bool)

(declare-fun res!748441 () Bool)

(assert (=> b!1120981 (=> (not res!748441) (not e!638489))))

(declare-datatypes ((List!24482 0))(
  ( (Nil!24479) (Cons!24478 (h!25696 (_ BitVec 64)) (t!34999 List!24482)) )
))
(declare-fun arrayNoDuplicates!0 (array!73057 (_ BitVec 32) List!24482) Bool)

(assert (=> b!1120981 (= res!748441 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24479))))

(declare-fun b!1120982 () Bool)

(declare-fun e!638493 () Bool)

(assert (=> b!1120982 (= e!638493 true)))

(declare-datatypes ((V!42545 0))(
  ( (V!42546 (val!14088 Int)) )
))
(declare-fun zeroValue!944 () V!42545)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17690 0))(
  ( (tuple2!17691 (_1!8856 (_ BitVec 64)) (_2!8856 V!42545)) )
))
(declare-datatypes ((List!24483 0))(
  ( (Nil!24480) (Cons!24479 (h!25697 tuple2!17690) (t!35000 List!24483)) )
))
(declare-datatypes ((ListLongMap!15667 0))(
  ( (ListLongMap!15668 (toList!7849 List!24483)) )
))
(declare-fun lt!498327 () ListLongMap!15667)

(declare-fun lt!498328 () array!73057)

(declare-datatypes ((ValueCell!13322 0))(
  ( (ValueCellFull!13322 (v!16717 V!42545)) (EmptyCell!13322) )
))
(declare-datatypes ((array!73059 0))(
  ( (array!73060 (arr!35176 (Array (_ BitVec 32) ValueCell!13322)) (size!35713 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73059)

(declare-fun minValue!944 () V!42545)

(declare-fun getCurrentListMapNoExtraKeys!4379 (array!73057 array!73059 (_ BitVec 32) (_ BitVec 32) V!42545 V!42545 (_ BitVec 32) Int) ListLongMap!15667)

(declare-fun dynLambda!2468 (Int (_ BitVec 64)) V!42545)

(assert (=> b!1120982 (= lt!498327 (getCurrentListMapNoExtraKeys!4379 lt!498328 (array!73060 (store (arr!35176 _values!996) i!673 (ValueCellFull!13322 (dynLambda!2468 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35713 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!498326 () ListLongMap!15667)

(assert (=> b!1120982 (= lt!498326 (getCurrentListMapNoExtraKeys!4379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120983 () Bool)

(declare-fun res!748433 () Bool)

(assert (=> b!1120983 (=> (not res!748433) (not e!638489))))

(assert (=> b!1120983 (= res!748433 (and (= (size!35713 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35712 _keys!1208) (size!35713 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120984 () Bool)

(declare-fun e!638488 () Bool)

(assert (=> b!1120984 (= e!638489 e!638488)))

(declare-fun res!748440 () Bool)

(assert (=> b!1120984 (=> (not res!748440) (not e!638488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73057 (_ BitVec 32)) Bool)

(assert (=> b!1120984 (= res!748440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498328 mask!1564))))

(assert (=> b!1120984 (= lt!498328 (array!73058 (store (arr!35175 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35712 _keys!1208)))))

(declare-fun mapNonEmpty!43912 () Bool)

(declare-fun mapRes!43912 () Bool)

(declare-fun tp!83303 () Bool)

(assert (=> mapNonEmpty!43912 (= mapRes!43912 (and tp!83303 e!638491))))

(declare-fun mapValue!43912 () ValueCell!13322)

(declare-fun mapRest!43912 () (Array (_ BitVec 32) ValueCell!13322))

(declare-fun mapKey!43912 () (_ BitVec 32))

(assert (=> mapNonEmpty!43912 (= (arr!35176 _values!996) (store mapRest!43912 mapKey!43912 mapValue!43912))))

(declare-fun b!1120986 () Bool)

(declare-fun res!748432 () Bool)

(assert (=> b!1120986 (=> (not res!748432) (not e!638488))))

(assert (=> b!1120986 (= res!748432 (arrayNoDuplicates!0 lt!498328 #b00000000000000000000000000000000 Nil!24479))))

(declare-fun b!1120987 () Bool)

(declare-fun res!748435 () Bool)

(assert (=> b!1120987 (=> (not res!748435) (not e!638489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120987 (= res!748435 (validMask!0 mask!1564))))

(declare-fun b!1120988 () Bool)

(assert (=> b!1120988 (= e!638488 (not e!638493))))

(declare-fun res!748436 () Bool)

(assert (=> b!1120988 (=> res!748436 e!638493)))

(assert (=> b!1120988 (= res!748436 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73057 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120988 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36725 0))(
  ( (Unit!36726) )
))
(declare-fun lt!498325 () Unit!36725)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73057 (_ BitVec 64) (_ BitVec 32)) Unit!36725)

(assert (=> b!1120988 (= lt!498325 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120989 () Bool)

(declare-fun res!748434 () Bool)

(assert (=> b!1120989 (=> (not res!748434) (not e!638489))))

(assert (=> b!1120989 (= res!748434 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35712 _keys!1208))))))

(declare-fun b!1120990 () Bool)

(declare-fun e!638492 () Bool)

(assert (=> b!1120990 (= e!638492 (and e!638490 mapRes!43912))))

(declare-fun condMapEmpty!43912 () Bool)

(declare-fun mapDefault!43912 () ValueCell!13322)

(assert (=> b!1120990 (= condMapEmpty!43912 (= (arr!35176 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13322)) mapDefault!43912)))))

(declare-fun mapIsEmpty!43912 () Bool)

(assert (=> mapIsEmpty!43912 mapRes!43912))

(declare-fun res!748439 () Bool)

(assert (=> start!98068 (=> (not res!748439) (not e!638489))))

(assert (=> start!98068 (= res!748439 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35712 _keys!1208))))))

(assert (=> start!98068 e!638489))

(assert (=> start!98068 tp_is_empty!28063))

(declare-fun array_inv!27080 (array!73057) Bool)

(assert (=> start!98068 (array_inv!27080 _keys!1208)))

(assert (=> start!98068 true))

(assert (=> start!98068 tp!83302))

(declare-fun array_inv!27081 (array!73059) Bool)

(assert (=> start!98068 (and (array_inv!27081 _values!996) e!638492)))

(declare-fun b!1120985 () Bool)

(declare-fun res!748437 () Bool)

(assert (=> b!1120985 (=> (not res!748437) (not e!638489))))

(assert (=> b!1120985 (= res!748437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98068 res!748439) b!1120987))

(assert (= (and b!1120987 res!748435) b!1120983))

(assert (= (and b!1120983 res!748433) b!1120985))

(assert (= (and b!1120985 res!748437) b!1120981))

(assert (= (and b!1120981 res!748441) b!1120989))

(assert (= (and b!1120989 res!748434) b!1120977))

(assert (= (and b!1120977 res!748438) b!1120979))

(assert (= (and b!1120979 res!748431) b!1120984))

(assert (= (and b!1120984 res!748440) b!1120986))

(assert (= (and b!1120986 res!748432) b!1120988))

(assert (= (and b!1120988 (not res!748436)) b!1120982))

(assert (= (and b!1120990 condMapEmpty!43912) mapIsEmpty!43912))

(assert (= (and b!1120990 (not condMapEmpty!43912)) mapNonEmpty!43912))

(get-info :version)

(assert (= (and mapNonEmpty!43912 ((_ is ValueCellFull!13322) mapValue!43912)) b!1120978))

(assert (= (and b!1120990 ((_ is ValueCellFull!13322) mapDefault!43912)) b!1120980))

(assert (= start!98068 b!1120990))

(declare-fun b_lambda!18513 () Bool)

(assert (=> (not b_lambda!18513) (not b!1120982)))

(declare-fun t!34998 () Bool)

(declare-fun tb!8337 () Bool)

(assert (=> (and start!98068 (= defaultEntry!1004 defaultEntry!1004) t!34998) tb!8337))

(declare-fun result!17243 () Bool)

(assert (=> tb!8337 (= result!17243 tp_is_empty!28063)))

(assert (=> b!1120982 t!34998))

(declare-fun b_and!37861 () Bool)

(assert (= b_and!37859 (and (=> t!34998 result!17243) b_and!37861)))

(declare-fun m!1036557 () Bool)

(assert (=> b!1120985 m!1036557))

(declare-fun m!1036559 () Bool)

(assert (=> b!1120979 m!1036559))

(declare-fun m!1036561 () Bool)

(assert (=> b!1120986 m!1036561))

(declare-fun m!1036563 () Bool)

(assert (=> mapNonEmpty!43912 m!1036563))

(declare-fun m!1036565 () Bool)

(assert (=> start!98068 m!1036565))

(declare-fun m!1036567 () Bool)

(assert (=> start!98068 m!1036567))

(declare-fun m!1036569 () Bool)

(assert (=> b!1120982 m!1036569))

(declare-fun m!1036571 () Bool)

(assert (=> b!1120982 m!1036571))

(declare-fun m!1036573 () Bool)

(assert (=> b!1120982 m!1036573))

(declare-fun m!1036575 () Bool)

(assert (=> b!1120982 m!1036575))

(declare-fun m!1036577 () Bool)

(assert (=> b!1120977 m!1036577))

(declare-fun m!1036579 () Bool)

(assert (=> b!1120981 m!1036579))

(declare-fun m!1036581 () Bool)

(assert (=> b!1120984 m!1036581))

(declare-fun m!1036583 () Bool)

(assert (=> b!1120984 m!1036583))

(declare-fun m!1036585 () Bool)

(assert (=> b!1120987 m!1036585))

(declare-fun m!1036587 () Bool)

(assert (=> b!1120988 m!1036587))

(declare-fun m!1036589 () Bool)

(assert (=> b!1120988 m!1036589))

(check-sat b_and!37861 (not b!1120985) (not b!1120982) (not b!1120986) (not b!1120981) tp_is_empty!28063 (not b!1120988) (not b!1120977) (not start!98068) (not mapNonEmpty!43912) (not b_next!23533) (not b_lambda!18513) (not b!1120987) (not b!1120984))
(check-sat b_and!37861 (not b_next!23533))
