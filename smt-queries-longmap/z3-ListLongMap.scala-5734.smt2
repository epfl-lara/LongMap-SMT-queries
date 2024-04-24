; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74368 () Bool)

(assert start!74368)

(declare-fun b_free!15007 () Bool)

(declare-fun b_next!15007 () Bool)

(assert (=> start!74368 (= b_free!15007 (not b_next!15007))))

(declare-fun tp!52672 () Bool)

(declare-fun b_and!24769 () Bool)

(assert (=> start!74368 (= tp!52672 b_and!24769)))

(declare-fun b!873799 () Bool)

(declare-fun e!486690 () Bool)

(declare-fun e!486693 () Bool)

(declare-fun mapRes!27461 () Bool)

(assert (=> b!873799 (= e!486690 (and e!486693 mapRes!27461))))

(declare-fun condMapEmpty!27461 () Bool)

(declare-datatypes ((V!28033 0))(
  ( (V!28034 (val!8667 Int)) )
))
(declare-datatypes ((ValueCell!8180 0))(
  ( (ValueCellFull!8180 (v!11092 V!28033)) (EmptyCell!8180) )
))
(declare-datatypes ((array!50659 0))(
  ( (array!50660 (arr!24355 (Array (_ BitVec 32) ValueCell!8180)) (size!24796 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50659)

(declare-fun mapDefault!27461 () ValueCell!8180)

(assert (=> b!873799 (= condMapEmpty!27461 (= (arr!24355 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8180)) mapDefault!27461)))))

(declare-fun b!873800 () Bool)

(declare-fun res!593582 () Bool)

(declare-fun e!486689 () Bool)

(assert (=> b!873800 (=> (not res!593582) (not e!486689))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873800 (= res!593582 (validKeyInArray!0 k0!854))))

(declare-fun v!557 () V!28033)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11384 0))(
  ( (tuple2!11385 (_1!5703 (_ BitVec 64)) (_2!5703 V!28033)) )
))
(declare-datatypes ((List!17227 0))(
  ( (Nil!17224) (Cons!17223 (h!18360 tuple2!11384) (t!24256 List!17227)) )
))
(declare-datatypes ((ListLongMap!10155 0))(
  ( (ListLongMap!10156 (toList!5093 List!17227)) )
))
(declare-fun call!38534 () ListLongMap!10155)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50661 0))(
  ( (array!50662 (arr!24356 (Array (_ BitVec 32) (_ BitVec 64))) (size!24797 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50661)

(declare-fun minValue!654 () V!28033)

(declare-fun zeroValue!654 () V!28033)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!38530 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3136 (array!50661 array!50659 (_ BitVec 32) (_ BitVec 32) V!28033 V!28033 (_ BitVec 32) Int) ListLongMap!10155)

(assert (=> bm!38530 (= call!38534 (getCurrentListMapNoExtraKeys!3136 _keys!868 (array!50660 (store (arr!24355 _values!688) i!612 (ValueCellFull!8180 v!557)) (size!24796 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!593577 () Bool)

(assert (=> start!74368 (=> (not res!593577) (not e!486689))))

(assert (=> start!74368 (= res!593577 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24797 _keys!868))))))

(assert (=> start!74368 e!486689))

(declare-fun tp_is_empty!17239 () Bool)

(assert (=> start!74368 tp_is_empty!17239))

(assert (=> start!74368 true))

(assert (=> start!74368 tp!52672))

(declare-fun array_inv!19268 (array!50661) Bool)

(assert (=> start!74368 (array_inv!19268 _keys!868)))

(declare-fun array_inv!19269 (array!50659) Bool)

(assert (=> start!74368 (and (array_inv!19269 _values!688) e!486690)))

(declare-fun b!873801 () Bool)

(declare-fun res!593583 () Bool)

(assert (=> b!873801 (=> (not res!593583) (not e!486689))))

(assert (=> b!873801 (= res!593583 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24797 _keys!868))))))

(declare-fun mapIsEmpty!27461 () Bool)

(assert (=> mapIsEmpty!27461 mapRes!27461))

(declare-fun b!873802 () Bool)

(declare-fun res!593579 () Bool)

(assert (=> b!873802 (=> (not res!593579) (not e!486689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873802 (= res!593579 (validMask!0 mask!1196))))

(declare-fun b!873803 () Bool)

(declare-fun e!486692 () Bool)

(assert (=> b!873803 (= e!486692 tp_is_empty!17239)))

(declare-fun b!873804 () Bool)

(declare-fun res!593578 () Bool)

(assert (=> b!873804 (=> (not res!593578) (not e!486689))))

(assert (=> b!873804 (= res!593578 (and (= (size!24796 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24797 _keys!868) (size!24796 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873805 () Bool)

(declare-fun res!593580 () Bool)

(assert (=> b!873805 (=> (not res!593580) (not e!486689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50661 (_ BitVec 32)) Bool)

(assert (=> b!873805 (= res!593580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873806 () Bool)

(declare-fun res!593581 () Bool)

(assert (=> b!873806 (=> (not res!593581) (not e!486689))))

(declare-datatypes ((List!17228 0))(
  ( (Nil!17225) (Cons!17224 (h!18361 (_ BitVec 64)) (t!24257 List!17228)) )
))
(declare-fun arrayNoDuplicates!0 (array!50661 (_ BitVec 32) List!17228) Bool)

(assert (=> b!873806 (= res!593581 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17225))))

(declare-fun bm!38531 () Bool)

(declare-fun call!38533 () ListLongMap!10155)

(assert (=> bm!38531 (= call!38533 (getCurrentListMapNoExtraKeys!3136 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873807 () Bool)

(declare-fun e!486694 () Bool)

(assert (=> b!873807 (= e!486694 (= call!38534 call!38533))))

(declare-fun mapNonEmpty!27461 () Bool)

(declare-fun tp!52673 () Bool)

(assert (=> mapNonEmpty!27461 (= mapRes!27461 (and tp!52673 e!486692))))

(declare-fun mapRest!27461 () (Array (_ BitVec 32) ValueCell!8180))

(declare-fun mapValue!27461 () ValueCell!8180)

(declare-fun mapKey!27461 () (_ BitVec 32))

(assert (=> mapNonEmpty!27461 (= (arr!24355 _values!688) (store mapRest!27461 mapKey!27461 mapValue!27461))))

(declare-fun b!873808 () Bool)

(declare-fun +!2477 (ListLongMap!10155 tuple2!11384) ListLongMap!10155)

(assert (=> b!873808 (= e!486694 (= call!38534 (+!2477 call!38533 (tuple2!11385 k0!854 v!557))))))

(declare-fun b!873809 () Bool)

(assert (=> b!873809 (= e!486689 (not (bvslt i!612 (size!24796 _values!688))))))

(assert (=> b!873809 e!486694))

(declare-fun c!92686 () Bool)

(assert (=> b!873809 (= c!92686 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29904 0))(
  ( (Unit!29905) )
))
(declare-fun lt!396026 () Unit!29904)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!647 (array!50661 array!50659 (_ BitVec 32) (_ BitVec 32) V!28033 V!28033 (_ BitVec 32) (_ BitVec 64) V!28033 (_ BitVec 32) Int) Unit!29904)

(assert (=> b!873809 (= lt!396026 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!647 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873810 () Bool)

(assert (=> b!873810 (= e!486693 tp_is_empty!17239)))

(declare-fun b!873811 () Bool)

(declare-fun res!593584 () Bool)

(assert (=> b!873811 (=> (not res!593584) (not e!486689))))

(assert (=> b!873811 (= res!593584 (and (= (select (arr!24356 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24797 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(assert (= (and start!74368 res!593577) b!873802))

(assert (= (and b!873802 res!593579) b!873804))

(assert (= (and b!873804 res!593578) b!873805))

(assert (= (and b!873805 res!593580) b!873806))

(assert (= (and b!873806 res!593581) b!873801))

(assert (= (and b!873801 res!593583) b!873800))

(assert (= (and b!873800 res!593582) b!873811))

(assert (= (and b!873811 res!593584) b!873809))

(assert (= (and b!873809 c!92686) b!873808))

(assert (= (and b!873809 (not c!92686)) b!873807))

(assert (= (or b!873808 b!873807) bm!38530))

(assert (= (or b!873808 b!873807) bm!38531))

(assert (= (and b!873799 condMapEmpty!27461) mapIsEmpty!27461))

(assert (= (and b!873799 (not condMapEmpty!27461)) mapNonEmpty!27461))

(get-info :version)

(assert (= (and mapNonEmpty!27461 ((_ is ValueCellFull!8180) mapValue!27461)) b!873803))

(assert (= (and b!873799 ((_ is ValueCellFull!8180) mapDefault!27461)) b!873810))

(assert (= start!74368 b!873799))

(declare-fun m!814811 () Bool)

(assert (=> start!74368 m!814811))

(declare-fun m!814813 () Bool)

(assert (=> start!74368 m!814813))

(declare-fun m!814815 () Bool)

(assert (=> b!873800 m!814815))

(declare-fun m!814817 () Bool)

(assert (=> mapNonEmpty!27461 m!814817))

(declare-fun m!814819 () Bool)

(assert (=> b!873806 m!814819))

(declare-fun m!814821 () Bool)

(assert (=> b!873809 m!814821))

(declare-fun m!814823 () Bool)

(assert (=> b!873808 m!814823))

(declare-fun m!814825 () Bool)

(assert (=> b!873811 m!814825))

(declare-fun m!814827 () Bool)

(assert (=> b!873805 m!814827))

(declare-fun m!814829 () Bool)

(assert (=> bm!38531 m!814829))

(declare-fun m!814831 () Bool)

(assert (=> bm!38530 m!814831))

(declare-fun m!814833 () Bool)

(assert (=> bm!38530 m!814833))

(declare-fun m!814835 () Bool)

(assert (=> b!873802 m!814835))

(check-sat (not b_next!15007) (not b!873809) (not start!74368) (not bm!38531) tp_is_empty!17239 b_and!24769 (not bm!38530) (not mapNonEmpty!27461) (not b!873805) (not b!873808) (not b!873806) (not b!873800) (not b!873802))
(check-sat b_and!24769 (not b_next!15007))
