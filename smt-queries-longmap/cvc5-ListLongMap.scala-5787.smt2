; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74664 () Bool)

(assert start!74664)

(declare-fun b_free!15313 () Bool)

(declare-fun b_next!15313 () Bool)

(assert (=> start!74664 (= b_free!15313 (not b_next!15313))))

(declare-fun tp!53626 () Bool)

(declare-fun b_and!25245 () Bool)

(assert (=> start!74664 (= tp!53626 b_and!25245)))

(declare-fun b!879923 () Bool)

(declare-fun res!597800 () Bool)

(declare-fun e!489690 () Bool)

(assert (=> b!879923 (=> (not res!597800) (not e!489690))))

(declare-datatypes ((array!51244 0))(
  ( (array!51245 (arr!24646 (Array (_ BitVec 32) (_ BitVec 64))) (size!25086 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51244)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51244 (_ BitVec 32)) Bool)

(assert (=> b!879923 (= res!597800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879924 () Bool)

(declare-fun e!489686 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879924 (= e!489686 (or (not (= (select (arr!24646 _keys!868) from!1053) k!854)) (bvsge (size!25086 _keys!868) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!25086 _keys!868))))))

(declare-datatypes ((V!28457 0))(
  ( (V!28458 (val!8826 Int)) )
))
(declare-datatypes ((tuple2!11676 0))(
  ( (tuple2!11677 (_1!5849 (_ BitVec 64)) (_2!5849 V!28457)) )
))
(declare-datatypes ((List!17492 0))(
  ( (Nil!17489) (Cons!17488 (h!18619 tuple2!11676) (t!24607 List!17492)) )
))
(declare-datatypes ((ListLongMap!10445 0))(
  ( (ListLongMap!10446 (toList!5238 List!17492)) )
))
(declare-fun lt!397854 () ListLongMap!10445)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397853 () ListLongMap!10445)

(declare-datatypes ((ValueCell!8339 0))(
  ( (ValueCellFull!8339 (v!11274 V!28457)) (EmptyCell!8339) )
))
(declare-datatypes ((array!51246 0))(
  ( (array!51247 (arr!24647 (Array (_ BitVec 32) ValueCell!8339)) (size!25087 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51246)

(declare-fun +!2511 (ListLongMap!10445 tuple2!11676) ListLongMap!10445)

(declare-fun get!12955 (ValueCell!8339 V!28457) V!28457)

(declare-fun dynLambda!1228 (Int (_ BitVec 64)) V!28457)

(assert (=> b!879924 (= lt!397854 (+!2511 lt!397853 (tuple2!11677 (select (arr!24646 _keys!868) from!1053) (get!12955 (select (arr!24647 _values!688) from!1053) (dynLambda!1228 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879925 () Bool)

(declare-fun res!597794 () Bool)

(assert (=> b!879925 (=> (not res!597794) (not e!489690))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879925 (= res!597794 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25086 _keys!868))))))

(declare-fun b!879926 () Bool)

(declare-fun res!597801 () Bool)

(assert (=> b!879926 (=> (not res!597801) (not e!489690))))

(assert (=> b!879926 (= res!597801 (and (= (select (arr!24646 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!879927 () Bool)

(declare-fun e!489687 () Bool)

(declare-fun e!489688 () Bool)

(declare-fun mapRes!27957 () Bool)

(assert (=> b!879927 (= e!489687 (and e!489688 mapRes!27957))))

(declare-fun condMapEmpty!27957 () Bool)

(declare-fun mapDefault!27957 () ValueCell!8339)

