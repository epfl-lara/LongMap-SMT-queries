; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99352 () Bool)

(assert start!99352)

(declare-fun b_free!24721 () Bool)

(declare-fun b_next!24721 () Bool)

(assert (=> start!99352 (= b_free!24721 (not b_next!24721))))

(declare-fun tp!86873 () Bool)

(declare-fun b_and!40293 () Bool)

(assert (=> start!99352 (= tp!86873 b_and!40293)))

(declare-fun b!1167286 () Bool)

(declare-fun e!663645 () Bool)

(declare-fun e!663644 () Bool)

(assert (=> b!1167286 (= e!663645 (not e!663644))))

(declare-fun res!773862 () Bool)

(assert (=> b!1167286 (=> res!773862 e!663644)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1167286 (= res!773862 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75383 0))(
  ( (array!75384 (arr!36336 (Array (_ BitVec 32) (_ BitVec 64))) (size!36873 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75383)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1167286 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38467 0))(
  ( (Unit!38468) )
))
(declare-fun lt!525567 () Unit!38467)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75383 (_ BitVec 64) (_ BitVec 32)) Unit!38467)

(assert (=> b!1167286 (= lt!525567 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1167287 () Bool)

(declare-fun e!663649 () Bool)

(assert (=> b!1167287 (= e!663649 e!663645)))

(declare-fun res!773871 () Bool)

(assert (=> b!1167287 (=> (not res!773871) (not e!663645))))

(declare-fun lt!525571 () array!75383)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75383 (_ BitVec 32)) Bool)

(assert (=> b!1167287 (= res!773871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525571 mask!1564))))

