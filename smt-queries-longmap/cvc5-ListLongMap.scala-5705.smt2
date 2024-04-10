; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74014 () Bool)

(assert start!74014)

(declare-fun b_free!14929 () Bool)

(declare-fun b_next!14929 () Bool)

(assert (=> start!74014 (= b_free!14929 (not b_next!14929))))

(declare-fun tp!52290 () Bool)

(declare-fun b_and!24681 () Bool)

(assert (=> start!74014 (= tp!52290 b_and!24681)))

(declare-fun b!870375 () Bool)

(declare-fun res!591557 () Bool)

(declare-fun e!484658 () Bool)

(assert (=> b!870375 (=> (not res!591557) (not e!484658))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50276 0))(
  ( (array!50277 (arr!24169 (Array (_ BitVec 32) (_ BitVec 64))) (size!24609 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50276)

(declare-datatypes ((V!27801 0))(
  ( (V!27802 (val!8580 Int)) )
))
(declare-datatypes ((ValueCell!8093 0))(
  ( (ValueCellFull!8093 (v!11005 V!27801)) (EmptyCell!8093) )
))
(declare-datatypes ((array!50278 0))(
  ( (array!50279 (arr!24170 (Array (_ BitVec 32) ValueCell!8093)) (size!24610 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50278)

(assert (=> b!870375 (= res!591557 (and (= (size!24610 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24609 _keys!868) (size!24610 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870376 () Bool)

(declare-fun res!591561 () Bool)

(assert (=> b!870376 (=> (not res!591561) (not e!484658))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870376 (= res!591561 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24609 _keys!868))))))

(declare-fun mapNonEmpty!27197 () Bool)

(declare-fun mapRes!27197 () Bool)

(declare-fun tp!52291 () Bool)

(declare-fun e!484663 () Bool)

(assert (=> mapNonEmpty!27197 (= mapRes!27197 (and tp!52291 e!484663))))

(declare-fun mapRest!27197 () (Array (_ BitVec 32) ValueCell!8093))

(declare-fun mapValue!27197 () ValueCell!8093)

(declare-fun mapKey!27197 () (_ BitVec 32))

(assert (=> mapNonEmpty!27197 (= (arr!24170 _values!688) (store mapRest!27197 mapKey!27197 mapValue!27197))))

(declare-fun b!870378 () Bool)

(declare-fun e!484660 () Bool)

(declare-fun e!484661 () Bool)

(assert (=> b!870378 (= e!484660 (and e!484661 mapRes!27197))))

(declare-fun condMapEmpty!27197 () Bool)

(declare-fun mapDefault!27197 () ValueCell!8093)

