; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74038 () Bool)

(assert start!74038)

(declare-fun b_free!14953 () Bool)

(declare-fun b_next!14953 () Bool)

(assert (=> start!74038 (= b_free!14953 (not b_next!14953))))

(declare-fun tp!52362 () Bool)

(declare-fun b_and!24705 () Bool)

(assert (=> start!74038 (= tp!52362 b_and!24705)))

(declare-fun b!870807 () Bool)

(declare-fun res!591886 () Bool)

(declare-fun e!484875 () Bool)

(assert (=> b!870807 (=> (not res!591886) (not e!484875))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50322 0))(
  ( (array!50323 (arr!24192 (Array (_ BitVec 32) (_ BitVec 64))) (size!24632 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50322)

(declare-datatypes ((V!27833 0))(
  ( (V!27834 (val!8592 Int)) )
))
(declare-datatypes ((ValueCell!8105 0))(
  ( (ValueCellFull!8105 (v!11017 V!27833)) (EmptyCell!8105) )
))
(declare-datatypes ((array!50324 0))(
  ( (array!50325 (arr!24193 (Array (_ BitVec 32) ValueCell!8105)) (size!24633 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50324)

(assert (=> b!870807 (= res!591886 (and (= (size!24633 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24632 _keys!868) (size!24633 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870808 () Bool)

(declare-fun res!591883 () Bool)

(assert (=> b!870808 (=> (not res!591883) (not e!484875))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870808 (= res!591883 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24632 _keys!868))))))

(declare-fun res!591882 () Bool)

(assert (=> start!74038 (=> (not res!591882) (not e!484875))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74038 (= res!591882 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24632 _keys!868))))))

(assert (=> start!74038 e!484875))

(declare-fun tp_is_empty!17089 () Bool)

(assert (=> start!74038 tp_is_empty!17089))

(assert (=> start!74038 true))

(assert (=> start!74038 tp!52362))

(declare-fun array_inv!19104 (array!50322) Bool)

(assert (=> start!74038 (array_inv!19104 _keys!868)))

(declare-fun e!484877 () Bool)

(declare-fun array_inv!19105 (array!50324) Bool)

(assert (=> start!74038 (and (array_inv!19105 _values!688) e!484877)))

(declare-fun b!870809 () Bool)

(declare-fun e!484879 () Bool)

(assert (=> b!870809 (= e!484879 tp_is_empty!17089)))

(declare-fun b!870810 () Bool)

(declare-fun res!591880 () Bool)

(assert (=> b!870810 (=> (not res!591880) (not e!484875))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!870810 (= res!591880 (and (= (select (arr!24192 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27233 () Bool)

(declare-fun mapRes!27233 () Bool)

(assert (=> mapIsEmpty!27233 mapRes!27233))

(declare-fun b!870811 () Bool)

(declare-fun e!484876 () Bool)

(assert (=> b!870811 (= e!484876 tp_is_empty!17089)))

(declare-fun b!870812 () Bool)

(declare-fun res!591879 () Bool)

(assert (=> b!870812 (=> (not res!591879) (not e!484875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870812 (= res!591879 (validMask!0 mask!1196))))

(declare-fun b!870813 () Bool)

(declare-fun res!591885 () Bool)

(assert (=> b!870813 (=> (not res!591885) (not e!484875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870813 (= res!591885 (validKeyInArray!0 k!854))))

(declare-fun b!870814 () Bool)

(assert (=> b!870814 (= e!484877 (and e!484879 mapRes!27233))))

(declare-fun condMapEmpty!27233 () Bool)

(declare-fun mapDefault!27233 () ValueCell!8105)

