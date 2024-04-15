; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74176 () Bool)

(assert start!74176)

(declare-fun b_free!15001 () Bool)

(declare-fun b_next!15001 () Bool)

(assert (=> start!74176 (= b_free!15001 (not b_next!15001))))

(declare-fun tp!52655 () Bool)

(declare-fun b_and!24727 () Bool)

(assert (=> start!74176 (= tp!52655 b_and!24727)))

(declare-fun b!872540 () Bool)

(declare-fun res!593058 () Bool)

(declare-fun e!485908 () Bool)

(assert (=> b!872540 (=> (not res!593058) (not e!485908))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872540 (= res!593058 (validKeyInArray!0 k0!854))))

(declare-fun bm!38441 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28025 0))(
  ( (V!28026 (val!8664 Int)) )
))
(declare-datatypes ((tuple2!11470 0))(
  ( (tuple2!11471 (_1!5746 (_ BitVec 64)) (_2!5746 V!28025)) )
))
(declare-datatypes ((List!17279 0))(
  ( (Nil!17276) (Cons!17275 (h!18406 tuple2!11470) (t!24307 List!17279)) )
))
(declare-datatypes ((ListLongMap!10229 0))(
  ( (ListLongMap!10230 (toList!5130 List!17279)) )
))
(declare-fun call!38445 () ListLongMap!10229)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50583 0))(
  ( (array!50584 (arr!24322 (Array (_ BitVec 32) (_ BitVec 64))) (size!24764 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50583)

(declare-datatypes ((ValueCell!8177 0))(
  ( (ValueCellFull!8177 (v!11083 V!28025)) (EmptyCell!8177) )
))
(declare-datatypes ((array!50585 0))(
  ( (array!50586 (arr!24323 (Array (_ BitVec 32) ValueCell!8177)) (size!24765 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50585)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28025)

(declare-fun zeroValue!654 () V!28025)

(declare-fun getCurrentListMapNoExtraKeys!3123 (array!50583 array!50585 (_ BitVec 32) (_ BitVec 32) V!28025 V!28025 (_ BitVec 32) Int) ListLongMap!10229)

(assert (=> bm!38441 (= call!38445 (getCurrentListMapNoExtraKeys!3123 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872541 () Bool)

(declare-fun e!485905 () Bool)

(declare-fun tp_is_empty!17233 () Bool)

(assert (=> b!872541 (= e!485905 tp_is_empty!17233)))

(declare-fun b!872542 () Bool)

(declare-fun res!593051 () Bool)

(assert (=> b!872542 (=> (not res!593051) (not e!485908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50583 (_ BitVec 32)) Bool)

(assert (=> b!872542 (= res!593051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872543 () Bool)

(declare-fun e!485907 () Bool)

(assert (=> b!872543 (= e!485907 tp_is_empty!17233)))

(declare-fun res!593053 () Bool)

(assert (=> start!74176 (=> (not res!593053) (not e!485908))))

(assert (=> start!74176 (= res!593053 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24764 _keys!868))))))

(assert (=> start!74176 e!485908))

(assert (=> start!74176 tp_is_empty!17233))

(assert (=> start!74176 true))

(assert (=> start!74176 tp!52655))

(declare-fun array_inv!19256 (array!50583) Bool)

(assert (=> start!74176 (array_inv!19256 _keys!868)))

(declare-fun e!485909 () Bool)

(declare-fun array_inv!19257 (array!50585) Bool)

(assert (=> start!74176 (and (array_inv!19257 _values!688) e!485909)))

(declare-fun mapNonEmpty!27452 () Bool)

(declare-fun mapRes!27452 () Bool)

(declare-fun tp!52654 () Bool)

(assert (=> mapNonEmpty!27452 (= mapRes!27452 (and tp!52654 e!485907))))

(declare-fun mapValue!27452 () ValueCell!8177)

(declare-fun mapRest!27452 () (Array (_ BitVec 32) ValueCell!8177))

(declare-fun mapKey!27452 () (_ BitVec 32))

(assert (=> mapNonEmpty!27452 (= (arr!24323 _values!688) (store mapRest!27452 mapKey!27452 mapValue!27452))))

(declare-fun mapIsEmpty!27452 () Bool)

(assert (=> mapIsEmpty!27452 mapRes!27452))

(declare-fun b!872544 () Bool)

(assert (=> b!872544 (= e!485909 (and e!485905 mapRes!27452))))

(declare-fun condMapEmpty!27452 () Bool)

(declare-fun mapDefault!27452 () ValueCell!8177)

(assert (=> b!872544 (= condMapEmpty!27452 (= (arr!24323 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8177)) mapDefault!27452)))))

(declare-fun b!872545 () Bool)

(declare-fun res!593055 () Bool)

(assert (=> b!872545 (=> (not res!593055) (not e!485908))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!872545 (= res!593055 (and (= (select (arr!24322 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24764 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun v!557 () V!28025)

(declare-fun bm!38442 () Bool)

(declare-fun call!38444 () ListLongMap!10229)

(assert (=> bm!38442 (= call!38444 (getCurrentListMapNoExtraKeys!3123 _keys!868 (array!50586 (store (arr!24323 _values!688) i!612 (ValueCellFull!8177 v!557)) (size!24765 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872546 () Bool)

(declare-fun e!485906 () Bool)

(declare-fun +!2485 (ListLongMap!10229 tuple2!11470) ListLongMap!10229)

(assert (=> b!872546 (= e!485906 (= call!38444 (+!2485 call!38445 (tuple2!11471 k0!854 v!557))))))

(declare-fun b!872547 () Bool)

(declare-fun res!593057 () Bool)

(assert (=> b!872547 (=> (not res!593057) (not e!485908))))

(assert (=> b!872547 (= res!593057 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24764 _keys!868))))))

(declare-fun b!872548 () Bool)

(assert (=> b!872548 (= e!485906 (= call!38444 call!38445))))

(declare-fun b!872549 () Bool)

(declare-fun res!593052 () Bool)

(assert (=> b!872549 (=> (not res!593052) (not e!485908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872549 (= res!593052 (validMask!0 mask!1196))))

(declare-fun b!872550 () Bool)

(declare-fun res!593054 () Bool)

(assert (=> b!872550 (=> (not res!593054) (not e!485908))))

(declare-datatypes ((List!17280 0))(
  ( (Nil!17277) (Cons!17276 (h!18407 (_ BitVec 64)) (t!24308 List!17280)) )
))
(declare-fun arrayNoDuplicates!0 (array!50583 (_ BitVec 32) List!17280) Bool)

(assert (=> b!872550 (= res!593054 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17277))))

(declare-fun b!872551 () Bool)

(declare-fun res!593056 () Bool)

(assert (=> b!872551 (=> (not res!593056) (not e!485908))))

(assert (=> b!872551 (= res!593056 (and (= (size!24765 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24764 _keys!868) (size!24765 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872552 () Bool)

(assert (=> b!872552 (= e!485908 (not true))))

(assert (=> b!872552 e!485906))

(declare-fun c!92330 () Bool)

(assert (=> b!872552 (= c!92330 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29859 0))(
  ( (Unit!29860) )
))
(declare-fun lt!395420 () Unit!29859)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!653 (array!50583 array!50585 (_ BitVec 32) (_ BitVec 32) V!28025 V!28025 (_ BitVec 32) (_ BitVec 64) V!28025 (_ BitVec 32) Int) Unit!29859)

(assert (=> b!872552 (= lt!395420 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!653 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74176 res!593053) b!872549))

(assert (= (and b!872549 res!593052) b!872551))

(assert (= (and b!872551 res!593056) b!872542))

(assert (= (and b!872542 res!593051) b!872550))

(assert (= (and b!872550 res!593054) b!872547))

(assert (= (and b!872547 res!593057) b!872540))

(assert (= (and b!872540 res!593058) b!872545))

(assert (= (and b!872545 res!593055) b!872552))

(assert (= (and b!872552 c!92330) b!872546))

(assert (= (and b!872552 (not c!92330)) b!872548))

(assert (= (or b!872546 b!872548) bm!38442))

(assert (= (or b!872546 b!872548) bm!38441))

(assert (= (and b!872544 condMapEmpty!27452) mapIsEmpty!27452))

(assert (= (and b!872544 (not condMapEmpty!27452)) mapNonEmpty!27452))

(get-info :version)

(assert (= (and mapNonEmpty!27452 ((_ is ValueCellFull!8177) mapValue!27452)) b!872543))

(assert (= (and b!872544 ((_ is ValueCellFull!8177) mapDefault!27452)) b!872541))

(assert (= start!74176 b!872544))

(declare-fun m!812685 () Bool)

(assert (=> b!872540 m!812685))

(declare-fun m!812687 () Bool)

(assert (=> bm!38441 m!812687))

(declare-fun m!812689 () Bool)

(assert (=> b!872549 m!812689))

(declare-fun m!812691 () Bool)

(assert (=> mapNonEmpty!27452 m!812691))

(declare-fun m!812693 () Bool)

(assert (=> bm!38442 m!812693))

(declare-fun m!812695 () Bool)

(assert (=> bm!38442 m!812695))

(declare-fun m!812697 () Bool)

(assert (=> b!872552 m!812697))

(declare-fun m!812699 () Bool)

(assert (=> b!872542 m!812699))

(declare-fun m!812701 () Bool)

(assert (=> b!872546 m!812701))

(declare-fun m!812703 () Bool)

(assert (=> start!74176 m!812703))

(declare-fun m!812705 () Bool)

(assert (=> start!74176 m!812705))

(declare-fun m!812707 () Bool)

(assert (=> b!872545 m!812707))

(declare-fun m!812709 () Bool)

(assert (=> b!872550 m!812709))

(check-sat (not b!872550) (not bm!38441) (not start!74176) (not b!872552) (not b!872546) (not mapNonEmpty!27452) (not b!872540) (not b!872549) b_and!24727 (not bm!38442) tp_is_empty!17233 (not b_next!15001) (not b!872542))
(check-sat b_and!24727 (not b_next!15001))
