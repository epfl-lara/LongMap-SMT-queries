; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1032 () Bool)

(assert start!1032)

(declare-fun b_free!361 () Bool)

(declare-fun b_next!361 () Bool)

(assert (=> start!1032 (= b_free!361 (not b_next!361))))

(declare-fun tp!1321 () Bool)

(declare-fun b_and!513 () Bool)

(assert (=> start!1032 (= tp!1321 b_and!513)))

(declare-fun b!9015 () Bool)

(declare-fun e!5147 () Bool)

(assert (=> b!9015 (= e!5147 true)))

(declare-fun lt!1953 () (_ BitVec 32))

(declare-datatypes ((array!793 0))(
  ( (array!794 (arr!382 (Array (_ BitVec 32) (_ BitVec 64))) (size!444 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!793)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!793 (_ BitVec 32)) Bool)

(assert (=> b!9015 (arrayForallSeekEntryOrOpenFound!0 lt!1953 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!187 0))(
  ( (Unit!188) )
))
(declare-fun lt!1951 () Unit!187)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!187)

(assert (=> b!9015 (= lt!1951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1953))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!793 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9015 (= lt!1953 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!638 () Bool)

(declare-fun mapRes!638 () Bool)

(assert (=> mapIsEmpty!638 mapRes!638))

(declare-fun res!8278 () Bool)

(declare-fun e!5143 () Bool)

(assert (=> start!1032 (=> (not res!8278) (not e!5143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1032 (= res!8278 (validMask!0 mask!2250))))

(assert (=> start!1032 e!5143))

(assert (=> start!1032 tp!1321))

(assert (=> start!1032 true))

(declare-datatypes ((V!763 0))(
  ( (V!764 (val!225 Int)) )
))
(declare-datatypes ((ValueCell!203 0))(
  ( (ValueCellFull!203 (v!1319 V!763)) (EmptyCell!203) )
))
(declare-datatypes ((array!795 0))(
  ( (array!796 (arr!383 (Array (_ BitVec 32) ValueCell!203)) (size!445 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!795)

(declare-fun e!5141 () Bool)

(declare-fun array_inv!283 (array!795) Bool)

(assert (=> start!1032 (and (array_inv!283 _values!1492) e!5141)))

(declare-fun tp_is_empty!439 () Bool)

(assert (=> start!1032 tp_is_empty!439))

(declare-fun array_inv!284 (array!793) Bool)

(assert (=> start!1032 (array_inv!284 _keys!1806)))

(declare-fun b!9016 () Bool)

(declare-fun e!5145 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!9016 (= e!5145 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9017 () Bool)

(assert (=> b!9017 (= e!5143 (not e!5147))))

(declare-fun res!8274 () Bool)

(assert (=> b!9017 (=> res!8274 e!5147)))

(declare-fun arrayContainsKey!0 (array!793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9017 (= res!8274 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!9017 e!5145))

(declare-fun c!689 () Bool)

(assert (=> b!9017 (= c!689 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1952 () Unit!187)

(declare-fun minValue!1434 () V!763)

(declare-fun zeroValue!1434 () V!763)

(declare-fun lemmaKeyInListMapIsInArray!72 (array!793 array!795 (_ BitVec 32) (_ BitVec 32) V!763 V!763 (_ BitVec 64) Int) Unit!187)

(assert (=> b!9017 (= lt!1952 (lemmaKeyInListMapIsInArray!72 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!9018 () Bool)

(declare-fun res!8273 () Bool)

(assert (=> b!9018 (=> (not res!8273) (not e!5143))))

(assert (=> b!9018 (= res!8273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9019 () Bool)

(declare-fun res!8272 () Bool)

(assert (=> b!9019 (=> (not res!8272) (not e!5143))))

(declare-datatypes ((tuple2!254 0))(
  ( (tuple2!255 (_1!127 (_ BitVec 64)) (_2!127 V!763)) )
))
(declare-datatypes ((List!266 0))(
  ( (Nil!263) (Cons!262 (h!828 tuple2!254) (t!2407 List!266)) )
))
(declare-datatypes ((ListLongMap!259 0))(
  ( (ListLongMap!260 (toList!145 List!266)) )
))
(declare-fun contains!122 (ListLongMap!259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!104 (array!793 array!795 (_ BitVec 32) (_ BitVec 32) V!763 V!763 (_ BitVec 32) Int) ListLongMap!259)

(assert (=> b!9019 (= res!8272 (contains!122 (getCurrentListMap!104 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!9020 () Bool)

(declare-fun res!8276 () Bool)

(assert (=> b!9020 (=> (not res!8276) (not e!5143))))

(declare-datatypes ((List!267 0))(
  ( (Nil!264) (Cons!263 (h!829 (_ BitVec 64)) (t!2408 List!267)) )
))
(declare-fun arrayNoDuplicates!0 (array!793 (_ BitVec 32) List!267) Bool)

(assert (=> b!9020 (= res!8276 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!264))))

(declare-fun b!9021 () Bool)

(assert (=> b!9021 (= e!5145 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9022 () Bool)

(declare-fun e!5144 () Bool)

(assert (=> b!9022 (= e!5144 tp_is_empty!439)))

(declare-fun b!9023 () Bool)

(declare-fun res!8275 () Bool)

(assert (=> b!9023 (=> (not res!8275) (not e!5143))))

(assert (=> b!9023 (= res!8275 (and (= (size!445 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!444 _keys!1806) (size!445 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9024 () Bool)

(declare-fun res!8277 () Bool)

(assert (=> b!9024 (=> (not res!8277) (not e!5143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9024 (= res!8277 (validKeyInArray!0 k0!1278))))

(declare-fun b!9025 () Bool)

(declare-fun e!5146 () Bool)

(assert (=> b!9025 (= e!5146 tp_is_empty!439)))

(declare-fun mapNonEmpty!638 () Bool)

(declare-fun tp!1322 () Bool)

(assert (=> mapNonEmpty!638 (= mapRes!638 (and tp!1322 e!5144))))

(declare-fun mapKey!638 () (_ BitVec 32))

(declare-fun mapRest!638 () (Array (_ BitVec 32) ValueCell!203))

(declare-fun mapValue!638 () ValueCell!203)

(assert (=> mapNonEmpty!638 (= (arr!383 _values!1492) (store mapRest!638 mapKey!638 mapValue!638))))

(declare-fun b!9026 () Bool)

(assert (=> b!9026 (= e!5141 (and e!5146 mapRes!638))))

(declare-fun condMapEmpty!638 () Bool)

(declare-fun mapDefault!638 () ValueCell!203)

(assert (=> b!9026 (= condMapEmpty!638 (= (arr!383 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!203)) mapDefault!638)))))

(assert (= (and start!1032 res!8278) b!9023))

(assert (= (and b!9023 res!8275) b!9018))

(assert (= (and b!9018 res!8273) b!9020))

(assert (= (and b!9020 res!8276) b!9019))

(assert (= (and b!9019 res!8272) b!9024))

(assert (= (and b!9024 res!8277) b!9017))

(assert (= (and b!9017 c!689) b!9021))

(assert (= (and b!9017 (not c!689)) b!9016))

(assert (= (and b!9017 (not res!8274)) b!9015))

(assert (= (and b!9026 condMapEmpty!638) mapIsEmpty!638))

(assert (= (and b!9026 (not condMapEmpty!638)) mapNonEmpty!638))

(get-info :version)

(assert (= (and mapNonEmpty!638 ((_ is ValueCellFull!203) mapValue!638)) b!9022))

(assert (= (and b!9026 ((_ is ValueCellFull!203) mapDefault!638)) b!9025))

(assert (= start!1032 b!9026))

(declare-fun m!5605 () Bool)

(assert (=> b!9015 m!5605))

(declare-fun m!5607 () Bool)

(assert (=> b!9015 m!5607))

(declare-fun m!5609 () Bool)

(assert (=> b!9015 m!5609))

(declare-fun m!5611 () Bool)

(assert (=> b!9020 m!5611))

(declare-fun m!5613 () Bool)

(assert (=> start!1032 m!5613))

(declare-fun m!5615 () Bool)

(assert (=> start!1032 m!5615))

(declare-fun m!5617 () Bool)

(assert (=> start!1032 m!5617))

(declare-fun m!5619 () Bool)

(assert (=> b!9021 m!5619))

(declare-fun m!5621 () Bool)

(assert (=> b!9024 m!5621))

(declare-fun m!5623 () Bool)

(assert (=> mapNonEmpty!638 m!5623))

(assert (=> b!9017 m!5619))

(declare-fun m!5625 () Bool)

(assert (=> b!9017 m!5625))

(declare-fun m!5627 () Bool)

(assert (=> b!9018 m!5627))

(declare-fun m!5629 () Bool)

(assert (=> b!9019 m!5629))

(assert (=> b!9019 m!5629))

(declare-fun m!5631 () Bool)

(assert (=> b!9019 m!5631))

(check-sat (not b!9024) (not b!9015) (not b_next!361) (not b!9018) tp_is_empty!439 (not b!9019) (not mapNonEmpty!638) (not start!1032) (not b!9020) b_and!513 (not b!9017) (not b!9021))
(check-sat b_and!513 (not b_next!361))
