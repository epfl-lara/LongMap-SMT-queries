; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96232 () Bool)

(assert start!96232)

(declare-fun b_free!22885 () Bool)

(declare-fun b_next!22885 () Bool)

(assert (=> start!96232 (= b_free!22885 (not b_next!22885))))

(declare-fun tp!80504 () Bool)

(declare-fun b_and!36445 () Bool)

(assert (=> start!96232 (= tp!80504 b_and!36445)))

(declare-fun b!1093089 () Bool)

(declare-fun res!729412 () Bool)

(declare-fun e!624182 () Bool)

(assert (=> b!1093089 (=> (not res!729412) (not e!624182))))

(declare-datatypes ((array!70693 0))(
  ( (array!70694 (arr!34020 (Array (_ BitVec 32) (_ BitVec 64))) (size!34556 (_ BitVec 32))) )
))
(declare-fun lt!488740 () array!70693)

(declare-datatypes ((List!23768 0))(
  ( (Nil!23765) (Cons!23764 (h!24973 (_ BitVec 64)) (t!33711 List!23768)) )
))
(declare-fun arrayNoDuplicates!0 (array!70693 (_ BitVec 32) List!23768) Bool)

(assert (=> b!1093089 (= res!729412 (arrayNoDuplicates!0 lt!488740 #b00000000000000000000000000000000 Nil!23765))))

(declare-fun b!1093090 () Bool)

(declare-fun e!624179 () Bool)

(declare-fun e!624177 () Bool)

(declare-fun mapRes!42085 () Bool)

(assert (=> b!1093090 (= e!624179 (and e!624177 mapRes!42085))))

(declare-fun condMapEmpty!42085 () Bool)

(declare-datatypes ((V!40977 0))(
  ( (V!40978 (val!13500 Int)) )
))
(declare-datatypes ((ValueCell!12734 0))(
  ( (ValueCellFull!12734 (v!16121 V!40977)) (EmptyCell!12734) )
))
(declare-datatypes ((array!70695 0))(
  ( (array!70696 (arr!34021 (Array (_ BitVec 32) ValueCell!12734)) (size!34557 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70695)

(declare-fun mapDefault!42085 () ValueCell!12734)

