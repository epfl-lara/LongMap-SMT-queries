; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111410 () Bool)

(assert start!111410)

(declare-fun b_free!30067 () Bool)

(declare-fun b_next!30067 () Bool)

(assert (=> start!111410 (= b_free!30067 (not b_next!30067))))

(declare-fun tp!105677 () Bool)

(declare-fun b_and!48275 () Bool)

(assert (=> start!111410 (= tp!105677 b_and!48275)))

(declare-fun b!1318320 () Bool)

(declare-fun e!752309 () Bool)

(declare-fun e!752310 () Bool)

(declare-fun mapRes!55478 () Bool)

(assert (=> b!1318320 (= e!752309 (and e!752310 mapRes!55478))))

(declare-fun condMapEmpty!55478 () Bool)

(declare-datatypes ((V!52953 0))(
  ( (V!52954 (val!18018 Int)) )
))
(declare-datatypes ((ValueCell!17045 0))(
  ( (ValueCellFull!17045 (v!20647 V!52953)) (EmptyCell!17045) )
))
(declare-datatypes ((array!88641 0))(
  ( (array!88642 (arr!42795 (Array (_ BitVec 32) ValueCell!17045)) (size!43347 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88641)

(declare-fun mapDefault!55478 () ValueCell!17045)

(assert (=> b!1318320 (= condMapEmpty!55478 (= (arr!42795 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17045)) mapDefault!55478)))))

(declare-fun b!1318321 () Bool)

(declare-fun res!874954 () Bool)

(declare-fun e!752308 () Bool)

(assert (=> b!1318321 (=> (not res!874954) (not e!752308))))

(declare-datatypes ((array!88643 0))(
  ( (array!88644 (arr!42796 (Array (_ BitVec 32) (_ BitVec 64))) (size!43348 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88643)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318321 (= res!874954 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43348 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318322 () Bool)

(declare-fun res!874952 () Bool)

(assert (=> b!1318322 (=> (not res!874952) (not e!752308))))

(assert (=> b!1318322 (= res!874952 (not (= (select (arr!42796 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1318323 () Bool)

(declare-fun res!874956 () Bool)

(assert (=> b!1318323 (=> (not res!874956) (not e!752308))))

(declare-fun zeroValue!1279 () V!52953)

(declare-fun minValue!1279 () V!52953)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23270 0))(
  ( (tuple2!23271 (_1!11646 (_ BitVec 64)) (_2!11646 V!52953)) )
))
(declare-datatypes ((List!30410 0))(
  ( (Nil!30407) (Cons!30406 (h!31615 tuple2!23270) (t!44018 List!30410)) )
))
(declare-datatypes ((ListLongMap!20927 0))(
  ( (ListLongMap!20928 (toList!10479 List!30410)) )
))
(declare-fun contains!8562 (ListLongMap!20927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5374 (array!88643 array!88641 (_ BitVec 32) (_ BitVec 32) V!52953 V!52953 (_ BitVec 32) Int) ListLongMap!20927)

(assert (=> b!1318323 (= res!874956 (contains!8562 (getCurrentListMap!5374 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1318324 () Bool)

(declare-fun tp_is_empty!35887 () Bool)

(assert (=> b!1318324 (= e!752310 tp_is_empty!35887)))

(declare-fun b!1318325 () Bool)

(assert (=> b!1318325 (= e!752308 false)))

(declare-fun lt!586281 () Bool)

(declare-fun +!4531 (ListLongMap!20927 tuple2!23270) ListLongMap!20927)

(declare-fun getCurrentListMapNoExtraKeys!6164 (array!88643 array!88641 (_ BitVec 32) (_ BitVec 32) V!52953 V!52953 (_ BitVec 32) Int) ListLongMap!20927)

(declare-fun get!21512 (ValueCell!17045 V!52953) V!52953)

(declare-fun dynLambda!3461 (Int (_ BitVec 64)) V!52953)

(assert (=> b!1318325 (= lt!586281 (contains!8562 (+!4531 (+!4531 (+!4531 (getCurrentListMapNoExtraKeys!6164 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23271 (select (arr!42796 _keys!1609) from!2000) (get!21512 (select (arr!42795 _values!1337) from!2000) (dynLambda!3461 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23271 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23271 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164))))

(declare-fun b!1318326 () Bool)

(declare-fun res!874958 () Bool)

(assert (=> b!1318326 (=> (not res!874958) (not e!752308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318326 (= res!874958 (validKeyInArray!0 (select (arr!42796 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55478 () Bool)

(declare-fun tp!105678 () Bool)

(declare-fun e!752311 () Bool)

(assert (=> mapNonEmpty!55478 (= mapRes!55478 (and tp!105678 e!752311))))

(declare-fun mapRest!55478 () (Array (_ BitVec 32) ValueCell!17045))

(declare-fun mapKey!55478 () (_ BitVec 32))

(declare-fun mapValue!55478 () ValueCell!17045)

(assert (=> mapNonEmpty!55478 (= (arr!42795 _values!1337) (store mapRest!55478 mapKey!55478 mapValue!55478))))

(declare-fun b!1318327 () Bool)

(declare-fun res!874955 () Bool)

(assert (=> b!1318327 (=> (not res!874955) (not e!752308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88643 (_ BitVec 32)) Bool)

(assert (=> b!1318327 (= res!874955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55478 () Bool)

(assert (=> mapIsEmpty!55478 mapRes!55478))

(declare-fun b!1318328 () Bool)

(assert (=> b!1318328 (= e!752311 tp_is_empty!35887)))

(declare-fun res!874957 () Bool)

(assert (=> start!111410 (=> (not res!874957) (not e!752308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111410 (= res!874957 (validMask!0 mask!2019))))

(assert (=> start!111410 e!752308))

(declare-fun array_inv!32501 (array!88643) Bool)

(assert (=> start!111410 (array_inv!32501 _keys!1609)))

(assert (=> start!111410 true))

(assert (=> start!111410 tp_is_empty!35887))

(declare-fun array_inv!32502 (array!88641) Bool)

(assert (=> start!111410 (and (array_inv!32502 _values!1337) e!752309)))

(assert (=> start!111410 tp!105677))

(declare-fun b!1318329 () Bool)

(declare-fun res!874959 () Bool)

(assert (=> b!1318329 (=> (not res!874959) (not e!752308))))

(declare-datatypes ((List!30411 0))(
  ( (Nil!30408) (Cons!30407 (h!31616 (_ BitVec 64)) (t!44019 List!30411)) )
))
(declare-fun arrayNoDuplicates!0 (array!88643 (_ BitVec 32) List!30411) Bool)

(assert (=> b!1318329 (= res!874959 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30408))))

(declare-fun b!1318330 () Bool)

(declare-fun res!874953 () Bool)

(assert (=> b!1318330 (=> (not res!874953) (not e!752308))))

(assert (=> b!1318330 (= res!874953 (and (= (size!43347 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43348 _keys!1609) (size!43347 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111410 res!874957) b!1318330))

(assert (= (and b!1318330 res!874953) b!1318327))

(assert (= (and b!1318327 res!874955) b!1318329))

(assert (= (and b!1318329 res!874959) b!1318321))

(assert (= (and b!1318321 res!874954) b!1318323))

(assert (= (and b!1318323 res!874956) b!1318322))

(assert (= (and b!1318322 res!874952) b!1318326))

(assert (= (and b!1318326 res!874958) b!1318325))

(assert (= (and b!1318320 condMapEmpty!55478) mapIsEmpty!55478))

(assert (= (and b!1318320 (not condMapEmpty!55478)) mapNonEmpty!55478))

(get-info :version)

(assert (= (and mapNonEmpty!55478 ((_ is ValueCellFull!17045) mapValue!55478)) b!1318328))

(assert (= (and b!1318320 ((_ is ValueCellFull!17045) mapDefault!55478)) b!1318324))

(assert (= start!111410 b!1318320))

(declare-fun b_lambda!23383 () Bool)

(assert (=> (not b_lambda!23383) (not b!1318325)))

(declare-fun t!44017 () Bool)

(declare-fun tb!11411 () Bool)

(assert (=> (and start!111410 (= defaultEntry!1340 defaultEntry!1340) t!44017) tb!11411))

(declare-fun result!23885 () Bool)

(assert (=> tb!11411 (= result!23885 tp_is_empty!35887)))

(assert (=> b!1318325 t!44017))

(declare-fun b_and!48277 () Bool)

(assert (= b_and!48275 (and (=> t!44017 result!23885) b_and!48277)))

(declare-fun m!1205439 () Bool)

(assert (=> b!1318326 m!1205439))

(assert (=> b!1318326 m!1205439))

(declare-fun m!1205441 () Bool)

(assert (=> b!1318326 m!1205441))

(declare-fun m!1205443 () Bool)

(assert (=> b!1318329 m!1205443))

(declare-fun m!1205445 () Bool)

(assert (=> b!1318323 m!1205445))

(assert (=> b!1318323 m!1205445))

(declare-fun m!1205447 () Bool)

(assert (=> b!1318323 m!1205447))

(assert (=> b!1318322 m!1205439))

(declare-fun m!1205449 () Bool)

(assert (=> mapNonEmpty!55478 m!1205449))

(declare-fun m!1205451 () Bool)

(assert (=> b!1318327 m!1205451))

(declare-fun m!1205453 () Bool)

(assert (=> start!111410 m!1205453))

(declare-fun m!1205455 () Bool)

(assert (=> start!111410 m!1205455))

(declare-fun m!1205457 () Bool)

(assert (=> start!111410 m!1205457))

(declare-fun m!1205459 () Bool)

(assert (=> b!1318325 m!1205459))

(declare-fun m!1205461 () Bool)

(assert (=> b!1318325 m!1205461))

(assert (=> b!1318325 m!1205459))

(declare-fun m!1205463 () Bool)

(assert (=> b!1318325 m!1205463))

(declare-fun m!1205465 () Bool)

(assert (=> b!1318325 m!1205465))

(declare-fun m!1205467 () Bool)

(assert (=> b!1318325 m!1205467))

(declare-fun m!1205469 () Bool)

(assert (=> b!1318325 m!1205469))

(assert (=> b!1318325 m!1205463))

(declare-fun m!1205471 () Bool)

(assert (=> b!1318325 m!1205471))

(assert (=> b!1318325 m!1205439))

(assert (=> b!1318325 m!1205471))

(assert (=> b!1318325 m!1205465))

(assert (=> b!1318325 m!1205469))

(assert (=> b!1318325 m!1205461))

(declare-fun m!1205473 () Bool)

(assert (=> b!1318325 m!1205473))

(check-sat (not start!111410) (not b_next!30067) (not b_lambda!23383) b_and!48277 (not b!1318327) (not b!1318323) (not mapNonEmpty!55478) (not b!1318325) (not b!1318326) (not b!1318329) tp_is_empty!35887)
(check-sat b_and!48277 (not b_next!30067))
