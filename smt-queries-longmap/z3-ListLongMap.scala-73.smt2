; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1016 () Bool)

(assert start!1016)

(declare-fun b_free!345 () Bool)

(declare-fun b_next!345 () Bool)

(assert (=> start!1016 (= b_free!345 (not b_next!345))))

(declare-fun tp!1273 () Bool)

(declare-fun b_and!497 () Bool)

(assert (=> start!1016 (= tp!1273 b_and!497)))

(declare-fun b!8727 () Bool)

(declare-fun e!4976 () Bool)

(declare-datatypes ((array!779 0))(
  ( (array!780 (arr!375 (Array (_ BitVec 32) (_ BitVec 64))) (size!437 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!779)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8727 (= e!4976 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8728 () Bool)

(declare-fun res!8104 () Bool)

(declare-fun e!4977 () Bool)

(assert (=> b!8728 (=> (not res!8104) (not e!4977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8728 (= res!8104 (validKeyInArray!0 k0!1278))))

(declare-fun b!8729 () Bool)

(declare-fun res!8107 () Bool)

(assert (=> b!8729 (=> (not res!8107) (not e!4977))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!779 (_ BitVec 32)) Bool)

(assert (=> b!8729 (= res!8107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8731 () Bool)

(declare-fun e!4979 () Bool)

(declare-fun tp_is_empty!423 () Bool)

(assert (=> b!8731 (= e!4979 tp_is_empty!423)))

(declare-fun b!8732 () Bool)

(declare-fun e!4973 () Bool)

(assert (=> b!8732 (= e!4977 (not e!4973))))

(declare-fun res!8106 () Bool)

(assert (=> b!8732 (=> res!8106 e!4973)))

(assert (=> b!8732 (= res!8106 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8732 e!4976))

(declare-fun c!665 () Bool)

(assert (=> b!8732 (= c!665 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!741 0))(
  ( (V!742 (val!217 Int)) )
))
(declare-datatypes ((ValueCell!195 0))(
  ( (ValueCellFull!195 (v!1311 V!741)) (EmptyCell!195) )
))
(declare-datatypes ((array!781 0))(
  ( (array!782 (arr!376 (Array (_ BitVec 32) ValueCell!195)) (size!438 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!781)

(declare-fun minValue!1434 () V!741)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!741)

(declare-datatypes ((Unit!171 0))(
  ( (Unit!172) )
))
(declare-fun lt!1884 () Unit!171)

(declare-fun defaultEntry!1495 () Int)

(declare-fun lemmaKeyInListMapIsInArray!64 (array!779 array!781 (_ BitVec 32) (_ BitVec 32) V!741 V!741 (_ BitVec 64) Int) Unit!171)

(assert (=> b!8732 (= lt!1884 (lemmaKeyInListMapIsInArray!64 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!614 () Bool)

(declare-fun mapRes!614 () Bool)

(declare-fun tp!1274 () Bool)

(assert (=> mapNonEmpty!614 (= mapRes!614 (and tp!1274 e!4979))))

(declare-fun mapKey!614 () (_ BitVec 32))

(declare-fun mapValue!614 () ValueCell!195)

(declare-fun mapRest!614 () (Array (_ BitVec 32) ValueCell!195))

(assert (=> mapNonEmpty!614 (= (arr!376 _values!1492) (store mapRest!614 mapKey!614 mapValue!614))))

(declare-fun b!8733 () Bool)

(assert (=> b!8733 (= e!4976 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!8108 () Bool)

(assert (=> start!1016 (=> (not res!8108) (not e!4977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1016 (= res!8108 (validMask!0 mask!2250))))

(assert (=> start!1016 e!4977))

(assert (=> start!1016 tp!1273))

(assert (=> start!1016 true))

(declare-fun e!4978 () Bool)

(declare-fun array_inv!279 (array!781) Bool)

(assert (=> start!1016 (and (array_inv!279 _values!1492) e!4978)))

(assert (=> start!1016 tp_is_empty!423))

(declare-fun array_inv!280 (array!779) Bool)

(assert (=> start!1016 (array_inv!280 _keys!1806)))

(declare-fun b!8730 () Bool)

(declare-fun e!4975 () Bool)

(assert (=> b!8730 (= e!4975 tp_is_empty!423)))

(declare-fun b!8734 () Bool)

(declare-fun res!8110 () Bool)

(assert (=> b!8734 (=> (not res!8110) (not e!4977))))

(assert (=> b!8734 (= res!8110 (and (= (size!438 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!437 _keys!1806) (size!438 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!614 () Bool)

(assert (=> mapIsEmpty!614 mapRes!614))

(declare-fun b!8735 () Bool)

(assert (=> b!8735 (= e!4978 (and e!4975 mapRes!614))))

(declare-fun condMapEmpty!614 () Bool)

(declare-fun mapDefault!614 () ValueCell!195)

(assert (=> b!8735 (= condMapEmpty!614 (= (arr!376 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!195)) mapDefault!614)))))

(declare-fun b!8736 () Bool)

(declare-fun res!8105 () Bool)

(assert (=> b!8736 (=> (not res!8105) (not e!4977))))

(declare-datatypes ((List!260 0))(
  ( (Nil!257) (Cons!256 (h!822 (_ BitVec 64)) (t!2401 List!260)) )
))
(declare-fun arrayNoDuplicates!0 (array!779 (_ BitVec 32) List!260) Bool)

(assert (=> b!8736 (= res!8105 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!257))))

(declare-fun b!8737 () Bool)

(assert (=> b!8737 (= e!4973 true)))

(declare-fun lt!1883 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!779 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8737 (= lt!1883 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8738 () Bool)

(declare-fun res!8109 () Bool)

(assert (=> b!8738 (=> (not res!8109) (not e!4977))))

(declare-datatypes ((tuple2!250 0))(
  ( (tuple2!251 (_1!125 (_ BitVec 64)) (_2!125 V!741)) )
))
(declare-datatypes ((List!261 0))(
  ( (Nil!258) (Cons!257 (h!823 tuple2!250) (t!2402 List!261)) )
))
(declare-datatypes ((ListLongMap!255 0))(
  ( (ListLongMap!256 (toList!143 List!261)) )
))
(declare-fun contains!120 (ListLongMap!255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!102 (array!779 array!781 (_ BitVec 32) (_ BitVec 32) V!741 V!741 (_ BitVec 32) Int) ListLongMap!255)

(assert (=> b!8738 (= res!8109 (contains!120 (getCurrentListMap!102 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(assert (= (and start!1016 res!8108) b!8734))

(assert (= (and b!8734 res!8110) b!8729))

(assert (= (and b!8729 res!8107) b!8736))

(assert (= (and b!8736 res!8105) b!8738))

(assert (= (and b!8738 res!8109) b!8728))

(assert (= (and b!8728 res!8104) b!8732))

(assert (= (and b!8732 c!665) b!8727))

(assert (= (and b!8732 (not c!665)) b!8733))

(assert (= (and b!8732 (not res!8106)) b!8737))

(assert (= (and b!8735 condMapEmpty!614) mapIsEmpty!614))

(assert (= (and b!8735 (not condMapEmpty!614)) mapNonEmpty!614))

(get-info :version)

(assert (= (and mapNonEmpty!614 ((_ is ValueCellFull!195) mapValue!614)) b!8731))

(assert (= (and b!8735 ((_ is ValueCellFull!195) mapDefault!614)) b!8730))

(assert (= start!1016 b!8735))

(declare-fun m!5389 () Bool)

(assert (=> b!8736 m!5389))

(declare-fun m!5391 () Bool)

(assert (=> b!8728 m!5391))

(declare-fun m!5393 () Bool)

(assert (=> start!1016 m!5393))

(declare-fun m!5395 () Bool)

(assert (=> start!1016 m!5395))

(declare-fun m!5397 () Bool)

(assert (=> start!1016 m!5397))

(declare-fun m!5399 () Bool)

(assert (=> b!8738 m!5399))

(assert (=> b!8738 m!5399))

(declare-fun m!5401 () Bool)

(assert (=> b!8738 m!5401))

(declare-fun m!5403 () Bool)

(assert (=> b!8732 m!5403))

(declare-fun m!5405 () Bool)

(assert (=> b!8732 m!5405))

(assert (=> b!8727 m!5403))

(declare-fun m!5407 () Bool)

(assert (=> mapNonEmpty!614 m!5407))

(declare-fun m!5409 () Bool)

(assert (=> b!8729 m!5409))

(declare-fun m!5411 () Bool)

(assert (=> b!8737 m!5411))

(check-sat tp_is_empty!423 (not b!8738) (not b!8729) b_and!497 (not b_next!345) (not b!8727) (not b!8737) (not b!8736) (not b!8728) (not b!8732) (not start!1016) (not mapNonEmpty!614))
(check-sat b_and!497 (not b_next!345))
