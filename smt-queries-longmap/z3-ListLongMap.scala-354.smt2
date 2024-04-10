; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6468 () Bool)

(assert start!6468)

(declare-fun b_free!1503 () Bool)

(declare-fun b_next!1503 () Bool)

(assert (=> start!6468 (= b_free!1503 (not b_next!1503))))

(declare-fun tp!5942 () Bool)

(declare-fun b_and!2655 () Bool)

(assert (=> start!6468 (= tp!5942 b_and!2655)))

(declare-fun b!43003 () Bool)

(declare-fun res!25555 () Bool)

(declare-fun e!27253 () Bool)

(assert (=> b!43003 (=> res!25555 e!27253)))

(declare-datatypes ((V!2311 0))(
  ( (V!2312 (val!985 Int)) )
))
(declare-datatypes ((tuple2!1624 0))(
  ( (tuple2!1625 (_1!823 (_ BitVec 64)) (_2!823 V!2311)) )
))
(declare-datatypes ((List!1198 0))(
  ( (Nil!1195) (Cons!1194 (h!1771 tuple2!1624) (t!4197 List!1198)) )
))
(declare-datatypes ((ListLongMap!1201 0))(
  ( (ListLongMap!1202 (toList!616 List!1198)) )
))
(declare-fun lt!18380 () ListLongMap!1201)

(declare-fun isEmpty!278 (List!1198) Bool)

(assert (=> b!43003 (= res!25555 (isEmpty!278 (toList!616 lt!18380)))))

(declare-fun b!43004 () Bool)

(declare-fun res!25557 () Bool)

