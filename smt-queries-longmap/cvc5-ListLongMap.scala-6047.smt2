; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78202 () Bool)

(assert start!78202)

(declare-fun b_free!16693 () Bool)

(declare-fun b_next!16693 () Bool)

(assert (=> start!78202 (= b_free!16693 (not b_next!16693))))

(declare-fun tp!58356 () Bool)

(declare-fun b_and!27269 () Bool)

(assert (=> start!78202 (= tp!58356 b_and!27269)))

(declare-fun b!912653 () Bool)

(declare-fun res!615648 () Bool)

(declare-fun e!511936 () Bool)

(assert (=> b!912653 (=> (not res!615648) (not e!511936))))

(declare-datatypes ((array!54216 0))(
  ( (array!54217 (arr!26062 (Array (_ BitVec 32) (_ BitVec 64))) (size!26521 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54216)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54216 (_ BitVec 32)) Bool)

(assert (=> b!912653 (= res!615648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912654 () Bool)

(assert (=> b!912654 (= e!511936 (not true))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912654 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30447 0))(
  ( (V!30448 (val!9606 Int)) )
))
(declare-datatypes ((ValueCell!9074 0))(
  ( (ValueCellFull!9074 (v!12117 V!30447)) (EmptyCell!9074) )
))
(declare-datatypes ((array!54218 0))(
  ( (array!54219 (arr!26063 (Array (_ BitVec 32) ValueCell!9074)) (size!26522 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54218)

(declare-fun zeroValue!1094 () V!30447)

(declare-datatypes ((Unit!30884 0))(
  ( (Unit!30885) )
))
(declare-fun lt!410690 () Unit!30884)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30447)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lemmaKeyInListMapIsInArray!267 (array!54216 array!54218 (_ BitVec 32) (_ BitVec 32) V!30447 V!30447 (_ BitVec 64) Int) Unit!30884)

(assert (=> b!912654 (= lt!410690 (lemmaKeyInListMapIsInArray!267 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!912655 () Bool)

(declare-fun e!511935 () Bool)

(declare-fun tp_is_empty!19111 () Bool)

(assert (=> b!912655 (= e!511935 tp_is_empty!19111)))

(declare-fun b!912656 () Bool)

(declare-fun res!615650 () Bool)

(assert (=> b!912656 (=> (not res!615650) (not e!511936))))

(assert (=> b!912656 (= res!615650 (and (= (size!26522 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26521 _keys!1386) (size!26522 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30394 () Bool)

(declare-fun mapRes!30394 () Bool)

(declare-fun tp!58355 () Bool)

(assert (=> mapNonEmpty!30394 (= mapRes!30394 (and tp!58355 e!511935))))

(declare-fun mapKey!30394 () (_ BitVec 32))

(declare-fun mapValue!30394 () ValueCell!9074)

(declare-fun mapRest!30394 () (Array (_ BitVec 32) ValueCell!9074))

(assert (=> mapNonEmpty!30394 (= (arr!26063 _values!1152) (store mapRest!30394 mapKey!30394 mapValue!30394))))

(declare-fun b!912657 () Bool)

(declare-fun res!615654 () Bool)

(assert (=> b!912657 (=> (not res!615654) (not e!511936))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912657 (= res!615654 (inRange!0 i!717 mask!1756))))

(declare-fun b!912658 () Bool)

(declare-fun e!511938 () Bool)

(assert (=> b!912658 (= e!511938 tp_is_empty!19111)))

(declare-fun b!912659 () Bool)

(declare-fun e!511937 () Bool)

(assert (=> b!912659 (= e!511937 (and e!511938 mapRes!30394))))

(declare-fun condMapEmpty!30394 () Bool)

(declare-fun mapDefault!30394 () ValueCell!9074)

