; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95840 () Bool)

(assert start!95840)

(declare-fun b_free!22493 () Bool)

(declare-fun b_next!22493 () Bool)

(assert (=> start!95840 (= b_free!22493 (not b_next!22493))))

(declare-fun tp!79328 () Bool)

(declare-fun b_and!35661 () Bool)

(assert (=> start!95840 (= tp!79328 b_and!35661)))

(declare-fun b!1084579 () Bool)

(declare-fun res!723052 () Bool)

(declare-fun e!619619 () Bool)

(assert (=> b!1084579 (=> (not res!723052) (not e!619619))))

(declare-datatypes ((array!69927 0))(
  ( (array!69928 (arr!33637 (Array (_ BitVec 32) (_ BitVec 64))) (size!34173 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69927)

(declare-datatypes ((List!23452 0))(
  ( (Nil!23449) (Cons!23448 (h!24657 (_ BitVec 64)) (t!33003 List!23452)) )
))
(declare-fun arrayNoDuplicates!0 (array!69927 (_ BitVec 32) List!23452) Bool)

(assert (=> b!1084579 (= res!723052 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23449))))

(declare-fun b!1084580 () Bool)

(declare-fun res!723053 () Bool)

(assert (=> b!1084580 (=> (not res!723053) (not e!619619))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69927 (_ BitVec 32)) Bool)

(assert (=> b!1084580 (= res!723053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084581 () Bool)

(declare-fun res!723055 () Bool)

(assert (=> b!1084581 (=> (not res!723055) (not e!619619))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40453 0))(
  ( (V!40454 (val!13304 Int)) )
))
(declare-datatypes ((ValueCell!12538 0))(
  ( (ValueCellFull!12538 (v!15925 V!40453)) (EmptyCell!12538) )
))
(declare-datatypes ((array!69929 0))(
  ( (array!69930 (arr!33638 (Array (_ BitVec 32) ValueCell!12538)) (size!34174 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69929)

(assert (=> b!1084581 (= res!723055 (and (= (size!34174 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34173 _keys!1070) (size!34174 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084582 () Bool)

(declare-fun e!619617 () Bool)

(declare-fun tp_is_empty!26495 () Bool)

(assert (=> b!1084582 (= e!619617 tp_is_empty!26495)))

(declare-fun b!1084583 () Bool)

(declare-fun res!723056 () Bool)

(assert (=> b!1084583 (=> (not res!723056) (not e!619619))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084583 (= res!723056 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34173 _keys!1070))))))

(declare-fun b!1084584 () Bool)

(declare-fun e!619616 () Bool)

(assert (=> b!1084584 (= e!619619 e!619616)))

(declare-fun res!723058 () Bool)

(assert (=> b!1084584 (=> (not res!723058) (not e!619616))))

(declare-fun lt!480779 () array!69927)

(assert (=> b!1084584 (= res!723058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480779 mask!1414))))

(assert (=> b!1084584 (= lt!480779 (array!69928 (store (arr!33637 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34173 _keys!1070)))))

(declare-fun res!723054 () Bool)

(assert (=> start!95840 (=> (not res!723054) (not e!619619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95840 (= res!723054 (validMask!0 mask!1414))))

(assert (=> start!95840 e!619619))

(assert (=> start!95840 tp!79328))

(assert (=> start!95840 true))

(assert (=> start!95840 tp_is_empty!26495))

(declare-fun array_inv!25960 (array!69927) Bool)

(assert (=> start!95840 (array_inv!25960 _keys!1070)))

(declare-fun e!619615 () Bool)

(declare-fun array_inv!25961 (array!69929) Bool)

(assert (=> start!95840 (and (array_inv!25961 _values!874) e!619615)))

(declare-fun b!1084585 () Bool)

(declare-fun e!619618 () Bool)

(assert (=> b!1084585 (= e!619618 tp_is_empty!26495)))

(declare-fun b!1084586 () Bool)

(declare-fun mapRes!41497 () Bool)

(assert (=> b!1084586 (= e!619615 (and e!619618 mapRes!41497))))

(declare-fun condMapEmpty!41497 () Bool)

(declare-fun mapDefault!41497 () ValueCell!12538)

