; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74836 () Bool)

(assert start!74836)

(declare-fun b_free!15403 () Bool)

(declare-fun b_next!15403 () Bool)

(assert (=> start!74836 (= b_free!15403 (not b_next!15403))))

(declare-fun tp!53910 () Bool)

(declare-fun b_and!25463 () Bool)

(assert (=> start!74836 (= tp!53910 b_and!25463)))

(declare-fun b!882227 () Bool)

(declare-fun res!599405 () Bool)

(declare-fun e!490984 () Bool)

(assert (=> b!882227 (=> (not res!599405) (not e!490984))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51405 0))(
  ( (array!51406 (arr!24723 (Array (_ BitVec 32) (_ BitVec 64))) (size!25165 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51405)

(assert (=> b!882227 (= res!599405 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25165 _keys!868))))))

(declare-fun res!599413 () Bool)

(assert (=> start!74836 (=> (not res!599413) (not e!490984))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74836 (= res!599413 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25165 _keys!868))))))

(assert (=> start!74836 e!490984))

(declare-fun tp_is_empty!17647 () Bool)

(assert (=> start!74836 tp_is_empty!17647))

(assert (=> start!74836 true))

(assert (=> start!74836 tp!53910))

(declare-fun array_inv!19518 (array!51405) Bool)

(assert (=> start!74836 (array_inv!19518 _keys!868)))

