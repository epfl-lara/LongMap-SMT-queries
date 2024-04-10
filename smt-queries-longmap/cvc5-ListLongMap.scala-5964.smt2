; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77610 () Bool)

(assert start!77610)

(declare-fun b_free!16195 () Bool)

(declare-fun b_next!16195 () Bool)

(assert (=> start!77610 (= b_free!16195 (not b_next!16195))))

(declare-fun tp!56846 () Bool)

(declare-fun b_and!26561 () Bool)

(assert (=> start!77610 (= tp!56846 b_and!26561)))

(declare-fun b!904551 () Bool)

(declare-fun res!610342 () Bool)

(declare-fun e!506859 () Bool)

(assert (=> b!904551 (=> (not res!610342) (not e!506859))))

(declare-datatypes ((array!53270 0))(
  ( (array!53271 (arr!25594 (Array (_ BitVec 32) (_ BitVec 64))) (size!26053 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53270)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53270 (_ BitVec 32)) Bool)

(assert (=> b!904551 (= res!610342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!610338 () Bool)

(assert (=> start!77610 (=> (not res!610338) (not e!506859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77610 (= res!610338 (validMask!0 mask!1756))))

(assert (=> start!77610 e!506859))

(declare-datatypes ((V!29783 0))(
  ( (V!29784 (val!9357 Int)) )
))
(declare-datatypes ((ValueCell!8825 0))(
  ( (ValueCellFull!8825 (v!11862 V!29783)) (EmptyCell!8825) )
))
(declare-datatypes ((array!53272 0))(
  ( (array!53273 (arr!25595 (Array (_ BitVec 32) ValueCell!8825)) (size!26054 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53272)

(declare-fun e!506863 () Bool)

(declare-fun array_inv!20050 (array!53272) Bool)

(assert (=> start!77610 (and (array_inv!20050 _values!1152) e!506863)))

(assert (=> start!77610 tp!56846))

(assert (=> start!77610 true))

(declare-fun tp_is_empty!18613 () Bool)

(assert (=> start!77610 tp_is_empty!18613))

(declare-fun array_inv!20051 (array!53270) Bool)

(assert (=> start!77610 (array_inv!20051 _keys!1386)))

(declare-fun b!904552 () Bool)

(declare-fun res!610340 () Bool)

(assert (=> b!904552 (=> (not res!610340) (not e!506859))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k!1033 () (_ BitVec 64))

(assert (=> b!904552 (= res!610340 (and (= (select (arr!25594 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29632 () Bool)

(declare-fun mapRes!29632 () Bool)

(declare-fun tp!56847 () Bool)

(declare-fun e!506865 () Bool)

(assert (=> mapNonEmpty!29632 (= mapRes!29632 (and tp!56847 e!506865))))

(declare-fun mapValue!29632 () ValueCell!8825)

(declare-fun mapKey!29632 () (_ BitVec 32))

(declare-fun mapRest!29632 () (Array (_ BitVec 32) ValueCell!8825))

(assert (=> mapNonEmpty!29632 (= (arr!25595 _values!1152) (store mapRest!29632 mapKey!29632 mapValue!29632))))

(declare-fun b!904553 () Bool)

(declare-fun e!506861 () Bool)

(assert (=> b!904553 (= e!506861 tp_is_empty!18613)))

(declare-fun b!904554 () Bool)

(declare-fun res!610343 () Bool)

(assert (=> b!904554 (=> (not res!610343) (not e!506859))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29783)

(declare-fun zeroValue!1094 () V!29783)

(declare-datatypes ((tuple2!12158 0))(
  ( (tuple2!12159 (_1!6090 (_ BitVec 64)) (_2!6090 V!29783)) )
))
(declare-datatypes ((List!17974 0))(
  ( (Nil!17971) (Cons!17970 (h!19116 tuple2!12158) (t!25357 List!17974)) )
))
(declare-datatypes ((ListLongMap!10855 0))(
  ( (ListLongMap!10856 (toList!5443 List!17974)) )
))
(declare-fun contains!4490 (ListLongMap!10855 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2711 (array!53270 array!53272 (_ BitVec 32) (_ BitVec 32) V!29783 V!29783 (_ BitVec 32) Int) ListLongMap!10855)

(assert (=> b!904554 (= res!610343 (contains!4490 (getCurrentListMap!2711 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!904555 () Bool)

(declare-fun e!506860 () Bool)

(assert (=> b!904555 (= e!506859 (not e!506860))))

(declare-fun res!610339 () Bool)

(assert (=> b!904555 (=> res!610339 e!506860)))

(assert (=> b!904555 (= res!610339 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26053 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904555 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30680 0))(
  ( (Unit!30681) )
))
(declare-fun lt!408263 () Unit!30680)

(declare-fun lemmaKeyInListMapIsInArray!183 (array!53270 array!53272 (_ BitVec 32) (_ BitVec 32) V!29783 V!29783 (_ BitVec 64) Int) Unit!30680)

(assert (=> b!904555 (= lt!408263 (lemmaKeyInListMapIsInArray!183 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!904556 () Bool)

(declare-fun res!610335 () Bool)

(assert (=> b!904556 (=> (not res!610335) (not e!506859))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904556 (= res!610335 (inRange!0 i!717 mask!1756))))

(declare-fun b!904557 () Bool)

(declare-fun res!610336 () Bool)

(assert (=> b!904557 (=> (not res!610336) (not e!506859))))

(assert (=> b!904557 (= res!610336 (and (= (size!26054 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26053 _keys!1386) (size!26054 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904558 () Bool)

(assert (=> b!904558 (= e!506863 (and e!506861 mapRes!29632))))

(declare-fun condMapEmpty!29632 () Bool)

(declare-fun mapDefault!29632 () ValueCell!8825)

