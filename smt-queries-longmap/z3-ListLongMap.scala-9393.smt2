; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111796 () Bool)

(assert start!111796)

(declare-fun b_free!30453 () Bool)

(declare-fun b_next!30453 () Bool)

(assert (=> start!111796 (= b_free!30453 (not b_next!30453))))

(declare-fun tp!106834 () Bool)

(declare-fun b_and!48991 () Bool)

(assert (=> start!111796 (= tp!106834 b_and!48991)))

(declare-fun b!1324801 () Bool)

(declare-fun res!879344 () Bool)

(declare-fun e!755236 () Bool)

(assert (=> b!1324801 (=> (not res!879344) (not e!755236))))

(declare-datatypes ((array!89454 0))(
  ( (array!89455 (arr!43201 (Array (_ BitVec 32) (_ BitVec 64))) (size!43751 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89454)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1324801 (= res!879344 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43751 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324802 () Bool)

(declare-fun res!879346 () Bool)

(assert (=> b!1324802 (=> (not res!879346) (not e!755236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324802 (= res!879346 (validKeyInArray!0 (select (arr!43201 _keys!1609) from!2000)))))

(declare-fun b!1324803 () Bool)

(declare-fun res!879347 () Bool)

(assert (=> b!1324803 (=> (not res!879347) (not e!755236))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89454 (_ BitVec 32)) Bool)

(assert (=> b!1324803 (= res!879347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324804 () Bool)

(declare-fun res!879345 () Bool)

(assert (=> b!1324804 (=> (not res!879345) (not e!755236))))

(assert (=> b!1324804 (= res!879345 (not (= (select (arr!43201 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324805 () Bool)

(declare-fun res!879343 () Bool)

(assert (=> b!1324805 (=> (not res!879343) (not e!755236))))

(declare-datatypes ((List!30624 0))(
  ( (Nil!30621) (Cons!30620 (h!31829 (_ BitVec 64)) (t!44550 List!30624)) )
))
(declare-fun arrayNoDuplicates!0 (array!89454 (_ BitVec 32) List!30624) Bool)

(assert (=> b!1324805 (= res!879343 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30621))))

(declare-fun b!1324806 () Bool)

(declare-fun res!879350 () Bool)

(assert (=> b!1324806 (=> (not res!879350) (not e!755236))))

(declare-datatypes ((V!53467 0))(
  ( (V!53468 (val!18211 Int)) )
))
(declare-datatypes ((ValueCell!17238 0))(
  ( (ValueCellFull!17238 (v!20841 V!53467)) (EmptyCell!17238) )
))
(declare-datatypes ((array!89456 0))(
  ( (array!89457 (arr!43202 (Array (_ BitVec 32) ValueCell!17238)) (size!43752 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89456)

(assert (=> b!1324806 (= res!879350 (and (= (size!43752 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43751 _keys!1609) (size!43752 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56057 () Bool)

(declare-fun mapRes!56057 () Bool)

(assert (=> mapIsEmpty!56057 mapRes!56057))

(declare-fun res!879348 () Bool)

(assert (=> start!111796 (=> (not res!879348) (not e!755236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111796 (= res!879348 (validMask!0 mask!2019))))

(assert (=> start!111796 e!755236))

(declare-fun array_inv!32607 (array!89454) Bool)

(assert (=> start!111796 (array_inv!32607 _keys!1609)))

(assert (=> start!111796 true))

(declare-fun tp_is_empty!36273 () Bool)

(assert (=> start!111796 tp_is_empty!36273))

(declare-fun e!755235 () Bool)

(declare-fun array_inv!32608 (array!89456) Bool)

(assert (=> start!111796 (and (array_inv!32608 _values!1337) e!755235)))

(assert (=> start!111796 tp!106834))

(declare-fun b!1324807 () Bool)

(declare-fun res!879349 () Bool)

(assert (=> b!1324807 (=> (not res!879349) (not e!755236))))

(declare-fun zeroValue!1279 () V!53467)

(declare-fun minValue!1279 () V!53467)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23484 0))(
  ( (tuple2!23485 (_1!11753 (_ BitVec 64)) (_2!11753 V!53467)) )
))
(declare-datatypes ((List!30625 0))(
  ( (Nil!30622) (Cons!30621 (h!31830 tuple2!23484) (t!44551 List!30625)) )
))
(declare-datatypes ((ListLongMap!21141 0))(
  ( (ListLongMap!21142 (toList!10586 List!30625)) )
))
(declare-fun contains!8741 (ListLongMap!21141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5582 (array!89454 array!89456 (_ BitVec 32) (_ BitVec 32) V!53467 V!53467 (_ BitVec 32) Int) ListLongMap!21141)

(assert (=> b!1324807 (= res!879349 (contains!8741 (getCurrentListMap!5582 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324808 () Bool)

(declare-fun e!755239 () Bool)

(assert (=> b!1324808 (= e!755239 tp_is_empty!36273)))

(declare-fun b!1324809 () Bool)

(declare-fun e!755237 () Bool)

(assert (=> b!1324809 (= e!755237 tp_is_empty!36273)))

(declare-fun b!1324810 () Bool)

(assert (=> b!1324810 (= e!755236 (bvsge from!2000 (size!43752 _values!1337)))))

(declare-fun lt!589503 () ListLongMap!21141)

(declare-fun getCurrentListMapNoExtraKeys!6248 (array!89454 array!89456 (_ BitVec 32) (_ BitVec 32) V!53467 V!53467 (_ BitVec 32) Int) ListLongMap!21141)

(assert (=> b!1324810 (= lt!589503 (getCurrentListMapNoExtraKeys!6248 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!56057 () Bool)

(declare-fun tp!106835 () Bool)

(assert (=> mapNonEmpty!56057 (= mapRes!56057 (and tp!106835 e!755237))))

(declare-fun mapValue!56057 () ValueCell!17238)

(declare-fun mapKey!56057 () (_ BitVec 32))

(declare-fun mapRest!56057 () (Array (_ BitVec 32) ValueCell!17238))

(assert (=> mapNonEmpty!56057 (= (arr!43202 _values!1337) (store mapRest!56057 mapKey!56057 mapValue!56057))))

(declare-fun b!1324811 () Bool)

(assert (=> b!1324811 (= e!755235 (and e!755239 mapRes!56057))))

(declare-fun condMapEmpty!56057 () Bool)

(declare-fun mapDefault!56057 () ValueCell!17238)

(assert (=> b!1324811 (= condMapEmpty!56057 (= (arr!43202 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17238)) mapDefault!56057)))))

(assert (= (and start!111796 res!879348) b!1324806))

(assert (= (and b!1324806 res!879350) b!1324803))

(assert (= (and b!1324803 res!879347) b!1324805))

(assert (= (and b!1324805 res!879343) b!1324801))

(assert (= (and b!1324801 res!879344) b!1324807))

(assert (= (and b!1324807 res!879349) b!1324804))

(assert (= (and b!1324804 res!879345) b!1324802))

(assert (= (and b!1324802 res!879346) b!1324810))

(assert (= (and b!1324811 condMapEmpty!56057) mapIsEmpty!56057))

(assert (= (and b!1324811 (not condMapEmpty!56057)) mapNonEmpty!56057))

(get-info :version)

(assert (= (and mapNonEmpty!56057 ((_ is ValueCellFull!17238) mapValue!56057)) b!1324809))

(assert (= (and b!1324811 ((_ is ValueCellFull!17238) mapDefault!56057)) b!1324808))

(assert (= start!111796 b!1324811))

(declare-fun m!1213531 () Bool)

(assert (=> b!1324804 m!1213531))

(declare-fun m!1213533 () Bool)

(assert (=> b!1324807 m!1213533))

(assert (=> b!1324807 m!1213533))

(declare-fun m!1213535 () Bool)

(assert (=> b!1324807 m!1213535))

(declare-fun m!1213537 () Bool)

(assert (=> b!1324803 m!1213537))

(declare-fun m!1213539 () Bool)

(assert (=> b!1324805 m!1213539))

(assert (=> b!1324802 m!1213531))

(assert (=> b!1324802 m!1213531))

(declare-fun m!1213541 () Bool)

(assert (=> b!1324802 m!1213541))

(declare-fun m!1213543 () Bool)

(assert (=> b!1324810 m!1213543))

(declare-fun m!1213545 () Bool)

(assert (=> start!111796 m!1213545))

(declare-fun m!1213547 () Bool)

(assert (=> start!111796 m!1213547))

(declare-fun m!1213549 () Bool)

(assert (=> start!111796 m!1213549))

(declare-fun m!1213551 () Bool)

(assert (=> mapNonEmpty!56057 m!1213551))

(check-sat (not b!1324805) (not b!1324807) (not mapNonEmpty!56057) (not b_next!30453) tp_is_empty!36273 (not start!111796) (not b!1324802) (not b!1324803) b_and!48991 (not b!1324810))
(check-sat b_and!48991 (not b_next!30453))
