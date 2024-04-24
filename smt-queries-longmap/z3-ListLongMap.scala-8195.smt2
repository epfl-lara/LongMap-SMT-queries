; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100272 () Bool)

(assert start!100272)

(declare-fun b_free!25615 () Bool)

(declare-fun b_next!25615 () Bool)

(assert (=> start!100272 (= b_free!25615 (not b_next!25615))))

(declare-fun tp!89558 () Bool)

(declare-fun b_and!42099 () Bool)

(assert (=> start!100272 (= tp!89558 b_and!42099)))

(declare-fun b!1193415 () Bool)

(declare-fun e!678457 () Bool)

(declare-fun e!678456 () Bool)

(assert (=> b!1193415 (= e!678457 e!678456)))

(declare-fun res!793512 () Bool)

(assert (=> b!1193415 (=> res!793512 e!678456)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193415 (= res!793512 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45321 0))(
  ( (V!45322 (val!15129 Int)) )
))
(declare-fun zeroValue!944 () V!45321)

(declare-datatypes ((array!77119 0))(
  ( (array!77120 (arr!37203 (Array (_ BitVec 32) (_ BitVec 64))) (size!37740 (_ BitVec 32))) )
))
(declare-fun lt!542579 () array!77119)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun minValue!944 () V!45321)

(declare-datatypes ((ValueCell!14363 0))(
  ( (ValueCellFull!14363 (v!17763 V!45321)) (EmptyCell!14363) )
))
(declare-datatypes ((array!77121 0))(
  ( (array!77122 (arr!37204 (Array (_ BitVec 32) ValueCell!14363)) (size!37741 (_ BitVec 32))) )
))
(declare-fun lt!542581 () array!77121)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19480 0))(
  ( (tuple2!19481 (_1!9751 (_ BitVec 64)) (_2!9751 V!45321)) )
))
(declare-datatypes ((List!26222 0))(
  ( (Nil!26219) (Cons!26218 (h!27436 tuple2!19480) (t!38821 List!26222)) )
))
(declare-datatypes ((ListLongMap!17457 0))(
  ( (ListLongMap!17458 (toList!8744 List!26222)) )
))
(declare-fun lt!542583 () ListLongMap!17457)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5212 (array!77119 array!77121 (_ BitVec 32) (_ BitVec 32) V!45321 V!45321 (_ BitVec 32) Int) ListLongMap!17457)

