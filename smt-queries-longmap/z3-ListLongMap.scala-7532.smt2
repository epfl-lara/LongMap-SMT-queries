; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95490 () Bool)

(assert start!95490)

(declare-fun b!1078298 () Bool)

(declare-fun e!616529 () Bool)

(declare-fun e!616533 () Bool)

(assert (=> b!1078298 (= e!616529 e!616533)))

(declare-fun res!718549 () Bool)

(assert (=> b!1078298 (=> (not res!718549) (not e!616533))))

(declare-datatypes ((array!69218 0))(
  ( (array!69219 (arr!33284 (Array (_ BitVec 32) (_ BitVec 64))) (size!33822 (_ BitVec 32))) )
))
(declare-fun lt!478438 () array!69218)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69218 (_ BitVec 32)) Bool)

(assert (=> b!1078298 (= res!718549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478438 mask!1414))))

(declare-fun _keys!1070 () array!69218)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078298 (= lt!478438 (array!69219 (store (arr!33284 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33822 _keys!1070)))))

(declare-fun b!1078299 () Bool)

(declare-fun e!616534 () Bool)

(declare-fun e!616532 () Bool)

(declare-fun mapRes!41002 () Bool)

(assert (=> b!1078299 (= e!616534 (and e!616532 mapRes!41002))))

(declare-fun condMapEmpty!41002 () Bool)

(declare-datatypes ((V!40017 0))(
  ( (V!40018 (val!13140 Int)) )
))
(declare-datatypes ((ValueCell!12374 0))(
  ( (ValueCellFull!12374 (v!15760 V!40017)) (EmptyCell!12374) )
))
(declare-datatypes ((array!69220 0))(
  ( (array!69221 (arr!33285 (Array (_ BitVec 32) ValueCell!12374)) (size!33823 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69220)

(declare-fun mapDefault!41002 () ValueCell!12374)

(assert (=> b!1078299 (= condMapEmpty!41002 (= (arr!33285 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12374)) mapDefault!41002)))))

(declare-fun b!1078301 () Bool)

(declare-fun res!718546 () Bool)

(assert (=> b!1078301 (=> (not res!718546) (not e!616529))))

(assert (=> b!1078301 (= res!718546 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33822 _keys!1070))))))

(declare-fun mapIsEmpty!41002 () Bool)

(assert (=> mapIsEmpty!41002 mapRes!41002))

(declare-fun b!1078302 () Bool)

(assert (=> b!1078302 (= e!616533 false)))

(declare-fun lt!478439 () Bool)

(declare-datatypes ((List!23290 0))(
  ( (Nil!23287) (Cons!23286 (h!24495 (_ BitVec 64)) (t!32640 List!23290)) )
))
(declare-fun arrayNoDuplicates!0 (array!69218 (_ BitVec 32) List!23290) Bool)

