; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43584 () Bool)

(assert start!43584)

(declare-fun b_free!12341 () Bool)

(declare-fun b_next!12341 () Bool)

(assert (=> start!43584 (= b_free!12341 (not b_next!12341))))

(declare-fun tp!43308 () Bool)

(declare-fun b_and!21103 () Bool)

(assert (=> start!43584 (= tp!43308 b_and!21103)))

(declare-fun res!287822 () Bool)

(declare-fun e!284179 () Bool)

(assert (=> start!43584 (=> (not res!287822) (not e!284179))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43584 (= res!287822 (validMask!0 mask!2352))))

(assert (=> start!43584 e!284179))

(assert (=> start!43584 true))

(declare-fun tp_is_empty!13853 () Bool)

(assert (=> start!43584 tp_is_empty!13853))

(declare-datatypes ((V!19541 0))(
  ( (V!19542 (val!6974 Int)) )
))
(declare-datatypes ((ValueCell!6565 0))(
  ( (ValueCellFull!6565 (v!9268 V!19541)) (EmptyCell!6565) )
))
(declare-datatypes ((array!31365 0))(
  ( (array!31366 (arr!15084 (Array (_ BitVec 32) ValueCell!6565)) (size!15442 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31365)

(declare-fun e!284183 () Bool)

(declare-fun array_inv!10882 (array!31365) Bool)

(assert (=> start!43584 (and (array_inv!10882 _values!1516) e!284183)))

(assert (=> start!43584 tp!43308))

(declare-datatypes ((array!31367 0))(
  ( (array!31368 (arr!15085 (Array (_ BitVec 32) (_ BitVec 64))) (size!15443 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31367)

(declare-fun array_inv!10883 (array!31367) Bool)

(assert (=> start!43584 (array_inv!10883 _keys!1874)))

(declare-fun b!482903 () Bool)

(declare-fun e!284182 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482903 (= e!284182 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22492 () Bool)

(declare-fun mapRes!22492 () Bool)

(assert (=> mapIsEmpty!22492 mapRes!22492))

(declare-fun b!482904 () Bool)

(declare-fun res!287821 () Bool)

(assert (=> b!482904 (=> (not res!287821) (not e!284179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31367 (_ BitVec 32)) Bool)

(assert (=> b!482904 (= res!287821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482905 () Bool)

(declare-fun res!287824 () Bool)

(assert (=> b!482905 (=> (not res!287824) (not e!284179))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19541)

(declare-fun minValue!1458 () V!19541)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9154 0))(
  ( (tuple2!9155 (_1!4588 (_ BitVec 64)) (_2!4588 V!19541)) )
))
(declare-datatypes ((List!9235 0))(
  ( (Nil!9232) (Cons!9231 (h!10087 tuple2!9154) (t!15451 List!9235)) )
))
(declare-datatypes ((ListLongMap!8067 0))(
  ( (ListLongMap!8068 (toList!4049 List!9235)) )
))
(declare-fun contains!2664 (ListLongMap!8067 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2368 (array!31367 array!31365 (_ BitVec 32) (_ BitVec 32) V!19541 V!19541 (_ BitVec 32) Int) ListLongMap!8067)

(assert (=> b!482905 (= res!287824 (contains!2664 (getCurrentListMap!2368 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!482906 () Bool)

(declare-fun e!284181 () Bool)

(assert (=> b!482906 (= e!284181 tp_is_empty!13853)))

(declare-fun b!482907 () Bool)

(assert (=> b!482907 (= e!284183 (and e!284181 mapRes!22492))))

(declare-fun condMapEmpty!22492 () Bool)

(declare-fun mapDefault!22492 () ValueCell!6565)

