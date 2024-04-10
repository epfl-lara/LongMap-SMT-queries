; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111520 () Bool)

(assert start!111520)

(declare-fun b_free!30177 () Bool)

(declare-fun b_next!30177 () Bool)

(assert (=> start!111520 (= b_free!30177 (not b_next!30177))))

(declare-fun tp!106006 () Bool)

(declare-fun b_and!48513 () Bool)

(assert (=> start!111520 (= tp!106006 b_and!48513)))

(declare-fun mapNonEmpty!55643 () Bool)

(declare-fun mapRes!55643 () Bool)

(declare-fun tp!106007 () Bool)

(declare-fun e!753168 () Bool)

(assert (=> mapNonEmpty!55643 (= mapRes!55643 (and tp!106007 e!753168))))

(declare-datatypes ((V!53099 0))(
  ( (V!53100 (val!18073 Int)) )
))
(declare-datatypes ((ValueCell!17100 0))(
  ( (ValueCellFull!17100 (v!20703 V!53099)) (EmptyCell!17100) )
))
(declare-fun mapValue!55643 () ValueCell!17100)

(declare-datatypes ((array!88924 0))(
  ( (array!88925 (arr!42936 (Array (_ BitVec 32) ValueCell!17100)) (size!43486 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88924)

(declare-fun mapRest!55643 () (Array (_ BitVec 32) ValueCell!17100))

(declare-fun mapKey!55643 () (_ BitVec 32))

(assert (=> mapNonEmpty!55643 (= (arr!42936 _values!1337) (store mapRest!55643 mapKey!55643 mapValue!55643))))

(declare-fun mapIsEmpty!55643 () Bool)

(assert (=> mapIsEmpty!55643 mapRes!55643))

(declare-fun b!1320315 () Bool)

(declare-fun e!753169 () Bool)

(declare-fun e!753166 () Bool)

(assert (=> b!1320315 (= e!753169 (and e!753166 mapRes!55643))))

(declare-fun condMapEmpty!55643 () Bool)

(declare-fun mapDefault!55643 () ValueCell!17100)

(assert (=> b!1320315 (= condMapEmpty!55643 (= (arr!42936 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17100)) mapDefault!55643)))))

(declare-fun b!1320316 () Bool)

(declare-fun tp_is_empty!35997 () Bool)

(assert (=> b!1320316 (= e!753166 tp_is_empty!35997)))

(declare-fun b!1320317 () Bool)

(declare-fun e!753165 () Bool)

(assert (=> b!1320317 (= e!753165 (not true))))

(declare-datatypes ((tuple2!23268 0))(
  ( (tuple2!23269 (_1!11645 (_ BitVec 64)) (_2!11645 V!53099)) )
))
(declare-datatypes ((List!30419 0))(
  ( (Nil!30416) (Cons!30415 (h!31624 tuple2!23268) (t!44145 List!30419)) )
))
(declare-datatypes ((ListLongMap!20925 0))(
  ( (ListLongMap!20926 (toList!10478 List!30419)) )
))
(declare-fun lt!586910 () ListLongMap!20925)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8633 (ListLongMap!20925 (_ BitVec 64)) Bool)

(assert (=> b!1320317 (contains!8633 lt!586910 k0!1164)))

(declare-datatypes ((Unit!43494 0))(
  ( (Unit!43495) )
))
(declare-fun lt!586911 () Unit!43494)

(declare-fun zeroValue!1279 () V!53099)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!133 ((_ BitVec 64) (_ BitVec 64) V!53099 ListLongMap!20925) Unit!43494)

(assert (=> b!1320317 (= lt!586911 (lemmaInListMapAfterAddingDiffThenInBefore!133 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586910))))

(declare-fun lt!586908 () ListLongMap!20925)

(assert (=> b!1320317 (contains!8633 lt!586908 k0!1164)))

(declare-fun minValue!1279 () V!53099)

(declare-fun lt!586909 () Unit!43494)

(assert (=> b!1320317 (= lt!586909 (lemmaInListMapAfterAddingDiffThenInBefore!133 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586908))))

