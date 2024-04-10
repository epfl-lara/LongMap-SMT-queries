; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72470 () Bool)

(assert start!72470)

(declare-fun b_free!13655 () Bool)

(declare-fun b_next!13655 () Bool)

(assert (=> start!72470 (= b_free!13655 (not b_next!13655))))

(declare-fun tp!48063 () Bool)

(declare-fun b_and!22741 () Bool)

(assert (=> start!72470 (= tp!48063 b_and!22741)))

(declare-fun b!840584 () Bool)

(declare-fun res!571451 () Bool)

(declare-fun e!469009 () Bool)

(assert (=> b!840584 (=> (not res!571451) (not e!469009))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47320 0))(
  ( (array!47321 (arr!22691 (Array (_ BitVec 32) (_ BitVec 64))) (size!23131 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47320)

(assert (=> b!840584 (= res!571451 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23131 _keys!868))))))

(declare-fun b!840585 () Bool)

(declare-fun res!571455 () Bool)

(assert (=> b!840585 (=> (not res!571455) (not e!469009))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840585 (= res!571455 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!24881 () Bool)

(declare-fun mapRes!24881 () Bool)

(assert (=> mapIsEmpty!24881 mapRes!24881))

(declare-fun b!840586 () Bool)

(declare-fun res!571454 () Bool)

(assert (=> b!840586 (=> (not res!571454) (not e!469009))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840586 (= res!571454 (validMask!0 mask!1196))))

(declare-fun res!571457 () Bool)

(assert (=> start!72470 (=> (not res!571457) (not e!469009))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72470 (= res!571457 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23131 _keys!868))))))

(assert (=> start!72470 e!469009))

(declare-fun tp_is_empty!15521 () Bool)

(assert (=> start!72470 tp_is_empty!15521))

(assert (=> start!72470 true))

(assert (=> start!72470 tp!48063))

(declare-fun array_inv!18064 (array!47320) Bool)

(assert (=> start!72470 (array_inv!18064 _keys!868)))

(declare-datatypes ((V!25741 0))(
  ( (V!25742 (val!7808 Int)) )
))
(declare-datatypes ((ValueCell!7321 0))(
  ( (ValueCellFull!7321 (v!10233 V!25741)) (EmptyCell!7321) )
))
(declare-datatypes ((array!47322 0))(
  ( (array!47323 (arr!22692 (Array (_ BitVec 32) ValueCell!7321)) (size!23132 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47322)

(declare-fun e!469012 () Bool)

(declare-fun array_inv!18065 (array!47322) Bool)

(assert (=> start!72470 (and (array_inv!18065 _values!688) e!469012)))

(declare-fun e!469011 () Bool)

(declare-datatypes ((tuple2!10350 0))(
  ( (tuple2!10351 (_1!5186 (_ BitVec 64)) (_2!5186 V!25741)) )
))
(declare-datatypes ((List!16140 0))(
  ( (Nil!16137) (Cons!16136 (h!17267 tuple2!10350) (t!22511 List!16140)) )
))
(declare-datatypes ((ListLongMap!9119 0))(
  ( (ListLongMap!9120 (toList!4575 List!16140)) )
))
(declare-fun call!37199 () ListLongMap!9119)

(declare-fun b!840587 () Bool)

(declare-fun call!37198 () ListLongMap!9119)

(declare-fun v!557 () V!25741)

(declare-fun +!2044 (ListLongMap!9119 tuple2!10350) ListLongMap!9119)

(assert (=> b!840587 (= e!469011 (= call!37198 (+!2044 call!37199 (tuple2!10351 k!854 v!557))))))

(declare-fun b!840588 () Bool)

(declare-fun e!469008 () Bool)

(assert (=> b!840588 (= e!469008 tp_is_empty!15521)))

(declare-fun b!840589 () Bool)

(declare-fun res!571456 () Bool)

(assert (=> b!840589 (=> (not res!571456) (not e!469009))))

(declare-datatypes ((List!16141 0))(
  ( (Nil!16138) (Cons!16137 (h!17268 (_ BitVec 64)) (t!22512 List!16141)) )
))
(declare-fun arrayNoDuplicates!0 (array!47320 (_ BitVec 32) List!16141) Bool)

(assert (=> b!840589 (= res!571456 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16138))))

(declare-fun b!840590 () Bool)

(declare-fun res!571452 () Bool)

(assert (=> b!840590 (=> (not res!571452) (not e!469009))))

(assert (=> b!840590 (= res!571452 (and (= (select (arr!22691 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23131 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!37195 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25741)

(declare-fun zeroValue!654 () V!25741)

(declare-fun getCurrentListMapNoExtraKeys!2562 (array!47320 array!47322 (_ BitVec 32) (_ BitVec 32) V!25741 V!25741 (_ BitVec 32) Int) ListLongMap!9119)

(assert (=> bm!37195 (= call!37199 (getCurrentListMapNoExtraKeys!2562 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24881 () Bool)

(declare-fun tp!48064 () Bool)

(assert (=> mapNonEmpty!24881 (= mapRes!24881 (and tp!48064 e!469008))))

(declare-fun mapKey!24881 () (_ BitVec 32))

(declare-fun mapValue!24881 () ValueCell!7321)

(declare-fun mapRest!24881 () (Array (_ BitVec 32) ValueCell!7321))

(assert (=> mapNonEmpty!24881 (= (arr!22692 _values!688) (store mapRest!24881 mapKey!24881 mapValue!24881))))

(declare-fun b!840591 () Bool)

(declare-fun e!469010 () Bool)

(assert (=> b!840591 (= e!469010 tp_is_empty!15521)))

(declare-fun bm!37196 () Bool)

(assert (=> bm!37196 (= call!37198 (getCurrentListMapNoExtraKeys!2562 _keys!868 (array!47323 (store (arr!22692 _values!688) i!612 (ValueCellFull!7321 v!557)) (size!23132 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840592 () Bool)

(assert (=> b!840592 (= e!469011 (= call!37198 call!37199))))

(declare-fun b!840593 () Bool)

(assert (=> b!840593 (= e!469009 (not true))))

(assert (=> b!840593 e!469011))

(declare-fun c!91342 () Bool)

(assert (=> b!840593 (= c!91342 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28871 0))(
  ( (Unit!28872) )
))
(declare-fun lt!380848 () Unit!28871)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!281 (array!47320 array!47322 (_ BitVec 32) (_ BitVec 32) V!25741 V!25741 (_ BitVec 32) (_ BitVec 64) V!25741 (_ BitVec 32) Int) Unit!28871)

(assert (=> b!840593 (= lt!380848 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!281 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840594 () Bool)

(declare-fun res!571450 () Bool)

(assert (=> b!840594 (=> (not res!571450) (not e!469009))))

(assert (=> b!840594 (= res!571450 (and (= (size!23132 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23131 _keys!868) (size!23132 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840595 () Bool)

(assert (=> b!840595 (= e!469012 (and e!469010 mapRes!24881))))

(declare-fun condMapEmpty!24881 () Bool)

(declare-fun mapDefault!24881 () ValueCell!7321)

