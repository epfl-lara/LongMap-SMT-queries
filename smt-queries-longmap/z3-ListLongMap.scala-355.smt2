; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6646 () Bool)

(assert start!6646)

(declare-fun b_free!1507 () Bool)

(declare-fun b_next!1507 () Bool)

(assert (=> start!6646 (= b_free!1507 (not b_next!1507))))

(declare-fun tp!5948 () Bool)

(declare-fun b_and!2689 () Bool)

(assert (=> start!6646 (= tp!5948 b_and!2689)))

(declare-fun b!43769 () Bool)

(declare-fun e!27739 () Bool)

(declare-fun e!27738 () Bool)

(assert (=> b!43769 (= e!27739 (not e!27738))))

(declare-fun res!25912 () Bool)

(assert (=> b!43769 (=> res!25912 e!27738)))

(declare-datatypes ((V!2317 0))(
  ( (V!2318 (val!987 Int)) )
))
(declare-datatypes ((tuple2!1632 0))(
  ( (tuple2!1633 (_1!827 (_ BitVec 64)) (_2!827 V!2317)) )
))
(declare-datatypes ((List!1195 0))(
  ( (Nil!1192) (Cons!1191 (h!1768 tuple2!1632) (t!4203 List!1195)) )
))
(declare-datatypes ((ListLongMap!1197 0))(
  ( (ListLongMap!1198 (toList!614 List!1195)) )
))
(declare-fun lt!19072 () ListLongMap!1197)

