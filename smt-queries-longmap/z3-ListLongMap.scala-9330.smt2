; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111640 () Bool)

(assert start!111640)

(declare-fun b_free!30073 () Bool)

(declare-fun b_next!30073 () Bool)

(assert (=> start!111640 (= b_free!30073 (not b_next!30073))))

(declare-fun tp!105694 () Bool)

(declare-fun b_and!48307 () Bool)

(assert (=> start!111640 (= tp!105694 b_and!48307)))

(declare-fun b!1319794 () Bool)

(declare-fun res!875573 () Bool)

(declare-fun e!753232 () Bool)

(assert (=> b!1319794 (=> (not res!875573) (not e!753232))))

(declare-datatypes ((array!88803 0))(
  ( (array!88804 (arr!42871 (Array (_ BitVec 32) (_ BitVec 64))) (size!43422 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88803)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88803 (_ BitVec 32)) Bool)

(assert (=> b!1319794 (= res!875573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319795 () Bool)

(declare-fun e!753231 () Bool)

(declare-fun tp_is_empty!35893 () Bool)

(assert (=> b!1319795 (= e!753231 tp_is_empty!35893)))

(declare-fun mapIsEmpty!55487 () Bool)

(declare-fun mapRes!55487 () Bool)

(assert (=> mapIsEmpty!55487 mapRes!55487))

(declare-fun res!875576 () Bool)

(assert (=> start!111640 (=> (not res!875576) (not e!753232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111640 (= res!875576 (validMask!0 mask!2019))))

(assert (=> start!111640 e!753232))

(declare-fun array_inv!32643 (array!88803) Bool)

(assert (=> start!111640 (array_inv!32643 _keys!1609)))

(assert (=> start!111640 true))

(assert (=> start!111640 tp_is_empty!35893))

(declare-datatypes ((V!52961 0))(
  ( (V!52962 (val!18021 Int)) )
))
(declare-datatypes ((ValueCell!17048 0))(
  ( (ValueCellFull!17048 (v!20646 V!52961)) (EmptyCell!17048) )
))
(declare-datatypes ((array!88805 0))(
  ( (array!88806 (arr!42872 (Array (_ BitVec 32) ValueCell!17048)) (size!43423 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88805)

(declare-fun e!753228 () Bool)

(declare-fun array_inv!32644 (array!88805) Bool)

(assert (=> start!111640 (and (array_inv!32644 _values!1337) e!753228)))

(assert (=> start!111640 tp!105694))

(declare-fun b!1319796 () Bool)

(assert (=> b!1319796 (= e!753232 (not true))))

(declare-datatypes ((tuple2!23222 0))(
  ( (tuple2!23223 (_1!11622 (_ BitVec 64)) (_2!11622 V!52961)) )
))
(declare-datatypes ((List!30385 0))(
  ( (Nil!30382) (Cons!30381 (h!31599 tuple2!23222) (t!43999 List!30385)) )
))
(declare-datatypes ((ListLongMap!20887 0))(
  ( (ListLongMap!20888 (toList!10459 List!30385)) )
))
(declare-fun lt!586954 () ListLongMap!20887)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8626 (ListLongMap!20887 (_ BitVec 64)) Bool)

(assert (=> b!1319796 (contains!8626 lt!586954 k0!1164)))

(declare-datatypes ((Unit!43385 0))(
  ( (Unit!43386) )
))
(declare-fun lt!586955 () Unit!43385)

(declare-fun minValue!1279 () V!52961)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!104 ((_ BitVec 64) (_ BitVec 64) V!52961 ListLongMap!20887) Unit!43385)

(assert (=> b!1319796 (= lt!586955 (lemmaInListMapAfterAddingDiffThenInBefore!104 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586954))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52961)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4549 (ListLongMap!20887 tuple2!23222) ListLongMap!20887)

(declare-fun getCurrentListMapNoExtraKeys!6188 (array!88803 array!88805 (_ BitVec 32) (_ BitVec 32) V!52961 V!52961 (_ BitVec 32) Int) ListLongMap!20887)

(declare-fun get!21568 (ValueCell!17048 V!52961) V!52961)

(declare-fun dynLambda!3503 (Int (_ BitVec 64)) V!52961)

(assert (=> b!1319796 (= lt!586954 (+!4549 (+!4549 (getCurrentListMapNoExtraKeys!6188 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23223 (select (arr!42871 _keys!1609) from!2000) (get!21568 (select (arr!42872 _values!1337) from!2000) (dynLambda!3503 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23223 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319797 () Bool)

(declare-fun res!875577 () Bool)

(assert (=> b!1319797 (=> (not res!875577) (not e!753232))))

(assert (=> b!1319797 (= res!875577 (and (= (size!43423 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43422 _keys!1609) (size!43423 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55487 () Bool)

(declare-fun tp!105695 () Bool)

(declare-fun e!753230 () Bool)

(assert (=> mapNonEmpty!55487 (= mapRes!55487 (and tp!105695 e!753230))))

(declare-fun mapKey!55487 () (_ BitVec 32))

(declare-fun mapValue!55487 () ValueCell!17048)

(declare-fun mapRest!55487 () (Array (_ BitVec 32) ValueCell!17048))

(assert (=> mapNonEmpty!55487 (= (arr!42872 _values!1337) (store mapRest!55487 mapKey!55487 mapValue!55487))))

(declare-fun b!1319798 () Bool)

(declare-fun res!875578 () Bool)

(assert (=> b!1319798 (=> (not res!875578) (not e!753232))))

(assert (=> b!1319798 (= res!875578 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43422 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319799 () Bool)

(declare-fun res!875572 () Bool)

(assert (=> b!1319799 (=> (not res!875572) (not e!753232))))

(declare-fun getCurrentListMap!5463 (array!88803 array!88805 (_ BitVec 32) (_ BitVec 32) V!52961 V!52961 (_ BitVec 32) Int) ListLongMap!20887)

(assert (=> b!1319799 (= res!875572 (contains!8626 (getCurrentListMap!5463 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319800 () Bool)

(declare-fun res!875571 () Bool)

(assert (=> b!1319800 (=> (not res!875571) (not e!753232))))

(assert (=> b!1319800 (= res!875571 (not (= (select (arr!42871 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319801 () Bool)

(assert (=> b!1319801 (= e!753230 tp_is_empty!35893)))

(declare-fun b!1319802 () Bool)

(declare-fun res!875575 () Bool)

(assert (=> b!1319802 (=> (not res!875575) (not e!753232))))

(declare-datatypes ((List!30386 0))(
  ( (Nil!30383) (Cons!30382 (h!31600 (_ BitVec 64)) (t!44000 List!30386)) )
))
(declare-fun arrayNoDuplicates!0 (array!88803 (_ BitVec 32) List!30386) Bool)

(assert (=> b!1319802 (= res!875575 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30383))))

(declare-fun b!1319803 () Bool)

(declare-fun res!875574 () Bool)

(assert (=> b!1319803 (=> (not res!875574) (not e!753232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319803 (= res!875574 (validKeyInArray!0 (select (arr!42871 _keys!1609) from!2000)))))

(declare-fun b!1319804 () Bool)

(assert (=> b!1319804 (= e!753228 (and e!753231 mapRes!55487))))

(declare-fun condMapEmpty!55487 () Bool)

(declare-fun mapDefault!55487 () ValueCell!17048)

(assert (=> b!1319804 (= condMapEmpty!55487 (= (arr!42872 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17048)) mapDefault!55487)))))

(assert (= (and start!111640 res!875576) b!1319797))

(assert (= (and b!1319797 res!875577) b!1319794))

(assert (= (and b!1319794 res!875573) b!1319802))

(assert (= (and b!1319802 res!875575) b!1319798))

(assert (= (and b!1319798 res!875578) b!1319799))

(assert (= (and b!1319799 res!875572) b!1319800))

(assert (= (and b!1319800 res!875571) b!1319803))

(assert (= (and b!1319803 res!875574) b!1319796))

(assert (= (and b!1319804 condMapEmpty!55487) mapIsEmpty!55487))

(assert (= (and b!1319804 (not condMapEmpty!55487)) mapNonEmpty!55487))

(get-info :version)

(assert (= (and mapNonEmpty!55487 ((_ is ValueCellFull!17048) mapValue!55487)) b!1319801))

(assert (= (and b!1319804 ((_ is ValueCellFull!17048) mapDefault!55487)) b!1319795))

(assert (= start!111640 b!1319804))

(declare-fun b_lambda!23393 () Bool)

(assert (=> (not b_lambda!23393) (not b!1319796)))

(declare-fun t!43998 () Bool)

(declare-fun tb!11417 () Bool)

(assert (=> (and start!111640 (= defaultEntry!1340 defaultEntry!1340) t!43998) tb!11417))

(declare-fun result!23897 () Bool)

(assert (=> tb!11417 (= result!23897 tp_is_empty!35893)))

(assert (=> b!1319796 t!43998))

(declare-fun b_and!48309 () Bool)

(assert (= b_and!48307 (and (=> t!43998 result!23897) b_and!48309)))

(declare-fun m!1207661 () Bool)

(assert (=> b!1319799 m!1207661))

(assert (=> b!1319799 m!1207661))

(declare-fun m!1207663 () Bool)

(assert (=> b!1319799 m!1207663))

(declare-fun m!1207665 () Bool)

(assert (=> b!1319800 m!1207665))

(declare-fun m!1207667 () Bool)

(assert (=> mapNonEmpty!55487 m!1207667))

(declare-fun m!1207669 () Bool)

(assert (=> start!111640 m!1207669))

(declare-fun m!1207671 () Bool)

(assert (=> start!111640 m!1207671))

(declare-fun m!1207673 () Bool)

(assert (=> start!111640 m!1207673))

(declare-fun m!1207675 () Bool)

(assert (=> b!1319796 m!1207675))

(declare-fun m!1207677 () Bool)

(assert (=> b!1319796 m!1207677))

(assert (=> b!1319796 m!1207675))

(declare-fun m!1207679 () Bool)

(assert (=> b!1319796 m!1207679))

(declare-fun m!1207681 () Bool)

(assert (=> b!1319796 m!1207681))

(assert (=> b!1319796 m!1207679))

(declare-fun m!1207683 () Bool)

(assert (=> b!1319796 m!1207683))

(assert (=> b!1319796 m!1207681))

(assert (=> b!1319796 m!1207677))

(declare-fun m!1207685 () Bool)

(assert (=> b!1319796 m!1207685))

(assert (=> b!1319796 m!1207665))

(declare-fun m!1207687 () Bool)

(assert (=> b!1319796 m!1207687))

(declare-fun m!1207689 () Bool)

(assert (=> b!1319796 m!1207689))

(declare-fun m!1207691 () Bool)

(assert (=> b!1319802 m!1207691))

(assert (=> b!1319803 m!1207665))

(assert (=> b!1319803 m!1207665))

(declare-fun m!1207693 () Bool)

(assert (=> b!1319803 m!1207693))

(declare-fun m!1207695 () Bool)

(assert (=> b!1319794 m!1207695))

(check-sat (not b!1319796) (not b!1319799) (not b!1319802) (not b_lambda!23393) (not mapNonEmpty!55487) tp_is_empty!35893 (not b!1319803) (not b_next!30073) b_and!48309 (not b!1319794) (not start!111640))
(check-sat b_and!48309 (not b_next!30073))
