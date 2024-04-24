; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72634 () Bool)

(assert start!72634)

(declare-fun b_free!13651 () Bool)

(declare-fun b_next!13651 () Bool)

(assert (=> start!72634 (= b_free!13651 (not b_next!13651))))

(declare-fun tp!48053 () Bool)

(declare-fun b_and!22747 () Bool)

(assert (=> start!72634 (= tp!48053 b_and!22747)))

(declare-fun b!841409 () Bool)

(declare-fun e!469553 () Bool)

(declare-fun tp_is_empty!15517 () Bool)

(assert (=> b!841409 (= e!469553 tp_is_empty!15517)))

(declare-fun b!841410 () Bool)

(declare-fun e!469555 () Bool)

(declare-datatypes ((V!25737 0))(
  ( (V!25738 (val!7806 Int)) )
))
(declare-datatypes ((tuple2!10274 0))(
  ( (tuple2!10275 (_1!5148 (_ BitVec 64)) (_2!5148 V!25737)) )
))
(declare-datatypes ((List!16049 0))(
  ( (Nil!16046) (Cons!16045 (h!17182 tuple2!10274) (t!22412 List!16049)) )
))
(declare-datatypes ((ListLongMap!9045 0))(
  ( (ListLongMap!9046 (toList!4538 List!16049)) )
))
(declare-fun call!37231 () ListLongMap!9045)

(declare-fun call!37232 () ListLongMap!9045)

(assert (=> b!841410 (= e!469555 (= call!37231 call!37232))))

(declare-fun b!841411 () Bool)

(declare-fun res!571753 () Bool)

(declare-fun e!469558 () Bool)

(assert (=> b!841411 (=> (not res!571753) (not e!469558))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841411 (= res!571753 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!24875 () Bool)

(declare-fun mapRes!24875 () Bool)

(declare-fun tp!48052 () Bool)

(declare-fun e!469557 () Bool)

(assert (=> mapNonEmpty!24875 (= mapRes!24875 (and tp!48052 e!469557))))

(declare-fun mapKey!24875 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7319 0))(
  ( (ValueCellFull!7319 (v!10231 V!25737)) (EmptyCell!7319) )
))
(declare-fun mapRest!24875 () (Array (_ BitVec 32) ValueCell!7319))

(declare-fun mapValue!24875 () ValueCell!7319)

