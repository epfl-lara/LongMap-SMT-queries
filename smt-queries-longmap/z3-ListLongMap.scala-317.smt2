; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5686 () Bool)

(assert start!5686)

(declare-fun b_free!1363 () Bool)

(declare-fun b_next!1363 () Bool)

(assert (=> start!5686 (= b_free!1363 (not b_next!1363))))

(declare-fun tp!5732 () Bool)

(declare-fun b_and!2359 () Bool)

(assert (=> start!5686 (= tp!5732 b_and!2359)))

(declare-fun res!24006 () Bool)

(declare-fun e!25475 () Bool)

(assert (=> start!5686 (=> (not res!24006) (not e!25475))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5686 (= res!24006 (validMask!0 mask!853))))

(assert (=> start!5686 e!25475))

(assert (=> start!5686 true))

(assert (=> start!5686 tp!5732))

(declare-fun b!40161 () Bool)

(declare-fun e!25474 () Bool)

(assert (=> b!40161 (= e!25475 (not e!25474))))

(declare-fun res!24007 () Bool)

(assert (=> b!40161 (=> res!24007 e!25474)))

(declare-datatypes ((V!2097 0))(
  ( (V!2098 (val!915 Int)) )
))
(declare-datatypes ((tuple2!1488 0))(
  ( (tuple2!1489 (_1!755 (_ BitVec 64)) (_2!755 V!2097)) )
))
(declare-datatypes ((List!1045 0))(
  ( (Nil!1042) (Cons!1041 (h!1615 tuple2!1488) (t!3897 List!1045)) )
))
(declare-datatypes ((ListLongMap!1053 0))(
  ( (ListLongMap!1054 (toList!542 List!1045)) )
))
(declare-fun lt!15426 () ListLongMap!1053)

(assert (=> b!40161 (= res!24007 (= lt!15426 (ListLongMap!1054 Nil!1042)))))

