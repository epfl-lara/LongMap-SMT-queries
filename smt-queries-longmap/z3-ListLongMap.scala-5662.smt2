; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73738 () Bool)

(assert start!73738)

(declare-fun b_free!14671 () Bool)

(declare-fun b_next!14671 () Bool)

(assert (=> start!73738 (= b_free!14671 (not b_next!14671))))

(declare-fun tp!51518 () Bool)

(declare-fun b_and!24295 () Bool)

(assert (=> start!73738 (= tp!51518 b_and!24295)))

(declare-fun mapIsEmpty!26810 () Bool)

(declare-fun mapRes!26810 () Bool)

(assert (=> mapIsEmpty!26810 mapRes!26810))

(declare-fun mapNonEmpty!26810 () Bool)

(declare-fun tp!51517 () Bool)

(declare-fun e!481741 () Bool)

(assert (=> mapNonEmpty!26810 (= mapRes!26810 (and tp!51517 e!481741))))

(declare-datatypes ((V!27457 0))(
  ( (V!27458 (val!8451 Int)) )
))
(declare-datatypes ((ValueCell!7964 0))(
  ( (ValueCellFull!7964 (v!10870 V!27457)) (EmptyCell!7964) )
))
(declare-fun mapValue!26810 () ValueCell!7964)

(declare-fun mapRest!26810 () (Array (_ BitVec 32) ValueCell!7964))

(declare-fun mapKey!26810 () (_ BitVec 32))

