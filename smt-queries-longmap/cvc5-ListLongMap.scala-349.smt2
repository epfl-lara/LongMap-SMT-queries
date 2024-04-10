; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6382 () Bool)

(assert start!6382)

(declare-fun b_free!1471 () Bool)

(declare-fun b_next!1471 () Bool)

(assert (=> start!6382 (= b_free!1471 (not b_next!1471))))

(declare-fun tp!5894 () Bool)

(declare-fun b_and!2591 () Bool)

(assert (=> start!6382 (= tp!5894 b_and!2591)))

(declare-fun res!25433 () Bool)

(declare-fun e!27112 () Bool)

(assert (=> start!6382 (=> (not res!25433) (not e!27112))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6382 (= res!25433 (validMask!0 mask!853))))

(assert (=> start!6382 e!27112))

(assert (=> start!6382 true))

(assert (=> start!6382 tp!5894))

(declare-fun b!42776 () Bool)

(declare-fun e!27111 () Bool)

(assert (=> b!42776 (= e!27112 (not e!27111))))

(declare-fun res!25432 () Bool)

(assert (=> b!42776 (=> res!25432 e!27111)))

(declare-datatypes ((V!2269 0))(
  ( (V!2270 (val!969 Int)) )
))
(declare-datatypes ((tuple2!1592 0))(
  ( (tuple2!1593 (_1!807 (_ BitVec 64)) (_2!807 V!2269)) )
))
(declare-datatypes ((List!1166 0))(
  ( (Nil!1163) (Cons!1162 (h!1739 tuple2!1592) (t!4133 List!1166)) )
))
(declare-datatypes ((ListLongMap!1169 0))(
  ( (ListLongMap!1170 (toList!600 List!1166)) )
))
(declare-fun lt!18019 () ListLongMap!1169)

(assert (=> b!42776 (= res!25432 (= lt!18019 (ListLongMap!1170 Nil!1163)))))

(declare-datatypes ((array!2867 0))(
  ( (array!2868 (arr!1377 (Array (_ BitVec 32) (_ BitVec 64))) (size!1556 (_ BitVec 32))) )
))
(declare-fun lt!18021 () array!2867)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!18022 () V!2269)

