; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99322 () Bool)

(assert start!99322)

(declare-fun b_free!24691 () Bool)

(declare-fun b_next!24691 () Bool)

(assert (=> start!99322 (= b_free!24691 (not b_next!24691))))

(declare-fun tp!86784 () Bool)

(declare-fun b_and!40233 () Bool)

(assert (=> start!99322 (= tp!86784 b_and!40233)))

(declare-fun b!1166615 () Bool)

(declare-fun res!773360 () Bool)

(declare-fun e!663318 () Bool)

(assert (=> b!1166615 (=> (not res!773360) (not e!663318))))

(declare-datatypes ((array!75325 0))(
  ( (array!75326 (arr!36307 (Array (_ BitVec 32) (_ BitVec 64))) (size!36844 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75325)

(declare-datatypes ((List!25475 0))(
  ( (Nil!25472) (Cons!25471 (h!26689 (_ BitVec 64)) (t!37150 List!25475)) )
))
(declare-fun arrayNoDuplicates!0 (array!75325 (_ BitVec 32) List!25475) Bool)

(assert (=> b!1166615 (= res!773360 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25472))))

(declare-fun b!1166616 () Bool)

(declare-fun res!773359 () Bool)

(assert (=> b!1166616 (=> (not res!773359) (not e!663318))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75325 (_ BitVec 32)) Bool)

(assert (=> b!1166616 (= res!773359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1166617 () Bool)

(declare-fun e!663317 () Bool)

(declare-fun e!663320 () Bool)

(declare-fun mapRes!45656 () Bool)

(assert (=> b!1166617 (= e!663317 (and e!663320 mapRes!45656))))

(declare-fun condMapEmpty!45656 () Bool)

(declare-datatypes ((V!44089 0))(
  ( (V!44090 (val!14667 Int)) )
))
(declare-datatypes ((ValueCell!13901 0))(
  ( (ValueCellFull!13901 (v!17300 V!44089)) (EmptyCell!13901) )
))
(declare-datatypes ((array!75327 0))(
  ( (array!75328 (arr!36308 (Array (_ BitVec 32) ValueCell!13901)) (size!36845 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75327)

(declare-fun mapDefault!45656 () ValueCell!13901)

(assert (=> b!1166617 (= condMapEmpty!45656 (= (arr!36308 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13901)) mapDefault!45656)))))

(declare-fun mapIsEmpty!45656 () Bool)

(assert (=> mapIsEmpty!45656 mapRes!45656))

(declare-fun b!1166618 () Bool)

(declare-fun res!773354 () Bool)

(assert (=> b!1166618 (=> (not res!773354) (not e!663318))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1166618 (= res!773354 (= (select (arr!36307 _keys!1208) i!673) k0!934))))

(declare-fun b!1166619 () Bool)

(declare-fun res!773363 () Bool)

(assert (=> b!1166619 (=> (not res!773363) (not e!663318))))

(assert (=> b!1166619 (= res!773363 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36844 _keys!1208))))))

(declare-fun b!1166620 () Bool)

(declare-fun e!663322 () Bool)

(declare-fun tp_is_empty!29221 () Bool)

(assert (=> b!1166620 (= e!663322 tp_is_empty!29221)))

(declare-fun b!1166621 () Bool)

(declare-fun e!663316 () Bool)

(assert (=> b!1166621 (= e!663318 e!663316)))

(declare-fun res!773364 () Bool)

(assert (=> b!1166621 (=> (not res!773364) (not e!663316))))

(declare-fun lt!525366 () array!75325)

(assert (=> b!1166621 (= res!773364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525366 mask!1564))))

(assert (=> b!1166621 (= lt!525366 (array!75326 (store (arr!36307 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36844 _keys!1208)))))

(declare-fun b!1166623 () Bool)

(assert (=> b!1166623 (= e!663320 tp_is_empty!29221)))

(declare-fun b!1166624 () Bool)

(declare-fun e!663319 () Bool)

(assert (=> b!1166624 (= e!663316 (not e!663319))))

(declare-fun res!773361 () Bool)

(assert (=> b!1166624 (=> res!773361 e!663319)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1166624 (= res!773361 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1166624 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38447 0))(
  ( (Unit!38448) )
))
(declare-fun lt!525364 () Unit!38447)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75325 (_ BitVec 64) (_ BitVec 32)) Unit!38447)

(assert (=> b!1166624 (= lt!525364 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1166625 () Bool)

(declare-fun res!773358 () Bool)

(assert (=> b!1166625 (=> (not res!773358) (not e!663318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1166625 (= res!773358 (validKeyInArray!0 k0!934))))

(declare-fun b!1166626 () Bool)

(assert (=> b!1166626 (= e!663319 true)))

(declare-fun zeroValue!944 () V!44089)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18736 0))(
  ( (tuple2!18737 (_1!9379 (_ BitVec 64)) (_2!9379 V!44089)) )
))
(declare-datatypes ((List!25476 0))(
  ( (Nil!25473) (Cons!25472 (h!26690 tuple2!18736) (t!37151 List!25476)) )
))
(declare-datatypes ((ListLongMap!16713 0))(
  ( (ListLongMap!16714 (toList!8372 List!25476)) )
))
(declare-fun lt!525367 () ListLongMap!16713)

(declare-fun minValue!944 () V!44089)

(declare-fun getCurrentListMapNoExtraKeys!4863 (array!75325 array!75327 (_ BitVec 32) (_ BitVec 32) V!44089 V!44089 (_ BitVec 32) Int) ListLongMap!16713)

(declare-fun dynLambda!2852 (Int (_ BitVec 64)) V!44089)

(assert (=> b!1166626 (= lt!525367 (getCurrentListMapNoExtraKeys!4863 lt!525366 (array!75328 (store (arr!36308 _values!996) i!673 (ValueCellFull!13901 (dynLambda!2852 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36845 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525365 () ListLongMap!16713)

(assert (=> b!1166626 (= lt!525365 (getCurrentListMapNoExtraKeys!4863 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1166627 () Bool)

(declare-fun res!773357 () Bool)

(assert (=> b!1166627 (=> (not res!773357) (not e!663316))))

(assert (=> b!1166627 (= res!773357 (arrayNoDuplicates!0 lt!525366 #b00000000000000000000000000000000 Nil!25472))))

(declare-fun b!1166628 () Bool)

(declare-fun res!773362 () Bool)

(assert (=> b!1166628 (=> (not res!773362) (not e!663318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1166628 (= res!773362 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45656 () Bool)

(declare-fun tp!86783 () Bool)

(assert (=> mapNonEmpty!45656 (= mapRes!45656 (and tp!86783 e!663322))))

(declare-fun mapValue!45656 () ValueCell!13901)

(declare-fun mapRest!45656 () (Array (_ BitVec 32) ValueCell!13901))

(declare-fun mapKey!45656 () (_ BitVec 32))

(assert (=> mapNonEmpty!45656 (= (arr!36308 _values!996) (store mapRest!45656 mapKey!45656 mapValue!45656))))

(declare-fun b!1166622 () Bool)

(declare-fun res!773356 () Bool)

(assert (=> b!1166622 (=> (not res!773356) (not e!663318))))

(assert (=> b!1166622 (= res!773356 (and (= (size!36845 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36844 _keys!1208) (size!36845 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!773355 () Bool)

(assert (=> start!99322 (=> (not res!773355) (not e!663318))))

(assert (=> start!99322 (= res!773355 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36844 _keys!1208))))))

(assert (=> start!99322 e!663318))

(assert (=> start!99322 tp_is_empty!29221))

(declare-fun array_inv!27840 (array!75325) Bool)

(assert (=> start!99322 (array_inv!27840 _keys!1208)))

(assert (=> start!99322 true))

(assert (=> start!99322 tp!86784))

(declare-fun array_inv!27841 (array!75327) Bool)

(assert (=> start!99322 (and (array_inv!27841 _values!996) e!663317)))

(assert (= (and start!99322 res!773355) b!1166628))

(assert (= (and b!1166628 res!773362) b!1166622))

(assert (= (and b!1166622 res!773356) b!1166616))

(assert (= (and b!1166616 res!773359) b!1166615))

(assert (= (and b!1166615 res!773360) b!1166619))

(assert (= (and b!1166619 res!773363) b!1166625))

(assert (= (and b!1166625 res!773358) b!1166618))

(assert (= (and b!1166618 res!773354) b!1166621))

(assert (= (and b!1166621 res!773364) b!1166627))

(assert (= (and b!1166627 res!773357) b!1166624))

(assert (= (and b!1166624 (not res!773361)) b!1166626))

(assert (= (and b!1166617 condMapEmpty!45656) mapIsEmpty!45656))

(assert (= (and b!1166617 (not condMapEmpty!45656)) mapNonEmpty!45656))

(get-info :version)

(assert (= (and mapNonEmpty!45656 ((_ is ValueCellFull!13901) mapValue!45656)) b!1166620))

(assert (= (and b!1166617 ((_ is ValueCellFull!13901) mapDefault!45656)) b!1166623))

(assert (= start!99322 b!1166617))

(declare-fun b_lambda!19791 () Bool)

(assert (=> (not b_lambda!19791) (not b!1166626)))

(declare-fun t!37149 () Bool)

(declare-fun tb!9495 () Bool)

(assert (=> (and start!99322 (= defaultEntry!1004 defaultEntry!1004) t!37149) tb!9495))

(declare-fun result!19563 () Bool)

(assert (=> tb!9495 (= result!19563 tp_is_empty!29221)))

(assert (=> b!1166626 t!37149))

(declare-fun b_and!40235 () Bool)

(assert (= b_and!40233 (and (=> t!37149 result!19563) b_and!40235)))

(declare-fun m!1075121 () Bool)

(assert (=> b!1166615 m!1075121))

(declare-fun m!1075123 () Bool)

(assert (=> start!99322 m!1075123))

(declare-fun m!1075125 () Bool)

(assert (=> start!99322 m!1075125))

(declare-fun m!1075127 () Bool)

(assert (=> b!1166627 m!1075127))

(declare-fun m!1075129 () Bool)

(assert (=> b!1166624 m!1075129))

(declare-fun m!1075131 () Bool)

(assert (=> b!1166624 m!1075131))

(declare-fun m!1075133 () Bool)

(assert (=> b!1166626 m!1075133))

(declare-fun m!1075135 () Bool)

(assert (=> b!1166626 m!1075135))

(declare-fun m!1075137 () Bool)

(assert (=> b!1166626 m!1075137))

(declare-fun m!1075139 () Bool)

(assert (=> b!1166626 m!1075139))

(declare-fun m!1075141 () Bool)

(assert (=> b!1166625 m!1075141))

(declare-fun m!1075143 () Bool)

(assert (=> mapNonEmpty!45656 m!1075143))

(declare-fun m!1075145 () Bool)

(assert (=> b!1166628 m!1075145))

(declare-fun m!1075147 () Bool)

(assert (=> b!1166618 m!1075147))

(declare-fun m!1075149 () Bool)

(assert (=> b!1166621 m!1075149))

(declare-fun m!1075151 () Bool)

(assert (=> b!1166621 m!1075151))

(declare-fun m!1075153 () Bool)

(assert (=> b!1166616 m!1075153))

(check-sat (not b!1166616) (not b!1166626) (not b!1166625) (not start!99322) b_and!40235 (not mapNonEmpty!45656) (not b!1166621) (not b!1166624) tp_is_empty!29221 (not b_next!24691) (not b!1166627) (not b!1166615) (not b!1166628) (not b_lambda!19791))
(check-sat b_and!40235 (not b_next!24691))
