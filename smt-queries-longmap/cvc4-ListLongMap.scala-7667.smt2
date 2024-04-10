; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96326 () Bool)

(assert start!96326)

(declare-fun b!1094713 () Bool)

(declare-fun res!730543 () Bool)

(declare-fun e!624998 () Bool)

(assert (=> b!1094713 (=> (not res!730543) (not e!624998))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094713 (= res!730543 (validKeyInArray!0 k!904))))

(declare-fun b!1094714 () Bool)

(declare-fun res!730546 () Bool)

(assert (=> b!1094714 (=> (not res!730546) (not e!624998))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70875 0))(
  ( (array!70876 (arr!34111 (Array (_ BitVec 32) (_ BitVec 64))) (size!34647 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70875)

(declare-datatypes ((V!41101 0))(
  ( (V!41102 (val!13547 Int)) )
))
(declare-datatypes ((ValueCell!12781 0))(
  ( (ValueCellFull!12781 (v!16168 V!41101)) (EmptyCell!12781) )
))
(declare-datatypes ((array!70877 0))(
  ( (array!70878 (arr!34112 (Array (_ BitVec 32) ValueCell!12781)) (size!34648 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70877)

(assert (=> b!1094714 (= res!730546 (and (= (size!34648 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34647 _keys!1070) (size!34648 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094715 () Bool)

(declare-fun e!624996 () Bool)

(assert (=> b!1094715 (= e!624996 false)))

(declare-fun lt!489690 () Bool)

(declare-fun lt!489691 () array!70875)

(declare-datatypes ((List!23826 0))(
  ( (Nil!23823) (Cons!23822 (h!25031 (_ BitVec 64)) (t!33833 List!23826)) )
))
(declare-fun arrayNoDuplicates!0 (array!70875 (_ BitVec 32) List!23826) Bool)

(assert (=> b!1094715 (= lt!489690 (arrayNoDuplicates!0 lt!489691 #b00000000000000000000000000000000 Nil!23823))))

(declare-fun b!1094716 () Bool)

(declare-fun res!730548 () Bool)

(assert (=> b!1094716 (=> (not res!730548) (not e!624998))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094716 (= res!730548 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34647 _keys!1070))))))

(declare-fun b!1094717 () Bool)

(declare-fun res!730542 () Bool)

(assert (=> b!1094717 (=> (not res!730542) (not e!624998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70875 (_ BitVec 32)) Bool)

(assert (=> b!1094717 (= res!730542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42226 () Bool)

(declare-fun mapRes!42226 () Bool)

(declare-fun tp!80741 () Bool)

(declare-fun e!624999 () Bool)

(assert (=> mapNonEmpty!42226 (= mapRes!42226 (and tp!80741 e!624999))))

(declare-fun mapKey!42226 () (_ BitVec 32))

(declare-fun mapValue!42226 () ValueCell!12781)

(declare-fun mapRest!42226 () (Array (_ BitVec 32) ValueCell!12781))

(assert (=> mapNonEmpty!42226 (= (arr!34112 _values!874) (store mapRest!42226 mapKey!42226 mapValue!42226))))

(declare-fun b!1094718 () Bool)

(declare-fun res!730544 () Bool)

(assert (=> b!1094718 (=> (not res!730544) (not e!624998))))

(assert (=> b!1094718 (= res!730544 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23823))))

(declare-fun b!1094719 () Bool)

(declare-fun e!625001 () Bool)

(declare-fun e!625000 () Bool)

(assert (=> b!1094719 (= e!625001 (and e!625000 mapRes!42226))))

(declare-fun condMapEmpty!42226 () Bool)

(declare-fun mapDefault!42226 () ValueCell!12781)

