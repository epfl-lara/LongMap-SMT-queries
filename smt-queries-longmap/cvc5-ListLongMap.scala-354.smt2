; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6466 () Bool)

(assert start!6466)

(declare-fun b_free!1501 () Bool)

(declare-fun b_next!1501 () Bool)

(assert (=> start!6466 (= b_free!1501 (not b_next!1501))))

(declare-fun tp!5939 () Bool)

(declare-fun b_and!2651 () Bool)

(assert (=> start!6466 (= tp!5939 b_and!2651)))

(declare-fun res!25542 () Bool)

(declare-fun e!27246 () Bool)

(assert (=> start!6466 (=> (not res!25542) (not e!27246))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6466 (= res!25542 (validMask!0 mask!853))))

(assert (=> start!6466 e!27246))

(assert (=> start!6466 true))

(assert (=> start!6466 tp!5939))

(declare-fun b!42989 () Bool)

(declare-fun res!25545 () Bool)

(declare-fun e!27247 () Bool)

(assert (=> b!42989 (=> res!25545 e!27247)))

(declare-datatypes ((V!2309 0))(
  ( (V!2310 (val!984 Int)) )
))
(declare-datatypes ((tuple2!1622 0))(
  ( (tuple2!1623 (_1!822 (_ BitVec 64)) (_2!822 V!2309)) )
))
(declare-datatypes ((List!1196 0))(
  ( (Nil!1193) (Cons!1192 (h!1769 tuple2!1622) (t!4193 List!1196)) )
))
(declare-datatypes ((ListLongMap!1199 0))(
  ( (ListLongMap!1200 (toList!615 List!1196)) )
))
(declare-fun lt!18357 () ListLongMap!1199)

(declare-fun isEmpty!277 (List!1196) Bool)

(assert (=> b!42989 (= res!25545 (isEmpty!277 (toList!615 lt!18357)))))

(declare-fun b!42990 () Bool)

(declare-fun res!25544 () Bool)

(assert (=> b!42990 (=> res!25544 e!27247)))

