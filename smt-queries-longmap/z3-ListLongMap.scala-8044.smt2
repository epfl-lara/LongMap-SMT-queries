; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99098 () Bool)

(assert start!99098)

(declare-fun b_free!24709 () Bool)

(declare-fun b_next!24709 () Bool)

(assert (=> start!99098 (= b_free!24709 (not b_next!24709))))

(declare-fun tp!86838 () Bool)

(declare-fun b_and!40245 () Bool)

(assert (=> start!99098 (= tp!86838 b_and!40245)))

(declare-fun b!1165598 () Bool)

(declare-fun res!773077 () Bool)

(declare-fun e!662601 () Bool)

(assert (=> b!1165598 (=> (not res!773077) (not e!662601))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165598 (= res!773077 (validMask!0 mask!1564))))

(declare-fun b!1165599 () Bool)

(declare-fun e!662598 () Bool)

(declare-fun e!662600 () Bool)

(assert (=> b!1165599 (= e!662598 (not e!662600))))

(declare-fun res!773078 () Bool)

(assert (=> b!1165599 (=> res!773078 e!662600)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165599 (= res!773078 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75232 0))(
  ( (array!75233 (arr!36267 (Array (_ BitVec 32) (_ BitVec 64))) (size!36805 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75232)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165599 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38293 0))(
  ( (Unit!38294) )
))
(declare-fun lt!524797 () Unit!38293)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75232 (_ BitVec 64) (_ BitVec 32)) Unit!38293)

(assert (=> b!1165599 (= lt!524797 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!773081 () Bool)

(assert (=> start!99098 (=> (not res!773081) (not e!662601))))

(assert (=> start!99098 (= res!773081 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36805 _keys!1208))))))

(assert (=> start!99098 e!662601))

(declare-fun tp_is_empty!29239 () Bool)

(assert (=> start!99098 tp_is_empty!29239))

(declare-fun array_inv!27838 (array!75232) Bool)

(assert (=> start!99098 (array_inv!27838 _keys!1208)))

(assert (=> start!99098 true))

(assert (=> start!99098 tp!86838))

