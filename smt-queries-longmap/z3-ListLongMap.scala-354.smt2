; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6470 () Bool)

(assert start!6470)

(declare-fun b_free!1501 () Bool)

(declare-fun b_next!1501 () Bool)

(assert (=> start!6470 (= b_free!1501 (not b_next!1501))))

(declare-fun tp!5939 () Bool)

(declare-fun b_and!2649 () Bool)

(assert (=> start!6470 (= tp!5939 b_and!2649)))

(declare-fun b!42931 () Bool)

(declare-fun e!27210 () Bool)

(declare-fun e!27209 () Bool)

(assert (=> b!42931 (= e!27210 (not e!27209))))

(declare-fun res!25517 () Bool)

(assert (=> b!42931 (=> res!25517 e!27209)))

(declare-datatypes ((V!2309 0))(
  ( (V!2310 (val!984 Int)) )
))
(declare-datatypes ((tuple2!1604 0))(
  ( (tuple2!1605 (_1!813 (_ BitVec 64)) (_2!813 V!2309)) )
))
(declare-datatypes ((List!1182 0))(
  ( (Nil!1179) (Cons!1178 (h!1755 tuple2!1604) (t!4179 List!1182)) )
))
(declare-datatypes ((ListLongMap!1175 0))(
  ( (ListLongMap!1176 (toList!603 List!1182)) )
))
(declare-fun lt!18316 () ListLongMap!1175)

(assert (=> b!42931 (= res!25517 (= lt!18316 (ListLongMap!1176 Nil!1179)))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!698 0))(
  ( (ValueCellFull!698 (v!2075 V!2309)) (EmptyCell!698) )
))
(declare-datatypes ((array!2913 0))(
  ( (array!2914 (arr!1400 (Array (_ BitVec 32) ValueCell!698)) (size!1585 (_ BitVec 32))) )
))
(declare-fun lt!18313 () array!2913)

(declare-fun lt!18312 () V!2309)

(declare-datatypes ((array!2915 0))(
  ( (array!2916 (arr!1401 (Array (_ BitVec 32) (_ BitVec 64))) (size!1586 (_ BitVec 32))) )
))
(declare-fun lt!18314 () array!2915)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((LongMapFixedSize!376 0))(
  ( (LongMapFixedSize!377 (defaultEntry!1881 Int) (mask!5430 (_ BitVec 32)) (extraKeys!1772 (_ BitVec 32)) (zeroValue!1799 V!2309) (minValue!1799 V!2309) (_size!237 (_ BitVec 32)) (_keys!3430 array!2915) (_values!1864 array!2913) (_vacant!237 (_ BitVec 32))) )
))
(declare-fun map!832 (LongMapFixedSize!376) ListLongMap!1175)

