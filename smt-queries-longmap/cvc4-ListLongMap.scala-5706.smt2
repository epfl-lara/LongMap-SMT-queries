; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74024 () Bool)

(assert start!74024)

(declare-fun b_free!14939 () Bool)

(declare-fun b_next!14939 () Bool)

(assert (=> start!74024 (= b_free!14939 (not b_next!14939))))

(declare-fun tp!52320 () Bool)

(declare-fun b_and!24691 () Bool)

(assert (=> start!74024 (= tp!52320 b_and!24691)))

(declare-fun res!591694 () Bool)

(declare-fun e!484750 () Bool)

(assert (=> start!74024 (=> (not res!591694) (not e!484750))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50294 0))(
  ( (array!50295 (arr!24178 (Array (_ BitVec 32) (_ BitVec 64))) (size!24618 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50294)

(assert (=> start!74024 (= res!591694 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24618 _keys!868))))))

(assert (=> start!74024 e!484750))

(declare-fun tp_is_empty!17075 () Bool)

(assert (=> start!74024 tp_is_empty!17075))

(assert (=> start!74024 true))

(assert (=> start!74024 tp!52320))

(declare-fun array_inv!19092 (array!50294) Bool)

(assert (=> start!74024 (array_inv!19092 _keys!868)))

(declare-datatypes ((V!27813 0))(
  ( (V!27814 (val!8585 Int)) )
))
(declare-datatypes ((ValueCell!8098 0))(
  ( (ValueCellFull!8098 (v!11010 V!27813)) (EmptyCell!8098) )
))
(declare-datatypes ((array!50296 0))(
  ( (array!50297 (arr!24179 (Array (_ BitVec 32) ValueCell!8098)) (size!24619 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50296)

(declare-fun e!484753 () Bool)

(declare-fun array_inv!19093 (array!50296) Bool)

(assert (=> start!74024 (and (array_inv!19093 _values!688) e!484753)))

(declare-fun b!870555 () Bool)

(declare-fun res!591697 () Bool)

(assert (=> b!870555 (=> (not res!591697) (not e!484750))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50294 (_ BitVec 32)) Bool)

(assert (=> b!870555 (= res!591697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27212 () Bool)

(declare-fun mapRes!27212 () Bool)

(assert (=> mapIsEmpty!27212 mapRes!27212))

(declare-fun b!870556 () Bool)

(declare-fun e!484749 () Bool)

(assert (=> b!870556 (= e!484753 (and e!484749 mapRes!27212))))

(declare-fun condMapEmpty!27212 () Bool)

(declare-fun mapDefault!27212 () ValueCell!8098)

