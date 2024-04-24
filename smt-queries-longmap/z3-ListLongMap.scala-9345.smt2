; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111730 () Bool)

(assert start!111730)

(declare-fun b_free!30163 () Bool)

(declare-fun b_next!30163 () Bool)

(assert (=> start!111730 (= b_free!30163 (not b_next!30163))))

(declare-fun tp!105965 () Bool)

(declare-fun b_and!48487 () Bool)

(assert (=> start!111730 (= tp!105965 b_and!48487)))

(declare-fun b!1321369 () Bool)

(declare-fun e!753905 () Bool)

(declare-fun tp_is_empty!35983 () Bool)

(assert (=> b!1321369 (= e!753905 tp_is_empty!35983)))

(declare-fun b!1321371 () Bool)

(declare-fun res!876654 () Bool)

(declare-fun e!753907 () Bool)

(assert (=> b!1321371 (=> (not res!876654) (not e!753907))))

(declare-datatypes ((array!88975 0))(
  ( (array!88976 (arr!42957 (Array (_ BitVec 32) (_ BitVec 64))) (size!43508 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88975)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53081 0))(
  ( (V!53082 (val!18066 Int)) )
))
(declare-datatypes ((ValueCell!17093 0))(
  ( (ValueCellFull!17093 (v!20691 V!53081)) (EmptyCell!17093) )
))
(declare-datatypes ((array!88977 0))(
  ( (array!88978 (arr!42958 (Array (_ BitVec 32) ValueCell!17093)) (size!43509 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88977)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1321371 (= res!876654 (and (= (size!43509 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43508 _keys!1609) (size!43509 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321372 () Bool)

(assert (=> b!1321372 (= e!753907 (not true))))

(declare-datatypes ((tuple2!23296 0))(
  ( (tuple2!23297 (_1!11659 (_ BitVec 64)) (_2!11659 V!53081)) )
))
(declare-datatypes ((List!30451 0))(
  ( (Nil!30448) (Cons!30447 (h!31665 tuple2!23296) (t!44155 List!30451)) )
))
(declare-datatypes ((ListLongMap!20961 0))(
  ( (ListLongMap!20962 (toList!10496 List!30451)) )
))
(declare-fun lt!587302 () ListLongMap!20961)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8663 (ListLongMap!20961 (_ BitVec 64)) Bool)

(assert (=> b!1321372 (contains!8663 lt!587302 k0!1164)))

(declare-datatypes ((Unit!43449 0))(
  ( (Unit!43450) )
))
(declare-fun lt!587303 () Unit!43449)

(declare-fun zeroValue!1279 () V!53081)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!136 ((_ BitVec 64) (_ BitVec 64) V!53081 ListLongMap!20961) Unit!43449)

(assert (=> b!1321372 (= lt!587303 (lemmaInListMapAfterAddingDiffThenInBefore!136 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587302))))

(declare-fun lt!587300 () ListLongMap!20961)

(assert (=> b!1321372 (contains!8663 lt!587300 k0!1164)))

(declare-fun minValue!1279 () V!53081)

(declare-fun lt!587301 () Unit!43449)

(assert (=> b!1321372 (= lt!587301 (lemmaInListMapAfterAddingDiffThenInBefore!136 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587300))))

(declare-fun +!4581 (ListLongMap!20961 tuple2!23296) ListLongMap!20961)

(assert (=> b!1321372 (= lt!587300 (+!4581 lt!587302 (tuple2!23297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6220 (array!88975 array!88977 (_ BitVec 32) (_ BitVec 32) V!53081 V!53081 (_ BitVec 32) Int) ListLongMap!20961)

(declare-fun get!21630 (ValueCell!17093 V!53081) V!53081)

(declare-fun dynLambda!3535 (Int (_ BitVec 64)) V!53081)

(assert (=> b!1321372 (= lt!587302 (+!4581 (getCurrentListMapNoExtraKeys!6220 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23297 (select (arr!42957 _keys!1609) from!2000) (get!21630 (select (arr!42958 _values!1337) from!2000) (dynLambda!3535 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!55622 () Bool)

(declare-fun mapRes!55622 () Bool)

(assert (=> mapIsEmpty!55622 mapRes!55622))

(declare-fun b!1321373 () Bool)

(declare-fun e!753903 () Bool)

(assert (=> b!1321373 (= e!753903 tp_is_empty!35983)))

(declare-fun b!1321374 () Bool)

(declare-fun e!753906 () Bool)

(assert (=> b!1321374 (= e!753906 (and e!753903 mapRes!55622))))

(declare-fun condMapEmpty!55622 () Bool)

(declare-fun mapDefault!55622 () ValueCell!17093)

(assert (=> b!1321374 (= condMapEmpty!55622 (= (arr!42958 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17093)) mapDefault!55622)))))

(declare-fun b!1321375 () Bool)

(declare-fun res!876658 () Bool)

(assert (=> b!1321375 (=> (not res!876658) (not e!753907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88975 (_ BitVec 32)) Bool)

(assert (=> b!1321375 (= res!876658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321376 () Bool)

(declare-fun res!876655 () Bool)

(assert (=> b!1321376 (=> (not res!876655) (not e!753907))))

(declare-fun getCurrentListMap!5492 (array!88975 array!88977 (_ BitVec 32) (_ BitVec 32) V!53081 V!53081 (_ BitVec 32) Int) ListLongMap!20961)

(assert (=> b!1321376 (= res!876655 (contains!8663 (getCurrentListMap!5492 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!876651 () Bool)

(assert (=> start!111730 (=> (not res!876651) (not e!753907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111730 (= res!876651 (validMask!0 mask!2019))))

(assert (=> start!111730 e!753907))

(declare-fun array_inv!32709 (array!88975) Bool)

(assert (=> start!111730 (array_inv!32709 _keys!1609)))

(assert (=> start!111730 true))

(assert (=> start!111730 tp_is_empty!35983))

(declare-fun array_inv!32710 (array!88977) Bool)

(assert (=> start!111730 (and (array_inv!32710 _values!1337) e!753906)))

(assert (=> start!111730 tp!105965))

(declare-fun b!1321370 () Bool)

(declare-fun res!876656 () Bool)

(assert (=> b!1321370 (=> (not res!876656) (not e!753907))))

(assert (=> b!1321370 (= res!876656 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43508 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55622 () Bool)

(declare-fun tp!105964 () Bool)

(assert (=> mapNonEmpty!55622 (= mapRes!55622 (and tp!105964 e!753905))))

(declare-fun mapValue!55622 () ValueCell!17093)

(declare-fun mapRest!55622 () (Array (_ BitVec 32) ValueCell!17093))

(declare-fun mapKey!55622 () (_ BitVec 32))

(assert (=> mapNonEmpty!55622 (= (arr!42958 _values!1337) (store mapRest!55622 mapKey!55622 mapValue!55622))))

(declare-fun b!1321377 () Bool)

(declare-fun res!876657 () Bool)

(assert (=> b!1321377 (=> (not res!876657) (not e!753907))))

(declare-datatypes ((List!30452 0))(
  ( (Nil!30449) (Cons!30448 (h!31666 (_ BitVec 64)) (t!44156 List!30452)) )
))
(declare-fun arrayNoDuplicates!0 (array!88975 (_ BitVec 32) List!30452) Bool)

(assert (=> b!1321377 (= res!876657 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30449))))

(declare-fun b!1321378 () Bool)

(declare-fun res!876652 () Bool)

(assert (=> b!1321378 (=> (not res!876652) (not e!753907))))

(assert (=> b!1321378 (= res!876652 (not (= (select (arr!42957 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321379 () Bool)

(declare-fun res!876653 () Bool)

(assert (=> b!1321379 (=> (not res!876653) (not e!753907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321379 (= res!876653 (validKeyInArray!0 (select (arr!42957 _keys!1609) from!2000)))))

(assert (= (and start!111730 res!876651) b!1321371))

(assert (= (and b!1321371 res!876654) b!1321375))

(assert (= (and b!1321375 res!876658) b!1321377))

(assert (= (and b!1321377 res!876657) b!1321370))

(assert (= (and b!1321370 res!876656) b!1321376))

(assert (= (and b!1321376 res!876655) b!1321378))

(assert (= (and b!1321378 res!876652) b!1321379))

(assert (= (and b!1321379 res!876653) b!1321372))

(assert (= (and b!1321374 condMapEmpty!55622) mapIsEmpty!55622))

(assert (= (and b!1321374 (not condMapEmpty!55622)) mapNonEmpty!55622))

(get-info :version)

(assert (= (and mapNonEmpty!55622 ((_ is ValueCellFull!17093) mapValue!55622)) b!1321369))

(assert (= (and b!1321374 ((_ is ValueCellFull!17093) mapDefault!55622)) b!1321373))

(assert (= start!111730 b!1321374))

(declare-fun b_lambda!23483 () Bool)

(assert (=> (not b_lambda!23483) (not b!1321372)))

(declare-fun t!44154 () Bool)

(declare-fun tb!11507 () Bool)

(assert (=> (and start!111730 (= defaultEntry!1340 defaultEntry!1340) t!44154) tb!11507))

(declare-fun result!24077 () Bool)

(assert (=> tb!11507 (= result!24077 tp_is_empty!35983)))

(assert (=> b!1321372 t!44154))

(declare-fun b_and!48489 () Bool)

(assert (= b_and!48487 (and (=> t!44154 result!24077) b_and!48489)))

(declare-fun m!1209329 () Bool)

(assert (=> b!1321377 m!1209329))

(declare-fun m!1209331 () Bool)

(assert (=> b!1321378 m!1209331))

(assert (=> b!1321379 m!1209331))

(assert (=> b!1321379 m!1209331))

(declare-fun m!1209333 () Bool)

(assert (=> b!1321379 m!1209333))

(declare-fun m!1209335 () Bool)

(assert (=> mapNonEmpty!55622 m!1209335))

(declare-fun m!1209337 () Bool)

(assert (=> b!1321375 m!1209337))

(declare-fun m!1209339 () Bool)

(assert (=> b!1321372 m!1209339))

(declare-fun m!1209341 () Bool)

(assert (=> b!1321372 m!1209341))

(assert (=> b!1321372 m!1209339))

(declare-fun m!1209343 () Bool)

(assert (=> b!1321372 m!1209343))

(declare-fun m!1209345 () Bool)

(assert (=> b!1321372 m!1209345))

(declare-fun m!1209347 () Bool)

(assert (=> b!1321372 m!1209347))

(declare-fun m!1209349 () Bool)

(assert (=> b!1321372 m!1209349))

(declare-fun m!1209351 () Bool)

(assert (=> b!1321372 m!1209351))

(assert (=> b!1321372 m!1209347))

(assert (=> b!1321372 m!1209341))

(declare-fun m!1209353 () Bool)

(assert (=> b!1321372 m!1209353))

(assert (=> b!1321372 m!1209331))

(declare-fun m!1209355 () Bool)

(assert (=> b!1321372 m!1209355))

(declare-fun m!1209357 () Bool)

(assert (=> b!1321372 m!1209357))

(declare-fun m!1209359 () Bool)

(assert (=> b!1321376 m!1209359))

(assert (=> b!1321376 m!1209359))

(declare-fun m!1209361 () Bool)

(assert (=> b!1321376 m!1209361))

(declare-fun m!1209363 () Bool)

(assert (=> start!111730 m!1209363))

(declare-fun m!1209365 () Bool)

(assert (=> start!111730 m!1209365))

(declare-fun m!1209367 () Bool)

(assert (=> start!111730 m!1209367))

(check-sat b_and!48489 tp_is_empty!35983 (not b!1321375) (not b!1321377) (not start!111730) (not mapNonEmpty!55622) (not b!1321379) (not b_next!30163) (not b!1321372) (not b!1321376) (not b_lambda!23483))
(check-sat b_and!48489 (not b_next!30163))
