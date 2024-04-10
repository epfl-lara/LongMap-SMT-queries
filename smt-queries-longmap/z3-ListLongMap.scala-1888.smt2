; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33782 () Bool)

(assert start!33782)

(declare-fun b_free!6999 () Bool)

(declare-fun b_next!6999 () Bool)

(assert (=> start!33782 (= b_free!6999 (not b_next!6999))))

(declare-fun tp!24503 () Bool)

(declare-fun b_and!14181 () Bool)

(assert (=> start!33782 (= tp!24503 b_and!14181)))

(declare-fun b!336070 () Bool)

(declare-fun res!185502 () Bool)

(declare-fun e!206288 () Bool)

(assert (=> b!336070 (=> (not res!185502) (not e!206288))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10245 0))(
  ( (V!10246 (val!3520 Int)) )
))
(declare-datatypes ((ValueCell!3132 0))(
  ( (ValueCellFull!3132 (v!5683 V!10245)) (EmptyCell!3132) )
))
(declare-datatypes ((array!17497 0))(
  ( (array!17498 (arr!8278 (Array (_ BitVec 32) ValueCell!3132)) (size!8630 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17497)

(declare-datatypes ((array!17499 0))(
  ( (array!17500 (arr!8279 (Array (_ BitVec 32) (_ BitVec 64))) (size!8631 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17499)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336070 (= res!185502 (and (= (size!8630 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8631 _keys!1895) (size!8630 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336071 () Bool)

(declare-fun e!206290 () Bool)

(declare-fun tp_is_empty!6951 () Bool)

(assert (=> b!336071 (= e!206290 tp_is_empty!6951)))

(declare-fun b!336072 () Bool)

(declare-fun res!185501 () Bool)

(assert (=> b!336072 (=> (not res!185501) (not e!206288))))

(declare-datatypes ((List!4731 0))(
  ( (Nil!4728) (Cons!4727 (h!5583 (_ BitVec 64)) (t!9821 List!4731)) )
))
(declare-fun arrayNoDuplicates!0 (array!17499 (_ BitVec 32) List!4731) Bool)

(assert (=> b!336072 (= res!185501 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4728))))

(declare-fun b!336073 () Bool)

(declare-fun res!185503 () Bool)

(assert (=> b!336073 (=> (not res!185503) (not e!206288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17499 (_ BitVec 32)) Bool)

(assert (=> b!336073 (= res!185503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11826 () Bool)

(declare-fun mapRes!11826 () Bool)

(declare-fun tp!24504 () Bool)

(assert (=> mapNonEmpty!11826 (= mapRes!11826 (and tp!24504 e!206290))))

(declare-fun mapRest!11826 () (Array (_ BitVec 32) ValueCell!3132))

(declare-fun mapValue!11826 () ValueCell!3132)

(declare-fun mapKey!11826 () (_ BitVec 32))

(assert (=> mapNonEmpty!11826 (= (arr!8278 _values!1525) (store mapRest!11826 mapKey!11826 mapValue!11826))))

(declare-fun b!336074 () Bool)

(declare-fun e!206291 () Bool)

(assert (=> b!336074 (= e!206291 tp_is_empty!6951)))

(declare-fun res!185500 () Bool)

(assert (=> start!33782 (=> (not res!185500) (not e!206288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33782 (= res!185500 (validMask!0 mask!2385))))

(assert (=> start!33782 e!206288))

(assert (=> start!33782 true))

(assert (=> start!33782 tp_is_empty!6951))

(assert (=> start!33782 tp!24503))

(declare-fun e!206289 () Bool)

(declare-fun array_inv!6148 (array!17497) Bool)

(assert (=> start!33782 (and (array_inv!6148 _values!1525) e!206289)))

(declare-fun array_inv!6149 (array!17499) Bool)

(assert (=> start!33782 (array_inv!6149 _keys!1895)))

(declare-fun b!336069 () Bool)

(declare-fun res!185504 () Bool)

(assert (=> b!336069 (=> (not res!185504) (not e!206288))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336069 (= res!185504 (validKeyInArray!0 k0!1348))))

(declare-fun b!336075 () Bool)

(declare-fun res!185499 () Bool)

(assert (=> b!336075 (=> (not res!185499) (not e!206288))))

(declare-fun zeroValue!1467 () V!10245)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10245)

(declare-datatypes ((tuple2!5114 0))(
  ( (tuple2!5115 (_1!2568 (_ BitVec 64)) (_2!2568 V!10245)) )
))
(declare-datatypes ((List!4732 0))(
  ( (Nil!4729) (Cons!4728 (h!5584 tuple2!5114) (t!9822 List!4732)) )
))
(declare-datatypes ((ListLongMap!4027 0))(
  ( (ListLongMap!4028 (toList!2029 List!4732)) )
))
(declare-fun contains!2074 (ListLongMap!4027 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1550 (array!17499 array!17497 (_ BitVec 32) (_ BitVec 32) V!10245 V!10245 (_ BitVec 32) Int) ListLongMap!4027)

(assert (=> b!336075 (= res!185499 (not (contains!2074 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!336076 () Bool)

(assert (=> b!336076 (= e!206289 (and e!206291 mapRes!11826))))

(declare-fun condMapEmpty!11826 () Bool)

(declare-fun mapDefault!11826 () ValueCell!3132)

(assert (=> b!336076 (= condMapEmpty!11826 (= (arr!8278 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3132)) mapDefault!11826)))))

(declare-fun mapIsEmpty!11826 () Bool)

(assert (=> mapIsEmpty!11826 mapRes!11826))

(declare-fun b!336077 () Bool)

(declare-datatypes ((SeekEntryResult!3200 0))(
  ( (MissingZero!3200 (index!14979 (_ BitVec 32))) (Found!3200 (index!14980 (_ BitVec 32))) (Intermediate!3200 (undefined!4012 Bool) (index!14981 (_ BitVec 32)) (x!33496 (_ BitVec 32))) (Undefined!3200) (MissingVacant!3200 (index!14982 (_ BitVec 32))) )
))
(declare-fun lt!160057 () SeekEntryResult!3200)

(get-info :version)

(assert (=> b!336077 (= e!206288 (and (not ((_ is Found!3200) lt!160057)) ((_ is MissingZero!3200) lt!160057) (bvslt #b00000000000000000000000000000000 (size!8631 _keys!1895)) (bvsge (size!8631 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17499 (_ BitVec 32)) SeekEntryResult!3200)

(assert (=> b!336077 (= lt!160057 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33782 res!185500) b!336070))

(assert (= (and b!336070 res!185502) b!336073))

(assert (= (and b!336073 res!185503) b!336072))

(assert (= (and b!336072 res!185501) b!336069))

(assert (= (and b!336069 res!185504) b!336075))

(assert (= (and b!336075 res!185499) b!336077))

(assert (= (and b!336076 condMapEmpty!11826) mapIsEmpty!11826))

(assert (= (and b!336076 (not condMapEmpty!11826)) mapNonEmpty!11826))

(assert (= (and mapNonEmpty!11826 ((_ is ValueCellFull!3132) mapValue!11826)) b!336071))

(assert (= (and b!336076 ((_ is ValueCellFull!3132) mapDefault!11826)) b!336074))

(assert (= start!33782 b!336076))

(declare-fun m!339975 () Bool)

(assert (=> start!33782 m!339975))

(declare-fun m!339977 () Bool)

(assert (=> start!33782 m!339977))

(declare-fun m!339979 () Bool)

(assert (=> start!33782 m!339979))

(declare-fun m!339981 () Bool)

(assert (=> b!336073 m!339981))

(declare-fun m!339983 () Bool)

(assert (=> mapNonEmpty!11826 m!339983))

(declare-fun m!339985 () Bool)

(assert (=> b!336077 m!339985))

(declare-fun m!339987 () Bool)

(assert (=> b!336075 m!339987))

(assert (=> b!336075 m!339987))

(declare-fun m!339989 () Bool)

(assert (=> b!336075 m!339989))

(declare-fun m!339991 () Bool)

(assert (=> b!336069 m!339991))

(declare-fun m!339993 () Bool)

(assert (=> b!336072 m!339993))

(check-sat (not mapNonEmpty!11826) (not start!33782) (not b_next!6999) (not b!336077) (not b!336075) (not b!336073) (not b!336069) (not b!336072) b_and!14181 tp_is_empty!6951)
(check-sat b_and!14181 (not b_next!6999))
(get-model)

(declare-fun bm!26323 () Bool)

(declare-fun call!26326 () Bool)

(declare-fun c!52233 () Bool)

(assert (=> bm!26323 (= call!26326 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52233 (Cons!4727 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000) Nil!4728) Nil!4728)))))

(declare-fun b!336115 () Bool)

(declare-fun e!206318 () Bool)

(declare-fun e!206317 () Bool)

(assert (=> b!336115 (= e!206318 e!206317)))

(assert (=> b!336115 (= c!52233 (validKeyInArray!0 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336116 () Bool)

(declare-fun e!206319 () Bool)

(assert (=> b!336116 (= e!206319 e!206318)))

(declare-fun res!185530 () Bool)

(assert (=> b!336116 (=> (not res!185530) (not e!206318))))

(declare-fun e!206316 () Bool)

(assert (=> b!336116 (= res!185530 (not e!206316))))

(declare-fun res!185531 () Bool)

(assert (=> b!336116 (=> (not res!185531) (not e!206316))))

(assert (=> b!336116 (= res!185531 (validKeyInArray!0 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70673 () Bool)

(declare-fun res!185529 () Bool)

(assert (=> d!70673 (=> res!185529 e!206319)))

(assert (=> d!70673 (= res!185529 (bvsge #b00000000000000000000000000000000 (size!8631 _keys!1895)))))

(assert (=> d!70673 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4728) e!206319)))

(declare-fun b!336117 () Bool)

(assert (=> b!336117 (= e!206317 call!26326)))

(declare-fun b!336118 () Bool)

(assert (=> b!336118 (= e!206317 call!26326)))

(declare-fun b!336119 () Bool)

(declare-fun contains!2075 (List!4731 (_ BitVec 64)) Bool)

(assert (=> b!336119 (= e!206316 (contains!2075 Nil!4728 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70673 (not res!185529)) b!336116))

(assert (= (and b!336116 res!185531) b!336119))

(assert (= (and b!336116 res!185530) b!336115))

(assert (= (and b!336115 c!52233) b!336117))

(assert (= (and b!336115 (not c!52233)) b!336118))

(assert (= (or b!336117 b!336118) bm!26323))

(declare-fun m!340015 () Bool)

(assert (=> bm!26323 m!340015))

(declare-fun m!340017 () Bool)

(assert (=> bm!26323 m!340017))

(assert (=> b!336115 m!340015))

(assert (=> b!336115 m!340015))

(declare-fun m!340019 () Bool)

(assert (=> b!336115 m!340019))

(assert (=> b!336116 m!340015))

(assert (=> b!336116 m!340015))

(assert (=> b!336116 m!340019))

(assert (=> b!336119 m!340015))

(assert (=> b!336119 m!340015))

(declare-fun m!340021 () Bool)

(assert (=> b!336119 m!340021))

(assert (=> b!336072 d!70673))

(declare-fun d!70675 () Bool)

(declare-fun e!206325 () Bool)

(assert (=> d!70675 e!206325))

(declare-fun res!185534 () Bool)

(assert (=> d!70675 (=> res!185534 e!206325)))

(declare-fun lt!160072 () Bool)

(assert (=> d!70675 (= res!185534 (not lt!160072))))

(declare-fun lt!160071 () Bool)

(assert (=> d!70675 (= lt!160072 lt!160071)))

(declare-datatypes ((Unit!10459 0))(
  ( (Unit!10460) )
))
(declare-fun lt!160069 () Unit!10459)

(declare-fun e!206324 () Unit!10459)

(assert (=> d!70675 (= lt!160069 e!206324)))

(declare-fun c!52236 () Bool)

(assert (=> d!70675 (= c!52236 lt!160071)))

(declare-fun containsKey!317 (List!4732 (_ BitVec 64)) Bool)

(assert (=> d!70675 (= lt!160071 (containsKey!317 (toList!2029 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70675 (= (contains!2074 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160072)))

(declare-fun b!336126 () Bool)

(declare-fun lt!160070 () Unit!10459)

(assert (=> b!336126 (= e!206324 lt!160070)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!265 (List!4732 (_ BitVec 64)) Unit!10459)

(assert (=> b!336126 (= lt!160070 (lemmaContainsKeyImpliesGetValueByKeyDefined!265 (toList!2029 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!331 0))(
  ( (Some!330 (v!5685 V!10245)) (None!329) )
))
(declare-fun isDefined!266 (Option!331) Bool)

(declare-fun getValueByKey!325 (List!4732 (_ BitVec 64)) Option!331)

(assert (=> b!336126 (isDefined!266 (getValueByKey!325 (toList!2029 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!336127 () Bool)

(declare-fun Unit!10461 () Unit!10459)

(assert (=> b!336127 (= e!206324 Unit!10461)))

(declare-fun b!336128 () Bool)

(assert (=> b!336128 (= e!206325 (isDefined!266 (getValueByKey!325 (toList!2029 (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70675 c!52236) b!336126))

(assert (= (and d!70675 (not c!52236)) b!336127))

(assert (= (and d!70675 (not res!185534)) b!336128))

(declare-fun m!340023 () Bool)

(assert (=> d!70675 m!340023))

(declare-fun m!340025 () Bool)

(assert (=> b!336126 m!340025))

(declare-fun m!340027 () Bool)

(assert (=> b!336126 m!340027))

(assert (=> b!336126 m!340027))

(declare-fun m!340029 () Bool)

(assert (=> b!336126 m!340029))

(assert (=> b!336128 m!340027))

(assert (=> b!336128 m!340027))

(assert (=> b!336128 m!340029))

(assert (=> b!336075 d!70675))

(declare-fun b!336171 () Bool)

(declare-fun e!206362 () Bool)

(assert (=> b!336171 (= e!206362 (validKeyInArray!0 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26338 () Bool)

(declare-fun call!26343 () Bool)

(declare-fun lt!160136 () ListLongMap!4027)

(assert (=> bm!26338 (= call!26343 (contains!2074 lt!160136 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26339 () Bool)

(declare-fun call!26345 () ListLongMap!4027)

(declare-fun call!26346 () ListLongMap!4027)

(assert (=> bm!26339 (= call!26345 call!26346)))

(declare-fun b!336172 () Bool)

(declare-fun e!206363 () ListLongMap!4027)

(assert (=> b!336172 (= e!206363 call!26345)))

(declare-fun b!336173 () Bool)

(declare-fun e!206356 () Bool)

(declare-fun e!206353 () Bool)

(assert (=> b!336173 (= e!206356 e!206353)))

(declare-fun res!185556 () Bool)

(assert (=> b!336173 (= res!185556 call!26343)))

(assert (=> b!336173 (=> (not res!185556) (not e!206353))))

(declare-fun b!336174 () Bool)

(declare-fun res!185558 () Bool)

(declare-fun e!206359 () Bool)

(assert (=> b!336174 (=> (not res!185558) (not e!206359))))

(declare-fun e!206352 () Bool)

(assert (=> b!336174 (= res!185558 e!206352)))

(declare-fun res!185554 () Bool)

(assert (=> b!336174 (=> res!185554 e!206352)))

(assert (=> b!336174 (= res!185554 (not e!206362))))

(declare-fun res!185553 () Bool)

(assert (=> b!336174 (=> (not res!185553) (not e!206362))))

(assert (=> b!336174 (= res!185553 (bvslt #b00000000000000000000000000000000 (size!8631 _keys!1895)))))

(declare-fun b!336175 () Bool)

(assert (=> b!336175 (= e!206356 (not call!26343))))

(declare-fun b!336176 () Bool)

(declare-fun e!206360 () Bool)

(declare-fun apply!267 (ListLongMap!4027 (_ BitVec 64)) V!10245)

(declare-fun get!4529 (ValueCell!3132 V!10245) V!10245)

(declare-fun dynLambda!610 (Int (_ BitVec 64)) V!10245)

(assert (=> b!336176 (= e!206360 (= (apply!267 lt!160136 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000)) (get!4529 (select (arr!8278 _values!1525) #b00000000000000000000000000000000) (dynLambda!610 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!336176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8630 _values!1525)))))

(assert (=> b!336176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8631 _keys!1895)))))

(declare-fun b!336177 () Bool)

(declare-fun e!206355 () Bool)

(declare-fun call!26342 () Bool)

(assert (=> b!336177 (= e!206355 (not call!26342))))

(declare-fun b!336178 () Bool)

(declare-fun e!206357 () ListLongMap!4027)

(declare-fun call!26347 () ListLongMap!4027)

(assert (=> b!336178 (= e!206357 call!26347)))

(declare-fun b!336179 () Bool)

(declare-fun e!206358 () Unit!10459)

(declare-fun Unit!10462 () Unit!10459)

(assert (=> b!336179 (= e!206358 Unit!10462)))

(declare-fun bm!26340 () Bool)

(declare-fun call!26341 () ListLongMap!4027)

(assert (=> bm!26340 (= call!26346 call!26341)))

(declare-fun b!336180 () Bool)

(declare-fun e!206354 () ListLongMap!4027)

(declare-fun call!26344 () ListLongMap!4027)

(declare-fun +!716 (ListLongMap!4027 tuple2!5114) ListLongMap!4027)

(assert (=> b!336180 (= e!206354 (+!716 call!26344 (tuple2!5115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun d!70677 () Bool)

(assert (=> d!70677 e!206359))

(declare-fun res!185561 () Bool)

(assert (=> d!70677 (=> (not res!185561) (not e!206359))))

(assert (=> d!70677 (= res!185561 (or (bvsge #b00000000000000000000000000000000 (size!8631 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8631 _keys!1895)))))))

(declare-fun lt!160124 () ListLongMap!4027)

(assert (=> d!70677 (= lt!160136 lt!160124)))

(declare-fun lt!160130 () Unit!10459)

(assert (=> d!70677 (= lt!160130 e!206358)))

(declare-fun c!52252 () Bool)

(declare-fun e!206361 () Bool)

(assert (=> d!70677 (= c!52252 e!206361)))

(declare-fun res!185557 () Bool)

(assert (=> d!70677 (=> (not res!185557) (not e!206361))))

(assert (=> d!70677 (= res!185557 (bvslt #b00000000000000000000000000000000 (size!8631 _keys!1895)))))

(assert (=> d!70677 (= lt!160124 e!206354)))

(declare-fun c!52250 () Bool)

(assert (=> d!70677 (= c!52250 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70677 (validMask!0 mask!2385)))

(assert (=> d!70677 (= (getCurrentListMap!1550 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160136)))

(declare-fun b!336181 () Bool)

(declare-fun e!206364 () Bool)

(assert (=> b!336181 (= e!206364 (= (apply!267 lt!160136 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!336182 () Bool)

(assert (=> b!336182 (= e!206353 (= (apply!267 lt!160136 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!336183 () Bool)

(assert (=> b!336183 (= e!206355 e!206364)))

(declare-fun res!185559 () Bool)

(assert (=> b!336183 (= res!185559 call!26342)))

(assert (=> b!336183 (=> (not res!185559) (not e!206364))))

(declare-fun b!336184 () Bool)

(declare-fun c!52251 () Bool)

(assert (=> b!336184 (= c!52251 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!336184 (= e!206357 e!206363)))

(declare-fun b!336185 () Bool)

(assert (=> b!336185 (= e!206361 (validKeyInArray!0 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336186 () Bool)

(assert (=> b!336186 (= e!206352 e!206360)))

(declare-fun res!185560 () Bool)

(assert (=> b!336186 (=> (not res!185560) (not e!206360))))

(assert (=> b!336186 (= res!185560 (contains!2074 lt!160136 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!336186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8631 _keys!1895)))))

(declare-fun b!336187 () Bool)

(assert (=> b!336187 (= e!206363 call!26347)))

(declare-fun bm!26341 () Bool)

(assert (=> bm!26341 (= call!26347 call!26344)))

(declare-fun b!336188 () Bool)

(declare-fun res!185555 () Bool)

(assert (=> b!336188 (=> (not res!185555) (not e!206359))))

(assert (=> b!336188 (= res!185555 e!206356)))

(declare-fun c!52249 () Bool)

(assert (=> b!336188 (= c!52249 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!52253 () Bool)

(declare-fun bm!26342 () Bool)

(assert (=> bm!26342 (= call!26344 (+!716 (ite c!52250 call!26341 (ite c!52253 call!26346 call!26345)) (ite (or c!52250 c!52253) (tuple2!5115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5115 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!336189 () Bool)

(declare-fun lt!160122 () Unit!10459)

(assert (=> b!336189 (= e!206358 lt!160122)))

(declare-fun lt!160126 () ListLongMap!4027)

(declare-fun getCurrentListMapNoExtraKeys!589 (array!17499 array!17497 (_ BitVec 32) (_ BitVec 32) V!10245 V!10245 (_ BitVec 32) Int) ListLongMap!4027)

(assert (=> b!336189 (= lt!160126 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160138 () (_ BitVec 64))

(assert (=> b!336189 (= lt!160138 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160135 () (_ BitVec 64))

(assert (=> b!336189 (= lt!160135 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160128 () Unit!10459)

(declare-fun addStillContains!243 (ListLongMap!4027 (_ BitVec 64) V!10245 (_ BitVec 64)) Unit!10459)

(assert (=> b!336189 (= lt!160128 (addStillContains!243 lt!160126 lt!160138 zeroValue!1467 lt!160135))))

(assert (=> b!336189 (contains!2074 (+!716 lt!160126 (tuple2!5115 lt!160138 zeroValue!1467)) lt!160135)))

(declare-fun lt!160118 () Unit!10459)

(assert (=> b!336189 (= lt!160118 lt!160128)))

(declare-fun lt!160137 () ListLongMap!4027)

(assert (=> b!336189 (= lt!160137 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160134 () (_ BitVec 64))

(assert (=> b!336189 (= lt!160134 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160125 () (_ BitVec 64))

(assert (=> b!336189 (= lt!160125 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160127 () Unit!10459)

(declare-fun addApplyDifferent!243 (ListLongMap!4027 (_ BitVec 64) V!10245 (_ BitVec 64)) Unit!10459)

(assert (=> b!336189 (= lt!160127 (addApplyDifferent!243 lt!160137 lt!160134 minValue!1467 lt!160125))))

(assert (=> b!336189 (= (apply!267 (+!716 lt!160137 (tuple2!5115 lt!160134 minValue!1467)) lt!160125) (apply!267 lt!160137 lt!160125))))

(declare-fun lt!160120 () Unit!10459)

(assert (=> b!336189 (= lt!160120 lt!160127)))

(declare-fun lt!160123 () ListLongMap!4027)

(assert (=> b!336189 (= lt!160123 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160132 () (_ BitVec 64))

(assert (=> b!336189 (= lt!160132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160121 () (_ BitVec 64))

(assert (=> b!336189 (= lt!160121 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160129 () Unit!10459)

(assert (=> b!336189 (= lt!160129 (addApplyDifferent!243 lt!160123 lt!160132 zeroValue!1467 lt!160121))))

(assert (=> b!336189 (= (apply!267 (+!716 lt!160123 (tuple2!5115 lt!160132 zeroValue!1467)) lt!160121) (apply!267 lt!160123 lt!160121))))

(declare-fun lt!160117 () Unit!10459)

(assert (=> b!336189 (= lt!160117 lt!160129)))

(declare-fun lt!160131 () ListLongMap!4027)

(assert (=> b!336189 (= lt!160131 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160119 () (_ BitVec 64))

(assert (=> b!336189 (= lt!160119 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160133 () (_ BitVec 64))

(assert (=> b!336189 (= lt!160133 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!336189 (= lt!160122 (addApplyDifferent!243 lt!160131 lt!160119 minValue!1467 lt!160133))))

(assert (=> b!336189 (= (apply!267 (+!716 lt!160131 (tuple2!5115 lt!160119 minValue!1467)) lt!160133) (apply!267 lt!160131 lt!160133))))

(declare-fun bm!26343 () Bool)

(assert (=> bm!26343 (= call!26341 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!336190 () Bool)

(assert (=> b!336190 (= e!206354 e!206357)))

(assert (=> b!336190 (= c!52253 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26344 () Bool)

(assert (=> bm!26344 (= call!26342 (contains!2074 lt!160136 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!336191 () Bool)

(assert (=> b!336191 (= e!206359 e!206355)))

(declare-fun c!52254 () Bool)

(assert (=> b!336191 (= c!52254 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!70677 c!52250) b!336180))

(assert (= (and d!70677 (not c!52250)) b!336190))

(assert (= (and b!336190 c!52253) b!336178))

(assert (= (and b!336190 (not c!52253)) b!336184))

(assert (= (and b!336184 c!52251) b!336187))

(assert (= (and b!336184 (not c!52251)) b!336172))

(assert (= (or b!336187 b!336172) bm!26339))

(assert (= (or b!336178 bm!26339) bm!26340))

(assert (= (or b!336178 b!336187) bm!26341))

(assert (= (or b!336180 bm!26340) bm!26343))

(assert (= (or b!336180 bm!26341) bm!26342))

(assert (= (and d!70677 res!185557) b!336185))

(assert (= (and d!70677 c!52252) b!336189))

(assert (= (and d!70677 (not c!52252)) b!336179))

(assert (= (and d!70677 res!185561) b!336174))

(assert (= (and b!336174 res!185553) b!336171))

(assert (= (and b!336174 (not res!185554)) b!336186))

(assert (= (and b!336186 res!185560) b!336176))

(assert (= (and b!336174 res!185558) b!336188))

(assert (= (and b!336188 c!52249) b!336173))

(assert (= (and b!336188 (not c!52249)) b!336175))

(assert (= (and b!336173 res!185556) b!336182))

(assert (= (or b!336173 b!336175) bm!26338))

(assert (= (and b!336188 res!185555) b!336191))

(assert (= (and b!336191 c!52254) b!336183))

(assert (= (and b!336191 (not c!52254)) b!336177))

(assert (= (and b!336183 res!185559) b!336181))

(assert (= (or b!336183 b!336177) bm!26344))

(declare-fun b_lambda!8407 () Bool)

(assert (=> (not b_lambda!8407) (not b!336176)))

(declare-fun t!9824 () Bool)

(declare-fun tb!3049 () Bool)

(assert (=> (and start!33782 (= defaultEntry!1528 defaultEntry!1528) t!9824) tb!3049))

(declare-fun result!5477 () Bool)

(assert (=> tb!3049 (= result!5477 tp_is_empty!6951)))

(assert (=> b!336176 t!9824))

(declare-fun b_and!14185 () Bool)

(assert (= b_and!14181 (and (=> t!9824 result!5477) b_and!14185)))

(declare-fun m!340031 () Bool)

(assert (=> b!336189 m!340031))

(declare-fun m!340033 () Bool)

(assert (=> b!336189 m!340033))

(declare-fun m!340035 () Bool)

(assert (=> b!336189 m!340035))

(declare-fun m!340037 () Bool)

(assert (=> b!336189 m!340037))

(declare-fun m!340039 () Bool)

(assert (=> b!336189 m!340039))

(declare-fun m!340041 () Bool)

(assert (=> b!336189 m!340041))

(declare-fun m!340043 () Bool)

(assert (=> b!336189 m!340043))

(declare-fun m!340045 () Bool)

(assert (=> b!336189 m!340045))

(declare-fun m!340047 () Bool)

(assert (=> b!336189 m!340047))

(declare-fun m!340049 () Bool)

(assert (=> b!336189 m!340049))

(declare-fun m!340051 () Bool)

(assert (=> b!336189 m!340051))

(declare-fun m!340053 () Bool)

(assert (=> b!336189 m!340053))

(assert (=> b!336189 m!340035))

(assert (=> b!336189 m!340043))

(assert (=> b!336189 m!340015))

(declare-fun m!340055 () Bool)

(assert (=> b!336189 m!340055))

(assert (=> b!336189 m!340051))

(declare-fun m!340057 () Bool)

(assert (=> b!336189 m!340057))

(declare-fun m!340059 () Bool)

(assert (=> b!336189 m!340059))

(declare-fun m!340061 () Bool)

(assert (=> b!336189 m!340061))

(assert (=> b!336189 m!340059))

(declare-fun m!340063 () Bool)

(assert (=> b!336181 m!340063))

(declare-fun m!340065 () Bool)

(assert (=> b!336180 m!340065))

(declare-fun m!340067 () Bool)

(assert (=> bm!26344 m!340067))

(assert (=> d!70677 m!339975))

(assert (=> b!336185 m!340015))

(assert (=> b!336185 m!340015))

(assert (=> b!336185 m!340019))

(declare-fun m!340069 () Bool)

(assert (=> bm!26342 m!340069))

(assert (=> b!336176 m!340015))

(declare-fun m!340071 () Bool)

(assert (=> b!336176 m!340071))

(declare-fun m!340073 () Bool)

(assert (=> b!336176 m!340073))

(declare-fun m!340075 () Bool)

(assert (=> b!336176 m!340075))

(declare-fun m!340077 () Bool)

(assert (=> b!336176 m!340077))

(assert (=> b!336176 m!340073))

(assert (=> b!336176 m!340075))

(assert (=> b!336176 m!340015))

(assert (=> b!336186 m!340015))

(assert (=> b!336186 m!340015))

(declare-fun m!340079 () Bool)

(assert (=> b!336186 m!340079))

(declare-fun m!340081 () Bool)

(assert (=> bm!26338 m!340081))

(assert (=> b!336171 m!340015))

(assert (=> b!336171 m!340015))

(assert (=> b!336171 m!340019))

(assert (=> bm!26343 m!340047))

(declare-fun m!340083 () Bool)

(assert (=> b!336182 m!340083))

(assert (=> b!336075 d!70677))

(declare-fun d!70679 () Bool)

(assert (=> d!70679 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!336069 d!70679))

(declare-fun d!70681 () Bool)

(assert (=> d!70681 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33782 d!70681))

(declare-fun d!70683 () Bool)

(assert (=> d!70683 (= (array_inv!6148 _values!1525) (bvsge (size!8630 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33782 d!70683))

(declare-fun d!70685 () Bool)

(assert (=> d!70685 (= (array_inv!6149 _keys!1895) (bvsge (size!8631 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33782 d!70685))

(declare-fun b!336202 () Bool)

(declare-fun e!206373 () Bool)

(declare-fun e!206371 () Bool)

(assert (=> b!336202 (= e!206373 e!206371)))

(declare-fun lt!160145 () (_ BitVec 64))

(assert (=> b!336202 (= lt!160145 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160146 () Unit!10459)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17499 (_ BitVec 64) (_ BitVec 32)) Unit!10459)

(assert (=> b!336202 (= lt!160146 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160145 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336202 (arrayContainsKey!0 _keys!1895 lt!160145 #b00000000000000000000000000000000)))

(declare-fun lt!160147 () Unit!10459)

(assert (=> b!336202 (= lt!160147 lt!160146)))

(declare-fun res!185566 () Bool)

(assert (=> b!336202 (= res!185566 (= (seekEntryOrOpen!0 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3200 #b00000000000000000000000000000000)))))

(assert (=> b!336202 (=> (not res!185566) (not e!206371))))

(declare-fun b!336203 () Bool)

(declare-fun e!206372 () Bool)

(assert (=> b!336203 (= e!206372 e!206373)))

(declare-fun c!52257 () Bool)

(assert (=> b!336203 (= c!52257 (validKeyInArray!0 (select (arr!8279 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!336204 () Bool)

(declare-fun call!26350 () Bool)

(assert (=> b!336204 (= e!206373 call!26350)))

(declare-fun b!336205 () Bool)

(assert (=> b!336205 (= e!206371 call!26350)))

(declare-fun d!70687 () Bool)

(declare-fun res!185567 () Bool)

(assert (=> d!70687 (=> res!185567 e!206372)))

(assert (=> d!70687 (= res!185567 (bvsge #b00000000000000000000000000000000 (size!8631 _keys!1895)))))

(assert (=> d!70687 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!206372)))

(declare-fun bm!26347 () Bool)

(assert (=> bm!26347 (= call!26350 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!70687 (not res!185567)) b!336203))

(assert (= (and b!336203 c!52257) b!336202))

(assert (= (and b!336203 (not c!52257)) b!336204))

(assert (= (and b!336202 res!185566) b!336205))

(assert (= (or b!336205 b!336204) bm!26347))

(assert (=> b!336202 m!340015))

(declare-fun m!340085 () Bool)

(assert (=> b!336202 m!340085))

(declare-fun m!340087 () Bool)

(assert (=> b!336202 m!340087))

(assert (=> b!336202 m!340015))

(declare-fun m!340089 () Bool)

(assert (=> b!336202 m!340089))

(assert (=> b!336203 m!340015))

(assert (=> b!336203 m!340015))

(assert (=> b!336203 m!340019))

(declare-fun m!340091 () Bool)

(assert (=> bm!26347 m!340091))

(assert (=> b!336073 d!70687))

(declare-fun b!336218 () Bool)

(declare-fun c!52266 () Bool)

(declare-fun lt!160155 () (_ BitVec 64))

(assert (=> b!336218 (= c!52266 (= lt!160155 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!206381 () SeekEntryResult!3200)

(declare-fun e!206382 () SeekEntryResult!3200)

(assert (=> b!336218 (= e!206381 e!206382)))

(declare-fun b!336219 () Bool)

(declare-fun e!206380 () SeekEntryResult!3200)

(assert (=> b!336219 (= e!206380 e!206381)))

(declare-fun lt!160156 () SeekEntryResult!3200)

(assert (=> b!336219 (= lt!160155 (select (arr!8279 _keys!1895) (index!14981 lt!160156)))))

(declare-fun c!52265 () Bool)

(assert (=> b!336219 (= c!52265 (= lt!160155 k0!1348))))

(declare-fun b!336220 () Bool)

(assert (=> b!336220 (= e!206381 (Found!3200 (index!14981 lt!160156)))))

(declare-fun b!336221 () Bool)

(assert (=> b!336221 (= e!206382 (MissingZero!3200 (index!14981 lt!160156)))))

(declare-fun d!70689 () Bool)

(declare-fun lt!160154 () SeekEntryResult!3200)

(assert (=> d!70689 (and (or ((_ is Undefined!3200) lt!160154) (not ((_ is Found!3200) lt!160154)) (and (bvsge (index!14980 lt!160154) #b00000000000000000000000000000000) (bvslt (index!14980 lt!160154) (size!8631 _keys!1895)))) (or ((_ is Undefined!3200) lt!160154) ((_ is Found!3200) lt!160154) (not ((_ is MissingZero!3200) lt!160154)) (and (bvsge (index!14979 lt!160154) #b00000000000000000000000000000000) (bvslt (index!14979 lt!160154) (size!8631 _keys!1895)))) (or ((_ is Undefined!3200) lt!160154) ((_ is Found!3200) lt!160154) ((_ is MissingZero!3200) lt!160154) (not ((_ is MissingVacant!3200) lt!160154)) (and (bvsge (index!14982 lt!160154) #b00000000000000000000000000000000) (bvslt (index!14982 lt!160154) (size!8631 _keys!1895)))) (or ((_ is Undefined!3200) lt!160154) (ite ((_ is Found!3200) lt!160154) (= (select (arr!8279 _keys!1895) (index!14980 lt!160154)) k0!1348) (ite ((_ is MissingZero!3200) lt!160154) (= (select (arr!8279 _keys!1895) (index!14979 lt!160154)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3200) lt!160154) (= (select (arr!8279 _keys!1895) (index!14982 lt!160154)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70689 (= lt!160154 e!206380)))

(declare-fun c!52264 () Bool)

(assert (=> d!70689 (= c!52264 (and ((_ is Intermediate!3200) lt!160156) (undefined!4012 lt!160156)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17499 (_ BitVec 32)) SeekEntryResult!3200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70689 (= lt!160156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70689 (validMask!0 mask!2385)))

(assert (=> d!70689 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160154)))

(declare-fun b!336222 () Bool)

(assert (=> b!336222 (= e!206380 Undefined!3200)))

(declare-fun b!336223 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17499 (_ BitVec 32)) SeekEntryResult!3200)

(assert (=> b!336223 (= e!206382 (seekKeyOrZeroReturnVacant!0 (x!33496 lt!160156) (index!14981 lt!160156) (index!14981 lt!160156) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!70689 c!52264) b!336222))

(assert (= (and d!70689 (not c!52264)) b!336219))

(assert (= (and b!336219 c!52265) b!336220))

(assert (= (and b!336219 (not c!52265)) b!336218))

(assert (= (and b!336218 c!52266) b!336221))

(assert (= (and b!336218 (not c!52266)) b!336223))

(declare-fun m!340093 () Bool)

(assert (=> b!336219 m!340093))

(declare-fun m!340095 () Bool)

(assert (=> d!70689 m!340095))

(declare-fun m!340097 () Bool)

(assert (=> d!70689 m!340097))

(declare-fun m!340099 () Bool)

(assert (=> d!70689 m!340099))

(declare-fun m!340101 () Bool)

(assert (=> d!70689 m!340101))

(declare-fun m!340103 () Bool)

(assert (=> d!70689 m!340103))

(assert (=> d!70689 m!339975))

(assert (=> d!70689 m!340099))

(declare-fun m!340105 () Bool)

(assert (=> b!336223 m!340105))

(assert (=> b!336077 d!70689))

(declare-fun b!336231 () Bool)

(declare-fun e!206388 () Bool)

(assert (=> b!336231 (= e!206388 tp_is_empty!6951)))

(declare-fun mapIsEmpty!11832 () Bool)

(declare-fun mapRes!11832 () Bool)

(assert (=> mapIsEmpty!11832 mapRes!11832))

(declare-fun b!336230 () Bool)

(declare-fun e!206387 () Bool)

(assert (=> b!336230 (= e!206387 tp_is_empty!6951)))

(declare-fun condMapEmpty!11832 () Bool)

(declare-fun mapDefault!11832 () ValueCell!3132)

(assert (=> mapNonEmpty!11826 (= condMapEmpty!11832 (= mapRest!11826 ((as const (Array (_ BitVec 32) ValueCell!3132)) mapDefault!11832)))))

(assert (=> mapNonEmpty!11826 (= tp!24504 (and e!206388 mapRes!11832))))

(declare-fun mapNonEmpty!11832 () Bool)

(declare-fun tp!24513 () Bool)

(assert (=> mapNonEmpty!11832 (= mapRes!11832 (and tp!24513 e!206387))))

(declare-fun mapKey!11832 () (_ BitVec 32))

(declare-fun mapRest!11832 () (Array (_ BitVec 32) ValueCell!3132))

(declare-fun mapValue!11832 () ValueCell!3132)

(assert (=> mapNonEmpty!11832 (= mapRest!11826 (store mapRest!11832 mapKey!11832 mapValue!11832))))

(assert (= (and mapNonEmpty!11826 condMapEmpty!11832) mapIsEmpty!11832))

(assert (= (and mapNonEmpty!11826 (not condMapEmpty!11832)) mapNonEmpty!11832))

(assert (= (and mapNonEmpty!11832 ((_ is ValueCellFull!3132) mapValue!11832)) b!336230))

(assert (= (and mapNonEmpty!11826 ((_ is ValueCellFull!3132) mapDefault!11832)) b!336231))

(declare-fun m!340107 () Bool)

(assert (=> mapNonEmpty!11832 m!340107))

(declare-fun b_lambda!8409 () Bool)

(assert (= b_lambda!8407 (or (and start!33782 b_free!6999) b_lambda!8409)))

(check-sat (not b!336115) (not b!336116) (not b_next!6999) (not b_lambda!8409) tp_is_empty!6951 (not bm!26343) (not bm!26323) (not b!336171) (not b!336202) (not b!336176) (not d!70689) (not b!336128) (not d!70675) (not b!336180) (not b!336185) b_and!14185 (not bm!26344) (not b!336181) (not b!336182) (not bm!26338) (not bm!26347) (not b!336223) (not d!70677) (not b!336203) (not mapNonEmpty!11832) (not b!336189) (not b!336119) (not bm!26342) (not b!336186) (not b!336126))
(check-sat b_and!14185 (not b_next!6999))
