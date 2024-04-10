; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112188 () Bool)

(assert start!112188)

(declare-fun b_free!30583 () Bool)

(declare-fun b_next!30583 () Bool)

(assert (=> start!112188 (= b_free!30583 (not b_next!30583))))

(declare-fun tp!107385 () Bool)

(declare-fun b_and!49233 () Bool)

(assert (=> start!112188 (= tp!107385 b_and!49233)))

(declare-fun mapNonEmpty!56413 () Bool)

(declare-fun mapRes!56413 () Bool)

(declare-fun tp!107386 () Bool)

(declare-fun e!757574 () Bool)

(assert (=> mapNonEmpty!56413 (= mapRes!56413 (and tp!107386 e!757574))))

(declare-datatypes ((V!53761 0))(
  ( (V!53762 (val!18321 Int)) )
))
(declare-datatypes ((ValueCell!17348 0))(
  ( (ValueCellFull!17348 (v!20958 V!53761)) (EmptyCell!17348) )
))
(declare-fun mapValue!56413 () ValueCell!17348)

(declare-datatypes ((array!89880 0))(
  ( (array!89881 (arr!43406 (Array (_ BitVec 32) ValueCell!17348)) (size!43956 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89880)

(declare-fun mapRest!56413 () (Array (_ BitVec 32) ValueCell!17348))

(declare-fun mapKey!56413 () (_ BitVec 32))

(assert (=> mapNonEmpty!56413 (= (arr!43406 _values!1320) (store mapRest!56413 mapKey!56413 mapValue!56413))))

(declare-fun b!1328688 () Bool)

(declare-fun e!757573 () Bool)

(declare-fun e!757576 () Bool)

(assert (=> b!1328688 (= e!757573 (and e!757576 mapRes!56413))))

(declare-fun condMapEmpty!56413 () Bool)

(declare-fun mapDefault!56413 () ValueCell!17348)