(assert (=> b!42931 (= lt!18316 (map!832 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1183 0))(
  ( (Nil!1180) (Cons!1179 (h!1756 (_ BitVec 64)) (t!4180 List!1183)) )
))
(declare-fun arrayNoDuplicates!0 (array!2915 (_ BitVec 32) List!1183) Bool)

(assert (=> b!42931 (arrayNoDuplicates!0 lt!18314 #b00000000000000000000000000000000 Nil!1180)))

(declare-datatypes ((Unit!1209 0))(
  ( (Unit!1210) )
))
(declare-fun lt!18310 () Unit!1209)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2915 (_ BitVec 32) (_ BitVec 32) List!1183) Unit!1209)

(assert (=> b!42931 (= lt!18310 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2915 (_ BitVec 32)) Bool)

(assert (=> b!42931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18314 mask!853)))

(declare-fun lt!18311 () Unit!1209)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1209)

(assert (=> b!42931 (= lt!18311 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18314 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42931 (= (arrayCountValidKeys!0 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18315 () Unit!1209)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1209)

(assert (=> b!42931 (= lt!18315 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42931 (= lt!18313 (array!2914 ((as const (Array (_ BitVec 32) ValueCell!698)) EmptyCell!698) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42931 (= lt!18314 (array!2916 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!255 (Int (_ BitVec 64)) V!2309)

(assert (=> b!42931 (= lt!18312 (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42932 () Bool)

(declare-fun res!25520 () Bool)

(assert (=> b!42932 (=> res!25520 e!27209)))

(declare-fun isEmpty!281 (List!1182) Bool)

(assert (=> b!42932 (= res!25520 (isEmpty!281 (toList!603 lt!18316)))))

(declare-fun b!42933 () Bool)

(declare-fun res!25519 () Bool)

(assert (=> b!42933 (=> res!25519 e!27209)))

(assert (=> b!42933 (= res!25519 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!42934 () Bool)

(declare-fun contains!553 (ListLongMap!1175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!332 (array!2915 array!2913 (_ BitVec 32) (_ BitVec 32) V!2309 V!2309 (_ BitVec 32) Int) ListLongMap!1175)

(declare-fun head!885 (List!1182) tuple2!1604)

(assert (=> b!42934 (= e!27209 (contains!553 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470) (_1!813 (head!885 (toList!603 lt!18316)))))))

(declare-fun res!25518 () Bool)

(assert (=> start!6470 (=> (not res!25518) (not e!27210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6470 (= res!25518 (validMask!0 mask!853))))

(assert (=> start!6470 e!27210))

(assert (=> start!6470 true))

(assert (=> start!6470 tp!5939))

(assert (= (and start!6470 res!25518) b!42931))

(assert (= (and b!42931 (not res!25517)) b!42932))

(assert (= (and b!42932 (not res!25520)) b!42933))

(assert (= (and b!42933 (not res!25519)) b!42934))

(declare-fun b_lambda!2243 () Bool)

(assert (=> (not b_lambda!2243) (not b!42931)))

(declare-fun t!4178 () Bool)

(declare-fun tb!983 () Bool)

(assert (=> (and start!6470 (= defaultEntry!470 defaultEntry!470) t!4178) tb!983))

(declare-fun result!1717 () Bool)

(declare-fun tp_is_empty!1891 () Bool)

(assert (=> tb!983 (= result!1717 tp_is_empty!1891)))

(assert (=> b!42931 t!4178))

(declare-fun b_and!2651 () Bool)

(assert (= b_and!2649 (and (=> t!4178 result!1717) b_and!2651)))

(declare-fun m!36763 () Bool)

(assert (=> b!42931 m!36763))

(declare-fun m!36765 () Bool)

(assert (=> b!42931 m!36765))

(declare-fun m!36767 () Bool)

(assert (=> b!42931 m!36767))

(declare-fun m!36769 () Bool)

(assert (=> b!42931 m!36769))

(declare-fun m!36771 () Bool)

(assert (=> b!42931 m!36771))

(declare-fun m!36773 () Bool)

(assert (=> b!42931 m!36773))

(declare-fun m!36775 () Bool)

(assert (=> b!42931 m!36775))

(declare-fun m!36777 () Bool)

(assert (=> b!42931 m!36777))

(declare-fun m!36779 () Bool)

(assert (=> b!42932 m!36779))

(declare-fun m!36781 () Bool)

(assert (=> b!42934 m!36781))

(declare-fun m!36783 () Bool)

(assert (=> b!42934 m!36783))

(assert (=> b!42934 m!36781))

(declare-fun m!36785 () Bool)

(assert (=> b!42934 m!36785))

(declare-fun m!36787 () Bool)

(assert (=> start!6470 m!36787))

(check-sat (not b!42934) tp_is_empty!1891 (not b!42932) (not start!6470) (not b!42931) b_and!2651 (not b_lambda!2243) (not b_next!1501))
(check-sat b_and!2651 (not b_next!1501))
(get-model)

(declare-fun b_lambda!2253 () Bool)

(assert (= b_lambda!2243 (or (and start!6470 b_free!1501) b_lambda!2253)))

(check-sat (not b!42934) tp_is_empty!1891 (not b!42932) (not start!6470) (not b!42931) b_and!2651 (not b_lambda!2253) (not b_next!1501))
(check-sat b_and!2651 (not b_next!1501))
(get-model)

(declare-fun d!7867 () Bool)

(assert (=> d!7867 (= (map!832 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (getCurrentListMap!332 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))

(declare-fun bs!1930 () Bool)

(assert (= bs!1930 d!7867))

(declare-fun m!36849 () Bool)

(assert (=> bs!1930 m!36849))

(assert (=> b!42931 d!7867))

(declare-fun bm!3384 () Bool)

(declare-fun call!3387 () Bool)

(assert (=> bm!3384 (= call!3387 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18314 mask!853))))

(declare-fun d!7873 () Bool)

(declare-fun res!25553 () Bool)

(declare-fun e!27243 () Bool)

(assert (=> d!7873 (=> res!25553 e!27243)))

(assert (=> d!7873 (= res!25553 (bvsge #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(assert (=> d!7873 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18314 mask!853) e!27243)))

(declare-fun b!42994 () Bool)

(declare-fun e!27241 () Bool)

(assert (=> b!42994 (= e!27241 call!3387)))

(declare-fun b!42995 () Bool)

(declare-fun e!27242 () Bool)

(assert (=> b!42995 (= e!27243 e!27242)))

(declare-fun c!5443 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42995 (= c!5443 (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun b!42996 () Bool)

(assert (=> b!42996 (= e!27242 call!3387)))

(declare-fun b!42997 () Bool)

(assert (=> b!42997 (= e!27242 e!27241)))

(declare-fun lt!18383 () (_ BitVec 64))

(assert (=> b!42997 (= lt!18383 (select (arr!1401 lt!18314) #b00000000000000000000000000000000))))

(declare-fun lt!18384 () Unit!1209)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2915 (_ BitVec 64) (_ BitVec 32)) Unit!1209)

(assert (=> b!42997 (= lt!18384 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18314 lt!18383 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42997 (arrayContainsKey!0 lt!18314 lt!18383 #b00000000000000000000000000000000)))

(declare-fun lt!18385 () Unit!1209)

(assert (=> b!42997 (= lt!18385 lt!18384)))

(declare-fun res!25552 () Bool)

(declare-datatypes ((SeekEntryResult!191 0))(
  ( (MissingZero!191 (index!2886 (_ BitVec 32))) (Found!191 (index!2887 (_ BitVec 32))) (Intermediate!191 (undefined!1003 Bool) (index!2888 (_ BitVec 32)) (x!8280 (_ BitVec 32))) (Undefined!191) (MissingVacant!191 (index!2889 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2915 (_ BitVec 32)) SeekEntryResult!191)

(assert (=> b!42997 (= res!25552 (= (seekEntryOrOpen!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) lt!18314 mask!853) (Found!191 #b00000000000000000000000000000000)))))

(assert (=> b!42997 (=> (not res!25552) (not e!27241))))

(assert (= (and d!7873 (not res!25553)) b!42995))

(assert (= (and b!42995 c!5443) b!42997))

(assert (= (and b!42995 (not c!5443)) b!42996))

(assert (= (and b!42997 res!25552) b!42994))

(assert (= (or b!42994 b!42996) bm!3384))

(declare-fun m!36861 () Bool)

(assert (=> bm!3384 m!36861))

(declare-fun m!36863 () Bool)

(assert (=> b!42995 m!36863))

(assert (=> b!42995 m!36863))

(declare-fun m!36865 () Bool)

(assert (=> b!42995 m!36865))

(assert (=> b!42997 m!36863))

(declare-fun m!36867 () Bool)

(assert (=> b!42997 m!36867))

(declare-fun m!36869 () Bool)

(assert (=> b!42997 m!36869))

(assert (=> b!42997 m!36863))

(declare-fun m!36871 () Bool)

(assert (=> b!42997 m!36871))

(assert (=> b!42931 d!7873))

(declare-fun d!7879 () Bool)

(assert (=> d!7879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18314 mask!853)))

(declare-fun lt!18397 () Unit!1209)

(declare-fun choose!34 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1209)

(assert (=> d!7879 (= lt!18397 (choose!34 lt!18314 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7879 (validMask!0 mask!853)))

(assert (=> d!7879 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18314 mask!853 #b00000000000000000000000000000000) lt!18397)))

(declare-fun bs!1932 () Bool)

(assert (= bs!1932 d!7879))

(assert (=> bs!1932 m!36767))

(declare-fun m!36881 () Bool)

(assert (=> bs!1932 m!36881))

(assert (=> bs!1932 m!36787))

(assert (=> b!42931 d!7879))

(declare-fun b!43018 () Bool)

(declare-fun e!27257 () (_ BitVec 32))

(declare-fun call!3393 () (_ BitVec 32))

(assert (=> b!43018 (= e!27257 call!3393)))

(declare-fun b!43019 () Bool)

(declare-fun e!27258 () (_ BitVec 32))

(assert (=> b!43019 (= e!27258 e!27257)))

(declare-fun c!5451 () Bool)

(assert (=> b!43019 (= c!5451 (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun b!43020 () Bool)

(assert (=> b!43020 (= e!27257 (bvadd #b00000000000000000000000000000001 call!3393))))

(declare-fun b!43021 () Bool)

(assert (=> b!43021 (= e!27258 #b00000000000000000000000000000000)))

(declare-fun bm!3390 () Bool)

(assert (=> bm!3390 (= call!3393 (arrayCountValidKeys!0 lt!18314 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7883 () Bool)

(declare-fun lt!18406 () (_ BitVec 32))

(assert (=> d!7883 (and (bvsge lt!18406 #b00000000000000000000000000000000) (bvsle lt!18406 (bvsub (size!1586 lt!18314) #b00000000000000000000000000000000)))))

(assert (=> d!7883 (= lt!18406 e!27258)))

(declare-fun c!5452 () Bool)

(assert (=> d!7883 (= c!5452 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7883 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1586 lt!18314)))))

(assert (=> d!7883 (= (arrayCountValidKeys!0 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18406)))

(assert (= (and d!7883 c!5452) b!43021))

(assert (= (and d!7883 (not c!5452)) b!43019))

(assert (= (and b!43019 c!5451) b!43020))

(assert (= (and b!43019 (not c!5451)) b!43018))

(assert (= (or b!43020 b!43018) bm!3390))

(assert (=> b!43019 m!36863))

(assert (=> b!43019 m!36863))

(assert (=> b!43019 m!36865))

(declare-fun m!36887 () Bool)

(assert (=> bm!3390 m!36887))

(assert (=> b!42931 d!7883))

(declare-fun d!7889 () Bool)

(assert (=> d!7889 (= (arrayCountValidKeys!0 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18409 () Unit!1209)

(declare-fun choose!59 (array!2915 (_ BitVec 32) (_ BitVec 32)) Unit!1209)

(assert (=> d!7889 (= lt!18409 (choose!59 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7889 (bvslt (size!1586 lt!18314) #b01111111111111111111111111111111)))

(assert (=> d!7889 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18409)))

(declare-fun bs!1935 () Bool)

(assert (= bs!1935 d!7889))

(assert (=> bs!1935 m!36777))

(declare-fun m!36889 () Bool)

(assert (=> bs!1935 m!36889))

(assert (=> b!42931 d!7889))

(declare-fun b!43047 () Bool)

(declare-fun e!27281 () Bool)

(declare-fun e!27280 () Bool)

(assert (=> b!43047 (= e!27281 e!27280)))

(declare-fun c!5458 () Bool)

(assert (=> b!43047 (= c!5458 (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun bm!3396 () Bool)

(declare-fun call!3399 () Bool)

(assert (=> bm!3396 (= call!3399 (arrayNoDuplicates!0 lt!18314 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5458 (Cons!1179 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) Nil!1180) Nil!1180)))))

(declare-fun b!43048 () Bool)

(assert (=> b!43048 (= e!27280 call!3399)))

(declare-fun d!7891 () Bool)

(declare-fun res!25577 () Bool)

(declare-fun e!27279 () Bool)

(assert (=> d!7891 (=> res!25577 e!27279)))

(assert (=> d!7891 (= res!25577 (bvsge #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(assert (=> d!7891 (= (arrayNoDuplicates!0 lt!18314 #b00000000000000000000000000000000 Nil!1180) e!27279)))

(declare-fun b!43049 () Bool)

(declare-fun e!27282 () Bool)

(declare-fun contains!557 (List!1183 (_ BitVec 64)) Bool)

(assert (=> b!43049 (= e!27282 (contains!557 Nil!1180 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun b!43050 () Bool)

(assert (=> b!43050 (= e!27280 call!3399)))

(declare-fun b!43051 () Bool)

(assert (=> b!43051 (= e!27279 e!27281)))

(declare-fun res!25575 () Bool)

(assert (=> b!43051 (=> (not res!25575) (not e!27281))))

(assert (=> b!43051 (= res!25575 (not e!27282))))

(declare-fun res!25576 () Bool)

(assert (=> b!43051 (=> (not res!25576) (not e!27282))))

(assert (=> b!43051 (= res!25576 (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (= (and d!7891 (not res!25577)) b!43051))

(assert (= (and b!43051 res!25576) b!43049))

(assert (= (and b!43051 res!25575) b!43047))

(assert (= (and b!43047 c!5458) b!43048))

(assert (= (and b!43047 (not c!5458)) b!43050))

(assert (= (or b!43048 b!43050) bm!3396))

(assert (=> b!43047 m!36863))

(assert (=> b!43047 m!36863))

(assert (=> b!43047 m!36865))

(assert (=> bm!3396 m!36863))

(declare-fun m!36895 () Bool)

(assert (=> bm!3396 m!36895))

(assert (=> b!43049 m!36863))

(assert (=> b!43049 m!36863))

(declare-fun m!36897 () Bool)

(assert (=> b!43049 m!36897))

(assert (=> b!43051 m!36863))

(assert (=> b!43051 m!36863))

(assert (=> b!43051 m!36865))

(assert (=> b!42931 d!7891))

(declare-fun d!7897 () Bool)

(assert (=> d!7897 (arrayNoDuplicates!0 lt!18314 #b00000000000000000000000000000000 Nil!1180)))

(declare-fun lt!18412 () Unit!1209)

(declare-fun choose!111 (array!2915 (_ BitVec 32) (_ BitVec 32) List!1183) Unit!1209)

(assert (=> d!7897 (= lt!18412 (choose!111 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1180))))

(assert (=> d!7897 (= (size!1586 lt!18314) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7897 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1180) lt!18412)))

(declare-fun bs!1936 () Bool)

(assert (= bs!1936 d!7897))

(assert (=> bs!1936 m!36773))

(declare-fun m!36899 () Bool)

(assert (=> bs!1936 m!36899))

(assert (=> b!42931 d!7897))

(declare-fun d!7899 () Bool)

(get-info :version)

(assert (=> d!7899 (= (isEmpty!281 (toList!603 lt!18316)) ((_ is Nil!1179) (toList!603 lt!18316)))))

(assert (=> b!42932 d!7899))

(declare-fun d!7901 () Bool)

(assert (=> d!7901 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6470 d!7901))

(declare-fun d!7905 () Bool)

(declare-fun e!27294 () Bool)

(assert (=> d!7905 e!27294))

(declare-fun res!25583 () Bool)

(assert (=> d!7905 (=> res!25583 e!27294)))

(declare-fun lt!18436 () Bool)

(assert (=> d!7905 (= res!25583 (not lt!18436))))

(declare-fun lt!18434 () Bool)

(assert (=> d!7905 (= lt!18436 lt!18434)))

(declare-fun lt!18435 () Unit!1209)

(declare-fun e!27293 () Unit!1209)

(assert (=> d!7905 (= lt!18435 e!27293)))

(declare-fun c!5464 () Bool)

(assert (=> d!7905 (= c!5464 lt!18434)))

(declare-fun containsKey!74 (List!1182 (_ BitVec 64)) Bool)

(assert (=> d!7905 (= lt!18434 (containsKey!74 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))))))

(assert (=> d!7905 (= (contains!553 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470) (_1!813 (head!885 (toList!603 lt!18316)))) lt!18436)))

(declare-fun b!43067 () Bool)

(declare-fun lt!18433 () Unit!1209)

(assert (=> b!43067 (= e!27293 lt!18433)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!62 (List!1182 (_ BitVec 64)) Unit!1209)

(assert (=> b!43067 (= lt!18433 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))))))

(declare-datatypes ((Option!113 0))(
  ( (Some!112 (v!2080 V!2309)) (None!111) )
))
(declare-fun isDefined!63 (Option!113) Bool)

(declare-fun getValueByKey!107 (List!1182 (_ BitVec 64)) Option!113)

(assert (=> b!43067 (isDefined!63 (getValueByKey!107 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))))))

(declare-fun b!43068 () Bool)

(declare-fun Unit!1217 () Unit!1209)

(assert (=> b!43068 (= e!27293 Unit!1217)))

(declare-fun b!43069 () Bool)

(assert (=> b!43069 (= e!27294 (isDefined!63 (getValueByKey!107 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316))))))))

(assert (= (and d!7905 c!5464) b!43067))

(assert (= (and d!7905 (not c!5464)) b!43068))

(assert (= (and d!7905 (not res!25583)) b!43069))

(declare-fun m!36909 () Bool)

(assert (=> d!7905 m!36909))

(declare-fun m!36911 () Bool)

(assert (=> b!43067 m!36911))

(declare-fun m!36913 () Bool)

(assert (=> b!43067 m!36913))

(assert (=> b!43067 m!36913))

(declare-fun m!36915 () Bool)

(assert (=> b!43067 m!36915))

(assert (=> b!43069 m!36913))

(assert (=> b!43069 m!36913))

(assert (=> b!43069 m!36915))

(assert (=> b!42934 d!7905))

(declare-fun b!43277 () Bool)

(declare-fun e!27438 () Bool)

(assert (=> b!43277 (= e!27438 (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun b!43278 () Bool)

(declare-fun res!25679 () Bool)

(declare-fun e!27434 () Bool)

(assert (=> b!43278 (=> (not res!25679) (not e!27434))))

(declare-fun e!27427 () Bool)

(assert (=> b!43278 (= res!25679 e!27427)))

(declare-fun res!25676 () Bool)

(assert (=> b!43278 (=> res!25676 e!27427)))

(declare-fun e!27428 () Bool)

(assert (=> b!43278 (= res!25676 (not e!27428))))

(declare-fun res!25672 () Bool)

(assert (=> b!43278 (=> (not res!25672) (not e!27428))))

(assert (=> b!43278 (= res!25672 (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(declare-fun b!43279 () Bool)

(declare-fun e!27431 () Bool)

(declare-fun e!27429 () Bool)

(assert (=> b!43279 (= e!27431 e!27429)))

(declare-fun res!25678 () Bool)

(declare-fun call!3466 () Bool)

(assert (=> b!43279 (= res!25678 call!3466)))

(assert (=> b!43279 (=> (not res!25678) (not e!27429))))

(declare-fun b!43280 () Bool)

(assert (=> b!43280 (= e!27434 e!27431)))

(declare-fun c!5529 () Bool)

(assert (=> b!43280 (= c!5529 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!3462 () Bool)

(declare-fun call!3465 () ListLongMap!1175)

(declare-fun call!3467 () ListLongMap!1175)

(assert (=> bm!3462 (= call!3465 call!3467)))

(declare-fun b!43281 () Bool)

(declare-fun e!27437 () Bool)

(declare-fun lt!18644 () ListLongMap!1175)

(declare-fun apply!59 (ListLongMap!1175 (_ BitVec 64)) V!2309)

(assert (=> b!43281 (= e!27437 (= (apply!59 lt!18644 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18312))))

(declare-fun b!43282 () Bool)

(assert (=> b!43282 (= e!27428 (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun b!43283 () Bool)

(declare-fun e!27435 () Unit!1209)

(declare-fun Unit!1218 () Unit!1209)

(assert (=> b!43283 (= e!27435 Unit!1218)))

(declare-fun d!7909 () Bool)

(assert (=> d!7909 e!27434))

(declare-fun res!25673 () Bool)

(assert (=> d!7909 (=> (not res!25673) (not e!27434))))

(assert (=> d!7909 (= res!25673 (or (bvsge #b00000000000000000000000000000000 (size!1586 lt!18314)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))))

(declare-fun lt!18647 () ListLongMap!1175)

(assert (=> d!7909 (= lt!18644 lt!18647)))

(declare-fun lt!18648 () Unit!1209)

(assert (=> d!7909 (= lt!18648 e!27435)))

(declare-fun c!5527 () Bool)

(assert (=> d!7909 (= c!5527 e!27438)))

(declare-fun res!25675 () Bool)

(assert (=> d!7909 (=> (not res!25675) (not e!27438))))

(assert (=> d!7909 (= res!25675 (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(declare-fun e!27433 () ListLongMap!1175)

(assert (=> d!7909 (= lt!18647 e!27433)))

(declare-fun c!5526 () Bool)

(assert (=> d!7909 (= c!5526 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7909 (validMask!0 mask!853)))

(assert (=> d!7909 (= (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470) lt!18644)))

(declare-fun bm!3463 () Bool)

(declare-fun call!3470 () ListLongMap!1175)

(declare-fun call!3469 () ListLongMap!1175)

(assert (=> bm!3463 (= call!3470 call!3469)))

(declare-fun b!43284 () Bool)

(declare-fun e!27426 () ListLongMap!1175)

(assert (=> b!43284 (= e!27433 e!27426)))

(declare-fun c!5528 () Bool)

(assert (=> b!43284 (= c!5528 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43285 () Bool)

(declare-fun res!25674 () Bool)

(assert (=> b!43285 (=> (not res!25674) (not e!27434))))

(declare-fun e!27436 () Bool)

(assert (=> b!43285 (= res!25674 e!27436)))

(declare-fun c!5525 () Bool)

(assert (=> b!43285 (= c!5525 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!43286 () Bool)

(assert (=> b!43286 (= e!27429 (= (apply!59 lt!18644 #b1000000000000000000000000000000000000000000000000000000000000000) lt!18312))))

(declare-fun b!43287 () Bool)

(declare-fun call!3468 () Bool)

(assert (=> b!43287 (= e!27436 (not call!3468))))

(declare-fun b!43288 () Bool)

(declare-fun +!68 (ListLongMap!1175 tuple2!1604) ListLongMap!1175)

(assert (=> b!43288 (= e!27433 (+!68 call!3467 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))))

(declare-fun b!43289 () Bool)

(assert (=> b!43289 (= e!27431 (not call!3466))))

(declare-fun b!43290 () Bool)

(assert (=> b!43290 (= e!27436 e!27437)))

(declare-fun res!25671 () Bool)

(assert (=> b!43290 (= res!25671 call!3468)))

(assert (=> b!43290 (=> (not res!25671) (not e!27437))))

(declare-fun bm!3464 () Bool)

(assert (=> bm!3464 (= call!3468 (contains!553 lt!18644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43291 () Bool)

(declare-fun lt!18640 () Unit!1209)

(assert (=> b!43291 (= e!27435 lt!18640)))

(declare-fun lt!18642 () ListLongMap!1175)

(declare-fun getCurrentListMapNoExtraKeys!38 (array!2915 array!2913 (_ BitVec 32) (_ BitVec 32) V!2309 V!2309 (_ BitVec 32) Int) ListLongMap!1175)

(assert (=> b!43291 (= lt!18642 (getCurrentListMapNoExtraKeys!38 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18654 () (_ BitVec 64))

(assert (=> b!43291 (= lt!18654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18636 () (_ BitVec 64))

(assert (=> b!43291 (= lt!18636 (select (arr!1401 lt!18314) #b00000000000000000000000000000000))))

(declare-fun lt!18635 () Unit!1209)

(declare-fun addStillContains!36 (ListLongMap!1175 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1209)

(assert (=> b!43291 (= lt!18635 (addStillContains!36 lt!18642 lt!18654 lt!18312 lt!18636))))

(assert (=> b!43291 (contains!553 (+!68 lt!18642 (tuple2!1605 lt!18654 lt!18312)) lt!18636)))

(declare-fun lt!18637 () Unit!1209)

(assert (=> b!43291 (= lt!18637 lt!18635)))

(declare-fun lt!18638 () ListLongMap!1175)

(assert (=> b!43291 (= lt!18638 (getCurrentListMapNoExtraKeys!38 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18646 () (_ BitVec 64))

(assert (=> b!43291 (= lt!18646 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18650 () (_ BitVec 64))

(assert (=> b!43291 (= lt!18650 (select (arr!1401 lt!18314) #b00000000000000000000000000000000))))

(declare-fun lt!18645 () Unit!1209)

(declare-fun addApplyDifferent!36 (ListLongMap!1175 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1209)

(assert (=> b!43291 (= lt!18645 (addApplyDifferent!36 lt!18638 lt!18646 lt!18312 lt!18650))))

(assert (=> b!43291 (= (apply!59 (+!68 lt!18638 (tuple2!1605 lt!18646 lt!18312)) lt!18650) (apply!59 lt!18638 lt!18650))))

(declare-fun lt!18643 () Unit!1209)

(assert (=> b!43291 (= lt!18643 lt!18645)))

(declare-fun lt!18653 () ListLongMap!1175)

(assert (=> b!43291 (= lt!18653 (getCurrentListMapNoExtraKeys!38 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18651 () (_ BitVec 64))

(assert (=> b!43291 (= lt!18651 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18639 () (_ BitVec 64))

(assert (=> b!43291 (= lt!18639 (select (arr!1401 lt!18314) #b00000000000000000000000000000000))))

(declare-fun lt!18655 () Unit!1209)

(assert (=> b!43291 (= lt!18655 (addApplyDifferent!36 lt!18653 lt!18651 lt!18312 lt!18639))))

(assert (=> b!43291 (= (apply!59 (+!68 lt!18653 (tuple2!1605 lt!18651 lt!18312)) lt!18639) (apply!59 lt!18653 lt!18639))))

(declare-fun lt!18652 () Unit!1209)

(assert (=> b!43291 (= lt!18652 lt!18655)))

(declare-fun lt!18649 () ListLongMap!1175)

(assert (=> b!43291 (= lt!18649 (getCurrentListMapNoExtraKeys!38 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18634 () (_ BitVec 64))

(assert (=> b!43291 (= lt!18634 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18641 () (_ BitVec 64))

(assert (=> b!43291 (= lt!18641 (select (arr!1401 lt!18314) #b00000000000000000000000000000000))))

(assert (=> b!43291 (= lt!18640 (addApplyDifferent!36 lt!18649 lt!18634 lt!18312 lt!18641))))

(assert (=> b!43291 (= (apply!59 (+!68 lt!18649 (tuple2!1605 lt!18634 lt!18312)) lt!18641) (apply!59 lt!18649 lt!18641))))

(declare-fun bm!3465 () Bool)

(declare-fun call!3471 () ListLongMap!1175)

(assert (=> bm!3465 (= call!3467 (+!68 (ite c!5526 call!3471 (ite c!5528 call!3469 call!3470)) (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))))))

(declare-fun b!43292 () Bool)

(declare-fun c!5530 () Bool)

(assert (=> b!43292 (= c!5530 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!27432 () ListLongMap!1175)

(assert (=> b!43292 (= e!27426 e!27432)))

(declare-fun b!43293 () Bool)

(declare-fun e!27430 () Bool)

(declare-fun get!787 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43293 (= e!27430 (= (apply!59 lt!18644 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)) (get!787 (select (arr!1400 lt!18313) #b00000000000000000000000000000000) (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1585 lt!18313)))))

(assert (=> b!43293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(declare-fun b!43294 () Bool)

(assert (=> b!43294 (= e!27426 call!3465)))

(declare-fun b!43295 () Bool)

(assert (=> b!43295 (= e!27432 call!3465)))

(declare-fun b!43296 () Bool)

(assert (=> b!43296 (= e!27432 call!3470)))

(declare-fun bm!3466 () Bool)

(assert (=> bm!3466 (= call!3469 call!3471)))

(declare-fun bm!3467 () Bool)

(assert (=> bm!3467 (= call!3466 (contains!553 lt!18644 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3468 () Bool)

(assert (=> bm!3468 (= call!3471 (getCurrentListMapNoExtraKeys!38 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun b!43297 () Bool)

(assert (=> b!43297 (= e!27427 e!27430)))

(declare-fun res!25677 () Bool)

(assert (=> b!43297 (=> (not res!25677) (not e!27430))))

(assert (=> b!43297 (= res!25677 (contains!553 lt!18644 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (=> b!43297 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(assert (= (and d!7909 c!5526) b!43288))

(assert (= (and d!7909 (not c!5526)) b!43284))

(assert (= (and b!43284 c!5528) b!43294))

(assert (= (and b!43284 (not c!5528)) b!43292))

(assert (= (and b!43292 c!5530) b!43295))

(assert (= (and b!43292 (not c!5530)) b!43296))

(assert (= (or b!43295 b!43296) bm!3463))

(assert (= (or b!43294 bm!3463) bm!3466))

(assert (= (or b!43294 b!43295) bm!3462))

(assert (= (or b!43288 bm!3466) bm!3468))

(assert (= (or b!43288 bm!3462) bm!3465))

(assert (= (and d!7909 res!25675) b!43277))

(assert (= (and d!7909 c!5527) b!43291))

(assert (= (and d!7909 (not c!5527)) b!43283))

(assert (= (and d!7909 res!25673) b!43278))

(assert (= (and b!43278 res!25672) b!43282))

(assert (= (and b!43278 (not res!25676)) b!43297))

(assert (= (and b!43297 res!25677) b!43293))

(assert (= (and b!43278 res!25679) b!43285))

(assert (= (and b!43285 c!5525) b!43290))

(assert (= (and b!43285 (not c!5525)) b!43287))

(assert (= (and b!43290 res!25671) b!43281))

(assert (= (or b!43290 b!43287) bm!3464))

(assert (= (and b!43285 res!25674) b!43280))

(assert (= (and b!43280 c!5529) b!43279))

(assert (= (and b!43280 (not c!5529)) b!43289))

(assert (= (and b!43279 res!25678) b!43286))

(assert (= (or b!43279 b!43289) bm!3467))

(declare-fun b_lambda!2263 () Bool)

(assert (=> (not b_lambda!2263) (not b!43293)))

(assert (=> b!43293 t!4178))

(declare-fun b_and!2665 () Bool)

(assert (= b_and!2651 (and (=> t!4178 result!1717) b_and!2665)))

(declare-fun m!37047 () Bool)

(assert (=> b!43288 m!37047))

(assert (=> b!43277 m!36863))

(assert (=> b!43277 m!36863))

(assert (=> b!43277 m!36865))

(assert (=> b!43282 m!36863))

(assert (=> b!43282 m!36863))

(assert (=> b!43282 m!36865))

(declare-fun m!37049 () Bool)

(assert (=> b!43291 m!37049))

(declare-fun m!37051 () Bool)

(assert (=> b!43291 m!37051))

(declare-fun m!37053 () Bool)

(assert (=> b!43291 m!37053))

(declare-fun m!37055 () Bool)

(assert (=> b!43291 m!37055))

(declare-fun m!37057 () Bool)

(assert (=> b!43291 m!37057))

(declare-fun m!37059 () Bool)

(assert (=> b!43291 m!37059))

(declare-fun m!37061 () Bool)

(assert (=> b!43291 m!37061))

(declare-fun m!37063 () Bool)

(assert (=> b!43291 m!37063))

(assert (=> b!43291 m!37055))

(declare-fun m!37065 () Bool)

(assert (=> b!43291 m!37065))

(declare-fun m!37067 () Bool)

(assert (=> b!43291 m!37067))

(assert (=> b!43291 m!37049))

(assert (=> b!43291 m!36863))

(assert (=> b!43291 m!37057))

(declare-fun m!37069 () Bool)

(assert (=> b!43291 m!37069))

(assert (=> b!43291 m!37053))

(declare-fun m!37071 () Bool)

(assert (=> b!43291 m!37071))

(declare-fun m!37073 () Bool)

(assert (=> b!43291 m!37073))

(declare-fun m!37075 () Bool)

(assert (=> b!43291 m!37075))

(declare-fun m!37077 () Bool)

(assert (=> b!43291 m!37077))

(declare-fun m!37079 () Bool)

(assert (=> b!43291 m!37079))

(assert (=> b!43297 m!36863))

(assert (=> b!43297 m!36863))

(declare-fun m!37081 () Bool)

(assert (=> b!43297 m!37081))

(declare-fun m!37083 () Bool)

(assert (=> b!43286 m!37083))

(assert (=> bm!3468 m!37067))

(declare-fun m!37085 () Bool)

(assert (=> bm!3467 m!37085))

(declare-fun m!37087 () Bool)

(assert (=> b!43293 m!37087))

(assert (=> b!43293 m!36863))

(declare-fun m!37089 () Bool)

(assert (=> b!43293 m!37089))

(assert (=> b!43293 m!36863))

(assert (=> b!43293 m!37087))

(assert (=> b!43293 m!36769))

(declare-fun m!37091 () Bool)

(assert (=> b!43293 m!37091))

(assert (=> b!43293 m!36769))

(assert (=> d!7909 m!36787))

(declare-fun m!37093 () Bool)

(assert (=> b!43281 m!37093))

(declare-fun m!37095 () Bool)

(assert (=> bm!3465 m!37095))

(declare-fun m!37097 () Bool)

(assert (=> bm!3464 m!37097))

(assert (=> b!42934 d!7909))

(declare-fun d!7931 () Bool)

(assert (=> d!7931 (= (head!885 (toList!603 lt!18316)) (h!1755 (toList!603 lt!18316)))))

(assert (=> b!42934 d!7931))

(declare-fun b_lambda!2265 () Bool)

(assert (= b_lambda!2263 (or (and start!6470 b_free!1501) b_lambda!2265)))

(check-sat (not d!7905) (not b!43047) tp_is_empty!1891 (not b!43019) (not b!43297) (not bm!3384) (not b!43051) (not b!43069) (not b_lambda!2253) (not b!42997) (not d!7867) (not bm!3396) (not b!43049) (not b!42995) (not b!43293) (not d!7909) b_and!2665 (not b!43291) (not b!43281) (not b!43286) (not bm!3390) (not b_lambda!2265) (not d!7879) (not bm!3464) (not b!43277) (not d!7889) (not bm!3465) (not b!43288) (not bm!3467) (not b!43282) (not d!7897) (not b_next!1501) (not b!43067) (not bm!3468))
(check-sat b_and!2665 (not b_next!1501))
(get-model)

(declare-fun d!7939 () Bool)

(assert (=> d!7939 (= (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)) (and (not (= (select (arr!1401 lt!18314) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1401 lt!18314) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43047 d!7939))

(declare-fun d!7941 () Bool)

(assert (=> d!7941 (= (apply!59 (+!68 lt!18649 (tuple2!1605 lt!18634 lt!18312)) lt!18641) (apply!59 lt!18649 lt!18641))))

(declare-fun lt!18662 () Unit!1209)

(declare-fun choose!259 (ListLongMap!1175 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1209)

(assert (=> d!7941 (= lt!18662 (choose!259 lt!18649 lt!18634 lt!18312 lt!18641))))

(declare-fun e!27443 () Bool)

(assert (=> d!7941 e!27443))

(declare-fun res!25683 () Bool)

(assert (=> d!7941 (=> (not res!25683) (not e!27443))))

(assert (=> d!7941 (= res!25683 (contains!553 lt!18649 lt!18641))))

(assert (=> d!7941 (= (addApplyDifferent!36 lt!18649 lt!18634 lt!18312 lt!18641) lt!18662)))

(declare-fun b!43304 () Bool)

(assert (=> b!43304 (= e!27443 (not (= lt!18641 lt!18634)))))

(assert (= (and d!7941 res!25683) b!43304))

(assert (=> d!7941 m!37049))

(assert (=> d!7941 m!37049))

(assert (=> d!7941 m!37051))

(declare-fun m!37111 () Bool)

(assert (=> d!7941 m!37111))

(assert (=> d!7941 m!37059))

(declare-fun m!37113 () Bool)

(assert (=> d!7941 m!37113))

(assert (=> b!43291 d!7941))

(declare-fun d!7943 () Bool)

(declare-fun get!788 (Option!113) V!2309)

(assert (=> d!7943 (= (apply!59 (+!68 lt!18653 (tuple2!1605 lt!18651 lt!18312)) lt!18639) (get!788 (getValueByKey!107 (toList!603 (+!68 lt!18653 (tuple2!1605 lt!18651 lt!18312))) lt!18639)))))

(declare-fun bs!1942 () Bool)

(assert (= bs!1942 d!7943))

(declare-fun m!37115 () Bool)

(assert (=> bs!1942 m!37115))

(assert (=> bs!1942 m!37115))

(declare-fun m!37117 () Bool)

(assert (=> bs!1942 m!37117))

(assert (=> b!43291 d!7943))

(declare-fun call!3477 () ListLongMap!1175)

(declare-fun bm!3474 () Bool)

(assert (=> bm!3474 (= call!3477 (getCurrentListMapNoExtraKeys!38 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470))))

(declare-fun b!43358 () Bool)

(declare-fun e!27481 () Bool)

(declare-fun e!27478 () Bool)

(assert (=> b!43358 (= e!27481 e!27478)))

(declare-fun c!5551 () Bool)

(declare-fun e!27482 () Bool)

(assert (=> b!43358 (= c!5551 e!27482)))

(declare-fun res!25709 () Bool)

(assert (=> b!43358 (=> (not res!25709) (not e!27482))))

(assert (=> b!43358 (= res!25709 (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(declare-fun b!43359 () Bool)

(declare-fun e!27479 () Bool)

(assert (=> b!43359 (= e!27478 e!27479)))

(assert (=> b!43359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(declare-fun res!25707 () Bool)

(declare-fun lt!18693 () ListLongMap!1175)

(assert (=> b!43359 (= res!25707 (contains!553 lt!18693 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (=> b!43359 (=> (not res!25707) (not e!27479))))

(declare-fun b!43360 () Bool)

(declare-fun res!25708 () Bool)

(assert (=> b!43360 (=> (not res!25708) (not e!27481))))

(assert (=> b!43360 (= res!25708 (not (contains!553 lt!18693 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!43361 () Bool)

(assert (=> b!43361 (= e!27482 (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (=> b!43361 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!43362 () Bool)

(declare-fun e!27476 () ListLongMap!1175)

(assert (=> b!43362 (= e!27476 (ListLongMap!1176 Nil!1179))))

(declare-fun b!43363 () Bool)

(declare-fun lt!18695 () Unit!1209)

(declare-fun lt!18691 () Unit!1209)

(assert (=> b!43363 (= lt!18695 lt!18691)))

(declare-fun lt!18694 () (_ BitVec 64))

(declare-fun lt!18697 () (_ BitVec 64))

(declare-fun lt!18696 () ListLongMap!1175)

(declare-fun lt!18692 () V!2309)

(assert (=> b!43363 (not (contains!553 (+!68 lt!18696 (tuple2!1605 lt!18697 lt!18692)) lt!18694))))

(declare-fun addStillNotContains!10 (ListLongMap!1175 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1209)

(assert (=> b!43363 (= lt!18691 (addStillNotContains!10 lt!18696 lt!18697 lt!18692 lt!18694))))

(assert (=> b!43363 (= lt!18694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!43363 (= lt!18692 (get!787 (select (arr!1400 lt!18313) #b00000000000000000000000000000000) (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43363 (= lt!18697 (select (arr!1401 lt!18314) #b00000000000000000000000000000000))))

(assert (=> b!43363 (= lt!18696 call!3477)))

(declare-fun e!27480 () ListLongMap!1175)

(assert (=> b!43363 (= e!27480 (+!68 call!3477 (tuple2!1605 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) (get!787 (select (arr!1400 lt!18313) #b00000000000000000000000000000000) (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!43364 () Bool)

(declare-fun e!27477 () Bool)

(assert (=> b!43364 (= e!27478 e!27477)))

(declare-fun c!5552 () Bool)

(assert (=> b!43364 (= c!5552 (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(declare-fun b!43365 () Bool)

(declare-fun isEmpty!284 (ListLongMap!1175) Bool)

(assert (=> b!43365 (= e!27477 (isEmpty!284 lt!18693))))

(declare-fun b!43366 () Bool)

(assert (=> b!43366 (= e!27477 (= lt!18693 (getCurrentListMapNoExtraKeys!38 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470)))))

(declare-fun d!7945 () Bool)

(assert (=> d!7945 e!27481))

(declare-fun res!25706 () Bool)

(assert (=> d!7945 (=> (not res!25706) (not e!27481))))

(assert (=> d!7945 (= res!25706 (not (contains!553 lt!18693 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7945 (= lt!18693 e!27476)))

(declare-fun c!5549 () Bool)

(assert (=> d!7945 (= c!5549 (bvsge #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(assert (=> d!7945 (validMask!0 mask!853)))

(assert (=> d!7945 (= (getCurrentListMapNoExtraKeys!38 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470) lt!18693)))

(declare-fun b!43367 () Bool)

(assert (=> b!43367 (= e!27480 call!3477)))

(declare-fun b!43368 () Bool)

(assert (=> b!43368 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1586 lt!18314)))))

(assert (=> b!43368 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1585 lt!18313)))))

(assert (=> b!43368 (= e!27479 (= (apply!59 lt!18693 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)) (get!787 (select (arr!1400 lt!18313) #b00000000000000000000000000000000) (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!43369 () Bool)

(assert (=> b!43369 (= e!27476 e!27480)))

(declare-fun c!5550 () Bool)

(assert (=> b!43369 (= c!5550 (validKeyInArray!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (= (and d!7945 c!5549) b!43362))

(assert (= (and d!7945 (not c!5549)) b!43369))

(assert (= (and b!43369 c!5550) b!43363))

(assert (= (and b!43369 (not c!5550)) b!43367))

(assert (= (or b!43363 b!43367) bm!3474))

(assert (= (and d!7945 res!25706) b!43360))

(assert (= (and b!43360 res!25708) b!43358))

(assert (= (and b!43358 res!25709) b!43361))

(assert (= (and b!43358 c!5551) b!43359))

(assert (= (and b!43358 (not c!5551)) b!43364))

(assert (= (and b!43359 res!25707) b!43368))

(assert (= (and b!43364 c!5552) b!43366))

(assert (= (and b!43364 (not c!5552)) b!43365))

(declare-fun b_lambda!2267 () Bool)

(assert (=> (not b_lambda!2267) (not b!43363)))

(assert (=> b!43363 t!4178))

(declare-fun b_and!2667 () Bool)

(assert (= b_and!2665 (and (=> t!4178 result!1717) b_and!2667)))

(declare-fun b_lambda!2269 () Bool)

(assert (=> (not b_lambda!2269) (not b!43368)))

(assert (=> b!43368 t!4178))

(declare-fun b_and!2669 () Bool)

(assert (= b_and!2667 (and (=> t!4178 result!1717) b_and!2669)))

(assert (=> b!43359 m!36863))

(assert (=> b!43359 m!36863))

(declare-fun m!37127 () Bool)

(assert (=> b!43359 m!37127))

(declare-fun m!37129 () Bool)

(assert (=> b!43365 m!37129))

(declare-fun m!37131 () Bool)

(assert (=> b!43363 m!37131))

(assert (=> b!43363 m!37087))

(assert (=> b!43363 m!36769))

(assert (=> b!43363 m!37091))

(declare-fun m!37133 () Bool)

(assert (=> b!43363 m!37133))

(assert (=> b!43363 m!37087))

(assert (=> b!43363 m!37131))

(declare-fun m!37135 () Bool)

(assert (=> b!43363 m!37135))

(declare-fun m!37137 () Bool)

(assert (=> b!43363 m!37137))

(assert (=> b!43363 m!36863))

(assert (=> b!43363 m!36769))

(declare-fun m!37139 () Bool)

(assert (=> bm!3474 m!37139))

(assert (=> b!43361 m!36863))

(assert (=> b!43361 m!36863))

(assert (=> b!43361 m!36865))

(declare-fun m!37141 () Bool)

(assert (=> d!7945 m!37141))

(assert (=> d!7945 m!36787))

(assert (=> b!43366 m!37139))

(assert (=> b!43368 m!37087))

(assert (=> b!43368 m!36769))

(assert (=> b!43368 m!37091))

(assert (=> b!43368 m!37087))

(assert (=> b!43368 m!36863))

(assert (=> b!43368 m!36863))

(declare-fun m!37143 () Bool)

(assert (=> b!43368 m!37143))

(assert (=> b!43368 m!36769))

(assert (=> b!43369 m!36863))

(assert (=> b!43369 m!36863))

(assert (=> b!43369 m!36865))

(declare-fun m!37145 () Bool)

(assert (=> b!43360 m!37145))

(assert (=> b!43291 d!7945))

(declare-fun d!7955 () Bool)

(assert (=> d!7955 (= (apply!59 (+!68 lt!18649 (tuple2!1605 lt!18634 lt!18312)) lt!18641) (get!788 (getValueByKey!107 (toList!603 (+!68 lt!18649 (tuple2!1605 lt!18634 lt!18312))) lt!18641)))))

(declare-fun bs!1944 () Bool)

(assert (= bs!1944 d!7955))

(declare-fun m!37147 () Bool)

(assert (=> bs!1944 m!37147))

(assert (=> bs!1944 m!37147))

(declare-fun m!37149 () Bool)

(assert (=> bs!1944 m!37149))

(assert (=> b!43291 d!7955))

(declare-fun d!7957 () Bool)

(assert (=> d!7957 (= (apply!59 (+!68 lt!18638 (tuple2!1605 lt!18646 lt!18312)) lt!18650) (get!788 (getValueByKey!107 (toList!603 (+!68 lt!18638 (tuple2!1605 lt!18646 lt!18312))) lt!18650)))))

(declare-fun bs!1945 () Bool)

(assert (= bs!1945 d!7957))

(declare-fun m!37151 () Bool)

(assert (=> bs!1945 m!37151))

(assert (=> bs!1945 m!37151))

(declare-fun m!37153 () Bool)

(assert (=> bs!1945 m!37153))

(assert (=> b!43291 d!7957))

(declare-fun d!7959 () Bool)

(declare-fun e!27503 () Bool)

(assert (=> d!7959 e!27503))

(declare-fun res!25731 () Bool)

(assert (=> d!7959 (=> (not res!25731) (not e!27503))))

(declare-fun lt!18735 () ListLongMap!1175)

(assert (=> d!7959 (= res!25731 (contains!553 lt!18735 (_1!813 (tuple2!1605 lt!18654 lt!18312))))))

(declare-fun lt!18733 () List!1182)

(assert (=> d!7959 (= lt!18735 (ListLongMap!1176 lt!18733))))

(declare-fun lt!18734 () Unit!1209)

(declare-fun lt!18732 () Unit!1209)

(assert (=> d!7959 (= lt!18734 lt!18732)))

(assert (=> d!7959 (= (getValueByKey!107 lt!18733 (_1!813 (tuple2!1605 lt!18654 lt!18312))) (Some!112 (_2!813 (tuple2!1605 lt!18654 lt!18312))))))

(declare-fun lemmaContainsTupThenGetReturnValue!29 (List!1182 (_ BitVec 64) V!2309) Unit!1209)

(assert (=> d!7959 (= lt!18732 (lemmaContainsTupThenGetReturnValue!29 lt!18733 (_1!813 (tuple2!1605 lt!18654 lt!18312)) (_2!813 (tuple2!1605 lt!18654 lt!18312))))))

(declare-fun insertStrictlySorted!26 (List!1182 (_ BitVec 64) V!2309) List!1182)

(assert (=> d!7959 (= lt!18733 (insertStrictlySorted!26 (toList!603 lt!18642) (_1!813 (tuple2!1605 lt!18654 lt!18312)) (_2!813 (tuple2!1605 lt!18654 lt!18312))))))

(assert (=> d!7959 (= (+!68 lt!18642 (tuple2!1605 lt!18654 lt!18312)) lt!18735)))

(declare-fun b!43401 () Bool)

(declare-fun res!25732 () Bool)

(assert (=> b!43401 (=> (not res!25732) (not e!27503))))

(assert (=> b!43401 (= res!25732 (= (getValueByKey!107 (toList!603 lt!18735) (_1!813 (tuple2!1605 lt!18654 lt!18312))) (Some!112 (_2!813 (tuple2!1605 lt!18654 lt!18312)))))))

(declare-fun b!43402 () Bool)

(declare-fun contains!559 (List!1182 tuple2!1604) Bool)

(assert (=> b!43402 (= e!27503 (contains!559 (toList!603 lt!18735) (tuple2!1605 lt!18654 lt!18312)))))

(assert (= (and d!7959 res!25731) b!43401))

(assert (= (and b!43401 res!25732) b!43402))

(declare-fun m!37205 () Bool)

(assert (=> d!7959 m!37205))

(declare-fun m!37207 () Bool)

(assert (=> d!7959 m!37207))

(declare-fun m!37209 () Bool)

(assert (=> d!7959 m!37209))

(declare-fun m!37211 () Bool)

(assert (=> d!7959 m!37211))

(declare-fun m!37213 () Bool)

(assert (=> b!43401 m!37213))

(declare-fun m!37215 () Bool)

(assert (=> b!43402 m!37215))

(assert (=> b!43291 d!7959))

(declare-fun d!7971 () Bool)

(assert (=> d!7971 (= (apply!59 lt!18638 lt!18650) (get!788 (getValueByKey!107 (toList!603 lt!18638) lt!18650)))))

(declare-fun bs!1947 () Bool)

(assert (= bs!1947 d!7971))

(declare-fun m!37217 () Bool)

(assert (=> bs!1947 m!37217))

(assert (=> bs!1947 m!37217))

(declare-fun m!37219 () Bool)

(assert (=> bs!1947 m!37219))

(assert (=> b!43291 d!7971))

(declare-fun d!7973 () Bool)

(assert (=> d!7973 (contains!553 (+!68 lt!18642 (tuple2!1605 lt!18654 lt!18312)) lt!18636)))

(declare-fun lt!18741 () Unit!1209)

(declare-fun choose!260 (ListLongMap!1175 (_ BitVec 64) V!2309 (_ BitVec 64)) Unit!1209)

(assert (=> d!7973 (= lt!18741 (choose!260 lt!18642 lt!18654 lt!18312 lt!18636))))

(assert (=> d!7973 (contains!553 lt!18642 lt!18636)))

(assert (=> d!7973 (= (addStillContains!36 lt!18642 lt!18654 lt!18312 lt!18636) lt!18741)))

(declare-fun bs!1949 () Bool)

(assert (= bs!1949 d!7973))

(assert (=> bs!1949 m!37053))

(assert (=> bs!1949 m!37053))

(assert (=> bs!1949 m!37071))

(declare-fun m!37227 () Bool)

(assert (=> bs!1949 m!37227))

(declare-fun m!37229 () Bool)

(assert (=> bs!1949 m!37229))

(assert (=> b!43291 d!7973))

(declare-fun d!7979 () Bool)

(declare-fun e!27509 () Bool)

(assert (=> d!7979 e!27509))

(declare-fun res!25738 () Bool)

(assert (=> d!7979 (=> (not res!25738) (not e!27509))))

(declare-fun lt!18747 () ListLongMap!1175)

(assert (=> d!7979 (= res!25738 (contains!553 lt!18747 (_1!813 (tuple2!1605 lt!18646 lt!18312))))))

(declare-fun lt!18745 () List!1182)

(assert (=> d!7979 (= lt!18747 (ListLongMap!1176 lt!18745))))

(declare-fun lt!18746 () Unit!1209)

(declare-fun lt!18744 () Unit!1209)

(assert (=> d!7979 (= lt!18746 lt!18744)))

(assert (=> d!7979 (= (getValueByKey!107 lt!18745 (_1!813 (tuple2!1605 lt!18646 lt!18312))) (Some!112 (_2!813 (tuple2!1605 lt!18646 lt!18312))))))

(assert (=> d!7979 (= lt!18744 (lemmaContainsTupThenGetReturnValue!29 lt!18745 (_1!813 (tuple2!1605 lt!18646 lt!18312)) (_2!813 (tuple2!1605 lt!18646 lt!18312))))))

(assert (=> d!7979 (= lt!18745 (insertStrictlySorted!26 (toList!603 lt!18638) (_1!813 (tuple2!1605 lt!18646 lt!18312)) (_2!813 (tuple2!1605 lt!18646 lt!18312))))))

(assert (=> d!7979 (= (+!68 lt!18638 (tuple2!1605 lt!18646 lt!18312)) lt!18747)))

(declare-fun b!43412 () Bool)

(declare-fun res!25739 () Bool)

(assert (=> b!43412 (=> (not res!25739) (not e!27509))))

(assert (=> b!43412 (= res!25739 (= (getValueByKey!107 (toList!603 lt!18747) (_1!813 (tuple2!1605 lt!18646 lt!18312))) (Some!112 (_2!813 (tuple2!1605 lt!18646 lt!18312)))))))

(declare-fun b!43413 () Bool)

(assert (=> b!43413 (= e!27509 (contains!559 (toList!603 lt!18747) (tuple2!1605 lt!18646 lt!18312)))))

(assert (= (and d!7979 res!25738) b!43412))

(assert (= (and b!43412 res!25739) b!43413))

(declare-fun m!37231 () Bool)

(assert (=> d!7979 m!37231))

(declare-fun m!37233 () Bool)

(assert (=> d!7979 m!37233))

(declare-fun m!37235 () Bool)

(assert (=> d!7979 m!37235))

(declare-fun m!37237 () Bool)

(assert (=> d!7979 m!37237))

(declare-fun m!37239 () Bool)

(assert (=> b!43412 m!37239))

(declare-fun m!37241 () Bool)

(assert (=> b!43413 m!37241))

(assert (=> b!43291 d!7979))

(declare-fun d!7981 () Bool)

(assert (=> d!7981 (= (apply!59 (+!68 lt!18638 (tuple2!1605 lt!18646 lt!18312)) lt!18650) (apply!59 lt!18638 lt!18650))))

(declare-fun lt!18748 () Unit!1209)

(assert (=> d!7981 (= lt!18748 (choose!259 lt!18638 lt!18646 lt!18312 lt!18650))))

(declare-fun e!27514 () Bool)

(assert (=> d!7981 e!27514))

(declare-fun res!25740 () Bool)

(assert (=> d!7981 (=> (not res!25740) (not e!27514))))

(assert (=> d!7981 (= res!25740 (contains!553 lt!18638 lt!18650))))

(assert (=> d!7981 (= (addApplyDifferent!36 lt!18638 lt!18646 lt!18312 lt!18650) lt!18748)))

(declare-fun b!43420 () Bool)

(assert (=> b!43420 (= e!27514 (not (= lt!18650 lt!18646)))))

(assert (= (and d!7981 res!25740) b!43420))

(assert (=> d!7981 m!37055))

(assert (=> d!7981 m!37055))

(assert (=> d!7981 m!37065))

(declare-fun m!37243 () Bool)

(assert (=> d!7981 m!37243))

(assert (=> d!7981 m!37079))

(declare-fun m!37245 () Bool)

(assert (=> d!7981 m!37245))

(assert (=> b!43291 d!7981))

(declare-fun d!7983 () Bool)

(assert (=> d!7983 (= (apply!59 lt!18653 lt!18639) (get!788 (getValueByKey!107 (toList!603 lt!18653) lt!18639)))))

(declare-fun bs!1950 () Bool)

(assert (= bs!1950 d!7983))

(declare-fun m!37247 () Bool)

(assert (=> bs!1950 m!37247))

(assert (=> bs!1950 m!37247))

(declare-fun m!37249 () Bool)

(assert (=> bs!1950 m!37249))

(assert (=> b!43291 d!7983))

(declare-fun d!7985 () Bool)

(assert (=> d!7985 (= (apply!59 (+!68 lt!18653 (tuple2!1605 lt!18651 lt!18312)) lt!18639) (apply!59 lt!18653 lt!18639))))

(declare-fun lt!18750 () Unit!1209)

(assert (=> d!7985 (= lt!18750 (choose!259 lt!18653 lt!18651 lt!18312 lt!18639))))

(declare-fun e!27516 () Bool)

(assert (=> d!7985 e!27516))

(declare-fun res!25742 () Bool)

(assert (=> d!7985 (=> (not res!25742) (not e!27516))))

(assert (=> d!7985 (= res!25742 (contains!553 lt!18653 lt!18639))))

(assert (=> d!7985 (= (addApplyDifferent!36 lt!18653 lt!18651 lt!18312 lt!18639) lt!18750)))

(declare-fun b!43422 () Bool)

(assert (=> b!43422 (= e!27516 (not (= lt!18639 lt!18651)))))

(assert (= (and d!7985 res!25742) b!43422))

(assert (=> d!7985 m!37057))

(assert (=> d!7985 m!37057))

(assert (=> d!7985 m!37069))

(declare-fun m!37255 () Bool)

(assert (=> d!7985 m!37255))

(assert (=> d!7985 m!37077))

(declare-fun m!37257 () Bool)

(assert (=> d!7985 m!37257))

(assert (=> b!43291 d!7985))

(declare-fun d!7989 () Bool)

(declare-fun e!27519 () Bool)

(assert (=> d!7989 e!27519))

(declare-fun res!25743 () Bool)

(assert (=> d!7989 (=> (not res!25743) (not e!27519))))

(declare-fun lt!18754 () ListLongMap!1175)

(assert (=> d!7989 (= res!25743 (contains!553 lt!18754 (_1!813 (tuple2!1605 lt!18651 lt!18312))))))

(declare-fun lt!18752 () List!1182)

(assert (=> d!7989 (= lt!18754 (ListLongMap!1176 lt!18752))))

(declare-fun lt!18753 () Unit!1209)

(declare-fun lt!18751 () Unit!1209)

(assert (=> d!7989 (= lt!18753 lt!18751)))

(assert (=> d!7989 (= (getValueByKey!107 lt!18752 (_1!813 (tuple2!1605 lt!18651 lt!18312))) (Some!112 (_2!813 (tuple2!1605 lt!18651 lt!18312))))))

(assert (=> d!7989 (= lt!18751 (lemmaContainsTupThenGetReturnValue!29 lt!18752 (_1!813 (tuple2!1605 lt!18651 lt!18312)) (_2!813 (tuple2!1605 lt!18651 lt!18312))))))

(assert (=> d!7989 (= lt!18752 (insertStrictlySorted!26 (toList!603 lt!18653) (_1!813 (tuple2!1605 lt!18651 lt!18312)) (_2!813 (tuple2!1605 lt!18651 lt!18312))))))

(assert (=> d!7989 (= (+!68 lt!18653 (tuple2!1605 lt!18651 lt!18312)) lt!18754)))

(declare-fun b!43427 () Bool)

(declare-fun res!25744 () Bool)

(assert (=> b!43427 (=> (not res!25744) (not e!27519))))

(assert (=> b!43427 (= res!25744 (= (getValueByKey!107 (toList!603 lt!18754) (_1!813 (tuple2!1605 lt!18651 lt!18312))) (Some!112 (_2!813 (tuple2!1605 lt!18651 lt!18312)))))))

(declare-fun b!43428 () Bool)

(assert (=> b!43428 (= e!27519 (contains!559 (toList!603 lt!18754) (tuple2!1605 lt!18651 lt!18312)))))

(assert (= (and d!7989 res!25743) b!43427))

(assert (= (and b!43427 res!25744) b!43428))

(declare-fun m!37261 () Bool)

(assert (=> d!7989 m!37261))

(declare-fun m!37263 () Bool)

(assert (=> d!7989 m!37263))

(declare-fun m!37265 () Bool)

(assert (=> d!7989 m!37265))

(declare-fun m!37267 () Bool)

(assert (=> d!7989 m!37267))

(declare-fun m!37269 () Bool)

(assert (=> b!43427 m!37269))

(declare-fun m!37271 () Bool)

(assert (=> b!43428 m!37271))

(assert (=> b!43291 d!7989))

(declare-fun d!7993 () Bool)

(declare-fun e!27521 () Bool)

(assert (=> d!7993 e!27521))

(declare-fun res!25745 () Bool)

(assert (=> d!7993 (=> res!25745 e!27521)))

(declare-fun lt!18758 () Bool)

(assert (=> d!7993 (= res!25745 (not lt!18758))))

(declare-fun lt!18756 () Bool)

(assert (=> d!7993 (= lt!18758 lt!18756)))

(declare-fun lt!18757 () Unit!1209)

(declare-fun e!27520 () Unit!1209)

(assert (=> d!7993 (= lt!18757 e!27520)))

(declare-fun c!5564 () Bool)

(assert (=> d!7993 (= c!5564 lt!18756)))

(assert (=> d!7993 (= lt!18756 (containsKey!74 (toList!603 (+!68 lt!18642 (tuple2!1605 lt!18654 lt!18312))) lt!18636))))

(assert (=> d!7993 (= (contains!553 (+!68 lt!18642 (tuple2!1605 lt!18654 lt!18312)) lt!18636) lt!18758)))

(declare-fun b!43429 () Bool)

(declare-fun lt!18755 () Unit!1209)

(assert (=> b!43429 (= e!27520 lt!18755)))

(assert (=> b!43429 (= lt!18755 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!603 (+!68 lt!18642 (tuple2!1605 lt!18654 lt!18312))) lt!18636))))

(assert (=> b!43429 (isDefined!63 (getValueByKey!107 (toList!603 (+!68 lt!18642 (tuple2!1605 lt!18654 lt!18312))) lt!18636))))

(declare-fun b!43430 () Bool)

(declare-fun Unit!1222 () Unit!1209)

(assert (=> b!43430 (= e!27520 Unit!1222)))

(declare-fun b!43431 () Bool)

(assert (=> b!43431 (= e!27521 (isDefined!63 (getValueByKey!107 (toList!603 (+!68 lt!18642 (tuple2!1605 lt!18654 lt!18312))) lt!18636)))))

(assert (= (and d!7993 c!5564) b!43429))

(assert (= (and d!7993 (not c!5564)) b!43430))

(assert (= (and d!7993 (not res!25745)) b!43431))

(declare-fun m!37273 () Bool)

(assert (=> d!7993 m!37273))

(declare-fun m!37275 () Bool)

(assert (=> b!43429 m!37275))

(declare-fun m!37277 () Bool)

(assert (=> b!43429 m!37277))

(assert (=> b!43429 m!37277))

(declare-fun m!37279 () Bool)

(assert (=> b!43429 m!37279))

(assert (=> b!43431 m!37277))

(assert (=> b!43431 m!37277))

(assert (=> b!43431 m!37279))

(assert (=> b!43291 d!7993))

(declare-fun d!7995 () Bool)

(assert (=> d!7995 (= (apply!59 lt!18649 lt!18641) (get!788 (getValueByKey!107 (toList!603 lt!18649) lt!18641)))))

(declare-fun bs!1952 () Bool)

(assert (= bs!1952 d!7995))

(declare-fun m!37285 () Bool)

(assert (=> bs!1952 m!37285))

(assert (=> bs!1952 m!37285))

(declare-fun m!37287 () Bool)

(assert (=> bs!1952 m!37287))

(assert (=> b!43291 d!7995))

(declare-fun d!7999 () Bool)

(declare-fun e!27522 () Bool)

(assert (=> d!7999 e!27522))

(declare-fun res!25746 () Bool)

(assert (=> d!7999 (=> (not res!25746) (not e!27522))))

(declare-fun lt!18762 () ListLongMap!1175)

(assert (=> d!7999 (= res!25746 (contains!553 lt!18762 (_1!813 (tuple2!1605 lt!18634 lt!18312))))))

(declare-fun lt!18760 () List!1182)

(assert (=> d!7999 (= lt!18762 (ListLongMap!1176 lt!18760))))

(declare-fun lt!18761 () Unit!1209)

(declare-fun lt!18759 () Unit!1209)

(assert (=> d!7999 (= lt!18761 lt!18759)))

(assert (=> d!7999 (= (getValueByKey!107 lt!18760 (_1!813 (tuple2!1605 lt!18634 lt!18312))) (Some!112 (_2!813 (tuple2!1605 lt!18634 lt!18312))))))

(assert (=> d!7999 (= lt!18759 (lemmaContainsTupThenGetReturnValue!29 lt!18760 (_1!813 (tuple2!1605 lt!18634 lt!18312)) (_2!813 (tuple2!1605 lt!18634 lt!18312))))))

(assert (=> d!7999 (= lt!18760 (insertStrictlySorted!26 (toList!603 lt!18649) (_1!813 (tuple2!1605 lt!18634 lt!18312)) (_2!813 (tuple2!1605 lt!18634 lt!18312))))))

(assert (=> d!7999 (= (+!68 lt!18649 (tuple2!1605 lt!18634 lt!18312)) lt!18762)))

(declare-fun b!43432 () Bool)

(declare-fun res!25747 () Bool)

(assert (=> b!43432 (=> (not res!25747) (not e!27522))))

(assert (=> b!43432 (= res!25747 (= (getValueByKey!107 (toList!603 lt!18762) (_1!813 (tuple2!1605 lt!18634 lt!18312))) (Some!112 (_2!813 (tuple2!1605 lt!18634 lt!18312)))))))

(declare-fun b!43433 () Bool)

(assert (=> b!43433 (= e!27522 (contains!559 (toList!603 lt!18762) (tuple2!1605 lt!18634 lt!18312)))))

(assert (= (and d!7999 res!25746) b!43432))

(assert (= (and b!43432 res!25747) b!43433))

(declare-fun m!37289 () Bool)

(assert (=> d!7999 m!37289))

(declare-fun m!37291 () Bool)

(assert (=> d!7999 m!37291))

(declare-fun m!37293 () Bool)

(assert (=> d!7999 m!37293))

(declare-fun m!37295 () Bool)

(assert (=> d!7999 m!37295))

(declare-fun m!37297 () Bool)

(assert (=> b!43432 m!37297))

(declare-fun m!37299 () Bool)

(assert (=> b!43433 m!37299))

(assert (=> b!43291 d!7999))

(declare-fun b!43438 () Bool)

(declare-fun e!27527 () Bool)

(declare-fun e!27526 () Bool)

(assert (=> b!43438 (= e!27527 e!27526)))

(declare-fun c!5567 () Bool)

(assert (=> b!43438 (= c!5567 (validKeyInArray!0 (select (arr!1401 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!3479 () Bool)

(declare-fun bm!3476 () Bool)

(assert (=> bm!3476 (= call!3479 (arrayNoDuplicates!0 lt!18314 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5567 (Cons!1179 (select (arr!1401 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5458 (Cons!1179 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) Nil!1180) Nil!1180)) (ite c!5458 (Cons!1179 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) Nil!1180) Nil!1180))))))

(declare-fun b!43439 () Bool)

(assert (=> b!43439 (= e!27526 call!3479)))

(declare-fun d!8001 () Bool)

(declare-fun res!25750 () Bool)

(declare-fun e!27525 () Bool)

(assert (=> d!8001 (=> res!25750 e!27525)))

(assert (=> d!8001 (= res!25750 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1586 lt!18314)))))

(assert (=> d!8001 (= (arrayNoDuplicates!0 lt!18314 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5458 (Cons!1179 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) Nil!1180) Nil!1180)) e!27525)))

(declare-fun b!43440 () Bool)

(declare-fun e!27528 () Bool)

(assert (=> b!43440 (= e!27528 (contains!557 (ite c!5458 (Cons!1179 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) Nil!1180) Nil!1180) (select (arr!1401 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43441 () Bool)

(assert (=> b!43441 (= e!27526 call!3479)))

(declare-fun b!43442 () Bool)

(assert (=> b!43442 (= e!27525 e!27527)))

(declare-fun res!25748 () Bool)

(assert (=> b!43442 (=> (not res!25748) (not e!27527))))

(assert (=> b!43442 (= res!25748 (not e!27528))))

(declare-fun res!25749 () Bool)

(assert (=> b!43442 (=> (not res!25749) (not e!27528))))

(assert (=> b!43442 (= res!25749 (validKeyInArray!0 (select (arr!1401 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8001 (not res!25750)) b!43442))

(assert (= (and b!43442 res!25749) b!43440))

(assert (= (and b!43442 res!25748) b!43438))

(assert (= (and b!43438 c!5567) b!43439))

(assert (= (and b!43438 (not c!5567)) b!43441))

(assert (= (or b!43439 b!43441) bm!3476))

(declare-fun m!37301 () Bool)

(assert (=> b!43438 m!37301))

(assert (=> b!43438 m!37301))

(declare-fun m!37303 () Bool)

(assert (=> b!43438 m!37303))

(assert (=> bm!3476 m!37301))

(declare-fun m!37309 () Bool)

(assert (=> bm!3476 m!37309))

(assert (=> b!43440 m!37301))

(assert (=> b!43440 m!37301))

(declare-fun m!37311 () Bool)

(assert (=> b!43440 m!37311))

(assert (=> b!43442 m!37301))

(assert (=> b!43442 m!37301))

(assert (=> b!43442 m!37303))

(assert (=> bm!3396 d!8001))

(declare-fun d!8005 () Bool)

(declare-fun e!27533 () Bool)

(assert (=> d!8005 e!27533))

(declare-fun res!25752 () Bool)

(assert (=> d!8005 (=> res!25752 e!27533)))

(declare-fun lt!18770 () Bool)

(assert (=> d!8005 (= res!25752 (not lt!18770))))

(declare-fun lt!18768 () Bool)

(assert (=> d!8005 (= lt!18770 lt!18768)))

(declare-fun lt!18769 () Unit!1209)

(declare-fun e!27532 () Unit!1209)

(assert (=> d!8005 (= lt!18769 e!27532)))

(declare-fun c!5570 () Bool)

(assert (=> d!8005 (= c!5570 lt!18768)))

(assert (=> d!8005 (= lt!18768 (containsKey!74 (toList!603 lt!18644) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8005 (= (contains!553 lt!18644 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18770)))

(declare-fun b!43448 () Bool)

(declare-fun lt!18767 () Unit!1209)

(assert (=> b!43448 (= e!27532 lt!18767)))

(assert (=> b!43448 (= lt!18767 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!603 lt!18644) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43448 (isDefined!63 (getValueByKey!107 (toList!603 lt!18644) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43449 () Bool)

(declare-fun Unit!1223 () Unit!1209)

(assert (=> b!43449 (= e!27532 Unit!1223)))

(declare-fun b!43450 () Bool)

(assert (=> b!43450 (= e!27533 (isDefined!63 (getValueByKey!107 (toList!603 lt!18644) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8005 c!5570) b!43448))

(assert (= (and d!8005 (not c!5570)) b!43449))

(assert (= (and d!8005 (not res!25752)) b!43450))

(declare-fun m!37321 () Bool)

(assert (=> d!8005 m!37321))

(declare-fun m!37323 () Bool)

(assert (=> b!43448 m!37323))

(declare-fun m!37325 () Bool)

(assert (=> b!43448 m!37325))

(assert (=> b!43448 m!37325))

(declare-fun m!37327 () Bool)

(assert (=> b!43448 m!37327))

(assert (=> b!43450 m!37325))

(assert (=> b!43450 m!37325))

(assert (=> b!43450 m!37327))

(assert (=> bm!3464 d!8005))

(declare-fun d!8009 () Bool)

(declare-fun res!25763 () Bool)

(declare-fun e!27543 () Bool)

(assert (=> d!8009 (=> res!25763 e!27543)))

(assert (=> d!8009 (= res!25763 (and ((_ is Cons!1178) (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!813 (h!1755 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!813 (head!885 (toList!603 lt!18316))))))))

(assert (=> d!8009 (= (containsKey!74 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))) e!27543)))

(declare-fun b!43463 () Bool)

(declare-fun e!27544 () Bool)

(assert (=> b!43463 (= e!27543 e!27544)))

(declare-fun res!25764 () Bool)

(assert (=> b!43463 (=> (not res!25764) (not e!27544))))

(assert (=> b!43463 (= res!25764 (and (or (not ((_ is Cons!1178) (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)))) (bvsle (_1!813 (h!1755 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!813 (head!885 (toList!603 lt!18316))))) ((_ is Cons!1178) (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))) (bvslt (_1!813 (h!1755 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!813 (head!885 (toList!603 lt!18316))))))))

(declare-fun b!43464 () Bool)

(assert (=> b!43464 (= e!27544 (containsKey!74 (t!4179 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))) (_1!813 (head!885 (toList!603 lt!18316)))))))

(assert (= (and d!8009 (not res!25763)) b!43463))

(assert (= (and b!43463 res!25764) b!43464))

(declare-fun m!37339 () Bool)

(assert (=> b!43464 m!37339))

(assert (=> d!7905 d!8009))

(assert (=> b!43019 d!7939))

(declare-fun d!8015 () Bool)

(declare-fun lt!18792 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!41 (List!1183) (InoxSet (_ BitVec 64)))

(assert (=> d!8015 (= lt!18792 (select (content!41 Nil!1180) (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun e!27551 () Bool)

(assert (=> d!8015 (= lt!18792 e!27551)))

(declare-fun res!25773 () Bool)

(assert (=> d!8015 (=> (not res!25773) (not e!27551))))

(assert (=> d!8015 (= res!25773 ((_ is Cons!1179) Nil!1180))))

(assert (=> d!8015 (= (contains!557 Nil!1180 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)) lt!18792)))

(declare-fun b!43473 () Bool)

(declare-fun e!27552 () Bool)

(assert (=> b!43473 (= e!27551 e!27552)))

(declare-fun res!25774 () Bool)

(assert (=> b!43473 (=> res!25774 e!27552)))

(assert (=> b!43473 (= res!25774 (= (h!1756 Nil!1180) (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun b!43474 () Bool)

(assert (=> b!43474 (= e!27552 (contains!557 (t!4180 Nil!1180) (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (= (and d!8015 res!25773) b!43473))

(assert (= (and b!43473 (not res!25774)) b!43474))

(declare-fun m!37365 () Bool)

(assert (=> d!8015 m!37365))

(assert (=> d!8015 m!36863))

(declare-fun m!37367 () Bool)

(assert (=> d!8015 m!37367))

(assert (=> b!43474 m!36863))

(declare-fun m!37369 () Bool)

(assert (=> b!43474 m!37369))

(assert (=> b!43049 d!8015))

(declare-fun bm!3478 () Bool)

(declare-fun call!3481 () Bool)

(assert (=> bm!3478 (= call!3481 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!18314 mask!853))))

(declare-fun d!8021 () Bool)

(declare-fun res!25776 () Bool)

(declare-fun e!27555 () Bool)

(assert (=> d!8021 (=> res!25776 e!27555)))

(assert (=> d!8021 (= res!25776 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1586 lt!18314)))))

(assert (=> d!8021 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18314 mask!853) e!27555)))

(declare-fun b!43475 () Bool)

(declare-fun e!27553 () Bool)

(assert (=> b!43475 (= e!27553 call!3481)))

(declare-fun b!43476 () Bool)

(declare-fun e!27554 () Bool)

(assert (=> b!43476 (= e!27555 e!27554)))

(declare-fun c!5572 () Bool)

(assert (=> b!43476 (= c!5572 (validKeyInArray!0 (select (arr!1401 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43477 () Bool)

(assert (=> b!43477 (= e!27554 call!3481)))

(declare-fun b!43478 () Bool)

(assert (=> b!43478 (= e!27554 e!27553)))

(declare-fun lt!18793 () (_ BitVec 64))

(assert (=> b!43478 (= lt!18793 (select (arr!1401 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!18794 () Unit!1209)

(assert (=> b!43478 (= lt!18794 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18314 lt!18793 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!43478 (arrayContainsKey!0 lt!18314 lt!18793 #b00000000000000000000000000000000)))

(declare-fun lt!18795 () Unit!1209)

(assert (=> b!43478 (= lt!18795 lt!18794)))

(declare-fun res!25775 () Bool)

(assert (=> b!43478 (= res!25775 (= (seekEntryOrOpen!0 (select (arr!1401 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!18314 mask!853) (Found!191 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!43478 (=> (not res!25775) (not e!27553))))

(assert (= (and d!8021 (not res!25776)) b!43476))

(assert (= (and b!43476 c!5572) b!43478))

(assert (= (and b!43476 (not c!5572)) b!43477))

(assert (= (and b!43478 res!25775) b!43475))

(assert (= (or b!43475 b!43477) bm!3478))

(declare-fun m!37371 () Bool)

(assert (=> bm!3478 m!37371))

(assert (=> b!43476 m!37301))

(assert (=> b!43476 m!37301))

(assert (=> b!43476 m!37303))

(assert (=> b!43478 m!37301))

(declare-fun m!37373 () Bool)

(assert (=> b!43478 m!37373))

(declare-fun m!37375 () Bool)

(assert (=> b!43478 m!37375))

(assert (=> b!43478 m!37301))

(declare-fun m!37377 () Bool)

(assert (=> b!43478 m!37377))

(assert (=> bm!3384 d!8021))

(declare-fun d!8023 () Bool)

(declare-fun e!27556 () Bool)

(assert (=> d!8023 e!27556))

(declare-fun res!25777 () Bool)

(assert (=> d!8023 (=> (not res!25777) (not e!27556))))

(declare-fun lt!18799 () ListLongMap!1175)

(assert (=> d!8023 (= res!25777 (contains!553 lt!18799 (_1!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))))))

(declare-fun lt!18797 () List!1182)

(assert (=> d!8023 (= lt!18799 (ListLongMap!1176 lt!18797))))

(declare-fun lt!18798 () Unit!1209)

(declare-fun lt!18796 () Unit!1209)

(assert (=> d!8023 (= lt!18798 lt!18796)))

(assert (=> d!8023 (= (getValueByKey!107 lt!18797 (_1!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))) (Some!112 (_2!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))))))

(assert (=> d!8023 (= lt!18796 (lemmaContainsTupThenGetReturnValue!29 lt!18797 (_1!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)) (_2!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))))))

(assert (=> d!8023 (= lt!18797 (insertStrictlySorted!26 (toList!603 call!3467) (_1!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)) (_2!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))))))

(assert (=> d!8023 (= (+!68 call!3467 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)) lt!18799)))

(declare-fun b!43479 () Bool)

(declare-fun res!25778 () Bool)

(assert (=> b!43479 (=> (not res!25778) (not e!27556))))

(assert (=> b!43479 (= res!25778 (= (getValueByKey!107 (toList!603 lt!18799) (_1!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))) (Some!112 (_2!813 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))))))

(declare-fun b!43480 () Bool)

(assert (=> b!43480 (= e!27556 (contains!559 (toList!603 lt!18799) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))))

(assert (= (and d!8023 res!25777) b!43479))

(assert (= (and b!43479 res!25778) b!43480))

(declare-fun m!37379 () Bool)

(assert (=> d!8023 m!37379))

(declare-fun m!37381 () Bool)

(assert (=> d!8023 m!37381))

(declare-fun m!37383 () Bool)

(assert (=> d!8023 m!37383))

(declare-fun m!37385 () Bool)

(assert (=> d!8023 m!37385))

(declare-fun m!37387 () Bool)

(assert (=> b!43479 m!37387))

(declare-fun m!37389 () Bool)

(assert (=> b!43480 m!37389))

(assert (=> b!43288 d!8023))

(assert (=> d!7879 d!7873))

(declare-fun d!8025 () Bool)

(assert (=> d!8025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18314 mask!853)))

(assert (=> d!8025 true))

(declare-fun _$30!60 () Unit!1209)

(assert (=> d!8025 (= (choose!34 lt!18314 mask!853 #b00000000000000000000000000000000) _$30!60)))

(declare-fun bs!1957 () Bool)

(assert (= bs!1957 d!8025))

(assert (=> bs!1957 m!36767))

(assert (=> d!7879 d!8025))

(assert (=> d!7879 d!7901))

(assert (=> b!43051 d!7939))

(declare-fun b!43489 () Bool)

(declare-fun e!27561 () (_ BitVec 32))

(declare-fun call!3482 () (_ BitVec 32))

(assert (=> b!43489 (= e!27561 call!3482)))

(declare-fun b!43490 () Bool)

(declare-fun e!27562 () (_ BitVec 32))

(assert (=> b!43490 (= e!27562 e!27561)))

(declare-fun c!5574 () Bool)

(assert (=> b!43490 (= c!5574 (validKeyInArray!0 (select (arr!1401 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43491 () Bool)

(assert (=> b!43491 (= e!27561 (bvadd #b00000000000000000000000000000001 call!3482))))

(declare-fun b!43492 () Bool)

(assert (=> b!43492 (= e!27562 #b00000000000000000000000000000000)))

(declare-fun bm!3479 () Bool)

(assert (=> bm!3479 (= call!3482 (arrayCountValidKeys!0 lt!18314 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!8037 () Bool)

(declare-fun lt!18815 () (_ BitVec 32))

(assert (=> d!8037 (and (bvsge lt!18815 #b00000000000000000000000000000000) (bvsle lt!18815 (bvsub (size!1586 lt!18314) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8037 (= lt!18815 e!27562)))

(declare-fun c!5575 () Bool)

(assert (=> d!8037 (= c!5575 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8037 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1586 lt!18314)))))

(assert (=> d!8037 (= (arrayCountValidKeys!0 lt!18314 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!18815)))

(assert (= (and d!8037 c!5575) b!43492))

(assert (= (and d!8037 (not c!5575)) b!43490))

(assert (= (and b!43490 c!5574) b!43491))

(assert (= (and b!43490 (not c!5574)) b!43489))

(assert (= (or b!43491 b!43489) bm!3479))

(assert (=> b!43490 m!37301))

(assert (=> b!43490 m!37301))

(assert (=> b!43490 m!37303))

(declare-fun m!37435 () Bool)

(assert (=> bm!3479 m!37435))

(assert (=> bm!3390 d!8037))

(assert (=> b!42995 d!7939))

(assert (=> d!7909 d!7901))

(declare-fun d!8041 () Bool)

(assert (=> d!8041 (= (apply!59 lt!18644 #b1000000000000000000000000000000000000000000000000000000000000000) (get!788 (getValueByKey!107 (toList!603 lt!18644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1958 () Bool)

(assert (= bs!1958 d!8041))

(declare-fun m!37441 () Bool)

(assert (=> bs!1958 m!37441))

(assert (=> bs!1958 m!37441))

(declare-fun m!37443 () Bool)

(assert (=> bs!1958 m!37443))

(assert (=> b!43286 d!8041))

(declare-fun d!8045 () Bool)

(assert (=> d!8045 (arrayContainsKey!0 lt!18314 lt!18383 #b00000000000000000000000000000000)))

(declare-fun lt!18820 () Unit!1209)

(declare-fun choose!13 (array!2915 (_ BitVec 64) (_ BitVec 32)) Unit!1209)

(assert (=> d!8045 (= lt!18820 (choose!13 lt!18314 lt!18383 #b00000000000000000000000000000000))))

(assert (=> d!8045 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8045 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18314 lt!18383 #b00000000000000000000000000000000) lt!18820)))

(declare-fun bs!1961 () Bool)

(assert (= bs!1961 d!8045))

(assert (=> bs!1961 m!36869))

(declare-fun m!37457 () Bool)

(assert (=> bs!1961 m!37457))

(assert (=> b!42997 d!8045))

(declare-fun d!8053 () Bool)

(declare-fun res!25795 () Bool)

(declare-fun e!27576 () Bool)

(assert (=> d!8053 (=> res!25795 e!27576)))

(assert (=> d!8053 (= res!25795 (= (select (arr!1401 lt!18314) #b00000000000000000000000000000000) lt!18383))))

(assert (=> d!8053 (= (arrayContainsKey!0 lt!18314 lt!18383 #b00000000000000000000000000000000) e!27576)))

(declare-fun b!43510 () Bool)

(declare-fun e!27577 () Bool)

(assert (=> b!43510 (= e!27576 e!27577)))

(declare-fun res!25796 () Bool)

(assert (=> b!43510 (=> (not res!25796) (not e!27577))))

(assert (=> b!43510 (= res!25796 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1586 lt!18314)))))

(declare-fun b!43511 () Bool)

(assert (=> b!43511 (= e!27577 (arrayContainsKey!0 lt!18314 lt!18383 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8053 (not res!25795)) b!43510))

(assert (= (and b!43510 res!25796) b!43511))

(assert (=> d!8053 m!36863))

(declare-fun m!37481 () Bool)

(assert (=> b!43511 m!37481))

(assert (=> b!42997 d!8053))

(declare-fun lt!18867 () SeekEntryResult!191)

(declare-fun e!27634 () SeekEntryResult!191)

(declare-fun b!43599 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2915 (_ BitVec 32)) SeekEntryResult!191)

(assert (=> b!43599 (= e!27634 (seekKeyOrZeroReturnVacant!0 (x!8280 lt!18867) (index!2888 lt!18867) (index!2888 lt!18867) (select (arr!1401 lt!18314) #b00000000000000000000000000000000) lt!18314 mask!853))))

(declare-fun b!43600 () Bool)

(declare-fun e!27633 () SeekEntryResult!191)

(assert (=> b!43600 (= e!27633 (Found!191 (index!2888 lt!18867)))))

(declare-fun b!43601 () Bool)

(declare-fun c!5609 () Bool)

(declare-fun lt!18869 () (_ BitVec 64))

(assert (=> b!43601 (= c!5609 (= lt!18869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43601 (= e!27633 e!27634)))

(declare-fun b!43602 () Bool)

(assert (=> b!43602 (= e!27634 (MissingZero!191 (index!2888 lt!18867)))))

(declare-fun b!43603 () Bool)

(declare-fun e!27632 () SeekEntryResult!191)

(assert (=> b!43603 (= e!27632 Undefined!191)))

(declare-fun d!8063 () Bool)

(declare-fun lt!18868 () SeekEntryResult!191)

(assert (=> d!8063 (and (or ((_ is Undefined!191) lt!18868) (not ((_ is Found!191) lt!18868)) (and (bvsge (index!2887 lt!18868) #b00000000000000000000000000000000) (bvslt (index!2887 lt!18868) (size!1586 lt!18314)))) (or ((_ is Undefined!191) lt!18868) ((_ is Found!191) lt!18868) (not ((_ is MissingZero!191) lt!18868)) (and (bvsge (index!2886 lt!18868) #b00000000000000000000000000000000) (bvslt (index!2886 lt!18868) (size!1586 lt!18314)))) (or ((_ is Undefined!191) lt!18868) ((_ is Found!191) lt!18868) ((_ is MissingZero!191) lt!18868) (not ((_ is MissingVacant!191) lt!18868)) (and (bvsge (index!2889 lt!18868) #b00000000000000000000000000000000) (bvslt (index!2889 lt!18868) (size!1586 lt!18314)))) (or ((_ is Undefined!191) lt!18868) (ite ((_ is Found!191) lt!18868) (= (select (arr!1401 lt!18314) (index!2887 lt!18868)) (select (arr!1401 lt!18314) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!191) lt!18868) (= (select (arr!1401 lt!18314) (index!2886 lt!18868)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!191) lt!18868) (= (select (arr!1401 lt!18314) (index!2889 lt!18868)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8063 (= lt!18868 e!27632)))

(declare-fun c!5608 () Bool)

(assert (=> d!8063 (= c!5608 (and ((_ is Intermediate!191) lt!18867) (undefined!1003 lt!18867)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2915 (_ BitVec 32)) SeekEntryResult!191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!8063 (= lt!18867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) mask!853) (select (arr!1401 lt!18314) #b00000000000000000000000000000000) lt!18314 mask!853))))

(assert (=> d!8063 (validMask!0 mask!853)))

(assert (=> d!8063 (= (seekEntryOrOpen!0 (select (arr!1401 lt!18314) #b00000000000000000000000000000000) lt!18314 mask!853) lt!18868)))

(declare-fun b!43598 () Bool)

(assert (=> b!43598 (= e!27632 e!27633)))

(assert (=> b!43598 (= lt!18869 (select (arr!1401 lt!18314) (index!2888 lt!18867)))))

(declare-fun c!5607 () Bool)

(assert (=> b!43598 (= c!5607 (= lt!18869 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (= (and d!8063 c!5608) b!43603))

(assert (= (and d!8063 (not c!5608)) b!43598))

(assert (= (and b!43598 c!5607) b!43600))

(assert (= (and b!43598 (not c!5607)) b!43601))

(assert (= (and b!43601 c!5609) b!43602))

(assert (= (and b!43601 (not c!5609)) b!43599))

(assert (=> b!43599 m!36863))

(declare-fun m!37543 () Bool)

(assert (=> b!43599 m!37543))

(declare-fun m!37545 () Bool)

(assert (=> d!8063 m!37545))

(declare-fun m!37549 () Bool)

(assert (=> d!8063 m!37549))

(assert (=> d!8063 m!36863))

(declare-fun m!37551 () Bool)

(assert (=> d!8063 m!37551))

(declare-fun m!37553 () Bool)

(assert (=> d!8063 m!37553))

(assert (=> d!8063 m!36787))

(assert (=> d!8063 m!37551))

(assert (=> d!8063 m!36863))

(declare-fun m!37555 () Bool)

(assert (=> d!8063 m!37555))

(declare-fun m!37559 () Bool)

(assert (=> b!43598 m!37559))

(assert (=> b!42997 d!8063))

(assert (=> d!7889 d!7883))

(declare-fun d!8087 () Bool)

(assert (=> d!8087 (= (arrayCountValidKeys!0 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!8087 true))

(declare-fun _$88!46 () Unit!1209)

(assert (=> d!8087 (= (choose!59 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!46)))

(declare-fun bs!1965 () Bool)

(assert (= bs!1965 d!8087))

(assert (=> bs!1965 m!36777))

(assert (=> d!7889 d!8087))

(assert (=> d!7897 d!7891))

(declare-fun d!8089 () Bool)

(assert (=> d!8089 (arrayNoDuplicates!0 lt!18314 #b00000000000000000000000000000000 Nil!1180)))

(assert (=> d!8089 true))

(declare-fun res!25829 () Unit!1209)

(assert (=> d!8089 (= (choose!111 lt!18314 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1180) res!25829)))

(declare-fun bs!1968 () Bool)

(assert (= bs!1968 d!8089))

(assert (=> bs!1968 m!36773))

(assert (=> d!7897 d!8089))

(assert (=> b!43282 d!7939))

(declare-fun d!8095 () Bool)

(declare-fun e!27636 () Bool)

(assert (=> d!8095 e!27636))

(declare-fun res!25830 () Bool)

(assert (=> d!8095 (=> res!25830 e!27636)))

(declare-fun lt!18876 () Bool)

(assert (=> d!8095 (= res!25830 (not lt!18876))))

(declare-fun lt!18874 () Bool)

(assert (=> d!8095 (= lt!18876 lt!18874)))

(declare-fun lt!18875 () Unit!1209)

(declare-fun e!27635 () Unit!1209)

(assert (=> d!8095 (= lt!18875 e!27635)))

(declare-fun c!5610 () Bool)

(assert (=> d!8095 (= c!5610 lt!18874)))

(assert (=> d!8095 (= lt!18874 (containsKey!74 (toList!603 lt!18644) (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (=> d!8095 (= (contains!553 lt!18644 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)) lt!18876)))

(declare-fun b!43604 () Bool)

(declare-fun lt!18873 () Unit!1209)

(assert (=> b!43604 (= e!27635 lt!18873)))

(assert (=> b!43604 (= lt!18873 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!603 lt!18644) (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(assert (=> b!43604 (isDefined!63 (getValueByKey!107 (toList!603 lt!18644) (select (arr!1401 lt!18314) #b00000000000000000000000000000000)))))

(declare-fun b!43605 () Bool)

(declare-fun Unit!1227 () Unit!1209)

(assert (=> b!43605 (= e!27635 Unit!1227)))

(declare-fun b!43606 () Bool)

(assert (=> b!43606 (= e!27636 (isDefined!63 (getValueByKey!107 (toList!603 lt!18644) (select (arr!1401 lt!18314) #b00000000000000000000000000000000))))))

(assert (= (and d!8095 c!5610) b!43604))

(assert (= (and d!8095 (not c!5610)) b!43605))

(assert (= (and d!8095 (not res!25830)) b!43606))

(assert (=> d!8095 m!36863))

(declare-fun m!37567 () Bool)

(assert (=> d!8095 m!37567))

(assert (=> b!43604 m!36863))

(declare-fun m!37569 () Bool)

(assert (=> b!43604 m!37569))

(assert (=> b!43604 m!36863))

(declare-fun m!37571 () Bool)

(assert (=> b!43604 m!37571))

(assert (=> b!43604 m!37571))

(declare-fun m!37573 () Bool)

(assert (=> b!43604 m!37573))

(assert (=> b!43606 m!36863))

(assert (=> b!43606 m!37571))

(assert (=> b!43606 m!37571))

(assert (=> b!43606 m!37573))

(assert (=> b!43297 d!8095))

(declare-fun d!8099 () Bool)

(assert (=> d!8099 (= (apply!59 lt!18644 #b0000000000000000000000000000000000000000000000000000000000000000) (get!788 (getValueByKey!107 (toList!603 lt!18644) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1970 () Bool)

(assert (= bs!1970 d!8099))

(assert (=> bs!1970 m!37325))

(assert (=> bs!1970 m!37325))

(declare-fun m!37575 () Bool)

(assert (=> bs!1970 m!37575))

(assert (=> b!43281 d!8099))

(assert (=> bm!3468 d!7945))

(declare-fun d!8101 () Bool)

(declare-fun e!27655 () Bool)

(assert (=> d!8101 e!27655))

(declare-fun res!25844 () Bool)

(assert (=> d!8101 (=> res!25844 e!27655)))

(declare-fun lt!18902 () Bool)

(assert (=> d!8101 (= res!25844 (not lt!18902))))

(declare-fun lt!18900 () Bool)

(assert (=> d!8101 (= lt!18902 lt!18900)))

(declare-fun lt!18901 () Unit!1209)

(declare-fun e!27654 () Unit!1209)

(assert (=> d!8101 (= lt!18901 e!27654)))

(declare-fun c!5617 () Bool)

(assert (=> d!8101 (= c!5617 lt!18900)))

(assert (=> d!8101 (= lt!18900 (containsKey!74 (toList!603 lt!18644) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8101 (= (contains!553 lt!18644 #b1000000000000000000000000000000000000000000000000000000000000000) lt!18902)))

(declare-fun b!43632 () Bool)

(declare-fun lt!18899 () Unit!1209)

(assert (=> b!43632 (= e!27654 lt!18899)))

(assert (=> b!43632 (= lt!18899 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!603 lt!18644) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43632 (isDefined!63 (getValueByKey!107 (toList!603 lt!18644) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43633 () Bool)

(declare-fun Unit!1228 () Unit!1209)

(assert (=> b!43633 (= e!27654 Unit!1228)))

(declare-fun b!43634 () Bool)

(assert (=> b!43634 (= e!27655 (isDefined!63 (getValueByKey!107 (toList!603 lt!18644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8101 c!5617) b!43632))

(assert (= (and d!8101 (not c!5617)) b!43633))

(assert (= (and d!8101 (not res!25844)) b!43634))

(declare-fun m!37577 () Bool)

(assert (=> d!8101 m!37577))

(declare-fun m!37579 () Bool)

(assert (=> b!43632 m!37579))

(assert (=> b!43632 m!37441))

(assert (=> b!43632 m!37441))

(declare-fun m!37581 () Bool)

(assert (=> b!43632 m!37581))

(assert (=> b!43634 m!37441))

(assert (=> b!43634 m!37441))

(assert (=> b!43634 m!37581))

(assert (=> bm!3467 d!8101))

(declare-fun d!8103 () Bool)

(assert (=> d!8103 (isDefined!63 (getValueByKey!107 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))))))

(declare-fun lt!18905 () Unit!1209)

(declare-fun choose!264 (List!1182 (_ BitVec 64)) Unit!1209)

(assert (=> d!8103 (= lt!18905 (choose!264 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))))))

(declare-fun e!27660 () Bool)

(assert (=> d!8103 e!27660))

(declare-fun res!25849 () Bool)

(assert (=> d!8103 (=> (not res!25849) (not e!27660))))

(declare-fun isStrictlySorted!200 (List!1182) Bool)

(assert (=> d!8103 (= res!25849 (isStrictlySorted!200 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))))))

(assert (=> d!8103 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))) lt!18905)))

(declare-fun b!43639 () Bool)

(assert (=> b!43639 (= e!27660 (containsKey!74 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))))))

(assert (= (and d!8103 res!25849) b!43639))

(assert (=> d!8103 m!36913))

(assert (=> d!8103 m!36913))

(assert (=> d!8103 m!36915))

(declare-fun m!37609 () Bool)

(assert (=> d!8103 m!37609))

(declare-fun m!37611 () Bool)

(assert (=> d!8103 m!37611))

(assert (=> b!43639 m!36909))

(assert (=> b!43067 d!8103))

(declare-fun d!8107 () Bool)

(declare-fun isEmpty!288 (Option!113) Bool)

(assert (=> d!8107 (= (isDefined!63 (getValueByKey!107 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316))))) (not (isEmpty!288 (getValueByKey!107 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))))))))

(declare-fun bs!1971 () Bool)

(assert (= bs!1971 d!8107))

(assert (=> bs!1971 m!36913))

(declare-fun m!37643 () Bool)

(assert (=> bs!1971 m!37643))

(assert (=> b!43067 d!8107))

(declare-fun d!8109 () Bool)

(declare-fun c!5623 () Bool)

(assert (=> d!8109 (= c!5623 (and ((_ is Cons!1178) (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!813 (h!1755 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!813 (head!885 (toList!603 lt!18316))))))))

(declare-fun e!27668 () Option!113)

(assert (=> d!8109 (= (getValueByKey!107 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)) (_1!813 (head!885 (toList!603 lt!18316)))) e!27668)))

(declare-fun b!43652 () Bool)

(assert (=> b!43652 (= e!27668 (Some!112 (_2!813 (h!1755 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))))))))

(declare-fun b!43653 () Bool)

(declare-fun e!27669 () Option!113)

(assert (=> b!43653 (= e!27668 e!27669)))

(declare-fun c!5624 () Bool)

(assert (=> b!43653 (= c!5624 (and ((_ is Cons!1178) (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))) (not (= (_1!813 (h!1755 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!813 (head!885 (toList!603 lt!18316)))))))))

(declare-fun b!43655 () Bool)

(assert (=> b!43655 (= e!27669 None!111)))

(declare-fun b!43654 () Bool)

(assert (=> b!43654 (= e!27669 (getValueByKey!107 (t!4179 (toList!603 (getCurrentListMap!332 lt!18314 lt!18313 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 defaultEntry!470))) (_1!813 (head!885 (toList!603 lt!18316)))))))

(assert (= (and d!8109 c!5623) b!43652))

(assert (= (and d!8109 (not c!5623)) b!43653))

(assert (= (and b!43653 c!5624) b!43654))

(assert (= (and b!43653 (not c!5624)) b!43655))

(declare-fun m!37651 () Bool)

(assert (=> b!43654 m!37651))

(assert (=> b!43067 d!8109))

(assert (=> b!43069 d!8107))

(assert (=> b!43069 d!8109))

(assert (=> b!43277 d!7939))

(declare-fun d!8117 () Bool)

(assert (=> d!8117 (= (apply!59 lt!18644 (select (arr!1401 lt!18314) #b00000000000000000000000000000000)) (get!788 (getValueByKey!107 (toList!603 lt!18644) (select (arr!1401 lt!18314) #b00000000000000000000000000000000))))))

(declare-fun bs!1974 () Bool)

(assert (= bs!1974 d!8117))

(assert (=> bs!1974 m!36863))

(assert (=> bs!1974 m!37571))

(assert (=> bs!1974 m!37571))

(declare-fun m!37661 () Bool)

(assert (=> bs!1974 m!37661))

(assert (=> b!43293 d!8117))

(declare-fun d!8121 () Bool)

(declare-fun c!5628 () Bool)

(assert (=> d!8121 (= c!5628 ((_ is ValueCellFull!698) (select (arr!1400 lt!18313) #b00000000000000000000000000000000)))))

(declare-fun e!27674 () V!2309)

(assert (=> d!8121 (= (get!787 (select (arr!1400 lt!18313) #b00000000000000000000000000000000) (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)) e!27674)))

(declare-fun b!43663 () Bool)

(declare-fun get!793 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43663 (= e!27674 (get!793 (select (arr!1400 lt!18313) #b00000000000000000000000000000000) (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!43664 () Bool)

(declare-fun get!794 (ValueCell!698 V!2309) V!2309)

(assert (=> b!43664 (= e!27674 (get!794 (select (arr!1400 lt!18313) #b00000000000000000000000000000000) (dynLambda!255 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8121 c!5628) b!43663))

(assert (= (and d!8121 (not c!5628)) b!43664))

(assert (=> b!43663 m!37087))

(assert (=> b!43663 m!36769))

(declare-fun m!37669 () Bool)

(assert (=> b!43663 m!37669))

(assert (=> b!43664 m!37087))

(assert (=> b!43664 m!36769))

(declare-fun m!37671 () Bool)

(assert (=> b!43664 m!37671))

(assert (=> b!43293 d!8121))

(declare-fun d!8125 () Bool)

(declare-fun e!27675 () Bool)

(assert (=> d!8125 e!27675))

(declare-fun res!25856 () Bool)

(assert (=> d!8125 (=> (not res!25856) (not e!27675))))

(declare-fun lt!18918 () ListLongMap!1175)

(assert (=> d!8125 (= res!25856 (contains!553 lt!18918 (_1!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))))))

(declare-fun lt!18916 () List!1182)

(assert (=> d!8125 (= lt!18918 (ListLongMap!1176 lt!18916))))

(declare-fun lt!18917 () Unit!1209)

(declare-fun lt!18915 () Unit!1209)

(assert (=> d!8125 (= lt!18917 lt!18915)))

(assert (=> d!8125 (= (getValueByKey!107 lt!18916 (_1!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))) (Some!112 (_2!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))))))

(assert (=> d!8125 (= lt!18915 (lemmaContainsTupThenGetReturnValue!29 lt!18916 (_1!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))) (_2!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))))))

(assert (=> d!8125 (= lt!18916 (insertStrictlySorted!26 (toList!603 (ite c!5526 call!3471 (ite c!5528 call!3469 call!3470))) (_1!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))) (_2!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))))))

(assert (=> d!8125 (= (+!68 (ite c!5526 call!3471 (ite c!5528 call!3469 call!3470)) (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))) lt!18918)))

(declare-fun b!43665 () Bool)

(declare-fun res!25857 () Bool)

(assert (=> b!43665 (=> (not res!25857) (not e!27675))))

(assert (=> b!43665 (= res!25857 (= (getValueByKey!107 (toList!603 lt!18918) (_1!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312)))) (Some!112 (_2!813 (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))))))))

(declare-fun b!43666 () Bool)

(assert (=> b!43666 (= e!27675 (contains!559 (toList!603 lt!18918) (ite (or c!5526 c!5528) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18312) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18312))))))

(assert (= (and d!8125 res!25856) b!43665))

(assert (= (and b!43665 res!25857) b!43666))

(declare-fun m!37673 () Bool)

(assert (=> d!8125 m!37673))

(declare-fun m!37675 () Bool)

(assert (=> d!8125 m!37675))

(declare-fun m!37679 () Bool)

(assert (=> d!8125 m!37679))

(declare-fun m!37681 () Bool)

(assert (=> d!8125 m!37681))

(declare-fun m!37683 () Bool)

(assert (=> b!43665 m!37683))

(declare-fun m!37685 () Bool)

(assert (=> b!43666 m!37685))

(assert (=> bm!3465 d!8125))

(declare-fun e!27688 () Bool)

(declare-fun b!43667 () Bool)

(assert (=> b!43667 (= e!27688 (validKeyInArray!0 (select (arr!1401 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!43668 () Bool)

(declare-fun res!25866 () Bool)

(declare-fun e!27684 () Bool)

(assert (=> b!43668 (=> (not res!25866) (not e!27684))))

(declare-fun e!27677 () Bool)

(assert (=> b!43668 (= res!25866 e!27677)))

(declare-fun res!25863 () Bool)

(assert (=> b!43668 (=> res!25863 e!27677)))

(declare-fun e!27678 () Bool)

(assert (=> b!43668 (= res!25863 (not e!27678))))

(declare-fun res!25859 () Bool)

(assert (=> b!43668 (=> (not res!25859) (not e!27678))))

(assert (=> b!43668 (= res!25859 (bvslt #b00000000000000000000000000000000 (size!1586 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))))

(declare-fun b!43669 () Bool)

(declare-fun e!27681 () Bool)

(declare-fun e!27679 () Bool)

(assert (=> b!43669 (= e!27681 e!27679)))

(declare-fun res!25865 () Bool)

(declare-fun call!3497 () Bool)

(assert (=> b!43669 (= res!25865 call!3497)))

(assert (=> b!43669 (=> (not res!25865) (not e!27679))))

(declare-fun b!43670 () Bool)

(assert (=> b!43670 (= e!27684 e!27681)))

(declare-fun c!5633 () Bool)

(assert (=> b!43670 (= c!5633 (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!3493 () Bool)

(declare-fun call!3496 () ListLongMap!1175)

(declare-fun call!3498 () ListLongMap!1175)

(assert (=> bm!3493 (= call!3496 call!3498)))

(declare-fun lt!18930 () ListLongMap!1175)

(declare-fun b!43671 () Bool)

(declare-fun e!27687 () Bool)

(assert (=> b!43671 (= e!27687 (= (apply!59 lt!18930 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))

(declare-fun b!43672 () Bool)

(assert (=> b!43672 (= e!27678 (validKeyInArray!0 (select (arr!1401 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!43673 () Bool)

(declare-fun e!27685 () Unit!1209)

(declare-fun Unit!1229 () Unit!1209)

(assert (=> b!43673 (= e!27685 Unit!1229)))

(declare-fun d!8129 () Bool)

(assert (=> d!8129 e!27684))

(declare-fun res!25860 () Bool)

(assert (=> d!8129 (=> (not res!25860) (not e!27684))))

(assert (=> d!8129 (= res!25860 (or (bvsge #b00000000000000000000000000000000 (size!1586 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1586 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))))))

(declare-fun lt!18933 () ListLongMap!1175)

(assert (=> d!8129 (= lt!18930 lt!18933)))

(declare-fun lt!18934 () Unit!1209)

(assert (=> d!8129 (= lt!18934 e!27685)))

(declare-fun c!5631 () Bool)

(assert (=> d!8129 (= c!5631 e!27688)))

(declare-fun res!25862 () Bool)

(assert (=> d!8129 (=> (not res!25862) (not e!27688))))

(assert (=> d!8129 (= res!25862 (bvslt #b00000000000000000000000000000000 (size!1586 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))))

(declare-fun e!27683 () ListLongMap!1175)

(assert (=> d!8129 (= lt!18933 e!27683)))

(declare-fun c!5630 () Bool)

(assert (=> d!8129 (= c!5630 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8129 (validMask!0 (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))

(assert (=> d!8129 (= (getCurrentListMap!332 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) lt!18930)))

(declare-fun bm!3494 () Bool)

(declare-fun call!3501 () ListLongMap!1175)

(declare-fun call!3500 () ListLongMap!1175)

(assert (=> bm!3494 (= call!3501 call!3500)))

(declare-fun b!43674 () Bool)

(declare-fun e!27676 () ListLongMap!1175)

(assert (=> b!43674 (= e!27683 e!27676)))

(declare-fun c!5632 () Bool)

(assert (=> b!43674 (= c!5632 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43675 () Bool)

(declare-fun res!25861 () Bool)

(assert (=> b!43675 (=> (not res!25861) (not e!27684))))

(declare-fun e!27686 () Bool)

(assert (=> b!43675 (= res!25861 e!27686)))

(declare-fun c!5629 () Bool)

(assert (=> b!43675 (= c!5629 (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!43676 () Bool)

(assert (=> b!43676 (= e!27679 (= (apply!59 lt!18930 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))

(declare-fun b!43677 () Bool)

(declare-fun call!3499 () Bool)

(assert (=> b!43677 (= e!27686 (not call!3499))))

(declare-fun b!43678 () Bool)

(assert (=> b!43678 (= e!27683 (+!68 call!3498 (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))))

(declare-fun b!43679 () Bool)

(assert (=> b!43679 (= e!27681 (not call!3497))))

(declare-fun b!43680 () Bool)

(assert (=> b!43680 (= e!27686 e!27687)))

(declare-fun res!25858 () Bool)

(assert (=> b!43680 (= res!25858 call!3499)))

(assert (=> b!43680 (=> (not res!25858) (not e!27687))))

(declare-fun bm!3495 () Bool)

(assert (=> bm!3495 (= call!3499 (contains!553 lt!18930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43681 () Bool)

(declare-fun lt!18926 () Unit!1209)

(assert (=> b!43681 (= e!27685 lt!18926)))

(declare-fun lt!18928 () ListLongMap!1175)

(assert (=> b!43681 (= lt!18928 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))

(declare-fun lt!18940 () (_ BitVec 64))

(assert (=> b!43681 (= lt!18940 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18922 () (_ BitVec 64))

(assert (=> b!43681 (= lt!18922 (select (arr!1401 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18921 () Unit!1209)

(assert (=> b!43681 (= lt!18921 (addStillContains!36 lt!18928 lt!18940 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) lt!18922))))

(assert (=> b!43681 (contains!553 (+!68 lt!18928 (tuple2!1605 lt!18940 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))) lt!18922)))

(declare-fun lt!18923 () Unit!1209)

(assert (=> b!43681 (= lt!18923 lt!18921)))

(declare-fun lt!18924 () ListLongMap!1175)

(assert (=> b!43681 (= lt!18924 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))

(declare-fun lt!18932 () (_ BitVec 64))

(assert (=> b!43681 (= lt!18932 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18936 () (_ BitVec 64))

(assert (=> b!43681 (= lt!18936 (select (arr!1401 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18931 () Unit!1209)

(assert (=> b!43681 (= lt!18931 (addApplyDifferent!36 lt!18924 lt!18932 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) lt!18936))))

(assert (=> b!43681 (= (apply!59 (+!68 lt!18924 (tuple2!1605 lt!18932 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))) lt!18936) (apply!59 lt!18924 lt!18936))))

(declare-fun lt!18929 () Unit!1209)

(assert (=> b!43681 (= lt!18929 lt!18931)))

(declare-fun lt!18939 () ListLongMap!1175)

(assert (=> b!43681 (= lt!18939 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))

(declare-fun lt!18937 () (_ BitVec 64))

(assert (=> b!43681 (= lt!18937 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18925 () (_ BitVec 64))

(assert (=> b!43681 (= lt!18925 (select (arr!1401 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!18941 () Unit!1209)

(assert (=> b!43681 (= lt!18941 (addApplyDifferent!36 lt!18939 lt!18937 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) lt!18925))))

(assert (=> b!43681 (= (apply!59 (+!68 lt!18939 (tuple2!1605 lt!18937 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))) lt!18925) (apply!59 lt!18939 lt!18925))))

(declare-fun lt!18938 () Unit!1209)

(assert (=> b!43681 (= lt!18938 lt!18941)))

(declare-fun lt!18935 () ListLongMap!1175)

(assert (=> b!43681 (= lt!18935 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))

(declare-fun lt!18920 () (_ BitVec 64))

(assert (=> b!43681 (= lt!18920 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18927 () (_ BitVec 64))

(assert (=> b!43681 (= lt!18927 (select (arr!1401 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(assert (=> b!43681 (= lt!18926 (addApplyDifferent!36 lt!18935 lt!18920 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) lt!18927))))

(assert (=> b!43681 (= (apply!59 (+!68 lt!18935 (tuple2!1605 lt!18920 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))) lt!18927) (apply!59 lt!18935 lt!18927))))

(declare-fun call!3502 () ListLongMap!1175)

(declare-fun bm!3496 () Bool)

(assert (=> bm!3496 (= call!3498 (+!68 (ite c!5630 call!3502 (ite c!5632 call!3500 call!3501)) (ite (or c!5630 c!5632) (tuple2!1605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) (tuple2!1605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))))

(declare-fun c!5634 () Bool)

(declare-fun b!43682 () Bool)

(assert (=> b!43682 (= c!5634 (and (not (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!27682 () ListLongMap!1175)

(assert (=> b!43682 (= e!27676 e!27682)))

(declare-fun e!27680 () Bool)

(declare-fun b!43683 () Bool)

(assert (=> b!43683 (= e!27680 (= (apply!59 lt!18930 (select (arr!1401 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (get!787 (select (arr!1400 (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (dynLambda!255 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1585 (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))))

(assert (=> b!43683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1586 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))))

(declare-fun b!43684 () Bool)

(assert (=> b!43684 (= e!27676 call!3496)))

(declare-fun b!43685 () Bool)

(assert (=> b!43685 (= e!27682 call!3496)))

(declare-fun b!43686 () Bool)

(assert (=> b!43686 (= e!27682 call!3501)))

(declare-fun bm!3497 () Bool)

(assert (=> bm!3497 (= call!3500 call!3502)))

(declare-fun bm!3498 () Bool)

(assert (=> bm!3498 (= call!3497 (contains!553 lt!18930 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3499 () Bool)

(assert (=> bm!3499 (= call!3502 (getCurrentListMapNoExtraKeys!38 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (_values!1864 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (mask!5430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (extraKeys!1772 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (zeroValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) (minValue!1799 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))))))

(declare-fun b!43687 () Bool)

(assert (=> b!43687 (= e!27677 e!27680)))

(declare-fun res!25864 () Bool)

(assert (=> b!43687 (=> (not res!25864) (not e!27680))))

(assert (=> b!43687 (= res!25864 (contains!553 lt!18930 (select (arr!1401 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> b!43687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1586 (_keys!3430 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000)))))))

(assert (= (and d!8129 c!5630) b!43678))

(assert (= (and d!8129 (not c!5630)) b!43674))

(assert (= (and b!43674 c!5632) b!43684))

(assert (= (and b!43674 (not c!5632)) b!43682))

(assert (= (and b!43682 c!5634) b!43685))

(assert (= (and b!43682 (not c!5634)) b!43686))

(assert (= (or b!43685 b!43686) bm!3494))

(assert (= (or b!43684 bm!3494) bm!3497))

(assert (= (or b!43684 b!43685) bm!3493))

(assert (= (or b!43678 bm!3497) bm!3499))

(assert (= (or b!43678 bm!3493) bm!3496))

(assert (= (and d!8129 res!25862) b!43667))

(assert (= (and d!8129 c!5631) b!43681))

(assert (= (and d!8129 (not c!5631)) b!43673))

(assert (= (and d!8129 res!25860) b!43668))

(assert (= (and b!43668 res!25859) b!43672))

(assert (= (and b!43668 (not res!25863)) b!43687))

(assert (= (and b!43687 res!25864) b!43683))

(assert (= (and b!43668 res!25866) b!43675))

(assert (= (and b!43675 c!5629) b!43680))

(assert (= (and b!43675 (not c!5629)) b!43677))

(assert (= (and b!43680 res!25858) b!43671))

(assert (= (or b!43680 b!43677) bm!3495))

(assert (= (and b!43675 res!25861) b!43670))

(assert (= (and b!43670 c!5633) b!43669))

(assert (= (and b!43670 (not c!5633)) b!43679))

(assert (= (and b!43669 res!25865) b!43676))

(assert (= (or b!43669 b!43679) bm!3498))

(declare-fun b_lambda!2281 () Bool)

(assert (=> (not b_lambda!2281) (not b!43683)))

(declare-fun t!4192 () Bool)

(declare-fun tb!991 () Bool)

(assert (=> (and start!6470 (= defaultEntry!470 (defaultEntry!1881 (LongMapFixedSize!377 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18312 lt!18312 #b00000000000000000000000000000000 lt!18314 lt!18313 #b00000000000000000000000000000000))) t!4192) tb!991))

(declare-fun result!1731 () Bool)

(assert (=> tb!991 (= result!1731 tp_is_empty!1891)))

(assert (=> b!43683 t!4192))

(declare-fun b_and!2681 () Bool)

(assert (= b_and!2669 (and (=> t!4192 result!1731) b_and!2681)))

(declare-fun m!37689 () Bool)

(assert (=> b!43678 m!37689))

(declare-fun m!37691 () Bool)

(assert (=> b!43667 m!37691))

(assert (=> b!43667 m!37691))

(declare-fun m!37693 () Bool)

(assert (=> b!43667 m!37693))

(assert (=> b!43672 m!37691))

(assert (=> b!43672 m!37691))

(assert (=> b!43672 m!37693))

(declare-fun m!37695 () Bool)

(assert (=> b!43681 m!37695))

(declare-fun m!37697 () Bool)

(assert (=> b!43681 m!37697))

(declare-fun m!37699 () Bool)

(assert (=> b!43681 m!37699))

(declare-fun m!37701 () Bool)

(assert (=> b!43681 m!37701))

(declare-fun m!37703 () Bool)

(assert (=> b!43681 m!37703))

(declare-fun m!37705 () Bool)

(assert (=> b!43681 m!37705))

(declare-fun m!37707 () Bool)

(assert (=> b!43681 m!37707))

(declare-fun m!37709 () Bool)

(assert (=> b!43681 m!37709))

(assert (=> b!43681 m!37701))

(declare-fun m!37711 () Bool)

(assert (=> b!43681 m!37711))

(declare-fun m!37713 () Bool)

(assert (=> b!43681 m!37713))

(assert (=> b!43681 m!37695))

(assert (=> b!43681 m!37691))

(assert (=> b!43681 m!37703))

(declare-fun m!37715 () Bool)

(assert (=> b!43681 m!37715))

(assert (=> b!43681 m!37699))

(declare-fun m!37717 () Bool)

(assert (=> b!43681 m!37717))

(declare-fun m!37719 () Bool)

(assert (=> b!43681 m!37719))

(declare-fun m!37721 () Bool)

(assert (=> b!43681 m!37721))

(declare-fun m!37723 () Bool)

(assert (=> b!43681 m!37723))

(declare-fun m!37725 () Bool)

(assert (=> b!43681 m!37725))

(assert (=> b!43687 m!37691))

(assert (=> b!43687 m!37691))

(declare-fun m!37727 () Bool)

(assert (=> b!43687 m!37727))

(declare-fun m!37729 () Bool)

(assert (=> b!43676 m!37729))

(assert (=> bm!3499 m!37713))

(declare-fun m!37731 () Bool)

(assert (=> bm!3498 m!37731))

(declare-fun m!37733 () Bool)

(assert (=> b!43683 m!37733))

(assert (=> b!43683 m!37691))

(declare-fun m!37735 () Bool)

(assert (=> b!43683 m!37735))

(assert (=> b!43683 m!37691))

(assert (=> b!43683 m!37733))

(declare-fun m!37737 () Bool)

(assert (=> b!43683 m!37737))

(declare-fun m!37739 () Bool)

(assert (=> b!43683 m!37739))

(assert (=> b!43683 m!37737))

(declare-fun m!37741 () Bool)

(assert (=> d!8129 m!37741))

(declare-fun m!37743 () Bool)

(assert (=> b!43671 m!37743))

(declare-fun m!37745 () Bool)

(assert (=> bm!3496 m!37745))

(declare-fun m!37747 () Bool)

(assert (=> bm!3495 m!37747))

(assert (=> d!7867 d!8129))

(declare-fun b_lambda!2283 () Bool)

(assert (= b_lambda!2267 (or (and start!6470 b_free!1501) b_lambda!2283)))

(declare-fun b_lambda!2285 () Bool)

(assert (= b_lambda!2269 (or (and start!6470 b_free!1501) b_lambda!2285)))

(check-sat (not b!43676) (not b_lambda!2285) (not d!7955) (not d!8107) (not d!8103) (not b!43666) (not b!43450) (not d!7983) (not b!43681) (not b!43664) (not d!7999) (not d!8095) (not d!8041) (not b_lambda!2281) (not b!43464) (not b!43671) tp_is_empty!1891 (not b!43683) (not bm!3474) (not b_lambda!2283) (not d!7993) (not b!43634) (not d!8015) (not b!43361) (not b!43360) (not d!7995) (not d!8023) (not b_lambda!2265) (not d!7989) (not d!8117) (not b!43606) (not b!43490) (not b!43427) (not bm!3478) (not d!8125) (not b!43667) (not d!8045) (not b!43448) (not d!8129) (not d!7941) (not d!7981) (not d!8099) (not b!43413) (not b!43440) (not bm!3495) (not d!8005) (not b!43654) (not b!43632) (not d!7957) (not bm!3479) (not b!43639) (not bm!3476) (not b!43478) (not b!43431) (not b!43604) (not b!43359) (not b!43480) (not b_lambda!2253) b_and!2681 (not b!43479) (not b!43672) (not b!43663) (not d!8025) (not d!8087) (not b!43433) (not d!7979) (not b!43368) (not bm!3498) (not d!7971) (not b!43687) (not d!7943) (not b!43476) (not b!43678) (not d!7985) (not b!43474) (not b!43365) (not d!7973) (not b!43366) (not bm!3496) (not b!43429) (not b!43442) (not b!43432) (not d!7945) (not d!8063) (not bm!3499) (not b!43665) (not b_next!1501) (not b!43363) (not b!43401) (not b!43412) (not b!43369) (not b!43402) (not b!43438) (not b!43511) (not b!43599) (not d!8101) (not d!8089) (not d!7959) (not b!43428))
(check-sat b_and!2681 (not b_next!1501))
