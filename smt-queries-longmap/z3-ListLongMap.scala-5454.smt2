; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72510 () Bool)

(assert start!72510)

(declare-fun b_free!13695 () Bool)

(declare-fun b_next!13695 () Bool)

(assert (=> start!72510 (= b_free!13695 (not b_next!13695))))

(declare-fun tp!48183 () Bool)

(declare-fun b_and!22781 () Bool)

(assert (=> start!72510 (= tp!48183 b_and!22781)))

(declare-datatypes ((V!25795 0))(
  ( (V!25796 (val!7828 Int)) )
))
(declare-datatypes ((tuple2!10388 0))(
  ( (tuple2!10389 (_1!5205 (_ BitVec 64)) (_2!5205 V!25795)) )
))
(declare-datatypes ((List!16170 0))(
  ( (Nil!16167) (Cons!16166 (h!17297 tuple2!10388) (t!22541 List!16170)) )
))
(declare-datatypes ((ListLongMap!9157 0))(
  ( (ListLongMap!9158 (toList!4594 List!16170)) )
))
(declare-fun call!37319 () ListLongMap!9157)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37315 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47400 0))(
  ( (array!47401 (arr!22731 (Array (_ BitVec 32) (_ BitVec 64))) (size!23171 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47400)

(declare-datatypes ((ValueCell!7341 0))(
  ( (ValueCellFull!7341 (v!10253 V!25795)) (EmptyCell!7341) )
))
(declare-datatypes ((array!47402 0))(
  ( (array!47403 (arr!22732 (Array (_ BitVec 32) ValueCell!7341)) (size!23172 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47402)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25795)

(declare-fun zeroValue!654 () V!25795)

(declare-fun getCurrentListMapNoExtraKeys!2580 (array!47400 array!47402 (_ BitVec 32) (_ BitVec 32) V!25795 V!25795 (_ BitVec 32) Int) ListLongMap!9157)

(assert (=> bm!37315 (= call!37319 (getCurrentListMapNoExtraKeys!2580 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841364 () Bool)

(declare-fun e!469369 () Bool)

(assert (=> b!841364 (= e!469369 (not true))))

(declare-fun e!469371 () Bool)

(assert (=> b!841364 e!469371))

(declare-fun c!91402 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841364 (= c!91402 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28899 0))(
  ( (Unit!28900) )
))
(declare-fun lt!380908 () Unit!28899)

(declare-fun v!557 () V!25795)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!295 (array!47400 array!47402 (_ BitVec 32) (_ BitVec 32) V!25795 V!25795 (_ BitVec 32) (_ BitVec 64) V!25795 (_ BitVec 32) Int) Unit!28899)

(assert (=> b!841364 (= lt!380908 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!295 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841365 () Bool)

(declare-fun call!37318 () ListLongMap!9157)

(declare-fun +!2061 (ListLongMap!9157 tuple2!10388) ListLongMap!9157)

(assert (=> b!841365 (= e!469371 (= call!37318 (+!2061 call!37319 (tuple2!10389 k0!854 v!557))))))

(declare-fun b!841366 () Bool)

(declare-fun res!571930 () Bool)

(assert (=> b!841366 (=> (not res!571930) (not e!469369))))

(assert (=> b!841366 (= res!571930 (and (= (select (arr!22731 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23171 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841367 () Bool)

(declare-fun e!469368 () Bool)

(declare-fun tp_is_empty!15561 () Bool)

(assert (=> b!841367 (= e!469368 tp_is_empty!15561)))

(declare-fun bm!37316 () Bool)

(assert (=> bm!37316 (= call!37318 (getCurrentListMapNoExtraKeys!2580 _keys!868 (array!47403 (store (arr!22732 _values!688) i!612 (ValueCellFull!7341 v!557)) (size!23172 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24941 () Bool)

(declare-fun mapRes!24941 () Bool)

(assert (=> mapIsEmpty!24941 mapRes!24941))

(declare-fun b!841369 () Bool)

(declare-fun res!571935 () Bool)

(assert (=> b!841369 (=> (not res!571935) (not e!469369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47400 (_ BitVec 32)) Bool)

(assert (=> b!841369 (= res!571935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841370 () Bool)

(declare-fun res!571931 () Bool)

(assert (=> b!841370 (=> (not res!571931) (not e!469369))))

(assert (=> b!841370 (= res!571931 (and (= (size!23172 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23171 _keys!868) (size!23172 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841371 () Bool)

(assert (=> b!841371 (= e!469371 (= call!37318 call!37319))))

(declare-fun b!841372 () Bool)

(declare-fun res!571932 () Bool)

(assert (=> b!841372 (=> (not res!571932) (not e!469369))))

(declare-datatypes ((List!16171 0))(
  ( (Nil!16168) (Cons!16167 (h!17298 (_ BitVec 64)) (t!22542 List!16171)) )
))
(declare-fun arrayNoDuplicates!0 (array!47400 (_ BitVec 32) List!16171) Bool)

(assert (=> b!841372 (= res!571932 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16168))))

(declare-fun b!841373 () Bool)

(declare-fun e!469370 () Bool)

(assert (=> b!841373 (= e!469370 (and e!469368 mapRes!24941))))

(declare-fun condMapEmpty!24941 () Bool)

(declare-fun mapDefault!24941 () ValueCell!7341)

(assert (=> b!841373 (= condMapEmpty!24941 (= (arr!22732 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7341)) mapDefault!24941)))))

(declare-fun b!841374 () Bool)

(declare-fun e!469367 () Bool)

(assert (=> b!841374 (= e!469367 tp_is_empty!15561)))

(declare-fun b!841375 () Bool)

(declare-fun res!571934 () Bool)

(assert (=> b!841375 (=> (not res!571934) (not e!469369))))

(assert (=> b!841375 (= res!571934 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23171 _keys!868))))))

(declare-fun res!571937 () Bool)

(assert (=> start!72510 (=> (not res!571937) (not e!469369))))

(assert (=> start!72510 (= res!571937 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23171 _keys!868))))))

(assert (=> start!72510 e!469369))

(assert (=> start!72510 tp_is_empty!15561))

(assert (=> start!72510 true))

(assert (=> start!72510 tp!48183))

(declare-fun array_inv!18088 (array!47400) Bool)

(assert (=> start!72510 (array_inv!18088 _keys!868)))

(declare-fun array_inv!18089 (array!47402) Bool)

(assert (=> start!72510 (and (array_inv!18089 _values!688) e!469370)))

(declare-fun b!841368 () Bool)

(declare-fun res!571933 () Bool)

(assert (=> b!841368 (=> (not res!571933) (not e!469369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841368 (= res!571933 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!24941 () Bool)

(declare-fun tp!48184 () Bool)

(assert (=> mapNonEmpty!24941 (= mapRes!24941 (and tp!48184 e!469367))))

(declare-fun mapValue!24941 () ValueCell!7341)

(declare-fun mapRest!24941 () (Array (_ BitVec 32) ValueCell!7341))

(declare-fun mapKey!24941 () (_ BitVec 32))

(assert (=> mapNonEmpty!24941 (= (arr!22732 _values!688) (store mapRest!24941 mapKey!24941 mapValue!24941))))

(declare-fun b!841376 () Bool)

(declare-fun res!571936 () Bool)

(assert (=> b!841376 (=> (not res!571936) (not e!469369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841376 (= res!571936 (validMask!0 mask!1196))))

(assert (= (and start!72510 res!571937) b!841376))

(assert (= (and b!841376 res!571936) b!841370))

(assert (= (and b!841370 res!571931) b!841369))

(assert (= (and b!841369 res!571935) b!841372))

(assert (= (and b!841372 res!571932) b!841375))

(assert (= (and b!841375 res!571934) b!841368))

(assert (= (and b!841368 res!571933) b!841366))

(assert (= (and b!841366 res!571930) b!841364))

(assert (= (and b!841364 c!91402) b!841365))

(assert (= (and b!841364 (not c!91402)) b!841371))

(assert (= (or b!841365 b!841371) bm!37316))

(assert (= (or b!841365 b!841371) bm!37315))

(assert (= (and b!841373 condMapEmpty!24941) mapIsEmpty!24941))

(assert (= (and b!841373 (not condMapEmpty!24941)) mapNonEmpty!24941))

(get-info :version)

(assert (= (and mapNonEmpty!24941 ((_ is ValueCellFull!7341) mapValue!24941)) b!841374))

(assert (= (and b!841373 ((_ is ValueCellFull!7341) mapDefault!24941)) b!841367))

(assert (= start!72510 b!841373))

(declare-fun m!784829 () Bool)

(assert (=> b!841369 m!784829))

(declare-fun m!784831 () Bool)

(assert (=> b!841368 m!784831))

(declare-fun m!784833 () Bool)

(assert (=> bm!37316 m!784833))

(declare-fun m!784835 () Bool)

(assert (=> bm!37316 m!784835))

(declare-fun m!784837 () Bool)

(assert (=> b!841365 m!784837))

(declare-fun m!784839 () Bool)

(assert (=> b!841366 m!784839))

(declare-fun m!784841 () Bool)

(assert (=> b!841376 m!784841))

(declare-fun m!784843 () Bool)

(assert (=> b!841364 m!784843))

(declare-fun m!784845 () Bool)

(assert (=> bm!37315 m!784845))

(declare-fun m!784847 () Bool)

(assert (=> mapNonEmpty!24941 m!784847))

(declare-fun m!784849 () Bool)

(assert (=> start!72510 m!784849))

(declare-fun m!784851 () Bool)

(assert (=> start!72510 m!784851))

(declare-fun m!784853 () Bool)

(assert (=> b!841372 m!784853))

(check-sat (not b_next!13695) (not mapNonEmpty!24941) (not b!841372) (not b!841369) (not b!841365) b_and!22781 tp_is_empty!15561 (not b!841368) (not b!841364) (not bm!37315) (not start!72510) (not bm!37316) (not b!841376))
(check-sat b_and!22781 (not b_next!13695))
