; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111700 () Bool)

(assert start!111700)

(declare-fun b_free!30357 () Bool)

(declare-fun b_next!30357 () Bool)

(assert (=> start!111700 (= b_free!30357 (not b_next!30357))))

(declare-fun tp!106546 () Bool)

(declare-fun b_and!48873 () Bool)

(assert (=> start!111700 (= tp!106546 b_and!48873)))

(declare-fun mapIsEmpty!55913 () Bool)

(declare-fun mapRes!55913 () Bool)

(assert (=> mapIsEmpty!55913 mapRes!55913))

(declare-fun mapNonEmpty!55913 () Bool)

(declare-fun tp!106547 () Bool)

(declare-fun e!754519 () Bool)

(assert (=> mapNonEmpty!55913 (= mapRes!55913 (and tp!106547 e!754519))))

(declare-fun mapKey!55913 () (_ BitVec 32))

(declare-datatypes ((V!53339 0))(
  ( (V!53340 (val!18163 Int)) )
))
(declare-datatypes ((ValueCell!17190 0))(
  ( (ValueCellFull!17190 (v!20793 V!53339)) (EmptyCell!17190) )
))
(declare-fun mapRest!55913 () (Array (_ BitVec 32) ValueCell!17190))

(declare-datatypes ((array!89272 0))(
  ( (array!89273 (arr!43110 (Array (_ BitVec 32) ValueCell!17190)) (size!43660 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89272)

(declare-fun mapValue!55913 () ValueCell!17190)

(assert (=> mapNonEmpty!55913 (= (arr!43110 _values!1337) (store mapRest!55913 mapKey!55913 mapValue!55913))))

(declare-fun b!1323465 () Bool)

(declare-fun res!878464 () Bool)

(declare-fun e!754516 () Bool)

(assert (=> b!1323465 (=> (not res!878464) (not e!754516))))

(declare-datatypes ((array!89274 0))(
  ( (array!89275 (arr!43111 (Array (_ BitVec 32) (_ BitVec 64))) (size!43661 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89274)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1323465 (= res!878464 (and (= (size!43660 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43661 _keys!1609) (size!43660 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323466 () Bool)

(declare-fun res!878462 () Bool)

(assert (=> b!1323466 (=> (not res!878462) (not e!754516))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323466 (= res!878462 (validKeyInArray!0 (select (arr!43111 _keys!1609) from!2000)))))

(declare-fun b!1323467 () Bool)

(declare-fun e!754515 () Bool)

(declare-fun tp_is_empty!36177 () Bool)

(assert (=> b!1323467 (= e!754515 tp_is_empty!36177)))

(declare-fun b!1323469 () Bool)

(declare-fun e!754518 () Bool)

(assert (=> b!1323469 (= e!754518 (and e!754515 mapRes!55913))))

(declare-fun condMapEmpty!55913 () Bool)

(declare-fun mapDefault!55913 () ValueCell!17190)

(assert (=> b!1323469 (= condMapEmpty!55913 (= (arr!43110 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17190)) mapDefault!55913)))))

(declare-fun b!1323470 () Bool)

(declare-fun res!878461 () Bool)

(assert (=> b!1323470 (=> (not res!878461) (not e!754516))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323470 (= res!878461 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43661 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323471 () Bool)

(declare-fun res!878463 () Bool)

(assert (=> b!1323471 (=> (not res!878463) (not e!754516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89274 (_ BitVec 32)) Bool)

(assert (=> b!1323471 (= res!878463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323472 () Bool)

(assert (=> b!1323472 (= e!754516 (not true))))

(declare-datatypes ((tuple2!23414 0))(
  ( (tuple2!23415 (_1!11718 (_ BitVec 64)) (_2!11718 V!53339)) )
))
(declare-datatypes ((List!30556 0))(
  ( (Nil!30553) (Cons!30552 (h!31761 tuple2!23414) (t!44462 List!30556)) )
))
(declare-datatypes ((ListLongMap!21071 0))(
  ( (ListLongMap!21072 (toList!10551 List!30556)) )
))
(declare-fun lt!589058 () ListLongMap!21071)

(declare-fun minValue!1279 () V!53339)

(declare-fun contains!8706 (ListLongMap!21071 (_ BitVec 64)) Bool)

(declare-fun +!4602 (ListLongMap!21071 tuple2!23414) ListLongMap!21071)

(assert (=> b!1323472 (contains!8706 (+!4602 lt!589058 (tuple2!23415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43624 0))(
  ( (Unit!43625) )
))
(declare-fun lt!589064 () Unit!43624)

(declare-fun addStillContains!1151 (ListLongMap!21071 (_ BitVec 64) V!53339 (_ BitVec 64)) Unit!43624)

(assert (=> b!1323472 (= lt!589064 (addStillContains!1151 lt!589058 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323472 (contains!8706 lt!589058 k0!1164)))

(declare-fun lt!589068 () ListLongMap!21071)

(declare-fun lt!589062 () tuple2!23414)

(assert (=> b!1323472 (= lt!589058 (+!4602 lt!589068 lt!589062))))

(declare-fun zeroValue!1279 () V!53339)

(declare-fun lt!589063 () Unit!43624)

(assert (=> b!1323472 (= lt!589063 (addStillContains!1151 lt!589068 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323472 (contains!8706 lt!589068 k0!1164)))

(declare-fun lt!589059 () Unit!43624)

(declare-fun lt!589067 () V!53339)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!198 ((_ BitVec 64) (_ BitVec 64) V!53339 ListLongMap!21071) Unit!43624)

(assert (=> b!1323472 (= lt!589059 (lemmaInListMapAfterAddingDiffThenInBefore!198 k0!1164 (select (arr!43111 _keys!1609) from!2000) lt!589067 lt!589068))))

(declare-fun lt!589061 () ListLongMap!21071)

(assert (=> b!1323472 (contains!8706 lt!589061 k0!1164)))

(declare-fun lt!589065 () Unit!43624)

(assert (=> b!1323472 (= lt!589065 (lemmaInListMapAfterAddingDiffThenInBefore!198 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589061))))

(declare-fun lt!589066 () ListLongMap!21071)

(assert (=> b!1323472 (contains!8706 lt!589066 k0!1164)))

(declare-fun lt!589060 () Unit!43624)

(assert (=> b!1323472 (= lt!589060 (lemmaInListMapAfterAddingDiffThenInBefore!198 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589066))))

(assert (=> b!1323472 (= lt!589066 (+!4602 lt!589061 lt!589062))))

(assert (=> b!1323472 (= lt!589062 (tuple2!23415 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323472 (= lt!589061 (+!4602 lt!589068 (tuple2!23415 (select (arr!43111 _keys!1609) from!2000) lt!589067)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21712 (ValueCell!17190 V!53339) V!53339)

(declare-fun dynLambda!3541 (Int (_ BitVec 64)) V!53339)

(assert (=> b!1323472 (= lt!589067 (get!21712 (select (arr!43110 _values!1337) from!2000) (dynLambda!3541 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6237 (array!89274 array!89272 (_ BitVec 32) (_ BitVec 32) V!53339 V!53339 (_ BitVec 32) Int) ListLongMap!21071)

(assert (=> b!1323472 (= lt!589068 (getCurrentListMapNoExtraKeys!6237 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323473 () Bool)

(assert (=> b!1323473 (= e!754519 tp_is_empty!36177)))

(declare-fun b!1323468 () Bool)

(declare-fun res!878468 () Bool)

(assert (=> b!1323468 (=> (not res!878468) (not e!754516))))

(declare-datatypes ((List!30557 0))(
  ( (Nil!30554) (Cons!30553 (h!31762 (_ BitVec 64)) (t!44463 List!30557)) )
))
(declare-fun arrayNoDuplicates!0 (array!89274 (_ BitVec 32) List!30557) Bool)

(assert (=> b!1323468 (= res!878468 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30554))))

(declare-fun res!878466 () Bool)

(assert (=> start!111700 (=> (not res!878466) (not e!754516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111700 (= res!878466 (validMask!0 mask!2019))))

(assert (=> start!111700 e!754516))

(declare-fun array_inv!32547 (array!89274) Bool)

(assert (=> start!111700 (array_inv!32547 _keys!1609)))

(assert (=> start!111700 true))

(assert (=> start!111700 tp_is_empty!36177))

(declare-fun array_inv!32548 (array!89272) Bool)

(assert (=> start!111700 (and (array_inv!32548 _values!1337) e!754518)))

(assert (=> start!111700 tp!106546))

(declare-fun b!1323474 () Bool)

(declare-fun res!878465 () Bool)

(assert (=> b!1323474 (=> (not res!878465) (not e!754516))))

(assert (=> b!1323474 (= res!878465 (not (= (select (arr!43111 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323475 () Bool)

(declare-fun res!878467 () Bool)

(assert (=> b!1323475 (=> (not res!878467) (not e!754516))))

(declare-fun getCurrentListMap!5548 (array!89274 array!89272 (_ BitVec 32) (_ BitVec 32) V!53339 V!53339 (_ BitVec 32) Int) ListLongMap!21071)

(assert (=> b!1323475 (= res!878467 (contains!8706 (getCurrentListMap!5548 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111700 res!878466) b!1323465))

(assert (= (and b!1323465 res!878464) b!1323471))

(assert (= (and b!1323471 res!878463) b!1323468))

(assert (= (and b!1323468 res!878468) b!1323470))

(assert (= (and b!1323470 res!878461) b!1323475))

(assert (= (and b!1323475 res!878467) b!1323474))

(assert (= (and b!1323474 res!878465) b!1323466))

(assert (= (and b!1323466 res!878462) b!1323472))

(assert (= (and b!1323469 condMapEmpty!55913) mapIsEmpty!55913))

(assert (= (and b!1323469 (not condMapEmpty!55913)) mapNonEmpty!55913))

(get-info :version)

(assert (= (and mapNonEmpty!55913 ((_ is ValueCellFull!17190) mapValue!55913)) b!1323473))

(assert (= (and b!1323469 ((_ is ValueCellFull!17190) mapDefault!55913)) b!1323467))

(assert (= start!111700 b!1323469))

(declare-fun b_lambda!23683 () Bool)

(assert (=> (not b_lambda!23683) (not b!1323472)))

(declare-fun t!44461 () Bool)

(declare-fun tb!11709 () Bool)

(assert (=> (and start!111700 (= defaultEntry!1340 defaultEntry!1340) t!44461) tb!11709))

(declare-fun result!24473 () Bool)

(assert (=> tb!11709 (= result!24473 tp_is_empty!36177)))

(assert (=> b!1323472 t!44461))

(declare-fun b_and!48875 () Bool)

(assert (= b_and!48873 (and (=> t!44461 result!24473) b_and!48875)))

(declare-fun m!1212287 () Bool)

(assert (=> mapNonEmpty!55913 m!1212287))

(declare-fun m!1212289 () Bool)

(assert (=> start!111700 m!1212289))

(declare-fun m!1212291 () Bool)

(assert (=> start!111700 m!1212291))

(declare-fun m!1212293 () Bool)

(assert (=> start!111700 m!1212293))

(declare-fun m!1212295 () Bool)

(assert (=> b!1323466 m!1212295))

(assert (=> b!1323466 m!1212295))

(declare-fun m!1212297 () Bool)

(assert (=> b!1323466 m!1212297))

(declare-fun m!1212299 () Bool)

(assert (=> b!1323471 m!1212299))

(declare-fun m!1212301 () Bool)

(assert (=> b!1323468 m!1212301))

(declare-fun m!1212303 () Bool)

(assert (=> b!1323472 m!1212303))

(declare-fun m!1212305 () Bool)

(assert (=> b!1323472 m!1212305))

(declare-fun m!1212307 () Bool)

(assert (=> b!1323472 m!1212307))

(declare-fun m!1212309 () Bool)

(assert (=> b!1323472 m!1212309))

(declare-fun m!1212311 () Bool)

(assert (=> b!1323472 m!1212311))

(declare-fun m!1212313 () Bool)

(assert (=> b!1323472 m!1212313))

(assert (=> b!1323472 m!1212295))

(declare-fun m!1212315 () Bool)

(assert (=> b!1323472 m!1212315))

(declare-fun m!1212317 () Bool)

(assert (=> b!1323472 m!1212317))

(declare-fun m!1212319 () Bool)

(assert (=> b!1323472 m!1212319))

(assert (=> b!1323472 m!1212295))

(assert (=> b!1323472 m!1212311))

(declare-fun m!1212321 () Bool)

(assert (=> b!1323472 m!1212321))

(declare-fun m!1212323 () Bool)

(assert (=> b!1323472 m!1212323))

(declare-fun m!1212325 () Bool)

(assert (=> b!1323472 m!1212325))

(declare-fun m!1212327 () Bool)

(assert (=> b!1323472 m!1212327))

(declare-fun m!1212329 () Bool)

(assert (=> b!1323472 m!1212329))

(assert (=> b!1323472 m!1212317))

(assert (=> b!1323472 m!1212323))

(declare-fun m!1212331 () Bool)

(assert (=> b!1323472 m!1212331))

(declare-fun m!1212333 () Bool)

(assert (=> b!1323472 m!1212333))

(declare-fun m!1212335 () Bool)

(assert (=> b!1323472 m!1212335))

(declare-fun m!1212337 () Bool)

(assert (=> b!1323472 m!1212337))

(assert (=> b!1323474 m!1212295))

(declare-fun m!1212339 () Bool)

(assert (=> b!1323475 m!1212339))

(assert (=> b!1323475 m!1212339))

(declare-fun m!1212341 () Bool)

(assert (=> b!1323475 m!1212341))

(check-sat (not b!1323466) tp_is_empty!36177 (not b!1323468) (not b_lambda!23683) (not b!1323475) b_and!48875 (not start!111700) (not mapNonEmpty!55913) (not b!1323471) (not b_next!30357) (not b!1323472))
(check-sat b_and!48875 (not b_next!30357))
