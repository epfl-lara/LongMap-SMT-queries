; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19138 () Bool)

(assert start!19138)

(declare-fun b!188120 () Bool)

(declare-fun b_free!4621 () Bool)

(declare-fun b_next!4621 () Bool)

(assert (=> b!188120 (= b_free!4621 (not b_next!4621))))

(declare-fun tp!16684 () Bool)

(declare-fun b_and!11225 () Bool)

(assert (=> b!188120 (= tp!16684 b_and!11225)))

(declare-fun res!88900 () Bool)

(declare-fun e!123788 () Bool)

(assert (=> start!19138 (=> (not res!88900) (not e!123788))))

(declare-datatypes ((V!5505 0))(
  ( (V!5506 (val!2241 Int)) )
))
(declare-datatypes ((ValueCell!1853 0))(
  ( (ValueCellFull!1853 (v!4152 V!5505)) (EmptyCell!1853) )
))
(declare-datatypes ((array!7987 0))(
  ( (array!7988 (arr!3766 (Array (_ BitVec 32) (_ BitVec 64))) (size!4087 (_ BitVec 32))) )
))
(declare-datatypes ((array!7989 0))(
  ( (array!7990 (arr!3767 (Array (_ BitVec 32) ValueCell!1853)) (size!4088 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2614 0))(
  ( (LongMapFixedSize!2615 (defaultEntry!3839 Int) (mask!9001 (_ BitVec 32)) (extraKeys!3576 (_ BitVec 32)) (zeroValue!3680 V!5505) (minValue!3680 V!5505) (_size!1356 (_ BitVec 32)) (_keys!5797 array!7987) (_values!3822 array!7989) (_vacant!1356 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2614)

(declare-fun valid!1094 (LongMapFixedSize!2614) Bool)

(assert (=> start!19138 (= res!88900 (valid!1094 thiss!1248))))

(assert (=> start!19138 e!123788))

(declare-fun e!123793 () Bool)

(assert (=> start!19138 e!123793))

(assert (=> start!19138 true))

(declare-fun b!188111 () Bool)

(declare-fun e!123789 () Bool)

(assert (=> b!188111 (= e!123788 e!123789)))

(declare-fun res!88899 () Bool)

(assert (=> b!188111 (=> (not res!88899) (not e!123789))))

(declare-datatypes ((SeekEntryResult!656 0))(
  ( (MissingZero!656 (index!4794 (_ BitVec 32))) (Found!656 (index!4795 (_ BitVec 32))) (Intermediate!656 (undefined!1468 Bool) (index!4796 (_ BitVec 32)) (x!20341 (_ BitVec 32))) (Undefined!656) (MissingVacant!656 (index!4797 (_ BitVec 32))) )
))
(declare-fun lt!92989 () SeekEntryResult!656)

(get-info :version)

(assert (=> b!188111 (= res!88899 (and (not ((_ is Undefined!656) lt!92989)) (not ((_ is MissingVacant!656) lt!92989)) (not ((_ is MissingZero!656) lt!92989)) ((_ is Found!656) lt!92989)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7987 (_ BitVec 32)) SeekEntryResult!656)

(assert (=> b!188111 (= lt!92989 (seekEntryOrOpen!0 key!828 (_keys!5797 thiss!1248) (mask!9001 thiss!1248)))))

(declare-fun b!188112 () Bool)

(declare-fun e!123794 () Bool)

(assert (=> b!188112 (= e!123789 e!123794)))

(declare-fun res!88902 () Bool)

(assert (=> b!188112 (=> (not res!88902) (not e!123794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188112 (= res!88902 (validMask!0 (mask!9001 thiss!1248)))))

(declare-datatypes ((Unit!5639 0))(
  ( (Unit!5640) )
))
(declare-fun lt!92992 () Unit!5639)

(declare-fun e!123792 () Unit!5639)

(assert (=> b!188112 (= lt!92992 e!123792)))

(declare-fun c!33813 () Bool)

(declare-datatypes ((tuple2!3450 0))(
  ( (tuple2!3451 (_1!1736 (_ BitVec 64)) (_2!1736 V!5505)) )
))
(declare-datatypes ((List!2376 0))(
  ( (Nil!2373) (Cons!2372 (h!3009 tuple2!3450) (t!7263 List!2376)) )
))
(declare-datatypes ((ListLongMap!2359 0))(
  ( (ListLongMap!2360 (toList!1195 List!2376)) )
))
(declare-fun contains!1305 (ListLongMap!2359 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!828 (array!7987 array!7989 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 32) Int) ListLongMap!2359)

(assert (=> b!188112 (= c!33813 (contains!1305 (getCurrentListMap!828 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)) key!828))))

(declare-fun b!188113 () Bool)

(declare-fun lt!92990 () Unit!5639)

(assert (=> b!188113 (= e!123792 lt!92990)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!153 (array!7987 array!7989 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5639)

(assert (=> b!188113 (= lt!92990 (lemmaInListMapThenSeekEntryOrOpenFindsIt!153 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(declare-fun res!88901 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!188113 (= res!88901 (inRange!0 (index!4795 lt!92989) (mask!9001 thiss!1248)))))

(declare-fun e!123790 () Bool)

(assert (=> b!188113 (=> (not res!88901) (not e!123790))))

(assert (=> b!188113 e!123790))

(declare-fun b!188114 () Bool)

(declare-fun Unit!5641 () Unit!5639)

(assert (=> b!188114 (= e!123792 Unit!5641)))

(declare-fun lt!92991 () Unit!5639)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!151 (array!7987 array!7989 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5639)

(assert (=> b!188114 (= lt!92991 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!151 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(assert (=> b!188114 false))

(declare-fun mapNonEmpty!7573 () Bool)

(declare-fun mapRes!7573 () Bool)

(declare-fun tp!16683 () Bool)

(declare-fun e!123787 () Bool)

(assert (=> mapNonEmpty!7573 (= mapRes!7573 (and tp!16683 e!123787))))

(declare-fun mapValue!7573 () ValueCell!1853)

(declare-fun mapKey!7573 () (_ BitVec 32))

(declare-fun mapRest!7573 () (Array (_ BitVec 32) ValueCell!1853))

(assert (=> mapNonEmpty!7573 (= (arr!3767 (_values!3822 thiss!1248)) (store mapRest!7573 mapKey!7573 mapValue!7573))))

(declare-fun b!188115 () Bool)

(declare-fun e!123795 () Bool)

(declare-fun e!123796 () Bool)

(assert (=> b!188115 (= e!123795 (and e!123796 mapRes!7573))))

(declare-fun condMapEmpty!7573 () Bool)

(declare-fun mapDefault!7573 () ValueCell!1853)

(assert (=> b!188115 (= condMapEmpty!7573 (= (arr!3767 (_values!3822 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1853)) mapDefault!7573)))))

(declare-fun b!188116 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7987 (_ BitVec 32)) Bool)

(assert (=> b!188116 (= e!123794 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5797 thiss!1248) (mask!9001 thiss!1248))))))

(declare-fun b!188117 () Bool)

(declare-fun res!88904 () Bool)

(assert (=> b!188117 (=> (not res!88904) (not e!123794))))

(assert (=> b!188117 (= res!88904 (and (= (size!4088 (_values!3822 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9001 thiss!1248))) (= (size!4087 (_keys!5797 thiss!1248)) (size!4088 (_values!3822 thiss!1248))) (bvsge (mask!9001 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3576 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3576 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188118 () Bool)

(declare-fun tp_is_empty!4393 () Bool)

(assert (=> b!188118 (= e!123796 tp_is_empty!4393)))

(declare-fun b!188119 () Bool)

(declare-fun res!88903 () Bool)

(assert (=> b!188119 (=> (not res!88903) (not e!123788))))

(assert (=> b!188119 (= res!88903 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7573 () Bool)

(assert (=> mapIsEmpty!7573 mapRes!7573))

(declare-fun array_inv!2435 (array!7987) Bool)

(declare-fun array_inv!2436 (array!7989) Bool)

(assert (=> b!188120 (= e!123793 (and tp!16684 tp_is_empty!4393 (array_inv!2435 (_keys!5797 thiss!1248)) (array_inv!2436 (_values!3822 thiss!1248)) e!123795))))

(declare-fun b!188121 () Bool)

(assert (=> b!188121 (= e!123787 tp_is_empty!4393)))

(declare-fun b!188122 () Bool)

(assert (=> b!188122 (= e!123790 (= (select (arr!3766 (_keys!5797 thiss!1248)) (index!4795 lt!92989)) key!828))))

(assert (= (and start!19138 res!88900) b!188119))

(assert (= (and b!188119 res!88903) b!188111))

(assert (= (and b!188111 res!88899) b!188112))

(assert (= (and b!188112 c!33813) b!188113))

(assert (= (and b!188112 (not c!33813)) b!188114))

(assert (= (and b!188113 res!88901) b!188122))

(assert (= (and b!188112 res!88902) b!188117))

(assert (= (and b!188117 res!88904) b!188116))

(assert (= (and b!188115 condMapEmpty!7573) mapIsEmpty!7573))

(assert (= (and b!188115 (not condMapEmpty!7573)) mapNonEmpty!7573))

(assert (= (and mapNonEmpty!7573 ((_ is ValueCellFull!1853) mapValue!7573)) b!188121))

(assert (= (and b!188115 ((_ is ValueCellFull!1853) mapDefault!7573)) b!188118))

(assert (= b!188120 b!188115))

(assert (= start!19138 b!188120))

(declare-fun m!214345 () Bool)

(assert (=> b!188113 m!214345))

(declare-fun m!214347 () Bool)

(assert (=> b!188113 m!214347))

(declare-fun m!214349 () Bool)

(assert (=> start!19138 m!214349))

(declare-fun m!214351 () Bool)

(assert (=> b!188116 m!214351))

(declare-fun m!214353 () Bool)

(assert (=> b!188122 m!214353))

(declare-fun m!214355 () Bool)

(assert (=> b!188111 m!214355))

(declare-fun m!214357 () Bool)

(assert (=> b!188112 m!214357))

(declare-fun m!214359 () Bool)

(assert (=> b!188112 m!214359))

(assert (=> b!188112 m!214359))

(declare-fun m!214361 () Bool)

(assert (=> b!188112 m!214361))

(declare-fun m!214363 () Bool)

(assert (=> mapNonEmpty!7573 m!214363))

(declare-fun m!214365 () Bool)

(assert (=> b!188114 m!214365))

(declare-fun m!214367 () Bool)

(assert (=> b!188120 m!214367))

(declare-fun m!214369 () Bool)

(assert (=> b!188120 m!214369))

(check-sat (not b!188112) (not mapNonEmpty!7573) (not b!188111) (not b!188120) (not b!188113) b_and!11225 (not start!19138) (not b!188116) tp_is_empty!4393 (not b_next!4621) (not b!188114))
(check-sat b_and!11225 (not b_next!4621))
(get-model)

(declare-fun d!55463 () Bool)

(declare-fun e!123859 () Bool)

(assert (=> d!55463 e!123859))

(declare-fun res!88945 () Bool)

(assert (=> d!55463 (=> (not res!88945) (not e!123859))))

(declare-fun lt!93022 () SeekEntryResult!656)

(assert (=> d!55463 (= res!88945 ((_ is Found!656) lt!93022))))

(assert (=> d!55463 (= lt!93022 (seekEntryOrOpen!0 key!828 (_keys!5797 thiss!1248) (mask!9001 thiss!1248)))))

(declare-fun lt!93021 () Unit!5639)

(declare-fun choose!1013 (array!7987 array!7989 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5639)

(assert (=> d!55463 (= lt!93021 (choose!1013 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(assert (=> d!55463 (validMask!0 (mask!9001 thiss!1248))))

(assert (=> d!55463 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!153 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)) lt!93021)))

(declare-fun b!188199 () Bool)

(declare-fun res!88946 () Bool)

(assert (=> b!188199 (=> (not res!88946) (not e!123859))))

(assert (=> b!188199 (= res!88946 (inRange!0 (index!4795 lt!93022) (mask!9001 thiss!1248)))))

(declare-fun b!188200 () Bool)

(assert (=> b!188200 (= e!123859 (= (select (arr!3766 (_keys!5797 thiss!1248)) (index!4795 lt!93022)) key!828))))

(assert (=> b!188200 (and (bvsge (index!4795 lt!93022) #b00000000000000000000000000000000) (bvslt (index!4795 lt!93022) (size!4087 (_keys!5797 thiss!1248))))))

(assert (= (and d!55463 res!88945) b!188199))

(assert (= (and b!188199 res!88946) b!188200))

(assert (=> d!55463 m!214355))

(declare-fun m!214423 () Bool)

(assert (=> d!55463 m!214423))

(assert (=> d!55463 m!214357))

(declare-fun m!214425 () Bool)

(assert (=> b!188199 m!214425))

(declare-fun m!214427 () Bool)

(assert (=> b!188200 m!214427))

(assert (=> b!188113 d!55463))

(declare-fun d!55465 () Bool)

(assert (=> d!55465 (= (inRange!0 (index!4795 lt!92989) (mask!9001 thiss!1248)) (and (bvsge (index!4795 lt!92989) #b00000000000000000000000000000000) (bvslt (index!4795 lt!92989) (bvadd (mask!9001 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!188113 d!55465))

(declare-fun d!55467 () Bool)

(assert (=> d!55467 (= (validMask!0 (mask!9001 thiss!1248)) (and (or (= (mask!9001 thiss!1248) #b00000000000000000000000000000111) (= (mask!9001 thiss!1248) #b00000000000000000000000000001111) (= (mask!9001 thiss!1248) #b00000000000000000000000000011111) (= (mask!9001 thiss!1248) #b00000000000000000000000000111111) (= (mask!9001 thiss!1248) #b00000000000000000000000001111111) (= (mask!9001 thiss!1248) #b00000000000000000000000011111111) (= (mask!9001 thiss!1248) #b00000000000000000000000111111111) (= (mask!9001 thiss!1248) #b00000000000000000000001111111111) (= (mask!9001 thiss!1248) #b00000000000000000000011111111111) (= (mask!9001 thiss!1248) #b00000000000000000000111111111111) (= (mask!9001 thiss!1248) #b00000000000000000001111111111111) (= (mask!9001 thiss!1248) #b00000000000000000011111111111111) (= (mask!9001 thiss!1248) #b00000000000000000111111111111111) (= (mask!9001 thiss!1248) #b00000000000000001111111111111111) (= (mask!9001 thiss!1248) #b00000000000000011111111111111111) (= (mask!9001 thiss!1248) #b00000000000000111111111111111111) (= (mask!9001 thiss!1248) #b00000000000001111111111111111111) (= (mask!9001 thiss!1248) #b00000000000011111111111111111111) (= (mask!9001 thiss!1248) #b00000000000111111111111111111111) (= (mask!9001 thiss!1248) #b00000000001111111111111111111111) (= (mask!9001 thiss!1248) #b00000000011111111111111111111111) (= (mask!9001 thiss!1248) #b00000000111111111111111111111111) (= (mask!9001 thiss!1248) #b00000001111111111111111111111111) (= (mask!9001 thiss!1248) #b00000011111111111111111111111111) (= (mask!9001 thiss!1248) #b00000111111111111111111111111111) (= (mask!9001 thiss!1248) #b00001111111111111111111111111111) (= (mask!9001 thiss!1248) #b00011111111111111111111111111111) (= (mask!9001 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9001 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!188112 d!55467))

(declare-fun d!55469 () Bool)

(declare-fun e!123864 () Bool)

(assert (=> d!55469 e!123864))

(declare-fun res!88949 () Bool)

(assert (=> d!55469 (=> res!88949 e!123864)))

(declare-fun lt!93034 () Bool)

(assert (=> d!55469 (= res!88949 (not lt!93034))))

(declare-fun lt!93032 () Bool)

(assert (=> d!55469 (= lt!93034 lt!93032)))

(declare-fun lt!93033 () Unit!5639)

(declare-fun e!123865 () Unit!5639)

(assert (=> d!55469 (= lt!93033 e!123865)))

(declare-fun c!33822 () Bool)

(assert (=> d!55469 (= c!33822 lt!93032)))

(declare-fun containsKey!232 (List!2376 (_ BitVec 64)) Bool)

(assert (=> d!55469 (= lt!93032 (containsKey!232 (toList!1195 (getCurrentListMap!828 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248))) key!828))))

(assert (=> d!55469 (= (contains!1305 (getCurrentListMap!828 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)) key!828) lt!93034)))

(declare-fun b!188207 () Bool)

(declare-fun lt!93031 () Unit!5639)

(assert (=> b!188207 (= e!123865 lt!93031)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!181 (List!2376 (_ BitVec 64)) Unit!5639)

(assert (=> b!188207 (= lt!93031 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1195 (getCurrentListMap!828 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248))) key!828))))

(declare-datatypes ((Option!234 0))(
  ( (Some!233 (v!4155 V!5505)) (None!232) )
))
(declare-fun isDefined!182 (Option!234) Bool)

(declare-fun getValueByKey!228 (List!2376 (_ BitVec 64)) Option!234)

(assert (=> b!188207 (isDefined!182 (getValueByKey!228 (toList!1195 (getCurrentListMap!828 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248))) key!828))))

(declare-fun b!188208 () Bool)

(declare-fun Unit!5642 () Unit!5639)

(assert (=> b!188208 (= e!123865 Unit!5642)))

(declare-fun b!188209 () Bool)

(assert (=> b!188209 (= e!123864 (isDefined!182 (getValueByKey!228 (toList!1195 (getCurrentListMap!828 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248))) key!828)))))

(assert (= (and d!55469 c!33822) b!188207))

(assert (= (and d!55469 (not c!33822)) b!188208))

(assert (= (and d!55469 (not res!88949)) b!188209))

(declare-fun m!214429 () Bool)

(assert (=> d!55469 m!214429))

(declare-fun m!214431 () Bool)

(assert (=> b!188207 m!214431))

(declare-fun m!214433 () Bool)

(assert (=> b!188207 m!214433))

(assert (=> b!188207 m!214433))

(declare-fun m!214435 () Bool)

(assert (=> b!188207 m!214435))

(assert (=> b!188209 m!214433))

(assert (=> b!188209 m!214433))

(assert (=> b!188209 m!214435))

(assert (=> b!188112 d!55469))

(declare-fun b!188252 () Bool)

(declare-fun e!123893 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188252 (= e!123893 (validKeyInArray!0 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18962 () Bool)

(declare-fun call!18964 () Bool)

(declare-fun lt!93093 () ListLongMap!2359)

(assert (=> bm!18962 (= call!18964 (contains!1305 lt!93093 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18963 () Bool)

(declare-fun call!18966 () ListLongMap!2359)

(declare-fun call!18967 () ListLongMap!2359)

(assert (=> bm!18963 (= call!18966 call!18967)))

(declare-fun b!188253 () Bool)

(declare-fun e!123904 () ListLongMap!2359)

(declare-fun e!123899 () ListLongMap!2359)

(assert (=> b!188253 (= e!123904 e!123899)))

(declare-fun c!33836 () Bool)

(assert (=> b!188253 (= c!33836 (and (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18964 () Bool)

(declare-fun call!18965 () ListLongMap!2359)

(declare-fun getCurrentListMapNoExtraKeys!194 (array!7987 array!7989 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 32) Int) ListLongMap!2359)

(assert (=> bm!18964 (= call!18965 (getCurrentListMapNoExtraKeys!194 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun b!188254 () Bool)

(declare-fun e!123896 () Unit!5639)

(declare-fun Unit!5643 () Unit!5639)

(assert (=> b!188254 (= e!123896 Unit!5643)))

(declare-fun b!188255 () Bool)

(declare-fun e!123898 () Bool)

(declare-fun apply!173 (ListLongMap!2359 (_ BitVec 64)) V!5505)

(declare-fun get!2172 (ValueCell!1853 V!5505) V!5505)

(declare-fun dynLambda!507 (Int (_ BitVec 64)) V!5505)

(assert (=> b!188255 (= e!123898 (= (apply!173 lt!93093 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000)) (get!2172 (select (arr!3767 (_values!3822 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!507 (defaultEntry!3839 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4088 (_values!3822 thiss!1248))))))

(assert (=> b!188255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4087 (_keys!5797 thiss!1248))))))

(declare-fun b!188256 () Bool)

(declare-fun e!123895 () Bool)

(assert (=> b!188256 (= e!123895 e!123898)))

(declare-fun res!88976 () Bool)

(assert (=> b!188256 (=> (not res!88976) (not e!123898))))

(assert (=> b!188256 (= res!88976 (contains!1305 lt!93093 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4087 (_keys!5797 thiss!1248))))))

(declare-fun b!188257 () Bool)

(declare-fun e!123892 () Bool)

(declare-fun e!123901 () Bool)

(assert (=> b!188257 (= e!123892 e!123901)))

(declare-fun res!88975 () Bool)

(assert (=> b!188257 (= res!88975 call!18964)))

(assert (=> b!188257 (=> (not res!88975) (not e!123901))))

(declare-fun b!188258 () Bool)

(declare-fun call!18969 () ListLongMap!2359)

(declare-fun +!290 (ListLongMap!2359 tuple2!3450) ListLongMap!2359)

(assert (=> b!188258 (= e!123904 (+!290 call!18969 (tuple2!3451 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3680 thiss!1248))))))

(declare-fun b!188259 () Bool)

(declare-fun lt!93100 () Unit!5639)

(assert (=> b!188259 (= e!123896 lt!93100)))

(declare-fun lt!93089 () ListLongMap!2359)

(assert (=> b!188259 (= lt!93089 (getCurrentListMapNoExtraKeys!194 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun lt!93099 () (_ BitVec 64))

(assert (=> b!188259 (= lt!93099 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93088 () (_ BitVec 64))

(assert (=> b!188259 (= lt!93088 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93090 () Unit!5639)

(declare-fun addStillContains!149 (ListLongMap!2359 (_ BitVec 64) V!5505 (_ BitVec 64)) Unit!5639)

(assert (=> b!188259 (= lt!93090 (addStillContains!149 lt!93089 lt!93099 (zeroValue!3680 thiss!1248) lt!93088))))

(assert (=> b!188259 (contains!1305 (+!290 lt!93089 (tuple2!3451 lt!93099 (zeroValue!3680 thiss!1248))) lt!93088)))

(declare-fun lt!93097 () Unit!5639)

(assert (=> b!188259 (= lt!93097 lt!93090)))

(declare-fun lt!93096 () ListLongMap!2359)

(assert (=> b!188259 (= lt!93096 (getCurrentListMapNoExtraKeys!194 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun lt!93082 () (_ BitVec 64))

(assert (=> b!188259 (= lt!93082 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93079 () (_ BitVec 64))

(assert (=> b!188259 (= lt!93079 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93095 () Unit!5639)

(declare-fun addApplyDifferent!149 (ListLongMap!2359 (_ BitVec 64) V!5505 (_ BitVec 64)) Unit!5639)

(assert (=> b!188259 (= lt!93095 (addApplyDifferent!149 lt!93096 lt!93082 (minValue!3680 thiss!1248) lt!93079))))

(assert (=> b!188259 (= (apply!173 (+!290 lt!93096 (tuple2!3451 lt!93082 (minValue!3680 thiss!1248))) lt!93079) (apply!173 lt!93096 lt!93079))))

(declare-fun lt!93083 () Unit!5639)

(assert (=> b!188259 (= lt!93083 lt!93095)))

(declare-fun lt!93094 () ListLongMap!2359)

(assert (=> b!188259 (= lt!93094 (getCurrentListMapNoExtraKeys!194 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun lt!93091 () (_ BitVec 64))

(assert (=> b!188259 (= lt!93091 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93081 () (_ BitVec 64))

(assert (=> b!188259 (= lt!93081 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93084 () Unit!5639)

(assert (=> b!188259 (= lt!93084 (addApplyDifferent!149 lt!93094 lt!93091 (zeroValue!3680 thiss!1248) lt!93081))))

(assert (=> b!188259 (= (apply!173 (+!290 lt!93094 (tuple2!3451 lt!93091 (zeroValue!3680 thiss!1248))) lt!93081) (apply!173 lt!93094 lt!93081))))

(declare-fun lt!93092 () Unit!5639)

(assert (=> b!188259 (= lt!93092 lt!93084)))

(declare-fun lt!93085 () ListLongMap!2359)

(assert (=> b!188259 (= lt!93085 (getCurrentListMapNoExtraKeys!194 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)))))

(declare-fun lt!93098 () (_ BitVec 64))

(assert (=> b!188259 (= lt!93098 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93086 () (_ BitVec 64))

(assert (=> b!188259 (= lt!93086 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188259 (= lt!93100 (addApplyDifferent!149 lt!93085 lt!93098 (minValue!3680 thiss!1248) lt!93086))))

(assert (=> b!188259 (= (apply!173 (+!290 lt!93085 (tuple2!3451 lt!93098 (minValue!3680 thiss!1248))) lt!93086) (apply!173 lt!93085 lt!93086))))

(declare-fun bm!18965 () Bool)

(declare-fun call!18968 () ListLongMap!2359)

(assert (=> bm!18965 (= call!18968 call!18969)))

(declare-fun b!188260 () Bool)

(declare-fun e!123900 () Bool)

(declare-fun call!18970 () Bool)

(assert (=> b!188260 (= e!123900 (not call!18970))))

(declare-fun b!188261 () Bool)

(declare-fun e!123902 () Bool)

(assert (=> b!188261 (= e!123902 e!123892)))

(declare-fun c!33835 () Bool)

(assert (=> b!188261 (= c!33835 (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!33838 () Bool)

(declare-fun bm!18966 () Bool)

(assert (=> bm!18966 (= call!18969 (+!290 (ite c!33838 call!18965 (ite c!33836 call!18967 call!18966)) (ite (or c!33838 c!33836) (tuple2!3451 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3680 thiss!1248)) (tuple2!3451 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3680 thiss!1248)))))))

(declare-fun b!188262 () Bool)

(declare-fun e!123894 () Bool)

(assert (=> b!188262 (= e!123894 (validKeyInArray!0 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188263 () Bool)

(declare-fun e!123903 () ListLongMap!2359)

(assert (=> b!188263 (= e!123903 call!18966)))

(declare-fun b!188264 () Bool)

(assert (=> b!188264 (= e!123903 call!18968)))

(declare-fun d!55471 () Bool)

(assert (=> d!55471 e!123902))

(declare-fun res!88969 () Bool)

(assert (=> d!55471 (=> (not res!88969) (not e!123902))))

(assert (=> d!55471 (= res!88969 (or (bvsge #b00000000000000000000000000000000 (size!4087 (_keys!5797 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4087 (_keys!5797 thiss!1248))))))))

(declare-fun lt!93080 () ListLongMap!2359)

(assert (=> d!55471 (= lt!93093 lt!93080)))

(declare-fun lt!93087 () Unit!5639)

(assert (=> d!55471 (= lt!93087 e!123896)))

(declare-fun c!33837 () Bool)

(assert (=> d!55471 (= c!33837 e!123893)))

(declare-fun res!88974 () Bool)

(assert (=> d!55471 (=> (not res!88974) (not e!123893))))

(assert (=> d!55471 (= res!88974 (bvslt #b00000000000000000000000000000000 (size!4087 (_keys!5797 thiss!1248))))))

(assert (=> d!55471 (= lt!93080 e!123904)))

(assert (=> d!55471 (= c!33838 (and (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55471 (validMask!0 (mask!9001 thiss!1248))))

(assert (=> d!55471 (= (getCurrentListMap!828 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3839 thiss!1248)) lt!93093)))

(declare-fun bm!18961 () Bool)

(assert (=> bm!18961 (= call!18967 call!18965)))

(declare-fun b!188265 () Bool)

(declare-fun res!88971 () Bool)

(assert (=> b!188265 (=> (not res!88971) (not e!123902))))

(assert (=> b!188265 (= res!88971 e!123900)))

(declare-fun c!33840 () Bool)

(assert (=> b!188265 (= c!33840 (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!188266 () Bool)

(assert (=> b!188266 (= e!123901 (= (apply!173 lt!93093 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3680 thiss!1248)))))

(declare-fun b!188267 () Bool)

(assert (=> b!188267 (= e!123899 call!18968)))

(declare-fun bm!18967 () Bool)

(assert (=> bm!18967 (= call!18970 (contains!1305 lt!93093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188268 () Bool)

(declare-fun e!123897 () Bool)

(assert (=> b!188268 (= e!123897 (= (apply!173 lt!93093 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3680 thiss!1248)))))

(declare-fun b!188269 () Bool)

(declare-fun res!88972 () Bool)

(assert (=> b!188269 (=> (not res!88972) (not e!123902))))

(assert (=> b!188269 (= res!88972 e!123895)))

(declare-fun res!88970 () Bool)

(assert (=> b!188269 (=> res!88970 e!123895)))

(assert (=> b!188269 (= res!88970 (not e!123894))))

(declare-fun res!88973 () Bool)

(assert (=> b!188269 (=> (not res!88973) (not e!123894))))

(assert (=> b!188269 (= res!88973 (bvslt #b00000000000000000000000000000000 (size!4087 (_keys!5797 thiss!1248))))))

(declare-fun b!188270 () Bool)

(assert (=> b!188270 (= e!123900 e!123897)))

(declare-fun res!88968 () Bool)

(assert (=> b!188270 (= res!88968 call!18970)))

(assert (=> b!188270 (=> (not res!88968) (not e!123897))))

(declare-fun b!188271 () Bool)

(assert (=> b!188271 (= e!123892 (not call!18964))))

(declare-fun b!188272 () Bool)

(declare-fun c!33839 () Bool)

(assert (=> b!188272 (= c!33839 (and (not (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3576 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!188272 (= e!123899 e!123903)))

(assert (= (and d!55471 c!33838) b!188258))

(assert (= (and d!55471 (not c!33838)) b!188253))

(assert (= (and b!188253 c!33836) b!188267))

(assert (= (and b!188253 (not c!33836)) b!188272))

(assert (= (and b!188272 c!33839) b!188264))

(assert (= (and b!188272 (not c!33839)) b!188263))

(assert (= (or b!188264 b!188263) bm!18963))

(assert (= (or b!188267 bm!18963) bm!18961))

(assert (= (or b!188267 b!188264) bm!18965))

(assert (= (or b!188258 bm!18961) bm!18964))

(assert (= (or b!188258 bm!18965) bm!18966))

(assert (= (and d!55471 res!88974) b!188252))

(assert (= (and d!55471 c!33837) b!188259))

(assert (= (and d!55471 (not c!33837)) b!188254))

(assert (= (and d!55471 res!88969) b!188269))

(assert (= (and b!188269 res!88973) b!188262))

(assert (= (and b!188269 (not res!88970)) b!188256))

(assert (= (and b!188256 res!88976) b!188255))

(assert (= (and b!188269 res!88972) b!188265))

(assert (= (and b!188265 c!33840) b!188270))

(assert (= (and b!188265 (not c!33840)) b!188260))

(assert (= (and b!188270 res!88968) b!188268))

(assert (= (or b!188270 b!188260) bm!18967))

(assert (= (and b!188265 res!88971) b!188261))

(assert (= (and b!188261 c!33835) b!188257))

(assert (= (and b!188261 (not c!33835)) b!188271))

(assert (= (and b!188257 res!88975) b!188266))

(assert (= (or b!188257 b!188271) bm!18962))

(declare-fun b_lambda!7293 () Bool)

(assert (=> (not b_lambda!7293) (not b!188255)))

(declare-fun t!7265 () Bool)

(declare-fun tb!2849 () Bool)

(assert (=> (and b!188120 (= (defaultEntry!3839 thiss!1248) (defaultEntry!3839 thiss!1248)) t!7265) tb!2849))

(declare-fun result!4841 () Bool)

(assert (=> tb!2849 (= result!4841 tp_is_empty!4393)))

(assert (=> b!188255 t!7265))

(declare-fun b_and!11231 () Bool)

(assert (= b_and!11225 (and (=> t!7265 result!4841) b_and!11231)))

(declare-fun m!214437 () Bool)

(assert (=> b!188256 m!214437))

(assert (=> b!188256 m!214437))

(declare-fun m!214439 () Bool)

(assert (=> b!188256 m!214439))

(assert (=> b!188255 m!214437))

(declare-fun m!214441 () Bool)

(assert (=> b!188255 m!214441))

(assert (=> b!188255 m!214437))

(declare-fun m!214443 () Bool)

(assert (=> b!188255 m!214443))

(assert (=> b!188255 m!214441))

(declare-fun m!214445 () Bool)

(assert (=> b!188255 m!214445))

(declare-fun m!214447 () Bool)

(assert (=> b!188255 m!214447))

(assert (=> b!188255 m!214445))

(declare-fun m!214449 () Bool)

(assert (=> bm!18966 m!214449))

(declare-fun m!214451 () Bool)

(assert (=> b!188266 m!214451))

(declare-fun m!214453 () Bool)

(assert (=> bm!18962 m!214453))

(declare-fun m!214455 () Bool)

(assert (=> b!188259 m!214455))

(declare-fun m!214457 () Bool)

(assert (=> b!188259 m!214457))

(declare-fun m!214459 () Bool)

(assert (=> b!188259 m!214459))

(declare-fun m!214461 () Bool)

(assert (=> b!188259 m!214461))

(declare-fun m!214463 () Bool)

(assert (=> b!188259 m!214463))

(declare-fun m!214465 () Bool)

(assert (=> b!188259 m!214465))

(declare-fun m!214467 () Bool)

(assert (=> b!188259 m!214467))

(declare-fun m!214469 () Bool)

(assert (=> b!188259 m!214469))

(declare-fun m!214471 () Bool)

(assert (=> b!188259 m!214471))

(declare-fun m!214473 () Bool)

(assert (=> b!188259 m!214473))

(assert (=> b!188259 m!214465))

(declare-fun m!214475 () Bool)

(assert (=> b!188259 m!214475))

(declare-fun m!214477 () Bool)

(assert (=> b!188259 m!214477))

(assert (=> b!188259 m!214467))

(declare-fun m!214479 () Bool)

(assert (=> b!188259 m!214479))

(assert (=> b!188259 m!214437))

(assert (=> b!188259 m!214469))

(assert (=> b!188259 m!214455))

(declare-fun m!214481 () Bool)

(assert (=> b!188259 m!214481))

(declare-fun m!214483 () Bool)

(assert (=> b!188259 m!214483))

(declare-fun m!214485 () Bool)

(assert (=> b!188259 m!214485))

(declare-fun m!214487 () Bool)

(assert (=> b!188258 m!214487))

(assert (=> bm!18964 m!214457))

(assert (=> d!55471 m!214357))

(declare-fun m!214489 () Bool)

(assert (=> b!188268 m!214489))

(assert (=> b!188262 m!214437))

(assert (=> b!188262 m!214437))

(declare-fun m!214491 () Bool)

(assert (=> b!188262 m!214491))

(assert (=> b!188252 m!214437))

(assert (=> b!188252 m!214437))

(assert (=> b!188252 m!214491))

(declare-fun m!214493 () Bool)

(assert (=> bm!18967 m!214493))

(assert (=> b!188112 d!55471))

(declare-fun d!55473 () Bool)

(assert (=> d!55473 (= (array_inv!2435 (_keys!5797 thiss!1248)) (bvsge (size!4087 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188120 d!55473))

(declare-fun d!55475 () Bool)

(assert (=> d!55475 (= (array_inv!2436 (_values!3822 thiss!1248)) (bvsge (size!4088 (_values!3822 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188120 d!55475))

(declare-fun b!188283 () Bool)

(declare-fun e!123913 () Bool)

(declare-fun e!123912 () Bool)

(assert (=> b!188283 (= e!123913 e!123912)))

(declare-fun lt!93108 () (_ BitVec 64))

(assert (=> b!188283 (= lt!93108 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93109 () Unit!5639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7987 (_ BitVec 64) (_ BitVec 32)) Unit!5639)

(assert (=> b!188283 (= lt!93109 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5797 thiss!1248) lt!93108 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!188283 (arrayContainsKey!0 (_keys!5797 thiss!1248) lt!93108 #b00000000000000000000000000000000)))

(declare-fun lt!93107 () Unit!5639)

(assert (=> b!188283 (= lt!93107 lt!93109)))

(declare-fun res!88981 () Bool)

(assert (=> b!188283 (= res!88981 (= (seekEntryOrOpen!0 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000) (_keys!5797 thiss!1248) (mask!9001 thiss!1248)) (Found!656 #b00000000000000000000000000000000)))))

(assert (=> b!188283 (=> (not res!88981) (not e!123912))))

(declare-fun b!188284 () Bool)

(declare-fun call!18973 () Bool)

(assert (=> b!188284 (= e!123912 call!18973)))

(declare-fun b!188285 () Bool)

(declare-fun e!123911 () Bool)

(assert (=> b!188285 (= e!123911 e!123913)))

(declare-fun c!33843 () Bool)

(assert (=> b!188285 (= c!33843 (validKeyInArray!0 (select (arr!3766 (_keys!5797 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55477 () Bool)

(declare-fun res!88982 () Bool)

(assert (=> d!55477 (=> res!88982 e!123911)))

(assert (=> d!55477 (= res!88982 (bvsge #b00000000000000000000000000000000 (size!4087 (_keys!5797 thiss!1248))))))

(assert (=> d!55477 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5797 thiss!1248) (mask!9001 thiss!1248)) e!123911)))

(declare-fun b!188286 () Bool)

(assert (=> b!188286 (= e!123913 call!18973)))

(declare-fun bm!18970 () Bool)

(assert (=> bm!18970 (= call!18973 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5797 thiss!1248) (mask!9001 thiss!1248)))))

(assert (= (and d!55477 (not res!88982)) b!188285))

(assert (= (and b!188285 c!33843) b!188283))

(assert (= (and b!188285 (not c!33843)) b!188286))

(assert (= (and b!188283 res!88981) b!188284))

(assert (= (or b!188284 b!188286) bm!18970))

(assert (=> b!188283 m!214437))

(declare-fun m!214495 () Bool)

(assert (=> b!188283 m!214495))

(declare-fun m!214497 () Bool)

(assert (=> b!188283 m!214497))

(assert (=> b!188283 m!214437))

(declare-fun m!214499 () Bool)

(assert (=> b!188283 m!214499))

(assert (=> b!188285 m!214437))

(assert (=> b!188285 m!214437))

(assert (=> b!188285 m!214491))

(declare-fun m!214501 () Bool)

(assert (=> bm!18970 m!214501))

(assert (=> b!188116 d!55477))

(declare-fun b!188300 () Bool)

(declare-fun e!123922 () SeekEntryResult!656)

(declare-fun lt!93116 () SeekEntryResult!656)

(assert (=> b!188300 (= e!123922 (MissingZero!656 (index!4796 lt!93116)))))

(declare-fun b!188301 () Bool)

(declare-fun e!123921 () SeekEntryResult!656)

(assert (=> b!188301 (= e!123921 (Found!656 (index!4796 lt!93116)))))

(declare-fun b!188302 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7987 (_ BitVec 32)) SeekEntryResult!656)

(assert (=> b!188302 (= e!123922 (seekKeyOrZeroReturnVacant!0 (x!20341 lt!93116) (index!4796 lt!93116) (index!4796 lt!93116) key!828 (_keys!5797 thiss!1248) (mask!9001 thiss!1248)))))

(declare-fun b!188303 () Bool)

(declare-fun e!123920 () SeekEntryResult!656)

(assert (=> b!188303 (= e!123920 Undefined!656)))

(declare-fun b!188304 () Bool)

(declare-fun c!33850 () Bool)

(declare-fun lt!93118 () (_ BitVec 64))

(assert (=> b!188304 (= c!33850 (= lt!93118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188304 (= e!123921 e!123922)))

(declare-fun d!55479 () Bool)

(declare-fun lt!93117 () SeekEntryResult!656)

(assert (=> d!55479 (and (or ((_ is Undefined!656) lt!93117) (not ((_ is Found!656) lt!93117)) (and (bvsge (index!4795 lt!93117) #b00000000000000000000000000000000) (bvslt (index!4795 lt!93117) (size!4087 (_keys!5797 thiss!1248))))) (or ((_ is Undefined!656) lt!93117) ((_ is Found!656) lt!93117) (not ((_ is MissingZero!656) lt!93117)) (and (bvsge (index!4794 lt!93117) #b00000000000000000000000000000000) (bvslt (index!4794 lt!93117) (size!4087 (_keys!5797 thiss!1248))))) (or ((_ is Undefined!656) lt!93117) ((_ is Found!656) lt!93117) ((_ is MissingZero!656) lt!93117) (not ((_ is MissingVacant!656) lt!93117)) (and (bvsge (index!4797 lt!93117) #b00000000000000000000000000000000) (bvslt (index!4797 lt!93117) (size!4087 (_keys!5797 thiss!1248))))) (or ((_ is Undefined!656) lt!93117) (ite ((_ is Found!656) lt!93117) (= (select (arr!3766 (_keys!5797 thiss!1248)) (index!4795 lt!93117)) key!828) (ite ((_ is MissingZero!656) lt!93117) (= (select (arr!3766 (_keys!5797 thiss!1248)) (index!4794 lt!93117)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!656) lt!93117) (= (select (arr!3766 (_keys!5797 thiss!1248)) (index!4797 lt!93117)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55479 (= lt!93117 e!123920)))

(declare-fun c!33851 () Bool)

(assert (=> d!55479 (= c!33851 (and ((_ is Intermediate!656) lt!93116) (undefined!1468 lt!93116)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7987 (_ BitVec 32)) SeekEntryResult!656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55479 (= lt!93116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9001 thiss!1248)) key!828 (_keys!5797 thiss!1248) (mask!9001 thiss!1248)))))

(assert (=> d!55479 (validMask!0 (mask!9001 thiss!1248))))

(assert (=> d!55479 (= (seekEntryOrOpen!0 key!828 (_keys!5797 thiss!1248) (mask!9001 thiss!1248)) lt!93117)))

(declare-fun b!188299 () Bool)

(assert (=> b!188299 (= e!123920 e!123921)))

(assert (=> b!188299 (= lt!93118 (select (arr!3766 (_keys!5797 thiss!1248)) (index!4796 lt!93116)))))

(declare-fun c!33852 () Bool)

(assert (=> b!188299 (= c!33852 (= lt!93118 key!828))))

(assert (= (and d!55479 c!33851) b!188303))

(assert (= (and d!55479 (not c!33851)) b!188299))

(assert (= (and b!188299 c!33852) b!188301))

(assert (= (and b!188299 (not c!33852)) b!188304))

(assert (= (and b!188304 c!33850) b!188300))

(assert (= (and b!188304 (not c!33850)) b!188302))

(declare-fun m!214503 () Bool)

(assert (=> b!188302 m!214503))

(assert (=> d!55479 m!214357))

(declare-fun m!214505 () Bool)

(assert (=> d!55479 m!214505))

(declare-fun m!214507 () Bool)

(assert (=> d!55479 m!214507))

(assert (=> d!55479 m!214507))

(declare-fun m!214509 () Bool)

(assert (=> d!55479 m!214509))

(declare-fun m!214511 () Bool)

(assert (=> d!55479 m!214511))

(declare-fun m!214513 () Bool)

(assert (=> d!55479 m!214513))

(declare-fun m!214515 () Bool)

(assert (=> b!188299 m!214515))

(assert (=> b!188111 d!55479))

(declare-fun d!55481 () Bool)

(declare-fun res!88989 () Bool)

(declare-fun e!123925 () Bool)

(assert (=> d!55481 (=> (not res!88989) (not e!123925))))

(declare-fun simpleValid!189 (LongMapFixedSize!2614) Bool)

(assert (=> d!55481 (= res!88989 (simpleValid!189 thiss!1248))))

(assert (=> d!55481 (= (valid!1094 thiss!1248) e!123925)))

(declare-fun b!188311 () Bool)

(declare-fun res!88990 () Bool)

(assert (=> b!188311 (=> (not res!88990) (not e!123925))))

(declare-fun arrayCountValidKeys!0 (array!7987 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188311 (= res!88990 (= (arrayCountValidKeys!0 (_keys!5797 thiss!1248) #b00000000000000000000000000000000 (size!4087 (_keys!5797 thiss!1248))) (_size!1356 thiss!1248)))))

(declare-fun b!188312 () Bool)

(declare-fun res!88991 () Bool)

(assert (=> b!188312 (=> (not res!88991) (not e!123925))))

(assert (=> b!188312 (= res!88991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5797 thiss!1248) (mask!9001 thiss!1248)))))

(declare-fun b!188313 () Bool)

(declare-datatypes ((List!2377 0))(
  ( (Nil!2374) (Cons!2373 (h!3010 (_ BitVec 64)) (t!7266 List!2377)) )
))
(declare-fun arrayNoDuplicates!0 (array!7987 (_ BitVec 32) List!2377) Bool)

(assert (=> b!188313 (= e!123925 (arrayNoDuplicates!0 (_keys!5797 thiss!1248) #b00000000000000000000000000000000 Nil!2374))))

(assert (= (and d!55481 res!88989) b!188311))

(assert (= (and b!188311 res!88990) b!188312))

(assert (= (and b!188312 res!88991) b!188313))

(declare-fun m!214517 () Bool)

(assert (=> d!55481 m!214517))

(declare-fun m!214519 () Bool)

(assert (=> b!188311 m!214519))

(assert (=> b!188312 m!214351))

(declare-fun m!214521 () Bool)

(assert (=> b!188313 m!214521))

(assert (=> start!19138 d!55481))

(declare-fun b!188330 () Bool)

(declare-fun lt!93123 () SeekEntryResult!656)

(assert (=> b!188330 (and (bvsge (index!4794 lt!93123) #b00000000000000000000000000000000) (bvslt (index!4794 lt!93123) (size!4087 (_keys!5797 thiss!1248))))))

(declare-fun res!89003 () Bool)

(assert (=> b!188330 (= res!89003 (= (select (arr!3766 (_keys!5797 thiss!1248)) (index!4794 lt!93123)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123935 () Bool)

(assert (=> b!188330 (=> (not res!89003) (not e!123935))))

(declare-fun b!188331 () Bool)

(declare-fun e!123934 () Bool)

(assert (=> b!188331 (= e!123934 e!123935)))

(declare-fun res!89000 () Bool)

(declare-fun call!18978 () Bool)

(assert (=> b!188331 (= res!89000 call!18978)))

(assert (=> b!188331 (=> (not res!89000) (not e!123935))))

(declare-fun b!188332 () Bool)

(declare-fun e!123937 () Bool)

(declare-fun call!18979 () Bool)

(assert (=> b!188332 (= e!123937 (not call!18979))))

(declare-fun b!188333 () Bool)

(assert (=> b!188333 (= e!123935 (not call!18979))))

(declare-fun b!188334 () Bool)

(declare-fun e!123936 () Bool)

(assert (=> b!188334 (= e!123936 ((_ is Undefined!656) lt!93123))))

(declare-fun d!55483 () Bool)

(assert (=> d!55483 e!123934))

(declare-fun c!33857 () Bool)

(assert (=> d!55483 (= c!33857 ((_ is MissingZero!656) lt!93123))))

(assert (=> d!55483 (= lt!93123 (seekEntryOrOpen!0 key!828 (_keys!5797 thiss!1248) (mask!9001 thiss!1248)))))

(declare-fun lt!93124 () Unit!5639)

(declare-fun choose!1014 (array!7987 array!7989 (_ BitVec 32) (_ BitVec 32) V!5505 V!5505 (_ BitVec 64) Int) Unit!5639)

(assert (=> d!55483 (= lt!93124 (choose!1014 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)))))

(assert (=> d!55483 (validMask!0 (mask!9001 thiss!1248))))

(assert (=> d!55483 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!151 (_keys!5797 thiss!1248) (_values!3822 thiss!1248) (mask!9001 thiss!1248) (extraKeys!3576 thiss!1248) (zeroValue!3680 thiss!1248) (minValue!3680 thiss!1248) key!828 (defaultEntry!3839 thiss!1248)) lt!93124)))

(declare-fun b!188335 () Bool)

(assert (=> b!188335 (= e!123934 e!123936)))

(declare-fun c!33858 () Bool)

(assert (=> b!188335 (= c!33858 ((_ is MissingVacant!656) lt!93123))))

(declare-fun b!188336 () Bool)

(declare-fun res!89001 () Bool)

(assert (=> b!188336 (=> (not res!89001) (not e!123937))))

(assert (=> b!188336 (= res!89001 (= (select (arr!3766 (_keys!5797 thiss!1248)) (index!4797 lt!93123)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188336 (and (bvsge (index!4797 lt!93123) #b00000000000000000000000000000000) (bvslt (index!4797 lt!93123) (size!4087 (_keys!5797 thiss!1248))))))

(declare-fun bm!18975 () Bool)

(assert (=> bm!18975 (= call!18978 (inRange!0 (ite c!33857 (index!4794 lt!93123) (index!4797 lt!93123)) (mask!9001 thiss!1248)))))

(declare-fun bm!18976 () Bool)

(assert (=> bm!18976 (= call!18979 (arrayContainsKey!0 (_keys!5797 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188337 () Bool)

(declare-fun res!89002 () Bool)

(assert (=> b!188337 (=> (not res!89002) (not e!123937))))

(assert (=> b!188337 (= res!89002 call!18978)))

(assert (=> b!188337 (= e!123936 e!123937)))

(assert (= (and d!55483 c!33857) b!188331))

(assert (= (and d!55483 (not c!33857)) b!188335))

(assert (= (and b!188331 res!89000) b!188330))

(assert (= (and b!188330 res!89003) b!188333))

(assert (= (and b!188335 c!33858) b!188337))

(assert (= (and b!188335 (not c!33858)) b!188334))

(assert (= (and b!188337 res!89002) b!188336))

(assert (= (and b!188336 res!89001) b!188332))

(assert (= (or b!188331 b!188337) bm!18975))

(assert (= (or b!188333 b!188332) bm!18976))

(assert (=> d!55483 m!214355))

(declare-fun m!214523 () Bool)

(assert (=> d!55483 m!214523))

(assert (=> d!55483 m!214357))

(declare-fun m!214525 () Bool)

(assert (=> b!188336 m!214525))

(declare-fun m!214527 () Bool)

(assert (=> bm!18976 m!214527))

(declare-fun m!214529 () Bool)

(assert (=> bm!18975 m!214529))

(declare-fun m!214531 () Bool)

(assert (=> b!188330 m!214531))

(assert (=> b!188114 d!55483))

(declare-fun mapIsEmpty!7582 () Bool)

(declare-fun mapRes!7582 () Bool)

(assert (=> mapIsEmpty!7582 mapRes!7582))

(declare-fun mapNonEmpty!7582 () Bool)

(declare-fun tp!16699 () Bool)

(declare-fun e!123942 () Bool)

(assert (=> mapNonEmpty!7582 (= mapRes!7582 (and tp!16699 e!123942))))

(declare-fun mapValue!7582 () ValueCell!1853)

(declare-fun mapKey!7582 () (_ BitVec 32))

(declare-fun mapRest!7582 () (Array (_ BitVec 32) ValueCell!1853))

(assert (=> mapNonEmpty!7582 (= mapRest!7573 (store mapRest!7582 mapKey!7582 mapValue!7582))))

(declare-fun condMapEmpty!7582 () Bool)

(declare-fun mapDefault!7582 () ValueCell!1853)

(assert (=> mapNonEmpty!7573 (= condMapEmpty!7582 (= mapRest!7573 ((as const (Array (_ BitVec 32) ValueCell!1853)) mapDefault!7582)))))

(declare-fun e!123943 () Bool)

(assert (=> mapNonEmpty!7573 (= tp!16683 (and e!123943 mapRes!7582))))

(declare-fun b!188344 () Bool)

(assert (=> b!188344 (= e!123942 tp_is_empty!4393)))

(declare-fun b!188345 () Bool)

(assert (=> b!188345 (= e!123943 tp_is_empty!4393)))

(assert (= (and mapNonEmpty!7573 condMapEmpty!7582) mapIsEmpty!7582))

(assert (= (and mapNonEmpty!7573 (not condMapEmpty!7582)) mapNonEmpty!7582))

(assert (= (and mapNonEmpty!7582 ((_ is ValueCellFull!1853) mapValue!7582)) b!188344))

(assert (= (and mapNonEmpty!7573 ((_ is ValueCellFull!1853) mapDefault!7582)) b!188345))

(declare-fun m!214533 () Bool)

(assert (=> mapNonEmpty!7582 m!214533))

(declare-fun b_lambda!7295 () Bool)

(assert (= b_lambda!7293 (or (and b!188120 b_free!4621) b_lambda!7295)))

(check-sat (not b!188262) (not bm!18970) (not b!188311) (not bm!18975) tp_is_empty!4393 (not b!188312) (not d!55479) (not b!188285) (not b!188258) (not b!188313) (not b!188259) (not bm!18964) (not b!188199) (not b!188302) (not bm!18966) (not d!55469) (not d!55463) (not b!188256) (not b!188268) (not b!188266) (not d!55483) (not b!188209) (not bm!18962) (not b!188207) (not bm!18976) (not b!188252) (not b!188283) (not b_next!4621) (not bm!18967) b_and!11231 (not b!188255) (not d!55471) (not mapNonEmpty!7582) (not d!55481) (not b_lambda!7295))
(check-sat b_and!11231 (not b_next!4621))
