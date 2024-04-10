; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96448 () Bool)

(assert start!96448)

(declare-fun b_free!23027 () Bool)

(declare-fun b_next!23027 () Bool)

(assert (=> start!96448 (= b_free!23027 (not b_next!23027))))

(declare-fun tp!81007 () Bool)

(declare-fun b_and!36717 () Bool)

(assert (=> start!96448 (= tp!81007 b_and!36717)))

(declare-fun b!1096598 () Bool)

(declare-fun res!731887 () Bool)

(declare-fun e!625939 () Bool)

(assert (=> b!1096598 (=> (not res!731887) (not e!625939))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71067 0))(
  ( (array!71068 (arr!34205 (Array (_ BitVec 32) (_ BitVec 64))) (size!34741 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71067)

(declare-datatypes ((V!41229 0))(
  ( (V!41230 (val!13595 Int)) )
))
(declare-datatypes ((ValueCell!12829 0))(
  ( (ValueCellFull!12829 (v!16216 V!41229)) (EmptyCell!12829) )
))
(declare-datatypes ((array!71069 0))(
  ( (array!71070 (arr!34206 (Array (_ BitVec 32) ValueCell!12829)) (size!34742 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71069)

(assert (=> b!1096598 (= res!731887 (and (= (size!34742 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34741 _keys!1070) (size!34742 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!731889 () Bool)

(assert (=> start!96448 (=> (not res!731889) (not e!625939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96448 (= res!731889 (validMask!0 mask!1414))))

(assert (=> start!96448 e!625939))

(assert (=> start!96448 tp!81007))

(assert (=> start!96448 true))

(declare-fun tp_is_empty!27077 () Bool)

(assert (=> start!96448 tp_is_empty!27077))

(declare-fun array_inv!26354 (array!71067) Bool)

(assert (=> start!96448 (array_inv!26354 _keys!1070)))

(declare-fun e!625936 () Bool)

(declare-fun array_inv!26355 (array!71069) Bool)

(assert (=> start!96448 (and (array_inv!26355 _values!874) e!625936)))

(declare-fun mapIsEmpty!42376 () Bool)

(declare-fun mapRes!42376 () Bool)

(assert (=> mapIsEmpty!42376 mapRes!42376))

(declare-fun b!1096599 () Bool)

(declare-fun res!731882 () Bool)

(declare-fun e!625934 () Bool)

(assert (=> b!1096599 (=> (not res!731882) (not e!625934))))

(declare-fun lt!490198 () array!71067)

(declare-datatypes ((List!23888 0))(
  ( (Nil!23885) (Cons!23884 (h!25093 (_ BitVec 64)) (t!33961 List!23888)) )
))
(declare-fun arrayNoDuplicates!0 (array!71067 (_ BitVec 32) List!23888) Bool)

(assert (=> b!1096599 (= res!731882 (arrayNoDuplicates!0 lt!490198 #b00000000000000000000000000000000 Nil!23885))))

(declare-fun b!1096600 () Bool)

(declare-fun res!731886 () Bool)

(assert (=> b!1096600 (=> (not res!731886) (not e!625939))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096600 (= res!731886 (validKeyInArray!0 k!904))))

(declare-fun b!1096601 () Bool)

(declare-fun e!625938 () Bool)

(assert (=> b!1096601 (= e!625938 tp_is_empty!27077)))

(declare-fun b!1096602 () Bool)

(assert (=> b!1096602 (= e!625939 e!625934)))

(declare-fun res!731890 () Bool)

(assert (=> b!1096602 (=> (not res!731890) (not e!625934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71067 (_ BitVec 32)) Bool)

(assert (=> b!1096602 (= res!731890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490198 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096602 (= lt!490198 (array!71068 (store (arr!34205 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34741 _keys!1070)))))

(declare-fun b!1096603 () Bool)

(declare-fun res!731888 () Bool)

(assert (=> b!1096603 (=> (not res!731888) (not e!625939))))

(assert (=> b!1096603 (= res!731888 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34741 _keys!1070))))))

(declare-fun b!1096604 () Bool)

(declare-fun e!625937 () Bool)

(assert (=> b!1096604 (= e!625936 (and e!625937 mapRes!42376))))

(declare-fun condMapEmpty!42376 () Bool)

(declare-fun mapDefault!42376 () ValueCell!12829)

