; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73010 () Bool)

(assert start!73010)

(declare-fun b_free!13925 () Bool)

(declare-fun b_next!13925 () Bool)

(assert (=> start!73010 (= b_free!13925 (not b_next!13925))))

(declare-fun tp!49279 () Bool)

(declare-fun b_and!23011 () Bool)

(assert (=> start!73010 (= tp!49279 b_and!23011)))

(declare-datatypes ((V!26461 0))(
  ( (V!26462 (val!8078 Int)) )
))
(declare-datatypes ((tuple2!10562 0))(
  ( (tuple2!10563 (_1!5292 (_ BitVec 64)) (_2!5292 V!26461)) )
))
(declare-datatypes ((List!16418 0))(
  ( (Nil!16415) (Cons!16414 (h!17545 tuple2!10562) (t!22789 List!16418)) )
))
(declare-datatypes ((ListLongMap!9331 0))(
  ( (ListLongMap!9332 (toList!4681 List!16418)) )
))
(declare-fun call!37631 () ListLongMap!9331)

(declare-fun v!557 () V!26461)

(declare-fun b!848394 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun e!473362 () Bool)

(declare-fun call!37630 () ListLongMap!9331)

(declare-fun +!2093 (ListLongMap!9331 tuple2!10562) ListLongMap!9331)

(assert (=> b!848394 (= e!473362 (= call!37630 (+!2093 call!37631 (tuple2!10563 k!854 v!557))))))

(declare-fun b!848395 () Bool)

(declare-fun res!576406 () Bool)

(declare-fun e!473363 () Bool)

(assert (=> b!848395 (=> (not res!576406) (not e!473363))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48328 0))(
  ( (array!48329 (arr!23195 (Array (_ BitVec 32) (_ BitVec 64))) (size!23635 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48328)

(assert (=> b!848395 (= res!576406 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23635 _keys!868))))))

(declare-fun b!848396 () Bool)

(declare-fun res!576399 () Bool)

(assert (=> b!848396 (=> (not res!576399) (not e!473363))))

(declare-datatypes ((List!16419 0))(
  ( (Nil!16416) (Cons!16415 (h!17546 (_ BitVec 64)) (t!22790 List!16419)) )
))
(declare-fun arrayNoDuplicates!0 (array!48328 (_ BitVec 32) List!16419) Bool)

(assert (=> b!848396 (= res!576399 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16416))))

(declare-fun mapNonEmpty!25691 () Bool)

(declare-fun mapRes!25691 () Bool)

(declare-fun tp!49278 () Bool)

(declare-fun e!473367 () Bool)

(assert (=> mapNonEmpty!25691 (= mapRes!25691 (and tp!49278 e!473367))))

(declare-fun mapKey!25691 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7591 0))(
  ( (ValueCellFull!7591 (v!10503 V!26461)) (EmptyCell!7591) )
))
(declare-fun mapValue!25691 () ValueCell!7591)

(declare-fun mapRest!25691 () (Array (_ BitVec 32) ValueCell!7591))

(declare-datatypes ((array!48330 0))(
  ( (array!48331 (arr!23196 (Array (_ BitVec 32) ValueCell!7591)) (size!23636 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48330)

(assert (=> mapNonEmpty!25691 (= (arr!23196 _values!688) (store mapRest!25691 mapKey!25691 mapValue!25691))))

(declare-fun b!848397 () Bool)

(declare-fun res!576407 () Bool)

(assert (=> b!848397 (=> (not res!576407) (not e!473363))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848397 (= res!576407 (validMask!0 mask!1196))))

(declare-fun b!848398 () Bool)

(declare-fun e!473366 () Bool)

(declare-fun e!473361 () Bool)

(assert (=> b!848398 (= e!473366 (not e!473361))))

(declare-fun res!576405 () Bool)

(assert (=> b!848398 (=> res!576405 e!473361)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848398 (= res!576405 (not (validKeyInArray!0 (select (arr!23195 _keys!868) from!1053))))))

(assert (=> b!848398 e!473362))

(declare-fun c!91558 () Bool)

(assert (=> b!848398 (= c!91558 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((Unit!28975 0))(
  ( (Unit!28976) )
))
(declare-fun lt!382009 () Unit!28975)

(declare-fun minValue!654 () V!26461)

(declare-fun zeroValue!654 () V!26461)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!333 (array!48328 array!48330 (_ BitVec 32) (_ BitVec 32) V!26461 V!26461 (_ BitVec 32) (_ BitVec 64) V!26461 (_ BitVec 32) Int) Unit!28975)

(assert (=> b!848398 (= lt!382009 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!333 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!576402 () Bool)

(assert (=> start!73010 (=> (not res!576402) (not e!473363))))

(assert (=> start!73010 (= res!576402 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23635 _keys!868))))))

(assert (=> start!73010 e!473363))

(declare-fun tp_is_empty!16061 () Bool)

(assert (=> start!73010 tp_is_empty!16061))

(assert (=> start!73010 true))

(assert (=> start!73010 tp!49279))

(declare-fun array_inv!18416 (array!48328) Bool)

(assert (=> start!73010 (array_inv!18416 _keys!868)))

(declare-fun e!473364 () Bool)

(declare-fun array_inv!18417 (array!48330) Bool)

(assert (=> start!73010 (and (array_inv!18417 _values!688) e!473364)))

(declare-fun b!848399 () Bool)

(declare-fun res!576401 () Bool)

(assert (=> b!848399 (=> (not res!576401) (not e!473363))))

(assert (=> b!848399 (= res!576401 (validKeyInArray!0 k!854))))

(declare-fun lt!382006 () array!48330)

(declare-fun bm!37627 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2664 (array!48328 array!48330 (_ BitVec 32) (_ BitVec 32) V!26461 V!26461 (_ BitVec 32) Int) ListLongMap!9331)

(assert (=> bm!37627 (= call!37630 (getCurrentListMapNoExtraKeys!2664 _keys!868 lt!382006 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848400 () Bool)

(declare-fun e!473365 () Bool)

(assert (=> b!848400 (= e!473364 (and e!473365 mapRes!25691))))

(declare-fun condMapEmpty!25691 () Bool)

(declare-fun mapDefault!25691 () ValueCell!7591)

