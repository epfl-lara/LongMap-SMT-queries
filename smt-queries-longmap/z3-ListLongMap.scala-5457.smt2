; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72528 () Bool)

(assert start!72528)

(declare-fun b_free!13713 () Bool)

(declare-fun b_next!13713 () Bool)

(assert (=> start!72528 (= b_free!13713 (not b_next!13713))))

(declare-fun tp!48238 () Bool)

(declare-fun b_and!22799 () Bool)

(assert (=> start!72528 (= tp!48238 b_and!22799)))

(declare-fun b!841715 () Bool)

(declare-fun res!572150 () Bool)

(declare-fun e!469530 () Bool)

(assert (=> b!841715 (=> (not res!572150) (not e!469530))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841715 (= res!572150 (validMask!0 mask!1196))))

(declare-fun res!572149 () Bool)

(assert (=> start!72528 (=> (not res!572149) (not e!469530))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47434 0))(
  ( (array!47435 (arr!22748 (Array (_ BitVec 32) (_ BitVec 64))) (size!23188 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47434)

(assert (=> start!72528 (= res!572149 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23188 _keys!868))))))

(assert (=> start!72528 e!469530))

(declare-fun tp_is_empty!15579 () Bool)

(assert (=> start!72528 tp_is_empty!15579))

(assert (=> start!72528 true))

(assert (=> start!72528 tp!48238))

(declare-fun array_inv!18100 (array!47434) Bool)

(assert (=> start!72528 (array_inv!18100 _keys!868)))

