; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74634 () Bool)

(assert start!74634)

(declare-fun b_free!15303 () Bool)

(declare-fun b_next!15303 () Bool)

(assert (=> start!74634 (= b_free!15303 (not b_next!15303))))

(declare-fun tp!53594 () Bool)

(declare-fun b_and!25209 () Bool)

(assert (=> start!74634 (= tp!53594 b_and!25209)))

(declare-fun b!879588 () Bool)

(declare-fun e!489502 () Bool)

(declare-fun tp_is_empty!17547 () Bool)

(assert (=> b!879588 (= e!489502 tp_is_empty!17547)))

(declare-fun res!597593 () Bool)

(declare-fun e!489501 () Bool)

(assert (=> start!74634 (=> (not res!597593) (not e!489501))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51222 0))(
  ( (array!51223 (arr!24636 (Array (_ BitVec 32) (_ BitVec 64))) (size!25076 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51222)

(assert (=> start!74634 (= res!597593 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25076 _keys!868))))))

(assert (=> start!74634 e!489501))

(assert (=> start!74634 tp_is_empty!17547))

(assert (=> start!74634 true))

(assert (=> start!74634 tp!53594))

(declare-fun array_inv!19414 (array!51222) Bool)

(assert (=> start!74634 (array_inv!19414 _keys!868)))

