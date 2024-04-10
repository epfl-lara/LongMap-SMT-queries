; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74440 () Bool)

(assert start!74440)

(declare-fun b_free!15183 () Bool)

(declare-fun b_next!15183 () Bool)

(assert (=> start!74440 (= b_free!15183 (not b_next!15183))))

(declare-fun tp!53227 () Bool)

(declare-fun b_and!25019 () Bool)

(assert (=> start!74440 (= tp!53227 b_and!25019)))

(declare-datatypes ((V!28283 0))(
  ( (V!28284 (val!8761 Int)) )
))
(declare-datatypes ((tuple2!11582 0))(
  ( (tuple2!11583 (_1!5802 (_ BitVec 64)) (_2!5802 V!28283)) )
))
(declare-datatypes ((List!17399 0))(
  ( (Nil!17396) (Cons!17395 (h!18526 tuple2!11582) (t!24486 List!17399)) )
))
(declare-datatypes ((ListLongMap!10351 0))(
  ( (ListLongMap!10352 (toList!5191 List!17399)) )
))
(declare-fun call!38793 () ListLongMap!10351)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50980 0))(
  ( (array!50981 (arr!24517 (Array (_ BitVec 32) (_ BitVec 64))) (size!24957 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50980)

(declare-datatypes ((ValueCell!8274 0))(
  ( (ValueCellFull!8274 (v!11194 V!28283)) (EmptyCell!8274) )
))
(declare-datatypes ((array!50982 0))(
  ( (array!50983 (arr!24518 (Array (_ BitVec 32) ValueCell!8274)) (size!24958 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50982)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28283)

(declare-fun zeroValue!654 () V!28283)

(declare-fun bm!38789 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3158 (array!50980 array!50982 (_ BitVec 32) (_ BitVec 32) V!28283 V!28283 (_ BitVec 32) Int) ListLongMap!10351)

(assert (=> bm!38789 (= call!38793 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876811 () Bool)

(declare-fun e!488078 () Bool)

(declare-fun call!38792 () ListLongMap!10351)

(assert (=> b!876811 (= e!488078 (= call!38792 call!38793))))

(declare-fun b!876812 () Bool)

(declare-fun res!595790 () Bool)

(declare-fun e!488080 () Bool)

(assert (=> b!876812 (=> (not res!595790) (not e!488080))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!876812 (= res!595790 (and (= (select (arr!24517 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun e!488081 () Bool)

(declare-fun b!876813 () Bool)

(declare-fun lt!396718 () ListLongMap!10351)

(declare-fun v!557 () V!28283)

(declare-fun lt!396721 () ListLongMap!10351)

(declare-fun +!2491 (ListLongMap!10351 tuple2!11582) ListLongMap!10351)

(assert (=> b!876813 (= e!488081 (= lt!396721 (+!2491 lt!396718 (tuple2!11583 k0!854 v!557))))))

(declare-fun lt!396716 () tuple2!11582)

(declare-fun lt!396719 () ListLongMap!10351)

(declare-fun lt!396715 () V!28283)

(assert (=> b!876813 (= (+!2491 lt!396719 lt!396716) (+!2491 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)) lt!396716))))

(declare-fun lt!396717 () V!28283)

(assert (=> b!876813 (= lt!396716 (tuple2!11583 k0!854 lt!396717))))

(declare-datatypes ((Unit!29986 0))(
  ( (Unit!29987) )
))
(declare-fun lt!396723 () Unit!29986)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!324 (ListLongMap!10351 (_ BitVec 64) V!28283 V!28283) Unit!29986)

(assert (=> b!876813 (= lt!396723 (addSameAsAddTwiceSameKeyDiffValues!324 lt!396719 k0!854 lt!396715 lt!396717))))

(declare-fun lt!396714 () V!28283)

(declare-fun get!12894 (ValueCell!8274 V!28283) V!28283)

(assert (=> b!876813 (= lt!396715 (get!12894 (select (arr!24518 _values!688) from!1053) lt!396714))))

(assert (=> b!876813 (= lt!396721 (+!2491 lt!396719 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))

(assert (=> b!876813 (= lt!396717 (get!12894 (select (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) from!1053) lt!396714))))

(declare-fun dynLambda!1218 (Int (_ BitVec 64)) V!28283)

(assert (=> b!876813 (= lt!396714 (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!396722 () array!50982)

(assert (=> b!876813 (= lt!396719 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876814 () Bool)

(declare-fun e!488082 () Bool)

(assert (=> b!876814 (= e!488082 (not e!488081))))

(declare-fun res!595791 () Bool)

(assert (=> b!876814 (=> res!595791 e!488081)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876814 (= res!595791 (not (validKeyInArray!0 (select (arr!24517 _keys!868) from!1053))))))

(assert (=> b!876814 e!488078))

(declare-fun c!92624 () Bool)

(assert (=> b!876814 (= c!92624 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!396720 () Unit!29986)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!686 (array!50980 array!50982 (_ BitVec 32) (_ BitVec 32) V!28283 V!28283 (_ BitVec 32) (_ BitVec 64) V!28283 (_ BitVec 32) Int) Unit!29986)

(assert (=> b!876814 (= lt!396720 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876815 () Bool)

(declare-fun res!595795 () Bool)

(assert (=> b!876815 (=> (not res!595795) (not e!488080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876815 (= res!595795 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!27752 () Bool)

(declare-fun mapRes!27752 () Bool)

(assert (=> mapIsEmpty!27752 mapRes!27752))

(declare-fun b!876816 () Bool)

(declare-fun e!488083 () Bool)

(declare-fun tp_is_empty!17427 () Bool)

(assert (=> b!876816 (= e!488083 tp_is_empty!17427)))

(declare-fun b!876817 () Bool)

(declare-fun res!595798 () Bool)

(assert (=> b!876817 (=> (not res!595798) (not e!488080))))

(assert (=> b!876817 (= res!595798 (validKeyInArray!0 k0!854))))

(declare-fun b!876818 () Bool)

(assert (=> b!876818 (= e!488080 e!488082)))

(declare-fun res!595797 () Bool)

(assert (=> b!876818 (=> (not res!595797) (not e!488082))))

(assert (=> b!876818 (= res!595797 (= from!1053 i!612))))

(assert (=> b!876818 (= lt!396721 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!876818 (= lt!396722 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688)))))

(assert (=> b!876818 (= lt!396718 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27752 () Bool)

(declare-fun tp!53226 () Bool)

(assert (=> mapNonEmpty!27752 (= mapRes!27752 (and tp!53226 e!488083))))

(declare-fun mapRest!27752 () (Array (_ BitVec 32) ValueCell!8274))

(declare-fun mapValue!27752 () ValueCell!8274)

(declare-fun mapKey!27752 () (_ BitVec 32))

(assert (=> mapNonEmpty!27752 (= (arr!24518 _values!688) (store mapRest!27752 mapKey!27752 mapValue!27752))))

(declare-fun b!876819 () Bool)

(declare-fun res!595794 () Bool)

(assert (=> b!876819 (=> (not res!595794) (not e!488080))))

(declare-datatypes ((List!17400 0))(
  ( (Nil!17397) (Cons!17396 (h!18527 (_ BitVec 64)) (t!24487 List!17400)) )
))
(declare-fun arrayNoDuplicates!0 (array!50980 (_ BitVec 32) List!17400) Bool)

(assert (=> b!876819 (= res!595794 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17397))))

(declare-fun b!876820 () Bool)

(assert (=> b!876820 (= e!488078 (= call!38792 (+!2491 call!38793 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!876821 () Bool)

(declare-fun e!488079 () Bool)

(declare-fun e!488085 () Bool)

(assert (=> b!876821 (= e!488079 (and e!488085 mapRes!27752))))

(declare-fun condMapEmpty!27752 () Bool)

(declare-fun mapDefault!27752 () ValueCell!8274)

(assert (=> b!876821 (= condMapEmpty!27752 (= (arr!24518 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8274)) mapDefault!27752)))))

(declare-fun b!876822 () Bool)

(declare-fun res!595792 () Bool)

(assert (=> b!876822 (=> (not res!595792) (not e!488080))))

(assert (=> b!876822 (= res!595792 (and (= (size!24958 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24957 _keys!868) (size!24958 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876823 () Bool)

(declare-fun res!595799 () Bool)

(assert (=> b!876823 (=> (not res!595799) (not e!488080))))

(assert (=> b!876823 (= res!595799 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24957 _keys!868))))))

(declare-fun b!876824 () Bool)

(assert (=> b!876824 (= e!488085 tp_is_empty!17427)))

(declare-fun res!595793 () Bool)

(assert (=> start!74440 (=> (not res!595793) (not e!488080))))

(assert (=> start!74440 (= res!595793 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24957 _keys!868))))))

(assert (=> start!74440 e!488080))

(assert (=> start!74440 tp_is_empty!17427))

(assert (=> start!74440 true))

(assert (=> start!74440 tp!53227))

(declare-fun array_inv!19324 (array!50980) Bool)

(assert (=> start!74440 (array_inv!19324 _keys!868)))

(declare-fun array_inv!19325 (array!50982) Bool)

(assert (=> start!74440 (and (array_inv!19325 _values!688) e!488079)))

(declare-fun bm!38790 () Bool)

(assert (=> bm!38790 (= call!38792 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876825 () Bool)

(declare-fun res!595796 () Bool)

(assert (=> b!876825 (=> (not res!595796) (not e!488080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50980 (_ BitVec 32)) Bool)

(assert (=> b!876825 (= res!595796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74440 res!595793) b!876815))

(assert (= (and b!876815 res!595795) b!876822))

(assert (= (and b!876822 res!595792) b!876825))

(assert (= (and b!876825 res!595796) b!876819))

(assert (= (and b!876819 res!595794) b!876823))

(assert (= (and b!876823 res!595799) b!876817))

(assert (= (and b!876817 res!595798) b!876812))

(assert (= (and b!876812 res!595790) b!876818))

(assert (= (and b!876818 res!595797) b!876814))

(assert (= (and b!876814 c!92624) b!876820))

(assert (= (and b!876814 (not c!92624)) b!876811))

(assert (= (or b!876820 b!876811) bm!38790))

(assert (= (or b!876820 b!876811) bm!38789))

(assert (= (and b!876814 (not res!595791)) b!876813))

(assert (= (and b!876821 condMapEmpty!27752) mapIsEmpty!27752))

(assert (= (and b!876821 (not condMapEmpty!27752)) mapNonEmpty!27752))

(get-info :version)

(assert (= (and mapNonEmpty!27752 ((_ is ValueCellFull!8274) mapValue!27752)) b!876816))

(assert (= (and b!876821 ((_ is ValueCellFull!8274) mapDefault!27752)) b!876824))

(assert (= start!74440 b!876821))

(declare-fun b_lambda!12251 () Bool)

(assert (=> (not b_lambda!12251) (not b!876813)))

(declare-fun t!24485 () Bool)

(declare-fun tb!4943 () Bool)

(assert (=> (and start!74440 (= defaultEntry!696 defaultEntry!696) t!24485) tb!4943))

(declare-fun result!9505 () Bool)

(assert (=> tb!4943 (= result!9505 tp_is_empty!17427)))

(assert (=> b!876813 t!24485))

(declare-fun b_and!25021 () Bool)

(assert (= b_and!25019 (and (=> t!24485 result!9505) b_and!25021)))

(declare-fun m!816619 () Bool)

(assert (=> b!876820 m!816619))

(declare-fun m!816621 () Bool)

(assert (=> start!74440 m!816621))

(declare-fun m!816623 () Bool)

(assert (=> start!74440 m!816623))

(declare-fun m!816625 () Bool)

(assert (=> b!876818 m!816625))

(declare-fun m!816627 () Bool)

(assert (=> b!876818 m!816627))

(declare-fun m!816629 () Bool)

(assert (=> b!876818 m!816629))

(declare-fun m!816631 () Bool)

(assert (=> b!876813 m!816631))

(declare-fun m!816633 () Bool)

(assert (=> b!876813 m!816633))

(declare-fun m!816635 () Bool)

(assert (=> b!876813 m!816635))

(declare-fun m!816637 () Bool)

(assert (=> b!876813 m!816637))

(assert (=> b!876813 m!816631))

(declare-fun m!816639 () Bool)

(assert (=> b!876813 m!816639))

(declare-fun m!816641 () Bool)

(assert (=> b!876813 m!816641))

(declare-fun m!816643 () Bool)

(assert (=> b!876813 m!816643))

(assert (=> b!876813 m!816639))

(declare-fun m!816645 () Bool)

(assert (=> b!876813 m!816645))

(declare-fun m!816647 () Bool)

(assert (=> b!876813 m!816647))

(declare-fun m!816649 () Bool)

(assert (=> b!876813 m!816649))

(assert (=> b!876813 m!816627))

(declare-fun m!816651 () Bool)

(assert (=> b!876813 m!816651))

(declare-fun m!816653 () Bool)

(assert (=> b!876813 m!816653))

(declare-fun m!816655 () Bool)

(assert (=> b!876813 m!816655))

(assert (=> b!876813 m!816647))

(declare-fun m!816657 () Bool)

(assert (=> mapNonEmpty!27752 m!816657))

(declare-fun m!816659 () Bool)

(assert (=> b!876817 m!816659))

(assert (=> b!876814 m!816651))

(assert (=> b!876814 m!816651))

(declare-fun m!816661 () Bool)

(assert (=> b!876814 m!816661))

(declare-fun m!816663 () Bool)

(assert (=> b!876814 m!816663))

(declare-fun m!816665 () Bool)

(assert (=> b!876815 m!816665))

(declare-fun m!816667 () Bool)

(assert (=> b!876825 m!816667))

(assert (=> bm!38790 m!816643))

(declare-fun m!816669 () Bool)

(assert (=> b!876819 m!816669))

(declare-fun m!816671 () Bool)

(assert (=> b!876812 m!816671))

(declare-fun m!816673 () Bool)

(assert (=> bm!38789 m!816673))

(check-sat (not b_next!15183) (not b!876820) tp_is_empty!17427 (not b!876813) (not b!876825) (not mapNonEmpty!27752) (not b_lambda!12251) (not b!876818) (not b!876819) (not bm!38790) (not b!876814) (not start!74440) b_and!25021 (not bm!38789) (not b!876815) (not b!876817))
(check-sat b_and!25021 (not b_next!15183))
(get-model)

(declare-fun b_lambda!12255 () Bool)

(assert (= b_lambda!12251 (or (and start!74440 b_free!15183) b_lambda!12255)))

(check-sat (not b_next!15183) (not b!876820) tp_is_empty!17427 (not b!876813) (not b!876825) (not mapNonEmpty!27752) (not b_lambda!12255) (not b!876818) (not b!876819) (not bm!38790) (not b!876814) (not start!74440) b_and!25021 (not bm!38789) (not b!876815) (not b!876817))
(check-sat b_and!25021 (not b_next!15183))
(get-model)

(declare-fun d!108621 () Bool)

(assert (=> d!108621 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876817 d!108621))

(declare-fun b!876883 () Bool)

(declare-fun e!488118 () Bool)

(declare-fun e!488116 () Bool)

(assert (=> b!876883 (= e!488118 e!488116)))

(declare-fun c!92630 () Bool)

(assert (=> b!876883 (= c!92630 (validKeyInArray!0 (select (arr!24517 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!876884 () Bool)

(declare-fun e!488117 () Bool)

(assert (=> b!876884 (= e!488116 e!488117)))

(declare-fun lt!396762 () (_ BitVec 64))

(assert (=> b!876884 (= lt!396762 (select (arr!24517 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!396761 () Unit!29986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50980 (_ BitVec 64) (_ BitVec 32)) Unit!29986)

(assert (=> b!876884 (= lt!396761 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396762 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!876884 (arrayContainsKey!0 _keys!868 lt!396762 #b00000000000000000000000000000000)))

(declare-fun lt!396760 () Unit!29986)

(assert (=> b!876884 (= lt!396760 lt!396761)))

(declare-fun res!595835 () Bool)

(declare-datatypes ((SeekEntryResult!8753 0))(
  ( (MissingZero!8753 (index!37383 (_ BitVec 32))) (Found!8753 (index!37384 (_ BitVec 32))) (Intermediate!8753 (undefined!9565 Bool) (index!37385 (_ BitVec 32)) (x!74306 (_ BitVec 32))) (Undefined!8753) (MissingVacant!8753 (index!37386 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50980 (_ BitVec 32)) SeekEntryResult!8753)

(assert (=> b!876884 (= res!595835 (= (seekEntryOrOpen!0 (select (arr!24517 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8753 #b00000000000000000000000000000000)))))

(assert (=> b!876884 (=> (not res!595835) (not e!488117))))

(declare-fun bm!38799 () Bool)

(declare-fun call!38802 () Bool)

(assert (=> bm!38799 (= call!38802 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108623 () Bool)

(declare-fun res!595834 () Bool)

(assert (=> d!108623 (=> res!595834 e!488118)))

(assert (=> d!108623 (= res!595834 (bvsge #b00000000000000000000000000000000 (size!24957 _keys!868)))))

(assert (=> d!108623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!488118)))

(declare-fun b!876885 () Bool)

(assert (=> b!876885 (= e!488117 call!38802)))

(declare-fun b!876886 () Bool)

(assert (=> b!876886 (= e!488116 call!38802)))

(assert (= (and d!108623 (not res!595834)) b!876883))

(assert (= (and b!876883 c!92630) b!876884))

(assert (= (and b!876883 (not c!92630)) b!876886))

(assert (= (and b!876884 res!595835) b!876885))

(assert (= (or b!876885 b!876886) bm!38799))

(declare-fun m!816731 () Bool)

(assert (=> b!876883 m!816731))

(assert (=> b!876883 m!816731))

(declare-fun m!816733 () Bool)

(assert (=> b!876883 m!816733))

(assert (=> b!876884 m!816731))

(declare-fun m!816735 () Bool)

(assert (=> b!876884 m!816735))

(declare-fun m!816737 () Bool)

(assert (=> b!876884 m!816737))

(assert (=> b!876884 m!816731))

(declare-fun m!816739 () Bool)

(assert (=> b!876884 m!816739))

(declare-fun m!816741 () Bool)

(assert (=> bm!38799 m!816741))

(assert (=> b!876825 d!108623))

(declare-fun b!876911 () Bool)

(declare-fun e!488138 () ListLongMap!10351)

(declare-fun call!38805 () ListLongMap!10351)

(assert (=> b!876911 (= e!488138 call!38805)))

(declare-fun d!108625 () Bool)

(declare-fun e!488137 () Bool)

(assert (=> d!108625 e!488137))

(declare-fun res!595845 () Bool)

(assert (=> d!108625 (=> (not res!595845) (not e!488137))))

(declare-fun lt!396780 () ListLongMap!10351)

(declare-fun contains!4248 (ListLongMap!10351 (_ BitVec 64)) Bool)

(assert (=> d!108625 (= res!595845 (not (contains!4248 lt!396780 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488136 () ListLongMap!10351)

(assert (=> d!108625 (= lt!396780 e!488136)))

(declare-fun c!92640 () Bool)

(assert (=> d!108625 (= c!92640 (bvsge from!1053 (size!24957 _keys!868)))))

(assert (=> d!108625 (validMask!0 mask!1196)))

(assert (=> d!108625 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396780)))

(declare-fun e!488139 () Bool)

(declare-fun b!876912 () Bool)

(assert (=> b!876912 (= e!488139 (= lt!396780 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876913 () Bool)

(declare-fun res!595846 () Bool)

(assert (=> b!876913 (=> (not res!595846) (not e!488137))))

(assert (=> b!876913 (= res!595846 (not (contains!4248 lt!396780 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876914 () Bool)

(assert (=> b!876914 (= e!488136 e!488138)))

(declare-fun c!92641 () Bool)

(assert (=> b!876914 (= c!92641 (validKeyInArray!0 (select (arr!24517 _keys!868) from!1053)))))

(declare-fun b!876915 () Bool)

(declare-fun lt!396782 () Unit!29986)

(declare-fun lt!396777 () Unit!29986)

(assert (=> b!876915 (= lt!396782 lt!396777)))

(declare-fun lt!396781 () (_ BitVec 64))

(declare-fun lt!396783 () (_ BitVec 64))

(declare-fun lt!396778 () ListLongMap!10351)

(declare-fun lt!396779 () V!28283)

(assert (=> b!876915 (not (contains!4248 (+!2491 lt!396778 (tuple2!11583 lt!396783 lt!396779)) lt!396781))))

(declare-fun addStillNotContains!202 (ListLongMap!10351 (_ BitVec 64) V!28283 (_ BitVec 64)) Unit!29986)

(assert (=> b!876915 (= lt!396777 (addStillNotContains!202 lt!396778 lt!396783 lt!396779 lt!396781))))

(assert (=> b!876915 (= lt!396781 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876915 (= lt!396779 (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876915 (= lt!396783 (select (arr!24517 _keys!868) from!1053))))

(assert (=> b!876915 (= lt!396778 call!38805)))

(assert (=> b!876915 (= e!488138 (+!2491 call!38805 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876916 () Bool)

(assert (=> b!876916 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24957 _keys!868)))))

(assert (=> b!876916 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24958 lt!396722)))))

(declare-fun e!488134 () Bool)

(declare-fun apply!377 (ListLongMap!10351 (_ BitVec 64)) V!28283)

(assert (=> b!876916 (= e!488134 (= (apply!377 lt!396780 (select (arr!24517 _keys!868) from!1053)) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876917 () Bool)

(declare-fun e!488135 () Bool)

(assert (=> b!876917 (= e!488137 e!488135)))

(declare-fun c!92642 () Bool)

(declare-fun e!488133 () Bool)

(assert (=> b!876917 (= c!92642 e!488133)))

(declare-fun res!595844 () Bool)

(assert (=> b!876917 (=> (not res!595844) (not e!488133))))

(assert (=> b!876917 (= res!595844 (bvslt from!1053 (size!24957 _keys!868)))))

(declare-fun b!876918 () Bool)

(assert (=> b!876918 (= e!488135 e!488139)))

(declare-fun c!92639 () Bool)

(assert (=> b!876918 (= c!92639 (bvslt from!1053 (size!24957 _keys!868)))))

(declare-fun b!876919 () Bool)

(assert (=> b!876919 (= e!488136 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38802 () Bool)

(assert (=> bm!38802 (= call!38805 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876920 () Bool)

(assert (=> b!876920 (= e!488133 (validKeyInArray!0 (select (arr!24517 _keys!868) from!1053)))))

(assert (=> b!876920 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!876921 () Bool)

(declare-fun isEmpty!663 (ListLongMap!10351) Bool)

(assert (=> b!876921 (= e!488139 (isEmpty!663 lt!396780))))

(declare-fun b!876922 () Bool)

(assert (=> b!876922 (= e!488135 e!488134)))

(assert (=> b!876922 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24957 _keys!868)))))

(declare-fun res!595847 () Bool)

(assert (=> b!876922 (= res!595847 (contains!4248 lt!396780 (select (arr!24517 _keys!868) from!1053)))))

(assert (=> b!876922 (=> (not res!595847) (not e!488134))))

(assert (= (and d!108625 c!92640) b!876919))

(assert (= (and d!108625 (not c!92640)) b!876914))

(assert (= (and b!876914 c!92641) b!876915))

(assert (= (and b!876914 (not c!92641)) b!876911))

(assert (= (or b!876915 b!876911) bm!38802))

(assert (= (and d!108625 res!595845) b!876913))

(assert (= (and b!876913 res!595846) b!876917))

(assert (= (and b!876917 res!595844) b!876920))

(assert (= (and b!876917 c!92642) b!876922))

(assert (= (and b!876917 (not c!92642)) b!876918))

(assert (= (and b!876922 res!595847) b!876916))

(assert (= (and b!876918 c!92639) b!876912))

(assert (= (and b!876918 (not c!92639)) b!876921))

(declare-fun b_lambda!12257 () Bool)

(assert (=> (not b_lambda!12257) (not b!876915)))

(assert (=> b!876915 t!24485))

(declare-fun b_and!25027 () Bool)

(assert (= b_and!25021 (and (=> t!24485 result!9505) b_and!25027)))

(declare-fun b_lambda!12259 () Bool)

(assert (=> (not b_lambda!12259) (not b!876916)))

(assert (=> b!876916 t!24485))

(declare-fun b_and!25029 () Bool)

(assert (= b_and!25027 (and (=> t!24485 result!9505) b_and!25029)))

(declare-fun m!816743 () Bool)

(assert (=> b!876913 m!816743))

(declare-fun m!816745 () Bool)

(assert (=> b!876915 m!816745))

(declare-fun m!816747 () Bool)

(assert (=> b!876915 m!816747))

(assert (=> b!876915 m!816653))

(declare-fun m!816749 () Bool)

(assert (=> b!876915 m!816749))

(declare-fun m!816751 () Bool)

(assert (=> b!876915 m!816751))

(assert (=> b!876915 m!816651))

(assert (=> b!876915 m!816747))

(assert (=> b!876915 m!816653))

(declare-fun m!816753 () Bool)

(assert (=> b!876915 m!816753))

(assert (=> b!876915 m!816749))

(declare-fun m!816755 () Bool)

(assert (=> b!876915 m!816755))

(assert (=> b!876920 m!816651))

(assert (=> b!876920 m!816651))

(assert (=> b!876920 m!816661))

(declare-fun m!816757 () Bool)

(assert (=> d!108625 m!816757))

(assert (=> d!108625 m!816665))

(assert (=> b!876914 m!816651))

(assert (=> b!876914 m!816651))

(assert (=> b!876914 m!816661))

(assert (=> b!876916 m!816747))

(assert (=> b!876916 m!816653))

(assert (=> b!876916 m!816651))

(declare-fun m!816759 () Bool)

(assert (=> b!876916 m!816759))

(assert (=> b!876916 m!816651))

(assert (=> b!876916 m!816747))

(assert (=> b!876916 m!816653))

(assert (=> b!876916 m!816753))

(declare-fun m!816761 () Bool)

(assert (=> b!876921 m!816761))

(declare-fun m!816763 () Bool)

(assert (=> bm!38802 m!816763))

(assert (=> b!876922 m!816651))

(assert (=> b!876922 m!816651))

(declare-fun m!816765 () Bool)

(assert (=> b!876922 m!816765))

(assert (=> b!876912 m!816763))

(assert (=> b!876818 d!108625))

(declare-fun b!876923 () Bool)

(declare-fun e!488145 () ListLongMap!10351)

(declare-fun call!38806 () ListLongMap!10351)

(assert (=> b!876923 (= e!488145 call!38806)))

(declare-fun d!108627 () Bool)

(declare-fun e!488144 () Bool)

(assert (=> d!108627 e!488144))

(declare-fun res!595849 () Bool)

(assert (=> d!108627 (=> (not res!595849) (not e!488144))))

(declare-fun lt!396787 () ListLongMap!10351)

(assert (=> d!108627 (= res!595849 (not (contains!4248 lt!396787 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488143 () ListLongMap!10351)

(assert (=> d!108627 (= lt!396787 e!488143)))

(declare-fun c!92644 () Bool)

(assert (=> d!108627 (= c!92644 (bvsge from!1053 (size!24957 _keys!868)))))

(assert (=> d!108627 (validMask!0 mask!1196)))

(assert (=> d!108627 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396787)))

(declare-fun b!876924 () Bool)

(declare-fun e!488146 () Bool)

(assert (=> b!876924 (= e!488146 (= lt!396787 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876925 () Bool)

(declare-fun res!595850 () Bool)

(assert (=> b!876925 (=> (not res!595850) (not e!488144))))

(assert (=> b!876925 (= res!595850 (not (contains!4248 lt!396787 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876926 () Bool)

(assert (=> b!876926 (= e!488143 e!488145)))

(declare-fun c!92645 () Bool)

(assert (=> b!876926 (= c!92645 (validKeyInArray!0 (select (arr!24517 _keys!868) from!1053)))))

(declare-fun b!876927 () Bool)

(declare-fun lt!396789 () Unit!29986)

(declare-fun lt!396784 () Unit!29986)

(assert (=> b!876927 (= lt!396789 lt!396784)))

(declare-fun lt!396786 () V!28283)

(declare-fun lt!396785 () ListLongMap!10351)

(declare-fun lt!396788 () (_ BitVec 64))

(declare-fun lt!396790 () (_ BitVec 64))

(assert (=> b!876927 (not (contains!4248 (+!2491 lt!396785 (tuple2!11583 lt!396790 lt!396786)) lt!396788))))

(assert (=> b!876927 (= lt!396784 (addStillNotContains!202 lt!396785 lt!396790 lt!396786 lt!396788))))

(assert (=> b!876927 (= lt!396788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876927 (= lt!396786 (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876927 (= lt!396790 (select (arr!24517 _keys!868) from!1053))))

(assert (=> b!876927 (= lt!396785 call!38806)))

(assert (=> b!876927 (= e!488145 (+!2491 call!38806 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876928 () Bool)

(assert (=> b!876928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24957 _keys!868)))))

(assert (=> b!876928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24958 _values!688)))))

(declare-fun e!488141 () Bool)

(assert (=> b!876928 (= e!488141 (= (apply!377 lt!396787 (select (arr!24517 _keys!868) from!1053)) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876929 () Bool)

(declare-fun e!488142 () Bool)

(assert (=> b!876929 (= e!488144 e!488142)))

(declare-fun c!92646 () Bool)

(declare-fun e!488140 () Bool)

(assert (=> b!876929 (= c!92646 e!488140)))

(declare-fun res!595848 () Bool)

(assert (=> b!876929 (=> (not res!595848) (not e!488140))))

(assert (=> b!876929 (= res!595848 (bvslt from!1053 (size!24957 _keys!868)))))

(declare-fun b!876930 () Bool)

(assert (=> b!876930 (= e!488142 e!488146)))

(declare-fun c!92643 () Bool)

(assert (=> b!876930 (= c!92643 (bvslt from!1053 (size!24957 _keys!868)))))

(declare-fun b!876931 () Bool)

(assert (=> b!876931 (= e!488143 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38803 () Bool)

(assert (=> bm!38803 (= call!38806 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876932 () Bool)

(assert (=> b!876932 (= e!488140 (validKeyInArray!0 (select (arr!24517 _keys!868) from!1053)))))

(assert (=> b!876932 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!876933 () Bool)

(assert (=> b!876933 (= e!488146 (isEmpty!663 lt!396787))))

(declare-fun b!876934 () Bool)

(assert (=> b!876934 (= e!488142 e!488141)))

(assert (=> b!876934 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24957 _keys!868)))))

(declare-fun res!595851 () Bool)

(assert (=> b!876934 (= res!595851 (contains!4248 lt!396787 (select (arr!24517 _keys!868) from!1053)))))

(assert (=> b!876934 (=> (not res!595851) (not e!488141))))

(assert (= (and d!108627 c!92644) b!876931))

(assert (= (and d!108627 (not c!92644)) b!876926))

(assert (= (and b!876926 c!92645) b!876927))

(assert (= (and b!876926 (not c!92645)) b!876923))

(assert (= (or b!876927 b!876923) bm!38803))

(assert (= (and d!108627 res!595849) b!876925))

(assert (= (and b!876925 res!595850) b!876929))

(assert (= (and b!876929 res!595848) b!876932))

(assert (= (and b!876929 c!92646) b!876934))

(assert (= (and b!876929 (not c!92646)) b!876930))

(assert (= (and b!876934 res!595851) b!876928))

(assert (= (and b!876930 c!92643) b!876924))

(assert (= (and b!876930 (not c!92643)) b!876933))

(declare-fun b_lambda!12261 () Bool)

(assert (=> (not b_lambda!12261) (not b!876927)))

(assert (=> b!876927 t!24485))

(declare-fun b_and!25031 () Bool)

(assert (= b_and!25029 (and (=> t!24485 result!9505) b_and!25031)))

(declare-fun b_lambda!12263 () Bool)

(assert (=> (not b_lambda!12263) (not b!876928)))

(assert (=> b!876928 t!24485))

(declare-fun b_and!25033 () Bool)

(assert (= b_and!25031 (and (=> t!24485 result!9505) b_and!25033)))

(declare-fun m!816767 () Bool)

(assert (=> b!876925 m!816767))

(declare-fun m!816769 () Bool)

(assert (=> b!876927 m!816769))

(assert (=> b!876927 m!816647))

(assert (=> b!876927 m!816653))

(declare-fun m!816771 () Bool)

(assert (=> b!876927 m!816771))

(declare-fun m!816773 () Bool)

(assert (=> b!876927 m!816773))

(assert (=> b!876927 m!816651))

(assert (=> b!876927 m!816647))

(assert (=> b!876927 m!816653))

(declare-fun m!816775 () Bool)

(assert (=> b!876927 m!816775))

(assert (=> b!876927 m!816771))

(declare-fun m!816777 () Bool)

(assert (=> b!876927 m!816777))

(assert (=> b!876932 m!816651))

(assert (=> b!876932 m!816651))

(assert (=> b!876932 m!816661))

(declare-fun m!816779 () Bool)

(assert (=> d!108627 m!816779))

(assert (=> d!108627 m!816665))

(assert (=> b!876926 m!816651))

(assert (=> b!876926 m!816651))

(assert (=> b!876926 m!816661))

(assert (=> b!876928 m!816647))

(assert (=> b!876928 m!816653))

(assert (=> b!876928 m!816651))

(declare-fun m!816781 () Bool)

(assert (=> b!876928 m!816781))

(assert (=> b!876928 m!816651))

(assert (=> b!876928 m!816647))

(assert (=> b!876928 m!816653))

(assert (=> b!876928 m!816775))

(declare-fun m!816783 () Bool)

(assert (=> b!876933 m!816783))

(declare-fun m!816785 () Bool)

(assert (=> bm!38803 m!816785))

(assert (=> b!876934 m!816651))

(assert (=> b!876934 m!816651))

(declare-fun m!816787 () Bool)

(assert (=> b!876934 m!816787))

(assert (=> b!876924 m!816785))

(assert (=> b!876818 d!108627))

(declare-fun d!108629 () Bool)

(assert (=> d!108629 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!876815 d!108629))

(declare-fun b!876935 () Bool)

(declare-fun e!488152 () ListLongMap!10351)

(declare-fun call!38807 () ListLongMap!10351)

(assert (=> b!876935 (= e!488152 call!38807)))

(declare-fun d!108631 () Bool)

(declare-fun e!488151 () Bool)

(assert (=> d!108631 e!488151))

(declare-fun res!595853 () Bool)

(assert (=> d!108631 (=> (not res!595853) (not e!488151))))

(declare-fun lt!396794 () ListLongMap!10351)

(assert (=> d!108631 (= res!595853 (not (contains!4248 lt!396794 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488150 () ListLongMap!10351)

(assert (=> d!108631 (= lt!396794 e!488150)))

(declare-fun c!92648 () Bool)

(assert (=> d!108631 (= c!92648 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(assert (=> d!108631 (validMask!0 mask!1196)))

(assert (=> d!108631 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396794)))

(declare-fun e!488153 () Bool)

(declare-fun b!876936 () Bool)

(assert (=> b!876936 (= e!488153 (= lt!396794 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876937 () Bool)

(declare-fun res!595854 () Bool)

(assert (=> b!876937 (=> (not res!595854) (not e!488151))))

(assert (=> b!876937 (= res!595854 (not (contains!4248 lt!396794 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876938 () Bool)

(assert (=> b!876938 (= e!488150 e!488152)))

(declare-fun c!92649 () Bool)

(assert (=> b!876938 (= c!92649 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!876939 () Bool)

(declare-fun lt!396796 () Unit!29986)

(declare-fun lt!396791 () Unit!29986)

(assert (=> b!876939 (= lt!396796 lt!396791)))

(declare-fun lt!396795 () (_ BitVec 64))

(declare-fun lt!396793 () V!28283)

(declare-fun lt!396792 () ListLongMap!10351)

(declare-fun lt!396797 () (_ BitVec 64))

(assert (=> b!876939 (not (contains!4248 (+!2491 lt!396792 (tuple2!11583 lt!396797 lt!396793)) lt!396795))))

(assert (=> b!876939 (= lt!396791 (addStillNotContains!202 lt!396792 lt!396797 lt!396793 lt!396795))))

(assert (=> b!876939 (= lt!396795 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876939 (= lt!396793 (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876939 (= lt!396797 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!876939 (= lt!396792 call!38807)))

(assert (=> b!876939 (= e!488152 (+!2491 call!38807 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876940 () Bool)

(assert (=> b!876940 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(assert (=> b!876940 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24958 lt!396722)))))

(declare-fun e!488148 () Bool)

(assert (=> b!876940 (= e!488148 (= (apply!377 lt!396794 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876941 () Bool)

(declare-fun e!488149 () Bool)

(assert (=> b!876941 (= e!488151 e!488149)))

(declare-fun c!92650 () Bool)

(declare-fun e!488147 () Bool)

(assert (=> b!876941 (= c!92650 e!488147)))

(declare-fun res!595852 () Bool)

(assert (=> b!876941 (=> (not res!595852) (not e!488147))))

(assert (=> b!876941 (= res!595852 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun b!876942 () Bool)

(assert (=> b!876942 (= e!488149 e!488153)))

(declare-fun c!92647 () Bool)

(assert (=> b!876942 (= c!92647 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun b!876943 () Bool)

(assert (=> b!876943 (= e!488150 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38804 () Bool)

(assert (=> bm!38804 (= call!38807 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876944 () Bool)

(assert (=> b!876944 (= e!488147 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876944 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!876945 () Bool)

(assert (=> b!876945 (= e!488153 (isEmpty!663 lt!396794))))

(declare-fun b!876946 () Bool)

(assert (=> b!876946 (= e!488149 e!488148)))

(assert (=> b!876946 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun res!595855 () Bool)

(assert (=> b!876946 (= res!595855 (contains!4248 lt!396794 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876946 (=> (not res!595855) (not e!488148))))

(assert (= (and d!108631 c!92648) b!876943))

(assert (= (and d!108631 (not c!92648)) b!876938))

(assert (= (and b!876938 c!92649) b!876939))

(assert (= (and b!876938 (not c!92649)) b!876935))

(assert (= (or b!876939 b!876935) bm!38804))

(assert (= (and d!108631 res!595853) b!876937))

(assert (= (and b!876937 res!595854) b!876941))

(assert (= (and b!876941 res!595852) b!876944))

(assert (= (and b!876941 c!92650) b!876946))

(assert (= (and b!876941 (not c!92650)) b!876942))

(assert (= (and b!876946 res!595855) b!876940))

(assert (= (and b!876942 c!92647) b!876936))

(assert (= (and b!876942 (not c!92647)) b!876945))

(declare-fun b_lambda!12265 () Bool)

(assert (=> (not b_lambda!12265) (not b!876939)))

(assert (=> b!876939 t!24485))

(declare-fun b_and!25035 () Bool)

(assert (= b_and!25033 (and (=> t!24485 result!9505) b_and!25035)))

(declare-fun b_lambda!12267 () Bool)

(assert (=> (not b_lambda!12267) (not b!876940)))

(assert (=> b!876940 t!24485))

(declare-fun b_and!25037 () Bool)

(assert (= b_and!25035 (and (=> t!24485 result!9505) b_and!25037)))

(declare-fun m!816789 () Bool)

(assert (=> b!876937 m!816789))

(declare-fun m!816791 () Bool)

(assert (=> b!876939 m!816791))

(declare-fun m!816793 () Bool)

(assert (=> b!876939 m!816793))

(assert (=> b!876939 m!816653))

(declare-fun m!816795 () Bool)

(assert (=> b!876939 m!816795))

(declare-fun m!816797 () Bool)

(assert (=> b!876939 m!816797))

(declare-fun m!816799 () Bool)

(assert (=> b!876939 m!816799))

(assert (=> b!876939 m!816793))

(assert (=> b!876939 m!816653))

(declare-fun m!816801 () Bool)

(assert (=> b!876939 m!816801))

(assert (=> b!876939 m!816795))

(declare-fun m!816803 () Bool)

(assert (=> b!876939 m!816803))

(assert (=> b!876944 m!816799))

(assert (=> b!876944 m!816799))

(declare-fun m!816805 () Bool)

(assert (=> b!876944 m!816805))

(declare-fun m!816807 () Bool)

(assert (=> d!108631 m!816807))

(assert (=> d!108631 m!816665))

(assert (=> b!876938 m!816799))

(assert (=> b!876938 m!816799))

(assert (=> b!876938 m!816805))

(assert (=> b!876940 m!816793))

(assert (=> b!876940 m!816653))

(assert (=> b!876940 m!816799))

(declare-fun m!816809 () Bool)

(assert (=> b!876940 m!816809))

(assert (=> b!876940 m!816799))

(assert (=> b!876940 m!816793))

(assert (=> b!876940 m!816653))

(assert (=> b!876940 m!816801))

(declare-fun m!816811 () Bool)

(assert (=> b!876945 m!816811))

(declare-fun m!816813 () Bool)

(assert (=> bm!38804 m!816813))

(assert (=> b!876946 m!816799))

(assert (=> b!876946 m!816799))

(declare-fun m!816815 () Bool)

(assert (=> b!876946 m!816815))

(assert (=> b!876936 m!816813))

(assert (=> bm!38790 d!108631))

(assert (=> b!876813 d!108631))

(declare-fun d!108633 () Bool)

(declare-fun e!488156 () Bool)

(assert (=> d!108633 e!488156))

(declare-fun res!595861 () Bool)

(assert (=> d!108633 (=> (not res!595861) (not e!488156))))

(declare-fun lt!396808 () ListLongMap!10351)

(assert (=> d!108633 (= res!595861 (contains!4248 lt!396808 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun lt!396807 () List!17399)

(assert (=> d!108633 (= lt!396808 (ListLongMap!10352 lt!396807))))

(declare-fun lt!396806 () Unit!29986)

(declare-fun lt!396809 () Unit!29986)

(assert (=> d!108633 (= lt!396806 lt!396809)))

(declare-datatypes ((Option!425 0))(
  ( (Some!424 (v!11199 V!28283)) (None!423) )
))
(declare-fun getValueByKey!419 (List!17399 (_ BitVec 64)) Option!425)

(assert (=> d!108633 (= (getValueByKey!419 lt!396807 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun lemmaContainsTupThenGetReturnValue!233 (List!17399 (_ BitVec 64) V!28283) Unit!29986)

(assert (=> d!108633 (= lt!396809 (lemmaContainsTupThenGetReturnValue!233 lt!396807 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun insertStrictlySorted!272 (List!17399 (_ BitVec 64) V!28283) List!17399)

(assert (=> d!108633 (= lt!396807 (insertStrictlySorted!272 (toList!5191 lt!396719) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(assert (=> d!108633 (= (+!2491 lt!396719 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) lt!396808)))

(declare-fun b!876951 () Bool)

(declare-fun res!595860 () Bool)

(assert (=> b!876951 (=> (not res!595860) (not e!488156))))

(assert (=> b!876951 (= res!595860 (= (getValueByKey!419 (toList!5191 lt!396808) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(declare-fun b!876952 () Bool)

(declare-fun contains!4249 (List!17399 tuple2!11582) Bool)

(assert (=> b!876952 (= e!488156 (contains!4249 (toList!5191 lt!396808) (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))

(assert (= (and d!108633 res!595861) b!876951))

(assert (= (and b!876951 res!595860) b!876952))

(declare-fun m!816817 () Bool)

(assert (=> d!108633 m!816817))

(declare-fun m!816819 () Bool)

(assert (=> d!108633 m!816819))

(declare-fun m!816821 () Bool)

(assert (=> d!108633 m!816821))

(declare-fun m!816823 () Bool)

(assert (=> d!108633 m!816823))

(declare-fun m!816825 () Bool)

(assert (=> b!876951 m!816825))

(declare-fun m!816827 () Bool)

(assert (=> b!876952 m!816827))

(assert (=> b!876813 d!108633))

(declare-fun d!108635 () Bool)

(assert (=> d!108635 (= (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396717)) (+!2491 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)) (tuple2!11583 k0!854 lt!396717)))))

(declare-fun lt!396812 () Unit!29986)

(declare-fun choose!1430 (ListLongMap!10351 (_ BitVec 64) V!28283 V!28283) Unit!29986)

(assert (=> d!108635 (= lt!396812 (choose!1430 lt!396719 k0!854 lt!396715 lt!396717))))

(assert (=> d!108635 (= (addSameAsAddTwiceSameKeyDiffValues!324 lt!396719 k0!854 lt!396715 lt!396717) lt!396812)))

(declare-fun bs!24619 () Bool)

(assert (= bs!24619 d!108635))

(declare-fun m!816829 () Bool)

(assert (=> bs!24619 m!816829))

(assert (=> bs!24619 m!816639))

(assert (=> bs!24619 m!816639))

(declare-fun m!816831 () Bool)

(assert (=> bs!24619 m!816831))

(declare-fun m!816833 () Bool)

(assert (=> bs!24619 m!816833))

(assert (=> b!876813 d!108635))

(declare-fun d!108637 () Bool)

(declare-fun e!488157 () Bool)

(assert (=> d!108637 e!488157))

(declare-fun res!595863 () Bool)

(assert (=> d!108637 (=> (not res!595863) (not e!488157))))

(declare-fun lt!396815 () ListLongMap!10351)

(assert (=> d!108637 (= res!595863 (contains!4248 lt!396815 (_1!5802 lt!396716)))))

(declare-fun lt!396814 () List!17399)

(assert (=> d!108637 (= lt!396815 (ListLongMap!10352 lt!396814))))

(declare-fun lt!396813 () Unit!29986)

(declare-fun lt!396816 () Unit!29986)

(assert (=> d!108637 (= lt!396813 lt!396816)))

(assert (=> d!108637 (= (getValueByKey!419 lt!396814 (_1!5802 lt!396716)) (Some!424 (_2!5802 lt!396716)))))

(assert (=> d!108637 (= lt!396816 (lemmaContainsTupThenGetReturnValue!233 lt!396814 (_1!5802 lt!396716) (_2!5802 lt!396716)))))

(assert (=> d!108637 (= lt!396814 (insertStrictlySorted!272 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715))) (_1!5802 lt!396716) (_2!5802 lt!396716)))))

(assert (=> d!108637 (= (+!2491 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)) lt!396716) lt!396815)))

(declare-fun b!876953 () Bool)

(declare-fun res!595862 () Bool)

(assert (=> b!876953 (=> (not res!595862) (not e!488157))))

(assert (=> b!876953 (= res!595862 (= (getValueByKey!419 (toList!5191 lt!396815) (_1!5802 lt!396716)) (Some!424 (_2!5802 lt!396716))))))

(declare-fun b!876954 () Bool)

(assert (=> b!876954 (= e!488157 (contains!4249 (toList!5191 lt!396815) lt!396716))))

(assert (= (and d!108637 res!595863) b!876953))

(assert (= (and b!876953 res!595862) b!876954))

(declare-fun m!816835 () Bool)

(assert (=> d!108637 m!816835))

(declare-fun m!816837 () Bool)

(assert (=> d!108637 m!816837))

(declare-fun m!816839 () Bool)

(assert (=> d!108637 m!816839))

(declare-fun m!816841 () Bool)

(assert (=> d!108637 m!816841))

(declare-fun m!816843 () Bool)

(assert (=> b!876953 m!816843))

(declare-fun m!816845 () Bool)

(assert (=> b!876954 m!816845))

(assert (=> b!876813 d!108637))

(declare-fun d!108639 () Bool)

(declare-fun c!92653 () Bool)

(assert (=> d!108639 (= c!92653 ((_ is ValueCellFull!8274) (select (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) from!1053)))))

(declare-fun e!488160 () V!28283)

(assert (=> d!108639 (= (get!12894 (select (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) from!1053) lt!396714) e!488160)))

(declare-fun b!876959 () Bool)

(declare-fun get!12896 (ValueCell!8274 V!28283) V!28283)

(assert (=> b!876959 (= e!488160 (get!12896 (select (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) from!1053) lt!396714))))

(declare-fun b!876960 () Bool)

(declare-fun get!12897 (ValueCell!8274 V!28283) V!28283)

(assert (=> b!876960 (= e!488160 (get!12897 (select (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) from!1053) lt!396714))))

(assert (= (and d!108639 c!92653) b!876959))

(assert (= (and d!108639 (not c!92653)) b!876960))

(assert (=> b!876959 m!816631))

(declare-fun m!816847 () Bool)

(assert (=> b!876959 m!816847))

(assert (=> b!876960 m!816631))

(declare-fun m!816849 () Bool)

(assert (=> b!876960 m!816849))

(assert (=> b!876813 d!108639))

(declare-fun d!108641 () Bool)

(declare-fun e!488161 () Bool)

(assert (=> d!108641 e!488161))

(declare-fun res!595865 () Bool)

(assert (=> d!108641 (=> (not res!595865) (not e!488161))))

(declare-fun lt!396819 () ListLongMap!10351)

(assert (=> d!108641 (= res!595865 (contains!4248 lt!396819 (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun lt!396818 () List!17399)

(assert (=> d!108641 (= lt!396819 (ListLongMap!10352 lt!396818))))

(declare-fun lt!396817 () Unit!29986)

(declare-fun lt!396820 () Unit!29986)

(assert (=> d!108641 (= lt!396817 lt!396820)))

(assert (=> d!108641 (= (getValueByKey!419 lt!396818 (_1!5802 (tuple2!11583 k0!854 v!557))) (Some!424 (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108641 (= lt!396820 (lemmaContainsTupThenGetReturnValue!233 lt!396818 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108641 (= lt!396818 (insertStrictlySorted!272 (toList!5191 lt!396718) (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108641 (= (+!2491 lt!396718 (tuple2!11583 k0!854 v!557)) lt!396819)))

(declare-fun b!876961 () Bool)

(declare-fun res!595864 () Bool)

(assert (=> b!876961 (=> (not res!595864) (not e!488161))))

(assert (=> b!876961 (= res!595864 (= (getValueByKey!419 (toList!5191 lt!396819) (_1!5802 (tuple2!11583 k0!854 v!557))) (Some!424 (_2!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun b!876962 () Bool)

(assert (=> b!876962 (= e!488161 (contains!4249 (toList!5191 lt!396819) (tuple2!11583 k0!854 v!557)))))

(assert (= (and d!108641 res!595865) b!876961))

(assert (= (and b!876961 res!595864) b!876962))

(declare-fun m!816851 () Bool)

(assert (=> d!108641 m!816851))

(declare-fun m!816853 () Bool)

(assert (=> d!108641 m!816853))

(declare-fun m!816855 () Bool)

(assert (=> d!108641 m!816855))

(declare-fun m!816857 () Bool)

(assert (=> d!108641 m!816857))

(declare-fun m!816859 () Bool)

(assert (=> b!876961 m!816859))

(declare-fun m!816861 () Bool)

(assert (=> b!876962 m!816861))

(assert (=> b!876813 d!108641))

(declare-fun d!108643 () Bool)

(declare-fun c!92654 () Bool)

(assert (=> d!108643 (= c!92654 ((_ is ValueCellFull!8274) (select (arr!24518 _values!688) from!1053)))))

(declare-fun e!488162 () V!28283)

(assert (=> d!108643 (= (get!12894 (select (arr!24518 _values!688) from!1053) lt!396714) e!488162)))

(declare-fun b!876963 () Bool)

(assert (=> b!876963 (= e!488162 (get!12896 (select (arr!24518 _values!688) from!1053) lt!396714))))

(declare-fun b!876964 () Bool)

(assert (=> b!876964 (= e!488162 (get!12897 (select (arr!24518 _values!688) from!1053) lt!396714))))

(assert (= (and d!108643 c!92654) b!876963))

(assert (= (and d!108643 (not c!92654)) b!876964))

(assert (=> b!876963 m!816647))

(declare-fun m!816863 () Bool)

(assert (=> b!876963 m!816863))

(assert (=> b!876964 m!816647))

(declare-fun m!816865 () Bool)

(assert (=> b!876964 m!816865))

(assert (=> b!876813 d!108643))

(declare-fun d!108645 () Bool)

(declare-fun e!488163 () Bool)

(assert (=> d!108645 e!488163))

(declare-fun res!595867 () Bool)

(assert (=> d!108645 (=> (not res!595867) (not e!488163))))

(declare-fun lt!396823 () ListLongMap!10351)

(assert (=> d!108645 (= res!595867 (contains!4248 lt!396823 (_1!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun lt!396822 () List!17399)

(assert (=> d!108645 (= lt!396823 (ListLongMap!10352 lt!396822))))

(declare-fun lt!396821 () Unit!29986)

(declare-fun lt!396824 () Unit!29986)

(assert (=> d!108645 (= lt!396821 lt!396824)))

(assert (=> d!108645 (= (getValueByKey!419 lt!396822 (_1!5802 (tuple2!11583 k0!854 lt!396715))) (Some!424 (_2!5802 (tuple2!11583 k0!854 lt!396715))))))

(assert (=> d!108645 (= lt!396824 (lemmaContainsTupThenGetReturnValue!233 lt!396822 (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715))))))

(assert (=> d!108645 (= lt!396822 (insertStrictlySorted!272 (toList!5191 lt!396719) (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715))))))

(assert (=> d!108645 (= (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)) lt!396823)))

(declare-fun b!876965 () Bool)

(declare-fun res!595866 () Bool)

(assert (=> b!876965 (=> (not res!595866) (not e!488163))))

(assert (=> b!876965 (= res!595866 (= (getValueByKey!419 (toList!5191 lt!396823) (_1!5802 (tuple2!11583 k0!854 lt!396715))) (Some!424 (_2!5802 (tuple2!11583 k0!854 lt!396715)))))))

(declare-fun b!876966 () Bool)

(assert (=> b!876966 (= e!488163 (contains!4249 (toList!5191 lt!396823) (tuple2!11583 k0!854 lt!396715)))))

(assert (= (and d!108645 res!595867) b!876965))

(assert (= (and b!876965 res!595866) b!876966))

(declare-fun m!816867 () Bool)

(assert (=> d!108645 m!816867))

(declare-fun m!816869 () Bool)

(assert (=> d!108645 m!816869))

(declare-fun m!816871 () Bool)

(assert (=> d!108645 m!816871))

(declare-fun m!816873 () Bool)

(assert (=> d!108645 m!816873))

(declare-fun m!816875 () Bool)

(assert (=> b!876965 m!816875))

(declare-fun m!816877 () Bool)

(assert (=> b!876966 m!816877))

(assert (=> b!876813 d!108645))

(declare-fun d!108647 () Bool)

(declare-fun e!488164 () Bool)

(assert (=> d!108647 e!488164))

(declare-fun res!595869 () Bool)

(assert (=> d!108647 (=> (not res!595869) (not e!488164))))

(declare-fun lt!396827 () ListLongMap!10351)

(assert (=> d!108647 (= res!595869 (contains!4248 lt!396827 (_1!5802 lt!396716)))))

(declare-fun lt!396826 () List!17399)

(assert (=> d!108647 (= lt!396827 (ListLongMap!10352 lt!396826))))

(declare-fun lt!396825 () Unit!29986)

(declare-fun lt!396828 () Unit!29986)

(assert (=> d!108647 (= lt!396825 lt!396828)))

(assert (=> d!108647 (= (getValueByKey!419 lt!396826 (_1!5802 lt!396716)) (Some!424 (_2!5802 lt!396716)))))

(assert (=> d!108647 (= lt!396828 (lemmaContainsTupThenGetReturnValue!233 lt!396826 (_1!5802 lt!396716) (_2!5802 lt!396716)))))

(assert (=> d!108647 (= lt!396826 (insertStrictlySorted!272 (toList!5191 lt!396719) (_1!5802 lt!396716) (_2!5802 lt!396716)))))

(assert (=> d!108647 (= (+!2491 lt!396719 lt!396716) lt!396827)))

(declare-fun b!876967 () Bool)

(declare-fun res!595868 () Bool)

(assert (=> b!876967 (=> (not res!595868) (not e!488164))))

(assert (=> b!876967 (= res!595868 (= (getValueByKey!419 (toList!5191 lt!396827) (_1!5802 lt!396716)) (Some!424 (_2!5802 lt!396716))))))

(declare-fun b!876968 () Bool)

(assert (=> b!876968 (= e!488164 (contains!4249 (toList!5191 lt!396827) lt!396716))))

(assert (= (and d!108647 res!595869) b!876967))

(assert (= (and b!876967 res!595868) b!876968))

(declare-fun m!816879 () Bool)

(assert (=> d!108647 m!816879))

(declare-fun m!816881 () Bool)

(assert (=> d!108647 m!816881))

(declare-fun m!816883 () Bool)

(assert (=> d!108647 m!816883))

(declare-fun m!816885 () Bool)

(assert (=> d!108647 m!816885))

(declare-fun m!816887 () Bool)

(assert (=> b!876967 m!816887))

(declare-fun m!816889 () Bool)

(assert (=> b!876968 m!816889))

(assert (=> b!876813 d!108647))

(declare-fun d!108649 () Bool)

(assert (=> d!108649 (= (array_inv!19324 _keys!868) (bvsge (size!24957 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74440 d!108649))

(declare-fun d!108651 () Bool)

(assert (=> d!108651 (= (array_inv!19325 _values!688) (bvsge (size!24958 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74440 d!108651))

(declare-fun d!108653 () Bool)

(assert (=> d!108653 (= (validKeyInArray!0 (select (arr!24517 _keys!868) from!1053)) (and (not (= (select (arr!24517 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24517 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876814 d!108653))

(declare-fun call!38813 () ListLongMap!10351)

(declare-fun bm!38809 () Bool)

(assert (=> bm!38809 (= call!38813 (getCurrentListMapNoExtraKeys!3158 _keys!868 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun e!488169 () Bool)

(declare-fun b!876975 () Bool)

(declare-fun call!38812 () ListLongMap!10351)

(assert (=> b!876975 (= e!488169 (= call!38813 (+!2491 call!38812 (tuple2!11583 k0!854 v!557))))))

(declare-fun bm!38810 () Bool)

(assert (=> bm!38810 (= call!38812 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!108655 () Bool)

(declare-fun e!488170 () Bool)

(assert (=> d!108655 e!488170))

(declare-fun res!595872 () Bool)

(assert (=> d!108655 (=> (not res!595872) (not e!488170))))

(assert (=> d!108655 (= res!595872 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24958 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24958 _values!688))))))))

(declare-fun lt!396831 () Unit!29986)

(declare-fun choose!1431 (array!50980 array!50982 (_ BitVec 32) (_ BitVec 32) V!28283 V!28283 (_ BitVec 32) (_ BitVec 64) V!28283 (_ BitVec 32) Int) Unit!29986)

(assert (=> d!108655 (= lt!396831 (choose!1431 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108655 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(assert (=> d!108655 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396831)))

(declare-fun b!876976 () Bool)

(assert (=> b!876976 (= e!488169 (= call!38813 call!38812))))

(declare-fun b!876977 () Bool)

(assert (=> b!876977 (= e!488170 e!488169)))

(declare-fun c!92657 () Bool)

(assert (=> b!876977 (= c!92657 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (= (and d!108655 res!595872) b!876977))

(assert (= (and b!876977 c!92657) b!876975))

(assert (= (and b!876977 (not c!92657)) b!876976))

(assert (= (or b!876975 b!876976) bm!38810))

(assert (= (or b!876975 b!876976) bm!38809))

(assert (=> bm!38809 m!816627))

(declare-fun m!816891 () Bool)

(assert (=> bm!38809 m!816891))

(declare-fun m!816893 () Bool)

(assert (=> b!876975 m!816893))

(assert (=> bm!38810 m!816673))

(declare-fun m!816895 () Bool)

(assert (=> d!108655 m!816895))

(assert (=> b!876814 d!108655))

(declare-fun b!876978 () Bool)

(declare-fun e!488176 () ListLongMap!10351)

(declare-fun call!38814 () ListLongMap!10351)

(assert (=> b!876978 (= e!488176 call!38814)))

(declare-fun d!108657 () Bool)

(declare-fun e!488175 () Bool)

(assert (=> d!108657 e!488175))

(declare-fun res!595874 () Bool)

(assert (=> d!108657 (=> (not res!595874) (not e!488175))))

(declare-fun lt!396835 () ListLongMap!10351)

(assert (=> d!108657 (= res!595874 (not (contains!4248 lt!396835 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488174 () ListLongMap!10351)

(assert (=> d!108657 (= lt!396835 e!488174)))

(declare-fun c!92659 () Bool)

(assert (=> d!108657 (= c!92659 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(assert (=> d!108657 (validMask!0 mask!1196)))

(assert (=> d!108657 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396835)))

(declare-fun e!488177 () Bool)

(declare-fun b!876979 () Bool)

(assert (=> b!876979 (= e!488177 (= lt!396835 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!876980 () Bool)

(declare-fun res!595875 () Bool)

(assert (=> b!876980 (=> (not res!595875) (not e!488175))))

(assert (=> b!876980 (= res!595875 (not (contains!4248 lt!396835 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!876981 () Bool)

(assert (=> b!876981 (= e!488174 e!488176)))

(declare-fun c!92660 () Bool)

(assert (=> b!876981 (= c!92660 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!876982 () Bool)

(declare-fun lt!396837 () Unit!29986)

(declare-fun lt!396832 () Unit!29986)

(assert (=> b!876982 (= lt!396837 lt!396832)))

(declare-fun lt!396836 () (_ BitVec 64))

(declare-fun lt!396838 () (_ BitVec 64))

(declare-fun lt!396834 () V!28283)

(declare-fun lt!396833 () ListLongMap!10351)

(assert (=> b!876982 (not (contains!4248 (+!2491 lt!396833 (tuple2!11583 lt!396838 lt!396834)) lt!396836))))

(assert (=> b!876982 (= lt!396832 (addStillNotContains!202 lt!396833 lt!396838 lt!396834 lt!396836))))

(assert (=> b!876982 (= lt!396836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!876982 (= lt!396834 (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!876982 (= lt!396838 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!876982 (= lt!396833 call!38814)))

(assert (=> b!876982 (= e!488176 (+!2491 call!38814 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!876983 () Bool)

(assert (=> b!876983 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(assert (=> b!876983 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24958 _values!688)))))

(declare-fun e!488172 () Bool)

(assert (=> b!876983 (= e!488172 (= (apply!377 lt!396835 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!876984 () Bool)

(declare-fun e!488173 () Bool)

(assert (=> b!876984 (= e!488175 e!488173)))

(declare-fun c!92661 () Bool)

(declare-fun e!488171 () Bool)

(assert (=> b!876984 (= c!92661 e!488171)))

(declare-fun res!595873 () Bool)

(assert (=> b!876984 (=> (not res!595873) (not e!488171))))

(assert (=> b!876984 (= res!595873 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun b!876985 () Bool)

(assert (=> b!876985 (= e!488173 e!488177)))

(declare-fun c!92658 () Bool)

(assert (=> b!876985 (= c!92658 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun b!876986 () Bool)

(assert (=> b!876986 (= e!488174 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38811 () Bool)

(assert (=> bm!38811 (= call!38814 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!876987 () Bool)

(assert (=> b!876987 (= e!488171 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876987 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!876988 () Bool)

(assert (=> b!876988 (= e!488177 (isEmpty!663 lt!396835))))

(declare-fun b!876989 () Bool)

(assert (=> b!876989 (= e!488173 e!488172)))

(assert (=> b!876989 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun res!595876 () Bool)

(assert (=> b!876989 (= res!595876 (contains!4248 lt!396835 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!876989 (=> (not res!595876) (not e!488172))))

(assert (= (and d!108657 c!92659) b!876986))

(assert (= (and d!108657 (not c!92659)) b!876981))

(assert (= (and b!876981 c!92660) b!876982))

(assert (= (and b!876981 (not c!92660)) b!876978))

(assert (= (or b!876982 b!876978) bm!38811))

(assert (= (and d!108657 res!595874) b!876980))

(assert (= (and b!876980 res!595875) b!876984))

(assert (= (and b!876984 res!595873) b!876987))

(assert (= (and b!876984 c!92661) b!876989))

(assert (= (and b!876984 (not c!92661)) b!876985))

(assert (= (and b!876989 res!595876) b!876983))

(assert (= (and b!876985 c!92658) b!876979))

(assert (= (and b!876985 (not c!92658)) b!876988))

(declare-fun b_lambda!12269 () Bool)

(assert (=> (not b_lambda!12269) (not b!876982)))

(assert (=> b!876982 t!24485))

(declare-fun b_and!25039 () Bool)

(assert (= b_and!25037 (and (=> t!24485 result!9505) b_and!25039)))

(declare-fun b_lambda!12271 () Bool)

(assert (=> (not b_lambda!12271) (not b!876983)))

(assert (=> b!876983 t!24485))

(declare-fun b_and!25041 () Bool)

(assert (= b_and!25039 (and (=> t!24485 result!9505) b_and!25041)))

(declare-fun m!816897 () Bool)

(assert (=> b!876980 m!816897))

(declare-fun m!816899 () Bool)

(assert (=> b!876982 m!816899))

(declare-fun m!816901 () Bool)

(assert (=> b!876982 m!816901))

(assert (=> b!876982 m!816653))

(declare-fun m!816903 () Bool)

(assert (=> b!876982 m!816903))

(declare-fun m!816905 () Bool)

(assert (=> b!876982 m!816905))

(assert (=> b!876982 m!816799))

(assert (=> b!876982 m!816901))

(assert (=> b!876982 m!816653))

(declare-fun m!816907 () Bool)

(assert (=> b!876982 m!816907))

(assert (=> b!876982 m!816903))

(declare-fun m!816909 () Bool)

(assert (=> b!876982 m!816909))

(assert (=> b!876987 m!816799))

(assert (=> b!876987 m!816799))

(assert (=> b!876987 m!816805))

(declare-fun m!816911 () Bool)

(assert (=> d!108657 m!816911))

(assert (=> d!108657 m!816665))

(assert (=> b!876981 m!816799))

(assert (=> b!876981 m!816799))

(assert (=> b!876981 m!816805))

(assert (=> b!876983 m!816901))

(assert (=> b!876983 m!816653))

(assert (=> b!876983 m!816799))

(declare-fun m!816913 () Bool)

(assert (=> b!876983 m!816913))

(assert (=> b!876983 m!816799))

(assert (=> b!876983 m!816901))

(assert (=> b!876983 m!816653))

(assert (=> b!876983 m!816907))

(declare-fun m!816915 () Bool)

(assert (=> b!876988 m!816915))

(declare-fun m!816917 () Bool)

(assert (=> bm!38811 m!816917))

(assert (=> b!876989 m!816799))

(assert (=> b!876989 m!816799))

(declare-fun m!816919 () Bool)

(assert (=> b!876989 m!816919))

(assert (=> b!876979 m!816917))

(assert (=> bm!38789 d!108657))

(declare-fun b!877000 () Bool)

(declare-fun e!488189 () Bool)

(declare-fun call!38817 () Bool)

(assert (=> b!877000 (= e!488189 call!38817)))

(declare-fun b!877001 () Bool)

(assert (=> b!877001 (= e!488189 call!38817)))

(declare-fun bm!38814 () Bool)

(declare-fun c!92664 () Bool)

(assert (=> bm!38814 (= call!38817 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92664 (Cons!17396 (select (arr!24517 _keys!868) #b00000000000000000000000000000000) Nil!17397) Nil!17397)))))

(declare-fun b!877002 () Bool)

(declare-fun e!488187 () Bool)

(declare-fun contains!4250 (List!17400 (_ BitVec 64)) Bool)

(assert (=> b!877002 (= e!488187 (contains!4250 Nil!17397 (select (arr!24517 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!877003 () Bool)

(declare-fun e!488186 () Bool)

(assert (=> b!877003 (= e!488186 e!488189)))

(assert (=> b!877003 (= c!92664 (validKeyInArray!0 (select (arr!24517 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108659 () Bool)

(declare-fun res!595884 () Bool)

(declare-fun e!488188 () Bool)

(assert (=> d!108659 (=> res!595884 e!488188)))

(assert (=> d!108659 (= res!595884 (bvsge #b00000000000000000000000000000000 (size!24957 _keys!868)))))

(assert (=> d!108659 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17397) e!488188)))

(declare-fun b!877004 () Bool)

(assert (=> b!877004 (= e!488188 e!488186)))

(declare-fun res!595885 () Bool)

(assert (=> b!877004 (=> (not res!595885) (not e!488186))))

(assert (=> b!877004 (= res!595885 (not e!488187))))

(declare-fun res!595883 () Bool)

(assert (=> b!877004 (=> (not res!595883) (not e!488187))))

(assert (=> b!877004 (= res!595883 (validKeyInArray!0 (select (arr!24517 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108659 (not res!595884)) b!877004))

(assert (= (and b!877004 res!595883) b!877002))

(assert (= (and b!877004 res!595885) b!877003))

(assert (= (and b!877003 c!92664) b!877000))

(assert (= (and b!877003 (not c!92664)) b!877001))

(assert (= (or b!877000 b!877001) bm!38814))

(assert (=> bm!38814 m!816731))

(declare-fun m!816921 () Bool)

(assert (=> bm!38814 m!816921))

(assert (=> b!877002 m!816731))

(assert (=> b!877002 m!816731))

(declare-fun m!816923 () Bool)

(assert (=> b!877002 m!816923))

(assert (=> b!877003 m!816731))

(assert (=> b!877003 m!816731))

(assert (=> b!877003 m!816733))

(assert (=> b!877004 m!816731))

(assert (=> b!877004 m!816731))

(assert (=> b!877004 m!816733))

(assert (=> b!876819 d!108659))

(declare-fun d!108661 () Bool)

(declare-fun e!488190 () Bool)

(assert (=> d!108661 e!488190))

(declare-fun res!595887 () Bool)

(assert (=> d!108661 (=> (not res!595887) (not e!488190))))

(declare-fun lt!396841 () ListLongMap!10351)

(assert (=> d!108661 (= res!595887 (contains!4248 lt!396841 (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun lt!396840 () List!17399)

(assert (=> d!108661 (= lt!396841 (ListLongMap!10352 lt!396840))))

(declare-fun lt!396839 () Unit!29986)

(declare-fun lt!396842 () Unit!29986)

(assert (=> d!108661 (= lt!396839 lt!396842)))

(assert (=> d!108661 (= (getValueByKey!419 lt!396840 (_1!5802 (tuple2!11583 k0!854 v!557))) (Some!424 (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108661 (= lt!396842 (lemmaContainsTupThenGetReturnValue!233 lt!396840 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108661 (= lt!396840 (insertStrictlySorted!272 (toList!5191 call!38793) (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108661 (= (+!2491 call!38793 (tuple2!11583 k0!854 v!557)) lt!396841)))

(declare-fun b!877005 () Bool)

(declare-fun res!595886 () Bool)

(assert (=> b!877005 (=> (not res!595886) (not e!488190))))

(assert (=> b!877005 (= res!595886 (= (getValueByKey!419 (toList!5191 lt!396841) (_1!5802 (tuple2!11583 k0!854 v!557))) (Some!424 (_2!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun b!877006 () Bool)

(assert (=> b!877006 (= e!488190 (contains!4249 (toList!5191 lt!396841) (tuple2!11583 k0!854 v!557)))))

(assert (= (and d!108661 res!595887) b!877005))

(assert (= (and b!877005 res!595886) b!877006))

(declare-fun m!816925 () Bool)

(assert (=> d!108661 m!816925))

(declare-fun m!816927 () Bool)

(assert (=> d!108661 m!816927))

(declare-fun m!816929 () Bool)

(assert (=> d!108661 m!816929))

(declare-fun m!816931 () Bool)

(assert (=> d!108661 m!816931))

(declare-fun m!816933 () Bool)

(assert (=> b!877005 m!816933))

(declare-fun m!816935 () Bool)

(assert (=> b!877006 m!816935))

(assert (=> b!876820 d!108661))

(declare-fun b!877013 () Bool)

(declare-fun e!488196 () Bool)

(assert (=> b!877013 (= e!488196 tp_is_empty!17427)))

(declare-fun mapNonEmpty!27758 () Bool)

(declare-fun mapRes!27758 () Bool)

(declare-fun tp!53236 () Bool)

(assert (=> mapNonEmpty!27758 (= mapRes!27758 (and tp!53236 e!488196))))

(declare-fun mapValue!27758 () ValueCell!8274)

(declare-fun mapKey!27758 () (_ BitVec 32))

(declare-fun mapRest!27758 () (Array (_ BitVec 32) ValueCell!8274))

(assert (=> mapNonEmpty!27758 (= mapRest!27752 (store mapRest!27758 mapKey!27758 mapValue!27758))))

(declare-fun condMapEmpty!27758 () Bool)

(declare-fun mapDefault!27758 () ValueCell!8274)

(assert (=> mapNonEmpty!27752 (= condMapEmpty!27758 (= mapRest!27752 ((as const (Array (_ BitVec 32) ValueCell!8274)) mapDefault!27758)))))

(declare-fun e!488195 () Bool)

(assert (=> mapNonEmpty!27752 (= tp!53226 (and e!488195 mapRes!27758))))

(declare-fun mapIsEmpty!27758 () Bool)

(assert (=> mapIsEmpty!27758 mapRes!27758))

(declare-fun b!877014 () Bool)

(assert (=> b!877014 (= e!488195 tp_is_empty!17427)))

(assert (= (and mapNonEmpty!27752 condMapEmpty!27758) mapIsEmpty!27758))

(assert (= (and mapNonEmpty!27752 (not condMapEmpty!27758)) mapNonEmpty!27758))

(assert (= (and mapNonEmpty!27758 ((_ is ValueCellFull!8274) mapValue!27758)) b!877013))

(assert (= (and mapNonEmpty!27752 ((_ is ValueCellFull!8274) mapDefault!27758)) b!877014))

(declare-fun m!816937 () Bool)

(assert (=> mapNonEmpty!27758 m!816937))

(declare-fun b_lambda!12273 () Bool)

(assert (= b_lambda!12269 (or (and start!74440 b_free!15183) b_lambda!12273)))

(declare-fun b_lambda!12275 () Bool)

(assert (= b_lambda!12259 (or (and start!74440 b_free!15183) b_lambda!12275)))

(declare-fun b_lambda!12277 () Bool)

(assert (= b_lambda!12271 (or (and start!74440 b_free!15183) b_lambda!12277)))

(declare-fun b_lambda!12279 () Bool)

(assert (= b_lambda!12261 (or (and start!74440 b_free!15183) b_lambda!12279)))

(declare-fun b_lambda!12281 () Bool)

(assert (= b_lambda!12263 (or (and start!74440 b_free!15183) b_lambda!12281)))

(declare-fun b_lambda!12283 () Bool)

(assert (= b_lambda!12267 (or (and start!74440 b_free!15183) b_lambda!12283)))

(declare-fun b_lambda!12285 () Bool)

(assert (= b_lambda!12257 (or (and start!74440 b_free!15183) b_lambda!12285)))

(declare-fun b_lambda!12287 () Bool)

(assert (= b_lambda!12265 (or (and start!74440 b_free!15183) b_lambda!12287)))

(check-sat (not b!876954) (not b!876975) (not b!876980) (not d!108645) (not b!876965) (not d!108625) (not b!876951) (not b!877003) (not b!876928) (not bm!38814) (not b_next!15183) (not b!876934) (not bm!38803) (not b!876925) (not b!876912) (not b!876922) (not bm!38804) (not b!876962) (not b!876979) (not d!108647) (not b!876952) (not d!108627) (not b!876937) (not d!108631) (not b_lambda!12287) (not b!876883) (not b!876944) (not d!108655) (not b!877002) tp_is_empty!17427 (not b!876946) (not bm!38809) (not b!876921) (not bm!38811) (not b_lambda!12281) (not b!876982) (not b!876933) (not b!876884) (not b!876966) (not b!876960) (not bm!38802) (not bm!38810) (not d!108657) (not b!876926) (not b_lambda!12275) (not b_lambda!12279) (not d!108641) b_and!25041 (not b!876988) (not b!876915) (not b!876959) (not b!876938) (not b!876987) (not b!876989) (not b_lambda!12283) (not b!877006) (not b!876932) (not b!876920) (not b!876953) (not b_lambda!12285) (not b!876927) (not b!876939) (not b_lambda!12255) (not b!876968) (not b!876983) (not b!876936) (not d!108637) (not b!876945) (not b_lambda!12277) (not b_lambda!12273) (not b!876940) (not b!876964) (not b!876961) (not b!876916) (not d!108661) (not bm!38799) (not b!877005) (not b!876963) (not mapNonEmpty!27758) (not b!876913) (not d!108633) (not b!876967) (not d!108635) (not b!877004) (not b!876981) (not b!876914) (not b!876924))
(check-sat b_and!25041 (not b_next!15183))
(get-model)

(declare-fun d!108663 () Bool)

(declare-fun e!488197 () Bool)

(assert (=> d!108663 e!488197))

(declare-fun res!595889 () Bool)

(assert (=> d!108663 (=> (not res!595889) (not e!488197))))

(declare-fun lt!396845 () ListLongMap!10351)

(assert (=> d!108663 (= res!595889 (contains!4248 lt!396845 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396844 () List!17399)

(assert (=> d!108663 (= lt!396845 (ListLongMap!10352 lt!396844))))

(declare-fun lt!396843 () Unit!29986)

(declare-fun lt!396846 () Unit!29986)

(assert (=> d!108663 (= lt!396843 lt!396846)))

(assert (=> d!108663 (= (getValueByKey!419 lt!396844 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108663 (= lt!396846 (lemmaContainsTupThenGetReturnValue!233 lt!396844 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108663 (= lt!396844 (insertStrictlySorted!272 (toList!5191 call!38807) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108663 (= (+!2491 call!38807 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396845)))

(declare-fun b!877015 () Bool)

(declare-fun res!595888 () Bool)

(assert (=> b!877015 (=> (not res!595888) (not e!488197))))

(assert (=> b!877015 (= res!595888 (= (getValueByKey!419 (toList!5191 lt!396845) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!877016 () Bool)

(assert (=> b!877016 (= e!488197 (contains!4249 (toList!5191 lt!396845) (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108663 res!595889) b!877015))

(assert (= (and b!877015 res!595888) b!877016))

(declare-fun m!816939 () Bool)

(assert (=> d!108663 m!816939))

(declare-fun m!816941 () Bool)

(assert (=> d!108663 m!816941))

(declare-fun m!816943 () Bool)

(assert (=> d!108663 m!816943))

(declare-fun m!816945 () Bool)

(assert (=> d!108663 m!816945))

(declare-fun m!816947 () Bool)

(assert (=> b!877015 m!816947))

(declare-fun m!816949 () Bool)

(assert (=> b!877016 m!816949))

(assert (=> b!876939 d!108663))

(declare-fun d!108665 () Bool)

(assert (=> d!108665 (not (contains!4248 (+!2491 lt!396792 (tuple2!11583 lt!396797 lt!396793)) lt!396795))))

(declare-fun lt!396849 () Unit!29986)

(declare-fun choose!1432 (ListLongMap!10351 (_ BitVec 64) V!28283 (_ BitVec 64)) Unit!29986)

(assert (=> d!108665 (= lt!396849 (choose!1432 lt!396792 lt!396797 lt!396793 lt!396795))))

(declare-fun e!488200 () Bool)

(assert (=> d!108665 e!488200))

(declare-fun res!595892 () Bool)

(assert (=> d!108665 (=> (not res!595892) (not e!488200))))

(assert (=> d!108665 (= res!595892 (not (contains!4248 lt!396792 lt!396795)))))

(assert (=> d!108665 (= (addStillNotContains!202 lt!396792 lt!396797 lt!396793 lt!396795) lt!396849)))

(declare-fun b!877020 () Bool)

(assert (=> b!877020 (= e!488200 (not (= lt!396797 lt!396795)))))

(assert (= (and d!108665 res!595892) b!877020))

(assert (=> d!108665 m!816795))

(assert (=> d!108665 m!816795))

(assert (=> d!108665 m!816797))

(declare-fun m!816951 () Bool)

(assert (=> d!108665 m!816951))

(declare-fun m!816953 () Bool)

(assert (=> d!108665 m!816953))

(assert (=> b!876939 d!108665))

(declare-fun d!108667 () Bool)

(declare-fun c!92665 () Bool)

(assert (=> d!108667 (= c!92665 ((_ is ValueCellFull!8274) (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun e!488201 () V!28283)

(assert (=> d!108667 (= (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488201)))

(declare-fun b!877021 () Bool)

(assert (=> b!877021 (= e!488201 (get!12896 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877022 () Bool)

(assert (=> b!877022 (= e!488201 (get!12897 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108667 c!92665) b!877021))

(assert (= (and d!108667 (not c!92665)) b!877022))

(assert (=> b!877021 m!816793))

(assert (=> b!877021 m!816653))

(declare-fun m!816955 () Bool)

(assert (=> b!877021 m!816955))

(assert (=> b!877022 m!816793))

(assert (=> b!877022 m!816653))

(declare-fun m!816957 () Bool)

(assert (=> b!877022 m!816957))

(assert (=> b!876939 d!108667))

(declare-fun d!108669 () Bool)

(declare-fun e!488206 () Bool)

(assert (=> d!108669 e!488206))

(declare-fun res!595895 () Bool)

(assert (=> d!108669 (=> res!595895 e!488206)))

(declare-fun lt!396861 () Bool)

(assert (=> d!108669 (= res!595895 (not lt!396861))))

(declare-fun lt!396860 () Bool)

(assert (=> d!108669 (= lt!396861 lt!396860)))

(declare-fun lt!396858 () Unit!29986)

(declare-fun e!488207 () Unit!29986)

(assert (=> d!108669 (= lt!396858 e!488207)))

(declare-fun c!92668 () Bool)

(assert (=> d!108669 (= c!92668 lt!396860)))

(declare-fun containsKey!403 (List!17399 (_ BitVec 64)) Bool)

(assert (=> d!108669 (= lt!396860 (containsKey!403 (toList!5191 (+!2491 lt!396792 (tuple2!11583 lt!396797 lt!396793))) lt!396795))))

(assert (=> d!108669 (= (contains!4248 (+!2491 lt!396792 (tuple2!11583 lt!396797 lt!396793)) lt!396795) lt!396861)))

(declare-fun b!877029 () Bool)

(declare-fun lt!396859 () Unit!29986)

(assert (=> b!877029 (= e!488207 lt!396859)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!312 (List!17399 (_ BitVec 64)) Unit!29986)

(assert (=> b!877029 (= lt!396859 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 (+!2491 lt!396792 (tuple2!11583 lt!396797 lt!396793))) lt!396795))))

(declare-fun isDefined!313 (Option!425) Bool)

(assert (=> b!877029 (isDefined!313 (getValueByKey!419 (toList!5191 (+!2491 lt!396792 (tuple2!11583 lt!396797 lt!396793))) lt!396795))))

(declare-fun b!877030 () Bool)

(declare-fun Unit!29990 () Unit!29986)

(assert (=> b!877030 (= e!488207 Unit!29990)))

(declare-fun b!877031 () Bool)

(assert (=> b!877031 (= e!488206 (isDefined!313 (getValueByKey!419 (toList!5191 (+!2491 lt!396792 (tuple2!11583 lt!396797 lt!396793))) lt!396795)))))

(assert (= (and d!108669 c!92668) b!877029))

(assert (= (and d!108669 (not c!92668)) b!877030))

(assert (= (and d!108669 (not res!595895)) b!877031))

(declare-fun m!816959 () Bool)

(assert (=> d!108669 m!816959))

(declare-fun m!816961 () Bool)

(assert (=> b!877029 m!816961))

(declare-fun m!816963 () Bool)

(assert (=> b!877029 m!816963))

(assert (=> b!877029 m!816963))

(declare-fun m!816965 () Bool)

(assert (=> b!877029 m!816965))

(assert (=> b!877031 m!816963))

(assert (=> b!877031 m!816963))

(assert (=> b!877031 m!816965))

(assert (=> b!876939 d!108669))

(declare-fun d!108671 () Bool)

(declare-fun e!488208 () Bool)

(assert (=> d!108671 e!488208))

(declare-fun res!595897 () Bool)

(assert (=> d!108671 (=> (not res!595897) (not e!488208))))

(declare-fun lt!396864 () ListLongMap!10351)

(assert (=> d!108671 (= res!595897 (contains!4248 lt!396864 (_1!5802 (tuple2!11583 lt!396797 lt!396793))))))

(declare-fun lt!396863 () List!17399)

(assert (=> d!108671 (= lt!396864 (ListLongMap!10352 lt!396863))))

(declare-fun lt!396862 () Unit!29986)

(declare-fun lt!396865 () Unit!29986)

(assert (=> d!108671 (= lt!396862 lt!396865)))

(assert (=> d!108671 (= (getValueByKey!419 lt!396863 (_1!5802 (tuple2!11583 lt!396797 lt!396793))) (Some!424 (_2!5802 (tuple2!11583 lt!396797 lt!396793))))))

(assert (=> d!108671 (= lt!396865 (lemmaContainsTupThenGetReturnValue!233 lt!396863 (_1!5802 (tuple2!11583 lt!396797 lt!396793)) (_2!5802 (tuple2!11583 lt!396797 lt!396793))))))

(assert (=> d!108671 (= lt!396863 (insertStrictlySorted!272 (toList!5191 lt!396792) (_1!5802 (tuple2!11583 lt!396797 lt!396793)) (_2!5802 (tuple2!11583 lt!396797 lt!396793))))))

(assert (=> d!108671 (= (+!2491 lt!396792 (tuple2!11583 lt!396797 lt!396793)) lt!396864)))

(declare-fun b!877032 () Bool)

(declare-fun res!595896 () Bool)

(assert (=> b!877032 (=> (not res!595896) (not e!488208))))

(assert (=> b!877032 (= res!595896 (= (getValueByKey!419 (toList!5191 lt!396864) (_1!5802 (tuple2!11583 lt!396797 lt!396793))) (Some!424 (_2!5802 (tuple2!11583 lt!396797 lt!396793)))))))

(declare-fun b!877033 () Bool)

(assert (=> b!877033 (= e!488208 (contains!4249 (toList!5191 lt!396864) (tuple2!11583 lt!396797 lt!396793)))))

(assert (= (and d!108671 res!595897) b!877032))

(assert (= (and b!877032 res!595896) b!877033))

(declare-fun m!816967 () Bool)

(assert (=> d!108671 m!816967))

(declare-fun m!816969 () Bool)

(assert (=> d!108671 m!816969))

(declare-fun m!816971 () Bool)

(assert (=> d!108671 m!816971))

(declare-fun m!816973 () Bool)

(assert (=> d!108671 m!816973))

(declare-fun m!816975 () Bool)

(assert (=> b!877032 m!816975))

(declare-fun m!816977 () Bool)

(assert (=> b!877033 m!816977))

(assert (=> b!876939 d!108671))

(declare-fun d!108673 () Bool)

(assert (=> d!108673 (= (validKeyInArray!0 (select (arr!24517 _keys!868) #b00000000000000000000000000000000)) (and (not (= (select (arr!24517 _keys!868) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24517 _keys!868) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!877004 d!108673))

(declare-fun d!108675 () Bool)

(declare-fun e!488209 () Bool)

(assert (=> d!108675 e!488209))

(declare-fun res!595898 () Bool)

(assert (=> d!108675 (=> res!595898 e!488209)))

(declare-fun lt!396869 () Bool)

(assert (=> d!108675 (= res!595898 (not lt!396869))))

(declare-fun lt!396868 () Bool)

(assert (=> d!108675 (= lt!396869 lt!396868)))

(declare-fun lt!396866 () Unit!29986)

(declare-fun e!488210 () Unit!29986)

(assert (=> d!108675 (= lt!396866 e!488210)))

(declare-fun c!92669 () Bool)

(assert (=> d!108675 (= c!92669 lt!396868)))

(assert (=> d!108675 (= lt!396868 (containsKey!403 (toList!5191 lt!396835) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> d!108675 (= (contains!4248 lt!396835 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) lt!396869)))

(declare-fun b!877034 () Bool)

(declare-fun lt!396867 () Unit!29986)

(assert (=> b!877034 (= e!488210 lt!396867)))

(assert (=> b!877034 (= lt!396867 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396835) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877034 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396835) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!877035 () Bool)

(declare-fun Unit!29991 () Unit!29986)

(assert (=> b!877035 (= e!488210 Unit!29991)))

(declare-fun b!877036 () Bool)

(assert (=> b!877036 (= e!488209 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396835) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(assert (= (and d!108675 c!92669) b!877034))

(assert (= (and d!108675 (not c!92669)) b!877035))

(assert (= (and d!108675 (not res!595898)) b!877036))

(assert (=> d!108675 m!816799))

(declare-fun m!816979 () Bool)

(assert (=> d!108675 m!816979))

(assert (=> b!877034 m!816799))

(declare-fun m!816981 () Bool)

(assert (=> b!877034 m!816981))

(assert (=> b!877034 m!816799))

(declare-fun m!816983 () Bool)

(assert (=> b!877034 m!816983))

(assert (=> b!877034 m!816983))

(declare-fun m!816985 () Bool)

(assert (=> b!877034 m!816985))

(assert (=> b!877036 m!816799))

(assert (=> b!877036 m!816983))

(assert (=> b!877036 m!816983))

(assert (=> b!877036 m!816985))

(assert (=> b!876989 d!108675))

(declare-fun d!108677 () Bool)

(assert (=> d!108677 (= (get!12896 (select (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) from!1053) lt!396714) (v!11194 (select (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) from!1053)))))

(assert (=> b!876959 d!108677))

(declare-fun d!108679 () Bool)

(declare-fun e!488211 () Bool)

(assert (=> d!108679 e!488211))

(declare-fun res!595899 () Bool)

(assert (=> d!108679 (=> res!595899 e!488211)))

(declare-fun lt!396873 () Bool)

(assert (=> d!108679 (= res!595899 (not lt!396873))))

(declare-fun lt!396872 () Bool)

(assert (=> d!108679 (= lt!396873 lt!396872)))

(declare-fun lt!396870 () Unit!29986)

(declare-fun e!488212 () Unit!29986)

(assert (=> d!108679 (= lt!396870 e!488212)))

(declare-fun c!92670 () Bool)

(assert (=> d!108679 (= c!92670 lt!396872)))

(assert (=> d!108679 (= lt!396872 (containsKey!403 (toList!5191 lt!396827) (_1!5802 lt!396716)))))

(assert (=> d!108679 (= (contains!4248 lt!396827 (_1!5802 lt!396716)) lt!396873)))

(declare-fun b!877037 () Bool)

(declare-fun lt!396871 () Unit!29986)

(assert (=> b!877037 (= e!488212 lt!396871)))

(assert (=> b!877037 (= lt!396871 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396827) (_1!5802 lt!396716)))))

(assert (=> b!877037 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396827) (_1!5802 lt!396716)))))

(declare-fun b!877038 () Bool)

(declare-fun Unit!29992 () Unit!29986)

(assert (=> b!877038 (= e!488212 Unit!29992)))

(declare-fun b!877039 () Bool)

(assert (=> b!877039 (= e!488211 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396827) (_1!5802 lt!396716))))))

(assert (= (and d!108679 c!92670) b!877037))

(assert (= (and d!108679 (not c!92670)) b!877038))

(assert (= (and d!108679 (not res!595899)) b!877039))

(declare-fun m!816987 () Bool)

(assert (=> d!108679 m!816987))

(declare-fun m!816989 () Bool)

(assert (=> b!877037 m!816989))

(assert (=> b!877037 m!816887))

(assert (=> b!877037 m!816887))

(declare-fun m!816991 () Bool)

(assert (=> b!877037 m!816991))

(assert (=> b!877039 m!816887))

(assert (=> b!877039 m!816887))

(assert (=> b!877039 m!816991))

(assert (=> d!108647 d!108679))

(declare-fun d!108681 () Bool)

(declare-fun c!92675 () Bool)

(assert (=> d!108681 (= c!92675 (and ((_ is Cons!17395) lt!396826) (= (_1!5802 (h!18526 lt!396826)) (_1!5802 lt!396716))))))

(declare-fun e!488217 () Option!425)

(assert (=> d!108681 (= (getValueByKey!419 lt!396826 (_1!5802 lt!396716)) e!488217)))

(declare-fun b!877049 () Bool)

(declare-fun e!488218 () Option!425)

(assert (=> b!877049 (= e!488217 e!488218)))

(declare-fun c!92676 () Bool)

(assert (=> b!877049 (= c!92676 (and ((_ is Cons!17395) lt!396826) (not (= (_1!5802 (h!18526 lt!396826)) (_1!5802 lt!396716)))))))

(declare-fun b!877050 () Bool)

(assert (=> b!877050 (= e!488218 (getValueByKey!419 (t!24486 lt!396826) (_1!5802 lt!396716)))))

(declare-fun b!877048 () Bool)

(assert (=> b!877048 (= e!488217 (Some!424 (_2!5802 (h!18526 lt!396826))))))

(declare-fun b!877051 () Bool)

(assert (=> b!877051 (= e!488218 None!423)))

(assert (= (and d!108681 c!92675) b!877048))

(assert (= (and d!108681 (not c!92675)) b!877049))

(assert (= (and b!877049 c!92676) b!877050))

(assert (= (and b!877049 (not c!92676)) b!877051))

(declare-fun m!816993 () Bool)

(assert (=> b!877050 m!816993))

(assert (=> d!108647 d!108681))

(declare-fun d!108683 () Bool)

(assert (=> d!108683 (= (getValueByKey!419 lt!396826 (_1!5802 lt!396716)) (Some!424 (_2!5802 lt!396716)))))

(declare-fun lt!396876 () Unit!29986)

(declare-fun choose!1433 (List!17399 (_ BitVec 64) V!28283) Unit!29986)

(assert (=> d!108683 (= lt!396876 (choose!1433 lt!396826 (_1!5802 lt!396716) (_2!5802 lt!396716)))))

(declare-fun e!488221 () Bool)

(assert (=> d!108683 e!488221))

(declare-fun res!595904 () Bool)

(assert (=> d!108683 (=> (not res!595904) (not e!488221))))

(declare-fun isStrictlySorted!461 (List!17399) Bool)

(assert (=> d!108683 (= res!595904 (isStrictlySorted!461 lt!396826))))

(assert (=> d!108683 (= (lemmaContainsTupThenGetReturnValue!233 lt!396826 (_1!5802 lt!396716) (_2!5802 lt!396716)) lt!396876)))

(declare-fun b!877056 () Bool)

(declare-fun res!595905 () Bool)

(assert (=> b!877056 (=> (not res!595905) (not e!488221))))

(assert (=> b!877056 (= res!595905 (containsKey!403 lt!396826 (_1!5802 lt!396716)))))

(declare-fun b!877057 () Bool)

(assert (=> b!877057 (= e!488221 (contains!4249 lt!396826 (tuple2!11583 (_1!5802 lt!396716) (_2!5802 lt!396716))))))

(assert (= (and d!108683 res!595904) b!877056))

(assert (= (and b!877056 res!595905) b!877057))

(assert (=> d!108683 m!816881))

(declare-fun m!816995 () Bool)

(assert (=> d!108683 m!816995))

(declare-fun m!816997 () Bool)

(assert (=> d!108683 m!816997))

(declare-fun m!816999 () Bool)

(assert (=> b!877056 m!816999))

(declare-fun m!817001 () Bool)

(assert (=> b!877057 m!817001))

(assert (=> d!108647 d!108683))

(declare-fun b!877078 () Bool)

(declare-fun e!488235 () List!17399)

(declare-fun call!38825 () List!17399)

(assert (=> b!877078 (= e!488235 call!38825)))

(declare-fun b!877079 () Bool)

(declare-fun c!92685 () Bool)

(assert (=> b!877079 (= c!92685 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (bvsgt (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 lt!396716))))))

(declare-fun e!488232 () List!17399)

(assert (=> b!877079 (= e!488232 e!488235)))

(declare-fun bm!38821 () Bool)

(declare-fun e!488236 () List!17399)

(declare-fun call!38824 () List!17399)

(declare-fun c!92686 () Bool)

(declare-fun $colon$colon!538 (List!17399 tuple2!11582) List!17399)

(assert (=> bm!38821 (= call!38824 ($colon$colon!538 e!488236 (ite c!92686 (h!18526 (toList!5191 lt!396719)) (tuple2!11583 (_1!5802 lt!396716) (_2!5802 lt!396716)))))))

(declare-fun c!92687 () Bool)

(assert (=> bm!38821 (= c!92687 c!92686)))

(declare-fun b!877081 () Bool)

(assert (=> b!877081 (= e!488235 call!38825)))

(declare-fun b!877082 () Bool)

(declare-fun e!488234 () List!17399)

(assert (=> b!877082 (= e!488234 e!488232)))

(declare-fun c!92688 () Bool)

(assert (=> b!877082 (= c!92688 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (= (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 lt!396716))))))

(declare-fun bm!38822 () Bool)

(declare-fun call!38826 () List!17399)

(assert (=> bm!38822 (= call!38825 call!38826)))

(declare-fun b!877083 () Bool)

(assert (=> b!877083 (= e!488236 (insertStrictlySorted!272 (t!24486 (toList!5191 lt!396719)) (_1!5802 lt!396716) (_2!5802 lt!396716)))))

(declare-fun b!877080 () Bool)

(assert (=> b!877080 (= e!488234 call!38824)))

(declare-fun d!108685 () Bool)

(declare-fun e!488233 () Bool)

(assert (=> d!108685 e!488233))

(declare-fun res!595911 () Bool)

(assert (=> d!108685 (=> (not res!595911) (not e!488233))))

(declare-fun lt!396879 () List!17399)

(assert (=> d!108685 (= res!595911 (isStrictlySorted!461 lt!396879))))

(assert (=> d!108685 (= lt!396879 e!488234)))

(assert (=> d!108685 (= c!92686 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (bvslt (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 lt!396716))))))

(assert (=> d!108685 (isStrictlySorted!461 (toList!5191 lt!396719))))

(assert (=> d!108685 (= (insertStrictlySorted!272 (toList!5191 lt!396719) (_1!5802 lt!396716) (_2!5802 lt!396716)) lt!396879)))

(declare-fun bm!38823 () Bool)

(assert (=> bm!38823 (= call!38826 call!38824)))

(declare-fun b!877084 () Bool)

(declare-fun res!595910 () Bool)

(assert (=> b!877084 (=> (not res!595910) (not e!488233))))

(assert (=> b!877084 (= res!595910 (containsKey!403 lt!396879 (_1!5802 lt!396716)))))

(declare-fun b!877085 () Bool)

(assert (=> b!877085 (= e!488232 call!38826)))

(declare-fun b!877086 () Bool)

(assert (=> b!877086 (= e!488233 (contains!4249 lt!396879 (tuple2!11583 (_1!5802 lt!396716) (_2!5802 lt!396716))))))

(declare-fun b!877087 () Bool)

(assert (=> b!877087 (= e!488236 (ite c!92688 (t!24486 (toList!5191 lt!396719)) (ite c!92685 (Cons!17395 (h!18526 (toList!5191 lt!396719)) (t!24486 (toList!5191 lt!396719))) Nil!17396)))))

(assert (= (and d!108685 c!92686) b!877080))

(assert (= (and d!108685 (not c!92686)) b!877082))

(assert (= (and b!877082 c!92688) b!877085))

(assert (= (and b!877082 (not c!92688)) b!877079))

(assert (= (and b!877079 c!92685) b!877081))

(assert (= (and b!877079 (not c!92685)) b!877078))

(assert (= (or b!877081 b!877078) bm!38822))

(assert (= (or b!877085 bm!38822) bm!38823))

(assert (= (or b!877080 bm!38823) bm!38821))

(assert (= (and bm!38821 c!92687) b!877083))

(assert (= (and bm!38821 (not c!92687)) b!877087))

(assert (= (and d!108685 res!595911) b!877084))

(assert (= (and b!877084 res!595910) b!877086))

(declare-fun m!817003 () Bool)

(assert (=> d!108685 m!817003))

(declare-fun m!817005 () Bool)

(assert (=> d!108685 m!817005))

(declare-fun m!817007 () Bool)

(assert (=> b!877084 m!817007))

(declare-fun m!817009 () Bool)

(assert (=> b!877086 m!817009))

(declare-fun m!817011 () Bool)

(assert (=> b!877083 m!817011))

(declare-fun m!817013 () Bool)

(assert (=> bm!38821 m!817013))

(assert (=> d!108647 d!108685))

(assert (=> b!876932 d!108653))

(declare-fun d!108687 () Bool)

(declare-fun lt!396882 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!391 (List!17400) (InoxSet (_ BitVec 64)))

(assert (=> d!108687 (= lt!396882 (select (content!391 Nil!17397) (select (arr!24517 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun e!488242 () Bool)

(assert (=> d!108687 (= lt!396882 e!488242)))

(declare-fun res!595917 () Bool)

(assert (=> d!108687 (=> (not res!595917) (not e!488242))))

(assert (=> d!108687 (= res!595917 ((_ is Cons!17396) Nil!17397))))

(assert (=> d!108687 (= (contains!4250 Nil!17397 (select (arr!24517 _keys!868) #b00000000000000000000000000000000)) lt!396882)))

(declare-fun b!877092 () Bool)

(declare-fun e!488241 () Bool)

(assert (=> b!877092 (= e!488242 e!488241)))

(declare-fun res!595916 () Bool)

(assert (=> b!877092 (=> res!595916 e!488241)))

(assert (=> b!877092 (= res!595916 (= (h!18527 Nil!17397) (select (arr!24517 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!877093 () Bool)

(assert (=> b!877093 (= e!488241 (contains!4250 (t!24487 Nil!17397) (select (arr!24517 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108687 res!595917) b!877092))

(assert (= (and b!877092 (not res!595916)) b!877093))

(declare-fun m!817015 () Bool)

(assert (=> d!108687 m!817015))

(assert (=> d!108687 m!816731))

(declare-fun m!817017 () Bool)

(assert (=> d!108687 m!817017))

(assert (=> b!877093 m!816731))

(declare-fun m!817019 () Bool)

(assert (=> b!877093 m!817019))

(assert (=> b!877002 d!108687))

(assert (=> bm!38810 d!108657))

(declare-fun d!108689 () Bool)

(declare-fun e!488243 () Bool)

(assert (=> d!108689 e!488243))

(declare-fun res!595918 () Bool)

(assert (=> d!108689 (=> res!595918 e!488243)))

(declare-fun lt!396886 () Bool)

(assert (=> d!108689 (= res!595918 (not lt!396886))))

(declare-fun lt!396885 () Bool)

(assert (=> d!108689 (= lt!396886 lt!396885)))

(declare-fun lt!396883 () Unit!29986)

(declare-fun e!488244 () Unit!29986)

(assert (=> d!108689 (= lt!396883 e!488244)))

(declare-fun c!92689 () Bool)

(assert (=> d!108689 (= c!92689 lt!396885)))

(assert (=> d!108689 (= lt!396885 (containsKey!403 (toList!5191 lt!396787) (select (arr!24517 _keys!868) from!1053)))))

(assert (=> d!108689 (= (contains!4248 lt!396787 (select (arr!24517 _keys!868) from!1053)) lt!396886)))

(declare-fun b!877094 () Bool)

(declare-fun lt!396884 () Unit!29986)

(assert (=> b!877094 (= e!488244 lt!396884)))

(assert (=> b!877094 (= lt!396884 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396787) (select (arr!24517 _keys!868) from!1053)))))

(assert (=> b!877094 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396787) (select (arr!24517 _keys!868) from!1053)))))

(declare-fun b!877095 () Bool)

(declare-fun Unit!29993 () Unit!29986)

(assert (=> b!877095 (= e!488244 Unit!29993)))

(declare-fun b!877096 () Bool)

(assert (=> b!877096 (= e!488243 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396787) (select (arr!24517 _keys!868) from!1053))))))

(assert (= (and d!108689 c!92689) b!877094))

(assert (= (and d!108689 (not c!92689)) b!877095))

(assert (= (and d!108689 (not res!595918)) b!877096))

(assert (=> d!108689 m!816651))

(declare-fun m!817021 () Bool)

(assert (=> d!108689 m!817021))

(assert (=> b!877094 m!816651))

(declare-fun m!817023 () Bool)

(assert (=> b!877094 m!817023))

(assert (=> b!877094 m!816651))

(declare-fun m!817025 () Bool)

(assert (=> b!877094 m!817025))

(assert (=> b!877094 m!817025))

(declare-fun m!817027 () Bool)

(assert (=> b!877094 m!817027))

(assert (=> b!877096 m!816651))

(assert (=> b!877096 m!817025))

(assert (=> b!877096 m!817025))

(assert (=> b!877096 m!817027))

(assert (=> b!876934 d!108689))

(declare-fun d!108691 () Bool)

(declare-fun e!488245 () Bool)

(assert (=> d!108691 e!488245))

(declare-fun res!595919 () Bool)

(assert (=> d!108691 (=> res!595919 e!488245)))

(declare-fun lt!396890 () Bool)

(assert (=> d!108691 (= res!595919 (not lt!396890))))

(declare-fun lt!396889 () Bool)

(assert (=> d!108691 (= lt!396890 lt!396889)))

(declare-fun lt!396887 () Unit!29986)

(declare-fun e!488246 () Unit!29986)

(assert (=> d!108691 (= lt!396887 e!488246)))

(declare-fun c!92690 () Bool)

(assert (=> d!108691 (= c!92690 lt!396889)))

(assert (=> d!108691 (= lt!396889 (containsKey!403 (toList!5191 lt!396794) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108691 (= (contains!4248 lt!396794 #b1000000000000000000000000000000000000000000000000000000000000000) lt!396890)))

(declare-fun b!877097 () Bool)

(declare-fun lt!396888 () Unit!29986)

(assert (=> b!877097 (= e!488246 lt!396888)))

(assert (=> b!877097 (= lt!396888 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396794) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877097 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396794) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877098 () Bool)

(declare-fun Unit!29994 () Unit!29986)

(assert (=> b!877098 (= e!488246 Unit!29994)))

(declare-fun b!877099 () Bool)

(assert (=> b!877099 (= e!488245 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108691 c!92690) b!877097))

(assert (= (and d!108691 (not c!92690)) b!877098))

(assert (= (and d!108691 (not res!595919)) b!877099))

(declare-fun m!817029 () Bool)

(assert (=> d!108691 m!817029))

(declare-fun m!817031 () Bool)

(assert (=> b!877097 m!817031))

(declare-fun m!817033 () Bool)

(assert (=> b!877097 m!817033))

(assert (=> b!877097 m!817033))

(declare-fun m!817035 () Bool)

(assert (=> b!877097 m!817035))

(assert (=> b!877099 m!817033))

(assert (=> b!877099 m!817033))

(assert (=> b!877099 m!817035))

(assert (=> b!876937 d!108691))

(declare-fun d!108693 () Bool)

(assert (=> d!108693 (= (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (and (not (= (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!876987 d!108693))

(declare-fun d!108695 () Bool)

(declare-fun e!488247 () Bool)

(assert (=> d!108695 e!488247))

(declare-fun res!595920 () Bool)

(assert (=> d!108695 (=> res!595920 e!488247)))

(declare-fun lt!396894 () Bool)

(assert (=> d!108695 (= res!595920 (not lt!396894))))

(declare-fun lt!396893 () Bool)

(assert (=> d!108695 (= lt!396894 lt!396893)))

(declare-fun lt!396891 () Unit!29986)

(declare-fun e!488248 () Unit!29986)

(assert (=> d!108695 (= lt!396891 e!488248)))

(declare-fun c!92691 () Bool)

(assert (=> d!108695 (= c!92691 lt!396893)))

(assert (=> d!108695 (= lt!396893 (containsKey!403 (toList!5191 lt!396787) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108695 (= (contains!4248 lt!396787 #b0000000000000000000000000000000000000000000000000000000000000000) lt!396894)))

(declare-fun b!877100 () Bool)

(declare-fun lt!396892 () Unit!29986)

(assert (=> b!877100 (= e!488248 lt!396892)))

(assert (=> b!877100 (= lt!396892 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396787) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877100 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396787) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877101 () Bool)

(declare-fun Unit!29995 () Unit!29986)

(assert (=> b!877101 (= e!488248 Unit!29995)))

(declare-fun b!877102 () Bool)

(assert (=> b!877102 (= e!488247 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396787) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108695 c!92691) b!877100))

(assert (= (and d!108695 (not c!92691)) b!877101))

(assert (= (and d!108695 (not res!595920)) b!877102))

(declare-fun m!817037 () Bool)

(assert (=> d!108695 m!817037))

(declare-fun m!817039 () Bool)

(assert (=> b!877100 m!817039))

(declare-fun m!817041 () Bool)

(assert (=> b!877100 m!817041))

(assert (=> b!877100 m!817041))

(declare-fun m!817043 () Bool)

(assert (=> b!877100 m!817043))

(assert (=> b!877102 m!817041))

(assert (=> b!877102 m!817041))

(assert (=> b!877102 m!817043))

(assert (=> d!108627 d!108695))

(assert (=> d!108627 d!108629))

(declare-fun d!108697 () Bool)

(declare-fun c!92692 () Bool)

(assert (=> d!108697 (= c!92692 (and ((_ is Cons!17395) (toList!5191 lt!396827)) (= (_1!5802 (h!18526 (toList!5191 lt!396827))) (_1!5802 lt!396716))))))

(declare-fun e!488249 () Option!425)

(assert (=> d!108697 (= (getValueByKey!419 (toList!5191 lt!396827) (_1!5802 lt!396716)) e!488249)))

(declare-fun b!877104 () Bool)

(declare-fun e!488250 () Option!425)

(assert (=> b!877104 (= e!488249 e!488250)))

(declare-fun c!92693 () Bool)

(assert (=> b!877104 (= c!92693 (and ((_ is Cons!17395) (toList!5191 lt!396827)) (not (= (_1!5802 (h!18526 (toList!5191 lt!396827))) (_1!5802 lt!396716)))))))

(declare-fun b!877105 () Bool)

(assert (=> b!877105 (= e!488250 (getValueByKey!419 (t!24486 (toList!5191 lt!396827)) (_1!5802 lt!396716)))))

(declare-fun b!877103 () Bool)

(assert (=> b!877103 (= e!488249 (Some!424 (_2!5802 (h!18526 (toList!5191 lt!396827)))))))

(declare-fun b!877106 () Bool)

(assert (=> b!877106 (= e!488250 None!423)))

(assert (= (and d!108697 c!92692) b!877103))

(assert (= (and d!108697 (not c!92692)) b!877104))

(assert (= (and b!877104 c!92693) b!877105))

(assert (= (and b!877104 (not c!92693)) b!877106))

(declare-fun m!817045 () Bool)

(assert (=> b!877105 m!817045))

(assert (=> b!876967 d!108697))

(declare-fun d!108699 () Bool)

(declare-fun e!488251 () Bool)

(assert (=> d!108699 e!488251))

(declare-fun res!595921 () Bool)

(assert (=> d!108699 (=> res!595921 e!488251)))

(declare-fun lt!396898 () Bool)

(assert (=> d!108699 (= res!595921 (not lt!396898))))

(declare-fun lt!396897 () Bool)

(assert (=> d!108699 (= lt!396898 lt!396897)))

(declare-fun lt!396895 () Unit!29986)

(declare-fun e!488252 () Unit!29986)

(assert (=> d!108699 (= lt!396895 e!488252)))

(declare-fun c!92694 () Bool)

(assert (=> d!108699 (= c!92694 lt!396897)))

(assert (=> d!108699 (= lt!396897 (containsKey!403 (toList!5191 lt!396841) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108699 (= (contains!4248 lt!396841 (_1!5802 (tuple2!11583 k0!854 v!557))) lt!396898)))

(declare-fun b!877107 () Bool)

(declare-fun lt!396896 () Unit!29986)

(assert (=> b!877107 (= e!488252 lt!396896)))

(assert (=> b!877107 (= lt!396896 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396841) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> b!877107 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396841) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877108 () Bool)

(declare-fun Unit!29996 () Unit!29986)

(assert (=> b!877108 (= e!488252 Unit!29996)))

(declare-fun b!877109 () Bool)

(assert (=> b!877109 (= e!488251 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396841) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(assert (= (and d!108699 c!92694) b!877107))

(assert (= (and d!108699 (not c!92694)) b!877108))

(assert (= (and d!108699 (not res!595921)) b!877109))

(declare-fun m!817047 () Bool)

(assert (=> d!108699 m!817047))

(declare-fun m!817049 () Bool)

(assert (=> b!877107 m!817049))

(assert (=> b!877107 m!816933))

(assert (=> b!877107 m!816933))

(declare-fun m!817051 () Bool)

(assert (=> b!877107 m!817051))

(assert (=> b!877109 m!816933))

(assert (=> b!877109 m!816933))

(assert (=> b!877109 m!817051))

(assert (=> d!108661 d!108699))

(declare-fun c!92695 () Bool)

(declare-fun d!108701 () Bool)

(assert (=> d!108701 (= c!92695 (and ((_ is Cons!17395) lt!396840) (= (_1!5802 (h!18526 lt!396840)) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun e!488253 () Option!425)

(assert (=> d!108701 (= (getValueByKey!419 lt!396840 (_1!5802 (tuple2!11583 k0!854 v!557))) e!488253)))

(declare-fun b!877111 () Bool)

(declare-fun e!488254 () Option!425)

(assert (=> b!877111 (= e!488253 e!488254)))

(declare-fun c!92696 () Bool)

(assert (=> b!877111 (= c!92696 (and ((_ is Cons!17395) lt!396840) (not (= (_1!5802 (h!18526 lt!396840)) (_1!5802 (tuple2!11583 k0!854 v!557))))))))

(declare-fun b!877112 () Bool)

(assert (=> b!877112 (= e!488254 (getValueByKey!419 (t!24486 lt!396840) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877110 () Bool)

(assert (=> b!877110 (= e!488253 (Some!424 (_2!5802 (h!18526 lt!396840))))))

(declare-fun b!877113 () Bool)

(assert (=> b!877113 (= e!488254 None!423)))

(assert (= (and d!108701 c!92695) b!877110))

(assert (= (and d!108701 (not c!92695)) b!877111))

(assert (= (and b!877111 c!92696) b!877112))

(assert (= (and b!877111 (not c!92696)) b!877113))

(declare-fun m!817053 () Bool)

(assert (=> b!877112 m!817053))

(assert (=> d!108661 d!108701))

(declare-fun d!108703 () Bool)

(assert (=> d!108703 (= (getValueByKey!419 lt!396840 (_1!5802 (tuple2!11583 k0!854 v!557))) (Some!424 (_2!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun lt!396899 () Unit!29986)

(assert (=> d!108703 (= lt!396899 (choose!1433 lt!396840 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun e!488255 () Bool)

(assert (=> d!108703 e!488255))

(declare-fun res!595922 () Bool)

(assert (=> d!108703 (=> (not res!595922) (not e!488255))))

(assert (=> d!108703 (= res!595922 (isStrictlySorted!461 lt!396840))))

(assert (=> d!108703 (= (lemmaContainsTupThenGetReturnValue!233 lt!396840 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))) lt!396899)))

(declare-fun b!877114 () Bool)

(declare-fun res!595923 () Bool)

(assert (=> b!877114 (=> (not res!595923) (not e!488255))))

(assert (=> b!877114 (= res!595923 (containsKey!403 lt!396840 (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877115 () Bool)

(assert (=> b!877115 (= e!488255 (contains!4249 lt!396840 (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557)))))))

(assert (= (and d!108703 res!595922) b!877114))

(assert (= (and b!877114 res!595923) b!877115))

(assert (=> d!108703 m!816927))

(declare-fun m!817055 () Bool)

(assert (=> d!108703 m!817055))

(declare-fun m!817057 () Bool)

(assert (=> d!108703 m!817057))

(declare-fun m!817059 () Bool)

(assert (=> b!877114 m!817059))

(declare-fun m!817061 () Bool)

(assert (=> b!877115 m!817061))

(assert (=> d!108661 d!108703))

(declare-fun b!877116 () Bool)

(declare-fun e!488259 () List!17399)

(declare-fun call!38828 () List!17399)

(assert (=> b!877116 (= e!488259 call!38828)))

(declare-fun b!877117 () Bool)

(declare-fun c!92697 () Bool)

(assert (=> b!877117 (= c!92697 (and ((_ is Cons!17395) (toList!5191 call!38793)) (bvsgt (_1!5802 (h!18526 (toList!5191 call!38793))) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun e!488256 () List!17399)

(assert (=> b!877117 (= e!488256 e!488259)))

(declare-fun bm!38824 () Bool)

(declare-fun e!488260 () List!17399)

(declare-fun c!92698 () Bool)

(declare-fun call!38827 () List!17399)

(assert (=> bm!38824 (= call!38827 ($colon$colon!538 e!488260 (ite c!92698 (h!18526 (toList!5191 call!38793)) (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))))

(declare-fun c!92699 () Bool)

(assert (=> bm!38824 (= c!92699 c!92698)))

(declare-fun b!877119 () Bool)

(assert (=> b!877119 (= e!488259 call!38828)))

(declare-fun b!877120 () Bool)

(declare-fun e!488258 () List!17399)

(assert (=> b!877120 (= e!488258 e!488256)))

(declare-fun c!92700 () Bool)

(assert (=> b!877120 (= c!92700 (and ((_ is Cons!17395) (toList!5191 call!38793)) (= (_1!5802 (h!18526 (toList!5191 call!38793))) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun bm!38825 () Bool)

(declare-fun call!38829 () List!17399)

(assert (=> bm!38825 (= call!38828 call!38829)))

(declare-fun b!877121 () Bool)

(assert (=> b!877121 (= e!488260 (insertStrictlySorted!272 (t!24486 (toList!5191 call!38793)) (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877118 () Bool)

(assert (=> b!877118 (= e!488258 call!38827)))

(declare-fun d!108705 () Bool)

(declare-fun e!488257 () Bool)

(assert (=> d!108705 e!488257))

(declare-fun res!595925 () Bool)

(assert (=> d!108705 (=> (not res!595925) (not e!488257))))

(declare-fun lt!396900 () List!17399)

(assert (=> d!108705 (= res!595925 (isStrictlySorted!461 lt!396900))))

(assert (=> d!108705 (= lt!396900 e!488258)))

(assert (=> d!108705 (= c!92698 (and ((_ is Cons!17395) (toList!5191 call!38793)) (bvslt (_1!5802 (h!18526 (toList!5191 call!38793))) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(assert (=> d!108705 (isStrictlySorted!461 (toList!5191 call!38793))))

(assert (=> d!108705 (= (insertStrictlySorted!272 (toList!5191 call!38793) (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))) lt!396900)))

(declare-fun bm!38826 () Bool)

(assert (=> bm!38826 (= call!38829 call!38827)))

(declare-fun b!877122 () Bool)

(declare-fun res!595924 () Bool)

(assert (=> b!877122 (=> (not res!595924) (not e!488257))))

(assert (=> b!877122 (= res!595924 (containsKey!403 lt!396900 (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877123 () Bool)

(assert (=> b!877123 (= e!488256 call!38829)))

(declare-fun b!877124 () Bool)

(assert (=> b!877124 (= e!488257 (contains!4249 lt!396900 (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun b!877125 () Bool)

(assert (=> b!877125 (= e!488260 (ite c!92700 (t!24486 (toList!5191 call!38793)) (ite c!92697 (Cons!17395 (h!18526 (toList!5191 call!38793)) (t!24486 (toList!5191 call!38793))) Nil!17396)))))

(assert (= (and d!108705 c!92698) b!877118))

(assert (= (and d!108705 (not c!92698)) b!877120))

(assert (= (and b!877120 c!92700) b!877123))

(assert (= (and b!877120 (not c!92700)) b!877117))

(assert (= (and b!877117 c!92697) b!877119))

(assert (= (and b!877117 (not c!92697)) b!877116))

(assert (= (or b!877119 b!877116) bm!38825))

(assert (= (or b!877123 bm!38825) bm!38826))

(assert (= (or b!877118 bm!38826) bm!38824))

(assert (= (and bm!38824 c!92699) b!877121))

(assert (= (and bm!38824 (not c!92699)) b!877125))

(assert (= (and d!108705 res!595925) b!877122))

(assert (= (and b!877122 res!595924) b!877124))

(declare-fun m!817063 () Bool)

(assert (=> d!108705 m!817063))

(declare-fun m!817065 () Bool)

(assert (=> d!108705 m!817065))

(declare-fun m!817067 () Bool)

(assert (=> b!877122 m!817067))

(declare-fun m!817069 () Bool)

(assert (=> b!877124 m!817069))

(declare-fun m!817071 () Bool)

(assert (=> b!877121 m!817071))

(declare-fun m!817073 () Bool)

(assert (=> bm!38824 m!817073))

(assert (=> d!108661 d!108705))

(assert (=> b!876944 d!108693))

(declare-fun d!108707 () Bool)

(assert (=> d!108707 (not (contains!4248 (+!2491 lt!396778 (tuple2!11583 lt!396783 lt!396779)) lt!396781))))

(declare-fun lt!396901 () Unit!29986)

(assert (=> d!108707 (= lt!396901 (choose!1432 lt!396778 lt!396783 lt!396779 lt!396781))))

(declare-fun e!488261 () Bool)

(assert (=> d!108707 e!488261))

(declare-fun res!595926 () Bool)

(assert (=> d!108707 (=> (not res!595926) (not e!488261))))

(assert (=> d!108707 (= res!595926 (not (contains!4248 lt!396778 lt!396781)))))

(assert (=> d!108707 (= (addStillNotContains!202 lt!396778 lt!396783 lt!396779 lt!396781) lt!396901)))

(declare-fun b!877126 () Bool)

(assert (=> b!877126 (= e!488261 (not (= lt!396783 lt!396781)))))

(assert (= (and d!108707 res!595926) b!877126))

(assert (=> d!108707 m!816749))

(assert (=> d!108707 m!816749))

(assert (=> d!108707 m!816751))

(declare-fun m!817075 () Bool)

(assert (=> d!108707 m!817075))

(declare-fun m!817077 () Bool)

(assert (=> d!108707 m!817077))

(assert (=> b!876915 d!108707))

(declare-fun d!108709 () Bool)

(declare-fun e!488262 () Bool)

(assert (=> d!108709 e!488262))

(declare-fun res!595928 () Bool)

(assert (=> d!108709 (=> (not res!595928) (not e!488262))))

(declare-fun lt!396904 () ListLongMap!10351)

(assert (=> d!108709 (= res!595928 (contains!4248 lt!396904 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396903 () List!17399)

(assert (=> d!108709 (= lt!396904 (ListLongMap!10352 lt!396903))))

(declare-fun lt!396902 () Unit!29986)

(declare-fun lt!396905 () Unit!29986)

(assert (=> d!108709 (= lt!396902 lt!396905)))

(assert (=> d!108709 (= (getValueByKey!419 lt!396903 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108709 (= lt!396905 (lemmaContainsTupThenGetReturnValue!233 lt!396903 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108709 (= lt!396903 (insertStrictlySorted!272 (toList!5191 call!38805) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108709 (= (+!2491 call!38805 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396904)))

(declare-fun b!877127 () Bool)

(declare-fun res!595927 () Bool)

(assert (=> b!877127 (=> (not res!595927) (not e!488262))))

(assert (=> b!877127 (= res!595927 (= (getValueByKey!419 (toList!5191 lt!396904) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!877128 () Bool)

(assert (=> b!877128 (= e!488262 (contains!4249 (toList!5191 lt!396904) (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108709 res!595928) b!877127))

(assert (= (and b!877127 res!595927) b!877128))

(declare-fun m!817079 () Bool)

(assert (=> d!108709 m!817079))

(declare-fun m!817081 () Bool)

(assert (=> d!108709 m!817081))

(declare-fun m!817083 () Bool)

(assert (=> d!108709 m!817083))

(declare-fun m!817085 () Bool)

(assert (=> d!108709 m!817085))

(declare-fun m!817087 () Bool)

(assert (=> b!877127 m!817087))

(declare-fun m!817089 () Bool)

(assert (=> b!877128 m!817089))

(assert (=> b!876915 d!108709))

(declare-fun d!108711 () Bool)

(declare-fun c!92701 () Bool)

(assert (=> d!108711 (= c!92701 ((_ is ValueCellFull!8274) (select (arr!24518 lt!396722) from!1053)))))

(declare-fun e!488263 () V!28283)

(assert (=> d!108711 (= (get!12894 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488263)))

(declare-fun b!877129 () Bool)

(assert (=> b!877129 (= e!488263 (get!12896 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877130 () Bool)

(assert (=> b!877130 (= e!488263 (get!12897 (select (arr!24518 lt!396722) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108711 c!92701) b!877129))

(assert (= (and d!108711 (not c!92701)) b!877130))

(assert (=> b!877129 m!816747))

(assert (=> b!877129 m!816653))

(declare-fun m!817091 () Bool)

(assert (=> b!877129 m!817091))

(assert (=> b!877130 m!816747))

(assert (=> b!877130 m!816653))

(declare-fun m!817093 () Bool)

(assert (=> b!877130 m!817093))

(assert (=> b!876915 d!108711))

(declare-fun d!108713 () Bool)

(declare-fun e!488264 () Bool)

(assert (=> d!108713 e!488264))

(declare-fun res!595929 () Bool)

(assert (=> d!108713 (=> res!595929 e!488264)))

(declare-fun lt!396909 () Bool)

(assert (=> d!108713 (= res!595929 (not lt!396909))))

(declare-fun lt!396908 () Bool)

(assert (=> d!108713 (= lt!396909 lt!396908)))

(declare-fun lt!396906 () Unit!29986)

(declare-fun e!488265 () Unit!29986)

(assert (=> d!108713 (= lt!396906 e!488265)))

(declare-fun c!92702 () Bool)

(assert (=> d!108713 (= c!92702 lt!396908)))

(assert (=> d!108713 (= lt!396908 (containsKey!403 (toList!5191 (+!2491 lt!396778 (tuple2!11583 lt!396783 lt!396779))) lt!396781))))

(assert (=> d!108713 (= (contains!4248 (+!2491 lt!396778 (tuple2!11583 lt!396783 lt!396779)) lt!396781) lt!396909)))

(declare-fun b!877131 () Bool)

(declare-fun lt!396907 () Unit!29986)

(assert (=> b!877131 (= e!488265 lt!396907)))

(assert (=> b!877131 (= lt!396907 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 (+!2491 lt!396778 (tuple2!11583 lt!396783 lt!396779))) lt!396781))))

(assert (=> b!877131 (isDefined!313 (getValueByKey!419 (toList!5191 (+!2491 lt!396778 (tuple2!11583 lt!396783 lt!396779))) lt!396781))))

(declare-fun b!877132 () Bool)

(declare-fun Unit!29997 () Unit!29986)

(assert (=> b!877132 (= e!488265 Unit!29997)))

(declare-fun b!877133 () Bool)

(assert (=> b!877133 (= e!488264 (isDefined!313 (getValueByKey!419 (toList!5191 (+!2491 lt!396778 (tuple2!11583 lt!396783 lt!396779))) lt!396781)))))

(assert (= (and d!108713 c!92702) b!877131))

(assert (= (and d!108713 (not c!92702)) b!877132))

(assert (= (and d!108713 (not res!595929)) b!877133))

(declare-fun m!817095 () Bool)

(assert (=> d!108713 m!817095))

(declare-fun m!817097 () Bool)

(assert (=> b!877131 m!817097))

(declare-fun m!817099 () Bool)

(assert (=> b!877131 m!817099))

(assert (=> b!877131 m!817099))

(declare-fun m!817101 () Bool)

(assert (=> b!877131 m!817101))

(assert (=> b!877133 m!817099))

(assert (=> b!877133 m!817099))

(assert (=> b!877133 m!817101))

(assert (=> b!876915 d!108713))

(declare-fun d!108715 () Bool)

(declare-fun e!488266 () Bool)

(assert (=> d!108715 e!488266))

(declare-fun res!595931 () Bool)

(assert (=> d!108715 (=> (not res!595931) (not e!488266))))

(declare-fun lt!396912 () ListLongMap!10351)

(assert (=> d!108715 (= res!595931 (contains!4248 lt!396912 (_1!5802 (tuple2!11583 lt!396783 lt!396779))))))

(declare-fun lt!396911 () List!17399)

(assert (=> d!108715 (= lt!396912 (ListLongMap!10352 lt!396911))))

(declare-fun lt!396910 () Unit!29986)

(declare-fun lt!396913 () Unit!29986)

(assert (=> d!108715 (= lt!396910 lt!396913)))

(assert (=> d!108715 (= (getValueByKey!419 lt!396911 (_1!5802 (tuple2!11583 lt!396783 lt!396779))) (Some!424 (_2!5802 (tuple2!11583 lt!396783 lt!396779))))))

(assert (=> d!108715 (= lt!396913 (lemmaContainsTupThenGetReturnValue!233 lt!396911 (_1!5802 (tuple2!11583 lt!396783 lt!396779)) (_2!5802 (tuple2!11583 lt!396783 lt!396779))))))

(assert (=> d!108715 (= lt!396911 (insertStrictlySorted!272 (toList!5191 lt!396778) (_1!5802 (tuple2!11583 lt!396783 lt!396779)) (_2!5802 (tuple2!11583 lt!396783 lt!396779))))))

(assert (=> d!108715 (= (+!2491 lt!396778 (tuple2!11583 lt!396783 lt!396779)) lt!396912)))

(declare-fun b!877134 () Bool)

(declare-fun res!595930 () Bool)

(assert (=> b!877134 (=> (not res!595930) (not e!488266))))

(assert (=> b!877134 (= res!595930 (= (getValueByKey!419 (toList!5191 lt!396912) (_1!5802 (tuple2!11583 lt!396783 lt!396779))) (Some!424 (_2!5802 (tuple2!11583 lt!396783 lt!396779)))))))

(declare-fun b!877135 () Bool)

(assert (=> b!877135 (= e!488266 (contains!4249 (toList!5191 lt!396912) (tuple2!11583 lt!396783 lt!396779)))))

(assert (= (and d!108715 res!595931) b!877134))

(assert (= (and b!877134 res!595930) b!877135))

(declare-fun m!817103 () Bool)

(assert (=> d!108715 m!817103))

(declare-fun m!817105 () Bool)

(assert (=> d!108715 m!817105))

(declare-fun m!817107 () Bool)

(assert (=> d!108715 m!817107))

(declare-fun m!817109 () Bool)

(assert (=> d!108715 m!817109))

(declare-fun m!817111 () Bool)

(assert (=> b!877134 m!817111))

(declare-fun m!817113 () Bool)

(assert (=> b!877135 m!817113))

(assert (=> b!876915 d!108715))

(declare-fun d!108717 () Bool)

(assert (=> d!108717 (arrayContainsKey!0 _keys!868 lt!396762 #b00000000000000000000000000000000)))

(declare-fun lt!396916 () Unit!29986)

(declare-fun choose!13 (array!50980 (_ BitVec 64) (_ BitVec 32)) Unit!29986)

(assert (=> d!108717 (= lt!396916 (choose!13 _keys!868 lt!396762 #b00000000000000000000000000000000))))

(assert (=> d!108717 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!108717 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396762 #b00000000000000000000000000000000) lt!396916)))

(declare-fun bs!24620 () Bool)

(assert (= bs!24620 d!108717))

(assert (=> bs!24620 m!816737))

(declare-fun m!817115 () Bool)

(assert (=> bs!24620 m!817115))

(assert (=> b!876884 d!108717))

(declare-fun d!108719 () Bool)

(declare-fun res!595936 () Bool)

(declare-fun e!488271 () Bool)

(assert (=> d!108719 (=> res!595936 e!488271)))

(assert (=> d!108719 (= res!595936 (= (select (arr!24517 _keys!868) #b00000000000000000000000000000000) lt!396762))))

(assert (=> d!108719 (= (arrayContainsKey!0 _keys!868 lt!396762 #b00000000000000000000000000000000) e!488271)))

(declare-fun b!877140 () Bool)

(declare-fun e!488272 () Bool)

(assert (=> b!877140 (= e!488271 e!488272)))

(declare-fun res!595937 () Bool)

(assert (=> b!877140 (=> (not res!595937) (not e!488272))))

(assert (=> b!877140 (= res!595937 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877141 () Bool)

(assert (=> b!877141 (= e!488272 (arrayContainsKey!0 _keys!868 lt!396762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!108719 (not res!595936)) b!877140))

(assert (= (and b!877140 res!595937) b!877141))

(assert (=> d!108719 m!816731))

(declare-fun m!817117 () Bool)

(assert (=> b!877141 m!817117))

(assert (=> b!876884 d!108719))

(declare-fun b!877154 () Bool)

(declare-fun e!488279 () SeekEntryResult!8753)

(declare-fun lt!396925 () SeekEntryResult!8753)

(assert (=> b!877154 (= e!488279 (Found!8753 (index!37385 lt!396925)))))

(declare-fun b!877155 () Bool)

(declare-fun c!92711 () Bool)

(declare-fun lt!396924 () (_ BitVec 64))

(assert (=> b!877155 (= c!92711 (= lt!396924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!488280 () SeekEntryResult!8753)

(assert (=> b!877155 (= e!488279 e!488280)))

(declare-fun b!877156 () Bool)

(declare-fun e!488281 () SeekEntryResult!8753)

(assert (=> b!877156 (= e!488281 Undefined!8753)))

(declare-fun b!877157 () Bool)

(assert (=> b!877157 (= e!488280 (MissingZero!8753 (index!37385 lt!396925)))))

(declare-fun b!877158 () Bool)

(assert (=> b!877158 (= e!488281 e!488279)))

(assert (=> b!877158 (= lt!396924 (select (arr!24517 _keys!868) (index!37385 lt!396925)))))

(declare-fun c!92710 () Bool)

(assert (=> b!877158 (= c!92710 (= lt!396924 (select (arr!24517 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108721 () Bool)

(declare-fun lt!396923 () SeekEntryResult!8753)

(assert (=> d!108721 (and (or ((_ is Undefined!8753) lt!396923) (not ((_ is Found!8753) lt!396923)) (and (bvsge (index!37384 lt!396923) #b00000000000000000000000000000000) (bvslt (index!37384 lt!396923) (size!24957 _keys!868)))) (or ((_ is Undefined!8753) lt!396923) ((_ is Found!8753) lt!396923) (not ((_ is MissingZero!8753) lt!396923)) (and (bvsge (index!37383 lt!396923) #b00000000000000000000000000000000) (bvslt (index!37383 lt!396923) (size!24957 _keys!868)))) (or ((_ is Undefined!8753) lt!396923) ((_ is Found!8753) lt!396923) ((_ is MissingZero!8753) lt!396923) (not ((_ is MissingVacant!8753) lt!396923)) (and (bvsge (index!37386 lt!396923) #b00000000000000000000000000000000) (bvslt (index!37386 lt!396923) (size!24957 _keys!868)))) (or ((_ is Undefined!8753) lt!396923) (ite ((_ is Found!8753) lt!396923) (= (select (arr!24517 _keys!868) (index!37384 lt!396923)) (select (arr!24517 _keys!868) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8753) lt!396923) (= (select (arr!24517 _keys!868) (index!37383 lt!396923)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8753) lt!396923) (= (select (arr!24517 _keys!868) (index!37386 lt!396923)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108721 (= lt!396923 e!488281)))

(declare-fun c!92709 () Bool)

(assert (=> d!108721 (= c!92709 (and ((_ is Intermediate!8753) lt!396925) (undefined!9565 lt!396925)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!50980 (_ BitVec 32)) SeekEntryResult!8753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!108721 (= lt!396925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!24517 _keys!868) #b00000000000000000000000000000000) mask!1196) (select (arr!24517 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196))))

(assert (=> d!108721 (validMask!0 mask!1196)))

(assert (=> d!108721 (= (seekEntryOrOpen!0 (select (arr!24517 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) lt!396923)))

(declare-fun b!877159 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!50980 (_ BitVec 32)) SeekEntryResult!8753)

(assert (=> b!877159 (= e!488280 (seekKeyOrZeroReturnVacant!0 (x!74306 lt!396925) (index!37385 lt!396925) (index!37385 lt!396925) (select (arr!24517 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196))))

(assert (= (and d!108721 c!92709) b!877156))

(assert (= (and d!108721 (not c!92709)) b!877158))

(assert (= (and b!877158 c!92710) b!877154))

(assert (= (and b!877158 (not c!92710)) b!877155))

(assert (= (and b!877155 c!92711) b!877157))

(assert (= (and b!877155 (not c!92711)) b!877159))

(declare-fun m!817119 () Bool)

(assert (=> b!877158 m!817119))

(declare-fun m!817121 () Bool)

(assert (=> d!108721 m!817121))

(declare-fun m!817123 () Bool)

(assert (=> d!108721 m!817123))

(assert (=> d!108721 m!816731))

(declare-fun m!817125 () Bool)

(assert (=> d!108721 m!817125))

(assert (=> d!108721 m!816731))

(assert (=> d!108721 m!817123))

(declare-fun m!817127 () Bool)

(assert (=> d!108721 m!817127))

(assert (=> d!108721 m!816665))

(declare-fun m!817129 () Bool)

(assert (=> d!108721 m!817129))

(assert (=> b!877159 m!816731))

(declare-fun m!817131 () Bool)

(assert (=> b!877159 m!817131))

(assert (=> b!876884 d!108721))

(declare-fun d!108723 () Bool)

(declare-fun e!488282 () Bool)

(assert (=> d!108723 e!488282))

(declare-fun res!595938 () Bool)

(assert (=> d!108723 (=> res!595938 e!488282)))

(declare-fun lt!396929 () Bool)

(assert (=> d!108723 (= res!595938 (not lt!396929))))

(declare-fun lt!396928 () Bool)

(assert (=> d!108723 (= lt!396929 lt!396928)))

(declare-fun lt!396926 () Unit!29986)

(declare-fun e!488283 () Unit!29986)

(assert (=> d!108723 (= lt!396926 e!488283)))

(declare-fun c!92712 () Bool)

(assert (=> d!108723 (= c!92712 lt!396928)))

(assert (=> d!108723 (= lt!396928 (containsKey!403 (toList!5191 lt!396780) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108723 (= (contains!4248 lt!396780 #b0000000000000000000000000000000000000000000000000000000000000000) lt!396929)))

(declare-fun b!877160 () Bool)

(declare-fun lt!396927 () Unit!29986)

(assert (=> b!877160 (= e!488283 lt!396927)))

(assert (=> b!877160 (= lt!396927 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396780) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877160 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396780) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877161 () Bool)

(declare-fun Unit!29998 () Unit!29986)

(assert (=> b!877161 (= e!488283 Unit!29998)))

(declare-fun b!877162 () Bool)

(assert (=> b!877162 (= e!488282 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396780) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108723 c!92712) b!877160))

(assert (= (and d!108723 (not c!92712)) b!877161))

(assert (= (and d!108723 (not res!595938)) b!877162))

(declare-fun m!817133 () Bool)

(assert (=> d!108723 m!817133))

(declare-fun m!817135 () Bool)

(assert (=> b!877160 m!817135))

(declare-fun m!817137 () Bool)

(assert (=> b!877160 m!817137))

(assert (=> b!877160 m!817137))

(declare-fun m!817139 () Bool)

(assert (=> b!877160 m!817139))

(assert (=> b!877162 m!817137))

(assert (=> b!877162 m!817137))

(assert (=> b!877162 m!817139))

(assert (=> d!108625 d!108723))

(assert (=> d!108625 d!108629))

(declare-fun c!92713 () Bool)

(declare-fun d!108725 () Bool)

(assert (=> d!108725 (= c!92713 (and ((_ is Cons!17395) (toList!5191 lt!396823)) (= (_1!5802 (h!18526 (toList!5191 lt!396823))) (_1!5802 (tuple2!11583 k0!854 lt!396715)))))))

(declare-fun e!488284 () Option!425)

(assert (=> d!108725 (= (getValueByKey!419 (toList!5191 lt!396823) (_1!5802 (tuple2!11583 k0!854 lt!396715))) e!488284)))

(declare-fun b!877164 () Bool)

(declare-fun e!488285 () Option!425)

(assert (=> b!877164 (= e!488284 e!488285)))

(declare-fun c!92714 () Bool)

(assert (=> b!877164 (= c!92714 (and ((_ is Cons!17395) (toList!5191 lt!396823)) (not (= (_1!5802 (h!18526 (toList!5191 lt!396823))) (_1!5802 (tuple2!11583 k0!854 lt!396715))))))))

(declare-fun b!877165 () Bool)

(assert (=> b!877165 (= e!488285 (getValueByKey!419 (t!24486 (toList!5191 lt!396823)) (_1!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun b!877163 () Bool)

(assert (=> b!877163 (= e!488284 (Some!424 (_2!5802 (h!18526 (toList!5191 lt!396823)))))))

(declare-fun b!877166 () Bool)

(assert (=> b!877166 (= e!488285 None!423)))

(assert (= (and d!108725 c!92713) b!877163))

(assert (= (and d!108725 (not c!92713)) b!877164))

(assert (= (and b!877164 c!92714) b!877165))

(assert (= (and b!877164 (not c!92714)) b!877166))

(declare-fun m!817141 () Bool)

(assert (=> b!877165 m!817141))

(assert (=> b!876965 d!108725))

(declare-fun d!108727 () Bool)

(declare-fun e!488286 () Bool)

(assert (=> d!108727 e!488286))

(declare-fun res!595939 () Bool)

(assert (=> d!108727 (=> res!595939 e!488286)))

(declare-fun lt!396933 () Bool)

(assert (=> d!108727 (= res!595939 (not lt!396933))))

(declare-fun lt!396932 () Bool)

(assert (=> d!108727 (= lt!396933 lt!396932)))

(declare-fun lt!396930 () Unit!29986)

(declare-fun e!488287 () Unit!29986)

(assert (=> d!108727 (= lt!396930 e!488287)))

(declare-fun c!92715 () Bool)

(assert (=> d!108727 (= c!92715 lt!396932)))

(assert (=> d!108727 (= lt!396932 (containsKey!403 (toList!5191 lt!396815) (_1!5802 lt!396716)))))

(assert (=> d!108727 (= (contains!4248 lt!396815 (_1!5802 lt!396716)) lt!396933)))

(declare-fun b!877167 () Bool)

(declare-fun lt!396931 () Unit!29986)

(assert (=> b!877167 (= e!488287 lt!396931)))

(assert (=> b!877167 (= lt!396931 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396815) (_1!5802 lt!396716)))))

(assert (=> b!877167 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396815) (_1!5802 lt!396716)))))

(declare-fun b!877168 () Bool)

(declare-fun Unit!29999 () Unit!29986)

(assert (=> b!877168 (= e!488287 Unit!29999)))

(declare-fun b!877169 () Bool)

(assert (=> b!877169 (= e!488286 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396815) (_1!5802 lt!396716))))))

(assert (= (and d!108727 c!92715) b!877167))

(assert (= (and d!108727 (not c!92715)) b!877168))

(assert (= (and d!108727 (not res!595939)) b!877169))

(declare-fun m!817143 () Bool)

(assert (=> d!108727 m!817143))

(declare-fun m!817145 () Bool)

(assert (=> b!877167 m!817145))

(assert (=> b!877167 m!816843))

(assert (=> b!877167 m!816843))

(declare-fun m!817147 () Bool)

(assert (=> b!877167 m!817147))

(assert (=> b!877169 m!816843))

(assert (=> b!877169 m!816843))

(assert (=> b!877169 m!817147))

(assert (=> d!108637 d!108727))

(declare-fun d!108729 () Bool)

(declare-fun c!92716 () Bool)

(assert (=> d!108729 (= c!92716 (and ((_ is Cons!17395) lt!396814) (= (_1!5802 (h!18526 lt!396814)) (_1!5802 lt!396716))))))

(declare-fun e!488288 () Option!425)

(assert (=> d!108729 (= (getValueByKey!419 lt!396814 (_1!5802 lt!396716)) e!488288)))

(declare-fun b!877171 () Bool)

(declare-fun e!488289 () Option!425)

(assert (=> b!877171 (= e!488288 e!488289)))

(declare-fun c!92717 () Bool)

(assert (=> b!877171 (= c!92717 (and ((_ is Cons!17395) lt!396814) (not (= (_1!5802 (h!18526 lt!396814)) (_1!5802 lt!396716)))))))

(declare-fun b!877172 () Bool)

(assert (=> b!877172 (= e!488289 (getValueByKey!419 (t!24486 lt!396814) (_1!5802 lt!396716)))))

(declare-fun b!877170 () Bool)

(assert (=> b!877170 (= e!488288 (Some!424 (_2!5802 (h!18526 lt!396814))))))

(declare-fun b!877173 () Bool)

(assert (=> b!877173 (= e!488289 None!423)))

(assert (= (and d!108729 c!92716) b!877170))

(assert (= (and d!108729 (not c!92716)) b!877171))

(assert (= (and b!877171 c!92717) b!877172))

(assert (= (and b!877171 (not c!92717)) b!877173))

(declare-fun m!817149 () Bool)

(assert (=> b!877172 m!817149))

(assert (=> d!108637 d!108729))

(declare-fun d!108731 () Bool)

(assert (=> d!108731 (= (getValueByKey!419 lt!396814 (_1!5802 lt!396716)) (Some!424 (_2!5802 lt!396716)))))

(declare-fun lt!396934 () Unit!29986)

(assert (=> d!108731 (= lt!396934 (choose!1433 lt!396814 (_1!5802 lt!396716) (_2!5802 lt!396716)))))

(declare-fun e!488290 () Bool)

(assert (=> d!108731 e!488290))

(declare-fun res!595940 () Bool)

(assert (=> d!108731 (=> (not res!595940) (not e!488290))))

(assert (=> d!108731 (= res!595940 (isStrictlySorted!461 lt!396814))))

(assert (=> d!108731 (= (lemmaContainsTupThenGetReturnValue!233 lt!396814 (_1!5802 lt!396716) (_2!5802 lt!396716)) lt!396934)))

(declare-fun b!877174 () Bool)

(declare-fun res!595941 () Bool)

(assert (=> b!877174 (=> (not res!595941) (not e!488290))))

(assert (=> b!877174 (= res!595941 (containsKey!403 lt!396814 (_1!5802 lt!396716)))))

(declare-fun b!877175 () Bool)

(assert (=> b!877175 (= e!488290 (contains!4249 lt!396814 (tuple2!11583 (_1!5802 lt!396716) (_2!5802 lt!396716))))))

(assert (= (and d!108731 res!595940) b!877174))

(assert (= (and b!877174 res!595941) b!877175))

(assert (=> d!108731 m!816837))

(declare-fun m!817151 () Bool)

(assert (=> d!108731 m!817151))

(declare-fun m!817153 () Bool)

(assert (=> d!108731 m!817153))

(declare-fun m!817155 () Bool)

(assert (=> b!877174 m!817155))

(declare-fun m!817157 () Bool)

(assert (=> b!877175 m!817157))

(assert (=> d!108637 d!108731))

(declare-fun b!877176 () Bool)

(declare-fun e!488294 () List!17399)

(declare-fun call!38831 () List!17399)

(assert (=> b!877176 (= e!488294 call!38831)))

(declare-fun b!877177 () Bool)

(declare-fun c!92718 () Bool)

(assert (=> b!877177 (= c!92718 (and ((_ is Cons!17395) (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)))) (bvsgt (_1!5802 (h!18526 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715))))) (_1!5802 lt!396716))))))

(declare-fun e!488291 () List!17399)

(assert (=> b!877177 (= e!488291 e!488294)))

(declare-fun bm!38827 () Bool)

(declare-fun e!488295 () List!17399)

(declare-fun call!38830 () List!17399)

(declare-fun c!92719 () Bool)

(assert (=> bm!38827 (= call!38830 ($colon$colon!538 e!488295 (ite c!92719 (h!18526 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)))) (tuple2!11583 (_1!5802 lt!396716) (_2!5802 lt!396716)))))))

(declare-fun c!92720 () Bool)

(assert (=> bm!38827 (= c!92720 c!92719)))

(declare-fun b!877179 () Bool)

(assert (=> b!877179 (= e!488294 call!38831)))

(declare-fun b!877180 () Bool)

(declare-fun e!488293 () List!17399)

(assert (=> b!877180 (= e!488293 e!488291)))

(declare-fun c!92721 () Bool)

(assert (=> b!877180 (= c!92721 (and ((_ is Cons!17395) (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)))) (= (_1!5802 (h!18526 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715))))) (_1!5802 lt!396716))))))

(declare-fun bm!38828 () Bool)

(declare-fun call!38832 () List!17399)

(assert (=> bm!38828 (= call!38831 call!38832)))

(declare-fun b!877181 () Bool)

(assert (=> b!877181 (= e!488295 (insertStrictlySorted!272 (t!24486 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)))) (_1!5802 lt!396716) (_2!5802 lt!396716)))))

(declare-fun b!877178 () Bool)

(assert (=> b!877178 (= e!488293 call!38830)))

(declare-fun d!108733 () Bool)

(declare-fun e!488292 () Bool)

(assert (=> d!108733 e!488292))

(declare-fun res!595943 () Bool)

(assert (=> d!108733 (=> (not res!595943) (not e!488292))))

(declare-fun lt!396935 () List!17399)

(assert (=> d!108733 (= res!595943 (isStrictlySorted!461 lt!396935))))

(assert (=> d!108733 (= lt!396935 e!488293)))

(assert (=> d!108733 (= c!92719 (and ((_ is Cons!17395) (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)))) (bvslt (_1!5802 (h!18526 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715))))) (_1!5802 lt!396716))))))

(assert (=> d!108733 (isStrictlySorted!461 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715))))))

(assert (=> d!108733 (= (insertStrictlySorted!272 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715))) (_1!5802 lt!396716) (_2!5802 lt!396716)) lt!396935)))

(declare-fun bm!38829 () Bool)

(assert (=> bm!38829 (= call!38832 call!38830)))

(declare-fun b!877182 () Bool)

(declare-fun res!595942 () Bool)

(assert (=> b!877182 (=> (not res!595942) (not e!488292))))

(assert (=> b!877182 (= res!595942 (containsKey!403 lt!396935 (_1!5802 lt!396716)))))

(declare-fun b!877183 () Bool)

(assert (=> b!877183 (= e!488291 call!38832)))

(declare-fun b!877184 () Bool)

(assert (=> b!877184 (= e!488292 (contains!4249 lt!396935 (tuple2!11583 (_1!5802 lt!396716) (_2!5802 lt!396716))))))

(declare-fun b!877185 () Bool)

(assert (=> b!877185 (= e!488295 (ite c!92721 (t!24486 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)))) (ite c!92718 (Cons!17395 (h!18526 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)))) (t!24486 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715))))) Nil!17396)))))

(assert (= (and d!108733 c!92719) b!877178))

(assert (= (and d!108733 (not c!92719)) b!877180))

(assert (= (and b!877180 c!92721) b!877183))

(assert (= (and b!877180 (not c!92721)) b!877177))

(assert (= (and b!877177 c!92718) b!877179))

(assert (= (and b!877177 (not c!92718)) b!877176))

(assert (= (or b!877179 b!877176) bm!38828))

(assert (= (or b!877183 bm!38828) bm!38829))

(assert (= (or b!877178 bm!38829) bm!38827))

(assert (= (and bm!38827 c!92720) b!877181))

(assert (= (and bm!38827 (not c!92720)) b!877185))

(assert (= (and d!108733 res!595943) b!877182))

(assert (= (and b!877182 res!595942) b!877184))

(declare-fun m!817159 () Bool)

(assert (=> d!108733 m!817159))

(declare-fun m!817161 () Bool)

(assert (=> d!108733 m!817161))

(declare-fun m!817163 () Bool)

(assert (=> b!877182 m!817163))

(declare-fun m!817165 () Bool)

(assert (=> b!877184 m!817165))

(declare-fun m!817167 () Bool)

(assert (=> b!877181 m!817167))

(declare-fun m!817169 () Bool)

(assert (=> bm!38827 m!817169))

(assert (=> d!108637 d!108733))

(declare-fun d!108735 () Bool)

(declare-fun e!488296 () Bool)

(assert (=> d!108735 e!488296))

(declare-fun res!595944 () Bool)

(assert (=> d!108735 (=> res!595944 e!488296)))

(declare-fun lt!396939 () Bool)

(assert (=> d!108735 (= res!595944 (not lt!396939))))

(declare-fun lt!396938 () Bool)

(assert (=> d!108735 (= lt!396939 lt!396938)))

(declare-fun lt!396936 () Unit!29986)

(declare-fun e!488297 () Unit!29986)

(assert (=> d!108735 (= lt!396936 e!488297)))

(declare-fun c!92722 () Bool)

(assert (=> d!108735 (= c!92722 lt!396938)))

(assert (=> d!108735 (= lt!396938 (containsKey!403 (toList!5191 lt!396780) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108735 (= (contains!4248 lt!396780 #b1000000000000000000000000000000000000000000000000000000000000000) lt!396939)))

(declare-fun b!877186 () Bool)

(declare-fun lt!396937 () Unit!29986)

(assert (=> b!877186 (= e!488297 lt!396937)))

(assert (=> b!877186 (= lt!396937 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396780) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877186 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396780) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877187 () Bool)

(declare-fun Unit!30000 () Unit!29986)

(assert (=> b!877187 (= e!488297 Unit!30000)))

(declare-fun b!877188 () Bool)

(assert (=> b!877188 (= e!488296 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396780) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108735 c!92722) b!877186))

(assert (= (and d!108735 (not c!92722)) b!877187))

(assert (= (and d!108735 (not res!595944)) b!877188))

(declare-fun m!817171 () Bool)

(assert (=> d!108735 m!817171))

(declare-fun m!817173 () Bool)

(assert (=> b!877186 m!817173))

(declare-fun m!817175 () Bool)

(assert (=> b!877186 m!817175))

(assert (=> b!877186 m!817175))

(declare-fun m!817177 () Bool)

(assert (=> b!877186 m!817177))

(assert (=> b!877188 m!817175))

(assert (=> b!877188 m!817175))

(assert (=> b!877188 m!817177))

(assert (=> b!876913 d!108735))

(declare-fun d!108737 () Bool)

(declare-fun e!488298 () Bool)

(assert (=> d!108737 e!488298))

(declare-fun res!595945 () Bool)

(assert (=> d!108737 (=> res!595945 e!488298)))

(declare-fun lt!396943 () Bool)

(assert (=> d!108737 (= res!595945 (not lt!396943))))

(declare-fun lt!396942 () Bool)

(assert (=> d!108737 (= lt!396943 lt!396942)))

(declare-fun lt!396940 () Unit!29986)

(declare-fun e!488299 () Unit!29986)

(assert (=> d!108737 (= lt!396940 e!488299)))

(declare-fun c!92723 () Bool)

(assert (=> d!108737 (= c!92723 lt!396942)))

(assert (=> d!108737 (= lt!396942 (containsKey!403 (toList!5191 lt!396808) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(assert (=> d!108737 (= (contains!4248 lt!396808 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))) lt!396943)))

(declare-fun b!877189 () Bool)

(declare-fun lt!396941 () Unit!29986)

(assert (=> b!877189 (= e!488299 lt!396941)))

(assert (=> b!877189 (= lt!396941 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396808) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(assert (=> b!877189 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396808) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun b!877190 () Bool)

(declare-fun Unit!30001 () Unit!29986)

(assert (=> b!877190 (= e!488299 Unit!30001)))

(declare-fun b!877191 () Bool)

(assert (=> b!877191 (= e!488298 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396808) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(assert (= (and d!108737 c!92723) b!877189))

(assert (= (and d!108737 (not c!92723)) b!877190))

(assert (= (and d!108737 (not res!595945)) b!877191))

(declare-fun m!817179 () Bool)

(assert (=> d!108737 m!817179))

(declare-fun m!817181 () Bool)

(assert (=> b!877189 m!817181))

(assert (=> b!877189 m!816825))

(assert (=> b!877189 m!816825))

(declare-fun m!817183 () Bool)

(assert (=> b!877189 m!817183))

(assert (=> b!877191 m!816825))

(assert (=> b!877191 m!816825))

(assert (=> b!877191 m!817183))

(assert (=> d!108633 d!108737))

(declare-fun d!108739 () Bool)

(declare-fun c!92724 () Bool)

(assert (=> d!108739 (= c!92724 (and ((_ is Cons!17395) lt!396807) (= (_1!5802 (h!18526 lt!396807)) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(declare-fun e!488300 () Option!425)

(assert (=> d!108739 (= (getValueByKey!419 lt!396807 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))) e!488300)))

(declare-fun b!877193 () Bool)

(declare-fun e!488301 () Option!425)

(assert (=> b!877193 (= e!488300 e!488301)))

(declare-fun c!92725 () Bool)

(assert (=> b!877193 (= c!92725 (and ((_ is Cons!17395) lt!396807) (not (= (_1!5802 (h!18526 lt!396807)) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))))

(declare-fun b!877194 () Bool)

(assert (=> b!877194 (= e!488301 (getValueByKey!419 (t!24486 lt!396807) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun b!877192 () Bool)

(assert (=> b!877192 (= e!488300 (Some!424 (_2!5802 (h!18526 lt!396807))))))

(declare-fun b!877195 () Bool)

(assert (=> b!877195 (= e!488301 None!423)))

(assert (= (and d!108739 c!92724) b!877192))

(assert (= (and d!108739 (not c!92724)) b!877193))

(assert (= (and b!877193 c!92725) b!877194))

(assert (= (and b!877193 (not c!92725)) b!877195))

(declare-fun m!817185 () Bool)

(assert (=> b!877194 m!817185))

(assert (=> d!108633 d!108739))

(declare-fun d!108741 () Bool)

(assert (=> d!108741 (= (getValueByKey!419 lt!396807 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun lt!396944 () Unit!29986)

(assert (=> d!108741 (= lt!396944 (choose!1433 lt!396807 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun e!488302 () Bool)

(assert (=> d!108741 e!488302))

(declare-fun res!595946 () Bool)

(assert (=> d!108741 (=> (not res!595946) (not e!488302))))

(assert (=> d!108741 (= res!595946 (isStrictlySorted!461 lt!396807))))

(assert (=> d!108741 (= (lemmaContainsTupThenGetReturnValue!233 lt!396807 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))) lt!396944)))

(declare-fun b!877196 () Bool)

(declare-fun res!595947 () Bool)

(assert (=> b!877196 (=> (not res!595947) (not e!488302))))

(assert (=> b!877196 (= res!595947 (containsKey!403 lt!396807 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun b!877197 () Bool)

(assert (=> b!877197 (= e!488302 (contains!4249 lt!396807 (tuple2!11583 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(assert (= (and d!108741 res!595946) b!877196))

(assert (= (and b!877196 res!595947) b!877197))

(assert (=> d!108741 m!816819))

(declare-fun m!817187 () Bool)

(assert (=> d!108741 m!817187))

(declare-fun m!817189 () Bool)

(assert (=> d!108741 m!817189))

(declare-fun m!817191 () Bool)

(assert (=> b!877196 m!817191))

(declare-fun m!817193 () Bool)

(assert (=> b!877197 m!817193))

(assert (=> d!108633 d!108741))

(declare-fun b!877198 () Bool)

(declare-fun e!488306 () List!17399)

(declare-fun call!38834 () List!17399)

(assert (=> b!877198 (= e!488306 call!38834)))

(declare-fun c!92726 () Bool)

(declare-fun b!877199 () Bool)

(assert (=> b!877199 (= c!92726 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (bvsgt (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(declare-fun e!488303 () List!17399)

(assert (=> b!877199 (= e!488303 e!488306)))

(declare-fun e!488307 () List!17399)

(declare-fun call!38833 () List!17399)

(declare-fun c!92727 () Bool)

(declare-fun bm!38830 () Bool)

(assert (=> bm!38830 (= call!38833 ($colon$colon!538 e!488307 (ite c!92727 (h!18526 (toList!5191 lt!396719)) (tuple2!11583 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))))

(declare-fun c!92728 () Bool)

(assert (=> bm!38830 (= c!92728 c!92727)))

(declare-fun b!877201 () Bool)

(assert (=> b!877201 (= e!488306 call!38834)))

(declare-fun b!877202 () Bool)

(declare-fun e!488305 () List!17399)

(assert (=> b!877202 (= e!488305 e!488303)))

(declare-fun c!92729 () Bool)

(assert (=> b!877202 (= c!92729 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (= (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(declare-fun bm!38831 () Bool)

(declare-fun call!38835 () List!17399)

(assert (=> bm!38831 (= call!38834 call!38835)))

(declare-fun b!877203 () Bool)

(assert (=> b!877203 (= e!488307 (insertStrictlySorted!272 (t!24486 (toList!5191 lt!396719)) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun b!877200 () Bool)

(assert (=> b!877200 (= e!488305 call!38833)))

(declare-fun d!108743 () Bool)

(declare-fun e!488304 () Bool)

(assert (=> d!108743 e!488304))

(declare-fun res!595949 () Bool)

(assert (=> d!108743 (=> (not res!595949) (not e!488304))))

(declare-fun lt!396945 () List!17399)

(assert (=> d!108743 (= res!595949 (isStrictlySorted!461 lt!396945))))

(assert (=> d!108743 (= lt!396945 e!488305)))

(assert (=> d!108743 (= c!92727 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (bvslt (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(assert (=> d!108743 (isStrictlySorted!461 (toList!5191 lt!396719))))

(assert (=> d!108743 (= (insertStrictlySorted!272 (toList!5191 lt!396719) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))) lt!396945)))

(declare-fun bm!38832 () Bool)

(assert (=> bm!38832 (= call!38835 call!38833)))

(declare-fun b!877204 () Bool)

(declare-fun res!595948 () Bool)

(assert (=> b!877204 (=> (not res!595948) (not e!488304))))

(assert (=> b!877204 (= res!595948 (containsKey!403 lt!396945 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun b!877205 () Bool)

(assert (=> b!877205 (= e!488303 call!38835)))

(declare-fun b!877206 () Bool)

(assert (=> b!877206 (= e!488304 (contains!4249 lt!396945 (tuple2!11583 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(declare-fun b!877207 () Bool)

(assert (=> b!877207 (= e!488307 (ite c!92729 (t!24486 (toList!5191 lt!396719)) (ite c!92726 (Cons!17395 (h!18526 (toList!5191 lt!396719)) (t!24486 (toList!5191 lt!396719))) Nil!17396)))))

(assert (= (and d!108743 c!92727) b!877200))

(assert (= (and d!108743 (not c!92727)) b!877202))

(assert (= (and b!877202 c!92729) b!877205))

(assert (= (and b!877202 (not c!92729)) b!877199))

(assert (= (and b!877199 c!92726) b!877201))

(assert (= (and b!877199 (not c!92726)) b!877198))

(assert (= (or b!877201 b!877198) bm!38831))

(assert (= (or b!877205 bm!38831) bm!38832))

(assert (= (or b!877200 bm!38832) bm!38830))

(assert (= (and bm!38830 c!92728) b!877203))

(assert (= (and bm!38830 (not c!92728)) b!877207))

(assert (= (and d!108743 res!595949) b!877204))

(assert (= (and b!877204 res!595948) b!877206))

(declare-fun m!817195 () Bool)

(assert (=> d!108743 m!817195))

(assert (=> d!108743 m!817005))

(declare-fun m!817197 () Bool)

(assert (=> b!877204 m!817197))

(declare-fun m!817199 () Bool)

(assert (=> b!877206 m!817199))

(declare-fun m!817201 () Bool)

(assert (=> b!877203 m!817201))

(declare-fun m!817203 () Bool)

(assert (=> bm!38830 m!817203))

(assert (=> d!108633 d!108743))

(declare-fun d!108745 () Bool)

(assert (=> d!108745 (= (get!12897 (select (arr!24518 _values!688) from!1053) lt!396714) lt!396714)))

(assert (=> b!876964 d!108745))

(declare-fun d!108747 () Bool)

(declare-fun e!488308 () Bool)

(assert (=> d!108747 e!488308))

(declare-fun res!595950 () Bool)

(assert (=> d!108747 (=> res!595950 e!488308)))

(declare-fun lt!396949 () Bool)

(assert (=> d!108747 (= res!595950 (not lt!396949))))

(declare-fun lt!396948 () Bool)

(assert (=> d!108747 (= lt!396949 lt!396948)))

(declare-fun lt!396946 () Unit!29986)

(declare-fun e!488309 () Unit!29986)

(assert (=> d!108747 (= lt!396946 e!488309)))

(declare-fun c!92730 () Bool)

(assert (=> d!108747 (= c!92730 lt!396948)))

(assert (=> d!108747 (= lt!396948 (containsKey!403 (toList!5191 lt!396787) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108747 (= (contains!4248 lt!396787 #b1000000000000000000000000000000000000000000000000000000000000000) lt!396949)))

(declare-fun b!877208 () Bool)

(declare-fun lt!396947 () Unit!29986)

(assert (=> b!877208 (= e!488309 lt!396947)))

(assert (=> b!877208 (= lt!396947 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396787) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877208 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396787) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877209 () Bool)

(declare-fun Unit!30002 () Unit!29986)

(assert (=> b!877209 (= e!488309 Unit!30002)))

(declare-fun b!877210 () Bool)

(assert (=> b!877210 (= e!488308 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108747 c!92730) b!877208))

(assert (= (and d!108747 (not c!92730)) b!877209))

(assert (= (and d!108747 (not res!595950)) b!877210))

(declare-fun m!817205 () Bool)

(assert (=> d!108747 m!817205))

(declare-fun m!817207 () Bool)

(assert (=> b!877208 m!817207))

(declare-fun m!817209 () Bool)

(assert (=> b!877208 m!817209))

(assert (=> b!877208 m!817209))

(declare-fun m!817211 () Bool)

(assert (=> b!877208 m!817211))

(assert (=> b!877210 m!817209))

(assert (=> b!877210 m!817209))

(assert (=> b!877210 m!817211))

(assert (=> b!876925 d!108747))

(declare-fun c!92731 () Bool)

(declare-fun d!108749 () Bool)

(assert (=> d!108749 (= c!92731 (and ((_ is Cons!17395) (toList!5191 lt!396808)) (= (_1!5802 (h!18526 (toList!5191 lt!396808))) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))))

(declare-fun e!488310 () Option!425)

(assert (=> d!108749 (= (getValueByKey!419 (toList!5191 lt!396808) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))) e!488310)))

(declare-fun b!877212 () Bool)

(declare-fun e!488311 () Option!425)

(assert (=> b!877212 (= e!488310 e!488311)))

(declare-fun c!92732 () Bool)

(assert (=> b!877212 (= c!92732 (and ((_ is Cons!17395) (toList!5191 lt!396808)) (not (= (_1!5802 (h!18526 (toList!5191 lt!396808))) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))))

(declare-fun b!877213 () Bool)

(assert (=> b!877213 (= e!488311 (getValueByKey!419 (t!24486 (toList!5191 lt!396808)) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717))))))

(declare-fun b!877211 () Bool)

(assert (=> b!877211 (= e!488310 (Some!424 (_2!5802 (h!18526 (toList!5191 lt!396808)))))))

(declare-fun b!877214 () Bool)

(assert (=> b!877214 (= e!488311 None!423)))

(assert (= (and d!108749 c!92731) b!877211))

(assert (= (and d!108749 (not c!92731)) b!877212))

(assert (= (and b!877212 c!92732) b!877213))

(assert (= (and b!877212 (not c!92732)) b!877214))

(declare-fun m!817213 () Bool)

(assert (=> b!877213 m!817213))

(assert (=> b!876951 d!108749))

(declare-fun d!108751 () Bool)

(declare-fun e!488312 () Bool)

(assert (=> d!108751 e!488312))

(declare-fun res!595952 () Bool)

(assert (=> d!108751 (=> (not res!595952) (not e!488312))))

(declare-fun lt!396952 () ListLongMap!10351)

(assert (=> d!108751 (= res!595952 (contains!4248 lt!396952 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396951 () List!17399)

(assert (=> d!108751 (= lt!396952 (ListLongMap!10352 lt!396951))))

(declare-fun lt!396950 () Unit!29986)

(declare-fun lt!396953 () Unit!29986)

(assert (=> d!108751 (= lt!396950 lt!396953)))

(assert (=> d!108751 (= (getValueByKey!419 lt!396951 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108751 (= lt!396953 (lemmaContainsTupThenGetReturnValue!233 lt!396951 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108751 (= lt!396951 (insertStrictlySorted!272 (toList!5191 call!38806) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108751 (= (+!2491 call!38806 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396952)))

(declare-fun b!877215 () Bool)

(declare-fun res!595951 () Bool)

(assert (=> b!877215 (=> (not res!595951) (not e!488312))))

(assert (=> b!877215 (= res!595951 (= (getValueByKey!419 (toList!5191 lt!396952) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!877216 () Bool)

(assert (=> b!877216 (= e!488312 (contains!4249 (toList!5191 lt!396952) (tuple2!11583 (select (arr!24517 _keys!868) from!1053) (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108751 res!595952) b!877215))

(assert (= (and b!877215 res!595951) b!877216))

(declare-fun m!817215 () Bool)

(assert (=> d!108751 m!817215))

(declare-fun m!817217 () Bool)

(assert (=> d!108751 m!817217))

(declare-fun m!817219 () Bool)

(assert (=> d!108751 m!817219))

(declare-fun m!817221 () Bool)

(assert (=> d!108751 m!817221))

(declare-fun m!817223 () Bool)

(assert (=> b!877215 m!817223))

(declare-fun m!817225 () Bool)

(assert (=> b!877216 m!817225))

(assert (=> b!876927 d!108751))

(declare-fun d!108753 () Bool)

(assert (=> d!108753 (not (contains!4248 (+!2491 lt!396785 (tuple2!11583 lt!396790 lt!396786)) lt!396788))))

(declare-fun lt!396954 () Unit!29986)

(assert (=> d!108753 (= lt!396954 (choose!1432 lt!396785 lt!396790 lt!396786 lt!396788))))

(declare-fun e!488313 () Bool)

(assert (=> d!108753 e!488313))

(declare-fun res!595953 () Bool)

(assert (=> d!108753 (=> (not res!595953) (not e!488313))))

(assert (=> d!108753 (= res!595953 (not (contains!4248 lt!396785 lt!396788)))))

(assert (=> d!108753 (= (addStillNotContains!202 lt!396785 lt!396790 lt!396786 lt!396788) lt!396954)))

(declare-fun b!877217 () Bool)

(assert (=> b!877217 (= e!488313 (not (= lt!396790 lt!396788)))))

(assert (= (and d!108753 res!595953) b!877217))

(assert (=> d!108753 m!816771))

(assert (=> d!108753 m!816771))

(assert (=> d!108753 m!816773))

(declare-fun m!817227 () Bool)

(assert (=> d!108753 m!817227))

(declare-fun m!817229 () Bool)

(assert (=> d!108753 m!817229))

(assert (=> b!876927 d!108753))

(declare-fun d!108755 () Bool)

(declare-fun e!488314 () Bool)

(assert (=> d!108755 e!488314))

(declare-fun res!595955 () Bool)

(assert (=> d!108755 (=> (not res!595955) (not e!488314))))

(declare-fun lt!396957 () ListLongMap!10351)

(assert (=> d!108755 (= res!595955 (contains!4248 lt!396957 (_1!5802 (tuple2!11583 lt!396790 lt!396786))))))

(declare-fun lt!396956 () List!17399)

(assert (=> d!108755 (= lt!396957 (ListLongMap!10352 lt!396956))))

(declare-fun lt!396955 () Unit!29986)

(declare-fun lt!396958 () Unit!29986)

(assert (=> d!108755 (= lt!396955 lt!396958)))

(assert (=> d!108755 (= (getValueByKey!419 lt!396956 (_1!5802 (tuple2!11583 lt!396790 lt!396786))) (Some!424 (_2!5802 (tuple2!11583 lt!396790 lt!396786))))))

(assert (=> d!108755 (= lt!396958 (lemmaContainsTupThenGetReturnValue!233 lt!396956 (_1!5802 (tuple2!11583 lt!396790 lt!396786)) (_2!5802 (tuple2!11583 lt!396790 lt!396786))))))

(assert (=> d!108755 (= lt!396956 (insertStrictlySorted!272 (toList!5191 lt!396785) (_1!5802 (tuple2!11583 lt!396790 lt!396786)) (_2!5802 (tuple2!11583 lt!396790 lt!396786))))))

(assert (=> d!108755 (= (+!2491 lt!396785 (tuple2!11583 lt!396790 lt!396786)) lt!396957)))

(declare-fun b!877218 () Bool)

(declare-fun res!595954 () Bool)

(assert (=> b!877218 (=> (not res!595954) (not e!488314))))

(assert (=> b!877218 (= res!595954 (= (getValueByKey!419 (toList!5191 lt!396957) (_1!5802 (tuple2!11583 lt!396790 lt!396786))) (Some!424 (_2!5802 (tuple2!11583 lt!396790 lt!396786)))))))

(declare-fun b!877219 () Bool)

(assert (=> b!877219 (= e!488314 (contains!4249 (toList!5191 lt!396957) (tuple2!11583 lt!396790 lt!396786)))))

(assert (= (and d!108755 res!595955) b!877218))

(assert (= (and b!877218 res!595954) b!877219))

(declare-fun m!817231 () Bool)

(assert (=> d!108755 m!817231))

(declare-fun m!817233 () Bool)

(assert (=> d!108755 m!817233))

(declare-fun m!817235 () Bool)

(assert (=> d!108755 m!817235))

(declare-fun m!817237 () Bool)

(assert (=> d!108755 m!817237))

(declare-fun m!817239 () Bool)

(assert (=> b!877218 m!817239))

(declare-fun m!817241 () Bool)

(assert (=> b!877219 m!817241))

(assert (=> b!876927 d!108755))

(declare-fun d!108757 () Bool)

(declare-fun c!92733 () Bool)

(assert (=> d!108757 (= c!92733 ((_ is ValueCellFull!8274) (select (arr!24518 _values!688) from!1053)))))

(declare-fun e!488315 () V!28283)

(assert (=> d!108757 (= (get!12894 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488315)))

(declare-fun b!877220 () Bool)

(assert (=> b!877220 (= e!488315 (get!12896 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877221 () Bool)

(assert (=> b!877221 (= e!488315 (get!12897 (select (arr!24518 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108757 c!92733) b!877220))

(assert (= (and d!108757 (not c!92733)) b!877221))

(assert (=> b!877220 m!816647))

(assert (=> b!877220 m!816653))

(declare-fun m!817243 () Bool)

(assert (=> b!877220 m!817243))

(assert (=> b!877221 m!816647))

(assert (=> b!877221 m!816653))

(declare-fun m!817245 () Bool)

(assert (=> b!877221 m!817245))

(assert (=> b!876927 d!108757))

(declare-fun d!108759 () Bool)

(declare-fun e!488316 () Bool)

(assert (=> d!108759 e!488316))

(declare-fun res!595956 () Bool)

(assert (=> d!108759 (=> res!595956 e!488316)))

(declare-fun lt!396962 () Bool)

(assert (=> d!108759 (= res!595956 (not lt!396962))))

(declare-fun lt!396961 () Bool)

(assert (=> d!108759 (= lt!396962 lt!396961)))

(declare-fun lt!396959 () Unit!29986)

(declare-fun e!488317 () Unit!29986)

(assert (=> d!108759 (= lt!396959 e!488317)))

(declare-fun c!92734 () Bool)

(assert (=> d!108759 (= c!92734 lt!396961)))

(assert (=> d!108759 (= lt!396961 (containsKey!403 (toList!5191 (+!2491 lt!396785 (tuple2!11583 lt!396790 lt!396786))) lt!396788))))

(assert (=> d!108759 (= (contains!4248 (+!2491 lt!396785 (tuple2!11583 lt!396790 lt!396786)) lt!396788) lt!396962)))

(declare-fun b!877222 () Bool)

(declare-fun lt!396960 () Unit!29986)

(assert (=> b!877222 (= e!488317 lt!396960)))

(assert (=> b!877222 (= lt!396960 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 (+!2491 lt!396785 (tuple2!11583 lt!396790 lt!396786))) lt!396788))))

(assert (=> b!877222 (isDefined!313 (getValueByKey!419 (toList!5191 (+!2491 lt!396785 (tuple2!11583 lt!396790 lt!396786))) lt!396788))))

(declare-fun b!877223 () Bool)

(declare-fun Unit!30003 () Unit!29986)

(assert (=> b!877223 (= e!488317 Unit!30003)))

(declare-fun b!877224 () Bool)

(assert (=> b!877224 (= e!488316 (isDefined!313 (getValueByKey!419 (toList!5191 (+!2491 lt!396785 (tuple2!11583 lt!396790 lt!396786))) lt!396788)))))

(assert (= (and d!108759 c!92734) b!877222))

(assert (= (and d!108759 (not c!92734)) b!877223))

(assert (= (and d!108759 (not res!595956)) b!877224))

(declare-fun m!817247 () Bool)

(assert (=> d!108759 m!817247))

(declare-fun m!817249 () Bool)

(assert (=> b!877222 m!817249))

(declare-fun m!817251 () Bool)

(assert (=> b!877222 m!817251))

(assert (=> b!877222 m!817251))

(declare-fun m!817253 () Bool)

(assert (=> b!877222 m!817253))

(assert (=> b!877224 m!817251))

(assert (=> b!877224 m!817251))

(assert (=> b!877224 m!817253))

(assert (=> b!876927 d!108759))

(declare-fun d!108761 () Bool)

(declare-fun lt!396965 () Bool)

(declare-fun content!392 (List!17399) (InoxSet tuple2!11582))

(assert (=> d!108761 (= lt!396965 (select (content!392 (toList!5191 lt!396815)) lt!396716))))

(declare-fun e!488322 () Bool)

(assert (=> d!108761 (= lt!396965 e!488322)))

(declare-fun res!595962 () Bool)

(assert (=> d!108761 (=> (not res!595962) (not e!488322))))

(assert (=> d!108761 (= res!595962 ((_ is Cons!17395) (toList!5191 lt!396815)))))

(assert (=> d!108761 (= (contains!4249 (toList!5191 lt!396815) lt!396716) lt!396965)))

(declare-fun b!877229 () Bool)

(declare-fun e!488323 () Bool)

(assert (=> b!877229 (= e!488322 e!488323)))

(declare-fun res!595961 () Bool)

(assert (=> b!877229 (=> res!595961 e!488323)))

(assert (=> b!877229 (= res!595961 (= (h!18526 (toList!5191 lt!396815)) lt!396716))))

(declare-fun b!877230 () Bool)

(assert (=> b!877230 (= e!488323 (contains!4249 (t!24486 (toList!5191 lt!396815)) lt!396716))))

(assert (= (and d!108761 res!595962) b!877229))

(assert (= (and b!877229 (not res!595961)) b!877230))

(declare-fun m!817255 () Bool)

(assert (=> d!108761 m!817255))

(declare-fun m!817257 () Bool)

(assert (=> d!108761 m!817257))

(declare-fun m!817259 () Bool)

(assert (=> b!877230 m!817259))

(assert (=> b!876954 d!108761))

(declare-fun b!877231 () Bool)

(declare-fun e!488329 () ListLongMap!10351)

(declare-fun call!38836 () ListLongMap!10351)

(assert (=> b!877231 (= e!488329 call!38836)))

(declare-fun d!108763 () Bool)

(declare-fun e!488328 () Bool)

(assert (=> d!108763 e!488328))

(declare-fun res!595964 () Bool)

(assert (=> d!108763 (=> (not res!595964) (not e!488328))))

(declare-fun lt!396969 () ListLongMap!10351)

(assert (=> d!108763 (= res!595964 (not (contains!4248 lt!396969 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488327 () ListLongMap!10351)

(assert (=> d!108763 (= lt!396969 e!488327)))

(declare-fun c!92736 () Bool)

(assert (=> d!108763 (= c!92736 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> d!108763 (validMask!0 mask!1196)))

(assert (=> d!108763 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!396969)))

(declare-fun e!488330 () Bool)

(declare-fun b!877232 () Bool)

(assert (=> b!877232 (= e!488330 (= lt!396969 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877233 () Bool)

(declare-fun res!595965 () Bool)

(assert (=> b!877233 (=> (not res!595965) (not e!488328))))

(assert (=> b!877233 (= res!595965 (not (contains!4248 lt!396969 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877234 () Bool)

(assert (=> b!877234 (= e!488327 e!488329)))

(declare-fun c!92737 () Bool)

(assert (=> b!877234 (= c!92737 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!877235 () Bool)

(declare-fun lt!396971 () Unit!29986)

(declare-fun lt!396966 () Unit!29986)

(assert (=> b!877235 (= lt!396971 lt!396966)))

(declare-fun lt!396972 () (_ BitVec 64))

(declare-fun lt!396967 () ListLongMap!10351)

(declare-fun lt!396968 () V!28283)

(declare-fun lt!396970 () (_ BitVec 64))

(assert (=> b!877235 (not (contains!4248 (+!2491 lt!396967 (tuple2!11583 lt!396972 lt!396968)) lt!396970))))

(assert (=> b!877235 (= lt!396966 (addStillNotContains!202 lt!396967 lt!396972 lt!396968 lt!396970))))

(assert (=> b!877235 (= lt!396970 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877235 (= lt!396968 (get!12894 (select (arr!24518 lt!396722) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877235 (= lt!396972 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)))))

(assert (=> b!877235 (= lt!396967 call!38836)))

(assert (=> b!877235 (= e!488329 (+!2491 call!38836 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)) (get!12894 (select (arr!24518 lt!396722) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877236 () Bool)

(assert (=> b!877236 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> b!877236 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24958 lt!396722)))))

(declare-fun e!488325 () Bool)

(assert (=> b!877236 (= e!488325 (= (apply!377 lt!396969 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))) (get!12894 (select (arr!24518 lt!396722) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!877237 () Bool)

(declare-fun e!488326 () Bool)

(assert (=> b!877237 (= e!488328 e!488326)))

(declare-fun c!92738 () Bool)

(declare-fun e!488324 () Bool)

(assert (=> b!877237 (= c!92738 e!488324)))

(declare-fun res!595963 () Bool)

(assert (=> b!877237 (=> (not res!595963) (not e!488324))))

(assert (=> b!877237 (= res!595963 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877238 () Bool)

(assert (=> b!877238 (= e!488326 e!488330)))

(declare-fun c!92735 () Bool)

(assert (=> b!877238 (= c!92735 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877239 () Bool)

(assert (=> b!877239 (= e!488327 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38833 () Bool)

(assert (=> bm!38833 (= call!38836 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!877240 () Bool)

(assert (=> b!877240 (= e!488324 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877240 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!877241 () Bool)

(assert (=> b!877241 (= e!488330 (isEmpty!663 lt!396969))))

(declare-fun b!877242 () Bool)

(assert (=> b!877242 (= e!488326 e!488325)))

(assert (=> b!877242 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun res!595966 () Bool)

(assert (=> b!877242 (= res!595966 (contains!4248 lt!396969 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877242 (=> (not res!595966) (not e!488325))))

(assert (= (and d!108763 c!92736) b!877239))

(assert (= (and d!108763 (not c!92736)) b!877234))

(assert (= (and b!877234 c!92737) b!877235))

(assert (= (and b!877234 (not c!92737)) b!877231))

(assert (= (or b!877235 b!877231) bm!38833))

(assert (= (and d!108763 res!595964) b!877233))

(assert (= (and b!877233 res!595965) b!877237))

(assert (= (and b!877237 res!595963) b!877240))

(assert (= (and b!877237 c!92738) b!877242))

(assert (= (and b!877237 (not c!92738)) b!877238))

(assert (= (and b!877242 res!595966) b!877236))

(assert (= (and b!877238 c!92735) b!877232))

(assert (= (and b!877238 (not c!92735)) b!877241))

(declare-fun b_lambda!12289 () Bool)

(assert (=> (not b_lambda!12289) (not b!877235)))

(assert (=> b!877235 t!24485))

(declare-fun b_and!25043 () Bool)

(assert (= b_and!25041 (and (=> t!24485 result!9505) b_and!25043)))

(declare-fun b_lambda!12291 () Bool)

(assert (=> (not b_lambda!12291) (not b!877236)))

(assert (=> b!877236 t!24485))

(declare-fun b_and!25045 () Bool)

(assert (= b_and!25043 (and (=> t!24485 result!9505) b_and!25045)))

(declare-fun m!817261 () Bool)

(assert (=> b!877233 m!817261))

(declare-fun m!817263 () Bool)

(assert (=> b!877235 m!817263))

(declare-fun m!817265 () Bool)

(assert (=> b!877235 m!817265))

(assert (=> b!877235 m!816653))

(declare-fun m!817267 () Bool)

(assert (=> b!877235 m!817267))

(declare-fun m!817269 () Bool)

(assert (=> b!877235 m!817269))

(declare-fun m!817271 () Bool)

(assert (=> b!877235 m!817271))

(assert (=> b!877235 m!817265))

(assert (=> b!877235 m!816653))

(declare-fun m!817273 () Bool)

(assert (=> b!877235 m!817273))

(assert (=> b!877235 m!817267))

(declare-fun m!817275 () Bool)

(assert (=> b!877235 m!817275))

(assert (=> b!877240 m!817271))

(assert (=> b!877240 m!817271))

(declare-fun m!817277 () Bool)

(assert (=> b!877240 m!817277))

(declare-fun m!817279 () Bool)

(assert (=> d!108763 m!817279))

(assert (=> d!108763 m!816665))

(assert (=> b!877234 m!817271))

(assert (=> b!877234 m!817271))

(assert (=> b!877234 m!817277))

(assert (=> b!877236 m!817265))

(assert (=> b!877236 m!816653))

(assert (=> b!877236 m!817271))

(declare-fun m!817281 () Bool)

(assert (=> b!877236 m!817281))

(assert (=> b!877236 m!817271))

(assert (=> b!877236 m!817265))

(assert (=> b!877236 m!816653))

(assert (=> b!877236 m!817273))

(declare-fun m!817283 () Bool)

(assert (=> b!877241 m!817283))

(declare-fun m!817285 () Bool)

(assert (=> bm!38833 m!817285))

(assert (=> b!877242 m!817271))

(assert (=> b!877242 m!817271))

(declare-fun m!817287 () Bool)

(assert (=> b!877242 m!817287))

(assert (=> b!877232 m!817285))

(assert (=> bm!38802 d!108763))

(declare-fun d!108765 () Bool)

(declare-fun e!488331 () Bool)

(assert (=> d!108765 e!488331))

(declare-fun res!595967 () Bool)

(assert (=> d!108765 (=> res!595967 e!488331)))

(declare-fun lt!396976 () Bool)

(assert (=> d!108765 (= res!595967 (not lt!396976))))

(declare-fun lt!396975 () Bool)

(assert (=> d!108765 (= lt!396976 lt!396975)))

(declare-fun lt!396973 () Unit!29986)

(declare-fun e!488332 () Unit!29986)

(assert (=> d!108765 (= lt!396973 e!488332)))

(declare-fun c!92739 () Bool)

(assert (=> d!108765 (= c!92739 lt!396975)))

(assert (=> d!108765 (= lt!396975 (containsKey!403 (toList!5191 lt!396835) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108765 (= (contains!4248 lt!396835 #b1000000000000000000000000000000000000000000000000000000000000000) lt!396976)))

(declare-fun b!877243 () Bool)

(declare-fun lt!396974 () Unit!29986)

(assert (=> b!877243 (= e!488332 lt!396974)))

(assert (=> b!877243 (= lt!396974 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396835) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877243 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396835) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877244 () Bool)

(declare-fun Unit!30004 () Unit!29986)

(assert (=> b!877244 (= e!488332 Unit!30004)))

(declare-fun b!877245 () Bool)

(assert (=> b!877245 (= e!488331 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108765 c!92739) b!877243))

(assert (= (and d!108765 (not c!92739)) b!877244))

(assert (= (and d!108765 (not res!595967)) b!877245))

(declare-fun m!817289 () Bool)

(assert (=> d!108765 m!817289))

(declare-fun m!817291 () Bool)

(assert (=> b!877243 m!817291))

(declare-fun m!817293 () Bool)

(assert (=> b!877243 m!817293))

(assert (=> b!877243 m!817293))

(declare-fun m!817295 () Bool)

(assert (=> b!877243 m!817295))

(assert (=> b!877245 m!817293))

(assert (=> b!877245 m!817293))

(assert (=> b!877245 m!817295))

(assert (=> b!876980 d!108765))

(declare-fun d!108767 () Bool)

(declare-fun get!12898 (Option!425) V!28283)

(assert (=> d!108767 (= (apply!377 lt!396780 (select (arr!24517 _keys!868) from!1053)) (get!12898 (getValueByKey!419 (toList!5191 lt!396780) (select (arr!24517 _keys!868) from!1053))))))

(declare-fun bs!24621 () Bool)

(assert (= bs!24621 d!108767))

(assert (=> bs!24621 m!816651))

(declare-fun m!817297 () Bool)

(assert (=> bs!24621 m!817297))

(assert (=> bs!24621 m!817297))

(declare-fun m!817299 () Bool)

(assert (=> bs!24621 m!817299))

(assert (=> b!876916 d!108767))

(assert (=> b!876916 d!108711))

(declare-fun b!877246 () Bool)

(declare-fun e!488335 () Bool)

(declare-fun e!488333 () Bool)

(assert (=> b!877246 (= e!488335 e!488333)))

(declare-fun c!92740 () Bool)

(assert (=> b!877246 (= c!92740 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!877247 () Bool)

(declare-fun e!488334 () Bool)

(assert (=> b!877247 (= e!488333 e!488334)))

(declare-fun lt!396979 () (_ BitVec 64))

(assert (=> b!877247 (= lt!396979 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!396978 () Unit!29986)

(assert (=> b!877247 (= lt!396978 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396979 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!877247 (arrayContainsKey!0 _keys!868 lt!396979 #b00000000000000000000000000000000)))

(declare-fun lt!396977 () Unit!29986)

(assert (=> b!877247 (= lt!396977 lt!396978)))

(declare-fun res!595969 () Bool)

(assert (=> b!877247 (= res!595969 (= (seekEntryOrOpen!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!868 mask!1196) (Found!8753 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!877247 (=> (not res!595969) (not e!488334))))

(declare-fun bm!38834 () Bool)

(declare-fun call!38837 () Bool)

(assert (=> bm!38834 (= call!38837 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun d!108769 () Bool)

(declare-fun res!595968 () Bool)

(assert (=> d!108769 (=> res!595968 e!488335)))

(assert (=> d!108769 (= res!595968 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> d!108769 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196) e!488335)))

(declare-fun b!877248 () Bool)

(assert (=> b!877248 (= e!488334 call!38837)))

(declare-fun b!877249 () Bool)

(assert (=> b!877249 (= e!488333 call!38837)))

(assert (= (and d!108769 (not res!595968)) b!877246))

(assert (= (and b!877246 c!92740) b!877247))

(assert (= (and b!877246 (not c!92740)) b!877249))

(assert (= (and b!877247 res!595969) b!877248))

(assert (= (or b!877248 b!877249) bm!38834))

(declare-fun m!817301 () Bool)

(assert (=> b!877246 m!817301))

(assert (=> b!877246 m!817301))

(declare-fun m!817303 () Bool)

(assert (=> b!877246 m!817303))

(assert (=> b!877247 m!817301))

(declare-fun m!817305 () Bool)

(assert (=> b!877247 m!817305))

(declare-fun m!817307 () Bool)

(assert (=> b!877247 m!817307))

(assert (=> b!877247 m!817301))

(declare-fun m!817309 () Bool)

(assert (=> b!877247 m!817309))

(declare-fun m!817311 () Bool)

(assert (=> bm!38834 m!817311))

(assert (=> bm!38799 d!108769))

(declare-fun d!108771 () Bool)

(declare-fun e!488336 () Bool)

(assert (=> d!108771 e!488336))

(declare-fun res!595970 () Bool)

(assert (=> d!108771 (=> res!595970 e!488336)))

(declare-fun lt!396983 () Bool)

(assert (=> d!108771 (= res!595970 (not lt!396983))))

(declare-fun lt!396982 () Bool)

(assert (=> d!108771 (= lt!396983 lt!396982)))

(declare-fun lt!396980 () Unit!29986)

(declare-fun e!488337 () Unit!29986)

(assert (=> d!108771 (= lt!396980 e!488337)))

(declare-fun c!92741 () Bool)

(assert (=> d!108771 (= c!92741 lt!396982)))

(assert (=> d!108771 (= lt!396982 (containsKey!403 (toList!5191 lt!396823) (_1!5802 (tuple2!11583 k0!854 lt!396715))))))

(assert (=> d!108771 (= (contains!4248 lt!396823 (_1!5802 (tuple2!11583 k0!854 lt!396715))) lt!396983)))

(declare-fun b!877250 () Bool)

(declare-fun lt!396981 () Unit!29986)

(assert (=> b!877250 (= e!488337 lt!396981)))

(assert (=> b!877250 (= lt!396981 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396823) (_1!5802 (tuple2!11583 k0!854 lt!396715))))))

(assert (=> b!877250 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396823) (_1!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun b!877251 () Bool)

(declare-fun Unit!30005 () Unit!29986)

(assert (=> b!877251 (= e!488337 Unit!30005)))

(declare-fun b!877252 () Bool)

(assert (=> b!877252 (= e!488336 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396823) (_1!5802 (tuple2!11583 k0!854 lt!396715)))))))

(assert (= (and d!108771 c!92741) b!877250))

(assert (= (and d!108771 (not c!92741)) b!877251))

(assert (= (and d!108771 (not res!595970)) b!877252))

(declare-fun m!817313 () Bool)

(assert (=> d!108771 m!817313))

(declare-fun m!817315 () Bool)

(assert (=> b!877250 m!817315))

(assert (=> b!877250 m!816875))

(assert (=> b!877250 m!816875))

(declare-fun m!817317 () Bool)

(assert (=> b!877250 m!817317))

(assert (=> b!877252 m!816875))

(assert (=> b!877252 m!816875))

(assert (=> b!877252 m!817317))

(assert (=> d!108645 d!108771))

(declare-fun c!92742 () Bool)

(declare-fun d!108773 () Bool)

(assert (=> d!108773 (= c!92742 (and ((_ is Cons!17395) lt!396822) (= (_1!5802 (h!18526 lt!396822)) (_1!5802 (tuple2!11583 k0!854 lt!396715)))))))

(declare-fun e!488338 () Option!425)

(assert (=> d!108773 (= (getValueByKey!419 lt!396822 (_1!5802 (tuple2!11583 k0!854 lt!396715))) e!488338)))

(declare-fun b!877254 () Bool)

(declare-fun e!488339 () Option!425)

(assert (=> b!877254 (= e!488338 e!488339)))

(declare-fun c!92743 () Bool)

(assert (=> b!877254 (= c!92743 (and ((_ is Cons!17395) lt!396822) (not (= (_1!5802 (h!18526 lt!396822)) (_1!5802 (tuple2!11583 k0!854 lt!396715))))))))

(declare-fun b!877255 () Bool)

(assert (=> b!877255 (= e!488339 (getValueByKey!419 (t!24486 lt!396822) (_1!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun b!877253 () Bool)

(assert (=> b!877253 (= e!488338 (Some!424 (_2!5802 (h!18526 lt!396822))))))

(declare-fun b!877256 () Bool)

(assert (=> b!877256 (= e!488339 None!423)))

(assert (= (and d!108773 c!92742) b!877253))

(assert (= (and d!108773 (not c!92742)) b!877254))

(assert (= (and b!877254 c!92743) b!877255))

(assert (= (and b!877254 (not c!92743)) b!877256))

(declare-fun m!817319 () Bool)

(assert (=> b!877255 m!817319))

(assert (=> d!108645 d!108773))

(declare-fun d!108775 () Bool)

(assert (=> d!108775 (= (getValueByKey!419 lt!396822 (_1!5802 (tuple2!11583 k0!854 lt!396715))) (Some!424 (_2!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun lt!396984 () Unit!29986)

(assert (=> d!108775 (= lt!396984 (choose!1433 lt!396822 (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun e!488340 () Bool)

(assert (=> d!108775 e!488340))

(declare-fun res!595971 () Bool)

(assert (=> d!108775 (=> (not res!595971) (not e!488340))))

(assert (=> d!108775 (= res!595971 (isStrictlySorted!461 lt!396822))))

(assert (=> d!108775 (= (lemmaContainsTupThenGetReturnValue!233 lt!396822 (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715))) lt!396984)))

(declare-fun b!877257 () Bool)

(declare-fun res!595972 () Bool)

(assert (=> b!877257 (=> (not res!595972) (not e!488340))))

(assert (=> b!877257 (= res!595972 (containsKey!403 lt!396822 (_1!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun b!877258 () Bool)

(assert (=> b!877258 (= e!488340 (contains!4249 lt!396822 (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715)))))))

(assert (= (and d!108775 res!595971) b!877257))

(assert (= (and b!877257 res!595972) b!877258))

(assert (=> d!108775 m!816869))

(declare-fun m!817321 () Bool)

(assert (=> d!108775 m!817321))

(declare-fun m!817323 () Bool)

(assert (=> d!108775 m!817323))

(declare-fun m!817325 () Bool)

(assert (=> b!877257 m!817325))

(declare-fun m!817327 () Bool)

(assert (=> b!877258 m!817327))

(assert (=> d!108645 d!108775))

(declare-fun b!877259 () Bool)

(declare-fun e!488344 () List!17399)

(declare-fun call!38839 () List!17399)

(assert (=> b!877259 (= e!488344 call!38839)))

(declare-fun c!92744 () Bool)

(declare-fun b!877260 () Bool)

(assert (=> b!877260 (= c!92744 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (bvsgt (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 (tuple2!11583 k0!854 lt!396715)))))))

(declare-fun e!488341 () List!17399)

(assert (=> b!877260 (= e!488341 e!488344)))

(declare-fun e!488345 () List!17399)

(declare-fun bm!38835 () Bool)

(declare-fun c!92745 () Bool)

(declare-fun call!38838 () List!17399)

(assert (=> bm!38835 (= call!38838 ($colon$colon!538 e!488345 (ite c!92745 (h!18526 (toList!5191 lt!396719)) (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715))))))))

(declare-fun c!92746 () Bool)

(assert (=> bm!38835 (= c!92746 c!92745)))

(declare-fun b!877262 () Bool)

(assert (=> b!877262 (= e!488344 call!38839)))

(declare-fun b!877263 () Bool)

(declare-fun e!488343 () List!17399)

(assert (=> b!877263 (= e!488343 e!488341)))

(declare-fun c!92747 () Bool)

(assert (=> b!877263 (= c!92747 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (= (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 (tuple2!11583 k0!854 lt!396715)))))))

(declare-fun bm!38836 () Bool)

(declare-fun call!38840 () List!17399)

(assert (=> bm!38836 (= call!38839 call!38840)))

(declare-fun b!877264 () Bool)

(assert (=> b!877264 (= e!488345 (insertStrictlySorted!272 (t!24486 (toList!5191 lt!396719)) (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun b!877261 () Bool)

(assert (=> b!877261 (= e!488343 call!38838)))

(declare-fun d!108777 () Bool)

(declare-fun e!488342 () Bool)

(assert (=> d!108777 e!488342))

(declare-fun res!595974 () Bool)

(assert (=> d!108777 (=> (not res!595974) (not e!488342))))

(declare-fun lt!396985 () List!17399)

(assert (=> d!108777 (= res!595974 (isStrictlySorted!461 lt!396985))))

(assert (=> d!108777 (= lt!396985 e!488343)))

(assert (=> d!108777 (= c!92745 (and ((_ is Cons!17395) (toList!5191 lt!396719)) (bvslt (_1!5802 (h!18526 (toList!5191 lt!396719))) (_1!5802 (tuple2!11583 k0!854 lt!396715)))))))

(assert (=> d!108777 (isStrictlySorted!461 (toList!5191 lt!396719))))

(assert (=> d!108777 (= (insertStrictlySorted!272 (toList!5191 lt!396719) (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715))) lt!396985)))

(declare-fun bm!38837 () Bool)

(assert (=> bm!38837 (= call!38840 call!38838)))

(declare-fun b!877265 () Bool)

(declare-fun res!595973 () Bool)

(assert (=> b!877265 (=> (not res!595973) (not e!488342))))

(assert (=> b!877265 (= res!595973 (containsKey!403 lt!396985 (_1!5802 (tuple2!11583 k0!854 lt!396715))))))

(declare-fun b!877266 () Bool)

(assert (=> b!877266 (= e!488341 call!38840)))

(declare-fun b!877267 () Bool)

(assert (=> b!877267 (= e!488342 (contains!4249 lt!396985 (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 lt!396715)) (_2!5802 (tuple2!11583 k0!854 lt!396715)))))))

(declare-fun b!877268 () Bool)

(assert (=> b!877268 (= e!488345 (ite c!92747 (t!24486 (toList!5191 lt!396719)) (ite c!92744 (Cons!17395 (h!18526 (toList!5191 lt!396719)) (t!24486 (toList!5191 lt!396719))) Nil!17396)))))

(assert (= (and d!108777 c!92745) b!877261))

(assert (= (and d!108777 (not c!92745)) b!877263))

(assert (= (and b!877263 c!92747) b!877266))

(assert (= (and b!877263 (not c!92747)) b!877260))

(assert (= (and b!877260 c!92744) b!877262))

(assert (= (and b!877260 (not c!92744)) b!877259))

(assert (= (or b!877262 b!877259) bm!38836))

(assert (= (or b!877266 bm!38836) bm!38837))

(assert (= (or b!877261 bm!38837) bm!38835))

(assert (= (and bm!38835 c!92746) b!877264))

(assert (= (and bm!38835 (not c!92746)) b!877268))

(assert (= (and d!108777 res!595974) b!877265))

(assert (= (and b!877265 res!595973) b!877267))

(declare-fun m!817329 () Bool)

(assert (=> d!108777 m!817329))

(assert (=> d!108777 m!817005))

(declare-fun m!817331 () Bool)

(assert (=> b!877265 m!817331))

(declare-fun m!817333 () Bool)

(assert (=> b!877267 m!817333))

(declare-fun m!817335 () Bool)

(assert (=> b!877264 m!817335))

(declare-fun m!817337 () Bool)

(assert (=> bm!38835 m!817337))

(assert (=> d!108645 d!108777))

(declare-fun b!877269 () Bool)

(declare-fun e!488351 () ListLongMap!10351)

(declare-fun call!38841 () ListLongMap!10351)

(assert (=> b!877269 (= e!488351 call!38841)))

(declare-fun d!108779 () Bool)

(declare-fun e!488350 () Bool)

(assert (=> d!108779 e!488350))

(declare-fun res!595976 () Bool)

(assert (=> d!108779 (=> (not res!595976) (not e!488350))))

(declare-fun lt!396989 () ListLongMap!10351)

(assert (=> d!108779 (= res!595976 (not (contains!4248 lt!396989 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488349 () ListLongMap!10351)

(assert (=> d!108779 (= lt!396989 e!488349)))

(declare-fun c!92749 () Bool)

(assert (=> d!108779 (= c!92749 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(assert (=> d!108779 (validMask!0 mask!1196)))

(assert (=> d!108779 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396989)))

(declare-fun b!877270 () Bool)

(declare-fun e!488352 () Bool)

(assert (=> b!877270 (= e!488352 (= lt!396989 (getCurrentListMapNoExtraKeys!3158 _keys!868 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877271 () Bool)

(declare-fun res!595977 () Bool)

(assert (=> b!877271 (=> (not res!595977) (not e!488350))))

(assert (=> b!877271 (= res!595977 (not (contains!4248 lt!396989 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877272 () Bool)

(assert (=> b!877272 (= e!488349 e!488351)))

(declare-fun c!92750 () Bool)

(assert (=> b!877272 (= c!92750 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!877273 () Bool)

(declare-fun lt!396991 () Unit!29986)

(declare-fun lt!396986 () Unit!29986)

(assert (=> b!877273 (= lt!396991 lt!396986)))

(declare-fun lt!396992 () (_ BitVec 64))

(declare-fun lt!396987 () ListLongMap!10351)

(declare-fun lt!396988 () V!28283)

(declare-fun lt!396990 () (_ BitVec 64))

(assert (=> b!877273 (not (contains!4248 (+!2491 lt!396987 (tuple2!11583 lt!396992 lt!396988)) lt!396990))))

(assert (=> b!877273 (= lt!396986 (addStillNotContains!202 lt!396987 lt!396992 lt!396988 lt!396990))))

(assert (=> b!877273 (= lt!396990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877273 (= lt!396988 (get!12894 (select (arr!24518 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877273 (= lt!396992 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!877273 (= lt!396987 call!38841)))

(assert (=> b!877273 (= e!488351 (+!2491 call!38841 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877274 () Bool)

(assert (=> b!877274 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(assert (=> b!877274 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24958 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688)))))))

(declare-fun e!488347 () Bool)

(assert (=> b!877274 (= e!488347 (= (apply!377 lt!396989 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12894 (select (arr!24518 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!877275 () Bool)

(declare-fun e!488348 () Bool)

(assert (=> b!877275 (= e!488350 e!488348)))

(declare-fun c!92751 () Bool)

(declare-fun e!488346 () Bool)

(assert (=> b!877275 (= c!92751 e!488346)))

(declare-fun res!595975 () Bool)

(assert (=> b!877275 (=> (not res!595975) (not e!488346))))

(assert (=> b!877275 (= res!595975 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun b!877276 () Bool)

(assert (=> b!877276 (= e!488348 e!488352)))

(declare-fun c!92748 () Bool)

(assert (=> b!877276 (= c!92748 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun b!877277 () Bool)

(assert (=> b!877277 (= e!488349 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38838 () Bool)

(assert (=> bm!38838 (= call!38841 (getCurrentListMapNoExtraKeys!3158 _keys!868 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!877278 () Bool)

(assert (=> b!877278 (= e!488346 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877278 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!877279 () Bool)

(assert (=> b!877279 (= e!488352 (isEmpty!663 lt!396989))))

(declare-fun b!877280 () Bool)

(assert (=> b!877280 (= e!488348 e!488347)))

(assert (=> b!877280 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24957 _keys!868)))))

(declare-fun res!595978 () Bool)

(assert (=> b!877280 (= res!595978 (contains!4248 lt!396989 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877280 (=> (not res!595978) (not e!488347))))

(assert (= (and d!108779 c!92749) b!877277))

(assert (= (and d!108779 (not c!92749)) b!877272))

(assert (= (and b!877272 c!92750) b!877273))

(assert (= (and b!877272 (not c!92750)) b!877269))

(assert (= (or b!877273 b!877269) bm!38838))

(assert (= (and d!108779 res!595976) b!877271))

(assert (= (and b!877271 res!595977) b!877275))

(assert (= (and b!877275 res!595975) b!877278))

(assert (= (and b!877275 c!92751) b!877280))

(assert (= (and b!877275 (not c!92751)) b!877276))

(assert (= (and b!877280 res!595978) b!877274))

(assert (= (and b!877276 c!92748) b!877270))

(assert (= (and b!877276 (not c!92748)) b!877279))

(declare-fun b_lambda!12293 () Bool)

(assert (=> (not b_lambda!12293) (not b!877273)))

(assert (=> b!877273 t!24485))

(declare-fun b_and!25047 () Bool)

(assert (= b_and!25045 (and (=> t!24485 result!9505) b_and!25047)))

(declare-fun b_lambda!12295 () Bool)

(assert (=> (not b_lambda!12295) (not b!877274)))

(assert (=> b!877274 t!24485))

(declare-fun b_and!25049 () Bool)

(assert (= b_and!25047 (and (=> t!24485 result!9505) b_and!25049)))

(declare-fun m!817339 () Bool)

(assert (=> b!877271 m!817339))

(declare-fun m!817341 () Bool)

(assert (=> b!877273 m!817341))

(declare-fun m!817343 () Bool)

(assert (=> b!877273 m!817343))

(assert (=> b!877273 m!816653))

(declare-fun m!817345 () Bool)

(assert (=> b!877273 m!817345))

(declare-fun m!817347 () Bool)

(assert (=> b!877273 m!817347))

(assert (=> b!877273 m!816799))

(assert (=> b!877273 m!817343))

(assert (=> b!877273 m!816653))

(declare-fun m!817349 () Bool)

(assert (=> b!877273 m!817349))

(assert (=> b!877273 m!817345))

(declare-fun m!817351 () Bool)

(assert (=> b!877273 m!817351))

(assert (=> b!877278 m!816799))

(assert (=> b!877278 m!816799))

(assert (=> b!877278 m!816805))

(declare-fun m!817353 () Bool)

(assert (=> d!108779 m!817353))

(assert (=> d!108779 m!816665))

(assert (=> b!877272 m!816799))

(assert (=> b!877272 m!816799))

(assert (=> b!877272 m!816805))

(assert (=> b!877274 m!817343))

(assert (=> b!877274 m!816653))

(assert (=> b!877274 m!816799))

(declare-fun m!817355 () Bool)

(assert (=> b!877274 m!817355))

(assert (=> b!877274 m!816799))

(assert (=> b!877274 m!817343))

(assert (=> b!877274 m!816653))

(assert (=> b!877274 m!817349))

(declare-fun m!817357 () Bool)

(assert (=> b!877279 m!817357))

(declare-fun m!817359 () Bool)

(assert (=> bm!38838 m!817359))

(assert (=> b!877280 m!816799))

(assert (=> b!877280 m!816799))

(declare-fun m!817361 () Bool)

(assert (=> b!877280 m!817361))

(assert (=> b!877270 m!817359))

(assert (=> bm!38809 d!108779))

(declare-fun d!108781 () Bool)

(declare-fun isEmpty!664 (List!17399) Bool)

(assert (=> d!108781 (= (isEmpty!663 lt!396780) (isEmpty!664 (toList!5191 lt!396780)))))

(declare-fun bs!24622 () Bool)

(assert (= bs!24622 d!108781))

(declare-fun m!817363 () Bool)

(assert (=> bs!24622 m!817363))

(assert (=> b!876921 d!108781))

(declare-fun d!108783 () Bool)

(declare-fun c!92752 () Bool)

(assert (=> d!108783 (= c!92752 (and ((_ is Cons!17395) (toList!5191 lt!396819)) (= (_1!5802 (h!18526 (toList!5191 lt!396819))) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun e!488353 () Option!425)

(assert (=> d!108783 (= (getValueByKey!419 (toList!5191 lt!396819) (_1!5802 (tuple2!11583 k0!854 v!557))) e!488353)))

(declare-fun b!877282 () Bool)

(declare-fun e!488354 () Option!425)

(assert (=> b!877282 (= e!488353 e!488354)))

(declare-fun c!92753 () Bool)

(assert (=> b!877282 (= c!92753 (and ((_ is Cons!17395) (toList!5191 lt!396819)) (not (= (_1!5802 (h!18526 (toList!5191 lt!396819))) (_1!5802 (tuple2!11583 k0!854 v!557))))))))

(declare-fun b!877283 () Bool)

(assert (=> b!877283 (= e!488354 (getValueByKey!419 (t!24486 (toList!5191 lt!396819)) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877281 () Bool)

(assert (=> b!877281 (= e!488353 (Some!424 (_2!5802 (h!18526 (toList!5191 lt!396819)))))))

(declare-fun b!877284 () Bool)

(assert (=> b!877284 (= e!488354 None!423)))

(assert (= (and d!108783 c!92752) b!877281))

(assert (= (and d!108783 (not c!92752)) b!877282))

(assert (= (and b!877282 c!92753) b!877283))

(assert (= (and b!877282 (not c!92753)) b!877284))

(declare-fun m!817365 () Bool)

(assert (=> b!877283 m!817365))

(assert (=> b!876961 d!108783))

(declare-fun lt!396993 () Bool)

(declare-fun d!108785 () Bool)

(assert (=> d!108785 (= lt!396993 (select (content!392 (toList!5191 lt!396841)) (tuple2!11583 k0!854 v!557)))))

(declare-fun e!488355 () Bool)

(assert (=> d!108785 (= lt!396993 e!488355)))

(declare-fun res!595980 () Bool)

(assert (=> d!108785 (=> (not res!595980) (not e!488355))))

(assert (=> d!108785 (= res!595980 ((_ is Cons!17395) (toList!5191 lt!396841)))))

(assert (=> d!108785 (= (contains!4249 (toList!5191 lt!396841) (tuple2!11583 k0!854 v!557)) lt!396993)))

(declare-fun b!877285 () Bool)

(declare-fun e!488356 () Bool)

(assert (=> b!877285 (= e!488355 e!488356)))

(declare-fun res!595979 () Bool)

(assert (=> b!877285 (=> res!595979 e!488356)))

(assert (=> b!877285 (= res!595979 (= (h!18526 (toList!5191 lt!396841)) (tuple2!11583 k0!854 v!557)))))

(declare-fun b!877286 () Bool)

(assert (=> b!877286 (= e!488356 (contains!4249 (t!24486 (toList!5191 lt!396841)) (tuple2!11583 k0!854 v!557)))))

(assert (= (and d!108785 res!595980) b!877285))

(assert (= (and b!877285 (not res!595979)) b!877286))

(declare-fun m!817367 () Bool)

(assert (=> d!108785 m!817367))

(declare-fun m!817369 () Bool)

(assert (=> d!108785 m!817369))

(declare-fun m!817371 () Bool)

(assert (=> b!877286 m!817371))

(assert (=> b!877006 d!108785))

(declare-fun d!108787 () Bool)

(declare-fun c!92754 () Bool)

(assert (=> d!108787 (= c!92754 ((_ is ValueCellFull!8274) (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun e!488357 () V!28283)

(assert (=> d!108787 (= (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!488357)))

(declare-fun b!877287 () Bool)

(assert (=> b!877287 (= e!488357 (get!12896 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877288 () Bool)

(assert (=> b!877288 (= e!488357 (get!12897 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108787 c!92754) b!877287))

(assert (= (and d!108787 (not c!92754)) b!877288))

(assert (=> b!877287 m!816901))

(assert (=> b!877287 m!816653))

(declare-fun m!817373 () Bool)

(assert (=> b!877287 m!817373))

(assert (=> b!877288 m!816901))

(assert (=> b!877288 m!816653))

(declare-fun m!817375 () Bool)

(assert (=> b!877288 m!817375))

(assert (=> b!876982 d!108787))

(declare-fun d!108789 () Bool)

(declare-fun e!488358 () Bool)

(assert (=> d!108789 e!488358))

(declare-fun res!595982 () Bool)

(assert (=> d!108789 (=> (not res!595982) (not e!488358))))

(declare-fun lt!396996 () ListLongMap!10351)

(assert (=> d!108789 (= res!595982 (contains!4248 lt!396996 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396995 () List!17399)

(assert (=> d!108789 (= lt!396996 (ListLongMap!10352 lt!396995))))

(declare-fun lt!396994 () Unit!29986)

(declare-fun lt!396997 () Unit!29986)

(assert (=> d!108789 (= lt!396994 lt!396997)))

(assert (=> d!108789 (= (getValueByKey!419 lt!396995 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108789 (= lt!396997 (lemmaContainsTupThenGetReturnValue!233 lt!396995 (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108789 (= lt!396995 (insertStrictlySorted!272 (toList!5191 call!38814) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108789 (= (+!2491 call!38814 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396996)))

(declare-fun b!877289 () Bool)

(declare-fun res!595981 () Bool)

(assert (=> b!877289 (=> (not res!595981) (not e!488358))))

(assert (=> b!877289 (= res!595981 (= (getValueByKey!419 (toList!5191 lt!396996) (_1!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!424 (_2!5802 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!877290 () Bool)

(assert (=> b!877290 (= e!488358 (contains!4249 (toList!5191 lt!396996) (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108789 res!595982) b!877289))

(assert (= (and b!877289 res!595981) b!877290))

(declare-fun m!817377 () Bool)

(assert (=> d!108789 m!817377))

(declare-fun m!817379 () Bool)

(assert (=> d!108789 m!817379))

(declare-fun m!817381 () Bool)

(assert (=> d!108789 m!817381))

(declare-fun m!817383 () Bool)

(assert (=> d!108789 m!817383))

(declare-fun m!817385 () Bool)

(assert (=> b!877289 m!817385))

(declare-fun m!817387 () Bool)

(assert (=> b!877290 m!817387))

(assert (=> b!876982 d!108789))

(declare-fun d!108791 () Bool)

(assert (=> d!108791 (not (contains!4248 (+!2491 lt!396833 (tuple2!11583 lt!396838 lt!396834)) lt!396836))))

(declare-fun lt!396998 () Unit!29986)

(assert (=> d!108791 (= lt!396998 (choose!1432 lt!396833 lt!396838 lt!396834 lt!396836))))

(declare-fun e!488359 () Bool)

(assert (=> d!108791 e!488359))

(declare-fun res!595983 () Bool)

(assert (=> d!108791 (=> (not res!595983) (not e!488359))))

(assert (=> d!108791 (= res!595983 (not (contains!4248 lt!396833 lt!396836)))))

(assert (=> d!108791 (= (addStillNotContains!202 lt!396833 lt!396838 lt!396834 lt!396836) lt!396998)))

(declare-fun b!877291 () Bool)

(assert (=> b!877291 (= e!488359 (not (= lt!396838 lt!396836)))))

(assert (= (and d!108791 res!595983) b!877291))

(assert (=> d!108791 m!816903))

(assert (=> d!108791 m!816903))

(assert (=> d!108791 m!816905))

(declare-fun m!817389 () Bool)

(assert (=> d!108791 m!817389))

(declare-fun m!817391 () Bool)

(assert (=> d!108791 m!817391))

(assert (=> b!876982 d!108791))

(declare-fun d!108793 () Bool)

(declare-fun e!488360 () Bool)

(assert (=> d!108793 e!488360))

(declare-fun res!595984 () Bool)

(assert (=> d!108793 (=> res!595984 e!488360)))

(declare-fun lt!397002 () Bool)

(assert (=> d!108793 (= res!595984 (not lt!397002))))

(declare-fun lt!397001 () Bool)

(assert (=> d!108793 (= lt!397002 lt!397001)))

(declare-fun lt!396999 () Unit!29986)

(declare-fun e!488361 () Unit!29986)

(assert (=> d!108793 (= lt!396999 e!488361)))

(declare-fun c!92755 () Bool)

(assert (=> d!108793 (= c!92755 lt!397001)))

(assert (=> d!108793 (= lt!397001 (containsKey!403 (toList!5191 (+!2491 lt!396833 (tuple2!11583 lt!396838 lt!396834))) lt!396836))))

(assert (=> d!108793 (= (contains!4248 (+!2491 lt!396833 (tuple2!11583 lt!396838 lt!396834)) lt!396836) lt!397002)))

(declare-fun b!877292 () Bool)

(declare-fun lt!397000 () Unit!29986)

(assert (=> b!877292 (= e!488361 lt!397000)))

(assert (=> b!877292 (= lt!397000 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 (+!2491 lt!396833 (tuple2!11583 lt!396838 lt!396834))) lt!396836))))

(assert (=> b!877292 (isDefined!313 (getValueByKey!419 (toList!5191 (+!2491 lt!396833 (tuple2!11583 lt!396838 lt!396834))) lt!396836))))

(declare-fun b!877293 () Bool)

(declare-fun Unit!30006 () Unit!29986)

(assert (=> b!877293 (= e!488361 Unit!30006)))

(declare-fun b!877294 () Bool)

(assert (=> b!877294 (= e!488360 (isDefined!313 (getValueByKey!419 (toList!5191 (+!2491 lt!396833 (tuple2!11583 lt!396838 lt!396834))) lt!396836)))))

(assert (= (and d!108793 c!92755) b!877292))

(assert (= (and d!108793 (not c!92755)) b!877293))

(assert (= (and d!108793 (not res!595984)) b!877294))

(declare-fun m!817393 () Bool)

(assert (=> d!108793 m!817393))

(declare-fun m!817395 () Bool)

(assert (=> b!877292 m!817395))

(declare-fun m!817397 () Bool)

(assert (=> b!877292 m!817397))

(assert (=> b!877292 m!817397))

(declare-fun m!817399 () Bool)

(assert (=> b!877292 m!817399))

(assert (=> b!877294 m!817397))

(assert (=> b!877294 m!817397))

(assert (=> b!877294 m!817399))

(assert (=> b!876982 d!108793))

(declare-fun d!108795 () Bool)

(declare-fun e!488362 () Bool)

(assert (=> d!108795 e!488362))

(declare-fun res!595986 () Bool)

(assert (=> d!108795 (=> (not res!595986) (not e!488362))))

(declare-fun lt!397005 () ListLongMap!10351)

(assert (=> d!108795 (= res!595986 (contains!4248 lt!397005 (_1!5802 (tuple2!11583 lt!396838 lt!396834))))))

(declare-fun lt!397004 () List!17399)

(assert (=> d!108795 (= lt!397005 (ListLongMap!10352 lt!397004))))

(declare-fun lt!397003 () Unit!29986)

(declare-fun lt!397006 () Unit!29986)

(assert (=> d!108795 (= lt!397003 lt!397006)))

(assert (=> d!108795 (= (getValueByKey!419 lt!397004 (_1!5802 (tuple2!11583 lt!396838 lt!396834))) (Some!424 (_2!5802 (tuple2!11583 lt!396838 lt!396834))))))

(assert (=> d!108795 (= lt!397006 (lemmaContainsTupThenGetReturnValue!233 lt!397004 (_1!5802 (tuple2!11583 lt!396838 lt!396834)) (_2!5802 (tuple2!11583 lt!396838 lt!396834))))))

(assert (=> d!108795 (= lt!397004 (insertStrictlySorted!272 (toList!5191 lt!396833) (_1!5802 (tuple2!11583 lt!396838 lt!396834)) (_2!5802 (tuple2!11583 lt!396838 lt!396834))))))

(assert (=> d!108795 (= (+!2491 lt!396833 (tuple2!11583 lt!396838 lt!396834)) lt!397005)))

(declare-fun b!877295 () Bool)

(declare-fun res!595985 () Bool)

(assert (=> b!877295 (=> (not res!595985) (not e!488362))))

(assert (=> b!877295 (= res!595985 (= (getValueByKey!419 (toList!5191 lt!397005) (_1!5802 (tuple2!11583 lt!396838 lt!396834))) (Some!424 (_2!5802 (tuple2!11583 lt!396838 lt!396834)))))))

(declare-fun b!877296 () Bool)

(assert (=> b!877296 (= e!488362 (contains!4249 (toList!5191 lt!397005) (tuple2!11583 lt!396838 lt!396834)))))

(assert (= (and d!108795 res!595986) b!877295))

(assert (= (and b!877295 res!595985) b!877296))

(declare-fun m!817401 () Bool)

(assert (=> d!108795 m!817401))

(declare-fun m!817403 () Bool)

(assert (=> d!108795 m!817403))

(declare-fun m!817405 () Bool)

(assert (=> d!108795 m!817405))

(declare-fun m!817407 () Bool)

(assert (=> d!108795 m!817407))

(declare-fun m!817409 () Bool)

(assert (=> b!877295 m!817409))

(declare-fun m!817411 () Bool)

(assert (=> b!877296 m!817411))

(assert (=> b!876982 d!108795))

(declare-fun d!108797 () Bool)

(assert (=> d!108797 (= (isEmpty!663 lt!396835) (isEmpty!664 (toList!5191 lt!396835)))))

(declare-fun bs!24623 () Bool)

(assert (= bs!24623 d!108797))

(declare-fun m!817413 () Bool)

(assert (=> bs!24623 m!817413))

(assert (=> b!876988 d!108797))

(declare-fun d!108799 () Bool)

(assert (=> d!108799 (= (apply!377 lt!396794 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12898 (getValueByKey!419 (toList!5191 lt!396794) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(declare-fun bs!24624 () Bool)

(assert (= bs!24624 d!108799))

(assert (=> bs!24624 m!816799))

(declare-fun m!817415 () Bool)

(assert (=> bs!24624 m!817415))

(assert (=> bs!24624 m!817415))

(declare-fun m!817417 () Bool)

(assert (=> bs!24624 m!817417))

(assert (=> b!876940 d!108799))

(assert (=> b!876940 d!108667))

(declare-fun b!877297 () Bool)

(declare-fun e!488368 () ListLongMap!10351)

(declare-fun call!38842 () ListLongMap!10351)

(assert (=> b!877297 (= e!488368 call!38842)))

(declare-fun d!108801 () Bool)

(declare-fun e!488367 () Bool)

(assert (=> d!108801 e!488367))

(declare-fun res!595988 () Bool)

(assert (=> d!108801 (=> (not res!595988) (not e!488367))))

(declare-fun lt!397010 () ListLongMap!10351)

(assert (=> d!108801 (= res!595988 (not (contains!4248 lt!397010 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488366 () ListLongMap!10351)

(assert (=> d!108801 (= lt!397010 e!488366)))

(declare-fun c!92757 () Bool)

(assert (=> d!108801 (= c!92757 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> d!108801 (validMask!0 mask!1196)))

(assert (=> d!108801 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!397010)))

(declare-fun e!488369 () Bool)

(declare-fun b!877298 () Bool)

(assert (=> b!877298 (= e!488369 (= lt!397010 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877299 () Bool)

(declare-fun res!595989 () Bool)

(assert (=> b!877299 (=> (not res!595989) (not e!488367))))

(assert (=> b!877299 (= res!595989 (not (contains!4248 lt!397010 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877300 () Bool)

(assert (=> b!877300 (= e!488366 e!488368)))

(declare-fun c!92758 () Bool)

(assert (=> b!877300 (= c!92758 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!877301 () Bool)

(declare-fun lt!397012 () Unit!29986)

(declare-fun lt!397007 () Unit!29986)

(assert (=> b!877301 (= lt!397012 lt!397007)))

(declare-fun lt!397009 () V!28283)

(declare-fun lt!397008 () ListLongMap!10351)

(declare-fun lt!397013 () (_ BitVec 64))

(declare-fun lt!397011 () (_ BitVec 64))

(assert (=> b!877301 (not (contains!4248 (+!2491 lt!397008 (tuple2!11583 lt!397013 lt!397009)) lt!397011))))

(assert (=> b!877301 (= lt!397007 (addStillNotContains!202 lt!397008 lt!397013 lt!397009 lt!397011))))

(assert (=> b!877301 (= lt!397011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877301 (= lt!397009 (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877301 (= lt!397013 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (=> b!877301 (= lt!397008 call!38842)))

(assert (=> b!877301 (= e!488368 (+!2491 call!38842 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877302 () Bool)

(assert (=> b!877302 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> b!877302 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24958 _values!688)))))

(declare-fun e!488364 () Bool)

(assert (=> b!877302 (= e!488364 (= (apply!377 lt!397010 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))) (get!12894 (select (arr!24518 _values!688) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!877303 () Bool)

(declare-fun e!488365 () Bool)

(assert (=> b!877303 (= e!488367 e!488365)))

(declare-fun c!92759 () Bool)

(declare-fun e!488363 () Bool)

(assert (=> b!877303 (= c!92759 e!488363)))

(declare-fun res!595987 () Bool)

(assert (=> b!877303 (=> (not res!595987) (not e!488363))))

(assert (=> b!877303 (= res!595987 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877304 () Bool)

(assert (=> b!877304 (= e!488365 e!488369)))

(declare-fun c!92756 () Bool)

(assert (=> b!877304 (= c!92756 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877305 () Bool)

(assert (=> b!877305 (= e!488366 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38839 () Bool)

(assert (=> bm!38839 (= call!38842 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!877306 () Bool)

(assert (=> b!877306 (= e!488363 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877306 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!877307 () Bool)

(assert (=> b!877307 (= e!488369 (isEmpty!663 lt!397010))))

(declare-fun b!877308 () Bool)

(assert (=> b!877308 (= e!488365 e!488364)))

(assert (=> b!877308 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun res!595990 () Bool)

(assert (=> b!877308 (= res!595990 (contains!4248 lt!397010 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877308 (=> (not res!595990) (not e!488364))))

(assert (= (and d!108801 c!92757) b!877305))

(assert (= (and d!108801 (not c!92757)) b!877300))

(assert (= (and b!877300 c!92758) b!877301))

(assert (= (and b!877300 (not c!92758)) b!877297))

(assert (= (or b!877301 b!877297) bm!38839))

(assert (= (and d!108801 res!595988) b!877299))

(assert (= (and b!877299 res!595989) b!877303))

(assert (= (and b!877303 res!595987) b!877306))

(assert (= (and b!877303 c!92759) b!877308))

(assert (= (and b!877303 (not c!92759)) b!877304))

(assert (= (and b!877308 res!595990) b!877302))

(assert (= (and b!877304 c!92756) b!877298))

(assert (= (and b!877304 (not c!92756)) b!877307))

(declare-fun b_lambda!12297 () Bool)

(assert (=> (not b_lambda!12297) (not b!877301)))

(assert (=> b!877301 t!24485))

(declare-fun b_and!25051 () Bool)

(assert (= b_and!25049 (and (=> t!24485 result!9505) b_and!25051)))

(declare-fun b_lambda!12299 () Bool)

(assert (=> (not b_lambda!12299) (not b!877302)))

(assert (=> b!877302 t!24485))

(declare-fun b_and!25053 () Bool)

(assert (= b_and!25051 (and (=> t!24485 result!9505) b_and!25053)))

(declare-fun m!817419 () Bool)

(assert (=> b!877299 m!817419))

(declare-fun m!817421 () Bool)

(assert (=> b!877301 m!817421))

(declare-fun m!817423 () Bool)

(assert (=> b!877301 m!817423))

(assert (=> b!877301 m!816653))

(declare-fun m!817425 () Bool)

(assert (=> b!877301 m!817425))

(declare-fun m!817427 () Bool)

(assert (=> b!877301 m!817427))

(declare-fun m!817429 () Bool)

(assert (=> b!877301 m!817429))

(assert (=> b!877301 m!817423))

(assert (=> b!877301 m!816653))

(declare-fun m!817431 () Bool)

(assert (=> b!877301 m!817431))

(assert (=> b!877301 m!817425))

(declare-fun m!817433 () Bool)

(assert (=> b!877301 m!817433))

(assert (=> b!877306 m!817429))

(assert (=> b!877306 m!817429))

(declare-fun m!817435 () Bool)

(assert (=> b!877306 m!817435))

(declare-fun m!817437 () Bool)

(assert (=> d!108801 m!817437))

(assert (=> d!108801 m!816665))

(assert (=> b!877300 m!817429))

(assert (=> b!877300 m!817429))

(assert (=> b!877300 m!817435))

(assert (=> b!877302 m!817423))

(assert (=> b!877302 m!816653))

(assert (=> b!877302 m!817429))

(declare-fun m!817439 () Bool)

(assert (=> b!877302 m!817439))

(assert (=> b!877302 m!817429))

(assert (=> b!877302 m!817423))

(assert (=> b!877302 m!816653))

(assert (=> b!877302 m!817431))

(declare-fun m!817441 () Bool)

(assert (=> b!877307 m!817441))

(declare-fun m!817443 () Bool)

(assert (=> bm!38839 m!817443))

(assert (=> b!877308 m!817429))

(assert (=> b!877308 m!817429))

(declare-fun m!817445 () Bool)

(assert (=> b!877308 m!817445))

(assert (=> b!877298 m!817443))

(assert (=> bm!38811 d!108801))

(declare-fun b!877309 () Bool)

(declare-fun e!488375 () ListLongMap!10351)

(declare-fun call!38843 () ListLongMap!10351)

(assert (=> b!877309 (= e!488375 call!38843)))

(declare-fun d!108803 () Bool)

(declare-fun e!488374 () Bool)

(assert (=> d!108803 e!488374))

(declare-fun res!595992 () Bool)

(assert (=> d!108803 (=> (not res!595992) (not e!488374))))

(declare-fun lt!397017 () ListLongMap!10351)

(assert (=> d!108803 (= res!595992 (not (contains!4248 lt!397017 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488373 () ListLongMap!10351)

(assert (=> d!108803 (= lt!397017 e!488373)))

(declare-fun c!92761 () Bool)

(assert (=> d!108803 (= c!92761 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> d!108803 (validMask!0 mask!1196)))

(assert (=> d!108803 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!397017)))

(declare-fun e!488376 () Bool)

(declare-fun b!877310 () Bool)

(assert (=> b!877310 (= e!488376 (= lt!397017 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877311 () Bool)

(declare-fun res!595993 () Bool)

(assert (=> b!877311 (=> (not res!595993) (not e!488374))))

(assert (=> b!877311 (= res!595993 (not (contains!4248 lt!397017 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877312 () Bool)

(assert (=> b!877312 (= e!488373 e!488375)))

(declare-fun c!92762 () Bool)

(assert (=> b!877312 (= c!92762 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!877313 () Bool)

(declare-fun lt!397019 () Unit!29986)

(declare-fun lt!397014 () Unit!29986)

(assert (=> b!877313 (= lt!397019 lt!397014)))

(declare-fun lt!397018 () (_ BitVec 64))

(declare-fun lt!397020 () (_ BitVec 64))

(declare-fun lt!397015 () ListLongMap!10351)

(declare-fun lt!397016 () V!28283)

(assert (=> b!877313 (not (contains!4248 (+!2491 lt!397015 (tuple2!11583 lt!397020 lt!397016)) lt!397018))))

(assert (=> b!877313 (= lt!397014 (addStillNotContains!202 lt!397015 lt!397020 lt!397016 lt!397018))))

(assert (=> b!877313 (= lt!397018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877313 (= lt!397016 (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877313 (= lt!397020 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)))))

(assert (=> b!877313 (= lt!397015 call!38843)))

(assert (=> b!877313 (= e!488375 (+!2491 call!38843 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877314 () Bool)

(assert (=> b!877314 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> b!877314 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24958 lt!396722)))))

(declare-fun e!488371 () Bool)

(assert (=> b!877314 (= e!488371 (= (apply!377 lt!397017 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))) (get!12894 (select (arr!24518 lt!396722) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!877315 () Bool)

(declare-fun e!488372 () Bool)

(assert (=> b!877315 (= e!488374 e!488372)))

(declare-fun c!92763 () Bool)

(declare-fun e!488370 () Bool)

(assert (=> b!877315 (= c!92763 e!488370)))

(declare-fun res!595991 () Bool)

(assert (=> b!877315 (=> (not res!595991) (not e!488370))))

(assert (=> b!877315 (= res!595991 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877316 () Bool)

(assert (=> b!877316 (= e!488372 e!488376)))

(declare-fun c!92760 () Bool)

(assert (=> b!877316 (= c!92760 (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877317 () Bool)

(assert (=> b!877317 (= e!488373 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38840 () Bool)

(assert (=> bm!38840 (= call!38843 (getCurrentListMapNoExtraKeys!3158 _keys!868 lt!396722 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!877318 () Bool)

(assert (=> b!877318 (= e!488370 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877318 (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!877319 () Bool)

(assert (=> b!877319 (= e!488376 (isEmpty!663 lt!397017))))

(declare-fun b!877320 () Bool)

(assert (=> b!877320 (= e!488372 e!488371)))

(assert (=> b!877320 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun res!595994 () Bool)

(assert (=> b!877320 (= res!595994 (contains!4248 lt!397017 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877320 (=> (not res!595994) (not e!488371))))

(assert (= (and d!108803 c!92761) b!877317))

(assert (= (and d!108803 (not c!92761)) b!877312))

(assert (= (and b!877312 c!92762) b!877313))

(assert (= (and b!877312 (not c!92762)) b!877309))

(assert (= (or b!877313 b!877309) bm!38840))

(assert (= (and d!108803 res!595992) b!877311))

(assert (= (and b!877311 res!595993) b!877315))

(assert (= (and b!877315 res!595991) b!877318))

(assert (= (and b!877315 c!92763) b!877320))

(assert (= (and b!877315 (not c!92763)) b!877316))

(assert (= (and b!877320 res!595994) b!877314))

(assert (= (and b!877316 c!92760) b!877310))

(assert (= (and b!877316 (not c!92760)) b!877319))

(declare-fun b_lambda!12301 () Bool)

(assert (=> (not b_lambda!12301) (not b!877313)))

(assert (=> b!877313 t!24485))

(declare-fun b_and!25055 () Bool)

(assert (= b_and!25053 (and (=> t!24485 result!9505) b_and!25055)))

(declare-fun b_lambda!12303 () Bool)

(assert (=> (not b_lambda!12303) (not b!877314)))

(assert (=> b!877314 t!24485))

(declare-fun b_and!25057 () Bool)

(assert (= b_and!25055 (and (=> t!24485 result!9505) b_and!25057)))

(declare-fun m!817447 () Bool)

(assert (=> b!877311 m!817447))

(declare-fun m!817449 () Bool)

(assert (=> b!877313 m!817449))

(declare-fun m!817451 () Bool)

(assert (=> b!877313 m!817451))

(assert (=> b!877313 m!816653))

(declare-fun m!817453 () Bool)

(assert (=> b!877313 m!817453))

(declare-fun m!817455 () Bool)

(assert (=> b!877313 m!817455))

(assert (=> b!877313 m!817429))

(assert (=> b!877313 m!817451))

(assert (=> b!877313 m!816653))

(declare-fun m!817457 () Bool)

(assert (=> b!877313 m!817457))

(assert (=> b!877313 m!817453))

(declare-fun m!817459 () Bool)

(assert (=> b!877313 m!817459))

(assert (=> b!877318 m!817429))

(assert (=> b!877318 m!817429))

(assert (=> b!877318 m!817435))

(declare-fun m!817461 () Bool)

(assert (=> d!108803 m!817461))

(assert (=> d!108803 m!816665))

(assert (=> b!877312 m!817429))

(assert (=> b!877312 m!817429))

(assert (=> b!877312 m!817435))

(assert (=> b!877314 m!817451))

(assert (=> b!877314 m!816653))

(assert (=> b!877314 m!817429))

(declare-fun m!817463 () Bool)

(assert (=> b!877314 m!817463))

(assert (=> b!877314 m!817429))

(assert (=> b!877314 m!817451))

(assert (=> b!877314 m!816653))

(assert (=> b!877314 m!817457))

(declare-fun m!817465 () Bool)

(assert (=> b!877319 m!817465))

(declare-fun m!817467 () Bool)

(assert (=> bm!38840 m!817467))

(assert (=> b!877320 m!817429))

(assert (=> b!877320 m!817429))

(declare-fun m!817469 () Bool)

(assert (=> b!877320 m!817469))

(assert (=> b!877310 m!817467))

(assert (=> b!876936 d!108803))

(declare-fun d!108805 () Bool)

(assert (=> d!108805 (= (get!12897 (select (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) from!1053) lt!396714) lt!396714)))

(assert (=> b!876960 d!108805))

(assert (=> b!877003 d!108673))

(assert (=> b!876938 d!108693))

(declare-fun d!108807 () Bool)

(assert (=> d!108807 (= (isEmpty!663 lt!396787) (isEmpty!664 (toList!5191 lt!396787)))))

(declare-fun bs!24625 () Bool)

(assert (= bs!24625 d!108807))

(declare-fun m!817471 () Bool)

(assert (=> bs!24625 m!817471))

(assert (=> b!876933 d!108807))

(assert (=> b!876914 d!108653))

(assert (=> b!876883 d!108673))

(declare-fun d!108809 () Bool)

(declare-fun e!488377 () Bool)

(assert (=> d!108809 e!488377))

(declare-fun res!595996 () Bool)

(assert (=> d!108809 (=> (not res!595996) (not e!488377))))

(declare-fun lt!397023 () ListLongMap!10351)

(assert (=> d!108809 (= res!595996 (contains!4248 lt!397023 (_1!5802 (tuple2!11583 k0!854 lt!396717))))))

(declare-fun lt!397022 () List!17399)

(assert (=> d!108809 (= lt!397023 (ListLongMap!10352 lt!397022))))

(declare-fun lt!397021 () Unit!29986)

(declare-fun lt!397024 () Unit!29986)

(assert (=> d!108809 (= lt!397021 lt!397024)))

(assert (=> d!108809 (= (getValueByKey!419 lt!397022 (_1!5802 (tuple2!11583 k0!854 lt!396717))) (Some!424 (_2!5802 (tuple2!11583 k0!854 lt!396717))))))

(assert (=> d!108809 (= lt!397024 (lemmaContainsTupThenGetReturnValue!233 lt!397022 (_1!5802 (tuple2!11583 k0!854 lt!396717)) (_2!5802 (tuple2!11583 k0!854 lt!396717))))))

(assert (=> d!108809 (= lt!397022 (insertStrictlySorted!272 (toList!5191 lt!396719) (_1!5802 (tuple2!11583 k0!854 lt!396717)) (_2!5802 (tuple2!11583 k0!854 lt!396717))))))

(assert (=> d!108809 (= (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396717)) lt!397023)))

(declare-fun b!877321 () Bool)

(declare-fun res!595995 () Bool)

(assert (=> b!877321 (=> (not res!595995) (not e!488377))))

(assert (=> b!877321 (= res!595995 (= (getValueByKey!419 (toList!5191 lt!397023) (_1!5802 (tuple2!11583 k0!854 lt!396717))) (Some!424 (_2!5802 (tuple2!11583 k0!854 lt!396717)))))))

(declare-fun b!877322 () Bool)

(assert (=> b!877322 (= e!488377 (contains!4249 (toList!5191 lt!397023) (tuple2!11583 k0!854 lt!396717)))))

(assert (= (and d!108809 res!595996) b!877321))

(assert (= (and b!877321 res!595995) b!877322))

(declare-fun m!817473 () Bool)

(assert (=> d!108809 m!817473))

(declare-fun m!817475 () Bool)

(assert (=> d!108809 m!817475))

(declare-fun m!817477 () Bool)

(assert (=> d!108809 m!817477))

(declare-fun m!817479 () Bool)

(assert (=> d!108809 m!817479))

(declare-fun m!817481 () Bool)

(assert (=> b!877321 m!817481))

(declare-fun m!817483 () Bool)

(assert (=> b!877322 m!817483))

(assert (=> d!108635 d!108809))

(declare-fun d!108811 () Bool)

(declare-fun e!488378 () Bool)

(assert (=> d!108811 e!488378))

(declare-fun res!595998 () Bool)

(assert (=> d!108811 (=> (not res!595998) (not e!488378))))

(declare-fun lt!397027 () ListLongMap!10351)

(assert (=> d!108811 (= res!595998 (contains!4248 lt!397027 (_1!5802 (tuple2!11583 k0!854 lt!396717))))))

(declare-fun lt!397026 () List!17399)

(assert (=> d!108811 (= lt!397027 (ListLongMap!10352 lt!397026))))

(declare-fun lt!397025 () Unit!29986)

(declare-fun lt!397028 () Unit!29986)

(assert (=> d!108811 (= lt!397025 lt!397028)))

(assert (=> d!108811 (= (getValueByKey!419 lt!397026 (_1!5802 (tuple2!11583 k0!854 lt!396717))) (Some!424 (_2!5802 (tuple2!11583 k0!854 lt!396717))))))

(assert (=> d!108811 (= lt!397028 (lemmaContainsTupThenGetReturnValue!233 lt!397026 (_1!5802 (tuple2!11583 k0!854 lt!396717)) (_2!5802 (tuple2!11583 k0!854 lt!396717))))))

(assert (=> d!108811 (= lt!397026 (insertStrictlySorted!272 (toList!5191 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715))) (_1!5802 (tuple2!11583 k0!854 lt!396717)) (_2!5802 (tuple2!11583 k0!854 lt!396717))))))

(assert (=> d!108811 (= (+!2491 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)) (tuple2!11583 k0!854 lt!396717)) lt!397027)))

(declare-fun b!877323 () Bool)

(declare-fun res!595997 () Bool)

(assert (=> b!877323 (=> (not res!595997) (not e!488378))))

(assert (=> b!877323 (= res!595997 (= (getValueByKey!419 (toList!5191 lt!397027) (_1!5802 (tuple2!11583 k0!854 lt!396717))) (Some!424 (_2!5802 (tuple2!11583 k0!854 lt!396717)))))))

(declare-fun b!877324 () Bool)

(assert (=> b!877324 (= e!488378 (contains!4249 (toList!5191 lt!397027) (tuple2!11583 k0!854 lt!396717)))))

(assert (= (and d!108811 res!595998) b!877323))

(assert (= (and b!877323 res!595997) b!877324))

(declare-fun m!817485 () Bool)

(assert (=> d!108811 m!817485))

(declare-fun m!817487 () Bool)

(assert (=> d!108811 m!817487))

(declare-fun m!817489 () Bool)

(assert (=> d!108811 m!817489))

(declare-fun m!817491 () Bool)

(assert (=> d!108811 m!817491))

(declare-fun m!817493 () Bool)

(assert (=> b!877323 m!817493))

(declare-fun m!817495 () Bool)

(assert (=> b!877324 m!817495))

(assert (=> d!108635 d!108811))

(assert (=> d!108635 d!108645))

(declare-fun d!108813 () Bool)

(assert (=> d!108813 (= (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396717)) (+!2491 (+!2491 lt!396719 (tuple2!11583 k0!854 lt!396715)) (tuple2!11583 k0!854 lt!396717)))))

(assert (=> d!108813 true))

(declare-fun _$24!45 () Unit!29986)

(assert (=> d!108813 (= (choose!1430 lt!396719 k0!854 lt!396715 lt!396717) _$24!45)))

(declare-fun bs!24626 () Bool)

(assert (= bs!24626 d!108813))

(assert (=> bs!24626 m!816829))

(assert (=> bs!24626 m!816639))

(assert (=> bs!24626 m!816639))

(assert (=> bs!24626 m!816831))

(assert (=> d!108635 d!108813))

(declare-fun d!108815 () Bool)

(declare-fun e!488379 () Bool)

(assert (=> d!108815 e!488379))

(declare-fun res!595999 () Bool)

(assert (=> d!108815 (=> res!595999 e!488379)))

(declare-fun lt!397032 () Bool)

(assert (=> d!108815 (= res!595999 (not lt!397032))))

(declare-fun lt!397031 () Bool)

(assert (=> d!108815 (= lt!397032 lt!397031)))

(declare-fun lt!397029 () Unit!29986)

(declare-fun e!488380 () Unit!29986)

(assert (=> d!108815 (= lt!397029 e!488380)))

(declare-fun c!92764 () Bool)

(assert (=> d!108815 (= c!92764 lt!397031)))

(assert (=> d!108815 (= lt!397031 (containsKey!403 (toList!5191 lt!396819) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108815 (= (contains!4248 lt!396819 (_1!5802 (tuple2!11583 k0!854 v!557))) lt!397032)))

(declare-fun b!877325 () Bool)

(declare-fun lt!397030 () Unit!29986)

(assert (=> b!877325 (= e!488380 lt!397030)))

(assert (=> b!877325 (= lt!397030 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396819) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> b!877325 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396819) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877326 () Bool)

(declare-fun Unit!30007 () Unit!29986)

(assert (=> b!877326 (= e!488380 Unit!30007)))

(declare-fun b!877327 () Bool)

(assert (=> b!877327 (= e!488379 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396819) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(assert (= (and d!108815 c!92764) b!877325))

(assert (= (and d!108815 (not c!92764)) b!877326))

(assert (= (and d!108815 (not res!595999)) b!877327))

(declare-fun m!817497 () Bool)

(assert (=> d!108815 m!817497))

(declare-fun m!817499 () Bool)

(assert (=> b!877325 m!817499))

(assert (=> b!877325 m!816859))

(assert (=> b!877325 m!816859))

(declare-fun m!817501 () Bool)

(assert (=> b!877325 m!817501))

(assert (=> b!877327 m!816859))

(assert (=> b!877327 m!816859))

(assert (=> b!877327 m!817501))

(assert (=> d!108641 d!108815))

(declare-fun d!108817 () Bool)

(declare-fun c!92765 () Bool)

(assert (=> d!108817 (= c!92765 (and ((_ is Cons!17395) lt!396818) (= (_1!5802 (h!18526 lt!396818)) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun e!488381 () Option!425)

(assert (=> d!108817 (= (getValueByKey!419 lt!396818 (_1!5802 (tuple2!11583 k0!854 v!557))) e!488381)))

(declare-fun b!877329 () Bool)

(declare-fun e!488382 () Option!425)

(assert (=> b!877329 (= e!488381 e!488382)))

(declare-fun c!92766 () Bool)

(assert (=> b!877329 (= c!92766 (and ((_ is Cons!17395) lt!396818) (not (= (_1!5802 (h!18526 lt!396818)) (_1!5802 (tuple2!11583 k0!854 v!557))))))))

(declare-fun b!877330 () Bool)

(assert (=> b!877330 (= e!488382 (getValueByKey!419 (t!24486 lt!396818) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877328 () Bool)

(assert (=> b!877328 (= e!488381 (Some!424 (_2!5802 (h!18526 lt!396818))))))

(declare-fun b!877331 () Bool)

(assert (=> b!877331 (= e!488382 None!423)))

(assert (= (and d!108817 c!92765) b!877328))

(assert (= (and d!108817 (not c!92765)) b!877329))

(assert (= (and b!877329 c!92766) b!877330))

(assert (= (and b!877329 (not c!92766)) b!877331))

(declare-fun m!817503 () Bool)

(assert (=> b!877330 m!817503))

(assert (=> d!108641 d!108817))

(declare-fun d!108819 () Bool)

(assert (=> d!108819 (= (getValueByKey!419 lt!396818 (_1!5802 (tuple2!11583 k0!854 v!557))) (Some!424 (_2!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun lt!397033 () Unit!29986)

(assert (=> d!108819 (= lt!397033 (choose!1433 lt!396818 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun e!488383 () Bool)

(assert (=> d!108819 e!488383))

(declare-fun res!596000 () Bool)

(assert (=> d!108819 (=> (not res!596000) (not e!488383))))

(assert (=> d!108819 (= res!596000 (isStrictlySorted!461 lt!396818))))

(assert (=> d!108819 (= (lemmaContainsTupThenGetReturnValue!233 lt!396818 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))) lt!397033)))

(declare-fun b!877332 () Bool)

(declare-fun res!596001 () Bool)

(assert (=> b!877332 (=> (not res!596001) (not e!488383))))

(assert (=> b!877332 (= res!596001 (containsKey!403 lt!396818 (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877333 () Bool)

(assert (=> b!877333 (= e!488383 (contains!4249 lt!396818 (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557)))))))

(assert (= (and d!108819 res!596000) b!877332))

(assert (= (and b!877332 res!596001) b!877333))

(assert (=> d!108819 m!816853))

(declare-fun m!817505 () Bool)

(assert (=> d!108819 m!817505))

(declare-fun m!817507 () Bool)

(assert (=> d!108819 m!817507))

(declare-fun m!817509 () Bool)

(assert (=> b!877332 m!817509))

(declare-fun m!817511 () Bool)

(assert (=> b!877333 m!817511))

(assert (=> d!108641 d!108819))

(declare-fun b!877334 () Bool)

(declare-fun e!488387 () List!17399)

(declare-fun call!38845 () List!17399)

(assert (=> b!877334 (= e!488387 call!38845)))

(declare-fun c!92767 () Bool)

(declare-fun b!877335 () Bool)

(assert (=> b!877335 (= c!92767 (and ((_ is Cons!17395) (toList!5191 lt!396718)) (bvsgt (_1!5802 (h!18526 (toList!5191 lt!396718))) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun e!488384 () List!17399)

(assert (=> b!877335 (= e!488384 e!488387)))

(declare-fun e!488388 () List!17399)

(declare-fun bm!38841 () Bool)

(declare-fun c!92768 () Bool)

(declare-fun call!38844 () List!17399)

(assert (=> bm!38841 (= call!38844 ($colon$colon!538 e!488388 (ite c!92768 (h!18526 (toList!5191 lt!396718)) (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))))

(declare-fun c!92769 () Bool)

(assert (=> bm!38841 (= c!92769 c!92768)))

(declare-fun b!877337 () Bool)

(assert (=> b!877337 (= e!488387 call!38845)))

(declare-fun b!877338 () Bool)

(declare-fun e!488386 () List!17399)

(assert (=> b!877338 (= e!488386 e!488384)))

(declare-fun c!92770 () Bool)

(assert (=> b!877338 (= c!92770 (and ((_ is Cons!17395) (toList!5191 lt!396718)) (= (_1!5802 (h!18526 (toList!5191 lt!396718))) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun bm!38842 () Bool)

(declare-fun call!38846 () List!17399)

(assert (=> bm!38842 (= call!38845 call!38846)))

(declare-fun b!877339 () Bool)

(assert (=> b!877339 (= e!488388 (insertStrictlySorted!272 (t!24486 (toList!5191 lt!396718)) (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877336 () Bool)

(assert (=> b!877336 (= e!488386 call!38844)))

(declare-fun d!108821 () Bool)

(declare-fun e!488385 () Bool)

(assert (=> d!108821 e!488385))

(declare-fun res!596003 () Bool)

(assert (=> d!108821 (=> (not res!596003) (not e!488385))))

(declare-fun lt!397034 () List!17399)

(assert (=> d!108821 (= res!596003 (isStrictlySorted!461 lt!397034))))

(assert (=> d!108821 (= lt!397034 e!488386)))

(assert (=> d!108821 (= c!92768 (and ((_ is Cons!17395) (toList!5191 lt!396718)) (bvslt (_1!5802 (h!18526 (toList!5191 lt!396718))) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(assert (=> d!108821 (isStrictlySorted!461 (toList!5191 lt!396718))))

(assert (=> d!108821 (= (insertStrictlySorted!272 (toList!5191 lt!396718) (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))) lt!397034)))

(declare-fun bm!38843 () Bool)

(assert (=> bm!38843 (= call!38846 call!38844)))

(declare-fun b!877340 () Bool)

(declare-fun res!596002 () Bool)

(assert (=> b!877340 (=> (not res!596002) (not e!488385))))

(assert (=> b!877340 (= res!596002 (containsKey!403 lt!397034 (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877341 () Bool)

(assert (=> b!877341 (= e!488384 call!38846)))

(declare-fun b!877342 () Bool)

(assert (=> b!877342 (= e!488385 (contains!4249 lt!397034 (tuple2!11583 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun b!877343 () Bool)

(assert (=> b!877343 (= e!488388 (ite c!92770 (t!24486 (toList!5191 lt!396718)) (ite c!92767 (Cons!17395 (h!18526 (toList!5191 lt!396718)) (t!24486 (toList!5191 lt!396718))) Nil!17396)))))

(assert (= (and d!108821 c!92768) b!877336))

(assert (= (and d!108821 (not c!92768)) b!877338))

(assert (= (and b!877338 c!92770) b!877341))

(assert (= (and b!877338 (not c!92770)) b!877335))

(assert (= (and b!877335 c!92767) b!877337))

(assert (= (and b!877335 (not c!92767)) b!877334))

(assert (= (or b!877337 b!877334) bm!38842))

(assert (= (or b!877341 bm!38842) bm!38843))

(assert (= (or b!877336 bm!38843) bm!38841))

(assert (= (and bm!38841 c!92769) b!877339))

(assert (= (and bm!38841 (not c!92769)) b!877343))

(assert (= (and d!108821 res!596003) b!877340))

(assert (= (and b!877340 res!596002) b!877342))

(declare-fun m!817513 () Bool)

(assert (=> d!108821 m!817513))

(declare-fun m!817515 () Bool)

(assert (=> d!108821 m!817515))

(declare-fun m!817517 () Bool)

(assert (=> b!877340 m!817517))

(declare-fun m!817519 () Bool)

(assert (=> b!877342 m!817519))

(declare-fun m!817521 () Bool)

(assert (=> b!877339 m!817521))

(declare-fun m!817523 () Bool)

(assert (=> bm!38841 m!817523))

(assert (=> d!108641 d!108821))

(declare-fun d!108823 () Bool)

(declare-fun lt!397035 () Bool)

(assert (=> d!108823 (= lt!397035 (select (content!392 (toList!5191 lt!396827)) lt!396716))))

(declare-fun e!488389 () Bool)

(assert (=> d!108823 (= lt!397035 e!488389)))

(declare-fun res!596005 () Bool)

(assert (=> d!108823 (=> (not res!596005) (not e!488389))))

(assert (=> d!108823 (= res!596005 ((_ is Cons!17395) (toList!5191 lt!396827)))))

(assert (=> d!108823 (= (contains!4249 (toList!5191 lt!396827) lt!396716) lt!397035)))

(declare-fun b!877344 () Bool)

(declare-fun e!488390 () Bool)

(assert (=> b!877344 (= e!488389 e!488390)))

(declare-fun res!596004 () Bool)

(assert (=> b!877344 (=> res!596004 e!488390)))

(assert (=> b!877344 (= res!596004 (= (h!18526 (toList!5191 lt!396827)) lt!396716))))

(declare-fun b!877345 () Bool)

(assert (=> b!877345 (= e!488390 (contains!4249 (t!24486 (toList!5191 lt!396827)) lt!396716))))

(assert (= (and d!108823 res!596005) b!877344))

(assert (= (and b!877344 (not res!596004)) b!877345))

(declare-fun m!817525 () Bool)

(assert (=> d!108823 m!817525))

(declare-fun m!817527 () Bool)

(assert (=> d!108823 m!817527))

(declare-fun m!817529 () Bool)

(assert (=> b!877345 m!817529))

(assert (=> b!876968 d!108823))

(assert (=> bm!38804 d!108803))

(declare-fun d!108825 () Bool)

(assert (=> d!108825 (= (isEmpty!663 lt!396794) (isEmpty!664 (toList!5191 lt!396794)))))

(declare-fun bs!24627 () Bool)

(assert (= bs!24627 d!108825))

(declare-fun m!817531 () Bool)

(assert (=> bs!24627 m!817531))

(assert (=> b!876945 d!108825))

(assert (=> b!876912 d!108763))

(declare-fun d!108827 () Bool)

(declare-fun lt!397036 () Bool)

(assert (=> d!108827 (= lt!397036 (select (content!392 (toList!5191 lt!396823)) (tuple2!11583 k0!854 lt!396715)))))

(declare-fun e!488391 () Bool)

(assert (=> d!108827 (= lt!397036 e!488391)))

(declare-fun res!596007 () Bool)

(assert (=> d!108827 (=> (not res!596007) (not e!488391))))

(assert (=> d!108827 (= res!596007 ((_ is Cons!17395) (toList!5191 lt!396823)))))

(assert (=> d!108827 (= (contains!4249 (toList!5191 lt!396823) (tuple2!11583 k0!854 lt!396715)) lt!397036)))

(declare-fun b!877346 () Bool)

(declare-fun e!488392 () Bool)

(assert (=> b!877346 (= e!488391 e!488392)))

(declare-fun res!596006 () Bool)

(assert (=> b!877346 (=> res!596006 e!488392)))

(assert (=> b!877346 (= res!596006 (= (h!18526 (toList!5191 lt!396823)) (tuple2!11583 k0!854 lt!396715)))))

(declare-fun b!877347 () Bool)

(assert (=> b!877347 (= e!488392 (contains!4249 (t!24486 (toList!5191 lt!396823)) (tuple2!11583 k0!854 lt!396715)))))

(assert (= (and d!108827 res!596007) b!877346))

(assert (= (and b!877346 (not res!596006)) b!877347))

(declare-fun m!817533 () Bool)

(assert (=> d!108827 m!817533))

(declare-fun m!817535 () Bool)

(assert (=> d!108827 m!817535))

(declare-fun m!817537 () Bool)

(assert (=> b!877347 m!817537))

(assert (=> b!876966 d!108827))

(declare-fun bm!38848 () Bool)

(declare-fun call!38852 () ListLongMap!10351)

(assert (=> bm!38848 (= call!38852 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!877352 () Bool)

(declare-fun e!488395 () Bool)

(declare-fun call!38851 () ListLongMap!10351)

(assert (=> b!877352 (= e!488395 (= call!38851 (+!2491 call!38852 (tuple2!11583 k0!854 v!557))))))

(declare-fun d!108829 () Bool)

(assert (=> d!108829 e!488395))

(declare-fun c!92773 () Bool)

(assert (=> d!108829 (= c!92773 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(assert (=> d!108829 true))

(declare-fun _$6!59 () Unit!29986)

(assert (=> d!108829 (= (choose!1431 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) _$6!59)))

(declare-fun b!877353 () Bool)

(assert (=> b!877353 (= e!488395 (= call!38851 call!38852))))

(declare-fun bm!38849 () Bool)

(assert (=> bm!38849 (= call!38851 (getCurrentListMapNoExtraKeys!3158 _keys!868 (array!50983 (store (arr!24518 _values!688) i!612 (ValueCellFull!8274 v!557)) (size!24958 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and d!108829 c!92773) b!877352))

(assert (= (and d!108829 (not c!92773)) b!877353))

(assert (= (or b!877352 b!877353) bm!38848))

(assert (= (or b!877352 b!877353) bm!38849))

(assert (=> bm!38848 m!816673))

(declare-fun m!817539 () Bool)

(assert (=> b!877352 m!817539))

(assert (=> bm!38849 m!816627))

(assert (=> bm!38849 m!816891))

(assert (=> d!108655 d!108829))

(assert (=> b!876979 d!108801))

(declare-fun d!108831 () Bool)

(declare-fun c!92774 () Bool)

(assert (=> d!108831 (= c!92774 (and ((_ is Cons!17395) (toList!5191 lt!396815)) (= (_1!5802 (h!18526 (toList!5191 lt!396815))) (_1!5802 lt!396716))))))

(declare-fun e!488396 () Option!425)

(assert (=> d!108831 (= (getValueByKey!419 (toList!5191 lt!396815) (_1!5802 lt!396716)) e!488396)))

(declare-fun b!877355 () Bool)

(declare-fun e!488397 () Option!425)

(assert (=> b!877355 (= e!488396 e!488397)))

(declare-fun c!92775 () Bool)

(assert (=> b!877355 (= c!92775 (and ((_ is Cons!17395) (toList!5191 lt!396815)) (not (= (_1!5802 (h!18526 (toList!5191 lt!396815))) (_1!5802 lt!396716)))))))

(declare-fun b!877356 () Bool)

(assert (=> b!877356 (= e!488397 (getValueByKey!419 (t!24486 (toList!5191 lt!396815)) (_1!5802 lt!396716)))))

(declare-fun b!877354 () Bool)

(assert (=> b!877354 (= e!488396 (Some!424 (_2!5802 (h!18526 (toList!5191 lt!396815)))))))

(declare-fun b!877357 () Bool)

(assert (=> b!877357 (= e!488397 None!423)))

(assert (= (and d!108831 c!92774) b!877354))

(assert (= (and d!108831 (not c!92774)) b!877355))

(assert (= (and b!877355 c!92775) b!877356))

(assert (= (and b!877355 (not c!92775)) b!877357))

(declare-fun m!817541 () Bool)

(assert (=> b!877356 m!817541))

(assert (=> b!876953 d!108831))

(assert (=> b!876920 d!108653))

(assert (=> b!876926 d!108653))

(declare-fun d!108833 () Bool)

(declare-fun e!488398 () Bool)

(assert (=> d!108833 e!488398))

(declare-fun res!596008 () Bool)

(assert (=> d!108833 (=> res!596008 e!488398)))

(declare-fun lt!397040 () Bool)

(assert (=> d!108833 (= res!596008 (not lt!397040))))

(declare-fun lt!397039 () Bool)

(assert (=> d!108833 (= lt!397040 lt!397039)))

(declare-fun lt!397037 () Unit!29986)

(declare-fun e!488399 () Unit!29986)

(assert (=> d!108833 (= lt!397037 e!488399)))

(declare-fun c!92776 () Bool)

(assert (=> d!108833 (= c!92776 lt!397039)))

(assert (=> d!108833 (= lt!397039 (containsKey!403 (toList!5191 lt!396794) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> d!108833 (= (contains!4248 lt!396794 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) lt!397040)))

(declare-fun b!877358 () Bool)

(declare-fun lt!397038 () Unit!29986)

(assert (=> b!877358 (= e!488399 lt!397038)))

(assert (=> b!877358 (= lt!397038 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396794) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!877358 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396794) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!877359 () Bool)

(declare-fun Unit!30008 () Unit!29986)

(assert (=> b!877359 (= e!488399 Unit!30008)))

(declare-fun b!877360 () Bool)

(assert (=> b!877360 (= e!488398 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396794) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(assert (= (and d!108833 c!92776) b!877358))

(assert (= (and d!108833 (not c!92776)) b!877359))

(assert (= (and d!108833 (not res!596008)) b!877360))

(assert (=> d!108833 m!816799))

(declare-fun m!817543 () Bool)

(assert (=> d!108833 m!817543))

(assert (=> b!877358 m!816799))

(declare-fun m!817545 () Bool)

(assert (=> b!877358 m!817545))

(assert (=> b!877358 m!816799))

(assert (=> b!877358 m!817415))

(assert (=> b!877358 m!817415))

(declare-fun m!817547 () Bool)

(assert (=> b!877358 m!817547))

(assert (=> b!877360 m!816799))

(assert (=> b!877360 m!817415))

(assert (=> b!877360 m!817415))

(assert (=> b!877360 m!817547))

(assert (=> b!876946 d!108833))

(declare-fun d!108835 () Bool)

(declare-fun e!488400 () Bool)

(assert (=> d!108835 e!488400))

(declare-fun res!596009 () Bool)

(assert (=> d!108835 (=> res!596009 e!488400)))

(declare-fun lt!397044 () Bool)

(assert (=> d!108835 (= res!596009 (not lt!397044))))

(declare-fun lt!397043 () Bool)

(assert (=> d!108835 (= lt!397044 lt!397043)))

(declare-fun lt!397041 () Unit!29986)

(declare-fun e!488401 () Unit!29986)

(assert (=> d!108835 (= lt!397041 e!488401)))

(declare-fun c!92777 () Bool)

(assert (=> d!108835 (= c!92777 lt!397043)))

(assert (=> d!108835 (= lt!397043 (containsKey!403 (toList!5191 lt!396835) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108835 (= (contains!4248 lt!396835 #b0000000000000000000000000000000000000000000000000000000000000000) lt!397044)))

(declare-fun b!877361 () Bool)

(declare-fun lt!397042 () Unit!29986)

(assert (=> b!877361 (= e!488401 lt!397042)))

(assert (=> b!877361 (= lt!397042 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396835) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877361 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396835) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877362 () Bool)

(declare-fun Unit!30009 () Unit!29986)

(assert (=> b!877362 (= e!488401 Unit!30009)))

(declare-fun b!877363 () Bool)

(assert (=> b!877363 (= e!488400 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396835) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108835 c!92777) b!877361))

(assert (= (and d!108835 (not c!92777)) b!877362))

(assert (= (and d!108835 (not res!596009)) b!877363))

(declare-fun m!817549 () Bool)

(assert (=> d!108835 m!817549))

(declare-fun m!817551 () Bool)

(assert (=> b!877361 m!817551))

(declare-fun m!817553 () Bool)

(assert (=> b!877361 m!817553))

(assert (=> b!877361 m!817553))

(declare-fun m!817555 () Bool)

(assert (=> b!877361 m!817555))

(assert (=> b!877363 m!817553))

(assert (=> b!877363 m!817553))

(assert (=> b!877363 m!817555))

(assert (=> d!108657 d!108835))

(assert (=> d!108657 d!108629))

(declare-fun b!877364 () Bool)

(declare-fun e!488407 () ListLongMap!10351)

(declare-fun call!38853 () ListLongMap!10351)

(assert (=> b!877364 (= e!488407 call!38853)))

(declare-fun d!108837 () Bool)

(declare-fun e!488406 () Bool)

(assert (=> d!108837 e!488406))

(declare-fun res!596011 () Bool)

(assert (=> d!108837 (=> (not res!596011) (not e!488406))))

(declare-fun lt!397048 () ListLongMap!10351)

(assert (=> d!108837 (= res!596011 (not (contains!4248 lt!397048 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!488405 () ListLongMap!10351)

(assert (=> d!108837 (= lt!397048 e!488405)))

(declare-fun c!92779 () Bool)

(assert (=> d!108837 (= c!92779 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> d!108837 (validMask!0 mask!1196)))

(assert (=> d!108837 (= (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696) lt!397048)))

(declare-fun e!488408 () Bool)

(declare-fun b!877365 () Bool)

(assert (=> b!877365 (= e!488408 (= lt!397048 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!877366 () Bool)

(declare-fun res!596012 () Bool)

(assert (=> b!877366 (=> (not res!596012) (not e!488406))))

(assert (=> b!877366 (= res!596012 (not (contains!4248 lt!397048 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!877367 () Bool)

(assert (=> b!877367 (= e!488405 e!488407)))

(declare-fun c!92780 () Bool)

(assert (=> b!877367 (= c!92780 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(declare-fun b!877368 () Bool)

(declare-fun lt!397050 () Unit!29986)

(declare-fun lt!397045 () Unit!29986)

(assert (=> b!877368 (= lt!397050 lt!397045)))

(declare-fun lt!397047 () V!28283)

(declare-fun lt!397046 () ListLongMap!10351)

(declare-fun lt!397049 () (_ BitVec 64))

(declare-fun lt!397051 () (_ BitVec 64))

(assert (=> b!877368 (not (contains!4248 (+!2491 lt!397046 (tuple2!11583 lt!397051 lt!397047)) lt!397049))))

(assert (=> b!877368 (= lt!397045 (addStillNotContains!202 lt!397046 lt!397051 lt!397047 lt!397049))))

(assert (=> b!877368 (= lt!397049 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!877368 (= lt!397047 (get!12894 (select (arr!24518 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!877368 (= lt!397051 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)))))

(assert (=> b!877368 (= lt!397046 call!38853)))

(assert (=> b!877368 (= e!488407 (+!2491 call!38853 (tuple2!11583 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001)) (get!12894 (select (arr!24518 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!877369 () Bool)

(assert (=> b!877369 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> b!877369 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24958 _values!688)))))

(declare-fun e!488403 () Bool)

(assert (=> b!877369 (= e!488403 (= (apply!377 lt!397048 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))) (get!12894 (select (arr!24518 _values!688) (bvadd from!1053 #b00000000000000000000000000000001)) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!877370 () Bool)

(declare-fun e!488404 () Bool)

(assert (=> b!877370 (= e!488406 e!488404)))

(declare-fun c!92781 () Bool)

(declare-fun e!488402 () Bool)

(assert (=> b!877370 (= c!92781 e!488402)))

(declare-fun res!596010 () Bool)

(assert (=> b!877370 (=> (not res!596010) (not e!488402))))

(assert (=> b!877370 (= res!596010 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877371 () Bool)

(assert (=> b!877371 (= e!488404 e!488408)))

(declare-fun c!92778 () Bool)

(assert (=> b!877371 (= c!92778 (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun b!877372 () Bool)

(assert (=> b!877372 (= e!488405 (ListLongMap!10352 Nil!17396))))

(declare-fun bm!38850 () Bool)

(assert (=> bm!38850 (= call!38853 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!877373 () Bool)

(assert (=> b!877373 (= e!488402 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877373 (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!877374 () Bool)

(assert (=> b!877374 (= e!488408 (isEmpty!663 lt!397048))))

(declare-fun b!877375 () Bool)

(assert (=> b!877375 (= e!488404 e!488403)))

(assert (=> b!877375 (and (bvsge (bvadd from!1053 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!1053 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(declare-fun res!596013 () Bool)

(assert (=> b!877375 (= res!596013 (contains!4248 lt!397048 (select (arr!24517 _keys!868) (bvadd from!1053 #b00000000000000000000000000000001))))))

(assert (=> b!877375 (=> (not res!596013) (not e!488403))))

(assert (= (and d!108837 c!92779) b!877372))

(assert (= (and d!108837 (not c!92779)) b!877367))

(assert (= (and b!877367 c!92780) b!877368))

(assert (= (and b!877367 (not c!92780)) b!877364))

(assert (= (or b!877368 b!877364) bm!38850))

(assert (= (and d!108837 res!596011) b!877366))

(assert (= (and b!877366 res!596012) b!877370))

(assert (= (and b!877370 res!596010) b!877373))

(assert (= (and b!877370 c!92781) b!877375))

(assert (= (and b!877370 (not c!92781)) b!877371))

(assert (= (and b!877375 res!596013) b!877369))

(assert (= (and b!877371 c!92778) b!877365))

(assert (= (and b!877371 (not c!92778)) b!877374))

(declare-fun b_lambda!12305 () Bool)

(assert (=> (not b_lambda!12305) (not b!877368)))

(assert (=> b!877368 t!24485))

(declare-fun b_and!25059 () Bool)

(assert (= b_and!25057 (and (=> t!24485 result!9505) b_and!25059)))

(declare-fun b_lambda!12307 () Bool)

(assert (=> (not b_lambda!12307) (not b!877369)))

(assert (=> b!877369 t!24485))

(declare-fun b_and!25061 () Bool)

(assert (= b_and!25059 (and (=> t!24485 result!9505) b_and!25061)))

(declare-fun m!817557 () Bool)

(assert (=> b!877366 m!817557))

(declare-fun m!817559 () Bool)

(assert (=> b!877368 m!817559))

(declare-fun m!817561 () Bool)

(assert (=> b!877368 m!817561))

(assert (=> b!877368 m!816653))

(declare-fun m!817563 () Bool)

(assert (=> b!877368 m!817563))

(declare-fun m!817565 () Bool)

(assert (=> b!877368 m!817565))

(assert (=> b!877368 m!817271))

(assert (=> b!877368 m!817561))

(assert (=> b!877368 m!816653))

(declare-fun m!817567 () Bool)

(assert (=> b!877368 m!817567))

(assert (=> b!877368 m!817563))

(declare-fun m!817569 () Bool)

(assert (=> b!877368 m!817569))

(assert (=> b!877373 m!817271))

(assert (=> b!877373 m!817271))

(assert (=> b!877373 m!817277))

(declare-fun m!817571 () Bool)

(assert (=> d!108837 m!817571))

(assert (=> d!108837 m!816665))

(assert (=> b!877367 m!817271))

(assert (=> b!877367 m!817271))

(assert (=> b!877367 m!817277))

(assert (=> b!877369 m!817561))

(assert (=> b!877369 m!816653))

(assert (=> b!877369 m!817271))

(declare-fun m!817573 () Bool)

(assert (=> b!877369 m!817573))

(assert (=> b!877369 m!817271))

(assert (=> b!877369 m!817561))

(assert (=> b!877369 m!816653))

(assert (=> b!877369 m!817567))

(declare-fun m!817575 () Bool)

(assert (=> b!877374 m!817575))

(declare-fun m!817577 () Bool)

(assert (=> bm!38850 m!817577))

(assert (=> b!877375 m!817271))

(assert (=> b!877375 m!817271))

(declare-fun m!817579 () Bool)

(assert (=> b!877375 m!817579))

(assert (=> b!877365 m!817577))

(assert (=> b!876924 d!108837))

(declare-fun d!108839 () Bool)

(assert (=> d!108839 (= (get!12896 (select (arr!24518 _values!688) from!1053) lt!396714) (v!11194 (select (arr!24518 _values!688) from!1053)))))

(assert (=> b!876963 d!108839))

(assert (=> bm!38803 d!108837))

(declare-fun b!877376 () Bool)

(declare-fun e!488412 () Bool)

(declare-fun call!38854 () Bool)

(assert (=> b!877376 (= e!488412 call!38854)))

(declare-fun b!877377 () Bool)

(assert (=> b!877377 (= e!488412 call!38854)))

(declare-fun bm!38851 () Bool)

(declare-fun c!92782 () Bool)

(assert (=> bm!38851 (= call!38854 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!92782 (Cons!17396 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!92664 (Cons!17396 (select (arr!24517 _keys!868) #b00000000000000000000000000000000) Nil!17397) Nil!17397)) (ite c!92664 (Cons!17396 (select (arr!24517 _keys!868) #b00000000000000000000000000000000) Nil!17397) Nil!17397))))))

(declare-fun b!877378 () Bool)

(declare-fun e!488410 () Bool)

(assert (=> b!877378 (= e!488410 (contains!4250 (ite c!92664 (Cons!17396 (select (arr!24517 _keys!868) #b00000000000000000000000000000000) Nil!17397) Nil!17397) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!877379 () Bool)

(declare-fun e!488409 () Bool)

(assert (=> b!877379 (= e!488409 e!488412)))

(assert (=> b!877379 (= c!92782 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!108841 () Bool)

(declare-fun res!596015 () Bool)

(declare-fun e!488411 () Bool)

(assert (=> d!108841 (=> res!596015 e!488411)))

(assert (=> d!108841 (= res!596015 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!24957 _keys!868)))))

(assert (=> d!108841 (= (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92664 (Cons!17396 (select (arr!24517 _keys!868) #b00000000000000000000000000000000) Nil!17397) Nil!17397)) e!488411)))

(declare-fun b!877380 () Bool)

(assert (=> b!877380 (= e!488411 e!488409)))

(declare-fun res!596016 () Bool)

(assert (=> b!877380 (=> (not res!596016) (not e!488409))))

(assert (=> b!877380 (= res!596016 (not e!488410))))

(declare-fun res!596014 () Bool)

(assert (=> b!877380 (=> (not res!596014) (not e!488410))))

(assert (=> b!877380 (= res!596014 (validKeyInArray!0 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!108841 (not res!596015)) b!877380))

(assert (= (and b!877380 res!596014) b!877378))

(assert (= (and b!877380 res!596016) b!877379))

(assert (= (and b!877379 c!92782) b!877376))

(assert (= (and b!877379 (not c!92782)) b!877377))

(assert (= (or b!877376 b!877377) bm!38851))

(assert (=> bm!38851 m!817301))

(declare-fun m!817581 () Bool)

(assert (=> bm!38851 m!817581))

(assert (=> b!877378 m!817301))

(assert (=> b!877378 m!817301))

(declare-fun m!817583 () Bool)

(assert (=> b!877378 m!817583))

(assert (=> b!877379 m!817301))

(assert (=> b!877379 m!817301))

(assert (=> b!877379 m!817303))

(assert (=> b!877380 m!817301))

(assert (=> b!877380 m!817301))

(assert (=> b!877380 m!817303))

(assert (=> bm!38814 d!108841))

(declare-fun d!108843 () Bool)

(declare-fun e!488413 () Bool)

(assert (=> d!108843 e!488413))

(declare-fun res!596018 () Bool)

(assert (=> d!108843 (=> (not res!596018) (not e!488413))))

(declare-fun lt!397054 () ListLongMap!10351)

(assert (=> d!108843 (= res!596018 (contains!4248 lt!397054 (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun lt!397053 () List!17399)

(assert (=> d!108843 (= lt!397054 (ListLongMap!10352 lt!397053))))

(declare-fun lt!397052 () Unit!29986)

(declare-fun lt!397055 () Unit!29986)

(assert (=> d!108843 (= lt!397052 lt!397055)))

(assert (=> d!108843 (= (getValueByKey!419 lt!397053 (_1!5802 (tuple2!11583 k0!854 v!557))) (Some!424 (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108843 (= lt!397055 (lemmaContainsTupThenGetReturnValue!233 lt!397053 (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108843 (= lt!397053 (insertStrictlySorted!272 (toList!5191 call!38812) (_1!5802 (tuple2!11583 k0!854 v!557)) (_2!5802 (tuple2!11583 k0!854 v!557))))))

(assert (=> d!108843 (= (+!2491 call!38812 (tuple2!11583 k0!854 v!557)) lt!397054)))

(declare-fun b!877381 () Bool)

(declare-fun res!596017 () Bool)

(assert (=> b!877381 (=> (not res!596017) (not e!488413))))

(assert (=> b!877381 (= res!596017 (= (getValueByKey!419 (toList!5191 lt!397054) (_1!5802 (tuple2!11583 k0!854 v!557))) (Some!424 (_2!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun b!877382 () Bool)

(assert (=> b!877382 (= e!488413 (contains!4249 (toList!5191 lt!397054) (tuple2!11583 k0!854 v!557)))))

(assert (= (and d!108843 res!596018) b!877381))

(assert (= (and b!877381 res!596017) b!877382))

(declare-fun m!817585 () Bool)

(assert (=> d!108843 m!817585))

(declare-fun m!817587 () Bool)

(assert (=> d!108843 m!817587))

(declare-fun m!817589 () Bool)

(assert (=> d!108843 m!817589))

(declare-fun m!817591 () Bool)

(assert (=> d!108843 m!817591))

(declare-fun m!817593 () Bool)

(assert (=> b!877381 m!817593))

(declare-fun m!817595 () Bool)

(assert (=> b!877382 m!817595))

(assert (=> b!876975 d!108843))

(declare-fun d!108845 () Bool)

(assert (=> d!108845 (= (apply!377 lt!396787 (select (arr!24517 _keys!868) from!1053)) (get!12898 (getValueByKey!419 (toList!5191 lt!396787) (select (arr!24517 _keys!868) from!1053))))))

(declare-fun bs!24628 () Bool)

(assert (= bs!24628 d!108845))

(assert (=> bs!24628 m!816651))

(assert (=> bs!24628 m!817025))

(assert (=> bs!24628 m!817025))

(declare-fun m!817597 () Bool)

(assert (=> bs!24628 m!817597))

(assert (=> b!876928 d!108845))

(assert (=> b!876928 d!108757))

(assert (=> b!876981 d!108693))

(declare-fun lt!397056 () Bool)

(declare-fun d!108847 () Bool)

(assert (=> d!108847 (= lt!397056 (select (content!392 (toList!5191 lt!396819)) (tuple2!11583 k0!854 v!557)))))

(declare-fun e!488414 () Bool)

(assert (=> d!108847 (= lt!397056 e!488414)))

(declare-fun res!596020 () Bool)

(assert (=> d!108847 (=> (not res!596020) (not e!488414))))

(assert (=> d!108847 (= res!596020 ((_ is Cons!17395) (toList!5191 lt!396819)))))

(assert (=> d!108847 (= (contains!4249 (toList!5191 lt!396819) (tuple2!11583 k0!854 v!557)) lt!397056)))

(declare-fun b!877383 () Bool)

(declare-fun e!488415 () Bool)

(assert (=> b!877383 (= e!488414 e!488415)))

(declare-fun res!596019 () Bool)

(assert (=> b!877383 (=> res!596019 e!488415)))

(assert (=> b!877383 (= res!596019 (= (h!18526 (toList!5191 lt!396819)) (tuple2!11583 k0!854 v!557)))))

(declare-fun b!877384 () Bool)

(assert (=> b!877384 (= e!488415 (contains!4249 (t!24486 (toList!5191 lt!396819)) (tuple2!11583 k0!854 v!557)))))

(assert (= (and d!108847 res!596020) b!877383))

(assert (= (and b!877383 (not res!596019)) b!877384))

(declare-fun m!817599 () Bool)

(assert (=> d!108847 m!817599))

(declare-fun m!817601 () Bool)

(assert (=> d!108847 m!817601))

(declare-fun m!817603 () Bool)

(assert (=> b!877384 m!817603))

(assert (=> b!876962 d!108847))

(declare-fun d!108849 () Bool)

(declare-fun lt!397057 () Bool)

(assert (=> d!108849 (= lt!397057 (select (content!392 (toList!5191 lt!396808)) (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))

(declare-fun e!488416 () Bool)

(assert (=> d!108849 (= lt!397057 e!488416)))

(declare-fun res!596022 () Bool)

(assert (=> d!108849 (=> (not res!596022) (not e!488416))))

(assert (=> d!108849 (= res!596022 ((_ is Cons!17395) (toList!5191 lt!396808)))))

(assert (=> d!108849 (= (contains!4249 (toList!5191 lt!396808) (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)) lt!397057)))

(declare-fun b!877385 () Bool)

(declare-fun e!488417 () Bool)

(assert (=> b!877385 (= e!488416 e!488417)))

(declare-fun res!596021 () Bool)

(assert (=> b!877385 (=> res!596021 e!488417)))

(assert (=> b!877385 (= res!596021 (= (h!18526 (toList!5191 lt!396808)) (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))

(declare-fun b!877386 () Bool)

(assert (=> b!877386 (= e!488417 (contains!4249 (t!24486 (toList!5191 lt!396808)) (tuple2!11583 (select (arr!24517 _keys!868) from!1053) lt!396717)))))

(assert (= (and d!108849 res!596022) b!877385))

(assert (= (and b!877385 (not res!596021)) b!877386))

(declare-fun m!817605 () Bool)

(assert (=> d!108849 m!817605))

(declare-fun m!817607 () Bool)

(assert (=> d!108849 m!817607))

(declare-fun m!817609 () Bool)

(assert (=> b!877386 m!817609))

(assert (=> b!876952 d!108849))

(declare-fun c!92783 () Bool)

(declare-fun d!108851 () Bool)

(assert (=> d!108851 (= c!92783 (and ((_ is Cons!17395) (toList!5191 lt!396841)) (= (_1!5802 (h!18526 (toList!5191 lt!396841))) (_1!5802 (tuple2!11583 k0!854 v!557)))))))

(declare-fun e!488418 () Option!425)

(assert (=> d!108851 (= (getValueByKey!419 (toList!5191 lt!396841) (_1!5802 (tuple2!11583 k0!854 v!557))) e!488418)))

(declare-fun b!877388 () Bool)

(declare-fun e!488419 () Option!425)

(assert (=> b!877388 (= e!488418 e!488419)))

(declare-fun c!92784 () Bool)

(assert (=> b!877388 (= c!92784 (and ((_ is Cons!17395) (toList!5191 lt!396841)) (not (= (_1!5802 (h!18526 (toList!5191 lt!396841))) (_1!5802 (tuple2!11583 k0!854 v!557))))))))

(declare-fun b!877389 () Bool)

(assert (=> b!877389 (= e!488419 (getValueByKey!419 (t!24486 (toList!5191 lt!396841)) (_1!5802 (tuple2!11583 k0!854 v!557))))))

(declare-fun b!877387 () Bool)

(assert (=> b!877387 (= e!488418 (Some!424 (_2!5802 (h!18526 (toList!5191 lt!396841)))))))

(declare-fun b!877390 () Bool)

(assert (=> b!877390 (= e!488419 None!423)))

(assert (= (and d!108851 c!92783) b!877387))

(assert (= (and d!108851 (not c!92783)) b!877388))

(assert (= (and b!877388 c!92784) b!877389))

(assert (= (and b!877388 (not c!92784)) b!877390))

(declare-fun m!817611 () Bool)

(assert (=> b!877389 m!817611))

(assert (=> b!877005 d!108851))

(declare-fun d!108853 () Bool)

(declare-fun e!488420 () Bool)

(assert (=> d!108853 e!488420))

(declare-fun res!596023 () Bool)

(assert (=> d!108853 (=> res!596023 e!488420)))

(declare-fun lt!397061 () Bool)

(assert (=> d!108853 (= res!596023 (not lt!397061))))

(declare-fun lt!397060 () Bool)

(assert (=> d!108853 (= lt!397061 lt!397060)))

(declare-fun lt!397058 () Unit!29986)

(declare-fun e!488421 () Unit!29986)

(assert (=> d!108853 (= lt!397058 e!488421)))

(declare-fun c!92785 () Bool)

(assert (=> d!108853 (= c!92785 lt!397060)))

(assert (=> d!108853 (= lt!397060 (containsKey!403 (toList!5191 lt!396794) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!108853 (= (contains!4248 lt!396794 #b0000000000000000000000000000000000000000000000000000000000000000) lt!397061)))

(declare-fun b!877391 () Bool)

(declare-fun lt!397059 () Unit!29986)

(assert (=> b!877391 (= e!488421 lt!397059)))

(assert (=> b!877391 (= lt!397059 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396794) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!877391 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396794) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!877392 () Bool)

(declare-fun Unit!30010 () Unit!29986)

(assert (=> b!877392 (= e!488421 Unit!30010)))

(declare-fun b!877393 () Bool)

(assert (=> b!877393 (= e!488420 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396794) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108853 c!92785) b!877391))

(assert (= (and d!108853 (not c!92785)) b!877392))

(assert (= (and d!108853 (not res!596023)) b!877393))

(declare-fun m!817613 () Bool)

(assert (=> d!108853 m!817613))

(declare-fun m!817615 () Bool)

(assert (=> b!877391 m!817615))

(declare-fun m!817617 () Bool)

(assert (=> b!877391 m!817617))

(assert (=> b!877391 m!817617))

(declare-fun m!817619 () Bool)

(assert (=> b!877391 m!817619))

(assert (=> b!877393 m!817617))

(assert (=> b!877393 m!817617))

(assert (=> b!877393 m!817619))

(assert (=> d!108631 d!108853))

(assert (=> d!108631 d!108629))

(declare-fun d!108855 () Bool)

(assert (=> d!108855 (= (apply!377 lt!396835 (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12898 (getValueByKey!419 (toList!5191 lt!396835) (select (arr!24517 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))))

(declare-fun bs!24629 () Bool)

(assert (= bs!24629 d!108855))

(assert (=> bs!24629 m!816799))

(assert (=> bs!24629 m!816983))

(assert (=> bs!24629 m!816983))

(declare-fun m!817621 () Bool)

(assert (=> bs!24629 m!817621))

(assert (=> b!876983 d!108855))

(assert (=> b!876983 d!108787))

(declare-fun d!108857 () Bool)

(declare-fun e!488422 () Bool)

(assert (=> d!108857 e!488422))

(declare-fun res!596024 () Bool)

(assert (=> d!108857 (=> res!596024 e!488422)))

(declare-fun lt!397065 () Bool)

(assert (=> d!108857 (= res!596024 (not lt!397065))))

(declare-fun lt!397064 () Bool)

(assert (=> d!108857 (= lt!397065 lt!397064)))

(declare-fun lt!397062 () Unit!29986)

(declare-fun e!488423 () Unit!29986)

(assert (=> d!108857 (= lt!397062 e!488423)))

(declare-fun c!92786 () Bool)

(assert (=> d!108857 (= c!92786 lt!397064)))

(assert (=> d!108857 (= lt!397064 (containsKey!403 (toList!5191 lt!396780) (select (arr!24517 _keys!868) from!1053)))))

(assert (=> d!108857 (= (contains!4248 lt!396780 (select (arr!24517 _keys!868) from!1053)) lt!397065)))

(declare-fun b!877394 () Bool)

(declare-fun lt!397063 () Unit!29986)

(assert (=> b!877394 (= e!488423 lt!397063)))

(assert (=> b!877394 (= lt!397063 (lemmaContainsKeyImpliesGetValueByKeyDefined!312 (toList!5191 lt!396780) (select (arr!24517 _keys!868) from!1053)))))

(assert (=> b!877394 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396780) (select (arr!24517 _keys!868) from!1053)))))

(declare-fun b!877395 () Bool)

(declare-fun Unit!30011 () Unit!29986)

(assert (=> b!877395 (= e!488423 Unit!30011)))

(declare-fun b!877396 () Bool)

(assert (=> b!877396 (= e!488422 (isDefined!313 (getValueByKey!419 (toList!5191 lt!396780) (select (arr!24517 _keys!868) from!1053))))))

(assert (= (and d!108857 c!92786) b!877394))

(assert (= (and d!108857 (not c!92786)) b!877395))

(assert (= (and d!108857 (not res!596024)) b!877396))

(assert (=> d!108857 m!816651))

(declare-fun m!817623 () Bool)

(assert (=> d!108857 m!817623))

(assert (=> b!877394 m!816651))

(declare-fun m!817625 () Bool)

(assert (=> b!877394 m!817625))

(assert (=> b!877394 m!816651))

(assert (=> b!877394 m!817297))

(assert (=> b!877394 m!817297))

(declare-fun m!817627 () Bool)

(assert (=> b!877394 m!817627))

(assert (=> b!877396 m!816651))

(assert (=> b!877396 m!817297))

(assert (=> b!877396 m!817297))

(assert (=> b!877396 m!817627))

(assert (=> b!876922 d!108857))

(declare-fun b!877397 () Bool)

(declare-fun e!488425 () Bool)

(assert (=> b!877397 (= e!488425 tp_is_empty!17427)))

(declare-fun mapNonEmpty!27759 () Bool)

(declare-fun mapRes!27759 () Bool)

(declare-fun tp!53237 () Bool)

(assert (=> mapNonEmpty!27759 (= mapRes!27759 (and tp!53237 e!488425))))

(declare-fun mapValue!27759 () ValueCell!8274)

(declare-fun mapRest!27759 () (Array (_ BitVec 32) ValueCell!8274))

(declare-fun mapKey!27759 () (_ BitVec 32))

(assert (=> mapNonEmpty!27759 (= mapRest!27758 (store mapRest!27759 mapKey!27759 mapValue!27759))))

(declare-fun condMapEmpty!27759 () Bool)

(declare-fun mapDefault!27759 () ValueCell!8274)

(assert (=> mapNonEmpty!27758 (= condMapEmpty!27759 (= mapRest!27758 ((as const (Array (_ BitVec 32) ValueCell!8274)) mapDefault!27759)))))

(declare-fun e!488424 () Bool)

(assert (=> mapNonEmpty!27758 (= tp!53236 (and e!488424 mapRes!27759))))

(declare-fun mapIsEmpty!27759 () Bool)

(assert (=> mapIsEmpty!27759 mapRes!27759))

(declare-fun b!877398 () Bool)

(assert (=> b!877398 (= e!488424 tp_is_empty!17427)))

(assert (= (and mapNonEmpty!27758 condMapEmpty!27759) mapIsEmpty!27759))

(assert (= (and mapNonEmpty!27758 (not condMapEmpty!27759)) mapNonEmpty!27759))

(assert (= (and mapNonEmpty!27759 ((_ is ValueCellFull!8274) mapValue!27759)) b!877397))

(assert (= (and mapNonEmpty!27758 ((_ is ValueCellFull!8274) mapDefault!27759)) b!877398))

(declare-fun m!817629 () Bool)

(assert (=> mapNonEmpty!27759 m!817629))

(declare-fun b_lambda!12309 () Bool)

(assert (= b_lambda!12299 (or (and start!74440 b_free!15183) b_lambda!12309)))

(declare-fun b_lambda!12311 () Bool)

(assert (= b_lambda!12291 (or (and start!74440 b_free!15183) b_lambda!12311)))

(declare-fun b_lambda!12313 () Bool)

(assert (= b_lambda!12289 (or (and start!74440 b_free!15183) b_lambda!12313)))

(declare-fun b_lambda!12315 () Bool)

(assert (= b_lambda!12295 (or (and start!74440 b_free!15183) b_lambda!12315)))

(declare-fun b_lambda!12317 () Bool)

(assert (= b_lambda!12297 (or (and start!74440 b_free!15183) b_lambda!12317)))

(declare-fun b_lambda!12319 () Bool)

(assert (= b_lambda!12305 (or (and start!74440 b_free!15183) b_lambda!12319)))

(declare-fun b_lambda!12321 () Bool)

(assert (= b_lambda!12301 (or (and start!74440 b_free!15183) b_lambda!12321)))

(declare-fun b_lambda!12323 () Bool)

(assert (= b_lambda!12307 (or (and start!74440 b_free!15183) b_lambda!12323)))

(declare-fun b_lambda!12325 () Bool)

(assert (= b_lambda!12293 (or (and start!74440 b_free!15183) b_lambda!12325)))

(declare-fun b_lambda!12327 () Bool)

(assert (= b_lambda!12303 (or (and start!74440 b_free!15183) b_lambda!12327)))

(check-sat (not b!877191) (not b!877235) (not b!877258) (not b!877360) (not d!108819) (not b_lambda!12325) (not b!877203) (not b!877034) (not b_next!15183) (not b!877135) (not b!877322) (not b!877112) (not b!877366) (not b!877086) (not d!108837) (not d!108755) (not b!877324) (not bm!38849) (not d!108663) (not b!877036) (not b!877287) (not b!877210) (not b!877159) (not b!877332) (not d!108779) (not b!877096) (not b!877241) (not b!877290) (not b!877378) (not d!108775) (not b!877365) (not b!877312) (not b!877279) (not b!877310) (not d!108665) (not bm!38827) (not b!877382) (not b!877292) (not b!877130) (not d!108741) (not b!877230) (not b!877265) (not d!108699) (not b!877114) (not b!877115) (not b!877224) (not d!108759) (not b!877286) (not b!877246) (not b!877184) (not b!877271) (not b!877141) (not d!108853) (not b!877278) (not b!877311) (not b!877105) (not b!877295) (not d!108671) (not d!108809) (not bm!38824) (not b!877094) (not b!877208) (not b!877031) (not d!108751) (not b!877301) (not b!877122) (not d!108737) (not b!877134) (not b!877215) (not b!877129) (not b!877242) (not b!877314) (not d!108733) (not d!108855) (not d!108857) (not b!877250) (not d!108695) (not d!108845) (not b!877037) (not b!877243) (not b_lambda!12287) (not b!877131) (not d!108727) (not b!877222) (not b_lambda!12281) tp_is_empty!17427 (not b!877299) (not b!877029) (not b!877283) (not b!877093) (not b!877128) (not d!108827) (not b!877339) (not b!877318) (not b!877384) (not b!877175) (not b_lambda!12311) (not d!108765) (not bm!38841) (not bm!38834) (not b!877057) (not b!877308) (not d!108813) (not b!877039) (not b!877306) (not d!108679) (not b!877188) (not d!108761) (not d!108721) (not b!877219) (not b!877361) (not d!108715) (not d!108847) (not b!877373) (not b!877172) (not b!877169) (not b!877313) (not b!877319) (not b_lambda!12315) (not b!877363) (not b!877218) (not b!877127) (not bm!38835) (not b!877245) (not b_lambda!12321) (not b!877289) (not b!877380) (not b_lambda!12275) (not b_lambda!12279) (not b!877102) (not b!877298) (not b!877196) (not b!877233) (not b!877194) (not b!877016) (not d!108825) (not b!877107) (not bm!38839) (not d!108777) (not b!877240) (not b!877204) (not b!877206) (not d!108753) (not b!877300) (not b!877345) (not d!108849) (not d!108723) (not d!108703) (not b!877391) (not d!108747) (not b_lambda!12283) (not b!877327) (not d!108705) (not b!877056) (not b_lambda!12319) (not b!877033) (not b!877386) (not b!877186) (not b!877379) (not d!108843) (not d!108683) (not d!108707) (not d!108795) (not bm!38838) (not b_lambda!12313) (not b!877356) (not b_lambda!12285) (not d!108713) (not b!877100) (not bm!38821) (not b_lambda!12327) (not b!877109) (not b!877368) (not b_lambda!12255) (not b_lambda!12317) (not b!877367) (not d!108789) (not d!108685) (not b!877393) (not b!877167) (not b!877375) (not d!108835) (not bm!38851) (not b!877358) (not b!877369) (not b!877236) (not mapNonEmpty!27759) (not b!877050) (not b!877022) (not b!877221) (not d!108803) (not b!877270) (not b!877264) (not b!877174) (not b!877257) (not b!877307) (not b!877389) (not b!877197) (not d!108763) (not b!877181) (not d!108731) (not b!877189) (not b!877220) (not b!877394) (not d!108689) (not b!877252) (not d!108743) (not b!877330) (not d!108771) (not d!108791) b_and!25061 (not b!877234) (not b!877374) (not bm!38850) (not d!108815) (not b!877124) (not b!877333) (not b!877352) (not bm!38840) (not b!877083) (not b!877288) (not b!877255) (not b!877296) (not d!108823) (not b!877302) (not b!877321) (not b!877247) (not bm!38833) (not b!877396) (not b!877099) (not b!877325) (not b_lambda!12277) (not b!877320) (not d!108717) (not bm!38848) (not d!108797) (not d!108833) (not b!877280) (not d!108767) (not b_lambda!12273) (not d!108687) (not b!877133) (not bm!38830) (not b!877160) (not d!108675) (not b!877162) (not b!877340) (not b!877032) (not b!877381) (not b!877342) (not b!877294) (not d!108691) (not b!877273) (not d!108709) (not b!877084) (not b!877182) (not d!108821) (not d!108785) (not b!877213) (not b!877267) (not b_lambda!12309) (not d!108735) (not d!108811) (not b_lambda!12323) (not d!108799) (not d!108781) (not b!877165) (not b!877232) (not d!108793) (not b!877097) (not d!108669) (not b!877021) (not b!877121) (not b!877347) (not b!877216) (not b!877323) (not b!877272) (not d!108801) (not d!108807) (not b!877015) (not b!877274))
(check-sat b_and!25061 (not b_next!15183))
