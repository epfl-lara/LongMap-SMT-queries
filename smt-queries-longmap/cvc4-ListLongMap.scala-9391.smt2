; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111786 () Bool)

(assert start!111786)

(declare-fun b_free!30443 () Bool)

(declare-fun b_next!30443 () Bool)

(assert (=> start!111786 (= b_free!30443 (not b_next!30443))))

(declare-fun tp!106805 () Bool)

(declare-fun b_and!48981 () Bool)

(assert (=> start!111786 (= tp!106805 b_and!48981)))

(declare-fun b!1324639 () Bool)

(declare-fun e!755163 () Bool)

(declare-fun tp_is_empty!36263 () Bool)

(assert (=> b!1324639 (= e!755163 tp_is_empty!36263)))

(declare-fun b!1324640 () Bool)

(declare-fun e!755164 () Bool)

(declare-fun mapRes!56042 () Bool)

(assert (=> b!1324640 (= e!755164 (and e!755163 mapRes!56042))))

(declare-fun condMapEmpty!56042 () Bool)

(declare-datatypes ((V!53453 0))(
  ( (V!53454 (val!18206 Int)) )
))
(declare-datatypes ((ValueCell!17233 0))(
  ( (ValueCellFull!17233 (v!20836 V!53453)) (EmptyCell!17233) )
))
(declare-datatypes ((array!89440 0))(
  ( (array!89441 (arr!43194 (Array (_ BitVec 32) ValueCell!17233)) (size!43744 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89440)

(declare-fun mapDefault!56042 () ValueCell!17233)

