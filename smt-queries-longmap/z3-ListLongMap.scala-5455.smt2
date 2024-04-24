; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72682 () Bool)

(assert start!72682)

(declare-fun b_free!13699 () Bool)

(declare-fun b_next!13699 () Bool)

(assert (=> start!72682 (= b_free!13699 (not b_next!13699))))

(declare-fun tp!48196 () Bool)

(declare-fun b_and!22795 () Bool)

(assert (=> start!72682 (= tp!48196 b_and!22795)))

(declare-fun b!842345 () Bool)

(declare-fun res!572326 () Bool)

(declare-fun e!469989 () Bool)

(assert (=> b!842345 (=> (not res!572326) (not e!469989))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47423 0))(
  ( (array!47424 (arr!22738 (Array (_ BitVec 32) (_ BitVec 64))) (size!23179 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47423)

(assert (=> b!842345 (= res!572326 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23179 _keys!868))))))

(declare-fun b!842346 () Bool)

(declare-fun e!469990 () Bool)

(declare-fun tp_is_empty!15565 () Bool)

(assert (=> b!842346 (= e!469990 tp_is_empty!15565)))

(declare-fun b!842347 () Bool)

(declare-fun res!572323 () Bool)

(assert (=> b!842347 (=> (not res!572323) (not e!469989))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842347 (= res!572323 (validKeyInArray!0 k0!854))))

(declare-fun b!842348 () Bool)

(declare-fun res!572329 () Bool)

(assert (=> b!842348 (=> (not res!572329) (not e!469989))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842348 (= res!572329 (validMask!0 mask!1196))))

(declare-fun b!842349 () Bool)

(declare-fun res!572324 () Bool)