(declare-datatypes ((array!49767 0))(
  ( (array!49768 (arr!23915 (Array (_ BitVec 32) ValueCell!7964)) (size!24357 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49767)

(assert (=> mapNonEmpty!26810 (= (arr!23915 _values!688) (store mapRest!26810 mapKey!26810 mapValue!26810))))

(declare-fun b!864786 () Bool)

(declare-fun tp_is_empty!16807 () Bool)

(assert (=> b!864786 (= e!481741 tp_is_empty!16807)))

(declare-fun b!864788 () Bool)

(declare-fun e!481738 () Bool)

(assert (=> b!864788 (= e!481738 tp_is_empty!16807)))

(declare-fun b!864789 () Bool)

(declare-fun res!587668 () Bool)

(declare-fun e!481743 () Bool)

(assert (=> b!864789 (=> (not res!587668) (not e!481743))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49769 0))(
  ( (array!49770 (arr!23916 (Array (_ BitVec 32) (_ BitVec 64))) (size!24358 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49769)

(assert (=> b!864789 (= res!587668 (and (= (size!24357 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24358 _keys!868) (size!24357 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864790 () Bool)

(declare-fun res!587664 () Bool)

(assert (=> b!864790 (=> (not res!587664) (not e!481743))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!864790 (= res!587664 (and (= (select (arr!23916 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864791 () Bool)

(declare-fun e!481737 () Bool)

(assert (=> b!864791 (= e!481737 (and e!481738 mapRes!26810))))

(declare-fun condMapEmpty!26810 () Bool)

(declare-fun mapDefault!26810 () ValueCell!7964)

(assert (=> b!864791 (= condMapEmpty!26810 (= (arr!23915 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7964)) mapDefault!26810)))))

(declare-fun b!864792 () Bool)

(declare-datatypes ((Unit!29539 0))(
  ( (Unit!29540) )
))
(declare-fun e!481740 () Unit!29539)

(declare-fun Unit!29541 () Unit!29539)

(assert (=> b!864792 (= e!481740 Unit!29541)))

(declare-fun lt!391525 () Unit!29539)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49769 (_ BitVec 32) (_ BitVec 32)) Unit!29539)

(assert (=> b!864792 (= lt!391525 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17005 0))(
  ( (Nil!17002) (Cons!17001 (h!18132 (_ BitVec 64)) (t!23933 List!17005)) )
))
(declare-fun arrayNoDuplicates!0 (array!49769 (_ BitVec 32) List!17005) Bool)

(assert (=> b!864792 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17002)))

(declare-fun lt!391520 () Unit!29539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49769 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29539)

(assert (=> b!864792 (= lt!391520 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864792 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391528 () Unit!29539)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49769 (_ BitVec 64) (_ BitVec 32) List!17005) Unit!29539)

(assert (=> b!864792 (= lt!391528 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17002))))

(assert (=> b!864792 false))

(declare-fun b!864793 () Bool)

(declare-fun res!587663 () Bool)

(assert (=> b!864793 (=> (not res!587663) (not e!481743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864793 (= res!587663 (validMask!0 mask!1196))))

(declare-fun res!587662 () Bool)

(assert (=> start!73738 (=> (not res!587662) (not e!481743))))

(assert (=> start!73738 (= res!587662 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24358 _keys!868))))))

(assert (=> start!73738 e!481743))

(assert (=> start!73738 tp_is_empty!16807))

(assert (=> start!73738 true))

(assert (=> start!73738 tp!51518))

(declare-fun array_inv!18984 (array!49769) Bool)

(assert (=> start!73738 (array_inv!18984 _keys!868)))

(declare-fun array_inv!18985 (array!49767) Bool)

(assert (=> start!73738 (and (array_inv!18985 _values!688) e!481737)))

(declare-fun b!864787 () Bool)

(declare-fun e!481735 () Bool)

(declare-fun e!481736 () Bool)

(assert (=> b!864787 (= e!481735 (not e!481736))))

(declare-fun res!587661 () Bool)

(assert (=> b!864787 (=> res!587661 e!481736)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864787 (= res!587661 (not (validKeyInArray!0 (select (arr!23916 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11212 0))(
  ( (tuple2!11213 (_1!5617 (_ BitVec 64)) (_2!5617 V!27457)) )
))
(declare-datatypes ((List!17006 0))(
  ( (Nil!17003) (Cons!17002 (h!18133 tuple2!11212) (t!23934 List!17006)) )
))
(declare-datatypes ((ListLongMap!9971 0))(
  ( (ListLongMap!9972 (toList!5001 List!17006)) )
))
(declare-fun lt!391521 () ListLongMap!9971)

(declare-fun lt!391518 () ListLongMap!9971)

(assert (=> b!864787 (= lt!391521 lt!391518)))

(declare-fun lt!391532 () ListLongMap!9971)

(declare-fun lt!391527 () tuple2!11212)

(declare-fun +!2369 (ListLongMap!9971 tuple2!11212) ListLongMap!9971)

(assert (=> b!864787 (= lt!391518 (+!2369 lt!391532 lt!391527))))

(declare-fun lt!391523 () array!49767)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27457)

(declare-fun zeroValue!654 () V!27457)

(declare-fun getCurrentListMapNoExtraKeys!2999 (array!49769 array!49767 (_ BitVec 32) (_ BitVec 32) V!27457 V!27457 (_ BitVec 32) Int) ListLongMap!9971)

(assert (=> b!864787 (= lt!391521 (getCurrentListMapNoExtraKeys!2999 _keys!868 lt!391523 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27457)

(assert (=> b!864787 (= lt!391527 (tuple2!11213 k0!854 v!557))))

(assert (=> b!864787 (= lt!391532 (getCurrentListMapNoExtraKeys!2999 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!391526 () Unit!29539)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!546 (array!49769 array!49767 (_ BitVec 32) (_ BitVec 32) V!27457 V!27457 (_ BitVec 32) (_ BitVec 64) V!27457 (_ BitVec 32) Int) Unit!29539)

(assert (=> b!864787 (= lt!391526 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!546 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864794 () Bool)

(declare-fun res!587667 () Bool)

(assert (=> b!864794 (=> (not res!587667) (not e!481743))))

(assert (=> b!864794 (= res!587667 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17002))))

(declare-fun b!864795 () Bool)

(declare-fun res!587670 () Bool)

(assert (=> b!864795 (=> (not res!587670) (not e!481743))))

(assert (=> b!864795 (= res!587670 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24358 _keys!868))))))

(declare-fun b!864796 () Bool)

(declare-fun e!481742 () Bool)

(assert (=> b!864796 (= e!481736 e!481742)))

(declare-fun res!587669 () Bool)

(assert (=> b!864796 (=> res!587669 e!481742)))

(assert (=> b!864796 (= res!587669 (= k0!854 (select (arr!23916 _keys!868) from!1053)))))

(assert (=> b!864796 (not (= (select (arr!23916 _keys!868) from!1053) k0!854))))

(declare-fun lt!391517 () Unit!29539)

(assert (=> b!864796 (= lt!391517 e!481740)))

(declare-fun c!92162 () Bool)

(assert (=> b!864796 (= c!92162 (= (select (arr!23916 _keys!868) from!1053) k0!854))))

(declare-fun lt!391522 () ListLongMap!9971)

(declare-fun lt!391524 () ListLongMap!9971)

(assert (=> b!864796 (= lt!391522 lt!391524)))

(declare-fun lt!391529 () tuple2!11212)

(assert (=> b!864796 (= lt!391524 (+!2369 lt!391518 lt!391529))))

(declare-fun lt!391530 () V!27457)

(assert (=> b!864796 (= lt!391529 (tuple2!11213 (select (arr!23916 _keys!868) from!1053) lt!391530))))

(declare-fun get!12640 (ValueCell!7964 V!27457) V!27457)

(declare-fun dynLambda!1169 (Int (_ BitVec 64)) V!27457)

(assert (=> b!864796 (= lt!391530 (get!12640 (select (arr!23915 _values!688) from!1053) (dynLambda!1169 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864797 () Bool)

(assert (=> b!864797 (= e!481742 true)))

(assert (=> b!864797 (= lt!391524 (+!2369 (+!2369 lt!391532 lt!391529) lt!391527))))

(declare-fun lt!391519 () Unit!29539)

(declare-fun addCommutativeForDiffKeys!511 (ListLongMap!9971 (_ BitVec 64) V!27457 (_ BitVec 64) V!27457) Unit!29539)

(assert (=> b!864797 (= lt!391519 (addCommutativeForDiffKeys!511 lt!391532 k0!854 v!557 (select (arr!23916 _keys!868) from!1053) lt!391530))))

(declare-fun b!864798 () Bool)

(declare-fun Unit!29542 () Unit!29539)

(assert (=> b!864798 (= e!481740 Unit!29542)))

(declare-fun b!864799 () Bool)

(assert (=> b!864799 (= e!481743 e!481735)))

(declare-fun res!587660 () Bool)

(assert (=> b!864799 (=> (not res!587660) (not e!481735))))

(assert (=> b!864799 (= res!587660 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!864799 (= lt!391522 (getCurrentListMapNoExtraKeys!2999 _keys!868 lt!391523 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864799 (= lt!391523 (array!49768 (store (arr!23915 _values!688) i!612 (ValueCellFull!7964 v!557)) (size!24357 _values!688)))))

(declare-fun lt!391531 () ListLongMap!9971)

(assert (=> b!864799 (= lt!391531 (getCurrentListMapNoExtraKeys!2999 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864800 () Bool)

(declare-fun res!587665 () Bool)

(assert (=> b!864800 (=> (not res!587665) (not e!481743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49769 (_ BitVec 32)) Bool)

(assert (=> b!864800 (= res!587665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864801 () Bool)

(declare-fun res!587666 () Bool)

(assert (=> b!864801 (=> (not res!587666) (not e!481743))))

(assert (=> b!864801 (= res!587666 (validKeyInArray!0 k0!854))))

(assert (= (and start!73738 res!587662) b!864793))

(assert (= (and b!864793 res!587663) b!864789))

(assert (= (and b!864789 res!587668) b!864800))

(assert (= (and b!864800 res!587665) b!864794))

(assert (= (and b!864794 res!587667) b!864795))

(assert (= (and b!864795 res!587670) b!864801))

(assert (= (and b!864801 res!587666) b!864790))

(assert (= (and b!864790 res!587664) b!864799))

(assert (= (and b!864799 res!587660) b!864787))

(assert (= (and b!864787 (not res!587661)) b!864796))

(assert (= (and b!864796 c!92162) b!864792))

(assert (= (and b!864796 (not c!92162)) b!864798))

(assert (= (and b!864796 (not res!587669)) b!864797))

(assert (= (and b!864791 condMapEmpty!26810) mapIsEmpty!26810))

(assert (= (and b!864791 (not condMapEmpty!26810)) mapNonEmpty!26810))

(get-info :version)

(assert (= (and mapNonEmpty!26810 ((_ is ValueCellFull!7964) mapValue!26810)) b!864786))

(assert (= (and b!864791 ((_ is ValueCellFull!7964) mapDefault!26810)) b!864788))

(assert (= start!73738 b!864791))

(declare-fun b_lambda!12005 () Bool)

(assert (=> (not b_lambda!12005) (not b!864796)))

(declare-fun t!23932 () Bool)

(declare-fun tb!4785 () Bool)

(assert (=> (and start!73738 (= defaultEntry!696 defaultEntry!696) t!23932) tb!4785))

(declare-fun result!9189 () Bool)

(assert (=> tb!4785 (= result!9189 tp_is_empty!16807)))

(assert (=> b!864796 t!23932))

(declare-fun b_and!24297 () Bool)

(assert (= b_and!24295 (and (=> t!23932 result!9189) b_and!24297)))

(declare-fun m!805701 () Bool)

(assert (=> b!864797 m!805701))

(assert (=> b!864797 m!805701))

(declare-fun m!805703 () Bool)

(assert (=> b!864797 m!805703))

(declare-fun m!805705 () Bool)

(assert (=> b!864797 m!805705))

(assert (=> b!864797 m!805705))

(declare-fun m!805707 () Bool)

(assert (=> b!864797 m!805707))

(declare-fun m!805709 () Bool)

(assert (=> b!864801 m!805709))

(declare-fun m!805711 () Bool)

(assert (=> b!864792 m!805711))

(declare-fun m!805713 () Bool)

(assert (=> b!864792 m!805713))

(declare-fun m!805715 () Bool)

(assert (=> b!864792 m!805715))

(declare-fun m!805717 () Bool)

(assert (=> b!864792 m!805717))

(declare-fun m!805719 () Bool)

(assert (=> b!864792 m!805719))

(declare-fun m!805721 () Bool)

(assert (=> mapNonEmpty!26810 m!805721))

(declare-fun m!805723 () Bool)

(assert (=> b!864787 m!805723))

(declare-fun m!805725 () Bool)

(assert (=> b!864787 m!805725))

(assert (=> b!864787 m!805705))

(declare-fun m!805727 () Bool)

(assert (=> b!864787 m!805727))

(assert (=> b!864787 m!805705))

(declare-fun m!805729 () Bool)

(assert (=> b!864787 m!805729))

(declare-fun m!805731 () Bool)

(assert (=> b!864787 m!805731))

(declare-fun m!805733 () Bool)

(assert (=> b!864796 m!805733))

(declare-fun m!805735 () Bool)

(assert (=> b!864796 m!805735))

(declare-fun m!805737 () Bool)

(assert (=> b!864796 m!805737))

(declare-fun m!805739 () Bool)

(assert (=> b!864796 m!805739))

(assert (=> b!864796 m!805735))

(assert (=> b!864796 m!805705))

(assert (=> b!864796 m!805737))

(declare-fun m!805741 () Bool)

(assert (=> b!864790 m!805741))

(declare-fun m!805743 () Bool)

(assert (=> start!73738 m!805743))

(declare-fun m!805745 () Bool)

(assert (=> start!73738 m!805745))

(declare-fun m!805747 () Bool)

(assert (=> b!864794 m!805747))

(declare-fun m!805749 () Bool)

(assert (=> b!864793 m!805749))

(declare-fun m!805751 () Bool)

(assert (=> b!864800 m!805751))

(declare-fun m!805753 () Bool)

(assert (=> b!864799 m!805753))

(declare-fun m!805755 () Bool)

(assert (=> b!864799 m!805755))

(declare-fun m!805757 () Bool)

(assert (=> b!864799 m!805757))

(check-sat (not b!864794) (not b!864792) (not b_lambda!12005) (not b!864787) (not b_next!14671) (not b!864797) (not b!864793) (not b!864796) (not mapNonEmpty!26810) (not b!864800) b_and!24297 (not b!864799) (not b!864801) tp_is_empty!16807 (not start!73738))
(check-sat b_and!24297 (not b_next!14671))
