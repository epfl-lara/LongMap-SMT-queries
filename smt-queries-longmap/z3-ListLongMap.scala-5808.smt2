; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74922 () Bool)

(assert start!74922)

(declare-fun b_free!15441 () Bool)

(declare-fun b_next!15441 () Bool)

(assert (=> start!74922 (= b_free!15441 (not b_next!15441))))

(declare-fun tp!54026 () Bool)

(declare-fun b_and!25581 () Bool)

(assert (=> start!74922 (= tp!54026 b_and!25581)))

(declare-fun b!883555 () Bool)

(declare-fun res!600271 () Bool)

(declare-fun e!491730 () Bool)

(assert (=> b!883555 (=> (not res!600271) (not e!491730))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51496 0))(
  ( (array!51497 (arr!24767 (Array (_ BitVec 32) (_ BitVec 64))) (size!25207 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51496)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883555 (= res!600271 (and (= (select (arr!24767 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883556 () Bool)

(declare-fun e!491728 () Bool)

(declare-fun e!491723 () Bool)

(declare-fun mapRes!28164 () Bool)

(assert (=> b!883556 (= e!491728 (and e!491723 mapRes!28164))))

(declare-fun condMapEmpty!28164 () Bool)

(declare-datatypes ((V!28627 0))(
  ( (V!28628 (val!8890 Int)) )
))
(declare-datatypes ((ValueCell!8403 0))(
  ( (ValueCellFull!8403 (v!11359 V!28627)) (EmptyCell!8403) )
))
(declare-datatypes ((array!51498 0))(
  ( (array!51499 (arr!24768 (Array (_ BitVec 32) ValueCell!8403)) (size!25208 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51498)

(declare-fun mapDefault!28164 () ValueCell!8403)

(assert (=> b!883556 (= condMapEmpty!28164 (= (arr!24768 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8403)) mapDefault!28164)))))

(declare-fun b!883557 () Bool)

(declare-fun e!491725 () Bool)

(declare-fun e!491727 () Bool)

(assert (=> b!883557 (= e!491725 (not e!491727))))

(declare-fun res!600266 () Bool)

(assert (=> b!883557 (=> res!600266 e!491727)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883557 (= res!600266 (not (validKeyInArray!0 (select (arr!24767 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11780 0))(
  ( (tuple2!11781 (_1!5901 (_ BitVec 64)) (_2!5901 V!28627)) )
))
(declare-datatypes ((List!17588 0))(
  ( (Nil!17585) (Cons!17584 (h!18715 tuple2!11780) (t!24831 List!17588)) )
))
(declare-datatypes ((ListLongMap!10549 0))(
  ( (ListLongMap!10550 (toList!5290 List!17588)) )
))
(declare-fun lt!399930 () ListLongMap!10549)

(declare-fun lt!399929 () ListLongMap!10549)

(assert (=> b!883557 (= lt!399930 lt!399929)))

(declare-fun lt!399926 () ListLongMap!10549)

(declare-fun v!557 () V!28627)

(declare-fun +!2559 (ListLongMap!10549 tuple2!11780) ListLongMap!10549)

(assert (=> b!883557 (= lt!399929 (+!2559 lt!399926 (tuple2!11781 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!399933 () array!51498)

(declare-fun minValue!654 () V!28627)

(declare-fun zeroValue!654 () V!28627)

(declare-fun getCurrentListMapNoExtraKeys!3249 (array!51496 array!51498 (_ BitVec 32) (_ BitVec 32) V!28627 V!28627 (_ BitVec 32) Int) ListLongMap!10549)

(assert (=> b!883557 (= lt!399930 (getCurrentListMapNoExtraKeys!3249 _keys!868 lt!399933 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883557 (= lt!399926 (getCurrentListMapNoExtraKeys!3249 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30146 0))(
  ( (Unit!30147) )
))
(declare-fun lt!399925 () Unit!30146)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!743 (array!51496 array!51498 (_ BitVec 32) (_ BitVec 32) V!28627 V!28627 (_ BitVec 32) (_ BitVec 64) V!28627 (_ BitVec 32) Int) Unit!30146)

(assert (=> b!883557 (= lt!399925 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!743 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883558 () Bool)

(declare-fun e!491729 () Unit!30146)

(declare-fun Unit!30148 () Unit!30146)

(assert (=> b!883558 (= e!491729 Unit!30148)))

(declare-fun mapIsEmpty!28164 () Bool)

(assert (=> mapIsEmpty!28164 mapRes!28164))

(declare-fun b!883559 () Bool)

(declare-fun tp_is_empty!17685 () Bool)

(assert (=> b!883559 (= e!491723 tp_is_empty!17685)))

(declare-fun b!883560 () Bool)

(declare-fun res!600268 () Bool)

(assert (=> b!883560 (=> (not res!600268) (not e!491730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51496 (_ BitVec 32)) Bool)

(assert (=> b!883560 (= res!600268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883561 () Bool)

(declare-fun res!600265 () Bool)

(assert (=> b!883561 (=> (not res!600265) (not e!491730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883561 (= res!600265 (validMask!0 mask!1196))))

(declare-fun b!883562 () Bool)

(declare-fun e!491724 () Bool)

(assert (=> b!883562 (= e!491724 tp_is_empty!17685)))

(declare-fun b!883564 () Bool)

(assert (=> b!883564 (= e!491730 e!491725)))

(declare-fun res!600270 () Bool)

(assert (=> b!883564 (=> (not res!600270) (not e!491725))))

(assert (=> b!883564 (= res!600270 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399935 () ListLongMap!10549)

(assert (=> b!883564 (= lt!399935 (getCurrentListMapNoExtraKeys!3249 _keys!868 lt!399933 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883564 (= lt!399933 (array!51499 (store (arr!24768 _values!688) i!612 (ValueCellFull!8403 v!557)) (size!25208 _values!688)))))

(declare-fun lt!399931 () ListLongMap!10549)

(assert (=> b!883564 (= lt!399931 (getCurrentListMapNoExtraKeys!3249 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!28164 () Bool)

(declare-fun tp!54025 () Bool)

(assert (=> mapNonEmpty!28164 (= mapRes!28164 (and tp!54025 e!491724))))

(declare-fun mapRest!28164 () (Array (_ BitVec 32) ValueCell!8403))

(declare-fun mapValue!28164 () ValueCell!8403)

(declare-fun mapKey!28164 () (_ BitVec 32))

(assert (=> mapNonEmpty!28164 (= (arr!24768 _values!688) (store mapRest!28164 mapKey!28164 mapValue!28164))))

(declare-fun b!883565 () Bool)

(declare-fun Unit!30149 () Unit!30146)

(assert (=> b!883565 (= e!491729 Unit!30149)))

(declare-fun lt!399932 () Unit!30146)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51496 (_ BitVec 32) (_ BitVec 32)) Unit!30146)

(assert (=> b!883565 (= lt!399932 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17589 0))(
  ( (Nil!17586) (Cons!17585 (h!18716 (_ BitVec 64)) (t!24832 List!17589)) )
))
(declare-fun arrayNoDuplicates!0 (array!51496 (_ BitVec 32) List!17589) Bool)

(assert (=> b!883565 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17586)))

(declare-fun lt!399927 () Unit!30146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30146)

(assert (=> b!883565 (= lt!399927 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883565 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399928 () Unit!30146)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51496 (_ BitVec 64) (_ BitVec 32) List!17589) Unit!30146)

(assert (=> b!883565 (= lt!399928 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17586))))

(assert (=> b!883565 false))

(declare-fun b!883566 () Bool)

(declare-fun res!600269 () Bool)

(assert (=> b!883566 (=> (not res!600269) (not e!491730))))

(assert (=> b!883566 (= res!600269 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25207 _keys!868))))))

(declare-fun b!883567 () Bool)

(declare-fun res!600273 () Bool)

(assert (=> b!883567 (=> (not res!600273) (not e!491730))))

(assert (=> b!883567 (= res!600273 (validKeyInArray!0 k0!854))))

(declare-fun b!883563 () Bool)

(declare-fun res!600264 () Bool)

(assert (=> b!883563 (=> (not res!600264) (not e!491730))))

(assert (=> b!883563 (= res!600264 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17586))))

(declare-fun res!600267 () Bool)

(assert (=> start!74922 (=> (not res!600267) (not e!491730))))

(assert (=> start!74922 (= res!600267 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25207 _keys!868))))))

(assert (=> start!74922 e!491730))

(assert (=> start!74922 tp_is_empty!17685))

(assert (=> start!74922 true))

(assert (=> start!74922 tp!54026))

(declare-fun array_inv!19500 (array!51496) Bool)

(assert (=> start!74922 (array_inv!19500 _keys!868)))

(declare-fun array_inv!19501 (array!51498) Bool)

(assert (=> start!74922 (and (array_inv!19501 _values!688) e!491728)))

(declare-fun b!883568 () Bool)

(declare-fun res!600272 () Bool)

(assert (=> b!883568 (=> (not res!600272) (not e!491730))))

(assert (=> b!883568 (= res!600272 (and (= (size!25208 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25207 _keys!868) (size!25208 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883569 () Bool)

(assert (=> b!883569 (= e!491727 (bvslt from!1053 (size!25207 _keys!868)))))

(assert (=> b!883569 (not (= (select (arr!24767 _keys!868) from!1053) k0!854))))

(declare-fun lt!399934 () Unit!30146)

(assert (=> b!883569 (= lt!399934 e!491729)))

(declare-fun c!93067 () Bool)

(assert (=> b!883569 (= c!93067 (= (select (arr!24767 _keys!868) from!1053) k0!854))))

(declare-fun get!13050 (ValueCell!8403 V!28627) V!28627)

(declare-fun dynLambda!1271 (Int (_ BitVec 64)) V!28627)

(assert (=> b!883569 (= lt!399935 (+!2559 lt!399929 (tuple2!11781 (select (arr!24767 _keys!868) from!1053) (get!13050 (select (arr!24768 _values!688) from!1053) (dynLambda!1271 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!74922 res!600267) b!883561))

(assert (= (and b!883561 res!600265) b!883568))

(assert (= (and b!883568 res!600272) b!883560))

(assert (= (and b!883560 res!600268) b!883563))

(assert (= (and b!883563 res!600264) b!883566))

(assert (= (and b!883566 res!600269) b!883567))

(assert (= (and b!883567 res!600273) b!883555))

(assert (= (and b!883555 res!600271) b!883564))

(assert (= (and b!883564 res!600270) b!883557))

(assert (= (and b!883557 (not res!600266)) b!883569))

(assert (= (and b!883569 c!93067) b!883565))

(assert (= (and b!883569 (not c!93067)) b!883558))

(assert (= (and b!883556 condMapEmpty!28164) mapIsEmpty!28164))

(assert (= (and b!883556 (not condMapEmpty!28164)) mapNonEmpty!28164))

(get-info :version)

(assert (= (and mapNonEmpty!28164 ((_ is ValueCellFull!8403) mapValue!28164)) b!883562))

(assert (= (and b!883556 ((_ is ValueCellFull!8403) mapDefault!28164)) b!883559))

(assert (= start!74922 b!883556))

(declare-fun b_lambda!12719 () Bool)

(assert (=> (not b_lambda!12719) (not b!883569)))

(declare-fun t!24830 () Bool)

(declare-fun tb!5099 () Bool)

(assert (=> (and start!74922 (= defaultEntry!696 defaultEntry!696) t!24830) tb!5099))

(declare-fun result!9833 () Bool)

(assert (=> tb!5099 (= result!9833 tp_is_empty!17685)))

(assert (=> b!883569 t!24830))

(declare-fun b_and!25583 () Bool)

(assert (= b_and!25581 (and (=> t!24830 result!9833) b_and!25583)))

(declare-fun m!823629 () Bool)

(assert (=> b!883567 m!823629))

(declare-fun m!823631 () Bool)

(assert (=> b!883555 m!823631))

(declare-fun m!823633 () Bool)

(assert (=> b!883557 m!823633))

(declare-fun m!823635 () Bool)

(assert (=> b!883557 m!823635))

(assert (=> b!883557 m!823633))

(declare-fun m!823637 () Bool)

(assert (=> b!883557 m!823637))

(declare-fun m!823639 () Bool)

(assert (=> b!883557 m!823639))

(declare-fun m!823641 () Bool)

(assert (=> b!883557 m!823641))

(declare-fun m!823643 () Bool)

(assert (=> b!883557 m!823643))

(declare-fun m!823645 () Bool)

(assert (=> b!883565 m!823645))

(declare-fun m!823647 () Bool)

(assert (=> b!883565 m!823647))

(declare-fun m!823649 () Bool)

(assert (=> b!883565 m!823649))

(declare-fun m!823651 () Bool)

(assert (=> b!883565 m!823651))

(declare-fun m!823653 () Bool)

(assert (=> b!883565 m!823653))

(declare-fun m!823655 () Bool)

(assert (=> b!883564 m!823655))

(declare-fun m!823657 () Bool)

(assert (=> b!883564 m!823657))

(declare-fun m!823659 () Bool)

(assert (=> b!883564 m!823659))

(declare-fun m!823661 () Bool)

(assert (=> b!883560 m!823661))

(declare-fun m!823663 () Bool)

(assert (=> start!74922 m!823663))

(declare-fun m!823665 () Bool)

(assert (=> start!74922 m!823665))

(declare-fun m!823667 () Bool)

(assert (=> b!883569 m!823667))

(declare-fun m!823669 () Bool)

(assert (=> b!883569 m!823669))

(declare-fun m!823671 () Bool)

(assert (=> b!883569 m!823671))

(assert (=> b!883569 m!823633))

(assert (=> b!883569 m!823669))

(assert (=> b!883569 m!823667))

(declare-fun m!823673 () Bool)

(assert (=> b!883569 m!823673))

(declare-fun m!823675 () Bool)

(assert (=> b!883561 m!823675))

(declare-fun m!823677 () Bool)

(assert (=> mapNonEmpty!28164 m!823677))

(declare-fun m!823679 () Bool)

(assert (=> b!883563 m!823679))

(check-sat (not b_next!15441) (not b!883561) (not b!883567) (not start!74922) (not mapNonEmpty!28164) (not b!883565) (not b!883564) b_and!25583 (not b_lambda!12719) (not b!883557) (not b!883563) (not b!883560) (not b!883569) tp_is_empty!17685)
(check-sat b_and!25583 (not b_next!15441))