(declare-datatypes ((array!47327 0))(
  ( (array!47328 (arr!22690 (Array (_ BitVec 32) ValueCell!7319)) (size!23131 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47327)

(assert (=> mapNonEmpty!24875 (= (arr!22690 _values!688) (store mapRest!24875 mapKey!24875 mapValue!24875))))

(declare-fun v!557 () V!25737)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37228 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47329 0))(
  ( (array!47330 (arr!22691 (Array (_ BitVec 32) (_ BitVec 64))) (size!23132 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47329)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25737)

(declare-fun zeroValue!654 () V!25737)

(declare-fun getCurrentListMapNoExtraKeys!2599 (array!47329 array!47327 (_ BitVec 32) (_ BitVec 32) V!25737 V!25737 (_ BitVec 32) Int) ListLongMap!9045)

(assert (=> bm!37228 (= call!37231 (getCurrentListMapNoExtraKeys!2599 _keys!868 (array!47328 (store (arr!22690 _values!688) i!612 (ValueCellFull!7319 v!557)) (size!23131 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841412 () Bool)

(declare-fun res!571750 () Bool)

(assert (=> b!841412 (=> (not res!571750) (not e!469558))))

(assert (=> b!841412 (= res!571750 (and (= (size!23131 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23132 _keys!868) (size!23131 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841413 () Bool)

(declare-fun res!571752 () Bool)

(assert (=> b!841413 (=> (not res!571752) (not e!469558))))

(assert (=> b!841413 (= res!571752 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23132 _keys!868))))))

(declare-fun b!841414 () Bool)

(assert (=> b!841414 (= e!469558 (not true))))

(assert (=> b!841414 e!469555))

(declare-fun c!91618 () Bool)

(assert (=> b!841414 (= c!91618 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28882 0))(
  ( (Unit!28883) )
))
(declare-fun lt!381203 () Unit!28882)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!277 (array!47329 array!47327 (_ BitVec 32) (_ BitVec 32) V!25737 V!25737 (_ BitVec 32) (_ BitVec 64) V!25737 (_ BitVec 32) Int) Unit!28882)

(assert (=> b!841414 (= lt!381203 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!277 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841415 () Bool)

(assert (=> b!841415 (= e!469557 tp_is_empty!15517)))

(declare-fun b!841416 () Bool)

(declare-fun res!571748 () Bool)

(assert (=> b!841416 (=> (not res!571748) (not e!469558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841416 (= res!571748 (validMask!0 mask!1196))))

(declare-fun b!841417 () Bool)

(declare-fun res!571751 () Bool)

(assert (=> b!841417 (=> (not res!571751) (not e!469558))))

(declare-datatypes ((List!16050 0))(
  ( (Nil!16047) (Cons!16046 (h!17183 (_ BitVec 64)) (t!22413 List!16050)) )
))
(declare-fun arrayNoDuplicates!0 (array!47329 (_ BitVec 32) List!16050) Bool)

(assert (=> b!841417 (= res!571751 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16047))))

(declare-fun mapIsEmpty!24875 () Bool)

(assert (=> mapIsEmpty!24875 mapRes!24875))

(declare-fun b!841418 () Bool)

(declare-fun res!571746 () Bool)

(assert (=> b!841418 (=> (not res!571746) (not e!469558))))

(assert (=> b!841418 (= res!571746 (and (= (select (arr!22691 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23132 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841420 () Bool)

(declare-fun e!469554 () Bool)

(assert (=> b!841420 (= e!469554 (and e!469553 mapRes!24875))))

(declare-fun condMapEmpty!24875 () Bool)

(declare-fun mapDefault!24875 () ValueCell!7319)

(assert (=> b!841420 (= condMapEmpty!24875 (= (arr!22690 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7319)) mapDefault!24875)))))

(declare-fun res!571749 () Bool)

(assert (=> start!72634 (=> (not res!571749) (not e!469558))))

(assert (=> start!72634 (= res!571749 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23132 _keys!868))))))

(assert (=> start!72634 e!469558))

(assert (=> start!72634 tp_is_empty!15517))

(assert (=> start!72634 true))

(assert (=> start!72634 tp!48053))

(declare-fun array_inv!18102 (array!47329) Bool)

(assert (=> start!72634 (array_inv!18102 _keys!868)))

(declare-fun array_inv!18103 (array!47327) Bool)

(assert (=> start!72634 (and (array_inv!18103 _values!688) e!469554)))

(declare-fun b!841419 () Bool)

(declare-fun res!571747 () Bool)

(assert (=> b!841419 (=> (not res!571747) (not e!469558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47329 (_ BitVec 32)) Bool)

(assert (=> b!841419 (= res!571747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841421 () Bool)

(declare-fun +!2047 (ListLongMap!9045 tuple2!10274) ListLongMap!9045)

(assert (=> b!841421 (= e!469555 (= call!37231 (+!2047 call!37232 (tuple2!10275 k0!854 v!557))))))

(declare-fun bm!37229 () Bool)

(assert (=> bm!37229 (= call!37232 (getCurrentListMapNoExtraKeys!2599 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72634 res!571749) b!841416))

(assert (= (and b!841416 res!571748) b!841412))

(assert (= (and b!841412 res!571750) b!841419))

(assert (= (and b!841419 res!571747) b!841417))

(assert (= (and b!841417 res!571751) b!841413))

(assert (= (and b!841413 res!571752) b!841411))

(assert (= (and b!841411 res!571753) b!841418))

(assert (= (and b!841418 res!571746) b!841414))

(assert (= (and b!841414 c!91618) b!841421))

(assert (= (and b!841414 (not c!91618)) b!841410))

(assert (= (or b!841421 b!841410) bm!37228))

(assert (= (or b!841421 b!841410) bm!37229))

(assert (= (and b!841420 condMapEmpty!24875) mapIsEmpty!24875))

(assert (= (and b!841420 (not condMapEmpty!24875)) mapNonEmpty!24875))

(get-info :version)

(assert (= (and mapNonEmpty!24875 ((_ is ValueCellFull!7319) mapValue!24875)) b!841415))

(assert (= (and b!841420 ((_ is ValueCellFull!7319) mapDefault!24875)) b!841409))

(assert (= start!72634 b!841420))

(declare-fun m!785549 () Bool)

(assert (=> start!72634 m!785549))

(declare-fun m!785551 () Bool)

(assert (=> start!72634 m!785551))

(declare-fun m!785553 () Bool)

(assert (=> mapNonEmpty!24875 m!785553))

(declare-fun m!785555 () Bool)

(assert (=> b!841417 m!785555))

(declare-fun m!785557 () Bool)

(assert (=> b!841418 m!785557))

(declare-fun m!785559 () Bool)

(assert (=> b!841421 m!785559))

(declare-fun m!785561 () Bool)

(assert (=> b!841416 m!785561))

(declare-fun m!785563 () Bool)

(assert (=> bm!37228 m!785563))

(declare-fun m!785565 () Bool)

(assert (=> bm!37228 m!785565))

(declare-fun m!785567 () Bool)

(assert (=> b!841411 m!785567))

(declare-fun m!785569 () Bool)

(assert (=> b!841419 m!785569))

(declare-fun m!785571 () Bool)

(assert (=> b!841414 m!785571))

(declare-fun m!785573 () Bool)

(assert (=> bm!37229 m!785573))

(check-sat (not b!841417) (not bm!37228) (not b!841414) b_and!22747 tp_is_empty!15517 (not b!841411) (not b!841416) (not bm!37229) (not b_next!13651) (not start!72634) (not b!841419) (not mapNonEmpty!24875) (not b!841421))
(check-sat b_and!22747 (not b_next!13651))
