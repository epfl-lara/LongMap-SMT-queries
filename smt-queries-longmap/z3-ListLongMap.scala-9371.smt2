; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111664 () Bool)

(assert start!111664)

(declare-fun b_free!30321 () Bool)

(declare-fun b_next!30321 () Bool)

(assert (=> start!111664 (= b_free!30321 (not b_next!30321))))

(declare-fun tp!106438 () Bool)

(declare-fun b_and!48801 () Bool)

(assert (=> start!111664 (= tp!106438 b_and!48801)))

(declare-fun b!1322835 () Bool)

(declare-fun e!754248 () Bool)

(declare-fun e!754246 () Bool)

(declare-fun mapRes!55859 () Bool)

(assert (=> b!1322835 (= e!754248 (and e!754246 mapRes!55859))))

(declare-fun condMapEmpty!55859 () Bool)

(declare-datatypes ((V!53291 0))(
  ( (V!53292 (val!18145 Int)) )
))
(declare-datatypes ((ValueCell!17172 0))(
  ( (ValueCellFull!17172 (v!20775 V!53291)) (EmptyCell!17172) )
))
(declare-datatypes ((array!89202 0))(
  ( (array!89203 (arr!43075 (Array (_ BitVec 32) ValueCell!17172)) (size!43625 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89202)

(declare-fun mapDefault!55859 () ValueCell!17172)

(assert (=> b!1322835 (= condMapEmpty!55859 (= (arr!43075 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17172)) mapDefault!55859)))))

(declare-fun b!1322836 () Bool)

(declare-fun res!878036 () Bool)

(declare-fun e!754247 () Bool)

(assert (=> b!1322836 (=> (not res!878036) (not e!754247))))

(declare-datatypes ((array!89204 0))(
  ( (array!89205 (arr!43076 (Array (_ BitVec 32) (_ BitVec 64))) (size!43626 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89204)

(declare-datatypes ((List!30527 0))(
  ( (Nil!30524) (Cons!30523 (h!31732 (_ BitVec 64)) (t!44397 List!30527)) )
))
(declare-fun arrayNoDuplicates!0 (array!89204 (_ BitVec 32) List!30527) Bool)

(assert (=> b!1322836 (= res!878036 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30524))))

(declare-fun b!1322838 () Bool)

(declare-fun res!878029 () Bool)

(assert (=> b!1322838 (=> (not res!878029) (not e!754247))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322838 (= res!878029 (validKeyInArray!0 (select (arr!43076 _keys!1609) from!2000)))))

(declare-fun b!1322839 () Bool)

(declare-fun res!878033 () Bool)

(assert (=> b!1322839 (=> (not res!878033) (not e!754247))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322839 (= res!878033 (not (= (select (arr!43076 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322840 () Bool)

(declare-fun e!754249 () Bool)

(declare-fun tp_is_empty!36141 () Bool)

(assert (=> b!1322840 (= e!754249 tp_is_empty!36141)))

(declare-fun mapIsEmpty!55859 () Bool)

(assert (=> mapIsEmpty!55859 mapRes!55859))

(declare-fun b!1322841 () Bool)

(assert (=> b!1322841 (= e!754246 tp_is_empty!36141)))

(declare-fun mapNonEmpty!55859 () Bool)

(declare-fun tp!106439 () Bool)

(assert (=> mapNonEmpty!55859 (= mapRes!55859 (and tp!106439 e!754249))))

(declare-fun mapValue!55859 () ValueCell!17172)

(declare-fun mapKey!55859 () (_ BitVec 32))

(declare-fun mapRest!55859 () (Array (_ BitVec 32) ValueCell!17172))

(assert (=> mapNonEmpty!55859 (= (arr!43075 _values!1337) (store mapRest!55859 mapKey!55859 mapValue!55859))))

(declare-fun b!1322842 () Bool)

(declare-fun res!878032 () Bool)

(assert (=> b!1322842 (=> (not res!878032) (not e!754247))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53291)

(declare-fun minValue!1279 () V!53291)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23384 0))(
  ( (tuple2!23385 (_1!11703 (_ BitVec 64)) (_2!11703 V!53291)) )
))
(declare-datatypes ((List!30528 0))(
  ( (Nil!30525) (Cons!30524 (h!31733 tuple2!23384) (t!44398 List!30528)) )
))
(declare-datatypes ((ListLongMap!21041 0))(
  ( (ListLongMap!21042 (toList!10536 List!30528)) )
))
(declare-fun contains!8691 (ListLongMap!21041 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5535 (array!89204 array!89202 (_ BitVec 32) (_ BitVec 32) V!53291 V!53291 (_ BitVec 32) Int) ListLongMap!21041)

(assert (=> b!1322842 (= res!878032 (contains!8691 (getCurrentListMap!5535 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322843 () Bool)

(declare-fun res!878034 () Bool)

(assert (=> b!1322843 (=> (not res!878034) (not e!754247))))

(assert (=> b!1322843 (= res!878034 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43626 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!878030 () Bool)

(assert (=> start!111664 (=> (not res!878030) (not e!754247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111664 (= res!878030 (validMask!0 mask!2019))))

(assert (=> start!111664 e!754247))

(declare-fun array_inv!32523 (array!89204) Bool)

(assert (=> start!111664 (array_inv!32523 _keys!1609)))

(assert (=> start!111664 true))

(assert (=> start!111664 tp_is_empty!36141))

(declare-fun array_inv!32524 (array!89202) Bool)

(assert (=> start!111664 (and (array_inv!32524 _values!1337) e!754248)))

(assert (=> start!111664 tp!106438))

(declare-fun b!1322837 () Bool)

(declare-fun res!878035 () Bool)

(assert (=> b!1322837 (=> (not res!878035) (not e!754247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89204 (_ BitVec 32)) Bool)

(assert (=> b!1322837 (= res!878035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322844 () Bool)

(assert (=> b!1322844 (= e!754247 (not true))))

(declare-fun lt!588477 () ListLongMap!21041)

(declare-fun lt!588478 () tuple2!23384)

(declare-fun +!4588 (ListLongMap!21041 tuple2!23384) ListLongMap!21041)

(assert (=> b!1322844 (contains!8691 (+!4588 lt!588477 lt!588478) k0!1164)))

(declare-datatypes ((Unit!43596 0))(
  ( (Unit!43597) )
))
(declare-fun lt!588474 () Unit!43596)

(declare-fun addStillContains!1137 (ListLongMap!21041 (_ BitVec 64) V!53291 (_ BitVec 64)) Unit!43596)

(assert (=> b!1322844 (= lt!588474 (addStillContains!1137 lt!588477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322844 (contains!8691 lt!588477 k0!1164)))

(declare-fun lt!588472 () Unit!43596)

(declare-fun lt!588473 () V!53291)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!184 ((_ BitVec 64) (_ BitVec 64) V!53291 ListLongMap!21041) Unit!43596)

(assert (=> b!1322844 (= lt!588472 (lemmaInListMapAfterAddingDiffThenInBefore!184 k0!1164 (select (arr!43076 _keys!1609) from!2000) lt!588473 lt!588477))))

(declare-fun lt!588480 () ListLongMap!21041)

(assert (=> b!1322844 (contains!8691 lt!588480 k0!1164)))

(declare-fun lt!588479 () Unit!43596)

(assert (=> b!1322844 (= lt!588479 (lemmaInListMapAfterAddingDiffThenInBefore!184 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588480))))

(declare-fun lt!588476 () ListLongMap!21041)

(assert (=> b!1322844 (contains!8691 lt!588476 k0!1164)))

(declare-fun lt!588475 () Unit!43596)

(assert (=> b!1322844 (= lt!588475 (lemmaInListMapAfterAddingDiffThenInBefore!184 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588476))))

(assert (=> b!1322844 (= lt!588476 (+!4588 lt!588480 lt!588478))))

(assert (=> b!1322844 (= lt!588478 (tuple2!23385 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322844 (= lt!588480 (+!4588 lt!588477 (tuple2!23385 (select (arr!43076 _keys!1609) from!2000) lt!588473)))))

(declare-fun get!21686 (ValueCell!17172 V!53291) V!53291)

(declare-fun dynLambda!3527 (Int (_ BitVec 64)) V!53291)

(assert (=> b!1322844 (= lt!588473 (get!21686 (select (arr!43075 _values!1337) from!2000) (dynLambda!3527 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6223 (array!89204 array!89202 (_ BitVec 32) (_ BitVec 32) V!53291 V!53291 (_ BitVec 32) Int) ListLongMap!21041)

(assert (=> b!1322844 (= lt!588477 (getCurrentListMapNoExtraKeys!6223 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322845 () Bool)

(declare-fun res!878031 () Bool)

(assert (=> b!1322845 (=> (not res!878031) (not e!754247))))

(assert (=> b!1322845 (= res!878031 (and (= (size!43625 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43626 _keys!1609) (size!43625 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111664 res!878030) b!1322845))

(assert (= (and b!1322845 res!878031) b!1322837))

(assert (= (and b!1322837 res!878035) b!1322836))

(assert (= (and b!1322836 res!878036) b!1322843))

(assert (= (and b!1322843 res!878034) b!1322842))

(assert (= (and b!1322842 res!878032) b!1322839))

(assert (= (and b!1322839 res!878033) b!1322838))

(assert (= (and b!1322838 res!878029) b!1322844))

(assert (= (and b!1322835 condMapEmpty!55859) mapIsEmpty!55859))

(assert (= (and b!1322835 (not condMapEmpty!55859)) mapNonEmpty!55859))

(get-info :version)

(assert (= (and mapNonEmpty!55859 ((_ is ValueCellFull!17172) mapValue!55859)) b!1322840))

(assert (= (and b!1322835 ((_ is ValueCellFull!17172) mapDefault!55859)) b!1322841))

(assert (= start!111664 b!1322835))

(declare-fun b_lambda!23647 () Bool)

(assert (=> (not b_lambda!23647) (not b!1322844)))

(declare-fun t!44396 () Bool)

(declare-fun tb!11673 () Bool)

(assert (=> (and start!111664 (= defaultEntry!1340 defaultEntry!1340) t!44396) tb!11673))

(declare-fun result!24401 () Bool)

(assert (=> tb!11673 (= result!24401 tp_is_empty!36141)))

(assert (=> b!1322844 t!44396))

(declare-fun b_and!48803 () Bool)

(assert (= b_and!48801 (and (=> t!44396 result!24401) b_and!48803)))

(declare-fun m!1211291 () Bool)

(assert (=> b!1322837 m!1211291))

(declare-fun m!1211293 () Bool)

(assert (=> b!1322836 m!1211293))

(declare-fun m!1211295 () Bool)

(assert (=> mapNonEmpty!55859 m!1211295))

(declare-fun m!1211297 () Bool)

(assert (=> start!111664 m!1211297))

(declare-fun m!1211299 () Bool)

(assert (=> start!111664 m!1211299))

(declare-fun m!1211301 () Bool)

(assert (=> start!111664 m!1211301))

(declare-fun m!1211303 () Bool)

(assert (=> b!1322844 m!1211303))

(declare-fun m!1211305 () Bool)

(assert (=> b!1322844 m!1211305))

(declare-fun m!1211307 () Bool)

(assert (=> b!1322844 m!1211307))

(declare-fun m!1211309 () Bool)

(assert (=> b!1322844 m!1211309))

(declare-fun m!1211311 () Bool)

(assert (=> b!1322844 m!1211311))

(declare-fun m!1211313 () Bool)

(assert (=> b!1322844 m!1211313))

(declare-fun m!1211315 () Bool)

(assert (=> b!1322844 m!1211315))

(declare-fun m!1211317 () Bool)

(assert (=> b!1322844 m!1211317))

(assert (=> b!1322844 m!1211313))

(assert (=> b!1322844 m!1211317))

(declare-fun m!1211319 () Bool)

(assert (=> b!1322844 m!1211319))

(declare-fun m!1211321 () Bool)

(assert (=> b!1322844 m!1211321))

(declare-fun m!1211323 () Bool)

(assert (=> b!1322844 m!1211323))

(declare-fun m!1211325 () Bool)

(assert (=> b!1322844 m!1211325))

(declare-fun m!1211327 () Bool)

(assert (=> b!1322844 m!1211327))

(assert (=> b!1322844 m!1211319))

(declare-fun m!1211329 () Bool)

(assert (=> b!1322844 m!1211329))

(declare-fun m!1211331 () Bool)

(assert (=> b!1322844 m!1211331))

(declare-fun m!1211333 () Bool)

(assert (=> b!1322844 m!1211333))

(assert (=> b!1322844 m!1211329))

(declare-fun m!1211335 () Bool)

(assert (=> b!1322842 m!1211335))

(assert (=> b!1322842 m!1211335))

(declare-fun m!1211337 () Bool)

(assert (=> b!1322842 m!1211337))

(assert (=> b!1322838 m!1211329))

(assert (=> b!1322838 m!1211329))

(declare-fun m!1211339 () Bool)

(assert (=> b!1322838 m!1211339))

(assert (=> b!1322839 m!1211329))

(check-sat (not b!1322838) (not b_lambda!23647) (not b!1322844) (not mapNonEmpty!55859) tp_is_empty!36141 (not b_next!30321) (not start!111664) b_and!48803 (not b!1322837) (not b!1322842) (not b!1322836))
(check-sat b_and!48803 (not b_next!30321))
