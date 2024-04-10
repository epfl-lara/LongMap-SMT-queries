; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110474 () Bool)

(assert start!110474)

(declare-fun b!1306876 () Bool)

(declare-fun e!745678 () Bool)

(declare-fun e!745679 () Bool)

(declare-fun mapRes!54187 () Bool)

(assert (=> b!1306876 (= e!745678 (and e!745679 mapRes!54187))))

(declare-fun condMapEmpty!54187 () Bool)

(declare-datatypes ((V!51821 0))(
  ( (V!51822 (val!17594 Int)) )
))
(declare-datatypes ((ValueCell!16621 0))(
  ( (ValueCellFull!16621 (v!20221 V!51821)) (EmptyCell!16621) )
))
(declare-datatypes ((array!87088 0))(
  ( (array!87089 (arr!42024 (Array (_ BitVec 32) ValueCell!16621)) (size!42574 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87088)

(declare-fun mapDefault!54187 () ValueCell!16621)

