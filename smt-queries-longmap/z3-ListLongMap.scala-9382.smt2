; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111952 () Bool)

(assert start!111952)

(declare-fun b_free!30385 () Bool)

(declare-fun b_next!30385 () Bool)

(assert (=> start!111952 (= b_free!30385 (not b_next!30385))))

(declare-fun tp!106631 () Bool)

(declare-fun b_and!48925 () Bool)

(assert (=> start!111952 (= tp!106631 b_and!48925)))

(declare-fun b!1325215 () Bool)

(declare-fun res!879282 () Bool)

(declare-fun e!755569 () Bool)

(assert (=> b!1325215 (=> (not res!879282) (not e!755569))))

(declare-datatypes ((array!89415 0))(
  ( (array!89416 (arr!43177 (Array (_ BitVec 32) (_ BitVec 64))) (size!43728 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89415)

(declare-datatypes ((List!30624 0))(
  ( (Nil!30621) (Cons!30620 (h!31838 (_ BitVec 64)) (t!44542 List!30624)) )
))
(declare-fun arrayNoDuplicates!0 (array!89415 (_ BitVec 32) List!30624) Bool)

(assert (=> b!1325215 (= res!879282 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30621))))

(declare-fun res!879285 () Bool)

(assert (=> start!111952 (=> (not res!879285) (not e!755569))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111952 (= res!879285 (validMask!0 mask!2019))))

(assert (=> start!111952 e!755569))

(declare-fun array_inv!32869 (array!89415) Bool)

(assert (=> start!111952 (array_inv!32869 _keys!1609)))

(assert (=> start!111952 true))

(declare-fun tp_is_empty!36205 () Bool)

(assert (=> start!111952 tp_is_empty!36205))

(declare-datatypes ((V!53377 0))(
  ( (V!53378 (val!18177 Int)) )
))
(declare-datatypes ((ValueCell!17204 0))(
  ( (ValueCellFull!17204 (v!20802 V!53377)) (EmptyCell!17204) )
))
(declare-datatypes ((array!89417 0))(
  ( (array!89418 (arr!43178 (Array (_ BitVec 32) ValueCell!17204)) (size!43729 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89417)

(declare-fun e!755570 () Bool)

(declare-fun array_inv!32870 (array!89417) Bool)

(assert (=> start!111952 (and (array_inv!32870 _values!1337) e!755570)))

(assert (=> start!111952 tp!106631))

(declare-fun b!1325216 () Bool)

(declare-fun res!879286 () Bool)

(assert (=> b!1325216 (=> (not res!879286) (not e!755569))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325216 (= res!879286 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43728 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325217 () Bool)

(declare-fun e!755572 () Bool)

(assert (=> b!1325217 (= e!755572 tp_is_empty!36205)))

(declare-fun mapNonEmpty!55955 () Bool)

(declare-fun mapRes!55955 () Bool)

(declare-fun tp!106630 () Bool)

(declare-fun e!755571 () Bool)

(assert (=> mapNonEmpty!55955 (= mapRes!55955 (and tp!106630 e!755571))))

(declare-fun mapRest!55955 () (Array (_ BitVec 32) ValueCell!17204))

(declare-fun mapKey!55955 () (_ BitVec 32))

(declare-fun mapValue!55955 () ValueCell!17204)

(assert (=> mapNonEmpty!55955 (= (arr!43178 _values!1337) (store mapRest!55955 mapKey!55955 mapValue!55955))))

(declare-fun mapIsEmpty!55955 () Bool)

(assert (=> mapIsEmpty!55955 mapRes!55955))

(declare-fun b!1325218 () Bool)

(assert (=> b!1325218 (= e!755571 tp_is_empty!36205)))

(declare-fun b!1325219 () Bool)

(assert (=> b!1325219 (= e!755569 false)))

(declare-fun zeroValue!1279 () V!53377)

(declare-fun minValue!1279 () V!53377)

(declare-fun lt!589886 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23474 0))(
  ( (tuple2!23475 (_1!11748 (_ BitVec 64)) (_2!11748 V!53377)) )
))
(declare-datatypes ((List!30625 0))(
  ( (Nil!30622) (Cons!30621 (h!31839 tuple2!23474) (t!44543 List!30625)) )
))
(declare-datatypes ((ListLongMap!21139 0))(
  ( (ListLongMap!21140 (toList!10585 List!30625)) )
))
(declare-fun contains!8752 (ListLongMap!21139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5568 (array!89415 array!89417 (_ BitVec 32) (_ BitVec 32) V!53377 V!53377 (_ BitVec 32) Int) ListLongMap!21139)

(assert (=> b!1325219 (= lt!589886 (contains!8752 (getCurrentListMap!5568 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325220 () Bool)

(declare-fun res!879283 () Bool)

(assert (=> b!1325220 (=> (not res!879283) (not e!755569))))

(assert (=> b!1325220 (= res!879283 (and (= (size!43729 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43728 _keys!1609) (size!43729 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325221 () Bool)

(assert (=> b!1325221 (= e!755570 (and e!755572 mapRes!55955))))

(declare-fun condMapEmpty!55955 () Bool)

(declare-fun mapDefault!55955 () ValueCell!17204)

(assert (=> b!1325221 (= condMapEmpty!55955 (= (arr!43178 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17204)) mapDefault!55955)))))

(declare-fun b!1325222 () Bool)

(declare-fun res!879284 () Bool)

(assert (=> b!1325222 (=> (not res!879284) (not e!755569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89415 (_ BitVec 32)) Bool)

(assert (=> b!1325222 (= res!879284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111952 res!879285) b!1325220))

(assert (= (and b!1325220 res!879283) b!1325222))

(assert (= (and b!1325222 res!879284) b!1325215))

(assert (= (and b!1325215 res!879282) b!1325216))

(assert (= (and b!1325216 res!879286) b!1325219))

(assert (= (and b!1325221 condMapEmpty!55955) mapIsEmpty!55955))

(assert (= (and b!1325221 (not condMapEmpty!55955)) mapNonEmpty!55955))

(get-info :version)

(assert (= (and mapNonEmpty!55955 ((_ is ValueCellFull!17204) mapValue!55955)) b!1325218))

(assert (= (and b!1325221 ((_ is ValueCellFull!17204) mapDefault!55955)) b!1325217))

(assert (= start!111952 b!1325221))

(declare-fun m!1214549 () Bool)

(assert (=> b!1325215 m!1214549))

(declare-fun m!1214551 () Bool)

(assert (=> b!1325219 m!1214551))

(assert (=> b!1325219 m!1214551))

(declare-fun m!1214553 () Bool)

(assert (=> b!1325219 m!1214553))

(declare-fun m!1214555 () Bool)

(assert (=> start!111952 m!1214555))

(declare-fun m!1214557 () Bool)

(assert (=> start!111952 m!1214557))

(declare-fun m!1214559 () Bool)

(assert (=> start!111952 m!1214559))

(declare-fun m!1214561 () Bool)

(assert (=> mapNonEmpty!55955 m!1214561))

(declare-fun m!1214563 () Bool)

(assert (=> b!1325222 m!1214563))

(check-sat (not b!1325219) (not start!111952) (not mapNonEmpty!55955) (not b_next!30385) (not b!1325215) tp_is_empty!36205 b_and!48925 (not b!1325222))
(check-sat b_and!48925 (not b_next!30385))
