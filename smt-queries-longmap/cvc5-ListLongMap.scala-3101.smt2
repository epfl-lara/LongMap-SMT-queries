; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43546 () Bool)

(assert start!43546)

(declare-fun b_free!12325 () Bool)

(declare-fun b_next!12325 () Bool)

(assert (=> start!43546 (= b_free!12325 (not b_next!12325))))

(declare-fun tp!43258 () Bool)

(declare-fun b_and!21085 () Bool)

(assert (=> start!43546 (= tp!43258 b_and!21085)))

(declare-fun b!482512 () Bool)

(declare-fun res!287625 () Bool)

(declare-fun e!283952 () Bool)

(assert (=> b!482512 (=> (not res!287625) (not e!283952))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31331 0))(
  ( (array!31332 (arr!15068 (Array (_ BitVec 32) (_ BitVec 64))) (size!15426 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31331)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19521 0))(
  ( (V!19522 (val!6966 Int)) )
))
(declare-datatypes ((ValueCell!6557 0))(
  ( (ValueCellFull!6557 (v!9259 V!19521)) (EmptyCell!6557) )
))
(declare-datatypes ((array!31333 0))(
  ( (array!31334 (arr!15069 (Array (_ BitVec 32) ValueCell!6557)) (size!15427 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31333)

(assert (=> b!482512 (= res!287625 (and (= (size!15427 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15426 _keys!1874) (size!15427 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22465 () Bool)

(declare-fun mapRes!22465 () Bool)

(assert (=> mapIsEmpty!22465 mapRes!22465))

(declare-fun res!287628 () Bool)

(assert (=> start!43546 (=> (not res!287628) (not e!283952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43546 (= res!287628 (validMask!0 mask!2352))))

(assert (=> start!43546 e!283952))

(assert (=> start!43546 true))

(declare-fun tp_is_empty!13837 () Bool)

(assert (=> start!43546 tp_is_empty!13837))

(declare-fun e!283955 () Bool)

(declare-fun array_inv!10872 (array!31333) Bool)

(assert (=> start!43546 (and (array_inv!10872 _values!1516) e!283955)))

(assert (=> start!43546 tp!43258))

(declare-fun array_inv!10873 (array!31331) Bool)

(assert (=> start!43546 (array_inv!10873 _keys!1874)))

(declare-fun mapNonEmpty!22465 () Bool)

(declare-fun tp!43257 () Bool)

(declare-fun e!283956 () Bool)

(assert (=> mapNonEmpty!22465 (= mapRes!22465 (and tp!43257 e!283956))))

(declare-fun mapValue!22465 () ValueCell!6557)

(declare-fun mapKey!22465 () (_ BitVec 32))

(declare-fun mapRest!22465 () (Array (_ BitVec 32) ValueCell!6557))

(assert (=> mapNonEmpty!22465 (= (arr!15069 _values!1516) (store mapRest!22465 mapKey!22465 mapValue!22465))))

(declare-fun b!482513 () Bool)

(declare-fun res!287624 () Bool)

(assert (=> b!482513 (=> (not res!287624) (not e!283952))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19521)

(declare-fun zeroValue!1458 () V!19521)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9144 0))(
  ( (tuple2!9145 (_1!4583 (_ BitVec 64)) (_2!4583 V!19521)) )
))
(declare-datatypes ((List!9223 0))(
  ( (Nil!9220) (Cons!9219 (h!10075 tuple2!9144) (t!15437 List!9223)) )
))
(declare-datatypes ((ListLongMap!8057 0))(
  ( (ListLongMap!8058 (toList!4044 List!9223)) )
))
(declare-fun contains!2658 (ListLongMap!8057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2363 (array!31331 array!31333 (_ BitVec 32) (_ BitVec 32) V!19521 V!19521 (_ BitVec 32) Int) ListLongMap!8057)

(assert (=> b!482513 (= res!287624 (contains!2658 (getCurrentListMap!2363 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!482514 () Bool)

(declare-fun e!283951 () Bool)

(assert (=> b!482514 (= e!283951 tp_is_empty!13837)))

(declare-fun b!482515 () Bool)

(declare-fun e!283954 () Bool)

(declare-fun arrayContainsKey!0 (array!31331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482515 (= e!283954 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!482516 () Bool)

(declare-fun res!287627 () Bool)

(assert (=> b!482516 (=> (not res!287627) (not e!283952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482516 (= res!287627 (validKeyInArray!0 k!1332))))

(declare-fun b!482517 () Bool)

(assert (=> b!482517 (= e!283952 (not (= (size!15426 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218736 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31331 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482517 (= lt!218736 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!482517 e!283954))

(declare-fun c!57960 () Bool)

(assert (=> b!482517 (= c!57960 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14144 0))(
  ( (Unit!14145) )
))
(declare-fun lt!218737 () Unit!14144)

(declare-fun lemmaKeyInListMapIsInArray!143 (array!31331 array!31333 (_ BitVec 32) (_ BitVec 32) V!19521 V!19521 (_ BitVec 64) Int) Unit!14144)

(assert (=> b!482517 (= lt!218737 (lemmaKeyInListMapIsInArray!143 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!482518 () Bool)

(assert (=> b!482518 (= e!283954 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482519 () Bool)

(declare-fun res!287629 () Bool)

(assert (=> b!482519 (=> (not res!287629) (not e!283952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31331 (_ BitVec 32)) Bool)

(assert (=> b!482519 (= res!287629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482520 () Bool)

(declare-fun res!287626 () Bool)

(assert (=> b!482520 (=> (not res!287626) (not e!283952))))

(declare-datatypes ((List!9224 0))(
  ( (Nil!9221) (Cons!9220 (h!10076 (_ BitVec 64)) (t!15438 List!9224)) )
))
(declare-fun arrayNoDuplicates!0 (array!31331 (_ BitVec 32) List!9224) Bool)

(assert (=> b!482520 (= res!287626 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9221))))

(declare-fun b!482521 () Bool)

(assert (=> b!482521 (= e!283955 (and e!283951 mapRes!22465))))

(declare-fun condMapEmpty!22465 () Bool)

(declare-fun mapDefault!22465 () ValueCell!6557)

