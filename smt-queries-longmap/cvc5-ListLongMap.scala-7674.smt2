; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96390 () Bool)

(assert start!96390)

(declare-fun b_free!22969 () Bool)

(declare-fun b_next!22969 () Bool)

(assert (=> start!96390 (= b_free!22969 (not b_next!22969))))

(declare-fun tp!80833 () Bool)

(declare-fun b_and!36601 () Bool)

(assert (=> start!96390 (= tp!80833 b_and!36601)))

(declare-fun mapNonEmpty!42289 () Bool)

(declare-fun mapRes!42289 () Bool)

(declare-fun tp!80834 () Bool)

(declare-fun e!625416 () Bool)

(assert (=> mapNonEmpty!42289 (= mapRes!42289 (and tp!80834 e!625416))))

(declare-fun mapKey!42289 () (_ BitVec 32))

(declare-datatypes ((V!41153 0))(
  ( (V!41154 (val!13566 Int)) )
))
(declare-datatypes ((ValueCell!12800 0))(
  ( (ValueCellFull!12800 (v!16187 V!41153)) (EmptyCell!12800) )
))
(declare-datatypes ((array!70951 0))(
  ( (array!70952 (arr!34147 (Array (_ BitVec 32) ValueCell!12800)) (size!34683 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70951)

(declare-fun mapRest!42289 () (Array (_ BitVec 32) ValueCell!12800))

(declare-fun mapValue!42289 () ValueCell!12800)

(assert (=> mapNonEmpty!42289 (= (arr!34147 _values!874) (store mapRest!42289 mapKey!42289 mapValue!42289))))

(declare-fun b!1095496 () Bool)

(declare-fun res!731103 () Bool)

(declare-fun e!625412 () Bool)

(assert (=> b!1095496 (=> (not res!731103) (not e!625412))))

(declare-datatypes ((array!70953 0))(
  ( (array!70954 (arr!34148 (Array (_ BitVec 32) (_ BitVec 64))) (size!34684 (_ BitVec 32))) )
))
(declare-fun lt!489851 () array!70953)

(declare-datatypes ((List!23845 0))(
  ( (Nil!23842) (Cons!23841 (h!25050 (_ BitVec 64)) (t!33860 List!23845)) )
))
(declare-fun arrayNoDuplicates!0 (array!70953 (_ BitVec 32) List!23845) Bool)

(assert (=> b!1095496 (= res!731103 (arrayNoDuplicates!0 lt!489851 #b00000000000000000000000000000000 Nil!23842))))

(declare-fun b!1095497 () Bool)

(declare-fun tp_is_empty!27019 () Bool)

(assert (=> b!1095497 (= e!625416 tp_is_empty!27019)))

(declare-fun b!1095498 () Bool)

(declare-fun res!731099 () Bool)

(declare-fun e!625414 () Bool)

(assert (=> b!1095498 (=> (not res!731099) (not e!625414))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun _keys!1070 () array!70953)

(assert (=> b!1095498 (= res!731099 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34684 _keys!1070))))))

(declare-fun b!1095499 () Bool)

(declare-fun e!625417 () Bool)

(declare-fun e!625413 () Bool)

(assert (=> b!1095499 (= e!625417 (and e!625413 mapRes!42289))))

(declare-fun condMapEmpty!42289 () Bool)

(declare-fun mapDefault!42289 () ValueCell!12800)

