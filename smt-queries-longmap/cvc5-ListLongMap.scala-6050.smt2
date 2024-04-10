; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78220 () Bool)

(assert start!78220)

(declare-fun b_free!16711 () Bool)

(declare-fun b_next!16711 () Bool)

(assert (=> start!78220 (= b_free!16711 (not b_next!16711))))

(declare-fun tp!58409 () Bool)

(declare-fun b_and!27287 () Bool)

(assert (=> start!78220 (= tp!58409 b_and!27287)))

(declare-fun b!912923 () Bool)

(declare-fun res!615838 () Bool)

(declare-fun e!512070 () Bool)

(assert (=> b!912923 (=> (not res!615838) (not e!512070))))

(declare-datatypes ((V!30471 0))(
  ( (V!30472 (val!9615 Int)) )
))
(declare-datatypes ((ValueCell!9083 0))(
  ( (ValueCellFull!9083 (v!12126 V!30471)) (EmptyCell!9083) )
))
(declare-datatypes ((array!54250 0))(
  ( (array!54251 (arr!26079 (Array (_ BitVec 32) ValueCell!9083)) (size!26538 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54250)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30471)

(declare-datatypes ((array!54252 0))(
  ( (array!54253 (arr!26080 (Array (_ BitVec 32) (_ BitVec 64))) (size!26539 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54252)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30471)

(declare-datatypes ((tuple2!12528 0))(
  ( (tuple2!12529 (_1!6275 (_ BitVec 64)) (_2!6275 V!30471)) )
))
(declare-datatypes ((List!18317 0))(
  ( (Nil!18314) (Cons!18313 (h!19459 tuple2!12528) (t!25906 List!18317)) )
))
(declare-datatypes ((ListLongMap!11225 0))(
  ( (ListLongMap!11226 (toList!5628 List!18317)) )
))
(declare-fun contains!4674 (ListLongMap!11225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2890 (array!54252 array!54250 (_ BitVec 32) (_ BitVec 32) V!30471 V!30471 (_ BitVec 32) Int) ListLongMap!11225)

(assert (=> b!912923 (= res!615838 (contains!4674 (getCurrentListMap!2890 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!912924 () Bool)

(declare-fun e!512071 () Bool)

(declare-fun tp_is_empty!19129 () Bool)

(assert (=> b!912924 (= e!512071 tp_is_empty!19129)))

(declare-fun res!615841 () Bool)

(assert (=> start!78220 (=> (not res!615841) (not e!512070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78220 (= res!615841 (validMask!0 mask!1756))))

(assert (=> start!78220 e!512070))

(declare-fun e!512072 () Bool)

(declare-fun array_inv!20370 (array!54250) Bool)

(assert (=> start!78220 (and (array_inv!20370 _values!1152) e!512072)))

(assert (=> start!78220 tp!58409))

(assert (=> start!78220 true))

(assert (=> start!78220 tp_is_empty!19129))

(declare-fun array_inv!20371 (array!54252) Bool)

(assert (=> start!78220 (array_inv!20371 _keys!1386)))

(declare-fun mapIsEmpty!30421 () Bool)

(declare-fun mapRes!30421 () Bool)

(assert (=> mapIsEmpty!30421 mapRes!30421))

(declare-fun b!912925 () Bool)

(declare-fun res!615840 () Bool)

(assert (=> b!912925 (=> (not res!615840) (not e!512070))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!912925 (= res!615840 (and (= (select (arr!26080 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912926 () Bool)

(assert (=> b!912926 (= e!512070 (not true))))

(declare-fun arrayContainsKey!0 (array!54252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912926 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30900 0))(
  ( (Unit!30901) )
))
(declare-fun lt!410717 () Unit!30900)

(declare-fun lemmaKeyInListMapIsInArray!275 (array!54252 array!54250 (_ BitVec 32) (_ BitVec 32) V!30471 V!30471 (_ BitVec 64) Int) Unit!30900)

(assert (=> b!912926 (= lt!410717 (lemmaKeyInListMapIsInArray!275 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912927 () Bool)

(assert (=> b!912927 (= e!512072 (and e!512071 mapRes!30421))))

(declare-fun condMapEmpty!30421 () Bool)

(declare-fun mapDefault!30421 () ValueCell!9083)

