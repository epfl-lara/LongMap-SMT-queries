; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74980 () Bool)

(assert start!74980)

(declare-fun b_free!15487 () Bool)

(declare-fun b_next!15487 () Bool)

(assert (=> start!74980 (= b_free!15487 (not b_next!15487))))

(declare-fun tp!54167 () Bool)

(declare-fun b_and!25651 () Bool)

(assert (=> start!74980 (= tp!54167 b_and!25651)))

(declare-fun b!884511 () Bool)

(declare-fun e!492224 () Bool)

(declare-fun e!492226 () Bool)

(declare-fun mapRes!28236 () Bool)

(assert (=> b!884511 (= e!492224 (and e!492226 mapRes!28236))))

(declare-fun condMapEmpty!28236 () Bool)

(declare-datatypes ((V!28689 0))(
  ( (V!28690 (val!8913 Int)) )
))
(declare-datatypes ((ValueCell!8426 0))(
  ( (ValueCellFull!8426 (v!11380 V!28689)) (EmptyCell!8426) )
))
(declare-datatypes ((array!51571 0))(
  ( (array!51572 (arr!24804 (Array (_ BitVec 32) ValueCell!8426)) (size!25246 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51571)

(declare-fun mapDefault!28236 () ValueCell!8426)

(assert (=> b!884511 (= condMapEmpty!28236 (= (arr!24804 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8426)) mapDefault!28236)))))

(declare-fun b!884512 () Bool)

(declare-fun res!600933 () Bool)

(declare-fun e!492221 () Bool)

(assert (=> b!884512 (=> (not res!600933) (not e!492221))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884512 (= res!600933 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!28236 () Bool)

(assert (=> mapIsEmpty!28236 mapRes!28236))

(declare-fun b!884513 () Bool)

(declare-fun e!492222 () Bool)

(declare-fun e!492220 () Bool)

(assert (=> b!884513 (= e!492222 (not e!492220))))

(declare-fun res!600935 () Bool)

(assert (=> b!884513 (=> res!600935 e!492220)))

(declare-datatypes ((array!51573 0))(
  ( (array!51574 (arr!24805 (Array (_ BitVec 32) (_ BitVec 64))) (size!25247 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51573)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884513 (= res!600935 (validKeyInArray!0 (select (arr!24805 _keys!868) from!1053)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!400542 () array!51571)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11840 0))(
  ( (tuple2!11841 (_1!5931 (_ BitVec 64)) (_2!5931 V!28689)) )
))
(declare-fun lt!400539 () tuple2!11840)

(declare-fun minValue!654 () V!28689)

(declare-fun zeroValue!654 () V!28689)

(declare-datatypes ((List!17635 0))(
  ( (Nil!17632) (Cons!17631 (h!18762 tuple2!11840) (t!24901 List!17635)) )
))
(declare-datatypes ((ListLongMap!10599 0))(
  ( (ListLongMap!10600 (toList!5315 List!17635)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3305 (array!51573 array!51571 (_ BitVec 32) (_ BitVec 32) V!28689 V!28689 (_ BitVec 32) Int) ListLongMap!10599)

(declare-fun +!2604 (ListLongMap!10599 tuple2!11840) ListLongMap!10599)

(assert (=> b!884513 (= (getCurrentListMapNoExtraKeys!3305 _keys!868 lt!400542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2604 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400539))))

(declare-fun v!557 () V!28689)

(assert (=> b!884513 (= lt!400539 (tuple2!11841 k0!854 v!557))))

(declare-datatypes ((Unit!30154 0))(
  ( (Unit!30155) )
))
(declare-fun lt!400541 () Unit!30154)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!765 (array!51573 array!51571 (_ BitVec 32) (_ BitVec 32) V!28689 V!28689 (_ BitVec 32) (_ BitVec 64) V!28689 (_ BitVec 32) Int) Unit!30154)

(assert (=> b!884513 (= lt!400541 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!765 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884514 () Bool)

(declare-fun res!600936 () Bool)

(assert (=> b!884514 (=> (not res!600936) (not e!492221))))

(declare-datatypes ((List!17636 0))(
  ( (Nil!17633) (Cons!17632 (h!18763 (_ BitVec 64)) (t!24902 List!17636)) )
))
(declare-fun arrayNoDuplicates!0 (array!51573 (_ BitVec 32) List!17636) Bool)

(assert (=> b!884514 (= res!600936 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17633))))

(declare-fun mapNonEmpty!28236 () Bool)

(declare-fun tp!54168 () Bool)

(declare-fun e!492225 () Bool)

(assert (=> mapNonEmpty!28236 (= mapRes!28236 (and tp!54168 e!492225))))

(declare-fun mapValue!28236 () ValueCell!8426)

(declare-fun mapKey!28236 () (_ BitVec 32))

(declare-fun mapRest!28236 () (Array (_ BitVec 32) ValueCell!8426))

(assert (=> mapNonEmpty!28236 (= (arr!24804 _values!688) (store mapRest!28236 mapKey!28236 mapValue!28236))))

(declare-fun b!884515 () Bool)

(declare-fun res!600934 () Bool)

(assert (=> b!884515 (=> (not res!600934) (not e!492221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51573 (_ BitVec 32)) Bool)

(assert (=> b!884515 (= res!600934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884516 () Bool)

(declare-fun res!600928 () Bool)

(assert (=> b!884516 (=> (not res!600928) (not e!492221))))

(assert (=> b!884516 (= res!600928 (and (= (size!25246 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25247 _keys!868) (size!25246 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884517 () Bool)

(declare-fun res!600927 () Bool)

(assert (=> b!884517 (=> (not res!600927) (not e!492221))))

(assert (=> b!884517 (= res!600927 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25247 _keys!868))))))

(declare-fun b!884518 () Bool)

(declare-fun res!600931 () Bool)

(assert (=> b!884518 (=> (not res!600931) (not e!492221))))

(assert (=> b!884518 (= res!600931 (and (= (select (arr!24805 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884519 () Bool)

(assert (=> b!884519 (= e!492221 e!492222)))

(declare-fun res!600930 () Bool)

(assert (=> b!884519 (=> (not res!600930) (not e!492222))))

(assert (=> b!884519 (= res!600930 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400543 () ListLongMap!10599)

(assert (=> b!884519 (= lt!400543 (getCurrentListMapNoExtraKeys!3305 _keys!868 lt!400542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884519 (= lt!400542 (array!51572 (store (arr!24804 _values!688) i!612 (ValueCellFull!8426 v!557)) (size!25246 _values!688)))))

(declare-fun lt!400540 () ListLongMap!10599)

(assert (=> b!884519 (= lt!400540 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884520 () Bool)

(declare-fun res!600929 () Bool)

(assert (=> b!884520 (=> (not res!600929) (not e!492221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884520 (= res!600929 (validMask!0 mask!1196))))

(declare-fun b!884510 () Bool)

(assert (=> b!884510 (= e!492220 (= lt!400543 (+!2604 lt!400540 lt!400539)))))

(declare-fun res!600932 () Bool)

(assert (=> start!74980 (=> (not res!600932) (not e!492221))))

(assert (=> start!74980 (= res!600932 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25247 _keys!868))))))

(assert (=> start!74980 e!492221))

(declare-fun tp_is_empty!17731 () Bool)

(assert (=> start!74980 tp_is_empty!17731))

(assert (=> start!74980 true))

(assert (=> start!74980 tp!54167))

(declare-fun array_inv!19578 (array!51573) Bool)

(assert (=> start!74980 (array_inv!19578 _keys!868)))

(declare-fun array_inv!19579 (array!51571) Bool)

(assert (=> start!74980 (and (array_inv!19579 _values!688) e!492224)))

(declare-fun b!884521 () Bool)

(assert (=> b!884521 (= e!492226 tp_is_empty!17731)))

(declare-fun b!884522 () Bool)

(assert (=> b!884522 (= e!492225 tp_is_empty!17731)))

(assert (= (and start!74980 res!600932) b!884520))

(assert (= (and b!884520 res!600929) b!884516))

(assert (= (and b!884516 res!600928) b!884515))

(assert (= (and b!884515 res!600934) b!884514))

(assert (= (and b!884514 res!600936) b!884517))

(assert (= (and b!884517 res!600927) b!884512))

(assert (= (and b!884512 res!600933) b!884518))

(assert (= (and b!884518 res!600931) b!884519))

(assert (= (and b!884519 res!600930) b!884513))

(assert (= (and b!884513 (not res!600935)) b!884510))

(assert (= (and b!884511 condMapEmpty!28236) mapIsEmpty!28236))

(assert (= (and b!884511 (not condMapEmpty!28236)) mapNonEmpty!28236))

(get-info :version)

(assert (= (and mapNonEmpty!28236 ((_ is ValueCellFull!8426) mapValue!28236)) b!884522))

(assert (= (and b!884511 ((_ is ValueCellFull!8426) mapDefault!28236)) b!884521))

(assert (= start!74980 b!884511))

(declare-fun m!824213 () Bool)

(assert (=> b!884510 m!824213))

(declare-fun m!824215 () Bool)

(assert (=> b!884512 m!824215))

(declare-fun m!824217 () Bool)

(assert (=> b!884515 m!824217))

(declare-fun m!824219 () Bool)

(assert (=> start!74980 m!824219))

(declare-fun m!824221 () Bool)

(assert (=> start!74980 m!824221))

(declare-fun m!824223 () Bool)

(assert (=> mapNonEmpty!28236 m!824223))

(declare-fun m!824225 () Bool)

(assert (=> b!884519 m!824225))

(declare-fun m!824227 () Bool)

(assert (=> b!884519 m!824227))

(declare-fun m!824229 () Bool)

(assert (=> b!884519 m!824229))

(declare-fun m!824231 () Bool)

(assert (=> b!884520 m!824231))

(declare-fun m!824233 () Bool)

(assert (=> b!884518 m!824233))

(declare-fun m!824235 () Bool)

(assert (=> b!884514 m!824235))

(declare-fun m!824237 () Bool)

(assert (=> b!884513 m!824237))

(declare-fun m!824239 () Bool)

(assert (=> b!884513 m!824239))

(declare-fun m!824241 () Bool)

(assert (=> b!884513 m!824241))

(declare-fun m!824243 () Bool)

(assert (=> b!884513 m!824243))

(assert (=> b!884513 m!824241))

(assert (=> b!884513 m!824239))

(declare-fun m!824245 () Bool)

(assert (=> b!884513 m!824245))

(declare-fun m!824247 () Bool)

(assert (=> b!884513 m!824247))

(check-sat (not mapNonEmpty!28236) (not b!884510) (not b!884513) (not b!884514) b_and!25651 (not b!884515) (not start!74980) (not b_next!15487) (not b!884512) tp_is_empty!17731 (not b!884520) (not b!884519))
(check-sat b_and!25651 (not b_next!15487))
(get-model)

(declare-fun lt!400593 () ListLongMap!10599)

(declare-fun b!884625 () Bool)

(declare-fun e!492286 () Bool)

(assert (=> b!884625 (= e!492286 (= lt!400593 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884626 () Bool)

(declare-fun res!601006 () Bool)

(declare-fun e!492285 () Bool)

(assert (=> b!884626 (=> (not res!601006) (not e!492285))))

(declare-fun contains!4255 (ListLongMap!10599 (_ BitVec 64)) Bool)

(assert (=> b!884626 (= res!601006 (not (contains!4255 lt!400593 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38978 () Bool)

(declare-fun call!38981 () ListLongMap!10599)

(assert (=> bm!38978 (= call!38981 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884627 () Bool)

(declare-fun e!492289 () Bool)

(assert (=> b!884627 (= e!492289 e!492286)))

(declare-fun c!93099 () Bool)

(assert (=> b!884627 (= c!93099 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(declare-fun b!884628 () Bool)

(declare-fun e!492288 () ListLongMap!10599)

(assert (=> b!884628 (= e!492288 call!38981)))

(declare-fun b!884629 () Bool)

(declare-fun e!492283 () Bool)

(assert (=> b!884629 (= e!492283 (validKeyInArray!0 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884629 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!884630 () Bool)

(assert (=> b!884630 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(assert (=> b!884630 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25246 _values!688)))))

(declare-fun e!492284 () Bool)

(declare-fun apply!386 (ListLongMap!10599 (_ BitVec 64)) V!28689)

(declare-fun get!13084 (ValueCell!8426 V!28689) V!28689)

(declare-fun dynLambda!1284 (Int (_ BitVec 64)) V!28689)

(assert (=> b!884630 (= e!492284 (= (apply!386 lt!400593 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13084 (select (arr!24804 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884631 () Bool)

(declare-fun lt!400588 () Unit!30154)

(declare-fun lt!400591 () Unit!30154)

(assert (=> b!884631 (= lt!400588 lt!400591)))

(declare-fun lt!400589 () ListLongMap!10599)

(declare-fun lt!400590 () (_ BitVec 64))

(declare-fun lt!400592 () (_ BitVec 64))

(declare-fun lt!400594 () V!28689)

(assert (=> b!884631 (not (contains!4255 (+!2604 lt!400589 (tuple2!11841 lt!400592 lt!400594)) lt!400590))))

(declare-fun addStillNotContains!212 (ListLongMap!10599 (_ BitVec 64) V!28689 (_ BitVec 64)) Unit!30154)

(assert (=> b!884631 (= lt!400591 (addStillNotContains!212 lt!400589 lt!400592 lt!400594 lt!400590))))

(assert (=> b!884631 (= lt!400590 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884631 (= lt!400594 (get!13084 (select (arr!24804 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884631 (= lt!400592 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!884631 (= lt!400589 call!38981)))

(assert (=> b!884631 (= e!492288 (+!2604 call!38981 (tuple2!11841 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13084 (select (arr!24804 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884632 () Bool)

(declare-fun e!492287 () ListLongMap!10599)

(assert (=> b!884632 (= e!492287 (ListLongMap!10600 Nil!17632))))

(declare-fun d!109063 () Bool)

(assert (=> d!109063 e!492285))

(declare-fun res!601008 () Bool)

(assert (=> d!109063 (=> (not res!601008) (not e!492285))))

(assert (=> d!109063 (= res!601008 (not (contains!4255 lt!400593 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109063 (= lt!400593 e!492287)))

(declare-fun c!93098 () Bool)

(assert (=> d!109063 (= c!93098 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(assert (=> d!109063 (validMask!0 mask!1196)))

(assert (=> d!109063 (= (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400593)))

(declare-fun b!884633 () Bool)

(assert (=> b!884633 (= e!492289 e!492284)))

(assert (=> b!884633 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(declare-fun res!601005 () Bool)

(assert (=> b!884633 (= res!601005 (contains!4255 lt!400593 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884633 (=> (not res!601005) (not e!492284))))

(declare-fun b!884634 () Bool)

(assert (=> b!884634 (= e!492287 e!492288)))

(declare-fun c!93097 () Bool)

(assert (=> b!884634 (= c!93097 (validKeyInArray!0 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!884635 () Bool)

(declare-fun isEmpty!678 (ListLongMap!10599) Bool)

(assert (=> b!884635 (= e!492286 (isEmpty!678 lt!400593))))

(declare-fun b!884636 () Bool)

(assert (=> b!884636 (= e!492285 e!492289)))

(declare-fun c!93096 () Bool)

(assert (=> b!884636 (= c!93096 e!492283)))

(declare-fun res!601007 () Bool)

(assert (=> b!884636 (=> (not res!601007) (not e!492283))))

(assert (=> b!884636 (= res!601007 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(assert (= (and d!109063 c!93098) b!884632))

(assert (= (and d!109063 (not c!93098)) b!884634))

(assert (= (and b!884634 c!93097) b!884631))

(assert (= (and b!884634 (not c!93097)) b!884628))

(assert (= (or b!884631 b!884628) bm!38978))

(assert (= (and d!109063 res!601008) b!884626))

(assert (= (and b!884626 res!601006) b!884636))

(assert (= (and b!884636 res!601007) b!884629))

(assert (= (and b!884636 c!93096) b!884633))

(assert (= (and b!884636 (not c!93096)) b!884627))

(assert (= (and b!884633 res!601005) b!884630))

(assert (= (and b!884627 c!93099) b!884625))

(assert (= (and b!884627 (not c!93099)) b!884635))

(declare-fun b_lambda!12769 () Bool)

(assert (=> (not b_lambda!12769) (not b!884630)))

(declare-fun t!24907 () Bool)

(declare-fun tb!5125 () Bool)

(assert (=> (and start!74980 (= defaultEntry!696 defaultEntry!696) t!24907) tb!5125))

(declare-fun result!9895 () Bool)

(assert (=> tb!5125 (= result!9895 tp_is_empty!17731)))

(assert (=> b!884630 t!24907))

(declare-fun b_and!25657 () Bool)

(assert (= b_and!25651 (and (=> t!24907 result!9895) b_and!25657)))

(declare-fun b_lambda!12771 () Bool)

(assert (=> (not b_lambda!12771) (not b!884631)))

(assert (=> b!884631 t!24907))

(declare-fun b_and!25659 () Bool)

(assert (= b_and!25657 (and (=> t!24907 result!9895) b_and!25659)))

(declare-fun m!824321 () Bool)

(assert (=> b!884630 m!824321))

(declare-fun m!824323 () Bool)

(assert (=> b!884630 m!824323))

(declare-fun m!824325 () Bool)

(assert (=> b!884630 m!824325))

(assert (=> b!884630 m!824323))

(assert (=> b!884630 m!824321))

(declare-fun m!824327 () Bool)

(assert (=> b!884630 m!824327))

(assert (=> b!884630 m!824327))

(declare-fun m!824329 () Bool)

(assert (=> b!884630 m!824329))

(declare-fun m!824331 () Bool)

(assert (=> bm!38978 m!824331))

(assert (=> b!884629 m!824327))

(assert (=> b!884629 m!824327))

(declare-fun m!824333 () Bool)

(assert (=> b!884629 m!824333))

(assert (=> b!884625 m!824331))

(assert (=> b!884634 m!824327))

(assert (=> b!884634 m!824327))

(assert (=> b!884634 m!824333))

(assert (=> b!884633 m!824327))

(assert (=> b!884633 m!824327))

(declare-fun m!824335 () Bool)

(assert (=> b!884633 m!824335))

(declare-fun m!824337 () Bool)

(assert (=> d!109063 m!824337))

(assert (=> d!109063 m!824231))

(declare-fun m!824339 () Bool)

(assert (=> b!884626 m!824339))

(declare-fun m!824341 () Bool)

(assert (=> b!884635 m!824341))

(assert (=> b!884631 m!824321))

(assert (=> b!884631 m!824323))

(assert (=> b!884631 m!824325))

(declare-fun m!824343 () Bool)

(assert (=> b!884631 m!824343))

(assert (=> b!884631 m!824323))

(declare-fun m!824345 () Bool)

(assert (=> b!884631 m!824345))

(assert (=> b!884631 m!824321))

(assert (=> b!884631 m!824327))

(declare-fun m!824347 () Bool)

(assert (=> b!884631 m!824347))

(declare-fun m!824349 () Bool)

(assert (=> b!884631 m!824349))

(assert (=> b!884631 m!824347))

(assert (=> b!884513 d!109063))

(declare-fun d!109065 () Bool)

(assert (=> d!109065 (= (validKeyInArray!0 (select (arr!24805 _keys!868) from!1053)) (and (not (= (select (arr!24805 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24805 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!884513 d!109065))

(declare-fun d!109067 () Bool)

(declare-fun e!492292 () Bool)

(assert (=> d!109067 e!492292))

(declare-fun res!601013 () Bool)

(assert (=> d!109067 (=> (not res!601013) (not e!492292))))

(declare-fun lt!400606 () ListLongMap!10599)

(assert (=> d!109067 (= res!601013 (contains!4255 lt!400606 (_1!5931 lt!400539)))))

(declare-fun lt!400604 () List!17635)

(assert (=> d!109067 (= lt!400606 (ListLongMap!10600 lt!400604))))

(declare-fun lt!400603 () Unit!30154)

(declare-fun lt!400605 () Unit!30154)

(assert (=> d!109067 (= lt!400603 lt!400605)))

(declare-datatypes ((Option!432 0))(
  ( (Some!431 (v!11386 V!28689)) (None!430) )
))
(declare-fun getValueByKey!426 (List!17635 (_ BitVec 64)) Option!432)

(assert (=> d!109067 (= (getValueByKey!426 lt!400604 (_1!5931 lt!400539)) (Some!431 (_2!5931 lt!400539)))))

(declare-fun lemmaContainsTupThenGetReturnValue!243 (List!17635 (_ BitVec 64) V!28689) Unit!30154)

(assert (=> d!109067 (= lt!400605 (lemmaContainsTupThenGetReturnValue!243 lt!400604 (_1!5931 lt!400539) (_2!5931 lt!400539)))))

(declare-fun insertStrictlySorted!282 (List!17635 (_ BitVec 64) V!28689) List!17635)

(assert (=> d!109067 (= lt!400604 (insertStrictlySorted!282 (toList!5315 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696)) (_1!5931 lt!400539) (_2!5931 lt!400539)))))

(assert (=> d!109067 (= (+!2604 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400539) lt!400606)))

(declare-fun b!884643 () Bool)

(declare-fun res!601014 () Bool)

(assert (=> b!884643 (=> (not res!601014) (not e!492292))))

(assert (=> b!884643 (= res!601014 (= (getValueByKey!426 (toList!5315 lt!400606) (_1!5931 lt!400539)) (Some!431 (_2!5931 lt!400539))))))

(declare-fun b!884644 () Bool)

(declare-fun contains!4256 (List!17635 tuple2!11840) Bool)

(assert (=> b!884644 (= e!492292 (contains!4256 (toList!5315 lt!400606) lt!400539))))

(assert (= (and d!109067 res!601013) b!884643))

(assert (= (and b!884643 res!601014) b!884644))

(declare-fun m!824351 () Bool)

(assert (=> d!109067 m!824351))

(declare-fun m!824353 () Bool)

(assert (=> d!109067 m!824353))

(declare-fun m!824355 () Bool)

(assert (=> d!109067 m!824355))

(declare-fun m!824357 () Bool)

(assert (=> d!109067 m!824357))

(declare-fun m!824359 () Bool)

(assert (=> b!884643 m!824359))

(declare-fun m!824361 () Bool)

(assert (=> b!884644 m!824361))

(assert (=> b!884513 d!109067))

(declare-fun call!38987 () ListLongMap!10599)

(declare-fun call!38986 () ListLongMap!10599)

(declare-fun e!492297 () Bool)

(declare-fun b!884651 () Bool)

(assert (=> b!884651 (= e!492297 (= call!38987 (+!2604 call!38986 (tuple2!11841 k0!854 v!557))))))

(declare-fun bm!38983 () Bool)

(assert (=> bm!38983 (= call!38986 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38984 () Bool)

(assert (=> bm!38984 (= call!38987 (getCurrentListMapNoExtraKeys!3305 _keys!868 (array!51572 (store (arr!24804 _values!688) i!612 (ValueCellFull!8426 v!557)) (size!25246 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884652 () Bool)

(declare-fun e!492298 () Bool)

(assert (=> b!884652 (= e!492298 e!492297)))

(declare-fun c!93102 () Bool)

(assert (=> b!884652 (= c!93102 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!884653 () Bool)

(assert (=> b!884653 (= e!492297 (= call!38987 call!38986))))

(declare-fun d!109069 () Bool)

(assert (=> d!109069 e!492298))

(declare-fun res!601017 () Bool)

(assert (=> d!109069 (=> (not res!601017) (not e!492298))))

(assert (=> d!109069 (= res!601017 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25246 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25246 _values!688))))))))

(declare-fun lt!400609 () Unit!30154)

(declare-fun choose!1452 (array!51573 array!51571 (_ BitVec 32) (_ BitVec 32) V!28689 V!28689 (_ BitVec 32) (_ BitVec 64) V!28689 (_ BitVec 32) Int) Unit!30154)

(assert (=> d!109069 (= lt!400609 (choose!1452 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!109069 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(assert (=> d!109069 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!765 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400609)))

(assert (= (and d!109069 res!601017) b!884652))

(assert (= (and b!884652 c!93102) b!884651))

(assert (= (and b!884652 (not c!93102)) b!884653))

(assert (= (or b!884651 b!884653) bm!38983))

(assert (= (or b!884651 b!884653) bm!38984))

(declare-fun m!824363 () Bool)

(assert (=> b!884651 m!824363))

(assert (=> bm!38983 m!824239))

(assert (=> bm!38984 m!824227))

(declare-fun m!824365 () Bool)

(assert (=> bm!38984 m!824365))

(declare-fun m!824367 () Bool)

(assert (=> d!109069 m!824367))

(assert (=> b!884513 d!109069))

(declare-fun e!492302 () Bool)

(declare-fun lt!400615 () ListLongMap!10599)

(declare-fun b!884654 () Bool)

(assert (=> b!884654 (= e!492302 (= lt!400615 (getCurrentListMapNoExtraKeys!3305 _keys!868 lt!400542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884655 () Bool)

(declare-fun res!601019 () Bool)

(declare-fun e!492301 () Bool)

(assert (=> b!884655 (=> (not res!601019) (not e!492301))))

(assert (=> b!884655 (= res!601019 (not (contains!4255 lt!400615 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!38988 () ListLongMap!10599)

(declare-fun bm!38985 () Bool)

(assert (=> bm!38985 (= call!38988 (getCurrentListMapNoExtraKeys!3305 _keys!868 lt!400542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884656 () Bool)

(declare-fun e!492305 () Bool)

(assert (=> b!884656 (= e!492305 e!492302)))

(declare-fun c!93106 () Bool)

(assert (=> b!884656 (= c!93106 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(declare-fun b!884657 () Bool)

(declare-fun e!492304 () ListLongMap!10599)

(assert (=> b!884657 (= e!492304 call!38988)))

(declare-fun b!884658 () Bool)

(declare-fun e!492299 () Bool)

(assert (=> b!884658 (= e!492299 (validKeyInArray!0 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884658 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!884659 () Bool)

(assert (=> b!884659 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(assert (=> b!884659 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25246 lt!400542)))))

(declare-fun e!492300 () Bool)

(assert (=> b!884659 (= e!492300 (= (apply!386 lt!400615 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!13084 (select (arr!24804 lt!400542) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884660 () Bool)

(declare-fun lt!400610 () Unit!30154)

(declare-fun lt!400613 () Unit!30154)

(assert (=> b!884660 (= lt!400610 lt!400613)))

(declare-fun lt!400611 () ListLongMap!10599)

(declare-fun lt!400616 () V!28689)

(declare-fun lt!400614 () (_ BitVec 64))

(declare-fun lt!400612 () (_ BitVec 64))

(assert (=> b!884660 (not (contains!4255 (+!2604 lt!400611 (tuple2!11841 lt!400614 lt!400616)) lt!400612))))

(assert (=> b!884660 (= lt!400613 (addStillNotContains!212 lt!400611 lt!400614 lt!400616 lt!400612))))

(assert (=> b!884660 (= lt!400612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884660 (= lt!400616 (get!13084 (select (arr!24804 lt!400542) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884660 (= lt!400614 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!884660 (= lt!400611 call!38988)))

(assert (=> b!884660 (= e!492304 (+!2604 call!38988 (tuple2!11841 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!13084 (select (arr!24804 lt!400542) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884661 () Bool)

(declare-fun e!492303 () ListLongMap!10599)

(assert (=> b!884661 (= e!492303 (ListLongMap!10600 Nil!17632))))

(declare-fun d!109071 () Bool)

(assert (=> d!109071 e!492301))

(declare-fun res!601021 () Bool)

(assert (=> d!109071 (=> (not res!601021) (not e!492301))))

(assert (=> d!109071 (= res!601021 (not (contains!4255 lt!400615 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109071 (= lt!400615 e!492303)))

(declare-fun c!93105 () Bool)

(assert (=> d!109071 (= c!93105 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(assert (=> d!109071 (validMask!0 mask!1196)))

(assert (=> d!109071 (= (getCurrentListMapNoExtraKeys!3305 _keys!868 lt!400542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!400615)))

(declare-fun b!884662 () Bool)

(assert (=> b!884662 (= e!492305 e!492300)))

(assert (=> b!884662 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(declare-fun res!601018 () Bool)

(assert (=> b!884662 (= res!601018 (contains!4255 lt!400615 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!884662 (=> (not res!601018) (not e!492300))))

(declare-fun b!884663 () Bool)

(assert (=> b!884663 (= e!492303 e!492304)))

(declare-fun c!93104 () Bool)

(assert (=> b!884663 (= c!93104 (validKeyInArray!0 (select (arr!24805 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!884664 () Bool)

(assert (=> b!884664 (= e!492302 (isEmpty!678 lt!400615))))

(declare-fun b!884665 () Bool)

(assert (=> b!884665 (= e!492301 e!492305)))

(declare-fun c!93103 () Bool)

(assert (=> b!884665 (= c!93103 e!492299)))

(declare-fun res!601020 () Bool)

(assert (=> b!884665 (=> (not res!601020) (not e!492299))))

(assert (=> b!884665 (= res!601020 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25247 _keys!868)))))

(assert (= (and d!109071 c!93105) b!884661))

(assert (= (and d!109071 (not c!93105)) b!884663))

(assert (= (and b!884663 c!93104) b!884660))

(assert (= (and b!884663 (not c!93104)) b!884657))

(assert (= (or b!884660 b!884657) bm!38985))

(assert (= (and d!109071 res!601021) b!884655))

(assert (= (and b!884655 res!601019) b!884665))

(assert (= (and b!884665 res!601020) b!884658))

(assert (= (and b!884665 c!93103) b!884662))

(assert (= (and b!884665 (not c!93103)) b!884656))

(assert (= (and b!884662 res!601018) b!884659))

(assert (= (and b!884656 c!93106) b!884654))

(assert (= (and b!884656 (not c!93106)) b!884664))

(declare-fun b_lambda!12773 () Bool)

(assert (=> (not b_lambda!12773) (not b!884659)))

(assert (=> b!884659 t!24907))

(declare-fun b_and!25661 () Bool)

(assert (= b_and!25659 (and (=> t!24907 result!9895) b_and!25661)))

(declare-fun b_lambda!12775 () Bool)

(assert (=> (not b_lambda!12775) (not b!884660)))

(assert (=> b!884660 t!24907))

(declare-fun b_and!25663 () Bool)

(assert (= b_and!25661 (and (=> t!24907 result!9895) b_and!25663)))

(declare-fun m!824369 () Bool)

(assert (=> b!884659 m!824369))

(assert (=> b!884659 m!824323))

(declare-fun m!824371 () Bool)

(assert (=> b!884659 m!824371))

(assert (=> b!884659 m!824323))

(assert (=> b!884659 m!824369))

(assert (=> b!884659 m!824327))

(assert (=> b!884659 m!824327))

(declare-fun m!824373 () Bool)

(assert (=> b!884659 m!824373))

(declare-fun m!824375 () Bool)

(assert (=> bm!38985 m!824375))

(assert (=> b!884658 m!824327))

(assert (=> b!884658 m!824327))

(assert (=> b!884658 m!824333))

(assert (=> b!884654 m!824375))

(assert (=> b!884663 m!824327))

(assert (=> b!884663 m!824327))

(assert (=> b!884663 m!824333))

(assert (=> b!884662 m!824327))

(assert (=> b!884662 m!824327))

(declare-fun m!824377 () Bool)

(assert (=> b!884662 m!824377))

(declare-fun m!824379 () Bool)

(assert (=> d!109071 m!824379))

(assert (=> d!109071 m!824231))

(declare-fun m!824381 () Bool)

(assert (=> b!884655 m!824381))

(declare-fun m!824383 () Bool)

(assert (=> b!884664 m!824383))

(assert (=> b!884660 m!824369))

(assert (=> b!884660 m!824323))

(assert (=> b!884660 m!824371))

(declare-fun m!824385 () Bool)

(assert (=> b!884660 m!824385))

(assert (=> b!884660 m!824323))

(declare-fun m!824387 () Bool)

(assert (=> b!884660 m!824387))

(assert (=> b!884660 m!824369))

(assert (=> b!884660 m!824327))

(declare-fun m!824389 () Bool)

(assert (=> b!884660 m!824389))

(declare-fun m!824391 () Bool)

(assert (=> b!884660 m!824391))

(assert (=> b!884660 m!824389))

(assert (=> b!884513 d!109071))

(declare-fun e!492309 () Bool)

(declare-fun b!884666 () Bool)

(declare-fun lt!400622 () ListLongMap!10599)

(assert (=> b!884666 (= e!492309 (= lt!400622 (getCurrentListMapNoExtraKeys!3305 _keys!868 lt!400542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884667 () Bool)

(declare-fun res!601023 () Bool)

(declare-fun e!492308 () Bool)

(assert (=> b!884667 (=> (not res!601023) (not e!492308))))

(assert (=> b!884667 (= res!601023 (not (contains!4255 lt!400622 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!38989 () ListLongMap!10599)

(declare-fun bm!38986 () Bool)

(assert (=> bm!38986 (= call!38989 (getCurrentListMapNoExtraKeys!3305 _keys!868 lt!400542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884668 () Bool)

(declare-fun e!492312 () Bool)

(assert (=> b!884668 (= e!492312 e!492309)))

(declare-fun c!93110 () Bool)

(assert (=> b!884668 (= c!93110 (bvslt from!1053 (size!25247 _keys!868)))))

(declare-fun b!884669 () Bool)

(declare-fun e!492311 () ListLongMap!10599)

(assert (=> b!884669 (= e!492311 call!38989)))

(declare-fun b!884670 () Bool)

(declare-fun e!492306 () Bool)

(assert (=> b!884670 (= e!492306 (validKeyInArray!0 (select (arr!24805 _keys!868) from!1053)))))

(assert (=> b!884670 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!884671 () Bool)

(assert (=> b!884671 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25247 _keys!868)))))

(assert (=> b!884671 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25246 lt!400542)))))

(declare-fun e!492307 () Bool)

(assert (=> b!884671 (= e!492307 (= (apply!386 lt!400622 (select (arr!24805 _keys!868) from!1053)) (get!13084 (select (arr!24804 lt!400542) from!1053) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884672 () Bool)

(declare-fun lt!400617 () Unit!30154)

(declare-fun lt!400620 () Unit!30154)

(assert (=> b!884672 (= lt!400617 lt!400620)))

(declare-fun lt!400618 () ListLongMap!10599)

(declare-fun lt!400619 () (_ BitVec 64))

(declare-fun lt!400621 () (_ BitVec 64))

(declare-fun lt!400623 () V!28689)

(assert (=> b!884672 (not (contains!4255 (+!2604 lt!400618 (tuple2!11841 lt!400621 lt!400623)) lt!400619))))

(assert (=> b!884672 (= lt!400620 (addStillNotContains!212 lt!400618 lt!400621 lt!400623 lt!400619))))

(assert (=> b!884672 (= lt!400619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884672 (= lt!400623 (get!13084 (select (arr!24804 lt!400542) from!1053) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884672 (= lt!400621 (select (arr!24805 _keys!868) from!1053))))

(assert (=> b!884672 (= lt!400618 call!38989)))

(assert (=> b!884672 (= e!492311 (+!2604 call!38989 (tuple2!11841 (select (arr!24805 _keys!868) from!1053) (get!13084 (select (arr!24804 lt!400542) from!1053) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884673 () Bool)

(declare-fun e!492310 () ListLongMap!10599)

(assert (=> b!884673 (= e!492310 (ListLongMap!10600 Nil!17632))))

(declare-fun d!109073 () Bool)

(assert (=> d!109073 e!492308))

(declare-fun res!601025 () Bool)

(assert (=> d!109073 (=> (not res!601025) (not e!492308))))

(assert (=> d!109073 (= res!601025 (not (contains!4255 lt!400622 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109073 (= lt!400622 e!492310)))

(declare-fun c!93109 () Bool)

(assert (=> d!109073 (= c!93109 (bvsge from!1053 (size!25247 _keys!868)))))

(assert (=> d!109073 (validMask!0 mask!1196)))

(assert (=> d!109073 (= (getCurrentListMapNoExtraKeys!3305 _keys!868 lt!400542 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!400622)))

(declare-fun b!884674 () Bool)

(assert (=> b!884674 (= e!492312 e!492307)))

(assert (=> b!884674 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25247 _keys!868)))))

(declare-fun res!601022 () Bool)

(assert (=> b!884674 (= res!601022 (contains!4255 lt!400622 (select (arr!24805 _keys!868) from!1053)))))

(assert (=> b!884674 (=> (not res!601022) (not e!492307))))

(declare-fun b!884675 () Bool)

(assert (=> b!884675 (= e!492310 e!492311)))

(declare-fun c!93108 () Bool)

(assert (=> b!884675 (= c!93108 (validKeyInArray!0 (select (arr!24805 _keys!868) from!1053)))))

(declare-fun b!884676 () Bool)

(assert (=> b!884676 (= e!492309 (isEmpty!678 lt!400622))))

(declare-fun b!884677 () Bool)

(assert (=> b!884677 (= e!492308 e!492312)))

(declare-fun c!93107 () Bool)

(assert (=> b!884677 (= c!93107 e!492306)))

(declare-fun res!601024 () Bool)

(assert (=> b!884677 (=> (not res!601024) (not e!492306))))

(assert (=> b!884677 (= res!601024 (bvslt from!1053 (size!25247 _keys!868)))))

(assert (= (and d!109073 c!93109) b!884673))

(assert (= (and d!109073 (not c!93109)) b!884675))

(assert (= (and b!884675 c!93108) b!884672))

(assert (= (and b!884675 (not c!93108)) b!884669))

(assert (= (or b!884672 b!884669) bm!38986))

(assert (= (and d!109073 res!601025) b!884667))

(assert (= (and b!884667 res!601023) b!884677))

(assert (= (and b!884677 res!601024) b!884670))

(assert (= (and b!884677 c!93107) b!884674))

(assert (= (and b!884677 (not c!93107)) b!884668))

(assert (= (and b!884674 res!601022) b!884671))

(assert (= (and b!884668 c!93110) b!884666))

(assert (= (and b!884668 (not c!93110)) b!884676))

(declare-fun b_lambda!12777 () Bool)

(assert (=> (not b_lambda!12777) (not b!884671)))

(assert (=> b!884671 t!24907))

(declare-fun b_and!25665 () Bool)

(assert (= b_and!25663 (and (=> t!24907 result!9895) b_and!25665)))

(declare-fun b_lambda!12779 () Bool)

(assert (=> (not b_lambda!12779) (not b!884672)))

(assert (=> b!884672 t!24907))

(declare-fun b_and!25667 () Bool)

(assert (= b_and!25665 (and (=> t!24907 result!9895) b_and!25667)))

(declare-fun m!824393 () Bool)

(assert (=> b!884671 m!824393))

(assert (=> b!884671 m!824323))

(declare-fun m!824395 () Bool)

(assert (=> b!884671 m!824395))

(assert (=> b!884671 m!824323))

(assert (=> b!884671 m!824393))

(assert (=> b!884671 m!824241))

(assert (=> b!884671 m!824241))

(declare-fun m!824397 () Bool)

(assert (=> b!884671 m!824397))

(declare-fun m!824399 () Bool)

(assert (=> bm!38986 m!824399))

(assert (=> b!884670 m!824241))

(assert (=> b!884670 m!824241))

(assert (=> b!884670 m!824243))

(assert (=> b!884666 m!824399))

(assert (=> b!884675 m!824241))

(assert (=> b!884675 m!824241))

(assert (=> b!884675 m!824243))

(assert (=> b!884674 m!824241))

(assert (=> b!884674 m!824241))

(declare-fun m!824401 () Bool)

(assert (=> b!884674 m!824401))

(declare-fun m!824403 () Bool)

(assert (=> d!109073 m!824403))

(assert (=> d!109073 m!824231))

(declare-fun m!824405 () Bool)

(assert (=> b!884667 m!824405))

(declare-fun m!824407 () Bool)

(assert (=> b!884676 m!824407))

(assert (=> b!884672 m!824393))

(assert (=> b!884672 m!824323))

(assert (=> b!884672 m!824395))

(declare-fun m!824409 () Bool)

(assert (=> b!884672 m!824409))

(assert (=> b!884672 m!824323))

(declare-fun m!824411 () Bool)

(assert (=> b!884672 m!824411))

(assert (=> b!884672 m!824393))

(assert (=> b!884672 m!824241))

(declare-fun m!824413 () Bool)

(assert (=> b!884672 m!824413))

(declare-fun m!824415 () Bool)

(assert (=> b!884672 m!824415))

(assert (=> b!884672 m!824413))

(assert (=> b!884519 d!109073))

(declare-fun lt!400629 () ListLongMap!10599)

(declare-fun b!884678 () Bool)

(declare-fun e!492316 () Bool)

(assert (=> b!884678 (= e!492316 (= lt!400629 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!884679 () Bool)

(declare-fun res!601027 () Bool)

(declare-fun e!492315 () Bool)

(assert (=> b!884679 (=> (not res!601027) (not e!492315))))

(assert (=> b!884679 (= res!601027 (not (contains!4255 lt!400629 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38987 () Bool)

(declare-fun call!38990 () ListLongMap!10599)

(assert (=> bm!38987 (= call!38990 (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!884680 () Bool)

(declare-fun e!492319 () Bool)

(assert (=> b!884680 (= e!492319 e!492316)))

(declare-fun c!93114 () Bool)

(assert (=> b!884680 (= c!93114 (bvslt from!1053 (size!25247 _keys!868)))))

(declare-fun b!884681 () Bool)

(declare-fun e!492318 () ListLongMap!10599)

(assert (=> b!884681 (= e!492318 call!38990)))

(declare-fun b!884682 () Bool)

(declare-fun e!492313 () Bool)

(assert (=> b!884682 (= e!492313 (validKeyInArray!0 (select (arr!24805 _keys!868) from!1053)))))

(assert (=> b!884682 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!884683 () Bool)

(assert (=> b!884683 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25247 _keys!868)))))

(assert (=> b!884683 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25246 _values!688)))))

(declare-fun e!492314 () Bool)

(assert (=> b!884683 (= e!492314 (= (apply!386 lt!400629 (select (arr!24805 _keys!868) from!1053)) (get!13084 (select (arr!24804 _values!688) from!1053) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!884684 () Bool)

(declare-fun lt!400624 () Unit!30154)

(declare-fun lt!400627 () Unit!30154)

(assert (=> b!884684 (= lt!400624 lt!400627)))

(declare-fun lt!400630 () V!28689)

(declare-fun lt!400625 () ListLongMap!10599)

(declare-fun lt!400628 () (_ BitVec 64))

(declare-fun lt!400626 () (_ BitVec 64))

(assert (=> b!884684 (not (contains!4255 (+!2604 lt!400625 (tuple2!11841 lt!400628 lt!400630)) lt!400626))))

(assert (=> b!884684 (= lt!400627 (addStillNotContains!212 lt!400625 lt!400628 lt!400630 lt!400626))))

(assert (=> b!884684 (= lt!400626 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!884684 (= lt!400630 (get!13084 (select (arr!24804 _values!688) from!1053) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!884684 (= lt!400628 (select (arr!24805 _keys!868) from!1053))))

(assert (=> b!884684 (= lt!400625 call!38990)))

(assert (=> b!884684 (= e!492318 (+!2604 call!38990 (tuple2!11841 (select (arr!24805 _keys!868) from!1053) (get!13084 (select (arr!24804 _values!688) from!1053) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884685 () Bool)

(declare-fun e!492317 () ListLongMap!10599)

(assert (=> b!884685 (= e!492317 (ListLongMap!10600 Nil!17632))))

(declare-fun d!109075 () Bool)

(assert (=> d!109075 e!492315))

(declare-fun res!601029 () Bool)

(assert (=> d!109075 (=> (not res!601029) (not e!492315))))

(assert (=> d!109075 (= res!601029 (not (contains!4255 lt!400629 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!109075 (= lt!400629 e!492317)))

(declare-fun c!93113 () Bool)

(assert (=> d!109075 (= c!93113 (bvsge from!1053 (size!25247 _keys!868)))))

(assert (=> d!109075 (validMask!0 mask!1196)))

(assert (=> d!109075 (= (getCurrentListMapNoExtraKeys!3305 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!400629)))

(declare-fun b!884686 () Bool)

(assert (=> b!884686 (= e!492319 e!492314)))

(assert (=> b!884686 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25247 _keys!868)))))

(declare-fun res!601026 () Bool)

(assert (=> b!884686 (= res!601026 (contains!4255 lt!400629 (select (arr!24805 _keys!868) from!1053)))))

(assert (=> b!884686 (=> (not res!601026) (not e!492314))))

(declare-fun b!884687 () Bool)

(assert (=> b!884687 (= e!492317 e!492318)))

(declare-fun c!93112 () Bool)

(assert (=> b!884687 (= c!93112 (validKeyInArray!0 (select (arr!24805 _keys!868) from!1053)))))

(declare-fun b!884688 () Bool)

(assert (=> b!884688 (= e!492316 (isEmpty!678 lt!400629))))

(declare-fun b!884689 () Bool)

(assert (=> b!884689 (= e!492315 e!492319)))

(declare-fun c!93111 () Bool)

(assert (=> b!884689 (= c!93111 e!492313)))

(declare-fun res!601028 () Bool)

(assert (=> b!884689 (=> (not res!601028) (not e!492313))))

(assert (=> b!884689 (= res!601028 (bvslt from!1053 (size!25247 _keys!868)))))

(assert (= (and d!109075 c!93113) b!884685))

(assert (= (and d!109075 (not c!93113)) b!884687))

(assert (= (and b!884687 c!93112) b!884684))

(assert (= (and b!884687 (not c!93112)) b!884681))

(assert (= (or b!884684 b!884681) bm!38987))

(assert (= (and d!109075 res!601029) b!884679))

(assert (= (and b!884679 res!601027) b!884689))

(assert (= (and b!884689 res!601028) b!884682))

(assert (= (and b!884689 c!93111) b!884686))

(assert (= (and b!884689 (not c!93111)) b!884680))

(assert (= (and b!884686 res!601026) b!884683))

(assert (= (and b!884680 c!93114) b!884678))

(assert (= (and b!884680 (not c!93114)) b!884688))

(declare-fun b_lambda!12781 () Bool)

(assert (=> (not b_lambda!12781) (not b!884683)))

(assert (=> b!884683 t!24907))

(declare-fun b_and!25669 () Bool)

(assert (= b_and!25667 (and (=> t!24907 result!9895) b_and!25669)))

(declare-fun b_lambda!12783 () Bool)

(assert (=> (not b_lambda!12783) (not b!884684)))

(assert (=> b!884684 t!24907))

(declare-fun b_and!25671 () Bool)

(assert (= b_and!25669 (and (=> t!24907 result!9895) b_and!25671)))

(declare-fun m!824417 () Bool)

(assert (=> b!884683 m!824417))

(assert (=> b!884683 m!824323))

(declare-fun m!824419 () Bool)

(assert (=> b!884683 m!824419))

(assert (=> b!884683 m!824323))

(assert (=> b!884683 m!824417))

(assert (=> b!884683 m!824241))

(assert (=> b!884683 m!824241))

(declare-fun m!824421 () Bool)

(assert (=> b!884683 m!824421))

(declare-fun m!824423 () Bool)

(assert (=> bm!38987 m!824423))

(assert (=> b!884682 m!824241))

(assert (=> b!884682 m!824241))

(assert (=> b!884682 m!824243))

(assert (=> b!884678 m!824423))

(assert (=> b!884687 m!824241))

(assert (=> b!884687 m!824241))

(assert (=> b!884687 m!824243))

(assert (=> b!884686 m!824241))

(assert (=> b!884686 m!824241))

(declare-fun m!824425 () Bool)

(assert (=> b!884686 m!824425))

(declare-fun m!824427 () Bool)

(assert (=> d!109075 m!824427))

(assert (=> d!109075 m!824231))

(declare-fun m!824429 () Bool)

(assert (=> b!884679 m!824429))

(declare-fun m!824431 () Bool)

(assert (=> b!884688 m!824431))

(assert (=> b!884684 m!824417))

(assert (=> b!884684 m!824323))

(assert (=> b!884684 m!824419))

(declare-fun m!824433 () Bool)

(assert (=> b!884684 m!824433))

(assert (=> b!884684 m!824323))

(declare-fun m!824435 () Bool)

(assert (=> b!884684 m!824435))

(assert (=> b!884684 m!824417))

(assert (=> b!884684 m!824241))

(declare-fun m!824437 () Bool)

(assert (=> b!884684 m!824437))

(declare-fun m!824439 () Bool)

(assert (=> b!884684 m!824439))

(assert (=> b!884684 m!824437))

(assert (=> b!884519 d!109075))

(declare-fun d!109077 () Bool)

(declare-fun e!492320 () Bool)

(assert (=> d!109077 e!492320))

(declare-fun res!601030 () Bool)

(assert (=> d!109077 (=> (not res!601030) (not e!492320))))

(declare-fun lt!400634 () ListLongMap!10599)

(assert (=> d!109077 (= res!601030 (contains!4255 lt!400634 (_1!5931 lt!400539)))))

(declare-fun lt!400632 () List!17635)

(assert (=> d!109077 (= lt!400634 (ListLongMap!10600 lt!400632))))

(declare-fun lt!400631 () Unit!30154)

(declare-fun lt!400633 () Unit!30154)

(assert (=> d!109077 (= lt!400631 lt!400633)))

(assert (=> d!109077 (= (getValueByKey!426 lt!400632 (_1!5931 lt!400539)) (Some!431 (_2!5931 lt!400539)))))

(assert (=> d!109077 (= lt!400633 (lemmaContainsTupThenGetReturnValue!243 lt!400632 (_1!5931 lt!400539) (_2!5931 lt!400539)))))

(assert (=> d!109077 (= lt!400632 (insertStrictlySorted!282 (toList!5315 lt!400540) (_1!5931 lt!400539) (_2!5931 lt!400539)))))

(assert (=> d!109077 (= (+!2604 lt!400540 lt!400539) lt!400634)))

(declare-fun b!884690 () Bool)

(declare-fun res!601031 () Bool)

(assert (=> b!884690 (=> (not res!601031) (not e!492320))))

(assert (=> b!884690 (= res!601031 (= (getValueByKey!426 (toList!5315 lt!400634) (_1!5931 lt!400539)) (Some!431 (_2!5931 lt!400539))))))

(declare-fun b!884691 () Bool)

(assert (=> b!884691 (= e!492320 (contains!4256 (toList!5315 lt!400634) lt!400539))))

(assert (= (and d!109077 res!601030) b!884690))

(assert (= (and b!884690 res!601031) b!884691))

(declare-fun m!824441 () Bool)

(assert (=> d!109077 m!824441))

(declare-fun m!824443 () Bool)

(assert (=> d!109077 m!824443))

(declare-fun m!824445 () Bool)

(assert (=> d!109077 m!824445))

(declare-fun m!824447 () Bool)

(assert (=> d!109077 m!824447))

(declare-fun m!824449 () Bool)

(assert (=> b!884690 m!824449))

(declare-fun m!824451 () Bool)

(assert (=> b!884691 m!824451))

(assert (=> b!884510 d!109077))

(declare-fun bm!38990 () Bool)

(declare-fun call!38993 () Bool)

(declare-fun c!93117 () Bool)

(assert (=> bm!38990 (= call!38993 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93117 (Cons!17632 (select (arr!24805 _keys!868) #b00000000000000000000000000000000) Nil!17633) Nil!17633)))))

(declare-fun b!884702 () Bool)

(declare-fun e!492332 () Bool)

(assert (=> b!884702 (= e!492332 call!38993)))

(declare-fun d!109079 () Bool)

(declare-fun res!601040 () Bool)

(declare-fun e!492331 () Bool)

(assert (=> d!109079 (=> res!601040 e!492331)))

(assert (=> d!109079 (= res!601040 (bvsge #b00000000000000000000000000000000 (size!25247 _keys!868)))))

(assert (=> d!109079 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17633) e!492331)))

(declare-fun b!884703 () Bool)

(declare-fun e!492329 () Bool)

(assert (=> b!884703 (= e!492331 e!492329)))

(declare-fun res!601039 () Bool)

(assert (=> b!884703 (=> (not res!601039) (not e!492329))))

(declare-fun e!492330 () Bool)

(assert (=> b!884703 (= res!601039 (not e!492330))))

(declare-fun res!601038 () Bool)

(assert (=> b!884703 (=> (not res!601038) (not e!492330))))

(assert (=> b!884703 (= res!601038 (validKeyInArray!0 (select (arr!24805 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884704 () Bool)

(declare-fun contains!4257 (List!17636 (_ BitVec 64)) Bool)

(assert (=> b!884704 (= e!492330 (contains!4257 Nil!17633 (select (arr!24805 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884705 () Bool)

(assert (=> b!884705 (= e!492332 call!38993)))

(declare-fun b!884706 () Bool)

(assert (=> b!884706 (= e!492329 e!492332)))

(assert (=> b!884706 (= c!93117 (validKeyInArray!0 (select (arr!24805 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!109079 (not res!601040)) b!884703))

(assert (= (and b!884703 res!601038) b!884704))

(assert (= (and b!884703 res!601039) b!884706))

(assert (= (and b!884706 c!93117) b!884702))

(assert (= (and b!884706 (not c!93117)) b!884705))

(assert (= (or b!884702 b!884705) bm!38990))

(declare-fun m!824453 () Bool)

(assert (=> bm!38990 m!824453))

(declare-fun m!824455 () Bool)

(assert (=> bm!38990 m!824455))

(assert (=> b!884703 m!824453))

(assert (=> b!884703 m!824453))

(declare-fun m!824457 () Bool)

(assert (=> b!884703 m!824457))

(assert (=> b!884704 m!824453))

(assert (=> b!884704 m!824453))

(declare-fun m!824459 () Bool)

(assert (=> b!884704 m!824459))

(assert (=> b!884706 m!824453))

(assert (=> b!884706 m!824453))

(assert (=> b!884706 m!824457))

(assert (=> b!884514 d!109079))

(declare-fun d!109081 () Bool)

(assert (=> d!109081 (= (array_inv!19578 _keys!868) (bvsge (size!25247 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74980 d!109081))

(declare-fun d!109083 () Bool)

(assert (=> d!109083 (= (array_inv!19579 _values!688) (bvsge (size!25246 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74980 d!109083))

(declare-fun d!109085 () Bool)

(assert (=> d!109085 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!884512 d!109085))

(declare-fun d!109087 () Bool)

(declare-fun res!601046 () Bool)

(declare-fun e!492340 () Bool)

(assert (=> d!109087 (=> res!601046 e!492340)))

(assert (=> d!109087 (= res!601046 (bvsge #b00000000000000000000000000000000 (size!25247 _keys!868)))))

(assert (=> d!109087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!492340)))

(declare-fun b!884715 () Bool)

(declare-fun e!492341 () Bool)

(declare-fun e!492339 () Bool)

(assert (=> b!884715 (= e!492341 e!492339)))

(declare-fun lt!400642 () (_ BitVec 64))

(assert (=> b!884715 (= lt!400642 (select (arr!24805 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!400643 () Unit!30154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51573 (_ BitVec 64) (_ BitVec 32)) Unit!30154)

(assert (=> b!884715 (= lt!400643 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!400642 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884715 (arrayContainsKey!0 _keys!868 lt!400642 #b00000000000000000000000000000000)))

(declare-fun lt!400641 () Unit!30154)

(assert (=> b!884715 (= lt!400641 lt!400643)))

(declare-fun res!601045 () Bool)

(declare-datatypes ((SeekEntryResult!8758 0))(
  ( (MissingZero!8758 (index!37403 (_ BitVec 32))) (Found!8758 (index!37404 (_ BitVec 32))) (Intermediate!8758 (undefined!9570 Bool) (index!37405 (_ BitVec 32)) (x!75003 (_ BitVec 32))) (Undefined!8758) (MissingVacant!8758 (index!37406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51573 (_ BitVec 32)) SeekEntryResult!8758)

(assert (=> b!884715 (= res!601045 (= (seekEntryOrOpen!0 (select (arr!24805 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8758 #b00000000000000000000000000000000)))))

(assert (=> b!884715 (=> (not res!601045) (not e!492339))))

(declare-fun b!884716 () Bool)

(assert (=> b!884716 (= e!492340 e!492341)))

(declare-fun c!93120 () Bool)

(assert (=> b!884716 (= c!93120 (validKeyInArray!0 (select (arr!24805 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!884717 () Bool)

(declare-fun call!38996 () Bool)

(assert (=> b!884717 (= e!492339 call!38996)))

(declare-fun b!884718 () Bool)

(assert (=> b!884718 (= e!492341 call!38996)))

(declare-fun bm!38993 () Bool)

(assert (=> bm!38993 (= call!38996 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!109087 (not res!601046)) b!884716))

(assert (= (and b!884716 c!93120) b!884715))

(assert (= (and b!884716 (not c!93120)) b!884718))

(assert (= (and b!884715 res!601045) b!884717))

(assert (= (or b!884717 b!884718) bm!38993))

(assert (=> b!884715 m!824453))

(declare-fun m!824461 () Bool)

(assert (=> b!884715 m!824461))

(declare-fun m!824463 () Bool)

(assert (=> b!884715 m!824463))

(assert (=> b!884715 m!824453))

(declare-fun m!824465 () Bool)

(assert (=> b!884715 m!824465))

(assert (=> b!884716 m!824453))

(assert (=> b!884716 m!824453))

(assert (=> b!884716 m!824457))

(declare-fun m!824467 () Bool)

(assert (=> bm!38993 m!824467))

(assert (=> b!884515 d!109087))

(declare-fun d!109089 () Bool)

(assert (=> d!109089 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!884520 d!109089))

(declare-fun b!884726 () Bool)

(declare-fun e!492346 () Bool)

(assert (=> b!884726 (= e!492346 tp_is_empty!17731)))

(declare-fun b!884725 () Bool)

(declare-fun e!492347 () Bool)

(assert (=> b!884725 (= e!492347 tp_is_empty!17731)))

(declare-fun mapNonEmpty!28245 () Bool)

(declare-fun mapRes!28245 () Bool)

(declare-fun tp!54183 () Bool)

(assert (=> mapNonEmpty!28245 (= mapRes!28245 (and tp!54183 e!492347))))

(declare-fun mapValue!28245 () ValueCell!8426)

(declare-fun mapKey!28245 () (_ BitVec 32))

(declare-fun mapRest!28245 () (Array (_ BitVec 32) ValueCell!8426))

(assert (=> mapNonEmpty!28245 (= mapRest!28236 (store mapRest!28245 mapKey!28245 mapValue!28245))))

(declare-fun condMapEmpty!28245 () Bool)

(declare-fun mapDefault!28245 () ValueCell!8426)

(assert (=> mapNonEmpty!28236 (= condMapEmpty!28245 (= mapRest!28236 ((as const (Array (_ BitVec 32) ValueCell!8426)) mapDefault!28245)))))

(assert (=> mapNonEmpty!28236 (= tp!54168 (and e!492346 mapRes!28245))))

(declare-fun mapIsEmpty!28245 () Bool)

(assert (=> mapIsEmpty!28245 mapRes!28245))

(assert (= (and mapNonEmpty!28236 condMapEmpty!28245) mapIsEmpty!28245))

(assert (= (and mapNonEmpty!28236 (not condMapEmpty!28245)) mapNonEmpty!28245))

(assert (= (and mapNonEmpty!28245 ((_ is ValueCellFull!8426) mapValue!28245)) b!884725))

(assert (= (and mapNonEmpty!28236 ((_ is ValueCellFull!8426) mapDefault!28245)) b!884726))

(declare-fun m!824469 () Bool)

(assert (=> mapNonEmpty!28245 m!824469))

(declare-fun b_lambda!12785 () Bool)

(assert (= b_lambda!12777 (or (and start!74980 b_free!15487) b_lambda!12785)))

(declare-fun b_lambda!12787 () Bool)

(assert (= b_lambda!12775 (or (and start!74980 b_free!15487) b_lambda!12787)))

(declare-fun b_lambda!12789 () Bool)

(assert (= b_lambda!12779 (or (and start!74980 b_free!15487) b_lambda!12789)))

(declare-fun b_lambda!12791 () Bool)

(assert (= b_lambda!12771 (or (and start!74980 b_free!15487) b_lambda!12791)))

(declare-fun b_lambda!12793 () Bool)

(assert (= b_lambda!12783 (or (and start!74980 b_free!15487) b_lambda!12793)))

(declare-fun b_lambda!12795 () Bool)

(assert (= b_lambda!12781 (or (and start!74980 b_free!15487) b_lambda!12795)))

(declare-fun b_lambda!12797 () Bool)

(assert (= b_lambda!12773 (or (and start!74980 b_free!15487) b_lambda!12797)))

(declare-fun b_lambda!12799 () Bool)

(assert (= b_lambda!12769 (or (and start!74980 b_free!15487) b_lambda!12799)))

(check-sat (not b!884684) (not b!884674) (not b_lambda!12799) (not bm!38986) (not b!884683) (not b!884659) (not b!884678) (not b!884643) (not b!884675) (not bm!38983) (not b!884688) (not b!884630) (not bm!38993) (not b!884625) (not b_lambda!12789) (not b!884629) (not b!884682) (not d!109073) (not b!884633) (not b!884660) (not b!884679) (not b_lambda!12797) tp_is_empty!17731 (not d!109075) (not b!884690) (not d!109077) (not b!884667) (not b!884703) (not b!884706) (not b!884658) (not b!884715) (not d!109069) b_and!25671 (not b_lambda!12795) (not b!884631) (not b!884666) (not b!884663) (not b!884704) (not b!884634) (not d!109067) (not b!884687) (not b!884671) (not mapNonEmpty!28245) (not bm!38984) (not b_lambda!12787) (not b!884654) (not b!884655) (not bm!38990) (not bm!38987) (not d!109063) (not b!884651) (not b!884672) (not bm!38985) (not d!109071) (not b!884644) (not b!884664) (not b_lambda!12793) (not b!884670) (not b!884662) (not bm!38978) (not b!884676) (not b_lambda!12791) (not b!884691) (not b!884716) (not b!884686) (not b_lambda!12785) (not b_next!15487) (not b!884635) (not b!884626))
(check-sat b_and!25671 (not b_next!15487))
