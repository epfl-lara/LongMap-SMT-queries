; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43612 () Bool)

(assert start!43612)

(declare-fun b_free!12347 () Bool)

(declare-fun b_next!12347 () Bool)

(assert (=> start!43612 (= b_free!12347 (not b_next!12347))))

(declare-fun tp!43330 () Bool)

(declare-fun b_and!21111 () Bool)

(assert (=> start!43612 (= tp!43330 b_and!21111)))

(declare-fun res!287928 () Bool)

(declare-fun e!284319 () Bool)

(assert (=> start!43612 (=> (not res!287928) (not e!284319))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43612 (= res!287928 (validMask!0 mask!2352))))

(assert (=> start!43612 e!284319))

(assert (=> start!43612 true))

(declare-fun tp_is_empty!13859 () Bool)

(assert (=> start!43612 tp_is_empty!13859))

(declare-datatypes ((V!19549 0))(
  ( (V!19550 (val!6977 Int)) )
))
(declare-datatypes ((ValueCell!6568 0))(
  ( (ValueCellFull!6568 (v!9272 V!19549)) (EmptyCell!6568) )
))
(declare-datatypes ((array!31379 0))(
  ( (array!31380 (arr!15090 (Array (_ BitVec 32) ValueCell!6568)) (size!15448 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31379)

(declare-fun e!284321 () Bool)

(declare-fun array_inv!10888 (array!31379) Bool)

(assert (=> start!43612 (and (array_inv!10888 _values!1516) e!284321)))

(assert (=> start!43612 tp!43330))

(declare-datatypes ((array!31381 0))(
  ( (array!31382 (arr!15091 (Array (_ BitVec 32) (_ BitVec 64))) (size!15449 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31381)

(declare-fun array_inv!10889 (array!31381) Bool)

(assert (=> start!43612 (array_inv!10889 _keys!1874)))

(declare-fun b!483129 () Bool)

(declare-fun e!284317 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483129 (= e!284317 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!483130 () Bool)

(declare-fun res!287925 () Bool)

(assert (=> b!483130 (=> (not res!287925) (not e!284319))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!483130 (= res!287925 (and (= (size!15448 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15449 _keys!1874) (size!15448 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!483131 () Bool)

(declare-fun e!284320 () Bool)

(assert (=> b!483131 (= e!284320 tp_is_empty!13859)))

(declare-fun b!483132 () Bool)

(declare-fun res!287927 () Bool)

(assert (=> b!483132 (=> (not res!287927) (not e!284319))))

(declare-fun minValue!1458 () V!19549)

(declare-fun zeroValue!1458 () V!19549)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9160 0))(
  ( (tuple2!9161 (_1!4591 (_ BitVec 64)) (_2!4591 V!19549)) )
))
(declare-datatypes ((List!9240 0))(
  ( (Nil!9237) (Cons!9236 (h!10092 tuple2!9160) (t!15458 List!9240)) )
))
(declare-datatypes ((ListLongMap!8073 0))(
  ( (ListLongMap!8074 (toList!4052 List!9240)) )
))
(declare-fun contains!2668 (ListLongMap!8073 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2371 (array!31381 array!31379 (_ BitVec 32) (_ BitVec 32) V!19549 V!19549 (_ BitVec 32) Int) ListLongMap!8073)

(assert (=> b!483132 (= res!287927 (contains!2668 (getCurrentListMap!2371 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!483133 () Bool)

(assert (=> b!483133 (= e!284319 (not true))))

(declare-fun lt!218989 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31381 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483133 (= lt!218989 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!483133 e!284317))

(declare-fun c!58059 () Bool)

(assert (=> b!483133 (= c!58059 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14166 0))(
  ( (Unit!14167) )
))
(declare-fun lt!218988 () Unit!14166)

(declare-fun lemmaKeyInListMapIsInArray!152 (array!31381 array!31379 (_ BitVec 32) (_ BitVec 32) V!19549 V!19549 (_ BitVec 64) Int) Unit!14166)

(assert (=> b!483133 (= lt!218988 (lemmaKeyInListMapIsInArray!152 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!483134 () Bool)

(declare-fun res!287924 () Bool)

(assert (=> b!483134 (=> (not res!287924) (not e!284319))))

(declare-datatypes ((List!9241 0))(
  ( (Nil!9238) (Cons!9237 (h!10093 (_ BitVec 64)) (t!15459 List!9241)) )
))
(declare-fun arrayNoDuplicates!0 (array!31381 (_ BitVec 32) List!9241) Bool)

(assert (=> b!483134 (= res!287924 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9238))))

(declare-fun b!483135 () Bool)

(declare-fun e!284322 () Bool)

(declare-fun mapRes!22504 () Bool)

(assert (=> b!483135 (= e!284321 (and e!284322 mapRes!22504))))

(declare-fun condMapEmpty!22504 () Bool)

(declare-fun mapDefault!22504 () ValueCell!6568)

