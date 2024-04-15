; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74932 () Bool)

(assert start!74932)

(declare-fun b_free!15469 () Bool)

(declare-fun b_next!15469 () Bool)

(assert (=> start!74932 (= b_free!15469 (not b_next!15469))))

(declare-fun tp!54111 () Bool)

(declare-fun b_and!25611 () Bool)

(assert (=> start!74932 (= tp!54111 b_and!25611)))

(declare-fun b!883994 () Bool)

(declare-fun e!491931 () Bool)

(declare-fun e!491938 () Bool)

(assert (=> b!883994 (= e!491931 e!491938)))

(declare-fun res!600595 () Bool)

(assert (=> b!883994 (=> (not res!600595) (not e!491938))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883994 (= res!600595 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28665 0))(
  ( (V!28666 (val!8904 Int)) )
))
(declare-datatypes ((ValueCell!8417 0))(
  ( (ValueCellFull!8417 (v!11367 V!28665)) (EmptyCell!8417) )
))
(declare-datatypes ((array!51533 0))(
  ( (array!51534 (arr!24786 (Array (_ BitVec 32) ValueCell!8417)) (size!25228 (_ BitVec 32))) )
))
(declare-fun lt!400263 () array!51533)

(declare-datatypes ((array!51535 0))(
  ( (array!51536 (arr!24787 (Array (_ BitVec 32) (_ BitVec 64))) (size!25229 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51535)

(declare-datatypes ((tuple2!11822 0))(
  ( (tuple2!11823 (_1!5922 (_ BitVec 64)) (_2!5922 V!28665)) )
))
(declare-datatypes ((List!17618 0))(
  ( (Nil!17615) (Cons!17614 (h!18745 tuple2!11822) (t!24880 List!17618)) )
))
(declare-datatypes ((ListLongMap!10581 0))(
  ( (ListLongMap!10582 (toList!5306 List!17618)) )
))
(declare-fun lt!400264 () ListLongMap!10581)

(declare-fun minValue!654 () V!28665)

(declare-fun zeroValue!654 () V!28665)

(declare-fun getCurrentListMapNoExtraKeys!3297 (array!51535 array!51533 (_ BitVec 32) (_ BitVec 32) V!28665 V!28665 (_ BitVec 32) Int) ListLongMap!10581)

(assert (=> b!883994 (= lt!400264 (getCurrentListMapNoExtraKeys!3297 _keys!868 lt!400263 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28665)

(declare-fun _values!688 () array!51533)

(assert (=> b!883994 (= lt!400263 (array!51534 (store (arr!24786 _values!688) i!612 (ValueCellFull!8417 v!557)) (size!25228 _values!688)))))

(declare-fun lt!400261 () ListLongMap!10581)

(assert (=> b!883994 (= lt!400261 (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!28206 () Bool)

(declare-fun mapRes!28206 () Bool)

(declare-fun tp!54110 () Bool)

(declare-fun e!491933 () Bool)

(assert (=> mapNonEmpty!28206 (= mapRes!28206 (and tp!54110 e!491933))))

(declare-fun mapValue!28206 () ValueCell!8417)

(declare-fun mapRest!28206 () (Array (_ BitVec 32) ValueCell!8417))

(declare-fun mapKey!28206 () (_ BitVec 32))

(assert (=> mapNonEmpty!28206 (= (arr!24786 _values!688) (store mapRest!28206 mapKey!28206 mapValue!28206))))

(declare-fun b!883995 () Bool)

(declare-fun res!600598 () Bool)

(assert (=> b!883995 (=> (not res!600598) (not e!491931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883995 (= res!600598 (validMask!0 mask!1196))))

(declare-fun b!883996 () Bool)

(declare-datatypes ((Unit!30136 0))(
  ( (Unit!30137) )
))
(declare-fun e!491936 () Unit!30136)

(declare-fun Unit!30138 () Unit!30136)

(assert (=> b!883996 (= e!491936 Unit!30138)))

(declare-fun lt!400257 () Unit!30136)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51535 (_ BitVec 32) (_ BitVec 32)) Unit!30136)

(assert (=> b!883996 (= lt!400257 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17619 0))(
  ( (Nil!17616) (Cons!17615 (h!18746 (_ BitVec 64)) (t!24881 List!17619)) )
))
(declare-fun arrayNoDuplicates!0 (array!51535 (_ BitVec 32) List!17619) Bool)

(assert (=> b!883996 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17616)))

(declare-fun lt!400252 () Unit!30136)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30136)

(assert (=> b!883996 (= lt!400252 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883996 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400259 () Unit!30136)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51535 (_ BitVec 64) (_ BitVec 32) List!17619) Unit!30136)

(assert (=> b!883996 (= lt!400259 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17616))))

(assert (=> b!883996 false))

(declare-fun b!883997 () Bool)

(declare-fun res!600603 () Bool)

(assert (=> b!883997 (=> (not res!600603) (not e!491931))))

(assert (=> b!883997 (= res!600603 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25229 _keys!868))))))

(declare-fun b!883998 () Bool)

(declare-fun lt!400260 () tuple2!11822)

(declare-fun e!491935 () Bool)

(declare-fun +!2597 (ListLongMap!10581 tuple2!11822) ListLongMap!10581)

(assert (=> b!883998 (= e!491935 (= lt!400264 (+!2597 lt!400261 lt!400260)))))

(declare-fun lt!400262 () ListLongMap!10581)

(declare-fun lt!400251 () tuple2!11822)

(declare-fun lt!400253 () ListLongMap!10581)

(assert (=> b!883998 (= lt!400262 (+!2597 (+!2597 lt!400253 lt!400251) lt!400260))))

(declare-fun lt!400265 () Unit!30136)

(declare-fun lt!400255 () V!28665)

(declare-fun addCommutativeForDiffKeys!552 (ListLongMap!10581 (_ BitVec 64) V!28665 (_ BitVec 64) V!28665) Unit!30136)

(assert (=> b!883998 (= lt!400265 (addCommutativeForDiffKeys!552 lt!400253 k0!854 v!557 (select (arr!24787 _keys!868) from!1053) lt!400255))))

(declare-fun b!883999 () Bool)

(declare-fun e!491934 () Bool)

(assert (=> b!883999 (= e!491934 e!491935)))

(declare-fun res!600594 () Bool)

(assert (=> b!883999 (=> res!600594 e!491935)))

(assert (=> b!883999 (= res!600594 (= k0!854 (select (arr!24787 _keys!868) from!1053)))))

(assert (=> b!883999 (not (= (select (arr!24787 _keys!868) from!1053) k0!854))))

(declare-fun lt!400254 () Unit!30136)

(assert (=> b!883999 (= lt!400254 e!491936)))

(declare-fun c!93044 () Bool)

(assert (=> b!883999 (= c!93044 (= (select (arr!24787 _keys!868) from!1053) k0!854))))

(assert (=> b!883999 (= lt!400264 lt!400262)))

(declare-fun lt!400266 () ListLongMap!10581)

(assert (=> b!883999 (= lt!400262 (+!2597 lt!400266 lt!400251))))

(assert (=> b!883999 (= lt!400251 (tuple2!11823 (select (arr!24787 _keys!868) from!1053) lt!400255))))

(declare-fun get!13073 (ValueCell!8417 V!28665) V!28665)

(declare-fun dynLambda!1281 (Int (_ BitVec 64)) V!28665)

(assert (=> b!883999 (= lt!400255 (get!13073 (select (arr!24786 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884000 () Bool)

(declare-fun e!491939 () Bool)

(declare-fun e!491937 () Bool)

(assert (=> b!884000 (= e!491939 (and e!491937 mapRes!28206))))

(declare-fun condMapEmpty!28206 () Bool)

(declare-fun mapDefault!28206 () ValueCell!8417)

(assert (=> b!884000 (= condMapEmpty!28206 (= (arr!24786 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8417)) mapDefault!28206)))))

(declare-fun b!884001 () Bool)

(declare-fun res!600599 () Bool)

(assert (=> b!884001 (=> (not res!600599) (not e!491931))))

(assert (=> b!884001 (= res!600599 (and (= (size!25228 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25229 _keys!868) (size!25228 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884002 () Bool)

(declare-fun Unit!30139 () Unit!30136)

(assert (=> b!884002 (= e!491936 Unit!30139)))

(declare-fun res!600596 () Bool)

(assert (=> start!74932 (=> (not res!600596) (not e!491931))))

(assert (=> start!74932 (= res!600596 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25229 _keys!868))))))

(assert (=> start!74932 e!491931))

(declare-fun tp_is_empty!17713 () Bool)

(assert (=> start!74932 tp_is_empty!17713))

(assert (=> start!74932 true))

(assert (=> start!74932 tp!54111))

(declare-fun array_inv!19564 (array!51535) Bool)

(assert (=> start!74932 (array_inv!19564 _keys!868)))

(declare-fun array_inv!19565 (array!51533) Bool)

(assert (=> start!74932 (and (array_inv!19565 _values!688) e!491939)))

(declare-fun b!884003 () Bool)

(assert (=> b!884003 (= e!491937 tp_is_empty!17713)))

(declare-fun b!884004 () Bool)

(declare-fun res!600597 () Bool)

(assert (=> b!884004 (=> (not res!600597) (not e!491931))))

(assert (=> b!884004 (= res!600597 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17616))))

(declare-fun mapIsEmpty!28206 () Bool)

(assert (=> mapIsEmpty!28206 mapRes!28206))

(declare-fun b!884005 () Bool)

(assert (=> b!884005 (= e!491938 (not e!491934))))

(declare-fun res!600600 () Bool)

(assert (=> b!884005 (=> res!600600 e!491934)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884005 (= res!600600 (not (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053))))))

(declare-fun lt!400258 () ListLongMap!10581)

(assert (=> b!884005 (= lt!400258 lt!400266)))

(assert (=> b!884005 (= lt!400266 (+!2597 lt!400253 lt!400260))))

(assert (=> b!884005 (= lt!400258 (getCurrentListMapNoExtraKeys!3297 _keys!868 lt!400263 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!884005 (= lt!400260 (tuple2!11823 k0!854 v!557))))

(assert (=> b!884005 (= lt!400253 (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400256 () Unit!30136)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!759 (array!51535 array!51533 (_ BitVec 32) (_ BitVec 32) V!28665 V!28665 (_ BitVec 32) (_ BitVec 64) V!28665 (_ BitVec 32) Int) Unit!30136)

(assert (=> b!884005 (= lt!400256 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!759 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884006 () Bool)

(assert (=> b!884006 (= e!491933 tp_is_empty!17713)))

(declare-fun b!884007 () Bool)

(declare-fun res!600601 () Bool)

(assert (=> b!884007 (=> (not res!600601) (not e!491931))))

(assert (=> b!884007 (= res!600601 (validKeyInArray!0 k0!854))))

(declare-fun b!884008 () Bool)

(declare-fun res!600602 () Bool)

(assert (=> b!884008 (=> (not res!600602) (not e!491931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51535 (_ BitVec 32)) Bool)

(assert (=> b!884008 (= res!600602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884009 () Bool)

(declare-fun res!600604 () Bool)

(assert (=> b!884009 (=> (not res!600604) (not e!491931))))

(assert (=> b!884009 (= res!600604 (and (= (select (arr!24787 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74932 res!600596) b!883995))

(assert (= (and b!883995 res!600598) b!884001))

(assert (= (and b!884001 res!600599) b!884008))

(assert (= (and b!884008 res!600602) b!884004))

(assert (= (and b!884004 res!600597) b!883997))

(assert (= (and b!883997 res!600603) b!884007))

(assert (= (and b!884007 res!600601) b!884009))

(assert (= (and b!884009 res!600604) b!883994))

(assert (= (and b!883994 res!600595) b!884005))

(assert (= (and b!884005 (not res!600600)) b!883999))

(assert (= (and b!883999 c!93044) b!883996))

(assert (= (and b!883999 (not c!93044)) b!884002))

(assert (= (and b!883999 (not res!600594)) b!883998))

(assert (= (and b!884000 condMapEmpty!28206) mapIsEmpty!28206))

(assert (= (and b!884000 (not condMapEmpty!28206)) mapNonEmpty!28206))

(get-info :version)

(assert (= (and mapNonEmpty!28206 ((_ is ValueCellFull!8417) mapValue!28206)) b!884006))

(assert (= (and b!884000 ((_ is ValueCellFull!8417) mapDefault!28206)) b!884003))

(assert (= start!74932 b!884000))

(declare-fun b_lambda!12729 () Bool)

(assert (=> (not b_lambda!12729) (not b!883999)))

(declare-fun t!24879 () Bool)

(declare-fun tb!5119 () Bool)

(assert (=> (and start!74932 (= defaultEntry!696 defaultEntry!696) t!24879) tb!5119))

(declare-fun result!9881 () Bool)

(assert (=> tb!5119 (= result!9881 tp_is_empty!17713)))

(assert (=> b!883999 t!24879))

(declare-fun b_and!25613 () Bool)

(assert (= b_and!25611 (and (=> t!24879 result!9881) b_and!25613)))

(declare-fun m!823635 () Bool)

(assert (=> b!884008 m!823635))

(declare-fun m!823637 () Bool)

(assert (=> b!883995 m!823637))

(declare-fun m!823639 () Bool)

(assert (=> mapNonEmpty!28206 m!823639))

(declare-fun m!823641 () Bool)

(assert (=> b!884007 m!823641))

(declare-fun m!823643 () Bool)

(assert (=> b!883998 m!823643))

(declare-fun m!823645 () Bool)

(assert (=> b!883998 m!823645))

(declare-fun m!823647 () Bool)

(assert (=> b!883998 m!823647))

(assert (=> b!883998 m!823643))

(assert (=> b!883998 m!823647))

(declare-fun m!823649 () Bool)

(assert (=> b!883998 m!823649))

(declare-fun m!823651 () Bool)

(assert (=> b!883998 m!823651))

(declare-fun m!823653 () Bool)

(assert (=> b!884005 m!823653))

(assert (=> b!884005 m!823647))

(declare-fun m!823655 () Bool)

(assert (=> b!884005 m!823655))

(assert (=> b!884005 m!823647))

(declare-fun m!823657 () Bool)

(assert (=> b!884005 m!823657))

(declare-fun m!823659 () Bool)

(assert (=> b!884005 m!823659))

(declare-fun m!823661 () Bool)

(assert (=> b!884005 m!823661))

(declare-fun m!823663 () Bool)

(assert (=> b!883994 m!823663))

(declare-fun m!823665 () Bool)

(assert (=> b!883994 m!823665))

(declare-fun m!823667 () Bool)

(assert (=> b!883994 m!823667))

(declare-fun m!823669 () Bool)

(assert (=> b!883999 m!823669))

(declare-fun m!823671 () Bool)

(assert (=> b!883999 m!823671))

(declare-fun m!823673 () Bool)

(assert (=> b!883999 m!823673))

(declare-fun m!823675 () Bool)

(assert (=> b!883999 m!823675))

(assert (=> b!883999 m!823671))

(assert (=> b!883999 m!823647))

(assert (=> b!883999 m!823673))

(declare-fun m!823677 () Bool)

(assert (=> b!884009 m!823677))

(declare-fun m!823679 () Bool)

(assert (=> start!74932 m!823679))

(declare-fun m!823681 () Bool)

(assert (=> start!74932 m!823681))

(declare-fun m!823683 () Bool)

(assert (=> b!884004 m!823683))

(declare-fun m!823685 () Bool)

(assert (=> b!883996 m!823685))

(declare-fun m!823687 () Bool)

(assert (=> b!883996 m!823687))

(declare-fun m!823689 () Bool)

(assert (=> b!883996 m!823689))

(declare-fun m!823691 () Bool)

(assert (=> b!883996 m!823691))

(declare-fun m!823693 () Bool)

(assert (=> b!883996 m!823693))

(check-sat (not mapNonEmpty!28206) (not b!884007) (not b!884008) (not b!884004) (not b!883994) tp_is_empty!17713 (not b!883995) (not b_next!15469) (not start!74932) (not b!883999) (not b!884005) (not b!883996) b_and!25613 (not b!883998) (not b_lambda!12729))
(check-sat b_and!25613 (not b_next!15469))
(get-model)

(declare-fun b_lambda!12735 () Bool)

(assert (= b_lambda!12729 (or (and start!74932 b_free!15469) b_lambda!12735)))

(check-sat (not mapNonEmpty!28206) (not b!884007) (not b!884008) (not b!884004) (not b!883994) tp_is_empty!17713 (not b!883998) (not b!883995) (not start!74932) (not b!883999) (not b!884005) (not b!883996) b_and!25613 (not b_next!15469) (not b_lambda!12735))
(check-sat b_and!25613 (not b_next!15469))
(get-model)

(declare-fun d!109009 () Bool)

(declare-fun e!491996 () Bool)

(assert (=> d!109009 e!491996))

(declare-fun res!600676 () Bool)

(assert (=> d!109009 (=> (not res!600676) (not e!491996))))

(declare-fun lt!400374 () ListLongMap!10581)

(declare-fun contains!4252 (ListLongMap!10581 (_ BitVec 64)) Bool)

(assert (=> d!109009 (= res!600676 (contains!4252 lt!400374 (_1!5922 lt!400260)))))

(declare-fun lt!400371 () List!17618)

(assert (=> d!109009 (= lt!400374 (ListLongMap!10582 lt!400371))))

(declare-fun lt!400373 () Unit!30136)

(declare-fun lt!400372 () Unit!30136)

(assert (=> d!109009 (= lt!400373 lt!400372)))

(declare-datatypes ((Option!431 0))(
  ( (Some!430 (v!11373 V!28665)) (None!429) )
))
(declare-fun getValueByKey!425 (List!17618 (_ BitVec 64)) Option!431)

(assert (=> d!109009 (= (getValueByKey!425 lt!400371 (_1!5922 lt!400260)) (Some!430 (_2!5922 lt!400260)))))

(declare-fun lemmaContainsTupThenGetReturnValue!242 (List!17618 (_ BitVec 64) V!28665) Unit!30136)

(assert (=> d!109009 (= lt!400372 (lemmaContainsTupThenGetReturnValue!242 lt!400371 (_1!5922 lt!400260) (_2!5922 lt!400260)))))

(declare-fun insertStrictlySorted!281 (List!17618 (_ BitVec 64) V!28665) List!17618)

(assert (=> d!109009 (= lt!400371 (insertStrictlySorted!281 (toList!5306 lt!400261) (_1!5922 lt!400260) (_2!5922 lt!400260)))))

(assert (=> d!109009 (= (+!2597 lt!400261 lt!400260) lt!400374)))

(declare-fun b!884116 () Bool)

(declare-fun res!600675 () Bool)

(assert (=> b!884116 (=> (not res!600675) (not e!491996))))

(assert (=> b!884116 (= res!600675 (= (getValueByKey!425 (toList!5306 lt!400374) (_1!5922 lt!400260)) (Some!430 (_2!5922 lt!400260))))))

(declare-fun b!884117 () Bool)

(declare-fun contains!4253 (List!17618 tuple2!11822) Bool)

(assert (=> b!884117 (= e!491996 (contains!4253 (toList!5306 lt!400374) lt!400260))))

(assert (= (and d!109009 res!600676) b!884116))

(assert (= (and b!884116 res!600675) b!884117))

(declare-fun m!823815 () Bool)

(assert (=> d!109009 m!823815))

(declare-fun m!823817 () Bool)

(assert (=> d!109009 m!823817))

(declare-fun m!823819 () Bool)

(assert (=> d!109009 m!823819))

(declare-fun m!823821 () Bool)

(assert (=> d!109009 m!823821))

(declare-fun m!823823 () Bool)

(assert (=> b!884116 m!823823))

(declare-fun m!823825 () Bool)

(assert (=> b!884117 m!823825))

(assert (=> b!883998 d!109009))

(declare-fun d!109011 () Bool)

(declare-fun e!491997 () Bool)

(assert (=> d!109011 e!491997))

(declare-fun res!600678 () Bool)

(assert (=> d!109011 (=> (not res!600678) (not e!491997))))

(declare-fun lt!400378 () ListLongMap!10581)

(assert (=> d!109011 (= res!600678 (contains!4252 lt!400378 (_1!5922 lt!400260)))))

(declare-fun lt!400375 () List!17618)

(assert (=> d!109011 (= lt!400378 (ListLongMap!10582 lt!400375))))

(declare-fun lt!400377 () Unit!30136)

(declare-fun lt!400376 () Unit!30136)

(assert (=> d!109011 (= lt!400377 lt!400376)))

(assert (=> d!109011 (= (getValueByKey!425 lt!400375 (_1!5922 lt!400260)) (Some!430 (_2!5922 lt!400260)))))

(assert (=> d!109011 (= lt!400376 (lemmaContainsTupThenGetReturnValue!242 lt!400375 (_1!5922 lt!400260) (_2!5922 lt!400260)))))

(assert (=> d!109011 (= lt!400375 (insertStrictlySorted!281 (toList!5306 (+!2597 lt!400253 lt!400251)) (_1!5922 lt!400260) (_2!5922 lt!400260)))))

(assert (=> d!109011 (= (+!2597 (+!2597 lt!400253 lt!400251) lt!400260) lt!400378)))

(declare-fun b!884118 () Bool)

(declare-fun res!600677 () Bool)

(assert (=> b!884118 (=> (not res!600677) (not e!491997))))

(assert (=> b!884118 (= res!600677 (= (getValueByKey!425 (toList!5306 lt!400378) (_1!5922 lt!400260)) (Some!430 (_2!5922 lt!400260))))))

(declare-fun b!884119 () Bool)

(assert (=> b!884119 (= e!491997 (contains!4253 (toList!5306 lt!400378) lt!400260))))

(assert (= (and d!109011 res!600678) b!884118))

(assert (= (and b!884118 res!600677) b!884119))

(declare-fun m!823827 () Bool)

(assert (=> d!109011 m!823827))

(declare-fun m!823829 () Bool)

(assert (=> d!109011 m!823829))

(declare-fun m!823831 () Bool)

(assert (=> d!109011 m!823831))

(declare-fun m!823833 () Bool)

(assert (=> d!109011 m!823833))

(declare-fun m!823835 () Bool)

(assert (=> b!884118 m!823835))

(declare-fun m!823837 () Bool)

(assert (=> b!884119 m!823837))

(assert (=> b!883998 d!109011))

(declare-fun d!109013 () Bool)

(declare-fun e!491998 () Bool)

(assert (=> d!109013 e!491998))

(declare-fun res!600680 () Bool)

(assert (=> d!109013 (=> (not res!600680) (not e!491998))))

(declare-fun lt!400382 () ListLongMap!10581)

(assert (=> d!109013 (= res!600680 (contains!4252 lt!400382 (_1!5922 lt!400251)))))

(declare-fun lt!400379 () List!17618)

(assert (=> d!109013 (= lt!400382 (ListLongMap!10582 lt!400379))))

(declare-fun lt!400381 () Unit!30136)

(declare-fun lt!400380 () Unit!30136)

(assert (=> d!109013 (= lt!400381 lt!400380)))

(assert (=> d!109013 (= (getValueByKey!425 lt!400379 (_1!5922 lt!400251)) (Some!430 (_2!5922 lt!400251)))))

(assert (=> d!109013 (= lt!400380 (lemmaContainsTupThenGetReturnValue!242 lt!400379 (_1!5922 lt!400251) (_2!5922 lt!400251)))))

(assert (=> d!109013 (= lt!400379 (insertStrictlySorted!281 (toList!5306 lt!400253) (_1!5922 lt!400251) (_2!5922 lt!400251)))))

(assert (=> d!109013 (= (+!2597 lt!400253 lt!400251) lt!400382)))

(declare-fun b!884120 () Bool)

(declare-fun res!600679 () Bool)

(assert (=> b!884120 (=> (not res!600679) (not e!491998))))

(assert (=> b!884120 (= res!600679 (= (getValueByKey!425 (toList!5306 lt!400382) (_1!5922 lt!400251)) (Some!430 (_2!5922 lt!400251))))))

(declare-fun b!884121 () Bool)

(assert (=> b!884121 (= e!491998 (contains!4253 (toList!5306 lt!400382) lt!400251))))

(assert (= (and d!109013 res!600680) b!884120))

(assert (= (and b!884120 res!600679) b!884121))

(declare-fun m!823839 () Bool)

(assert (=> d!109013 m!823839))

(declare-fun m!823841 () Bool)

(assert (=> d!109013 m!823841))

(declare-fun m!823843 () Bool)

(assert (=> d!109013 m!823843))

(declare-fun m!823845 () Bool)

(assert (=> d!109013 m!823845))

(declare-fun m!823847 () Bool)

(assert (=> b!884120 m!823847))

(declare-fun m!823849 () Bool)

(assert (=> b!884121 m!823849))

(assert (=> b!883998 d!109013))

(declare-fun d!109015 () Bool)

(assert (=> d!109015 (= (+!2597 (+!2597 lt!400253 (tuple2!11823 k0!854 v!557)) (tuple2!11823 (select (arr!24787 _keys!868) from!1053) lt!400255)) (+!2597 (+!2597 lt!400253 (tuple2!11823 (select (arr!24787 _keys!868) from!1053) lt!400255)) (tuple2!11823 k0!854 v!557)))))

(declare-fun lt!400385 () Unit!30136)

(declare-fun choose!1450 (ListLongMap!10581 (_ BitVec 64) V!28665 (_ BitVec 64) V!28665) Unit!30136)

(assert (=> d!109015 (= lt!400385 (choose!1450 lt!400253 k0!854 v!557 (select (arr!24787 _keys!868) from!1053) lt!400255))))

(assert (=> d!109015 (not (= k0!854 (select (arr!24787 _keys!868) from!1053)))))

(assert (=> d!109015 (= (addCommutativeForDiffKeys!552 lt!400253 k0!854 v!557 (select (arr!24787 _keys!868) from!1053) lt!400255) lt!400385)))

(declare-fun bs!24749 () Bool)

(assert (= bs!24749 d!109015))

(declare-fun m!823851 () Bool)

(assert (=> bs!24749 m!823851))

(assert (=> bs!24749 m!823647))

(declare-fun m!823853 () Bool)

(assert (=> bs!24749 m!823853))

(declare-fun m!823855 () Bool)

(assert (=> bs!24749 m!823855))

(assert (=> bs!24749 m!823855))

(declare-fun m!823857 () Bool)

(assert (=> bs!24749 m!823857))

(assert (=> bs!24749 m!823851))

(declare-fun m!823859 () Bool)

(assert (=> bs!24749 m!823859))

(assert (=> b!883998 d!109015))

(declare-fun b!884146 () Bool)

(declare-fun e!492016 () Bool)

(declare-fun e!492013 () Bool)

(assert (=> b!884146 (= e!492016 e!492013)))

(assert (=> b!884146 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25229 _keys!868)))))

(declare-fun lt!400406 () ListLongMap!10581)

(declare-fun res!600689 () Bool)

(assert (=> b!884146 (= res!600689 (contains!4252 lt!400406 (select (arr!24787 _keys!868) from!1053)))))

(assert (=> b!884146 (=> (not res!600689) (not e!492013))))

(declare-fun b!884147 () Bool)

(declare-fun e!492014 () Bool)

(declare-fun isEmpty!677 (ListLongMap!10581) Bool)

(assert (=> b!884147 (= e!492014 (isEmpty!677 lt!400406))))

(declare-fun b!884148 () Bool)

(declare-fun e!492018 () ListLongMap!10581)

(assert (=> b!884148 (= e!492018 (ListLongMap!10582 Nil!17615))))

(declare-fun b!884149 () Bool)

(declare-fun e!492017 () ListLongMap!10581)

(declare-fun call!38962 () ListLongMap!10581)

(assert (=> b!884149 (= e!492017 call!38962)))

(declare-fun b!884150 () Bool)

(assert (=> b!884150 (= e!492018 e!492017)))

(declare-fun c!93061 () Bool)

(assert (=> b!884150 (= c!93061 (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053)))))

(declare-fun d!109017 () Bool)

(declare-fun e!492019 () Bool)

(assert (=> d!109017 e!492019))

(declare-fun res!600692 () Bool)

(assert (=> d!109017 (=> (not res!600692) (not e!492019))))

(assert (=> d!109017 (= res!600692 (not (contains!4252 lt!400406 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109017 (= lt!400406 e!492018)))

(declare-fun c!93059 () Bool)

(assert (=> d!109017 (= c!93059 (bvsge from!1053 (size!25229 _keys!868)))))

(assert (=> d!109017 (validMask!0 mask!1196)))

(assert (=> d!109017 (= (getCurrentListMapNoExtraKeys!3297 _keys!868 lt!400263 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!400406)))

(declare-fun b!884151 () Bool)

(declare-fun e!492015 () Bool)

(assert (=> b!884151 (= e!492015 (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053)))))

(assert (=> b!884151 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!884152 () Bool)

(assert (=> b!884152 (= e!492019 e!492016)))

(declare-fun c!93060 () Bool)

(assert (=> b!884152 (= c!93060 e!492015)))

(declare-fun res!600690 () Bool)

(assert (=> b!884152 (=> (not res!600690) (not e!492015))))

(assert (=> b!884152 (= res!600690 (bvslt from!1053 (size!25229 _keys!868)))))

(declare-fun b!884153 () Bool)

(assert (=> b!884153 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25229 _keys!868)))))

(assert (=> b!884153 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25228 lt!400263)))))

(declare-fun apply!385 (ListLongMap!10581 (_ BitVec 64)) V!28665)

(assert (=> b!884153 (= e!492013 (= (apply!385 lt!400406 (select (arr!24787 _keys!868) from!1053)) (get!13073 (select (arr!24786 lt!400263) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884154 () Bool)

(declare-fun lt!400400 () Unit!30136)

(declare-fun lt!400401 () Unit!30136)

(assert (=> b!884154 (= lt!400400 lt!400401)))

(declare-fun lt!400402 () ListLongMap!10581)

(declare-fun lt!400404 () (_ BitVec 64))

(declare-fun lt!400403 () (_ BitVec 64))

(declare-fun lt!400405 () V!28665)

(assert (=> b!884154 (not (contains!4252 (+!2597 lt!400402 (tuple2!11823 lt!400404 lt!400405)) lt!400403))))

(declare-fun addStillNotContains!211 (ListLongMap!10581 (_ BitVec 64) V!28665 (_ BitVec 64)) Unit!30136)

(assert (=> b!884154 (= lt!400401 (addStillNotContains!211 lt!400402 lt!400404 lt!400405 lt!400403))))

(assert (=> b!884154 (= lt!400403 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884154 (= lt!400405 (get!13073 (select (arr!24786 lt!400263) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884154 (= lt!400404 (select (arr!24787 _keys!868) from!1053))))

(assert (=> b!884154 (= lt!400402 call!38962)))

(assert (=> b!884154 (= e!492017 (+!2597 call!38962 (tuple2!11823 (select (arr!24787 _keys!868) from!1053) (get!13073 (select (arr!24786 lt!400263) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884155 () Bool)

(assert (=> b!884155 (= e!492014 (= lt!400406 (getCurrentListMapNoExtraKeys!3297 _keys!868 lt!400263 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884156 () Bool)

(declare-fun res!600691 () Bool)

(assert (=> b!884156 (=> (not res!600691) (not e!492019))))

(assert (=> b!884156 (= res!600691 (not (contains!4252 lt!400406 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38959 () Bool)

(assert (=> bm!38959 (= call!38962 (getCurrentListMapNoExtraKeys!3297 _keys!868 lt!400263 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884157 () Bool)

(assert (=> b!884157 (= e!492016 e!492014)))

(declare-fun c!93062 () Bool)

(assert (=> b!884157 (= c!93062 (bvslt from!1053 (size!25229 _keys!868)))))

(assert (= (and d!109017 c!93059) b!884148))

(assert (= (and d!109017 (not c!93059)) b!884150))

(assert (= (and b!884150 c!93061) b!884154))

(assert (= (and b!884150 (not c!93061)) b!884149))

(assert (= (or b!884154 b!884149) bm!38959))

(assert (= (and d!109017 res!600692) b!884156))

(assert (= (and b!884156 res!600691) b!884152))

(assert (= (and b!884152 res!600690) b!884151))

(assert (= (and b!884152 c!93060) b!884146))

(assert (= (and b!884152 (not c!93060)) b!884157))

(assert (= (and b!884146 res!600689) b!884153))

(assert (= (and b!884157 c!93062) b!884155))

(assert (= (and b!884157 (not c!93062)) b!884147))

(declare-fun b_lambda!12737 () Bool)

(assert (=> (not b_lambda!12737) (not b!884153)))

(assert (=> b!884153 t!24879))

(declare-fun b_and!25623 () Bool)

(assert (= b_and!25613 (and (=> t!24879 result!9881) b_and!25623)))

(declare-fun b_lambda!12739 () Bool)

(assert (=> (not b_lambda!12739) (not b!884154)))

(assert (=> b!884154 t!24879))

(declare-fun b_and!25625 () Bool)

(assert (= b_and!25623 (and (=> t!24879 result!9881) b_and!25625)))

(assert (=> b!884146 m!823647))

(assert (=> b!884146 m!823647))

(declare-fun m!823861 () Bool)

(assert (=> b!884146 m!823861))

(declare-fun m!823863 () Bool)

(assert (=> b!884155 m!823863))

(assert (=> b!884151 m!823647))

(assert (=> b!884151 m!823647))

(assert (=> b!884151 m!823655))

(declare-fun m!823865 () Bool)

(assert (=> b!884156 m!823865))

(assert (=> b!884154 m!823673))

(declare-fun m!823867 () Bool)

(assert (=> b!884154 m!823867))

(declare-fun m!823869 () Bool)

(assert (=> b!884154 m!823869))

(assert (=> b!884154 m!823647))

(declare-fun m!823871 () Bool)

(assert (=> b!884154 m!823871))

(assert (=> b!884154 m!823673))

(declare-fun m!823873 () Bool)

(assert (=> b!884154 m!823873))

(declare-fun m!823875 () Bool)

(assert (=> b!884154 m!823875))

(assert (=> b!884154 m!823867))

(declare-fun m!823877 () Bool)

(assert (=> b!884154 m!823877))

(assert (=> b!884154 m!823871))

(assert (=> bm!38959 m!823863))

(declare-fun m!823879 () Bool)

(assert (=> d!109017 m!823879))

(assert (=> d!109017 m!823637))

(assert (=> b!884153 m!823673))

(assert (=> b!884153 m!823647))

(assert (=> b!884153 m!823871))

(assert (=> b!884153 m!823673))

(assert (=> b!884153 m!823873))

(assert (=> b!884153 m!823647))

(declare-fun m!823881 () Bool)

(assert (=> b!884153 m!823881))

(assert (=> b!884153 m!823871))

(assert (=> b!884150 m!823647))

(assert (=> b!884150 m!823647))

(assert (=> b!884150 m!823655))

(declare-fun m!823883 () Bool)

(assert (=> b!884147 m!823883))

(assert (=> b!883994 d!109017))

(declare-fun b!884158 () Bool)

(declare-fun e!492023 () Bool)

(declare-fun e!492020 () Bool)

(assert (=> b!884158 (= e!492023 e!492020)))

(assert (=> b!884158 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25229 _keys!868)))))

(declare-fun res!600693 () Bool)

(declare-fun lt!400413 () ListLongMap!10581)

(assert (=> b!884158 (= res!600693 (contains!4252 lt!400413 (select (arr!24787 _keys!868) from!1053)))))

(assert (=> b!884158 (=> (not res!600693) (not e!492020))))

(declare-fun b!884159 () Bool)

(declare-fun e!492021 () Bool)

(assert (=> b!884159 (= e!492021 (isEmpty!677 lt!400413))))

(declare-fun b!884160 () Bool)

(declare-fun e!492025 () ListLongMap!10581)

(assert (=> b!884160 (= e!492025 (ListLongMap!10582 Nil!17615))))

(declare-fun b!884161 () Bool)

(declare-fun e!492024 () ListLongMap!10581)

(declare-fun call!38963 () ListLongMap!10581)

(assert (=> b!884161 (= e!492024 call!38963)))

(declare-fun b!884162 () Bool)

(assert (=> b!884162 (= e!492025 e!492024)))

(declare-fun c!93065 () Bool)

(assert (=> b!884162 (= c!93065 (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053)))))

(declare-fun d!109019 () Bool)

(declare-fun e!492026 () Bool)

(assert (=> d!109019 e!492026))

(declare-fun res!600696 () Bool)

(assert (=> d!109019 (=> (not res!600696) (not e!492026))))

(assert (=> d!109019 (= res!600696 (not (contains!4252 lt!400413 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109019 (= lt!400413 e!492025)))

(declare-fun c!93063 () Bool)

(assert (=> d!109019 (= c!93063 (bvsge from!1053 (size!25229 _keys!868)))))

(assert (=> d!109019 (validMask!0 mask!1196)))

(assert (=> d!109019 (= (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!400413)))

(declare-fun b!884163 () Bool)

(declare-fun e!492022 () Bool)

(assert (=> b!884163 (= e!492022 (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053)))))

(assert (=> b!884163 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!884164 () Bool)

(assert (=> b!884164 (= e!492026 e!492023)))

(declare-fun c!93064 () Bool)

(assert (=> b!884164 (= c!93064 e!492022)))

(declare-fun res!600694 () Bool)

(assert (=> b!884164 (=> (not res!600694) (not e!492022))))

(assert (=> b!884164 (= res!600694 (bvslt from!1053 (size!25229 _keys!868)))))

(declare-fun b!884165 () Bool)

(assert (=> b!884165 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25229 _keys!868)))))

(assert (=> b!884165 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25228 _values!688)))))

(assert (=> b!884165 (= e!492020 (= (apply!385 lt!400413 (select (arr!24787 _keys!868) from!1053)) (get!13073 (select (arr!24786 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884166 () Bool)

(declare-fun lt!400407 () Unit!30136)

(declare-fun lt!400408 () Unit!30136)

(assert (=> b!884166 (= lt!400407 lt!400408)))

(declare-fun lt!400410 () (_ BitVec 64))

(declare-fun lt!400411 () (_ BitVec 64))

(declare-fun lt!400409 () ListLongMap!10581)

(declare-fun lt!400412 () V!28665)

(assert (=> b!884166 (not (contains!4252 (+!2597 lt!400409 (tuple2!11823 lt!400411 lt!400412)) lt!400410))))

(assert (=> b!884166 (= lt!400408 (addStillNotContains!211 lt!400409 lt!400411 lt!400412 lt!400410))))

(assert (=> b!884166 (= lt!400410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884166 (= lt!400412 (get!13073 (select (arr!24786 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884166 (= lt!400411 (select (arr!24787 _keys!868) from!1053))))

(assert (=> b!884166 (= lt!400409 call!38963)))

(assert (=> b!884166 (= e!492024 (+!2597 call!38963 (tuple2!11823 (select (arr!24787 _keys!868) from!1053) (get!13073 (select (arr!24786 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884167 () Bool)

(assert (=> b!884167 (= e!492021 (= lt!400413 (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884168 () Bool)

(declare-fun res!600695 () Bool)

(assert (=> b!884168 (=> (not res!600695) (not e!492026))))

(assert (=> b!884168 (= res!600695 (not (contains!4252 lt!400413 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38960 () Bool)

(assert (=> bm!38960 (= call!38963 (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884169 () Bool)

(assert (=> b!884169 (= e!492023 e!492021)))

(declare-fun c!93066 () Bool)

(assert (=> b!884169 (= c!93066 (bvslt from!1053 (size!25229 _keys!868)))))

(assert (= (and d!109019 c!93063) b!884160))

(assert (= (and d!109019 (not c!93063)) b!884162))

(assert (= (and b!884162 c!93065) b!884166))

(assert (= (and b!884162 (not c!93065)) b!884161))

(assert (= (or b!884166 b!884161) bm!38960))

(assert (= (and d!109019 res!600696) b!884168))

(assert (= (and b!884168 res!600695) b!884164))

(assert (= (and b!884164 res!600694) b!884163))

(assert (= (and b!884164 c!93064) b!884158))

(assert (= (and b!884164 (not c!93064)) b!884169))

(assert (= (and b!884158 res!600693) b!884165))

(assert (= (and b!884169 c!93066) b!884167))

(assert (= (and b!884169 (not c!93066)) b!884159))

(declare-fun b_lambda!12741 () Bool)

(assert (=> (not b_lambda!12741) (not b!884165)))

(assert (=> b!884165 t!24879))

(declare-fun b_and!25627 () Bool)

(assert (= b_and!25625 (and (=> t!24879 result!9881) b_and!25627)))

(declare-fun b_lambda!12743 () Bool)

(assert (=> (not b_lambda!12743) (not b!884166)))

(assert (=> b!884166 t!24879))

(declare-fun b_and!25629 () Bool)

(assert (= b_and!25627 (and (=> t!24879 result!9881) b_and!25629)))

(assert (=> b!884158 m!823647))

(assert (=> b!884158 m!823647))

(declare-fun m!823885 () Bool)

(assert (=> b!884158 m!823885))

(declare-fun m!823887 () Bool)

(assert (=> b!884167 m!823887))

(assert (=> b!884163 m!823647))

(assert (=> b!884163 m!823647))

(assert (=> b!884163 m!823655))

(declare-fun m!823889 () Bool)

(assert (=> b!884168 m!823889))

(assert (=> b!884166 m!823673))

(declare-fun m!823891 () Bool)

(assert (=> b!884166 m!823891))

(declare-fun m!823893 () Bool)

(assert (=> b!884166 m!823893))

(assert (=> b!884166 m!823647))

(assert (=> b!884166 m!823671))

(assert (=> b!884166 m!823673))

(assert (=> b!884166 m!823675))

(declare-fun m!823895 () Bool)

(assert (=> b!884166 m!823895))

(assert (=> b!884166 m!823891))

(declare-fun m!823897 () Bool)

(assert (=> b!884166 m!823897))

(assert (=> b!884166 m!823671))

(assert (=> bm!38960 m!823887))

(declare-fun m!823899 () Bool)

(assert (=> d!109019 m!823899))

(assert (=> d!109019 m!823637))

(assert (=> b!884165 m!823673))

(assert (=> b!884165 m!823647))

(assert (=> b!884165 m!823671))

(assert (=> b!884165 m!823673))

(assert (=> b!884165 m!823675))

(assert (=> b!884165 m!823647))

(declare-fun m!823901 () Bool)

(assert (=> b!884165 m!823901))

(assert (=> b!884165 m!823671))

(assert (=> b!884162 m!823647))

(assert (=> b!884162 m!823647))

(assert (=> b!884162 m!823655))

(declare-fun m!823903 () Bool)

(assert (=> b!884159 m!823903))

(assert (=> b!883994 d!109019))

(declare-fun d!109021 () Bool)

(declare-fun res!600702 () Bool)

(declare-fun e!492033 () Bool)

(assert (=> d!109021 (=> res!600702 e!492033)))

(assert (=> d!109021 (= res!600702 (bvsge #b00000000000000000000000000000000 (size!25229 _keys!868)))))

(assert (=> d!109021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!492033)))

(declare-fun b!884178 () Bool)

(declare-fun e!492035 () Bool)

(declare-fun call!38966 () Bool)

(assert (=> b!884178 (= e!492035 call!38966)))

(declare-fun bm!38963 () Bool)

(assert (=> bm!38963 (= call!38966 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!884179 () Bool)

(assert (=> b!884179 (= e!492033 e!492035)))

(declare-fun c!93069 () Bool)

(assert (=> b!884179 (= c!93069 (validKeyInArray!0 (select (arr!24787 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884180 () Bool)

(declare-fun e!492034 () Bool)

(assert (=> b!884180 (= e!492034 call!38966)))

(declare-fun b!884181 () Bool)

(assert (=> b!884181 (= e!492035 e!492034)))

(declare-fun lt!400421 () (_ BitVec 64))

(assert (=> b!884181 (= lt!400421 (select (arr!24787 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!400420 () Unit!30136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51535 (_ BitVec 64) (_ BitVec 32)) Unit!30136)

(assert (=> b!884181 (= lt!400420 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!400421 #b00000000000000000000000000000000))))

(assert (=> b!884181 (arrayContainsKey!0 _keys!868 lt!400421 #b00000000000000000000000000000000)))

(declare-fun lt!400422 () Unit!30136)

(assert (=> b!884181 (= lt!400422 lt!400420)))

(declare-fun res!600701 () Bool)

(declare-datatypes ((SeekEntryResult!8757 0))(
  ( (MissingZero!8757 (index!37399 (_ BitVec 32))) (Found!8757 (index!37400 (_ BitVec 32))) (Intermediate!8757 (undefined!9569 Bool) (index!37401 (_ BitVec 32)) (x!74967 (_ BitVec 32))) (Undefined!8757) (MissingVacant!8757 (index!37402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51535 (_ BitVec 32)) SeekEntryResult!8757)

(assert (=> b!884181 (= res!600701 (= (seekEntryOrOpen!0 (select (arr!24787 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8757 #b00000000000000000000000000000000)))))

(assert (=> b!884181 (=> (not res!600701) (not e!492034))))

(assert (= (and d!109021 (not res!600702)) b!884179))

(assert (= (and b!884179 c!93069) b!884181))

(assert (= (and b!884179 (not c!93069)) b!884178))

(assert (= (and b!884181 res!600701) b!884180))

(assert (= (or b!884180 b!884178) bm!38963))

(declare-fun m!823905 () Bool)

(assert (=> bm!38963 m!823905))

(declare-fun m!823907 () Bool)

(assert (=> b!884179 m!823907))

(assert (=> b!884179 m!823907))

(declare-fun m!823909 () Bool)

(assert (=> b!884179 m!823909))

(assert (=> b!884181 m!823907))

(declare-fun m!823911 () Bool)

(assert (=> b!884181 m!823911))

(declare-fun m!823913 () Bool)

(assert (=> b!884181 m!823913))

(assert (=> b!884181 m!823907))

(declare-fun m!823915 () Bool)

(assert (=> b!884181 m!823915))

(assert (=> b!884008 d!109021))

(declare-fun d!109023 () Bool)

(assert (=> d!109023 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!884007 d!109023))

(declare-fun d!109025 () Bool)

(assert (=> d!109025 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17616)))

(declare-fun lt!400425 () Unit!30136)

(declare-fun choose!39 (array!51535 (_ BitVec 32) (_ BitVec 32)) Unit!30136)

(assert (=> d!109025 (= lt!400425 (choose!39 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> d!109025 (bvslt (size!25229 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109025 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053) lt!400425)))

(declare-fun bs!24750 () Bool)

(assert (= bs!24750 d!109025))

(assert (=> bs!24750 m!823685))

(declare-fun m!823917 () Bool)

(assert (=> bs!24750 m!823917))

(assert (=> b!883996 d!109025))

(declare-fun d!109027 () Bool)

(assert (=> d!109027 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400428 () Unit!30136)

(declare-fun choose!114 (array!51535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30136)

(assert (=> d!109027 (= lt!400428 (choose!114 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> d!109027 (bvsge i!612 #b00000000000000000000000000000000)))

(assert (=> d!109027 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)) lt!400428)))

(declare-fun bs!24751 () Bool)

(assert (= bs!24751 d!109027))

(assert (=> bs!24751 m!823693))

(declare-fun m!823919 () Bool)

(assert (=> bs!24751 m!823919))

(assert (=> b!883996 d!109027))

(declare-fun d!109029 () Bool)

(assert (=> d!109029 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25229 _keys!868)) (not (= (select (arr!24787 _keys!868) from!1053) k0!854)))))

(declare-fun lt!400431 () Unit!30136)

(declare-fun choose!21 (array!51535 (_ BitVec 64) (_ BitVec 32) List!17619) Unit!30136)

(assert (=> d!109029 (= lt!400431 (choose!21 _keys!868 k0!854 from!1053 Nil!17616))))

(assert (=> d!109029 (bvslt (size!25229 _keys!868) #b01111111111111111111111111111111)))

(assert (=> d!109029 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17616) lt!400431)))

(declare-fun bs!24752 () Bool)

(assert (= bs!24752 d!109029))

(assert (=> bs!24752 m!823647))

(declare-fun m!823921 () Bool)

(assert (=> bs!24752 m!823921))

(assert (=> b!883996 d!109029))

(declare-fun d!109031 () Bool)

(declare-fun res!600707 () Bool)

(declare-fun e!492040 () Bool)

(assert (=> d!109031 (=> res!600707 e!492040)))

(assert (=> d!109031 (= res!600707 (= (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) k0!854))))

(assert (=> d!109031 (= (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053)) e!492040)))

(declare-fun b!884186 () Bool)

(declare-fun e!492041 () Bool)

(assert (=> b!884186 (= e!492040 e!492041)))

(declare-fun res!600708 () Bool)

(assert (=> b!884186 (=> (not res!600708) (not e!492041))))

(assert (=> b!884186 (= res!600708 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!25229 _keys!868)))))

(declare-fun b!884187 () Bool)

(assert (=> b!884187 (= e!492041 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (= (and d!109031 (not res!600707)) b!884186))

(assert (= (and b!884186 res!600708) b!884187))

(declare-fun m!823923 () Bool)

(assert (=> d!109031 m!823923))

(declare-fun m!823925 () Bool)

(assert (=> b!884187 m!823925))

(assert (=> b!883996 d!109031))

(declare-fun c!93072 () Bool)

(declare-fun bm!38966 () Bool)

(declare-fun call!38969 () Bool)

(assert (=> bm!38966 (= call!38969 (arrayNoDuplicates!0 _keys!868 (bvadd from!1053 #b00000000000000000000000000000001) (ite c!93072 (Cons!17615 (select (arr!24787 _keys!868) from!1053) Nil!17616) Nil!17616)))))

(declare-fun b!884198 () Bool)

(declare-fun e!492053 () Bool)

(declare-fun e!492052 () Bool)

(assert (=> b!884198 (= e!492053 e!492052)))

(declare-fun res!600715 () Bool)

(assert (=> b!884198 (=> (not res!600715) (not e!492052))))

(declare-fun e!492050 () Bool)

(assert (=> b!884198 (= res!600715 (not e!492050))))

(declare-fun res!600716 () Bool)

(assert (=> b!884198 (=> (not res!600716) (not e!492050))))

(assert (=> b!884198 (= res!600716 (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053)))))

(declare-fun d!109033 () Bool)

(declare-fun res!600717 () Bool)

(assert (=> d!109033 (=> res!600717 e!492053)))

(assert (=> d!109033 (= res!600717 (bvsge from!1053 (size!25229 _keys!868)))))

(assert (=> d!109033 (= (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17616) e!492053)))

(declare-fun b!884199 () Bool)

(declare-fun e!492051 () Bool)

(assert (=> b!884199 (= e!492051 call!38969)))

(declare-fun b!884200 () Bool)

(declare-fun contains!4254 (List!17619 (_ BitVec 64)) Bool)

(assert (=> b!884200 (= e!492050 (contains!4254 Nil!17616 (select (arr!24787 _keys!868) from!1053)))))

(declare-fun b!884201 () Bool)

(assert (=> b!884201 (= e!492051 call!38969)))

(declare-fun b!884202 () Bool)

(assert (=> b!884202 (= e!492052 e!492051)))

(assert (=> b!884202 (= c!93072 (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053)))))

(assert (= (and d!109033 (not res!600717)) b!884198))

(assert (= (and b!884198 res!600716) b!884200))

(assert (= (and b!884198 res!600715) b!884202))

(assert (= (and b!884202 c!93072) b!884199))

(assert (= (and b!884202 (not c!93072)) b!884201))

(assert (= (or b!884199 b!884201) bm!38966))

(assert (=> bm!38966 m!823647))

(declare-fun m!823927 () Bool)

(assert (=> bm!38966 m!823927))

(assert (=> b!884198 m!823647))

(assert (=> b!884198 m!823647))

(assert (=> b!884198 m!823655))

(assert (=> b!884200 m!823647))

(assert (=> b!884200 m!823647))

(declare-fun m!823929 () Bool)

(assert (=> b!884200 m!823929))

(assert (=> b!884202 m!823647))

(assert (=> b!884202 m!823647))

(assert (=> b!884202 m!823655))

(assert (=> b!883996 d!109033))

(declare-fun b!884203 () Bool)

(declare-fun e!492057 () Bool)

(declare-fun e!492054 () Bool)

(assert (=> b!884203 (= e!492057 e!492054)))

(assert (=> b!884203 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(declare-fun lt!400438 () ListLongMap!10581)

(declare-fun res!600718 () Bool)

(assert (=> b!884203 (= res!600718 (contains!4252 lt!400438 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884203 (=> (not res!600718) (not e!492054))))

(declare-fun b!884204 () Bool)

(declare-fun e!492055 () Bool)

(assert (=> b!884204 (= e!492055 (isEmpty!677 lt!400438))))

(declare-fun b!884205 () Bool)

(declare-fun e!492059 () ListLongMap!10581)

(assert (=> b!884205 (= e!492059 (ListLongMap!10582 Nil!17615))))

(declare-fun b!884206 () Bool)

(declare-fun e!492058 () ListLongMap!10581)

(declare-fun call!38970 () ListLongMap!10581)

(assert (=> b!884206 (= e!492058 call!38970)))

(declare-fun b!884207 () Bool)

(assert (=> b!884207 (= e!492059 e!492058)))

(declare-fun c!93075 () Bool)

(assert (=> b!884207 (= c!93075 (validKeyInArray!0 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!109035 () Bool)

(declare-fun e!492060 () Bool)

(assert (=> d!109035 e!492060))

(declare-fun res!600721 () Bool)

(assert (=> d!109035 (=> (not res!600721) (not e!492060))))

(assert (=> d!109035 (= res!600721 (not (contains!4252 lt!400438 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109035 (= lt!400438 e!492059)))

(declare-fun c!93073 () Bool)

(assert (=> d!109035 (= c!93073 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(assert (=> d!109035 (validMask!0 mask!1196)))

(assert (=> d!109035 (= (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400438)))

(declare-fun b!884208 () Bool)

(declare-fun e!492056 () Bool)

(assert (=> b!884208 (= e!492056 (validKeyInArray!0 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884208 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!884209 () Bool)

(assert (=> b!884209 (= e!492060 e!492057)))

(declare-fun c!93074 () Bool)

(assert (=> b!884209 (= c!93074 e!492056)))

(declare-fun res!600719 () Bool)

(assert (=> b!884209 (=> (not res!600719) (not e!492056))))

(assert (=> b!884209 (= res!600719 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(declare-fun b!884210 () Bool)

(assert (=> b!884210 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(assert (=> b!884210 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25228 _values!688)))))

(assert (=> b!884210 (= e!492054 (= (apply!385 lt!400438 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13073 (select (arr!24786 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884211 () Bool)

(declare-fun lt!400432 () Unit!30136)

(declare-fun lt!400433 () Unit!30136)

(assert (=> b!884211 (= lt!400432 lt!400433)))

(declare-fun lt!400434 () ListLongMap!10581)

(declare-fun lt!400436 () (_ BitVec 64))

(declare-fun lt!400435 () (_ BitVec 64))

(declare-fun lt!400437 () V!28665)

(assert (=> b!884211 (not (contains!4252 (+!2597 lt!400434 (tuple2!11823 lt!400436 lt!400437)) lt!400435))))

(assert (=> b!884211 (= lt!400433 (addStillNotContains!211 lt!400434 lt!400436 lt!400437 lt!400435))))

(assert (=> b!884211 (= lt!400435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884211 (= lt!400437 (get!13073 (select (arr!24786 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884211 (= lt!400436 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!884211 (= lt!400434 call!38970)))

(assert (=> b!884211 (= e!492058 (+!2597 call!38970 (tuple2!11823 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13073 (select (arr!24786 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884212 () Bool)

(assert (=> b!884212 (= e!492055 (= lt!400438 (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884213 () Bool)

(declare-fun res!600720 () Bool)

(assert (=> b!884213 (=> (not res!600720) (not e!492060))))

(assert (=> b!884213 (= res!600720 (not (contains!4252 lt!400438 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38967 () Bool)

(assert (=> bm!38967 (= call!38970 (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884214 () Bool)

(assert (=> b!884214 (= e!492057 e!492055)))

(declare-fun c!93076 () Bool)

(assert (=> b!884214 (= c!93076 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(assert (= (and d!109035 c!93073) b!884205))

(assert (= (and d!109035 (not c!93073)) b!884207))

(assert (= (and b!884207 c!93075) b!884211))

(assert (= (and b!884207 (not c!93075)) b!884206))

(assert (= (or b!884211 b!884206) bm!38967))

(assert (= (and d!109035 res!600721) b!884213))

(assert (= (and b!884213 res!600720) b!884209))

(assert (= (and b!884209 res!600719) b!884208))

(assert (= (and b!884209 c!93074) b!884203))

(assert (= (and b!884209 (not c!93074)) b!884214))

(assert (= (and b!884203 res!600718) b!884210))

(assert (= (and b!884214 c!93076) b!884212))

(assert (= (and b!884214 (not c!93076)) b!884204))

(declare-fun b_lambda!12745 () Bool)

(assert (=> (not b_lambda!12745) (not b!884210)))

(assert (=> b!884210 t!24879))

(declare-fun b_and!25631 () Bool)

(assert (= b_and!25629 (and (=> t!24879 result!9881) b_and!25631)))

(declare-fun b_lambda!12747 () Bool)

(assert (=> (not b_lambda!12747) (not b!884211)))

(assert (=> b!884211 t!24879))

(declare-fun b_and!25633 () Bool)

(assert (= b_and!25631 (and (=> t!24879 result!9881) b_and!25633)))

(assert (=> b!884203 m!823923))

(assert (=> b!884203 m!823923))

(declare-fun m!823931 () Bool)

(assert (=> b!884203 m!823931))

(declare-fun m!823933 () Bool)

(assert (=> b!884212 m!823933))

(assert (=> b!884208 m!823923))

(assert (=> b!884208 m!823923))

(declare-fun m!823935 () Bool)

(assert (=> b!884208 m!823935))

(declare-fun m!823937 () Bool)

(assert (=> b!884213 m!823937))

(assert (=> b!884211 m!823673))

(declare-fun m!823939 () Bool)

(assert (=> b!884211 m!823939))

(declare-fun m!823941 () Bool)

(assert (=> b!884211 m!823941))

(assert (=> b!884211 m!823923))

(declare-fun m!823943 () Bool)

(assert (=> b!884211 m!823943))

(assert (=> b!884211 m!823673))

(declare-fun m!823945 () Bool)

(assert (=> b!884211 m!823945))

(declare-fun m!823947 () Bool)

(assert (=> b!884211 m!823947))

(assert (=> b!884211 m!823939))

(declare-fun m!823949 () Bool)

(assert (=> b!884211 m!823949))

(assert (=> b!884211 m!823943))

(assert (=> bm!38967 m!823933))

(declare-fun m!823951 () Bool)

(assert (=> d!109035 m!823951))

(assert (=> d!109035 m!823637))

(assert (=> b!884210 m!823673))

(assert (=> b!884210 m!823923))

(assert (=> b!884210 m!823943))

(assert (=> b!884210 m!823673))

(assert (=> b!884210 m!823945))

(assert (=> b!884210 m!823923))

(declare-fun m!823953 () Bool)

(assert (=> b!884210 m!823953))

(assert (=> b!884210 m!823943))

(assert (=> b!884207 m!823923))

(assert (=> b!884207 m!823923))

(assert (=> b!884207 m!823935))

(declare-fun m!823955 () Bool)

(assert (=> b!884204 m!823955))

(assert (=> b!884005 d!109035))

(declare-fun d!109037 () Bool)

(assert (=> d!109037 (= (validKeyInArray!0 (select (arr!24787 _keys!868) from!1053)) (and (not (= (select (arr!24787 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24787 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!884005 d!109037))

(declare-fun b!884221 () Bool)

(declare-fun e!492065 () Bool)

(declare-fun call!38975 () ListLongMap!10581)

(declare-fun call!38976 () ListLongMap!10581)

(assert (=> b!884221 (= e!492065 (= call!38975 call!38976))))

(declare-fun bm!38972 () Bool)

(assert (=> bm!38972 (= call!38976 (getCurrentListMapNoExtraKeys!3297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884222 () Bool)

(assert (=> b!884222 (= e!492065 (= call!38975 (+!2597 call!38976 (tuple2!11823 k0!854 v!557))))))

(declare-fun b!884223 () Bool)

(declare-fun e!492066 () Bool)

(assert (=> b!884223 (= e!492066 e!492065)))

(declare-fun c!93079 () Bool)

(assert (=> b!884223 (= c!93079 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun d!109039 () Bool)

(assert (=> d!109039 e!492066))

(declare-fun res!600724 () Bool)

(assert (=> d!109039 (=> (not res!600724) (not e!492066))))

(assert (=> d!109039 (= res!600724 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25228 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25228 _values!688))))))))

(declare-fun lt!400441 () Unit!30136)

(declare-fun choose!1451 (array!51535 array!51533 (_ BitVec 32) (_ BitVec 32) V!28665 V!28665 (_ BitVec 32) (_ BitVec 64) V!28665 (_ BitVec 32) Int) Unit!30136)

(assert (=> d!109039 (= lt!400441 (choose!1451 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109039 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(assert (=> d!109039 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!759 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400441)))

(declare-fun bm!38973 () Bool)

(assert (=> bm!38973 (= call!38975 (getCurrentListMapNoExtraKeys!3297 _keys!868 (array!51534 (store (arr!24786 _values!688) i!612 (ValueCellFull!8417 v!557)) (size!25228 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!109039 res!600724) b!884223))

(assert (= (and b!884223 c!93079) b!884222))

(assert (= (and b!884223 (not c!93079)) b!884221))

(assert (= (or b!884222 b!884221) bm!38972))

(assert (= (or b!884222 b!884221) bm!38973))

(assert (=> bm!38972 m!823653))

(declare-fun m!823957 () Bool)

(assert (=> b!884222 m!823957))

(declare-fun m!823959 () Bool)

(assert (=> d!109039 m!823959))

(assert (=> bm!38973 m!823665))

(declare-fun m!823961 () Bool)

(assert (=> bm!38973 m!823961))

(assert (=> b!884005 d!109039))

(declare-fun d!109041 () Bool)

(declare-fun e!492067 () Bool)

(assert (=> d!109041 e!492067))

(declare-fun res!600726 () Bool)

(assert (=> d!109041 (=> (not res!600726) (not e!492067))))

(declare-fun lt!400445 () ListLongMap!10581)

(assert (=> d!109041 (= res!600726 (contains!4252 lt!400445 (_1!5922 lt!400260)))))

(declare-fun lt!400442 () List!17618)

(assert (=> d!109041 (= lt!400445 (ListLongMap!10582 lt!400442))))

(declare-fun lt!400444 () Unit!30136)

(declare-fun lt!400443 () Unit!30136)

(assert (=> d!109041 (= lt!400444 lt!400443)))

(assert (=> d!109041 (= (getValueByKey!425 lt!400442 (_1!5922 lt!400260)) (Some!430 (_2!5922 lt!400260)))))

(assert (=> d!109041 (= lt!400443 (lemmaContainsTupThenGetReturnValue!242 lt!400442 (_1!5922 lt!400260) (_2!5922 lt!400260)))))

(assert (=> d!109041 (= lt!400442 (insertStrictlySorted!281 (toList!5306 lt!400253) (_1!5922 lt!400260) (_2!5922 lt!400260)))))

(assert (=> d!109041 (= (+!2597 lt!400253 lt!400260) lt!400445)))

(declare-fun b!884224 () Bool)

(declare-fun res!600725 () Bool)

(assert (=> b!884224 (=> (not res!600725) (not e!492067))))

(assert (=> b!884224 (= res!600725 (= (getValueByKey!425 (toList!5306 lt!400445) (_1!5922 lt!400260)) (Some!430 (_2!5922 lt!400260))))))

(declare-fun b!884225 () Bool)

(assert (=> b!884225 (= e!492067 (contains!4253 (toList!5306 lt!400445) lt!400260))))

(assert (= (and d!109041 res!600726) b!884224))

(assert (= (and b!884224 res!600725) b!884225))

(declare-fun m!823963 () Bool)

(assert (=> d!109041 m!823963))

(declare-fun m!823965 () Bool)

(assert (=> d!109041 m!823965))

(declare-fun m!823967 () Bool)

(assert (=> d!109041 m!823967))

(declare-fun m!823969 () Bool)

(assert (=> d!109041 m!823969))

(declare-fun m!823971 () Bool)

(assert (=> b!884224 m!823971))

(declare-fun m!823973 () Bool)

(assert (=> b!884225 m!823973))

(assert (=> b!884005 d!109041))

(declare-fun b!884226 () Bool)

(declare-fun e!492071 () Bool)

(declare-fun e!492068 () Bool)

(assert (=> b!884226 (= e!492071 e!492068)))

(assert (=> b!884226 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(declare-fun lt!400452 () ListLongMap!10581)

(declare-fun res!600727 () Bool)

(assert (=> b!884226 (= res!600727 (contains!4252 lt!400452 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884226 (=> (not res!600727) (not e!492068))))

(declare-fun b!884227 () Bool)

(declare-fun e!492069 () Bool)

(assert (=> b!884227 (= e!492069 (isEmpty!677 lt!400452))))

(declare-fun b!884228 () Bool)

(declare-fun e!492073 () ListLongMap!10581)

(assert (=> b!884228 (= e!492073 (ListLongMap!10582 Nil!17615))))

(declare-fun b!884229 () Bool)

(declare-fun e!492072 () ListLongMap!10581)

(declare-fun call!38977 () ListLongMap!10581)

(assert (=> b!884229 (= e!492072 call!38977)))

(declare-fun b!884230 () Bool)

(assert (=> b!884230 (= e!492073 e!492072)))

(declare-fun c!93082 () Bool)

(assert (=> b!884230 (= c!93082 (validKeyInArray!0 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!109043 () Bool)

(declare-fun e!492074 () Bool)

(assert (=> d!109043 e!492074))

(declare-fun res!600730 () Bool)

(assert (=> d!109043 (=> (not res!600730) (not e!492074))))

(assert (=> d!109043 (= res!600730 (not (contains!4252 lt!400452 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109043 (= lt!400452 e!492073)))

(declare-fun c!93080 () Bool)

(assert (=> d!109043 (= c!93080 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(assert (=> d!109043 (validMask!0 mask!1196)))

(assert (=> d!109043 (= (getCurrentListMapNoExtraKeys!3297 _keys!868 lt!400263 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400452)))

(declare-fun b!884231 () Bool)

(declare-fun e!492070 () Bool)

(assert (=> b!884231 (= e!492070 (validKeyInArray!0 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884231 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!884232 () Bool)

(assert (=> b!884232 (= e!492074 e!492071)))

(declare-fun c!93081 () Bool)

(assert (=> b!884232 (= c!93081 e!492070)))

(declare-fun res!600728 () Bool)

(assert (=> b!884232 (=> (not res!600728) (not e!492070))))

(assert (=> b!884232 (= res!600728 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(declare-fun b!884233 () Bool)

(assert (=> b!884233 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(assert (=> b!884233 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25228 lt!400263)))))

(assert (=> b!884233 (= e!492068 (= (apply!385 lt!400452 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13073 (select (arr!24786 lt!400263) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884234 () Bool)

(declare-fun lt!400446 () Unit!30136)

(declare-fun lt!400447 () Unit!30136)

(assert (=> b!884234 (= lt!400446 lt!400447)))

(declare-fun lt!400448 () ListLongMap!10581)

(declare-fun lt!400449 () (_ BitVec 64))

(declare-fun lt!400451 () V!28665)

(declare-fun lt!400450 () (_ BitVec 64))

(assert (=> b!884234 (not (contains!4252 (+!2597 lt!400448 (tuple2!11823 lt!400450 lt!400451)) lt!400449))))

(assert (=> b!884234 (= lt!400447 (addStillNotContains!211 lt!400448 lt!400450 lt!400451 lt!400449))))

(assert (=> b!884234 (= lt!400449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884234 (= lt!400451 (get!13073 (select (arr!24786 lt!400263) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884234 (= lt!400450 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!884234 (= lt!400448 call!38977)))

(assert (=> b!884234 (= e!492072 (+!2597 call!38977 (tuple2!11823 (select (arr!24787 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13073 (select (arr!24786 lt!400263) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884235 () Bool)

(assert (=> b!884235 (= e!492069 (= lt!400452 (getCurrentListMapNoExtraKeys!3297 _keys!868 lt!400263 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884236 () Bool)

(declare-fun res!600729 () Bool)

(assert (=> b!884236 (=> (not res!600729) (not e!492074))))

(assert (=> b!884236 (= res!600729 (not (contains!4252 lt!400452 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38974 () Bool)

(assert (=> bm!38974 (= call!38977 (getCurrentListMapNoExtraKeys!3297 _keys!868 lt!400263 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884237 () Bool)

(assert (=> b!884237 (= e!492071 e!492069)))

(declare-fun c!93083 () Bool)

(assert (=> b!884237 (= c!93083 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25229 _keys!868)))))

(assert (= (and d!109043 c!93080) b!884228))

(assert (= (and d!109043 (not c!93080)) b!884230))

(assert (= (and b!884230 c!93082) b!884234))

(assert (= (and b!884230 (not c!93082)) b!884229))

(assert (= (or b!884234 b!884229) bm!38974))

(assert (= (and d!109043 res!600730) b!884236))

(assert (= (and b!884236 res!600729) b!884232))

(assert (= (and b!884232 res!600728) b!884231))

(assert (= (and b!884232 c!93081) b!884226))

(assert (= (and b!884232 (not c!93081)) b!884237))

(assert (= (and b!884226 res!600727) b!884233))

(assert (= (and b!884237 c!93083) b!884235))

(assert (= (and b!884237 (not c!93083)) b!884227))

(declare-fun b_lambda!12749 () Bool)

(assert (=> (not b_lambda!12749) (not b!884233)))

(assert (=> b!884233 t!24879))

(declare-fun b_and!25635 () Bool)

(assert (= b_and!25633 (and (=> t!24879 result!9881) b_and!25635)))

(declare-fun b_lambda!12751 () Bool)

(assert (=> (not b_lambda!12751) (not b!884234)))

(assert (=> b!884234 t!24879))

(declare-fun b_and!25637 () Bool)

(assert (= b_and!25635 (and (=> t!24879 result!9881) b_and!25637)))

(assert (=> b!884226 m!823923))

(assert (=> b!884226 m!823923))

(declare-fun m!823975 () Bool)

(assert (=> b!884226 m!823975))

(declare-fun m!823977 () Bool)

(assert (=> b!884235 m!823977))

(assert (=> b!884231 m!823923))

(assert (=> b!884231 m!823923))

(assert (=> b!884231 m!823935))

(declare-fun m!823979 () Bool)

(assert (=> b!884236 m!823979))

(assert (=> b!884234 m!823673))

(declare-fun m!823981 () Bool)

(assert (=> b!884234 m!823981))

(declare-fun m!823983 () Bool)

(assert (=> b!884234 m!823983))

(assert (=> b!884234 m!823923))

(declare-fun m!823985 () Bool)

(assert (=> b!884234 m!823985))

(assert (=> b!884234 m!823673))

(declare-fun m!823987 () Bool)

(assert (=> b!884234 m!823987))

(declare-fun m!823989 () Bool)

(assert (=> b!884234 m!823989))

(assert (=> b!884234 m!823981))

(declare-fun m!823991 () Bool)

(assert (=> b!884234 m!823991))

(assert (=> b!884234 m!823985))

(assert (=> bm!38974 m!823977))

(declare-fun m!823993 () Bool)

(assert (=> d!109043 m!823993))

(assert (=> d!109043 m!823637))

(assert (=> b!884233 m!823673))

(assert (=> b!884233 m!823923))

(assert (=> b!884233 m!823985))

(assert (=> b!884233 m!823673))

(assert (=> b!884233 m!823987))

(assert (=> b!884233 m!823923))

(declare-fun m!823995 () Bool)

(assert (=> b!884233 m!823995))

(assert (=> b!884233 m!823985))

(assert (=> b!884230 m!823923))

(assert (=> b!884230 m!823923))

(assert (=> b!884230 m!823935))

(declare-fun m!823997 () Bool)

(assert (=> b!884227 m!823997))

(assert (=> b!884005 d!109043))

(declare-fun d!109045 () Bool)

(assert (=> d!109045 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!883995 d!109045))

(declare-fun d!109047 () Bool)

(assert (=> d!109047 (= (array_inv!19564 _keys!868) (bvsge (size!25229 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74932 d!109047))

(declare-fun d!109049 () Bool)

(assert (=> d!109049 (= (array_inv!19565 _values!688) (bvsge (size!25228 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74932 d!109049))

(declare-fun bm!38975 () Bool)

(declare-fun call!38978 () Bool)

(declare-fun c!93084 () Bool)

(assert (=> bm!38975 (= call!38978 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93084 (Cons!17615 (select (arr!24787 _keys!868) #b00000000000000000000000000000000) Nil!17616) Nil!17616)))))

(declare-fun b!884238 () Bool)

(declare-fun e!492078 () Bool)

(declare-fun e!492077 () Bool)

(assert (=> b!884238 (= e!492078 e!492077)))

(declare-fun res!600731 () Bool)

(assert (=> b!884238 (=> (not res!600731) (not e!492077))))

(declare-fun e!492075 () Bool)

(assert (=> b!884238 (= res!600731 (not e!492075))))

(declare-fun res!600732 () Bool)

(assert (=> b!884238 (=> (not res!600732) (not e!492075))))

(assert (=> b!884238 (= res!600732 (validKeyInArray!0 (select (arr!24787 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!109051 () Bool)

(declare-fun res!600733 () Bool)

(assert (=> d!109051 (=> res!600733 e!492078)))

(assert (=> d!109051 (= res!600733 (bvsge #b00000000000000000000000000000000 (size!25229 _keys!868)))))

(assert (=> d!109051 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17616) e!492078)))

(declare-fun b!884239 () Bool)

(declare-fun e!492076 () Bool)

(assert (=> b!884239 (= e!492076 call!38978)))

(declare-fun b!884240 () Bool)

(assert (=> b!884240 (= e!492075 (contains!4254 Nil!17616 (select (arr!24787 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884241 () Bool)

(assert (=> b!884241 (= e!492076 call!38978)))

(declare-fun b!884242 () Bool)

(assert (=> b!884242 (= e!492077 e!492076)))

(assert (=> b!884242 (= c!93084 (validKeyInArray!0 (select (arr!24787 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109051 (not res!600733)) b!884238))

(assert (= (and b!884238 res!600732) b!884240))

(assert (= (and b!884238 res!600731) b!884242))

(assert (= (and b!884242 c!93084) b!884239))

(assert (= (and b!884242 (not c!93084)) b!884241))

(assert (= (or b!884239 b!884241) bm!38975))

(assert (=> bm!38975 m!823907))

(declare-fun m!823999 () Bool)

(assert (=> bm!38975 m!823999))

(assert (=> b!884238 m!823907))

(assert (=> b!884238 m!823907))

(assert (=> b!884238 m!823909))

(assert (=> b!884240 m!823907))

(assert (=> b!884240 m!823907))

(declare-fun m!824001 () Bool)

(assert (=> b!884240 m!824001))

(assert (=> b!884242 m!823907))

(assert (=> b!884242 m!823907))

(assert (=> b!884242 m!823909))

(assert (=> b!884004 d!109051))

(declare-fun d!109053 () Bool)

(declare-fun e!492079 () Bool)

(assert (=> d!109053 e!492079))

(declare-fun res!600735 () Bool)

(assert (=> d!109053 (=> (not res!600735) (not e!492079))))

(declare-fun lt!400456 () ListLongMap!10581)

(assert (=> d!109053 (= res!600735 (contains!4252 lt!400456 (_1!5922 lt!400251)))))

(declare-fun lt!400453 () List!17618)

(assert (=> d!109053 (= lt!400456 (ListLongMap!10582 lt!400453))))

(declare-fun lt!400455 () Unit!30136)

(declare-fun lt!400454 () Unit!30136)

(assert (=> d!109053 (= lt!400455 lt!400454)))

(assert (=> d!109053 (= (getValueByKey!425 lt!400453 (_1!5922 lt!400251)) (Some!430 (_2!5922 lt!400251)))))

(assert (=> d!109053 (= lt!400454 (lemmaContainsTupThenGetReturnValue!242 lt!400453 (_1!5922 lt!400251) (_2!5922 lt!400251)))))

(assert (=> d!109053 (= lt!400453 (insertStrictlySorted!281 (toList!5306 lt!400266) (_1!5922 lt!400251) (_2!5922 lt!400251)))))

(assert (=> d!109053 (= (+!2597 lt!400266 lt!400251) lt!400456)))

(declare-fun b!884243 () Bool)

(declare-fun res!600734 () Bool)

(assert (=> b!884243 (=> (not res!600734) (not e!492079))))

(assert (=> b!884243 (= res!600734 (= (getValueByKey!425 (toList!5306 lt!400456) (_1!5922 lt!400251)) (Some!430 (_2!5922 lt!400251))))))

(declare-fun b!884244 () Bool)

(assert (=> b!884244 (= e!492079 (contains!4253 (toList!5306 lt!400456) lt!400251))))

(assert (= (and d!109053 res!600735) b!884243))

(assert (= (and b!884243 res!600734) b!884244))

(declare-fun m!824003 () Bool)

(assert (=> d!109053 m!824003))

(declare-fun m!824005 () Bool)

(assert (=> d!109053 m!824005))

(declare-fun m!824007 () Bool)

(assert (=> d!109053 m!824007))

(declare-fun m!824009 () Bool)

(assert (=> d!109053 m!824009))

(declare-fun m!824011 () Bool)

(assert (=> b!884243 m!824011))

(declare-fun m!824013 () Bool)

(assert (=> b!884244 m!824013))

(assert (=> b!883999 d!109053))

(declare-fun d!109055 () Bool)

(declare-fun c!93087 () Bool)

(assert (=> d!109055 (= c!93087 ((_ is ValueCellFull!8417) (select (arr!24786 _values!688) from!1053)))))

(declare-fun e!492082 () V!28665)

(assert (=> d!109055 (= (get!13073 (select (arr!24786 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!492082)))

(declare-fun b!884249 () Bool)

(declare-fun get!13076 (ValueCell!8417 V!28665) V!28665)

(assert (=> b!884249 (= e!492082 (get!13076 (select (arr!24786 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884250 () Bool)

(declare-fun get!13077 (ValueCell!8417 V!28665) V!28665)

(assert (=> b!884250 (= e!492082 (get!13077 (select (arr!24786 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!109055 c!93087) b!884249))

(assert (= (and d!109055 (not c!93087)) b!884250))

(assert (=> b!884249 m!823671))

(assert (=> b!884249 m!823673))

(declare-fun m!824015 () Bool)

(assert (=> b!884249 m!824015))

(assert (=> b!884250 m!823671))

(assert (=> b!884250 m!823673))

(declare-fun m!824017 () Bool)

(assert (=> b!884250 m!824017))

(assert (=> b!883999 d!109055))

(declare-fun b!884257 () Bool)

(declare-fun e!492088 () Bool)

(assert (=> b!884257 (= e!492088 tp_is_empty!17713)))

(declare-fun mapIsEmpty!28215 () Bool)

(declare-fun mapRes!28215 () Bool)

(assert (=> mapIsEmpty!28215 mapRes!28215))

(declare-fun b!884258 () Bool)

(declare-fun e!492087 () Bool)

(assert (=> b!884258 (= e!492087 tp_is_empty!17713)))

(declare-fun mapNonEmpty!28215 () Bool)

(declare-fun tp!54126 () Bool)

(assert (=> mapNonEmpty!28215 (= mapRes!28215 (and tp!54126 e!492088))))

(declare-fun mapRest!28215 () (Array (_ BitVec 32) ValueCell!8417))

(declare-fun mapKey!28215 () (_ BitVec 32))

(declare-fun mapValue!28215 () ValueCell!8417)

(assert (=> mapNonEmpty!28215 (= mapRest!28206 (store mapRest!28215 mapKey!28215 mapValue!28215))))

(declare-fun condMapEmpty!28215 () Bool)

(declare-fun mapDefault!28215 () ValueCell!8417)

(assert (=> mapNonEmpty!28206 (= condMapEmpty!28215 (= mapRest!28206 ((as const (Array (_ BitVec 32) ValueCell!8417)) mapDefault!28215)))))

(assert (=> mapNonEmpty!28206 (= tp!54110 (and e!492087 mapRes!28215))))

(assert (= (and mapNonEmpty!28206 condMapEmpty!28215) mapIsEmpty!28215))

(assert (= (and mapNonEmpty!28206 (not condMapEmpty!28215)) mapNonEmpty!28215))

(assert (= (and mapNonEmpty!28215 ((_ is ValueCellFull!8417) mapValue!28215)) b!884257))

(assert (= (and mapNonEmpty!28206 ((_ is ValueCellFull!8417) mapDefault!28215)) b!884258))

(declare-fun m!824019 () Bool)

(assert (=> mapNonEmpty!28215 m!824019))

(declare-fun b_lambda!12753 () Bool)

(assert (= b_lambda!12747 (or (and start!74932 b_free!15469) b_lambda!12753)))

(declare-fun b_lambda!12755 () Bool)

(assert (= b_lambda!12743 (or (and start!74932 b_free!15469) b_lambda!12755)))

(declare-fun b_lambda!12757 () Bool)

(assert (= b_lambda!12749 (or (and start!74932 b_free!15469) b_lambda!12757)))

(declare-fun b_lambda!12759 () Bool)

(assert (= b_lambda!12751 (or (and start!74932 b_free!15469) b_lambda!12759)))

(declare-fun b_lambda!12761 () Bool)

(assert (= b_lambda!12745 (or (and start!74932 b_free!15469) b_lambda!12761)))

(declare-fun b_lambda!12763 () Bool)

(assert (= b_lambda!12739 (or (and start!74932 b_free!15469) b_lambda!12763)))

(declare-fun b_lambda!12765 () Bool)

(assert (= b_lambda!12741 (or (and start!74932 b_free!15469) b_lambda!12765)))

(declare-fun b_lambda!12767 () Bool)

(assert (= b_lambda!12737 (or (and start!74932 b_free!15469) b_lambda!12767)))

(check-sat (not b!884242) (not b!884212) (not b!884147) (not bm!38960) (not b!884208) (not b_lambda!12765) (not d!109019) (not bm!38973) (not b_lambda!12761) (not b!884168) (not b!884250) (not b!884238) (not mapNonEmpty!28215) (not b!884211) (not d!109017) (not b_lambda!12763) (not bm!38966) (not d!109029) (not b!884203) (not b_lambda!12753) (not b!884167) (not b!884151) (not b_lambda!12767) (not d!109027) (not b!884181) (not b!884226) (not b!884235) (not b!884156) (not d!109011) (not bm!38975) (not d!109009) (not b!884187) (not d!109039) (not bm!38959) (not d!109043) (not b_lambda!12759) (not b!884117) (not b!884231) (not b!884119) (not b!884236) (not b!884166) (not b!884243) (not b!884162) (not b!884202) (not b!884240) (not b!884165) (not d!109013) (not bm!38967) (not b!884179) (not b!884200) (not d!109053) (not b!884233) tp_is_empty!17713 (not b!884116) (not d!109035) (not bm!38963) (not b!884150) (not b!884207) (not b!884234) (not b!884121) (not b!884204) (not b!884227) (not b!884249) (not bm!38972) (not bm!38974) (not b_lambda!12757) (not b!884222) (not b!884153) (not b!884163) (not b!884118) (not b!884225) (not b!884230) (not d!109015) (not b!884154) (not b!884213) (not b!884146) b_and!25637 (not b!884158) (not d!109041) (not b_lambda!12755) (not b!884159) (not b!884210) (not b!884224) (not b!884155) (not b!884244) (not b_next!15469) (not d!109025) (not b_lambda!12735) (not b!884198) (not b!884120))
(check-sat b_and!25637 (not b_next!15469))
