; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73954 () Bool)

(assert start!73954)

(declare-fun b_free!14701 () Bool)

(declare-fun b_next!14701 () Bool)

(assert (=> start!73954 (= b_free!14701 (not b_next!14701))))

(declare-fun tp!51608 () Bool)

(declare-fun b_and!24391 () Bool)

(assert (=> start!73954 (= tp!51608 b_and!24391)))

(declare-fun res!588611 () Bool)

(declare-fun e!482870 () Bool)

(assert (=> start!73954 (=> (not res!588611) (not e!482870))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49885 0))(
  ( (array!49886 (arr!23969 (Array (_ BitVec 32) (_ BitVec 64))) (size!24410 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49885)

(assert (=> start!73954 (= res!588611 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24410 _keys!868))))))

(assert (=> start!73954 e!482870))

(declare-fun tp_is_empty!16837 () Bool)

(assert (=> start!73954 tp_is_empty!16837))

(assert (=> start!73954 true))

(assert (=> start!73954 tp!51608))

(declare-fun array_inv!19006 (array!49885) Bool)

(assert (=> start!73954 (array_inv!19006 _keys!868)))

(declare-datatypes ((V!27497 0))(
  ( (V!27498 (val!8466 Int)) )
))
(declare-datatypes ((ValueCell!7979 0))(
  ( (ValueCellFull!7979 (v!10891 V!27497)) (EmptyCell!7979) )
))
(declare-datatypes ((array!49887 0))(
  ( (array!49888 (arr!23970 (Array (_ BitVec 32) ValueCell!7979)) (size!24411 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49887)

(declare-fun e!482873 () Bool)

(declare-fun array_inv!19007 (array!49887) Bool)

(assert (=> start!73954 (and (array_inv!19007 _values!688) e!482873)))

(declare-fun b!866678 () Bool)

(declare-fun e!482874 () Bool)

(assert (=> b!866678 (= e!482874 true)))

(declare-datatypes ((tuple2!11144 0))(
  ( (tuple2!11145 (_1!5583 (_ BitVec 64)) (_2!5583 V!27497)) )
))
(declare-fun lt!392837 () tuple2!11144)

(declare-datatypes ((List!16974 0))(
  ( (Nil!16971) (Cons!16970 (h!18107 tuple2!11144) (t!23933 List!16974)) )
))
(declare-datatypes ((ListLongMap!9915 0))(
  ( (ListLongMap!9916 (toList!4973 List!16974)) )
))
(declare-fun lt!392836 () ListLongMap!9915)

(declare-fun lt!392844 () tuple2!11144)

(declare-fun lt!392841 () ListLongMap!9915)

(declare-fun +!2376 (ListLongMap!9915 tuple2!11144) ListLongMap!9915)

(assert (=> b!866678 (= lt!392836 (+!2376 (+!2376 lt!392841 lt!392837) lt!392844))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27497)

(declare-fun lt!392846 () V!27497)

(declare-datatypes ((Unit!29650 0))(
  ( (Unit!29651) )
))
(declare-fun lt!392843 () Unit!29650)

(declare-fun addCommutativeForDiffKeys!521 (ListLongMap!9915 (_ BitVec 64) V!27497 (_ BitVec 64) V!27497) Unit!29650)

(assert (=> b!866678 (= lt!392843 (addCommutativeForDiffKeys!521 lt!392841 k0!854 v!557 (select (arr!23969 _keys!868) from!1053) lt!392846))))

(declare-fun b!866679 () Bool)

(declare-fun res!588619 () Bool)

(assert (=> b!866679 (=> (not res!588619) (not e!482870))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49885 (_ BitVec 32)) Bool)

(assert (=> b!866679 (= res!588619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866680 () Bool)

(declare-fun e!482871 () Bool)

(assert (=> b!866680 (= e!482871 tp_is_empty!16837)))

(declare-fun b!866681 () Bool)

(declare-fun e!482878 () Bool)

(assert (=> b!866681 (= e!482878 tp_is_empty!16837)))

(declare-fun b!866682 () Bool)

(declare-fun e!482872 () Bool)

(assert (=> b!866682 (= e!482872 e!482874)))

(declare-fun res!588614 () Bool)

(assert (=> b!866682 (=> res!588614 e!482874)))

(assert (=> b!866682 (= res!588614 (= k0!854 (select (arr!23969 _keys!868) from!1053)))))

(assert (=> b!866682 (not (= (select (arr!23969 _keys!868) from!1053) k0!854))))

(declare-fun lt!392838 () Unit!29650)

(declare-fun e!482876 () Unit!29650)

(assert (=> b!866682 (= lt!392838 e!482876)))

(declare-fun c!92554 () Bool)

(assert (=> b!866682 (= c!92554 (= (select (arr!23969 _keys!868) from!1053) k0!854))))

(declare-fun lt!392840 () ListLongMap!9915)

(assert (=> b!866682 (= lt!392840 lt!392836)))

(declare-fun lt!392839 () ListLongMap!9915)

(assert (=> b!866682 (= lt!392836 (+!2376 lt!392839 lt!392837))))

(assert (=> b!866682 (= lt!392837 (tuple2!11145 (select (arr!23969 _keys!868) from!1053) lt!392846))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12681 (ValueCell!7979 V!27497) V!27497)

(declare-fun dynLambda!1197 (Int (_ BitVec 64)) V!27497)

(assert (=> b!866682 (= lt!392846 (get!12681 (select (arr!23970 _values!688) from!1053) (dynLambda!1197 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866683 () Bool)

(declare-fun e!482875 () Bool)

(assert (=> b!866683 (= e!482875 (not e!482872))))

(declare-fun res!588617 () Bool)

(assert (=> b!866683 (=> res!588617 e!482872)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866683 (= res!588617 (not (validKeyInArray!0 (select (arr!23969 _keys!868) from!1053))))))

(declare-fun lt!392835 () ListLongMap!9915)

(assert (=> b!866683 (= lt!392835 lt!392839)))

(assert (=> b!866683 (= lt!392839 (+!2376 lt!392841 lt!392844))))

(declare-fun minValue!654 () V!27497)

(declare-fun zeroValue!654 () V!27497)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!392845 () array!49887)

(declare-fun getCurrentListMapNoExtraKeys!3022 (array!49885 array!49887 (_ BitVec 32) (_ BitVec 32) V!27497 V!27497 (_ BitVec 32) Int) ListLongMap!9915)

(assert (=> b!866683 (= lt!392835 (getCurrentListMapNoExtraKeys!3022 _keys!868 lt!392845 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866683 (= lt!392844 (tuple2!11145 k0!854 v!557))))

(assert (=> b!866683 (= lt!392841 (getCurrentListMapNoExtraKeys!3022 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!392847 () Unit!29650)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!556 (array!49885 array!49887 (_ BitVec 32) (_ BitVec 32) V!27497 V!27497 (_ BitVec 32) (_ BitVec 64) V!27497 (_ BitVec 32) Int) Unit!29650)

(assert (=> b!866683 (= lt!392847 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!556 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866684 () Bool)

(declare-fun res!588618 () Bool)

(assert (=> b!866684 (=> (not res!588618) (not e!482870))))

(assert (=> b!866684 (= res!588618 (and (= (size!24411 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24410 _keys!868) (size!24411 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866685 () Bool)

(assert (=> b!866685 (= e!482870 e!482875)))

(declare-fun res!588610 () Bool)

(assert (=> b!866685 (=> (not res!588610) (not e!482875))))

(assert (=> b!866685 (= res!588610 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866685 (= lt!392840 (getCurrentListMapNoExtraKeys!3022 _keys!868 lt!392845 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866685 (= lt!392845 (array!49888 (store (arr!23970 _values!688) i!612 (ValueCellFull!7979 v!557)) (size!24411 _values!688)))))

(declare-fun lt!392834 () ListLongMap!9915)

(assert (=> b!866685 (= lt!392834 (getCurrentListMapNoExtraKeys!3022 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866686 () Bool)

(declare-fun Unit!29652 () Unit!29650)

(assert (=> b!866686 (= e!482876 Unit!29652)))

(declare-fun b!866687 () Bool)

(declare-fun res!588612 () Bool)

(assert (=> b!866687 (=> (not res!588612) (not e!482870))))

(assert (=> b!866687 (= res!588612 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24410 _keys!868))))))

(declare-fun mapNonEmpty!26855 () Bool)

(declare-fun mapRes!26855 () Bool)

(declare-fun tp!51607 () Bool)

(assert (=> mapNonEmpty!26855 (= mapRes!26855 (and tp!51607 e!482878))))

(declare-fun mapKey!26855 () (_ BitVec 32))

(declare-fun mapValue!26855 () ValueCell!7979)

(declare-fun mapRest!26855 () (Array (_ BitVec 32) ValueCell!7979))

(assert (=> mapNonEmpty!26855 (= (arr!23970 _values!688) (store mapRest!26855 mapKey!26855 mapValue!26855))))

(declare-fun b!866688 () Bool)

(assert (=> b!866688 (= e!482873 (and e!482871 mapRes!26855))))

(declare-fun condMapEmpty!26855 () Bool)

(declare-fun mapDefault!26855 () ValueCell!7979)

(assert (=> b!866688 (= condMapEmpty!26855 (= (arr!23970 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7979)) mapDefault!26855)))))

(declare-fun b!866689 () Bool)

(declare-fun res!588615 () Bool)

(assert (=> b!866689 (=> (not res!588615) (not e!482870))))

(assert (=> b!866689 (= res!588615 (and (= (select (arr!23969 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26855 () Bool)

(assert (=> mapIsEmpty!26855 mapRes!26855))

(declare-fun b!866690 () Bool)

(declare-fun res!588609 () Bool)

(assert (=> b!866690 (=> (not res!588609) (not e!482870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866690 (= res!588609 (validMask!0 mask!1196))))

(declare-fun b!866691 () Bool)

(declare-fun Unit!29653 () Unit!29650)

(assert (=> b!866691 (= e!482876 Unit!29653)))

(declare-fun lt!392842 () Unit!29650)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49885 (_ BitVec 32) (_ BitVec 32)) Unit!29650)

(assert (=> b!866691 (= lt!392842 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16975 0))(
  ( (Nil!16972) (Cons!16971 (h!18108 (_ BitVec 64)) (t!23934 List!16975)) )
))
(declare-fun arrayNoDuplicates!0 (array!49885 (_ BitVec 32) List!16975) Bool)

(assert (=> b!866691 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16972)))

(declare-fun lt!392849 () Unit!29650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49885 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29650)

(assert (=> b!866691 (= lt!392849 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866691 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392848 () Unit!29650)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49885 (_ BitVec 64) (_ BitVec 32) List!16975) Unit!29650)

(assert (=> b!866691 (= lt!392848 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16972))))

(assert (=> b!866691 false))

(declare-fun b!866692 () Bool)

(declare-fun res!588616 () Bool)

(assert (=> b!866692 (=> (not res!588616) (not e!482870))))

(assert (=> b!866692 (= res!588616 (validKeyInArray!0 k0!854))))

(declare-fun b!866693 () Bool)

(declare-fun res!588613 () Bool)

(assert (=> b!866693 (=> (not res!588613) (not e!482870))))

(assert (=> b!866693 (= res!588613 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16972))))

(assert (= (and start!73954 res!588611) b!866690))

(assert (= (and b!866690 res!588609) b!866684))

(assert (= (and b!866684 res!588618) b!866679))

(assert (= (and b!866679 res!588619) b!866693))

(assert (= (and b!866693 res!588613) b!866687))

(assert (= (and b!866687 res!588612) b!866692))

(assert (= (and b!866692 res!588616) b!866689))

(assert (= (and b!866689 res!588615) b!866685))

(assert (= (and b!866685 res!588610) b!866683))

(assert (= (and b!866683 (not res!588617)) b!866682))

(assert (= (and b!866682 c!92554) b!866691))

(assert (= (and b!866682 (not c!92554)) b!866686))

(assert (= (and b!866682 (not res!588614)) b!866678))

(assert (= (and b!866688 condMapEmpty!26855) mapIsEmpty!26855))

(assert (= (and b!866688 (not condMapEmpty!26855)) mapNonEmpty!26855))

(get-info :version)

(assert (= (and mapNonEmpty!26855 ((_ is ValueCellFull!7979) mapValue!26855)) b!866681))

(assert (= (and b!866688 ((_ is ValueCellFull!7979) mapDefault!26855)) b!866680))

(assert (= start!73954 b!866688))

(declare-fun b_lambda!12067 () Bool)

(assert (=> (not b_lambda!12067) (not b!866682)))

(declare-fun t!23932 () Bool)

(declare-fun tb!4815 () Bool)

(assert (=> (and start!73954 (= defaultEntry!696 defaultEntry!696) t!23932) tb!4815))

(declare-fun result!9249 () Bool)

(assert (=> tb!4815 (= result!9249 tp_is_empty!16837)))

(assert (=> b!866682 t!23932))

(declare-fun b_and!24393 () Bool)

(assert (= b_and!24391 (and (=> t!23932 result!9249) b_and!24393)))

(declare-fun m!808619 () Bool)

(assert (=> b!866689 m!808619))

(declare-fun m!808621 () Bool)

(assert (=> b!866691 m!808621))

(declare-fun m!808623 () Bool)

(assert (=> b!866691 m!808623))

(declare-fun m!808625 () Bool)

(assert (=> b!866691 m!808625))

(declare-fun m!808627 () Bool)

(assert (=> b!866691 m!808627))

(declare-fun m!808629 () Bool)

(assert (=> b!866691 m!808629))

(declare-fun m!808631 () Bool)

(assert (=> b!866693 m!808631))

(declare-fun m!808633 () Bool)

(assert (=> b!866682 m!808633))

(declare-fun m!808635 () Bool)

(assert (=> b!866682 m!808635))

(declare-fun m!808637 () Bool)

(assert (=> b!866682 m!808637))

(declare-fun m!808639 () Bool)

(assert (=> b!866682 m!808639))

(assert (=> b!866682 m!808635))

(declare-fun m!808641 () Bool)

(assert (=> b!866682 m!808641))

(assert (=> b!866682 m!808637))

(declare-fun m!808643 () Bool)

(assert (=> b!866678 m!808643))

(assert (=> b!866678 m!808643))

(declare-fun m!808645 () Bool)

(assert (=> b!866678 m!808645))

(assert (=> b!866678 m!808641))

(assert (=> b!866678 m!808641))

(declare-fun m!808647 () Bool)

(assert (=> b!866678 m!808647))

(declare-fun m!808649 () Bool)

(assert (=> b!866683 m!808649))

(assert (=> b!866683 m!808641))

(declare-fun m!808651 () Bool)

(assert (=> b!866683 m!808651))

(assert (=> b!866683 m!808641))

(declare-fun m!808653 () Bool)

(assert (=> b!866683 m!808653))

(declare-fun m!808655 () Bool)

(assert (=> b!866683 m!808655))

(declare-fun m!808657 () Bool)

(assert (=> b!866683 m!808657))

(declare-fun m!808659 () Bool)

(assert (=> b!866692 m!808659))

(declare-fun m!808661 () Bool)

(assert (=> mapNonEmpty!26855 m!808661))

(declare-fun m!808663 () Bool)

(assert (=> b!866685 m!808663))

(declare-fun m!808665 () Bool)

(assert (=> b!866685 m!808665))

(declare-fun m!808667 () Bool)

(assert (=> b!866685 m!808667))

(declare-fun m!808669 () Bool)

(assert (=> b!866679 m!808669))

(declare-fun m!808671 () Bool)

(assert (=> b!866690 m!808671))

(declare-fun m!808673 () Bool)

(assert (=> start!73954 m!808673))

(declare-fun m!808675 () Bool)

(assert (=> start!73954 m!808675))

(check-sat (not b_next!14701) (not b!866682) (not b!866678) (not b!866693) (not b!866685) (not start!73954) (not b_lambda!12067) (not b!866679) (not b!866691) (not b!866683) tp_is_empty!16837 (not b!866690) b_and!24393 (not b!866692) (not mapNonEmpty!26855))
(check-sat b_and!24393 (not b_next!14701))
