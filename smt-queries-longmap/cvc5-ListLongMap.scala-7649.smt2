; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96214 () Bool)

(assert start!96214)

(declare-fun b_free!22867 () Bool)

(declare-fun b_next!22867 () Bool)

(assert (=> start!96214 (= b_free!22867 (not b_next!22867))))

(declare-fun tp!80449 () Bool)

(declare-fun b_and!36409 () Bool)

(assert (=> start!96214 (= tp!80449 b_and!36409)))

(declare-fun b!1092747 () Bool)

(declare-fun res!729168 () Bool)

(declare-fun e!624016 () Bool)

(assert (=> b!1092747 (=> (not res!729168) (not e!624016))))

(declare-datatypes ((array!70657 0))(
  ( (array!70658 (arr!34002 (Array (_ BitVec 32) (_ BitVec 64))) (size!34538 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70657)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1092747 (= res!729168 (= (select (arr!34002 _keys!1070) i!650) k!904))))

(declare-fun b!1092748 () Bool)

(declare-fun res!729167 () Bool)

(assert (=> b!1092748 (=> (not res!729167) (not e!624016))))

(assert (=> b!1092748 (= res!729167 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34538 _keys!1070))))))

(declare-fun b!1092749 () Bool)

(declare-fun res!729163 () Bool)

(assert (=> b!1092749 (=> (not res!729163) (not e!624016))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70657 (_ BitVec 32)) Bool)

(assert (=> b!1092749 (= res!729163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42058 () Bool)

(declare-fun mapRes!42058 () Bool)

(declare-fun tp!80450 () Bool)

(declare-fun e!624018 () Bool)

(assert (=> mapNonEmpty!42058 (= mapRes!42058 (and tp!80450 e!624018))))

(declare-datatypes ((V!40953 0))(
  ( (V!40954 (val!13491 Int)) )
))
(declare-datatypes ((ValueCell!12725 0))(
  ( (ValueCellFull!12725 (v!16112 V!40953)) (EmptyCell!12725) )
))
(declare-datatypes ((array!70659 0))(
  ( (array!70660 (arr!34003 (Array (_ BitVec 32) ValueCell!12725)) (size!34539 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70659)

(declare-fun mapRest!42058 () (Array (_ BitVec 32) ValueCell!12725))

(declare-fun mapValue!42058 () ValueCell!12725)

(declare-fun mapKey!42058 () (_ BitVec 32))

(assert (=> mapNonEmpty!42058 (= (arr!34003 _values!874) (store mapRest!42058 mapKey!42058 mapValue!42058))))

(declare-fun b!1092751 () Bool)

(declare-fun res!729165 () Bool)

(assert (=> b!1092751 (=> (not res!729165) (not e!624016))))

(declare-datatypes ((List!23754 0))(
  ( (Nil!23751) (Cons!23750 (h!24959 (_ BitVec 64)) (t!33679 List!23754)) )
))
(declare-fun arrayNoDuplicates!0 (array!70657 (_ BitVec 32) List!23754) Bool)

(assert (=> b!1092751 (= res!729165 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23751))))

(declare-fun b!1092752 () Bool)

(declare-fun e!624020 () Bool)

(declare-fun e!624015 () Bool)

(assert (=> b!1092752 (= e!624020 (and e!624015 mapRes!42058))))

(declare-fun condMapEmpty!42058 () Bool)

(declare-fun mapDefault!42058 () ValueCell!12725)

