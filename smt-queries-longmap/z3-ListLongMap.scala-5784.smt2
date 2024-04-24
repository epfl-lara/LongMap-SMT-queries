; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74794 () Bool)

(assert start!74794)

(declare-fun b_free!15295 () Bool)

(declare-fun b_next!15295 () Bool)

(assert (=> start!74794 (= b_free!15295 (not b_next!15295))))

(declare-fun tp!53570 () Bool)

(declare-fun b_and!25203 () Bool)

(assert (=> start!74794 (= tp!53570 b_and!25203)))

(declare-fun res!597819 () Bool)

(declare-fun e!489998 () Bool)

(assert (=> start!74794 (=> (not res!597819) (not e!489998))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51241 0))(
  ( (array!51242 (arr!24641 (Array (_ BitVec 32) (_ BitVec 64))) (size!25082 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51241)

(assert (=> start!74794 (= res!597819 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25082 _keys!868))))))

(assert (=> start!74794 e!489998))

(declare-fun tp_is_empty!17539 () Bool)

(assert (=> start!74794 tp_is_empty!17539))

(assert (=> start!74794 true))

(assert (=> start!74794 tp!53570))

(declare-fun array_inv!19452 (array!51241) Bool)

(assert (=> start!74794 (array_inv!19452 _keys!868)))

(declare-datatypes ((V!28433 0))(
  ( (V!28434 (val!8817 Int)) )
))
(declare-datatypes ((ValueCell!8330 0))(
  ( (ValueCellFull!8330 (v!11261 V!28433)) (EmptyCell!8330) )
))
(declare-datatypes ((array!51243 0))(
  ( (array!51244 (arr!24642 (Array (_ BitVec 32) ValueCell!8330)) (size!25083 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51243)

(declare-fun e!489997 () Bool)

(declare-fun array_inv!19453 (array!51243) Bool)

(assert (=> start!74794 (and (array_inv!19453 _values!688) e!489997)))

(declare-fun b!880327 () Bool)

(declare-fun res!597816 () Bool)

(assert (=> b!880327 (=> (not res!597816) (not e!489998))))

(declare-datatypes ((List!17432 0))(
  ( (Nil!17429) (Cons!17428 (h!18565 (_ BitVec 64)) (t!24521 List!17432)) )
))
(declare-fun arrayNoDuplicates!0 (array!51241 (_ BitVec 32) List!17432) Bool)

(assert (=> b!880327 (= res!597816 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17429))))

(declare-fun b!880328 () Bool)

(declare-fun e!489996 () Bool)

(assert (=> b!880328 (= e!489996 tp_is_empty!17539)))

(declare-fun b!880329 () Bool)

(declare-fun res!597824 () Bool)

(assert (=> b!880329 (=> (not res!597824) (not e!489998))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880329 (= res!597824 (validKeyInArray!0 k0!854))))

(declare-fun b!880330 () Bool)

(declare-fun res!597823 () Bool)

(assert (=> b!880330 (=> (not res!597823) (not e!489998))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!880330 (= res!597823 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25082 _keys!868))))))

(declare-fun b!880331 () Bool)

(declare-fun res!597825 () Bool)

(assert (=> b!880331 (=> (not res!597825) (not e!489998))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51241 (_ BitVec 32)) Bool)

