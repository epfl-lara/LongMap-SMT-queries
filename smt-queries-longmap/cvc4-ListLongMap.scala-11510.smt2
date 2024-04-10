; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133948 () Bool)

(assert start!133948)

(declare-fun b_free!32171 () Bool)

(declare-fun b_next!32171 () Bool)

(assert (=> start!133948 (= b_free!32171 (not b_next!32171))))

(declare-fun tp!113815 () Bool)

(declare-fun b_and!51783 () Bool)

(assert (=> start!133948 (= tp!113815 b_and!51783)))

(declare-fun mapIsEmpty!59809 () Bool)

(declare-fun mapRes!59809 () Bool)

(assert (=> mapIsEmpty!59809 mapRes!59809))

(declare-fun b!1565848 () Bool)

(declare-fun e!872784 () Bool)

(declare-fun e!872781 () Bool)

(assert (=> b!1565848 (= e!872784 (and e!872781 mapRes!59809))))

(declare-fun condMapEmpty!59809 () Bool)

(declare-datatypes ((V!60133 0))(
  ( (V!60134 (val!19556 Int)) )
))
(declare-datatypes ((ValueCell!18442 0))(
  ( (ValueCellFull!18442 (v!22312 V!60133)) (EmptyCell!18442) )
))
(declare-datatypes ((array!104580 0))(
  ( (array!104581 (arr!50477 (Array (_ BitVec 32) ValueCell!18442)) (size!51027 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104580)

(declare-fun mapDefault!59809 () ValueCell!18442)

