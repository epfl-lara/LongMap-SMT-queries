; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77730 () Bool)

(assert start!77730)

(declare-fun b_free!16315 () Bool)

(declare-fun b_next!16315 () Bool)

(assert (=> start!77730 (= b_free!16315 (not b_next!16315))))

(declare-fun tp!57206 () Bool)

(declare-fun b_and!26783 () Bool)

(assert (=> start!77730 (= tp!57206 b_and!26783)))

(declare-fun b!906968 () Bool)

(declare-fun res!612115 () Bool)

(declare-fun e!508277 () Bool)

(assert (=> b!906968 (=> (not res!612115) (not e!508277))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906968 (= res!612115 (inRange!0 i!717 mask!1756))))

(declare-fun b!906970 () Bool)

(declare-fun e!508278 () Bool)

(assert (=> b!906970 (= e!508278 e!508277)))

(declare-fun res!612116 () Bool)

(assert (=> b!906970 (=> (not res!612116) (not e!508277))))

(declare-datatypes ((V!29943 0))(
  ( (V!29944 (val!9417 Int)) )
))
(declare-datatypes ((tuple2!12262 0))(
  ( (tuple2!12263 (_1!6142 (_ BitVec 64)) (_2!6142 V!29943)) )
))
(declare-datatypes ((List!18065 0))(
  ( (Nil!18062) (Cons!18061 (h!19207 tuple2!12262) (t!25552 List!18065)) )
))
(declare-datatypes ((ListLongMap!10959 0))(
  ( (ListLongMap!10960 (toList!5495 List!18065)) )
))
(declare-fun lt!409116 () ListLongMap!10959)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4540 (ListLongMap!10959 (_ BitVec 64)) Bool)

(assert (=> b!906970 (= res!612116 (contains!4540 lt!409116 k!1033))))

(declare-datatypes ((ValueCell!8885 0))(
  ( (ValueCellFull!8885 (v!11922 V!29943)) (EmptyCell!8885) )
))
(declare-datatypes ((array!53504 0))(
  ( (array!53505 (arr!25711 (Array (_ BitVec 32) ValueCell!8885)) (size!26170 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53504)

(declare-fun defaultEntry!1160 () Int)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29943)

(declare-fun zeroValue!1094 () V!29943)

(declare-datatypes ((array!53506 0))(
  ( (array!53507 (arr!25712 (Array (_ BitVec 32) (_ BitVec 64))) (size!26171 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53506)

(declare-fun getCurrentListMap!2761 (array!53506 array!53504 (_ BitVec 32) (_ BitVec 32) V!29943 V!29943 (_ BitVec 32) Int) ListLongMap!10959)

(assert (=> b!906970 (= lt!409116 (getCurrentListMap!2761 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapNonEmpty!29812 () Bool)

(declare-fun mapRes!29812 () Bool)

(declare-fun tp!57207 () Bool)

(declare-fun e!508280 () Bool)

(assert (=> mapNonEmpty!29812 (= mapRes!29812 (and tp!57207 e!508280))))

(declare-fun mapValue!29812 () ValueCell!8885)

(declare-fun mapRest!29812 () (Array (_ BitVec 32) ValueCell!8885))

(declare-fun mapKey!29812 () (_ BitVec 32))

(assert (=> mapNonEmpty!29812 (= (arr!25711 _values!1152) (store mapRest!29812 mapKey!29812 mapValue!29812))))

(declare-fun b!906971 () Bool)

(declare-fun res!612119 () Bool)

(assert (=> b!906971 (=> (not res!612119) (not e!508278))))

(assert (=> b!906971 (= res!612119 (and (= (size!26170 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26171 _keys!1386) (size!26170 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906972 () Bool)

(declare-fun e!508276 () Bool)

(declare-fun e!508279 () Bool)

(assert (=> b!906972 (= e!508276 (and e!508279 mapRes!29812))))

(declare-fun condMapEmpty!29812 () Bool)

(declare-fun mapDefault!29812 () ValueCell!8885)

