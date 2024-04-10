; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112320 () Bool)

(assert start!112320)

(declare-fun b_free!30715 () Bool)

(declare-fun b_next!30715 () Bool)

(assert (=> start!112320 (= b_free!30715 (not b_next!30715))))

(declare-fun tp!107781 () Bool)

(declare-fun b_and!49485 () Bool)

(assert (=> start!112320 (= tp!107781 b_and!49485)))

(declare-fun b!1331147 () Bool)

(declare-fun e!758562 () Bool)

(declare-fun e!758563 () Bool)

(declare-fun mapRes!56611 () Bool)

(assert (=> b!1331147 (= e!758562 (and e!758563 mapRes!56611))))

(declare-fun condMapEmpty!56611 () Bool)

(declare-datatypes ((V!53937 0))(
  ( (V!53938 (val!18387 Int)) )
))
(declare-datatypes ((ValueCell!17414 0))(
  ( (ValueCellFull!17414 (v!21024 V!53937)) (EmptyCell!17414) )
))
(declare-datatypes ((array!90132 0))(
  ( (array!90133 (arr!43532 (Array (_ BitVec 32) ValueCell!17414)) (size!44082 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90132)

(declare-fun mapDefault!56611 () ValueCell!17414)

