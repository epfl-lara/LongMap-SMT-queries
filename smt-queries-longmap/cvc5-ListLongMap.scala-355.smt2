; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6652 () Bool)

(assert start!6652)

(declare-fun b_free!1507 () Bool)

(declare-fun b_next!1507 () Bool)

(assert (=> start!6652 (= b_free!1507 (not b_next!1507))))

(declare-fun tp!5948 () Bool)

(declare-fun b_and!2687 () Bool)

(assert (=> start!6652 (= tp!5948 b_and!2687)))

(declare-fun b!43852 () Bool)

(declare-fun e!27793 () Bool)

(declare-datatypes ((array!2939 0))(
  ( (array!2940 (arr!1413 (Array (_ BitVec 32) (_ BitVec 64))) (size!1610 (_ BitVec 32))) )
))
(declare-fun lt!19090 () array!2939)

(declare-datatypes ((V!2317 0))(
  ( (V!2318 (val!987 Int)) )
))
(declare-datatypes ((tuple2!1628 0))(
  ( (tuple2!1629 (_1!825 (_ BitVec 64)) (_2!825 V!2317)) )
))
(declare-fun lt!19082 () tuple2!1628)

(declare-fun arrayContainsKey!0 (array!2939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43852 (= e!27793 (arrayContainsKey!0 lt!19090 (_1!825 lt!19082) #b00000000000000000000000000000000))))

(declare-fun res!25940 () Bool)

(declare-fun e!27792 () Bool)

(assert (=> start!6652 (=> (not res!25940) (not e!27792))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6652 (= res!25940 (validMask!0 mask!853))))

(assert (=> start!6652 e!27792))

(assert (=> start!6652 true))

(assert (=> start!6652 tp!5948))

(declare-fun b!43850 () Bool)

(declare-fun res!25941 () Bool)

(declare-fun e!27791 () Bool)

(assert (=> b!43850 (=> res!25941 e!27791)))

(declare-datatypes ((List!1202 0))(
  ( (Nil!1199) (Cons!1198 (h!1775 tuple2!1628) (t!4211 List!1202)) )
))
(declare-datatypes ((ListLongMap!1205 0))(
  ( (ListLongMap!1206 (toList!618 List!1202)) )
))
(declare-fun lt!19086 () ListLongMap!1205)

(declare-fun isEmpty!285 (List!1202) Bool)

(assert (=> b!43850 (= res!25941 (isEmpty!285 (toList!618 lt!19086)))))

(declare-fun b!43849 () Bool)

(assert (=> b!43849 (= e!27792 (not e!27791))))

(declare-fun res!25939 () Bool)

(assert (=> b!43849 (=> res!25939 e!27791)))

(assert (=> b!43849 (= res!25939 (= lt!19086 (ListLongMap!1206 Nil!1199)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!19087 () V!2317)

(declare-datatypes ((ValueCell!701 0))(
  ( (ValueCellFull!701 (v!2083 V!2317)) (EmptyCell!701) )
))
(declare-datatypes ((array!2941 0))(
  ( (array!2942 (arr!1414 (Array (_ BitVec 32) ValueCell!701)) (size!1611 (_ BitVec 32))) )
))
(declare-fun lt!19084 () array!2941)

(declare-datatypes ((LongMapFixedSize!382 0))(
  ( (LongMapFixedSize!383 (defaultEntry!1890 Int) (mask!5456 (_ BitVec 32)) (extraKeys!1781 (_ BitVec 32)) (zeroValue!1808 V!2317) (minValue!1808 V!2317) (_size!240 (_ BitVec 32)) (_keys!3451 array!2939) (_values!1873 array!2941) (_vacant!240 (_ BitVec 32))) )
))
(declare-fun map!837 (LongMapFixedSize!382) ListLongMap!1205)

(assert (=> b!43849 (= lt!19086 (map!837 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1203 0))(
  ( (Nil!1200) (Cons!1199 (h!1776 (_ BitVec 64)) (t!4212 List!1203)) )
))
(declare-fun arrayNoDuplicates!0 (array!2939 (_ BitVec 32) List!1203) Bool)

(assert (=> b!43849 (arrayNoDuplicates!0 lt!19090 #b00000000000000000000000000000000 Nil!1200)))

(declare-datatypes ((Unit!1223 0))(
  ( (Unit!1224) )
))
(declare-fun lt!19083 () Unit!1223)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2939 (_ BitVec 32) (_ BitVec 32) List!1203) Unit!1223)

(assert (=> b!43849 (= lt!19083 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2939 (_ BitVec 32)) Bool)

(assert (=> b!43849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19090 mask!853)))

(declare-fun lt!19089 () Unit!1223)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2939 (_ BitVec 32) (_ BitVec 32)) Unit!1223)

(assert (=> b!43849 (= lt!19089 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19090 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2939 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43849 (= (arrayCountValidKeys!0 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19091 () Unit!1223)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2939 (_ BitVec 32) (_ BitVec 32)) Unit!1223)

(assert (=> b!43849 (= lt!19091 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43849 (= lt!19084 (array!2942 ((as const (Array (_ BitVec 32) ValueCell!701)) EmptyCell!701) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43849 (= lt!19090 (array!2940 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!262 (Int (_ BitVec 64)) V!2317)

(assert (=> b!43849 (= lt!19087 (dynLambda!262 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43851 () Bool)

(assert (=> b!43851 (= e!27791 false)))

(declare-fun lt!19085 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2939 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43851 (= lt!19085 (arrayScanForKey!0 lt!19090 (_1!825 lt!19082) #b00000000000000000000000000000000))))

(assert (=> b!43851 e!27793))

(declare-fun res!25938 () Bool)

(assert (=> b!43851 (=> (not res!25938) (not e!27793))))

(assert (=> b!43851 (= res!25938 (and (not (= (_1!825 lt!19082) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!825 lt!19082) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19088 () Unit!1223)

(declare-fun lemmaKeyInListMapIsInArray!103 (array!2939 array!2941 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 64) Int) Unit!1223)

(assert (=> b!43851 (= lt!19088 (lemmaKeyInListMapIsInArray!103 lt!19090 lt!19084 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 (_1!825 lt!19082) defaultEntry!470))))

(declare-fun head!890 (List!1202) tuple2!1628)

(assert (=> b!43851 (= lt!19082 (head!890 (toList!618 lt!19086)))))

(assert (= (and start!6652 res!25940) b!43849))

(assert (= (and b!43849 (not res!25939)) b!43850))

(assert (= (and b!43850 (not res!25941)) b!43851))

(assert (= (and b!43851 res!25938) b!43852))

(declare-fun b_lambda!2297 () Bool)

(assert (=> (not b_lambda!2297) (not b!43849)))

(declare-fun t!4210 () Bool)

(declare-fun tb!995 () Bool)

(assert (=> (and start!6652 (= defaultEntry!470 defaultEntry!470) t!4210) tb!995))

(declare-fun result!1735 () Bool)

(declare-fun tp_is_empty!1897 () Bool)

(assert (=> tb!995 (= result!1735 tp_is_empty!1897)))

(assert (=> b!43849 t!4210))

(declare-fun b_and!2689 () Bool)

(assert (= b_and!2687 (and (=> t!4210 result!1735) b_and!2689)))

(declare-fun m!38081 () Bool)

(assert (=> b!43851 m!38081))

(declare-fun m!38083 () Bool)

(assert (=> b!43851 m!38083))

(declare-fun m!38085 () Bool)

(assert (=> b!43851 m!38085))

(declare-fun m!38087 () Bool)

(assert (=> b!43852 m!38087))

(declare-fun m!38089 () Bool)

(assert (=> start!6652 m!38089))

(declare-fun m!38091 () Bool)

(assert (=> b!43850 m!38091))

(declare-fun m!38093 () Bool)

(assert (=> b!43849 m!38093))

(declare-fun m!38095 () Bool)

(assert (=> b!43849 m!38095))

(declare-fun m!38097 () Bool)

(assert (=> b!43849 m!38097))

(declare-fun m!38099 () Bool)

(assert (=> b!43849 m!38099))

(declare-fun m!38101 () Bool)

(assert (=> b!43849 m!38101))

(declare-fun m!38103 () Bool)

(assert (=> b!43849 m!38103))

(declare-fun m!38105 () Bool)

(assert (=> b!43849 m!38105))

(declare-fun m!38107 () Bool)

(assert (=> b!43849 m!38107))

(push 1)

(assert (not b_next!1507))

(assert (not b!43850))

(assert (not start!6652))

(assert tp_is_empty!1897)

(assert (not b_lambda!2297))

(assert (not b!43851))

(assert (not b!43849))

(assert (not b!43852))

(assert b_and!2689)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2689)

(assert (not b_next!1507))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2303 () Bool)

(assert (= b_lambda!2297 (or (and start!6652 b_free!1507) b_lambda!2303)))

(push 1)

(assert (not b_next!1507))

(assert (not b!43850))

(assert (not start!6652))

(assert tp_is_empty!1897)

(assert (not b_lambda!2303))

(assert (not b!43851))

(assert (not b!43849))

(assert (not b!43852))

(assert b_and!2689)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2689)

(assert (not b_next!1507))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8195 () Bool)

(assert (=> d!8195 (= (isEmpty!285 (toList!618 lt!19086)) (is-Nil!1199 (toList!618 lt!19086)))))

(assert (=> b!43850 d!8195))

(declare-fun d!8197 () Bool)

(assert (=> d!8197 (arrayNoDuplicates!0 lt!19090 #b00000000000000000000000000000000 Nil!1200)))

(declare-fun lt!19154 () Unit!1223)

(declare-fun choose!111 (array!2939 (_ BitVec 32) (_ BitVec 32) List!1203) Unit!1223)

(assert (=> d!8197 (= lt!19154 (choose!111 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1200))))

(assert (=> d!8197 (= (size!1610 lt!19090) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8197 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1200) lt!19154)))

(declare-fun bs!1989 () Bool)

(assert (= bs!1989 d!8197))

(assert (=> bs!1989 m!38105))

(declare-fun m!38165 () Bool)

(assert (=> bs!1989 m!38165))

(assert (=> b!43849 d!8197))

(declare-fun d!8201 () Bool)

(declare-fun res!25977 () Bool)

(declare-fun e!27826 () Bool)

(assert (=> d!8201 (=> res!25977 e!27826)))

(assert (=> d!8201 (= res!25977 (bvsge #b00000000000000000000000000000000 (size!1610 lt!19090)))))

(assert (=> d!8201 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19090 mask!853) e!27826)))

(declare-fun b!43899 () Bool)

(declare-fun e!27824 () Bool)

(declare-fun call!3527 () Bool)

(assert (=> b!43899 (= e!27824 call!3527)))

(declare-fun b!43900 () Bool)

(declare-fun e!27825 () Bool)

(assert (=> b!43900 (= e!27825 call!3527)))

(declare-fun b!43901 () Bool)

(assert (=> b!43901 (= e!27825 e!27824)))

(declare-fun lt!19161 () (_ BitVec 64))

(assert (=> b!43901 (= lt!19161 (select (arr!1413 lt!19090) #b00000000000000000000000000000000))))

(declare-fun lt!19162 () Unit!1223)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2939 (_ BitVec 64) (_ BitVec 32)) Unit!1223)

(assert (=> b!43901 (= lt!19162 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19090 lt!19161 #b00000000000000000000000000000000))))

(assert (=> b!43901 (arrayContainsKey!0 lt!19090 lt!19161 #b00000000000000000000000000000000)))

(declare-fun lt!19163 () Unit!1223)

(assert (=> b!43901 (= lt!19163 lt!19162)))

(declare-fun res!25976 () Bool)

(declare-datatypes ((SeekEntryResult!199 0))(
  ( (MissingZero!199 (index!2918 (_ BitVec 32))) (Found!199 (index!2919 (_ BitVec 32))) (Intermediate!199 (undefined!1011 Bool) (index!2920 (_ BitVec 32)) (x!8320 (_ BitVec 32))) (Undefined!199) (MissingVacant!199 (index!2921 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2939 (_ BitVec 32)) SeekEntryResult!199)

(assert (=> b!43901 (= res!25976 (= (seekEntryOrOpen!0 (select (arr!1413 lt!19090) #b00000000000000000000000000000000) lt!19090 mask!853) (Found!199 #b00000000000000000000000000000000)))))

(assert (=> b!43901 (=> (not res!25976) (not e!27824))))

(declare-fun b!43902 () Bool)

(assert (=> b!43902 (= e!27826 e!27825)))

(declare-fun c!5681 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!43902 (= c!5681 (validKeyInArray!0 (select (arr!1413 lt!19090) #b00000000000000000000000000000000)))))

(declare-fun bm!3524 () Bool)

(assert (=> bm!3524 (= call!3527 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19090 mask!853))))

(assert (= (and d!8201 (not res!25977)) b!43902))

(assert (= (and b!43902 c!5681) b!43901))

(assert (= (and b!43902 (not c!5681)) b!43900))

(assert (= (and b!43901 res!25976) b!43899))

(assert (= (or b!43899 b!43900) bm!3524))

(declare-fun m!38167 () Bool)

(assert (=> b!43901 m!38167))

(declare-fun m!38169 () Bool)

(assert (=> b!43901 m!38169))

(declare-fun m!38171 () Bool)

(assert (=> b!43901 m!38171))

(assert (=> b!43901 m!38167))

(declare-fun m!38173 () Bool)

(assert (=> b!43901 m!38173))

(assert (=> b!43902 m!38167))

(assert (=> b!43902 m!38167))

(declare-fun m!38175 () Bool)

(assert (=> b!43902 m!38175))

(declare-fun m!38177 () Bool)

(assert (=> bm!3524 m!38177))

(assert (=> b!43849 d!8201))

(declare-fun d!8209 () Bool)

(assert (=> d!8209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19090 mask!853)))

(declare-fun lt!19166 () Unit!1223)

(declare-fun choose!34 (array!2939 (_ BitVec 32) (_ BitVec 32)) Unit!1223)

(assert (=> d!8209 (= lt!19166 (choose!34 lt!19090 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8209 (validMask!0 mask!853)))

(assert (=> d!8209 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19090 mask!853 #b00000000000000000000000000000000) lt!19166)))

(declare-fun bs!1990 () Bool)

(assert (= bs!1990 d!8209))

(assert (=> bs!1990 m!38101))

(declare-fun m!38187 () Bool)

(assert (=> bs!1990 m!38187))

(assert (=> bs!1990 m!38089))

(assert (=> b!43849 d!8209))

(declare-fun d!8213 () Bool)

(declare-fun getCurrentListMap!352 (array!2939 array!2941 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 32) Int) ListLongMap!1205)

(assert (=> d!8213 (= (map!837 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000)) (getCurrentListMap!352 (_keys!3451 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000)) (_values!1873 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000)) (mask!5456 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000)) (extraKeys!1781 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000)) (zeroValue!1808 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000)) (minValue!1808 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1890 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 #b00000000000000000000000000000000 lt!19090 lt!19084 #b00000000000000000000000000000000))))))

(declare-fun bs!1993 () Bool)

(assert (= bs!1993 d!8213))

(declare-fun m!38201 () Bool)

(assert (=> bs!1993 m!38201))

(assert (=> b!43849 d!8213))

(declare-fun b!43957 () Bool)

(declare-fun e!27864 () (_ BitVec 32))

(assert (=> b!43957 (= e!27864 #b00000000000000000000000000000000)))

(declare-fun bm!3539 () Bool)

(declare-fun call!3542 () (_ BitVec 32))

(assert (=> bm!3539 (= call!3542 (arrayCountValidKeys!0 lt!19090 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!8221 () Bool)

(declare-fun lt!19193 () (_ BitVec 32))

(assert (=> d!8221 (and (bvsge lt!19193 #b00000000000000000000000000000000) (bvsle lt!19193 (bvsub (size!1610 lt!19090) #b00000000000000000000000000000000)))))

(assert (=> d!8221 (= lt!19193 e!27864)))

(declare-fun c!5702 () Bool)

(assert (=> d!8221 (= c!5702 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8221 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1610 lt!19090)))))

(assert (=> d!8221 (= (arrayCountValidKeys!0 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19193)))

(declare-fun b!43958 () Bool)

(declare-fun e!27865 () (_ BitVec 32))

(assert (=> b!43958 (= e!27865 (bvadd #b00000000000000000000000000000001 call!3542))))

(declare-fun b!43959 () Bool)

(assert (=> b!43959 (= e!27865 call!3542)))

(declare-fun b!43960 () Bool)

(assert (=> b!43960 (= e!27864 e!27865)))

(declare-fun c!5701 () Bool)

(assert (=> b!43960 (= c!5701 (validKeyInArray!0 (select (arr!1413 lt!19090) #b00000000000000000000000000000000)))))

(assert (= (and d!8221 c!5702) b!43957))

(assert (= (and d!8221 (not c!5702)) b!43960))

(assert (= (and b!43960 c!5701) b!43958))

(assert (= (and b!43960 (not c!5701)) b!43959))

(assert (= (or b!43958 b!43959) bm!3539))

(declare-fun m!38217 () Bool)

(assert (=> bm!3539 m!38217))

(assert (=> b!43960 m!38167))

(assert (=> b!43960 m!38167))

(assert (=> b!43960 m!38175))

(assert (=> b!43849 d!8221))

(declare-fun bm!3542 () Bool)

(declare-fun call!3545 () Bool)

(declare-fun c!5705 () Bool)

(assert (=> bm!3542 (= call!3545 (arrayNoDuplicates!0 lt!19090 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5705 (Cons!1199 (select (arr!1413 lt!19090) #b00000000000000000000000000000000) Nil!1200) Nil!1200)))))

(declare-fun b!43971 () Bool)

(declare-fun e!27877 () Bool)

(assert (=> b!43971 (= e!27877 call!3545)))

(declare-fun d!8231 () Bool)

(declare-fun res!26004 () Bool)

(declare-fun e!27875 () Bool)

(assert (=> d!8231 (=> res!26004 e!27875)))

(assert (=> d!8231 (= res!26004 (bvsge #b00000000000000000000000000000000 (size!1610 lt!19090)))))

(assert (=> d!8231 (= (arrayNoDuplicates!0 lt!19090 #b00000000000000000000000000000000 Nil!1200) e!27875)))

(declare-fun b!43972 () Bool)

(declare-fun e!27876 () Bool)

(assert (=> b!43972 (= e!27875 e!27876)))

(declare-fun res!26003 () Bool)

(assert (=> b!43972 (=> (not res!26003) (not e!27876))))

(declare-fun e!27874 () Bool)

(assert (=> b!43972 (= res!26003 (not e!27874))))

(declare-fun res!26002 () Bool)

(assert (=> b!43972 (=> (not res!26002) (not e!27874))))

(assert (=> b!43972 (= res!26002 (validKeyInArray!0 (select (arr!1413 lt!19090) #b00000000000000000000000000000000)))))

(declare-fun b!43973 () Bool)

(assert (=> b!43973 (= e!27876 e!27877)))

(assert (=> b!43973 (= c!5705 (validKeyInArray!0 (select (arr!1413 lt!19090) #b00000000000000000000000000000000)))))

(declare-fun b!43974 () Bool)

(assert (=> b!43974 (= e!27877 call!3545)))

(declare-fun b!43975 () Bool)

(declare-fun contains!573 (List!1203 (_ BitVec 64)) Bool)

(assert (=> b!43975 (= e!27874 (contains!573 Nil!1200 (select (arr!1413 lt!19090) #b00000000000000000000000000000000)))))

(assert (= (and d!8231 (not res!26004)) b!43972))

(assert (= (and b!43972 res!26002) b!43975))

(assert (= (and b!43972 res!26003) b!43973))

(assert (= (and b!43973 c!5705) b!43974))

(assert (= (and b!43973 (not c!5705)) b!43971))

(assert (= (or b!43974 b!43971) bm!3542))

(assert (=> bm!3542 m!38167))

(declare-fun m!38221 () Bool)

(assert (=> bm!3542 m!38221))

(assert (=> b!43972 m!38167))

(assert (=> b!43972 m!38167))

(assert (=> b!43972 m!38175))

(assert (=> b!43973 m!38167))

(assert (=> b!43973 m!38167))

(assert (=> b!43973 m!38175))

(assert (=> b!43975 m!38167))

(assert (=> b!43975 m!38167))

(declare-fun m!38223 () Bool)

(assert (=> b!43975 m!38223))

(assert (=> b!43849 d!8231))

(declare-fun d!8235 () Bool)

(assert (=> d!8235 (= (arrayCountValidKeys!0 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19199 () Unit!1223)

(declare-fun choose!59 (array!2939 (_ BitVec 32) (_ BitVec 32)) Unit!1223)

(assert (=> d!8235 (= lt!19199 (choose!59 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8235 (bvslt (size!1610 lt!19090) #b01111111111111111111111111111111)))

(assert (=> d!8235 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19199)))

(declare-fun bs!1998 () Bool)

(assert (= bs!1998 d!8235))

(assert (=> bs!1998 m!38097))

(declare-fun m!38227 () Bool)

(assert (=> bs!1998 m!38227))

(assert (=> b!43849 d!8235))

(declare-fun d!8239 () Bool)

(assert (=> d!8239 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6652 d!8239))

(declare-fun d!8249 () Bool)

(declare-fun lt!19221 () (_ BitVec 32))

(assert (=> d!8249 (and (or (bvslt lt!19221 #b00000000000000000000000000000000) (bvsge lt!19221 (size!1610 lt!19090)) (and (bvsge lt!19221 #b00000000000000000000000000000000) (bvslt lt!19221 (size!1610 lt!19090)))) (bvsge lt!19221 #b00000000000000000000000000000000) (bvslt lt!19221 (size!1610 lt!19090)) (= (select (arr!1413 lt!19090) lt!19221) (_1!825 lt!19082)))))

(declare-fun e!27905 () (_ BitVec 32))

(assert (=> d!8249 (= lt!19221 e!27905)))

(declare-fun c!5721 () Bool)

(assert (=> d!8249 (= c!5721 (= (select (arr!1413 lt!19090) #b00000000000000000000000000000000) (_1!825 lt!19082)))))

(assert (=> d!8249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1610 lt!19090)) (bvslt (size!1610 lt!19090) #b01111111111111111111111111111111))))

(assert (=> d!8249 (= (arrayScanForKey!0 lt!19090 (_1!825 lt!19082) #b00000000000000000000000000000000) lt!19221)))

(declare-fun b!44018 () Bool)

(assert (=> b!44018 (= e!27905 #b00000000000000000000000000000000)))

(declare-fun b!44019 () Bool)

(assert (=> b!44019 (= e!27905 (arrayScanForKey!0 lt!19090 (_1!825 lt!19082) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8249 c!5721) b!44018))

(assert (= (and d!8249 (not c!5721)) b!44019))

(declare-fun m!38245 () Bool)

(assert (=> d!8249 m!38245))

(assert (=> d!8249 m!38167))

(declare-fun m!38247 () Bool)

(assert (=> b!44019 m!38247))

(assert (=> b!43851 d!8249))

(declare-fun d!8255 () Bool)

(declare-fun e!27914 () Bool)

(assert (=> d!8255 e!27914))

(declare-fun c!5730 () Bool)

(assert (=> d!8255 (= c!5730 (and (not (= (_1!825 lt!19082) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!825 lt!19082) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19230 () Unit!1223)

(declare-fun choose!261 (array!2939 array!2941 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 64) Int) Unit!1223)

(assert (=> d!8255 (= lt!19230 (choose!261 lt!19090 lt!19084 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 (_1!825 lt!19082) defaultEntry!470))))

(assert (=> d!8255 (validMask!0 mask!853)))

(assert (=> d!8255 (= (lemmaKeyInListMapIsInArray!103 lt!19090 lt!19084 mask!853 #b00000000000000000000000000000000 lt!19087 lt!19087 (_1!825 lt!19082) defaultEntry!470) lt!19230)))

(declare-fun b!44036 () Bool)

(assert (=> b!44036 (= e!27914 (arrayContainsKey!0 lt!19090 (_1!825 lt!19082) #b00000000000000000000000000000000))))

(declare-fun b!44037 () Bool)

(assert (=> b!44037 (= e!27914 (ite (= (_1!825 lt!19082) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8255 c!5730) b!44036))

(assert (= (and d!8255 (not c!5730)) b!44037))

(declare-fun m!38257 () Bool)

(assert (=> d!8255 m!38257))

(assert (=> d!8255 m!38089))

(assert (=> b!44036 m!38087))

(assert (=> b!43851 d!8255))

(declare-fun d!8261 () Bool)

(assert (=> d!8261 (= (head!890 (toList!618 lt!19086)) (h!1775 (toList!618 lt!19086)))))

(assert (=> b!43851 d!8261))

(declare-fun d!8263 () Bool)

(declare-fun res!26021 () Bool)

(declare-fun e!27921 () Bool)

(assert (=> d!8263 (=> res!26021 e!27921)))

(assert (=> d!8263 (= res!26021 (= (select (arr!1413 lt!19090) #b00000000000000000000000000000000) (_1!825 lt!19082)))))

(assert (=> d!8263 (= (arrayContainsKey!0 lt!19090 (_1!825 lt!19082) #b00000000000000000000000000000000) e!27921)))

(declare-fun b!44046 () Bool)

(declare-fun e!27922 () Bool)

(assert (=> b!44046 (= e!27921 e!27922)))

(declare-fun res!26022 () Bool)

(assert (=> b!44046 (=> (not res!26022) (not e!27922))))

(assert (=> b!44046 (= res!26022 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1610 lt!19090)))))

(declare-fun b!44047 () Bool)

(assert (=> b!44047 (= e!27922 (arrayContainsKey!0 lt!19090 (_1!825 lt!19082) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8263 (not res!26021)) b!44046))

(assert (= (and b!44046 res!26022) b!44047))

(assert (=> d!8263 m!38167))

(declare-fun m!38263 () Bool)

(assert (=> b!44047 m!38263))

(assert (=> b!43852 d!8263))

(push 1)

