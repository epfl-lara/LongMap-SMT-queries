; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43532 () Bool)

(assert start!43532)

(declare-fun b_free!12311 () Bool)

(declare-fun b_next!12311 () Bool)

(assert (=> start!43532 (= b_free!12311 (not b_next!12311))))

(declare-fun tp!43215 () Bool)

(declare-fun b_and!21071 () Bool)

(assert (=> start!43532 (= tp!43215 b_and!21071)))

(declare-fun b!482321 () Bool)

(declare-fun e!283839 () Bool)

(declare-fun tp_is_empty!13823 () Bool)

(assert (=> b!482321 (= e!283839 tp_is_empty!13823)))

(declare-fun b!482322 () Bool)

(declare-fun e!283835 () Bool)

(assert (=> b!482322 (= e!283835 false)))

(declare-fun lt!218704 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19501 0))(
  ( (V!19502 (val!6959 Int)) )
))
(declare-fun minValue!1458 () V!19501)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19501)

(declare-datatypes ((ValueCell!6550 0))(
  ( (ValueCellFull!6550 (v!9252 V!19501)) (EmptyCell!6550) )
))
(declare-datatypes ((array!31305 0))(
  ( (array!31306 (arr!15055 (Array (_ BitVec 32) ValueCell!6550)) (size!15413 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31305)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31307 0))(
  ( (array!31308 (arr!15056 (Array (_ BitVec 32) (_ BitVec 64))) (size!15414 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31307)

(declare-datatypes ((tuple2!9134 0))(
  ( (tuple2!9135 (_1!4578 (_ BitVec 64)) (_2!4578 V!19501)) )
))
(declare-datatypes ((List!9214 0))(
  ( (Nil!9211) (Cons!9210 (h!10066 tuple2!9134) (t!15428 List!9214)) )
))
(declare-datatypes ((ListLongMap!8047 0))(
  ( (ListLongMap!8048 (toList!4039 List!9214)) )
))
(declare-fun contains!2653 (ListLongMap!8047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2358 (array!31307 array!31305 (_ BitVec 32) (_ BitVec 32) V!19501 V!19501 (_ BitVec 32) Int) ListLongMap!8047)

(assert (=> b!482322 (= lt!218704 (contains!2653 (getCurrentListMap!2358 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun res!287518 () Bool)

(assert (=> start!43532 (=> (not res!287518) (not e!283835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43532 (= res!287518 (validMask!0 mask!2352))))

(assert (=> start!43532 e!283835))

(assert (=> start!43532 true))

(assert (=> start!43532 tp_is_empty!13823))

(declare-fun e!283837 () Bool)

(declare-fun array_inv!10862 (array!31305) Bool)

(assert (=> start!43532 (and (array_inv!10862 _values!1516) e!283837)))

(assert (=> start!43532 tp!43215))

(declare-fun array_inv!10863 (array!31307) Bool)

(assert (=> start!43532 (array_inv!10863 _keys!1874)))

(declare-fun mapIsEmpty!22444 () Bool)

(declare-fun mapRes!22444 () Bool)

(assert (=> mapIsEmpty!22444 mapRes!22444))

(declare-fun b!482323 () Bool)

(declare-fun e!283838 () Bool)

(assert (=> b!482323 (= e!283838 tp_is_empty!13823)))

(declare-fun b!482324 () Bool)

(declare-fun res!287521 () Bool)

(assert (=> b!482324 (=> (not res!287521) (not e!283835))))

(assert (=> b!482324 (= res!287521 (and (= (size!15413 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15414 _keys!1874) (size!15413 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482325 () Bool)

(assert (=> b!482325 (= e!283837 (and e!283838 mapRes!22444))))

(declare-fun condMapEmpty!22444 () Bool)

(declare-fun mapDefault!22444 () ValueCell!6550)

