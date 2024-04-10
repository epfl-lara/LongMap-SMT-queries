; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112404 () Bool)

(assert start!112404)

(declare-fun b_free!30799 () Bool)

(declare-fun b_next!30799 () Bool)

(assert (=> start!112404 (= b_free!30799 (not b_next!30799))))

(declare-fun tp!108034 () Bool)

(declare-fun b_and!49641 () Bool)

(assert (=> start!112404 (= tp!108034 b_and!49641)))

(declare-fun b!1332651 () Bool)

(declare-fun e!759196 () Bool)

(declare-fun e!759195 () Bool)

(declare-fun mapRes!56737 () Bool)

(assert (=> b!1332651 (= e!759196 (and e!759195 mapRes!56737))))

(declare-fun condMapEmpty!56737 () Bool)

(declare-datatypes ((V!54049 0))(
  ( (V!54050 (val!18429 Int)) )
))
(declare-datatypes ((ValueCell!17456 0))(
  ( (ValueCellFull!17456 (v!21066 V!54049)) (EmptyCell!17456) )
))
(declare-datatypes ((array!90296 0))(
  ( (array!90297 (arr!43614 (Array (_ BitVec 32) ValueCell!17456)) (size!44164 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90296)

(declare-fun mapDefault!56737 () ValueCell!17456)

