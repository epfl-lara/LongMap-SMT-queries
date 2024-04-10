; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96450 () Bool)

(assert start!96450)

(declare-fun b_free!23029 () Bool)

(declare-fun b_next!23029 () Bool)

(assert (=> start!96450 (= b_free!23029 (not b_next!23029))))

(declare-fun tp!81013 () Bool)

(declare-fun b_and!36721 () Bool)

(assert (=> start!96450 (= tp!81013 b_and!36721)))

(declare-fun b!1096636 () Bool)

(declare-fun e!625957 () Bool)

(declare-fun tp_is_empty!27079 () Bool)

(assert (=> b!1096636 (= e!625957 tp_is_empty!27079)))

(declare-fun b!1096637 () Bool)

(declare-fun res!731909 () Bool)

(declare-fun e!625952 () Bool)

(assert (=> b!1096637 (=> (not res!731909) (not e!625952))))

(declare-datatypes ((array!71071 0))(
  ( (array!71072 (arr!34207 (Array (_ BitVec 32) (_ BitVec 64))) (size!34743 (_ BitVec 32))) )
))
(declare-fun lt!490210 () array!71071)

(declare-datatypes ((List!23889 0))(
  ( (Nil!23886) (Cons!23885 (h!25094 (_ BitVec 64)) (t!33964 List!23889)) )
))
(declare-fun arrayNoDuplicates!0 (array!71071 (_ BitVec 32) List!23889) Bool)

(assert (=> b!1096637 (= res!731909 (arrayNoDuplicates!0 lt!490210 #b00000000000000000000000000000000 Nil!23886))))

(declare-fun mapIsEmpty!42379 () Bool)

(declare-fun mapRes!42379 () Bool)

(assert (=> mapIsEmpty!42379 mapRes!42379))

(declare-fun b!1096638 () Bool)

(declare-fun e!625956 () Bool)

(assert (=> b!1096638 (= e!625956 e!625952)))

(declare-fun res!731911 () Bool)

(assert (=> b!1096638 (=> (not res!731911) (not e!625952))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71071 (_ BitVec 32)) Bool)

(assert (=> b!1096638 (= res!731911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490210 mask!1414))))

(declare-fun _keys!1070 () array!71071)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096638 (= lt!490210 (array!71072 (store (arr!34207 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34743 _keys!1070)))))

(declare-fun mapNonEmpty!42379 () Bool)

(declare-fun tp!81014 () Bool)

(assert (=> mapNonEmpty!42379 (= mapRes!42379 (and tp!81014 e!625957))))

(declare-fun mapKey!42379 () (_ BitVec 32))

(declare-datatypes ((V!41233 0))(
  ( (V!41234 (val!13596 Int)) )
))
(declare-datatypes ((ValueCell!12830 0))(
  ( (ValueCellFull!12830 (v!16217 V!41233)) (EmptyCell!12830) )
))
(declare-datatypes ((array!71073 0))(
  ( (array!71074 (arr!34208 (Array (_ BitVec 32) ValueCell!12830)) (size!34744 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71073)

(declare-fun mapRest!42379 () (Array (_ BitVec 32) ValueCell!12830))

(declare-fun mapValue!42379 () ValueCell!12830)

(assert (=> mapNonEmpty!42379 (= (arr!34208 _values!874) (store mapRest!42379 mapKey!42379 mapValue!42379))))

(declare-fun b!1096640 () Bool)

(declare-fun res!731915 () Bool)

(assert (=> b!1096640 (=> (not res!731915) (not e!625956))))

(assert (=> b!1096640 (= res!731915 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34743 _keys!1070))))))

(declare-fun b!1096641 () Bool)

(declare-fun res!731913 () Bool)

(assert (=> b!1096641 (=> (not res!731913) (not e!625956))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1096641 (= res!731913 (and (= (size!34744 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34743 _keys!1070) (size!34744 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096642 () Bool)

(declare-fun e!625955 () Bool)

(declare-fun e!625953 () Bool)

(assert (=> b!1096642 (= e!625955 (and e!625953 mapRes!42379))))

(declare-fun condMapEmpty!42379 () Bool)

(declare-fun mapDefault!42379 () ValueCell!12830)

