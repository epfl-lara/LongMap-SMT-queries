; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95412 () Bool)

(assert start!95412)

(declare-fun res!718022 () Bool)

(declare-fun e!616168 () Bool)

(assert (=> start!95412 (=> (not res!718022) (not e!616168))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95412 (= res!718022 (validMask!0 mask!1414))))

(assert (=> start!95412 e!616168))

(assert (=> start!95412 true))

(declare-datatypes ((array!69199 0))(
  ( (array!69200 (arr!33277 (Array (_ BitVec 32) (_ BitVec 64))) (size!33813 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69199)

(declare-fun array_inv!25708 (array!69199) Bool)

(assert (=> start!95412 (array_inv!25708 _keys!1070)))

(declare-datatypes ((V!39961 0))(
  ( (V!39962 (val!13119 Int)) )
))
(declare-datatypes ((ValueCell!12353 0))(
  ( (ValueCellFull!12353 (v!15739 V!39961)) (EmptyCell!12353) )
))
(declare-datatypes ((array!69201 0))(
  ( (array!69202 (arr!33278 (Array (_ BitVec 32) ValueCell!12353)) (size!33814 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69201)

(declare-fun e!616170 () Bool)

(declare-fun array_inv!25709 (array!69201) Bool)

(assert (=> start!95412 (and (array_inv!25709 _values!874) e!616170)))

(declare-fun mapNonEmpty!40930 () Bool)

(declare-fun mapRes!40930 () Bool)

(declare-fun tp!78392 () Bool)

(declare-fun e!616171 () Bool)

(assert (=> mapNonEmpty!40930 (= mapRes!40930 (and tp!78392 e!616171))))

(declare-fun mapRest!40930 () (Array (_ BitVec 32) ValueCell!12353))

(declare-fun mapKey!40930 () (_ BitVec 32))

(declare-fun mapValue!40930 () ValueCell!12353)

(assert (=> mapNonEmpty!40930 (= (arr!33278 _values!874) (store mapRest!40930 mapKey!40930 mapValue!40930))))

(declare-fun b!1077599 () Bool)

(declare-fun res!718019 () Bool)

(assert (=> b!1077599 (=> (not res!718019) (not e!616168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69199 (_ BitVec 32)) Bool)

(assert (=> b!1077599 (= res!718019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077600 () Bool)

(declare-fun res!718018 () Bool)

(assert (=> b!1077600 (=> (not res!718018) (not e!616168))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077600 (= res!718018 (validKeyInArray!0 k!904))))

(declare-fun b!1077601 () Bool)

(declare-fun res!718020 () Bool)

(assert (=> b!1077601 (=> (not res!718020) (not e!616168))))

(declare-datatypes ((List!23223 0))(
  ( (Nil!23220) (Cons!23219 (h!24428 (_ BitVec 64)) (t!32582 List!23223)) )
))
(declare-fun arrayNoDuplicates!0 (array!69199 (_ BitVec 32) List!23223) Bool)

(assert (=> b!1077601 (= res!718020 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23220))))

(declare-fun b!1077602 () Bool)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1077602 (= e!616168 (and (= (select (arr!33277 _keys!1070) i!650) k!904) (= (size!33813 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33813 _keys!1070))))))

(declare-fun b!1077603 () Bool)

(declare-fun res!718017 () Bool)

(assert (=> b!1077603 (=> (not res!718017) (not e!616168))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1077603 (= res!718017 (and (= (size!33814 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33813 _keys!1070) (size!33814 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1077604 () Bool)

(declare-fun e!616169 () Bool)

(assert (=> b!1077604 (= e!616170 (and e!616169 mapRes!40930))))

(declare-fun condMapEmpty!40930 () Bool)

(declare-fun mapDefault!40930 () ValueCell!12353)

