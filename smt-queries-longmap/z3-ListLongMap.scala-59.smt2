; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!886 () Bool)

(assert start!886)

(declare-fun b_free!259 () Bool)

(declare-fun b_next!259 () Bool)

(assert (=> start!886 (= b_free!259 (not b_next!259))))

(declare-fun tp!1010 () Bool)

(declare-fun b_and!407 () Bool)

(assert (=> start!886 (= tp!1010 b_and!407)))

(declare-fun b!7337 () Bool)

(declare-fun res!7349 () Bool)

(declare-fun e!4075 () Bool)

(assert (=> b!7337 (=> (not res!7349) (not e!4075))))

(declare-datatypes ((array!599 0))(
  ( (array!600 (arr!287 (Array (_ BitVec 32) (_ BitVec 64))) (size!349 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!599)

(declare-datatypes ((List!193 0))(
  ( (Nil!190) (Cons!189 (h!755 (_ BitVec 64)) (t!2330 List!193)) )
))
(declare-fun arrayNoDuplicates!0 (array!599 (_ BitVec 32) List!193) Bool)

(assert (=> b!7337 (= res!7349 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!190))))

(declare-fun b!7338 () Bool)

(declare-fun e!4076 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7338 (= e!4076 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!7339 () Bool)

(declare-fun e!4072 () Bool)

(declare-fun e!4071 () Bool)

(declare-fun mapRes!479 () Bool)

(assert (=> b!7339 (= e!4072 (and e!4071 mapRes!479))))

(declare-fun condMapEmpty!479 () Bool)

(declare-datatypes ((V!627 0))(
  ( (V!628 (val!174 Int)) )
))
(declare-datatypes ((ValueCell!152 0))(
  ( (ValueCellFull!152 (v!1266 V!627)) (EmptyCell!152) )
))
(declare-datatypes ((array!601 0))(
  ( (array!602 (arr!288 (Array (_ BitVec 32) ValueCell!152)) (size!350 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!601)

(declare-fun mapDefault!479 () ValueCell!152)

(assert (=> b!7339 (= condMapEmpty!479 (= (arr!288 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!152)) mapDefault!479)))))

(declare-fun b!7340 () Bool)

(declare-fun res!7352 () Bool)

(assert (=> b!7340 (=> (not res!7352) (not e!4075))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7340 (= res!7352 (and (= (size!350 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!349 _keys!1806) (size!350 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7341 () Bool)

(declare-fun tp_is_empty!337 () Bool)

(assert (=> b!7341 (= e!4071 tp_is_empty!337)))

(declare-fun b!7342 () Bool)

(assert (=> b!7342 (= e!4076 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!7343 () Bool)

(declare-fun res!7354 () Bool)

(assert (=> b!7343 (=> (not res!7354) (not e!4075))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!627)

(declare-fun zeroValue!1434 () V!627)

(declare-datatypes ((tuple2!182 0))(
  ( (tuple2!183 (_1!91 (_ BitVec 64)) (_2!91 V!627)) )
))
(declare-datatypes ((List!194 0))(
  ( (Nil!191) (Cons!190 (h!756 tuple2!182) (t!2331 List!194)) )
))
(declare-datatypes ((ListLongMap!187 0))(
  ( (ListLongMap!188 (toList!109 List!194)) )
))
(declare-fun contains!84 (ListLongMap!187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!68 (array!599 array!601 (_ BitVec 32) (_ BitVec 32) V!627 V!627 (_ BitVec 32) Int) ListLongMap!187)

(assert (=> b!7343 (= res!7354 (contains!84 (getCurrentListMap!68 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapNonEmpty!479 () Bool)

(declare-fun tp!1009 () Bool)

(declare-fun e!4073 () Bool)

(assert (=> mapNonEmpty!479 (= mapRes!479 (and tp!1009 e!4073))))

(declare-fun mapKey!479 () (_ BitVec 32))

(declare-fun mapValue!479 () ValueCell!152)

(declare-fun mapRest!479 () (Array (_ BitVec 32) ValueCell!152))

(assert (=> mapNonEmpty!479 (= (arr!288 _values!1492) (store mapRest!479 mapKey!479 mapValue!479))))

(declare-fun b!7344 () Bool)

(assert (=> b!7344 (= e!4073 tp_is_empty!337)))

(declare-fun mapIsEmpty!479 () Bool)

(assert (=> mapIsEmpty!479 mapRes!479))

(declare-fun b!7345 () Bool)

(assert (=> b!7345 (= e!4075 (not true))))

(assert (=> b!7345 e!4076))

(declare-fun c!551 () Bool)

(assert (=> b!7345 (= c!551 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!143 0))(
  ( (Unit!144) )
))
(declare-fun lt!1527 () Unit!143)

(declare-fun lemmaKeyInListMapIsInArray!53 (array!599 array!601 (_ BitVec 32) (_ BitVec 32) V!627 V!627 (_ BitVec 64) Int) Unit!143)

(assert (=> b!7345 (= lt!1527 (lemmaKeyInListMapIsInArray!53 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun res!7351 () Bool)

(assert (=> start!886 (=> (not res!7351) (not e!4075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!886 (= res!7351 (validMask!0 mask!2250))))

(assert (=> start!886 e!4075))

(assert (=> start!886 tp!1010))

(assert (=> start!886 true))

(declare-fun array_inv!209 (array!601) Bool)

(assert (=> start!886 (and (array_inv!209 _values!1492) e!4072)))

(assert (=> start!886 tp_is_empty!337))

(declare-fun array_inv!210 (array!599) Bool)

(assert (=> start!886 (array_inv!210 _keys!1806)))

(declare-fun b!7346 () Bool)

(declare-fun res!7353 () Bool)

(assert (=> b!7346 (=> (not res!7353) (not e!4075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!7346 (= res!7353 (validKeyInArray!0 k0!1278))))

(declare-fun b!7347 () Bool)

(declare-fun res!7350 () Bool)

(assert (=> b!7347 (=> (not res!7350) (not e!4075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!599 (_ BitVec 32)) Bool)

(assert (=> b!7347 (= res!7350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!886 res!7351) b!7340))

(assert (= (and b!7340 res!7352) b!7347))

(assert (= (and b!7347 res!7350) b!7337))

(assert (= (and b!7337 res!7349) b!7343))

(assert (= (and b!7343 res!7354) b!7346))

(assert (= (and b!7346 res!7353) b!7345))

(assert (= (and b!7345 c!551) b!7338))

(assert (= (and b!7345 (not c!551)) b!7342))

(assert (= (and b!7339 condMapEmpty!479) mapIsEmpty!479))

(assert (= (and b!7339 (not condMapEmpty!479)) mapNonEmpty!479))

(get-info :version)

(assert (= (and mapNonEmpty!479 ((_ is ValueCellFull!152) mapValue!479)) b!7344))

(assert (= (and b!7339 ((_ is ValueCellFull!152) mapDefault!479)) b!7341))

(assert (= start!886 b!7339))

(declare-fun m!4403 () Bool)

(assert (=> b!7337 m!4403))

(declare-fun m!4405 () Bool)

(assert (=> b!7346 m!4405))

(declare-fun m!4407 () Bool)

(assert (=> b!7343 m!4407))

(assert (=> b!7343 m!4407))

(declare-fun m!4409 () Bool)

(assert (=> b!7343 m!4409))

(declare-fun m!4411 () Bool)

(assert (=> b!7345 m!4411))

(declare-fun m!4413 () Bool)

(assert (=> b!7347 m!4413))

(declare-fun m!4415 () Bool)

(assert (=> mapNonEmpty!479 m!4415))

(declare-fun m!4417 () Bool)

(assert (=> b!7338 m!4417))

(declare-fun m!4419 () Bool)

(assert (=> start!886 m!4419))

(declare-fun m!4421 () Bool)

(assert (=> start!886 m!4421))

(declare-fun m!4423 () Bool)

(assert (=> start!886 m!4423))

(check-sat (not b!7337) (not b!7347) (not mapNonEmpty!479) (not b!7346) (not b!7343) b_and!407 tp_is_empty!337 (not start!886) (not b!7338) (not b!7345) (not b_next!259))
(check-sat b_and!407 (not b_next!259))
