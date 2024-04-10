; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73224 () Bool)

(assert start!73224)

(declare-fun b_free!14139 () Bool)

(declare-fun b_next!14139 () Bool)

(assert (=> start!73224 (= b_free!14139 (not b_next!14139))))

(declare-fun tp!49921 () Bool)

(declare-fun b_and!23437 () Bool)

(assert (=> start!73224 (= tp!49921 b_and!23437)))

(declare-fun b!853421 () Bool)

(declare-fun e!475932 () Bool)

(assert (=> b!853421 (= e!475932 true)))

(declare-datatypes ((V!26747 0))(
  ( (V!26748 (val!8185 Int)) )
))
(declare-datatypes ((tuple2!10760 0))(
  ( (tuple2!10761 (_1!5391 (_ BitVec 64)) (_2!5391 V!26747)) )
))
(declare-fun lt!384731 () tuple2!10760)

(declare-fun lt!384733 () V!26747)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((List!16586 0))(
  ( (Nil!16583) (Cons!16582 (h!17713 tuple2!10760) (t!23171 List!16586)) )
))
(declare-datatypes ((ListLongMap!9529 0))(
  ( (ListLongMap!9530 (toList!4780 List!16586)) )
))
(declare-fun lt!384727 () ListLongMap!9529)

(declare-fun +!2172 (ListLongMap!9529 tuple2!10760) ListLongMap!9529)

(assert (=> b!853421 (= (+!2172 lt!384727 lt!384731) (+!2172 (+!2172 lt!384727 (tuple2!10761 k0!854 lt!384733)) lt!384731))))

(declare-fun lt!384732 () V!26747)

(assert (=> b!853421 (= lt!384731 (tuple2!10761 k0!854 lt!384732))))

(declare-datatypes ((Unit!29127 0))(
  ( (Unit!29128) )
))
(declare-fun lt!384730 () Unit!29127)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!299 (ListLongMap!9529 (_ BitVec 64) V!26747 V!26747) Unit!29127)

(assert (=> b!853421 (= lt!384730 (addSameAsAddTwiceSameKeyDiffValues!299 lt!384727 k0!854 lt!384733 lt!384732))))

(declare-fun lt!384729 () V!26747)