(declare-datatypes ((array!2565 0))(
  ( (array!2566 (arr!1226 (Array (_ BitVec 32) (_ BitVec 64))) (size!1363 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!629 0))(
  ( (ValueCellFull!629 (v!1991 V!2097)) (EmptyCell!629) )
))
(declare-datatypes ((array!2567 0))(
  ( (array!2568 (arr!1227 (Array (_ BitVec 32) ValueCell!629)) (size!1364 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!238 0))(
  ( (LongMapFixedSize!239 (defaultEntry!1803 Int) (mask!5175 (_ BitVec 32)) (extraKeys!1694 (_ BitVec 32)) (zeroValue!1721 V!2097) (minValue!1721 V!2097) (_size!168 (_ BitVec 32)) (_keys!3291 array!2565) (_values!1786 array!2567) (_vacant!168 (_ BitVec 32))) )
))
(declare-fun lt!15428 () LongMapFixedSize!238)

(declare-fun map!690 (LongMapFixedSize!238) ListLongMap!1053)

(assert (=> b!40161 (= lt!15426 (map!690 lt!15428))))

(declare-fun lt!15423 () array!2565)

(declare-datatypes ((List!1046 0))(
  ( (Nil!1043) (Cons!1042 (h!1616 (_ BitVec 64)) (t!3898 List!1046)) )
))
(declare-fun arrayNoDuplicates!0 (array!2565 (_ BitVec 32) List!1046) Bool)

(assert (=> b!40161 (arrayNoDuplicates!0 lt!15423 #b00000000000000000000000000000000 Nil!1043)))

(declare-datatypes ((Unit!986 0))(
  ( (Unit!987) )
))
(declare-fun lt!15425 () Unit!986)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2565 (_ BitVec 32) (_ BitVec 32) List!1046) Unit!986)

(assert (=> b!40161 (= lt!15425 (lemmaArrayNoDuplicatesInAll0Array!0 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2565 (_ BitVec 32)) Bool)

(assert (=> b!40161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15423 mask!853)))

(declare-fun lt!15422 () Unit!986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!986)

(assert (=> b!40161 (= lt!15422 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15423 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40161 (= (arrayCountValidKeys!0 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15424 () Unit!986)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!986)

(assert (=> b!40161 (= lt!15424 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun lt!15427 () V!2097)

(declare-fun defaultEntry!470 () Int)

(assert (=> b!40161 (= lt!15428 (LongMapFixedSize!239 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!15427 lt!15427 #b00000000000000000000000000000000 lt!15423 (array!2568 ((as const (Array (_ BitVec 32) ValueCell!629)) EmptyCell!629) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!40161 (= lt!15423 (array!2566 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!189 (Int (_ BitVec 64)) V!2097)

(assert (=> b!40161 (= lt!15427 (dynLambda!189 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40162 () Bool)

(declare-fun res!24005 () Bool)

(assert (=> b!40162 (=> res!24005 e!25474)))

(declare-fun isEmpty!232 (List!1045) Bool)

(assert (=> b!40162 (= res!24005 (isEmpty!232 (toList!542 lt!15426)))))

(declare-fun b!40163 () Bool)

(declare-fun valid!128 (LongMapFixedSize!238) Bool)

(assert (=> b!40163 (= e!25474 (valid!128 lt!15428))))

(assert (= (and start!5686 res!24006) b!40161))

(assert (= (and b!40161 (not res!24007)) b!40162))

(assert (= (and b!40162 (not res!24005)) b!40163))

(declare-fun b_lambda!2061 () Bool)

(assert (=> (not b_lambda!2061) (not b!40161)))

(declare-fun t!3896 () Bool)

(declare-fun tb!839 () Bool)

(assert (=> (and start!5686 (= defaultEntry!470 defaultEntry!470) t!3896) tb!839))

(declare-fun result!1435 () Bool)

(declare-fun tp_is_empty!1753 () Bool)

(assert (=> tb!839 (= result!1435 tp_is_empty!1753)))

(assert (=> b!40161 t!3896))

(declare-fun b_and!2361 () Bool)

(assert (= b_and!2359 (and (=> t!3896 result!1435) b_and!2361)))

(declare-fun m!33083 () Bool)

(assert (=> start!5686 m!33083))

(declare-fun m!33085 () Bool)

(assert (=> b!40161 m!33085))

(declare-fun m!33087 () Bool)

(assert (=> b!40161 m!33087))

(declare-fun m!33089 () Bool)

(assert (=> b!40161 m!33089))

(declare-fun m!33091 () Bool)

(assert (=> b!40161 m!33091))

(declare-fun m!33093 () Bool)

(assert (=> b!40161 m!33093))

(declare-fun m!33095 () Bool)

(assert (=> b!40161 m!33095))

(declare-fun m!33097 () Bool)

(assert (=> b!40161 m!33097))

(declare-fun m!33099 () Bool)

(assert (=> b!40161 m!33099))

(declare-fun m!33101 () Bool)

(assert (=> b!40162 m!33101))

(declare-fun m!33103 () Bool)

(assert (=> b!40163 m!33103))

(check-sat tp_is_empty!1753 (not b!40162) (not start!5686) (not b!40163) (not b!40161) (not b_lambda!2061) (not b_next!1363) b_and!2361)
(check-sat b_and!2361 (not b_next!1363))
(get-model)

(declare-fun b_lambda!2071 () Bool)

(assert (= b_lambda!2061 (or (and start!5686 b_free!1363) b_lambda!2071)))

(check-sat tp_is_empty!1753 (not b!40162) (not start!5686) (not b!40163) (not b_lambda!2071) (not b!40161) (not b_next!1363) b_and!2361)
(check-sat b_and!2361 (not b_next!1363))
(get-model)

(declare-fun d!6939 () Bool)

(get-info :version)

(assert (=> d!6939 (= (isEmpty!232 (toList!542 lt!15426)) ((_ is Nil!1042) (toList!542 lt!15426)))))

(assert (=> b!40162 d!6939))

(declare-fun d!6941 () Bool)

(assert (=> d!6941 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5686 d!6941))

(declare-fun d!6949 () Bool)

(assert (=> d!6949 (= (arrayCountValidKeys!0 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15473 () Unit!986)

(declare-fun choose!59 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!986)

(assert (=> d!6949 (= lt!15473 (choose!59 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6949 (bvslt (size!1363 lt!15423) #b01111111111111111111111111111111)))

(assert (=> d!6949 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15473)))

(declare-fun bs!1690 () Bool)

(assert (= bs!1690 d!6949))

(assert (=> bs!1690 m!33089))

(declare-fun m!33157 () Bool)

(assert (=> bs!1690 m!33157))

(assert (=> b!40161 d!6949))

(declare-fun d!6953 () Bool)

(assert (=> d!6953 (arrayNoDuplicates!0 lt!15423 #b00000000000000000000000000000000 Nil!1043)))

(declare-fun lt!15478 () Unit!986)

(declare-fun choose!111 (array!2565 (_ BitVec 32) (_ BitVec 32) List!1046) Unit!986)

(assert (=> d!6953 (= lt!15478 (choose!111 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1043))))

(assert (=> d!6953 (= (size!1363 lt!15423) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6953 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1043) lt!15478)))

(declare-fun bs!1691 () Bool)

(assert (= bs!1691 d!6953))

(assert (=> bs!1691 m!33097))

(declare-fun m!33159 () Bool)

(assert (=> bs!1691 m!33159))

(assert (=> b!40161 d!6953))

(declare-fun b!40225 () Bool)

(declare-fun e!25506 () (_ BitVec 32))

(declare-fun call!3103 () (_ BitVec 32))

(assert (=> b!40225 (= e!25506 call!3103)))

(declare-fun b!40226 () Bool)

(declare-fun e!25505 () (_ BitVec 32))

(assert (=> b!40226 (= e!25505 e!25506)))

(declare-fun c!4883 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!40226 (= c!4883 (validKeyInArray!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(declare-fun b!40227 () Bool)

(assert (=> b!40227 (= e!25505 #b00000000000000000000000000000000)))

(declare-fun bm!3100 () Bool)

(assert (=> bm!3100 (= call!3103 (arrayCountValidKeys!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!40228 () Bool)

(assert (=> b!40228 (= e!25506 (bvadd #b00000000000000000000000000000001 call!3103))))

(declare-fun d!6955 () Bool)

(declare-fun lt!15487 () (_ BitVec 32))

(assert (=> d!6955 (and (bvsge lt!15487 #b00000000000000000000000000000000) (bvsle lt!15487 (bvsub (size!1363 lt!15423) #b00000000000000000000000000000000)))))

(assert (=> d!6955 (= lt!15487 e!25505)))

(declare-fun c!4884 () Bool)

(assert (=> d!6955 (= c!4884 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6955 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1363 lt!15423)))))

(assert (=> d!6955 (= (arrayCountValidKeys!0 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15487)))

(assert (= (and d!6955 c!4884) b!40227))

(assert (= (and d!6955 (not c!4884)) b!40226))

(assert (= (and b!40226 c!4883) b!40228))

(assert (= (and b!40226 (not c!4883)) b!40225))

(assert (= (or b!40228 b!40225) bm!3100))

(declare-fun m!33169 () Bool)

(assert (=> b!40226 m!33169))

(assert (=> b!40226 m!33169))

(declare-fun m!33171 () Bool)

(assert (=> b!40226 m!33171))

(declare-fun m!33173 () Bool)

(assert (=> bm!3100 m!33173))

(assert (=> b!40161 d!6955))

(declare-fun d!6961 () Bool)

(declare-fun getCurrentListMap!301 (array!2565 array!2567 (_ BitVec 32) (_ BitVec 32) V!2097 V!2097 (_ BitVec 32) Int) ListLongMap!1053)

(assert (=> d!6961 (= (map!690 lt!15428) (getCurrentListMap!301 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15428)))))

(declare-fun bs!1693 () Bool)

(assert (= bs!1693 d!6961))

(declare-fun m!33189 () Bool)

(assert (=> bs!1693 m!33189))

(assert (=> b!40161 d!6961))

(declare-fun b!40265 () Bool)

(declare-fun e!25534 () Bool)

(declare-fun contains!509 (List!1046 (_ BitVec 64)) Bool)

(assert (=> b!40265 (= e!25534 (contains!509 Nil!1043 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(declare-fun b!40266 () Bool)

(declare-fun e!25537 () Bool)

(declare-fun e!25536 () Bool)

(assert (=> b!40266 (= e!25537 e!25536)))

(declare-fun c!4894 () Bool)

(assert (=> b!40266 (= c!4894 (validKeyInArray!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(declare-fun b!40267 () Bool)

(declare-fun call!3112 () Bool)

(assert (=> b!40267 (= e!25536 call!3112)))

(declare-fun b!40268 () Bool)

(declare-fun e!25535 () Bool)

(assert (=> b!40268 (= e!25535 e!25537)))

(declare-fun res!24055 () Bool)

(assert (=> b!40268 (=> (not res!24055) (not e!25537))))

(assert (=> b!40268 (= res!24055 (not e!25534))))

(declare-fun res!24053 () Bool)

(assert (=> b!40268 (=> (not res!24053) (not e!25534))))

(assert (=> b!40268 (= res!24053 (validKeyInArray!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(declare-fun bm!3109 () Bool)

(assert (=> bm!3109 (= call!3112 (arrayNoDuplicates!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)))))

(declare-fun b!40269 () Bool)

(assert (=> b!40269 (= e!25536 call!3112)))

(declare-fun d!6967 () Bool)

(declare-fun res!24054 () Bool)

(assert (=> d!6967 (=> res!24054 e!25535)))

(assert (=> d!6967 (= res!24054 (bvsge #b00000000000000000000000000000000 (size!1363 lt!15423)))))

(assert (=> d!6967 (= (arrayNoDuplicates!0 lt!15423 #b00000000000000000000000000000000 Nil!1043) e!25535)))

(assert (= (and d!6967 (not res!24054)) b!40268))

(assert (= (and b!40268 res!24053) b!40265))

(assert (= (and b!40268 res!24055) b!40266))

(assert (= (and b!40266 c!4894) b!40267))

(assert (= (and b!40266 (not c!4894)) b!40269))

(assert (= (or b!40267 b!40269) bm!3109))

(assert (=> b!40265 m!33169))

(assert (=> b!40265 m!33169))

(declare-fun m!33195 () Bool)

(assert (=> b!40265 m!33195))

(assert (=> b!40266 m!33169))

(assert (=> b!40266 m!33169))

(assert (=> b!40266 m!33171))

(assert (=> b!40268 m!33169))

(assert (=> b!40268 m!33169))

(assert (=> b!40268 m!33171))

(assert (=> bm!3109 m!33169))

(declare-fun m!33197 () Bool)

(assert (=> bm!3109 m!33197))

(assert (=> b!40161 d!6967))

(declare-fun d!6973 () Bool)

(assert (=> d!6973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15423 mask!853)))

(declare-fun lt!15503 () Unit!986)

(declare-fun choose!34 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!986)

(assert (=> d!6973 (= lt!15503 (choose!34 lt!15423 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6973 (validMask!0 mask!853)))

(assert (=> d!6973 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15423 mask!853 #b00000000000000000000000000000000) lt!15503)))

(declare-fun bs!1697 () Bool)

(assert (= bs!1697 d!6973))

(assert (=> bs!1697 m!33095))

(declare-fun m!33205 () Bool)

(assert (=> bs!1697 m!33205))

(assert (=> bs!1697 m!33083))

(assert (=> b!40161 d!6973))

(declare-fun b!40310 () Bool)

(declare-fun e!25569 () Bool)

(declare-fun e!25570 () Bool)

(assert (=> b!40310 (= e!25569 e!25570)))

(declare-fun lt!15525 () (_ BitVec 64))

(assert (=> b!40310 (= lt!15525 (select (arr!1226 lt!15423) #b00000000000000000000000000000000))))

(declare-fun lt!15526 () Unit!986)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2565 (_ BitVec 64) (_ BitVec 32)) Unit!986)

(assert (=> b!40310 (= lt!15526 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15423 lt!15525 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!40310 (arrayContainsKey!0 lt!15423 lt!15525 #b00000000000000000000000000000000)))

(declare-fun lt!15527 () Unit!986)

(assert (=> b!40310 (= lt!15527 lt!15526)))

(declare-fun res!24079 () Bool)

(declare-datatypes ((SeekEntryResult!179 0))(
  ( (MissingZero!179 (index!2838 (_ BitVec 32))) (Found!179 (index!2839 (_ BitVec 32))) (Intermediate!179 (undefined!991 Bool) (index!2840 (_ BitVec 32)) (x!7725 (_ BitVec 32))) (Undefined!179) (MissingVacant!179 (index!2841 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2565 (_ BitVec 32)) SeekEntryResult!179)

(assert (=> b!40310 (= res!24079 (= (seekEntryOrOpen!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15423 mask!853) (Found!179 #b00000000000000000000000000000000)))))

(assert (=> b!40310 (=> (not res!24079) (not e!25570))))

(declare-fun b!40311 () Bool)

(declare-fun call!3122 () Bool)

(assert (=> b!40311 (= e!25569 call!3122)))

(declare-fun b!40312 () Bool)

(declare-fun e!25571 () Bool)

(assert (=> b!40312 (= e!25571 e!25569)))

(declare-fun c!4904 () Bool)

(assert (=> b!40312 (= c!4904 (validKeyInArray!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(declare-fun d!6979 () Bool)

(declare-fun res!24078 () Bool)

(assert (=> d!6979 (=> res!24078 e!25571)))

(assert (=> d!6979 (= res!24078 (bvsge #b00000000000000000000000000000000 (size!1363 lt!15423)))))

(assert (=> d!6979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15423 mask!853) e!25571)))

(declare-fun b!40313 () Bool)

(assert (=> b!40313 (= e!25570 call!3122)))

(declare-fun bm!3119 () Bool)

(assert (=> bm!3119 (= call!3122 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15423 mask!853))))

(assert (= (and d!6979 (not res!24078)) b!40312))

(assert (= (and b!40312 c!4904) b!40310))

(assert (= (and b!40312 (not c!4904)) b!40311))

(assert (= (and b!40310 res!24079) b!40313))

(assert (= (or b!40313 b!40311) bm!3119))

(assert (=> b!40310 m!33169))

(declare-fun m!33223 () Bool)

(assert (=> b!40310 m!33223))

(declare-fun m!33225 () Bool)

(assert (=> b!40310 m!33225))

(assert (=> b!40310 m!33169))

(declare-fun m!33227 () Bool)

(assert (=> b!40310 m!33227))

(assert (=> b!40312 m!33169))

(assert (=> b!40312 m!33169))

(assert (=> b!40312 m!33171))

(declare-fun m!33229 () Bool)

(assert (=> bm!3119 m!33229))

(assert (=> b!40161 d!6979))

(declare-fun d!6989 () Bool)

(declare-fun res!24092 () Bool)

(declare-fun e!25576 () Bool)

(assert (=> d!6989 (=> (not res!24092) (not e!25576))))

(declare-fun simpleValid!28 (LongMapFixedSize!238) Bool)

(assert (=> d!6989 (= res!24092 (simpleValid!28 lt!15428))))

(assert (=> d!6989 (= (valid!128 lt!15428) e!25576)))

(declare-fun b!40326 () Bool)

(declare-fun res!24093 () Bool)

(assert (=> b!40326 (=> (not res!24093) (not e!25576))))

(assert (=> b!40326 (= res!24093 (= (arrayCountValidKeys!0 (_keys!3291 lt!15428) #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))) (_size!168 lt!15428)))))

(declare-fun b!40327 () Bool)

(declare-fun res!24094 () Bool)

(assert (=> b!40327 (=> (not res!24094) (not e!25576))))

(assert (=> b!40327 (= res!24094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3291 lt!15428) (mask!5175 lt!15428)))))

(declare-fun b!40328 () Bool)

(assert (=> b!40328 (= e!25576 (arrayNoDuplicates!0 (_keys!3291 lt!15428) #b00000000000000000000000000000000 Nil!1043))))

(assert (= (and d!6989 res!24092) b!40326))

(assert (= (and b!40326 res!24093) b!40327))

(assert (= (and b!40327 res!24094) b!40328))

(declare-fun m!33237 () Bool)

(assert (=> d!6989 m!33237))

(declare-fun m!33241 () Bool)

(assert (=> b!40326 m!33241))

(declare-fun m!33245 () Bool)

(assert (=> b!40327 m!33245))

(declare-fun m!33249 () Bool)

(assert (=> b!40328 m!33249))

(assert (=> b!40163 d!6989))

(check-sat (not d!6989) tp_is_empty!1753 (not b!40266) (not b!40328) (not b!40265) (not b_lambda!2071) (not d!6973) (not d!6949) (not b!40310) (not d!6961) (not b!40268) (not d!6953) (not b!40326) (not b!40327) (not bm!3100) (not b!40312) (not b!40226) (not b_next!1363) b_and!2361 (not bm!3119) (not bm!3109))
(check-sat b_and!2361 (not b_next!1363))
(get-model)

(declare-fun d!6995 () Bool)

(assert (=> d!6995 (= (validKeyInArray!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)) (and (not (= (select (arr!1226 lt!15423) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1226 lt!15423) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40268 d!6995))

(declare-fun d!6997 () Bool)

(declare-fun res!24126 () Bool)

(declare-fun e!25590 () Bool)

(assert (=> d!6997 (=> (not res!24126) (not e!25590))))

(assert (=> d!6997 (= res!24126 (validMask!0 (mask!5175 lt!15428)))))

(assert (=> d!6997 (= (simpleValid!28 lt!15428) e!25590)))

(declare-fun b!40363 () Bool)

(declare-fun res!24124 () Bool)

(assert (=> b!40363 (=> (not res!24124) (not e!25590))))

(declare-fun size!1382 (LongMapFixedSize!238) (_ BitVec 32))

(assert (=> b!40363 (= res!24124 (= (size!1382 lt!15428) (bvadd (_size!168 lt!15428) (bvsdiv (bvadd (extraKeys!1694 lt!15428) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!40361 () Bool)

(declare-fun res!24125 () Bool)

(assert (=> b!40361 (=> (not res!24125) (not e!25590))))

(assert (=> b!40361 (= res!24125 (and (= (size!1364 (_values!1786 lt!15428)) (bvadd (mask!5175 lt!15428) #b00000000000000000000000000000001)) (= (size!1363 (_keys!3291 lt!15428)) (size!1364 (_values!1786 lt!15428))) (bvsge (_size!168 lt!15428) #b00000000000000000000000000000000) (bvsle (_size!168 lt!15428) (bvadd (mask!5175 lt!15428) #b00000000000000000000000000000001))))))

(declare-fun b!40362 () Bool)

(declare-fun res!24123 () Bool)

(assert (=> b!40362 (=> (not res!24123) (not e!25590))))

(assert (=> b!40362 (= res!24123 (bvsge (size!1382 lt!15428) (_size!168 lt!15428)))))

(declare-fun b!40364 () Bool)

(assert (=> b!40364 (= e!25590 (and (bvsge (extraKeys!1694 lt!15428) #b00000000000000000000000000000000) (bvsle (extraKeys!1694 lt!15428) #b00000000000000000000000000000011) (bvsge (_vacant!168 lt!15428) #b00000000000000000000000000000000)))))

(assert (= (and d!6997 res!24126) b!40361))

(assert (= (and b!40361 res!24125) b!40362))

(assert (= (and b!40362 res!24123) b!40363))

(assert (= (and b!40363 res!24124) b!40364))

(declare-fun m!33271 () Bool)

(assert (=> d!6997 m!33271))

(declare-fun m!33273 () Bool)

(assert (=> b!40363 m!33273))

(assert (=> b!40362 m!33273))

(assert (=> d!6989 d!6997))

(declare-fun b!40365 () Bool)

(declare-fun e!25591 () Bool)

(assert (=> b!40365 (= e!25591 (contains!509 (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40366 () Bool)

(declare-fun e!25594 () Bool)

(declare-fun e!25593 () Bool)

(assert (=> b!40366 (= e!25594 e!25593)))

(declare-fun c!4907 () Bool)

(assert (=> b!40366 (= c!4907 (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40367 () Bool)

(declare-fun call!3125 () Bool)

(assert (=> b!40367 (= e!25593 call!3125)))

(declare-fun b!40368 () Bool)

(declare-fun e!25592 () Bool)

(assert (=> b!40368 (= e!25592 e!25594)))

(declare-fun res!24129 () Bool)

(assert (=> b!40368 (=> (not res!24129) (not e!25594))))

(assert (=> b!40368 (= res!24129 (not e!25591))))

(declare-fun res!24127 () Bool)

(assert (=> b!40368 (=> (not res!24127) (not e!25591))))

(assert (=> b!40368 (= res!24127 (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3122 () Bool)

(assert (=> bm!3122 (= call!3125 (arrayNoDuplicates!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4907 (Cons!1042 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043))))))

(declare-fun b!40369 () Bool)

(assert (=> b!40369 (= e!25593 call!3125)))

(declare-fun d!7011 () Bool)

(declare-fun res!24128 () Bool)

(assert (=> d!7011 (=> res!24128 e!25592)))

(assert (=> d!7011 (= res!24128 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 lt!15423)))))

(assert (=> d!7011 (= (arrayNoDuplicates!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) e!25592)))

(assert (= (and d!7011 (not res!24128)) b!40368))

(assert (= (and b!40368 res!24127) b!40365))

(assert (= (and b!40368 res!24129) b!40366))

(assert (= (and b!40366 c!4907) b!40367))

(assert (= (and b!40366 (not c!4907)) b!40369))

(assert (= (or b!40367 b!40369) bm!3122))

(declare-fun m!33275 () Bool)

(assert (=> b!40365 m!33275))

(assert (=> b!40365 m!33275))

(declare-fun m!33277 () Bool)

(assert (=> b!40365 m!33277))

(assert (=> b!40366 m!33275))

(assert (=> b!40366 m!33275))

(declare-fun m!33279 () Bool)

(assert (=> b!40366 m!33279))

(assert (=> b!40368 m!33275))

(assert (=> b!40368 m!33275))

(assert (=> b!40368 m!33279))

(assert (=> bm!3122 m!33275))

(declare-fun m!33283 () Bool)

(assert (=> bm!3122 m!33283))

(assert (=> bm!3109 d!7011))

(assert (=> b!40312 d!6995))

(assert (=> b!40266 d!6995))

(declare-fun d!7017 () Bool)

(assert (=> d!7017 (arrayContainsKey!0 lt!15423 lt!15525 #b00000000000000000000000000000000)))

(declare-fun lt!15545 () Unit!986)

(declare-fun choose!13 (array!2565 (_ BitVec 64) (_ BitVec 32)) Unit!986)

(assert (=> d!7017 (= lt!15545 (choose!13 lt!15423 lt!15525 #b00000000000000000000000000000000))))

(assert (=> d!7017 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7017 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15423 lt!15525 #b00000000000000000000000000000000) lt!15545)))

(declare-fun bs!1705 () Bool)

(assert (= bs!1705 d!7017))

(assert (=> bs!1705 m!33225))

(declare-fun m!33287 () Bool)

(assert (=> bs!1705 m!33287))

(assert (=> b!40310 d!7017))

(declare-fun d!7021 () Bool)

(declare-fun res!24149 () Bool)

(declare-fun e!25611 () Bool)

(assert (=> d!7021 (=> res!24149 e!25611)))

(assert (=> d!7021 (= res!24149 (= (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15525))))

(assert (=> d!7021 (= (arrayContainsKey!0 lt!15423 lt!15525 #b00000000000000000000000000000000) e!25611)))

(declare-fun b!40386 () Bool)

(declare-fun e!25612 () Bool)

(assert (=> b!40386 (= e!25611 e!25612)))

(declare-fun res!24150 () Bool)

(assert (=> b!40386 (=> (not res!24150) (not e!25612))))

(assert (=> b!40386 (= res!24150 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 lt!15423)))))

(declare-fun b!40387 () Bool)

(assert (=> b!40387 (= e!25612 (arrayContainsKey!0 lt!15423 lt!15525 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7021 (not res!24149)) b!40386))

(assert (= (and b!40386 res!24150) b!40387))

(assert (=> d!7021 m!33169))

(declare-fun m!33293 () Bool)

(assert (=> b!40387 m!33293))

(assert (=> b!40310 d!7021))

(declare-fun b!40434 () Bool)

(declare-fun e!25636 () SeekEntryResult!179)

(declare-fun lt!15569 () SeekEntryResult!179)

(assert (=> b!40434 (= e!25636 (MissingZero!179 (index!2840 lt!15569)))))

(declare-fun b!40435 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2565 (_ BitVec 32)) SeekEntryResult!179)

(assert (=> b!40435 (= e!25636 (seekKeyOrZeroReturnVacant!0 (x!7725 lt!15569) (index!2840 lt!15569) (index!2840 lt!15569) (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15423 mask!853))))

(declare-fun d!7027 () Bool)

(declare-fun lt!15568 () SeekEntryResult!179)

(assert (=> d!7027 (and (or ((_ is Undefined!179) lt!15568) (not ((_ is Found!179) lt!15568)) (and (bvsge (index!2839 lt!15568) #b00000000000000000000000000000000) (bvslt (index!2839 lt!15568) (size!1363 lt!15423)))) (or ((_ is Undefined!179) lt!15568) ((_ is Found!179) lt!15568) (not ((_ is MissingZero!179) lt!15568)) (and (bvsge (index!2838 lt!15568) #b00000000000000000000000000000000) (bvslt (index!2838 lt!15568) (size!1363 lt!15423)))) (or ((_ is Undefined!179) lt!15568) ((_ is Found!179) lt!15568) ((_ is MissingZero!179) lt!15568) (not ((_ is MissingVacant!179) lt!15568)) (and (bvsge (index!2841 lt!15568) #b00000000000000000000000000000000) (bvslt (index!2841 lt!15568) (size!1363 lt!15423)))) (or ((_ is Undefined!179) lt!15568) (ite ((_ is Found!179) lt!15568) (= (select (arr!1226 lt!15423) (index!2839 lt!15568)) (select (arr!1226 lt!15423) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!179) lt!15568) (= (select (arr!1226 lt!15423) (index!2838 lt!15568)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!179) lt!15568) (= (select (arr!1226 lt!15423) (index!2841 lt!15568)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25638 () SeekEntryResult!179)

(assert (=> d!7027 (= lt!15568 e!25638)))

(declare-fun c!4932 () Bool)

(assert (=> d!7027 (= c!4932 (and ((_ is Intermediate!179) lt!15569) (undefined!991 lt!15569)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2565 (_ BitVec 32)) SeekEntryResult!179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!7027 (= lt!15569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) mask!853) (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15423 mask!853))))

(assert (=> d!7027 (validMask!0 mask!853)))

(assert (=> d!7027 (= (seekEntryOrOpen!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15423 mask!853) lt!15568)))

(declare-fun b!40436 () Bool)

(declare-fun c!4933 () Bool)

(declare-fun lt!15570 () (_ BitVec 64))

(assert (=> b!40436 (= c!4933 (= lt!15570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25637 () SeekEntryResult!179)

(assert (=> b!40436 (= e!25637 e!25636)))

(declare-fun b!40437 () Bool)

(assert (=> b!40437 (= e!25638 Undefined!179)))

(declare-fun b!40438 () Bool)

(assert (=> b!40438 (= e!25637 (Found!179 (index!2840 lt!15569)))))

(declare-fun b!40439 () Bool)

(assert (=> b!40439 (= e!25638 e!25637)))

(assert (=> b!40439 (= lt!15570 (select (arr!1226 lt!15423) (index!2840 lt!15569)))))

(declare-fun c!4931 () Bool)

(assert (=> b!40439 (= c!4931 (= lt!15570 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(assert (= (and d!7027 c!4932) b!40437))

(assert (= (and d!7027 (not c!4932)) b!40439))

(assert (= (and b!40439 c!4931) b!40438))

(assert (= (and b!40439 (not c!4931)) b!40436))

(assert (= (and b!40436 c!4933) b!40434))

(assert (= (and b!40436 (not c!4933)) b!40435))

(assert (=> b!40435 m!33169))

(declare-fun m!33317 () Bool)

(assert (=> b!40435 m!33317))

(assert (=> d!7027 m!33169))

(declare-fun m!33321 () Bool)

(assert (=> d!7027 m!33321))

(assert (=> d!7027 m!33083))

(assert (=> d!7027 m!33321))

(assert (=> d!7027 m!33169))

(declare-fun m!33329 () Bool)

(assert (=> d!7027 m!33329))

(declare-fun m!33331 () Bool)

(assert (=> d!7027 m!33331))

(declare-fun m!33335 () Bool)

(assert (=> d!7027 m!33335))

(declare-fun m!33337 () Bool)

(assert (=> d!7027 m!33337))

(declare-fun m!33341 () Bool)

(assert (=> b!40439 m!33341))

(assert (=> b!40310 d!7027))

(assert (=> d!6953 d!6967))

(declare-fun d!7035 () Bool)

(assert (=> d!7035 (arrayNoDuplicates!0 lt!15423 #b00000000000000000000000000000000 Nil!1043)))

(assert (=> d!7035 true))

(declare-fun res!24157 () Unit!986)

(assert (=> d!7035 (= (choose!111 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1043) res!24157)))

(declare-fun bs!1706 () Bool)

(assert (= bs!1706 d!7035))

(assert (=> bs!1706 m!33097))

(assert (=> d!6953 d!7035))

(assert (=> b!40226 d!6995))

(declare-fun b!40452 () Bool)

(declare-fun e!25648 () Bool)

(assert (=> b!40452 (= e!25648 (contains!509 Nil!1043 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun b!40453 () Bool)

(declare-fun e!25651 () Bool)

(declare-fun e!25650 () Bool)

(assert (=> b!40453 (= e!25651 e!25650)))

(declare-fun c!4937 () Bool)

(assert (=> b!40453 (= c!4937 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun b!40454 () Bool)

(declare-fun call!3127 () Bool)

(assert (=> b!40454 (= e!25650 call!3127)))

(declare-fun b!40455 () Bool)

(declare-fun e!25649 () Bool)

(assert (=> b!40455 (= e!25649 e!25651)))

(declare-fun res!24162 () Bool)

(assert (=> b!40455 (=> (not res!24162) (not e!25651))))

(assert (=> b!40455 (= res!24162 (not e!25648))))

(declare-fun res!24160 () Bool)

(assert (=> b!40455 (=> (not res!24160) (not e!25648))))

(assert (=> b!40455 (= res!24160 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun bm!3124 () Bool)

(assert (=> bm!3124 (= call!3127 (arrayNoDuplicates!0 (_keys!3291 lt!15428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4937 (Cons!1042 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) Nil!1043) Nil!1043)))))

(declare-fun b!40456 () Bool)

(assert (=> b!40456 (= e!25650 call!3127)))

(declare-fun d!7037 () Bool)

(declare-fun res!24161 () Bool)

(assert (=> d!7037 (=> res!24161 e!25649)))

(assert (=> d!7037 (= res!24161 (bvsge #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7037 (= (arrayNoDuplicates!0 (_keys!3291 lt!15428) #b00000000000000000000000000000000 Nil!1043) e!25649)))

(assert (= (and d!7037 (not res!24161)) b!40455))

(assert (= (and b!40455 res!24160) b!40452))

(assert (= (and b!40455 res!24162) b!40453))

(assert (= (and b!40453 c!4937) b!40454))

(assert (= (and b!40453 (not c!4937)) b!40456))

(assert (= (or b!40454 b!40456) bm!3124))

(declare-fun m!33349 () Bool)

(assert (=> b!40452 m!33349))

(assert (=> b!40452 m!33349))

(declare-fun m!33351 () Bool)

(assert (=> b!40452 m!33351))

(assert (=> b!40453 m!33349))

(assert (=> b!40453 m!33349))

(declare-fun m!33353 () Bool)

(assert (=> b!40453 m!33353))

(assert (=> b!40455 m!33349))

(assert (=> b!40455 m!33349))

(assert (=> b!40455 m!33353))

(assert (=> bm!3124 m!33349))

(declare-fun m!33355 () Bool)

(assert (=> bm!3124 m!33355))

(assert (=> b!40328 d!7037))

(assert (=> d!6973 d!6979))

(declare-fun d!7041 () Bool)

(assert (=> d!7041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15423 mask!853)))

(assert (=> d!7041 true))

(declare-fun _$30!51 () Unit!986)

(assert (=> d!7041 (= (choose!34 lt!15423 mask!853 #b00000000000000000000000000000000) _$30!51)))

(declare-fun bs!1708 () Bool)

(assert (= bs!1708 d!7041))

(assert (=> bs!1708 m!33095))

(assert (=> d!6973 d!7041))

(assert (=> d!6973 d!6941))

(declare-fun d!7049 () Bool)

(declare-fun lt!15587 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!32 (List!1046) (InoxSet (_ BitVec 64)))

(assert (=> d!7049 (= lt!15587 (select (content!32 Nil!1043) (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(declare-fun e!25669 () Bool)

(assert (=> d!7049 (= lt!15587 e!25669)))

(declare-fun res!24176 () Bool)

(assert (=> d!7049 (=> (not res!24176) (not e!25669))))

(assert (=> d!7049 (= res!24176 ((_ is Cons!1042) Nil!1043))))

(assert (=> d!7049 (= (contains!509 Nil!1043 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)) lt!15587)))

(declare-fun b!40479 () Bool)

(declare-fun e!25670 () Bool)

(assert (=> b!40479 (= e!25669 e!25670)))

(declare-fun res!24175 () Bool)

(assert (=> b!40479 (=> res!24175 e!25670)))

(assert (=> b!40479 (= res!24175 (= (h!1616 Nil!1043) (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(declare-fun b!40480 () Bool)

(assert (=> b!40480 (= e!25670 (contains!509 (t!3898 Nil!1043) (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(assert (= (and d!7049 res!24176) b!40479))

(assert (= (and b!40479 (not res!24175)) b!40480))

(declare-fun m!33383 () Bool)

(assert (=> d!7049 m!33383))

(assert (=> d!7049 m!33169))

(declare-fun m!33385 () Bool)

(assert (=> d!7049 m!33385))

(assert (=> b!40480 m!33169))

(declare-fun m!33387 () Bool)

(assert (=> b!40480 m!33387))

(assert (=> b!40265 d!7049))

(declare-fun bm!3185 () Bool)

(declare-fun call!3189 () Bool)

(declare-fun lt!15786 () ListLongMap!1053)

(declare-fun contains!512 (ListLongMap!1053 (_ BitVec 64)) Bool)

(assert (=> bm!3185 (= call!3189 (contains!512 lt!15786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3186 () Bool)

(declare-fun call!3188 () ListLongMap!1053)

(declare-fun call!3193 () ListLongMap!1053)

(assert (=> bm!3186 (= call!3188 call!3193)))

(declare-fun b!40653 () Bool)

(declare-fun e!25778 () Bool)

(declare-fun apply!55 (ListLongMap!1053 (_ BitVec 64)) V!2097)

(assert (=> b!40653 (= e!25778 (= (apply!55 lt!15786 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1721 lt!15428)))))

(declare-fun b!40654 () Bool)

(declare-fun e!25787 () Bool)

(declare-fun e!25784 () Bool)

(assert (=> b!40654 (= e!25787 e!25784)))

(declare-fun res!24250 () Bool)

(declare-fun call!3194 () Bool)

(assert (=> b!40654 (= res!24250 call!3194)))

(assert (=> b!40654 (=> (not res!24250) (not e!25784))))

(declare-fun b!40655 () Bool)

(assert (=> b!40655 (= e!25784 (= (apply!55 lt!15786 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1721 lt!15428)))))

(declare-fun d!7055 () Bool)

(declare-fun e!25783 () Bool)

(assert (=> d!7055 e!25783))

(declare-fun res!24252 () Bool)

(assert (=> d!7055 (=> (not res!24252) (not e!25783))))

(assert (=> d!7055 (= res!24252 (or (bvsge #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))))

(declare-fun lt!15778 () ListLongMap!1053)

(assert (=> d!7055 (= lt!15786 lt!15778)))

(declare-fun lt!15771 () Unit!986)

(declare-fun e!25789 () Unit!986)

(assert (=> d!7055 (= lt!15771 e!25789)))

(declare-fun c!4994 () Bool)

(declare-fun e!25785 () Bool)

(assert (=> d!7055 (= c!4994 e!25785)))

(declare-fun res!24249 () Bool)

(assert (=> d!7055 (=> (not res!24249) (not e!25785))))

(assert (=> d!7055 (= res!24249 (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(declare-fun e!25781 () ListLongMap!1053)

(assert (=> d!7055 (= lt!15778 e!25781)))

(declare-fun c!4996 () Bool)

(assert (=> d!7055 (= c!4996 (and (not (= (bvand (extraKeys!1694 lt!15428) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1694 lt!15428) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7055 (validMask!0 (mask!5175 lt!15428))))

(assert (=> d!7055 (= (getCurrentListMap!301 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15428)) lt!15786)))

(declare-fun b!40656 () Bool)

(declare-fun e!25780 () ListLongMap!1053)

(declare-fun call!3191 () ListLongMap!1053)

(assert (=> b!40656 (= e!25780 call!3191)))

(declare-fun bm!3187 () Bool)

(declare-fun call!3190 () ListLongMap!1053)

(declare-fun getCurrentListMapNoExtraKeys!34 (array!2565 array!2567 (_ BitVec 32) (_ BitVec 32) V!2097 V!2097 (_ BitVec 32) Int) ListLongMap!1053)

(assert (=> bm!3187 (= call!3190 (getCurrentListMapNoExtraKeys!34 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15428)))))

(declare-fun bm!3188 () Bool)

(declare-fun call!3192 () ListLongMap!1053)

(assert (=> bm!3188 (= call!3191 call!3192)))

(declare-fun b!40657 () Bool)

(assert (=> b!40657 (= e!25780 call!3188)))

(declare-fun b!40658 () Bool)

(declare-fun e!25777 () ListLongMap!1053)

(assert (=> b!40658 (= e!25781 e!25777)))

(declare-fun c!4997 () Bool)

(assert (=> b!40658 (= c!4997 (and (not (= (bvand (extraKeys!1694 lt!15428) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1694 lt!15428) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40659 () Bool)

(declare-fun e!25782 () Bool)

(assert (=> b!40659 (= e!25782 (not call!3189))))

(declare-fun b!40660 () Bool)

(declare-fun c!4995 () Bool)

(assert (=> b!40660 (= c!4995 (and (not (= (bvand (extraKeys!1694 lt!15428) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1694 lt!15428) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!40660 (= e!25777 e!25780)))

(declare-fun b!40661 () Bool)

(declare-fun +!65 (ListLongMap!1053 tuple2!1488) ListLongMap!1053)

(assert (=> b!40661 (= e!25781 (+!65 call!3192 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))))

(declare-fun b!40662 () Bool)

(assert (=> b!40662 (= e!25783 e!25787)))

(declare-fun c!4998 () Bool)

(assert (=> b!40662 (= c!4998 (not (= (bvand (extraKeys!1694 lt!15428) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40663 () Bool)

(declare-fun e!25779 () Bool)

(declare-fun e!25786 () Bool)

(assert (=> b!40663 (= e!25779 e!25786)))

(declare-fun res!24253 () Bool)

(assert (=> b!40663 (=> (not res!24253) (not e!25786))))

(assert (=> b!40663 (= res!24253 (contains!512 lt!15786 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (=> b!40663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(declare-fun bm!3189 () Bool)

(assert (=> bm!3189 (= call!3193 call!3190)))

(declare-fun b!40664 () Bool)

(declare-fun res!24255 () Bool)

(assert (=> b!40664 (=> (not res!24255) (not e!25783))))

(assert (=> b!40664 (= res!24255 e!25779)))

(declare-fun res!24256 () Bool)

(assert (=> b!40664 (=> res!24256 e!25779)))

(declare-fun e!25788 () Bool)

(assert (=> b!40664 (= res!24256 (not e!25788))))

(declare-fun res!24257 () Bool)

(assert (=> b!40664 (=> (not res!24257) (not e!25788))))

(assert (=> b!40664 (= res!24257 (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(declare-fun b!40665 () Bool)

(assert (=> b!40665 (= e!25782 e!25778)))

(declare-fun res!24251 () Bool)

(assert (=> b!40665 (= res!24251 call!3189)))

(assert (=> b!40665 (=> (not res!24251) (not e!25778))))

(declare-fun b!40666 () Bool)

(declare-fun Unit!992 () Unit!986)

(assert (=> b!40666 (= e!25789 Unit!992)))

(declare-fun b!40667 () Bool)

(declare-fun lt!15779 () Unit!986)

(assert (=> b!40667 (= e!25789 lt!15779)))

(declare-fun lt!15782 () ListLongMap!1053)

(assert (=> b!40667 (= lt!15782 (getCurrentListMapNoExtraKeys!34 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15428)))))

(declare-fun lt!15765 () (_ BitVec 64))

(assert (=> b!40667 (= lt!15765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15783 () (_ BitVec 64))

(assert (=> b!40667 (= lt!15783 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000))))

(declare-fun lt!15774 () Unit!986)

(declare-fun addStillContains!32 (ListLongMap!1053 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!986)

(assert (=> b!40667 (= lt!15774 (addStillContains!32 lt!15782 lt!15765 (zeroValue!1721 lt!15428) lt!15783))))

(assert (=> b!40667 (contains!512 (+!65 lt!15782 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428))) lt!15783)))

(declare-fun lt!15767 () Unit!986)

(assert (=> b!40667 (= lt!15767 lt!15774)))

(declare-fun lt!15780 () ListLongMap!1053)

(assert (=> b!40667 (= lt!15780 (getCurrentListMapNoExtraKeys!34 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15428)))))

(declare-fun lt!15770 () (_ BitVec 64))

(assert (=> b!40667 (= lt!15770 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15768 () (_ BitVec 64))

(assert (=> b!40667 (= lt!15768 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000))))

(declare-fun lt!15773 () Unit!986)

(declare-fun addApplyDifferent!32 (ListLongMap!1053 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!986)

(assert (=> b!40667 (= lt!15773 (addApplyDifferent!32 lt!15780 lt!15770 (minValue!1721 lt!15428) lt!15768))))

(assert (=> b!40667 (= (apply!55 (+!65 lt!15780 (tuple2!1489 lt!15770 (minValue!1721 lt!15428))) lt!15768) (apply!55 lt!15780 lt!15768))))

(declare-fun lt!15775 () Unit!986)

(assert (=> b!40667 (= lt!15775 lt!15773)))

(declare-fun lt!15784 () ListLongMap!1053)

(assert (=> b!40667 (= lt!15784 (getCurrentListMapNoExtraKeys!34 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15428)))))

(declare-fun lt!15772 () (_ BitVec 64))

(assert (=> b!40667 (= lt!15772 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15781 () (_ BitVec 64))

(assert (=> b!40667 (= lt!15781 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000))))

(declare-fun lt!15776 () Unit!986)

(assert (=> b!40667 (= lt!15776 (addApplyDifferent!32 lt!15784 lt!15772 (zeroValue!1721 lt!15428) lt!15781))))

(assert (=> b!40667 (= (apply!55 (+!65 lt!15784 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428))) lt!15781) (apply!55 lt!15784 lt!15781))))

(declare-fun lt!15769 () Unit!986)

(assert (=> b!40667 (= lt!15769 lt!15776)))

(declare-fun lt!15785 () ListLongMap!1053)

(assert (=> b!40667 (= lt!15785 (getCurrentListMapNoExtraKeys!34 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15428)))))

(declare-fun lt!15777 () (_ BitVec 64))

(assert (=> b!40667 (= lt!15777 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15766 () (_ BitVec 64))

(assert (=> b!40667 (= lt!15766 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000))))

(assert (=> b!40667 (= lt!15779 (addApplyDifferent!32 lt!15785 lt!15777 (minValue!1721 lt!15428) lt!15766))))

(assert (=> b!40667 (= (apply!55 (+!65 lt!15785 (tuple2!1489 lt!15777 (minValue!1721 lt!15428))) lt!15766) (apply!55 lt!15785 lt!15766))))

(declare-fun b!40668 () Bool)

(assert (=> b!40668 (= e!25787 (not call!3194))))

(declare-fun bm!3190 () Bool)

(assert (=> bm!3190 (= call!3192 (+!65 (ite c!4996 call!3190 (ite c!4997 call!3193 call!3188)) (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))))))

(declare-fun b!40669 () Bool)

(declare-fun get!701 (ValueCell!629 V!2097) V!2097)

(assert (=> b!40669 (= e!25786 (= (apply!55 lt!15786 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)) (get!701 (select (arr!1227 (_values!1786 lt!15428)) #b00000000000000000000000000000000) (dynLambda!189 (defaultEntry!1803 lt!15428) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1364 (_values!1786 lt!15428))))))

(assert (=> b!40669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(declare-fun bm!3191 () Bool)

(assert (=> bm!3191 (= call!3194 (contains!512 lt!15786 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40670 () Bool)

(assert (=> b!40670 (= e!25788 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun b!40671 () Bool)

(declare-fun res!24254 () Bool)

(assert (=> b!40671 (=> (not res!24254) (not e!25783))))

(assert (=> b!40671 (= res!24254 e!25782)))

(declare-fun c!4993 () Bool)

(assert (=> b!40671 (= c!4993 (not (= (bvand (extraKeys!1694 lt!15428) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!40672 () Bool)

(assert (=> b!40672 (= e!25785 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun b!40673 () Bool)

(assert (=> b!40673 (= e!25777 call!3191)))

(assert (= (and d!7055 c!4996) b!40661))

(assert (= (and d!7055 (not c!4996)) b!40658))

(assert (= (and b!40658 c!4997) b!40673))

(assert (= (and b!40658 (not c!4997)) b!40660))

(assert (= (and b!40660 c!4995) b!40656))

(assert (= (and b!40660 (not c!4995)) b!40657))

(assert (= (or b!40656 b!40657) bm!3186))

(assert (= (or b!40673 bm!3186) bm!3189))

(assert (= (or b!40673 b!40656) bm!3188))

(assert (= (or b!40661 bm!3189) bm!3187))

(assert (= (or b!40661 bm!3188) bm!3190))

(assert (= (and d!7055 res!24249) b!40672))

(assert (= (and d!7055 c!4994) b!40667))

(assert (= (and d!7055 (not c!4994)) b!40666))

(assert (= (and d!7055 res!24252) b!40664))

(assert (= (and b!40664 res!24257) b!40670))

(assert (= (and b!40664 (not res!24256)) b!40663))

(assert (= (and b!40663 res!24253) b!40669))

(assert (= (and b!40664 res!24255) b!40671))

(assert (= (and b!40671 c!4993) b!40665))

(assert (= (and b!40671 (not c!4993)) b!40659))

(assert (= (and b!40665 res!24251) b!40653))

(assert (= (or b!40665 b!40659) bm!3185))

(assert (= (and b!40671 res!24254) b!40662))

(assert (= (and b!40662 c!4998) b!40654))

(assert (= (and b!40662 (not c!4998)) b!40668))

(assert (= (and b!40654 res!24250) b!40655))

(assert (= (or b!40654 b!40668) bm!3191))

(declare-fun b_lambda!2077 () Bool)

(assert (=> (not b_lambda!2077) (not b!40669)))

(declare-fun tb!849 () Bool)

(declare-fun t!3912 () Bool)

(assert (=> (and start!5686 (= defaultEntry!470 (defaultEntry!1803 lt!15428)) t!3912) tb!849))

(declare-fun result!1451 () Bool)

(assert (=> tb!849 (= result!1451 tp_is_empty!1753)))

(assert (=> b!40669 t!3912))

(declare-fun b_and!2375 () Bool)

(assert (= b_and!2361 (and (=> t!3912 result!1451) b_and!2375)))

(declare-fun m!33459 () Bool)

(assert (=> bm!3190 m!33459))

(declare-fun m!33463 () Bool)

(assert (=> b!40669 m!33463))

(assert (=> b!40669 m!33349))

(declare-fun m!33467 () Bool)

(assert (=> b!40669 m!33467))

(assert (=> b!40669 m!33349))

(declare-fun m!33473 () Bool)

(assert (=> b!40669 m!33473))

(assert (=> b!40669 m!33463))

(declare-fun m!33477 () Bool)

(assert (=> b!40669 m!33477))

(assert (=> b!40669 m!33473))

(declare-fun m!33483 () Bool)

(assert (=> bm!3191 m!33483))

(assert (=> d!7055 m!33271))

(declare-fun m!33491 () Bool)

(assert (=> b!40667 m!33491))

(declare-fun m!33493 () Bool)

(assert (=> b!40667 m!33493))

(declare-fun m!33497 () Bool)

(assert (=> b!40667 m!33497))

(declare-fun m!33499 () Bool)

(assert (=> b!40667 m!33499))

(assert (=> b!40667 m!33349))

(declare-fun m!33505 () Bool)

(assert (=> b!40667 m!33505))

(declare-fun m!33511 () Bool)

(assert (=> b!40667 m!33511))

(declare-fun m!33513 () Bool)

(assert (=> b!40667 m!33513))

(assert (=> b!40667 m!33497))

(assert (=> b!40667 m!33511))

(declare-fun m!33521 () Bool)

(assert (=> b!40667 m!33521))

(declare-fun m!33525 () Bool)

(assert (=> b!40667 m!33525))

(declare-fun m!33527 () Bool)

(assert (=> b!40667 m!33527))

(declare-fun m!33529 () Bool)

(assert (=> b!40667 m!33529))

(declare-fun m!33531 () Bool)

(assert (=> b!40667 m!33531))

(declare-fun m!33533 () Bool)

(assert (=> b!40667 m!33533))

(declare-fun m!33535 () Bool)

(assert (=> b!40667 m!33535))

(declare-fun m!33539 () Bool)

(assert (=> b!40667 m!33539))

(assert (=> b!40667 m!33525))

(assert (=> b!40667 m!33491))

(declare-fun m!33547 () Bool)

(assert (=> b!40667 m!33547))

(assert (=> bm!3187 m!33505))

(declare-fun m!33549 () Bool)

(assert (=> b!40661 m!33549))

(assert (=> b!40670 m!33349))

(assert (=> b!40670 m!33349))

(assert (=> b!40670 m!33353))

(assert (=> b!40663 m!33349))

(assert (=> b!40663 m!33349))

(declare-fun m!33551 () Bool)

(assert (=> b!40663 m!33551))

(declare-fun m!33553 () Bool)

(assert (=> b!40653 m!33553))

(declare-fun m!33555 () Bool)

(assert (=> b!40655 m!33555))

(declare-fun m!33557 () Bool)

(assert (=> bm!3185 m!33557))

(assert (=> b!40672 m!33349))

(assert (=> b!40672 m!33349))

(assert (=> b!40672 m!33353))

(assert (=> d!6961 d!7055))

(declare-fun b!40684 () Bool)

(declare-fun e!25799 () (_ BitVec 32))

(declare-fun call!3197 () (_ BitVec 32))

(assert (=> b!40684 (= e!25799 call!3197)))

(declare-fun b!40685 () Bool)

(declare-fun e!25798 () (_ BitVec 32))

(assert (=> b!40685 (= e!25798 e!25799)))

(declare-fun c!5001 () Bool)

(assert (=> b!40685 (= c!5001 (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40686 () Bool)

(assert (=> b!40686 (= e!25798 #b00000000000000000000000000000000)))

(declare-fun bm!3194 () Bool)

(assert (=> bm!3194 (= call!3197 (arrayCountValidKeys!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!40687 () Bool)

(assert (=> b!40687 (= e!25799 (bvadd #b00000000000000000000000000000001 call!3197))))

(declare-fun d!7067 () Bool)

(declare-fun lt!15787 () (_ BitVec 32))

(assert (=> d!7067 (and (bvsge lt!15787 #b00000000000000000000000000000000) (bvsle lt!15787 (bvsub (size!1363 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7067 (= lt!15787 e!25798)))

(declare-fun c!5002 () Bool)

(assert (=> d!7067 (= c!5002 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7067 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1363 lt!15423)))))

(assert (=> d!7067 (= (arrayCountValidKeys!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15787)))

(assert (= (and d!7067 c!5002) b!40686))

(assert (= (and d!7067 (not c!5002)) b!40685))

(assert (= (and b!40685 c!5001) b!40687))

(assert (= (and b!40685 (not c!5001)) b!40684))

(assert (= (or b!40687 b!40684) bm!3194))

(assert (=> b!40685 m!33275))

(assert (=> b!40685 m!33275))

(assert (=> b!40685 m!33279))

(declare-fun m!33561 () Bool)

(assert (=> bm!3194 m!33561))

(assert (=> bm!3100 d!7067))

(declare-fun b!40688 () Bool)

(declare-fun e!25801 () (_ BitVec 32))

(declare-fun call!3198 () (_ BitVec 32))

(assert (=> b!40688 (= e!25801 call!3198)))

(declare-fun b!40689 () Bool)

(declare-fun e!25800 () (_ BitVec 32))

(assert (=> b!40689 (= e!25800 e!25801)))

(declare-fun c!5003 () Bool)

(assert (=> b!40689 (= c!5003 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun b!40690 () Bool)

(assert (=> b!40690 (= e!25800 #b00000000000000000000000000000000)))

(declare-fun bm!3195 () Bool)

(assert (=> bm!3195 (= call!3198 (arrayCountValidKeys!0 (_keys!3291 lt!15428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 (_keys!3291 lt!15428))))))

(declare-fun b!40691 () Bool)

(assert (=> b!40691 (= e!25801 (bvadd #b00000000000000000000000000000001 call!3198))))

(declare-fun d!7069 () Bool)

(declare-fun lt!15788 () (_ BitVec 32))

(assert (=> d!7069 (and (bvsge lt!15788 #b00000000000000000000000000000000) (bvsle lt!15788 (bvsub (size!1363 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (=> d!7069 (= lt!15788 e!25800)))

(declare-fun c!5004 () Bool)

(assert (=> d!7069 (= c!5004 (bvsge #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7069 (and (bvsle #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1363 (_keys!3291 lt!15428)) (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7069 (= (arrayCountValidKeys!0 (_keys!3291 lt!15428) #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))) lt!15788)))

(assert (= (and d!7069 c!5004) b!40690))

(assert (= (and d!7069 (not c!5004)) b!40689))

(assert (= (and b!40689 c!5003) b!40691))

(assert (= (and b!40689 (not c!5003)) b!40688))

(assert (= (or b!40691 b!40688) bm!3195))

(assert (=> b!40689 m!33349))

(assert (=> b!40689 m!33349))

(assert (=> b!40689 m!33353))

(declare-fun m!33565 () Bool)

(assert (=> bm!3195 m!33565))

(assert (=> b!40326 d!7069))

(declare-fun b!40696 () Bool)

(declare-fun e!25805 () Bool)

(declare-fun e!25806 () Bool)

(assert (=> b!40696 (= e!25805 e!25806)))

(declare-fun lt!15792 () (_ BitVec 64))

(assert (=> b!40696 (= lt!15792 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15793 () Unit!986)

(assert (=> b!40696 (= lt!15793 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15423 lt!15792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40696 (arrayContainsKey!0 lt!15423 lt!15792 #b00000000000000000000000000000000)))

(declare-fun lt!15794 () Unit!986)

(assert (=> b!40696 (= lt!15794 lt!15793)))

(declare-fun res!24267 () Bool)

(assert (=> b!40696 (= res!24267 (= (seekEntryOrOpen!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15423 mask!853) (Found!179 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40696 (=> (not res!24267) (not e!25806))))

(declare-fun b!40697 () Bool)

(declare-fun call!3200 () Bool)

(assert (=> b!40697 (= e!25805 call!3200)))

(declare-fun b!40698 () Bool)

(declare-fun e!25807 () Bool)

(assert (=> b!40698 (= e!25807 e!25805)))

(declare-fun c!5006 () Bool)

(assert (=> b!40698 (= c!5006 (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7073 () Bool)

(declare-fun res!24266 () Bool)

(assert (=> d!7073 (=> res!24266 e!25807)))

(assert (=> d!7073 (= res!24266 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 lt!15423)))))

(assert (=> d!7073 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15423 mask!853) e!25807)))

(declare-fun b!40699 () Bool)

(assert (=> b!40699 (= e!25806 call!3200)))

(declare-fun bm!3197 () Bool)

(assert (=> bm!3197 (= call!3200 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15423 mask!853))))

(assert (= (and d!7073 (not res!24266)) b!40698))

(assert (= (and b!40698 c!5006) b!40696))

(assert (= (and b!40698 (not c!5006)) b!40697))

(assert (= (and b!40696 res!24267) b!40699))

(assert (= (or b!40699 b!40697) bm!3197))

(assert (=> b!40696 m!33275))

(declare-fun m!33575 () Bool)

(assert (=> b!40696 m!33575))

(declare-fun m!33577 () Bool)

(assert (=> b!40696 m!33577))

(assert (=> b!40696 m!33275))

(declare-fun m!33579 () Bool)

(assert (=> b!40696 m!33579))

(assert (=> b!40698 m!33275))

(assert (=> b!40698 m!33275))

(assert (=> b!40698 m!33279))

(declare-fun m!33581 () Bool)

(assert (=> bm!3197 m!33581))

(assert (=> bm!3119 d!7073))

(assert (=> d!6949 d!6955))

(declare-fun d!7077 () Bool)

(assert (=> d!7077 (= (arrayCountValidKeys!0 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!7077 true))

(declare-fun _$88!40 () Unit!986)

(assert (=> d!7077 (= (choose!59 lt!15423 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!40)))

(declare-fun bs!1710 () Bool)

(assert (= bs!1710 d!7077))

(assert (=> bs!1710 m!33089))

(assert (=> d!6949 d!7077))

(declare-fun b!40713 () Bool)

(declare-fun e!25814 () Bool)

(declare-fun e!25815 () Bool)

(assert (=> b!40713 (= e!25814 e!25815)))

(declare-fun lt!15795 () (_ BitVec 64))

(assert (=> b!40713 (= lt!15795 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000))))

(declare-fun lt!15796 () Unit!986)

(assert (=> b!40713 (= lt!15796 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3291 lt!15428) lt!15795 #b00000000000000000000000000000000))))

(assert (=> b!40713 (arrayContainsKey!0 (_keys!3291 lt!15428) lt!15795 #b00000000000000000000000000000000)))

(declare-fun lt!15797 () Unit!986)

(assert (=> b!40713 (= lt!15797 lt!15796)))

(declare-fun res!24280 () Bool)

(assert (=> b!40713 (= res!24280 (= (seekEntryOrOpen!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) (_keys!3291 lt!15428) (mask!5175 lt!15428)) (Found!179 #b00000000000000000000000000000000)))))

(assert (=> b!40713 (=> (not res!24280) (not e!25815))))

(declare-fun b!40714 () Bool)

(declare-fun call!3202 () Bool)

(assert (=> b!40714 (= e!25814 call!3202)))

(declare-fun b!40715 () Bool)

(declare-fun e!25816 () Bool)

(assert (=> b!40715 (= e!25816 e!25814)))

(declare-fun c!5008 () Bool)

(assert (=> b!40715 (= c!5008 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun d!7081 () Bool)

(declare-fun res!24279 () Bool)

(assert (=> d!7081 (=> res!24279 e!25816)))

(assert (=> d!7081 (= res!24279 (bvsge #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3291 lt!15428) (mask!5175 lt!15428)) e!25816)))

(declare-fun b!40716 () Bool)

(assert (=> b!40716 (= e!25815 call!3202)))

(declare-fun bm!3199 () Bool)

(assert (=> bm!3199 (= call!3202 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3291 lt!15428) (mask!5175 lt!15428)))))

(assert (= (and d!7081 (not res!24279)) b!40715))

(assert (= (and b!40715 c!5008) b!40713))

(assert (= (and b!40715 (not c!5008)) b!40714))

(assert (= (and b!40713 res!24280) b!40716))

(assert (= (or b!40716 b!40714) bm!3199))

(assert (=> b!40713 m!33349))

(declare-fun m!33587 () Bool)

(assert (=> b!40713 m!33587))

(declare-fun m!33589 () Bool)

(assert (=> b!40713 m!33589))

(assert (=> b!40713 m!33349))

(declare-fun m!33591 () Bool)

(assert (=> b!40713 m!33591))

(assert (=> b!40715 m!33349))

(assert (=> b!40715 m!33349))

(assert (=> b!40715 m!33353))

(declare-fun m!33593 () Bool)

(assert (=> bm!3199 m!33593))

(assert (=> b!40327 d!7081))

(check-sat (not b!40685) (not b!40365) (not b!40672) (not b!40453) (not d!7041) (not b!40655) (not bm!3199) (not d!7049) (not b!40689) (not d!7017) (not b!40435) (not b!40713) (not bm!3190) (not b!40669) tp_is_empty!1753 (not b!40698) (not b!40663) (not bm!3194) (not d!7055) (not b!40696) (not bm!3185) (not b!40661) (not d!6997) (not b!40455) (not b!40670) (not d!7077) (not b!40452) (not bm!3122) (not b!40363) (not b!40480) (not b!40366) (not b_next!1363) (not b!40667) (not bm!3197) (not b!40362) (not b_lambda!2071) (not b!40653) (not b!40368) (not b_lambda!2077) (not d!7035) (not d!7027) (not bm!3187) (not b!40387) (not bm!3124) (not bm!3191) (not bm!3195) (not b!40715) b_and!2375)
(check-sat b_and!2375 (not b_next!1363))
(get-model)

(assert (=> d!7017 d!7021))

(declare-fun d!7089 () Bool)

(assert (=> d!7089 (arrayContainsKey!0 lt!15423 lt!15525 #b00000000000000000000000000000000)))

(assert (=> d!7089 true))

(declare-fun _$60!338 () Unit!986)

(assert (=> d!7089 (= (choose!13 lt!15423 lt!15525 #b00000000000000000000000000000000) _$60!338)))

(declare-fun bs!1714 () Bool)

(assert (= bs!1714 d!7089))

(assert (=> bs!1714 m!33225))

(assert (=> d!7017 d!7089))

(declare-fun b!40725 () Bool)

(declare-fun e!25821 () Bool)

(assert (=> b!40725 (= e!25821 (contains!509 (ite c!4937 (Cons!1042 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) Nil!1043) Nil!1043) (select (arr!1226 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40726 () Bool)

(declare-fun e!25824 () Bool)

(declare-fun e!25823 () Bool)

(assert (=> b!40726 (= e!25824 e!25823)))

(declare-fun c!5010 () Bool)

(assert (=> b!40726 (= c!5010 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40727 () Bool)

(declare-fun call!3204 () Bool)

(assert (=> b!40727 (= e!25823 call!3204)))

(declare-fun b!40728 () Bool)

(declare-fun e!25822 () Bool)

(assert (=> b!40728 (= e!25822 e!25824)))

(declare-fun res!24292 () Bool)

(assert (=> b!40728 (=> (not res!24292) (not e!25824))))

(assert (=> b!40728 (= res!24292 (not e!25821))))

(declare-fun res!24290 () Bool)

(assert (=> b!40728 (=> (not res!24290) (not e!25821))))

(assert (=> b!40728 (= res!24290 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3201 () Bool)

(assert (=> bm!3201 (= call!3204 (arrayNoDuplicates!0 (_keys!3291 lt!15428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5010 (Cons!1042 (select (arr!1226 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4937 (Cons!1042 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (ite c!4937 (Cons!1042 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) Nil!1043) Nil!1043))))))

(declare-fun b!40729 () Bool)

(assert (=> b!40729 (= e!25823 call!3204)))

(declare-fun d!7091 () Bool)

(declare-fun res!24291 () Bool)

(assert (=> d!7091 (=> res!24291 e!25822)))

(assert (=> d!7091 (= res!24291 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7091 (= (arrayNoDuplicates!0 (_keys!3291 lt!15428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4937 (Cons!1042 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) e!25822)))

(assert (= (and d!7091 (not res!24291)) b!40728))

(assert (= (and b!40728 res!24290) b!40725))

(assert (= (and b!40728 res!24292) b!40726))

(assert (= (and b!40726 c!5010) b!40727))

(assert (= (and b!40726 (not c!5010)) b!40729))

(assert (= (or b!40727 b!40729) bm!3201))

(declare-fun m!33605 () Bool)

(assert (=> b!40725 m!33605))

(assert (=> b!40725 m!33605))

(declare-fun m!33607 () Bool)

(assert (=> b!40725 m!33607))

(assert (=> b!40726 m!33605))

(assert (=> b!40726 m!33605))

(declare-fun m!33609 () Bool)

(assert (=> b!40726 m!33609))

(assert (=> b!40728 m!33605))

(assert (=> b!40728 m!33605))

(assert (=> b!40728 m!33609))

(assert (=> bm!3201 m!33605))

(declare-fun m!33611 () Bool)

(assert (=> bm!3201 m!33611))

(assert (=> bm!3124 d!7091))

(declare-fun d!7093 () Bool)

(declare-datatypes ((Option!105 0))(
  ( (Some!104 (v!1997 V!2097)) (None!103) )
))
(declare-fun get!704 (Option!105) V!2097)

(declare-fun getValueByKey!99 (List!1045 (_ BitVec 64)) Option!105)

(assert (=> d!7093 (= (apply!55 lt!15786 #b1000000000000000000000000000000000000000000000000000000000000000) (get!704 (getValueByKey!99 (toList!542 lt!15786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1715 () Bool)

(assert (= bs!1715 d!7093))

(declare-fun m!33613 () Bool)

(assert (=> bs!1715 m!33613))

(assert (=> bs!1715 m!33613))

(declare-fun m!33615 () Bool)

(assert (=> bs!1715 m!33615))

(assert (=> b!40655 d!7093))

(declare-fun d!7095 () Bool)

(assert (=> d!7095 (= (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40672 d!7095))

(assert (=> b!40689 d!7095))

(declare-fun d!7097 () Bool)

(assert (=> d!7097 (= (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40685 d!7097))

(declare-fun d!7099 () Bool)

(assert (=> d!7099 (= (apply!55 lt!15786 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)) (get!704 (getValueByKey!99 (toList!542 lt!15786) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000))))))

(declare-fun bs!1716 () Bool)

(assert (= bs!1716 d!7099))

(assert (=> bs!1716 m!33349))

(declare-fun m!33617 () Bool)

(assert (=> bs!1716 m!33617))

(assert (=> bs!1716 m!33617))

(declare-fun m!33619 () Bool)

(assert (=> bs!1716 m!33619))

(assert (=> b!40669 d!7099))

(declare-fun d!7101 () Bool)

(declare-fun c!5013 () Bool)

(assert (=> d!7101 (= c!5013 ((_ is ValueCellFull!629) (select (arr!1227 (_values!1786 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun e!25827 () V!2097)

(assert (=> d!7101 (= (get!701 (select (arr!1227 (_values!1786 lt!15428)) #b00000000000000000000000000000000) (dynLambda!189 (defaultEntry!1803 lt!15428) #b0000000000000000000000000000000000000000000000000000000000000000)) e!25827)))

(declare-fun b!40734 () Bool)

(declare-fun get!705 (ValueCell!629 V!2097) V!2097)

(assert (=> b!40734 (= e!25827 (get!705 (select (arr!1227 (_values!1786 lt!15428)) #b00000000000000000000000000000000) (dynLambda!189 (defaultEntry!1803 lt!15428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!40735 () Bool)

(declare-fun get!706 (ValueCell!629 V!2097) V!2097)

(assert (=> b!40735 (= e!25827 (get!706 (select (arr!1227 (_values!1786 lt!15428)) #b00000000000000000000000000000000) (dynLambda!189 (defaultEntry!1803 lt!15428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7101 c!5013) b!40734))

(assert (= (and d!7101 (not c!5013)) b!40735))

(assert (=> b!40734 m!33473))

(assert (=> b!40734 m!33463))

(declare-fun m!33621 () Bool)

(assert (=> b!40734 m!33621))

(assert (=> b!40735 m!33473))

(assert (=> b!40735 m!33463))

(declare-fun m!33623 () Bool)

(assert (=> b!40735 m!33623))

(assert (=> b!40669 d!7101))

(assert (=> b!40455 d!7095))

(declare-fun d!7103 () Bool)

(declare-fun e!25832 () Bool)

(assert (=> d!7103 e!25832))

(declare-fun res!24295 () Bool)

(assert (=> d!7103 (=> res!24295 e!25832)))

(declare-fun lt!15810 () Bool)

(assert (=> d!7103 (= res!24295 (not lt!15810))))

(declare-fun lt!15812 () Bool)

(assert (=> d!7103 (= lt!15810 lt!15812)))

(declare-fun lt!15809 () Unit!986)

(declare-fun e!25833 () Unit!986)

(assert (=> d!7103 (= lt!15809 e!25833)))

(declare-fun c!5016 () Bool)

(assert (=> d!7103 (= c!5016 lt!15812)))

(declare-fun containsKey!68 (List!1045 (_ BitVec 64)) Bool)

(assert (=> d!7103 (= lt!15812 (containsKey!68 (toList!542 lt!15786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7103 (= (contains!512 lt!15786 #b1000000000000000000000000000000000000000000000000000000000000000) lt!15810)))

(declare-fun b!40742 () Bool)

(declare-fun lt!15811 () Unit!986)

(assert (=> b!40742 (= e!25833 lt!15811)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!56 (List!1045 (_ BitVec 64)) Unit!986)

(assert (=> b!40742 (= lt!15811 (lemmaContainsKeyImpliesGetValueByKeyDefined!56 (toList!542 lt!15786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!57 (Option!105) Bool)

(assert (=> b!40742 (isDefined!57 (getValueByKey!99 (toList!542 lt!15786) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40743 () Bool)

(declare-fun Unit!995 () Unit!986)

(assert (=> b!40743 (= e!25833 Unit!995)))

(declare-fun b!40744 () Bool)

(assert (=> b!40744 (= e!25832 (isDefined!57 (getValueByKey!99 (toList!542 lt!15786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7103 c!5016) b!40742))

(assert (= (and d!7103 (not c!5016)) b!40743))

(assert (= (and d!7103 (not res!24295)) b!40744))

(declare-fun m!33625 () Bool)

(assert (=> d!7103 m!33625))

(declare-fun m!33627 () Bool)

(assert (=> b!40742 m!33627))

(assert (=> b!40742 m!33613))

(assert (=> b!40742 m!33613))

(declare-fun m!33629 () Bool)

(assert (=> b!40742 m!33629))

(assert (=> b!40744 m!33613))

(assert (=> b!40744 m!33613))

(assert (=> b!40744 m!33629))

(assert (=> bm!3191 d!7103))

(declare-fun d!7105 () Bool)

(assert (=> d!7105 (= (apply!55 lt!15786 #b0000000000000000000000000000000000000000000000000000000000000000) (get!704 (getValueByKey!99 (toList!542 lt!15786) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1717 () Bool)

(assert (= bs!1717 d!7105))

(declare-fun m!33631 () Bool)

(assert (=> bs!1717 m!33631))

(assert (=> bs!1717 m!33631))

(declare-fun m!33633 () Bool)

(assert (=> bs!1717 m!33633))

(assert (=> b!40653 d!7105))

(declare-fun b!40745 () Bool)

(declare-fun e!25835 () (_ BitVec 32))

(declare-fun call!3205 () (_ BitVec 32))

(assert (=> b!40745 (= e!25835 call!3205)))

(declare-fun b!40746 () Bool)

(declare-fun e!25834 () (_ BitVec 32))

(assert (=> b!40746 (= e!25834 e!25835)))

(declare-fun c!5017 () Bool)

(assert (=> b!40746 (= c!5017 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40747 () Bool)

(assert (=> b!40747 (= e!25834 #b00000000000000000000000000000000)))

(declare-fun bm!3202 () Bool)

(assert (=> bm!3202 (= call!3205 (arrayCountValidKeys!0 (_keys!3291 lt!15428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1363 (_keys!3291 lt!15428))))))

(declare-fun b!40748 () Bool)

(assert (=> b!40748 (= e!25835 (bvadd #b00000000000000000000000000000001 call!3205))))

(declare-fun d!7107 () Bool)

(declare-fun lt!15813 () (_ BitVec 32))

(assert (=> d!7107 (and (bvsge lt!15813 #b00000000000000000000000000000000) (bvsle lt!15813 (bvsub (size!1363 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7107 (= lt!15813 e!25834)))

(declare-fun c!5018 () Bool)

(assert (=> d!7107 (= c!5018 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7107 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 (_keys!3291 lt!15428))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1363 (_keys!3291 lt!15428)) (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7107 (= (arrayCountValidKeys!0 (_keys!3291 lt!15428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 (_keys!3291 lt!15428))) lt!15813)))

(assert (= (and d!7107 c!5018) b!40747))

(assert (= (and d!7107 (not c!5018)) b!40746))

(assert (= (and b!40746 c!5017) b!40748))

(assert (= (and b!40746 (not c!5017)) b!40745))

(assert (= (or b!40748 b!40745) bm!3202))

(assert (=> b!40746 m!33605))

(assert (=> b!40746 m!33605))

(assert (=> b!40746 m!33609))

(declare-fun m!33635 () Bool)

(assert (=> bm!3202 m!33635))

(assert (=> bm!3195 d!7107))

(declare-fun d!7109 () Bool)

(assert (=> d!7109 (= (validMask!0 (mask!5175 lt!15428)) (and (or (= (mask!5175 lt!15428) #b00000000000000000000000000000111) (= (mask!5175 lt!15428) #b00000000000000000000000000001111) (= (mask!5175 lt!15428) #b00000000000000000000000000011111) (= (mask!5175 lt!15428) #b00000000000000000000000000111111) (= (mask!5175 lt!15428) #b00000000000000000000000001111111) (= (mask!5175 lt!15428) #b00000000000000000000000011111111) (= (mask!5175 lt!15428) #b00000000000000000000000111111111) (= (mask!5175 lt!15428) #b00000000000000000000001111111111) (= (mask!5175 lt!15428) #b00000000000000000000011111111111) (= (mask!5175 lt!15428) #b00000000000000000000111111111111) (= (mask!5175 lt!15428) #b00000000000000000001111111111111) (= (mask!5175 lt!15428) #b00000000000000000011111111111111) (= (mask!5175 lt!15428) #b00000000000000000111111111111111) (= (mask!5175 lt!15428) #b00000000000000001111111111111111) (= (mask!5175 lt!15428) #b00000000000000011111111111111111) (= (mask!5175 lt!15428) #b00000000000000111111111111111111) (= (mask!5175 lt!15428) #b00000000000001111111111111111111) (= (mask!5175 lt!15428) #b00000000000011111111111111111111) (= (mask!5175 lt!15428) #b00000000000111111111111111111111) (= (mask!5175 lt!15428) #b00000000001111111111111111111111) (= (mask!5175 lt!15428) #b00000000011111111111111111111111) (= (mask!5175 lt!15428) #b00000000111111111111111111111111) (= (mask!5175 lt!15428) #b00000001111111111111111111111111) (= (mask!5175 lt!15428) #b00000011111111111111111111111111) (= (mask!5175 lt!15428) #b00000111111111111111111111111111) (= (mask!5175 lt!15428) #b00001111111111111111111111111111) (= (mask!5175 lt!15428) #b00011111111111111111111111111111) (= (mask!5175 lt!15428) #b00111111111111111111111111111111)) (bvsle (mask!5175 lt!15428) #b00111111111111111111111111111111)))))

(assert (=> d!7055 d!7109))

(declare-fun b!40749 () Bool)

(declare-fun e!25837 () (_ BitVec 32))

(declare-fun call!3206 () (_ BitVec 32))

(assert (=> b!40749 (= e!25837 call!3206)))

(declare-fun b!40750 () Bool)

(declare-fun e!25836 () (_ BitVec 32))

(assert (=> b!40750 (= e!25836 e!25837)))

(declare-fun c!5019 () Bool)

(assert (=> b!40750 (= c!5019 (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40751 () Bool)

(assert (=> b!40751 (= e!25836 #b00000000000000000000000000000000)))

(declare-fun bm!3203 () Bool)

(assert (=> bm!3203 (= call!3206 (arrayCountValidKeys!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!40752 () Bool)

(assert (=> b!40752 (= e!25837 (bvadd #b00000000000000000000000000000001 call!3206))))

(declare-fun d!7111 () Bool)

(declare-fun lt!15814 () (_ BitVec 32))

(assert (=> d!7111 (and (bvsge lt!15814 #b00000000000000000000000000000000) (bvsle lt!15814 (bvsub (size!1363 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!7111 (= lt!15814 e!25836)))

(declare-fun c!5020 () Bool)

(assert (=> d!7111 (= c!5020 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7111 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1363 lt!15423)))))

(assert (=> d!7111 (= (arrayCountValidKeys!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15814)))

(assert (= (and d!7111 c!5020) b!40751))

(assert (= (and d!7111 (not c!5020)) b!40750))

(assert (= (and b!40750 c!5019) b!40752))

(assert (= (and b!40750 (not c!5019)) b!40749))

(assert (= (or b!40752 b!40749) bm!3203))

(declare-fun m!33637 () Bool)

(assert (=> b!40750 m!33637))

(assert (=> b!40750 m!33637))

(declare-fun m!33639 () Bool)

(assert (=> b!40750 m!33639))

(declare-fun m!33641 () Bool)

(assert (=> bm!3203 m!33641))

(assert (=> bm!3194 d!7111))

(assert (=> b!40670 d!7095))

(declare-fun d!7113 () Bool)

(assert (=> d!7113 (= (apply!55 (+!65 lt!15785 (tuple2!1489 lt!15777 (minValue!1721 lt!15428))) lt!15766) (get!704 (getValueByKey!99 (toList!542 (+!65 lt!15785 (tuple2!1489 lt!15777 (minValue!1721 lt!15428)))) lt!15766)))))

(declare-fun bs!1718 () Bool)

(assert (= bs!1718 d!7113))

(declare-fun m!33643 () Bool)

(assert (=> bs!1718 m!33643))

(assert (=> bs!1718 m!33643))

(declare-fun m!33645 () Bool)

(assert (=> bs!1718 m!33645))

(assert (=> b!40667 d!7113))

(declare-fun d!7115 () Bool)

(assert (=> d!7115 (= (apply!55 (+!65 lt!15784 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428))) lt!15781) (apply!55 lt!15784 lt!15781))))

(declare-fun lt!15817 () Unit!986)

(declare-fun choose!249 (ListLongMap!1053 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!986)

(assert (=> d!7115 (= lt!15817 (choose!249 lt!15784 lt!15772 (zeroValue!1721 lt!15428) lt!15781))))

(declare-fun e!25840 () Bool)

(assert (=> d!7115 e!25840))

(declare-fun res!24298 () Bool)

(assert (=> d!7115 (=> (not res!24298) (not e!25840))))

(assert (=> d!7115 (= res!24298 (contains!512 lt!15784 lt!15781))))

(assert (=> d!7115 (= (addApplyDifferent!32 lt!15784 lt!15772 (zeroValue!1721 lt!15428) lt!15781) lt!15817)))

(declare-fun b!40756 () Bool)

(assert (=> b!40756 (= e!25840 (not (= lt!15781 lt!15772)))))

(assert (= (and d!7115 res!24298) b!40756))

(assert (=> d!7115 m!33525))

(assert (=> d!7115 m!33527))

(assert (=> d!7115 m!33531))

(assert (=> d!7115 m!33525))

(declare-fun m!33647 () Bool)

(assert (=> d!7115 m!33647))

(declare-fun m!33649 () Bool)

(assert (=> d!7115 m!33649))

(assert (=> b!40667 d!7115))

(declare-fun d!7117 () Bool)

(declare-fun e!25843 () Bool)

(assert (=> d!7117 e!25843))

(declare-fun res!24303 () Bool)

(assert (=> d!7117 (=> (not res!24303) (not e!25843))))

(declare-fun lt!15826 () ListLongMap!1053)

(assert (=> d!7117 (= res!24303 (contains!512 lt!15826 (_1!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428)))))))

(declare-fun lt!15827 () List!1045)

(assert (=> d!7117 (= lt!15826 (ListLongMap!1054 lt!15827))))

(declare-fun lt!15828 () Unit!986)

(declare-fun lt!15829 () Unit!986)

(assert (=> d!7117 (= lt!15828 lt!15829)))

(assert (=> d!7117 (= (getValueByKey!99 lt!15827 (_1!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!26 (List!1045 (_ BitVec 64) V!2097) Unit!986)

(assert (=> d!7117 (= lt!15829 (lemmaContainsTupThenGetReturnValue!26 lt!15827 (_1!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428))) (_2!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428)))))))

(declare-fun insertStrictlySorted!23 (List!1045 (_ BitVec 64) V!2097) List!1045)

(assert (=> d!7117 (= lt!15827 (insertStrictlySorted!23 (toList!542 lt!15785) (_1!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428))) (_2!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428)))))))

(assert (=> d!7117 (= (+!65 lt!15785 (tuple2!1489 lt!15777 (minValue!1721 lt!15428))) lt!15826)))

(declare-fun b!40761 () Bool)

(declare-fun res!24304 () Bool)

(assert (=> b!40761 (=> (not res!24304) (not e!25843))))

(assert (=> b!40761 (= res!24304 (= (getValueByKey!99 (toList!542 lt!15826) (_1!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 lt!15777 (minValue!1721 lt!15428))))))))

(declare-fun b!40762 () Bool)

(declare-fun contains!515 (List!1045 tuple2!1488) Bool)

(assert (=> b!40762 (= e!25843 (contains!515 (toList!542 lt!15826) (tuple2!1489 lt!15777 (minValue!1721 lt!15428))))))

(assert (= (and d!7117 res!24303) b!40761))

(assert (= (and b!40761 res!24304) b!40762))

(declare-fun m!33651 () Bool)

(assert (=> d!7117 m!33651))

(declare-fun m!33653 () Bool)

(assert (=> d!7117 m!33653))

(declare-fun m!33655 () Bool)

(assert (=> d!7117 m!33655))

(declare-fun m!33657 () Bool)

(assert (=> d!7117 m!33657))

(declare-fun m!33659 () Bool)

(assert (=> b!40761 m!33659))

(declare-fun m!33661 () Bool)

(assert (=> b!40762 m!33661))

(assert (=> b!40667 d!7117))

(declare-fun d!7119 () Bool)

(assert (=> d!7119 (= (apply!55 lt!15785 lt!15766) (get!704 (getValueByKey!99 (toList!542 lt!15785) lt!15766)))))

(declare-fun bs!1719 () Bool)

(assert (= bs!1719 d!7119))

(declare-fun m!33663 () Bool)

(assert (=> bs!1719 m!33663))

(assert (=> bs!1719 m!33663))

(declare-fun m!33665 () Bool)

(assert (=> bs!1719 m!33665))

(assert (=> b!40667 d!7119))

(declare-fun d!7121 () Bool)

(assert (=> d!7121 (= (apply!55 lt!15780 lt!15768) (get!704 (getValueByKey!99 (toList!542 lt!15780) lt!15768)))))

(declare-fun bs!1720 () Bool)

(assert (= bs!1720 d!7121))

(declare-fun m!33667 () Bool)

(assert (=> bs!1720 m!33667))

(assert (=> bs!1720 m!33667))

(declare-fun m!33669 () Bool)

(assert (=> bs!1720 m!33669))

(assert (=> b!40667 d!7121))

(declare-fun d!7123 () Bool)

(declare-fun e!25844 () Bool)

(assert (=> d!7123 e!25844))

(declare-fun res!24305 () Bool)

(assert (=> d!7123 (=> (not res!24305) (not e!25844))))

(declare-fun lt!15830 () ListLongMap!1053)

(assert (=> d!7123 (= res!24305 (contains!512 lt!15830 (_1!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))))))

(declare-fun lt!15831 () List!1045)

(assert (=> d!7123 (= lt!15830 (ListLongMap!1054 lt!15831))))

(declare-fun lt!15832 () Unit!986)

(declare-fun lt!15833 () Unit!986)

(assert (=> d!7123 (= lt!15832 lt!15833)))

(assert (=> d!7123 (= (getValueByKey!99 lt!15831 (_1!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))))))

(assert (=> d!7123 (= lt!15833 (lemmaContainsTupThenGetReturnValue!26 lt!15831 (_1!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428))) (_2!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))))))

(assert (=> d!7123 (= lt!15831 (insertStrictlySorted!23 (toList!542 lt!15782) (_1!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428))) (_2!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))))))

(assert (=> d!7123 (= (+!65 lt!15782 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428))) lt!15830)))

(declare-fun b!40763 () Bool)

(declare-fun res!24306 () Bool)

(assert (=> b!40763 (=> (not res!24306) (not e!25844))))

(assert (=> b!40763 (= res!24306 (= (getValueByKey!99 (toList!542 lt!15830) (_1!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428))))))))

(declare-fun b!40764 () Bool)

(assert (=> b!40764 (= e!25844 (contains!515 (toList!542 lt!15830) (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428))))))

(assert (= (and d!7123 res!24305) b!40763))

(assert (= (and b!40763 res!24306) b!40764))

(declare-fun m!33671 () Bool)

(assert (=> d!7123 m!33671))

(declare-fun m!33673 () Bool)

(assert (=> d!7123 m!33673))

(declare-fun m!33675 () Bool)

(assert (=> d!7123 m!33675))

(declare-fun m!33677 () Bool)

(assert (=> d!7123 m!33677))

(declare-fun m!33679 () Bool)

(assert (=> b!40763 m!33679))

(declare-fun m!33681 () Bool)

(assert (=> b!40764 m!33681))

(assert (=> b!40667 d!7123))

(declare-fun b!40789 () Bool)

(declare-fun e!25859 () Bool)

(declare-fun e!25861 () Bool)

(assert (=> b!40789 (= e!25859 e!25861)))

(declare-fun c!5031 () Bool)

(assert (=> b!40789 (= c!5031 (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(declare-fun d!7125 () Bool)

(declare-fun e!25863 () Bool)

(assert (=> d!7125 e!25863))

(declare-fun res!24315 () Bool)

(assert (=> d!7125 (=> (not res!24315) (not e!25863))))

(declare-fun lt!15853 () ListLongMap!1053)

(assert (=> d!7125 (= res!24315 (not (contains!512 lt!15853 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!25860 () ListLongMap!1053)

(assert (=> d!7125 (= lt!15853 e!25860)))

(declare-fun c!5030 () Bool)

(assert (=> d!7125 (= c!5030 (bvsge #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7125 (validMask!0 (mask!5175 lt!15428))))

(assert (=> d!7125 (= (getCurrentListMapNoExtraKeys!34 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15428)) lt!15853)))

(declare-fun b!40790 () Bool)

(assert (=> b!40790 (= e!25861 (= lt!15853 (getCurrentListMapNoExtraKeys!34 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1803 lt!15428))))))

(declare-fun b!40791 () Bool)

(declare-fun e!25862 () Bool)

(assert (=> b!40791 (= e!25859 e!25862)))

(assert (=> b!40791 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(declare-fun res!24316 () Bool)

(assert (=> b!40791 (= res!24316 (contains!512 lt!15853 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (=> b!40791 (=> (not res!24316) (not e!25862))))

(declare-fun bm!3206 () Bool)

(declare-fun call!3209 () ListLongMap!1053)

(assert (=> bm!3206 (= call!3209 (getCurrentListMapNoExtraKeys!34 (_keys!3291 lt!15428) (_values!1786 lt!15428) (mask!5175 lt!15428) (extraKeys!1694 lt!15428) (zeroValue!1721 lt!15428) (minValue!1721 lt!15428) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1803 lt!15428)))))

(declare-fun b!40792 () Bool)

(assert (=> b!40792 (= e!25863 e!25859)))

(declare-fun c!5032 () Bool)

(declare-fun e!25864 () Bool)

(assert (=> b!40792 (= c!5032 e!25864)))

(declare-fun res!24317 () Bool)

(assert (=> b!40792 (=> (not res!24317) (not e!25864))))

(assert (=> b!40792 (= res!24317 (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(declare-fun b!40793 () Bool)

(assert (=> b!40793 (= e!25864 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (=> b!40793 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!40794 () Bool)

(declare-fun res!24318 () Bool)

(assert (=> b!40794 (=> (not res!24318) (not e!25863))))

(assert (=> b!40794 (= res!24318 (not (contains!512 lt!15853 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!40795 () Bool)

(assert (=> b!40795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1363 (_keys!3291 lt!15428))))))

(assert (=> b!40795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1364 (_values!1786 lt!15428))))))

(assert (=> b!40795 (= e!25862 (= (apply!55 lt!15853 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)) (get!701 (select (arr!1227 (_values!1786 lt!15428)) #b00000000000000000000000000000000) (dynLambda!189 (defaultEntry!1803 lt!15428) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!40796 () Bool)

(declare-fun e!25865 () ListLongMap!1053)

(assert (=> b!40796 (= e!25865 call!3209)))

(declare-fun b!40797 () Bool)

(assert (=> b!40797 (= e!25860 (ListLongMap!1054 Nil!1042))))

(declare-fun b!40798 () Bool)

(declare-fun lt!15848 () Unit!986)

(declare-fun lt!15850 () Unit!986)

(assert (=> b!40798 (= lt!15848 lt!15850)))

(declare-fun lt!15849 () ListLongMap!1053)

(declare-fun lt!15852 () V!2097)

(declare-fun lt!15851 () (_ BitVec 64))

(declare-fun lt!15854 () (_ BitVec 64))

(assert (=> b!40798 (not (contains!512 (+!65 lt!15849 (tuple2!1489 lt!15854 lt!15852)) lt!15851))))

(declare-fun addStillNotContains!7 (ListLongMap!1053 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!986)

(assert (=> b!40798 (= lt!15850 (addStillNotContains!7 lt!15849 lt!15854 lt!15852 lt!15851))))

(assert (=> b!40798 (= lt!15851 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!40798 (= lt!15852 (get!701 (select (arr!1227 (_values!1786 lt!15428)) #b00000000000000000000000000000000) (dynLambda!189 (defaultEntry!1803 lt!15428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!40798 (= lt!15854 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000))))

(assert (=> b!40798 (= lt!15849 call!3209)))

(assert (=> b!40798 (= e!25865 (+!65 call!3209 (tuple2!1489 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) (get!701 (select (arr!1227 (_values!1786 lt!15428)) #b00000000000000000000000000000000) (dynLambda!189 (defaultEntry!1803 lt!15428) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!40799 () Bool)

(declare-fun isEmpty!235 (ListLongMap!1053) Bool)

(assert (=> b!40799 (= e!25861 (isEmpty!235 lt!15853))))

(declare-fun b!40800 () Bool)

(assert (=> b!40800 (= e!25860 e!25865)))

(declare-fun c!5029 () Bool)

(assert (=> b!40800 (= c!5029 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (= (and d!7125 c!5030) b!40797))

(assert (= (and d!7125 (not c!5030)) b!40800))

(assert (= (and b!40800 c!5029) b!40798))

(assert (= (and b!40800 (not c!5029)) b!40796))

(assert (= (or b!40798 b!40796) bm!3206))

(assert (= (and d!7125 res!24315) b!40794))

(assert (= (and b!40794 res!24318) b!40792))

(assert (= (and b!40792 res!24317) b!40793))

(assert (= (and b!40792 c!5032) b!40791))

(assert (= (and b!40792 (not c!5032)) b!40789))

(assert (= (and b!40791 res!24316) b!40795))

(assert (= (and b!40789 c!5031) b!40790))

(assert (= (and b!40789 (not c!5031)) b!40799))

(declare-fun b_lambda!2079 () Bool)

(assert (=> (not b_lambda!2079) (not b!40795)))

(assert (=> b!40795 t!3912))

(declare-fun b_and!2377 () Bool)

(assert (= b_and!2375 (and (=> t!3912 result!1451) b_and!2377)))

(declare-fun b_lambda!2081 () Bool)

(assert (=> (not b_lambda!2081) (not b!40798)))

(assert (=> b!40798 t!3912))

(declare-fun b_and!2379 () Bool)

(assert (= b_and!2377 (and (=> t!3912 result!1451) b_and!2379)))

(assert (=> b!40795 m!33463))

(assert (=> b!40795 m!33349))

(assert (=> b!40795 m!33349))

(declare-fun m!33687 () Bool)

(assert (=> b!40795 m!33687))

(assert (=> b!40795 m!33473))

(assert (=> b!40795 m!33473))

(assert (=> b!40795 m!33463))

(assert (=> b!40795 m!33477))

(assert (=> b!40798 m!33463))

(assert (=> b!40798 m!33349))

(declare-fun m!33689 () Bool)

(assert (=> b!40798 m!33689))

(declare-fun m!33691 () Bool)

(assert (=> b!40798 m!33691))

(assert (=> b!40798 m!33473))

(assert (=> b!40798 m!33691))

(declare-fun m!33693 () Bool)

(assert (=> b!40798 m!33693))

(assert (=> b!40798 m!33473))

(assert (=> b!40798 m!33463))

(assert (=> b!40798 m!33477))

(declare-fun m!33695 () Bool)

(assert (=> b!40798 m!33695))

(assert (=> b!40793 m!33349))

(assert (=> b!40793 m!33349))

(assert (=> b!40793 m!33353))

(declare-fun m!33697 () Bool)

(assert (=> bm!3206 m!33697))

(assert (=> b!40790 m!33697))

(declare-fun m!33699 () Bool)

(assert (=> d!7125 m!33699))

(assert (=> d!7125 m!33271))

(assert (=> b!40800 m!33349))

(assert (=> b!40800 m!33349))

(assert (=> b!40800 m!33353))

(assert (=> b!40791 m!33349))

(assert (=> b!40791 m!33349))

(declare-fun m!33703 () Bool)

(assert (=> b!40791 m!33703))

(declare-fun m!33705 () Bool)

(assert (=> b!40799 m!33705))

(declare-fun m!33707 () Bool)

(assert (=> b!40794 m!33707))

(assert (=> b!40667 d!7125))

(declare-fun d!7133 () Bool)

(assert (=> d!7133 (contains!512 (+!65 lt!15782 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428))) lt!15783)))

(declare-fun lt!15859 () Unit!986)

(declare-fun choose!250 (ListLongMap!1053 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!986)

(assert (=> d!7133 (= lt!15859 (choose!250 lt!15782 lt!15765 (zeroValue!1721 lt!15428) lt!15783))))

(assert (=> d!7133 (contains!512 lt!15782 lt!15783)))

(assert (=> d!7133 (= (addStillContains!32 lt!15782 lt!15765 (zeroValue!1721 lt!15428) lt!15783) lt!15859)))

(declare-fun bs!1722 () Bool)

(assert (= bs!1722 d!7133))

(assert (=> bs!1722 m!33511))

(assert (=> bs!1722 m!33511))

(assert (=> bs!1722 m!33513))

(declare-fun m!33715 () Bool)

(assert (=> bs!1722 m!33715))

(declare-fun m!33717 () Bool)

(assert (=> bs!1722 m!33717))

(assert (=> b!40667 d!7133))

(declare-fun d!7137 () Bool)

(declare-fun e!25870 () Bool)

(assert (=> d!7137 e!25870))

(declare-fun res!24322 () Bool)

(assert (=> d!7137 (=> (not res!24322) (not e!25870))))

(declare-fun lt!15861 () ListLongMap!1053)

(assert (=> d!7137 (= res!24322 (contains!512 lt!15861 (_1!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428)))))))

(declare-fun lt!15862 () List!1045)

(assert (=> d!7137 (= lt!15861 (ListLongMap!1054 lt!15862))))

(declare-fun lt!15863 () Unit!986)

(declare-fun lt!15864 () Unit!986)

(assert (=> d!7137 (= lt!15863 lt!15864)))

(assert (=> d!7137 (= (getValueByKey!99 lt!15862 (_1!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428)))))))

(assert (=> d!7137 (= lt!15864 (lemmaContainsTupThenGetReturnValue!26 lt!15862 (_1!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428))) (_2!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428)))))))

(assert (=> d!7137 (= lt!15862 (insertStrictlySorted!23 (toList!542 lt!15780) (_1!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428))) (_2!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428)))))))

(assert (=> d!7137 (= (+!65 lt!15780 (tuple2!1489 lt!15770 (minValue!1721 lt!15428))) lt!15861)))

(declare-fun b!40808 () Bool)

(declare-fun res!24323 () Bool)

(assert (=> b!40808 (=> (not res!24323) (not e!25870))))

(assert (=> b!40808 (= res!24323 (= (getValueByKey!99 (toList!542 lt!15861) (_1!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 lt!15770 (minValue!1721 lt!15428))))))))

(declare-fun b!40809 () Bool)

(assert (=> b!40809 (= e!25870 (contains!515 (toList!542 lt!15861) (tuple2!1489 lt!15770 (minValue!1721 lt!15428))))))

(assert (= (and d!7137 res!24322) b!40808))

(assert (= (and b!40808 res!24323) b!40809))

(declare-fun m!33723 () Bool)

(assert (=> d!7137 m!33723))

(declare-fun m!33725 () Bool)

(assert (=> d!7137 m!33725))

(declare-fun m!33727 () Bool)

(assert (=> d!7137 m!33727))

(declare-fun m!33729 () Bool)

(assert (=> d!7137 m!33729))

(declare-fun m!33731 () Bool)

(assert (=> b!40808 m!33731))

(declare-fun m!33733 () Bool)

(assert (=> b!40809 m!33733))

(assert (=> b!40667 d!7137))

(declare-fun d!7141 () Bool)

(assert (=> d!7141 (= (apply!55 (+!65 lt!15780 (tuple2!1489 lt!15770 (minValue!1721 lt!15428))) lt!15768) (apply!55 lt!15780 lt!15768))))

(declare-fun lt!15865 () Unit!986)

(assert (=> d!7141 (= lt!15865 (choose!249 lt!15780 lt!15770 (minValue!1721 lt!15428) lt!15768))))

(declare-fun e!25871 () Bool)

(assert (=> d!7141 e!25871))

(declare-fun res!24324 () Bool)

(assert (=> d!7141 (=> (not res!24324) (not e!25871))))

(assert (=> d!7141 (= res!24324 (contains!512 lt!15780 lt!15768))))

(assert (=> d!7141 (= (addApplyDifferent!32 lt!15780 lt!15770 (minValue!1721 lt!15428) lt!15768) lt!15865)))

(declare-fun b!40810 () Bool)

(assert (=> b!40810 (= e!25871 (not (= lt!15768 lt!15770)))))

(assert (= (and d!7141 res!24324) b!40810))

(assert (=> d!7141 m!33491))

(assert (=> d!7141 m!33493))

(assert (=> d!7141 m!33521))

(assert (=> d!7141 m!33491))

(declare-fun m!33735 () Bool)

(assert (=> d!7141 m!33735))

(declare-fun m!33737 () Bool)

(assert (=> d!7141 m!33737))

(assert (=> b!40667 d!7141))

(declare-fun d!7143 () Bool)

(assert (=> d!7143 (= (apply!55 (+!65 lt!15785 (tuple2!1489 lt!15777 (minValue!1721 lt!15428))) lt!15766) (apply!55 lt!15785 lt!15766))))

(declare-fun lt!15866 () Unit!986)

(assert (=> d!7143 (= lt!15866 (choose!249 lt!15785 lt!15777 (minValue!1721 lt!15428) lt!15766))))

(declare-fun e!25872 () Bool)

(assert (=> d!7143 e!25872))

(declare-fun res!24325 () Bool)

(assert (=> d!7143 (=> (not res!24325) (not e!25872))))

(assert (=> d!7143 (= res!24325 (contains!512 lt!15785 lt!15766))))

(assert (=> d!7143 (= (addApplyDifferent!32 lt!15785 lt!15777 (minValue!1721 lt!15428) lt!15766) lt!15866)))

(declare-fun b!40811 () Bool)

(assert (=> b!40811 (= e!25872 (not (= lt!15766 lt!15777)))))

(assert (= (and d!7143 res!24325) b!40811))

(assert (=> d!7143 m!33497))

(assert (=> d!7143 m!33499))

(assert (=> d!7143 m!33535))

(assert (=> d!7143 m!33497))

(declare-fun m!33739 () Bool)

(assert (=> d!7143 m!33739))

(declare-fun m!33741 () Bool)

(assert (=> d!7143 m!33741))

(assert (=> b!40667 d!7143))

(declare-fun d!7145 () Bool)

(assert (=> d!7145 (= (apply!55 lt!15784 lt!15781) (get!704 (getValueByKey!99 (toList!542 lt!15784) lt!15781)))))

(declare-fun bs!1724 () Bool)

(assert (= bs!1724 d!7145))

(declare-fun m!33743 () Bool)

(assert (=> bs!1724 m!33743))

(assert (=> bs!1724 m!33743))

(declare-fun m!33745 () Bool)

(assert (=> bs!1724 m!33745))

(assert (=> b!40667 d!7145))

(declare-fun d!7147 () Bool)

(assert (=> d!7147 (= (apply!55 (+!65 lt!15780 (tuple2!1489 lt!15770 (minValue!1721 lt!15428))) lt!15768) (get!704 (getValueByKey!99 (toList!542 (+!65 lt!15780 (tuple2!1489 lt!15770 (minValue!1721 lt!15428)))) lt!15768)))))

(declare-fun bs!1725 () Bool)

(assert (= bs!1725 d!7147))

(declare-fun m!33747 () Bool)

(assert (=> bs!1725 m!33747))

(assert (=> bs!1725 m!33747))

(declare-fun m!33749 () Bool)

(assert (=> bs!1725 m!33749))

(assert (=> b!40667 d!7147))

(declare-fun d!7149 () Bool)

(assert (=> d!7149 (= (apply!55 (+!65 lt!15784 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428))) lt!15781) (get!704 (getValueByKey!99 (toList!542 (+!65 lt!15784 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428)))) lt!15781)))))

(declare-fun bs!1726 () Bool)

(assert (= bs!1726 d!7149))

(declare-fun m!33751 () Bool)

(assert (=> bs!1726 m!33751))

(assert (=> bs!1726 m!33751))

(declare-fun m!33753 () Bool)

(assert (=> bs!1726 m!33753))

(assert (=> b!40667 d!7149))

(declare-fun d!7151 () Bool)

(declare-fun e!25873 () Bool)

(assert (=> d!7151 e!25873))

(declare-fun res!24326 () Bool)

(assert (=> d!7151 (=> res!24326 e!25873)))

(declare-fun lt!15868 () Bool)

(assert (=> d!7151 (= res!24326 (not lt!15868))))

(declare-fun lt!15870 () Bool)

(assert (=> d!7151 (= lt!15868 lt!15870)))

(declare-fun lt!15867 () Unit!986)

(declare-fun e!25874 () Unit!986)

(assert (=> d!7151 (= lt!15867 e!25874)))

(declare-fun c!5034 () Bool)

(assert (=> d!7151 (= c!5034 lt!15870)))

(assert (=> d!7151 (= lt!15870 (containsKey!68 (toList!542 (+!65 lt!15782 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))) lt!15783))))

(assert (=> d!7151 (= (contains!512 (+!65 lt!15782 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428))) lt!15783) lt!15868)))

(declare-fun b!40812 () Bool)

(declare-fun lt!15869 () Unit!986)

(assert (=> b!40812 (= e!25874 lt!15869)))

(assert (=> b!40812 (= lt!15869 (lemmaContainsKeyImpliesGetValueByKeyDefined!56 (toList!542 (+!65 lt!15782 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))) lt!15783))))

(assert (=> b!40812 (isDefined!57 (getValueByKey!99 (toList!542 (+!65 lt!15782 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))) lt!15783))))

(declare-fun b!40813 () Bool)

(declare-fun Unit!996 () Unit!986)

(assert (=> b!40813 (= e!25874 Unit!996)))

(declare-fun b!40814 () Bool)

(assert (=> b!40814 (= e!25873 (isDefined!57 (getValueByKey!99 (toList!542 (+!65 lt!15782 (tuple2!1489 lt!15765 (zeroValue!1721 lt!15428)))) lt!15783)))))

(assert (= (and d!7151 c!5034) b!40812))

(assert (= (and d!7151 (not c!5034)) b!40813))

(assert (= (and d!7151 (not res!24326)) b!40814))

(declare-fun m!33755 () Bool)

(assert (=> d!7151 m!33755))

(declare-fun m!33757 () Bool)

(assert (=> b!40812 m!33757))

(declare-fun m!33759 () Bool)

(assert (=> b!40812 m!33759))

(assert (=> b!40812 m!33759))

(declare-fun m!33761 () Bool)

(assert (=> b!40812 m!33761))

(assert (=> b!40814 m!33759))

(assert (=> b!40814 m!33759))

(assert (=> b!40814 m!33761))

(assert (=> b!40667 d!7151))

(declare-fun d!7153 () Bool)

(declare-fun e!25877 () Bool)

(assert (=> d!7153 e!25877))

(declare-fun res!24329 () Bool)

(assert (=> d!7153 (=> (not res!24329) (not e!25877))))

(declare-fun lt!15871 () ListLongMap!1053)

(assert (=> d!7153 (= res!24329 (contains!512 lt!15871 (_1!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428)))))))

(declare-fun lt!15872 () List!1045)

(assert (=> d!7153 (= lt!15871 (ListLongMap!1054 lt!15872))))

(declare-fun lt!15873 () Unit!986)

(declare-fun lt!15874 () Unit!986)

(assert (=> d!7153 (= lt!15873 lt!15874)))

(assert (=> d!7153 (= (getValueByKey!99 lt!15872 (_1!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428)))))))

(assert (=> d!7153 (= lt!15874 (lemmaContainsTupThenGetReturnValue!26 lt!15872 (_1!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428))) (_2!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428)))))))

(assert (=> d!7153 (= lt!15872 (insertStrictlySorted!23 (toList!542 lt!15784) (_1!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428))) (_2!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428)))))))

(assert (=> d!7153 (= (+!65 lt!15784 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428))) lt!15871)))

(declare-fun b!40818 () Bool)

(declare-fun res!24330 () Bool)

(assert (=> b!40818 (=> (not res!24330) (not e!25877))))

(assert (=> b!40818 (= res!24330 (= (getValueByKey!99 (toList!542 lt!15871) (_1!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428))))))))

(declare-fun b!40819 () Bool)

(assert (=> b!40819 (= e!25877 (contains!515 (toList!542 lt!15871) (tuple2!1489 lt!15772 (zeroValue!1721 lt!15428))))))

(assert (= (and d!7153 res!24329) b!40818))

(assert (= (and b!40818 res!24330) b!40819))

(declare-fun m!33763 () Bool)

(assert (=> d!7153 m!33763))

(declare-fun m!33765 () Bool)

(assert (=> d!7153 m!33765))

(declare-fun m!33767 () Bool)

(assert (=> d!7153 m!33767))

(declare-fun m!33769 () Bool)

(assert (=> d!7153 m!33769))

(declare-fun m!33771 () Bool)

(assert (=> b!40818 m!33771))

(declare-fun m!33773 () Bool)

(assert (=> b!40819 m!33773))

(assert (=> b!40667 d!7153))

(declare-fun d!7155 () Bool)

(declare-fun res!24331 () Bool)

(declare-fun e!25878 () Bool)

(assert (=> d!7155 (=> res!24331 e!25878)))

(assert (=> d!7155 (= res!24331 (= (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15525))))

(assert (=> d!7155 (= (arrayContainsKey!0 lt!15423 lt!15525 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25878)))

(declare-fun b!40820 () Bool)

(declare-fun e!25879 () Bool)

(assert (=> b!40820 (= e!25878 e!25879)))

(declare-fun res!24332 () Bool)

(assert (=> b!40820 (=> (not res!24332) (not e!25879))))

(assert (=> b!40820 (= res!24332 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1363 lt!15423)))))

(declare-fun b!40821 () Bool)

(assert (=> b!40821 (= e!25879 (arrayContainsKey!0 lt!15423 lt!15525 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!7155 (not res!24331)) b!40820))

(assert (= (and b!40820 res!24332) b!40821))

(assert (=> d!7155 m!33275))

(declare-fun m!33775 () Bool)

(assert (=> b!40821 m!33775))

(assert (=> b!40387 d!7155))

(declare-fun d!7157 () Bool)

(declare-fun lt!15878 () Bool)

(assert (=> d!7157 (= lt!15878 (select (content!32 Nil!1043) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun e!25881 () Bool)

(assert (=> d!7157 (= lt!15878 e!25881)))

(declare-fun res!24335 () Bool)

(assert (=> d!7157 (=> (not res!24335) (not e!25881))))

(assert (=> d!7157 (= res!24335 ((_ is Cons!1042) Nil!1043))))

(assert (=> d!7157 (= (contains!509 Nil!1043 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)) lt!15878)))

(declare-fun b!40823 () Bool)

(declare-fun e!25882 () Bool)

(assert (=> b!40823 (= e!25881 e!25882)))

(declare-fun res!24334 () Bool)

(assert (=> b!40823 (=> res!24334 e!25882)))

(assert (=> b!40823 (= res!24334 (= (h!1616 Nil!1043) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun b!40824 () Bool)

(assert (=> b!40824 (= e!25882 (contains!509 (t!3898 Nil!1043) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (= (and d!7157 res!24335) b!40823))

(assert (= (and b!40823 (not res!24334)) b!40824))

(assert (=> d!7157 m!33383))

(assert (=> d!7157 m!33349))

(declare-fun m!33781 () Bool)

(assert (=> d!7157 m!33781))

(assert (=> b!40824 m!33349))

(declare-fun m!33783 () Bool)

(assert (=> b!40824 m!33783))

(assert (=> b!40452 d!7157))

(assert (=> b!40453 d!7095))

(declare-fun d!7161 () Bool)

(declare-fun e!25883 () Bool)

(assert (=> d!7161 e!25883))

(declare-fun res!24336 () Bool)

(assert (=> d!7161 (=> (not res!24336) (not e!25883))))

(declare-fun lt!15879 () ListLongMap!1053)

(assert (=> d!7161 (= res!24336 (contains!512 lt!15879 (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))))))

(declare-fun lt!15880 () List!1045)

(assert (=> d!7161 (= lt!15879 (ListLongMap!1054 lt!15880))))

(declare-fun lt!15881 () Unit!986)

(declare-fun lt!15882 () Unit!986)

(assert (=> d!7161 (= lt!15881 lt!15882)))

(assert (=> d!7161 (= (getValueByKey!99 lt!15880 (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))) (Some!104 (_2!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))))))

(assert (=> d!7161 (= lt!15882 (lemmaContainsTupThenGetReturnValue!26 lt!15880 (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))) (_2!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))))))

(assert (=> d!7161 (= lt!15880 (insertStrictlySorted!23 (toList!542 (ite c!4996 call!3190 (ite c!4997 call!3193 call!3188))) (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))) (_2!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))))))

(assert (=> d!7161 (= (+!65 (ite c!4996 call!3190 (ite c!4997 call!3193 call!3188)) (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))) lt!15879)))

(declare-fun b!40825 () Bool)

(declare-fun res!24337 () Bool)

(assert (=> b!40825 (=> (not res!24337) (not e!25883))))

(assert (=> b!40825 (= res!24337 (= (getValueByKey!99 (toList!542 lt!15879) (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))) (Some!104 (_2!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))))))))

(declare-fun b!40826 () Bool)

(assert (=> b!40826 (= e!25883 (contains!515 (toList!542 lt!15879) (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15428)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))))))

(assert (= (and d!7161 res!24336) b!40825))

(assert (= (and b!40825 res!24337) b!40826))

(declare-fun m!33789 () Bool)

(assert (=> d!7161 m!33789))

(declare-fun m!33791 () Bool)

(assert (=> d!7161 m!33791))

(declare-fun m!33793 () Bool)

(assert (=> d!7161 m!33793))

(declare-fun m!33795 () Bool)

(assert (=> d!7161 m!33795))

(declare-fun m!33797 () Bool)

(assert (=> b!40825 m!33797))

(declare-fun m!33799 () Bool)

(assert (=> b!40826 m!33799))

(assert (=> bm!3190 d!7161))

(declare-fun d!7165 () Bool)

(declare-fun e!25884 () Bool)

(assert (=> d!7165 e!25884))

(declare-fun res!24338 () Bool)

(assert (=> d!7165 (=> res!24338 e!25884)))

(declare-fun lt!15884 () Bool)

(assert (=> d!7165 (= res!24338 (not lt!15884))))

(declare-fun lt!15886 () Bool)

(assert (=> d!7165 (= lt!15884 lt!15886)))

(declare-fun lt!15883 () Unit!986)

(declare-fun e!25885 () Unit!986)

(assert (=> d!7165 (= lt!15883 e!25885)))

(declare-fun c!5035 () Bool)

(assert (=> d!7165 (= c!5035 lt!15886)))

(assert (=> d!7165 (= lt!15886 (containsKey!68 (toList!542 lt!15786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7165 (= (contains!512 lt!15786 #b0000000000000000000000000000000000000000000000000000000000000000) lt!15884)))

(declare-fun b!40827 () Bool)

(declare-fun lt!15885 () Unit!986)

(assert (=> b!40827 (= e!25885 lt!15885)))

(assert (=> b!40827 (= lt!15885 (lemmaContainsKeyImpliesGetValueByKeyDefined!56 (toList!542 lt!15786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40827 (isDefined!57 (getValueByKey!99 (toList!542 lt!15786) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40828 () Bool)

(declare-fun Unit!997 () Unit!986)

(assert (=> b!40828 (= e!25885 Unit!997)))

(declare-fun b!40829 () Bool)

(assert (=> b!40829 (= e!25884 (isDefined!57 (getValueByKey!99 (toList!542 lt!15786) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7165 c!5035) b!40827))

(assert (= (and d!7165 (not c!5035)) b!40828))

(assert (= (and d!7165 (not res!24338)) b!40829))

(declare-fun m!33801 () Bool)

(assert (=> d!7165 m!33801))

(declare-fun m!33803 () Bool)

(assert (=> b!40827 m!33803))

(assert (=> b!40827 m!33631))

(assert (=> b!40827 m!33631))

(declare-fun m!33805 () Bool)

(assert (=> b!40827 m!33805))

(assert (=> b!40829 m!33631))

(assert (=> b!40829 m!33631))

(assert (=> b!40829 m!33805))

(assert (=> bm!3185 d!7165))

(assert (=> b!40715 d!7095))

(declare-fun b!40830 () Bool)

(declare-fun e!25886 () Bool)

(assert (=> b!40830 (= e!25886 (contains!509 (ite c!4907 (Cons!1042 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40831 () Bool)

(declare-fun e!25889 () Bool)

(declare-fun e!25888 () Bool)

(assert (=> b!40831 (= e!25889 e!25888)))

(declare-fun c!5036 () Bool)

(assert (=> b!40831 (= c!5036 (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40832 () Bool)

(declare-fun call!3211 () Bool)

(assert (=> b!40832 (= e!25888 call!3211)))

(declare-fun b!40833 () Bool)

(declare-fun e!25887 () Bool)

(assert (=> b!40833 (= e!25887 e!25889)))

(declare-fun res!24341 () Bool)

(assert (=> b!40833 (=> (not res!24341) (not e!25889))))

(assert (=> b!40833 (= res!24341 (not e!25886))))

(declare-fun res!24339 () Bool)

(assert (=> b!40833 (=> (not res!24339) (not e!25886))))

(assert (=> b!40833 (= res!24339 (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3208 () Bool)

(assert (=> bm!3208 (= call!3211 (arrayNoDuplicates!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5036 (Cons!1042 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4907 (Cons!1042 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043))) (ite c!4907 (Cons!1042 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)))))))

(declare-fun b!40834 () Bool)

(assert (=> b!40834 (= e!25888 call!3211)))

(declare-fun d!7167 () Bool)

(declare-fun res!24340 () Bool)

(assert (=> d!7167 (=> res!24340 e!25887)))

(assert (=> d!7167 (= res!24340 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1363 lt!15423)))))

(assert (=> d!7167 (= (arrayNoDuplicates!0 lt!15423 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4907 (Cons!1042 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043))) e!25887)))

(assert (= (and d!7167 (not res!24340)) b!40833))

(assert (= (and b!40833 res!24339) b!40830))

(assert (= (and b!40833 res!24341) b!40831))

(assert (= (and b!40831 c!5036) b!40832))

(assert (= (and b!40831 (not c!5036)) b!40834))

(assert (= (or b!40832 b!40834) bm!3208))

(assert (=> b!40830 m!33637))

(assert (=> b!40830 m!33637))

(declare-fun m!33807 () Bool)

(assert (=> b!40830 m!33807))

(assert (=> b!40831 m!33637))

(assert (=> b!40831 m!33637))

(assert (=> b!40831 m!33639))

(assert (=> b!40833 m!33637))

(assert (=> b!40833 m!33637))

(assert (=> b!40833 m!33639))

(assert (=> bm!3208 m!33637))

(declare-fun m!33809 () Bool)

(assert (=> bm!3208 m!33809))

(assert (=> bm!3122 d!7167))

(declare-fun b!40835 () Bool)

(declare-fun e!25890 () Bool)

(declare-fun e!25891 () Bool)

(assert (=> b!40835 (= e!25890 e!25891)))

(declare-fun lt!15887 () (_ BitVec 64))

(assert (=> b!40835 (= lt!15887 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!15888 () Unit!986)

(assert (=> b!40835 (= lt!15888 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15423 lt!15887 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!40835 (arrayContainsKey!0 lt!15423 lt!15887 #b00000000000000000000000000000000)))

(declare-fun lt!15889 () Unit!986)

(assert (=> b!40835 (= lt!15889 lt!15888)))

(declare-fun res!24343 () Bool)

(assert (=> b!40835 (= res!24343 (= (seekEntryOrOpen!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!15423 mask!853) (Found!179 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!40835 (=> (not res!24343) (not e!25891))))

(declare-fun b!40836 () Bool)

(declare-fun call!3212 () Bool)

(assert (=> b!40836 (= e!25890 call!3212)))

(declare-fun b!40837 () Bool)

(declare-fun e!25892 () Bool)

(assert (=> b!40837 (= e!25892 e!25890)))

(declare-fun c!5037 () Bool)

(assert (=> b!40837 (= c!5037 (validKeyInArray!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!7169 () Bool)

(declare-fun res!24342 () Bool)

(assert (=> d!7169 (=> res!24342 e!25892)))

(assert (=> d!7169 (= res!24342 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1363 lt!15423)))))

(assert (=> d!7169 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15423 mask!853) e!25892)))

(declare-fun b!40838 () Bool)

(assert (=> b!40838 (= e!25891 call!3212)))

(declare-fun bm!3209 () Bool)

(assert (=> bm!3209 (= call!3212 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15423 mask!853))))

(assert (= (and d!7169 (not res!24342)) b!40837))

(assert (= (and b!40837 c!5037) b!40835))

(assert (= (and b!40837 (not c!5037)) b!40836))

(assert (= (and b!40835 res!24343) b!40838))

(assert (= (or b!40838 b!40836) bm!3209))

(assert (=> b!40835 m!33637))

(declare-fun m!33811 () Bool)

(assert (=> b!40835 m!33811))

(declare-fun m!33813 () Bool)

(assert (=> b!40835 m!33813))

(assert (=> b!40835 m!33637))

(declare-fun m!33815 () Bool)

(assert (=> b!40835 m!33815))

(assert (=> b!40837 m!33637))

(assert (=> b!40837 m!33637))

(assert (=> b!40837 m!33639))

(declare-fun m!33817 () Bool)

(assert (=> bm!3209 m!33817))

(assert (=> bm!3197 d!7169))

(assert (=> d!7041 d!6979))

(declare-fun b!40839 () Bool)

(declare-fun e!25893 () Bool)

(declare-fun e!25894 () Bool)

(assert (=> b!40839 (= e!25893 e!25894)))

(declare-fun lt!15890 () (_ BitVec 64))

(assert (=> b!40839 (= lt!15890 (select (arr!1226 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15891 () Unit!986)

(assert (=> b!40839 (= lt!15891 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3291 lt!15428) lt!15890 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40839 (arrayContainsKey!0 (_keys!3291 lt!15428) lt!15890 #b00000000000000000000000000000000)))

(declare-fun lt!15892 () Unit!986)

(assert (=> b!40839 (= lt!15892 lt!15891)))

(declare-fun res!24345 () Bool)

(assert (=> b!40839 (= res!24345 (= (seekEntryOrOpen!0 (select (arr!1226 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3291 lt!15428) (mask!5175 lt!15428)) (Found!179 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40839 (=> (not res!24345) (not e!25894))))

(declare-fun b!40840 () Bool)

(declare-fun call!3213 () Bool)

(assert (=> b!40840 (= e!25893 call!3213)))

(declare-fun b!40841 () Bool)

(declare-fun e!25895 () Bool)

(assert (=> b!40841 (= e!25895 e!25893)))

(declare-fun c!5038 () Bool)

(assert (=> b!40841 (= c!5038 (validKeyInArray!0 (select (arr!1226 (_keys!3291 lt!15428)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7171 () Bool)

(declare-fun res!24344 () Bool)

(assert (=> d!7171 (=> res!24344 e!25895)))

(assert (=> d!7171 (= res!24344 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 (_keys!3291 lt!15428))))))

(assert (=> d!7171 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3291 lt!15428) (mask!5175 lt!15428)) e!25895)))

(declare-fun b!40842 () Bool)

(assert (=> b!40842 (= e!25894 call!3213)))

(declare-fun bm!3210 () Bool)

(assert (=> bm!3210 (= call!3213 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3291 lt!15428) (mask!5175 lt!15428)))))

(assert (= (and d!7171 (not res!24344)) b!40841))

(assert (= (and b!40841 c!5038) b!40839))

(assert (= (and b!40841 (not c!5038)) b!40840))

(assert (= (and b!40839 res!24345) b!40842))

(assert (= (or b!40842 b!40840) bm!3210))

(assert (=> b!40839 m!33605))

(declare-fun m!33819 () Bool)

(assert (=> b!40839 m!33819))

(declare-fun m!33821 () Bool)

(assert (=> b!40839 m!33821))

(assert (=> b!40839 m!33605))

(declare-fun m!33823 () Bool)

(assert (=> b!40839 m!33823))

(assert (=> b!40841 m!33605))

(assert (=> b!40841 m!33605))

(assert (=> b!40841 m!33609))

(declare-fun m!33825 () Bool)

(assert (=> bm!3210 m!33825))

(assert (=> bm!3199 d!7171))

(assert (=> b!40366 d!7097))

(declare-fun d!7173 () Bool)

(assert (=> d!7173 (arrayContainsKey!0 lt!15423 lt!15792 #b00000000000000000000000000000000)))

(declare-fun lt!15894 () Unit!986)

(assert (=> d!7173 (= lt!15894 (choose!13 lt!15423 lt!15792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!7173 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!7173 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15423 lt!15792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15894)))

(declare-fun bs!1728 () Bool)

(assert (= bs!1728 d!7173))

(assert (=> bs!1728 m!33577))

(declare-fun m!33827 () Bool)

(assert (=> bs!1728 m!33827))

(assert (=> b!40696 d!7173))

(declare-fun d!7175 () Bool)

(declare-fun res!24350 () Bool)

(declare-fun e!25898 () Bool)

(assert (=> d!7175 (=> res!24350 e!25898)))

(assert (=> d!7175 (= res!24350 (= (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15792))))

(assert (=> d!7175 (= (arrayContainsKey!0 lt!15423 lt!15792 #b00000000000000000000000000000000) e!25898)))

(declare-fun b!40846 () Bool)

(declare-fun e!25899 () Bool)

(assert (=> b!40846 (= e!25898 e!25899)))

(declare-fun res!24351 () Bool)

(assert (=> b!40846 (=> (not res!24351) (not e!25899))))

(assert (=> b!40846 (= res!24351 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 lt!15423)))))

(declare-fun b!40848 () Bool)

(assert (=> b!40848 (= e!25899 (arrayContainsKey!0 lt!15423 lt!15792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7175 (not res!24350)) b!40846))

(assert (= (and b!40846 res!24351) b!40848))

(assert (=> d!7175 m!33169))

(declare-fun m!33829 () Bool)

(assert (=> b!40848 m!33829))

(assert (=> b!40696 d!7175))

(declare-fun b!40849 () Bool)

(declare-fun e!25900 () SeekEntryResult!179)

(declare-fun lt!15903 () SeekEntryResult!179)

(assert (=> b!40849 (= e!25900 (MissingZero!179 (index!2840 lt!15903)))))

(declare-fun b!40850 () Bool)

(assert (=> b!40850 (= e!25900 (seekKeyOrZeroReturnVacant!0 (x!7725 lt!15903) (index!2840 lt!15903) (index!2840 lt!15903) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15423 mask!853))))

(declare-fun d!7177 () Bool)

(declare-fun lt!15902 () SeekEntryResult!179)

(assert (=> d!7177 (and (or ((_ is Undefined!179) lt!15902) (not ((_ is Found!179) lt!15902)) (and (bvsge (index!2839 lt!15902) #b00000000000000000000000000000000) (bvslt (index!2839 lt!15902) (size!1363 lt!15423)))) (or ((_ is Undefined!179) lt!15902) ((_ is Found!179) lt!15902) (not ((_ is MissingZero!179) lt!15902)) (and (bvsge (index!2838 lt!15902) #b00000000000000000000000000000000) (bvslt (index!2838 lt!15902) (size!1363 lt!15423)))) (or ((_ is Undefined!179) lt!15902) ((_ is Found!179) lt!15902) ((_ is MissingZero!179) lt!15902) (not ((_ is MissingVacant!179) lt!15902)) (and (bvsge (index!2841 lt!15902) #b00000000000000000000000000000000) (bvslt (index!2841 lt!15902) (size!1363 lt!15423)))) (or ((_ is Undefined!179) lt!15902) (ite ((_ is Found!179) lt!15902) (= (select (arr!1226 lt!15423) (index!2839 lt!15902)) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!179) lt!15902) (= (select (arr!1226 lt!15423) (index!2838 lt!15902)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!179) lt!15902) (= (select (arr!1226 lt!15423) (index!2841 lt!15902)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25902 () SeekEntryResult!179)

(assert (=> d!7177 (= lt!15902 e!25902)))

(declare-fun c!5040 () Bool)

(assert (=> d!7177 (= c!5040 (and ((_ is Intermediate!179) lt!15903) (undefined!991 lt!15903)))))

(assert (=> d!7177 (= lt!15903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15423 mask!853))))

(assert (=> d!7177 (validMask!0 mask!853)))

(assert (=> d!7177 (= (seekEntryOrOpen!0 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15423 mask!853) lt!15902)))

(declare-fun b!40851 () Bool)

(declare-fun c!5041 () Bool)

(declare-fun lt!15904 () (_ BitVec 64))

(assert (=> b!40851 (= c!5041 (= lt!15904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25901 () SeekEntryResult!179)

(assert (=> b!40851 (= e!25901 e!25900)))

(declare-fun b!40852 () Bool)

(assert (=> b!40852 (= e!25902 Undefined!179)))

(declare-fun b!40853 () Bool)

(assert (=> b!40853 (= e!25901 (Found!179 (index!2840 lt!15903)))))

(declare-fun b!40854 () Bool)

(assert (=> b!40854 (= e!25902 e!25901)))

(assert (=> b!40854 (= lt!15904 (select (arr!1226 lt!15423) (index!2840 lt!15903)))))

(declare-fun c!5039 () Bool)

(assert (=> b!40854 (= c!5039 (= lt!15904 (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7177 c!5040) b!40852))

(assert (= (and d!7177 (not c!5040)) b!40854))

(assert (= (and b!40854 c!5039) b!40853))

(assert (= (and b!40854 (not c!5039)) b!40851))

(assert (= (and b!40851 c!5041) b!40849))

(assert (= (and b!40851 (not c!5041)) b!40850))

(assert (=> b!40850 m!33275))

(declare-fun m!33831 () Bool)

(assert (=> b!40850 m!33831))

(assert (=> d!7177 m!33275))

(declare-fun m!33833 () Bool)

(assert (=> d!7177 m!33833))

(assert (=> d!7177 m!33083))

(assert (=> d!7177 m!33833))

(assert (=> d!7177 m!33275))

(declare-fun m!33835 () Bool)

(assert (=> d!7177 m!33835))

(declare-fun m!33837 () Bool)

(assert (=> d!7177 m!33837))

(declare-fun m!33839 () Bool)

(assert (=> d!7177 m!33839))

(declare-fun m!33841 () Bool)

(assert (=> d!7177 m!33841))

(declare-fun m!33843 () Bool)

(assert (=> b!40854 m!33843))

(assert (=> b!40696 d!7177))

(declare-fun d!7179 () Bool)

(declare-fun e!25903 () Bool)

(assert (=> d!7179 e!25903))

(declare-fun res!24352 () Bool)

(assert (=> d!7179 (=> res!24352 e!25903)))

(declare-fun lt!15906 () Bool)

(assert (=> d!7179 (= res!24352 (not lt!15906))))

(declare-fun lt!15908 () Bool)

(assert (=> d!7179 (= lt!15906 lt!15908)))

(declare-fun lt!15905 () Unit!986)

(declare-fun e!25904 () Unit!986)

(assert (=> d!7179 (= lt!15905 e!25904)))

(declare-fun c!5042 () Bool)

(assert (=> d!7179 (= c!5042 lt!15908)))

(assert (=> d!7179 (= lt!15908 (containsKey!68 (toList!542 lt!15786) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (=> d!7179 (= (contains!512 lt!15786 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)) lt!15906)))

(declare-fun b!40855 () Bool)

(declare-fun lt!15907 () Unit!986)

(assert (=> b!40855 (= e!25904 lt!15907)))

(assert (=> b!40855 (= lt!15907 (lemmaContainsKeyImpliesGetValueByKeyDefined!56 (toList!542 lt!15786) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (=> b!40855 (isDefined!57 (getValueByKey!99 (toList!542 lt!15786) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(declare-fun b!40856 () Bool)

(declare-fun Unit!999 () Unit!986)

(assert (=> b!40856 (= e!25904 Unit!999)))

(declare-fun b!40857 () Bool)

(assert (=> b!40857 (= e!25903 (isDefined!57 (getValueByKey!99 (toList!542 lt!15786) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000))))))

(assert (= (and d!7179 c!5042) b!40855))

(assert (= (and d!7179 (not c!5042)) b!40856))

(assert (= (and d!7179 (not res!24352)) b!40857))

(assert (=> d!7179 m!33349))

(declare-fun m!33845 () Bool)

(assert (=> d!7179 m!33845))

(assert (=> b!40855 m!33349))

(declare-fun m!33847 () Bool)

(assert (=> b!40855 m!33847))

(assert (=> b!40855 m!33349))

(assert (=> b!40855 m!33617))

(assert (=> b!40855 m!33617))

(declare-fun m!33849 () Bool)

(assert (=> b!40855 m!33849))

(assert (=> b!40857 m!33349))

(assert (=> b!40857 m!33617))

(assert (=> b!40857 m!33617))

(assert (=> b!40857 m!33849))

(assert (=> b!40663 d!7179))

(declare-fun d!7181 () Bool)

(assert (=> d!7181 (arrayContainsKey!0 (_keys!3291 lt!15428) lt!15795 #b00000000000000000000000000000000)))

(declare-fun lt!15913 () Unit!986)

(assert (=> d!7181 (= lt!15913 (choose!13 (_keys!3291 lt!15428) lt!15795 #b00000000000000000000000000000000))))

(assert (=> d!7181 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7181 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3291 lt!15428) lt!15795 #b00000000000000000000000000000000) lt!15913)))

(declare-fun bs!1729 () Bool)

(assert (= bs!1729 d!7181))

(assert (=> bs!1729 m!33589))

(declare-fun m!33863 () Bool)

(assert (=> bs!1729 m!33863))

(assert (=> b!40713 d!7181))

(declare-fun d!7185 () Bool)

(declare-fun res!24356 () Bool)

(declare-fun e!25907 () Bool)

(assert (=> d!7185 (=> res!24356 e!25907)))

(assert (=> d!7185 (= res!24356 (= (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) lt!15795))))

(assert (=> d!7185 (= (arrayContainsKey!0 (_keys!3291 lt!15428) lt!15795 #b00000000000000000000000000000000) e!25907)))

(declare-fun b!40861 () Bool)

(declare-fun e!25908 () Bool)

(assert (=> b!40861 (= e!25907 e!25908)))

(declare-fun res!24357 () Bool)

(assert (=> b!40861 (=> (not res!24357) (not e!25908))))

(assert (=> b!40861 (= res!24357 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1363 (_keys!3291 lt!15428))))))

(declare-fun b!40862 () Bool)

(assert (=> b!40862 (= e!25908 (arrayContainsKey!0 (_keys!3291 lt!15428) lt!15795 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7185 (not res!24356)) b!40861))

(assert (= (and b!40861 res!24357) b!40862))

(assert (=> d!7185 m!33349))

(declare-fun m!33869 () Bool)

(assert (=> b!40862 m!33869))

(assert (=> b!40713 d!7185))

(declare-fun b!40865 () Bool)

(declare-fun e!25910 () SeekEntryResult!179)

(declare-fun lt!15920 () SeekEntryResult!179)

(assert (=> b!40865 (= e!25910 (MissingZero!179 (index!2840 lt!15920)))))

(declare-fun b!40866 () Bool)

(assert (=> b!40866 (= e!25910 (seekKeyOrZeroReturnVacant!0 (x!7725 lt!15920) (index!2840 lt!15920) (index!2840 lt!15920) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) (_keys!3291 lt!15428) (mask!5175 lt!15428)))))

(declare-fun d!7189 () Bool)

(declare-fun lt!15919 () SeekEntryResult!179)

(assert (=> d!7189 (and (or ((_ is Undefined!179) lt!15919) (not ((_ is Found!179) lt!15919)) (and (bvsge (index!2839 lt!15919) #b00000000000000000000000000000000) (bvslt (index!2839 lt!15919) (size!1363 (_keys!3291 lt!15428))))) (or ((_ is Undefined!179) lt!15919) ((_ is Found!179) lt!15919) (not ((_ is MissingZero!179) lt!15919)) (and (bvsge (index!2838 lt!15919) #b00000000000000000000000000000000) (bvslt (index!2838 lt!15919) (size!1363 (_keys!3291 lt!15428))))) (or ((_ is Undefined!179) lt!15919) ((_ is Found!179) lt!15919) ((_ is MissingZero!179) lt!15919) (not ((_ is MissingVacant!179) lt!15919)) (and (bvsge (index!2841 lt!15919) #b00000000000000000000000000000000) (bvslt (index!2841 lt!15919) (size!1363 (_keys!3291 lt!15428))))) (or ((_ is Undefined!179) lt!15919) (ite ((_ is Found!179) lt!15919) (= (select (arr!1226 (_keys!3291 lt!15428)) (index!2839 lt!15919)) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!179) lt!15919) (= (select (arr!1226 (_keys!3291 lt!15428)) (index!2838 lt!15919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!179) lt!15919) (= (select (arr!1226 (_keys!3291 lt!15428)) (index!2841 lt!15919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25912 () SeekEntryResult!179)

(assert (=> d!7189 (= lt!15919 e!25912)))

(declare-fun c!5044 () Bool)

(assert (=> d!7189 (= c!5044 (and ((_ is Intermediate!179) lt!15920) (undefined!991 lt!15920)))))

(assert (=> d!7189 (= lt!15920 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) (mask!5175 lt!15428)) (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) (_keys!3291 lt!15428) (mask!5175 lt!15428)))))

(assert (=> d!7189 (validMask!0 (mask!5175 lt!15428))))

(assert (=> d!7189 (= (seekEntryOrOpen!0 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000) (_keys!3291 lt!15428) (mask!5175 lt!15428)) lt!15919)))

(declare-fun b!40867 () Bool)

(declare-fun c!5045 () Bool)

(declare-fun lt!15921 () (_ BitVec 64))

(assert (=> b!40867 (= c!5045 (= lt!15921 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25911 () SeekEntryResult!179)

(assert (=> b!40867 (= e!25911 e!25910)))

(declare-fun b!40868 () Bool)

(assert (=> b!40868 (= e!25912 Undefined!179)))

(declare-fun b!40869 () Bool)

(assert (=> b!40869 (= e!25911 (Found!179 (index!2840 lt!15920)))))

(declare-fun b!40870 () Bool)

(assert (=> b!40870 (= e!25912 e!25911)))

(assert (=> b!40870 (= lt!15921 (select (arr!1226 (_keys!3291 lt!15428)) (index!2840 lt!15920)))))

(declare-fun c!5043 () Bool)

(assert (=> b!40870 (= c!5043 (= lt!15921 (select (arr!1226 (_keys!3291 lt!15428)) #b00000000000000000000000000000000)))))

(assert (= (and d!7189 c!5044) b!40868))

(assert (= (and d!7189 (not c!5044)) b!40870))

(assert (= (and b!40870 c!5043) b!40869))

(assert (= (and b!40870 (not c!5043)) b!40867))

(assert (= (and b!40867 c!5045) b!40865))

(assert (= (and b!40867 (not c!5045)) b!40866))

(assert (=> b!40866 m!33349))

(declare-fun m!33883 () Bool)

(assert (=> b!40866 m!33883))

(assert (=> d!7189 m!33349))

(declare-fun m!33885 () Bool)

(assert (=> d!7189 m!33885))

(assert (=> d!7189 m!33271))

(assert (=> d!7189 m!33885))

(assert (=> d!7189 m!33349))

(declare-fun m!33889 () Bool)

(assert (=> d!7189 m!33889))

(declare-fun m!33893 () Bool)

(assert (=> d!7189 m!33893))

(declare-fun m!33895 () Bool)

(assert (=> d!7189 m!33895))

(declare-fun m!33897 () Bool)

(assert (=> d!7189 m!33897))

(declare-fun m!33899 () Bool)

(assert (=> b!40870 m!33899))

(assert (=> b!40713 d!7189))

(assert (=> d!7035 d!6967))

(declare-fun d!7195 () Bool)

(assert (not d!7195))

(assert (=> b!40480 d!7195))

(assert (=> b!40368 d!7097))

(assert (=> b!40698 d!7097))

(assert (=> d!6997 d!7109))

(assert (=> d!7077 d!6955))

(declare-fun d!7199 () Bool)

(declare-fun lt!15922 () Bool)

(assert (=> d!7199 (= lt!15922 (select (content!32 (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!25913 () Bool)

(assert (=> d!7199 (= lt!15922 e!25913)))

(declare-fun res!24361 () Bool)

(assert (=> d!7199 (=> (not res!24361) (not e!25913))))

(assert (=> d!7199 (= res!24361 ((_ is Cons!1042) (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)))))

(assert (=> d!7199 (= (contains!509 (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!15922)))

(declare-fun b!40871 () Bool)

(declare-fun e!25914 () Bool)

(assert (=> b!40871 (= e!25913 e!25914)))

(declare-fun res!24360 () Bool)

(assert (=> b!40871 (=> res!24360 e!25914)))

(assert (=> b!40871 (= res!24360 (= (h!1616 (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40872 () Bool)

(assert (=> b!40872 (= e!25914 (contains!509 (t!3898 (ite c!4894 (Cons!1042 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) Nil!1043) Nil!1043)) (select (arr!1226 lt!15423) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7199 res!24361) b!40871))

(assert (= (and b!40871 (not res!24360)) b!40872))

(declare-fun m!33909 () Bool)

(assert (=> d!7199 m!33909))

(assert (=> d!7199 m!33275))

(declare-fun m!33911 () Bool)

(assert (=> d!7199 m!33911))

(assert (=> b!40872 m!33275))

(declare-fun m!33913 () Bool)

(assert (=> b!40872 m!33913))

(assert (=> b!40365 d!7199))

(declare-fun d!7203 () Bool)

(declare-fun e!25915 () Bool)

(assert (=> d!7203 e!25915))

(declare-fun res!24362 () Bool)

(assert (=> d!7203 (=> (not res!24362) (not e!25915))))

(declare-fun lt!15923 () ListLongMap!1053)

(assert (=> d!7203 (= res!24362 (contains!512 lt!15923 (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))))))

(declare-fun lt!15924 () List!1045)

(assert (=> d!7203 (= lt!15923 (ListLongMap!1054 lt!15924))))

(declare-fun lt!15925 () Unit!986)

(declare-fun lt!15926 () Unit!986)

(assert (=> d!7203 (= lt!15925 lt!15926)))

(assert (=> d!7203 (= (getValueByKey!99 lt!15924 (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))))))

(assert (=> d!7203 (= lt!15926 (lemmaContainsTupThenGetReturnValue!26 lt!15924 (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))) (_2!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))))))

(assert (=> d!7203 (= lt!15924 (insertStrictlySorted!23 (toList!542 call!3192) (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))) (_2!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))))))

(assert (=> d!7203 (= (+!65 call!3192 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))) lt!15923)))

(declare-fun b!40873 () Bool)

(declare-fun res!24363 () Bool)

(assert (=> b!40873 (=> (not res!24363) (not e!25915))))

(assert (=> b!40873 (= res!24363 (= (getValueByKey!99 (toList!542 lt!15923) (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428)))) (Some!104 (_2!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))))))

(declare-fun b!40874 () Bool)

(assert (=> b!40874 (= e!25915 (contains!515 (toList!542 lt!15923) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15428))))))

(assert (= (and d!7203 res!24362) b!40873))

(assert (= (and b!40873 res!24363) b!40874))

(declare-fun m!33915 () Bool)

(assert (=> d!7203 m!33915))

(declare-fun m!33917 () Bool)

(assert (=> d!7203 m!33917))

(declare-fun m!33919 () Bool)

(assert (=> d!7203 m!33919))

(declare-fun m!33921 () Bool)

(assert (=> d!7203 m!33921))

(declare-fun m!33923 () Bool)

(assert (=> b!40873 m!33923))

(declare-fun m!33925 () Bool)

(assert (=> b!40874 m!33925))

(assert (=> b!40661 d!7203))

(declare-fun d!7205 () Bool)

(assert (=> d!7205 (= (size!1382 lt!15428) (bvadd (_size!168 lt!15428) (bvsdiv (bvadd (extraKeys!1694 lt!15428) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!40362 d!7205))

(assert (=> b!40363 d!7205))

(declare-fun d!7207 () Bool)

(assert (=> d!7207 (= (content!32 Nil!1043) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!7049 d!7207))

(assert (=> bm!3187 d!7125))

(declare-fun b!40907 () Bool)

(declare-fun lt!15953 () SeekEntryResult!179)

(assert (=> b!40907 (and (bvsge (index!2840 lt!15953) #b00000000000000000000000000000000) (bvslt (index!2840 lt!15953) (size!1363 lt!15423)))))

(declare-fun res!24380 () Bool)

(assert (=> b!40907 (= res!24380 (= (select (arr!1226 lt!15423) (index!2840 lt!15953)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25936 () Bool)

(assert (=> b!40907 (=> res!24380 e!25936)))

(declare-fun b!40908 () Bool)

(declare-fun e!25935 () SeekEntryResult!179)

(assert (=> b!40908 (= e!25935 (Intermediate!179 true (toIndex!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!40909 () Bool)

(declare-fun e!25938 () SeekEntryResult!179)

(assert (=> b!40909 (= e!25935 e!25938)))

(declare-fun c!5056 () Bool)

(declare-fun lt!15952 () (_ BitVec 64))

(assert (=> b!40909 (= c!5056 (or (= lt!15952 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)) (= (bvadd lt!15952 lt!15952) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!7209 () Bool)

(declare-fun e!25937 () Bool)

(assert (=> d!7209 e!25937))

(declare-fun c!5055 () Bool)

(assert (=> d!7209 (= c!5055 (and ((_ is Intermediate!179) lt!15953) (undefined!991 lt!15953)))))

(assert (=> d!7209 (= lt!15953 e!25935)))

(declare-fun c!5057 () Bool)

(assert (=> d!7209 (= c!5057 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!7209 (= lt!15952 (select (arr!1226 lt!15423) (toIndex!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!7209 (validMask!0 mask!853)))

(assert (=> d!7209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) mask!853) (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15423 mask!853) lt!15953)))

(declare-fun b!40910 () Bool)

(assert (=> b!40910 (and (bvsge (index!2840 lt!15953) #b00000000000000000000000000000000) (bvslt (index!2840 lt!15953) (size!1363 lt!15423)))))

(declare-fun res!24378 () Bool)

(assert (=> b!40910 (= res!24378 (= (select (arr!1226 lt!15423) (index!2840 lt!15953)) (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(assert (=> b!40910 (=> res!24378 e!25936)))

(declare-fun e!25939 () Bool)

(assert (=> b!40910 (= e!25939 e!25936)))

(declare-fun b!40911 () Bool)

(assert (=> b!40911 (= e!25938 (Intermediate!179 false (toIndex!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!40912 () Bool)

(assert (=> b!40912 (= e!25937 e!25939)))

(declare-fun res!24379 () Bool)

(assert (=> b!40912 (= res!24379 (and ((_ is Intermediate!179) lt!15953) (not (undefined!991 lt!15953)) (bvslt (x!7725 lt!15953) #b01111111111111111111111111111110) (bvsge (x!7725 lt!15953) #b00000000000000000000000000000000) (bvsge (x!7725 lt!15953) #b00000000000000000000000000000000)))))

(assert (=> b!40912 (=> (not res!24379) (not e!25939))))

(declare-fun b!40913 () Bool)

(assert (=> b!40913 (and (bvsge (index!2840 lt!15953) #b00000000000000000000000000000000) (bvslt (index!2840 lt!15953) (size!1363 lt!15423)))))

(assert (=> b!40913 (= e!25936 (= (select (arr!1226 lt!15423) (index!2840 lt!15953)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40914 () Bool)

(assert (=> b!40914 (= e!25937 (bvsge (x!7725 lt!15953) #b01111111111111111111111111111110))))

(declare-fun b!40915 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40915 (= e!25938 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15423 mask!853))))

(assert (= (and d!7209 c!5057) b!40908))

(assert (= (and d!7209 (not c!5057)) b!40909))

(assert (= (and b!40909 c!5056) b!40911))

(assert (= (and b!40909 (not c!5056)) b!40915))

(assert (= (and d!7209 c!5055) b!40914))

(assert (= (and d!7209 (not c!5055)) b!40912))

(assert (= (and b!40912 res!24379) b!40910))

(assert (= (and b!40910 (not res!24378)) b!40907))

(assert (= (and b!40907 (not res!24380)) b!40913))

(declare-fun m!33971 () Bool)

(assert (=> b!40910 m!33971))

(assert (=> d!7209 m!33321))

(declare-fun m!33973 () Bool)

(assert (=> d!7209 m!33973))

(assert (=> d!7209 m!33083))

(assert (=> b!40907 m!33971))

(assert (=> b!40915 m!33321))

(declare-fun m!33975 () Bool)

(assert (=> b!40915 m!33975))

(assert (=> b!40915 m!33975))

(assert (=> b!40915 m!33169))

(declare-fun m!33977 () Bool)

(assert (=> b!40915 m!33977))

(assert (=> b!40913 m!33971))

(assert (=> d!7027 d!7209))

(declare-fun d!7223 () Bool)

(declare-fun lt!15959 () (_ BitVec 32))

(declare-fun lt!15958 () (_ BitVec 32))

(assert (=> d!7223 (= lt!15959 (bvmul (bvxor lt!15958 (bvlshr lt!15958 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!7223 (= lt!15958 ((_ extract 31 0) (bvand (bvxor (select (arr!1226 lt!15423) #b00000000000000000000000000000000) (bvlshr (select (arr!1226 lt!15423) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!7223 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!24381 (let ((h!1621 ((_ extract 31 0) (bvand (bvxor (select (arr!1226 lt!15423) #b00000000000000000000000000000000) (bvlshr (select (arr!1226 lt!15423) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7745 (bvmul (bvxor h!1621 (bvlshr h!1621 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7745 (bvlshr x!7745 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!24381 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!24381 #b00000000000000000000000000000000))))))

(assert (=> d!7223 (= (toIndex!0 (select (arr!1226 lt!15423) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15959 (bvlshr lt!15959 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!7027 d!7223))

(assert (=> d!7027 d!6941))

(declare-fun b!40952 () Bool)

(declare-fun e!25962 () SeekEntryResult!179)

(assert (=> b!40952 (= e!25962 (MissingVacant!179 (index!2840 lt!15569)))))

(declare-fun b!40953 () Bool)

(declare-fun c!5072 () Bool)

(declare-fun lt!15979 () (_ BitVec 64))

(assert (=> b!40953 (= c!5072 (= lt!15979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25961 () SeekEntryResult!179)

(assert (=> b!40953 (= e!25961 e!25962)))

(declare-fun b!40954 () Bool)

(declare-fun e!25960 () SeekEntryResult!179)

(assert (=> b!40954 (= e!25960 Undefined!179)))

(declare-fun d!7229 () Bool)

(declare-fun lt!15978 () SeekEntryResult!179)

(assert (=> d!7229 (and (or ((_ is Undefined!179) lt!15978) (not ((_ is Found!179) lt!15978)) (and (bvsge (index!2839 lt!15978) #b00000000000000000000000000000000) (bvslt (index!2839 lt!15978) (size!1363 lt!15423)))) (or ((_ is Undefined!179) lt!15978) ((_ is Found!179) lt!15978) (not ((_ is MissingVacant!179) lt!15978)) (not (= (index!2841 lt!15978) (index!2840 lt!15569))) (and (bvsge (index!2841 lt!15978) #b00000000000000000000000000000000) (bvslt (index!2841 lt!15978) (size!1363 lt!15423)))) (or ((_ is Undefined!179) lt!15978) (ite ((_ is Found!179) lt!15978) (= (select (arr!1226 lt!15423) (index!2839 lt!15978)) (select (arr!1226 lt!15423) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!179) lt!15978) (= (index!2841 lt!15978) (index!2840 lt!15569)) (= (select (arr!1226 lt!15423) (index!2841 lt!15978)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!7229 (= lt!15978 e!25960)))

(declare-fun c!5074 () Bool)

(assert (=> d!7229 (= c!5074 (bvsge (x!7725 lt!15569) #b01111111111111111111111111111110))))

(assert (=> d!7229 (= lt!15979 (select (arr!1226 lt!15423) (index!2840 lt!15569)))))

(assert (=> d!7229 (validMask!0 mask!853)))

(assert (=> d!7229 (= (seekKeyOrZeroReturnVacant!0 (x!7725 lt!15569) (index!2840 lt!15569) (index!2840 lt!15569) (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15423 mask!853) lt!15978)))

(declare-fun b!40955 () Bool)

(assert (=> b!40955 (= e!25960 e!25961)))

(declare-fun c!5073 () Bool)

(assert (=> b!40955 (= c!5073 (= lt!15979 (select (arr!1226 lt!15423) #b00000000000000000000000000000000)))))

(declare-fun b!40956 () Bool)

(assert (=> b!40956 (= e!25961 (Found!179 (index!2840 lt!15569)))))

(declare-fun b!40957 () Bool)

(assert (=> b!40957 (= e!25962 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7725 lt!15569) #b00000000000000000000000000000001) (nextIndex!0 (index!2840 lt!15569) (x!7725 lt!15569) mask!853) (index!2840 lt!15569) (select (arr!1226 lt!15423) #b00000000000000000000000000000000) lt!15423 mask!853))))

(assert (= (and d!7229 c!5074) b!40954))

(assert (= (and d!7229 (not c!5074)) b!40955))

(assert (= (and b!40955 c!5073) b!40956))

(assert (= (and b!40955 (not c!5073)) b!40953))

(assert (= (and b!40953 c!5072) b!40952))

(assert (= (and b!40953 (not c!5072)) b!40957))

(declare-fun m!33979 () Bool)

(assert (=> d!7229 m!33979))

(declare-fun m!33981 () Bool)

(assert (=> d!7229 m!33981))

(assert (=> d!7229 m!33341))

(assert (=> d!7229 m!33083))

(declare-fun m!33983 () Bool)

(assert (=> b!40957 m!33983))

(assert (=> b!40957 m!33983))

(assert (=> b!40957 m!33169))

(declare-fun m!33985 () Bool)

(assert (=> b!40957 m!33985))

(assert (=> b!40435 d!7229))

(declare-fun b_lambda!2083 () Bool)

(assert (= b_lambda!2077 (or (and start!5686 b_free!1363 (= defaultEntry!470 (defaultEntry!1803 lt!15428))) b_lambda!2083)))

(check-sat b_and!2379 (not b!40790) (not d!7093) (not b!40793) (not b!40744) (not d!7105) (not b!40957) (not b!40795) (not b_lambda!2079) tp_is_empty!1753 (not d!7181) (not d!7145) (not d!7199) (not d!7143) (not d!7113) (not b!40800) (not b!40746) (not b!40833) (not d!7103) (not d!7089) (not b!40866) (not d!7161) (not b!40725) (not bm!3208) (not b!40799) (not b!40814) (not d!7119) (not b!40841) (not b_lambda!2083) (not b!40855) (not b!40735) (not b!40734) (not d!7229) (not b!40827) (not d!7153) (not d!7115) (not d!7209) (not b!40761) (not b!40848) (not b!40915) (not b!40857) (not b!40818) (not b!40791) (not b!40763) (not b!40809) (not b!40826) (not b!40831) (not b!40850) (not b_next!1363) (not d!7157) (not bm!3203) (not b!40728) (not d!7165) (not bm!3210) (not d!7203) (not b_lambda!2071) (not d!7177) (not bm!3206) (not d!7189) (not d!7151) (not b!40762) (not d!7137) (not b!40874) (not d!7149) (not d!7117) (not b!40825) (not d!7125) (not b!40872) (not d!7147) (not b!40794) (not b!40726) (not b!40764) (not b!40862) (not d!7121) (not d!7123) (not b_lambda!2081) (not b!40835) (not b!40742) (not b!40829) (not b!40830) (not b!40798) (not d!7179) (not d!7141) (not bm!3209) (not d!7099) (not b!40837) (not b!40821) (not d!7133) (not bm!3201) (not d!7173) (not b!40812) (not b!40873) (not b!40839) (not b!40808) (not b!40819) (not b!40750) (not b!40824) (not bm!3202))
(check-sat b_and!2379 (not b_next!1363))