(assert (=> b!43004 (=> res!25557 e!27253)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!43004 (= res!25557 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun res!25556 () Bool)

(declare-fun e!27252 () Bool)

(assert (=> start!6468 (=> (not res!25556) (not e!27252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6468 (= res!25556 (validMask!0 mask!853))))

(assert (=> start!6468 e!27252))

(assert (=> start!6468 true))

(assert (=> start!6468 tp!5942))

(declare-fun b!43002 () Bool)

(assert (=> b!43002 (= e!27252 (not e!27253))))

(declare-fun res!25554 () Bool)

(assert (=> b!43002 (=> res!25554 e!27253)))

(assert (=> b!43002 (= res!25554 (= lt!18380 (ListLongMap!1202 Nil!1195)))))

(declare-datatypes ((array!2931 0))(
  ( (array!2932 (arr!1409 (Array (_ BitVec 32) (_ BitVec 64))) (size!1594 (_ BitVec 32))) )
))
(declare-fun lt!18374 () array!2931)

(declare-fun lt!18377 () V!2311)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!699 0))(
  ( (ValueCellFull!699 (v!2075 V!2311)) (EmptyCell!699) )
))
(declare-datatypes ((array!2933 0))(
  ( (array!2934 (arr!1410 (Array (_ BitVec 32) ValueCell!699)) (size!1595 (_ BitVec 32))) )
))
(declare-fun lt!18378 () array!2933)

(declare-datatypes ((LongMapFixedSize!378 0))(
  ( (LongMapFixedSize!379 (defaultEntry!1882 Int) (mask!5431 (_ BitVec 32)) (extraKeys!1773 (_ BitVec 32)) (zeroValue!1800 V!2311) (minValue!1800 V!2311) (_size!238 (_ BitVec 32)) (_keys!3431 array!2931) (_values!1865 array!2933) (_vacant!238 (_ BitVec 32))) )
))
(declare-fun map!833 (LongMapFixedSize!378) ListLongMap!1201)

(assert (=> b!43002 (= lt!18380 (map!833 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1199 0))(
  ( (Nil!1196) (Cons!1195 (h!1772 (_ BitVec 64)) (t!4198 List!1199)) )
))
(declare-fun arrayNoDuplicates!0 (array!2931 (_ BitVec 32) List!1199) Bool)

(assert (=> b!43002 (arrayNoDuplicates!0 lt!18374 #b00000000000000000000000000000000 Nil!1196)))

(declare-datatypes ((Unit!1199 0))(
  ( (Unit!1200) )
))
(declare-fun lt!18379 () Unit!1199)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2931 (_ BitVec 32) (_ BitVec 32) List!1199) Unit!1199)

(assert (=> b!43002 (= lt!18379 (lemmaArrayNoDuplicatesInAll0Array!0 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2931 (_ BitVec 32)) Bool)

(assert (=> b!43002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18374 mask!853)))

(declare-fun lt!18376 () Unit!1199)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2931 (_ BitVec 32) (_ BitVec 32)) Unit!1199)

(assert (=> b!43002 (= lt!18376 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18374 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2931 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43002 (= (arrayCountValidKeys!0 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18375 () Unit!1199)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2931 (_ BitVec 32) (_ BitVec 32)) Unit!1199)

(assert (=> b!43002 (= lt!18375 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43002 (= lt!18378 (array!2934 ((as const (Array (_ BitVec 32) ValueCell!699)) EmptyCell!699) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43002 (= lt!18374 (array!2932 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!260 (Int (_ BitVec 64)) V!2311)

(assert (=> b!43002 (= lt!18377 (dynLambda!260 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43005 () Bool)

(declare-fun contains!563 (ListLongMap!1201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!350 (array!2931 array!2933 (_ BitVec 32) (_ BitVec 32) V!2311 V!2311 (_ BitVec 32) Int) ListLongMap!1201)

(declare-fun head!888 (List!1198) tuple2!1624)

(assert (=> b!43005 (= e!27253 (contains!563 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470) (_1!823 (head!888 (toList!616 lt!18380)))))))

(assert (= (and start!6468 res!25556) b!43002))

(assert (= (and b!43002 (not res!25554)) b!43003))

(assert (= (and b!43003 (not res!25555)) b!43004))

(assert (= (and b!43004 (not res!25557)) b!43005))

(declare-fun b_lambda!2245 () Bool)

(assert (=> (not b_lambda!2245) (not b!43002)))

(declare-fun t!4196 () Bool)

(declare-fun tb!985 () Bool)

(assert (=> (and start!6468 (= defaultEntry!470 defaultEntry!470) t!4196) tb!985))

(declare-fun result!1721 () Bool)

(declare-fun tp_is_empty!1893 () Bool)

(assert (=> tb!985 (= result!1721 tp_is_empty!1893)))

(assert (=> b!43002 t!4196))

(declare-fun b_and!2657 () Bool)

(assert (= b_and!2655 (and (=> t!4196 result!1721) b_and!2657)))

(declare-fun m!36913 () Bool)

(assert (=> b!43003 m!36913))

(declare-fun m!36915 () Bool)

(assert (=> start!6468 m!36915))

(declare-fun m!36917 () Bool)

(assert (=> b!43002 m!36917))

(declare-fun m!36919 () Bool)

(assert (=> b!43002 m!36919))

(declare-fun m!36921 () Bool)

(assert (=> b!43002 m!36921))

(declare-fun m!36923 () Bool)

(assert (=> b!43002 m!36923))

(declare-fun m!36925 () Bool)

(assert (=> b!43002 m!36925))

(declare-fun m!36927 () Bool)

(assert (=> b!43002 m!36927))

(declare-fun m!36929 () Bool)

(assert (=> b!43002 m!36929))

(declare-fun m!36931 () Bool)

(assert (=> b!43002 m!36931))

(declare-fun m!36933 () Bool)

(assert (=> b!43005 m!36933))

(declare-fun m!36935 () Bool)

(assert (=> b!43005 m!36935))

(assert (=> b!43005 m!36933))

(declare-fun m!36937 () Bool)

(assert (=> b!43005 m!36937))

(check-sat b_and!2657 (not b_lambda!2245) (not start!6468) tp_is_empty!1893 (not b!43003) (not b_next!1503) (not b!43002) (not b!43005))
(check-sat b_and!2657 (not b_next!1503))
(get-model)

(declare-fun b_lambda!2249 () Bool)

(assert (= b_lambda!2245 (or (and start!6468 b_free!1503) b_lambda!2249)))

(check-sat b_and!2657 (not start!6468) (not b_lambda!2249) tp_is_empty!1893 (not b!43003) (not b_next!1503) (not b!43002) (not b!43005))
(check-sat b_and!2657 (not b_next!1503))
(get-model)

(declare-fun d!7879 () Bool)

(get-info :version)

(assert (=> d!7879 (= (isEmpty!278 (toList!616 lt!18380)) ((_ is Nil!1195) (toList!616 lt!18380)))))

(assert (=> b!43003 d!7879))

(declare-fun d!7881 () Bool)

(assert (=> d!7881 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6468 d!7881))

(declare-fun d!7891 () Bool)

(declare-fun e!27283 () Bool)

(assert (=> d!7891 e!27283))

(declare-fun res!25584 () Bool)

(assert (=> d!7891 (=> res!25584 e!27283)))

(declare-fun lt!18433 () Bool)

(assert (=> d!7891 (= res!25584 (not lt!18433))))

(declare-fun lt!18434 () Bool)

(assert (=> d!7891 (= lt!18433 lt!18434)))

(declare-fun lt!18432 () Unit!1199)

(declare-fun e!27282 () Unit!1199)

(assert (=> d!7891 (= lt!18432 e!27282)))

(declare-fun c!5456 () Bool)

(assert (=> d!7891 (= c!5456 lt!18434)))

(declare-fun containsKey!73 (List!1198 (_ BitVec 64)) Bool)

(assert (=> d!7891 (= lt!18434 (containsKey!73 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))))))

(assert (=> d!7891 (= (contains!563 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470) (_1!823 (head!888 (toList!616 lt!18380)))) lt!18433)))

(declare-fun b!43052 () Bool)

(declare-fun lt!18431 () Unit!1199)

(assert (=> b!43052 (= e!27282 lt!18431)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!60 (List!1198 (_ BitVec 64)) Unit!1199)

(assert (=> b!43052 (= lt!18431 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))))))

(declare-datatypes ((Option!110 0))(
  ( (Some!109 (v!2077 V!2311)) (None!108) )
))
(declare-fun isDefined!61 (Option!110) Bool)

(declare-fun getValueByKey!104 (List!1198 (_ BitVec 64)) Option!110)

(assert (=> b!43052 (isDefined!61 (getValueByKey!104 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))))))

(declare-fun b!43053 () Bool)

(declare-fun Unit!1203 () Unit!1199)

(assert (=> b!43053 (= e!27282 Unit!1203)))

(declare-fun b!43054 () Bool)

(assert (=> b!43054 (= e!27283 (isDefined!61 (getValueByKey!104 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380))))))))

(assert (= (and d!7891 c!5456) b!43052))

(assert (= (and d!7891 (not c!5456)) b!43053))

(assert (= (and d!7891 (not res!25584)) b!43054))

(declare-fun m!36987 () Bool)

(assert (=> d!7891 m!36987))

(declare-fun m!36989 () Bool)

(assert (=> b!43052 m!36989))

(declare-fun m!36991 () Bool)

(assert (=> b!43052 m!36991))

(assert (=> b!43052 m!36991))

(declare-fun m!36993 () Bool)

(assert (=> b!43052 m!36993))

(assert (=> b!43054 m!36991))

(assert (=> b!43054 m!36991))

(assert (=> b!43054 m!36993))

(assert (=> b!43005 d!7891))

(declare-fun b!43193 () Bool)

(declare-fun e!27377 () ListLongMap!1201)

(declare-fun call!3443 () ListLongMap!1201)

(assert (=> b!43193 (= e!27377 call!3443)))

(declare-fun b!43194 () Bool)

(declare-fun e!27379 () ListLongMap!1201)

(assert (=> b!43194 (= e!27379 e!27377)))

(declare-fun c!5504 () Bool)

(assert (=> b!43194 (= c!5504 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43195 () Bool)

(declare-fun e!27373 () Bool)

(declare-fun e!27371 () Bool)

(assert (=> b!43195 (= e!27373 e!27371)))

(declare-fun res!25641 () Bool)

(declare-fun call!3446 () Bool)

(assert (=> b!43195 (= res!25641 call!3446)))

(assert (=> b!43195 (=> (not res!25641) (not e!27371))))

(declare-fun b!43196 () Bool)

(declare-fun e!27382 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!43196 (= e!27382 (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun b!43197 () Bool)

(declare-fun c!5501 () Bool)

(assert (=> b!43197 (= c!5501 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!27376 () ListLongMap!1201)

(assert (=> b!43197 (= e!27377 e!27376)))

(declare-fun b!43198 () Bool)

(assert (=> b!43198 (= e!27373 (not call!3446))))

(declare-fun b!43199 () Bool)

(declare-fun e!27378 () Unit!1199)

(declare-fun lt!18575 () Unit!1199)

(assert (=> b!43199 (= e!27378 lt!18575)))

(declare-fun lt!18585 () ListLongMap!1201)

(declare-fun getCurrentListMapNoExtraKeys!36 (array!2931 array!2933 (_ BitVec 32) (_ BitVec 32) V!2311 V!2311 (_ BitVec 32) Int) ListLongMap!1201)

(assert (=> b!43199 (= lt!18585 (getCurrentListMapNoExtraKeys!36 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18569 () (_ BitVec 64))

(assert (=> b!43199 (= lt!18569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18571 () (_ BitVec 64))

(assert (=> b!43199 (= lt!18571 (select (arr!1409 lt!18374) #b00000000000000000000000000000000))))

(declare-fun lt!18580 () Unit!1199)

(declare-fun addStillContains!34 (ListLongMap!1201 (_ BitVec 64) V!2311 (_ BitVec 64)) Unit!1199)

(assert (=> b!43199 (= lt!18580 (addStillContains!34 lt!18585 lt!18569 lt!18377 lt!18571))))

(declare-fun +!67 (ListLongMap!1201 tuple2!1624) ListLongMap!1201)

(assert (=> b!43199 (contains!563 (+!67 lt!18585 (tuple2!1625 lt!18569 lt!18377)) lt!18571)))

(declare-fun lt!18589 () Unit!1199)

(assert (=> b!43199 (= lt!18589 lt!18580)))

(declare-fun lt!18573 () ListLongMap!1201)

(assert (=> b!43199 (= lt!18573 (getCurrentListMapNoExtraKeys!36 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18578 () (_ BitVec 64))

(assert (=> b!43199 (= lt!18578 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18572 () (_ BitVec 64))

(assert (=> b!43199 (= lt!18572 (select (arr!1409 lt!18374) #b00000000000000000000000000000000))))

(declare-fun lt!18582 () Unit!1199)

(declare-fun addApplyDifferent!34 (ListLongMap!1201 (_ BitVec 64) V!2311 (_ BitVec 64)) Unit!1199)

(assert (=> b!43199 (= lt!18582 (addApplyDifferent!34 lt!18573 lt!18578 lt!18377 lt!18572))))

(declare-fun apply!59 (ListLongMap!1201 (_ BitVec 64)) V!2311)

(assert (=> b!43199 (= (apply!59 (+!67 lt!18573 (tuple2!1625 lt!18578 lt!18377)) lt!18572) (apply!59 lt!18573 lt!18572))))

(declare-fun lt!18587 () Unit!1199)

(assert (=> b!43199 (= lt!18587 lt!18582)))

(declare-fun lt!18576 () ListLongMap!1201)

(assert (=> b!43199 (= lt!18576 (getCurrentListMapNoExtraKeys!36 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18577 () (_ BitVec 64))

(assert (=> b!43199 (= lt!18577 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18579 () (_ BitVec 64))

(assert (=> b!43199 (= lt!18579 (select (arr!1409 lt!18374) #b00000000000000000000000000000000))))

(declare-fun lt!18588 () Unit!1199)

(assert (=> b!43199 (= lt!18588 (addApplyDifferent!34 lt!18576 lt!18577 lt!18377 lt!18579))))

(assert (=> b!43199 (= (apply!59 (+!67 lt!18576 (tuple2!1625 lt!18577 lt!18377)) lt!18579) (apply!59 lt!18576 lt!18579))))

(declare-fun lt!18574 () Unit!1199)

(assert (=> b!43199 (= lt!18574 lt!18588)))

(declare-fun lt!18586 () ListLongMap!1201)

(assert (=> b!43199 (= lt!18586 (getCurrentListMapNoExtraKeys!36 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun lt!18584 () (_ BitVec 64))

(assert (=> b!43199 (= lt!18584 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18583 () (_ BitVec 64))

(assert (=> b!43199 (= lt!18583 (select (arr!1409 lt!18374) #b00000000000000000000000000000000))))

(assert (=> b!43199 (= lt!18575 (addApplyDifferent!34 lt!18586 lt!18584 lt!18377 lt!18583))))

(assert (=> b!43199 (= (apply!59 (+!67 lt!18586 (tuple2!1625 lt!18584 lt!18377)) lt!18583) (apply!59 lt!18586 lt!18583))))

(declare-fun call!3444 () ListLongMap!1201)

(declare-fun c!5503 () Bool)

(declare-fun call!3445 () ListLongMap!1201)

(declare-fun bm!3437 () Bool)

(declare-fun call!3440 () ListLongMap!1201)

(declare-fun call!3442 () ListLongMap!1201)

(assert (=> bm!3437 (= call!3444 (+!67 (ite c!5503 call!3440 (ite c!5504 call!3442 call!3445)) (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))))))

(declare-fun b!43200 () Bool)

(declare-fun res!25639 () Bool)

(declare-fun e!27381 () Bool)

(assert (=> b!43200 (=> (not res!25639) (not e!27381))))

(assert (=> b!43200 (= res!25639 e!27373)))

(declare-fun c!5499 () Bool)

(assert (=> b!43200 (= c!5499 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!3438 () Bool)

(declare-fun call!3441 () Bool)

(declare-fun lt!18581 () ListLongMap!1201)

(assert (=> bm!3438 (= call!3441 (contains!563 lt!18581 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43202 () Bool)

(declare-fun e!27380 () Bool)

(assert (=> b!43202 (= e!27380 (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun b!43203 () Bool)

(assert (=> b!43203 (= e!27376 call!3445)))

(declare-fun b!43204 () Bool)

(declare-fun e!27370 () Bool)

(assert (=> b!43204 (= e!27370 (= (apply!59 lt!18581 #b1000000000000000000000000000000000000000000000000000000000000000) lt!18377))))

(declare-fun b!43205 () Bool)

(declare-fun e!27375 () Bool)

(assert (=> b!43205 (= e!27375 e!27370)))

(declare-fun res!25647 () Bool)

(assert (=> b!43205 (= res!25647 call!3441)))

(assert (=> b!43205 (=> (not res!25647) (not e!27370))))

(declare-fun bm!3439 () Bool)

(assert (=> bm!3439 (= call!3443 call!3444)))

(declare-fun b!43206 () Bool)

(assert (=> b!43206 (= e!27379 (+!67 call!3444 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))))

(declare-fun b!43207 () Bool)

(assert (=> b!43207 (= e!27381 e!27375)))

(declare-fun c!5502 () Bool)

(assert (=> b!43207 (= c!5502 (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43208 () Bool)

(declare-fun res!25643 () Bool)

(assert (=> b!43208 (=> (not res!25643) (not e!27381))))

(declare-fun e!27374 () Bool)

(assert (=> b!43208 (= res!25643 e!27374)))

(declare-fun res!25645 () Bool)

(assert (=> b!43208 (=> res!25645 e!27374)))

(assert (=> b!43208 (= res!25645 (not e!27380))))

(declare-fun res!25642 () Bool)

(assert (=> b!43208 (=> (not res!25642) (not e!27380))))

(assert (=> b!43208 (= res!25642 (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(declare-fun e!27372 () Bool)

(declare-fun b!43209 () Bool)

(declare-fun get!786 (ValueCell!699 V!2311) V!2311)

(assert (=> b!43209 (= e!27372 (= (apply!59 lt!18581 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)) (get!786 (select (arr!1410 lt!18378) #b00000000000000000000000000000000) (dynLambda!260 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1595 lt!18378)))))

(assert (=> b!43209 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(declare-fun bm!3440 () Bool)

(assert (=> bm!3440 (= call!3445 call!3442)))

(declare-fun b!43210 () Bool)

(assert (=> b!43210 (= e!27374 e!27372)))

(declare-fun res!25644 () Bool)

(assert (=> b!43210 (=> (not res!25644) (not e!27372))))

(assert (=> b!43210 (= res!25644 (contains!563 lt!18581 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(assert (=> b!43210 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(declare-fun b!43211 () Bool)

(assert (=> b!43211 (= e!27375 (not call!3441))))

(declare-fun bm!3441 () Bool)

(assert (=> bm!3441 (= call!3440 (getCurrentListMapNoExtraKeys!36 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))))

(declare-fun b!43212 () Bool)

(declare-fun Unit!1205 () Unit!1199)

(assert (=> b!43212 (= e!27378 Unit!1205)))

(declare-fun bm!3442 () Bool)

(assert (=> bm!3442 (= call!3442 call!3440)))

(declare-fun bm!3443 () Bool)

(assert (=> bm!3443 (= call!3446 (contains!563 lt!18581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43213 () Bool)

(assert (=> b!43213 (= e!27376 call!3443)))

(declare-fun d!7895 () Bool)

(assert (=> d!7895 e!27381))

(declare-fun res!25640 () Bool)

(assert (=> d!7895 (=> (not res!25640) (not e!27381))))

(assert (=> d!7895 (= res!25640 (or (bvsge #b00000000000000000000000000000000 (size!1594 lt!18374)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))))

(declare-fun lt!18570 () ListLongMap!1201)

(assert (=> d!7895 (= lt!18581 lt!18570)))

(declare-fun lt!18590 () Unit!1199)

(assert (=> d!7895 (= lt!18590 e!27378)))

(declare-fun c!5500 () Bool)

(assert (=> d!7895 (= c!5500 e!27382)))

(declare-fun res!25646 () Bool)

(assert (=> d!7895 (=> (not res!25646) (not e!27382))))

(assert (=> d!7895 (= res!25646 (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(assert (=> d!7895 (= lt!18570 e!27379)))

(assert (=> d!7895 (= c!5503 (and (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7895 (validMask!0 mask!853)))

(assert (=> d!7895 (= (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470) lt!18581)))

(declare-fun b!43201 () Bool)

(assert (=> b!43201 (= e!27371 (= (apply!59 lt!18581 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18377))))

(assert (= (and d!7895 c!5503) b!43206))

(assert (= (and d!7895 (not c!5503)) b!43194))

(assert (= (and b!43194 c!5504) b!43193))

(assert (= (and b!43194 (not c!5504)) b!43197))

(assert (= (and b!43197 c!5501) b!43213))

(assert (= (and b!43197 (not c!5501)) b!43203))

(assert (= (or b!43213 b!43203) bm!3440))

(assert (= (or b!43193 bm!3440) bm!3442))

(assert (= (or b!43193 b!43213) bm!3439))

(assert (= (or b!43206 bm!3442) bm!3441))

(assert (= (or b!43206 bm!3439) bm!3437))

(assert (= (and d!7895 res!25646) b!43196))

(assert (= (and d!7895 c!5500) b!43199))

(assert (= (and d!7895 (not c!5500)) b!43212))

(assert (= (and d!7895 res!25640) b!43208))

(assert (= (and b!43208 res!25642) b!43202))

(assert (= (and b!43208 (not res!25645)) b!43210))

(assert (= (and b!43210 res!25644) b!43209))

(assert (= (and b!43208 res!25643) b!43200))

(assert (= (and b!43200 c!5499) b!43195))

(assert (= (and b!43200 (not c!5499)) b!43198))

(assert (= (and b!43195 res!25641) b!43201))

(assert (= (or b!43195 b!43198) bm!3443))

(assert (= (and b!43200 res!25639) b!43207))

(assert (= (and b!43207 c!5502) b!43205))

(assert (= (and b!43207 (not c!5502)) b!43211))

(assert (= (and b!43205 res!25647) b!43204))

(assert (= (or b!43205 b!43211) bm!3438))

(declare-fun b_lambda!2257 () Bool)

(assert (=> (not b_lambda!2257) (not b!43209)))

(assert (=> b!43209 t!4196))

(declare-fun b_and!2665 () Bool)

(assert (= b_and!2657 (and (=> t!4196 result!1721) b_and!2665)))

(declare-fun m!37071 () Bool)

(assert (=> b!43204 m!37071))

(declare-fun m!37073 () Bool)

(assert (=> b!43199 m!37073))

(declare-fun m!37075 () Bool)

(assert (=> b!43199 m!37075))

(declare-fun m!37077 () Bool)

(assert (=> b!43199 m!37077))

(declare-fun m!37079 () Bool)

(assert (=> b!43199 m!37079))

(declare-fun m!37081 () Bool)

(assert (=> b!43199 m!37081))

(assert (=> b!43199 m!37073))

(assert (=> b!43199 m!37077))

(declare-fun m!37083 () Bool)

(assert (=> b!43199 m!37083))

(declare-fun m!37085 () Bool)

(assert (=> b!43199 m!37085))

(declare-fun m!37087 () Bool)

(assert (=> b!43199 m!37087))

(declare-fun m!37089 () Bool)

(assert (=> b!43199 m!37089))

(declare-fun m!37091 () Bool)

(assert (=> b!43199 m!37091))

(declare-fun m!37093 () Bool)

(assert (=> b!43199 m!37093))

(declare-fun m!37095 () Bool)

(assert (=> b!43199 m!37095))

(declare-fun m!37097 () Bool)

(assert (=> b!43199 m!37097))

(declare-fun m!37099 () Bool)

(assert (=> b!43199 m!37099))

(declare-fun m!37101 () Bool)

(assert (=> b!43199 m!37101))

(assert (=> b!43199 m!37095))

(declare-fun m!37103 () Bool)

(assert (=> b!43199 m!37103))

(assert (=> b!43199 m!37087))

(declare-fun m!37105 () Bool)

(assert (=> b!43199 m!37105))

(declare-fun m!37107 () Bool)

(assert (=> b!43209 m!37107))

(assert (=> b!43209 m!37105))

(declare-fun m!37109 () Bool)

(assert (=> b!43209 m!37109))

(assert (=> b!43209 m!36929))

(assert (=> b!43209 m!37107))

(assert (=> b!43209 m!36929))

(declare-fun m!37111 () Bool)

(assert (=> b!43209 m!37111))

(assert (=> b!43209 m!37105))

(assert (=> d!7895 m!36915))

(assert (=> b!43202 m!37105))

(assert (=> b!43202 m!37105))

(declare-fun m!37113 () Bool)

(assert (=> b!43202 m!37113))

(assert (=> bm!3441 m!37101))

(declare-fun m!37115 () Bool)

(assert (=> bm!3438 m!37115))

(declare-fun m!37117 () Bool)

(assert (=> b!43206 m!37117))

(assert (=> b!43196 m!37105))

(assert (=> b!43196 m!37105))

(assert (=> b!43196 m!37113))

(declare-fun m!37119 () Bool)

(assert (=> bm!3443 m!37119))

(assert (=> b!43210 m!37105))

(assert (=> b!43210 m!37105))

(declare-fun m!37121 () Bool)

(assert (=> b!43210 m!37121))

(declare-fun m!37123 () Bool)

(assert (=> bm!3437 m!37123))

(declare-fun m!37125 () Bool)

(assert (=> b!43201 m!37125))

(assert (=> b!43005 d!7895))

(declare-fun d!7913 () Bool)

(assert (=> d!7913 (= (head!888 (toList!616 lt!18380)) (h!1771 (toList!616 lt!18380)))))

(assert (=> b!43005 d!7913))

(declare-fun b!43236 () Bool)

(declare-fun e!27400 () Bool)

(declare-fun contains!566 (List!1199 (_ BitVec 64)) Bool)

(assert (=> b!43236 (= e!27400 (contains!566 Nil!1196 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun bm!3449 () Bool)

(declare-fun call!3452 () Bool)

(declare-fun c!5510 () Bool)

(assert (=> bm!3449 (= call!3452 (arrayNoDuplicates!0 lt!18374 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5510 (Cons!1195 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) Nil!1196) Nil!1196)))))

(declare-fun b!43237 () Bool)

(declare-fun e!27402 () Bool)

(declare-fun e!27401 () Bool)

(assert (=> b!43237 (= e!27402 e!27401)))

(assert (=> b!43237 (= c!5510 (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun b!43238 () Bool)

(assert (=> b!43238 (= e!27401 call!3452)))

(declare-fun b!43239 () Bool)

(assert (=> b!43239 (= e!27401 call!3452)))

(declare-fun b!43240 () Bool)

(declare-fun e!27403 () Bool)

(assert (=> b!43240 (= e!27403 e!27402)))

(declare-fun res!25660 () Bool)

(assert (=> b!43240 (=> (not res!25660) (not e!27402))))

(assert (=> b!43240 (= res!25660 (not e!27400))))

(declare-fun res!25662 () Bool)

(assert (=> b!43240 (=> (not res!25662) (not e!27400))))

(assert (=> b!43240 (= res!25662 (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun d!7915 () Bool)

(declare-fun res!25661 () Bool)

(assert (=> d!7915 (=> res!25661 e!27403)))

(assert (=> d!7915 (= res!25661 (bvsge #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(assert (=> d!7915 (= (arrayNoDuplicates!0 lt!18374 #b00000000000000000000000000000000 Nil!1196) e!27403)))

(assert (= (and d!7915 (not res!25661)) b!43240))

(assert (= (and b!43240 res!25662) b!43236))

(assert (= (and b!43240 res!25660) b!43237))

(assert (= (and b!43237 c!5510) b!43239))

(assert (= (and b!43237 (not c!5510)) b!43238))

(assert (= (or b!43239 b!43238) bm!3449))

(assert (=> b!43236 m!37105))

(assert (=> b!43236 m!37105))

(declare-fun m!37137 () Bool)

(assert (=> b!43236 m!37137))

(assert (=> bm!3449 m!37105))

(declare-fun m!37139 () Bool)

(assert (=> bm!3449 m!37139))

(assert (=> b!43237 m!37105))

(assert (=> b!43237 m!37105))

(assert (=> b!43237 m!37113))

(assert (=> b!43240 m!37105))

(assert (=> b!43240 m!37105))

(assert (=> b!43240 m!37113))

(assert (=> b!43002 d!7915))

(declare-fun b!43249 () Bool)

(declare-fun e!27409 () (_ BitVec 32))

(declare-fun e!27408 () (_ BitVec 32))

(assert (=> b!43249 (= e!27409 e!27408)))

(declare-fun c!5516 () Bool)

(assert (=> b!43249 (= c!5516 (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun b!43250 () Bool)

(declare-fun call!3455 () (_ BitVec 32))

(assert (=> b!43250 (= e!27408 (bvadd #b00000000000000000000000000000001 call!3455))))

(declare-fun b!43251 () Bool)

(assert (=> b!43251 (= e!27408 call!3455)))

(declare-fun d!7921 () Bool)

(declare-fun lt!18605 () (_ BitVec 32))

(assert (=> d!7921 (and (bvsge lt!18605 #b00000000000000000000000000000000) (bvsle lt!18605 (bvsub (size!1594 lt!18374) #b00000000000000000000000000000000)))))

(assert (=> d!7921 (= lt!18605 e!27409)))

(declare-fun c!5515 () Bool)

(assert (=> d!7921 (= c!5515 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7921 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1594 lt!18374)))))

(assert (=> d!7921 (= (arrayCountValidKeys!0 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18605)))

(declare-fun b!43252 () Bool)

(assert (=> b!43252 (= e!27409 #b00000000000000000000000000000000)))

(declare-fun bm!3452 () Bool)

(assert (=> bm!3452 (= call!3455 (arrayCountValidKeys!0 lt!18374 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7921 c!5515) b!43252))

(assert (= (and d!7921 (not c!5515)) b!43249))

(assert (= (and b!43249 c!5516) b!43250))

(assert (= (and b!43249 (not c!5516)) b!43251))

(assert (= (or b!43250 b!43251) bm!3452))

(assert (=> b!43249 m!37105))

(assert (=> b!43249 m!37105))

(assert (=> b!43249 m!37113))

(declare-fun m!37143 () Bool)

(assert (=> bm!3452 m!37143))

(assert (=> b!43002 d!7921))

(declare-fun d!7925 () Bool)

(assert (=> d!7925 (= (arrayCountValidKeys!0 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!18611 () Unit!1199)

(declare-fun choose!59 (array!2931 (_ BitVec 32) (_ BitVec 32)) Unit!1199)

(assert (=> d!7925 (= lt!18611 (choose!59 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7925 (bvslt (size!1594 lt!18374) #b01111111111111111111111111111111)))

(assert (=> d!7925 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!18611)))

(declare-fun bs!1936 () Bool)

(assert (= bs!1936 d!7925))

(assert (=> bs!1936 m!36921))

(declare-fun m!37147 () Bool)

(assert (=> bs!1936 m!37147))

(assert (=> b!43002 d!7925))

(declare-fun d!7929 () Bool)

(assert (=> d!7929 (= (map!833 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (getCurrentListMap!350 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (mask!5431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))

(declare-fun bs!1938 () Bool)

(assert (= bs!1938 d!7929))

(declare-fun m!37151 () Bool)

(assert (=> bs!1938 m!37151))

(assert (=> b!43002 d!7929))

(declare-fun d!7933 () Bool)

(assert (=> d!7933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18374 mask!853)))

(declare-fun lt!18664 () Unit!1199)

(declare-fun choose!34 (array!2931 (_ BitVec 32) (_ BitVec 32)) Unit!1199)

(assert (=> d!7933 (= lt!18664 (choose!34 lt!18374 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7933 (validMask!0 mask!853)))

(assert (=> d!7933 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!18374 mask!853 #b00000000000000000000000000000000) lt!18664)))

(declare-fun bs!1939 () Bool)

(assert (= bs!1939 d!7933))

(assert (=> bs!1939 m!36917))

(declare-fun m!37155 () Bool)

(assert (=> bs!1939 m!37155))

(assert (=> bs!1939 m!36915))

(assert (=> b!43002 d!7933))

(declare-fun b!43330 () Bool)

(declare-fun e!27462 () Bool)

(declare-fun call!3478 () Bool)

(assert (=> b!43330 (= e!27462 call!3478)))

(declare-fun bm!3475 () Bool)

(assert (=> bm!3475 (= call!3478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18374 mask!853))))

(declare-fun b!43331 () Bool)

(declare-fun e!27460 () Bool)

(assert (=> b!43331 (= e!27460 e!27462)))

(declare-fun lt!18672 () (_ BitVec 64))

(assert (=> b!43331 (= lt!18672 (select (arr!1409 lt!18374) #b00000000000000000000000000000000))))

(declare-fun lt!18671 () Unit!1199)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2931 (_ BitVec 64) (_ BitVec 32)) Unit!1199)

(assert (=> b!43331 (= lt!18671 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18374 lt!18672 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43331 (arrayContainsKey!0 lt!18374 lt!18672 #b00000000000000000000000000000000)))

(declare-fun lt!18673 () Unit!1199)

(assert (=> b!43331 (= lt!18673 lt!18671)))

(declare-fun res!25695 () Bool)

(declare-datatypes ((SeekEntryResult!197 0))(
  ( (MissingZero!197 (index!2910 (_ BitVec 32))) (Found!197 (index!2911 (_ BitVec 32))) (Intermediate!197 (undefined!1009 Bool) (index!2912 (_ BitVec 32)) (x!8286 (_ BitVec 32))) (Undefined!197) (MissingVacant!197 (index!2913 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2931 (_ BitVec 32)) SeekEntryResult!197)

(assert (=> b!43331 (= res!25695 (= (seekEntryOrOpen!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) lt!18374 mask!853) (Found!197 #b00000000000000000000000000000000)))))

(assert (=> b!43331 (=> (not res!25695) (not e!27462))))

(declare-fun b!43332 () Bool)

(declare-fun e!27461 () Bool)

(assert (=> b!43332 (= e!27461 e!27460)))

(declare-fun c!5540 () Bool)

(assert (=> b!43332 (= c!5540 (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun d!7937 () Bool)

(declare-fun res!25694 () Bool)

(assert (=> d!7937 (=> res!25694 e!27461)))

(assert (=> d!7937 (= res!25694 (bvsge #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(assert (=> d!7937 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18374 mask!853) e!27461)))

(declare-fun b!43333 () Bool)

(assert (=> b!43333 (= e!27460 call!3478)))

(assert (= (and d!7937 (not res!25694)) b!43332))

(assert (= (and b!43332 c!5540) b!43331))

(assert (= (and b!43332 (not c!5540)) b!43333))

(assert (= (and b!43331 res!25695) b!43330))

(assert (= (or b!43330 b!43333) bm!3475))

(declare-fun m!37161 () Bool)

(assert (=> bm!3475 m!37161))

(assert (=> b!43331 m!37105))

(declare-fun m!37163 () Bool)

(assert (=> b!43331 m!37163))

(declare-fun m!37165 () Bool)

(assert (=> b!43331 m!37165))

(assert (=> b!43331 m!37105))

(declare-fun m!37167 () Bool)

(assert (=> b!43331 m!37167))

(assert (=> b!43332 m!37105))

(assert (=> b!43332 m!37105))

(assert (=> b!43332 m!37113))

(assert (=> b!43002 d!7937))

(declare-fun d!7943 () Bool)

(assert (=> d!7943 (arrayNoDuplicates!0 lt!18374 #b00000000000000000000000000000000 Nil!1196)))

(declare-fun lt!18698 () Unit!1199)

(declare-fun choose!111 (array!2931 (_ BitVec 32) (_ BitVec 32) List!1199) Unit!1199)

(assert (=> d!7943 (= lt!18698 (choose!111 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1196))))

(assert (=> d!7943 (= (size!1594 lt!18374) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7943 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1196) lt!18698)))

(declare-fun bs!1940 () Bool)

(assert (= bs!1940 d!7943))

(assert (=> bs!1940 m!36925))

(declare-fun m!37169 () Bool)

(assert (=> bs!1940 m!37169))

(assert (=> b!43002 d!7943))

(declare-fun b_lambda!2259 () Bool)

(assert (= b_lambda!2257 (or (and start!6468 b_free!1503) b_lambda!2259)))

(check-sat (not b!43332) (not b!43210) (not bm!3443) (not b!43249) (not d!7895) tp_is_empty!1893 (not b!43201) (not b_lambda!2259) (not d!7933) (not b!43240) (not b!43202) b_and!2665 (not d!7925) (not b!43054) (not b!43204) (not b!43052) (not b!43237) (not b!43196) (not bm!3437) (not bm!3449) (not d!7929) (not bm!3438) (not bm!3475) (not d!7943) (not b!43209) (not bm!3441) (not b_lambda!2249) (not bm!3452) (not d!7891) (not b!43199) (not b!43331) (not b!43236) (not b!43206) (not b_next!1503))
(check-sat b_and!2665 (not b_next!1503))
(get-model)

(declare-fun d!7953 () Bool)

(assert (=> d!7953 (= (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)) (and (not (= (select (arr!1409 lt!18374) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1409 lt!18374) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43202 d!7953))

(declare-fun d!7957 () Bool)

(declare-fun e!27477 () Bool)

(assert (=> d!7957 e!27477))

(declare-fun res!25705 () Bool)

(assert (=> d!7957 (=> res!25705 e!27477)))

(declare-fun lt!18704 () Bool)

(assert (=> d!7957 (= res!25705 (not lt!18704))))

(declare-fun lt!18705 () Bool)

(assert (=> d!7957 (= lt!18704 lt!18705)))

(declare-fun lt!18703 () Unit!1199)

(declare-fun e!27476 () Unit!1199)

(assert (=> d!7957 (= lt!18703 e!27476)))

(declare-fun c!5547 () Bool)

(assert (=> d!7957 (= c!5547 lt!18705)))

(assert (=> d!7957 (= lt!18705 (containsKey!73 (toList!616 lt!18581) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7957 (= (contains!563 lt!18581 #b1000000000000000000000000000000000000000000000000000000000000000) lt!18704)))

(declare-fun b!43355 () Bool)

(declare-fun lt!18702 () Unit!1199)

(assert (=> b!43355 (= e!27476 lt!18702)))

(assert (=> b!43355 (= lt!18702 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!616 lt!18581) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43355 (isDefined!61 (getValueByKey!104 (toList!616 lt!18581) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43356 () Bool)

(declare-fun Unit!1209 () Unit!1199)

(assert (=> b!43356 (= e!27476 Unit!1209)))

(declare-fun b!43357 () Bool)

(assert (=> b!43357 (= e!27477 (isDefined!61 (getValueByKey!104 (toList!616 lt!18581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7957 c!5547) b!43355))

(assert (= (and d!7957 (not c!5547)) b!43356))

(assert (= (and d!7957 (not res!25705)) b!43357))

(declare-fun m!37229 () Bool)

(assert (=> d!7957 m!37229))

(declare-fun m!37231 () Bool)

(assert (=> b!43355 m!37231))

(declare-fun m!37233 () Bool)

(assert (=> b!43355 m!37233))

(assert (=> b!43355 m!37233))

(declare-fun m!37235 () Bool)

(assert (=> b!43355 m!37235))

(assert (=> b!43357 m!37233))

(assert (=> b!43357 m!37233))

(assert (=> b!43357 m!37235))

(assert (=> bm!3438 d!7957))

(assert (=> b!43249 d!7953))

(declare-fun d!7959 () Bool)

(declare-fun get!789 (Option!110) V!2311)

(assert (=> d!7959 (= (apply!59 lt!18581 #b0000000000000000000000000000000000000000000000000000000000000000) (get!789 (getValueByKey!104 (toList!616 lt!18581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1943 () Bool)

(assert (= bs!1943 d!7959))

(declare-fun m!37239 () Bool)

(assert (=> bs!1943 m!37239))

(assert (=> bs!1943 m!37239))

(declare-fun m!37241 () Bool)

(assert (=> bs!1943 m!37241))

(assert (=> b!43201 d!7959))

(declare-fun d!7963 () Bool)

(declare-fun e!27486 () Bool)

(assert (=> d!7963 e!27486))

(declare-fun res!25717 () Bool)

(assert (=> d!7963 (=> (not res!25717) (not e!27486))))

(declare-fun lt!18716 () ListLongMap!1201)

(assert (=> d!7963 (= res!25717 (contains!563 lt!18716 (_1!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))))))

(declare-fun lt!18717 () List!1198)

(assert (=> d!7963 (= lt!18716 (ListLongMap!1202 lt!18717))))

(declare-fun lt!18714 () Unit!1199)

(declare-fun lt!18715 () Unit!1199)

(assert (=> d!7963 (= lt!18714 lt!18715)))

(assert (=> d!7963 (= (getValueByKey!104 lt!18717 (_1!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))) (Some!109 (_2!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!28 (List!1198 (_ BitVec 64) V!2311) Unit!1199)

(assert (=> d!7963 (= lt!18715 (lemmaContainsTupThenGetReturnValue!28 lt!18717 (_1!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))) (_2!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))))))

(declare-fun insertStrictlySorted!25 (List!1198 (_ BitVec 64) V!2311) List!1198)

(assert (=> d!7963 (= lt!18717 (insertStrictlySorted!25 (toList!616 (ite c!5503 call!3440 (ite c!5504 call!3442 call!3445))) (_1!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))) (_2!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))))))

(assert (=> d!7963 (= (+!67 (ite c!5503 call!3440 (ite c!5504 call!3442 call!3445)) (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))) lt!18716)))

(declare-fun b!43368 () Bool)

(declare-fun res!25716 () Bool)

(assert (=> b!43368 (=> (not res!25716) (not e!27486))))

(assert (=> b!43368 (= res!25716 (= (getValueByKey!104 (toList!616 lt!18716) (_1!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))) (Some!109 (_2!823 (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))))))))

(declare-fun b!43369 () Bool)

(declare-fun contains!568 (List!1198 tuple2!1624) Bool)

(assert (=> b!43369 (= e!27486 (contains!568 (toList!616 lt!18716) (ite (or c!5503 c!5504) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 lt!18377) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))))))

(assert (= (and d!7963 res!25717) b!43368))

(assert (= (and b!43368 res!25716) b!43369))

(declare-fun m!37243 () Bool)

(assert (=> d!7963 m!37243))

(declare-fun m!37245 () Bool)

(assert (=> d!7963 m!37245))

(declare-fun m!37247 () Bool)

(assert (=> d!7963 m!37247))

(declare-fun m!37249 () Bool)

(assert (=> d!7963 m!37249))

(declare-fun m!37251 () Bool)

(assert (=> b!43368 m!37251))

(declare-fun m!37253 () Bool)

(assert (=> b!43369 m!37253))

(assert (=> bm!3437 d!7963))

(declare-fun d!7965 () Bool)

(assert (=> d!7965 (isDefined!61 (getValueByKey!104 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))))))

(declare-fun lt!18720 () Unit!1199)

(declare-fun choose!252 (List!1198 (_ BitVec 64)) Unit!1199)

(assert (=> d!7965 (= lt!18720 (choose!252 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))))))

(declare-fun e!27489 () Bool)

(assert (=> d!7965 e!27489))

(declare-fun res!25720 () Bool)

(assert (=> d!7965 (=> (not res!25720) (not e!27489))))

(declare-fun isStrictlySorted!212 (List!1198) Bool)

(assert (=> d!7965 (= res!25720 (isStrictlySorted!212 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))))))

(assert (=> d!7965 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))) lt!18720)))

(declare-fun b!43372 () Bool)

(assert (=> b!43372 (= e!27489 (containsKey!73 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))))))

(assert (= (and d!7965 res!25720) b!43372))

(assert (=> d!7965 m!36991))

(assert (=> d!7965 m!36991))

(assert (=> d!7965 m!36993))

(declare-fun m!37255 () Bool)

(assert (=> d!7965 m!37255))

(declare-fun m!37257 () Bool)

(assert (=> d!7965 m!37257))

(assert (=> b!43372 m!36987))

(assert (=> b!43052 d!7965))

(declare-fun d!7967 () Bool)

(declare-fun isEmpty!280 (Option!110) Bool)

(assert (=> d!7967 (= (isDefined!61 (getValueByKey!104 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380))))) (not (isEmpty!280 (getValueByKey!104 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))))))))

(declare-fun bs!1944 () Bool)

(assert (= bs!1944 d!7967))

(assert (=> bs!1944 m!36991))

(declare-fun m!37259 () Bool)

(assert (=> bs!1944 m!37259))

(assert (=> b!43052 d!7967))

(declare-fun e!27503 () Option!110)

(declare-fun b!43398 () Bool)

(assert (=> b!43398 (= e!27503 (getValueByKey!104 (t!4197 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))) (_1!823 (head!888 (toList!616 lt!18380)))))))

(declare-fun e!27502 () Option!110)

(declare-fun b!43396 () Bool)

(assert (=> b!43396 (= e!27502 (Some!109 (_2!823 (h!1771 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))))))))

(declare-fun b!43399 () Bool)

(assert (=> b!43399 (= e!27503 None!108)))

(declare-fun b!43397 () Bool)

(assert (=> b!43397 (= e!27502 e!27503)))

(declare-fun c!5560 () Bool)

(assert (=> b!43397 (= c!5560 (and ((_ is Cons!1194) (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))) (not (= (_1!823 (h!1771 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!823 (head!888 (toList!616 lt!18380)))))))))

(declare-fun c!5559 () Bool)

(declare-fun d!7969 () Bool)

(assert (=> d!7969 (= c!5559 (and ((_ is Cons!1194) (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!823 (h!1771 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!823 (head!888 (toList!616 lt!18380))))))))

(assert (=> d!7969 (= (getValueByKey!104 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))) e!27502)))

(assert (= (and d!7969 c!5559) b!43396))

(assert (= (and d!7969 (not c!5559)) b!43397))

(assert (= (and b!43397 c!5560) b!43398))

(assert (= (and b!43397 (not c!5560)) b!43399))

(declare-fun m!37277 () Bool)

(assert (=> b!43398 m!37277))

(assert (=> b!43052 d!7969))

(declare-fun d!7979 () Bool)

(declare-fun e!27504 () Bool)

(assert (=> d!7979 e!27504))

(declare-fun res!25723 () Bool)

(assert (=> d!7979 (=> (not res!25723) (not e!27504))))

(declare-fun lt!18733 () ListLongMap!1201)

(assert (=> d!7979 (= res!25723 (contains!563 lt!18733 (_1!823 (tuple2!1625 lt!18569 lt!18377))))))

(declare-fun lt!18734 () List!1198)

(assert (=> d!7979 (= lt!18733 (ListLongMap!1202 lt!18734))))

(declare-fun lt!18731 () Unit!1199)

(declare-fun lt!18732 () Unit!1199)

(assert (=> d!7979 (= lt!18731 lt!18732)))

(assert (=> d!7979 (= (getValueByKey!104 lt!18734 (_1!823 (tuple2!1625 lt!18569 lt!18377))) (Some!109 (_2!823 (tuple2!1625 lt!18569 lt!18377))))))

(assert (=> d!7979 (= lt!18732 (lemmaContainsTupThenGetReturnValue!28 lt!18734 (_1!823 (tuple2!1625 lt!18569 lt!18377)) (_2!823 (tuple2!1625 lt!18569 lt!18377))))))

(assert (=> d!7979 (= lt!18734 (insertStrictlySorted!25 (toList!616 lt!18585) (_1!823 (tuple2!1625 lt!18569 lt!18377)) (_2!823 (tuple2!1625 lt!18569 lt!18377))))))

(assert (=> d!7979 (= (+!67 lt!18585 (tuple2!1625 lt!18569 lt!18377)) lt!18733)))

(declare-fun b!43400 () Bool)

(declare-fun res!25722 () Bool)

(assert (=> b!43400 (=> (not res!25722) (not e!27504))))

(assert (=> b!43400 (= res!25722 (= (getValueByKey!104 (toList!616 lt!18733) (_1!823 (tuple2!1625 lt!18569 lt!18377))) (Some!109 (_2!823 (tuple2!1625 lt!18569 lt!18377)))))))

(declare-fun b!43401 () Bool)

(assert (=> b!43401 (= e!27504 (contains!568 (toList!616 lt!18733) (tuple2!1625 lt!18569 lt!18377)))))

(assert (= (and d!7979 res!25723) b!43400))

(assert (= (and b!43400 res!25722) b!43401))

(declare-fun m!37279 () Bool)

(assert (=> d!7979 m!37279))

(declare-fun m!37281 () Bool)

(assert (=> d!7979 m!37281))

(declare-fun m!37283 () Bool)

(assert (=> d!7979 m!37283))

(declare-fun m!37285 () Bool)

(assert (=> d!7979 m!37285))

(declare-fun m!37287 () Bool)

(assert (=> b!43400 m!37287))

(declare-fun m!37289 () Bool)

(assert (=> b!43401 m!37289))

(assert (=> b!43199 d!7979))

(declare-fun d!7981 () Bool)

(assert (=> d!7981 (= (apply!59 lt!18573 lt!18572) (get!789 (getValueByKey!104 (toList!616 lt!18573) lt!18572)))))

(declare-fun bs!1947 () Bool)

(assert (= bs!1947 d!7981))

(declare-fun m!37291 () Bool)

(assert (=> bs!1947 m!37291))

(assert (=> bs!1947 m!37291))

(declare-fun m!37293 () Bool)

(assert (=> bs!1947 m!37293))

(assert (=> b!43199 d!7981))

(declare-fun d!7983 () Bool)

(declare-fun e!27505 () Bool)

(assert (=> d!7983 e!27505))

(declare-fun res!25725 () Bool)

(assert (=> d!7983 (=> (not res!25725) (not e!27505))))

(declare-fun lt!18737 () ListLongMap!1201)

(assert (=> d!7983 (= res!25725 (contains!563 lt!18737 (_1!823 (tuple2!1625 lt!18578 lt!18377))))))

(declare-fun lt!18738 () List!1198)

(assert (=> d!7983 (= lt!18737 (ListLongMap!1202 lt!18738))))

(declare-fun lt!18735 () Unit!1199)

(declare-fun lt!18736 () Unit!1199)

(assert (=> d!7983 (= lt!18735 lt!18736)))

(assert (=> d!7983 (= (getValueByKey!104 lt!18738 (_1!823 (tuple2!1625 lt!18578 lt!18377))) (Some!109 (_2!823 (tuple2!1625 lt!18578 lt!18377))))))

(assert (=> d!7983 (= lt!18736 (lemmaContainsTupThenGetReturnValue!28 lt!18738 (_1!823 (tuple2!1625 lt!18578 lt!18377)) (_2!823 (tuple2!1625 lt!18578 lt!18377))))))

(assert (=> d!7983 (= lt!18738 (insertStrictlySorted!25 (toList!616 lt!18573) (_1!823 (tuple2!1625 lt!18578 lt!18377)) (_2!823 (tuple2!1625 lt!18578 lt!18377))))))

(assert (=> d!7983 (= (+!67 lt!18573 (tuple2!1625 lt!18578 lt!18377)) lt!18737)))

(declare-fun b!43402 () Bool)

(declare-fun res!25724 () Bool)

(assert (=> b!43402 (=> (not res!25724) (not e!27505))))

(assert (=> b!43402 (= res!25724 (= (getValueByKey!104 (toList!616 lt!18737) (_1!823 (tuple2!1625 lt!18578 lt!18377))) (Some!109 (_2!823 (tuple2!1625 lt!18578 lt!18377)))))))

(declare-fun b!43403 () Bool)

(assert (=> b!43403 (= e!27505 (contains!568 (toList!616 lt!18737) (tuple2!1625 lt!18578 lt!18377)))))

(assert (= (and d!7983 res!25725) b!43402))

(assert (= (and b!43402 res!25724) b!43403))

(declare-fun m!37295 () Bool)

(assert (=> d!7983 m!37295))

(declare-fun m!37297 () Bool)

(assert (=> d!7983 m!37297))

(declare-fun m!37299 () Bool)

(assert (=> d!7983 m!37299))

(declare-fun m!37301 () Bool)

(assert (=> d!7983 m!37301))

(declare-fun m!37303 () Bool)

(assert (=> b!43402 m!37303))

(declare-fun m!37305 () Bool)

(assert (=> b!43403 m!37305))

(assert (=> b!43199 d!7983))

(declare-fun b!43472 () Bool)

(declare-fun e!27545 () Bool)

(declare-fun e!27551 () Bool)

(assert (=> b!43472 (= e!27545 e!27551)))

(declare-fun c!5581 () Bool)

(declare-fun e!27547 () Bool)

(assert (=> b!43472 (= c!5581 e!27547)))

(declare-fun res!25753 () Bool)

(assert (=> b!43472 (=> (not res!25753) (not e!27547))))

(assert (=> b!43472 (= res!25753 (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(declare-fun b!43473 () Bool)

(declare-fun e!27549 () ListLongMap!1201)

(assert (=> b!43473 (= e!27549 (ListLongMap!1202 Nil!1195))))

(declare-fun bm!3485 () Bool)

(declare-fun call!3488 () ListLongMap!1201)

(assert (=> bm!3485 (= call!3488 (getCurrentListMapNoExtraKeys!36 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470))))

(declare-fun d!7985 () Bool)

(assert (=> d!7985 e!27545))

(declare-fun res!25752 () Bool)

(assert (=> d!7985 (=> (not res!25752) (not e!27545))))

(declare-fun lt!18798 () ListLongMap!1201)

(assert (=> d!7985 (= res!25752 (not (contains!563 lt!18798 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7985 (= lt!18798 e!27549)))

(declare-fun c!5584 () Bool)

(assert (=> d!7985 (= c!5584 (bvsge #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(assert (=> d!7985 (validMask!0 mask!853)))

(assert (=> d!7985 (= (getCurrentListMapNoExtraKeys!36 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470) lt!18798)))

(declare-fun b!43474 () Bool)

(declare-fun lt!18796 () Unit!1199)

(declare-fun lt!18794 () Unit!1199)

(assert (=> b!43474 (= lt!18796 lt!18794)))

(declare-fun lt!18792 () (_ BitVec 64))

(declare-fun lt!18793 () ListLongMap!1201)

(declare-fun lt!18797 () V!2311)

(declare-fun lt!18795 () (_ BitVec 64))

(assert (=> b!43474 (not (contains!563 (+!67 lt!18793 (tuple2!1625 lt!18792 lt!18797)) lt!18795))))

(declare-fun addStillNotContains!10 (ListLongMap!1201 (_ BitVec 64) V!2311 (_ BitVec 64)) Unit!1199)

(assert (=> b!43474 (= lt!18794 (addStillNotContains!10 lt!18793 lt!18792 lt!18797 lt!18795))))

(assert (=> b!43474 (= lt!18795 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!43474 (= lt!18797 (get!786 (select (arr!1410 lt!18378) #b00000000000000000000000000000000) (dynLambda!260 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43474 (= lt!18792 (select (arr!1409 lt!18374) #b00000000000000000000000000000000))))

(assert (=> b!43474 (= lt!18793 call!3488)))

(declare-fun e!27548 () ListLongMap!1201)

(assert (=> b!43474 (= e!27548 (+!67 call!3488 (tuple2!1625 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) (get!786 (select (arr!1410 lt!18378) #b00000000000000000000000000000000) (dynLambda!260 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!43475 () Bool)

(declare-fun e!27546 () Bool)

(assert (=> b!43475 (= e!27551 e!27546)))

(declare-fun c!5582 () Bool)

(assert (=> b!43475 (= c!5582 (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(declare-fun b!43476 () Bool)

(assert (=> b!43476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(assert (=> b!43476 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1595 lt!18378)))))

(declare-fun e!27550 () Bool)

(assert (=> b!43476 (= e!27550 (= (apply!59 lt!18798 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)) (get!786 (select (arr!1410 lt!18378) #b00000000000000000000000000000000) (dynLambda!260 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!43477 () Bool)

(assert (=> b!43477 (= e!27548 call!3488)))

(declare-fun b!43478 () Bool)

(assert (=> b!43478 (= e!27549 e!27548)))

(declare-fun c!5583 () Bool)

(assert (=> b!43478 (= c!5583 (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun b!43479 () Bool)

(declare-fun isEmpty!283 (ListLongMap!1201) Bool)

(assert (=> b!43479 (= e!27546 (isEmpty!283 lt!18798))))

(declare-fun b!43480 () Bool)

(assert (=> b!43480 (= e!27547 (validKeyInArray!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(assert (=> b!43480 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!43481 () Bool)

(assert (=> b!43481 (= e!27551 e!27550)))

(assert (=> b!43481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1594 lt!18374)))))

(declare-fun res!25754 () Bool)

(assert (=> b!43481 (= res!25754 (contains!563 lt!18798 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(assert (=> b!43481 (=> (not res!25754) (not e!27550))))

(declare-fun b!43482 () Bool)

(assert (=> b!43482 (= e!27546 (= lt!18798 (getCurrentListMapNoExtraKeys!36 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!470)))))

(declare-fun b!43483 () Bool)

(declare-fun res!25755 () Bool)

(assert (=> b!43483 (=> (not res!25755) (not e!27545))))

(assert (=> b!43483 (= res!25755 (not (contains!563 lt!18798 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7985 c!5584) b!43473))

(assert (= (and d!7985 (not c!5584)) b!43478))

(assert (= (and b!43478 c!5583) b!43474))

(assert (= (and b!43478 (not c!5583)) b!43477))

(assert (= (or b!43474 b!43477) bm!3485))

(assert (= (and d!7985 res!25752) b!43483))

(assert (= (and b!43483 res!25755) b!43472))

(assert (= (and b!43472 res!25753) b!43480))

(assert (= (and b!43472 c!5581) b!43481))

(assert (= (and b!43472 (not c!5581)) b!43475))

(assert (= (and b!43481 res!25754) b!43476))

(assert (= (and b!43475 c!5582) b!43482))

(assert (= (and b!43475 (not c!5582)) b!43479))

(declare-fun b_lambda!2267 () Bool)

(assert (=> (not b_lambda!2267) (not b!43474)))

(assert (=> b!43474 t!4196))

(declare-fun b_and!2669 () Bool)

(assert (= b_and!2665 (and (=> t!4196 result!1721) b_and!2669)))

(declare-fun b_lambda!2269 () Bool)

(assert (=> (not b_lambda!2269) (not b!43476)))

(assert (=> b!43476 t!4196))

(declare-fun b_and!2671 () Bool)

(assert (= b_and!2669 (and (=> t!4196 result!1721) b_and!2671)))

(declare-fun m!37397 () Bool)

(assert (=> b!43474 m!37397))

(assert (=> b!43474 m!36929))

(assert (=> b!43474 m!37107))

(assert (=> b!43474 m!36929))

(assert (=> b!43474 m!37111))

(declare-fun m!37399 () Bool)

(assert (=> b!43474 m!37399))

(declare-fun m!37401 () Bool)

(assert (=> b!43474 m!37401))

(assert (=> b!43474 m!37107))

(assert (=> b!43474 m!37401))

(declare-fun m!37403 () Bool)

(assert (=> b!43474 m!37403))

(assert (=> b!43474 m!37105))

(declare-fun m!37405 () Bool)

(assert (=> d!7985 m!37405))

(assert (=> d!7985 m!36915))

(declare-fun m!37407 () Bool)

(assert (=> bm!3485 m!37407))

(assert (=> b!43482 m!37407))

(declare-fun m!37409 () Bool)

(assert (=> b!43483 m!37409))

(assert (=> b!43480 m!37105))

(assert (=> b!43480 m!37105))

(assert (=> b!43480 m!37113))

(assert (=> b!43478 m!37105))

(assert (=> b!43478 m!37105))

(assert (=> b!43478 m!37113))

(assert (=> b!43481 m!37105))

(assert (=> b!43481 m!37105))

(declare-fun m!37411 () Bool)

(assert (=> b!43481 m!37411))

(assert (=> b!43476 m!36929))

(assert (=> b!43476 m!37107))

(assert (=> b!43476 m!36929))

(assert (=> b!43476 m!37111))

(assert (=> b!43476 m!37107))

(assert (=> b!43476 m!37105))

(assert (=> b!43476 m!37105))

(declare-fun m!37413 () Bool)

(assert (=> b!43476 m!37413))

(declare-fun m!37415 () Bool)

(assert (=> b!43479 m!37415))

(assert (=> b!43199 d!7985))

(declare-fun d!8015 () Bool)

(assert (=> d!8015 (= (apply!59 (+!67 lt!18573 (tuple2!1625 lt!18578 lt!18377)) lt!18572) (get!789 (getValueByKey!104 (toList!616 (+!67 lt!18573 (tuple2!1625 lt!18578 lt!18377))) lt!18572)))))

(declare-fun bs!1953 () Bool)

(assert (= bs!1953 d!8015))

(declare-fun m!37417 () Bool)

(assert (=> bs!1953 m!37417))

(assert (=> bs!1953 m!37417))

(declare-fun m!37419 () Bool)

(assert (=> bs!1953 m!37419))

(assert (=> b!43199 d!8015))

(declare-fun d!8017 () Bool)

(assert (=> d!8017 (= (apply!59 lt!18586 lt!18583) (get!789 (getValueByKey!104 (toList!616 lt!18586) lt!18583)))))

(declare-fun bs!1954 () Bool)

(assert (= bs!1954 d!8017))

(declare-fun m!37421 () Bool)

(assert (=> bs!1954 m!37421))

(assert (=> bs!1954 m!37421))

(declare-fun m!37423 () Bool)

(assert (=> bs!1954 m!37423))

(assert (=> b!43199 d!8017))

(declare-fun d!8019 () Bool)

(assert (=> d!8019 (= (apply!59 lt!18576 lt!18579) (get!789 (getValueByKey!104 (toList!616 lt!18576) lt!18579)))))

(declare-fun bs!1955 () Bool)

(assert (= bs!1955 d!8019))

(declare-fun m!37425 () Bool)

(assert (=> bs!1955 m!37425))

(assert (=> bs!1955 m!37425))

(declare-fun m!37427 () Bool)

(assert (=> bs!1955 m!37427))

(assert (=> b!43199 d!8019))

(declare-fun d!8021 () Bool)

(assert (=> d!8021 (= (apply!59 (+!67 lt!18573 (tuple2!1625 lt!18578 lt!18377)) lt!18572) (apply!59 lt!18573 lt!18572))))

(declare-fun lt!18813 () Unit!1199)

(declare-fun choose!256 (ListLongMap!1201 (_ BitVec 64) V!2311 (_ BitVec 64)) Unit!1199)

(assert (=> d!8021 (= lt!18813 (choose!256 lt!18573 lt!18578 lt!18377 lt!18572))))

(declare-fun e!27566 () Bool)

(assert (=> d!8021 e!27566))

(declare-fun res!25766 () Bool)

(assert (=> d!8021 (=> (not res!25766) (not e!27566))))

(assert (=> d!8021 (= res!25766 (contains!563 lt!18573 lt!18572))))

(assert (=> d!8021 (= (addApplyDifferent!34 lt!18573 lt!18578 lt!18377 lt!18572) lt!18813)))

(declare-fun b!43507 () Bool)

(assert (=> b!43507 (= e!27566 (not (= lt!18572 lt!18578)))))

(assert (= (and d!8021 res!25766) b!43507))

(assert (=> d!8021 m!37103))

(assert (=> d!8021 m!37087))

(assert (=> d!8021 m!37089))

(assert (=> d!8021 m!37087))

(declare-fun m!37429 () Bool)

(assert (=> d!8021 m!37429))

(declare-fun m!37431 () Bool)

(assert (=> d!8021 m!37431))

(assert (=> b!43199 d!8021))

(declare-fun d!8023 () Bool)

(declare-fun e!27568 () Bool)

(assert (=> d!8023 e!27568))

(declare-fun res!25767 () Bool)

(assert (=> d!8023 (=> res!25767 e!27568)))

(declare-fun lt!18818 () Bool)

(assert (=> d!8023 (= res!25767 (not lt!18818))))

(declare-fun lt!18819 () Bool)

(assert (=> d!8023 (= lt!18818 lt!18819)))

(declare-fun lt!18817 () Unit!1199)

(declare-fun e!27567 () Unit!1199)

(assert (=> d!8023 (= lt!18817 e!27567)))

(declare-fun c!5591 () Bool)

(assert (=> d!8023 (= c!5591 lt!18819)))

(assert (=> d!8023 (= lt!18819 (containsKey!73 (toList!616 (+!67 lt!18585 (tuple2!1625 lt!18569 lt!18377))) lt!18571))))

(assert (=> d!8023 (= (contains!563 (+!67 lt!18585 (tuple2!1625 lt!18569 lt!18377)) lt!18571) lt!18818)))

(declare-fun b!43508 () Bool)

(declare-fun lt!18816 () Unit!1199)

(assert (=> b!43508 (= e!27567 lt!18816)))

(assert (=> b!43508 (= lt!18816 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!616 (+!67 lt!18585 (tuple2!1625 lt!18569 lt!18377))) lt!18571))))

(assert (=> b!43508 (isDefined!61 (getValueByKey!104 (toList!616 (+!67 lt!18585 (tuple2!1625 lt!18569 lt!18377))) lt!18571))))

(declare-fun b!43509 () Bool)

(declare-fun Unit!1212 () Unit!1199)

(assert (=> b!43509 (= e!27567 Unit!1212)))

(declare-fun b!43510 () Bool)

(assert (=> b!43510 (= e!27568 (isDefined!61 (getValueByKey!104 (toList!616 (+!67 lt!18585 (tuple2!1625 lt!18569 lt!18377))) lt!18571)))))

(assert (= (and d!8023 c!5591) b!43508))

(assert (= (and d!8023 (not c!5591)) b!43509))

(assert (= (and d!8023 (not res!25767)) b!43510))

(declare-fun m!37433 () Bool)

(assert (=> d!8023 m!37433))

(declare-fun m!37435 () Bool)

(assert (=> b!43508 m!37435))

(declare-fun m!37437 () Bool)

(assert (=> b!43508 m!37437))

(assert (=> b!43508 m!37437))

(declare-fun m!37439 () Bool)

(assert (=> b!43508 m!37439))

(assert (=> b!43510 m!37437))

(assert (=> b!43510 m!37437))

(assert (=> b!43510 m!37439))

(assert (=> b!43199 d!8023))

(declare-fun d!8025 () Bool)

(assert (=> d!8025 (contains!563 (+!67 lt!18585 (tuple2!1625 lt!18569 lt!18377)) lt!18571)))

(declare-fun lt!18841 () Unit!1199)

(declare-fun choose!257 (ListLongMap!1201 (_ BitVec 64) V!2311 (_ BitVec 64)) Unit!1199)

(assert (=> d!8025 (= lt!18841 (choose!257 lt!18585 lt!18569 lt!18377 lt!18571))))

(assert (=> d!8025 (contains!563 lt!18585 lt!18571)))

(assert (=> d!8025 (= (addStillContains!34 lt!18585 lt!18569 lt!18377 lt!18571) lt!18841)))

(declare-fun bs!1956 () Bool)

(assert (= bs!1956 d!8025))

(assert (=> bs!1956 m!37095))

(assert (=> bs!1956 m!37095))

(assert (=> bs!1956 m!37097))

(declare-fun m!37461 () Bool)

(assert (=> bs!1956 m!37461))

(declare-fun m!37463 () Bool)

(assert (=> bs!1956 m!37463))

(assert (=> b!43199 d!8025))

(declare-fun d!8029 () Bool)

(assert (=> d!8029 (= (apply!59 (+!67 lt!18586 (tuple2!1625 lt!18584 lt!18377)) lt!18583) (apply!59 lt!18586 lt!18583))))

(declare-fun lt!18842 () Unit!1199)

(assert (=> d!8029 (= lt!18842 (choose!256 lt!18586 lt!18584 lt!18377 lt!18583))))

(declare-fun e!27590 () Bool)

(assert (=> d!8029 e!27590))

(declare-fun res!25780 () Bool)

(assert (=> d!8029 (=> (not res!25780) (not e!27590))))

(assert (=> d!8029 (= res!25780 (contains!563 lt!18586 lt!18583))))

(assert (=> d!8029 (= (addApplyDifferent!34 lt!18586 lt!18584 lt!18377 lt!18583) lt!18842)))

(declare-fun b!43548 () Bool)

(assert (=> b!43548 (= e!27590 (not (= lt!18583 lt!18584)))))

(assert (= (and d!8029 res!25780) b!43548))

(assert (=> d!8029 m!37093))

(assert (=> d!8029 m!37077))

(assert (=> d!8029 m!37083))

(assert (=> d!8029 m!37077))

(declare-fun m!37465 () Bool)

(assert (=> d!8029 m!37465))

(declare-fun m!37467 () Bool)

(assert (=> d!8029 m!37467))

(assert (=> b!43199 d!8029))

(declare-fun d!8031 () Bool)

(declare-fun e!27591 () Bool)

(assert (=> d!8031 e!27591))

(declare-fun res!25782 () Bool)

(assert (=> d!8031 (=> (not res!25782) (not e!27591))))

(declare-fun lt!18845 () ListLongMap!1201)

(assert (=> d!8031 (= res!25782 (contains!563 lt!18845 (_1!823 (tuple2!1625 lt!18577 lt!18377))))))

(declare-fun lt!18846 () List!1198)

(assert (=> d!8031 (= lt!18845 (ListLongMap!1202 lt!18846))))

(declare-fun lt!18843 () Unit!1199)

(declare-fun lt!18844 () Unit!1199)

(assert (=> d!8031 (= lt!18843 lt!18844)))

(assert (=> d!8031 (= (getValueByKey!104 lt!18846 (_1!823 (tuple2!1625 lt!18577 lt!18377))) (Some!109 (_2!823 (tuple2!1625 lt!18577 lt!18377))))))

(assert (=> d!8031 (= lt!18844 (lemmaContainsTupThenGetReturnValue!28 lt!18846 (_1!823 (tuple2!1625 lt!18577 lt!18377)) (_2!823 (tuple2!1625 lt!18577 lt!18377))))))

(assert (=> d!8031 (= lt!18846 (insertStrictlySorted!25 (toList!616 lt!18576) (_1!823 (tuple2!1625 lt!18577 lt!18377)) (_2!823 (tuple2!1625 lt!18577 lt!18377))))))

(assert (=> d!8031 (= (+!67 lt!18576 (tuple2!1625 lt!18577 lt!18377)) lt!18845)))

(declare-fun b!43549 () Bool)

(declare-fun res!25781 () Bool)

(assert (=> b!43549 (=> (not res!25781) (not e!27591))))

(assert (=> b!43549 (= res!25781 (= (getValueByKey!104 (toList!616 lt!18845) (_1!823 (tuple2!1625 lt!18577 lt!18377))) (Some!109 (_2!823 (tuple2!1625 lt!18577 lt!18377)))))))

(declare-fun b!43550 () Bool)

(assert (=> b!43550 (= e!27591 (contains!568 (toList!616 lt!18845) (tuple2!1625 lt!18577 lt!18377)))))

(assert (= (and d!8031 res!25782) b!43549))

(assert (= (and b!43549 res!25781) b!43550))

(declare-fun m!37469 () Bool)

(assert (=> d!8031 m!37469))

(declare-fun m!37471 () Bool)

(assert (=> d!8031 m!37471))

(declare-fun m!37473 () Bool)

(assert (=> d!8031 m!37473))

(declare-fun m!37475 () Bool)

(assert (=> d!8031 m!37475))

(declare-fun m!37477 () Bool)

(assert (=> b!43549 m!37477))

(declare-fun m!37479 () Bool)

(assert (=> b!43550 m!37479))

(assert (=> b!43199 d!8031))

(declare-fun d!8033 () Bool)

(assert (=> d!8033 (= (apply!59 (+!67 lt!18576 (tuple2!1625 lt!18577 lt!18377)) lt!18579) (get!789 (getValueByKey!104 (toList!616 (+!67 lt!18576 (tuple2!1625 lt!18577 lt!18377))) lt!18579)))))

(declare-fun bs!1957 () Bool)

(assert (= bs!1957 d!8033))

(declare-fun m!37481 () Bool)

(assert (=> bs!1957 m!37481))

(assert (=> bs!1957 m!37481))

(declare-fun m!37483 () Bool)

(assert (=> bs!1957 m!37483))

(assert (=> b!43199 d!8033))

(declare-fun d!8035 () Bool)

(assert (=> d!8035 (= (apply!59 (+!67 lt!18586 (tuple2!1625 lt!18584 lt!18377)) lt!18583) (get!789 (getValueByKey!104 (toList!616 (+!67 lt!18586 (tuple2!1625 lt!18584 lt!18377))) lt!18583)))))

(declare-fun bs!1958 () Bool)

(assert (= bs!1958 d!8035))

(declare-fun m!37485 () Bool)

(assert (=> bs!1958 m!37485))

(assert (=> bs!1958 m!37485))

(declare-fun m!37487 () Bool)

(assert (=> bs!1958 m!37487))

(assert (=> b!43199 d!8035))

(declare-fun d!8037 () Bool)

(declare-fun e!27592 () Bool)

(assert (=> d!8037 e!27592))

(declare-fun res!25784 () Bool)

(assert (=> d!8037 (=> (not res!25784) (not e!27592))))

(declare-fun lt!18849 () ListLongMap!1201)

(assert (=> d!8037 (= res!25784 (contains!563 lt!18849 (_1!823 (tuple2!1625 lt!18584 lt!18377))))))

(declare-fun lt!18850 () List!1198)

(assert (=> d!8037 (= lt!18849 (ListLongMap!1202 lt!18850))))

(declare-fun lt!18847 () Unit!1199)

(declare-fun lt!18848 () Unit!1199)

(assert (=> d!8037 (= lt!18847 lt!18848)))

(assert (=> d!8037 (= (getValueByKey!104 lt!18850 (_1!823 (tuple2!1625 lt!18584 lt!18377))) (Some!109 (_2!823 (tuple2!1625 lt!18584 lt!18377))))))

(assert (=> d!8037 (= lt!18848 (lemmaContainsTupThenGetReturnValue!28 lt!18850 (_1!823 (tuple2!1625 lt!18584 lt!18377)) (_2!823 (tuple2!1625 lt!18584 lt!18377))))))

(assert (=> d!8037 (= lt!18850 (insertStrictlySorted!25 (toList!616 lt!18586) (_1!823 (tuple2!1625 lt!18584 lt!18377)) (_2!823 (tuple2!1625 lt!18584 lt!18377))))))

(assert (=> d!8037 (= (+!67 lt!18586 (tuple2!1625 lt!18584 lt!18377)) lt!18849)))

(declare-fun b!43551 () Bool)

(declare-fun res!25783 () Bool)

(assert (=> b!43551 (=> (not res!25783) (not e!27592))))

(assert (=> b!43551 (= res!25783 (= (getValueByKey!104 (toList!616 lt!18849) (_1!823 (tuple2!1625 lt!18584 lt!18377))) (Some!109 (_2!823 (tuple2!1625 lt!18584 lt!18377)))))))

(declare-fun b!43552 () Bool)

(assert (=> b!43552 (= e!27592 (contains!568 (toList!616 lt!18849) (tuple2!1625 lt!18584 lt!18377)))))

(assert (= (and d!8037 res!25784) b!43551))

(assert (= (and b!43551 res!25783) b!43552))

(declare-fun m!37489 () Bool)

(assert (=> d!8037 m!37489))

(declare-fun m!37491 () Bool)

(assert (=> d!8037 m!37491))

(declare-fun m!37493 () Bool)

(assert (=> d!8037 m!37493))

(declare-fun m!37495 () Bool)

(assert (=> d!8037 m!37495))

(declare-fun m!37497 () Bool)

(assert (=> b!43551 m!37497))

(declare-fun m!37499 () Bool)

(assert (=> b!43552 m!37499))

(assert (=> b!43199 d!8037))

(declare-fun d!8041 () Bool)

(assert (=> d!8041 (= (apply!59 (+!67 lt!18576 (tuple2!1625 lt!18577 lt!18377)) lt!18579) (apply!59 lt!18576 lt!18579))))

(declare-fun lt!18854 () Unit!1199)

(assert (=> d!8041 (= lt!18854 (choose!256 lt!18576 lt!18577 lt!18377 lt!18579))))

(declare-fun e!27596 () Bool)

(assert (=> d!8041 e!27596))

(declare-fun res!25787 () Bool)

(assert (=> d!8041 (=> (not res!25787) (not e!27596))))

(assert (=> d!8041 (= res!25787 (contains!563 lt!18576 lt!18579))))

(assert (=> d!8041 (= (addApplyDifferent!34 lt!18576 lt!18577 lt!18377 lt!18579) lt!18854)))

(declare-fun b!43557 () Bool)

(assert (=> b!43557 (= e!27596 (not (= lt!18579 lt!18577)))))

(assert (= (and d!8041 res!25787) b!43557))

(assert (=> d!8041 m!37091))

(assert (=> d!8041 m!37073))

(assert (=> d!8041 m!37075))

(assert (=> d!8041 m!37073))

(declare-fun m!37503 () Bool)

(assert (=> d!8041 m!37503))

(declare-fun m!37507 () Bool)

(assert (=> d!8041 m!37507))

(assert (=> b!43199 d!8041))

(assert (=> b!43054 d!7967))

(assert (=> b!43054 d!7969))

(assert (=> b!43332 d!7953))

(declare-fun d!8043 () Bool)

(declare-fun e!27598 () Bool)

(assert (=> d!8043 e!27598))

(declare-fun res!25788 () Bool)

(assert (=> d!8043 (=> res!25788 e!27598)))

(declare-fun lt!18857 () Bool)

(assert (=> d!8043 (= res!25788 (not lt!18857))))

(declare-fun lt!18858 () Bool)

(assert (=> d!8043 (= lt!18857 lt!18858)))

(declare-fun lt!18856 () Unit!1199)

(declare-fun e!27597 () Unit!1199)

(assert (=> d!8043 (= lt!18856 e!27597)))

(declare-fun c!5605 () Bool)

(assert (=> d!8043 (= c!5605 lt!18858)))

(assert (=> d!8043 (= lt!18858 (containsKey!73 (toList!616 lt!18581) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8043 (= (contains!563 lt!18581 #b0000000000000000000000000000000000000000000000000000000000000000) lt!18857)))

(declare-fun b!43558 () Bool)

(declare-fun lt!18855 () Unit!1199)

(assert (=> b!43558 (= e!27597 lt!18855)))

(assert (=> b!43558 (= lt!18855 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!616 lt!18581) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43558 (isDefined!61 (getValueByKey!104 (toList!616 lt!18581) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43559 () Bool)

(declare-fun Unit!1214 () Unit!1199)

(assert (=> b!43559 (= e!27597 Unit!1214)))

(declare-fun b!43560 () Bool)

(assert (=> b!43560 (= e!27598 (isDefined!61 (getValueByKey!104 (toList!616 lt!18581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8043 c!5605) b!43558))

(assert (= (and d!8043 (not c!5605)) b!43559))

(assert (= (and d!8043 (not res!25788)) b!43560))

(declare-fun m!37517 () Bool)

(assert (=> d!8043 m!37517))

(declare-fun m!37519 () Bool)

(assert (=> b!43558 m!37519))

(assert (=> b!43558 m!37239))

(assert (=> b!43558 m!37239))

(declare-fun m!37521 () Bool)

(assert (=> b!43558 m!37521))

(assert (=> b!43560 m!37239))

(assert (=> b!43560 m!37239))

(assert (=> b!43560 m!37521))

(assert (=> bm!3443 d!8043))

(declare-fun d!8047 () Bool)

(assert (=> d!8047 (arrayContainsKey!0 lt!18374 lt!18672 #b00000000000000000000000000000000)))

(declare-fun lt!18870 () Unit!1199)

(declare-fun choose!13 (array!2931 (_ BitVec 64) (_ BitVec 32)) Unit!1199)

(assert (=> d!8047 (= lt!18870 (choose!13 lt!18374 lt!18672 #b00000000000000000000000000000000))))

(assert (=> d!8047 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8047 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18374 lt!18672 #b00000000000000000000000000000000) lt!18870)))

(declare-fun bs!1960 () Bool)

(assert (= bs!1960 d!8047))

(assert (=> bs!1960 m!37165))

(declare-fun m!37523 () Bool)

(assert (=> bs!1960 m!37523))

(assert (=> b!43331 d!8047))

(declare-fun d!8049 () Bool)

(declare-fun res!25804 () Bool)

(declare-fun e!27618 () Bool)

(assert (=> d!8049 (=> res!25804 e!27618)))

(assert (=> d!8049 (= res!25804 (= (select (arr!1409 lt!18374) #b00000000000000000000000000000000) lt!18672))))

(assert (=> d!8049 (= (arrayContainsKey!0 lt!18374 lt!18672 #b00000000000000000000000000000000) e!27618)))

(declare-fun b!43586 () Bool)

(declare-fun e!27619 () Bool)

(assert (=> b!43586 (= e!27618 e!27619)))

(declare-fun res!25805 () Bool)

(assert (=> b!43586 (=> (not res!25805) (not e!27619))))

(assert (=> b!43586 (= res!25805 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1594 lt!18374)))))

(declare-fun b!43587 () Bool)

(assert (=> b!43587 (= e!27619 (arrayContainsKey!0 lt!18374 lt!18672 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8049 (not res!25804)) b!43586))

(assert (= (and b!43586 res!25805) b!43587))

(assert (=> d!8049 m!37105))

(declare-fun m!37559 () Bool)

(assert (=> b!43587 m!37559))

(assert (=> b!43331 d!8049))

(declare-fun b!43661 () Bool)

(declare-fun e!27669 () SeekEntryResult!197)

(assert (=> b!43661 (= e!27669 Undefined!197)))

(declare-fun b!43662 () Bool)

(declare-fun e!27668 () SeekEntryResult!197)

(declare-fun lt!18941 () SeekEntryResult!197)

(assert (=> b!43662 (= e!27668 (Found!197 (index!2912 lt!18941)))))

(declare-fun b!43663 () Bool)

(declare-fun e!27670 () SeekEntryResult!197)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2931 (_ BitVec 32)) SeekEntryResult!197)

(assert (=> b!43663 (= e!27670 (seekKeyOrZeroReturnVacant!0 (x!8286 lt!18941) (index!2912 lt!18941) (index!2912 lt!18941) (select (arr!1409 lt!18374) #b00000000000000000000000000000000) lt!18374 mask!853))))

(declare-fun b!43664 () Bool)

(declare-fun c!5629 () Bool)

(declare-fun lt!18940 () (_ BitVec 64))

(assert (=> b!43664 (= c!5629 (= lt!18940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!43664 (= e!27668 e!27670)))

(declare-fun b!43665 () Bool)

(assert (=> b!43665 (= e!27669 e!27668)))

(assert (=> b!43665 (= lt!18940 (select (arr!1409 lt!18374) (index!2912 lt!18941)))))

(declare-fun c!5628 () Bool)

(assert (=> b!43665 (= c!5628 (= lt!18940 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun b!43666 () Bool)

(assert (=> b!43666 (= e!27670 (MissingZero!197 (index!2912 lt!18941)))))

(declare-fun d!8057 () Bool)

(declare-fun lt!18939 () SeekEntryResult!197)

(assert (=> d!8057 (and (or ((_ is Undefined!197) lt!18939) (not ((_ is Found!197) lt!18939)) (and (bvsge (index!2911 lt!18939) #b00000000000000000000000000000000) (bvslt (index!2911 lt!18939) (size!1594 lt!18374)))) (or ((_ is Undefined!197) lt!18939) ((_ is Found!197) lt!18939) (not ((_ is MissingZero!197) lt!18939)) (and (bvsge (index!2910 lt!18939) #b00000000000000000000000000000000) (bvslt (index!2910 lt!18939) (size!1594 lt!18374)))) (or ((_ is Undefined!197) lt!18939) ((_ is Found!197) lt!18939) ((_ is MissingZero!197) lt!18939) (not ((_ is MissingVacant!197) lt!18939)) (and (bvsge (index!2913 lt!18939) #b00000000000000000000000000000000) (bvslt (index!2913 lt!18939) (size!1594 lt!18374)))) (or ((_ is Undefined!197) lt!18939) (ite ((_ is Found!197) lt!18939) (= (select (arr!1409 lt!18374) (index!2911 lt!18939)) (select (arr!1409 lt!18374) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!197) lt!18939) (= (select (arr!1409 lt!18374) (index!2910 lt!18939)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!197) lt!18939) (= (select (arr!1409 lt!18374) (index!2913 lt!18939)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8057 (= lt!18939 e!27669)))

(declare-fun c!5627 () Bool)

(assert (=> d!8057 (= c!5627 (and ((_ is Intermediate!197) lt!18941) (undefined!1009 lt!18941)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2931 (_ BitVec 32)) SeekEntryResult!197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!8057 (= lt!18941 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) mask!853) (select (arr!1409 lt!18374) #b00000000000000000000000000000000) lt!18374 mask!853))))

(assert (=> d!8057 (validMask!0 mask!853)))

(assert (=> d!8057 (= (seekEntryOrOpen!0 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) lt!18374 mask!853) lt!18939)))

(assert (= (and d!8057 c!5627) b!43661))

(assert (= (and d!8057 (not c!5627)) b!43665))

(assert (= (and b!43665 c!5628) b!43662))

(assert (= (and b!43665 (not c!5628)) b!43664))

(assert (= (and b!43664 c!5629) b!43666))

(assert (= (and b!43664 (not c!5629)) b!43663))

(assert (=> b!43663 m!37105))

(declare-fun m!37707 () Bool)

(assert (=> b!43663 m!37707))

(declare-fun m!37709 () Bool)

(assert (=> b!43665 m!37709))

(assert (=> d!8057 m!37105))

(declare-fun m!37711 () Bool)

(assert (=> d!8057 m!37711))

(assert (=> d!8057 m!37711))

(assert (=> d!8057 m!37105))

(declare-fun m!37713 () Bool)

(assert (=> d!8057 m!37713))

(declare-fun m!37715 () Bool)

(assert (=> d!8057 m!37715))

(assert (=> d!8057 m!36915))

(declare-fun m!37717 () Bool)

(assert (=> d!8057 m!37717))

(declare-fun m!37719 () Bool)

(assert (=> d!8057 m!37719))

(assert (=> b!43331 d!8057))

(assert (=> b!43240 d!7953))

(assert (=> b!43196 d!7953))

(declare-fun b!43668 () Bool)

(declare-fun e!27674 () Bool)

(declare-fun call!3505 () Bool)

(assert (=> b!43668 (= e!27674 call!3505)))

(declare-fun bm!3502 () Bool)

(assert (=> bm!3502 (= call!3505 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!18374 mask!853))))

(declare-fun b!43669 () Bool)

(declare-fun e!27672 () Bool)

(assert (=> b!43669 (= e!27672 e!27674)))

(declare-fun lt!18944 () (_ BitVec 64))

(assert (=> b!43669 (= lt!18944 (select (arr!1409 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!18943 () Unit!1199)

(assert (=> b!43669 (= lt!18943 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!18374 lt!18944 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!43669 (arrayContainsKey!0 lt!18374 lt!18944 #b00000000000000000000000000000000)))

(declare-fun lt!18945 () Unit!1199)

(assert (=> b!43669 (= lt!18945 lt!18943)))

(declare-fun res!25847 () Bool)

(assert (=> b!43669 (= res!25847 (= (seekEntryOrOpen!0 (select (arr!1409 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!18374 mask!853) (Found!197 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!43669 (=> (not res!25847) (not e!27674))))

(declare-fun b!43670 () Bool)

(declare-fun e!27673 () Bool)

(assert (=> b!43670 (= e!27673 e!27672)))

(declare-fun c!5630 () Bool)

(assert (=> b!43670 (= c!5630 (validKeyInArray!0 (select (arr!1409 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8091 () Bool)

(declare-fun res!25846 () Bool)

(assert (=> d!8091 (=> res!25846 e!27673)))

(assert (=> d!8091 (= res!25846 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1594 lt!18374)))))

(assert (=> d!8091 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!18374 mask!853) e!27673)))

(declare-fun b!43671 () Bool)

(assert (=> b!43671 (= e!27672 call!3505)))

(assert (= (and d!8091 (not res!25846)) b!43670))

(assert (= (and b!43670 c!5630) b!43669))

(assert (= (and b!43670 (not c!5630)) b!43671))

(assert (= (and b!43669 res!25847) b!43668))

(assert (= (or b!43668 b!43671) bm!3502))

(declare-fun m!37729 () Bool)

(assert (=> bm!3502 m!37729))

(declare-fun m!37731 () Bool)

(assert (=> b!43669 m!37731))

(declare-fun m!37733 () Bool)

(assert (=> b!43669 m!37733))

(declare-fun m!37735 () Bool)

(assert (=> b!43669 m!37735))

(assert (=> b!43669 m!37731))

(declare-fun m!37737 () Bool)

(assert (=> b!43669 m!37737))

(assert (=> b!43670 m!37731))

(assert (=> b!43670 m!37731))

(declare-fun m!37739 () Bool)

(assert (=> b!43670 m!37739))

(assert (=> bm!3475 d!8091))

(assert (=> bm!3441 d!7985))

(assert (=> b!43237 d!7953))

(declare-fun b!43676 () Bool)

(declare-fun e!27677 () Bool)

(assert (=> b!43676 (= e!27677 (contains!566 (ite c!5510 (Cons!1195 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) Nil!1196) Nil!1196) (select (arr!1409 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3503 () Bool)

(declare-fun call!3506 () Bool)

(declare-fun c!5631 () Bool)

(assert (=> bm!3503 (= call!3506 (arrayNoDuplicates!0 lt!18374 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5631 (Cons!1195 (select (arr!1409 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5510 (Cons!1195 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) Nil!1196) Nil!1196)) (ite c!5510 (Cons!1195 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) Nil!1196) Nil!1196))))))

(declare-fun b!43677 () Bool)

(declare-fun e!27679 () Bool)

(declare-fun e!27678 () Bool)

(assert (=> b!43677 (= e!27679 e!27678)))

(assert (=> b!43677 (= c!5631 (validKeyInArray!0 (select (arr!1409 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43678 () Bool)

(assert (=> b!43678 (= e!27678 call!3506)))

(declare-fun b!43679 () Bool)

(assert (=> b!43679 (= e!27678 call!3506)))

(declare-fun b!43680 () Bool)

(declare-fun e!27680 () Bool)

(assert (=> b!43680 (= e!27680 e!27679)))

(declare-fun res!25852 () Bool)

(assert (=> b!43680 (=> (not res!25852) (not e!27679))))

(assert (=> b!43680 (= res!25852 (not e!27677))))

(declare-fun res!25854 () Bool)

(assert (=> b!43680 (=> (not res!25854) (not e!27677))))

(assert (=> b!43680 (= res!25854 (validKeyInArray!0 (select (arr!1409 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8097 () Bool)

(declare-fun res!25853 () Bool)

(assert (=> d!8097 (=> res!25853 e!27680)))

(assert (=> d!8097 (= res!25853 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1594 lt!18374)))))

(assert (=> d!8097 (= (arrayNoDuplicates!0 lt!18374 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5510 (Cons!1195 (select (arr!1409 lt!18374) #b00000000000000000000000000000000) Nil!1196) Nil!1196)) e!27680)))

(assert (= (and d!8097 (not res!25853)) b!43680))

(assert (= (and b!43680 res!25854) b!43676))

(assert (= (and b!43680 res!25852) b!43677))

(assert (= (and b!43677 c!5631) b!43679))

(assert (= (and b!43677 (not c!5631)) b!43678))

(assert (= (or b!43679 b!43678) bm!3503))

(assert (=> b!43676 m!37731))

(assert (=> b!43676 m!37731))

(declare-fun m!37773 () Bool)

(assert (=> b!43676 m!37773))

(assert (=> bm!3503 m!37731))

(declare-fun m!37775 () Bool)

(assert (=> bm!3503 m!37775))

(assert (=> b!43677 m!37731))

(assert (=> b!43677 m!37731))

(assert (=> b!43677 m!37739))

(assert (=> b!43680 m!37731))

(assert (=> b!43680 m!37731))

(assert (=> b!43680 m!37739))

(assert (=> bm!3449 d!8097))

(declare-fun d!8112 () Bool)

(declare-fun e!27683 () Bool)

(assert (=> d!8112 e!27683))

(declare-fun res!25856 () Bool)

(assert (=> d!8112 (=> res!25856 e!27683)))

(declare-fun lt!18957 () Bool)

(assert (=> d!8112 (= res!25856 (not lt!18957))))

(declare-fun lt!18958 () Bool)

(assert (=> d!8112 (= lt!18957 lt!18958)))

(declare-fun lt!18956 () Unit!1199)

(declare-fun e!27682 () Unit!1199)

(assert (=> d!8112 (= lt!18956 e!27682)))

(declare-fun c!5632 () Bool)

(assert (=> d!8112 (= c!5632 lt!18958)))

(assert (=> d!8112 (= lt!18958 (containsKey!73 (toList!616 lt!18581) (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(assert (=> d!8112 (= (contains!563 lt!18581 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)) lt!18957)))

(declare-fun b!43682 () Bool)

(declare-fun lt!18955 () Unit!1199)

(assert (=> b!43682 (= e!27682 lt!18955)))

(assert (=> b!43682 (= lt!18955 (lemmaContainsKeyImpliesGetValueByKeyDefined!60 (toList!616 lt!18581) (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(assert (=> b!43682 (isDefined!61 (getValueByKey!104 (toList!616 lt!18581) (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun b!43683 () Bool)

(declare-fun Unit!1215 () Unit!1199)

(assert (=> b!43683 (= e!27682 Unit!1215)))

(declare-fun b!43684 () Bool)

(assert (=> b!43684 (= e!27683 (isDefined!61 (getValueByKey!104 (toList!616 lt!18581) (select (arr!1409 lt!18374) #b00000000000000000000000000000000))))))

(assert (= (and d!8112 c!5632) b!43682))

(assert (= (and d!8112 (not c!5632)) b!43683))

(assert (= (and d!8112 (not res!25856)) b!43684))

(assert (=> d!8112 m!37105))

(declare-fun m!37789 () Bool)

(assert (=> d!8112 m!37789))

(assert (=> b!43682 m!37105))

(declare-fun m!37791 () Bool)

(assert (=> b!43682 m!37791))

(assert (=> b!43682 m!37105))

(declare-fun m!37793 () Bool)

(assert (=> b!43682 m!37793))

(assert (=> b!43682 m!37793))

(declare-fun m!37795 () Bool)

(assert (=> b!43682 m!37795))

(assert (=> b!43684 m!37105))

(assert (=> b!43684 m!37793))

(assert (=> b!43684 m!37793))

(assert (=> b!43684 m!37795))

(assert (=> b!43210 d!8112))

(declare-fun d!8117 () Bool)

(declare-fun lt!18971 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!40 (List!1199) (InoxSet (_ BitVec 64)))

(assert (=> d!8117 (= lt!18971 (select (content!40 Nil!1196) (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun e!27698 () Bool)

(assert (=> d!8117 (= lt!18971 e!27698)))

(declare-fun res!25872 () Bool)

(assert (=> d!8117 (=> (not res!25872) (not e!27698))))

(assert (=> d!8117 (= res!25872 ((_ is Cons!1195) Nil!1196))))

(assert (=> d!8117 (= (contains!566 Nil!1196 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)) lt!18971)))

(declare-fun b!43701 () Bool)

(declare-fun e!27697 () Bool)

(assert (=> b!43701 (= e!27698 e!27697)))

(declare-fun res!25873 () Bool)

(assert (=> b!43701 (=> res!25873 e!27697)))

(assert (=> b!43701 (= res!25873 (= (h!1772 Nil!1196) (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(declare-fun b!43702 () Bool)

(assert (=> b!43702 (= e!27697 (contains!566 (t!4198 Nil!1196) (select (arr!1409 lt!18374) #b00000000000000000000000000000000)))))

(assert (= (and d!8117 res!25872) b!43701))

(assert (= (and b!43701 (not res!25873)) b!43702))

(declare-fun m!37819 () Bool)

(assert (=> d!8117 m!37819))

(assert (=> d!8117 m!37105))

(declare-fun m!37821 () Bool)

(assert (=> d!8117 m!37821))

(assert (=> b!43702 m!37105))

(declare-fun m!37823 () Bool)

(assert (=> b!43702 m!37823))

(assert (=> b!43236 d!8117))

(declare-fun d!8127 () Bool)

(assert (=> d!8127 (= (apply!59 lt!18581 (select (arr!1409 lt!18374) #b00000000000000000000000000000000)) (get!789 (getValueByKey!104 (toList!616 lt!18581) (select (arr!1409 lt!18374) #b00000000000000000000000000000000))))))

(declare-fun bs!1972 () Bool)

(assert (= bs!1972 d!8127))

(assert (=> bs!1972 m!37105))

(assert (=> bs!1972 m!37793))

(assert (=> bs!1972 m!37793))

(declare-fun m!37827 () Bool)

(assert (=> bs!1972 m!37827))

(assert (=> b!43209 d!8127))

(declare-fun d!8129 () Bool)

(declare-fun c!5637 () Bool)

(assert (=> d!8129 (= c!5637 ((_ is ValueCellFull!699) (select (arr!1410 lt!18378) #b00000000000000000000000000000000)))))

(declare-fun e!27708 () V!2311)

(assert (=> d!8129 (= (get!786 (select (arr!1410 lt!18378) #b00000000000000000000000000000000) (dynLambda!260 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)) e!27708)))

(declare-fun b!43714 () Bool)

(declare-fun get!791 (ValueCell!699 V!2311) V!2311)

(assert (=> b!43714 (= e!27708 (get!791 (select (arr!1410 lt!18378) #b00000000000000000000000000000000) (dynLambda!260 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!43715 () Bool)

(declare-fun get!792 (ValueCell!699 V!2311) V!2311)

(assert (=> b!43715 (= e!27708 (get!792 (select (arr!1410 lt!18378) #b00000000000000000000000000000000) (dynLambda!260 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8129 c!5637) b!43714))

(assert (= (and d!8129 (not c!5637)) b!43715))

(assert (=> b!43714 m!37107))

(assert (=> b!43714 m!36929))

(declare-fun m!37835 () Bool)

(assert (=> b!43714 m!37835))

(assert (=> b!43715 m!37107))

(assert (=> b!43715 m!36929))

(declare-fun m!37837 () Bool)

(assert (=> b!43715 m!37837))

(assert (=> b!43209 d!8129))

(assert (=> d!7925 d!7921))

(declare-fun d!8137 () Bool)

(assert (=> d!8137 (= (arrayCountValidKeys!0 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!8137 true))

(declare-fun _$88!46 () Unit!1199)

(assert (=> d!8137 (= (choose!59 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!46)))

(declare-fun bs!1974 () Bool)

(assert (= bs!1974 d!8137))

(assert (=> bs!1974 m!36921))

(assert (=> d!7925 d!8137))

(assert (=> d!7933 d!7937))

(declare-fun d!8139 () Bool)

(assert (=> d!8139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!18374 mask!853)))

(assert (=> d!8139 true))

(declare-fun _$30!66 () Unit!1199)

(assert (=> d!8139 (= (choose!34 lt!18374 mask!853 #b00000000000000000000000000000000) _$30!66)))

(declare-fun bs!1976 () Bool)

(assert (= bs!1976 d!8139))

(assert (=> bs!1976 m!36917))

(assert (=> d!7933 d!8139))

(assert (=> d!7933 d!7881))

(declare-fun d!8145 () Bool)

(declare-fun e!27730 () Bool)

(assert (=> d!8145 e!27730))

(declare-fun res!25891 () Bool)

(assert (=> d!8145 (=> (not res!25891) (not e!27730))))

(declare-fun lt!18997 () ListLongMap!1201)

(assert (=> d!8145 (= res!25891 (contains!563 lt!18997 (_1!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))))))

(declare-fun lt!18998 () List!1198)

(assert (=> d!8145 (= lt!18997 (ListLongMap!1202 lt!18998))))

(declare-fun lt!18995 () Unit!1199)

(declare-fun lt!18996 () Unit!1199)

(assert (=> d!8145 (= lt!18995 lt!18996)))

(assert (=> d!8145 (= (getValueByKey!104 lt!18998 (_1!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))) (Some!109 (_2!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))))))

(assert (=> d!8145 (= lt!18996 (lemmaContainsTupThenGetReturnValue!28 lt!18998 (_1!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)) (_2!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))))))

(assert (=> d!8145 (= lt!18998 (insertStrictlySorted!25 (toList!616 call!3444) (_1!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)) (_2!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))))))

(assert (=> d!8145 (= (+!67 call!3444 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)) lt!18997)))

(declare-fun b!43753 () Bool)

(declare-fun res!25890 () Bool)

(assert (=> b!43753 (=> (not res!25890) (not e!27730))))

(assert (=> b!43753 (= res!25890 (= (getValueByKey!104 (toList!616 lt!18997) (_1!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377))) (Some!109 (_2!823 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))))))

(declare-fun b!43754 () Bool)

(assert (=> b!43754 (= e!27730 (contains!568 (toList!616 lt!18997) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 lt!18377)))))

(assert (= (and d!8145 res!25891) b!43753))

(assert (= (and b!43753 res!25890) b!43754))

(declare-fun m!37869 () Bool)

(assert (=> d!8145 m!37869))

(declare-fun m!37873 () Bool)

(assert (=> d!8145 m!37873))

(declare-fun m!37879 () Bool)

(assert (=> d!8145 m!37879))

(declare-fun m!37882 () Bool)

(assert (=> d!8145 m!37882))

(declare-fun m!37885 () Bool)

(assert (=> b!43753 m!37885))

(declare-fun m!37888 () Bool)

(assert (=> b!43754 m!37888))

(assert (=> b!43206 d!8145))

(assert (=> d!7943 d!7915))

(declare-fun d!8147 () Bool)

(assert (=> d!8147 (arrayNoDuplicates!0 lt!18374 #b00000000000000000000000000000000 Nil!1196)))

(assert (=> d!8147 true))

(declare-fun res!25896 () Unit!1199)

(assert (=> d!8147 (= (choose!111 lt!18374 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1196) res!25896)))

(declare-fun bs!1977 () Bool)

(assert (= bs!1977 d!8147))

(assert (=> bs!1977 m!36925))

(assert (=> d!7943 d!8147))

(declare-fun b!43762 () Bool)

(declare-fun e!27742 () ListLongMap!1201)

(declare-fun call!3518 () ListLongMap!1201)

(assert (=> b!43762 (= e!27742 call!3518)))

(declare-fun b!43763 () Bool)

(declare-fun e!27744 () ListLongMap!1201)

(assert (=> b!43763 (= e!27744 e!27742)))

(declare-fun c!5659 () Bool)

(assert (=> b!43763 (= c!5659 (and (not (= (bvand (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43764 () Bool)

(declare-fun e!27738 () Bool)

(declare-fun e!27736 () Bool)

(assert (=> b!43764 (= e!27738 e!27736)))

(declare-fun res!25900 () Bool)

(declare-fun call!3521 () Bool)

(assert (=> b!43764 (= res!25900 call!3521)))

(assert (=> b!43764 (=> (not res!25900) (not e!27736))))

(declare-fun b!43765 () Bool)

(declare-fun e!27747 () Bool)

(assert (=> b!43765 (= e!27747 (validKeyInArray!0 (select (arr!1409 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun c!5656 () Bool)

(declare-fun b!43766 () Bool)

(assert (=> b!43766 (= c!5656 (and (not (= (bvand (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!27741 () ListLongMap!1201)

(assert (=> b!43766 (= e!27742 e!27741)))

(declare-fun b!43767 () Bool)

(assert (=> b!43767 (= e!27738 (not call!3521))))

(declare-fun b!43768 () Bool)

(declare-fun e!27743 () Unit!1199)

(declare-fun lt!19013 () Unit!1199)

(assert (=> b!43768 (= e!27743 lt!19013)))

(declare-fun lt!19023 () ListLongMap!1201)

(assert (=> b!43768 (= lt!19023 (getCurrentListMapNoExtraKeys!36 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (mask!5431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))

(declare-fun lt!19007 () (_ BitVec 64))

(assert (=> b!43768 (= lt!19007 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19009 () (_ BitVec 64))

(assert (=> b!43768 (= lt!19009 (select (arr!1409 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!19018 () Unit!1199)

(assert (=> b!43768 (= lt!19018 (addStillContains!34 lt!19023 lt!19007 (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) lt!19009))))

(assert (=> b!43768 (contains!563 (+!67 lt!19023 (tuple2!1625 lt!19007 (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))) lt!19009)))

(declare-fun lt!19027 () Unit!1199)

(assert (=> b!43768 (= lt!19027 lt!19018)))

(declare-fun lt!19011 () ListLongMap!1201)

(assert (=> b!43768 (= lt!19011 (getCurrentListMapNoExtraKeys!36 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (mask!5431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))

(declare-fun lt!19016 () (_ BitVec 64))

(assert (=> b!43768 (= lt!19016 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19010 () (_ BitVec 64))

(assert (=> b!43768 (= lt!19010 (select (arr!1409 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!19020 () Unit!1199)

(assert (=> b!43768 (= lt!19020 (addApplyDifferent!34 lt!19011 lt!19016 (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) lt!19010))))

(assert (=> b!43768 (= (apply!59 (+!67 lt!19011 (tuple2!1625 lt!19016 (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))) lt!19010) (apply!59 lt!19011 lt!19010))))

(declare-fun lt!19025 () Unit!1199)

(assert (=> b!43768 (= lt!19025 lt!19020)))

(declare-fun lt!19014 () ListLongMap!1201)

(assert (=> b!43768 (= lt!19014 (getCurrentListMapNoExtraKeys!36 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (mask!5431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))

(declare-fun lt!19015 () (_ BitVec 64))

(assert (=> b!43768 (= lt!19015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19017 () (_ BitVec 64))

(assert (=> b!43768 (= lt!19017 (select (arr!1409 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!19026 () Unit!1199)

(assert (=> b!43768 (= lt!19026 (addApplyDifferent!34 lt!19014 lt!19015 (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) lt!19017))))

(assert (=> b!43768 (= (apply!59 (+!67 lt!19014 (tuple2!1625 lt!19015 (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))) lt!19017) (apply!59 lt!19014 lt!19017))))

(declare-fun lt!19012 () Unit!1199)

(assert (=> b!43768 (= lt!19012 lt!19026)))

(declare-fun lt!19024 () ListLongMap!1201)

(assert (=> b!43768 (= lt!19024 (getCurrentListMapNoExtraKeys!36 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (mask!5431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))

(declare-fun lt!19022 () (_ BitVec 64))

(assert (=> b!43768 (= lt!19022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19021 () (_ BitVec 64))

(assert (=> b!43768 (= lt!19021 (select (arr!1409 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(assert (=> b!43768 (= lt!19013 (addApplyDifferent!34 lt!19024 lt!19022 (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) lt!19021))))

(assert (=> b!43768 (= (apply!59 (+!67 lt!19024 (tuple2!1625 lt!19022 (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))) lt!19021) (apply!59 lt!19024 lt!19021))))

(declare-fun call!3517 () ListLongMap!1201)

(declare-fun call!3515 () ListLongMap!1201)

(declare-fun bm!3512 () Bool)

(declare-fun call!3520 () ListLongMap!1201)

(declare-fun call!3519 () ListLongMap!1201)

(declare-fun c!5658 () Bool)

(assert (=> bm!3512 (= call!3519 (+!67 (ite c!5658 call!3515 (ite c!5659 call!3517 call!3520)) (ite (or c!5658 c!5659) (tuple2!1625 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))))

(declare-fun b!43769 () Bool)

(declare-fun res!25898 () Bool)

(declare-fun e!27746 () Bool)

(assert (=> b!43769 (=> (not res!25898) (not e!27746))))

(assert (=> b!43769 (= res!25898 e!27738)))

(declare-fun c!5654 () Bool)

(assert (=> b!43769 (= c!5654 (not (= (bvand (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!3513 () Bool)

(declare-fun call!3516 () Bool)

(declare-fun lt!19019 () ListLongMap!1201)

(assert (=> bm!3513 (= call!3516 (contains!563 lt!19019 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!27745 () Bool)

(declare-fun b!43771 () Bool)

(assert (=> b!43771 (= e!27745 (validKeyInArray!0 (select (arr!1409 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!43772 () Bool)

(assert (=> b!43772 (= e!27741 call!3520)))

(declare-fun b!43773 () Bool)

(declare-fun e!27735 () Bool)

(assert (=> b!43773 (= e!27735 (= (apply!59 lt!19019 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))

(declare-fun b!43774 () Bool)

(declare-fun e!27740 () Bool)

(assert (=> b!43774 (= e!27740 e!27735)))

(declare-fun res!25906 () Bool)

(assert (=> b!43774 (= res!25906 call!3516)))

(assert (=> b!43774 (=> (not res!25906) (not e!27735))))

(declare-fun bm!3514 () Bool)

(assert (=> bm!3514 (= call!3518 call!3519)))

(declare-fun b!43775 () Bool)

(assert (=> b!43775 (= e!27744 (+!67 call!3519 (tuple2!1625 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))))

(declare-fun b!43776 () Bool)

(assert (=> b!43776 (= e!27746 e!27740)))

(declare-fun c!5657 () Bool)

(assert (=> b!43776 (= c!5657 (not (= (bvand (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!43777 () Bool)

(declare-fun res!25902 () Bool)

(assert (=> b!43777 (=> (not res!25902) (not e!27746))))

(declare-fun e!27739 () Bool)

(assert (=> b!43777 (= res!25902 e!27739)))

(declare-fun res!25904 () Bool)

(assert (=> b!43777 (=> res!25904 e!27739)))

(assert (=> b!43777 (= res!25904 (not e!27745))))

(declare-fun res!25901 () Bool)

(assert (=> b!43777 (=> (not res!25901) (not e!27745))))

(assert (=> b!43777 (= res!25901 (bvslt #b00000000000000000000000000000000 (size!1594 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))))

(declare-fun b!43778 () Bool)

(declare-fun e!27737 () Bool)

(assert (=> b!43778 (= e!27737 (= (apply!59 lt!19019 (select (arr!1409 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (get!786 (select (arr!1410 (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (dynLambda!260 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!43778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1595 (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))))

(assert (=> b!43778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1594 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))))

(declare-fun bm!3515 () Bool)

(assert (=> bm!3515 (= call!3520 call!3517)))

(declare-fun b!43779 () Bool)

(assert (=> b!43779 (= e!27739 e!27737)))

(declare-fun res!25903 () Bool)

(assert (=> b!43779 (=> (not res!25903) (not e!27737))))

(assert (=> b!43779 (= res!25903 (contains!563 lt!19019 (select (arr!1409 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> b!43779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1594 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))))

(declare-fun b!43780 () Bool)

(assert (=> b!43780 (= e!27740 (not call!3516))))

(declare-fun bm!3516 () Bool)

(assert (=> bm!3516 (= call!3515 (getCurrentListMapNoExtraKeys!36 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (mask!5431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))

(declare-fun b!43781 () Bool)

(declare-fun Unit!1218 () Unit!1199)

(assert (=> b!43781 (= e!27743 Unit!1218)))

(declare-fun bm!3517 () Bool)

(assert (=> bm!3517 (= call!3517 call!3515)))

(declare-fun bm!3518 () Bool)

(assert (=> bm!3518 (= call!3521 (contains!563 lt!19019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43782 () Bool)

(assert (=> b!43782 (= e!27741 call!3518)))

(declare-fun d!8155 () Bool)

(assert (=> d!8155 e!27746))

(declare-fun res!25899 () Bool)

(assert (=> d!8155 (=> (not res!25899) (not e!27746))))

(assert (=> d!8155 (= res!25899 (or (bvsge #b00000000000000000000000000000000 (size!1594 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1594 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))))))

(declare-fun lt!19008 () ListLongMap!1201)

(assert (=> d!8155 (= lt!19019 lt!19008)))

(declare-fun lt!19028 () Unit!1199)

(assert (=> d!8155 (= lt!19028 e!27743)))

(declare-fun c!5655 () Bool)

(assert (=> d!8155 (= c!5655 e!27747)))

(declare-fun res!25905 () Bool)

(assert (=> d!8155 (=> (not res!25905) (not e!27747))))

(assert (=> d!8155 (= res!25905 (bvslt #b00000000000000000000000000000000 (size!1594 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))))

(assert (=> d!8155 (= lt!19008 e!27744)))

(assert (=> d!8155 (= c!5658 (and (not (= (bvand (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8155 (validMask!0 (mask!5431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)))))

(assert (=> d!8155 (= (getCurrentListMap!350 (_keys!3431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (_values!1865 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (mask!5431 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (extraKeys!1773 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) (minValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) lt!19019)))

(declare-fun b!43770 () Bool)

(assert (=> b!43770 (= e!27736 (= (apply!59 lt!19019 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1800 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))))))

(assert (= (and d!8155 c!5658) b!43775))

(assert (= (and d!8155 (not c!5658)) b!43763))

(assert (= (and b!43763 c!5659) b!43762))

(assert (= (and b!43763 (not c!5659)) b!43766))

(assert (= (and b!43766 c!5656) b!43782))

(assert (= (and b!43766 (not c!5656)) b!43772))

(assert (= (or b!43782 b!43772) bm!3515))

(assert (= (or b!43762 bm!3515) bm!3517))

(assert (= (or b!43762 b!43782) bm!3514))

(assert (= (or b!43775 bm!3517) bm!3516))

(assert (= (or b!43775 bm!3514) bm!3512))

(assert (= (and d!8155 res!25905) b!43765))

(assert (= (and d!8155 c!5655) b!43768))

(assert (= (and d!8155 (not c!5655)) b!43781))

(assert (= (and d!8155 res!25899) b!43777))

(assert (= (and b!43777 res!25901) b!43771))

(assert (= (and b!43777 (not res!25904)) b!43779))

(assert (= (and b!43779 res!25903) b!43778))

(assert (= (and b!43777 res!25902) b!43769))

(assert (= (and b!43769 c!5654) b!43764))

(assert (= (and b!43769 (not c!5654)) b!43767))

(assert (= (and b!43764 res!25900) b!43770))

(assert (= (or b!43764 b!43767) bm!3518))

(assert (= (and b!43769 res!25898) b!43776))

(assert (= (and b!43776 c!5657) b!43774))

(assert (= (and b!43776 (not c!5657)) b!43780))

(assert (= (and b!43774 res!25906) b!43773))

(assert (= (or b!43774 b!43780) bm!3513))

(declare-fun b_lambda!2283 () Bool)

(assert (=> (not b_lambda!2283) (not b!43778)))

(declare-fun tb!993 () Bool)

(declare-fun t!4208 () Bool)

(assert (=> (and start!6468 (= defaultEntry!470 (defaultEntry!1882 (LongMapFixedSize!379 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 lt!18374 lt!18378 #b00000000000000000000000000000000))) t!4208) tb!993))

(declare-fun result!1733 () Bool)

(assert (=> tb!993 (= result!1733 tp_is_empty!1893)))

(assert (=> b!43778 t!4208))

(declare-fun b_and!2685 () Bool)

(assert (= b_and!2671 (and (=> t!4208 result!1733) b_and!2685)))

(declare-fun m!37949 () Bool)

(assert (=> b!43773 m!37949))

(declare-fun m!37951 () Bool)

(assert (=> b!43768 m!37951))

(declare-fun m!37953 () Bool)

(assert (=> b!43768 m!37953))

(declare-fun m!37955 () Bool)

(assert (=> b!43768 m!37955))

(declare-fun m!37959 () Bool)

(assert (=> b!43768 m!37959))

(declare-fun m!37963 () Bool)

(assert (=> b!43768 m!37963))

(assert (=> b!43768 m!37951))

(assert (=> b!43768 m!37955))

(declare-fun m!37972 () Bool)

(assert (=> b!43768 m!37972))

(declare-fun m!37975 () Bool)

(assert (=> b!43768 m!37975))

(declare-fun m!37977 () Bool)

(assert (=> b!43768 m!37977))

(declare-fun m!37979 () Bool)

(assert (=> b!43768 m!37979))

(declare-fun m!37981 () Bool)

(assert (=> b!43768 m!37981))

(declare-fun m!37983 () Bool)

(assert (=> b!43768 m!37983))

(declare-fun m!37985 () Bool)

(assert (=> b!43768 m!37985))

(declare-fun m!37987 () Bool)

(assert (=> b!43768 m!37987))

(declare-fun m!37989 () Bool)

(assert (=> b!43768 m!37989))

(declare-fun m!37991 () Bool)

(assert (=> b!43768 m!37991))

(assert (=> b!43768 m!37985))

(declare-fun m!37993 () Bool)

(assert (=> b!43768 m!37993))

(assert (=> b!43768 m!37977))

(declare-fun m!37995 () Bool)

(assert (=> b!43768 m!37995))

(declare-fun m!37997 () Bool)

(assert (=> b!43778 m!37997))

(assert (=> b!43778 m!37995))

(declare-fun m!38001 () Bool)

(assert (=> b!43778 m!38001))

(declare-fun m!38003 () Bool)

(assert (=> b!43778 m!38003))

(assert (=> b!43778 m!37997))

(assert (=> b!43778 m!38003))

(declare-fun m!38005 () Bool)

(assert (=> b!43778 m!38005))

(assert (=> b!43778 m!37995))

(declare-fun m!38009 () Bool)

(assert (=> d!8155 m!38009))

(assert (=> b!43771 m!37995))

(assert (=> b!43771 m!37995))

(declare-fun m!38013 () Bool)

(assert (=> b!43771 m!38013))

(assert (=> bm!3516 m!37991))

(declare-fun m!38015 () Bool)

(assert (=> bm!3513 m!38015))

(declare-fun m!38017 () Bool)

(assert (=> b!43775 m!38017))

(assert (=> b!43765 m!37995))

(assert (=> b!43765 m!37995))

(assert (=> b!43765 m!38013))

(declare-fun m!38019 () Bool)

(assert (=> bm!3518 m!38019))

(assert (=> b!43779 m!37995))

(assert (=> b!43779 m!37995))

(declare-fun m!38021 () Bool)

(assert (=> b!43779 m!38021))

(declare-fun m!38023 () Bool)

(assert (=> bm!3512 m!38023))

(declare-fun m!38025 () Bool)

(assert (=> b!43770 m!38025))

(assert (=> d!7929 d!8155))

(declare-fun d!8177 () Bool)

(declare-fun res!25926 () Bool)

(declare-fun e!27769 () Bool)

(assert (=> d!8177 (=> res!25926 e!27769)))

(assert (=> d!8177 (= res!25926 (and ((_ is Cons!1194) (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))) (= (_1!823 (h!1771 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!823 (head!888 (toList!616 lt!18380))))))))

(assert (=> d!8177 (= (containsKey!73 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)) (_1!823 (head!888 (toList!616 lt!18380)))) e!27769)))

(declare-fun b!43813 () Bool)

(declare-fun e!27770 () Bool)

(assert (=> b!43813 (= e!27769 e!27770)))

(declare-fun res!25927 () Bool)

(assert (=> b!43813 (=> (not res!25927) (not e!27770))))

(assert (=> b!43813 (= res!25927 (and (or (not ((_ is Cons!1194) (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)))) (bvsle (_1!823 (h!1771 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!823 (head!888 (toList!616 lt!18380))))) ((_ is Cons!1194) (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))) (bvslt (_1!823 (h!1771 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470)))) (_1!823 (head!888 (toList!616 lt!18380))))))))

(declare-fun b!43814 () Bool)

(assert (=> b!43814 (= e!27770 (containsKey!73 (t!4197 (toList!616 (getCurrentListMap!350 lt!18374 lt!18378 mask!853 #b00000000000000000000000000000000 lt!18377 lt!18377 #b00000000000000000000000000000000 defaultEntry!470))) (_1!823 (head!888 (toList!616 lt!18380)))))))

(assert (= (and d!8177 (not res!25926)) b!43813))

(assert (= (and b!43813 res!25927) b!43814))

(declare-fun m!38051 () Bool)

(assert (=> b!43814 m!38051))

(assert (=> d!7891 d!8177))

(assert (=> d!7895 d!7881))

(declare-fun b!43815 () Bool)

(declare-fun e!27772 () (_ BitVec 32))

(declare-fun e!27771 () (_ BitVec 32))

(assert (=> b!43815 (= e!27772 e!27771)))

(declare-fun c!5668 () Bool)

(assert (=> b!43815 (= c!5668 (validKeyInArray!0 (select (arr!1409 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!43816 () Bool)

(declare-fun call!3523 () (_ BitVec 32))

(assert (=> b!43816 (= e!27771 (bvadd #b00000000000000000000000000000001 call!3523))))

(declare-fun b!43817 () Bool)

(assert (=> b!43817 (= e!27771 call!3523)))

(declare-fun d!8185 () Bool)

(declare-fun lt!19049 () (_ BitVec 32))

(assert (=> d!8185 (and (bvsge lt!19049 #b00000000000000000000000000000000) (bvsle lt!19049 (bvsub (size!1594 lt!18374) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8185 (= lt!19049 e!27772)))

(declare-fun c!5667 () Bool)

(assert (=> d!8185 (= c!5667 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8185 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1594 lt!18374)))))

(assert (=> d!8185 (= (arrayCountValidKeys!0 lt!18374 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19049)))

(declare-fun b!43818 () Bool)

(assert (=> b!43818 (= e!27772 #b00000000000000000000000000000000)))

(declare-fun bm!3520 () Bool)

(assert (=> bm!3520 (= call!3523 (arrayCountValidKeys!0 lt!18374 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!8185 c!5667) b!43818))

(assert (= (and d!8185 (not c!5667)) b!43815))

(assert (= (and b!43815 c!5668) b!43816))

(assert (= (and b!43815 (not c!5668)) b!43817))

(assert (= (or b!43816 b!43817) bm!3520))

(assert (=> b!43815 m!37731))

(assert (=> b!43815 m!37731))

(assert (=> b!43815 m!37739))

(declare-fun m!38053 () Bool)

(assert (=> bm!3520 m!38053))

(assert (=> bm!3452 d!8185))

(declare-fun d!8187 () Bool)

(assert (=> d!8187 (= (apply!59 lt!18581 #b1000000000000000000000000000000000000000000000000000000000000000) (get!789 (getValueByKey!104 (toList!616 lt!18581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1984 () Bool)

(assert (= bs!1984 d!8187))

(assert (=> bs!1984 m!37233))

(assert (=> bs!1984 m!37233))

(declare-fun m!38055 () Bool)

(assert (=> bs!1984 m!38055))

(assert (=> b!43204 d!8187))

(declare-fun b_lambda!2289 () Bool)

(assert (= b_lambda!2267 (or (and start!6468 b_free!1503) b_lambda!2289)))

(declare-fun b_lambda!2291 () Bool)

(assert (= b_lambda!2269 (or (and start!6468 b_free!1503) b_lambda!2291)))

(check-sat (not b!43400) (not b!43476) (not b!43560) (not b!43558) (not b!43676) (not d!8187) (not b!43482) (not b!43754) (not bm!3485) (not b!43587) (not b!43714) (not b!43481) (not b!43778) (not d!8117) (not d!8041) (not b!43508) (not b!43483) (not d!7981) (not d!8031) (not d!8025) (not b!43401) (not d!8137) (not b!43702) (not d!7967) (not d!8023) (not b!43669) (not b!43368) (not b!43677) (not b!43815) (not bm!3516) (not b!43684) (not b!43773) (not d!8147) (not d!7959) (not d!8019) (not b!43479) (not b!43551) (not d!8029) (not b!43550) (not b!43715) (not b!43549) (not b!43403) (not d!7963) (not d!7957) (not b!43771) (not d!8043) (not b!43670) (not d!8021) (not b!43663) (not d!8047) (not d!8145) (not b_lambda!2249) (not b!43372) (not b!43680) (not d!8155) (not d!8035) (not d!8057) (not d!8017) (not b!43480) (not bm!3502) (not d!7983) tp_is_empty!1893 (not b!43478) (not d!8037) (not b!43753) (not d!7985) (not b_lambda!2289) (not b!43768) (not d!8015) (not b!43814) (not b!43355) (not b!43775) (not bm!3512) (not b!43474) (not bm!3520) (not d!8033) (not b!43682) (not b!43510) (not b!43770) (not b!43398) (not b_lambda!2259) (not b!43402) (not bm!3518) (not d!8127) (not b_next!1503) (not d!7965) (not b!43357) (not b_lambda!2283) (not b!43369) (not d!8112) (not b_lambda!2291) (not d!7979) (not b!43765) b_and!2685 (not bm!3503) (not b!43779) (not b!43552) (not d!8139) (not bm!3513))
(check-sat b_and!2685 (not b_next!1503))
