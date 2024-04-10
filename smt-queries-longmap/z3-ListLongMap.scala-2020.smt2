; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35198 () Bool)

(assert start!35198)

(declare-fun b_free!7791 () Bool)

(declare-fun b_next!7791 () Bool)

(assert (=> start!35198 (= b_free!7791 (not b_next!7791))))

(declare-fun tp!26964 () Bool)

(declare-fun b_and!15029 () Bool)

(assert (=> start!35198 (= tp!26964 b_and!15029)))

(declare-fun b!352888 () Bool)

(declare-fun res!195700 () Bool)

(declare-fun e!216083 () Bool)

(assert (=> b!352888 (=> (not res!195700) (not e!216083))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11301 0))(
  ( (V!11302 (val!3916 Int)) )
))
(declare-datatypes ((ValueCell!3528 0))(
  ( (ValueCellFull!3528 (v!6107 V!11301)) (EmptyCell!3528) )
))
(declare-datatypes ((array!19075 0))(
  ( (array!19076 (arr!9039 (Array (_ BitVec 32) ValueCell!3528)) (size!9391 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19075)

(declare-datatypes ((array!19077 0))(
  ( (array!19078 (arr!9040 (Array (_ BitVec 32) (_ BitVec 64))) (size!9392 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19077)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352888 (= res!195700 (and (= (size!9391 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9392 _keys!1895) (size!9391 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!195696 () Bool)

(assert (=> start!35198 (=> (not res!195696) (not e!216083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35198 (= res!195696 (validMask!0 mask!2385))))

(assert (=> start!35198 e!216083))

(assert (=> start!35198 true))

(declare-fun tp_is_empty!7743 () Bool)

(assert (=> start!35198 tp_is_empty!7743))

(assert (=> start!35198 tp!26964))

(declare-fun e!216084 () Bool)

(declare-fun array_inv!6662 (array!19075) Bool)

(assert (=> start!35198 (and (array_inv!6662 _values!1525) e!216084)))

(declare-fun array_inv!6663 (array!19077) Bool)

(assert (=> start!35198 (array_inv!6663 _keys!1895)))

(declare-fun b!352889 () Bool)

(declare-fun res!195697 () Bool)

(assert (=> b!352889 (=> (not res!195697) (not e!216083))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11301)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11301)

(declare-datatypes ((tuple2!5644 0))(
  ( (tuple2!5645 (_1!2833 (_ BitVec 64)) (_2!2833 V!11301)) )
))
(declare-datatypes ((List!5261 0))(
  ( (Nil!5258) (Cons!5257 (h!6113 tuple2!5644) (t!10407 List!5261)) )
))
(declare-datatypes ((ListLongMap!4557 0))(
  ( (ListLongMap!4558 (toList!2294 List!5261)) )
))
(declare-fun contains!2367 (ListLongMap!4557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1815 (array!19077 array!19075 (_ BitVec 32) (_ BitVec 32) V!11301 V!11301 (_ BitVec 32) Int) ListLongMap!4557)

(assert (=> b!352889 (= res!195697 (not (contains!2367 (getCurrentListMap!1815 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352890 () Bool)

(declare-fun res!195699 () Bool)

(assert (=> b!352890 (=> (not res!195699) (not e!216083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352890 (= res!195699 (validKeyInArray!0 k0!1348))))

(declare-fun b!352891 () Bool)

(declare-fun e!216086 () Bool)

(assert (=> b!352891 (= e!216086 tp_is_empty!7743)))

(declare-fun mapIsEmpty!13098 () Bool)

(declare-fun mapRes!13098 () Bool)

(assert (=> mapIsEmpty!13098 mapRes!13098))

(declare-fun mapNonEmpty!13098 () Bool)

(declare-fun tp!26963 () Bool)

(assert (=> mapNonEmpty!13098 (= mapRes!13098 (and tp!26963 e!216086))))

(declare-fun mapKey!13098 () (_ BitVec 32))

(declare-fun mapRest!13098 () (Array (_ BitVec 32) ValueCell!3528))

(declare-fun mapValue!13098 () ValueCell!3528)

(assert (=> mapNonEmpty!13098 (= (arr!9039 _values!1525) (store mapRest!13098 mapKey!13098 mapValue!13098))))

(declare-fun b!352892 () Bool)

(declare-fun res!195698 () Bool)

(assert (=> b!352892 (=> (not res!195698) (not e!216083))))

(declare-datatypes ((List!5262 0))(
  ( (Nil!5259) (Cons!5258 (h!6114 (_ BitVec 64)) (t!10408 List!5262)) )
))
(declare-fun arrayNoDuplicates!0 (array!19077 (_ BitVec 32) List!5262) Bool)

(assert (=> b!352892 (= res!195698 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5259))))

(declare-fun b!352893 () Bool)

(declare-fun e!216087 () Bool)

(assert (=> b!352893 (= e!216084 (and e!216087 mapRes!13098))))

(declare-fun condMapEmpty!13098 () Bool)

(declare-fun mapDefault!13098 () ValueCell!3528)

(assert (=> b!352893 (= condMapEmpty!13098 (= (arr!9039 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3528)) mapDefault!13098)))))

(declare-fun b!352894 () Bool)

(declare-datatypes ((SeekEntryResult!3476 0))(
  ( (MissingZero!3476 (index!16083 (_ BitVec 32))) (Found!3476 (index!16084 (_ BitVec 32))) (Intermediate!3476 (undefined!4288 Bool) (index!16085 (_ BitVec 32)) (x!35108 (_ BitVec 32))) (Undefined!3476) (MissingVacant!3476 (index!16086 (_ BitVec 32))) )
))
(declare-fun lt!165352 () SeekEntryResult!3476)

(get-info :version)

(assert (=> b!352894 (= e!216083 (and (not ((_ is Found!3476) lt!165352)) (not ((_ is MissingZero!3476) lt!165352)) (not ((_ is MissingVacant!3476) lt!165352)) (not ((_ is Undefined!3476) lt!165352))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19077 (_ BitVec 32)) SeekEntryResult!3476)

(assert (=> b!352894 (= lt!165352 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352895 () Bool)

(assert (=> b!352895 (= e!216087 tp_is_empty!7743)))

(declare-fun b!352896 () Bool)

(declare-fun res!195701 () Bool)

(assert (=> b!352896 (=> (not res!195701) (not e!216083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19077 (_ BitVec 32)) Bool)

(assert (=> b!352896 (= res!195701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!35198 res!195696) b!352888))

(assert (= (and b!352888 res!195700) b!352896))

(assert (= (and b!352896 res!195701) b!352892))

(assert (= (and b!352892 res!195698) b!352890))

(assert (= (and b!352890 res!195699) b!352889))

(assert (= (and b!352889 res!195697) b!352894))

(assert (= (and b!352893 condMapEmpty!13098) mapIsEmpty!13098))

(assert (= (and b!352893 (not condMapEmpty!13098)) mapNonEmpty!13098))

(assert (= (and mapNonEmpty!13098 ((_ is ValueCellFull!3528) mapValue!13098)) b!352891))

(assert (= (and b!352893 ((_ is ValueCellFull!3528) mapDefault!13098)) b!352895))

(assert (= start!35198 b!352893))

(declare-fun m!352407 () Bool)

(assert (=> mapNonEmpty!13098 m!352407))

(declare-fun m!352409 () Bool)

(assert (=> b!352892 m!352409))

(declare-fun m!352411 () Bool)

(assert (=> b!352890 m!352411))

(declare-fun m!352413 () Bool)

(assert (=> start!35198 m!352413))

(declare-fun m!352415 () Bool)

(assert (=> start!35198 m!352415))

(declare-fun m!352417 () Bool)

(assert (=> start!35198 m!352417))

(declare-fun m!352419 () Bool)

(assert (=> b!352896 m!352419))

(declare-fun m!352421 () Bool)

(assert (=> b!352894 m!352421))

(declare-fun m!352423 () Bool)

(assert (=> b!352889 m!352423))

(assert (=> b!352889 m!352423))

(declare-fun m!352425 () Bool)

(assert (=> b!352889 m!352425))

(check-sat (not start!35198) (not b!352894) (not b!352896) tp_is_empty!7743 (not b!352892) b_and!15029 (not b_next!7791) (not b!352889) (not mapNonEmpty!13098) (not b!352890))
(check-sat b_and!15029 (not b_next!7791))
(get-model)

(declare-fun d!71567 () Bool)

(assert (=> d!71567 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35198 d!71567))

(declare-fun d!71569 () Bool)

(assert (=> d!71569 (= (array_inv!6662 _values!1525) (bvsge (size!9391 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35198 d!71569))

(declare-fun d!71571 () Bool)

(assert (=> d!71571 (= (array_inv!6663 _keys!1895) (bvsge (size!9392 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35198 d!71571))

(declare-fun b!352934 () Bool)

(declare-fun e!216112 () Bool)

(declare-fun call!27091 () Bool)

(assert (=> b!352934 (= e!216112 call!27091)))

(declare-fun bm!27088 () Bool)

(declare-fun c!53622 () Bool)

(assert (=> bm!27088 (= call!27091 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53622 (Cons!5258 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000) Nil!5259) Nil!5259)))))

(declare-fun b!352935 () Bool)

(declare-fun e!216113 () Bool)

(declare-fun e!216111 () Bool)

(assert (=> b!352935 (= e!216113 e!216111)))

(declare-fun res!195727 () Bool)

(assert (=> b!352935 (=> (not res!195727) (not e!216111))))

(declare-fun e!216114 () Bool)

(assert (=> b!352935 (= res!195727 (not e!216114))))

(declare-fun res!195726 () Bool)

(assert (=> b!352935 (=> (not res!195726) (not e!216114))))

(assert (=> b!352935 (= res!195726 (validKeyInArray!0 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352936 () Bool)

(declare-fun contains!2368 (List!5262 (_ BitVec 64)) Bool)

(assert (=> b!352936 (= e!216114 (contains!2368 Nil!5259 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71573 () Bool)

(declare-fun res!195728 () Bool)

(assert (=> d!71573 (=> res!195728 e!216113)))

(assert (=> d!71573 (= res!195728 (bvsge #b00000000000000000000000000000000 (size!9392 _keys!1895)))))

(assert (=> d!71573 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5259) e!216113)))

(declare-fun b!352937 () Bool)

(assert (=> b!352937 (= e!216111 e!216112)))

(assert (=> b!352937 (= c!53622 (validKeyInArray!0 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!352938 () Bool)

(assert (=> b!352938 (= e!216112 call!27091)))

(assert (= (and d!71573 (not res!195728)) b!352935))

(assert (= (and b!352935 res!195726) b!352936))

(assert (= (and b!352935 res!195727) b!352937))

(assert (= (and b!352937 c!53622) b!352938))

(assert (= (and b!352937 (not c!53622)) b!352934))

(assert (= (or b!352938 b!352934) bm!27088))

(declare-fun m!352447 () Bool)

(assert (=> bm!27088 m!352447))

(declare-fun m!352449 () Bool)

(assert (=> bm!27088 m!352449))

(assert (=> b!352935 m!352447))

(assert (=> b!352935 m!352447))

(declare-fun m!352451 () Bool)

(assert (=> b!352935 m!352451))

(assert (=> b!352936 m!352447))

(assert (=> b!352936 m!352447))

(declare-fun m!352453 () Bool)

(assert (=> b!352936 m!352453))

(assert (=> b!352937 m!352447))

(assert (=> b!352937 m!352447))

(assert (=> b!352937 m!352451))

(assert (=> b!352892 d!71573))

(declare-fun d!71575 () Bool)

(declare-fun e!216119 () Bool)

(assert (=> d!71575 e!216119))

(declare-fun res!195731 () Bool)

(assert (=> d!71575 (=> res!195731 e!216119)))

(declare-fun lt!165367 () Bool)

(assert (=> d!71575 (= res!195731 (not lt!165367))))

(declare-fun lt!165364 () Bool)

(assert (=> d!71575 (= lt!165367 lt!165364)))

(declare-datatypes ((Unit!10908 0))(
  ( (Unit!10909) )
))
(declare-fun lt!165365 () Unit!10908)

(declare-fun e!216120 () Unit!10908)

(assert (=> d!71575 (= lt!165365 e!216120)))

(declare-fun c!53625 () Bool)

(assert (=> d!71575 (= c!53625 lt!165364)))

(declare-fun containsKey!345 (List!5261 (_ BitVec 64)) Bool)

(assert (=> d!71575 (= lt!165364 (containsKey!345 (toList!2294 (getCurrentListMap!1815 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71575 (= (contains!2367 (getCurrentListMap!1815 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165367)))

(declare-fun b!352945 () Bool)

(declare-fun lt!165366 () Unit!10908)

(assert (=> b!352945 (= e!216120 lt!165366)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!293 (List!5261 (_ BitVec 64)) Unit!10908)

(assert (=> b!352945 (= lt!165366 (lemmaContainsKeyImpliesGetValueByKeyDefined!293 (toList!2294 (getCurrentListMap!1815 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!359 0))(
  ( (Some!358 (v!6109 V!11301)) (None!357) )
))
(declare-fun isDefined!294 (Option!359) Bool)

(declare-fun getValueByKey!353 (List!5261 (_ BitVec 64)) Option!359)

(assert (=> b!352945 (isDefined!294 (getValueByKey!353 (toList!2294 (getCurrentListMap!1815 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!352946 () Bool)

(declare-fun Unit!10910 () Unit!10908)

(assert (=> b!352946 (= e!216120 Unit!10910)))

(declare-fun b!352947 () Bool)

(assert (=> b!352947 (= e!216119 (isDefined!294 (getValueByKey!353 (toList!2294 (getCurrentListMap!1815 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71575 c!53625) b!352945))

(assert (= (and d!71575 (not c!53625)) b!352946))

(assert (= (and d!71575 (not res!195731)) b!352947))

(declare-fun m!352455 () Bool)

(assert (=> d!71575 m!352455))

(declare-fun m!352457 () Bool)

(assert (=> b!352945 m!352457))

(declare-fun m!352459 () Bool)

(assert (=> b!352945 m!352459))

(assert (=> b!352945 m!352459))

(declare-fun m!352461 () Bool)

(assert (=> b!352945 m!352461))

(assert (=> b!352947 m!352459))

(assert (=> b!352947 m!352459))

(assert (=> b!352947 m!352461))

(assert (=> b!352889 d!71575))

(declare-fun bm!27103 () Bool)

(declare-fun call!27110 () ListLongMap!4557)

(declare-fun call!27108 () ListLongMap!4557)

(assert (=> bm!27103 (= call!27110 call!27108)))

(declare-fun b!352990 () Bool)

(declare-fun res!195757 () Bool)

(declare-fun e!216157 () Bool)

(assert (=> b!352990 (=> (not res!195757) (not e!216157))))

(declare-fun e!216148 () Bool)

(assert (=> b!352990 (= res!195757 e!216148)))

(declare-fun c!53642 () Bool)

(assert (=> b!352990 (= c!53642 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!352991 () Bool)

(declare-fun e!216154 () ListLongMap!4557)

(declare-fun call!27111 () ListLongMap!4557)

(declare-fun +!744 (ListLongMap!4557 tuple2!5644) ListLongMap!4557)

(assert (=> b!352991 (= e!216154 (+!744 call!27111 (tuple2!5645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!27104 () Bool)

(declare-fun call!27112 () Bool)

(declare-fun lt!165432 () ListLongMap!4557)

(assert (=> bm!27104 (= call!27112 (contains!2367 lt!165432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27105 () Bool)

(declare-fun call!27107 () ListLongMap!4557)

(assert (=> bm!27105 (= call!27107 call!27111)))

(declare-fun b!352993 () Bool)

(declare-fun e!216151 () Bool)

(assert (=> b!352993 (= e!216157 e!216151)))

(declare-fun c!53643 () Bool)

(assert (=> b!352993 (= c!53643 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!352994 () Bool)

(declare-fun e!216155 () ListLongMap!4557)

(declare-fun call!27106 () ListLongMap!4557)

(assert (=> b!352994 (= e!216155 call!27106)))

(declare-fun b!352995 () Bool)

(declare-fun e!216149 () Bool)

(declare-fun apply!295 (ListLongMap!4557 (_ BitVec 64)) V!11301)

(assert (=> b!352995 (= e!216149 (= (apply!295 lt!165432 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!352996 () Bool)

(declare-fun c!53638 () Bool)

(assert (=> b!352996 (= c!53638 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!216150 () ListLongMap!4557)

(assert (=> b!352996 (= e!216150 e!216155)))

(declare-fun b!352997 () Bool)

(declare-fun e!216147 () Bool)

(assert (=> b!352997 (= e!216148 e!216147)))

(declare-fun res!195758 () Bool)

(assert (=> b!352997 (= res!195758 call!27112)))

(assert (=> b!352997 (=> (not res!195758) (not e!216147))))

(declare-fun b!352998 () Bool)

(assert (=> b!352998 (= e!216150 call!27107)))

(declare-fun b!352999 () Bool)

(declare-fun res!195751 () Bool)

(assert (=> b!352999 (=> (not res!195751) (not e!216157))))

(declare-fun e!216152 () Bool)

(assert (=> b!352999 (= res!195751 e!216152)))

(declare-fun res!195753 () Bool)

(assert (=> b!352999 (=> res!195753 e!216152)))

(declare-fun e!216159 () Bool)

(assert (=> b!352999 (= res!195753 (not e!216159))))

(declare-fun res!195750 () Bool)

(assert (=> b!352999 (=> (not res!195750) (not e!216159))))

(assert (=> b!352999 (= res!195750 (bvslt #b00000000000000000000000000000000 (size!9392 _keys!1895)))))

(declare-fun c!53639 () Bool)

(declare-fun bm!27106 () Bool)

(declare-fun c!53640 () Bool)

(assert (=> bm!27106 (= call!27111 (+!744 (ite c!53639 call!27108 (ite c!53640 call!27110 call!27106)) (ite (or c!53639 c!53640) (tuple2!5645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!353000 () Bool)

(declare-fun e!216156 () Bool)

(assert (=> b!353000 (= e!216156 (validKeyInArray!0 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71577 () Bool)

(assert (=> d!71577 e!216157))

(declare-fun res!195754 () Bool)

(assert (=> d!71577 (=> (not res!195754) (not e!216157))))

(assert (=> d!71577 (= res!195754 (or (bvsge #b00000000000000000000000000000000 (size!9392 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9392 _keys!1895)))))))

(declare-fun lt!165419 () ListLongMap!4557)

(assert (=> d!71577 (= lt!165432 lt!165419)))

(declare-fun lt!165421 () Unit!10908)

(declare-fun e!216158 () Unit!10908)

(assert (=> d!71577 (= lt!165421 e!216158)))

(declare-fun c!53641 () Bool)

(assert (=> d!71577 (= c!53641 e!216156)))

(declare-fun res!195755 () Bool)

(assert (=> d!71577 (=> (not res!195755) (not e!216156))))

(assert (=> d!71577 (= res!195755 (bvslt #b00000000000000000000000000000000 (size!9392 _keys!1895)))))

(assert (=> d!71577 (= lt!165419 e!216154)))

(assert (=> d!71577 (= c!53639 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71577 (validMask!0 mask!2385)))

(assert (=> d!71577 (= (getCurrentListMap!1815 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165432)))

(declare-fun b!352992 () Bool)

(assert (=> b!352992 (= e!216148 (not call!27112))))

(declare-fun b!353001 () Bool)

(declare-fun e!216153 () Bool)

(assert (=> b!353001 (= e!216152 e!216153)))

(declare-fun res!195752 () Bool)

(assert (=> b!353001 (=> (not res!195752) (not e!216153))))

(assert (=> b!353001 (= res!195752 (contains!2367 lt!165432 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!353001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9392 _keys!1895)))))

(declare-fun b!353002 () Bool)

(declare-fun call!27109 () Bool)

(assert (=> b!353002 (= e!216151 (not call!27109))))

(declare-fun b!353003 () Bool)

(declare-fun get!4821 (ValueCell!3528 V!11301) V!11301)

(declare-fun dynLambda!638 (Int (_ BitVec 64)) V!11301)

(assert (=> b!353003 (= e!216153 (= (apply!295 lt!165432 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000)) (get!4821 (select (arr!9039 _values!1525) #b00000000000000000000000000000000) (dynLambda!638 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!353003 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9391 _values!1525)))))

(assert (=> b!353003 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9392 _keys!1895)))))

(declare-fun b!353004 () Bool)

(assert (=> b!353004 (= e!216159 (validKeyInArray!0 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27107 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!617 (array!19077 array!19075 (_ BitVec 32) (_ BitVec 32) V!11301 V!11301 (_ BitVec 32) Int) ListLongMap!4557)

(assert (=> bm!27107 (= call!27108 (getCurrentListMapNoExtraKeys!617 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!353005 () Bool)

(assert (=> b!353005 (= e!216147 (= (apply!295 lt!165432 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!353006 () Bool)

(declare-fun lt!165420 () Unit!10908)

(assert (=> b!353006 (= e!216158 lt!165420)))

(declare-fun lt!165433 () ListLongMap!4557)

(assert (=> b!353006 (= lt!165433 (getCurrentListMapNoExtraKeys!617 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165424 () (_ BitVec 64))

(assert (=> b!353006 (= lt!165424 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165423 () (_ BitVec 64))

(assert (=> b!353006 (= lt!165423 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165413 () Unit!10908)

(declare-fun addStillContains!271 (ListLongMap!4557 (_ BitVec 64) V!11301 (_ BitVec 64)) Unit!10908)

(assert (=> b!353006 (= lt!165413 (addStillContains!271 lt!165433 lt!165424 zeroValue!1467 lt!165423))))

(assert (=> b!353006 (contains!2367 (+!744 lt!165433 (tuple2!5645 lt!165424 zeroValue!1467)) lt!165423)))

(declare-fun lt!165431 () Unit!10908)

(assert (=> b!353006 (= lt!165431 lt!165413)))

(declare-fun lt!165429 () ListLongMap!4557)

(assert (=> b!353006 (= lt!165429 (getCurrentListMapNoExtraKeys!617 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165412 () (_ BitVec 64))

(assert (=> b!353006 (= lt!165412 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165422 () (_ BitVec 64))

(assert (=> b!353006 (= lt!165422 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165426 () Unit!10908)

(declare-fun addApplyDifferent!271 (ListLongMap!4557 (_ BitVec 64) V!11301 (_ BitVec 64)) Unit!10908)

(assert (=> b!353006 (= lt!165426 (addApplyDifferent!271 lt!165429 lt!165412 minValue!1467 lt!165422))))

(assert (=> b!353006 (= (apply!295 (+!744 lt!165429 (tuple2!5645 lt!165412 minValue!1467)) lt!165422) (apply!295 lt!165429 lt!165422))))

(declare-fun lt!165416 () Unit!10908)

(assert (=> b!353006 (= lt!165416 lt!165426)))

(declare-fun lt!165427 () ListLongMap!4557)

(assert (=> b!353006 (= lt!165427 (getCurrentListMapNoExtraKeys!617 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165430 () (_ BitVec 64))

(assert (=> b!353006 (= lt!165430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165425 () (_ BitVec 64))

(assert (=> b!353006 (= lt!165425 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165414 () Unit!10908)

(assert (=> b!353006 (= lt!165414 (addApplyDifferent!271 lt!165427 lt!165430 zeroValue!1467 lt!165425))))

(assert (=> b!353006 (= (apply!295 (+!744 lt!165427 (tuple2!5645 lt!165430 zeroValue!1467)) lt!165425) (apply!295 lt!165427 lt!165425))))

(declare-fun lt!165428 () Unit!10908)

(assert (=> b!353006 (= lt!165428 lt!165414)))

(declare-fun lt!165417 () ListLongMap!4557)

(assert (=> b!353006 (= lt!165417 (getCurrentListMapNoExtraKeys!617 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165418 () (_ BitVec 64))

(assert (=> b!353006 (= lt!165418 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165415 () (_ BitVec 64))

(assert (=> b!353006 (= lt!165415 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!353006 (= lt!165420 (addApplyDifferent!271 lt!165417 lt!165418 minValue!1467 lt!165415))))

(assert (=> b!353006 (= (apply!295 (+!744 lt!165417 (tuple2!5645 lt!165418 minValue!1467)) lt!165415) (apply!295 lt!165417 lt!165415))))

(declare-fun b!353007 () Bool)

(assert (=> b!353007 (= e!216155 call!27107)))

(declare-fun b!353008 () Bool)

(declare-fun Unit!10911 () Unit!10908)

(assert (=> b!353008 (= e!216158 Unit!10911)))

(declare-fun bm!27108 () Bool)

(assert (=> bm!27108 (= call!27109 (contains!2367 lt!165432 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353009 () Bool)

(assert (=> b!353009 (= e!216151 e!216149)))

(declare-fun res!195756 () Bool)

(assert (=> b!353009 (= res!195756 call!27109)))

(assert (=> b!353009 (=> (not res!195756) (not e!216149))))

(declare-fun bm!27109 () Bool)

(assert (=> bm!27109 (= call!27106 call!27110)))

(declare-fun b!353010 () Bool)

(assert (=> b!353010 (= e!216154 e!216150)))

(assert (=> b!353010 (= c!53640 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!71577 c!53639) b!352991))

(assert (= (and d!71577 (not c!53639)) b!353010))

(assert (= (and b!353010 c!53640) b!352998))

(assert (= (and b!353010 (not c!53640)) b!352996))

(assert (= (and b!352996 c!53638) b!353007))

(assert (= (and b!352996 (not c!53638)) b!352994))

(assert (= (or b!353007 b!352994) bm!27109))

(assert (= (or b!352998 bm!27109) bm!27103))

(assert (= (or b!352998 b!353007) bm!27105))

(assert (= (or b!352991 bm!27103) bm!27107))

(assert (= (or b!352991 bm!27105) bm!27106))

(assert (= (and d!71577 res!195755) b!353000))

(assert (= (and d!71577 c!53641) b!353006))

(assert (= (and d!71577 (not c!53641)) b!353008))

(assert (= (and d!71577 res!195754) b!352999))

(assert (= (and b!352999 res!195750) b!353004))

(assert (= (and b!352999 (not res!195753)) b!353001))

(assert (= (and b!353001 res!195752) b!353003))

(assert (= (and b!352999 res!195751) b!352990))

(assert (= (and b!352990 c!53642) b!352997))

(assert (= (and b!352990 (not c!53642)) b!352992))

(assert (= (and b!352997 res!195758) b!353005))

(assert (= (or b!352997 b!352992) bm!27104))

(assert (= (and b!352990 res!195757) b!352993))

(assert (= (and b!352993 c!53643) b!353009))

(assert (= (and b!352993 (not c!53643)) b!353002))

(assert (= (and b!353009 res!195756) b!352995))

(assert (= (or b!353009 b!353002) bm!27108))

(declare-fun b_lambda!8519 () Bool)

(assert (=> (not b_lambda!8519) (not b!353003)))

(declare-fun t!10411 () Bool)

(declare-fun tb!3105 () Bool)

(assert (=> (and start!35198 (= defaultEntry!1528 defaultEntry!1528) t!10411) tb!3105))

(declare-fun result!5645 () Bool)

(assert (=> tb!3105 (= result!5645 tp_is_empty!7743)))

(assert (=> b!353003 t!10411))

(declare-fun b_and!15033 () Bool)

(assert (= b_and!15029 (and (=> t!10411 result!5645) b_and!15033)))

(declare-fun m!352463 () Bool)

(assert (=> b!352991 m!352463))

(declare-fun m!352465 () Bool)

(assert (=> b!353006 m!352465))

(declare-fun m!352467 () Bool)

(assert (=> b!353006 m!352467))

(declare-fun m!352469 () Bool)

(assert (=> b!353006 m!352469))

(declare-fun m!352471 () Bool)

(assert (=> b!353006 m!352471))

(declare-fun m!352473 () Bool)

(assert (=> b!353006 m!352473))

(assert (=> b!353006 m!352465))

(declare-fun m!352475 () Bool)

(assert (=> b!353006 m!352475))

(declare-fun m!352477 () Bool)

(assert (=> b!353006 m!352477))

(declare-fun m!352479 () Bool)

(assert (=> b!353006 m!352479))

(declare-fun m!352481 () Bool)

(assert (=> b!353006 m!352481))

(declare-fun m!352483 () Bool)

(assert (=> b!353006 m!352483))

(declare-fun m!352485 () Bool)

(assert (=> b!353006 m!352485))

(assert (=> b!353006 m!352471))

(declare-fun m!352487 () Bool)

(assert (=> b!353006 m!352487))

(declare-fun m!352489 () Bool)

(assert (=> b!353006 m!352489))

(assert (=> b!353006 m!352481))

(declare-fun m!352491 () Bool)

(assert (=> b!353006 m!352491))

(assert (=> b!353006 m!352447))

(declare-fun m!352493 () Bool)

(assert (=> b!353006 m!352493))

(assert (=> b!353006 m!352493))

(declare-fun m!352495 () Bool)

(assert (=> b!353006 m!352495))

(declare-fun m!352497 () Bool)

(assert (=> bm!27106 m!352497))

(declare-fun m!352499 () Bool)

(assert (=> bm!27108 m!352499))

(declare-fun m!352501 () Bool)

(assert (=> bm!27104 m!352501))

(assert (=> d!71577 m!352413))

(assert (=> bm!27107 m!352485))

(assert (=> b!353001 m!352447))

(assert (=> b!353001 m!352447))

(declare-fun m!352503 () Bool)

(assert (=> b!353001 m!352503))

(declare-fun m!352505 () Bool)

(assert (=> b!353005 m!352505))

(assert (=> b!353000 m!352447))

(assert (=> b!353000 m!352447))

(assert (=> b!353000 m!352451))

(assert (=> b!353004 m!352447))

(assert (=> b!353004 m!352447))

(assert (=> b!353004 m!352451))

(declare-fun m!352507 () Bool)

(assert (=> b!352995 m!352507))

(assert (=> b!353003 m!352447))

(declare-fun m!352509 () Bool)

(assert (=> b!353003 m!352509))

(declare-fun m!352511 () Bool)

(assert (=> b!353003 m!352511))

(declare-fun m!352513 () Bool)

(assert (=> b!353003 m!352513))

(declare-fun m!352515 () Bool)

(assert (=> b!353003 m!352515))

(assert (=> b!353003 m!352447))

(assert (=> b!353003 m!352513))

(assert (=> b!353003 m!352511))

(assert (=> b!352889 d!71577))

(declare-fun b!353021 () Bool)

(declare-fun e!216167 () Bool)

(declare-fun e!216168 () Bool)

(assert (=> b!353021 (= e!216167 e!216168)))

(declare-fun c!53646 () Bool)

(assert (=> b!353021 (= c!53646 (validKeyInArray!0 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353023 () Bool)

(declare-fun e!216166 () Bool)

(declare-fun call!27115 () Bool)

(assert (=> b!353023 (= e!216166 call!27115)))

(declare-fun b!353024 () Bool)

(assert (=> b!353024 (= e!216168 e!216166)))

(declare-fun lt!165442 () (_ BitVec 64))

(assert (=> b!353024 (= lt!165442 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165440 () Unit!10908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19077 (_ BitVec 64) (_ BitVec 32)) Unit!10908)

(assert (=> b!353024 (= lt!165440 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165442 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353024 (arrayContainsKey!0 _keys!1895 lt!165442 #b00000000000000000000000000000000)))

(declare-fun lt!165441 () Unit!10908)

(assert (=> b!353024 (= lt!165441 lt!165440)))

(declare-fun res!195764 () Bool)

(assert (=> b!353024 (= res!195764 (= (seekEntryOrOpen!0 (select (arr!9040 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3476 #b00000000000000000000000000000000)))))

(assert (=> b!353024 (=> (not res!195764) (not e!216166))))

(declare-fun bm!27112 () Bool)

(assert (=> bm!27112 (= call!27115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!353022 () Bool)

(assert (=> b!353022 (= e!216168 call!27115)))

(declare-fun d!71579 () Bool)

(declare-fun res!195763 () Bool)

(assert (=> d!71579 (=> res!195763 e!216167)))

(assert (=> d!71579 (= res!195763 (bvsge #b00000000000000000000000000000000 (size!9392 _keys!1895)))))

(assert (=> d!71579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!216167)))

(assert (= (and d!71579 (not res!195763)) b!353021))

(assert (= (and b!353021 c!53646) b!353024))

(assert (= (and b!353021 (not c!53646)) b!353022))

(assert (= (and b!353024 res!195764) b!353023))

(assert (= (or b!353023 b!353022) bm!27112))

(assert (=> b!353021 m!352447))

(assert (=> b!353021 m!352447))

(assert (=> b!353021 m!352451))

(assert (=> b!353024 m!352447))

(declare-fun m!352517 () Bool)

(assert (=> b!353024 m!352517))

(declare-fun m!352519 () Bool)

(assert (=> b!353024 m!352519))

(assert (=> b!353024 m!352447))

(declare-fun m!352521 () Bool)

(assert (=> b!353024 m!352521))

(declare-fun m!352523 () Bool)

(assert (=> bm!27112 m!352523))

(assert (=> b!352896 d!71579))

(declare-fun b!353037 () Bool)

(declare-fun e!216176 () SeekEntryResult!3476)

(declare-fun lt!165450 () SeekEntryResult!3476)

(assert (=> b!353037 (= e!216176 (Found!3476 (index!16085 lt!165450)))))

(declare-fun b!353038 () Bool)

(declare-fun e!216175 () SeekEntryResult!3476)

(assert (=> b!353038 (= e!216175 e!216176)))

(declare-fun lt!165449 () (_ BitVec 64))

(assert (=> b!353038 (= lt!165449 (select (arr!9040 _keys!1895) (index!16085 lt!165450)))))

(declare-fun c!53655 () Bool)

(assert (=> b!353038 (= c!53655 (= lt!165449 k0!1348))))

(declare-fun d!71581 () Bool)

(declare-fun lt!165451 () SeekEntryResult!3476)

(assert (=> d!71581 (and (or ((_ is Undefined!3476) lt!165451) (not ((_ is Found!3476) lt!165451)) (and (bvsge (index!16084 lt!165451) #b00000000000000000000000000000000) (bvslt (index!16084 lt!165451) (size!9392 _keys!1895)))) (or ((_ is Undefined!3476) lt!165451) ((_ is Found!3476) lt!165451) (not ((_ is MissingZero!3476) lt!165451)) (and (bvsge (index!16083 lt!165451) #b00000000000000000000000000000000) (bvslt (index!16083 lt!165451) (size!9392 _keys!1895)))) (or ((_ is Undefined!3476) lt!165451) ((_ is Found!3476) lt!165451) ((_ is MissingZero!3476) lt!165451) (not ((_ is MissingVacant!3476) lt!165451)) (and (bvsge (index!16086 lt!165451) #b00000000000000000000000000000000) (bvslt (index!16086 lt!165451) (size!9392 _keys!1895)))) (or ((_ is Undefined!3476) lt!165451) (ite ((_ is Found!3476) lt!165451) (= (select (arr!9040 _keys!1895) (index!16084 lt!165451)) k0!1348) (ite ((_ is MissingZero!3476) lt!165451) (= (select (arr!9040 _keys!1895) (index!16083 lt!165451)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3476) lt!165451) (= (select (arr!9040 _keys!1895) (index!16086 lt!165451)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71581 (= lt!165451 e!216175)))

(declare-fun c!53654 () Bool)

(assert (=> d!71581 (= c!53654 (and ((_ is Intermediate!3476) lt!165450) (undefined!4288 lt!165450)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19077 (_ BitVec 32)) SeekEntryResult!3476)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71581 (= lt!165450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71581 (validMask!0 mask!2385)))

(assert (=> d!71581 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165451)))

(declare-fun b!353039 () Bool)

(assert (=> b!353039 (= e!216175 Undefined!3476)))

(declare-fun b!353040 () Bool)

(declare-fun e!216177 () SeekEntryResult!3476)

(assert (=> b!353040 (= e!216177 (MissingZero!3476 (index!16085 lt!165450)))))

(declare-fun b!353041 () Bool)

(declare-fun c!53653 () Bool)

(assert (=> b!353041 (= c!53653 (= lt!165449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!353041 (= e!216176 e!216177)))

(declare-fun b!353042 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19077 (_ BitVec 32)) SeekEntryResult!3476)

(assert (=> b!353042 (= e!216177 (seekKeyOrZeroReturnVacant!0 (x!35108 lt!165450) (index!16085 lt!165450) (index!16085 lt!165450) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!71581 c!53654) b!353039))

(assert (= (and d!71581 (not c!53654)) b!353038))

(assert (= (and b!353038 c!53655) b!353037))

(assert (= (and b!353038 (not c!53655)) b!353041))

(assert (= (and b!353041 c!53653) b!353040))

(assert (= (and b!353041 (not c!53653)) b!353042))

(declare-fun m!352525 () Bool)

(assert (=> b!353038 m!352525))

(declare-fun m!352527 () Bool)

(assert (=> d!71581 m!352527))

(declare-fun m!352529 () Bool)

(assert (=> d!71581 m!352529))

(declare-fun m!352531 () Bool)

(assert (=> d!71581 m!352531))

(declare-fun m!352533 () Bool)

(assert (=> d!71581 m!352533))

(assert (=> d!71581 m!352529))

(declare-fun m!352535 () Bool)

(assert (=> d!71581 m!352535))

(assert (=> d!71581 m!352413))

(declare-fun m!352537 () Bool)

(assert (=> b!353042 m!352537))

(assert (=> b!352894 d!71581))

(declare-fun d!71583 () Bool)

(assert (=> d!71583 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!352890 d!71583))

(declare-fun mapIsEmpty!13104 () Bool)

(declare-fun mapRes!13104 () Bool)

(assert (=> mapIsEmpty!13104 mapRes!13104))

(declare-fun b!353050 () Bool)

(declare-fun e!216183 () Bool)

(assert (=> b!353050 (= e!216183 tp_is_empty!7743)))

(declare-fun condMapEmpty!13104 () Bool)

(declare-fun mapDefault!13104 () ValueCell!3528)

(assert (=> mapNonEmpty!13098 (= condMapEmpty!13104 (= mapRest!13098 ((as const (Array (_ BitVec 32) ValueCell!3528)) mapDefault!13104)))))

(assert (=> mapNonEmpty!13098 (= tp!26963 (and e!216183 mapRes!13104))))

(declare-fun b!353049 () Bool)

(declare-fun e!216182 () Bool)

(assert (=> b!353049 (= e!216182 tp_is_empty!7743)))

(declare-fun mapNonEmpty!13104 () Bool)

(declare-fun tp!26973 () Bool)

(assert (=> mapNonEmpty!13104 (= mapRes!13104 (and tp!26973 e!216182))))

(declare-fun mapRest!13104 () (Array (_ BitVec 32) ValueCell!3528))

(declare-fun mapKey!13104 () (_ BitVec 32))

(declare-fun mapValue!13104 () ValueCell!3528)

(assert (=> mapNonEmpty!13104 (= mapRest!13098 (store mapRest!13104 mapKey!13104 mapValue!13104))))

(assert (= (and mapNonEmpty!13098 condMapEmpty!13104) mapIsEmpty!13104))

(assert (= (and mapNonEmpty!13098 (not condMapEmpty!13104)) mapNonEmpty!13104))

(assert (= (and mapNonEmpty!13104 ((_ is ValueCellFull!3528) mapValue!13104)) b!353049))

(assert (= (and mapNonEmpty!13098 ((_ is ValueCellFull!3528) mapDefault!13104)) b!353050))

(declare-fun m!352539 () Bool)

(assert (=> mapNonEmpty!13104 m!352539))

(declare-fun b_lambda!8521 () Bool)

(assert (= b_lambda!8519 (or (and start!35198 b_free!7791) b_lambda!8521)))

(check-sat (not b!353005) tp_is_empty!7743 (not b!353024) (not d!71575) (not bm!27104) (not bm!27112) (not b_next!7791) (not bm!27088) (not b!353001) (not b!352945) (not b!353003) (not b_lambda!8521) (not b!353004) (not d!71581) (not b!352995) (not b!353000) (not d!71577) (not bm!27107) (not bm!27108) (not b!353021) (not mapNonEmpty!13104) (not b!352935) (not b!353042) (not bm!27106) (not b!352947) (not b!352936) (not b!353006) (not b!352937) b_and!15033 (not b!352991))
(check-sat b_and!15033 (not b_next!7791))
