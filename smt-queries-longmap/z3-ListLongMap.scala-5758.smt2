; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74544 () Bool)

(assert start!74544)

(declare-fun b_free!15139 () Bool)

(declare-fun b_next!15139 () Bool)

(assert (=> start!74544 (= b_free!15139 (not b_next!15139))))

(declare-fun tp!53093 () Bool)

(declare-fun b_and!24925 () Bool)

(assert (=> start!74544 (= tp!53093 b_and!24925)))

(declare-datatypes ((V!28225 0))(
  ( (V!28226 (val!8739 Int)) )
))
(declare-datatypes ((ValueCell!8252 0))(
  ( (ValueCellFull!8252 (v!11168 V!28225)) (EmptyCell!8252) )
))
(declare-datatypes ((array!50939 0))(
  ( (array!50940 (arr!24493 (Array (_ BitVec 32) ValueCell!8252)) (size!24934 (_ BitVec 32))) )
))
(declare-fun lt!396605 () array!50939)

(declare-fun bm!38684 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11482 0))(
  ( (tuple2!11483 (_1!5752 (_ BitVec 64)) (_2!5752 V!28225)) )
))
(declare-datatypes ((List!17324 0))(
  ( (Nil!17321) (Cons!17320 (h!18457 tuple2!11482) (t!24359 List!17324)) )
))
(declare-datatypes ((ListLongMap!10253 0))(
  ( (ListLongMap!10254 (toList!5142 List!17324)) )
))
(declare-fun call!38688 () ListLongMap!10253)

