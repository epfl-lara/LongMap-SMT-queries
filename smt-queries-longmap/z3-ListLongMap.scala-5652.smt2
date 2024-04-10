; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73698 () Bool)

(assert start!73698)

(declare-fun b_free!14613 () Bool)

(declare-fun b_next!14613 () Bool)

(assert (=> start!73698 (= b_free!14613 (not b_next!14613))))

(declare-fun tp!51343 () Bool)

(declare-fun b_and!24205 () Bool)

(assert (=> start!73698 (= tp!51343 b_and!24205)))

(declare-fun res!586819 () Bool)

(declare-fun e!481100 () Bool)

(assert (=> start!73698 (=> (not res!586819) (not e!481100))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49660 0))(
  ( (array!49661 (arr!23861 (Array (_ BitVec 32) (_ BitVec 64))) (size!24301 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49660)

(assert (=> start!73698 (= res!586819 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24301 _keys!868))))))

(assert (=> start!73698 e!481100))

(declare-fun tp_is_empty!16749 () Bool)

(assert (=> start!73698 tp_is_empty!16749))

(assert (=> start!73698 true))

(assert (=> start!73698 tp!51343))

(declare-fun array_inv!18876 (array!49660) Bool)

(assert (=> start!73698 (array_inv!18876 _keys!868)))