(declare-datatypes ((ValueCell!7698 0))(
  ( (ValueCellFull!7698 (v!10610 V!26747)) (EmptyCell!7698) )
))
(declare-datatypes ((array!48748 0))(
  ( (array!48749 (arr!23405 (Array (_ BitVec 32) ValueCell!7698)) (size!23845 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48748)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12343 (ValueCell!7698 V!26747) V!26747)

(assert (=> b!853421 (= lt!384733 (get!12343 (select (arr!23405 _values!688) from!1053) lt!384729))))

(declare-fun lt!384724 () ListLongMap!9529)

(declare-datatypes ((array!48750 0))(
  ( (array!48751 (arr!23406 (Array (_ BitVec 32) (_ BitVec 64))) (size!23846 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48750)

(assert (=> b!853421 (= lt!384724 (+!2172 lt!384727 (tuple2!10761 (select (arr!23406 _keys!868) from!1053) lt!384732)))))

(declare-fun v!557 () V!26747)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853421 (= lt!384732 (get!12343 (select (store (arr!23405 _values!688) i!612 (ValueCellFull!7698 v!557)) from!1053) lt!384729))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1053 (Int (_ BitVec 64)) V!26747)

(assert (=> b!853421 (= lt!384729 (dynLambda!1053 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!384725 () array!48748)

(declare-fun minValue!654 () V!26747)

(declare-fun zeroValue!654 () V!26747)

(declare-fun getCurrentListMapNoExtraKeys!2761 (array!48750 array!48748 (_ BitVec 32) (_ BitVec 32) V!26747 V!26747 (_ BitVec 32) Int) ListLongMap!9529)

(assert (=> b!853421 (= lt!384727 (getCurrentListMapNoExtraKeys!2761 _keys!868 lt!384725 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853422 () Bool)

(declare-fun e!475931 () Bool)

(declare-fun tp_is_empty!16275 () Bool)

(assert (=> b!853422 (= e!475931 tp_is_empty!16275)))

(declare-fun b!853423 () Bool)

(declare-fun res!579614 () Bool)

(declare-fun e!475933 () Bool)

(assert (=> b!853423 (=> (not res!579614) (not e!475933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853423 (= res!579614 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26012 () Bool)

(declare-fun mapRes!26012 () Bool)

(declare-fun tp!49920 () Bool)

(assert (=> mapNonEmpty!26012 (= mapRes!26012 (and tp!49920 e!475931))))

(declare-fun mapValue!26012 () ValueCell!7698)

(declare-fun mapRest!26012 () (Array (_ BitVec 32) ValueCell!7698))

(declare-fun mapKey!26012 () (_ BitVec 32))

(assert (=> mapNonEmpty!26012 (= (arr!23405 _values!688) (store mapRest!26012 mapKey!26012 mapValue!26012))))

(declare-fun b!853424 () Bool)

(declare-fun e!475929 () Bool)

(assert (=> b!853424 (= e!475933 e!475929)))

(declare-fun res!579616 () Bool)

(assert (=> b!853424 (=> (not res!579616) (not e!475929))))

(assert (=> b!853424 (= res!579616 (= from!1053 i!612))))

(assert (=> b!853424 (= lt!384724 (getCurrentListMapNoExtraKeys!2761 _keys!868 lt!384725 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853424 (= lt!384725 (array!48749 (store (arr!23405 _values!688) i!612 (ValueCellFull!7698 v!557)) (size!23845 _values!688)))))

(declare-fun lt!384726 () ListLongMap!9529)

(assert (=> b!853424 (= lt!384726 (getCurrentListMapNoExtraKeys!2761 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853425 () Bool)

(assert (=> b!853425 (= e!475929 (not e!475932))))

(declare-fun res!579609 () Bool)

(assert (=> b!853425 (=> res!579609 e!475932)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853425 (= res!579609 (not (validKeyInArray!0 (select (arr!23406 _keys!868) from!1053))))))

(declare-fun e!475935 () Bool)

(assert (=> b!853425 e!475935))

(declare-fun c!91879 () Bool)

(assert (=> b!853425 (= c!91879 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384728 () Unit!29127)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!399 (array!48750 array!48748 (_ BitVec 32) (_ BitVec 32) V!26747 V!26747 (_ BitVec 32) (_ BitVec 64) V!26747 (_ BitVec 32) Int) Unit!29127)

(assert (=> b!853425 (= lt!384728 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!399 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853426 () Bool)

(declare-fun e!475930 () Bool)

(assert (=> b!853426 (= e!475930 tp_is_empty!16275)))

(declare-fun mapIsEmpty!26012 () Bool)

(assert (=> mapIsEmpty!26012 mapRes!26012))

(declare-fun b!853427 () Bool)

(declare-fun res!579611 () Bool)

(assert (=> b!853427 (=> (not res!579611) (not e!475933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48750 (_ BitVec 32)) Bool)

(assert (=> b!853427 (= res!579611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853428 () Bool)

(declare-fun res!579610 () Bool)

(assert (=> b!853428 (=> (not res!579610) (not e!475933))))

(assert (=> b!853428 (= res!579610 (and (= (size!23845 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23846 _keys!868) (size!23845 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853429 () Bool)

(declare-fun res!579617 () Bool)

(assert (=> b!853429 (=> (not res!579617) (not e!475933))))

(assert (=> b!853429 (= res!579617 (validKeyInArray!0 k0!854))))

(declare-fun b!853430 () Bool)

(declare-fun res!579608 () Bool)

(assert (=> b!853430 (=> (not res!579608) (not e!475933))))

(assert (=> b!853430 (= res!579608 (and (= (select (arr!23406 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853431 () Bool)

(declare-fun e!475936 () Bool)

(assert (=> b!853431 (= e!475936 (and e!475930 mapRes!26012))))

(declare-fun condMapEmpty!26012 () Bool)

(declare-fun mapDefault!26012 () ValueCell!7698)

(assert (=> b!853431 (= condMapEmpty!26012 (= (arr!23405 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7698)) mapDefault!26012)))))

(declare-fun res!579613 () Bool)

(assert (=> start!73224 (=> (not res!579613) (not e!475933))))

(assert (=> start!73224 (= res!579613 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23846 _keys!868))))))

(assert (=> start!73224 e!475933))

(assert (=> start!73224 tp_is_empty!16275))

(assert (=> start!73224 true))

(assert (=> start!73224 tp!49921))

(declare-fun array_inv!18560 (array!48750) Bool)

(assert (=> start!73224 (array_inv!18560 _keys!868)))

(declare-fun array_inv!18561 (array!48748) Bool)

(assert (=> start!73224 (and (array_inv!18561 _values!688) e!475936)))

(declare-fun b!853432 () Bool)

(declare-fun call!38272 () ListLongMap!9529)

(declare-fun call!38273 () ListLongMap!9529)

(assert (=> b!853432 (= e!475935 (= call!38272 call!38273))))

(declare-fun b!853433 () Bool)

(declare-fun res!579612 () Bool)

(assert (=> b!853433 (=> (not res!579612) (not e!475933))))

(assert (=> b!853433 (= res!579612 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23846 _keys!868))))))

(declare-fun bm!38269 () Bool)

(assert (=> bm!38269 (= call!38273 (getCurrentListMapNoExtraKeys!2761 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853434 () Bool)

(assert (=> b!853434 (= e!475935 (= call!38272 (+!2172 call!38273 (tuple2!10761 k0!854 v!557))))))

(declare-fun b!853435 () Bool)

(declare-fun res!579615 () Bool)

(assert (=> b!853435 (=> (not res!579615) (not e!475933))))

(declare-datatypes ((List!16587 0))(
  ( (Nil!16584) (Cons!16583 (h!17714 (_ BitVec 64)) (t!23172 List!16587)) )
))
(declare-fun arrayNoDuplicates!0 (array!48750 (_ BitVec 32) List!16587) Bool)

(assert (=> b!853435 (= res!579615 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16584))))

(declare-fun bm!38270 () Bool)

(assert (=> bm!38270 (= call!38272 (getCurrentListMapNoExtraKeys!2761 _keys!868 lt!384725 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73224 res!579613) b!853423))

(assert (= (and b!853423 res!579614) b!853428))

(assert (= (and b!853428 res!579610) b!853427))

(assert (= (and b!853427 res!579611) b!853435))

(assert (= (and b!853435 res!579615) b!853433))

(assert (= (and b!853433 res!579612) b!853429))

(assert (= (and b!853429 res!579617) b!853430))

(assert (= (and b!853430 res!579608) b!853424))

(assert (= (and b!853424 res!579616) b!853425))

(assert (= (and b!853425 c!91879) b!853434))

(assert (= (and b!853425 (not c!91879)) b!853432))

(assert (= (or b!853434 b!853432) bm!38270))

(assert (= (or b!853434 b!853432) bm!38269))

(assert (= (and b!853425 (not res!579609)) b!853421))

(assert (= (and b!853431 condMapEmpty!26012) mapIsEmpty!26012))

(assert (= (and b!853431 (not condMapEmpty!26012)) mapNonEmpty!26012))

(get-info :version)

(assert (= (and mapNonEmpty!26012 ((_ is ValueCellFull!7698) mapValue!26012)) b!853422))

(assert (= (and b!853431 ((_ is ValueCellFull!7698) mapDefault!26012)) b!853426))

(assert (= start!73224 b!853431))

(declare-fun b_lambda!11671 () Bool)

(assert (=> (not b_lambda!11671) (not b!853421)))

(declare-fun t!23170 () Bool)

(declare-fun tb!4441 () Bool)

(assert (=> (and start!73224 (= defaultEntry!696 defaultEntry!696) t!23170) tb!4441))

(declare-fun result!8493 () Bool)

(assert (=> tb!4441 (= result!8493 tp_is_empty!16275)))

(assert (=> b!853421 t!23170))

(declare-fun b_and!23439 () Bool)

(assert (= b_and!23437 (and (=> t!23170 result!8493) b_and!23439)))

(declare-fun m!794631 () Bool)

(assert (=> b!853430 m!794631))

(declare-fun m!794633 () Bool)

(assert (=> b!853429 m!794633))

(declare-fun m!794635 () Bool)

(assert (=> b!853421 m!794635))

(declare-fun m!794637 () Bool)

(assert (=> b!853421 m!794637))

(declare-fun m!794639 () Bool)

(assert (=> b!853421 m!794639))

(declare-fun m!794641 () Bool)

(assert (=> b!853421 m!794641))

(declare-fun m!794643 () Bool)

(assert (=> b!853421 m!794643))

(assert (=> b!853421 m!794635))

(declare-fun m!794645 () Bool)

(assert (=> b!853421 m!794645))

(declare-fun m!794647 () Bool)

(assert (=> b!853421 m!794647))

(declare-fun m!794649 () Bool)

(assert (=> b!853421 m!794649))

(declare-fun m!794651 () Bool)

(assert (=> b!853421 m!794651))

(declare-fun m!794653 () Bool)

(assert (=> b!853421 m!794653))

(declare-fun m!794655 () Bool)

(assert (=> b!853421 m!794655))

(assert (=> b!853421 m!794647))

(declare-fun m!794657 () Bool)

(assert (=> b!853421 m!794657))

(assert (=> b!853421 m!794641))

(declare-fun m!794659 () Bool)

(assert (=> b!853421 m!794659))

(assert (=> bm!38270 m!794655))

(declare-fun m!794661 () Bool)

(assert (=> mapNonEmpty!26012 m!794661))

(declare-fun m!794663 () Bool)

(assert (=> b!853424 m!794663))

(assert (=> b!853424 m!794659))

(declare-fun m!794665 () Bool)

(assert (=> b!853424 m!794665))

(declare-fun m!794667 () Bool)

(assert (=> start!73224 m!794667))

(declare-fun m!794669 () Bool)

(assert (=> start!73224 m!794669))

(declare-fun m!794671 () Bool)

(assert (=> b!853434 m!794671))

(declare-fun m!794673 () Bool)

(assert (=> b!853435 m!794673))

(assert (=> b!853425 m!794649))

(assert (=> b!853425 m!794649))

(declare-fun m!794675 () Bool)

(assert (=> b!853425 m!794675))

(declare-fun m!794677 () Bool)

(assert (=> b!853425 m!794677))

(declare-fun m!794679 () Bool)

(assert (=> b!853427 m!794679))

(declare-fun m!794681 () Bool)

(assert (=> bm!38269 m!794681))

(declare-fun m!794683 () Bool)

(assert (=> b!853423 m!794683))

(check-sat (not b!853424) (not start!73224) (not b!853425) (not b!853429) (not b!853421) (not b!853434) (not bm!38269) tp_is_empty!16275 (not b_next!14139) (not b!853423) (not bm!38270) (not mapNonEmpty!26012) (not b!853427) (not b!853435) b_and!23439 (not b_lambda!11671))
(check-sat b_and!23439 (not b_next!14139))
