; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111574 () Bool)

(assert start!111574)

(declare-fun b_free!30231 () Bool)

(declare-fun b_next!30231 () Bool)

(assert (=> start!111574 (= b_free!30231 (not b_next!30231))))

(declare-fun tp!106168 () Bool)

(declare-fun b_and!48621 () Bool)

(assert (=> start!111574 (= tp!106168 b_and!48621)))

(declare-fun b!1321260 () Bool)

(declare-fun res!876954 () Bool)

(declare-fun e!753574 () Bool)

(assert (=> b!1321260 (=> (not res!876954) (not e!753574))))

(declare-datatypes ((array!89030 0))(
  ( (array!89031 (arr!42989 (Array (_ BitVec 32) (_ BitVec 64))) (size!43539 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89030)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89030 (_ BitVec 32)) Bool)

(assert (=> b!1321260 (= res!876954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321261 () Bool)

(declare-fun res!876956 () Bool)

(assert (=> b!1321261 (=> (not res!876956) (not e!753574))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53171 0))(
  ( (V!53172 (val!18100 Int)) )
))
(declare-datatypes ((ValueCell!17127 0))(
  ( (ValueCellFull!17127 (v!20730 V!53171)) (EmptyCell!17127) )
))
(declare-datatypes ((array!89032 0))(
  ( (array!89033 (arr!42990 (Array (_ BitVec 32) ValueCell!17127)) (size!43540 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89032)

(assert (=> b!1321261 (= res!876956 (and (= (size!43540 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43539 _keys!1609) (size!43540 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!876952 () Bool)

(assert (=> start!111574 (=> (not res!876952) (not e!753574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111574 (= res!876952 (validMask!0 mask!2019))))

(assert (=> start!111574 e!753574))

(declare-fun array_inv!32453 (array!89030) Bool)

(assert (=> start!111574 (array_inv!32453 _keys!1609)))

(assert (=> start!111574 true))

(declare-fun tp_is_empty!36051 () Bool)

(assert (=> start!111574 tp_is_empty!36051))

(declare-fun e!753571 () Bool)

(declare-fun array_inv!32454 (array!89032) Bool)

(assert (=> start!111574 (and (array_inv!32454 _values!1337) e!753571)))

(assert (=> start!111574 tp!106168))

(declare-fun b!1321262 () Bool)

(declare-fun res!876951 () Bool)

(assert (=> b!1321262 (=> (not res!876951) (not e!753574))))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1321262 (= res!876951 (not (= (select (arr!42989 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321263 () Bool)

(declare-fun e!753572 () Bool)

(declare-fun mapRes!55724 () Bool)

(assert (=> b!1321263 (= e!753571 (and e!753572 mapRes!55724))))

(declare-fun condMapEmpty!55724 () Bool)

(declare-fun mapDefault!55724 () ValueCell!17127)

(assert (=> b!1321263 (= condMapEmpty!55724 (= (arr!42990 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17127)) mapDefault!55724)))))

(declare-fun b!1321264 () Bool)

(assert (=> b!1321264 (= e!753572 tp_is_empty!36051)))

(declare-fun b!1321265 () Bool)

(declare-fun res!876955 () Bool)

(assert (=> b!1321265 (=> (not res!876955) (not e!753574))))

(declare-datatypes ((List!30460 0))(
  ( (Nil!30457) (Cons!30456 (h!31665 (_ BitVec 64)) (t!44240 List!30460)) )
))
(declare-fun arrayNoDuplicates!0 (array!89030 (_ BitVec 32) List!30460) Bool)

(assert (=> b!1321265 (= res!876955 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30457))))

(declare-fun mapIsEmpty!55724 () Bool)

(assert (=> mapIsEmpty!55724 mapRes!55724))

(declare-fun b!1321266 () Bool)

(declare-fun res!876949 () Bool)

(assert (=> b!1321266 (=> (not res!876949) (not e!753574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321266 (= res!876949 (validKeyInArray!0 (select (arr!42989 _keys!1609) from!2000)))))

(declare-fun b!1321267 () Bool)

(declare-fun res!876950 () Bool)

(assert (=> b!1321267 (=> (not res!876950) (not e!753574))))

(assert (=> b!1321267 (= res!876950 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43539 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321268 () Bool)

(declare-fun res!876953 () Bool)

(assert (=> b!1321268 (=> (not res!876953) (not e!753574))))

(declare-fun zeroValue!1279 () V!53171)

(declare-fun minValue!1279 () V!53171)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23312 0))(
  ( (tuple2!23313 (_1!11667 (_ BitVec 64)) (_2!11667 V!53171)) )
))
(declare-datatypes ((List!30461 0))(
  ( (Nil!30458) (Cons!30457 (h!31666 tuple2!23312) (t!44241 List!30461)) )
))
(declare-datatypes ((ListLongMap!20969 0))(
  ( (ListLongMap!20970 (toList!10500 List!30461)) )
))
(declare-fun contains!8655 (ListLongMap!20969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5502 (array!89030 array!89032 (_ BitVec 32) (_ BitVec 32) V!53171 V!53171 (_ BitVec 32) Int) ListLongMap!20969)

(assert (=> b!1321268 (= res!876953 (contains!8655 (getCurrentListMap!5502 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55724 () Bool)

(declare-fun tp!106169 () Bool)

(declare-fun e!753570 () Bool)

(assert (=> mapNonEmpty!55724 (= mapRes!55724 (and tp!106169 e!753570))))

(declare-fun mapKey!55724 () (_ BitVec 32))

(declare-fun mapRest!55724 () (Array (_ BitVec 32) ValueCell!17127))

(declare-fun mapValue!55724 () ValueCell!17127)

(assert (=> mapNonEmpty!55724 (= (arr!42990 _values!1337) (store mapRest!55724 mapKey!55724 mapValue!55724))))

(declare-fun b!1321269 () Bool)

(assert (=> b!1321269 (= e!753570 tp_is_empty!36051)))

(declare-fun b!1321270 () Bool)

(assert (=> b!1321270 (= e!753574 (not true))))

(declare-fun lt!587358 () ListLongMap!20969)

(assert (=> b!1321270 (contains!8655 lt!587358 k0!1164)))

(declare-datatypes ((Unit!43534 0))(
  ( (Unit!43535) )
))
(declare-fun lt!587357 () Unit!43534)

(declare-fun lt!587360 () V!53171)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!153 ((_ BitVec 64) (_ BitVec 64) V!53171 ListLongMap!20969) Unit!43534)

(assert (=> b!1321270 (= lt!587357 (lemmaInListMapAfterAddingDiffThenInBefore!153 k0!1164 (select (arr!42989 _keys!1609) from!2000) lt!587360 lt!587358))))

(declare-fun lt!587361 () ListLongMap!20969)

(assert (=> b!1321270 (contains!8655 lt!587361 k0!1164)))

(declare-fun lt!587355 () Unit!43534)

(assert (=> b!1321270 (= lt!587355 (lemmaInListMapAfterAddingDiffThenInBefore!153 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587361))))

(declare-fun lt!587356 () ListLongMap!20969)

(assert (=> b!1321270 (contains!8655 lt!587356 k0!1164)))

(declare-fun lt!587359 () Unit!43534)

(assert (=> b!1321270 (= lt!587359 (lemmaInListMapAfterAddingDiffThenInBefore!153 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587356))))

(declare-fun +!4557 (ListLongMap!20969 tuple2!23312) ListLongMap!20969)

(assert (=> b!1321270 (= lt!587356 (+!4557 lt!587361 (tuple2!23313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321270 (= lt!587361 (+!4557 lt!587358 (tuple2!23313 (select (arr!42989 _keys!1609) from!2000) lt!587360)))))

(declare-fun get!21625 (ValueCell!17127 V!53171) V!53171)

(declare-fun dynLambda!3496 (Int (_ BitVec 64)) V!53171)

(assert (=> b!1321270 (= lt!587360 (get!21625 (select (arr!42990 _values!1337) from!2000) (dynLambda!3496 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6192 (array!89030 array!89032 (_ BitVec 32) (_ BitVec 32) V!53171 V!53171 (_ BitVec 32) Int) ListLongMap!20969)

(assert (=> b!1321270 (= lt!587358 (getCurrentListMapNoExtraKeys!6192 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(assert (= (and start!111574 res!876952) b!1321261))

(assert (= (and b!1321261 res!876956) b!1321260))

(assert (= (and b!1321260 res!876954) b!1321265))

(assert (= (and b!1321265 res!876955) b!1321267))

(assert (= (and b!1321267 res!876950) b!1321268))

(assert (= (and b!1321268 res!876953) b!1321262))

(assert (= (and b!1321262 res!876951) b!1321266))

(assert (= (and b!1321266 res!876949) b!1321270))

(assert (= (and b!1321263 condMapEmpty!55724) mapIsEmpty!55724))

(assert (= (and b!1321263 (not condMapEmpty!55724)) mapNonEmpty!55724))

(get-info :version)

(assert (= (and mapNonEmpty!55724 ((_ is ValueCellFull!17127) mapValue!55724)) b!1321269))

(assert (= (and b!1321263 ((_ is ValueCellFull!17127) mapDefault!55724)) b!1321264))

(assert (= start!111574 b!1321263))

(declare-fun b_lambda!23557 () Bool)

(assert (=> (not b_lambda!23557) (not b!1321270)))

(declare-fun t!44239 () Bool)

(declare-fun tb!11583 () Bool)

(assert (=> (and start!111574 (= defaultEntry!1340 defaultEntry!1340) t!44239) tb!11583))

(declare-fun result!24221 () Bool)

(assert (=> tb!11583 (= result!24221 tp_is_empty!36051)))

(assert (=> b!1321270 t!44239))

(declare-fun b_and!48623 () Bool)

(assert (= b_and!48621 (and (=> t!44239 result!24221) b_and!48623)))

(declare-fun m!1209143 () Bool)

(assert (=> b!1321268 m!1209143))

(assert (=> b!1321268 m!1209143))

(declare-fun m!1209145 () Bool)

(assert (=> b!1321268 m!1209145))

(declare-fun m!1209147 () Bool)

(assert (=> b!1321262 m!1209147))

(declare-fun m!1209149 () Bool)

(assert (=> b!1321260 m!1209149))

(assert (=> b!1321266 m!1209147))

(assert (=> b!1321266 m!1209147))

(declare-fun m!1209151 () Bool)

(assert (=> b!1321266 m!1209151))

(declare-fun m!1209153 () Bool)

(assert (=> mapNonEmpty!55724 m!1209153))

(declare-fun m!1209155 () Bool)

(assert (=> start!111574 m!1209155))

(declare-fun m!1209157 () Bool)

(assert (=> start!111574 m!1209157))

(declare-fun m!1209159 () Bool)

(assert (=> start!111574 m!1209159))

(declare-fun m!1209161 () Bool)

(assert (=> b!1321270 m!1209161))

(declare-fun m!1209163 () Bool)

(assert (=> b!1321270 m!1209163))

(declare-fun m!1209165 () Bool)

(assert (=> b!1321270 m!1209165))

(declare-fun m!1209167 () Bool)

(assert (=> b!1321270 m!1209167))

(declare-fun m!1209169 () Bool)

(assert (=> b!1321270 m!1209169))

(assert (=> b!1321270 m!1209165))

(assert (=> b!1321270 m!1209163))

(declare-fun m!1209171 () Bool)

(assert (=> b!1321270 m!1209171))

(assert (=> b!1321270 m!1209147))

(declare-fun m!1209173 () Bool)

(assert (=> b!1321270 m!1209173))

(declare-fun m!1209175 () Bool)

(assert (=> b!1321270 m!1209175))

(declare-fun m!1209177 () Bool)

(assert (=> b!1321270 m!1209177))

(declare-fun m!1209179 () Bool)

(assert (=> b!1321270 m!1209179))

(assert (=> b!1321270 m!1209147))

(declare-fun m!1209181 () Bool)

(assert (=> b!1321270 m!1209181))

(declare-fun m!1209183 () Bool)

(assert (=> b!1321270 m!1209183))

(declare-fun m!1209185 () Bool)

(assert (=> b!1321265 m!1209185))

(check-sat (not start!111574) (not mapNonEmpty!55724) tp_is_empty!36051 (not b_next!30231) b_and!48623 (not b_lambda!23557) (not b!1321270) (not b!1321268) (not b!1321265) (not b!1321260) (not b!1321266))
(check-sat b_and!48623 (not b_next!30231))
