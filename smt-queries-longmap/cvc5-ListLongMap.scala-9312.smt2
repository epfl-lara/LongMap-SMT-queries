; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111308 () Bool)

(assert start!111308)

(declare-fun b!1317213 () Bool)

(declare-fun e!751579 () Bool)

(declare-fun e!751577 () Bool)

(declare-fun mapRes!55325 () Bool)

(assert (=> b!1317213 (= e!751579 (and e!751577 mapRes!55325))))

(declare-fun condMapEmpty!55325 () Bool)

(declare-datatypes ((V!52817 0))(
  ( (V!52818 (val!17967 Int)) )
))
(declare-datatypes ((ValueCell!16994 0))(
  ( (ValueCellFull!16994 (v!20597 V!52817)) (EmptyCell!16994) )
))
(declare-datatypes ((array!88530 0))(
  ( (array!88531 (arr!42739 (Array (_ BitVec 32) ValueCell!16994)) (size!43289 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88530)

(declare-fun mapDefault!55325 () ValueCell!16994)

