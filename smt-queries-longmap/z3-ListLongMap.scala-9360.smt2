; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111596 () Bool)

(assert start!111596)

(declare-fun b_free!30253 () Bool)

(declare-fun b_next!30253 () Bool)

(assert (=> start!111596 (= b_free!30253 (not b_next!30253))))

(declare-fun tp!106236 () Bool)

(declare-fun b_and!48647 () Bool)

(assert (=> start!111596 (= tp!106236 b_and!48647)))

(declare-fun mapNonEmpty!55757 () Bool)

(declare-fun mapRes!55757 () Bool)

(declare-fun tp!106235 () Bool)

(declare-fun e!753706 () Bool)

(assert (=> mapNonEmpty!55757 (= mapRes!55757 (and tp!106235 e!753706))))

(declare-datatypes ((V!53201 0))(
  ( (V!53202 (val!18111 Int)) )
))
(declare-datatypes ((ValueCell!17138 0))(
  ( (ValueCellFull!17138 (v!20740 V!53201)) (EmptyCell!17138) )
))
(declare-datatypes ((array!88999 0))(
  ( (array!89000 (arr!42974 (Array (_ BitVec 32) ValueCell!17138)) (size!43526 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88999)

(declare-fun mapKey!55757 () (_ BitVec 32))

(declare-fun mapRest!55757 () (Array (_ BitVec 32) ValueCell!17138))

(declare-fun mapValue!55757 () ValueCell!17138)

(assert (=> mapNonEmpty!55757 (= (arr!42974 _values!1337) (store mapRest!55757 mapKey!55757 mapValue!55757))))

(declare-fun b!1321575 () Bool)

(declare-fun res!877191 () Bool)

(declare-fun e!753704 () Bool)

(assert (=> b!1321575 (=> (not res!877191) (not e!753704))))

(declare-datatypes ((array!89001 0))(
  ( (array!89002 (arr!42975 (Array (_ BitVec 32) (_ BitVec 64))) (size!43527 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89001)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1321575 (= res!877191 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43527 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55757 () Bool)

(assert (=> mapIsEmpty!55757 mapRes!55757))

(declare-fun b!1321576 () Bool)

(declare-fun res!877184 () Bool)

(assert (=> b!1321576 (=> (not res!877184) (not e!753704))))

(declare-datatypes ((List!30539 0))(
  ( (Nil!30536) (Cons!30535 (h!31744 (_ BitVec 64)) (t!44333 List!30539)) )
))
(declare-fun arrayNoDuplicates!0 (array!89001 (_ BitVec 32) List!30539) Bool)

(assert (=> b!1321576 (= res!877184 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30536))))

(declare-fun b!1321577 () Bool)

(declare-fun e!753702 () Bool)

(declare-fun tp_is_empty!36073 () Bool)

(assert (=> b!1321577 (= e!753702 tp_is_empty!36073)))

(declare-fun b!1321578 () Bool)

(assert (=> b!1321578 (= e!753704 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23404 0))(
  ( (tuple2!23405 (_1!11713 (_ BitVec 64)) (_2!11713 V!53201)) )
))
(declare-datatypes ((List!30540 0))(
  ( (Nil!30537) (Cons!30536 (h!31745 tuple2!23404) (t!44334 List!30540)) )
))
(declare-datatypes ((ListLongMap!21061 0))(
  ( (ListLongMap!21062 (toList!10546 List!30540)) )
))
(declare-fun lt!587406 () ListLongMap!21061)

(declare-fun contains!8629 (ListLongMap!21061 (_ BitVec 64)) Bool)

(assert (=> b!1321578 (contains!8629 lt!587406 k0!1164)))

(declare-fun lt!587403 () V!53201)

(declare-datatypes ((Unit!43361 0))(
  ( (Unit!43362) )
))
(declare-fun lt!587401 () Unit!43361)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!154 ((_ BitVec 64) (_ BitVec 64) V!53201 ListLongMap!21061) Unit!43361)

(assert (=> b!1321578 (= lt!587401 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 (select (arr!42975 _keys!1609) from!2000) lt!587403 lt!587406))))

(declare-fun lt!587402 () ListLongMap!21061)

(assert (=> b!1321578 (contains!8629 lt!587402 k0!1164)))

(declare-fun zeroValue!1279 () V!53201)

(declare-fun lt!587405 () Unit!43361)

(assert (=> b!1321578 (= lt!587405 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587402))))

(declare-fun lt!587404 () ListLongMap!21061)

(assert (=> b!1321578 (contains!8629 lt!587404 k0!1164)))

(declare-fun lt!587400 () Unit!43361)

(declare-fun minValue!1279 () V!53201)

(assert (=> b!1321578 (= lt!587400 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587404))))

(declare-fun +!4589 (ListLongMap!21061 tuple2!23404) ListLongMap!21061)

(assert (=> b!1321578 (= lt!587404 (+!4589 lt!587402 (tuple2!23405 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321578 (= lt!587402 (+!4589 lt!587406 (tuple2!23405 (select (arr!42975 _keys!1609) from!2000) lt!587403)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21632 (ValueCell!17138 V!53201) V!53201)

(declare-fun dynLambda!3519 (Int (_ BitVec 64)) V!53201)

(assert (=> b!1321578 (= lt!587403 (get!21632 (select (arr!42974 _values!1337) from!2000) (dynLambda!3519 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6222 (array!89001 array!88999 (_ BitVec 32) (_ BitVec 32) V!53201 V!53201 (_ BitVec 32) Int) ListLongMap!21061)

(assert (=> b!1321578 (= lt!587406 (getCurrentListMapNoExtraKeys!6222 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321579 () Bool)

(declare-fun res!877185 () Bool)

(assert (=> b!1321579 (=> (not res!877185) (not e!753704))))

(assert (=> b!1321579 (= res!877185 (not (= (select (arr!42975 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321580 () Bool)

(declare-fun res!877186 () Bool)

(assert (=> b!1321580 (=> (not res!877186) (not e!753704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89001 (_ BitVec 32)) Bool)

(assert (=> b!1321580 (= res!877186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!877189 () Bool)

(assert (=> start!111596 (=> (not res!877189) (not e!753704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111596 (= res!877189 (validMask!0 mask!2019))))

(assert (=> start!111596 e!753704))

(declare-fun array_inv!32627 (array!89001) Bool)

(assert (=> start!111596 (array_inv!32627 _keys!1609)))

(assert (=> start!111596 true))

(assert (=> start!111596 tp_is_empty!36073))

(declare-fun e!753703 () Bool)

(declare-fun array_inv!32628 (array!88999) Bool)

(assert (=> start!111596 (and (array_inv!32628 _values!1337) e!753703)))

(assert (=> start!111596 tp!106236))

(declare-fun b!1321581 () Bool)

(assert (=> b!1321581 (= e!753706 tp_is_empty!36073)))

(declare-fun b!1321582 () Bool)

(declare-fun res!877187 () Bool)

(assert (=> b!1321582 (=> (not res!877187) (not e!753704))))

(declare-fun getCurrentListMap!5431 (array!89001 array!88999 (_ BitVec 32) (_ BitVec 32) V!53201 V!53201 (_ BitVec 32) Int) ListLongMap!21061)

(assert (=> b!1321582 (= res!877187 (contains!8629 (getCurrentListMap!5431 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321583 () Bool)

(declare-fun res!877188 () Bool)

(assert (=> b!1321583 (=> (not res!877188) (not e!753704))))

(assert (=> b!1321583 (= res!877188 (and (= (size!43526 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43527 _keys!1609) (size!43526 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321584 () Bool)

(declare-fun res!877190 () Bool)

(assert (=> b!1321584 (=> (not res!877190) (not e!753704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321584 (= res!877190 (validKeyInArray!0 (select (arr!42975 _keys!1609) from!2000)))))

(declare-fun b!1321585 () Bool)

(assert (=> b!1321585 (= e!753703 (and e!753702 mapRes!55757))))

(declare-fun condMapEmpty!55757 () Bool)

(declare-fun mapDefault!55757 () ValueCell!17138)

(assert (=> b!1321585 (= condMapEmpty!55757 (= (arr!42974 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17138)) mapDefault!55757)))))

(assert (= (and start!111596 res!877189) b!1321583))

(assert (= (and b!1321583 res!877188) b!1321580))

(assert (= (and b!1321580 res!877186) b!1321576))

(assert (= (and b!1321576 res!877184) b!1321575))

(assert (= (and b!1321575 res!877191) b!1321582))

(assert (= (and b!1321582 res!877187) b!1321579))

(assert (= (and b!1321579 res!877185) b!1321584))

(assert (= (and b!1321584 res!877190) b!1321578))

(assert (= (and b!1321585 condMapEmpty!55757) mapIsEmpty!55757))

(assert (= (and b!1321585 (not condMapEmpty!55757)) mapNonEmpty!55757))

(get-info :version)

(assert (= (and mapNonEmpty!55757 ((_ is ValueCellFull!17138) mapValue!55757)) b!1321581))

(assert (= (and b!1321585 ((_ is ValueCellFull!17138) mapDefault!55757)) b!1321577))

(assert (= start!111596 b!1321585))

(declare-fun b_lambda!23569 () Bool)

(assert (=> (not b_lambda!23569) (not b!1321578)))

(declare-fun t!44332 () Bool)

(declare-fun tb!11597 () Bool)

(assert (=> (and start!111596 (= defaultEntry!1340 defaultEntry!1340) t!44332) tb!11597))

(declare-fun result!24257 () Bool)

(assert (=> tb!11597 (= result!24257 tp_is_empty!36073)))

(assert (=> b!1321578 t!44332))

(declare-fun b_and!48649 () Bool)

(assert (= b_and!48647 (and (=> t!44332 result!24257) b_and!48649)))

(declare-fun m!1209111 () Bool)

(assert (=> b!1321579 m!1209111))

(declare-fun m!1209113 () Bool)

(assert (=> b!1321578 m!1209113))

(declare-fun m!1209115 () Bool)

(assert (=> b!1321578 m!1209115))

(declare-fun m!1209117 () Bool)

(assert (=> b!1321578 m!1209117))

(declare-fun m!1209119 () Bool)

(assert (=> b!1321578 m!1209119))

(declare-fun m!1209121 () Bool)

(assert (=> b!1321578 m!1209121))

(declare-fun m!1209123 () Bool)

(assert (=> b!1321578 m!1209123))

(declare-fun m!1209125 () Bool)

(assert (=> b!1321578 m!1209125))

(declare-fun m!1209127 () Bool)

(assert (=> b!1321578 m!1209127))

(declare-fun m!1209129 () Bool)

(assert (=> b!1321578 m!1209129))

(assert (=> b!1321578 m!1209111))

(declare-fun m!1209131 () Bool)

(assert (=> b!1321578 m!1209131))

(assert (=> b!1321578 m!1209111))

(assert (=> b!1321578 m!1209127))

(assert (=> b!1321578 m!1209119))

(declare-fun m!1209133 () Bool)

(assert (=> b!1321578 m!1209133))

(declare-fun m!1209135 () Bool)

(assert (=> b!1321578 m!1209135))

(declare-fun m!1209137 () Bool)

(assert (=> b!1321580 m!1209137))

(declare-fun m!1209139 () Bool)

(assert (=> b!1321582 m!1209139))

(assert (=> b!1321582 m!1209139))

(declare-fun m!1209141 () Bool)

(assert (=> b!1321582 m!1209141))

(declare-fun m!1209143 () Bool)

(assert (=> start!111596 m!1209143))

(declare-fun m!1209145 () Bool)

(assert (=> start!111596 m!1209145))

(declare-fun m!1209147 () Bool)

(assert (=> start!111596 m!1209147))

(assert (=> b!1321584 m!1209111))

(assert (=> b!1321584 m!1209111))

(declare-fun m!1209149 () Bool)

(assert (=> b!1321584 m!1209149))

(declare-fun m!1209151 () Bool)

(assert (=> mapNonEmpty!55757 m!1209151))

(declare-fun m!1209153 () Bool)

(assert (=> b!1321576 m!1209153))

(check-sat (not b!1321582) (not b_lambda!23569) (not b!1321576) (not b_next!30253) (not b!1321584) tp_is_empty!36073 (not start!111596) b_and!48649 (not mapNonEmpty!55757) (not b!1321578) (not b!1321580))
(check-sat b_and!48649 (not b_next!30253))
