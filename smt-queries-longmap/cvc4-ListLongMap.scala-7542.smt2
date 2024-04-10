; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95576 () Bool)

(assert start!95576)

(declare-fun res!719496 () Bool)

(declare-fun e!617242 () Bool)

(assert (=> start!95576 (=> (not res!719496) (not e!617242))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95576 (= res!719496 (validMask!0 mask!1414))))

(assert (=> start!95576 e!617242))

(assert (=> start!95576 true))

(declare-datatypes ((array!69417 0))(
  ( (array!69418 (arr!33382 (Array (_ BitVec 32) (_ BitVec 64))) (size!33918 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69417)

(declare-fun array_inv!25780 (array!69417) Bool)

(assert (=> start!95576 (array_inv!25780 _keys!1070)))

(declare-datatypes ((V!40101 0))(
  ( (V!40102 (val!13172 Int)) )
))
(declare-datatypes ((ValueCell!12406 0))(
  ( (ValueCellFull!12406 (v!15793 V!40101)) (EmptyCell!12406) )
))
(declare-datatypes ((array!69419 0))(
  ( (array!69420 (arr!33383 (Array (_ BitVec 32) ValueCell!12406)) (size!33919 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69419)

(declare-fun e!617240 () Bool)

(declare-fun array_inv!25781 (array!69419) Bool)

(assert (=> start!95576 (and (array_inv!25781 _values!874) e!617240)))

(declare-fun b!1079637 () Bool)

(declare-fun res!719488 () Bool)

(assert (=> b!1079637 (=> (not res!719488) (not e!617242))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079637 (= res!719488 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33918 _keys!1070))))))

(declare-fun mapIsEmpty!41101 () Bool)

(declare-fun mapRes!41101 () Bool)

(assert (=> mapIsEmpty!41101 mapRes!41101))

(declare-fun b!1079638 () Bool)

(declare-fun e!617241 () Bool)

(declare-fun tp_is_empty!26231 () Bool)

(assert (=> b!1079638 (= e!617241 tp_is_empty!26231)))

(declare-fun b!1079639 () Bool)

(declare-fun e!617243 () Bool)

(assert (=> b!1079639 (= e!617242 e!617243)))

(declare-fun res!719489 () Bool)

(assert (=> b!1079639 (=> (not res!719489) (not e!617243))))

(declare-fun lt!478845 () array!69417)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69417 (_ BitVec 32)) Bool)

(assert (=> b!1079639 (= res!719489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478845 mask!1414))))

(assert (=> b!1079639 (= lt!478845 (array!69418 (store (arr!33382 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33918 _keys!1070)))))

(declare-fun b!1079640 () Bool)

(declare-fun res!719495 () Bool)

(assert (=> b!1079640 (=> (not res!719495) (not e!617242))))

(declare-datatypes ((List!23265 0))(
  ( (Nil!23262) (Cons!23261 (h!24470 (_ BitVec 64)) (t!32624 List!23265)) )
))
(declare-fun arrayNoDuplicates!0 (array!69417 (_ BitVec 32) List!23265) Bool)

(assert (=> b!1079640 (= res!719495 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23262))))

(declare-fun b!1079641 () Bool)

(declare-fun e!617238 () Bool)

(assert (=> b!1079641 (= e!617238 tp_is_empty!26231)))

(declare-fun b!1079642 () Bool)

(declare-fun res!719491 () Bool)

(assert (=> b!1079642 (=> (not res!719491) (not e!617242))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079642 (= res!719491 (and (= (size!33919 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33918 _keys!1070) (size!33919 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079643 () Bool)

(assert (=> b!1079643 (= e!617240 (and e!617241 mapRes!41101))))

(declare-fun condMapEmpty!41101 () Bool)

(declare-fun mapDefault!41101 () ValueCell!12406)

