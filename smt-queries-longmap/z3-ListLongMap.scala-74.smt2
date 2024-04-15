; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1020 () Bool)

(assert start!1020)

(declare-fun b_free!349 () Bool)

(declare-fun b_next!349 () Bool)

(assert (=> start!1020 (= b_free!349 (not b_next!349))))

(declare-fun tp!1285 () Bool)

(declare-fun b_and!501 () Bool)

(assert (=> start!1020 (= tp!1285 b_and!501)))

(declare-fun res!8152 () Bool)

(declare-fun e!5020 () Bool)

(assert (=> start!1020 (=> (not res!8152) (not e!5020))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1020 (= res!8152 (validMask!0 mask!2250))))

(assert (=> start!1020 e!5020))

(assert (=> start!1020 tp!1285))

(assert (=> start!1020 true))

(declare-datatypes ((V!747 0))(
  ( (V!748 (val!219 Int)) )
))
(declare-datatypes ((ValueCell!197 0))(
  ( (ValueCellFull!197 (v!1313 V!747)) (EmptyCell!197) )
))
(declare-datatypes ((array!769 0))(
  ( (array!770 (arr!370 (Array (_ BitVec 32) ValueCell!197)) (size!432 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!769)

(declare-fun e!5016 () Bool)

(declare-fun array_inv!275 (array!769) Bool)

(assert (=> start!1020 (and (array_inv!275 _values!1492) e!5016)))

(declare-fun tp_is_empty!427 () Bool)

(assert (=> start!1020 tp_is_empty!427))

(declare-datatypes ((array!771 0))(
  ( (array!772 (arr!371 (Array (_ BitVec 32) (_ BitVec 64))) (size!433 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!771)

(declare-fun array_inv!276 (array!771) Bool)

(assert (=> start!1020 (array_inv!276 _keys!1806)))

(declare-fun b!8799 () Bool)

(declare-fun e!5017 () Bool)

(declare-fun mapRes!620 () Bool)

(assert (=> b!8799 (= e!5016 (and e!5017 mapRes!620))))

(declare-fun condMapEmpty!620 () Bool)

(declare-fun mapDefault!620 () ValueCell!197)

(assert (=> b!8799 (= condMapEmpty!620 (= (arr!370 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!197)) mapDefault!620)))))

(declare-fun b!8800 () Bool)

(declare-fun res!8151 () Bool)

(assert (=> b!8800 (=> (not res!8151) (not e!5020))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8800 (= res!8151 (validKeyInArray!0 k0!1278))))

(declare-fun b!8801 () Bool)

(declare-fun e!5015 () Bool)

(declare-fun arrayContainsKey!0 (array!771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8801 (= e!5015 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!620 () Bool)

(assert (=> mapIsEmpty!620 mapRes!620))

(declare-fun b!8802 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8802 (= e!5015 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8803 () Bool)

(declare-fun e!5019 () Bool)

(assert (=> b!8803 (= e!5020 (not e!5019))))

(declare-fun res!8146 () Bool)

(assert (=> b!8803 (=> res!8146 e!5019)))

(assert (=> b!8803 (= res!8146 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8803 e!5015))

(declare-fun c!671 () Bool)

(assert (=> b!8803 (= c!671 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!747)

(declare-fun zeroValue!1434 () V!747)

(declare-datatypes ((Unit!175 0))(
  ( (Unit!176) )
))
(declare-fun lt!1898 () Unit!175)

(declare-fun lemmaKeyInListMapIsInArray!67 (array!771 array!769 (_ BitVec 32) (_ BitVec 32) V!747 V!747 (_ BitVec 64) Int) Unit!175)

(assert (=> b!8803 (= lt!1898 (lemmaKeyInListMapIsInArray!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8804 () Bool)

(declare-fun res!8147 () Bool)

(assert (=> b!8804 (=> (not res!8147) (not e!5020))))

(assert (=> b!8804 (= res!8147 (and (= (size!432 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!433 _keys!1806) (size!432 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8805 () Bool)

(declare-fun res!8149 () Bool)

(assert (=> b!8805 (=> (not res!8149) (not e!5020))))

(declare-datatypes ((tuple2!246 0))(
  ( (tuple2!247 (_1!123 (_ BitVec 64)) (_2!123 V!747)) )
))
(declare-datatypes ((List!257 0))(
  ( (Nil!254) (Cons!253 (h!819 tuple2!246) (t!2398 List!257)) )
))
(declare-datatypes ((ListLongMap!251 0))(
  ( (ListLongMap!252 (toList!141 List!257)) )
))
(declare-fun contains!118 (ListLongMap!251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!100 (array!771 array!769 (_ BitVec 32) (_ BitVec 32) V!747 V!747 (_ BitVec 32) Int) ListLongMap!251)

(assert (=> b!8805 (= res!8149 (contains!118 (getCurrentListMap!100 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!8806 () Bool)

(declare-fun e!5021 () Bool)

(assert (=> b!8806 (= e!5021 tp_is_empty!427)))

(declare-fun b!8807 () Bool)

(assert (=> b!8807 (= e!5019 true)))

(declare-fun lt!1897 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!771 (_ BitVec 32)) Bool)

(assert (=> b!8807 (arrayForallSeekEntryOrOpenFound!0 lt!1897 _keys!1806 mask!2250)))

(declare-fun lt!1899 () Unit!175)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!175)

(assert (=> b!8807 (= lt!1899 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1897))))

(declare-fun arrayScanForKey!0 (array!771 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8807 (= lt!1897 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8808 () Bool)

(declare-fun res!8150 () Bool)

(assert (=> b!8808 (=> (not res!8150) (not e!5020))))

(declare-datatypes ((List!258 0))(
  ( (Nil!255) (Cons!254 (h!820 (_ BitVec 64)) (t!2399 List!258)) )
))
(declare-fun arrayNoDuplicates!0 (array!771 (_ BitVec 32) List!258) Bool)

(assert (=> b!8808 (= res!8150 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!255))))

(declare-fun b!8809 () Bool)

(declare-fun res!8148 () Bool)

(assert (=> b!8809 (=> (not res!8148) (not e!5020))))

(assert (=> b!8809 (= res!8148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!620 () Bool)

(declare-fun tp!1286 () Bool)

(assert (=> mapNonEmpty!620 (= mapRes!620 (and tp!1286 e!5021))))

(declare-fun mapRest!620 () (Array (_ BitVec 32) ValueCell!197))

(declare-fun mapKey!620 () (_ BitVec 32))

(declare-fun mapValue!620 () ValueCell!197)

(assert (=> mapNonEmpty!620 (= (arr!370 _values!1492) (store mapRest!620 mapKey!620 mapValue!620))))

(declare-fun b!8810 () Bool)

(assert (=> b!8810 (= e!5017 tp_is_empty!427)))

(assert (= (and start!1020 res!8152) b!8804))

(assert (= (and b!8804 res!8147) b!8809))

(assert (= (and b!8809 res!8148) b!8808))

(assert (= (and b!8808 res!8150) b!8805))

(assert (= (and b!8805 res!8149) b!8800))

(assert (= (and b!8800 res!8151) b!8803))

(assert (= (and b!8803 c!671) b!8801))

(assert (= (and b!8803 (not c!671)) b!8802))

(assert (= (and b!8803 (not res!8146)) b!8807))

(assert (= (and b!8799 condMapEmpty!620) mapIsEmpty!620))

(assert (= (and b!8799 (not condMapEmpty!620)) mapNonEmpty!620))

(get-info :version)

(assert (= (and mapNonEmpty!620 ((_ is ValueCellFull!197) mapValue!620)) b!8806))

(assert (= (and b!8799 ((_ is ValueCellFull!197) mapDefault!620)) b!8810))

(assert (= start!1020 b!8799))

(declare-fun m!5437 () Bool)

(assert (=> start!1020 m!5437))

(declare-fun m!5439 () Bool)

(assert (=> start!1020 m!5439))

(declare-fun m!5441 () Bool)

(assert (=> start!1020 m!5441))

(declare-fun m!5443 () Bool)

(assert (=> b!8805 m!5443))

(assert (=> b!8805 m!5443))

(declare-fun m!5445 () Bool)

(assert (=> b!8805 m!5445))

(declare-fun m!5447 () Bool)

(assert (=> b!8800 m!5447))

(declare-fun m!5449 () Bool)

(assert (=> b!8803 m!5449))

(declare-fun m!5451 () Bool)

(assert (=> b!8803 m!5451))

(declare-fun m!5453 () Bool)

(assert (=> b!8807 m!5453))

(declare-fun m!5455 () Bool)

(assert (=> b!8807 m!5455))

(declare-fun m!5457 () Bool)

(assert (=> b!8807 m!5457))

(assert (=> b!8801 m!5449))

(declare-fun m!5459 () Bool)

(assert (=> b!8808 m!5459))

(declare-fun m!5461 () Bool)

(assert (=> b!8809 m!5461))

(declare-fun m!5463 () Bool)

(assert (=> mapNonEmpty!620 m!5463))

(check-sat b_and!501 (not b!8807) (not b!8801) (not b!8809) (not b!8808) (not mapNonEmpty!620) (not b!8800) (not b!8803) tp_is_empty!427 (not b!8805) (not b_next!349) (not start!1020))
(check-sat b_and!501 (not b_next!349))
