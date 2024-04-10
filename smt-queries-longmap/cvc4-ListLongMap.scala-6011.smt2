; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77938 () Bool)

(assert start!77938)

(declare-fun b_free!16481 () Bool)

(declare-fun b_next!16481 () Bool)

(assert (=> start!77938 (= b_free!16481 (not b_next!16481))))

(declare-fun tp!57711 () Bool)

(declare-fun b_and!27051 () Bool)

(assert (=> start!77938 (= tp!57711 b_and!27051)))

(declare-fun mapNonEmpty!30067 () Bool)

(declare-fun mapRes!30067 () Bool)

(declare-fun tp!57710 () Bool)

(declare-fun e!510123 () Bool)

(assert (=> mapNonEmpty!30067 (= mapRes!30067 (and tp!57710 e!510123))))

(declare-datatypes ((V!30163 0))(
  ( (V!30164 (val!9500 Int)) )
))
(declare-datatypes ((ValueCell!8968 0))(
  ( (ValueCellFull!8968 (v!12008 V!30163)) (EmptyCell!8968) )
))
(declare-datatypes ((array!53820 0))(
  ( (array!53821 (arr!25867 (Array (_ BitVec 32) ValueCell!8968)) (size!26326 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53820)

(declare-fun mapValue!30067 () ValueCell!8968)

(declare-fun mapRest!30067 () (Array (_ BitVec 32) ValueCell!8968))

(declare-fun mapKey!30067 () (_ BitVec 32))

(assert (=> mapNonEmpty!30067 (= (arr!25867 _values!1152) (store mapRest!30067 mapKey!30067 mapValue!30067))))

(declare-fun b!909938 () Bool)

(declare-fun res!614087 () Bool)

(declare-fun e!510119 () Bool)

(assert (=> b!909938 (=> (not res!614087) (not e!510119))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53822 0))(
  ( (array!53823 (arr!25868 (Array (_ BitVec 32) (_ BitVec 64))) (size!26327 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53822)

(assert (=> b!909938 (= res!614087 (and (= (size!26326 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26327 _keys!1386) (size!26326 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30067 () Bool)

(assert (=> mapIsEmpty!30067 mapRes!30067))

(declare-fun b!909939 () Bool)

(assert (=> b!909939 (= e!510119 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30163)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30163)

(declare-fun lt!410126 () Bool)

(declare-datatypes ((tuple2!12382 0))(
  ( (tuple2!12383 (_1!6202 (_ BitVec 64)) (_2!6202 V!30163)) )
))
(declare-datatypes ((List!18173 0))(
  ( (Nil!18170) (Cons!18169 (h!19315 tuple2!12382) (t!25756 List!18173)) )
))
(declare-datatypes ((ListLongMap!11079 0))(
  ( (ListLongMap!11080 (toList!5555 List!18173)) )
))
(declare-fun contains!4598 (ListLongMap!11079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2817 (array!53822 array!53820 (_ BitVec 32) (_ BitVec 32) V!30163 V!30163 (_ BitVec 32) Int) ListLongMap!11079)

(assert (=> b!909939 (= lt!410126 (contains!4598 (getCurrentListMap!2817 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!909940 () Bool)

(declare-fun e!510121 () Bool)

(declare-fun e!510120 () Bool)

(assert (=> b!909940 (= e!510121 (and e!510120 mapRes!30067))))

(declare-fun condMapEmpty!30067 () Bool)

(declare-fun mapDefault!30067 () ValueCell!8968)

