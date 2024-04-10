; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6384 () Bool)

(assert start!6384)

(declare-fun b_free!1473 () Bool)

(declare-fun b_next!1473 () Bool)

(assert (=> start!6384 (= b_free!1473 (not b_next!1473))))

(declare-fun tp!5897 () Bool)

(declare-fun b_and!2595 () Bool)

(assert (=> start!6384 (= tp!5897 b_and!2595)))

(declare-fun res!25442 () Bool)

(declare-fun e!27118 () Bool)

(assert (=> start!6384 (=> (not res!25442) (not e!27118))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6384 (= res!25442 (validMask!0 mask!853))))

(assert (=> start!6384 e!27118))

(assert (=> start!6384 true))

(assert (=> start!6384 tp!5897))

(declare-fun b!42787 () Bool)

(declare-fun e!27117 () Bool)

(assert (=> b!42787 (= e!27118 (not e!27117))))

(declare-fun res!25443 () Bool)

(assert (=> b!42787 (=> res!25443 e!27117)))

(declare-datatypes ((V!2271 0))(
  ( (V!2272 (val!970 Int)) )
))
(declare-datatypes ((tuple2!1594 0))(
  ( (tuple2!1595 (_1!808 (_ BitVec 64)) (_2!808 V!2271)) )
))
(declare-datatypes ((List!1168 0))(
  ( (Nil!1165) (Cons!1164 (h!1741 tuple2!1594) (t!4137 List!1168)) )
))
(declare-datatypes ((ListLongMap!1171 0))(
  ( (ListLongMap!1172 (toList!601 List!1168)) )
))
(declare-fun lt!18036 () ListLongMap!1171)

(assert (=> b!42787 (= res!25443 (= lt!18036 (ListLongMap!1172 Nil!1165)))))

(declare-fun lt!18038 () V!2271)