(declare-datatypes ((V!25819 0))(
  ( (V!25820 (val!7837 Int)) )
))
(declare-datatypes ((ValueCell!7350 0))(
  ( (ValueCellFull!7350 (v!10262 V!25819)) (EmptyCell!7350) )
))
(declare-datatypes ((array!47436 0))(
  ( (array!47437 (arr!22749 (Array (_ BitVec 32) ValueCell!7350)) (size!23189 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47436)

(declare-fun e!469529 () Bool)

(declare-fun array_inv!18101 (array!47436) Bool)

(assert (=> start!72528 (and (array_inv!18101 _values!688) e!469529)))

(declare-fun b!841716 () Bool)

(declare-fun e!469533 () Bool)

(assert (=> b!841716 (= e!469533 tp_is_empty!15579)))

(declare-fun b!841717 () Bool)

(declare-fun res!572147 () Bool)

(assert (=> b!841717 (=> (not res!572147) (not e!469530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47434 (_ BitVec 32)) Bool)

(assert (=> b!841717 (= res!572147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841718 () Bool)

(declare-fun res!572146 () Bool)

(assert (=> b!841718 (=> (not res!572146) (not e!469530))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841718 (= res!572146 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!24968 () Bool)

(declare-fun mapRes!24968 () Bool)

(assert (=> mapIsEmpty!24968 mapRes!24968))

(declare-fun b!841719 () Bool)

(declare-fun res!572148 () Bool)

(assert (=> b!841719 (=> (not res!572148) (not e!469530))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!841719 (= res!572148 (and (= (size!23189 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23188 _keys!868) (size!23189 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841720 () Bool)

(declare-fun res!572151 () Bool)

(assert (=> b!841720 (=> (not res!572151) (not e!469530))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841720 (= res!572151 (and (= (select (arr!22748 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23188 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841721 () Bool)

(declare-fun e!469531 () Bool)

(assert (=> b!841721 (= e!469531 tp_is_empty!15579)))

(declare-fun b!841722 () Bool)

(declare-fun res!572152 () Bool)

(assert (=> b!841722 (=> (not res!572152) (not e!469530))))

(assert (=> b!841722 (= res!572152 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23188 _keys!868))))))

(declare-fun b!841723 () Bool)

(assert (=> b!841723 (= e!469529 (and e!469533 mapRes!24968))))

(declare-fun condMapEmpty!24968 () Bool)

(declare-fun mapDefault!24968 () ValueCell!7350)

(assert (=> b!841723 (= condMapEmpty!24968 (= (arr!22749 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7350)) mapDefault!24968)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10402 0))(
  ( (tuple2!10403 (_1!5212 (_ BitVec 64)) (_2!5212 V!25819)) )
))
(declare-datatypes ((List!16181 0))(
  ( (Nil!16178) (Cons!16177 (h!17308 tuple2!10402) (t!22552 List!16181)) )
))
(declare-datatypes ((ListLongMap!9171 0))(
  ( (ListLongMap!9172 (toList!4601 List!16181)) )
))
(declare-fun call!37373 () ListLongMap!9171)

(declare-fun bm!37369 () Bool)

(declare-fun minValue!654 () V!25819)

(declare-fun zeroValue!654 () V!25819)

(declare-fun getCurrentListMapNoExtraKeys!2586 (array!47434 array!47436 (_ BitVec 32) (_ BitVec 32) V!25819 V!25819 (_ BitVec 32) Int) ListLongMap!9171)

(assert (=> bm!37369 (= call!37373 (getCurrentListMapNoExtraKeys!2586 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841724 () Bool)

(declare-fun e!469534 () Bool)

(declare-fun call!37372 () ListLongMap!9171)

(assert (=> b!841724 (= e!469534 (= call!37372 call!37373))))

(declare-fun v!557 () V!25819)

(declare-fun b!841725 () Bool)

(declare-fun +!2065 (ListLongMap!9171 tuple2!10402) ListLongMap!9171)

(assert (=> b!841725 (= e!469534 (= call!37372 (+!2065 call!37373 (tuple2!10403 k0!854 v!557))))))

(declare-fun b!841726 () Bool)

(assert (=> b!841726 (= e!469530 (not true))))

(assert (=> b!841726 e!469534))

(declare-fun c!91429 () Bool)

(assert (=> b!841726 (= c!91429 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28907 0))(
  ( (Unit!28908) )
))
(declare-fun lt!380935 () Unit!28907)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!299 (array!47434 array!47436 (_ BitVec 32) (_ BitVec 32) V!25819 V!25819 (_ BitVec 32) (_ BitVec 64) V!25819 (_ BitVec 32) Int) Unit!28907)

(assert (=> b!841726 (= lt!380935 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!299 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37370 () Bool)

(assert (=> bm!37370 (= call!37372 (getCurrentListMapNoExtraKeys!2586 _keys!868 (array!47437 (store (arr!22749 _values!688) i!612 (ValueCellFull!7350 v!557)) (size!23189 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24968 () Bool)

(declare-fun tp!48237 () Bool)

(assert (=> mapNonEmpty!24968 (= mapRes!24968 (and tp!48237 e!469531))))

(declare-fun mapRest!24968 () (Array (_ BitVec 32) ValueCell!7350))

(declare-fun mapKey!24968 () (_ BitVec 32))

(declare-fun mapValue!24968 () ValueCell!7350)

(assert (=> mapNonEmpty!24968 (= (arr!22749 _values!688) (store mapRest!24968 mapKey!24968 mapValue!24968))))

(declare-fun b!841727 () Bool)

(declare-fun res!572153 () Bool)

(assert (=> b!841727 (=> (not res!572153) (not e!469530))))

(declare-datatypes ((List!16182 0))(
  ( (Nil!16179) (Cons!16178 (h!17309 (_ BitVec 64)) (t!22553 List!16182)) )
))
(declare-fun arrayNoDuplicates!0 (array!47434 (_ BitVec 32) List!16182) Bool)

(assert (=> b!841727 (= res!572153 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16179))))

(assert (= (and start!72528 res!572149) b!841715))

(assert (= (and b!841715 res!572150) b!841719))

(assert (= (and b!841719 res!572148) b!841717))

(assert (= (and b!841717 res!572147) b!841727))

(assert (= (and b!841727 res!572153) b!841722))

(assert (= (and b!841722 res!572152) b!841718))

(assert (= (and b!841718 res!572146) b!841720))

(assert (= (and b!841720 res!572151) b!841726))

(assert (= (and b!841726 c!91429) b!841725))

(assert (= (and b!841726 (not c!91429)) b!841724))

(assert (= (or b!841725 b!841724) bm!37370))

(assert (= (or b!841725 b!841724) bm!37369))

(assert (= (and b!841723 condMapEmpty!24968) mapIsEmpty!24968))

(assert (= (and b!841723 (not condMapEmpty!24968)) mapNonEmpty!24968))

(get-info :version)

(assert (= (and mapNonEmpty!24968 ((_ is ValueCellFull!7350) mapValue!24968)) b!841721))

(assert (= (and b!841723 ((_ is ValueCellFull!7350) mapDefault!24968)) b!841716))

(assert (= start!72528 b!841723))

(declare-fun m!785063 () Bool)

(assert (=> b!841727 m!785063))

(declare-fun m!785065 () Bool)

(assert (=> b!841720 m!785065))

(declare-fun m!785067 () Bool)

(assert (=> b!841717 m!785067))

(declare-fun m!785069 () Bool)

(assert (=> bm!37370 m!785069))

(declare-fun m!785071 () Bool)

(assert (=> bm!37370 m!785071))

(declare-fun m!785073 () Bool)

(assert (=> bm!37369 m!785073))

(declare-fun m!785075 () Bool)

(assert (=> b!841715 m!785075))

(declare-fun m!785077 () Bool)

(assert (=> b!841725 m!785077))

(declare-fun m!785079 () Bool)

(assert (=> b!841718 m!785079))

(declare-fun m!785081 () Bool)

(assert (=> start!72528 m!785081))

(declare-fun m!785083 () Bool)

(assert (=> start!72528 m!785083))

(declare-fun m!785085 () Bool)

(assert (=> b!841726 m!785085))

(declare-fun m!785087 () Bool)

(assert (=> mapNonEmpty!24968 m!785087))

(check-sat (not mapNonEmpty!24968) (not bm!37370) (not start!72528) (not bm!37369) b_and!22799 (not b!841718) (not b!841727) (not b!841717) tp_is_empty!15579 (not b_next!13713) (not b!841725) (not b!841726) (not b!841715))
(check-sat b_and!22799 (not b_next!13713))
