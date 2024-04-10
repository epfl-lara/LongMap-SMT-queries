; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72440 () Bool)

(assert start!72440)

(declare-fun b_free!13625 () Bool)

(declare-fun b_next!13625 () Bool)

(assert (=> start!72440 (= b_free!13625 (not b_next!13625))))

(declare-fun tp!47973 () Bool)

(declare-fun b_and!22711 () Bool)

(assert (=> start!72440 (= tp!47973 b_and!22711)))

(declare-datatypes ((V!25701 0))(
  ( (V!25702 (val!7793 Int)) )
))
(declare-fun v!557 () V!25701)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37105 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47264 0))(
  ( (array!47265 (arr!22663 (Array (_ BitVec 32) (_ BitVec 64))) (size!23103 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47264)

(declare-datatypes ((ValueCell!7306 0))(
  ( (ValueCellFull!7306 (v!10218 V!25701)) (EmptyCell!7306) )
))
(declare-datatypes ((array!47266 0))(
  ( (array!47267 (arr!22664 (Array (_ BitVec 32) ValueCell!7306)) (size!23104 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47266)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25701)

(declare-fun zeroValue!654 () V!25701)

(declare-datatypes ((tuple2!10324 0))(
  ( (tuple2!10325 (_1!5173 (_ BitVec 64)) (_2!5173 V!25701)) )
))
(declare-datatypes ((List!16119 0))(
  ( (Nil!16116) (Cons!16115 (h!17246 tuple2!10324) (t!22490 List!16119)) )
))
(declare-datatypes ((ListLongMap!9093 0))(
  ( (ListLongMap!9094 (toList!4562 List!16119)) )
))
(declare-fun call!37109 () ListLongMap!9093)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2550 (array!47264 array!47266 (_ BitVec 32) (_ BitVec 32) V!25701 V!25701 (_ BitVec 32) Int) ListLongMap!9093)

(assert (=> bm!37105 (= call!37109 (getCurrentListMapNoExtraKeys!2550 _keys!868 (array!47267 (store (arr!22664 _values!688) i!612 (ValueCellFull!7306 v!557)) (size!23104 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839999 () Bool)

(declare-fun e!468740 () Bool)

(assert (=> b!839999 (= e!468740 (not true))))

(declare-fun e!468739 () Bool)

(assert (=> b!839999 e!468739))

(declare-fun c!91297 () Bool)

(assert (=> b!839999 (= c!91297 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28849 0))(
  ( (Unit!28850) )
))
(declare-fun lt!380803 () Unit!28849)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!270 (array!47264 array!47266 (_ BitVec 32) (_ BitVec 32) V!25701 V!25701 (_ BitVec 32) (_ BitVec 64) V!25701 (_ BitVec 32) Int) Unit!28849)

(assert (=> b!839999 (= lt!380803 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!270 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840000 () Bool)

(declare-fun call!37108 () ListLongMap!9093)

(assert (=> b!840000 (= e!468739 (= call!37109 call!37108))))

(declare-fun b!840001 () Bool)

(declare-fun e!468742 () Bool)

(declare-fun tp_is_empty!15491 () Bool)

(assert (=> b!840001 (= e!468742 tp_is_empty!15491)))

(declare-fun b!840003 () Bool)

(declare-fun res!571093 () Bool)

(assert (=> b!840003 (=> (not res!571093) (not e!468740))))

(assert (=> b!840003 (= res!571093 (and (= (select (arr!22663 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23103 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!37106 () Bool)

(assert (=> bm!37106 (= call!37108 (getCurrentListMapNoExtraKeys!2550 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840004 () Bool)

(declare-fun res!571095 () Bool)

(assert (=> b!840004 (=> (not res!571095) (not e!468740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47264 (_ BitVec 32)) Bool)

(assert (=> b!840004 (= res!571095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24836 () Bool)

(declare-fun mapRes!24836 () Bool)

(declare-fun tp!47974 () Bool)

(assert (=> mapNonEmpty!24836 (= mapRes!24836 (and tp!47974 e!468742))))

(declare-fun mapKey!24836 () (_ BitVec 32))

(declare-fun mapRest!24836 () (Array (_ BitVec 32) ValueCell!7306))

(declare-fun mapValue!24836 () ValueCell!7306)

(assert (=> mapNonEmpty!24836 (= (arr!22664 _values!688) (store mapRest!24836 mapKey!24836 mapValue!24836))))

(declare-fun b!840005 () Bool)

(declare-fun res!571094 () Bool)

(assert (=> b!840005 (=> (not res!571094) (not e!468740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840005 (= res!571094 (validMask!0 mask!1196))))

(declare-fun b!840006 () Bool)

(declare-fun res!571091 () Bool)

(assert (=> b!840006 (=> (not res!571091) (not e!468740))))

(assert (=> b!840006 (= res!571091 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23103 _keys!868))))))

(declare-fun b!840007 () Bool)

(declare-fun e!468741 () Bool)

(declare-fun e!468737 () Bool)

(assert (=> b!840007 (= e!468741 (and e!468737 mapRes!24836))))

(declare-fun condMapEmpty!24836 () Bool)

(declare-fun mapDefault!24836 () ValueCell!7306)