(declare-datatypes ((array!50941 0))(
  ( (array!50942 (arr!24494 (Array (_ BitVec 32) (_ BitVec 64))) (size!24935 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50941)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28225)

(declare-fun zeroValue!654 () V!28225)

(declare-fun getCurrentListMapNoExtraKeys!3184 (array!50941 array!50939 (_ BitVec 32) (_ BitVec 32) V!28225 V!28225 (_ BitVec 32) Int) ListLongMap!10253)

(assert (=> bm!38684 (= call!38688 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876550 () Bool)

(declare-fun e!488055 () Bool)

(declare-fun e!488056 () Bool)

(declare-fun mapRes!27683 () Bool)

(assert (=> b!876550 (= e!488055 (and e!488056 mapRes!27683))))

(declare-fun condMapEmpty!27683 () Bool)

(declare-fun _values!688 () array!50939)

(declare-fun mapDefault!27683 () ValueCell!8252)

(assert (=> b!876550 (= condMapEmpty!27683 (= (arr!24493 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8252)) mapDefault!27683)))))

(declare-fun b!876551 () Bool)

(declare-fun res!595424 () Bool)

(declare-fun e!488057 () Bool)

(assert (=> b!876551 (=> (not res!595424) (not e!488057))))

(assert (=> b!876551 (= res!595424 (and (= (size!24934 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24935 _keys!868) (size!24934 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38685 () Bool)

(declare-fun call!38687 () ListLongMap!10253)

(assert (=> bm!38685 (= call!38687 (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!396606 () ListLongMap!10253)

(declare-fun b!876552 () Bool)

(declare-fun e!488053 () Bool)

(declare-fun +!2489 (ListLongMap!10253 tuple2!11482) ListLongMap!10253)

(declare-fun get!12893 (ValueCell!8252 V!28225) V!28225)

(declare-fun dynLambda!1227 (Int (_ BitVec 64)) V!28225)

(assert (=> b!876552 (= e!488053 (= lt!396606 (+!2489 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!876553 () Bool)

(declare-fun res!595430 () Bool)

(assert (=> b!876553 (=> (not res!595430) (not e!488057))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876553 (= res!595430 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24935 _keys!868))))))

(declare-fun b!876554 () Bool)

(declare-fun res!595433 () Bool)

(assert (=> b!876554 (=> (not res!595433) (not e!488057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50941 (_ BitVec 32)) Bool)

(assert (=> b!876554 (= res!595433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun v!557 () V!28225)

(declare-fun e!488050 () Bool)

(declare-fun b!876555 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!876555 (= e!488050 (= call!38688 (+!2489 call!38687 (tuple2!11483 k0!854 v!557))))))

(declare-fun res!595426 () Bool)

(assert (=> start!74544 (=> (not res!595426) (not e!488057))))

(assert (=> start!74544 (= res!595426 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24935 _keys!868))))))

(assert (=> start!74544 e!488057))

(declare-fun tp_is_empty!17383 () Bool)

(assert (=> start!74544 tp_is_empty!17383))

(assert (=> start!74544 true))

(assert (=> start!74544 tp!53093))

(declare-fun array_inv!19364 (array!50941) Bool)

(assert (=> start!74544 (array_inv!19364 _keys!868)))

(declare-fun array_inv!19365 (array!50939) Bool)

(assert (=> start!74544 (and (array_inv!19365 _values!688) e!488055)))

(declare-fun b!876556 () Bool)

(declare-fun res!595425 () Bool)

(assert (=> b!876556 (=> (not res!595425) (not e!488057))))

(declare-datatypes ((List!17325 0))(
  ( (Nil!17322) (Cons!17321 (h!18458 (_ BitVec 64)) (t!24360 List!17325)) )
))
(declare-fun arrayNoDuplicates!0 (array!50941 (_ BitVec 32) List!17325) Bool)

(assert (=> b!876556 (= res!595425 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17322))))

(declare-fun b!876557 () Bool)

(declare-fun res!595429 () Bool)

(assert (=> b!876557 (=> (not res!595429) (not e!488057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876557 (= res!595429 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27683 () Bool)

(declare-fun tp!53092 () Bool)

(declare-fun e!488054 () Bool)

(assert (=> mapNonEmpty!27683 (= mapRes!27683 (and tp!53092 e!488054))))

(declare-fun mapKey!27683 () (_ BitVec 32))

(declare-fun mapRest!27683 () (Array (_ BitVec 32) ValueCell!8252))

(declare-fun mapValue!27683 () ValueCell!8252)

(assert (=> mapNonEmpty!27683 (= (arr!24493 _values!688) (store mapRest!27683 mapKey!27683 mapValue!27683))))

(declare-fun b!876558 () Bool)

(declare-fun e!488051 () Bool)

(assert (=> b!876558 (= e!488057 e!488051)))

(declare-fun res!595427 () Bool)

(assert (=> b!876558 (=> (not res!595427) (not e!488051))))

(assert (=> b!876558 (= res!595427 (= from!1053 i!612))))

(assert (=> b!876558 (= lt!396606 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876558 (= lt!396605 (array!50940 (store (arr!24493 _values!688) i!612 (ValueCellFull!8252 v!557)) (size!24934 _values!688)))))

(declare-fun lt!396604 () ListLongMap!10253)

(assert (=> b!876558 (= lt!396604 (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876559 () Bool)

(declare-fun res!595432 () Bool)

(assert (=> b!876559 (=> (not res!595432) (not e!488057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876559 (= res!595432 (validMask!0 mask!1196))))

(declare-fun b!876560 () Bool)

(assert (=> b!876560 (= e!488050 (= call!38688 call!38687))))

(declare-fun b!876561 () Bool)

(assert (=> b!876561 (= e!488056 tp_is_empty!17383)))

(declare-fun b!876562 () Bool)

(assert (=> b!876562 (= e!488054 tp_is_empty!17383)))

(declare-fun b!876563 () Bool)

(declare-fun res!595431 () Bool)

(assert (=> b!876563 (=> (not res!595431) (not e!488057))))

(assert (=> b!876563 (= res!595431 (and (= (select (arr!24494 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27683 () Bool)

(assert (=> mapIsEmpty!27683 mapRes!27683))

(declare-fun b!876564 () Bool)

(assert (=> b!876564 (= e!488051 (not e!488053))))

(declare-fun res!595428 () Bool)

(assert (=> b!876564 (=> res!595428 e!488053)))

(assert (=> b!876564 (= res!595428 (not (validKeyInArray!0 (select (arr!24494 _keys!868) from!1053))))))

(assert (=> b!876564 e!488050))

(declare-fun c!92804 () Bool)

(assert (=> b!876564 (= c!92804 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29930 0))(
  ( (Unit!29931) )
))
(declare-fun lt!396603 () Unit!29930)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!659 (array!50941 array!50939 (_ BitVec 32) (_ BitVec 32) V!28225 V!28225 (_ BitVec 32) (_ BitVec 64) V!28225 (_ BitVec 32) Int) Unit!29930)

(assert (=> b!876564 (= lt!396603 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74544 res!595426) b!876559))

(assert (= (and b!876559 res!595432) b!876551))

(assert (= (and b!876551 res!595424) b!876554))

(assert (= (and b!876554 res!595433) b!876556))

(assert (= (and b!876556 res!595425) b!876553))

(assert (= (and b!876553 res!595430) b!876557))

(assert (= (and b!876557 res!595429) b!876563))

(assert (= (and b!876563 res!595431) b!876558))

(assert (= (and b!876558 res!595427) b!876564))

(assert (= (and b!876564 c!92804) b!876555))

(assert (= (and b!876564 (not c!92804)) b!876560))

(assert (= (or b!876555 b!876560) bm!38684))

(assert (= (or b!876555 b!876560) bm!38685))

(assert (= (and b!876564 (not res!595428)) b!876552))

(assert (= (and b!876550 condMapEmpty!27683) mapIsEmpty!27683))

(assert (= (and b!876550 (not condMapEmpty!27683)) mapNonEmpty!27683))

(get-info :version)

(assert (= (and mapNonEmpty!27683 ((_ is ValueCellFull!8252) mapValue!27683)) b!876562))

(assert (= (and b!876550 ((_ is ValueCellFull!8252) mapDefault!27683)) b!876561))

(assert (= start!74544 b!876550))

(declare-fun b_lambda!12187 () Bool)

(assert (=> (not b_lambda!12187) (not b!876552)))

(declare-fun t!24358 () Bool)

(declare-fun tb!4891 () Bool)

(assert (=> (and start!74544 (= defaultEntry!696 defaultEntry!696) t!24358) tb!4891))

(declare-fun result!9407 () Bool)

(assert (=> tb!4891 (= result!9407 tp_is_empty!17383)))

(assert (=> b!876552 t!24358))

(declare-fun b_and!24927 () Bool)

(assert (= b_and!24925 (and (=> t!24358 result!9407) b_and!24927)))

(declare-fun m!816751 () Bool)

(assert (=> b!876564 m!816751))

(assert (=> b!876564 m!816751))

(declare-fun m!816753 () Bool)

(assert (=> b!876564 m!816753))

(declare-fun m!816755 () Bool)

(assert (=> b!876564 m!816755))

(declare-fun m!816757 () Bool)

(assert (=> mapNonEmpty!27683 m!816757))

(declare-fun m!816759 () Bool)

(assert (=> start!74544 m!816759))

(declare-fun m!816761 () Bool)

(assert (=> start!74544 m!816761))

(declare-fun m!816763 () Bool)

(assert (=> b!876559 m!816763))

(declare-fun m!816765 () Bool)

(assert (=> bm!38684 m!816765))

(declare-fun m!816767 () Bool)

(assert (=> b!876558 m!816767))

(declare-fun m!816769 () Bool)

(assert (=> b!876558 m!816769))

(declare-fun m!816771 () Bool)

(assert (=> b!876558 m!816771))

(declare-fun m!816773 () Bool)

(assert (=> b!876563 m!816773))

(assert (=> b!876552 m!816765))

(declare-fun m!816775 () Bool)

(assert (=> b!876552 m!816775))

(declare-fun m!816777 () Bool)

(assert (=> b!876552 m!816777))

(declare-fun m!816779 () Bool)

(assert (=> b!876552 m!816779))

(declare-fun m!816781 () Bool)

(assert (=> b!876552 m!816781))

(assert (=> b!876552 m!816777))

(assert (=> b!876552 m!816765))

(assert (=> b!876552 m!816751))

(assert (=> b!876552 m!816779))

(declare-fun m!816783 () Bool)

(assert (=> b!876556 m!816783))

(declare-fun m!816785 () Bool)

(assert (=> bm!38685 m!816785))

(declare-fun m!816787 () Bool)

(assert (=> b!876555 m!816787))

(declare-fun m!816789 () Bool)

(assert (=> b!876557 m!816789))

(declare-fun m!816791 () Bool)

(assert (=> b!876554 m!816791))

(check-sat (not b!876557) (not b_next!15139) (not start!74544) (not b!876552) (not mapNonEmpty!27683) (not b!876558) (not bm!38684) tp_is_empty!17383 (not b_lambda!12187) (not bm!38685) (not b!876564) (not b!876556) (not b!876555) b_and!24927 (not b!876559) (not b!876554))
(check-sat b_and!24927 (not b_next!15139))
(get-model)

(declare-fun b_lambda!12193 () Bool)

(assert (= b_lambda!12187 (or (and start!74544 b_free!15139) b_lambda!12193)))

(check-sat (not b!876557) (not b_next!15139) (not b_lambda!12193) (not start!74544) (not b!876552) (not mapNonEmpty!27683) (not b!876558) (not bm!38685) (not bm!38684) tp_is_empty!17383 (not b!876564) (not b!876556) (not b!876555) b_and!24927 (not b!876559) (not b!876554))
(check-sat b_and!24927 (not b_next!15139))
(get-model)

(declare-fun b!876685 () Bool)

(declare-fun e!488125 () Bool)

(declare-fun e!488121 () Bool)

(assert (=> b!876685 (= e!488125 e!488121)))

(declare-fun c!92820 () Bool)

(declare-fun e!488122 () Bool)

(assert (=> b!876685 (= c!92820 e!488122)))

(declare-fun res!595502 () Bool)

(assert (=> b!876685 (=> (not res!595502) (not e!488122))))

(assert (=> b!876685 (= res!595502 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(declare-fun d!108899 () Bool)

(assert (=> d!108899 e!488125))

(declare-fun res!595504 () Bool)

(assert (=> d!108899 (=> (not res!595504) (not e!488125))))

(declare-fun lt!396648 () ListLongMap!10253)

(declare-fun contains!4223 (ListLongMap!10253 (_ BitVec 64)) Bool)

(assert (=> d!108899 (= res!595504 (not (contains!4223 lt!396648 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488126 () ListLongMap!10253)

(assert (=> d!108899 (= lt!396648 e!488126)))

(declare-fun c!92822 () Bool)

(assert (=> d!108899 (= c!92822 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(assert (=> d!108899 (validMask!0 mask!1196)))

(assert (=> d!108899 (= (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396648)))

(declare-fun b!876686 () Bool)

(assert (=> b!876686 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(assert (=> b!876686 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24934 _values!688)))))

(declare-fun e!488124 () Bool)

(declare-fun apply!376 (ListLongMap!10253 (_ BitVec 64)) V!28225)

(assert (=> b!876686 (= e!488124 (= (apply!376 lt!396648 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12893 (select (arr!24493 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876687 () Bool)

(declare-fun e!488120 () Bool)

(declare-fun isEmpty!668 (ListLongMap!10253) Bool)

(assert (=> b!876687 (= e!488120 (isEmpty!668 lt!396648))))

(declare-fun b!876688 () Bool)

(declare-fun e!488123 () ListLongMap!10253)

(assert (=> b!876688 (= e!488126 e!488123)))

(declare-fun c!92819 () Bool)

(assert (=> b!876688 (= c!92819 (validKeyInArray!0 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!876689 () Bool)

(assert (=> b!876689 (= e!488122 (validKeyInArray!0 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876689 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!876690 () Bool)

(assert (=> b!876690 (= e!488120 (= lt!396648 (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876691 () Bool)

(assert (=> b!876691 (= e!488121 e!488124)))

(assert (=> b!876691 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(declare-fun res!595505 () Bool)

(assert (=> b!876691 (= res!595505 (contains!4223 lt!396648 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876691 (=> (not res!595505) (not e!488124))))

(declare-fun bm!38700 () Bool)

(declare-fun call!38703 () ListLongMap!10253)

(assert (=> bm!38700 (= call!38703 (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876692 () Bool)

(assert (=> b!876692 (= e!488121 e!488120)))

(declare-fun c!92821 () Bool)

(assert (=> b!876692 (= c!92821 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(declare-fun b!876693 () Bool)

(assert (=> b!876693 (= e!488126 (ListLongMap!10254 Nil!17321))))

(declare-fun b!876694 () Bool)

(assert (=> b!876694 (= e!488123 call!38703)))

(declare-fun b!876695 () Bool)

(declare-fun lt!396650 () Unit!29930)

(declare-fun lt!396646 () Unit!29930)

(assert (=> b!876695 (= lt!396650 lt!396646)))

(declare-fun lt!396649 () (_ BitVec 64))

(declare-fun lt!396647 () (_ BitVec 64))

(declare-fun lt!396645 () V!28225)

(declare-fun lt!396651 () ListLongMap!10253)

(assert (=> b!876695 (not (contains!4223 (+!2489 lt!396651 (tuple2!11483 lt!396649 lt!396645)) lt!396647))))

(declare-fun addStillNotContains!203 (ListLongMap!10253 (_ BitVec 64) V!28225 (_ BitVec 64)) Unit!29930)

(assert (=> b!876695 (= lt!396646 (addStillNotContains!203 lt!396651 lt!396649 lt!396645 lt!396647))))

(assert (=> b!876695 (= lt!396647 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876695 (= lt!396645 (get!12893 (select (arr!24493 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876695 (= lt!396649 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!876695 (= lt!396651 call!38703)))

(assert (=> b!876695 (= e!488123 (+!2489 call!38703 (tuple2!11483 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12893 (select (arr!24493 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876696 () Bool)

(declare-fun res!595503 () Bool)

(assert (=> b!876696 (=> (not res!595503) (not e!488125))))

(assert (=> b!876696 (= res!595503 (not (contains!4223 lt!396648 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108899 c!92822) b!876693))

(assert (= (and d!108899 (not c!92822)) b!876688))

(assert (= (and b!876688 c!92819) b!876695))

(assert (= (and b!876688 (not c!92819)) b!876694))

(assert (= (or b!876695 b!876694) bm!38700))

(assert (= (and d!108899 res!595504) b!876696))

(assert (= (and b!876696 res!595503) b!876685))

(assert (= (and b!876685 res!595502) b!876689))

(assert (= (and b!876685 c!92820) b!876691))

(assert (= (and b!876685 (not c!92820)) b!876692))

(assert (= (and b!876691 res!595505) b!876686))

(assert (= (and b!876692 c!92821) b!876690))

(assert (= (and b!876692 (not c!92821)) b!876687))

(declare-fun b_lambda!12195 () Bool)

(assert (=> (not b_lambda!12195) (not b!876686)))

(assert (=> b!876686 t!24358))

(declare-fun b_and!24937 () Bool)

(assert (= b_and!24927 (and (=> t!24358 result!9407) b_and!24937)))

(declare-fun b_lambda!12197 () Bool)

(assert (=> (not b_lambda!12197) (not b!876695)))

(assert (=> b!876695 t!24358))

(declare-fun b_and!24939 () Bool)

(assert (= b_and!24937 (and (=> t!24358 result!9407) b_and!24939)))

(declare-fun m!816877 () Bool)

(assert (=> d!108899 m!816877))

(assert (=> d!108899 m!816763))

(declare-fun m!816879 () Bool)

(assert (=> b!876689 m!816879))

(assert (=> b!876689 m!816879))

(declare-fun m!816881 () Bool)

(assert (=> b!876689 m!816881))

(declare-fun m!816883 () Bool)

(assert (=> b!876690 m!816883))

(assert (=> b!876691 m!816879))

(assert (=> b!876691 m!816879))

(declare-fun m!816885 () Bool)

(assert (=> b!876691 m!816885))

(assert (=> b!876688 m!816879))

(assert (=> b!876688 m!816879))

(assert (=> b!876688 m!816881))

(declare-fun m!816887 () Bool)

(assert (=> b!876687 m!816887))

(assert (=> b!876686 m!816879))

(assert (=> b!876686 m!816879))

(declare-fun m!816889 () Bool)

(assert (=> b!876686 m!816889))

(assert (=> b!876686 m!816779))

(declare-fun m!816891 () Bool)

(assert (=> b!876686 m!816891))

(assert (=> b!876686 m!816779))

(declare-fun m!816893 () Bool)

(assert (=> b!876686 m!816893))

(assert (=> b!876686 m!816891))

(declare-fun m!816895 () Bool)

(assert (=> b!876695 m!816895))

(assert (=> b!876695 m!816779))

(assert (=> b!876695 m!816891))

(assert (=> b!876695 m!816779))

(assert (=> b!876695 m!816893))

(assert (=> b!876695 m!816891))

(declare-fun m!816897 () Bool)

(assert (=> b!876695 m!816897))

(assert (=> b!876695 m!816895))

(declare-fun m!816899 () Bool)

(assert (=> b!876695 m!816899))

(assert (=> b!876695 m!816879))

(declare-fun m!816901 () Bool)

(assert (=> b!876695 m!816901))

(declare-fun m!816903 () Bool)

(assert (=> b!876696 m!816903))

(assert (=> bm!38700 m!816883))

(assert (=> bm!38685 d!108899))

(declare-fun b!876707 () Bool)

(declare-fun e!488135 () Bool)

(declare-fun contains!4224 (List!17325 (_ BitVec 64)) Bool)

(assert (=> b!876707 (= e!488135 (contains!4224 Nil!17322 (select (arr!24494 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!876708 () Bool)

(declare-fun e!488137 () Bool)

(declare-fun call!38706 () Bool)

(assert (=> b!876708 (= e!488137 call!38706)))

(declare-fun b!876709 () Bool)

(declare-fun e!488136 () Bool)

(declare-fun e!488138 () Bool)

(assert (=> b!876709 (= e!488136 e!488138)))

(declare-fun res!595513 () Bool)

(assert (=> b!876709 (=> (not res!595513) (not e!488138))))

(assert (=> b!876709 (= res!595513 (not e!488135))))

(declare-fun res!595512 () Bool)

(assert (=> b!876709 (=> (not res!595512) (not e!488135))))

(assert (=> b!876709 (= res!595512 (validKeyInArray!0 (select (arr!24494 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108901 () Bool)

(declare-fun res!595514 () Bool)

(assert (=> d!108901 (=> res!595514 e!488136)))

(assert (=> d!108901 (= res!595514 (bvsge #b00000000000000000000000000000000 (size!24935 _keys!868)))))

(assert (=> d!108901 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17322) e!488136)))

(declare-fun bm!38703 () Bool)

(declare-fun c!92825 () Bool)

(assert (=> bm!38703 (= call!38706 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92825 (Cons!17321 (select (arr!24494 _keys!868) #b00000000000000000000000000000000) Nil!17322) Nil!17322)))))

(declare-fun b!876710 () Bool)

(assert (=> b!876710 (= e!488137 call!38706)))

(declare-fun b!876711 () Bool)

(assert (=> b!876711 (= e!488138 e!488137)))

(assert (=> b!876711 (= c!92825 (validKeyInArray!0 (select (arr!24494 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108901 (not res!595514)) b!876709))

(assert (= (and b!876709 res!595512) b!876707))

(assert (= (and b!876709 res!595513) b!876711))

(assert (= (and b!876711 c!92825) b!876710))

(assert (= (and b!876711 (not c!92825)) b!876708))

(assert (= (or b!876710 b!876708) bm!38703))

(declare-fun m!816905 () Bool)

(assert (=> b!876707 m!816905))

(assert (=> b!876707 m!816905))

(declare-fun m!816907 () Bool)

(assert (=> b!876707 m!816907))

(assert (=> b!876709 m!816905))

(assert (=> b!876709 m!816905))

(declare-fun m!816909 () Bool)

(assert (=> b!876709 m!816909))

(assert (=> bm!38703 m!816905))

(declare-fun m!816911 () Bool)

(assert (=> bm!38703 m!816911))

(assert (=> b!876711 m!816905))

(assert (=> b!876711 m!816905))

(assert (=> b!876711 m!816909))

(assert (=> b!876556 d!108901))

(declare-fun d!108903 () Bool)

(declare-fun e!488141 () Bool)

(assert (=> d!108903 e!488141))

(declare-fun res!595519 () Bool)

(assert (=> d!108903 (=> (not res!595519) (not e!488141))))

(declare-fun lt!396662 () ListLongMap!10253)

(assert (=> d!108903 (= res!595519 (contains!4223 lt!396662 (_1!5752 (tuple2!11483 k0!854 v!557))))))

(declare-fun lt!396661 () List!17324)

(assert (=> d!108903 (= lt!396662 (ListLongMap!10254 lt!396661))))

(declare-fun lt!396663 () Unit!29930)

(declare-fun lt!396660 () Unit!29930)

(assert (=> d!108903 (= lt!396663 lt!396660)))

(declare-datatypes ((Option!425 0))(
  ( (Some!424 (v!11174 V!28225)) (None!423) )
))
(declare-fun getValueByKey!419 (List!17324 (_ BitVec 64)) Option!425)

(assert (=> d!108903 (= (getValueByKey!419 lt!396661 (_1!5752 (tuple2!11483 k0!854 v!557))) (Some!424 (_2!5752 (tuple2!11483 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!233 (List!17324 (_ BitVec 64) V!28225) Unit!29930)

(assert (=> d!108903 (= lt!396660 (lemmaContainsTupThenGetReturnValue!233 lt!396661 (_1!5752 (tuple2!11483 k0!854 v!557)) (_2!5752 (tuple2!11483 k0!854 v!557))))))

(declare-fun insertStrictlySorted!272 (List!17324 (_ BitVec 64) V!28225) List!17324)

(assert (=> d!108903 (= lt!396661 (insertStrictlySorted!272 (toList!5142 call!38687) (_1!5752 (tuple2!11483 k0!854 v!557)) (_2!5752 (tuple2!11483 k0!854 v!557))))))

(assert (=> d!108903 (= (+!2489 call!38687 (tuple2!11483 k0!854 v!557)) lt!396662)))

(declare-fun b!876716 () Bool)

(declare-fun res!595520 () Bool)

(assert (=> b!876716 (=> (not res!595520) (not e!488141))))

(assert (=> b!876716 (= res!595520 (= (getValueByKey!419 (toList!5142 lt!396662) (_1!5752 (tuple2!11483 k0!854 v!557))) (Some!424 (_2!5752 (tuple2!11483 k0!854 v!557)))))))

(declare-fun b!876717 () Bool)

(declare-fun contains!4225 (List!17324 tuple2!11482) Bool)

(assert (=> b!876717 (= e!488141 (contains!4225 (toList!5142 lt!396662) (tuple2!11483 k0!854 v!557)))))

(assert (= (and d!108903 res!595519) b!876716))

(assert (= (and b!876716 res!595520) b!876717))

(declare-fun m!816913 () Bool)

(assert (=> d!108903 m!816913))

(declare-fun m!816915 () Bool)

(assert (=> d!108903 m!816915))

(declare-fun m!816917 () Bool)

(assert (=> d!108903 m!816917))

(declare-fun m!816919 () Bool)

(assert (=> d!108903 m!816919))

(declare-fun m!816921 () Bool)

(assert (=> b!876716 m!816921))

(declare-fun m!816923 () Bool)

(assert (=> b!876717 m!816923))

(assert (=> b!876555 d!108903))

(declare-fun d!108905 () Bool)

(assert (=> d!108905 (= (validKeyInArray!0 (select (arr!24494 _keys!868) from!1053)) (and (not (= (select (arr!24494 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24494 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876564 d!108905))

(declare-fun b!876724 () Bool)

(declare-fun e!488147 () Bool)

(declare-fun call!38712 () ListLongMap!10253)

(declare-fun call!38711 () ListLongMap!10253)

(assert (=> b!876724 (= e!488147 (= call!38712 call!38711))))

(declare-fun d!108907 () Bool)

(declare-fun e!488146 () Bool)

(assert (=> d!108907 e!488146))

(declare-fun res!595523 () Bool)

(assert (=> d!108907 (=> (not res!595523) (not e!488146))))

(assert (=> d!108907 (= res!595523 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24934 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24934 _values!688))))))))

(declare-fun lt!396666 () Unit!29930)

(declare-fun choose!1435 (array!50941 array!50939 (_ BitVec 32) (_ BitVec 32) V!28225 V!28225 (_ BitVec 32) (_ BitVec 64) V!28225 (_ BitVec 32) Int) Unit!29930)

(assert (=> d!108907 (= lt!396666 (choose!1435 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108907 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(assert (=> d!108907 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396666)))

(declare-fun bm!38708 () Bool)

(assert (=> bm!38708 (= call!38711 (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876725 () Bool)

(assert (=> b!876725 (= e!488147 (= call!38712 (+!2489 call!38711 (tuple2!11483 k0!854 v!557))))))

(declare-fun b!876726 () Bool)

(assert (=> b!876726 (= e!488146 e!488147)))

(declare-fun c!92828 () Bool)

(assert (=> b!876726 (= c!92828 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun bm!38709 () Bool)

(assert (=> bm!38709 (= call!38712 (getCurrentListMapNoExtraKeys!3184 _keys!868 (array!50940 (store (arr!24493 _values!688) i!612 (ValueCellFull!8252 v!557)) (size!24934 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!108907 res!595523) b!876726))

(assert (= (and b!876726 c!92828) b!876725))

(assert (= (and b!876726 (not c!92828)) b!876724))

(assert (= (or b!876725 b!876724) bm!38708))

(assert (= (or b!876725 b!876724) bm!38709))

(declare-fun m!816925 () Bool)

(assert (=> d!108907 m!816925))

(assert (=> bm!38708 m!816785))

(declare-fun m!816927 () Bool)

(assert (=> b!876725 m!816927))

(assert (=> bm!38709 m!816769))

(declare-fun m!816929 () Bool)

(assert (=> bm!38709 m!816929))

(assert (=> b!876564 d!108907))

(declare-fun d!108909 () Bool)

(assert (=> d!108909 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!876559 d!108909))

(declare-fun b!876727 () Bool)

(declare-fun e!488153 () Bool)

(declare-fun e!488149 () Bool)

(assert (=> b!876727 (= e!488153 e!488149)))

(declare-fun c!92830 () Bool)

(declare-fun e!488150 () Bool)

(assert (=> b!876727 (= c!92830 e!488150)))

(declare-fun res!595524 () Bool)

(assert (=> b!876727 (=> (not res!595524) (not e!488150))))

(assert (=> b!876727 (= res!595524 (bvslt from!1053 (size!24935 _keys!868)))))

(declare-fun d!108911 () Bool)

(assert (=> d!108911 e!488153))

(declare-fun res!595526 () Bool)

(assert (=> d!108911 (=> (not res!595526) (not e!488153))))

(declare-fun lt!396670 () ListLongMap!10253)

(assert (=> d!108911 (= res!595526 (not (contains!4223 lt!396670 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488154 () ListLongMap!10253)

(assert (=> d!108911 (= lt!396670 e!488154)))

(declare-fun c!92832 () Bool)

(assert (=> d!108911 (= c!92832 (bvsge from!1053 (size!24935 _keys!868)))))

(assert (=> d!108911 (validMask!0 mask!1196)))

(assert (=> d!108911 (= (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396670)))

(declare-fun b!876728 () Bool)

(assert (=> b!876728 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24935 _keys!868)))))

(assert (=> b!876728 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24934 lt!396605)))))

(declare-fun e!488152 () Bool)

(assert (=> b!876728 (= e!488152 (= (apply!376 lt!396670 (select (arr!24494 _keys!868) from!1053)) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876729 () Bool)

(declare-fun e!488148 () Bool)

(assert (=> b!876729 (= e!488148 (isEmpty!668 lt!396670))))

(declare-fun b!876730 () Bool)

(declare-fun e!488151 () ListLongMap!10253)

(assert (=> b!876730 (= e!488154 e!488151)))

(declare-fun c!92829 () Bool)

(assert (=> b!876730 (= c!92829 (validKeyInArray!0 (select (arr!24494 _keys!868) from!1053)))))

(declare-fun b!876731 () Bool)

(assert (=> b!876731 (= e!488150 (validKeyInArray!0 (select (arr!24494 _keys!868) from!1053)))))

(assert (=> b!876731 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!876732 () Bool)

(assert (=> b!876732 (= e!488148 (= lt!396670 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876733 () Bool)

(assert (=> b!876733 (= e!488149 e!488152)))

(assert (=> b!876733 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24935 _keys!868)))))

(declare-fun res!595527 () Bool)

(assert (=> b!876733 (= res!595527 (contains!4223 lt!396670 (select (arr!24494 _keys!868) from!1053)))))

(assert (=> b!876733 (=> (not res!595527) (not e!488152))))

(declare-fun call!38713 () ListLongMap!10253)

(declare-fun bm!38710 () Bool)

(assert (=> bm!38710 (= call!38713 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876734 () Bool)

(assert (=> b!876734 (= e!488149 e!488148)))

(declare-fun c!92831 () Bool)

(assert (=> b!876734 (= c!92831 (bvslt from!1053 (size!24935 _keys!868)))))

(declare-fun b!876735 () Bool)

(assert (=> b!876735 (= e!488154 (ListLongMap!10254 Nil!17321))))

(declare-fun b!876736 () Bool)

(assert (=> b!876736 (= e!488151 call!38713)))

(declare-fun b!876737 () Bool)

(declare-fun lt!396672 () Unit!29930)

(declare-fun lt!396668 () Unit!29930)

(assert (=> b!876737 (= lt!396672 lt!396668)))

(declare-fun lt!396669 () (_ BitVec 64))

(declare-fun lt!396673 () ListLongMap!10253)

(declare-fun lt!396671 () (_ BitVec 64))

(declare-fun lt!396667 () V!28225)

(assert (=> b!876737 (not (contains!4223 (+!2489 lt!396673 (tuple2!11483 lt!396671 lt!396667)) lt!396669))))

(assert (=> b!876737 (= lt!396668 (addStillNotContains!203 lt!396673 lt!396671 lt!396667 lt!396669))))

(assert (=> b!876737 (= lt!396669 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876737 (= lt!396667 (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876737 (= lt!396671 (select (arr!24494 _keys!868) from!1053))))

(assert (=> b!876737 (= lt!396673 call!38713)))

(assert (=> b!876737 (= e!488151 (+!2489 call!38713 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876738 () Bool)

(declare-fun res!595525 () Bool)

(assert (=> b!876738 (=> (not res!595525) (not e!488153))))

(assert (=> b!876738 (= res!595525 (not (contains!4223 lt!396670 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108911 c!92832) b!876735))

(assert (= (and d!108911 (not c!92832)) b!876730))

(assert (= (and b!876730 c!92829) b!876737))

(assert (= (and b!876730 (not c!92829)) b!876736))

(assert (= (or b!876737 b!876736) bm!38710))

(assert (= (and d!108911 res!595526) b!876738))

(assert (= (and b!876738 res!595525) b!876727))

(assert (= (and b!876727 res!595524) b!876731))

(assert (= (and b!876727 c!92830) b!876733))

(assert (= (and b!876727 (not c!92830)) b!876734))

(assert (= (and b!876733 res!595527) b!876728))

(assert (= (and b!876734 c!92831) b!876732))

(assert (= (and b!876734 (not c!92831)) b!876729))

(declare-fun b_lambda!12199 () Bool)

(assert (=> (not b_lambda!12199) (not b!876728)))

(assert (=> b!876728 t!24358))

(declare-fun b_and!24941 () Bool)

(assert (= b_and!24939 (and (=> t!24358 result!9407) b_and!24941)))

(declare-fun b_lambda!12201 () Bool)

(assert (=> (not b_lambda!12201) (not b!876737)))

(assert (=> b!876737 t!24358))

(declare-fun b_and!24943 () Bool)

(assert (= b_and!24941 (and (=> t!24358 result!9407) b_and!24943)))

(declare-fun m!816931 () Bool)

(assert (=> d!108911 m!816931))

(assert (=> d!108911 m!816763))

(assert (=> b!876731 m!816751))

(assert (=> b!876731 m!816751))

(assert (=> b!876731 m!816753))

(declare-fun m!816933 () Bool)

(assert (=> b!876732 m!816933))

(assert (=> b!876733 m!816751))

(assert (=> b!876733 m!816751))

(declare-fun m!816935 () Bool)

(assert (=> b!876733 m!816935))

(assert (=> b!876730 m!816751))

(assert (=> b!876730 m!816751))

(assert (=> b!876730 m!816753))

(declare-fun m!816937 () Bool)

(assert (=> b!876729 m!816937))

(assert (=> b!876728 m!816751))

(assert (=> b!876728 m!816751))

(declare-fun m!816939 () Bool)

(assert (=> b!876728 m!816939))

(assert (=> b!876728 m!816779))

(assert (=> b!876728 m!816777))

(assert (=> b!876728 m!816779))

(assert (=> b!876728 m!816781))

(assert (=> b!876728 m!816777))

(declare-fun m!816941 () Bool)

(assert (=> b!876737 m!816941))

(assert (=> b!876737 m!816779))

(assert (=> b!876737 m!816777))

(assert (=> b!876737 m!816779))

(assert (=> b!876737 m!816781))

(assert (=> b!876737 m!816777))

(declare-fun m!816943 () Bool)

(assert (=> b!876737 m!816943))

(assert (=> b!876737 m!816941))

(declare-fun m!816945 () Bool)

(assert (=> b!876737 m!816945))

(assert (=> b!876737 m!816751))

(declare-fun m!816947 () Bool)

(assert (=> b!876737 m!816947))

(declare-fun m!816949 () Bool)

(assert (=> b!876738 m!816949))

(assert (=> bm!38710 m!816933))

(assert (=> b!876558 d!108911))

(declare-fun b!876739 () Bool)

(declare-fun e!488160 () Bool)

(declare-fun e!488156 () Bool)

(assert (=> b!876739 (= e!488160 e!488156)))

(declare-fun c!92834 () Bool)

(declare-fun e!488157 () Bool)

(assert (=> b!876739 (= c!92834 e!488157)))

(declare-fun res!595528 () Bool)

(assert (=> b!876739 (=> (not res!595528) (not e!488157))))

(assert (=> b!876739 (= res!595528 (bvslt from!1053 (size!24935 _keys!868)))))

(declare-fun d!108913 () Bool)

(assert (=> d!108913 e!488160))

(declare-fun res!595530 () Bool)

(assert (=> d!108913 (=> (not res!595530) (not e!488160))))

(declare-fun lt!396677 () ListLongMap!10253)

(assert (=> d!108913 (= res!595530 (not (contains!4223 lt!396677 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488161 () ListLongMap!10253)

(assert (=> d!108913 (= lt!396677 e!488161)))

(declare-fun c!92836 () Bool)

(assert (=> d!108913 (= c!92836 (bvsge from!1053 (size!24935 _keys!868)))))

(assert (=> d!108913 (validMask!0 mask!1196)))

(assert (=> d!108913 (= (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396677)))

(declare-fun b!876740 () Bool)

(assert (=> b!876740 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24935 _keys!868)))))

(assert (=> b!876740 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24934 _values!688)))))

(declare-fun e!488159 () Bool)

(assert (=> b!876740 (= e!488159 (= (apply!376 lt!396677 (select (arr!24494 _keys!868) from!1053)) (get!12893 (select (arr!24493 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876741 () Bool)

(declare-fun e!488155 () Bool)

(assert (=> b!876741 (= e!488155 (isEmpty!668 lt!396677))))

(declare-fun b!876742 () Bool)

(declare-fun e!488158 () ListLongMap!10253)

(assert (=> b!876742 (= e!488161 e!488158)))

(declare-fun c!92833 () Bool)

(assert (=> b!876742 (= c!92833 (validKeyInArray!0 (select (arr!24494 _keys!868) from!1053)))))

(declare-fun b!876743 () Bool)

(assert (=> b!876743 (= e!488157 (validKeyInArray!0 (select (arr!24494 _keys!868) from!1053)))))

(assert (=> b!876743 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!876744 () Bool)

(assert (=> b!876744 (= e!488155 (= lt!396677 (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876745 () Bool)

(assert (=> b!876745 (= e!488156 e!488159)))

(assert (=> b!876745 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24935 _keys!868)))))

(declare-fun res!595531 () Bool)

(assert (=> b!876745 (= res!595531 (contains!4223 lt!396677 (select (arr!24494 _keys!868) from!1053)))))

(assert (=> b!876745 (=> (not res!595531) (not e!488159))))

(declare-fun call!38714 () ListLongMap!10253)

(declare-fun bm!38711 () Bool)

(assert (=> bm!38711 (= call!38714 (getCurrentListMapNoExtraKeys!3184 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876746 () Bool)

(assert (=> b!876746 (= e!488156 e!488155)))

(declare-fun c!92835 () Bool)

(assert (=> b!876746 (= c!92835 (bvslt from!1053 (size!24935 _keys!868)))))

(declare-fun b!876747 () Bool)

(assert (=> b!876747 (= e!488161 (ListLongMap!10254 Nil!17321))))

(declare-fun b!876748 () Bool)

(assert (=> b!876748 (= e!488158 call!38714)))

(declare-fun b!876749 () Bool)

(declare-fun lt!396679 () Unit!29930)

(declare-fun lt!396675 () Unit!29930)

(assert (=> b!876749 (= lt!396679 lt!396675)))

(declare-fun lt!396680 () ListLongMap!10253)

(declare-fun lt!396674 () V!28225)

(declare-fun lt!396678 () (_ BitVec 64))

(declare-fun lt!396676 () (_ BitVec 64))

(assert (=> b!876749 (not (contains!4223 (+!2489 lt!396680 (tuple2!11483 lt!396678 lt!396674)) lt!396676))))

(assert (=> b!876749 (= lt!396675 (addStillNotContains!203 lt!396680 lt!396678 lt!396674 lt!396676))))

(assert (=> b!876749 (= lt!396676 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876749 (= lt!396674 (get!12893 (select (arr!24493 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876749 (= lt!396678 (select (arr!24494 _keys!868) from!1053))))

(assert (=> b!876749 (= lt!396680 call!38714)))

(assert (=> b!876749 (= e!488158 (+!2489 call!38714 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 _values!688) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876750 () Bool)

(declare-fun res!595529 () Bool)

(assert (=> b!876750 (=> (not res!595529) (not e!488160))))

(assert (=> b!876750 (= res!595529 (not (contains!4223 lt!396677 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108913 c!92836) b!876747))

(assert (= (and d!108913 (not c!92836)) b!876742))

(assert (= (and b!876742 c!92833) b!876749))

(assert (= (and b!876742 (not c!92833)) b!876748))

(assert (= (or b!876749 b!876748) bm!38711))

(assert (= (and d!108913 res!595530) b!876750))

(assert (= (and b!876750 res!595529) b!876739))

(assert (= (and b!876739 res!595528) b!876743))

(assert (= (and b!876739 c!92834) b!876745))

(assert (= (and b!876739 (not c!92834)) b!876746))

(assert (= (and b!876745 res!595531) b!876740))

(assert (= (and b!876746 c!92835) b!876744))

(assert (= (and b!876746 (not c!92835)) b!876741))

(declare-fun b_lambda!12203 () Bool)

(assert (=> (not b_lambda!12203) (not b!876740)))

(assert (=> b!876740 t!24358))

(declare-fun b_and!24945 () Bool)

(assert (= b_and!24943 (and (=> t!24358 result!9407) b_and!24945)))

(declare-fun b_lambda!12205 () Bool)

(assert (=> (not b_lambda!12205) (not b!876749)))

(assert (=> b!876749 t!24358))

(declare-fun b_and!24947 () Bool)

(assert (= b_and!24945 (and (=> t!24358 result!9407) b_and!24947)))

(declare-fun m!816951 () Bool)

(assert (=> d!108913 m!816951))

(assert (=> d!108913 m!816763))

(assert (=> b!876743 m!816751))

(assert (=> b!876743 m!816751))

(assert (=> b!876743 m!816753))

(declare-fun m!816953 () Bool)

(assert (=> b!876744 m!816953))

(assert (=> b!876745 m!816751))

(assert (=> b!876745 m!816751))

(declare-fun m!816955 () Bool)

(assert (=> b!876745 m!816955))

(assert (=> b!876742 m!816751))

(assert (=> b!876742 m!816751))

(assert (=> b!876742 m!816753))

(declare-fun m!816957 () Bool)

(assert (=> b!876741 m!816957))

(assert (=> b!876740 m!816751))

(assert (=> b!876740 m!816751))

(declare-fun m!816959 () Bool)

(assert (=> b!876740 m!816959))

(assert (=> b!876740 m!816779))

(declare-fun m!816961 () Bool)

(assert (=> b!876740 m!816961))

(assert (=> b!876740 m!816779))

(declare-fun m!816963 () Bool)

(assert (=> b!876740 m!816963))

(assert (=> b!876740 m!816961))

(declare-fun m!816965 () Bool)

(assert (=> b!876749 m!816965))

(assert (=> b!876749 m!816779))

(assert (=> b!876749 m!816961))

(assert (=> b!876749 m!816779))

(assert (=> b!876749 m!816963))

(assert (=> b!876749 m!816961))

(declare-fun m!816967 () Bool)

(assert (=> b!876749 m!816967))

(assert (=> b!876749 m!816965))

(declare-fun m!816969 () Bool)

(assert (=> b!876749 m!816969))

(assert (=> b!876749 m!816751))

(declare-fun m!816971 () Bool)

(assert (=> b!876749 m!816971))

(declare-fun m!816973 () Bool)

(assert (=> b!876750 m!816973))

(assert (=> bm!38711 m!816953))

(assert (=> b!876558 d!108913))

(declare-fun b!876759 () Bool)

(declare-fun e!488168 () Bool)

(declare-fun e!488169 () Bool)

(assert (=> b!876759 (= e!488168 e!488169)))

(declare-fun lt!396689 () (_ BitVec 64))

(assert (=> b!876759 (= lt!396689 (select (arr!24494 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!396687 () Unit!29930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50941 (_ BitVec 64) (_ BitVec 32)) Unit!29930)

(assert (=> b!876759 (= lt!396687 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396689 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!876759 (arrayContainsKey!0 _keys!868 lt!396689 #b00000000000000000000000000000000)))

(declare-fun lt!396688 () Unit!29930)

(assert (=> b!876759 (= lt!396688 lt!396687)))

(declare-fun res!595536 () Bool)

(declare-datatypes ((SeekEntryResult!8703 0))(
  ( (MissingZero!8703 (index!37183 (_ BitVec 32))) (Found!8703 (index!37184 (_ BitVec 32))) (Intermediate!8703 (undefined!9515 Bool) (index!37185 (_ BitVec 32)) (x!74161 (_ BitVec 32))) (Undefined!8703) (MissingVacant!8703 (index!37186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50941 (_ BitVec 32)) SeekEntryResult!8703)

(assert (=> b!876759 (= res!595536 (= (seekEntryOrOpen!0 (select (arr!24494 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8703 #b00000000000000000000000000000000)))))

(assert (=> b!876759 (=> (not res!595536) (not e!488169))))

(declare-fun bm!38714 () Bool)

(declare-fun call!38717 () Bool)

(assert (=> bm!38714 (= call!38717 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108915 () Bool)

(declare-fun res!595537 () Bool)

(declare-fun e!488170 () Bool)

(assert (=> d!108915 (=> res!595537 e!488170)))

(assert (=> d!108915 (= res!595537 (bvsge #b00000000000000000000000000000000 (size!24935 _keys!868)))))

(assert (=> d!108915 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!488170)))

(declare-fun b!876760 () Bool)

(assert (=> b!876760 (= e!488170 e!488168)))

(declare-fun c!92839 () Bool)

(assert (=> b!876760 (= c!92839 (validKeyInArray!0 (select (arr!24494 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!876761 () Bool)

(assert (=> b!876761 (= e!488169 call!38717)))

(declare-fun b!876762 () Bool)

(assert (=> b!876762 (= e!488168 call!38717)))

(assert (= (and d!108915 (not res!595537)) b!876760))

(assert (= (and b!876760 c!92839) b!876759))

(assert (= (and b!876760 (not c!92839)) b!876762))

(assert (= (and b!876759 res!595536) b!876761))

(assert (= (or b!876761 b!876762) bm!38714))

(assert (=> b!876759 m!816905))

(declare-fun m!816975 () Bool)

(assert (=> b!876759 m!816975))

(declare-fun m!816977 () Bool)

(assert (=> b!876759 m!816977))

(assert (=> b!876759 m!816905))

(declare-fun m!816979 () Bool)

(assert (=> b!876759 m!816979))

(declare-fun m!816981 () Bool)

(assert (=> bm!38714 m!816981))

(assert (=> b!876760 m!816905))

(assert (=> b!876760 m!816905))

(assert (=> b!876760 m!816909))

(assert (=> b!876554 d!108915))

(declare-fun b!876763 () Bool)

(declare-fun e!488176 () Bool)

(declare-fun e!488172 () Bool)

(assert (=> b!876763 (= e!488176 e!488172)))

(declare-fun c!92841 () Bool)

(declare-fun e!488173 () Bool)

(assert (=> b!876763 (= c!92841 e!488173)))

(declare-fun res!595538 () Bool)

(assert (=> b!876763 (=> (not res!595538) (not e!488173))))

(assert (=> b!876763 (= res!595538 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(declare-fun d!108917 () Bool)

(assert (=> d!108917 e!488176))

(declare-fun res!595540 () Bool)

(assert (=> d!108917 (=> (not res!595540) (not e!488176))))

(declare-fun lt!396693 () ListLongMap!10253)

(assert (=> d!108917 (= res!595540 (not (contains!4223 lt!396693 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488177 () ListLongMap!10253)

(assert (=> d!108917 (= lt!396693 e!488177)))

(declare-fun c!92843 () Bool)

(assert (=> d!108917 (= c!92843 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(assert (=> d!108917 (validMask!0 mask!1196)))

(assert (=> d!108917 (= (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396693)))

(declare-fun b!876764 () Bool)

(assert (=> b!876764 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(assert (=> b!876764 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24934 lt!396605)))))

(declare-fun e!488175 () Bool)

(assert (=> b!876764 (= e!488175 (= (apply!376 lt!396693 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12893 (select (arr!24493 lt!396605) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876765 () Bool)

(declare-fun e!488171 () Bool)

(assert (=> b!876765 (= e!488171 (isEmpty!668 lt!396693))))

(declare-fun b!876766 () Bool)

(declare-fun e!488174 () ListLongMap!10253)

(assert (=> b!876766 (= e!488177 e!488174)))

(declare-fun c!92840 () Bool)

(assert (=> b!876766 (= c!92840 (validKeyInArray!0 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!876767 () Bool)

(assert (=> b!876767 (= e!488173 (validKeyInArray!0 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876767 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!876768 () Bool)

(assert (=> b!876768 (= e!488171 (= lt!396693 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876769 () Bool)

(assert (=> b!876769 (= e!488172 e!488175)))

(assert (=> b!876769 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(declare-fun res!595541 () Bool)

(assert (=> b!876769 (= res!595541 (contains!4223 lt!396693 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876769 (=> (not res!595541) (not e!488175))))

(declare-fun bm!38715 () Bool)

(declare-fun call!38718 () ListLongMap!10253)

(assert (=> bm!38715 (= call!38718 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876770 () Bool)

(assert (=> b!876770 (= e!488172 e!488171)))

(declare-fun c!92842 () Bool)

(assert (=> b!876770 (= c!92842 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24935 _keys!868)))))

(declare-fun b!876771 () Bool)

(assert (=> b!876771 (= e!488177 (ListLongMap!10254 Nil!17321))))

(declare-fun b!876772 () Bool)

(assert (=> b!876772 (= e!488174 call!38718)))

(declare-fun b!876773 () Bool)

(declare-fun lt!396695 () Unit!29930)

(declare-fun lt!396691 () Unit!29930)

(assert (=> b!876773 (= lt!396695 lt!396691)))

(declare-fun lt!396696 () ListLongMap!10253)

(declare-fun lt!396694 () (_ BitVec 64))

(declare-fun lt!396690 () V!28225)

(declare-fun lt!396692 () (_ BitVec 64))

(assert (=> b!876773 (not (contains!4223 (+!2489 lt!396696 (tuple2!11483 lt!396694 lt!396690)) lt!396692))))

(assert (=> b!876773 (= lt!396691 (addStillNotContains!203 lt!396696 lt!396694 lt!396690 lt!396692))))

(assert (=> b!876773 (= lt!396692 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876773 (= lt!396690 (get!12893 (select (arr!24493 lt!396605) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876773 (= lt!396694 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!876773 (= lt!396696 call!38718)))

(assert (=> b!876773 (= e!488174 (+!2489 call!38718 (tuple2!11483 (select (arr!24494 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12893 (select (arr!24493 lt!396605) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876774 () Bool)

(declare-fun res!595539 () Bool)

(assert (=> b!876774 (=> (not res!595539) (not e!488176))))

(assert (=> b!876774 (= res!595539 (not (contains!4223 lt!396693 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108917 c!92843) b!876771))

(assert (= (and d!108917 (not c!92843)) b!876766))

(assert (= (and b!876766 c!92840) b!876773))

(assert (= (and b!876766 (not c!92840)) b!876772))

(assert (= (or b!876773 b!876772) bm!38715))

(assert (= (and d!108917 res!595540) b!876774))

(assert (= (and b!876774 res!595539) b!876763))

(assert (= (and b!876763 res!595538) b!876767))

(assert (= (and b!876763 c!92841) b!876769))

(assert (= (and b!876763 (not c!92841)) b!876770))

(assert (= (and b!876769 res!595541) b!876764))

(assert (= (and b!876770 c!92842) b!876768))

(assert (= (and b!876770 (not c!92842)) b!876765))

(declare-fun b_lambda!12207 () Bool)

(assert (=> (not b_lambda!12207) (not b!876764)))

(assert (=> b!876764 t!24358))

(declare-fun b_and!24949 () Bool)

(assert (= b_and!24947 (and (=> t!24358 result!9407) b_and!24949)))

(declare-fun b_lambda!12209 () Bool)

(assert (=> (not b_lambda!12209) (not b!876773)))

(assert (=> b!876773 t!24358))

(declare-fun b_and!24951 () Bool)

(assert (= b_and!24949 (and (=> t!24358 result!9407) b_and!24951)))

(declare-fun m!816983 () Bool)

(assert (=> d!108917 m!816983))

(assert (=> d!108917 m!816763))

(assert (=> b!876767 m!816879))

(assert (=> b!876767 m!816879))

(assert (=> b!876767 m!816881))

(declare-fun m!816985 () Bool)

(assert (=> b!876768 m!816985))

(assert (=> b!876769 m!816879))

(assert (=> b!876769 m!816879))

(declare-fun m!816987 () Bool)

(assert (=> b!876769 m!816987))

(assert (=> b!876766 m!816879))

(assert (=> b!876766 m!816879))

(assert (=> b!876766 m!816881))

(declare-fun m!816989 () Bool)

(assert (=> b!876765 m!816989))

(assert (=> b!876764 m!816879))

(assert (=> b!876764 m!816879))

(declare-fun m!816991 () Bool)

(assert (=> b!876764 m!816991))

(assert (=> b!876764 m!816779))

(declare-fun m!816993 () Bool)

(assert (=> b!876764 m!816993))

(assert (=> b!876764 m!816779))

(declare-fun m!816995 () Bool)

(assert (=> b!876764 m!816995))

(assert (=> b!876764 m!816993))

(declare-fun m!816997 () Bool)

(assert (=> b!876773 m!816997))

(assert (=> b!876773 m!816779))

(assert (=> b!876773 m!816993))

(assert (=> b!876773 m!816779))

(assert (=> b!876773 m!816995))

(assert (=> b!876773 m!816993))

(declare-fun m!816999 () Bool)

(assert (=> b!876773 m!816999))

(assert (=> b!876773 m!816997))

(declare-fun m!817001 () Bool)

(assert (=> b!876773 m!817001))

(assert (=> b!876773 m!816879))

(declare-fun m!817003 () Bool)

(assert (=> b!876773 m!817003))

(declare-fun m!817005 () Bool)

(assert (=> b!876774 m!817005))

(assert (=> bm!38715 m!816985))

(assert (=> bm!38684 d!108917))

(declare-fun d!108919 () Bool)

(assert (=> d!108919 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876557 d!108919))

(declare-fun d!108921 () Bool)

(declare-fun e!488178 () Bool)

(assert (=> d!108921 e!488178))

(declare-fun res!595542 () Bool)

(assert (=> d!108921 (=> (not res!595542) (not e!488178))))

(declare-fun lt!396699 () ListLongMap!10253)

(assert (=> d!108921 (= res!595542 (contains!4223 lt!396699 (_1!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396698 () List!17324)

(assert (=> d!108921 (= lt!396699 (ListLongMap!10254 lt!396698))))

(declare-fun lt!396700 () Unit!29930)

(declare-fun lt!396697 () Unit!29930)

(assert (=> d!108921 (= lt!396700 lt!396697)))

(assert (=> d!108921 (= (getValueByKey!419 lt!396698 (_1!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108921 (= lt!396697 (lemmaContainsTupThenGetReturnValue!233 lt!396698 (_1!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108921 (= lt!396698 (insertStrictlySorted!272 (toList!5142 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696)) (_1!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108921 (= (+!2489 (getCurrentListMapNoExtraKeys!3184 _keys!868 lt!396605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396699)))

(declare-fun b!876775 () Bool)

(declare-fun res!595543 () Bool)

(assert (=> b!876775 (=> (not res!595543) (not e!488178))))

(assert (=> b!876775 (= res!595543 (= (getValueByKey!419 (toList!5142 lt!396699) (_1!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5752 (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!876776 () Bool)

(assert (=> b!876776 (= e!488178 (contains!4225 (toList!5142 lt!396699) (tuple2!11483 (select (arr!24494 _keys!868) from!1053) (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108921 res!595542) b!876775))

(assert (= (and b!876775 res!595543) b!876776))

(declare-fun m!817007 () Bool)

(assert (=> d!108921 m!817007))

(declare-fun m!817009 () Bool)

(assert (=> d!108921 m!817009))

(declare-fun m!817011 () Bool)

(assert (=> d!108921 m!817011))

(declare-fun m!817013 () Bool)

(assert (=> d!108921 m!817013))

(declare-fun m!817015 () Bool)

(assert (=> b!876775 m!817015))

(declare-fun m!817017 () Bool)

(assert (=> b!876776 m!817017))

(assert (=> b!876552 d!108921))

(assert (=> b!876552 d!108917))

(declare-fun d!108923 () Bool)

(declare-fun c!92846 () Bool)

(assert (=> d!108923 (= c!92846 ((_ is ValueCellFull!8252) (select (arr!24493 lt!396605) from!1053)))))

(declare-fun e!488181 () V!28225)

(assert (=> d!108923 (= (get!12893 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488181)))

(declare-fun b!876781 () Bool)

(declare-fun get!12895 (ValueCell!8252 V!28225) V!28225)

(assert (=> b!876781 (= e!488181 (get!12895 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876782 () Bool)

(declare-fun get!12896 (ValueCell!8252 V!28225) V!28225)

(assert (=> b!876782 (= e!488181 (get!12896 (select (arr!24493 lt!396605) from!1053) (dynLambda!1227 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108923 c!92846) b!876781))

(assert (= (and d!108923 (not c!92846)) b!876782))

(assert (=> b!876781 m!816777))

(assert (=> b!876781 m!816779))

(declare-fun m!817019 () Bool)

(assert (=> b!876781 m!817019))

(assert (=> b!876782 m!816777))

(assert (=> b!876782 m!816779))

(declare-fun m!817021 () Bool)

(assert (=> b!876782 m!817021))

(assert (=> b!876552 d!108923))

(declare-fun d!108925 () Bool)

(assert (=> d!108925 (= (array_inv!19364 _keys!868) (bvsge (size!24935 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74544 d!108925))

(declare-fun d!108927 () Bool)

(assert (=> d!108927 (= (array_inv!19365 _values!688) (bvsge (size!24934 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74544 d!108927))

(declare-fun mapNonEmpty!27692 () Bool)

(declare-fun mapRes!27692 () Bool)

(declare-fun tp!53108 () Bool)

(declare-fun e!488187 () Bool)

(assert (=> mapNonEmpty!27692 (= mapRes!27692 (and tp!53108 e!488187))))

(declare-fun mapKey!27692 () (_ BitVec 32))

(declare-fun mapValue!27692 () ValueCell!8252)

(declare-fun mapRest!27692 () (Array (_ BitVec 32) ValueCell!8252))

(assert (=> mapNonEmpty!27692 (= mapRest!27683 (store mapRest!27692 mapKey!27692 mapValue!27692))))

(declare-fun b!876790 () Bool)

(declare-fun e!488186 () Bool)

(assert (=> b!876790 (= e!488186 tp_is_empty!17383)))

(declare-fun b!876789 () Bool)

(assert (=> b!876789 (= e!488187 tp_is_empty!17383)))

(declare-fun mapIsEmpty!27692 () Bool)

(assert (=> mapIsEmpty!27692 mapRes!27692))

(declare-fun condMapEmpty!27692 () Bool)

(declare-fun mapDefault!27692 () ValueCell!8252)

(assert (=> mapNonEmpty!27683 (= condMapEmpty!27692 (= mapRest!27683 ((as const (Array (_ BitVec 32) ValueCell!8252)) mapDefault!27692)))))

(assert (=> mapNonEmpty!27683 (= tp!53092 (and e!488186 mapRes!27692))))

(assert (= (and mapNonEmpty!27683 condMapEmpty!27692) mapIsEmpty!27692))

(assert (= (and mapNonEmpty!27683 (not condMapEmpty!27692)) mapNonEmpty!27692))

(assert (= (and mapNonEmpty!27692 ((_ is ValueCellFull!8252) mapValue!27692)) b!876789))

(assert (= (and mapNonEmpty!27683 ((_ is ValueCellFull!8252) mapDefault!27692)) b!876790))

(declare-fun m!817023 () Bool)

(assert (=> mapNonEmpty!27692 m!817023))

(declare-fun b_lambda!12211 () Bool)

(assert (= b_lambda!12199 (or (and start!74544 b_free!15139) b_lambda!12211)))

(declare-fun b_lambda!12213 () Bool)

(assert (= b_lambda!12203 (or (and start!74544 b_free!15139) b_lambda!12213)))

(declare-fun b_lambda!12215 () Bool)

(assert (= b_lambda!12201 (or (and start!74544 b_free!15139) b_lambda!12215)))

(declare-fun b_lambda!12217 () Bool)

(assert (= b_lambda!12205 (or (and start!74544 b_free!15139) b_lambda!12217)))

(declare-fun b_lambda!12219 () Bool)

(assert (= b_lambda!12207 (or (and start!74544 b_free!15139) b_lambda!12219)))

(declare-fun b_lambda!12221 () Bool)

(assert (= b_lambda!12209 (or (and start!74544 b_free!15139) b_lambda!12221)))

(declare-fun b_lambda!12223 () Bool)

(assert (= b_lambda!12197 (or (and start!74544 b_free!15139) b_lambda!12223)))

(declare-fun b_lambda!12225 () Bool)

(assert (= b_lambda!12195 (or (and start!74544 b_free!15139) b_lambda!12225)))

(check-sat (not b!876707) (not b!876686) (not b!876690) (not b_lambda!12223) (not b!876725) (not d!108913) (not b!876741) (not b!876776) (not b_lambda!12219) (not b!876743) (not bm!38700) (not b!876689) (not b_lambda!12213) (not b!876731) (not b!876767) (not b!876764) (not b!876775) (not b!876695) (not b!876696) (not b!876759) (not b_lambda!12217) (not d!108917) (not bm!38711) (not b!876769) (not b!876728) (not d!108899) (not b_lambda!12221) (not b!876738) (not b_lambda!12225) (not b!876749) (not b!876750) (not b!876732) (not b!876744) (not bm!38703) (not b_next!15139) (not b!876716) (not d!108903) (not b_lambda!12193) (not b!876765) (not d!108907) (not b!876774) (not b!876688) (not b!876730) (not b!876768) (not d!108921) (not b!876711) (not bm!38709) (not bm!38708) (not bm!38714) (not b_lambda!12211) (not b!876717) b_and!24951 (not b!876737) (not b!876733) (not b!876742) (not b!876729) (not bm!38715) (not b!876773) (not b!876760) (not mapNonEmpty!27692) (not b!876782) (not b!876781) (not b!876745) (not bm!38710) (not b!876691) (not b!876740) (not b_lambda!12215) (not d!108911) (not b!876766) (not b!876709) (not b!876687) tp_is_empty!17383)
(check-sat b_and!24951 (not b_next!15139))
