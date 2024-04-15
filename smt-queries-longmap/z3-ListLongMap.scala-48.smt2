; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!800 () Bool)

(assert start!800)

(declare-fun b_free!193 () Bool)

(declare-fun b_next!193 () Bool)

(assert (=> start!800 (= b_free!193 (not b_next!193))))

(declare-fun tp!808 () Bool)

(declare-fun b_and!339 () Bool)

(assert (=> start!800 (= tp!808 b_and!339)))

(declare-fun b!5940 () Bool)

(declare-fun res!6517 () Bool)

(declare-fun e!3239 () Bool)

(assert (=> b!5940 (=> (not res!6517) (not e!3239))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!539 0))(
  ( (V!540 (val!141 Int)) )
))
(declare-datatypes ((ValueCell!119 0))(
  ( (ValueCellFull!119 (v!1232 V!539)) (EmptyCell!119) )
))
(declare-datatypes ((array!469 0))(
  ( (array!470 (arr!223 (Array (_ BitVec 32) ValueCell!119)) (size!285 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!469)

(declare-fun minValue!1434 () V!539)

(declare-datatypes ((array!471 0))(
  ( (array!472 (arr!224 (Array (_ BitVec 32) (_ BitVec 64))) (size!286 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!471)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!539)

(declare-datatypes ((tuple2!138 0))(
  ( (tuple2!139 (_1!69 (_ BitVec 64)) (_2!69 V!539)) )
))
(declare-datatypes ((List!148 0))(
  ( (Nil!145) (Cons!144 (h!710 tuple2!138) (t!2283 List!148)) )
))
(declare-datatypes ((ListLongMap!143 0))(
  ( (ListLongMap!144 (toList!87 List!148)) )
))
(declare-fun contains!61 (ListLongMap!143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!46 (array!471 array!469 (_ BitVec 32) (_ BitVec 32) V!539 V!539 (_ BitVec 32) Int) ListLongMap!143)

(assert (=> b!5940 (= res!6517 (contains!61 (getCurrentListMap!46 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!5941 () Bool)

(declare-fun e!3241 () Bool)

(assert (=> b!5941 (= e!3239 (not e!3241))))

(declare-fun res!6521 () Bool)

(assert (=> b!5941 (=> res!6521 e!3241)))

(declare-fun arrayContainsKey!0 (array!471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5941 (= res!6521 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3242 () Bool)

(assert (=> b!5941 e!3242))

(declare-fun c!422 () Bool)

(assert (=> b!5941 (= c!422 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!89 0))(
  ( (Unit!90) )
))
(declare-fun lt!1080 () Unit!89)

(declare-fun lemmaKeyInListMapIsInArray!30 (array!471 array!469 (_ BitVec 32) (_ BitVec 32) V!539 V!539 (_ BitVec 64) Int) Unit!89)

(assert (=> b!5941 (= lt!1080 (lemmaKeyInListMapIsInArray!30 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!377 () Bool)

(declare-fun mapRes!377 () Bool)

(declare-fun tp!809 () Bool)

(declare-fun e!3238 () Bool)

(assert (=> mapNonEmpty!377 (= mapRes!377 (and tp!809 e!3238))))

(declare-fun mapValue!377 () ValueCell!119)

(declare-fun mapRest!377 () (Array (_ BitVec 32) ValueCell!119))

(declare-fun mapKey!377 () (_ BitVec 32))

(assert (=> mapNonEmpty!377 (= (arr!223 _values!1492) (store mapRest!377 mapKey!377 mapValue!377))))

(declare-fun b!5942 () Bool)

(assert (=> b!5942 (= e!3242 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5943 () Bool)

(declare-fun res!6522 () Bool)

(assert (=> b!5943 (=> (not res!6522) (not e!3239))))

(declare-datatypes ((List!149 0))(
  ( (Nil!146) (Cons!145 (h!711 (_ BitVec 64)) (t!2284 List!149)) )
))
(declare-fun arrayNoDuplicates!0 (array!471 (_ BitVec 32) List!149) Bool)

(assert (=> b!5943 (= res!6522 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!146))))

(declare-fun b!5944 () Bool)

(declare-fun res!6519 () Bool)

(assert (=> b!5944 (=> (not res!6519) (not e!3239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5944 (= res!6519 (validKeyInArray!0 k0!1278))))

(declare-fun b!5945 () Bool)

(assert (=> b!5945 (= e!3241 true)))

(declare-fun lt!1079 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!471 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5945 (= lt!1079 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!5946 () Bool)

(declare-fun e!3240 () Bool)

(declare-fun tp_is_empty!271 () Bool)

(assert (=> b!5946 (= e!3240 tp_is_empty!271)))

(declare-fun b!5947 () Bool)

(declare-fun res!6518 () Bool)

(assert (=> b!5947 (=> (not res!6518) (not e!3239))))

(assert (=> b!5947 (= res!6518 (and (= (size!285 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!286 _keys!1806) (size!285 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5948 () Bool)

(declare-fun res!6520 () Bool)

(assert (=> b!5948 (=> (not res!6520) (not e!3239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!471 (_ BitVec 32)) Bool)

(assert (=> b!5948 (= res!6520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5949 () Bool)

(assert (=> b!5949 (= e!3238 tp_is_empty!271)))

(declare-fun b!5950 () Bool)

(declare-fun e!3236 () Bool)

(assert (=> b!5950 (= e!3236 (and e!3240 mapRes!377))))

(declare-fun condMapEmpty!377 () Bool)

(declare-fun mapDefault!377 () ValueCell!119)

(assert (=> b!5950 (= condMapEmpty!377 (= (arr!223 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!119)) mapDefault!377)))))

(declare-fun b!5951 () Bool)

(assert (=> b!5951 (= e!3242 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!6523 () Bool)

(assert (=> start!800 (=> (not res!6523) (not e!3239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!800 (= res!6523 (validMask!0 mask!2250))))

(assert (=> start!800 e!3239))

(assert (=> start!800 tp!808))

(assert (=> start!800 true))

(declare-fun array_inv!157 (array!469) Bool)

(assert (=> start!800 (and (array_inv!157 _values!1492) e!3236)))

(assert (=> start!800 tp_is_empty!271))

(declare-fun array_inv!158 (array!471) Bool)

(assert (=> start!800 (array_inv!158 _keys!1806)))

(declare-fun mapIsEmpty!377 () Bool)

(assert (=> mapIsEmpty!377 mapRes!377))

(assert (= (and start!800 res!6523) b!5947))

(assert (= (and b!5947 res!6518) b!5948))

(assert (= (and b!5948 res!6520) b!5943))

(assert (= (and b!5943 res!6522) b!5940))

(assert (= (and b!5940 res!6517) b!5944))

(assert (= (and b!5944 res!6519) b!5941))

(assert (= (and b!5941 c!422) b!5942))

(assert (= (and b!5941 (not c!422)) b!5951))

(assert (= (and b!5941 (not res!6521)) b!5945))

(assert (= (and b!5950 condMapEmpty!377) mapIsEmpty!377))

(assert (= (and b!5950 (not condMapEmpty!377)) mapNonEmpty!377))

(get-info :version)

(assert (= (and mapNonEmpty!377 ((_ is ValueCellFull!119) mapValue!377)) b!5949))

(assert (= (and b!5950 ((_ is ValueCellFull!119) mapDefault!377)) b!5946))

(assert (= start!800 b!5950))

(declare-fun m!3353 () Bool)

(assert (=> b!5943 m!3353))

(declare-fun m!3355 () Bool)

(assert (=> b!5944 m!3355))

(declare-fun m!3357 () Bool)

(assert (=> start!800 m!3357))

(declare-fun m!3359 () Bool)

(assert (=> start!800 m!3359))

(declare-fun m!3361 () Bool)

(assert (=> start!800 m!3361))

(declare-fun m!3363 () Bool)

(assert (=> b!5941 m!3363))

(declare-fun m!3365 () Bool)

(assert (=> b!5941 m!3365))

(declare-fun m!3367 () Bool)

(assert (=> b!5945 m!3367))

(declare-fun m!3369 () Bool)

(assert (=> b!5948 m!3369))

(assert (=> b!5942 m!3363))

(declare-fun m!3371 () Bool)

(assert (=> mapNonEmpty!377 m!3371))

(declare-fun m!3373 () Bool)

(assert (=> b!5940 m!3373))

(assert (=> b!5940 m!3373))

(declare-fun m!3375 () Bool)

(assert (=> b!5940 m!3375))

(check-sat (not b!5942) (not b!5943) tp_is_empty!271 (not b!5948) (not b!5944) (not b!5941) (not start!800) (not b!5940) (not b_next!193) (not b!5945) (not mapNonEmpty!377) b_and!339)
(check-sat b_and!339 (not b_next!193))
