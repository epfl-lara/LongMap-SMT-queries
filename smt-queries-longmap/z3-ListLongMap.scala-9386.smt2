; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111976 () Bool)

(assert start!111976)

(declare-fun b_free!30409 () Bool)

(declare-fun b_next!30409 () Bool)

(assert (=> start!111976 (= b_free!30409 (not b_next!30409))))

(declare-fun tp!106703 () Bool)

(declare-fun b_and!48949 () Bool)

(assert (=> start!111976 (= tp!106703 b_and!48949)))

(declare-fun mapNonEmpty!55991 () Bool)

(declare-fun mapRes!55991 () Bool)

(declare-fun tp!106702 () Bool)

(declare-fun e!755750 () Bool)

(assert (=> mapNonEmpty!55991 (= mapRes!55991 (and tp!106702 e!755750))))

(declare-datatypes ((V!53409 0))(
  ( (V!53410 (val!18189 Int)) )
))
(declare-datatypes ((ValueCell!17216 0))(
  ( (ValueCellFull!17216 (v!20814 V!53409)) (EmptyCell!17216) )
))
(declare-fun mapValue!55991 () ValueCell!17216)

(declare-datatypes ((array!89463 0))(
  ( (array!89464 (arr!43201 (Array (_ BitVec 32) ValueCell!17216)) (size!43752 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89463)

(declare-fun mapKey!55991 () (_ BitVec 32))

(declare-fun mapRest!55991 () (Array (_ BitVec 32) ValueCell!17216))

(assert (=> mapNonEmpty!55991 (= (arr!43201 _values!1337) (store mapRest!55991 mapKey!55991 mapValue!55991))))

(declare-fun b!1325503 () Bool)

(declare-fun res!879466 () Bool)

(declare-fun e!755751 () Bool)

(assert (=> b!1325503 (=> (not res!879466) (not e!755751))))

(declare-datatypes ((array!89465 0))(
  ( (array!89466 (arr!43202 (Array (_ BitVec 32) (_ BitVec 64))) (size!43753 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89465)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89465 (_ BitVec 32)) Bool)

(assert (=> b!1325503 (= res!879466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!879462 () Bool)

(assert (=> start!111976 (=> (not res!879462) (not e!755751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111976 (= res!879462 (validMask!0 mask!2019))))

(assert (=> start!111976 e!755751))

(declare-fun array_inv!32887 (array!89465) Bool)

(assert (=> start!111976 (array_inv!32887 _keys!1609)))

(assert (=> start!111976 true))

(declare-fun tp_is_empty!36229 () Bool)

(assert (=> start!111976 tp_is_empty!36229))

(declare-fun e!755752 () Bool)

(declare-fun array_inv!32888 (array!89463) Bool)

(assert (=> start!111976 (and (array_inv!32888 _values!1337) e!755752)))

(assert (=> start!111976 tp!106703))

(declare-fun b!1325504 () Bool)

(declare-fun e!755748 () Bool)

(assert (=> b!1325504 (= e!755752 (and e!755748 mapRes!55991))))

(declare-fun condMapEmpty!55991 () Bool)

(declare-fun mapDefault!55991 () ValueCell!17216)

(assert (=> b!1325504 (= condMapEmpty!55991 (= (arr!43201 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17216)) mapDefault!55991)))))

(declare-fun b!1325505 () Bool)

(declare-fun res!879464 () Bool)

(assert (=> b!1325505 (=> (not res!879464) (not e!755751))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1325505 (= res!879464 (and (= (size!43752 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43753 _keys!1609) (size!43752 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325506 () Bool)

(assert (=> b!1325506 (= e!755748 tp_is_empty!36229)))

(declare-fun b!1325507 () Bool)

(assert (=> b!1325507 (= e!755750 tp_is_empty!36229)))

(declare-fun b!1325508 () Bool)

(assert (=> b!1325508 (= e!755751 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53409)

(declare-fun minValue!1279 () V!53409)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589922 () Bool)

(declare-datatypes ((tuple2!23490 0))(
  ( (tuple2!23491 (_1!11756 (_ BitVec 64)) (_2!11756 V!53409)) )
))
(declare-datatypes ((List!30641 0))(
  ( (Nil!30638) (Cons!30637 (h!31855 tuple2!23490) (t!44559 List!30641)) )
))
(declare-datatypes ((ListLongMap!21155 0))(
  ( (ListLongMap!21156 (toList!10593 List!30641)) )
))
(declare-fun contains!8760 (ListLongMap!21155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5576 (array!89465 array!89463 (_ BitVec 32) (_ BitVec 32) V!53409 V!53409 (_ BitVec 32) Int) ListLongMap!21155)

(assert (=> b!1325508 (= lt!589922 (contains!8760 (getCurrentListMap!5576 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!55991 () Bool)

(assert (=> mapIsEmpty!55991 mapRes!55991))

(declare-fun b!1325509 () Bool)

(declare-fun res!879465 () Bool)

(assert (=> b!1325509 (=> (not res!879465) (not e!755751))))

(assert (=> b!1325509 (= res!879465 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43753 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325510 () Bool)

(declare-fun res!879463 () Bool)

(assert (=> b!1325510 (=> (not res!879463) (not e!755751))))

(declare-datatypes ((List!30642 0))(
  ( (Nil!30639) (Cons!30638 (h!31856 (_ BitVec 64)) (t!44560 List!30642)) )
))
(declare-fun arrayNoDuplicates!0 (array!89465 (_ BitVec 32) List!30642) Bool)

(assert (=> b!1325510 (= res!879463 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30639))))

(assert (= (and start!111976 res!879462) b!1325505))

(assert (= (and b!1325505 res!879464) b!1325503))

(assert (= (and b!1325503 res!879466) b!1325510))

(assert (= (and b!1325510 res!879463) b!1325509))

(assert (= (and b!1325509 res!879465) b!1325508))

(assert (= (and b!1325504 condMapEmpty!55991) mapIsEmpty!55991))

(assert (= (and b!1325504 (not condMapEmpty!55991)) mapNonEmpty!55991))

(get-info :version)

(assert (= (and mapNonEmpty!55991 ((_ is ValueCellFull!17216) mapValue!55991)) b!1325507))

(assert (= (and b!1325504 ((_ is ValueCellFull!17216) mapDefault!55991)) b!1325506))

(assert (= start!111976 b!1325504))

(declare-fun m!1214741 () Bool)

(assert (=> mapNonEmpty!55991 m!1214741))

(declare-fun m!1214743 () Bool)

(assert (=> b!1325510 m!1214743))

(declare-fun m!1214745 () Bool)

(assert (=> start!111976 m!1214745))

(declare-fun m!1214747 () Bool)

(assert (=> start!111976 m!1214747))

(declare-fun m!1214749 () Bool)

(assert (=> start!111976 m!1214749))

(declare-fun m!1214751 () Bool)

(assert (=> b!1325508 m!1214751))

(assert (=> b!1325508 m!1214751))

(declare-fun m!1214753 () Bool)

(assert (=> b!1325508 m!1214753))

(declare-fun m!1214755 () Bool)

(assert (=> b!1325503 m!1214755))

(check-sat b_and!48949 (not b!1325503) (not b_next!30409) (not b!1325508) (not start!111976) (not mapNonEmpty!55991) tp_is_empty!36229 (not b!1325510))
(check-sat b_and!48949 (not b_next!30409))
