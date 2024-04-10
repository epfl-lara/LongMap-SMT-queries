; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73016 () Bool)

(assert start!73016)

(declare-fun b_free!13931 () Bool)

(declare-fun b_next!13931 () Bool)

(assert (=> start!73016 (= b_free!13931 (not b_next!13931))))

(declare-fun tp!49297 () Bool)

(declare-fun b_and!23021 () Bool)

(assert (=> start!73016 (= tp!49297 b_and!23021)))

(declare-fun bm!37645 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48340 0))(
  ( (array!48341 (arr!23201 (Array (_ BitVec 32) (_ BitVec 64))) (size!23641 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48340)

(declare-datatypes ((V!26469 0))(
  ( (V!26470 (val!8081 Int)) )
))
(declare-datatypes ((ValueCell!7594 0))(
  ( (ValueCellFull!7594 (v!10506 V!26469)) (EmptyCell!7594) )
))
(declare-datatypes ((array!48342 0))(
  ( (array!48343 (arr!23202 (Array (_ BitVec 32) ValueCell!7594)) (size!23642 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48342)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26469)

(declare-datatypes ((tuple2!10568 0))(
  ( (tuple2!10569 (_1!5295 (_ BitVec 64)) (_2!5295 V!26469)) )
))
(declare-datatypes ((List!16424 0))(
  ( (Nil!16421) (Cons!16420 (h!17551 tuple2!10568) (t!22801 List!16424)) )
))
(declare-datatypes ((ListLongMap!9337 0))(
  ( (ListLongMap!9338 (toList!4684 List!16424)) )
))
(declare-fun call!37648 () ListLongMap!9337)

(declare-fun zeroValue!654 () V!26469)

(declare-fun getCurrentListMapNoExtraKeys!2666 (array!48340 array!48342 (_ BitVec 32) (_ BitVec 32) V!26469 V!26469 (_ BitVec 32) Int) ListLongMap!9337)

(assert (=> bm!37645 (= call!37648 (getCurrentListMapNoExtraKeys!2666 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848533 () Bool)

(declare-fun e!473433 () Bool)

(declare-fun e!473435 () Bool)

(assert (=> b!848533 (= e!473433 (not e!473435))))

(declare-fun res!576489 () Bool)

(assert (=> b!848533 (=> res!576489 e!473435)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848533 (= res!576489 (not (validKeyInArray!0 (select (arr!23201 _keys!868) from!1053))))))

(declare-fun e!473440 () Bool)

(assert (=> b!848533 e!473440))

(declare-fun c!91567 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848533 (= c!91567 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26469)

(declare-datatypes ((Unit!28979 0))(
  ( (Unit!28980) )
))
(declare-fun lt!382044 () Unit!28979)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!335 (array!48340 array!48342 (_ BitVec 32) (_ BitVec 32) V!26469 V!26469 (_ BitVec 32) (_ BitVec 64) V!26469 (_ BitVec 32) Int) Unit!28979)

(assert (=> b!848533 (= lt!382044 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!335 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848534 () Bool)

(declare-fun res!576497 () Bool)

(declare-fun e!473434 () Bool)

(assert (=> b!848534 (=> (not res!576497) (not e!473434))))

(assert (=> b!848534 (= res!576497 (and (= (size!23642 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23641 _keys!868) (size!23642 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25700 () Bool)

(declare-fun mapRes!25700 () Bool)

(assert (=> mapIsEmpty!25700 mapRes!25700))

(declare-fun b!848535 () Bool)

(declare-fun res!576495 () Bool)

(assert (=> b!848535 (=> (not res!576495) (not e!473434))))

(assert (=> b!848535 (= res!576495 (validKeyInArray!0 k!854))))

(declare-fun b!848536 () Bool)

(declare-fun e!473436 () Bool)

(declare-fun e!473437 () Bool)

(assert (=> b!848536 (= e!473436 (and e!473437 mapRes!25700))))

(declare-fun condMapEmpty!25700 () Bool)

(declare-fun mapDefault!25700 () ValueCell!7594)

