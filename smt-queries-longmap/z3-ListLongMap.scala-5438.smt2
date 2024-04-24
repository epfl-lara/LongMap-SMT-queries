; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72580 () Bool)

(assert start!72580)

(declare-fun b_free!13597 () Bool)

(declare-fun b_next!13597 () Bool)

(assert (=> start!72580 (= b_free!13597 (not b_next!13597))))

(declare-fun tp!47891 () Bool)

(declare-fun b_and!22693 () Bool)

(assert (=> start!72580 (= tp!47891 b_and!22693)))

(declare-fun b!840356 () Bool)

(declare-fun res!571105 () Bool)

(declare-fun e!469072 () Bool)

(assert (=> b!840356 (=> (not res!571105) (not e!469072))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840356 (= res!571105 (validMask!0 mask!1196))))

(declare-fun b!840357 () Bool)

(declare-fun res!571103 () Bool)

(assert (=> b!840357 (=> (not res!571103) (not e!469072))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47221 0))(
  ( (array!47222 (arr!22637 (Array (_ BitVec 32) (_ BitVec 64))) (size!23078 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47221)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!840357 (= res!571103 (and (= (select (arr!22637 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23078 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840358 () Bool)

(declare-fun res!571099 () Bool)

(assert (=> b!840358 (=> (not res!571099) (not e!469072))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25665 0))(
  ( (V!25666 (val!7779 Int)) )
))
(declare-datatypes ((ValueCell!7292 0))(
  ( (ValueCellFull!7292 (v!10204 V!25665)) (EmptyCell!7292) )
))
(declare-datatypes ((array!47223 0))(
  ( (array!47224 (arr!22638 (Array (_ BitVec 32) ValueCell!7292)) (size!23079 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47223)

(assert (=> b!840358 (= res!571099 (and (= (size!23079 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23078 _keys!868) (size!23079 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37066 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10228 0))(
  ( (tuple2!10229 (_1!5125 (_ BitVec 64)) (_2!5125 V!25665)) )
))
(declare-datatypes ((List!16006 0))(
  ( (Nil!16003) (Cons!16002 (h!17139 tuple2!10228) (t!22369 List!16006)) )
))
(declare-datatypes ((ListLongMap!8999 0))(
  ( (ListLongMap!9000 (toList!4515 List!16006)) )
))
(declare-fun call!37069 () ListLongMap!8999)

(declare-fun minValue!654 () V!25665)

(declare-fun zeroValue!654 () V!25665)

(declare-fun getCurrentListMapNoExtraKeys!2577 (array!47221 array!47223 (_ BitVec 32) (_ BitVec 32) V!25665 V!25665 (_ BitVec 32) Int) ListLongMap!8999)

(assert (=> bm!37066 (= call!37069 (getCurrentListMapNoExtraKeys!2577 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!25665)

(declare-fun call!37070 () ListLongMap!8999)

(declare-fun bm!37067 () Bool)

(assert (=> bm!37067 (= call!37070 (getCurrentListMapNoExtraKeys!2577 _keys!868 (array!47224 (store (arr!22638 _values!688) i!612 (ValueCellFull!7292 v!557)) (size!23079 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840359 () Bool)

(declare-fun e!469070 () Bool)

(declare-fun e!469067 () Bool)

(declare-fun mapRes!24794 () Bool)

(assert (=> b!840359 (= e!469070 (and e!469067 mapRes!24794))))

(declare-fun condMapEmpty!24794 () Bool)

(declare-fun mapDefault!24794 () ValueCell!7292)

(assert (=> b!840359 (= condMapEmpty!24794 (= (arr!22638 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7292)) mapDefault!24794)))))

(declare-fun b!840360 () Bool)

(declare-fun res!571100 () Bool)

(assert (=> b!840360 (=> (not res!571100) (not e!469072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840360 (= res!571100 (validKeyInArray!0 k0!854))))

(declare-fun b!840361 () Bool)

(declare-fun res!571104 () Bool)

(assert (=> b!840361 (=> (not res!571104) (not e!469072))))

(assert (=> b!840361 (= res!571104 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23078 _keys!868))))))

(declare-fun mapIsEmpty!24794 () Bool)

(assert (=> mapIsEmpty!24794 mapRes!24794))

(declare-fun res!571101 () Bool)

(assert (=> start!72580 (=> (not res!571101) (not e!469072))))

(assert (=> start!72580 (= res!571101 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23078 _keys!868))))))

(assert (=> start!72580 e!469072))

(declare-fun tp_is_empty!15463 () Bool)

(assert (=> start!72580 tp_is_empty!15463))

(assert (=> start!72580 true))

(assert (=> start!72580 tp!47891))

(declare-fun array_inv!18070 (array!47221) Bool)

(assert (=> start!72580 (array_inv!18070 _keys!868)))

(declare-fun array_inv!18071 (array!47223) Bool)

(assert (=> start!72580 (and (array_inv!18071 _values!688) e!469070)))

(declare-fun b!840362 () Bool)

(declare-fun res!571098 () Bool)

(assert (=> b!840362 (=> (not res!571098) (not e!469072))))

(declare-datatypes ((List!16007 0))(
  ( (Nil!16004) (Cons!16003 (h!17140 (_ BitVec 64)) (t!22370 List!16007)) )
))
(declare-fun arrayNoDuplicates!0 (array!47221 (_ BitVec 32) List!16007) Bool)

(assert (=> b!840362 (= res!571098 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16004))))

(declare-fun b!840363 () Bool)

(declare-fun e!469068 () Bool)

(assert (=> b!840363 (= e!469068 tp_is_empty!15463)))

(declare-fun mapNonEmpty!24794 () Bool)

(declare-fun tp!47890 () Bool)

(assert (=> mapNonEmpty!24794 (= mapRes!24794 (and tp!47890 e!469068))))

(declare-fun mapRest!24794 () (Array (_ BitVec 32) ValueCell!7292))

(declare-fun mapKey!24794 () (_ BitVec 32))

(declare-fun mapValue!24794 () ValueCell!7292)

(assert (=> mapNonEmpty!24794 (= (arr!22638 _values!688) (store mapRest!24794 mapKey!24794 mapValue!24794))))

(declare-fun b!840364 () Bool)

(declare-fun res!571102 () Bool)

(assert (=> b!840364 (=> (not res!571102) (not e!469072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47221 (_ BitVec 32)) Bool)

(assert (=> b!840364 (= res!571102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840365 () Bool)

(assert (=> b!840365 (= e!469072 (not true))))

(declare-fun e!469071 () Bool)

(assert (=> b!840365 e!469071))

(declare-fun c!91537 () Bool)

(assert (=> b!840365 (= c!91537 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28844 0))(
  ( (Unit!28845) )
))
(declare-fun lt!381122 () Unit!28844)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!258 (array!47221 array!47223 (_ BitVec 32) (_ BitVec 32) V!25665 V!25665 (_ BitVec 32) (_ BitVec 64) V!25665 (_ BitVec 32) Int) Unit!28844)

(assert (=> b!840365 (= lt!381122 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!258 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840366 () Bool)

(assert (=> b!840366 (= e!469071 (= call!37070 call!37069))))

(declare-fun b!840367 () Bool)

(declare-fun +!2027 (ListLongMap!8999 tuple2!10228) ListLongMap!8999)

(assert (=> b!840367 (= e!469071 (= call!37070 (+!2027 call!37069 (tuple2!10229 k0!854 v!557))))))

(declare-fun b!840368 () Bool)

(assert (=> b!840368 (= e!469067 tp_is_empty!15463)))

(assert (= (and start!72580 res!571101) b!840356))

(assert (= (and b!840356 res!571105) b!840358))

(assert (= (and b!840358 res!571099) b!840364))

(assert (= (and b!840364 res!571102) b!840362))

(assert (= (and b!840362 res!571098) b!840361))

(assert (= (and b!840361 res!571104) b!840360))

(assert (= (and b!840360 res!571100) b!840357))

(assert (= (and b!840357 res!571103) b!840365))

(assert (= (and b!840365 c!91537) b!840367))

(assert (= (and b!840365 (not c!91537)) b!840366))

(assert (= (or b!840367 b!840366) bm!37067))

(assert (= (or b!840367 b!840366) bm!37066))

(assert (= (and b!840359 condMapEmpty!24794) mapIsEmpty!24794))

(assert (= (and b!840359 (not condMapEmpty!24794)) mapNonEmpty!24794))

(get-info :version)

(assert (= (and mapNonEmpty!24794 ((_ is ValueCellFull!7292) mapValue!24794)) b!840363))

(assert (= (and b!840359 ((_ is ValueCellFull!7292) mapDefault!24794)) b!840368))

(assert (= start!72580 b!840359))

(declare-fun m!784847 () Bool)

(assert (=> bm!37067 m!784847))

(declare-fun m!784849 () Bool)

(assert (=> bm!37067 m!784849))

(declare-fun m!784851 () Bool)

(assert (=> b!840357 m!784851))

(declare-fun m!784853 () Bool)

(assert (=> b!840365 m!784853))

(declare-fun m!784855 () Bool)

(assert (=> b!840364 m!784855))

(declare-fun m!784857 () Bool)

(assert (=> b!840362 m!784857))

(declare-fun m!784859 () Bool)

(assert (=> mapNonEmpty!24794 m!784859))

(declare-fun m!784861 () Bool)

(assert (=> bm!37066 m!784861))

(declare-fun m!784863 () Bool)

(assert (=> b!840356 m!784863))

(declare-fun m!784865 () Bool)

(assert (=> start!72580 m!784865))

(declare-fun m!784867 () Bool)

(assert (=> start!72580 m!784867))

(declare-fun m!784869 () Bool)

(assert (=> b!840360 m!784869))

(declare-fun m!784871 () Bool)

(assert (=> b!840367 m!784871))

(check-sat (not b!840367) (not b!840365) (not b!840362) (not b!840364) (not bm!37067) tp_is_empty!15463 b_and!22693 (not bm!37066) (not mapNonEmpty!24794) (not b!840360) (not b!840356) (not start!72580) (not b_next!13597))
(check-sat b_and!22693 (not b_next!13597))
