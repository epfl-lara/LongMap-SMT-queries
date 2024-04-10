; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134086 () Bool)

(assert start!134086)

(declare-fun b_free!32213 () Bool)

(declare-fun b_next!32213 () Bool)

(assert (=> start!134086 (= b_free!32213 (not b_next!32213))))

(declare-fun tp!113957 () Bool)

(declare-fun b_and!51857 () Bool)

(assert (=> start!134086 (= tp!113957 b_and!51857)))

(declare-fun mapNonEmpty!59889 () Bool)

(declare-fun mapRes!59889 () Bool)

(declare-fun tp!113958 () Bool)

(declare-fun e!873570 () Bool)

(assert (=> mapNonEmpty!59889 (= mapRes!59889 (and tp!113958 e!873570))))

(declare-datatypes ((V!60197 0))(
  ( (V!60198 (val!19580 Int)) )
))
(declare-datatypes ((ValueCell!18466 0))(
  ( (ValueCellFull!18466 (v!22339 V!60197)) (EmptyCell!18466) )
))
(declare-fun mapRest!59889 () (Array (_ BitVec 32) ValueCell!18466))

(declare-fun mapValue!59889 () ValueCell!18466)

(declare-datatypes ((array!104676 0))(
  ( (array!104677 (arr!50523 (Array (_ BitVec 32) ValueCell!18466)) (size!51073 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104676)

(declare-fun mapKey!59889 () (_ BitVec 32))

(assert (=> mapNonEmpty!59889 (= (arr!50523 _values!487) (store mapRest!59889 mapKey!59889 mapValue!59889))))

(declare-fun b!1567153 () Bool)

(declare-fun e!873569 () Bool)

(declare-fun e!873567 () Bool)

(assert (=> b!1567153 (= e!873569 (and e!873567 mapRes!59889))))

(declare-fun condMapEmpty!59889 () Bool)

(declare-fun mapDefault!59889 () ValueCell!18466)

