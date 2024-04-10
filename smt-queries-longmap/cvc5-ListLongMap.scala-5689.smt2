; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73918 () Bool)

(assert start!73918)

(declare-fun b_free!14833 () Bool)

(declare-fun b_next!14833 () Bool)

(assert (=> start!73918 (= b_free!14833 (not b_next!14833))))

(declare-fun tp!52003 () Bool)

(declare-fun b_and!24585 () Bool)

(assert (=> start!73918 (= tp!52003 b_and!24585)))

(declare-fun b!868647 () Bool)

(declare-fun res!590264 () Bool)

(declare-fun e!483794 () Bool)

(assert (=> b!868647 (=> (not res!590264) (not e!483794))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50088 0))(
  ( (array!50089 (arr!24075 (Array (_ BitVec 32) (_ BitVec 64))) (size!24515 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50088)

(assert (=> b!868647 (= res!590264 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24515 _keys!868))))))

(declare-fun b!868648 () Bool)

(declare-fun res!590262 () Bool)

(assert (=> b!868648 (=> (not res!590262) (not e!483794))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27673 0))(
  ( (V!27674 (val!8532 Int)) )
))
(declare-datatypes ((ValueCell!8045 0))(
  ( (ValueCellFull!8045 (v!10957 V!27673)) (EmptyCell!8045) )
))
(declare-datatypes ((array!50090 0))(
  ( (array!50091 (arr!24076 (Array (_ BitVec 32) ValueCell!8045)) (size!24516 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50090)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!868648 (= res!590262 (and (= (size!24516 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24515 _keys!868) (size!24516 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868649 () Bool)

(declare-fun res!590259 () Bool)

(assert (=> b!868649 (=> (not res!590259) (not e!483794))))

(declare-datatypes ((List!17121 0))(
  ( (Nil!17118) (Cons!17117 (h!18248 (_ BitVec 64)) (t!24158 List!17121)) )
))
(declare-fun arrayNoDuplicates!0 (array!50088 (_ BitVec 32) List!17121) Bool)

(assert (=> b!868649 (= res!590259 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17118))))

(declare-fun b!868650 () Bool)

(declare-fun e!483795 () Bool)

(declare-fun e!483798 () Bool)

(declare-fun mapRes!27053 () Bool)

(assert (=> b!868650 (= e!483795 (and e!483798 mapRes!27053))))

(declare-fun condMapEmpty!27053 () Bool)

(declare-fun mapDefault!27053 () ValueCell!8045)

