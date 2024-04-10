; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83950 () Bool)

(assert start!83950)

(declare-fun b!981061 () Bool)

(declare-fun e!553037 () Bool)

(declare-fun e!553034 () Bool)

(declare-fun mapRes!36158 () Bool)

(assert (=> b!981061 (= e!553037 (and e!553034 mapRes!36158))))

(declare-fun condMapEmpty!36158 () Bool)

(declare-datatypes ((V!35321 0))(
  ( (V!35322 (val!11427 Int)) )
))
(declare-datatypes ((ValueCell!10895 0))(
  ( (ValueCellFull!10895 (v!13989 V!35321)) (EmptyCell!10895) )
))
(declare-datatypes ((array!61505 0))(
  ( (array!61506 (arr!29610 (Array (_ BitVec 32) ValueCell!10895)) (size!30089 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61505)

(declare-fun mapDefault!36158 () ValueCell!10895)

