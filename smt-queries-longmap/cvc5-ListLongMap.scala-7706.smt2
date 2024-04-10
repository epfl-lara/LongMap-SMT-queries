; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96792 () Bool)

(assert start!96792)

(declare-fun b_free!23161 () Bool)

(declare-fun b_next!23161 () Bool)

(assert (=> start!96792 (= b_free!23161 (not b_next!23161))))

(declare-fun tp!81434 () Bool)

(declare-fun b_and!37097 () Bool)

(assert (=> start!96792 (= tp!81434 b_and!37097)))

(declare-fun b!1101008 () Bool)

(declare-fun res!734677 () Bool)

(declare-fun e!628427 () Bool)

(assert (=> b!1101008 (=> (not res!734677) (not e!628427))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71341 0))(
  ( (array!71342 (arr!34334 (Array (_ BitVec 32) (_ BitVec 64))) (size!34870 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71341)

(declare-datatypes ((V!41409 0))(
  ( (V!41410 (val!13662 Int)) )
))
(declare-datatypes ((ValueCell!12896 0))(
  ( (ValueCellFull!12896 (v!16291 V!41409)) (EmptyCell!12896) )
))
(declare-datatypes ((array!71343 0))(
  ( (array!71344 (arr!34335 (Array (_ BitVec 32) ValueCell!12896)) (size!34871 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71343)

(assert (=> b!1101008 (= res!734677 (and (= (size!34871 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34870 _keys!1070) (size!34871 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101009 () Bool)

(declare-fun e!628430 () Bool)

(assert (=> b!1101009 (= e!628427 e!628430)))

(declare-fun res!734680 () Bool)

(assert (=> b!1101009 (=> (not res!734680) (not e!628430))))

(declare-fun lt!493502 () array!71341)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71341 (_ BitVec 32)) Bool)

(assert (=> b!1101009 (= res!734680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493502 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101009 (= lt!493502 (array!71342 (store (arr!34334 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34870 _keys!1070)))))

(declare-fun b!1101010 () Bool)

(declare-fun e!628425 () Bool)

(declare-fun tp_is_empty!27211 () Bool)

(assert (=> b!1101010 (= e!628425 tp_is_empty!27211)))

(declare-fun b!1101011 () Bool)

(declare-fun res!734681 () Bool)

(assert (=> b!1101011 (=> (not res!734681) (not e!628427))))

(declare-datatypes ((List!23987 0))(
  ( (Nil!23984) (Cons!23983 (h!25192 (_ BitVec 64)) (t!34194 List!23987)) )
))
(declare-fun arrayNoDuplicates!0 (array!71341 (_ BitVec 32) List!23987) Bool)

(assert (=> b!1101011 (= res!734681 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23984))))

(declare-fun b!1101012 () Bool)

(declare-fun res!734683 () Bool)

(assert (=> b!1101012 (=> (not res!734683) (not e!628430))))

(assert (=> b!1101012 (= res!734683 (arrayNoDuplicates!0 lt!493502 #b00000000000000000000000000000000 Nil!23984))))

(declare-fun b!1101013 () Bool)

(declare-fun e!628429 () Bool)

(declare-fun e!628426 () Bool)

(declare-fun mapRes!42601 () Bool)

(assert (=> b!1101013 (= e!628429 (and e!628426 mapRes!42601))))

(declare-fun condMapEmpty!42601 () Bool)

(declare-fun mapDefault!42601 () ValueCell!12896)

