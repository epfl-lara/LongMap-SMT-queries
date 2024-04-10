; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73014 () Bool)

(assert start!73014)

(declare-fun b_free!13929 () Bool)

(declare-fun b_next!13929 () Bool)

(assert (=> start!73014 (= b_free!13929 (not b_next!13929))))

(declare-fun tp!49291 () Bool)

(declare-fun b_and!23017 () Bool)

(assert (=> start!73014 (= tp!49291 b_and!23017)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26467 0))(
  ( (V!26468 (val!8080 Int)) )
))
(declare-datatypes ((tuple2!10566 0))(
  ( (tuple2!10567 (_1!5294 (_ BitVec 64)) (_2!5294 V!26467)) )
))
(declare-datatypes ((List!16422 0))(
  ( (Nil!16419) (Cons!16418 (h!17549 tuple2!10566) (t!22797 List!16422)) )
))
(declare-datatypes ((ListLongMap!9335 0))(
  ( (ListLongMap!9336 (toList!4683 List!16422)) )
))
(declare-fun call!37642 () ListLongMap!9335)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48336 0))(
  ( (array!48337 (arr!23199 (Array (_ BitVec 32) (_ BitVec 64))) (size!23639 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48336)

(declare-datatypes ((ValueCell!7593 0))(
  ( (ValueCellFull!7593 (v!10505 V!26467)) (EmptyCell!7593) )
))
(declare-datatypes ((array!48338 0))(
  ( (array!48339 (arr!23200 (Array (_ BitVec 32) ValueCell!7593)) (size!23640 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48338)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!37639 () Bool)

(declare-fun minValue!654 () V!26467)

(declare-fun zeroValue!654 () V!26467)

(declare-fun getCurrentListMapNoExtraKeys!2665 (array!48336 array!48338 (_ BitVec 32) (_ BitVec 32) V!26467 V!26467 (_ BitVec 32) Int) ListLongMap!9335)

(assert (=> bm!37639 (= call!37642 (getCurrentListMapNoExtraKeys!2665 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848486 () Bool)

(declare-fun res!576467 () Bool)

(declare-fun e!473414 () Bool)

(assert (=> b!848486 (=> (not res!576467) (not e!473414))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848486 (= res!576467 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25697 () Bool)

(declare-fun mapRes!25697 () Bool)

(assert (=> mapIsEmpty!25697 mapRes!25697))

(declare-fun b!848487 () Bool)

(declare-fun e!473411 () Bool)

(assert (=> b!848487 (= e!473414 e!473411)))

(declare-fun res!576461 () Bool)

(assert (=> b!848487 (=> (not res!576461) (not e!473411))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848487 (= res!576461 (= from!1053 i!612))))

(declare-fun lt!382030 () array!48338)

(declare-fun lt!382032 () ListLongMap!9335)

(assert (=> b!848487 (= lt!382032 (getCurrentListMapNoExtraKeys!2665 _keys!868 lt!382030 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26467)

(assert (=> b!848487 (= lt!382030 (array!48339 (store (arr!23200 _values!688) i!612 (ValueCellFull!7593 v!557)) (size!23640 _values!688)))))

(declare-fun lt!382033 () ListLongMap!9335)

(assert (=> b!848487 (= lt!382033 (getCurrentListMapNoExtraKeys!2665 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848488 () Bool)

(declare-fun res!576460 () Bool)

(assert (=> b!848488 (=> (not res!576460) (not e!473414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48336 (_ BitVec 32)) Bool)

(assert (=> b!848488 (= res!576460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848489 () Bool)

(declare-fun e!473412 () Bool)

(declare-fun tp_is_empty!16065 () Bool)

(assert (=> b!848489 (= e!473412 tp_is_empty!16065)))

(declare-fun call!37643 () ListLongMap!9335)

(declare-fun e!473413 () Bool)

(declare-fun b!848490 () Bool)

(declare-fun +!2094 (ListLongMap!9335 tuple2!10566) ListLongMap!9335)

(assert (=> b!848490 (= e!473413 (= call!37643 (+!2094 call!37642 (tuple2!10567 k0!854 v!557))))))

(declare-fun b!848491 () Bool)

(declare-fun e!473416 () Bool)

(assert (=> b!848491 (= e!473416 tp_is_empty!16065)))

(declare-fun b!848492 () Bool)

(declare-fun e!473415 () Bool)

(assert (=> b!848492 (= e!473415 true)))

(declare-fun get!12205 (ValueCell!7593 V!26467) V!26467)

(declare-fun dynLambda!985 (Int (_ BitVec 64)) V!26467)

(assert (=> b!848492 (= lt!382032 (+!2094 (getCurrentListMapNoExtraKeys!2665 _keys!868 lt!382030 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10567 (select (arr!23199 _keys!868) from!1053) (get!12205 (select (arr!23200 lt!382030) from!1053) (dynLambda!985 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!37640 () Bool)

(assert (=> bm!37640 (= call!37643 (getCurrentListMapNoExtraKeys!2665 _keys!868 lt!382030 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848493 () Bool)

(assert (=> b!848493 (= e!473413 (= call!37643 call!37642))))

(declare-fun b!848494 () Bool)

(declare-fun res!576464 () Bool)

(assert (=> b!848494 (=> (not res!576464) (not e!473414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848494 (= res!576464 (validMask!0 mask!1196))))

(declare-fun b!848495 () Bool)

(declare-fun res!576458 () Bool)

(assert (=> b!848495 (=> (not res!576458) (not e!473414))))

(declare-datatypes ((List!16423 0))(
  ( (Nil!16420) (Cons!16419 (h!17550 (_ BitVec 64)) (t!22798 List!16423)) )
))
(declare-fun arrayNoDuplicates!0 (array!48336 (_ BitVec 32) List!16423) Bool)

(assert (=> b!848495 (= res!576458 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16420))))

(declare-fun b!848496 () Bool)

(declare-fun res!576465 () Bool)

(assert (=> b!848496 (=> (not res!576465) (not e!473414))))

(assert (=> b!848496 (= res!576465 (and (= (select (arr!23199 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!576463 () Bool)

(assert (=> start!73014 (=> (not res!576463) (not e!473414))))

(assert (=> start!73014 (= res!576463 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23639 _keys!868))))))

(assert (=> start!73014 e!473414))

(assert (=> start!73014 tp_is_empty!16065))

(assert (=> start!73014 true))

(assert (=> start!73014 tp!49291))

(declare-fun array_inv!18418 (array!48336) Bool)

(assert (=> start!73014 (array_inv!18418 _keys!868)))

(declare-fun e!473410 () Bool)

(declare-fun array_inv!18419 (array!48338) Bool)

(assert (=> start!73014 (and (array_inv!18419 _values!688) e!473410)))

(declare-fun mapNonEmpty!25697 () Bool)

(declare-fun tp!49290 () Bool)

(assert (=> mapNonEmpty!25697 (= mapRes!25697 (and tp!49290 e!473416))))

(declare-fun mapKey!25697 () (_ BitVec 32))

(declare-fun mapValue!25697 () ValueCell!7593)

(declare-fun mapRest!25697 () (Array (_ BitVec 32) ValueCell!7593))

(assert (=> mapNonEmpty!25697 (= (arr!23200 _values!688) (store mapRest!25697 mapKey!25697 mapValue!25697))))

(declare-fun b!848497 () Bool)

(assert (=> b!848497 (= e!473410 (and e!473412 mapRes!25697))))

(declare-fun condMapEmpty!25697 () Bool)

(declare-fun mapDefault!25697 () ValueCell!7593)

(assert (=> b!848497 (= condMapEmpty!25697 (= (arr!23200 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7593)) mapDefault!25697)))))

(declare-fun b!848498 () Bool)

(declare-fun res!576459 () Bool)

(assert (=> b!848498 (=> (not res!576459) (not e!473414))))

(assert (=> b!848498 (= res!576459 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23639 _keys!868))))))

(declare-fun b!848499 () Bool)

(declare-fun res!576466 () Bool)

(assert (=> b!848499 (=> (not res!576466) (not e!473414))))

(assert (=> b!848499 (= res!576466 (and (= (size!23640 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23639 _keys!868) (size!23640 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848500 () Bool)

(assert (=> b!848500 (= e!473411 (not e!473415))))

(declare-fun res!576462 () Bool)

(assert (=> b!848500 (=> res!576462 e!473415)))

(assert (=> b!848500 (= res!576462 (not (validKeyInArray!0 (select (arr!23199 _keys!868) from!1053))))))

(assert (=> b!848500 e!473413))

(declare-fun c!91564 () Bool)

(assert (=> b!848500 (= c!91564 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28977 0))(
  ( (Unit!28978) )
))
(declare-fun lt!382031 () Unit!28977)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!334 (array!48336 array!48338 (_ BitVec 32) (_ BitVec 32) V!26467 V!26467 (_ BitVec 32) (_ BitVec 64) V!26467 (_ BitVec 32) Int) Unit!28977)

(assert (=> b!848500 (= lt!382031 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!334 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73014 res!576463) b!848494))

(assert (= (and b!848494 res!576464) b!848499))

(assert (= (and b!848499 res!576466) b!848488))

(assert (= (and b!848488 res!576460) b!848495))

(assert (= (and b!848495 res!576458) b!848498))

(assert (= (and b!848498 res!576459) b!848486))

(assert (= (and b!848486 res!576467) b!848496))

(assert (= (and b!848496 res!576465) b!848487))

(assert (= (and b!848487 res!576461) b!848500))

(assert (= (and b!848500 c!91564) b!848490))

(assert (= (and b!848500 (not c!91564)) b!848493))

(assert (= (or b!848490 b!848493) bm!37639))

(assert (= (or b!848490 b!848493) bm!37640))

(assert (= (and b!848500 (not res!576462)) b!848492))

(assert (= (and b!848497 condMapEmpty!25697) mapIsEmpty!25697))

(assert (= (and b!848497 (not condMapEmpty!25697)) mapNonEmpty!25697))

(get-info :version)

(assert (= (and mapNonEmpty!25697 ((_ is ValueCellFull!7593) mapValue!25697)) b!848491))

(assert (= (and b!848497 ((_ is ValueCellFull!7593) mapDefault!25697)) b!848489))

(assert (= start!73014 b!848497))

(declare-fun b_lambda!11461 () Bool)

(assert (=> (not b_lambda!11461) (not b!848492)))

(declare-fun t!22796 () Bool)

(declare-fun tb!4231 () Bool)

(assert (=> (and start!73014 (= defaultEntry!696 defaultEntry!696) t!22796) tb!4231))

(declare-fun result!8073 () Bool)

(assert (=> tb!4231 (= result!8073 tp_is_empty!16065)))

(assert (=> b!848492 t!22796))

(declare-fun b_and!23019 () Bool)

(assert (= b_and!23017 (and (=> t!22796 result!8073) b_and!23019)))

(declare-fun m!789267 () Bool)

(assert (=> b!848492 m!789267))

(declare-fun m!789269 () Bool)

(assert (=> b!848492 m!789269))

(assert (=> b!848492 m!789267))

(declare-fun m!789271 () Bool)

(assert (=> b!848492 m!789271))

(declare-fun m!789273 () Bool)

(assert (=> b!848492 m!789273))

(declare-fun m!789275 () Bool)

(assert (=> b!848492 m!789275))

(assert (=> b!848492 m!789271))

(declare-fun m!789277 () Bool)

(assert (=> b!848492 m!789277))

(assert (=> b!848492 m!789273))

(assert (=> bm!37640 m!789267))

(declare-fun m!789279 () Bool)

(assert (=> b!848496 m!789279))

(declare-fun m!789281 () Bool)

(assert (=> b!848495 m!789281))

(declare-fun m!789283 () Bool)

(assert (=> start!73014 m!789283))

(declare-fun m!789285 () Bool)

(assert (=> start!73014 m!789285))

(declare-fun m!789287 () Bool)

(assert (=> b!848488 m!789287))

(declare-fun m!789289 () Bool)

(assert (=> mapNonEmpty!25697 m!789289))

(declare-fun m!789291 () Bool)

(assert (=> b!848494 m!789291))

(assert (=> b!848500 m!789277))

(assert (=> b!848500 m!789277))

(declare-fun m!789293 () Bool)

(assert (=> b!848500 m!789293))

(declare-fun m!789295 () Bool)

(assert (=> b!848500 m!789295))

(declare-fun m!789297 () Bool)

(assert (=> b!848487 m!789297))

(declare-fun m!789299 () Bool)

(assert (=> b!848487 m!789299))

(declare-fun m!789301 () Bool)

(assert (=> b!848487 m!789301))

(declare-fun m!789303 () Bool)

(assert (=> b!848490 m!789303))

(declare-fun m!789305 () Bool)

(assert (=> b!848486 m!789305))

(declare-fun m!789307 () Bool)

(assert (=> bm!37639 m!789307))

(check-sat (not b!848487) (not bm!37640) (not b!848500) (not start!73014) b_and!23019 (not bm!37639) (not b!848492) (not b_lambda!11461) (not b_next!13929) (not b!848495) (not b!848494) (not b!848486) (not b!848490) (not mapNonEmpty!25697) tp_is_empty!16065 (not b!848488))
(check-sat b_and!23019 (not b_next!13929))
