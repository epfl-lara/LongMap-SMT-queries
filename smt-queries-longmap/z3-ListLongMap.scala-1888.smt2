; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33766 () Bool)

(assert start!33766)

(declare-fun b_free!6997 () Bool)

(declare-fun b_next!6997 () Bool)

(assert (=> start!33766 (= b_free!6997 (not b_next!6997))))

(declare-fun tp!24498 () Bool)

(declare-fun b_and!14193 () Bool)

(assert (=> start!33766 (= tp!24498 b_and!14193)))

(declare-fun b!335989 () Bool)

(declare-fun e!206241 () Bool)

(declare-datatypes ((SeekEntryResult!3162 0))(
  ( (MissingZero!3162 (index!14827 (_ BitVec 32))) (Found!3162 (index!14828 (_ BitVec 32))) (Intermediate!3162 (undefined!3974 Bool) (index!14829 (_ BitVec 32)) (x!33455 (_ BitVec 32))) (Undefined!3162) (MissingVacant!3162 (index!14830 (_ BitVec 32))) )
))
(declare-fun lt!160072 () SeekEntryResult!3162)

(declare-datatypes ((array!17478 0))(
  ( (array!17479 (arr!8268 (Array (_ BitVec 32) (_ BitVec 64))) (size!8620 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17478)

(get-info :version)

(assert (=> b!335989 (= e!206241 (and (not ((_ is Found!3162) lt!160072)) ((_ is MissingZero!3162) lt!160072) (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)) (bvsge (size!8620 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17478 (_ BitVec 32)) SeekEntryResult!3162)

(assert (=> b!335989 (= lt!160072 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335990 () Bool)

(declare-fun e!206240 () Bool)

(declare-fun e!206243 () Bool)

(declare-fun mapRes!11823 () Bool)

(assert (=> b!335990 (= e!206240 (and e!206243 mapRes!11823))))

(declare-fun condMapEmpty!11823 () Bool)

(declare-datatypes ((V!10243 0))(
  ( (V!10244 (val!3519 Int)) )
))
(declare-datatypes ((ValueCell!3131 0))(
  ( (ValueCellFull!3131 (v!5683 V!10243)) (EmptyCell!3131) )
))
(declare-datatypes ((array!17480 0))(
  ( (array!17481 (arr!8269 (Array (_ BitVec 32) ValueCell!3131)) (size!8621 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17480)

(declare-fun mapDefault!11823 () ValueCell!3131)

(assert (=> b!335990 (= condMapEmpty!11823 (= (arr!8269 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3131)) mapDefault!11823)))))

(declare-fun b!335991 () Bool)

(declare-fun tp_is_empty!6949 () Bool)

(assert (=> b!335991 (= e!206243 tp_is_empty!6949)))

(declare-fun b!335992 () Bool)

(declare-fun res!185480 () Bool)

(assert (=> b!335992 (=> (not res!185480) (not e!206241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335992 (= res!185480 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11823 () Bool)

(assert (=> mapIsEmpty!11823 mapRes!11823))

(declare-fun b!335993 () Bool)

(declare-fun res!185483 () Bool)

(assert (=> b!335993 (=> (not res!185483) (not e!206241))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335993 (= res!185483 (and (= (size!8621 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8620 _keys!1895) (size!8621 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335994 () Bool)

(declare-fun res!185479 () Bool)

(assert (=> b!335994 (=> (not res!185479) (not e!206241))))

(declare-datatypes ((List!4647 0))(
  ( (Nil!4644) (Cons!4643 (h!5499 (_ BitVec 64)) (t!9729 List!4647)) )
))
(declare-fun arrayNoDuplicates!0 (array!17478 (_ BitVec 32) List!4647) Bool)

(assert (=> b!335994 (= res!185479 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4644))))

(declare-fun res!185481 () Bool)

(assert (=> start!33766 (=> (not res!185481) (not e!206241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33766 (= res!185481 (validMask!0 mask!2385))))

(assert (=> start!33766 e!206241))

(assert (=> start!33766 true))

(assert (=> start!33766 tp_is_empty!6949))

(assert (=> start!33766 tp!24498))

(declare-fun array_inv!6148 (array!17480) Bool)

(assert (=> start!33766 (and (array_inv!6148 _values!1525) e!206240)))

(declare-fun array_inv!6149 (array!17478) Bool)

(assert (=> start!33766 (array_inv!6149 _keys!1895)))

(declare-fun b!335995 () Bool)

(declare-fun e!206242 () Bool)

(assert (=> b!335995 (= e!206242 tp_is_empty!6949)))

(declare-fun b!335996 () Bool)

(declare-fun res!185482 () Bool)

(assert (=> b!335996 (=> (not res!185482) (not e!206241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17478 (_ BitVec 32)) Bool)

(assert (=> b!335996 (= res!185482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11823 () Bool)

(declare-fun tp!24497 () Bool)

(assert (=> mapNonEmpty!11823 (= mapRes!11823 (and tp!24497 e!206242))))

(declare-fun mapValue!11823 () ValueCell!3131)

(declare-fun mapRest!11823 () (Array (_ BitVec 32) ValueCell!3131))

(declare-fun mapKey!11823 () (_ BitVec 32))

(assert (=> mapNonEmpty!11823 (= (arr!8269 _values!1525) (store mapRest!11823 mapKey!11823 mapValue!11823))))

(declare-fun b!335997 () Bool)

(declare-fun res!185478 () Bool)

(assert (=> b!335997 (=> (not res!185478) (not e!206241))))

(declare-fun zeroValue!1467 () V!10243)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10243)

(declare-datatypes ((tuple2!5032 0))(
  ( (tuple2!5033 (_1!2527 (_ BitVec 64)) (_2!2527 V!10243)) )
))
(declare-datatypes ((List!4648 0))(
  ( (Nil!4645) (Cons!4644 (h!5500 tuple2!5032) (t!9730 List!4648)) )
))
(declare-datatypes ((ListLongMap!3947 0))(
  ( (ListLongMap!3948 (toList!1989 List!4648)) )
))
(declare-fun contains!2053 (ListLongMap!3947 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1518 (array!17478 array!17480 (_ BitVec 32) (_ BitVec 32) V!10243 V!10243 (_ BitVec 32) Int) ListLongMap!3947)

(assert (=> b!335997 (= res!185478 (not (contains!2053 (getCurrentListMap!1518 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33766 res!185481) b!335993))

(assert (= (and b!335993 res!185483) b!335996))

(assert (= (and b!335996 res!185482) b!335994))

(assert (= (and b!335994 res!185479) b!335992))

(assert (= (and b!335992 res!185480) b!335997))

(assert (= (and b!335997 res!185478) b!335989))

(assert (= (and b!335990 condMapEmpty!11823) mapIsEmpty!11823))

(assert (= (and b!335990 (not condMapEmpty!11823)) mapNonEmpty!11823))

(assert (= (and mapNonEmpty!11823 ((_ is ValueCellFull!3131) mapValue!11823)) b!335995))

(assert (= (and b!335990 ((_ is ValueCellFull!3131) mapDefault!11823)) b!335991))

(assert (= start!33766 b!335990))

(declare-fun m!340179 () Bool)

(assert (=> b!335992 m!340179))

(declare-fun m!340181 () Bool)

(assert (=> b!335989 m!340181))

(declare-fun m!340183 () Bool)

(assert (=> mapNonEmpty!11823 m!340183))

(declare-fun m!340185 () Bool)

(assert (=> start!33766 m!340185))

(declare-fun m!340187 () Bool)

(assert (=> start!33766 m!340187))

(declare-fun m!340189 () Bool)

(assert (=> start!33766 m!340189))

(declare-fun m!340191 () Bool)

(assert (=> b!335997 m!340191))

(assert (=> b!335997 m!340191))

(declare-fun m!340193 () Bool)

(assert (=> b!335997 m!340193))

(declare-fun m!340195 () Bool)

(assert (=> b!335996 m!340195))

(declare-fun m!340197 () Bool)

(assert (=> b!335994 m!340197))

(check-sat (not b_next!6997) (not b!335989) (not b!335994) (not mapNonEmpty!11823) tp_is_empty!6949 (not b!335996) (not b!335992) (not b!335997) b_and!14193 (not start!33766))
(check-sat b_and!14193 (not b_next!6997))
(get-model)

(declare-fun d!70701 () Bool)

(assert (=> d!70701 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!335992 d!70701))

(declare-fun b!336060 () Bool)

(declare-fun e!206280 () Bool)

(declare-fun e!206281 () Bool)

(assert (=> b!336060 (= e!206280 e!206281)))

(declare-fun c!52208 () Bool)

(assert (=> b!336060 (= c!52208 (validKeyInArray!0 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26309 () Bool)

(declare-fun call!26312 () Bool)

(assert (=> bm!26309 (= call!26312 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!70703 () Bool)

(declare-fun res!185525 () Bool)

(assert (=> d!70703 (=> res!185525 e!206280)))

(assert (=> d!70703 (= res!185525 (bvsge #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(assert (=> d!70703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206280)))

(declare-fun b!336061 () Bool)

(declare-fun e!206282 () Bool)

(assert (=> b!336061 (= e!206281 e!206282)))

(declare-fun lt!160086 () (_ BitVec 64))

(assert (=> b!336061 (= lt!160086 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10429 0))(
  ( (Unit!10430) )
))
(declare-fun lt!160087 () Unit!10429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17478 (_ BitVec 64) (_ BitVec 32)) Unit!10429)

(assert (=> b!336061 (= lt!160087 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160086 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336061 (arrayContainsKey!0 _keys!1895 lt!160086 #b00000000000000000000000000000000)))

(declare-fun lt!160085 () Unit!10429)

(assert (=> b!336061 (= lt!160085 lt!160087)))

(declare-fun res!185524 () Bool)

(assert (=> b!336061 (= res!185524 (= (seekEntryOrOpen!0 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3162 #b00000000000000000000000000000000)))))

(assert (=> b!336061 (=> (not res!185524) (not e!206282))))

(declare-fun b!336062 () Bool)

(assert (=> b!336062 (= e!206281 call!26312)))

(declare-fun b!336063 () Bool)

(assert (=> b!336063 (= e!206282 call!26312)))

(assert (= (and d!70703 (not res!185525)) b!336060))

(assert (= (and b!336060 c!52208) b!336061))

(assert (= (and b!336060 (not c!52208)) b!336062))

(assert (= (and b!336061 res!185524) b!336063))

(assert (= (or b!336063 b!336062) bm!26309))

(declare-fun m!340239 () Bool)

(assert (=> b!336060 m!340239))

(assert (=> b!336060 m!340239))

(declare-fun m!340241 () Bool)

(assert (=> b!336060 m!340241))

(declare-fun m!340243 () Bool)

(assert (=> bm!26309 m!340243))

(assert (=> b!336061 m!340239))

(declare-fun m!340245 () Bool)

(assert (=> b!336061 m!340245))

(declare-fun m!340247 () Bool)

(assert (=> b!336061 m!340247))

(assert (=> b!336061 m!340239))

(declare-fun m!340249 () Bool)

(assert (=> b!336061 m!340249))

(assert (=> b!335996 d!70703))

(declare-fun b!336074 () Bool)

(declare-fun e!206292 () Bool)

(declare-fun e!206294 () Bool)

(assert (=> b!336074 (= e!206292 e!206294)))

(declare-fun res!185532 () Bool)

(assert (=> b!336074 (=> (not res!185532) (not e!206294))))

(declare-fun e!206291 () Bool)

(assert (=> b!336074 (= res!185532 (not e!206291))))

(declare-fun res!185533 () Bool)

(assert (=> b!336074 (=> (not res!185533) (not e!206291))))

(assert (=> b!336074 (= res!185533 (validKeyInArray!0 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336075 () Bool)

(declare-fun e!206293 () Bool)

(assert (=> b!336075 (= e!206294 e!206293)))

(declare-fun c!52211 () Bool)

(assert (=> b!336075 (= c!52211 (validKeyInArray!0 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70705 () Bool)

(declare-fun res!185534 () Bool)

(assert (=> d!70705 (=> res!185534 e!206292)))

(assert (=> d!70705 (= res!185534 (bvsge #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(assert (=> d!70705 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4644) e!206292)))

(declare-fun bm!26312 () Bool)

(declare-fun call!26315 () Bool)

(assert (=> bm!26312 (= call!26315 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52211 (Cons!4643 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000) Nil!4644) Nil!4644)))))

(declare-fun b!336076 () Bool)

(assert (=> b!336076 (= e!206293 call!26315)))

(declare-fun b!336077 () Bool)

(declare-fun contains!2055 (List!4647 (_ BitVec 64)) Bool)

(assert (=> b!336077 (= e!206291 (contains!2055 Nil!4644 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336078 () Bool)

(assert (=> b!336078 (= e!206293 call!26315)))

(assert (= (and d!70705 (not res!185534)) b!336074))

(assert (= (and b!336074 res!185533) b!336077))

(assert (= (and b!336074 res!185532) b!336075))

(assert (= (and b!336075 c!52211) b!336076))

(assert (= (and b!336075 (not c!52211)) b!336078))

(assert (= (or b!336076 b!336078) bm!26312))

(assert (=> b!336074 m!340239))

(assert (=> b!336074 m!340239))

(assert (=> b!336074 m!340241))

(assert (=> b!336075 m!340239))

(assert (=> b!336075 m!340239))

(assert (=> b!336075 m!340241))

(assert (=> bm!26312 m!340239))

(declare-fun m!340251 () Bool)

(assert (=> bm!26312 m!340251))

(assert (=> b!336077 m!340239))

(assert (=> b!336077 m!340239))

(declare-fun m!340253 () Bool)

(assert (=> b!336077 m!340253))

(assert (=> b!335994 d!70705))

(declare-fun d!70707 () Bool)

(assert (=> d!70707 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33766 d!70707))

(declare-fun d!70709 () Bool)

(assert (=> d!70709 (= (array_inv!6148 _values!1525) (bvsge (size!8621 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33766 d!70709))

(declare-fun d!70711 () Bool)

(assert (=> d!70711 (= (array_inv!6149 _keys!1895) (bvsge (size!8620 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33766 d!70711))

(declare-fun d!70713 () Bool)

(declare-fun e!206300 () Bool)

(assert (=> d!70713 e!206300))

(declare-fun res!185537 () Bool)

(assert (=> d!70713 (=> res!185537 e!206300)))

(declare-fun lt!160099 () Bool)

(assert (=> d!70713 (= res!185537 (not lt!160099))))

(declare-fun lt!160097 () Bool)

(assert (=> d!70713 (= lt!160099 lt!160097)))

(declare-fun lt!160096 () Unit!10429)

(declare-fun e!206299 () Unit!10429)

(assert (=> d!70713 (= lt!160096 e!206299)))

(declare-fun c!52214 () Bool)

(assert (=> d!70713 (= c!52214 lt!160097)))

(declare-fun containsKey!317 (List!4648 (_ BitVec 64)) Bool)

(assert (=> d!70713 (= lt!160097 (containsKey!317 (toList!1989 (getCurrentListMap!1518 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70713 (= (contains!2053 (getCurrentListMap!1518 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160099)))

(declare-fun b!336085 () Bool)

(declare-fun lt!160098 () Unit!10429)

(assert (=> b!336085 (= e!206299 lt!160098)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!265 (List!4648 (_ BitVec 64)) Unit!10429)

(assert (=> b!336085 (= lt!160098 (lemmaContainsKeyImpliesGetValueByKeyDefined!265 (toList!1989 (getCurrentListMap!1518 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!332 0))(
  ( (Some!331 (v!5686 V!10243)) (None!330) )
))
(declare-fun isDefined!266 (Option!332) Bool)

(declare-fun getValueByKey!326 (List!4648 (_ BitVec 64)) Option!332)

(assert (=> b!336085 (isDefined!266 (getValueByKey!326 (toList!1989 (getCurrentListMap!1518 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!336086 () Bool)

(declare-fun Unit!10431 () Unit!10429)

(assert (=> b!336086 (= e!206299 Unit!10431)))

(declare-fun b!336087 () Bool)

(assert (=> b!336087 (= e!206300 (isDefined!266 (getValueByKey!326 (toList!1989 (getCurrentListMap!1518 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70713 c!52214) b!336085))

(assert (= (and d!70713 (not c!52214)) b!336086))

(assert (= (and d!70713 (not res!185537)) b!336087))

(declare-fun m!340255 () Bool)

(assert (=> d!70713 m!340255))

(declare-fun m!340257 () Bool)

(assert (=> b!336085 m!340257))

(declare-fun m!340259 () Bool)

(assert (=> b!336085 m!340259))

(assert (=> b!336085 m!340259))

(declare-fun m!340261 () Bool)

(assert (=> b!336085 m!340261))

(assert (=> b!336087 m!340259))

(assert (=> b!336087 m!340259))

(assert (=> b!336087 m!340261))

(assert (=> b!335997 d!70713))

(declare-fun b!336130 () Bool)

(declare-fun e!206333 () Bool)

(assert (=> b!336130 (= e!206333 (validKeyInArray!0 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336131 () Bool)

(declare-fun e!206328 () ListLongMap!3947)

(declare-fun call!26336 () ListLongMap!3947)

(declare-fun +!718 (ListLongMap!3947 tuple2!5032) ListLongMap!3947)

(assert (=> b!336131 (= e!206328 (+!718 call!26336 (tuple2!5033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26327 () Bool)

(declare-fun call!26331 () ListLongMap!3947)

(declare-fun call!26332 () ListLongMap!3947)

(assert (=> bm!26327 (= call!26331 call!26332)))

(declare-fun b!336132 () Bool)

(declare-fun e!206339 () ListLongMap!3947)

(declare-fun call!26334 () ListLongMap!3947)

(assert (=> b!336132 (= e!206339 call!26334)))

(declare-fun b!336133 () Bool)

(declare-fun e!206332 () Bool)

(assert (=> b!336133 (= e!206332 (validKeyInArray!0 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336134 () Bool)

(declare-fun e!206336 () Bool)

(declare-fun call!26335 () Bool)

(assert (=> b!336134 (= e!206336 (not call!26335))))

(declare-fun e!206334 () Bool)

(declare-fun lt!160145 () ListLongMap!3947)

(declare-fun b!336135 () Bool)

(declare-fun apply!267 (ListLongMap!3947 (_ BitVec 64)) V!10243)

(declare-fun get!4535 (ValueCell!3131 V!10243) V!10243)

(declare-fun dynLambda!610 (Int (_ BitVec 64)) V!10243)

(assert (=> b!336135 (= e!206334 (= (apply!267 lt!160145 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000)) (get!4535 (select (arr!8269 _values!1525) #b00000000000000000000000000000000) (dynLambda!610 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!336135 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8621 _values!1525)))))

(assert (=> b!336135 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(declare-fun b!336136 () Bool)

(declare-fun e!206337 () ListLongMap!3947)

(assert (=> b!336136 (= e!206328 e!206337)))

(declare-fun c!52228 () Bool)

(assert (=> b!336136 (= c!52228 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26328 () Bool)

(declare-fun call!26333 () ListLongMap!3947)

(assert (=> bm!26328 (= call!26333 call!26331)))

(declare-fun b!336137 () Bool)

(declare-fun res!185558 () Bool)

(declare-fun e!206338 () Bool)

(assert (=> b!336137 (=> (not res!185558) (not e!206338))))

(assert (=> b!336137 (= res!185558 e!206336)))

(declare-fun c!52230 () Bool)

(assert (=> b!336137 (= c!52230 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26329 () Bool)

(declare-fun call!26330 () Bool)

(assert (=> bm!26329 (= call!26330 (contains!2053 lt!160145 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!70715 () Bool)

(assert (=> d!70715 e!206338))

(declare-fun res!185556 () Bool)

(assert (=> d!70715 (=> (not res!185556) (not e!206338))))

(assert (=> d!70715 (= res!185556 (or (bvsge #b00000000000000000000000000000000 (size!8620 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))))

(declare-fun lt!160161 () ListLongMap!3947)

(assert (=> d!70715 (= lt!160145 lt!160161)))

(declare-fun lt!160160 () Unit!10429)

(declare-fun e!206327 () Unit!10429)

(assert (=> d!70715 (= lt!160160 e!206327)))

(declare-fun c!52231 () Bool)

(assert (=> d!70715 (= c!52231 e!206332)))

(declare-fun res!185560 () Bool)

(assert (=> d!70715 (=> (not res!185560) (not e!206332))))

(assert (=> d!70715 (= res!185560 (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(assert (=> d!70715 (= lt!160161 e!206328)))

(declare-fun c!52232 () Bool)

(assert (=> d!70715 (= c!52232 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70715 (validMask!0 mask!2385)))

(assert (=> d!70715 (= (getCurrentListMap!1518 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160145)))

(declare-fun b!336138 () Bool)

(declare-fun e!206335 () Bool)

(assert (=> b!336138 (= e!206335 (= (apply!267 lt!160145 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!336139 () Bool)

(declare-fun e!206329 () Bool)

(assert (=> b!336139 (= e!206338 e!206329)))

(declare-fun c!52229 () Bool)

(assert (=> b!336139 (= c!52229 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26330 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!583 (array!17478 array!17480 (_ BitVec 32) (_ BitVec 32) V!10243 V!10243 (_ BitVec 32) Int) ListLongMap!3947)

(assert (=> bm!26330 (= call!26332 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!336140 () Bool)

(declare-fun e!206330 () Bool)

(assert (=> b!336140 (= e!206330 e!206334)))

(declare-fun res!185557 () Bool)

(assert (=> b!336140 (=> (not res!185557) (not e!206334))))

(assert (=> b!336140 (= res!185557 (contains!2053 lt!160145 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!336140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(declare-fun b!336141 () Bool)

(declare-fun e!206331 () Bool)

(assert (=> b!336141 (= e!206329 e!206331)))

(declare-fun res!185562 () Bool)

(assert (=> b!336141 (= res!185562 call!26330)))

(assert (=> b!336141 (=> (not res!185562) (not e!206331))))

(declare-fun b!336142 () Bool)

(declare-fun res!185561 () Bool)

(assert (=> b!336142 (=> (not res!185561) (not e!206338))))

(assert (=> b!336142 (= res!185561 e!206330)))

(declare-fun res!185563 () Bool)

(assert (=> b!336142 (=> res!185563 e!206330)))

(assert (=> b!336142 (= res!185563 (not e!206333))))

(declare-fun res!185564 () Bool)

(assert (=> b!336142 (=> (not res!185564) (not e!206333))))

(assert (=> b!336142 (= res!185564 (bvslt #b00000000000000000000000000000000 (size!8620 _keys!1895)))))

(declare-fun b!336143 () Bool)

(declare-fun c!52227 () Bool)

(assert (=> b!336143 (= c!52227 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!336143 (= e!206337 e!206339)))

(declare-fun b!336144 () Bool)

(assert (=> b!336144 (= e!206337 call!26334)))

(declare-fun bm!26331 () Bool)

(assert (=> bm!26331 (= call!26336 (+!718 (ite c!52232 call!26332 (ite c!52228 call!26331 call!26333)) (ite (or c!52232 c!52228) (tuple2!5033 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!336145 () Bool)

(assert (=> b!336145 (= e!206339 call!26333)))

(declare-fun bm!26332 () Bool)

(assert (=> bm!26332 (= call!26334 call!26336)))

(declare-fun b!336146 () Bool)

(assert (=> b!336146 (= e!206336 e!206335)))

(declare-fun res!185559 () Bool)

(assert (=> b!336146 (= res!185559 call!26335)))

(assert (=> b!336146 (=> (not res!185559) (not e!206335))))

(declare-fun bm!26333 () Bool)

(assert (=> bm!26333 (= call!26335 (contains!2053 lt!160145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!336147 () Bool)

(assert (=> b!336147 (= e!206331 (= (apply!267 lt!160145 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!336148 () Bool)

(declare-fun lt!160164 () Unit!10429)

(assert (=> b!336148 (= e!206327 lt!160164)))

(declare-fun lt!160157 () ListLongMap!3947)

(assert (=> b!336148 (= lt!160157 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160151 () (_ BitVec 64))

(assert (=> b!336148 (= lt!160151 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160148 () (_ BitVec 64))

(assert (=> b!336148 (= lt!160148 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160159 () Unit!10429)

(declare-fun addStillContains!243 (ListLongMap!3947 (_ BitVec 64) V!10243 (_ BitVec 64)) Unit!10429)

(assert (=> b!336148 (= lt!160159 (addStillContains!243 lt!160157 lt!160151 zeroValue!1467 lt!160148))))

(assert (=> b!336148 (contains!2053 (+!718 lt!160157 (tuple2!5033 lt!160151 zeroValue!1467)) lt!160148)))

(declare-fun lt!160152 () Unit!10429)

(assert (=> b!336148 (= lt!160152 lt!160159)))

(declare-fun lt!160146 () ListLongMap!3947)

(assert (=> b!336148 (= lt!160146 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160150 () (_ BitVec 64))

(assert (=> b!336148 (= lt!160150 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160163 () (_ BitVec 64))

(assert (=> b!336148 (= lt!160163 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160162 () Unit!10429)

(declare-fun addApplyDifferent!243 (ListLongMap!3947 (_ BitVec 64) V!10243 (_ BitVec 64)) Unit!10429)

(assert (=> b!336148 (= lt!160162 (addApplyDifferent!243 lt!160146 lt!160150 minValue!1467 lt!160163))))

(assert (=> b!336148 (= (apply!267 (+!718 lt!160146 (tuple2!5033 lt!160150 minValue!1467)) lt!160163) (apply!267 lt!160146 lt!160163))))

(declare-fun lt!160144 () Unit!10429)

(assert (=> b!336148 (= lt!160144 lt!160162)))

(declare-fun lt!160154 () ListLongMap!3947)

(assert (=> b!336148 (= lt!160154 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160155 () (_ BitVec 64))

(assert (=> b!336148 (= lt!160155 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160149 () (_ BitVec 64))

(assert (=> b!336148 (= lt!160149 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160153 () Unit!10429)

(assert (=> b!336148 (= lt!160153 (addApplyDifferent!243 lt!160154 lt!160155 zeroValue!1467 lt!160149))))

(assert (=> b!336148 (= (apply!267 (+!718 lt!160154 (tuple2!5033 lt!160155 zeroValue!1467)) lt!160149) (apply!267 lt!160154 lt!160149))))

(declare-fun lt!160165 () Unit!10429)

(assert (=> b!336148 (= lt!160165 lt!160153)))

(declare-fun lt!160156 () ListLongMap!3947)

(assert (=> b!336148 (= lt!160156 (getCurrentListMapNoExtraKeys!583 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160147 () (_ BitVec 64))

(assert (=> b!336148 (= lt!160147 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160158 () (_ BitVec 64))

(assert (=> b!336148 (= lt!160158 (select (arr!8268 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!336148 (= lt!160164 (addApplyDifferent!243 lt!160156 lt!160147 minValue!1467 lt!160158))))

(assert (=> b!336148 (= (apply!267 (+!718 lt!160156 (tuple2!5033 lt!160147 minValue!1467)) lt!160158) (apply!267 lt!160156 lt!160158))))

(declare-fun b!336149 () Bool)

(assert (=> b!336149 (= e!206329 (not call!26330))))

(declare-fun b!336150 () Bool)

(declare-fun Unit!10432 () Unit!10429)

(assert (=> b!336150 (= e!206327 Unit!10432)))

(assert (= (and d!70715 c!52232) b!336131))

(assert (= (and d!70715 (not c!52232)) b!336136))

(assert (= (and b!336136 c!52228) b!336144))

(assert (= (and b!336136 (not c!52228)) b!336143))

(assert (= (and b!336143 c!52227) b!336132))

(assert (= (and b!336143 (not c!52227)) b!336145))

(assert (= (or b!336132 b!336145) bm!26328))

(assert (= (or b!336144 bm!26328) bm!26327))

(assert (= (or b!336144 b!336132) bm!26332))

(assert (= (or b!336131 bm!26327) bm!26330))

(assert (= (or b!336131 bm!26332) bm!26331))

(assert (= (and d!70715 res!185560) b!336133))

(assert (= (and d!70715 c!52231) b!336148))

(assert (= (and d!70715 (not c!52231)) b!336150))

(assert (= (and d!70715 res!185556) b!336142))

(assert (= (and b!336142 res!185564) b!336130))

(assert (= (and b!336142 (not res!185563)) b!336140))

(assert (= (and b!336140 res!185557) b!336135))

(assert (= (and b!336142 res!185561) b!336137))

(assert (= (and b!336137 c!52230) b!336146))

(assert (= (and b!336137 (not c!52230)) b!336134))

(assert (= (and b!336146 res!185559) b!336138))

(assert (= (or b!336146 b!336134) bm!26333))

(assert (= (and b!336137 res!185558) b!336139))

(assert (= (and b!336139 c!52229) b!336141))

(assert (= (and b!336139 (not c!52229)) b!336149))

(assert (= (and b!336141 res!185562) b!336147))

(assert (= (or b!336141 b!336149) bm!26329))

(declare-fun b_lambda!8429 () Bool)

(assert (=> (not b_lambda!8429) (not b!336135)))

(declare-fun t!9734 () Bool)

(declare-fun tb!3041 () Bool)

(assert (=> (and start!33766 (= defaultEntry!1528 defaultEntry!1528) t!9734) tb!3041))

(declare-fun result!5469 () Bool)

(assert (=> tb!3041 (= result!5469 tp_is_empty!6949)))

(assert (=> b!336135 t!9734))

(declare-fun b_and!14199 () Bool)

(assert (= b_and!14193 (and (=> t!9734 result!5469) b_and!14199)))

(assert (=> b!336140 m!340239))

(assert (=> b!336140 m!340239))

(declare-fun m!340263 () Bool)

(assert (=> b!336140 m!340263))

(declare-fun m!340265 () Bool)

(assert (=> bm!26333 m!340265))

(declare-fun m!340267 () Bool)

(assert (=> b!336138 m!340267))

(declare-fun m!340269 () Bool)

(assert (=> bm!26329 m!340269))

(declare-fun m!340271 () Bool)

(assert (=> bm!26330 m!340271))

(assert (=> b!336133 m!340239))

(assert (=> b!336133 m!340239))

(assert (=> b!336133 m!340241))

(declare-fun m!340273 () Bool)

(assert (=> b!336148 m!340273))

(assert (=> b!336148 m!340273))

(declare-fun m!340275 () Bool)

(assert (=> b!336148 m!340275))

(declare-fun m!340277 () Bool)

(assert (=> b!336148 m!340277))

(declare-fun m!340279 () Bool)

(assert (=> b!336148 m!340279))

(declare-fun m!340281 () Bool)

(assert (=> b!336148 m!340281))

(declare-fun m!340283 () Bool)

(assert (=> b!336148 m!340283))

(declare-fun m!340285 () Bool)

(assert (=> b!336148 m!340285))

(declare-fun m!340287 () Bool)

(assert (=> b!336148 m!340287))

(declare-fun m!340289 () Bool)

(assert (=> b!336148 m!340289))

(declare-fun m!340291 () Bool)

(assert (=> b!336148 m!340291))

(declare-fun m!340293 () Bool)

(assert (=> b!336148 m!340293))

(assert (=> b!336148 m!340281))

(assert (=> b!336148 m!340239))

(assert (=> b!336148 m!340291))

(declare-fun m!340295 () Bool)

(assert (=> b!336148 m!340295))

(assert (=> b!336148 m!340285))

(declare-fun m!340297 () Bool)

(assert (=> b!336148 m!340297))

(declare-fun m!340299 () Bool)

(assert (=> b!336148 m!340299))

(declare-fun m!340301 () Bool)

(assert (=> b!336148 m!340301))

(assert (=> b!336148 m!340271))

(assert (=> d!70715 m!340185))

(declare-fun m!340303 () Bool)

(assert (=> bm!26331 m!340303))

(assert (=> b!336130 m!340239))

(assert (=> b!336130 m!340239))

(assert (=> b!336130 m!340241))

(declare-fun m!340305 () Bool)

(assert (=> b!336147 m!340305))

(declare-fun m!340307 () Bool)

(assert (=> b!336131 m!340307))

(assert (=> b!336135 m!340239))

(assert (=> b!336135 m!340239))

(declare-fun m!340309 () Bool)

(assert (=> b!336135 m!340309))

(declare-fun m!340311 () Bool)

(assert (=> b!336135 m!340311))

(declare-fun m!340313 () Bool)

(assert (=> b!336135 m!340313))

(declare-fun m!340315 () Bool)

(assert (=> b!336135 m!340315))

(assert (=> b!336135 m!340311))

(assert (=> b!336135 m!340313))

(assert (=> b!335997 d!70715))

(declare-fun b!336165 () Bool)

(declare-fun e!206348 () SeekEntryResult!3162)

(declare-fun lt!160174 () SeekEntryResult!3162)

(assert (=> b!336165 (= e!206348 (MissingZero!3162 (index!14829 lt!160174)))))

(declare-fun d!70717 () Bool)

(declare-fun lt!160172 () SeekEntryResult!3162)

(assert (=> d!70717 (and (or ((_ is Undefined!3162) lt!160172) (not ((_ is Found!3162) lt!160172)) (and (bvsge (index!14828 lt!160172) #b00000000000000000000000000000000) (bvslt (index!14828 lt!160172) (size!8620 _keys!1895)))) (or ((_ is Undefined!3162) lt!160172) ((_ is Found!3162) lt!160172) (not ((_ is MissingZero!3162) lt!160172)) (and (bvsge (index!14827 lt!160172) #b00000000000000000000000000000000) (bvslt (index!14827 lt!160172) (size!8620 _keys!1895)))) (or ((_ is Undefined!3162) lt!160172) ((_ is Found!3162) lt!160172) ((_ is MissingZero!3162) lt!160172) (not ((_ is MissingVacant!3162) lt!160172)) (and (bvsge (index!14830 lt!160172) #b00000000000000000000000000000000) (bvslt (index!14830 lt!160172) (size!8620 _keys!1895)))) (or ((_ is Undefined!3162) lt!160172) (ite ((_ is Found!3162) lt!160172) (= (select (arr!8268 _keys!1895) (index!14828 lt!160172)) k0!1348) (ite ((_ is MissingZero!3162) lt!160172) (= (select (arr!8268 _keys!1895) (index!14827 lt!160172)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3162) lt!160172) (= (select (arr!8268 _keys!1895) (index!14830 lt!160172)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!206347 () SeekEntryResult!3162)

(assert (=> d!70717 (= lt!160172 e!206347)))

(declare-fun c!52240 () Bool)

(assert (=> d!70717 (= c!52240 (and ((_ is Intermediate!3162) lt!160174) (undefined!3974 lt!160174)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17478 (_ BitVec 32)) SeekEntryResult!3162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70717 (= lt!160174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70717 (validMask!0 mask!2385)))

(assert (=> d!70717 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160172)))

(declare-fun b!336166 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17478 (_ BitVec 32)) SeekEntryResult!3162)

(assert (=> b!336166 (= e!206348 (seekKeyOrZeroReturnVacant!0 (x!33455 lt!160174) (index!14829 lt!160174) (index!14829 lt!160174) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!336167 () Bool)

(assert (=> b!336167 (= e!206347 Undefined!3162)))

(declare-fun b!336168 () Bool)

(declare-fun c!52241 () Bool)

(declare-fun lt!160173 () (_ BitVec 64))

(assert (=> b!336168 (= c!52241 (= lt!160173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!206346 () SeekEntryResult!3162)

(assert (=> b!336168 (= e!206346 e!206348)))

(declare-fun b!336169 () Bool)

(assert (=> b!336169 (= e!206346 (Found!3162 (index!14829 lt!160174)))))

(declare-fun b!336170 () Bool)

(assert (=> b!336170 (= e!206347 e!206346)))

(assert (=> b!336170 (= lt!160173 (select (arr!8268 _keys!1895) (index!14829 lt!160174)))))

(declare-fun c!52239 () Bool)

(assert (=> b!336170 (= c!52239 (= lt!160173 k0!1348))))

(assert (= (and d!70717 c!52240) b!336167))

(assert (= (and d!70717 (not c!52240)) b!336170))

(assert (= (and b!336170 c!52239) b!336169))

(assert (= (and b!336170 (not c!52239)) b!336168))

(assert (= (and b!336168 c!52241) b!336165))

(assert (= (and b!336168 (not c!52241)) b!336166))

(assert (=> d!70717 m!340185))

(declare-fun m!340317 () Bool)

(assert (=> d!70717 m!340317))

(declare-fun m!340319 () Bool)

(assert (=> d!70717 m!340319))

(declare-fun m!340321 () Bool)

(assert (=> d!70717 m!340321))

(declare-fun m!340323 () Bool)

(assert (=> d!70717 m!340323))

(assert (=> d!70717 m!340317))

(declare-fun m!340325 () Bool)

(assert (=> d!70717 m!340325))

(declare-fun m!340327 () Bool)

(assert (=> b!336166 m!340327))

(declare-fun m!340329 () Bool)

(assert (=> b!336170 m!340329))

(assert (=> b!335989 d!70717))

(declare-fun mapNonEmpty!11832 () Bool)

(declare-fun mapRes!11832 () Bool)

(declare-fun tp!24513 () Bool)

(declare-fun e!206354 () Bool)

(assert (=> mapNonEmpty!11832 (= mapRes!11832 (and tp!24513 e!206354))))

(declare-fun mapKey!11832 () (_ BitVec 32))

(declare-fun mapRest!11832 () (Array (_ BitVec 32) ValueCell!3131))

(declare-fun mapValue!11832 () ValueCell!3131)

(assert (=> mapNonEmpty!11832 (= mapRest!11823 (store mapRest!11832 mapKey!11832 mapValue!11832))))

(declare-fun condMapEmpty!11832 () Bool)

(declare-fun mapDefault!11832 () ValueCell!3131)

(assert (=> mapNonEmpty!11823 (= condMapEmpty!11832 (= mapRest!11823 ((as const (Array (_ BitVec 32) ValueCell!3131)) mapDefault!11832)))))

(declare-fun e!206353 () Bool)

(assert (=> mapNonEmpty!11823 (= tp!24497 (and e!206353 mapRes!11832))))

(declare-fun b!336178 () Bool)

(assert (=> b!336178 (= e!206353 tp_is_empty!6949)))

(declare-fun mapIsEmpty!11832 () Bool)

(assert (=> mapIsEmpty!11832 mapRes!11832))

(declare-fun b!336177 () Bool)

(assert (=> b!336177 (= e!206354 tp_is_empty!6949)))

(assert (= (and mapNonEmpty!11823 condMapEmpty!11832) mapIsEmpty!11832))

(assert (= (and mapNonEmpty!11823 (not condMapEmpty!11832)) mapNonEmpty!11832))

(assert (= (and mapNonEmpty!11832 ((_ is ValueCellFull!3131) mapValue!11832)) b!336177))

(assert (= (and mapNonEmpty!11823 ((_ is ValueCellFull!3131) mapDefault!11832)) b!336178))

(declare-fun m!340331 () Bool)

(assert (=> mapNonEmpty!11832 m!340331))

(declare-fun b_lambda!8431 () Bool)

(assert (= b_lambda!8429 (or (and start!33766 b_free!6997) b_lambda!8431)))

(check-sat (not mapNonEmpty!11832) (not b_next!6997) (not bm!26312) (not b!336074) (not b!336133) (not b!336166) (not b!336077) tp_is_empty!6949 (not d!70715) (not b!336138) (not b!336085) (not b!336148) (not b!336060) (not bm!26329) (not b_lambda!8431) (not d!70717) (not b!336075) (not bm!26309) (not b!336140) (not bm!26333) (not b!336130) (not bm!26330) (not d!70713) (not bm!26331) (not b!336131) (not b!336087) b_and!14199 (not b!336135) (not b!336061) (not b!336147))
(check-sat b_and!14199 (not b_next!6997))
