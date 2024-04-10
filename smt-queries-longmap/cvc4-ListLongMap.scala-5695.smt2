; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73958 () Bool)

(assert start!73958)

(declare-fun b_free!14873 () Bool)

(declare-fun b_next!14873 () Bool)

(assert (=> start!73958 (= b_free!14873 (not b_next!14873))))

(declare-fun tp!52123 () Bool)

(declare-fun b_and!24625 () Bool)

(assert (=> start!73958 (= tp!52123 b_and!24625)))

(declare-fun b!869368 () Bool)

(declare-fun res!590801 () Bool)

(declare-fun e!484156 () Bool)

(assert (=> b!869368 (=> (not res!590801) (not e!484156))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50166 0))(
  ( (array!50167 (arr!24114 (Array (_ BitVec 32) (_ BitVec 64))) (size!24554 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50166)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869368 (= res!590801 (and (= (select (arr!24114 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!869369 () Bool)

(declare-fun res!590800 () Bool)

(assert (=> b!869369 (=> (not res!590800) (not e!484156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869369 (= res!590800 (validKeyInArray!0 k!854))))

(declare-fun b!869370 () Bool)

(declare-fun e!484154 () Bool)

(declare-fun e!484158 () Bool)

(declare-fun mapRes!27113 () Bool)

(assert (=> b!869370 (= e!484154 (and e!484158 mapRes!27113))))

(declare-fun condMapEmpty!27113 () Bool)

(declare-datatypes ((V!27725 0))(
  ( (V!27726 (val!8552 Int)) )
))
(declare-datatypes ((ValueCell!8065 0))(
  ( (ValueCellFull!8065 (v!10977 V!27725)) (EmptyCell!8065) )
))
(declare-datatypes ((array!50168 0))(
  ( (array!50169 (arr!24115 (Array (_ BitVec 32) ValueCell!8065)) (size!24555 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50168)

(declare-fun mapDefault!27113 () ValueCell!8065)

