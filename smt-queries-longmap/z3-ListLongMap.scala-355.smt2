; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6656 () Bool)

(assert start!6656)

(declare-fun b_free!1507 () Bool)

(declare-fun b_next!1507 () Bool)

(assert (=> start!6656 (= b_free!1507 (not b_next!1507))))

(declare-fun tp!5948 () Bool)

(declare-fun b_and!2685 () Bool)

(assert (=> start!6656 (= tp!5948 b_and!2685)))

(declare-fun b!43792 () Bool)

(declare-fun e!27755 () Bool)

(declare-fun e!27756 () Bool)

(assert (=> b!43792 (= e!27755 (not e!27756))))

(declare-fun res!25914 () Bool)

(assert (=> b!43792 (=> res!25914 e!27756)))

(declare-datatypes ((V!2317 0))(
  ( (V!2318 (val!987 Int)) )
))
(declare-datatypes ((tuple2!1610 0))(
  ( (tuple2!1611 (_1!816 (_ BitVec 64)) (_2!816 V!2317)) )
))
(declare-datatypes ((List!1188 0))(
  ( (Nil!1185) (Cons!1184 (h!1761 tuple2!1610) (t!4197 List!1188)) )
))
(declare-datatypes ((ListLongMap!1181 0))(
  ( (ListLongMap!1182 (toList!606 List!1188)) )
))
(declare-fun lt!19043 () ListLongMap!1181)

(assert (=> b!43792 (= res!25914 (= lt!19043 (ListLongMap!1182 Nil!1185)))))

(declare-datatypes ((array!2925 0))(
  ( (array!2926 (arr!1406 (Array (_ BitVec 32) (_ BitVec 64))) (size!1603 (_ BitVec 32))) )
))
(declare-fun lt!19045 () array!2925)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!19048 () V!2317)

(declare-datatypes ((ValueCell!701 0))(
  ( (ValueCellFull!701 (v!2084 V!2317)) (EmptyCell!701) )
))
(declare-datatypes ((array!2927 0))(
  ( (array!2928 (arr!1407 (Array (_ BitVec 32) ValueCell!701)) (size!1604 (_ BitVec 32))) )
))
(declare-fun lt!19042 () array!2927)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((LongMapFixedSize!382 0))(
  ( (LongMapFixedSize!383 (defaultEntry!1890 Int) (mask!5456 (_ BitVec 32)) (extraKeys!1781 (_ BitVec 32)) (zeroValue!1808 V!2317) (minValue!1808 V!2317) (_size!240 (_ BitVec 32)) (_keys!3451 array!2925) (_values!1873 array!2927) (_vacant!240 (_ BitVec 32))) )
))
(declare-fun map!837 (LongMapFixedSize!382) ListLongMap!1181)

(assert (=> b!43792 (= lt!19043 (map!837 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1189 0))(
  ( (Nil!1186) (Cons!1185 (h!1762 (_ BitVec 64)) (t!4198 List!1189)) )
))
(declare-fun arrayNoDuplicates!0 (array!2925 (_ BitVec 32) List!1189) Bool)

(assert (=> b!43792 (arrayNoDuplicates!0 lt!19045 #b00000000000000000000000000000000 Nil!1186)))

(declare-datatypes ((Unit!1233 0))(
  ( (Unit!1234) )
))
(declare-fun lt!19047 () Unit!1233)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2925 (_ BitVec 32) (_ BitVec 32) List!1189) Unit!1233)

(assert (=> b!43792 (= lt!19047 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2925 (_ BitVec 32)) Bool)

(assert (=> b!43792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19045 mask!853)))

(declare-fun lt!19041 () Unit!1233)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2925 (_ BitVec 32) (_ BitVec 32)) Unit!1233)

