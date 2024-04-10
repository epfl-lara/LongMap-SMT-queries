; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111282 () Bool)

(assert start!111282)

(declare-fun b!1317050 () Bool)

(declare-fun e!751443 () Bool)

(declare-fun e!751444 () Bool)

(declare-fun mapRes!55301 () Bool)

(assert (=> b!1317050 (= e!751443 (and e!751444 mapRes!55301))))

(declare-fun condMapEmpty!55301 () Bool)

(declare-datatypes ((V!52797 0))(
  ( (V!52798 (val!17960 Int)) )
))
(declare-datatypes ((ValueCell!16987 0))(
  ( (ValueCellFull!16987 (v!20589 V!52797)) (EmptyCell!16987) )
))
(declare-datatypes ((array!88504 0))(
  ( (array!88505 (arr!42727 (Array (_ BitVec 32) ValueCell!16987)) (size!43277 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88504)

(declare-fun mapDefault!55301 () ValueCell!16987)

