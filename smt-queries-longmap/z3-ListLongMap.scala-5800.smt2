; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74982 () Bool)

(assert start!74982)

(declare-fun b_free!15391 () Bool)

(declare-fun b_next!15391 () Bool)

(assert (=> start!74982 (= b_free!15391 (not b_next!15391))))

(declare-fun tp!53870 () Bool)

(declare-fun b_and!25459 () Bool)

(assert (=> start!74982 (= tp!53870 b_and!25459)))

(declare-fun b!882943 () Bool)

(declare-fun e!491457 () Bool)

(declare-fun e!491458 () Bool)

(assert (=> b!882943 (= e!491457 e!491458)))

(declare-fun res!599579 () Bool)

(assert (=> b!882943 (=> res!599579 e!491458)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51435 0))(
  ( (array!51436 (arr!24734 (Array (_ BitVec 32) (_ BitVec 64))) (size!25175 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51435)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!882943 (= res!599579 (not (= (select (arr!24734 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28561 0))(
  ( (V!28562 (val!8865 Int)) )
))
(declare-datatypes ((tuple2!11678 0))(
  ( (tuple2!11679 (_1!5850 (_ BitVec 64)) (_2!5850 V!28561)) )
))
(declare-datatypes ((List!17507 0))(
  ( (Nil!17504) (Cons!17503 (h!18640 tuple2!11678) (t!24692 List!17507)) )
))
(declare-datatypes ((ListLongMap!10449 0))(
  ( (ListLongMap!10450 (toList!5240 List!17507)) )
))
(declare-fun lt!399383 () ListLongMap!10449)

(declare-fun lt!399388 () ListLongMap!10449)

(declare-datatypes ((ValueCell!8378 0))(
  ( (ValueCellFull!8378 (v!11325 V!28561)) (EmptyCell!8378) )
))
(declare-datatypes ((array!51437 0))(
  ( (array!51438 (arr!24735 (Array (_ BitVec 32) ValueCell!8378)) (size!25176 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51437)

(declare-fun +!2555 (ListLongMap!10449 tuple2!11678) ListLongMap!10449)

(declare-fun get!13039 (ValueCell!8378 V!28561) V!28561)

(declare-fun dynLambda!1274 (Int (_ BitVec 64)) V!28561)

(assert (=> b!882943 (= lt!399383 (+!2555 lt!399388 (tuple2!11679 (select (arr!24734 _keys!868) from!1053) (get!13039 (select (arr!24735 _values!688) from!1053) (dynLambda!1274 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882944 () Bool)

(declare-fun res!599582 () Bool)

(declare-fun e!491461 () Bool)

(assert (=> b!882944 (=> (not res!599582) (not e!491461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882944 (= res!599582 (validKeyInArray!0 k0!854))))

(declare-fun b!882945 () Bool)

(declare-fun e!491460 () Bool)

(declare-fun tp_is_empty!17635 () Bool)

(assert (=> b!882945 (= e!491460 tp_is_empty!17635)))

(declare-fun b!882946 () Bool)

(declare-fun res!599581 () Bool)

(assert (=> b!882946 (=> (not res!599581) (not e!491461))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51435 (_ BitVec 32)) Bool)

(assert (=> b!882946 (= res!599581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882947 () Bool)

(declare-fun res!599587 () Bool)

(assert (=> b!882947 (=> (not res!599587) (not e!491461))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!882947 (= res!599587 (and (= (size!25176 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25175 _keys!868) (size!25176 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882948 () Bool)

(declare-fun res!599585 () Bool)

(assert (=> b!882948 (=> (not res!599585) (not e!491461))))

(declare-datatypes ((List!17508 0))(
  ( (Nil!17505) (Cons!17504 (h!18641 (_ BitVec 64)) (t!24693 List!17508)) )
))
(declare-fun arrayNoDuplicates!0 (array!51435 (_ BitVec 32) List!17508) Bool)

(assert (=> b!882948 (= res!599585 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17505))))

(declare-fun mapIsEmpty!28083 () Bool)

(declare-fun mapRes!28083 () Bool)

(assert (=> mapIsEmpty!28083 mapRes!28083))

(declare-fun b!882949 () Bool)

(declare-fun res!599586 () Bool)

(assert (=> b!882949 (=> (not res!599586) (not e!491461))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882949 (= res!599586 (and (= (select (arr!24734 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882950 () Bool)

(declare-fun e!491463 () Bool)

(assert (=> b!882950 (= e!491461 e!491463)))

(declare-fun res!599583 () Bool)

(assert (=> b!882950 (=> (not res!599583) (not e!491463))))

(assert (=> b!882950 (= res!599583 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399382 () array!51437)

(declare-fun minValue!654 () V!28561)

(declare-fun zeroValue!654 () V!28561)

(declare-fun getCurrentListMapNoExtraKeys!3280 (array!51435 array!51437 (_ BitVec 32) (_ BitVec 32) V!28561 V!28561 (_ BitVec 32) Int) ListLongMap!10449)

(assert (=> b!882950 (= lt!399383 (getCurrentListMapNoExtraKeys!3280 _keys!868 lt!399382 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28561)

(assert (=> b!882950 (= lt!399382 (array!51438 (store (arr!24735 _values!688) i!612 (ValueCellFull!8378 v!557)) (size!25176 _values!688)))))

(declare-fun lt!399386 () ListLongMap!10449)

(assert (=> b!882950 (= lt!399386 (getCurrentListMapNoExtraKeys!3280 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!599584 () Bool)

(assert (=> start!74982 (=> (not res!599584) (not e!491461))))

(assert (=> start!74982 (= res!599584 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25175 _keys!868))))))

(assert (=> start!74982 e!491461))

(assert (=> start!74982 tp_is_empty!17635))

(assert (=> start!74982 true))

(assert (=> start!74982 tp!53870))

(declare-fun array_inv!19522 (array!51435) Bool)

(assert (=> start!74982 (array_inv!19522 _keys!868)))

(declare-fun e!491462 () Bool)

(declare-fun array_inv!19523 (array!51437) Bool)

(assert (=> start!74982 (and (array_inv!19523 _values!688) e!491462)))

(declare-fun mapNonEmpty!28083 () Bool)

(declare-fun tp!53871 () Bool)

(declare-fun e!491456 () Bool)

(assert (=> mapNonEmpty!28083 (= mapRes!28083 (and tp!53871 e!491456))))

(declare-fun mapValue!28083 () ValueCell!8378)

(declare-fun mapRest!28083 () (Array (_ BitVec 32) ValueCell!8378))

(declare-fun mapKey!28083 () (_ BitVec 32))

(assert (=> mapNonEmpty!28083 (= (arr!24735 _values!688) (store mapRest!28083 mapKey!28083 mapValue!28083))))

(declare-fun b!882951 () Bool)

(assert (=> b!882951 (= e!491462 (and e!491460 mapRes!28083))))

(declare-fun condMapEmpty!28083 () Bool)

(declare-fun mapDefault!28083 () ValueCell!8378)

(assert (=> b!882951 (= condMapEmpty!28083 (= (arr!24735 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8378)) mapDefault!28083)))))

(declare-fun b!882952 () Bool)

(declare-fun res!599588 () Bool)

(assert (=> b!882952 (=> (not res!599588) (not e!491461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882952 (= res!599588 (validMask!0 mask!1196))))

(declare-fun b!882953 () Bool)

(declare-fun res!599580 () Bool)

(assert (=> b!882953 (=> (not res!599580) (not e!491461))))

(assert (=> b!882953 (= res!599580 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25175 _keys!868))))))

(declare-fun b!882954 () Bool)

(assert (=> b!882954 (= e!491463 (not e!491457))))

(declare-fun res!599578 () Bool)

(assert (=> b!882954 (=> res!599578 e!491457)))

(assert (=> b!882954 (= res!599578 (not (validKeyInArray!0 (select (arr!24734 _keys!868) from!1053))))))

(declare-fun lt!399390 () ListLongMap!10449)

(assert (=> b!882954 (= lt!399390 lt!399388)))

(declare-fun lt!399387 () ListLongMap!10449)

(assert (=> b!882954 (= lt!399388 (+!2555 lt!399387 (tuple2!11679 k0!854 v!557)))))

(assert (=> b!882954 (= lt!399390 (getCurrentListMapNoExtraKeys!3280 _keys!868 lt!399382 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882954 (= lt!399387 (getCurrentListMapNoExtraKeys!3280 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30078 0))(
  ( (Unit!30079) )
))
(declare-fun lt!399384 () Unit!30078)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!720 (array!51435 array!51437 (_ BitVec 32) (_ BitVec 32) V!28561 V!28561 (_ BitVec 32) (_ BitVec 64) V!28561 (_ BitVec 32) Int) Unit!30078)

(assert (=> b!882954 (= lt!399384 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882955 () Bool)

(assert (=> b!882955 (= e!491456 tp_is_empty!17635)))

(declare-fun b!882956 () Bool)

(assert (=> b!882956 (= e!491458 (or (bvsge (size!25175 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25175 _keys!868)) (bvslt from!1053 (size!25175 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882956 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399389 () Unit!30078)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51435 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30078)

(assert (=> b!882956 (= lt!399389 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882956 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17505)))

(declare-fun lt!399385 () Unit!30078)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51435 (_ BitVec 32) (_ BitVec 32)) Unit!30078)

(assert (=> b!882956 (= lt!399385 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!74982 res!599584) b!882952))

(assert (= (and b!882952 res!599588) b!882947))

(assert (= (and b!882947 res!599587) b!882946))

(assert (= (and b!882946 res!599581) b!882948))

(assert (= (and b!882948 res!599585) b!882953))

(assert (= (and b!882953 res!599580) b!882944))

(assert (= (and b!882944 res!599582) b!882949))

(assert (= (and b!882949 res!599586) b!882950))

(assert (= (and b!882950 res!599583) b!882954))

(assert (= (and b!882954 (not res!599578)) b!882943))

(assert (= (and b!882943 (not res!599579)) b!882956))

(assert (= (and b!882951 condMapEmpty!28083) mapIsEmpty!28083))

(assert (= (and b!882951 (not condMapEmpty!28083)) mapNonEmpty!28083))

(get-info :version)

(assert (= (and mapNonEmpty!28083 ((_ is ValueCellFull!8378) mapValue!28083)) b!882955))

(assert (= (and b!882951 ((_ is ValueCellFull!8378) mapDefault!28083)) b!882945))

(assert (= start!74982 b!882951))

(declare-fun b_lambda!12615 () Bool)

(assert (=> (not b_lambda!12615) (not b!882943)))

(declare-fun t!24691 () Bool)

(declare-fun tb!5041 () Bool)

(assert (=> (and start!74982 (= defaultEntry!696 defaultEntry!696) t!24691) tb!5041))

(declare-fun result!9721 () Bool)

(assert (=> tb!5041 (= result!9721 tp_is_empty!17635)))

(assert (=> b!882943 t!24691))

(declare-fun b_and!25461 () Bool)

(assert (= b_and!25459 (and (=> t!24691 result!9721) b_and!25461)))

(declare-fun m!823259 () Bool)

(assert (=> b!882946 m!823259))

(declare-fun m!823261 () Bool)

(assert (=> start!74982 m!823261))

(declare-fun m!823263 () Bool)

(assert (=> start!74982 m!823263))

(declare-fun m!823265 () Bool)

(assert (=> b!882949 m!823265))

(declare-fun m!823267 () Bool)

(assert (=> b!882950 m!823267))

(declare-fun m!823269 () Bool)

(assert (=> b!882950 m!823269))

(declare-fun m!823271 () Bool)

(assert (=> b!882950 m!823271))

(declare-fun m!823273 () Bool)

(assert (=> b!882944 m!823273))

(declare-fun m!823275 () Bool)

(assert (=> b!882952 m!823275))

(declare-fun m!823277 () Bool)

(assert (=> b!882943 m!823277))

(declare-fun m!823279 () Bool)

(assert (=> b!882943 m!823279))

(declare-fun m!823281 () Bool)

(assert (=> b!882943 m!823281))

(declare-fun m!823283 () Bool)

(assert (=> b!882943 m!823283))

(assert (=> b!882943 m!823279))

(declare-fun m!823285 () Bool)

(assert (=> b!882943 m!823285))

(assert (=> b!882943 m!823281))

(declare-fun m!823287 () Bool)

(assert (=> mapNonEmpty!28083 m!823287))

(declare-fun m!823289 () Bool)

(assert (=> b!882954 m!823289))

(declare-fun m!823291 () Bool)

(assert (=> b!882954 m!823291))

(assert (=> b!882954 m!823285))

(declare-fun m!823293 () Bool)

(assert (=> b!882954 m!823293))

(declare-fun m!823295 () Bool)

(assert (=> b!882954 m!823295))

(assert (=> b!882954 m!823285))

(declare-fun m!823297 () Bool)

(assert (=> b!882954 m!823297))

(declare-fun m!823299 () Bool)

(assert (=> b!882948 m!823299))

(declare-fun m!823301 () Bool)

(assert (=> b!882956 m!823301))

(declare-fun m!823303 () Bool)

(assert (=> b!882956 m!823303))

(declare-fun m!823305 () Bool)

(assert (=> b!882956 m!823305))

(declare-fun m!823307 () Bool)

(assert (=> b!882956 m!823307))

(check-sat (not b_lambda!12615) (not b!882954) (not b!882943) (not start!74982) b_and!25461 (not b!882950) (not b!882944) (not b!882956) (not b!882948) tp_is_empty!17635 (not b!882946) (not b_next!15391) (not mapNonEmpty!28083) (not b!882952))
(check-sat b_and!25461 (not b_next!15391))
