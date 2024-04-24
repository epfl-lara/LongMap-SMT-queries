; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6386 () Bool)

(assert start!6386)

(declare-fun b_free!1471 () Bool)

(declare-fun b_next!1471 () Bool)

(assert (=> start!6386 (= b_free!1471 (not b_next!1471))))

(declare-fun tp!5894 () Bool)

(declare-fun b_and!2589 () Bool)

(assert (=> start!6386 (= tp!5894 b_and!2589)))

(declare-fun res!25409 () Bool)

(declare-fun e!27074 () Bool)

(assert (=> start!6386 (=> (not res!25409) (not e!27074))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6386 (= res!25409 (validMask!0 mask!853))))

(assert (=> start!6386 e!27074))

(assert (=> start!6386 true))

(assert (=> start!6386 tp!5894))

(declare-fun b!42719 () Bool)

(declare-fun e!27075 () Bool)

(assert (=> b!42719 (= e!27074 (not e!27075))))

(declare-fun res!25407 () Bool)

(assert (=> b!42719 (=> res!25407 e!27075)))

(declare-datatypes ((V!2269 0))(
  ( (V!2270 (val!969 Int)) )
))
(declare-datatypes ((tuple2!1574 0))(
  ( (tuple2!1575 (_1!798 (_ BitVec 64)) (_2!798 V!2269)) )
))
(declare-datatypes ((List!1152 0))(
  ( (Nil!1149) (Cons!1148 (h!1725 tuple2!1574) (t!4119 List!1152)) )
))
(declare-datatypes ((ListLongMap!1145 0))(
  ( (ListLongMap!1146 (toList!588 List!1152)) )
))
(declare-fun lt!17979 () ListLongMap!1145)

(assert (=> b!42719 (= res!25407 (= lt!17979 (ListLongMap!1146 Nil!1149)))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2853 0))(
  ( (array!2854 (arr!1370 (Array (_ BitVec 32) (_ BitVec 64))) (size!1549 (_ BitVec 32))) )
))
(declare-fun lt!17978 () array!2853)

(declare-fun lt!17976 () V!2269)