(declare-datatypes ((array!2871 0))(
  ( (array!2872 (arr!1379 (Array (_ BitVec 32) (_ BitVec 64))) (size!1558 (_ BitVec 32))) )
))
(declare-fun lt!18040 () array!2871)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!684 0))(
  ( (ValueCellFull!684 (v!2060 V!2271)) (EmptyCell!684) )
))
(declare-datatypes ((array!2873 0))(
  ( (array!2874 (arr!1380 (Array (_ BitVec 32) ValueCell!684)) (size!1559 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!348 0))(
  ( (LongMapFixedSize!349 (defaultEntry!1867 Int) (mask!5397 (_ BitVec 32)) (extraKeys!1758 (_ BitVec 32)) (zeroValue!1785 V!2271) (minValue!1785 V!2271) (_size!223 (_ BitVec 32)) (_keys!3410 array!2871) (_values!1850 array!2873) (_vacant!223 (_ BitVec 32))) )
))
(declare-fun map!808 (LongMapFixedSize!348) ListLongMap!1171)

(assert (=> b!42787 (= lt!18036 (map!808 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1169 0))(
  ( (Nil!1166) (Cons!1165 (h!1742 (_ BitVec 64)) (t!4138 List!1169)) )
))
(declare-fun arrayNoDuplicates!0 (array!2871 (_ BitVec 32) List!1169) Bool)

(assert (=> b!42787 (arrayNoDuplicates!0 lt!18040 #b00000000000000000000000000000000 Nil!1166)))

(declare-datatypes ((Unit!1169 0))(
  ( (Unit!1170) )
))
(declare-fun lt!18039 () Unit!1169)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2871 (_ BitVec 32) (_ BitVec 32) List!1169) Unit!1169)

(assert (=> b!42787 (= lt!18039 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2871 (_ BitVec 32)) Bool)

(assert (=> b!42787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18040 mask!853)))

(declare-fun lt!18037 () Unit!1169)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2871 (_ BitVec 32) (_ BitVec 32)) Unit!1169)

(assert (=> b!42787 (= lt!18037 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18040 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2871 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42787 (= (arrayCountValidKeys!0 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18041 () Unit!1169)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2871 (_ BitVec 32) (_ BitVec 32)) Unit!1169)

(assert (=> b!42787 (= lt!18041 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42787 (= lt!18040 (array!2872 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!245 (Int (_ BitVec 64)) V!2271)

(assert (=> b!42787 (= lt!18038 (dynLambda!245 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42788 () Bool)

(declare-fun res!25441 () Bool)

(assert (=> b!42788 (=> res!25441 e!27117)))

(declare-fun isEmpty!275 (List!1168) Bool)

(assert (=> b!42788 (= res!25441 (isEmpty!275 (toList!601 lt!18036)))))

(declare-fun b!42789 () Bool)

(assert (=> b!42789 (= e!27117 (bvsge mask!853 #b00000000000000000000000000000000))))

(assert (= (and start!6384 res!25442) b!42787))

(assert (= (and b!42787 (not res!25443)) b!42788))

(assert (= (and b!42788 (not res!25441)) b!42789))

(declare-fun b_lambda!2209 () Bool)

(assert (=> (not b_lambda!2209) (not b!42787)))

(declare-fun t!4136 () Bool)

(declare-fun tb!955 () Bool)

(assert (=> (and start!6384 (= defaultEntry!470 defaultEntry!470) t!4136) tb!955))

(declare-fun result!1661 () Bool)

(declare-fun tp_is_empty!1863 () Bool)

(assert (=> tb!955 (= result!1661 tp_is_empty!1863)))

(assert (=> b!42787 t!4136))

(declare-fun b_and!2597 () Bool)

(assert (= b_and!2595 (and (=> t!4136 result!1661) b_and!2597)))

(declare-fun m!36553 () Bool)

(assert (=> start!6384 m!36553))

(declare-fun m!36555 () Bool)

(assert (=> b!42787 m!36555))

(declare-fun m!36557 () Bool)

(assert (=> b!42787 m!36557))

(declare-fun m!36559 () Bool)

(assert (=> b!42787 m!36559))

(declare-fun m!36561 () Bool)

(assert (=> b!42787 m!36561))

(declare-fun m!36563 () Bool)

(assert (=> b!42787 m!36563))

(declare-fun m!36565 () Bool)

(assert (=> b!42787 m!36565))

(declare-fun m!36567 () Bool)

(assert (=> b!42787 m!36567))

(declare-fun m!36569 () Bool)

(assert (=> b!42787 m!36569))

(declare-fun m!36571 () Bool)

(assert (=> b!42788 m!36571))

(check-sat tp_is_empty!1863 (not start!6384) (not b_lambda!2209) (not b_next!1473) (not b!42787) (not b!42788) b_and!2597)
(check-sat b_and!2597 (not b_next!1473))
(get-model)

(declare-fun b_lambda!2217 () Bool)

(assert (= b_lambda!2209 (or (and start!6384 b_free!1473) b_lambda!2217)))

(check-sat tp_is_empty!1863 (not start!6384) (not b_next!1473) (not b_lambda!2217) (not b!42787) (not b!42788) b_and!2597)
(check-sat b_and!2597 (not b_next!1473))
(get-model)

(declare-fun d!7815 () Bool)

(get-info :version)

(assert (=> d!7815 (= (isEmpty!275 (toList!601 lt!18036)) ((_ is Nil!1165) (toList!601 lt!18036)))))

(assert (=> b!42788 d!7815))

(declare-fun b!42823 () Bool)

(declare-fun e!27137 () Bool)

(declare-fun call!3374 () Bool)

(assert (=> b!42823 (= e!27137 call!3374)))

(declare-fun d!7817 () Bool)

(declare-fun res!25458 () Bool)

(declare-fun e!27139 () Bool)

(assert (=> d!7817 (=> res!25458 e!27139)))

(assert (=> d!7817 (= res!25458 (bvsge #b00000000000000000000000000000000 (size!1558 lt!18040)))))

(assert (=> d!7817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18040 mask!853) e!27139)))

(declare-fun b!42824 () Bool)

(declare-fun e!27138 () Bool)

(assert (=> b!42824 (= e!27138 e!27137)))

(declare-fun lt!18077 () (_ BitVec 64))

(assert (=> b!42824 (= lt!18077 (select (arr!1379 lt!18040) #b00000000000000000000000000000000))))

(declare-fun lt!18076 () Unit!1169)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2871 (_ BitVec 64) (_ BitVec 32)) Unit!1169)

(assert (=> b!42824 (= lt!18076 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18040 lt!18077 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42824 (arrayContainsKey!0 lt!18040 lt!18077 #b00000000000000000000000000000000)))

(declare-fun lt!18075 () Unit!1169)

(assert (=> b!42824 (= lt!18075 lt!18076)))

(declare-fun res!25457 () Bool)

(declare-datatypes ((SeekEntryResult!193 0))(
  ( (MissingZero!193 (index!2894 (_ BitVec 32))) (Found!193 (index!2895 (_ BitVec 32))) (Intermediate!193 (undefined!1005 Bool) (index!2896 (_ BitVec 32)) (x!8201 (_ BitVec 32))) (Undefined!193) (MissingVacant!193 (index!2897 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2871 (_ BitVec 32)) SeekEntryResult!193)

(assert (=> b!42824 (= res!25457 (= (seekEntryOrOpen!0 (select (arr!1379 lt!18040) #b00000000000000000000000000000000) lt!18040 mask!853) (Found!193 #b00000000000000000000000000000000)))))

(assert (=> b!42824 (=> (not res!25457) (not e!27137))))

(declare-fun bm!3371 () Bool)

(assert (=> bm!3371 (= call!3374 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18040 mask!853))))

(declare-fun b!42825 () Bool)

(assert (=> b!42825 (= e!27139 e!27138)))

(declare-fun c!5420 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42825 (= c!5420 (validKeyInArray!0 (select (arr!1379 lt!18040) #b00000000000000000000000000000000)))))

(declare-fun b!42826 () Bool)

(assert (=> b!42826 (= e!27138 call!3374)))

(assert (= (and d!7817 (not res!25458)) b!42825))

(assert (= (and b!42825 c!5420) b!42824))

(assert (= (and b!42825 (not c!5420)) b!42826))

(assert (= (and b!42824 res!25457) b!42823))

(assert (= (or b!42823 b!42826) bm!3371))

(declare-fun m!36603 () Bool)

(assert (=> b!42824 m!36603))

(declare-fun m!36605 () Bool)

(assert (=> b!42824 m!36605))

(declare-fun m!36607 () Bool)

(assert (=> b!42824 m!36607))

(assert (=> b!42824 m!36603))

(declare-fun m!36609 () Bool)

(assert (=> b!42824 m!36609))

(declare-fun m!36611 () Bool)

(assert (=> bm!3371 m!36611))

(assert (=> b!42825 m!36603))

(assert (=> b!42825 m!36603))

(declare-fun m!36613 () Bool)

(assert (=> b!42825 m!36613))

(assert (=> b!42787 d!7817))

(declare-fun d!7829 () Bool)

(assert (=> d!7829 (= (arrayCountValidKeys!0 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18085 () Unit!1169)

(declare-fun choose!59 (array!2871 (_ BitVec 32) (_ BitVec 32)) Unit!1169)

(assert (=> d!7829 (= lt!18085 (choose!59 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7829 (bvslt (size!1558 lt!18040) #b01111111111111111111111111111111)))

(assert (=> d!7829 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18085)))

(declare-fun bs!1905 () Bool)

(assert (= bs!1905 d!7829))

(assert (=> bs!1905 m!36565))

(declare-fun m!36617 () Bool)

(assert (=> bs!1905 m!36617))

(assert (=> b!42787 d!7829))

(declare-fun d!7833 () Bool)

(declare-fun getCurrentListMap!347 (array!2871 array!2873 (_ BitVec 32) (_ BitVec 32) V!2271 V!2271 (_ BitVec 32) Int) ListLongMap!1171)

(assert (=> d!7833 (= (map!808 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!347 (_keys!3410 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1850 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5397 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1758 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1785 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1785 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1867 (LongMapFixedSize!349 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18038 lt!18038 #b00000000000000000000000000000000 lt!18040 (array!2874 ((as const (Array (_ BitVec 32) ValueCell!684)) EmptyCell!684) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1908 () Bool)

(assert (= bs!1908 d!7833))

(declare-fun m!36623 () Bool)

(assert (=> bs!1908 m!36623))

(assert (=> b!42787 d!7833))

(declare-fun b!42860 () Bool)

(declare-fun e!27159 () (_ BitVec 32))

(declare-fun call!3383 () (_ BitVec 32))

(assert (=> b!42860 (= e!27159 call!3383)))

(declare-fun b!42861 () Bool)

(declare-fun e!27160 () (_ BitVec 32))

(assert (=> b!42861 (= e!27160 e!27159)))

(declare-fun c!5434 () Bool)

(assert (=> b!42861 (= c!5434 (validKeyInArray!0 (select (arr!1379 lt!18040) #b00000000000000000000000000000000)))))

(declare-fun b!42859 () Bool)

(assert (=> b!42859 (= e!27159 (bvadd #b00000000000000000000000000000001 call!3383))))

(declare-fun d!7839 () Bool)

(declare-fun lt!18101 () (_ BitVec 32))

(assert (=> d!7839 (and (bvsge lt!18101 #b00000000000000000000000000000000) (bvsle lt!18101 (bvsub (size!1558 lt!18040) #b00000000000000000000000000000000)))))

(assert (=> d!7839 (= lt!18101 e!27160)))

(declare-fun c!5435 () Bool)

(assert (=> d!7839 (= c!5435 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7839 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1558 lt!18040)))))

(assert (=> d!7839 (= (arrayCountValidKeys!0 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18101)))

(declare-fun b!42862 () Bool)

(assert (=> b!42862 (= e!27160 #b00000000000000000000000000000000)))

(declare-fun bm!3380 () Bool)

(assert (=> bm!3380 (= call!3383 (arrayCountValidKeys!0 lt!18040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7839 c!5435) b!42862))

(assert (= (and d!7839 (not c!5435)) b!42861))

(assert (= (and b!42861 c!5434) b!42859))

(assert (= (and b!42861 (not c!5434)) b!42860))

(assert (= (or b!42859 b!42860) bm!3380))

(assert (=> b!42861 m!36603))

(assert (=> b!42861 m!36603))

(assert (=> b!42861 m!36613))

(declare-fun m!36639 () Bool)

(assert (=> bm!3380 m!36639))

(assert (=> b!42787 d!7839))

(declare-fun b!42891 () Bool)

(declare-fun e!27187 () Bool)

(declare-fun call!3389 () Bool)

(assert (=> b!42891 (= e!27187 call!3389)))

(declare-fun d!7845 () Bool)

(declare-fun res!25483 () Bool)

(declare-fun e!27184 () Bool)

(assert (=> d!7845 (=> res!25483 e!27184)))

(assert (=> d!7845 (= res!25483 (bvsge #b00000000000000000000000000000000 (size!1558 lt!18040)))))

(assert (=> d!7845 (= (arrayNoDuplicates!0 lt!18040 #b00000000000000000000000000000000 Nil!1166) e!27184)))

(declare-fun b!42892 () Bool)

(declare-fun e!27185 () Bool)

(assert (=> b!42892 (= e!27185 e!27187)))

(declare-fun c!5441 () Bool)

(assert (=> b!42892 (= c!5441 (validKeyInArray!0 (select (arr!1379 lt!18040) #b00000000000000000000000000000000)))))

(declare-fun b!42893 () Bool)

(declare-fun e!27186 () Bool)

(declare-fun contains!559 (List!1169 (_ BitVec 64)) Bool)

(assert (=> b!42893 (= e!27186 (contains!559 Nil!1166 (select (arr!1379 lt!18040) #b00000000000000000000000000000000)))))

(declare-fun b!42894 () Bool)

(assert (=> b!42894 (= e!27187 call!3389)))

(declare-fun bm!3386 () Bool)

(assert (=> bm!3386 (= call!3389 (arrayNoDuplicates!0 lt!18040 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5441 (Cons!1165 (select (arr!1379 lt!18040) #b00000000000000000000000000000000) Nil!1166) Nil!1166)))))

(declare-fun b!42895 () Bool)

(assert (=> b!42895 (= e!27184 e!27185)))

(declare-fun res!25484 () Bool)

(assert (=> b!42895 (=> (not res!25484) (not e!27185))))

(assert (=> b!42895 (= res!25484 (not e!27186))))

(declare-fun res!25485 () Bool)

(assert (=> b!42895 (=> (not res!25485) (not e!27186))))

(assert (=> b!42895 (= res!25485 (validKeyInArray!0 (select (arr!1379 lt!18040) #b00000000000000000000000000000000)))))

(assert (= (and d!7845 (not res!25483)) b!42895))

(assert (= (and b!42895 res!25485) b!42893))

(assert (= (and b!42895 res!25484) b!42892))

(assert (= (and b!42892 c!5441) b!42891))

(assert (= (and b!42892 (not c!5441)) b!42894))

(assert (= (or b!42891 b!42894) bm!3386))

(assert (=> b!42892 m!36603))

(assert (=> b!42892 m!36603))

(assert (=> b!42892 m!36613))

(assert (=> b!42893 m!36603))

(assert (=> b!42893 m!36603))

(declare-fun m!36651 () Bool)

(assert (=> b!42893 m!36651))

(assert (=> bm!3386 m!36603))

(declare-fun m!36653 () Bool)

(assert (=> bm!3386 m!36653))

(assert (=> b!42895 m!36603))

(assert (=> b!42895 m!36603))

(assert (=> b!42895 m!36613))

(assert (=> b!42787 d!7845))

(declare-fun d!7851 () Bool)

(assert (=> d!7851 (arrayNoDuplicates!0 lt!18040 #b00000000000000000000000000000000 Nil!1166)))

(declare-fun lt!18116 () Unit!1169)

(declare-fun choose!111 (array!2871 (_ BitVec 32) (_ BitVec 32) List!1169) Unit!1169)

(assert (=> d!7851 (= lt!18116 (choose!111 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1166))))

(assert (=> d!7851 (= (size!1558 lt!18040) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7851 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18040 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1166) lt!18116)))

(declare-fun bs!1911 () Bool)

(assert (= bs!1911 d!7851))

(assert (=> bs!1911 m!36563))

(declare-fun m!36659 () Bool)

(assert (=> bs!1911 m!36659))

(assert (=> b!42787 d!7851))

(declare-fun d!7855 () Bool)

(assert (=> d!7855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18040 mask!853)))

(declare-fun lt!18122 () Unit!1169)

(declare-fun choose!34 (array!2871 (_ BitVec 32) (_ BitVec 32)) Unit!1169)

(assert (=> d!7855 (= lt!18122 (choose!34 lt!18040 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7855 (validMask!0 mask!853)))

(assert (=> d!7855 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18040 mask!853 #b00000000000000000000000000000000) lt!18122)))

(declare-fun bs!1913 () Bool)

(assert (= bs!1913 d!7855))

(assert (=> bs!1913 m!36567))

(declare-fun m!36665 () Bool)

(assert (=> bs!1913 m!36665))

(assert (=> bs!1913 m!36553))

(assert (=> b!42787 d!7855))

(declare-fun d!7863 () Bool)

(assert (=> d!7863 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6384 d!7863))

(check-sat tp_is_empty!1863 (not b!42825) (not d!7851) (not b!42895) (not bm!3371) (not bm!3380) (not b_next!1473) (not b_lambda!2217) (not d!7829) (not b!42861) (not d!7833) (not b!42824) b_and!2597 (not bm!3386) (not b!42892) (not d!7855) (not b!42893))
(check-sat b_and!2597 (not b_next!1473))