(declare-datatypes ((V!44113 0))(
  ( (V!44114 (val!14676 Int)) )
))
(declare-datatypes ((ValueCell!13910 0))(
  ( (ValueCellFull!13910 (v!17312 V!44113)) (EmptyCell!13910) )
))
(declare-datatypes ((array!75234 0))(
  ( (array!75235 (arr!36268 (Array (_ BitVec 32) ValueCell!13910)) (size!36806 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75234)

(declare-fun e!662595 () Bool)

(declare-fun array_inv!27839 (array!75234) Bool)

(assert (=> start!99098 (and (array_inv!27839 _values!996) e!662595)))

(declare-fun b!1165600 () Bool)

(declare-fun e!662599 () Bool)

(assert (=> b!1165600 (= e!662599 tp_is_empty!29239)))

(declare-fun b!1165601 () Bool)

(declare-fun res!773084 () Bool)

(assert (=> b!1165601 (=> (not res!773084) (not e!662601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165601 (= res!773084 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45683 () Bool)

(declare-fun mapRes!45683 () Bool)

(declare-fun tp!86837 () Bool)

(declare-fun e!662597 () Bool)

(assert (=> mapNonEmpty!45683 (= mapRes!45683 (and tp!86837 e!662597))))

(declare-fun mapKey!45683 () (_ BitVec 32))

(declare-fun mapValue!45683 () ValueCell!13910)

(declare-fun mapRest!45683 () (Array (_ BitVec 32) ValueCell!13910))

(assert (=> mapNonEmpty!45683 (= (arr!36268 _values!996) (store mapRest!45683 mapKey!45683 mapValue!45683))))

(declare-fun b!1165602 () Bool)

(declare-fun res!773085 () Bool)

(assert (=> b!1165602 (=> (not res!773085) (not e!662601))))

(assert (=> b!1165602 (= res!773085 (= (select (arr!36267 _keys!1208) i!673) k0!934))))

(declare-fun b!1165603 () Bool)

(declare-fun res!773080 () Bool)

(assert (=> b!1165603 (=> (not res!773080) (not e!662601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75232 (_ BitVec 32)) Bool)

(assert (=> b!1165603 (= res!773080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165604 () Bool)

(assert (=> b!1165604 (= e!662595 (and e!662599 mapRes!45683))))

(declare-fun condMapEmpty!45683 () Bool)

(declare-fun mapDefault!45683 () ValueCell!13910)

(assert (=> b!1165604 (= condMapEmpty!45683 (= (arr!36268 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13910)) mapDefault!45683)))))

(declare-fun b!1165605 () Bool)

(declare-fun res!773086 () Bool)

(assert (=> b!1165605 (=> (not res!773086) (not e!662601))))

(assert (=> b!1165605 (= res!773086 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36805 _keys!1208))))))

(declare-fun b!1165606 () Bool)

(assert (=> b!1165606 (= e!662601 e!662598)))

(declare-fun res!773082 () Bool)

(assert (=> b!1165606 (=> (not res!773082) (not e!662598))))

(declare-fun lt!524798 () array!75232)

(assert (=> b!1165606 (= res!773082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524798 mask!1564))))

(assert (=> b!1165606 (= lt!524798 (array!75233 (store (arr!36267 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36805 _keys!1208)))))

(declare-fun b!1165607 () Bool)

(assert (=> b!1165607 (= e!662600 true)))

(declare-fun zeroValue!944 () V!44113)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18804 0))(
  ( (tuple2!18805 (_1!9413 (_ BitVec 64)) (_2!9413 V!44113)) )
))
(declare-datatypes ((List!25521 0))(
  ( (Nil!25518) (Cons!25517 (h!26726 tuple2!18804) (t!37213 List!25521)) )
))
(declare-datatypes ((ListLongMap!16773 0))(
  ( (ListLongMap!16774 (toList!8402 List!25521)) )
))
(declare-fun lt!524796 () ListLongMap!16773)

(declare-fun minValue!944 () V!44113)

(declare-fun getCurrentListMapNoExtraKeys!4878 (array!75232 array!75234 (_ BitVec 32) (_ BitVec 32) V!44113 V!44113 (_ BitVec 32) Int) ListLongMap!16773)

(declare-fun dynLambda!2811 (Int (_ BitVec 64)) V!44113)

(assert (=> b!1165607 (= lt!524796 (getCurrentListMapNoExtraKeys!4878 lt!524798 (array!75235 (store (arr!36268 _values!996) i!673 (ValueCellFull!13910 (dynLambda!2811 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36806 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524799 () ListLongMap!16773)

(assert (=> b!1165607 (= lt!524799 (getCurrentListMapNoExtraKeys!4878 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45683 () Bool)

(assert (=> mapIsEmpty!45683 mapRes!45683))

(declare-fun b!1165608 () Bool)

(declare-fun res!773087 () Bool)

(assert (=> b!1165608 (=> (not res!773087) (not e!662601))))

(declare-datatypes ((List!25522 0))(
  ( (Nil!25519) (Cons!25518 (h!26727 (_ BitVec 64)) (t!37214 List!25522)) )
))
(declare-fun arrayNoDuplicates!0 (array!75232 (_ BitVec 32) List!25522) Bool)

(assert (=> b!1165608 (= res!773087 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25519))))

(declare-fun b!1165609 () Bool)

(declare-fun res!773083 () Bool)

(assert (=> b!1165609 (=> (not res!773083) (not e!662601))))

(assert (=> b!1165609 (= res!773083 (and (= (size!36806 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36805 _keys!1208) (size!36806 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165610 () Bool)

(declare-fun res!773079 () Bool)

(assert (=> b!1165610 (=> (not res!773079) (not e!662598))))

(assert (=> b!1165610 (= res!773079 (arrayNoDuplicates!0 lt!524798 #b00000000000000000000000000000000 Nil!25519))))

(declare-fun b!1165611 () Bool)

(assert (=> b!1165611 (= e!662597 tp_is_empty!29239)))

(assert (= (and start!99098 res!773081) b!1165598))

(assert (= (and b!1165598 res!773077) b!1165609))

(assert (= (and b!1165609 res!773083) b!1165603))

(assert (= (and b!1165603 res!773080) b!1165608))

(assert (= (and b!1165608 res!773087) b!1165605))

(assert (= (and b!1165605 res!773086) b!1165601))

(assert (= (and b!1165601 res!773084) b!1165602))

(assert (= (and b!1165602 res!773085) b!1165606))

(assert (= (and b!1165606 res!773082) b!1165610))

(assert (= (and b!1165610 res!773079) b!1165599))

(assert (= (and b!1165599 (not res!773078)) b!1165607))

(assert (= (and b!1165604 condMapEmpty!45683) mapIsEmpty!45683))

(assert (= (and b!1165604 (not condMapEmpty!45683)) mapNonEmpty!45683))

(get-info :version)

(assert (= (and mapNonEmpty!45683 ((_ is ValueCellFull!13910) mapValue!45683)) b!1165611))

(assert (= (and b!1165604 ((_ is ValueCellFull!13910) mapDefault!45683)) b!1165600))

(assert (= start!99098 b!1165604))

(declare-fun b_lambda!19797 () Bool)

(assert (=> (not b_lambda!19797) (not b!1165607)))

(declare-fun t!37212 () Bool)

(declare-fun tb!9513 () Bool)

(assert (=> (and start!99098 (= defaultEntry!1004 defaultEntry!1004) t!37212) tb!9513))

(declare-fun result!19599 () Bool)

(assert (=> tb!9513 (= result!19599 tp_is_empty!29239)))

(assert (=> b!1165607 t!37212))

(declare-fun b_and!40247 () Bool)

(assert (= b_and!40245 (and (=> t!37212 result!19599) b_and!40247)))

(declare-fun m!1073245 () Bool)

(assert (=> b!1165602 m!1073245))

(declare-fun m!1073247 () Bool)

(assert (=> b!1165599 m!1073247))

(declare-fun m!1073249 () Bool)

(assert (=> b!1165599 m!1073249))

(declare-fun m!1073251 () Bool)

(assert (=> mapNonEmpty!45683 m!1073251))

(declare-fun m!1073253 () Bool)

(assert (=> b!1165598 m!1073253))

(declare-fun m!1073255 () Bool)

(assert (=> b!1165603 m!1073255))

(declare-fun m!1073257 () Bool)

(assert (=> b!1165607 m!1073257))

(declare-fun m!1073259 () Bool)

(assert (=> b!1165607 m!1073259))

(declare-fun m!1073261 () Bool)

(assert (=> b!1165607 m!1073261))

(declare-fun m!1073263 () Bool)

(assert (=> b!1165607 m!1073263))

(declare-fun m!1073265 () Bool)

(assert (=> b!1165608 m!1073265))

(declare-fun m!1073267 () Bool)

(assert (=> b!1165610 m!1073267))

(declare-fun m!1073269 () Bool)

(assert (=> b!1165606 m!1073269))

(declare-fun m!1073271 () Bool)

(assert (=> b!1165606 m!1073271))

(declare-fun m!1073273 () Bool)

(assert (=> start!99098 m!1073273))

(declare-fun m!1073275 () Bool)

(assert (=> start!99098 m!1073275))

(declare-fun m!1073277 () Bool)

(assert (=> b!1165601 m!1073277))

(check-sat (not b_next!24709) (not b!1165610) (not b!1165607) (not mapNonEmpty!45683) (not b!1165598) (not b!1165608) tp_is_empty!29239 (not b!1165601) (not b!1165606) (not b_lambda!19797) b_and!40247 (not b!1165599) (not start!99098) (not b!1165603))
(check-sat b_and!40247 (not b_next!24709))