(assert (=> b!43769 (= res!25912 (= lt!19072 (ListLongMap!1198 Nil!1192)))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!19070 () V!2317)

(declare-datatypes ((ValueCell!701 0))(
  ( (ValueCellFull!701 (v!2081 V!2317)) (EmptyCell!701) )
))
(declare-datatypes ((array!2913 0))(
  ( (array!2914 (arr!1400 (Array (_ BitVec 32) ValueCell!701)) (size!1597 (_ BitVec 32))) )
))
(declare-fun lt!19065 () array!2913)

(declare-datatypes ((array!2915 0))(
  ( (array!2916 (arr!1401 (Array (_ BitVec 32) (_ BitVec 64))) (size!1598 (_ BitVec 32))) )
))
(declare-fun lt!19066 () array!2915)

(declare-datatypes ((LongMapFixedSize!382 0))(
  ( (LongMapFixedSize!383 (defaultEntry!1890 Int) (mask!5455 (_ BitVec 32)) (extraKeys!1781 (_ BitVec 32)) (zeroValue!1808 V!2317) (minValue!1808 V!2317) (_size!240 (_ BitVec 32)) (_keys!3450 array!2915) (_values!1873 array!2913) (_vacant!240 (_ BitVec 32))) )
))
(declare-fun map!838 (LongMapFixedSize!382) ListLongMap!1197)

(assert (=> b!43769 (= lt!19072 (map!838 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1196 0))(
  ( (Nil!1193) (Cons!1192 (h!1769 (_ BitVec 64)) (t!4204 List!1196)) )
))
(declare-fun arrayNoDuplicates!0 (array!2915 (_ BitVec 32) List!1196) Bool)

(assert (=> b!43769 (arrayNoDuplicates!0 lt!19066 #b00000000000000000000000000000000 Nil!1193)))

(declare-datatypes ((Unit!1228 0))(
  ( (Unit!1229) )
))
(declare-fun lt!19073 () Unit!1228)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2915 (_ BitVec 32) (_ BitVec 32) List!1196) Unit!1228)

(assert (=> b!43769 (= lt!19073 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2915 (_ BitVec 32)) Bool)

(assert (=> b!43769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19066 mask!853)))

(declare-fun lt!19067 () Unit!1228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1228)

(assert (=> b!43769 (= lt!19067 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19066 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43769 (= (arrayCountValidKeys!0 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19069 () Unit!1228)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1228)

(assert (=> b!43769 (= lt!19069 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43769 (= lt!19065 (array!2914 ((as const (Array (_ BitVec 32) ValueCell!701)) EmptyCell!701) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43769 (= lt!19066 (array!2916 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!261 (Int (_ BitVec 64)) V!2317)

(assert (=> b!43769 (= lt!19070 (dynLambda!261 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43770 () Bool)

(declare-fun res!25913 () Bool)

(assert (=> b!43770 (=> res!25913 e!27738)))

(declare-fun isEmpty!288 (List!1195) Bool)

(assert (=> b!43770 (= res!25913 (isEmpty!288 (toList!614 lt!19072)))))

(declare-fun b!43772 () Bool)

(declare-fun e!27740 () Bool)

(declare-fun lt!19071 () tuple2!1632)

(declare-fun arrayContainsKey!0 (array!2915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43772 (= e!27740 (arrayContainsKey!0 lt!19066 (_1!827 lt!19071) #b00000000000000000000000000000000))))

(declare-fun res!25914 () Bool)

(assert (=> start!6646 (=> (not res!25914) (not e!27739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6646 (= res!25914 (validMask!0 mask!853))))

(assert (=> start!6646 e!27739))

(assert (=> start!6646 true))

(assert (=> start!6646 tp!5948))

(declare-fun b!43771 () Bool)

(assert (=> b!43771 (= e!27738 false)))

(declare-fun lt!19068 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2915 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43771 (= lt!19068 (arrayScanForKey!0 lt!19066 (_1!827 lt!19071) #b00000000000000000000000000000000))))

(assert (=> b!43771 e!27740))

(declare-fun res!25915 () Bool)

(assert (=> b!43771 (=> (not res!25915) (not e!27740))))

(assert (=> b!43771 (= res!25915 (and (not (= (_1!827 lt!19071) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!827 lt!19071) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19064 () Unit!1228)

(declare-fun lemmaKeyInListMapIsInArray!109 (array!2915 array!2913 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 64) Int) Unit!1228)

(assert (=> b!43771 (= lt!19064 (lemmaKeyInListMapIsInArray!109 lt!19066 lt!19065 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 (_1!827 lt!19071) defaultEntry!470))))

(declare-fun head!890 (List!1195) tuple2!1632)

(assert (=> b!43771 (= lt!19071 (head!890 (toList!614 lt!19072)))))

(assert (= (and start!6646 res!25914) b!43769))

(assert (= (and b!43769 (not res!25912)) b!43770))

(assert (= (and b!43770 (not res!25913)) b!43771))

(assert (= (and b!43771 res!25915) b!43772))

(declare-fun b_lambda!2301 () Bool)

(assert (=> (not b_lambda!2301) (not b!43769)))

(declare-fun t!4202 () Bool)

(declare-fun tb!995 () Bool)

(assert (=> (and start!6646 (= defaultEntry!470 defaultEntry!470) t!4202) tb!995))

(declare-fun result!1735 () Bool)

(declare-fun tp_is_empty!1897 () Bool)

(assert (=> tb!995 (= result!1735 tp_is_empty!1897)))

(assert (=> b!43769 t!4202))

(declare-fun b_and!2691 () Bool)

(assert (= b_and!2689 (and (=> t!4202 result!1735) b_and!2691)))

(declare-fun m!37985 () Bool)

(assert (=> b!43770 m!37985))

(declare-fun m!37987 () Bool)

(assert (=> b!43772 m!37987))

(declare-fun m!37989 () Bool)

(assert (=> start!6646 m!37989))

(declare-fun m!37991 () Bool)

(assert (=> b!43769 m!37991))

(declare-fun m!37993 () Bool)

(assert (=> b!43769 m!37993))

(declare-fun m!37995 () Bool)

(assert (=> b!43769 m!37995))

(declare-fun m!37997 () Bool)

(assert (=> b!43769 m!37997))

(declare-fun m!37999 () Bool)

(assert (=> b!43769 m!37999))

(declare-fun m!38001 () Bool)

(assert (=> b!43769 m!38001))

(declare-fun m!38003 () Bool)

(assert (=> b!43769 m!38003))

(declare-fun m!38005 () Bool)

(assert (=> b!43769 m!38005))

(declare-fun m!38007 () Bool)

(assert (=> b!43771 m!38007))

(declare-fun m!38009 () Bool)

(assert (=> b!43771 m!38009))

(declare-fun m!38011 () Bool)

(assert (=> b!43771 m!38011))

(check-sat (not start!6646) (not b!43770) b_and!2691 (not b!43772) (not b_next!1507) (not b!43771) tp_is_empty!1897 (not b_lambda!2301) (not b!43769))
(check-sat b_and!2691 (not b_next!1507))
(get-model)

(declare-fun b_lambda!2311 () Bool)

(assert (= b_lambda!2301 (or (and start!6646 b_free!1507) b_lambda!2311)))

(check-sat (not start!6646) (not b!43770) b_and!2691 (not b!43772) (not b!43769) (not b_next!1507) (not b_lambda!2311) (not b!43771) tp_is_empty!1897)
(check-sat b_and!2691 (not b_next!1507))
(get-model)

(declare-fun d!8161 () Bool)

(assert (=> d!8161 (arrayNoDuplicates!0 lt!19066 #b00000000000000000000000000000000 Nil!1193)))

(declare-fun lt!19141 () Unit!1228)

(declare-fun choose!111 (array!2915 (_ BitVec 32) (_ BitVec 32) List!1196) Unit!1228)

(assert (=> d!8161 (= lt!19141 (choose!111 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1193))))

(assert (=> d!8161 (= (size!1598 lt!19066) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8161 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1193) lt!19141)))

(declare-fun bs!1988 () Bool)

(assert (= bs!1988 d!8161))

(assert (=> bs!1988 m!37995))

(declare-fun m!38075 () Bool)

(assert (=> bs!1988 m!38075))

(assert (=> b!43769 d!8161))

(declare-fun b!43829 () Bool)

(declare-fun e!27783 () Bool)

(declare-fun call!3526 () Bool)

(assert (=> b!43829 (= e!27783 call!3526)))

(declare-fun bm!3523 () Bool)

(declare-fun c!5656 () Bool)

(assert (=> bm!3523 (= call!3526 (arrayNoDuplicates!0 lt!19066 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5656 (Cons!1192 (select (arr!1401 lt!19066) #b00000000000000000000000000000000) Nil!1193) Nil!1193)))))

(declare-fun b!43831 () Bool)

(declare-fun e!27784 () Bool)

(declare-fun e!27782 () Bool)

(assert (=> b!43831 (= e!27784 e!27782)))

(declare-fun res!25960 () Bool)

(assert (=> b!43831 (=> (not res!25960) (not e!27782))))

(declare-fun e!27781 () Bool)

(assert (=> b!43831 (= res!25960 (not e!27781))))

(declare-fun res!25959 () Bool)

(assert (=> b!43831 (=> (not res!25959) (not e!27781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!43831 (= res!25959 (validKeyInArray!0 (select (arr!1401 lt!19066) #b00000000000000000000000000000000)))))

(declare-fun b!43832 () Bool)

(declare-fun contains!569 (List!1196 (_ BitVec 64)) Bool)

(assert (=> b!43832 (= e!27781 (contains!569 Nil!1193 (select (arr!1401 lt!19066) #b00000000000000000000000000000000)))))

(declare-fun b!43833 () Bool)

(assert (=> b!43833 (= e!27783 call!3526)))

(declare-fun d!8165 () Bool)

(declare-fun res!25958 () Bool)

(assert (=> d!8165 (=> res!25958 e!27784)))

(assert (=> d!8165 (= res!25958 (bvsge #b00000000000000000000000000000000 (size!1598 lt!19066)))))

(assert (=> d!8165 (= (arrayNoDuplicates!0 lt!19066 #b00000000000000000000000000000000 Nil!1193) e!27784)))

(declare-fun b!43830 () Bool)

(assert (=> b!43830 (= e!27782 e!27783)))

(assert (=> b!43830 (= c!5656 (validKeyInArray!0 (select (arr!1401 lt!19066) #b00000000000000000000000000000000)))))

(assert (= (and d!8165 (not res!25958)) b!43831))

(assert (= (and b!43831 res!25959) b!43832))

(assert (= (and b!43831 res!25960) b!43830))

(assert (= (and b!43830 c!5656) b!43829))

(assert (= (and b!43830 (not c!5656)) b!43833))

(assert (= (or b!43829 b!43833) bm!3523))

(declare-fun m!38081 () Bool)

(assert (=> bm!3523 m!38081))

(declare-fun m!38083 () Bool)

(assert (=> bm!3523 m!38083))

(assert (=> b!43831 m!38081))

(assert (=> b!43831 m!38081))

(declare-fun m!38085 () Bool)

(assert (=> b!43831 m!38085))

(assert (=> b!43832 m!38081))

(assert (=> b!43832 m!38081))

(declare-fun m!38089 () Bool)

(assert (=> b!43832 m!38089))

(assert (=> b!43830 m!38081))

(assert (=> b!43830 m!38081))

(assert (=> b!43830 m!38085))

(assert (=> b!43769 d!8165))

(declare-fun d!8173 () Bool)

(assert (=> d!8173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19066 mask!853)))

(declare-fun lt!19150 () Unit!1228)

(declare-fun choose!34 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1228)

(assert (=> d!8173 (= lt!19150 (choose!34 lt!19066 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8173 (validMask!0 mask!853)))

(assert (=> d!8173 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19066 mask!853 #b00000000000000000000000000000000) lt!19150)))

(declare-fun bs!1991 () Bool)

(assert (= bs!1991 d!8173))

(assert (=> bs!1991 m!37999))

(declare-fun m!38095 () Bool)

(assert (=> bs!1991 m!38095))

(assert (=> bs!1991 m!37989))

(assert (=> b!43769 d!8173))

(declare-fun d!8177 () Bool)

(declare-fun getCurrentListMap!342 (array!2915 array!2913 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 32) Int) ListLongMap!1197)

(assert (=> d!8177 (= (map!838 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000)) (getCurrentListMap!342 (_keys!3450 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000)) (_values!1873 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000)) (mask!5455 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000)) (extraKeys!1781 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000)) (zeroValue!1808 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000)) (minValue!1808 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1890 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 #b00000000000000000000000000000000 lt!19066 lt!19065 #b00000000000000000000000000000000))))))

(declare-fun bs!1993 () Bool)

(assert (= bs!1993 d!8177))

(declare-fun m!38107 () Bool)

(assert (=> bs!1993 m!38107))

(assert (=> b!43769 d!8177))

(declare-fun b!43874 () Bool)

(declare-fun e!27815 () Bool)

(declare-fun call!3536 () Bool)

(assert (=> b!43874 (= e!27815 call!3536)))

(declare-fun bm!3533 () Bool)

(assert (=> bm!3533 (= call!3536 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19066 mask!853))))

(declare-fun b!43875 () Bool)

(declare-fun e!27814 () Bool)

(assert (=> b!43875 (= e!27814 e!27815)))

(declare-fun lt!19168 () (_ BitVec 64))

(assert (=> b!43875 (= lt!19168 (select (arr!1401 lt!19066) #b00000000000000000000000000000000))))

(declare-fun lt!19169 () Unit!1228)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2915 (_ BitVec 64) (_ BitVec 32)) Unit!1228)

(assert (=> b!43875 (= lt!19169 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19066 lt!19168 #b00000000000000000000000000000000))))

(assert (=> b!43875 (arrayContainsKey!0 lt!19066 lt!19168 #b00000000000000000000000000000000)))

(declare-fun lt!19167 () Unit!1228)

(assert (=> b!43875 (= lt!19167 lt!19169)))

(declare-fun res!25978 () Bool)

(declare-datatypes ((SeekEntryResult!202 0))(
  ( (MissingZero!202 (index!2930 (_ BitVec 32))) (Found!202 (index!2931 (_ BitVec 32))) (Intermediate!202 (undefined!1014 Bool) (index!2932 (_ BitVec 32)) (x!8322 (_ BitVec 32))) (Undefined!202) (MissingVacant!202 (index!2933 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2915 (_ BitVec 32)) SeekEntryResult!202)

(assert (=> b!43875 (= res!25978 (= (seekEntryOrOpen!0 (select (arr!1401 lt!19066) #b00000000000000000000000000000000) lt!19066 mask!853) (Found!202 #b00000000000000000000000000000000)))))

(assert (=> b!43875 (=> (not res!25978) (not e!27815))))

(declare-fun b!43876 () Bool)

(assert (=> b!43876 (= e!27814 call!3536)))

(declare-fun b!43877 () Bool)

(declare-fun e!27813 () Bool)

(assert (=> b!43877 (= e!27813 e!27814)))

(declare-fun c!5669 () Bool)

(assert (=> b!43877 (= c!5669 (validKeyInArray!0 (select (arr!1401 lt!19066) #b00000000000000000000000000000000)))))

(declare-fun d!8183 () Bool)

(declare-fun res!25977 () Bool)

(assert (=> d!8183 (=> res!25977 e!27813)))

(assert (=> d!8183 (= res!25977 (bvsge #b00000000000000000000000000000000 (size!1598 lt!19066)))))

(assert (=> d!8183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19066 mask!853) e!27813)))

(assert (= (and d!8183 (not res!25977)) b!43877))

(assert (= (and b!43877 c!5669) b!43875))

(assert (= (and b!43877 (not c!5669)) b!43876))

(assert (= (and b!43875 res!25978) b!43874))

(assert (= (or b!43874 b!43876) bm!3533))

(declare-fun m!38119 () Bool)

(assert (=> bm!3533 m!38119))

(assert (=> b!43875 m!38081))

(declare-fun m!38121 () Bool)

(assert (=> b!43875 m!38121))

(declare-fun m!38123 () Bool)

(assert (=> b!43875 m!38123))

(assert (=> b!43875 m!38081))

(declare-fun m!38125 () Bool)

(assert (=> b!43875 m!38125))

(assert (=> b!43877 m!38081))

(assert (=> b!43877 m!38081))

(assert (=> b!43877 m!38085))

(assert (=> b!43769 d!8183))

(declare-fun d!8195 () Bool)

(assert (=> d!8195 (= (arrayCountValidKeys!0 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19172 () Unit!1228)

(declare-fun choose!59 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1228)

(assert (=> d!8195 (= lt!19172 (choose!59 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8195 (bvslt (size!1598 lt!19066) #b01111111111111111111111111111111)))

(assert (=> d!8195 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19172)))

(declare-fun bs!1998 () Bool)

(assert (= bs!1998 d!8195))

(assert (=> bs!1998 m!38003))

(declare-fun m!38127 () Bool)

(assert (=> bs!1998 m!38127))

(assert (=> b!43769 d!8195))

(declare-fun b!43910 () Bool)

(declare-fun e!27838 () (_ BitVec 32))

(assert (=> b!43910 (= e!27838 #b00000000000000000000000000000000)))

(declare-fun d!8197 () Bool)

(declare-fun lt!19193 () (_ BitVec 32))

(assert (=> d!8197 (and (bvsge lt!19193 #b00000000000000000000000000000000) (bvsle lt!19193 (bvsub (size!1598 lt!19066) #b00000000000000000000000000000000)))))

(assert (=> d!8197 (= lt!19193 e!27838)))

(declare-fun c!5681 () Bool)

(assert (=> d!8197 (= c!5681 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8197 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1598 lt!19066)))))

(assert (=> d!8197 (= (arrayCountValidKeys!0 lt!19066 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19193)))

(declare-fun b!43911 () Bool)

(declare-fun e!27839 () (_ BitVec 32))

(declare-fun call!3545 () (_ BitVec 32))

(assert (=> b!43911 (= e!27839 call!3545)))

(declare-fun b!43912 () Bool)

(assert (=> b!43912 (= e!27838 e!27839)))

(declare-fun c!5680 () Bool)

(assert (=> b!43912 (= c!5680 (validKeyInArray!0 (select (arr!1401 lt!19066) #b00000000000000000000000000000000)))))

(declare-fun bm!3542 () Bool)

(assert (=> bm!3542 (= call!3545 (arrayCountValidKeys!0 lt!19066 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!43913 () Bool)

(assert (=> b!43913 (= e!27839 (bvadd #b00000000000000000000000000000001 call!3545))))

(assert (= (and d!8197 c!5681) b!43910))

(assert (= (and d!8197 (not c!5681)) b!43912))

(assert (= (and b!43912 c!5680) b!43913))

(assert (= (and b!43912 (not c!5680)) b!43911))

(assert (= (or b!43913 b!43911) bm!3542))

(assert (=> b!43912 m!38081))

(assert (=> b!43912 m!38081))

(assert (=> b!43912 m!38085))

(declare-fun m!38145 () Bool)

(assert (=> bm!3542 m!38145))

(assert (=> b!43769 d!8197))

(declare-fun d!8203 () Bool)

(assert (=> d!8203 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6646 d!8203))

(declare-fun d!8215 () Bool)

(declare-fun res!26001 () Bool)

(declare-fun e!27856 () Bool)

(assert (=> d!8215 (=> res!26001 e!27856)))

(assert (=> d!8215 (= res!26001 (= (select (arr!1401 lt!19066) #b00000000000000000000000000000000) (_1!827 lt!19071)))))

(assert (=> d!8215 (= (arrayContainsKey!0 lt!19066 (_1!827 lt!19071) #b00000000000000000000000000000000) e!27856)))

(declare-fun b!43936 () Bool)

(declare-fun e!27857 () Bool)

(assert (=> b!43936 (= e!27856 e!27857)))

(declare-fun res!26002 () Bool)

(assert (=> b!43936 (=> (not res!26002) (not e!27857))))

(assert (=> b!43936 (= res!26002 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1598 lt!19066)))))

(declare-fun b!43937 () Bool)

(assert (=> b!43937 (= e!27857 (arrayContainsKey!0 lt!19066 (_1!827 lt!19071) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8215 (not res!26001)) b!43936))

(assert (= (and b!43936 res!26002) b!43937))

(assert (=> d!8215 m!38081))

(declare-fun m!38151 () Bool)

(assert (=> b!43937 m!38151))

(assert (=> b!43772 d!8215))

(declare-fun d!8217 () Bool)

(get-info :version)

(assert (=> d!8217 (= (isEmpty!288 (toList!614 lt!19072)) ((_ is Nil!1192) (toList!614 lt!19072)))))

(assert (=> b!43770 d!8217))

(declare-fun d!8219 () Bool)

(declare-fun lt!19207 () (_ BitVec 32))

(assert (=> d!8219 (and (or (bvslt lt!19207 #b00000000000000000000000000000000) (bvsge lt!19207 (size!1598 lt!19066)) (and (bvsge lt!19207 #b00000000000000000000000000000000) (bvslt lt!19207 (size!1598 lt!19066)))) (bvsge lt!19207 #b00000000000000000000000000000000) (bvslt lt!19207 (size!1598 lt!19066)) (= (select (arr!1401 lt!19066) lt!19207) (_1!827 lt!19071)))))

(declare-fun e!27866 () (_ BitVec 32))

(assert (=> d!8219 (= lt!19207 e!27866)))

(declare-fun c!5696 () Bool)

(assert (=> d!8219 (= c!5696 (= (select (arr!1401 lt!19066) #b00000000000000000000000000000000) (_1!827 lt!19071)))))

(assert (=> d!8219 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1598 lt!19066)) (bvslt (size!1598 lt!19066) #b01111111111111111111111111111111))))

(assert (=> d!8219 (= (arrayScanForKey!0 lt!19066 (_1!827 lt!19071) #b00000000000000000000000000000000) lt!19207)))

(declare-fun b!43956 () Bool)

(assert (=> b!43956 (= e!27866 #b00000000000000000000000000000000)))

(declare-fun b!43957 () Bool)

(assert (=> b!43957 (= e!27866 (arrayScanForKey!0 lt!19066 (_1!827 lt!19071) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8219 c!5696) b!43956))

(assert (= (and d!8219 (not c!5696)) b!43957))

(declare-fun m!38161 () Bool)

(assert (=> d!8219 m!38161))

(assert (=> d!8219 m!38081))

(declare-fun m!38163 () Bool)

(assert (=> b!43957 m!38163))

(assert (=> b!43771 d!8219))

(declare-fun d!8225 () Bool)

(declare-fun e!27875 () Bool)

(assert (=> d!8225 e!27875))

(declare-fun c!5705 () Bool)

(assert (=> d!8225 (= c!5705 (and (not (= (_1!827 lt!19071) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!827 lt!19071) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19214 () Unit!1228)

(declare-fun choose!268 (array!2915 array!2913 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 64) Int) Unit!1228)

(assert (=> d!8225 (= lt!19214 (choose!268 lt!19066 lt!19065 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 (_1!827 lt!19071) defaultEntry!470))))

(assert (=> d!8225 (validMask!0 mask!853)))

(assert (=> d!8225 (= (lemmaKeyInListMapIsInArray!109 lt!19066 lt!19065 mask!853 #b00000000000000000000000000000000 lt!19070 lt!19070 (_1!827 lt!19071) defaultEntry!470) lt!19214)))

(declare-fun b!43972 () Bool)

(assert (=> b!43972 (= e!27875 (arrayContainsKey!0 lt!19066 (_1!827 lt!19071) #b00000000000000000000000000000000))))

(declare-fun b!43973 () Bool)

(assert (=> b!43973 (= e!27875 (ite (= (_1!827 lt!19071) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8225 c!5705) b!43972))

(assert (= (and d!8225 (not c!5705)) b!43973))

(declare-fun m!38169 () Bool)

(assert (=> d!8225 m!38169))

(assert (=> d!8225 m!37989))

(assert (=> b!43972 m!37987))

(assert (=> b!43771 d!8225))

(declare-fun d!8231 () Bool)

(assert (=> d!8231 (= (head!890 (toList!614 lt!19072)) (h!1768 (toList!614 lt!19072)))))

(assert (=> b!43771 d!8231))

(check-sat (not d!8161) (not b!43937) (not bm!3542) (not b_next!1507) (not b_lambda!2311) (not d!8195) (not bm!3533) (not b!43831) (not b!43877) (not b!43830) (not b!43912) tp_is_empty!1897 (not b!43972) b_and!2691 (not d!8177) (not d!8173) (not b!43832) (not d!8225) (not b!43957) (not bm!3523) (not b!43875))
(check-sat b_and!2691 (not b_next!1507))
