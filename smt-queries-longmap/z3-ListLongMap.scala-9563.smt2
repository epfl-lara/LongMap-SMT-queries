; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113240 () Bool)

(assert start!113240)

(declare-fun b_free!31291 () Bool)

(declare-fun b_next!31291 () Bool)

(assert (=> start!113240 (= b_free!31291 (not b_next!31291))))

(declare-fun tp!109679 () Bool)

(declare-fun b_and!50471 () Bool)

(assert (=> start!113240 (= tp!109679 b_and!50471)))

(declare-fun b!1343353 () Bool)

(declare-fun e!764626 () Bool)

(declare-fun tp_is_empty!37291 () Bool)

(assert (=> b!1343353 (= e!764626 tp_is_empty!37291)))

(declare-fun res!891300 () Bool)

(declare-fun e!764629 () Bool)

(assert (=> start!113240 (=> (not res!891300) (not e!764629))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113240 (= res!891300 (validMask!0 mask!1977))))

(assert (=> start!113240 e!764629))

(assert (=> start!113240 tp_is_empty!37291))

(assert (=> start!113240 true))

(declare-datatypes ((array!91369 0))(
  ( (array!91370 (arr!44141 (Array (_ BitVec 32) (_ BitVec 64))) (size!44693 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91369)

(declare-fun array_inv!33461 (array!91369) Bool)

(assert (=> start!113240 (array_inv!33461 _keys!1571)))

(declare-datatypes ((V!54825 0))(
  ( (V!54826 (val!18720 Int)) )
))
(declare-datatypes ((ValueCell!17747 0))(
  ( (ValueCellFull!17747 (v!21367 V!54825)) (EmptyCell!17747) )
))
(declare-datatypes ((array!91371 0))(
  ( (array!91372 (arr!44142 (Array (_ BitVec 32) ValueCell!17747)) (size!44694 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91371)

(declare-fun e!764627 () Bool)

(declare-fun array_inv!33462 (array!91371) Bool)

(assert (=> start!113240 (and (array_inv!33462 _values!1303) e!764627)))

(assert (=> start!113240 tp!109679))

(declare-fun b!1343354 () Bool)

(declare-fun res!891297 () Bool)

(assert (=> b!1343354 (=> (not res!891297) (not e!764629))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343354 (= res!891297 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44693 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343355 () Bool)

(assert (=> b!1343355 (= e!764629 (not true))))

(declare-datatypes ((tuple2!24180 0))(
  ( (tuple2!24181 (_1!12101 (_ BitVec 64)) (_2!12101 V!54825)) )
))
(declare-datatypes ((List!31322 0))(
  ( (Nil!31319) (Cons!31318 (h!32527 tuple2!24180) (t!45816 List!31322)) )
))
(declare-datatypes ((ListLongMap!21837 0))(
  ( (ListLongMap!21838 (toList!10934 List!31322)) )
))
(declare-fun lt!594734 () ListLongMap!21837)

(declare-fun zeroValue!1245 () V!54825)

(declare-fun contains!9039 (ListLongMap!21837 (_ BitVec 64)) Bool)

(declare-fun +!4835 (ListLongMap!21837 tuple2!24180) ListLongMap!21837)

(assert (=> b!1343355 (contains!9039 (+!4835 lt!594734 (tuple2!24181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43912 0))(
  ( (Unit!43913) )
))
(declare-fun lt!594733 () Unit!43912)

(declare-fun addStillContains!1199 (ListLongMap!21837 (_ BitVec 64) V!54825 (_ BitVec 64)) Unit!43912)

(assert (=> b!1343355 (= lt!594733 (addStillContains!1199 lt!594734 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343355 (contains!9039 lt!594734 k0!1142)))

(declare-fun lt!594732 () Unit!43912)

(declare-fun lt!594735 () V!54825)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!374 ((_ BitVec 64) (_ BitVec 64) V!54825 ListLongMap!21837) Unit!43912)

(assert (=> b!1343355 (= lt!594732 (lemmaInListMapAfterAddingDiffThenInBefore!374 k0!1142 (select (arr!44141 _keys!1571) from!1960) lt!594735 lt!594734))))

(declare-fun lt!594730 () ListLongMap!21837)

(assert (=> b!1343355 (contains!9039 lt!594730 k0!1142)))

(declare-fun lt!594731 () Unit!43912)

(assert (=> b!1343355 (= lt!594731 (lemmaInListMapAfterAddingDiffThenInBefore!374 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594730))))

(assert (=> b!1343355 (= lt!594730 (+!4835 lt!594734 (tuple2!24181 (select (arr!44141 _keys!1571) from!1960) lt!594735)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22305 (ValueCell!17747 V!54825) V!54825)

(declare-fun dynLambda!3765 (Int (_ BitVec 64)) V!54825)

(assert (=> b!1343355 (= lt!594735 (get!22305 (select (arr!44142 _values!1303) from!1960) (dynLambda!3765 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54825)

(declare-fun getCurrentListMapNoExtraKeys!6478 (array!91369 array!91371 (_ BitVec 32) (_ BitVec 32) V!54825 V!54825 (_ BitVec 32) Int) ListLongMap!21837)

(assert (=> b!1343355 (= lt!594734 (getCurrentListMapNoExtraKeys!6478 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapIsEmpty!57643 () Bool)

(declare-fun mapRes!57643 () Bool)

(assert (=> mapIsEmpty!57643 mapRes!57643))

(declare-fun b!1343356 () Bool)

(declare-fun res!891299 () Bool)

(assert (=> b!1343356 (=> (not res!891299) (not e!764629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343356 (= res!891299 (validKeyInArray!0 (select (arr!44141 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57643 () Bool)

(declare-fun tp!109678 () Bool)

(assert (=> mapNonEmpty!57643 (= mapRes!57643 (and tp!109678 e!764626))))

(declare-fun mapValue!57643 () ValueCell!17747)

(declare-fun mapRest!57643 () (Array (_ BitVec 32) ValueCell!17747))

(declare-fun mapKey!57643 () (_ BitVec 32))

(assert (=> mapNonEmpty!57643 (= (arr!44142 _values!1303) (store mapRest!57643 mapKey!57643 mapValue!57643))))

(declare-fun b!1343357 () Bool)

(declare-fun res!891301 () Bool)

(assert (=> b!1343357 (=> (not res!891301) (not e!764629))))

(declare-fun getCurrentListMap!5781 (array!91369 array!91371 (_ BitVec 32) (_ BitVec 32) V!54825 V!54825 (_ BitVec 32) Int) ListLongMap!21837)

(assert (=> b!1343357 (= res!891301 (contains!9039 (getCurrentListMap!5781 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343358 () Bool)

(declare-fun res!891302 () Bool)

(assert (=> b!1343358 (=> (not res!891302) (not e!764629))))

(declare-datatypes ((List!31323 0))(
  ( (Nil!31320) (Cons!31319 (h!32528 (_ BitVec 64)) (t!45817 List!31323)) )
))
(declare-fun arrayNoDuplicates!0 (array!91369 (_ BitVec 32) List!31323) Bool)

(assert (=> b!1343358 (= res!891302 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31320))))

(declare-fun b!1343359 () Bool)

(declare-fun res!891298 () Bool)

(assert (=> b!1343359 (=> (not res!891298) (not e!764629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91369 (_ BitVec 32)) Bool)

(assert (=> b!1343359 (= res!891298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343360 () Bool)

(declare-fun res!891303 () Bool)

(assert (=> b!1343360 (=> (not res!891303) (not e!764629))))

(assert (=> b!1343360 (= res!891303 (not (= (select (arr!44141 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343361 () Bool)

(declare-fun e!764628 () Bool)

(assert (=> b!1343361 (= e!764628 tp_is_empty!37291)))

(declare-fun b!1343362 () Bool)

(declare-fun res!891296 () Bool)

(assert (=> b!1343362 (=> (not res!891296) (not e!764629))))

(assert (=> b!1343362 (= res!891296 (and (= (size!44694 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44693 _keys!1571) (size!44694 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343363 () Bool)

(declare-fun res!891304 () Bool)

(assert (=> b!1343363 (=> (not res!891304) (not e!764629))))

(assert (=> b!1343363 (= res!891304 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343364 () Bool)

(assert (=> b!1343364 (= e!764627 (and e!764628 mapRes!57643))))

(declare-fun condMapEmpty!57643 () Bool)

(declare-fun mapDefault!57643 () ValueCell!17747)

(assert (=> b!1343364 (= condMapEmpty!57643 (= (arr!44142 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17747)) mapDefault!57643)))))

(assert (= (and start!113240 res!891300) b!1343362))

(assert (= (and b!1343362 res!891296) b!1343359))

(assert (= (and b!1343359 res!891298) b!1343358))

(assert (= (and b!1343358 res!891302) b!1343354))

(assert (= (and b!1343354 res!891297) b!1343357))

(assert (= (and b!1343357 res!891301) b!1343360))

(assert (= (and b!1343360 res!891303) b!1343356))

(assert (= (and b!1343356 res!891299) b!1343363))

(assert (= (and b!1343363 res!891304) b!1343355))

(assert (= (and b!1343364 condMapEmpty!57643) mapIsEmpty!57643))

(assert (= (and b!1343364 (not condMapEmpty!57643)) mapNonEmpty!57643))

(get-info :version)

(assert (= (and mapNonEmpty!57643 ((_ is ValueCellFull!17747) mapValue!57643)) b!1343353))

(assert (= (and b!1343364 ((_ is ValueCellFull!17747) mapDefault!57643)) b!1343361))

(assert (= start!113240 b!1343364))

(declare-fun b_lambda!24457 () Bool)

(assert (=> (not b_lambda!24457) (not b!1343355)))

(declare-fun t!45815 () Bool)

(declare-fun tb!12297 () Bool)

(assert (=> (and start!113240 (= defaultEntry!1306 defaultEntry!1306) t!45815) tb!12297))

(declare-fun result!25693 () Bool)

(assert (=> tb!12297 (= result!25693 tp_is_empty!37291)))

(assert (=> b!1343355 t!45815))

(declare-fun b_and!50473 () Bool)

(assert (= b_and!50471 (and (=> t!45815 result!25693) b_and!50473)))

(declare-fun m!1230619 () Bool)

(assert (=> b!1343357 m!1230619))

(assert (=> b!1343357 m!1230619))

(declare-fun m!1230621 () Bool)

(assert (=> b!1343357 m!1230621))

(declare-fun m!1230623 () Bool)

(assert (=> b!1343360 m!1230623))

(assert (=> b!1343356 m!1230623))

(assert (=> b!1343356 m!1230623))

(declare-fun m!1230625 () Bool)

(assert (=> b!1343356 m!1230625))

(assert (=> b!1343355 m!1230623))

(declare-fun m!1230627 () Bool)

(assert (=> b!1343355 m!1230627))

(declare-fun m!1230629 () Bool)

(assert (=> b!1343355 m!1230629))

(declare-fun m!1230631 () Bool)

(assert (=> b!1343355 m!1230631))

(declare-fun m!1230633 () Bool)

(assert (=> b!1343355 m!1230633))

(declare-fun m!1230635 () Bool)

(assert (=> b!1343355 m!1230635))

(declare-fun m!1230637 () Bool)

(assert (=> b!1343355 m!1230637))

(declare-fun m!1230639 () Bool)

(assert (=> b!1343355 m!1230639))

(declare-fun m!1230641 () Bool)

(assert (=> b!1343355 m!1230641))

(declare-fun m!1230643 () Bool)

(assert (=> b!1343355 m!1230643))

(assert (=> b!1343355 m!1230623))

(assert (=> b!1343355 m!1230635))

(declare-fun m!1230645 () Bool)

(assert (=> b!1343355 m!1230645))

(assert (=> b!1343355 m!1230637))

(declare-fun m!1230647 () Bool)

(assert (=> b!1343355 m!1230647))

(assert (=> b!1343355 m!1230631))

(declare-fun m!1230649 () Bool)

(assert (=> b!1343355 m!1230649))

(declare-fun m!1230651 () Bool)

(assert (=> start!113240 m!1230651))

(declare-fun m!1230653 () Bool)

(assert (=> start!113240 m!1230653))

(declare-fun m!1230655 () Bool)

(assert (=> start!113240 m!1230655))

(declare-fun m!1230657 () Bool)

(assert (=> b!1343358 m!1230657))

(declare-fun m!1230659 () Bool)

(assert (=> mapNonEmpty!57643 m!1230659))

(declare-fun m!1230661 () Bool)

(assert (=> b!1343359 m!1230661))

(check-sat (not b!1343355) tp_is_empty!37291 (not b_next!31291) (not b_lambda!24457) (not b!1343359) b_and!50473 (not b!1343358) (not start!113240) (not mapNonEmpty!57643) (not b!1343356) (not b!1343357))
(check-sat b_and!50473 (not b_next!31291))