(declare-datatypes ((V!28443 0))(
  ( (V!28444 (val!8821 Int)) )
))
(declare-datatypes ((ValueCell!8334 0))(
  ( (ValueCellFull!8334 (v!11265 V!28443)) (EmptyCell!8334) )
))
(declare-datatypes ((array!51224 0))(
  ( (array!51225 (arr!24637 (Array (_ BitVec 32) ValueCell!8334)) (size!25077 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51224)

(declare-fun e!489499 () Bool)

(declare-fun array_inv!19415 (array!51224) Bool)

(assert (=> start!74634 (and (array_inv!19415 _values!688) e!489499)))

(declare-fun b!879589 () Bool)

(declare-fun res!597596 () Bool)

(assert (=> b!879589 (=> (not res!597596) (not e!489501))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!879589 (= res!597596 (and (= (select (arr!24636 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27939 () Bool)

(declare-fun mapRes!27939 () Bool)

(assert (=> mapIsEmpty!27939 mapRes!27939))

(declare-fun b!879590 () Bool)

(declare-fun res!597592 () Bool)

(assert (=> b!879590 (=> (not res!597592) (not e!489501))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51222 (_ BitVec 32)) Bool)

(assert (=> b!879590 (= res!597592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27939 () Bool)

(declare-fun tp!53593 () Bool)

(declare-fun e!489503 () Bool)

(assert (=> mapNonEmpty!27939 (= mapRes!27939 (and tp!53593 e!489503))))

(declare-fun mapValue!27939 () ValueCell!8334)

(declare-fun mapKey!27939 () (_ BitVec 32))

(declare-fun mapRest!27939 () (Array (_ BitVec 32) ValueCell!8334))

(assert (=> mapNonEmpty!27939 (= (arr!24637 _values!688) (store mapRest!27939 mapKey!27939 mapValue!27939))))

(declare-fun b!879591 () Bool)

(declare-fun res!597595 () Bool)

(assert (=> b!879591 (=> (not res!597595) (not e!489501))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!879591 (= res!597595 (and (= (size!25077 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25076 _keys!868) (size!25077 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879592 () Bool)

(declare-fun res!597594 () Bool)

(assert (=> b!879592 (=> (not res!597594) (not e!489501))))

(declare-datatypes ((List!17486 0))(
  ( (Nil!17483) (Cons!17482 (h!18613 (_ BitVec 64)) (t!24591 List!17486)) )
))
(declare-fun arrayNoDuplicates!0 (array!51222 (_ BitVec 32) List!17486) Bool)

(assert (=> b!879592 (= res!597594 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17483))))

(declare-fun b!879593 () Bool)

(declare-fun res!597600 () Bool)

(assert (=> b!879593 (=> (not res!597600) (not e!489501))))

(assert (=> b!879593 (= res!597600 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25076 _keys!868))))))

(declare-fun b!879594 () Bool)

(assert (=> b!879594 (= e!489499 (and e!489502 mapRes!27939))))

(declare-fun condMapEmpty!27939 () Bool)

(declare-fun mapDefault!27939 () ValueCell!8334)

(assert (=> b!879594 (= condMapEmpty!27939 (= (arr!24637 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8334)) mapDefault!27939)))))

(declare-fun b!879595 () Bool)

(declare-fun res!597598 () Bool)

(assert (=> b!879595 (=> (not res!597598) (not e!489501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879595 (= res!597598 (validKeyInArray!0 k0!854))))

(declare-fun b!879596 () Bool)

(assert (=> b!879596 (= e!489503 tp_is_empty!17547)))

(declare-fun b!879597 () Bool)

(declare-fun e!489498 () Bool)

(declare-fun e!489500 () Bool)

(assert (=> b!879597 (= e!489498 (not e!489500))))

(declare-fun res!597601 () Bool)

(assert (=> b!879597 (=> res!597601 e!489500)))

(assert (=> b!879597 (= res!597601 (not (validKeyInArray!0 (select (arr!24636 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11670 0))(
  ( (tuple2!11671 (_1!5846 (_ BitVec 64)) (_2!5846 V!28443)) )
))
(declare-datatypes ((List!17487 0))(
  ( (Nil!17484) (Cons!17483 (h!18614 tuple2!11670) (t!24592 List!17487)) )
))
(declare-datatypes ((ListLongMap!10439 0))(
  ( (ListLongMap!10440 (toList!5235 List!17487)) )
))
(declare-fun lt!397677 () ListLongMap!10439)

(declare-fun lt!397680 () ListLongMap!10439)

(assert (=> b!879597 (= lt!397677 lt!397680)))

(declare-fun v!557 () V!28443)

(declare-fun lt!397678 () ListLongMap!10439)

(declare-fun +!2508 (ListLongMap!10439 tuple2!11670) ListLongMap!10439)

(assert (=> b!879597 (= lt!397680 (+!2508 lt!397678 (tuple2!11671 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28443)

(declare-fun zeroValue!654 () V!28443)

(declare-fun lt!397681 () array!51224)

(declare-fun getCurrentListMapNoExtraKeys!3201 (array!51222 array!51224 (_ BitVec 32) (_ BitVec 32) V!28443 V!28443 (_ BitVec 32) Int) ListLongMap!10439)

(assert (=> b!879597 (= lt!397677 (getCurrentListMapNoExtraKeys!3201 _keys!868 lt!397681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879597 (= lt!397678 (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30038 0))(
  ( (Unit!30039) )
))
(declare-fun lt!397676 () Unit!30038)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!701 (array!51222 array!51224 (_ BitVec 32) (_ BitVec 32) V!28443 V!28443 (_ BitVec 32) (_ BitVec 64) V!28443 (_ BitVec 32) Int) Unit!30038)

(assert (=> b!879597 (= lt!397676 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!701 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879598 () Bool)

(declare-fun res!597599 () Bool)

(assert (=> b!879598 (=> (not res!597599) (not e!489501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879598 (= res!597599 (validMask!0 mask!1196))))

(declare-fun b!879599 () Bool)

(assert (=> b!879599 (= e!489501 e!489498)))

(declare-fun res!597597 () Bool)

(assert (=> b!879599 (=> (not res!597597) (not e!489498))))

(assert (=> b!879599 (= res!597597 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397679 () ListLongMap!10439)

(assert (=> b!879599 (= lt!397679 (getCurrentListMapNoExtraKeys!3201 _keys!868 lt!397681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879599 (= lt!397681 (array!51225 (store (arr!24637 _values!688) i!612 (ValueCellFull!8334 v!557)) (size!25077 _values!688)))))

(declare-fun lt!397675 () ListLongMap!10439)

(assert (=> b!879599 (= lt!397675 (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879600 () Bool)

(assert (=> b!879600 (= e!489500 (or (not (= (select (arr!24636 _keys!868) from!1053) k0!854)) (bvslt (size!25076 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun get!12947 (ValueCell!8334 V!28443) V!28443)

(declare-fun dynLambda!1226 (Int (_ BitVec 64)) V!28443)

(assert (=> b!879600 (= lt!397679 (+!2508 lt!397680 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!74634 res!597593) b!879598))

(assert (= (and b!879598 res!597599) b!879591))

(assert (= (and b!879591 res!597595) b!879590))

(assert (= (and b!879590 res!597592) b!879592))

(assert (= (and b!879592 res!597594) b!879593))

(assert (= (and b!879593 res!597600) b!879595))

(assert (= (and b!879595 res!597598) b!879589))

(assert (= (and b!879589 res!597596) b!879599))

(assert (= (and b!879599 res!597597) b!879597))

(assert (= (and b!879597 (not res!597601)) b!879600))

(assert (= (and b!879594 condMapEmpty!27939) mapIsEmpty!27939))

(assert (= (and b!879594 (not condMapEmpty!27939)) mapNonEmpty!27939))

(get-info :version)

(assert (= (and mapNonEmpty!27939 ((_ is ValueCellFull!8334) mapValue!27939)) b!879596))

(assert (= (and b!879594 ((_ is ValueCellFull!8334) mapDefault!27939)) b!879588))

(assert (= start!74634 b!879594))

(declare-fun b_lambda!12377 () Bool)

(assert (=> (not b_lambda!12377) (not b!879600)))

(declare-fun t!24590 () Bool)

(declare-fun tb!4961 () Bool)

(assert (=> (and start!74634 (= defaultEntry!696 defaultEntry!696) t!24590) tb!4961))

(declare-fun result!9545 () Bool)

(assert (=> tb!4961 (= result!9545 tp_is_empty!17547)))

(assert (=> b!879600 t!24590))

(declare-fun b_and!25211 () Bool)

(assert (= b_and!25209 (and (=> t!24590 result!9545) b_and!25211)))

(declare-fun m!819327 () Bool)

(assert (=> b!879590 m!819327))

(declare-fun m!819329 () Bool)

(assert (=> b!879600 m!819329))

(declare-fun m!819331 () Bool)

(assert (=> b!879600 m!819331))

(declare-fun m!819333 () Bool)

(assert (=> b!879600 m!819333))

(declare-fun m!819335 () Bool)

(assert (=> b!879600 m!819335))

(assert (=> b!879600 m!819331))

(declare-fun m!819337 () Bool)

(assert (=> b!879600 m!819337))

(assert (=> b!879600 m!819333))

(declare-fun m!819339 () Bool)

(assert (=> b!879598 m!819339))

(declare-fun m!819341 () Bool)

(assert (=> b!879599 m!819341))

(declare-fun m!819343 () Bool)

(assert (=> b!879599 m!819343))

(declare-fun m!819345 () Bool)

(assert (=> b!879599 m!819345))

(declare-fun m!819347 () Bool)

(assert (=> mapNonEmpty!27939 m!819347))

(declare-fun m!819349 () Bool)

(assert (=> b!879592 m!819349))

(declare-fun m!819351 () Bool)

(assert (=> b!879597 m!819351))

(declare-fun m!819353 () Bool)

(assert (=> b!879597 m!819353))

(assert (=> b!879597 m!819337))

(declare-fun m!819355 () Bool)

(assert (=> b!879597 m!819355))

(declare-fun m!819357 () Bool)

(assert (=> b!879597 m!819357))

(assert (=> b!879597 m!819337))

(declare-fun m!819359 () Bool)

(assert (=> b!879597 m!819359))

(declare-fun m!819361 () Bool)

(assert (=> b!879589 m!819361))

(declare-fun m!819363 () Bool)

(assert (=> b!879595 m!819363))

(declare-fun m!819365 () Bool)

(assert (=> start!74634 m!819365))

(declare-fun m!819367 () Bool)

(assert (=> start!74634 m!819367))

(check-sat (not b!879599) (not b_lambda!12377) b_and!25211 (not start!74634) (not b!879590) (not b!879597) (not b!879595) (not b!879598) (not b!879600) (not b!879592) (not mapNonEmpty!27939) tp_is_empty!17547 (not b_next!15303))
(check-sat b_and!25211 (not b_next!15303))
(get-model)

(declare-fun b_lambda!12381 () Bool)

(assert (= b_lambda!12377 (or (and start!74634 b_free!15303) b_lambda!12381)))

(check-sat (not b!879599) b_and!25211 (not start!74634) (not b_lambda!12381) (not b!879590) (not b!879597) (not b!879595) (not b!879598) (not b!879600) (not b!879592) (not mapNonEmpty!27939) tp_is_empty!17547 (not b_next!15303))
(check-sat b_and!25211 (not b_next!15303))
(get-model)

(declare-fun d!108929 () Bool)

(assert (=> d!108929 (= (array_inv!19414 _keys!868) (bvsge (size!25076 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74634 d!108929))

(declare-fun d!108931 () Bool)

(assert (=> d!108931 (= (array_inv!19415 _values!688) (bvsge (size!25077 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74634 d!108931))

(declare-fun b!879654 () Bool)

(declare-fun e!489534 () Bool)

(declare-fun call!38875 () Bool)

(assert (=> b!879654 (= e!489534 call!38875)))

(declare-fun b!879655 () Bool)

(declare-fun e!489536 () Bool)

(declare-fun contains!4254 (List!17486 (_ BitVec 64)) Bool)

(assert (=> b!879655 (= e!489536 (contains!4254 Nil!17483 (select (arr!24636 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879657 () Bool)

(declare-fun e!489533 () Bool)

(assert (=> b!879657 (= e!489533 e!489534)))

(declare-fun c!92825 () Bool)

(assert (=> b!879657 (= c!92825 (validKeyInArray!0 (select (arr!24636 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879658 () Bool)

(assert (=> b!879658 (= e!489534 call!38875)))

(declare-fun bm!38872 () Bool)

(assert (=> bm!38872 (= call!38875 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92825 (Cons!17482 (select (arr!24636 _keys!868) #b00000000000000000000000000000000) Nil!17483) Nil!17483)))))

(declare-fun b!879656 () Bool)

(declare-fun e!489535 () Bool)

(assert (=> b!879656 (= e!489535 e!489533)))

(declare-fun res!597639 () Bool)

(assert (=> b!879656 (=> (not res!597639) (not e!489533))))

(assert (=> b!879656 (= res!597639 (not e!489536))))

(declare-fun res!597638 () Bool)

(assert (=> b!879656 (=> (not res!597638) (not e!489536))))

(assert (=> b!879656 (= res!597638 (validKeyInArray!0 (select (arr!24636 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108933 () Bool)

(declare-fun res!597640 () Bool)

(assert (=> d!108933 (=> res!597640 e!489535)))

(assert (=> d!108933 (= res!597640 (bvsge #b00000000000000000000000000000000 (size!25076 _keys!868)))))

(assert (=> d!108933 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17483) e!489535)))

(assert (= (and d!108933 (not res!597640)) b!879656))

(assert (= (and b!879656 res!597638) b!879655))

(assert (= (and b!879656 res!597639) b!879657))

(assert (= (and b!879657 c!92825) b!879654))

(assert (= (and b!879657 (not c!92825)) b!879658))

(assert (= (or b!879654 b!879658) bm!38872))

(declare-fun m!819411 () Bool)

(assert (=> b!879655 m!819411))

(assert (=> b!879655 m!819411))

(declare-fun m!819413 () Bool)

(assert (=> b!879655 m!819413))

(assert (=> b!879657 m!819411))

(assert (=> b!879657 m!819411))

(declare-fun m!819415 () Bool)

(assert (=> b!879657 m!819415))

(assert (=> bm!38872 m!819411))

(declare-fun m!819417 () Bool)

(assert (=> bm!38872 m!819417))

(assert (=> b!879656 m!819411))

(assert (=> b!879656 m!819411))

(assert (=> b!879656 m!819415))

(assert (=> b!879592 d!108933))

(declare-fun b!879683 () Bool)

(declare-fun e!489552 () Bool)

(declare-fun lt!397720 () ListLongMap!10439)

(declare-fun isEmpty!666 (ListLongMap!10439) Bool)

(assert (=> b!879683 (= e!489552 (isEmpty!666 lt!397720))))

(declare-fun b!879684 () Bool)

(assert (=> b!879684 (= e!489552 (= lt!397720 (getCurrentListMapNoExtraKeys!3201 _keys!868 lt!397681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879685 () Bool)

(declare-fun e!489557 () Bool)

(assert (=> b!879685 (= e!489557 e!489552)))

(declare-fun c!92835 () Bool)

(assert (=> b!879685 (= c!92835 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun b!879686 () Bool)

(declare-fun e!489553 () ListLongMap!10439)

(assert (=> b!879686 (= e!489553 (ListLongMap!10440 Nil!17484))))

(declare-fun b!879687 () Bool)

(declare-fun e!489555 () Bool)

(assert (=> b!879687 (= e!489557 e!489555)))

(assert (=> b!879687 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun res!597652 () Bool)

(declare-fun contains!4255 (ListLongMap!10439 (_ BitVec 64)) Bool)

(assert (=> b!879687 (= res!597652 (contains!4255 lt!397720 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879687 (=> (not res!597652) (not e!489555))))

(declare-fun b!879688 () Bool)

(assert (=> b!879688 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> b!879688 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25077 lt!397681)))))

(declare-fun apply!379 (ListLongMap!10439 (_ BitVec 64)) V!28443)

(assert (=> b!879688 (= e!489555 (= (apply!379 lt!397720 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12947 (select (arr!24637 lt!397681) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879689 () Bool)

(declare-fun e!489551 () ListLongMap!10439)

(declare-fun call!38878 () ListLongMap!10439)

(assert (=> b!879689 (= e!489551 call!38878)))

(declare-fun b!879690 () Bool)

(declare-fun e!489556 () Bool)

(assert (=> b!879690 (= e!489556 (validKeyInArray!0 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879690 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!879691 () Bool)

(declare-fun res!597651 () Bool)

(declare-fun e!489554 () Bool)

(assert (=> b!879691 (=> (not res!597651) (not e!489554))))

(assert (=> b!879691 (= res!597651 (not (contains!4255 lt!397720 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38875 () Bool)

(assert (=> bm!38875 (= call!38878 (getCurrentListMapNoExtraKeys!3201 _keys!868 lt!397681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879692 () Bool)

(assert (=> b!879692 (= e!489554 e!489557)))

(declare-fun c!92836 () Bool)

(assert (=> b!879692 (= c!92836 e!489556)))

(declare-fun res!597650 () Bool)

(assert (=> b!879692 (=> (not res!597650) (not e!489556))))

(assert (=> b!879692 (= res!597650 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun b!879693 () Bool)

(assert (=> b!879693 (= e!489553 e!489551)))

(declare-fun c!92834 () Bool)

(assert (=> b!879693 (= c!92834 (validKeyInArray!0 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!108935 () Bool)

(assert (=> d!108935 e!489554))

(declare-fun res!597649 () Bool)

(assert (=> d!108935 (=> (not res!597649) (not e!489554))))

(assert (=> d!108935 (= res!597649 (not (contains!4255 lt!397720 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108935 (= lt!397720 e!489553)))

(declare-fun c!92837 () Bool)

(assert (=> d!108935 (= c!92837 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> d!108935 (validMask!0 mask!1196)))

(assert (=> d!108935 (= (getCurrentListMapNoExtraKeys!3201 _keys!868 lt!397681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397720)))

(declare-fun b!879694 () Bool)

(declare-fun lt!397718 () Unit!30038)

(declare-fun lt!397722 () Unit!30038)

(assert (=> b!879694 (= lt!397718 lt!397722)))

(declare-fun lt!397719 () (_ BitVec 64))

(declare-fun lt!397723 () (_ BitVec 64))

(declare-fun lt!397717 () ListLongMap!10439)

(declare-fun lt!397721 () V!28443)

(assert (=> b!879694 (not (contains!4255 (+!2508 lt!397717 (tuple2!11671 lt!397723 lt!397721)) lt!397719))))

(declare-fun addStillNotContains!204 (ListLongMap!10439 (_ BitVec 64) V!28443 (_ BitVec 64)) Unit!30038)

(assert (=> b!879694 (= lt!397722 (addStillNotContains!204 lt!397717 lt!397723 lt!397721 lt!397719))))

(assert (=> b!879694 (= lt!397719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879694 (= lt!397721 (get!12947 (select (arr!24637 lt!397681) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879694 (= lt!397723 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!879694 (= lt!397717 call!38878)))

(assert (=> b!879694 (= e!489551 (+!2508 call!38878 (tuple2!11671 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12947 (select (arr!24637 lt!397681) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108935 c!92837) b!879686))

(assert (= (and d!108935 (not c!92837)) b!879693))

(assert (= (and b!879693 c!92834) b!879694))

(assert (= (and b!879693 (not c!92834)) b!879689))

(assert (= (or b!879694 b!879689) bm!38875))

(assert (= (and d!108935 res!597649) b!879691))

(assert (= (and b!879691 res!597651) b!879692))

(assert (= (and b!879692 res!597650) b!879690))

(assert (= (and b!879692 c!92836) b!879687))

(assert (= (and b!879692 (not c!92836)) b!879685))

(assert (= (and b!879687 res!597652) b!879688))

(assert (= (and b!879685 c!92835) b!879684))

(assert (= (and b!879685 (not c!92835)) b!879683))

(declare-fun b_lambda!12383 () Bool)

(assert (=> (not b_lambda!12383) (not b!879688)))

(assert (=> b!879688 t!24590))

(declare-fun b_and!25217 () Bool)

(assert (= b_and!25211 (and (=> t!24590 result!9545) b_and!25217)))

(declare-fun b_lambda!12385 () Bool)

(assert (=> (not b_lambda!12385) (not b!879694)))

(assert (=> b!879694 t!24590))

(declare-fun b_and!25219 () Bool)

(assert (= b_and!25217 (and (=> t!24590 result!9545) b_and!25219)))

(declare-fun m!819419 () Bool)

(assert (=> b!879693 m!819419))

(assert (=> b!879693 m!819419))

(declare-fun m!819421 () Bool)

(assert (=> b!879693 m!819421))

(assert (=> b!879688 m!819419))

(declare-fun m!819423 () Bool)

(assert (=> b!879688 m!819423))

(assert (=> b!879688 m!819333))

(declare-fun m!819425 () Bool)

(assert (=> b!879688 m!819425))

(assert (=> b!879688 m!819423))

(assert (=> b!879688 m!819333))

(assert (=> b!879688 m!819419))

(declare-fun m!819427 () Bool)

(assert (=> b!879688 m!819427))

(assert (=> b!879687 m!819419))

(assert (=> b!879687 m!819419))

(declare-fun m!819429 () Bool)

(assert (=> b!879687 m!819429))

(declare-fun m!819431 () Bool)

(assert (=> b!879691 m!819431))

(declare-fun m!819433 () Bool)

(assert (=> d!108935 m!819433))

(assert (=> d!108935 m!819339))

(declare-fun m!819435 () Bool)

(assert (=> bm!38875 m!819435))

(assert (=> b!879694 m!819419))

(assert (=> b!879694 m!819423))

(assert (=> b!879694 m!819333))

(assert (=> b!879694 m!819425))

(declare-fun m!819437 () Bool)

(assert (=> b!879694 m!819437))

(declare-fun m!819439 () Bool)

(assert (=> b!879694 m!819439))

(declare-fun m!819441 () Bool)

(assert (=> b!879694 m!819441))

(assert (=> b!879694 m!819423))

(assert (=> b!879694 m!819333))

(assert (=> b!879694 m!819437))

(declare-fun m!819443 () Bool)

(assert (=> b!879694 m!819443))

(assert (=> b!879690 m!819419))

(assert (=> b!879690 m!819419))

(assert (=> b!879690 m!819421))

(assert (=> b!879684 m!819435))

(declare-fun m!819445 () Bool)

(assert (=> b!879683 m!819445))

(assert (=> b!879597 d!108935))

(declare-fun b!879695 () Bool)

(declare-fun e!489559 () Bool)

(declare-fun lt!397727 () ListLongMap!10439)

(assert (=> b!879695 (= e!489559 (isEmpty!666 lt!397727))))

(declare-fun b!879696 () Bool)

(assert (=> b!879696 (= e!489559 (= lt!397727 (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879697 () Bool)

(declare-fun e!489564 () Bool)

(assert (=> b!879697 (= e!489564 e!489559)))

(declare-fun c!92839 () Bool)

(assert (=> b!879697 (= c!92839 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun b!879698 () Bool)

(declare-fun e!489560 () ListLongMap!10439)

(assert (=> b!879698 (= e!489560 (ListLongMap!10440 Nil!17484))))

(declare-fun b!879699 () Bool)

(declare-fun e!489562 () Bool)

(assert (=> b!879699 (= e!489564 e!489562)))

(assert (=> b!879699 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun res!597656 () Bool)

(assert (=> b!879699 (= res!597656 (contains!4255 lt!397727 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879699 (=> (not res!597656) (not e!489562))))

(declare-fun b!879700 () Bool)

(assert (=> b!879700 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> b!879700 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25077 _values!688)))))

(assert (=> b!879700 (= e!489562 (= (apply!379 lt!397727 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12947 (select (arr!24637 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879701 () Bool)

(declare-fun e!489558 () ListLongMap!10439)

(declare-fun call!38879 () ListLongMap!10439)

(assert (=> b!879701 (= e!489558 call!38879)))

(declare-fun b!879702 () Bool)

(declare-fun e!489563 () Bool)

(assert (=> b!879702 (= e!489563 (validKeyInArray!0 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!879702 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!879703 () Bool)

(declare-fun res!597655 () Bool)

(declare-fun e!489561 () Bool)

(assert (=> b!879703 (=> (not res!597655) (not e!489561))))

(assert (=> b!879703 (= res!597655 (not (contains!4255 lt!397727 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38876 () Bool)

(assert (=> bm!38876 (= call!38879 (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879704 () Bool)

(assert (=> b!879704 (= e!489561 e!489564)))

(declare-fun c!92840 () Bool)

(assert (=> b!879704 (= c!92840 e!489563)))

(declare-fun res!597654 () Bool)

(assert (=> b!879704 (=> (not res!597654) (not e!489563))))

(assert (=> b!879704 (= res!597654 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(declare-fun b!879705 () Bool)

(assert (=> b!879705 (= e!489560 e!489558)))

(declare-fun c!92838 () Bool)

(assert (=> b!879705 (= c!92838 (validKeyInArray!0 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun d!108937 () Bool)

(assert (=> d!108937 e!489561))

(declare-fun res!597653 () Bool)

(assert (=> d!108937 (=> (not res!597653) (not e!489561))))

(assert (=> d!108937 (= res!597653 (not (contains!4255 lt!397727 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108937 (= lt!397727 e!489560)))

(declare-fun c!92841 () Bool)

(assert (=> d!108937 (= c!92841 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> d!108937 (validMask!0 mask!1196)))

(assert (=> d!108937 (= (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397727)))

(declare-fun b!879706 () Bool)

(declare-fun lt!397725 () Unit!30038)

(declare-fun lt!397729 () Unit!30038)

(assert (=> b!879706 (= lt!397725 lt!397729)))

(declare-fun lt!397724 () ListLongMap!10439)

(declare-fun lt!397726 () (_ BitVec 64))

(declare-fun lt!397728 () V!28443)

(declare-fun lt!397730 () (_ BitVec 64))

(assert (=> b!879706 (not (contains!4255 (+!2508 lt!397724 (tuple2!11671 lt!397730 lt!397728)) lt!397726))))

(assert (=> b!879706 (= lt!397729 (addStillNotContains!204 lt!397724 lt!397730 lt!397728 lt!397726))))

(assert (=> b!879706 (= lt!397726 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879706 (= lt!397728 (get!12947 (select (arr!24637 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879706 (= lt!397730 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!879706 (= lt!397724 call!38879)))

(assert (=> b!879706 (= e!489558 (+!2508 call!38879 (tuple2!11671 (select (arr!24636 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12947 (select (arr!24637 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108937 c!92841) b!879698))

(assert (= (and d!108937 (not c!92841)) b!879705))

(assert (= (and b!879705 c!92838) b!879706))

(assert (= (and b!879705 (not c!92838)) b!879701))

(assert (= (or b!879706 b!879701) bm!38876))

(assert (= (and d!108937 res!597653) b!879703))

(assert (= (and b!879703 res!597655) b!879704))

(assert (= (and b!879704 res!597654) b!879702))

(assert (= (and b!879704 c!92840) b!879699))

(assert (= (and b!879704 (not c!92840)) b!879697))

(assert (= (and b!879699 res!597656) b!879700))

(assert (= (and b!879697 c!92839) b!879696))

(assert (= (and b!879697 (not c!92839)) b!879695))

(declare-fun b_lambda!12387 () Bool)

(assert (=> (not b_lambda!12387) (not b!879700)))

(assert (=> b!879700 t!24590))

(declare-fun b_and!25221 () Bool)

(assert (= b_and!25219 (and (=> t!24590 result!9545) b_and!25221)))

(declare-fun b_lambda!12389 () Bool)

(assert (=> (not b_lambda!12389) (not b!879706)))

(assert (=> b!879706 t!24590))

(declare-fun b_and!25223 () Bool)

(assert (= b_and!25221 (and (=> t!24590 result!9545) b_and!25223)))

(assert (=> b!879705 m!819419))

(assert (=> b!879705 m!819419))

(assert (=> b!879705 m!819421))

(assert (=> b!879700 m!819419))

(declare-fun m!819447 () Bool)

(assert (=> b!879700 m!819447))

(assert (=> b!879700 m!819333))

(declare-fun m!819449 () Bool)

(assert (=> b!879700 m!819449))

(assert (=> b!879700 m!819447))

(assert (=> b!879700 m!819333))

(assert (=> b!879700 m!819419))

(declare-fun m!819451 () Bool)

(assert (=> b!879700 m!819451))

(assert (=> b!879699 m!819419))

(assert (=> b!879699 m!819419))

(declare-fun m!819453 () Bool)

(assert (=> b!879699 m!819453))

(declare-fun m!819455 () Bool)

(assert (=> b!879703 m!819455))

(declare-fun m!819457 () Bool)

(assert (=> d!108937 m!819457))

(assert (=> d!108937 m!819339))

(declare-fun m!819459 () Bool)

(assert (=> bm!38876 m!819459))

(assert (=> b!879706 m!819419))

(assert (=> b!879706 m!819447))

(assert (=> b!879706 m!819333))

(assert (=> b!879706 m!819449))

(declare-fun m!819461 () Bool)

(assert (=> b!879706 m!819461))

(declare-fun m!819463 () Bool)

(assert (=> b!879706 m!819463))

(declare-fun m!819465 () Bool)

(assert (=> b!879706 m!819465))

(assert (=> b!879706 m!819447))

(assert (=> b!879706 m!819333))

(assert (=> b!879706 m!819461))

(declare-fun m!819467 () Bool)

(assert (=> b!879706 m!819467))

(assert (=> b!879702 m!819419))

(assert (=> b!879702 m!819419))

(assert (=> b!879702 m!819421))

(assert (=> b!879696 m!819459))

(declare-fun m!819469 () Bool)

(assert (=> b!879695 m!819469))

(assert (=> b!879597 d!108937))

(declare-fun d!108939 () Bool)

(assert (=> d!108939 (= (validKeyInArray!0 (select (arr!24636 _keys!868) from!1053)) (and (not (= (select (arr!24636 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24636 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!879597 d!108939))

(declare-fun d!108941 () Bool)

(declare-fun e!489570 () Bool)

(assert (=> d!108941 e!489570))

(declare-fun res!597659 () Bool)

(assert (=> d!108941 (=> (not res!597659) (not e!489570))))

(assert (=> d!108941 (= res!597659 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25077 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25077 _values!688))))))))

(declare-fun lt!397733 () Unit!30038)

(declare-fun choose!1435 (array!51222 array!51224 (_ BitVec 32) (_ BitVec 32) V!28443 V!28443 (_ BitVec 32) (_ BitVec 64) V!28443 (_ BitVec 32) Int) Unit!30038)

(assert (=> d!108941 (= lt!397733 (choose!1435 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108941 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!25076 _keys!868)))))

(assert (=> d!108941 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!701 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!397733)))

(declare-fun call!38884 () ListLongMap!10439)

(declare-fun bm!38881 () Bool)

(assert (=> bm!38881 (= call!38884 (getCurrentListMapNoExtraKeys!3201 _keys!868 (array!51225 (store (arr!24637 _values!688) i!612 (ValueCellFull!8334 v!557)) (size!25077 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38885 () ListLongMap!10439)

(declare-fun bm!38882 () Bool)

(assert (=> bm!38882 (= call!38885 (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879713 () Bool)

(declare-fun e!489569 () Bool)

(assert (=> b!879713 (= e!489569 (= call!38884 (+!2508 call!38885 (tuple2!11671 k0!854 v!557))))))

(declare-fun b!879714 () Bool)

(assert (=> b!879714 (= e!489569 (= call!38884 call!38885))))

(declare-fun b!879715 () Bool)

(assert (=> b!879715 (= e!489570 e!489569)))

(declare-fun c!92844 () Bool)

(assert (=> b!879715 (= c!92844 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (= (and d!108941 res!597659) b!879715))

(assert (= (and b!879715 c!92844) b!879713))

(assert (= (and b!879715 (not c!92844)) b!879714))

(assert (= (or b!879713 b!879714) bm!38882))

(assert (= (or b!879713 b!879714) bm!38881))

(declare-fun m!819471 () Bool)

(assert (=> d!108941 m!819471))

(assert (=> bm!38881 m!819343))

(declare-fun m!819473 () Bool)

(assert (=> bm!38881 m!819473))

(assert (=> bm!38882 m!819353))

(declare-fun m!819475 () Bool)

(assert (=> b!879713 m!819475))

(assert (=> b!879597 d!108941))

(declare-fun d!108943 () Bool)

(declare-fun e!489573 () Bool)

(assert (=> d!108943 e!489573))

(declare-fun res!597665 () Bool)

(assert (=> d!108943 (=> (not res!597665) (not e!489573))))

(declare-fun lt!397742 () ListLongMap!10439)

(assert (=> d!108943 (= res!597665 (contains!4255 lt!397742 (_1!5846 (tuple2!11671 k0!854 v!557))))))

(declare-fun lt!397744 () List!17487)

(assert (=> d!108943 (= lt!397742 (ListLongMap!10440 lt!397744))))

(declare-fun lt!397743 () Unit!30038)

(declare-fun lt!397745 () Unit!30038)

(assert (=> d!108943 (= lt!397743 lt!397745)))

(declare-datatypes ((Option!427 0))(
  ( (Some!426 (v!11270 V!28443)) (None!425) )
))
(declare-fun getValueByKey!421 (List!17487 (_ BitVec 64)) Option!427)

(assert (=> d!108943 (= (getValueByKey!421 lt!397744 (_1!5846 (tuple2!11671 k0!854 v!557))) (Some!426 (_2!5846 (tuple2!11671 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!235 (List!17487 (_ BitVec 64) V!28443) Unit!30038)

(assert (=> d!108943 (= lt!397745 (lemmaContainsTupThenGetReturnValue!235 lt!397744 (_1!5846 (tuple2!11671 k0!854 v!557)) (_2!5846 (tuple2!11671 k0!854 v!557))))))

(declare-fun insertStrictlySorted!274 (List!17487 (_ BitVec 64) V!28443) List!17487)

(assert (=> d!108943 (= lt!397744 (insertStrictlySorted!274 (toList!5235 lt!397678) (_1!5846 (tuple2!11671 k0!854 v!557)) (_2!5846 (tuple2!11671 k0!854 v!557))))))

(assert (=> d!108943 (= (+!2508 lt!397678 (tuple2!11671 k0!854 v!557)) lt!397742)))

(declare-fun b!879720 () Bool)

(declare-fun res!597664 () Bool)

(assert (=> b!879720 (=> (not res!597664) (not e!489573))))

(assert (=> b!879720 (= res!597664 (= (getValueByKey!421 (toList!5235 lt!397742) (_1!5846 (tuple2!11671 k0!854 v!557))) (Some!426 (_2!5846 (tuple2!11671 k0!854 v!557)))))))

(declare-fun b!879721 () Bool)

(declare-fun contains!4256 (List!17487 tuple2!11670) Bool)

(assert (=> b!879721 (= e!489573 (contains!4256 (toList!5235 lt!397742) (tuple2!11671 k0!854 v!557)))))

(assert (= (and d!108943 res!597665) b!879720))

(assert (= (and b!879720 res!597664) b!879721))

(declare-fun m!819477 () Bool)

(assert (=> d!108943 m!819477))

(declare-fun m!819479 () Bool)

(assert (=> d!108943 m!819479))

(declare-fun m!819481 () Bool)

(assert (=> d!108943 m!819481))

(declare-fun m!819483 () Bool)

(assert (=> d!108943 m!819483))

(declare-fun m!819485 () Bool)

(assert (=> b!879720 m!819485))

(declare-fun m!819487 () Bool)

(assert (=> b!879721 m!819487))

(assert (=> b!879597 d!108943))

(declare-fun b!879722 () Bool)

(declare-fun e!489575 () Bool)

(declare-fun lt!397749 () ListLongMap!10439)

(assert (=> b!879722 (= e!489575 (isEmpty!666 lt!397749))))

(declare-fun b!879723 () Bool)

(assert (=> b!879723 (= e!489575 (= lt!397749 (getCurrentListMapNoExtraKeys!3201 _keys!868 lt!397681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879724 () Bool)

(declare-fun e!489580 () Bool)

(assert (=> b!879724 (= e!489580 e!489575)))

(declare-fun c!92846 () Bool)

(assert (=> b!879724 (= c!92846 (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun b!879725 () Bool)

(declare-fun e!489576 () ListLongMap!10439)

(assert (=> b!879725 (= e!489576 (ListLongMap!10440 Nil!17484))))

(declare-fun b!879726 () Bool)

(declare-fun e!489578 () Bool)

(assert (=> b!879726 (= e!489580 e!489578)))

(assert (=> b!879726 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun res!597669 () Bool)

(assert (=> b!879726 (= res!597669 (contains!4255 lt!397749 (select (arr!24636 _keys!868) from!1053)))))

(assert (=> b!879726 (=> (not res!597669) (not e!489578))))

(declare-fun b!879727 () Bool)

(assert (=> b!879727 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25076 _keys!868)))))

(assert (=> b!879727 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25077 lt!397681)))))

(assert (=> b!879727 (= e!489578 (= (apply!379 lt!397749 (select (arr!24636 _keys!868) from!1053)) (get!12947 (select (arr!24637 lt!397681) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879728 () Bool)

(declare-fun e!489574 () ListLongMap!10439)

(declare-fun call!38886 () ListLongMap!10439)

(assert (=> b!879728 (= e!489574 call!38886)))

(declare-fun b!879729 () Bool)

(declare-fun e!489579 () Bool)

(assert (=> b!879729 (= e!489579 (validKeyInArray!0 (select (arr!24636 _keys!868) from!1053)))))

(assert (=> b!879729 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!879730 () Bool)

(declare-fun res!597668 () Bool)

(declare-fun e!489577 () Bool)

(assert (=> b!879730 (=> (not res!597668) (not e!489577))))

(assert (=> b!879730 (= res!597668 (not (contains!4255 lt!397749 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38883 () Bool)

(assert (=> bm!38883 (= call!38886 (getCurrentListMapNoExtraKeys!3201 _keys!868 lt!397681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879731 () Bool)

(assert (=> b!879731 (= e!489577 e!489580)))

(declare-fun c!92847 () Bool)

(assert (=> b!879731 (= c!92847 e!489579)))

(declare-fun res!597667 () Bool)

(assert (=> b!879731 (=> (not res!597667) (not e!489579))))

(assert (=> b!879731 (= res!597667 (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun b!879732 () Bool)

(assert (=> b!879732 (= e!489576 e!489574)))

(declare-fun c!92845 () Bool)

(assert (=> b!879732 (= c!92845 (validKeyInArray!0 (select (arr!24636 _keys!868) from!1053)))))

(declare-fun d!108945 () Bool)

(assert (=> d!108945 e!489577))

(declare-fun res!597666 () Bool)

(assert (=> d!108945 (=> (not res!597666) (not e!489577))))

(assert (=> d!108945 (= res!597666 (not (contains!4255 lt!397749 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108945 (= lt!397749 e!489576)))

(declare-fun c!92848 () Bool)

(assert (=> d!108945 (= c!92848 (bvsge from!1053 (size!25076 _keys!868)))))

(assert (=> d!108945 (validMask!0 mask!1196)))

(assert (=> d!108945 (= (getCurrentListMapNoExtraKeys!3201 _keys!868 lt!397681 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397749)))

(declare-fun b!879733 () Bool)

(declare-fun lt!397747 () Unit!30038)

(declare-fun lt!397751 () Unit!30038)

(assert (=> b!879733 (= lt!397747 lt!397751)))

(declare-fun lt!397746 () ListLongMap!10439)

(declare-fun lt!397752 () (_ BitVec 64))

(declare-fun lt!397750 () V!28443)

(declare-fun lt!397748 () (_ BitVec 64))

(assert (=> b!879733 (not (contains!4255 (+!2508 lt!397746 (tuple2!11671 lt!397752 lt!397750)) lt!397748))))

(assert (=> b!879733 (= lt!397751 (addStillNotContains!204 lt!397746 lt!397752 lt!397750 lt!397748))))

(assert (=> b!879733 (= lt!397748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879733 (= lt!397750 (get!12947 (select (arr!24637 lt!397681) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879733 (= lt!397752 (select (arr!24636 _keys!868) from!1053))))

(assert (=> b!879733 (= lt!397746 call!38886)))

(assert (=> b!879733 (= e!489574 (+!2508 call!38886 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 lt!397681) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108945 c!92848) b!879725))

(assert (= (and d!108945 (not c!92848)) b!879732))

(assert (= (and b!879732 c!92845) b!879733))

(assert (= (and b!879732 (not c!92845)) b!879728))

(assert (= (or b!879733 b!879728) bm!38883))

(assert (= (and d!108945 res!597666) b!879730))

(assert (= (and b!879730 res!597668) b!879731))

(assert (= (and b!879731 res!597667) b!879729))

(assert (= (and b!879731 c!92847) b!879726))

(assert (= (and b!879731 (not c!92847)) b!879724))

(assert (= (and b!879726 res!597669) b!879727))

(assert (= (and b!879724 c!92846) b!879723))

(assert (= (and b!879724 (not c!92846)) b!879722))

(declare-fun b_lambda!12391 () Bool)

(assert (=> (not b_lambda!12391) (not b!879727)))

(assert (=> b!879727 t!24590))

(declare-fun b_and!25225 () Bool)

(assert (= b_and!25223 (and (=> t!24590 result!9545) b_and!25225)))

(declare-fun b_lambda!12393 () Bool)

(assert (=> (not b_lambda!12393) (not b!879733)))

(assert (=> b!879733 t!24590))

(declare-fun b_and!25227 () Bool)

(assert (= b_and!25225 (and (=> t!24590 result!9545) b_and!25227)))

(assert (=> b!879732 m!819337))

(assert (=> b!879732 m!819337))

(assert (=> b!879732 m!819355))

(assert (=> b!879727 m!819337))

(declare-fun m!819489 () Bool)

(assert (=> b!879727 m!819489))

(assert (=> b!879727 m!819333))

(declare-fun m!819491 () Bool)

(assert (=> b!879727 m!819491))

(assert (=> b!879727 m!819489))

(assert (=> b!879727 m!819333))

(assert (=> b!879727 m!819337))

(declare-fun m!819493 () Bool)

(assert (=> b!879727 m!819493))

(assert (=> b!879726 m!819337))

(assert (=> b!879726 m!819337))

(declare-fun m!819495 () Bool)

(assert (=> b!879726 m!819495))

(declare-fun m!819497 () Bool)

(assert (=> b!879730 m!819497))

(declare-fun m!819499 () Bool)

(assert (=> d!108945 m!819499))

(assert (=> d!108945 m!819339))

(declare-fun m!819501 () Bool)

(assert (=> bm!38883 m!819501))

(assert (=> b!879733 m!819337))

(assert (=> b!879733 m!819489))

(assert (=> b!879733 m!819333))

(assert (=> b!879733 m!819491))

(declare-fun m!819503 () Bool)

(assert (=> b!879733 m!819503))

(declare-fun m!819505 () Bool)

(assert (=> b!879733 m!819505))

(declare-fun m!819507 () Bool)

(assert (=> b!879733 m!819507))

(assert (=> b!879733 m!819489))

(assert (=> b!879733 m!819333))

(assert (=> b!879733 m!819503))

(declare-fun m!819509 () Bool)

(assert (=> b!879733 m!819509))

(assert (=> b!879729 m!819337))

(assert (=> b!879729 m!819337))

(assert (=> b!879729 m!819355))

(assert (=> b!879723 m!819501))

(declare-fun m!819511 () Bool)

(assert (=> b!879722 m!819511))

(assert (=> b!879599 d!108945))

(declare-fun b!879734 () Bool)

(declare-fun e!489582 () Bool)

(declare-fun lt!397756 () ListLongMap!10439)

(assert (=> b!879734 (= e!489582 (isEmpty!666 lt!397756))))

(declare-fun b!879735 () Bool)

(assert (=> b!879735 (= e!489582 (= lt!397756 (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!879736 () Bool)

(declare-fun e!489587 () Bool)

(assert (=> b!879736 (= e!489587 e!489582)))

(declare-fun c!92850 () Bool)

(assert (=> b!879736 (= c!92850 (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun b!879737 () Bool)

(declare-fun e!489583 () ListLongMap!10439)

(assert (=> b!879737 (= e!489583 (ListLongMap!10440 Nil!17484))))

(declare-fun b!879738 () Bool)

(declare-fun e!489585 () Bool)

(assert (=> b!879738 (= e!489587 e!489585)))

(assert (=> b!879738 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun res!597673 () Bool)

(assert (=> b!879738 (= res!597673 (contains!4255 lt!397756 (select (arr!24636 _keys!868) from!1053)))))

(assert (=> b!879738 (=> (not res!597673) (not e!489585))))

(declare-fun b!879739 () Bool)

(assert (=> b!879739 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25076 _keys!868)))))

(assert (=> b!879739 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!25077 _values!688)))))

(assert (=> b!879739 (= e!489585 (= (apply!379 lt!397756 (select (arr!24636 _keys!868) from!1053)) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!879740 () Bool)

(declare-fun e!489581 () ListLongMap!10439)

(declare-fun call!38887 () ListLongMap!10439)

(assert (=> b!879740 (= e!489581 call!38887)))

(declare-fun b!879741 () Bool)

(declare-fun e!489586 () Bool)

(assert (=> b!879741 (= e!489586 (validKeyInArray!0 (select (arr!24636 _keys!868) from!1053)))))

(assert (=> b!879741 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!879742 () Bool)

(declare-fun res!597672 () Bool)

(declare-fun e!489584 () Bool)

(assert (=> b!879742 (=> (not res!597672) (not e!489584))))

(assert (=> b!879742 (= res!597672 (not (contains!4255 lt!397756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!38884 () Bool)

(assert (=> bm!38884 (= call!38887 (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!879743 () Bool)

(assert (=> b!879743 (= e!489584 e!489587)))

(declare-fun c!92851 () Bool)

(assert (=> b!879743 (= c!92851 e!489586)))

(declare-fun res!597671 () Bool)

(assert (=> b!879743 (=> (not res!597671) (not e!489586))))

(assert (=> b!879743 (= res!597671 (bvslt from!1053 (size!25076 _keys!868)))))

(declare-fun b!879744 () Bool)

(assert (=> b!879744 (= e!489583 e!489581)))

(declare-fun c!92849 () Bool)

(assert (=> b!879744 (= c!92849 (validKeyInArray!0 (select (arr!24636 _keys!868) from!1053)))))

(declare-fun d!108947 () Bool)

(assert (=> d!108947 e!489584))

(declare-fun res!597670 () Bool)

(assert (=> d!108947 (=> (not res!597670) (not e!489584))))

(assert (=> d!108947 (= res!597670 (not (contains!4255 lt!397756 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108947 (= lt!397756 e!489583)))

(declare-fun c!92852 () Bool)

(assert (=> d!108947 (= c!92852 (bvsge from!1053 (size!25076 _keys!868)))))

(assert (=> d!108947 (validMask!0 mask!1196)))

(assert (=> d!108947 (= (getCurrentListMapNoExtraKeys!3201 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!397756)))

(declare-fun b!879745 () Bool)

(declare-fun lt!397754 () Unit!30038)

(declare-fun lt!397758 () Unit!30038)

(assert (=> b!879745 (= lt!397754 lt!397758)))

(declare-fun lt!397759 () (_ BitVec 64))

(declare-fun lt!397757 () V!28443)

(declare-fun lt!397755 () (_ BitVec 64))

(declare-fun lt!397753 () ListLongMap!10439)

(assert (=> b!879745 (not (contains!4255 (+!2508 lt!397753 (tuple2!11671 lt!397759 lt!397757)) lt!397755))))

(assert (=> b!879745 (= lt!397758 (addStillNotContains!204 lt!397753 lt!397759 lt!397757 lt!397755))))

(assert (=> b!879745 (= lt!397755 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!879745 (= lt!397757 (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!879745 (= lt!397759 (select (arr!24636 _keys!868) from!1053))))

(assert (=> b!879745 (= lt!397753 call!38887)))

(assert (=> b!879745 (= e!489581 (+!2508 call!38887 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108947 c!92852) b!879737))

(assert (= (and d!108947 (not c!92852)) b!879744))

(assert (= (and b!879744 c!92849) b!879745))

(assert (= (and b!879744 (not c!92849)) b!879740))

(assert (= (or b!879745 b!879740) bm!38884))

(assert (= (and d!108947 res!597670) b!879742))

(assert (= (and b!879742 res!597672) b!879743))

(assert (= (and b!879743 res!597671) b!879741))

(assert (= (and b!879743 c!92851) b!879738))

(assert (= (and b!879743 (not c!92851)) b!879736))

(assert (= (and b!879738 res!597673) b!879739))

(assert (= (and b!879736 c!92850) b!879735))

(assert (= (and b!879736 (not c!92850)) b!879734))

(declare-fun b_lambda!12395 () Bool)

(assert (=> (not b_lambda!12395) (not b!879739)))

(assert (=> b!879739 t!24590))

(declare-fun b_and!25229 () Bool)

(assert (= b_and!25227 (and (=> t!24590 result!9545) b_and!25229)))

(declare-fun b_lambda!12397 () Bool)

(assert (=> (not b_lambda!12397) (not b!879745)))

(assert (=> b!879745 t!24590))

(declare-fun b_and!25231 () Bool)

(assert (= b_and!25229 (and (=> t!24590 result!9545) b_and!25231)))

(assert (=> b!879744 m!819337))

(assert (=> b!879744 m!819337))

(assert (=> b!879744 m!819355))

(assert (=> b!879739 m!819337))

(assert (=> b!879739 m!819331))

(assert (=> b!879739 m!819333))

(assert (=> b!879739 m!819335))

(assert (=> b!879739 m!819331))

(assert (=> b!879739 m!819333))

(assert (=> b!879739 m!819337))

(declare-fun m!819513 () Bool)

(assert (=> b!879739 m!819513))

(assert (=> b!879738 m!819337))

(assert (=> b!879738 m!819337))

(declare-fun m!819515 () Bool)

(assert (=> b!879738 m!819515))

(declare-fun m!819517 () Bool)

(assert (=> b!879742 m!819517))

(declare-fun m!819519 () Bool)

(assert (=> d!108947 m!819519))

(assert (=> d!108947 m!819339))

(declare-fun m!819521 () Bool)

(assert (=> bm!38884 m!819521))

(assert (=> b!879745 m!819337))

(assert (=> b!879745 m!819331))

(assert (=> b!879745 m!819333))

(assert (=> b!879745 m!819335))

(declare-fun m!819523 () Bool)

(assert (=> b!879745 m!819523))

(declare-fun m!819525 () Bool)

(assert (=> b!879745 m!819525))

(declare-fun m!819527 () Bool)

(assert (=> b!879745 m!819527))

(assert (=> b!879745 m!819331))

(assert (=> b!879745 m!819333))

(assert (=> b!879745 m!819523))

(declare-fun m!819529 () Bool)

(assert (=> b!879745 m!819529))

(assert (=> b!879741 m!819337))

(assert (=> b!879741 m!819337))

(assert (=> b!879741 m!819355))

(assert (=> b!879735 m!819521))

(declare-fun m!819531 () Bool)

(assert (=> b!879734 m!819531))

(assert (=> b!879599 d!108947))

(declare-fun d!108949 () Bool)

(assert (=> d!108949 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!879598 d!108949))

(declare-fun d!108951 () Bool)

(declare-fun e!489588 () Bool)

(assert (=> d!108951 e!489588))

(declare-fun res!597675 () Bool)

(assert (=> d!108951 (=> (not res!597675) (not e!489588))))

(declare-fun lt!397760 () ListLongMap!10439)

(assert (=> d!108951 (= res!597675 (contains!4255 lt!397760 (_1!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!397762 () List!17487)

(assert (=> d!108951 (= lt!397760 (ListLongMap!10440 lt!397762))))

(declare-fun lt!397761 () Unit!30038)

(declare-fun lt!397763 () Unit!30038)

(assert (=> d!108951 (= lt!397761 lt!397763)))

(assert (=> d!108951 (= (getValueByKey!421 lt!397762 (_1!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!426 (_2!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108951 (= lt!397763 (lemmaContainsTupThenGetReturnValue!235 lt!397762 (_1!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108951 (= lt!397762 (insertStrictlySorted!274 (toList!5235 lt!397680) (_1!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108951 (= (+!2508 lt!397680 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!397760)))

(declare-fun b!879746 () Bool)

(declare-fun res!597674 () Bool)

(assert (=> b!879746 (=> (not res!597674) (not e!489588))))

(assert (=> b!879746 (= res!597674 (= (getValueByKey!421 (toList!5235 lt!397760) (_1!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!426 (_2!5846 (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!879747 () Bool)

(assert (=> b!879747 (= e!489588 (contains!4256 (toList!5235 lt!397760) (tuple2!11671 (select (arr!24636 _keys!868) from!1053) (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108951 res!597675) b!879746))

(assert (= (and b!879746 res!597674) b!879747))

(declare-fun m!819533 () Bool)

(assert (=> d!108951 m!819533))

(declare-fun m!819535 () Bool)

(assert (=> d!108951 m!819535))

(declare-fun m!819537 () Bool)

(assert (=> d!108951 m!819537))

(declare-fun m!819539 () Bool)

(assert (=> d!108951 m!819539))

(declare-fun m!819541 () Bool)

(assert (=> b!879746 m!819541))

(declare-fun m!819543 () Bool)

(assert (=> b!879747 m!819543))

(assert (=> b!879600 d!108951))

(declare-fun d!108953 () Bool)

(declare-fun c!92855 () Bool)

(assert (=> d!108953 (= c!92855 ((_ is ValueCellFull!8334) (select (arr!24637 _values!688) from!1053)))))

(declare-fun e!489591 () V!28443)

(assert (=> d!108953 (= (get!12947 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!489591)))

(declare-fun b!879752 () Bool)

(declare-fun get!12948 (ValueCell!8334 V!28443) V!28443)

(assert (=> b!879752 (= e!489591 (get!12948 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!879753 () Bool)

(declare-fun get!12949 (ValueCell!8334 V!28443) V!28443)

(assert (=> b!879753 (= e!489591 (get!12949 (select (arr!24637 _values!688) from!1053) (dynLambda!1226 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108953 c!92855) b!879752))

(assert (= (and d!108953 (not c!92855)) b!879753))

(assert (=> b!879752 m!819331))

(assert (=> b!879752 m!819333))

(declare-fun m!819545 () Bool)

(assert (=> b!879752 m!819545))

(assert (=> b!879753 m!819331))

(assert (=> b!879753 m!819333))

(declare-fun m!819547 () Bool)

(assert (=> b!879753 m!819547))

(assert (=> b!879600 d!108953))

(declare-fun d!108955 () Bool)

(assert (=> d!108955 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!879595 d!108955))

(declare-fun b!879762 () Bool)

(declare-fun e!489599 () Bool)

(declare-fun e!489600 () Bool)

(assert (=> b!879762 (= e!489599 e!489600)))

(declare-fun c!92858 () Bool)

(assert (=> b!879762 (= c!92858 (validKeyInArray!0 (select (arr!24636 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!879763 () Bool)

(declare-fun call!38890 () Bool)

(assert (=> b!879763 (= e!489600 call!38890)))

(declare-fun b!879764 () Bool)

(declare-fun e!489598 () Bool)

(assert (=> b!879764 (= e!489600 e!489598)))

(declare-fun lt!397771 () (_ BitVec 64))

(assert (=> b!879764 (= lt!397771 (select (arr!24636 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!397772 () Unit!30038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51222 (_ BitVec 64) (_ BitVec 32)) Unit!30038)

(assert (=> b!879764 (= lt!397772 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!397771 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!879764 (arrayContainsKey!0 _keys!868 lt!397771 #b00000000000000000000000000000000)))

(declare-fun lt!397770 () Unit!30038)

(assert (=> b!879764 (= lt!397770 lt!397772)))

(declare-fun res!597680 () Bool)

(declare-datatypes ((SeekEntryResult!8755 0))(
  ( (MissingZero!8755 (index!37391 (_ BitVec 32))) (Found!8755 (index!37392 (_ BitVec 32))) (Intermediate!8755 (undefined!9567 Bool) (index!37393 (_ BitVec 32)) (x!74512 (_ BitVec 32))) (Undefined!8755) (MissingVacant!8755 (index!37394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51222 (_ BitVec 32)) SeekEntryResult!8755)

(assert (=> b!879764 (= res!597680 (= (seekEntryOrOpen!0 (select (arr!24636 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8755 #b00000000000000000000000000000000)))))

(assert (=> b!879764 (=> (not res!597680) (not e!489598))))

(declare-fun d!108957 () Bool)

(declare-fun res!597681 () Bool)

(assert (=> d!108957 (=> res!597681 e!489599)))

(assert (=> d!108957 (= res!597681 (bvsge #b00000000000000000000000000000000 (size!25076 _keys!868)))))

(assert (=> d!108957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!489599)))

(declare-fun b!879765 () Bool)

(assert (=> b!879765 (= e!489598 call!38890)))

(declare-fun bm!38887 () Bool)

(assert (=> bm!38887 (= call!38890 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(assert (= (and d!108957 (not res!597681)) b!879762))

(assert (= (and b!879762 c!92858) b!879764))

(assert (= (and b!879762 (not c!92858)) b!879763))

(assert (= (and b!879764 res!597680) b!879765))

(assert (= (or b!879765 b!879763) bm!38887))

(assert (=> b!879762 m!819411))

(assert (=> b!879762 m!819411))

(assert (=> b!879762 m!819415))

(assert (=> b!879764 m!819411))

(declare-fun m!819549 () Bool)

(assert (=> b!879764 m!819549))

(declare-fun m!819551 () Bool)

(assert (=> b!879764 m!819551))

(assert (=> b!879764 m!819411))

(declare-fun m!819553 () Bool)

(assert (=> b!879764 m!819553))

(declare-fun m!819555 () Bool)

(assert (=> bm!38887 m!819555))

(assert (=> b!879590 d!108957))

(declare-fun mapNonEmpty!27945 () Bool)

(declare-fun mapRes!27945 () Bool)

(declare-fun tp!53603 () Bool)

(declare-fun e!489606 () Bool)

(assert (=> mapNonEmpty!27945 (= mapRes!27945 (and tp!53603 e!489606))))

(declare-fun mapKey!27945 () (_ BitVec 32))

(declare-fun mapValue!27945 () ValueCell!8334)

(declare-fun mapRest!27945 () (Array (_ BitVec 32) ValueCell!8334))

(assert (=> mapNonEmpty!27945 (= mapRest!27939 (store mapRest!27945 mapKey!27945 mapValue!27945))))

(declare-fun b!879772 () Bool)

(assert (=> b!879772 (= e!489606 tp_is_empty!17547)))

(declare-fun b!879773 () Bool)

(declare-fun e!489605 () Bool)

(assert (=> b!879773 (= e!489605 tp_is_empty!17547)))

(declare-fun mapIsEmpty!27945 () Bool)

(assert (=> mapIsEmpty!27945 mapRes!27945))

(declare-fun condMapEmpty!27945 () Bool)

(declare-fun mapDefault!27945 () ValueCell!8334)

(assert (=> mapNonEmpty!27939 (= condMapEmpty!27945 (= mapRest!27939 ((as const (Array (_ BitVec 32) ValueCell!8334)) mapDefault!27945)))))

(assert (=> mapNonEmpty!27939 (= tp!53593 (and e!489605 mapRes!27945))))

(assert (= (and mapNonEmpty!27939 condMapEmpty!27945) mapIsEmpty!27945))

(assert (= (and mapNonEmpty!27939 (not condMapEmpty!27945)) mapNonEmpty!27945))

(assert (= (and mapNonEmpty!27945 ((_ is ValueCellFull!8334) mapValue!27945)) b!879772))

(assert (= (and mapNonEmpty!27939 ((_ is ValueCellFull!8334) mapDefault!27945)) b!879773))

(declare-fun m!819557 () Bool)

(assert (=> mapNonEmpty!27945 m!819557))

(declare-fun b_lambda!12399 () Bool)

(assert (= b_lambda!12395 (or (and start!74634 b_free!15303) b_lambda!12399)))

(declare-fun b_lambda!12401 () Bool)

(assert (= b_lambda!12387 (or (and start!74634 b_free!15303) b_lambda!12401)))

(declare-fun b_lambda!12403 () Bool)

(assert (= b_lambda!12389 (or (and start!74634 b_free!15303) b_lambda!12403)))

(declare-fun b_lambda!12405 () Bool)

(assert (= b_lambda!12397 (or (and start!74634 b_free!15303) b_lambda!12405)))

(declare-fun b_lambda!12407 () Bool)

(assert (= b_lambda!12391 (or (and start!74634 b_free!15303) b_lambda!12407)))

(declare-fun b_lambda!12409 () Bool)

(assert (= b_lambda!12383 (or (and start!74634 b_free!15303) b_lambda!12409)))

(declare-fun b_lambda!12411 () Bool)

(assert (= b_lambda!12385 (or (and start!74634 b_free!15303) b_lambda!12411)))

(declare-fun b_lambda!12413 () Bool)

(assert (= b_lambda!12393 (or (and start!74634 b_free!15303) b_lambda!12413)))

(check-sat (not b_lambda!12407) (not b!879723) (not b!879696) (not b_lambda!12409) (not b_lambda!12411) (not b!879691) (not b!879732) (not b!879656) (not b!879753) (not b!879702) (not b!879690) (not bm!38881) (not b!879747) (not d!108951) (not b!879764) (not b!879730) (not bm!38872) (not b!879762) (not b!879700) (not b_lambda!12413) (not b!879720) (not b!879752) (not d!108935) (not b!879699) (not b!879727) (not b!879735) (not b!879693) (not b!879746) (not b!879729) (not b!879733) (not b!879688) (not b!879722) (not b_lambda!12399) (not b_lambda!12405) (not bm!38884) (not d!108945) (not bm!38875) (not b!879742) (not d!108937) (not b!879739) (not b!879683) (not bm!38876) tp_is_empty!17547 (not b!879741) (not b!879703) (not b!879694) (not b_next!15303) (not b!879721) (not b_lambda!12381) (not b!879713) (not b!879706) (not bm!38883) (not b!879744) (not d!108941) (not bm!38882) (not b!879684) (not d!108943) (not b!879745) (not bm!38887) (not mapNonEmpty!27945) (not b_lambda!12401) (not b!879726) (not b!879738) b_and!25231 (not b!879695) (not b!879687) (not b!879655) (not b!879734) (not b!879657) (not b_lambda!12403) (not b!879705) (not d!108947))
(check-sat b_and!25231 (not b_next!15303))
