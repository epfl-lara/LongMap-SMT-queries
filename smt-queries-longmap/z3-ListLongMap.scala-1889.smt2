; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33790 () Bool)

(assert start!33790)

(declare-fun b_free!7003 () Bool)

(declare-fun b_next!7003 () Bool)

(assert (=> start!33790 (= b_free!7003 (not b_next!7003))))

(declare-fun tp!24518 () Bool)

(declare-fun b_and!14201 () Bool)

(assert (=> start!33790 (= tp!24518 b_and!14201)))

(declare-fun b!336201 () Bool)

(declare-fun e!206372 () Bool)

(declare-fun tp_is_empty!6955 () Bool)

(assert (=> b!336201 (= e!206372 tp_is_empty!6955)))

(declare-fun b!336202 () Bool)

(declare-fun e!206370 () Bool)

(declare-fun e!206368 () Bool)

(assert (=> b!336202 (= e!206370 e!206368)))

(declare-fun res!185584 () Bool)

(assert (=> b!336202 (=> (not res!185584) (not e!206368))))

(declare-datatypes ((SeekEntryResult!3165 0))(
  ( (MissingZero!3165 (index!14839 (_ BitVec 32))) (Found!3165 (index!14840 (_ BitVec 32))) (Intermediate!3165 (undefined!3977 Bool) (index!14841 (_ BitVec 32)) (x!33476 (_ BitVec 32))) (Undefined!3165) (MissingVacant!3165 (index!14842 (_ BitVec 32))) )
))
(declare-fun lt!160177 () SeekEntryResult!3165)

(get-info :version)

