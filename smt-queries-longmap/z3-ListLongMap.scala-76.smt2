; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1034 () Bool)

(assert start!1034)

(declare-fun b_free!363 () Bool)

(declare-fun b_next!363 () Bool)

(assert (=> start!1034 (= b_free!363 (not b_next!363))))

(declare-fun tp!1328 () Bool)

(declare-fun b_and!515 () Bool)

(assert (=> start!1034 (= tp!1328 b_and!515)))

(declare-fun b!9051 () Bool)

(declare-fun res!8294 () Bool)

(declare-fun e!5165 () Bool)

(assert (=> b!9051 (=> (not res!8294) (not e!5165))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!765 0))(
  ( (V!766 (val!226 Int)) )
))
(declare-datatypes ((ValueCell!204 0))(
  ( (ValueCellFull!204 (v!1320 V!765)) (EmptyCell!204) )
))
(declare-datatypes ((array!815 0))(
  ( (array!816 (arr!393 (Array (_ BitVec 32) ValueCell!204)) (size!455 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!815)

(declare-datatypes ((array!817 0))(
  ( (array!818 (arr!394 (Array (_ BitVec 32) (_ BitVec 64))) (size!456 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!817)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!9051 (= res!8294 (and (= (size!455 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!456 _keys!1806) (size!455 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!641 () Bool)

(declare-fun mapRes!641 () Bool)

(assert (=> mapIsEmpty!641 mapRes!641))

(declare-fun b!9052 () Bool)

(declare-fun e!5162 () Bool)

(declare-fun tp_is_empty!441 () Bool)

(assert (=> b!9052 (= e!5162 tp_is_empty!441)))

(declare-fun b!9053 () Bool)

(declare-fun res!8298 () Bool)

(assert (=> b!9053 (=> (not res!8298) (not e!5165))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9053 (= res!8298 (validKeyInArray!0 k0!1278))))

(declare-fun b!9054 () Bool)

(declare-fun e!5166 () Bool)

(declare-fun arrayContainsKey!0 (array!817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9054 (= e!5166 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun res!8299 () Bool)

(assert (=> start!1034 (=> (not res!8299) (not e!5165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1034 (= res!8299 (validMask!0 mask!2250))))

(assert (=> start!1034 e!5165))

(assert (=> start!1034 tp!1328))

(assert (=> start!1034 true))

(declare-fun e!5168 () Bool)

(declare-fun array_inv!289 (array!815) Bool)

(assert (=> start!1034 (and (array_inv!289 _values!1492) e!5168)))

(assert (=> start!1034 tp_is_empty!441))

(declare-fun array_inv!290 (array!817) Bool)

(assert (=> start!1034 (array_inv!290 _keys!1806)))

(declare-fun b!9055 () Bool)

(assert (=> b!9055 (= e!5166 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9056 () Bool)

(declare-fun e!5164 () Bool)

(assert (=> b!9056 (= e!5164 tp_is_empty!441)))

(declare-fun b!9057 () Bool)

(declare-fun res!8295 () Bool)

(assert (=> b!9057 (=> (not res!8295) (not e!5165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!817 (_ BitVec 32)) Bool)

(assert (=> b!9057 (= res!8295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!641 () Bool)

(declare-fun tp!1327 () Bool)

(assert (=> mapNonEmpty!641 (= mapRes!641 (and tp!1327 e!5162))))

(declare-fun mapKey!641 () (_ BitVec 32))

(declare-fun mapRest!641 () (Array (_ BitVec 32) ValueCell!204))

(declare-fun mapValue!641 () ValueCell!204)

(assert (=> mapNonEmpty!641 (= (arr!393 _values!1492) (store mapRest!641 mapKey!641 mapValue!641))))

(declare-fun b!9058 () Bool)

(declare-fun e!5163 () Bool)

(assert (=> b!9058 (= e!5163 true)))

(declare-fun lt!1962 () (_ BitVec 32))

(assert (=> b!9058 (arrayForallSeekEntryOrOpenFound!0 lt!1962 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!183 0))(
  ( (Unit!184) )
))
(declare-fun lt!1961 () Unit!183)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!183)

(assert (=> b!9058 (= lt!1961 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1962))))

(declare-fun arrayScanForKey!0 (array!817 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9058 (= lt!1962 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9059 () Bool)

(assert (=> b!9059 (= e!5168 (and e!5164 mapRes!641))))

(declare-fun condMapEmpty!641 () Bool)

(declare-fun mapDefault!641 () ValueCell!204)

(assert (=> b!9059 (= condMapEmpty!641 (= (arr!393 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!204)) mapDefault!641)))))

(declare-fun b!9060 () Bool)

(declare-fun res!8293 () Bool)

(assert (=> b!9060 (=> (not res!8293) (not e!5165))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!765)

(declare-fun zeroValue!1434 () V!765)

(declare-datatypes ((tuple2!264 0))(
  ( (tuple2!265 (_1!132 (_ BitVec 64)) (_2!132 V!765)) )
))
(declare-datatypes ((List!274 0))(
  ( (Nil!271) (Cons!270 (h!836 tuple2!264) (t!2415 List!274)) )
))
(declare-datatypes ((ListLongMap!269 0))(
  ( (ListLongMap!270 (toList!150 List!274)) )
))
(declare-fun contains!127 (ListLongMap!269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!109 (array!817 array!815 (_ BitVec 32) (_ BitVec 32) V!765 V!765 (_ BitVec 32) Int) ListLongMap!269)

(assert (=> b!9060 (= res!8293 (contains!127 (getCurrentListMap!109 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!9061 () Bool)

(declare-fun res!8297 () Bool)

(assert (=> b!9061 (=> (not res!8297) (not e!5165))))

(declare-datatypes ((List!275 0))(
  ( (Nil!272) (Cons!271 (h!837 (_ BitVec 64)) (t!2416 List!275)) )
))
(declare-fun arrayNoDuplicates!0 (array!817 (_ BitVec 32) List!275) Bool)

(assert (=> b!9061 (= res!8297 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!272))))

(declare-fun b!9062 () Bool)

(assert (=> b!9062 (= e!5165 (not e!5163))))

(declare-fun res!8296 () Bool)

(assert (=> b!9062 (=> res!8296 e!5163)))

(assert (=> b!9062 (= res!8296 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!9062 e!5166))

(declare-fun c!692 () Bool)

(assert (=> b!9062 (= c!692 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1960 () Unit!183)

(declare-fun lemmaKeyInListMapIsInArray!68 (array!817 array!815 (_ BitVec 32) (_ BitVec 32) V!765 V!765 (_ BitVec 64) Int) Unit!183)

(assert (=> b!9062 (= lt!1960 (lemmaKeyInListMapIsInArray!68 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (= (and start!1034 res!8299) b!9051))

(assert (= (and b!9051 res!8294) b!9057))

(assert (= (and b!9057 res!8295) b!9061))

(assert (= (and b!9061 res!8297) b!9060))

(assert (= (and b!9060 res!8293) b!9053))

(assert (= (and b!9053 res!8298) b!9062))

(assert (= (and b!9062 c!692) b!9054))

(assert (= (and b!9062 (not c!692)) b!9055))

(assert (= (and b!9062 (not res!8296)) b!9058))

(assert (= (and b!9059 condMapEmpty!641) mapIsEmpty!641))

(assert (= (and b!9059 (not condMapEmpty!641)) mapNonEmpty!641))

(get-info :version)

(assert (= (and mapNonEmpty!641 ((_ is ValueCellFull!204) mapValue!641)) b!9052))

(assert (= (and b!9059 ((_ is ValueCellFull!204) mapDefault!641)) b!9056))

(assert (= start!1034 b!9059))

(declare-fun m!5633 () Bool)

(assert (=> b!9058 m!5633))

(declare-fun m!5635 () Bool)

(assert (=> b!9058 m!5635))

(declare-fun m!5637 () Bool)

(assert (=> b!9058 m!5637))

(declare-fun m!5639 () Bool)

(assert (=> b!9053 m!5639))

(declare-fun m!5641 () Bool)

(assert (=> b!9057 m!5641))

(declare-fun m!5643 () Bool)

(assert (=> b!9060 m!5643))

(assert (=> b!9060 m!5643))

(declare-fun m!5645 () Bool)

(assert (=> b!9060 m!5645))

(declare-fun m!5647 () Bool)

(assert (=> start!1034 m!5647))

(declare-fun m!5649 () Bool)

(assert (=> start!1034 m!5649))

(declare-fun m!5651 () Bool)

(assert (=> start!1034 m!5651))

(declare-fun m!5653 () Bool)

(assert (=> b!9054 m!5653))

(declare-fun m!5655 () Bool)

(assert (=> mapNonEmpty!641 m!5655))

(assert (=> b!9062 m!5653))

(declare-fun m!5657 () Bool)

(assert (=> b!9062 m!5657))

(declare-fun m!5659 () Bool)

(assert (=> b!9061 m!5659))

(check-sat (not b!9057) (not b!9062) b_and!515 (not start!1034) (not b!9058) tp_is_empty!441 (not b!9060) (not b!9054) (not b!9053) (not mapNonEmpty!641) (not b!9061) (not b_next!363))
(check-sat b_and!515 (not b_next!363))
