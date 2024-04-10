; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110360 () Bool)

(assert start!110360)

(declare-fun b!1306116 () Bool)

(declare-fun e!745058 () Bool)

(declare-fun e!745061 () Bool)

(declare-fun mapRes!54067 () Bool)

(assert (=> b!1306116 (= e!745058 (and e!745061 mapRes!54067))))

(declare-fun condMapEmpty!54067 () Bool)

(declare-datatypes ((V!51729 0))(
  ( (V!51730 (val!17559 Int)) )
))
(declare-datatypes ((ValueCell!16586 0))(
  ( (ValueCellFull!16586 (v!20185 V!51729)) (EmptyCell!16586) )
))
(declare-datatypes ((array!86954 0))(
  ( (array!86955 (arr!41962 (Array (_ BitVec 32) ValueCell!16586)) (size!42512 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86954)

(declare-fun mapDefault!54067 () ValueCell!16586)

