; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43532 () Bool)

(assert start!43532)

(declare-fun b_free!12325 () Bool)

(declare-fun b_next!12325 () Bool)

(assert (=> start!43532 (= b_free!12325 (not b_next!12325))))

(declare-fun tp!43257 () Bool)

(declare-fun b_and!21095 () Bool)

(assert (=> start!43532 (= tp!43257 b_and!21095)))

(declare-fun b!482451 () Bool)

(declare-fun res!287621 () Bool)

(declare-fun e!283915 () Bool)

(assert (=> b!482451 (=> (not res!287621) (not e!283915))))

(declare-datatypes ((array!31320 0))(
  ( (array!31321 (arr!15062 (Array (_ BitVec 32) (_ BitVec 64))) (size!15420 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31320)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31320 (_ BitVec 32)) Bool)

(assert (=> b!482451 (= res!287621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482452 () Bool)

(declare-fun res!287617 () Bool)

(assert (=> b!482452 (=> (not res!287617) (not e!283915))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-datatypes ((V!19521 0))(
  ( (V!19522 (val!6966 Int)) )
))
(declare-fun zeroValue!1458 () V!19521)

(declare-datatypes ((ValueCell!6557 0))(
  ( (ValueCellFull!6557 (v!9260 V!19521)) (EmptyCell!6557) )
))
(declare-datatypes ((array!31322 0))(
  ( (array!31323 (arr!15063 (Array (_ BitVec 32) ValueCell!6557)) (size!15421 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31322)

(declare-fun minValue!1458 () V!19521)

(declare-fun defaultEntry!1519 () Int)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((tuple2!9058 0))(
  ( (tuple2!9059 (_1!4540 (_ BitVec 64)) (_2!4540 V!19521)) )
))
(declare-datatypes ((List!9126 0))(
  ( (Nil!9123) (Cons!9122 (h!9978 tuple2!9058) (t!15332 List!9126)) )
))
(declare-datatypes ((ListLongMap!7973 0))(
  ( (ListLongMap!7974 (toList!4002 List!9126)) )
))
(declare-fun contains!2634 (ListLongMap!7973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2316 (array!31320 array!31322 (_ BitVec 32) (_ BitVec 32) V!19521 V!19521 (_ BitVec 32) Int) ListLongMap!7973)

(assert (=> b!482452 (= res!287617 (contains!2634 (getCurrentListMap!2316 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapNonEmpty!22465 () Bool)

(declare-fun mapRes!22465 () Bool)

(declare-fun tp!43258 () Bool)

(declare-fun e!283913 () Bool)

(assert (=> mapNonEmpty!22465 (= mapRes!22465 (and tp!43258 e!283913))))

(declare-fun mapKey!22465 () (_ BitVec 32))

(declare-fun mapValue!22465 () ValueCell!6557)

(declare-fun mapRest!22465 () (Array (_ BitVec 32) ValueCell!6557))

(assert (=> mapNonEmpty!22465 (= (arr!15063 _values!1516) (store mapRest!22465 mapKey!22465 mapValue!22465))))

(declare-fun b!482453 () Bool)

(declare-fun e!283914 () Bool)

(declare-fun tp_is_empty!13837 () Bool)

(assert (=> b!482453 (= e!283914 tp_is_empty!13837)))

(declare-fun res!287619 () Bool)

(assert (=> start!43532 (=> (not res!287619) (not e!283915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43532 (= res!287619 (validMask!0 mask!2352))))

(assert (=> start!43532 e!283915))

(assert (=> start!43532 true))

(assert (=> start!43532 tp_is_empty!13837))

(declare-fun e!283912 () Bool)

(declare-fun array_inv!10934 (array!31322) Bool)

(assert (=> start!43532 (and (array_inv!10934 _values!1516) e!283912)))

(assert (=> start!43532 tp!43257))

(declare-fun array_inv!10935 (array!31320) Bool)

(assert (=> start!43532 (array_inv!10935 _keys!1874)))

(declare-fun b!482454 () Bool)

(assert (=> b!482454 (= e!283913 tp_is_empty!13837)))

(declare-fun mapIsEmpty!22465 () Bool)

(assert (=> mapIsEmpty!22465 mapRes!22465))

(declare-fun b!482455 () Bool)

(assert (=> b!482455 (= e!283912 (and e!283914 mapRes!22465))))

(declare-fun condMapEmpty!22465 () Bool)

(declare-fun mapDefault!22465 () ValueCell!6557)

(assert (=> b!482455 (= condMapEmpty!22465 (= (arr!15063 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6557)) mapDefault!22465)))))

(declare-fun b!482456 () Bool)

(assert (=> b!482456 (= e!283915 (not (= (size!15420 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218749 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31320 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482456 (= lt!218749 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!283916 () Bool)

(assert (=> b!482456 e!283916))

(declare-fun c!57933 () Bool)

(assert (=> b!482456 (= c!57933 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14105 0))(
  ( (Unit!14106) )
))
(declare-fun lt!218748 () Unit!14105)

(declare-fun lemmaKeyInListMapIsInArray!144 (array!31320 array!31322 (_ BitVec 32) (_ BitVec 32) V!19521 V!19521 (_ BitVec 64) Int) Unit!14105)

(assert (=> b!482456 (= lt!218748 (lemmaKeyInListMapIsInArray!144 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482457 () Bool)

(declare-fun res!287622 () Bool)

(assert (=> b!482457 (=> (not res!287622) (not e!283915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482457 (= res!287622 (validKeyInArray!0 k0!1332))))

(declare-fun b!482458 () Bool)

(declare-fun res!287618 () Bool)

(assert (=> b!482458 (=> (not res!287618) (not e!283915))))

(declare-datatypes ((List!9127 0))(
  ( (Nil!9124) (Cons!9123 (h!9979 (_ BitVec 64)) (t!15333 List!9127)) )
))
(declare-fun arrayNoDuplicates!0 (array!31320 (_ BitVec 32) List!9127) Bool)

(assert (=> b!482458 (= res!287618 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9124))))

(declare-fun b!482459 () Bool)

(assert (=> b!482459 (= e!283916 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482460 () Bool)

(declare-fun arrayContainsKey!0 (array!31320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482460 (= e!283916 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482461 () Bool)

(declare-fun res!287620 () Bool)

(assert (=> b!482461 (=> (not res!287620) (not e!283915))))

(assert (=> b!482461 (= res!287620 (and (= (size!15421 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15420 _keys!1874) (size!15421 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43532 res!287619) b!482461))

(assert (= (and b!482461 res!287620) b!482451))

(assert (= (and b!482451 res!287621) b!482458))

(assert (= (and b!482458 res!287618) b!482452))

(assert (= (and b!482452 res!287617) b!482457))

(assert (= (and b!482457 res!287622) b!482456))

(assert (= (and b!482456 c!57933) b!482460))

(assert (= (and b!482456 (not c!57933)) b!482459))

(assert (= (and b!482455 condMapEmpty!22465) mapIsEmpty!22465))

(assert (= (and b!482455 (not condMapEmpty!22465)) mapNonEmpty!22465))

(get-info :version)

(assert (= (and mapNonEmpty!22465 ((_ is ValueCellFull!6557) mapValue!22465)) b!482454))

(assert (= (and b!482455 ((_ is ValueCellFull!6557) mapDefault!22465)) b!482453))

(assert (= start!43532 b!482455))

(declare-fun m!463921 () Bool)

(assert (=> mapNonEmpty!22465 m!463921))

(declare-fun m!463923 () Bool)

(assert (=> b!482458 m!463923))

(declare-fun m!463925 () Bool)

(assert (=> b!482452 m!463925))

(assert (=> b!482452 m!463925))

(declare-fun m!463927 () Bool)

(assert (=> b!482452 m!463927))

(declare-fun m!463929 () Bool)

(assert (=> b!482457 m!463929))

(declare-fun m!463931 () Bool)

(assert (=> start!43532 m!463931))

(declare-fun m!463933 () Bool)

(assert (=> start!43532 m!463933))

(declare-fun m!463935 () Bool)

(assert (=> start!43532 m!463935))

(declare-fun m!463937 () Bool)

(assert (=> b!482456 m!463937))

(declare-fun m!463939 () Bool)

(assert (=> b!482456 m!463939))

(declare-fun m!463941 () Bool)

(assert (=> b!482460 m!463941))

(declare-fun m!463943 () Bool)

(assert (=> b!482451 m!463943))

(check-sat b_and!21095 (not b!482458) (not b_next!12325) (not b!482457) (not b!482452) (not mapNonEmpty!22465) (not start!43532) (not b!482460) (not b!482456) tp_is_empty!13837 (not b!482451))
(check-sat b_and!21095 (not b_next!12325))
