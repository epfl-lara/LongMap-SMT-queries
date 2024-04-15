; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74670 () Bool)

(assert start!74670)

(declare-fun b_free!15337 () Bool)

(declare-fun b_next!15337 () Bool)

(assert (=> start!74670 (= b_free!15337 (not b_next!15337))))

(declare-fun tp!53700 () Bool)

(declare-fun b_and!25267 () Bool)

(assert (=> start!74670 (= tp!53700 b_and!25267)))

(declare-fun b!880187 () Bool)

(declare-fun res!598058 () Bool)

(declare-fun e!489802 () Bool)

(assert (=> b!880187 (=> (not res!598058) (not e!489802))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51267 0))(
  ( (array!51268 (arr!24658 (Array (_ BitVec 32) (_ BitVec 64))) (size!25100 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51267)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880187 (= res!598058 (and (= (select (arr!24658 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880188 () Bool)

(declare-fun e!489806 () Bool)

(assert (=> b!880188 (= e!489806 true)))

(declare-datatypes ((List!17510 0))(
  ( (Nil!17507) (Cons!17506 (h!18637 (_ BitVec 64)) (t!24640 List!17510)) )
))
(declare-fun arrayNoDuplicates!0 (array!51267 (_ BitVec 32) List!17510) Bool)

(assert (=> b!880188 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17507)))

(declare-datatypes ((Unit!30001 0))(
  ( (Unit!30002) )
))
(declare-fun lt!397879 () Unit!30001)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51267 (_ BitVec 32) (_ BitVec 32)) Unit!30001)

(assert (=> b!880188 (= lt!397879 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880189 () Bool)

(declare-fun res!598061 () Bool)

(assert (=> b!880189 (=> (not res!598061) (not e!489802))))

(assert (=> b!880189 (= res!598061 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25100 _keys!868))))))

(declare-fun b!880190 () Bool)

(declare-fun res!598055 () Bool)

(assert (=> b!880190 (=> (not res!598055) (not e!489802))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880190 (= res!598055 (validMask!0 mask!1196))))

(declare-fun b!880191 () Bool)

(declare-fun res!598062 () Bool)

(assert (=> b!880191 (=> (not res!598062) (not e!489802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51267 (_ BitVec 32)) Bool)

(assert (=> b!880191 (= res!598062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880192 () Bool)

(declare-fun res!598053 () Bool)

(assert (=> b!880192 (=> (not res!598053) (not e!489802))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28489 0))(
  ( (V!28490 (val!8838 Int)) )
))
(declare-datatypes ((ValueCell!8351 0))(
  ( (ValueCellFull!8351 (v!11280 V!28489)) (EmptyCell!8351) )
))
(declare-datatypes ((array!51269 0))(
  ( (array!51270 (arr!24659 (Array (_ BitVec 32) ValueCell!8351)) (size!25101 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51269)

(assert (=> b!880192 (= res!598053 (and (= (size!25101 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25100 _keys!868) (size!25101 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880193 () Bool)

(declare-fun e!489800 () Bool)

(declare-fun e!489805 () Bool)

(declare-fun mapRes!27993 () Bool)

(assert (=> b!880193 (= e!489800 (and e!489805 mapRes!27993))))

(declare-fun condMapEmpty!27993 () Bool)

(declare-fun mapDefault!27993 () ValueCell!8351)

(assert (=> b!880193 (= condMapEmpty!27993 (= (arr!24659 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8351)) mapDefault!27993)))))

(declare-fun b!880194 () Bool)

(declare-fun res!598054 () Bool)

(assert (=> b!880194 (=> (not res!598054) (not e!489802))))

(assert (=> b!880194 (= res!598054 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17507))))

(declare-fun mapIsEmpty!27993 () Bool)

(assert (=> mapIsEmpty!27993 mapRes!27993))

(declare-fun res!598057 () Bool)

(assert (=> start!74670 (=> (not res!598057) (not e!489802))))

(assert (=> start!74670 (= res!598057 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25100 _keys!868))))))

(assert (=> start!74670 e!489802))

(declare-fun tp_is_empty!17581 () Bool)

(assert (=> start!74670 tp_is_empty!17581))

(assert (=> start!74670 true))

(assert (=> start!74670 tp!53700))

(declare-fun array_inv!19470 (array!51267) Bool)

(assert (=> start!74670 (array_inv!19470 _keys!868)))

(declare-fun array_inv!19471 (array!51269) Bool)

(assert (=> start!74670 (and (array_inv!19471 _values!688) e!489800)))

(declare-fun b!880195 () Bool)

(declare-fun e!489804 () Bool)

(assert (=> b!880195 (= e!489804 tp_is_empty!17581)))

(declare-fun b!880196 () Bool)

(declare-fun e!489801 () Bool)

(declare-fun e!489803 () Bool)

(assert (=> b!880196 (= e!489801 (not e!489803))))

(declare-fun res!598056 () Bool)

(assert (=> b!880196 (=> res!598056 e!489803)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880196 (= res!598056 (not (validKeyInArray!0 (select (arr!24658 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11714 0))(
  ( (tuple2!11715 (_1!5868 (_ BitVec 64)) (_2!5868 V!28489)) )
))
(declare-datatypes ((List!17511 0))(
  ( (Nil!17508) (Cons!17507 (h!18638 tuple2!11714) (t!24641 List!17511)) )
))
(declare-datatypes ((ListLongMap!10473 0))(
  ( (ListLongMap!10474 (toList!5252 List!17511)) )
))
(declare-fun lt!397883 () ListLongMap!10473)

(declare-fun lt!397878 () ListLongMap!10473)

(assert (=> b!880196 (= lt!397883 lt!397878)))

(declare-fun v!557 () V!28489)

(declare-fun lt!397882 () ListLongMap!10473)

(declare-fun +!2547 (ListLongMap!10473 tuple2!11714) ListLongMap!10473)

(assert (=> b!880196 (= lt!397878 (+!2547 lt!397882 (tuple2!11715 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28489)

(declare-fun zeroValue!654 () V!28489)

(declare-fun lt!397877 () array!51269)

(declare-fun getCurrentListMapNoExtraKeys!3243 (array!51267 array!51269 (_ BitVec 32) (_ BitVec 32) V!28489 V!28489 (_ BitVec 32) Int) ListLongMap!10473)

(assert (=> b!880196 (= lt!397883 (getCurrentListMapNoExtraKeys!3243 _keys!868 lt!397877 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880196 (= lt!397882 (getCurrentListMapNoExtraKeys!3243 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!397881 () Unit!30001)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!712 (array!51267 array!51269 (_ BitVec 32) (_ BitVec 32) V!28489 V!28489 (_ BitVec 32) (_ BitVec 64) V!28489 (_ BitVec 32) Int) Unit!30001)

(assert (=> b!880196 (= lt!397881 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!712 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!880197 () Bool)

(assert (=> b!880197 (= e!489805 tp_is_empty!17581)))

(declare-fun b!880198 () Bool)

(declare-fun res!598060 () Bool)

(assert (=> b!880198 (=> (not res!598060) (not e!489802))))

(assert (=> b!880198 (= res!598060 (validKeyInArray!0 k0!854))))

(declare-fun b!880199 () Bool)

(assert (=> b!880199 (= e!489802 e!489801)))

(declare-fun res!598063 () Bool)

(assert (=> b!880199 (=> (not res!598063) (not e!489801))))

(assert (=> b!880199 (= res!598063 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397884 () ListLongMap!10473)

(assert (=> b!880199 (= lt!397884 (getCurrentListMapNoExtraKeys!3243 _keys!868 lt!397877 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880199 (= lt!397877 (array!51270 (store (arr!24659 _values!688) i!612 (ValueCellFull!8351 v!557)) (size!25101 _values!688)))))

(declare-fun lt!397880 () ListLongMap!10473)

(assert (=> b!880199 (= lt!397880 (getCurrentListMapNoExtraKeys!3243 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27993 () Bool)

(declare-fun tp!53699 () Bool)

(assert (=> mapNonEmpty!27993 (= mapRes!27993 (and tp!53699 e!489804))))

(declare-fun mapValue!27993 () ValueCell!8351)

(declare-fun mapKey!27993 () (_ BitVec 32))

(declare-fun mapRest!27993 () (Array (_ BitVec 32) ValueCell!8351))

(assert (=> mapNonEmpty!27993 (= (arr!24659 _values!688) (store mapRest!27993 mapKey!27993 mapValue!27993))))

(declare-fun b!880200 () Bool)

(assert (=> b!880200 (= e!489803 e!489806)))

(declare-fun res!598059 () Bool)

(assert (=> b!880200 (=> res!598059 e!489806)))

(assert (=> b!880200 (= res!598059 (not (= (select (arr!24658 _keys!868) from!1053) k0!854)))))

(declare-fun get!12977 (ValueCell!8351 V!28489) V!28489)

(declare-fun dynLambda!1239 (Int (_ BitVec 64)) V!28489)

(assert (=> b!880200 (= lt!397884 (+!2547 lt!397878 (tuple2!11715 (select (arr!24658 _keys!868) from!1053) (get!12977 (select (arr!24659 _values!688) from!1053) (dynLambda!1239 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!74670 res!598057) b!880190))

(assert (= (and b!880190 res!598055) b!880192))

(assert (= (and b!880192 res!598053) b!880191))

(assert (= (and b!880191 res!598062) b!880194))

(assert (= (and b!880194 res!598054) b!880189))

(assert (= (and b!880189 res!598061) b!880198))

(assert (= (and b!880198 res!598060) b!880187))

(assert (= (and b!880187 res!598058) b!880199))

(assert (= (and b!880199 res!598063) b!880196))

(assert (= (and b!880196 (not res!598056)) b!880200))

(assert (= (and b!880200 (not res!598059)) b!880188))

(assert (= (and b!880193 condMapEmpty!27993) mapIsEmpty!27993))

(assert (= (and b!880193 (not condMapEmpty!27993)) mapNonEmpty!27993))

(get-info :version)

(assert (= (and mapNonEmpty!27993 ((_ is ValueCellFull!8351) mapValue!27993)) b!880195))

(assert (= (and b!880193 ((_ is ValueCellFull!8351) mapDefault!27993)) b!880197))

(assert (= start!74670 b!880193))

(declare-fun b_lambda!12427 () Bool)

(assert (=> (not b_lambda!12427) (not b!880200)))

(declare-fun t!24639 () Bool)

(declare-fun tb!4987 () Bool)

(assert (=> (and start!74670 (= defaultEntry!696 defaultEntry!696) t!24639) tb!4987))

(declare-fun result!9607 () Bool)

(assert (=> tb!4987 (= result!9607 tp_is_empty!17581)))

(assert (=> b!880200 t!24639))

(declare-fun b_and!25269 () Bool)

(assert (= b_and!25267 (and (=> t!24639 result!9607) b_and!25269)))

(declare-fun m!819443 () Bool)

(assert (=> start!74670 m!819443))

(declare-fun m!819445 () Bool)

(assert (=> start!74670 m!819445))

(declare-fun m!819447 () Bool)

(assert (=> b!880199 m!819447))

(declare-fun m!819449 () Bool)

(assert (=> b!880199 m!819449))

(declare-fun m!819451 () Bool)

(assert (=> b!880199 m!819451))

(declare-fun m!819453 () Bool)

(assert (=> mapNonEmpty!27993 m!819453))

(declare-fun m!819455 () Bool)

(assert (=> b!880198 m!819455))

(declare-fun m!819457 () Bool)

(assert (=> b!880188 m!819457))

(declare-fun m!819459 () Bool)

(assert (=> b!880188 m!819459))

(declare-fun m!819461 () Bool)

(assert (=> b!880194 m!819461))

(declare-fun m!819463 () Bool)

(assert (=> b!880191 m!819463))

(declare-fun m!819465 () Bool)

(assert (=> b!880196 m!819465))

(declare-fun m!819467 () Bool)

(assert (=> b!880196 m!819467))

(declare-fun m!819469 () Bool)

(assert (=> b!880196 m!819469))

(declare-fun m!819471 () Bool)

(assert (=> b!880196 m!819471))

(declare-fun m!819473 () Bool)

(assert (=> b!880196 m!819473))

(assert (=> b!880196 m!819471))

(declare-fun m!819475 () Bool)

(assert (=> b!880196 m!819475))

(declare-fun m!819477 () Bool)

(assert (=> b!880187 m!819477))

(declare-fun m!819479 () Bool)

(assert (=> b!880200 m!819479))

(declare-fun m!819481 () Bool)

(assert (=> b!880200 m!819481))

(declare-fun m!819483 () Bool)

(assert (=> b!880200 m!819483))

(declare-fun m!819485 () Bool)

(assert (=> b!880200 m!819485))

(assert (=> b!880200 m!819481))

(assert (=> b!880200 m!819471))

(assert (=> b!880200 m!819483))

(declare-fun m!819487 () Bool)

(assert (=> b!880190 m!819487))

(check-sat (not b!880194) (not b!880191) (not b!880199) (not b!880196) (not b!880188) (not b_lambda!12427) (not b_next!15337) (not start!74670) b_and!25269 (not mapNonEmpty!27993) tp_is_empty!17581 (not b!880198) (not b!880190) (not b!880200))
(check-sat b_and!25269 (not b_next!15337))
