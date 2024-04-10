; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96334 () Bool)

(assert start!96334)

(declare-fun b!1094847 () Bool)

(declare-fun e!625069 () Bool)

(declare-datatypes ((array!70891 0))(
  ( (array!70892 (arr!34119 (Array (_ BitVec 32) (_ BitVec 64))) (size!34655 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70891)

(assert (=> b!1094847 (= e!625069 (bvsge (size!34655 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun b!1094848 () Bool)

(declare-fun res!730640 () Bool)

(declare-fun e!625070 () Bool)

(assert (=> b!1094848 (=> (not res!730640) (not e!625070))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41113 0))(
  ( (V!41114 (val!13551 Int)) )
))
(declare-datatypes ((ValueCell!12785 0))(
  ( (ValueCellFull!12785 (v!16172 V!41113)) (EmptyCell!12785) )
))
(declare-datatypes ((array!70893 0))(
  ( (array!70894 (arr!34120 (Array (_ BitVec 32) ValueCell!12785)) (size!34656 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70893)

(assert (=> b!1094848 (= res!730640 (and (= (size!34656 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34655 _keys!1070) (size!34656 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094849 () Bool)

(declare-fun res!730647 () Bool)

(assert (=> b!1094849 (=> (not res!730647) (not e!625070))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094849 (= res!730647 (= (select (arr!34119 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!42238 () Bool)

(declare-fun mapRes!42238 () Bool)

(assert (=> mapIsEmpty!42238 mapRes!42238))

(declare-fun b!1094850 () Bool)

(declare-fun res!730642 () Bool)

(assert (=> b!1094850 (=> (not res!730642) (not e!625070))))

(assert (=> b!1094850 (= res!730642 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34655 _keys!1070))))))

(declare-fun b!1094851 () Bool)

(declare-fun res!730639 () Bool)

(assert (=> b!1094851 (=> (not res!730639) (not e!625070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70891 (_ BitVec 32)) Bool)

(assert (=> b!1094851 (= res!730639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094852 () Bool)

(declare-fun e!625071 () Bool)

(declare-fun tp_is_empty!26989 () Bool)

(assert (=> b!1094852 (= e!625071 tp_is_empty!26989)))

(declare-fun mapNonEmpty!42238 () Bool)

(declare-fun tp!80753 () Bool)

(declare-fun e!625073 () Bool)

(assert (=> mapNonEmpty!42238 (= mapRes!42238 (and tp!80753 e!625073))))

(declare-fun mapValue!42238 () ValueCell!12785)

(declare-fun mapKey!42238 () (_ BitVec 32))

(declare-fun mapRest!42238 () (Array (_ BitVec 32) ValueCell!12785))

(assert (=> mapNonEmpty!42238 (= (arr!34120 _values!874) (store mapRest!42238 mapKey!42238 mapValue!42238))))

(declare-fun b!1094853 () Bool)

(declare-fun res!730641 () Bool)

(assert (=> b!1094853 (=> (not res!730641) (not e!625070))))

(declare-datatypes ((List!23830 0))(
  ( (Nil!23827) (Cons!23826 (h!25035 (_ BitVec 64)) (t!33837 List!23830)) )
))
(declare-fun arrayNoDuplicates!0 (array!70891 (_ BitVec 32) List!23830) Bool)

(assert (=> b!1094853 (= res!730641 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23827))))

(declare-fun b!1094854 () Bool)

(assert (=> b!1094854 (= e!625070 e!625069)))

(declare-fun res!730646 () Bool)

(assert (=> b!1094854 (=> (not res!730646) (not e!625069))))

(declare-fun lt!489712 () array!70891)

(assert (=> b!1094854 (= res!730646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489712 mask!1414))))

(assert (=> b!1094854 (= lt!489712 (array!70892 (store (arr!34119 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34655 _keys!1070)))))

(declare-fun b!1094856 () Bool)

(declare-fun res!730643 () Bool)

(assert (=> b!1094856 (=> (not res!730643) (not e!625069))))

(assert (=> b!1094856 (= res!730643 (arrayNoDuplicates!0 lt!489712 #b00000000000000000000000000000000 Nil!23827))))

(declare-fun b!1094857 () Bool)

(assert (=> b!1094857 (= e!625073 tp_is_empty!26989)))

(declare-fun b!1094858 () Bool)

(declare-fun res!730645 () Bool)

(assert (=> b!1094858 (=> (not res!730645) (not e!625070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094858 (= res!730645 (validKeyInArray!0 k!904))))

(declare-fun res!730644 () Bool)

(assert (=> start!96334 (=> (not res!730644) (not e!625070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96334 (= res!730644 (validMask!0 mask!1414))))

(assert (=> start!96334 e!625070))

(assert (=> start!96334 true))

(declare-fun array_inv!26292 (array!70891) Bool)

(assert (=> start!96334 (array_inv!26292 _keys!1070)))

(declare-fun e!625072 () Bool)

(declare-fun array_inv!26293 (array!70893) Bool)

(assert (=> start!96334 (and (array_inv!26293 _values!874) e!625072)))

(declare-fun b!1094855 () Bool)

(assert (=> b!1094855 (= e!625072 (and e!625071 mapRes!42238))))

(declare-fun condMapEmpty!42238 () Bool)

(declare-fun mapDefault!42238 () ValueCell!12785)

