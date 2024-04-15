; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73768 () Bool)

(assert start!73768)

(declare-fun b_free!14701 () Bool)

(declare-fun b_next!14701 () Bool)

(assert (=> start!73768 (= b_free!14701 (not b_next!14701))))

(declare-fun tp!51608 () Bool)

(declare-fun b_and!24355 () Bool)

(assert (=> start!73768 (= tp!51608 b_and!24355)))

(declare-fun b!865536 () Bool)

(declare-fun e!482142 () Bool)

(assert (=> b!865536 (= e!482142 true)))

(declare-datatypes ((V!27497 0))(
  ( (V!27498 (val!8466 Int)) )
))
(declare-datatypes ((tuple2!11242 0))(
  ( (tuple2!11243 (_1!5632 (_ BitVec 64)) (_2!5632 V!27497)) )
))
(declare-fun lt!392241 () tuple2!11242)

(declare-datatypes ((List!17030 0))(
  ( (Nil!17027) (Cons!17026 (h!18157 tuple2!11242) (t!23988 List!17030)) )
))
(declare-datatypes ((ListLongMap!10001 0))(
  ( (ListLongMap!10002 (toList!5016 List!17030)) )
))
(declare-fun lt!392244 () ListLongMap!10001)

(declare-fun lt!392238 () tuple2!11242)

(declare-fun lt!392248 () ListLongMap!10001)

(declare-fun +!2384 (ListLongMap!10001 tuple2!11242) ListLongMap!10001)

(assert (=> b!865536 (= lt!392244 (+!2384 (+!2384 lt!392248 lt!392241) lt!392238))))

(declare-fun v!557 () V!27497)

