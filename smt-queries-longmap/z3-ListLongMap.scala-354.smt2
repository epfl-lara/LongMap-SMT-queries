; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6460 () Bool)

(assert start!6460)

(declare-fun b_free!1501 () Bool)

(declare-fun b_next!1501 () Bool)

(assert (=> start!6460 (= b_free!1501 (not b_next!1501))))

(declare-fun tp!5939 () Bool)

(declare-fun b_and!2653 () Bool)

(assert (=> start!6460 (= tp!5939 b_and!2653)))

(declare-fun b!42910 () Bool)

(declare-fun res!25518 () Bool)

(declare-fun e!27194 () Bool)

(assert (=> b!42910 (=> res!25518 e!27194)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!42910 (= res!25518 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2309 0))(
  ( (V!2310 (val!984 Int)) )
))
(declare-datatypes ((tuple2!1626 0))(
  ( (tuple2!1627 (_1!824 (_ BitVec 64)) (_2!824 V!2309)) )
))
(declare-datatypes ((List!1189 0))(
  ( (Nil!1186) (Cons!1185 (h!1762 tuple2!1626) (t!4185 List!1189)) )
))
(declare-datatypes ((ListLongMap!1191 0))(
  ( (ListLongMap!1192 (toList!611 List!1189)) )
))
(declare-fun lt!18340 () ListLongMap!1191)

(declare-fun lt!18335 () V!2309)

(declare-fun b!42911 () Bool)

(declare-datatypes ((array!2901 0))(
  ( (array!2902 (arr!1394 (Array (_ BitVec 32) (_ BitVec 64))) (size!1579 (_ BitVec 32))) )
))
(declare-fun lt!18338 () array!2901)

(declare-datatypes ((ValueCell!698 0))(
  ( (ValueCellFull!698 (v!2072 V!2309)) (EmptyCell!698) )
))
(declare-datatypes ((array!2903 0))(
  ( (array!2904 (arr!1395 (Array (_ BitVec 32) ValueCell!698)) (size!1580 (_ BitVec 32))) )
))
(declare-fun lt!18341 () array!2903)

(declare-fun contains!560 (ListLongMap!1191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!339 (array!2901 array!2903 (_ BitVec 32) (_ BitVec 32) V!2309 V!2309 (_ BitVec 32) Int) ListLongMap!1191)

(declare-fun head!887 (List!1189) tuple2!1626)

(assert (=> b!42911 (= e!27194 (contains!560 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470) (_1!824 (head!887 (toList!611 lt!18340)))))))

(declare-fun b!42908 () Bool)

(declare-fun e!27193 () Bool)

(assert (=> b!42908 (= e!27193 (not e!27194))))

(declare-fun res!25519 () Bool)

(assert (=> b!42908 (=> res!25519 e!27194)))

(assert (=> b!42908 (= res!25519 (= lt!18340 (ListLongMap!1192 Nil!1186)))))

(declare-datatypes ((LongMapFixedSize!376 0))(
  ( (LongMapFixedSize!377 (defaultEntry!1881 Int) (mask!5429 (_ BitVec 32)) (extraKeys!1772 (_ BitVec 32)) (zeroValue!1799 V!2309) (minValue!1799 V!2309) (_size!237 (_ BitVec 32)) (_keys!3429 array!2901) (_values!1864 array!2903) (_vacant!237 (_ BitVec 32))) )
))
(declare-fun map!833 (LongMapFixedSize!376) ListLongMap!1191)

