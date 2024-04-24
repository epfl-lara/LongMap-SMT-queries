; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111724 () Bool)

(assert start!111724)

(declare-fun b_free!30157 () Bool)

(declare-fun b_next!30157 () Bool)

(assert (=> start!111724 (= b_free!30157 (not b_next!30157))))

(declare-fun tp!105947 () Bool)

(declare-fun b_and!48475 () Bool)

(assert (=> start!111724 (= tp!105947 b_and!48475)))

(declare-fun b!1321264 () Bool)

(declare-fun e!753861 () Bool)

(declare-fun tp_is_empty!35977 () Bool)

(assert (=> b!1321264 (= e!753861 tp_is_empty!35977)))

(declare-fun res!876583 () Bool)

(declare-fun e!753858 () Bool)

(assert (=> start!111724 (=> (not res!876583) (not e!753858))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111724 (= res!876583 (validMask!0 mask!2019))))

(assert (=> start!111724 e!753858))

(declare-datatypes ((array!88963 0))(
  ( (array!88964 (arr!42951 (Array (_ BitVec 32) (_ BitVec 64))) (size!43502 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88963)

(declare-fun array_inv!32703 (array!88963) Bool)

(assert (=> start!111724 (array_inv!32703 _keys!1609)))

(assert (=> start!111724 true))

(assert (=> start!111724 tp_is_empty!35977))

(declare-datatypes ((V!53073 0))(
  ( (V!53074 (val!18063 Int)) )
))
(declare-datatypes ((ValueCell!17090 0))(
  ( (ValueCellFull!17090 (v!20688 V!53073)) (EmptyCell!17090) )
))
(declare-datatypes ((array!88965 0))(
  ( (array!88966 (arr!42952 (Array (_ BitVec 32) ValueCell!17090)) (size!43503 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88965)

(declare-fun e!753860 () Bool)

(declare-fun array_inv!32704 (array!88965) Bool)

(assert (=> start!111724 (and (array_inv!32704 _values!1337) e!753860)))

(assert (=> start!111724 tp!105947))

(declare-fun b!1321265 () Bool)

(assert (=> b!1321265 (= e!753858 (not true))))

(declare-datatypes ((tuple2!23290 0))(
  ( (tuple2!23291 (_1!11656 (_ BitVec 64)) (_2!11656 V!53073)) )
))
(declare-datatypes ((List!30445 0))(
  ( (Nil!30442) (Cons!30441 (h!31659 tuple2!23290) (t!44143 List!30445)) )
))
(declare-datatypes ((ListLongMap!20955 0))(
  ( (ListLongMap!20956 (toList!10493 List!30445)) )
))
(declare-fun lt!587264 () ListLongMap!20955)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8660 (ListLongMap!20955 (_ BitVec 64)) Bool)

(assert (=> b!1321265 (contains!8660 lt!587264 k0!1164)))

(declare-fun zeroValue!1279 () V!53073)

(declare-datatypes ((Unit!43445 0))(
  ( (Unit!43446) )
))
(declare-fun lt!587265 () Unit!43445)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!134 ((_ BitVec 64) (_ BitVec 64) V!53073 ListLongMap!20955) Unit!43445)

(assert (=> b!1321265 (= lt!587265 (lemmaInListMapAfterAddingDiffThenInBefore!134 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587264))))

(declare-fun lt!587266 () ListLongMap!20955)

(assert (=> b!1321265 (contains!8660 lt!587266 k0!1164)))

(declare-fun minValue!1279 () V!53073)

(declare-fun lt!587267 () Unit!43445)

(assert (=> b!1321265 (= lt!587267 (lemmaInListMapAfterAddingDiffThenInBefore!134 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587266))))

(declare-fun +!4579 (ListLongMap!20955 tuple2!23290) ListLongMap!20955)

(assert (=> b!1321265 (= lt!587266 (+!4579 lt!587264 (tuple2!23291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6218 (array!88963 array!88965 (_ BitVec 32) (_ BitVec 32) V!53073 V!53073 (_ BitVec 32) Int) ListLongMap!20955)

(declare-fun get!21626 (ValueCell!17090 V!53073) V!53073)

(declare-fun dynLambda!3533 (Int (_ BitVec 64)) V!53073)

(assert (=> b!1321265 (= lt!587264 (+!4579 (getCurrentListMapNoExtraKeys!6218 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23291 (select (arr!42951 _keys!1609) from!2000) (get!21626 (select (arr!42952 _values!1337) from!2000) (dynLambda!3533 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1321266 () Bool)

(declare-fun res!876586 () Bool)

(assert (=> b!1321266 (=> (not res!876586) (not e!753858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321266 (= res!876586 (validKeyInArray!0 (select (arr!42951 _keys!1609) from!2000)))))

(declare-fun b!1321267 () Bool)

(declare-fun res!876584 () Bool)

(assert (=> b!1321267 (=> (not res!876584) (not e!753858))))

(assert (=> b!1321267 (= res!876584 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43502 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321268 () Bool)

(declare-fun e!753859 () Bool)

(assert (=> b!1321268 (= e!753859 tp_is_empty!35977)))

(declare-fun b!1321269 () Bool)

(declare-fun res!876580 () Bool)

(assert (=> b!1321269 (=> (not res!876580) (not e!753858))))

(assert (=> b!1321269 (= res!876580 (and (= (size!43503 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43502 _keys!1609) (size!43503 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321270 () Bool)

(declare-fun res!876579 () Bool)

(assert (=> b!1321270 (=> (not res!876579) (not e!753858))))

(declare-fun getCurrentListMap!5489 (array!88963 array!88965 (_ BitVec 32) (_ BitVec 32) V!53073 V!53073 (_ BitVec 32) Int) ListLongMap!20955)

(assert (=> b!1321270 (= res!876579 (contains!8660 (getCurrentListMap!5489 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321271 () Bool)

(declare-fun res!876585 () Bool)

(assert (=> b!1321271 (=> (not res!876585) (not e!753858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88963 (_ BitVec 32)) Bool)

(assert (=> b!1321271 (= res!876585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321272 () Bool)

(declare-fun mapRes!55613 () Bool)

(assert (=> b!1321272 (= e!753860 (and e!753859 mapRes!55613))))

(declare-fun condMapEmpty!55613 () Bool)

(declare-fun mapDefault!55613 () ValueCell!17090)

(assert (=> b!1321272 (= condMapEmpty!55613 (= (arr!42952 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17090)) mapDefault!55613)))))

(declare-fun mapIsEmpty!55613 () Bool)

(assert (=> mapIsEmpty!55613 mapRes!55613))

(declare-fun b!1321273 () Bool)

(declare-fun res!876582 () Bool)

(assert (=> b!1321273 (=> (not res!876582) (not e!753858))))

(assert (=> b!1321273 (= res!876582 (not (= (select (arr!42951 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321274 () Bool)

(declare-fun res!876581 () Bool)

(assert (=> b!1321274 (=> (not res!876581) (not e!753858))))

(declare-datatypes ((List!30446 0))(
  ( (Nil!30443) (Cons!30442 (h!31660 (_ BitVec 64)) (t!44144 List!30446)) )
))
(declare-fun arrayNoDuplicates!0 (array!88963 (_ BitVec 32) List!30446) Bool)

(assert (=> b!1321274 (= res!876581 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30443))))

(declare-fun mapNonEmpty!55613 () Bool)

(declare-fun tp!105946 () Bool)

(assert (=> mapNonEmpty!55613 (= mapRes!55613 (and tp!105946 e!753861))))

(declare-fun mapKey!55613 () (_ BitVec 32))

(declare-fun mapValue!55613 () ValueCell!17090)

(declare-fun mapRest!55613 () (Array (_ BitVec 32) ValueCell!17090))

(assert (=> mapNonEmpty!55613 (= (arr!42952 _values!1337) (store mapRest!55613 mapKey!55613 mapValue!55613))))

(assert (= (and start!111724 res!876583) b!1321269))

(assert (= (and b!1321269 res!876580) b!1321271))

(assert (= (and b!1321271 res!876585) b!1321274))

(assert (= (and b!1321274 res!876581) b!1321267))

(assert (= (and b!1321267 res!876584) b!1321270))

(assert (= (and b!1321270 res!876579) b!1321273))

(assert (= (and b!1321273 res!876582) b!1321266))

(assert (= (and b!1321266 res!876586) b!1321265))

(assert (= (and b!1321272 condMapEmpty!55613) mapIsEmpty!55613))

(assert (= (and b!1321272 (not condMapEmpty!55613)) mapNonEmpty!55613))

(get-info :version)

(assert (= (and mapNonEmpty!55613 ((_ is ValueCellFull!17090) mapValue!55613)) b!1321264))

(assert (= (and b!1321272 ((_ is ValueCellFull!17090) mapDefault!55613)) b!1321268))

(assert (= start!111724 b!1321272))

(declare-fun b_lambda!23477 () Bool)

(assert (=> (not b_lambda!23477) (not b!1321265)))

(declare-fun t!44142 () Bool)

(declare-fun tb!11501 () Bool)

(assert (=> (and start!111724 (= defaultEntry!1340 defaultEntry!1340) t!44142) tb!11501))

(declare-fun result!24065 () Bool)

(assert (=> tb!11501 (= result!24065 tp_is_empty!35977)))

(assert (=> b!1321265 t!44142))

(declare-fun b_and!48477 () Bool)

(assert (= b_and!48475 (and (=> t!44142 result!24065) b_and!48477)))

(declare-fun m!1209209 () Bool)

(assert (=> start!111724 m!1209209))

(declare-fun m!1209211 () Bool)

(assert (=> start!111724 m!1209211))

(declare-fun m!1209213 () Bool)

(assert (=> start!111724 m!1209213))

(declare-fun m!1209215 () Bool)

(assert (=> mapNonEmpty!55613 m!1209215))

(declare-fun m!1209217 () Bool)

(assert (=> b!1321274 m!1209217))

(declare-fun m!1209219 () Bool)

(assert (=> b!1321265 m!1209219))

(declare-fun m!1209221 () Bool)

(assert (=> b!1321265 m!1209221))

(assert (=> b!1321265 m!1209219))

(declare-fun m!1209223 () Bool)

(assert (=> b!1321265 m!1209223))

(declare-fun m!1209225 () Bool)

(assert (=> b!1321265 m!1209225))

(declare-fun m!1209227 () Bool)

(assert (=> b!1321265 m!1209227))

(assert (=> b!1321265 m!1209221))

(declare-fun m!1209229 () Bool)

(assert (=> b!1321265 m!1209229))

(declare-fun m!1209231 () Bool)

(assert (=> b!1321265 m!1209231))

(declare-fun m!1209233 () Bool)

(assert (=> b!1321265 m!1209233))

(declare-fun m!1209235 () Bool)

(assert (=> b!1321265 m!1209235))

(assert (=> b!1321265 m!1209227))

(declare-fun m!1209237 () Bool)

(assert (=> b!1321265 m!1209237))

(declare-fun m!1209239 () Bool)

(assert (=> b!1321265 m!1209239))

(assert (=> b!1321266 m!1209233))

(assert (=> b!1321266 m!1209233))

(declare-fun m!1209241 () Bool)

(assert (=> b!1321266 m!1209241))

(assert (=> b!1321273 m!1209233))

(declare-fun m!1209243 () Bool)

(assert (=> b!1321271 m!1209243))

(declare-fun m!1209245 () Bool)

(assert (=> b!1321270 m!1209245))

(assert (=> b!1321270 m!1209245))

(declare-fun m!1209247 () Bool)

(assert (=> b!1321270 m!1209247))

(check-sat (not b!1321270) (not start!111724) (not b_next!30157) tp_is_empty!35977 (not b!1321265) b_and!48477 (not b!1321274) (not mapNonEmpty!55613) (not b_lambda!23477) (not b!1321266) (not b!1321271))
(check-sat b_and!48477 (not b_next!30157))
