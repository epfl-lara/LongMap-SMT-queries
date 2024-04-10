; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78376 () Bool)

(assert start!78376)

(declare-fun b_free!16741 () Bool)

(declare-fun b_next!16741 () Bool)

(assert (=> start!78376 (= b_free!16741 (not b_next!16741))))

(declare-fun tp!58511 () Bool)

(declare-fun b_and!27349 () Bool)

(assert (=> start!78376 (= tp!58511 b_and!27349)))

(declare-fun b!914203 () Bool)

(declare-fun e!512843 () Bool)

(declare-fun e!512844 () Bool)

(assert (=> b!914203 (= e!512843 (not e!512844))))

(declare-fun res!616536 () Bool)

(assert (=> b!914203 (=> res!616536 e!512844)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54312 0))(
  ( (array!54313 (arr!26107 (Array (_ BitVec 32) (_ BitVec 64))) (size!26566 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54312)

(assert (=> b!914203 (= res!616536 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26566 _keys!1386))))))

(declare-datatypes ((V!30511 0))(
  ( (V!30512 (val!9630 Int)) )
))
(declare-datatypes ((ValueCell!9098 0))(
  ( (ValueCellFull!9098 (v!12146 V!30511)) (EmptyCell!9098) )
))
(declare-datatypes ((array!54314 0))(
  ( (array!54315 (arr!26108 (Array (_ BitVec 32) ValueCell!9098)) (size!26567 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54314)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!411405 () V!30511)

(declare-fun get!13712 (ValueCell!9098 V!30511) V!30511)

(declare-fun dynLambda!1395 (Int (_ BitVec 64)) V!30511)

(assert (=> b!914203 (= lt!411405 (get!13712 (select (arr!26108 _values!1152) i!717) (dynLambda!1395 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914203 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30511)

(declare-datatypes ((Unit!30948 0))(
  ( (Unit!30949) )
))
(declare-fun lt!411404 () Unit!30948)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30511)

(declare-fun lemmaKeyInListMapIsInArray!286 (array!54312 array!54314 (_ BitVec 32) (_ BitVec 32) V!30511 V!30511 (_ BitVec 64) Int) Unit!30948)

(assert (=> b!914203 (= lt!411404 (lemmaKeyInListMapIsInArray!286 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!914204 () Bool)

(declare-fun res!616541 () Bool)

(declare-fun e!512845 () Bool)

(assert (=> b!914204 (=> (not res!616541) (not e!512845))))

(declare-datatypes ((List!18340 0))(
  ( (Nil!18337) (Cons!18336 (h!19482 (_ BitVec 64)) (t!25941 List!18340)) )
))
(declare-fun arrayNoDuplicates!0 (array!54312 (_ BitVec 32) List!18340) Bool)

(assert (=> b!914204 (= res!616541 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18337))))

(declare-fun b!914205 () Bool)

(declare-fun res!616540 () Bool)

(assert (=> b!914205 (=> (not res!616540) (not e!512845))))

(assert (=> b!914205 (= res!616540 (and (= (size!26567 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26566 _keys!1386) (size!26567 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914206 () Bool)

(assert (=> b!914206 (= e!512845 e!512843)))

(declare-fun res!616535 () Bool)

(assert (=> b!914206 (=> (not res!616535) (not e!512843))))

(declare-datatypes ((tuple2!12552 0))(
  ( (tuple2!12553 (_1!6287 (_ BitVec 64)) (_2!6287 V!30511)) )
))
(declare-datatypes ((List!18341 0))(
  ( (Nil!18338) (Cons!18337 (h!19483 tuple2!12552) (t!25942 List!18341)) )
))
(declare-datatypes ((ListLongMap!11249 0))(
  ( (ListLongMap!11250 (toList!5640 List!18341)) )
))
(declare-fun lt!411402 () ListLongMap!11249)

(declare-fun contains!4690 (ListLongMap!11249 (_ BitVec 64)) Bool)

(assert (=> b!914206 (= res!616535 (contains!4690 lt!411402 k!1033))))

(declare-fun getCurrentListMap!2901 (array!54312 array!54314 (_ BitVec 32) (_ BitVec 32) V!30511 V!30511 (_ BitVec 32) Int) ListLongMap!11249)

(assert (=> b!914206 (= lt!411402 (getCurrentListMap!2901 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914207 () Bool)

(declare-fun e!512842 () Bool)

(declare-fun e!512847 () Bool)

(declare-fun mapRes!30477 () Bool)

(assert (=> b!914207 (= e!512842 (and e!512847 mapRes!30477))))

(declare-fun condMapEmpty!30477 () Bool)

(declare-fun mapDefault!30477 () ValueCell!9098)

