; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43460 () Bool)

(assert start!43460)

(declare-fun b_free!12253 () Bool)

(declare-fun b_next!12253 () Bool)

(assert (=> start!43460 (= b_free!12253 (not b_next!12253))))

(declare-fun tp!43041 () Bool)

(declare-fun b_and!20987 () Bool)

(assert (=> start!43460 (= tp!43041 b_and!20987)))

(declare-fun mapIsEmpty!22357 () Bool)

(declare-fun mapRes!22357 () Bool)

(assert (=> mapIsEmpty!22357 mapRes!22357))

(declare-fun b!481377 () Bool)

(declare-fun res!287014 () Bool)

(declare-fun e!283212 () Bool)

(assert (=> b!481377 (=> (not res!287014) (not e!283212))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19425 0))(
  ( (V!19426 (val!6930 Int)) )
))
(declare-fun minValue!1458 () V!19425)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19425)

(declare-datatypes ((ValueCell!6521 0))(
  ( (ValueCellFull!6521 (v!9217 V!19425)) (EmptyCell!6521) )
))
(declare-datatypes ((array!31193 0))(
  ( (array!31194 (arr!14999 (Array (_ BitVec 32) ValueCell!6521)) (size!15358 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31193)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31195 0))(
  ( (array!31196 (arr!15000 (Array (_ BitVec 32) (_ BitVec 64))) (size!15359 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31195)

(declare-datatypes ((tuple2!9144 0))(
  ( (tuple2!9145 (_1!4583 (_ BitVec 64)) (_2!4583 V!19425)) )
))
(declare-datatypes ((List!9210 0))(
  ( (Nil!9207) (Cons!9206 (h!10062 tuple2!9144) (t!15415 List!9210)) )
))
(declare-datatypes ((ListLongMap!8047 0))(
  ( (ListLongMap!8048 (toList!4039 List!9210)) )
))
(declare-fun contains!2618 (ListLongMap!8047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2292 (array!31195 array!31193 (_ BitVec 32) (_ BitVec 32) V!19425 V!19425 (_ BitVec 32) Int) ListLongMap!8047)

(assert (=> b!481377 (= res!287014 (contains!2618 (getCurrentListMap!2292 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!287010 () Bool)

(assert (=> start!43460 (=> (not res!287010) (not e!283212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43460 (= res!287010 (validMask!0 mask!2352))))

(assert (=> start!43460 e!283212))

(assert (=> start!43460 true))

(declare-fun tp_is_empty!13765 () Bool)

(assert (=> start!43460 tp_is_empty!13765))

(declare-fun e!283210 () Bool)

(declare-fun array_inv!10908 (array!31193) Bool)

(assert (=> start!43460 (and (array_inv!10908 _values!1516) e!283210)))

(assert (=> start!43460 tp!43041))

(declare-fun array_inv!10909 (array!31195) Bool)

(assert (=> start!43460 (array_inv!10909 _keys!1874)))

(declare-fun b!481378 () Bool)

(declare-fun e!283215 () Bool)

(assert (=> b!481378 (= e!283215 tp_is_empty!13765)))

(declare-fun b!481379 () Bool)

(declare-fun res!287009 () Bool)

(assert (=> b!481379 (=> (not res!287009) (not e!283212))))

(declare-datatypes ((List!9211 0))(
  ( (Nil!9208) (Cons!9207 (h!10063 (_ BitVec 64)) (t!15416 List!9211)) )
))
(declare-fun arrayNoDuplicates!0 (array!31195 (_ BitVec 32) List!9211) Bool)

(assert (=> b!481379 (= res!287009 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9208))))

(declare-fun mapNonEmpty!22357 () Bool)

(declare-fun tp!43042 () Bool)

(assert (=> mapNonEmpty!22357 (= mapRes!22357 (and tp!43042 e!283215))))

(declare-fun mapKey!22357 () (_ BitVec 32))

(declare-fun mapRest!22357 () (Array (_ BitVec 32) ValueCell!6521))

(declare-fun mapValue!22357 () ValueCell!6521)

(assert (=> mapNonEmpty!22357 (= (arr!14999 _values!1516) (store mapRest!22357 mapKey!22357 mapValue!22357))))

(declare-fun b!481380 () Bool)

(declare-fun res!287013 () Bool)

(assert (=> b!481380 (=> (not res!287013) (not e!283212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481380 (= res!287013 (validKeyInArray!0 k0!1332))))

(declare-fun b!481381 () Bool)

(declare-fun e!283214 () Bool)

(declare-fun arrayContainsKey!0 (array!31195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481381 (= e!283214 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481382 () Bool)

(declare-fun res!287011 () Bool)

(assert (=> b!481382 (=> (not res!287011) (not e!283212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31195 (_ BitVec 32)) Bool)

(assert (=> b!481382 (= res!287011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481383 () Bool)

(declare-fun e!283213 () Bool)

(assert (=> b!481383 (= e!283213 tp_is_empty!13765)))

(declare-fun b!481384 () Bool)

(assert (=> b!481384 (= e!283212 (not true))))

(declare-fun lt!218351 () (_ BitVec 32))

(assert (=> b!481384 (arrayForallSeekEntryOrOpenFound!0 lt!218351 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14114 0))(
  ( (Unit!14115) )
))
(declare-fun lt!218352 () Unit!14114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14114)

(assert (=> b!481384 (= lt!218352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218351))))

(declare-fun arrayScanForKey!0 (array!31195 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481384 (= lt!218351 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481384 e!283214))

(declare-fun c!57862 () Bool)

(assert (=> b!481384 (= c!57862 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218353 () Unit!14114)

(declare-fun lemmaKeyInListMapIsInArray!144 (array!31195 array!31193 (_ BitVec 32) (_ BitVec 32) V!19425 V!19425 (_ BitVec 64) Int) Unit!14114)

(assert (=> b!481384 (= lt!218353 (lemmaKeyInListMapIsInArray!144 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481385 () Bool)

(assert (=> b!481385 (= e!283214 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481386 () Bool)

(declare-fun res!287012 () Bool)

(assert (=> b!481386 (=> (not res!287012) (not e!283212))))

(assert (=> b!481386 (= res!287012 (and (= (size!15358 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15359 _keys!1874) (size!15358 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481387 () Bool)

(assert (=> b!481387 (= e!283210 (and e!283213 mapRes!22357))))

(declare-fun condMapEmpty!22357 () Bool)

(declare-fun mapDefault!22357 () ValueCell!6521)

(assert (=> b!481387 (= condMapEmpty!22357 (= (arr!14999 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6521)) mapDefault!22357)))))

(assert (= (and start!43460 res!287010) b!481386))

(assert (= (and b!481386 res!287012) b!481382))

(assert (= (and b!481382 res!287011) b!481379))

(assert (= (and b!481379 res!287009) b!481377))

(assert (= (and b!481377 res!287014) b!481380))

(assert (= (and b!481380 res!287013) b!481384))

(assert (= (and b!481384 c!57862) b!481381))

(assert (= (and b!481384 (not c!57862)) b!481385))

(assert (= (and b!481387 condMapEmpty!22357) mapIsEmpty!22357))

(assert (= (and b!481387 (not condMapEmpty!22357)) mapNonEmpty!22357))

(get-info :version)

(assert (= (and mapNonEmpty!22357 ((_ is ValueCellFull!6521) mapValue!22357)) b!481378))

(assert (= (and b!481387 ((_ is ValueCellFull!6521) mapDefault!22357)) b!481383))

(assert (= start!43460 b!481387))

(declare-fun m!462333 () Bool)

(assert (=> b!481382 m!462333))

(declare-fun m!462335 () Bool)

(assert (=> b!481381 m!462335))

(declare-fun m!462337 () Bool)

(assert (=> b!481384 m!462337))

(declare-fun m!462339 () Bool)

(assert (=> b!481384 m!462339))

(declare-fun m!462341 () Bool)

(assert (=> b!481384 m!462341))

(declare-fun m!462343 () Bool)

(assert (=> b!481384 m!462343))

(declare-fun m!462345 () Bool)

(assert (=> mapNonEmpty!22357 m!462345))

(declare-fun m!462347 () Bool)

(assert (=> b!481380 m!462347))

(declare-fun m!462349 () Bool)

(assert (=> start!43460 m!462349))

(declare-fun m!462351 () Bool)

(assert (=> start!43460 m!462351))

(declare-fun m!462353 () Bool)

(assert (=> start!43460 m!462353))

(declare-fun m!462355 () Bool)

(assert (=> b!481379 m!462355))

(declare-fun m!462357 () Bool)

(assert (=> b!481377 m!462357))

(assert (=> b!481377 m!462357))

(declare-fun m!462359 () Bool)

(assert (=> b!481377 m!462359))

(check-sat b_and!20987 (not start!43460) (not b_next!12253) (not b!481377) (not b!481381) (not b!481379) (not mapNonEmpty!22357) tp_is_empty!13765 (not b!481382) (not b!481384) (not b!481380))
(check-sat b_and!20987 (not b_next!12253))