(declare-datatypes ((array!49827 0))(
  ( (array!49828 (arr!23945 (Array (_ BitVec 32) (_ BitVec 64))) (size!24387 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49827)

(declare-fun lt!392246 () V!27497)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((Unit!29588 0))(
  ( (Unit!29589) )
))
(declare-fun lt!392250 () Unit!29588)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!522 (ListLongMap!10001 (_ BitVec 64) V!27497 (_ BitVec 64) V!27497) Unit!29588)

(assert (=> b!865536 (= lt!392250 (addCommutativeForDiffKeys!522 lt!392248 k0!854 v!557 (select (arr!23945 _keys!868) from!1053) lt!392246))))

(declare-fun b!865537 () Bool)

(declare-fun e!482141 () Bool)

(declare-fun e!482145 () Bool)

(declare-fun mapRes!26855 () Bool)

(assert (=> b!865537 (= e!482141 (and e!482145 mapRes!26855))))

(declare-fun condMapEmpty!26855 () Bool)

(declare-datatypes ((ValueCell!7979 0))(
  ( (ValueCellFull!7979 (v!10885 V!27497)) (EmptyCell!7979) )
))
(declare-datatypes ((array!49829 0))(
  ( (array!49830 (arr!23946 (Array (_ BitVec 32) ValueCell!7979)) (size!24388 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49829)

(declare-fun mapDefault!26855 () ValueCell!7979)

(assert (=> b!865537 (= condMapEmpty!26855 (= (arr!23946 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7979)) mapDefault!26855)))))

(declare-fun b!865538 () Bool)

(declare-fun res!588155 () Bool)

(declare-fun e!482147 () Bool)

(assert (=> b!865538 (=> (not res!588155) (not e!482147))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865538 (= res!588155 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24387 _keys!868))))))

(declare-fun b!865539 () Bool)

(declare-fun e!482140 () Bool)

(assert (=> b!865539 (= e!482140 e!482142)))

(declare-fun res!588158 () Bool)

(assert (=> b!865539 (=> res!588158 e!482142)))

(assert (=> b!865539 (= res!588158 (= k0!854 (select (arr!23945 _keys!868) from!1053)))))

(assert (=> b!865539 (not (= (select (arr!23945 _keys!868) from!1053) k0!854))))

(declare-fun lt!392239 () Unit!29588)

(declare-fun e!482144 () Unit!29588)

(assert (=> b!865539 (= lt!392239 e!482144)))

(declare-fun c!92207 () Bool)

(assert (=> b!865539 (= c!92207 (= (select (arr!23945 _keys!868) from!1053) k0!854))))

(declare-fun lt!392237 () ListLongMap!10001)

(assert (=> b!865539 (= lt!392237 lt!392244)))

(declare-fun lt!392245 () ListLongMap!10001)

(assert (=> b!865539 (= lt!392244 (+!2384 lt!392245 lt!392241))))

(assert (=> b!865539 (= lt!392241 (tuple2!11243 (select (arr!23945 _keys!868) from!1053) lt!392246))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12662 (ValueCell!7979 V!27497) V!27497)

(declare-fun dynLambda!1181 (Int (_ BitVec 64)) V!27497)

(assert (=> b!865539 (= lt!392246 (get!12662 (select (arr!23946 _values!688) from!1053) (dynLambda!1181 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865540 () Bool)

(declare-fun res!588162 () Bool)

(assert (=> b!865540 (=> (not res!588162) (not e!482147))))

(assert (=> b!865540 (= res!588162 (and (= (select (arr!23945 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865541 () Bool)

(declare-fun e!482148 () Bool)

(declare-fun tp_is_empty!16837 () Bool)

(assert (=> b!865541 (= e!482148 tp_is_empty!16837)))

(declare-fun b!865542 () Bool)

(declare-fun Unit!29590 () Unit!29588)

(assert (=> b!865542 (= e!482144 Unit!29590)))

(declare-fun b!865543 () Bool)

(declare-fun res!588164 () Bool)

(assert (=> b!865543 (=> (not res!588164) (not e!482147))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!865543 (= res!588164 (and (= (size!24388 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24387 _keys!868) (size!24388 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!865544 () Bool)

(declare-fun e!482143 () Bool)

(assert (=> b!865544 (= e!482147 e!482143)))

(declare-fun res!588157 () Bool)

(assert (=> b!865544 (=> (not res!588157) (not e!482143))))

(assert (=> b!865544 (= res!588157 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392243 () array!49829)

(declare-fun minValue!654 () V!27497)

(declare-fun zeroValue!654 () V!27497)

(declare-fun getCurrentListMapNoExtraKeys!3012 (array!49827 array!49829 (_ BitVec 32) (_ BitVec 32) V!27497 V!27497 (_ BitVec 32) Int) ListLongMap!10001)

(assert (=> b!865544 (= lt!392237 (getCurrentListMapNoExtraKeys!3012 _keys!868 lt!392243 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865544 (= lt!392243 (array!49830 (store (arr!23946 _values!688) i!612 (ValueCellFull!7979 v!557)) (size!24388 _values!688)))))

(declare-fun lt!392251 () ListLongMap!10001)

(assert (=> b!865544 (= lt!392251 (getCurrentListMapNoExtraKeys!3012 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865545 () Bool)

(assert (=> b!865545 (= e!482143 (not e!482140))))

(declare-fun res!588163 () Bool)

(assert (=> b!865545 (=> res!588163 e!482140)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865545 (= res!588163 (not (validKeyInArray!0 (select (arr!23945 _keys!868) from!1053))))))

(declare-fun lt!392242 () ListLongMap!10001)

(assert (=> b!865545 (= lt!392242 lt!392245)))

(assert (=> b!865545 (= lt!392245 (+!2384 lt!392248 lt!392238))))

(assert (=> b!865545 (= lt!392242 (getCurrentListMapNoExtraKeys!3012 _keys!868 lt!392243 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865545 (= lt!392238 (tuple2!11243 k0!854 v!557))))

(assert (=> b!865545 (= lt!392248 (getCurrentListMapNoExtraKeys!3012 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392252 () Unit!29588)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!557 (array!49827 array!49829 (_ BitVec 32) (_ BitVec 32) V!27497 V!27497 (_ BitVec 32) (_ BitVec 64) V!27497 (_ BitVec 32) Int) Unit!29588)

(assert (=> b!865545 (= lt!392252 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!557 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865546 () Bool)

(declare-fun res!588165 () Bool)

(assert (=> b!865546 (=> (not res!588165) (not e!482147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49827 (_ BitVec 32)) Bool)

(assert (=> b!865546 (= res!588165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865547 () Bool)

(declare-fun Unit!29591 () Unit!29588)

(assert (=> b!865547 (= e!482144 Unit!29591)))

(declare-fun lt!392247 () Unit!29588)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49827 (_ BitVec 32) (_ BitVec 32)) Unit!29588)

(assert (=> b!865547 (= lt!392247 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17031 0))(
  ( (Nil!17028) (Cons!17027 (h!18158 (_ BitVec 64)) (t!23989 List!17031)) )
))
(declare-fun arrayNoDuplicates!0 (array!49827 (_ BitVec 32) List!17031) Bool)

(assert (=> b!865547 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17028)))

(declare-fun lt!392240 () Unit!29588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49827 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29588)

(assert (=> b!865547 (= lt!392240 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865547 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392249 () Unit!29588)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49827 (_ BitVec 64) (_ BitVec 32) List!17031) Unit!29588)

(assert (=> b!865547 (= lt!392249 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17028))))

(assert (=> b!865547 false))

(declare-fun b!865548 () Bool)

(declare-fun res!588161 () Bool)

(assert (=> b!865548 (=> (not res!588161) (not e!482147))))

(assert (=> b!865548 (= res!588161 (validKeyInArray!0 k0!854))))

(declare-fun res!588160 () Bool)

(assert (=> start!73768 (=> (not res!588160) (not e!482147))))

(assert (=> start!73768 (= res!588160 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24387 _keys!868))))))

(assert (=> start!73768 e!482147))

(assert (=> start!73768 tp_is_empty!16837))

(assert (=> start!73768 true))

(assert (=> start!73768 tp!51608))

(declare-fun array_inv!19002 (array!49827) Bool)

(assert (=> start!73768 (array_inv!19002 _keys!868)))

(declare-fun array_inv!19003 (array!49829) Bool)

(assert (=> start!73768 (and (array_inv!19003 _values!688) e!482141)))

(declare-fun mapNonEmpty!26855 () Bool)

(declare-fun tp!51607 () Bool)

(assert (=> mapNonEmpty!26855 (= mapRes!26855 (and tp!51607 e!482148))))

(declare-fun mapValue!26855 () ValueCell!7979)

(declare-fun mapKey!26855 () (_ BitVec 32))

(declare-fun mapRest!26855 () (Array (_ BitVec 32) ValueCell!7979))

(assert (=> mapNonEmpty!26855 (= (arr!23946 _values!688) (store mapRest!26855 mapKey!26855 mapValue!26855))))

(declare-fun b!865549 () Bool)

(declare-fun res!588156 () Bool)

(assert (=> b!865549 (=> (not res!588156) (not e!482147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865549 (= res!588156 (validMask!0 mask!1196))))

(declare-fun b!865550 () Bool)

(assert (=> b!865550 (= e!482145 tp_is_empty!16837)))

(declare-fun mapIsEmpty!26855 () Bool)

(assert (=> mapIsEmpty!26855 mapRes!26855))

(declare-fun b!865551 () Bool)

(declare-fun res!588159 () Bool)

(assert (=> b!865551 (=> (not res!588159) (not e!482147))))

(assert (=> b!865551 (= res!588159 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17028))))

(assert (= (and start!73768 res!588160) b!865549))

(assert (= (and b!865549 res!588156) b!865543))

(assert (= (and b!865543 res!588164) b!865546))

(assert (= (and b!865546 res!588165) b!865551))

(assert (= (and b!865551 res!588159) b!865538))

(assert (= (and b!865538 res!588155) b!865548))

(assert (= (and b!865548 res!588161) b!865540))

(assert (= (and b!865540 res!588162) b!865544))

(assert (= (and b!865544 res!588157) b!865545))

(assert (= (and b!865545 (not res!588163)) b!865539))

(assert (= (and b!865539 c!92207) b!865547))

(assert (= (and b!865539 (not c!92207)) b!865542))

(assert (= (and b!865539 (not res!588158)) b!865536))

(assert (= (and b!865537 condMapEmpty!26855) mapIsEmpty!26855))

(assert (= (and b!865537 (not condMapEmpty!26855)) mapNonEmpty!26855))

(get-info :version)

(assert (= (and mapNonEmpty!26855 ((_ is ValueCellFull!7979) mapValue!26855)) b!865541))

(assert (= (and b!865537 ((_ is ValueCellFull!7979) mapDefault!26855)) b!865550))

(assert (= start!73768 b!865537))

(declare-fun b_lambda!12035 () Bool)

(assert (=> (not b_lambda!12035) (not b!865539)))

(declare-fun t!23987 () Bool)

(declare-fun tb!4815 () Bool)

(assert (=> (and start!73768 (= defaultEntry!696 defaultEntry!696) t!23987) tb!4815))

(declare-fun result!9249 () Bool)

(assert (=> tb!4815 (= result!9249 tp_is_empty!16837)))

(assert (=> b!865539 t!23987))

(declare-fun b_and!24357 () Bool)

(assert (= b_and!24355 (and (=> t!23987 result!9249) b_and!24357)))

(declare-fun m!806571 () Bool)

(assert (=> b!865548 m!806571))

(declare-fun m!806573 () Bool)

(assert (=> start!73768 m!806573))

(declare-fun m!806575 () Bool)

(assert (=> start!73768 m!806575))

(declare-fun m!806577 () Bool)

(assert (=> b!865539 m!806577))

(declare-fun m!806579 () Bool)

(assert (=> b!865539 m!806579))

(declare-fun m!806581 () Bool)

(assert (=> b!865539 m!806581))

(declare-fun m!806583 () Bool)

(assert (=> b!865539 m!806583))

(assert (=> b!865539 m!806579))

(declare-fun m!806585 () Bool)

(assert (=> b!865539 m!806585))

(assert (=> b!865539 m!806581))

(declare-fun m!806587 () Bool)

(assert (=> b!865546 m!806587))

(declare-fun m!806589 () Bool)

(assert (=> b!865540 m!806589))

(declare-fun m!806591 () Bool)

(assert (=> mapNonEmpty!26855 m!806591))

(declare-fun m!806593 () Bool)

(assert (=> b!865547 m!806593))

(declare-fun m!806595 () Bool)

(assert (=> b!865547 m!806595))

(declare-fun m!806597 () Bool)

(assert (=> b!865547 m!806597))

(declare-fun m!806599 () Bool)

(assert (=> b!865547 m!806599))

(declare-fun m!806601 () Bool)

(assert (=> b!865547 m!806601))

(assert (=> b!865545 m!806585))

(declare-fun m!806603 () Bool)

(assert (=> b!865545 m!806603))

(assert (=> b!865545 m!806585))

(declare-fun m!806605 () Bool)

(assert (=> b!865545 m!806605))

(declare-fun m!806607 () Bool)

(assert (=> b!865545 m!806607))

(declare-fun m!806609 () Bool)

(assert (=> b!865545 m!806609))

(declare-fun m!806611 () Bool)

(assert (=> b!865545 m!806611))

(declare-fun m!806613 () Bool)

(assert (=> b!865536 m!806613))

(assert (=> b!865536 m!806613))

(declare-fun m!806615 () Bool)

(assert (=> b!865536 m!806615))

(assert (=> b!865536 m!806585))

(assert (=> b!865536 m!806585))

(declare-fun m!806617 () Bool)

(assert (=> b!865536 m!806617))

(declare-fun m!806619 () Bool)

(assert (=> b!865549 m!806619))

(declare-fun m!806621 () Bool)

(assert (=> b!865544 m!806621))

(declare-fun m!806623 () Bool)

(assert (=> b!865544 m!806623))

(declare-fun m!806625 () Bool)

(assert (=> b!865544 m!806625))

(declare-fun m!806627 () Bool)

(assert (=> b!865551 m!806627))

(check-sat (not b!865536) (not b_next!14701) (not b!865549) (not b!865539) (not b!865545) (not b!865547) tp_is_empty!16837 (not b_lambda!12035) (not b!865548) (not mapNonEmpty!26855) (not b!865544) (not b!865551) (not b!865546) b_and!24357 (not start!73768))
(check-sat b_and!24357 (not b_next!14701))
