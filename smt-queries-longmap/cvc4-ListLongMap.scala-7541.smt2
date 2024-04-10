; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95570 () Bool)

(assert start!95570)

(declare-fun b!1079529 () Bool)

(declare-fun res!719411 () Bool)

(declare-fun e!617185 () Bool)

(assert (=> b!1079529 (=> (not res!719411) (not e!617185))))

(declare-datatypes ((array!69405 0))(
  ( (array!69406 (arr!33376 (Array (_ BitVec 32) (_ BitVec 64))) (size!33912 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69405)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69405 (_ BitVec 32)) Bool)

(assert (=> b!1079529 (= res!719411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1079530 () Bool)

(declare-fun e!617184 () Bool)

(assert (=> b!1079530 (= e!617185 e!617184)))

(declare-fun res!719410 () Bool)

(assert (=> b!1079530 (=> (not res!719410) (not e!617184))))

(declare-fun lt!478828 () array!69405)

(assert (=> b!1079530 (= res!719410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478828 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079530 (= lt!478828 (array!69406 (store (arr!33376 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33912 _keys!1070)))))

(declare-fun res!719414 () Bool)

(assert (=> start!95570 (=> (not res!719414) (not e!617185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95570 (= res!719414 (validMask!0 mask!1414))))

(assert (=> start!95570 e!617185))

(assert (=> start!95570 true))

(declare-fun array_inv!25776 (array!69405) Bool)

(assert (=> start!95570 (array_inv!25776 _keys!1070)))

(declare-datatypes ((V!40093 0))(
  ( (V!40094 (val!13169 Int)) )
))
(declare-datatypes ((ValueCell!12403 0))(
  ( (ValueCellFull!12403 (v!15790 V!40093)) (EmptyCell!12403) )
))
(declare-datatypes ((array!69407 0))(
  ( (array!69408 (arr!33377 (Array (_ BitVec 32) ValueCell!12403)) (size!33913 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69407)

(declare-fun e!617189 () Bool)

(declare-fun array_inv!25777 (array!69407) Bool)

(assert (=> start!95570 (and (array_inv!25777 _values!874) e!617189)))

(declare-fun b!1079531 () Bool)

(declare-fun res!719407 () Bool)

(assert (=> b!1079531 (=> (not res!719407) (not e!617185))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079531 (= res!719407 (and (= (size!33913 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33912 _keys!1070) (size!33913 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079532 () Bool)

(declare-fun res!719415 () Bool)

(assert (=> b!1079532 (=> (not res!719415) (not e!617185))))

(declare-datatypes ((List!23262 0))(
  ( (Nil!23259) (Cons!23258 (h!24467 (_ BitVec 64)) (t!32621 List!23262)) )
))
(declare-fun arrayNoDuplicates!0 (array!69405 (_ BitVec 32) List!23262) Bool)

(assert (=> b!1079532 (= res!719415 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23259))))

(declare-fun b!1079533 () Bool)

(declare-fun e!617188 () Bool)

(declare-fun mapRes!41092 () Bool)

(assert (=> b!1079533 (= e!617189 (and e!617188 mapRes!41092))))

(declare-fun condMapEmpty!41092 () Bool)

(declare-fun mapDefault!41092 () ValueCell!12403)

