; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41176 () Bool)

(assert start!41176)

(declare-fun b_free!11059 () Bool)

(declare-fun b_next!11059 () Bool)

(assert (=> start!41176 (= b_free!11059 (not b_next!11059))))

(declare-fun tp!39013 () Bool)

(declare-fun b_and!19331 () Bool)

(assert (=> start!41176 (= tp!39013 b_and!19331)))

(declare-fun b!460348 () Bool)

(declare-fun e!268538 () Bool)

(declare-fun tp_is_empty!12397 () Bool)

(assert (=> b!460348 (= e!268538 tp_is_empty!12397)))

(declare-fun res!275289 () Bool)

(declare-fun e!268543 () Bool)

(assert (=> start!41176 (=> (not res!275289) (not e!268543))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28589 0))(
  ( (array!28590 (arr!13735 (Array (_ BitVec 32) (_ BitVec 64))) (size!14088 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28589)

(assert (=> start!41176 (= res!275289 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14088 _keys!709))))))

(assert (=> start!41176 e!268543))

(assert (=> start!41176 tp_is_empty!12397))

(assert (=> start!41176 tp!39013))

(assert (=> start!41176 true))

(declare-datatypes ((V!17635 0))(
  ( (V!17636 (val!6243 Int)) )
))
(declare-datatypes ((ValueCell!5855 0))(
  ( (ValueCellFull!5855 (v!8515 V!17635)) (EmptyCell!5855) )
))
(declare-datatypes ((array!28591 0))(
  ( (array!28592 (arr!13736 (Array (_ BitVec 32) ValueCell!5855)) (size!14089 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28591)

(declare-fun e!268537 () Bool)

(declare-fun array_inv!9996 (array!28591) Bool)

(assert (=> start!41176 (and (array_inv!9996 _values!549) e!268537)))

(declare-fun array_inv!9997 (array!28589) Bool)

(assert (=> start!41176 (array_inv!9997 _keys!709)))

(declare-fun b!460349 () Bool)

(declare-fun res!275302 () Bool)

(assert (=> b!460349 (=> (not res!275302) (not e!268543))))

(declare-datatypes ((List!8327 0))(
  ( (Nil!8324) (Cons!8323 (h!9179 (_ BitVec 64)) (t!14256 List!8327)) )
))
(declare-fun arrayNoDuplicates!0 (array!28589 (_ BitVec 32) List!8327) Bool)

(assert (=> b!460349 (= res!275302 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8324))))

(declare-fun b!460350 () Bool)

(declare-fun res!275301 () Bool)

(assert (=> b!460350 (=> (not res!275301) (not e!268543))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460350 (= res!275301 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!20245 () Bool)

(declare-fun mapRes!20245 () Bool)

(assert (=> mapIsEmpty!20245 mapRes!20245))

(declare-fun b!460351 () Bool)

(declare-datatypes ((Unit!13378 0))(
  ( (Unit!13379) )
))
(declare-fun e!268542 () Unit!13378)

(declare-fun Unit!13380 () Unit!13378)

(assert (=> b!460351 (= e!268542 Unit!13380)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!208399 () Unit!13378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28589 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13378)

(assert (=> b!460351 (= lt!208399 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460351 false))

(declare-fun b!460352 () Bool)

(declare-fun e!268539 () Bool)

(declare-fun e!268545 () Bool)

(assert (=> b!460352 (= e!268539 (not e!268545))))

(declare-fun res!275300 () Bool)

(assert (=> b!460352 (=> res!275300 e!268545)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460352 (= res!275300 (not (validKeyInArray!0 (select (arr!13735 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8266 0))(
  ( (tuple2!8267 (_1!4144 (_ BitVec 64)) (_2!4144 V!17635)) )
))
(declare-datatypes ((List!8328 0))(
  ( (Nil!8325) (Cons!8324 (h!9180 tuple2!8266) (t!14257 List!8328)) )
))
(declare-datatypes ((ListLongMap!7169 0))(
  ( (ListLongMap!7170 (toList!3600 List!8328)) )
))
(declare-fun lt!208410 () ListLongMap!7169)

(declare-fun lt!208412 () ListLongMap!7169)

(assert (=> b!460352 (= lt!208410 lt!208412)))

(declare-fun lt!208405 () ListLongMap!7169)

(declare-fun lt!208404 () tuple2!8266)

(declare-fun +!1652 (ListLongMap!7169 tuple2!8266) ListLongMap!7169)

(assert (=> b!460352 (= lt!208412 (+!1652 lt!208405 lt!208404))))

(declare-fun minValue!515 () V!17635)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17635)

(declare-fun lt!208401 () array!28591)

(declare-fun lt!208398 () array!28589)

(declare-fun getCurrentListMapNoExtraKeys!1792 (array!28589 array!28591 (_ BitVec 32) (_ BitVec 32) V!17635 V!17635 (_ BitVec 32) Int) ListLongMap!7169)

(assert (=> b!460352 (= lt!208410 (getCurrentListMapNoExtraKeys!1792 lt!208398 lt!208401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!17635)

(assert (=> b!460352 (= lt!208404 (tuple2!8267 k0!794 v!412))))

(assert (=> b!460352 (= lt!208405 (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!208402 () Unit!13378)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!782 (array!28589 array!28591 (_ BitVec 32) (_ BitVec 32) V!17635 V!17635 (_ BitVec 32) (_ BitVec 64) V!17635 (_ BitVec 32) Int) Unit!13378)

(assert (=> b!460352 (= lt!208402 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460353 () Bool)

(declare-fun res!275297 () Bool)

(declare-fun e!268540 () Bool)

(assert (=> b!460353 (=> (not res!275297) (not e!268540))))

(assert (=> b!460353 (= res!275297 (arrayNoDuplicates!0 lt!208398 #b00000000000000000000000000000000 Nil!8324))))

(declare-fun b!460354 () Bool)

(declare-fun res!275293 () Bool)

(assert (=> b!460354 (=> (not res!275293) (not e!268543))))

(assert (=> b!460354 (= res!275293 (or (= (select (arr!13735 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13735 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460355 () Bool)

(declare-fun lt!208403 () ListLongMap!7169)

(declare-fun e!268536 () Bool)

(declare-fun lt!208409 () ListLongMap!7169)

(assert (=> b!460355 (= e!268536 (= lt!208403 (+!1652 lt!208409 lt!208404)))))

(declare-fun lt!208406 () ListLongMap!7169)

(declare-fun lt!208411 () tuple2!8266)

(assert (=> b!460355 (= lt!208406 (+!1652 (+!1652 lt!208405 lt!208411) lt!208404))))

(declare-fun lt!208408 () Unit!13378)

(declare-fun lt!208400 () V!17635)

(declare-fun addCommutativeForDiffKeys!431 (ListLongMap!7169 (_ BitVec 64) V!17635 (_ BitVec 64) V!17635) Unit!13378)

(assert (=> b!460355 (= lt!208408 (addCommutativeForDiffKeys!431 lt!208405 k0!794 v!412 (select (arr!13735 _keys!709) from!863) lt!208400))))

(declare-fun b!460356 () Bool)

(declare-fun res!275290 () Bool)

(assert (=> b!460356 (=> (not res!275290) (not e!268543))))

(assert (=> b!460356 (= res!275290 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14088 _keys!709))))))

(declare-fun b!460357 () Bool)

(assert (=> b!460357 (= e!268540 e!268539)))

(declare-fun res!275292 () Bool)

(assert (=> b!460357 (=> (not res!275292) (not e!268539))))

(assert (=> b!460357 (= res!275292 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!460357 (= lt!208403 (getCurrentListMapNoExtraKeys!1792 lt!208398 lt!208401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460357 (= lt!208401 (array!28592 (store (arr!13736 _values!549) i!563 (ValueCellFull!5855 v!412)) (size!14089 _values!549)))))

(assert (=> b!460357 (= lt!208409 (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460358 () Bool)

(declare-fun res!275295 () Bool)

(assert (=> b!460358 (=> (not res!275295) (not e!268543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28589 (_ BitVec 32)) Bool)

(assert (=> b!460358 (= res!275295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460359 () Bool)

(assert (=> b!460359 (= e!268545 e!268536)))

(declare-fun res!275298 () Bool)

(assert (=> b!460359 (=> res!275298 e!268536)))

(assert (=> b!460359 (= res!275298 (= k0!794 (select (arr!13735 _keys!709) from!863)))))

(assert (=> b!460359 (not (= (select (arr!13735 _keys!709) from!863) k0!794))))

(declare-fun lt!208407 () Unit!13378)

(assert (=> b!460359 (= lt!208407 e!268542)))

(declare-fun c!56466 () Bool)

(assert (=> b!460359 (= c!56466 (= (select (arr!13735 _keys!709) from!863) k0!794))))

(assert (=> b!460359 (= lt!208403 lt!208406)))

(assert (=> b!460359 (= lt!208406 (+!1652 lt!208412 lt!208411))))

(assert (=> b!460359 (= lt!208411 (tuple2!8267 (select (arr!13735 _keys!709) from!863) lt!208400))))

(declare-fun get!6788 (ValueCell!5855 V!17635) V!17635)

(declare-fun dynLambda!911 (Int (_ BitVec 64)) V!17635)

(assert (=> b!460359 (= lt!208400 (get!6788 (select (arr!13736 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460360 () Bool)

(declare-fun e!268541 () Bool)

(assert (=> b!460360 (= e!268537 (and e!268541 mapRes!20245))))

(declare-fun condMapEmpty!20245 () Bool)

(declare-fun mapDefault!20245 () ValueCell!5855)

(assert (=> b!460360 (= condMapEmpty!20245 (= (arr!13736 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5855)) mapDefault!20245)))))

(declare-fun b!460361 () Bool)

(declare-fun res!275291 () Bool)

(assert (=> b!460361 (=> (not res!275291) (not e!268540))))

(assert (=> b!460361 (= res!275291 (bvsle from!863 i!563))))

(declare-fun b!460362 () Bool)

(declare-fun res!275294 () Bool)

(assert (=> b!460362 (=> (not res!275294) (not e!268543))))

(assert (=> b!460362 (= res!275294 (validKeyInArray!0 k0!794))))

(declare-fun b!460363 () Bool)

(declare-fun res!275299 () Bool)

(assert (=> b!460363 (=> (not res!275299) (not e!268543))))

(assert (=> b!460363 (= res!275299 (and (= (size!14089 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14088 _keys!709) (size!14089 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460364 () Bool)

(declare-fun res!275296 () Bool)

(assert (=> b!460364 (=> (not res!275296) (not e!268543))))

(declare-fun arrayContainsKey!0 (array!28589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460364 (= res!275296 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460365 () Bool)

(declare-fun Unit!13381 () Unit!13378)

(assert (=> b!460365 (= e!268542 Unit!13381)))

(declare-fun b!460366 () Bool)

(assert (=> b!460366 (= e!268541 tp_is_empty!12397)))

(declare-fun b!460367 () Bool)

(assert (=> b!460367 (= e!268543 e!268540)))

(declare-fun res!275288 () Bool)

(assert (=> b!460367 (=> (not res!275288) (not e!268540))))

(assert (=> b!460367 (= res!275288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208398 mask!1025))))

(assert (=> b!460367 (= lt!208398 (array!28590 (store (arr!13735 _keys!709) i!563 k0!794) (size!14088 _keys!709)))))

(declare-fun mapNonEmpty!20245 () Bool)

(declare-fun tp!39012 () Bool)

(assert (=> mapNonEmpty!20245 (= mapRes!20245 (and tp!39012 e!268538))))

(declare-fun mapValue!20245 () ValueCell!5855)

(declare-fun mapRest!20245 () (Array (_ BitVec 32) ValueCell!5855))

(declare-fun mapKey!20245 () (_ BitVec 32))

(assert (=> mapNonEmpty!20245 (= (arr!13736 _values!549) (store mapRest!20245 mapKey!20245 mapValue!20245))))

(assert (= (and start!41176 res!275289) b!460350))

(assert (= (and b!460350 res!275301) b!460363))

(assert (= (and b!460363 res!275299) b!460358))

(assert (= (and b!460358 res!275295) b!460349))

(assert (= (and b!460349 res!275302) b!460356))

(assert (= (and b!460356 res!275290) b!460362))

(assert (= (and b!460362 res!275294) b!460354))

(assert (= (and b!460354 res!275293) b!460364))

(assert (= (and b!460364 res!275296) b!460367))

(assert (= (and b!460367 res!275288) b!460353))

(assert (= (and b!460353 res!275297) b!460361))

(assert (= (and b!460361 res!275291) b!460357))

(assert (= (and b!460357 res!275292) b!460352))

(assert (= (and b!460352 (not res!275300)) b!460359))

(assert (= (and b!460359 c!56466) b!460351))

(assert (= (and b!460359 (not c!56466)) b!460365))

(assert (= (and b!460359 (not res!275298)) b!460355))

(assert (= (and b!460360 condMapEmpty!20245) mapIsEmpty!20245))

(assert (= (and b!460360 (not condMapEmpty!20245)) mapNonEmpty!20245))

(get-info :version)

(assert (= (and mapNonEmpty!20245 ((_ is ValueCellFull!5855) mapValue!20245)) b!460348))

(assert (= (and b!460360 ((_ is ValueCellFull!5855) mapDefault!20245)) b!460366))

(assert (= start!41176 b!460360))

(declare-fun b_lambda!9875 () Bool)

(assert (=> (not b_lambda!9875) (not b!460359)))

(declare-fun t!14255 () Bool)

(declare-fun tb!3887 () Bool)

(assert (=> (and start!41176 (= defaultEntry!557 defaultEntry!557) t!14255) tb!3887))

(declare-fun result!7327 () Bool)

(assert (=> tb!3887 (= result!7327 tp_is_empty!12397)))

(assert (=> b!460359 t!14255))

(declare-fun b_and!19333 () Bool)

(assert (= b_and!19331 (and (=> t!14255 result!7327) b_and!19333)))

(declare-fun m!443065 () Bool)

(assert (=> start!41176 m!443065))

(declare-fun m!443067 () Bool)

(assert (=> start!41176 m!443067))

(declare-fun m!443069 () Bool)

(assert (=> b!460352 m!443069))

(declare-fun m!443071 () Bool)

(assert (=> b!460352 m!443071))

(declare-fun m!443073 () Bool)

(assert (=> b!460352 m!443073))

(declare-fun m!443075 () Bool)

(assert (=> b!460352 m!443075))

(declare-fun m!443077 () Bool)

(assert (=> b!460352 m!443077))

(assert (=> b!460352 m!443069))

(declare-fun m!443079 () Bool)

(assert (=> b!460352 m!443079))

(declare-fun m!443081 () Bool)

(assert (=> b!460353 m!443081))

(declare-fun m!443083 () Bool)

(assert (=> b!460364 m!443083))

(declare-fun m!443085 () Bool)

(assert (=> b!460354 m!443085))

(declare-fun m!443087 () Bool)

(assert (=> b!460357 m!443087))

(declare-fun m!443089 () Bool)

(assert (=> b!460357 m!443089))

(declare-fun m!443091 () Bool)

(assert (=> b!460357 m!443091))

(assert (=> b!460359 m!443069))

(declare-fun m!443093 () Bool)

(assert (=> b!460359 m!443093))

(declare-fun m!443095 () Bool)

(assert (=> b!460359 m!443095))

(assert (=> b!460359 m!443095))

(assert (=> b!460359 m!443093))

(declare-fun m!443097 () Bool)

(assert (=> b!460359 m!443097))

(declare-fun m!443099 () Bool)

(assert (=> b!460359 m!443099))

(declare-fun m!443101 () Bool)

(assert (=> b!460355 m!443101))

(declare-fun m!443103 () Bool)

(assert (=> b!460355 m!443103))

(assert (=> b!460355 m!443069))

(declare-fun m!443105 () Bool)

(assert (=> b!460355 m!443105))

(assert (=> b!460355 m!443069))

(assert (=> b!460355 m!443101))

(declare-fun m!443107 () Bool)

(assert (=> b!460355 m!443107))

(declare-fun m!443109 () Bool)

(assert (=> b!460367 m!443109))

(declare-fun m!443111 () Bool)

(assert (=> b!460367 m!443111))

(declare-fun m!443113 () Bool)

(assert (=> mapNonEmpty!20245 m!443113))

(declare-fun m!443115 () Bool)

(assert (=> b!460349 m!443115))

(declare-fun m!443117 () Bool)

(assert (=> b!460351 m!443117))

(declare-fun m!443119 () Bool)

(assert (=> b!460350 m!443119))

(declare-fun m!443121 () Bool)

(assert (=> b!460362 m!443121))

(declare-fun m!443123 () Bool)

(assert (=> b!460358 m!443123))

(check-sat (not b!460353) (not b!460359) (not b!460355) (not b!460352) (not b!460357) (not b!460364) tp_is_empty!12397 (not b_next!11059) (not b!460367) (not mapNonEmpty!20245) (not b!460350) (not start!41176) (not b_lambda!9875) (not b!460349) b_and!19333 (not b!460362) (not b!460351) (not b!460358))
(check-sat b_and!19333 (not b_next!11059))
(get-model)

(declare-fun b_lambda!9881 () Bool)

(assert (= b_lambda!9875 (or (and start!41176 b_free!11059) b_lambda!9881)))

(check-sat (not b!460349) (not b!460353) (not b!460359) (not b!460355) (not b!460352) (not b!460357) (not b!460364) tp_is_empty!12397 (not b_lambda!9881) (not b_next!11059) (not b!460367) (not mapNonEmpty!20245) (not b!460350) (not start!41176) b_and!19333 (not b!460362) (not b!460351) (not b!460358))
(check-sat b_and!19333 (not b_next!11059))
(get-model)

(declare-fun d!74605 () Bool)

(declare-fun e!268608 () Bool)

(assert (=> d!74605 e!268608))

(declare-fun res!275398 () Bool)

(assert (=> d!74605 (=> (not res!275398) (not e!268608))))

(declare-fun lt!208513 () ListLongMap!7169)

(declare-fun contains!2498 (ListLongMap!7169 (_ BitVec 64)) Bool)

(assert (=> d!74605 (= res!275398 (contains!2498 lt!208513 (_1!4144 lt!208404)))))

(declare-fun lt!208512 () List!8328)

(assert (=> d!74605 (= lt!208513 (ListLongMap!7170 lt!208512))))

(declare-fun lt!208511 () Unit!13378)

(declare-fun lt!208514 () Unit!13378)

(assert (=> d!74605 (= lt!208511 lt!208514)))

(declare-datatypes ((Option!378 0))(
  ( (Some!377 (v!8521 V!17635)) (None!376) )
))
(declare-fun getValueByKey!372 (List!8328 (_ BitVec 64)) Option!378)

(assert (=> d!74605 (= (getValueByKey!372 lt!208512 (_1!4144 lt!208404)) (Some!377 (_2!4144 lt!208404)))))

(declare-fun lemmaContainsTupThenGetReturnValue!197 (List!8328 (_ BitVec 64) V!17635) Unit!13378)

(assert (=> d!74605 (= lt!208514 (lemmaContainsTupThenGetReturnValue!197 lt!208512 (_1!4144 lt!208404) (_2!4144 lt!208404)))))

(declare-fun insertStrictlySorted!200 (List!8328 (_ BitVec 64) V!17635) List!8328)

(assert (=> d!74605 (= lt!208512 (insertStrictlySorted!200 (toList!3600 lt!208409) (_1!4144 lt!208404) (_2!4144 lt!208404)))))

(assert (=> d!74605 (= (+!1652 lt!208409 lt!208404) lt!208513)))

(declare-fun b!460498 () Bool)

(declare-fun res!275397 () Bool)

(assert (=> b!460498 (=> (not res!275397) (not e!268608))))

(assert (=> b!460498 (= res!275397 (= (getValueByKey!372 (toList!3600 lt!208513) (_1!4144 lt!208404)) (Some!377 (_2!4144 lt!208404))))))

(declare-fun b!460499 () Bool)

(declare-fun contains!2499 (List!8328 tuple2!8266) Bool)

(assert (=> b!460499 (= e!268608 (contains!2499 (toList!3600 lt!208513) lt!208404))))

(assert (= (and d!74605 res!275398) b!460498))

(assert (= (and b!460498 res!275397) b!460499))

(declare-fun m!443245 () Bool)

(assert (=> d!74605 m!443245))

(declare-fun m!443247 () Bool)

(assert (=> d!74605 m!443247))

(declare-fun m!443249 () Bool)

(assert (=> d!74605 m!443249))

(declare-fun m!443251 () Bool)

(assert (=> d!74605 m!443251))

(declare-fun m!443253 () Bool)

(assert (=> b!460498 m!443253))

(declare-fun m!443255 () Bool)

(assert (=> b!460499 m!443255))

(assert (=> b!460355 d!74605))

(declare-fun d!74607 () Bool)

(declare-fun e!268609 () Bool)

(assert (=> d!74607 e!268609))

(declare-fun res!275400 () Bool)

(assert (=> d!74607 (=> (not res!275400) (not e!268609))))

(declare-fun lt!208517 () ListLongMap!7169)

(assert (=> d!74607 (= res!275400 (contains!2498 lt!208517 (_1!4144 lt!208404)))))

(declare-fun lt!208516 () List!8328)

(assert (=> d!74607 (= lt!208517 (ListLongMap!7170 lt!208516))))

(declare-fun lt!208515 () Unit!13378)

(declare-fun lt!208518 () Unit!13378)

(assert (=> d!74607 (= lt!208515 lt!208518)))

(assert (=> d!74607 (= (getValueByKey!372 lt!208516 (_1!4144 lt!208404)) (Some!377 (_2!4144 lt!208404)))))

(assert (=> d!74607 (= lt!208518 (lemmaContainsTupThenGetReturnValue!197 lt!208516 (_1!4144 lt!208404) (_2!4144 lt!208404)))))

(assert (=> d!74607 (= lt!208516 (insertStrictlySorted!200 (toList!3600 (+!1652 lt!208405 lt!208411)) (_1!4144 lt!208404) (_2!4144 lt!208404)))))

(assert (=> d!74607 (= (+!1652 (+!1652 lt!208405 lt!208411) lt!208404) lt!208517)))

(declare-fun b!460500 () Bool)

(declare-fun res!275399 () Bool)

(assert (=> b!460500 (=> (not res!275399) (not e!268609))))

(assert (=> b!460500 (= res!275399 (= (getValueByKey!372 (toList!3600 lt!208517) (_1!4144 lt!208404)) (Some!377 (_2!4144 lt!208404))))))

(declare-fun b!460501 () Bool)

(assert (=> b!460501 (= e!268609 (contains!2499 (toList!3600 lt!208517) lt!208404))))

(assert (= (and d!74607 res!275400) b!460500))

(assert (= (and b!460500 res!275399) b!460501))

(declare-fun m!443257 () Bool)

(assert (=> d!74607 m!443257))

(declare-fun m!443259 () Bool)

(assert (=> d!74607 m!443259))

(declare-fun m!443261 () Bool)

(assert (=> d!74607 m!443261))

(declare-fun m!443263 () Bool)

(assert (=> d!74607 m!443263))

(declare-fun m!443265 () Bool)

(assert (=> b!460500 m!443265))

(declare-fun m!443267 () Bool)

(assert (=> b!460501 m!443267))

(assert (=> b!460355 d!74607))

(declare-fun d!74609 () Bool)

(declare-fun e!268610 () Bool)

(assert (=> d!74609 e!268610))

(declare-fun res!275402 () Bool)

(assert (=> d!74609 (=> (not res!275402) (not e!268610))))

(declare-fun lt!208521 () ListLongMap!7169)

(assert (=> d!74609 (= res!275402 (contains!2498 lt!208521 (_1!4144 lt!208411)))))

(declare-fun lt!208520 () List!8328)

(assert (=> d!74609 (= lt!208521 (ListLongMap!7170 lt!208520))))

(declare-fun lt!208519 () Unit!13378)

(declare-fun lt!208522 () Unit!13378)

(assert (=> d!74609 (= lt!208519 lt!208522)))

(assert (=> d!74609 (= (getValueByKey!372 lt!208520 (_1!4144 lt!208411)) (Some!377 (_2!4144 lt!208411)))))

(assert (=> d!74609 (= lt!208522 (lemmaContainsTupThenGetReturnValue!197 lt!208520 (_1!4144 lt!208411) (_2!4144 lt!208411)))))

(assert (=> d!74609 (= lt!208520 (insertStrictlySorted!200 (toList!3600 lt!208405) (_1!4144 lt!208411) (_2!4144 lt!208411)))))

(assert (=> d!74609 (= (+!1652 lt!208405 lt!208411) lt!208521)))

(declare-fun b!460502 () Bool)

(declare-fun res!275401 () Bool)

(assert (=> b!460502 (=> (not res!275401) (not e!268610))))

(assert (=> b!460502 (= res!275401 (= (getValueByKey!372 (toList!3600 lt!208521) (_1!4144 lt!208411)) (Some!377 (_2!4144 lt!208411))))))

(declare-fun b!460503 () Bool)

(assert (=> b!460503 (= e!268610 (contains!2499 (toList!3600 lt!208521) lt!208411))))

(assert (= (and d!74609 res!275402) b!460502))

(assert (= (and b!460502 res!275401) b!460503))

(declare-fun m!443269 () Bool)

(assert (=> d!74609 m!443269))

(declare-fun m!443271 () Bool)

(assert (=> d!74609 m!443271))

(declare-fun m!443273 () Bool)

(assert (=> d!74609 m!443273))

(declare-fun m!443275 () Bool)

(assert (=> d!74609 m!443275))

(declare-fun m!443277 () Bool)

(assert (=> b!460502 m!443277))

(declare-fun m!443279 () Bool)

(assert (=> b!460503 m!443279))

(assert (=> b!460355 d!74609))

(declare-fun d!74611 () Bool)

(assert (=> d!74611 (= (+!1652 (+!1652 lt!208405 (tuple2!8267 k0!794 v!412)) (tuple2!8267 (select (arr!13735 _keys!709) from!863) lt!208400)) (+!1652 (+!1652 lt!208405 (tuple2!8267 (select (arr!13735 _keys!709) from!863) lt!208400)) (tuple2!8267 k0!794 v!412)))))

(declare-fun lt!208525 () Unit!13378)

(declare-fun choose!1341 (ListLongMap!7169 (_ BitVec 64) V!17635 (_ BitVec 64) V!17635) Unit!13378)

(assert (=> d!74611 (= lt!208525 (choose!1341 lt!208405 k0!794 v!412 (select (arr!13735 _keys!709) from!863) lt!208400))))

(assert (=> d!74611 (not (= k0!794 (select (arr!13735 _keys!709) from!863)))))

(assert (=> d!74611 (= (addCommutativeForDiffKeys!431 lt!208405 k0!794 v!412 (select (arr!13735 _keys!709) from!863) lt!208400) lt!208525)))

(declare-fun bs!14515 () Bool)

(assert (= bs!14515 d!74611))

(declare-fun m!443281 () Bool)

(assert (=> bs!14515 m!443281))

(declare-fun m!443283 () Bool)

(assert (=> bs!14515 m!443283))

(declare-fun m!443285 () Bool)

(assert (=> bs!14515 m!443285))

(declare-fun m!443287 () Bool)

(assert (=> bs!14515 m!443287))

(assert (=> bs!14515 m!443285))

(assert (=> bs!14515 m!443281))

(assert (=> bs!14515 m!443069))

(declare-fun m!443289 () Bool)

(assert (=> bs!14515 m!443289))

(assert (=> b!460355 d!74611))

(declare-fun d!74613 () Bool)

(declare-fun res!275408 () Bool)

(declare-fun e!268619 () Bool)

(assert (=> d!74613 (=> res!275408 e!268619)))

(assert (=> d!74613 (= res!275408 (bvsge #b00000000000000000000000000000000 (size!14088 lt!208398)))))

(assert (=> d!74613 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208398 mask!1025) e!268619)))

(declare-fun b!460512 () Bool)

(declare-fun e!268617 () Bool)

(declare-fun call!30129 () Bool)

(assert (=> b!460512 (= e!268617 call!30129)))

(declare-fun b!460513 () Bool)

(declare-fun e!268618 () Bool)

(assert (=> b!460513 (= e!268619 e!268618)))

(declare-fun c!56475 () Bool)

(assert (=> b!460513 (= c!56475 (validKeyInArray!0 (select (arr!13735 lt!208398) #b00000000000000000000000000000000)))))

(declare-fun bm!30126 () Bool)

(assert (=> bm!30126 (= call!30129 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!208398 mask!1025))))

(declare-fun b!460514 () Bool)

(assert (=> b!460514 (= e!268618 e!268617)))

(declare-fun lt!208532 () (_ BitVec 64))

(assert (=> b!460514 (= lt!208532 (select (arr!13735 lt!208398) #b00000000000000000000000000000000))))

(declare-fun lt!208533 () Unit!13378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28589 (_ BitVec 64) (_ BitVec 32)) Unit!13378)

(assert (=> b!460514 (= lt!208533 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!208398 lt!208532 #b00000000000000000000000000000000))))

(assert (=> b!460514 (arrayContainsKey!0 lt!208398 lt!208532 #b00000000000000000000000000000000)))

(declare-fun lt!208534 () Unit!13378)

(assert (=> b!460514 (= lt!208534 lt!208533)))

(declare-fun res!275407 () Bool)

(declare-datatypes ((SeekEntryResult!3531 0))(
  ( (MissingZero!3531 (index!16303 (_ BitVec 32))) (Found!3531 (index!16304 (_ BitVec 32))) (Intermediate!3531 (undefined!4343 Bool) (index!16305 (_ BitVec 32)) (x!42961 (_ BitVec 32))) (Undefined!3531) (MissingVacant!3531 (index!16306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28589 (_ BitVec 32)) SeekEntryResult!3531)

(assert (=> b!460514 (= res!275407 (= (seekEntryOrOpen!0 (select (arr!13735 lt!208398) #b00000000000000000000000000000000) lt!208398 mask!1025) (Found!3531 #b00000000000000000000000000000000)))))

(assert (=> b!460514 (=> (not res!275407) (not e!268617))))

(declare-fun b!460515 () Bool)

(assert (=> b!460515 (= e!268618 call!30129)))

(assert (= (and d!74613 (not res!275408)) b!460513))

(assert (= (and b!460513 c!56475) b!460514))

(assert (= (and b!460513 (not c!56475)) b!460515))

(assert (= (and b!460514 res!275407) b!460512))

(assert (= (or b!460512 b!460515) bm!30126))

(declare-fun m!443291 () Bool)

(assert (=> b!460513 m!443291))

(assert (=> b!460513 m!443291))

(declare-fun m!443293 () Bool)

(assert (=> b!460513 m!443293))

(declare-fun m!443295 () Bool)

(assert (=> bm!30126 m!443295))

(assert (=> b!460514 m!443291))

(declare-fun m!443297 () Bool)

(assert (=> b!460514 m!443297))

(declare-fun m!443299 () Bool)

(assert (=> b!460514 m!443299))

(assert (=> b!460514 m!443291))

(declare-fun m!443301 () Bool)

(assert (=> b!460514 m!443301))

(assert (=> b!460367 d!74613))

(declare-fun d!74615 () Bool)

(assert (=> d!74615 (= (array_inv!9996 _values!549) (bvsge (size!14089 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41176 d!74615))

(declare-fun d!74617 () Bool)

(assert (=> d!74617 (= (array_inv!9997 _keys!709) (bvsge (size!14088 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41176 d!74617))

(declare-fun b!460540 () Bool)

(declare-fun e!268638 () Bool)

(declare-fun lt!208555 () ListLongMap!7169)

(declare-fun isEmpty!568 (ListLongMap!7169) Bool)

(assert (=> b!460540 (= e!268638 (isEmpty!568 lt!208555))))

(declare-fun b!460541 () Bool)

(declare-fun lt!208549 () Unit!13378)

(declare-fun lt!208551 () Unit!13378)

(assert (=> b!460541 (= lt!208549 lt!208551)))

(declare-fun lt!208550 () (_ BitVec 64))

(declare-fun lt!208552 () (_ BitVec 64))

(declare-fun lt!208554 () V!17635)

(declare-fun lt!208553 () ListLongMap!7169)

(assert (=> b!460541 (not (contains!2498 (+!1652 lt!208553 (tuple2!8267 lt!208552 lt!208554)) lt!208550))))

(declare-fun addStillNotContains!151 (ListLongMap!7169 (_ BitVec 64) V!17635 (_ BitVec 64)) Unit!13378)

(assert (=> b!460541 (= lt!208551 (addStillNotContains!151 lt!208553 lt!208552 lt!208554 lt!208550))))

(assert (=> b!460541 (= lt!208550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460541 (= lt!208554 (get!6788 (select (arr!13736 lt!208401) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460541 (= lt!208552 (select (arr!13735 lt!208398) from!863))))

(declare-fun call!30132 () ListLongMap!7169)

(assert (=> b!460541 (= lt!208553 call!30132)))

(declare-fun e!268635 () ListLongMap!7169)

(assert (=> b!460541 (= e!268635 (+!1652 call!30132 (tuple2!8267 (select (arr!13735 lt!208398) from!863) (get!6788 (select (arr!13736 lt!208401) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460542 () Bool)

(assert (=> b!460542 (= e!268635 call!30132)))

(declare-fun b!460543 () Bool)

(declare-fun e!268636 () Bool)

(assert (=> b!460543 (= e!268636 e!268638)))

(declare-fun c!56484 () Bool)

(assert (=> b!460543 (= c!56484 (bvslt from!863 (size!14088 lt!208398)))))

(declare-fun b!460545 () Bool)

(declare-fun res!275420 () Bool)

(declare-fun e!268634 () Bool)

(assert (=> b!460545 (=> (not res!275420) (not e!268634))))

(assert (=> b!460545 (= res!275420 (not (contains!2498 lt!208555 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460546 () Bool)

(assert (=> b!460546 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14088 lt!208398)))))

(assert (=> b!460546 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14089 lt!208401)))))

(declare-fun e!268637 () Bool)

(declare-fun apply!317 (ListLongMap!7169 (_ BitVec 64)) V!17635)

(assert (=> b!460546 (= e!268637 (= (apply!317 lt!208555 (select (arr!13735 lt!208398) from!863)) (get!6788 (select (arr!13736 lt!208401) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460547 () Bool)

(declare-fun e!268640 () ListLongMap!7169)

(assert (=> b!460547 (= e!268640 (ListLongMap!7170 Nil!8325))))

(declare-fun b!460548 () Bool)

(declare-fun e!268639 () Bool)

(assert (=> b!460548 (= e!268639 (validKeyInArray!0 (select (arr!13735 lt!208398) from!863)))))

(assert (=> b!460548 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!460549 () Bool)

(assert (=> b!460549 (= e!268636 e!268637)))

(assert (=> b!460549 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14088 lt!208398)))))

(declare-fun res!275417 () Bool)

(assert (=> b!460549 (= res!275417 (contains!2498 lt!208555 (select (arr!13735 lt!208398) from!863)))))

(assert (=> b!460549 (=> (not res!275417) (not e!268637))))

(declare-fun bm!30129 () Bool)

(assert (=> bm!30129 (= call!30132 (getCurrentListMapNoExtraKeys!1792 lt!208398 lt!208401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460550 () Bool)

(assert (=> b!460550 (= e!268638 (= lt!208555 (getCurrentListMapNoExtraKeys!1792 lt!208398 lt!208401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!460551 () Bool)

(assert (=> b!460551 (= e!268640 e!268635)))

(declare-fun c!56487 () Bool)

(assert (=> b!460551 (= c!56487 (validKeyInArray!0 (select (arr!13735 lt!208398) from!863)))))

(declare-fun b!460544 () Bool)

(assert (=> b!460544 (= e!268634 e!268636)))

(declare-fun c!56485 () Bool)

(assert (=> b!460544 (= c!56485 e!268639)))

(declare-fun res!275419 () Bool)

(assert (=> b!460544 (=> (not res!275419) (not e!268639))))

(assert (=> b!460544 (= res!275419 (bvslt from!863 (size!14088 lt!208398)))))

(declare-fun d!74619 () Bool)

(assert (=> d!74619 e!268634))

(declare-fun res!275418 () Bool)

(assert (=> d!74619 (=> (not res!275418) (not e!268634))))

(assert (=> d!74619 (= res!275418 (not (contains!2498 lt!208555 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74619 (= lt!208555 e!268640)))

(declare-fun c!56486 () Bool)

(assert (=> d!74619 (= c!56486 (bvsge from!863 (size!14088 lt!208398)))))

(assert (=> d!74619 (validMask!0 mask!1025)))

(assert (=> d!74619 (= (getCurrentListMapNoExtraKeys!1792 lt!208398 lt!208401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!208555)))

(assert (= (and d!74619 c!56486) b!460547))

(assert (= (and d!74619 (not c!56486)) b!460551))

(assert (= (and b!460551 c!56487) b!460541))

(assert (= (and b!460551 (not c!56487)) b!460542))

(assert (= (or b!460541 b!460542) bm!30129))

(assert (= (and d!74619 res!275418) b!460545))

(assert (= (and b!460545 res!275420) b!460544))

(assert (= (and b!460544 res!275419) b!460548))

(assert (= (and b!460544 c!56485) b!460549))

(assert (= (and b!460544 (not c!56485)) b!460543))

(assert (= (and b!460549 res!275417) b!460546))

(assert (= (and b!460543 c!56484) b!460550))

(assert (= (and b!460543 (not c!56484)) b!460540))

(declare-fun b_lambda!9883 () Bool)

(assert (=> (not b_lambda!9883) (not b!460541)))

(assert (=> b!460541 t!14255))

(declare-fun b_and!19343 () Bool)

(assert (= b_and!19333 (and (=> t!14255 result!7327) b_and!19343)))

(declare-fun b_lambda!9885 () Bool)

(assert (=> (not b_lambda!9885) (not b!460546)))

(assert (=> b!460546 t!14255))

(declare-fun b_and!19345 () Bool)

(assert (= b_and!19343 (and (=> t!14255 result!7327) b_and!19345)))

(assert (=> b!460546 m!443093))

(declare-fun m!443303 () Bool)

(assert (=> b!460546 m!443303))

(declare-fun m!443305 () Bool)

(assert (=> b!460546 m!443305))

(declare-fun m!443307 () Bool)

(assert (=> b!460546 m!443307))

(assert (=> b!460546 m!443307))

(assert (=> b!460546 m!443093))

(declare-fun m!443309 () Bool)

(assert (=> b!460546 m!443309))

(assert (=> b!460546 m!443303))

(declare-fun m!443311 () Bool)

(assert (=> bm!30129 m!443311))

(assert (=> b!460541 m!443093))

(assert (=> b!460541 m!443307))

(declare-fun m!443313 () Bool)

(assert (=> b!460541 m!443313))

(assert (=> b!460541 m!443307))

(assert (=> b!460541 m!443093))

(assert (=> b!460541 m!443309))

(assert (=> b!460541 m!443303))

(declare-fun m!443315 () Bool)

(assert (=> b!460541 m!443315))

(declare-fun m!443317 () Bool)

(assert (=> b!460541 m!443317))

(assert (=> b!460541 m!443317))

(declare-fun m!443319 () Bool)

(assert (=> b!460541 m!443319))

(assert (=> b!460551 m!443303))

(assert (=> b!460551 m!443303))

(declare-fun m!443321 () Bool)

(assert (=> b!460551 m!443321))

(declare-fun m!443323 () Bool)

(assert (=> d!74619 m!443323))

(assert (=> d!74619 m!443119))

(declare-fun m!443325 () Bool)

(assert (=> b!460545 m!443325))

(assert (=> b!460548 m!443303))

(assert (=> b!460548 m!443303))

(assert (=> b!460548 m!443321))

(assert (=> b!460549 m!443303))

(assert (=> b!460549 m!443303))

(declare-fun m!443327 () Bool)

(assert (=> b!460549 m!443327))

(declare-fun m!443329 () Bool)

(assert (=> b!460540 m!443329))

(assert (=> b!460550 m!443311))

(assert (=> b!460357 d!74619))

(declare-fun b!460552 () Bool)

(declare-fun e!268645 () Bool)

(declare-fun lt!208562 () ListLongMap!7169)

(assert (=> b!460552 (= e!268645 (isEmpty!568 lt!208562))))

(declare-fun b!460553 () Bool)

(declare-fun lt!208556 () Unit!13378)

(declare-fun lt!208558 () Unit!13378)

(assert (=> b!460553 (= lt!208556 lt!208558)))

(declare-fun lt!208561 () V!17635)

(declare-fun lt!208560 () ListLongMap!7169)

(declare-fun lt!208559 () (_ BitVec 64))

(declare-fun lt!208557 () (_ BitVec 64))

(assert (=> b!460553 (not (contains!2498 (+!1652 lt!208560 (tuple2!8267 lt!208559 lt!208561)) lt!208557))))

(assert (=> b!460553 (= lt!208558 (addStillNotContains!151 lt!208560 lt!208559 lt!208561 lt!208557))))

(assert (=> b!460553 (= lt!208557 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460553 (= lt!208561 (get!6788 (select (arr!13736 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460553 (= lt!208559 (select (arr!13735 _keys!709) from!863))))

(declare-fun call!30133 () ListLongMap!7169)

(assert (=> b!460553 (= lt!208560 call!30133)))

(declare-fun e!268642 () ListLongMap!7169)

(assert (=> b!460553 (= e!268642 (+!1652 call!30133 (tuple2!8267 (select (arr!13735 _keys!709) from!863) (get!6788 (select (arr!13736 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460554 () Bool)

(assert (=> b!460554 (= e!268642 call!30133)))

(declare-fun b!460555 () Bool)

(declare-fun e!268643 () Bool)

(assert (=> b!460555 (= e!268643 e!268645)))

(declare-fun c!56488 () Bool)

(assert (=> b!460555 (= c!56488 (bvslt from!863 (size!14088 _keys!709)))))

(declare-fun b!460557 () Bool)

(declare-fun res!275424 () Bool)

(declare-fun e!268641 () Bool)

(assert (=> b!460557 (=> (not res!275424) (not e!268641))))

(assert (=> b!460557 (= res!275424 (not (contains!2498 lt!208562 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460558 () Bool)

(assert (=> b!460558 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14088 _keys!709)))))

(assert (=> b!460558 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14089 _values!549)))))

(declare-fun e!268644 () Bool)

(assert (=> b!460558 (= e!268644 (= (apply!317 lt!208562 (select (arr!13735 _keys!709) from!863)) (get!6788 (select (arr!13736 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460559 () Bool)

(declare-fun e!268647 () ListLongMap!7169)

(assert (=> b!460559 (= e!268647 (ListLongMap!7170 Nil!8325))))

(declare-fun b!460560 () Bool)

(declare-fun e!268646 () Bool)

(assert (=> b!460560 (= e!268646 (validKeyInArray!0 (select (arr!13735 _keys!709) from!863)))))

(assert (=> b!460560 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!460561 () Bool)

(assert (=> b!460561 (= e!268643 e!268644)))

(assert (=> b!460561 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14088 _keys!709)))))

(declare-fun res!275421 () Bool)

(assert (=> b!460561 (= res!275421 (contains!2498 lt!208562 (select (arr!13735 _keys!709) from!863)))))

(assert (=> b!460561 (=> (not res!275421) (not e!268644))))

(declare-fun bm!30130 () Bool)

(assert (=> bm!30130 (= call!30133 (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460562 () Bool)

(assert (=> b!460562 (= e!268645 (= lt!208562 (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!460563 () Bool)

(assert (=> b!460563 (= e!268647 e!268642)))

(declare-fun c!56491 () Bool)

(assert (=> b!460563 (= c!56491 (validKeyInArray!0 (select (arr!13735 _keys!709) from!863)))))

(declare-fun b!460556 () Bool)

(assert (=> b!460556 (= e!268641 e!268643)))

(declare-fun c!56489 () Bool)

(assert (=> b!460556 (= c!56489 e!268646)))

(declare-fun res!275423 () Bool)

(assert (=> b!460556 (=> (not res!275423) (not e!268646))))

(assert (=> b!460556 (= res!275423 (bvslt from!863 (size!14088 _keys!709)))))

(declare-fun d!74621 () Bool)

(assert (=> d!74621 e!268641))

(declare-fun res!275422 () Bool)

(assert (=> d!74621 (=> (not res!275422) (not e!268641))))

(assert (=> d!74621 (= res!275422 (not (contains!2498 lt!208562 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74621 (= lt!208562 e!268647)))

(declare-fun c!56490 () Bool)

(assert (=> d!74621 (= c!56490 (bvsge from!863 (size!14088 _keys!709)))))

(assert (=> d!74621 (validMask!0 mask!1025)))

(assert (=> d!74621 (= (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!208562)))

(assert (= (and d!74621 c!56490) b!460559))

(assert (= (and d!74621 (not c!56490)) b!460563))

(assert (= (and b!460563 c!56491) b!460553))

(assert (= (and b!460563 (not c!56491)) b!460554))

(assert (= (or b!460553 b!460554) bm!30130))

(assert (= (and d!74621 res!275422) b!460557))

(assert (= (and b!460557 res!275424) b!460556))

(assert (= (and b!460556 res!275423) b!460560))

(assert (= (and b!460556 c!56489) b!460561))

(assert (= (and b!460556 (not c!56489)) b!460555))

(assert (= (and b!460561 res!275421) b!460558))

(assert (= (and b!460555 c!56488) b!460562))

(assert (= (and b!460555 (not c!56488)) b!460552))

(declare-fun b_lambda!9887 () Bool)

(assert (=> (not b_lambda!9887) (not b!460553)))

(assert (=> b!460553 t!14255))

(declare-fun b_and!19347 () Bool)

(assert (= b_and!19345 (and (=> t!14255 result!7327) b_and!19347)))

(declare-fun b_lambda!9889 () Bool)

(assert (=> (not b_lambda!9889) (not b!460558)))

(assert (=> b!460558 t!14255))

(declare-fun b_and!19349 () Bool)

(assert (= b_and!19347 (and (=> t!14255 result!7327) b_and!19349)))

(assert (=> b!460558 m!443093))

(assert (=> b!460558 m!443069))

(declare-fun m!443331 () Bool)

(assert (=> b!460558 m!443331))

(assert (=> b!460558 m!443095))

(assert (=> b!460558 m!443095))

(assert (=> b!460558 m!443093))

(assert (=> b!460558 m!443097))

(assert (=> b!460558 m!443069))

(declare-fun m!443333 () Bool)

(assert (=> bm!30130 m!443333))

(assert (=> b!460553 m!443093))

(assert (=> b!460553 m!443095))

(declare-fun m!443335 () Bool)

(assert (=> b!460553 m!443335))

(assert (=> b!460553 m!443095))

(assert (=> b!460553 m!443093))

(assert (=> b!460553 m!443097))

(assert (=> b!460553 m!443069))

(declare-fun m!443337 () Bool)

(assert (=> b!460553 m!443337))

(declare-fun m!443339 () Bool)

(assert (=> b!460553 m!443339))

(assert (=> b!460553 m!443339))

(declare-fun m!443341 () Bool)

(assert (=> b!460553 m!443341))

(assert (=> b!460563 m!443069))

(assert (=> b!460563 m!443069))

(assert (=> b!460563 m!443079))

(declare-fun m!443343 () Bool)

(assert (=> d!74621 m!443343))

(assert (=> d!74621 m!443119))

(declare-fun m!443345 () Bool)

(assert (=> b!460557 m!443345))

(assert (=> b!460560 m!443069))

(assert (=> b!460560 m!443069))

(assert (=> b!460560 m!443079))

(assert (=> b!460561 m!443069))

(assert (=> b!460561 m!443069))

(declare-fun m!443347 () Bool)

(assert (=> b!460561 m!443347))

(declare-fun m!443349 () Bool)

(assert (=> b!460552 m!443349))

(assert (=> b!460562 m!443333))

(assert (=> b!460357 d!74621))

(declare-fun b!460574 () Bool)

(declare-fun e!268658 () Bool)

(declare-fun call!30136 () Bool)

(assert (=> b!460574 (= e!268658 call!30136)))

(declare-fun d!74623 () Bool)

(declare-fun res!275432 () Bool)

(declare-fun e!268656 () Bool)

(assert (=> d!74623 (=> res!275432 e!268656)))

(assert (=> d!74623 (= res!275432 (bvsge #b00000000000000000000000000000000 (size!14088 _keys!709)))))

(assert (=> d!74623 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8324) e!268656)))

(declare-fun b!460575 () Bool)

(assert (=> b!460575 (= e!268658 call!30136)))

(declare-fun b!460576 () Bool)

(declare-fun e!268659 () Bool)

(assert (=> b!460576 (= e!268659 e!268658)))

(declare-fun c!56494 () Bool)

(assert (=> b!460576 (= c!56494 (validKeyInArray!0 (select (arr!13735 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30133 () Bool)

(assert (=> bm!30133 (= call!30136 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56494 (Cons!8323 (select (arr!13735 _keys!709) #b00000000000000000000000000000000) Nil!8324) Nil!8324)))))

(declare-fun b!460577 () Bool)

(declare-fun e!268657 () Bool)

(declare-fun contains!2500 (List!8327 (_ BitVec 64)) Bool)

(assert (=> b!460577 (= e!268657 (contains!2500 Nil!8324 (select (arr!13735 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!460578 () Bool)

(assert (=> b!460578 (= e!268656 e!268659)))

(declare-fun res!275433 () Bool)

(assert (=> b!460578 (=> (not res!275433) (not e!268659))))

(assert (=> b!460578 (= res!275433 (not e!268657))))

(declare-fun res!275431 () Bool)

(assert (=> b!460578 (=> (not res!275431) (not e!268657))))

(assert (=> b!460578 (= res!275431 (validKeyInArray!0 (select (arr!13735 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74623 (not res!275432)) b!460578))

(assert (= (and b!460578 res!275431) b!460577))

(assert (= (and b!460578 res!275433) b!460576))

(assert (= (and b!460576 c!56494) b!460574))

(assert (= (and b!460576 (not c!56494)) b!460575))

(assert (= (or b!460574 b!460575) bm!30133))

(declare-fun m!443351 () Bool)

(assert (=> b!460576 m!443351))

(assert (=> b!460576 m!443351))

(declare-fun m!443353 () Bool)

(assert (=> b!460576 m!443353))

(assert (=> bm!30133 m!443351))

(declare-fun m!443355 () Bool)

(assert (=> bm!30133 m!443355))

(assert (=> b!460577 m!443351))

(assert (=> b!460577 m!443351))

(declare-fun m!443357 () Bool)

(assert (=> b!460577 m!443357))

(assert (=> b!460578 m!443351))

(assert (=> b!460578 m!443351))

(assert (=> b!460578 m!443353))

(assert (=> b!460349 d!74623))

(declare-fun d!74625 () Bool)

(declare-fun e!268660 () Bool)

(assert (=> d!74625 e!268660))

(declare-fun res!275435 () Bool)

(assert (=> d!74625 (=> (not res!275435) (not e!268660))))

(declare-fun lt!208565 () ListLongMap!7169)

(assert (=> d!74625 (= res!275435 (contains!2498 lt!208565 (_1!4144 lt!208411)))))

(declare-fun lt!208564 () List!8328)

(assert (=> d!74625 (= lt!208565 (ListLongMap!7170 lt!208564))))

(declare-fun lt!208563 () Unit!13378)

(declare-fun lt!208566 () Unit!13378)

(assert (=> d!74625 (= lt!208563 lt!208566)))

(assert (=> d!74625 (= (getValueByKey!372 lt!208564 (_1!4144 lt!208411)) (Some!377 (_2!4144 lt!208411)))))

(assert (=> d!74625 (= lt!208566 (lemmaContainsTupThenGetReturnValue!197 lt!208564 (_1!4144 lt!208411) (_2!4144 lt!208411)))))

(assert (=> d!74625 (= lt!208564 (insertStrictlySorted!200 (toList!3600 lt!208412) (_1!4144 lt!208411) (_2!4144 lt!208411)))))

(assert (=> d!74625 (= (+!1652 lt!208412 lt!208411) lt!208565)))

(declare-fun b!460579 () Bool)

(declare-fun res!275434 () Bool)

(assert (=> b!460579 (=> (not res!275434) (not e!268660))))

(assert (=> b!460579 (= res!275434 (= (getValueByKey!372 (toList!3600 lt!208565) (_1!4144 lt!208411)) (Some!377 (_2!4144 lt!208411))))))

(declare-fun b!460580 () Bool)

(assert (=> b!460580 (= e!268660 (contains!2499 (toList!3600 lt!208565) lt!208411))))

(assert (= (and d!74625 res!275435) b!460579))

(assert (= (and b!460579 res!275434) b!460580))

(declare-fun m!443359 () Bool)

(assert (=> d!74625 m!443359))

(declare-fun m!443361 () Bool)

(assert (=> d!74625 m!443361))

(declare-fun m!443363 () Bool)

(assert (=> d!74625 m!443363))

(declare-fun m!443365 () Bool)

(assert (=> d!74625 m!443365))

(declare-fun m!443367 () Bool)

(assert (=> b!460579 m!443367))

(declare-fun m!443369 () Bool)

(assert (=> b!460580 m!443369))

(assert (=> b!460359 d!74625))

(declare-fun d!74627 () Bool)

(declare-fun c!56497 () Bool)

(assert (=> d!74627 (= c!56497 ((_ is ValueCellFull!5855) (select (arr!13736 _values!549) from!863)))))

(declare-fun e!268663 () V!17635)

(assert (=> d!74627 (= (get!6788 (select (arr!13736 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!268663)))

(declare-fun b!460585 () Bool)

(declare-fun get!6791 (ValueCell!5855 V!17635) V!17635)

(assert (=> b!460585 (= e!268663 (get!6791 (select (arr!13736 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460586 () Bool)

(declare-fun get!6792 (ValueCell!5855 V!17635) V!17635)

(assert (=> b!460586 (= e!268663 (get!6792 (select (arr!13736 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74627 c!56497) b!460585))

(assert (= (and d!74627 (not c!56497)) b!460586))

(assert (=> b!460585 m!443095))

(assert (=> b!460585 m!443093))

(declare-fun m!443371 () Bool)

(assert (=> b!460585 m!443371))

(assert (=> b!460586 m!443095))

(assert (=> b!460586 m!443093))

(declare-fun m!443373 () Bool)

(assert (=> b!460586 m!443373))

(assert (=> b!460359 d!74627))

(declare-fun d!74629 () Bool)

(declare-fun res!275437 () Bool)

(declare-fun e!268666 () Bool)

(assert (=> d!74629 (=> res!275437 e!268666)))

(assert (=> d!74629 (= res!275437 (bvsge #b00000000000000000000000000000000 (size!14088 _keys!709)))))

(assert (=> d!74629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!268666)))

(declare-fun b!460587 () Bool)

(declare-fun e!268664 () Bool)

(declare-fun call!30137 () Bool)

(assert (=> b!460587 (= e!268664 call!30137)))

(declare-fun b!460588 () Bool)

(declare-fun e!268665 () Bool)

(assert (=> b!460588 (= e!268666 e!268665)))

(declare-fun c!56498 () Bool)

(assert (=> b!460588 (= c!56498 (validKeyInArray!0 (select (arr!13735 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30134 () Bool)

(assert (=> bm!30134 (= call!30137 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!460589 () Bool)

(assert (=> b!460589 (= e!268665 e!268664)))

(declare-fun lt!208567 () (_ BitVec 64))

(assert (=> b!460589 (= lt!208567 (select (arr!13735 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!208568 () Unit!13378)

(assert (=> b!460589 (= lt!208568 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!208567 #b00000000000000000000000000000000))))

(assert (=> b!460589 (arrayContainsKey!0 _keys!709 lt!208567 #b00000000000000000000000000000000)))

(declare-fun lt!208569 () Unit!13378)

(assert (=> b!460589 (= lt!208569 lt!208568)))

(declare-fun res!275436 () Bool)

(assert (=> b!460589 (= res!275436 (= (seekEntryOrOpen!0 (select (arr!13735 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3531 #b00000000000000000000000000000000)))))

(assert (=> b!460589 (=> (not res!275436) (not e!268664))))

(declare-fun b!460590 () Bool)

(assert (=> b!460590 (= e!268665 call!30137)))

(assert (= (and d!74629 (not res!275437)) b!460588))

(assert (= (and b!460588 c!56498) b!460589))

(assert (= (and b!460588 (not c!56498)) b!460590))

(assert (= (and b!460589 res!275436) b!460587))

(assert (= (or b!460587 b!460590) bm!30134))

(assert (=> b!460588 m!443351))

(assert (=> b!460588 m!443351))

(assert (=> b!460588 m!443353))

(declare-fun m!443375 () Bool)

(assert (=> bm!30134 m!443375))

(assert (=> b!460589 m!443351))

(declare-fun m!443377 () Bool)

(assert (=> b!460589 m!443377))

(declare-fun m!443379 () Bool)

(assert (=> b!460589 m!443379))

(assert (=> b!460589 m!443351))

(declare-fun m!443381 () Bool)

(assert (=> b!460589 m!443381))

(assert (=> b!460358 d!74629))

(declare-fun d!74631 () Bool)

(assert (=> d!74631 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!460350 d!74631))

(declare-fun d!74633 () Bool)

(assert (=> d!74633 (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))

(declare-fun lt!208572 () Unit!13378)

(declare-fun choose!114 (array!28589 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13378)

(assert (=> d!74633 (= lt!208572 (choose!114 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> d!74633 (bvsge from!863 #b00000000000000000000000000000000)))

(assert (=> d!74633 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000) lt!208572)))

(declare-fun bs!14516 () Bool)

(assert (= bs!14516 d!74633))

(assert (=> bs!14516 m!443083))

(declare-fun m!443383 () Bool)

(assert (=> bs!14516 m!443383))

(assert (=> b!460351 d!74633))

(declare-fun b!460591 () Bool)

(declare-fun e!268671 () Bool)

(declare-fun lt!208579 () ListLongMap!7169)

(assert (=> b!460591 (= e!268671 (isEmpty!568 lt!208579))))

(declare-fun b!460592 () Bool)

(declare-fun lt!208573 () Unit!13378)

(declare-fun lt!208575 () Unit!13378)

(assert (=> b!460592 (= lt!208573 lt!208575)))

(declare-fun lt!208576 () (_ BitVec 64))

(declare-fun lt!208574 () (_ BitVec 64))

(declare-fun lt!208578 () V!17635)

(declare-fun lt!208577 () ListLongMap!7169)

(assert (=> b!460592 (not (contains!2498 (+!1652 lt!208577 (tuple2!8267 lt!208576 lt!208578)) lt!208574))))

(assert (=> b!460592 (= lt!208575 (addStillNotContains!151 lt!208577 lt!208576 lt!208578 lt!208574))))

(assert (=> b!460592 (= lt!208574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460592 (= lt!208578 (get!6788 (select (arr!13736 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460592 (= lt!208576 (select (arr!13735 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30138 () ListLongMap!7169)

(assert (=> b!460592 (= lt!208577 call!30138)))

(declare-fun e!268668 () ListLongMap!7169)

(assert (=> b!460592 (= e!268668 (+!1652 call!30138 (tuple2!8267 (select (arr!13735 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6788 (select (arr!13736 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460593 () Bool)

(assert (=> b!460593 (= e!268668 call!30138)))

(declare-fun b!460594 () Bool)

(declare-fun e!268669 () Bool)

(assert (=> b!460594 (= e!268669 e!268671)))

(declare-fun c!56499 () Bool)

(assert (=> b!460594 (= c!56499 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14088 _keys!709)))))

(declare-fun b!460596 () Bool)

(declare-fun res!275441 () Bool)

(declare-fun e!268667 () Bool)

(assert (=> b!460596 (=> (not res!275441) (not e!268667))))

(assert (=> b!460596 (= res!275441 (not (contains!2498 lt!208579 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460597 () Bool)

(assert (=> b!460597 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14088 _keys!709)))))

(assert (=> b!460597 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14089 _values!549)))))

(declare-fun e!268670 () Bool)

(assert (=> b!460597 (= e!268670 (= (apply!317 lt!208579 (select (arr!13735 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6788 (select (arr!13736 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460598 () Bool)

(declare-fun e!268673 () ListLongMap!7169)

(assert (=> b!460598 (= e!268673 (ListLongMap!7170 Nil!8325))))

(declare-fun b!460599 () Bool)

(declare-fun e!268672 () Bool)

(assert (=> b!460599 (= e!268672 (validKeyInArray!0 (select (arr!13735 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460599 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!460600 () Bool)

(assert (=> b!460600 (= e!268669 e!268670)))

(assert (=> b!460600 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14088 _keys!709)))))

(declare-fun res!275438 () Bool)

(assert (=> b!460600 (= res!275438 (contains!2498 lt!208579 (select (arr!13735 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460600 (=> (not res!275438) (not e!268670))))

(declare-fun bm!30135 () Bool)

(assert (=> bm!30135 (= call!30138 (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460601 () Bool)

(assert (=> b!460601 (= e!268671 (= lt!208579 (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!460602 () Bool)

(assert (=> b!460602 (= e!268673 e!268668)))

(declare-fun c!56502 () Bool)

(assert (=> b!460602 (= c!56502 (validKeyInArray!0 (select (arr!13735 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!460595 () Bool)

(assert (=> b!460595 (= e!268667 e!268669)))

(declare-fun c!56500 () Bool)

(assert (=> b!460595 (= c!56500 e!268672)))

(declare-fun res!275440 () Bool)

(assert (=> b!460595 (=> (not res!275440) (not e!268672))))

(assert (=> b!460595 (= res!275440 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14088 _keys!709)))))

(declare-fun d!74635 () Bool)

(assert (=> d!74635 e!268667))

(declare-fun res!275439 () Bool)

(assert (=> d!74635 (=> (not res!275439) (not e!268667))))

(assert (=> d!74635 (= res!275439 (not (contains!2498 lt!208579 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74635 (= lt!208579 e!268673)))

(declare-fun c!56501 () Bool)

(assert (=> d!74635 (= c!56501 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14088 _keys!709)))))

(assert (=> d!74635 (validMask!0 mask!1025)))

(assert (=> d!74635 (= (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208579)))

(assert (= (and d!74635 c!56501) b!460598))

(assert (= (and d!74635 (not c!56501)) b!460602))

(assert (= (and b!460602 c!56502) b!460592))

(assert (= (and b!460602 (not c!56502)) b!460593))

(assert (= (or b!460592 b!460593) bm!30135))

(assert (= (and d!74635 res!275439) b!460596))

(assert (= (and b!460596 res!275441) b!460595))

(assert (= (and b!460595 res!275440) b!460599))

(assert (= (and b!460595 c!56500) b!460600))

(assert (= (and b!460595 (not c!56500)) b!460594))

(assert (= (and b!460600 res!275438) b!460597))

(assert (= (and b!460594 c!56499) b!460601))

(assert (= (and b!460594 (not c!56499)) b!460591))

(declare-fun b_lambda!9891 () Bool)

(assert (=> (not b_lambda!9891) (not b!460592)))

(assert (=> b!460592 t!14255))

(declare-fun b_and!19351 () Bool)

(assert (= b_and!19349 (and (=> t!14255 result!7327) b_and!19351)))

(declare-fun b_lambda!9893 () Bool)

(assert (=> (not b_lambda!9893) (not b!460597)))

(assert (=> b!460597 t!14255))

(declare-fun b_and!19353 () Bool)

(assert (= b_and!19351 (and (=> t!14255 result!7327) b_and!19353)))

(assert (=> b!460597 m!443093))

(declare-fun m!443385 () Bool)

(assert (=> b!460597 m!443385))

(declare-fun m!443387 () Bool)

(assert (=> b!460597 m!443387))

(declare-fun m!443389 () Bool)

(assert (=> b!460597 m!443389))

(assert (=> b!460597 m!443389))

(assert (=> b!460597 m!443093))

(declare-fun m!443391 () Bool)

(assert (=> b!460597 m!443391))

(assert (=> b!460597 m!443385))

(declare-fun m!443393 () Bool)

(assert (=> bm!30135 m!443393))

(assert (=> b!460592 m!443093))

(assert (=> b!460592 m!443389))

(declare-fun m!443395 () Bool)

(assert (=> b!460592 m!443395))

(assert (=> b!460592 m!443389))

(assert (=> b!460592 m!443093))

(assert (=> b!460592 m!443391))

(assert (=> b!460592 m!443385))

(declare-fun m!443397 () Bool)

(assert (=> b!460592 m!443397))

(declare-fun m!443399 () Bool)

(assert (=> b!460592 m!443399))

(assert (=> b!460592 m!443399))

(declare-fun m!443401 () Bool)

(assert (=> b!460592 m!443401))

(assert (=> b!460602 m!443385))

(assert (=> b!460602 m!443385))

(declare-fun m!443403 () Bool)

(assert (=> b!460602 m!443403))

(declare-fun m!443405 () Bool)

(assert (=> d!74635 m!443405))

(assert (=> d!74635 m!443119))

(declare-fun m!443407 () Bool)

(assert (=> b!460596 m!443407))

(assert (=> b!460599 m!443385))

(assert (=> b!460599 m!443385))

(assert (=> b!460599 m!443403))

(assert (=> b!460600 m!443385))

(assert (=> b!460600 m!443385))

(declare-fun m!443409 () Bool)

(assert (=> b!460600 m!443409))

(declare-fun m!443411 () Bool)

(assert (=> b!460591 m!443411))

(assert (=> b!460601 m!443393))

(assert (=> b!460352 d!74635))

(declare-fun d!74637 () Bool)

(assert (=> d!74637 (= (validKeyInArray!0 (select (arr!13735 _keys!709) from!863)) (and (not (= (select (arr!13735 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13735 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!460352 d!74637))

(declare-fun b!460610 () Bool)

(declare-fun e!268679 () Bool)

(declare-fun e!268678 () Bool)

(assert (=> b!460610 (= e!268679 e!268678)))

(declare-fun c!56505 () Bool)

(assert (=> b!460610 (= c!56505 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun bm!30140 () Bool)

(declare-fun call!30144 () ListLongMap!7169)

(assert (=> bm!30140 (= call!30144 (getCurrentListMapNoExtraKeys!1792 (array!28590 (store (arr!13735 _keys!709) i!563 k0!794) (size!14088 _keys!709)) (array!28592 (store (arr!13736 _values!549) i!563 (ValueCellFull!5855 v!412)) (size!14089 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460611 () Bool)

(declare-fun call!30143 () ListLongMap!7169)

(assert (=> b!460611 (= e!268678 (= call!30144 call!30143))))

(declare-fun bm!30141 () Bool)

(assert (=> bm!30141 (= call!30143 (getCurrentListMapNoExtraKeys!1792 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun d!74639 () Bool)

(assert (=> d!74639 e!268679))

(declare-fun res!275444 () Bool)

(assert (=> d!74639 (=> (not res!275444) (not e!268679))))

(assert (=> d!74639 (= res!275444 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14088 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14089 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14088 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14089 _values!549))))))))

(declare-fun lt!208582 () Unit!13378)

(declare-fun choose!1342 (array!28589 array!28591 (_ BitVec 32) (_ BitVec 32) V!17635 V!17635 (_ BitVec 32) (_ BitVec 64) V!17635 (_ BitVec 32) Int) Unit!13378)

(assert (=> d!74639 (= lt!208582 (choose!1342 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74639 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14088 _keys!709)))))

(assert (=> d!74639 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208582)))

(declare-fun b!460609 () Bool)

(assert (=> b!460609 (= e!268678 (= call!30144 (+!1652 call!30143 (tuple2!8267 k0!794 v!412))))))

(assert (= (and d!74639 res!275444) b!460610))

(assert (= (and b!460610 c!56505) b!460609))

(assert (= (and b!460610 (not c!56505)) b!460611))

(assert (= (or b!460609 b!460611) bm!30141))

(assert (= (or b!460609 b!460611) bm!30140))

(assert (=> bm!30140 m!443111))

(assert (=> bm!30140 m!443089))

(declare-fun m!443413 () Bool)

(assert (=> bm!30140 m!443413))

(assert (=> bm!30141 m!443073))

(declare-fun m!443415 () Bool)

(assert (=> d!74639 m!443415))

(declare-fun m!443417 () Bool)

(assert (=> b!460609 m!443417))

(assert (=> b!460352 d!74639))

(declare-fun d!74641 () Bool)

(declare-fun e!268680 () Bool)

(assert (=> d!74641 e!268680))

(declare-fun res!275446 () Bool)

(assert (=> d!74641 (=> (not res!275446) (not e!268680))))

(declare-fun lt!208585 () ListLongMap!7169)

(assert (=> d!74641 (= res!275446 (contains!2498 lt!208585 (_1!4144 lt!208404)))))

(declare-fun lt!208584 () List!8328)

(assert (=> d!74641 (= lt!208585 (ListLongMap!7170 lt!208584))))

(declare-fun lt!208583 () Unit!13378)

(declare-fun lt!208586 () Unit!13378)

(assert (=> d!74641 (= lt!208583 lt!208586)))

(assert (=> d!74641 (= (getValueByKey!372 lt!208584 (_1!4144 lt!208404)) (Some!377 (_2!4144 lt!208404)))))

(assert (=> d!74641 (= lt!208586 (lemmaContainsTupThenGetReturnValue!197 lt!208584 (_1!4144 lt!208404) (_2!4144 lt!208404)))))

(assert (=> d!74641 (= lt!208584 (insertStrictlySorted!200 (toList!3600 lt!208405) (_1!4144 lt!208404) (_2!4144 lt!208404)))))

(assert (=> d!74641 (= (+!1652 lt!208405 lt!208404) lt!208585)))

(declare-fun b!460612 () Bool)

(declare-fun res!275445 () Bool)

(assert (=> b!460612 (=> (not res!275445) (not e!268680))))

(assert (=> b!460612 (= res!275445 (= (getValueByKey!372 (toList!3600 lt!208585) (_1!4144 lt!208404)) (Some!377 (_2!4144 lt!208404))))))

(declare-fun b!460613 () Bool)

(assert (=> b!460613 (= e!268680 (contains!2499 (toList!3600 lt!208585) lt!208404))))

(assert (= (and d!74641 res!275446) b!460612))

(assert (= (and b!460612 res!275445) b!460613))

(declare-fun m!443419 () Bool)

(assert (=> d!74641 m!443419))

(declare-fun m!443421 () Bool)

(assert (=> d!74641 m!443421))

(declare-fun m!443423 () Bool)

(assert (=> d!74641 m!443423))

(declare-fun m!443425 () Bool)

(assert (=> d!74641 m!443425))

(declare-fun m!443427 () Bool)

(assert (=> b!460612 m!443427))

(declare-fun m!443429 () Bool)

(assert (=> b!460613 m!443429))

(assert (=> b!460352 d!74641))

(declare-fun b!460614 () Bool)

(declare-fun e!268685 () Bool)

(declare-fun lt!208593 () ListLongMap!7169)

(assert (=> b!460614 (= e!268685 (isEmpty!568 lt!208593))))

(declare-fun b!460615 () Bool)

(declare-fun lt!208587 () Unit!13378)

(declare-fun lt!208589 () Unit!13378)

(assert (=> b!460615 (= lt!208587 lt!208589)))

(declare-fun lt!208592 () V!17635)

(declare-fun lt!208588 () (_ BitVec 64))

(declare-fun lt!208591 () ListLongMap!7169)

(declare-fun lt!208590 () (_ BitVec 64))

(assert (=> b!460615 (not (contains!2498 (+!1652 lt!208591 (tuple2!8267 lt!208590 lt!208592)) lt!208588))))

(assert (=> b!460615 (= lt!208589 (addStillNotContains!151 lt!208591 lt!208590 lt!208592 lt!208588))))

(assert (=> b!460615 (= lt!208588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!460615 (= lt!208592 (get!6788 (select (arr!13736 lt!208401) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!460615 (= lt!208590 (select (arr!13735 lt!208398) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30145 () ListLongMap!7169)

(assert (=> b!460615 (= lt!208591 call!30145)))

(declare-fun e!268682 () ListLongMap!7169)

(assert (=> b!460615 (= e!268682 (+!1652 call!30145 (tuple2!8267 (select (arr!13735 lt!208398) (bvadd #b00000000000000000000000000000001 from!863)) (get!6788 (select (arr!13736 lt!208401) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!460616 () Bool)

(assert (=> b!460616 (= e!268682 call!30145)))

(declare-fun b!460617 () Bool)

(declare-fun e!268683 () Bool)

(assert (=> b!460617 (= e!268683 e!268685)))

(declare-fun c!56506 () Bool)

(assert (=> b!460617 (= c!56506 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14088 lt!208398)))))

(declare-fun b!460619 () Bool)

(declare-fun res!275450 () Bool)

(declare-fun e!268681 () Bool)

(assert (=> b!460619 (=> (not res!275450) (not e!268681))))

(assert (=> b!460619 (= res!275450 (not (contains!2498 lt!208593 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460620 () Bool)

(assert (=> b!460620 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14088 lt!208398)))))

(assert (=> b!460620 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14089 lt!208401)))))

(declare-fun e!268684 () Bool)

(assert (=> b!460620 (= e!268684 (= (apply!317 lt!208593 (select (arr!13735 lt!208398) (bvadd #b00000000000000000000000000000001 from!863))) (get!6788 (select (arr!13736 lt!208401) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!460621 () Bool)

(declare-fun e!268687 () ListLongMap!7169)

(assert (=> b!460621 (= e!268687 (ListLongMap!7170 Nil!8325))))

(declare-fun b!460622 () Bool)

(declare-fun e!268686 () Bool)

(assert (=> b!460622 (= e!268686 (validKeyInArray!0 (select (arr!13735 lt!208398) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460622 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!460623 () Bool)

(assert (=> b!460623 (= e!268683 e!268684)))

(assert (=> b!460623 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14088 lt!208398)))))

(declare-fun res!275447 () Bool)

(assert (=> b!460623 (= res!275447 (contains!2498 lt!208593 (select (arr!13735 lt!208398) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!460623 (=> (not res!275447) (not e!268684))))

(declare-fun bm!30142 () Bool)

(assert (=> bm!30142 (= call!30145 (getCurrentListMapNoExtraKeys!1792 lt!208398 lt!208401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!460624 () Bool)

(assert (=> b!460624 (= e!268685 (= lt!208593 (getCurrentListMapNoExtraKeys!1792 lt!208398 lt!208401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!460625 () Bool)

(assert (=> b!460625 (= e!268687 e!268682)))

(declare-fun c!56509 () Bool)

(assert (=> b!460625 (= c!56509 (validKeyInArray!0 (select (arr!13735 lt!208398) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!460618 () Bool)

(assert (=> b!460618 (= e!268681 e!268683)))

(declare-fun c!56507 () Bool)

(assert (=> b!460618 (= c!56507 e!268686)))

(declare-fun res!275449 () Bool)

(assert (=> b!460618 (=> (not res!275449) (not e!268686))))

(assert (=> b!460618 (= res!275449 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14088 lt!208398)))))

(declare-fun d!74643 () Bool)

(assert (=> d!74643 e!268681))

(declare-fun res!275448 () Bool)

(assert (=> d!74643 (=> (not res!275448) (not e!268681))))

(assert (=> d!74643 (= res!275448 (not (contains!2498 lt!208593 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74643 (= lt!208593 e!268687)))

(declare-fun c!56508 () Bool)

(assert (=> d!74643 (= c!56508 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14088 lt!208398)))))

(assert (=> d!74643 (validMask!0 mask!1025)))

(assert (=> d!74643 (= (getCurrentListMapNoExtraKeys!1792 lt!208398 lt!208401 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!208593)))

(assert (= (and d!74643 c!56508) b!460621))

(assert (= (and d!74643 (not c!56508)) b!460625))

(assert (= (and b!460625 c!56509) b!460615))

(assert (= (and b!460625 (not c!56509)) b!460616))

(assert (= (or b!460615 b!460616) bm!30142))

(assert (= (and d!74643 res!275448) b!460619))

(assert (= (and b!460619 res!275450) b!460618))

(assert (= (and b!460618 res!275449) b!460622))

(assert (= (and b!460618 c!56507) b!460623))

(assert (= (and b!460618 (not c!56507)) b!460617))

(assert (= (and b!460623 res!275447) b!460620))

(assert (= (and b!460617 c!56506) b!460624))

(assert (= (and b!460617 (not c!56506)) b!460614))

(declare-fun b_lambda!9895 () Bool)

(assert (=> (not b_lambda!9895) (not b!460615)))

(assert (=> b!460615 t!14255))

(declare-fun b_and!19355 () Bool)

(assert (= b_and!19353 (and (=> t!14255 result!7327) b_and!19355)))

(declare-fun b_lambda!9897 () Bool)

(assert (=> (not b_lambda!9897) (not b!460620)))

(assert (=> b!460620 t!14255))

(declare-fun b_and!19357 () Bool)

(assert (= b_and!19355 (and (=> t!14255 result!7327) b_and!19357)))

(assert (=> b!460620 m!443093))

(declare-fun m!443431 () Bool)

(assert (=> b!460620 m!443431))

(declare-fun m!443433 () Bool)

(assert (=> b!460620 m!443433))

(declare-fun m!443435 () Bool)

(assert (=> b!460620 m!443435))

(assert (=> b!460620 m!443435))

(assert (=> b!460620 m!443093))

(declare-fun m!443437 () Bool)

(assert (=> b!460620 m!443437))

(assert (=> b!460620 m!443431))

(declare-fun m!443439 () Bool)

(assert (=> bm!30142 m!443439))

(assert (=> b!460615 m!443093))

(assert (=> b!460615 m!443435))

(declare-fun m!443441 () Bool)

(assert (=> b!460615 m!443441))

(assert (=> b!460615 m!443435))

(assert (=> b!460615 m!443093))

(assert (=> b!460615 m!443437))

(assert (=> b!460615 m!443431))

(declare-fun m!443443 () Bool)

(assert (=> b!460615 m!443443))

(declare-fun m!443445 () Bool)

(assert (=> b!460615 m!443445))

(assert (=> b!460615 m!443445))

(declare-fun m!443447 () Bool)

(assert (=> b!460615 m!443447))

(assert (=> b!460625 m!443431))

(assert (=> b!460625 m!443431))

(declare-fun m!443449 () Bool)

(assert (=> b!460625 m!443449))

(declare-fun m!443451 () Bool)

(assert (=> d!74643 m!443451))

(assert (=> d!74643 m!443119))

(declare-fun m!443453 () Bool)

(assert (=> b!460619 m!443453))

(assert (=> b!460622 m!443431))

(assert (=> b!460622 m!443431))

(assert (=> b!460622 m!443449))

(assert (=> b!460623 m!443431))

(assert (=> b!460623 m!443431))

(declare-fun m!443455 () Bool)

(assert (=> b!460623 m!443455))

(declare-fun m!443457 () Bool)

(assert (=> b!460614 m!443457))

(assert (=> b!460624 m!443439))

(assert (=> b!460352 d!74643))

(declare-fun d!74645 () Bool)

(assert (=> d!74645 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!460362 d!74645))

(declare-fun d!74647 () Bool)

(declare-fun res!275455 () Bool)

(declare-fun e!268692 () Bool)

(assert (=> d!74647 (=> res!275455 e!268692)))

(assert (=> d!74647 (= res!275455 (= (select (arr!13735 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74647 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!268692)))

(declare-fun b!460630 () Bool)

(declare-fun e!268693 () Bool)

(assert (=> b!460630 (= e!268692 e!268693)))

(declare-fun res!275456 () Bool)

(assert (=> b!460630 (=> (not res!275456) (not e!268693))))

(assert (=> b!460630 (= res!275456 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14088 _keys!709)))))

(declare-fun b!460631 () Bool)

(assert (=> b!460631 (= e!268693 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74647 (not res!275455)) b!460630))

(assert (= (and b!460630 res!275456) b!460631))

(assert (=> d!74647 m!443351))

(declare-fun m!443459 () Bool)

(assert (=> b!460631 m!443459))

(assert (=> b!460364 d!74647))

(declare-fun b!460632 () Bool)

(declare-fun e!268696 () Bool)

(declare-fun call!30146 () Bool)

(assert (=> b!460632 (= e!268696 call!30146)))

(declare-fun d!74649 () Bool)

(declare-fun res!275458 () Bool)

(declare-fun e!268694 () Bool)

(assert (=> d!74649 (=> res!275458 e!268694)))

(assert (=> d!74649 (= res!275458 (bvsge #b00000000000000000000000000000000 (size!14088 lt!208398)))))

(assert (=> d!74649 (= (arrayNoDuplicates!0 lt!208398 #b00000000000000000000000000000000 Nil!8324) e!268694)))

(declare-fun b!460633 () Bool)

(assert (=> b!460633 (= e!268696 call!30146)))

(declare-fun b!460634 () Bool)

(declare-fun e!268697 () Bool)

(assert (=> b!460634 (= e!268697 e!268696)))

(declare-fun c!56510 () Bool)

(assert (=> b!460634 (= c!56510 (validKeyInArray!0 (select (arr!13735 lt!208398) #b00000000000000000000000000000000)))))

(declare-fun bm!30143 () Bool)

(assert (=> bm!30143 (= call!30146 (arrayNoDuplicates!0 lt!208398 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56510 (Cons!8323 (select (arr!13735 lt!208398) #b00000000000000000000000000000000) Nil!8324) Nil!8324)))))

(declare-fun b!460635 () Bool)

(declare-fun e!268695 () Bool)

(assert (=> b!460635 (= e!268695 (contains!2500 Nil!8324 (select (arr!13735 lt!208398) #b00000000000000000000000000000000)))))

(declare-fun b!460636 () Bool)

(assert (=> b!460636 (= e!268694 e!268697)))

(declare-fun res!275459 () Bool)

(assert (=> b!460636 (=> (not res!275459) (not e!268697))))

(assert (=> b!460636 (= res!275459 (not e!268695))))

(declare-fun res!275457 () Bool)

(assert (=> b!460636 (=> (not res!275457) (not e!268695))))

(assert (=> b!460636 (= res!275457 (validKeyInArray!0 (select (arr!13735 lt!208398) #b00000000000000000000000000000000)))))

(assert (= (and d!74649 (not res!275458)) b!460636))

(assert (= (and b!460636 res!275457) b!460635))

(assert (= (and b!460636 res!275459) b!460634))

(assert (= (and b!460634 c!56510) b!460632))

(assert (= (and b!460634 (not c!56510)) b!460633))

(assert (= (or b!460632 b!460633) bm!30143))

(assert (=> b!460634 m!443291))

(assert (=> b!460634 m!443291))

(assert (=> b!460634 m!443293))

(assert (=> bm!30143 m!443291))

(declare-fun m!443461 () Bool)

(assert (=> bm!30143 m!443461))

(assert (=> b!460635 m!443291))

(assert (=> b!460635 m!443291))

(declare-fun m!443463 () Bool)

(assert (=> b!460635 m!443463))

(assert (=> b!460636 m!443291))

(assert (=> b!460636 m!443291))

(assert (=> b!460636 m!443293))

(assert (=> b!460353 d!74649))

(declare-fun mapIsEmpty!20254 () Bool)

(declare-fun mapRes!20254 () Bool)

(assert (=> mapIsEmpty!20254 mapRes!20254))

(declare-fun mapNonEmpty!20254 () Bool)

(declare-fun tp!39028 () Bool)

(declare-fun e!268703 () Bool)

(assert (=> mapNonEmpty!20254 (= mapRes!20254 (and tp!39028 e!268703))))

(declare-fun mapValue!20254 () ValueCell!5855)

(declare-fun mapRest!20254 () (Array (_ BitVec 32) ValueCell!5855))

(declare-fun mapKey!20254 () (_ BitVec 32))

(assert (=> mapNonEmpty!20254 (= mapRest!20245 (store mapRest!20254 mapKey!20254 mapValue!20254))))

(declare-fun b!460643 () Bool)

(assert (=> b!460643 (= e!268703 tp_is_empty!12397)))

(declare-fun condMapEmpty!20254 () Bool)

(declare-fun mapDefault!20254 () ValueCell!5855)

(assert (=> mapNonEmpty!20245 (= condMapEmpty!20254 (= mapRest!20245 ((as const (Array (_ BitVec 32) ValueCell!5855)) mapDefault!20254)))))

(declare-fun e!268702 () Bool)

(assert (=> mapNonEmpty!20245 (= tp!39012 (and e!268702 mapRes!20254))))

(declare-fun b!460644 () Bool)

(assert (=> b!460644 (= e!268702 tp_is_empty!12397)))

(assert (= (and mapNonEmpty!20245 condMapEmpty!20254) mapIsEmpty!20254))

(assert (= (and mapNonEmpty!20245 (not condMapEmpty!20254)) mapNonEmpty!20254))

(assert (= (and mapNonEmpty!20254 ((_ is ValueCellFull!5855) mapValue!20254)) b!460643))

(assert (= (and mapNonEmpty!20245 ((_ is ValueCellFull!5855) mapDefault!20254)) b!460644))

(declare-fun m!443465 () Bool)

(assert (=> mapNonEmpty!20254 m!443465))

(declare-fun b_lambda!9899 () Bool)

(assert (= b_lambda!9897 (or (and start!41176 b_free!11059) b_lambda!9899)))

(declare-fun b_lambda!9901 () Bool)

(assert (= b_lambda!9893 (or (and start!41176 b_free!11059) b_lambda!9901)))

(declare-fun b_lambda!9903 () Bool)

(assert (= b_lambda!9889 (or (and start!41176 b_free!11059) b_lambda!9903)))

(declare-fun b_lambda!9905 () Bool)

(assert (= b_lambda!9883 (or (and start!41176 b_free!11059) b_lambda!9905)))

(declare-fun b_lambda!9907 () Bool)

(assert (= b_lambda!9885 (or (and start!41176 b_free!11059) b_lambda!9907)))

(declare-fun b_lambda!9909 () Bool)

(assert (= b_lambda!9887 (or (and start!41176 b_free!11059) b_lambda!9909)))

(declare-fun b_lambda!9911 () Bool)

(assert (= b_lambda!9891 (or (and start!41176 b_free!11059) b_lambda!9911)))

(declare-fun b_lambda!9913 () Bool)

(assert (= b_lambda!9895 (or (and start!41176 b_free!11059) b_lambda!9913)))

(check-sat (not b!460499) (not b_lambda!9907) (not b!460541) (not b!460586) (not b!460592) (not b_lambda!9903) (not b!460560) (not b!460551) (not b!460562) (not b!460613) (not b!460502) (not b!460577) (not d!74619) (not b_lambda!9909) (not b!460614) (not b!460591) (not b!460634) (not b!460498) (not b!460553) (not b!460631) (not d!74641) (not b!460552) (not d!74625) (not d!74639) (not d!74635) (not b!460588) (not b!460561) (not b_lambda!9901) b_and!19357 (not b!460635) (not b!460513) (not b!460589) (not bm!30129) (not b!460545) (not bm!30133) (not b_lambda!9905) (not d!74611) (not b_lambda!9913) (not b!460615) (not b!460514) (not b!460620) (not b!460599) (not b!460619) (not bm!30130) (not b!460563) (not d!74609) (not b!460623) (not bm!30134) (not b!460602) (not d!74607) (not bm!30143) tp_is_empty!12397 (not b!460576) (not d!74633) (not bm!30142) (not b!460557) (not d!74643) (not b!460597) (not b!460548) (not b!460612) (not bm!30140) (not b!460549) (not b_lambda!9911) (not b!460580) (not bm!30126) (not b!460624) (not b!460500) (not b_lambda!9899) (not b!460609) (not d!74621) (not b_lambda!9881) (not b!460600) (not b!460501) (not bm!30141) (not b!460558) (not bm!30135) (not b_next!11059) (not b!460601) (not b!460578) (not b!460636) (not d!74605) (not b!460596) (not b!460622) (not b!460540) (not b!460546) (not b!460579) (not b!460625) (not b!460585) (not b!460503) (not b!460550) (not mapNonEmpty!20254))
(check-sat b_and!19357 (not b_next!11059))
