; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75070 () Bool)

(assert start!75070)

(declare-fun b_free!15421 () Bool)

(declare-fun b_next!15421 () Bool)

(assert (=> start!75070 (= b_free!15421 (not b_next!15421))))

(declare-fun tp!53967 () Bool)

(declare-fun b_and!25551 () Bool)

(assert (=> start!75070 (= tp!53967 b_and!25551)))

(declare-fun b!883995 () Bool)

(declare-fun e!492071 () Bool)

(declare-fun e!492070 () Bool)

(assert (=> b!883995 (= e!492071 (not e!492070))))

(declare-fun res!600305 () Bool)

(assert (=> b!883995 (=> res!600305 e!492070)))

(declare-datatypes ((array!51497 0))(
  ( (array!51498 (arr!24763 (Array (_ BitVec 32) (_ BitVec 64))) (size!25204 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51497)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883995 (= res!600305 (not (validKeyInArray!0 (select (arr!24763 _keys!868) from!1053))))))

(declare-datatypes ((V!28601 0))(
  ( (V!28602 (val!8880 Int)) )
))
(declare-datatypes ((tuple2!11702 0))(
  ( (tuple2!11703 (_1!5862 (_ BitVec 64)) (_2!5862 V!28601)) )
))
(declare-datatypes ((List!17533 0))(
  ( (Nil!17530) (Cons!17529 (h!18666 tuple2!11702) (t!24748 List!17533)) )
))
(declare-datatypes ((ListLongMap!10473 0))(
  ( (ListLongMap!10474 (toList!5252 List!17533)) )
))
(declare-fun lt!399971 () ListLongMap!10473)

(declare-fun lt!399964 () ListLongMap!10473)

(assert (=> b!883995 (= lt!399971 lt!399964)))

(declare-fun v!557 () V!28601)

(declare-fun lt!399963 () ListLongMap!10473)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2565 (ListLongMap!10473 tuple2!11702) ListLongMap!10473)

(assert (=> b!883995 (= lt!399964 (+!2565 lt!399963 (tuple2!11703 k0!854 v!557)))))

(declare-datatypes ((ValueCell!8393 0))(
  ( (ValueCellFull!8393 (v!11349 V!28601)) (EmptyCell!8393) )
))
(declare-datatypes ((array!51499 0))(
  ( (array!51500 (arr!24764 (Array (_ BitVec 32) ValueCell!8393)) (size!25205 (_ BitVec 32))) )
))
(declare-fun lt!399968 () array!51499)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28601)

(declare-fun zeroValue!654 () V!28601)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3291 (array!51497 array!51499 (_ BitVec 32) (_ BitVec 32) V!28601 V!28601 (_ BitVec 32) Int) ListLongMap!10473)