(assert (=> b!1167287 (= lt!525571 (array!75384 (store (arr!36336 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36873 _keys!1208)))))

(declare-fun b!1167288 () Bool)

(declare-fun e!663648 () Bool)

(declare-fun tp_is_empty!29251 () Bool)

(assert (=> b!1167288 (= e!663648 tp_is_empty!29251)))

(declare-fun b!1167289 () Bool)

(declare-fun res!773870 () Bool)

(assert (=> b!1167289 (=> (not res!773870) (not e!663649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1167289 (= res!773870 (validKeyInArray!0 k0!934))))

(declare-fun b!1167290 () Bool)

(declare-fun res!773863 () Bool)

(assert (=> b!1167290 (=> (not res!773863) (not e!663649))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44129 0))(
  ( (V!44130 (val!14682 Int)) )
))
(declare-datatypes ((ValueCell!13916 0))(
  ( (ValueCellFull!13916 (v!17315 V!44129)) (EmptyCell!13916) )
))
(declare-datatypes ((array!75385 0))(
  ( (array!75386 (arr!36337 (Array (_ BitVec 32) ValueCell!13916)) (size!36874 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75385)

(assert (=> b!1167290 (= res!773863 (and (= (size!36874 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36873 _keys!1208) (size!36874 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1167291 () Bool)

(declare-fun e!663643 () Bool)

(assert (=> b!1167291 (= e!663644 e!663643)))

(declare-fun res!773860 () Bool)

(assert (=> b!1167291 (=> res!773860 e!663643)))

(assert (=> b!1167291 (= res!773860 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18758 0))(
  ( (tuple2!18759 (_1!9390 (_ BitVec 64)) (_2!9390 V!44129)) )
))
(declare-datatypes ((List!25498 0))(
  ( (Nil!25495) (Cons!25494 (h!26712 tuple2!18758) (t!37203 List!25498)) )
))
(declare-datatypes ((ListLongMap!16735 0))(
  ( (ListLongMap!16736 (toList!8383 List!25498)) )
))
(declare-fun lt!525569 () ListLongMap!16735)

(declare-fun lt!525570 () array!75385)

(declare-fun minValue!944 () V!44129)

(declare-fun zeroValue!944 () V!44129)

(declare-fun getCurrentListMapNoExtraKeys!4874 (array!75383 array!75385 (_ BitVec 32) (_ BitVec 32) V!44129 V!44129 (_ BitVec 32) Int) ListLongMap!16735)

(assert (=> b!1167291 (= lt!525569 (getCurrentListMapNoExtraKeys!4874 lt!525571 lt!525570 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2863 (Int (_ BitVec 64)) V!44129)

(assert (=> b!1167291 (= lt!525570 (array!75386 (store (arr!36337 _values!996) i!673 (ValueCellFull!13916 (dynLambda!2863 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36874 _values!996)))))

(declare-fun lt!525566 () ListLongMap!16735)

(assert (=> b!1167291 (= lt!525566 (getCurrentListMapNoExtraKeys!4874 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1167292 () Bool)

(assert (=> b!1167292 (= e!663643 true)))

(declare-fun -!1448 (ListLongMap!16735 (_ BitVec 64)) ListLongMap!16735)

(assert (=> b!1167292 (= (getCurrentListMapNoExtraKeys!4874 lt!525571 lt!525570 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1448 (getCurrentListMapNoExtraKeys!4874 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!525568 () Unit!38467)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!673 (array!75383 array!75385 (_ BitVec 32) (_ BitVec 32) V!44129 V!44129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38467)

(assert (=> b!1167292 (= lt!525568 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!673 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1167293 () Bool)

(declare-fun res!773867 () Bool)

(assert (=> b!1167293 (=> (not res!773867) (not e!663649))))

(assert (=> b!1167293 (= res!773867 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36873 _keys!1208))))))

(declare-fun b!1167294 () Bool)

(declare-fun res!773864 () Bool)

(assert (=> b!1167294 (=> (not res!773864) (not e!663649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1167294 (= res!773864 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45701 () Bool)

(declare-fun mapRes!45701 () Bool)

(assert (=> mapIsEmpty!45701 mapRes!45701))

(declare-fun res!773866 () Bool)

(assert (=> start!99352 (=> (not res!773866) (not e!663649))))

(assert (=> start!99352 (= res!773866 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36873 _keys!1208))))))

(assert (=> start!99352 e!663649))

(assert (=> start!99352 tp_is_empty!29251))

(declare-fun array_inv!27858 (array!75383) Bool)

(assert (=> start!99352 (array_inv!27858 _keys!1208)))

(assert (=> start!99352 true))

(assert (=> start!99352 tp!86873))

(declare-fun e!663647 () Bool)

(declare-fun array_inv!27859 (array!75385) Bool)

(assert (=> start!99352 (and (array_inv!27859 _values!996) e!663647)))

(declare-fun b!1167295 () Bool)

(declare-fun res!773865 () Bool)

(assert (=> b!1167295 (=> (not res!773865) (not e!663649))))

(assert (=> b!1167295 (= res!773865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1167296 () Bool)

(declare-fun e!663646 () Bool)

(assert (=> b!1167296 (= e!663646 tp_is_empty!29251)))

(declare-fun b!1167297 () Bool)

(declare-fun res!773861 () Bool)

(assert (=> b!1167297 (=> (not res!773861) (not e!663649))))

(declare-datatypes ((List!25499 0))(
  ( (Nil!25496) (Cons!25495 (h!26713 (_ BitVec 64)) (t!37204 List!25499)) )
))
(declare-fun arrayNoDuplicates!0 (array!75383 (_ BitVec 32) List!25499) Bool)

(assert (=> b!1167297 (= res!773861 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25496))))

(declare-fun b!1167298 () Bool)

(declare-fun res!773869 () Bool)

(assert (=> b!1167298 (=> (not res!773869) (not e!663649))))

(assert (=> b!1167298 (= res!773869 (= (select (arr!36336 _keys!1208) i!673) k0!934))))

(declare-fun b!1167299 () Bool)

(declare-fun res!773868 () Bool)

(assert (=> b!1167299 (=> (not res!773868) (not e!663645))))

(assert (=> b!1167299 (= res!773868 (arrayNoDuplicates!0 lt!525571 #b00000000000000000000000000000000 Nil!25496))))

(declare-fun b!1167300 () Bool)

(assert (=> b!1167300 (= e!663647 (and e!663646 mapRes!45701))))

(declare-fun condMapEmpty!45701 () Bool)

(declare-fun mapDefault!45701 () ValueCell!13916)

(assert (=> b!1167300 (= condMapEmpty!45701 (= (arr!36337 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13916)) mapDefault!45701)))))

(declare-fun mapNonEmpty!45701 () Bool)

(declare-fun tp!86874 () Bool)

(assert (=> mapNonEmpty!45701 (= mapRes!45701 (and tp!86874 e!663648))))

(declare-fun mapKey!45701 () (_ BitVec 32))

(declare-fun mapRest!45701 () (Array (_ BitVec 32) ValueCell!13916))

(declare-fun mapValue!45701 () ValueCell!13916)

(assert (=> mapNonEmpty!45701 (= (arr!36337 _values!996) (store mapRest!45701 mapKey!45701 mapValue!45701))))

(assert (= (and start!99352 res!773866) b!1167294))

(assert (= (and b!1167294 res!773864) b!1167290))

(assert (= (and b!1167290 res!773863) b!1167295))

(assert (= (and b!1167295 res!773865) b!1167297))

(assert (= (and b!1167297 res!773861) b!1167293))

(assert (= (and b!1167293 res!773867) b!1167289))

(assert (= (and b!1167289 res!773870) b!1167298))

(assert (= (and b!1167298 res!773869) b!1167287))

(assert (= (and b!1167287 res!773871) b!1167299))

(assert (= (and b!1167299 res!773868) b!1167286))

(assert (= (and b!1167286 (not res!773862)) b!1167291))

(assert (= (and b!1167291 (not res!773860)) b!1167292))

(assert (= (and b!1167300 condMapEmpty!45701) mapIsEmpty!45701))

(assert (= (and b!1167300 (not condMapEmpty!45701)) mapNonEmpty!45701))

(get-info :version)

(assert (= (and mapNonEmpty!45701 ((_ is ValueCellFull!13916) mapValue!45701)) b!1167288))

(assert (= (and b!1167300 ((_ is ValueCellFull!13916) mapDefault!45701)) b!1167296))

(assert (= start!99352 b!1167300))

(declare-fun b_lambda!19821 () Bool)

(assert (=> (not b_lambda!19821) (not b!1167291)))

(declare-fun t!37202 () Bool)

(declare-fun tb!9525 () Bool)

(assert (=> (and start!99352 (= defaultEntry!1004 defaultEntry!1004) t!37202) tb!9525))

(declare-fun result!19623 () Bool)

(assert (=> tb!9525 (= result!19623 tp_is_empty!29251)))

(assert (=> b!1167291 t!37202))

(declare-fun b_and!40295 () Bool)

(assert (= b_and!40293 (and (=> t!37202 result!19623) b_and!40295)))

(declare-fun m!1075655 () Bool)

(assert (=> b!1167294 m!1075655))

(declare-fun m!1075657 () Bool)

(assert (=> b!1167291 m!1075657))

(declare-fun m!1075659 () Bool)

(assert (=> b!1167291 m!1075659))

(declare-fun m!1075661 () Bool)

(assert (=> b!1167291 m!1075661))

(declare-fun m!1075663 () Bool)

(assert (=> b!1167291 m!1075663))

(declare-fun m!1075665 () Bool)

(assert (=> b!1167298 m!1075665))

(declare-fun m!1075667 () Bool)

(assert (=> b!1167289 m!1075667))

(declare-fun m!1075669 () Bool)

(assert (=> b!1167297 m!1075669))

(declare-fun m!1075671 () Bool)

(assert (=> b!1167299 m!1075671))

(declare-fun m!1075673 () Bool)

(assert (=> mapNonEmpty!45701 m!1075673))

(declare-fun m!1075675 () Bool)

(assert (=> b!1167295 m!1075675))

(declare-fun m!1075677 () Bool)

(assert (=> b!1167287 m!1075677))

(declare-fun m!1075679 () Bool)

(assert (=> b!1167287 m!1075679))

(declare-fun m!1075681 () Bool)

(assert (=> b!1167286 m!1075681))

(declare-fun m!1075683 () Bool)

(assert (=> b!1167286 m!1075683))

(declare-fun m!1075685 () Bool)

(assert (=> b!1167292 m!1075685))

(declare-fun m!1075687 () Bool)

(assert (=> b!1167292 m!1075687))

(assert (=> b!1167292 m!1075687))

(declare-fun m!1075689 () Bool)

(assert (=> b!1167292 m!1075689))

(declare-fun m!1075691 () Bool)

(assert (=> b!1167292 m!1075691))

(declare-fun m!1075693 () Bool)

(assert (=> start!99352 m!1075693))

(declare-fun m!1075695 () Bool)

(assert (=> start!99352 m!1075695))

(check-sat (not b!1167295) (not b!1167299) (not b!1167297) (not b!1167292) b_and!40295 (not b!1167294) (not start!99352) (not mapNonEmpty!45701) (not b!1167289) (not b!1167291) (not b_next!24721) tp_is_empty!29251 (not b_lambda!19821) (not b!1167287) (not b!1167286))
(check-sat b_and!40295 (not b_next!24721))
