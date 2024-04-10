; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72544 () Bool)

(assert start!72544)

(declare-fun b_free!13729 () Bool)

(declare-fun b_next!13729 () Bool)

(assert (=> start!72544 (= b_free!13729 (not b_next!13729))))

(declare-fun tp!48286 () Bool)

(declare-fun b_and!22815 () Bool)

(assert (=> start!72544 (= tp!48286 b_and!22815)))

(declare-fun b!842027 () Bool)

(declare-fun res!572341 () Bool)

(declare-fun e!469678 () Bool)

(assert (=> b!842027 (=> (not res!572341) (not e!469678))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842027 (= res!572341 (validKeyInArray!0 k!854))))

(declare-fun b!842028 () Bool)

(declare-fun e!469674 () Bool)

(declare-datatypes ((V!25841 0))(
  ( (V!25842 (val!7845 Int)) )
))
(declare-datatypes ((tuple2!10416 0))(
  ( (tuple2!10417 (_1!5219 (_ BitVec 64)) (_2!5219 V!25841)) )
))
(declare-datatypes ((List!16194 0))(
  ( (Nil!16191) (Cons!16190 (h!17321 tuple2!10416) (t!22565 List!16194)) )
))
(declare-datatypes ((ListLongMap!9185 0))(
  ( (ListLongMap!9186 (toList!4608 List!16194)) )
))
(declare-fun call!37421 () ListLongMap!9185)

(declare-fun call!37420 () ListLongMap!9185)

(assert (=> b!842028 (= e!469674 (= call!37421 call!37420))))

(declare-fun b!842029 () Bool)

(declare-fun res!572344 () Bool)

(assert (=> b!842029 (=> (not res!572344) (not e!469678))))

(declare-datatypes ((array!47464 0))(
  ( (array!47465 (arr!22763 (Array (_ BitVec 32) (_ BitVec 64))) (size!23203 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47464)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47464 (_ BitVec 32)) Bool)

(assert (=> b!842029 (= res!572344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842030 () Bool)

(declare-fun res!572343 () Bool)

(assert (=> b!842030 (=> (not res!572343) (not e!469678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842030 (= res!572343 (validMask!0 mask!1196))))

(declare-fun b!842031 () Bool)

(declare-fun e!469677 () Bool)

(declare-fun tp_is_empty!15595 () Bool)

(assert (=> b!842031 (= e!469677 tp_is_empty!15595)))

(declare-fun v!557 () V!25841)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25841)

(declare-fun zeroValue!654 () V!25841)

(declare-fun bm!37417 () Bool)

(declare-datatypes ((ValueCell!7358 0))(
  ( (ValueCellFull!7358 (v!10270 V!25841)) (EmptyCell!7358) )
))
(declare-datatypes ((array!47466 0))(
  ( (array!47467 (arr!22764 (Array (_ BitVec 32) ValueCell!7358)) (size!23204 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47466)

(declare-fun getCurrentListMapNoExtraKeys!2593 (array!47464 array!47466 (_ BitVec 32) (_ BitVec 32) V!25841 V!25841 (_ BitVec 32) Int) ListLongMap!9185)

(assert (=> bm!37417 (= call!37421 (getCurrentListMapNoExtraKeys!2593 _keys!868 (array!47467 (store (arr!22764 _values!688) i!612 (ValueCellFull!7358 v!557)) (size!23204 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!572339 () Bool)

(assert (=> start!72544 (=> (not res!572339) (not e!469678))))

(assert (=> start!72544 (= res!572339 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23203 _keys!868))))))

(assert (=> start!72544 e!469678))

(assert (=> start!72544 tp_is_empty!15595))

(assert (=> start!72544 true))

(assert (=> start!72544 tp!48286))

(declare-fun array_inv!18112 (array!47464) Bool)

(assert (=> start!72544 (array_inv!18112 _keys!868)))

(declare-fun e!469675 () Bool)

(declare-fun array_inv!18113 (array!47466) Bool)

(assert (=> start!72544 (and (array_inv!18113 _values!688) e!469675)))

(declare-fun b!842032 () Bool)

(assert (=> b!842032 (= e!469678 (not true))))

(assert (=> b!842032 e!469674))

(declare-fun c!91453 () Bool)

(assert (=> b!842032 (= c!91453 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28921 0))(
  ( (Unit!28922) )
))
(declare-fun lt!380959 () Unit!28921)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!306 (array!47464 array!47466 (_ BitVec 32) (_ BitVec 32) V!25841 V!25841 (_ BitVec 32) (_ BitVec 64) V!25841 (_ BitVec 32) Int) Unit!28921)

(assert (=> b!842032 (= lt!380959 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!306 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842033 () Bool)

(declare-fun e!469676 () Bool)

(assert (=> b!842033 (= e!469676 tp_is_empty!15595)))

(declare-fun mapIsEmpty!24992 () Bool)

(declare-fun mapRes!24992 () Bool)

(assert (=> mapIsEmpty!24992 mapRes!24992))

(declare-fun b!842034 () Bool)

(declare-fun res!572340 () Bool)

(assert (=> b!842034 (=> (not res!572340) (not e!469678))))

(declare-datatypes ((List!16195 0))(
  ( (Nil!16192) (Cons!16191 (h!17322 (_ BitVec 64)) (t!22566 List!16195)) )
))
(declare-fun arrayNoDuplicates!0 (array!47464 (_ BitVec 32) List!16195) Bool)

(assert (=> b!842034 (= res!572340 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16192))))

(declare-fun bm!37418 () Bool)

(assert (=> bm!37418 (= call!37420 (getCurrentListMapNoExtraKeys!2593 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842035 () Bool)

(declare-fun res!572342 () Bool)

(assert (=> b!842035 (=> (not res!572342) (not e!469678))))

(assert (=> b!842035 (= res!572342 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23203 _keys!868))))))

(declare-fun b!842036 () Bool)

(declare-fun res!572338 () Bool)

(assert (=> b!842036 (=> (not res!572338) (not e!469678))))

(assert (=> b!842036 (= res!572338 (and (= (select (arr!22763 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23203 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842037 () Bool)

(declare-fun +!2070 (ListLongMap!9185 tuple2!10416) ListLongMap!9185)

(assert (=> b!842037 (= e!469674 (= call!37421 (+!2070 call!37420 (tuple2!10417 k!854 v!557))))))

(declare-fun b!842038 () Bool)

(declare-fun res!572345 () Bool)

(assert (=> b!842038 (=> (not res!572345) (not e!469678))))

(assert (=> b!842038 (= res!572345 (and (= (size!23204 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23203 _keys!868) (size!23204 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24992 () Bool)

(declare-fun tp!48285 () Bool)

(assert (=> mapNonEmpty!24992 (= mapRes!24992 (and tp!48285 e!469676))))

(declare-fun mapValue!24992 () ValueCell!7358)

(declare-fun mapRest!24992 () (Array (_ BitVec 32) ValueCell!7358))

(declare-fun mapKey!24992 () (_ BitVec 32))

(assert (=> mapNonEmpty!24992 (= (arr!22764 _values!688) (store mapRest!24992 mapKey!24992 mapValue!24992))))

(declare-fun b!842039 () Bool)

(assert (=> b!842039 (= e!469675 (and e!469677 mapRes!24992))))

(declare-fun condMapEmpty!24992 () Bool)

(declare-fun mapDefault!24992 () ValueCell!7358)

