; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111778 () Bool)

(assert start!111778)

(declare-fun b_free!30211 () Bool)

(declare-fun b_next!30211 () Bool)

(assert (=> start!111778 (= b_free!30211 (not b_next!30211))))

(declare-fun tp!106108 () Bool)

(declare-fun b_and!48583 () Bool)

(assert (=> start!111778 (= tp!106108 b_and!48583)))

(declare-fun b!1322209 () Bool)

(declare-fun e!754264 () Bool)

(assert (=> b!1322209 (= e!754264 (not true))))

(declare-datatypes ((V!53145 0))(
  ( (V!53146 (val!18090 Int)) )
))
(declare-datatypes ((tuple2!23334 0))(
  ( (tuple2!23335 (_1!11678 (_ BitVec 64)) (_2!11678 V!53145)) )
))
(declare-datatypes ((List!30489 0))(
  ( (Nil!30486) (Cons!30485 (h!31703 tuple2!23334) (t!44241 List!30489)) )
))
(declare-datatypes ((ListLongMap!20999 0))(
  ( (ListLongMap!21000 (toList!10515 List!30489)) )
))
(declare-fun lt!587625 () ListLongMap!20999)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8682 (ListLongMap!20999 (_ BitVec 64)) Bool)

(assert (=> b!1322209 (contains!8682 lt!587625 k0!1164)))

(declare-datatypes ((array!89069 0))(
  ( (array!89070 (arr!43004 (Array (_ BitVec 32) (_ BitVec 64))) (size!43555 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89069)

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((Unit!43479 0))(
  ( (Unit!43480) )
))
(declare-fun lt!587624 () Unit!43479)

(declare-fun lt!587622 () V!53145)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!151 ((_ BitVec 64) (_ BitVec 64) V!53145 ListLongMap!20999) Unit!43479)

(assert (=> b!1322209 (= lt!587624 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 (select (arr!43004 _keys!1609) from!2000) lt!587622 lt!587625))))

(declare-fun lt!587621 () ListLongMap!20999)

(assert (=> b!1322209 (contains!8682 lt!587621 k0!1164)))

(declare-fun lt!587626 () Unit!43479)

(declare-fun zeroValue!1279 () V!53145)

(assert (=> b!1322209 (= lt!587626 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587621))))

(declare-fun lt!587627 () ListLongMap!20999)

(assert (=> b!1322209 (contains!8682 lt!587627 k0!1164)))

(declare-fun lt!587623 () Unit!43479)

(declare-fun minValue!1279 () V!53145)

(assert (=> b!1322209 (= lt!587623 (lemmaInListMapAfterAddingDiffThenInBefore!151 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587627))))

(declare-fun +!4596 (ListLongMap!20999 tuple2!23334) ListLongMap!20999)

