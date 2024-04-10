; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110364 () Bool)

(assert start!110364)

(declare-fun b!1306140 () Bool)

(declare-fun e!745092 () Bool)

(declare-fun e!745089 () Bool)

(declare-fun mapRes!54073 () Bool)

(assert (=> b!1306140 (= e!745092 (and e!745089 mapRes!54073))))

(declare-fun condMapEmpty!54073 () Bool)

(declare-datatypes ((V!51733 0))(
  ( (V!51734 (val!17561 Int)) )
))
(declare-datatypes ((ValueCell!16588 0))(
  ( (ValueCellFull!16588 (v!20187 V!51733)) (EmptyCell!16588) )
))
(declare-datatypes ((array!86960 0))(
  ( (array!86961 (arr!41965 (Array (_ BitVec 32) ValueCell!16588)) (size!42515 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86960)

(declare-fun mapDefault!54073 () ValueCell!16588)

