; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112150 () Bool)

(assert start!112150)

(declare-fun b_free!30545 () Bool)

(declare-fun b_next!30545 () Bool)

(assert (=> start!112150 (= b_free!30545 (not b_next!30545))))

(declare-fun tp!107271 () Bool)

(declare-fun b_and!49195 () Bool)

(assert (=> start!112150 (= tp!107271 b_and!49195)))

(declare-fun mapIsEmpty!56356 () Bool)

(declare-fun mapRes!56356 () Bool)

(assert (=> mapIsEmpty!56356 mapRes!56356))

(declare-fun b!1328232 () Bool)

(declare-fun e!757287 () Bool)

(declare-fun e!757288 () Bool)

(assert (=> b!1328232 (= e!757287 (and e!757288 mapRes!56356))))

(declare-fun condMapEmpty!56356 () Bool)

(declare-datatypes ((V!53709 0))(
  ( (V!53710 (val!18302 Int)) )
))
(declare-datatypes ((ValueCell!17329 0))(
  ( (ValueCellFull!17329 (v!20939 V!53709)) (EmptyCell!17329) )
))
(declare-datatypes ((array!89808 0))(
  ( (array!89809 (arr!43370 (Array (_ BitVec 32) ValueCell!17329)) (size!43920 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89808)

(declare-fun mapDefault!56356 () ValueCell!17329)