(declare-datatypes ((V!27379 0))(
  ( (V!27380 (val!8422 Int)) )
))
(declare-datatypes ((ValueCell!7935 0))(
  ( (ValueCellFull!7935 (v!10847 V!27379)) (EmptyCell!7935) )
))
(declare-datatypes ((array!49662 0))(
  ( (array!49663 (arr!23862 (Array (_ BitVec 32) ValueCell!7935)) (size!24302 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49662)

(declare-fun e!481101 () Bool)

(declare-fun array_inv!18877 (array!49662) Bool)

(assert (=> start!73698 (and (array_inv!18877 _values!688) e!481101)))

(declare-fun b!863575 () Bool)

(declare-fun e!481108 () Bool)

(declare-fun mapRes!26723 () Bool)

(assert (=> b!863575 (= e!481101 (and e!481108 mapRes!26723))))

(declare-fun condMapEmpty!26723 () Bool)

(declare-fun mapDefault!26723 () ValueCell!7935)

(assert (=> b!863575 (= condMapEmpty!26723 (= (arr!23862 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7935)) mapDefault!26723)))))

(declare-fun b!863576 () Bool)

(declare-fun res!586818 () Bool)

(assert (=> b!863576 (=> (not res!586818) (not e!481100))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!863576 (= res!586818 (and (= (size!24302 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24301 _keys!868) (size!24302 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863577 () Bool)

(declare-fun res!586814 () Bool)

(assert (=> b!863577 (=> (not res!586814) (not e!481100))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!863577 (= res!586814 (and (= (select (arr!23861 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863578 () Bool)

(declare-fun res!586815 () Bool)

(assert (=> b!863578 (=> (not res!586815) (not e!481100))))

(assert (=> b!863578 (= res!586815 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24301 _keys!868))))))

(declare-fun b!863579 () Bool)

(declare-fun e!481107 () Bool)

(assert (=> b!863579 (= e!481107 tp_is_empty!16749)))

(declare-fun mapNonEmpty!26723 () Bool)

(declare-fun tp!51342 () Bool)

(assert (=> mapNonEmpty!26723 (= mapRes!26723 (and tp!51342 e!481107))))

(declare-fun mapRest!26723 () (Array (_ BitVec 32) ValueCell!7935))

(declare-fun mapKey!26723 () (_ BitVec 32))

(declare-fun mapValue!26723 () ValueCell!7935)

(assert (=> mapNonEmpty!26723 (= (arr!23862 _values!688) (store mapRest!26723 mapKey!26723 mapValue!26723))))

(declare-fun b!863580 () Bool)

(declare-fun e!481106 () Bool)

(declare-fun e!481103 () Bool)

(assert (=> b!863580 (= e!481106 e!481103)))

(declare-fun res!586820 () Bool)

(assert (=> b!863580 (=> res!586820 e!481103)))

(assert (=> b!863580 (= res!586820 (= k0!854 (select (arr!23861 _keys!868) from!1053)))))

(assert (=> b!863580 (not (= (select (arr!23861 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29523 0))(
  ( (Unit!29524) )
))
(declare-fun lt!390368 () Unit!29523)

(declare-fun e!481102 () Unit!29523)

(assert (=> b!863580 (= lt!390368 e!481102)))

(declare-fun c!92140 () Bool)

(assert (=> b!863580 (= c!92140 (= (select (arr!23861 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11148 0))(
  ( (tuple2!11149 (_1!5585 (_ BitVec 64)) (_2!5585 V!27379)) )
))
(declare-datatypes ((List!16955 0))(
  ( (Nil!16952) (Cons!16951 (h!18082 tuple2!11148) (t!23834 List!16955)) )
))
(declare-datatypes ((ListLongMap!9917 0))(
  ( (ListLongMap!9918 (toList!4974 List!16955)) )
))
(declare-fun lt!390374 () ListLongMap!9917)

(declare-fun lt!390365 () ListLongMap!9917)

(assert (=> b!863580 (= lt!390374 lt!390365)))

(declare-fun lt!390372 () ListLongMap!9917)

(declare-fun lt!390370 () tuple2!11148)

(declare-fun +!2323 (ListLongMap!9917 tuple2!11148) ListLongMap!9917)

(assert (=> b!863580 (= lt!390365 (+!2323 lt!390372 lt!390370))))

(declare-fun lt!390361 () V!27379)

(assert (=> b!863580 (= lt!390370 (tuple2!11149 (select (arr!23861 _keys!868) from!1053) lt!390361))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12600 (ValueCell!7935 V!27379) V!27379)

(declare-fun dynLambda!1152 (Int (_ BitVec 64)) V!27379)

(assert (=> b!863580 (= lt!390361 (get!12600 (select (arr!23862 _values!688) from!1053) (dynLambda!1152 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863581 () Bool)

(declare-fun e!481105 () Bool)

(assert (=> b!863581 (= e!481100 e!481105)))

(declare-fun res!586816 () Bool)

(assert (=> b!863581 (=> (not res!586816) (not e!481105))))

(assert (=> b!863581 (= res!586816 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!27379)

(declare-fun zeroValue!654 () V!27379)

(declare-fun lt!390364 () array!49662)

(declare-fun getCurrentListMapNoExtraKeys!2949 (array!49660 array!49662 (_ BitVec 32) (_ BitVec 32) V!27379 V!27379 (_ BitVec 32) Int) ListLongMap!9917)

(assert (=> b!863581 (= lt!390374 (getCurrentListMapNoExtraKeys!2949 _keys!868 lt!390364 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27379)

(assert (=> b!863581 (= lt!390364 (array!49663 (store (arr!23862 _values!688) i!612 (ValueCellFull!7935 v!557)) (size!24302 _values!688)))))

(declare-fun lt!390369 () ListLongMap!9917)

(assert (=> b!863581 (= lt!390369 (getCurrentListMapNoExtraKeys!2949 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863582 () Bool)

(declare-fun res!586813 () Bool)

(assert (=> b!863582 (=> (not res!586813) (not e!481100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863582 (= res!586813 (validKeyInArray!0 k0!854))))

(declare-fun b!863583 () Bool)

(declare-fun res!586822 () Bool)

(assert (=> b!863583 (=> (not res!586822) (not e!481100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49660 (_ BitVec 32)) Bool)

(assert (=> b!863583 (= res!586822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26723 () Bool)

(assert (=> mapIsEmpty!26723 mapRes!26723))

(declare-fun b!863584 () Bool)

(declare-fun Unit!29525 () Unit!29523)

(assert (=> b!863584 (= e!481102 Unit!29525)))

(declare-fun b!863585 () Bool)

(assert (=> b!863585 (= e!481108 tp_is_empty!16749)))

(declare-fun b!863586 () Bool)

(declare-fun res!586817 () Bool)

(assert (=> b!863586 (=> (not res!586817) (not e!481100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863586 (= res!586817 (validMask!0 mask!1196))))

(declare-fun b!863587 () Bool)

(declare-fun res!586821 () Bool)

(assert (=> b!863587 (=> (not res!586821) (not e!481100))))

(declare-datatypes ((List!16956 0))(
  ( (Nil!16953) (Cons!16952 (h!18083 (_ BitVec 64)) (t!23835 List!16956)) )
))
(declare-fun arrayNoDuplicates!0 (array!49660 (_ BitVec 32) List!16956) Bool)

(assert (=> b!863587 (= res!586821 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16953))))

(declare-fun b!863588 () Bool)

(assert (=> b!863588 (= e!481103 true)))

(declare-fun lt!390371 () ListLongMap!9917)

(declare-fun lt!390375 () tuple2!11148)

(assert (=> b!863588 (= lt!390365 (+!2323 (+!2323 lt!390371 lt!390370) lt!390375))))

(declare-fun lt!390367 () Unit!29523)

(declare-fun addCommutativeForDiffKeys!496 (ListLongMap!9917 (_ BitVec 64) V!27379 (_ BitVec 64) V!27379) Unit!29523)

(assert (=> b!863588 (= lt!390367 (addCommutativeForDiffKeys!496 lt!390371 k0!854 v!557 (select (arr!23861 _keys!868) from!1053) lt!390361))))

(declare-fun b!863589 () Bool)

(declare-fun Unit!29526 () Unit!29523)

(assert (=> b!863589 (= e!481102 Unit!29526)))

(declare-fun lt!390362 () Unit!29523)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49660 (_ BitVec 32) (_ BitVec 32)) Unit!29523)

(assert (=> b!863589 (= lt!390362 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863589 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16953)))

(declare-fun lt!390363 () Unit!29523)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49660 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29523)

(assert (=> b!863589 (= lt!390363 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863589 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390376 () Unit!29523)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49660 (_ BitVec 64) (_ BitVec 32) List!16956) Unit!29523)

(assert (=> b!863589 (= lt!390376 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16953))))

(assert (=> b!863589 false))

(declare-fun b!863590 () Bool)

(assert (=> b!863590 (= e!481105 (not e!481106))))

(declare-fun res!586823 () Bool)

(assert (=> b!863590 (=> res!586823 e!481106)))

(assert (=> b!863590 (= res!586823 (not (validKeyInArray!0 (select (arr!23861 _keys!868) from!1053))))))

(declare-fun lt!390366 () ListLongMap!9917)

(assert (=> b!863590 (= lt!390366 lt!390372)))

(assert (=> b!863590 (= lt!390372 (+!2323 lt!390371 lt!390375))))

(assert (=> b!863590 (= lt!390366 (getCurrentListMapNoExtraKeys!2949 _keys!868 lt!390364 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!863590 (= lt!390375 (tuple2!11149 k0!854 v!557))))

(assert (=> b!863590 (= lt!390371 (getCurrentListMapNoExtraKeys!2949 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390373 () Unit!29523)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!530 (array!49660 array!49662 (_ BitVec 32) (_ BitVec 32) V!27379 V!27379 (_ BitVec 32) (_ BitVec 64) V!27379 (_ BitVec 32) Int) Unit!29523)

(assert (=> b!863590 (= lt!390373 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!530 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73698 res!586819) b!863586))

(assert (= (and b!863586 res!586817) b!863576))

(assert (= (and b!863576 res!586818) b!863583))

(assert (= (and b!863583 res!586822) b!863587))

(assert (= (and b!863587 res!586821) b!863578))

(assert (= (and b!863578 res!586815) b!863582))

(assert (= (and b!863582 res!586813) b!863577))

(assert (= (and b!863577 res!586814) b!863581))

(assert (= (and b!863581 res!586816) b!863590))

(assert (= (and b!863590 (not res!586823)) b!863580))

(assert (= (and b!863580 c!92140) b!863589))

(assert (= (and b!863580 (not c!92140)) b!863584))

(assert (= (and b!863580 (not res!586820)) b!863588))

(assert (= (and b!863575 condMapEmpty!26723) mapIsEmpty!26723))

(assert (= (and b!863575 (not condMapEmpty!26723)) mapNonEmpty!26723))

(get-info :version)

(assert (= (and mapNonEmpty!26723 ((_ is ValueCellFull!7935) mapValue!26723)) b!863579))

(assert (= (and b!863575 ((_ is ValueCellFull!7935) mapDefault!26723)) b!863585))

(assert (= start!73698 b!863575))

(declare-fun b_lambda!11965 () Bool)

(assert (=> (not b_lambda!11965) (not b!863580)))

(declare-fun t!23833 () Bool)

(declare-fun tb!4735 () Bool)

(assert (=> (and start!73698 (= defaultEntry!696 defaultEntry!696) t!23833) tb!4735))

(declare-fun result!9081 () Bool)

(assert (=> tb!4735 (= result!9081 tp_is_empty!16749)))

(assert (=> b!863580 t!23833))

(declare-fun b_and!24207 () Bool)

(assert (= b_and!24205 (and (=> t!23833 result!9081) b_and!24207)))

(declare-fun m!804777 () Bool)

(assert (=> b!863583 m!804777))

(declare-fun m!804779 () Bool)

(assert (=> b!863590 m!804779))

(declare-fun m!804781 () Bool)

(assert (=> b!863590 m!804781))

(declare-fun m!804783 () Bool)

(assert (=> b!863590 m!804783))

(assert (=> b!863590 m!804781))

(declare-fun m!804785 () Bool)

(assert (=> b!863590 m!804785))

(declare-fun m!804787 () Bool)

(assert (=> b!863590 m!804787))

(declare-fun m!804789 () Bool)

(assert (=> b!863590 m!804789))

(declare-fun m!804791 () Bool)

(assert (=> b!863586 m!804791))

(declare-fun m!804793 () Bool)

(assert (=> b!863577 m!804793))

(declare-fun m!804795 () Bool)

(assert (=> b!863589 m!804795))

(declare-fun m!804797 () Bool)

(assert (=> b!863589 m!804797))

(declare-fun m!804799 () Bool)

(assert (=> b!863589 m!804799))

(declare-fun m!804801 () Bool)

(assert (=> b!863589 m!804801))

(declare-fun m!804803 () Bool)

(assert (=> b!863589 m!804803))

(declare-fun m!804805 () Bool)

(assert (=> b!863587 m!804805))

(declare-fun m!804807 () Bool)

(assert (=> start!73698 m!804807))

(declare-fun m!804809 () Bool)

(assert (=> start!73698 m!804809))

(declare-fun m!804811 () Bool)

(assert (=> b!863580 m!804811))

(declare-fun m!804813 () Bool)

(assert (=> b!863580 m!804813))

(declare-fun m!804815 () Bool)

(assert (=> b!863580 m!804815))

(declare-fun m!804817 () Bool)

(assert (=> b!863580 m!804817))

(assert (=> b!863580 m!804813))

(assert (=> b!863580 m!804781))

(assert (=> b!863580 m!804815))

(declare-fun m!804819 () Bool)

(assert (=> b!863582 m!804819))

(declare-fun m!804821 () Bool)

(assert (=> b!863588 m!804821))

(assert (=> b!863588 m!804821))

(declare-fun m!804823 () Bool)

(assert (=> b!863588 m!804823))

(assert (=> b!863588 m!804781))

(assert (=> b!863588 m!804781))

(declare-fun m!804825 () Bool)

(assert (=> b!863588 m!804825))

(declare-fun m!804827 () Bool)

(assert (=> mapNonEmpty!26723 m!804827))

(declare-fun m!804829 () Bool)

(assert (=> b!863581 m!804829))

(declare-fun m!804831 () Bool)

(assert (=> b!863581 m!804831))

(declare-fun m!804833 () Bool)

(assert (=> b!863581 m!804833))

(check-sat (not b!863581) (not b!863582) tp_is_empty!16749 (not b_lambda!11965) (not b!863580) (not b!863590) (not mapNonEmpty!26723) (not b_next!14613) (not b!863588) (not start!73698) (not b!863589) (not b!863583) (not b!863586) b_and!24207 (not b!863587))
(check-sat b_and!24207 (not b_next!14613))
