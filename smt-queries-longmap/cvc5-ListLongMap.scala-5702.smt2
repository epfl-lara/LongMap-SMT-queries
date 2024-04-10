; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73996 () Bool)

(assert start!73996)

(declare-fun b_free!14911 () Bool)

(declare-fun b_next!14911 () Bool)

(assert (=> start!73996 (= b_free!14911 (not b_next!14911))))

(declare-fun tp!52237 () Bool)

(declare-fun b_and!24663 () Bool)

(assert (=> start!73996 (= tp!52237 b_and!24663)))

(declare-fun b!870051 () Bool)

(declare-fun res!591312 () Bool)

(declare-fun e!484499 () Bool)

(assert (=> b!870051 (=> (not res!591312) (not e!484499))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50240 0))(
  ( (array!50241 (arr!24151 (Array (_ BitVec 32) (_ BitVec 64))) (size!24591 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50240)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870051 (= res!591312 (and (= (select (arr!24151 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27170 () Bool)

(declare-fun mapRes!27170 () Bool)

(declare-fun tp!52236 () Bool)

(declare-fun e!484501 () Bool)

(assert (=> mapNonEmpty!27170 (= mapRes!27170 (and tp!52236 e!484501))))

(declare-fun mapKey!27170 () (_ BitVec 32))

(declare-datatypes ((V!27777 0))(
  ( (V!27778 (val!8571 Int)) )
))
(declare-datatypes ((ValueCell!8084 0))(
  ( (ValueCellFull!8084 (v!10996 V!27777)) (EmptyCell!8084) )
))
(declare-fun mapRest!27170 () (Array (_ BitVec 32) ValueCell!8084))

(declare-fun mapValue!27170 () ValueCell!8084)

(declare-datatypes ((array!50242 0))(
  ( (array!50243 (arr!24152 (Array (_ BitVec 32) ValueCell!8084)) (size!24592 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50242)

(assert (=> mapNonEmpty!27170 (= (arr!24152 _values!688) (store mapRest!27170 mapKey!27170 mapValue!27170))))

(declare-fun b!870053 () Bool)

(declare-fun res!591314 () Bool)

(assert (=> b!870053 (=> (not res!591314) (not e!484499))))

(assert (=> b!870053 (= res!591314 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24591 _keys!868))))))

(declare-fun mapIsEmpty!27170 () Bool)

(assert (=> mapIsEmpty!27170 mapRes!27170))

(declare-fun b!870054 () Bool)

(declare-fun e!484496 () Bool)

(declare-fun e!484500 () Bool)

(assert (=> b!870054 (= e!484496 (and e!484500 mapRes!27170))))

(declare-fun condMapEmpty!27170 () Bool)

(declare-fun mapDefault!27170 () ValueCell!8084)

