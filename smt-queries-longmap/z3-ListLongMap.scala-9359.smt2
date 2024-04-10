; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111592 () Bool)

(assert start!111592)

(declare-fun b_free!30249 () Bool)

(declare-fun b_next!30249 () Bool)

(assert (=> start!111592 (= b_free!30249 (not b_next!30249))))

(declare-fun tp!106223 () Bool)

(declare-fun b_and!48657 () Bool)

(assert (=> start!111592 (= tp!106223 b_and!48657)))

(declare-fun b!1321575 () Bool)

(declare-fun res!877172 () Bool)

(declare-fun e!753705 () Bool)

(assert (=> b!1321575 (=> (not res!877172) (not e!753705))))

(declare-datatypes ((array!89062 0))(
  ( (array!89063 (arr!43005 (Array (_ BitVec 32) (_ BitVec 64))) (size!43555 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89062)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321575 (= res!877172 (validKeyInArray!0 (select (arr!43005 _keys!1609) from!2000)))))

(declare-fun b!1321576 () Bool)

(declare-fun res!877166 () Bool)

(assert (=> b!1321576 (=> (not res!877166) (not e!753705))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321576 (= res!877166 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43555 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321577 () Bool)

(declare-fun res!877165 () Bool)

(assert (=> b!1321577 (=> (not res!877165) (not e!753705))))

(declare-datatypes ((List!30472 0))(
  ( (Nil!30469) (Cons!30468 (h!31677 (_ BitVec 64)) (t!44270 List!30472)) )
))
(declare-fun arrayNoDuplicates!0 (array!89062 (_ BitVec 32) List!30472) Bool)

(assert (=> b!1321577 (= res!877165 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30469))))

(declare-fun b!1321578 () Bool)

(declare-fun res!877167 () Bool)

(assert (=> b!1321578 (=> (not res!877167) (not e!753705))))

(declare-datatypes ((V!53195 0))(
  ( (V!53196 (val!18109 Int)) )
))
(declare-fun zeroValue!1279 () V!53195)

(declare-datatypes ((ValueCell!17136 0))(
  ( (ValueCellFull!17136 (v!20739 V!53195)) (EmptyCell!17136) )
))
(declare-datatypes ((array!89064 0))(
  ( (array!89065 (arr!43006 (Array (_ BitVec 32) ValueCell!17136)) (size!43556 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89064)

(declare-fun minValue!1279 () V!53195)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23324 0))(
  ( (tuple2!23325 (_1!11673 (_ BitVec 64)) (_2!11673 V!53195)) )
))
(declare-datatypes ((List!30473 0))(
  ( (Nil!30470) (Cons!30469 (h!31678 tuple2!23324) (t!44271 List!30473)) )
))
(declare-datatypes ((ListLongMap!20981 0))(
  ( (ListLongMap!20982 (toList!10506 List!30473)) )
))
(declare-fun contains!8661 (ListLongMap!20981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5507 (array!89062 array!89064 (_ BitVec 32) (_ BitVec 32) V!53195 V!53195 (_ BitVec 32) Int) ListLongMap!20981)

(assert (=> b!1321578 (= res!877167 (contains!8661 (getCurrentListMap!5507 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321579 () Bool)

(declare-fun e!753707 () Bool)

(declare-fun tp_is_empty!36069 () Bool)

(assert (=> b!1321579 (= e!753707 tp_is_empty!36069)))

(declare-fun b!1321580 () Bool)

(declare-fun res!877168 () Bool)

(assert (=> b!1321580 (=> (not res!877168) (not e!753705))))

(assert (=> b!1321580 (= res!877168 (and (= (size!43556 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43555 _keys!1609) (size!43556 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321581 () Bool)

(declare-fun e!753709 () Bool)

(assert (=> b!1321581 (= e!753709 tp_is_empty!36069)))

(declare-fun b!1321582 () Bool)

(declare-fun e!753708 () Bool)

(declare-fun mapRes!55751 () Bool)

(assert (=> b!1321582 (= e!753708 (and e!753707 mapRes!55751))))

(declare-fun condMapEmpty!55751 () Bool)

(declare-fun mapDefault!55751 () ValueCell!17136)

(assert (=> b!1321582 (= condMapEmpty!55751 (= (arr!43006 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17136)) mapDefault!55751)))))

(declare-fun b!1321583 () Bool)

(declare-fun res!877170 () Bool)

(assert (=> b!1321583 (=> (not res!877170) (not e!753705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89062 (_ BitVec 32)) Bool)

(assert (=> b!1321583 (= res!877170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!877169 () Bool)

(assert (=> start!111592 (=> (not res!877169) (not e!753705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111592 (= res!877169 (validMask!0 mask!2019))))

(assert (=> start!111592 e!753705))

(declare-fun array_inv!32465 (array!89062) Bool)

(assert (=> start!111592 (array_inv!32465 _keys!1609)))

(assert (=> start!111592 true))

(assert (=> start!111592 tp_is_empty!36069))

(declare-fun array_inv!32466 (array!89064) Bool)

(assert (=> start!111592 (and (array_inv!32466 _values!1337) e!753708)))

(assert (=> start!111592 tp!106223))

(declare-fun mapIsEmpty!55751 () Bool)

(assert (=> mapIsEmpty!55751 mapRes!55751))

(declare-fun b!1321584 () Bool)

(declare-fun res!877171 () Bool)

(assert (=> b!1321584 (=> (not res!877171) (not e!753705))))

(assert (=> b!1321584 (= res!877171 (not (= (select (arr!43005 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55751 () Bool)

(declare-fun tp!106222 () Bool)

(assert (=> mapNonEmpty!55751 (= mapRes!55751 (and tp!106222 e!753709))))

(declare-fun mapRest!55751 () (Array (_ BitVec 32) ValueCell!17136))

(declare-fun mapKey!55751 () (_ BitVec 32))

(declare-fun mapValue!55751 () ValueCell!17136)

(assert (=> mapNonEmpty!55751 (= (arr!43006 _values!1337) (store mapRest!55751 mapKey!55751 mapValue!55751))))

(declare-fun b!1321585 () Bool)

(assert (=> b!1321585 (= e!753705 (not true))))

(declare-fun lt!587547 () ListLongMap!20981)

(assert (=> b!1321585 (contains!8661 lt!587547 k0!1164)))

(declare-fun lt!587546 () V!53195)

(declare-datatypes ((Unit!43546 0))(
  ( (Unit!43547) )
))
(declare-fun lt!587545 () Unit!43546)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!159 ((_ BitVec 64) (_ BitVec 64) V!53195 ListLongMap!20981) Unit!43546)

(assert (=> b!1321585 (= lt!587545 (lemmaInListMapAfterAddingDiffThenInBefore!159 k0!1164 (select (arr!43005 _keys!1609) from!2000) lt!587546 lt!587547))))

(declare-fun lt!587548 () ListLongMap!20981)

(assert (=> b!1321585 (contains!8661 lt!587548 k0!1164)))

(declare-fun lt!587544 () Unit!43546)

(assert (=> b!1321585 (= lt!587544 (lemmaInListMapAfterAddingDiffThenInBefore!159 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587548))))

(declare-fun lt!587549 () ListLongMap!20981)

(assert (=> b!1321585 (contains!8661 lt!587549 k0!1164)))

(declare-fun lt!587550 () Unit!43546)

(assert (=> b!1321585 (= lt!587550 (lemmaInListMapAfterAddingDiffThenInBefore!159 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587549))))

(declare-fun +!4563 (ListLongMap!20981 tuple2!23324) ListLongMap!20981)

(assert (=> b!1321585 (= lt!587549 (+!4563 lt!587548 (tuple2!23325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321585 (= lt!587548 (+!4563 lt!587547 (tuple2!23325 (select (arr!43005 _keys!1609) from!2000) lt!587546)))))

(declare-fun get!21637 (ValueCell!17136 V!53195) V!53195)

(declare-fun dynLambda!3502 (Int (_ BitVec 64)) V!53195)

(assert (=> b!1321585 (= lt!587546 (get!21637 (select (arr!43006 _values!1337) from!2000) (dynLambda!3502 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6198 (array!89062 array!89064 (_ BitVec 32) (_ BitVec 32) V!53195 V!53195 (_ BitVec 32) Int) ListLongMap!20981)

(assert (=> b!1321585 (= lt!587547 (getCurrentListMapNoExtraKeys!6198 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(assert (= (and start!111592 res!877169) b!1321580))

(assert (= (and b!1321580 res!877168) b!1321583))

(assert (= (and b!1321583 res!877170) b!1321577))

(assert (= (and b!1321577 res!877165) b!1321576))

(assert (= (and b!1321576 res!877166) b!1321578))

(assert (= (and b!1321578 res!877167) b!1321584))

(assert (= (and b!1321584 res!877171) b!1321575))

(assert (= (and b!1321575 res!877172) b!1321585))

(assert (= (and b!1321582 condMapEmpty!55751) mapIsEmpty!55751))

(assert (= (and b!1321582 (not condMapEmpty!55751)) mapNonEmpty!55751))

(get-info :version)

(assert (= (and mapNonEmpty!55751 ((_ is ValueCellFull!17136) mapValue!55751)) b!1321581))

(assert (= (and b!1321582 ((_ is ValueCellFull!17136) mapDefault!55751)) b!1321579))

(assert (= start!111592 b!1321582))

(declare-fun b_lambda!23575 () Bool)

(assert (=> (not b_lambda!23575) (not b!1321585)))

(declare-fun t!44269 () Bool)

(declare-fun tb!11601 () Bool)

(assert (=> (and start!111592 (= defaultEntry!1340 defaultEntry!1340) t!44269) tb!11601))

(declare-fun result!24257 () Bool)

(assert (=> tb!11601 (= result!24257 tp_is_empty!36069)))

(assert (=> b!1321585 t!44269))

(declare-fun b_and!48659 () Bool)

(assert (= b_and!48657 (and (=> t!44269 result!24257) b_and!48659)))

(declare-fun m!1209539 () Bool)

(assert (=> b!1321577 m!1209539))

(declare-fun m!1209541 () Bool)

(assert (=> start!111592 m!1209541))

(declare-fun m!1209543 () Bool)

(assert (=> start!111592 m!1209543))

(declare-fun m!1209545 () Bool)

(assert (=> start!111592 m!1209545))

(declare-fun m!1209547 () Bool)

(assert (=> b!1321578 m!1209547))

(assert (=> b!1321578 m!1209547))

(declare-fun m!1209549 () Bool)

(assert (=> b!1321578 m!1209549))

(declare-fun m!1209551 () Bool)

(assert (=> b!1321583 m!1209551))

(declare-fun m!1209553 () Bool)

(assert (=> mapNonEmpty!55751 m!1209553))

(declare-fun m!1209555 () Bool)

(assert (=> b!1321585 m!1209555))

(declare-fun m!1209557 () Bool)

(assert (=> b!1321585 m!1209557))

(declare-fun m!1209559 () Bool)

(assert (=> b!1321585 m!1209559))

(declare-fun m!1209561 () Bool)

(assert (=> b!1321585 m!1209561))

(declare-fun m!1209563 () Bool)

(assert (=> b!1321585 m!1209563))

(declare-fun m!1209565 () Bool)

(assert (=> b!1321585 m!1209565))

(declare-fun m!1209567 () Bool)

(assert (=> b!1321585 m!1209567))

(declare-fun m!1209569 () Bool)

(assert (=> b!1321585 m!1209569))

(declare-fun m!1209571 () Bool)

(assert (=> b!1321585 m!1209571))

(declare-fun m!1209573 () Bool)

(assert (=> b!1321585 m!1209573))

(declare-fun m!1209575 () Bool)

(assert (=> b!1321585 m!1209575))

(assert (=> b!1321585 m!1209567))

(declare-fun m!1209577 () Bool)

(assert (=> b!1321585 m!1209577))

(assert (=> b!1321585 m!1209561))

(assert (=> b!1321585 m!1209557))

(declare-fun m!1209579 () Bool)

(assert (=> b!1321585 m!1209579))

(assert (=> b!1321575 m!1209567))

(assert (=> b!1321575 m!1209567))

(declare-fun m!1209581 () Bool)

(assert (=> b!1321575 m!1209581))

(assert (=> b!1321584 m!1209567))

(check-sat (not start!111592) (not b_lambda!23575) tp_is_empty!36069 (not b_next!30249) (not b!1321575) (not b!1321585) (not b!1321578) (not mapNonEmpty!55751) (not b!1321577) b_and!48659 (not b!1321583))
(check-sat b_and!48659 (not b_next!30249))