(assert (=> b!880331 (= res!597825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27927 () Bool)

(declare-fun mapRes!27927 () Bool)

(assert (=> mapIsEmpty!27927 mapRes!27927))

(declare-fun b!880332 () Bool)

(declare-fun e!490000 () Bool)

(assert (=> b!880332 (= e!490000 (bvslt from!1053 (size!25082 _keys!868)))))

(declare-datatypes ((tuple2!11600 0))(
  ( (tuple2!11601 (_1!5811 (_ BitVec 64)) (_2!5811 V!28433)) )
))
(declare-datatypes ((List!17433 0))(
  ( (Nil!17430) (Cons!17429 (h!18566 tuple2!11600) (t!24522 List!17433)) )
))
(declare-datatypes ((ListLongMap!10371 0))(
  ( (ListLongMap!10372 (toList!5201 List!17433)) )
))
(declare-fun lt!397958 () ListLongMap!10371)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!397954 () ListLongMap!10371)

(declare-fun +!2518 (ListLongMap!10371 tuple2!11600) ListLongMap!10371)

(declare-fun get!12969 (ValueCell!8330 V!28433) V!28433)

(declare-fun dynLambda!1244 (Int (_ BitVec 64)) V!28433)

(assert (=> b!880332 (= lt!397954 (+!2518 lt!397958 (tuple2!11601 (select (arr!24641 _keys!868) from!1053) (get!12969 (select (arr!24642 _values!688) from!1053) (dynLambda!1244 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880333 () Bool)

(declare-fun e!490001 () Bool)

(assert (=> b!880333 (= e!490001 (not e!490000))))

(declare-fun res!597821 () Bool)

(assert (=> b!880333 (=> res!597821 e!490000)))

(assert (=> b!880333 (= res!597821 (not (validKeyInArray!0 (select (arr!24641 _keys!868) from!1053))))))

(declare-fun lt!397957 () ListLongMap!10371)

(assert (=> b!880333 (= lt!397957 lt!397958)))

(declare-fun v!557 () V!28433)

(declare-fun lt!397952 () ListLongMap!10371)

(assert (=> b!880333 (= lt!397958 (+!2518 lt!397952 (tuple2!11601 k0!854 v!557)))))

(declare-fun lt!397955 () array!51243)

(declare-fun minValue!654 () V!28433)

(declare-fun zeroValue!654 () V!28433)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3243 (array!51241 array!51243 (_ BitVec 32) (_ BitVec 32) V!28433 V!28433 (_ BitVec 32) Int) ListLongMap!10371)

(assert (=> b!880333 (= lt!397957 (getCurrentListMapNoExtraKeys!3243 _keys!868 lt!397955 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880333 (= lt!397952 (getCurrentListMapNoExtraKeys!3243 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30008 0))(
  ( (Unit!30009) )
))
(declare-fun lt!397956 () Unit!30008)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!686 (array!51241 array!51243 (_ BitVec 32) (_ BitVec 32) V!28433 V!28433 (_ BitVec 32) (_ BitVec 64) V!28433 (_ BitVec 32) Int) Unit!30008)

(assert (=> b!880333 (= lt!397956 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880334 () Bool)

(assert (=> b!880334 (= e!489997 (and e!489996 mapRes!27927))))

(declare-fun condMapEmpty!27927 () Bool)

(declare-fun mapDefault!27927 () ValueCell!8330)

(assert (=> b!880334 (= condMapEmpty!27927 (= (arr!24642 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8330)) mapDefault!27927)))))

(declare-fun b!880335 () Bool)

(declare-fun e!489995 () Bool)

(assert (=> b!880335 (= e!489995 tp_is_empty!17539)))

(declare-fun mapNonEmpty!27927 () Bool)

(declare-fun tp!53571 () Bool)

(assert (=> mapNonEmpty!27927 (= mapRes!27927 (and tp!53571 e!489995))))

(declare-fun mapKey!27927 () (_ BitVec 32))

(declare-fun mapValue!27927 () ValueCell!8330)

(declare-fun mapRest!27927 () (Array (_ BitVec 32) ValueCell!8330))

(assert (=> mapNonEmpty!27927 (= (arr!24642 _values!688) (store mapRest!27927 mapKey!27927 mapValue!27927))))

(declare-fun b!880336 () Bool)

(declare-fun res!597820 () Bool)

(assert (=> b!880336 (=> (not res!597820) (not e!489998))))

(assert (=> b!880336 (= res!597820 (and (= (select (arr!24641 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880337 () Bool)

(declare-fun res!597817 () Bool)

(assert (=> b!880337 (=> (not res!597817) (not e!489998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880337 (= res!597817 (validMask!0 mask!1196))))

(declare-fun b!880338 () Bool)

(assert (=> b!880338 (= e!489998 e!490001)))

(declare-fun res!597818 () Bool)

(assert (=> b!880338 (=> (not res!597818) (not e!490001))))

(assert (=> b!880338 (= res!597818 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880338 (= lt!397954 (getCurrentListMapNoExtraKeys!3243 _keys!868 lt!397955 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880338 (= lt!397955 (array!51244 (store (arr!24642 _values!688) i!612 (ValueCellFull!8330 v!557)) (size!25083 _values!688)))))

(declare-fun lt!397953 () ListLongMap!10371)

(assert (=> b!880338 (= lt!397953 (getCurrentListMapNoExtraKeys!3243 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880339 () Bool)

(declare-fun res!597822 () Bool)

(assert (=> b!880339 (=> (not res!597822) (not e!489998))))

(assert (=> b!880339 (= res!597822 (and (= (size!25083 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25082 _keys!868) (size!25083 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74794 res!597819) b!880337))

(assert (= (and b!880337 res!597817) b!880339))

(assert (= (and b!880339 res!597822) b!880331))

(assert (= (and b!880331 res!597825) b!880327))

(assert (= (and b!880327 res!597816) b!880330))

(assert (= (and b!880330 res!597823) b!880329))

(assert (= (and b!880329 res!597824) b!880336))

(assert (= (and b!880336 res!597820) b!880338))

(assert (= (and b!880338 res!597818) b!880333))

(assert (= (and b!880333 (not res!597821)) b!880332))

(assert (= (and b!880334 condMapEmpty!27927) mapIsEmpty!27927))

(assert (= (and b!880334 (not condMapEmpty!27927)) mapNonEmpty!27927))

(get-info :version)

(assert (= (and mapNonEmpty!27927 ((_ is ValueCellFull!8330) mapValue!27927)) b!880335))

(assert (= (and b!880334 ((_ is ValueCellFull!8330) mapDefault!27927)) b!880328))

(assert (= start!74794 b!880334))

(declare-fun b_lambda!12383 () Bool)

(assert (=> (not b_lambda!12383) (not b!880332)))

(declare-fun t!24520 () Bool)

(declare-fun tb!4945 () Bool)

(assert (=> (and start!74794 (= defaultEntry!696 defaultEntry!696) t!24520) tb!4945))

(declare-fun result!9521 () Bool)

(assert (=> tb!4945 (= result!9521 tp_is_empty!17539)))

(assert (=> b!880332 t!24520))

(declare-fun b_and!25205 () Bool)

(assert (= b_and!25203 (and (=> t!24520 result!9521) b_and!25205)))

(declare-fun m!820453 () Bool)

(assert (=> start!74794 m!820453))

(declare-fun m!820455 () Bool)

(assert (=> start!74794 m!820455))

(declare-fun m!820457 () Bool)

(assert (=> b!880332 m!820457))

(declare-fun m!820459 () Bool)

(assert (=> b!880332 m!820459))

(declare-fun m!820461 () Bool)

(assert (=> b!880332 m!820461))

(declare-fun m!820463 () Bool)

(assert (=> b!880332 m!820463))

(assert (=> b!880332 m!820459))

(declare-fun m!820465 () Bool)

(assert (=> b!880332 m!820465))

(assert (=> b!880332 m!820461))

(declare-fun m!820467 () Bool)

(assert (=> b!880337 m!820467))

(declare-fun m!820469 () Bool)

(assert (=> b!880338 m!820469))

(declare-fun m!820471 () Bool)

(assert (=> b!880338 m!820471))

(declare-fun m!820473 () Bool)

(assert (=> b!880338 m!820473))

(declare-fun m!820475 () Bool)

(assert (=> b!880331 m!820475))

(declare-fun m!820477 () Bool)

(assert (=> b!880336 m!820477))

(declare-fun m!820479 () Bool)

(assert (=> b!880329 m!820479))

(declare-fun m!820481 () Bool)

(assert (=> mapNonEmpty!27927 m!820481))

(declare-fun m!820483 () Bool)

(assert (=> b!880327 m!820483))

(declare-fun m!820485 () Bool)

(assert (=> b!880333 m!820485))

(declare-fun m!820487 () Bool)

(assert (=> b!880333 m!820487))

(assert (=> b!880333 m!820465))

(declare-fun m!820489 () Bool)

(assert (=> b!880333 m!820489))

(assert (=> b!880333 m!820465))

(declare-fun m!820491 () Bool)

(assert (=> b!880333 m!820491))

(declare-fun m!820493 () Bool)

(assert (=> b!880333 m!820493))

(check-sat (not b!880327) (not start!74794) (not mapNonEmpty!27927) (not b!880329) (not b_next!15295) (not b_lambda!12383) (not b!880337) (not b!880331) b_and!25205 tp_is_empty!17539 (not b!880338) (not b!880332) (not b!880333))
(check-sat b_and!25205 (not b_next!15295))
