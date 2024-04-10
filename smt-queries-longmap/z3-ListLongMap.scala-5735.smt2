; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74208 () Bool)

(assert start!74208)

(declare-fun b_free!15015 () Bool)

(declare-fun b_next!15015 () Bool)

(assert (=> start!74208 (= b_free!15015 (not b_next!15015))))

(declare-fun tp!52695 () Bool)

(declare-fun b_and!24767 () Bool)

(assert (=> start!74208 (= tp!52695 b_and!24767)))

(declare-fun b!873052 () Bool)

(declare-datatypes ((V!28043 0))(
  ( (V!28044 (val!8671 Int)) )
))
(declare-fun v!557 () V!28043)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8184 0))(
  ( (ValueCellFull!8184 (v!11096 V!28043)) (EmptyCell!8184) )
))
(declare-datatypes ((array!50620 0))(
  ( (array!50621 (arr!24340 (Array (_ BitVec 32) ValueCell!8184)) (size!24780 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50620)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28043)

(declare-fun zeroValue!654 () V!28043)

(declare-datatypes ((array!50622 0))(
  ( (array!50623 (arr!24341 (Array (_ BitVec 32) (_ BitVec 64))) (size!24781 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50622)

(declare-fun e!486180 () Bool)

(declare-datatypes ((tuple2!11468 0))(
  ( (tuple2!11469 (_1!5745 (_ BitVec 64)) (_2!5745 V!28043)) )
))
(declare-datatypes ((List!17284 0))(
  ( (Nil!17281) (Cons!17280 (h!18411 tuple2!11468) (t!24321 List!17284)) )
))
(declare-datatypes ((ListLongMap!10237 0))(
  ( (ListLongMap!10238 (toList!5134 List!17284)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3101 (array!50622 array!50620 (_ BitVec 32) (_ BitVec 32) V!28043 V!28043 (_ BitVec 32) Int) ListLongMap!10237)

(assert (=> b!873052 (= e!486180 (not (= (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(declare-fun e!486183 () Bool)

(assert (=> b!873052 e!486183))

(declare-fun c!92416 () Bool)

(assert (=> b!873052 (= c!92416 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29924 0))(
  ( (Unit!29925) )
))
(declare-fun lt!395677 () Unit!29924)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!656 (array!50622 array!50620 (_ BitVec 32) (_ BitVec 32) V!28043 V!28043 (_ BitVec 32) (_ BitVec 64) V!28043 (_ BitVec 32) Int) Unit!29924)

(assert (=> b!873052 (= lt!395677 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!656 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873053 () Bool)

(declare-fun e!486184 () Bool)

(declare-fun tp_is_empty!17247 () Bool)

(assert (=> b!873053 (= e!486184 tp_is_empty!17247)))

(declare-fun b!873054 () Bool)

(declare-fun call!38512 () ListLongMap!10237)

(declare-fun call!38513 () ListLongMap!10237)

(assert (=> b!873054 (= e!486183 (= call!38512 call!38513))))

(declare-fun bm!38509 () Bool)

(assert (=> bm!38509 (= call!38512 (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38510 () Bool)

(assert (=> bm!38510 (= call!38513 (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873056 () Bool)

(declare-fun res!593333 () Bool)

(assert (=> b!873056 (=> (not res!593333) (not e!486180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873056 (= res!593333 (validMask!0 mask!1196))))

(declare-fun b!873057 () Bool)

(declare-fun res!593331 () Bool)

(assert (=> b!873057 (=> (not res!593331) (not e!486180))))

(assert (=> b!873057 (= res!593331 (and (= (select (arr!24341 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!873058 () Bool)

(declare-fun res!593334 () Bool)

(assert (=> b!873058 (=> (not res!593334) (not e!486180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50622 (_ BitVec 32)) Bool)

(assert (=> b!873058 (= res!593334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!593332 () Bool)

(assert (=> start!74208 (=> (not res!593332) (not e!486180))))

(assert (=> start!74208 (= res!593332 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24781 _keys!868))))))

(assert (=> start!74208 e!486180))

(assert (=> start!74208 tp_is_empty!17247))

(assert (=> start!74208 true))

(assert (=> start!74208 tp!52695))

(declare-fun array_inv!19206 (array!50622) Bool)

(assert (=> start!74208 (array_inv!19206 _keys!868)))

(declare-fun e!486181 () Bool)

(declare-fun array_inv!19207 (array!50620) Bool)

(assert (=> start!74208 (and (array_inv!19207 _values!688) e!486181)))

(declare-fun b!873055 () Bool)

(declare-fun res!593335 () Bool)

(assert (=> b!873055 (=> (not res!593335) (not e!486180))))

(declare-datatypes ((List!17285 0))(
  ( (Nil!17282) (Cons!17281 (h!18412 (_ BitVec 64)) (t!24322 List!17285)) )
))
(declare-fun arrayNoDuplicates!0 (array!50622 (_ BitVec 32) List!17285) Bool)

(assert (=> b!873055 (= res!593335 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17282))))

(declare-fun b!873059 () Bool)

(declare-fun mapRes!27473 () Bool)

(assert (=> b!873059 (= e!486181 (and e!486184 mapRes!27473))))

(declare-fun condMapEmpty!27473 () Bool)

(declare-fun mapDefault!27473 () ValueCell!8184)

(assert (=> b!873059 (= condMapEmpty!27473 (= (arr!24340 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8184)) mapDefault!27473)))))

(declare-fun mapIsEmpty!27473 () Bool)

(assert (=> mapIsEmpty!27473 mapRes!27473))

(declare-fun b!873060 () Bool)

(declare-fun +!2463 (ListLongMap!10237 tuple2!11468) ListLongMap!10237)

(assert (=> b!873060 (= e!486183 (= call!38512 (+!2463 call!38513 (tuple2!11469 k0!854 v!557))))))

(declare-fun b!873061 () Bool)

(declare-fun res!593336 () Bool)

(assert (=> b!873061 (=> (not res!593336) (not e!486180))))

(assert (=> b!873061 (= res!593336 (and (= (size!24780 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24781 _keys!868) (size!24780 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873062 () Bool)

(declare-fun res!593329 () Bool)

(assert (=> b!873062 (=> (not res!593329) (not e!486180))))

(assert (=> b!873062 (= res!593329 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24781 _keys!868))))))

(declare-fun mapNonEmpty!27473 () Bool)

(declare-fun tp!52696 () Bool)

(declare-fun e!486179 () Bool)

(assert (=> mapNonEmpty!27473 (= mapRes!27473 (and tp!52696 e!486179))))

(declare-fun mapKey!27473 () (_ BitVec 32))

(declare-fun mapRest!27473 () (Array (_ BitVec 32) ValueCell!8184))

(declare-fun mapValue!27473 () ValueCell!8184)

(assert (=> mapNonEmpty!27473 (= (arr!24340 _values!688) (store mapRest!27473 mapKey!27473 mapValue!27473))))

(declare-fun b!873063 () Bool)

(assert (=> b!873063 (= e!486179 tp_is_empty!17247)))

(declare-fun b!873064 () Bool)

(declare-fun res!593330 () Bool)

(assert (=> b!873064 (=> (not res!593330) (not e!486180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873064 (= res!593330 (validKeyInArray!0 k0!854))))

(assert (= (and start!74208 res!593332) b!873056))

(assert (= (and b!873056 res!593333) b!873061))

(assert (= (and b!873061 res!593336) b!873058))

(assert (= (and b!873058 res!593334) b!873055))

(assert (= (and b!873055 res!593335) b!873062))

(assert (= (and b!873062 res!593329) b!873064))

(assert (= (and b!873064 res!593330) b!873057))

(assert (= (and b!873057 res!593331) b!873052))

(assert (= (and b!873052 c!92416) b!873060))

(assert (= (and b!873052 (not c!92416)) b!873054))

(assert (= (or b!873060 b!873054) bm!38509))

(assert (= (or b!873060 b!873054) bm!38510))

(assert (= (and b!873059 condMapEmpty!27473) mapIsEmpty!27473))

(assert (= (and b!873059 (not condMapEmpty!27473)) mapNonEmpty!27473))

(get-info :version)

(assert (= (and mapNonEmpty!27473 ((_ is ValueCellFull!8184) mapValue!27473)) b!873063))

(assert (= (and b!873059 ((_ is ValueCellFull!8184) mapDefault!27473)) b!873053))

(assert (= start!74208 b!873059))

(declare-fun m!813629 () Bool)

(assert (=> b!873056 m!813629))

(declare-fun m!813631 () Bool)

(assert (=> b!873057 m!813631))

(declare-fun m!813633 () Bool)

(assert (=> b!873060 m!813633))

(declare-fun m!813635 () Bool)

(assert (=> b!873055 m!813635))

(declare-fun m!813637 () Bool)

(assert (=> bm!38510 m!813637))

(declare-fun m!813639 () Bool)

(assert (=> b!873058 m!813639))

(declare-fun m!813641 () Bool)

(assert (=> b!873052 m!813641))

(declare-fun m!813643 () Bool)

(assert (=> b!873052 m!813643))

(declare-fun m!813645 () Bool)

(assert (=> b!873052 m!813645))

(declare-fun m!813647 () Bool)

(assert (=> b!873052 m!813647))

(declare-fun m!813649 () Bool)

(assert (=> b!873064 m!813649))

(declare-fun m!813651 () Bool)

(assert (=> mapNonEmpty!27473 m!813651))

(assert (=> bm!38509 m!813641))

(declare-fun m!813653 () Bool)

(assert (=> bm!38509 m!813653))

(declare-fun m!813655 () Bool)

(assert (=> start!74208 m!813655))

(declare-fun m!813657 () Bool)

(assert (=> start!74208 m!813657))

(check-sat tp_is_empty!17247 (not b!873058) (not b!873060) (not b!873064) (not bm!38509) (not bm!38510) (not b!873052) (not start!74208) (not mapNonEmpty!27473) (not b!873055) (not b_next!15015) (not b!873056) b_and!24767)
(check-sat b_and!24767 (not b_next!15015))
(get-model)

(declare-fun b!873128 () Bool)

(declare-fun e!486223 () Bool)

(declare-fun lt!395700 () ListLongMap!10237)

(declare-fun isEmpty!660 (ListLongMap!10237) Bool)

(assert (=> b!873128 (= e!486223 (isEmpty!660 lt!395700))))

(declare-fun b!873129 () Bool)

(assert (=> b!873129 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24781 _keys!868)))))

(assert (=> b!873129 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24780 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)))))))

(declare-fun e!486222 () Bool)

(declare-fun apply!374 (ListLongMap!10237 (_ BitVec 64)) V!28043)

(declare-fun get!12816 (ValueCell!8184 V!28043) V!28043)

(declare-fun dynLambda!1202 (Int (_ BitVec 64)) V!28043)

(assert (=> b!873129 (= e!486222 (= (apply!374 lt!395700 (select (arr!24341 _keys!868) from!1053)) (get!12816 (select (arr!24340 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688))) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38519 () Bool)

(declare-fun call!38522 () ListLongMap!10237)

(assert (=> bm!38519 (= call!38522 (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!873130 () Bool)

(declare-fun e!486220 () Bool)

(assert (=> b!873130 (= e!486220 e!486222)))

(assert (=> b!873130 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24781 _keys!868)))))

(declare-fun res!593369 () Bool)

(declare-fun contains!4240 (ListLongMap!10237 (_ BitVec 64)) Bool)

(assert (=> b!873130 (= res!593369 (contains!4240 lt!395700 (select (arr!24341 _keys!868) from!1053)))))

(assert (=> b!873130 (=> (not res!593369) (not e!486222))))

(declare-fun b!873131 () Bool)

(declare-fun e!486218 () Bool)

(assert (=> b!873131 (= e!486218 e!486220)))

(declare-fun c!92428 () Bool)

(declare-fun e!486217 () Bool)

(assert (=> b!873131 (= c!92428 e!486217)))

(declare-fun res!593372 () Bool)

(assert (=> b!873131 (=> (not res!593372) (not e!486217))))

(assert (=> b!873131 (= res!593372 (bvslt from!1053 (size!24781 _keys!868)))))

(declare-fun b!873132 () Bool)

(declare-fun res!593370 () Bool)

(assert (=> b!873132 (=> (not res!593370) (not e!486218))))

(assert (=> b!873132 (= res!593370 (not (contains!4240 lt!395700 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!873133 () Bool)

(assert (=> b!873133 (= e!486217 (validKeyInArray!0 (select (arr!24341 _keys!868) from!1053)))))

(assert (=> b!873133 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun d!108491 () Bool)

(assert (=> d!108491 e!486218))

(declare-fun res!593371 () Bool)

(assert (=> d!108491 (=> (not res!593371) (not e!486218))))

(assert (=> d!108491 (= res!593371 (not (contains!4240 lt!395700 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!486221 () ListLongMap!10237)

(assert (=> d!108491 (= lt!395700 e!486221)))

(declare-fun c!92431 () Bool)

(assert (=> d!108491 (= c!92431 (bvsge from!1053 (size!24781 _keys!868)))))

(assert (=> d!108491 (validMask!0 mask!1196)))

(assert (=> d!108491 (= (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!395700)))

(declare-fun b!873134 () Bool)

(declare-fun lt!395701 () Unit!29924)

(declare-fun lt!395695 () Unit!29924)

(assert (=> b!873134 (= lt!395701 lt!395695)))

(declare-fun lt!395697 () ListLongMap!10237)

(declare-fun lt!395698 () (_ BitVec 64))

(declare-fun lt!395699 () (_ BitVec 64))

(declare-fun lt!395696 () V!28043)

(assert (=> b!873134 (not (contains!4240 (+!2463 lt!395697 (tuple2!11469 lt!395698 lt!395696)) lt!395699))))

(declare-fun addStillNotContains!199 (ListLongMap!10237 (_ BitVec 64) V!28043 (_ BitVec 64)) Unit!29924)

(assert (=> b!873134 (= lt!395695 (addStillNotContains!199 lt!395697 lt!395698 lt!395696 lt!395699))))

(assert (=> b!873134 (= lt!395699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!873134 (= lt!395696 (get!12816 (select (arr!24340 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688))) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!873134 (= lt!395698 (select (arr!24341 _keys!868) from!1053))))

(assert (=> b!873134 (= lt!395697 call!38522)))

(declare-fun e!486219 () ListLongMap!10237)

(assert (=> b!873134 (= e!486219 (+!2463 call!38522 (tuple2!11469 (select (arr!24341 _keys!868) from!1053) (get!12816 (select (arr!24340 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688))) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!873135 () Bool)

(assert (=> b!873135 (= e!486219 call!38522)))

(declare-fun b!873136 () Bool)

(assert (=> b!873136 (= e!486221 (ListLongMap!10238 Nil!17281))))

(declare-fun b!873137 () Bool)

(assert (=> b!873137 (= e!486221 e!486219)))

(declare-fun c!92429 () Bool)

(assert (=> b!873137 (= c!92429 (validKeyInArray!0 (select (arr!24341 _keys!868) from!1053)))))

(declare-fun b!873138 () Bool)

(assert (=> b!873138 (= e!486223 (= lt!395700 (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!873139 () Bool)

(assert (=> b!873139 (= e!486220 e!486223)))

(declare-fun c!92430 () Bool)

(assert (=> b!873139 (= c!92430 (bvslt from!1053 (size!24781 _keys!868)))))

(assert (= (and d!108491 c!92431) b!873136))

(assert (= (and d!108491 (not c!92431)) b!873137))

(assert (= (and b!873137 c!92429) b!873134))

(assert (= (and b!873137 (not c!92429)) b!873135))

(assert (= (or b!873134 b!873135) bm!38519))

(assert (= (and d!108491 res!593371) b!873132))

(assert (= (and b!873132 res!593370) b!873131))

(assert (= (and b!873131 res!593372) b!873133))

(assert (= (and b!873131 c!92428) b!873130))

(assert (= (and b!873131 (not c!92428)) b!873139))

(assert (= (and b!873130 res!593369) b!873129))

(assert (= (and b!873139 c!92430) b!873138))

(assert (= (and b!873139 (not c!92430)) b!873128))

(declare-fun b_lambda!12125 () Bool)

(assert (=> (not b_lambda!12125) (not b!873129)))

(declare-fun t!24325 () Bool)

(declare-fun tb!4895 () Bool)

(assert (=> (and start!74208 (= defaultEntry!696 defaultEntry!696) t!24325) tb!4895))

(declare-fun result!9403 () Bool)

(assert (=> tb!4895 (= result!9403 tp_is_empty!17247)))

(assert (=> b!873129 t!24325))

(declare-fun b_and!24771 () Bool)

(assert (= b_and!24767 (and (=> t!24325 result!9403) b_and!24771)))

(declare-fun b_lambda!12127 () Bool)

(assert (=> (not b_lambda!12127) (not b!873134)))

(assert (=> b!873134 t!24325))

(declare-fun b_and!24773 () Bool)

(assert (= b_and!24771 (and (=> t!24325 result!9403) b_and!24773)))

(declare-fun m!813689 () Bool)

(assert (=> d!108491 m!813689))

(assert (=> d!108491 m!813629))

(declare-fun m!813691 () Bool)

(assert (=> b!873134 m!813691))

(declare-fun m!813693 () Bool)

(assert (=> b!873134 m!813693))

(assert (=> b!873134 m!813693))

(declare-fun m!813695 () Bool)

(assert (=> b!873134 m!813695))

(declare-fun m!813697 () Bool)

(assert (=> b!873134 m!813697))

(declare-fun m!813699 () Bool)

(assert (=> b!873134 m!813699))

(declare-fun m!813701 () Bool)

(assert (=> b!873134 m!813701))

(declare-fun m!813703 () Bool)

(assert (=> b!873134 m!813703))

(assert (=> b!873134 m!813699))

(declare-fun m!813705 () Bool)

(assert (=> b!873134 m!813705))

(assert (=> b!873134 m!813695))

(declare-fun m!813707 () Bool)

(assert (=> bm!38519 m!813707))

(assert (=> b!873133 m!813691))

(assert (=> b!873133 m!813691))

(declare-fun m!813709 () Bool)

(assert (=> b!873133 m!813709))

(assert (=> b!873137 m!813691))

(assert (=> b!873137 m!813691))

(assert (=> b!873137 m!813709))

(declare-fun m!813711 () Bool)

(assert (=> b!873128 m!813711))

(assert (=> b!873138 m!813707))

(assert (=> b!873129 m!813691))

(assert (=> b!873129 m!813693))

(assert (=> b!873129 m!813695))

(assert (=> b!873129 m!813693))

(assert (=> b!873129 m!813695))

(assert (=> b!873129 m!813697))

(assert (=> b!873129 m!813691))

(declare-fun m!813713 () Bool)

(assert (=> b!873129 m!813713))

(assert (=> b!873130 m!813691))

(assert (=> b!873130 m!813691))

(declare-fun m!813715 () Bool)

(assert (=> b!873130 m!813715))

(declare-fun m!813717 () Bool)

(assert (=> b!873132 m!813717))

(assert (=> b!873052 d!108491))

(declare-fun b!873142 () Bool)

(declare-fun e!486230 () Bool)

(declare-fun lt!395707 () ListLongMap!10237)

(assert (=> b!873142 (= e!486230 (isEmpty!660 lt!395707))))

(declare-fun b!873143 () Bool)

(assert (=> b!873143 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24781 _keys!868)))))

(assert (=> b!873143 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24780 _values!688)))))

(declare-fun e!486229 () Bool)

(assert (=> b!873143 (= e!486229 (= (apply!374 lt!395707 (select (arr!24341 _keys!868) from!1053)) (get!12816 (select (arr!24340 _values!688) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!38523 () ListLongMap!10237)

(declare-fun bm!38520 () Bool)

(assert (=> bm!38520 (= call!38523 (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!873144 () Bool)

(declare-fun e!486227 () Bool)

(assert (=> b!873144 (= e!486227 e!486229)))

(assert (=> b!873144 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24781 _keys!868)))))

(declare-fun res!593373 () Bool)

(assert (=> b!873144 (= res!593373 (contains!4240 lt!395707 (select (arr!24341 _keys!868) from!1053)))))

(assert (=> b!873144 (=> (not res!593373) (not e!486229))))

(declare-fun b!873145 () Bool)

(declare-fun e!486225 () Bool)

(assert (=> b!873145 (= e!486225 e!486227)))

(declare-fun c!92432 () Bool)

(declare-fun e!486224 () Bool)

(assert (=> b!873145 (= c!92432 e!486224)))

(declare-fun res!593376 () Bool)

(assert (=> b!873145 (=> (not res!593376) (not e!486224))))

(assert (=> b!873145 (= res!593376 (bvslt from!1053 (size!24781 _keys!868)))))

(declare-fun b!873146 () Bool)

(declare-fun res!593374 () Bool)

(assert (=> b!873146 (=> (not res!593374) (not e!486225))))

(assert (=> b!873146 (= res!593374 (not (contains!4240 lt!395707 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!873147 () Bool)

(assert (=> b!873147 (= e!486224 (validKeyInArray!0 (select (arr!24341 _keys!868) from!1053)))))

(assert (=> b!873147 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun d!108493 () Bool)

(assert (=> d!108493 e!486225))

(declare-fun res!593375 () Bool)

(assert (=> d!108493 (=> (not res!593375) (not e!486225))))

(assert (=> d!108493 (= res!593375 (not (contains!4240 lt!395707 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!486228 () ListLongMap!10237)

(assert (=> d!108493 (= lt!395707 e!486228)))

(declare-fun c!92435 () Bool)

(assert (=> d!108493 (= c!92435 (bvsge from!1053 (size!24781 _keys!868)))))

(assert (=> d!108493 (validMask!0 mask!1196)))

(assert (=> d!108493 (= (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!395707)))

(declare-fun b!873148 () Bool)

(declare-fun lt!395708 () Unit!29924)

(declare-fun lt!395702 () Unit!29924)

(assert (=> b!873148 (= lt!395708 lt!395702)))

(declare-fun lt!395704 () ListLongMap!10237)

(declare-fun lt!395706 () (_ BitVec 64))

(declare-fun lt!395703 () V!28043)

(declare-fun lt!395705 () (_ BitVec 64))

(assert (=> b!873148 (not (contains!4240 (+!2463 lt!395704 (tuple2!11469 lt!395705 lt!395703)) lt!395706))))

(assert (=> b!873148 (= lt!395702 (addStillNotContains!199 lt!395704 lt!395705 lt!395703 lt!395706))))

(assert (=> b!873148 (= lt!395706 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!873148 (= lt!395703 (get!12816 (select (arr!24340 _values!688) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!873148 (= lt!395705 (select (arr!24341 _keys!868) from!1053))))

(assert (=> b!873148 (= lt!395704 call!38523)))

(declare-fun e!486226 () ListLongMap!10237)

(assert (=> b!873148 (= e!486226 (+!2463 call!38523 (tuple2!11469 (select (arr!24341 _keys!868) from!1053) (get!12816 (select (arr!24340 _values!688) from!1053) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!873149 () Bool)

(assert (=> b!873149 (= e!486226 call!38523)))

(declare-fun b!873150 () Bool)

(assert (=> b!873150 (= e!486228 (ListLongMap!10238 Nil!17281))))

(declare-fun b!873151 () Bool)

(assert (=> b!873151 (= e!486228 e!486226)))

(declare-fun c!92433 () Bool)

(assert (=> b!873151 (= c!92433 (validKeyInArray!0 (select (arr!24341 _keys!868) from!1053)))))

(declare-fun b!873152 () Bool)

(assert (=> b!873152 (= e!486230 (= lt!395707 (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!873153 () Bool)

(assert (=> b!873153 (= e!486227 e!486230)))

(declare-fun c!92434 () Bool)

(assert (=> b!873153 (= c!92434 (bvslt from!1053 (size!24781 _keys!868)))))

(assert (= (and d!108493 c!92435) b!873150))

(assert (= (and d!108493 (not c!92435)) b!873151))

(assert (= (and b!873151 c!92433) b!873148))

(assert (= (and b!873151 (not c!92433)) b!873149))

(assert (= (or b!873148 b!873149) bm!38520))

(assert (= (and d!108493 res!593375) b!873146))

(assert (= (and b!873146 res!593374) b!873145))

(assert (= (and b!873145 res!593376) b!873147))

(assert (= (and b!873145 c!92432) b!873144))

(assert (= (and b!873145 (not c!92432)) b!873153))

(assert (= (and b!873144 res!593373) b!873143))

(assert (= (and b!873153 c!92434) b!873152))

(assert (= (and b!873153 (not c!92434)) b!873142))

(declare-fun b_lambda!12129 () Bool)

(assert (=> (not b_lambda!12129) (not b!873143)))

(assert (=> b!873143 t!24325))

(declare-fun b_and!24775 () Bool)

(assert (= b_and!24773 (and (=> t!24325 result!9403) b_and!24775)))

(declare-fun b_lambda!12131 () Bool)

(assert (=> (not b_lambda!12131) (not b!873148)))

(assert (=> b!873148 t!24325))

(declare-fun b_and!24777 () Bool)

(assert (= b_and!24775 (and (=> t!24325 result!9403) b_and!24777)))

(declare-fun m!813719 () Bool)

(assert (=> d!108493 m!813719))

(assert (=> d!108493 m!813629))

(assert (=> b!873148 m!813691))

(declare-fun m!813721 () Bool)

(assert (=> b!873148 m!813721))

(assert (=> b!873148 m!813721))

(assert (=> b!873148 m!813695))

(declare-fun m!813723 () Bool)

(assert (=> b!873148 m!813723))

(declare-fun m!813725 () Bool)

(assert (=> b!873148 m!813725))

(declare-fun m!813727 () Bool)

(assert (=> b!873148 m!813727))

(declare-fun m!813729 () Bool)

(assert (=> b!873148 m!813729))

(assert (=> b!873148 m!813725))

(declare-fun m!813731 () Bool)

(assert (=> b!873148 m!813731))

(assert (=> b!873148 m!813695))

(declare-fun m!813733 () Bool)

(assert (=> bm!38520 m!813733))

(assert (=> b!873147 m!813691))

(assert (=> b!873147 m!813691))

(assert (=> b!873147 m!813709))

(assert (=> b!873151 m!813691))

(assert (=> b!873151 m!813691))

(assert (=> b!873151 m!813709))

(declare-fun m!813735 () Bool)

(assert (=> b!873142 m!813735))

(assert (=> b!873152 m!813733))

(assert (=> b!873143 m!813691))

(assert (=> b!873143 m!813721))

(assert (=> b!873143 m!813695))

(assert (=> b!873143 m!813721))

(assert (=> b!873143 m!813695))

(assert (=> b!873143 m!813723))

(assert (=> b!873143 m!813691))

(declare-fun m!813737 () Bool)

(assert (=> b!873143 m!813737))

(assert (=> b!873144 m!813691))

(assert (=> b!873144 m!813691))

(declare-fun m!813739 () Bool)

(assert (=> b!873144 m!813739))

(declare-fun m!813741 () Bool)

(assert (=> b!873146 m!813741))

(assert (=> b!873052 d!108493))

(declare-fun call!38529 () ListLongMap!10237)

(declare-fun e!486236 () Bool)

(declare-fun b!873160 () Bool)

(declare-fun call!38528 () ListLongMap!10237)

(assert (=> b!873160 (= e!486236 (= call!38529 (+!2463 call!38528 (tuple2!11469 k0!854 v!557))))))

(declare-fun d!108495 () Bool)

(declare-fun e!486235 () Bool)

(assert (=> d!108495 e!486235))

(declare-fun res!593379 () Bool)

(assert (=> d!108495 (=> (not res!593379) (not e!486235))))

(assert (=> d!108495 (= res!593379 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24780 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24780 _values!688))))))))

(declare-fun lt!395711 () Unit!29924)

(declare-fun choose!1428 (array!50622 array!50620 (_ BitVec 32) (_ BitVec 32) V!28043 V!28043 (_ BitVec 32) (_ BitVec 64) V!28043 (_ BitVec 32) Int) Unit!29924)

(assert (=> d!108495 (= lt!395711 (choose!1428 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108495 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(assert (=> d!108495 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!656 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!395711)))

(declare-fun bm!38525 () Bool)

(assert (=> bm!38525 (= call!38529 (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873161 () Bool)

(assert (=> b!873161 (= e!486236 (= call!38529 call!38528))))

(declare-fun b!873162 () Bool)

(assert (=> b!873162 (= e!486235 e!486236)))

(declare-fun c!92438 () Bool)

(assert (=> b!873162 (= c!92438 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun bm!38526 () Bool)

(assert (=> bm!38526 (= call!38528 (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!108495 res!593379) b!873162))

(assert (= (and b!873162 c!92438) b!873160))

(assert (= (and b!873162 (not c!92438)) b!873161))

(assert (= (or b!873160 b!873161) bm!38526))

(assert (= (or b!873160 b!873161) bm!38525))

(declare-fun m!813743 () Bool)

(assert (=> b!873160 m!813743))

(declare-fun m!813745 () Bool)

(assert (=> d!108495 m!813745))

(assert (=> bm!38525 m!813641))

(assert (=> bm!38525 m!813653))

(assert (=> bm!38526 m!813637))

(assert (=> b!873052 d!108495))

(declare-fun d!108497 () Bool)

(assert (=> d!108497 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!873064 d!108497))

(declare-fun b!873163 () Bool)

(declare-fun e!486243 () Bool)

(declare-fun lt!395717 () ListLongMap!10237)

(assert (=> b!873163 (= e!486243 (isEmpty!660 lt!395717))))

(declare-fun b!873164 () Bool)

(assert (=> b!873164 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(assert (=> b!873164 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24780 _values!688)))))

(declare-fun e!486242 () Bool)

(assert (=> b!873164 (= e!486242 (= (apply!374 lt!395717 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12816 (select (arr!24340 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!38527 () Bool)

(declare-fun call!38530 () ListLongMap!10237)

(assert (=> bm!38527 (= call!38530 (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!873165 () Bool)

(declare-fun e!486240 () Bool)

(assert (=> b!873165 (= e!486240 e!486242)))

(assert (=> b!873165 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(declare-fun res!593380 () Bool)

(assert (=> b!873165 (= res!593380 (contains!4240 lt!395717 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!873165 (=> (not res!593380) (not e!486242))))

(declare-fun b!873166 () Bool)

(declare-fun e!486238 () Bool)

(assert (=> b!873166 (= e!486238 e!486240)))

(declare-fun c!92439 () Bool)

(declare-fun e!486237 () Bool)

(assert (=> b!873166 (= c!92439 e!486237)))

(declare-fun res!593383 () Bool)

(assert (=> b!873166 (=> (not res!593383) (not e!486237))))

(assert (=> b!873166 (= res!593383 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(declare-fun b!873167 () Bool)

(declare-fun res!593381 () Bool)

(assert (=> b!873167 (=> (not res!593381) (not e!486238))))

(assert (=> b!873167 (= res!593381 (not (contains!4240 lt!395717 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!873168 () Bool)

(assert (=> b!873168 (= e!486237 (validKeyInArray!0 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!873168 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun d!108499 () Bool)

(assert (=> d!108499 e!486238))

(declare-fun res!593382 () Bool)

(assert (=> d!108499 (=> (not res!593382) (not e!486238))))

(assert (=> d!108499 (= res!593382 (not (contains!4240 lt!395717 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!486241 () ListLongMap!10237)

(assert (=> d!108499 (= lt!395717 e!486241)))

(declare-fun c!92442 () Bool)

(assert (=> d!108499 (= c!92442 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(assert (=> d!108499 (validMask!0 mask!1196)))

(assert (=> d!108499 (= (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!395717)))

(declare-fun b!873169 () Bool)

(declare-fun lt!395718 () Unit!29924)

(declare-fun lt!395712 () Unit!29924)

(assert (=> b!873169 (= lt!395718 lt!395712)))

(declare-fun lt!395715 () (_ BitVec 64))

(declare-fun lt!395714 () ListLongMap!10237)

(declare-fun lt!395716 () (_ BitVec 64))

(declare-fun lt!395713 () V!28043)

(assert (=> b!873169 (not (contains!4240 (+!2463 lt!395714 (tuple2!11469 lt!395715 lt!395713)) lt!395716))))

(assert (=> b!873169 (= lt!395712 (addStillNotContains!199 lt!395714 lt!395715 lt!395713 lt!395716))))

(assert (=> b!873169 (= lt!395716 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!873169 (= lt!395713 (get!12816 (select (arr!24340 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!873169 (= lt!395715 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!873169 (= lt!395714 call!38530)))

(declare-fun e!486239 () ListLongMap!10237)

(assert (=> b!873169 (= e!486239 (+!2463 call!38530 (tuple2!11469 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12816 (select (arr!24340 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!873170 () Bool)

(assert (=> b!873170 (= e!486239 call!38530)))

(declare-fun b!873171 () Bool)

(assert (=> b!873171 (= e!486241 (ListLongMap!10238 Nil!17281))))

(declare-fun b!873172 () Bool)

(assert (=> b!873172 (= e!486241 e!486239)))

(declare-fun c!92440 () Bool)

(assert (=> b!873172 (= c!92440 (validKeyInArray!0 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!873173 () Bool)

(assert (=> b!873173 (= e!486243 (= lt!395717 (getCurrentListMapNoExtraKeys!3101 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!873174 () Bool)

(assert (=> b!873174 (= e!486240 e!486243)))

(declare-fun c!92441 () Bool)

(assert (=> b!873174 (= c!92441 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(assert (= (and d!108499 c!92442) b!873171))

(assert (= (and d!108499 (not c!92442)) b!873172))

(assert (= (and b!873172 c!92440) b!873169))

(assert (= (and b!873172 (not c!92440)) b!873170))

(assert (= (or b!873169 b!873170) bm!38527))

(assert (= (and d!108499 res!593382) b!873167))

(assert (= (and b!873167 res!593381) b!873166))

(assert (= (and b!873166 res!593383) b!873168))

(assert (= (and b!873166 c!92439) b!873165))

(assert (= (and b!873166 (not c!92439)) b!873174))

(assert (= (and b!873165 res!593380) b!873164))

(assert (= (and b!873174 c!92441) b!873173))

(assert (= (and b!873174 (not c!92441)) b!873163))

(declare-fun b_lambda!12133 () Bool)

(assert (=> (not b_lambda!12133) (not b!873164)))

(assert (=> b!873164 t!24325))

(declare-fun b_and!24779 () Bool)

(assert (= b_and!24777 (and (=> t!24325 result!9403) b_and!24779)))

(declare-fun b_lambda!12135 () Bool)

(assert (=> (not b_lambda!12135) (not b!873169)))

(assert (=> b!873169 t!24325))

(declare-fun b_and!24781 () Bool)

(assert (= b_and!24779 (and (=> t!24325 result!9403) b_and!24781)))

(declare-fun m!813747 () Bool)

(assert (=> d!108499 m!813747))

(assert (=> d!108499 m!813629))

(declare-fun m!813749 () Bool)

(assert (=> b!873169 m!813749))

(declare-fun m!813751 () Bool)

(assert (=> b!873169 m!813751))

(assert (=> b!873169 m!813751))

(assert (=> b!873169 m!813695))

(declare-fun m!813753 () Bool)

(assert (=> b!873169 m!813753))

(declare-fun m!813755 () Bool)

(assert (=> b!873169 m!813755))

(declare-fun m!813757 () Bool)

(assert (=> b!873169 m!813757))

(declare-fun m!813759 () Bool)

(assert (=> b!873169 m!813759))

(assert (=> b!873169 m!813755))

(declare-fun m!813761 () Bool)

(assert (=> b!873169 m!813761))

(assert (=> b!873169 m!813695))

(declare-fun m!813763 () Bool)

(assert (=> bm!38527 m!813763))

(assert (=> b!873168 m!813749))

(assert (=> b!873168 m!813749))

(declare-fun m!813765 () Bool)

(assert (=> b!873168 m!813765))

(assert (=> b!873172 m!813749))

(assert (=> b!873172 m!813749))

(assert (=> b!873172 m!813765))

(declare-fun m!813767 () Bool)

(assert (=> b!873163 m!813767))

(assert (=> b!873173 m!813763))

(assert (=> b!873164 m!813749))

(assert (=> b!873164 m!813751))

(assert (=> b!873164 m!813695))

(assert (=> b!873164 m!813751))

(assert (=> b!873164 m!813695))

(assert (=> b!873164 m!813753))

(assert (=> b!873164 m!813749))

(declare-fun m!813769 () Bool)

(assert (=> b!873164 m!813769))

(assert (=> b!873165 m!813749))

(assert (=> b!873165 m!813749))

(declare-fun m!813771 () Bool)

(assert (=> b!873165 m!813771))

(declare-fun m!813773 () Bool)

(assert (=> b!873167 m!813773))

(assert (=> bm!38510 d!108499))

(declare-fun d!108501 () Bool)

(assert (=> d!108501 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!873056 d!108501))

(declare-fun d!108503 () Bool)

(declare-fun e!486246 () Bool)

(assert (=> d!108503 e!486246))

(declare-fun res!593389 () Bool)

(assert (=> d!108503 (=> (not res!593389) (not e!486246))))

(declare-fun lt!395730 () ListLongMap!10237)

(assert (=> d!108503 (= res!593389 (contains!4240 lt!395730 (_1!5745 (tuple2!11469 k0!854 v!557))))))

(declare-fun lt!395729 () List!17284)

(assert (=> d!108503 (= lt!395730 (ListLongMap!10238 lt!395729))))

(declare-fun lt!395728 () Unit!29924)

(declare-fun lt!395727 () Unit!29924)

(assert (=> d!108503 (= lt!395728 lt!395727)))

(declare-datatypes ((Option!423 0))(
  ( (Some!422 (v!11101 V!28043)) (None!421) )
))
(declare-fun getValueByKey!417 (List!17284 (_ BitVec 64)) Option!423)

(assert (=> d!108503 (= (getValueByKey!417 lt!395729 (_1!5745 (tuple2!11469 k0!854 v!557))) (Some!422 (_2!5745 (tuple2!11469 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!231 (List!17284 (_ BitVec 64) V!28043) Unit!29924)

(assert (=> d!108503 (= lt!395727 (lemmaContainsTupThenGetReturnValue!231 lt!395729 (_1!5745 (tuple2!11469 k0!854 v!557)) (_2!5745 (tuple2!11469 k0!854 v!557))))))

(declare-fun insertStrictlySorted!270 (List!17284 (_ BitVec 64) V!28043) List!17284)

(assert (=> d!108503 (= lt!395729 (insertStrictlySorted!270 (toList!5134 call!38513) (_1!5745 (tuple2!11469 k0!854 v!557)) (_2!5745 (tuple2!11469 k0!854 v!557))))))

(assert (=> d!108503 (= (+!2463 call!38513 (tuple2!11469 k0!854 v!557)) lt!395730)))

(declare-fun b!873179 () Bool)

(declare-fun res!593388 () Bool)

(assert (=> b!873179 (=> (not res!593388) (not e!486246))))

(assert (=> b!873179 (= res!593388 (= (getValueByKey!417 (toList!5134 lt!395730) (_1!5745 (tuple2!11469 k0!854 v!557))) (Some!422 (_2!5745 (tuple2!11469 k0!854 v!557)))))))

(declare-fun b!873180 () Bool)

(declare-fun contains!4241 (List!17284 tuple2!11468) Bool)

(assert (=> b!873180 (= e!486246 (contains!4241 (toList!5134 lt!395730) (tuple2!11469 k0!854 v!557)))))

(assert (= (and d!108503 res!593389) b!873179))

(assert (= (and b!873179 res!593388) b!873180))

(declare-fun m!813775 () Bool)

(assert (=> d!108503 m!813775))

(declare-fun m!813777 () Bool)

(assert (=> d!108503 m!813777))

(declare-fun m!813779 () Bool)

(assert (=> d!108503 m!813779))

(declare-fun m!813781 () Bool)

(assert (=> d!108503 m!813781))

(declare-fun m!813783 () Bool)

(assert (=> b!873179 m!813783))

(declare-fun m!813785 () Bool)

(assert (=> b!873180 m!813785))

(assert (=> b!873060 d!108503))

(declare-fun b!873189 () Bool)

(declare-fun e!486254 () Bool)

(declare-fun e!486255 () Bool)

(assert (=> b!873189 (= e!486254 e!486255)))

(declare-fun lt!395737 () (_ BitVec 64))

(assert (=> b!873189 (= lt!395737 (select (arr!24341 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!395738 () Unit!29924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50622 (_ BitVec 64) (_ BitVec 32)) Unit!29924)

(assert (=> b!873189 (= lt!395738 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!395737 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!873189 (arrayContainsKey!0 _keys!868 lt!395737 #b00000000000000000000000000000000)))

(declare-fun lt!395739 () Unit!29924)

(assert (=> b!873189 (= lt!395739 lt!395738)))

(declare-fun res!593395 () Bool)

(declare-datatypes ((SeekEntryResult!8750 0))(
  ( (MissingZero!8750 (index!37371 (_ BitVec 32))) (Found!8750 (index!37372 (_ BitVec 32))) (Intermediate!8750 (undefined!9562 Bool) (index!37373 (_ BitVec 32)) (x!73982 (_ BitVec 32))) (Undefined!8750) (MissingVacant!8750 (index!37374 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50622 (_ BitVec 32)) SeekEntryResult!8750)

(assert (=> b!873189 (= res!593395 (= (seekEntryOrOpen!0 (select (arr!24341 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8750 #b00000000000000000000000000000000)))))

(assert (=> b!873189 (=> (not res!593395) (not e!486255))))

(declare-fun b!873190 () Bool)

(declare-fun call!38533 () Bool)

(assert (=> b!873190 (= e!486255 call!38533)))

(declare-fun bm!38530 () Bool)

(assert (=> bm!38530 (= call!38533 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!873192 () Bool)

(declare-fun e!486253 () Bool)

(assert (=> b!873192 (= e!486253 e!486254)))

(declare-fun c!92445 () Bool)

(assert (=> b!873192 (= c!92445 (validKeyInArray!0 (select (arr!24341 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!873191 () Bool)

(assert (=> b!873191 (= e!486254 call!38533)))

(declare-fun d!108505 () Bool)

(declare-fun res!593394 () Bool)

(assert (=> d!108505 (=> res!593394 e!486253)))

(assert (=> d!108505 (= res!593394 (bvsge #b00000000000000000000000000000000 (size!24781 _keys!868)))))

(assert (=> d!108505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!486253)))

(assert (= (and d!108505 (not res!593394)) b!873192))

(assert (= (and b!873192 c!92445) b!873189))

(assert (= (and b!873192 (not c!92445)) b!873191))

(assert (= (and b!873189 res!593395) b!873190))

(assert (= (or b!873190 b!873191) bm!38530))

(declare-fun m!813787 () Bool)

(assert (=> b!873189 m!813787))

(declare-fun m!813789 () Bool)

(assert (=> b!873189 m!813789))

(declare-fun m!813791 () Bool)

(assert (=> b!873189 m!813791))

(assert (=> b!873189 m!813787))

(declare-fun m!813793 () Bool)

(assert (=> b!873189 m!813793))

(declare-fun m!813795 () Bool)

(assert (=> bm!38530 m!813795))

(assert (=> b!873192 m!813787))

(assert (=> b!873192 m!813787))

(declare-fun m!813797 () Bool)

(assert (=> b!873192 m!813797))

(assert (=> b!873058 d!108505))

(declare-fun d!108507 () Bool)

(assert (=> d!108507 (= (array_inv!19206 _keys!868) (bvsge (size!24781 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74208 d!108507))

(declare-fun d!108509 () Bool)

(assert (=> d!108509 (= (array_inv!19207 _values!688) (bvsge (size!24780 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74208 d!108509))

(declare-fun bm!38533 () Bool)

(declare-fun call!38536 () Bool)

(declare-fun c!92448 () Bool)

(assert (=> bm!38533 (= call!38536 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92448 (Cons!17281 (select (arr!24341 _keys!868) #b00000000000000000000000000000000) Nil!17282) Nil!17282)))))

(declare-fun b!873203 () Bool)

(declare-fun e!486264 () Bool)

(assert (=> b!873203 (= e!486264 call!38536)))

(declare-fun b!873204 () Bool)

(assert (=> b!873204 (= e!486264 call!38536)))

(declare-fun b!873205 () Bool)

(declare-fun e!486265 () Bool)

(declare-fun e!486266 () Bool)

(assert (=> b!873205 (= e!486265 e!486266)))

(declare-fun res!593404 () Bool)

(assert (=> b!873205 (=> (not res!593404) (not e!486266))))

(declare-fun e!486267 () Bool)

(assert (=> b!873205 (= res!593404 (not e!486267))))

(declare-fun res!593403 () Bool)

(assert (=> b!873205 (=> (not res!593403) (not e!486267))))

(assert (=> b!873205 (= res!593403 (validKeyInArray!0 (select (arr!24341 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!873207 () Bool)

(declare-fun contains!4242 (List!17285 (_ BitVec 64)) Bool)

(assert (=> b!873207 (= e!486267 (contains!4242 Nil!17282 (select (arr!24341 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!873206 () Bool)

(assert (=> b!873206 (= e!486266 e!486264)))

(assert (=> b!873206 (= c!92448 (validKeyInArray!0 (select (arr!24341 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108511 () Bool)

(declare-fun res!593402 () Bool)

(assert (=> d!108511 (=> res!593402 e!486265)))

(assert (=> d!108511 (= res!593402 (bvsge #b00000000000000000000000000000000 (size!24781 _keys!868)))))

(assert (=> d!108511 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17282) e!486265)))

(assert (= (and d!108511 (not res!593402)) b!873205))

(assert (= (and b!873205 res!593403) b!873207))

(assert (= (and b!873205 res!593404) b!873206))

(assert (= (and b!873206 c!92448) b!873204))

(assert (= (and b!873206 (not c!92448)) b!873203))

(assert (= (or b!873204 b!873203) bm!38533))

(assert (=> bm!38533 m!813787))

(declare-fun m!813799 () Bool)

(assert (=> bm!38533 m!813799))

(assert (=> b!873205 m!813787))

(assert (=> b!873205 m!813787))

(assert (=> b!873205 m!813797))

(assert (=> b!873207 m!813787))

(assert (=> b!873207 m!813787))

(declare-fun m!813801 () Bool)

(assert (=> b!873207 m!813801))

(assert (=> b!873206 m!813787))

(assert (=> b!873206 m!813787))

(assert (=> b!873206 m!813797))

(assert (=> b!873055 d!108511))

(declare-fun b!873208 () Bool)

(declare-fun e!486274 () Bool)

(declare-fun lt!395745 () ListLongMap!10237)

(assert (=> b!873208 (= e!486274 (isEmpty!660 lt!395745))))

(declare-fun b!873209 () Bool)

(assert (=> b!873209 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(assert (=> b!873209 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24780 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)))))))

(declare-fun e!486273 () Bool)

(assert (=> b!873209 (= e!486273 (= (apply!374 lt!395745 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12816 (select (arr!24340 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!38537 () ListLongMap!10237)

(declare-fun bm!38534 () Bool)

(assert (=> bm!38534 (= call!38537 (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!873210 () Bool)

(declare-fun e!486271 () Bool)

(assert (=> b!873210 (= e!486271 e!486273)))

(assert (=> b!873210 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(declare-fun res!593405 () Bool)

(assert (=> b!873210 (= res!593405 (contains!4240 lt!395745 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!873210 (=> (not res!593405) (not e!486273))))

(declare-fun b!873211 () Bool)

(declare-fun e!486269 () Bool)

(assert (=> b!873211 (= e!486269 e!486271)))

(declare-fun c!92449 () Bool)

(declare-fun e!486268 () Bool)

(assert (=> b!873211 (= c!92449 e!486268)))

(declare-fun res!593408 () Bool)

(assert (=> b!873211 (=> (not res!593408) (not e!486268))))

(assert (=> b!873211 (= res!593408 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(declare-fun b!873212 () Bool)

(declare-fun res!593406 () Bool)

(assert (=> b!873212 (=> (not res!593406) (not e!486269))))

(assert (=> b!873212 (= res!593406 (not (contains!4240 lt!395745 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!873213 () Bool)

(assert (=> b!873213 (= e!486268 (validKeyInArray!0 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!873213 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun d!108513 () Bool)

(assert (=> d!108513 e!486269))

(declare-fun res!593407 () Bool)

(assert (=> d!108513 (=> (not res!593407) (not e!486269))))

(assert (=> d!108513 (= res!593407 (not (contains!4240 lt!395745 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!486272 () ListLongMap!10237)

(assert (=> d!108513 (= lt!395745 e!486272)))

(declare-fun c!92452 () Bool)

(assert (=> d!108513 (= c!92452 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(assert (=> d!108513 (validMask!0 mask!1196)))

(assert (=> d!108513 (= (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!395745)))

(declare-fun b!873214 () Bool)

(declare-fun lt!395746 () Unit!29924)

(declare-fun lt!395740 () Unit!29924)

(assert (=> b!873214 (= lt!395746 lt!395740)))

(declare-fun lt!395742 () ListLongMap!10237)

(declare-fun lt!395741 () V!28043)

(declare-fun lt!395743 () (_ BitVec 64))

(declare-fun lt!395744 () (_ BitVec 64))

(assert (=> b!873214 (not (contains!4240 (+!2463 lt!395742 (tuple2!11469 lt!395743 lt!395741)) lt!395744))))

(assert (=> b!873214 (= lt!395740 (addStillNotContains!199 lt!395742 lt!395743 lt!395741 lt!395744))))

(assert (=> b!873214 (= lt!395744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!873214 (= lt!395741 (get!12816 (select (arr!24340 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!873214 (= lt!395743 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!873214 (= lt!395742 call!38537)))

(declare-fun e!486270 () ListLongMap!10237)

(assert (=> b!873214 (= e!486270 (+!2463 call!38537 (tuple2!11469 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12816 (select (arr!24340 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1202 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!873215 () Bool)

(assert (=> b!873215 (= e!486270 call!38537)))

(declare-fun b!873216 () Bool)

(assert (=> b!873216 (= e!486272 (ListLongMap!10238 Nil!17281))))

(declare-fun b!873217 () Bool)

(assert (=> b!873217 (= e!486272 e!486270)))

(declare-fun c!92450 () Bool)

(assert (=> b!873217 (= c!92450 (validKeyInArray!0 (select (arr!24341 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!873218 () Bool)

(assert (=> b!873218 (= e!486274 (= lt!395745 (getCurrentListMapNoExtraKeys!3101 _keys!868 (array!50621 (store (arr!24340 _values!688) i!612 (ValueCellFull!8184 v!557)) (size!24780 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!873219 () Bool)

(assert (=> b!873219 (= e!486271 e!486274)))

(declare-fun c!92451 () Bool)

(assert (=> b!873219 (= c!92451 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24781 _keys!868)))))

(assert (= (and d!108513 c!92452) b!873216))

(assert (= (and d!108513 (not c!92452)) b!873217))

(assert (= (and b!873217 c!92450) b!873214))

(assert (= (and b!873217 (not c!92450)) b!873215))

(assert (= (or b!873214 b!873215) bm!38534))

(assert (= (and d!108513 res!593407) b!873212))

(assert (= (and b!873212 res!593406) b!873211))

(assert (= (and b!873211 res!593408) b!873213))

(assert (= (and b!873211 c!92449) b!873210))

(assert (= (and b!873211 (not c!92449)) b!873219))

(assert (= (and b!873210 res!593405) b!873209))

(assert (= (and b!873219 c!92451) b!873218))

(assert (= (and b!873219 (not c!92451)) b!873208))

(declare-fun b_lambda!12137 () Bool)

(assert (=> (not b_lambda!12137) (not b!873209)))

(assert (=> b!873209 t!24325))

(declare-fun b_and!24783 () Bool)

(assert (= b_and!24781 (and (=> t!24325 result!9403) b_and!24783)))

(declare-fun b_lambda!12139 () Bool)

(assert (=> (not b_lambda!12139) (not b!873214)))

(assert (=> b!873214 t!24325))

(declare-fun b_and!24785 () Bool)

(assert (= b_and!24783 (and (=> t!24325 result!9403) b_and!24785)))

(declare-fun m!813803 () Bool)

(assert (=> d!108513 m!813803))

(assert (=> d!108513 m!813629))

(assert (=> b!873214 m!813749))

(declare-fun m!813805 () Bool)

(assert (=> b!873214 m!813805))

(assert (=> b!873214 m!813805))

(assert (=> b!873214 m!813695))

(declare-fun m!813807 () Bool)

(assert (=> b!873214 m!813807))

(declare-fun m!813809 () Bool)

(assert (=> b!873214 m!813809))

(declare-fun m!813811 () Bool)

(assert (=> b!873214 m!813811))

(declare-fun m!813813 () Bool)

(assert (=> b!873214 m!813813))

(assert (=> b!873214 m!813809))

(declare-fun m!813815 () Bool)

(assert (=> b!873214 m!813815))

(assert (=> b!873214 m!813695))

(declare-fun m!813817 () Bool)

(assert (=> bm!38534 m!813817))

(assert (=> b!873213 m!813749))

(assert (=> b!873213 m!813749))

(assert (=> b!873213 m!813765))

(assert (=> b!873217 m!813749))

(assert (=> b!873217 m!813749))

(assert (=> b!873217 m!813765))

(declare-fun m!813819 () Bool)

(assert (=> b!873208 m!813819))

(assert (=> b!873218 m!813817))

(assert (=> b!873209 m!813749))

(assert (=> b!873209 m!813805))

(assert (=> b!873209 m!813695))

(assert (=> b!873209 m!813805))

(assert (=> b!873209 m!813695))

(assert (=> b!873209 m!813807))

(assert (=> b!873209 m!813749))

(declare-fun m!813821 () Bool)

(assert (=> b!873209 m!813821))

(assert (=> b!873210 m!813749))

(assert (=> b!873210 m!813749))

(declare-fun m!813823 () Bool)

(assert (=> b!873210 m!813823))

(declare-fun m!813825 () Bool)

(assert (=> b!873212 m!813825))

(assert (=> bm!38509 d!108513))

(declare-fun b!873226 () Bool)

(declare-fun e!486280 () Bool)

(assert (=> b!873226 (= e!486280 tp_is_empty!17247)))

(declare-fun condMapEmpty!27479 () Bool)

(declare-fun mapDefault!27479 () ValueCell!8184)

(assert (=> mapNonEmpty!27473 (= condMapEmpty!27479 (= mapRest!27473 ((as const (Array (_ BitVec 32) ValueCell!8184)) mapDefault!27479)))))

(declare-fun e!486279 () Bool)

(declare-fun mapRes!27479 () Bool)

(assert (=> mapNonEmpty!27473 (= tp!52696 (and e!486279 mapRes!27479))))

(declare-fun mapNonEmpty!27479 () Bool)

(declare-fun tp!52705 () Bool)

(assert (=> mapNonEmpty!27479 (= mapRes!27479 (and tp!52705 e!486280))))

(declare-fun mapValue!27479 () ValueCell!8184)

(declare-fun mapKey!27479 () (_ BitVec 32))

(declare-fun mapRest!27479 () (Array (_ BitVec 32) ValueCell!8184))

(assert (=> mapNonEmpty!27479 (= mapRest!27473 (store mapRest!27479 mapKey!27479 mapValue!27479))))

(declare-fun mapIsEmpty!27479 () Bool)

(assert (=> mapIsEmpty!27479 mapRes!27479))

(declare-fun b!873227 () Bool)

(assert (=> b!873227 (= e!486279 tp_is_empty!17247)))

(assert (= (and mapNonEmpty!27473 condMapEmpty!27479) mapIsEmpty!27479))

(assert (= (and mapNonEmpty!27473 (not condMapEmpty!27479)) mapNonEmpty!27479))

(assert (= (and mapNonEmpty!27479 ((_ is ValueCellFull!8184) mapValue!27479)) b!873226))

(assert (= (and mapNonEmpty!27473 ((_ is ValueCellFull!8184) mapDefault!27479)) b!873227))

(declare-fun m!813827 () Bool)

(assert (=> mapNonEmpty!27479 m!813827))

(declare-fun b_lambda!12141 () Bool)

(assert (= b_lambda!12131 (or (and start!74208 b_free!15015) b_lambda!12141)))

(declare-fun b_lambda!12143 () Bool)

(assert (= b_lambda!12135 (or (and start!74208 b_free!15015) b_lambda!12143)))

(declare-fun b_lambda!12145 () Bool)

(assert (= b_lambda!12129 (or (and start!74208 b_free!15015) b_lambda!12145)))

(declare-fun b_lambda!12147 () Bool)

(assert (= b_lambda!12125 (or (and start!74208 b_free!15015) b_lambda!12147)))

(declare-fun b_lambda!12149 () Bool)

(assert (= b_lambda!12137 (or (and start!74208 b_free!15015) b_lambda!12149)))

(declare-fun b_lambda!12151 () Bool)

(assert (= b_lambda!12127 (or (and start!74208 b_free!15015) b_lambda!12151)))

(declare-fun b_lambda!12153 () Bool)

(assert (= b_lambda!12133 (or (and start!74208 b_free!15015) b_lambda!12153)))

(declare-fun b_lambda!12155 () Bool)

(assert (= b_lambda!12139 (or (and start!74208 b_free!15015) b_lambda!12155)))

(check-sat (not b_lambda!12145) (not b!873163) (not b!873192) (not d!108493) tp_is_empty!17247 (not b_lambda!12153) (not b!873205) (not b!873143) (not b!873169) (not b!873168) (not bm!38527) (not b!873130) (not b!873179) (not b_lambda!12141) (not b!873160) (not b!873207) (not b!873210) (not d!108503) (not bm!38526) (not b!873213) (not b!873165) (not b!873144) (not bm!38533) (not b!873218) (not b_lambda!12149) (not b!873146) (not b!873167) (not b!873173) (not b!873129) (not b_lambda!12147) (not d!108491) (not b!873147) (not b!873133) (not bm!38530) (not bm!38534) (not b!873214) (not b!873148) (not b!873128) b_and!24785 (not b!873132) (not b!873209) (not b!873152) (not b!873142) (not b!873208) (not b!873189) (not b!873164) (not bm!38525) (not d!108499) (not b!873180) (not mapNonEmpty!27479) (not b!873137) (not b_lambda!12143) (not b!873138) (not b_lambda!12155) (not b!873206) (not bm!38519) (not d!108495) (not d!108513) (not b!873151) (not b_lambda!12151) (not b!873172) (not b!873212) (not b!873217) (not b_next!15015) (not b!873134) (not bm!38520))
(check-sat b_and!24785 (not b_next!15015))
