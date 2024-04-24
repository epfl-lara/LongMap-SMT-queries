; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112130 () Bool)

(assert start!112130)

(declare-fun b_free!30505 () Bool)

(declare-fun b_next!30505 () Bool)

(assert (=> start!112130 (= b_free!30505 (not b_next!30505))))

(declare-fun tp!106994 () Bool)

(declare-fun b_and!49107 () Bool)

(assert (=> start!112130 (= tp!106994 b_and!49107)))

(declare-fun b!1327417 () Bool)

(declare-fun res!880655 () Bool)

(declare-fun e!756726 () Bool)

(assert (=> b!1327417 (=> (not res!880655) (not e!756726))))

(declare-datatypes ((array!89651 0))(
  ( (array!89652 (arr!43294 (Array (_ BitVec 32) (_ BitVec 64))) (size!43845 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89651)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327417 (= res!880655 (validKeyInArray!0 (select (arr!43294 _keys!1609) from!2000)))))

(declare-fun b!1327418 () Bool)

(declare-fun e!756730 () Bool)

(declare-fun e!756727 () Bool)

(declare-fun mapRes!56139 () Bool)

(assert (=> b!1327418 (= e!756730 (and e!756727 mapRes!56139))))

(declare-fun condMapEmpty!56139 () Bool)

(declare-datatypes ((V!53537 0))(
  ( (V!53538 (val!18237 Int)) )
))
(declare-datatypes ((ValueCell!17264 0))(
  ( (ValueCellFull!17264 (v!20865 V!53537)) (EmptyCell!17264) )
))
(declare-datatypes ((array!89653 0))(
  ( (array!89654 (arr!43295 (Array (_ BitVec 32) ValueCell!17264)) (size!43846 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89653)

(declare-fun mapDefault!56139 () ValueCell!17264)

(assert (=> b!1327418 (= condMapEmpty!56139 (= (arr!43295 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17264)) mapDefault!56139)))))

(declare-fun mapNonEmpty!56139 () Bool)

(declare-fun tp!106995 () Bool)

(declare-fun e!756728 () Bool)

(assert (=> mapNonEmpty!56139 (= mapRes!56139 (and tp!106995 e!756728))))

(declare-fun mapRest!56139 () (Array (_ BitVec 32) ValueCell!17264))

(declare-fun mapValue!56139 () ValueCell!17264)

(declare-fun mapKey!56139 () (_ BitVec 32))

(assert (=> mapNonEmpty!56139 (= (arr!43295 _values!1337) (store mapRest!56139 mapKey!56139 mapValue!56139))))

(declare-fun b!1327419 () Bool)

(declare-fun res!880662 () Bool)

(assert (=> b!1327419 (=> (not res!880662) (not e!756726))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1327419 (= res!880662 (not (= (select (arr!43294 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!880656 () Bool)

(assert (=> start!112130 (=> (not res!880656) (not e!756726))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112130 (= res!880656 (validMask!0 mask!2019))))

(assert (=> start!112130 e!756726))

(declare-fun array_inv!32945 (array!89651) Bool)

(assert (=> start!112130 (array_inv!32945 _keys!1609)))

(assert (=> start!112130 true))

(declare-fun tp_is_empty!36325 () Bool)

(assert (=> start!112130 tp_is_empty!36325))

(declare-fun array_inv!32946 (array!89653) Bool)

(assert (=> start!112130 (and (array_inv!32946 _values!1337) e!756730)))

(assert (=> start!112130 tp!106994))

(declare-fun b!1327420 () Bool)

(assert (=> b!1327420 (= e!756728 tp_is_empty!36325)))

(declare-fun b!1327421 () Bool)

(declare-fun res!880661 () Bool)

(assert (=> b!1327421 (=> (not res!880661) (not e!756726))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1327421 (= res!880661 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43845 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327422 () Bool)

(assert (=> b!1327422 (= e!756726 (not true))))

(declare-datatypes ((tuple2!23558 0))(
  ( (tuple2!23559 (_1!11790 (_ BitVec 64)) (_2!11790 V!53537)) )
))
(declare-datatypes ((List!30710 0))(
  ( (Nil!30707) (Cons!30706 (h!31924 tuple2!23558) (t!44678 List!30710)) )
))
(declare-datatypes ((ListLongMap!21223 0))(
  ( (ListLongMap!21224 (toList!10627 List!30710)) )
))
(declare-fun lt!590414 () ListLongMap!21223)

(declare-fun contains!8795 (ListLongMap!21223 (_ BitVec 64)) Bool)

(assert (=> b!1327422 (contains!8795 lt!590414 k0!1164)))

(declare-fun zeroValue!1279 () V!53537)

(declare-datatypes ((Unit!43635 0))(
  ( (Unit!43636) )
))
(declare-fun lt!590416 () Unit!43635)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!221 ((_ BitVec 64) (_ BitVec 64) V!53537 ListLongMap!21223) Unit!43635)

(assert (=> b!1327422 (= lt!590416 (lemmaInListMapAfterAddingDiffThenInBefore!221 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590414))))

(declare-fun lt!590417 () ListLongMap!21223)

(assert (=> b!1327422 (contains!8795 lt!590417 k0!1164)))

(declare-fun lt!590415 () Unit!43635)

(declare-fun minValue!1279 () V!53537)

(assert (=> b!1327422 (= lt!590415 (lemmaInListMapAfterAddingDiffThenInBefore!221 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590417))))

(declare-fun +!4671 (ListLongMap!21223 tuple2!23558) ListLongMap!21223)

(assert (=> b!1327422 (= lt!590417 (+!4671 lt!590414 (tuple2!23559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6315 (array!89651 array!89653 (_ BitVec 32) (_ BitVec 32) V!53537 V!53537 (_ BitVec 32) Int) ListLongMap!21223)

(declare-fun get!21837 (ValueCell!17264 V!53537) V!53537)

(declare-fun dynLambda!3625 (Int (_ BitVec 64)) V!53537)

(assert (=> b!1327422 (= lt!590414 (+!4671 (getCurrentListMapNoExtraKeys!6315 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23559 (select (arr!43294 _keys!1609) from!2000) (get!21837 (select (arr!43295 _values!1337) from!2000) (dynLambda!3625 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1327423 () Bool)

(declare-fun res!880659 () Bool)

(assert (=> b!1327423 (=> (not res!880659) (not e!756726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89651 (_ BitVec 32)) Bool)

(assert (=> b!1327423 (= res!880659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!56139 () Bool)

(assert (=> mapIsEmpty!56139 mapRes!56139))

(declare-fun b!1327424 () Bool)

(declare-fun res!880660 () Bool)

(assert (=> b!1327424 (=> (not res!880660) (not e!756726))))

(declare-datatypes ((List!30711 0))(
  ( (Nil!30708) (Cons!30707 (h!31925 (_ BitVec 64)) (t!44679 List!30711)) )
))
(declare-fun arrayNoDuplicates!0 (array!89651 (_ BitVec 32) List!30711) Bool)

(assert (=> b!1327424 (= res!880660 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30708))))

(declare-fun b!1327425 () Bool)

(declare-fun res!880658 () Bool)

(assert (=> b!1327425 (=> (not res!880658) (not e!756726))))

(assert (=> b!1327425 (= res!880658 (and (= (size!43846 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43845 _keys!1609) (size!43846 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1327426 () Bool)

(assert (=> b!1327426 (= e!756727 tp_is_empty!36325)))

(declare-fun b!1327427 () Bool)

(declare-fun res!880657 () Bool)

(assert (=> b!1327427 (=> (not res!880657) (not e!756726))))

(declare-fun getCurrentListMap!5606 (array!89651 array!89653 (_ BitVec 32) (_ BitVec 32) V!53537 V!53537 (_ BitVec 32) Int) ListLongMap!21223)

(assert (=> b!1327427 (= res!880657 (contains!8795 (getCurrentListMap!5606 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!112130 res!880656) b!1327425))

(assert (= (and b!1327425 res!880658) b!1327423))

(assert (= (and b!1327423 res!880659) b!1327424))

(assert (= (and b!1327424 res!880660) b!1327421))

(assert (= (and b!1327421 res!880661) b!1327427))

(assert (= (and b!1327427 res!880657) b!1327419))

(assert (= (and b!1327419 res!880662) b!1327417))

(assert (= (and b!1327417 res!880655) b!1327422))

(assert (= (and b!1327418 condMapEmpty!56139) mapIsEmpty!56139))

(assert (= (and b!1327418 (not condMapEmpty!56139)) mapNonEmpty!56139))

(get-info :version)

(assert (= (and mapNonEmpty!56139 ((_ is ValueCellFull!17264) mapValue!56139)) b!1327420))

(assert (= (and b!1327418 ((_ is ValueCellFull!17264) mapDefault!56139)) b!1327426))

(assert (= start!112130 b!1327418))

(declare-fun b_lambda!23777 () Bool)

(assert (=> (not b_lambda!23777) (not b!1327422)))

(declare-fun t!44677 () Bool)

(declare-fun tb!11771 () Bool)

(assert (=> (and start!112130 (= defaultEntry!1340 defaultEntry!1340) t!44677) tb!11771))

(declare-fun result!24607 () Bool)

(assert (=> tb!11771 (= result!24607 tp_is_empty!36325)))

(assert (=> b!1327422 t!44677))

(declare-fun b_and!49109 () Bool)

(assert (= b_and!49107 (and (=> t!44677 result!24607) b_and!49109)))

(declare-fun m!1216647 () Bool)

(assert (=> b!1327427 m!1216647))

(assert (=> b!1327427 m!1216647))

(declare-fun m!1216649 () Bool)

(assert (=> b!1327427 m!1216649))

(declare-fun m!1216651 () Bool)

(assert (=> start!112130 m!1216651))

(declare-fun m!1216653 () Bool)

(assert (=> start!112130 m!1216653))

(declare-fun m!1216655 () Bool)

(assert (=> start!112130 m!1216655))

(declare-fun m!1216657 () Bool)

(assert (=> b!1327419 m!1216657))

(assert (=> b!1327417 m!1216657))

(assert (=> b!1327417 m!1216657))

(declare-fun m!1216659 () Bool)

(assert (=> b!1327417 m!1216659))

(declare-fun m!1216661 () Bool)

(assert (=> b!1327422 m!1216661))

(declare-fun m!1216663 () Bool)

(assert (=> b!1327422 m!1216663))

(declare-fun m!1216665 () Bool)

(assert (=> b!1327422 m!1216665))

(assert (=> b!1327422 m!1216663))

(declare-fun m!1216667 () Bool)

(assert (=> b!1327422 m!1216667))

(declare-fun m!1216669 () Bool)

(assert (=> b!1327422 m!1216669))

(declare-fun m!1216671 () Bool)

(assert (=> b!1327422 m!1216671))

(declare-fun m!1216673 () Bool)

(assert (=> b!1327422 m!1216673))

(declare-fun m!1216675 () Bool)

(assert (=> b!1327422 m!1216675))

(assert (=> b!1327422 m!1216675))

(assert (=> b!1327422 m!1216665))

(declare-fun m!1216677 () Bool)

(assert (=> b!1327422 m!1216677))

(declare-fun m!1216679 () Bool)

(assert (=> b!1327422 m!1216679))

(assert (=> b!1327422 m!1216657))

(declare-fun m!1216681 () Bool)

(assert (=> mapNonEmpty!56139 m!1216681))

(declare-fun m!1216683 () Bool)

(assert (=> b!1327423 m!1216683))

(declare-fun m!1216685 () Bool)

(assert (=> b!1327424 m!1216685))

(check-sat (not b!1327422) b_and!49109 tp_is_empty!36325 (not mapNonEmpty!56139) (not b_lambda!23777) (not b!1327427) (not b!1327417) (not b_next!30505) (not b!1327424) (not b!1327423) (not start!112130))
(check-sat b_and!49109 (not b_next!30505))
