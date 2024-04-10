; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98448 () Bool)

(assert start!98448)

(declare-fun b_free!24053 () Bool)

(declare-fun b_next!24053 () Bool)

(assert (=> start!98448 (= b_free!24053 (not b_next!24053))))

(declare-fun tp!84869 () Bool)

(declare-fun b_and!38955 () Bool)

(assert (=> start!98448 (= tp!84869 b_and!38955)))

(declare-fun b!1137667 () Bool)

(declare-fun e!647365 () Bool)

(declare-fun e!647360 () Bool)

(declare-fun mapRes!44699 () Bool)

(assert (=> b!1137667 (= e!647365 (and e!647360 mapRes!44699))))

(declare-fun condMapEmpty!44699 () Bool)

(declare-datatypes ((V!43237 0))(
  ( (V!43238 (val!14348 Int)) )
))
(declare-datatypes ((ValueCell!13582 0))(
  ( (ValueCellFull!13582 (v!16985 V!43237)) (EmptyCell!13582) )
))
(declare-datatypes ((array!74027 0))(
  ( (array!74028 (arr!35664 (Array (_ BitVec 32) ValueCell!13582)) (size!36200 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74027)

(declare-fun mapDefault!44699 () ValueCell!13582)