(assert (=> b!42908 (= lt!18340 (map!833 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1190 0))(
  ( (Nil!1187) (Cons!1186 (h!1763 (_ BitVec 64)) (t!4186 List!1190)) )
))
(declare-fun arrayNoDuplicates!0 (array!2901 (_ BitVec 32) List!1190) Bool)

(assert (=> b!42908 (arrayNoDuplicates!0 lt!18338 #b00000000000000000000000000000000 Nil!1187)))

(declare-datatypes ((Unit!1204 0))(
  ( (Unit!1205) )
))
(declare-fun lt!18339 () Unit!1204)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2901 (_ BitVec 32) (_ BitVec 32) List!1190) Unit!1204)

(assert (=> b!42908 (= lt!18339 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2901 (_ BitVec 32)) Bool)

(assert (=> b!42908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18338 mask!853)))

(declare-fun lt!18337 () Unit!1204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2901 (_ BitVec 32) (_ BitVec 32)) Unit!1204)

(assert (=> b!42908 (= lt!18337 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18338 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2901 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42908 (= (arrayCountValidKeys!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18336 () Unit!1204)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2901 (_ BitVec 32) (_ BitVec 32)) Unit!1204)

(assert (=> b!42908 (= lt!18336 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42908 (= lt!18341 (array!2904 ((as const (Array (_ BitVec 32) ValueCell!698)) EmptyCell!698) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42908 (= lt!18338 (array!2902 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!258 (Int (_ BitVec 64)) V!2309)

(assert (=> b!42908 (= lt!18335 (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42909 () Bool)

(declare-fun res!25516 () Bool)

(assert (=> b!42909 (=> res!25516 e!27194)))

(declare-fun isEmpty!279 (List!1189) Bool)

(assert (=> b!42909 (= res!25516 (isEmpty!279 (toList!611 lt!18340)))))

(declare-fun res!25517 () Bool)

(assert (=> start!6460 (=> (not res!25517) (not e!27193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6460 (= res!25517 (validMask!0 mask!853))))

(assert (=> start!6460 e!27193))

(assert (=> start!6460 true))

(assert (=> start!6460 tp!5939))

(assert (= (and start!6460 res!25517) b!42908))

(assert (= (and b!42908 (not res!25519)) b!42909))

(assert (= (and b!42909 (not res!25516)) b!42910))

(assert (= (and b!42910 (not res!25518)) b!42911))

(declare-fun b_lambda!2247 () Bool)

(assert (=> (not b_lambda!2247) (not b!42908)))

(declare-fun t!4184 () Bool)

(declare-fun tb!983 () Bool)

(assert (=> (and start!6460 (= defaultEntry!470 defaultEntry!470) t!4184) tb!983))

(declare-fun result!1717 () Bool)

(declare-fun tp_is_empty!1891 () Bool)

(assert (=> tb!983 (= result!1717 tp_is_empty!1891)))

(assert (=> b!42908 t!4184))

(declare-fun b_and!2655 () Bool)

(assert (= b_and!2653 (and (=> t!4184 result!1717) b_and!2655)))

(declare-fun m!36791 () Bool)

(assert (=> b!42911 m!36791))

(declare-fun m!36793 () Bool)

(assert (=> b!42911 m!36793))

(assert (=> b!42911 m!36791))

(declare-fun m!36795 () Bool)

(assert (=> b!42911 m!36795))

(declare-fun m!36797 () Bool)

(assert (=> b!42908 m!36797))

(declare-fun m!36799 () Bool)

(assert (=> b!42908 m!36799))

(declare-fun m!36801 () Bool)

(assert (=> b!42908 m!36801))

(declare-fun m!36803 () Bool)

(assert (=> b!42908 m!36803))

(declare-fun m!36805 () Bool)

(assert (=> b!42908 m!36805))

(declare-fun m!36807 () Bool)

(assert (=> b!42908 m!36807))

(declare-fun m!36809 () Bool)

(assert (=> b!42908 m!36809))

(declare-fun m!36811 () Bool)

(assert (=> b!42908 m!36811))

(declare-fun m!36813 () Bool)

(assert (=> b!42909 m!36813))

(declare-fun m!36815 () Bool)

(assert (=> start!6460 m!36815))

(check-sat (not b!42908) (not b!42909) (not b!42911) (not b_lambda!2247) tp_is_empty!1891 b_and!2655 (not b_next!1501) (not start!6460))
(check-sat b_and!2655 (not b_next!1501))
(get-model)

(declare-fun b_lambda!2257 () Bool)

(assert (= b_lambda!2247 (or (and start!6460 b_free!1501) b_lambda!2257)))

(check-sat (not b!42908) (not b!42909) (not b_lambda!2257) (not b!42911) tp_is_empty!1891 b_and!2655 (not b_next!1501) (not start!6460))
(check-sat b_and!2655 (not b_next!1501))
(get-model)

(declare-fun bm!3394 () Bool)

(declare-fun call!3397 () (_ BitVec 32))

(assert (=> bm!3394 (= call!3397 (arrayCountValidKeys!0 lt!18338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42958 () Bool)

(declare-fun e!27217 () (_ BitVec 32))

(assert (=> b!42958 (= e!27217 #b00000000000000000000000000000000)))

(declare-fun b!42959 () Bool)

(declare-fun e!27218 () (_ BitVec 32))

(assert (=> b!42959 (= e!27218 (bvadd #b00000000000000000000000000000001 call!3397))))

(declare-fun b!42960 () Bool)

(assert (=> b!42960 (= e!27217 e!27218)))

(declare-fun c!5428 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42960 (= c!5428 (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!42961 () Bool)

(assert (=> b!42961 (= e!27218 call!3397)))

(declare-fun d!7839 () Bool)

(declare-fun lt!18392 () (_ BitVec 32))

(assert (=> d!7839 (and (bvsge lt!18392 #b00000000000000000000000000000000) (bvsle lt!18392 (bvsub (size!1579 lt!18338) #b00000000000000000000000000000000)))))

(assert (=> d!7839 (= lt!18392 e!27217)))

(declare-fun c!5427 () Bool)

(assert (=> d!7839 (= c!5427 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7839 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1579 lt!18338)))))

(assert (=> d!7839 (= (arrayCountValidKeys!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18392)))

(assert (= (and d!7839 c!5427) b!42958))

(assert (= (and d!7839 (not c!5427)) b!42960))

(assert (= (and b!42960 c!5428) b!42959))

(assert (= (and b!42960 (not c!5428)) b!42961))

(assert (= (or b!42959 b!42961) bm!3394))

(declare-fun m!36869 () Bool)

(assert (=> bm!3394 m!36869))

(declare-fun m!36871 () Bool)

(assert (=> b!42960 m!36871))

(assert (=> b!42960 m!36871))

(declare-fun m!36873 () Bool)

(assert (=> b!42960 m!36873))

(assert (=> b!42908 d!7839))

(declare-fun b!42983 () Bool)

(declare-fun e!27236 () Bool)

(declare-fun e!27234 () Bool)

(assert (=> b!42983 (= e!27236 e!27234)))

(declare-fun lt!18414 () (_ BitVec 64))

(assert (=> b!42983 (= lt!18414 (select (arr!1394 lt!18338) #b00000000000000000000000000000000))))

(declare-fun lt!18416 () Unit!1204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2901 (_ BitVec 64) (_ BitVec 32)) Unit!1204)

(assert (=> b!42983 (= lt!18416 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18338 lt!18414 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42983 (arrayContainsKey!0 lt!18338 lt!18414 #b00000000000000000000000000000000)))

(declare-fun lt!18415 () Unit!1204)

(assert (=> b!42983 (= lt!18415 lt!18416)))

(declare-fun res!25558 () Bool)

(declare-datatypes ((SeekEntryResult!200 0))(
  ( (MissingZero!200 (index!2922 (_ BitVec 32))) (Found!200 (index!2923 (_ BitVec 32))) (Intermediate!200 (undefined!1012 Bool) (index!2924 (_ BitVec 32)) (x!8288 (_ BitVec 32))) (Undefined!200) (MissingVacant!200 (index!2925 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2901 (_ BitVec 32)) SeekEntryResult!200)

(assert (=> b!42983 (= res!25558 (= (seekEntryOrOpen!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) lt!18338 mask!853) (Found!200 #b00000000000000000000000000000000)))))

(assert (=> b!42983 (=> (not res!25558) (not e!27234))))

(declare-fun b!42985 () Bool)

(declare-fun e!27235 () Bool)

(assert (=> b!42985 (= e!27235 e!27236)))

(declare-fun c!5435 () Bool)

(assert (=> b!42985 (= c!5435 (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun bm!3398 () Bool)

(declare-fun call!3401 () Bool)

(assert (=> bm!3398 (= call!3401 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18338 mask!853))))

(declare-fun b!42986 () Bool)

(assert (=> b!42986 (= e!27236 call!3401)))

(declare-fun d!7843 () Bool)

(declare-fun res!25557 () Bool)

(assert (=> d!7843 (=> res!25557 e!27235)))

(assert (=> d!7843 (= res!25557 (bvsge #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(assert (=> d!7843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18338 mask!853) e!27235)))

(declare-fun b!42984 () Bool)

(assert (=> b!42984 (= e!27234 call!3401)))

(assert (= (and d!7843 (not res!25557)) b!42985))

(assert (= (and b!42985 c!5435) b!42983))

(assert (= (and b!42985 (not c!5435)) b!42986))

(assert (= (and b!42983 res!25558) b!42984))

(assert (= (or b!42984 b!42986) bm!3398))

(assert (=> b!42983 m!36871))

(declare-fun m!36895 () Bool)

(assert (=> b!42983 m!36895))

(declare-fun m!36897 () Bool)

(assert (=> b!42983 m!36897))

(assert (=> b!42983 m!36871))

(declare-fun m!36899 () Bool)

(assert (=> b!42983 m!36899))

(assert (=> b!42985 m!36871))

(assert (=> b!42985 m!36871))

(assert (=> b!42985 m!36873))

(declare-fun m!36901 () Bool)

(assert (=> bm!3398 m!36901))

(assert (=> b!42908 d!7843))

(declare-fun d!7849 () Bool)

(assert (=> d!7849 (= (map!833 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (getCurrentListMap!339 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (mask!5429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))

(declare-fun bs!1928 () Bool)

(assert (= bs!1928 d!7849))

(declare-fun m!36907 () Bool)

(assert (=> bs!1928 m!36907))

(assert (=> b!42908 d!7849))

(declare-fun d!7855 () Bool)

(assert (=> d!7855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18338 mask!853)))

(declare-fun lt!18422 () Unit!1204)

(declare-fun choose!34 (array!2901 (_ BitVec 32) (_ BitVec 32)) Unit!1204)

(assert (=> d!7855 (= lt!18422 (choose!34 lt!18338 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7855 (validMask!0 mask!853)))

(assert (=> d!7855 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18338 mask!853 #b00000000000000000000000000000000) lt!18422)))

(declare-fun bs!1929 () Bool)

(assert (= bs!1929 d!7855))

(assert (=> bs!1929 m!36801))

(declare-fun m!36909 () Bool)

(assert (=> bs!1929 m!36909))

(assert (=> bs!1929 m!36815))

(assert (=> b!42908 d!7855))

(declare-fun d!7857 () Bool)

(assert (=> d!7857 (= (arrayCountValidKeys!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18425 () Unit!1204)

(declare-fun choose!59 (array!2901 (_ BitVec 32) (_ BitVec 32)) Unit!1204)

(assert (=> d!7857 (= lt!18425 (choose!59 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7857 (bvslt (size!1579 lt!18338) #b01111111111111111111111111111111)))

(assert (=> d!7857 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18425)))

(declare-fun bs!1930 () Bool)

(assert (= bs!1930 d!7857))

(assert (=> bs!1930 m!36811))

(declare-fun m!36915 () Bool)

(assert (=> bs!1930 m!36915))

(assert (=> b!42908 d!7857))

(declare-fun d!7861 () Bool)

(assert (=> d!7861 (arrayNoDuplicates!0 lt!18338 #b00000000000000000000000000000000 Nil!1187)))

(declare-fun lt!18431 () Unit!1204)

(declare-fun choose!111 (array!2901 (_ BitVec 32) (_ BitVec 32) List!1190) Unit!1204)

(assert (=> d!7861 (= lt!18431 (choose!111 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1187))))

(assert (=> d!7861 (= (size!1579 lt!18338) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7861 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1187) lt!18431)))

(declare-fun bs!1932 () Bool)

(assert (= bs!1932 d!7861))

(assert (=> bs!1932 m!36803))

(declare-fun m!36919 () Bool)

(assert (=> bs!1932 m!36919))

(assert (=> b!42908 d!7861))

(declare-fun d!7865 () Bool)

(declare-fun res!25574 () Bool)

(declare-fun e!27263 () Bool)

(assert (=> d!7865 (=> res!25574 e!27263)))

(assert (=> d!7865 (= res!25574 (bvsge #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(assert (=> d!7865 (= (arrayNoDuplicates!0 lt!18338 #b00000000000000000000000000000000 Nil!1187) e!27263)))

(declare-fun b!43024 () Bool)

(declare-fun e!27265 () Bool)

(declare-fun contains!564 (List!1190 (_ BitVec 64)) Bool)

(assert (=> b!43024 (= e!27265 (contains!564 Nil!1187 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!43025 () Bool)

(declare-fun e!27266 () Bool)

(declare-fun call!3410 () Bool)

(assert (=> b!43025 (= e!27266 call!3410)))

(declare-fun b!43026 () Bool)

(assert (=> b!43026 (= e!27266 call!3410)))

(declare-fun b!43027 () Bool)

(declare-fun e!27264 () Bool)

(assert (=> b!43027 (= e!27263 e!27264)))

(declare-fun res!25575 () Bool)

(assert (=> b!43027 (=> (not res!25575) (not e!27264))))

(assert (=> b!43027 (= res!25575 (not e!27265))))

(declare-fun res!25576 () Bool)

(assert (=> b!43027 (=> (not res!25576) (not e!27265))))

(assert (=> b!43027 (= res!25576 (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!43028 () Bool)

(assert (=> b!43028 (= e!27264 e!27266)))

(declare-fun c!5447 () Bool)

(assert (=> b!43028 (= c!5447 (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun bm!3407 () Bool)

(assert (=> bm!3407 (= call!3410 (arrayNoDuplicates!0 lt!18338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5447 (Cons!1186 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) Nil!1187) Nil!1187)))))

(assert (= (and d!7865 (not res!25574)) b!43027))

(assert (= (and b!43027 res!25576) b!43024))

(assert (= (and b!43027 res!25575) b!43028))

(assert (= (and b!43028 c!5447) b!43026))

(assert (= (and b!43028 (not c!5447)) b!43025))

(assert (= (or b!43026 b!43025) bm!3407))

(assert (=> b!43024 m!36871))

(assert (=> b!43024 m!36871))

(declare-fun m!36925 () Bool)

(assert (=> b!43024 m!36925))

(assert (=> b!43027 m!36871))

(assert (=> b!43027 m!36871))

(assert (=> b!43027 m!36873))

(assert (=> b!43028 m!36871))

(assert (=> b!43028 m!36871))

(assert (=> b!43028 m!36873))

(assert (=> bm!3407 m!36871))

(declare-fun m!36927 () Bool)

(assert (=> bm!3407 m!36927))

(assert (=> b!42908 d!7865))

(declare-fun d!7873 () Bool)

(get-info :version)

(assert (=> d!7873 (= (isEmpty!279 (toList!611 lt!18340)) ((_ is Nil!1186) (toList!611 lt!18340)))))

(assert (=> b!42909 d!7873))

(declare-fun d!7875 () Bool)

(assert (=> d!7875 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6460 d!7875))

(declare-fun d!7879 () Bool)

(declare-fun e!27278 () Bool)

(assert (=> d!7879 e!27278))

(declare-fun res!25582 () Bool)

(assert (=> d!7879 (=> res!25582 e!27278)))

(declare-fun lt!18461 () Bool)

(assert (=> d!7879 (= res!25582 (not lt!18461))))

(declare-fun lt!18460 () Bool)

(assert (=> d!7879 (= lt!18461 lt!18460)))

(declare-fun lt!18458 () Unit!1204)

(declare-fun e!27277 () Unit!1204)

(assert (=> d!7879 (= lt!18458 e!27277)))

(declare-fun c!5453 () Bool)

(assert (=> d!7879 (= c!5453 lt!18460)))

(declare-fun containsKey!72 (List!1189 (_ BitVec 64)) Bool)

(assert (=> d!7879 (= lt!18460 (containsKey!72 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))))))

(assert (=> d!7879 (= (contains!560 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470) (_1!824 (head!887 (toList!611 lt!18340)))) lt!18461)))

(declare-fun b!43044 () Bool)

(declare-fun lt!18459 () Unit!1204)

(assert (=> b!43044 (= e!27277 lt!18459)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!60 (List!1189 (_ BitVec 64)) Unit!1204)

(assert (=> b!43044 (= lt!18459 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))))))

(declare-datatypes ((Option!109 0))(
  ( (Some!108 (v!2076 V!2309)) (None!107) )
))
(declare-fun isDefined!61 (Option!109) Bool)

(declare-fun getValueByKey!103 (List!1189 (_ BitVec 64)) Option!109)

(assert (=> b!43044 (isDefined!61 (getValueByKey!103 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))))))

(declare-fun b!43045 () Bool)

(declare-fun Unit!1212 () Unit!1204)

(assert (=> b!43045 (= e!27277 Unit!1212)))

(declare-fun b!43046 () Bool)

(assert (=> b!43046 (= e!27278 (isDefined!61 (getValueByKey!103 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340))))))))

(assert (= (and d!7879 c!5453) b!43044))

(assert (= (and d!7879 (not c!5453)) b!43045))

(assert (= (and d!7879 (not res!25582)) b!43046))

(declare-fun m!36937 () Bool)

(assert (=> d!7879 m!36937))

(declare-fun m!36939 () Bool)

(assert (=> b!43044 m!36939))

(declare-fun m!36941 () Bool)

(assert (=> b!43044 m!36941))

(assert (=> b!43044 m!36941))

(declare-fun m!36943 () Bool)

(assert (=> b!43044 m!36943))

(assert (=> b!43046 m!36941))

(assert (=> b!43046 m!36941))

(assert (=> b!43046 m!36943))

(assert (=> b!42911 d!7879))

(declare-fun bm!3473 () Bool)

(declare-fun call!3482 () Bool)

(declare-fun lt!18660 () ListLongMap!1191)

(assert (=> bm!3473 (= call!3482 (contains!560 lt!18660 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43254 () Bool)

(declare-fun e!27414 () Unit!1204)

(declare-fun lt!18669 () Unit!1204)

(assert (=> b!43254 (= e!27414 lt!18669)))

(declare-fun lt!18672 () ListLongMap!1191)

(declare-fun getCurrentListMapNoExtraKeys!37 (array!2901 array!2903 (_ BitVec 32) (_ BitVec 32) V!2309 V!2309 (_ BitVec 32) Int) ListLongMap!1191)

(assert (=> b!43254 (= lt!18672 (getCurrentListMapNoExtraKeys!37 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18667 () (_ BitVec 64))

(assert (=> b!43254 (= lt!18667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18659 () (_ BitVec 64))

(assert (=> b!43254 (= lt!18659 (select (arr!1394 lt!18338) #b00000000000000000000000000000000))))

(declare-fun lt!18673 () Unit!1204)

(declare-fun addStillContains!35 (ListLongMap!1191 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1204)

(assert (=> b!43254 (= lt!18673 (addStillContains!35 lt!18672 lt!18667 lt!18335 lt!18659))))

(declare-fun +!68 (ListLongMap!1191 tuple2!1626) ListLongMap!1191)

(assert (=> b!43254 (contains!560 (+!68 lt!18672 (tuple2!1627 lt!18667 lt!18335)) lt!18659)))

(declare-fun lt!18671 () Unit!1204)

(assert (=> b!43254 (= lt!18671 lt!18673)))

(declare-fun lt!18665 () ListLongMap!1191)

(assert (=> b!43254 (= lt!18665 (getCurrentListMapNoExtraKeys!37 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18670 () (_ BitVec 64))

(assert (=> b!43254 (= lt!18670 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18663 () (_ BitVec 64))

(assert (=> b!43254 (= lt!18663 (select (arr!1394 lt!18338) #b00000000000000000000000000000000))))

(declare-fun lt!18662 () Unit!1204)

(declare-fun addApplyDifferent!35 (ListLongMap!1191 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1204)

(assert (=> b!43254 (= lt!18662 (addApplyDifferent!35 lt!18665 lt!18670 lt!18335 lt!18663))))

(declare-fun apply!59 (ListLongMap!1191 (_ BitVec 64)) V!2309)

(assert (=> b!43254 (= (apply!59 (+!68 lt!18665 (tuple2!1627 lt!18670 lt!18335)) lt!18663) (apply!59 lt!18665 lt!18663))))

(declare-fun lt!18666 () Unit!1204)

(assert (=> b!43254 (= lt!18666 lt!18662)))

(declare-fun lt!18668 () ListLongMap!1191)

(assert (=> b!43254 (= lt!18668 (getCurrentListMapNoExtraKeys!37 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18679 () (_ BitVec 64))

(assert (=> b!43254 (= lt!18679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18678 () (_ BitVec 64))

(assert (=> b!43254 (= lt!18678 (select (arr!1394 lt!18338) #b00000000000000000000000000000000))))

(declare-fun lt!18664 () Unit!1204)

(assert (=> b!43254 (= lt!18664 (addApplyDifferent!35 lt!18668 lt!18679 lt!18335 lt!18678))))

(assert (=> b!43254 (= (apply!59 (+!68 lt!18668 (tuple2!1627 lt!18679 lt!18335)) lt!18678) (apply!59 lt!18668 lt!18678))))

(declare-fun lt!18676 () Unit!1204)

(assert (=> b!43254 (= lt!18676 lt!18664)))

(declare-fun lt!18675 () ListLongMap!1191)

(assert (=> b!43254 (= lt!18675 (getCurrentListMapNoExtraKeys!37 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18661 () (_ BitVec 64))

(assert (=> b!43254 (= lt!18661 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18680 () (_ BitVec 64))

(assert (=> b!43254 (= lt!18680 (select (arr!1394 lt!18338) #b00000000000000000000000000000000))))

(assert (=> b!43254 (= lt!18669 (addApplyDifferent!35 lt!18675 lt!18661 lt!18335 lt!18680))))

(assert (=> b!43254 (= (apply!59 (+!68 lt!18675 (tuple2!1627 lt!18661 lt!18335)) lt!18680) (apply!59 lt!18675 lt!18680))))

(declare-fun b!43255 () Bool)

(declare-fun e!27415 () ListLongMap!1191)

(declare-fun call!3477 () ListLongMap!1191)

(assert (=> b!43255 (= e!27415 call!3477)))

(declare-fun d!7883 () Bool)

(declare-fun e!27411 () Bool)

(assert (=> d!7883 e!27411))

(declare-fun res!25678 () Bool)

(assert (=> d!7883 (=> (not res!25678) (not e!27411))))

(assert (=> d!7883 (= res!25678 (or (bvsge #b00000000000000000000000000000000 (size!1579 lt!18338)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))))

(declare-fun lt!18677 () ListLongMap!1191)

(assert (=> d!7883 (= lt!18660 lt!18677)))

(declare-fun lt!18674 () Unit!1204)

(assert (=> d!7883 (= lt!18674 e!27414)))

(declare-fun c!5517 () Bool)

(declare-fun e!27421 () Bool)

(assert (=> d!7883 (= c!5517 e!27421)))

(declare-fun res!25672 () Bool)

(assert (=> d!7883 (=> (not res!25672) (not e!27421))))

(assert (=> d!7883 (= res!25672 (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(declare-fun e!27419 () ListLongMap!1191)

(assert (=> d!7883 (= lt!18677 e!27419)))

(declare-fun c!5514 () Bool)

(assert (=> d!7883 (= c!5514 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7883 (validMask!0 mask!853)))

(assert (=> d!7883 (= (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470) lt!18660)))

(declare-fun bm!3474 () Bool)

(declare-fun call!3478 () ListLongMap!1191)

(declare-fun call!3481 () ListLongMap!1191)

(assert (=> bm!3474 (= call!3478 call!3481)))

(declare-fun bm!3475 () Bool)

(assert (=> bm!3475 (= call!3481 (getCurrentListMapNoExtraKeys!37 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun bm!3476 () Bool)

(declare-fun call!3476 () ListLongMap!1191)

(assert (=> bm!3476 (= call!3476 call!3478)))

(declare-fun b!43256 () Bool)

(declare-fun e!27416 () Bool)

(declare-fun get!787 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43256 (= e!27416 (= (apply!59 lt!18660 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)) (get!787 (select (arr!1395 lt!18341) #b00000000000000000000000000000000) (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1580 lt!18341)))))

(assert (=> b!43256 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(declare-fun b!43257 () Bool)

(declare-fun e!27418 () Bool)

(declare-fun call!3480 () Bool)

(assert (=> b!43257 (= e!27418 (not call!3480))))

(declare-fun b!43258 () Bool)

(declare-fun res!25675 () Bool)

(assert (=> b!43258 (=> (not res!25675) (not e!27411))))

(declare-fun e!27420 () Bool)

(assert (=> b!43258 (= res!25675 e!27420)))

(declare-fun res!25677 () Bool)

(assert (=> b!43258 (=> res!25677 e!27420)))

(declare-fun e!27412 () Bool)

(assert (=> b!43258 (= res!25677 (not e!27412))))

(declare-fun res!25671 () Bool)

(assert (=> b!43258 (=> (not res!25671) (not e!27412))))

(assert (=> b!43258 (= res!25671 (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(declare-fun b!43259 () Bool)

(declare-fun c!5518 () Bool)

(assert (=> b!43259 (= c!5518 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!27422 () ListLongMap!1191)

(assert (=> b!43259 (= e!27415 e!27422)))

(declare-fun b!43260 () Bool)

(assert (=> b!43260 (= e!27422 call!3476)))

(declare-fun b!43261 () Bool)

(assert (=> b!43261 (= e!27419 e!27415)))

(declare-fun c!5519 () Bool)

(assert (=> b!43261 (= c!5519 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43262 () Bool)

(declare-fun call!3479 () ListLongMap!1191)

(assert (=> b!43262 (= e!27419 (+!68 call!3479 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))))

(declare-fun b!43263 () Bool)

(declare-fun e!27410 () Bool)

(assert (=> b!43263 (= e!27410 (= (apply!59 lt!18660 #b1000000000000000000000000000000000000000000000000000000000000000) lt!18335))))

(declare-fun b!43264 () Bool)

(assert (=> b!43264 (= e!27422 call!3477)))

(declare-fun b!43265 () Bool)

(assert (=> b!43265 (= e!27421 (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!43266 () Bool)

(declare-fun e!27417 () Bool)

(assert (=> b!43266 (= e!27417 e!27410)))

(declare-fun res!25676 () Bool)

(assert (=> b!43266 (= res!25676 call!3482)))

(assert (=> b!43266 (=> (not res!25676) (not e!27410))))

(declare-fun bm!3477 () Bool)

(assert (=> bm!3477 (= call!3477 call!3479)))

(declare-fun b!43267 () Bool)

(assert (=> b!43267 (= e!27411 e!27417)))

(declare-fun c!5515 () Bool)

(assert (=> b!43267 (= c!5515 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43268 () Bool)

(assert (=> b!43268 (= e!27417 (not call!3482))))

(declare-fun b!43269 () Bool)

(declare-fun Unit!1215 () Unit!1204)

(assert (=> b!43269 (= e!27414 Unit!1215)))

(declare-fun b!43270 () Bool)

(assert (=> b!43270 (= e!27412 (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!43271 () Bool)

(assert (=> b!43271 (= e!27420 e!27416)))

(declare-fun res!25673 () Bool)

(assert (=> b!43271 (=> (not res!25673) (not e!27416))))

(assert (=> b!43271 (= res!25673 (contains!560 lt!18660 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(assert (=> b!43271 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(declare-fun b!43272 () Bool)

(declare-fun e!27413 () Bool)

(assert (=> b!43272 (= e!27413 (= (apply!59 lt!18660 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18335))))

(declare-fun bm!3478 () Bool)

(assert (=> bm!3478 (= call!3479 (+!68 (ite c!5514 call!3481 (ite c!5519 call!3478 call!3476)) (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))))))

(declare-fun bm!3479 () Bool)

(assert (=> bm!3479 (= call!3480 (contains!560 lt!18660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43273 () Bool)

(declare-fun res!25670 () Bool)

(assert (=> b!43273 (=> (not res!25670) (not e!27411))))

(assert (=> b!43273 (= res!25670 e!27418)))

(declare-fun c!5516 () Bool)

(assert (=> b!43273 (= c!5516 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!43274 () Bool)

(assert (=> b!43274 (= e!27418 e!27413)))

(declare-fun res!25674 () Bool)

(assert (=> b!43274 (= res!25674 call!3480)))

(assert (=> b!43274 (=> (not res!25674) (not e!27413))))

(assert (= (and d!7883 c!5514) b!43262))

(assert (= (and d!7883 (not c!5514)) b!43261))

(assert (= (and b!43261 c!5519) b!43255))

(assert (= (and b!43261 (not c!5519)) b!43259))

(assert (= (and b!43259 c!5518) b!43264))

(assert (= (and b!43259 (not c!5518)) b!43260))

(assert (= (or b!43264 b!43260) bm!3476))

(assert (= (or b!43255 bm!3476) bm!3474))

(assert (= (or b!43255 b!43264) bm!3477))

(assert (= (or b!43262 bm!3474) bm!3475))

(assert (= (or b!43262 bm!3477) bm!3478))

(assert (= (and d!7883 res!25672) b!43265))

(assert (= (and d!7883 c!5517) b!43254))

(assert (= (and d!7883 (not c!5517)) b!43269))

(assert (= (and d!7883 res!25678) b!43258))

(assert (= (and b!43258 res!25671) b!43270))

(assert (= (and b!43258 (not res!25677)) b!43271))

(assert (= (and b!43271 res!25673) b!43256))

(assert (= (and b!43258 res!25675) b!43273))

(assert (= (and b!43273 c!5516) b!43274))

(assert (= (and b!43273 (not c!5516)) b!43257))

(assert (= (and b!43274 res!25674) b!43272))

(assert (= (or b!43274 b!43257) bm!3479))

(assert (= (and b!43273 res!25670) b!43267))

(assert (= (and b!43267 c!5515) b!43266))

(assert (= (and b!43267 (not c!5515)) b!43268))

(assert (= (and b!43266 res!25676) b!43263))

(assert (= (or b!43266 b!43268) bm!3473))

(declare-fun b_lambda!2267 () Bool)

(assert (=> (not b_lambda!2267) (not b!43256)))

(assert (=> b!43256 t!4184))

(declare-fun b_and!2669 () Bool)

(assert (= b_and!2655 (and (=> t!4184 result!1717) b_and!2669)))

(declare-fun m!37075 () Bool)

(assert (=> bm!3473 m!37075))

(assert (=> d!7883 m!36815))

(declare-fun m!37077 () Bool)

(assert (=> bm!3478 m!37077))

(declare-fun m!37079 () Bool)

(assert (=> bm!3475 m!37079))

(declare-fun m!37081 () Bool)

(assert (=> b!43254 m!37081))

(declare-fun m!37083 () Bool)

(assert (=> b!43254 m!37083))

(assert (=> b!43254 m!37079))

(declare-fun m!37085 () Bool)

(assert (=> b!43254 m!37085))

(declare-fun m!37087 () Bool)

(assert (=> b!43254 m!37087))

(declare-fun m!37089 () Bool)

(assert (=> b!43254 m!37089))

(assert (=> b!43254 m!36871))

(declare-fun m!37091 () Bool)

(assert (=> b!43254 m!37091))

(declare-fun m!37093 () Bool)

(assert (=> b!43254 m!37093))

(declare-fun m!37095 () Bool)

(assert (=> b!43254 m!37095))

(declare-fun m!37097 () Bool)

(assert (=> b!43254 m!37097))

(declare-fun m!37099 () Bool)

(assert (=> b!43254 m!37099))

(declare-fun m!37101 () Bool)

(assert (=> b!43254 m!37101))

(declare-fun m!37103 () Bool)

(assert (=> b!43254 m!37103))

(declare-fun m!37105 () Bool)

(assert (=> b!43254 m!37105))

(assert (=> b!43254 m!37103))

(declare-fun m!37107 () Bool)

(assert (=> b!43254 m!37107))

(assert (=> b!43254 m!37099))

(assert (=> b!43254 m!37105))

(declare-fun m!37109 () Bool)

(assert (=> b!43254 m!37109))

(assert (=> b!43254 m!37085))

(assert (=> b!43270 m!36871))

(assert (=> b!43270 m!36871))

(assert (=> b!43270 m!36873))

(assert (=> b!43265 m!36871))

(assert (=> b!43265 m!36871))

(assert (=> b!43265 m!36873))

(assert (=> b!43271 m!36871))

(assert (=> b!43271 m!36871))

(declare-fun m!37111 () Bool)

(assert (=> b!43271 m!37111))

(declare-fun m!37113 () Bool)

(assert (=> bm!3479 m!37113))

(declare-fun m!37115 () Bool)

(assert (=> b!43263 m!37115))

(declare-fun m!37117 () Bool)

(assert (=> b!43272 m!37117))

(declare-fun m!37119 () Bool)

(assert (=> b!43256 m!37119))

(assert (=> b!43256 m!36871))

(declare-fun m!37121 () Bool)

(assert (=> b!43256 m!37121))

(assert (=> b!43256 m!36805))

(assert (=> b!43256 m!37119))

(assert (=> b!43256 m!36805))

(declare-fun m!37123 () Bool)

(assert (=> b!43256 m!37123))

(assert (=> b!43256 m!36871))

(declare-fun m!37125 () Bool)

(assert (=> b!43262 m!37125))

(assert (=> b!42911 d!7883))

(declare-fun d!7905 () Bool)

(assert (=> d!7905 (= (head!887 (toList!611 lt!18340)) (h!1762 (toList!611 lt!18340)))))

(assert (=> b!42911 d!7905))

(declare-fun b_lambda!2269 () Bool)

(assert (= b_lambda!2267 (or (and start!6460 b_free!1501) b_lambda!2269)))

(check-sat (not b!43263) (not b!43265) (not b!43262) (not bm!3478) (not b!43256) (not b_lambda!2257) (not d!7849) (not bm!3475) (not b!43270) (not d!7855) (not b!43027) (not bm!3473) (not d!7879) (not b!43271) (not bm!3407) (not b!42985) (not b!43024) (not d!7857) (not b!43044) (not b!43046) (not b_lambda!2269) (not b_next!1501) (not b!42983) (not b!43028) (not d!7883) (not b!43272) (not bm!3394) (not bm!3398) tp_is_empty!1891 (not bm!3479) b_and!2669 (not b!42960) (not b!43254) (not d!7861))
(check-sat b_and!2669 (not b_next!1501))
(get-model)

(declare-fun d!7907 () Bool)

(declare-fun get!788 (Option!109) V!2309)

(assert (=> d!7907 (= (apply!59 lt!18660 #b1000000000000000000000000000000000000000000000000000000000000000) (get!788 (getValueByKey!103 (toList!611 lt!18660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1939 () Bool)

(assert (= bs!1939 d!7907))

(declare-fun m!37127 () Bool)

(assert (=> bs!1939 m!37127))

(assert (=> bs!1939 m!37127))

(declare-fun m!37129 () Bool)

(assert (=> bs!1939 m!37129))

(assert (=> b!43263 d!7907))

(declare-fun d!7909 () Bool)

(declare-fun e!27425 () Bool)

(assert (=> d!7909 e!27425))

(declare-fun res!25684 () Bool)

(assert (=> d!7909 (=> (not res!25684) (not e!27425))))

(declare-fun lt!18690 () ListLongMap!1191)

(assert (=> d!7909 (= res!25684 (contains!560 lt!18690 (_1!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))))))

(declare-fun lt!18689 () List!1189)

(assert (=> d!7909 (= lt!18690 (ListLongMap!1192 lt!18689))))

(declare-fun lt!18691 () Unit!1204)

(declare-fun lt!18692 () Unit!1204)

(assert (=> d!7909 (= lt!18691 lt!18692)))

(assert (=> d!7909 (= (getValueByKey!103 lt!18689 (_1!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))) (Some!108 (_2!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))))))

(declare-fun lemmaContainsTupThenGetReturnValue!29 (List!1189 (_ BitVec 64) V!2309) Unit!1204)

(assert (=> d!7909 (= lt!18692 (lemmaContainsTupThenGetReturnValue!29 lt!18689 (_1!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)) (_2!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))))))

(declare-fun insertStrictlySorted!26 (List!1189 (_ BitVec 64) V!2309) List!1189)

(assert (=> d!7909 (= lt!18689 (insertStrictlySorted!26 (toList!611 call!3479) (_1!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)) (_2!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))))))

(assert (=> d!7909 (= (+!68 call!3479 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)) lt!18690)))

(declare-fun b!43279 () Bool)

(declare-fun res!25683 () Bool)

(assert (=> b!43279 (=> (not res!25683) (not e!27425))))

(assert (=> b!43279 (= res!25683 (= (getValueByKey!103 (toList!611 lt!18690) (_1!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))) (Some!108 (_2!824 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))))))

(declare-fun b!43280 () Bool)

(declare-fun contains!566 (List!1189 tuple2!1626) Bool)

(assert (=> b!43280 (= e!27425 (contains!566 (toList!611 lt!18690) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))))

(assert (= (and d!7909 res!25684) b!43279))

(assert (= (and b!43279 res!25683) b!43280))

(declare-fun m!37131 () Bool)

(assert (=> d!7909 m!37131))

(declare-fun m!37133 () Bool)

(assert (=> d!7909 m!37133))

(declare-fun m!37135 () Bool)

(assert (=> d!7909 m!37135))

(declare-fun m!37137 () Bool)

(assert (=> d!7909 m!37137))

(declare-fun m!37139 () Bool)

(assert (=> b!43279 m!37139))

(declare-fun m!37141 () Bool)

(assert (=> b!43280 m!37141))

(assert (=> b!43262 d!7909))

(assert (=> d!7857 d!7839))

(declare-fun d!7913 () Bool)

(assert (=> d!7913 (= (arrayCountValidKeys!0 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!7913 true))

(declare-fun _$88!46 () Unit!1204)

(assert (=> d!7913 (= (choose!59 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!46)))

(declare-fun bs!1940 () Bool)

(assert (= bs!1940 d!7913))

(assert (=> bs!1940 m!36811))

(assert (=> d!7857 d!7913))

(declare-fun d!7917 () Bool)

(declare-fun lt!18695 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!40 (List!1190) (InoxSet (_ BitVec 64)))

(assert (=> d!7917 (= lt!18695 (select (content!40 Nil!1187) (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun e!27433 () Bool)

(assert (=> d!7917 (= lt!18695 e!27433)))

(declare-fun res!25689 () Bool)

(assert (=> d!7917 (=> (not res!25689) (not e!27433))))

(assert (=> d!7917 (= res!25689 ((_ is Cons!1186) Nil!1187))))

(assert (=> d!7917 (= (contains!564 Nil!1187 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)) lt!18695)))

(declare-fun b!43289 () Bool)

(declare-fun e!27432 () Bool)

(assert (=> b!43289 (= e!27433 e!27432)))

(declare-fun res!25690 () Bool)

(assert (=> b!43289 (=> res!25690 e!27432)))

(assert (=> b!43289 (= res!25690 (= (h!1763 Nil!1187) (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!43290 () Bool)

(assert (=> b!43290 (= e!27432 (contains!564 (t!4186 Nil!1187) (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(assert (= (and d!7917 res!25689) b!43289))

(assert (= (and b!43289 (not res!25690)) b!43290))

(declare-fun m!37147 () Bool)

(assert (=> d!7917 m!37147))

(assert (=> d!7917 m!36871))

(declare-fun m!37149 () Bool)

(assert (=> d!7917 m!37149))

(assert (=> b!43290 m!36871))

(declare-fun m!37151 () Bool)

(assert (=> b!43290 m!37151))

(assert (=> b!43024 d!7917))

(assert (=> d!7883 d!7875))

(declare-fun bm!3480 () Bool)

(declare-fun call!3483 () (_ BitVec 32))

(assert (=> bm!3480 (= call!3483 (arrayCountValidKeys!0 lt!18338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!43293 () Bool)

(declare-fun e!27435 () (_ BitVec 32))

(assert (=> b!43293 (= e!27435 #b00000000000000000000000000000000)))

(declare-fun b!43294 () Bool)

(declare-fun e!27436 () (_ BitVec 32))

(assert (=> b!43294 (= e!27436 (bvadd #b00000000000000000000000000000001 call!3483))))

(declare-fun b!43295 () Bool)

(assert (=> b!43295 (= e!27435 e!27436)))

(declare-fun c!5524 () Bool)

(assert (=> b!43295 (= c!5524 (validKeyInArray!0 (select (arr!1394 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43296 () Bool)

(assert (=> b!43296 (= e!27436 call!3483)))

(declare-fun d!7921 () Bool)

(declare-fun lt!18696 () (_ BitVec 32))

(assert (=> d!7921 (and (bvsge lt!18696 #b00000000000000000000000000000000) (bvsle lt!18696 (bvsub (size!1579 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7921 (= lt!18696 e!27435)))

(declare-fun c!5523 () Bool)

(assert (=> d!7921 (= c!5523 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7921 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1579 lt!18338)))))

(assert (=> d!7921 (= (arrayCountValidKeys!0 lt!18338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!18696)))

(assert (= (and d!7921 c!5523) b!43293))

(assert (= (and d!7921 (not c!5523)) b!43295))

(assert (= (and b!43295 c!5524) b!43294))

(assert (= (and b!43295 (not c!5524)) b!43296))

(assert (= (or b!43294 b!43296) bm!3480))

(declare-fun m!37157 () Bool)

(assert (=> bm!3480 m!37157))

(declare-fun m!37159 () Bool)

(assert (=> b!43295 m!37159))

(assert (=> b!43295 m!37159))

(declare-fun m!37161 () Bool)

(assert (=> b!43295 m!37161))

(assert (=> bm!3394 d!7921))

(declare-fun bm!3481 () Bool)

(declare-fun call!3490 () Bool)

(declare-fun lt!18698 () ListLongMap!1191)

(assert (=> bm!3481 (= call!3490 (contains!560 lt!18698 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43297 () Bool)

(declare-fun e!27441 () Unit!1204)

(declare-fun lt!18707 () Unit!1204)

(assert (=> b!43297 (= e!27441 lt!18707)))

(declare-fun lt!18710 () ListLongMap!1191)

(assert (=> b!43297 (= lt!18710 (getCurrentListMapNoExtraKeys!37 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (mask!5429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))

(declare-fun lt!18705 () (_ BitVec 64))

(assert (=> b!43297 (= lt!18705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18697 () (_ BitVec 64))

(assert (=> b!43297 (= lt!18697 (select (arr!1394 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18711 () Unit!1204)

(assert (=> b!43297 (= lt!18711 (addStillContains!35 lt!18710 lt!18705 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) lt!18697))))

(assert (=> b!43297 (contains!560 (+!68 lt!18710 (tuple2!1627 lt!18705 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))) lt!18697)))

(declare-fun lt!18709 () Unit!1204)

(assert (=> b!43297 (= lt!18709 lt!18711)))

(declare-fun lt!18703 () ListLongMap!1191)

(assert (=> b!43297 (= lt!18703 (getCurrentListMapNoExtraKeys!37 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (mask!5429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))

(declare-fun lt!18708 () (_ BitVec 64))

(assert (=> b!43297 (= lt!18708 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18701 () (_ BitVec 64))

(assert (=> b!43297 (= lt!18701 (select (arr!1394 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18700 () Unit!1204)

(assert (=> b!43297 (= lt!18700 (addApplyDifferent!35 lt!18703 lt!18708 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) lt!18701))))

(assert (=> b!43297 (= (apply!59 (+!68 lt!18703 (tuple2!1627 lt!18708 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))) lt!18701) (apply!59 lt!18703 lt!18701))))

(declare-fun lt!18704 () Unit!1204)

(assert (=> b!43297 (= lt!18704 lt!18700)))

(declare-fun lt!18706 () ListLongMap!1191)

(assert (=> b!43297 (= lt!18706 (getCurrentListMapNoExtraKeys!37 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (mask!5429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))

(declare-fun lt!18717 () (_ BitVec 64))

(assert (=> b!43297 (= lt!18717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18716 () (_ BitVec 64))

(assert (=> b!43297 (= lt!18716 (select (arr!1394 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18702 () Unit!1204)

(assert (=> b!43297 (= lt!18702 (addApplyDifferent!35 lt!18706 lt!18717 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) lt!18716))))

(assert (=> b!43297 (= (apply!59 (+!68 lt!18706 (tuple2!1627 lt!18717 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))) lt!18716) (apply!59 lt!18706 lt!18716))))

(declare-fun lt!18714 () Unit!1204)

(assert (=> b!43297 (= lt!18714 lt!18702)))

(declare-fun lt!18713 () ListLongMap!1191)

(assert (=> b!43297 (= lt!18713 (getCurrentListMapNoExtraKeys!37 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (mask!5429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))

(declare-fun lt!18699 () (_ BitVec 64))

(assert (=> b!43297 (= lt!18699 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18718 () (_ BitVec 64))

(assert (=> b!43297 (= lt!18718 (select (arr!1394 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(assert (=> b!43297 (= lt!18707 (addApplyDifferent!35 lt!18713 lt!18699 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) lt!18718))))

(assert (=> b!43297 (= (apply!59 (+!68 lt!18713 (tuple2!1627 lt!18699 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))) lt!18718) (apply!59 lt!18713 lt!18718))))

(declare-fun b!43298 () Bool)

(declare-fun e!27442 () ListLongMap!1191)

(declare-fun call!3485 () ListLongMap!1191)

(assert (=> b!43298 (= e!27442 call!3485)))

(declare-fun d!7925 () Bool)

(declare-fun e!27438 () Bool)

(assert (=> d!7925 e!27438))

(declare-fun res!25699 () Bool)

(assert (=> d!7925 (=> (not res!25699) (not e!27438))))

(assert (=> d!7925 (= res!25699 (or (bvsge #b00000000000000000000000000000000 (size!1579 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1579 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))))))

(declare-fun lt!18715 () ListLongMap!1191)

(assert (=> d!7925 (= lt!18698 lt!18715)))

(declare-fun lt!18712 () Unit!1204)

(assert (=> d!7925 (= lt!18712 e!27441)))

(declare-fun c!5528 () Bool)

(declare-fun e!27448 () Bool)

(assert (=> d!7925 (= c!5528 e!27448)))

(declare-fun res!25693 () Bool)

(assert (=> d!7925 (=> (not res!25693) (not e!27448))))

(assert (=> d!7925 (= res!25693 (bvslt #b00000000000000000000000000000000 (size!1579 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))))

(declare-fun e!27446 () ListLongMap!1191)

(assert (=> d!7925 (= lt!18715 e!27446)))

(declare-fun c!5525 () Bool)

(assert (=> d!7925 (= c!5525 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7925 (validMask!0 (mask!5429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))

(assert (=> d!7925 (= (getCurrentListMap!339 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (mask!5429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) lt!18698)))

(declare-fun bm!3482 () Bool)

(declare-fun call!3486 () ListLongMap!1191)

(declare-fun call!3489 () ListLongMap!1191)

(assert (=> bm!3482 (= call!3486 call!3489)))

(declare-fun bm!3483 () Bool)

(assert (=> bm!3483 (= call!3489 (getCurrentListMapNoExtraKeys!37 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (mask!5429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))

(declare-fun bm!3484 () Bool)

(declare-fun call!3484 () ListLongMap!1191)

(assert (=> bm!3484 (= call!3484 call!3486)))

(declare-fun b!43299 () Bool)

(declare-fun e!27443 () Bool)

(assert (=> b!43299 (= e!27443 (= (apply!59 lt!18698 (select (arr!1394 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (get!787 (select (arr!1395 (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (dynLambda!258 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1580 (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))))

(assert (=> b!43299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1579 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))))

(declare-fun b!43300 () Bool)

(declare-fun e!27445 () Bool)

(declare-fun call!3488 () Bool)

(assert (=> b!43300 (= e!27445 (not call!3488))))

(declare-fun b!43301 () Bool)

(declare-fun res!25696 () Bool)

(assert (=> b!43301 (=> (not res!25696) (not e!27438))))

(declare-fun e!27447 () Bool)

(assert (=> b!43301 (= res!25696 e!27447)))

(declare-fun res!25698 () Bool)

(assert (=> b!43301 (=> res!25698 e!27447)))

(declare-fun e!27439 () Bool)

(assert (=> b!43301 (= res!25698 (not e!27439))))

(declare-fun res!25692 () Bool)

(assert (=> b!43301 (=> (not res!25692) (not e!27439))))

(assert (=> b!43301 (= res!25692 (bvslt #b00000000000000000000000000000000 (size!1579 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))))

(declare-fun c!5529 () Bool)

(declare-fun b!43302 () Bool)

(assert (=> b!43302 (= c!5529 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!27449 () ListLongMap!1191)

(assert (=> b!43302 (= e!27442 e!27449)))

(declare-fun b!43303 () Bool)

(assert (=> b!43303 (= e!27449 call!3484)))

(declare-fun b!43304 () Bool)

(assert (=> b!43304 (= e!27446 e!27442)))

(declare-fun c!5530 () Bool)

(assert (=> b!43304 (= c!5530 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43305 () Bool)

(declare-fun call!3487 () ListLongMap!1191)

(assert (=> b!43305 (= e!27446 (+!68 call!3487 (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))))

(declare-fun e!27437 () Bool)

(declare-fun b!43306 () Bool)

(assert (=> b!43306 (= e!27437 (= (apply!59 lt!18698 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))

(declare-fun b!43307 () Bool)

(assert (=> b!43307 (= e!27449 call!3485)))

(declare-fun b!43308 () Bool)

(assert (=> b!43308 (= e!27448 (validKeyInArray!0 (select (arr!1394 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!43309 () Bool)

(declare-fun e!27444 () Bool)

(assert (=> b!43309 (= e!27444 e!27437)))

(declare-fun res!25697 () Bool)

(assert (=> b!43309 (= res!25697 call!3490)))

(assert (=> b!43309 (=> (not res!25697) (not e!27437))))

(declare-fun bm!3485 () Bool)

(assert (=> bm!3485 (= call!3485 call!3487)))

(declare-fun b!43310 () Bool)

(assert (=> b!43310 (= e!27438 e!27444)))

(declare-fun c!5526 () Bool)

(assert (=> b!43310 (= c!5526 (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43311 () Bool)

(assert (=> b!43311 (= e!27444 (not call!3490))))

(declare-fun b!43312 () Bool)

(declare-fun Unit!1217 () Unit!1204)

(assert (=> b!43312 (= e!27441 Unit!1217)))

(declare-fun b!43313 () Bool)

(assert (=> b!43313 (= e!27439 (validKeyInArray!0 (select (arr!1394 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!43314 () Bool)

(assert (=> b!43314 (= e!27447 e!27443)))

(declare-fun res!25694 () Bool)

(assert (=> b!43314 (=> (not res!25694) (not e!27443))))

(assert (=> b!43314 (= res!25694 (contains!560 lt!18698 (select (arr!1394 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> b!43314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1579 (_keys!3429 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)))))))

(declare-fun e!27440 () Bool)

(declare-fun b!43315 () Bool)

(assert (=> b!43315 (= e!27440 (= (apply!59 lt!18698 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))

(declare-fun bm!3486 () Bool)

(assert (=> bm!3486 (= call!3487 (+!68 (ite c!5525 call!3489 (ite c!5530 call!3486 call!3484)) (ite (or c!5525 c!5530) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))))))))

(declare-fun bm!3487 () Bool)

(assert (=> bm!3487 (= call!3488 (contains!560 lt!18698 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43316 () Bool)

(declare-fun res!25691 () Bool)

(assert (=> b!43316 (=> (not res!25691) (not e!27438))))

(assert (=> b!43316 (= res!25691 e!27445)))

(declare-fun c!5527 () Bool)

(assert (=> b!43316 (= c!5527 (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!43317 () Bool)

(assert (=> b!43317 (= e!27445 e!27440)))

(declare-fun res!25695 () Bool)

(assert (=> b!43317 (= res!25695 call!3488)))

(assert (=> b!43317 (=> (not res!25695) (not e!27440))))

(assert (= (and d!7925 c!5525) b!43305))

(assert (= (and d!7925 (not c!5525)) b!43304))

(assert (= (and b!43304 c!5530) b!43298))

(assert (= (and b!43304 (not c!5530)) b!43302))

(assert (= (and b!43302 c!5529) b!43307))

(assert (= (and b!43302 (not c!5529)) b!43303))

(assert (= (or b!43307 b!43303) bm!3484))

(assert (= (or b!43298 bm!3484) bm!3482))

(assert (= (or b!43298 b!43307) bm!3485))

(assert (= (or b!43305 bm!3482) bm!3483))

(assert (= (or b!43305 bm!3485) bm!3486))

(assert (= (and d!7925 res!25693) b!43308))

(assert (= (and d!7925 c!5528) b!43297))

(assert (= (and d!7925 (not c!5528)) b!43312))

(assert (= (and d!7925 res!25699) b!43301))

(assert (= (and b!43301 res!25692) b!43313))

(assert (= (and b!43301 (not res!25698)) b!43314))

(assert (= (and b!43314 res!25694) b!43299))

(assert (= (and b!43301 res!25696) b!43316))

(assert (= (and b!43316 c!5527) b!43317))

(assert (= (and b!43316 (not c!5527)) b!43300))

(assert (= (and b!43317 res!25695) b!43315))

(assert (= (or b!43317 b!43300) bm!3487))

(assert (= (and b!43316 res!25691) b!43310))

(assert (= (and b!43310 c!5526) b!43309))

(assert (= (and b!43310 (not c!5526)) b!43311))

(assert (= (and b!43309 res!25697) b!43306))

(assert (= (or b!43309 b!43311) bm!3481))

(declare-fun b_lambda!2271 () Bool)

(assert (=> (not b_lambda!2271) (not b!43299)))

(declare-fun t!4196 () Bool)

(declare-fun tb!989 () Bool)

(assert (=> (and start!6460 (= defaultEntry!470 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 lt!18338 lt!18341 #b00000000000000000000000000000000))) t!4196) tb!989))

(declare-fun result!1729 () Bool)

(assert (=> tb!989 (= result!1729 tp_is_empty!1891)))

(assert (=> b!43299 t!4196))

(declare-fun b_and!2671 () Bool)

(assert (= b_and!2669 (and (=> t!4196 result!1729) b_and!2671)))

(declare-fun m!37163 () Bool)

(assert (=> bm!3481 m!37163))

(declare-fun m!37165 () Bool)

(assert (=> d!7925 m!37165))

(declare-fun m!37167 () Bool)

(assert (=> bm!3486 m!37167))

(declare-fun m!37169 () Bool)

(assert (=> bm!3483 m!37169))

(declare-fun m!37171 () Bool)

(assert (=> b!43297 m!37171))

(declare-fun m!37173 () Bool)

(assert (=> b!43297 m!37173))

(assert (=> b!43297 m!37169))

(declare-fun m!37175 () Bool)

(assert (=> b!43297 m!37175))

(declare-fun m!37177 () Bool)

(assert (=> b!43297 m!37177))

(declare-fun m!37179 () Bool)

(assert (=> b!43297 m!37179))

(declare-fun m!37181 () Bool)

(assert (=> b!43297 m!37181))

(declare-fun m!37183 () Bool)

(assert (=> b!43297 m!37183))

(declare-fun m!37185 () Bool)

(assert (=> b!43297 m!37185))

(declare-fun m!37187 () Bool)

(assert (=> b!43297 m!37187))

(declare-fun m!37189 () Bool)

(assert (=> b!43297 m!37189))

(declare-fun m!37191 () Bool)

(assert (=> b!43297 m!37191))

(declare-fun m!37193 () Bool)

(assert (=> b!43297 m!37193))

(declare-fun m!37195 () Bool)

(assert (=> b!43297 m!37195))

(declare-fun m!37197 () Bool)

(assert (=> b!43297 m!37197))

(assert (=> b!43297 m!37195))

(declare-fun m!37199 () Bool)

(assert (=> b!43297 m!37199))

(assert (=> b!43297 m!37191))

(assert (=> b!43297 m!37197))

(declare-fun m!37201 () Bool)

(assert (=> b!43297 m!37201))

(assert (=> b!43297 m!37175))

(assert (=> b!43313 m!37181))

(assert (=> b!43313 m!37181))

(declare-fun m!37203 () Bool)

(assert (=> b!43313 m!37203))

(assert (=> b!43308 m!37181))

(assert (=> b!43308 m!37181))

(assert (=> b!43308 m!37203))

(assert (=> b!43314 m!37181))

(assert (=> b!43314 m!37181))

(declare-fun m!37205 () Bool)

(assert (=> b!43314 m!37205))

(declare-fun m!37207 () Bool)

(assert (=> bm!3487 m!37207))

(declare-fun m!37209 () Bool)

(assert (=> b!43306 m!37209))

(declare-fun m!37211 () Bool)

(assert (=> b!43315 m!37211))

(declare-fun m!37213 () Bool)

(assert (=> b!43299 m!37213))

(assert (=> b!43299 m!37181))

(declare-fun m!37215 () Bool)

(assert (=> b!43299 m!37215))

(declare-fun m!37217 () Bool)

(assert (=> b!43299 m!37217))

(assert (=> b!43299 m!37213))

(assert (=> b!43299 m!37217))

(declare-fun m!37219 () Bool)

(assert (=> b!43299 m!37219))

(assert (=> b!43299 m!37181))

(declare-fun m!37221 () Bool)

(assert (=> b!43305 m!37221))

(assert (=> d!7849 d!7925))

(declare-fun d!7927 () Bool)

(assert (=> d!7927 (= (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)) (and (not (= (select (arr!1394 lt!18338) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1394 lt!18338) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43027 d!7927))

(declare-fun d!7929 () Bool)

(assert (=> d!7929 (= (apply!59 lt!18660 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)) (get!788 (getValueByKey!103 (toList!611 lt!18660) (select (arr!1394 lt!18338) #b00000000000000000000000000000000))))))

(declare-fun bs!1942 () Bool)

(assert (= bs!1942 d!7929))

(assert (=> bs!1942 m!36871))

(declare-fun m!37223 () Bool)

(assert (=> bs!1942 m!37223))

(assert (=> bs!1942 m!37223))

(declare-fun m!37225 () Bool)

(assert (=> bs!1942 m!37225))

(assert (=> b!43256 d!7929))

(declare-fun d!7931 () Bool)

(declare-fun c!5533 () Bool)

(assert (=> d!7931 (= c!5533 ((_ is ValueCellFull!698) (select (arr!1395 lt!18341) #b00000000000000000000000000000000)))))

(declare-fun e!27452 () V!2309)

(assert (=> d!7931 (= (get!787 (select (arr!1395 lt!18341) #b00000000000000000000000000000000) (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)) e!27452)))

(declare-fun b!43322 () Bool)

(declare-fun get!792 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43322 (= e!27452 (get!792 (select (arr!1395 lt!18341) #b00000000000000000000000000000000) (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!43323 () Bool)

(declare-fun get!793 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43323 (= e!27452 (get!793 (select (arr!1395 lt!18341) #b00000000000000000000000000000000) (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7931 c!5533) b!43322))

(assert (= (and d!7931 (not c!5533)) b!43323))

(assert (=> b!43322 m!37119))

(assert (=> b!43322 m!36805))

(declare-fun m!37227 () Bool)

(assert (=> b!43322 m!37227))

(assert (=> b!43323 m!37119))

(assert (=> b!43323 m!36805))

(declare-fun m!37229 () Bool)

(assert (=> b!43323 m!37229))

(assert (=> b!43256 d!7931))

(assert (=> b!43028 d!7927))

(assert (=> b!42960 d!7927))

(declare-fun d!7933 () Bool)

(assert (=> d!7933 (isDefined!61 (getValueByKey!103 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))))))

(declare-fun lt!18721 () Unit!1204)

(declare-fun choose!258 (List!1189 (_ BitVec 64)) Unit!1204)

(assert (=> d!7933 (= lt!18721 (choose!258 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))))))

(declare-fun e!27455 () Bool)

(assert (=> d!7933 e!27455))

(declare-fun res!25702 () Bool)

(assert (=> d!7933 (=> (not res!25702) (not e!27455))))

(declare-fun isStrictlySorted!206 (List!1189) Bool)

(assert (=> d!7933 (= res!25702 (isStrictlySorted!206 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))))))

(assert (=> d!7933 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))) lt!18721)))

(declare-fun b!43326 () Bool)

(assert (=> b!43326 (= e!27455 (containsKey!72 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))))))

(assert (= (and d!7933 res!25702) b!43326))

(assert (=> d!7933 m!36941))

(assert (=> d!7933 m!36941))

(assert (=> d!7933 m!36943))

(declare-fun m!37231 () Bool)

(assert (=> d!7933 m!37231))

(declare-fun m!37233 () Bool)

(assert (=> d!7933 m!37233))

(assert (=> b!43326 m!36937))

(assert (=> b!43044 d!7933))

(declare-fun d!7935 () Bool)

(declare-fun isEmpty!284 (Option!109) Bool)

(assert (=> d!7935 (= (isDefined!61 (getValueByKey!103 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340))))) (not (isEmpty!284 (getValueByKey!103 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))))))))

(declare-fun bs!1943 () Bool)

(assert (= bs!1943 d!7935))

(assert (=> bs!1943 m!36941))

(declare-fun m!37235 () Bool)

(assert (=> bs!1943 m!37235))

(assert (=> b!43044 d!7935))

(declare-fun c!5544 () Bool)

(declare-fun d!7937 () Bool)

(assert (=> d!7937 (= c!5544 (and ((_ is Cons!1185) (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!824 (h!1762 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!824 (head!887 (toList!611 lt!18340))))))))

(declare-fun e!27470 () Option!109)

(assert (=> d!7937 (= (getValueByKey!103 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))) e!27470)))

(declare-fun b!43354 () Bool)

(declare-fun e!27471 () Option!109)

(assert (=> b!43354 (= e!27471 None!107)))

(declare-fun b!43353 () Bool)

(assert (=> b!43353 (= e!27471 (getValueByKey!103 (t!4185 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))) (_1!824 (head!887 (toList!611 lt!18340)))))))

(declare-fun b!43352 () Bool)

(assert (=> b!43352 (= e!27470 e!27471)))

(declare-fun c!5545 () Bool)

(assert (=> b!43352 (= c!5545 (and ((_ is Cons!1185) (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))) (not (= (_1!824 (h!1762 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!824 (head!887 (toList!611 lt!18340)))))))))

(declare-fun b!43351 () Bool)

(assert (=> b!43351 (= e!27470 (Some!108 (_2!824 (h!1762 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))))))))

(assert (= (and d!7937 c!5544) b!43351))

(assert (= (and d!7937 (not c!5544)) b!43352))

(assert (= (and b!43352 c!5545) b!43353))

(assert (= (and b!43352 (not c!5545)) b!43354))

(declare-fun m!37237 () Bool)

(assert (=> b!43353 m!37237))

(assert (=> b!43044 d!7937))

(declare-fun d!7939 () Bool)

(declare-fun res!25711 () Bool)

(declare-fun e!27476 () Bool)

(assert (=> d!7939 (=> res!25711 e!27476)))

(assert (=> d!7939 (= res!25711 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1579 lt!18338)))))

(assert (=> d!7939 (= (arrayNoDuplicates!0 lt!18338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5447 (Cons!1186 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) Nil!1187) Nil!1187)) e!27476)))

(declare-fun b!43363 () Bool)

(declare-fun e!27478 () Bool)

(assert (=> b!43363 (= e!27478 (contains!564 (ite c!5447 (Cons!1186 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) Nil!1187) Nil!1187) (select (arr!1394 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43364 () Bool)

(declare-fun e!27479 () Bool)

(declare-fun call!3493 () Bool)

(assert (=> b!43364 (= e!27479 call!3493)))

(declare-fun b!43365 () Bool)

(assert (=> b!43365 (= e!27479 call!3493)))

(declare-fun b!43366 () Bool)

(declare-fun e!27477 () Bool)

(assert (=> b!43366 (= e!27476 e!27477)))

(declare-fun res!25712 () Bool)

(assert (=> b!43366 (=> (not res!25712) (not e!27477))))

(assert (=> b!43366 (= res!25712 (not e!27478))))

(declare-fun res!25713 () Bool)

(assert (=> b!43366 (=> (not res!25713) (not e!27478))))

(assert (=> b!43366 (= res!25713 (validKeyInArray!0 (select (arr!1394 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43367 () Bool)

(assert (=> b!43367 (= e!27477 e!27479)))

(declare-fun c!5548 () Bool)

(assert (=> b!43367 (= c!5548 (validKeyInArray!0 (select (arr!1394 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3490 () Bool)

(assert (=> bm!3490 (= call!3493 (arrayNoDuplicates!0 lt!18338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5548 (Cons!1186 (select (arr!1394 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5447 (Cons!1186 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) Nil!1187) Nil!1187)) (ite c!5447 (Cons!1186 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) Nil!1187) Nil!1187))))))

(assert (= (and d!7939 (not res!25711)) b!43366))

(assert (= (and b!43366 res!25713) b!43363))

(assert (= (and b!43366 res!25712) b!43367))

(assert (= (and b!43367 c!5548) b!43365))

(assert (= (and b!43367 (not c!5548)) b!43364))

(assert (= (or b!43365 b!43364) bm!3490))

(assert (=> b!43363 m!37159))

(assert (=> b!43363 m!37159))

(declare-fun m!37239 () Bool)

(assert (=> b!43363 m!37239))

(assert (=> b!43366 m!37159))

(assert (=> b!43366 m!37159))

(assert (=> b!43366 m!37161))

(assert (=> b!43367 m!37159))

(assert (=> b!43367 m!37159))

(assert (=> b!43367 m!37161))

(assert (=> bm!3490 m!37159))

(declare-fun m!37241 () Bool)

(assert (=> bm!3490 m!37241))

(assert (=> bm!3407 d!7939))

(declare-fun b!43443 () Bool)

(declare-fun e!27531 () Bool)

(declare-fun lt!18791 () ListLongMap!1191)

(declare-fun isEmpty!285 (ListLongMap!1191) Bool)

(assert (=> b!43443 (= e!27531 (isEmpty!285 lt!18791))))

(declare-fun b!43444 () Bool)

(assert (=> b!43444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(assert (=> b!43444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1580 lt!18341)))))

(declare-fun e!27530 () Bool)

(assert (=> b!43444 (= e!27530 (= (apply!59 lt!18791 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)) (get!787 (select (arr!1395 lt!18341) #b00000000000000000000000000000000) (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!43445 () Bool)

(declare-fun e!27532 () Bool)

(assert (=> b!43445 (= e!27532 (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(assert (=> b!43445 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!7941 () Bool)

(declare-fun e!27526 () Bool)

(assert (=> d!7941 e!27526))

(declare-fun res!25750 () Bool)

(assert (=> d!7941 (=> (not res!25750) (not e!27526))))

(assert (=> d!7941 (= res!25750 (not (contains!560 lt!18791 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!27528 () ListLongMap!1191)

(assert (=> d!7941 (= lt!18791 e!27528)))

(declare-fun c!5572 () Bool)

(assert (=> d!7941 (= c!5572 (bvsge #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(assert (=> d!7941 (validMask!0 mask!853)))

(assert (=> d!7941 (= (getCurrentListMapNoExtraKeys!37 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470) lt!18791)))

(declare-fun b!43446 () Bool)

(declare-fun e!27529 () ListLongMap!1191)

(declare-fun call!3499 () ListLongMap!1191)

(assert (=> b!43446 (= e!27529 call!3499)))

(declare-fun b!43447 () Bool)

(declare-fun e!27527 () Bool)

(assert (=> b!43447 (= e!27527 e!27531)))

(declare-fun c!5573 () Bool)

(assert (=> b!43447 (= c!5573 (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(declare-fun b!43448 () Bool)

(assert (=> b!43448 (= e!27531 (= lt!18791 (getCurrentListMapNoExtraKeys!37 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470)))))

(declare-fun b!43449 () Bool)

(assert (=> b!43449 (= e!27528 e!27529)))

(declare-fun c!5571 () Bool)

(assert (=> b!43449 (= c!5571 (validKeyInArray!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!43450 () Bool)

(declare-fun lt!18790 () Unit!1204)

(declare-fun lt!18793 () Unit!1204)

(assert (=> b!43450 (= lt!18790 lt!18793)))

(declare-fun lt!18795 () ListLongMap!1191)

(declare-fun lt!18794 () V!2309)

(declare-fun lt!18792 () (_ BitVec 64))

(declare-fun lt!18796 () (_ BitVec 64))

(assert (=> b!43450 (not (contains!560 (+!68 lt!18795 (tuple2!1627 lt!18792 lt!18794)) lt!18796))))

(declare-fun addStillNotContains!11 (ListLongMap!1191 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1204)

(assert (=> b!43450 (= lt!18793 (addStillNotContains!11 lt!18795 lt!18792 lt!18794 lt!18796))))

(assert (=> b!43450 (= lt!18796 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!43450 (= lt!18794 (get!787 (select (arr!1395 lt!18341) #b00000000000000000000000000000000) (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43450 (= lt!18792 (select (arr!1394 lt!18338) #b00000000000000000000000000000000))))

(assert (=> b!43450 (= lt!18795 call!3499)))

(assert (=> b!43450 (= e!27529 (+!68 call!3499 (tuple2!1627 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) (get!787 (select (arr!1395 lt!18341) #b00000000000000000000000000000000) (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!43451 () Bool)

(assert (=> b!43451 (= e!27527 e!27530)))

(assert (=> b!43451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(declare-fun res!25748 () Bool)

(assert (=> b!43451 (= res!25748 (contains!560 lt!18791 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(assert (=> b!43451 (=> (not res!25748) (not e!27530))))

(declare-fun bm!3496 () Bool)

(assert (=> bm!3496 (= call!3499 (getCurrentListMapNoExtraKeys!37 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470))))

(declare-fun b!43452 () Bool)

(assert (=> b!43452 (= e!27526 e!27527)))

(declare-fun c!5570 () Bool)

(assert (=> b!43452 (= c!5570 e!27532)))

(declare-fun res!25749 () Bool)

(assert (=> b!43452 (=> (not res!25749) (not e!27532))))

(assert (=> b!43452 (= res!25749 (bvslt #b00000000000000000000000000000000 (size!1579 lt!18338)))))

(declare-fun b!43453 () Bool)

(declare-fun res!25747 () Bool)

(assert (=> b!43453 (=> (not res!25747) (not e!27526))))

(assert (=> b!43453 (= res!25747 (not (contains!560 lt!18791 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!43454 () Bool)

(assert (=> b!43454 (= e!27528 (ListLongMap!1192 Nil!1186))))

(assert (= (and d!7941 c!5572) b!43454))

(assert (= (and d!7941 (not c!5572)) b!43449))

(assert (= (and b!43449 c!5571) b!43450))

(assert (= (and b!43449 (not c!5571)) b!43446))

(assert (= (or b!43450 b!43446) bm!3496))

(assert (= (and d!7941 res!25750) b!43453))

(assert (= (and b!43453 res!25747) b!43452))

(assert (= (and b!43452 res!25749) b!43445))

(assert (= (and b!43452 c!5570) b!43451))

(assert (= (and b!43452 (not c!5570)) b!43447))

(assert (= (and b!43451 res!25748) b!43444))

(assert (= (and b!43447 c!5573) b!43448))

(assert (= (and b!43447 (not c!5573)) b!43443))

(declare-fun b_lambda!2277 () Bool)

(assert (=> (not b_lambda!2277) (not b!43444)))

(assert (=> b!43444 t!4184))

(declare-fun b_and!2677 () Bool)

(assert (= b_and!2671 (and (=> t!4184 result!1717) b_and!2677)))

(declare-fun b_lambda!2279 () Bool)

(assert (=> (not b_lambda!2279) (not b!43450)))

(assert (=> b!43450 t!4184))

(declare-fun b_and!2679 () Bool)

(assert (= b_and!2677 (and (=> t!4184 result!1717) b_and!2679)))

(declare-fun m!37287 () Bool)

(assert (=> d!7941 m!37287))

(assert (=> d!7941 m!36815))

(declare-fun m!37289 () Bool)

(assert (=> b!43453 m!37289))

(assert (=> b!43444 m!36871))

(assert (=> b!43444 m!36871))

(declare-fun m!37291 () Bool)

(assert (=> b!43444 m!37291))

(assert (=> b!43444 m!37119))

(assert (=> b!43444 m!37119))

(assert (=> b!43444 m!36805))

(assert (=> b!43444 m!37123))

(assert (=> b!43444 m!36805))

(declare-fun m!37293 () Bool)

(assert (=> bm!3496 m!37293))

(assert (=> b!43450 m!36871))

(declare-fun m!37295 () Bool)

(assert (=> b!43450 m!37295))

(declare-fun m!37297 () Bool)

(assert (=> b!43450 m!37297))

(declare-fun m!37299 () Bool)

(assert (=> b!43450 m!37299))

(assert (=> b!43450 m!37119))

(declare-fun m!37301 () Bool)

(assert (=> b!43450 m!37301))

(assert (=> b!43450 m!37297))

(assert (=> b!43450 m!37119))

(assert (=> b!43450 m!36805))

(assert (=> b!43450 m!37123))

(assert (=> b!43450 m!36805))

(assert (=> b!43448 m!37293))

(assert (=> b!43451 m!36871))

(assert (=> b!43451 m!36871))

(declare-fun m!37303 () Bool)

(assert (=> b!43451 m!37303))

(assert (=> b!43449 m!36871))

(assert (=> b!43449 m!36871))

(assert (=> b!43449 m!36873))

(assert (=> b!43445 m!36871))

(assert (=> b!43445 m!36871))

(assert (=> b!43445 m!36873))

(declare-fun m!37305 () Bool)

(assert (=> b!43443 m!37305))

(assert (=> bm!3475 d!7941))

(declare-fun d!7955 () Bool)

(declare-fun e!27541 () Bool)

(assert (=> d!7955 e!27541))

(declare-fun res!25755 () Bool)

(assert (=> d!7955 (=> res!25755 e!27541)))

(declare-fun lt!18807 () Bool)

(assert (=> d!7955 (= res!25755 (not lt!18807))))

(declare-fun lt!18806 () Bool)

(assert (=> d!7955 (= lt!18807 lt!18806)))

(declare-fun lt!18804 () Unit!1204)

(declare-fun e!27540 () Unit!1204)

(assert (=> d!7955 (= lt!18804 e!27540)))

(declare-fun c!5578 () Bool)

(assert (=> d!7955 (= c!5578 lt!18806)))

(assert (=> d!7955 (= lt!18806 (containsKey!72 (toList!611 lt!18660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7955 (= (contains!560 lt!18660 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18807)))

(declare-fun b!43467 () Bool)

(declare-fun lt!18805 () Unit!1204)

(assert (=> b!43467 (= e!27540 lt!18805)))

(assert (=> b!43467 (= lt!18805 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!611 lt!18660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43467 (isDefined!61 (getValueByKey!103 (toList!611 lt!18660) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43468 () Bool)

(declare-fun Unit!1219 () Unit!1204)

(assert (=> b!43468 (= e!27540 Unit!1219)))

(declare-fun b!43469 () Bool)

(assert (=> b!43469 (= e!27541 (isDefined!61 (getValueByKey!103 (toList!611 lt!18660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7955 c!5578) b!43467))

(assert (= (and d!7955 (not c!5578)) b!43468))

(assert (= (and d!7955 (not res!25755)) b!43469))

(declare-fun m!37309 () Bool)

(assert (=> d!7955 m!37309))

(declare-fun m!37311 () Bool)

(assert (=> b!43467 m!37311))

(declare-fun m!37313 () Bool)

(assert (=> b!43467 m!37313))

(assert (=> b!43467 m!37313))

(declare-fun m!37315 () Bool)

(assert (=> b!43467 m!37315))

(assert (=> b!43469 m!37313))

(assert (=> b!43469 m!37313))

(assert (=> b!43469 m!37315))

(assert (=> bm!3479 d!7955))

(assert (=> b!43046 d!7935))

(assert (=> b!43046 d!7937))

(declare-fun d!7957 () Bool)

(declare-fun e!27542 () Bool)

(assert (=> d!7957 e!27542))

(declare-fun res!25757 () Bool)

(assert (=> d!7957 (=> (not res!25757) (not e!27542))))

(declare-fun lt!18809 () ListLongMap!1191)

(assert (=> d!7957 (= res!25757 (contains!560 lt!18809 (_1!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))))))

(declare-fun lt!18808 () List!1189)

(assert (=> d!7957 (= lt!18809 (ListLongMap!1192 lt!18808))))

(declare-fun lt!18810 () Unit!1204)

(declare-fun lt!18811 () Unit!1204)

(assert (=> d!7957 (= lt!18810 lt!18811)))

(assert (=> d!7957 (= (getValueByKey!103 lt!18808 (_1!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))) (Some!108 (_2!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))))))

(assert (=> d!7957 (= lt!18811 (lemmaContainsTupThenGetReturnValue!29 lt!18808 (_1!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))) (_2!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))))))

(assert (=> d!7957 (= lt!18808 (insertStrictlySorted!26 (toList!611 (ite c!5514 call!3481 (ite c!5519 call!3478 call!3476))) (_1!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))) (_2!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))))))

(assert (=> d!7957 (= (+!68 (ite c!5514 call!3481 (ite c!5519 call!3478 call!3476)) (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))) lt!18809)))

(declare-fun b!43470 () Bool)

(declare-fun res!25756 () Bool)

(assert (=> b!43470 (=> (not res!25756) (not e!27542))))

(assert (=> b!43470 (= res!25756 (= (getValueByKey!103 (toList!611 lt!18809) (_1!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335)))) (Some!108 (_2!824 (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))))))))

(declare-fun b!43471 () Bool)

(assert (=> b!43471 (= e!27542 (contains!566 (toList!611 lt!18809) (ite (or c!5514 c!5519) (tuple2!1627 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18335) (tuple2!1627 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18335))))))

(assert (= (and d!7957 res!25757) b!43470))

(assert (= (and b!43470 res!25756) b!43471))

(declare-fun m!37331 () Bool)

(assert (=> d!7957 m!37331))

(declare-fun m!37333 () Bool)

(assert (=> d!7957 m!37333))

(declare-fun m!37335 () Bool)

(assert (=> d!7957 m!37335))

(declare-fun m!37337 () Bool)

(assert (=> d!7957 m!37337))

(declare-fun m!37339 () Bool)

(assert (=> b!43470 m!37339))

(declare-fun m!37343 () Bool)

(assert (=> b!43471 m!37343))

(assert (=> bm!3478 d!7957))

(declare-fun d!7959 () Bool)

(assert (=> d!7959 (= (apply!59 lt!18660 #b0000000000000000000000000000000000000000000000000000000000000000) (get!788 (getValueByKey!103 (toList!611 lt!18660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1945 () Bool)

(assert (= bs!1945 d!7959))

(assert (=> bs!1945 m!37313))

(assert (=> bs!1945 m!37313))

(declare-fun m!37347 () Bool)

(assert (=> bs!1945 m!37347))

(assert (=> b!43272 d!7959))

(declare-fun d!7963 () Bool)

(declare-fun e!27543 () Bool)

(assert (=> d!7963 e!27543))

(declare-fun res!25759 () Bool)

(assert (=> d!7963 (=> (not res!25759) (not e!27543))))

(declare-fun lt!18813 () ListLongMap!1191)

(assert (=> d!7963 (= res!25759 (contains!560 lt!18813 (_1!824 (tuple2!1627 lt!18667 lt!18335))))))

(declare-fun lt!18812 () List!1189)

(assert (=> d!7963 (= lt!18813 (ListLongMap!1192 lt!18812))))

(declare-fun lt!18814 () Unit!1204)

(declare-fun lt!18815 () Unit!1204)

(assert (=> d!7963 (= lt!18814 lt!18815)))

(assert (=> d!7963 (= (getValueByKey!103 lt!18812 (_1!824 (tuple2!1627 lt!18667 lt!18335))) (Some!108 (_2!824 (tuple2!1627 lt!18667 lt!18335))))))

(assert (=> d!7963 (= lt!18815 (lemmaContainsTupThenGetReturnValue!29 lt!18812 (_1!824 (tuple2!1627 lt!18667 lt!18335)) (_2!824 (tuple2!1627 lt!18667 lt!18335))))))

(assert (=> d!7963 (= lt!18812 (insertStrictlySorted!26 (toList!611 lt!18672) (_1!824 (tuple2!1627 lt!18667 lt!18335)) (_2!824 (tuple2!1627 lt!18667 lt!18335))))))

(assert (=> d!7963 (= (+!68 lt!18672 (tuple2!1627 lt!18667 lt!18335)) lt!18813)))

(declare-fun b!43472 () Bool)

(declare-fun res!25758 () Bool)

(assert (=> b!43472 (=> (not res!25758) (not e!27543))))

(assert (=> b!43472 (= res!25758 (= (getValueByKey!103 (toList!611 lt!18813) (_1!824 (tuple2!1627 lt!18667 lt!18335))) (Some!108 (_2!824 (tuple2!1627 lt!18667 lt!18335)))))))

(declare-fun b!43473 () Bool)

(assert (=> b!43473 (= e!27543 (contains!566 (toList!611 lt!18813) (tuple2!1627 lt!18667 lt!18335)))))

(assert (= (and d!7963 res!25759) b!43472))

(assert (= (and b!43472 res!25758) b!43473))

(declare-fun m!37349 () Bool)

(assert (=> d!7963 m!37349))

(declare-fun m!37351 () Bool)

(assert (=> d!7963 m!37351))

(declare-fun m!37353 () Bool)

(assert (=> d!7963 m!37353))

(declare-fun m!37355 () Bool)

(assert (=> d!7963 m!37355))

(declare-fun m!37357 () Bool)

(assert (=> b!43472 m!37357))

(declare-fun m!37359 () Bool)

(assert (=> b!43473 m!37359))

(assert (=> b!43254 d!7963))

(declare-fun d!7965 () Bool)

(assert (=> d!7965 (= (apply!59 (+!68 lt!18665 (tuple2!1627 lt!18670 lt!18335)) lt!18663) (apply!59 lt!18665 lt!18663))))

(declare-fun lt!18849 () Unit!1204)

(declare-fun choose!259 (ListLongMap!1191 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1204)

(assert (=> d!7965 (= lt!18849 (choose!259 lt!18665 lt!18670 lt!18335 lt!18663))))

(declare-fun e!27568 () Bool)

(assert (=> d!7965 e!27568))

(declare-fun res!25771 () Bool)

(assert (=> d!7965 (=> (not res!25771) (not e!27568))))

(assert (=> d!7965 (= res!25771 (contains!560 lt!18665 lt!18663))))

(assert (=> d!7965 (= (addApplyDifferent!35 lt!18665 lt!18670 lt!18335 lt!18663) lt!18849)))

(declare-fun b!43516 () Bool)

(assert (=> b!43516 (= e!27568 (not (= lt!18663 lt!18670)))))

(assert (= (and d!7965 res!25771) b!43516))

(assert (=> d!7965 m!37103))

(declare-fun m!37385 () Bool)

(assert (=> d!7965 m!37385))

(declare-fun m!37387 () Bool)

(assert (=> d!7965 m!37387))

(assert (=> d!7965 m!37103))

(assert (=> d!7965 m!37107))

(assert (=> d!7965 m!37083))

(assert (=> b!43254 d!7965))

(declare-fun d!7969 () Bool)

(assert (=> d!7969 (= (apply!59 lt!18675 lt!18680) (get!788 (getValueByKey!103 (toList!611 lt!18675) lt!18680)))))

(declare-fun bs!1946 () Bool)

(assert (= bs!1946 d!7969))

(declare-fun m!37393 () Bool)

(assert (=> bs!1946 m!37393))

(assert (=> bs!1946 m!37393))

(declare-fun m!37397 () Bool)

(assert (=> bs!1946 m!37397))

(assert (=> b!43254 d!7969))

(declare-fun d!7971 () Bool)

(assert (=> d!7971 (= (apply!59 (+!68 lt!18668 (tuple2!1627 lt!18679 lt!18335)) lt!18678) (get!788 (getValueByKey!103 (toList!611 (+!68 lt!18668 (tuple2!1627 lt!18679 lt!18335))) lt!18678)))))

(declare-fun bs!1947 () Bool)

(assert (= bs!1947 d!7971))

(declare-fun m!37407 () Bool)

(assert (=> bs!1947 m!37407))

(assert (=> bs!1947 m!37407))

(declare-fun m!37411 () Bool)

(assert (=> bs!1947 m!37411))

(assert (=> b!43254 d!7971))

(assert (=> b!43254 d!7941))

(declare-fun d!7973 () Bool)

(assert (=> d!7973 (= (apply!59 (+!68 lt!18665 (tuple2!1627 lt!18670 lt!18335)) lt!18663) (get!788 (getValueByKey!103 (toList!611 (+!68 lt!18665 (tuple2!1627 lt!18670 lt!18335))) lt!18663)))))

(declare-fun bs!1949 () Bool)

(assert (= bs!1949 d!7973))

(declare-fun m!37419 () Bool)

(assert (=> bs!1949 m!37419))

(assert (=> bs!1949 m!37419))

(declare-fun m!37421 () Bool)

(assert (=> bs!1949 m!37421))

(assert (=> b!43254 d!7973))

(declare-fun d!7977 () Bool)

(assert (=> d!7977 (= (apply!59 (+!68 lt!18668 (tuple2!1627 lt!18679 lt!18335)) lt!18678) (apply!59 lt!18668 lt!18678))))

(declare-fun lt!18850 () Unit!1204)

(assert (=> d!7977 (= lt!18850 (choose!259 lt!18668 lt!18679 lt!18335 lt!18678))))

(declare-fun e!27569 () Bool)

(assert (=> d!7977 e!27569))

(declare-fun res!25775 () Bool)

(assert (=> d!7977 (=> (not res!25775) (not e!27569))))

(assert (=> d!7977 (= res!25775 (contains!560 lt!18668 lt!18678))))

(assert (=> d!7977 (= (addApplyDifferent!35 lt!18668 lt!18679 lt!18335 lt!18678) lt!18850)))

(declare-fun b!43517 () Bool)

(assert (=> b!43517 (= e!27569 (not (= lt!18678 lt!18679)))))

(assert (= (and d!7977 res!25775) b!43517))

(assert (=> d!7977 m!37099))

(declare-fun m!37433 () Bool)

(assert (=> d!7977 m!37433))

(declare-fun m!37435 () Bool)

(assert (=> d!7977 m!37435))

(assert (=> d!7977 m!37099))

(assert (=> d!7977 m!37101))

(assert (=> d!7977 m!37095))

(assert (=> b!43254 d!7977))

(declare-fun d!7979 () Bool)

(declare-fun e!27570 () Bool)

(assert (=> d!7979 e!27570))

(declare-fun res!25777 () Bool)

(assert (=> d!7979 (=> (not res!25777) (not e!27570))))

(declare-fun lt!18852 () ListLongMap!1191)

(assert (=> d!7979 (= res!25777 (contains!560 lt!18852 (_1!824 (tuple2!1627 lt!18679 lt!18335))))))

(declare-fun lt!18851 () List!1189)

(assert (=> d!7979 (= lt!18852 (ListLongMap!1192 lt!18851))))

(declare-fun lt!18853 () Unit!1204)

(declare-fun lt!18854 () Unit!1204)

(assert (=> d!7979 (= lt!18853 lt!18854)))

(assert (=> d!7979 (= (getValueByKey!103 lt!18851 (_1!824 (tuple2!1627 lt!18679 lt!18335))) (Some!108 (_2!824 (tuple2!1627 lt!18679 lt!18335))))))

(assert (=> d!7979 (= lt!18854 (lemmaContainsTupThenGetReturnValue!29 lt!18851 (_1!824 (tuple2!1627 lt!18679 lt!18335)) (_2!824 (tuple2!1627 lt!18679 lt!18335))))))

(assert (=> d!7979 (= lt!18851 (insertStrictlySorted!26 (toList!611 lt!18668) (_1!824 (tuple2!1627 lt!18679 lt!18335)) (_2!824 (tuple2!1627 lt!18679 lt!18335))))))

(assert (=> d!7979 (= (+!68 lt!18668 (tuple2!1627 lt!18679 lt!18335)) lt!18852)))

(declare-fun b!43518 () Bool)

(declare-fun res!25776 () Bool)

(assert (=> b!43518 (=> (not res!25776) (not e!27570))))

(assert (=> b!43518 (= res!25776 (= (getValueByKey!103 (toList!611 lt!18852) (_1!824 (tuple2!1627 lt!18679 lt!18335))) (Some!108 (_2!824 (tuple2!1627 lt!18679 lt!18335)))))))

(declare-fun b!43519 () Bool)

(assert (=> b!43519 (= e!27570 (contains!566 (toList!611 lt!18852) (tuple2!1627 lt!18679 lt!18335)))))

(assert (= (and d!7979 res!25777) b!43518))

(assert (= (and b!43518 res!25776) b!43519))

(declare-fun m!37447 () Bool)

(assert (=> d!7979 m!37447))

(declare-fun m!37449 () Bool)

(assert (=> d!7979 m!37449))

(declare-fun m!37453 () Bool)

(assert (=> d!7979 m!37453))

(declare-fun m!37459 () Bool)

(assert (=> d!7979 m!37459))

(declare-fun m!37463 () Bool)

(assert (=> b!43518 m!37463))

(declare-fun m!37465 () Bool)

(assert (=> b!43519 m!37465))

(assert (=> b!43254 d!7979))

(declare-fun d!7983 () Bool)

(declare-fun e!27575 () Bool)

(assert (=> d!7983 e!27575))

(declare-fun res!25780 () Bool)

(assert (=> d!7983 (=> res!25780 e!27575)))

(declare-fun lt!18861 () Bool)

(assert (=> d!7983 (= res!25780 (not lt!18861))))

(declare-fun lt!18860 () Bool)

(assert (=> d!7983 (= lt!18861 lt!18860)))

(declare-fun lt!18858 () Unit!1204)

(declare-fun e!27574 () Unit!1204)

(assert (=> d!7983 (= lt!18858 e!27574)))

(declare-fun c!5595 () Bool)

(assert (=> d!7983 (= c!5595 lt!18860)))

(assert (=> d!7983 (= lt!18860 (containsKey!72 (toList!611 (+!68 lt!18672 (tuple2!1627 lt!18667 lt!18335))) lt!18659))))

(assert (=> d!7983 (= (contains!560 (+!68 lt!18672 (tuple2!1627 lt!18667 lt!18335)) lt!18659) lt!18861)))

(declare-fun b!43524 () Bool)

(declare-fun lt!18859 () Unit!1204)

(assert (=> b!43524 (= e!27574 lt!18859)))

(assert (=> b!43524 (= lt!18859 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!611 (+!68 lt!18672 (tuple2!1627 lt!18667 lt!18335))) lt!18659))))

(assert (=> b!43524 (isDefined!61 (getValueByKey!103 (toList!611 (+!68 lt!18672 (tuple2!1627 lt!18667 lt!18335))) lt!18659))))

(declare-fun b!43525 () Bool)

(declare-fun Unit!1222 () Unit!1204)

(assert (=> b!43525 (= e!27574 Unit!1222)))

(declare-fun b!43526 () Bool)

(assert (=> b!43526 (= e!27575 (isDefined!61 (getValueByKey!103 (toList!611 (+!68 lt!18672 (tuple2!1627 lt!18667 lt!18335))) lt!18659)))))

(assert (= (and d!7983 c!5595) b!43524))

(assert (= (and d!7983 (not c!5595)) b!43525))

(assert (= (and d!7983 (not res!25780)) b!43526))

(declare-fun m!37469 () Bool)

(assert (=> d!7983 m!37469))

(declare-fun m!37471 () Bool)

(assert (=> b!43524 m!37471))

(declare-fun m!37475 () Bool)

(assert (=> b!43524 m!37475))

(assert (=> b!43524 m!37475))

(declare-fun m!37479 () Bool)

(assert (=> b!43524 m!37479))

(assert (=> b!43526 m!37475))

(assert (=> b!43526 m!37475))

(assert (=> b!43526 m!37479))

(assert (=> b!43254 d!7983))

(declare-fun d!7987 () Bool)

(assert (=> d!7987 (= (apply!59 lt!18668 lt!18678) (get!788 (getValueByKey!103 (toList!611 lt!18668) lt!18678)))))

(declare-fun bs!1951 () Bool)

(assert (= bs!1951 d!7987))

(declare-fun m!37489 () Bool)

(assert (=> bs!1951 m!37489))

(assert (=> bs!1951 m!37489))

(declare-fun m!37491 () Bool)

(assert (=> bs!1951 m!37491))

(assert (=> b!43254 d!7987))

(declare-fun d!7991 () Bool)

(declare-fun e!27576 () Bool)

(assert (=> d!7991 e!27576))

(declare-fun res!25782 () Bool)

(assert (=> d!7991 (=> (not res!25782) (not e!27576))))

(declare-fun lt!18863 () ListLongMap!1191)

(assert (=> d!7991 (= res!25782 (contains!560 lt!18863 (_1!824 (tuple2!1627 lt!18661 lt!18335))))))

(declare-fun lt!18862 () List!1189)

(assert (=> d!7991 (= lt!18863 (ListLongMap!1192 lt!18862))))

(declare-fun lt!18864 () Unit!1204)

(declare-fun lt!18865 () Unit!1204)

(assert (=> d!7991 (= lt!18864 lt!18865)))

(assert (=> d!7991 (= (getValueByKey!103 lt!18862 (_1!824 (tuple2!1627 lt!18661 lt!18335))) (Some!108 (_2!824 (tuple2!1627 lt!18661 lt!18335))))))

(assert (=> d!7991 (= lt!18865 (lemmaContainsTupThenGetReturnValue!29 lt!18862 (_1!824 (tuple2!1627 lt!18661 lt!18335)) (_2!824 (tuple2!1627 lt!18661 lt!18335))))))

(assert (=> d!7991 (= lt!18862 (insertStrictlySorted!26 (toList!611 lt!18675) (_1!824 (tuple2!1627 lt!18661 lt!18335)) (_2!824 (tuple2!1627 lt!18661 lt!18335))))))

(assert (=> d!7991 (= (+!68 lt!18675 (tuple2!1627 lt!18661 lt!18335)) lt!18863)))

(declare-fun b!43527 () Bool)

(declare-fun res!25781 () Bool)

(assert (=> b!43527 (=> (not res!25781) (not e!27576))))

(assert (=> b!43527 (= res!25781 (= (getValueByKey!103 (toList!611 lt!18863) (_1!824 (tuple2!1627 lt!18661 lt!18335))) (Some!108 (_2!824 (tuple2!1627 lt!18661 lt!18335)))))))

(declare-fun b!43528 () Bool)

(assert (=> b!43528 (= e!27576 (contains!566 (toList!611 lt!18863) (tuple2!1627 lt!18661 lt!18335)))))

(assert (= (and d!7991 res!25782) b!43527))

(assert (= (and b!43527 res!25781) b!43528))

(declare-fun m!37493 () Bool)

(assert (=> d!7991 m!37493))

(declare-fun m!37495 () Bool)

(assert (=> d!7991 m!37495))

(declare-fun m!37497 () Bool)

(assert (=> d!7991 m!37497))

(declare-fun m!37499 () Bool)

(assert (=> d!7991 m!37499))

(declare-fun m!37501 () Bool)

(assert (=> b!43527 m!37501))

(declare-fun m!37503 () Bool)

(assert (=> b!43528 m!37503))

(assert (=> b!43254 d!7991))

(declare-fun d!7995 () Bool)

(assert (=> d!7995 (contains!560 (+!68 lt!18672 (tuple2!1627 lt!18667 lt!18335)) lt!18659)))

(declare-fun lt!18869 () Unit!1204)

(declare-fun choose!260 (ListLongMap!1191 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1204)

(assert (=> d!7995 (= lt!18869 (choose!260 lt!18672 lt!18667 lt!18335 lt!18659))))

(assert (=> d!7995 (contains!560 lt!18672 lt!18659)))

(assert (=> d!7995 (= (addStillContains!35 lt!18672 lt!18667 lt!18335 lt!18659) lt!18869)))

(declare-fun bs!1954 () Bool)

(assert (= bs!1954 d!7995))

(assert (=> bs!1954 m!37085))

(assert (=> bs!1954 m!37085))

(assert (=> bs!1954 m!37087))

(declare-fun m!37521 () Bool)

(assert (=> bs!1954 m!37521))

(declare-fun m!37523 () Bool)

(assert (=> bs!1954 m!37523))

(assert (=> b!43254 d!7995))

(declare-fun d!8005 () Bool)

(assert (=> d!8005 (= (apply!59 lt!18665 lt!18663) (get!788 (getValueByKey!103 (toList!611 lt!18665) lt!18663)))))

(declare-fun bs!1955 () Bool)

(assert (= bs!1955 d!8005))

(declare-fun m!37525 () Bool)

(assert (=> bs!1955 m!37525))

(assert (=> bs!1955 m!37525))

(declare-fun m!37527 () Bool)

(assert (=> bs!1955 m!37527))

(assert (=> b!43254 d!8005))

(declare-fun d!8007 () Bool)

(assert (=> d!8007 (= (apply!59 (+!68 lt!18675 (tuple2!1627 lt!18661 lt!18335)) lt!18680) (get!788 (getValueByKey!103 (toList!611 (+!68 lt!18675 (tuple2!1627 lt!18661 lt!18335))) lt!18680)))))

(declare-fun bs!1956 () Bool)

(assert (= bs!1956 d!8007))

(declare-fun m!37529 () Bool)

(assert (=> bs!1956 m!37529))

(assert (=> bs!1956 m!37529))

(declare-fun m!37531 () Bool)

(assert (=> bs!1956 m!37531))

(assert (=> b!43254 d!8007))

(declare-fun d!8009 () Bool)

(declare-fun e!27588 () Bool)

(assert (=> d!8009 e!27588))

(declare-fun res!25790 () Bool)

(assert (=> d!8009 (=> (not res!25790) (not e!27588))))

(declare-fun lt!18871 () ListLongMap!1191)

(assert (=> d!8009 (= res!25790 (contains!560 lt!18871 (_1!824 (tuple2!1627 lt!18670 lt!18335))))))

(declare-fun lt!18870 () List!1189)

(assert (=> d!8009 (= lt!18871 (ListLongMap!1192 lt!18870))))

(declare-fun lt!18872 () Unit!1204)

(declare-fun lt!18873 () Unit!1204)

(assert (=> d!8009 (= lt!18872 lt!18873)))

(assert (=> d!8009 (= (getValueByKey!103 lt!18870 (_1!824 (tuple2!1627 lt!18670 lt!18335))) (Some!108 (_2!824 (tuple2!1627 lt!18670 lt!18335))))))

(assert (=> d!8009 (= lt!18873 (lemmaContainsTupThenGetReturnValue!29 lt!18870 (_1!824 (tuple2!1627 lt!18670 lt!18335)) (_2!824 (tuple2!1627 lt!18670 lt!18335))))))

(assert (=> d!8009 (= lt!18870 (insertStrictlySorted!26 (toList!611 lt!18665) (_1!824 (tuple2!1627 lt!18670 lt!18335)) (_2!824 (tuple2!1627 lt!18670 lt!18335))))))

(assert (=> d!8009 (= (+!68 lt!18665 (tuple2!1627 lt!18670 lt!18335)) lt!18871)))

(declare-fun b!43546 () Bool)

(declare-fun res!25789 () Bool)

(assert (=> b!43546 (=> (not res!25789) (not e!27588))))

(assert (=> b!43546 (= res!25789 (= (getValueByKey!103 (toList!611 lt!18871) (_1!824 (tuple2!1627 lt!18670 lt!18335))) (Some!108 (_2!824 (tuple2!1627 lt!18670 lt!18335)))))))

(declare-fun b!43547 () Bool)

(assert (=> b!43547 (= e!27588 (contains!566 (toList!611 lt!18871) (tuple2!1627 lt!18670 lt!18335)))))

(assert (= (and d!8009 res!25790) b!43546))

(assert (= (and b!43546 res!25789) b!43547))

(declare-fun m!37537 () Bool)

(assert (=> d!8009 m!37537))

(declare-fun m!37539 () Bool)

(assert (=> d!8009 m!37539))

(declare-fun m!37541 () Bool)

(assert (=> d!8009 m!37541))

(declare-fun m!37543 () Bool)

(assert (=> d!8009 m!37543))

(declare-fun m!37545 () Bool)

(assert (=> b!43546 m!37545))

(declare-fun m!37549 () Bool)

(assert (=> b!43547 m!37549))

(assert (=> b!43254 d!8009))

(declare-fun d!8013 () Bool)

(assert (=> d!8013 (= (apply!59 (+!68 lt!18675 (tuple2!1627 lt!18661 lt!18335)) lt!18680) (apply!59 lt!18675 lt!18680))))

(declare-fun lt!18878 () Unit!1204)

(assert (=> d!8013 (= lt!18878 (choose!259 lt!18675 lt!18661 lt!18335 lt!18680))))

(declare-fun e!27590 () Bool)

(assert (=> d!8013 e!27590))

(declare-fun res!25793 () Bool)

(assert (=> d!8013 (=> (not res!25793) (not e!27590))))

(assert (=> d!8013 (= res!25793 (contains!560 lt!18675 lt!18680))))

(assert (=> d!8013 (= (addApplyDifferent!35 lt!18675 lt!18661 lt!18335 lt!18680) lt!18878)))

(declare-fun b!43550 () Bool)

(assert (=> b!43550 (= e!27590 (not (= lt!18680 lt!18661)))))

(assert (= (and d!8013 res!25793) b!43550))

(assert (=> d!8013 m!37105))

(declare-fun m!37561 () Bool)

(assert (=> d!8013 m!37561))

(declare-fun m!37563 () Bool)

(assert (=> d!8013 m!37563))

(assert (=> d!8013 m!37105))

(assert (=> d!8013 m!37109))

(assert (=> d!8013 m!37091))

(assert (=> b!43254 d!8013))

(declare-fun d!8017 () Bool)

(declare-fun e!27594 () Bool)

(assert (=> d!8017 e!27594))

(declare-fun res!25795 () Bool)

(assert (=> d!8017 (=> res!25795 e!27594)))

(declare-fun lt!18886 () Bool)

(assert (=> d!8017 (= res!25795 (not lt!18886))))

(declare-fun lt!18885 () Bool)

(assert (=> d!8017 (= lt!18886 lt!18885)))

(declare-fun lt!18883 () Unit!1204)

(declare-fun e!27593 () Unit!1204)

(assert (=> d!8017 (= lt!18883 e!27593)))

(declare-fun c!5602 () Bool)

(assert (=> d!8017 (= c!5602 lt!18885)))

(assert (=> d!8017 (= lt!18885 (containsKey!72 (toList!611 lt!18660) (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(assert (=> d!8017 (= (contains!560 lt!18660 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)) lt!18886)))

(declare-fun b!43554 () Bool)

(declare-fun lt!18884 () Unit!1204)

(assert (=> b!43554 (= e!27593 lt!18884)))

(assert (=> b!43554 (= lt!18884 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!611 lt!18660) (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(assert (=> b!43554 (isDefined!61 (getValueByKey!103 (toList!611 lt!18660) (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!43555 () Bool)

(declare-fun Unit!1224 () Unit!1204)

(assert (=> b!43555 (= e!27593 Unit!1224)))

(declare-fun b!43556 () Bool)

(assert (=> b!43556 (= e!27594 (isDefined!61 (getValueByKey!103 (toList!611 lt!18660) (select (arr!1394 lt!18338) #b00000000000000000000000000000000))))))

(assert (= (and d!8017 c!5602) b!43554))

(assert (= (and d!8017 (not c!5602)) b!43555))

(assert (= (and d!8017 (not res!25795)) b!43556))

(assert (=> d!8017 m!36871))

(declare-fun m!37573 () Bool)

(assert (=> d!8017 m!37573))

(assert (=> b!43554 m!36871))

(declare-fun m!37575 () Bool)

(assert (=> b!43554 m!37575))

(assert (=> b!43554 m!36871))

(assert (=> b!43554 m!37223))

(assert (=> b!43554 m!37223))

(declare-fun m!37577 () Bool)

(assert (=> b!43554 m!37577))

(assert (=> b!43556 m!36871))

(assert (=> b!43556 m!37223))

(assert (=> b!43556 m!37223))

(assert (=> b!43556 m!37577))

(assert (=> b!43271 d!8017))

(declare-fun d!8021 () Bool)

(declare-fun e!27598 () Bool)

(assert (=> d!8021 e!27598))

(declare-fun res!25796 () Bool)

(assert (=> d!8021 (=> res!25796 e!27598)))

(declare-fun lt!18891 () Bool)

(assert (=> d!8021 (= res!25796 (not lt!18891))))

(declare-fun lt!18890 () Bool)

(assert (=> d!8021 (= lt!18891 lt!18890)))

(declare-fun lt!18888 () Unit!1204)

(declare-fun e!27597 () Unit!1204)

(assert (=> d!8021 (= lt!18888 e!27597)))

(declare-fun c!5605 () Bool)

(assert (=> d!8021 (= c!5605 lt!18890)))

(assert (=> d!8021 (= lt!18890 (containsKey!72 (toList!611 lt!18660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8021 (= (contains!560 lt!18660 #b1000000000000000000000000000000000000000000000000000000000000000) lt!18891)))

(declare-fun b!43561 () Bool)

(declare-fun lt!18889 () Unit!1204)

(assert (=> b!43561 (= e!27597 lt!18889)))

(assert (=> b!43561 (= lt!18889 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!611 lt!18660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43561 (isDefined!61 (getValueByKey!103 (toList!611 lt!18660) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43562 () Bool)

(declare-fun Unit!1225 () Unit!1204)

(assert (=> b!43562 (= e!27597 Unit!1225)))

(declare-fun b!43563 () Bool)

(assert (=> b!43563 (= e!27598 (isDefined!61 (getValueByKey!103 (toList!611 lt!18660) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8021 c!5605) b!43561))

(assert (= (and d!8021 (not c!5605)) b!43562))

(assert (= (and d!8021 (not res!25796)) b!43563))

(declare-fun m!37581 () Bool)

(assert (=> d!8021 m!37581))

(declare-fun m!37583 () Bool)

(assert (=> b!43561 m!37583))

(assert (=> b!43561 m!37127))

(assert (=> b!43561 m!37127))

(declare-fun m!37585 () Bool)

(assert (=> b!43561 m!37585))

(assert (=> b!43563 m!37127))

(assert (=> b!43563 m!37127))

(assert (=> b!43563 m!37585))

(assert (=> bm!3473 d!8021))

(assert (=> b!43270 d!7927))

(declare-fun d!8025 () Bool)

(assert (=> d!8025 (arrayContainsKey!0 lt!18338 lt!18414 #b00000000000000000000000000000000)))

(declare-fun lt!18906 () Unit!1204)

(declare-fun choose!13 (array!2901 (_ BitVec 64) (_ BitVec 32)) Unit!1204)

(assert (=> d!8025 (= lt!18906 (choose!13 lt!18338 lt!18414 #b00000000000000000000000000000000))))

(assert (=> d!8025 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8025 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18338 lt!18414 #b00000000000000000000000000000000) lt!18906)))

(declare-fun bs!1957 () Bool)

(assert (= bs!1957 d!8025))

(assert (=> bs!1957 m!36897))

(declare-fun m!37605 () Bool)

(assert (=> bs!1957 m!37605))

(assert (=> b!42983 d!8025))

(declare-fun d!8033 () Bool)

(declare-fun res!25810 () Bool)

(declare-fun e!27613 () Bool)

(assert (=> d!8033 (=> res!25810 e!27613)))

(assert (=> d!8033 (= res!25810 (= (select (arr!1394 lt!18338) #b00000000000000000000000000000000) lt!18414))))

(assert (=> d!8033 (= (arrayContainsKey!0 lt!18338 lt!18414 #b00000000000000000000000000000000) e!27613)))

(declare-fun b!43583 () Bool)

(declare-fun e!27614 () Bool)

(assert (=> b!43583 (= e!27613 e!27614)))

(declare-fun res!25811 () Bool)

(assert (=> b!43583 (=> (not res!25811) (not e!27614))))

(assert (=> b!43583 (= res!25811 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1579 lt!18338)))))

(declare-fun b!43584 () Bool)

(assert (=> b!43584 (= e!27614 (arrayContainsKey!0 lt!18338 lt!18414 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8033 (not res!25810)) b!43583))

(assert (= (and b!43583 res!25811) b!43584))

(assert (=> d!8033 m!36871))

(declare-fun m!37607 () Bool)

(assert (=> b!43584 m!37607))

(assert (=> b!42983 d!8033))

(declare-fun lt!18981 () SeekEntryResult!200)

(declare-fun b!43647 () Bool)

(declare-fun e!27654 () SeekEntryResult!200)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2901 (_ BitVec 32)) SeekEntryResult!200)

(assert (=> b!43647 (= e!27654 (seekKeyOrZeroReturnVacant!0 (x!8288 lt!18981) (index!2924 lt!18981) (index!2924 lt!18981) (select (arr!1394 lt!18338) #b00000000000000000000000000000000) lt!18338 mask!853))))

(declare-fun b!43648 () Bool)

(declare-fun e!27652 () SeekEntryResult!200)

(declare-fun e!27653 () SeekEntryResult!200)

(assert (=> b!43648 (= e!27652 e!27653)))

(declare-fun lt!18980 () (_ BitVec 64))

(assert (=> b!43648 (= lt!18980 (select (arr!1394 lt!18338) (index!2924 lt!18981)))))

(declare-fun c!5621 () Bool)

(assert (=> b!43648 (= c!5621 (= lt!18980 (select (arr!1394 lt!18338) #b00000000000000000000000000000000)))))

(declare-fun b!43649 () Bool)

(assert (=> b!43649 (= e!27653 (Found!200 (index!2924 lt!18981)))))

(declare-fun b!43650 () Bool)

(declare-fun c!5623 () Bool)

(assert (=> b!43650 (= c!5623 (= lt!18980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43650 (= e!27653 e!27654)))

(declare-fun d!8035 () Bool)

(declare-fun lt!18979 () SeekEntryResult!200)

(assert (=> d!8035 (and (or ((_ is Undefined!200) lt!18979) (not ((_ is Found!200) lt!18979)) (and (bvsge (index!2923 lt!18979) #b00000000000000000000000000000000) (bvslt (index!2923 lt!18979) (size!1579 lt!18338)))) (or ((_ is Undefined!200) lt!18979) ((_ is Found!200) lt!18979) (not ((_ is MissingZero!200) lt!18979)) (and (bvsge (index!2922 lt!18979) #b00000000000000000000000000000000) (bvslt (index!2922 lt!18979) (size!1579 lt!18338)))) (or ((_ is Undefined!200) lt!18979) ((_ is Found!200) lt!18979) ((_ is MissingZero!200) lt!18979) (not ((_ is MissingVacant!200) lt!18979)) (and (bvsge (index!2925 lt!18979) #b00000000000000000000000000000000) (bvslt (index!2925 lt!18979) (size!1579 lt!18338)))) (or ((_ is Undefined!200) lt!18979) (ite ((_ is Found!200) lt!18979) (= (select (arr!1394 lt!18338) (index!2923 lt!18979)) (select (arr!1394 lt!18338) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!200) lt!18979) (= (select (arr!1394 lt!18338) (index!2922 lt!18979)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!200) lt!18979) (= (select (arr!1394 lt!18338) (index!2925 lt!18979)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8035 (= lt!18979 e!27652)))

(declare-fun c!5622 () Bool)

(assert (=> d!8035 (= c!5622 (and ((_ is Intermediate!200) lt!18981) (undefined!1012 lt!18981)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2901 (_ BitVec 32)) SeekEntryResult!200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!8035 (= lt!18981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) mask!853) (select (arr!1394 lt!18338) #b00000000000000000000000000000000) lt!18338 mask!853))))

(assert (=> d!8035 (validMask!0 mask!853)))

(assert (=> d!8035 (= (seekEntryOrOpen!0 (select (arr!1394 lt!18338) #b00000000000000000000000000000000) lt!18338 mask!853) lt!18979)))

(declare-fun b!43651 () Bool)

(assert (=> b!43651 (= e!27652 Undefined!200)))

(declare-fun b!43652 () Bool)

(assert (=> b!43652 (= e!27654 (MissingZero!200 (index!2924 lt!18981)))))

(assert (= (and d!8035 c!5622) b!43651))

(assert (= (and d!8035 (not c!5622)) b!43648))

(assert (= (and b!43648 c!5621) b!43649))

(assert (= (and b!43648 (not c!5621)) b!43650))

(assert (= (and b!43650 c!5623) b!43652))

(assert (= (and b!43650 (not c!5623)) b!43647))

(assert (=> b!43647 m!36871))

(declare-fun m!37819 () Bool)

(assert (=> b!43647 m!37819))

(declare-fun m!37821 () Bool)

(assert (=> b!43648 m!37821))

(declare-fun m!37825 () Bool)

(assert (=> d!8035 m!37825))

(assert (=> d!8035 m!36871))

(declare-fun m!37827 () Bool)

(assert (=> d!8035 m!37827))

(assert (=> d!8035 m!36871))

(assert (=> d!8035 m!37825))

(assert (=> d!8035 m!36815))

(declare-fun m!37831 () Bool)

(assert (=> d!8035 m!37831))

(declare-fun m!37833 () Bool)

(assert (=> d!8035 m!37833))

(declare-fun m!37835 () Bool)

(assert (=> d!8035 m!37835))

(assert (=> b!42983 d!8035))

(assert (=> d!7861 d!7865))

(declare-fun d!8107 () Bool)

(assert (=> d!8107 (arrayNoDuplicates!0 lt!18338 #b00000000000000000000000000000000 Nil!1187)))

(assert (=> d!8107 true))

(declare-fun res!25851 () Unit!1204)

(assert (=> d!8107 (= (choose!111 lt!18338 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1187) res!25851)))

(declare-fun bs!1975 () Bool)

(assert (= bs!1975 d!8107))

(assert (=> bs!1975 m!36803))

(assert (=> d!7861 d!8107))

(assert (=> b!42985 d!7927))

(declare-fun b!43657 () Bool)

(declare-fun e!27659 () Bool)

(declare-fun e!27657 () Bool)

(assert (=> b!43657 (= e!27659 e!27657)))

(declare-fun lt!18984 () (_ BitVec 64))

(assert (=> b!43657 (= lt!18984 (select (arr!1394 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!18986 () Unit!1204)

(assert (=> b!43657 (= lt!18986 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18338 lt!18984 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!43657 (arrayContainsKey!0 lt!18338 lt!18984 #b00000000000000000000000000000000)))

(declare-fun lt!18985 () Unit!1204)

(assert (=> b!43657 (= lt!18985 lt!18986)))

(declare-fun res!25853 () Bool)

(assert (=> b!43657 (= res!25853 (= (seekEntryOrOpen!0 (select (arr!1394 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!18338 mask!853) (Found!200 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!43657 (=> (not res!25853) (not e!27657))))

(declare-fun b!43659 () Bool)

(declare-fun e!27658 () Bool)

(assert (=> b!43659 (= e!27658 e!27659)))

(declare-fun c!5626 () Bool)

(assert (=> b!43659 (= c!5626 (validKeyInArray!0 (select (arr!1394 lt!18338) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3510 () Bool)

(declare-fun call!3513 () Bool)

(assert (=> bm!3510 (= call!3513 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!18338 mask!853))))

(declare-fun b!43660 () Bool)

(assert (=> b!43660 (= e!27659 call!3513)))

(declare-fun d!8111 () Bool)

(declare-fun res!25852 () Bool)

(assert (=> d!8111 (=> res!25852 e!27658)))

(assert (=> d!8111 (= res!25852 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1579 lt!18338)))))

(assert (=> d!8111 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18338 mask!853) e!27658)))

(declare-fun b!43658 () Bool)

(assert (=> b!43658 (= e!27657 call!3513)))

(assert (= (and d!8111 (not res!25852)) b!43659))

(assert (= (and b!43659 c!5626) b!43657))

(assert (= (and b!43659 (not c!5626)) b!43660))

(assert (= (and b!43657 res!25853) b!43658))

(assert (= (or b!43658 b!43660) bm!3510))

(assert (=> b!43657 m!37159))

(declare-fun m!37841 () Bool)

(assert (=> b!43657 m!37841))

(declare-fun m!37843 () Bool)

(assert (=> b!43657 m!37843))

(assert (=> b!43657 m!37159))

(declare-fun m!37845 () Bool)

(assert (=> b!43657 m!37845))

(assert (=> b!43659 m!37159))

(assert (=> b!43659 m!37159))

(assert (=> b!43659 m!37161))

(declare-fun m!37847 () Bool)

(assert (=> bm!3510 m!37847))

(assert (=> bm!3398 d!8111))

(declare-fun d!8115 () Bool)

(declare-fun res!25864 () Bool)

(declare-fun e!27670 () Bool)

(assert (=> d!8115 (=> res!25864 e!27670)))

(assert (=> d!8115 (= res!25864 (and ((_ is Cons!1185) (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!824 (h!1762 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!824 (head!887 (toList!611 lt!18340))))))))

(assert (=> d!8115 (= (containsKey!72 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)) (_1!824 (head!887 (toList!611 lt!18340)))) e!27670)))

(declare-fun b!43671 () Bool)

(declare-fun e!27671 () Bool)

(assert (=> b!43671 (= e!27670 e!27671)))

(declare-fun res!25865 () Bool)

(assert (=> b!43671 (=> (not res!25865) (not e!27671))))

(assert (=> b!43671 (= res!25865 (and (or (not ((_ is Cons!1185) (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)))) (bvsle (_1!824 (h!1762 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!824 (head!887 (toList!611 lt!18340))))) ((_ is Cons!1185) (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))) (bvslt (_1!824 (h!1762 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!824 (head!887 (toList!611 lt!18340))))))))

(declare-fun b!43672 () Bool)

(assert (=> b!43672 (= e!27671 (containsKey!72 (t!4185 (toList!611 (getCurrentListMap!339 lt!18338 lt!18341 mask!853 #b00000000000000000000000000000000 lt!18335 lt!18335 #b00000000000000000000000000000000 defaultEntry!470))) (_1!824 (head!887 (toList!611 lt!18340)))))))

(assert (= (and d!8115 (not res!25864)) b!43671))

(assert (= (and b!43671 res!25865) b!43672))

(declare-fun m!37851 () Bool)

(assert (=> b!43672 m!37851))

(assert (=> d!7879 d!8115))

(assert (=> d!7855 d!7843))

(declare-fun d!8121 () Bool)

(assert (=> d!8121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18338 mask!853)))

(assert (=> d!8121 true))

(declare-fun _$30!63 () Unit!1204)

(assert (=> d!8121 (= (choose!34 lt!18338 mask!853 #b00000000000000000000000000000000) _$30!63)))

(declare-fun bs!1979 () Bool)

(assert (= bs!1979 d!8121))

(assert (=> bs!1979 m!36801))

(assert (=> d!7855 d!8121))

(assert (=> d!7855 d!7875))

(assert (=> b!43265 d!7927))

(declare-fun b_lambda!2287 () Bool)

(assert (= b_lambda!2279 (or (and start!6460 b_free!1501) b_lambda!2287)))

(declare-fun b_lambda!2289 () Bool)

(assert (= b_lambda!2277 (or (and start!6460 b_free!1501) b_lambda!2289)))

(check-sat (not b!43290) (not b_next!1501) (not b!43366) (not d!8025) (not b!43473) (not d!7983) (not d!7969) (not b!43519) (not d!7935) (not b!43546) (not b_lambda!2271) (not b!43322) (not d!7941) (not d!7913) (not b!43647) (not d!7909) (not b!43363) (not b!43554) (not b!43472) (not d!8007) (not d!7977) (not b!43672) (not b!43299) (not b!43528) (not d!7917) (not b!43584) (not d!8017) (not d!7995) (not d!7957) (not b_lambda!2287) (not b!43445) (not d!7991) (not d!7925) (not b!43469) (not b!43470) (not b_lambda!2269) (not b!43306) (not bm!3490) (not d!7987) (not b!43443) (not b!43451) (not d!8005) (not bm!3480) (not b_lambda!2257) (not b!43279) (not d!7959) (not b!43315) (not b!43450) (not d!8021) (not bm!3510) (not d!7971) (not b!43280) (not d!7933) (not bm!3486) (not b!43326) (not b!43657) (not b!43353) (not b!43444) (not b!43308) (not b_lambda!2289) (not b!43448) (not b!43659) (not b!43313) (not bm!3487) (not b!43453) (not d!7973) (not b!43563) (not d!7965) (not b!43561) (not bm!3481) (not b!43305) (not b!43314) (not b!43547) (not bm!3483) (not b!43323) tp_is_empty!1891 (not b!43367) (not d!7963) (not b!43467) (not d!7929) (not d!7979) (not d!7955) (not b!43449) (not d!8107) (not d!8121) (not bm!3496) (not b!43524) (not d!7907) (not d!8013) (not b!43295) (not d!8035) b_and!2679 (not b!43527) (not d!8009) (not b!43297) (not b!43556) (not b!43471) (not b!43518) (not b!43526))
(check-sat b_and!2679 (not b_next!1501))