(assert (=> b!1193415 (= lt!542583 (getCurrentListMapNoExtraKeys!5212 lt!542579 lt!542581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77121)

(declare-fun dynLambda!3163 (Int (_ BitVec 64)) V!45321)

(assert (=> b!1193415 (= lt!542581 (array!77122 (store (arr!37204 _values!996) i!673 (ValueCellFull!14363 (dynLambda!3163 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37741 _values!996)))))

(declare-fun _keys!1208 () array!77119)

(declare-fun lt!542580 () ListLongMap!17457)

(assert (=> b!1193415 (= lt!542580 (getCurrentListMapNoExtraKeys!5212 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193416 () Bool)

(declare-fun res!793516 () Bool)

(declare-fun e!678452 () Bool)

(assert (=> b!1193416 (=> (not res!793516) (not e!678452))))

(assert (=> b!1193416 (= res!793516 (and (= (size!37741 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37740 _keys!1208) (size!37741 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193417 () Bool)

(declare-fun res!793522 () Bool)

(declare-fun e!678451 () Bool)

(assert (=> b!1193417 (=> (not res!793522) (not e!678451))))

(declare-datatypes ((List!26223 0))(
  ( (Nil!26220) (Cons!26219 (h!27437 (_ BitVec 64)) (t!38822 List!26223)) )
))
(declare-fun arrayNoDuplicates!0 (array!77119 (_ BitVec 32) List!26223) Bool)

(assert (=> b!1193417 (= res!793522 (arrayNoDuplicates!0 lt!542579 #b00000000000000000000000000000000 Nil!26220))))

(declare-fun b!1193418 () Bool)

(assert (=> b!1193418 (= e!678456 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1751 (ListLongMap!17457 (_ BitVec 64)) ListLongMap!17457)

(assert (=> b!1193418 (= (getCurrentListMapNoExtraKeys!5212 lt!542579 lt!542581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1751 (getCurrentListMapNoExtraKeys!5212 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39529 0))(
  ( (Unit!39530) )
))
(declare-fun lt!542584 () Unit!39529)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!966 (array!77119 array!77121 (_ BitVec 32) (_ BitVec 32) V!45321 V!45321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39529)

(assert (=> b!1193418 (= lt!542584 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!966 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47045 () Bool)

(declare-fun mapRes!47045 () Bool)

(assert (=> mapIsEmpty!47045 mapRes!47045))

(declare-fun b!1193420 () Bool)

(declare-fun res!793515 () Bool)

(assert (=> b!1193420 (=> (not res!793515) (not e!678452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193420 (= res!793515 (validKeyInArray!0 k0!934))))

(declare-fun b!1193421 () Bool)

(assert (=> b!1193421 (= e!678452 e!678451)))

(declare-fun res!793517 () Bool)

(assert (=> b!1193421 (=> (not res!793517) (not e!678451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77119 (_ BitVec 32)) Bool)

(assert (=> b!1193421 (= res!793517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542579 mask!1564))))

(assert (=> b!1193421 (= lt!542579 (array!77120 (store (arr!37203 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37740 _keys!1208)))))

(declare-fun b!1193422 () Bool)

(declare-fun e!678453 () Bool)

(declare-fun e!678455 () Bool)

(assert (=> b!1193422 (= e!678453 (and e!678455 mapRes!47045))))

(declare-fun condMapEmpty!47045 () Bool)

(declare-fun mapDefault!47045 () ValueCell!14363)

(assert (=> b!1193422 (= condMapEmpty!47045 (= (arr!37204 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14363)) mapDefault!47045)))))

(declare-fun mapNonEmpty!47045 () Bool)

(declare-fun tp!89559 () Bool)

(declare-fun e!678454 () Bool)

(assert (=> mapNonEmpty!47045 (= mapRes!47045 (and tp!89559 e!678454))))

(declare-fun mapRest!47045 () (Array (_ BitVec 32) ValueCell!14363))

(declare-fun mapValue!47045 () ValueCell!14363)

(declare-fun mapKey!47045 () (_ BitVec 32))

(assert (=> mapNonEmpty!47045 (= (arr!37204 _values!996) (store mapRest!47045 mapKey!47045 mapValue!47045))))

(declare-fun b!1193423 () Bool)

(declare-fun res!793521 () Bool)

(assert (=> b!1193423 (=> (not res!793521) (not e!678452))))

(assert (=> b!1193423 (= res!793521 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37740 _keys!1208))))))

(declare-fun res!793519 () Bool)

(assert (=> start!100272 (=> (not res!793519) (not e!678452))))

(assert (=> start!100272 (= res!793519 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37740 _keys!1208))))))

(assert (=> start!100272 e!678452))

(declare-fun tp_is_empty!30145 () Bool)

(assert (=> start!100272 tp_is_empty!30145))

(declare-fun array_inv!28430 (array!77119) Bool)

(assert (=> start!100272 (array_inv!28430 _keys!1208)))

(assert (=> start!100272 true))

(assert (=> start!100272 tp!89558))

(declare-fun array_inv!28431 (array!77121) Bool)

(assert (=> start!100272 (and (array_inv!28431 _values!996) e!678453)))

(declare-fun b!1193419 () Bool)

(declare-fun res!793518 () Bool)

(assert (=> b!1193419 (=> (not res!793518) (not e!678452))))

(assert (=> b!1193419 (= res!793518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193424 () Bool)

(assert (=> b!1193424 (= e!678454 tp_is_empty!30145)))

(declare-fun b!1193425 () Bool)

(assert (=> b!1193425 (= e!678451 (not e!678457))))

(declare-fun res!793514 () Bool)

(assert (=> b!1193425 (=> res!793514 e!678457)))

(assert (=> b!1193425 (= res!793514 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193425 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542582 () Unit!39529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77119 (_ BitVec 64) (_ BitVec 32)) Unit!39529)

(assert (=> b!1193425 (= lt!542582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193426 () Bool)

(assert (=> b!1193426 (= e!678455 tp_is_empty!30145)))

(declare-fun b!1193427 () Bool)

(declare-fun res!793520 () Bool)

(assert (=> b!1193427 (=> (not res!793520) (not e!678452))))

(assert (=> b!1193427 (= res!793520 (= (select (arr!37203 _keys!1208) i!673) k0!934))))

(declare-fun b!1193428 () Bool)

(declare-fun res!793513 () Bool)

(assert (=> b!1193428 (=> (not res!793513) (not e!678452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193428 (= res!793513 (validMask!0 mask!1564))))

(declare-fun b!1193429 () Bool)

(declare-fun res!793523 () Bool)

(assert (=> b!1193429 (=> (not res!793523) (not e!678452))))

(assert (=> b!1193429 (= res!793523 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26220))))

(assert (= (and start!100272 res!793519) b!1193428))

(assert (= (and b!1193428 res!793513) b!1193416))

(assert (= (and b!1193416 res!793516) b!1193419))

(assert (= (and b!1193419 res!793518) b!1193429))

(assert (= (and b!1193429 res!793523) b!1193423))

(assert (= (and b!1193423 res!793521) b!1193420))

(assert (= (and b!1193420 res!793515) b!1193427))

(assert (= (and b!1193427 res!793520) b!1193421))

(assert (= (and b!1193421 res!793517) b!1193417))

(assert (= (and b!1193417 res!793522) b!1193425))

(assert (= (and b!1193425 (not res!793514)) b!1193415))

(assert (= (and b!1193415 (not res!793512)) b!1193418))

(assert (= (and b!1193422 condMapEmpty!47045) mapIsEmpty!47045))

(assert (= (and b!1193422 (not condMapEmpty!47045)) mapNonEmpty!47045))

(get-info :version)

(assert (= (and mapNonEmpty!47045 ((_ is ValueCellFull!14363) mapValue!47045)) b!1193424))

(assert (= (and b!1193422 ((_ is ValueCellFull!14363) mapDefault!47045)) b!1193426))

(assert (= start!100272 b!1193422))

(declare-fun b_lambda!20753 () Bool)

(assert (=> (not b_lambda!20753) (not b!1193415)))

(declare-fun t!38820 () Bool)

(declare-fun tb!10419 () Bool)

(assert (=> (and start!100272 (= defaultEntry!1004 defaultEntry!1004) t!38820) tb!10419))

(declare-fun result!21413 () Bool)

(assert (=> tb!10419 (= result!21413 tp_is_empty!30145)))

(assert (=> b!1193415 t!38820))

(declare-fun b_and!42101 () Bool)

(assert (= b_and!42099 (and (=> t!38820 result!21413) b_and!42101)))

(declare-fun m!1102089 () Bool)

(assert (=> b!1193421 m!1102089))

(declare-fun m!1102091 () Bool)

(assert (=> b!1193421 m!1102091))

(declare-fun m!1102093 () Bool)

(assert (=> b!1193415 m!1102093))

(declare-fun m!1102095 () Bool)

(assert (=> b!1193415 m!1102095))

(declare-fun m!1102097 () Bool)

(assert (=> b!1193415 m!1102097))

(declare-fun m!1102099 () Bool)

(assert (=> b!1193415 m!1102099))

(declare-fun m!1102101 () Bool)

(assert (=> b!1193419 m!1102101))

(declare-fun m!1102103 () Bool)

(assert (=> b!1193428 m!1102103))

(declare-fun m!1102105 () Bool)

(assert (=> b!1193420 m!1102105))

(declare-fun m!1102107 () Bool)

(assert (=> b!1193429 m!1102107))

(declare-fun m!1102109 () Bool)

(assert (=> mapNonEmpty!47045 m!1102109))

(declare-fun m!1102111 () Bool)

(assert (=> b!1193417 m!1102111))

(declare-fun m!1102113 () Bool)

(assert (=> b!1193425 m!1102113))

(declare-fun m!1102115 () Bool)

(assert (=> b!1193425 m!1102115))

(declare-fun m!1102117 () Bool)

(assert (=> b!1193418 m!1102117))

(declare-fun m!1102119 () Bool)

(assert (=> b!1193418 m!1102119))

(assert (=> b!1193418 m!1102119))

(declare-fun m!1102121 () Bool)

(assert (=> b!1193418 m!1102121))

(declare-fun m!1102123 () Bool)

(assert (=> b!1193418 m!1102123))

(declare-fun m!1102125 () Bool)

(assert (=> b!1193427 m!1102125))

(declare-fun m!1102127 () Bool)

(assert (=> start!100272 m!1102127))

(declare-fun m!1102129 () Bool)

(assert (=> start!100272 m!1102129))

(check-sat (not b_lambda!20753) (not b!1193425) (not b!1193419) (not b!1193418) (not b!1193421) (not b!1193415) (not b!1193429) (not b!1193428) (not b!1193420) (not start!100272) b_and!42101 (not b_next!25615) tp_is_empty!30145 (not b!1193417) (not mapNonEmpty!47045))
(check-sat b_and!42101 (not b_next!25615))
