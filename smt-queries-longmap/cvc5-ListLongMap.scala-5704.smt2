; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74008 () Bool)

(assert start!74008)

(declare-fun b_free!14923 () Bool)

(declare-fun b_next!14923 () Bool)

(assert (=> start!74008 (= b_free!14923 (not b_next!14923))))

(declare-fun tp!52273 () Bool)

(declare-fun b_and!24675 () Bool)

(assert (=> start!74008 (= tp!52273 b_and!24675)))

(declare-fun b!870267 () Bool)

(declare-fun res!591479 () Bool)

(declare-fun e!484606 () Bool)

(assert (=> b!870267 (=> (not res!591479) (not e!484606))))

(declare-datatypes ((array!50264 0))(
  ( (array!50265 (arr!24163 (Array (_ BitVec 32) (_ BitVec 64))) (size!24603 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50264)

(declare-datatypes ((List!17187 0))(
  ( (Nil!17184) (Cons!17183 (h!18314 (_ BitVec 64)) (t!24224 List!17187)) )
))
(declare-fun arrayNoDuplicates!0 (array!50264 (_ BitVec 32) List!17187) Bool)

(assert (=> b!870267 (= res!591479 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17184))))

(declare-fun b!870268 () Bool)

(declare-fun res!591480 () Bool)

(assert (=> b!870268 (=> (not res!591480) (not e!484606))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27793 0))(
  ( (V!27794 (val!8577 Int)) )
))
(declare-datatypes ((ValueCell!8090 0))(
  ( (ValueCellFull!8090 (v!11002 V!27793)) (EmptyCell!8090) )
))
(declare-datatypes ((array!50266 0))(
  ( (array!50267 (arr!24164 (Array (_ BitVec 32) ValueCell!8090)) (size!24604 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50266)

(assert (=> b!870268 (= res!591480 (and (= (size!24604 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24603 _keys!868) (size!24604 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870269 () Bool)

(declare-fun e!484605 () Bool)

(declare-fun e!484604 () Bool)

(declare-fun mapRes!27188 () Bool)

(assert (=> b!870269 (= e!484605 (and e!484604 mapRes!27188))))

(declare-fun condMapEmpty!27188 () Bool)

(declare-fun mapDefault!27188 () ValueCell!8090)

