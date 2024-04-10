; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33584 () Bool)

(assert start!33584)

(declare-fun b_free!6837 () Bool)

(declare-fun b_next!6837 () Bool)

(assert (=> start!33584 (= b_free!6837 (not b_next!6837))))

(declare-fun tp!24012 () Bool)

(declare-fun b_and!14015 () Bool)

(assert (=> start!33584 (= tp!24012 b_and!14015)))

(declare-fun res!183594 () Bool)

(declare-fun e!204643 () Bool)

(assert (=> start!33584 (=> (not res!183594) (not e!204643))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33584 (= res!183594 (validMask!0 mask!2385))))

(assert (=> start!33584 e!204643))

(assert (=> start!33584 true))

(declare-fun tp_is_empty!6789 () Bool)

(assert (=> start!33584 tp_is_empty!6789))

(assert (=> start!33584 tp!24012))

(declare-datatypes ((V!10029 0))(
  ( (V!10030 (val!3439 Int)) )
))
(declare-datatypes ((ValueCell!3051 0))(
  ( (ValueCellFull!3051 (v!5600 V!10029)) (EmptyCell!3051) )
))
(declare-datatypes ((array!17175 0))(
  ( (array!17176 (arr!8119 (Array (_ BitVec 32) ValueCell!3051)) (size!8471 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17175)

(declare-fun e!204641 () Bool)

(declare-fun array_inv!6040 (array!17175) Bool)

(assert (=> start!33584 (and (array_inv!6040 _values!1525) e!204641)))

(declare-datatypes ((array!17177 0))(
  ( (array!17178 (arr!8120 (Array (_ BitVec 32) (_ BitVec 64))) (size!8472 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17177)

(declare-fun array_inv!6041 (array!17177) Bool)

(assert (=> start!33584 (array_inv!6041 _keys!1895)))

(declare-fun b!333268 () Bool)

(declare-fun res!183593 () Bool)

(assert (=> b!333268 (=> (not res!183593) (not e!204643))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333268 (= res!183593 (and (= (size!8471 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8472 _keys!1895) (size!8471 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11577 () Bool)

(declare-fun mapRes!11577 () Bool)

(assert (=> mapIsEmpty!11577 mapRes!11577))

(declare-fun b!333269 () Bool)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3136 0))(
  ( (MissingZero!3136 (index!14723 (_ BitVec 32))) (Found!3136 (index!14724 (_ BitVec 32))) (Intermediate!3136 (undefined!3948 Bool) (index!14725 (_ BitVec 32)) (x!33196 (_ BitVec 32))) (Undefined!3136) (MissingVacant!3136 (index!14726 (_ BitVec 32))) )
))
(declare-fun lt!159262 () SeekEntryResult!3136)

(get-info :version)

(assert (=> b!333269 (= e!204643 (and ((_ is Found!3136) lt!159262) (= (select (arr!8120 _keys!1895) (index!14724 lt!159262)) k0!1348) (bvsge (index!14724 lt!159262) #b00000000000000000000000000000000) (bvslt (index!14724 lt!159262) (size!8472 _keys!1895)) (bvsge (size!8472 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17177 (_ BitVec 32)) SeekEntryResult!3136)

(assert (=> b!333269 (= lt!159262 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333270 () Bool)

(declare-fun e!204645 () Bool)

(assert (=> b!333270 (= e!204645 tp_is_empty!6789)))

(declare-fun b!333271 () Bool)

(declare-fun res!183591 () Bool)

(assert (=> b!333271 (=> (not res!183591) (not e!204643))))

(declare-fun zeroValue!1467 () V!10029)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10029)

(declare-datatypes ((tuple2!5004 0))(
  ( (tuple2!5005 (_1!2513 (_ BitVec 64)) (_2!2513 V!10029)) )
))
(declare-datatypes ((List!4621 0))(
  ( (Nil!4618) (Cons!4617 (h!5473 tuple2!5004) (t!9707 List!4621)) )
))
(declare-datatypes ((ListLongMap!3917 0))(
  ( (ListLongMap!3918 (toList!1974 List!4621)) )
))
(declare-fun contains!2017 (ListLongMap!3917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1502 (array!17177 array!17175 (_ BitVec 32) (_ BitVec 32) V!10029 V!10029 (_ BitVec 32) Int) ListLongMap!3917)

(assert (=> b!333271 (= res!183591 (not (contains!2017 (getCurrentListMap!1502 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333272 () Bool)

(declare-fun e!204642 () Bool)

(assert (=> b!333272 (= e!204642 tp_is_empty!6789)))

(declare-fun b!333273 () Bool)

(assert (=> b!333273 (= e!204641 (and e!204642 mapRes!11577))))

(declare-fun condMapEmpty!11577 () Bool)

(declare-fun mapDefault!11577 () ValueCell!3051)

(assert (=> b!333273 (= condMapEmpty!11577 (= (arr!8119 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3051)) mapDefault!11577)))))

(declare-fun b!333274 () Bool)

(declare-fun res!183596 () Bool)

(assert (=> b!333274 (=> (not res!183596) (not e!204643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333274 (= res!183596 (validKeyInArray!0 k0!1348))))

(declare-fun b!333275 () Bool)

(declare-fun res!183592 () Bool)

(assert (=> b!333275 (=> (not res!183592) (not e!204643))))

(declare-datatypes ((List!4622 0))(
  ( (Nil!4619) (Cons!4618 (h!5474 (_ BitVec 64)) (t!9708 List!4622)) )
))
(declare-fun arrayNoDuplicates!0 (array!17177 (_ BitVec 32) List!4622) Bool)

(assert (=> b!333275 (= res!183592 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4619))))

(declare-fun b!333276 () Bool)

(declare-fun res!183595 () Bool)

(assert (=> b!333276 (=> (not res!183595) (not e!204643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17177 (_ BitVec 32)) Bool)

(assert (=> b!333276 (= res!183595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11577 () Bool)

(declare-fun tp!24011 () Bool)

(assert (=> mapNonEmpty!11577 (= mapRes!11577 (and tp!24011 e!204645))))

(declare-fun mapValue!11577 () ValueCell!3051)

(declare-fun mapKey!11577 () (_ BitVec 32))

(declare-fun mapRest!11577 () (Array (_ BitVec 32) ValueCell!3051))

(assert (=> mapNonEmpty!11577 (= (arr!8119 _values!1525) (store mapRest!11577 mapKey!11577 mapValue!11577))))

(assert (= (and start!33584 res!183594) b!333268))

(assert (= (and b!333268 res!183593) b!333276))

(assert (= (and b!333276 res!183595) b!333275))

(assert (= (and b!333275 res!183592) b!333274))

(assert (= (and b!333274 res!183596) b!333271))

(assert (= (and b!333271 res!183591) b!333269))

(assert (= (and b!333273 condMapEmpty!11577) mapIsEmpty!11577))

(assert (= (and b!333273 (not condMapEmpty!11577)) mapNonEmpty!11577))

(assert (= (and mapNonEmpty!11577 ((_ is ValueCellFull!3051) mapValue!11577)) b!333270))

(assert (= (and b!333273 ((_ is ValueCellFull!3051) mapDefault!11577)) b!333272))

(assert (= start!33584 b!333273))

(declare-fun m!337563 () Bool)

(assert (=> start!33584 m!337563))

(declare-fun m!337565 () Bool)

(assert (=> start!33584 m!337565))

(declare-fun m!337567 () Bool)

(assert (=> start!33584 m!337567))

(declare-fun m!337569 () Bool)

(assert (=> b!333275 m!337569))

(declare-fun m!337571 () Bool)

(assert (=> b!333274 m!337571))

(declare-fun m!337573 () Bool)

(assert (=> b!333271 m!337573))

(assert (=> b!333271 m!337573))

(declare-fun m!337575 () Bool)

(assert (=> b!333271 m!337575))

(declare-fun m!337577 () Bool)

(assert (=> b!333276 m!337577))

(declare-fun m!337579 () Bool)

(assert (=> b!333269 m!337579))

(declare-fun m!337581 () Bool)

(assert (=> b!333269 m!337581))

(declare-fun m!337583 () Bool)

(assert (=> mapNonEmpty!11577 m!337583))

(check-sat (not mapNonEmpty!11577) tp_is_empty!6789 b_and!14015 (not b!333271) (not b_next!6837) (not b!333275) (not b!333269) (not b!333274) (not start!33584) (not b!333276))
(check-sat b_and!14015 (not b_next!6837))
(get-model)

(declare-fun d!70583 () Bool)

(assert (=> d!70583 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33584 d!70583))

(declare-fun d!70585 () Bool)

(assert (=> d!70585 (= (array_inv!6040 _values!1525) (bvsge (size!8471 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33584 d!70585))

(declare-fun d!70587 () Bool)

(assert (=> d!70587 (= (array_inv!6041 _keys!1895) (bvsge (size!8472 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33584 d!70587))

(declare-fun d!70589 () Bool)

(declare-fun e!204665 () Bool)

(assert (=> d!70589 e!204665))

(declare-fun res!183617 () Bool)

(assert (=> d!70589 (=> res!183617 e!204665)))

(declare-fun lt!159274 () Bool)

(assert (=> d!70589 (= res!183617 (not lt!159274))))

(declare-fun lt!159276 () Bool)

(assert (=> d!70589 (= lt!159274 lt!159276)))

(declare-datatypes ((Unit!10369 0))(
  ( (Unit!10370) )
))
(declare-fun lt!159275 () Unit!10369)

(declare-fun e!204666 () Unit!10369)

(assert (=> d!70589 (= lt!159275 e!204666)))

(declare-fun c!52161 () Bool)

(assert (=> d!70589 (= c!52161 lt!159276)))

(declare-fun containsKey!315 (List!4621 (_ BitVec 64)) Bool)

(assert (=> d!70589 (= lt!159276 (containsKey!315 (toList!1974 (getCurrentListMap!1502 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70589 (= (contains!2017 (getCurrentListMap!1502 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!159274)))

(declare-fun b!333310 () Bool)

(declare-fun lt!159277 () Unit!10369)

(assert (=> b!333310 (= e!204666 lt!159277)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!263 (List!4621 (_ BitVec 64)) Unit!10369)

(assert (=> b!333310 (= lt!159277 (lemmaContainsKeyImpliesGetValueByKeyDefined!263 (toList!1974 (getCurrentListMap!1502 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!329 0))(
  ( (Some!328 (v!5602 V!10029)) (None!327) )
))
(declare-fun isDefined!264 (Option!329) Bool)

(declare-fun getValueByKey!323 (List!4621 (_ BitVec 64)) Option!329)

(assert (=> b!333310 (isDefined!264 (getValueByKey!323 (toList!1974 (getCurrentListMap!1502 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!333311 () Bool)

(declare-fun Unit!10371 () Unit!10369)

(assert (=> b!333311 (= e!204666 Unit!10371)))

(declare-fun b!333312 () Bool)

(assert (=> b!333312 (= e!204665 (isDefined!264 (getValueByKey!323 (toList!1974 (getCurrentListMap!1502 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70589 c!52161) b!333310))

(assert (= (and d!70589 (not c!52161)) b!333311))

(assert (= (and d!70589 (not res!183617)) b!333312))

(declare-fun m!337607 () Bool)

(assert (=> d!70589 m!337607))

(declare-fun m!337609 () Bool)

(assert (=> b!333310 m!337609))

(declare-fun m!337611 () Bool)

(assert (=> b!333310 m!337611))

(assert (=> b!333310 m!337611))

(declare-fun m!337613 () Bool)

(assert (=> b!333310 m!337613))

(assert (=> b!333312 m!337611))

(assert (=> b!333312 m!337611))

(assert (=> b!333312 m!337613))

(assert (=> b!333271 d!70589))

(declare-fun b!333356 () Bool)

(declare-fun e!204701 () Bool)

(assert (=> b!333356 (= e!204701 (validKeyInArray!0 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun lt!159335 () ListLongMap!3917)

(declare-fun e!204695 () Bool)

(declare-fun b!333357 () Bool)

(declare-fun apply!265 (ListLongMap!3917 (_ BitVec 64)) V!10029)

(declare-fun get!4473 (ValueCell!3051 V!10029) V!10029)

(declare-fun dynLambda!608 (Int (_ BitVec 64)) V!10029)

(assert (=> b!333357 (= e!204695 (= (apply!265 lt!159335 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000)) (get!4473 (select (arr!8119 _values!1525) #b00000000000000000000000000000000) (dynLambda!608 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!333357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8471 _values!1525)))))

(assert (=> b!333357 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8472 _keys!1895)))))

(declare-fun bm!26281 () Bool)

(declare-fun call!26286 () Bool)

(assert (=> bm!26281 (= call!26286 (contains!2017 lt!159335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333358 () Bool)

(declare-fun res!183637 () Bool)

(declare-fun e!204702 () Bool)

(assert (=> b!333358 (=> (not res!183637) (not e!204702))))

(declare-fun e!204693 () Bool)

(assert (=> b!333358 (= res!183637 e!204693)))

(declare-fun c!52177 () Bool)

(assert (=> b!333358 (= c!52177 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!333359 () Bool)

(declare-fun e!204699 () Bool)

(assert (=> b!333359 (= e!204699 e!204695)))

(declare-fun res!183642 () Bool)

(assert (=> b!333359 (=> (not res!183642) (not e!204695))))

(assert (=> b!333359 (= res!183642 (contains!2017 lt!159335 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!333359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8472 _keys!1895)))))

(declare-fun b!333360 () Bool)

(assert (=> b!333360 (= e!204693 (not call!26286))))

(declare-fun b!333361 () Bool)

(declare-fun e!204696 () ListLongMap!3917)

(declare-fun e!204694 () ListLongMap!3917)

(assert (=> b!333361 (= e!204696 e!204694)))

(declare-fun c!52174 () Bool)

(assert (=> b!333361 (= c!52174 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333362 () Bool)

(declare-fun res!183636 () Bool)

(assert (=> b!333362 (=> (not res!183636) (not e!204702))))

(assert (=> b!333362 (= res!183636 e!204699)))

(declare-fun res!183638 () Bool)

(assert (=> b!333362 (=> res!183638 e!204699)))

(assert (=> b!333362 (= res!183638 (not e!204701))))

(declare-fun res!183643 () Bool)

(assert (=> b!333362 (=> (not res!183643) (not e!204701))))

(assert (=> b!333362 (= res!183643 (bvslt #b00000000000000000000000000000000 (size!8472 _keys!1895)))))

(declare-fun b!333363 () Bool)

(declare-fun e!204697 () ListLongMap!3917)

(declare-fun call!26288 () ListLongMap!3917)

(assert (=> b!333363 (= e!204697 call!26288)))

(declare-fun call!26284 () ListLongMap!3917)

(declare-fun c!52179 () Bool)

(declare-fun call!26290 () ListLongMap!3917)

(declare-fun call!26285 () ListLongMap!3917)

(declare-fun bm!26282 () Bool)

(declare-fun call!26287 () ListLongMap!3917)

(declare-fun +!714 (ListLongMap!3917 tuple2!5004) ListLongMap!3917)

(assert (=> bm!26282 (= call!26284 (+!714 (ite c!52179 call!26290 (ite c!52174 call!26287 call!26285)) (ite (or c!52179 c!52174) (tuple2!5005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5005 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!333364 () Bool)

(declare-fun c!52178 () Bool)

(assert (=> b!333364 (= c!52178 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!333364 (= e!204694 e!204697)))

(declare-fun bm!26283 () Bool)

(assert (=> bm!26283 (= call!26285 call!26287)))

(declare-fun d!70591 () Bool)

(assert (=> d!70591 e!204702))

(declare-fun res!183641 () Bool)

(assert (=> d!70591 (=> (not res!183641) (not e!204702))))

(assert (=> d!70591 (= res!183641 (or (bvsge #b00000000000000000000000000000000 (size!8472 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8472 _keys!1895)))))))

(declare-fun lt!159332 () ListLongMap!3917)

(assert (=> d!70591 (= lt!159335 lt!159332)))

(declare-fun lt!159337 () Unit!10369)

(declare-fun e!204703 () Unit!10369)

(assert (=> d!70591 (= lt!159337 e!204703)))

(declare-fun c!52175 () Bool)

(declare-fun e!204700 () Bool)

(assert (=> d!70591 (= c!52175 e!204700)))

(declare-fun res!183644 () Bool)

(assert (=> d!70591 (=> (not res!183644) (not e!204700))))

(assert (=> d!70591 (= res!183644 (bvslt #b00000000000000000000000000000000 (size!8472 _keys!1895)))))

(assert (=> d!70591 (= lt!159332 e!204696)))

(assert (=> d!70591 (= c!52179 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70591 (validMask!0 mask!2385)))

(assert (=> d!70591 (= (getCurrentListMap!1502 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!159335)))

(declare-fun b!333355 () Bool)

(declare-fun e!204698 () Bool)

(declare-fun call!26289 () Bool)

(assert (=> b!333355 (= e!204698 (not call!26289))))

(declare-fun bm!26284 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!587 (array!17177 array!17175 (_ BitVec 32) (_ BitVec 32) V!10029 V!10029 (_ BitVec 32) Int) ListLongMap!3917)

(assert (=> bm!26284 (= call!26290 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26285 () Bool)

(assert (=> bm!26285 (= call!26287 call!26290)))

(declare-fun bm!26286 () Bool)

(assert (=> bm!26286 (= call!26288 call!26284)))

(declare-fun b!333365 () Bool)

(assert (=> b!333365 (= e!204702 e!204698)))

(declare-fun c!52176 () Bool)

(assert (=> b!333365 (= c!52176 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!333366 () Bool)

(declare-fun lt!159338 () Unit!10369)

(assert (=> b!333366 (= e!204703 lt!159338)))

(declare-fun lt!159324 () ListLongMap!3917)

(assert (=> b!333366 (= lt!159324 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159328 () (_ BitVec 64))

(assert (=> b!333366 (= lt!159328 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159331 () (_ BitVec 64))

(assert (=> b!333366 (= lt!159331 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159326 () Unit!10369)

(declare-fun addStillContains!241 (ListLongMap!3917 (_ BitVec 64) V!10029 (_ BitVec 64)) Unit!10369)

(assert (=> b!333366 (= lt!159326 (addStillContains!241 lt!159324 lt!159328 zeroValue!1467 lt!159331))))

(assert (=> b!333366 (contains!2017 (+!714 lt!159324 (tuple2!5005 lt!159328 zeroValue!1467)) lt!159331)))

(declare-fun lt!159323 () Unit!10369)

(assert (=> b!333366 (= lt!159323 lt!159326)))

(declare-fun lt!159327 () ListLongMap!3917)

(assert (=> b!333366 (= lt!159327 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159322 () (_ BitVec 64))

(assert (=> b!333366 (= lt!159322 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159343 () (_ BitVec 64))

(assert (=> b!333366 (= lt!159343 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159339 () Unit!10369)

(declare-fun addApplyDifferent!241 (ListLongMap!3917 (_ BitVec 64) V!10029 (_ BitVec 64)) Unit!10369)

(assert (=> b!333366 (= lt!159339 (addApplyDifferent!241 lt!159327 lt!159322 minValue!1467 lt!159343))))

(assert (=> b!333366 (= (apply!265 (+!714 lt!159327 (tuple2!5005 lt!159322 minValue!1467)) lt!159343) (apply!265 lt!159327 lt!159343))))

(declare-fun lt!159336 () Unit!10369)

(assert (=> b!333366 (= lt!159336 lt!159339)))

(declare-fun lt!159341 () ListLongMap!3917)

(assert (=> b!333366 (= lt!159341 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159330 () (_ BitVec 64))

(assert (=> b!333366 (= lt!159330 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159342 () (_ BitVec 64))

(assert (=> b!333366 (= lt!159342 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159334 () Unit!10369)

(assert (=> b!333366 (= lt!159334 (addApplyDifferent!241 lt!159341 lt!159330 zeroValue!1467 lt!159342))))

(assert (=> b!333366 (= (apply!265 (+!714 lt!159341 (tuple2!5005 lt!159330 zeroValue!1467)) lt!159342) (apply!265 lt!159341 lt!159342))))

(declare-fun lt!159329 () Unit!10369)

(assert (=> b!333366 (= lt!159329 lt!159334)))

(declare-fun lt!159333 () ListLongMap!3917)

(assert (=> b!333366 (= lt!159333 (getCurrentListMapNoExtraKeys!587 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!159340 () (_ BitVec 64))

(assert (=> b!333366 (= lt!159340 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159325 () (_ BitVec 64))

(assert (=> b!333366 (= lt!159325 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!333366 (= lt!159338 (addApplyDifferent!241 lt!159333 lt!159340 minValue!1467 lt!159325))))

(assert (=> b!333366 (= (apply!265 (+!714 lt!159333 (tuple2!5005 lt!159340 minValue!1467)) lt!159325) (apply!265 lt!159333 lt!159325))))

(declare-fun b!333367 () Bool)

(declare-fun e!204704 () Bool)

(assert (=> b!333367 (= e!204704 (= (apply!265 lt!159335 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!333368 () Bool)

(assert (=> b!333368 (= e!204700 (validKeyInArray!0 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333369 () Bool)

(assert (=> b!333369 (= e!204696 (+!714 call!26284 (tuple2!5005 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!333370 () Bool)

(declare-fun e!204705 () Bool)

(assert (=> b!333370 (= e!204693 e!204705)))

(declare-fun res!183639 () Bool)

(assert (=> b!333370 (= res!183639 call!26286)))

(assert (=> b!333370 (=> (not res!183639) (not e!204705))))

(declare-fun b!333371 () Bool)

(declare-fun Unit!10372 () Unit!10369)

(assert (=> b!333371 (= e!204703 Unit!10372)))

(declare-fun b!333372 () Bool)

(assert (=> b!333372 (= e!204697 call!26285)))

(declare-fun bm!26287 () Bool)

(assert (=> bm!26287 (= call!26289 (contains!2017 lt!159335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!333373 () Bool)

(assert (=> b!333373 (= e!204698 e!204704)))

(declare-fun res!183640 () Bool)

(assert (=> b!333373 (= res!183640 call!26289)))

(assert (=> b!333373 (=> (not res!183640) (not e!204704))))

(declare-fun b!333374 () Bool)

(assert (=> b!333374 (= e!204705 (= (apply!265 lt!159335 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!333375 () Bool)

(assert (=> b!333375 (= e!204694 call!26288)))

(assert (= (and d!70591 c!52179) b!333369))

(assert (= (and d!70591 (not c!52179)) b!333361))

(assert (= (and b!333361 c!52174) b!333375))

(assert (= (and b!333361 (not c!52174)) b!333364))

(assert (= (and b!333364 c!52178) b!333363))

(assert (= (and b!333364 (not c!52178)) b!333372))

(assert (= (or b!333363 b!333372) bm!26283))

(assert (= (or b!333375 bm!26283) bm!26285))

(assert (= (or b!333375 b!333363) bm!26286))

(assert (= (or b!333369 bm!26285) bm!26284))

(assert (= (or b!333369 bm!26286) bm!26282))

(assert (= (and d!70591 res!183644) b!333368))

(assert (= (and d!70591 c!52175) b!333366))

(assert (= (and d!70591 (not c!52175)) b!333371))

(assert (= (and d!70591 res!183641) b!333362))

(assert (= (and b!333362 res!183643) b!333356))

(assert (= (and b!333362 (not res!183638)) b!333359))

(assert (= (and b!333359 res!183642) b!333357))

(assert (= (and b!333362 res!183636) b!333358))

(assert (= (and b!333358 c!52177) b!333370))

(assert (= (and b!333358 (not c!52177)) b!333360))

(assert (= (and b!333370 res!183639) b!333374))

(assert (= (or b!333370 b!333360) bm!26281))

(assert (= (and b!333358 res!183637) b!333365))

(assert (= (and b!333365 c!52176) b!333373))

(assert (= (and b!333365 (not c!52176)) b!333355))

(assert (= (and b!333373 res!183640) b!333367))

(assert (= (or b!333373 b!333355) bm!26287))

(declare-fun b_lambda!8399 () Bool)

(assert (=> (not b_lambda!8399) (not b!333357)))

(declare-fun t!9710 () Bool)

(declare-fun tb!3045 () Bool)

(assert (=> (and start!33584 (= defaultEntry!1528 defaultEntry!1528) t!9710) tb!3045))

(declare-fun result!5465 () Bool)

(assert (=> tb!3045 (= result!5465 tp_is_empty!6789)))

(assert (=> b!333357 t!9710))

(declare-fun b_and!14019 () Bool)

(assert (= b_and!14015 (and (=> t!9710 result!5465) b_and!14019)))

(declare-fun m!337615 () Bool)

(assert (=> bm!26282 m!337615))

(declare-fun m!337617 () Bool)

(assert (=> b!333356 m!337617))

(assert (=> b!333356 m!337617))

(declare-fun m!337619 () Bool)

(assert (=> b!333356 m!337619))

(declare-fun m!337621 () Bool)

(assert (=> b!333374 m!337621))

(declare-fun m!337623 () Bool)

(assert (=> bm!26284 m!337623))

(declare-fun m!337625 () Bool)

(assert (=> bm!26287 m!337625))

(assert (=> b!333368 m!337617))

(assert (=> b!333368 m!337617))

(assert (=> b!333368 m!337619))

(assert (=> b!333366 m!337617))

(declare-fun m!337627 () Bool)

(assert (=> b!333366 m!337627))

(assert (=> b!333366 m!337623))

(declare-fun m!337629 () Bool)

(assert (=> b!333366 m!337629))

(declare-fun m!337631 () Bool)

(assert (=> b!333366 m!337631))

(declare-fun m!337633 () Bool)

(assert (=> b!333366 m!337633))

(declare-fun m!337635 () Bool)

(assert (=> b!333366 m!337635))

(declare-fun m!337637 () Bool)

(assert (=> b!333366 m!337637))

(assert (=> b!333366 m!337633))

(declare-fun m!337639 () Bool)

(assert (=> b!333366 m!337639))

(declare-fun m!337641 () Bool)

(assert (=> b!333366 m!337641))

(declare-fun m!337643 () Bool)

(assert (=> b!333366 m!337643))

(assert (=> b!333366 m!337643))

(declare-fun m!337645 () Bool)

(assert (=> b!333366 m!337645))

(declare-fun m!337647 () Bool)

(assert (=> b!333366 m!337647))

(declare-fun m!337649 () Bool)

(assert (=> b!333366 m!337649))

(declare-fun m!337651 () Bool)

(assert (=> b!333366 m!337651))

(declare-fun m!337653 () Bool)

(assert (=> b!333366 m!337653))

(assert (=> b!333366 m!337649))

(declare-fun m!337655 () Bool)

(assert (=> b!333366 m!337655))

(assert (=> b!333366 m!337629))

(assert (=> d!70591 m!337563))

(assert (=> b!333359 m!337617))

(assert (=> b!333359 m!337617))

(declare-fun m!337657 () Bool)

(assert (=> b!333359 m!337657))

(declare-fun m!337659 () Bool)

(assert (=> bm!26281 m!337659))

(assert (=> b!333357 m!337617))

(assert (=> b!333357 m!337617))

(declare-fun m!337661 () Bool)

(assert (=> b!333357 m!337661))

(declare-fun m!337663 () Bool)

(assert (=> b!333357 m!337663))

(assert (=> b!333357 m!337663))

(declare-fun m!337665 () Bool)

(assert (=> b!333357 m!337665))

(declare-fun m!337667 () Bool)

(assert (=> b!333357 m!337667))

(assert (=> b!333357 m!337665))

(declare-fun m!337669 () Bool)

(assert (=> b!333369 m!337669))

(declare-fun m!337671 () Bool)

(assert (=> b!333367 m!337671))

(assert (=> b!333271 d!70591))

(declare-fun d!70593 () Bool)

(declare-fun res!183650 () Bool)

(declare-fun e!204712 () Bool)

(assert (=> d!70593 (=> res!183650 e!204712)))

(assert (=> d!70593 (= res!183650 (bvsge #b00000000000000000000000000000000 (size!8472 _keys!1895)))))

(assert (=> d!70593 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204712)))

(declare-fun b!333386 () Bool)

(declare-fun e!204713 () Bool)

(declare-fun call!26293 () Bool)

(assert (=> b!333386 (= e!204713 call!26293)))

(declare-fun b!333387 () Bool)

(declare-fun e!204714 () Bool)

(assert (=> b!333387 (= e!204714 call!26293)))

(declare-fun bm!26290 () Bool)

(assert (=> bm!26290 (= call!26293 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!333388 () Bool)

(assert (=> b!333388 (= e!204713 e!204714)))

(declare-fun lt!159350 () (_ BitVec 64))

(assert (=> b!333388 (= lt!159350 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!159352 () Unit!10369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17177 (_ BitVec 64) (_ BitVec 32)) Unit!10369)

(assert (=> b!333388 (= lt!159352 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!159350 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333388 (arrayContainsKey!0 _keys!1895 lt!159350 #b00000000000000000000000000000000)))

(declare-fun lt!159351 () Unit!10369)

(assert (=> b!333388 (= lt!159351 lt!159352)))

(declare-fun res!183649 () Bool)

(assert (=> b!333388 (= res!183649 (= (seekEntryOrOpen!0 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3136 #b00000000000000000000000000000000)))))

(assert (=> b!333388 (=> (not res!183649) (not e!204714))))

(declare-fun b!333389 () Bool)

(assert (=> b!333389 (= e!204712 e!204713)))

(declare-fun c!52182 () Bool)

(assert (=> b!333389 (= c!52182 (validKeyInArray!0 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70593 (not res!183650)) b!333389))

(assert (= (and b!333389 c!52182) b!333388))

(assert (= (and b!333389 (not c!52182)) b!333386))

(assert (= (and b!333388 res!183649) b!333387))

(assert (= (or b!333387 b!333386) bm!26290))

(declare-fun m!337673 () Bool)

(assert (=> bm!26290 m!337673))

(assert (=> b!333388 m!337617))

(declare-fun m!337675 () Bool)

(assert (=> b!333388 m!337675))

(declare-fun m!337677 () Bool)

(assert (=> b!333388 m!337677))

(assert (=> b!333388 m!337617))

(declare-fun m!337679 () Bool)

(assert (=> b!333388 m!337679))

(assert (=> b!333389 m!337617))

(assert (=> b!333389 m!337617))

(assert (=> b!333389 m!337619))

(assert (=> b!333276 d!70593))

(declare-fun bm!26293 () Bool)

(declare-fun call!26296 () Bool)

(declare-fun c!52185 () Bool)

(assert (=> bm!26293 (= call!26296 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52185 (Cons!4618 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000) Nil!4619) Nil!4619)))))

(declare-fun b!333400 () Bool)

(declare-fun e!204725 () Bool)

(declare-fun e!204723 () Bool)

(assert (=> b!333400 (= e!204725 e!204723)))

(declare-fun res!183659 () Bool)

(assert (=> b!333400 (=> (not res!183659) (not e!204723))))

(declare-fun e!204726 () Bool)

(assert (=> b!333400 (= res!183659 (not e!204726))))

(declare-fun res!183658 () Bool)

(assert (=> b!333400 (=> (not res!183658) (not e!204726))))

(assert (=> b!333400 (= res!183658 (validKeyInArray!0 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333401 () Bool)

(declare-fun e!204724 () Bool)

(assert (=> b!333401 (= e!204724 call!26296)))

(declare-fun b!333402 () Bool)

(assert (=> b!333402 (= e!204723 e!204724)))

(assert (=> b!333402 (= c!52185 (validKeyInArray!0 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333404 () Bool)

(declare-fun contains!2018 (List!4622 (_ BitVec 64)) Bool)

(assert (=> b!333404 (= e!204726 (contains!2018 Nil!4619 (select (arr!8120 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!333403 () Bool)

(assert (=> b!333403 (= e!204724 call!26296)))

(declare-fun d!70595 () Bool)

(declare-fun res!183657 () Bool)

(assert (=> d!70595 (=> res!183657 e!204725)))

(assert (=> d!70595 (= res!183657 (bvsge #b00000000000000000000000000000000 (size!8472 _keys!1895)))))

(assert (=> d!70595 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4619) e!204725)))

(assert (= (and d!70595 (not res!183657)) b!333400))

(assert (= (and b!333400 res!183658) b!333404))

(assert (= (and b!333400 res!183659) b!333402))

(assert (= (and b!333402 c!52185) b!333403))

(assert (= (and b!333402 (not c!52185)) b!333401))

(assert (= (or b!333403 b!333401) bm!26293))

(assert (=> bm!26293 m!337617))

(declare-fun m!337681 () Bool)

(assert (=> bm!26293 m!337681))

(assert (=> b!333400 m!337617))

(assert (=> b!333400 m!337617))

(assert (=> b!333400 m!337619))

(assert (=> b!333402 m!337617))

(assert (=> b!333402 m!337617))

(assert (=> b!333402 m!337619))

(assert (=> b!333404 m!337617))

(assert (=> b!333404 m!337617))

(declare-fun m!337683 () Bool)

(assert (=> b!333404 m!337683))

(assert (=> b!333275 d!70595))

(declare-fun b!333418 () Bool)

(declare-fun e!204733 () SeekEntryResult!3136)

(declare-fun e!204735 () SeekEntryResult!3136)

(assert (=> b!333418 (= e!204733 e!204735)))

(declare-fun lt!159359 () (_ BitVec 64))

(declare-fun lt!159361 () SeekEntryResult!3136)

(assert (=> b!333418 (= lt!159359 (select (arr!8120 _keys!1895) (index!14725 lt!159361)))))

(declare-fun c!52194 () Bool)

(assert (=> b!333418 (= c!52194 (= lt!159359 k0!1348))))

(declare-fun b!333419 () Bool)

(declare-fun c!52192 () Bool)

(assert (=> b!333419 (= c!52192 (= lt!159359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!204734 () SeekEntryResult!3136)

(assert (=> b!333419 (= e!204735 e!204734)))

(declare-fun b!333420 () Bool)

(assert (=> b!333420 (= e!204733 Undefined!3136)))

(declare-fun b!333421 () Bool)

(assert (=> b!333421 (= e!204735 (Found!3136 (index!14725 lt!159361)))))

(declare-fun b!333422 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17177 (_ BitVec 32)) SeekEntryResult!3136)

(assert (=> b!333422 (= e!204734 (seekKeyOrZeroReturnVacant!0 (x!33196 lt!159361) (index!14725 lt!159361) (index!14725 lt!159361) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333417 () Bool)

(assert (=> b!333417 (= e!204734 (MissingZero!3136 (index!14725 lt!159361)))))

(declare-fun d!70597 () Bool)

(declare-fun lt!159360 () SeekEntryResult!3136)

(assert (=> d!70597 (and (or ((_ is Undefined!3136) lt!159360) (not ((_ is Found!3136) lt!159360)) (and (bvsge (index!14724 lt!159360) #b00000000000000000000000000000000) (bvslt (index!14724 lt!159360) (size!8472 _keys!1895)))) (or ((_ is Undefined!3136) lt!159360) ((_ is Found!3136) lt!159360) (not ((_ is MissingZero!3136) lt!159360)) (and (bvsge (index!14723 lt!159360) #b00000000000000000000000000000000) (bvslt (index!14723 lt!159360) (size!8472 _keys!1895)))) (or ((_ is Undefined!3136) lt!159360) ((_ is Found!3136) lt!159360) ((_ is MissingZero!3136) lt!159360) (not ((_ is MissingVacant!3136) lt!159360)) (and (bvsge (index!14726 lt!159360) #b00000000000000000000000000000000) (bvslt (index!14726 lt!159360) (size!8472 _keys!1895)))) (or ((_ is Undefined!3136) lt!159360) (ite ((_ is Found!3136) lt!159360) (= (select (arr!8120 _keys!1895) (index!14724 lt!159360)) k0!1348) (ite ((_ is MissingZero!3136) lt!159360) (= (select (arr!8120 _keys!1895) (index!14723 lt!159360)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3136) lt!159360) (= (select (arr!8120 _keys!1895) (index!14726 lt!159360)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70597 (= lt!159360 e!204733)))

(declare-fun c!52193 () Bool)

(assert (=> d!70597 (= c!52193 (and ((_ is Intermediate!3136) lt!159361) (undefined!3948 lt!159361)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17177 (_ BitVec 32)) SeekEntryResult!3136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70597 (= lt!159361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70597 (validMask!0 mask!2385)))

(assert (=> d!70597 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!159360)))

(assert (= (and d!70597 c!52193) b!333420))

(assert (= (and d!70597 (not c!52193)) b!333418))

(assert (= (and b!333418 c!52194) b!333421))

(assert (= (and b!333418 (not c!52194)) b!333419))

(assert (= (and b!333419 c!52192) b!333417))

(assert (= (and b!333419 (not c!52192)) b!333422))

(declare-fun m!337685 () Bool)

(assert (=> b!333418 m!337685))

(declare-fun m!337687 () Bool)

(assert (=> b!333422 m!337687))

(declare-fun m!337689 () Bool)

(assert (=> d!70597 m!337689))

(declare-fun m!337691 () Bool)

(assert (=> d!70597 m!337691))

(assert (=> d!70597 m!337563))

(assert (=> d!70597 m!337689))

(declare-fun m!337693 () Bool)

(assert (=> d!70597 m!337693))

(declare-fun m!337695 () Bool)

(assert (=> d!70597 m!337695))

(declare-fun m!337697 () Bool)

(assert (=> d!70597 m!337697))

(assert (=> b!333269 d!70597))

(declare-fun d!70599 () Bool)

(assert (=> d!70599 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!333274 d!70599))

(declare-fun b!333429 () Bool)

(declare-fun e!204740 () Bool)

(assert (=> b!333429 (= e!204740 tp_is_empty!6789)))

(declare-fun mapNonEmpty!11583 () Bool)

(declare-fun mapRes!11583 () Bool)

(declare-fun tp!24021 () Bool)

(assert (=> mapNonEmpty!11583 (= mapRes!11583 (and tp!24021 e!204740))))

(declare-fun mapKey!11583 () (_ BitVec 32))

(declare-fun mapRest!11583 () (Array (_ BitVec 32) ValueCell!3051))

(declare-fun mapValue!11583 () ValueCell!3051)

(assert (=> mapNonEmpty!11583 (= mapRest!11577 (store mapRest!11583 mapKey!11583 mapValue!11583))))

(declare-fun b!333430 () Bool)

(declare-fun e!204741 () Bool)

(assert (=> b!333430 (= e!204741 tp_is_empty!6789)))

(declare-fun mapIsEmpty!11583 () Bool)

(assert (=> mapIsEmpty!11583 mapRes!11583))

(declare-fun condMapEmpty!11583 () Bool)

(declare-fun mapDefault!11583 () ValueCell!3051)

(assert (=> mapNonEmpty!11577 (= condMapEmpty!11583 (= mapRest!11577 ((as const (Array (_ BitVec 32) ValueCell!3051)) mapDefault!11583)))))

(assert (=> mapNonEmpty!11577 (= tp!24011 (and e!204741 mapRes!11583))))

(assert (= (and mapNonEmpty!11577 condMapEmpty!11583) mapIsEmpty!11583))

(assert (= (and mapNonEmpty!11577 (not condMapEmpty!11583)) mapNonEmpty!11583))

(assert (= (and mapNonEmpty!11583 ((_ is ValueCellFull!3051) mapValue!11583)) b!333429))

(assert (= (and mapNonEmpty!11577 ((_ is ValueCellFull!3051) mapDefault!11583)) b!333430))

(declare-fun m!337699 () Bool)

(assert (=> mapNonEmpty!11583 m!337699))

(declare-fun b_lambda!8401 () Bool)

(assert (= b_lambda!8399 (or (and start!33584 b_free!6837) b_lambda!8401)))

(check-sat (not b!333356) (not b!333389) tp_is_empty!6789 (not b!333312) (not b_lambda!8401) (not b!333388) (not b!333366) (not b!333404) (not d!70591) (not b!333422) (not mapNonEmpty!11583) (not b!333367) (not bm!26287) (not d!70589) (not b!333359) (not b!333402) (not bm!26284) (not b!333369) (not b!333374) (not bm!26281) (not b_next!6837) (not bm!26282) (not b!333357) (not b!333310) (not bm!26290) b_and!14019 (not b!333368) (not b!333400) (not bm!26293) (not d!70597))
(check-sat b_and!14019 (not b_next!6837))
