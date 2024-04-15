; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43466 () Bool)

(assert start!43466)

(declare-fun b_free!12259 () Bool)

(declare-fun b_next!12259 () Bool)

(assert (=> start!43466 (= b_free!12259 (not b_next!12259))))

(declare-fun tp!43059 () Bool)

(declare-fun b_and!20993 () Bool)

(assert (=> start!43466 (= tp!43059 b_and!20993)))

(declare-fun b!481476 () Bool)

(declare-fun res!287067 () Bool)

(declare-fun e!283264 () Bool)

(assert (=> b!481476 (=> (not res!287067) (not e!283264))))

(declare-datatypes ((array!31203 0))(
  ( (array!31204 (arr!15004 (Array (_ BitVec 32) (_ BitVec 64))) (size!15363 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31203)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31203 (_ BitVec 32)) Bool)

(assert (=> b!481476 (= res!287067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481477 () Bool)

(declare-fun res!287066 () Bool)

(assert (=> b!481477 (=> (not res!287066) (not e!283264))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19433 0))(
  ( (V!19434 (val!6933 Int)) )
))
(declare-datatypes ((ValueCell!6524 0))(
  ( (ValueCellFull!6524 (v!9220 V!19433)) (EmptyCell!6524) )
))
(declare-datatypes ((array!31205 0))(
  ( (array!31206 (arr!15005 (Array (_ BitVec 32) ValueCell!6524)) (size!15364 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31205)

(assert (=> b!481477 (= res!287066 (and (= (size!15364 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15363 _keys!1874) (size!15364 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22366 () Bool)

(declare-fun mapRes!22366 () Bool)

(declare-fun tp!43060 () Bool)

(declare-fun e!283265 () Bool)

(assert (=> mapNonEmpty!22366 (= mapRes!22366 (and tp!43060 e!283265))))

(declare-fun mapRest!22366 () (Array (_ BitVec 32) ValueCell!6524))

(declare-fun mapKey!22366 () (_ BitVec 32))

(declare-fun mapValue!22366 () ValueCell!6524)

(assert (=> mapNonEmpty!22366 (= (arr!15005 _values!1516) (store mapRest!22366 mapKey!22366 mapValue!22366))))

(declare-fun b!481478 () Bool)

(declare-fun e!283268 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(assert (=> b!481478 (= e!283268 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481479 () Bool)

(declare-fun res!287064 () Bool)

(assert (=> b!481479 (=> (not res!287064) (not e!283264))))

(declare-fun minValue!1458 () V!19433)

(declare-fun zeroValue!1458 () V!19433)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9148 0))(
  ( (tuple2!9149 (_1!4585 (_ BitVec 64)) (_2!4585 V!19433)) )
))
(declare-datatypes ((List!9214 0))(
  ( (Nil!9211) (Cons!9210 (h!10066 tuple2!9148) (t!15419 List!9214)) )
))
(declare-datatypes ((ListLongMap!8051 0))(
  ( (ListLongMap!8052 (toList!4041 List!9214)) )
))
(declare-fun contains!2620 (ListLongMap!8051 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2294 (array!31203 array!31205 (_ BitVec 32) (_ BitVec 32) V!19433 V!19433 (_ BitVec 32) Int) ListLongMap!8051)

(assert (=> b!481479 (= res!287064 (contains!2620 (getCurrentListMap!2294 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481480 () Bool)

(assert (=> b!481480 (= e!283264 (not true))))

(declare-fun lt!218380 () (_ BitVec 32))

(assert (=> b!481480 (arrayForallSeekEntryOrOpenFound!0 lt!218380 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14118 0))(
  ( (Unit!14119) )
))
(declare-fun lt!218378 () Unit!14118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14118)

(assert (=> b!481480 (= lt!218378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218380))))

(declare-fun arrayScanForKey!0 (array!31203 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481480 (= lt!218380 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481480 e!283268))

(declare-fun c!57871 () Bool)

(assert (=> b!481480 (= c!57871 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218379 () Unit!14118)

(declare-fun lemmaKeyInListMapIsInArray!146 (array!31203 array!31205 (_ BitVec 32) (_ BitVec 32) V!19433 V!19433 (_ BitVec 64) Int) Unit!14118)

(assert (=> b!481480 (= lt!218379 (lemmaKeyInListMapIsInArray!146 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481481 () Bool)

(declare-fun tp_is_empty!13771 () Bool)

(assert (=> b!481481 (= e!283265 tp_is_empty!13771)))

(declare-fun b!481482 () Bool)

(declare-fun arrayContainsKey!0 (array!31203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481482 (= e!283268 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481483 () Bool)

(declare-fun res!287065 () Bool)

(assert (=> b!481483 (=> (not res!287065) (not e!283264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481483 (= res!287065 (validKeyInArray!0 k0!1332))))

(declare-fun res!287068 () Bool)

(assert (=> start!43466 (=> (not res!287068) (not e!283264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43466 (= res!287068 (validMask!0 mask!2352))))

(assert (=> start!43466 e!283264))

(assert (=> start!43466 true))

(assert (=> start!43466 tp_is_empty!13771))

(declare-fun e!283266 () Bool)

(declare-fun array_inv!10912 (array!31205) Bool)

(assert (=> start!43466 (and (array_inv!10912 _values!1516) e!283266)))

(assert (=> start!43466 tp!43059))

(declare-fun array_inv!10913 (array!31203) Bool)

(assert (=> start!43466 (array_inv!10913 _keys!1874)))

(declare-fun b!481484 () Bool)

(declare-fun res!287063 () Bool)

(assert (=> b!481484 (=> (not res!287063) (not e!283264))))

(declare-datatypes ((List!9215 0))(
  ( (Nil!9212) (Cons!9211 (h!10067 (_ BitVec 64)) (t!15420 List!9215)) )
))
(declare-fun arrayNoDuplicates!0 (array!31203 (_ BitVec 32) List!9215) Bool)

(assert (=> b!481484 (= res!287063 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9212))))

(declare-fun mapIsEmpty!22366 () Bool)

(assert (=> mapIsEmpty!22366 mapRes!22366))

(declare-fun b!481485 () Bool)

(declare-fun e!283269 () Bool)

(assert (=> b!481485 (= e!283269 tp_is_empty!13771)))

(declare-fun b!481486 () Bool)

(assert (=> b!481486 (= e!283266 (and e!283269 mapRes!22366))))

(declare-fun condMapEmpty!22366 () Bool)

(declare-fun mapDefault!22366 () ValueCell!6524)

(assert (=> b!481486 (= condMapEmpty!22366 (= (arr!15005 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6524)) mapDefault!22366)))))

(assert (= (and start!43466 res!287068) b!481477))

(assert (= (and b!481477 res!287066) b!481476))

(assert (= (and b!481476 res!287067) b!481484))

(assert (= (and b!481484 res!287063) b!481479))

(assert (= (and b!481479 res!287064) b!481483))

(assert (= (and b!481483 res!287065) b!481480))

(assert (= (and b!481480 c!57871) b!481482))

(assert (= (and b!481480 (not c!57871)) b!481478))

(assert (= (and b!481486 condMapEmpty!22366) mapIsEmpty!22366))

(assert (= (and b!481486 (not condMapEmpty!22366)) mapNonEmpty!22366))

(get-info :version)

(assert (= (and mapNonEmpty!22366 ((_ is ValueCellFull!6524) mapValue!22366)) b!481481))

(assert (= (and b!481486 ((_ is ValueCellFull!6524) mapDefault!22366)) b!481485))

(assert (= start!43466 b!481486))

(declare-fun m!462417 () Bool)

(assert (=> mapNonEmpty!22366 m!462417))

(declare-fun m!462419 () Bool)

(assert (=> b!481482 m!462419))

(declare-fun m!462421 () Bool)

(assert (=> b!481484 m!462421))

(declare-fun m!462423 () Bool)

(assert (=> b!481476 m!462423))

(declare-fun m!462425 () Bool)

(assert (=> start!43466 m!462425))

(declare-fun m!462427 () Bool)

(assert (=> start!43466 m!462427))

(declare-fun m!462429 () Bool)

(assert (=> start!43466 m!462429))

(declare-fun m!462431 () Bool)

(assert (=> b!481483 m!462431))

(declare-fun m!462433 () Bool)

(assert (=> b!481480 m!462433))

(declare-fun m!462435 () Bool)

(assert (=> b!481480 m!462435))

(declare-fun m!462437 () Bool)

(assert (=> b!481480 m!462437))

(declare-fun m!462439 () Bool)

(assert (=> b!481480 m!462439))

(declare-fun m!462441 () Bool)

(assert (=> b!481479 m!462441))

(assert (=> b!481479 m!462441))

(declare-fun m!462443 () Bool)

(assert (=> b!481479 m!462443))

(check-sat (not b!481483) b_and!20993 (not b_next!12259) (not b!481479) (not b!481484) tp_is_empty!13771 (not mapNonEmpty!22366) (not b!481476) (not b!481480) (not start!43466) (not b!481482))
(check-sat b_and!20993 (not b_next!12259))