(declare-fun +!4537 (ListLongMap!20925 tuple2!23268) ListLongMap!20925)

(assert (=> b!1320317 (= lt!586908 (+!4537 lt!586910 (tuple2!23269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!88926 0))(
  ( (array!88927 (arr!42937 (Array (_ BitVec 32) (_ BitVec 64))) (size!43487 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88926)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6172 (array!88926 array!88924 (_ BitVec 32) (_ BitVec 32) V!53099 V!53099 (_ BitVec 32) Int) ListLongMap!20925)

(declare-fun get!21587 (ValueCell!17100 V!53099) V!53099)

(declare-fun dynLambda!3476 (Int (_ BitVec 64)) V!53099)

(assert (=> b!1320317 (= lt!586910 (+!4537 (getCurrentListMapNoExtraKeys!6172 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23269 (select (arr!42937 _keys!1609) from!2000) (get!21587 (select (arr!42936 _values!1337) from!2000) (dynLambda!3476 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320318 () Bool)

(assert (=> b!1320318 (= e!753168 tp_is_empty!35997)))

(declare-fun b!1320319 () Bool)

(declare-fun res!876304 () Bool)

(assert (=> b!1320319 (=> (not res!876304) (not e!753165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320319 (= res!876304 (validKeyInArray!0 (select (arr!42937 _keys!1609) from!2000)))))

(declare-fun res!876306 () Bool)

(assert (=> start!111520 (=> (not res!876306) (not e!753165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111520 (= res!876306 (validMask!0 mask!2019))))

(assert (=> start!111520 e!753165))

(declare-fun array_inv!32417 (array!88926) Bool)

(assert (=> start!111520 (array_inv!32417 _keys!1609)))

(assert (=> start!111520 true))

(assert (=> start!111520 tp_is_empty!35997))

(declare-fun array_inv!32418 (array!88924) Bool)

(assert (=> start!111520 (and (array_inv!32418 _values!1337) e!753169)))

(assert (=> start!111520 tp!106006))

(declare-fun b!1320320 () Bool)

(declare-fun res!876307 () Bool)

(assert (=> b!1320320 (=> (not res!876307) (not e!753165))))

(assert (=> b!1320320 (= res!876307 (and (= (size!43486 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43487 _keys!1609) (size!43486 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320321 () Bool)

(declare-fun res!876303 () Bool)

(assert (=> b!1320321 (=> (not res!876303) (not e!753165))))

(declare-datatypes ((List!30420 0))(
  ( (Nil!30417) (Cons!30416 (h!31625 (_ BitVec 64)) (t!44146 List!30420)) )
))
(declare-fun arrayNoDuplicates!0 (array!88926 (_ BitVec 32) List!30420) Bool)

(assert (=> b!1320321 (= res!876303 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30417))))

(declare-fun b!1320322 () Bool)

(declare-fun res!876305 () Bool)

(assert (=> b!1320322 (=> (not res!876305) (not e!753165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88926 (_ BitVec 32)) Bool)

(assert (=> b!1320322 (= res!876305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320323 () Bool)

(declare-fun res!876302 () Bool)

(assert (=> b!1320323 (=> (not res!876302) (not e!753165))))

(assert (=> b!1320323 (= res!876302 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43487 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320324 () Bool)

(declare-fun res!876308 () Bool)

(assert (=> b!1320324 (=> (not res!876308) (not e!753165))))

(declare-fun getCurrentListMap!5484 (array!88926 array!88924 (_ BitVec 32) (_ BitVec 32) V!53099 V!53099 (_ BitVec 32) Int) ListLongMap!20925)

(assert (=> b!1320324 (= res!876308 (contains!8633 (getCurrentListMap!5484 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320325 () Bool)

(declare-fun res!876301 () Bool)

(assert (=> b!1320325 (=> (not res!876301) (not e!753165))))

(assert (=> b!1320325 (= res!876301 (not (= (select (arr!42937 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111520 res!876306) b!1320320))

(assert (= (and b!1320320 res!876307) b!1320322))

(assert (= (and b!1320322 res!876305) b!1320321))

(assert (= (and b!1320321 res!876303) b!1320323))

(assert (= (and b!1320323 res!876302) b!1320324))

(assert (= (and b!1320324 res!876308) b!1320325))

(assert (= (and b!1320325 res!876301) b!1320319))

(assert (= (and b!1320319 res!876304) b!1320317))

(assert (= (and b!1320315 condMapEmpty!55643) mapIsEmpty!55643))

(assert (= (and b!1320315 (not condMapEmpty!55643)) mapNonEmpty!55643))

(get-info :version)

(assert (= (and mapNonEmpty!55643 ((_ is ValueCellFull!17100) mapValue!55643)) b!1320318))

(assert (= (and b!1320315 ((_ is ValueCellFull!17100) mapDefault!55643)) b!1320316))

(assert (= start!111520 b!1320315))

(declare-fun b_lambda!23503 () Bool)

(assert (=> (not b_lambda!23503) (not b!1320317)))

(declare-fun t!44144 () Bool)

(declare-fun tb!11529 () Bool)

(assert (=> (and start!111520 (= defaultEntry!1340 defaultEntry!1340) t!44144) tb!11529))

(declare-fun result!24113 () Bool)

(assert (=> tb!11529 (= result!24113 tp_is_empty!35997)))

(assert (=> b!1320317 t!44144))

(declare-fun b_and!48515 () Bool)

(assert (= b_and!48513 (and (=> t!44144 result!24113) b_and!48515)))

(declare-fun m!1208011 () Bool)

(assert (=> b!1320325 m!1208011))

(declare-fun m!1208013 () Bool)

(assert (=> start!111520 m!1208013))

(declare-fun m!1208015 () Bool)

(assert (=> start!111520 m!1208015))

(declare-fun m!1208017 () Bool)

(assert (=> start!111520 m!1208017))

(declare-fun m!1208019 () Bool)

(assert (=> b!1320322 m!1208019))

(declare-fun m!1208021 () Bool)

(assert (=> b!1320317 m!1208021))

(declare-fun m!1208023 () Bool)

(assert (=> b!1320317 m!1208023))

(declare-fun m!1208025 () Bool)

(assert (=> b!1320317 m!1208025))

(declare-fun m!1208027 () Bool)

(assert (=> b!1320317 m!1208027))

(assert (=> b!1320317 m!1208027))

(assert (=> b!1320317 m!1208021))

(declare-fun m!1208029 () Bool)

(assert (=> b!1320317 m!1208029))

(declare-fun m!1208031 () Bool)

(assert (=> b!1320317 m!1208031))

(assert (=> b!1320317 m!1208023))

(declare-fun m!1208033 () Bool)

(assert (=> b!1320317 m!1208033))

(declare-fun m!1208035 () Bool)

(assert (=> b!1320317 m!1208035))

(declare-fun m!1208037 () Bool)

(assert (=> b!1320317 m!1208037))

(declare-fun m!1208039 () Bool)

(assert (=> b!1320317 m!1208039))

(assert (=> b!1320317 m!1208011))

(assert (=> b!1320319 m!1208011))

(assert (=> b!1320319 m!1208011))

(declare-fun m!1208041 () Bool)

(assert (=> b!1320319 m!1208041))

(declare-fun m!1208043 () Bool)

(assert (=> mapNonEmpty!55643 m!1208043))

(declare-fun m!1208045 () Bool)

(assert (=> b!1320324 m!1208045))

(assert (=> b!1320324 m!1208045))

(declare-fun m!1208047 () Bool)

(assert (=> b!1320324 m!1208047))

(declare-fun m!1208049 () Bool)

(assert (=> b!1320321 m!1208049))

(check-sat (not b!1320317) (not b!1320324) (not b_next!30177) b_and!48515 tp_is_empty!35997 (not b!1320322) (not b_lambda!23503) (not b!1320321) (not start!111520) (not mapNonEmpty!55643) (not b!1320319))
(check-sat b_and!48515 (not b_next!30177))
