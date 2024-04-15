; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73762 () Bool)

(assert start!73762)

(declare-fun b_free!14695 () Bool)

(declare-fun b_next!14695 () Bool)

(assert (=> start!73762 (= b_free!14695 (not b_next!14695))))

(declare-fun tp!51590 () Bool)

(declare-fun b_and!24343 () Bool)

(assert (=> start!73762 (= tp!51590 b_and!24343)))

(declare-fun mapNonEmpty!26846 () Bool)

(declare-fun mapRes!26846 () Bool)

(declare-fun tp!51589 () Bool)

(declare-fun e!482064 () Bool)

(assert (=> mapNonEmpty!26846 (= mapRes!26846 (and tp!51589 e!482064))))

(declare-datatypes ((V!27489 0))(
  ( (V!27490 (val!8463 Int)) )
))
(declare-datatypes ((ValueCell!7976 0))(
  ( (ValueCellFull!7976 (v!10882 V!27489)) (EmptyCell!7976) )
))
(declare-fun mapRest!26846 () (Array (_ BitVec 32) ValueCell!7976))

(declare-fun mapKey!26846 () (_ BitVec 32))

(declare-fun mapValue!26846 () ValueCell!7976)

(declare-datatypes ((array!49815 0))(
  ( (array!49816 (arr!23939 (Array (_ BitVec 32) ValueCell!7976)) (size!24381 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49815)

(assert (=> mapNonEmpty!26846 (= (arr!23939 _values!688) (store mapRest!26846 mapKey!26846 mapValue!26846))))

(declare-fun b!865386 () Bool)

(declare-fun res!588058 () Bool)

(declare-fun e!482060 () Bool)

(assert (=> b!865386 (=> (not res!588058) (not e!482060))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865386 (= res!588058 (validMask!0 mask!1196))))

(declare-fun b!865387 () Bool)

(declare-fun e!482065 () Bool)

(declare-fun tp_is_empty!16831 () Bool)

(assert (=> b!865387 (= e!482065 tp_is_empty!16831)))

(declare-fun b!865388 () Bool)

(declare-datatypes ((Unit!29578 0))(
  ( (Unit!29579) )
))
(declare-fun e!482066 () Unit!29578)

(declare-fun Unit!29580 () Unit!29578)

(assert (=> b!865388 (= e!482066 Unit!29580)))

(declare-fun mapIsEmpty!26846 () Bool)

(assert (=> mapIsEmpty!26846 mapRes!26846))

(declare-fun b!865389 () Bool)

(declare-fun res!588056 () Bool)

(assert (=> b!865389 (=> (not res!588056) (not e!482060))))

(declare-datatypes ((array!49817 0))(
  ( (array!49818 (arr!23940 (Array (_ BitVec 32) (_ BitVec 64))) (size!24382 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49817)

(declare-datatypes ((List!17025 0))(
  ( (Nil!17022) (Cons!17021 (h!18152 (_ BitVec 64)) (t!23977 List!17025)) )
))
(declare-fun arrayNoDuplicates!0 (array!49817 (_ BitVec 32) List!17025) Bool)

(assert (=> b!865389 (= res!588056 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17022))))

(declare-fun b!865390 () Bool)

(declare-fun res!588065 () Bool)

(assert (=> b!865390 (=> (not res!588065) (not e!482060))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865390 (= res!588065 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24382 _keys!868))))))

(declare-fun b!865391 () Bool)

(assert (=> b!865391 (= e!482064 tp_is_empty!16831)))

(declare-fun b!865392 () Bool)

(declare-fun e!482067 () Bool)

(assert (=> b!865392 (= e!482067 true)))

(declare-datatypes ((tuple2!11236 0))(
  ( (tuple2!11237 (_1!5629 (_ BitVec 64)) (_2!5629 V!27489)) )
))
(declare-datatypes ((List!17026 0))(
  ( (Nil!17023) (Cons!17022 (h!18153 tuple2!11236) (t!23978 List!17026)) )
))
(declare-datatypes ((ListLongMap!9995 0))(
  ( (ListLongMap!9996 (toList!5013 List!17026)) )
))
(declare-fun lt!392098 () ListLongMap!9995)

(declare-fun lt!392099 () tuple2!11236)

(declare-fun lt!392096 () ListLongMap!9995)

(declare-fun lt!392108 () tuple2!11236)

(declare-fun +!2381 (ListLongMap!9995 tuple2!11236) ListLongMap!9995)

(assert (=> b!865392 (= lt!392098 (+!2381 (+!2381 lt!392096 lt!392099) lt!392108))))

(declare-fun v!557 () V!27489)

(declare-fun lt!392105 () V!27489)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!392095 () Unit!29578)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!520 (ListLongMap!9995 (_ BitVec 64) V!27489 (_ BitVec 64) V!27489) Unit!29578)

(assert (=> b!865392 (= lt!392095 (addCommutativeForDiffKeys!520 lt!392096 k0!854 v!557 (select (arr!23940 _keys!868) from!1053) lt!392105))))

(declare-fun b!865393 () Bool)

(declare-fun Unit!29581 () Unit!29578)

(assert (=> b!865393 (= e!482066 Unit!29581)))

(declare-fun lt!392102 () Unit!29578)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49817 (_ BitVec 32) (_ BitVec 32)) Unit!29578)

