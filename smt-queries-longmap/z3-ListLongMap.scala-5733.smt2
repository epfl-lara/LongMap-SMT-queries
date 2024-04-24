; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74362 () Bool)

(assert start!74362)

(declare-fun b_free!15001 () Bool)

(declare-fun b_next!15001 () Bool)

(assert (=> start!74362 (= b_free!15001 (not b_next!15001))))

(declare-fun tp!52654 () Bool)

(declare-fun b_and!24763 () Bool)

(assert (=> start!74362 (= tp!52654 b_and!24763)))

(declare-fun b!873683 () Bool)

(declare-fun res!593505 () Bool)

(declare-fun e!486640 () Bool)

(assert (=> b!873683 (=> (not res!593505) (not e!486640))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873683 (= res!593505 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27452 () Bool)

(declare-fun mapRes!27452 () Bool)

(declare-fun tp!52655 () Bool)

(declare-fun e!486639 () Bool)

(assert (=> mapNonEmpty!27452 (= mapRes!27452 (and tp!52655 e!486639))))

(declare-datatypes ((V!28025 0))(
  ( (V!28026 (val!8664 Int)) )
))
(declare-datatypes ((ValueCell!8177 0))(
  ( (ValueCellFull!8177 (v!11089 V!28025)) (EmptyCell!8177) )
))
(declare-fun mapRest!27452 () (Array (_ BitVec 32) ValueCell!8177))

(declare-fun mapKey!27452 () (_ BitVec 32))

(declare-fun mapValue!27452 () ValueCell!8177)

(declare-datatypes ((array!50651 0))(
  ( (array!50652 (arr!24351 (Array (_ BitVec 32) ValueCell!8177)) (size!24792 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50651)

(assert (=> mapNonEmpty!27452 (= (arr!24351 _values!688) (store mapRest!27452 mapKey!27452 mapValue!27452))))

(declare-fun b!873684 () Bool)

(declare-fun tp_is_empty!17233 () Bool)

(assert (=> b!873684 (= e!486639 tp_is_empty!17233)))

(declare-fun b!873685 () Bool)

(declare-fun res!593507 () Bool)

(assert (=> b!873685 (=> (not res!593507) (not e!486640))))

(declare-datatypes ((array!50653 0))(
  ( (array!50654 (arr!24352 (Array (_ BitVec 32) (_ BitVec 64))) (size!24793 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50653)

(declare-datatypes ((List!17224 0))(
  ( (Nil!17221) (Cons!17220 (h!18357 (_ BitVec 64)) (t!24253 List!17224)) )
))
(declare-fun arrayNoDuplicates!0 (array!50653 (_ BitVec 32) List!17224) Bool)

(assert (=> b!873685 (= res!593507 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17221))))

(declare-fun v!557 () V!28025)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!38512 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!11380 0))(
  ( (tuple2!11381 (_1!5701 (_ BitVec 64)) (_2!5701 V!28025)) )
))
(declare-datatypes ((List!17225 0))(
  ( (Nil!17222) (Cons!17221 (h!18358 tuple2!11380) (t!24254 List!17225)) )
))
(declare-datatypes ((ListLongMap!10151 0))(
  ( (ListLongMap!10152 (toList!5091 List!17225)) )
))
(declare-fun call!38516 () ListLongMap!10151)

(declare-fun minValue!654 () V!28025)

(declare-fun zeroValue!654 () V!28025)

(declare-fun getCurrentListMapNoExtraKeys!3135 (array!50653 array!50651 (_ BitVec 32) (_ BitVec 32) V!28025 V!28025 (_ BitVec 32) Int) ListLongMap!10151)

(assert (=> bm!38512 (= call!38516 (getCurrentListMapNoExtraKeys!3135 _keys!868 (array!50652 (store (arr!24351 _values!688) i!612 (ValueCellFull!8177 v!557)) (size!24792 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27452 () Bool)

(assert (=> mapIsEmpty!27452 mapRes!27452))

(declare-fun b!873686 () Bool)

(declare-fun res!593506 () Bool)

(assert (=> b!873686 (=> (not res!593506) (not e!486640))))

(assert (=> b!873686 (= res!593506 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24793 _keys!868))))))

(declare-fun b!873687 () Bool)

(declare-fun e!486638 () Bool)

(declare-fun e!486635 () Bool)

(assert (=> b!873687 (= e!486638 (and e!486635 mapRes!27452))))

(declare-fun condMapEmpty!27452 () Bool)

(declare-fun mapDefault!27452 () ValueCell!8177)

(assert (=> b!873687 (= condMapEmpty!27452 (= (arr!24351 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8177)) mapDefault!27452)))))

(declare-fun b!873688 () Bool)

(declare-fun e!486636 () Bool)

(declare-fun call!38515 () ListLongMap!10151)

(assert (=> b!873688 (= e!486636 (= call!38516 call!38515))))

(declare-fun b!873689 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2475 (ListLongMap!10151 tuple2!11380) ListLongMap!10151)

(assert (=> b!873689 (= e!486636 (= call!38516 (+!2475 call!38515 (tuple2!11381 k0!854 v!557))))))

(declare-fun res!593509 () Bool)

(assert (=> start!74362 (=> (not res!593509) (not e!486640))))

(assert (=> start!74362 (= res!593509 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24793 _keys!868))))))

(assert (=> start!74362 e!486640))

(assert (=> start!74362 tp_is_empty!17233))

(assert (=> start!74362 true))

(assert (=> start!74362 tp!52654))

(declare-fun array_inv!19266 (array!50653) Bool)

(assert (=> start!74362 (array_inv!19266 _keys!868)))

(declare-fun array_inv!19267 (array!50651) Bool)

(assert (=> start!74362 (and (array_inv!19267 _values!688) e!486638)))

(declare-fun b!873682 () Bool)

(declare-fun res!593512 () Bool)

(assert (=> b!873682 (=> (not res!593512) (not e!486640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50653 (_ BitVec 32)) Bool)

(assert (=> b!873682 (= res!593512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873690 () Bool)

(assert (=> b!873690 (= e!486640 (not true))))

(assert (=> b!873690 e!486636))

(declare-fun c!92677 () Bool)

(assert (=> b!873690 (= c!92677 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29902 0))(
  ( (Unit!29903) )
))
(declare-fun lt!396017 () Unit!29902)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!646 (array!50653 array!50651 (_ BitVec 32) (_ BitVec 32) V!28025 V!28025 (_ BitVec 32) (_ BitVec 64) V!28025 (_ BitVec 32) Int) Unit!29902)

(assert (=> b!873690 (= lt!396017 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!646 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873691 () Bool)

(declare-fun res!593510 () Bool)

(assert (=> b!873691 (=> (not res!593510) (not e!486640))))

(assert (=> b!873691 (= res!593510 (and (= (size!24792 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24793 _keys!868) (size!24792 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873692 () Bool)

(declare-fun res!593511 () Bool)

(assert (=> b!873692 (=> (not res!593511) (not e!486640))))

(assert (=> b!873692 (= res!593511 (and (= (select (arr!24352 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24793 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!38513 () Bool)

(assert (=> bm!38513 (= call!38515 (getCurrentListMapNoExtraKeys!3135 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!873693 () Bool)

(declare-fun res!593508 () Bool)

(assert (=> b!873693 (=> (not res!593508) (not e!486640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873693 (= res!593508 (validKeyInArray!0 k0!854))))

(declare-fun b!873694 () Bool)

(assert (=> b!873694 (= e!486635 tp_is_empty!17233)))

(assert (= (and start!74362 res!593509) b!873683))

(assert (= (and b!873683 res!593505) b!873691))

(assert (= (and b!873691 res!593510) b!873682))

(assert (= (and b!873682 res!593512) b!873685))

(assert (= (and b!873685 res!593507) b!873686))

(assert (= (and b!873686 res!593506) b!873693))

(assert (= (and b!873693 res!593508) b!873692))

(assert (= (and b!873692 res!593511) b!873690))

(assert (= (and b!873690 c!92677) b!873689))

(assert (= (and b!873690 (not c!92677)) b!873688))

(assert (= (or b!873689 b!873688) bm!38512))

(assert (= (or b!873689 b!873688) bm!38513))

(assert (= (and b!873687 condMapEmpty!27452) mapIsEmpty!27452))

(assert (= (and b!873687 (not condMapEmpty!27452)) mapNonEmpty!27452))

(get-info :version)

(assert (= (and mapNonEmpty!27452 ((_ is ValueCellFull!8177) mapValue!27452)) b!873684))

(assert (= (and b!873687 ((_ is ValueCellFull!8177) mapDefault!27452)) b!873694))

(assert (= start!74362 b!873687))

(declare-fun m!814733 () Bool)

(assert (=> b!873692 m!814733))

(declare-fun m!814735 () Bool)

(assert (=> b!873690 m!814735))

(declare-fun m!814737 () Bool)

(assert (=> b!873685 m!814737))

(declare-fun m!814739 () Bool)

(assert (=> start!74362 m!814739))

(declare-fun m!814741 () Bool)

(assert (=> start!74362 m!814741))

(declare-fun m!814743 () Bool)

(assert (=> bm!38512 m!814743))

(declare-fun m!814745 () Bool)

(assert (=> bm!38512 m!814745))

(declare-fun m!814747 () Bool)

(assert (=> b!873683 m!814747))

(declare-fun m!814749 () Bool)

(assert (=> b!873689 m!814749))

(declare-fun m!814751 () Bool)

(assert (=> b!873682 m!814751))

(declare-fun m!814753 () Bool)

(assert (=> mapNonEmpty!27452 m!814753))

(declare-fun m!814755 () Bool)

(assert (=> b!873693 m!814755))

(declare-fun m!814757 () Bool)

(assert (=> bm!38513 m!814757))

(check-sat (not b!873690) (not b!873682) (not bm!38512) (not bm!38513) (not b!873683) (not b!873685) (not b!873689) tp_is_empty!17233 (not b_next!15001) b_and!24763 (not start!74362) (not b!873693) (not mapNonEmpty!27452))
(check-sat b_and!24763 (not b_next!15001))
