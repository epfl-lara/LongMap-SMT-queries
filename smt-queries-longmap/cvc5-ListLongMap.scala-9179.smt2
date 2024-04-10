; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110400 () Bool)

(assert start!110400)

(declare-fun b!1306314 () Bool)

(declare-fun e!745231 () Bool)

(declare-fun e!745229 () Bool)

(declare-fun mapRes!54103 () Bool)

(assert (=> b!1306314 (= e!745231 (and e!745229 mapRes!54103))))

(declare-fun condMapEmpty!54103 () Bool)

(declare-datatypes ((V!51753 0))(
  ( (V!51754 (val!17568 Int)) )
))
(declare-datatypes ((ValueCell!16595 0))(
  ( (ValueCellFull!16595 (v!20194 V!51753)) (EmptyCell!16595) )
))
(declare-datatypes ((array!86990 0))(
  ( (array!86991 (arr!41977 (Array (_ BitVec 32) ValueCell!16595)) (size!42527 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86990)

(declare-fun mapDefault!54103 () ValueCell!16595)

