; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112402 () Bool)

(assert start!112402)

(declare-fun b_free!30797 () Bool)

(declare-fun b_next!30797 () Bool)

(assert (=> start!112402 (= b_free!30797 (not b_next!30797))))

(declare-fun tp!108027 () Bool)

(declare-fun b_and!49639 () Bool)

(assert (=> start!112402 (= tp!108027 b_and!49639)))

(declare-fun mapIsEmpty!56734 () Bool)

(declare-fun mapRes!56734 () Bool)

(assert (=> mapIsEmpty!56734 mapRes!56734))

(declare-fun b!1332627 () Bool)

(declare-fun e!759178 () Bool)

(declare-fun e!759180 () Bool)

(assert (=> b!1332627 (= e!759178 (and e!759180 mapRes!56734))))

(declare-fun condMapEmpty!56734 () Bool)

(declare-datatypes ((V!54045 0))(
  ( (V!54046 (val!18428 Int)) )
))
(declare-datatypes ((ValueCell!17455 0))(
  ( (ValueCellFull!17455 (v!21065 V!54045)) (EmptyCell!17455) )
))
(declare-datatypes ((array!90294 0))(
  ( (array!90295 (arr!43613 (Array (_ BitVec 32) ValueCell!17455)) (size!44163 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90294)

(declare-fun mapDefault!56734 () ValueCell!17455)

