; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96454 () Bool)

(assert start!96454)

(declare-fun b_free!23033 () Bool)

(declare-fun b_next!23033 () Bool)

(assert (=> start!96454 (= b_free!23033 (not b_next!23033))))

(declare-fun tp!81026 () Bool)

(declare-fun b_and!36729 () Bool)

(assert (=> start!96454 (= tp!81026 b_and!36729)))

(declare-fun b!1096712 () Bool)

(declare-fun res!731966 () Bool)

(declare-fun e!625988 () Bool)

(assert (=> b!1096712 (=> (not res!731966) (not e!625988))))

(declare-datatypes ((array!71079 0))(
  ( (array!71080 (arr!34211 (Array (_ BitVec 32) (_ BitVec 64))) (size!34747 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71079)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096712 (= res!731966 (= (select (arr!34211 _keys!1070) i!650) k!904))))

(declare-fun b!1096713 () Bool)

(declare-fun res!731967 () Bool)

(assert (=> b!1096713 (=> (not res!731967) (not e!625988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096713 (= res!731967 (validKeyInArray!0 k!904))))

(declare-fun b!1096714 () Bool)

(declare-fun res!731969 () Bool)

(assert (=> b!1096714 (=> (not res!731969) (not e!625988))))

(declare-datatypes ((List!23892 0))(
  ( (Nil!23889) (Cons!23888 (h!25097 (_ BitVec 64)) (t!33971 List!23892)) )
))
(declare-fun arrayNoDuplicates!0 (array!71079 (_ BitVec 32) List!23892) Bool)

(assert (=> b!1096714 (= res!731969 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23889))))

(declare-fun b!1096715 () Bool)

(declare-fun e!625991 () Bool)

(declare-fun e!625989 () Bool)

(declare-fun mapRes!42385 () Bool)

(assert (=> b!1096715 (= e!625991 (and e!625989 mapRes!42385))))

(declare-fun condMapEmpty!42385 () Bool)

(declare-datatypes ((V!41237 0))(
  ( (V!41238 (val!13598 Int)) )
))
(declare-datatypes ((ValueCell!12832 0))(
  ( (ValueCellFull!12832 (v!16219 V!41237)) (EmptyCell!12832) )
))
(declare-datatypes ((array!71081 0))(
  ( (array!71082 (arr!34212 (Array (_ BitVec 32) ValueCell!12832)) (size!34748 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71081)

(declare-fun mapDefault!42385 () ValueCell!12832)

