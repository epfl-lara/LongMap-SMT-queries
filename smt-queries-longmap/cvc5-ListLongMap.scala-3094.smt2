; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43504 () Bool)

(assert start!43504)

(declare-fun b_free!12283 () Bool)

(declare-fun b_next!12283 () Bool)

(assert (=> start!43504 (= b_free!12283 (not b_next!12283))))

(declare-fun tp!43132 () Bool)

(declare-fun b_and!21043 () Bool)

(assert (=> start!43504 (= tp!43132 b_and!21043)))

(declare-fun b!482027 () Bool)

(declare-fun e!283626 () Bool)

(assert (=> b!482027 (= e!283626 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun lt!218662 () Bool)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19465 0))(
  ( (V!19466 (val!6945 Int)) )
))
(declare-fun minValue!1458 () V!19465)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19465)

(declare-datatypes ((ValueCell!6536 0))(
  ( (ValueCellFull!6536 (v!9238 V!19465)) (EmptyCell!6536) )
))
(declare-datatypes ((array!31249 0))(
  ( (array!31250 (arr!15027 (Array (_ BitVec 32) ValueCell!6536)) (size!15385 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31249)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31251 0))(
  ( (array!31252 (arr!15028 (Array (_ BitVec 32) (_ BitVec 64))) (size!15386 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31251)

(declare-datatypes ((tuple2!9112 0))(
  ( (tuple2!9113 (_1!4567 (_ BitVec 64)) (_2!4567 V!19465)) )
))
(declare-datatypes ((List!9192 0))(
  ( (Nil!9189) (Cons!9188 (h!10044 tuple2!9112) (t!15406 List!9192)) )
))
(declare-datatypes ((ListLongMap!8025 0))(
  ( (ListLongMap!8026 (toList!4028 List!9192)) )
))
(declare-fun contains!2642 (ListLongMap!8025 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2347 (array!31251 array!31249 (_ BitVec 32) (_ BitVec 32) V!19465 V!19465 (_ BitVec 32) Int) ListLongMap!8025)

(assert (=> b!482027 (= lt!218662 (contains!2642 (getCurrentListMap!2347 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!482028 () Bool)

(declare-fun res!287351 () Bool)

(assert (=> b!482028 (=> (not res!287351) (not e!283626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31251 (_ BitVec 32)) Bool)

(assert (=> b!482028 (= res!287351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!287352 () Bool)

(assert (=> start!43504 (=> (not res!287352) (not e!283626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43504 (= res!287352 (validMask!0 mask!2352))))

(assert (=> start!43504 e!283626))

(assert (=> start!43504 true))

(declare-fun tp_is_empty!13795 () Bool)

(assert (=> start!43504 tp_is_empty!13795))

(declare-fun e!283627 () Bool)

(declare-fun array_inv!10838 (array!31249) Bool)

(assert (=> start!43504 (and (array_inv!10838 _values!1516) e!283627)))

(assert (=> start!43504 tp!43132))

(declare-fun array_inv!10839 (array!31251) Bool)

(assert (=> start!43504 (array_inv!10839 _keys!1874)))

(declare-fun b!482029 () Bool)

(declare-fun e!283628 () Bool)

(assert (=> b!482029 (= e!283628 tp_is_empty!13795)))

(declare-fun b!482030 () Bool)

(declare-fun res!287350 () Bool)

(assert (=> b!482030 (=> (not res!287350) (not e!283626))))

(assert (=> b!482030 (= res!287350 (and (= (size!15385 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15386 _keys!1874) (size!15385 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22402 () Bool)

(declare-fun mapRes!22402 () Bool)

(assert (=> mapIsEmpty!22402 mapRes!22402))

(declare-fun b!482031 () Bool)

(declare-fun e!283629 () Bool)

(assert (=> b!482031 (= e!283629 tp_is_empty!13795)))

(declare-fun b!482032 () Bool)

(declare-fun res!287353 () Bool)

(assert (=> b!482032 (=> (not res!287353) (not e!283626))))

(declare-datatypes ((List!9193 0))(
  ( (Nil!9190) (Cons!9189 (h!10045 (_ BitVec 64)) (t!15407 List!9193)) )
))
(declare-fun arrayNoDuplicates!0 (array!31251 (_ BitVec 32) List!9193) Bool)

(assert (=> b!482032 (= res!287353 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9190))))

(declare-fun mapNonEmpty!22402 () Bool)

(declare-fun tp!43131 () Bool)

(assert (=> mapNonEmpty!22402 (= mapRes!22402 (and tp!43131 e!283629))))

(declare-fun mapRest!22402 () (Array (_ BitVec 32) ValueCell!6536))

(declare-fun mapValue!22402 () ValueCell!6536)

(declare-fun mapKey!22402 () (_ BitVec 32))

(assert (=> mapNonEmpty!22402 (= (arr!15027 _values!1516) (store mapRest!22402 mapKey!22402 mapValue!22402))))

(declare-fun b!482033 () Bool)

(assert (=> b!482033 (= e!283627 (and e!283628 mapRes!22402))))

(declare-fun condMapEmpty!22402 () Bool)

(declare-fun mapDefault!22402 () ValueCell!6536)