(assert (=> b!865393 (= lt!392102 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!865393 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17022)))

(declare-fun lt!392101 () Unit!29578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49817 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29578)

(assert (=> b!865393 (= lt!392101 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!865393 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392100 () Unit!29578)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49817 (_ BitVec 64) (_ BitVec 32) List!17025) Unit!29578)

(assert (=> b!865393 (= lt!392100 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17022))))

(assert (=> b!865393 false))

(declare-fun b!865394 () Bool)

(declare-fun e!482061 () Bool)

(assert (=> b!865394 (= e!482061 e!482067)))

(declare-fun res!588060 () Bool)

(assert (=> b!865394 (=> res!588060 e!482067)))

(assert (=> b!865394 (= res!588060 (= k0!854 (select (arr!23940 _keys!868) from!1053)))))

(assert (=> b!865394 (not (= (select (arr!23940 _keys!868) from!1053) k0!854))))

(declare-fun lt!392103 () Unit!29578)

(assert (=> b!865394 (= lt!392103 e!482066)))

(declare-fun c!92198 () Bool)

(assert (=> b!865394 (= c!92198 (= (select (arr!23940 _keys!868) from!1053) k0!854))))

(declare-fun lt!392093 () ListLongMap!9995)

(assert (=> b!865394 (= lt!392093 lt!392098)))

(declare-fun lt!392104 () ListLongMap!9995)

(assert (=> b!865394 (= lt!392098 (+!2381 lt!392104 lt!392099))))

