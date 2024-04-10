; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!534 () Bool)

(assert start!534)

(declare-fun b!3141 () Bool)

(declare-fun e!1400 () Bool)

(assert (=> b!3141 (= e!1400 false)))

(declare-fun lt!426 () Bool)

(declare-datatypes ((array!129 0))(
  ( (array!130 (arr!58 (Array (_ BitVec 32) (_ BitVec 64))) (size!120 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!129)

(declare-datatypes ((List!45 0))(
  ( (Nil!42) (Cons!41 (h!607 (_ BitVec 64)) (t!2172 List!45)) )
))
(declare-fun arrayNoDuplicates!0 (array!129 (_ BitVec 32) List!45) Bool)

(assert (=> b!3141 (= lt!426 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!42))))

(declare-fun b!3142 () Bool)

(declare-fun e!1399 () Bool)

(declare-fun e!1403 () Bool)

(declare-fun mapRes!98 () Bool)

(assert (=> b!3142 (= e!1399 (and e!1403 mapRes!98))))

(declare-fun condMapEmpty!98 () Bool)

(declare-datatypes ((V!303 0))(
  ( (V!304 (val!53 Int)) )
))
(declare-datatypes ((ValueCell!31 0))(
  ( (ValueCellFull!31 (v!1140 V!303)) (EmptyCell!31) )
))
(declare-datatypes ((array!131 0))(
  ( (array!132 (arr!59 (Array (_ BitVec 32) ValueCell!31)) (size!121 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!131)

(declare-fun mapDefault!98 () ValueCell!31)

