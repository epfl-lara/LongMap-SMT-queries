; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74630 () Bool)

(assert start!74630)

(declare-fun b_free!15299 () Bool)

(declare-fun b_next!15299 () Bool)

(assert (=> start!74630 (= b_free!15299 (not b_next!15299))))

(declare-fun tp!53582 () Bool)

(declare-fun b_and!25201 () Bool)

(assert (=> start!74630 (= tp!53582 b_and!25201)))

(declare-fun mapIsEmpty!27933 () Bool)

(declare-fun mapRes!27933 () Bool)

(assert (=> mapIsEmpty!27933 mapRes!27933))

(declare-fun b!879506 () Bool)

(declare-fun res!597532 () Bool)

(declare-fun e!489459 () Bool)

(assert (=> b!879506 (=> (not res!597532) (not e!489459))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879506 (= res!597532 (validMask!0 mask!1196))))

(declare-fun b!879507 () Bool)

(declare-fun res!597537 () Bool)

(assert (=> b!879507 (=> (not res!597537) (not e!489459))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51214 0))(
  ( (array!51215 (arr!24632 (Array (_ BitVec 32) (_ BitVec 64))) (size!25072 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51214)

(assert (=> b!879507 (= res!597537 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25072 _keys!868))))))

(declare-fun b!879508 () Bool)

(declare-fun e!489455 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879508 (= e!489455 (bvslt from!1053 (size!25072 _keys!868)))))

(declare-datatypes ((V!28437 0))(
  ( (V!28438 (val!8819 Int)) )
))
(declare-datatypes ((tuple2!11666 0))(
  ( (tuple2!11667 (_1!5844 (_ BitVec 64)) (_2!5844 V!28437)) )
))
(declare-datatypes ((List!17483 0))(
  ( (Nil!17480) (Cons!17479 (h!18610 tuple2!11666) (t!24584 List!17483)) )
))
(declare-datatypes ((ListLongMap!10435 0))(
  ( (ListLongMap!10436 (toList!5233 List!17483)) )
))
(declare-fun lt!397635 () ListLongMap!10435)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397637 () ListLongMap!10435)

(declare-datatypes ((ValueCell!8332 0))(
  ( (ValueCellFull!8332 (v!11263 V!28437)) (EmptyCell!8332) )
))
(declare-datatypes ((array!51216 0))(
  ( (array!51217 (arr!24633 (Array (_ BitVec 32) ValueCell!8332)) (size!25073 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51216)

(declare-fun +!2506 (ListLongMap!10435 tuple2!11666) ListLongMap!10435)

(declare-fun get!12943 (ValueCell!8332 V!28437) V!28437)

(declare-fun dynLambda!1224 (Int (_ BitVec 64)) V!28437)

(assert (=> b!879508 (= lt!397637 (+!2506 lt!397635 (tuple2!11667 (select (arr!24632 _keys!868) from!1053) (get!12943 (select (arr!24633 _values!688) from!1053) (dynLambda!1224 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879509 () Bool)

(declare-fun e!489460 () Bool)

(declare-fun tp_is_empty!17543 () Bool)

(assert (=> b!879509 (= e!489460 tp_is_empty!17543)))

(declare-fun b!879510 () Bool)

(declare-fun e!489458 () Bool)

(declare-fun e!489461 () Bool)

(assert (=> b!879510 (= e!489458 (and e!489461 mapRes!27933))))

(declare-fun condMapEmpty!27933 () Bool)

(declare-fun mapDefault!27933 () ValueCell!8332)

