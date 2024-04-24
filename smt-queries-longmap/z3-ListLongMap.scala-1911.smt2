; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34016 () Bool)

(assert start!34016)

(declare-fun b_free!7135 () Bool)

(declare-fun b_next!7135 () Bool)

(assert (=> start!34016 (= b_free!7135 (not b_next!7135))))

(declare-fun tp!24927 () Bool)

(declare-fun b_and!14341 () Bool)

(assert (=> start!34016 (= tp!24927 b_and!14341)))

(declare-fun b!339016 () Bool)

(declare-datatypes ((Unit!10515 0))(
  ( (Unit!10516) )
))
(declare-fun e!208002 () Unit!10515)

(declare-fun Unit!10517 () Unit!10515)

(assert (=> b!339016 (= e!208002 Unit!10517)))

(declare-fun mapNonEmpty!12045 () Bool)

(declare-fun mapRes!12045 () Bool)

(declare-fun tp!24926 () Bool)

(declare-fun e!208000 () Bool)

(assert (=> mapNonEmpty!12045 (= mapRes!12045 (and tp!24926 e!208000))))

(declare-datatypes ((V!10427 0))(
  ( (V!10428 (val!3588 Int)) )
))
(declare-datatypes ((ValueCell!3200 0))(
  ( (ValueCellFull!3200 (v!5757 V!10427)) (EmptyCell!3200) )
))
(declare-fun mapRest!12045 () (Array (_ BitVec 32) ValueCell!3200))

(declare-fun mapValue!12045 () ValueCell!3200)

(declare-fun mapKey!12045 () (_ BitVec 32))