(assert (=> b!1078302 (= lt!478439 (arrayNoDuplicates!0 lt!478438 #b00000000000000000000000000000000 Nil!23287))))

(declare-fun b!1078303 () Bool)

(declare-fun res!718550 () Bool)

(assert (=> b!1078303 (=> (not res!718550) (not e!616529))))

(assert (=> b!1078303 (= res!718550 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23287))))

(declare-fun b!1078304 () Bool)

(declare-fun res!718545 () Bool)

(assert (=> b!1078304 (=> (not res!718545) (not e!616529))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078304 (= res!718545 (validKeyInArray!0 k0!904))))

(declare-fun b!1078305 () Bool)

(declare-fun tp_is_empty!26167 () Bool)

(assert (=> b!1078305 (= e!616532 tp_is_empty!26167)))

(declare-fun res!718552 () Bool)

(assert (=> start!95490 (=> (not res!718552) (not e!616529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95490 (= res!718552 (validMask!0 mask!1414))))

(assert (=> start!95490 e!616529))

(assert (=> start!95490 true))

(declare-fun array_inv!25736 (array!69218) Bool)

(assert (=> start!95490 (array_inv!25736 _keys!1070)))

(declare-fun array_inv!25737 (array!69220) Bool)

(assert (=> start!95490 (and (array_inv!25737 _values!874) e!616534)))

(declare-fun b!1078300 () Bool)

(declare-fun res!718551 () Bool)

(assert (=> b!1078300 (=> (not res!718551) (not e!616529))))

(assert (=> b!1078300 (= res!718551 (= (select (arr!33284 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!41002 () Bool)

(declare-fun tp!78464 () Bool)

(declare-fun e!616531 () Bool)

(assert (=> mapNonEmpty!41002 (= mapRes!41002 (and tp!78464 e!616531))))

(declare-fun mapValue!41002 () ValueCell!12374)

(declare-fun mapRest!41002 () (Array (_ BitVec 32) ValueCell!12374))

(declare-fun mapKey!41002 () (_ BitVec 32))

(assert (=> mapNonEmpty!41002 (= (arr!33285 _values!874) (store mapRest!41002 mapKey!41002 mapValue!41002))))

(declare-fun b!1078306 () Bool)

(declare-fun res!718547 () Bool)

(assert (=> b!1078306 (=> (not res!718547) (not e!616529))))

(assert (=> b!1078306 (= res!718547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078307 () Bool)

(declare-fun res!718548 () Bool)

(assert (=> b!1078307 (=> (not res!718548) (not e!616529))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078307 (= res!718548 (and (= (size!33823 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33822 _keys!1070) (size!33823 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078308 () Bool)

(assert (=> b!1078308 (= e!616531 tp_is_empty!26167)))

(assert (= (and start!95490 res!718552) b!1078307))

(assert (= (and b!1078307 res!718548) b!1078306))

(assert (= (and b!1078306 res!718547) b!1078303))

(assert (= (and b!1078303 res!718550) b!1078301))

(assert (= (and b!1078301 res!718546) b!1078304))

(assert (= (and b!1078304 res!718545) b!1078300))

(assert (= (and b!1078300 res!718551) b!1078298))

(assert (= (and b!1078298 res!718549) b!1078302))

(assert (= (and b!1078299 condMapEmpty!41002) mapIsEmpty!41002))

(assert (= (and b!1078299 (not condMapEmpty!41002)) mapNonEmpty!41002))

(get-info :version)

(assert (= (and mapNonEmpty!41002 ((_ is ValueCellFull!12374) mapValue!41002)) b!1078308))

(assert (= (and b!1078299 ((_ is ValueCellFull!12374) mapDefault!41002)) b!1078305))

(assert (= start!95490 b!1078299))

(declare-fun m!996321 () Bool)

(assert (=> b!1078304 m!996321))

(declare-fun m!996323 () Bool)

(assert (=> b!1078306 m!996323))

(declare-fun m!996325 () Bool)

(assert (=> b!1078300 m!996325))

(declare-fun m!996327 () Bool)

(assert (=> b!1078302 m!996327))

(declare-fun m!996329 () Bool)

(assert (=> start!95490 m!996329))

(declare-fun m!996331 () Bool)

(assert (=> start!95490 m!996331))

(declare-fun m!996333 () Bool)

(assert (=> start!95490 m!996333))

(declare-fun m!996335 () Bool)

(assert (=> mapNonEmpty!41002 m!996335))

(declare-fun m!996337 () Bool)

(assert (=> b!1078298 m!996337))

(declare-fun m!996339 () Bool)

(assert (=> b!1078298 m!996339))

(declare-fun m!996341 () Bool)

(assert (=> b!1078303 m!996341))

(check-sat (not mapNonEmpty!41002) (not b!1078302) (not b!1078304) (not b!1078303) (not b!1078306) (not b!1078298) (not start!95490) tp_is_empty!26167)
(check-sat)
