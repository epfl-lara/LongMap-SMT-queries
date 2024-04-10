; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78258 () Bool)

(assert start!78258)

(declare-fun b_free!16729 () Bool)

(declare-fun b_next!16729 () Bool)

(assert (=> start!78258 (= b_free!16729 (not b_next!16729))))

(declare-fun tp!58466 () Bool)

(declare-fun b_and!27307 () Bool)

(assert (=> start!78258 (= tp!58466 b_and!27307)))

(declare-fun res!616081 () Bool)

(declare-fun e!512290 () Bool)

(assert (=> start!78258 (=> (not res!616081) (not e!512290))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78258 (= res!616081 (validMask!0 mask!1756))))

(assert (=> start!78258 e!512290))

(declare-datatypes ((V!30495 0))(
  ( (V!30496 (val!9624 Int)) )
))
(declare-datatypes ((ValueCell!9092 0))(
  ( (ValueCellFull!9092 (v!12136 V!30495)) (EmptyCell!9092) )
))
(declare-datatypes ((array!54286 0))(
  ( (array!54287 (arr!26096 (Array (_ BitVec 32) ValueCell!9092)) (size!26555 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54286)

(declare-fun e!512291 () Bool)

(declare-fun array_inv!20382 (array!54286) Bool)

(assert (=> start!78258 (and (array_inv!20382 _values!1152) e!512291)))

(assert (=> start!78258 tp!58466))

(assert (=> start!78258 true))

(declare-fun tp_is_empty!19147 () Bool)

(assert (=> start!78258 tp_is_empty!19147))

(declare-datatypes ((array!54288 0))(
  ( (array!54289 (arr!26097 (Array (_ BitVec 32) (_ BitVec 64))) (size!26556 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54288)

(declare-fun array_inv!20383 (array!54288) Bool)

(assert (=> start!78258 (array_inv!20383 _keys!1386)))

(declare-fun mapIsEmpty!30451 () Bool)

(declare-fun mapRes!30451 () Bool)

(assert (=> mapIsEmpty!30451 mapRes!30451))

(declare-fun mapNonEmpty!30451 () Bool)

(declare-fun tp!58467 () Bool)

(declare-fun e!512289 () Bool)

(assert (=> mapNonEmpty!30451 (= mapRes!30451 (and tp!58467 e!512289))))

(declare-fun mapKey!30451 () (_ BitVec 32))

(declare-fun mapRest!30451 () (Array (_ BitVec 32) ValueCell!9092))

(declare-fun mapValue!30451 () ValueCell!9092)

(assert (=> mapNonEmpty!30451 (= (arr!26096 _values!1152) (store mapRest!30451 mapKey!30451 mapValue!30451))))

(declare-fun b!913316 () Bool)

(declare-fun res!616084 () Bool)

(assert (=> b!913316 (=> (not res!616084) (not e!512290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54288 (_ BitVec 32)) Bool)

(assert (=> b!913316 (= res!616084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!913317 () Bool)

(declare-fun res!616083 () Bool)

(assert (=> b!913317 (=> (not res!616083) (not e!512290))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!913317 (= res!616083 (inRange!0 i!717 mask!1756))))

(declare-fun b!913318 () Bool)

(assert (=> b!913318 (= e!512289 tp_is_empty!19147)))

(declare-fun b!913319 () Bool)

(declare-fun e!512292 () Bool)

(assert (=> b!913319 (= e!512290 (not e!512292))))

(declare-fun res!616085 () Bool)

(assert (=> b!913319 (=> res!616085 e!512292)))

(assert (=> b!913319 (= res!616085 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26556 _keys!1386))))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!913319 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30495)

(declare-datatypes ((Unit!30916 0))(
  ( (Unit!30917) )
))
(declare-fun lt!410834 () Unit!30916)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30495)

(declare-fun lemmaKeyInListMapIsInArray!282 (array!54288 array!54286 (_ BitVec 32) (_ BitVec 32) V!30495 V!30495 (_ BitVec 64) Int) Unit!30916)

(assert (=> b!913319 (= lt!410834 (lemmaKeyInListMapIsInArray!282 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!913320 () Bool)

(declare-fun e!512288 () Bool)

(assert (=> b!913320 (= e!512291 (and e!512288 mapRes!30451))))

(declare-fun condMapEmpty!30451 () Bool)

(declare-fun mapDefault!30451 () ValueCell!9092)

