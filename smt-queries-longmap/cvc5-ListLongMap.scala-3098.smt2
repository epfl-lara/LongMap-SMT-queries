; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43528 () Bool)

(assert start!43528)

(declare-fun b_free!12307 () Bool)

(declare-fun b_next!12307 () Bool)

(assert (=> start!43528 (= b_free!12307 (not b_next!12307))))

(declare-fun tp!43203 () Bool)

(declare-fun b_and!21067 () Bool)

(assert (=> start!43528 (= tp!43203 b_and!21067)))

(declare-fun mapIsEmpty!22438 () Bool)

(declare-fun mapRes!22438 () Bool)

(assert (=> mapIsEmpty!22438 mapRes!22438))

(declare-fun b!482279 () Bool)

(declare-fun res!287496 () Bool)

(declare-fun e!283807 () Bool)

(assert (=> b!482279 (=> (not res!287496) (not e!283807))))

(declare-datatypes ((array!31297 0))(
  ( (array!31298 (arr!15051 (Array (_ BitVec 32) (_ BitVec 64))) (size!15409 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31297)

(declare-datatypes ((List!9210 0))(
  ( (Nil!9207) (Cons!9206 (h!10062 (_ BitVec 64)) (t!15424 List!9210)) )
))
(declare-fun arrayNoDuplicates!0 (array!31297 (_ BitVec 32) List!9210) Bool)

(assert (=> b!482279 (= res!287496 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9207))))

(declare-fun b!482280 () Bool)

(declare-fun res!287494 () Bool)

(assert (=> b!482280 (=> (not res!287494) (not e!283807))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19497 0))(
  ( (V!19498 (val!6957 Int)) )
))
(declare-datatypes ((ValueCell!6548 0))(
  ( (ValueCellFull!6548 (v!9250 V!19497)) (EmptyCell!6548) )
))
(declare-datatypes ((array!31299 0))(
  ( (array!31300 (arr!15052 (Array (_ BitVec 32) ValueCell!6548)) (size!15410 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31299)

(assert (=> b!482280 (= res!287494 (and (= (size!15410 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15409 _keys!1874) (size!15410 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287495 () Bool)

(assert (=> start!43528 (=> (not res!287495) (not e!283807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43528 (= res!287495 (validMask!0 mask!2352))))

(assert (=> start!43528 e!283807))

(assert (=> start!43528 true))

(declare-fun tp_is_empty!13819 () Bool)

(assert (=> start!43528 tp_is_empty!13819))

(declare-fun e!283805 () Bool)

(declare-fun array_inv!10858 (array!31299) Bool)

(assert (=> start!43528 (and (array_inv!10858 _values!1516) e!283805)))

(assert (=> start!43528 tp!43203))

(declare-fun array_inv!10859 (array!31297) Bool)

(assert (=> start!43528 (array_inv!10859 _keys!1874)))

(declare-fun mapNonEmpty!22438 () Bool)

(declare-fun tp!43204 () Bool)

(declare-fun e!283809 () Bool)

(assert (=> mapNonEmpty!22438 (= mapRes!22438 (and tp!43204 e!283809))))

(declare-fun mapValue!22438 () ValueCell!6548)

(declare-fun mapKey!22438 () (_ BitVec 32))

(declare-fun mapRest!22438 () (Array (_ BitVec 32) ValueCell!6548))

(assert (=> mapNonEmpty!22438 (= (arr!15052 _values!1516) (store mapRest!22438 mapKey!22438 mapValue!22438))))

(declare-fun b!482281 () Bool)

(assert (=> b!482281 (= e!283807 false)))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun lt!218698 () Bool)

(declare-fun minValue!1458 () V!19497)

(declare-fun zeroValue!1458 () V!19497)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9130 0))(
  ( (tuple2!9131 (_1!4576 (_ BitVec 64)) (_2!4576 V!19497)) )
))
(declare-datatypes ((List!9211 0))(
  ( (Nil!9208) (Cons!9207 (h!10063 tuple2!9130) (t!15425 List!9211)) )
))
(declare-datatypes ((ListLongMap!8043 0))(
  ( (ListLongMap!8044 (toList!4037 List!9211)) )
))
(declare-fun contains!2651 (ListLongMap!8043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2356 (array!31297 array!31299 (_ BitVec 32) (_ BitVec 32) V!19497 V!19497 (_ BitVec 32) Int) ListLongMap!8043)

(assert (=> b!482281 (= lt!218698 (contains!2651 (getCurrentListMap!2356 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!482282 () Bool)

(assert (=> b!482282 (= e!283809 tp_is_empty!13819)))

(declare-fun b!482283 () Bool)

(declare-fun e!283806 () Bool)

(assert (=> b!482283 (= e!283805 (and e!283806 mapRes!22438))))

(declare-fun condMapEmpty!22438 () Bool)

(declare-fun mapDefault!22438 () ValueCell!6548)

