; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1038 () Bool)

(assert start!1038)

(declare-fun b_free!367 () Bool)

(declare-fun b_next!367 () Bool)

(assert (=> start!1038 (= b_free!367 (not b_next!367))))

(declare-fun tp!1339 () Bool)

(declare-fun b_and!519 () Bool)

(assert (=> start!1038 (= tp!1339 b_and!519)))

(declare-fun b!9123 () Bool)

(declare-fun res!8340 () Bool)

(declare-fun e!5210 () Bool)

(assert (=> b!9123 (=> (not res!8340) (not e!5210))))

(declare-datatypes ((array!805 0))(
  ( (array!806 (arr!388 (Array (_ BitVec 32) (_ BitVec 64))) (size!450 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!805)

(declare-datatypes ((List!272 0))(
  ( (Nil!269) (Cons!268 (h!834 (_ BitVec 64)) (t!2413 List!272)) )
))
(declare-fun arrayNoDuplicates!0 (array!805 (_ BitVec 32) List!272) Bool)

(assert (=> b!9123 (= res!8340 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!269))))

(declare-fun b!9124 () Bool)

(declare-fun e!5209 () Bool)

(assert (=> b!9124 (= e!5209 true)))

(declare-fun lt!1979 () (_ BitVec 32))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!805 (_ BitVec 32)) Bool)

(assert (=> b!9124 (arrayForallSeekEntryOrOpenFound!0 lt!1979 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!193 0))(
  ( (Unit!194) )
))
(declare-fun lt!1978 () Unit!193)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!193)

