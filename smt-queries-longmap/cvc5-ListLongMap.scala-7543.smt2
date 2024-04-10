; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95578 () Bool)

(assert start!95578)

(declare-fun b!1079673 () Bool)

(declare-fun e!617257 () Bool)

(declare-fun tp_is_empty!26233 () Bool)

(assert (=> b!1079673 (= e!617257 tp_is_empty!26233)))

(declare-fun mapNonEmpty!41104 () Bool)

(declare-fun mapRes!41104 () Bool)

(declare-fun tp!78566 () Bool)

(assert (=> mapNonEmpty!41104 (= mapRes!41104 (and tp!78566 e!617257))))

(declare-datatypes ((V!40105 0))(
  ( (V!40106 (val!13173 Int)) )
))
(declare-datatypes ((ValueCell!12407 0))(
  ( (ValueCellFull!12407 (v!15794 V!40105)) (EmptyCell!12407) )
))
(declare-fun mapValue!41104 () ValueCell!12407)

(declare-datatypes ((array!69421 0))(
  ( (array!69422 (arr!33384 (Array (_ BitVec 32) ValueCell!12407)) (size!33920 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69421)

(declare-fun mapRest!41104 () (Array (_ BitVec 32) ValueCell!12407))

(declare-fun mapKey!41104 () (_ BitVec 32))

(assert (=> mapNonEmpty!41104 (= (arr!33384 _values!874) (store mapRest!41104 mapKey!41104 mapValue!41104))))

(declare-fun b!1079675 () Bool)

(declare-fun res!719521 () Bool)

(declare-fun e!617260 () Bool)

(assert (=> b!1079675 (=> (not res!719521) (not e!617260))))

(declare-datatypes ((array!69423 0))(
  ( (array!69424 (arr!33385 (Array (_ BitVec 32) (_ BitVec 64))) (size!33921 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69423)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1079675 (= res!719521 (= (select (arr!33385 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!41104 () Bool)

(assert (=> mapIsEmpty!41104 mapRes!41104))

(declare-fun b!1079676 () Bool)

(declare-fun e!617258 () Bool)

(assert (=> b!1079676 (= e!617260 e!617258)))

(declare-fun res!719517 () Bool)

(assert (=> b!1079676 (=> (not res!719517) (not e!617258))))

(declare-fun lt!478851 () array!69423)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69423 (_ BitVec 32)) Bool)

(assert (=> b!1079676 (= res!719517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478851 mask!1414))))

(assert (=> b!1079676 (= lt!478851 (array!69424 (store (arr!33385 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33921 _keys!1070)))))

(declare-fun b!1079677 () Bool)

(declare-fun res!719515 () Bool)

(assert (=> b!1079677 (=> (not res!719515) (not e!617258))))

(declare-datatypes ((List!23266 0))(
  ( (Nil!23263) (Cons!23262 (h!24471 (_ BitVec 64)) (t!32625 List!23266)) )
))
(declare-fun arrayNoDuplicates!0 (array!69423 (_ BitVec 32) List!23266) Bool)

(assert (=> b!1079677 (= res!719515 (arrayNoDuplicates!0 lt!478851 #b00000000000000000000000000000000 Nil!23263))))

(declare-fun b!1079678 () Bool)

(declare-fun res!719522 () Bool)

(assert (=> b!1079678 (=> (not res!719522) (not e!617260))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1079678 (= res!719522 (and (= (size!33920 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33921 _keys!1070) (size!33920 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1079679 () Bool)

(declare-fun res!719516 () Bool)

(assert (=> b!1079679 (=> (not res!719516) (not e!617260))))

(assert (=> b!1079679 (= res!719516 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23263))))

(declare-fun b!1079680 () Bool)

(declare-fun res!719519 () Bool)

(assert (=> b!1079680 (=> (not res!719519) (not e!617260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1079680 (= res!719519 (validKeyInArray!0 k!904))))

(declare-fun b!1079681 () Bool)

(declare-fun e!617259 () Bool)

(declare-fun e!617256 () Bool)

(assert (=> b!1079681 (= e!617259 (and e!617256 mapRes!41104))))

(declare-fun condMapEmpty!41104 () Bool)

(declare-fun mapDefault!41104 () ValueCell!12407)

