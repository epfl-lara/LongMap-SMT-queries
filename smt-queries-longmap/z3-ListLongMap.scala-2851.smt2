; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41138 () Bool)

(assert start!41138)

(declare-fun b_free!11007 () Bool)

(declare-fun b_next!11007 () Bool)

(assert (=> start!41138 (= b_free!11007 (not b_next!11007))))

(declare-fun tp!38857 () Bool)

(declare-fun b_and!19253 () Bool)

(assert (=> start!41138 (= tp!38857 b_and!19253)))

(declare-fun mapNonEmpty!20167 () Bool)

(declare-fun mapRes!20167 () Bool)

(declare-fun tp!38856 () Bool)

(declare-fun e!267971 () Bool)

(assert (=> mapNonEmpty!20167 (= mapRes!20167 (and tp!38856 e!267971))))

(declare-datatypes ((V!17565 0))(
  ( (V!17566 (val!6217 Int)) )
))
(declare-datatypes ((ValueCell!5829 0))(
  ( (ValueCellFull!5829 (v!8495 V!17565)) (EmptyCell!5829) )
))
(declare-fun mapValue!20167 () ValueCell!5829)

(declare-fun mapKey!20167 () (_ BitVec 32))

(declare-datatypes ((array!28491 0))(
  ( (array!28492 (arr!13686 (Array (_ BitVec 32) ValueCell!5829)) (size!14038 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28491)

(declare-fun mapRest!20167 () (Array (_ BitVec 32) ValueCell!5829))

(assert (=> mapNonEmpty!20167 (= (arr!13686 _values!549) (store mapRest!20167 mapKey!20167 mapValue!20167))))

(declare-fun b!459047 () Bool)

(declare-fun res!274293 () Bool)

(declare-fun e!267978 () Bool)

(assert (=> b!459047 (=> (not res!274293) (not e!267978))))

(declare-datatypes ((array!28493 0))(
  ( (array!28494 (arr!13687 (Array (_ BitVec 32) (_ BitVec 64))) (size!14039 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28493)

(declare-datatypes ((List!8267 0))(
  ( (Nil!8264) (Cons!8263 (h!9119 (_ BitVec 64)) (t!14153 List!8267)) )
))
(declare-fun arrayNoDuplicates!0 (array!28493 (_ BitVec 32) List!8267) Bool)

(assert (=> b!459047 (= res!274293 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8264))))

(declare-fun res!274299 () Bool)

(assert (=> start!41138 (=> (not res!274299) (not e!267978))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!41138 (= res!274299 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14039 _keys!709))))))

(assert (=> start!41138 e!267978))

(declare-fun tp_is_empty!12345 () Bool)

(assert (=> start!41138 tp_is_empty!12345))

(assert (=> start!41138 tp!38857))

(assert (=> start!41138 true))

(declare-fun e!267972 () Bool)

(declare-fun array_inv!9904 (array!28491) Bool)

(assert (=> start!41138 (and (array_inv!9904 _values!549) e!267972)))

(declare-fun array_inv!9905 (array!28493) Bool)

(assert (=> start!41138 (array_inv!9905 _keys!709)))

(declare-fun b!459048 () Bool)

(declare-fun res!274292 () Bool)

(assert (=> b!459048 (=> (not res!274292) (not e!267978))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459048 (= res!274292 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459049 () Bool)

(declare-fun e!267976 () Bool)

(assert (=> b!459049 (= e!267976 tp_is_empty!12345)))

(declare-fun b!459050 () Bool)

(declare-fun res!274295 () Bool)

(assert (=> b!459050 (=> (not res!274295) (not e!267978))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459050 (= res!274295 (or (= (select (arr!13687 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13687 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459051 () Bool)

(declare-fun e!267974 () Bool)

(assert (=> b!459051 (= e!267978 e!267974)))

(declare-fun res!274298 () Bool)

(assert (=> b!459051 (=> (not res!274298) (not e!267974))))

(declare-fun lt!207664 () array!28493)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28493 (_ BitVec 32)) Bool)

(assert (=> b!459051 (= res!274298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207664 mask!1025))))

(assert (=> b!459051 (= lt!207664 (array!28494 (store (arr!13687 _keys!709) i!563 k0!794) (size!14039 _keys!709)))))

(declare-fun b!459052 () Bool)

(assert (=> b!459052 (= e!267971 tp_is_empty!12345)))

(declare-fun b!459053 () Bool)

(declare-fun e!267970 () Bool)

(declare-fun e!267975 () Bool)

(assert (=> b!459053 (= e!267970 (not e!267975))))

(declare-fun res!274288 () Bool)

(assert (=> b!459053 (=> res!274288 e!267975)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459053 (= res!274288 (not (validKeyInArray!0 (select (arr!13687 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8196 0))(
  ( (tuple2!8197 (_1!4109 (_ BitVec 64)) (_2!4109 V!17565)) )
))
(declare-datatypes ((List!8268 0))(
  ( (Nil!8265) (Cons!8264 (h!9120 tuple2!8196) (t!14154 List!8268)) )
))
(declare-datatypes ((ListLongMap!7109 0))(
  ( (ListLongMap!7110 (toList!3570 List!8268)) )
))
(declare-fun lt!207662 () ListLongMap!7109)

(declare-fun lt!207667 () ListLongMap!7109)

(assert (=> b!459053 (= lt!207662 lt!207667)))

(declare-fun lt!207668 () ListLongMap!7109)

(declare-fun v!412 () V!17565)

(declare-fun +!1606 (ListLongMap!7109 tuple2!8196) ListLongMap!7109)

(assert (=> b!459053 (= lt!207667 (+!1606 lt!207668 (tuple2!8197 k0!794 v!412)))))

(declare-fun minValue!515 () V!17565)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17565)

(declare-fun lt!207669 () array!28491)

(declare-fun getCurrentListMapNoExtraKeys!1751 (array!28493 array!28491 (_ BitVec 32) (_ BitVec 32) V!17565 V!17565 (_ BitVec 32) Int) ListLongMap!7109)

(assert (=> b!459053 (= lt!207662 (getCurrentListMapNoExtraKeys!1751 lt!207664 lt!207669 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459053 (= lt!207668 (getCurrentListMapNoExtraKeys!1751 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13332 0))(
  ( (Unit!13333) )
))
(declare-fun lt!207670 () Unit!13332)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!764 (array!28493 array!28491 (_ BitVec 32) (_ BitVec 32) V!17565 V!17565 (_ BitVec 32) (_ BitVec 64) V!17565 (_ BitVec 32) Int) Unit!13332)

(assert (=> b!459053 (= lt!207670 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!764 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459054 () Bool)

(declare-fun res!274300 () Bool)

(assert (=> b!459054 (=> (not res!274300) (not e!267978))))

(assert (=> b!459054 (= res!274300 (validKeyInArray!0 k0!794))))

(declare-fun b!459055 () Bool)

(declare-fun e!267973 () Unit!13332)

(declare-fun Unit!13334 () Unit!13332)

(assert (=> b!459055 (= e!267973 Unit!13334)))

(declare-fun b!459056 () Bool)

(assert (=> b!459056 (= e!267972 (and e!267976 mapRes!20167))))

(declare-fun condMapEmpty!20167 () Bool)

(declare-fun mapDefault!20167 () ValueCell!5829)

(assert (=> b!459056 (= condMapEmpty!20167 (= (arr!13686 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5829)) mapDefault!20167)))))

(declare-fun b!459057 () Bool)

(declare-fun res!274289 () Bool)

(assert (=> b!459057 (=> (not res!274289) (not e!267978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459057 (= res!274289 (validMask!0 mask!1025))))

(declare-fun b!459058 () Bool)

(declare-fun res!274290 () Bool)

(assert (=> b!459058 (=> (not res!274290) (not e!267974))))

(assert (=> b!459058 (= res!274290 (arrayNoDuplicates!0 lt!207664 #b00000000000000000000000000000000 Nil!8264))))

(declare-fun b!459059 () Bool)

(declare-fun res!274287 () Bool)

(assert (=> b!459059 (=> (not res!274287) (not e!267974))))

(assert (=> b!459059 (= res!274287 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20167 () Bool)

(assert (=> mapIsEmpty!20167 mapRes!20167))

(declare-fun b!459060 () Bool)

(assert (=> b!459060 (= e!267974 e!267970)))

(declare-fun res!274294 () Bool)

(assert (=> b!459060 (=> (not res!274294) (not e!267970))))

(assert (=> b!459060 (= res!274294 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207663 () ListLongMap!7109)

(assert (=> b!459060 (= lt!207663 (getCurrentListMapNoExtraKeys!1751 lt!207664 lt!207669 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459060 (= lt!207669 (array!28492 (store (arr!13686 _values!549) i!563 (ValueCellFull!5829 v!412)) (size!14038 _values!549)))))

(declare-fun lt!207671 () ListLongMap!7109)

(assert (=> b!459060 (= lt!207671 (getCurrentListMapNoExtraKeys!1751 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459061 () Bool)

(assert (=> b!459061 (= e!267975 (bvslt from!863 (size!14039 _keys!709)))))

(declare-fun lt!207666 () Unit!13332)

(assert (=> b!459061 (= lt!207666 e!267973)))

(declare-fun c!56459 () Bool)

(assert (=> b!459061 (= c!56459 (= (select (arr!13687 _keys!709) from!863) k0!794))))

(declare-fun get!6749 (ValueCell!5829 V!17565) V!17565)

(declare-fun dynLambda!893 (Int (_ BitVec 64)) V!17565)

(assert (=> b!459061 (= lt!207663 (+!1606 lt!207667 (tuple2!8197 (select (arr!13687 _keys!709) from!863) (get!6749 (select (arr!13686 _values!549) from!863) (dynLambda!893 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459062 () Bool)

(declare-fun res!274291 () Bool)

(assert (=> b!459062 (=> (not res!274291) (not e!267978))))

(assert (=> b!459062 (= res!274291 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14039 _keys!709))))))

(declare-fun b!459063 () Bool)

(declare-fun Unit!13335 () Unit!13332)

(assert (=> b!459063 (= e!267973 Unit!13335)))

(declare-fun lt!207665 () Unit!13332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28493 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13332)

(assert (=> b!459063 (= lt!207665 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459063 false))

(declare-fun b!459064 () Bool)

(declare-fun res!274297 () Bool)

(assert (=> b!459064 (=> (not res!274297) (not e!267978))))

(assert (=> b!459064 (= res!274297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459065 () Bool)

(declare-fun res!274296 () Bool)

(assert (=> b!459065 (=> (not res!274296) (not e!267978))))

(assert (=> b!459065 (= res!274296 (and (= (size!14038 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14039 _keys!709) (size!14038 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!41138 res!274299) b!459057))

(assert (= (and b!459057 res!274289) b!459065))

(assert (= (and b!459065 res!274296) b!459064))

(assert (= (and b!459064 res!274297) b!459047))

(assert (= (and b!459047 res!274293) b!459062))

(assert (= (and b!459062 res!274291) b!459054))

(assert (= (and b!459054 res!274300) b!459050))

(assert (= (and b!459050 res!274295) b!459048))

(assert (= (and b!459048 res!274292) b!459051))

(assert (= (and b!459051 res!274298) b!459058))

(assert (= (and b!459058 res!274290) b!459059))

(assert (= (and b!459059 res!274287) b!459060))

(assert (= (and b!459060 res!274294) b!459053))

(assert (= (and b!459053 (not res!274288)) b!459061))

(assert (= (and b!459061 c!56459) b!459063))

(assert (= (and b!459061 (not c!56459)) b!459055))

(assert (= (and b!459056 condMapEmpty!20167) mapIsEmpty!20167))

(assert (= (and b!459056 (not condMapEmpty!20167)) mapNonEmpty!20167))

(get-info :version)

(assert (= (and mapNonEmpty!20167 ((_ is ValueCellFull!5829) mapValue!20167)) b!459052))

(assert (= (and b!459056 ((_ is ValueCellFull!5829) mapDefault!20167)) b!459049))

(assert (= start!41138 b!459056))

(declare-fun b_lambda!9841 () Bool)

(assert (=> (not b_lambda!9841) (not b!459061)))

(declare-fun t!14152 () Bool)

(declare-fun tb!3843 () Bool)

(assert (=> (and start!41138 (= defaultEntry!557 defaultEntry!557) t!14152) tb!3843))

(declare-fun result!7231 () Bool)

(assert (=> tb!3843 (= result!7231 tp_is_empty!12345)))

(assert (=> b!459061 t!14152))

(declare-fun b_and!19255 () Bool)

(assert (= b_and!19253 (and (=> t!14152 result!7231) b_and!19255)))

(declare-fun m!442375 () Bool)

(assert (=> b!459053 m!442375))

(declare-fun m!442377 () Bool)

(assert (=> b!459053 m!442377))

(declare-fun m!442379 () Bool)

(assert (=> b!459053 m!442379))

(declare-fun m!442381 () Bool)

(assert (=> b!459053 m!442381))

(declare-fun m!442383 () Bool)

(assert (=> b!459053 m!442383))

(declare-fun m!442385 () Bool)

(assert (=> b!459053 m!442385))

(assert (=> b!459053 m!442379))

(declare-fun m!442387 () Bool)

(assert (=> b!459057 m!442387))

(declare-fun m!442389 () Bool)

(assert (=> mapNonEmpty!20167 m!442389))

(declare-fun m!442391 () Bool)

(assert (=> start!41138 m!442391))

(declare-fun m!442393 () Bool)

(assert (=> start!41138 m!442393))

(declare-fun m!442395 () Bool)

(assert (=> b!459050 m!442395))

(declare-fun m!442397 () Bool)

(assert (=> b!459064 m!442397))

(declare-fun m!442399 () Bool)

(assert (=> b!459051 m!442399))

(declare-fun m!442401 () Bool)

(assert (=> b!459051 m!442401))

(assert (=> b!459061 m!442379))

(declare-fun m!442403 () Bool)

(assert (=> b!459061 m!442403))

(declare-fun m!442405 () Bool)

(assert (=> b!459061 m!442405))

(declare-fun m!442407 () Bool)

(assert (=> b!459061 m!442407))

(assert (=> b!459061 m!442407))

(assert (=> b!459061 m!442405))

(declare-fun m!442409 () Bool)

(assert (=> b!459061 m!442409))

(declare-fun m!442411 () Bool)

(assert (=> b!459054 m!442411))

(declare-fun m!442413 () Bool)

(assert (=> b!459048 m!442413))

(declare-fun m!442415 () Bool)

(assert (=> b!459058 m!442415))

(declare-fun m!442417 () Bool)

(assert (=> b!459063 m!442417))

(declare-fun m!442419 () Bool)

(assert (=> b!459060 m!442419))

(declare-fun m!442421 () Bool)

(assert (=> b!459060 m!442421))

(declare-fun m!442423 () Bool)

(assert (=> b!459060 m!442423))

(declare-fun m!442425 () Bool)

(assert (=> b!459047 m!442425))

(check-sat (not start!41138) b_and!19255 tp_is_empty!12345 (not b!459053) (not b!459061) (not b!459047) (not b!459054) (not b!459063) (not b_next!11007) (not b!459064) (not b!459051) (not b!459058) (not mapNonEmpty!20167) (not b!459060) (not b!459057) (not b_lambda!9841) (not b!459048))
(check-sat b_and!19255 (not b_next!11007))
