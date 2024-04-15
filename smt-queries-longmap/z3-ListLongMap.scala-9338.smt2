; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111464 () Bool)

(assert start!111464)

(declare-fun b_free!30121 () Bool)

(declare-fun b_next!30121 () Bool)

(assert (=> start!111464 (= b_free!30121 (not b_next!30121))))

(declare-fun tp!105840 () Bool)

(declare-fun b_and!48383 () Bool)

(assert (=> start!111464 (= tp!105840 b_and!48383)))

(declare-fun b!1319265 () Bool)

(declare-fun res!875605 () Bool)

(declare-fun e!752714 () Bool)

(assert (=> b!1319265 (=> (not res!875605) (not e!752714))))

(declare-datatypes ((array!88747 0))(
  ( (array!88748 (arr!42848 (Array (_ BitVec 32) (_ BitVec 64))) (size!43400 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88747)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319265 (= res!875605 (validKeyInArray!0 (select (arr!42848 _keys!1609) from!2000)))))

(declare-fun b!1319266 () Bool)

(declare-fun res!875600 () Bool)

(assert (=> b!1319266 (=> (not res!875600) (not e!752714))))

(declare-datatypes ((List!30450 0))(
  ( (Nil!30447) (Cons!30446 (h!31655 (_ BitVec 64)) (t!44112 List!30450)) )
))
(declare-fun arrayNoDuplicates!0 (array!88747 (_ BitVec 32) List!30450) Bool)

(assert (=> b!1319266 (= res!875600 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30447))))

(declare-fun b!1319267 () Bool)

(declare-fun res!875601 () Bool)

(assert (=> b!1319267 (=> (not res!875601) (not e!752714))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53025 0))(
  ( (V!53026 (val!18045 Int)) )
))
(declare-fun zeroValue!1279 () V!53025)

