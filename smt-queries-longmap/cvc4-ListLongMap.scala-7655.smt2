; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96254 () Bool)

(assert start!96254)

(declare-fun b_free!22907 () Bool)

(declare-fun b_next!22907 () Bool)

(assert (=> start!96254 (= b_free!22907 (not b_next!22907))))

(declare-fun tp!80570 () Bool)

(declare-fun b_and!36489 () Bool)

(assert (=> start!96254 (= tp!80570 b_and!36489)))

(declare-fun b!1093507 () Bool)

(declare-fun e!624376 () Bool)

(declare-fun tp_is_empty!26909 () Bool)

(assert (=> b!1093507 (= e!624376 tp_is_empty!26909)))

(declare-fun b!1093508 () Bool)

(declare-fun res!729707 () Bool)

(declare-fun e!624378 () Bool)

(assert (=> b!1093508 (=> (not res!729707) (not e!624378))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093508 (= res!729707 (validKeyInArray!0 k!904))))

(declare-fun b!1093509 () Bool)

(declare-fun res!729711 () Bool)

(assert (=> b!1093509 (=> (not res!729711) (not e!624378))))

(declare-datatypes ((array!70735 0))(
  ( (array!70736 (arr!34041 (Array (_ BitVec 32) (_ BitVec 64))) (size!34577 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70735)

(declare-datatypes ((List!23783 0))(
  ( (Nil!23780) (Cons!23779 (h!24988 (_ BitVec 64)) (t!33748 List!23783)) )
))
(declare-fun arrayNoDuplicates!0 (array!70735 (_ BitVec 32) List!23783) Bool)

(assert (=> b!1093509 (= res!729711 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23780))))

(declare-fun b!1093510 () Bool)

(declare-fun res!729708 () Bool)

(assert (=> b!1093510 (=> (not res!729708) (not e!624378))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093510 (= res!729708 (= (select (arr!34041 _keys!1070) i!650) k!904))))

(declare-fun b!1093511 () Bool)

(declare-fun e!624380 () Bool)

(declare-fun mapRes!42118 () Bool)

(assert (=> b!1093511 (= e!624380 (and e!624376 mapRes!42118))))

(declare-fun condMapEmpty!42118 () Bool)

(declare-datatypes ((V!41005 0))(
  ( (V!41006 (val!13511 Int)) )
))
(declare-datatypes ((ValueCell!12745 0))(
  ( (ValueCellFull!12745 (v!16132 V!41005)) (EmptyCell!12745) )
))
(declare-datatypes ((array!70737 0))(
  ( (array!70738 (arr!34042 (Array (_ BitVec 32) ValueCell!12745)) (size!34578 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70737)

(declare-fun mapDefault!42118 () ValueCell!12745)

