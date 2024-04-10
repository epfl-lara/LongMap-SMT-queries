; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111422 () Bool)

(assert start!111422)

(declare-fun b_free!30079 () Bool)

(declare-fun b_next!30079 () Bool)

(assert (=> start!111422 (= b_free!30079 (not b_next!30079))))

(declare-fun tp!105712 () Bool)

(declare-fun b_and!48317 () Bool)

(assert (=> start!111422 (= tp!105712 b_and!48317)))

(declare-fun b!1318600 () Bool)

(declare-fun e!752433 () Bool)

(declare-fun tp_is_empty!35899 () Bool)

(assert (=> b!1318600 (= e!752433 tp_is_empty!35899)))

(declare-fun b!1318601 () Bool)

(declare-fun res!875131 () Bool)

(declare-fun e!752432 () Bool)

(assert (=> b!1318601 (=> (not res!875131) (not e!752432))))

(declare-datatypes ((array!88742 0))(
  ( (array!88743 (arr!42845 (Array (_ BitVec 32) (_ BitVec 64))) (size!43395 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88742)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1318601 (= res!875131 (validKeyInArray!0 (select (arr!42845 _keys!1609) from!2000)))))

(declare-fun b!1318602 () Bool)

(declare-fun e!752434 () Bool)

(declare-fun e!752430 () Bool)

(declare-fun mapRes!55496 () Bool)

(assert (=> b!1318602 (= e!752434 (and e!752430 mapRes!55496))))

(declare-fun condMapEmpty!55496 () Bool)

(declare-datatypes ((V!52969 0))(
  ( (V!52970 (val!18024 Int)) )
))
(declare-datatypes ((ValueCell!17051 0))(
  ( (ValueCellFull!17051 (v!20654 V!52969)) (EmptyCell!17051) )
))
(declare-datatypes ((array!88744 0))(
  ( (array!88745 (arr!42846 (Array (_ BitVec 32) ValueCell!17051)) (size!43396 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88744)

(declare-fun mapDefault!55496 () ValueCell!17051)