(assert (=> b!9124 (= lt!1978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1979))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!805 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9124 (= lt!1979 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9125 () Bool)

(declare-fun e!5206 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!9125 (= e!5206 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!647 () Bool)

(declare-fun mapRes!647 () Bool)

(assert (=> mapIsEmpty!647 mapRes!647))

(declare-fun b!9126 () Bool)

(declare-fun arrayContainsKey!0 (array!805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9126 (= e!5206 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun res!8339 () Bool)

(assert (=> start!1038 (=> (not res!8339) (not e!5210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1038 (= res!8339 (validMask!0 mask!2250))))

(assert (=> start!1038 e!5210))

(assert (=> start!1038 tp!1339))

(assert (=> start!1038 true))

(declare-datatypes ((V!771 0))(
  ( (V!772 (val!228 Int)) )
))
(declare-datatypes ((ValueCell!206 0))(
  ( (ValueCellFull!206 (v!1322 V!771)) (EmptyCell!206) )
))
(declare-datatypes ((array!807 0))(
  ( (array!808 (arr!389 (Array (_ BitVec 32) ValueCell!206)) (size!451 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!807)

(declare-fun e!5207 () Bool)

(declare-fun array_inv!287 (array!807) Bool)

(assert (=> start!1038 (and (array_inv!287 _values!1492) e!5207)))

(declare-fun tp_is_empty!445 () Bool)

(assert (=> start!1038 tp_is_empty!445))

(declare-fun array_inv!288 (array!805) Bool)

(assert (=> start!1038 (array_inv!288 _keys!1806)))

(declare-fun b!9127 () Bool)

(declare-fun e!5205 () Bool)

(assert (=> b!9127 (= e!5205 tp_is_empty!445)))

(declare-fun b!9128 () Bool)

(declare-fun res!8341 () Bool)

(assert (=> b!9128 (=> (not res!8341) (not e!5210))))

(assert (=> b!9128 (= res!8341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9129 () Bool)

(declare-fun e!5204 () Bool)

(assert (=> b!9129 (= e!5204 tp_is_empty!445)))

(declare-fun b!9130 () Bool)

(declare-fun res!8338 () Bool)

(assert (=> b!9130 (=> (not res!8338) (not e!5210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9130 (= res!8338 (validKeyInArray!0 k0!1278))))

(declare-fun b!9131 () Bool)

(declare-fun res!8337 () Bool)

(assert (=> b!9131 (=> (not res!8337) (not e!5210))))

(assert (=> b!9131 (= res!8337 (and (= (size!451 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!450 _keys!1806) (size!451 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9132 () Bool)

(assert (=> b!9132 (= e!5210 (not e!5209))))

(declare-fun res!8336 () Bool)

(assert (=> b!9132 (=> res!8336 e!5209)))

(assert (=> b!9132 (= res!8336 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!9132 e!5206))

(declare-fun c!698 () Bool)

(assert (=> b!9132 (= c!698 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!771)

(declare-fun lt!1980 () Unit!193)

(declare-fun zeroValue!1434 () V!771)

(declare-fun lemmaKeyInListMapIsInArray!74 (array!805 array!807 (_ BitVec 32) (_ BitVec 32) V!771 V!771 (_ BitVec 64) Int) Unit!193)

(assert (=> b!9132 (= lt!1980 (lemmaKeyInListMapIsInArray!74 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!647 () Bool)

(declare-fun tp!1340 () Bool)

(assert (=> mapNonEmpty!647 (= mapRes!647 (and tp!1340 e!5204))))

(declare-fun mapRest!647 () (Array (_ BitVec 32) ValueCell!206))

(declare-fun mapValue!647 () ValueCell!206)

(declare-fun mapKey!647 () (_ BitVec 32))

(assert (=> mapNonEmpty!647 (= (arr!389 _values!1492) (store mapRest!647 mapKey!647 mapValue!647))))

(declare-fun b!9133 () Bool)

(assert (=> b!9133 (= e!5207 (and e!5205 mapRes!647))))

(declare-fun condMapEmpty!647 () Bool)

(declare-fun mapDefault!647 () ValueCell!206)

(assert (=> b!9133 (= condMapEmpty!647 (= (arr!389 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!206)) mapDefault!647)))))

(declare-fun b!9134 () Bool)

(declare-fun res!8335 () Bool)

(assert (=> b!9134 (=> (not res!8335) (not e!5210))))

(declare-datatypes ((tuple2!260 0))(
  ( (tuple2!261 (_1!130 (_ BitVec 64)) (_2!130 V!771)) )
))
(declare-datatypes ((List!273 0))(
  ( (Nil!270) (Cons!269 (h!835 tuple2!260) (t!2414 List!273)) )
))
(declare-datatypes ((ListLongMap!265 0))(
  ( (ListLongMap!266 (toList!148 List!273)) )
))
(declare-fun contains!125 (ListLongMap!265 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!107 (array!805 array!807 (_ BitVec 32) (_ BitVec 32) V!771 V!771 (_ BitVec 32) Int) ListLongMap!265)

(assert (=> b!9134 (= res!8335 (contains!125 (getCurrentListMap!107 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(assert (= (and start!1038 res!8339) b!9131))

(assert (= (and b!9131 res!8337) b!9128))

(assert (= (and b!9128 res!8341) b!9123))

(assert (= (and b!9123 res!8340) b!9134))

(assert (= (and b!9134 res!8335) b!9130))

(assert (= (and b!9130 res!8338) b!9132))

(assert (= (and b!9132 c!698) b!9126))

(assert (= (and b!9132 (not c!698)) b!9125))

(assert (= (and b!9132 (not res!8336)) b!9124))

(assert (= (and b!9133 condMapEmpty!647) mapIsEmpty!647))

(assert (= (and b!9133 (not condMapEmpty!647)) mapNonEmpty!647))

(get-info :version)

(assert (= (and mapNonEmpty!647 ((_ is ValueCellFull!206) mapValue!647)) b!9129))

(assert (= (and b!9133 ((_ is ValueCellFull!206) mapDefault!647)) b!9127))

(assert (= start!1038 b!9133))

(declare-fun m!5689 () Bool)

(assert (=> start!1038 m!5689))

(declare-fun m!5691 () Bool)

(assert (=> start!1038 m!5691))

(declare-fun m!5693 () Bool)

(assert (=> start!1038 m!5693))

(declare-fun m!5695 () Bool)

(assert (=> b!9130 m!5695))

(declare-fun m!5697 () Bool)

(assert (=> b!9124 m!5697))

(declare-fun m!5699 () Bool)

(assert (=> b!9124 m!5699))

(declare-fun m!5701 () Bool)

(assert (=> b!9124 m!5701))

(declare-fun m!5703 () Bool)

(assert (=> b!9123 m!5703))

(declare-fun m!5705 () Bool)

(assert (=> b!9128 m!5705))

(declare-fun m!5707 () Bool)

(assert (=> mapNonEmpty!647 m!5707))

(declare-fun m!5709 () Bool)

(assert (=> b!9126 m!5709))

(assert (=> b!9132 m!5709))

(declare-fun m!5711 () Bool)

(assert (=> b!9132 m!5711))

(declare-fun m!5713 () Bool)

(assert (=> b!9134 m!5713))

(assert (=> b!9134 m!5713))

(declare-fun m!5715 () Bool)

(assert (=> b!9134 m!5715))

(check-sat (not b!9128) tp_is_empty!445 (not b!9124) (not b!9123) (not start!1038) (not b_next!367) b_and!519 (not b!9126) (not b!9130) (not b!9132) (not b!9134) (not mapNonEmpty!647))
(check-sat b_and!519 (not b_next!367))
