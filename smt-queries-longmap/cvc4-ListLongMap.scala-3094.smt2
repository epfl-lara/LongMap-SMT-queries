; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43508 () Bool)

(assert start!43508)

(declare-fun b_free!12287 () Bool)

(declare-fun b_next!12287 () Bool)

(assert (=> start!43508 (= b_free!12287 (not b_next!12287))))

(declare-fun tp!43143 () Bool)

(declare-fun b_and!21047 () Bool)

(assert (=> start!43508 (= tp!43143 b_and!21047)))

(declare-fun b!482069 () Bool)

(declare-fun e!283657 () Bool)

(declare-fun tp_is_empty!13799 () Bool)

(assert (=> b!482069 (= e!283657 tp_is_empty!13799)))

(declare-fun mapNonEmpty!22408 () Bool)

(declare-fun mapRes!22408 () Bool)

(declare-fun tp!43144 () Bool)

(assert (=> mapNonEmpty!22408 (= mapRes!22408 (and tp!43144 e!283657))))

(declare-fun mapKey!22408 () (_ BitVec 32))

(declare-datatypes ((V!19469 0))(
  ( (V!19470 (val!6947 Int)) )
))
(declare-datatypes ((ValueCell!6538 0))(
  ( (ValueCellFull!6538 (v!9240 V!19469)) (EmptyCell!6538) )
))
(declare-fun mapValue!22408 () ValueCell!6538)

(declare-datatypes ((array!31257 0))(
  ( (array!31258 (arr!15031 (Array (_ BitVec 32) ValueCell!6538)) (size!15389 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31257)

(declare-fun mapRest!22408 () (Array (_ BitVec 32) ValueCell!6538))

(assert (=> mapNonEmpty!22408 (= (arr!15031 _values!1516) (store mapRest!22408 mapKey!22408 mapValue!22408))))

(declare-fun b!482070 () Bool)

(declare-fun e!283659 () Bool)

(assert (=> b!482070 (= e!283659 tp_is_empty!13799)))

(declare-fun b!482071 () Bool)

(declare-fun res!287377 () Bool)

(declare-fun e!283658 () Bool)

(assert (=> b!482071 (=> (not res!287377) (not e!283658))))

(declare-datatypes ((array!31259 0))(
  ( (array!31260 (arr!15032 (Array (_ BitVec 32) (_ BitVec 64))) (size!15390 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31259)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31259 (_ BitVec 32)) Bool)

(assert (=> b!482071 (= res!287377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482073 () Bool)

(declare-fun res!287374 () Bool)

(assert (=> b!482073 (=> (not res!287374) (not e!283658))))

(declare-datatypes ((List!9196 0))(
  ( (Nil!9193) (Cons!9192 (h!10048 (_ BitVec 64)) (t!15410 List!9196)) )
))
(declare-fun arrayNoDuplicates!0 (array!31259 (_ BitVec 32) List!9196) Bool)

(assert (=> b!482073 (= res!287374 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9193))))

(declare-fun b!482074 () Bool)

(assert (=> b!482074 (= e!283658 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19469)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!218668 () Bool)

(declare-fun zeroValue!1458 () V!19469)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9116 0))(
  ( (tuple2!9117 (_1!4569 (_ BitVec 64)) (_2!4569 V!19469)) )
))
(declare-datatypes ((List!9197 0))(
  ( (Nil!9194) (Cons!9193 (h!10049 tuple2!9116) (t!15411 List!9197)) )
))
(declare-datatypes ((ListLongMap!8029 0))(
  ( (ListLongMap!8030 (toList!4030 List!9197)) )
))
(declare-fun contains!2644 (ListLongMap!8029 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2349 (array!31259 array!31257 (_ BitVec 32) (_ BitVec 32) V!19469 V!19469 (_ BitVec 32) Int) ListLongMap!8029)

(assert (=> b!482074 (= lt!218668 (contains!2644 (getCurrentListMap!2349 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapIsEmpty!22408 () Bool)

(assert (=> mapIsEmpty!22408 mapRes!22408))

(declare-fun b!482075 () Bool)

(declare-fun res!287375 () Bool)

(assert (=> b!482075 (=> (not res!287375) (not e!283658))))

(assert (=> b!482075 (= res!287375 (and (= (size!15389 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15390 _keys!1874) (size!15389 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287376 () Bool)

(assert (=> start!43508 (=> (not res!287376) (not e!283658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43508 (= res!287376 (validMask!0 mask!2352))))

(assert (=> start!43508 e!283658))

(assert (=> start!43508 true))

(assert (=> start!43508 tp_is_empty!13799))

(declare-fun e!283655 () Bool)

(declare-fun array_inv!10842 (array!31257) Bool)

(assert (=> start!43508 (and (array_inv!10842 _values!1516) e!283655)))

(assert (=> start!43508 tp!43143))

(declare-fun array_inv!10843 (array!31259) Bool)

(assert (=> start!43508 (array_inv!10843 _keys!1874)))

(declare-fun b!482072 () Bool)

(assert (=> b!482072 (= e!283655 (and e!283659 mapRes!22408))))

(declare-fun condMapEmpty!22408 () Bool)

(declare-fun mapDefault!22408 () ValueCell!6538)