(declare-datatypes ((ValueCell!683 0))(
  ( (ValueCellFull!683 (v!2060 V!2269)) (EmptyCell!683) )
))
(declare-datatypes ((array!2855 0))(
  ( (array!2856 (arr!1371 (Array (_ BitVec 32) ValueCell!683)) (size!1550 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!346 0))(
  ( (LongMapFixedSize!347 (defaultEntry!1866 Int) (mask!5396 (_ BitVec 32)) (extraKeys!1757 (_ BitVec 32)) (zeroValue!1784 V!2269) (minValue!1784 V!2269) (_size!222 (_ BitVec 32)) (_keys!3409 array!2853) (_values!1849 array!2855) (_vacant!222 (_ BitVec 32))) )
))
(declare-fun map!807 (LongMapFixedSize!346) ListLongMap!1145)

(assert (=> b!42719 (= lt!17979 (map!807 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1153 0))(
  ( (Nil!1150) (Cons!1149 (h!1726 (_ BitVec 64)) (t!4120 List!1153)) )
))
(declare-fun arrayNoDuplicates!0 (array!2853 (_ BitVec 32) List!1153) Bool)

(assert (=> b!42719 (arrayNoDuplicates!0 lt!17978 #b00000000000000000000000000000000 Nil!1150)))

(declare-datatypes ((Unit!1179 0))(
  ( (Unit!1180) )
))
(declare-fun lt!17980 () Unit!1179)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2853 (_ BitVec 32) (_ BitVec 32) List!1153) Unit!1179)

(assert (=> b!42719 (= lt!17980 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2853 (_ BitVec 32)) Bool)

(assert (=> b!42719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17978 mask!853)))

(declare-fun lt!17975 () Unit!1179)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2853 (_ BitVec 32) (_ BitVec 32)) Unit!1179)

(assert (=> b!42719 (= lt!17975 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17978 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2853 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42719 (= (arrayCountValidKeys!0 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17977 () Unit!1179)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2853 (_ BitVec 32) (_ BitVec 32)) Unit!1179)

(assert (=> b!42719 (= lt!17977 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42719 (= lt!17978 (array!2854 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!240 (Int (_ BitVec 64)) V!2269)

(assert (=> b!42719 (= lt!17976 (dynLambda!240 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42720 () Bool)

(declare-fun res!25408 () Bool)

(assert (=> b!42720 (=> res!25408 e!27075)))

(declare-fun isEmpty!278 (List!1152) Bool)

(assert (=> b!42720 (= res!25408 (isEmpty!278 (toList!588 lt!17979)))))

(declare-fun b!42721 () Bool)

(assert (=> b!42721 (= e!27075 (bvsge mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!6386 res!25409) b!42719))

(assert (= (and b!42719 (not res!25407)) b!42720))

(assert (= (and b!42720 (not res!25408)) b!42721))

(declare-fun b_lambda!2207 () Bool)

(assert (=> (not b_lambda!2207) (not b!42719)))

(declare-fun t!4118 () Bool)

(declare-fun tb!953 () Bool)

(assert (=> (and start!6386 (= defaultEntry!470 defaultEntry!470) t!4118) tb!953))

(declare-fun result!1657 () Bool)

(declare-fun tp_is_empty!1861 () Bool)

(assert (=> tb!953 (= result!1657 tp_is_empty!1861)))

(assert (=> b!42719 t!4118))

(declare-fun b_and!2591 () Bool)

(assert (= b_and!2589 (and (=> t!4118 result!1657) b_and!2591)))

(declare-fun m!36409 () Bool)

(assert (=> start!6386 m!36409))

(declare-fun m!36411 () Bool)

(assert (=> b!42719 m!36411))

(declare-fun m!36413 () Bool)

(assert (=> b!42719 m!36413))

(declare-fun m!36415 () Bool)

(assert (=> b!42719 m!36415))

(declare-fun m!36417 () Bool)

(assert (=> b!42719 m!36417))

(declare-fun m!36419 () Bool)

(assert (=> b!42719 m!36419))

(declare-fun m!36421 () Bool)

(assert (=> b!42719 m!36421))

(declare-fun m!36423 () Bool)

(assert (=> b!42719 m!36423))

(declare-fun m!36425 () Bool)

(assert (=> b!42719 m!36425))

(declare-fun m!36427 () Bool)

(assert (=> b!42720 m!36427))

(check-sat (not b_lambda!2207) b_and!2591 (not b!42719) (not start!6386) (not b!42720) tp_is_empty!1861 (not b_next!1471))
(check-sat b_and!2591 (not b_next!1471))
(get-model)

(declare-fun b_lambda!2217 () Bool)

(assert (= b_lambda!2207 (or (and start!6386 b_free!1471) b_lambda!2217)))

(check-sat b_and!2591 (not start!6386) (not b!42720) tp_is_empty!1861 (not b_next!1471) (not b_lambda!2217) (not b!42719))
(check-sat b_and!2591 (not b_next!1471))
(get-model)

(declare-fun d!7805 () Bool)

(assert (=> d!7805 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6386 d!7805))

(declare-fun d!7813 () Bool)

(get-info :version)

(assert (=> d!7813 (= (isEmpty!278 (toList!588 lt!17979)) ((_ is Nil!1149) (toList!588 lt!17979)))))

(assert (=> b!42720 d!7813))

(declare-fun d!7815 () Bool)

(declare-fun res!25456 () Bool)

(declare-fun e!27133 () Bool)

(assert (=> d!7815 (=> res!25456 e!27133)))

(assert (=> d!7815 (= res!25456 (bvsge #b00000000000000000000000000000000 (size!1549 lt!17978)))))

(assert (=> d!7815 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17978 mask!853) e!27133)))

(declare-fun b!42808 () Bool)

(declare-fun e!27135 () Bool)

(declare-fun call!3369 () Bool)

(assert (=> b!42808 (= e!27135 call!3369)))

(declare-fun b!42809 () Bool)

(assert (=> b!42809 (= e!27133 e!27135)))

(declare-fun c!5413 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42809 (= c!5413 (validKeyInArray!0 (select (arr!1370 lt!17978) #b00000000000000000000000000000000)))))

(declare-fun b!42810 () Bool)

(declare-fun e!27134 () Bool)

(assert (=> b!42810 (= e!27134 call!3369)))

(declare-fun bm!3366 () Bool)

(assert (=> bm!3366 (= call!3369 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17978 mask!853))))

(declare-fun b!42811 () Bool)

(assert (=> b!42811 (= e!27135 e!27134)))

(declare-fun lt!18044 () (_ BitVec 64))

(assert (=> b!42811 (= lt!18044 (select (arr!1370 lt!17978) #b00000000000000000000000000000000))))

(declare-fun lt!18045 () Unit!1179)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2853 (_ BitVec 64) (_ BitVec 32)) Unit!1179)

(assert (=> b!42811 (= lt!18045 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17978 lt!18044 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42811 (arrayContainsKey!0 lt!17978 lt!18044 #b00000000000000000000000000000000)))

(declare-fun lt!18046 () Unit!1179)

(assert (=> b!42811 (= lt!18046 lt!18045)))

(declare-fun res!25457 () Bool)

(declare-datatypes ((SeekEntryResult!188 0))(
  ( (MissingZero!188 (index!2874 (_ BitVec 32))) (Found!188 (index!2875 (_ BitVec 32))) (Intermediate!188 (undefined!1000 Bool) (index!2876 (_ BitVec 32)) (x!8196 (_ BitVec 32))) (Undefined!188) (MissingVacant!188 (index!2877 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2853 (_ BitVec 32)) SeekEntryResult!188)

(assert (=> b!42811 (= res!25457 (= (seekEntryOrOpen!0 (select (arr!1370 lt!17978) #b00000000000000000000000000000000) lt!17978 mask!853) (Found!188 #b00000000000000000000000000000000)))))

(assert (=> b!42811 (=> (not res!25457) (not e!27134))))

(assert (= (and d!7815 (not res!25456)) b!42809))

(assert (= (and b!42809 c!5413) b!42811))

(assert (= (and b!42809 (not c!5413)) b!42808))

(assert (= (and b!42811 res!25457) b!42810))

(assert (= (or b!42810 b!42808) bm!3366))

(declare-fun m!36501 () Bool)

(assert (=> b!42809 m!36501))

(assert (=> b!42809 m!36501))

(declare-fun m!36503 () Bool)

(assert (=> b!42809 m!36503))

(declare-fun m!36505 () Bool)

(assert (=> bm!3366 m!36505))

(assert (=> b!42811 m!36501))

(declare-fun m!36507 () Bool)

(assert (=> b!42811 m!36507))

(declare-fun m!36509 () Bool)

(assert (=> b!42811 m!36509))

(assert (=> b!42811 m!36501))

(declare-fun m!36511 () Bool)

(assert (=> b!42811 m!36511))

(assert (=> b!42719 d!7815))

(declare-fun d!7825 () Bool)

(assert (=> d!7825 (arrayNoDuplicates!0 lt!17978 #b00000000000000000000000000000000 Nil!1150)))

(declare-fun lt!18051 () Unit!1179)

(declare-fun choose!111 (array!2853 (_ BitVec 32) (_ BitVec 32) List!1153) Unit!1179)

(assert (=> d!7825 (= lt!18051 (choose!111 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1150))))

(assert (=> d!7825 (= (size!1549 lt!17978) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7825 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1150) lt!18051)))

(declare-fun bs!1905 () Bool)

(assert (= bs!1905 d!7825))

(assert (=> bs!1905 m!36425))

(declare-fun m!36513 () Bool)

(assert (=> bs!1905 m!36513))

(assert (=> b!42719 d!7825))

(declare-fun d!7827 () Bool)

(declare-fun getCurrentListMap!329 (array!2853 array!2855 (_ BitVec 32) (_ BitVec 32) V!2269 V!2269 (_ BitVec 32) Int) ListLongMap!1145)

(assert (=> d!7827 (= (map!807 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!329 (_keys!3409 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1849 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5396 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1757 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1784 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1784 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1866 (LongMapFixedSize!347 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17976 lt!17976 #b00000000000000000000000000000000 lt!17978 (array!2856 ((as const (Array (_ BitVec 32) ValueCell!683)) EmptyCell!683) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1907 () Bool)

(assert (= bs!1907 d!7827))

(declare-fun m!36527 () Bool)

(assert (=> bs!1907 m!36527))

(assert (=> b!42719 d!7827))

(declare-fun d!7835 () Bool)

(assert (=> d!7835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17978 mask!853)))

(declare-fun lt!18067 () Unit!1179)

(declare-fun choose!34 (array!2853 (_ BitVec 32) (_ BitVec 32)) Unit!1179)

(assert (=> d!7835 (= lt!18067 (choose!34 lt!17978 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7835 (validMask!0 mask!853)))

(assert (=> d!7835 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17978 mask!853 #b00000000000000000000000000000000) lt!18067)))

(declare-fun bs!1908 () Bool)

(assert (= bs!1908 d!7835))

(assert (=> bs!1908 m!36419))

(declare-fun m!36529 () Bool)

(assert (=> bs!1908 m!36529))

(assert (=> bs!1908 m!36409))

(assert (=> b!42719 d!7835))

(declare-fun d!7837 () Bool)

(declare-fun lt!18076 () (_ BitVec 32))

(assert (=> d!7837 (and (bvsge lt!18076 #b00000000000000000000000000000000) (bvsle lt!18076 (bvsub (size!1549 lt!17978) #b00000000000000000000000000000000)))))

(declare-fun e!27155 () (_ BitVec 32))

(assert (=> d!7837 (= lt!18076 e!27155)))

(declare-fun c!5427 () Bool)

(assert (=> d!7837 (= c!5427 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7837 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1549 lt!17978)))))

(assert (=> d!7837 (= (arrayCountValidKeys!0 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18076)))

(declare-fun b!42844 () Bool)

(assert (=> b!42844 (= e!27155 #b00000000000000000000000000000000)))

(declare-fun bm!3375 () Bool)

(declare-fun call!3378 () (_ BitVec 32))

(assert (=> bm!3375 (= call!3378 (arrayCountValidKeys!0 lt!17978 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42845 () Bool)

(declare-fun e!27156 () (_ BitVec 32))

(assert (=> b!42845 (= e!27156 call!3378)))

(declare-fun b!42846 () Bool)

(assert (=> b!42846 (= e!27155 e!27156)))

(declare-fun c!5428 () Bool)

(assert (=> b!42846 (= c!5428 (validKeyInArray!0 (select (arr!1370 lt!17978) #b00000000000000000000000000000000)))))

(declare-fun b!42847 () Bool)

(assert (=> b!42847 (= e!27156 (bvadd #b00000000000000000000000000000001 call!3378))))

(assert (= (and d!7837 c!5427) b!42844))

(assert (= (and d!7837 (not c!5427)) b!42846))

(assert (= (and b!42846 c!5428) b!42847))

(assert (= (and b!42846 (not c!5428)) b!42845))

(assert (= (or b!42847 b!42845) bm!3375))

(declare-fun m!36539 () Bool)

(assert (=> bm!3375 m!36539))

(assert (=> b!42846 m!36501))

(assert (=> b!42846 m!36501))

(assert (=> b!42846 m!36503))

(assert (=> b!42719 d!7837))

(declare-fun d!7847 () Bool)

(assert (=> d!7847 (= (arrayCountValidKeys!0 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18079 () Unit!1179)

(declare-fun choose!59 (array!2853 (_ BitVec 32) (_ BitVec 32)) Unit!1179)

(assert (=> d!7847 (= lt!18079 (choose!59 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7847 (bvslt (size!1549 lt!17978) #b01111111111111111111111111111111)))

(assert (=> d!7847 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17978 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18079)))

(declare-fun bs!1913 () Bool)

(assert (= bs!1913 d!7847))

(assert (=> bs!1913 m!36411))

(declare-fun m!36541 () Bool)

(assert (=> bs!1913 m!36541))

(assert (=> b!42719 d!7847))

(declare-fun b!42858 () Bool)

(declare-fun e!27165 () Bool)

(declare-fun contains!552 (List!1153 (_ BitVec 64)) Bool)

(assert (=> b!42858 (= e!27165 (contains!552 Nil!1150 (select (arr!1370 lt!17978) #b00000000000000000000000000000000)))))

(declare-fun b!42859 () Bool)

(declare-fun e!27166 () Bool)

(declare-fun call!3381 () Bool)

(assert (=> b!42859 (= e!27166 call!3381)))

(declare-fun b!42860 () Bool)

(declare-fun e!27167 () Bool)

(declare-fun e!27168 () Bool)

(assert (=> b!42860 (= e!27167 e!27168)))

(declare-fun res!25470 () Bool)

(assert (=> b!42860 (=> (not res!25470) (not e!27168))))

(assert (=> b!42860 (= res!25470 (not e!27165))))

(declare-fun res!25471 () Bool)

(assert (=> b!42860 (=> (not res!25471) (not e!27165))))

(assert (=> b!42860 (= res!25471 (validKeyInArray!0 (select (arr!1370 lt!17978) #b00000000000000000000000000000000)))))

(declare-fun b!42861 () Bool)

(assert (=> b!42861 (= e!27168 e!27166)))

(declare-fun c!5431 () Bool)

(assert (=> b!42861 (= c!5431 (validKeyInArray!0 (select (arr!1370 lt!17978) #b00000000000000000000000000000000)))))

(declare-fun b!42862 () Bool)

(assert (=> b!42862 (= e!27166 call!3381)))

(declare-fun bm!3378 () Bool)

(assert (=> bm!3378 (= call!3381 (arrayNoDuplicates!0 lt!17978 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5431 (Cons!1149 (select (arr!1370 lt!17978) #b00000000000000000000000000000000) Nil!1150) Nil!1150)))))

(declare-fun d!7849 () Bool)

(declare-fun res!25472 () Bool)

(assert (=> d!7849 (=> res!25472 e!27167)))

(assert (=> d!7849 (= res!25472 (bvsge #b00000000000000000000000000000000 (size!1549 lt!17978)))))

(assert (=> d!7849 (= (arrayNoDuplicates!0 lt!17978 #b00000000000000000000000000000000 Nil!1150) e!27167)))

(assert (= (and d!7849 (not res!25472)) b!42860))

(assert (= (and b!42860 res!25471) b!42858))

(assert (= (and b!42860 res!25470) b!42861))

(assert (= (and b!42861 c!5431) b!42862))

(assert (= (and b!42861 (not c!5431)) b!42859))

(assert (= (or b!42862 b!42859) bm!3378))

(assert (=> b!42858 m!36501))

(assert (=> b!42858 m!36501))

(declare-fun m!36543 () Bool)

(assert (=> b!42858 m!36543))

(assert (=> b!42860 m!36501))

(assert (=> b!42860 m!36501))

(assert (=> b!42860 m!36503))

(assert (=> b!42861 m!36501))

(assert (=> b!42861 m!36501))

(assert (=> b!42861 m!36503))

(assert (=> bm!3378 m!36501))

(declare-fun m!36545 () Bool)

(assert (=> bm!3378 m!36545))

(assert (=> b!42719 d!7849))

(check-sat (not d!7825) b_and!2591 (not bm!3375) (not b_lambda!2217) (not b!42861) tp_is_empty!1861 (not b!42858) (not d!7847) (not b!42811) (not b_next!1471) (not b!42846) (not d!7835) (not d!7827) (not bm!3378) (not bm!3366) (not b!42860) (not b!42809))
(check-sat b_and!2591 (not b_next!1471))
