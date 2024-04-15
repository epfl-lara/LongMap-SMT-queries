; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111524 () Bool)

(assert start!111524)

(declare-fun b_free!30181 () Bool)

(declare-fun b_next!30181 () Bool)

(assert (=> start!111524 (= b_free!30181 (not b_next!30181))))

(declare-fun tp!106019 () Bool)

(declare-fun b_and!48503 () Bool)

(assert (=> start!111524 (= tp!106019 b_and!48503)))

(declare-fun b!1320315 () Bool)

(declare-fun res!876326 () Bool)

(declare-fun e!753165 () Bool)

(assert (=> b!1320315 (=> (not res!876326) (not e!753165))))

(declare-datatypes ((array!88859 0))(
  ( (array!88860 (arr!42904 (Array (_ BitVec 32) (_ BitVec 64))) (size!43456 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88859)

(declare-datatypes ((List!30488 0))(
  ( (Nil!30485) (Cons!30484 (h!31693 (_ BitVec 64)) (t!44210 List!30488)) )
))
(declare-fun arrayNoDuplicates!0 (array!88859 (_ BitVec 32) List!30488) Bool)

(assert (=> b!1320315 (= res!876326 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30485))))

(declare-fun b!1320316 () Bool)

(declare-fun res!876325 () Bool)

(assert (=> b!1320316 (=> (not res!876325) (not e!753165))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53105 0))(
  ( (V!53106 (val!18075 Int)) )
))
(declare-fun zeroValue!1279 () V!53105)

(declare-datatypes ((ValueCell!17102 0))(
  ( (ValueCellFull!17102 (v!20704 V!53105)) (EmptyCell!17102) )
))
(declare-datatypes ((array!88861 0))(
  ( (array!88862 (arr!42905 (Array (_ BitVec 32) ValueCell!17102)) (size!43457 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88861)

(declare-fun minValue!1279 () V!53105)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23352 0))(
  ( (tuple2!23353 (_1!11687 (_ BitVec 64)) (_2!11687 V!53105)) )
))
(declare-datatypes ((List!30489 0))(
  ( (Nil!30486) (Cons!30485 (h!31694 tuple2!23352) (t!44211 List!30489)) )
))
(declare-datatypes ((ListLongMap!21009 0))(
  ( (ListLongMap!21010 (toList!10520 List!30489)) )
))
(declare-fun contains!8603 (ListLongMap!21009 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5410 (array!88859 array!88861 (_ BitVec 32) (_ BitVec 32) V!53105 V!53105 (_ BitVec 32) Int) ListLongMap!21009)

(assert (=> b!1320316 (= res!876325 (contains!8603 (getCurrentListMap!5410 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320317 () Bool)

(declare-fun res!876321 () Bool)

(assert (=> b!1320317 (=> (not res!876321) (not e!753165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88859 (_ BitVec 32)) Bool)

(assert (=> b!1320317 (= res!876321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320318 () Bool)

(declare-fun res!876324 () Bool)

(assert (=> b!1320318 (=> (not res!876324) (not e!753165))))

(assert (=> b!1320318 (= res!876324 (and (= (size!43457 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43456 _keys!1609) (size!43457 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320319 () Bool)

(declare-fun res!876322 () Bool)

(assert (=> b!1320319 (=> (not res!876322) (not e!753165))))

(assert (=> b!1320319 (= res!876322 (not (= (select (arr!42904 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320320 () Bool)

(declare-fun res!876327 () Bool)

(assert (=> b!1320320 (=> (not res!876327) (not e!753165))))

(assert (=> b!1320320 (= res!876327 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43456 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320321 () Bool)

(declare-fun e!753164 () Bool)

(declare-fun e!753166 () Bool)

(declare-fun mapRes!55649 () Bool)

(assert (=> b!1320321 (= e!753164 (and e!753166 mapRes!55649))))

(declare-fun condMapEmpty!55649 () Bool)

(declare-fun mapDefault!55649 () ValueCell!17102)

(assert (=> b!1320321 (= condMapEmpty!55649 (= (arr!42905 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17102)) mapDefault!55649)))))

(declare-fun b!1320322 () Bool)

(declare-fun e!753163 () Bool)

(declare-fun tp_is_empty!36001 () Bool)

(assert (=> b!1320322 (= e!753163 tp_is_empty!36001)))

(declare-fun b!1320323 () Bool)

(assert (=> b!1320323 (= e!753165 (not true))))

(declare-fun lt!586748 () ListLongMap!21009)

(assert (=> b!1320323 (contains!8603 lt!586748 k0!1164)))

(declare-datatypes ((Unit!43313 0))(
  ( (Unit!43314) )
))
(declare-fun lt!586746 () Unit!43313)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!130 ((_ BitVec 64) (_ BitVec 64) V!53105 ListLongMap!21009) Unit!43313)

(assert (=> b!1320323 (= lt!586746 (lemmaInListMapAfterAddingDiffThenInBefore!130 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586748))))

(declare-fun lt!586749 () ListLongMap!21009)

(assert (=> b!1320323 (contains!8603 lt!586749 k0!1164)))

(declare-fun lt!586747 () Unit!43313)

(assert (=> b!1320323 (= lt!586747 (lemmaInListMapAfterAddingDiffThenInBefore!130 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586749))))

(declare-fun +!4565 (ListLongMap!21009 tuple2!23352) ListLongMap!21009)

(assert (=> b!1320323 (= lt!586749 (+!4565 lt!586748 (tuple2!23353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6198 (array!88859 array!88861 (_ BitVec 32) (_ BitVec 32) V!53105 V!53105 (_ BitVec 32) Int) ListLongMap!21009)

(declare-fun get!21584 (ValueCell!17102 V!53105) V!53105)

(declare-fun dynLambda!3495 (Int (_ BitVec 64)) V!53105)

(assert (=> b!1320323 (= lt!586748 (+!4565 (getCurrentListMapNoExtraKeys!6198 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23353 (select (arr!42904 _keys!1609) from!2000) (get!21584 (select (arr!42905 _values!1337) from!2000) (dynLambda!3495 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320324 () Bool)

(assert (=> b!1320324 (= e!753166 tp_is_empty!36001)))

(declare-fun b!1320325 () Bool)

(declare-fun res!876323 () Bool)

(assert (=> b!1320325 (=> (not res!876323) (not e!753165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320325 (= res!876323 (validKeyInArray!0 (select (arr!42904 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55649 () Bool)

(declare-fun tp!106020 () Bool)

(assert (=> mapNonEmpty!55649 (= mapRes!55649 (and tp!106020 e!753163))))

(declare-fun mapRest!55649 () (Array (_ BitVec 32) ValueCell!17102))

(declare-fun mapValue!55649 () ValueCell!17102)

(declare-fun mapKey!55649 () (_ BitVec 32))

(assert (=> mapNonEmpty!55649 (= (arr!42905 _values!1337) (store mapRest!55649 mapKey!55649 mapValue!55649))))

(declare-fun res!876320 () Bool)

(assert (=> start!111524 (=> (not res!876320) (not e!753165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111524 (= res!876320 (validMask!0 mask!2019))))

(assert (=> start!111524 e!753165))

(declare-fun array_inv!32577 (array!88859) Bool)

(assert (=> start!111524 (array_inv!32577 _keys!1609)))

(assert (=> start!111524 true))

(assert (=> start!111524 tp_is_empty!36001))

(declare-fun array_inv!32578 (array!88861) Bool)

(assert (=> start!111524 (and (array_inv!32578 _values!1337) e!753164)))

(assert (=> start!111524 tp!106019))

(declare-fun mapIsEmpty!55649 () Bool)

(assert (=> mapIsEmpty!55649 mapRes!55649))

(assert (= (and start!111524 res!876320) b!1320318))

(assert (= (and b!1320318 res!876324) b!1320317))

(assert (= (and b!1320317 res!876321) b!1320315))

(assert (= (and b!1320315 res!876326) b!1320320))

(assert (= (and b!1320320 res!876327) b!1320316))

(assert (= (and b!1320316 res!876325) b!1320319))

(assert (= (and b!1320319 res!876322) b!1320325))

(assert (= (and b!1320325 res!876323) b!1320323))

(assert (= (and b!1320321 condMapEmpty!55649) mapIsEmpty!55649))

(assert (= (and b!1320321 (not condMapEmpty!55649)) mapNonEmpty!55649))

(get-info :version)

(assert (= (and mapNonEmpty!55649 ((_ is ValueCellFull!17102) mapValue!55649)) b!1320322))

(assert (= (and b!1320321 ((_ is ValueCellFull!17102) mapDefault!55649)) b!1320324))

(assert (= start!111524 b!1320321))

(declare-fun b_lambda!23497 () Bool)

(assert (=> (not b_lambda!23497) (not b!1320323)))

(declare-fun t!44209 () Bool)

(declare-fun tb!11525 () Bool)

(assert (=> (and start!111524 (= defaultEntry!1340 defaultEntry!1340) t!44209) tb!11525))

(declare-fun result!24113 () Bool)

(assert (=> tb!11525 (= result!24113 tp_is_empty!36001)))

(assert (=> b!1320323 t!44209))

(declare-fun b_and!48505 () Bool)

(assert (= b_and!48503 (and (=> t!44209 result!24113) b_and!48505)))

(declare-fun m!1207575 () Bool)

(assert (=> start!111524 m!1207575))

(declare-fun m!1207577 () Bool)

(assert (=> start!111524 m!1207577))

(declare-fun m!1207579 () Bool)

(assert (=> start!111524 m!1207579))

(declare-fun m!1207581 () Bool)

(assert (=> b!1320325 m!1207581))

(assert (=> b!1320325 m!1207581))

(declare-fun m!1207583 () Bool)

(assert (=> b!1320325 m!1207583))

(declare-fun m!1207585 () Bool)

(assert (=> b!1320316 m!1207585))

(assert (=> b!1320316 m!1207585))

(declare-fun m!1207587 () Bool)

(assert (=> b!1320316 m!1207587))

(declare-fun m!1207589 () Bool)

(assert (=> mapNonEmpty!55649 m!1207589))

(declare-fun m!1207591 () Bool)

(assert (=> b!1320317 m!1207591))

(assert (=> b!1320319 m!1207581))

(declare-fun m!1207593 () Bool)

(assert (=> b!1320315 m!1207593))

(declare-fun m!1207595 () Bool)

(assert (=> b!1320323 m!1207595))

(declare-fun m!1207597 () Bool)

(assert (=> b!1320323 m!1207597))

(declare-fun m!1207599 () Bool)

(assert (=> b!1320323 m!1207599))

(declare-fun m!1207601 () Bool)

(assert (=> b!1320323 m!1207601))

(declare-fun m!1207603 () Bool)

(assert (=> b!1320323 m!1207603))

(declare-fun m!1207605 () Bool)

(assert (=> b!1320323 m!1207605))

(declare-fun m!1207607 () Bool)

(assert (=> b!1320323 m!1207607))

(declare-fun m!1207609 () Bool)

(assert (=> b!1320323 m!1207609))

(assert (=> b!1320323 m!1207607))

(assert (=> b!1320323 m!1207597))

(declare-fun m!1207611 () Bool)

(assert (=> b!1320323 m!1207611))

(assert (=> b!1320323 m!1207581))

(assert (=> b!1320323 m!1207599))

(declare-fun m!1207613 () Bool)

(assert (=> b!1320323 m!1207613))

(check-sat (not start!111524) (not mapNonEmpty!55649) (not b_next!30181) (not b!1320315) (not b!1320316) (not b!1320323) (not b!1320317) tp_is_empty!36001 b_and!48505 (not b!1320325) (not b_lambda!23497))
(check-sat b_and!48505 (not b_next!30181))
