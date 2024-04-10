; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110468 () Bool)

(assert start!110468)

(declare-fun b!1306822 () Bool)

(declare-fun res!867503 () Bool)

(declare-fun e!745633 () Bool)

(assert (=> b!1306822 (=> (not res!867503) (not e!745633))))

(declare-datatypes ((array!87076 0))(
  ( (array!87077 (arr!42018 (Array (_ BitVec 32) (_ BitVec 64))) (size!42568 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87076)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51813 0))(
  ( (V!51814 (val!17591 Int)) )
))
(declare-datatypes ((ValueCell!16618 0))(
  ( (ValueCellFull!16618 (v!20218 V!51813)) (EmptyCell!16618) )
))
(declare-datatypes ((array!87078 0))(
  ( (array!87079 (arr!42019 (Array (_ BitVec 32) ValueCell!16618)) (size!42569 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87078)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306822 (= res!867503 (and (= (size!42569 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42568 _keys!1628) (size!42569 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306823 () Bool)

(declare-fun e!745636 () Bool)

(declare-fun e!745637 () Bool)

(declare-fun mapRes!54178 () Bool)

(assert (=> b!1306823 (= e!745636 (and e!745637 mapRes!54178))))

(declare-fun condMapEmpty!54178 () Bool)

(declare-fun mapDefault!54178 () ValueCell!16618)

