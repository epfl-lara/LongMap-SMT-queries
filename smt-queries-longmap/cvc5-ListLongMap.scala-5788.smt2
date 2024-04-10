; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74670 () Bool)

(assert start!74670)

(declare-fun b_free!15319 () Bool)

(declare-fun b_next!15319 () Bool)

(assert (=> start!74670 (= b_free!15319 (not b_next!15319))))

(declare-fun tp!53645 () Bool)

(declare-fun b_and!25257 () Bool)

(assert (=> start!74670 (= tp!53645 b_and!25257)))

(declare-fun b!880046 () Bool)

(declare-fun res!597888 () Bool)

(declare-fun e!489747 () Bool)

(assert (=> b!880046 (=> (not res!597888) (not e!489747))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51256 0))(
  ( (array!51257 (arr!24652 (Array (_ BitVec 32) (_ BitVec 64))) (size!25092 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51256)

(declare-datatypes ((V!28465 0))(
  ( (V!28466 (val!8829 Int)) )
))
(declare-datatypes ((ValueCell!8342 0))(
  ( (ValueCellFull!8342 (v!11277 V!28465)) (EmptyCell!8342) )
))
(declare-datatypes ((array!51258 0))(
  ( (array!51259 (arr!24653 (Array (_ BitVec 32) ValueCell!8342)) (size!25093 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51258)

(assert (=> b!880046 (= res!597888 (and (= (size!25093 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25092 _keys!868) (size!25093 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880047 () Bool)

(declare-fun res!597891 () Bool)

(assert (=> b!880047 (=> (not res!597891) (not e!489747))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880047 (= res!597891 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25092 _keys!868))))))

(declare-fun b!880048 () Bool)

(declare-fun e!489748 () Bool)

(declare-fun tp_is_empty!17563 () Bool)

(assert (=> b!880048 (= e!489748 tp_is_empty!17563)))

(declare-fun b!880049 () Bool)

(declare-fun e!489750 () Bool)

(assert (=> b!880049 (= e!489750 true)))

(declare-datatypes ((tuple2!11682 0))(
  ( (tuple2!11683 (_1!5852 (_ BitVec 64)) (_2!5852 V!28465)) )
))
(declare-datatypes ((List!17496 0))(
  ( (Nil!17493) (Cons!17492 (h!18623 tuple2!11682) (t!24617 List!17496)) )
))
(declare-datatypes ((ListLongMap!10451 0))(
  ( (ListLongMap!10452 (toList!5241 List!17496)) )
))
(declare-fun lt!397919 () ListLongMap!10451)

(declare-fun lt!397914 () ListLongMap!10451)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun +!2513 (ListLongMap!10451 tuple2!11682) ListLongMap!10451)

(declare-fun get!12959 (ValueCell!8342 V!28465) V!28465)

(declare-fun dynLambda!1230 (Int (_ BitVec 64)) V!28465)

(assert (=> b!880049 (= lt!397919 (+!2513 lt!397914 (tuple2!11683 (select (arr!24652 _keys!868) from!1053) (get!12959 (select (arr!24653 _values!688) from!1053) (dynLambda!1230 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880050 () Bool)

(declare-fun res!597890 () Bool)

(assert (=> b!880050 (=> (not res!597890) (not e!489747))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880050 (= res!597890 (validKeyInArray!0 k!854))))

(declare-fun b!880051 () Bool)

(declare-fun res!597887 () Bool)

(assert (=> b!880051 (=> (not res!597887) (not e!489747))))

(assert (=> b!880051 (= res!597887 (and (= (select (arr!24652 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!880052 () Bool)

(declare-fun res!597883 () Bool)

(assert (=> b!880052 (=> (not res!597883) (not e!489747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51256 (_ BitVec 32)) Bool)

(assert (=> b!880052 (= res!597883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880053 () Bool)

(declare-fun e!489753 () Bool)

(declare-fun e!489749 () Bool)

(declare-fun mapRes!27966 () Bool)

(assert (=> b!880053 (= e!489753 (and e!489749 mapRes!27966))))

(declare-fun condMapEmpty!27966 () Bool)

(declare-fun mapDefault!27966 () ValueCell!8342)

