; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77556 () Bool)

(assert start!77556)

(declare-fun b_free!16141 () Bool)

(declare-fun b_next!16141 () Bool)

(assert (=> start!77556 (= b_free!16141 (not b_next!16141))))

(declare-fun tp!56685 () Bool)

(declare-fun b_and!26507 () Bool)

(assert (=> start!77556 (= tp!56685 b_and!26507)))

(declare-fun b!903614 () Bool)

(declare-fun e!506308 () Bool)

(assert (=> b!903614 (= e!506308 false)))

(declare-datatypes ((V!29711 0))(
  ( (V!29712 (val!9330 Int)) )
))
(declare-datatypes ((ValueCell!8798 0))(
  ( (ValueCellFull!8798 (v!11835 V!29711)) (EmptyCell!8798) )
))
(declare-datatypes ((array!53170 0))(
  ( (array!53171 (arr!25544 (Array (_ BitVec 32) ValueCell!8798)) (size!26003 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53170)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!408033 () Bool)

(declare-fun zeroValue!1094 () V!29711)

(declare-datatypes ((array!53172 0))(
  ( (array!53173 (arr!25545 (Array (_ BitVec 32) (_ BitVec 64))) (size!26004 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53172)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29711)

(declare-datatypes ((tuple2!12114 0))(
  ( (tuple2!12115 (_1!6068 (_ BitVec 64)) (_2!6068 V!29711)) )
))
(declare-datatypes ((List!17934 0))(
  ( (Nil!17931) (Cons!17930 (h!19076 tuple2!12114) (t!25317 List!17934)) )
))
(declare-datatypes ((ListLongMap!10811 0))(
  ( (ListLongMap!10812 (toList!5421 List!17934)) )
))
(declare-fun contains!4469 (ListLongMap!10811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2690 (array!53172 array!53170 (_ BitVec 32) (_ BitVec 32) V!29711 V!29711 (_ BitVec 32) Int) ListLongMap!10811)

(assert (=> b!903614 (= lt!408033 (contains!4469 (getCurrentListMap!2690 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!903615 () Bool)

(declare-fun e!506307 () Bool)

(declare-fun tp_is_empty!18559 () Bool)

(assert (=> b!903615 (= e!506307 tp_is_empty!18559)))

(declare-fun mapIsEmpty!29551 () Bool)

(declare-fun mapRes!29551 () Bool)

(assert (=> mapIsEmpty!29551 mapRes!29551))

(declare-fun b!903616 () Bool)

(declare-fun res!609641 () Bool)

(assert (=> b!903616 (=> (not res!609641) (not e!506308))))

(assert (=> b!903616 (= res!609641 (and (= (size!26003 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26004 _keys!1386) (size!26003 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903617 () Bool)

(declare-fun e!506309 () Bool)

(declare-fun e!506310 () Bool)

(assert (=> b!903617 (= e!506309 (and e!506310 mapRes!29551))))

(declare-fun condMapEmpty!29551 () Bool)

(declare-fun mapDefault!29551 () ValueCell!8798)

