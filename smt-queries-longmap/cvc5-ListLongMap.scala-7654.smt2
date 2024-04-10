; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96244 () Bool)

(assert start!96244)

(declare-fun b_free!22897 () Bool)

(declare-fun b_next!22897 () Bool)

(assert (=> start!96244 (= b_free!22897 (not b_next!22897))))

(declare-fun tp!80539 () Bool)

(declare-fun b_and!36469 () Bool)

(assert (=> start!96244 (= tp!80539 b_and!36469)))

(declare-fun b!1093317 () Bool)

(declare-fun res!729574 () Bool)

(declare-fun e!624290 () Bool)

(assert (=> b!1093317 (=> (not res!729574) (not e!624290))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093317 (= res!729574 (validKeyInArray!0 k!904))))

(declare-fun b!1093318 () Bool)

(declare-fun res!729572 () Bool)

(assert (=> b!1093318 (=> (not res!729572) (not e!624290))))

(declare-datatypes ((array!70715 0))(
  ( (array!70716 (arr!34031 (Array (_ BitVec 32) (_ BitVec 64))) (size!34567 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70715)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093318 (= res!729572 (= (select (arr!34031 _keys!1070) i!650) k!904))))

(declare-fun b!1093319 () Bool)

(declare-fun e!624288 () Bool)

(declare-fun tp_is_empty!26899 () Bool)

(assert (=> b!1093319 (= e!624288 tp_is_empty!26899)))

(declare-fun b!1093320 () Bool)

(declare-fun res!729568 () Bool)

(assert (=> b!1093320 (=> (not res!729568) (not e!624290))))

(assert (=> b!1093320 (= res!729568 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34567 _keys!1070))))))

(declare-fun b!1093321 () Bool)

(declare-fun e!624285 () Bool)

(assert (=> b!1093321 (= e!624285 tp_is_empty!26899)))

(declare-fun mapNonEmpty!42103 () Bool)

(declare-fun mapRes!42103 () Bool)

(declare-fun tp!80540 () Bool)

(assert (=> mapNonEmpty!42103 (= mapRes!42103 (and tp!80540 e!624285))))

(declare-datatypes ((V!40993 0))(
  ( (V!40994 (val!13506 Int)) )
))
(declare-datatypes ((ValueCell!12740 0))(
  ( (ValueCellFull!12740 (v!16127 V!40993)) (EmptyCell!12740) )
))
(declare-datatypes ((array!70717 0))(
  ( (array!70718 (arr!34032 (Array (_ BitVec 32) ValueCell!12740)) (size!34568 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70717)

(declare-fun mapKey!42103 () (_ BitVec 32))

(declare-fun mapRest!42103 () (Array (_ BitVec 32) ValueCell!12740))

(declare-fun mapValue!42103 () ValueCell!12740)

(assert (=> mapNonEmpty!42103 (= (arr!34032 _values!874) (store mapRest!42103 mapKey!42103 mapValue!42103))))

(declare-fun res!729569 () Bool)

(assert (=> start!96244 (=> (not res!729569) (not e!624290))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96244 (= res!729569 (validMask!0 mask!1414))))

(assert (=> start!96244 e!624290))

(assert (=> start!96244 tp!80539))

(assert (=> start!96244 true))

(assert (=> start!96244 tp_is_empty!26899))

(declare-fun array_inv!26226 (array!70715) Bool)

(assert (=> start!96244 (array_inv!26226 _keys!1070)))

(declare-fun e!624289 () Bool)

(declare-fun array_inv!26227 (array!70717) Bool)

(assert (=> start!96244 (and (array_inv!26227 _values!874) e!624289)))

(declare-fun b!1093322 () Bool)

(declare-fun res!729575 () Bool)

(assert (=> b!1093322 (=> (not res!729575) (not e!624290))))

(declare-datatypes ((List!23776 0))(
  ( (Nil!23773) (Cons!23772 (h!24981 (_ BitVec 64)) (t!33731 List!23776)) )
))
(declare-fun arrayNoDuplicates!0 (array!70715 (_ BitVec 32) List!23776) Bool)

(assert (=> b!1093322 (= res!729575 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23773))))

(declare-fun mapIsEmpty!42103 () Bool)

(assert (=> mapIsEmpty!42103 mapRes!42103))

(declare-fun b!1093323 () Bool)

(assert (=> b!1093323 (= e!624289 (and e!624288 mapRes!42103))))

(declare-fun condMapEmpty!42103 () Bool)

(declare-fun mapDefault!42103 () ValueCell!12740)

