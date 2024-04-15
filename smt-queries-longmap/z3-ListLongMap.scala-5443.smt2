; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72424 () Bool)

(assert start!72424)

(declare-fun b_free!13627 () Bool)

(declare-fun b_next!13627 () Bool)

(assert (=> start!72424 (= b_free!13627 (not b_next!13627))))

(declare-fun tp!47981 () Bool)

(declare-fun b_and!22687 () Bool)

(assert (=> start!72424 (= tp!47981 b_and!22687)))

(declare-fun b!839799 () Bool)

(declare-fun e!468610 () Bool)

(declare-datatypes ((V!25705 0))(
  ( (V!25706 (val!7794 Int)) )
))
(declare-datatypes ((tuple2!10338 0))(
  ( (tuple2!10339 (_1!5180 (_ BitVec 64)) (_2!5180 V!25705)) )
))
(declare-datatypes ((List!16121 0))(
  ( (Nil!16118) (Cons!16117 (h!17248 tuple2!10338) (t!22483 List!16121)) )
))
(declare-datatypes ((ListLongMap!9097 0))(
  ( (ListLongMap!9098 (toList!4564 List!16121)) )
))
(declare-fun call!37088 () ListLongMap!9097)

(declare-fun call!37089 () ListLongMap!9097)

(assert (=> b!839799 (= e!468610 (= call!37088 call!37089))))

(declare-fun mapNonEmpty!24839 () Bool)

(declare-fun mapRes!24839 () Bool)

(declare-fun tp!47980 () Bool)

(declare-fun e!468609 () Bool)

(assert (=> mapNonEmpty!24839 (= mapRes!24839 (and tp!47980 e!468609))))

(declare-fun mapKey!24839 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7307 0))(
  ( (ValueCellFull!7307 (v!10213 V!25705)) (EmptyCell!7307) )
))
(declare-fun mapValue!24839 () ValueCell!7307)

(declare-fun mapRest!24839 () (Array (_ BitVec 32) ValueCell!7307))

(declare-datatypes ((array!47241 0))(
  ( (array!47242 (arr!22652 (Array (_ BitVec 32) ValueCell!7307)) (size!23094 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47241)

(assert (=> mapNonEmpty!24839 (= (arr!22652 _values!688) (store mapRest!24839 mapKey!24839 mapValue!24839))))

(declare-fun b!839800 () Bool)

(declare-fun res!571008 () Bool)

(declare-fun e!468611 () Bool)

(assert (=> b!839800 (=> (not res!571008) (not e!468611))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47243 0))(
  ( (array!47244 (arr!22653 (Array (_ BitVec 32) (_ BitVec 64))) (size!23095 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47243)

(assert (=> b!839800 (= res!571008 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23095 _keys!868))))))

(declare-fun res!571009 () Bool)

(assert (=> start!72424 (=> (not res!571009) (not e!468611))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72424 (= res!571009 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23095 _keys!868))))))

(assert (=> start!72424 e!468611))

(declare-fun tp_is_empty!15493 () Bool)

(assert (=> start!72424 tp_is_empty!15493))

(assert (=> start!72424 true))

(assert (=> start!72424 tp!47981))

(declare-fun array_inv!18108 (array!47243) Bool)

(assert (=> start!72424 (array_inv!18108 _keys!868)))

(declare-fun e!468607 () Bool)

(declare-fun array_inv!18109 (array!47241) Bool)

(assert (=> start!72424 (and (array_inv!18109 _values!688) e!468607)))

(declare-fun b!839801 () Bool)

(assert (=> b!839801 (= e!468609 tp_is_empty!15493)))

(declare-fun b!839802 () Bool)

(declare-fun e!468612 () Bool)

(assert (=> b!839802 (= e!468612 tp_is_empty!15493)))

(declare-fun v!557 () V!25705)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!25705)

(declare-fun zeroValue!654 () V!25705)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!37085 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2584 (array!47243 array!47241 (_ BitVec 32) (_ BitVec 32) V!25705 V!25705 (_ BitVec 32) Int) ListLongMap!9097)

