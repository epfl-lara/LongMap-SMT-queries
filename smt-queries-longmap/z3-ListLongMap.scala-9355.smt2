; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111790 () Bool)

(assert start!111790)

(declare-fun b_free!30223 () Bool)

(declare-fun b_next!30223 () Bool)

(assert (=> start!111790 (= b_free!30223 (not b_next!30223))))

(declare-fun tp!106144 () Bool)

(declare-fun b_and!48607 () Bool)

(assert (=> start!111790 (= tp!106144 b_and!48607)))

(declare-fun b!1322419 () Bool)

(declare-fun res!877378 () Bool)

(declare-fun e!754356 () Bool)

(assert (=> b!1322419 (=> (not res!877378) (not e!754356))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-datatypes ((array!89093 0))(
  ( (array!89094 (arr!43016 (Array (_ BitVec 32) (_ BitVec 64))) (size!43567 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89093)

(assert (=> b!1322419 (= res!877378 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43567 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322420 () Bool)

(declare-fun res!877373 () Bool)

(assert (=> b!1322420 (=> (not res!877373) (not e!754356))))

(declare-datatypes ((List!30498 0))(
  ( (Nil!30495) (Cons!30494 (h!31712 (_ BitVec 64)) (t!44262 List!30498)) )
))
(declare-fun arrayNoDuplicates!0 (array!89093 (_ BitVec 32) List!30498) Bool)

(assert (=> b!1322420 (= res!877373 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30495))))

(declare-fun b!1322421 () Bool)

(declare-fun res!877371 () Bool)

(assert (=> b!1322421 (=> (not res!877371) (not e!754356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322421 (= res!877371 (validKeyInArray!0 (select (arr!43016 _keys!1609) from!2000)))))

(declare-fun b!1322422 () Bool)

(assert (=> b!1322422 (= e!754356 (not true))))

(declare-datatypes ((V!53161 0))(
  ( (V!53162 (val!18096 Int)) )
))
(declare-datatypes ((tuple2!23344 0))(
  ( (tuple2!23345 (_1!11683 (_ BitVec 64)) (_2!11683 V!53161)) )
))
(declare-datatypes ((List!30499 0))(
  ( (Nil!30496) (Cons!30495 (h!31713 tuple2!23344) (t!44263 List!30499)) )
))
(declare-datatypes ((ListLongMap!21009 0))(
  ( (ListLongMap!21010 (toList!10520 List!30499)) )
))
(declare-fun lt!587749 () ListLongMap!21009)

(declare-fun contains!8687 (ListLongMap!21009 (_ BitVec 64)) Bool)

(assert (=> b!1322422 (contains!8687 lt!587749 k0!1164)))

(declare-datatypes ((Unit!43485 0))(
  ( (Unit!43486) )
))
(declare-fun lt!587747 () Unit!43485)

(declare-fun lt!587751 () V!53161)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!154 ((_ BitVec 64) (_ BitVec 64) V!53161 ListLongMap!21009) Unit!43485)

(assert (=> b!1322422 (= lt!587747 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 (select (arr!43016 _keys!1609) from!2000) lt!587751 lt!587749))))

(declare-fun lt!587752 () ListLongMap!21009)

(assert (=> b!1322422 (contains!8687 lt!587752 k0!1164)))

(declare-fun lt!587750 () Unit!43485)

(declare-fun zeroValue!1279 () V!53161)

(assert (=> b!1322422 (= lt!587750 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587752))))

(declare-fun lt!587748 () ListLongMap!21009)

(assert (=> b!1322422 (contains!8687 lt!587748 k0!1164)))

(declare-fun lt!587753 () Unit!43485)

(declare-fun minValue!1279 () V!53161)

(assert (=> b!1322422 (= lt!587753 (lemmaInListMapAfterAddingDiffThenInBefore!154 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587748))))

(declare-fun +!4599 (ListLongMap!21009 tuple2!23344) ListLongMap!21009)

(assert (=> b!1322422 (= lt!587748 (+!4599 lt!587752 (tuple2!23345 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322422 (= lt!587752 (+!4599 lt!587749 (tuple2!23345 (select (arr!43016 _keys!1609) from!2000) lt!587751)))))

(declare-datatypes ((ValueCell!17123 0))(
  ( (ValueCellFull!17123 (v!20721 V!53161)) (EmptyCell!17123) )
))
(declare-datatypes ((array!89095 0))(
  ( (array!89096 (arr!43017 (Array (_ BitVec 32) ValueCell!17123)) (size!43568 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89095)

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21668 (ValueCell!17123 V!53161) V!53161)

(declare-fun dynLambda!3553 (Int (_ BitVec 64)) V!53161)

(assert (=> b!1322422 (= lt!587751 (get!21668 (select (arr!43017 _values!1337) from!2000) (dynLambda!3553 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6238 (array!89093 array!89095 (_ BitVec 32) (_ BitVec 32) V!53161 V!53161 (_ BitVec 32) Int) ListLongMap!21009)

(assert (=> b!1322422 (= lt!587749 (getCurrentListMapNoExtraKeys!6238 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!55712 () Bool)

(declare-fun mapRes!55712 () Bool)

(declare-fun tp!106145 () Bool)

(declare-fun e!754353 () Bool)

(assert (=> mapNonEmpty!55712 (= mapRes!55712 (and tp!106145 e!754353))))

(declare-fun mapKey!55712 () (_ BitVec 32))

(declare-fun mapValue!55712 () ValueCell!17123)

(declare-fun mapRest!55712 () (Array (_ BitVec 32) ValueCell!17123))

(assert (=> mapNonEmpty!55712 (= (arr!43017 _values!1337) (store mapRest!55712 mapKey!55712 mapValue!55712))))

(declare-fun b!1322423 () Bool)

(declare-fun res!877374 () Bool)

(assert (=> b!1322423 (=> (not res!877374) (not e!754356))))

(declare-fun getCurrentListMap!5516 (array!89093 array!89095 (_ BitVec 32) (_ BitVec 32) V!53161 V!53161 (_ BitVec 32) Int) ListLongMap!21009)

(assert (=> b!1322423 (= res!877374 (contains!8687 (getCurrentListMap!5516 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322424 () Bool)

(declare-fun e!754355 () Bool)

(declare-fun tp_is_empty!36043 () Bool)

(assert (=> b!1322424 (= e!754355 tp_is_empty!36043)))

(declare-fun mapIsEmpty!55712 () Bool)

(assert (=> mapIsEmpty!55712 mapRes!55712))

(declare-fun b!1322426 () Bool)

(declare-fun e!754357 () Bool)

(assert (=> b!1322426 (= e!754357 (and e!754355 mapRes!55712))))

(declare-fun condMapEmpty!55712 () Bool)

(declare-fun mapDefault!55712 () ValueCell!17123)

(assert (=> b!1322426 (= condMapEmpty!55712 (= (arr!43017 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17123)) mapDefault!55712)))))

(declare-fun b!1322427 () Bool)

(declare-fun res!877372 () Bool)

(assert (=> b!1322427 (=> (not res!877372) (not e!754356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89093 (_ BitVec 32)) Bool)

(assert (=> b!1322427 (= res!877372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322428 () Bool)

(declare-fun res!877376 () Bool)

(assert (=> b!1322428 (=> (not res!877376) (not e!754356))))

(assert (=> b!1322428 (= res!877376 (and (= (size!43568 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43567 _keys!1609) (size!43568 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322429 () Bool)

(assert (=> b!1322429 (= e!754353 tp_is_empty!36043)))

(declare-fun res!877377 () Bool)

(assert (=> start!111790 (=> (not res!877377) (not e!754356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111790 (= res!877377 (validMask!0 mask!2019))))

(assert (=> start!111790 e!754356))

(declare-fun array_inv!32751 (array!89093) Bool)

(assert (=> start!111790 (array_inv!32751 _keys!1609)))

(assert (=> start!111790 true))

(assert (=> start!111790 tp_is_empty!36043))

(declare-fun array_inv!32752 (array!89095) Bool)

(assert (=> start!111790 (and (array_inv!32752 _values!1337) e!754357)))

(assert (=> start!111790 tp!106144))

(declare-fun b!1322425 () Bool)

(declare-fun res!877375 () Bool)

(assert (=> b!1322425 (=> (not res!877375) (not e!754356))))

(assert (=> b!1322425 (= res!877375 (not (= (select (arr!43016 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111790 res!877377) b!1322428))

(assert (= (and b!1322428 res!877376) b!1322427))

(assert (= (and b!1322427 res!877372) b!1322420))

(assert (= (and b!1322420 res!877373) b!1322419))

(assert (= (and b!1322419 res!877378) b!1322423))

(assert (= (and b!1322423 res!877374) b!1322425))

(assert (= (and b!1322425 res!877375) b!1322421))

(assert (= (and b!1322421 res!877371) b!1322422))

(assert (= (and b!1322426 condMapEmpty!55712) mapIsEmpty!55712))

(assert (= (and b!1322426 (not condMapEmpty!55712)) mapNonEmpty!55712))

(get-info :version)

(assert (= (and mapNonEmpty!55712 ((_ is ValueCellFull!17123) mapValue!55712)) b!1322429))

(assert (= (and b!1322426 ((_ is ValueCellFull!17123) mapDefault!55712)) b!1322424))

(assert (= start!111790 b!1322426))

(declare-fun b_lambda!23543 () Bool)

(assert (=> (not b_lambda!23543) (not b!1322422)))

(declare-fun t!44261 () Bool)

(declare-fun tb!11567 () Bool)

(assert (=> (and start!111790 (= defaultEntry!1340 defaultEntry!1340) t!44261) tb!11567))

(declare-fun result!24197 () Bool)

(assert (=> tb!11567 (= result!24197 tp_is_empty!36043)))

(assert (=> b!1322422 t!44261))

(declare-fun b_and!48609 () Bool)

(assert (= b_and!48607 (and (=> t!44261 result!24197) b_and!48609)))

(declare-fun m!1210565 () Bool)

(assert (=> b!1322420 m!1210565))

(declare-fun m!1210567 () Bool)

(assert (=> start!111790 m!1210567))

(declare-fun m!1210569 () Bool)

(assert (=> start!111790 m!1210569))

(declare-fun m!1210571 () Bool)

(assert (=> start!111790 m!1210571))

(declare-fun m!1210573 () Bool)

(assert (=> b!1322423 m!1210573))

(assert (=> b!1322423 m!1210573))

(declare-fun m!1210575 () Bool)

(assert (=> b!1322423 m!1210575))

(declare-fun m!1210577 () Bool)

(assert (=> b!1322427 m!1210577))

(declare-fun m!1210579 () Bool)

(assert (=> mapNonEmpty!55712 m!1210579))

(declare-fun m!1210581 () Bool)

(assert (=> b!1322425 m!1210581))

(assert (=> b!1322422 m!1210581))

(declare-fun m!1210583 () Bool)

(assert (=> b!1322422 m!1210583))

(declare-fun m!1210585 () Bool)

(assert (=> b!1322422 m!1210585))

(declare-fun m!1210587 () Bool)

(assert (=> b!1322422 m!1210587))

(declare-fun m!1210589 () Bool)

(assert (=> b!1322422 m!1210589))

(declare-fun m!1210591 () Bool)

(assert (=> b!1322422 m!1210591))

(declare-fun m!1210593 () Bool)

(assert (=> b!1322422 m!1210593))

(declare-fun m!1210595 () Bool)

(assert (=> b!1322422 m!1210595))

(declare-fun m!1210597 () Bool)

(assert (=> b!1322422 m!1210597))

(assert (=> b!1322422 m!1210593))

(declare-fun m!1210599 () Bool)

(assert (=> b!1322422 m!1210599))

(declare-fun m!1210601 () Bool)

(assert (=> b!1322422 m!1210601))

(assert (=> b!1322422 m!1210581))

(assert (=> b!1322422 m!1210599))

(declare-fun m!1210603 () Bool)

(assert (=> b!1322422 m!1210603))

(declare-fun m!1210605 () Bool)

(assert (=> b!1322422 m!1210605))

(assert (=> b!1322421 m!1210581))

(assert (=> b!1322421 m!1210581))

(declare-fun m!1210607 () Bool)

(assert (=> b!1322421 m!1210607))

(check-sat (not b!1322423) (not b!1322427) (not mapNonEmpty!55712) (not b_next!30223) (not b!1322420) (not start!111790) tp_is_empty!36043 (not b_lambda!23543) b_and!48609 (not b!1322421) (not b!1322422))
(check-sat b_and!48609 (not b_next!30223))