(declare-datatypes ((V!28577 0))(
  ( (V!28578 (val!8871 Int)) )
))
(declare-datatypes ((ValueCell!8384 0))(
  ( (ValueCellFull!8384 (v!11329 V!28577)) (EmptyCell!8384) )
))
(declare-datatypes ((array!51407 0))(
  ( (array!51408 (arr!24724 (Array (_ BitVec 32) ValueCell!8384)) (size!25166 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51407)

(declare-fun e!490988 () Bool)

(declare-fun array_inv!19519 (array!51407) Bool)

(assert (=> start!74836 (and (array_inv!19519 _values!688) e!490988)))

(declare-fun b!882228 () Bool)

(declare-fun res!599407 () Bool)

(assert (=> b!882228 (=> (not res!599407) (not e!490984))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!882228 (= res!599407 (and (= (select (arr!24723 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!28104 () Bool)

(declare-fun mapRes!28104 () Bool)

(assert (=> mapIsEmpty!28104 mapRes!28104))

(declare-fun mapNonEmpty!28104 () Bool)

(declare-fun tp!53909 () Bool)

(declare-fun e!490982 () Bool)

(assert (=> mapNonEmpty!28104 (= mapRes!28104 (and tp!53909 e!490982))))

(declare-fun mapKey!28104 () (_ BitVec 32))

(declare-fun mapRest!28104 () (Array (_ BitVec 32) ValueCell!8384))

(declare-fun mapValue!28104 () ValueCell!8384)

(assert (=> mapNonEmpty!28104 (= (arr!24724 _values!688) (store mapRest!28104 mapKey!28104 mapValue!28104))))

(declare-fun b!882229 () Bool)

(declare-fun e!490989 () Bool)

(assert (=> b!882229 (= e!490989 tp_is_empty!17647)))

(declare-fun b!882230 () Bool)

(declare-fun res!599410 () Bool)

(assert (=> b!882230 (=> (not res!599410) (not e!490984))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882230 (= res!599410 (validMask!0 mask!1196))))

(declare-fun b!882231 () Bool)

(declare-fun res!599406 () Bool)

(assert (=> b!882231 (=> (not res!599406) (not e!490984))))

(declare-datatypes ((List!17564 0))(
  ( (Nil!17561) (Cons!17560 (h!18691 (_ BitVec 64)) (t!24760 List!17564)) )
))
(declare-fun arrayNoDuplicates!0 (array!51405 (_ BitVec 32) List!17564) Bool)

(assert (=> b!882231 (= res!599406 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17561))))

(declare-fun b!882232 () Bool)

(declare-fun e!490990 () Bool)

(declare-fun contains!4243 (List!17564 (_ BitVec 64)) Bool)

(assert (=> b!882232 (= e!490990 (not (contains!4243 Nil!17561 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882233 () Bool)

(declare-fun e!490981 () Bool)

(declare-fun e!490986 () Bool)

(assert (=> b!882233 (= e!490981 (not e!490986))))

(declare-fun res!599411 () Bool)

(assert (=> b!882233 (=> res!599411 e!490986)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882233 (= res!599411 (not (validKeyInArray!0 (select (arr!24723 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11770 0))(
  ( (tuple2!11771 (_1!5896 (_ BitVec 64)) (_2!5896 V!28577)) )
))
(declare-datatypes ((List!17565 0))(
  ( (Nil!17562) (Cons!17561 (h!18692 tuple2!11770) (t!24761 List!17565)) )
))
(declare-datatypes ((ListLongMap!10529 0))(
  ( (ListLongMap!10530 (toList!5280 List!17565)) )
))
(declare-fun lt!399031 () ListLongMap!10529)

(declare-fun lt!399030 () ListLongMap!10529)

(assert (=> b!882233 (= lt!399031 lt!399030)))

(declare-fun v!557 () V!28577)

(declare-fun lt!399023 () ListLongMap!10529)

(declare-fun +!2572 (ListLongMap!10529 tuple2!11770) ListLongMap!10529)

(assert (=> b!882233 (= lt!399030 (+!2572 lt!399023 (tuple2!11771 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399028 () array!51407)

(declare-fun minValue!654 () V!28577)

(declare-fun zeroValue!654 () V!28577)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3271 (array!51405 array!51407 (_ BitVec 32) (_ BitVec 32) V!28577 V!28577 (_ BitVec 32) Int) ListLongMap!10529)

(assert (=> b!882233 (= lt!399031 (getCurrentListMapNoExtraKeys!3271 _keys!868 lt!399028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882233 (= lt!399023 (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30055 0))(
  ( (Unit!30056) )
))
(declare-fun lt!399029 () Unit!30055)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!737 (array!51405 array!51407 (_ BitVec 32) (_ BitVec 32) V!28577 V!28577 (_ BitVec 32) (_ BitVec 64) V!28577 (_ BitVec 32) Int) Unit!30055)

(assert (=> b!882233 (= lt!399029 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!737 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882234 () Bool)

(assert (=> b!882234 (= e!490984 e!490981)))

(declare-fun res!599408 () Bool)

(assert (=> b!882234 (=> (not res!599408) (not e!490981))))

(assert (=> b!882234 (= res!599408 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399027 () ListLongMap!10529)

(assert (=> b!882234 (= lt!399027 (getCurrentListMapNoExtraKeys!3271 _keys!868 lt!399028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!882234 (= lt!399028 (array!51408 (store (arr!24724 _values!688) i!612 (ValueCellFull!8384 v!557)) (size!25166 _values!688)))))

(declare-fun lt!399024 () ListLongMap!10529)

(assert (=> b!882234 (= lt!399024 (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882235 () Bool)

(assert (=> b!882235 (= e!490988 (and e!490989 mapRes!28104))))

(declare-fun condMapEmpty!28104 () Bool)

(declare-fun mapDefault!28104 () ValueCell!8384)

(assert (=> b!882235 (= condMapEmpty!28104 (= (arr!24724 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8384)) mapDefault!28104)))))

(declare-fun b!882236 () Bool)

(assert (=> b!882236 (= e!490982 tp_is_empty!17647)))

(declare-fun b!882237 () Bool)

(declare-fun res!599409 () Bool)

(assert (=> b!882237 (=> (not res!599409) (not e!490984))))

(assert (=> b!882237 (= res!599409 (and (= (size!25166 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25165 _keys!868) (size!25166 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!882238 () Bool)

(declare-fun res!599402 () Bool)

(declare-fun e!490985 () Bool)

(assert (=> b!882238 (=> res!599402 e!490985)))

(declare-fun noDuplicate!1325 (List!17564) Bool)

(assert (=> b!882238 (= res!599402 (not (noDuplicate!1325 Nil!17561)))))

(declare-fun b!882239 () Bool)

(declare-fun res!599404 () Bool)

(assert (=> b!882239 (=> (not res!599404) (not e!490984))))

(assert (=> b!882239 (= res!599404 (validKeyInArray!0 k0!854))))

(declare-fun b!882240 () Bool)

(declare-fun res!599414 () Bool)

(assert (=> b!882240 (=> (not res!599414) (not e!490984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51405 (_ BitVec 32)) Bool)

(assert (=> b!882240 (= res!599414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882241 () Bool)

(assert (=> b!882241 (= e!490985 e!490990)))

(declare-fun res!599412 () Bool)

(assert (=> b!882241 (=> (not res!599412) (not e!490990))))

(assert (=> b!882241 (= res!599412 (not (contains!4243 Nil!17561 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882242 () Bool)

(declare-fun e!490983 () Bool)

(assert (=> b!882242 (= e!490983 e!490985)))

(declare-fun res!599403 () Bool)

(assert (=> b!882242 (=> res!599403 e!490985)))

(assert (=> b!882242 (= res!599403 (or (bvsge (size!25165 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)) (bvsge from!1053 (size!25165 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882242 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399026 () Unit!30055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51405 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30055)

(assert (=> b!882242 (= lt!399026 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882242 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17561)))

(declare-fun lt!399025 () Unit!30055)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51405 (_ BitVec 32) (_ BitVec 32)) Unit!30055)

(assert (=> b!882242 (= lt!399025 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882243 () Bool)

(assert (=> b!882243 (= e!490986 e!490983)))

(declare-fun res!599415 () Bool)

(assert (=> b!882243 (=> res!599415 e!490983)))

(assert (=> b!882243 (= res!599415 (not (= (select (arr!24723 _keys!868) from!1053) k0!854)))))

(declare-fun get!13028 (ValueCell!8384 V!28577) V!28577)

(declare-fun dynLambda!1260 (Int (_ BitVec 64)) V!28577)

(assert (=> b!882243 (= lt!399027 (+!2572 lt!399030 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!74836 res!599413) b!882230))

(assert (= (and b!882230 res!599410) b!882237))

(assert (= (and b!882237 res!599409) b!882240))

(assert (= (and b!882240 res!599414) b!882231))

(assert (= (and b!882231 res!599406) b!882227))

(assert (= (and b!882227 res!599405) b!882239))

(assert (= (and b!882239 res!599404) b!882228))

(assert (= (and b!882228 res!599407) b!882234))

(assert (= (and b!882234 res!599408) b!882233))

(assert (= (and b!882233 (not res!599411)) b!882243))

(assert (= (and b!882243 (not res!599415)) b!882242))

(assert (= (and b!882242 (not res!599403)) b!882238))

(assert (= (and b!882238 (not res!599402)) b!882241))

(assert (= (and b!882241 res!599412) b!882232))

(assert (= (and b!882235 condMapEmpty!28104) mapIsEmpty!28104))

(assert (= (and b!882235 (not condMapEmpty!28104)) mapNonEmpty!28104))

(get-info :version)

(assert (= (and mapNonEmpty!28104 ((_ is ValueCellFull!8384) mapValue!28104)) b!882236))

(assert (= (and b!882235 ((_ is ValueCellFull!8384) mapDefault!28104)) b!882229))

(assert (= start!74836 b!882235))

(declare-fun b_lambda!12629 () Bool)

(assert (=> (not b_lambda!12629) (not b!882243)))

(declare-fun t!24759 () Bool)

(declare-fun tb!5053 () Bool)

(assert (=> (and start!74836 (= defaultEntry!696 defaultEntry!696) t!24759) tb!5053))

(declare-fun result!9747 () Bool)

(assert (=> tb!5053 (= result!9747 tp_is_empty!17647)))

(assert (=> b!882243 t!24759))

(declare-fun b_and!25465 () Bool)

(assert (= b_and!25463 (and (=> t!24759 result!9747) b_and!25465)))

(declare-fun m!821675 () Bool)

(assert (=> b!882243 m!821675))

(declare-fun m!821677 () Bool)

(assert (=> b!882243 m!821677))

(declare-fun m!821679 () Bool)

(assert (=> b!882243 m!821679))

(assert (=> b!882243 m!821675))

(declare-fun m!821681 () Bool)

(assert (=> b!882243 m!821681))

(declare-fun m!821683 () Bool)

(assert (=> b!882243 m!821683))

(assert (=> b!882243 m!821677))

(declare-fun m!821685 () Bool)

(assert (=> b!882241 m!821685))

(declare-fun m!821687 () Bool)

(assert (=> b!882232 m!821687))

(declare-fun m!821689 () Bool)

(assert (=> b!882242 m!821689))

(declare-fun m!821691 () Bool)

(assert (=> b!882242 m!821691))

(declare-fun m!821693 () Bool)

(assert (=> b!882242 m!821693))

(declare-fun m!821695 () Bool)

(assert (=> b!882242 m!821695))

(declare-fun m!821697 () Bool)

(assert (=> b!882238 m!821697))

(declare-fun m!821699 () Bool)

(assert (=> b!882239 m!821699))

(declare-fun m!821701 () Bool)

(assert (=> b!882240 m!821701))

(declare-fun m!821703 () Bool)

(assert (=> b!882231 m!821703))

(declare-fun m!821705 () Bool)

(assert (=> b!882228 m!821705))

(declare-fun m!821707 () Bool)

(assert (=> b!882233 m!821707))

(declare-fun m!821709 () Bool)

(assert (=> b!882233 m!821709))

(assert (=> b!882233 m!821683))

(declare-fun m!821711 () Bool)

(assert (=> b!882233 m!821711))

(assert (=> b!882233 m!821683))

(declare-fun m!821713 () Bool)

(assert (=> b!882233 m!821713))

(declare-fun m!821715 () Bool)

(assert (=> b!882233 m!821715))

(declare-fun m!821717 () Bool)

(assert (=> b!882234 m!821717))

(declare-fun m!821719 () Bool)

(assert (=> b!882234 m!821719))

(declare-fun m!821721 () Bool)

(assert (=> b!882234 m!821721))

(declare-fun m!821723 () Bool)

(assert (=> mapNonEmpty!28104 m!821723))

(declare-fun m!821725 () Bool)

(assert (=> b!882230 m!821725))

(declare-fun m!821727 () Bool)

(assert (=> start!74836 m!821727))

(declare-fun m!821729 () Bool)

(assert (=> start!74836 m!821729))

(check-sat (not b!882230) (not b!882241) (not b!882234) (not b_next!15403) (not b!882239) (not start!74836) tp_is_empty!17647 (not b!882231) (not b!882240) (not b!882232) (not b!882238) (not mapNonEmpty!28104) b_and!25465 (not b!882233) (not b!882242) (not b!882243) (not b_lambda!12629))
(check-sat b_and!25465 (not b_next!15403))
(get-model)

(declare-fun b_lambda!12635 () Bool)

(assert (= b_lambda!12629 (or (and start!74836 b_free!15403) b_lambda!12635)))

(check-sat (not b!882230) (not b!882241) (not b!882234) (not b_next!15403) (not b!882243) (not b_lambda!12635) (not b!882239) (not start!74836) tp_is_empty!17647 (not b!882231) (not b!882240) (not b!882232) (not b!882238) (not mapNonEmpty!28104) b_and!25465 (not b!882233) (not b!882242))
(check-sat b_and!25465 (not b_next!15403))
(get-model)

(declare-fun d!108943 () Bool)

(declare-fun lt!399088 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!391 (List!17564) (InoxSet (_ BitVec 64)))

(assert (=> d!108943 (= lt!399088 (select (content!391 Nil!17561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!491055 () Bool)

(assert (=> d!108943 (= lt!399088 e!491055)))

(declare-fun res!599505 () Bool)

(assert (=> d!108943 (=> (not res!599505) (not e!491055))))

(assert (=> d!108943 (= res!599505 ((_ is Cons!17560) Nil!17561))))

(assert (=> d!108943 (= (contains!4243 Nil!17561 #b1000000000000000000000000000000000000000000000000000000000000000) lt!399088)))

(declare-fun b!882356 () Bool)

(declare-fun e!491056 () Bool)

(assert (=> b!882356 (= e!491055 e!491056)))

(declare-fun res!599504 () Bool)

(assert (=> b!882356 (=> res!599504 e!491056)))

(assert (=> b!882356 (= res!599504 (= (h!18691 Nil!17561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882357 () Bool)

(assert (=> b!882357 (= e!491056 (contains!4243 (t!24760 Nil!17561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!108943 res!599505) b!882356))

(assert (= (and b!882356 (not res!599504)) b!882357))

(declare-fun m!821843 () Bool)

(assert (=> d!108943 m!821843))

(declare-fun m!821845 () Bool)

(assert (=> d!108943 m!821845))

(declare-fun m!821847 () Bool)

(assert (=> b!882357 m!821847))

(assert (=> b!882232 d!108943))

(declare-fun d!108945 () Bool)

(assert (=> d!108945 (= (array_inv!19518 _keys!868) (bvsge (size!25165 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74836 d!108945))

(declare-fun d!108947 () Bool)

(assert (=> d!108947 (= (array_inv!19519 _values!688) (bvsge (size!25166 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74836 d!108947))

(declare-fun d!108949 () Bool)

(declare-fun e!491059 () Bool)

(assert (=> d!108949 e!491059))

(declare-fun res!599510 () Bool)

(assert (=> d!108949 (=> (not res!599510) (not e!491059))))

(declare-fun lt!399099 () ListLongMap!10529)

(declare-fun contains!4245 (ListLongMap!10529 (_ BitVec 64)) Bool)

(assert (=> d!108949 (= res!599510 (contains!4245 lt!399099 (_1!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!399097 () List!17565)

(assert (=> d!108949 (= lt!399099 (ListLongMap!10530 lt!399097))))

(declare-fun lt!399098 () Unit!30055)

(declare-fun lt!399100 () Unit!30055)

(assert (=> d!108949 (= lt!399098 lt!399100)))

(declare-datatypes ((Option!430 0))(
  ( (Some!429 (v!11336 V!28577)) (None!428) )
))
(declare-fun getValueByKey!424 (List!17565 (_ BitVec 64)) Option!430)

(assert (=> d!108949 (= (getValueByKey!424 lt!399097 (_1!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!429 (_2!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!241 (List!17565 (_ BitVec 64) V!28577) Unit!30055)

(assert (=> d!108949 (= lt!399100 (lemmaContainsTupThenGetReturnValue!241 lt!399097 (_1!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!280 (List!17565 (_ BitVec 64) V!28577) List!17565)

(assert (=> d!108949 (= lt!399097 (insertStrictlySorted!280 (toList!5280 lt!399030) (_1!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108949 (= (+!2572 lt!399030 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!399099)))

(declare-fun b!882362 () Bool)

(declare-fun res!599511 () Bool)

(assert (=> b!882362 (=> (not res!599511) (not e!491059))))

(assert (=> b!882362 (= res!599511 (= (getValueByKey!424 (toList!5280 lt!399099) (_1!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!429 (_2!5896 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!882363 () Bool)

(declare-fun contains!4246 (List!17565 tuple2!11770) Bool)

(assert (=> b!882363 (= e!491059 (contains!4246 (toList!5280 lt!399099) (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108949 res!599510) b!882362))

(assert (= (and b!882362 res!599511) b!882363))

(declare-fun m!821849 () Bool)

(assert (=> d!108949 m!821849))

(declare-fun m!821851 () Bool)

(assert (=> d!108949 m!821851))

(declare-fun m!821853 () Bool)

(assert (=> d!108949 m!821853))

(declare-fun m!821855 () Bool)

(assert (=> d!108949 m!821855))

(declare-fun m!821857 () Bool)

(assert (=> b!882362 m!821857))

(declare-fun m!821859 () Bool)

(assert (=> b!882363 m!821859))

(assert (=> b!882243 d!108949))

(declare-fun d!108951 () Bool)

(declare-fun c!92944 () Bool)

(assert (=> d!108951 (= c!92944 ((_ is ValueCellFull!8384) (select (arr!24724 _values!688) from!1053)))))

(declare-fun e!491062 () V!28577)

(assert (=> d!108951 (= (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!491062)))

(declare-fun b!882368 () Bool)

(declare-fun get!13029 (ValueCell!8384 V!28577) V!28577)

(assert (=> b!882368 (= e!491062 (get!13029 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882369 () Bool)

(declare-fun get!13030 (ValueCell!8384 V!28577) V!28577)

(assert (=> b!882369 (= e!491062 (get!13030 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108951 c!92944) b!882368))

(assert (= (and d!108951 (not c!92944)) b!882369))

(assert (=> b!882368 m!821675))

(assert (=> b!882368 m!821677))

(declare-fun m!821861 () Bool)

(assert (=> b!882368 m!821861))

(assert (=> b!882369 m!821675))

(assert (=> b!882369 m!821677))

(declare-fun m!821863 () Bool)

(assert (=> b!882369 m!821863))

(assert (=> b!882243 d!108951))

(declare-fun d!108953 () Bool)

(declare-fun e!491063 () Bool)

(assert (=> d!108953 e!491063))

(declare-fun res!599512 () Bool)

(assert (=> d!108953 (=> (not res!599512) (not e!491063))))

(declare-fun lt!399103 () ListLongMap!10529)

(assert (=> d!108953 (= res!599512 (contains!4245 lt!399103 (_1!5896 (tuple2!11771 k0!854 v!557))))))

(declare-fun lt!399101 () List!17565)

(assert (=> d!108953 (= lt!399103 (ListLongMap!10530 lt!399101))))

(declare-fun lt!399102 () Unit!30055)

(declare-fun lt!399104 () Unit!30055)

(assert (=> d!108953 (= lt!399102 lt!399104)))

(assert (=> d!108953 (= (getValueByKey!424 lt!399101 (_1!5896 (tuple2!11771 k0!854 v!557))) (Some!429 (_2!5896 (tuple2!11771 k0!854 v!557))))))

(assert (=> d!108953 (= lt!399104 (lemmaContainsTupThenGetReturnValue!241 lt!399101 (_1!5896 (tuple2!11771 k0!854 v!557)) (_2!5896 (tuple2!11771 k0!854 v!557))))))

(assert (=> d!108953 (= lt!399101 (insertStrictlySorted!280 (toList!5280 lt!399023) (_1!5896 (tuple2!11771 k0!854 v!557)) (_2!5896 (tuple2!11771 k0!854 v!557))))))

(assert (=> d!108953 (= (+!2572 lt!399023 (tuple2!11771 k0!854 v!557)) lt!399103)))

(declare-fun b!882370 () Bool)

(declare-fun res!599513 () Bool)

(assert (=> b!882370 (=> (not res!599513) (not e!491063))))

(assert (=> b!882370 (= res!599513 (= (getValueByKey!424 (toList!5280 lt!399103) (_1!5896 (tuple2!11771 k0!854 v!557))) (Some!429 (_2!5896 (tuple2!11771 k0!854 v!557)))))))

(declare-fun b!882371 () Bool)

(assert (=> b!882371 (= e!491063 (contains!4246 (toList!5280 lt!399103) (tuple2!11771 k0!854 v!557)))))

(assert (= (and d!108953 res!599512) b!882370))

(assert (= (and b!882370 res!599513) b!882371))

(declare-fun m!821865 () Bool)

(assert (=> d!108953 m!821865))

(declare-fun m!821867 () Bool)

(assert (=> d!108953 m!821867))

(declare-fun m!821869 () Bool)

(assert (=> d!108953 m!821869))

(declare-fun m!821871 () Bool)

(assert (=> d!108953 m!821871))

(declare-fun m!821873 () Bool)

(assert (=> b!882370 m!821873))

(declare-fun m!821875 () Bool)

(assert (=> b!882371 m!821875))

(assert (=> b!882233 d!108953))

(declare-fun b!882396 () Bool)

(assert (=> b!882396 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(assert (=> b!882396 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25166 _values!688)))))

(declare-fun e!491084 () Bool)

(declare-fun lt!399123 () ListLongMap!10529)

(declare-fun apply!384 (ListLongMap!10529 (_ BitVec 64)) V!28577)

(assert (=> b!882396 (= e!491084 (= (apply!384 lt!399123 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13028 (select (arr!24724 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882397 () Bool)

(declare-fun e!491082 () Bool)

(assert (=> b!882397 (= e!491082 (validKeyInArray!0 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882397 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882398 () Bool)

(declare-fun e!491081 () Bool)

(assert (=> b!882398 (= e!491081 (= lt!399123 (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882399 () Bool)

(declare-fun res!599522 () Bool)

(declare-fun e!491083 () Bool)

(assert (=> b!882399 (=> (not res!599522) (not e!491083))))

(assert (=> b!882399 (= res!599522 (not (contains!4245 lt!399123 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882400 () Bool)

(declare-fun e!491080 () ListLongMap!10529)

(declare-fun e!491079 () ListLongMap!10529)

(assert (=> b!882400 (= e!491080 e!491079)))

(declare-fun c!92955 () Bool)

(assert (=> b!882400 (= c!92955 (validKeyInArray!0 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!882401 () Bool)

(declare-fun e!491078 () Bool)

(assert (=> b!882401 (= e!491078 e!491081)))

(declare-fun c!92953 () Bool)

(assert (=> b!882401 (= c!92953 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(declare-fun b!882402 () Bool)

(assert (=> b!882402 (= e!491083 e!491078)))

(declare-fun c!92956 () Bool)

(assert (=> b!882402 (= c!92956 e!491082)))

(declare-fun res!599524 () Bool)

(assert (=> b!882402 (=> (not res!599524) (not e!491082))))

(assert (=> b!882402 (= res!599524 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(declare-fun d!108955 () Bool)

(assert (=> d!108955 e!491083))

(declare-fun res!599525 () Bool)

(assert (=> d!108955 (=> (not res!599525) (not e!491083))))

(assert (=> d!108955 (= res!599525 (not (contains!4245 lt!399123 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108955 (= lt!399123 e!491080)))

(declare-fun c!92954 () Bool)

(assert (=> d!108955 (= c!92954 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(assert (=> d!108955 (validMask!0 mask!1196)))

(assert (=> d!108955 (= (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399123)))

(declare-fun b!882403 () Bool)

(declare-fun call!38943 () ListLongMap!10529)

(assert (=> b!882403 (= e!491079 call!38943)))

(declare-fun b!882404 () Bool)

(declare-fun lt!399122 () Unit!30055)

(declare-fun lt!399124 () Unit!30055)

(assert (=> b!882404 (= lt!399122 lt!399124)))

(declare-fun lt!399125 () (_ BitVec 64))

(declare-fun lt!399120 () V!28577)

(declare-fun lt!399121 () ListLongMap!10529)

(declare-fun lt!399119 () (_ BitVec 64))

(assert (=> b!882404 (not (contains!4245 (+!2572 lt!399121 (tuple2!11771 lt!399125 lt!399120)) lt!399119))))

(declare-fun addStillNotContains!210 (ListLongMap!10529 (_ BitVec 64) V!28577 (_ BitVec 64)) Unit!30055)

(assert (=> b!882404 (= lt!399124 (addStillNotContains!210 lt!399121 lt!399125 lt!399120 lt!399119))))

(assert (=> b!882404 (= lt!399119 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882404 (= lt!399120 (get!13028 (select (arr!24724 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882404 (= lt!399125 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882404 (= lt!399121 call!38943)))

(assert (=> b!882404 (= e!491079 (+!2572 call!38943 (tuple2!11771 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13028 (select (arr!24724 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882405 () Bool)

(declare-fun isEmpty!676 (ListLongMap!10529) Bool)

(assert (=> b!882405 (= e!491081 (isEmpty!676 lt!399123))))

(declare-fun b!882406 () Bool)

(assert (=> b!882406 (= e!491078 e!491084)))

(assert (=> b!882406 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(declare-fun res!599523 () Bool)

(assert (=> b!882406 (= res!599523 (contains!4245 lt!399123 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882406 (=> (not res!599523) (not e!491084))))

(declare-fun bm!38940 () Bool)

(assert (=> bm!38940 (= call!38943 (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882407 () Bool)

(assert (=> b!882407 (= e!491080 (ListLongMap!10530 Nil!17562))))

(assert (= (and d!108955 c!92954) b!882407))

(assert (= (and d!108955 (not c!92954)) b!882400))

(assert (= (and b!882400 c!92955) b!882404))

(assert (= (and b!882400 (not c!92955)) b!882403))

(assert (= (or b!882404 b!882403) bm!38940))

(assert (= (and d!108955 res!599525) b!882399))

(assert (= (and b!882399 res!599522) b!882402))

(assert (= (and b!882402 res!599524) b!882397))

(assert (= (and b!882402 c!92956) b!882406))

(assert (= (and b!882402 (not c!92956)) b!882401))

(assert (= (and b!882406 res!599523) b!882396))

(assert (= (and b!882401 c!92953) b!882398))

(assert (= (and b!882401 (not c!92953)) b!882405))

(declare-fun b_lambda!12637 () Bool)

(assert (=> (not b_lambda!12637) (not b!882396)))

(assert (=> b!882396 t!24759))

(declare-fun b_and!25475 () Bool)

(assert (= b_and!25465 (and (=> t!24759 result!9747) b_and!25475)))

(declare-fun b_lambda!12639 () Bool)

(assert (=> (not b_lambda!12639) (not b!882404)))

(assert (=> b!882404 t!24759))

(declare-fun b_and!25477 () Bool)

(assert (= b_and!25475 (and (=> t!24759 result!9747) b_and!25477)))

(declare-fun m!821877 () Bool)

(assert (=> d!108955 m!821877))

(assert (=> d!108955 m!821725))

(declare-fun m!821879 () Bool)

(assert (=> b!882405 m!821879))

(declare-fun m!821881 () Bool)

(assert (=> b!882400 m!821881))

(assert (=> b!882400 m!821881))

(declare-fun m!821883 () Bool)

(assert (=> b!882400 m!821883))

(declare-fun m!821885 () Bool)

(assert (=> b!882404 m!821885))

(declare-fun m!821887 () Bool)

(assert (=> b!882404 m!821887))

(assert (=> b!882404 m!821677))

(assert (=> b!882404 m!821885))

(assert (=> b!882404 m!821677))

(declare-fun m!821889 () Bool)

(assert (=> b!882404 m!821889))

(assert (=> b!882404 m!821887))

(declare-fun m!821891 () Bool)

(assert (=> b!882404 m!821891))

(assert (=> b!882404 m!821881))

(declare-fun m!821893 () Bool)

(assert (=> b!882404 m!821893))

(declare-fun m!821895 () Bool)

(assert (=> b!882404 m!821895))

(assert (=> b!882406 m!821881))

(assert (=> b!882406 m!821881))

(declare-fun m!821897 () Bool)

(assert (=> b!882406 m!821897))

(declare-fun m!821899 () Bool)

(assert (=> b!882398 m!821899))

(declare-fun m!821901 () Bool)

(assert (=> b!882399 m!821901))

(assert (=> b!882396 m!821885))

(assert (=> b!882396 m!821677))

(assert (=> b!882396 m!821885))

(assert (=> b!882396 m!821677))

(assert (=> b!882396 m!821889))

(assert (=> b!882396 m!821881))

(declare-fun m!821903 () Bool)

(assert (=> b!882396 m!821903))

(assert (=> b!882396 m!821881))

(assert (=> b!882397 m!821881))

(assert (=> b!882397 m!821881))

(assert (=> b!882397 m!821883))

(assert (=> bm!38940 m!821899))

(assert (=> b!882233 d!108955))

(declare-fun d!108957 () Bool)

(assert (=> d!108957 (= (validKeyInArray!0 (select (arr!24723 _keys!868) from!1053)) (and (not (= (select (arr!24723 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24723 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882233 d!108957))

(declare-fun d!108959 () Bool)

(declare-fun e!491089 () Bool)

(assert (=> d!108959 e!491089))

(declare-fun res!599528 () Bool)

(assert (=> d!108959 (=> (not res!599528) (not e!491089))))

(assert (=> d!108959 (= res!599528 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25166 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25166 _values!688))))))))

(declare-fun lt!399128 () Unit!30055)

(declare-fun choose!1449 (array!51405 array!51407 (_ BitVec 32) (_ BitVec 32) V!28577 V!28577 (_ BitVec 32) (_ BitVec 64) V!28577 (_ BitVec 32) Int) Unit!30055)

(assert (=> d!108959 (= lt!399128 (choose!1449 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108959 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(assert (=> d!108959 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!737 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399128)))

(declare-fun b!882414 () Bool)

(declare-fun e!491090 () Bool)

(assert (=> b!882414 (= e!491089 e!491090)))

(declare-fun c!92959 () Bool)

(assert (=> b!882414 (= c!92959 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun call!38948 () ListLongMap!10529)

(declare-fun bm!38945 () Bool)

(assert (=> bm!38945 (= call!38948 (getCurrentListMapNoExtraKeys!3271 _keys!868 (array!51408 (store (arr!24724 _values!688) i!612 (ValueCellFull!8384 v!557)) (size!25166 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882415 () Bool)

(declare-fun call!38949 () ListLongMap!10529)

(assert (=> b!882415 (= e!491090 (= call!38948 call!38949))))

(declare-fun bm!38946 () Bool)

(assert (=> bm!38946 (= call!38949 (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882416 () Bool)

(assert (=> b!882416 (= e!491090 (= call!38948 (+!2572 call!38949 (tuple2!11771 k0!854 v!557))))))

(assert (= (and d!108959 res!599528) b!882414))

(assert (= (and b!882414 c!92959) b!882416))

(assert (= (and b!882414 (not c!92959)) b!882415))

(assert (= (or b!882416 b!882415) bm!38946))

(assert (= (or b!882416 b!882415) bm!38945))

(declare-fun m!821905 () Bool)

(assert (=> d!108959 m!821905))

(assert (=> bm!38945 m!821719))

(declare-fun m!821907 () Bool)

(assert (=> bm!38945 m!821907))

(assert (=> bm!38946 m!821709))

(declare-fun m!821909 () Bool)

(assert (=> b!882416 m!821909))

(assert (=> b!882233 d!108959))

(declare-fun b!882417 () Bool)

(assert (=> b!882417 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(assert (=> b!882417 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25166 lt!399028)))))

(declare-fun e!491097 () Bool)

(declare-fun lt!399133 () ListLongMap!10529)

(assert (=> b!882417 (= e!491097 (= (apply!384 lt!399133 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13028 (select (arr!24724 lt!399028) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882418 () Bool)

(declare-fun e!491095 () Bool)

(assert (=> b!882418 (= e!491095 (validKeyInArray!0 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882418 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!882419 () Bool)

(declare-fun e!491094 () Bool)

(assert (=> b!882419 (= e!491094 (= lt!399133 (getCurrentListMapNoExtraKeys!3271 _keys!868 lt!399028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882420 () Bool)

(declare-fun res!599529 () Bool)

(declare-fun e!491096 () Bool)

(assert (=> b!882420 (=> (not res!599529) (not e!491096))))

(assert (=> b!882420 (= res!599529 (not (contains!4245 lt!399133 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882421 () Bool)

(declare-fun e!491093 () ListLongMap!10529)

(declare-fun e!491092 () ListLongMap!10529)

(assert (=> b!882421 (= e!491093 e!491092)))

(declare-fun c!92962 () Bool)

(assert (=> b!882421 (= c!92962 (validKeyInArray!0 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!882422 () Bool)

(declare-fun e!491091 () Bool)

(assert (=> b!882422 (= e!491091 e!491094)))

(declare-fun c!92960 () Bool)

(assert (=> b!882422 (= c!92960 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(declare-fun b!882423 () Bool)

(assert (=> b!882423 (= e!491096 e!491091)))

(declare-fun c!92963 () Bool)

(assert (=> b!882423 (= c!92963 e!491095)))

(declare-fun res!599531 () Bool)

(assert (=> b!882423 (=> (not res!599531) (not e!491095))))

(assert (=> b!882423 (= res!599531 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(declare-fun d!108961 () Bool)

(assert (=> d!108961 e!491096))

(declare-fun res!599532 () Bool)

(assert (=> d!108961 (=> (not res!599532) (not e!491096))))

(assert (=> d!108961 (= res!599532 (not (contains!4245 lt!399133 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108961 (= lt!399133 e!491093)))

(declare-fun c!92961 () Bool)

(assert (=> d!108961 (= c!92961 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(assert (=> d!108961 (validMask!0 mask!1196)))

(assert (=> d!108961 (= (getCurrentListMapNoExtraKeys!3271 _keys!868 lt!399028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!399133)))

(declare-fun b!882424 () Bool)

(declare-fun call!38950 () ListLongMap!10529)

(assert (=> b!882424 (= e!491092 call!38950)))

(declare-fun b!882425 () Bool)

(declare-fun lt!399132 () Unit!30055)

(declare-fun lt!399134 () Unit!30055)

(assert (=> b!882425 (= lt!399132 lt!399134)))

(declare-fun lt!399130 () V!28577)

(declare-fun lt!399131 () ListLongMap!10529)

(declare-fun lt!399135 () (_ BitVec 64))

(declare-fun lt!399129 () (_ BitVec 64))

(assert (=> b!882425 (not (contains!4245 (+!2572 lt!399131 (tuple2!11771 lt!399135 lt!399130)) lt!399129))))

(assert (=> b!882425 (= lt!399134 (addStillNotContains!210 lt!399131 lt!399135 lt!399130 lt!399129))))

(assert (=> b!882425 (= lt!399129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882425 (= lt!399130 (get!13028 (select (arr!24724 lt!399028) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882425 (= lt!399135 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!882425 (= lt!399131 call!38950)))

(assert (=> b!882425 (= e!491092 (+!2572 call!38950 (tuple2!11771 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13028 (select (arr!24724 lt!399028) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882426 () Bool)

(assert (=> b!882426 (= e!491094 (isEmpty!676 lt!399133))))

(declare-fun b!882427 () Bool)

(assert (=> b!882427 (= e!491091 e!491097)))

(assert (=> b!882427 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25165 _keys!868)))))

(declare-fun res!599530 () Bool)

(assert (=> b!882427 (= res!599530 (contains!4245 lt!399133 (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!882427 (=> (not res!599530) (not e!491097))))

(declare-fun bm!38947 () Bool)

(assert (=> bm!38947 (= call!38950 (getCurrentListMapNoExtraKeys!3271 _keys!868 lt!399028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882428 () Bool)

(assert (=> b!882428 (= e!491093 (ListLongMap!10530 Nil!17562))))

(assert (= (and d!108961 c!92961) b!882428))

(assert (= (and d!108961 (not c!92961)) b!882421))

(assert (= (and b!882421 c!92962) b!882425))

(assert (= (and b!882421 (not c!92962)) b!882424))

(assert (= (or b!882425 b!882424) bm!38947))

(assert (= (and d!108961 res!599532) b!882420))

(assert (= (and b!882420 res!599529) b!882423))

(assert (= (and b!882423 res!599531) b!882418))

(assert (= (and b!882423 c!92963) b!882427))

(assert (= (and b!882423 (not c!92963)) b!882422))

(assert (= (and b!882427 res!599530) b!882417))

(assert (= (and b!882422 c!92960) b!882419))

(assert (= (and b!882422 (not c!92960)) b!882426))

(declare-fun b_lambda!12641 () Bool)

(assert (=> (not b_lambda!12641) (not b!882417)))

(assert (=> b!882417 t!24759))

(declare-fun b_and!25479 () Bool)

(assert (= b_and!25477 (and (=> t!24759 result!9747) b_and!25479)))

(declare-fun b_lambda!12643 () Bool)

(assert (=> (not b_lambda!12643) (not b!882425)))

(assert (=> b!882425 t!24759))

(declare-fun b_and!25481 () Bool)

(assert (= b_and!25479 (and (=> t!24759 result!9747) b_and!25481)))

(declare-fun m!821911 () Bool)

(assert (=> d!108961 m!821911))

(assert (=> d!108961 m!821725))

(declare-fun m!821913 () Bool)

(assert (=> b!882426 m!821913))

(assert (=> b!882421 m!821881))

(assert (=> b!882421 m!821881))

(assert (=> b!882421 m!821883))

(declare-fun m!821915 () Bool)

(assert (=> b!882425 m!821915))

(declare-fun m!821917 () Bool)

(assert (=> b!882425 m!821917))

(assert (=> b!882425 m!821677))

(assert (=> b!882425 m!821915))

(assert (=> b!882425 m!821677))

(declare-fun m!821919 () Bool)

(assert (=> b!882425 m!821919))

(assert (=> b!882425 m!821917))

(declare-fun m!821921 () Bool)

(assert (=> b!882425 m!821921))

(assert (=> b!882425 m!821881))

(declare-fun m!821923 () Bool)

(assert (=> b!882425 m!821923))

(declare-fun m!821925 () Bool)

(assert (=> b!882425 m!821925))

(assert (=> b!882427 m!821881))

(assert (=> b!882427 m!821881))

(declare-fun m!821927 () Bool)

(assert (=> b!882427 m!821927))

(declare-fun m!821929 () Bool)

(assert (=> b!882419 m!821929))

(declare-fun m!821931 () Bool)

(assert (=> b!882420 m!821931))

(assert (=> b!882417 m!821915))

(assert (=> b!882417 m!821677))

(assert (=> b!882417 m!821915))

(assert (=> b!882417 m!821677))

(assert (=> b!882417 m!821919))

(assert (=> b!882417 m!821881))

(declare-fun m!821933 () Bool)

(assert (=> b!882417 m!821933))

(assert (=> b!882417 m!821881))

(assert (=> b!882418 m!821881))

(assert (=> b!882418 m!821881))

(assert (=> b!882418 m!821883))

(assert (=> bm!38947 m!821929))

(assert (=> b!882233 d!108961))

(declare-fun b!882429 () Bool)

(assert (=> b!882429 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25165 _keys!868)))))

(assert (=> b!882429 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25166 lt!399028)))))

(declare-fun e!491104 () Bool)

(declare-fun lt!399140 () ListLongMap!10529)

(assert (=> b!882429 (= e!491104 (= (apply!384 lt!399140 (select (arr!24723 _keys!868) from!1053)) (get!13028 (select (arr!24724 lt!399028) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882430 () Bool)

(declare-fun e!491102 () Bool)

(assert (=> b!882430 (= e!491102 (validKeyInArray!0 (select (arr!24723 _keys!868) from!1053)))))

(assert (=> b!882430 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882431 () Bool)

(declare-fun e!491101 () Bool)

(assert (=> b!882431 (= e!491101 (= lt!399140 (getCurrentListMapNoExtraKeys!3271 _keys!868 lt!399028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882432 () Bool)

(declare-fun res!599533 () Bool)

(declare-fun e!491103 () Bool)

(assert (=> b!882432 (=> (not res!599533) (not e!491103))))

(assert (=> b!882432 (= res!599533 (not (contains!4245 lt!399140 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882433 () Bool)

(declare-fun e!491100 () ListLongMap!10529)

(declare-fun e!491099 () ListLongMap!10529)

(assert (=> b!882433 (= e!491100 e!491099)))

(declare-fun c!92966 () Bool)

(assert (=> b!882433 (= c!92966 (validKeyInArray!0 (select (arr!24723 _keys!868) from!1053)))))

(declare-fun b!882434 () Bool)

(declare-fun e!491098 () Bool)

(assert (=> b!882434 (= e!491098 e!491101)))

(declare-fun c!92964 () Bool)

(assert (=> b!882434 (= c!92964 (bvslt from!1053 (size!25165 _keys!868)))))

(declare-fun b!882435 () Bool)

(assert (=> b!882435 (= e!491103 e!491098)))

(declare-fun c!92967 () Bool)

(assert (=> b!882435 (= c!92967 e!491102)))

(declare-fun res!599535 () Bool)

(assert (=> b!882435 (=> (not res!599535) (not e!491102))))

(assert (=> b!882435 (= res!599535 (bvslt from!1053 (size!25165 _keys!868)))))

(declare-fun d!108963 () Bool)

(assert (=> d!108963 e!491103))

(declare-fun res!599536 () Bool)

(assert (=> d!108963 (=> (not res!599536) (not e!491103))))

(assert (=> d!108963 (= res!599536 (not (contains!4245 lt!399140 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108963 (= lt!399140 e!491100)))

(declare-fun c!92965 () Bool)

(assert (=> d!108963 (= c!92965 (bvsge from!1053 (size!25165 _keys!868)))))

(assert (=> d!108963 (validMask!0 mask!1196)))

(assert (=> d!108963 (= (getCurrentListMapNoExtraKeys!3271 _keys!868 lt!399028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399140)))

(declare-fun b!882436 () Bool)

(declare-fun call!38951 () ListLongMap!10529)

(assert (=> b!882436 (= e!491099 call!38951)))

(declare-fun b!882437 () Bool)

(declare-fun lt!399139 () Unit!30055)

(declare-fun lt!399141 () Unit!30055)

(assert (=> b!882437 (= lt!399139 lt!399141)))

(declare-fun lt!399136 () (_ BitVec 64))

(declare-fun lt!399137 () V!28577)

(declare-fun lt!399138 () ListLongMap!10529)

(declare-fun lt!399142 () (_ BitVec 64))

(assert (=> b!882437 (not (contains!4245 (+!2572 lt!399138 (tuple2!11771 lt!399142 lt!399137)) lt!399136))))

(assert (=> b!882437 (= lt!399141 (addStillNotContains!210 lt!399138 lt!399142 lt!399137 lt!399136))))

(assert (=> b!882437 (= lt!399136 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882437 (= lt!399137 (get!13028 (select (arr!24724 lt!399028) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882437 (= lt!399142 (select (arr!24723 _keys!868) from!1053))))

(assert (=> b!882437 (= lt!399138 call!38951)))

(assert (=> b!882437 (= e!491099 (+!2572 call!38951 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 lt!399028) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882438 () Bool)

(assert (=> b!882438 (= e!491101 (isEmpty!676 lt!399140))))

(declare-fun b!882439 () Bool)

(assert (=> b!882439 (= e!491098 e!491104)))

(assert (=> b!882439 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25165 _keys!868)))))

(declare-fun res!599534 () Bool)

(assert (=> b!882439 (= res!599534 (contains!4245 lt!399140 (select (arr!24723 _keys!868) from!1053)))))

(assert (=> b!882439 (=> (not res!599534) (not e!491104))))

(declare-fun bm!38948 () Bool)

(assert (=> bm!38948 (= call!38951 (getCurrentListMapNoExtraKeys!3271 _keys!868 lt!399028 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882440 () Bool)

(assert (=> b!882440 (= e!491100 (ListLongMap!10530 Nil!17562))))

(assert (= (and d!108963 c!92965) b!882440))

(assert (= (and d!108963 (not c!92965)) b!882433))

(assert (= (and b!882433 c!92966) b!882437))

(assert (= (and b!882433 (not c!92966)) b!882436))

(assert (= (or b!882437 b!882436) bm!38948))

(assert (= (and d!108963 res!599536) b!882432))

(assert (= (and b!882432 res!599533) b!882435))

(assert (= (and b!882435 res!599535) b!882430))

(assert (= (and b!882435 c!92967) b!882439))

(assert (= (and b!882435 (not c!92967)) b!882434))

(assert (= (and b!882439 res!599534) b!882429))

(assert (= (and b!882434 c!92964) b!882431))

(assert (= (and b!882434 (not c!92964)) b!882438))

(declare-fun b_lambda!12645 () Bool)

(assert (=> (not b_lambda!12645) (not b!882429)))

(assert (=> b!882429 t!24759))

(declare-fun b_and!25483 () Bool)

(assert (= b_and!25481 (and (=> t!24759 result!9747) b_and!25483)))

(declare-fun b_lambda!12647 () Bool)

(assert (=> (not b_lambda!12647) (not b!882437)))

(assert (=> b!882437 t!24759))

(declare-fun b_and!25485 () Bool)

(assert (= b_and!25483 (and (=> t!24759 result!9747) b_and!25485)))

(declare-fun m!821935 () Bool)

(assert (=> d!108963 m!821935))

(assert (=> d!108963 m!821725))

(declare-fun m!821937 () Bool)

(assert (=> b!882438 m!821937))

(assert (=> b!882433 m!821683))

(assert (=> b!882433 m!821683))

(assert (=> b!882433 m!821711))

(declare-fun m!821939 () Bool)

(assert (=> b!882437 m!821939))

(declare-fun m!821941 () Bool)

(assert (=> b!882437 m!821941))

(assert (=> b!882437 m!821677))

(assert (=> b!882437 m!821939))

(assert (=> b!882437 m!821677))

(declare-fun m!821943 () Bool)

(assert (=> b!882437 m!821943))

(assert (=> b!882437 m!821941))

(declare-fun m!821945 () Bool)

(assert (=> b!882437 m!821945))

(assert (=> b!882437 m!821683))

(declare-fun m!821947 () Bool)

(assert (=> b!882437 m!821947))

(declare-fun m!821949 () Bool)

(assert (=> b!882437 m!821949))

(assert (=> b!882439 m!821683))

(assert (=> b!882439 m!821683))

(declare-fun m!821951 () Bool)

(assert (=> b!882439 m!821951))

(declare-fun m!821953 () Bool)

(assert (=> b!882431 m!821953))

(declare-fun m!821955 () Bool)

(assert (=> b!882432 m!821955))

(assert (=> b!882429 m!821939))

(assert (=> b!882429 m!821677))

(assert (=> b!882429 m!821939))

(assert (=> b!882429 m!821677))

(assert (=> b!882429 m!821943))

(assert (=> b!882429 m!821683))

(declare-fun m!821957 () Bool)

(assert (=> b!882429 m!821957))

(assert (=> b!882429 m!821683))

(assert (=> b!882430 m!821683))

(assert (=> b!882430 m!821683))

(assert (=> b!882430 m!821711))

(assert (=> bm!38948 m!821953))

(assert (=> b!882234 d!108963))

(declare-fun b!882441 () Bool)

(assert (=> b!882441 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25165 _keys!868)))))

(assert (=> b!882441 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25166 _values!688)))))

(declare-fun e!491111 () Bool)

(declare-fun lt!399147 () ListLongMap!10529)

(assert (=> b!882441 (= e!491111 (= (apply!384 lt!399147 (select (arr!24723 _keys!868) from!1053)) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!882442 () Bool)

(declare-fun e!491109 () Bool)

(assert (=> b!882442 (= e!491109 (validKeyInArray!0 (select (arr!24723 _keys!868) from!1053)))))

(assert (=> b!882442 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!882443 () Bool)

(declare-fun e!491108 () Bool)

(assert (=> b!882443 (= e!491108 (= lt!399147 (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!882444 () Bool)

(declare-fun res!599537 () Bool)

(declare-fun e!491110 () Bool)

(assert (=> b!882444 (=> (not res!599537) (not e!491110))))

(assert (=> b!882444 (= res!599537 (not (contains!4245 lt!399147 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!882445 () Bool)

(declare-fun e!491107 () ListLongMap!10529)

(declare-fun e!491106 () ListLongMap!10529)

(assert (=> b!882445 (= e!491107 e!491106)))

(declare-fun c!92970 () Bool)

(assert (=> b!882445 (= c!92970 (validKeyInArray!0 (select (arr!24723 _keys!868) from!1053)))))

(declare-fun b!882446 () Bool)

(declare-fun e!491105 () Bool)

(assert (=> b!882446 (= e!491105 e!491108)))

(declare-fun c!92968 () Bool)

(assert (=> b!882446 (= c!92968 (bvslt from!1053 (size!25165 _keys!868)))))

(declare-fun b!882447 () Bool)

(assert (=> b!882447 (= e!491110 e!491105)))

(declare-fun c!92971 () Bool)

(assert (=> b!882447 (= c!92971 e!491109)))

(declare-fun res!599539 () Bool)

(assert (=> b!882447 (=> (not res!599539) (not e!491109))))

(assert (=> b!882447 (= res!599539 (bvslt from!1053 (size!25165 _keys!868)))))

(declare-fun d!108965 () Bool)

(assert (=> d!108965 e!491110))

(declare-fun res!599540 () Bool)

(assert (=> d!108965 (=> (not res!599540) (not e!491110))))

(assert (=> d!108965 (= res!599540 (not (contains!4245 lt!399147 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108965 (= lt!399147 e!491107)))

(declare-fun c!92969 () Bool)

(assert (=> d!108965 (= c!92969 (bvsge from!1053 (size!25165 _keys!868)))))

(assert (=> d!108965 (validMask!0 mask!1196)))

(assert (=> d!108965 (= (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!399147)))

(declare-fun b!882448 () Bool)

(declare-fun call!38952 () ListLongMap!10529)

(assert (=> b!882448 (= e!491106 call!38952)))

(declare-fun b!882449 () Bool)

(declare-fun lt!399146 () Unit!30055)

(declare-fun lt!399148 () Unit!30055)

(assert (=> b!882449 (= lt!399146 lt!399148)))

(declare-fun lt!399144 () V!28577)

(declare-fun lt!399145 () ListLongMap!10529)

(declare-fun lt!399149 () (_ BitVec 64))

(declare-fun lt!399143 () (_ BitVec 64))

(assert (=> b!882449 (not (contains!4245 (+!2572 lt!399145 (tuple2!11771 lt!399149 lt!399144)) lt!399143))))

(assert (=> b!882449 (= lt!399148 (addStillNotContains!210 lt!399145 lt!399149 lt!399144 lt!399143))))

(assert (=> b!882449 (= lt!399143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!882449 (= lt!399144 (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!882449 (= lt!399149 (select (arr!24723 _keys!868) from!1053))))

(assert (=> b!882449 (= lt!399145 call!38952)))

(assert (=> b!882449 (= e!491106 (+!2572 call!38952 (tuple2!11771 (select (arr!24723 _keys!868) from!1053) (get!13028 (select (arr!24724 _values!688) from!1053) (dynLambda!1260 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882450 () Bool)

(assert (=> b!882450 (= e!491108 (isEmpty!676 lt!399147))))

(declare-fun b!882451 () Bool)

(assert (=> b!882451 (= e!491105 e!491111)))

(assert (=> b!882451 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25165 _keys!868)))))

(declare-fun res!599538 () Bool)

(assert (=> b!882451 (= res!599538 (contains!4245 lt!399147 (select (arr!24723 _keys!868) from!1053)))))

(assert (=> b!882451 (=> (not res!599538) (not e!491111))))

(declare-fun bm!38949 () Bool)

(assert (=> bm!38949 (= call!38952 (getCurrentListMapNoExtraKeys!3271 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!882452 () Bool)

(assert (=> b!882452 (= e!491107 (ListLongMap!10530 Nil!17562))))

(assert (= (and d!108965 c!92969) b!882452))

(assert (= (and d!108965 (not c!92969)) b!882445))

(assert (= (and b!882445 c!92970) b!882449))

(assert (= (and b!882445 (not c!92970)) b!882448))

(assert (= (or b!882449 b!882448) bm!38949))

(assert (= (and d!108965 res!599540) b!882444))

(assert (= (and b!882444 res!599537) b!882447))

(assert (= (and b!882447 res!599539) b!882442))

(assert (= (and b!882447 c!92971) b!882451))

(assert (= (and b!882447 (not c!92971)) b!882446))

(assert (= (and b!882451 res!599538) b!882441))

(assert (= (and b!882446 c!92968) b!882443))

(assert (= (and b!882446 (not c!92968)) b!882450))

(declare-fun b_lambda!12649 () Bool)

(assert (=> (not b_lambda!12649) (not b!882441)))

(assert (=> b!882441 t!24759))

(declare-fun b_and!25487 () Bool)

(assert (= b_and!25485 (and (=> t!24759 result!9747) b_and!25487)))

(declare-fun b_lambda!12651 () Bool)

(assert (=> (not b_lambda!12651) (not b!882449)))

(assert (=> b!882449 t!24759))

(declare-fun b_and!25489 () Bool)

(assert (= b_and!25487 (and (=> t!24759 result!9747) b_and!25489)))

(declare-fun m!821959 () Bool)

(assert (=> d!108965 m!821959))

(assert (=> d!108965 m!821725))

(declare-fun m!821961 () Bool)

(assert (=> b!882450 m!821961))

(assert (=> b!882445 m!821683))

(assert (=> b!882445 m!821683))

(assert (=> b!882445 m!821711))

(assert (=> b!882449 m!821675))

(declare-fun m!821963 () Bool)

(assert (=> b!882449 m!821963))

(assert (=> b!882449 m!821677))

(assert (=> b!882449 m!821675))

(assert (=> b!882449 m!821677))

(assert (=> b!882449 m!821679))

(assert (=> b!882449 m!821963))

(declare-fun m!821965 () Bool)

(assert (=> b!882449 m!821965))

(assert (=> b!882449 m!821683))

(declare-fun m!821967 () Bool)

(assert (=> b!882449 m!821967))

(declare-fun m!821969 () Bool)

(assert (=> b!882449 m!821969))

(assert (=> b!882451 m!821683))

(assert (=> b!882451 m!821683))

(declare-fun m!821971 () Bool)

(assert (=> b!882451 m!821971))

(declare-fun m!821973 () Bool)

(assert (=> b!882443 m!821973))

(declare-fun m!821975 () Bool)

(assert (=> b!882444 m!821975))

(assert (=> b!882441 m!821675))

(assert (=> b!882441 m!821677))

(assert (=> b!882441 m!821675))

(assert (=> b!882441 m!821677))

(assert (=> b!882441 m!821679))

(assert (=> b!882441 m!821683))

(declare-fun m!821977 () Bool)

(assert (=> b!882441 m!821977))

(assert (=> b!882441 m!821683))

(assert (=> b!882442 m!821683))

(assert (=> b!882442 m!821683))

(assert (=> b!882442 m!821711))

(assert (=> bm!38949 m!821973))

(assert (=> b!882234 d!108965))

(declare-fun b!882461 () Bool)

(declare-fun e!491119 () Bool)

(declare-fun call!38955 () Bool)

(assert (=> b!882461 (= e!491119 call!38955)))

(declare-fun b!882462 () Bool)

(declare-fun e!491118 () Bool)

(assert (=> b!882462 (= e!491118 e!491119)))

(declare-fun lt!399158 () (_ BitVec 64))

(assert (=> b!882462 (= lt!399158 (select (arr!24723 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!399157 () Unit!30055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51405 (_ BitVec 64) (_ BitVec 32)) Unit!30055)

(assert (=> b!882462 (= lt!399157 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!399158 #b00000000000000000000000000000000))))

(assert (=> b!882462 (arrayContainsKey!0 _keys!868 lt!399158 #b00000000000000000000000000000000)))

(declare-fun lt!399156 () Unit!30055)

(assert (=> b!882462 (= lt!399156 lt!399157)))

(declare-fun res!599546 () Bool)

(declare-datatypes ((SeekEntryResult!8756 0))(
  ( (MissingZero!8756 (index!37395 (_ BitVec 32))) (Found!8756 (index!37396 (_ BitVec 32))) (Intermediate!8756 (undefined!9568 Bool) (index!37397 (_ BitVec 32)) (x!74801 (_ BitVec 32))) (Undefined!8756) (MissingVacant!8756 (index!37398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51405 (_ BitVec 32)) SeekEntryResult!8756)

(assert (=> b!882462 (= res!599546 (= (seekEntryOrOpen!0 (select (arr!24723 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8756 #b00000000000000000000000000000000)))))

(assert (=> b!882462 (=> (not res!599546) (not e!491119))))

(declare-fun bm!38952 () Bool)

(assert (=> bm!38952 (= call!38955 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!882463 () Bool)

(declare-fun e!491120 () Bool)

(assert (=> b!882463 (= e!491120 e!491118)))

(declare-fun c!92974 () Bool)

(assert (=> b!882463 (= c!92974 (validKeyInArray!0 (select (arr!24723 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108967 () Bool)

(declare-fun res!599545 () Bool)

(assert (=> d!108967 (=> res!599545 e!491120)))

(assert (=> d!108967 (= res!599545 (bvsge #b00000000000000000000000000000000 (size!25165 _keys!868)))))

(assert (=> d!108967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!491120)))

(declare-fun b!882464 () Bool)

(assert (=> b!882464 (= e!491118 call!38955)))

(assert (= (and d!108967 (not res!599545)) b!882463))

(assert (= (and b!882463 c!92974) b!882462))

(assert (= (and b!882463 (not c!92974)) b!882464))

(assert (= (and b!882462 res!599546) b!882461))

(assert (= (or b!882461 b!882464) bm!38952))

(declare-fun m!821979 () Bool)

(assert (=> b!882462 m!821979))

(declare-fun m!821981 () Bool)

(assert (=> b!882462 m!821981))

(declare-fun m!821983 () Bool)

(assert (=> b!882462 m!821983))

(assert (=> b!882462 m!821979))

(declare-fun m!821985 () Bool)

(assert (=> b!882462 m!821985))

(declare-fun m!821987 () Bool)

(assert (=> bm!38952 m!821987))

(assert (=> b!882463 m!821979))

(assert (=> b!882463 m!821979))

(declare-fun m!821989 () Bool)

(assert (=> b!882463 m!821989))

(assert (=> b!882240 d!108967))

(declare-fun d!108969 () Bool)

(assert (=> d!108969 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!882230 d!108969))

(declare-fun d!108971 () Bool)

(declare-fun lt!399159 () Bool)

(assert (=> d!108971 (= lt!399159 (select (content!391 Nil!17561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!491121 () Bool)

(assert (=> d!108971 (= lt!399159 e!491121)))

(declare-fun res!599548 () Bool)

(assert (=> d!108971 (=> (not res!599548) (not e!491121))))

(assert (=> d!108971 (= res!599548 ((_ is Cons!17560) Nil!17561))))

(assert (=> d!108971 (= (contains!4243 Nil!17561 #b0000000000000000000000000000000000000000000000000000000000000000) lt!399159)))

(declare-fun b!882465 () Bool)

(declare-fun e!491122 () Bool)

(assert (=> b!882465 (= e!491121 e!491122)))

(declare-fun res!599547 () Bool)

(assert (=> b!882465 (=> res!599547 e!491122)))

(assert (=> b!882465 (= res!599547 (= (h!18691 Nil!17561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!882466 () Bool)

(assert (=> b!882466 (= e!491122 (contains!4243 (t!24760 Nil!17561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!108971 res!599548) b!882465))

(assert (= (and b!882465 (not res!599547)) b!882466))

(assert (=> d!108971 m!821843))

(declare-fun m!821991 () Bool)

(assert (=> d!108971 m!821991))

(declare-fun m!821993 () Bool)

(assert (=> b!882466 m!821993))

(assert (=> b!882241 d!108971))

(declare-fun d!108973 () Bool)

(declare-fun res!599553 () Bool)

(declare-fun e!491127 () Bool)

(assert (=> d!108973 (=> res!599553 e!491127)))

(assert (=> d!108973 (= res!599553 (= (select (arr!24723 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!108973 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!491127)))

(declare-fun b!882471 () Bool)

(declare-fun e!491128 () Bool)

(assert (=> b!882471 (= e!491127 e!491128)))

(declare-fun res!599554 () Bool)

(assert (=> b!882471 (=> (not res!599554) (not e!491128))))

(assert (=> b!882471 (= res!599554 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25165 _keys!868)))))

(declare-fun b!882472 () Bool)

(assert (=> b!882472 (= e!491128 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!108973 (not res!599553)) b!882471))

(assert (= (and b!882471 res!599554) b!882472))

(assert (=> d!108973 m!821881))

(declare-fun m!821995 () Bool)

(assert (=> b!882472 m!821995))

(assert (=> b!882242 d!108973))

(declare-fun d!108975 () Bool)

(assert (=> d!108975 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399162 () Unit!30055)

(declare-fun choose!114 (array!51405 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30055)

(assert (=> d!108975 (= lt!399162 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!108975 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!108975 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!399162)))

(declare-fun bs!24714 () Bool)

(assert (= bs!24714 d!108975))

(assert (=> bs!24714 m!821689))

(declare-fun m!821997 () Bool)

(assert (=> bs!24714 m!821997))

(assert (=> b!882242 d!108975))

(declare-fun bm!38955 () Bool)

(declare-fun call!38958 () Bool)

(declare-fun c!92977 () Bool)

(assert (=> bm!38955 (= call!38958 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!92977 (Cons!17560 (select (arr!24723 _keys!868) from!1053) Nil!17561) Nil!17561)))))

(declare-fun b!882483 () Bool)

(declare-fun e!491138 () Bool)

(declare-fun e!491140 () Bool)

(assert (=> b!882483 (= e!491138 e!491140)))

(assert (=> b!882483 (= c!92977 (validKeyInArray!0 (select (arr!24723 _keys!868) from!1053)))))

(declare-fun b!882484 () Bool)

(assert (=> b!882484 (= e!491140 call!38958)))

(declare-fun b!882485 () Bool)

(declare-fun e!491139 () Bool)

(assert (=> b!882485 (= e!491139 e!491138)))

(declare-fun res!599562 () Bool)

(assert (=> b!882485 (=> (not res!599562) (not e!491138))))

(declare-fun e!491137 () Bool)

(assert (=> b!882485 (= res!599562 (not e!491137))))

(declare-fun res!599561 () Bool)

(assert (=> b!882485 (=> (not res!599561) (not e!491137))))

(assert (=> b!882485 (= res!599561 (validKeyInArray!0 (select (arr!24723 _keys!868) from!1053)))))

(declare-fun d!108977 () Bool)

(declare-fun res!599563 () Bool)

(assert (=> d!108977 (=> res!599563 e!491139)))

(assert (=> d!108977 (= res!599563 (bvsge from!1053 (size!25165 _keys!868)))))

(assert (=> d!108977 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17561) e!491139)))

(declare-fun b!882486 () Bool)

(assert (=> b!882486 (= e!491137 (contains!4243 Nil!17561 (select (arr!24723 _keys!868) from!1053)))))

(declare-fun b!882487 () Bool)

(assert (=> b!882487 (= e!491140 call!38958)))

(assert (= (and d!108977 (not res!599563)) b!882485))

(assert (= (and b!882485 res!599561) b!882486))

(assert (= (and b!882485 res!599562) b!882483))

(assert (= (and b!882483 c!92977) b!882487))

(assert (= (and b!882483 (not c!92977)) b!882484))

(assert (= (or b!882487 b!882484) bm!38955))

(assert (=> bm!38955 m!821683))

(declare-fun m!821999 () Bool)

(assert (=> bm!38955 m!821999))

(assert (=> b!882483 m!821683))

(assert (=> b!882483 m!821683))

(assert (=> b!882483 m!821711))

(assert (=> b!882485 m!821683))

(assert (=> b!882485 m!821683))

(assert (=> b!882485 m!821711))

(assert (=> b!882486 m!821683))

(assert (=> b!882486 m!821683))

(declare-fun m!822001 () Bool)

(assert (=> b!882486 m!822001))

(assert (=> b!882242 d!108977))

(declare-fun d!108979 () Bool)

(assert (=> d!108979 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17561)))

(declare-fun lt!399165 () Unit!30055)

(declare-fun choose!39 (array!51405 (_ BitVec 32) (_ BitVec 32)) Unit!30055)

(assert (=> d!108979 (= lt!399165 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!108979 (bvslt (size!25165 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!108979 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!399165)))

(declare-fun bs!24715 () Bool)

(assert (= bs!24715 d!108979))

(assert (=> bs!24715 m!821693))

(declare-fun m!822003 () Bool)

(assert (=> bs!24715 m!822003))

(assert (=> b!882242 d!108979))

(declare-fun bm!38956 () Bool)

(declare-fun call!38959 () Bool)

(declare-fun c!92978 () Bool)

(assert (=> bm!38956 (= call!38959 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92978 (Cons!17560 (select (arr!24723 _keys!868) #b00000000000000000000000000000000) Nil!17561) Nil!17561)))))

(declare-fun b!882488 () Bool)

(declare-fun e!491142 () Bool)

(declare-fun e!491144 () Bool)

(assert (=> b!882488 (= e!491142 e!491144)))

(assert (=> b!882488 (= c!92978 (validKeyInArray!0 (select (arr!24723 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882489 () Bool)

(assert (=> b!882489 (= e!491144 call!38959)))

(declare-fun b!882490 () Bool)

(declare-fun e!491143 () Bool)

(assert (=> b!882490 (= e!491143 e!491142)))

(declare-fun res!599565 () Bool)

(assert (=> b!882490 (=> (not res!599565) (not e!491142))))

(declare-fun e!491141 () Bool)

(assert (=> b!882490 (= res!599565 (not e!491141))))

(declare-fun res!599564 () Bool)

(assert (=> b!882490 (=> (not res!599564) (not e!491141))))

(assert (=> b!882490 (= res!599564 (validKeyInArray!0 (select (arr!24723 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108981 () Bool)

(declare-fun res!599566 () Bool)

(assert (=> d!108981 (=> res!599566 e!491143)))

(assert (=> d!108981 (= res!599566 (bvsge #b00000000000000000000000000000000 (size!25165 _keys!868)))))

(assert (=> d!108981 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17561) e!491143)))

(declare-fun b!882491 () Bool)

(assert (=> b!882491 (= e!491141 (contains!4243 Nil!17561 (select (arr!24723 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!882492 () Bool)

(assert (=> b!882492 (= e!491144 call!38959)))

(assert (= (and d!108981 (not res!599566)) b!882490))

(assert (= (and b!882490 res!599564) b!882491))

(assert (= (and b!882490 res!599565) b!882488))

(assert (= (and b!882488 c!92978) b!882492))

(assert (= (and b!882488 (not c!92978)) b!882489))

(assert (= (or b!882492 b!882489) bm!38956))

(assert (=> bm!38956 m!821979))

(declare-fun m!822005 () Bool)

(assert (=> bm!38956 m!822005))

(assert (=> b!882488 m!821979))

(assert (=> b!882488 m!821979))

(assert (=> b!882488 m!821989))

(assert (=> b!882490 m!821979))

(assert (=> b!882490 m!821979))

(assert (=> b!882490 m!821989))

(assert (=> b!882491 m!821979))

(assert (=> b!882491 m!821979))

(declare-fun m!822007 () Bool)

(assert (=> b!882491 m!822007))

(assert (=> b!882231 d!108981))

(declare-fun d!108983 () Bool)

(declare-fun res!599571 () Bool)

(declare-fun e!491149 () Bool)

(assert (=> d!108983 (=> res!599571 e!491149)))

(assert (=> d!108983 (= res!599571 ((_ is Nil!17561) Nil!17561))))

(assert (=> d!108983 (= (noDuplicate!1325 Nil!17561) e!491149)))

(declare-fun b!882497 () Bool)

(declare-fun e!491150 () Bool)

(assert (=> b!882497 (= e!491149 e!491150)))

(declare-fun res!599572 () Bool)

(assert (=> b!882497 (=> (not res!599572) (not e!491150))))

(assert (=> b!882497 (= res!599572 (not (contains!4243 (t!24760 Nil!17561) (h!18691 Nil!17561))))))

(declare-fun b!882498 () Bool)

(assert (=> b!882498 (= e!491150 (noDuplicate!1325 (t!24760 Nil!17561)))))

(assert (= (and d!108983 (not res!599571)) b!882497))

(assert (= (and b!882497 res!599572) b!882498))

(declare-fun m!822009 () Bool)

(assert (=> b!882497 m!822009))

(declare-fun m!822011 () Bool)

(assert (=> b!882498 m!822011))

(assert (=> b!882238 d!108983))

(declare-fun d!108985 () Bool)

(assert (=> d!108985 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!882239 d!108985))

(declare-fun mapNonEmpty!28113 () Bool)

(declare-fun mapRes!28113 () Bool)

(declare-fun tp!53925 () Bool)

(declare-fun e!491156 () Bool)

(assert (=> mapNonEmpty!28113 (= mapRes!28113 (and tp!53925 e!491156))))

(declare-fun mapKey!28113 () (_ BitVec 32))

(declare-fun mapValue!28113 () ValueCell!8384)

(declare-fun mapRest!28113 () (Array (_ BitVec 32) ValueCell!8384))

(assert (=> mapNonEmpty!28113 (= mapRest!28104 (store mapRest!28113 mapKey!28113 mapValue!28113))))

(declare-fun mapIsEmpty!28113 () Bool)

(assert (=> mapIsEmpty!28113 mapRes!28113))

(declare-fun b!882506 () Bool)

(declare-fun e!491155 () Bool)

(assert (=> b!882506 (= e!491155 tp_is_empty!17647)))

(declare-fun condMapEmpty!28113 () Bool)

(declare-fun mapDefault!28113 () ValueCell!8384)

(assert (=> mapNonEmpty!28104 (= condMapEmpty!28113 (= mapRest!28104 ((as const (Array (_ BitVec 32) ValueCell!8384)) mapDefault!28113)))))

(assert (=> mapNonEmpty!28104 (= tp!53909 (and e!491155 mapRes!28113))))

(declare-fun b!882505 () Bool)

(assert (=> b!882505 (= e!491156 tp_is_empty!17647)))

(assert (= (and mapNonEmpty!28104 condMapEmpty!28113) mapIsEmpty!28113))

(assert (= (and mapNonEmpty!28104 (not condMapEmpty!28113)) mapNonEmpty!28113))

(assert (= (and mapNonEmpty!28113 ((_ is ValueCellFull!8384) mapValue!28113)) b!882505))

(assert (= (and mapNonEmpty!28104 ((_ is ValueCellFull!8384) mapDefault!28113)) b!882506))

(declare-fun m!822013 () Bool)

(assert (=> mapNonEmpty!28113 m!822013))

(declare-fun b_lambda!12653 () Bool)

(assert (= b_lambda!12645 (or (and start!74836 b_free!15403) b_lambda!12653)))

(declare-fun b_lambda!12655 () Bool)

(assert (= b_lambda!12643 (or (and start!74836 b_free!15403) b_lambda!12655)))

(declare-fun b_lambda!12657 () Bool)

(assert (= b_lambda!12639 (or (and start!74836 b_free!15403) b_lambda!12657)))

(declare-fun b_lambda!12659 () Bool)

(assert (= b_lambda!12647 (or (and start!74836 b_free!15403) b_lambda!12659)))

(declare-fun b_lambda!12661 () Bool)

(assert (= b_lambda!12651 (or (and start!74836 b_free!15403) b_lambda!12661)))

(declare-fun b_lambda!12663 () Bool)

(assert (= b_lambda!12637 (or (and start!74836 b_free!15403) b_lambda!12663)))

(declare-fun b_lambda!12665 () Bool)

(assert (= b_lambda!12641 (or (and start!74836 b_free!15403) b_lambda!12665)))

(declare-fun b_lambda!12667 () Bool)

(assert (= b_lambda!12649 (or (and start!74836 b_free!15403) b_lambda!12667)))

(check-sat (not b!882442) (not b!882485) (not d!108965) (not b!882406) (not b!882426) (not b!882497) (not b!882421) (not b!882425) (not b!882462) (not b!882420) (not b!882466) (not b!882431) (not bm!38945) (not d!108953) (not b!882368) (not bm!38956) (not b!882441) (not bm!38948) (not b!882486) (not b!882418) (not b_lambda!12657) (not b_lambda!12661) (not b!882404) (not b!882400) (not d!108943) (not b!882430) b_and!25489 (not b!882419) (not d!108955) (not b!882397) (not b_lambda!12665) (not d!108979) (not b!882450) (not b!882371) (not b!882488) (not b!882369) (not b!882472) (not bm!38949) (not b_next!15403) (not b!882429) (not b_lambda!12667) (not b!882483) (not d!108961) (not b!882432) (not b!882439) (not b!882416) (not b_lambda!12655) (not b!882357) (not b!882362) (not b!882398) (not b_lambda!12635) (not d!108949) (not b!882463) (not b!882363) (not b_lambda!12659) (not b!882444) (not b!882449) (not b!882451) (not b!882417) tp_is_empty!17647 (not b!882438) (not b!882437) (not b!882491) (not b!882399) (not b!882498) (not d!108963) (not bm!38955) (not b_lambda!12663) (not bm!38952) (not b!882427) (not bm!38946) (not d!108959) (not mapNonEmpty!28113) (not b!882433) (not d!108971) (not b!882490) (not b_lambda!12653) (not b!882370) (not bm!38947) (not b!882445) (not d!108975) (not b!882443) (not bm!38940) (not b!882396) (not b!882405))
(check-sat b_and!25489 (not b_next!15403))