(assert (=> b!865394 (= lt!392099 (tuple2!11237 (select (arr!23940 _keys!868) from!1053) lt!392105))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12657 (ValueCell!7976 V!27489) V!27489)

(declare-fun dynLambda!1178 (Int (_ BitVec 64)) V!27489)

(assert (=> b!865394 (= lt!392105 (get!12657 (select (arr!23939 _values!688) from!1053) (dynLambda!1178 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!865395 () Bool)

(declare-fun e!482062 () Bool)

(assert (=> b!865395 (= e!482062 (and e!482065 mapRes!26846))))

(declare-fun condMapEmpty!26846 () Bool)

(declare-fun mapDefault!26846 () ValueCell!7976)

(assert (=> b!865395 (= condMapEmpty!26846 (= (arr!23939 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7976)) mapDefault!26846)))))

(declare-fun b!865396 () Bool)

(declare-fun e!482063 () Bool)

(assert (=> b!865396 (= e!482063 (not e!482061))))

(declare-fun res!588066 () Bool)

(assert (=> b!865396 (=> res!588066 e!482061)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865396 (= res!588066 (not (validKeyInArray!0 (select (arr!23940 _keys!868) from!1053))))))

(declare-fun lt!392097 () ListLongMap!9995)

(assert (=> b!865396 (= lt!392097 lt!392104)))

(assert (=> b!865396 (= lt!392104 (+!2381 lt!392096 lt!392108))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27489)

(declare-fun zeroValue!654 () V!27489)

(declare-fun lt!392107 () array!49815)

(declare-fun getCurrentListMapNoExtraKeys!3010 (array!49817 array!49815 (_ BitVec 32) (_ BitVec 32) V!27489 V!27489 (_ BitVec 32) Int) ListLongMap!9995)

(assert (=> b!865396 (= lt!392097 (getCurrentListMapNoExtraKeys!3010 _keys!868 lt!392107 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!865396 (= lt!392108 (tuple2!11237 k0!854 v!557))))

(assert (=> b!865396 (= lt!392096 (getCurrentListMapNoExtraKeys!3010 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392106 () Unit!29578)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!555 (array!49817 array!49815 (_ BitVec 32) (_ BitVec 32) V!27489 V!27489 (_ BitVec 32) (_ BitVec 64) V!27489 (_ BitVec 32) Int) Unit!29578)

(assert (=> b!865396 (= lt!392106 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!555 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!865397 () Bool)

(declare-fun res!588063 () Bool)

(assert (=> b!865397 (=> (not res!588063) (not e!482060))))

(assert (=> b!865397 (= res!588063 (and (= (select (arr!23940 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!865398 () Bool)

(declare-fun res!588057 () Bool)

(assert (=> b!865398 (=> (not res!588057) (not e!482060))))

(assert (=> b!865398 (= res!588057 (validKeyInArray!0 k0!854))))

(declare-fun b!865399 () Bool)

(assert (=> b!865399 (= e!482060 e!482063)))

(declare-fun res!588064 () Bool)

(assert (=> b!865399 (=> (not res!588064) (not e!482063))))

(assert (=> b!865399 (= res!588064 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!865399 (= lt!392093 (getCurrentListMapNoExtraKeys!3010 _keys!868 lt!392107 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!865399 (= lt!392107 (array!49816 (store (arr!23939 _values!688) i!612 (ValueCellFull!7976 v!557)) (size!24381 _values!688)))))

(declare-fun lt!392094 () ListLongMap!9995)

(assert (=> b!865399 (= lt!392094 (getCurrentListMapNoExtraKeys!3010 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!588061 () Bool)

(assert (=> start!73762 (=> (not res!588061) (not e!482060))))

(assert (=> start!73762 (= res!588061 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24382 _keys!868))))))

(assert (=> start!73762 e!482060))

(assert (=> start!73762 tp_is_empty!16831))

(assert (=> start!73762 true))

(assert (=> start!73762 tp!51590))

(declare-fun array_inv!18998 (array!49817) Bool)

(assert (=> start!73762 (array_inv!18998 _keys!868)))

(declare-fun array_inv!18999 (array!49815) Bool)

(assert (=> start!73762 (and (array_inv!18999 _values!688) e!482062)))

(declare-fun b!865400 () Bool)

(declare-fun res!588062 () Bool)

(assert (=> b!865400 (=> (not res!588062) (not e!482060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49817 (_ BitVec 32)) Bool)

(assert (=> b!865400 (= res!588062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865401 () Bool)

(declare-fun res!588059 () Bool)

(assert (=> b!865401 (=> (not res!588059) (not e!482060))))

(assert (=> b!865401 (= res!588059 (and (= (size!24381 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24382 _keys!868) (size!24381 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73762 res!588061) b!865386))

(assert (= (and b!865386 res!588058) b!865401))

(assert (= (and b!865401 res!588059) b!865400))

(assert (= (and b!865400 res!588062) b!865389))

(assert (= (and b!865389 res!588056) b!865390))

(assert (= (and b!865390 res!588065) b!865398))

(assert (= (and b!865398 res!588057) b!865397))

(assert (= (and b!865397 res!588063) b!865399))

(assert (= (and b!865399 res!588064) b!865396))

(assert (= (and b!865396 (not res!588066)) b!865394))

(assert (= (and b!865394 c!92198) b!865393))

(assert (= (and b!865394 (not c!92198)) b!865388))

(assert (= (and b!865394 (not res!588060)) b!865392))

(assert (= (and b!865395 condMapEmpty!26846) mapIsEmpty!26846))

(assert (= (and b!865395 (not condMapEmpty!26846)) mapNonEmpty!26846))

(get-info :version)

(assert (= (and mapNonEmpty!26846 ((_ is ValueCellFull!7976) mapValue!26846)) b!865391))

(assert (= (and b!865395 ((_ is ValueCellFull!7976) mapDefault!26846)) b!865387))

(assert (= start!73762 b!865395))

(declare-fun b_lambda!12029 () Bool)

(assert (=> (not b_lambda!12029) (not b!865394)))

(declare-fun t!23976 () Bool)

(declare-fun tb!4809 () Bool)

(assert (=> (and start!73762 (= defaultEntry!696 defaultEntry!696) t!23976) tb!4809))

(declare-fun result!9237 () Bool)

(assert (=> tb!4809 (= result!9237 tp_is_empty!16831)))

(assert (=> b!865394 t!23976))

(declare-fun b_and!24345 () Bool)

(assert (= b_and!24343 (and (=> t!23976 result!9237) b_and!24345)))

(declare-fun m!806397 () Bool)

(assert (=> b!865386 m!806397))

(declare-fun m!806399 () Bool)

(assert (=> b!865397 m!806399))

(declare-fun m!806401 () Bool)

(assert (=> b!865398 m!806401))

(declare-fun m!806403 () Bool)

(assert (=> b!865389 m!806403))

(declare-fun m!806405 () Bool)

(assert (=> b!865400 m!806405))

(declare-fun m!806407 () Bool)

(assert (=> b!865394 m!806407))

(declare-fun m!806409 () Bool)

(assert (=> b!865394 m!806409))

(declare-fun m!806411 () Bool)

(assert (=> b!865394 m!806411))

(declare-fun m!806413 () Bool)

(assert (=> b!865394 m!806413))

(assert (=> b!865394 m!806409))

(declare-fun m!806415 () Bool)

(assert (=> b!865394 m!806415))

(assert (=> b!865394 m!806411))

(declare-fun m!806417 () Bool)

(assert (=> b!865393 m!806417))

(declare-fun m!806419 () Bool)

(assert (=> b!865393 m!806419))

(declare-fun m!806421 () Bool)

(assert (=> b!865393 m!806421))

(declare-fun m!806423 () Bool)

(assert (=> b!865393 m!806423))

(declare-fun m!806425 () Bool)

(assert (=> b!865393 m!806425))

(declare-fun m!806427 () Bool)

(assert (=> b!865396 m!806427))

(declare-fun m!806429 () Bool)

(assert (=> b!865396 m!806429))

(assert (=> b!865396 m!806415))

(declare-fun m!806431 () Bool)

(assert (=> b!865396 m!806431))

(assert (=> b!865396 m!806415))

(declare-fun m!806433 () Bool)

(assert (=> b!865396 m!806433))

(declare-fun m!806435 () Bool)

(assert (=> b!865396 m!806435))

(declare-fun m!806437 () Bool)

(assert (=> b!865399 m!806437))

(declare-fun m!806439 () Bool)

(assert (=> b!865399 m!806439))

(declare-fun m!806441 () Bool)

(assert (=> b!865399 m!806441))

(declare-fun m!806443 () Bool)

(assert (=> start!73762 m!806443))

(declare-fun m!806445 () Bool)

(assert (=> start!73762 m!806445))

(declare-fun m!806447 () Bool)

(assert (=> b!865392 m!806447))

(assert (=> b!865392 m!806447))

(declare-fun m!806449 () Bool)

(assert (=> b!865392 m!806449))

(assert (=> b!865392 m!806415))

(assert (=> b!865392 m!806415))

(declare-fun m!806451 () Bool)

(assert (=> b!865392 m!806451))

(declare-fun m!806453 () Bool)

(assert (=> mapNonEmpty!26846 m!806453))

(check-sat (not b!865400) (not b!865396) (not b!865389) (not b!865399) (not b_next!14695) tp_is_empty!16831 b_and!24345 (not b_lambda!12029) (not b!865392) (not b!865394) (not b!865393) (not start!73762) (not b!865386) (not mapNonEmpty!26846) (not b!865398))
(check-sat b_and!24345 (not b_next!14695))