(declare-datatypes ((ValueCell!17072 0))(
  ( (ValueCellFull!17072 (v!20674 V!53025)) (EmptyCell!17072) )
))
(declare-datatypes ((array!88749 0))(
  ( (array!88750 (arr!42849 (Array (_ BitVec 32) ValueCell!17072)) (size!43401 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88749)

(declare-fun minValue!1279 () V!53025)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23312 0))(
  ( (tuple2!23313 (_1!11667 (_ BitVec 64)) (_2!11667 V!53025)) )
))
(declare-datatypes ((List!30451 0))(
  ( (Nil!30448) (Cons!30447 (h!31656 tuple2!23312) (t!44113 List!30451)) )
))
(declare-datatypes ((ListLongMap!20969 0))(
  ( (ListLongMap!20970 (toList!10500 List!30451)) )
))
(declare-fun contains!8583 (ListLongMap!20969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5393 (array!88747 array!88749 (_ BitVec 32) (_ BitVec 32) V!53025 V!53025 (_ BitVec 32) Int) ListLongMap!20969)

(assert (=> b!1319267 (= res!875601 (contains!8583 (getCurrentListMap!5393 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319268 () Bool)

(declare-fun res!875606 () Bool)

(assert (=> b!1319268 (=> (not res!875606) (not e!752714))))

(assert (=> b!1319268 (= res!875606 (not (= (select (arr!42848 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319269 () Bool)

(declare-fun res!875602 () Bool)

(assert (=> b!1319269 (=> (not res!875602) (not e!752714))))

(assert (=> b!1319269 (= res!875602 (and (= (size!43401 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43400 _keys!1609) (size!43401 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319270 () Bool)

(assert (=> b!1319270 (= e!752714 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!586437 () ListLongMap!20969)

(assert (=> b!1319270 (contains!8583 lt!586437 k0!1164)))

(declare-datatypes ((Unit!43279 0))(
  ( (Unit!43280) )
))
(declare-fun lt!586436 () Unit!43279)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!113 ((_ BitVec 64) (_ BitVec 64) V!53025 ListLongMap!20969) Unit!43279)

(assert (=> b!1319270 (= lt!586436 (lemmaInListMapAfterAddingDiffThenInBefore!113 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586437))))

(declare-fun +!4548 (ListLongMap!20969 tuple2!23312) ListLongMap!20969)

(declare-fun getCurrentListMapNoExtraKeys!6181 (array!88747 array!88749 (_ BitVec 32) (_ BitVec 32) V!53025 V!53025 (_ BitVec 32) Int) ListLongMap!20969)

(declare-fun get!21547 (ValueCell!17072 V!53025) V!53025)

(declare-fun dynLambda!3478 (Int (_ BitVec 64)) V!53025)

(assert (=> b!1319270 (= lt!586437 (+!4548 (+!4548 (getCurrentListMapNoExtraKeys!6181 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23313 (select (arr!42848 _keys!1609) from!2000) (get!21547 (select (arr!42849 _values!1337) from!2000) (dynLambda!3478 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319271 () Bool)

(declare-fun e!752713 () Bool)

(declare-fun e!752715 () Bool)

(declare-fun mapRes!55559 () Bool)

(assert (=> b!1319271 (= e!752713 (and e!752715 mapRes!55559))))

(declare-fun condMapEmpty!55559 () Bool)

(declare-fun mapDefault!55559 () ValueCell!17072)

(assert (=> b!1319271 (= condMapEmpty!55559 (= (arr!42849 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17072)) mapDefault!55559)))))

(declare-fun mapNonEmpty!55559 () Bool)

(declare-fun tp!105839 () Bool)

(declare-fun e!752712 () Bool)

(assert (=> mapNonEmpty!55559 (= mapRes!55559 (and tp!105839 e!752712))))

(declare-fun mapKey!55559 () (_ BitVec 32))

(declare-fun mapRest!55559 () (Array (_ BitVec 32) ValueCell!17072))

(declare-fun mapValue!55559 () ValueCell!17072)

(assert (=> mapNonEmpty!55559 (= (arr!42849 _values!1337) (store mapRest!55559 mapKey!55559 mapValue!55559))))

(declare-fun b!1319272 () Bool)

(declare-fun res!875607 () Bool)

(assert (=> b!1319272 (=> (not res!875607) (not e!752714))))

(assert (=> b!1319272 (= res!875607 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43400 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319273 () Bool)

(declare-fun tp_is_empty!35941 () Bool)

(assert (=> b!1319273 (= e!752712 tp_is_empty!35941)))

(declare-fun b!1319274 () Bool)

(assert (=> b!1319274 (= e!752715 tp_is_empty!35941)))

(declare-fun b!1319275 () Bool)

(declare-fun res!875604 () Bool)

(assert (=> b!1319275 (=> (not res!875604) (not e!752714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88747 (_ BitVec 32)) Bool)

(assert (=> b!1319275 (= res!875604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55559 () Bool)

(assert (=> mapIsEmpty!55559 mapRes!55559))

(declare-fun res!875603 () Bool)

(assert (=> start!111464 (=> (not res!875603) (not e!752714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111464 (= res!875603 (validMask!0 mask!2019))))

(assert (=> start!111464 e!752714))

(declare-fun array_inv!32539 (array!88747) Bool)

(assert (=> start!111464 (array_inv!32539 _keys!1609)))

(assert (=> start!111464 true))

(assert (=> start!111464 tp_is_empty!35941))

(declare-fun array_inv!32540 (array!88749) Bool)

(assert (=> start!111464 (and (array_inv!32540 _values!1337) e!752713)))

(assert (=> start!111464 tp!105840))

(assert (= (and start!111464 res!875603) b!1319269))

(assert (= (and b!1319269 res!875602) b!1319275))

(assert (= (and b!1319275 res!875604) b!1319266))

(assert (= (and b!1319266 res!875600) b!1319272))

(assert (= (and b!1319272 res!875607) b!1319267))

(assert (= (and b!1319267 res!875601) b!1319268))

(assert (= (and b!1319268 res!875606) b!1319265))

(assert (= (and b!1319265 res!875605) b!1319270))

(assert (= (and b!1319271 condMapEmpty!55559) mapIsEmpty!55559))

(assert (= (and b!1319271 (not condMapEmpty!55559)) mapNonEmpty!55559))

(get-info :version)

(assert (= (and mapNonEmpty!55559 ((_ is ValueCellFull!17072) mapValue!55559)) b!1319273))

(assert (= (and b!1319271 ((_ is ValueCellFull!17072) mapDefault!55559)) b!1319274))

(assert (= start!111464 b!1319271))

(declare-fun b_lambda!23437 () Bool)

(assert (=> (not b_lambda!23437) (not b!1319270)))

(declare-fun t!44111 () Bool)

(declare-fun tb!11465 () Bool)

(assert (=> (and start!111464 (= defaultEntry!1340 defaultEntry!1340) t!44111) tb!11465))

(declare-fun result!23993 () Bool)

(assert (=> tb!11465 (= result!23993 tp_is_empty!35941)))

(assert (=> b!1319270 t!44111))

(declare-fun b_and!48385 () Bool)

(assert (= b_and!48383 (and (=> t!44111 result!23993) b_and!48385)))

(declare-fun m!1206411 () Bool)

(assert (=> b!1319265 m!1206411))

(assert (=> b!1319265 m!1206411))

(declare-fun m!1206413 () Bool)

(assert (=> b!1319265 m!1206413))

(declare-fun m!1206415 () Bool)

(assert (=> b!1319266 m!1206415))

(declare-fun m!1206417 () Bool)

(assert (=> mapNonEmpty!55559 m!1206417))

(declare-fun m!1206419 () Bool)

(assert (=> start!111464 m!1206419))

(declare-fun m!1206421 () Bool)

(assert (=> start!111464 m!1206421))

(declare-fun m!1206423 () Bool)

(assert (=> start!111464 m!1206423))

(declare-fun m!1206425 () Bool)

(assert (=> b!1319275 m!1206425))

(declare-fun m!1206427 () Bool)

(assert (=> b!1319270 m!1206427))

(declare-fun m!1206429 () Bool)

(assert (=> b!1319270 m!1206429))

(declare-fun m!1206431 () Bool)

(assert (=> b!1319270 m!1206431))

(declare-fun m!1206433 () Bool)

(assert (=> b!1319270 m!1206433))

(declare-fun m!1206435 () Bool)

(assert (=> b!1319270 m!1206435))

(declare-fun m!1206437 () Bool)

(assert (=> b!1319270 m!1206437))

(assert (=> b!1319270 m!1206433))

(assert (=> b!1319270 m!1206429))

(declare-fun m!1206439 () Bool)

(assert (=> b!1319270 m!1206439))

(assert (=> b!1319270 m!1206411))

(declare-fun m!1206441 () Bool)

(assert (=> b!1319270 m!1206441))

(assert (=> b!1319270 m!1206427))

(assert (=> b!1319270 m!1206435))

(assert (=> b!1319268 m!1206411))

(declare-fun m!1206443 () Bool)

(assert (=> b!1319267 m!1206443))

(assert (=> b!1319267 m!1206443))

(declare-fun m!1206445 () Bool)

(assert (=> b!1319267 m!1206445))

(check-sat (not b!1319267) b_and!48385 (not b!1319275) (not b!1319270) (not start!111464) (not b!1319266) tp_is_empty!35941 (not b!1319265) (not mapNonEmpty!55559) (not b_lambda!23437) (not b_next!30121))
(check-sat b_and!48385 (not b_next!30121))