(assert (=> b!43792 (= lt!19041 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19045 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2925 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43792 (= (arrayCountValidKeys!0 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19044 () Unit!1233)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2925 (_ BitVec 32) (_ BitVec 32)) Unit!1233)

(assert (=> b!43792 (= lt!19044 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43792 (= lt!19042 (array!2928 ((as const (Array (_ BitVec 32) ValueCell!701)) EmptyCell!701) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43792 (= lt!19045 (array!2926 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!258 (Int (_ BitVec 64)) V!2317)

(assert (=> b!43792 (= lt!19048 (dynLambda!258 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43793 () Bool)

(declare-fun res!25913 () Bool)

(assert (=> b!43793 (=> res!25913 e!27756)))

(declare-fun isEmpty!290 (List!1188) Bool)

(assert (=> b!43793 (= res!25913 (isEmpty!290 (toList!606 lt!19043)))))

(declare-fun b!43794 () Bool)

(assert (=> b!43794 (= e!27756 false)))

(declare-fun lt!19039 () (_ BitVec 32))

(declare-fun lt!19046 () tuple2!1610)

(declare-fun arrayScanForKey!0 (array!2925 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43794 (= lt!19039 (arrayScanForKey!0 lt!19045 (_1!816 lt!19046) #b00000000000000000000000000000000))))

(declare-fun e!27754 () Bool)

(assert (=> b!43794 e!27754))

(declare-fun res!25916 () Bool)

(assert (=> b!43794 (=> (not res!25916) (not e!27754))))

(assert (=> b!43794 (= res!25916 (and (not (= (_1!816 lt!19046) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!816 lt!19046) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19040 () Unit!1233)

(declare-fun lemmaKeyInListMapIsInArray!109 (array!2925 array!2927 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 64) Int) Unit!1233)

(assert (=> b!43794 (= lt!19040 (lemmaKeyInListMapIsInArray!109 lt!19045 lt!19042 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 (_1!816 lt!19046) defaultEntry!470))))

(declare-fun head!888 (List!1188) tuple2!1610)

(assert (=> b!43794 (= lt!19046 (head!888 (toList!606 lt!19043)))))

(declare-fun res!25915 () Bool)

(assert (=> start!6656 (=> (not res!25915) (not e!27755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6656 (= res!25915 (validMask!0 mask!853))))

(assert (=> start!6656 e!27755))

(assert (=> start!6656 true))

(assert (=> start!6656 tp!5948))

(declare-fun b!43795 () Bool)

(declare-fun arrayContainsKey!0 (array!2925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43795 (= e!27754 (arrayContainsKey!0 lt!19045 (_1!816 lt!19046) #b00000000000000000000000000000000))))

(assert (= (and start!6656 res!25915) b!43792))

(assert (= (and b!43792 (not res!25914)) b!43793))

(assert (= (and b!43793 (not res!25913)) b!43794))

(assert (= (and b!43794 res!25916) b!43795))

(declare-fun b_lambda!2297 () Bool)

(assert (=> (not b_lambda!2297) (not b!43792)))

(declare-fun t!4196 () Bool)

(declare-fun tb!995 () Bool)

(assert (=> (and start!6656 (= defaultEntry!470 defaultEntry!470) t!4196) tb!995))

(declare-fun result!1735 () Bool)

(declare-fun tp_is_empty!1897 () Bool)

(assert (=> tb!995 (= result!1735 tp_is_empty!1897)))

(assert (=> b!43792 t!4196))

(declare-fun b_and!2687 () Bool)

(assert (= b_and!2685 (and (=> t!4196 result!1735) b_and!2687)))

(declare-fun m!37957 () Bool)

(assert (=> b!43795 m!37957))

(declare-fun m!37959 () Bool)

(assert (=> b!43793 m!37959))

(declare-fun m!37961 () Bool)

(assert (=> b!43792 m!37961))

(declare-fun m!37963 () Bool)

(assert (=> b!43792 m!37963))

(declare-fun m!37965 () Bool)

(assert (=> b!43792 m!37965))

(declare-fun m!37967 () Bool)

(assert (=> b!43792 m!37967))

(declare-fun m!37969 () Bool)

(assert (=> b!43792 m!37969))

(declare-fun m!37971 () Bool)

(assert (=> b!43792 m!37971))

(declare-fun m!37973 () Bool)

(assert (=> b!43792 m!37973))

(declare-fun m!37975 () Bool)

(assert (=> b!43792 m!37975))

(declare-fun m!37977 () Bool)

(assert (=> start!6656 m!37977))

(declare-fun m!37979 () Bool)

(assert (=> b!43794 m!37979))

(declare-fun m!37981 () Bool)

(assert (=> b!43794 m!37981))

(declare-fun m!37983 () Bool)

(assert (=> b!43794 m!37983))

(check-sat tp_is_empty!1897 (not b_lambda!2297) b_and!2687 (not start!6656) (not b!43794) (not b!43792) (not b!43793) (not b!43795) (not b_next!1507))
(check-sat b_and!2687 (not b_next!1507))
(get-model)

(declare-fun b_lambda!2303 () Bool)

(assert (= b_lambda!2297 (or (and start!6656 b_free!1507) b_lambda!2303)))

(check-sat tp_is_empty!1897 b_and!2687 (not b_lambda!2303) (not start!6656) (not b!43794) (not b!43792) (not b!43793) (not b!43795) (not b_next!1507))
(check-sat b_and!2687 (not b_next!1507))
(get-model)

(declare-fun d!8185 () Bool)

(declare-fun res!25961 () Bool)

(declare-fun e!27799 () Bool)

(assert (=> d!8185 (=> res!25961 e!27799)))

(assert (=> d!8185 (= res!25961 (bvsge #b00000000000000000000000000000000 (size!1603 lt!19045)))))

(assert (=> d!8185 (= (arrayNoDuplicates!0 lt!19045 #b00000000000000000000000000000000 Nil!1186) e!27799)))

(declare-fun b!43852 () Bool)

(declare-fun e!27797 () Bool)

(assert (=> b!43852 (= e!27799 e!27797)))

(declare-fun res!25959 () Bool)

(assert (=> b!43852 (=> (not res!25959) (not e!27797))))

(declare-fun e!27800 () Bool)

(assert (=> b!43852 (= res!25959 (not e!27800))))

(declare-fun res!25960 () Bool)

(assert (=> b!43852 (=> (not res!25960) (not e!27800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!43852 (= res!25960 (validKeyInArray!0 (select (arr!1406 lt!19045) #b00000000000000000000000000000000)))))

(declare-fun b!43853 () Bool)

(declare-fun e!27798 () Bool)

(declare-fun call!3513 () Bool)

(assert (=> b!43853 (= e!27798 call!3513)))

(declare-fun b!43854 () Bool)

(assert (=> b!43854 (= e!27798 call!3513)))

(declare-fun bm!3510 () Bool)

(declare-fun c!5667 () Bool)

(assert (=> bm!3510 (= call!3513 (arrayNoDuplicates!0 lt!19045 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5667 (Cons!1185 (select (arr!1406 lt!19045) #b00000000000000000000000000000000) Nil!1186) Nil!1186)))))

(declare-fun b!43855 () Bool)

(assert (=> b!43855 (= e!27797 e!27798)))

(assert (=> b!43855 (= c!5667 (validKeyInArray!0 (select (arr!1406 lt!19045) #b00000000000000000000000000000000)))))

(declare-fun b!43856 () Bool)

(declare-fun contains!562 (List!1189 (_ BitVec 64)) Bool)

(assert (=> b!43856 (= e!27800 (contains!562 Nil!1186 (select (arr!1406 lt!19045) #b00000000000000000000000000000000)))))

(assert (= (and d!8185 (not res!25961)) b!43852))

(assert (= (and b!43852 res!25960) b!43856))

(assert (= (and b!43852 res!25959) b!43855))

(assert (= (and b!43855 c!5667) b!43854))

(assert (= (and b!43855 (not c!5667)) b!43853))

(assert (= (or b!43854 b!43853) bm!3510))

(declare-fun m!38047 () Bool)

(assert (=> b!43852 m!38047))

(assert (=> b!43852 m!38047))

(declare-fun m!38049 () Bool)

(assert (=> b!43852 m!38049))

(assert (=> bm!3510 m!38047))

(declare-fun m!38051 () Bool)

(assert (=> bm!3510 m!38051))

(assert (=> b!43855 m!38047))

(assert (=> b!43855 m!38047))

(assert (=> b!43855 m!38049))

(assert (=> b!43856 m!38047))

(assert (=> b!43856 m!38047))

(declare-fun m!38053 () Bool)

(assert (=> b!43856 m!38053))

(assert (=> b!43792 d!8185))

(declare-fun b!43870 () Bool)

(declare-fun e!27812 () Bool)

(declare-fun e!27813 () Bool)

(assert (=> b!43870 (= e!27812 e!27813)))

(declare-fun lt!19125 () (_ BitVec 64))

(assert (=> b!43870 (= lt!19125 (select (arr!1406 lt!19045) #b00000000000000000000000000000000))))

(declare-fun lt!19124 () Unit!1233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2925 (_ BitVec 64) (_ BitVec 32)) Unit!1233)

(assert (=> b!43870 (= lt!19124 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19045 lt!19125 #b00000000000000000000000000000000))))

(assert (=> b!43870 (arrayContainsKey!0 lt!19045 lt!19125 #b00000000000000000000000000000000)))

(declare-fun lt!19126 () Unit!1233)

(assert (=> b!43870 (= lt!19126 lt!19124)))

(declare-fun res!25970 () Bool)

(declare-datatypes ((SeekEntryResult!193 0))(
  ( (MissingZero!193 (index!2894 (_ BitVec 32))) (Found!193 (index!2895 (_ BitVec 32))) (Intermediate!193 (undefined!1005 Bool) (index!2896 (_ BitVec 32)) (x!8314 (_ BitVec 32))) (Undefined!193) (MissingVacant!193 (index!2897 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2925 (_ BitVec 32)) SeekEntryResult!193)

(assert (=> b!43870 (= res!25970 (= (seekEntryOrOpen!0 (select (arr!1406 lt!19045) #b00000000000000000000000000000000) lt!19045 mask!853) (Found!193 #b00000000000000000000000000000000)))))

(assert (=> b!43870 (=> (not res!25970) (not e!27813))))

(declare-fun b!43871 () Bool)

(declare-fun call!3519 () Bool)

(assert (=> b!43871 (= e!27812 call!3519)))

(declare-fun b!43872 () Bool)

(assert (=> b!43872 (= e!27813 call!3519)))

(declare-fun d!8191 () Bool)

(declare-fun res!25969 () Bool)

(declare-fun e!27811 () Bool)

(assert (=> d!8191 (=> res!25969 e!27811)))

(assert (=> d!8191 (= res!25969 (bvsge #b00000000000000000000000000000000 (size!1603 lt!19045)))))

(assert (=> d!8191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19045 mask!853) e!27811)))

(declare-fun b!43873 () Bool)

(assert (=> b!43873 (= e!27811 e!27812)))

(declare-fun c!5671 () Bool)

(assert (=> b!43873 (= c!5671 (validKeyInArray!0 (select (arr!1406 lt!19045) #b00000000000000000000000000000000)))))

(declare-fun bm!3516 () Bool)

(assert (=> bm!3516 (= call!3519 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19045 mask!853))))

(assert (= (and d!8191 (not res!25969)) b!43873))

(assert (= (and b!43873 c!5671) b!43870))

(assert (= (and b!43873 (not c!5671)) b!43871))

(assert (= (and b!43870 res!25970) b!43872))

(assert (= (or b!43872 b!43871) bm!3516))

(assert (=> b!43870 m!38047))

(declare-fun m!38067 () Bool)

(assert (=> b!43870 m!38067))

(declare-fun m!38069 () Bool)

(assert (=> b!43870 m!38069))

(assert (=> b!43870 m!38047))

(declare-fun m!38071 () Bool)

(assert (=> b!43870 m!38071))

(assert (=> b!43873 m!38047))

(assert (=> b!43873 m!38047))

(assert (=> b!43873 m!38049))

(declare-fun m!38073 () Bool)

(assert (=> bm!3516 m!38073))

(assert (=> b!43792 d!8191))

(declare-fun d!8201 () Bool)

(assert (=> d!8201 (arrayNoDuplicates!0 lt!19045 #b00000000000000000000000000000000 Nil!1186)))

(declare-fun lt!19129 () Unit!1233)

(declare-fun choose!111 (array!2925 (_ BitVec 32) (_ BitVec 32) List!1189) Unit!1233)

(assert (=> d!8201 (= lt!19129 (choose!111 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1186))))

(assert (=> d!8201 (= (size!1603 lt!19045) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8201 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1186) lt!19129)))

(declare-fun bs!1993 () Bool)

(assert (= bs!1993 d!8201))

(assert (=> bs!1993 m!37967))

(declare-fun m!38077 () Bool)

(assert (=> bs!1993 m!38077))

(assert (=> b!43792 d!8201))

(declare-fun d!8205 () Bool)

(declare-fun getCurrentListMap!336 (array!2925 array!2927 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 32) Int) ListLongMap!1181)

(assert (=> d!8205 (= (map!837 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000)) (getCurrentListMap!336 (_keys!3451 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000)) (_values!1873 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000)) (mask!5456 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000)) (extraKeys!1781 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000)) (zeroValue!1808 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000)) (minValue!1808 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1890 (LongMapFixedSize!383 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 #b00000000000000000000000000000000 lt!19045 lt!19042 #b00000000000000000000000000000000))))))

(declare-fun bs!1994 () Bool)

(assert (= bs!1994 d!8205))

(declare-fun m!38087 () Bool)

(assert (=> bs!1994 m!38087))

(assert (=> b!43792 d!8205))

(declare-fun d!8211 () Bool)

(assert (=> d!8211 (= (arrayCountValidKeys!0 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19141 () Unit!1233)

(declare-fun choose!59 (array!2925 (_ BitVec 32) (_ BitVec 32)) Unit!1233)

(assert (=> d!8211 (= lt!19141 (choose!59 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8211 (bvslt (size!1603 lt!19045) #b01111111111111111111111111111111)))

(assert (=> d!8211 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19141)))

(declare-fun bs!1995 () Bool)

(assert (= bs!1995 d!8211))

(assert (=> bs!1995 m!37961))

(declare-fun m!38089 () Bool)

(assert (=> bs!1995 m!38089))

(assert (=> b!43792 d!8211))

(declare-fun d!8213 () Bool)

(assert (=> d!8213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19045 mask!853)))

(declare-fun lt!19156 () Unit!1233)

(declare-fun choose!34 (array!2925 (_ BitVec 32) (_ BitVec 32)) Unit!1233)

(assert (=> d!8213 (= lt!19156 (choose!34 lt!19045 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8213 (validMask!0 mask!853)))

(assert (=> d!8213 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19045 mask!853 #b00000000000000000000000000000000) lt!19156)))

(declare-fun bs!1996 () Bool)

(assert (= bs!1996 d!8213))

(assert (=> bs!1996 m!37973))

(declare-fun m!38107 () Bool)

(assert (=> bs!1996 m!38107))

(assert (=> bs!1996 m!37977))

(assert (=> b!43792 d!8213))

(declare-fun b!43933 () Bool)

(declare-fun e!27854 () (_ BitVec 32))

(assert (=> b!43933 (= e!27854 #b00000000000000000000000000000000)))

(declare-fun b!43934 () Bool)

(declare-fun e!27855 () (_ BitVec 32))

(declare-fun call!3534 () (_ BitVec 32))

(assert (=> b!43934 (= e!27855 (bvadd #b00000000000000000000000000000001 call!3534))))

(declare-fun b!43935 () Bool)

(assert (=> b!43935 (= e!27855 call!3534)))

(declare-fun bm!3531 () Bool)

(assert (=> bm!3531 (= call!3534 (arrayCountValidKeys!0 lt!19045 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!8219 () Bool)

(declare-fun lt!19165 () (_ BitVec 32))

(assert (=> d!8219 (and (bvsge lt!19165 #b00000000000000000000000000000000) (bvsle lt!19165 (bvsub (size!1603 lt!19045) #b00000000000000000000000000000000)))))

(assert (=> d!8219 (= lt!19165 e!27854)))

(declare-fun c!5691 () Bool)

(assert (=> d!8219 (= c!5691 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8219 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1603 lt!19045)))))

(assert (=> d!8219 (= (arrayCountValidKeys!0 lt!19045 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19165)))

(declare-fun b!43936 () Bool)

(assert (=> b!43936 (= e!27854 e!27855)))

(declare-fun c!5692 () Bool)

(assert (=> b!43936 (= c!5692 (validKeyInArray!0 (select (arr!1406 lt!19045) #b00000000000000000000000000000000)))))

(assert (= (and d!8219 c!5691) b!43933))

(assert (= (and d!8219 (not c!5691)) b!43936))

(assert (= (and b!43936 c!5692) b!43934))

(assert (= (and b!43936 (not c!5692)) b!43935))

(assert (= (or b!43934 b!43935) bm!3531))

(declare-fun m!38115 () Bool)

(assert (=> bm!3531 m!38115))

(assert (=> b!43936 m!38047))

(assert (=> b!43936 m!38047))

(assert (=> b!43936 m!38049))

(assert (=> b!43792 d!8219))

(declare-fun d!8227 () Bool)

(assert (=> d!8227 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6656 d!8227))

(declare-fun d!8237 () Bool)

(declare-fun res!25996 () Bool)

(declare-fun e!27866 () Bool)

(assert (=> d!8237 (=> res!25996 e!27866)))

(assert (=> d!8237 (= res!25996 (= (select (arr!1406 lt!19045) #b00000000000000000000000000000000) (_1!816 lt!19046)))))

(assert (=> d!8237 (= (arrayContainsKey!0 lt!19045 (_1!816 lt!19046) #b00000000000000000000000000000000) e!27866)))

(declare-fun b!43953 () Bool)

(declare-fun e!27867 () Bool)

(assert (=> b!43953 (= e!27866 e!27867)))

(declare-fun res!25997 () Bool)

(assert (=> b!43953 (=> (not res!25997) (not e!27867))))

(assert (=> b!43953 (= res!25997 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1603 lt!19045)))))

(declare-fun b!43954 () Bool)

(assert (=> b!43954 (= e!27867 (arrayContainsKey!0 lt!19045 (_1!816 lt!19046) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8237 (not res!25996)) b!43953))

(assert (= (and b!43953 res!25997) b!43954))

(assert (=> d!8237 m!38047))

(declare-fun m!38121 () Bool)

(assert (=> b!43954 m!38121))

(assert (=> b!43795 d!8237))

(declare-fun d!8239 () Bool)

(get-info :version)

(assert (=> d!8239 (= (isEmpty!290 (toList!606 lt!19043)) ((_ is Nil!1185) (toList!606 lt!19043)))))

(assert (=> b!43793 d!8239))

(declare-fun d!8241 () Bool)

(declare-fun lt!19184 () (_ BitVec 32))

(assert (=> d!8241 (and (or (bvslt lt!19184 #b00000000000000000000000000000000) (bvsge lt!19184 (size!1603 lt!19045)) (and (bvsge lt!19184 #b00000000000000000000000000000000) (bvslt lt!19184 (size!1603 lt!19045)))) (bvsge lt!19184 #b00000000000000000000000000000000) (bvslt lt!19184 (size!1603 lt!19045)) (= (select (arr!1406 lt!19045) lt!19184) (_1!816 lt!19046)))))

(declare-fun e!27880 () (_ BitVec 32))

(assert (=> d!8241 (= lt!19184 e!27880)))

(declare-fun c!5711 () Bool)

(assert (=> d!8241 (= c!5711 (= (select (arr!1406 lt!19045) #b00000000000000000000000000000000) (_1!816 lt!19046)))))

(assert (=> d!8241 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1603 lt!19045)) (bvslt (size!1603 lt!19045) #b01111111111111111111111111111111))))

(assert (=> d!8241 (= (arrayScanForKey!0 lt!19045 (_1!816 lt!19046) #b00000000000000000000000000000000) lt!19184)))

(declare-fun b!43979 () Bool)

(assert (=> b!43979 (= e!27880 #b00000000000000000000000000000000)))

(declare-fun b!43980 () Bool)

(assert (=> b!43980 (= e!27880 (arrayScanForKey!0 lt!19045 (_1!816 lt!19046) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8241 c!5711) b!43979))

(assert (= (and d!8241 (not c!5711)) b!43980))

(declare-fun m!38131 () Bool)

(assert (=> d!8241 m!38131))

(assert (=> d!8241 m!38047))

(declare-fun m!38133 () Bool)

(assert (=> b!43980 m!38133))

(assert (=> b!43794 d!8241))

(declare-fun d!8247 () Bool)

(declare-fun e!27891 () Bool)

(assert (=> d!8247 e!27891))

(declare-fun c!5716 () Bool)

(assert (=> d!8247 (= c!5716 (and (not (= (_1!816 lt!19046) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!816 lt!19046) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19189 () Unit!1233)

(declare-fun choose!268 (array!2925 array!2927 (_ BitVec 32) (_ BitVec 32) V!2317 V!2317 (_ BitVec 64) Int) Unit!1233)

(assert (=> d!8247 (= lt!19189 (choose!268 lt!19045 lt!19042 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 (_1!816 lt!19046) defaultEntry!470))))

(assert (=> d!8247 (validMask!0 mask!853)))

(assert (=> d!8247 (= (lemmaKeyInListMapIsInArray!109 lt!19045 lt!19042 mask!853 #b00000000000000000000000000000000 lt!19048 lt!19048 (_1!816 lt!19046) defaultEntry!470) lt!19189)))

(declare-fun b!43995 () Bool)

(assert (=> b!43995 (= e!27891 (arrayContainsKey!0 lt!19045 (_1!816 lt!19046) #b00000000000000000000000000000000))))

(declare-fun b!43996 () Bool)

(assert (=> b!43996 (= e!27891 (ite (= (_1!816 lt!19046) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8247 c!5716) b!43995))

(assert (= (and d!8247 (not c!5716)) b!43996))

(declare-fun m!38141 () Bool)

(assert (=> d!8247 m!38141))

(assert (=> d!8247 m!37977))

(assert (=> b!43995 m!37957))

(assert (=> b!43794 d!8247))

(declare-fun d!8257 () Bool)

(assert (=> d!8257 (= (head!888 (toList!606 lt!19043)) (h!1761 (toList!606 lt!19043)))))

(assert (=> b!43794 d!8257))

(check-sat (not b!43995) (not b!43855) (not d!8247) (not b!43954) (not bm!3510) b_and!2687 (not bm!3516) (not b!43936) (not b!43852) (not d!8205) (not b_lambda!2303) tp_is_empty!1897 (not b!43870) (not b!43856) (not bm!3531) (not d!8201) (not b!43873) (not d!8213) (not b_next!1507) (not d!8211) (not b!43980))
(check-sat b_and!2687 (not b_next!1507))
