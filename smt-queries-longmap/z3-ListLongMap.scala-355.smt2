; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6654 () Bool)

(assert start!6654)

(declare-fun b_free!1509 () Bool)

(declare-fun b_next!1509 () Bool)

(assert (=> start!6654 (= b_free!1509 (not b_next!1509))))

(declare-fun tp!5951 () Bool)

(declare-fun b_and!2691 () Bool)

(assert (=> start!6654 (= tp!5951 b_and!2691)))

(declare-fun b!43864 () Bool)

(declare-fun res!25952 () Bool)

(declare-fun e!27801 () Bool)

(assert (=> b!43864 (=> res!25952 e!27801)))

(declare-datatypes ((V!2319 0))(
  ( (V!2320 (val!988 Int)) )
))
(declare-datatypes ((tuple2!1630 0))(
  ( (tuple2!1631 (_1!826 (_ BitVec 64)) (_2!826 V!2319)) )
))
(declare-datatypes ((List!1204 0))(
  ( (Nil!1201) (Cons!1200 (h!1777 tuple2!1630) (t!4215 List!1204)) )
))
(declare-datatypes ((ListLongMap!1207 0))(
  ( (ListLongMap!1208 (toList!619 List!1204)) )
))
(declare-fun lt!19118 () ListLongMap!1207)

(declare-fun isEmpty!286 (List!1204) Bool)

(assert (=> b!43864 (= res!25952 (isEmpty!286 (toList!619 lt!19118)))))

(declare-fun b!43866 () Bool)

(declare-fun e!27800 () Bool)

(declare-datatypes ((array!2943 0))(
  ( (array!2944 (arr!1415 (Array (_ BitVec 32) (_ BitVec 64))) (size!1612 (_ BitVec 32))) )
))
(declare-fun lt!19112 () array!2943)

(declare-fun lt!19119 () tuple2!1630)

