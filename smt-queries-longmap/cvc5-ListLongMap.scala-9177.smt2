; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110372 () Bool)

(assert start!110372)

(declare-fun b!1306164 () Bool)

(declare-fun e!745112 () Bool)

(declare-fun tp_is_empty!34975 () Bool)

(assert (=> b!1306164 (= e!745112 tp_is_empty!34975)))

(declare-fun b!1306165 () Bool)

(declare-fun e!745113 () Bool)

(declare-fun e!745109 () Bool)

(declare-fun mapRes!54079 () Bool)

(assert (=> b!1306165 (= e!745113 (and e!745109 mapRes!54079))))

(declare-fun condMapEmpty!54079 () Bool)

(declare-datatypes ((V!51737 0))(
  ( (V!51738 (val!17562 Int)) )
))
(declare-datatypes ((ValueCell!16589 0))(
  ( (ValueCellFull!16589 (v!20188 V!51737)) (EmptyCell!16589) )
))
(declare-datatypes ((array!86964 0))(
  ( (array!86965 (arr!41966 (Array (_ BitVec 32) ValueCell!16589)) (size!42516 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86964)

(declare-fun mapDefault!54079 () ValueCell!16589)

