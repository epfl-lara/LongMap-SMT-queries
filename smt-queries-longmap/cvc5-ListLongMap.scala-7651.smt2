; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96226 () Bool)

(assert start!96226)

(declare-fun b_free!22879 () Bool)

(declare-fun b_next!22879 () Bool)

(assert (=> start!96226 (= b_free!22879 (not b_next!22879))))

(declare-fun tp!80486 () Bool)

(declare-fun b_and!36433 () Bool)

(assert (=> start!96226 (= tp!80486 b_and!36433)))

(declare-fun b!1092975 () Bool)

(declare-fun res!729327 () Bool)

(declare-fun e!624125 () Bool)

(assert (=> b!1092975 (=> (not res!729327) (not e!624125))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70681 0))(
  ( (array!70682 (arr!34014 (Array (_ BitVec 32) (_ BitVec 64))) (size!34550 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70681)

(assert (=> b!1092975 (= res!729327 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34550 _keys!1070))))))

(declare-fun mapIsEmpty!42076 () Bool)

(declare-fun mapRes!42076 () Bool)

(assert (=> mapIsEmpty!42076 mapRes!42076))

(declare-fun b!1092976 () Bool)

(declare-fun res!729326 () Bool)

(declare-fun e!624123 () Bool)

(assert (=> b!1092976 (=> (not res!729326) (not e!624123))))

(declare-fun lt!488665 () array!70681)

(declare-datatypes ((List!23763 0))(
  ( (Nil!23760) (Cons!23759 (h!24968 (_ BitVec 64)) (t!33700 List!23763)) )
))
(declare-fun arrayNoDuplicates!0 (array!70681 (_ BitVec 32) List!23763) Bool)

(assert (=> b!1092976 (= res!729326 (arrayNoDuplicates!0 lt!488665 #b00000000000000000000000000000000 Nil!23760))))

(declare-fun b!1092977 () Bool)

(declare-fun res!729333 () Bool)

(assert (=> b!1092977 (=> (not res!729333) (not e!624125))))

(assert (=> b!1092977 (= res!729333 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23760))))

(declare-fun b!1092979 () Bool)

(declare-fun res!729332 () Bool)

(assert (=> b!1092979 (=> (not res!729332) (not e!624125))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092979 (= res!729332 (validKeyInArray!0 k!904))))

(declare-fun b!1092980 () Bool)

(declare-fun res!729325 () Bool)

(assert (=> b!1092980 (=> (not res!729325) (not e!624125))))

(assert (=> b!1092980 (= res!729325 (= (select (arr!34014 _keys!1070) i!650) k!904))))

(declare-fun b!1092981 () Bool)

(declare-fun e!624128 () Bool)

(declare-fun e!624127 () Bool)

(assert (=> b!1092981 (= e!624128 (and e!624127 mapRes!42076))))

(declare-fun condMapEmpty!42076 () Bool)

(declare-datatypes ((V!40969 0))(
  ( (V!40970 (val!13497 Int)) )
))
(declare-datatypes ((ValueCell!12731 0))(
  ( (ValueCellFull!12731 (v!16118 V!40969)) (EmptyCell!12731) )
))
(declare-datatypes ((array!70683 0))(
  ( (array!70684 (arr!34015 (Array (_ BitVec 32) ValueCell!12731)) (size!34551 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70683)

(declare-fun mapDefault!42076 () ValueCell!12731)

