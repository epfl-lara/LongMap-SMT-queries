; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96286 () Bool)

(assert start!96286)

(declare-fun b_free!22939 () Bool)

(declare-fun b_next!22939 () Bool)

(assert (=> start!96286 (= b_free!22939 (not b_next!22939))))

(declare-fun tp!80666 () Bool)

(declare-fun b_and!36553 () Bool)

(assert (=> start!96286 (= tp!80666 b_and!36553)))

(declare-fun b!1094115 () Bool)

(declare-fun res!730142 () Bool)

(declare-fun e!624663 () Bool)

(assert (=> b!1094115 (=> (not res!730142) (not e!624663))))

(declare-datatypes ((array!70797 0))(
  ( (array!70798 (arr!34072 (Array (_ BitVec 32) (_ BitVec 64))) (size!34608 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70797)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70797 (_ BitVec 32)) Bool)

(assert (=> b!1094115 (= res!730142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094116 () Bool)

(declare-fun res!730139 () Bool)

(assert (=> b!1094116 (=> (not res!730139) (not e!624663))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094116 (= res!730139 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34608 _keys!1070))))))

(declare-fun b!1094117 () Bool)

(declare-fun e!624664 () Bool)

(assert (=> b!1094117 (= e!624663 e!624664)))

(declare-fun res!730141 () Bool)

(assert (=> b!1094117 (=> (not res!730141) (not e!624664))))

(declare-fun lt!489479 () array!70797)

(assert (=> b!1094117 (= res!730141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489479 mask!1414))))

(assert (=> b!1094117 (= lt!489479 (array!70798 (store (arr!34072 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34608 _keys!1070)))))

(declare-fun b!1094118 () Bool)

(declare-fun e!624666 () Bool)

(declare-fun tp_is_empty!26941 () Bool)

(assert (=> b!1094118 (= e!624666 tp_is_empty!26941)))

(declare-fun b!1094119 () Bool)

(declare-fun res!730143 () Bool)

(assert (=> b!1094119 (=> (not res!730143) (not e!624663))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41049 0))(
  ( (V!41050 (val!13527 Int)) )
))
(declare-datatypes ((ValueCell!12761 0))(
  ( (ValueCellFull!12761 (v!16148 V!41049)) (EmptyCell!12761) )
))
(declare-datatypes ((array!70799 0))(
  ( (array!70800 (arr!34073 (Array (_ BitVec 32) ValueCell!12761)) (size!34609 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70799)

(assert (=> b!1094119 (= res!730143 (and (= (size!34609 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34608 _keys!1070) (size!34609 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094120 () Bool)

(declare-fun res!730135 () Bool)

(assert (=> b!1094120 (=> (not res!730135) (not e!624663))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094120 (= res!730135 (validKeyInArray!0 k!904))))

(declare-fun b!1094121 () Bool)

(declare-fun res!730138 () Bool)

(assert (=> b!1094121 (=> (not res!730138) (not e!624664))))

(declare-datatypes ((List!23805 0))(
  ( (Nil!23802) (Cons!23801 (h!25010 (_ BitVec 64)) (t!33802 List!23805)) )
))
(declare-fun arrayNoDuplicates!0 (array!70797 (_ BitVec 32) List!23805) Bool)

(assert (=> b!1094121 (= res!730138 (arrayNoDuplicates!0 lt!489479 #b00000000000000000000000000000000 Nil!23802))))

(declare-fun res!730137 () Bool)

(assert (=> start!96286 (=> (not res!730137) (not e!624663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96286 (= res!730137 (validMask!0 mask!1414))))

(assert (=> start!96286 e!624663))

(assert (=> start!96286 tp!80666))

(assert (=> start!96286 true))

(assert (=> start!96286 tp_is_empty!26941))

(declare-fun array_inv!26260 (array!70797) Bool)

(assert (=> start!96286 (array_inv!26260 _keys!1070)))

(declare-fun e!624668 () Bool)

(declare-fun array_inv!26261 (array!70799) Bool)

(assert (=> start!96286 (and (array_inv!26261 _values!874) e!624668)))

(declare-fun b!1094122 () Bool)

(declare-fun e!624667 () Bool)

(declare-fun mapRes!42166 () Bool)

(assert (=> b!1094122 (= e!624668 (and e!624667 mapRes!42166))))

(declare-fun condMapEmpty!42166 () Bool)

(declare-fun mapDefault!42166 () ValueCell!12761)

