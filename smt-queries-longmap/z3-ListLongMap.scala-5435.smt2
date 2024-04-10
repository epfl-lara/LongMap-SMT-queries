; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72396 () Bool)

(assert start!72396)

(declare-fun b_free!13581 () Bool)

(declare-fun b_next!13581 () Bool)

(assert (=> start!72396 (= b_free!13581 (not b_next!13581))))

(declare-fun tp!47841 () Bool)

(declare-fun b_and!22667 () Bool)

(assert (=> start!72396 (= tp!47841 b_and!22667)))

(declare-fun b!839141 () Bool)

(declare-fun e!468346 () Bool)

(declare-fun e!468344 () Bool)

(declare-fun mapRes!24770 () Bool)

(assert (=> b!839141 (= e!468346 (and e!468344 mapRes!24770))))

(declare-fun condMapEmpty!24770 () Bool)

(declare-datatypes ((V!25643 0))(
  ( (V!25644 (val!7771 Int)) )
))
(declare-datatypes ((ValueCell!7284 0))(
  ( (ValueCellFull!7284 (v!10196 V!25643)) (EmptyCell!7284) )
))
(declare-datatypes ((array!47178 0))(
  ( (array!47179 (arr!22620 (Array (_ BitVec 32) ValueCell!7284)) (size!23060 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47178)

(declare-fun mapDefault!24770 () ValueCell!7284)

(assert (=> b!839141 (= condMapEmpty!24770 (= (arr!22620 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7284)) mapDefault!24770)))))

(declare-fun b!839142 () Bool)

(declare-fun res!570566 () Bool)

(declare-fun e!468345 () Bool)

(assert (=> b!839142 (=> (not res!570566) (not e!468345))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839142 (= res!570566 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24770 () Bool)

(declare-fun tp!47842 () Bool)

(declare-fun e!468342 () Bool)

(assert (=> mapNonEmpty!24770 (= mapRes!24770 (and tp!47842 e!468342))))

(declare-fun mapValue!24770 () ValueCell!7284)

(declare-fun mapKey!24770 () (_ BitVec 32))

(declare-fun mapRest!24770 () (Array (_ BitVec 32) ValueCell!7284))

(assert (=> mapNonEmpty!24770 (= (arr!22620 _values!688) (store mapRest!24770 mapKey!24770 mapValue!24770))))

(declare-fun b!839143 () Bool)

(declare-fun res!570569 () Bool)

(assert (=> b!839143 (=> (not res!570569) (not e!468345))))

(declare-datatypes ((array!47180 0))(
  ( (array!47181 (arr!22621 (Array (_ BitVec 32) (_ BitVec 64))) (size!23061 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47180)

(declare-datatypes ((List!16083 0))(
  ( (Nil!16080) (Cons!16079 (h!17210 (_ BitVec 64)) (t!22454 List!16083)) )
))
(declare-fun arrayNoDuplicates!0 (array!47180 (_ BitVec 32) List!16083) Bool)

(assert (=> b!839143 (= res!570569 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16080))))

(declare-fun res!570565 () Bool)

(assert (=> start!72396 (=> (not res!570565) (not e!468345))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72396 (= res!570565 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23061 _keys!868))))))

(assert (=> start!72396 e!468345))

(declare-fun tp_is_empty!15447 () Bool)

(assert (=> start!72396 tp_is_empty!15447))

(assert (=> start!72396 true))

(assert (=> start!72396 tp!47841))

(declare-fun array_inv!18020 (array!47180) Bool)

(assert (=> start!72396 (array_inv!18020 _keys!868)))

(declare-fun array_inv!18021 (array!47178) Bool)

(assert (=> start!72396 (and (array_inv!18021 _values!688) e!468346)))

(declare-fun mapIsEmpty!24770 () Bool)

(assert (=> mapIsEmpty!24770 mapRes!24770))

(declare-fun b!839144 () Bool)

(assert (=> b!839144 (= e!468344 tp_is_empty!15447)))

(declare-fun b!839145 () Bool)

(declare-fun e!468341 () Bool)

(declare-datatypes ((tuple2!10282 0))(
  ( (tuple2!10283 (_1!5152 (_ BitVec 64)) (_2!5152 V!25643)) )
))
(declare-datatypes ((List!16084 0))(
  ( (Nil!16081) (Cons!16080 (h!17211 tuple2!10282) (t!22455 List!16084)) )
))
(declare-datatypes ((ListLongMap!9051 0))(
  ( (ListLongMap!9052 (toList!4541 List!16084)) )
))
(declare-fun call!36976 () ListLongMap!9051)

(declare-fun call!36977 () ListLongMap!9051)

(assert (=> b!839145 (= e!468341 (= call!36976 call!36977))))

(declare-fun b!839146 () Bool)

(assert (=> b!839146 (= e!468345 (not true))))

(assert (=> b!839146 e!468341))

(declare-fun c!91231 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839146 (= c!91231 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25643)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!25643)

(declare-fun zeroValue!654 () V!25643)

(declare-datatypes ((Unit!28819 0))(
  ( (Unit!28820) )
))
(declare-fun lt!380737 () Unit!28819)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!255 (array!47180 array!47178 (_ BitVec 32) (_ BitVec 32) V!25643 V!25643 (_ BitVec 32) (_ BitVec 64) V!25643 (_ BitVec 32) Int) Unit!28819)

(assert (=> b!839146 (= lt!380737 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!255 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!36973 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2533 (array!47180 array!47178 (_ BitVec 32) (_ BitVec 32) V!25643 V!25643 (_ BitVec 32) Int) ListLongMap!9051)

(assert (=> bm!36973 (= call!36977 (getCurrentListMapNoExtraKeys!2533 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839147 () Bool)

(declare-fun res!570563 () Bool)

(assert (=> b!839147 (=> (not res!570563) (not e!468345))))

(assert (=> b!839147 (= res!570563 (and (= (select (arr!22621 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23061 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839148 () Bool)

(declare-fun +!2014 (ListLongMap!9051 tuple2!10282) ListLongMap!9051)

(assert (=> b!839148 (= e!468341 (= call!36976 (+!2014 call!36977 (tuple2!10283 k0!854 v!557))))))

(declare-fun b!839149 () Bool)

(declare-fun res!570564 () Bool)

(assert (=> b!839149 (=> (not res!570564) (not e!468345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47180 (_ BitVec 32)) Bool)

(assert (=> b!839149 (= res!570564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!36974 () Bool)

(assert (=> bm!36974 (= call!36976 (getCurrentListMapNoExtraKeys!2533 _keys!868 (array!47179 (store (arr!22620 _values!688) i!612 (ValueCellFull!7284 v!557)) (size!23060 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839150 () Bool)

(declare-fun res!570568 () Bool)

(assert (=> b!839150 (=> (not res!570568) (not e!468345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839150 (= res!570568 (validKeyInArray!0 k0!854))))

(declare-fun b!839151 () Bool)

(assert (=> b!839151 (= e!468342 tp_is_empty!15447)))

(declare-fun b!839152 () Bool)

(declare-fun res!570567 () Bool)

(assert (=> b!839152 (=> (not res!570567) (not e!468345))))

(assert (=> b!839152 (= res!570567 (and (= (size!23060 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23061 _keys!868) (size!23060 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839153 () Bool)

(declare-fun res!570562 () Bool)

(assert (=> b!839153 (=> (not res!570562) (not e!468345))))

(assert (=> b!839153 (= res!570562 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23061 _keys!868))))))

(assert (= (and start!72396 res!570565) b!839142))

(assert (= (and b!839142 res!570566) b!839152))

(assert (= (and b!839152 res!570567) b!839149))

(assert (= (and b!839149 res!570564) b!839143))

(assert (= (and b!839143 res!570569) b!839153))

(assert (= (and b!839153 res!570562) b!839150))

(assert (= (and b!839150 res!570568) b!839147))

(assert (= (and b!839147 res!570563) b!839146))

(assert (= (and b!839146 c!91231) b!839148))

(assert (= (and b!839146 (not c!91231)) b!839145))

(assert (= (or b!839148 b!839145) bm!36974))

(assert (= (or b!839148 b!839145) bm!36973))

(assert (= (and b!839141 condMapEmpty!24770) mapIsEmpty!24770))

(assert (= (and b!839141 (not condMapEmpty!24770)) mapNonEmpty!24770))

(get-info :version)

(assert (= (and mapNonEmpty!24770 ((_ is ValueCellFull!7284) mapValue!24770)) b!839151))

(assert (= (and b!839141 ((_ is ValueCellFull!7284) mapDefault!24770)) b!839144))

(assert (= start!72396 b!839141))

(declare-fun m!783347 () Bool)

(assert (=> b!839148 m!783347))

(declare-fun m!783349 () Bool)

(assert (=> start!72396 m!783349))

(declare-fun m!783351 () Bool)

(assert (=> start!72396 m!783351))

(declare-fun m!783353 () Bool)

(assert (=> bm!36973 m!783353))

(declare-fun m!783355 () Bool)

(assert (=> b!839150 m!783355))

(declare-fun m!783357 () Bool)

(assert (=> b!839149 m!783357))

(declare-fun m!783359 () Bool)

(assert (=> b!839142 m!783359))

(declare-fun m!783361 () Bool)

(assert (=> b!839146 m!783361))

(declare-fun m!783363 () Bool)

(assert (=> bm!36974 m!783363))

(declare-fun m!783365 () Bool)

(assert (=> bm!36974 m!783365))

(declare-fun m!783367 () Bool)

(assert (=> b!839143 m!783367))

(declare-fun m!783369 () Bool)

(assert (=> mapNonEmpty!24770 m!783369))

(declare-fun m!783371 () Bool)

(assert (=> b!839147 m!783371))

(check-sat (not b!839143) (not mapNonEmpty!24770) (not b!839150) (not b!839148) (not b!839146) (not b_next!13581) tp_is_empty!15447 (not start!72396) b_and!22667 (not b!839142) (not b!839149) (not bm!36974) (not bm!36973))
(check-sat b_and!22667 (not b_next!13581))
