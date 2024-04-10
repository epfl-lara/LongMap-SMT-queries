; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74056 () Bool)

(assert start!74056)

(declare-fun b_free!14971 () Bool)

(declare-fun b_next!14971 () Bool)

(assert (=> start!74056 (= b_free!14971 (not b_next!14971))))

(declare-fun tp!52416 () Bool)

(declare-fun b_and!24723 () Bool)

(assert (=> start!74056 (= tp!52416 b_and!24723)))

(declare-fun b!871131 () Bool)

(declare-fun e!485038 () Bool)

(declare-fun e!485041 () Bool)

(declare-fun mapRes!27260 () Bool)

(assert (=> b!871131 (= e!485038 (and e!485041 mapRes!27260))))

(declare-fun condMapEmpty!27260 () Bool)

(declare-datatypes ((V!27857 0))(
  ( (V!27858 (val!8601 Int)) )
))
(declare-datatypes ((ValueCell!8114 0))(
  ( (ValueCellFull!8114 (v!11026 V!27857)) (EmptyCell!8114) )
))
(declare-datatypes ((array!50356 0))(
  ( (array!50357 (arr!24209 (Array (_ BitVec 32) ValueCell!8114)) (size!24649 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50356)

(declare-fun mapDefault!27260 () ValueCell!8114)