(assert (=> b!1322209 (= lt!587627 (+!4596 lt!587621 (tuple2!23335 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322209 (= lt!587621 (+!4596 lt!587625 (tuple2!23335 (select (arr!43004 _keys!1609) from!2000) lt!587622)))))

(declare-datatypes ((ValueCell!17117 0))(
  ( (ValueCellFull!17117 (v!20715 V!53145)) (EmptyCell!17117) )
))
(declare-datatypes ((array!89071 0))(
  ( (array!89072 (arr!43005 (Array (_ BitVec 32) ValueCell!17117)) (size!43556 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89071)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21661 (ValueCell!17117 V!53145) V!53145)

(declare-fun dynLambda!3550 (Int (_ BitVec 64)) V!53145)

(assert (=> b!1322209 (= lt!587622 (get!21661 (select (arr!43005 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6235 (array!89069 array!89071 (_ BitVec 32) (_ BitVec 32) V!53145 V!53145 (_ BitVec 32) Int) ListLongMap!20999)

(assert (=> b!1322209 (= lt!587625 (getCurrentListMapNoExtraKeys!6235 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322210 () Bool)

(declare-fun e!754265 () Bool)

(declare-fun tp_is_empty!36031 () Bool)

(assert (=> b!1322210 (= e!754265 tp_is_empty!36031)))

(declare-fun b!1322211 () Bool)

(declare-fun res!877229 () Bool)

(assert (=> b!1322211 (=> (not res!877229) (not e!754264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89069 (_ BitVec 32)) Bool)

(assert (=> b!1322211 (= res!877229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55694 () Bool)

(declare-fun mapRes!55694 () Bool)

(declare-fun tp!106109 () Bool)

(assert (=> mapNonEmpty!55694 (= mapRes!55694 (and tp!106109 e!754265))))

(declare-fun mapKey!55694 () (_ BitVec 32))

(declare-fun mapRest!55694 () (Array (_ BitVec 32) ValueCell!17117))

(declare-fun mapValue!55694 () ValueCell!17117)

(assert (=> mapNonEmpty!55694 (= (arr!43005 _values!1337) (store mapRest!55694 mapKey!55694 mapValue!55694))))

(declare-fun b!1322212 () Bool)

(declare-fun res!877231 () Bool)

(assert (=> b!1322212 (=> (not res!877231) (not e!754264))))

(assert (=> b!1322212 (= res!877231 (and (= (size!43556 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43555 _keys!1609) (size!43556 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322213 () Bool)

(declare-fun e!754263 () Bool)

(assert (=> b!1322213 (= e!754263 tp_is_empty!36031)))

(declare-fun res!877227 () Bool)

(assert (=> start!111778 (=> (not res!877227) (not e!754264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111778 (= res!877227 (validMask!0 mask!2019))))

(assert (=> start!111778 e!754264))

(declare-fun array_inv!32743 (array!89069) Bool)

(assert (=> start!111778 (array_inv!32743 _keys!1609)))

(assert (=> start!111778 true))

(assert (=> start!111778 tp_is_empty!36031))

(declare-fun e!754266 () Bool)

(declare-fun array_inv!32744 (array!89071) Bool)

(assert (=> start!111778 (and (array_inv!32744 _values!1337) e!754266)))

(assert (=> start!111778 tp!106108))

(declare-fun b!1322214 () Bool)

(assert (=> b!1322214 (= e!754266 (and e!754263 mapRes!55694))))

(declare-fun condMapEmpty!55694 () Bool)

(declare-fun mapDefault!55694 () ValueCell!17117)

(assert (=> b!1322214 (= condMapEmpty!55694 (= (arr!43005 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17117)) mapDefault!55694)))))

(declare-fun b!1322215 () Bool)

(declare-fun res!877232 () Bool)

(assert (=> b!1322215 (=> (not res!877232) (not e!754264))))

(declare-datatypes ((List!30490 0))(
  ( (Nil!30487) (Cons!30486 (h!31704 (_ BitVec 64)) (t!44242 List!30490)) )
))
(declare-fun arrayNoDuplicates!0 (array!89069 (_ BitVec 32) List!30490) Bool)

(assert (=> b!1322215 (= res!877232 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30487))))

(declare-fun b!1322216 () Bool)

(declare-fun res!877233 () Bool)

(assert (=> b!1322216 (=> (not res!877233) (not e!754264))))

(declare-fun getCurrentListMap!5511 (array!89069 array!89071 (_ BitVec 32) (_ BitVec 32) V!53145 V!53145 (_ BitVec 32) Int) ListLongMap!20999)

(assert (=> b!1322216 (= res!877233 (contains!8682 (getCurrentListMap!5511 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322217 () Bool)

(declare-fun res!877228 () Bool)

(assert (=> b!1322217 (=> (not res!877228) (not e!754264))))

(assert (=> b!1322217 (= res!877228 (not (= (select (arr!43004 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55694 () Bool)

(assert (=> mapIsEmpty!55694 mapRes!55694))

(declare-fun b!1322218 () Bool)

(declare-fun res!877230 () Bool)

(assert (=> b!1322218 (=> (not res!877230) (not e!754264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322218 (= res!877230 (validKeyInArray!0 (select (arr!43004 _keys!1609) from!2000)))))

(declare-fun b!1322219 () Bool)

(declare-fun res!877234 () Bool)

(assert (=> b!1322219 (=> (not res!877234) (not e!754264))))

(assert (=> b!1322219 (= res!877234 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43555 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111778 res!877227) b!1322212))

(assert (= (and b!1322212 res!877231) b!1322211))

(assert (= (and b!1322211 res!877229) b!1322215))

(assert (= (and b!1322215 res!877232) b!1322219))

(assert (= (and b!1322219 res!877234) b!1322216))

(assert (= (and b!1322216 res!877233) b!1322217))

(assert (= (and b!1322217 res!877228) b!1322218))

(assert (= (and b!1322218 res!877230) b!1322209))

(assert (= (and b!1322214 condMapEmpty!55694) mapIsEmpty!55694))

(assert (= (and b!1322214 (not condMapEmpty!55694)) mapNonEmpty!55694))

(get-info :version)

(assert (= (and mapNonEmpty!55694 ((_ is ValueCellFull!17117) mapValue!55694)) b!1322210))

(assert (= (and b!1322214 ((_ is ValueCellFull!17117) mapDefault!55694)) b!1322213))

(assert (= start!111778 b!1322214))

(declare-fun b_lambda!23531 () Bool)

(assert (=> (not b_lambda!23531) (not b!1322209)))

(declare-fun t!44240 () Bool)

(declare-fun tb!11555 () Bool)

(assert (=> (and start!111778 (= defaultEntry!1340 defaultEntry!1340) t!44240) tb!11555))

(declare-fun result!24173 () Bool)

(assert (=> tb!11555 (= result!24173 tp_is_empty!36031)))

(assert (=> b!1322209 t!44240))

(declare-fun b_and!48585 () Bool)

(assert (= b_and!48583 (and (=> t!44240 result!24173) b_and!48585)))

(declare-fun m!1210301 () Bool)

(assert (=> b!1322217 m!1210301))

(declare-fun m!1210303 () Bool)

(assert (=> mapNonEmpty!55694 m!1210303))

(declare-fun m!1210305 () Bool)

(assert (=> b!1322209 m!1210305))

(assert (=> b!1322209 m!1210301))

(declare-fun m!1210307 () Bool)

(assert (=> b!1322209 m!1210307))

(declare-fun m!1210309 () Bool)

(assert (=> b!1322209 m!1210309))

(declare-fun m!1210311 () Bool)

(assert (=> b!1322209 m!1210311))

(declare-fun m!1210313 () Bool)

(assert (=> b!1322209 m!1210313))

(declare-fun m!1210315 () Bool)

(assert (=> b!1322209 m!1210315))

(declare-fun m!1210317 () Bool)

(assert (=> b!1322209 m!1210317))

(assert (=> b!1322209 m!1210301))

(declare-fun m!1210319 () Bool)

(assert (=> b!1322209 m!1210319))

(declare-fun m!1210321 () Bool)

(assert (=> b!1322209 m!1210321))

(assert (=> b!1322209 m!1210313))

(assert (=> b!1322209 m!1210311))

(declare-fun m!1210323 () Bool)

(assert (=> b!1322209 m!1210323))

(declare-fun m!1210325 () Bool)

(assert (=> b!1322209 m!1210325))

(declare-fun m!1210327 () Bool)

(assert (=> b!1322209 m!1210327))

(declare-fun m!1210329 () Bool)

(assert (=> b!1322211 m!1210329))

(declare-fun m!1210331 () Bool)

(assert (=> start!111778 m!1210331))

(declare-fun m!1210333 () Bool)

(assert (=> start!111778 m!1210333))

(declare-fun m!1210335 () Bool)

(assert (=> start!111778 m!1210335))

(declare-fun m!1210337 () Bool)

(assert (=> b!1322216 m!1210337))

(assert (=> b!1322216 m!1210337))

(declare-fun m!1210339 () Bool)

(assert (=> b!1322216 m!1210339))

(declare-fun m!1210341 () Bool)

(assert (=> b!1322215 m!1210341))

(assert (=> b!1322218 m!1210301))

(assert (=> b!1322218 m!1210301))

(declare-fun m!1210343 () Bool)

(assert (=> b!1322218 m!1210343))

(check-sat (not b!1322218) (not b_lambda!23531) (not start!111778) tp_is_empty!36031 b_and!48585 (not mapNonEmpty!55694) (not b!1322211) (not b!1322216) (not b_next!30211) (not b!1322215) (not b!1322209))
(check-sat b_and!48585 (not b_next!30211))