(assert (=> b!842349 (=> (not res!572324) (not e!469989))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25801 0))(
  ( (V!25802 (val!7830 Int)) )
))
(declare-datatypes ((ValueCell!7343 0))(
  ( (ValueCellFull!7343 (v!10255 V!25801)) (EmptyCell!7343) )
))
(declare-datatypes ((array!47425 0))(
  ( (array!47426 (arr!22739 (Array (_ BitVec 32) ValueCell!7343)) (size!23180 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47425)

(assert (=> b!842349 (= res!572324 (and (= (size!23180 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23179 _keys!868) (size!23180 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842350 () Bool)

(declare-fun res!572322 () Bool)

(assert (=> b!842350 (=> (not res!572322) (not e!469989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47423 (_ BitVec 32)) Bool)

(assert (=> b!842350 (= res!572322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842351 () Bool)

(declare-fun res!572328 () Bool)

(assert (=> b!842351 (=> (not res!572328) (not e!469989))))

(declare-datatypes ((List!16090 0))(
  ( (Nil!16087) (Cons!16086 (h!17223 (_ BitVec 64)) (t!22453 List!16090)) )
))
(declare-fun arrayNoDuplicates!0 (array!47423 (_ BitVec 32) List!16090) Bool)

(assert (=> b!842351 (= res!572328 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16087))))

(declare-fun v!557 () V!25801)

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37372 () Bool)

(declare-datatypes ((tuple2!10318 0))(
  ( (tuple2!10319 (_1!5170 (_ BitVec 64)) (_2!5170 V!25801)) )
))
(declare-datatypes ((List!16091 0))(
  ( (Nil!16088) (Cons!16087 (h!17224 tuple2!10318) (t!22454 List!16091)) )
))
(declare-datatypes ((ListLongMap!9089 0))(
  ( (ListLongMap!9090 (toList!4560 List!16091)) )
))
(declare-fun call!37375 () ListLongMap!9089)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25801)

(declare-fun zeroValue!654 () V!25801)

(declare-fun getCurrentListMapNoExtraKeys!2619 (array!47423 array!47425 (_ BitVec 32) (_ BitVec 32) V!25801 V!25801 (_ BitVec 32) Int) ListLongMap!9089)

(assert (=> bm!37372 (= call!37375 (getCurrentListMapNoExtraKeys!2619 _keys!868 (array!47426 (store (arr!22739 _values!688) i!612 (ValueCellFull!7343 v!557)) (size!23180 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!572327 () Bool)

(assert (=> start!72682 (=> (not res!572327) (not e!469989))))

(assert (=> start!72682 (= res!572327 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23179 _keys!868))))))

(assert (=> start!72682 e!469989))

(assert (=> start!72682 tp_is_empty!15565))

(assert (=> start!72682 true))

(assert (=> start!72682 tp!48196))

(declare-fun array_inv!18142 (array!47423) Bool)

(assert (=> start!72682 (array_inv!18142 _keys!868)))

(declare-fun e!469986 () Bool)

(declare-fun array_inv!18143 (array!47425) Bool)

(assert (=> start!72682 (and (array_inv!18143 _values!688) e!469986)))

(declare-fun mapNonEmpty!24947 () Bool)

(declare-fun mapRes!24947 () Bool)

(declare-fun tp!48197 () Bool)

(declare-fun e!469985 () Bool)

(assert (=> mapNonEmpty!24947 (= mapRes!24947 (and tp!48197 e!469985))))

(declare-fun mapValue!24947 () ValueCell!7343)

(declare-fun mapRest!24947 () (Array (_ BitVec 32) ValueCell!7343))

(declare-fun mapKey!24947 () (_ BitVec 32))

(assert (=> mapNonEmpty!24947 (= (arr!22739 _values!688) (store mapRest!24947 mapKey!24947 mapValue!24947))))

(declare-fun mapIsEmpty!24947 () Bool)

(assert (=> mapIsEmpty!24947 mapRes!24947))

(declare-fun b!842352 () Bool)

(assert (=> b!842352 (= e!469985 tp_is_empty!15565)))

(declare-fun bm!37373 () Bool)

(declare-fun call!37376 () ListLongMap!9089)

(assert (=> bm!37373 (= call!37376 (getCurrentListMapNoExtraKeys!2619 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842353 () Bool)

(declare-fun e!469987 () Bool)

(declare-fun +!2066 (ListLongMap!9089 tuple2!10318) ListLongMap!9089)

(assert (=> b!842353 (= e!469987 (= call!37375 (+!2066 call!37376 (tuple2!10319 k0!854 v!557))))))

(declare-fun b!842354 () Bool)

(assert (=> b!842354 (= e!469987 (= call!37375 call!37376))))

(declare-fun b!842355 () Bool)

(declare-fun res!572325 () Bool)

(assert (=> b!842355 (=> (not res!572325) (not e!469989))))

(assert (=> b!842355 (= res!572325 (and (= (select (arr!22738 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23179 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842356 () Bool)

(assert (=> b!842356 (= e!469986 (and e!469990 mapRes!24947))))

(declare-fun condMapEmpty!24947 () Bool)

(declare-fun mapDefault!24947 () ValueCell!7343)

(assert (=> b!842356 (= condMapEmpty!24947 (= (arr!22739 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7343)) mapDefault!24947)))))

(declare-fun b!842357 () Bool)

(assert (=> b!842357 (= e!469989 (not true))))

(assert (=> b!842357 e!469987))

(declare-fun c!91690 () Bool)

(assert (=> b!842357 (= c!91690 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28918 0))(
  ( (Unit!28919) )
))
(declare-fun lt!381275 () Unit!28918)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!295 (array!47423 array!47425 (_ BitVec 32) (_ BitVec 32) V!25801 V!25801 (_ BitVec 32) (_ BitVec 64) V!25801 (_ BitVec 32) Int) Unit!28918)

(assert (=> b!842357 (= lt!381275 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!295 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72682 res!572327) b!842348))

(assert (= (and b!842348 res!572329) b!842349))

(assert (= (and b!842349 res!572324) b!842350))

(assert (= (and b!842350 res!572322) b!842351))

(assert (= (and b!842351 res!572328) b!842345))

(assert (= (and b!842345 res!572326) b!842347))

(assert (= (and b!842347 res!572323) b!842355))

(assert (= (and b!842355 res!572325) b!842357))

(assert (= (and b!842357 c!91690) b!842353))

(assert (= (and b!842357 (not c!91690)) b!842354))

(assert (= (or b!842353 b!842354) bm!37372))

(assert (= (or b!842353 b!842354) bm!37373))

(assert (= (and b!842356 condMapEmpty!24947) mapIsEmpty!24947))

(assert (= (and b!842356 (not condMapEmpty!24947)) mapNonEmpty!24947))

(get-info :version)

(assert (= (and mapNonEmpty!24947 ((_ is ValueCellFull!7343) mapValue!24947)) b!842352))

(assert (= (and b!842356 ((_ is ValueCellFull!7343) mapDefault!24947)) b!842346))

(assert (= start!72682 b!842356))

(declare-fun m!786173 () Bool)

(assert (=> start!72682 m!786173))

(declare-fun m!786175 () Bool)

(assert (=> start!72682 m!786175))

(declare-fun m!786177 () Bool)

(assert (=> b!842351 m!786177))

(declare-fun m!786179 () Bool)

(assert (=> bm!37373 m!786179))

(declare-fun m!786181 () Bool)

(assert (=> b!842357 m!786181))

(declare-fun m!786183 () Bool)

(assert (=> b!842347 m!786183))

(declare-fun m!786185 () Bool)

(assert (=> mapNonEmpty!24947 m!786185))

(declare-fun m!786187 () Bool)

(assert (=> b!842348 m!786187))

(declare-fun m!786189 () Bool)

(assert (=> b!842353 m!786189))

(declare-fun m!786191 () Bool)

(assert (=> bm!37372 m!786191))

(declare-fun m!786193 () Bool)

(assert (=> bm!37372 m!786193))

(declare-fun m!786195 () Bool)

(assert (=> b!842355 m!786195))

(declare-fun m!786197 () Bool)

(assert (=> b!842350 m!786197))

(check-sat (not b!842348) (not mapNonEmpty!24947) (not b!842350) (not b!842347) (not bm!37373) b_and!22795 (not bm!37372) (not b!842357) (not b!842353) (not b!842351) (not b_next!13699) tp_is_empty!15565 (not start!72682))
(check-sat b_and!22795 (not b_next!13699))