(declare-datatypes ((array!17754 0))(
  ( (array!17755 (arr!8401 (Array (_ BitVec 32) ValueCell!3200)) (size!8753 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17754)

(assert (=> mapNonEmpty!12045 (= (arr!8401 _values!1525) (store mapRest!12045 mapKey!12045 mapValue!12045))))

(declare-fun res!187292 () Bool)

(declare-fun e!208001 () Bool)

(assert (=> start!34016 (=> (not res!187292) (not e!208001))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34016 (= res!187292 (validMask!0 mask!2385))))

(assert (=> start!34016 e!208001))

(assert (=> start!34016 true))

(declare-fun tp_is_empty!7087 () Bool)

(assert (=> start!34016 tp_is_empty!7087))

(assert (=> start!34016 tp!24927))

(declare-fun e!207997 () Bool)

(declare-fun array_inv!6232 (array!17754) Bool)

(assert (=> start!34016 (and (array_inv!6232 _values!1525) e!207997)))

(declare-datatypes ((array!17756 0))(
  ( (array!17757 (arr!8402 (Array (_ BitVec 32) (_ BitVec 64))) (size!8754 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17756)

(declare-fun array_inv!6233 (array!17756) Bool)

(assert (=> start!34016 (array_inv!6233 _keys!1895)))

(declare-fun b!339017 () Bool)

(declare-fun res!187298 () Bool)

(assert (=> b!339017 (=> (not res!187298) (not e!208001))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10427)

(declare-fun zeroValue!1467 () V!10427)

(declare-datatypes ((tuple2!5118 0))(
  ( (tuple2!5119 (_1!2570 (_ BitVec 64)) (_2!2570 V!10427)) )
))
(declare-datatypes ((List!4727 0))(
  ( (Nil!4724) (Cons!4723 (h!5579 tuple2!5118) (t!9819 List!4727)) )
))
(declare-datatypes ((ListLongMap!4033 0))(
  ( (ListLongMap!4034 (toList!2032 List!4727)) )
))
(declare-fun contains!2101 (ListLongMap!4033 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1561 (array!17756 array!17754 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 32) Int) ListLongMap!4033)

(assert (=> b!339017 (= res!187298 (not (contains!2101 (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12045 () Bool)

(assert (=> mapIsEmpty!12045 mapRes!12045))

(declare-fun b!339018 () Bool)

(declare-fun e!207999 () Bool)

(declare-fun e!208003 () Bool)

(assert (=> b!339018 (= e!207999 e!208003)))

(declare-fun res!187296 () Bool)

(assert (=> b!339018 (=> (not res!187296) (not e!208003))))

(declare-fun lt!161063 () Bool)

(assert (=> b!339018 (= res!187296 (not lt!161063))))

(declare-fun lt!161064 () Unit!10515)

(assert (=> b!339018 (= lt!161064 e!208002)))

(declare-fun c!52478 () Bool)

(assert (=> b!339018 (= c!52478 lt!161063)))

(declare-fun arrayContainsKey!0 (array!17756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339018 (= lt!161063 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339019 () Bool)

(declare-fun res!187293 () Bool)

(assert (=> b!339019 (=> (not res!187293) (not e!208001))))

(assert (=> b!339019 (= res!187293 (and (= (size!8753 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8754 _keys!1895) (size!8753 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339020 () Bool)

(declare-fun res!187294 () Bool)

(assert (=> b!339020 (=> (not res!187294) (not e!208001))))

(declare-datatypes ((List!4728 0))(
  ( (Nil!4725) (Cons!4724 (h!5580 (_ BitVec 64)) (t!9820 List!4728)) )
))
(declare-fun arrayNoDuplicates!0 (array!17756 (_ BitVec 32) List!4728) Bool)

(assert (=> b!339020 (= res!187294 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4725))))

(declare-fun b!339021 () Bool)

(declare-fun res!187290 () Bool)

(assert (=> b!339021 (=> (not res!187290) (not e!208001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339021 (= res!187290 (validKeyInArray!0 k0!1348))))

(declare-fun b!339022 () Bool)

(declare-fun res!187297 () Bool)

(assert (=> b!339022 (=> (not res!187297) (not e!208003))))

(declare-datatypes ((SeekEntryResult!3204 0))(
  ( (MissingZero!3204 (index!14995 (_ BitVec 32))) (Found!3204 (index!14996 (_ BitVec 32))) (Intermediate!3204 (undefined!4016 Bool) (index!14997 (_ BitVec 32)) (x!33731 (_ BitVec 32))) (Undefined!3204) (MissingVacant!3204 (index!14998 (_ BitVec 32))) )
))
(declare-fun lt!161062 () SeekEntryResult!3204)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!339022 (= res!187297 (inRange!0 (index!14995 lt!161062) mask!2385))))

(declare-fun b!339023 () Bool)

(declare-fun Unit!10518 () Unit!10515)

(assert (=> b!339023 (= e!208002 Unit!10518)))

(declare-fun lt!161065 () Unit!10515)

(declare-fun lemmaArrayContainsKeyThenInListMap!288 (array!17756 array!17754 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 64) (_ BitVec 32) Int) Unit!10515)

(declare-fun arrayScanForKey!0 (array!17756 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339023 (= lt!161065 (lemmaArrayContainsKeyThenInListMap!288 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339023 false))

(declare-fun b!339024 () Bool)

(assert (=> b!339024 (= e!208001 e!207999)))

(declare-fun res!187295 () Bool)

(assert (=> b!339024 (=> (not res!187295) (not e!207999))))

(get-info :version)

(assert (=> b!339024 (= res!187295 (and (not ((_ is Found!3204) lt!161062)) ((_ is MissingZero!3204) lt!161062)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17756 (_ BitVec 32)) SeekEntryResult!3204)

(assert (=> b!339024 (= lt!161062 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339025 () Bool)

(declare-fun e!207998 () Bool)

(assert (=> b!339025 (= e!207998 tp_is_empty!7087)))

(declare-fun b!339026 () Bool)

(declare-fun res!187291 () Bool)

(assert (=> b!339026 (=> (not res!187291) (not e!208001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17756 (_ BitVec 32)) Bool)

(assert (=> b!339026 (= res!187291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339027 () Bool)

(assert (=> b!339027 (= e!207997 (and e!207998 mapRes!12045))))

(declare-fun condMapEmpty!12045 () Bool)

(declare-fun mapDefault!12045 () ValueCell!3200)

(assert (=> b!339027 (= condMapEmpty!12045 (= (arr!8401 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3200)) mapDefault!12045)))))

(declare-fun b!339028 () Bool)

(assert (=> b!339028 (= e!208003 (and (= (select (arr!8402 _keys!1895) (index!14995 lt!161062)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)) (bvsge (size!8754 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!339029 () Bool)

(assert (=> b!339029 (= e!208000 tp_is_empty!7087)))

(assert (= (and start!34016 res!187292) b!339019))

(assert (= (and b!339019 res!187293) b!339026))

(assert (= (and b!339026 res!187291) b!339020))

(assert (= (and b!339020 res!187294) b!339021))

(assert (= (and b!339021 res!187290) b!339017))

(assert (= (and b!339017 res!187298) b!339024))

(assert (= (and b!339024 res!187295) b!339018))

(assert (= (and b!339018 c!52478) b!339023))

(assert (= (and b!339018 (not c!52478)) b!339016))

(assert (= (and b!339018 res!187296) b!339022))

(assert (= (and b!339022 res!187297) b!339028))

(assert (= (and b!339027 condMapEmpty!12045) mapIsEmpty!12045))

(assert (= (and b!339027 (not condMapEmpty!12045)) mapNonEmpty!12045))

(assert (= (and mapNonEmpty!12045 ((_ is ValueCellFull!3200) mapValue!12045)) b!339029))

(assert (= (and b!339027 ((_ is ValueCellFull!3200) mapDefault!12045)) b!339025))

(assert (= start!34016 b!339027))

(declare-fun m!342367 () Bool)

(assert (=> b!339024 m!342367))

(declare-fun m!342369 () Bool)

(assert (=> mapNonEmpty!12045 m!342369))

(declare-fun m!342371 () Bool)

(assert (=> b!339018 m!342371))

(declare-fun m!342373 () Bool)

(assert (=> b!339017 m!342373))

(assert (=> b!339017 m!342373))

(declare-fun m!342375 () Bool)

(assert (=> b!339017 m!342375))

(declare-fun m!342377 () Bool)

(assert (=> b!339028 m!342377))

(declare-fun m!342379 () Bool)

(assert (=> start!34016 m!342379))

(declare-fun m!342381 () Bool)

(assert (=> start!34016 m!342381))

(declare-fun m!342383 () Bool)

(assert (=> start!34016 m!342383))

(declare-fun m!342385 () Bool)

(assert (=> b!339020 m!342385))

(declare-fun m!342387 () Bool)

(assert (=> b!339026 m!342387))

(declare-fun m!342389 () Bool)

(assert (=> b!339023 m!342389))

(assert (=> b!339023 m!342389))

(declare-fun m!342391 () Bool)

(assert (=> b!339023 m!342391))

(declare-fun m!342393 () Bool)

(assert (=> b!339021 m!342393))

(declare-fun m!342395 () Bool)

(assert (=> b!339022 m!342395))

(check-sat (not b!339017) (not b!339026) (not b!339022) tp_is_empty!7087 (not b!339018) (not b!339020) b_and!14341 (not b_next!7135) (not b!339023) (not b!339021) (not mapNonEmpty!12045) (not b!339024) (not start!34016))
(check-sat b_and!14341 (not b_next!7135))
(get-model)

(declare-fun bm!26444 () Bool)

(declare-fun call!26447 () Bool)

(declare-fun c!52487 () Bool)

(assert (=> bm!26444 (= call!26447 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52487 (Cons!4724 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000) Nil!4725) Nil!4725)))))

(declare-fun b!339124 () Bool)

(declare-fun e!208063 () Bool)

(declare-fun e!208062 () Bool)

(assert (=> b!339124 (= e!208063 e!208062)))

(assert (=> b!339124 (= c!52487 (validKeyInArray!0 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339125 () Bool)

(assert (=> b!339125 (= e!208062 call!26447)))

(declare-fun b!339126 () Bool)

(assert (=> b!339126 (= e!208062 call!26447)))

(declare-fun d!70859 () Bool)

(declare-fun res!187361 () Bool)

(declare-fun e!208061 () Bool)

(assert (=> d!70859 (=> res!187361 e!208061)))

(assert (=> d!70859 (= res!187361 (bvsge #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(assert (=> d!70859 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4725) e!208061)))

(declare-fun b!339127 () Bool)

(assert (=> b!339127 (= e!208061 e!208063)))

(declare-fun res!187360 () Bool)

(assert (=> b!339127 (=> (not res!187360) (not e!208063))))

(declare-fun e!208064 () Bool)

(assert (=> b!339127 (= res!187360 (not e!208064))))

(declare-fun res!187359 () Bool)

(assert (=> b!339127 (=> (not res!187359) (not e!208064))))

(assert (=> b!339127 (= res!187359 (validKeyInArray!0 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339128 () Bool)

(declare-fun contains!2103 (List!4728 (_ BitVec 64)) Bool)

(assert (=> b!339128 (= e!208064 (contains!2103 Nil!4725 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70859 (not res!187361)) b!339127))

(assert (= (and b!339127 res!187359) b!339128))

(assert (= (and b!339127 res!187360) b!339124))

(assert (= (and b!339124 c!52487) b!339126))

(assert (= (and b!339124 (not c!52487)) b!339125))

(assert (= (or b!339126 b!339125) bm!26444))

(declare-fun m!342457 () Bool)

(assert (=> bm!26444 m!342457))

(declare-fun m!342459 () Bool)

(assert (=> bm!26444 m!342459))

(assert (=> b!339124 m!342457))

(assert (=> b!339124 m!342457))

(declare-fun m!342461 () Bool)

(assert (=> b!339124 m!342461))

(assert (=> b!339127 m!342457))

(assert (=> b!339127 m!342457))

(assert (=> b!339127 m!342461))

(assert (=> b!339128 m!342457))

(assert (=> b!339128 m!342457))

(declare-fun m!342463 () Bool)

(assert (=> b!339128 m!342463))

(assert (=> b!339020 d!70859))

(declare-fun d!70861 () Bool)

(declare-fun e!208070 () Bool)

(assert (=> d!70861 e!208070))

(declare-fun res!187364 () Bool)

(assert (=> d!70861 (=> res!187364 e!208070)))

(declare-fun lt!161101 () Bool)

(assert (=> d!70861 (= res!187364 (not lt!161101))))

(declare-fun lt!161100 () Bool)

(assert (=> d!70861 (= lt!161101 lt!161100)))

(declare-fun lt!161099 () Unit!10515)

(declare-fun e!208069 () Unit!10515)

(assert (=> d!70861 (= lt!161099 e!208069)))

(declare-fun c!52490 () Bool)

(assert (=> d!70861 (= c!52490 lt!161100)))

(declare-fun containsKey!322 (List!4727 (_ BitVec 64)) Bool)

(assert (=> d!70861 (= lt!161100 (containsKey!322 (toList!2032 (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70861 (= (contains!2101 (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161101)))

(declare-fun b!339135 () Bool)

(declare-fun lt!161098 () Unit!10515)

(assert (=> b!339135 (= e!208069 lt!161098)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!270 (List!4727 (_ BitVec 64)) Unit!10515)

(assert (=> b!339135 (= lt!161098 (lemmaContainsKeyImpliesGetValueByKeyDefined!270 (toList!2032 (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!337 0))(
  ( (Some!336 (v!5760 V!10427)) (None!335) )
))
(declare-fun isDefined!271 (Option!337) Bool)

(declare-fun getValueByKey!331 (List!4727 (_ BitVec 64)) Option!337)

(assert (=> b!339135 (isDefined!271 (getValueByKey!331 (toList!2032 (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!339136 () Bool)

(declare-fun Unit!10526 () Unit!10515)

(assert (=> b!339136 (= e!208069 Unit!10526)))

(declare-fun b!339137 () Bool)

(assert (=> b!339137 (= e!208070 (isDefined!271 (getValueByKey!331 (toList!2032 (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70861 c!52490) b!339135))

(assert (= (and d!70861 (not c!52490)) b!339136))

(assert (= (and d!70861 (not res!187364)) b!339137))

(declare-fun m!342465 () Bool)

(assert (=> d!70861 m!342465))

(declare-fun m!342467 () Bool)

(assert (=> b!339135 m!342467))

(declare-fun m!342469 () Bool)

(assert (=> b!339135 m!342469))

(assert (=> b!339135 m!342469))

(declare-fun m!342471 () Bool)

(assert (=> b!339135 m!342471))

(assert (=> b!339137 m!342469))

(assert (=> b!339137 m!342469))

(assert (=> b!339137 m!342471))

(assert (=> b!339017 d!70861))

(declare-fun b!339180 () Bool)

(declare-fun e!208105 () Bool)

(declare-fun call!26464 () Bool)

(assert (=> b!339180 (= e!208105 (not call!26464))))

(declare-fun b!339181 () Bool)

(declare-fun c!52507 () Bool)

(assert (=> b!339181 (= c!52507 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!208109 () ListLongMap!4033)

(declare-fun e!208098 () ListLongMap!4033)

(assert (=> b!339181 (= e!208109 e!208098)))

(declare-fun b!339182 () Bool)

(declare-fun e!208101 () Bool)

(assert (=> b!339182 (= e!208105 e!208101)))

(declare-fun res!187391 () Bool)

(assert (=> b!339182 (= res!187391 call!26464)))

(assert (=> b!339182 (=> (not res!187391) (not e!208101))))

(declare-fun b!339183 () Bool)

(declare-fun e!208106 () ListLongMap!4033)

(declare-fun call!26468 () ListLongMap!4033)

(declare-fun +!723 (ListLongMap!4033 tuple2!5118) ListLongMap!4033)

(assert (=> b!339183 (= e!208106 (+!723 call!26468 (tuple2!5119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!339184 () Bool)

(declare-fun e!208099 () Unit!10515)

(declare-fun lt!161164 () Unit!10515)

(assert (=> b!339184 (= e!208099 lt!161164)))

(declare-fun lt!161150 () ListLongMap!4033)

(declare-fun getCurrentListMapNoExtraKeys!588 (array!17756 array!17754 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 32) Int) ListLongMap!4033)

(assert (=> b!339184 (= lt!161150 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161158 () (_ BitVec 64))

(assert (=> b!339184 (= lt!161158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161149 () (_ BitVec 64))

(assert (=> b!339184 (= lt!161149 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161147 () Unit!10515)

(declare-fun addStillContains!248 (ListLongMap!4033 (_ BitVec 64) V!10427 (_ BitVec 64)) Unit!10515)

(assert (=> b!339184 (= lt!161147 (addStillContains!248 lt!161150 lt!161158 zeroValue!1467 lt!161149))))

(assert (=> b!339184 (contains!2101 (+!723 lt!161150 (tuple2!5119 lt!161158 zeroValue!1467)) lt!161149)))

(declare-fun lt!161160 () Unit!10515)

(assert (=> b!339184 (= lt!161160 lt!161147)))

(declare-fun lt!161156 () ListLongMap!4033)

(assert (=> b!339184 (= lt!161156 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161161 () (_ BitVec 64))

(assert (=> b!339184 (= lt!161161 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161163 () (_ BitVec 64))

(assert (=> b!339184 (= lt!161163 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161166 () Unit!10515)

(declare-fun addApplyDifferent!248 (ListLongMap!4033 (_ BitVec 64) V!10427 (_ BitVec 64)) Unit!10515)

(assert (=> b!339184 (= lt!161166 (addApplyDifferent!248 lt!161156 lt!161161 minValue!1467 lt!161163))))

(declare-fun apply!272 (ListLongMap!4033 (_ BitVec 64)) V!10427)

(assert (=> b!339184 (= (apply!272 (+!723 lt!161156 (tuple2!5119 lt!161161 minValue!1467)) lt!161163) (apply!272 lt!161156 lt!161163))))

(declare-fun lt!161152 () Unit!10515)

(assert (=> b!339184 (= lt!161152 lt!161166)))

(declare-fun lt!161151 () ListLongMap!4033)

(assert (=> b!339184 (= lt!161151 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161148 () (_ BitVec 64))

(assert (=> b!339184 (= lt!161148 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161167 () (_ BitVec 64))

(assert (=> b!339184 (= lt!161167 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161155 () Unit!10515)

(assert (=> b!339184 (= lt!161155 (addApplyDifferent!248 lt!161151 lt!161148 zeroValue!1467 lt!161167))))

(assert (=> b!339184 (= (apply!272 (+!723 lt!161151 (tuple2!5119 lt!161148 zeroValue!1467)) lt!161167) (apply!272 lt!161151 lt!161167))))

(declare-fun lt!161146 () Unit!10515)

(assert (=> b!339184 (= lt!161146 lt!161155)))

(declare-fun lt!161154 () ListLongMap!4033)

(assert (=> b!339184 (= lt!161154 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161153 () (_ BitVec 64))

(assert (=> b!339184 (= lt!161153 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161157 () (_ BitVec 64))

(assert (=> b!339184 (= lt!161157 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!339184 (= lt!161164 (addApplyDifferent!248 lt!161154 lt!161153 minValue!1467 lt!161157))))

(assert (=> b!339184 (= (apply!272 (+!723 lt!161154 (tuple2!5119 lt!161153 minValue!1467)) lt!161157) (apply!272 lt!161154 lt!161157))))

(declare-fun c!52508 () Bool)

(declare-fun call!26465 () ListLongMap!4033)

(declare-fun bm!26459 () Bool)

(declare-fun c!52506 () Bool)

(declare-fun call!26467 () ListLongMap!4033)

(declare-fun call!26466 () ListLongMap!4033)

(assert (=> bm!26459 (= call!26468 (+!723 (ite c!52506 call!26465 (ite c!52508 call!26467 call!26466)) (ite (or c!52506 c!52508) (tuple2!5119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26460 () Bool)

(assert (=> bm!26460 (= call!26465 (getCurrentListMapNoExtraKeys!588 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26461 () Bool)

(declare-fun lt!161162 () ListLongMap!4033)

(assert (=> bm!26461 (= call!26464 (contains!2101 lt!161162 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26462 () Bool)

(declare-fun call!26462 () Bool)

(assert (=> bm!26462 (= call!26462 (contains!2101 lt!161162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339185 () Bool)

(declare-fun e!208107 () Bool)

(declare-fun get!4586 (ValueCell!3200 V!10427) V!10427)

(declare-fun dynLambda!615 (Int (_ BitVec 64)) V!10427)

(assert (=> b!339185 (= e!208107 (= (apply!272 lt!161162 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000)) (get!4586 (select (arr!8401 _values!1525) #b00000000000000000000000000000000) (dynLambda!615 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339185 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8753 _values!1525)))))

(assert (=> b!339185 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(declare-fun b!339186 () Bool)

(declare-fun call!26463 () ListLongMap!4033)

(assert (=> b!339186 (= e!208098 call!26463)))

(declare-fun b!339187 () Bool)

(declare-fun e!208097 () Bool)

(assert (=> b!339187 (= e!208097 (validKeyInArray!0 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339188 () Bool)

(declare-fun Unit!10527 () Unit!10515)

(assert (=> b!339188 (= e!208099 Unit!10527)))

(declare-fun b!339189 () Bool)

(assert (=> b!339189 (= e!208109 call!26463)))

(declare-fun b!339190 () Bool)

(declare-fun res!187386 () Bool)

(declare-fun e!208100 () Bool)

(assert (=> b!339190 (=> (not res!187386) (not e!208100))))

(declare-fun e!208103 () Bool)

(assert (=> b!339190 (= res!187386 e!208103)))

(declare-fun c!52505 () Bool)

(assert (=> b!339190 (= c!52505 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26464 () Bool)

(assert (=> bm!26464 (= call!26466 call!26467)))

(declare-fun b!339191 () Bool)

(assert (=> b!339191 (= e!208106 e!208109)))

(assert (=> b!339191 (= c!52508 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!339192 () Bool)

(declare-fun res!187389 () Bool)

(assert (=> b!339192 (=> (not res!187389) (not e!208100))))

(declare-fun e!208104 () Bool)

(assert (=> b!339192 (= res!187389 e!208104)))

(declare-fun res!187383 () Bool)

(assert (=> b!339192 (=> res!187383 e!208104)))

(declare-fun e!208102 () Bool)

(assert (=> b!339192 (= res!187383 (not e!208102))))

(declare-fun res!187384 () Bool)

(assert (=> b!339192 (=> (not res!187384) (not e!208102))))

(assert (=> b!339192 (= res!187384 (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(declare-fun b!339193 () Bool)

(assert (=> b!339193 (= e!208102 (validKeyInArray!0 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339194 () Bool)

(assert (=> b!339194 (= e!208101 (= (apply!272 lt!161162 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!339195 () Bool)

(declare-fun e!208108 () Bool)

(assert (=> b!339195 (= e!208108 (= (apply!272 lt!161162 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!339196 () Bool)

(assert (=> b!339196 (= e!208103 e!208108)))

(declare-fun res!187388 () Bool)

(assert (=> b!339196 (= res!187388 call!26462)))

(assert (=> b!339196 (=> (not res!187388) (not e!208108))))

(declare-fun b!339197 () Bool)

(assert (=> b!339197 (= e!208098 call!26466)))

(declare-fun b!339198 () Bool)

(assert (=> b!339198 (= e!208100 e!208105)))

(declare-fun c!52503 () Bool)

(assert (=> b!339198 (= c!52503 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26465 () Bool)

(assert (=> bm!26465 (= call!26463 call!26468)))

(declare-fun b!339199 () Bool)

(assert (=> b!339199 (= e!208103 (not call!26462))))

(declare-fun b!339200 () Bool)

(assert (=> b!339200 (= e!208104 e!208107)))

(declare-fun res!187385 () Bool)

(assert (=> b!339200 (=> (not res!187385) (not e!208107))))

(assert (=> b!339200 (= res!187385 (contains!2101 lt!161162 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!339200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(declare-fun d!70863 () Bool)

(assert (=> d!70863 e!208100))

(declare-fun res!187387 () Bool)

(assert (=> d!70863 (=> (not res!187387) (not e!208100))))

(assert (=> d!70863 (= res!187387 (or (bvsge #b00000000000000000000000000000000 (size!8754 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))))

(declare-fun lt!161165 () ListLongMap!4033)

(assert (=> d!70863 (= lt!161162 lt!161165)))

(declare-fun lt!161159 () Unit!10515)

(assert (=> d!70863 (= lt!161159 e!208099)))

(declare-fun c!52504 () Bool)

(assert (=> d!70863 (= c!52504 e!208097)))

(declare-fun res!187390 () Bool)

(assert (=> d!70863 (=> (not res!187390) (not e!208097))))

(assert (=> d!70863 (= res!187390 (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(assert (=> d!70863 (= lt!161165 e!208106)))

(assert (=> d!70863 (= c!52506 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70863 (validMask!0 mask!2385)))

(assert (=> d!70863 (= (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161162)))

(declare-fun bm!26463 () Bool)

(assert (=> bm!26463 (= call!26467 call!26465)))

(assert (= (and d!70863 c!52506) b!339183))

(assert (= (and d!70863 (not c!52506)) b!339191))

(assert (= (and b!339191 c!52508) b!339189))

(assert (= (and b!339191 (not c!52508)) b!339181))

(assert (= (and b!339181 c!52507) b!339186))

(assert (= (and b!339181 (not c!52507)) b!339197))

(assert (= (or b!339186 b!339197) bm!26464))

(assert (= (or b!339189 bm!26464) bm!26463))

(assert (= (or b!339189 b!339186) bm!26465))

(assert (= (or b!339183 bm!26463) bm!26460))

(assert (= (or b!339183 bm!26465) bm!26459))

(assert (= (and d!70863 res!187390) b!339187))

(assert (= (and d!70863 c!52504) b!339184))

(assert (= (and d!70863 (not c!52504)) b!339188))

(assert (= (and d!70863 res!187387) b!339192))

(assert (= (and b!339192 res!187384) b!339193))

(assert (= (and b!339192 (not res!187383)) b!339200))

(assert (= (and b!339200 res!187385) b!339185))

(assert (= (and b!339192 res!187389) b!339190))

(assert (= (and b!339190 c!52505) b!339196))

(assert (= (and b!339190 (not c!52505)) b!339199))

(assert (= (and b!339196 res!187388) b!339195))

(assert (= (or b!339196 b!339199) bm!26462))

(assert (= (and b!339190 res!187386) b!339198))

(assert (= (and b!339198 c!52503) b!339182))

(assert (= (and b!339198 (not c!52503)) b!339180))

(assert (= (and b!339182 res!187391) b!339194))

(assert (= (or b!339182 b!339180) bm!26461))

(declare-fun b_lambda!8449 () Bool)

(assert (=> (not b_lambda!8449) (not b!339185)))

(declare-fun t!9823 () Bool)

(declare-fun tb!3051 () Bool)

(assert (=> (and start!34016 (= defaultEntry!1528 defaultEntry!1528) t!9823) tb!3051))

(declare-fun result!5499 () Bool)

(assert (=> tb!3051 (= result!5499 tp_is_empty!7087)))

(assert (=> b!339185 t!9823))

(declare-fun b_and!14347 () Bool)

(assert (= b_and!14341 (and (=> t!9823 result!5499) b_and!14347)))

(assert (=> b!339187 m!342457))

(assert (=> b!339187 m!342457))

(assert (=> b!339187 m!342461))

(declare-fun m!342473 () Bool)

(assert (=> b!339195 m!342473))

(declare-fun m!342475 () Bool)

(assert (=> bm!26459 m!342475))

(assert (=> d!70863 m!342379))

(declare-fun m!342477 () Bool)

(assert (=> bm!26460 m!342477))

(declare-fun m!342479 () Bool)

(assert (=> bm!26461 m!342479))

(assert (=> b!339200 m!342457))

(assert (=> b!339200 m!342457))

(declare-fun m!342481 () Bool)

(assert (=> b!339200 m!342481))

(declare-fun m!342483 () Bool)

(assert (=> bm!26462 m!342483))

(declare-fun m!342485 () Bool)

(assert (=> b!339183 m!342485))

(declare-fun m!342487 () Bool)

(assert (=> b!339194 m!342487))

(assert (=> b!339185 m!342457))

(declare-fun m!342489 () Bool)

(assert (=> b!339185 m!342489))

(declare-fun m!342491 () Bool)

(assert (=> b!339185 m!342491))

(declare-fun m!342493 () Bool)

(assert (=> b!339185 m!342493))

(assert (=> b!339185 m!342493))

(assert (=> b!339185 m!342491))

(declare-fun m!342495 () Bool)

(assert (=> b!339185 m!342495))

(assert (=> b!339185 m!342457))

(assert (=> b!339184 m!342477))

(declare-fun m!342497 () Bool)

(assert (=> b!339184 m!342497))

(declare-fun m!342499 () Bool)

(assert (=> b!339184 m!342499))

(declare-fun m!342501 () Bool)

(assert (=> b!339184 m!342501))

(declare-fun m!342503 () Bool)

(assert (=> b!339184 m!342503))

(declare-fun m!342505 () Bool)

(assert (=> b!339184 m!342505))

(declare-fun m!342507 () Bool)

(assert (=> b!339184 m!342507))

(declare-fun m!342509 () Bool)

(assert (=> b!339184 m!342509))

(declare-fun m!342511 () Bool)

(assert (=> b!339184 m!342511))

(declare-fun m!342513 () Bool)

(assert (=> b!339184 m!342513))

(assert (=> b!339184 m!342499))

(declare-fun m!342515 () Bool)

(assert (=> b!339184 m!342515))

(declare-fun m!342517 () Bool)

(assert (=> b!339184 m!342517))

(assert (=> b!339184 m!342509))

(declare-fun m!342519 () Bool)

(assert (=> b!339184 m!342519))

(declare-fun m!342521 () Bool)

(assert (=> b!339184 m!342521))

(assert (=> b!339184 m!342497))

(declare-fun m!342523 () Bool)

(assert (=> b!339184 m!342523))

(assert (=> b!339184 m!342511))

(assert (=> b!339184 m!342457))

(declare-fun m!342525 () Bool)

(assert (=> b!339184 m!342525))

(assert (=> b!339193 m!342457))

(assert (=> b!339193 m!342457))

(assert (=> b!339193 m!342461))

(assert (=> b!339017 d!70863))

(declare-fun d!70865 () Bool)

(assert (=> d!70865 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339021 d!70865))

(declare-fun b!339211 () Bool)

(declare-fun e!208118 () Bool)

(declare-fun e!208117 () Bool)

(assert (=> b!339211 (= e!208118 e!208117)))

(declare-fun lt!161176 () (_ BitVec 64))

(assert (=> b!339211 (= lt!161176 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161174 () Unit!10515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17756 (_ BitVec 64) (_ BitVec 32)) Unit!10515)

(assert (=> b!339211 (= lt!161174 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161176 #b00000000000000000000000000000000))))

(assert (=> b!339211 (arrayContainsKey!0 _keys!1895 lt!161176 #b00000000000000000000000000000000)))

(declare-fun lt!161175 () Unit!10515)

(assert (=> b!339211 (= lt!161175 lt!161174)))

(declare-fun res!187397 () Bool)

(assert (=> b!339211 (= res!187397 (= (seekEntryOrOpen!0 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3204 #b00000000000000000000000000000000)))))

(assert (=> b!339211 (=> (not res!187397) (not e!208117))))

(declare-fun b!339212 () Bool)

(declare-fun call!26471 () Bool)

(assert (=> b!339212 (= e!208117 call!26471)))

(declare-fun bm!26468 () Bool)

(assert (=> bm!26468 (= call!26471 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!339214 () Bool)

(assert (=> b!339214 (= e!208118 call!26471)))

(declare-fun d!70867 () Bool)

(declare-fun res!187396 () Bool)

(declare-fun e!208116 () Bool)

(assert (=> d!70867 (=> res!187396 e!208116)))

(assert (=> d!70867 (= res!187396 (bvsge #b00000000000000000000000000000000 (size!8754 _keys!1895)))))

(assert (=> d!70867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208116)))

(declare-fun b!339213 () Bool)

(assert (=> b!339213 (= e!208116 e!208118)))

(declare-fun c!52511 () Bool)

(assert (=> b!339213 (= c!52511 (validKeyInArray!0 (select (arr!8402 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70867 (not res!187396)) b!339213))

(assert (= (and b!339213 c!52511) b!339211))

(assert (= (and b!339213 (not c!52511)) b!339214))

(assert (= (and b!339211 res!187397) b!339212))

(assert (= (or b!339212 b!339214) bm!26468))

(assert (=> b!339211 m!342457))

(declare-fun m!342527 () Bool)

(assert (=> b!339211 m!342527))

(declare-fun m!342529 () Bool)

(assert (=> b!339211 m!342529))

(assert (=> b!339211 m!342457))

(declare-fun m!342531 () Bool)

(assert (=> b!339211 m!342531))

(declare-fun m!342533 () Bool)

(assert (=> bm!26468 m!342533))

(assert (=> b!339213 m!342457))

(assert (=> b!339213 m!342457))

(assert (=> b!339213 m!342461))

(assert (=> b!339026 d!70867))

(declare-fun d!70869 () Bool)

(assert (=> d!70869 (contains!2101 (getCurrentListMap!1561 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!161179 () Unit!10515)

(declare-fun choose!1308 (array!17756 array!17754 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 64) (_ BitVec 32) Int) Unit!10515)

(assert (=> d!70869 (= lt!161179 (choose!1308 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70869 (validMask!0 mask!2385)))

(assert (=> d!70869 (= (lemmaArrayContainsKeyThenInListMap!288 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!161179)))

(declare-fun bs!11682 () Bool)

(assert (= bs!11682 d!70869))

(assert (=> bs!11682 m!342373))

(assert (=> bs!11682 m!342373))

(assert (=> bs!11682 m!342375))

(assert (=> bs!11682 m!342389))

(declare-fun m!342535 () Bool)

(assert (=> bs!11682 m!342535))

(assert (=> bs!11682 m!342379))

(assert (=> b!339023 d!70869))

(declare-fun d!70871 () Bool)

(declare-fun lt!161182 () (_ BitVec 32))

(assert (=> d!70871 (and (or (bvslt lt!161182 #b00000000000000000000000000000000) (bvsge lt!161182 (size!8754 _keys!1895)) (and (bvsge lt!161182 #b00000000000000000000000000000000) (bvslt lt!161182 (size!8754 _keys!1895)))) (bvsge lt!161182 #b00000000000000000000000000000000) (bvslt lt!161182 (size!8754 _keys!1895)) (= (select (arr!8402 _keys!1895) lt!161182) k0!1348))))

(declare-fun e!208121 () (_ BitVec 32))

(assert (=> d!70871 (= lt!161182 e!208121)))

(declare-fun c!52514 () Bool)

(assert (=> d!70871 (= c!52514 (= (select (arr!8402 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8754 _keys!1895)) (bvslt (size!8754 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70871 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!161182)))

(declare-fun b!339219 () Bool)

(assert (=> b!339219 (= e!208121 #b00000000000000000000000000000000)))

(declare-fun b!339220 () Bool)

(assert (=> b!339220 (= e!208121 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70871 c!52514) b!339219))

(assert (= (and d!70871 (not c!52514)) b!339220))

(declare-fun m!342537 () Bool)

(assert (=> d!70871 m!342537))

(assert (=> d!70871 m!342457))

(declare-fun m!342539 () Bool)

(assert (=> b!339220 m!342539))

(assert (=> b!339023 d!70871))

(declare-fun d!70873 () Bool)

(assert (=> d!70873 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34016 d!70873))

(declare-fun d!70875 () Bool)

(assert (=> d!70875 (= (array_inv!6232 _values!1525) (bvsge (size!8753 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34016 d!70875))

(declare-fun d!70877 () Bool)

(assert (=> d!70877 (= (array_inv!6233 _keys!1895) (bvsge (size!8754 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34016 d!70877))

(declare-fun d!70879 () Bool)

(assert (=> d!70879 (= (inRange!0 (index!14995 lt!161062) mask!2385) (and (bvsge (index!14995 lt!161062) #b00000000000000000000000000000000) (bvslt (index!14995 lt!161062) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!339022 d!70879))

(declare-fun b!339233 () Bool)

(declare-fun e!208128 () SeekEntryResult!3204)

(declare-fun lt!161191 () SeekEntryResult!3204)

(assert (=> b!339233 (= e!208128 (Found!3204 (index!14997 lt!161191)))))

(declare-fun b!339234 () Bool)

(declare-fun e!208130 () SeekEntryResult!3204)

(assert (=> b!339234 (= e!208130 e!208128)))

(declare-fun lt!161190 () (_ BitVec 64))

(assert (=> b!339234 (= lt!161190 (select (arr!8402 _keys!1895) (index!14997 lt!161191)))))

(declare-fun c!52522 () Bool)

(assert (=> b!339234 (= c!52522 (= lt!161190 k0!1348))))

(declare-fun b!339235 () Bool)

(declare-fun e!208129 () SeekEntryResult!3204)

(assert (=> b!339235 (= e!208129 (MissingZero!3204 (index!14997 lt!161191)))))

(declare-fun b!339236 () Bool)

(declare-fun c!52523 () Bool)

(assert (=> b!339236 (= c!52523 (= lt!161190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!339236 (= e!208128 e!208129)))

(declare-fun b!339237 () Bool)

(assert (=> b!339237 (= e!208130 Undefined!3204)))

(declare-fun d!70881 () Bool)

(declare-fun lt!161189 () SeekEntryResult!3204)

(assert (=> d!70881 (and (or ((_ is Undefined!3204) lt!161189) (not ((_ is Found!3204) lt!161189)) (and (bvsge (index!14996 lt!161189) #b00000000000000000000000000000000) (bvslt (index!14996 lt!161189) (size!8754 _keys!1895)))) (or ((_ is Undefined!3204) lt!161189) ((_ is Found!3204) lt!161189) (not ((_ is MissingZero!3204) lt!161189)) (and (bvsge (index!14995 lt!161189) #b00000000000000000000000000000000) (bvslt (index!14995 lt!161189) (size!8754 _keys!1895)))) (or ((_ is Undefined!3204) lt!161189) ((_ is Found!3204) lt!161189) ((_ is MissingZero!3204) lt!161189) (not ((_ is MissingVacant!3204) lt!161189)) (and (bvsge (index!14998 lt!161189) #b00000000000000000000000000000000) (bvslt (index!14998 lt!161189) (size!8754 _keys!1895)))) (or ((_ is Undefined!3204) lt!161189) (ite ((_ is Found!3204) lt!161189) (= (select (arr!8402 _keys!1895) (index!14996 lt!161189)) k0!1348) (ite ((_ is MissingZero!3204) lt!161189) (= (select (arr!8402 _keys!1895) (index!14995 lt!161189)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3204) lt!161189) (= (select (arr!8402 _keys!1895) (index!14998 lt!161189)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70881 (= lt!161189 e!208130)))

(declare-fun c!52521 () Bool)

(assert (=> d!70881 (= c!52521 (and ((_ is Intermediate!3204) lt!161191) (undefined!4016 lt!161191)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17756 (_ BitVec 32)) SeekEntryResult!3204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70881 (= lt!161191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70881 (validMask!0 mask!2385)))

(assert (=> d!70881 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161189)))

(declare-fun b!339238 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17756 (_ BitVec 32)) SeekEntryResult!3204)

(assert (=> b!339238 (= e!208129 (seekKeyOrZeroReturnVacant!0 (x!33731 lt!161191) (index!14997 lt!161191) (index!14997 lt!161191) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!70881 c!52521) b!339237))

(assert (= (and d!70881 (not c!52521)) b!339234))

(assert (= (and b!339234 c!52522) b!339233))

(assert (= (and b!339234 (not c!52522)) b!339236))

(assert (= (and b!339236 c!52523) b!339235))

(assert (= (and b!339236 (not c!52523)) b!339238))

(declare-fun m!342541 () Bool)

(assert (=> b!339234 m!342541))

(declare-fun m!342543 () Bool)

(assert (=> d!70881 m!342543))

(declare-fun m!342545 () Bool)

(assert (=> d!70881 m!342545))

(assert (=> d!70881 m!342545))

(declare-fun m!342547 () Bool)

(assert (=> d!70881 m!342547))

(assert (=> d!70881 m!342379))

(declare-fun m!342549 () Bool)

(assert (=> d!70881 m!342549))

(declare-fun m!342551 () Bool)

(assert (=> d!70881 m!342551))

(declare-fun m!342553 () Bool)

(assert (=> b!339238 m!342553))

(assert (=> b!339024 d!70881))

(declare-fun d!70883 () Bool)

(declare-fun res!187402 () Bool)

(declare-fun e!208135 () Bool)

(assert (=> d!70883 (=> res!187402 e!208135)))

(assert (=> d!70883 (= res!187402 (= (select (arr!8402 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70883 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!208135)))

(declare-fun b!339243 () Bool)

(declare-fun e!208136 () Bool)

(assert (=> b!339243 (= e!208135 e!208136)))

(declare-fun res!187403 () Bool)

(assert (=> b!339243 (=> (not res!187403) (not e!208136))))

(assert (=> b!339243 (= res!187403 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8754 _keys!1895)))))

(declare-fun b!339244 () Bool)

(assert (=> b!339244 (= e!208136 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70883 (not res!187402)) b!339243))

(assert (= (and b!339243 res!187403) b!339244))

(assert (=> d!70883 m!342457))

(declare-fun m!342555 () Bool)

(assert (=> b!339244 m!342555))

(assert (=> b!339018 d!70883))

(declare-fun mapIsEmpty!12054 () Bool)

(declare-fun mapRes!12054 () Bool)

(assert (=> mapIsEmpty!12054 mapRes!12054))

(declare-fun condMapEmpty!12054 () Bool)

(declare-fun mapDefault!12054 () ValueCell!3200)

(assert (=> mapNonEmpty!12045 (= condMapEmpty!12054 (= mapRest!12045 ((as const (Array (_ BitVec 32) ValueCell!3200)) mapDefault!12054)))))

(declare-fun e!208141 () Bool)

(assert (=> mapNonEmpty!12045 (= tp!24926 (and e!208141 mapRes!12054))))

(declare-fun b!339252 () Bool)

(assert (=> b!339252 (= e!208141 tp_is_empty!7087)))

(declare-fun mapNonEmpty!12054 () Bool)

(declare-fun tp!24942 () Bool)

(declare-fun e!208142 () Bool)

(assert (=> mapNonEmpty!12054 (= mapRes!12054 (and tp!24942 e!208142))))

(declare-fun mapKey!12054 () (_ BitVec 32))

(declare-fun mapValue!12054 () ValueCell!3200)

(declare-fun mapRest!12054 () (Array (_ BitVec 32) ValueCell!3200))

(assert (=> mapNonEmpty!12054 (= mapRest!12045 (store mapRest!12054 mapKey!12054 mapValue!12054))))

(declare-fun b!339251 () Bool)

(assert (=> b!339251 (= e!208142 tp_is_empty!7087)))

(assert (= (and mapNonEmpty!12045 condMapEmpty!12054) mapIsEmpty!12054))

(assert (= (and mapNonEmpty!12045 (not condMapEmpty!12054)) mapNonEmpty!12054))

(assert (= (and mapNonEmpty!12054 ((_ is ValueCellFull!3200) mapValue!12054)) b!339251))

(assert (= (and mapNonEmpty!12045 ((_ is ValueCellFull!3200) mapDefault!12054)) b!339252))

(declare-fun m!342557 () Bool)

(assert (=> mapNonEmpty!12054 m!342557))

(declare-fun b_lambda!8451 () Bool)

(assert (= b_lambda!8449 (or (and start!34016 b_free!7135) b_lambda!8451)))

(check-sat (not b!339135) (not b_lambda!8451) (not bm!26459) (not bm!26444) (not b!339187) (not bm!26460) (not b!339183) (not bm!26462) (not b!339184) (not b!339195) (not b!339124) (not bm!26468) (not b!339200) (not b!339128) (not d!70881) (not b!339194) (not b!339137) (not b!339213) tp_is_empty!7087 (not bm!26461) (not b!339220) (not d!70861) (not b!339193) (not b!339127) (not b_next!7135) (not mapNonEmpty!12054) (not d!70863) b_and!14347 (not b!339211) (not b!339185) (not d!70869) (not b!339238) (not b!339244))
(check-sat b_and!14347 (not b_next!7135))
