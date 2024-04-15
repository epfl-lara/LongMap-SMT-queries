; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111692 () Bool)

(assert start!111692)

(declare-fun b_free!30349 () Bool)

(declare-fun b_next!30349 () Bool)

(assert (=> start!111692 (= b_free!30349 (not b_next!30349))))

(declare-fun tp!106523 () Bool)

(declare-fun b_and!48839 () Bool)

(assert (=> start!111692 (= tp!106523 b_and!48839)))

(declare-fun b!1323255 () Bool)

(declare-fun res!878341 () Bool)

(declare-fun e!754422 () Bool)

(assert (=> b!1323255 (=> (not res!878341) (not e!754422))))

(declare-datatypes ((array!89187 0))(
  ( (array!89188 (arr!43068 (Array (_ BitVec 32) (_ BitVec 64))) (size!43620 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89187)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89187 (_ BitVec 32)) Bool)

(assert (=> b!1323255 (= res!878341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323256 () Bool)

(declare-fun e!754425 () Bool)

(declare-fun e!754423 () Bool)

(declare-fun mapRes!55901 () Bool)

(assert (=> b!1323256 (= e!754425 (and e!754423 mapRes!55901))))

(declare-fun condMapEmpty!55901 () Bool)

(declare-datatypes ((V!53329 0))(
  ( (V!53330 (val!18159 Int)) )
))
(declare-datatypes ((ValueCell!17186 0))(
  ( (ValueCellFull!17186 (v!20788 V!53329)) (EmptyCell!17186) )
))
(declare-datatypes ((array!89189 0))(
  ( (array!89190 (arr!43069 (Array (_ BitVec 32) ValueCell!17186)) (size!43621 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89189)

(declare-fun mapDefault!55901 () ValueCell!17186)

(assert (=> b!1323256 (= condMapEmpty!55901 (= (arr!43069 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17186)) mapDefault!55901)))))

(declare-fun b!1323257 () Bool)

(declare-fun res!878339 () Bool)

(assert (=> b!1323257 (=> (not res!878339) (not e!754422))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323257 (= res!878339 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43620 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323258 () Bool)

(declare-fun res!878343 () Bool)

(assert (=> b!1323258 (=> (not res!878343) (not e!754422))))

(declare-datatypes ((List!30610 0))(
  ( (Nil!30607) (Cons!30606 (h!31815 (_ BitVec 64)) (t!44500 List!30610)) )
))
(declare-fun arrayNoDuplicates!0 (array!89187 (_ BitVec 32) List!30610) Bool)

(assert (=> b!1323258 (= res!878343 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30607))))

(declare-fun mapNonEmpty!55901 () Bool)

(declare-fun tp!106524 () Bool)

(declare-fun e!754426 () Bool)

(assert (=> mapNonEmpty!55901 (= mapRes!55901 (and tp!106524 e!754426))))

(declare-fun mapValue!55901 () ValueCell!17186)

(declare-fun mapKey!55901 () (_ BitVec 32))

(declare-fun mapRest!55901 () (Array (_ BitVec 32) ValueCell!17186))

(assert (=> mapNonEmpty!55901 (= (arr!43069 _values!1337) (store mapRest!55901 mapKey!55901 mapValue!55901))))

(declare-fun res!878337 () Bool)

(assert (=> start!111692 (=> (not res!878337) (not e!754422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111692 (= res!878337 (validMask!0 mask!2019))))

(assert (=> start!111692 e!754422))

(declare-fun array_inv!32697 (array!89187) Bool)

(assert (=> start!111692 (array_inv!32697 _keys!1609)))

(assert (=> start!111692 true))

(declare-fun tp_is_empty!36169 () Bool)

(assert (=> start!111692 tp_is_empty!36169))

(declare-fun array_inv!32698 (array!89189) Bool)

(assert (=> start!111692 (and (array_inv!32698 _values!1337) e!754425)))

(assert (=> start!111692 tp!106523))

(declare-fun b!1323259 () Bool)

(assert (=> b!1323259 (= e!754426 tp_is_empty!36169)))

(declare-fun b!1323260 () Bool)

(declare-fun res!878338 () Bool)

(assert (=> b!1323260 (=> (not res!878338) (not e!754422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323260 (= res!878338 (validKeyInArray!0 (select (arr!43068 _keys!1609) from!2000)))))

(declare-fun b!1323261 () Bool)

(declare-fun res!878342 () Bool)

(assert (=> b!1323261 (=> (not res!878342) (not e!754422))))

(assert (=> b!1323261 (= res!878342 (not (= (select (arr!43068 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323262 () Bool)

(assert (=> b!1323262 (= e!754422 (not true))))

(declare-datatypes ((tuple2!23476 0))(
  ( (tuple2!23477 (_1!11749 (_ BitVec 64)) (_2!11749 V!53329)) )
))
(declare-datatypes ((List!30611 0))(
  ( (Nil!30608) (Cons!30607 (h!31816 tuple2!23476) (t!44501 List!30611)) )
))
(declare-datatypes ((ListLongMap!21133 0))(
  ( (ListLongMap!21134 (toList!10582 List!30611)) )
))
(declare-fun lt!588746 () ListLongMap!21133)

(declare-fun minValue!1279 () V!53329)

(declare-fun contains!8665 (ListLongMap!21133 (_ BitVec 64)) Bool)

(declare-fun +!4620 (ListLongMap!21133 tuple2!23476) ListLongMap!21133)

(assert (=> b!1323262 (contains!8665 (+!4620 lt!588746 (tuple2!23477 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43423 0))(
  ( (Unit!43424) )
))
(declare-fun lt!588747 () Unit!43423)

(declare-fun addStillContains!1144 (ListLongMap!21133 (_ BitVec 64) V!53329 (_ BitVec 64)) Unit!43423)

(assert (=> b!1323262 (= lt!588747 (addStillContains!1144 lt!588746 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323262 (contains!8665 lt!588746 k0!1164)))

(declare-fun lt!588742 () ListLongMap!21133)

(declare-fun lt!588745 () tuple2!23476)

(assert (=> b!1323262 (= lt!588746 (+!4620 lt!588742 lt!588745))))

(declare-fun lt!588750 () Unit!43423)

(declare-fun zeroValue!1279 () V!53329)

(assert (=> b!1323262 (= lt!588750 (addStillContains!1144 lt!588742 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323262 (contains!8665 lt!588742 k0!1164)))

(declare-fun lt!588743 () Unit!43423)

(declare-fun lt!588748 () V!53329)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!185 ((_ BitVec 64) (_ BitVec 64) V!53329 ListLongMap!21133) Unit!43423)

(assert (=> b!1323262 (= lt!588743 (lemmaInListMapAfterAddingDiffThenInBefore!185 k0!1164 (select (arr!43068 _keys!1609) from!2000) lt!588748 lt!588742))))

(declare-fun lt!588744 () ListLongMap!21133)

(assert (=> b!1323262 (contains!8665 lt!588744 k0!1164)))

(declare-fun lt!588740 () Unit!43423)

(assert (=> b!1323262 (= lt!588740 (lemmaInListMapAfterAddingDiffThenInBefore!185 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588744))))

(declare-fun lt!588749 () ListLongMap!21133)

(assert (=> b!1323262 (contains!8665 lt!588749 k0!1164)))

(declare-fun lt!588741 () Unit!43423)

(assert (=> b!1323262 (= lt!588741 (lemmaInListMapAfterAddingDiffThenInBefore!185 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588749))))

(assert (=> b!1323262 (= lt!588749 (+!4620 lt!588744 lt!588745))))

(assert (=> b!1323262 (= lt!588745 (tuple2!23477 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323262 (= lt!588744 (+!4620 lt!588742 (tuple2!23477 (select (arr!43068 _keys!1609) from!2000) lt!588748)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21695 (ValueCell!17186 V!53329) V!53329)

(declare-fun dynLambda!3550 (Int (_ BitVec 64)) V!53329)

(assert (=> b!1323262 (= lt!588748 (get!21695 (select (arr!43069 _values!1337) from!2000) (dynLambda!3550 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6253 (array!89187 array!89189 (_ BitVec 32) (_ BitVec 32) V!53329 V!53329 (_ BitVec 32) Int) ListLongMap!21133)

(assert (=> b!1323262 (= lt!588742 (getCurrentListMapNoExtraKeys!6253 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1323263 () Bool)

(assert (=> b!1323263 (= e!754423 tp_is_empty!36169)))

(declare-fun b!1323264 () Bool)

(declare-fun res!878336 () Bool)

(assert (=> b!1323264 (=> (not res!878336) (not e!754422))))

(declare-fun getCurrentListMap!5464 (array!89187 array!89189 (_ BitVec 32) (_ BitVec 32) V!53329 V!53329 (_ BitVec 32) Int) ListLongMap!21133)

(assert (=> b!1323264 (= res!878336 (contains!8665 (getCurrentListMap!5464 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323265 () Bool)

(declare-fun res!878340 () Bool)

(assert (=> b!1323265 (=> (not res!878340) (not e!754422))))

(assert (=> b!1323265 (= res!878340 (and (= (size!43621 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43620 _keys!1609) (size!43621 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55901 () Bool)

(assert (=> mapIsEmpty!55901 mapRes!55901))

(assert (= (and start!111692 res!878337) b!1323265))

(assert (= (and b!1323265 res!878340) b!1323255))

(assert (= (and b!1323255 res!878341) b!1323258))

(assert (= (and b!1323258 res!878343) b!1323257))

(assert (= (and b!1323257 res!878339) b!1323264))

(assert (= (and b!1323264 res!878336) b!1323261))

(assert (= (and b!1323261 res!878342) b!1323260))

(assert (= (and b!1323260 res!878338) b!1323262))

(assert (= (and b!1323256 condMapEmpty!55901) mapIsEmpty!55901))

(assert (= (and b!1323256 (not condMapEmpty!55901)) mapNonEmpty!55901))

(get-info :version)

(assert (= (and mapNonEmpty!55901 ((_ is ValueCellFull!17186) mapValue!55901)) b!1323259))

(assert (= (and b!1323256 ((_ is ValueCellFull!17186) mapDefault!55901)) b!1323263))

(assert (= start!111692 b!1323256))

(declare-fun b_lambda!23665 () Bool)

(assert (=> (not b_lambda!23665) (not b!1323262)))

(declare-fun t!44499 () Bool)

(declare-fun tb!11693 () Bool)

(assert (=> (and start!111692 (= defaultEntry!1340 defaultEntry!1340) t!44499) tb!11693))

(declare-fun result!24449 () Bool)

(assert (=> tb!11693 (= result!24449 tp_is_empty!36169)))

(assert (=> b!1323262 t!44499))

(declare-fun b_and!48841 () Bool)

(assert (= b_and!48839 (and (=> t!44499 result!24449) b_and!48841)))

(declare-fun m!1211547 () Bool)

(assert (=> b!1323255 m!1211547))

(declare-fun m!1211549 () Bool)

(assert (=> b!1323258 m!1211549))

(declare-fun m!1211551 () Bool)

(assert (=> b!1323261 m!1211551))

(declare-fun m!1211553 () Bool)

(assert (=> b!1323262 m!1211553))

(declare-fun m!1211555 () Bool)

(assert (=> b!1323262 m!1211555))

(declare-fun m!1211557 () Bool)

(assert (=> b!1323262 m!1211557))

(declare-fun m!1211559 () Bool)

(assert (=> b!1323262 m!1211559))

(declare-fun m!1211561 () Bool)

(assert (=> b!1323262 m!1211561))

(declare-fun m!1211563 () Bool)

(assert (=> b!1323262 m!1211563))

(declare-fun m!1211565 () Bool)

(assert (=> b!1323262 m!1211565))

(declare-fun m!1211567 () Bool)

(assert (=> b!1323262 m!1211567))

(declare-fun m!1211569 () Bool)

(assert (=> b!1323262 m!1211569))

(declare-fun m!1211571 () Bool)

(assert (=> b!1323262 m!1211571))

(declare-fun m!1211573 () Bool)

(assert (=> b!1323262 m!1211573))

(assert (=> b!1323262 m!1211555))

(declare-fun m!1211575 () Bool)

(assert (=> b!1323262 m!1211575))

(declare-fun m!1211577 () Bool)

(assert (=> b!1323262 m!1211577))

(assert (=> b!1323262 m!1211551))

(declare-fun m!1211579 () Bool)

(assert (=> b!1323262 m!1211579))

(assert (=> b!1323262 m!1211573))

(assert (=> b!1323262 m!1211563))

(declare-fun m!1211581 () Bool)

(assert (=> b!1323262 m!1211581))

(assert (=> b!1323262 m!1211551))

(declare-fun m!1211583 () Bool)

(assert (=> b!1323262 m!1211583))

(declare-fun m!1211585 () Bool)

(assert (=> b!1323262 m!1211585))

(declare-fun m!1211587 () Bool)

(assert (=> b!1323262 m!1211587))

(assert (=> b!1323260 m!1211551))

(assert (=> b!1323260 m!1211551))

(declare-fun m!1211589 () Bool)

(assert (=> b!1323260 m!1211589))

(declare-fun m!1211591 () Bool)

(assert (=> mapNonEmpty!55901 m!1211591))

(declare-fun m!1211593 () Bool)

(assert (=> b!1323264 m!1211593))

(assert (=> b!1323264 m!1211593))

(declare-fun m!1211595 () Bool)

(assert (=> b!1323264 m!1211595))

(declare-fun m!1211597 () Bool)

(assert (=> start!111692 m!1211597))

(declare-fun m!1211599 () Bool)

(assert (=> start!111692 m!1211599))

(declare-fun m!1211601 () Bool)

(assert (=> start!111692 m!1211601))

(check-sat (not b!1323264) (not start!111692) (not b_lambda!23665) (not b!1323260) (not b_next!30349) (not b!1323258) tp_is_empty!36169 (not mapNonEmpty!55901) (not b!1323262) b_and!48841 (not b!1323255))
(check-sat b_and!48841 (not b_next!30349))
