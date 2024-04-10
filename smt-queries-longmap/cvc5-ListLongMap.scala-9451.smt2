; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112314 () Bool)

(assert start!112314)

(declare-fun b_free!30709 () Bool)

(declare-fun b_next!30709 () Bool)

(assert (=> start!112314 (= b_free!30709 (not b_next!30709))))

(declare-fun tp!107763 () Bool)

(declare-fun b_and!49473 () Bool)

(assert (=> start!112314 (= tp!107763 b_and!49473)))

(declare-fun b!1331033 () Bool)

(declare-fun e!758520 () Bool)

(declare-fun e!758519 () Bool)

(declare-fun mapRes!56602 () Bool)

(assert (=> b!1331033 (= e!758520 (and e!758519 mapRes!56602))))

(declare-fun condMapEmpty!56602 () Bool)

(declare-datatypes ((V!53929 0))(
  ( (V!53930 (val!18384 Int)) )
))
(declare-datatypes ((ValueCell!17411 0))(
  ( (ValueCellFull!17411 (v!21021 V!53929)) (EmptyCell!17411) )
))
(declare-datatypes ((array!90122 0))(
  ( (array!90123 (arr!43527 (Array (_ BitVec 32) ValueCell!17411)) (size!44077 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90122)

(declare-fun mapDefault!56602 () ValueCell!17411)

