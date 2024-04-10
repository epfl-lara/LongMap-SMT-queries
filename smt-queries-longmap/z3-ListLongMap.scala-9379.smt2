; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111712 () Bool)

(assert start!111712)

(declare-fun b_free!30369 () Bool)

(declare-fun b_next!30369 () Bool)

(assert (=> start!111712 (= b_free!30369 (not b_next!30369))))

(declare-fun tp!106583 () Bool)

(declare-fun b_and!48897 () Bool)

(assert (=> start!111712 (= tp!106583 b_and!48897)))

(declare-fun b!1323675 () Bool)

(declare-fun res!878611 () Bool)

(declare-fun e!754606 () Bool)

(assert (=> b!1323675 (=> (not res!878611) (not e!754606))))

(declare-datatypes ((array!89294 0))(
  ( (array!89295 (arr!43121 (Array (_ BitVec 32) (_ BitVec 64))) (size!43671 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89294)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53355 0))(
  ( (V!53356 (val!18169 Int)) )
))
(declare-datatypes ((ValueCell!17196 0))(
  ( (ValueCellFull!17196 (v!20799 V!53355)) (EmptyCell!17196) )
))
(declare-datatypes ((array!89296 0))(
  ( (array!89297 (arr!43122 (Array (_ BitVec 32) ValueCell!17196)) (size!43672 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89296)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323675 (= res!878611 (and (= (size!43672 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43671 _keys!1609) (size!43672 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55931 () Bool)

(declare-fun mapRes!55931 () Bool)

(assert (=> mapIsEmpty!55931 mapRes!55931))

(declare-fun b!1323676 () Bool)

(declare-fun res!878605 () Bool)

(assert (=> b!1323676 (=> (not res!878605) (not e!754606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89294 (_ BitVec 32)) Bool)

(assert (=> b!1323676 (= res!878605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323677 () Bool)

(declare-fun e!754609 () Bool)

(declare-fun e!754605 () Bool)

(assert (=> b!1323677 (= e!754609 (and e!754605 mapRes!55931))))

(declare-fun condMapEmpty!55931 () Bool)

(declare-fun mapDefault!55931 () ValueCell!17196)

(assert (=> b!1323677 (= condMapEmpty!55931 (= (arr!43122 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17196)) mapDefault!55931)))))

(declare-fun b!1323678 () Bool)

(assert (=> b!1323678 (= e!754606 (not true))))

(declare-datatypes ((tuple2!23422 0))(
  ( (tuple2!23423 (_1!11722 (_ BitVec 64)) (_2!11722 V!53355)) )
))
(declare-datatypes ((List!30565 0))(
  ( (Nil!30562) (Cons!30561 (h!31770 tuple2!23422) (t!44483 List!30565)) )
))
(declare-datatypes ((ListLongMap!21079 0))(
  ( (ListLongMap!21080 (toList!10555 List!30565)) )
))
(declare-fun lt!589261 () ListLongMap!21079)

(declare-fun minValue!1279 () V!53355)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8710 (ListLongMap!21079 (_ BitVec 64)) Bool)

(declare-fun +!4606 (ListLongMap!21079 tuple2!23422) ListLongMap!21079)

(assert (=> b!1323678 (contains!8710 (+!4606 lt!589261 (tuple2!23423 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43632 0))(
  ( (Unit!43633) )
))
(declare-fun lt!589263 () Unit!43632)

(declare-fun addStillContains!1155 (ListLongMap!21079 (_ BitVec 64) V!53355 (_ BitVec 64)) Unit!43632)

(assert (=> b!1323678 (= lt!589263 (addStillContains!1155 lt!589261 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323678 (contains!8710 lt!589261 k0!1164)))

(declare-fun lt!589264 () ListLongMap!21079)

(declare-fun lt!589258 () tuple2!23422)

(assert (=> b!1323678 (= lt!589261 (+!4606 lt!589264 lt!589258))))

(declare-fun lt!589266 () Unit!43632)

(declare-fun zeroValue!1279 () V!53355)

(assert (=> b!1323678 (= lt!589266 (addStillContains!1155 lt!589264 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323678 (contains!8710 lt!589264 k0!1164)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun lt!589262 () Unit!43632)

(declare-fun lt!589259 () V!53355)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!202 ((_ BitVec 64) (_ BitVec 64) V!53355 ListLongMap!21079) Unit!43632)

(assert (=> b!1323678 (= lt!589262 (lemmaInListMapAfterAddingDiffThenInBefore!202 k0!1164 (select (arr!43121 _keys!1609) from!2000) lt!589259 lt!589264))))

(declare-fun lt!589265 () ListLongMap!21079)

(assert (=> b!1323678 (contains!8710 lt!589265 k0!1164)))

(declare-fun lt!589260 () Unit!43632)

(assert (=> b!1323678 (= lt!589260 (lemmaInListMapAfterAddingDiffThenInBefore!202 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589265))))

(declare-fun lt!589257 () ListLongMap!21079)

(assert (=> b!1323678 (contains!8710 lt!589257 k0!1164)))

(declare-fun lt!589256 () Unit!43632)

(assert (=> b!1323678 (= lt!589256 (lemmaInListMapAfterAddingDiffThenInBefore!202 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589257))))

(assert (=> b!1323678 (= lt!589257 (+!4606 lt!589265 lt!589258))))

(assert (=> b!1323678 (= lt!589258 (tuple2!23423 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323678 (= lt!589265 (+!4606 lt!589264 (tuple2!23423 (select (arr!43121 _keys!1609) from!2000) lt!589259)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21720 (ValueCell!17196 V!53355) V!53355)

(declare-fun dynLambda!3545 (Int (_ BitVec 64)) V!53355)

(assert (=> b!1323678 (= lt!589259 (get!21720 (select (arr!43122 _values!1337) from!2000) (dynLambda!3545 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6241 (array!89294 array!89296 (_ BitVec 32) (_ BitVec 32) V!53355 V!53355 (_ BitVec 32) Int) ListLongMap!21079)

(assert (=> b!1323678 (= lt!589264 (getCurrentListMapNoExtraKeys!6241 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323679 () Bool)

(declare-fun res!878612 () Bool)

(assert (=> b!1323679 (=> (not res!878612) (not e!754606))))

(declare-datatypes ((List!30566 0))(
  ( (Nil!30563) (Cons!30562 (h!31771 (_ BitVec 64)) (t!44484 List!30566)) )
))
(declare-fun arrayNoDuplicates!0 (array!89294 (_ BitVec 32) List!30566) Bool)

(assert (=> b!1323679 (= res!878612 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30563))))

(declare-fun b!1323680 () Bool)

(declare-fun res!878607 () Bool)

(assert (=> b!1323680 (=> (not res!878607) (not e!754606))))

(assert (=> b!1323680 (= res!878607 (not (= (select (arr!43121 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55931 () Bool)

(declare-fun tp!106582 () Bool)

(declare-fun e!754607 () Bool)

(assert (=> mapNonEmpty!55931 (= mapRes!55931 (and tp!106582 e!754607))))

(declare-fun mapKey!55931 () (_ BitVec 32))

(declare-fun mapRest!55931 () (Array (_ BitVec 32) ValueCell!17196))

(declare-fun mapValue!55931 () ValueCell!17196)

(assert (=> mapNonEmpty!55931 (= (arr!43122 _values!1337) (store mapRest!55931 mapKey!55931 mapValue!55931))))

(declare-fun b!1323681 () Bool)

(declare-fun res!878606 () Bool)

(assert (=> b!1323681 (=> (not res!878606) (not e!754606))))

(declare-fun getCurrentListMap!5552 (array!89294 array!89296 (_ BitVec 32) (_ BitVec 32) V!53355 V!53355 (_ BitVec 32) Int) ListLongMap!21079)

(assert (=> b!1323681 (= res!878606 (contains!8710 (getCurrentListMap!5552 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323683 () Bool)

(declare-fun res!878610 () Bool)

(assert (=> b!1323683 (=> (not res!878610) (not e!754606))))

(assert (=> b!1323683 (= res!878610 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43671 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323684 () Bool)

(declare-fun tp_is_empty!36189 () Bool)

(assert (=> b!1323684 (= e!754605 tp_is_empty!36189)))

(declare-fun b!1323685 () Bool)

(assert (=> b!1323685 (= e!754607 tp_is_empty!36189)))

(declare-fun res!878609 () Bool)

(assert (=> start!111712 (=> (not res!878609) (not e!754606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111712 (= res!878609 (validMask!0 mask!2019))))

(assert (=> start!111712 e!754606))

(declare-fun array_inv!32553 (array!89294) Bool)

(assert (=> start!111712 (array_inv!32553 _keys!1609)))

(assert (=> start!111712 true))

(assert (=> start!111712 tp_is_empty!36189))

(declare-fun array_inv!32554 (array!89296) Bool)

(assert (=> start!111712 (and (array_inv!32554 _values!1337) e!754609)))

(assert (=> start!111712 tp!106583))

(declare-fun b!1323682 () Bool)

(declare-fun res!878608 () Bool)

(assert (=> b!1323682 (=> (not res!878608) (not e!754606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323682 (= res!878608 (validKeyInArray!0 (select (arr!43121 _keys!1609) from!2000)))))

(assert (= (and start!111712 res!878609) b!1323675))

(assert (= (and b!1323675 res!878611) b!1323676))

(assert (= (and b!1323676 res!878605) b!1323679))

(assert (= (and b!1323679 res!878612) b!1323683))

(assert (= (and b!1323683 res!878610) b!1323681))

(assert (= (and b!1323681 res!878606) b!1323680))

(assert (= (and b!1323680 res!878607) b!1323682))

(assert (= (and b!1323682 res!878608) b!1323678))

(assert (= (and b!1323677 condMapEmpty!55931) mapIsEmpty!55931))

(assert (= (and b!1323677 (not condMapEmpty!55931)) mapNonEmpty!55931))

(get-info :version)

(assert (= (and mapNonEmpty!55931 ((_ is ValueCellFull!17196) mapValue!55931)) b!1323685))

(assert (= (and b!1323677 ((_ is ValueCellFull!17196) mapDefault!55931)) b!1323684))

(assert (= start!111712 b!1323677))

(declare-fun b_lambda!23695 () Bool)

(assert (=> (not b_lambda!23695) (not b!1323678)))

(declare-fun t!44482 () Bool)

(declare-fun tb!11721 () Bool)

(assert (=> (and start!111712 (= defaultEntry!1340 defaultEntry!1340) t!44482) tb!11721))

(declare-fun result!24497 () Bool)

(assert (=> tb!11721 (= result!24497 tp_is_empty!36189)))

(assert (=> b!1323678 t!44482))

(declare-fun b_and!48899 () Bool)

(assert (= b_and!48897 (and (=> t!44482 result!24497) b_and!48899)))

(declare-fun m!1212623 () Bool)

(assert (=> b!1323680 m!1212623))

(declare-fun m!1212625 () Bool)

(assert (=> b!1323681 m!1212625))

(assert (=> b!1323681 m!1212625))

(declare-fun m!1212627 () Bool)

(assert (=> b!1323681 m!1212627))

(declare-fun m!1212629 () Bool)

(assert (=> b!1323678 m!1212629))

(declare-fun m!1212631 () Bool)

(assert (=> b!1323678 m!1212631))

(declare-fun m!1212633 () Bool)

(assert (=> b!1323678 m!1212633))

(declare-fun m!1212635 () Bool)

(assert (=> b!1323678 m!1212635))

(declare-fun m!1212637 () Bool)

(assert (=> b!1323678 m!1212637))

(declare-fun m!1212639 () Bool)

(assert (=> b!1323678 m!1212639))

(declare-fun m!1212641 () Bool)

(assert (=> b!1323678 m!1212641))

(declare-fun m!1212643 () Bool)

(assert (=> b!1323678 m!1212643))

(declare-fun m!1212645 () Bool)

(assert (=> b!1323678 m!1212645))

(assert (=> b!1323678 m!1212629))

(declare-fun m!1212647 () Bool)

(assert (=> b!1323678 m!1212647))

(assert (=> b!1323678 m!1212623))

(declare-fun m!1212649 () Bool)

(assert (=> b!1323678 m!1212649))

(declare-fun m!1212651 () Bool)

(assert (=> b!1323678 m!1212651))

(declare-fun m!1212653 () Bool)

(assert (=> b!1323678 m!1212653))

(assert (=> b!1323678 m!1212637))

(declare-fun m!1212655 () Bool)

(assert (=> b!1323678 m!1212655))

(declare-fun m!1212657 () Bool)

(assert (=> b!1323678 m!1212657))

(assert (=> b!1323678 m!1212623))

(declare-fun m!1212659 () Bool)

(assert (=> b!1323678 m!1212659))

(assert (=> b!1323678 m!1212645))

(declare-fun m!1212661 () Bool)

(assert (=> b!1323678 m!1212661))

(declare-fun m!1212663 () Bool)

(assert (=> b!1323678 m!1212663))

(declare-fun m!1212665 () Bool)

(assert (=> mapNonEmpty!55931 m!1212665))

(declare-fun m!1212667 () Bool)

(assert (=> b!1323676 m!1212667))

(assert (=> b!1323682 m!1212623))

(assert (=> b!1323682 m!1212623))

(declare-fun m!1212669 () Bool)

(assert (=> b!1323682 m!1212669))

(declare-fun m!1212671 () Bool)

(assert (=> b!1323679 m!1212671))

(declare-fun m!1212673 () Bool)

(assert (=> start!111712 m!1212673))

(declare-fun m!1212675 () Bool)

(assert (=> start!111712 m!1212675))

(declare-fun m!1212677 () Bool)

(assert (=> start!111712 m!1212677))

(check-sat tp_is_empty!36189 (not b!1323681) (not start!111712) (not b_lambda!23695) b_and!48899 (not b!1323679) (not b!1323682) (not mapNonEmpty!55931) (not b!1323678) (not b!1323676) (not b_next!30369))
(check-sat b_and!48899 (not b_next!30369))
