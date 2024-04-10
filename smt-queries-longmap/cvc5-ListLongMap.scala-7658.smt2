; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96268 () Bool)

(assert start!96268)

(declare-fun b_free!22921 () Bool)

(declare-fun b_next!22921 () Bool)

(assert (=> start!96268 (= b_free!22921 (not b_next!22921))))

(declare-fun tp!80611 () Bool)

(declare-fun b_and!36517 () Bool)

(assert (=> start!96268 (= tp!80611 b_and!36517)))

(declare-fun mapNonEmpty!42139 () Bool)

(declare-fun mapRes!42139 () Bool)

(declare-fun tp!80612 () Bool)

(declare-fun e!624504 () Bool)

(assert (=> mapNonEmpty!42139 (= mapRes!42139 (and tp!80612 e!624504))))

(declare-datatypes ((V!41025 0))(
  ( (V!41026 (val!13518 Int)) )
))
(declare-datatypes ((ValueCell!12752 0))(
  ( (ValueCellFull!12752 (v!16139 V!41025)) (EmptyCell!12752) )
))
(declare-datatypes ((array!70763 0))(
  ( (array!70764 (arr!34055 (Array (_ BitVec 32) ValueCell!12752)) (size!34591 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70763)

(declare-fun mapRest!42139 () (Array (_ BitVec 32) ValueCell!12752))

(declare-fun mapKey!42139 () (_ BitVec 32))

(declare-fun mapValue!42139 () ValueCell!12752)

(assert (=> mapNonEmpty!42139 (= (arr!34055 _values!874) (store mapRest!42139 mapKey!42139 mapValue!42139))))

(declare-fun b!1093773 () Bool)

(declare-fun res!729892 () Bool)

(declare-fun e!624502 () Bool)

(assert (=> b!1093773 (=> (not res!729892) (not e!624502))))

(declare-datatypes ((array!70765 0))(
  ( (array!70766 (arr!34056 (Array (_ BitVec 32) (_ BitVec 64))) (size!34592 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70765)

(declare-datatypes ((List!23792 0))(
  ( (Nil!23789) (Cons!23788 (h!24997 (_ BitVec 64)) (t!33771 List!23792)) )
))
(declare-fun arrayNoDuplicates!0 (array!70765 (_ BitVec 32) List!23792) Bool)

(assert (=> b!1093773 (= res!729892 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23789))))

(declare-fun b!1093774 () Bool)

(declare-fun res!729898 () Bool)

(assert (=> b!1093774 (=> (not res!729898) (not e!624502))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093774 (= res!729898 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34592 _keys!1070))))))

(declare-fun b!1093775 () Bool)

(declare-fun res!729895 () Bool)

(assert (=> b!1093775 (=> (not res!729895) (not e!624502))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093775 (= res!729895 (validKeyInArray!0 k!904))))

(declare-fun b!1093776 () Bool)

(declare-fun res!729897 () Bool)

(declare-fun e!624505 () Bool)

(assert (=> b!1093776 (=> (not res!729897) (not e!624505))))

(declare-fun lt!489237 () array!70765)

(assert (=> b!1093776 (= res!729897 (arrayNoDuplicates!0 lt!489237 #b00000000000000000000000000000000 Nil!23789))))

(declare-fun res!729900 () Bool)

(assert (=> start!96268 (=> (not res!729900) (not e!624502))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96268 (= res!729900 (validMask!0 mask!1414))))

(assert (=> start!96268 e!624502))

(assert (=> start!96268 tp!80611))

(assert (=> start!96268 true))

(declare-fun tp_is_empty!26923 () Bool)

(assert (=> start!96268 tp_is_empty!26923))

(declare-fun array_inv!26244 (array!70765) Bool)

(assert (=> start!96268 (array_inv!26244 _keys!1070)))

(declare-fun e!624501 () Bool)

(declare-fun array_inv!26245 (array!70763) Bool)

(assert (=> start!96268 (and (array_inv!26245 _values!874) e!624501)))

(declare-fun b!1093777 () Bool)

(declare-fun res!729893 () Bool)

(assert (=> b!1093777 (=> (not res!729893) (not e!624502))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093777 (= res!729893 (and (= (size!34591 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34592 _keys!1070) (size!34591 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093778 () Bool)

(assert (=> b!1093778 (= e!624502 e!624505)))

(declare-fun res!729896 () Bool)

(assert (=> b!1093778 (=> (not res!729896) (not e!624505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70765 (_ BitVec 32)) Bool)

(assert (=> b!1093778 (= res!729896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489237 mask!1414))))

(assert (=> b!1093778 (= lt!489237 (array!70766 (store (arr!34056 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34592 _keys!1070)))))

(declare-fun b!1093779 () Bool)

(declare-fun res!729894 () Bool)

(assert (=> b!1093779 (=> (not res!729894) (not e!624502))))

(assert (=> b!1093779 (= res!729894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42139 () Bool)

(assert (=> mapIsEmpty!42139 mapRes!42139))

(declare-fun b!1093780 () Bool)

(declare-fun res!729899 () Bool)

(assert (=> b!1093780 (=> (not res!729899) (not e!624502))))

(assert (=> b!1093780 (= res!729899 (= (select (arr!34056 _keys!1070) i!650) k!904))))

(declare-fun b!1093781 () Bool)

(declare-fun e!624506 () Bool)

(assert (=> b!1093781 (= e!624501 (and e!624506 mapRes!42139))))

(declare-fun condMapEmpty!42139 () Bool)

(declare-fun mapDefault!42139 () ValueCell!12752)

