; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96322 () Bool)

(assert start!96322)

(declare-fun b!1094648 () Bool)

(declare-fun e!624962 () Bool)

(declare-fun tp_is_empty!26977 () Bool)

(assert (=> b!1094648 (= e!624962 tp_is_empty!26977)))

(declare-fun mapIsEmpty!42220 () Bool)

(declare-fun mapRes!42220 () Bool)

(assert (=> mapIsEmpty!42220 mapRes!42220))

(declare-fun b!1094649 () Bool)

(declare-fun res!730494 () Bool)

(declare-fun e!624963 () Bool)

(assert (=> b!1094649 (=> (not res!730494) (not e!624963))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70867 0))(
  ( (array!70868 (arr!34107 (Array (_ BitVec 32) (_ BitVec 64))) (size!34643 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70867)

(assert (=> b!1094649 (= res!730494 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34643 _keys!1070))))))

(declare-fun b!1094650 () Bool)

(declare-fun res!730499 () Bool)

(assert (=> b!1094650 (=> (not res!730499) (not e!624963))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41097 0))(
  ( (V!41098 (val!13545 Int)) )
))
(declare-datatypes ((ValueCell!12779 0))(
  ( (ValueCellFull!12779 (v!16166 V!41097)) (EmptyCell!12779) )
))
(declare-datatypes ((array!70869 0))(
  ( (array!70870 (arr!34108 (Array (_ BitVec 32) ValueCell!12779)) (size!34644 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70869)

(assert (=> b!1094650 (= res!730499 (and (= (size!34644 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34643 _keys!1070) (size!34644 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094651 () Bool)

(declare-fun e!624965 () Bool)

(assert (=> b!1094651 (= e!624965 tp_is_empty!26977)))

(declare-fun b!1094652 () Bool)

(declare-fun e!624964 () Bool)

(assert (=> b!1094652 (= e!624964 false)))

(declare-fun lt!489679 () Bool)

(declare-fun lt!489678 () array!70867)

(declare-datatypes ((List!23824 0))(
  ( (Nil!23821) (Cons!23820 (h!25029 (_ BitVec 64)) (t!33831 List!23824)) )
))
(declare-fun arrayNoDuplicates!0 (array!70867 (_ BitVec 32) List!23824) Bool)

(assert (=> b!1094652 (= lt!489679 (arrayNoDuplicates!0 lt!489678 #b00000000000000000000000000000000 Nil!23821))))

(declare-fun res!730495 () Bool)

(assert (=> start!96322 (=> (not res!730495) (not e!624963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96322 (= res!730495 (validMask!0 mask!1414))))

(assert (=> start!96322 e!624963))

(assert (=> start!96322 true))

(declare-fun array_inv!26282 (array!70867) Bool)

(assert (=> start!96322 (array_inv!26282 _keys!1070)))

(declare-fun e!624960 () Bool)

(declare-fun array_inv!26283 (array!70869) Bool)

(assert (=> start!96322 (and (array_inv!26283 _values!874) e!624960)))

(declare-fun b!1094647 () Bool)

(assert (=> b!1094647 (= e!624963 e!624964)))

(declare-fun res!730500 () Bool)

(assert (=> b!1094647 (=> (not res!730500) (not e!624964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70867 (_ BitVec 32)) Bool)

(assert (=> b!1094647 (= res!730500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489678 mask!1414))))

(assert (=> b!1094647 (= lt!489678 (array!70868 (store (arr!34107 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34643 _keys!1070)))))

(declare-fun mapNonEmpty!42220 () Bool)

(declare-fun tp!80735 () Bool)

(assert (=> mapNonEmpty!42220 (= mapRes!42220 (and tp!80735 e!624965))))

(declare-fun mapRest!42220 () (Array (_ BitVec 32) ValueCell!12779))

(declare-fun mapValue!42220 () ValueCell!12779)

(declare-fun mapKey!42220 () (_ BitVec 32))

(assert (=> mapNonEmpty!42220 (= (arr!34108 _values!874) (store mapRest!42220 mapKey!42220 mapValue!42220))))

(declare-fun b!1094653 () Bool)

(declare-fun res!730497 () Bool)

(assert (=> b!1094653 (=> (not res!730497) (not e!624963))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094653 (= res!730497 (validKeyInArray!0 k!904))))

(declare-fun b!1094654 () Bool)

(declare-fun res!730496 () Bool)

(assert (=> b!1094654 (=> (not res!730496) (not e!624963))))

(assert (=> b!1094654 (= res!730496 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23821))))

(declare-fun b!1094655 () Bool)

(declare-fun res!730493 () Bool)

(assert (=> b!1094655 (=> (not res!730493) (not e!624963))))

(assert (=> b!1094655 (= res!730493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094656 () Bool)

(assert (=> b!1094656 (= e!624960 (and e!624962 mapRes!42220))))

(declare-fun condMapEmpty!42220 () Bool)

(declare-fun mapDefault!42220 () ValueCell!12779)

