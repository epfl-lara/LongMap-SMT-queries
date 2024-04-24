; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73816 () Bool)

(assert start!73816)

(declare-fun b_free!14563 () Bool)

(declare-fun b_next!14563 () Bool)

(assert (=> start!73816 (= b_free!14563 (not b_next!14563))))

(declare-fun tp!51194 () Bool)

(declare-fun b_and!24115 () Bool)

(assert (=> start!73816 (= tp!51194 b_and!24115)))

(declare-fun b!863228 () Bool)

(declare-datatypes ((Unit!29444 0))(
  ( (Unit!29445) )
))
(declare-fun e!481008 () Unit!29444)

(declare-fun Unit!29446 () Unit!29444)

(assert (=> b!863228 (= e!481008 Unit!29446)))

(declare-fun res!586341 () Bool)

(declare-fun e!481013 () Bool)

(assert (=> start!73816 (=> (not res!586341) (not e!481013))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49619 0))(
  ( (array!49620 (arr!23836 (Array (_ BitVec 32) (_ BitVec 64))) (size!24277 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49619)

(assert (=> start!73816 (= res!586341 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24277 _keys!868))))))

(assert (=> start!73816 e!481013))

(declare-fun tp_is_empty!16699 () Bool)

(assert (=> start!73816 tp_is_empty!16699))

(assert (=> start!73816 true))

(assert (=> start!73816 tp!51194))

(declare-fun array_inv!18910 (array!49619) Bool)

(assert (=> start!73816 (array_inv!18910 _keys!868)))

