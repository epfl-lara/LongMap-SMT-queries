; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77652 () Bool)

(assert start!77652)

(declare-fun b_free!16237 () Bool)

(declare-fun b_next!16237 () Bool)

(assert (=> start!77652 (= b_free!16237 (not b_next!16237))))

(declare-fun tp!56972 () Bool)

(declare-fun b_and!26627 () Bool)

(assert (=> start!77652 (= tp!56972 b_and!26627)))

(declare-fun b!905369 () Bool)

(declare-fun e!507345 () Bool)

(declare-fun e!507339 () Bool)

(assert (=> b!905369 (= e!507345 e!507339)))

(declare-fun res!610946 () Bool)

(assert (=> b!905369 (=> res!610946 e!507339)))

(declare-datatypes ((V!29839 0))(
  ( (V!29840 (val!9378 Int)) )
))
(declare-datatypes ((tuple2!12198 0))(
  ( (tuple2!12199 (_1!6110 (_ BitVec 64)) (_2!6110 V!29839)) )
))
(declare-datatypes ((List!18009 0))(
  ( (Nil!18006) (Cons!18005 (h!19151 tuple2!12198) (t!25418 List!18009)) )
))
(declare-datatypes ((ListLongMap!10895 0))(
  ( (ListLongMap!10896 (toList!5463 List!18009)) )
))
(declare-fun lt!408528 () ListLongMap!10895)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4509 (ListLongMap!10895 (_ BitVec 64)) Bool)

(assert (=> b!905369 (= res!610946 (not (contains!4509 lt!408528 k!1033)))))

(declare-datatypes ((ValueCell!8846 0))(
  ( (ValueCellFull!8846 (v!11883 V!29839)) (EmptyCell!8846) )
))
(declare-datatypes ((array!53354 0))(
  ( (array!53355 (arr!25636 (Array (_ BitVec 32) ValueCell!8846)) (size!26095 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53354)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29839)

(declare-datatypes ((array!53356 0))(
  ( (array!53357 (arr!25637 (Array (_ BitVec 32) (_ BitVec 64))) (size!26096 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53356)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29839)

(declare-fun getCurrentListMap!2730 (array!53356 array!53354 (_ BitVec 32) (_ BitVec 32) V!29839 V!29839 (_ BitVec 32) Int) ListLongMap!10895)

(assert (=> b!905369 (= lt!408528 (getCurrentListMap!2730 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905370 () Bool)

(declare-fun e!507338 () Bool)

(declare-fun tp_is_empty!18655 () Bool)

(assert (=> b!905370 (= e!507338 tp_is_empty!18655)))

(declare-fun b!905371 () Bool)

(declare-fun res!610945 () Bool)

(declare-fun e!507341 () Bool)

(assert (=> b!905371 (=> (not res!610945) (not e!507341))))

(assert (=> b!905371 (= res!610945 (and (= (size!26095 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26096 _keys!1386) (size!26095 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!610948 () Bool)

(assert (=> start!77652 (=> (not res!610948) (not e!507341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77652 (= res!610948 (validMask!0 mask!1756))))

(assert (=> start!77652 e!507341))

(declare-fun e!507344 () Bool)

(declare-fun array_inv!20086 (array!53354) Bool)

(assert (=> start!77652 (and (array_inv!20086 _values!1152) e!507344)))

(assert (=> start!77652 tp!56972))

(assert (=> start!77652 true))

(assert (=> start!77652 tp_is_empty!18655))

(declare-fun array_inv!20087 (array!53356) Bool)

(assert (=> start!77652 (array_inv!20087 _keys!1386)))

(declare-fun b!905372 () Bool)

(declare-fun e!507340 () Bool)

(assert (=> b!905372 (= e!507341 e!507340)))

(declare-fun res!610943 () Bool)

(assert (=> b!905372 (=> (not res!610943) (not e!507340))))

(declare-fun lt!408527 () ListLongMap!10895)

(assert (=> b!905372 (= res!610943 (contains!4509 lt!408527 k!1033))))

(assert (=> b!905372 (= lt!408527 (getCurrentListMap!2730 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29695 () Bool)

(declare-fun mapRes!29695 () Bool)

(assert (=> mapIsEmpty!29695 mapRes!29695))

(declare-fun b!905373 () Bool)

(declare-fun res!610941 () Bool)

(assert (=> b!905373 (=> (not res!610941) (not e!507341))))

(declare-datatypes ((List!18010 0))(
  ( (Nil!18007) (Cons!18006 (h!19152 (_ BitVec 64)) (t!25419 List!18010)) )
))
(declare-fun arrayNoDuplicates!0 (array!53356 (_ BitVec 32) List!18010) Bool)

(assert (=> b!905373 (= res!610941 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18007))))

(declare-fun b!905374 () Bool)

(assert (=> b!905374 (= e!507340 (not e!507345))))

(declare-fun res!610947 () Bool)

(assert (=> b!905374 (=> res!610947 e!507345)))

(assert (=> b!905374 (= res!610947 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26096 _keys!1386))))))

(declare-fun lt!408529 () V!29839)

(declare-fun get!13469 (ValueCell!8846 V!29839) V!29839)

(declare-fun dynLambda!1329 (Int (_ BitVec 64)) V!29839)

(assert (=> b!905374 (= lt!408529 (get!13469 (select (arr!25636 _values!1152) i!717) (dynLambda!1329 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905374 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30718 0))(
  ( (Unit!30719) )
))
(declare-fun lt!408531 () Unit!30718)

(declare-fun lemmaKeyInListMapIsInArray!201 (array!53356 array!53354 (_ BitVec 32) (_ BitVec 32) V!29839 V!29839 (_ BitVec 64) Int) Unit!30718)

(assert (=> b!905374 (= lt!408531 (lemmaKeyInListMapIsInArray!201 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!905375 () Bool)

(declare-fun res!610949 () Bool)

(assert (=> b!905375 (=> res!610949 e!507339)))

(declare-fun apply!452 (ListLongMap!10895 (_ BitVec 64)) V!29839)

(assert (=> b!905375 (= res!610949 (not (= (apply!452 lt!408528 k!1033) lt!408529)))))

(declare-fun b!905376 () Bool)

(declare-fun res!610942 () Bool)

(assert (=> b!905376 (=> (not res!610942) (not e!507340))))

(assert (=> b!905376 (= res!610942 (and (= (select (arr!25637 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905377 () Bool)

(assert (=> b!905377 (= e!507344 (and e!507338 mapRes!29695))))

(declare-fun condMapEmpty!29695 () Bool)

(declare-fun mapDefault!29695 () ValueCell!8846)

