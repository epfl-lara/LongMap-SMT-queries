; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96356 () Bool)

(assert start!96356)

(declare-fun b!1095079 () Bool)

(declare-fun res!730808 () Bool)

(declare-fun e!625192 () Bool)

(assert (=> b!1095079 (=> (not res!730808) (not e!625192))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70913 0))(
  ( (array!70914 (arr!34129 (Array (_ BitVec 32) (_ BitVec 64))) (size!34665 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70913)

(declare-datatypes ((V!41125 0))(
  ( (V!41126 (val!13556 Int)) )
))
(declare-datatypes ((ValueCell!12790 0))(
  ( (ValueCellFull!12790 (v!16177 V!41125)) (EmptyCell!12790) )
))
(declare-datatypes ((array!70915 0))(
  ( (array!70916 (arr!34130 (Array (_ BitVec 32) ValueCell!12790)) (size!34666 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70915)

(assert (=> b!1095079 (= res!730808 (and (= (size!34666 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34665 _keys!1070) (size!34666 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!730806 () Bool)

(assert (=> start!96356 (=> (not res!730806) (not e!625192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96356 (= res!730806 (validMask!0 mask!1414))))

(assert (=> start!96356 e!625192))

(assert (=> start!96356 true))

(declare-fun array_inv!26302 (array!70913) Bool)

(assert (=> start!96356 (array_inv!26302 _keys!1070)))

(declare-fun e!625197 () Bool)

(declare-fun array_inv!26303 (array!70915) Bool)

(assert (=> start!96356 (and (array_inv!26303 _values!874) e!625197)))

(declare-fun b!1095080 () Bool)

(declare-fun e!625194 () Bool)

(assert (=> b!1095080 (= e!625192 e!625194)))

(declare-fun res!730810 () Bool)

(assert (=> b!1095080 (=> (not res!730810) (not e!625194))))

(declare-fun lt!489739 () array!70913)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70913 (_ BitVec 32)) Bool)

(assert (=> b!1095080 (= res!730810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489739 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095080 (= lt!489739 (array!70914 (store (arr!34129 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34665 _keys!1070)))))

(declare-fun b!1095081 () Bool)

(declare-fun res!730804 () Bool)

(assert (=> b!1095081 (=> (not res!730804) (not e!625192))))

(assert (=> b!1095081 (= res!730804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095082 () Bool)

(declare-fun res!730809 () Bool)

(assert (=> b!1095082 (=> (not res!730809) (not e!625192))))

(declare-datatypes ((List!23834 0))(
  ( (Nil!23831) (Cons!23830 (h!25039 (_ BitVec 64)) (t!33841 List!23834)) )
))
(declare-fun arrayNoDuplicates!0 (array!70913 (_ BitVec 32) List!23834) Bool)

(assert (=> b!1095082 (= res!730809 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23831))))

(declare-fun mapIsEmpty!42256 () Bool)

(declare-fun mapRes!42256 () Bool)

(assert (=> mapIsEmpty!42256 mapRes!42256))

(declare-fun mapNonEmpty!42256 () Bool)

(declare-fun tp!80771 () Bool)

(declare-fun e!625193 () Bool)

(assert (=> mapNonEmpty!42256 (= mapRes!42256 (and tp!80771 e!625193))))

(declare-fun mapKey!42256 () (_ BitVec 32))

(declare-fun mapValue!42256 () ValueCell!12790)

(declare-fun mapRest!42256 () (Array (_ BitVec 32) ValueCell!12790))

(assert (=> mapNonEmpty!42256 (= (arr!34130 _values!874) (store mapRest!42256 mapKey!42256 mapValue!42256))))

(declare-fun b!1095083 () Bool)

(declare-fun res!730807 () Bool)

(assert (=> b!1095083 (=> (not res!730807) (not e!625194))))

(assert (=> b!1095083 (= res!730807 (bvslt (size!34665 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun b!1095084 () Bool)

(declare-fun res!730802 () Bool)

(assert (=> b!1095084 (=> (not res!730802) (not e!625194))))

(assert (=> b!1095084 (= res!730802 (arrayNoDuplicates!0 lt!489739 #b00000000000000000000000000000000 Nil!23831))))

(declare-fun b!1095085 () Bool)

(declare-fun e!625196 () Bool)

(declare-fun tp_is_empty!26999 () Bool)

(assert (=> b!1095085 (= e!625196 tp_is_empty!26999)))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun b!1095086 () Bool)

(declare-fun arrayContainsKey!0 (array!70913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095086 (= e!625194 (not (arrayContainsKey!0 _keys!1070 k!904 i!650)))))

(declare-fun b!1095087 () Bool)

(declare-fun res!730803 () Bool)

(assert (=> b!1095087 (=> (not res!730803) (not e!625192))))

(assert (=> b!1095087 (= res!730803 (= (select (arr!34129 _keys!1070) i!650) k!904))))

(declare-fun b!1095088 () Bool)

(assert (=> b!1095088 (= e!625197 (and e!625196 mapRes!42256))))

(declare-fun condMapEmpty!42256 () Bool)

(declare-fun mapDefault!42256 () ValueCell!12790)