(declare-datatypes ((ValueCell!683 0))(
  ( (ValueCellFull!683 (v!2059 V!2269)) (EmptyCell!683) )
))
(declare-datatypes ((array!2869 0))(
  ( (array!2870 (arr!1378 (Array (_ BitVec 32) ValueCell!683)) (size!1557 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!346 0))(
  ( (LongMapFixedSize!347 (defaultEntry!1866 Int) (mask!5396 (_ BitVec 32)) (extraKeys!1757 (_ BitVec 32)) (zeroValue!1784 V!2269) (minValue!1784 V!2269) (_size!222 (_ BitVec 32)) (_keys!3409 array!2867) (_values!1849 array!2869) (_vacant!222 (_ BitVec 32))) )
))
(declare-fun map!807 (LongMapFixedSize!346) ListLongMap!1169)

(assert (=> b!42776 (= lt!18019 (map!807 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1167 0))(
  ( (Nil!1164) (Cons!1163 (h!1740 (_ BitVec 64)) (t!4134 List!1167)) )
))
(declare-fun arrayNoDuplicates!0 (array!2867 (_ BitVec 32) List!1167) Bool)

(assert (=> b!42776 (arrayNoDuplicates!0 lt!18021 #b00000000000000000000000000000000 Nil!1164)))

(declare-datatypes ((Unit!1167 0))(
  ( (Unit!1168) )
))
(declare-fun lt!18023 () Unit!1167)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2867 (_ BitVec 32) (_ BitVec 32) List!1167) Unit!1167)

(assert (=> b!42776 (= lt!18023 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2867 (_ BitVec 32)) Bool)

(assert (=> b!42776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18021 mask!853)))

(declare-fun lt!18020 () Unit!1167)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2867 (_ BitVec 32) (_ BitVec 32)) Unit!1167)

(assert (=> b!42776 (= lt!18020 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18021 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2867 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42776 (= (arrayCountValidKeys!0 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18018 () Unit!1167)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2867 (_ BitVec 32) (_ BitVec 32)) Unit!1167)

(assert (=> b!42776 (= lt!18018 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42776 (= lt!18021 (array!2868 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!244 (Int (_ BitVec 64)) V!2269)

(assert (=> b!42776 (= lt!18022 (dynLambda!244 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42777 () Bool)

(declare-fun res!25434 () Bool)

(assert (=> b!42777 (=> res!25434 e!27111)))

(declare-fun isEmpty!274 (List!1166) Bool)

(assert (=> b!42777 (= res!25434 (isEmpty!274 (toList!600 lt!18019)))))

(declare-fun b!42778 () Bool)

(assert (=> b!42778 (= e!27111 (bvsge mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!6382 res!25433) b!42776))

(assert (= (and b!42776 (not res!25432)) b!42777))

(assert (= (and b!42777 (not res!25434)) b!42778))

(declare-fun b_lambda!2207 () Bool)

(assert (=> (not b_lambda!2207) (not b!42776)))

(declare-fun t!4132 () Bool)

(declare-fun tb!953 () Bool)

(assert (=> (and start!6382 (= defaultEntry!470 defaultEntry!470) t!4132) tb!953))

(declare-fun result!1657 () Bool)

(declare-fun tp_is_empty!1861 () Bool)

(assert (=> tb!953 (= result!1657 tp_is_empty!1861)))

(assert (=> b!42776 t!4132))

(declare-fun b_and!2593 () Bool)

(assert (= b_and!2591 (and (=> t!4132 result!1657) b_and!2593)))

(declare-fun m!36533 () Bool)

(assert (=> start!6382 m!36533))

(declare-fun m!36535 () Bool)

(assert (=> b!42776 m!36535))

(declare-fun m!36537 () Bool)

(assert (=> b!42776 m!36537))

(declare-fun m!36539 () Bool)

(assert (=> b!42776 m!36539))

(declare-fun m!36541 () Bool)

(assert (=> b!42776 m!36541))

(declare-fun m!36543 () Bool)

(assert (=> b!42776 m!36543))

(declare-fun m!36545 () Bool)

(assert (=> b!42776 m!36545))

(declare-fun m!36547 () Bool)

(assert (=> b!42776 m!36547))

(declare-fun m!36549 () Bool)

(assert (=> b!42776 m!36549))

(declare-fun m!36551 () Bool)

(assert (=> b!42777 m!36551))

(push 1)

(assert b_and!2593)

(assert (not start!6382))

(assert tp_is_empty!1861)

(assert (not b_next!1471))

(assert (not b_lambda!2207))

(assert (not b!42777))

(assert (not b!42776))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2593)

(assert (not b_next!1471))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2213 () Bool)

(assert (= b_lambda!2207 (or (and start!6382 b_free!1471) b_lambda!2213)))

(push 1)

(assert (not b_lambda!2213))

(assert b_and!2593)

(assert (not start!6382))

(assert tp_is_empty!1861)

(assert (not b_next!1471))

(assert (not b!42777))

(assert (not b!42776))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2593)

(assert (not b_next!1471))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7811 () Bool)

(assert (=> d!7811 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6382 d!7811))

(declare-fun d!7821 () Bool)

(assert (=> d!7821 (= (isEmpty!274 (toList!600 lt!18019)) (is-Nil!1163 (toList!600 lt!18019)))))

(assert (=> b!42777 d!7821))

(declare-fun d!7823 () Bool)

(assert (=> d!7823 (arrayNoDuplicates!0 lt!18021 #b00000000000000000000000000000000 Nil!1164)))

(declare-fun lt!18074 () Unit!1167)

(declare-fun choose!111 (array!2867 (_ BitVec 32) (_ BitVec 32) List!1167) Unit!1167)

(assert (=> d!7823 (= lt!18074 (choose!111 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1164))))

(assert (=> d!7823 (= (size!1556 lt!18021) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7823 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1164) lt!18074)))

(declare-fun bs!1903 () Bool)

(assert (= bs!1903 d!7823))

(assert (=> bs!1903 m!36543))

(declare-fun m!36601 () Bool)

(assert (=> bs!1903 m!36601))

(assert (=> b!42776 d!7823))

(declare-fun d!7827 () Bool)

(declare-fun getCurrentListMap!346 (array!2867 array!2869 (_ BitVec 32) (_ BitVec 32) V!2269 V!2269 (_ BitVec 32) Int) ListLongMap!1169)

(assert (=> d!7827 (= (map!807 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!346 (_keys!3409 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1849 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5396 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1757 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1784 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1784 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1866 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18022 lt!18022 #b00000000000000000000000000000000 lt!18021 (array!2870 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1907 () Bool)

(assert (= bs!1907 d!7827))

(declare-fun m!36621 () Bool)

(assert (=> bs!1907 m!36621))

(assert (=> b!42776 d!7827))

(declare-fun bm!3377 () Bool)

(declare-fun call!3380 () (_ BitVec 32))

(assert (=> bm!3377 (= call!3380 (arrayCountValidKeys!0 lt!18021 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42847 () Bool)

(declare-fun e!27153 () (_ BitVec 32))

(declare-fun e!27154 () (_ BitVec 32))

(assert (=> b!42847 (= e!27153 e!27154)))

(declare-fun c!5428 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42847 (= c!5428 (validKeyInArray!0 (select (arr!1377 lt!18021) #b00000000000000000000000000000000)))))

(declare-fun b!42849 () Bool)

(assert (=> b!42849 (= e!27154 (bvadd #b00000000000000000000000000000001 call!3380))))

(declare-fun b!42850 () Bool)

(assert (=> b!42850 (= e!27154 call!3380)))

(declare-fun d!7837 () Bool)

(declare-fun lt!18098 () (_ BitVec 32))

(assert (=> d!7837 (and (bvsge lt!18098 #b00000000000000000000000000000000) (bvsle lt!18098 (bvsub (size!1556 lt!18021) #b00000000000000000000000000000000)))))

(assert (=> d!7837 (= lt!18098 e!27153)))

(declare-fun c!5429 () Bool)

(assert (=> d!7837 (= c!5429 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7837 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1556 lt!18021)))))

(assert (=> d!7837 (= (arrayCountValidKeys!0 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18098)))

(declare-fun b!42848 () Bool)

(assert (=> b!42848 (= e!27153 #b00000000000000000000000000000000)))

(assert (= (and d!7837 c!5429) b!42848))

(assert (= (and d!7837 (not c!5429)) b!42847))

(assert (= (and b!42847 c!5428) b!42849))

(assert (= (and b!42847 (not c!5428)) b!42850))

(assert (= (or b!42849 b!42850) bm!3377))

(declare-fun m!36633 () Bool)

(assert (=> bm!3377 m!36633))

(declare-fun m!36635 () Bool)

(assert (=> b!42847 m!36635))

(assert (=> b!42847 m!36635))

(declare-fun m!36637 () Bool)

(assert (=> b!42847 m!36637))

(assert (=> b!42776 d!7837))

(declare-fun b!42881 () Bool)

(declare-fun e!27176 () Bool)

(declare-fun call!3388 () Bool)

(assert (=> b!42881 (= e!27176 call!3388)))

(declare-fun b!42882 () Bool)

(declare-fun e!27175 () Bool)

(assert (=> b!42882 (= e!27176 e!27175)))

(declare-fun lt!18109 () (_ BitVec 64))

(assert (=> b!42882 (= lt!18109 (select (arr!1377 lt!18021) #b00000000000000000000000000000000))))

(declare-fun lt!18108 () Unit!1167)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2867 (_ BitVec 64) (_ BitVec 32)) Unit!1167)

(assert (=> b!42882 (= lt!18108 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18021 lt!18109 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42882 (arrayContainsKey!0 lt!18021 lt!18109 #b00000000000000000000000000000000)))

(declare-fun lt!18110 () Unit!1167)

(assert (=> b!42882 (= lt!18110 lt!18108)))

(declare-fun res!25476 () Bool)

(declare-datatypes ((SeekEntryResult!194 0))(
  ( (MissingZero!194 (index!2898 (_ BitVec 32))) (Found!194 (index!2899 (_ BitVec 32))) (Intermediate!194 (undefined!1006 Bool) (index!2900 (_ BitVec 32)) (x!8202 (_ BitVec 32))) (Undefined!194) (MissingVacant!194 (index!2901 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2867 (_ BitVec 32)) SeekEntryResult!194)

(assert (=> b!42882 (= res!25476 (= (seekEntryOrOpen!0 (select (arr!1377 lt!18021) #b00000000000000000000000000000000) lt!18021 mask!853) (Found!194 #b00000000000000000000000000000000)))))

(assert (=> b!42882 (=> (not res!25476) (not e!27175))))

(declare-fun b!42883 () Bool)

(declare-fun e!27177 () Bool)

(assert (=> b!42883 (= e!27177 e!27176)))

(declare-fun c!5440 () Bool)

(assert (=> b!42883 (= c!5440 (validKeyInArray!0 (select (arr!1377 lt!18021) #b00000000000000000000000000000000)))))

(declare-fun d!7843 () Bool)

(declare-fun res!25475 () Bool)

(assert (=> d!7843 (=> res!25475 e!27177)))

(assert (=> d!7843 (= res!25475 (bvsge #b00000000000000000000000000000000 (size!1556 lt!18021)))))

(assert (=> d!7843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18021 mask!853) e!27177)))

(declare-fun b!42884 () Bool)

(assert (=> b!42884 (= e!27175 call!3388)))

(declare-fun bm!3385 () Bool)

(assert (=> bm!3385 (= call!3388 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18021 mask!853))))

(assert (= (and d!7843 (not res!25475)) b!42883))

(assert (= (and b!42883 c!5440) b!42882))

(assert (= (and b!42883 (not c!5440)) b!42881))

(assert (= (and b!42882 res!25476) b!42884))

(assert (= (or b!42884 b!42881) bm!3385))

(assert (=> b!42882 m!36635))

(declare-fun m!36643 () Bool)

(assert (=> b!42882 m!36643))

(declare-fun m!36645 () Bool)

(assert (=> b!42882 m!36645))

(assert (=> b!42882 m!36635))

(declare-fun m!36647 () Bool)

(assert (=> b!42882 m!36647))

(assert (=> b!42883 m!36635))

(assert (=> b!42883 m!36635))

(assert (=> b!42883 m!36637))

(declare-fun m!36649 () Bool)

(assert (=> bm!3385 m!36649))

(assert (=> b!42776 d!7843))

(declare-fun d!7849 () Bool)

(assert (=> d!7849 (= (arrayCountValidKeys!0 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18113 () Unit!1167)

(declare-fun choose!59 (array!2867 (_ BitVec 32) (_ BitVec 32)) Unit!1167)

(assert (=> d!7849 (= lt!18113 (choose!59 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7849 (bvslt (size!1556 lt!18021) #b01111111111111111111111111111111)))

(assert (=> d!7849 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18021 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18113)))

(declare-fun bs!1910 () Bool)

(assert (= bs!1910 d!7849))

(assert (=> bs!1910 m!36535))

(declare-fun m!36655 () Bool)

(assert (=> bs!1910 m!36655))

(assert (=> b!42776 d!7849))

(declare-fun d!7853 () Bool)

(assert (=> d!7853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18021 mask!853)))

(declare-fun lt!18119 () Unit!1167)

(declare-fun choose!34 (array!2867 (_ BitVec 32) (_ BitVec 32)) Unit!1167)

(assert (=> d!7853 (= lt!18119 (choose!34 lt!18021 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7853 (validMask!0 mask!853)))

(assert (=> d!7853 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18021 mask!853 #b00000000000000000000000000000000) lt!18119)))

(declare-fun bs!1912 () Bool)

(assert (= bs!1912 d!7853))

(assert (=> bs!1912 m!36537))

(declare-fun m!36663 () Bool)

(assert (=> bs!1912 m!36663))

(assert (=> bs!1912 m!36533))

(assert (=> b!42776 d!7853))

(declare-fun b!42915 () Bool)

(declare-fun e!27203 () Bool)

(declare-fun contains!560 (List!1167 (_ BitVec 64)) Bool)

(assert (=> b!42915 (= e!27203 (contains!560 Nil!1164 (select (arr!1377 lt!18021) #b00000000000000000000000000000000)))))

(declare-fun bm!3392 () Bool)

(declare-fun call!3395 () Bool)

(declare-fun c!5447 () Bool)

(assert (=> bm!3392 (= call!3395 (arrayNoDuplicates!0 lt!18021 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5447 (Cons!1163 (select (arr!1377 lt!18021) #b00000000000000000000000000000000) Nil!1164) Nil!1164)))))

(declare-fun b!42916 () Bool)

(declare-fun e!27202 () Bool)

(declare-fun e!27204 () Bool)

(assert (=> b!42916 (= e!27202 e!27204)))

(assert (=> b!42916 (= c!5447 (validKeyInArray!0 (select (arr!1377 lt!18021) #b00000000000000000000000000000000)))))

(declare-fun b!42917 () Bool)

(assert (=> b!42917 (= e!27204 call!3395)))

(declare-fun b!42918 () Bool)

(assert (=> b!42918 (= e!27204 call!3395)))

(declare-fun b!42919 () Bool)

(declare-fun e!27205 () Bool)

(assert (=> b!42919 (= e!27205 e!27202)))

(declare-fun res!25495 () Bool)

(assert (=> b!42919 (=> (not res!25495) (not e!27202))))

(assert (=> b!42919 (= res!25495 (not e!27203))))

(declare-fun res!25497 () Bool)

(assert (=> b!42919 (=> (not res!25497) (not e!27203))))

(assert (=> b!42919 (= res!25497 (validKeyInArray!0 (select (arr!1377 lt!18021) #b00000000000000000000000000000000)))))

(declare-fun d!7861 () Bool)

(declare-fun res!25496 () Bool)

(assert (=> d!7861 (=> res!25496 e!27205)))

(assert (=> d!7861 (= res!25496 (bvsge #b00000000000000000000000000000000 (size!1556 lt!18021)))))

(assert (=> d!7861 (= (arrayNoDuplicates!0 lt!18021 #b00000000000000000000000000000000 Nil!1164) e!27205)))

(assert (= (and d!7861 (not res!25496)) b!42919))

(assert (= (and b!42919 res!25497) b!42915))

(assert (= (and b!42919 res!25495) b!42916))

(assert (= (and b!42916 c!5447) b!42917))

(assert (= (and b!42916 (not c!5447)) b!42918))

(assert (= (or b!42917 b!42918) bm!3392))

(assert (=> b!42915 m!36635))

(assert (=> b!42915 m!36635))

(declare-fun m!36667 () Bool)

(assert (=> b!42915 m!36667))

(assert (=> bm!3392 m!36635))

(declare-fun m!36669 () Bool)

(assert (=> bm!3392 m!36669))

(assert (=> b!42916 m!36635))

(assert (=> b!42916 m!36635))

(assert (=> b!42916 m!36637))

(assert (=> b!42919 m!36635))

(assert (=> b!42919 m!36635))

(assert (=> b!42919 m!36637))

(assert (=> b!42776 d!7861))

(push 1)

(assert (not d!7853))

(assert (not b!42847))

(assert (not b!42915))

(assert (not b!42916))

(assert (not b_lambda!2213))

(assert b_and!2593)

(assert (not b_next!1471))

(assert (not d!7823))

(assert (not d!7827))

(assert (not d!7849))

(assert (not bm!3392))

(assert (not b!42883))

(assert tp_is_empty!1861)

(assert (not bm!3385))

(assert (not b!42882))

(assert (not bm!3377))

(assert (not b!42919))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2593)

(assert (not b_next!1471))

(check-sat)

