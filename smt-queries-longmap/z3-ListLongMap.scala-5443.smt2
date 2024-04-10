; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72444 () Bool)

(assert start!72444)

(declare-fun b_free!13629 () Bool)

(declare-fun b_next!13629 () Bool)

(assert (=> start!72444 (= b_free!13629 (not b_next!13629))))

(declare-fun tp!47986 () Bool)

(declare-fun b_and!22715 () Bool)

(assert (=> start!72444 (= tp!47986 b_and!22715)))

(declare-fun mapNonEmpty!24842 () Bool)

(declare-fun mapRes!24842 () Bool)

(declare-fun tp!47985 () Bool)

(declare-fun e!468778 () Bool)

(assert (=> mapNonEmpty!24842 (= mapRes!24842 (and tp!47985 e!468778))))

(declare-datatypes ((V!25707 0))(
  ( (V!25708 (val!7795 Int)) )
))
(declare-datatypes ((ValueCell!7308 0))(
  ( (ValueCellFull!7308 (v!10220 V!25707)) (EmptyCell!7308) )
))
(declare-fun mapValue!24842 () ValueCell!7308)

(declare-fun mapKey!24842 () (_ BitVec 32))

(declare-datatypes ((array!47270 0))(
  ( (array!47271 (arr!22666 (Array (_ BitVec 32) ValueCell!7308)) (size!23106 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47270)

(declare-fun mapRest!24842 () (Array (_ BitVec 32) ValueCell!7308))

(assert (=> mapNonEmpty!24842 (= (arr!22666 _values!688) (store mapRest!24842 mapKey!24842 mapValue!24842))))

(declare-fun v!557 () V!25707)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10326 0))(
  ( (tuple2!10327 (_1!5174 (_ BitVec 64)) (_2!5174 V!25707)) )
))
(declare-datatypes ((List!16120 0))(
  ( (Nil!16117) (Cons!16116 (h!17247 tuple2!10326) (t!22491 List!16120)) )
))
(declare-datatypes ((ListLongMap!9095 0))(
  ( (ListLongMap!9096 (toList!4563 List!16120)) )
))
(declare-fun call!37121 () ListLongMap!9095)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47272 0))(
  ( (array!47273 (arr!22667 (Array (_ BitVec 32) (_ BitVec 64))) (size!23107 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47272)

(declare-fun bm!37117 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25707)

(declare-fun zeroValue!654 () V!25707)

(declare-fun getCurrentListMapNoExtraKeys!2551 (array!47272 array!47270 (_ BitVec 32) (_ BitVec 32) V!25707 V!25707 (_ BitVec 32) Int) ListLongMap!9095)

(assert (=> bm!37117 (= call!37121 (getCurrentListMapNoExtraKeys!2551 _keys!868 (array!47271 (store (arr!22666 _values!688) i!612 (ValueCellFull!7308 v!557)) (size!23106 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840077 () Bool)

(declare-fun e!468775 () Bool)

(declare-fun call!37120 () ListLongMap!9095)

(assert (=> b!840077 (= e!468775 (= call!37121 call!37120))))

(declare-fun res!571138 () Bool)

(declare-fun e!468773 () Bool)

(assert (=> start!72444 (=> (not res!571138) (not e!468773))))

(assert (=> start!72444 (= res!571138 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23107 _keys!868))))))

(assert (=> start!72444 e!468773))

(declare-fun tp_is_empty!15495 () Bool)

(assert (=> start!72444 tp_is_empty!15495))

(assert (=> start!72444 true))

(assert (=> start!72444 tp!47986))

(declare-fun array_inv!18048 (array!47272) Bool)

(assert (=> start!72444 (array_inv!18048 _keys!868)))

(declare-fun e!468774 () Bool)

(declare-fun array_inv!18049 (array!47270) Bool)

(assert (=> start!72444 (and (array_inv!18049 _values!688) e!468774)))

(declare-fun b!840078 () Bool)

(assert (=> b!840078 (= e!468778 tp_is_empty!15495)))

(declare-fun b!840079 () Bool)

(declare-fun res!571144 () Bool)

(assert (=> b!840079 (=> (not res!571144) (not e!468773))))

(assert (=> b!840079 (= res!571144 (and (= (size!23106 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23107 _keys!868) (size!23106 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840080 () Bool)

(declare-fun res!571143 () Bool)

(assert (=> b!840080 (=> (not res!571143) (not e!468773))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840080 (= res!571143 (validKeyInArray!0 k0!854))))

(declare-fun b!840081 () Bool)

(declare-fun +!2032 (ListLongMap!9095 tuple2!10326) ListLongMap!9095)

(assert (=> b!840081 (= e!468775 (= call!37121 (+!2032 call!37120 (tuple2!10327 k0!854 v!557))))))

(declare-fun mapIsEmpty!24842 () Bool)

(assert (=> mapIsEmpty!24842 mapRes!24842))

(declare-fun b!840082 () Bool)

(declare-fun res!571141 () Bool)

(assert (=> b!840082 (=> (not res!571141) (not e!468773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840082 (= res!571141 (validMask!0 mask!1196))))

(declare-fun b!840083 () Bool)

(assert (=> b!840083 (= e!468773 (not true))))

(assert (=> b!840083 e!468775))

(declare-fun c!91303 () Bool)

(assert (=> b!840083 (= c!91303 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28851 0))(
  ( (Unit!28852) )
))
(declare-fun lt!380809 () Unit!28851)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!271 (array!47272 array!47270 (_ BitVec 32) (_ BitVec 32) V!25707 V!25707 (_ BitVec 32) (_ BitVec 64) V!25707 (_ BitVec 32) Int) Unit!28851)

(assert (=> b!840083 (= lt!380809 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840084 () Bool)

(declare-fun e!468777 () Bool)

(assert (=> b!840084 (= e!468774 (and e!468777 mapRes!24842))))

(declare-fun condMapEmpty!24842 () Bool)

(declare-fun mapDefault!24842 () ValueCell!7308)

(assert (=> b!840084 (= condMapEmpty!24842 (= (arr!22666 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7308)) mapDefault!24842)))))

(declare-fun b!840085 () Bool)

(declare-fun res!571139 () Bool)

(assert (=> b!840085 (=> (not res!571139) (not e!468773))))

(assert (=> b!840085 (= res!571139 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23107 _keys!868))))))

(declare-fun bm!37118 () Bool)

(assert (=> bm!37118 (= call!37120 (getCurrentListMapNoExtraKeys!2551 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840086 () Bool)

(assert (=> b!840086 (= e!468777 tp_is_empty!15495)))

(declare-fun b!840087 () Bool)

(declare-fun res!571140 () Bool)

(assert (=> b!840087 (=> (not res!571140) (not e!468773))))

(declare-datatypes ((List!16121 0))(
  ( (Nil!16118) (Cons!16117 (h!17248 (_ BitVec 64)) (t!22492 List!16121)) )
))
(declare-fun arrayNoDuplicates!0 (array!47272 (_ BitVec 32) List!16121) Bool)

(assert (=> b!840087 (= res!571140 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16118))))

(declare-fun b!840088 () Bool)

(declare-fun res!571142 () Bool)

(assert (=> b!840088 (=> (not res!571142) (not e!468773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47272 (_ BitVec 32)) Bool)

(assert (=> b!840088 (= res!571142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840089 () Bool)

(declare-fun res!571145 () Bool)

(assert (=> b!840089 (=> (not res!571145) (not e!468773))))

(assert (=> b!840089 (= res!571145 (and (= (select (arr!22667 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23107 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!72444 res!571138) b!840082))

(assert (= (and b!840082 res!571141) b!840079))

(assert (= (and b!840079 res!571144) b!840088))

(assert (= (and b!840088 res!571142) b!840087))

(assert (= (and b!840087 res!571140) b!840085))

(assert (= (and b!840085 res!571139) b!840080))

(assert (= (and b!840080 res!571143) b!840089))

(assert (= (and b!840089 res!571145) b!840083))

(assert (= (and b!840083 c!91303) b!840081))

(assert (= (and b!840083 (not c!91303)) b!840077))

(assert (= (or b!840081 b!840077) bm!37117))

(assert (= (or b!840081 b!840077) bm!37118))

(assert (= (and b!840084 condMapEmpty!24842) mapIsEmpty!24842))

(assert (= (and b!840084 (not condMapEmpty!24842)) mapNonEmpty!24842))

(get-info :version)

(assert (= (and mapNonEmpty!24842 ((_ is ValueCellFull!7308) mapValue!24842)) b!840078))

(assert (= (and b!840084 ((_ is ValueCellFull!7308) mapDefault!24842)) b!840086))

(assert (= start!72444 b!840084))

(declare-fun m!783971 () Bool)

(assert (=> b!840080 m!783971))

(declare-fun m!783973 () Bool)

(assert (=> bm!37118 m!783973))

(declare-fun m!783975 () Bool)

(assert (=> mapNonEmpty!24842 m!783975))

(declare-fun m!783977 () Bool)

(assert (=> b!840089 m!783977))

(declare-fun m!783979 () Bool)

(assert (=> b!840087 m!783979))

(declare-fun m!783981 () Bool)

(assert (=> b!840082 m!783981))

(declare-fun m!783983 () Bool)

(assert (=> start!72444 m!783983))

(declare-fun m!783985 () Bool)

(assert (=> start!72444 m!783985))

(declare-fun m!783987 () Bool)

(assert (=> bm!37117 m!783987))

(declare-fun m!783989 () Bool)

(assert (=> bm!37117 m!783989))

(declare-fun m!783991 () Bool)

(assert (=> b!840088 m!783991))

(declare-fun m!783993 () Bool)

(assert (=> b!840081 m!783993))

(declare-fun m!783995 () Bool)

(assert (=> b!840083 m!783995))

(check-sat (not b!840087) (not b_next!13629) b_and!22715 (not b!840083) (not mapNonEmpty!24842) (not start!72444) (not b!840080) (not b!840082) (not b!840088) (not bm!37118) tp_is_empty!15495 (not b!840081) (not bm!37117))
(check-sat b_and!22715 (not b_next!13629))
