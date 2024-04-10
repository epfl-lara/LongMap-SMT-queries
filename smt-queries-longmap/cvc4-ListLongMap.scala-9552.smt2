; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113178 () Bool)

(assert start!113178)

(declare-fun b_free!31229 () Bool)

(declare-fun b_next!31229 () Bool)

(assert (=> start!113178 (= b_free!31229 (not b_next!31229))))

(declare-fun tp!109491 () Bool)

(declare-fun b_and!50365 () Bool)

(assert (=> start!113178 (= tp!109491 b_and!50365)))

(declare-fun b!1342245 () Bool)

(declare-fun res!890490 () Bool)

(declare-fun e!764196 () Bool)

(assert (=> b!1342245 (=> (not res!890490) (not e!764196))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91308 0))(
  ( (array!91309 (arr!44110 (Array (_ BitVec 32) (_ BitVec 64))) (size!44660 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91308)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54741 0))(
  ( (V!54742 (val!18689 Int)) )
))
(declare-datatypes ((ValueCell!17716 0))(
  ( (ValueCellFull!17716 (v!21337 V!54741)) (EmptyCell!17716) )
))
(declare-datatypes ((array!91310 0))(
  ( (array!91311 (arr!44111 (Array (_ BitVec 32) ValueCell!17716)) (size!44661 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91310)

(assert (=> b!1342245 (= res!890490 (and (= (size!44661 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44660 _keys!1571) (size!44661 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342246 () Bool)

(declare-fun e!764195 () Bool)

(declare-fun e!764194 () Bool)

(declare-fun mapRes!57550 () Bool)

(assert (=> b!1342246 (= e!764195 (and e!764194 mapRes!57550))))

(declare-fun condMapEmpty!57550 () Bool)

(declare-fun mapDefault!57550 () ValueCell!17716)