(assert (=> bm!37085 (= call!37088 (getCurrentListMapNoExtraKeys!2584 _keys!868 (array!47242 (store (arr!22652 _values!688) i!612 (ValueCellFull!7307 v!557)) (size!23094 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839803 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2055 (ListLongMap!9097 tuple2!10338) ListLongMap!9097)

(assert (=> b!839803 (= e!468610 (= call!37088 (+!2055 call!37089 (tuple2!10339 k0!854 v!557))))))

(declare-fun b!839804 () Bool)

(declare-fun res!571007 () Bool)

(assert (=> b!839804 (=> (not res!571007) (not e!468611))))

(assert (=> b!839804 (= res!571007 (and (= (select (arr!22653 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23095 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839805 () Bool)

(declare-fun res!571010 () Bool)

(assert (=> b!839805 (=> (not res!571010) (not e!468611))))

(assert (=> b!839805 (= res!571010 (and (= (size!23094 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23095 _keys!868) (size!23094 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839806 () Bool)

(assert (=> b!839806 (= e!468607 (and e!468612 mapRes!24839))))

(declare-fun condMapEmpty!24839 () Bool)

(declare-fun mapDefault!24839 () ValueCell!7307)

(assert (=> b!839806 (= condMapEmpty!24839 (= (arr!22652 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7307)) mapDefault!24839)))))

(declare-fun b!839807 () Bool)

(declare-fun res!571011 () Bool)

(assert (=> b!839807 (=> (not res!571011) (not e!468611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47243 (_ BitVec 32)) Bool)

(assert (=> b!839807 (= res!571011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839808 () Bool)

(declare-fun res!571006 () Bool)

(assert (=> b!839808 (=> (not res!571006) (not e!468611))))

(declare-datatypes ((List!16122 0))(
  ( (Nil!16119) (Cons!16118 (h!17249 (_ BitVec 64)) (t!22484 List!16122)) )
))
(declare-fun arrayNoDuplicates!0 (array!47243 (_ BitVec 32) List!16122) Bool)

(assert (=> b!839808 (= res!571006 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16119))))

(declare-fun b!839809 () Bool)

(declare-fun res!571005 () Bool)

(assert (=> b!839809 (=> (not res!571005) (not e!468611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839809 (= res!571005 (validKeyInArray!0 k0!854))))

(declare-fun bm!37086 () Bool)

(assert (=> bm!37086 (= call!37089 (getCurrentListMapNoExtraKeys!2584 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839810 () Bool)

(assert (=> b!839810 (= e!468611 (not true))))

(assert (=> b!839810 e!468610))

(declare-fun c!91235 () Bool)

(assert (=> b!839810 (= c!91235 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28793 0))(
  ( (Unit!28794) )
))
(declare-fun lt!380570 () Unit!28793)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!271 (array!47243 array!47241 (_ BitVec 32) (_ BitVec 32) V!25705 V!25705 (_ BitVec 32) (_ BitVec 64) V!25705 (_ BitVec 32) Int) Unit!28793)

(assert (=> b!839810 (= lt!380570 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839811 () Bool)

(declare-fun res!571004 () Bool)

(assert (=> b!839811 (=> (not res!571004) (not e!468611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839811 (= res!571004 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!24839 () Bool)

(assert (=> mapIsEmpty!24839 mapRes!24839))

(assert (= (and start!72424 res!571009) b!839811))

(assert (= (and b!839811 res!571004) b!839805))

(assert (= (and b!839805 res!571010) b!839807))

(assert (= (and b!839807 res!571011) b!839808))

(assert (= (and b!839808 res!571006) b!839800))

(assert (= (and b!839800 res!571008) b!839809))

(assert (= (and b!839809 res!571005) b!839804))

(assert (= (and b!839804 res!571007) b!839810))

(assert (= (and b!839810 c!91235) b!839803))

(assert (= (and b!839810 (not c!91235)) b!839799))

(assert (= (or b!839803 b!839799) bm!37085))

(assert (= (or b!839803 b!839799) bm!37086))

(assert (= (and b!839806 condMapEmpty!24839) mapIsEmpty!24839))

(assert (= (and b!839806 (not condMapEmpty!24839)) mapNonEmpty!24839))

(get-info :version)

(assert (= (and mapNonEmpty!24839 ((_ is ValueCellFull!7307) mapValue!24839)) b!839801))

(assert (= (and b!839806 ((_ is ValueCellFull!7307) mapDefault!24839)) b!839802))

(assert (= start!72424 b!839806))

(declare-fun m!783191 () Bool)

(assert (=> b!839810 m!783191))

(declare-fun m!783193 () Bool)

(assert (=> bm!37086 m!783193))

(declare-fun m!783195 () Bool)

(assert (=> b!839807 m!783195))

(declare-fun m!783197 () Bool)

(assert (=> bm!37085 m!783197))

(declare-fun m!783199 () Bool)

(assert (=> bm!37085 m!783199))

(declare-fun m!783201 () Bool)

(assert (=> b!839808 m!783201))

(declare-fun m!783203 () Bool)

(assert (=> start!72424 m!783203))

(declare-fun m!783205 () Bool)

(assert (=> start!72424 m!783205))

(declare-fun m!783207 () Bool)

(assert (=> b!839804 m!783207))

(declare-fun m!783209 () Bool)

(assert (=> b!839803 m!783209))

(declare-fun m!783211 () Bool)

(assert (=> b!839809 m!783211))

(declare-fun m!783213 () Bool)

(assert (=> b!839811 m!783213))

(declare-fun m!783215 () Bool)

(assert (=> mapNonEmpty!24839 m!783215))

(check-sat (not b!839807) (not b_next!13627) (not mapNonEmpty!24839) (not b!839811) b_and!22687 (not b!839808) (not b!839803) (not bm!37086) (not b!839810) (not bm!37085) (not b!839809) tp_is_empty!15493 (not start!72424))
(check-sat b_and!22687 (not b_next!13627))
