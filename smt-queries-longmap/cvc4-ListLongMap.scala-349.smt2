; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6386 () Bool)

(assert start!6386)

(declare-fun b_free!1475 () Bool)

(declare-fun b_next!1475 () Bool)

(assert (=> start!6386 (= b_free!1475 (not b_next!1475))))

(declare-fun tp!5900 () Bool)

(declare-fun b_and!2599 () Bool)

(assert (=> start!6386 (= tp!5900 b_and!2599)))

(declare-fun res!25451 () Bool)

(declare-fun e!27124 () Bool)

(assert (=> start!6386 (=> (not res!25451) (not e!27124))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6386 (= res!25451 (validMask!0 mask!853))))

(assert (=> start!6386 e!27124))

(assert (=> start!6386 true))

(assert (=> start!6386 tp!5900))

(declare-fun b!42798 () Bool)

(declare-fun e!27123 () Bool)

(assert (=> b!42798 (= e!27124 (not e!27123))))

(declare-fun res!25452 () Bool)

(assert (=> b!42798 (=> res!25452 e!27123)))

(declare-datatypes ((V!2273 0))(
  ( (V!2274 (val!971 Int)) )
))
(declare-datatypes ((tuple2!1596 0))(
  ( (tuple2!1597 (_1!809 (_ BitVec 64)) (_2!809 V!2273)) )
))
(declare-datatypes ((List!1170 0))(
  ( (Nil!1167) (Cons!1166 (h!1743 tuple2!1596) (t!4141 List!1170)) )
))
(declare-datatypes ((ListLongMap!1173 0))(
  ( (ListLongMap!1174 (toList!602 List!1170)) )
))
(declare-fun lt!18059 () ListLongMap!1173)

