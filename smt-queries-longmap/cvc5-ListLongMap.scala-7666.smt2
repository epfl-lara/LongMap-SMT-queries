; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96316 () Bool)

(assert start!96316)

(declare-fun b!1094555 () Bool)

(declare-fun res!730428 () Bool)

(declare-fun e!624917 () Bool)

(assert (=> b!1094555 (=> (not res!730428) (not e!624917))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70855 0))(
  ( (array!70856 (arr!34101 (Array (_ BitVec 32) (_ BitVec 64))) (size!34637 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70855)

(assert (=> b!1094555 (= res!730428 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34637 _keys!1070))))))

(declare-fun b!1094556 () Bool)

(declare-fun res!730434 () Bool)

(assert (=> b!1094556 (=> (not res!730434) (not e!624917))))

(declare-datatypes ((List!23821 0))(
  ( (Nil!23818) (Cons!23817 (h!25026 (_ BitVec 64)) (t!33828 List!23821)) )
))
(declare-fun arrayNoDuplicates!0 (array!70855 (_ BitVec 32) List!23821) Bool)

(assert (=> b!1094556 (= res!730434 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23818))))

(declare-fun mapIsEmpty!42211 () Bool)

(declare-fun mapRes!42211 () Bool)

(assert (=> mapIsEmpty!42211 mapRes!42211))

(declare-fun b!1094557 () Bool)

(declare-fun e!624915 () Bool)

(declare-fun tp_is_empty!26971 () Bool)

(assert (=> b!1094557 (= e!624915 tp_is_empty!26971)))

(declare-fun b!1094558 () Bool)

(declare-fun res!730433 () Bool)

(assert (=> b!1094558 (=> (not res!730433) (not e!624917))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41089 0))(
  ( (V!41090 (val!13542 Int)) )
))
(declare-datatypes ((ValueCell!12776 0))(
  ( (ValueCellFull!12776 (v!16163 V!41089)) (EmptyCell!12776) )
))
(declare-datatypes ((array!70857 0))(
  ( (array!70858 (arr!34102 (Array (_ BitVec 32) ValueCell!12776)) (size!34638 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70857)

(declare-fun mask!1414 () (_ BitVec 32))

(assert (=> b!1094558 (= res!730433 (and (= (size!34638 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34637 _keys!1070) (size!34638 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42211 () Bool)

(declare-fun tp!80726 () Bool)

(assert (=> mapNonEmpty!42211 (= mapRes!42211 (and tp!80726 e!624915))))

(declare-fun mapRest!42211 () (Array (_ BitVec 32) ValueCell!12776))

(declare-fun mapKey!42211 () (_ BitVec 32))

(declare-fun mapValue!42211 () ValueCell!12776)

(assert (=> mapNonEmpty!42211 (= (arr!34102 _values!874) (store mapRest!42211 mapKey!42211 mapValue!42211))))

(declare-fun b!1094559 () Bool)

(declare-fun e!624916 () Bool)

(assert (=> b!1094559 (= e!624916 tp_is_empty!26971)))

(declare-fun b!1094560 () Bool)

(declare-fun e!624914 () Bool)

(assert (=> b!1094560 (= e!624914 (and e!624916 mapRes!42211))))

(declare-fun condMapEmpty!42211 () Bool)

(declare-fun mapDefault!42211 () ValueCell!12776)

