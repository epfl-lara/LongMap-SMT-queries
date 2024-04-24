; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72514 () Bool)

(assert start!72514)

(declare-fun b_free!13531 () Bool)

(declare-fun b_next!13531 () Bool)

(assert (=> start!72514 (= b_free!13531 (not b_next!13531))))

(declare-fun tp!47692 () Bool)

(declare-fun b_and!22627 () Bool)

(assert (=> start!72514 (= tp!47692 b_and!22627)))

(declare-fun mapIsEmpty!24695 () Bool)

(declare-fun mapRes!24695 () Bool)

(assert (=> mapIsEmpty!24695 mapRes!24695))

(declare-fun b!839069 () Bool)

(declare-fun res!570306 () Bool)

(declare-fun e!468473 () Bool)

(assert (=> b!839069 (=> (not res!570306) (not e!468473))))

(declare-datatypes ((array!47091 0))(
  ( (array!47092 (arr!22572 (Array (_ BitVec 32) (_ BitVec 64))) (size!23013 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47091)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47091 (_ BitVec 32)) Bool)

(assert (=> b!839069 (= res!570306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24695 () Bool)

(declare-fun tp!47693 () Bool)

(declare-fun e!468477 () Bool)

(assert (=> mapNonEmpty!24695 (= mapRes!24695 (and tp!47693 e!468477))))

(declare-datatypes ((V!25577 0))(
  ( (V!25578 (val!7746 Int)) )
))
(declare-datatypes ((ValueCell!7259 0))(
  ( (ValueCellFull!7259 (v!10171 V!25577)) (EmptyCell!7259) )
))
(declare-fun mapRest!24695 () (Array (_ BitVec 32) ValueCell!7259))

(declare-fun mapValue!24695 () ValueCell!7259)

(declare-datatypes ((array!47093 0))(
  ( (array!47094 (arr!22573 (Array (_ BitVec 32) ValueCell!7259)) (size!23014 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47093)

(declare-fun mapKey!24695 () (_ BitVec 32))

(assert (=> mapNonEmpty!24695 (= (arr!22573 _values!688) (store mapRest!24695 mapKey!24695 mapValue!24695))))

(declare-fun v!557 () V!25577)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!36868 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!10168 0))(
  ( (tuple2!10169 (_1!5095 (_ BitVec 64)) (_2!5095 V!25577)) )
))
(declare-datatypes ((List!15955 0))(
  ( (Nil!15952) (Cons!15951 (h!17088 tuple2!10168) (t!22318 List!15955)) )
))
(declare-datatypes ((ListLongMap!8939 0))(
  ( (ListLongMap!8940 (toList!4485 List!15955)) )
))
(declare-fun call!36871 () ListLongMap!8939)

(declare-fun minValue!654 () V!25577)

(declare-fun zeroValue!654 () V!25577)

(declare-fun getCurrentListMapNoExtraKeys!2549 (array!47091 array!47093 (_ BitVec 32) (_ BitVec 32) V!25577 V!25577 (_ BitVec 32) Int) ListLongMap!8939)

(assert (=> bm!36868 (= call!36871 (getCurrentListMapNoExtraKeys!2549 _keys!868 (array!47094 (store (arr!22573 _values!688) i!612 (ValueCellFull!7259 v!557)) (size!23014 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!36869 () Bool)

(declare-fun call!36872 () ListLongMap!8939)

(assert (=> bm!36869 (= call!36872 (getCurrentListMapNoExtraKeys!2549 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839070 () Bool)

(declare-fun e!468476 () Bool)

(declare-fun e!468474 () Bool)

(assert (=> b!839070 (= e!468476 (and e!468474 mapRes!24695))))

(declare-fun condMapEmpty!24695 () Bool)

(declare-fun mapDefault!24695 () ValueCell!7259)

(assert (=> b!839070 (= condMapEmpty!24695 (= (arr!22573 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7259)) mapDefault!24695)))))

(declare-fun b!839071 () Bool)

(declare-fun res!570307 () Bool)

(assert (=> b!839071 (=> (not res!570307) (not e!468473))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!839071 (= res!570307 (and (= (select (arr!22572 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23013 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun res!570311 () Bool)

(assert (=> start!72514 (=> (not res!570311) (not e!468473))))

(assert (=> start!72514 (= res!570311 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23013 _keys!868))))))

(assert (=> start!72514 e!468473))

(declare-fun tp_is_empty!15397 () Bool)

(assert (=> start!72514 tp_is_empty!15397))

(assert (=> start!72514 true))

(assert (=> start!72514 tp!47692))

(declare-fun array_inv!18026 (array!47091) Bool)

(assert (=> start!72514 (array_inv!18026 _keys!868)))

(declare-fun array_inv!18027 (array!47093) Bool)

(assert (=> start!72514 (and (array_inv!18027 _values!688) e!468476)))

(declare-fun b!839072 () Bool)

(declare-fun e!468478 () Bool)

(declare-fun +!2003 (ListLongMap!8939 tuple2!10168) ListLongMap!8939)

(assert (=> b!839072 (= e!468478 (= call!36871 (+!2003 call!36872 (tuple2!10169 k0!854 v!557))))))

(declare-fun b!839073 () Bool)

(declare-fun res!570313 () Bool)

(assert (=> b!839073 (=> (not res!570313) (not e!468473))))

(assert (=> b!839073 (= res!570313 (and (= (size!23014 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23013 _keys!868) (size!23014 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839074 () Bool)

(declare-fun res!570312 () Bool)

(assert (=> b!839074 (=> (not res!570312) (not e!468473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839074 (= res!570312 (validMask!0 mask!1196))))

(declare-fun b!839075 () Bool)

(assert (=> b!839075 (= e!468477 tp_is_empty!15397)))

(declare-fun b!839076 () Bool)

(declare-fun res!570309 () Bool)

(assert (=> b!839076 (=> (not res!570309) (not e!468473))))

(assert (=> b!839076 (= res!570309 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23013 _keys!868))))))

(declare-fun b!839077 () Bool)

(assert (=> b!839077 (= e!468474 tp_is_empty!15397)))

(declare-fun b!839078 () Bool)

(declare-fun res!570308 () Bool)

(assert (=> b!839078 (=> (not res!570308) (not e!468473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839078 (= res!570308 (validKeyInArray!0 k0!854))))

(declare-fun b!839079 () Bool)

(declare-fun res!570310 () Bool)

(assert (=> b!839079 (=> (not res!570310) (not e!468473))))

(declare-datatypes ((List!15956 0))(
  ( (Nil!15953) (Cons!15952 (h!17089 (_ BitVec 64)) (t!22319 List!15956)) )
))
(declare-fun arrayNoDuplicates!0 (array!47091 (_ BitVec 32) List!15956) Bool)

(assert (=> b!839079 (= res!570310 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15953))))

(declare-fun b!839080 () Bool)

(assert (=> b!839080 (= e!468478 (= call!36871 call!36872))))

(declare-fun b!839081 () Bool)

(assert (=> b!839081 (= e!468473 (not true))))

(assert (=> b!839081 e!468478))

(declare-fun c!91438 () Bool)

(assert (=> b!839081 (= c!91438 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28798 0))(
  ( (Unit!28799) )
))
(declare-fun lt!381023 () Unit!28798)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!235 (array!47091 array!47093 (_ BitVec 32) (_ BitVec 32) V!25577 V!25577 (_ BitVec 32) (_ BitVec 64) V!25577 (_ BitVec 32) Int) Unit!28798)

(assert (=> b!839081 (= lt!381023 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!235 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72514 res!570311) b!839074))

(assert (= (and b!839074 res!570312) b!839073))

(assert (= (and b!839073 res!570313) b!839069))

(assert (= (and b!839069 res!570306) b!839079))

(assert (= (and b!839079 res!570310) b!839076))

(assert (= (and b!839076 res!570309) b!839078))

(assert (= (and b!839078 res!570308) b!839071))

(assert (= (and b!839071 res!570307) b!839081))

(assert (= (and b!839081 c!91438) b!839072))

(assert (= (and b!839081 (not c!91438)) b!839080))

(assert (= (or b!839072 b!839080) bm!36868))

(assert (= (or b!839072 b!839080) bm!36869))

(assert (= (and b!839070 condMapEmpty!24695) mapIsEmpty!24695))

(assert (= (and b!839070 (not condMapEmpty!24695)) mapNonEmpty!24695))

(get-info :version)

(assert (= (and mapNonEmpty!24695 ((_ is ValueCellFull!7259) mapValue!24695)) b!839075))

(assert (= (and b!839070 ((_ is ValueCellFull!7259) mapDefault!24695)) b!839077))

(assert (= start!72514 b!839070))

(declare-fun m!783989 () Bool)

(assert (=> bm!36868 m!783989))

(declare-fun m!783991 () Bool)

(assert (=> bm!36868 m!783991))

(declare-fun m!783993 () Bool)

(assert (=> b!839071 m!783993))

(declare-fun m!783995 () Bool)

(assert (=> bm!36869 m!783995))

(declare-fun m!783997 () Bool)

(assert (=> b!839072 m!783997))

(declare-fun m!783999 () Bool)

(assert (=> mapNonEmpty!24695 m!783999))

(declare-fun m!784001 () Bool)

(assert (=> b!839074 m!784001))

(declare-fun m!784003 () Bool)

(assert (=> b!839069 m!784003))

(declare-fun m!784005 () Bool)

(assert (=> b!839079 m!784005))

(declare-fun m!784007 () Bool)

(assert (=> start!72514 m!784007))

(declare-fun m!784009 () Bool)

(assert (=> start!72514 m!784009))

(declare-fun m!784011 () Bool)

(assert (=> b!839078 m!784011))

(declare-fun m!784013 () Bool)

(assert (=> b!839081 m!784013))

(check-sat (not bm!36868) (not mapNonEmpty!24695) (not b!839079) (not b!839072) tp_is_empty!15397 (not b_next!13531) b_and!22627 (not bm!36869) (not b!839078) (not b!839081) (not b!839074) (not b!839069) (not start!72514))
(check-sat b_and!22627 (not b_next!13531))
