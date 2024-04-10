; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112462 () Bool)

(assert start!112462)

(declare-fun b_free!30857 () Bool)

(declare-fun b_next!30857 () Bool)

(assert (=> start!112462 (= b_free!30857 (not b_next!30857))))

(declare-fun tp!108208 () Bool)

(declare-fun b_and!49715 () Bool)

(assert (=> start!112462 (= tp!108208 b_and!49715)))

(declare-fun b!1333511 () Bool)

(declare-fun e!759639 () Bool)

(declare-fun e!759638 () Bool)

(declare-fun mapRes!56824 () Bool)

(assert (=> b!1333511 (= e!759639 (and e!759638 mapRes!56824))))

(declare-fun condMapEmpty!56824 () Bool)

(declare-datatypes ((V!54125 0))(
  ( (V!54126 (val!18458 Int)) )
))
(declare-datatypes ((ValueCell!17485 0))(
  ( (ValueCellFull!17485 (v!21095 V!54125)) (EmptyCell!17485) )
))
(declare-datatypes ((array!90408 0))(
  ( (array!90409 (arr!43670 (Array (_ BitVec 32) ValueCell!17485)) (size!44220 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90408)

(declare-fun mapDefault!56824 () ValueCell!17485)

