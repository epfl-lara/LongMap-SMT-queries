; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111926 () Bool)

(assert start!111926)

(declare-fun b_free!30525 () Bool)

(declare-fun b_next!30525 () Bool)

(assert (=> start!111926 (= b_free!30525 (not b_next!30525))))

(declare-fun tp!107055 () Bool)

(declare-fun b_and!49145 () Bool)

(assert (=> start!111926 (= tp!107055 b_and!49145)))

(declare-fun b!1326468 () Bool)

(declare-fun res!880384 () Bool)

(declare-fun e!756033 () Bool)

(assert (=> b!1326468 (=> (not res!880384) (not e!756033))))

(declare-datatypes ((array!89596 0))(
  ( (array!89597 (arr!43271 (Array (_ BitVec 32) (_ BitVec 64))) (size!43821 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89596)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89596 (_ BitVec 32)) Bool)

(assert (=> b!1326468 (= res!880384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326469 () Bool)

(declare-fun res!880381 () Bool)

(assert (=> b!1326469 (=> (not res!880381) (not e!756033))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326469 (= res!880381 (not (= (select (arr!43271 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326470 () Bool)

(declare-fun res!880380 () Bool)

(assert (=> b!1326470 (=> (not res!880380) (not e!756033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326470 (= res!880380 (validKeyInArray!0 (select (arr!43271 _keys!1609) from!2000)))))

(declare-fun b!1326471 () Bool)

(declare-fun e!756037 () Bool)

(declare-fun e!756035 () Bool)

(declare-fun mapRes!56169 () Bool)

(assert (=> b!1326471 (= e!756037 (and e!756035 mapRes!56169))))

(declare-fun condMapEmpty!56169 () Bool)

(declare-datatypes ((V!53563 0))(
  ( (V!53564 (val!18247 Int)) )
))
(declare-datatypes ((ValueCell!17274 0))(
  ( (ValueCellFull!17274 (v!20880 V!53563)) (EmptyCell!17274) )
))
(declare-datatypes ((array!89598 0))(
  ( (array!89599 (arr!43272 (Array (_ BitVec 32) ValueCell!17274)) (size!43822 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89598)

(declare-fun mapDefault!56169 () ValueCell!17274)

(assert (=> b!1326471 (= condMapEmpty!56169 (= (arr!43272 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17274)) mapDefault!56169)))))

(declare-fun b!1326472 () Bool)

(declare-fun tp_is_empty!36345 () Bool)

(assert (=> b!1326472 (= e!756035 tp_is_empty!36345)))

(declare-fun b!1326473 () Bool)

(assert (=> b!1326473 (= e!756033 (not true))))

(declare-datatypes ((tuple2!23544 0))(
  ( (tuple2!23545 (_1!11783 (_ BitVec 64)) (_2!11783 V!53563)) )
))
(declare-datatypes ((List!30680 0))(
  ( (Nil!30677) (Cons!30676 (h!31885 tuple2!23544) (t!44676 List!30680)) )
))
(declare-datatypes ((ListLongMap!21201 0))(
  ( (ListLongMap!21202 (toList!10616 List!30680)) )
))
(declare-fun lt!590110 () ListLongMap!21201)

(declare-fun lt!590117 () tuple2!23544)

(declare-fun contains!8773 (ListLongMap!21201 (_ BitVec 64)) Bool)

(declare-fun +!4637 (ListLongMap!21201 tuple2!23544) ListLongMap!21201)

(assert (=> b!1326473 (contains!8773 (+!4637 lt!590110 lt!590117) k0!1164)))

(declare-datatypes ((Unit!43702 0))(
  ( (Unit!43703) )
))
(declare-fun lt!590113 () Unit!43702)

(declare-fun zeroValue!1279 () V!53563)

(declare-fun addStillContains!1161 (ListLongMap!21201 (_ BitVec 64) V!53563 (_ BitVec 64)) Unit!43702)

(assert (=> b!1326473 (= lt!590113 (addStillContains!1161 lt!590110 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1326473 (contains!8773 lt!590110 k0!1164)))

(declare-fun lt!590118 () V!53563)

(declare-fun lt!590111 () Unit!43702)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!229 ((_ BitVec 64) (_ BitVec 64) V!53563 ListLongMap!21201) Unit!43702)

(assert (=> b!1326473 (= lt!590111 (lemmaInListMapAfterAddingDiffThenInBefore!229 k0!1164 (select (arr!43271 _keys!1609) from!2000) lt!590118 lt!590110))))

(declare-fun lt!590114 () ListLongMap!21201)

(assert (=> b!1326473 (contains!8773 lt!590114 k0!1164)))

(declare-fun lt!590116 () Unit!43702)

(assert (=> b!1326473 (= lt!590116 (lemmaInListMapAfterAddingDiffThenInBefore!229 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590114))))

(declare-fun lt!590112 () ListLongMap!21201)

(assert (=> b!1326473 (contains!8773 lt!590112 k0!1164)))

(declare-fun minValue!1279 () V!53563)

(declare-fun lt!590115 () Unit!43702)

(assert (=> b!1326473 (= lt!590115 (lemmaInListMapAfterAddingDiffThenInBefore!229 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590112))))

(assert (=> b!1326473 (= lt!590112 (+!4637 lt!590114 lt!590117))))

(assert (=> b!1326473 (= lt!590117 (tuple2!23545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1326473 (= lt!590114 (+!4637 lt!590110 (tuple2!23545 (select (arr!43271 _keys!1609) from!2000) lt!590118)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21806 (ValueCell!17274 V!53563) V!53563)

(declare-fun dynLambda!3576 (Int (_ BitVec 64)) V!53563)

(assert (=> b!1326473 (= lt!590118 (get!21806 (select (arr!43272 _values!1337) from!2000) (dynLambda!3576 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6275 (array!89596 array!89598 (_ BitVec 32) (_ BitVec 32) V!53563 V!53563 (_ BitVec 32) Int) ListLongMap!21201)

(assert (=> b!1326473 (= lt!590110 (getCurrentListMapNoExtraKeys!6275 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326474 () Bool)

(declare-fun res!880378 () Bool)

(assert (=> b!1326474 (=> (not res!880378) (not e!756033))))

(declare-datatypes ((List!30681 0))(
  ( (Nil!30678) (Cons!30677 (h!31886 (_ BitVec 64)) (t!44677 List!30681)) )
))
(declare-fun arrayNoDuplicates!0 (array!89596 (_ BitVec 32) List!30681) Bool)

(assert (=> b!1326474 (= res!880378 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30678))))

(declare-fun res!880382 () Bool)

(assert (=> start!111926 (=> (not res!880382) (not e!756033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111926 (= res!880382 (validMask!0 mask!2019))))

(assert (=> start!111926 e!756033))

(declare-fun array_inv!32663 (array!89596) Bool)

(assert (=> start!111926 (array_inv!32663 _keys!1609)))

(assert (=> start!111926 true))

(assert (=> start!111926 tp_is_empty!36345))

(declare-fun array_inv!32664 (array!89598) Bool)

(assert (=> start!111926 (and (array_inv!32664 _values!1337) e!756037)))

(assert (=> start!111926 tp!107055))

(declare-fun mapNonEmpty!56169 () Bool)

(declare-fun tp!107054 () Bool)

(declare-fun e!756036 () Bool)

(assert (=> mapNonEmpty!56169 (= mapRes!56169 (and tp!107054 e!756036))))

(declare-fun mapValue!56169 () ValueCell!17274)

(declare-fun mapKey!56169 () (_ BitVec 32))

(declare-fun mapRest!56169 () (Array (_ BitVec 32) ValueCell!17274))

(assert (=> mapNonEmpty!56169 (= (arr!43272 _values!1337) (store mapRest!56169 mapKey!56169 mapValue!56169))))

(declare-fun b!1326475 () Bool)

(declare-fun res!880377 () Bool)

(assert (=> b!1326475 (=> (not res!880377) (not e!756033))))

(assert (=> b!1326475 (= res!880377 (and (= (size!43822 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43821 _keys!1609) (size!43822 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326476 () Bool)

(declare-fun res!880379 () Bool)

(assert (=> b!1326476 (=> (not res!880379) (not e!756033))))

(declare-fun getCurrentListMap!5607 (array!89596 array!89598 (_ BitVec 32) (_ BitVec 32) V!53563 V!53563 (_ BitVec 32) Int) ListLongMap!21201)

(assert (=> b!1326476 (= res!880379 (contains!8773 (getCurrentListMap!5607 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326477 () Bool)

(assert (=> b!1326477 (= e!756036 tp_is_empty!36345)))

(declare-fun mapIsEmpty!56169 () Bool)

(assert (=> mapIsEmpty!56169 mapRes!56169))

(declare-fun b!1326478 () Bool)

(declare-fun res!880383 () Bool)

(assert (=> b!1326478 (=> (not res!880383) (not e!756033))))

(assert (=> b!1326478 (= res!880383 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43821 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111926 res!880382) b!1326475))

(assert (= (and b!1326475 res!880377) b!1326468))

(assert (= (and b!1326468 res!880384) b!1326474))

(assert (= (and b!1326474 res!880378) b!1326478))

(assert (= (and b!1326478 res!880383) b!1326476))

(assert (= (and b!1326476 res!880379) b!1326469))

(assert (= (and b!1326469 res!880381) b!1326470))

(assert (= (and b!1326470 res!880380) b!1326473))

(assert (= (and b!1326471 condMapEmpty!56169) mapIsEmpty!56169))

(assert (= (and b!1326471 (not condMapEmpty!56169)) mapNonEmpty!56169))

(get-info :version)

(assert (= (and mapNonEmpty!56169 ((_ is ValueCellFull!17274) mapValue!56169)) b!1326477))

(assert (= (and b!1326471 ((_ is ValueCellFull!17274) mapDefault!56169)) b!1326472))

(assert (= start!111926 b!1326471))

(declare-fun b_lambda!23803 () Bool)

(assert (=> (not b_lambda!23803) (not b!1326473)))

(declare-fun t!44675 () Bool)

(declare-fun tb!11799 () Bool)

(assert (=> (and start!111926 (= defaultEntry!1340 defaultEntry!1340) t!44675) tb!11799))

(declare-fun result!24655 () Bool)

(assert (=> tb!11799 (= result!24655 tp_is_empty!36345)))

(assert (=> b!1326473 t!44675))

(declare-fun b_and!49147 () Bool)

(assert (= b_and!49145 (and (=> t!44675 result!24655) b_and!49147)))

(declare-fun m!1215471 () Bool)

(assert (=> b!1326476 m!1215471))

(assert (=> b!1326476 m!1215471))

(declare-fun m!1215473 () Bool)

(assert (=> b!1326476 m!1215473))

(declare-fun m!1215475 () Bool)

(assert (=> b!1326474 m!1215475))

(declare-fun m!1215477 () Bool)

(assert (=> b!1326470 m!1215477))

(assert (=> b!1326470 m!1215477))

(declare-fun m!1215479 () Bool)

(assert (=> b!1326470 m!1215479))

(declare-fun m!1215481 () Bool)

(assert (=> b!1326468 m!1215481))

(declare-fun m!1215483 () Bool)

(assert (=> start!111926 m!1215483))

(declare-fun m!1215485 () Bool)

(assert (=> start!111926 m!1215485))

(declare-fun m!1215487 () Bool)

(assert (=> start!111926 m!1215487))

(assert (=> b!1326469 m!1215477))

(declare-fun m!1215489 () Bool)

(assert (=> mapNonEmpty!56169 m!1215489))

(declare-fun m!1215491 () Bool)

(assert (=> b!1326473 m!1215491))

(declare-fun m!1215493 () Bool)

(assert (=> b!1326473 m!1215493))

(declare-fun m!1215495 () Bool)

(assert (=> b!1326473 m!1215495))

(declare-fun m!1215497 () Bool)

(assert (=> b!1326473 m!1215497))

(declare-fun m!1215499 () Bool)

(assert (=> b!1326473 m!1215499))

(declare-fun m!1215501 () Bool)

(assert (=> b!1326473 m!1215501))

(declare-fun m!1215503 () Bool)

(assert (=> b!1326473 m!1215503))

(declare-fun m!1215505 () Bool)

(assert (=> b!1326473 m!1215505))

(declare-fun m!1215507 () Bool)

(assert (=> b!1326473 m!1215507))

(declare-fun m!1215509 () Bool)

(assert (=> b!1326473 m!1215509))

(assert (=> b!1326473 m!1215477))

(assert (=> b!1326473 m!1215509))

(declare-fun m!1215511 () Bool)

(assert (=> b!1326473 m!1215511))

(declare-fun m!1215513 () Bool)

(assert (=> b!1326473 m!1215513))

(assert (=> b!1326473 m!1215477))

(declare-fun m!1215515 () Bool)

(assert (=> b!1326473 m!1215515))

(declare-fun m!1215517 () Bool)

(assert (=> b!1326473 m!1215517))

(assert (=> b!1326473 m!1215503))

(assert (=> b!1326473 m!1215493))

(declare-fun m!1215519 () Bool)

(assert (=> b!1326473 m!1215519))

(check-sat (not b!1326470) (not b!1326474) b_and!49147 (not b!1326476) (not b!1326473) tp_is_empty!36345 (not mapNonEmpty!56169) (not start!111926) (not b_lambda!23803) (not b_next!30525) (not b!1326468))
(check-sat b_and!49147 (not b_next!30525))
