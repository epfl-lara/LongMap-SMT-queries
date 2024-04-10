; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111384 () Bool)

(assert start!111384)

(declare-fun b_free!30041 () Bool)

(declare-fun b_next!30041 () Bool)

(assert (=> start!111384 (= b_free!30041 (not b_next!30041))))

(declare-fun tp!105598 () Bool)

(declare-fun b_and!48261 () Bool)

(assert (=> start!111384 (= tp!105598 b_and!48261)))

(declare-fun b!1318012 () Bool)

(declare-fun e!752149 () Bool)

(declare-fun e!752145 () Bool)

(declare-fun mapRes!55439 () Bool)

(assert (=> b!1318012 (= e!752149 (and e!752145 mapRes!55439))))

(declare-fun condMapEmpty!55439 () Bool)

(declare-datatypes ((V!52917 0))(
  ( (V!52918 (val!18005 Int)) )
))
(declare-datatypes ((ValueCell!17032 0))(
  ( (ValueCellFull!17032 (v!20635 V!52917)) (EmptyCell!17032) )
))
(declare-datatypes ((array!88674 0))(
  ( (array!88675 (arr!42811 (Array (_ BitVec 32) ValueCell!17032)) (size!43361 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88674)

(declare-fun mapDefault!55439 () ValueCell!17032)