(declare-datatypes ((V!27313 0))(
  ( (V!27314 (val!8397 Int)) )
))
(declare-datatypes ((ValueCell!7910 0))(
  ( (ValueCellFull!7910 (v!10822 V!27313)) (EmptyCell!7910) )
))
(declare-datatypes ((array!49621 0))(
  ( (array!49622 (arr!23837 (Array (_ BitVec 32) ValueCell!7910)) (size!24278 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49621)

(declare-fun e!481012 () Bool)

(declare-fun array_inv!18911 (array!49621) Bool)

(assert (=> start!73816 (and (array_inv!18911 _values!688) e!481012)))

(declare-fun b!863229 () Bool)

(declare-fun e!481014 () Bool)

(assert (=> b!863229 (= e!481014 tp_is_empty!16699)))

(declare-fun b!863230 () Bool)

(declare-fun e!481010 () Bool)

(declare-fun e!481007 () Bool)

(assert (=> b!863230 (= e!481010 e!481007)))

(declare-fun res!586333 () Bool)

(assert (=> b!863230 (=> res!586333 e!481007)))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!863230 (= res!586333 (= k0!854 (select (arr!23836 _keys!868) from!1053)))))

(assert (=> b!863230 (not (= (select (arr!23836 _keys!868) from!1053) k0!854))))

(declare-fun lt!389532 () Unit!29444)

(assert (=> b!863230 (= lt!389532 e!481008)))

(declare-fun c!92347 () Bool)

(assert (=> b!863230 (= c!92347 (= (select (arr!23836 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11032 0))(
  ( (tuple2!11033 (_1!5527 (_ BitVec 64)) (_2!5527 V!27313)) )
))
(declare-datatypes ((List!16869 0))(
  ( (Nil!16866) (Cons!16865 (h!18002 tuple2!11032) (t!23690 List!16869)) )
))
(declare-datatypes ((ListLongMap!9803 0))(
  ( (ListLongMap!9804 (toList!4917 List!16869)) )
))
(declare-fun lt!389530 () ListLongMap!9803)

(declare-fun lt!389529 () ListLongMap!9803)

(assert (=> b!863230 (= lt!389530 lt!389529)))

(declare-fun lt!389527 () ListLongMap!9803)

(declare-fun lt!389533 () tuple2!11032)

(declare-fun +!2321 (ListLongMap!9803 tuple2!11032) ListLongMap!9803)

(assert (=> b!863230 (= lt!389529 (+!2321 lt!389527 lt!389533))))

(declare-fun lt!389523 () V!27313)

(assert (=> b!863230 (= lt!389533 (tuple2!11033 (select (arr!23836 _keys!868) from!1053) lt!389523))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12587 (ValueCell!7910 V!27313) V!27313)

(declare-fun dynLambda!1149 (Int (_ BitVec 64)) V!27313)

(assert (=> b!863230 (= lt!389523 (get!12587 (select (arr!23837 _values!688) from!1053) (dynLambda!1149 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863231 () Bool)

(declare-fun e!481015 () Bool)

(assert (=> b!863231 (= e!481015 tp_is_empty!16699)))

(declare-fun b!863232 () Bool)

(declare-fun res!586334 () Bool)

(assert (=> b!863232 (=> (not res!586334) (not e!481013))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49619 (_ BitVec 32)) Bool)

(assert (=> b!863232 (= res!586334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863233 () Bool)

(declare-fun res!586335 () Bool)

(assert (=> b!863233 (=> (not res!586335) (not e!481013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863233 (= res!586335 (validMask!0 mask!1196))))

(declare-fun b!863234 () Bool)

(declare-fun res!586342 () Bool)

(assert (=> b!863234 (=> (not res!586342) (not e!481013))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863234 (= res!586342 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24277 _keys!868))))))

(declare-fun b!863235 () Bool)

(declare-fun res!586332 () Bool)

(assert (=> b!863235 (=> (not res!586332) (not e!481013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863235 (= res!586332 (validKeyInArray!0 k0!854))))

(declare-fun b!863236 () Bool)

(declare-fun mapRes!26648 () Bool)

(assert (=> b!863236 (= e!481012 (and e!481014 mapRes!26648))))

(declare-fun condMapEmpty!26648 () Bool)

(declare-fun mapDefault!26648 () ValueCell!7910)

(assert (=> b!863236 (= condMapEmpty!26648 (= (arr!23837 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7910)) mapDefault!26648)))))

(declare-fun b!863237 () Bool)

(declare-fun res!586340 () Bool)

(assert (=> b!863237 (=> (not res!586340) (not e!481013))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!863237 (= res!586340 (and (= (size!24278 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24277 _keys!868) (size!24278 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863238 () Bool)

(declare-fun e!481011 () Bool)

(assert (=> b!863238 (= e!481011 (not e!481010))))

(declare-fun res!586339 () Bool)

(assert (=> b!863238 (=> res!586339 e!481010)))

(assert (=> b!863238 (= res!586339 (not (validKeyInArray!0 (select (arr!23836 _keys!868) from!1053))))))

(declare-fun lt!389536 () ListLongMap!9803)

(assert (=> b!863238 (= lt!389536 lt!389527)))

(declare-fun lt!389522 () ListLongMap!9803)

(declare-fun lt!389525 () tuple2!11032)

(assert (=> b!863238 (= lt!389527 (+!2321 lt!389522 lt!389525))))

(declare-fun lt!389534 () array!49621)

(declare-fun minValue!654 () V!27313)

(declare-fun zeroValue!654 () V!27313)

(declare-fun getCurrentListMapNoExtraKeys!2968 (array!49619 array!49621 (_ BitVec 32) (_ BitVec 32) V!27313 V!27313 (_ BitVec 32) Int) ListLongMap!9803)

(assert (=> b!863238 (= lt!389536 (getCurrentListMapNoExtraKeys!2968 _keys!868 lt!389534 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27313)

(assert (=> b!863238 (= lt!389525 (tuple2!11033 k0!854 v!557))))

(assert (=> b!863238 (= lt!389522 (getCurrentListMapNoExtraKeys!2968 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389537 () Unit!29444)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!508 (array!49619 array!49621 (_ BitVec 32) (_ BitVec 32) V!27313 V!27313 (_ BitVec 32) (_ BitVec 64) V!27313 (_ BitVec 32) Int) Unit!29444)

(assert (=> b!863238 (= lt!389537 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!508 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863239 () Bool)

(assert (=> b!863239 (= e!481013 e!481011)))

(declare-fun res!586338 () Bool)

(assert (=> b!863239 (=> (not res!586338) (not e!481011))))

(assert (=> b!863239 (= res!586338 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!863239 (= lt!389530 (getCurrentListMapNoExtraKeys!2968 _keys!868 lt!389534 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863239 (= lt!389534 (array!49622 (store (arr!23837 _values!688) i!612 (ValueCellFull!7910 v!557)) (size!24278 _values!688)))))

(declare-fun lt!389526 () ListLongMap!9803)

(assert (=> b!863239 (= lt!389526 (getCurrentListMapNoExtraKeys!2968 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!863240 () Bool)

(assert (=> b!863240 (= e!481007 true)))

(assert (=> b!863240 (= lt!389529 (+!2321 (+!2321 lt!389522 lt!389533) lt!389525))))

(declare-fun lt!389524 () Unit!29444)

(declare-fun addCommutativeForDiffKeys!475 (ListLongMap!9803 (_ BitVec 64) V!27313 (_ BitVec 64) V!27313) Unit!29444)

(assert (=> b!863240 (= lt!389524 (addCommutativeForDiffKeys!475 lt!389522 k0!854 v!557 (select (arr!23836 _keys!868) from!1053) lt!389523))))

(declare-fun b!863241 () Bool)

(declare-fun res!586336 () Bool)

(assert (=> b!863241 (=> (not res!586336) (not e!481013))))

(assert (=> b!863241 (= res!586336 (and (= (select (arr!23836 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26648 () Bool)

(declare-fun tp!51193 () Bool)

(assert (=> mapNonEmpty!26648 (= mapRes!26648 (and tp!51193 e!481015))))

(declare-fun mapKey!26648 () (_ BitVec 32))

(declare-fun mapValue!26648 () ValueCell!7910)

(declare-fun mapRest!26648 () (Array (_ BitVec 32) ValueCell!7910))

(assert (=> mapNonEmpty!26648 (= (arr!23837 _values!688) (store mapRest!26648 mapKey!26648 mapValue!26648))))

(declare-fun b!863242 () Bool)

(declare-fun Unit!29447 () Unit!29444)

(assert (=> b!863242 (= e!481008 Unit!29447)))

(declare-fun lt!389528 () Unit!29444)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49619 (_ BitVec 32) (_ BitVec 32)) Unit!29444)

(assert (=> b!863242 (= lt!389528 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16870 0))(
  ( (Nil!16867) (Cons!16866 (h!18003 (_ BitVec 64)) (t!23691 List!16870)) )
))
(declare-fun arrayNoDuplicates!0 (array!49619 (_ BitVec 32) List!16870) Bool)

(assert (=> b!863242 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16867)))

(declare-fun lt!389531 () Unit!29444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49619 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29444)

(assert (=> b!863242 (= lt!389531 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863242 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389535 () Unit!29444)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49619 (_ BitVec 64) (_ BitVec 32) List!16870) Unit!29444)

(assert (=> b!863242 (= lt!389535 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16867))))

(assert (=> b!863242 false))

(declare-fun mapIsEmpty!26648 () Bool)

(assert (=> mapIsEmpty!26648 mapRes!26648))

(declare-fun b!863243 () Bool)

(declare-fun res!586337 () Bool)

(assert (=> b!863243 (=> (not res!586337) (not e!481013))))

(assert (=> b!863243 (= res!586337 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16867))))

(assert (= (and start!73816 res!586341) b!863233))

(assert (= (and b!863233 res!586335) b!863237))

(assert (= (and b!863237 res!586340) b!863232))

(assert (= (and b!863232 res!586334) b!863243))

(assert (= (and b!863243 res!586337) b!863234))

(assert (= (and b!863234 res!586342) b!863235))

(assert (= (and b!863235 res!586332) b!863241))

(assert (= (and b!863241 res!586336) b!863239))

(assert (= (and b!863239 res!586338) b!863238))

(assert (= (and b!863238 (not res!586339)) b!863230))

(assert (= (and b!863230 c!92347) b!863242))

(assert (= (and b!863230 (not c!92347)) b!863228))

(assert (= (and b!863230 (not res!586333)) b!863240))

(assert (= (and b!863236 condMapEmpty!26648) mapIsEmpty!26648))

(assert (= (and b!863236 (not condMapEmpty!26648)) mapNonEmpty!26648))

(get-info :version)

(assert (= (and mapNonEmpty!26648 ((_ is ValueCellFull!7910) mapValue!26648)) b!863231))

(assert (= (and b!863236 ((_ is ValueCellFull!7910) mapDefault!26648)) b!863229))

(assert (= start!73816 b!863236))

(declare-fun b_lambda!11929 () Bool)

(assert (=> (not b_lambda!11929) (not b!863230)))

(declare-fun t!23689 () Bool)

(declare-fun tb!4677 () Bool)

(assert (=> (and start!73816 (= defaultEntry!696 defaultEntry!696) t!23689) tb!4677))

(declare-fun result!8973 () Bool)

(assert (=> tb!4677 (= result!8973 tp_is_empty!16699)))

(assert (=> b!863230 t!23689))

(declare-fun b_and!24117 () Bool)

(assert (= b_and!24115 (and (=> t!23689 result!8973) b_and!24117)))

(declare-fun m!804617 () Bool)

(assert (=> b!863232 m!804617))

(declare-fun m!804619 () Bool)

(assert (=> b!863239 m!804619))

(declare-fun m!804621 () Bool)

(assert (=> b!863239 m!804621))

(declare-fun m!804623 () Bool)

(assert (=> b!863239 m!804623))

(declare-fun m!804625 () Bool)

(assert (=> b!863235 m!804625))

(declare-fun m!804627 () Bool)

(assert (=> b!863240 m!804627))

(assert (=> b!863240 m!804627))

(declare-fun m!804629 () Bool)

(assert (=> b!863240 m!804629))

(declare-fun m!804631 () Bool)

(assert (=> b!863240 m!804631))

(assert (=> b!863240 m!804631))

(declare-fun m!804633 () Bool)

(assert (=> b!863240 m!804633))

(declare-fun m!804635 () Bool)

(assert (=> b!863238 m!804635))

(declare-fun m!804637 () Bool)

(assert (=> b!863238 m!804637))

(assert (=> b!863238 m!804631))

(declare-fun m!804639 () Bool)

(assert (=> b!863238 m!804639))

(assert (=> b!863238 m!804631))

(declare-fun m!804641 () Bool)

(assert (=> b!863238 m!804641))

(declare-fun m!804643 () Bool)

(assert (=> b!863238 m!804643))

(declare-fun m!804645 () Bool)

(assert (=> b!863243 m!804645))

(declare-fun m!804647 () Bool)

(assert (=> b!863230 m!804647))

(declare-fun m!804649 () Bool)

(assert (=> b!863230 m!804649))

(declare-fun m!804651 () Bool)

(assert (=> b!863230 m!804651))

(declare-fun m!804653 () Bool)

(assert (=> b!863230 m!804653))

(assert (=> b!863230 m!804649))

(assert (=> b!863230 m!804631))

(assert (=> b!863230 m!804651))

(declare-fun m!804655 () Bool)

(assert (=> mapNonEmpty!26648 m!804655))

(declare-fun m!804657 () Bool)

(assert (=> b!863241 m!804657))

(declare-fun m!804659 () Bool)

(assert (=> b!863242 m!804659))

(declare-fun m!804661 () Bool)

(assert (=> b!863242 m!804661))

(declare-fun m!804663 () Bool)

(assert (=> b!863242 m!804663))

(declare-fun m!804665 () Bool)

(assert (=> b!863242 m!804665))

(declare-fun m!804667 () Bool)

(assert (=> b!863242 m!804667))

(declare-fun m!804669 () Bool)

(assert (=> start!73816 m!804669))

(declare-fun m!804671 () Bool)

(assert (=> start!73816 m!804671))

(declare-fun m!804673 () Bool)

(assert (=> b!863233 m!804673))

(check-sat (not b_next!14563) (not b!863232) (not b!863230) (not mapNonEmpty!26648) (not b!863235) (not b!863242) (not b!863233) b_and!24117 (not b!863240) tp_is_empty!16699 (not b!863238) (not b!863239) (not start!73816) (not b!863243) (not b_lambda!11929))
(check-sat b_and!24117 (not b_next!14563))
