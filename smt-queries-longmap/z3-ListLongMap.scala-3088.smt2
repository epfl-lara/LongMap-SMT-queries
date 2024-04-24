; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43454 () Bool)

(assert start!43454)

(declare-fun b_free!12247 () Bool)

(declare-fun b_next!12247 () Bool)

(assert (=> start!43454 (= b_free!12247 (not b_next!12247))))

(declare-fun tp!43023 () Bool)

(declare-fun b_and!21017 () Bool)

(assert (=> start!43454 (= tp!43023 b_and!21017)))

(declare-fun b!481488 () Bool)

(declare-fun res!287082 () Bool)

(declare-fun e!283296 () Bool)

(assert (=> b!481488 (=> (not res!287082) (not e!283296))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19417 0))(
  ( (V!19418 (val!6927 Int)) )
))
(declare-fun minValue!1458 () V!19417)

(declare-fun zeroValue!1458 () V!19417)

(declare-datatypes ((ValueCell!6518 0))(
  ( (ValueCellFull!6518 (v!9221 V!19417)) (EmptyCell!6518) )
))
(declare-datatypes ((array!31168 0))(
  ( (array!31169 (arr!14986 (Array (_ BitVec 32) ValueCell!6518)) (size!15344 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31168)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31170 0))(
  ( (array!31171 (arr!14987 (Array (_ BitVec 32) (_ BitVec 64))) (size!15345 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31170)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((tuple2!9008 0))(
  ( (tuple2!9009 (_1!4515 (_ BitVec 64)) (_2!4515 V!19417)) )
))
(declare-datatypes ((List!9074 0))(
  ( (Nil!9071) (Cons!9070 (h!9926 tuple2!9008) (t!15280 List!9074)) )
))
(declare-datatypes ((ListLongMap!7923 0))(
  ( (ListLongMap!7924 (toList!3977 List!9074)) )
))
(declare-fun contains!2609 (ListLongMap!7923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2291 (array!31170 array!31168 (_ BitVec 32) (_ BitVec 32) V!19417 V!19417 (_ BitVec 32) Int) ListLongMap!7923)

(assert (=> b!481488 (= res!287082 (contains!2609 (getCurrentListMap!2291 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapIsEmpty!22348 () Bool)

(declare-fun mapRes!22348 () Bool)

(assert (=> mapIsEmpty!22348 mapRes!22348))

(declare-fun b!481489 () Bool)

(declare-fun e!283293 () Bool)

(declare-fun tp_is_empty!13759 () Bool)

(assert (=> b!481489 (= e!283293 tp_is_empty!13759)))

(declare-fun b!481490 () Bool)

(declare-fun res!287077 () Bool)

(assert (=> b!481490 (=> (not res!287077) (not e!283296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481490 (= res!287077 (validKeyInArray!0 k0!1332))))

(declare-fun b!481491 () Bool)

(declare-fun e!283294 () Bool)

(assert (=> b!481491 (= e!283294 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481492 () Bool)

(declare-fun e!283291 () Bool)

(assert (=> b!481492 (= e!283291 tp_is_empty!13759)))

(declare-fun b!481493 () Bool)

(declare-fun res!287079 () Bool)

(assert (=> b!481493 (=> (not res!287079) (not e!283296))))

(declare-datatypes ((List!9075 0))(
  ( (Nil!9072) (Cons!9071 (h!9927 (_ BitVec 64)) (t!15281 List!9075)) )
))
(declare-fun arrayNoDuplicates!0 (array!31170 (_ BitVec 32) List!9075) Bool)

(assert (=> b!481493 (= res!287079 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9072))))

(declare-fun b!481494 () Bool)

(declare-fun res!287081 () Bool)

(assert (=> b!481494 (=> (not res!287081) (not e!283296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31170 (_ BitVec 32)) Bool)

(assert (=> b!481494 (= res!287081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481496 () Bool)

(assert (=> b!481496 (= e!283296 (not (= (size!15345 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218572 () (_ BitVec 32))

(assert (=> b!481496 (arrayForallSeekEntryOrOpenFound!0 lt!218572 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14091 0))(
  ( (Unit!14092) )
))
(declare-fun lt!218570 () Unit!14091)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14091)

(assert (=> b!481496 (= lt!218570 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218572))))

(declare-fun arrayScanForKey!0 (array!31170 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481496 (= lt!218572 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481496 e!283294))

(declare-fun c!57897 () Bool)

(assert (=> b!481496 (= c!57897 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218571 () Unit!14091)

(declare-fun lemmaKeyInListMapIsInArray!137 (array!31170 array!31168 (_ BitVec 32) (_ BitVec 32) V!19417 V!19417 (_ BitVec 64) Int) Unit!14091)

(assert (=> b!481496 (= lt!218571 (lemmaKeyInListMapIsInArray!137 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481497 () Bool)

(declare-fun arrayContainsKey!0 (array!31170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481497 (= e!283294 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481498 () Bool)

(declare-fun res!287080 () Bool)

(assert (=> b!481498 (=> (not res!287080) (not e!283296))))

(assert (=> b!481498 (= res!287080 (and (= (size!15344 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15345 _keys!1874) (size!15344 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22348 () Bool)

(declare-fun tp!43024 () Bool)

(assert (=> mapNonEmpty!22348 (= mapRes!22348 (and tp!43024 e!283293))))

(declare-fun mapValue!22348 () ValueCell!6518)

(declare-fun mapRest!22348 () (Array (_ BitVec 32) ValueCell!6518))

(declare-fun mapKey!22348 () (_ BitVec 32))

(assert (=> mapNonEmpty!22348 (= (arr!14986 _values!1516) (store mapRest!22348 mapKey!22348 mapValue!22348))))

(declare-fun res!287078 () Bool)

(assert (=> start!43454 (=> (not res!287078) (not e!283296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43454 (= res!287078 (validMask!0 mask!2352))))

(assert (=> start!43454 e!283296))

(assert (=> start!43454 true))

(assert (=> start!43454 tp_is_empty!13759))

(declare-fun e!283295 () Bool)

(declare-fun array_inv!10882 (array!31168) Bool)

(assert (=> start!43454 (and (array_inv!10882 _values!1516) e!283295)))

(assert (=> start!43454 tp!43023))

(declare-fun array_inv!10883 (array!31170) Bool)

(assert (=> start!43454 (array_inv!10883 _keys!1874)))

(declare-fun b!481495 () Bool)

(assert (=> b!481495 (= e!283295 (and e!283291 mapRes!22348))))

(declare-fun condMapEmpty!22348 () Bool)

(declare-fun mapDefault!22348 () ValueCell!6518)

(assert (=> b!481495 (= condMapEmpty!22348 (= (arr!14986 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6518)) mapDefault!22348)))))

(assert (= (and start!43454 res!287078) b!481498))

(assert (= (and b!481498 res!287080) b!481494))

(assert (= (and b!481494 res!287081) b!481493))

(assert (= (and b!481493 res!287079) b!481488))

(assert (= (and b!481488 res!287082) b!481490))

(assert (= (and b!481490 res!287077) b!481496))

(assert (= (and b!481496 c!57897) b!481497))

(assert (= (and b!481496 (not c!57897)) b!481491))

(assert (= (and b!481495 condMapEmpty!22348) mapIsEmpty!22348))

(assert (= (and b!481495 (not condMapEmpty!22348)) mapNonEmpty!22348))

(get-info :version)

(assert (= (and mapNonEmpty!22348 ((_ is ValueCellFull!6518) mapValue!22348)) b!481489))

(assert (= (and b!481495 ((_ is ValueCellFull!6518) mapDefault!22348)) b!481492))

(assert (= start!43454 b!481495))

(declare-fun m!463165 () Bool)

(assert (=> start!43454 m!463165))

(declare-fun m!463167 () Bool)

(assert (=> start!43454 m!463167))

(declare-fun m!463169 () Bool)

(assert (=> start!43454 m!463169))

(declare-fun m!463171 () Bool)

(assert (=> b!481496 m!463171))

(declare-fun m!463173 () Bool)

(assert (=> b!481496 m!463173))

(declare-fun m!463175 () Bool)

(assert (=> b!481496 m!463175))

(declare-fun m!463177 () Bool)

(assert (=> b!481496 m!463177))

(declare-fun m!463179 () Bool)

(assert (=> b!481493 m!463179))

(declare-fun m!463181 () Bool)

(assert (=> b!481490 m!463181))

(declare-fun m!463183 () Bool)

(assert (=> b!481488 m!463183))

(assert (=> b!481488 m!463183))

(declare-fun m!463185 () Bool)

(assert (=> b!481488 m!463185))

(declare-fun m!463187 () Bool)

(assert (=> b!481494 m!463187))

(declare-fun m!463189 () Bool)

(assert (=> mapNonEmpty!22348 m!463189))

(declare-fun m!463191 () Bool)

(assert (=> b!481497 m!463191))

(check-sat (not b!481496) (not mapNonEmpty!22348) (not b!481493) (not b!481494) b_and!21017 tp_is_empty!13759 (not b!481497) (not start!43454) (not b!481488) (not b!481490) (not b_next!12247))
(check-sat b_and!21017 (not b_next!12247))
