; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111444 () Bool)

(assert start!111444)

(declare-fun b_free!30101 () Bool)

(declare-fun b_next!30101 () Bool)

(assert (=> start!111444 (= b_free!30101 (not b_next!30101))))

(declare-fun tp!105778 () Bool)

(declare-fun b_and!48361 () Bool)

(assert (=> start!111444 (= tp!105778 b_and!48361)))

(declare-fun b!1318985 () Bool)

(declare-fun e!752596 () Bool)

(declare-fun e!752597 () Bool)

(declare-fun mapRes!55529 () Bool)

(assert (=> b!1318985 (= e!752596 (and e!752597 mapRes!55529))))

(declare-fun condMapEmpty!55529 () Bool)

(declare-datatypes ((V!52997 0))(
  ( (V!52998 (val!18035 Int)) )
))
(declare-datatypes ((ValueCell!17062 0))(
  ( (ValueCellFull!17062 (v!20665 V!52997)) (EmptyCell!17062) )
))
(declare-datatypes ((array!88782 0))(
  ( (array!88783 (arr!42865 (Array (_ BitVec 32) ValueCell!17062)) (size!43415 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88782)

(declare-fun mapDefault!55529 () ValueCell!17062)

