; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95406 () Bool)

(assert start!95406)

(declare-fun b!1077539 () Bool)

(declare-fun res!717986 () Bool)

(declare-fun e!616124 () Bool)

(assert (=> b!1077539 (=> (not res!717986) (not e!616124))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69189 0))(
  ( (array!69190 (arr!33272 (Array (_ BitVec 32) (_ BitVec 64))) (size!33808 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69189)

(declare-datatypes ((V!39953 0))(
  ( (V!39954 (val!13116 Int)) )
))
(declare-datatypes ((ValueCell!12350 0))(
  ( (ValueCellFull!12350 (v!15736 V!39953)) (EmptyCell!12350) )
))
(declare-datatypes ((array!69191 0))(
  ( (array!69192 (arr!33273 (Array (_ BitVec 32) ValueCell!12350)) (size!33809 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69191)

(assert (=> b!1077539 (= res!717986 (and (= (size!33809 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33808 _keys!1070) (size!33809 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!40921 () Bool)

(declare-fun mapRes!40921 () Bool)

(assert (=> mapIsEmpty!40921 mapRes!40921))

(declare-fun b!1077540 () Bool)

(declare-fun e!616126 () Bool)

(declare-fun tp_is_empty!26119 () Bool)

(assert (=> b!1077540 (= e!616126 tp_is_empty!26119)))

(declare-fun b!1077541 () Bool)

(assert (=> b!1077541 (= e!616124 false)))

(declare-fun lt!478551 () Bool)

(declare-datatypes ((List!23221 0))(
  ( (Nil!23218) (Cons!23217 (h!24426 (_ BitVec 64)) (t!32580 List!23221)) )
))
(declare-fun arrayNoDuplicates!0 (array!69189 (_ BitVec 32) List!23221) Bool)

(assert (=> b!1077541 (= lt!478551 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23218))))

(declare-fun res!717984 () Bool)

(assert (=> start!95406 (=> (not res!717984) (not e!616124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95406 (= res!717984 (validMask!0 mask!1414))))

(assert (=> start!95406 e!616124))

(assert (=> start!95406 true))

(declare-fun e!616123 () Bool)

(declare-fun array_inv!25704 (array!69191) Bool)

(assert (=> start!95406 (and (array_inv!25704 _values!874) e!616123)))

(declare-fun array_inv!25705 (array!69189) Bool)

(assert (=> start!95406 (array_inv!25705 _keys!1070)))

(declare-fun b!1077542 () Bool)

(assert (=> b!1077542 (= e!616123 (and e!616126 mapRes!40921))))

(declare-fun condMapEmpty!40921 () Bool)

(declare-fun mapDefault!40921 () ValueCell!12350)