(assert (=> b!336202 (= res!185584 (and (not ((_ is Found!3165) lt!160177)) ((_ is MissingZero!3165) lt!160177)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17492 0))(
  ( (array!17493 (arr!8274 (Array (_ BitVec 32) (_ BitVec 64))) (size!8626 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17492)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17492 (_ BitVec 32)) SeekEntryResult!3165)

(assert (=> b!336202 (= lt!160177 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336203 () Bool)

(assert (=> b!336203 (= e!206368 (or (bvsge #b00000000000000000000000000000000 (size!8626 _keys!1895)) (bvsge (size!8626 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!11835 () Bool)

(declare-fun mapRes!11835 () Bool)

(declare-fun tp!24519 () Bool)

(assert (=> mapNonEmpty!11835 (= mapRes!11835 (and tp!24519 e!206372))))

(declare-datatypes ((V!10251 0))(
  ( (V!10252 (val!3522 Int)) )
))
(declare-datatypes ((ValueCell!3134 0))(
  ( (ValueCellFull!3134 (v!5687 V!10251)) (EmptyCell!3134) )
))
(declare-datatypes ((array!17494 0))(
  ( (array!17495 (arr!8275 (Array (_ BitVec 32) ValueCell!3134)) (size!8627 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17494)

(declare-fun mapValue!11835 () ValueCell!3134)

(declare-fun mapKey!11835 () (_ BitVec 32))

(declare-fun mapRest!11835 () (Array (_ BitVec 32) ValueCell!3134))

(assert (=> mapNonEmpty!11835 (= (arr!8275 _values!1525) (store mapRest!11835 mapKey!11835 mapValue!11835))))

(declare-fun b!336204 () Bool)

(declare-fun res!185586 () Bool)

(assert (=> b!336204 (=> (not res!185586) (not e!206370))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336204 (= res!185586 (and (= (size!8627 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8626 _keys!1895) (size!8627 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11835 () Bool)

(assert (=> mapIsEmpty!11835 mapRes!11835))

(declare-fun b!336205 () Bool)

(declare-fun res!185582 () Bool)

(assert (=> b!336205 (=> (not res!185582) (not e!206370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17492 (_ BitVec 32)) Bool)

(assert (=> b!336205 (= res!185582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336206 () Bool)

(declare-fun res!185588 () Bool)

(assert (=> b!336206 (=> (not res!185588) (not e!206370))))

(declare-fun zeroValue!1467 () V!10251)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10251)

(declare-datatypes ((tuple2!5036 0))(
  ( (tuple2!5037 (_1!2529 (_ BitVec 64)) (_2!2529 V!10251)) )
))
(declare-datatypes ((List!4651 0))(
  ( (Nil!4648) (Cons!4647 (h!5503 tuple2!5036) (t!9735 List!4651)) )
))
(declare-datatypes ((ListLongMap!3951 0))(
  ( (ListLongMap!3952 (toList!1991 List!4651)) )
))
(declare-fun contains!2056 (ListLongMap!3951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1520 (array!17492 array!17494 (_ BitVec 32) (_ BitVec 32) V!10251 V!10251 (_ BitVec 32) Int) ListLongMap!3951)

(assert (=> b!336206 (= res!185588 (not (contains!2056 (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336207 () Bool)

(declare-fun res!185581 () Bool)

(assert (=> b!336207 (=> (not res!185581) (not e!206368))))

(declare-fun arrayContainsKey!0 (array!17492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336207 (= res!185581 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336208 () Bool)

(declare-fun e!206369 () Bool)

(assert (=> b!336208 (= e!206369 tp_is_empty!6955)))

(declare-fun res!185587 () Bool)

(assert (=> start!33790 (=> (not res!185587) (not e!206370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33790 (= res!185587 (validMask!0 mask!2385))))

(assert (=> start!33790 e!206370))

(assert (=> start!33790 true))

(assert (=> start!33790 tp_is_empty!6955))

(assert (=> start!33790 tp!24518))

(declare-fun e!206367 () Bool)

(declare-fun array_inv!6152 (array!17494) Bool)

(assert (=> start!33790 (and (array_inv!6152 _values!1525) e!206367)))

(declare-fun array_inv!6153 (array!17492) Bool)

(assert (=> start!33790 (array_inv!6153 _keys!1895)))

(declare-fun b!336209 () Bool)

(assert (=> b!336209 (= e!206367 (and e!206369 mapRes!11835))))

(declare-fun condMapEmpty!11835 () Bool)

(declare-fun mapDefault!11835 () ValueCell!3134)

(assert (=> b!336209 (= condMapEmpty!11835 (= (arr!8275 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3134)) mapDefault!11835)))))

(declare-fun b!336210 () Bool)

(declare-fun res!185585 () Bool)

(assert (=> b!336210 (=> (not res!185585) (not e!206370))))

(declare-datatypes ((List!4652 0))(
  ( (Nil!4649) (Cons!4648 (h!5504 (_ BitVec 64)) (t!9736 List!4652)) )
))
(declare-fun arrayNoDuplicates!0 (array!17492 (_ BitVec 32) List!4652) Bool)

(assert (=> b!336210 (= res!185585 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4649))))

(declare-fun b!336211 () Bool)

(declare-fun res!185583 () Bool)

(assert (=> b!336211 (=> (not res!185583) (not e!206370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336211 (= res!185583 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33790 res!185587) b!336204))

(assert (= (and b!336204 res!185586) b!336205))

(assert (= (and b!336205 res!185582) b!336210))

(assert (= (and b!336210 res!185585) b!336211))

(assert (= (and b!336211 res!185583) b!336206))

(assert (= (and b!336206 res!185588) b!336202))

(assert (= (and b!336202 res!185584) b!336207))

(assert (= (and b!336207 res!185581) b!336203))

(assert (= (and b!336209 condMapEmpty!11835) mapIsEmpty!11835))

(assert (= (and b!336209 (not condMapEmpty!11835)) mapNonEmpty!11835))

(assert (= (and mapNonEmpty!11835 ((_ is ValueCellFull!3134) mapValue!11835)) b!336201))

(assert (= (and b!336209 ((_ is ValueCellFull!3134) mapDefault!11835)) b!336208))

(assert (= start!33790 b!336209))

(declare-fun m!340333 () Bool)

(assert (=> b!336207 m!340333))

(declare-fun m!340335 () Bool)

(assert (=> mapNonEmpty!11835 m!340335))

(declare-fun m!340337 () Bool)

(assert (=> b!336206 m!340337))

(assert (=> b!336206 m!340337))

(declare-fun m!340339 () Bool)

(assert (=> b!336206 m!340339))

(declare-fun m!340341 () Bool)

(assert (=> b!336210 m!340341))

(declare-fun m!340343 () Bool)

(assert (=> b!336211 m!340343))

(declare-fun m!340345 () Bool)

(assert (=> b!336202 m!340345))

(declare-fun m!340347 () Bool)

(assert (=> b!336205 m!340347))

(declare-fun m!340349 () Bool)

(assert (=> start!33790 m!340349))

(declare-fun m!340351 () Bool)

(assert (=> start!33790 m!340351))

(declare-fun m!340353 () Bool)

(assert (=> start!33790 m!340353))

(check-sat tp_is_empty!6955 (not b!336202) (not start!33790) (not b_next!7003) (not b!336210) (not b!336205) b_and!14201 (not b!336206) (not mapNonEmpty!11835) (not b!336211) (not b!336207))
(check-sat b_and!14201 (not b_next!7003))
(get-model)

(declare-fun b!336291 () Bool)

(declare-fun e!206415 () SeekEntryResult!3165)

(declare-fun lt!160190 () SeekEntryResult!3165)

(assert (=> b!336291 (= e!206415 (Found!3165 (index!14841 lt!160190)))))

(declare-fun b!336292 () Bool)

(declare-fun e!206417 () SeekEntryResult!3165)

(assert (=> b!336292 (= e!206417 (MissingZero!3165 (index!14841 lt!160190)))))

(declare-fun b!336293 () Bool)

(declare-fun e!206416 () SeekEntryResult!3165)

(assert (=> b!336293 (= e!206416 Undefined!3165)))

(declare-fun b!336294 () Bool)

(assert (=> b!336294 (= e!206416 e!206415)))

(declare-fun lt!160191 () (_ BitVec 64))

(assert (=> b!336294 (= lt!160191 (select (arr!8274 _keys!1895) (index!14841 lt!160190)))))

(declare-fun c!52250 () Bool)

(assert (=> b!336294 (= c!52250 (= lt!160191 k0!1348))))

(declare-fun b!336295 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17492 (_ BitVec 32)) SeekEntryResult!3165)

(assert (=> b!336295 (= e!206417 (seekKeyOrZeroReturnVacant!0 (x!33476 lt!160190) (index!14841 lt!160190) (index!14841 lt!160190) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336290 () Bool)

(declare-fun c!52249 () Bool)

(assert (=> b!336290 (= c!52249 (= lt!160191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!336290 (= e!206415 e!206417)))

(declare-fun d!70721 () Bool)

(declare-fun lt!160192 () SeekEntryResult!3165)

(assert (=> d!70721 (and (or ((_ is Undefined!3165) lt!160192) (not ((_ is Found!3165) lt!160192)) (and (bvsge (index!14840 lt!160192) #b00000000000000000000000000000000) (bvslt (index!14840 lt!160192) (size!8626 _keys!1895)))) (or ((_ is Undefined!3165) lt!160192) ((_ is Found!3165) lt!160192) (not ((_ is MissingZero!3165) lt!160192)) (and (bvsge (index!14839 lt!160192) #b00000000000000000000000000000000) (bvslt (index!14839 lt!160192) (size!8626 _keys!1895)))) (or ((_ is Undefined!3165) lt!160192) ((_ is Found!3165) lt!160192) ((_ is MissingZero!3165) lt!160192) (not ((_ is MissingVacant!3165) lt!160192)) (and (bvsge (index!14842 lt!160192) #b00000000000000000000000000000000) (bvslt (index!14842 lt!160192) (size!8626 _keys!1895)))) (or ((_ is Undefined!3165) lt!160192) (ite ((_ is Found!3165) lt!160192) (= (select (arr!8274 _keys!1895) (index!14840 lt!160192)) k0!1348) (ite ((_ is MissingZero!3165) lt!160192) (= (select (arr!8274 _keys!1895) (index!14839 lt!160192)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3165) lt!160192) (= (select (arr!8274 _keys!1895) (index!14842 lt!160192)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70721 (= lt!160192 e!206416)))

(declare-fun c!52248 () Bool)

(assert (=> d!70721 (= c!52248 (and ((_ is Intermediate!3165) lt!160190) (undefined!3977 lt!160190)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17492 (_ BitVec 32)) SeekEntryResult!3165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70721 (= lt!160190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70721 (validMask!0 mask!2385)))

(assert (=> d!70721 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160192)))

(assert (= (and d!70721 c!52248) b!336293))

(assert (= (and d!70721 (not c!52248)) b!336294))

(assert (= (and b!336294 c!52250) b!336291))

(assert (= (and b!336294 (not c!52250)) b!336290))

(assert (= (and b!336290 c!52249) b!336292))

(assert (= (and b!336290 (not c!52249)) b!336295))

(declare-fun m!340399 () Bool)

(assert (=> b!336294 m!340399))

(declare-fun m!340401 () Bool)

(assert (=> b!336295 m!340401))

(declare-fun m!340403 () Bool)

(assert (=> d!70721 m!340403))

(declare-fun m!340405 () Bool)

(assert (=> d!70721 m!340405))

(declare-fun m!340407 () Bool)

(assert (=> d!70721 m!340407))

(declare-fun m!340409 () Bool)

(assert (=> d!70721 m!340409))

(assert (=> d!70721 m!340349))

(declare-fun m!340411 () Bool)

(assert (=> d!70721 m!340411))

(assert (=> d!70721 m!340403))

(assert (=> b!336202 d!70721))

(declare-fun d!70723 () Bool)

(assert (=> d!70723 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!336211 d!70723))

(declare-fun d!70725 () Bool)

(declare-fun e!206423 () Bool)

(assert (=> d!70725 e!206423))

(declare-fun res!185639 () Bool)

(assert (=> d!70725 (=> res!185639 e!206423)))

(declare-fun lt!160202 () Bool)

(assert (=> d!70725 (= res!185639 (not lt!160202))))

(declare-fun lt!160201 () Bool)

(assert (=> d!70725 (= lt!160202 lt!160201)))

(declare-datatypes ((Unit!10433 0))(
  ( (Unit!10434) )
))
(declare-fun lt!160203 () Unit!10433)

(declare-fun e!206422 () Unit!10433)

(assert (=> d!70725 (= lt!160203 e!206422)))

(declare-fun c!52253 () Bool)

(assert (=> d!70725 (= c!52253 lt!160201)))

(declare-fun containsKey!318 (List!4651 (_ BitVec 64)) Bool)

(assert (=> d!70725 (= lt!160201 (containsKey!318 (toList!1991 (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70725 (= (contains!2056 (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160202)))

(declare-fun b!336302 () Bool)

(declare-fun lt!160204 () Unit!10433)

(assert (=> b!336302 (= e!206422 lt!160204)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!266 (List!4651 (_ BitVec 64)) Unit!10433)

(assert (=> b!336302 (= lt!160204 (lemmaContainsKeyImpliesGetValueByKeyDefined!266 (toList!1991 (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!333 0))(
  ( (Some!332 (v!5690 V!10251)) (None!331) )
))
(declare-fun isDefined!267 (Option!333) Bool)

(declare-fun getValueByKey!327 (List!4651 (_ BitVec 64)) Option!333)

(assert (=> b!336302 (isDefined!267 (getValueByKey!327 (toList!1991 (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!336303 () Bool)

(declare-fun Unit!10435 () Unit!10433)

(assert (=> b!336303 (= e!206422 Unit!10435)))

(declare-fun b!336304 () Bool)

(assert (=> b!336304 (= e!206423 (isDefined!267 (getValueByKey!327 (toList!1991 (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70725 c!52253) b!336302))

(assert (= (and d!70725 (not c!52253)) b!336303))

(assert (= (and d!70725 (not res!185639)) b!336304))

(declare-fun m!340413 () Bool)

(assert (=> d!70725 m!340413))

(declare-fun m!340415 () Bool)

(assert (=> b!336302 m!340415))

(declare-fun m!340417 () Bool)

(assert (=> b!336302 m!340417))

(assert (=> b!336302 m!340417))

(declare-fun m!340419 () Bool)

(assert (=> b!336302 m!340419))

(assert (=> b!336304 m!340417))

(assert (=> b!336304 m!340417))

(assert (=> b!336304 m!340419))

(assert (=> b!336206 d!70725))

(declare-fun b!336347 () Bool)

(declare-fun res!185661 () Bool)

(declare-fun e!206454 () Bool)

(assert (=> b!336347 (=> (not res!185661) (not e!206454))))

(declare-fun e!206456 () Bool)

(assert (=> b!336347 (= res!185661 e!206456)))

(declare-fun c!52268 () Bool)

(assert (=> b!336347 (= c!52268 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26348 () Bool)

(declare-fun call!26357 () ListLongMap!3951)

(declare-fun call!26356 () ListLongMap!3951)

(assert (=> bm!26348 (= call!26357 call!26356)))

(declare-fun b!336348 () Bool)

(declare-fun e!206459 () Bool)

(declare-fun e!206461 () Bool)

(assert (=> b!336348 (= e!206459 e!206461)))

(declare-fun res!185662 () Bool)

(declare-fun call!26354 () Bool)

(assert (=> b!336348 (= res!185662 call!26354)))

(assert (=> b!336348 (=> (not res!185662) (not e!206461))))

(declare-fun b!336349 () Bool)

(declare-fun e!206458 () ListLongMap!3951)

(declare-fun e!206453 () ListLongMap!3951)

(assert (=> b!336349 (= e!206458 e!206453)))

(declare-fun c!52271 () Bool)

(assert (=> b!336349 (= c!52271 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!336350 () Bool)

(declare-fun e!206450 () Bool)

(assert (=> b!336350 (= e!206456 e!206450)))

(declare-fun res!185660 () Bool)

(declare-fun call!26355 () Bool)

(assert (=> b!336350 (= res!185660 call!26355)))

(assert (=> b!336350 (=> (not res!185660) (not e!206450))))

(declare-fun b!336351 () Bool)

(assert (=> b!336351 (= e!206454 e!206459)))

(declare-fun c!52267 () Bool)

(assert (=> b!336351 (= c!52267 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!336352 () Bool)

(declare-fun e!206462 () ListLongMap!3951)

(assert (=> b!336352 (= e!206462 call!26357)))

(declare-fun b!336353 () Bool)

(declare-fun lt!160258 () ListLongMap!3951)

(declare-fun apply!268 (ListLongMap!3951 (_ BitVec 64)) V!10251)

(assert (=> b!336353 (= e!206450 (= (apply!268 lt!160258 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!336354 () Bool)

(declare-fun call!26352 () ListLongMap!3951)

(assert (=> b!336354 (= e!206462 call!26352)))

(declare-fun b!336355 () Bool)

(declare-fun e!206452 () Bool)

(assert (=> b!336355 (= e!206452 (validKeyInArray!0 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336356 () Bool)

(declare-fun e!206455 () Unit!10433)

(declare-fun Unit!10436 () Unit!10433)

(assert (=> b!336356 (= e!206455 Unit!10436)))

(declare-fun b!336357 () Bool)

(declare-fun res!185664 () Bool)

(assert (=> b!336357 (=> (not res!185664) (not e!206454))))

(declare-fun e!206451 () Bool)

(assert (=> b!336357 (= res!185664 e!206451)))

(declare-fun res!185658 () Bool)

(assert (=> b!336357 (=> res!185658 e!206451)))

(assert (=> b!336357 (= res!185658 (not e!206452))))

(declare-fun res!185665 () Bool)

(assert (=> b!336357 (=> (not res!185665) (not e!206452))))

(assert (=> b!336357 (= res!185665 (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(declare-fun bm!26349 () Bool)

(declare-fun call!26351 () ListLongMap!3951)

(assert (=> bm!26349 (= call!26352 call!26351)))

(declare-fun b!336358 () Bool)

(assert (=> b!336358 (= e!206456 (not call!26355))))

(declare-fun c!52266 () Bool)

(declare-fun bm!26350 () Bool)

(declare-fun call!26353 () ListLongMap!3951)

(declare-fun +!719 (ListLongMap!3951 tuple2!5036) ListLongMap!3951)

(assert (=> bm!26350 (= call!26356 (+!719 (ite c!52266 call!26353 (ite c!52271 call!26351 call!26352)) (ite (or c!52266 c!52271) (tuple2!5037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun d!70727 () Bool)

(assert (=> d!70727 e!206454))

(declare-fun res!185659 () Bool)

(assert (=> d!70727 (=> (not res!185659) (not e!206454))))

(assert (=> d!70727 (= res!185659 (or (bvsge #b00000000000000000000000000000000 (size!8626 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))))

(declare-fun lt!160267 () ListLongMap!3951)

(assert (=> d!70727 (= lt!160258 lt!160267)))

(declare-fun lt!160257 () Unit!10433)

(assert (=> d!70727 (= lt!160257 e!206455)))

(declare-fun c!52270 () Bool)

(declare-fun e!206457 () Bool)

(assert (=> d!70727 (= c!52270 e!206457)))

(declare-fun res!185666 () Bool)

(assert (=> d!70727 (=> (not res!185666) (not e!206457))))

(assert (=> d!70727 (= res!185666 (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(assert (=> d!70727 (= lt!160267 e!206458)))

(assert (=> d!70727 (= c!52266 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70727 (validMask!0 mask!2385)))

(assert (=> d!70727 (= (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160258)))

(declare-fun b!336359 () Bool)

(declare-fun lt!160260 () Unit!10433)

(assert (=> b!336359 (= e!206455 lt!160260)))

(declare-fun lt!160251 () ListLongMap!3951)

(declare-fun getCurrentListMapNoExtraKeys!584 (array!17492 array!17494 (_ BitVec 32) (_ BitVec 32) V!10251 V!10251 (_ BitVec 32) Int) ListLongMap!3951)

(assert (=> b!336359 (= lt!160251 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160255 () (_ BitVec 64))

(assert (=> b!336359 (= lt!160255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160266 () (_ BitVec 64))

(assert (=> b!336359 (= lt!160266 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160268 () Unit!10433)

(declare-fun addStillContains!244 (ListLongMap!3951 (_ BitVec 64) V!10251 (_ BitVec 64)) Unit!10433)

(assert (=> b!336359 (= lt!160268 (addStillContains!244 lt!160251 lt!160255 zeroValue!1467 lt!160266))))

(assert (=> b!336359 (contains!2056 (+!719 lt!160251 (tuple2!5037 lt!160255 zeroValue!1467)) lt!160266)))

(declare-fun lt!160270 () Unit!10433)

(assert (=> b!336359 (= lt!160270 lt!160268)))

(declare-fun lt!160253 () ListLongMap!3951)

(assert (=> b!336359 (= lt!160253 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160254 () (_ BitVec 64))

(assert (=> b!336359 (= lt!160254 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160256 () (_ BitVec 64))

(assert (=> b!336359 (= lt!160256 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160262 () Unit!10433)

(declare-fun addApplyDifferent!244 (ListLongMap!3951 (_ BitVec 64) V!10251 (_ BitVec 64)) Unit!10433)

(assert (=> b!336359 (= lt!160262 (addApplyDifferent!244 lt!160253 lt!160254 minValue!1467 lt!160256))))

(assert (=> b!336359 (= (apply!268 (+!719 lt!160253 (tuple2!5037 lt!160254 minValue!1467)) lt!160256) (apply!268 lt!160253 lt!160256))))

(declare-fun lt!160269 () Unit!10433)

(assert (=> b!336359 (= lt!160269 lt!160262)))

(declare-fun lt!160265 () ListLongMap!3951)

(assert (=> b!336359 (= lt!160265 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160261 () (_ BitVec 64))

(assert (=> b!336359 (= lt!160261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160259 () (_ BitVec 64))

(assert (=> b!336359 (= lt!160259 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160252 () Unit!10433)

(assert (=> b!336359 (= lt!160252 (addApplyDifferent!244 lt!160265 lt!160261 zeroValue!1467 lt!160259))))

(assert (=> b!336359 (= (apply!268 (+!719 lt!160265 (tuple2!5037 lt!160261 zeroValue!1467)) lt!160259) (apply!268 lt!160265 lt!160259))))

(declare-fun lt!160249 () Unit!10433)

(assert (=> b!336359 (= lt!160249 lt!160252)))

(declare-fun lt!160263 () ListLongMap!3951)

(assert (=> b!336359 (= lt!160263 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160264 () (_ BitVec 64))

(assert (=> b!336359 (= lt!160264 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160250 () (_ BitVec 64))

(assert (=> b!336359 (= lt!160250 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!336359 (= lt!160260 (addApplyDifferent!244 lt!160263 lt!160264 minValue!1467 lt!160250))))

(assert (=> b!336359 (= (apply!268 (+!719 lt!160263 (tuple2!5037 lt!160264 minValue!1467)) lt!160250) (apply!268 lt!160263 lt!160250))))

(declare-fun b!336360 () Bool)

(assert (=> b!336360 (= e!206458 (+!719 call!26356 (tuple2!5037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26351 () Bool)

(assert (=> bm!26351 (= call!26354 (contains!2056 lt!160258 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!336361 () Bool)

(assert (=> b!336361 (= e!206453 call!26357)))

(declare-fun b!336362 () Bool)

(declare-fun e!206460 () Bool)

(declare-fun get!4538 (ValueCell!3134 V!10251) V!10251)

(declare-fun dynLambda!611 (Int (_ BitVec 64)) V!10251)

(assert (=> b!336362 (= e!206460 (= (apply!268 lt!160258 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000)) (get!4538 (select (arr!8275 _values!1525) #b00000000000000000000000000000000) (dynLambda!611 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!336362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8627 _values!1525)))))

(assert (=> b!336362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(declare-fun bm!26352 () Bool)

(assert (=> bm!26352 (= call!26351 call!26353)))

(declare-fun b!336363 () Bool)

(assert (=> b!336363 (= e!206451 e!206460)))

(declare-fun res!185663 () Bool)

(assert (=> b!336363 (=> (not res!185663) (not e!206460))))

(assert (=> b!336363 (= res!185663 (contains!2056 lt!160258 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!336363 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(declare-fun bm!26353 () Bool)

(assert (=> bm!26353 (= call!26353 (getCurrentListMapNoExtraKeys!584 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!336364 () Bool)

(declare-fun c!52269 () Bool)

(assert (=> b!336364 (= c!52269 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!336364 (= e!206453 e!206462)))

(declare-fun b!336365 () Bool)

(assert (=> b!336365 (= e!206459 (not call!26354))))

(declare-fun b!336366 () Bool)

(assert (=> b!336366 (= e!206457 (validKeyInArray!0 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336367 () Bool)

(assert (=> b!336367 (= e!206461 (= (apply!268 lt!160258 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26354 () Bool)

(assert (=> bm!26354 (= call!26355 (contains!2056 lt!160258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70727 c!52266) b!336360))

(assert (= (and d!70727 (not c!52266)) b!336349))

(assert (= (and b!336349 c!52271) b!336361))

(assert (= (and b!336349 (not c!52271)) b!336364))

(assert (= (and b!336364 c!52269) b!336352))

(assert (= (and b!336364 (not c!52269)) b!336354))

(assert (= (or b!336352 b!336354) bm!26349))

(assert (= (or b!336361 bm!26349) bm!26352))

(assert (= (or b!336361 b!336352) bm!26348))

(assert (= (or b!336360 bm!26352) bm!26353))

(assert (= (or b!336360 bm!26348) bm!26350))

(assert (= (and d!70727 res!185666) b!336366))

(assert (= (and d!70727 c!52270) b!336359))

(assert (= (and d!70727 (not c!52270)) b!336356))

(assert (= (and d!70727 res!185659) b!336357))

(assert (= (and b!336357 res!185665) b!336355))

(assert (= (and b!336357 (not res!185658)) b!336363))

(assert (= (and b!336363 res!185663) b!336362))

(assert (= (and b!336357 res!185664) b!336347))

(assert (= (and b!336347 c!52268) b!336350))

(assert (= (and b!336347 (not c!52268)) b!336358))

(assert (= (and b!336350 res!185660) b!336353))

(assert (= (or b!336350 b!336358) bm!26354))

(assert (= (and b!336347 res!185661) b!336351))

(assert (= (and b!336351 c!52267) b!336348))

(assert (= (and b!336351 (not c!52267)) b!336365))

(assert (= (and b!336348 res!185662) b!336367))

(assert (= (or b!336348 b!336365) bm!26351))

(declare-fun b_lambda!8433 () Bool)

(assert (=> (not b_lambda!8433) (not b!336362)))

(declare-fun t!9740 () Bool)

(declare-fun tb!3043 () Bool)

(assert (=> (and start!33790 (= defaultEntry!1528 defaultEntry!1528) t!9740) tb!3043))

(declare-fun result!5475 () Bool)

(assert (=> tb!3043 (= result!5475 tp_is_empty!6955)))

(assert (=> b!336362 t!9740))

(declare-fun b_and!14207 () Bool)

(assert (= b_and!14201 (and (=> t!9740 result!5475) b_and!14207)))

(declare-fun m!340421 () Bool)

(assert (=> bm!26351 m!340421))

(declare-fun m!340423 () Bool)

(assert (=> b!336359 m!340423))

(declare-fun m!340425 () Bool)

(assert (=> b!336359 m!340425))

(declare-fun m!340427 () Bool)

(assert (=> b!336359 m!340427))

(declare-fun m!340429 () Bool)

(assert (=> b!336359 m!340429))

(declare-fun m!340431 () Bool)

(assert (=> b!336359 m!340431))

(assert (=> b!336359 m!340423))

(declare-fun m!340433 () Bool)

(assert (=> b!336359 m!340433))

(assert (=> b!336359 m!340425))

(declare-fun m!340435 () Bool)

(assert (=> b!336359 m!340435))

(declare-fun m!340437 () Bool)

(assert (=> b!336359 m!340437))

(assert (=> b!336359 m!340429))

(declare-fun m!340439 () Bool)

(assert (=> b!336359 m!340439))

(declare-fun m!340441 () Bool)

(assert (=> b!336359 m!340441))

(declare-fun m!340443 () Bool)

(assert (=> b!336359 m!340443))

(declare-fun m!340445 () Bool)

(assert (=> b!336359 m!340445))

(declare-fun m!340447 () Bool)

(assert (=> b!336359 m!340447))

(declare-fun m!340449 () Bool)

(assert (=> b!336359 m!340449))

(declare-fun m!340451 () Bool)

(assert (=> b!336359 m!340451))

(declare-fun m!340453 () Bool)

(assert (=> b!336359 m!340453))

(declare-fun m!340455 () Bool)

(assert (=> b!336359 m!340455))

(assert (=> b!336359 m!340447))

(assert (=> b!336355 m!340455))

(assert (=> b!336355 m!340455))

(declare-fun m!340457 () Bool)

(assert (=> b!336355 m!340457))

(declare-fun m!340459 () Bool)

(assert (=> b!336353 m!340459))

(declare-fun m!340461 () Bool)

(assert (=> b!336367 m!340461))

(assert (=> b!336366 m!340455))

(assert (=> b!336366 m!340455))

(assert (=> b!336366 m!340457))

(declare-fun m!340463 () Bool)

(assert (=> bm!26354 m!340463))

(declare-fun m!340465 () Bool)

(assert (=> b!336360 m!340465))

(assert (=> b!336362 m!340455))

(declare-fun m!340467 () Bool)

(assert (=> b!336362 m!340467))

(declare-fun m!340469 () Bool)

(assert (=> b!336362 m!340469))

(declare-fun m!340471 () Bool)

(assert (=> b!336362 m!340471))

(declare-fun m!340473 () Bool)

(assert (=> b!336362 m!340473))

(assert (=> b!336362 m!340471))

(assert (=> b!336362 m!340469))

(assert (=> b!336362 m!340455))

(declare-fun m!340475 () Bool)

(assert (=> bm!26350 m!340475))

(assert (=> d!70727 m!340349))

(assert (=> bm!26353 m!340445))

(assert (=> b!336363 m!340455))

(assert (=> b!336363 m!340455))

(declare-fun m!340477 () Bool)

(assert (=> b!336363 m!340477))

(assert (=> b!336206 d!70727))

(declare-fun b!336380 () Bool)

(declare-fun e!206473 () Bool)

(declare-fun call!26360 () Bool)

(assert (=> b!336380 (= e!206473 call!26360)))

(declare-fun d!70729 () Bool)

(declare-fun res!185673 () Bool)

(declare-fun e!206472 () Bool)

(assert (=> d!70729 (=> res!185673 e!206472)))

(assert (=> d!70729 (= res!185673 (bvsge #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(assert (=> d!70729 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4649) e!206472)))

(declare-fun b!336381 () Bool)

(declare-fun e!206474 () Bool)

(assert (=> b!336381 (= e!206472 e!206474)))

(declare-fun res!185674 () Bool)

(assert (=> b!336381 (=> (not res!185674) (not e!206474))))

(declare-fun e!206471 () Bool)

(assert (=> b!336381 (= res!185674 (not e!206471))))

(declare-fun res!185675 () Bool)

(assert (=> b!336381 (=> (not res!185675) (not e!206471))))

(assert (=> b!336381 (= res!185675 (validKeyInArray!0 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336382 () Bool)

(assert (=> b!336382 (= e!206474 e!206473)))

(declare-fun c!52274 () Bool)

(assert (=> b!336382 (= c!52274 (validKeyInArray!0 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336383 () Bool)

(assert (=> b!336383 (= e!206473 call!26360)))

(declare-fun bm!26357 () Bool)

(assert (=> bm!26357 (= call!26360 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52274 (Cons!4648 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000) Nil!4649) Nil!4649)))))

(declare-fun b!336384 () Bool)

(declare-fun contains!2058 (List!4652 (_ BitVec 64)) Bool)

(assert (=> b!336384 (= e!206471 (contains!2058 Nil!4649 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70729 (not res!185673)) b!336381))

(assert (= (and b!336381 res!185675) b!336384))

(assert (= (and b!336381 res!185674) b!336382))

(assert (= (and b!336382 c!52274) b!336383))

(assert (= (and b!336382 (not c!52274)) b!336380))

(assert (= (or b!336383 b!336380) bm!26357))

(assert (=> b!336381 m!340455))

(assert (=> b!336381 m!340455))

(assert (=> b!336381 m!340457))

(assert (=> b!336382 m!340455))

(assert (=> b!336382 m!340455))

(assert (=> b!336382 m!340457))

(assert (=> bm!26357 m!340455))

(declare-fun m!340479 () Bool)

(assert (=> bm!26357 m!340479))

(assert (=> b!336384 m!340455))

(assert (=> b!336384 m!340455))

(declare-fun m!340481 () Bool)

(assert (=> b!336384 m!340481))

(assert (=> b!336210 d!70729))

(declare-fun b!336393 () Bool)

(declare-fun e!206481 () Bool)

(declare-fun e!206482 () Bool)

(assert (=> b!336393 (= e!206481 e!206482)))

(declare-fun lt!160277 () (_ BitVec 64))

(assert (=> b!336393 (= lt!160277 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160278 () Unit!10433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17492 (_ BitVec 64) (_ BitVec 32)) Unit!10433)

(assert (=> b!336393 (= lt!160278 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160277 #b00000000000000000000000000000000))))

(assert (=> b!336393 (arrayContainsKey!0 _keys!1895 lt!160277 #b00000000000000000000000000000000)))

(declare-fun lt!160279 () Unit!10433)

(assert (=> b!336393 (= lt!160279 lt!160278)))

(declare-fun res!185681 () Bool)

(assert (=> b!336393 (= res!185681 (= (seekEntryOrOpen!0 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3165 #b00000000000000000000000000000000)))))

(assert (=> b!336393 (=> (not res!185681) (not e!206482))))

(declare-fun bm!26360 () Bool)

(declare-fun call!26363 () Bool)

(assert (=> bm!26360 (= call!26363 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!336394 () Bool)

(assert (=> b!336394 (= e!206481 call!26363)))

(declare-fun b!336395 () Bool)

(assert (=> b!336395 (= e!206482 call!26363)))

(declare-fun d!70731 () Bool)

(declare-fun res!185680 () Bool)

(declare-fun e!206483 () Bool)

(assert (=> d!70731 (=> res!185680 e!206483)))

(assert (=> d!70731 (= res!185680 (bvsge #b00000000000000000000000000000000 (size!8626 _keys!1895)))))

(assert (=> d!70731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206483)))

(declare-fun b!336396 () Bool)

(assert (=> b!336396 (= e!206483 e!206481)))

(declare-fun c!52277 () Bool)

(assert (=> b!336396 (= c!52277 (validKeyInArray!0 (select (arr!8274 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70731 (not res!185680)) b!336396))

(assert (= (and b!336396 c!52277) b!336393))

(assert (= (and b!336396 (not c!52277)) b!336394))

(assert (= (and b!336393 res!185681) b!336395))

(assert (= (or b!336395 b!336394) bm!26360))

(assert (=> b!336393 m!340455))

(declare-fun m!340483 () Bool)

(assert (=> b!336393 m!340483))

(declare-fun m!340485 () Bool)

(assert (=> b!336393 m!340485))

(assert (=> b!336393 m!340455))

(declare-fun m!340487 () Bool)

(assert (=> b!336393 m!340487))

(declare-fun m!340489 () Bool)

(assert (=> bm!26360 m!340489))

(assert (=> b!336396 m!340455))

(assert (=> b!336396 m!340455))

(assert (=> b!336396 m!340457))

(assert (=> b!336205 d!70731))

(declare-fun d!70733 () Bool)

(declare-fun res!185686 () Bool)

(declare-fun e!206488 () Bool)

(assert (=> d!70733 (=> res!185686 e!206488)))

(assert (=> d!70733 (= res!185686 (= (select (arr!8274 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70733 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!206488)))

(declare-fun b!336401 () Bool)

(declare-fun e!206489 () Bool)

(assert (=> b!336401 (= e!206488 e!206489)))

(declare-fun res!185687 () Bool)

(assert (=> b!336401 (=> (not res!185687) (not e!206489))))

(assert (=> b!336401 (= res!185687 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8626 _keys!1895)))))

(declare-fun b!336402 () Bool)

(assert (=> b!336402 (= e!206489 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70733 (not res!185686)) b!336401))

(assert (= (and b!336401 res!185687) b!336402))

(assert (=> d!70733 m!340455))

(declare-fun m!340491 () Bool)

(assert (=> b!336402 m!340491))

(assert (=> b!336207 d!70733))

(declare-fun d!70735 () Bool)

(assert (=> d!70735 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33790 d!70735))

(declare-fun d!70737 () Bool)

(assert (=> d!70737 (= (array_inv!6152 _values!1525) (bvsge (size!8627 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33790 d!70737))

(declare-fun d!70739 () Bool)

(assert (=> d!70739 (= (array_inv!6153 _keys!1895) (bvsge (size!8626 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33790 d!70739))

(declare-fun mapIsEmpty!11844 () Bool)

(declare-fun mapRes!11844 () Bool)

(assert (=> mapIsEmpty!11844 mapRes!11844))

(declare-fun b!336410 () Bool)

(declare-fun e!206495 () Bool)

(assert (=> b!336410 (= e!206495 tp_is_empty!6955)))

(declare-fun condMapEmpty!11844 () Bool)

(declare-fun mapDefault!11844 () ValueCell!3134)

(assert (=> mapNonEmpty!11835 (= condMapEmpty!11844 (= mapRest!11835 ((as const (Array (_ BitVec 32) ValueCell!3134)) mapDefault!11844)))))

(assert (=> mapNonEmpty!11835 (= tp!24519 (and e!206495 mapRes!11844))))

(declare-fun mapNonEmpty!11844 () Bool)

(declare-fun tp!24534 () Bool)

(declare-fun e!206494 () Bool)

(assert (=> mapNonEmpty!11844 (= mapRes!11844 (and tp!24534 e!206494))))

(declare-fun mapRest!11844 () (Array (_ BitVec 32) ValueCell!3134))

(declare-fun mapValue!11844 () ValueCell!3134)

(declare-fun mapKey!11844 () (_ BitVec 32))

(assert (=> mapNonEmpty!11844 (= mapRest!11835 (store mapRest!11844 mapKey!11844 mapValue!11844))))

(declare-fun b!336409 () Bool)

(assert (=> b!336409 (= e!206494 tp_is_empty!6955)))

(assert (= (and mapNonEmpty!11835 condMapEmpty!11844) mapIsEmpty!11844))

(assert (= (and mapNonEmpty!11835 (not condMapEmpty!11844)) mapNonEmpty!11844))

(assert (= (and mapNonEmpty!11844 ((_ is ValueCellFull!3134) mapValue!11844)) b!336409))

(assert (= (and mapNonEmpty!11835 ((_ is ValueCellFull!3134) mapDefault!11844)) b!336410))

(declare-fun m!340493 () Bool)

(assert (=> mapNonEmpty!11844 m!340493))

(declare-fun b_lambda!8435 () Bool)

(assert (= b_lambda!8433 (or (and start!33790 b_free!7003) b_lambda!8435)))

(check-sat (not bm!26350) (not b!336360) (not b!336355) (not d!70721) (not b!336384) (not b_next!7003) (not bm!26351) (not b!336302) b_and!14207 (not b!336367) (not d!70727) (not bm!26353) (not b!336393) (not b!336353) (not b!336396) tp_is_empty!6955 (not d!70725) (not b_lambda!8435) (not b!336381) (not b!336362) (not bm!26360) (not b!336304) (not b!336295) (not b!336382) (not bm!26357) (not b!336359) (not b!336366) (not mapNonEmpty!11844) (not b!336363) (not bm!26354) (not b!336402))
(check-sat b_and!14207 (not b_next!7003))
