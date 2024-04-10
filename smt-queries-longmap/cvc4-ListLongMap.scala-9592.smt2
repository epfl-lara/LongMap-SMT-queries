; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113418 () Bool)

(assert start!113418)

(declare-fun b_free!31469 () Bool)

(declare-fun b_next!31469 () Bool)

(assert (=> start!113418 (= b_free!31469 (not b_next!31469))))

(declare-fun tp!110212 () Bool)

(declare-fun b_and!50757 () Bool)

(assert (=> start!113418 (= tp!110212 b_and!50757)))

(declare-fun mapNonEmpty!57910 () Bool)

(declare-fun mapRes!57910 () Bool)

(declare-fun tp!110211 () Bool)

(declare-fun e!766077 () Bool)

(assert (=> mapNonEmpty!57910 (= mapRes!57910 (and tp!110211 e!766077))))

(declare-fun mapKey!57910 () (_ BitVec 32))

(declare-datatypes ((V!55061 0))(
  ( (V!55062 (val!18809 Int)) )
))
(declare-datatypes ((ValueCell!17836 0))(
  ( (ValueCellFull!17836 (v!21457 V!55061)) (EmptyCell!17836) )
))
(declare-datatypes ((array!91772 0))(
  ( (array!91773 (arr!44342 (Array (_ BitVec 32) ValueCell!17836)) (size!44892 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91772)

(declare-fun mapValue!57910 () ValueCell!17836)

(declare-fun mapRest!57910 () (Array (_ BitVec 32) ValueCell!17836))

(assert (=> mapNonEmpty!57910 (= (arr!44342 _values!1303) (store mapRest!57910 mapKey!57910 mapValue!57910))))

(declare-fun b!1346370 () Bool)

(declare-fun e!766075 () Bool)

(declare-fun e!766076 () Bool)

(assert (=> b!1346370 (= e!766075 (and e!766076 mapRes!57910))))

(declare-fun condMapEmpty!57910 () Bool)

(declare-fun mapDefault!57910 () ValueCell!17836)

