; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110444 () Bool)

(assert start!110444)

(declare-fun b!1306606 () Bool)

(declare-fun e!745455 () Bool)

(declare-fun e!745453 () Bool)

(declare-fun mapRes!54142 () Bool)

(assert (=> b!1306606 (= e!745455 (and e!745453 mapRes!54142))))

(declare-fun condMapEmpty!54142 () Bool)

(declare-datatypes ((V!51781 0))(
  ( (V!51782 (val!17579 Int)) )
))
(declare-datatypes ((ValueCell!16606 0))(
  ( (ValueCellFull!16606 (v!20206 V!51781)) (EmptyCell!16606) )
))
(declare-datatypes ((array!87034 0))(
  ( (array!87035 (arr!41997 (Array (_ BitVec 32) ValueCell!16606)) (size!42547 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87034)

(declare-fun mapDefault!54142 () ValueCell!16606)

