; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112804 () Bool)

(assert start!112804)

(declare-fun b_free!31057 () Bool)

(declare-fun b_next!31057 () Bool)

(assert (=> start!112804 (= b_free!31057 (not b_next!31057))))

(declare-fun tp!108818 () Bool)

(declare-fun b_and!50061 () Bool)

(assert (=> start!112804 (= tp!108818 b_and!50061)))

(declare-fun b!1337897 () Bool)

(declare-fun res!887788 () Bool)

(declare-fun e!761807 () Bool)

(assert (=> b!1337897 (=> (not res!887788) (not e!761807))))

(declare-datatypes ((V!54393 0))(
  ( (V!54394 (val!18558 Int)) )
))
(declare-datatypes ((ValueCell!17585 0))(
  ( (ValueCellFull!17585 (v!21202 V!54393)) (EmptyCell!17585) )
))
(declare-datatypes ((array!90792 0))(
  ( (array!90793 (arr!43859 (Array (_ BitVec 32) ValueCell!17585)) (size!44409 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90792)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90794 0))(
  ( (array!90795 (arr!43860 (Array (_ BitVec 32) (_ BitVec 64))) (size!44410 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90794)

(assert (=> b!1337897 (= res!887788 (and (= (size!44409 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44410 _keys!1590) (size!44409 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337898 () Bool)

(declare-fun e!761803 () Bool)

(declare-fun e!761805 () Bool)

(declare-fun mapRes!57135 () Bool)

(assert (=> b!1337898 (= e!761803 (and e!761805 mapRes!57135))))

(declare-fun condMapEmpty!57135 () Bool)

(declare-fun mapDefault!57135 () ValueCell!17585)

