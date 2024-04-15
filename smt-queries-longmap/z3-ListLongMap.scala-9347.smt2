; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111518 () Bool)

(assert start!111518)

(declare-fun b_free!30175 () Bool)

(declare-fun b_next!30175 () Bool)

(assert (=> start!111518 (= b_free!30175 (not b_next!30175))))

(declare-fun tp!106001 () Bool)

(declare-fun b_and!48491 () Bool)

(assert (=> start!111518 (= tp!106001 b_and!48491)))

(declare-fun b!1320210 () Bool)

(declare-fun res!876249 () Bool)

(declare-fun e!753117 () Bool)

(assert (=> b!1320210 (=> (not res!876249) (not e!753117))))

(declare-datatypes ((array!88849 0))(
  ( (array!88850 (arr!42899 (Array (_ BitVec 32) (_ BitVec 64))) (size!43451 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88849)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1320210 (= res!876249 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43451 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320211 () Bool)

(declare-fun res!876252 () Bool)

(assert (=> b!1320211 (=> (not res!876252) (not e!753117))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88849 (_ BitVec 32)) Bool)

(assert (=> b!1320211 (= res!876252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320212 () Bool)

(declare-fun e!753121 () Bool)

(declare-fun e!753119 () Bool)

(declare-fun mapRes!55640 () Bool)

(assert (=> b!1320212 (= e!753121 (and e!753119 mapRes!55640))))

(declare-fun condMapEmpty!55640 () Bool)

(declare-datatypes ((V!53097 0))(
  ( (V!53098 (val!18072 Int)) )
))
(declare-datatypes ((ValueCell!17099 0))(
  ( (ValueCellFull!17099 (v!20701 V!53097)) (EmptyCell!17099) )
))
(declare-datatypes ((array!88851 0))(
  ( (array!88852 (arr!42900 (Array (_ BitVec 32) ValueCell!17099)) (size!43452 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88851)

(declare-fun mapDefault!55640 () ValueCell!17099)

(assert (=> b!1320212 (= condMapEmpty!55640 (= (arr!42900 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17099)) mapDefault!55640)))))

(declare-fun mapIsEmpty!55640 () Bool)

(assert (=> mapIsEmpty!55640 mapRes!55640))

(declare-fun b!1320214 () Bool)

(declare-fun e!753118 () Bool)

(declare-fun tp_is_empty!35995 () Bool)

(assert (=> b!1320214 (= e!753118 tp_is_empty!35995)))

(declare-fun b!1320215 () Bool)

(declare-fun res!876250 () Bool)

(assert (=> b!1320215 (=> (not res!876250) (not e!753117))))

(declare-datatypes ((List!30486 0))(
  ( (Nil!30483) (Cons!30482 (h!31691 (_ BitVec 64)) (t!44202 List!30486)) )
))
(declare-fun arrayNoDuplicates!0 (array!88849 (_ BitVec 32) List!30486) Bool)

(assert (=> b!1320215 (= res!876250 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30483))))

(declare-fun b!1320216 () Bool)

(declare-fun res!876254 () Bool)

(assert (=> b!1320216 (=> (not res!876254) (not e!753117))))

(assert (=> b!1320216 (= res!876254 (and (= (size!43452 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43451 _keys!1609) (size!43452 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320217 () Bool)

(declare-fun res!876253 () Bool)

(assert (=> b!1320217 (=> (not res!876253) (not e!753117))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320217 (= res!876253 (validKeyInArray!0 (select (arr!42899 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55640 () Bool)

(declare-fun tp!106002 () Bool)

(assert (=> mapNonEmpty!55640 (= mapRes!55640 (and tp!106002 e!753118))))

(declare-fun mapKey!55640 () (_ BitVec 32))

(declare-fun mapValue!55640 () ValueCell!17099)

(declare-fun mapRest!55640 () (Array (_ BitVec 32) ValueCell!17099))

(assert (=> mapNonEmpty!55640 (= (arr!42900 _values!1337) (store mapRest!55640 mapKey!55640 mapValue!55640))))

(declare-fun b!1320218 () Bool)

(assert (=> b!1320218 (= e!753119 tp_is_empty!35995)))

(declare-fun b!1320219 () Bool)

(assert (=> b!1320219 (= e!753117 (not true))))

(declare-datatypes ((tuple2!23350 0))(
  ( (tuple2!23351 (_1!11686 (_ BitVec 64)) (_2!11686 V!53097)) )
))
(declare-datatypes ((List!30487 0))(
  ( (Nil!30484) (Cons!30483 (h!31692 tuple2!23350) (t!44203 List!30487)) )
))
(declare-datatypes ((ListLongMap!21007 0))(
  ( (ListLongMap!21008 (toList!10519 List!30487)) )
))
(declare-fun lt!586712 () ListLongMap!21007)

(declare-fun contains!8602 (ListLongMap!21007 (_ BitVec 64)) Bool)

(assert (=> b!1320219 (contains!8602 lt!586712 k0!1164)))

(declare-fun zeroValue!1279 () V!53097)

(declare-datatypes ((Unit!43311 0))(
  ( (Unit!43312) )
))
(declare-fun lt!586711 () Unit!43311)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!129 ((_ BitVec 64) (_ BitVec 64) V!53097 ListLongMap!21007) Unit!43311)

(assert (=> b!1320219 (= lt!586711 (lemmaInListMapAfterAddingDiffThenInBefore!129 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586712))))

(declare-fun lt!586713 () ListLongMap!21007)

(assert (=> b!1320219 (contains!8602 lt!586713 k0!1164)))

(declare-fun lt!586710 () Unit!43311)

(declare-fun minValue!1279 () V!53097)

(assert (=> b!1320219 (= lt!586710 (lemmaInListMapAfterAddingDiffThenInBefore!129 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586713))))

(declare-fun +!4564 (ListLongMap!21007 tuple2!23350) ListLongMap!21007)

(assert (=> b!1320219 (= lt!586713 (+!4564 lt!586712 (tuple2!23351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6197 (array!88849 array!88851 (_ BitVec 32) (_ BitVec 32) V!53097 V!53097 (_ BitVec 32) Int) ListLongMap!21007)

(declare-fun get!21581 (ValueCell!17099 V!53097) V!53097)

(declare-fun dynLambda!3494 (Int (_ BitVec 64)) V!53097)

(assert (=> b!1320219 (= lt!586712 (+!4564 (getCurrentListMapNoExtraKeys!6197 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23351 (select (arr!42899 _keys!1609) from!2000) (get!21581 (select (arr!42900 _values!1337) from!2000) (dynLambda!3494 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320220 () Bool)

(declare-fun res!876251 () Bool)

(assert (=> b!1320220 (=> (not res!876251) (not e!753117))))

(declare-fun getCurrentListMap!5409 (array!88849 array!88851 (_ BitVec 32) (_ BitVec 32) V!53097 V!53097 (_ BitVec 32) Int) ListLongMap!21007)

(assert (=> b!1320220 (= res!876251 (contains!8602 (getCurrentListMap!5409 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320213 () Bool)

(declare-fun res!876255 () Bool)

(assert (=> b!1320213 (=> (not res!876255) (not e!753117))))

(assert (=> b!1320213 (= res!876255 (not (= (select (arr!42899 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!876248 () Bool)

(assert (=> start!111518 (=> (not res!876248) (not e!753117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111518 (= res!876248 (validMask!0 mask!2019))))

(assert (=> start!111518 e!753117))

(declare-fun array_inv!32575 (array!88849) Bool)

(assert (=> start!111518 (array_inv!32575 _keys!1609)))

(assert (=> start!111518 true))

(assert (=> start!111518 tp_is_empty!35995))

(declare-fun array_inv!32576 (array!88851) Bool)

(assert (=> start!111518 (and (array_inv!32576 _values!1337) e!753121)))

(assert (=> start!111518 tp!106001))

(assert (= (and start!111518 res!876248) b!1320216))

(assert (= (and b!1320216 res!876254) b!1320211))

(assert (= (and b!1320211 res!876252) b!1320215))

(assert (= (and b!1320215 res!876250) b!1320210))

(assert (= (and b!1320210 res!876249) b!1320220))

(assert (= (and b!1320220 res!876251) b!1320213))

(assert (= (and b!1320213 res!876255) b!1320217))

(assert (= (and b!1320217 res!876253) b!1320219))

(assert (= (and b!1320212 condMapEmpty!55640) mapIsEmpty!55640))

(assert (= (and b!1320212 (not condMapEmpty!55640)) mapNonEmpty!55640))

(get-info :version)

(assert (= (and mapNonEmpty!55640 ((_ is ValueCellFull!17099) mapValue!55640)) b!1320214))

(assert (= (and b!1320212 ((_ is ValueCellFull!17099) mapDefault!55640)) b!1320218))

(assert (= start!111518 b!1320212))

(declare-fun b_lambda!23491 () Bool)

(assert (=> (not b_lambda!23491) (not b!1320219)))

(declare-fun t!44201 () Bool)

(declare-fun tb!11519 () Bool)

(assert (=> (and start!111518 (= defaultEntry!1340 defaultEntry!1340) t!44201) tb!11519))

(declare-fun result!24101 () Bool)

(assert (=> tb!11519 (= result!24101 tp_is_empty!35995)))

(assert (=> b!1320219 t!44201))

(declare-fun b_and!48493 () Bool)

(assert (= b_and!48491 (and (=> t!44201 result!24101) b_and!48493)))

(declare-fun m!1207455 () Bool)

(assert (=> b!1320220 m!1207455))

(assert (=> b!1320220 m!1207455))

(declare-fun m!1207457 () Bool)

(assert (=> b!1320220 m!1207457))

(declare-fun m!1207459 () Bool)

(assert (=> b!1320213 m!1207459))

(declare-fun m!1207461 () Bool)

(assert (=> b!1320211 m!1207461))

(declare-fun m!1207463 () Bool)

(assert (=> b!1320215 m!1207463))

(assert (=> b!1320217 m!1207459))

(assert (=> b!1320217 m!1207459))

(declare-fun m!1207465 () Bool)

(assert (=> b!1320217 m!1207465))

(declare-fun m!1207467 () Bool)

(assert (=> start!111518 m!1207467))

(declare-fun m!1207469 () Bool)

(assert (=> start!111518 m!1207469))

(declare-fun m!1207471 () Bool)

(assert (=> start!111518 m!1207471))

(declare-fun m!1207473 () Bool)

(assert (=> mapNonEmpty!55640 m!1207473))

(declare-fun m!1207475 () Bool)

(assert (=> b!1320219 m!1207475))

(declare-fun m!1207477 () Bool)

(assert (=> b!1320219 m!1207477))

(declare-fun m!1207479 () Bool)

(assert (=> b!1320219 m!1207479))

(declare-fun m!1207481 () Bool)

(assert (=> b!1320219 m!1207481))

(assert (=> b!1320219 m!1207479))

(declare-fun m!1207483 () Bool)

(assert (=> b!1320219 m!1207483))

(declare-fun m!1207485 () Bool)

(assert (=> b!1320219 m!1207485))

(assert (=> b!1320219 m!1207459))

(assert (=> b!1320219 m!1207483))

(declare-fun m!1207487 () Bool)

(assert (=> b!1320219 m!1207487))

(declare-fun m!1207489 () Bool)

(assert (=> b!1320219 m!1207489))

(assert (=> b!1320219 m!1207475))

(declare-fun m!1207491 () Bool)

(assert (=> b!1320219 m!1207491))

(declare-fun m!1207493 () Bool)

(assert (=> b!1320219 m!1207493))

(check-sat tp_is_empty!35995 b_and!48493 (not b_lambda!23491) (not b_next!30175) (not b!1320215) (not b!1320211) (not b!1320217) (not start!111518) (not b!1320219) (not mapNonEmpty!55640) (not b!1320220))
(check-sat b_and!48493 (not b_next!30175))
