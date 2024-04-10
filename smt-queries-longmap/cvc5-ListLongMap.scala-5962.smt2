; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77598 () Bool)

(assert start!77598)

(declare-fun b_free!16183 () Bool)

(declare-fun b_next!16183 () Bool)

(assert (=> start!77598 (= b_free!16183 (not b_next!16183))))

(declare-fun tp!56811 () Bool)

(declare-fun b_and!26549 () Bool)

(assert (=> start!77598 (= tp!56811 b_and!26549)))

(declare-fun b!904335 () Bool)

(declare-fun res!610179 () Bool)

(declare-fun e!506734 () Bool)

(assert (=> b!904335 (=> (not res!610179) (not e!506734))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53246 0))(
  ( (array!53247 (arr!25582 (Array (_ BitVec 32) (_ BitVec 64))) (size!26041 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53246)

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!904335 (= res!610179 (and (= (select (arr!25582 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!29614 () Bool)

(declare-fun mapRes!29614 () Bool)

(assert (=> mapIsEmpty!29614 mapRes!29614))

(declare-fun b!904336 () Bool)

(declare-fun e!506733 () Bool)

(declare-fun e!506737 () Bool)

(assert (=> b!904336 (= e!506733 e!506737)))

(declare-fun res!610178 () Bool)

(assert (=> b!904336 (=> res!610178 e!506737)))

(declare-datatypes ((V!29767 0))(
  ( (V!29768 (val!9351 Int)) )
))
(declare-datatypes ((tuple2!12146 0))(
  ( (tuple2!12147 (_1!6084 (_ BitVec 64)) (_2!6084 V!29767)) )
))
(declare-datatypes ((List!17964 0))(
  ( (Nil!17961) (Cons!17960 (h!19106 tuple2!12146) (t!25347 List!17964)) )
))
(declare-datatypes ((ListLongMap!10843 0))(
  ( (ListLongMap!10844 (toList!5437 List!17964)) )
))
(declare-fun lt!408210 () ListLongMap!10843)

(declare-fun contains!4485 (ListLongMap!10843 (_ BitVec 64)) Bool)

(assert (=> b!904336 (= res!610178 (not (contains!4485 lt!408210 k!1033)))))

(declare-datatypes ((ValueCell!8819 0))(
  ( (ValueCellFull!8819 (v!11856 V!29767)) (EmptyCell!8819) )
))
(declare-datatypes ((array!53248 0))(
  ( (array!53249 (arr!25583 (Array (_ BitVec 32) ValueCell!8819)) (size!26042 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53248)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29767)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29767)

(declare-fun getCurrentListMap!2706 (array!53246 array!53248 (_ BitVec 32) (_ BitVec 32) V!29767 V!29767 (_ BitVec 32) Int) ListLongMap!10843)

(assert (=> b!904336 (= lt!408210 (getCurrentListMap!2706 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904337 () Bool)

(declare-fun res!610174 () Bool)

(assert (=> b!904337 (=> (not res!610174) (not e!506734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53246 (_ BitVec 32)) Bool)

(assert (=> b!904337 (= res!610174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904338 () Bool)

(declare-fun res!610173 () Bool)

(assert (=> b!904338 (=> (not res!610173) (not e!506734))))

(declare-datatypes ((List!17965 0))(
  ( (Nil!17962) (Cons!17961 (h!19107 (_ BitVec 64)) (t!25348 List!17965)) )
))
(declare-fun arrayNoDuplicates!0 (array!53246 (_ BitVec 32) List!17965) Bool)

(assert (=> b!904338 (= res!610173 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17962))))

(declare-fun b!904340 () Bool)

(declare-fun e!506739 () Bool)

(declare-fun tp_is_empty!18601 () Bool)

(assert (=> b!904340 (= e!506739 tp_is_empty!18601)))

(declare-fun b!904341 () Bool)

(declare-fun e!506738 () Bool)

(assert (=> b!904341 (= e!506738 (and e!506739 mapRes!29614))))

(declare-fun condMapEmpty!29614 () Bool)

(declare-fun mapDefault!29614 () ValueCell!8819)