(assert (=> b!42990 (= res!25544 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-datatypes ((ValueCell!698 0))(
  ( (ValueCellFull!698 (v!2074 V!2309)) (EmptyCell!698) )
))
(declare-datatypes ((array!2927 0))(
  ( (array!2928 (arr!1407 (Array (_ BitVec 32) ValueCell!698)) (size!1592 (_ BitVec 32))) )
))
(declare-fun lt!18355 () array!2927)

(declare-fun b!42991 () Bool)

(declare-datatypes ((array!2929 0))(
  ( (array!2930 (arr!1408 (Array (_ BitVec 32) (_ BitVec 64))) (size!1593 (_ BitVec 32))) )
))
(declare-fun lt!18353 () array!2929)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!18358 () V!2309)

(declare-fun contains!562 (ListLongMap!1199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!349 (array!2929 array!2927 (_ BitVec 32) (_ BitVec 32) V!2309 V!2309 (_ BitVec 32) Int) ListLongMap!1199)

(declare-fun head!887 (List!1196) tuple2!1622)

(assert (=> b!42991 (= e!27247 (contains!562 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470) (_1!822 (head!887 (toList!615 lt!18357)))))))

(declare-fun b!42988 () Bool)

(assert (=> b!42988 (= e!27246 (not e!27247))))

(declare-fun res!25543 () Bool)

(assert (=> b!42988 (=> res!25543 e!27247)))

(assert (=> b!42988 (= res!25543 (= lt!18357 (ListLongMap!1200 Nil!1193)))))

(declare-datatypes ((LongMapFixedSize!376 0))(
  ( (LongMapFixedSize!377 (defaultEntry!1881 Int) (mask!5430 (_ BitVec 32)) (extraKeys!1772 (_ BitVec 32)) (zeroValue!1799 V!2309) (minValue!1799 V!2309) (_size!237 (_ BitVec 32)) (_keys!3430 array!2929) (_values!1864 array!2927) (_vacant!237 (_ BitVec 32))) )
))
(declare-fun map!832 (LongMapFixedSize!376) ListLongMap!1199)

(assert (=> b!42988 (= lt!18357 (map!832 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1197 0))(
  ( (Nil!1194) (Cons!1193 (h!1770 (_ BitVec 64)) (t!4194 List!1197)) )
))
(declare-fun arrayNoDuplicates!0 (array!2929 (_ BitVec 32) List!1197) Bool)

(assert (=> b!42988 (arrayNoDuplicates!0 lt!18353 #b00000000000000000000000000000000 Nil!1194)))

(declare-datatypes ((Unit!1197 0))(
  ( (Unit!1198) )
))
(declare-fun lt!18354 () Unit!1197)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2929 (_ BitVec 32) (_ BitVec 32) List!1197) Unit!1197)

(assert (=> b!42988 (= lt!18354 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2929 (_ BitVec 32)) Bool)

(assert (=> b!42988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18353 mask!853)))

(declare-fun lt!18356 () Unit!1197)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2929 (_ BitVec 32) (_ BitVec 32)) Unit!1197)

(assert (=> b!42988 (= lt!18356 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18353 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2929 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42988 (= (arrayCountValidKeys!0 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18359 () Unit!1197)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2929 (_ BitVec 32) (_ BitVec 32)) Unit!1197)

(assert (=> b!42988 (= lt!18359 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42988 (= lt!18355 (array!2928 ((as const (Array (_ BitVec 32) ValueCell!698)) EmptyCell!698) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42988 (= lt!18353 (array!2930 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!259 (Int (_ BitVec 64)) V!2309)

(assert (=> b!42988 (= lt!18358 (dynLambda!259 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6466 res!25542) b!42988))

(assert (= (and b!42988 (not res!25543)) b!42989))

(assert (= (and b!42989 (not res!25545)) b!42990))

(assert (= (and b!42990 (not res!25544)) b!42991))

(declare-fun b_lambda!2243 () Bool)

(assert (=> (not b_lambda!2243) (not b!42988)))

(declare-fun t!4192 () Bool)

(declare-fun tb!983 () Bool)

(assert (=> (and start!6466 (= defaultEntry!470 defaultEntry!470) t!4192) tb!983))

(declare-fun result!1717 () Bool)

(declare-fun tp_is_empty!1891 () Bool)

(assert (=> tb!983 (= result!1717 tp_is_empty!1891)))

(assert (=> b!42988 t!4192))

(declare-fun b_and!2653 () Bool)

(assert (= b_and!2651 (and (=> t!4192 result!1717) b_and!2653)))

(declare-fun m!36887 () Bool)

(assert (=> start!6466 m!36887))

(declare-fun m!36889 () Bool)

(assert (=> b!42989 m!36889))

(declare-fun m!36891 () Bool)

(assert (=> b!42991 m!36891))

(declare-fun m!36893 () Bool)

(assert (=> b!42991 m!36893))

(assert (=> b!42991 m!36891))

(declare-fun m!36895 () Bool)

(assert (=> b!42991 m!36895))

(declare-fun m!36897 () Bool)

(assert (=> b!42988 m!36897))

(declare-fun m!36899 () Bool)

(assert (=> b!42988 m!36899))

(declare-fun m!36901 () Bool)

(assert (=> b!42988 m!36901))

(declare-fun m!36903 () Bool)

(assert (=> b!42988 m!36903))

(declare-fun m!36905 () Bool)

(assert (=> b!42988 m!36905))

(declare-fun m!36907 () Bool)

(assert (=> b!42988 m!36907))

(declare-fun m!36909 () Bool)

(assert (=> b!42988 m!36909))

(declare-fun m!36911 () Bool)

(assert (=> b!42988 m!36911))

(push 1)

(assert tp_is_empty!1891)

(assert b_and!2653)

(assert (not b_lambda!2243))

(assert (not b!42988))

(assert (not b!42989))

(assert (not b_next!1501))

(assert (not b!42991))

(assert (not start!6466))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2653)

(assert (not b_next!1501))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2251 () Bool)

(assert (= b_lambda!2243 (or (and start!6466 b_free!1501) b_lambda!2251)))

(push 1)

(assert tp_is_empty!1891)

(assert b_and!2653)

(assert (not b!42988))

(assert (not b!42989))

(assert (not b!42991))

(assert (not start!6466))

(assert (not b_lambda!2251))

(assert (not b_next!1501))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2653)

(assert (not b_next!1501))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7875 () Bool)

(assert (=> d!7875 (arrayNoDuplicates!0 lt!18353 #b00000000000000000000000000000000 Nil!1194)))

(declare-fun lt!18404 () Unit!1197)

(declare-fun choose!111 (array!2929 (_ BitVec 32) (_ BitVec 32) List!1197) Unit!1197)

(assert (=> d!7875 (= lt!18404 (choose!111 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1194))))

(assert (=> d!7875 (= (size!1593 lt!18353) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7875 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1194) lt!18404)))

(declare-fun bs!1929 () Bool)

(assert (= bs!1929 d!7875))

(assert (=> bs!1929 m!36897))

(declare-fun m!36965 () Bool)

(assert (=> bs!1929 m!36965))

(assert (=> b!42988 d!7875))

(declare-fun d!7883 () Bool)

(assert (=> d!7883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18353 mask!853)))

(declare-fun lt!18415 () Unit!1197)

(declare-fun choose!34 (array!2929 (_ BitVec 32) (_ BitVec 32)) Unit!1197)

(assert (=> d!7883 (= lt!18415 (choose!34 lt!18353 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7883 (validMask!0 mask!853)))

(assert (=> d!7883 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18353 mask!853 #b00000000000000000000000000000000) lt!18415)))

(declare-fun bs!1930 () Bool)

(assert (= bs!1930 d!7883))

(assert (=> bs!1930 m!36899))

(declare-fun m!36967 () Bool)

(assert (=> bs!1930 m!36967))

(assert (=> bs!1930 m!36887))

(assert (=> b!42988 d!7883))

(declare-fun d!7885 () Bool)

(assert (=> d!7885 (= (arrayCountValidKeys!0 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18422 () Unit!1197)

(declare-fun choose!59 (array!2929 (_ BitVec 32) (_ BitVec 32)) Unit!1197)

(assert (=> d!7885 (= lt!18422 (choose!59 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7885 (bvslt (size!1593 lt!18353) #b01111111111111111111111111111111)))

(assert (=> d!7885 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18422)))

(declare-fun bs!1931 () Bool)

(assert (= bs!1931 d!7885))

(assert (=> bs!1931 m!36903))

(declare-fun m!36977 () Bool)

(assert (=> bs!1931 m!36977))

(assert (=> b!42988 d!7885))

(declare-fun b!43047 () Bool)

(declare-fun e!27280 () Bool)

(declare-fun e!27281 () Bool)

(assert (=> b!43047 (= e!27280 e!27281)))

(declare-fun res!25582 () Bool)

(assert (=> b!43047 (=> (not res!25582) (not e!27281))))

(declare-fun e!27279 () Bool)

(assert (=> b!43047 (= res!25582 (not e!27279))))

(declare-fun res!25581 () Bool)

(assert (=> b!43047 (=> (not res!25581) (not e!27279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!43047 (= res!25581 (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43048 () Bool)

(declare-fun contains!565 (List!1197 (_ BitVec 64)) Bool)

(assert (=> b!43048 (= e!27279 (contains!565 Nil!1194 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43049 () Bool)

(declare-fun e!27278 () Bool)

(declare-fun call!3398 () Bool)

(assert (=> b!43049 (= e!27278 call!3398)))

(declare-fun b!43050 () Bool)

(assert (=> b!43050 (= e!27278 call!3398)))

(declare-fun bm!3395 () Bool)

(declare-fun c!5455 () Bool)

(assert (=> bm!3395 (= call!3398 (arrayNoDuplicates!0 lt!18353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5455 (Cons!1193 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) Nil!1194) Nil!1194)))))

(declare-fun b!43051 () Bool)

(assert (=> b!43051 (= e!27281 e!27278)))

(assert (=> b!43051 (= c!5455 (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun d!7889 () Bool)

(declare-fun res!25583 () Bool)

(assert (=> d!7889 (=> res!25583 e!27280)))

(assert (=> d!7889 (= res!25583 (bvsge #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(assert (=> d!7889 (= (arrayNoDuplicates!0 lt!18353 #b00000000000000000000000000000000 Nil!1194) e!27280)))

(assert (= (and d!7889 (not res!25583)) b!43047))

(assert (= (and b!43047 res!25581) b!43048))

(assert (= (and b!43047 res!25582) b!43051))

(assert (= (and b!43051 c!5455) b!43050))

(assert (= (and b!43051 (not c!5455)) b!43049))

(assert (= (or b!43050 b!43049) bm!3395))

(declare-fun m!36979 () Bool)

(assert (=> b!43047 m!36979))

(assert (=> b!43047 m!36979))

(declare-fun m!36981 () Bool)

(assert (=> b!43047 m!36981))

(assert (=> b!43048 m!36979))

(assert (=> b!43048 m!36979))

(declare-fun m!36983 () Bool)

(assert (=> b!43048 m!36983))

(assert (=> bm!3395 m!36979))

(declare-fun m!36985 () Bool)

(assert (=> bm!3395 m!36985))

(assert (=> b!43051 m!36979))

(assert (=> b!43051 m!36979))

(assert (=> b!43051 m!36981))

(assert (=> b!42988 d!7889))

(declare-fun b!43063 () Bool)

(declare-fun e!27292 () Bool)

(declare-fun call!3401 () Bool)

(assert (=> b!43063 (= e!27292 call!3401)))

(declare-fun d!7893 () Bool)

(declare-fun res!25590 () Bool)

(declare-fun e!27290 () Bool)

(assert (=> d!7893 (=> res!25590 e!27290)))

(assert (=> d!7893 (= res!25590 (bvsge #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(assert (=> d!7893 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18353 mask!853) e!27290)))

(declare-fun b!43064 () Bool)

(declare-fun e!27291 () Bool)

(assert (=> b!43064 (= e!27291 e!27292)))

(declare-fun lt!18442 () (_ BitVec 64))

(assert (=> b!43064 (= lt!18442 (select (arr!1408 lt!18353) #b00000000000000000000000000000000))))

(declare-fun lt!18443 () Unit!1197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2929 (_ BitVec 64) (_ BitVec 32)) Unit!1197)

(assert (=> b!43064 (= lt!18443 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18353 lt!18442 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43064 (arrayContainsKey!0 lt!18353 lt!18442 #b00000000000000000000000000000000)))

(declare-fun lt!18441 () Unit!1197)

(assert (=> b!43064 (= lt!18441 lt!18443)))

(declare-fun res!25589 () Bool)

(declare-datatypes ((SeekEntryResult!196 0))(
  ( (MissingZero!196 (index!2906 (_ BitVec 32))) (Found!196 (index!2907 (_ BitVec 32))) (Intermediate!196 (undefined!1008 Bool) (index!2908 (_ BitVec 32)) (x!8285 (_ BitVec 32))) (Undefined!196) (MissingVacant!196 (index!2909 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2929 (_ BitVec 32)) SeekEntryResult!196)

(assert (=> b!43064 (= res!25589 (= (seekEntryOrOpen!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) lt!18353 mask!853) (Found!196 #b00000000000000000000000000000000)))))

(assert (=> b!43064 (=> (not res!25589) (not e!27292))))

(declare-fun b!43065 () Bool)

(assert (=> b!43065 (= e!27291 call!3401)))

(declare-fun b!43066 () Bool)

(assert (=> b!43066 (= e!27290 e!27291)))

(declare-fun c!5459 () Bool)

(assert (=> b!43066 (= c!5459 (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun bm!3398 () Bool)

(assert (=> bm!3398 (= call!3401 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18353 mask!853))))

(assert (= (and d!7893 (not res!25590)) b!43066))

(assert (= (and b!43066 c!5459) b!43064))

(assert (= (and b!43066 (not c!5459)) b!43065))

(assert (= (and b!43064 res!25589) b!43063))

(assert (= (or b!43063 b!43065) bm!3398))

(assert (=> b!43064 m!36979))

(declare-fun m!36995 () Bool)

(assert (=> b!43064 m!36995))

(declare-fun m!36997 () Bool)

(assert (=> b!43064 m!36997))

(assert (=> b!43064 m!36979))

(declare-fun m!36999 () Bool)

(assert (=> b!43064 m!36999))

(assert (=> b!43066 m!36979))

(assert (=> b!43066 m!36979))

(assert (=> b!43066 m!36981))

(declare-fun m!37001 () Bool)

(assert (=> bm!3398 m!37001))

(assert (=> b!42988 d!7893))

(declare-fun d!7897 () Bool)

(assert (=> d!7897 (= (map!832 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (getCurrentListMap!349 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))

(declare-fun bs!1932 () Bool)

(assert (= bs!1932 d!7897))

(declare-fun m!37003 () Bool)

(assert (=> bs!1932 m!37003))

(assert (=> b!42988 d!7897))

(declare-fun b!43075 () Bool)

(declare-fun e!27298 () (_ BitVec 32))

(declare-fun call!3404 () (_ BitVec 32))

(assert (=> b!43075 (= e!27298 call!3404)))

(declare-fun b!43076 () Bool)

(assert (=> b!43076 (= e!27298 (bvadd #b00000000000000000000000000000001 call!3404))))

(declare-fun d!7899 () Bool)

(declare-fun lt!18446 () (_ BitVec 32))

(assert (=> d!7899 (and (bvsge lt!18446 #b00000000000000000000000000000000) (bvsle lt!18446 (bvsub (size!1593 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun e!27297 () (_ BitVec 32))

(assert (=> d!7899 (= lt!18446 e!27297)))

(declare-fun c!5464 () Bool)

(assert (=> d!7899 (= c!5464 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7899 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1593 lt!18353)))))

(assert (=> d!7899 (= (arrayCountValidKeys!0 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18446)))

(declare-fun b!43077 () Bool)

(assert (=> b!43077 (= e!27297 e!27298)))

(declare-fun c!5465 () Bool)

(assert (=> b!43077 (= c!5465 (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43078 () Bool)

(assert (=> b!43078 (= e!27297 #b00000000000000000000000000000000)))

(declare-fun bm!3401 () Bool)

(assert (=> bm!3401 (= call!3404 (arrayCountValidKeys!0 lt!18353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7899 c!5464) b!43078))

(assert (= (and d!7899 (not c!5464)) b!43077))

(assert (= (and b!43077 c!5465) b!43076))

(assert (= (and b!43077 (not c!5465)) b!43075))

(assert (= (or b!43076 b!43075) bm!3401))

(assert (=> b!43077 m!36979))

(assert (=> b!43077 m!36979))

(assert (=> b!43077 m!36981))

(declare-fun m!37005 () Bool)

(assert (=> bm!3401 m!37005))

(assert (=> b!42988 d!7899))

(declare-fun d!7901 () Bool)

(assert (=> d!7901 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6466 d!7901))

(declare-fun d!7903 () Bool)

(assert (=> d!7903 (= (isEmpty!277 (toList!615 lt!18357)) (is-Nil!1193 (toList!615 lt!18357)))))

(assert (=> b!42989 d!7903))

(declare-fun d!7905 () Bool)

(declare-fun e!27304 () Bool)

(assert (=> d!7905 e!27304))

(declare-fun res!25593 () Bool)

(assert (=> d!7905 (=> res!25593 e!27304)))

(declare-fun lt!18458 () Bool)

(assert (=> d!7905 (= res!25593 (not lt!18458))))

(declare-fun lt!18457 () Bool)

(assert (=> d!7905 (= lt!18458 lt!18457)))

(declare-fun lt!18455 () Unit!1197)

(declare-fun e!27303 () Unit!1197)

(assert (=> d!7905 (= lt!18455 e!27303)))

(declare-fun c!5468 () Bool)

(assert (=> d!7905 (= c!5468 lt!18457)))

(declare-fun containsKey!74 (List!1196 (_ BitVec 64)) Bool)

(assert (=> d!7905 (= lt!18457 (containsKey!74 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))))))

(assert (=> d!7905 (= (contains!562 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470) (_1!822 (head!887 (toList!615 lt!18357)))) lt!18458)))

(declare-fun b!43085 () Bool)

(declare-fun lt!18456 () Unit!1197)

(assert (=> b!43085 (= e!27303 lt!18456)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!62 (List!1196 (_ BitVec 64)) Unit!1197)

(assert (=> b!43085 (= lt!18456 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))))))

(declare-datatypes ((Option!112 0))(
  ( (Some!111 (v!2079 V!2309)) (None!110) )
))
(declare-fun isDefined!63 (Option!112) Bool)

(declare-fun getValueByKey!106 (List!1196 (_ BitVec 64)) Option!112)

(assert (=> b!43085 (isDefined!63 (getValueByKey!106 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))))))

(declare-fun b!43086 () Bool)

(declare-fun Unit!1206 () Unit!1197)

(assert (=> b!43086 (= e!27303 Unit!1206)))

(declare-fun b!43087 () Bool)

(assert (=> b!43087 (= e!27304 (isDefined!63 (getValueByKey!106 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357))))))))

(assert (= (and d!7905 c!5468) b!43085))

(assert (= (and d!7905 (not c!5468)) b!43086))

(assert (= (and d!7905 (not res!25593)) b!43087))

(declare-fun m!37007 () Bool)

(assert (=> d!7905 m!37007))

(declare-fun m!37009 () Bool)

(assert (=> b!43085 m!37009))

(declare-fun m!37011 () Bool)

(assert (=> b!43085 m!37011))

(assert (=> b!43085 m!37011))

(declare-fun m!37013 () Bool)

(assert (=> b!43085 m!37013))

(assert (=> b!43087 m!37011))

(assert (=> b!43087 m!37011))

(assert (=> b!43087 m!37013))

(assert (=> b!42991 d!7905))

(declare-fun bm!3476 () Bool)

(declare-fun call!3479 () ListLongMap!1199)

(declare-fun call!3481 () ListLongMap!1199)

(assert (=> bm!3476 (= call!3479 call!3481)))

(declare-fun b!43334 () Bool)

(declare-fun e!27471 () ListLongMap!1199)

(declare-fun call!3485 () ListLongMap!1199)

(assert (=> b!43334 (= e!27471 call!3485)))

(declare-fun b!43335 () Bool)

(declare-fun e!27467 () Bool)

(assert (=> b!43335 (= e!27467 (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43336 () Bool)

(declare-fun e!27465 () Bool)

(declare-fun e!27470 () Bool)

(assert (=> b!43336 (= e!27465 e!27470)))

(declare-fun res!25699 () Bool)

(assert (=> b!43336 (=> (not res!25699) (not e!27470))))

(declare-fun lt!18682 () ListLongMap!1199)

(assert (=> b!43336 (= res!25699 (contains!562 lt!18682 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(assert (=> b!43336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(declare-fun call!3480 () ListLongMap!1199)

(declare-fun bm!3477 () Bool)

(declare-fun c!5543 () Bool)

(declare-fun call!3484 () ListLongMap!1199)

(declare-fun c!5546 () Bool)

(declare-fun +!69 (ListLongMap!1199 tuple2!1622) ListLongMap!1199)

(assert (=> bm!3477 (= call!3484 (+!69 (ite c!5546 call!3481 (ite c!5543 call!3479 call!3480)) (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))))))

(declare-fun b!43337 () Bool)

(declare-fun e!27466 () Bool)

(declare-fun call!3482 () Bool)

(assert (=> b!43337 (= e!27466 (not call!3482))))

(declare-fun bm!3478 () Bool)

(assert (=> bm!3478 (= call!3480 call!3479)))

(declare-fun bm!3479 () Bool)

(declare-fun call!3483 () Bool)

(assert (=> bm!3479 (= call!3483 (contains!562 lt!18682 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43338 () Bool)

(declare-fun e!27472 () Bool)

(declare-fun apply!60 (ListLongMap!1199 (_ BitVec 64)) V!2309)

(assert (=> b!43338 (= e!27472 (= (apply!60 lt!18682 #b1000000000000000000000000000000000000000000000000000000000000000) lt!18358))))

(declare-fun b!43339 () Bool)

(declare-fun e!27468 () ListLongMap!1199)

(assert (=> b!43339 (= e!27468 call!3480)))

(declare-fun b!43340 () Bool)

(declare-fun e!27463 () Bool)

(assert (=> b!43340 (= e!27466 e!27463)))

(declare-fun res!25696 () Bool)

(assert (=> b!43340 (= res!25696 call!3482)))

(assert (=> b!43340 (=> (not res!25696) (not e!27463))))

(declare-fun b!43341 () Bool)

(declare-fun e!27464 () ListLongMap!1199)

(assert (=> b!43341 (= e!27464 e!27471)))

(assert (=> b!43341 (= c!5543 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43342 () Bool)

(declare-fun e!27473 () Bool)

(declare-fun e!27469 () Bool)

(assert (=> b!43342 (= e!27473 e!27469)))

(declare-fun c!5542 () Bool)

(assert (=> b!43342 (= c!5542 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43343 () Bool)

(assert (=> b!43343 (= e!27469 e!27472)))

(declare-fun res!25700 () Bool)

(assert (=> b!43343 (= res!25700 call!3483)))

(assert (=> b!43343 (=> (not res!25700) (not e!27472))))

(declare-fun bm!3480 () Bool)

(assert (=> bm!3480 (= call!3482 (contains!562 lt!18682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43344 () Bool)

(assert (=> b!43344 (= e!27468 call!3485)))

(declare-fun b!43345 () Bool)

(declare-fun e!27475 () Unit!1197)

(declare-fun lt!18681 () Unit!1197)

(assert (=> b!43345 (= e!27475 lt!18681)))

(declare-fun lt!18678 () ListLongMap!1199)

(declare-fun getCurrentListMapNoExtraKeys!38 (array!2929 array!2927 (_ BitVec 32) (_ BitVec 32) V!2309 V!2309 (_ BitVec 32) Int) ListLongMap!1199)

(assert (=> b!43345 (= lt!18678 (getCurrentListMapNoExtraKeys!38 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18686 () (_ BitVec 64))

(assert (=> b!43345 (= lt!18686 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18685 () (_ BitVec 64))

(assert (=> b!43345 (= lt!18685 (select (arr!1408 lt!18353) #b00000000000000000000000000000000))))

(declare-fun lt!18692 () Unit!1197)

(declare-fun addStillContains!36 (ListLongMap!1199 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1197)

(assert (=> b!43345 (= lt!18692 (addStillContains!36 lt!18678 lt!18686 lt!18358 lt!18685))))

(assert (=> b!43345 (contains!562 (+!69 lt!18678 (tuple2!1623 lt!18686 lt!18358)) lt!18685)))

(declare-fun lt!18675 () Unit!1197)

(assert (=> b!43345 (= lt!18675 lt!18692)))

(declare-fun lt!18680 () ListLongMap!1199)

(assert (=> b!43345 (= lt!18680 (getCurrentListMapNoExtraKeys!38 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18679 () (_ BitVec 64))

(assert (=> b!43345 (= lt!18679 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18674 () (_ BitVec 64))

(assert (=> b!43345 (= lt!18674 (select (arr!1408 lt!18353) #b00000000000000000000000000000000))))

(declare-fun lt!18695 () Unit!1197)

(declare-fun addApplyDifferent!36 (ListLongMap!1199 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1197)

(assert (=> b!43345 (= lt!18695 (addApplyDifferent!36 lt!18680 lt!18679 lt!18358 lt!18674))))

(assert (=> b!43345 (= (apply!60 (+!69 lt!18680 (tuple2!1623 lt!18679 lt!18358)) lt!18674) (apply!60 lt!18680 lt!18674))))

(declare-fun lt!18691 () Unit!1197)

(assert (=> b!43345 (= lt!18691 lt!18695)))

(declare-fun lt!18693 () ListLongMap!1199)

(assert (=> b!43345 (= lt!18693 (getCurrentListMapNoExtraKeys!38 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18690 () (_ BitVec 64))

(assert (=> b!43345 (= lt!18690 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18694 () (_ BitVec 64))

(assert (=> b!43345 (= lt!18694 (select (arr!1408 lt!18353) #b00000000000000000000000000000000))))

(declare-fun lt!18688 () Unit!1197)

(assert (=> b!43345 (= lt!18688 (addApplyDifferent!36 lt!18693 lt!18690 lt!18358 lt!18694))))

(assert (=> b!43345 (= (apply!60 (+!69 lt!18693 (tuple2!1623 lt!18690 lt!18358)) lt!18694) (apply!60 lt!18693 lt!18694))))

(declare-fun lt!18676 () Unit!1197)

(assert (=> b!43345 (= lt!18676 lt!18688)))

(declare-fun lt!18677 () ListLongMap!1199)

(assert (=> b!43345 (= lt!18677 (getCurrentListMapNoExtraKeys!38 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18689 () (_ BitVec 64))

(assert (=> b!43345 (= lt!18689 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18683 () (_ BitVec 64))

(assert (=> b!43345 (= lt!18683 (select (arr!1408 lt!18353) #b00000000000000000000000000000000))))

(assert (=> b!43345 (= lt!18681 (addApplyDifferent!36 lt!18677 lt!18689 lt!18358 lt!18683))))

(assert (=> b!43345 (= (apply!60 (+!69 lt!18677 (tuple2!1623 lt!18689 lt!18358)) lt!18683) (apply!60 lt!18677 lt!18683))))

(declare-fun b!43346 () Bool)

(declare-fun Unit!1208 () Unit!1197)

(assert (=> b!43346 (= e!27475 Unit!1208)))

(declare-fun b!43347 () Bool)

(assert (=> b!43347 (= e!27469 (not call!3483))))

(declare-fun d!7907 () Bool)

(assert (=> d!7907 e!27473))

(declare-fun res!25703 () Bool)

(assert (=> d!7907 (=> (not res!25703) (not e!27473))))

(assert (=> d!7907 (= res!25703 (or (bvsge #b00000000000000000000000000000000 (size!1593 lt!18353)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))))

(declare-fun lt!18684 () ListLongMap!1199)

(assert (=> d!7907 (= lt!18682 lt!18684)))

(declare-fun lt!18687 () Unit!1197)

(assert (=> d!7907 (= lt!18687 e!27475)))

(declare-fun c!5541 () Bool)

(assert (=> d!7907 (= c!5541 e!27467)))

(declare-fun res!25704 () Bool)

(assert (=> d!7907 (=> (not res!25704) (not e!27467))))

(assert (=> d!7907 (= res!25704 (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(assert (=> d!7907 (= lt!18684 e!27464)))

(assert (=> d!7907 (= c!5546 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7907 (validMask!0 mask!853)))

(assert (=> d!7907 (= (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470) lt!18682)))

(declare-fun bm!3481 () Bool)

(assert (=> bm!3481 (= call!3481 (getCurrentListMapNoExtraKeys!38 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun b!43348 () Bool)

(declare-fun c!5544 () Bool)

(assert (=> b!43348 (= c!5544 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!43348 (= e!27471 e!27468)))

(declare-fun b!43349 () Bool)

(declare-fun res!25697 () Bool)

(assert (=> b!43349 (=> (not res!25697) (not e!27473))))

(assert (=> b!43349 (= res!25697 e!27465)))

(declare-fun res!25702 () Bool)

(assert (=> b!43349 (=> res!25702 e!27465)))

(declare-fun e!27474 () Bool)

(assert (=> b!43349 (= res!25702 (not e!27474))))

(declare-fun res!25698 () Bool)

(assert (=> b!43349 (=> (not res!25698) (not e!27474))))

(assert (=> b!43349 (= res!25698 (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(declare-fun b!43350 () Bool)

(assert (=> b!43350 (= e!27463 (= (apply!60 lt!18682 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18358))))

(declare-fun b!43351 () Bool)

(declare-fun res!25701 () Bool)

(assert (=> b!43351 (=> (not res!25701) (not e!27473))))

(assert (=> b!43351 (= res!25701 e!27466)))

(declare-fun c!5545 () Bool)

(assert (=> b!43351 (= c!5545 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!3482 () Bool)

(assert (=> bm!3482 (= call!3485 call!3484)))

(declare-fun b!43352 () Bool)

(assert (=> b!43352 (= e!27474 (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43353 () Bool)

(declare-fun get!787 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43353 (= e!27470 (= (apply!60 lt!18682 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)) (get!787 (select (arr!1407 lt!18355) #b00000000000000000000000000000000) (dynLambda!259 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1592 lt!18355)))))

(assert (=> b!43353 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(declare-fun b!43354 () Bool)

(assert (=> b!43354 (= e!27464 (+!69 call!3484 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))))

(assert (= (and d!7907 c!5546) b!43354))

(assert (= (and d!7907 (not c!5546)) b!43341))

(assert (= (and b!43341 c!5543) b!43334))

(assert (= (and b!43341 (not c!5543)) b!43348))

(assert (= (and b!43348 c!5544) b!43344))

(assert (= (and b!43348 (not c!5544)) b!43339))

(assert (= (or b!43344 b!43339) bm!3478))

(assert (= (or b!43334 bm!3478) bm!3476))

(assert (= (or b!43334 b!43344) bm!3482))

(assert (= (or b!43354 bm!3476) bm!3481))

(assert (= (or b!43354 bm!3482) bm!3477))

(assert (= (and d!7907 res!25704) b!43335))

(assert (= (and d!7907 c!5541) b!43345))

(assert (= (and d!7907 (not c!5541)) b!43346))

(assert (= (and d!7907 res!25703) b!43349))

(assert (= (and b!43349 res!25698) b!43352))

(assert (= (and b!43349 (not res!25702)) b!43336))

(assert (= (and b!43336 res!25699) b!43353))

(assert (= (and b!43349 res!25697) b!43351))

(assert (= (and b!43351 c!5545) b!43340))

(assert (= (and b!43351 (not c!5545)) b!43337))

(assert (= (and b!43340 res!25696) b!43350))

(assert (= (or b!43340 b!43337) bm!3480))

(assert (= (and b!43351 res!25701) b!43342))

(assert (= (and b!43342 c!5542) b!43343))

(assert (= (and b!43342 (not c!5542)) b!43347))

(assert (= (and b!43343 res!25700) b!43338))

(assert (= (or b!43343 b!43347) bm!3479))

(declare-fun b_lambda!2261 () Bool)

(assert (=> (not b_lambda!2261) (not b!43353)))

(assert (=> b!43353 t!4192))

(declare-fun b_and!2667 () Bool)

(assert (= b_and!2653 (and (=> t!4192 result!1717) b_and!2667)))

(assert (=> b!43336 m!36979))

(assert (=> b!43336 m!36979))

(declare-fun m!37171 () Bool)

(assert (=> b!43336 m!37171))

(declare-fun m!37173 () Bool)

(assert (=> bm!3479 m!37173))

(declare-fun m!37175 () Bool)

(assert (=> bm!3481 m!37175))

(assert (=> b!43335 m!36979))

(assert (=> b!43335 m!36979))

(assert (=> b!43335 m!36981))

(declare-fun m!37177 () Bool)

(assert (=> bm!3480 m!37177))

(assert (=> d!7907 m!36887))

(declare-fun m!37179 () Bool)

(assert (=> b!43345 m!37179))

(declare-fun m!37181 () Bool)

(assert (=> b!43345 m!37181))

(declare-fun m!37183 () Bool)

(assert (=> b!43345 m!37183))

(declare-fun m!37185 () Bool)

(assert (=> b!43345 m!37185))

(declare-fun m!37187 () Bool)

(assert (=> b!43345 m!37187))

(assert (=> b!43345 m!37175))

(assert (=> b!43345 m!37181))

(declare-fun m!37189 () Bool)

(assert (=> b!43345 m!37189))

(declare-fun m!37191 () Bool)

(assert (=> b!43345 m!37191))

(declare-fun m!37193 () Bool)

(assert (=> b!43345 m!37193))

(declare-fun m!37195 () Bool)

(assert (=> b!43345 m!37195))

(assert (=> b!43345 m!36979))

(declare-fun m!37197 () Bool)

(assert (=> b!43345 m!37197))

(assert (=> b!43345 m!37185))

(declare-fun m!37199 () Bool)

(assert (=> b!43345 m!37199))

(assert (=> b!43345 m!37191))

(declare-fun m!37201 () Bool)

(assert (=> b!43345 m!37201))

(declare-fun m!37203 () Bool)

(assert (=> b!43345 m!37203))

(declare-fun m!37205 () Bool)

(assert (=> b!43345 m!37205))

(declare-fun m!37207 () Bool)

(assert (=> b!43345 m!37207))

(assert (=> b!43345 m!37205))

(declare-fun m!37209 () Bool)

(assert (=> b!43354 m!37209))

(assert (=> b!43353 m!36905))

(assert (=> b!43353 m!36979))

(declare-fun m!37211 () Bool)

(assert (=> b!43353 m!37211))

(declare-fun m!37213 () Bool)

(assert (=> b!43353 m!37213))

(assert (=> b!43353 m!36905))

(declare-fun m!37215 () Bool)

(assert (=> b!43353 m!37215))

(assert (=> b!43353 m!37213))

(assert (=> b!43353 m!36979))

(assert (=> b!43352 m!36979))

(assert (=> b!43352 m!36979))

(assert (=> b!43352 m!36981))

(declare-fun m!37217 () Bool)

(assert (=> bm!3477 m!37217))

(declare-fun m!37219 () Bool)

(assert (=> b!43350 m!37219))

(declare-fun m!37221 () Bool)

(assert (=> b!43338 m!37221))

(assert (=> b!42991 d!7907))

(declare-fun d!7945 () Bool)

(assert (=> d!7945 (= (head!887 (toList!615 lt!18357)) (h!1769 (toList!615 lt!18357)))))

(assert (=> b!42991 d!7945))

(declare-fun b_lambda!2265 () Bool)

(assert (= b_lambda!2261 (or (and start!6466 b_free!1501) b_lambda!2265)))

(push 1)

(assert (not bm!3480))

(assert (not b!43353))

(assert b_and!2667)

(assert (not b!43335))

(assert (not b!43336))

(assert (not b!43087))

(assert (not b!43048))

(assert (not b!43354))

(assert (not d!7883))

(assert (not bm!3401))

(assert (not b!43350))

(assert (not d!7875))

(assert (not b!43345))

(assert (not d!7885))

(assert (not b!43085))

(assert tp_is_empty!1891)

(assert (not bm!3481))

(assert (not bm!3395))

(assert (not b!43077))

(assert (not bm!3477))

(assert (not b_lambda!2265))

(assert (not b!43051))

(assert (not bm!3398))

(assert (not b!43352))

(assert (not d!7905))

(assert (not bm!3479))

(assert (not b!43064))

(assert (not b!43047))

(assert (not d!7897))

(assert (not d!7907))

(assert (not b_lambda!2251))

(assert (not b_next!1501))

(assert (not b!43338))

(assert (not b!43066))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2667)

(assert (not b_next!1501))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7947 () Bool)

(assert (=> d!7947 (= (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)) (and (not (= (select (arr!1408 lt!18353) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1408 lt!18353) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43335 d!7947))

(declare-fun d!7949 () Bool)

(declare-fun get!788 (Option!112) V!2309)

(assert (=> d!7949 (= (apply!60 lt!18682 #b0000000000000000000000000000000000000000000000000000000000000000) (get!788 (getValueByKey!106 (toList!615 lt!18682) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1941 () Bool)

(assert (= bs!1941 d!7949))

(declare-fun m!37223 () Bool)

(assert (=> bs!1941 m!37223))

(assert (=> bs!1941 m!37223))

(declare-fun m!37225 () Bool)

(assert (=> bs!1941 m!37225))

(assert (=> b!43350 d!7949))

(declare-fun d!7951 () Bool)

(assert (=> d!7951 (arrayContainsKey!0 lt!18353 lt!18442 #b00000000000000000000000000000000)))

(declare-fun lt!18701 () Unit!1197)

(declare-fun choose!13 (array!2929 (_ BitVec 64) (_ BitVec 32)) Unit!1197)

(assert (=> d!7951 (= lt!18701 (choose!13 lt!18353 lt!18442 #b00000000000000000000000000000000))))

(assert (=> d!7951 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7951 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18353 lt!18442 #b00000000000000000000000000000000) lt!18701)))

(declare-fun bs!1942 () Bool)

(assert (= bs!1942 d!7951))

(assert (=> bs!1942 m!36997))

(declare-fun m!37227 () Bool)

(assert (=> bs!1942 m!37227))

(assert (=> b!43064 d!7951))

(declare-fun d!7955 () Bool)

(declare-fun res!25710 () Bool)

(declare-fun e!27482 () Bool)

(assert (=> d!7955 (=> res!25710 e!27482)))

(assert (=> d!7955 (= res!25710 (= (select (arr!1408 lt!18353) #b00000000000000000000000000000000) lt!18442))))

(assert (=> d!7955 (= (arrayContainsKey!0 lt!18353 lt!18442 #b00000000000000000000000000000000) e!27482)))

(declare-fun b!43362 () Bool)

(declare-fun e!27483 () Bool)

(assert (=> b!43362 (= e!27482 e!27483)))

(declare-fun res!25711 () Bool)

(assert (=> b!43362 (=> (not res!25711) (not e!27483))))

(assert (=> b!43362 (= res!25711 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1593 lt!18353)))))

(declare-fun b!43363 () Bool)

(assert (=> b!43363 (= e!27483 (arrayContainsKey!0 lt!18353 lt!18442 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7955 (not res!25710)) b!43362))

(assert (= (and b!43362 res!25711) b!43363))

(assert (=> d!7955 m!36979))

(declare-fun m!37237 () Bool)

(assert (=> b!43363 m!37237))

(assert (=> b!43064 d!7955))

(declare-fun b!43404 () Bool)

(declare-fun e!27508 () SeekEntryResult!196)

(assert (=> b!43404 (= e!27508 Undefined!196)))

(declare-fun e!27506 () SeekEntryResult!196)

(declare-fun b!43405 () Bool)

(declare-fun lt!18739 () SeekEntryResult!196)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2929 (_ BitVec 32)) SeekEntryResult!196)

(assert (=> b!43405 (= e!27506 (seekKeyOrZeroReturnVacant!0 (x!8285 lt!18739) (index!2908 lt!18739) (index!2908 lt!18739) (select (arr!1408 lt!18353) #b00000000000000000000000000000000) lt!18353 mask!853))))

(declare-fun b!43406 () Bool)

(declare-fun e!27507 () SeekEntryResult!196)

(assert (=> b!43406 (= e!27508 e!27507)))

(declare-fun lt!18740 () (_ BitVec 64))

(assert (=> b!43406 (= lt!18740 (select (arr!1408 lt!18353) (index!2908 lt!18739)))))

(declare-fun c!5563 () Bool)

(assert (=> b!43406 (= c!5563 (= lt!18740 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43407 () Bool)

(assert (=> b!43407 (= e!27506 (MissingZero!196 (index!2908 lt!18739)))))

(declare-fun b!43408 () Bool)

(assert (=> b!43408 (= e!27507 (Found!196 (index!2908 lt!18739)))))

(declare-fun b!43409 () Bool)

(declare-fun c!5561 () Bool)

(assert (=> b!43409 (= c!5561 (= lt!18740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43409 (= e!27507 e!27506)))

(declare-fun d!7961 () Bool)

(declare-fun lt!18741 () SeekEntryResult!196)

(assert (=> d!7961 (and (or (is-Undefined!196 lt!18741) (not (is-Found!196 lt!18741)) (and (bvsge (index!2907 lt!18741) #b00000000000000000000000000000000) (bvslt (index!2907 lt!18741) (size!1593 lt!18353)))) (or (is-Undefined!196 lt!18741) (is-Found!196 lt!18741) (not (is-MissingZero!196 lt!18741)) (and (bvsge (index!2906 lt!18741) #b00000000000000000000000000000000) (bvslt (index!2906 lt!18741) (size!1593 lt!18353)))) (or (is-Undefined!196 lt!18741) (is-Found!196 lt!18741) (is-MissingZero!196 lt!18741) (not (is-MissingVacant!196 lt!18741)) (and (bvsge (index!2909 lt!18741) #b00000000000000000000000000000000) (bvslt (index!2909 lt!18741) (size!1593 lt!18353)))) (or (is-Undefined!196 lt!18741) (ite (is-Found!196 lt!18741) (= (select (arr!1408 lt!18353) (index!2907 lt!18741)) (select (arr!1408 lt!18353) #b00000000000000000000000000000000)) (ite (is-MissingZero!196 lt!18741) (= (select (arr!1408 lt!18353) (index!2906 lt!18741)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!196 lt!18741) (= (select (arr!1408 lt!18353) (index!2909 lt!18741)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7961 (= lt!18741 e!27508)))

(declare-fun c!5562 () Bool)

(assert (=> d!7961 (= c!5562 (and (is-Intermediate!196 lt!18739) (undefined!1008 lt!18739)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2929 (_ BitVec 32)) SeekEntryResult!196)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!7961 (= lt!18739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) mask!853) (select (arr!1408 lt!18353) #b00000000000000000000000000000000) lt!18353 mask!853))))

(assert (=> d!7961 (validMask!0 mask!853)))

(assert (=> d!7961 (= (seekEntryOrOpen!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) lt!18353 mask!853) lt!18741)))

(assert (= (and d!7961 c!5562) b!43404))

(assert (= (and d!7961 (not c!5562)) b!43406))

(assert (= (and b!43406 c!5563) b!43408))

(assert (= (and b!43406 (not c!5563)) b!43409))

(assert (= (and b!43409 c!5561) b!43407))

(assert (= (and b!43409 (not c!5561)) b!43405))

(assert (=> b!43405 m!36979))

(declare-fun m!37307 () Bool)

(assert (=> b!43405 m!37307))

(declare-fun m!37309 () Bool)

(assert (=> b!43406 m!37309))

(declare-fun m!37311 () Bool)

(assert (=> d!7961 m!37311))

(assert (=> d!7961 m!36979))

(declare-fun m!37313 () Bool)

(assert (=> d!7961 m!37313))

(declare-fun m!37315 () Bool)

(assert (=> d!7961 m!37315))

(declare-fun m!37317 () Bool)

(assert (=> d!7961 m!37317))

(assert (=> d!7961 m!36979))

(assert (=> d!7961 m!37311))

(assert (=> d!7961 m!36887))

(declare-fun m!37319 () Bool)

(assert (=> d!7961 m!37319))

(assert (=> b!43064 d!7961))

(declare-fun d!7987 () Bool)

(assert (=> d!7987 (isDefined!63 (getValueByKey!106 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))))))

(declare-fun lt!18752 () Unit!1197)

(declare-fun choose!253 (List!1196 (_ BitVec 64)) Unit!1197)

(assert (=> d!7987 (= lt!18752 (choose!253 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))))))

(declare-fun e!27513 () Bool)

(assert (=> d!7987 e!27513))

(declare-fun res!25732 () Bool)

(assert (=> d!7987 (=> (not res!25732) (not e!27513))))

(declare-fun isStrictlySorted!213 (List!1196) Bool)

(assert (=> d!7987 (= res!25732 (isStrictlySorted!213 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))))))

(assert (=> d!7987 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))) lt!18752)))

(declare-fun b!43416 () Bool)

(assert (=> b!43416 (= e!27513 (containsKey!74 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))))))

(assert (= (and d!7987 res!25732) b!43416))

(assert (=> d!7987 m!37011))

(assert (=> d!7987 m!37011))

(assert (=> d!7987 m!37013))

(declare-fun m!37321 () Bool)

(assert (=> d!7987 m!37321))

(declare-fun m!37323 () Bool)

(assert (=> d!7987 m!37323))

(assert (=> b!43416 m!37007))

(assert (=> b!43085 d!7987))

(declare-fun d!7989 () Bool)

(declare-fun isEmpty!281 (Option!112) Bool)

(assert (=> d!7989 (= (isDefined!63 (getValueByKey!106 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357))))) (not (isEmpty!281 (getValueByKey!106 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))))))))

(declare-fun bs!1948 () Bool)

(assert (= bs!1948 d!7989))

(assert (=> bs!1948 m!37011))

(declare-fun m!37325 () Bool)

(assert (=> bs!1948 m!37325))

(assert (=> b!43085 d!7989))

(declare-fun b!43428 () Bool)

(declare-fun e!27519 () Option!112)

(declare-fun e!27520 () Option!112)

(assert (=> b!43428 (= e!27519 e!27520)))

(declare-fun c!5569 () Bool)

(assert (=> b!43428 (= c!5569 (and (is-Cons!1192 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))) (not (= (_1!822 (h!1769 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!822 (head!887 (toList!615 lt!18357)))))))))

(declare-fun b!43430 () Bool)

(assert (=> b!43430 (= e!27520 None!110)))

(declare-fun b!43427 () Bool)

(assert (=> b!43427 (= e!27519 (Some!111 (_2!822 (h!1769 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))))))))

(declare-fun c!5568 () Bool)

(declare-fun d!7991 () Bool)

(assert (=> d!7991 (= c!5568 (and (is-Cons!1192 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!822 (h!1769 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!822 (head!887 (toList!615 lt!18357))))))))

(assert (=> d!7991 (= (getValueByKey!106 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))) e!27519)))

(declare-fun b!43429 () Bool)

(assert (=> b!43429 (= e!27520 (getValueByKey!106 (t!4193 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))) (_1!822 (head!887 (toList!615 lt!18357)))))))

(assert (= (and d!7991 c!5568) b!43427))

(assert (= (and d!7991 (not c!5568)) b!43428))

(assert (= (and b!43428 c!5569) b!43429))

(assert (= (and b!43428 (not c!5569)) b!43430))

(declare-fun m!37339 () Bool)

(assert (=> b!43429 m!37339))

(assert (=> b!43085 d!7991))

(assert (=> b!43066 d!7947))

(assert (=> b!43047 d!7947))

(declare-fun b!43519 () Bool)

(declare-fun e!27573 () Bool)

(declare-fun lt!18837 () ListLongMap!1199)

(declare-fun isEmpty!282 (ListLongMap!1199) Bool)

(assert (=> b!43519 (= e!27573 (isEmpty!282 lt!18837))))

(declare-fun b!43520 () Bool)

(declare-fun e!27574 () Bool)

(assert (=> b!43520 (= e!27574 (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(assert (=> b!43520 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!43521 () Bool)

(declare-fun e!27579 () Bool)

(declare-fun e!27577 () Bool)

(assert (=> b!43521 (= e!27579 e!27577)))

(declare-fun c!5598 () Bool)

(assert (=> b!43521 (= c!5598 e!27574)))

(declare-fun res!25769 () Bool)

(assert (=> b!43521 (=> (not res!25769) (not e!27574))))

(assert (=> b!43521 (= res!25769 (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(declare-fun b!43522 () Bool)

(declare-fun e!27578 () ListLongMap!1199)

(assert (=> b!43522 (= e!27578 (ListLongMap!1200 Nil!1193))))

(declare-fun b!43523 () Bool)

(assert (=> b!43523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(assert (=> b!43523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1592 lt!18355)))))

(declare-fun e!27575 () Bool)

(assert (=> b!43523 (= e!27575 (= (apply!60 lt!18837 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)) (get!787 (select (arr!1407 lt!18355) #b00000000000000000000000000000000) (dynLambda!259 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!43524 () Bool)

(declare-fun lt!18833 () Unit!1197)

(declare-fun lt!18836 () Unit!1197)

(assert (=> b!43524 (= lt!18833 lt!18836)))

(declare-fun lt!18834 () (_ BitVec 64))

(declare-fun lt!18835 () ListLongMap!1199)

(declare-fun lt!18832 () (_ BitVec 64))

(declare-fun lt!18838 () V!2309)

(assert (=> b!43524 (not (contains!562 (+!69 lt!18835 (tuple2!1623 lt!18834 lt!18838)) lt!18832))))

(declare-fun addStillNotContains!9 (ListLongMap!1199 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1197)

(assert (=> b!43524 (= lt!18836 (addStillNotContains!9 lt!18835 lt!18834 lt!18838 lt!18832))))

(assert (=> b!43524 (= lt!18832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!43524 (= lt!18838 (get!787 (select (arr!1407 lt!18355) #b00000000000000000000000000000000) (dynLambda!259 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43524 (= lt!18834 (select (arr!1408 lt!18353) #b00000000000000000000000000000000))))

(declare-fun call!3491 () ListLongMap!1199)

(assert (=> b!43524 (= lt!18835 call!3491)))

(declare-fun e!27576 () ListLongMap!1199)

(assert (=> b!43524 (= e!27576 (+!69 call!3491 (tuple2!1623 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) (get!787 (select (arr!1407 lt!18355) #b00000000000000000000000000000000) (dynLambda!259 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!43525 () Bool)

(assert (=> b!43525 (= e!27576 call!3491)))

(declare-fun b!43526 () Bool)

(assert (=> b!43526 (= e!27577 e!27575)))

(assert (=> b!43526 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(declare-fun res!25771 () Bool)

(assert (=> b!43526 (= res!25771 (contains!562 lt!18837 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(assert (=> b!43526 (=> (not res!25771) (not e!27575))))

(declare-fun b!43527 () Bool)

(assert (=> b!43527 (= e!27573 (= lt!18837 (getCurrentListMapNoExtraKeys!38 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470)))))

(declare-fun d!7995 () Bool)

(assert (=> d!7995 e!27579))

(declare-fun res!25770 () Bool)

(assert (=> d!7995 (=> (not res!25770) (not e!27579))))

(assert (=> d!7995 (= res!25770 (not (contains!562 lt!18837 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7995 (= lt!18837 e!27578)))

(declare-fun c!5597 () Bool)

(assert (=> d!7995 (= c!5597 (bvsge #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(assert (=> d!7995 (validMask!0 mask!853)))

(assert (=> d!7995 (= (getCurrentListMapNoExtraKeys!38 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470) lt!18837)))

(declare-fun b!43528 () Bool)

(declare-fun res!25768 () Bool)

(assert (=> b!43528 (=> (not res!25768) (not e!27579))))

(assert (=> b!43528 (= res!25768 (not (contains!562 lt!18837 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!3488 () Bool)

(assert (=> bm!3488 (= call!3491 (getCurrentListMapNoExtraKeys!38 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470))))

(declare-fun b!43529 () Bool)

(assert (=> b!43529 (= e!27578 e!27576)))

(declare-fun c!5599 () Bool)

(assert (=> b!43529 (= c!5599 (validKeyInArray!0 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43530 () Bool)

(assert (=> b!43530 (= e!27577 e!27573)))

(declare-fun c!5596 () Bool)

(assert (=> b!43530 (= c!5596 (bvslt #b00000000000000000000000000000000 (size!1593 lt!18353)))))

(assert (= (and d!7995 c!5597) b!43522))

(assert (= (and d!7995 (not c!5597)) b!43529))

(assert (= (and b!43529 c!5599) b!43524))

(assert (= (and b!43529 (not c!5599)) b!43525))

(assert (= (or b!43524 b!43525) bm!3488))

(assert (= (and d!7995 res!25770) b!43528))

(assert (= (and b!43528 res!25768) b!43521))

(assert (= (and b!43521 res!25769) b!43520))

(assert (= (and b!43521 c!5598) b!43526))

(assert (= (and b!43521 (not c!5598)) b!43530))

(assert (= (and b!43526 res!25771) b!43523))

(assert (= (and b!43530 c!5596) b!43527))

(assert (= (and b!43530 (not c!5596)) b!43519))

(declare-fun b_lambda!2271 () Bool)

(assert (=> (not b_lambda!2271) (not b!43523)))

(assert (=> b!43523 t!4192))

(declare-fun b_and!2673 () Bool)

(assert (= b_and!2667 (and (=> t!4192 result!1717) b_and!2673)))

(declare-fun b_lambda!2273 () Bool)

(assert (=> (not b_lambda!2273) (not b!43524)))

(assert (=> b!43524 t!4192))

(declare-fun b_and!2675 () Bool)

(assert (= b_and!2673 (and (=> t!4192 result!1717) b_and!2675)))

(declare-fun m!37441 () Bool)

(assert (=> bm!3488 m!37441))

(assert (=> b!43527 m!37441))

(assert (=> b!43526 m!36979))

(assert (=> b!43526 m!36979))

(declare-fun m!37443 () Bool)

(assert (=> b!43526 m!37443))

(declare-fun m!37445 () Bool)

(assert (=> b!43519 m!37445))

(declare-fun m!37447 () Bool)

(assert (=> b!43528 m!37447))

(assert (=> b!43529 m!36979))

(assert (=> b!43529 m!36979))

(assert (=> b!43529 m!36981))

(declare-fun m!37449 () Bool)

(assert (=> d!7995 m!37449))

(assert (=> d!7995 m!36887))

(assert (=> b!43523 m!36979))

(declare-fun m!37451 () Bool)

(assert (=> b!43523 m!37451))

(assert (=> b!43523 m!37213))

(assert (=> b!43523 m!36905))

(assert (=> b!43523 m!37215))

(assert (=> b!43523 m!36905))

(assert (=> b!43523 m!36979))

(assert (=> b!43523 m!37213))

(assert (=> b!43524 m!37213))

(assert (=> b!43524 m!36905))

(assert (=> b!43524 m!37215))

(declare-fun m!37453 () Bool)

(assert (=> b!43524 m!37453))

(declare-fun m!37455 () Bool)

(assert (=> b!43524 m!37455))

(declare-fun m!37457 () Bool)

(assert (=> b!43524 m!37457))

(assert (=> b!43524 m!36905))

(assert (=> b!43524 m!36979))

(assert (=> b!43524 m!37213))

(assert (=> b!43524 m!37453))

(declare-fun m!37459 () Bool)

(assert (=> b!43524 m!37459))

(assert (=> b!43520 m!36979))

(assert (=> b!43520 m!36979))

(assert (=> b!43520 m!36981))

(assert (=> bm!3481 d!7995))

(assert (=> d!7883 d!7893))

(declare-fun d!8027 () Bool)

(assert (=> d!8027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18353 mask!853)))

(assert (=> d!8027 true))

(declare-fun _$30!60 () Unit!1197)

(assert (=> d!8027 (= (choose!34 lt!18353 mask!853 #b00000000000000000000000000000000) _$30!60)))

(declare-fun bs!1959 () Bool)

(assert (= bs!1959 d!8027))

(assert (=> bs!1959 m!36899))

(assert (=> d!7883 d!8027))

(assert (=> d!7883 d!7901))

(declare-fun b!43553 () Bool)

(declare-fun e!27595 () Bool)

(declare-fun call!3494 () Bool)

(assert (=> b!43553 (= e!27595 call!3494)))

(declare-fun d!8039 () Bool)

(declare-fun res!25786 () Bool)

(declare-fun e!27593 () Bool)

(assert (=> d!8039 (=> res!25786 e!27593)))

(assert (=> d!8039 (= res!25786 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1593 lt!18353)))))

(assert (=> d!8039 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18353 mask!853) e!27593)))

(declare-fun b!43554 () Bool)

(declare-fun e!27594 () Bool)

(assert (=> b!43554 (= e!27594 e!27595)))

(declare-fun lt!18852 () (_ BitVec 64))

(assert (=> b!43554 (= lt!18852 (select (arr!1408 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!18853 () Unit!1197)

(assert (=> b!43554 (= lt!18853 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18353 lt!18852 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!43554 (arrayContainsKey!0 lt!18353 lt!18852 #b00000000000000000000000000000000)))

(declare-fun lt!18851 () Unit!1197)

(assert (=> b!43554 (= lt!18851 lt!18853)))

(declare-fun res!25785 () Bool)

(assert (=> b!43554 (= res!25785 (= (seekEntryOrOpen!0 (select (arr!1408 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!18353 mask!853) (Found!196 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!43554 (=> (not res!25785) (not e!27595))))

(declare-fun b!43555 () Bool)

(assert (=> b!43555 (= e!27594 call!3494)))

(declare-fun b!43556 () Bool)

(assert (=> b!43556 (= e!27593 e!27594)))

(declare-fun c!5604 () Bool)

(assert (=> b!43556 (= c!5604 (validKeyInArray!0 (select (arr!1408 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3491 () Bool)

(assert (=> bm!3491 (= call!3494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!18353 mask!853))))

(assert (= (and d!8039 (not res!25786)) b!43556))

(assert (= (and b!43556 c!5604) b!43554))

(assert (= (and b!43556 (not c!5604)) b!43555))

(assert (= (and b!43554 res!25785) b!43553))

(assert (= (or b!43553 b!43555) bm!3491))

(declare-fun m!37501 () Bool)

(assert (=> b!43554 m!37501))

(declare-fun m!37505 () Bool)

(assert (=> b!43554 m!37505))

(declare-fun m!37509 () Bool)

(assert (=> b!43554 m!37509))

(assert (=> b!43554 m!37501))

(declare-fun m!37511 () Bool)

(assert (=> b!43554 m!37511))

(assert (=> b!43556 m!37501))

(assert (=> b!43556 m!37501))

(declare-fun m!37513 () Bool)

(assert (=> b!43556 m!37513))

(declare-fun m!37515 () Bool)

(assert (=> bm!3491 m!37515))

(assert (=> bm!3398 d!8039))

(assert (=> b!43087 d!7989))

(assert (=> b!43087 d!7991))

(declare-fun d!8045 () Bool)

(declare-fun lt!18871 () Bool)

(declare-fun content!39 (List!1197) (Set (_ BitVec 64)))

(assert (=> d!8045 (= lt!18871 (set.member (select (arr!1408 lt!18353) #b00000000000000000000000000000000) (content!39 Nil!1194)))))

(declare-fun e!27611 () Bool)

(assert (=> d!8045 (= lt!18871 e!27611)))

(declare-fun res!25797 () Bool)

(assert (=> d!8045 (=> (not res!25797) (not e!27611))))

(assert (=> d!8045 (= res!25797 (is-Cons!1193 Nil!1194))))

(assert (=> d!8045 (= (contains!565 Nil!1194 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)) lt!18871)))

(declare-fun b!43577 () Bool)

(declare-fun e!27610 () Bool)

(assert (=> b!43577 (= e!27611 e!27610)))

(declare-fun res!25798 () Bool)

(assert (=> b!43577 (=> res!25798 e!27610)))

(assert (=> b!43577 (= res!25798 (= (h!1770 Nil!1194) (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43578 () Bool)

(assert (=> b!43578 (= e!27610 (contains!565 (t!4194 Nil!1194) (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(assert (= (and d!8045 res!25797) b!43577))

(assert (= (and b!43577 (not res!25798)) b!43578))

(declare-fun m!37525 () Bool)

(assert (=> d!8045 m!37525))

(assert (=> d!8045 m!36979))

(declare-fun m!37527 () Bool)

(assert (=> d!8045 m!37527))

(assert (=> b!43578 m!36979))

(declare-fun m!37529 () Bool)

(assert (=> b!43578 m!37529))

(assert (=> b!43048 d!8045))

(declare-fun d!8051 () Bool)

(declare-fun e!27617 () Bool)

(assert (=> d!8051 e!27617))

(declare-fun res!25803 () Bool)

(assert (=> d!8051 (=> res!25803 e!27617)))

(declare-fun lt!18875 () Bool)

(assert (=> d!8051 (= res!25803 (not lt!18875))))

(declare-fun lt!18874 () Bool)

(assert (=> d!8051 (= lt!18875 lt!18874)))

(declare-fun lt!18872 () Unit!1197)

(declare-fun e!27616 () Unit!1197)

(assert (=> d!8051 (= lt!18872 e!27616)))

(declare-fun c!5610 () Bool)

(assert (=> d!8051 (= c!5610 lt!18874)))

(assert (=> d!8051 (= lt!18874 (containsKey!74 (toList!615 (+!69 lt!18678 (tuple2!1623 lt!18686 lt!18358))) lt!18685))))

(assert (=> d!8051 (= (contains!562 (+!69 lt!18678 (tuple2!1623 lt!18686 lt!18358)) lt!18685) lt!18875)))

(declare-fun b!43583 () Bool)

(declare-fun lt!18873 () Unit!1197)

(assert (=> b!43583 (= e!27616 lt!18873)))

(assert (=> b!43583 (= lt!18873 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!615 (+!69 lt!18678 (tuple2!1623 lt!18686 lt!18358))) lt!18685))))

(assert (=> b!43583 (isDefined!63 (getValueByKey!106 (toList!615 (+!69 lt!18678 (tuple2!1623 lt!18686 lt!18358))) lt!18685))))

(declare-fun b!43584 () Bool)

(declare-fun Unit!1213 () Unit!1197)

(assert (=> b!43584 (= e!27616 Unit!1213)))

(declare-fun b!43585 () Bool)

(assert (=> b!43585 (= e!27617 (isDefined!63 (getValueByKey!106 (toList!615 (+!69 lt!18678 (tuple2!1623 lt!18686 lt!18358))) lt!18685)))))

(assert (= (and d!8051 c!5610) b!43583))

(assert (= (and d!8051 (not c!5610)) b!43584))

(assert (= (and d!8051 (not res!25803)) b!43585))

(declare-fun m!37541 () Bool)

(assert (=> d!8051 m!37541))

(declare-fun m!37545 () Bool)

(assert (=> b!43583 m!37545))

(declare-fun m!37549 () Bool)

(assert (=> b!43583 m!37549))

(assert (=> b!43583 m!37549))

(declare-fun m!37553 () Bool)

(assert (=> b!43583 m!37553))

(assert (=> b!43585 m!37549))

(assert (=> b!43585 m!37549))

(assert (=> b!43585 m!37553))

(assert (=> b!43345 d!8051))

(declare-fun d!8053 () Bool)

(declare-fun e!27637 () Bool)

(assert (=> d!8053 e!27637))

(declare-fun res!25823 () Bool)

(assert (=> d!8053 (=> (not res!25823) (not e!27637))))

(declare-fun lt!18914 () ListLongMap!1199)

(assert (=> d!8053 (= res!25823 (contains!562 lt!18914 (_1!822 (tuple2!1623 lt!18690 lt!18358))))))

(declare-fun lt!18912 () List!1196)

(assert (=> d!8053 (= lt!18914 (ListLongMap!1200 lt!18912))))

(declare-fun lt!18911 () Unit!1197)

(declare-fun lt!18913 () Unit!1197)

(assert (=> d!8053 (= lt!18911 lt!18913)))

(assert (=> d!8053 (= (getValueByKey!106 lt!18912 (_1!822 (tuple2!1623 lt!18690 lt!18358))) (Some!111 (_2!822 (tuple2!1623 lt!18690 lt!18358))))))

(declare-fun lemmaContainsTupThenGetReturnValue!30 (List!1196 (_ BitVec 64) V!2309) Unit!1197)

(assert (=> d!8053 (= lt!18913 (lemmaContainsTupThenGetReturnValue!30 lt!18912 (_1!822 (tuple2!1623 lt!18690 lt!18358)) (_2!822 (tuple2!1623 lt!18690 lt!18358))))))

(declare-fun insertStrictlySorted!27 (List!1196 (_ BitVec 64) V!2309) List!1196)

(assert (=> d!8053 (= lt!18912 (insertStrictlySorted!27 (toList!615 lt!18693) (_1!822 (tuple2!1623 lt!18690 lt!18358)) (_2!822 (tuple2!1623 lt!18690 lt!18358))))))

(assert (=> d!8053 (= (+!69 lt!18693 (tuple2!1623 lt!18690 lt!18358)) lt!18914)))

(declare-fun b!43616 () Bool)

(declare-fun res!25822 () Bool)

(assert (=> b!43616 (=> (not res!25822) (not e!27637))))

(assert (=> b!43616 (= res!25822 (= (getValueByKey!106 (toList!615 lt!18914) (_1!822 (tuple2!1623 lt!18690 lt!18358))) (Some!111 (_2!822 (tuple2!1623 lt!18690 lt!18358)))))))

(declare-fun b!43617 () Bool)

(declare-fun contains!570 (List!1196 tuple2!1622) Bool)

(assert (=> b!43617 (= e!27637 (contains!570 (toList!615 lt!18914) (tuple2!1623 lt!18690 lt!18358)))))

(assert (= (and d!8053 res!25823) b!43616))

(assert (= (and b!43616 res!25822) b!43617))

(declare-fun m!37641 () Bool)

(assert (=> d!8053 m!37641))

(declare-fun m!37643 () Bool)

(assert (=> d!8053 m!37643))

(declare-fun m!37645 () Bool)

(assert (=> d!8053 m!37645))

(declare-fun m!37647 () Bool)

(assert (=> d!8053 m!37647))

(declare-fun m!37649 () Bool)

(assert (=> b!43616 m!37649))

(declare-fun m!37651 () Bool)

(assert (=> b!43617 m!37651))

(assert (=> b!43345 d!8053))

(declare-fun d!8067 () Bool)

(declare-fun e!27638 () Bool)

(assert (=> d!8067 e!27638))

(declare-fun res!25825 () Bool)

(assert (=> d!8067 (=> (not res!25825) (not e!27638))))

(declare-fun lt!18918 () ListLongMap!1199)

(assert (=> d!8067 (= res!25825 (contains!562 lt!18918 (_1!822 (tuple2!1623 lt!18679 lt!18358))))))

(declare-fun lt!18916 () List!1196)

(assert (=> d!8067 (= lt!18918 (ListLongMap!1200 lt!18916))))

(declare-fun lt!18915 () Unit!1197)

(declare-fun lt!18917 () Unit!1197)

(assert (=> d!8067 (= lt!18915 lt!18917)))

(assert (=> d!8067 (= (getValueByKey!106 lt!18916 (_1!822 (tuple2!1623 lt!18679 lt!18358))) (Some!111 (_2!822 (tuple2!1623 lt!18679 lt!18358))))))

(assert (=> d!8067 (= lt!18917 (lemmaContainsTupThenGetReturnValue!30 lt!18916 (_1!822 (tuple2!1623 lt!18679 lt!18358)) (_2!822 (tuple2!1623 lt!18679 lt!18358))))))

(assert (=> d!8067 (= lt!18916 (insertStrictlySorted!27 (toList!615 lt!18680) (_1!822 (tuple2!1623 lt!18679 lt!18358)) (_2!822 (tuple2!1623 lt!18679 lt!18358))))))

(assert (=> d!8067 (= (+!69 lt!18680 (tuple2!1623 lt!18679 lt!18358)) lt!18918)))

(declare-fun b!43618 () Bool)

(declare-fun res!25824 () Bool)

(assert (=> b!43618 (=> (not res!25824) (not e!27638))))

(assert (=> b!43618 (= res!25824 (= (getValueByKey!106 (toList!615 lt!18918) (_1!822 (tuple2!1623 lt!18679 lt!18358))) (Some!111 (_2!822 (tuple2!1623 lt!18679 lt!18358)))))))

(declare-fun b!43619 () Bool)

(assert (=> b!43619 (= e!27638 (contains!570 (toList!615 lt!18918) (tuple2!1623 lt!18679 lt!18358)))))

(assert (= (and d!8067 res!25825) b!43618))

(assert (= (and b!43618 res!25824) b!43619))

(declare-fun m!37653 () Bool)

(assert (=> d!8067 m!37653))

(declare-fun m!37655 () Bool)

(assert (=> d!8067 m!37655))

(declare-fun m!37657 () Bool)

(assert (=> d!8067 m!37657))

(declare-fun m!37659 () Bool)

(assert (=> d!8067 m!37659))

(declare-fun m!37661 () Bool)

(assert (=> b!43618 m!37661))

(declare-fun m!37663 () Bool)

(assert (=> b!43619 m!37663))

(assert (=> b!43345 d!8067))

(declare-fun d!8071 () Bool)

(assert (=> d!8071 (= (apply!60 (+!69 lt!18680 (tuple2!1623 lt!18679 lt!18358)) lt!18674) (get!788 (getValueByKey!106 (toList!615 (+!69 lt!18680 (tuple2!1623 lt!18679 lt!18358))) lt!18674)))))

(declare-fun bs!1962 () Bool)

(assert (= bs!1962 d!8071))

(declare-fun m!37665 () Bool)

(assert (=> bs!1962 m!37665))

(assert (=> bs!1962 m!37665))

(declare-fun m!37667 () Bool)

(assert (=> bs!1962 m!37667))

(assert (=> b!43345 d!8071))

(declare-fun d!8073 () Bool)

(assert (=> d!8073 (= (apply!60 (+!69 lt!18693 (tuple2!1623 lt!18690 lt!18358)) lt!18694) (apply!60 lt!18693 lt!18694))))

(declare-fun lt!18927 () Unit!1197)

(declare-fun choose!258 (ListLongMap!1199 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1197)

(assert (=> d!8073 (= lt!18927 (choose!258 lt!18693 lt!18690 lt!18358 lt!18694))))

(declare-fun e!27651 () Bool)

(assert (=> d!8073 e!27651))

(declare-fun res!25838 () Bool)

(assert (=> d!8073 (=> (not res!25838) (not e!27651))))

(assert (=> d!8073 (= res!25838 (contains!562 lt!18693 lt!18694))))

(assert (=> d!8073 (= (addApplyDifferent!36 lt!18693 lt!18690 lt!18358 lt!18694) lt!18927)))

(declare-fun b!43633 () Bool)

(assert (=> b!43633 (= e!27651 (not (= lt!18694 lt!18690)))))

(assert (= (and d!8073 res!25838) b!43633))

(declare-fun m!37671 () Bool)

(assert (=> d!8073 m!37671))

(assert (=> d!8073 m!37181))

(declare-fun m!37673 () Bool)

(assert (=> d!8073 m!37673))

(assert (=> d!8073 m!37181))

(assert (=> d!8073 m!37189))

(assert (=> d!8073 m!37197))

(assert (=> b!43345 d!8073))

(declare-fun d!8077 () Bool)

(assert (=> d!8077 (contains!562 (+!69 lt!18678 (tuple2!1623 lt!18686 lt!18358)) lt!18685)))

(declare-fun lt!18938 () Unit!1197)

(declare-fun choose!259 (ListLongMap!1199 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1197)

(assert (=> d!8077 (= lt!18938 (choose!259 lt!18678 lt!18686 lt!18358 lt!18685))))

(assert (=> d!8077 (contains!562 lt!18678 lt!18685)))

(assert (=> d!8077 (= (addStillContains!36 lt!18678 lt!18686 lt!18358 lt!18685) lt!18938)))

(declare-fun bs!1963 () Bool)

(assert (= bs!1963 d!8077))

(assert (=> bs!1963 m!37191))

(assert (=> bs!1963 m!37191))

(assert (=> bs!1963 m!37201))

(declare-fun m!37699 () Bool)

(assert (=> bs!1963 m!37699))

(declare-fun m!37701 () Bool)

(assert (=> bs!1963 m!37701))

(assert (=> b!43345 d!8077))

(declare-fun d!8087 () Bool)

(assert (=> d!8087 (= (apply!60 (+!69 lt!18677 (tuple2!1623 lt!18689 lt!18358)) lt!18683) (get!788 (getValueByKey!106 (toList!615 (+!69 lt!18677 (tuple2!1623 lt!18689 lt!18358))) lt!18683)))))

(declare-fun bs!1964 () Bool)

(assert (= bs!1964 d!8087))

(declare-fun m!37703 () Bool)

(assert (=> bs!1964 m!37703))

(assert (=> bs!1964 m!37703))

(declare-fun m!37705 () Bool)

(assert (=> bs!1964 m!37705))

(assert (=> b!43345 d!8087))

(declare-fun d!8089 () Bool)

(assert (=> d!8089 (= (apply!60 (+!69 lt!18677 (tuple2!1623 lt!18689 lt!18358)) lt!18683) (apply!60 lt!18677 lt!18683))))

(declare-fun lt!18942 () Unit!1197)

(assert (=> d!8089 (= lt!18942 (choose!258 lt!18677 lt!18689 lt!18358 lt!18683))))

(declare-fun e!27671 () Bool)

(assert (=> d!8089 e!27671))

(declare-fun res!25845 () Bool)

(assert (=> d!8089 (=> (not res!25845) (not e!27671))))

(assert (=> d!8089 (= res!25845 (contains!562 lt!18677 lt!18683))))

(assert (=> d!8089 (= (addApplyDifferent!36 lt!18677 lt!18689 lt!18358 lt!18683) lt!18942)))

(declare-fun b!43667 () Bool)

(assert (=> b!43667 (= e!27671 (not (= lt!18683 lt!18689)))))

(assert (= (and d!8089 res!25845) b!43667))

(declare-fun m!37721 () Bool)

(assert (=> d!8089 m!37721))

(assert (=> d!8089 m!37185))

(declare-fun m!37723 () Bool)

(assert (=> d!8089 m!37723))

(assert (=> d!8089 m!37185))

(assert (=> d!8089 m!37199))

(assert (=> d!8089 m!37203))

(assert (=> b!43345 d!8089))

(declare-fun d!8093 () Bool)

(assert (=> d!8093 (= (apply!60 lt!18677 lt!18683) (get!788 (getValueByKey!106 (toList!615 lt!18677) lt!18683)))))

(declare-fun bs!1965 () Bool)

(assert (= bs!1965 d!8093))

(declare-fun m!37725 () Bool)

(assert (=> bs!1965 m!37725))

(assert (=> bs!1965 m!37725))

(declare-fun m!37727 () Bool)

(assert (=> bs!1965 m!37727))

(assert (=> b!43345 d!8093))

(declare-fun d!8095 () Bool)

(declare-fun e!27675 () Bool)

(assert (=> d!8095 e!27675))

(declare-fun res!25849 () Bool)

(assert (=> d!8095 (=> (not res!25849) (not e!27675))))

(declare-fun lt!18949 () ListLongMap!1199)

(assert (=> d!8095 (= res!25849 (contains!562 lt!18949 (_1!822 (tuple2!1623 lt!18689 lt!18358))))))

(declare-fun lt!18947 () List!1196)

(assert (=> d!8095 (= lt!18949 (ListLongMap!1200 lt!18947))))

(declare-fun lt!18946 () Unit!1197)

(declare-fun lt!18948 () Unit!1197)

(assert (=> d!8095 (= lt!18946 lt!18948)))

(assert (=> d!8095 (= (getValueByKey!106 lt!18947 (_1!822 (tuple2!1623 lt!18689 lt!18358))) (Some!111 (_2!822 (tuple2!1623 lt!18689 lt!18358))))))

(assert (=> d!8095 (= lt!18948 (lemmaContainsTupThenGetReturnValue!30 lt!18947 (_1!822 (tuple2!1623 lt!18689 lt!18358)) (_2!822 (tuple2!1623 lt!18689 lt!18358))))))

(assert (=> d!8095 (= lt!18947 (insertStrictlySorted!27 (toList!615 lt!18677) (_1!822 (tuple2!1623 lt!18689 lt!18358)) (_2!822 (tuple2!1623 lt!18689 lt!18358))))))

(assert (=> d!8095 (= (+!69 lt!18677 (tuple2!1623 lt!18689 lt!18358)) lt!18949)))

(declare-fun b!43672 () Bool)

(declare-fun res!25848 () Bool)

(assert (=> b!43672 (=> (not res!25848) (not e!27675))))

(assert (=> b!43672 (= res!25848 (= (getValueByKey!106 (toList!615 lt!18949) (_1!822 (tuple2!1623 lt!18689 lt!18358))) (Some!111 (_2!822 (tuple2!1623 lt!18689 lt!18358)))))))

(declare-fun b!43673 () Bool)

(assert (=> b!43673 (= e!27675 (contains!570 (toList!615 lt!18949) (tuple2!1623 lt!18689 lt!18358)))))

(assert (= (and d!8095 res!25849) b!43672))

(assert (= (and b!43672 res!25848) b!43673))

(declare-fun m!37741 () Bool)

(assert (=> d!8095 m!37741))

(declare-fun m!37743 () Bool)

(assert (=> d!8095 m!37743))

(declare-fun m!37745 () Bool)

(assert (=> d!8095 m!37745))

(declare-fun m!37747 () Bool)

(assert (=> d!8095 m!37747))

(declare-fun m!37749 () Bool)

(assert (=> b!43672 m!37749))

(declare-fun m!37751 () Bool)

(assert (=> b!43673 m!37751))

(assert (=> b!43345 d!8095))

(declare-fun d!8101 () Bool)

(assert (=> d!8101 (= (apply!60 lt!18680 lt!18674) (get!788 (getValueByKey!106 (toList!615 lt!18680) lt!18674)))))

(declare-fun bs!1967 () Bool)

(assert (= bs!1967 d!8101))

(declare-fun m!37753 () Bool)

(assert (=> bs!1967 m!37753))

(assert (=> bs!1967 m!37753))

(declare-fun m!37755 () Bool)

(assert (=> bs!1967 m!37755))

(assert (=> b!43345 d!8101))

(declare-fun d!8103 () Bool)

(assert (=> d!8103 (= (apply!60 lt!18693 lt!18694) (get!788 (getValueByKey!106 (toList!615 lt!18693) lt!18694)))))

(declare-fun bs!1968 () Bool)

(assert (= bs!1968 d!8103))

(declare-fun m!37763 () Bool)

(assert (=> bs!1968 m!37763))

(assert (=> bs!1968 m!37763))

(declare-fun m!37769 () Bool)

(assert (=> bs!1968 m!37769))

(assert (=> b!43345 d!8103))

(declare-fun d!8105 () Bool)

(assert (=> d!8105 (= (apply!60 (+!69 lt!18693 (tuple2!1623 lt!18690 lt!18358)) lt!18694) (get!788 (getValueByKey!106 (toList!615 (+!69 lt!18693 (tuple2!1623 lt!18690 lt!18358))) lt!18694)))))

(declare-fun bs!1969 () Bool)

(assert (= bs!1969 d!8105))

(declare-fun m!37777 () Bool)

(assert (=> bs!1969 m!37777))

(assert (=> bs!1969 m!37777))

(declare-fun m!37781 () Bool)

(assert (=> bs!1969 m!37781))

(assert (=> b!43345 d!8105))

(declare-fun d!8109 () Bool)

(assert (=> d!8109 (= (apply!60 (+!69 lt!18680 (tuple2!1623 lt!18679 lt!18358)) lt!18674) (apply!60 lt!18680 lt!18674))))

(declare-fun lt!18954 () Unit!1197)

(assert (=> d!8109 (= lt!18954 (choose!258 lt!18680 lt!18679 lt!18358 lt!18674))))

(declare-fun e!27681 () Bool)

(assert (=> d!8109 e!27681))

(declare-fun res!25855 () Bool)

(assert (=> d!8109 (=> (not res!25855) (not e!27681))))

(assert (=> d!8109 (= res!25855 (contains!562 lt!18680 lt!18674))))

(assert (=> d!8109 (= (addApplyDifferent!36 lt!18680 lt!18679 lt!18358 lt!18674) lt!18954)))

(declare-fun b!43681 () Bool)

(assert (=> b!43681 (= e!27681 (not (= lt!18674 lt!18679)))))

(assert (= (and d!8109 res!25855) b!43681))

(declare-fun m!37785 () Bool)

(assert (=> d!8109 m!37785))

(assert (=> d!8109 m!37205))

(declare-fun m!37787 () Bool)

(assert (=> d!8109 m!37787))

(assert (=> d!8109 m!37205))

(assert (=> d!8109 m!37207))

(assert (=> d!8109 m!37195))

(assert (=> b!43345 d!8109))

(assert (=> b!43345 d!7995))

(declare-fun d!8115 () Bool)

(declare-fun e!27684 () Bool)

(assert (=> d!8115 e!27684))

(declare-fun res!25858 () Bool)

(assert (=> d!8115 (=> (not res!25858) (not e!27684))))

(declare-fun lt!18962 () ListLongMap!1199)

(assert (=> d!8115 (= res!25858 (contains!562 lt!18962 (_1!822 (tuple2!1623 lt!18686 lt!18358))))))

(declare-fun lt!18960 () List!1196)

(assert (=> d!8115 (= lt!18962 (ListLongMap!1200 lt!18960))))

(declare-fun lt!18959 () Unit!1197)

(declare-fun lt!18961 () Unit!1197)

(assert (=> d!8115 (= lt!18959 lt!18961)))

(assert (=> d!8115 (= (getValueByKey!106 lt!18960 (_1!822 (tuple2!1623 lt!18686 lt!18358))) (Some!111 (_2!822 (tuple2!1623 lt!18686 lt!18358))))))

(assert (=> d!8115 (= lt!18961 (lemmaContainsTupThenGetReturnValue!30 lt!18960 (_1!822 (tuple2!1623 lt!18686 lt!18358)) (_2!822 (tuple2!1623 lt!18686 lt!18358))))))

(assert (=> d!8115 (= lt!18960 (insertStrictlySorted!27 (toList!615 lt!18678) (_1!822 (tuple2!1623 lt!18686 lt!18358)) (_2!822 (tuple2!1623 lt!18686 lt!18358))))))

(assert (=> d!8115 (= (+!69 lt!18678 (tuple2!1623 lt!18686 lt!18358)) lt!18962)))

(declare-fun b!43685 () Bool)

(declare-fun res!25857 () Bool)

(assert (=> b!43685 (=> (not res!25857) (not e!27684))))

(assert (=> b!43685 (= res!25857 (= (getValueByKey!106 (toList!615 lt!18962) (_1!822 (tuple2!1623 lt!18686 lt!18358))) (Some!111 (_2!822 (tuple2!1623 lt!18686 lt!18358)))))))

(declare-fun b!43686 () Bool)

(assert (=> b!43686 (= e!27684 (contains!570 (toList!615 lt!18962) (tuple2!1623 lt!18686 lt!18358)))))

(assert (= (and d!8115 res!25858) b!43685))

(assert (= (and b!43685 res!25857) b!43686))

(declare-fun m!37797 () Bool)

(assert (=> d!8115 m!37797))

(declare-fun m!37799 () Bool)

(assert (=> d!8115 m!37799))

(declare-fun m!37801 () Bool)

(assert (=> d!8115 m!37801))

(declare-fun m!37803 () Bool)

(assert (=> d!8115 m!37803))

(declare-fun m!37805 () Bool)

(assert (=> b!43685 m!37805))

(declare-fun m!37807 () Bool)

(assert (=> b!43686 m!37807))

(assert (=> b!43345 d!8115))

(declare-fun b!43687 () Bool)

(declare-fun e!27687 () Bool)

(declare-fun e!27688 () Bool)

(assert (=> b!43687 (= e!27687 e!27688)))

(declare-fun res!25863 () Bool)

(assert (=> b!43687 (=> (not res!25863) (not e!27688))))

(declare-fun e!27686 () Bool)

(assert (=> b!43687 (= res!25863 (not e!27686))))

(declare-fun res!25862 () Bool)

(assert (=> b!43687 (=> (not res!25862) (not e!27686))))

(assert (=> b!43687 (= res!25862 (validKeyInArray!0 (select (arr!1408 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43688 () Bool)

(assert (=> b!43688 (= e!27686 (contains!565 (ite c!5455 (Cons!1193 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) Nil!1194) Nil!1194) (select (arr!1408 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43689 () Bool)

(declare-fun e!27685 () Bool)

(declare-fun call!3507 () Bool)

(assert (=> b!43689 (= e!27685 call!3507)))

(declare-fun b!43690 () Bool)

(assert (=> b!43690 (= e!27685 call!3507)))

(declare-fun bm!3504 () Bool)

(declare-fun c!5633 () Bool)

(assert (=> bm!3504 (= call!3507 (arrayNoDuplicates!0 lt!18353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5633 (Cons!1193 (select (arr!1408 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5455 (Cons!1193 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) Nil!1194) Nil!1194)) (ite c!5455 (Cons!1193 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) Nil!1194) Nil!1194))))))

(declare-fun b!43691 () Bool)

(assert (=> b!43691 (= e!27688 e!27685)))

(assert (=> b!43691 (= c!5633 (validKeyInArray!0 (select (arr!1408 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8119 () Bool)

(declare-fun res!25864 () Bool)

(assert (=> d!8119 (=> res!25864 e!27687)))

(assert (=> d!8119 (= res!25864 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1593 lt!18353)))))

(assert (=> d!8119 (= (arrayNoDuplicates!0 lt!18353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5455 (Cons!1193 (select (arr!1408 lt!18353) #b00000000000000000000000000000000) Nil!1194) Nil!1194)) e!27687)))

(assert (= (and d!8119 (not res!25864)) b!43687))

(assert (= (and b!43687 res!25862) b!43688))

(assert (= (and b!43687 res!25863) b!43691))

(assert (= (and b!43691 c!5633) b!43690))

(assert (= (and b!43691 (not c!5633)) b!43689))

(assert (= (or b!43690 b!43689) bm!3504))

(assert (=> b!43687 m!37501))

(assert (=> b!43687 m!37501))

(assert (=> b!43687 m!37513))

(assert (=> b!43688 m!37501))

(assert (=> b!43688 m!37501))

(declare-fun m!37809 () Bool)

(assert (=> b!43688 m!37809))

(assert (=> bm!3504 m!37501))

(declare-fun m!37811 () Bool)

(assert (=> bm!3504 m!37811))

(assert (=> b!43691 m!37501))

(assert (=> b!43691 m!37501))

(assert (=> b!43691 m!37513))

(assert (=> bm!3395 d!8119))

(assert (=> b!43051 d!7947))

(declare-fun d!8123 () Bool)

(declare-fun e!27690 () Bool)

(assert (=> d!8123 e!27690))

(declare-fun res!25865 () Bool)

(assert (=> d!8123 (=> res!25865 e!27690)))

(declare-fun lt!18966 () Bool)

(assert (=> d!8123 (= res!25865 (not lt!18966))))

(declare-fun lt!18965 () Bool)

(assert (=> d!8123 (= lt!18966 lt!18965)))

(declare-fun lt!18963 () Unit!1197)

(declare-fun e!27689 () Unit!1197)

(assert (=> d!8123 (= lt!18963 e!27689)))

(declare-fun c!5634 () Bool)

(assert (=> d!8123 (= c!5634 lt!18965)))

(assert (=> d!8123 (= lt!18965 (containsKey!74 (toList!615 lt!18682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8123 (= (contains!562 lt!18682 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18966)))

(declare-fun b!43692 () Bool)

(declare-fun lt!18964 () Unit!1197)

(assert (=> b!43692 (= e!27689 lt!18964)))

(assert (=> b!43692 (= lt!18964 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!615 lt!18682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43692 (isDefined!63 (getValueByKey!106 (toList!615 lt!18682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43693 () Bool)

(declare-fun Unit!1216 () Unit!1197)

(assert (=> b!43693 (= e!27689 Unit!1216)))

(declare-fun b!43694 () Bool)

(assert (=> b!43694 (= e!27690 (isDefined!63 (getValueByKey!106 (toList!615 lt!18682) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8123 c!5634) b!43692))

(assert (= (and d!8123 (not c!5634)) b!43693))

(assert (= (and d!8123 (not res!25865)) b!43694))

(declare-fun m!37813 () Bool)

(assert (=> d!8123 m!37813))

(declare-fun m!37815 () Bool)

(assert (=> b!43692 m!37815))

(assert (=> b!43692 m!37223))

(assert (=> b!43692 m!37223))

(declare-fun m!37817 () Bool)

(assert (=> b!43692 m!37817))

(assert (=> b!43694 m!37223))

(assert (=> b!43694 m!37223))

(assert (=> b!43694 m!37817))

(assert (=> bm!3480 d!8123))

(declare-fun d!8125 () Bool)

(declare-fun res!25879 () Bool)

(declare-fun e!27706 () Bool)

(assert (=> d!8125 (=> res!25879 e!27706)))

(assert (=> d!8125 (= res!25879 (and (is-Cons!1192 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!822 (h!1769 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!822 (head!887 (toList!615 lt!18357))))))))

(assert (=> d!8125 (= (containsKey!74 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)) (_1!822 (head!887 (toList!615 lt!18357)))) e!27706)))

(declare-fun b!43712 () Bool)

(declare-fun e!27707 () Bool)

(assert (=> b!43712 (= e!27706 e!27707)))

(declare-fun res!25880 () Bool)

(assert (=> b!43712 (=> (not res!25880) (not e!27707))))

(assert (=> b!43712 (= res!25880 (and (or (not (is-Cons!1192 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)))) (bvsle (_1!822 (h!1769 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!822 (head!887 (toList!615 lt!18357))))) (is-Cons!1192 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))) (bvslt (_1!822 (h!1769 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!822 (head!887 (toList!615 lt!18357))))))))

(declare-fun b!43713 () Bool)

(assert (=> b!43713 (= e!27707 (containsKey!74 (t!4193 (toList!615 (getCurrentListMap!349 lt!18353 lt!18355 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 defaultEntry!470))) (_1!822 (head!887 (toList!615 lt!18357)))))))

(assert (= (and d!8125 (not res!25879)) b!43712))

(assert (= (and b!43712 res!25880) b!43713))

(declare-fun m!37833 () Bool)

(assert (=> b!43713 m!37833))

(assert (=> d!7905 d!8125))

(declare-fun bm!3505 () Bool)

(declare-fun call!3508 () ListLongMap!1199)

(declare-fun call!3510 () ListLongMap!1199)

(assert (=> bm!3505 (= call!3508 call!3510)))

(declare-fun b!43716 () Bool)

(declare-fun e!27717 () ListLongMap!1199)

(declare-fun call!3514 () ListLongMap!1199)

(assert (=> b!43716 (= e!27717 call!3514)))

(declare-fun b!43717 () Bool)

(declare-fun e!27713 () Bool)

(assert (=> b!43717 (= e!27713 (validKeyInArray!0 (select (arr!1408 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!43718 () Bool)

(declare-fun e!27711 () Bool)

(declare-fun e!27716 () Bool)

(assert (=> b!43718 (= e!27711 e!27716)))

(declare-fun res!25884 () Bool)

(assert (=> b!43718 (=> (not res!25884) (not e!27716))))

(declare-fun lt!18981 () ListLongMap!1199)

(assert (=> b!43718 (= res!25884 (contains!562 lt!18981 (select (arr!1408 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> b!43718 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1593 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))))

(declare-fun c!5640 () Bool)

(declare-fun call!3513 () ListLongMap!1199)

(declare-fun call!3509 () ListLongMap!1199)

(declare-fun c!5643 () Bool)

(declare-fun bm!3506 () Bool)

(assert (=> bm!3506 (= call!3513 (+!69 (ite c!5643 call!3510 (ite c!5640 call!3508 call!3509)) (ite (or c!5643 c!5640) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))))

(declare-fun b!43719 () Bool)

(declare-fun e!27712 () Bool)

(declare-fun call!3511 () Bool)

(assert (=> b!43719 (= e!27712 (not call!3511))))

(declare-fun bm!3507 () Bool)

(assert (=> bm!3507 (= call!3509 call!3508)))

(declare-fun bm!3508 () Bool)

(declare-fun call!3512 () Bool)

(assert (=> bm!3508 (= call!3512 (contains!562 lt!18981 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43720 () Bool)

(declare-fun e!27718 () Bool)

(assert (=> b!43720 (= e!27718 (= (apply!60 lt!18981 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))

(declare-fun b!43721 () Bool)

(declare-fun e!27714 () ListLongMap!1199)

(assert (=> b!43721 (= e!27714 call!3509)))

(declare-fun b!43722 () Bool)

(declare-fun e!27709 () Bool)

(assert (=> b!43722 (= e!27712 e!27709)))

(declare-fun res!25881 () Bool)

(assert (=> b!43722 (= res!25881 call!3511)))

(assert (=> b!43722 (=> (not res!25881) (not e!27709))))

(declare-fun b!43723 () Bool)

(declare-fun e!27710 () ListLongMap!1199)

(assert (=> b!43723 (= e!27710 e!27717)))

(assert (=> b!43723 (= c!5640 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43724 () Bool)

(declare-fun e!27719 () Bool)

(declare-fun e!27715 () Bool)

(assert (=> b!43724 (= e!27719 e!27715)))

(declare-fun c!5639 () Bool)

(assert (=> b!43724 (= c!5639 (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43725 () Bool)

(assert (=> b!43725 (= e!27715 e!27718)))

(declare-fun res!25885 () Bool)

(assert (=> b!43725 (= res!25885 call!3512)))

(assert (=> b!43725 (=> (not res!25885) (not e!27718))))

(declare-fun bm!3509 () Bool)

(assert (=> bm!3509 (= call!3511 (contains!562 lt!18981 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43726 () Bool)

(assert (=> b!43726 (= e!27714 call!3514)))

(declare-fun b!43727 () Bool)

(declare-fun e!27721 () Unit!1197)

(declare-fun lt!18980 () Unit!1197)

(assert (=> b!43727 (= e!27721 lt!18980)))

(declare-fun lt!18977 () ListLongMap!1199)

(assert (=> b!43727 (= lt!18977 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))

(declare-fun lt!18985 () (_ BitVec 64))

(assert (=> b!43727 (= lt!18985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18984 () (_ BitVec 64))

(assert (=> b!43727 (= lt!18984 (select (arr!1408 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18991 () Unit!1197)

(assert (=> b!43727 (= lt!18991 (addStillContains!36 lt!18977 lt!18985 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) lt!18984))))

(assert (=> b!43727 (contains!562 (+!69 lt!18977 (tuple2!1623 lt!18985 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))) lt!18984)))

(declare-fun lt!18974 () Unit!1197)

(assert (=> b!43727 (= lt!18974 lt!18991)))

(declare-fun lt!18979 () ListLongMap!1199)

(assert (=> b!43727 (= lt!18979 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))

(declare-fun lt!18978 () (_ BitVec 64))

(assert (=> b!43727 (= lt!18978 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18973 () (_ BitVec 64))

(assert (=> b!43727 (= lt!18973 (select (arr!1408 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18994 () Unit!1197)

(assert (=> b!43727 (= lt!18994 (addApplyDifferent!36 lt!18979 lt!18978 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) lt!18973))))

(assert (=> b!43727 (= (apply!60 (+!69 lt!18979 (tuple2!1623 lt!18978 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))) lt!18973) (apply!60 lt!18979 lt!18973))))

(declare-fun lt!18990 () Unit!1197)

(assert (=> b!43727 (= lt!18990 lt!18994)))

(declare-fun lt!18992 () ListLongMap!1199)

(assert (=> b!43727 (= lt!18992 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))

(declare-fun lt!18989 () (_ BitVec 64))

(assert (=> b!43727 (= lt!18989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18993 () (_ BitVec 64))

(assert (=> b!43727 (= lt!18993 (select (arr!1408 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18987 () Unit!1197)

(assert (=> b!43727 (= lt!18987 (addApplyDifferent!36 lt!18992 lt!18989 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) lt!18993))))

(assert (=> b!43727 (= (apply!60 (+!69 lt!18992 (tuple2!1623 lt!18989 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))) lt!18993) (apply!60 lt!18992 lt!18993))))

(declare-fun lt!18975 () Unit!1197)

(assert (=> b!43727 (= lt!18975 lt!18987)))

(declare-fun lt!18976 () ListLongMap!1199)

(assert (=> b!43727 (= lt!18976 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))

(declare-fun lt!18988 () (_ BitVec 64))

(assert (=> b!43727 (= lt!18988 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18982 () (_ BitVec 64))

(assert (=> b!43727 (= lt!18982 (select (arr!1408 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(assert (=> b!43727 (= lt!18980 (addApplyDifferent!36 lt!18976 lt!18988 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) lt!18982))))

(assert (=> b!43727 (= (apply!60 (+!69 lt!18976 (tuple2!1623 lt!18988 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))) lt!18982) (apply!60 lt!18976 lt!18982))))

(declare-fun b!43728 () Bool)

(declare-fun Unit!1217 () Unit!1197)

(assert (=> b!43728 (= e!27721 Unit!1217)))

(declare-fun b!43729 () Bool)

(assert (=> b!43729 (= e!27715 (not call!3512))))

(declare-fun d!8135 () Bool)

(assert (=> d!8135 e!27719))

(declare-fun res!25888 () Bool)

(assert (=> d!8135 (=> (not res!25888) (not e!27719))))

(assert (=> d!8135 (= res!25888 (or (bvsge #b00000000000000000000000000000000 (size!1593 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1593 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))))))

(declare-fun lt!18983 () ListLongMap!1199)

(assert (=> d!8135 (= lt!18981 lt!18983)))

(declare-fun lt!18986 () Unit!1197)

(assert (=> d!8135 (= lt!18986 e!27721)))

(declare-fun c!5638 () Bool)

(assert (=> d!8135 (= c!5638 e!27713)))

(declare-fun res!25889 () Bool)

(assert (=> d!8135 (=> (not res!25889) (not e!27713))))

(assert (=> d!8135 (= res!25889 (bvslt #b00000000000000000000000000000000 (size!1593 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))))

(assert (=> d!8135 (= lt!18983 e!27710)))

(assert (=> d!8135 (= c!5643 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8135 (validMask!0 (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))

(assert (=> d!8135 (= (getCurrentListMap!349 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) lt!18981)))

(declare-fun bm!3510 () Bool)

(assert (=> bm!3510 (= call!3510 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))

(declare-fun b!43730 () Bool)

(declare-fun c!5641 () Bool)

(assert (=> b!43730 (= c!5641 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!43730 (= e!27717 e!27714)))

(declare-fun b!43731 () Bool)

(declare-fun res!25882 () Bool)

(assert (=> b!43731 (=> (not res!25882) (not e!27719))))

(assert (=> b!43731 (= res!25882 e!27711)))

(declare-fun res!25887 () Bool)

(assert (=> b!43731 (=> res!25887 e!27711)))

(declare-fun e!27720 () Bool)

(assert (=> b!43731 (= res!25887 (not e!27720))))

(declare-fun res!25883 () Bool)

(assert (=> b!43731 (=> (not res!25883) (not e!27720))))

(assert (=> b!43731 (= res!25883 (bvslt #b00000000000000000000000000000000 (size!1593 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))))

(declare-fun b!43732 () Bool)

(assert (=> b!43732 (= e!27709 (= (apply!60 lt!18981 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))))))

(declare-fun b!43733 () Bool)

(declare-fun res!25886 () Bool)

(assert (=> b!43733 (=> (not res!25886) (not e!27719))))

(assert (=> b!43733 (= res!25886 e!27712)))

(declare-fun c!5642 () Bool)

(assert (=> b!43733 (= c!5642 (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!3511 () Bool)

(assert (=> bm!3511 (= call!3514 call!3513)))

(declare-fun b!43734 () Bool)

(assert (=> b!43734 (= e!27720 (validKeyInArray!0 (select (arr!1408 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!43735 () Bool)

(assert (=> b!43735 (= e!27716 (= (apply!60 lt!18981 (select (arr!1408 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (get!787 (select (arr!1407 (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (dynLambda!259 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1592 (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))))

(assert (=> b!43735 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1593 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))))

(declare-fun b!43736 () Bool)

(assert (=> b!43736 (= e!27710 (+!69 call!3513 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000)))))))

(assert (= (and d!8135 c!5643) b!43736))

(assert (= (and d!8135 (not c!5643)) b!43723))

(assert (= (and b!43723 c!5640) b!43716))

(assert (= (and b!43723 (not c!5640)) b!43730))

(assert (= (and b!43730 c!5641) b!43726))

(assert (= (and b!43730 (not c!5641)) b!43721))

(assert (= (or b!43726 b!43721) bm!3507))

(assert (= (or b!43716 bm!3507) bm!3505))

(assert (= (or b!43716 b!43726) bm!3511))

(assert (= (or b!43736 bm!3505) bm!3510))

(assert (= (or b!43736 bm!3511) bm!3506))

(assert (= (and d!8135 res!25889) b!43717))

(assert (= (and d!8135 c!5638) b!43727))

(assert (= (and d!8135 (not c!5638)) b!43728))

(assert (= (and d!8135 res!25888) b!43731))

(assert (= (and b!43731 res!25883) b!43734))

(assert (= (and b!43731 (not res!25887)) b!43718))

(assert (= (and b!43718 res!25884) b!43735))

(assert (= (and b!43731 res!25882) b!43733))

(assert (= (and b!43733 c!5642) b!43722))

(assert (= (and b!43733 (not c!5642)) b!43719))

(assert (= (and b!43722 res!25881) b!43732))

(assert (= (or b!43722 b!43719) bm!3509))

(assert (= (and b!43733 res!25886) b!43724))

(assert (= (and b!43724 c!5639) b!43725))

(assert (= (and b!43724 (not c!5639)) b!43729))

(assert (= (and b!43725 res!25885) b!43720))

(assert (= (or b!43725 b!43729) bm!3508))

(declare-fun b_lambda!2281 () Bool)

(assert (=> (not b_lambda!2281) (not b!43735)))

(declare-fun tb!991 () Bool)

(declare-fun t!4206 () Bool)

(assert (=> (and start!6466 (= defaultEntry!470 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18358 lt!18358 #b00000000000000000000000000000000 lt!18353 lt!18355 #b00000000000000000000000000000000))) t!4206) tb!991))

(declare-fun result!1731 () Bool)

(assert (=> tb!991 (= result!1731 tp_is_empty!1891)))

(assert (=> b!43735 t!4206))

(declare-fun b_and!2683 () Bool)

(assert (= b_and!2675 (and (=> t!4206 result!1731) b_and!2683)))

(declare-fun m!37843 () Bool)

(assert (=> b!43718 m!37843))

(assert (=> b!43718 m!37843))

(declare-fun m!37845 () Bool)

(assert (=> b!43718 m!37845))

(declare-fun m!37847 () Bool)

(assert (=> bm!3508 m!37847))

(declare-fun m!37849 () Bool)

(assert (=> bm!3510 m!37849))

(assert (=> b!43717 m!37843))

(assert (=> b!43717 m!37843))

(declare-fun m!37851 () Bool)

(assert (=> b!43717 m!37851))

(declare-fun m!37853 () Bool)

(assert (=> bm!3509 m!37853))

(declare-fun m!37855 () Bool)

(assert (=> d!8135 m!37855))

(declare-fun m!37857 () Bool)

(assert (=> b!43727 m!37857))

(declare-fun m!37859 () Bool)

(assert (=> b!43727 m!37859))

(declare-fun m!37861 () Bool)

(assert (=> b!43727 m!37861))

(declare-fun m!37863 () Bool)

(assert (=> b!43727 m!37863))

(declare-fun m!37865 () Bool)

(assert (=> b!43727 m!37865))

(assert (=> b!43727 m!37849))

(assert (=> b!43727 m!37859))

(declare-fun m!37867 () Bool)

(assert (=> b!43727 m!37867))

(declare-fun m!37871 () Bool)

(assert (=> b!43727 m!37871))

(declare-fun m!37875 () Bool)

(assert (=> b!43727 m!37875))

(declare-fun m!37877 () Bool)

(assert (=> b!43727 m!37877))

(assert (=> b!43727 m!37843))

(declare-fun m!37883 () Bool)

(assert (=> b!43727 m!37883))

(assert (=> b!43727 m!37863))

(declare-fun m!37891 () Bool)

(assert (=> b!43727 m!37891))

(assert (=> b!43727 m!37871))

(declare-fun m!37895 () Bool)

(assert (=> b!43727 m!37895))

(declare-fun m!37897 () Bool)

(assert (=> b!43727 m!37897))

(declare-fun m!37899 () Bool)

(assert (=> b!43727 m!37899))

(declare-fun m!37901 () Bool)

(assert (=> b!43727 m!37901))

(assert (=> b!43727 m!37899))

(declare-fun m!37903 () Bool)

(assert (=> b!43736 m!37903))

(declare-fun m!37905 () Bool)

(assert (=> b!43735 m!37905))

(assert (=> b!43735 m!37843))

(declare-fun m!37907 () Bool)

(assert (=> b!43735 m!37907))

(declare-fun m!37909 () Bool)

(assert (=> b!43735 m!37909))

(assert (=> b!43735 m!37905))

(declare-fun m!37911 () Bool)

(assert (=> b!43735 m!37911))

(assert (=> b!43735 m!37909))

(assert (=> b!43735 m!37843))

(assert (=> b!43734 m!37843))

(assert (=> b!43734 m!37843))

(assert (=> b!43734 m!37851))

(declare-fun m!37919 () Bool)

(assert (=> bm!3506 m!37919))

(declare-fun m!37923 () Bool)

(assert (=> b!43732 m!37923))

(declare-fun m!37927 () Bool)

(assert (=> b!43720 m!37927))

(assert (=> d!7897 d!8135))

(assert (=> d!7907 d!7901))

(assert (=> d!7875 d!7889))

(declare-fun d!8151 () Bool)

(assert (=> d!8151 (arrayNoDuplicates!0 lt!18353 #b00000000000000000000000000000000 Nil!1194)))

(assert (=> d!8151 true))

(declare-fun res!25909 () Unit!1197)

(assert (=> d!8151 (= (choose!111 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1194) res!25909)))

(declare-fun bs!1978 () Bool)

(assert (= bs!1978 d!8151))

(assert (=> bs!1978 m!36897))

(assert (=> d!7875 d!8151))

(declare-fun d!8159 () Bool)

(assert (=> d!8159 (= (apply!60 lt!18682 #b1000000000000000000000000000000000000000000000000000000000000000) (get!788 (getValueByKey!106 (toList!615 lt!18682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1979 () Bool)

(assert (= bs!1979 d!8159))

(declare-fun m!37937 () Bool)

(assert (=> bs!1979 m!37937))

(assert (=> bs!1979 m!37937))

(declare-fun m!37939 () Bool)

(assert (=> bs!1979 m!37939))

(assert (=> b!43338 d!8159))

(assert (=> b!43077 d!7947))

(assert (=> d!7885 d!7899))

(declare-fun d!8161 () Bool)

(assert (=> d!8161 (= (arrayCountValidKeys!0 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!8161 true))

(declare-fun _$88!52 () Unit!1197)

(assert (=> d!8161 (= (choose!59 lt!18353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!52)))

(declare-fun bs!1981 () Bool)

(assert (= bs!1981 d!8161))

(assert (=> bs!1981 m!36903))

(assert (=> d!7885 d!8161))

(declare-fun d!8165 () Bool)

(declare-fun e!27749 () Bool)

(assert (=> d!8165 e!27749))

(declare-fun res!25910 () Bool)

(assert (=> d!8165 (=> res!25910 e!27749)))

(declare-fun lt!19034 () Bool)

(assert (=> d!8165 (= res!25910 (not lt!19034))))

(declare-fun lt!19033 () Bool)

(assert (=> d!8165 (= lt!19034 lt!19033)))

(declare-fun lt!19031 () Unit!1197)

(declare-fun e!27748 () Unit!1197)

(assert (=> d!8165 (= lt!19031 e!27748)))

(declare-fun c!5660 () Bool)

(assert (=> d!8165 (= c!5660 lt!19033)))

(assert (=> d!8165 (= lt!19033 (containsKey!74 (toList!615 lt!18682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8165 (= (contains!562 lt!18682 #b1000000000000000000000000000000000000000000000000000000000000000) lt!19034)))

(declare-fun b!43783 () Bool)

(declare-fun lt!19032 () Unit!1197)

(assert (=> b!43783 (= e!27748 lt!19032)))

(assert (=> b!43783 (= lt!19032 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!615 lt!18682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43783 (isDefined!63 (getValueByKey!106 (toList!615 lt!18682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43784 () Bool)

(declare-fun Unit!1220 () Unit!1197)

(assert (=> b!43784 (= e!27748 Unit!1220)))

(declare-fun b!43785 () Bool)

(assert (=> b!43785 (= e!27749 (isDefined!63 (getValueByKey!106 (toList!615 lt!18682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8165 c!5660) b!43783))

(assert (= (and d!8165 (not c!5660)) b!43784))

(assert (= (and d!8165 (not res!25910)) b!43785))

(declare-fun m!37941 () Bool)

(assert (=> d!8165 m!37941))

(declare-fun m!37943 () Bool)

(assert (=> b!43783 m!37943))

(assert (=> b!43783 m!37937))

(assert (=> b!43783 m!37937))

(declare-fun m!37945 () Bool)

(assert (=> b!43783 m!37945))

(assert (=> b!43785 m!37937))

(assert (=> b!43785 m!37937))

(assert (=> b!43785 m!37945))

(assert (=> bm!3479 d!8165))

(declare-fun d!8167 () Bool)

(declare-fun e!27750 () Bool)

(assert (=> d!8167 e!27750))

(declare-fun res!25912 () Bool)

(assert (=> d!8167 (=> (not res!25912) (not e!27750))))

(declare-fun lt!19039 () ListLongMap!1199)

(assert (=> d!8167 (= res!25912 (contains!562 lt!19039 (_1!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))))))

(declare-fun lt!19037 () List!1196)

(assert (=> d!8167 (= lt!19039 (ListLongMap!1200 lt!19037))))

(declare-fun lt!19036 () Unit!1197)

(declare-fun lt!19038 () Unit!1197)

(assert (=> d!8167 (= lt!19036 lt!19038)))

(assert (=> d!8167 (= (getValueByKey!106 lt!19037 (_1!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))) (Some!111 (_2!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))))))

(assert (=> d!8167 (= lt!19038 (lemmaContainsTupThenGetReturnValue!30 lt!19037 (_1!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)) (_2!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))))))

(assert (=> d!8167 (= lt!19037 (insertStrictlySorted!27 (toList!615 call!3484) (_1!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)) (_2!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))))))

(assert (=> d!8167 (= (+!69 call!3484 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)) lt!19039)))

(declare-fun b!43786 () Bool)

(declare-fun res!25911 () Bool)

(assert (=> b!43786 (=> (not res!25911) (not e!27750))))

(assert (=> b!43786 (= res!25911 (= (getValueByKey!106 (toList!615 lt!19039) (_1!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))) (Some!111 (_2!822 (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))))))

(declare-fun b!43787 () Bool)

(assert (=> b!43787 (= e!27750 (contains!570 (toList!615 lt!19039) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))))

(assert (= (and d!8167 res!25912) b!43786))

(assert (= (and b!43786 res!25911) b!43787))

(declare-fun m!37957 () Bool)

(assert (=> d!8167 m!37957))

(declare-fun m!37961 () Bool)

(assert (=> d!8167 m!37961))

(declare-fun m!37965 () Bool)

(assert (=> d!8167 m!37965))

(declare-fun m!37967 () Bool)

(assert (=> d!8167 m!37967))

(declare-fun m!37969 () Bool)

(assert (=> b!43786 m!37969))

(declare-fun m!37973 () Bool)

(assert (=> b!43787 m!37973))

(assert (=> b!43354 d!8167))

(declare-fun b!43788 () Bool)

(declare-fun e!27752 () (_ BitVec 32))

(declare-fun call!3522 () (_ BitVec 32))

(assert (=> b!43788 (= e!27752 call!3522)))

(declare-fun b!43789 () Bool)

(assert (=> b!43789 (= e!27752 (bvadd #b00000000000000000000000000000001 call!3522))))

(declare-fun d!8171 () Bool)

(declare-fun lt!19040 () (_ BitVec 32))

(assert (=> d!8171 (and (bvsge lt!19040 #b00000000000000000000000000000000) (bvsle lt!19040 (bvsub (size!1593 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!27751 () (_ BitVec 32))

(assert (=> d!8171 (= lt!19040 e!27751)))

(declare-fun c!5661 () Bool)

(assert (=> d!8171 (= c!5661 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8171 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1593 lt!18353)))))

(assert (=> d!8171 (= (arrayCountValidKeys!0 lt!18353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19040)))

(declare-fun b!43790 () Bool)

(assert (=> b!43790 (= e!27751 e!27752)))

(declare-fun c!5662 () Bool)

(assert (=> b!43790 (= c!5662 (validKeyInArray!0 (select (arr!1408 lt!18353) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43791 () Bool)

(assert (=> b!43791 (= e!27751 #b00000000000000000000000000000000)))

(declare-fun bm!3519 () Bool)

(assert (=> bm!3519 (= call!3522 (arrayCountValidKeys!0 lt!18353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!8171 c!5661) b!43791))

(assert (= (and d!8171 (not c!5661)) b!43790))

(assert (= (and b!43790 c!5662) b!43789))

(assert (= (and b!43790 (not c!5662)) b!43788))

(assert (= (or b!43789 b!43788) bm!3519))

(assert (=> b!43790 m!37501))

(assert (=> b!43790 m!37501))

(assert (=> b!43790 m!37513))

(declare-fun m!37999 () Bool)

(assert (=> bm!3519 m!37999))

(assert (=> bm!3401 d!8171))

(declare-fun d!8173 () Bool)

(assert (=> d!8173 (= (apply!60 lt!18682 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)) (get!788 (getValueByKey!106 (toList!615 lt!18682) (select (arr!1408 lt!18353) #b00000000000000000000000000000000))))))

(declare-fun bs!1983 () Bool)

(assert (= bs!1983 d!8173))

(assert (=> bs!1983 m!36979))

(declare-fun m!38007 () Bool)

(assert (=> bs!1983 m!38007))

(assert (=> bs!1983 m!38007))

(declare-fun m!38011 () Bool)

(assert (=> bs!1983 m!38011))

(assert (=> b!43353 d!8173))

(declare-fun d!8175 () Bool)

(declare-fun c!5665 () Bool)

(assert (=> d!8175 (= c!5665 (is-ValueCellFull!698 (select (arr!1407 lt!18355) #b00000000000000000000000000000000)))))

(declare-fun e!27761 () V!2309)

(assert (=> d!8175 (= (get!787 (select (arr!1407 lt!18355) #b00000000000000000000000000000000) (dynLambda!259 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)) e!27761)))

(declare-fun b!43802 () Bool)

(declare-fun get!793 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43802 (= e!27761 (get!793 (select (arr!1407 lt!18355) #b00000000000000000000000000000000) (dynLambda!259 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!43803 () Bool)

(declare-fun get!794 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43803 (= e!27761 (get!794 (select (arr!1407 lt!18355) #b00000000000000000000000000000000) (dynLambda!259 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8175 c!5665) b!43802))

(assert (= (and d!8175 (not c!5665)) b!43803))

(assert (=> b!43802 m!37213))

(assert (=> b!43802 m!36905))

(declare-fun m!38029 () Bool)

(assert (=> b!43802 m!38029))

(assert (=> b!43803 m!37213))

(assert (=> b!43803 m!36905))

(declare-fun m!38031 () Bool)

(assert (=> b!43803 m!38031))

(assert (=> b!43353 d!8175))

(declare-fun d!8181 () Bool)

(declare-fun e!27766 () Bool)

(assert (=> d!8181 e!27766))

(declare-fun res!25924 () Bool)

(assert (=> d!8181 (=> (not res!25924) (not e!27766))))

(declare-fun lt!19044 () ListLongMap!1199)

(assert (=> d!8181 (= res!25924 (contains!562 lt!19044 (_1!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))))))

(declare-fun lt!19042 () List!1196)

(assert (=> d!8181 (= lt!19044 (ListLongMap!1200 lt!19042))))

(declare-fun lt!19041 () Unit!1197)

(declare-fun lt!19043 () Unit!1197)

(assert (=> d!8181 (= lt!19041 lt!19043)))

(assert (=> d!8181 (= (getValueByKey!106 lt!19042 (_1!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))) (Some!111 (_2!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))))))

(assert (=> d!8181 (= lt!19043 (lemmaContainsTupThenGetReturnValue!30 lt!19042 (_1!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))) (_2!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))))))

(assert (=> d!8181 (= lt!19042 (insertStrictlySorted!27 (toList!615 (ite c!5546 call!3481 (ite c!5543 call!3479 call!3480))) (_1!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))) (_2!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))))))

(assert (=> d!8181 (= (+!69 (ite c!5546 call!3481 (ite c!5543 call!3479 call!3480)) (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))) lt!19044)))

(declare-fun b!43806 () Bool)

(declare-fun res!25923 () Bool)

(assert (=> b!43806 (=> (not res!25923) (not e!27766))))

(assert (=> b!43806 (= res!25923 (= (getValueByKey!106 (toList!615 lt!19044) (_1!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358)))) (Some!111 (_2!822 (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))))))))

(declare-fun b!43807 () Bool)

(assert (=> b!43807 (= e!27766 (contains!570 (toList!615 lt!19044) (ite (or c!5546 c!5543) (tuple2!1623 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18358) (tuple2!1623 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18358))))))

(assert (= (and d!8181 res!25924) b!43806))

(assert (= (and b!43806 res!25923) b!43807))

(declare-fun m!38033 () Bool)

(assert (=> d!8181 m!38033))

(declare-fun m!38035 () Bool)

(assert (=> d!8181 m!38035))

(declare-fun m!38037 () Bool)

(assert (=> d!8181 m!38037))

(declare-fun m!38039 () Bool)

(assert (=> d!8181 m!38039))

(declare-fun m!38041 () Bool)

(assert (=> b!43806 m!38041))

(declare-fun m!38043 () Bool)

(assert (=> b!43807 m!38043))

(assert (=> bm!3477 d!8181))

(assert (=> b!43352 d!7947))

(declare-fun d!8183 () Bool)

(declare-fun e!27768 () Bool)

(assert (=> d!8183 e!27768))

(declare-fun res!25925 () Bool)

(assert (=> d!8183 (=> res!25925 e!27768)))

(declare-fun lt!19048 () Bool)

(assert (=> d!8183 (= res!25925 (not lt!19048))))

(declare-fun lt!19047 () Bool)

(assert (=> d!8183 (= lt!19048 lt!19047)))

(declare-fun lt!19045 () Unit!1197)

(declare-fun e!27767 () Unit!1197)

(assert (=> d!8183 (= lt!19045 e!27767)))

(declare-fun c!5666 () Bool)

(assert (=> d!8183 (= c!5666 lt!19047)))

(assert (=> d!8183 (= lt!19047 (containsKey!74 (toList!615 lt!18682) (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(assert (=> d!8183 (= (contains!562 lt!18682 (select (arr!1408 lt!18353) #b00000000000000000000000000000000)) lt!19048)))

(declare-fun b!43810 () Bool)

(declare-fun lt!19046 () Unit!1197)

(assert (=> b!43810 (= e!27767 lt!19046)))

(assert (=> b!43810 (= lt!19046 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!615 lt!18682) (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(assert (=> b!43810 (isDefined!63 (getValueByKey!106 (toList!615 lt!18682) (select (arr!1408 lt!18353) #b00000000000000000000000000000000)))))

(declare-fun b!43811 () Bool)

(declare-fun Unit!1222 () Unit!1197)

(assert (=> b!43811 (= e!27767 Unit!1222)))

(declare-fun b!43812 () Bool)

(assert (=> b!43812 (= e!27768 (isDefined!63 (getValueByKey!106 (toList!615 lt!18682) (select (arr!1408 lt!18353) #b00000000000000000000000000000000))))))

(assert (= (and d!8183 c!5666) b!43810))

(assert (= (and d!8183 (not c!5666)) b!43811))

(assert (= (and d!8183 (not res!25925)) b!43812))