(assert (=> b!883995 (= lt!399971 (getCurrentListMapNoExtraKeys!3291 _keys!868 lt!399968 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51499)

(assert (=> b!883995 (= lt!399963 (getCurrentListMapNoExtraKeys!3291 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30102 0))(
  ( (Unit!30103) )
))
(declare-fun lt!399967 () Unit!30102)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!729 (array!51497 array!51499 (_ BitVec 32) (_ BitVec 32) V!28601 V!28601 (_ BitVec 32) (_ BitVec 64) V!28601 (_ BitVec 32) Int) Unit!30102)

(assert (=> b!883995 (= lt!399967 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!729 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!28134 () Bool)

(declare-fun mapRes!28134 () Bool)

(assert (=> mapIsEmpty!28134 mapRes!28134))

(declare-fun b!883996 () Bool)

(declare-fun res!600304 () Bool)

(declare-fun e!492066 () Bool)

(assert (=> b!883996 (=> (not res!600304) (not e!492066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51497 (_ BitVec 32)) Bool)

(assert (=> b!883996 (= res!600304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883997 () Bool)

(declare-fun res!600303 () Bool)

(assert (=> b!883997 (=> (not res!600303) (not e!492066))))

(assert (=> b!883997 (= res!600303 (and (= (select (arr!24763 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!600309 () Bool)

(assert (=> start!75070 (=> (not res!600309) (not e!492066))))

(assert (=> start!75070 (= res!600309 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25204 _keys!868))))))

(assert (=> start!75070 e!492066))

(declare-fun tp_is_empty!17665 () Bool)

(assert (=> start!75070 tp_is_empty!17665))

(assert (=> start!75070 true))

(assert (=> start!75070 tp!53967))

(declare-fun array_inv!19544 (array!51497) Bool)

(assert (=> start!75070 (array_inv!19544 _keys!868)))

(declare-fun e!492072 () Bool)

(declare-fun array_inv!19545 (array!51499) Bool)

(assert (=> start!75070 (and (array_inv!19545 _values!688) e!492072)))

(declare-fun b!883998 () Bool)

(declare-fun e!492069 () Bool)

(assert (=> b!883998 (= e!492069 tp_is_empty!17665)))

(declare-fun mapNonEmpty!28134 () Bool)

(declare-fun tp!53966 () Bool)

(declare-fun e!492068 () Bool)

(assert (=> mapNonEmpty!28134 (= mapRes!28134 (and tp!53966 e!492068))))

(declare-fun mapValue!28134 () ValueCell!8393)

(declare-fun mapRest!28134 () (Array (_ BitVec 32) ValueCell!8393))

(declare-fun mapKey!28134 () (_ BitVec 32))

(assert (=> mapNonEmpty!28134 (= (arr!24764 _values!688) (store mapRest!28134 mapKey!28134 mapValue!28134))))

(declare-fun b!883999 () Bool)

(declare-fun e!492067 () Bool)

(assert (=> b!883999 (= e!492067 true)))

(assert (=> b!883999 false))

(declare-fun lt!399969 () Unit!30102)

(declare-datatypes ((List!17534 0))(
  ( (Nil!17531) (Cons!17530 (h!18667 (_ BitVec 64)) (t!24749 List!17534)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51497 (_ BitVec 64) (_ BitVec 32) List!17534) Unit!30102)

(assert (=> b!883999 (= lt!399969 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17531))))

(declare-fun arrayContainsKey!0 (array!51497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883999 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399965 () Unit!30102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30102)

(assert (=> b!883999 (= lt!399965 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!51497 (_ BitVec 32) List!17534) Bool)

(assert (=> b!883999 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17531)))

(declare-fun lt!399972 () Unit!30102)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51497 (_ BitVec 32) (_ BitVec 32)) Unit!30102)

(assert (=> b!883999 (= lt!399972 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!884000 () Bool)

(assert (=> b!884000 (= e!492070 e!492067)))

(declare-fun res!600307 () Bool)

(assert (=> b!884000 (=> res!600307 e!492067)))

(assert (=> b!884000 (= res!600307 (not (= (select (arr!24763 _keys!868) from!1053) k0!854)))))

(declare-fun lt!399970 () ListLongMap!10473)

(declare-fun get!13061 (ValueCell!8393 V!28601) V!28601)

(declare-fun dynLambda!1282 (Int (_ BitVec 64)) V!28601)

(assert (=> b!884000 (= lt!399970 (+!2565 lt!399964 (tuple2!11703 (select (arr!24763 _keys!868) from!1053) (get!13061 (select (arr!24764 _values!688) from!1053) (dynLambda!1282 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884001 () Bool)

(declare-fun res!600308 () Bool)

(assert (=> b!884001 (=> (not res!600308) (not e!492066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884001 (= res!600308 (validMask!0 mask!1196))))

(declare-fun b!884002 () Bool)

(declare-fun res!600310 () Bool)

(assert (=> b!884002 (=> (not res!600310) (not e!492066))))

(assert (=> b!884002 (= res!600310 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17531))))

(declare-fun b!884003 () Bool)

(declare-fun res!600301 () Bool)

(assert (=> b!884003 (=> (not res!600301) (not e!492066))))

(assert (=> b!884003 (= res!600301 (validKeyInArray!0 k0!854))))

(declare-fun b!884004 () Bool)

(assert (=> b!884004 (= e!492072 (and e!492069 mapRes!28134))))

(declare-fun condMapEmpty!28134 () Bool)

(declare-fun mapDefault!28134 () ValueCell!8393)

(assert (=> b!884004 (= condMapEmpty!28134 (= (arr!24764 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8393)) mapDefault!28134)))))

(declare-fun b!884005 () Bool)

(assert (=> b!884005 (= e!492066 e!492071)))

(declare-fun res!600302 () Bool)

(assert (=> b!884005 (=> (not res!600302) (not e!492071))))

(assert (=> b!884005 (= res!600302 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884005 (= lt!399970 (getCurrentListMapNoExtraKeys!3291 _keys!868 lt!399968 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884005 (= lt!399968 (array!51500 (store (arr!24764 _values!688) i!612 (ValueCellFull!8393 v!557)) (size!25205 _values!688)))))

(declare-fun lt!399966 () ListLongMap!10473)

(assert (=> b!884005 (= lt!399966 (getCurrentListMapNoExtraKeys!3291 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884006 () Bool)

(declare-fun res!600311 () Bool)

(assert (=> b!884006 (=> (not res!600311) (not e!492066))))

(assert (=> b!884006 (= res!600311 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25204 _keys!868))))))

(declare-fun b!884007 () Bool)

(assert (=> b!884007 (= e!492068 tp_is_empty!17665)))

(declare-fun b!884008 () Bool)

(declare-fun res!600306 () Bool)

(assert (=> b!884008 (=> (not res!600306) (not e!492066))))

(assert (=> b!884008 (= res!600306 (and (= (size!25205 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25204 _keys!868) (size!25205 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!75070 res!600309) b!884001))

(assert (= (and b!884001 res!600308) b!884008))

(assert (= (and b!884008 res!600306) b!883996))

(assert (= (and b!883996 res!600304) b!884002))

(assert (= (and b!884002 res!600310) b!884006))

(assert (= (and b!884006 res!600311) b!884003))

(assert (= (and b!884003 res!600301) b!883997))

(assert (= (and b!883997 res!600303) b!884005))

(assert (= (and b!884005 res!600302) b!883995))

(assert (= (and b!883995 (not res!600305)) b!884000))

(assert (= (and b!884000 (not res!600307)) b!883999))

(assert (= (and b!884004 condMapEmpty!28134) mapIsEmpty!28134))

(assert (= (and b!884004 (not condMapEmpty!28134)) mapNonEmpty!28134))

(get-info :version)

(assert (= (and mapNonEmpty!28134 ((_ is ValueCellFull!8393) mapValue!28134)) b!884007))

(assert (= (and b!884004 ((_ is ValueCellFull!8393) mapDefault!28134)) b!883998))

(assert (= start!75070 b!884004))

(declare-fun b_lambda!12713 () Bool)

(assert (=> (not b_lambda!12713) (not b!884000)))

(declare-fun t!24747 () Bool)

(declare-fun tb!5071 () Bool)

(assert (=> (and start!75070 (= defaultEntry!696 defaultEntry!696) t!24747) tb!5071))

(declare-fun result!9785 () Bool)

(assert (=> tb!5071 (= result!9785 tp_is_empty!17665)))

(assert (=> b!884000 t!24747))

(declare-fun b_and!25553 () Bool)

(assert (= b_and!25551 (and (=> t!24747 result!9785) b_and!25553)))

(declare-fun m!824403 () Bool)

(assert (=> b!883995 m!824403))

(declare-fun m!824405 () Bool)

(assert (=> b!883995 m!824405))

(declare-fun m!824407 () Bool)

(assert (=> b!883995 m!824407))

(assert (=> b!883995 m!824405))

(declare-fun m!824409 () Bool)

(assert (=> b!883995 m!824409))

(declare-fun m!824411 () Bool)

(assert (=> b!883995 m!824411))

(declare-fun m!824413 () Bool)

(assert (=> b!883995 m!824413))

(declare-fun m!824415 () Bool)

(assert (=> b!884003 m!824415))

(declare-fun m!824417 () Bool)

(assert (=> b!884000 m!824417))

(declare-fun m!824419 () Bool)

(assert (=> b!884000 m!824419))

(declare-fun m!824421 () Bool)

(assert (=> b!884000 m!824421))

(declare-fun m!824423 () Bool)

(assert (=> b!884000 m!824423))

(assert (=> b!884000 m!824419))

(assert (=> b!884000 m!824405))

(assert (=> b!884000 m!824421))

(declare-fun m!824425 () Bool)

(assert (=> b!883997 m!824425))

(declare-fun m!824427 () Bool)

(assert (=> b!884001 m!824427))

(declare-fun m!824429 () Bool)

(assert (=> b!883996 m!824429))

(declare-fun m!824431 () Bool)

(assert (=> b!884002 m!824431))

(declare-fun m!824433 () Bool)

(assert (=> b!884005 m!824433))

(declare-fun m!824435 () Bool)

(assert (=> b!884005 m!824435))

(declare-fun m!824437 () Bool)

(assert (=> b!884005 m!824437))

(declare-fun m!824439 () Bool)

(assert (=> mapNonEmpty!28134 m!824439))

(declare-fun m!824441 () Bool)

(assert (=> start!75070 m!824441))

(declare-fun m!824443 () Bool)

(assert (=> start!75070 m!824443))

(declare-fun m!824445 () Bool)

(assert (=> b!883999 m!824445))

(declare-fun m!824447 () Bool)

(assert (=> b!883999 m!824447))

(declare-fun m!824449 () Bool)

(assert (=> b!883999 m!824449))

(declare-fun m!824451 () Bool)

(assert (=> b!883999 m!824451))

(declare-fun m!824453 () Bool)

(assert (=> b!883999 m!824453))

(check-sat (not b!884003) (not mapNonEmpty!28134) (not b!884001) (not b_next!15421) tp_is_empty!17665 (not b!884000) (not b!883999) (not b!884005) (not b!883996) (not b_lambda!12713) (not b!883995) (not start!75070) b_and!25553 (not b!884002))
(check-sat b_and!25553 (not b_next!15421))
