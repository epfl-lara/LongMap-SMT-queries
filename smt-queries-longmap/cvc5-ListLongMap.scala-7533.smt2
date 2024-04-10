; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95502 () Bool)

(assert start!95502)

(declare-fun b!1078550 () Bool)

(declare-fun res!718690 () Bool)

(declare-fun e!616676 () Bool)

(assert (=> b!1078550 (=> (not res!718690) (not e!616676))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078550 (= res!718690 (validKeyInArray!0 k!904))))

(declare-fun res!718687 () Bool)

(assert (=> start!95502 (=> (not res!718687) (not e!616676))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95502 (= res!718687 (validMask!0 mask!1414))))

(assert (=> start!95502 e!616676))

(assert (=> start!95502 true))

(declare-datatypes ((array!69301 0))(
  ( (array!69302 (arr!33325 (Array (_ BitVec 32) (_ BitVec 64))) (size!33861 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69301)

(declare-fun array_inv!25742 (array!69301) Bool)

(assert (=> start!95502 (array_inv!25742 _keys!1070)))

(declare-datatypes ((V!40025 0))(
  ( (V!40026 (val!13143 Int)) )
))
(declare-datatypes ((ValueCell!12377 0))(
  ( (ValueCellFull!12377 (v!15764 V!40025)) (EmptyCell!12377) )
))
(declare-datatypes ((array!69303 0))(
  ( (array!69304 (arr!33326 (Array (_ BitVec 32) ValueCell!12377)) (size!33862 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69303)

(declare-fun e!616679 () Bool)

(declare-fun array_inv!25743 (array!69303) Bool)

(assert (=> start!95502 (and (array_inv!25743 _values!874) e!616679)))

(declare-fun b!1078551 () Bool)

(declare-fun res!718689 () Bool)

(assert (=> b!1078551 (=> (not res!718689) (not e!616676))))

(declare-datatypes ((List!23242 0))(
  ( (Nil!23239) (Cons!23238 (h!24447 (_ BitVec 64)) (t!32601 List!23242)) )
))
(declare-fun arrayNoDuplicates!0 (array!69301 (_ BitVec 32) List!23242) Bool)

(assert (=> b!1078551 (= res!718689 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23239))))

(declare-fun mapNonEmpty!41011 () Bool)

(declare-fun mapRes!41011 () Bool)

(declare-fun tp!78473 () Bool)

(declare-fun e!616681 () Bool)

(assert (=> mapNonEmpty!41011 (= mapRes!41011 (and tp!78473 e!616681))))

(declare-fun mapRest!41011 () (Array (_ BitVec 32) ValueCell!12377))

(declare-fun mapValue!41011 () ValueCell!12377)

(declare-fun mapKey!41011 () (_ BitVec 32))

(assert (=> mapNonEmpty!41011 (= (arr!33326 _values!874) (store mapRest!41011 mapKey!41011 mapValue!41011))))

(declare-fun b!1078552 () Bool)

(declare-fun e!616678 () Bool)

(assert (=> b!1078552 (= e!616678 false)))

(declare-fun lt!478656 () Bool)

(declare-fun lt!478657 () array!69301)

(assert (=> b!1078552 (= lt!478656 (arrayNoDuplicates!0 lt!478657 #b00000000000000000000000000000000 Nil!23239))))

(declare-fun b!1078553 () Bool)

(assert (=> b!1078553 (= e!616676 e!616678)))

(declare-fun res!718691 () Bool)

(assert (=> b!1078553 (=> (not res!718691) (not e!616678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69301 (_ BitVec 32)) Bool)

(assert (=> b!1078553 (= res!718691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478657 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078553 (= lt!478657 (array!69302 (store (arr!33325 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33861 _keys!1070)))))

(declare-fun b!1078554 () Bool)

(declare-fun res!718686 () Bool)

(assert (=> b!1078554 (=> (not res!718686) (not e!616676))))

(assert (=> b!1078554 (= res!718686 (= (select (arr!33325 _keys!1070) i!650) k!904))))

(declare-fun b!1078555 () Bool)

(declare-fun res!718688 () Bool)

(assert (=> b!1078555 (=> (not res!718688) (not e!616676))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078555 (= res!718688 (and (= (size!33862 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33861 _keys!1070) (size!33862 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41011 () Bool)

(assert (=> mapIsEmpty!41011 mapRes!41011))

(declare-fun b!1078556 () Bool)

(declare-fun tp_is_empty!26173 () Bool)

(assert (=> b!1078556 (= e!616681 tp_is_empty!26173)))

(declare-fun b!1078557 () Bool)

(declare-fun e!616677 () Bool)

(assert (=> b!1078557 (= e!616677 tp_is_empty!26173)))

(declare-fun b!1078558 () Bool)

(declare-fun res!718692 () Bool)

(assert (=> b!1078558 (=> (not res!718692) (not e!616676))))

(assert (=> b!1078558 (= res!718692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078559 () Bool)

(assert (=> b!1078559 (= e!616679 (and e!616677 mapRes!41011))))

(declare-fun condMapEmpty!41011 () Bool)

(declare-fun mapDefault!41011 () ValueCell!12377)

