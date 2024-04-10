; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72464 () Bool)

(assert start!72464)

(declare-fun b_free!13649 () Bool)

(declare-fun b_next!13649 () Bool)

(assert (=> start!72464 (= b_free!13649 (not b_next!13649))))

(declare-fun tp!48046 () Bool)

(declare-fun b_and!22735 () Bool)

(assert (=> start!72464 (= tp!48046 b_and!22735)))

(declare-datatypes ((V!25733 0))(
  ( (V!25734 (val!7805 Int)) )
))
(declare-datatypes ((tuple2!10344 0))(
  ( (tuple2!10345 (_1!5183 (_ BitVec 64)) (_2!5183 V!25733)) )
))
(declare-datatypes ((List!16135 0))(
  ( (Nil!16132) (Cons!16131 (h!17262 tuple2!10344) (t!22506 List!16135)) )
))
(declare-datatypes ((ListLongMap!9113 0))(
  ( (ListLongMap!9114 (toList!4572 List!16135)) )
))
(declare-fun call!37180 () ListLongMap!9113)

(declare-fun call!37181 () ListLongMap!9113)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!25733)

(declare-fun b!840467 () Bool)

(declare-fun e!468953 () Bool)

(declare-fun +!2041 (ListLongMap!9113 tuple2!10344) ListLongMap!9113)

(assert (=> b!840467 (= e!468953 (= call!37181 (+!2041 call!37180 (tuple2!10345 k!854 v!557))))))

(declare-fun b!840468 () Bool)

(declare-fun res!571384 () Bool)

(declare-fun e!468957 () Bool)

(assert (=> b!840468 (=> (not res!571384) (not e!468957))))

(declare-datatypes ((array!47308 0))(
  ( (array!47309 (arr!22685 (Array (_ BitVec 32) (_ BitVec 64))) (size!23125 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47308)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47308 (_ BitVec 32)) Bool)

(assert (=> b!840468 (= res!571384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840469 () Bool)

(declare-fun res!571378 () Bool)

(assert (=> b!840469 (=> (not res!571378) (not e!468957))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7318 0))(
  ( (ValueCellFull!7318 (v!10230 V!25733)) (EmptyCell!7318) )
))
(declare-datatypes ((array!47310 0))(
  ( (array!47311 (arr!22686 (Array (_ BitVec 32) ValueCell!7318)) (size!23126 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47310)

(assert (=> b!840469 (= res!571378 (and (= (size!23126 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23125 _keys!868) (size!23126 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840471 () Bool)

(assert (=> b!840471 (= e!468953 (= call!37181 call!37180))))

(declare-fun b!840472 () Bool)

(declare-fun e!468954 () Bool)

(declare-fun e!468956 () Bool)

(declare-fun mapRes!24872 () Bool)

(assert (=> b!840472 (= e!468954 (and e!468956 mapRes!24872))))

(declare-fun condMapEmpty!24872 () Bool)

(declare-fun mapDefault!24872 () ValueCell!7318)