(assert (=> b!42798 (= res!25452 (= lt!18059 (ListLongMap!1174 Nil!1167)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!18055 () V!2273)

(declare-datatypes ((array!2875 0))(
  ( (array!2876 (arr!1381 (Array (_ BitVec 32) (_ BitVec 64))) (size!1560 (_ BitVec 32))) )
))
(declare-fun lt!18057 () array!2875)

(declare-datatypes ((ValueCell!685 0))(
  ( (ValueCellFull!685 (v!2061 V!2273)) (EmptyCell!685) )
))
(declare-datatypes ((array!2877 0))(
  ( (array!2878 (arr!1382 (Array (_ BitVec 32) ValueCell!685)) (size!1561 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!350 0))(
  ( (LongMapFixedSize!351 (defaultEntry!1868 Int) (mask!5398 (_ BitVec 32)) (extraKeys!1759 (_ BitVec 32)) (zeroValue!1786 V!2273) (minValue!1786 V!2273) (_size!224 (_ BitVec 32)) (_keys!3411 array!2875) (_values!1851 array!2877) (_vacant!224 (_ BitVec 32))) )
))
(declare-fun map!809 (LongMapFixedSize!350) ListLongMap!1173)

(assert (=> b!42798 (= lt!18059 (map!809 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1171 0))(
  ( (Nil!1168) (Cons!1167 (h!1744 (_ BitVec 64)) (t!4142 List!1171)) )
))
(declare-fun arrayNoDuplicates!0 (array!2875 (_ BitVec 32) List!1171) Bool)

(assert (=> b!42798 (arrayNoDuplicates!0 lt!18057 #b00000000000000000000000000000000 Nil!1168)))

(declare-datatypes ((Unit!1171 0))(
  ( (Unit!1172) )
))
(declare-fun lt!18058 () Unit!1171)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2875 (_ BitVec 32) (_ BitVec 32) List!1171) Unit!1171)

(assert (=> b!42798 (= lt!18058 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2875 (_ BitVec 32)) Bool)

(assert (=> b!42798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18057 mask!853)))

(declare-fun lt!18056 () Unit!1171)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2875 (_ BitVec 32) (_ BitVec 32)) Unit!1171)

(assert (=> b!42798 (= lt!18056 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18057 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2875 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42798 (= (arrayCountValidKeys!0 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18054 () Unit!1171)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2875 (_ BitVec 32) (_ BitVec 32)) Unit!1171)

(assert (=> b!42798 (= lt!18054 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42798 (= lt!18057 (array!2876 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!246 (Int (_ BitVec 64)) V!2273)

(assert (=> b!42798 (= lt!18055 (dynLambda!246 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42799 () Bool)

(declare-fun res!25450 () Bool)

(assert (=> b!42799 (=> res!25450 e!27123)))

(declare-fun isEmpty!276 (List!1170) Bool)

(assert (=> b!42799 (= res!25450 (isEmpty!276 (toList!602 lt!18059)))))

(declare-fun b!42800 () Bool)

(assert (=> b!42800 (= e!27123 (bvsge mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!6386 res!25451) b!42798))

(assert (= (and b!42798 (not res!25452)) b!42799))

(assert (= (and b!42799 (not res!25450)) b!42800))

(declare-fun b_lambda!2211 () Bool)

(assert (=> (not b_lambda!2211) (not b!42798)))

(declare-fun t!4140 () Bool)

(declare-fun tb!957 () Bool)

(assert (=> (and start!6386 (= defaultEntry!470 defaultEntry!470) t!4140) tb!957))

(declare-fun result!1665 () Bool)

(declare-fun tp_is_empty!1865 () Bool)

(assert (=> tb!957 (= result!1665 tp_is_empty!1865)))

(assert (=> b!42798 t!4140))

(declare-fun b_and!2601 () Bool)

(assert (= b_and!2599 (and (=> t!4140 result!1665) b_and!2601)))

(declare-fun m!36573 () Bool)

(assert (=> start!6386 m!36573))

(declare-fun m!36575 () Bool)

(assert (=> b!42798 m!36575))

(declare-fun m!36577 () Bool)

(assert (=> b!42798 m!36577))

(declare-fun m!36579 () Bool)

(assert (=> b!42798 m!36579))

(declare-fun m!36581 () Bool)

(assert (=> b!42798 m!36581))

(declare-fun m!36583 () Bool)

(assert (=> b!42798 m!36583))

(declare-fun m!36585 () Bool)

(assert (=> b!42798 m!36585))

(declare-fun m!36587 () Bool)

(assert (=> b!42798 m!36587))

(declare-fun m!36589 () Bool)

(assert (=> b!42798 m!36589))

(declare-fun m!36591 () Bool)

(assert (=> b!42799 m!36591))

(push 1)

(assert (not b!42798))

(assert tp_is_empty!1865)

(assert (not start!6386))

(assert (not b_next!1475))

(assert (not b_lambda!2211))

(assert b_and!2601)

(assert (not b!42799))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2601)

(assert (not b_next!1475))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2215 () Bool)

(assert (= b_lambda!2211 (or (and start!6386 b_free!1475) b_lambda!2215)))

(push 1)

(assert (not b!42798))

(assert tp_is_empty!1865)

(assert (not start!6386))

(assert (not b_next!1475))

(assert (not b_lambda!2215))

(assert b_and!2601)

(assert (not b!42799))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2601)

(assert (not b_next!1475))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7813 () Bool)

(assert (=> d!7813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18057 mask!853)))

(declare-fun lt!18062 () Unit!1171)

(declare-fun choose!34 (array!2875 (_ BitVec 32) (_ BitVec 32)) Unit!1171)

(assert (=> d!7813 (= lt!18062 (choose!34 lt!18057 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7813 (validMask!0 mask!853)))

(assert (=> d!7813 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18057 mask!853 #b00000000000000000000000000000000) lt!18062)))

(declare-fun bs!1902 () Bool)

(assert (= bs!1902 d!7813))

(assert (=> bs!1902 m!36577))

(declare-fun m!36593 () Bool)

(assert (=> bs!1902 m!36593))

(assert (=> bs!1902 m!36573))

(assert (=> b!42798 d!7813))

(declare-fun b!42819 () Bool)

(declare-fun e!27135 () (_ BitVec 32))

(declare-fun call!3373 () (_ BitVec 32))

(assert (=> b!42819 (= e!27135 call!3373)))

(declare-fun b!42820 () Bool)

(assert (=> b!42820 (= e!27135 (bvadd #b00000000000000000000000000000001 call!3373))))

(declare-fun b!42821 () Bool)

(declare-fun e!27136 () (_ BitVec 32))

(assert (=> b!42821 (= e!27136 e!27135)))

(declare-fun c!5418 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42821 (= c!5418 (validKeyInArray!0 (select (arr!1381 lt!18057) #b00000000000000000000000000000000)))))

(declare-fun bm!3370 () Bool)

(assert (=> bm!3370 (= call!3373 (arrayCountValidKeys!0 lt!18057 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7819 () Bool)

(declare-fun lt!18073 () (_ BitVec 32))

(assert (=> d!7819 (and (bvsge lt!18073 #b00000000000000000000000000000000) (bvsle lt!18073 (bvsub (size!1560 lt!18057) #b00000000000000000000000000000000)))))

(assert (=> d!7819 (= lt!18073 e!27136)))

(declare-fun c!5419 () Bool)

(assert (=> d!7819 (= c!5419 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7819 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1560 lt!18057)))))

(assert (=> d!7819 (= (arrayCountValidKeys!0 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18073)))

(declare-fun b!42822 () Bool)

(assert (=> b!42822 (= e!27136 #b00000000000000000000000000000000)))

(assert (= (and d!7819 c!5419) b!42822))

(assert (= (and d!7819 (not c!5419)) b!42821))

(assert (= (and b!42821 c!5418) b!42820))

(assert (= (and b!42821 (not c!5418)) b!42819))

(assert (= (or b!42820 b!42819) bm!3370))

(declare-fun m!36595 () Bool)

(assert (=> b!42821 m!36595))

(assert (=> b!42821 m!36595))

(declare-fun m!36597 () Bool)

(assert (=> b!42821 m!36597))

(declare-fun m!36599 () Bool)

(assert (=> bm!3370 m!36599))

(assert (=> b!42798 d!7819))

(declare-fun d!7825 () Bool)

(assert (=> d!7825 (arrayNoDuplicates!0 lt!18057 #b00000000000000000000000000000000 Nil!1168)))

(declare-fun lt!18080 () Unit!1171)

(declare-fun choose!111 (array!2875 (_ BitVec 32) (_ BitVec 32) List!1171) Unit!1171)

(assert (=> d!7825 (= lt!18080 (choose!111 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1168))))

(assert (=> d!7825 (= (size!1560 lt!18057) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7825 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1168) lt!18080)))

(declare-fun bs!1904 () Bool)

(assert (= bs!1904 d!7825))

(assert (=> bs!1904 m!36587))

(declare-fun m!36615 () Bool)

(assert (=> bs!1904 m!36615))

(assert (=> b!42798 d!7825))

(declare-fun d!7831 () Bool)

(assert (=> d!7831 (= (arrayCountValidKeys!0 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18086 () Unit!1171)

(declare-fun choose!59 (array!2875 (_ BitVec 32) (_ BitVec 32)) Unit!1171)

(assert (=> d!7831 (= lt!18086 (choose!59 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7831 (bvslt (size!1560 lt!18057) #b01111111111111111111111111111111)))

(assert (=> d!7831 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18057 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18086)))

(declare-fun bs!1906 () Bool)

(assert (= bs!1906 d!7831))

(assert (=> bs!1906 m!36575))

(declare-fun m!36619 () Bool)

(assert (=> bs!1906 m!36619))

(assert (=> b!42798 d!7831))

(declare-fun d!7835 () Bool)

(declare-fun res!25464 () Bool)

(declare-fun e!27152 () Bool)

(assert (=> d!7835 (=> res!25464 e!27152)))

(assert (=> d!7835 (= res!25464 (bvsge #b00000000000000000000000000000000 (size!1560 lt!18057)))))

(assert (=> d!7835 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18057 mask!853) e!27152)))

(declare-fun bm!3376 () Bool)

(declare-fun call!3379 () Bool)

(assert (=> bm!3376 (= call!3379 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18057 mask!853))))

(declare-fun b!42843 () Bool)

(declare-fun e!27151 () Bool)

(assert (=> b!42843 (= e!27151 call!3379)))

(declare-fun b!42844 () Bool)

(declare-fun e!27150 () Bool)

(assert (=> b!42844 (= e!27150 call!3379)))

(declare-fun b!42845 () Bool)

(assert (=> b!42845 (= e!27152 e!27151)))

(declare-fun c!5427 () Bool)

(assert (=> b!42845 (= c!5427 (validKeyInArray!0 (select (arr!1381 lt!18057) #b00000000000000000000000000000000)))))

(declare-fun b!42846 () Bool)

(assert (=> b!42846 (= e!27151 e!27150)))

(declare-fun lt!18095 () (_ BitVec 64))

(assert (=> b!42846 (= lt!18095 (select (arr!1381 lt!18057) #b00000000000000000000000000000000))))

(declare-fun lt!18096 () Unit!1171)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2875 (_ BitVec 64) (_ BitVec 32)) Unit!1171)

(assert (=> b!42846 (= lt!18096 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18057 lt!18095 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42846 (arrayContainsKey!0 lt!18057 lt!18095 #b00000000000000000000000000000000)))

(declare-fun lt!18097 () Unit!1171)

(assert (=> b!42846 (= lt!18097 lt!18096)))

(declare-fun res!25463 () Bool)

(declare-datatypes ((SeekEntryResult!195 0))(
  ( (MissingZero!195 (index!2902 (_ BitVec 32))) (Found!195 (index!2903 (_ BitVec 32))) (Intermediate!195 (undefined!1007 Bool) (index!2904 (_ BitVec 32)) (x!8203 (_ BitVec 32))) (Undefined!195) (MissingVacant!195 (index!2905 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2875 (_ BitVec 32)) SeekEntryResult!195)

(assert (=> b!42846 (= res!25463 (= (seekEntryOrOpen!0 (select (arr!1381 lt!18057) #b00000000000000000000000000000000) lt!18057 mask!853) (Found!195 #b00000000000000000000000000000000)))))

(assert (=> b!42846 (=> (not res!25463) (not e!27150))))

(assert (= (and d!7835 (not res!25464)) b!42845))

(assert (= (and b!42845 c!5427) b!42846))

(assert (= (and b!42845 (not c!5427)) b!42843))

(assert (= (and b!42846 res!25463) b!42844))

(assert (= (or b!42844 b!42843) bm!3376))

(declare-fun m!36625 () Bool)

(assert (=> bm!3376 m!36625))

(assert (=> b!42845 m!36595))

(assert (=> b!42845 m!36595))

(assert (=> b!42845 m!36597))

(assert (=> b!42846 m!36595))

(declare-fun m!36627 () Bool)

(assert (=> b!42846 m!36627))

(declare-fun m!36629 () Bool)

(assert (=> b!42846 m!36629))

(assert (=> b!42846 m!36595))

(declare-fun m!36631 () Bool)

(assert (=> b!42846 m!36631))

(assert (=> b!42798 d!7835))

(declare-fun d!7841 () Bool)

(declare-fun getCurrentListMap!348 (array!2875 array!2877 (_ BitVec 32) (_ BitVec 32) V!2273 V!2273 (_ BitVec 32) Int) ListLongMap!1173)

(assert (=> d!7841 (= (map!809 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!348 (_keys!3411 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1851 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5398 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1759 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1786 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1786 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1868 (LongMapFixedSize!351 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18055 lt!18055 #b00000000000000000000000000000000 lt!18057 (array!2878 ((as const (Array (_ BitVec 32) ValueCell!685)) EmptyCell!685) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1909 () Bool)

(assert (= bs!1909 d!7841))

(declare-fun m!36641 () Bool)

(assert (=> bs!1909 m!36641))

(assert (=> b!42798 d!7841))

(declare-fun b!42900 () Bool)

(declare-fun e!27192 () Bool)

(declare-fun call!3392 () Bool)

(assert (=> b!42900 (= e!27192 call!3392)))

(declare-fun b!42901 () Bool)

(declare-fun e!27191 () Bool)

(declare-fun e!27193 () Bool)

(assert (=> b!42901 (= e!27191 e!27193)))

(declare-fun res!25487 () Bool)

(assert (=> b!42901 (=> (not res!25487) (not e!27193))))

(declare-fun e!27190 () Bool)

(assert (=> b!42901 (= res!25487 (not e!27190))))

(declare-fun res!25488 () Bool)

(assert (=> b!42901 (=> (not res!25488) (not e!27190))))

(assert (=> b!42901 (= res!25488 (validKeyInArray!0 (select (arr!1381 lt!18057) #b00000000000000000000000000000000)))))

(declare-fun b!42902 () Bool)

(assert (=> b!42902 (= e!27193 e!27192)))

(declare-fun c!5444 () Bool)

(assert (=> b!42902 (= c!5444 (validKeyInArray!0 (select (arr!1381 lt!18057) #b00000000000000000000000000000000)))))

(declare-fun b!42903 () Bool)

(declare-fun contains!561 (List!1171 (_ BitVec 64)) Bool)

(assert (=> b!42903 (= e!27190 (contains!561 Nil!1168 (select (arr!1381 lt!18057) #b00000000000000000000000000000000)))))

(declare-fun b!42904 () Bool)

(assert (=> b!42904 (= e!27192 call!3392)))

(declare-fun bm!3389 () Bool)

(assert (=> bm!3389 (= call!3392 (arrayNoDuplicates!0 lt!18057 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5444 (Cons!1167 (select (arr!1381 lt!18057) #b00000000000000000000000000000000) Nil!1168) Nil!1168)))))

(declare-fun d!7847 () Bool)

(declare-fun res!25486 () Bool)

(assert (=> d!7847 (=> res!25486 e!27191)))

(assert (=> d!7847 (= res!25486 (bvsge #b00000000000000000000000000000000 (size!1560 lt!18057)))))

(assert (=> d!7847 (= (arrayNoDuplicates!0 lt!18057 #b00000000000000000000000000000000 Nil!1168) e!27191)))

(assert (= (and d!7847 (not res!25486)) b!42901))

(assert (= (and b!42901 res!25488) b!42903))

(assert (= (and b!42901 res!25487) b!42902))

(assert (= (and b!42902 c!5444) b!42904))

(assert (= (and b!42902 (not c!5444)) b!42900))

(assert (= (or b!42904 b!42900) bm!3389))

(assert (=> b!42901 m!36595))

(assert (=> b!42901 m!36595))

(assert (=> b!42901 m!36597))

(assert (=> b!42902 m!36595))

(assert (=> b!42902 m!36595))

(assert (=> b!42902 m!36597))

(assert (=> b!42903 m!36595))

(assert (=> b!42903 m!36595))

(declare-fun m!36657 () Bool)

(assert (=> b!42903 m!36657))

(assert (=> bm!3389 m!36595))

(declare-fun m!36661 () Bool)

(assert (=> bm!3389 m!36661))

(assert (=> b!42798 d!7847))

(declare-fun d!7857 () Bool)

(assert (=> d!7857 (= (isEmpty!276 (toList!602 lt!18059)) (is-Nil!1167 (toList!602 lt!18059)))))

(assert (=> b!42799 d!7857))

(declare-fun d!7859 () Bool)

(assert (=> d!7859 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6386 d!7859))

(push 1)