(declare-fun arrayContainsKey!0 (array!2943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43866 (= e!27800 (arrayContainsKey!0 lt!19112 (_1!826 lt!19119) #b00000000000000000000000000000000))))

(declare-fun res!25953 () Bool)

(declare-fun e!27802 () Bool)

(assert (=> start!6654 (=> (not res!25953) (not e!27802))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6654 (= res!25953 (validMask!0 mask!853))))

(assert (=> start!6654 e!27802))

(assert (=> start!6654 true))

(assert (=> start!6654 tp!5951))

(declare-fun b!43863 () Bool)

(assert (=> b!43863 (= e!27802 (not e!27801))))

(declare-fun res!25951 () Bool)

(assert (=> b!43863 (=> res!25951 e!27801)))

(assert (=> b!43863 (= res!25951 (= lt!19118 (ListLongMap!1208 Nil!1201)))))

(declare-fun lt!19121 () V!2319)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!702 0))(
  ( (ValueCellFull!702 (v!2084 V!2319)) (EmptyCell!702) )
))
(declare-datatypes ((array!2945 0))(
  ( (array!2946 (arr!1416 (Array (_ BitVec 32) ValueCell!702)) (size!1613 (_ BitVec 32))) )
))
(declare-fun lt!19117 () array!2945)

(declare-datatypes ((LongMapFixedSize!384 0))(
  ( (LongMapFixedSize!385 (defaultEntry!1891 Int) (mask!5457 (_ BitVec 32)) (extraKeys!1782 (_ BitVec 32)) (zeroValue!1809 V!2319) (minValue!1809 V!2319) (_size!241 (_ BitVec 32)) (_keys!3452 array!2943) (_values!1874 array!2945) (_vacant!241 (_ BitVec 32))) )
))
(declare-fun map!838 (LongMapFixedSize!384) ListLongMap!1207)

(assert (=> b!43863 (= lt!19118 (map!838 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1205 0))(
  ( (Nil!1202) (Cons!1201 (h!1778 (_ BitVec 64)) (t!4216 List!1205)) )
))
(declare-fun arrayNoDuplicates!0 (array!2943 (_ BitVec 32) List!1205) Bool)

(assert (=> b!43863 (arrayNoDuplicates!0 lt!19112 #b00000000000000000000000000000000 Nil!1202)))

(declare-datatypes ((Unit!1225 0))(
  ( (Unit!1226) )
))
(declare-fun lt!19114 () Unit!1225)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2943 (_ BitVec 32) (_ BitVec 32) List!1205) Unit!1225)

(assert (=> b!43863 (= lt!19114 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2943 (_ BitVec 32)) Bool)

(assert (=> b!43863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19112 mask!853)))

(declare-fun lt!19120 () Unit!1225)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2943 (_ BitVec 32) (_ BitVec 32)) Unit!1225)

(assert (=> b!43863 (= lt!19120 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19112 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2943 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43863 (= (arrayCountValidKeys!0 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19116 () Unit!1225)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2943 (_ BitVec 32) (_ BitVec 32)) Unit!1225)

(assert (=> b!43863 (= lt!19116 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43863 (= lt!19117 (array!2946 ((as const (Array (_ BitVec 32) ValueCell!702)) EmptyCell!702) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43863 (= lt!19112 (array!2944 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!263 (Int (_ BitVec 64)) V!2319)

(assert (=> b!43863 (= lt!19121 (dynLambda!263 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43865 () Bool)

(assert (=> b!43865 (= e!27801 false)))

(declare-fun lt!19113 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2943 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43865 (= lt!19113 (arrayScanForKey!0 lt!19112 (_1!826 lt!19119) #b00000000000000000000000000000000))))

(assert (=> b!43865 e!27800))

(declare-fun res!25950 () Bool)

(assert (=> b!43865 (=> (not res!25950) (not e!27800))))

(assert (=> b!43865 (= res!25950 (and (not (= (_1!826 lt!19119) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!826 lt!19119) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19115 () Unit!1225)

(declare-fun lemmaKeyInListMapIsInArray!104 (array!2943 array!2945 (_ BitVec 32) (_ BitVec 32) V!2319 V!2319 (_ BitVec 64) Int) Unit!1225)

(assert (=> b!43865 (= lt!19115 (lemmaKeyInListMapIsInArray!104 lt!19112 lt!19117 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 (_1!826 lt!19119) defaultEntry!470))))

(declare-fun head!891 (List!1204) tuple2!1630)

(assert (=> b!43865 (= lt!19119 (head!891 (toList!619 lt!19118)))))

(assert (= (and start!6654 res!25953) b!43863))

(assert (= (and b!43863 (not res!25951)) b!43864))

(assert (= (and b!43864 (not res!25952)) b!43865))

(assert (= (and b!43865 res!25950) b!43866))

(declare-fun b_lambda!2299 () Bool)

(assert (=> (not b_lambda!2299) (not b!43863)))

(declare-fun t!4214 () Bool)

(declare-fun tb!997 () Bool)

(assert (=> (and start!6654 (= defaultEntry!470 defaultEntry!470) t!4214) tb!997))

(declare-fun result!1739 () Bool)

(declare-fun tp_is_empty!1899 () Bool)

(assert (=> tb!997 (= result!1739 tp_is_empty!1899)))

(assert (=> b!43863 t!4214))

(declare-fun b_and!2693 () Bool)

(assert (= b_and!2691 (and (=> t!4214 result!1739) b_and!2693)))

(declare-fun m!38109 () Bool)

(assert (=> b!43865 m!38109))

(declare-fun m!38111 () Bool)

(assert (=> b!43865 m!38111))

(declare-fun m!38113 () Bool)

(assert (=> b!43865 m!38113))

(declare-fun m!38115 () Bool)

(assert (=> b!43863 m!38115))

(declare-fun m!38117 () Bool)

(assert (=> b!43863 m!38117))

(declare-fun m!38119 () Bool)

(assert (=> b!43863 m!38119))

(declare-fun m!38121 () Bool)

(assert (=> b!43863 m!38121))

(declare-fun m!38123 () Bool)

(assert (=> b!43863 m!38123))

(declare-fun m!38125 () Bool)

(assert (=> b!43863 m!38125))

(declare-fun m!38127 () Bool)

(assert (=> b!43863 m!38127))

(declare-fun m!38129 () Bool)

(assert (=> b!43863 m!38129))

(declare-fun m!38131 () Bool)

(assert (=> b!43866 m!38131))

(declare-fun m!38133 () Bool)

(assert (=> b!43864 m!38133))

(declare-fun m!38135 () Bool)

(assert (=> start!6654 m!38135))

(check-sat (not b!43866) b_and!2693 (not b!43863) (not start!6654) tp_is_empty!1899 (not b_lambda!2299) (not b!43864) (not b!43865) (not b_next!1509))
(check-sat b_and!2693 (not b_next!1509))
(get-model)

(declare-fun b_lambda!2307 () Bool)

(assert (= b_lambda!2299 (or (and start!6654 b_free!1509) b_lambda!2307)))

(check-sat (not b!43866) (not b!43864) b_and!2693 (not b!43863) (not b_lambda!2307) (not start!6654) tp_is_empty!1899 (not b!43865) (not b_next!1509))
(check-sat b_and!2693 (not b_next!1509))
(get-model)

(declare-fun d!8203 () Bool)

(assert (=> d!8203 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6654 d!8203))

(declare-fun b!43920 () Bool)

(declare-fun e!27842 () Bool)

(declare-fun e!27841 () Bool)

(assert (=> b!43920 (= e!27842 e!27841)))

(declare-fun res!25987 () Bool)

(assert (=> b!43920 (=> (not res!25987) (not e!27841))))

(declare-fun e!27843 () Bool)

(assert (=> b!43920 (= res!25987 (not e!27843))))

(declare-fun res!25988 () Bool)

(assert (=> b!43920 (=> (not res!25988) (not e!27843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!43920 (= res!25988 (validKeyInArray!0 (select (arr!1415 lt!19112) #b00000000000000000000000000000000)))))

(declare-fun b!43921 () Bool)

(declare-fun e!27844 () Bool)

(declare-fun call!3533 () Bool)

(assert (=> b!43921 (= e!27844 call!3533)))

(declare-fun d!8207 () Bool)

(declare-fun res!25989 () Bool)

(assert (=> d!8207 (=> res!25989 e!27842)))

(assert (=> d!8207 (= res!25989 (bvsge #b00000000000000000000000000000000 (size!1612 lt!19112)))))

(assert (=> d!8207 (= (arrayNoDuplicates!0 lt!19112 #b00000000000000000000000000000000 Nil!1202) e!27842)))

(declare-fun b!43922 () Bool)

(assert (=> b!43922 (= e!27841 e!27844)))

(declare-fun c!5687 () Bool)

(assert (=> b!43922 (= c!5687 (validKeyInArray!0 (select (arr!1415 lt!19112) #b00000000000000000000000000000000)))))

(declare-fun b!43923 () Bool)

(declare-fun contains!572 (List!1205 (_ BitVec 64)) Bool)

(assert (=> b!43923 (= e!27843 (contains!572 Nil!1202 (select (arr!1415 lt!19112) #b00000000000000000000000000000000)))))

(declare-fun bm!3530 () Bool)

(assert (=> bm!3530 (= call!3533 (arrayNoDuplicates!0 lt!19112 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5687 (Cons!1201 (select (arr!1415 lt!19112) #b00000000000000000000000000000000) Nil!1202) Nil!1202)))))

(declare-fun b!43924 () Bool)

(assert (=> b!43924 (= e!27844 call!3533)))

(assert (= (and d!8207 (not res!25989)) b!43920))

(assert (= (and b!43920 res!25988) b!43923))

(assert (= (and b!43920 res!25987) b!43922))

(assert (= (and b!43922 c!5687) b!43921))

(assert (= (and b!43922 (not c!5687)) b!43924))

(assert (= (or b!43921 b!43924) bm!3530))

(declare-fun m!38191 () Bool)

(assert (=> b!43920 m!38191))

(assert (=> b!43920 m!38191))

(declare-fun m!38193 () Bool)

(assert (=> b!43920 m!38193))

(assert (=> b!43922 m!38191))

(assert (=> b!43922 m!38191))

(assert (=> b!43922 m!38193))

(assert (=> b!43923 m!38191))

(assert (=> b!43923 m!38191))

(declare-fun m!38195 () Bool)

(assert (=> b!43923 m!38195))

(assert (=> bm!3530 m!38191))

(declare-fun m!38197 () Bool)

(assert (=> bm!3530 m!38197))

(assert (=> b!43863 d!8207))

(declare-fun bm!3535 () Bool)

(declare-fun call!3538 () Bool)

(assert (=> bm!3535 (= call!3538 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19112 mask!853))))

(declare-fun b!43941 () Bool)

(declare-fun e!27856 () Bool)

(declare-fun e!27855 () Bool)

(assert (=> b!43941 (= e!27856 e!27855)))

(declare-fun lt!19183 () (_ BitVec 64))

(assert (=> b!43941 (= lt!19183 (select (arr!1415 lt!19112) #b00000000000000000000000000000000))))

(declare-fun lt!19181 () Unit!1225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2943 (_ BitVec 64) (_ BitVec 32)) Unit!1225)

(assert (=> b!43941 (= lt!19181 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19112 lt!19183 #b00000000000000000000000000000000))))

(assert (=> b!43941 (arrayContainsKey!0 lt!19112 lt!19183 #b00000000000000000000000000000000)))

(declare-fun lt!19182 () Unit!1225)

(assert (=> b!43941 (= lt!19182 lt!19181)))

(declare-fun res!25994 () Bool)

(declare-datatypes ((SeekEntryResult!200 0))(
  ( (MissingZero!200 (index!2922 (_ BitVec 32))) (Found!200 (index!2923 (_ BitVec 32))) (Intermediate!200 (undefined!1012 Bool) (index!2924 (_ BitVec 32)) (x!8321 (_ BitVec 32))) (Undefined!200) (MissingVacant!200 (index!2925 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2943 (_ BitVec 32)) SeekEntryResult!200)

(assert (=> b!43941 (= res!25994 (= (seekEntryOrOpen!0 (select (arr!1415 lt!19112) #b00000000000000000000000000000000) lt!19112 mask!853) (Found!200 #b00000000000000000000000000000000)))))

(assert (=> b!43941 (=> (not res!25994) (not e!27855))))

(declare-fun d!8217 () Bool)

(declare-fun res!25995 () Bool)

(declare-fun e!27857 () Bool)

(assert (=> d!8217 (=> res!25995 e!27857)))

(assert (=> d!8217 (= res!25995 (bvsge #b00000000000000000000000000000000 (size!1612 lt!19112)))))

(assert (=> d!8217 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19112 mask!853) e!27857)))

(declare-fun b!43942 () Bool)

(assert (=> b!43942 (= e!27856 call!3538)))

(declare-fun b!43943 () Bool)

(assert (=> b!43943 (= e!27855 call!3538)))

(declare-fun b!43944 () Bool)

(assert (=> b!43944 (= e!27857 e!27856)))

(declare-fun c!5694 () Bool)

(assert (=> b!43944 (= c!5694 (validKeyInArray!0 (select (arr!1415 lt!19112) #b00000000000000000000000000000000)))))

(assert (= (and d!8217 (not res!25995)) b!43944))

(assert (= (and b!43944 c!5694) b!43941))

(assert (= (and b!43944 (not c!5694)) b!43942))

(assert (= (and b!43941 res!25994) b!43943))

(assert (= (or b!43943 b!43942) bm!3535))

(declare-fun m!38203 () Bool)

(assert (=> bm!3535 m!38203))

(assert (=> b!43941 m!38191))

(declare-fun m!38205 () Bool)

(assert (=> b!43941 m!38205))

(declare-fun m!38207 () Bool)

(assert (=> b!43941 m!38207))

(assert (=> b!43941 m!38191))

(declare-fun m!38209 () Bool)

(assert (=> b!43941 m!38209))

(assert (=> b!43944 m!38191))

(assert (=> b!43944 m!38191))

(assert (=> b!43944 m!38193))

(assert (=> b!43863 d!8217))

(declare-fun d!8223 () Bool)

(assert (=> d!8223 (= (arrayCountValidKeys!0 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19189 () Unit!1225)

(declare-fun choose!59 (array!2943 (_ BitVec 32) (_ BitVec 32)) Unit!1225)

(assert (=> d!8223 (= lt!19189 (choose!59 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8223 (bvslt (size!1612 lt!19112) #b01111111111111111111111111111111)))

(assert (=> d!8223 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19189)))

(declare-fun bs!1994 () Bool)

(assert (= bs!1994 d!8223))

(assert (=> bs!1994 m!38119))

(declare-fun m!38213 () Bool)

(assert (=> bs!1994 m!38213))

(assert (=> b!43863 d!8223))

(declare-fun d!8227 () Bool)

(assert (=> d!8227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19112 mask!853)))

(declare-fun lt!19196 () Unit!1225)

(declare-fun choose!34 (array!2943 (_ BitVec 32) (_ BitVec 32)) Unit!1225)

(assert (=> d!8227 (= lt!19196 (choose!34 lt!19112 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8227 (validMask!0 mask!853)))

(assert (=> d!8227 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19112 mask!853 #b00000000000000000000000000000000) lt!19196)))

(declare-fun bs!1996 () Bool)

(assert (= bs!1996 d!8227))

(assert (=> bs!1996 m!38127))

(declare-fun m!38219 () Bool)

(assert (=> bs!1996 m!38219))

(assert (=> bs!1996 m!38135))

(assert (=> b!43863 d!8227))

(declare-fun d!8233 () Bool)

(declare-fun getCurrentListMap!353 (array!2943 array!2945 (_ BitVec 32) (_ BitVec 32) V!2319 V!2319 (_ BitVec 32) Int) ListLongMap!1207)

(assert (=> d!8233 (= (map!838 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000)) (getCurrentListMap!353 (_keys!3452 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000)) (_values!1874 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000)) (mask!5457 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000)) (extraKeys!1782 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000)) (zeroValue!1809 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000)) (minValue!1809 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1891 (LongMapFixedSize!385 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 #b00000000000000000000000000000000 lt!19112 lt!19117 #b00000000000000000000000000000000))))))

(declare-fun bs!1999 () Bool)

(assert (= bs!1999 d!8233))

(declare-fun m!38229 () Bool)

(assert (=> bs!1999 m!38229))

(assert (=> b!43863 d!8233))

(declare-fun d!8241 () Bool)

(assert (=> d!8241 (arrayNoDuplicates!0 lt!19112 #b00000000000000000000000000000000 Nil!1202)))

(declare-fun lt!19202 () Unit!1225)

(declare-fun choose!111 (array!2943 (_ BitVec 32) (_ BitVec 32) List!1205) Unit!1225)

(assert (=> d!8241 (= lt!19202 (choose!111 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1202))))

(assert (=> d!8241 (= (size!1612 lt!19112) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8241 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1202) lt!19202)))

(declare-fun bs!2000 () Bool)

(assert (= bs!2000 d!8241))

(assert (=> bs!2000 m!38123))

(declare-fun m!38231 () Bool)

(assert (=> bs!2000 m!38231))

(assert (=> b!43863 d!8241))

(declare-fun b!44000 () Bool)

(declare-fun e!27895 () (_ BitVec 32))

(declare-fun e!27896 () (_ BitVec 32))

(assert (=> b!44000 (= e!27895 e!27896)))

(declare-fun c!5714 () Bool)

(assert (=> b!44000 (= c!5714 (validKeyInArray!0 (select (arr!1415 lt!19112) #b00000000000000000000000000000000)))))

(declare-fun b!44001 () Bool)

(assert (=> b!44001 (= e!27895 #b00000000000000000000000000000000)))

(declare-fun b!44002 () Bool)

(declare-fun call!3551 () (_ BitVec 32))

(assert (=> b!44002 (= e!27896 (bvadd #b00000000000000000000000000000001 call!3551))))

(declare-fun b!44003 () Bool)

(assert (=> b!44003 (= e!27896 call!3551)))

(declare-fun bm!3548 () Bool)

(assert (=> bm!3548 (= call!3551 (arrayCountValidKeys!0 lt!19112 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!8243 () Bool)

(declare-fun lt!19214 () (_ BitVec 32))

(assert (=> d!8243 (and (bvsge lt!19214 #b00000000000000000000000000000000) (bvsle lt!19214 (bvsub (size!1612 lt!19112) #b00000000000000000000000000000000)))))

(assert (=> d!8243 (= lt!19214 e!27895)))

(declare-fun c!5713 () Bool)

(assert (=> d!8243 (= c!5713 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8243 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1612 lt!19112)))))

(assert (=> d!8243 (= (arrayCountValidKeys!0 lt!19112 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19214)))

(assert (= (and d!8243 c!5713) b!44001))

(assert (= (and d!8243 (not c!5713)) b!44000))

(assert (= (and b!44000 c!5714) b!44002))

(assert (= (and b!44000 (not c!5714)) b!44003))

(assert (= (or b!44002 b!44003) bm!3548))

(assert (=> b!44000 m!38191))

(assert (=> b!44000 m!38191))

(assert (=> b!44000 m!38193))

(declare-fun m!38241 () Bool)

(assert (=> bm!3548 m!38241))

(assert (=> b!43863 d!8243))

(declare-fun d!8251 () Bool)

(declare-fun lt!19222 () (_ BitVec 32))

(assert (=> d!8251 (and (or (bvslt lt!19222 #b00000000000000000000000000000000) (bvsge lt!19222 (size!1612 lt!19112)) (and (bvsge lt!19222 #b00000000000000000000000000000000) (bvslt lt!19222 (size!1612 lt!19112)))) (bvsge lt!19222 #b00000000000000000000000000000000) (bvslt lt!19222 (size!1612 lt!19112)) (= (select (arr!1415 lt!19112) lt!19222) (_1!826 lt!19119)))))

(declare-fun e!27906 () (_ BitVec 32))

(assert (=> d!8251 (= lt!19222 e!27906)))

(declare-fun c!5722 () Bool)

(assert (=> d!8251 (= c!5722 (= (select (arr!1415 lt!19112) #b00000000000000000000000000000000) (_1!826 lt!19119)))))

(assert (=> d!8251 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1612 lt!19112)) (bvslt (size!1612 lt!19112) #b01111111111111111111111111111111))))

(assert (=> d!8251 (= (arrayScanForKey!0 lt!19112 (_1!826 lt!19119) #b00000000000000000000000000000000) lt!19222)))

(declare-fun b!44020 () Bool)

(assert (=> b!44020 (= e!27906 #b00000000000000000000000000000000)))

(declare-fun b!44022 () Bool)

(assert (=> b!44022 (= e!27906 (arrayScanForKey!0 lt!19112 (_1!826 lt!19119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8251 c!5722) b!44020))

(assert (= (and d!8251 (not c!5722)) b!44022))

(declare-fun m!38251 () Bool)

(assert (=> d!8251 m!38251))

(assert (=> d!8251 m!38191))

(declare-fun m!38255 () Bool)

(assert (=> b!44022 m!38255))

(assert (=> b!43865 d!8251))

(declare-fun d!8258 () Bool)

(declare-fun e!27915 () Bool)

(assert (=> d!8258 e!27915))

(declare-fun c!5731 () Bool)

(assert (=> d!8258 (= c!5731 (and (not (= (_1!826 lt!19119) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!826 lt!19119) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19231 () Unit!1225)

(declare-fun choose!260 (array!2943 array!2945 (_ BitVec 32) (_ BitVec 32) V!2319 V!2319 (_ BitVec 64) Int) Unit!1225)

(assert (=> d!8258 (= lt!19231 (choose!260 lt!19112 lt!19117 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 (_1!826 lt!19119) defaultEntry!470))))

(assert (=> d!8258 (validMask!0 mask!853)))

(assert (=> d!8258 (= (lemmaKeyInListMapIsInArray!104 lt!19112 lt!19117 mask!853 #b00000000000000000000000000000000 lt!19121 lt!19121 (_1!826 lt!19119) defaultEntry!470) lt!19231)))

(declare-fun b!44038 () Bool)

(assert (=> b!44038 (= e!27915 (arrayContainsKey!0 lt!19112 (_1!826 lt!19119) #b00000000000000000000000000000000))))

(declare-fun b!44039 () Bool)

(assert (=> b!44039 (= e!27915 (ite (= (_1!826 lt!19119) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8258 c!5731) b!44038))

(assert (= (and d!8258 (not c!5731)) b!44039))

(declare-fun m!38261 () Bool)

(assert (=> d!8258 m!38261))

(assert (=> d!8258 m!38135))

(assert (=> b!44038 m!38131))

(assert (=> b!43865 d!8258))

(declare-fun d!8267 () Bool)

(assert (=> d!8267 (= (head!891 (toList!619 lt!19118)) (h!1777 (toList!619 lt!19118)))))

(assert (=> b!43865 d!8267))

(declare-fun d!8269 () Bool)

(get-info :version)

(assert (=> d!8269 (= (isEmpty!286 (toList!619 lt!19118)) ((_ is Nil!1201) (toList!619 lt!19118)))))

(assert (=> b!43864 d!8269))

(declare-fun d!8271 () Bool)

(declare-fun res!26027 () Bool)

(declare-fun e!27927 () Bool)

(assert (=> d!8271 (=> res!26027 e!27927)))

(assert (=> d!8271 (= res!26027 (= (select (arr!1415 lt!19112) #b00000000000000000000000000000000) (_1!826 lt!19119)))))

(assert (=> d!8271 (= (arrayContainsKey!0 lt!19112 (_1!826 lt!19119) #b00000000000000000000000000000000) e!27927)))

(declare-fun b!44052 () Bool)

(declare-fun e!27928 () Bool)

(assert (=> b!44052 (= e!27927 e!27928)))

(declare-fun res!26028 () Bool)

(assert (=> b!44052 (=> (not res!26028) (not e!27928))))

(assert (=> b!44052 (= res!26028 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1612 lt!19112)))))

(declare-fun b!44053 () Bool)

(assert (=> b!44053 (= e!27928 (arrayContainsKey!0 lt!19112 (_1!826 lt!19119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8271 (not res!26027)) b!44052))

(assert (= (and b!44052 res!26028) b!44053))

(assert (=> d!8271 m!38191))

(declare-fun m!38265 () Bool)

(assert (=> b!44053 m!38265))

(assert (=> b!43866 d!8271))

(check-sat (not d!8233) (not d!8258) (not b!44022) (not b!44038) (not b!43923) (not d!8223) (not b!43920) b_and!2693 (not b_next!1509) (not bm!3535) (not bm!3548) tp_is_empty!1899 (not b!43922) (not d!8241) (not b!44000) (not b_lambda!2307) (not bm!3530) (not b!44053) (not d!8227) (not b!43944) (not b!43941))
(check-sat b_and!2693 (not b_next!1509))
